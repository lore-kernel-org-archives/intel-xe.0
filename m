Return-Path: <intel-xe-bounces@lists.freedesktop.org>
Date: Mon, 23 Jan 2023 21:35:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
Message-ID: <Y879vwM2ez7OybSe@DUT025-TGLU.fm.intel.com>
References: <20230123175552.148742-1-jose.souza@intel.com>
 <20230123175552.148742-2-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230123175552.148742-2-jose.souza@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-xe] [PATCH 2/2] xe: Add XE_ENGINE_GET_PROPERTY uAPI
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, intel-xe@lists.freedesktop.org

On Mon, Jan 23, 2023 at 09:55:52AM -0800, Jos=EF=BF=BD Roberto de Souza wro=
te:
> This is intented to get some properties that are of interest of UMDs
> like the ban state.
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Jos=EF=BF=BD Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |  2 ++
>  drivers/gpu/drm/xe/xe_engine.c | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_engine.h |  2 ++
>  include/uapi/drm/xe_drm.h      | 22 +++++++++++++++++++++-
>  4 files changed, 51 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 14af3f58c75d7..364e57380b75c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -106,6 +106,8 @@ static const struct drm_ioctl_desc xe_ioctls[] =3D {
>  	DRM_IOCTL_DEF_DRV(XE_VM_BIND, xe_vm_bind_ioctl, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_ENGINE_CREATE, xe_engine_create_ioctl,
>  			  DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_ENGINE_GET_PROPERTY, xe_engine_get_property_ioctl,
> +		          DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_ENGINE_DESTROY, xe_engine_destroy_ioctl,
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_EXEC, xe_exec_ioctl, DRM_RENDER_ALLOW),
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engin=
e.c
> index 2db23f0c36cfe..e478d0417e49e 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -639,6 +639,32 @@ int xe_engine_create_ioctl(struct drm_device *dev, v=
oid *data,
>  	return err;
>  }
> =20
> +int xe_engine_get_property_ioctl(struct drm_device *dev, void *data,
> +				 struct drm_file *file)
> +{
> +	struct xe_device *xe =3D to_xe_device(dev);
> +	struct xe_file *xef =3D to_xe_file(file);
> +	struct drm_xe_engine_get_property *args =3D data;
> +	struct xe_engine *e;
> +
> +	mutex_lock(&xef->engine.lock);
> +	e =3D xa_load(&xef->engine.xa, args->engine_id);
> +	mutex_unlock(&xef->engine.lock);
> +
> +	if (XE_IOCTL_ERR(xe, !e))
> +		return -ENOENT;
> +
> +	switch (args->property) {
> +	case XE_ENGINE_GET_PROPERTY_BAN:
> +		args->value =3D !!(e->flags & ENGINE_FLAG_BANNED);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static void engine_kill_compute(struct xe_engine *e)
>  {
>  	if (!xe_vm_in_compute_mode(e->vm))
> diff --git a/drivers/gpu/drm/xe/xe_engine.h b/drivers/gpu/drm/xe/xe_engin=
e.h
> index 4d1b609fea7e0..a3a44534003f7 100644
> --- a/drivers/gpu/drm/xe/xe_engine.h
> +++ b/drivers/gpu/drm/xe/xe_engine.h
> @@ -50,5 +50,7 @@ int xe_engine_destroy_ioctl(struct drm_device *dev, voi=
d *data,
>  			    struct drm_file *file);
>  int xe_engine_set_property_ioctl(struct drm_device *dev, void *data,
>  				 struct drm_file *file);
> +int xe_engine_get_property_ioctl(struct drm_device *dev, void *data,
> +				 struct drm_file *file);
> =20
>  #endif
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index f4d9b1f805820..593b01ba5919c 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -118,6 +118,7 @@ struct xe_user_extension {
>  #define DRM_XE_ENGINE_SET_PROPERTY	0x0a
>  #define DRM_XE_WAIT_USER_FENCE		0x0b
>  #define DRM_XE_VM_MADVISE		0x0c
> +#define DRM_XE_ENGINE_GET_PROPERTY	0x0d
> =20
>  /* Must be kept compact -- no holes */
>  #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DE=
VICE_QUERY, struct drm_xe_device_query)
> @@ -127,6 +128,7 @@ struct xe_user_extension {
>  #define DRM_IOCTL_XE_VM_DESTROY			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_=
DESTROY, struct drm_xe_vm_destroy)
>  #define DRM_IOCTL_XE_VM_BIND			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_BIN=
D, struct drm_xe_vm_bind)
>  #define DRM_IOCTL_XE_ENGINE_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_E=
NGINE_CREATE, struct drm_xe_engine_create)
> +#define DRM_IOCTL_XE_ENGINE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM=
_XE_ENGINE_GET_PROPERTY, struct drm_xe_engine_get_property)
>  #define DRM_IOCTL_XE_ENGINE_DESTROY		DRM_IOW( DRM_COMMAND_BASE + DRM_XE_=
ENGINE_DESTROY, struct drm_xe_engine_destroy)
>  #define DRM_IOCTL_XE_EXEC			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_EXEC, str=
uct drm_xe_exec)
>  #define DRM_IOCTL_XE_MMIO			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MMIO, str=
uct drm_xe_mmio)
> @@ -568,8 +570,26 @@ struct drm_xe_engine_create {
>  	__u64 reserved[2];
>  };
> =20
> +struct drm_xe_engine_get_property {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @engine_id: Engine ID */
> +	__u32 engine_id;
> +
> +	/** @property: property to get */
> +#define XE_ENGINE_GET_PROPERTY_BAN			0
> +	__u32 property;
> +
> +	/** @value: property value */
> +	__u64 value;
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[2];
> +};
> +
>  struct drm_xe_engine_destroy {
> -	/** @vm_id: VM ID */
> +	/** @engine_id: Engine ID */
>  	__u32 engine_id;
> =20
>  	/** @pad: MBZ */
> --=20
> 2.39.1
>=20

