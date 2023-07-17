// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: PoseWithCovariance.proto

#ifndef PROTOBUF_INCLUDED_PoseWithCovariance_2eproto
#define PROTOBUF_INCLUDED_PoseWithCovariance_2eproto

#include <string>

#include <google/protobuf/stubs/common.h>

#if GOOGLE_PROTOBUF_VERSION < 3006001
#error This file was generated by a newer version of protoc which is
#error incompatible with your Protocol Buffer headers.  Please update
#error your headers.
#endif
#if 3006001 < GOOGLE_PROTOBUF_MIN_PROTOC_VERSION
#error This file was generated by an older version of protoc which is
#error incompatible with your Protocol Buffer headers.  Please
#error regenerate this file with a newer version of protoc.
#endif

#include <google/protobuf/io/coded_stream.h>
#include <google/protobuf/arena.h>
#include <google/protobuf/arenastring.h>
#include <google/protobuf/generated_message_table_driven.h>
#include <google/protobuf/generated_message_util.h>
#include <google/protobuf/inlined_string_field.h>
#include <google/protobuf/metadata.h>
#include <google/protobuf/message.h>
#include <google/protobuf/repeated_field.h>  // IWYU pragma: export
#include <google/protobuf/extension_set.h>  // IWYU pragma: export
#include <google/protobuf/unknown_field_set.h>
#include "pose.pb.h"
// @@protoc_insertion_point(includes)
#define PROTOBUF_INTERNAL_EXPORT_protobuf_PoseWithCovariance_2eproto 

namespace protobuf_PoseWithCovariance_2eproto {
// Internal implementation detail -- do not use these members.
struct TableStruct {
  static const ::google::protobuf::internal::ParseTableField entries[];
  static const ::google::protobuf::internal::AuxillaryParseTableField aux[];
  static const ::google::protobuf::internal::ParseTable schema[1];
  static const ::google::protobuf::internal::FieldMetadata field_metadata[];
  static const ::google::protobuf::internal::SerializationTable serialization_table[];
  static const ::google::protobuf::uint32 offsets[];
};
void AddDescriptors();
}  // namespace protobuf_PoseWithCovariance_2eproto
namespace gz_geometry_msgs {
class PoseWithCovariance;
class PoseWithCovarianceDefaultTypeInternal;
extern PoseWithCovarianceDefaultTypeInternal _PoseWithCovariance_default_instance_;
}  // namespace gz_geometry_msgs
namespace google {
namespace protobuf {
template<> ::gz_geometry_msgs::PoseWithCovariance* Arena::CreateMaybeMessage<::gz_geometry_msgs::PoseWithCovariance>(Arena*);
}  // namespace protobuf
}  // namespace google
namespace gz_geometry_msgs {

// ===================================================================

class PoseWithCovariance : public ::google::protobuf::Message /* @@protoc_insertion_point(class_definition:gz_geometry_msgs.PoseWithCovariance) */ {
 public:
  PoseWithCovariance();
  virtual ~PoseWithCovariance();

  PoseWithCovariance(const PoseWithCovariance& from);

  inline PoseWithCovariance& operator=(const PoseWithCovariance& from) {
    CopyFrom(from);
    return *this;
  }
  #if LANG_CXX11
  PoseWithCovariance(PoseWithCovariance&& from) noexcept
    : PoseWithCovariance() {
    *this = ::std::move(from);
  }

  inline PoseWithCovariance& operator=(PoseWithCovariance&& from) noexcept {
    if (GetArenaNoVirtual() == from.GetArenaNoVirtual()) {
      if (this != &from) InternalSwap(&from);
    } else {
      CopyFrom(from);
    }
    return *this;
  }
  #endif
  inline const ::google::protobuf::UnknownFieldSet& unknown_fields() const {
    return _internal_metadata_.unknown_fields();
  }
  inline ::google::protobuf::UnknownFieldSet* mutable_unknown_fields() {
    return _internal_metadata_.mutable_unknown_fields();
  }

  static const ::google::protobuf::Descriptor* descriptor();
  static const PoseWithCovariance& default_instance();

  static void InitAsDefaultInstance();  // FOR INTERNAL USE ONLY
  static inline const PoseWithCovariance* internal_default_instance() {
    return reinterpret_cast<const PoseWithCovariance*>(
               &_PoseWithCovariance_default_instance_);
  }
  static constexpr int kIndexInFileMessages =
    0;

  void Swap(PoseWithCovariance* other);
  friend void swap(PoseWithCovariance& a, PoseWithCovariance& b) {
    a.Swap(&b);
  }

  // implements Message ----------------------------------------------

  inline PoseWithCovariance* New() const final {
    return CreateMaybeMessage<PoseWithCovariance>(NULL);
  }

  PoseWithCovariance* New(::google::protobuf::Arena* arena) const final {
    return CreateMaybeMessage<PoseWithCovariance>(arena);
  }
  void CopyFrom(const ::google::protobuf::Message& from) final;
  void MergeFrom(const ::google::protobuf::Message& from) final;
  void CopyFrom(const PoseWithCovariance& from);
  void MergeFrom(const PoseWithCovariance& from);
  void Clear() final;
  bool IsInitialized() const final;

  size_t ByteSizeLong() const final;
  bool MergePartialFromCodedStream(
      ::google::protobuf::io::CodedInputStream* input) final;
  void SerializeWithCachedSizes(
      ::google::protobuf::io::CodedOutputStream* output) const final;
  ::google::protobuf::uint8* InternalSerializeWithCachedSizesToArray(
      bool deterministic, ::google::protobuf::uint8* target) const final;
  int GetCachedSize() const final { return _cached_size_.Get(); }

  private:
  void SharedCtor();
  void SharedDtor();
  void SetCachedSize(int size) const final;
  void InternalSwap(PoseWithCovariance* other);
  private:
  inline ::google::protobuf::Arena* GetArenaNoVirtual() const {
    return NULL;
  }
  inline void* MaybeArenaPtr() const {
    return NULL;
  }
  public:

  ::google::protobuf::Metadata GetMetadata() const final;

  // nested types ----------------------------------------------------

  // accessors -------------------------------------------------------

  // repeated double covariance = 2 [packed = true];
  int covariance_size() const;
  void clear_covariance();
  static const int kCovarianceFieldNumber = 2;
  double covariance(int index) const;
  void set_covariance(int index, double value);
  void add_covariance(double value);
  const ::google::protobuf::RepeatedField< double >&
      covariance() const;
  ::google::protobuf::RepeatedField< double >*
      mutable_covariance();

  // required .gazebo.msgs.Pose pose = 1;
  bool has_pose() const;
  void clear_pose();
  static const int kPoseFieldNumber = 1;
  private:
  const ::gazebo::msgs::Pose& _internal_pose() const;
  public:
  const ::gazebo::msgs::Pose& pose() const;
  ::gazebo::msgs::Pose* release_pose();
  ::gazebo::msgs::Pose* mutable_pose();
  void set_allocated_pose(::gazebo::msgs::Pose* pose);

  // @@protoc_insertion_point(class_scope:gz_geometry_msgs.PoseWithCovariance)
 private:
  void set_has_pose();
  void clear_has_pose();

  ::google::protobuf::internal::InternalMetadataWithArena _internal_metadata_;
  ::google::protobuf::internal::HasBits<1> _has_bits_;
  mutable ::google::protobuf::internal::CachedSize _cached_size_;
  ::google::protobuf::RepeatedField< double > covariance_;
  mutable int _covariance_cached_byte_size_;
  ::gazebo::msgs::Pose* pose_;
  friend struct ::protobuf_PoseWithCovariance_2eproto::TableStruct;
};
// ===================================================================


// ===================================================================

#ifdef __GNUC__
  #pragma GCC diagnostic push
  #pragma GCC diagnostic ignored "-Wstrict-aliasing"
#endif  // __GNUC__
// PoseWithCovariance

// required .gazebo.msgs.Pose pose = 1;
inline bool PoseWithCovariance::has_pose() const {
  return (_has_bits_[0] & 0x00000001u) != 0;
}
inline void PoseWithCovariance::set_has_pose() {
  _has_bits_[0] |= 0x00000001u;
}
inline void PoseWithCovariance::clear_has_pose() {
  _has_bits_[0] &= ~0x00000001u;
}
inline const ::gazebo::msgs::Pose& PoseWithCovariance::_internal_pose() const {
  return *pose_;
}
inline const ::gazebo::msgs::Pose& PoseWithCovariance::pose() const {
  const ::gazebo::msgs::Pose* p = pose_;
  // @@protoc_insertion_point(field_get:gz_geometry_msgs.PoseWithCovariance.pose)
  return p != NULL ? *p : *reinterpret_cast<const ::gazebo::msgs::Pose*>(
      &::gazebo::msgs::_Pose_default_instance_);
}
inline ::gazebo::msgs::Pose* PoseWithCovariance::release_pose() {
  // @@protoc_insertion_point(field_release:gz_geometry_msgs.PoseWithCovariance.pose)
  clear_has_pose();
  ::gazebo::msgs::Pose* temp = pose_;
  pose_ = NULL;
  return temp;
}
inline ::gazebo::msgs::Pose* PoseWithCovariance::mutable_pose() {
  set_has_pose();
  if (pose_ == NULL) {
    auto* p = CreateMaybeMessage<::gazebo::msgs::Pose>(GetArenaNoVirtual());
    pose_ = p;
  }
  // @@protoc_insertion_point(field_mutable:gz_geometry_msgs.PoseWithCovariance.pose)
  return pose_;
}
inline void PoseWithCovariance::set_allocated_pose(::gazebo::msgs::Pose* pose) {
  ::google::protobuf::Arena* message_arena = GetArenaNoVirtual();
  if (message_arena == NULL) {
    delete reinterpret_cast< ::google::protobuf::MessageLite*>(pose_);
  }
  if (pose) {
    ::google::protobuf::Arena* submessage_arena = NULL;
    if (message_arena != submessage_arena) {
      pose = ::google::protobuf::internal::GetOwnedMessage(
          message_arena, pose, submessage_arena);
    }
    set_has_pose();
  } else {
    clear_has_pose();
  }
  pose_ = pose;
  // @@protoc_insertion_point(field_set_allocated:gz_geometry_msgs.PoseWithCovariance.pose)
}

// repeated double covariance = 2 [packed = true];
inline int PoseWithCovariance::covariance_size() const {
  return covariance_.size();
}
inline void PoseWithCovariance::clear_covariance() {
  covariance_.Clear();
}
inline double PoseWithCovariance::covariance(int index) const {
  // @@protoc_insertion_point(field_get:gz_geometry_msgs.PoseWithCovariance.covariance)
  return covariance_.Get(index);
}
inline void PoseWithCovariance::set_covariance(int index, double value) {
  covariance_.Set(index, value);
  // @@protoc_insertion_point(field_set:gz_geometry_msgs.PoseWithCovariance.covariance)
}
inline void PoseWithCovariance::add_covariance(double value) {
  covariance_.Add(value);
  // @@protoc_insertion_point(field_add:gz_geometry_msgs.PoseWithCovariance.covariance)
}
inline const ::google::protobuf::RepeatedField< double >&
PoseWithCovariance::covariance() const {
  // @@protoc_insertion_point(field_list:gz_geometry_msgs.PoseWithCovariance.covariance)
  return covariance_;
}
inline ::google::protobuf::RepeatedField< double >*
PoseWithCovariance::mutable_covariance() {
  // @@protoc_insertion_point(field_mutable_list:gz_geometry_msgs.PoseWithCovariance.covariance)
  return &covariance_;
}

#ifdef __GNUC__
  #pragma GCC diagnostic pop
#endif  // __GNUC__

// @@protoc_insertion_point(namespace_scope)

}  // namespace gz_geometry_msgs

// @@protoc_insertion_point(global_scope)

#endif  // PROTOBUF_INCLUDED_PoseWithCovariance_2eproto
