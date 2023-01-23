Return-Path: <intel-xe-bounces@lists.freedesktop.org>
Date: Mon, 23 Jan 2023 21:35:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
Message-ID: <Y879qQWkdMuy3f4C@DUT025-TGLU.fm.intel.com>
References: <20230123175552.148742-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230123175552.148742-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-xe] [PATCH 1/2] xe/uapi: Rename XE_ENGINE_PROPERTY_X to
 XE_ENGINE_SET_PROPERTY_X
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

On Mon, Jan 23, 2023 at 09:55:51AM -0800, Jos=EF=BF=BD Roberto de Souza wro=
te:
> Engine property get uAPI will be added, so to avoid ambiguity here
> renaming XE_ENGINE_PROPERTY_X to XE_ENGINE_SET_PROPERTY_X.
>=20
> No changes in behavior.
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Jos=EF=BF=BD Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_engine.c | 18 +++++++++---------
>  include/uapi/drm/xe_drm.h      | 18 +++++++++---------
>  2 files changed, 18 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engin=
e.c
> index 7cd945fcdd979..2db23f0c36cfe 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -314,15 +314,15 @@ typedef int (*xe_engine_set_property_fn)(struct xe_=
device *xe,
>  					 u64 value, bool create);
> =20
>  static const xe_engine_set_property_fn engine_set_property_funcs[] =3D {
> -	[XE_ENGINE_PROPERTY_PRIORITY] =3D engine_set_priority,
> -	[XE_ENGINE_PROPERTY_TIMESLICE] =3D engine_set_timeslice,
> -	[XE_ENGINE_PROPERTY_PREEMPTION_TIMEOUT] =3D engine_set_preemption_timeo=
ut,
> -	[XE_ENGINE_PROPERTY_COMPUTE_MODE] =3D engine_set_compute_mode,
> -	[XE_ENGINE_PROPERTY_PERSISTENCE] =3D engine_set_persistence,
> -	[XE_ENGINE_PROPERTY_JOB_TIMEOUT] =3D engine_set_job_timeout,
> -	[XE_ENGINE_PROPERTY_ACC_TRIGGER] =3D engine_set_acc_trigger,
> -	[XE_ENGINE_PROPERTY_ACC_NOTIFY] =3D engine_set_acc_notify,
> -	[XE_ENGINE_PROPERTY_ACC_GRANULARITY] =3D engine_set_acc_granularity,
> +	[XE_ENGINE_SET_PROPERTY_PRIORITY] =3D engine_set_priority,
> +	[XE_ENGINE_SET_PROPERTY_TIMESLICE] =3D engine_set_timeslice,
> +	[XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT] =3D engine_set_preemption_t=
imeout,
> +	[XE_ENGINE_SET_PROPERTY_COMPUTE_MODE] =3D engine_set_compute_mode,
> +	[XE_ENGINE_SET_PROPERTY_PERSISTENCE] =3D engine_set_persistence,
> +	[XE_ENGINE_SET_PROPERTY_JOB_TIMEOUT] =3D engine_set_job_timeout,
> +	[XE_ENGINE_SET_PROPERTY_ACC_TRIGGER] =3D engine_set_acc_trigger,
> +	[XE_ENGINE_SET_PROPERTY_ACC_NOTIFY] =3D engine_set_acc_notify,
> +	[XE_ENGINE_SET_PROPERTY_ACC_GRANULARITY] =3D engine_set_acc_granularity,
>  };
> =20
>  static int engine_user_ext_set_property(struct xe_device *xe,
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index f564860de622e..f4d9b1f805820 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -511,21 +511,21 @@ struct drm_xe_engine_set_property {
>  	__u32 engine_id;
> =20
>  	/** @property: property to set */
> -#define XE_ENGINE_PROPERTY_PRIORITY			0
> -#define XE_ENGINE_PROPERTY_TIMESLICE			1
> -#define XE_ENGINE_PROPERTY_PREEMPTION_TIMEOUT		2
> +#define XE_ENGINE_SET_PROPERTY_PRIORITY			0
> +#define XE_ENGINE_SET_PROPERTY_TIMESLICE		1
> +#define XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
>  	/*
>  	 * Long running or ULLS engine mode. DMA fences not allowed in this
>  	 * mode. Must match the value of DRM_XE_VM_CREATE_COMPUTE_MODE, serves
>  	 * as a sanity check the UMD knows what it is doing. Can only be set at
>  	 * engine create time.
>  	 */
> -#define XE_ENGINE_PROPERTY_COMPUTE_MODE			3
> -#define XE_ENGINE_PROPERTY_PERSISTENCE			4
> -#define XE_ENGINE_PROPERTY_JOB_TIMEOUT			5
> -#define XE_ENGINE_PROPERTY_ACC_TRIGGER			6
> -#define XE_ENGINE_PROPERTY_ACC_NOTIFY			7
> -#define XE_ENGINE_PROPERTY_ACC_GRANULARITY		8
> +#define XE_ENGINE_SET_PROPERTY_COMPUTE_MODE		3
> +#define XE_ENGINE_SET_PROPERTY_PERSISTENCE		4
> +#define XE_ENGINE_SET_PROPERTY_JOB_TIMEOUT		5
> +#define XE_ENGINE_SET_PROPERTY_ACC_TRIGGER		6
> +#define XE_ENGINE_SET_PROPERTY_ACC_NOTIFY		7
> +#define XE_ENGINE_SET_PROPERTY_ACC_GRANULARITY		8
>  	__u32 property;
> =20
>  	/** @value: property value */
> --=20
> 2.39.1
>=20

