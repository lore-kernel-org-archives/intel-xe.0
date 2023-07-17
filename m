Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4CBEB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jul 2023 12:15:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405CE10E142;
	Mon, 17 Jul 2023 12:15:49 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA0A10E142
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jul 2023 12:15:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A2FA86103F
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jul 2023 12:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11057C433C7
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jul 2023 12:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689596146;
 bh=32tLekURZ5E39S5/HZfZ1PQBAMvK9yKxCOKigAdC+qo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Bt9+2kbicO418/rQGA+3Qf9HNUjDDPVX/Ca7MeDW8w7isj88yq93AJS2J1CT9ypBw
 MGxFJGCHAUWNk/gN7wPFArxoC7He8TJ09y5GxFUD9odvFJzowvbFwZeRsxJiisRiam
 NCpJ1YcCXOBbFHPd3V/QVOqvsISt8ivDVAs47U5Q6Vmwu+DD6/XsjuN4VHw2sI1syr
 T9FTUg7fQ2mkRllN+JGW4VhPv7CSamZrYA0a2h60ZvbVCDK7heQ+ctmmhkfrUdHYmy
 8fYtjyCpDV4akbgDCs+NFUMJXWHwsZYkS+SZq3HlV0L8X77gexYANpD03dIw9G0zHE
 7IVEklAZI2omQ==
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-5634db21a78so2795073eaf.0
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jul 2023 05:15:46 -0700 (PDT)
X-Gm-Message-State: ABy/qLY1eW3+uWhlPWt7Mqef3AjYMMFlO4XPrXcy8XLHnq6o2iruFGaI
 y6D6x1p5zvbkJ9h+hAElBGWlSYkwz+MSHrkRGus=
X-Google-Smtp-Source: APBJJlHZzVVHJceCqg8pbHMJygyFiwI0mNo2MKlJ7AOECLGnqYqV8fCDW+STEm+fT2XBseS4STc5WPaq/DL69UCCSUo=
X-Received: by 2002:a05:6358:90d:b0:135:69d5:1b10 with SMTP id
 r13-20020a056358090d00b0013569d51b10mr12235153rwi.1.1689596145178; Mon, 17
 Jul 2023 05:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230622123946.7-1-francois.dugast@intel.com>
 <20230622123946.7-2-francois.dugast@intel.com>
 <yb73hntwdhzxvdfp53avjpckkj5ounqnmssa5xbe3itvvize5a@guodqz4cusr7>
In-Reply-To: <yb73hntwdhzxvdfp53avjpckkj5ounqnmssa5xbe3itvvize5a@guodqz4cusr7>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Mon, 17 Jul 2023 15:15:18 +0300
X-Gmail-Original-Message-ID: <CAFCwf13Eoe7T5ZpUuz-b=5Fseu5Nkk7fJxmVfu-oTHUWyYdz2w@mail.gmail.com>
Message-ID: <CAFCwf13Eoe7T5ZpUuz-b=5Fseu5Nkk7fJxmVfu-oTHUWyYdz2w@mail.gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH v5 1/3] drm/xe: Document structures for
 device query
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jun 22, 2023 at 6:07=E2=80=AFPM Lucas De Marchi
<lucas.demarchi@intel.com> wrote:
>
> On Thu, Jun 22, 2023 at 12:39:44PM +0000, Francois Dugast wrote:
> >This adds documentation to the various structures used to query
> >memory, GTs, topology, engines, and so on. It includes a functional
> >code snippet to query engines.
> >
> >v2:
> >  - Rebase on drm-xe-next
> >  - Also document structures related to drm_xe_device_query, changed
> >    pseudo code to snippet (Lucas De Marchi)
> >v3:
> >  - Move changelog to commit
> >  - Fix warnings showed only using dim checkpath
> >
> >Reported-by: Oded Gabbay <ogabbay@kernel.org>
> >Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.ht=
ml
> >Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Sorry, just saw there is a v5, so this is also:
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
>
> thanks
> Lucas De Marchi
>
> >---
> > include/uapi/drm/xe_drm.h | 75 +++++++++++++++++++++++++++++++++++++++
> > 1 file changed, 75 insertions(+)
> >
> >diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> >index 9bdea8b81435..9421e144005d 100644
> >--- a/include/uapi/drm/xe_drm.h
> >+++ b/include/uapi/drm/xe_drm.h
> >@@ -119,8 +119,18 @@ struct xe_user_extension {
> > #define XE_MEM_REGION_CLASS_SYSMEM    0
> > #define XE_MEM_REGION_CLASS_VRAM      1
> >
> >+/**
> >+ * struct drm_xe_query_mem_usage - describe memory regions and usage
> >+ *
> >+ * If a query is made with a struct drm_xe_device_query where .query
> >+ * is equal to DRM_XE_DEVICE_QUERY_MEM_USAGE, then the reply uses
> >+ * struct drm_xe_query_mem_usage in .data.
> >+ */
> > struct drm_xe_query_mem_usage {
> >+      /** @num_params: number of memory regions returned in regions */
> >       __u32 num_regions;
> >+
> >+      /** @pad: MBZ */
> >       __u32 pad;
> >
> >       struct drm_xe_query_mem_region {
> >@@ -135,9 +145,20 @@ struct drm_xe_query_mem_usage {
> >       } regions[];
> > };
> >
> >+/**
> >+ * struct drm_xe_query_config - describe the device configuration
> >+ *
> >+ * If a query is made with a struct drm_xe_device_query where .query
> >+ * is equal to DRM_XE_DEVICE_QUERY_CONFIG, then the reply uses
> >+ * struct drm_xe_query_config in .data.
> >+ */
> > struct drm_xe_query_config {
> >+      /** @num_params: number of parameters returned in info */
> >       __u32 num_params;
> >+
> >+      /** @pad: MBZ */
> >       __u32 pad;
> >+
> > #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID     0
> > #define XE_QUERY_CONFIG_FLAGS                 1
> >       #define XE_QUERY_CONFIG_FLAGS_HAS_VRAM          (0x1 << 0)
> >@@ -148,11 +169,22 @@ struct drm_xe_query_config {
> > #define XE_QUERY_CONFIG_MEM_REGION_COUNT      5
> > #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY   6
> > #define XE_QUERY_CONFIG_NUM_PARAM             (XE_QUERY_CONFIG_MAX_ENGI=
NE_PRIORITY + 1)
> >+      /** @info: array of elements containing the config info */
> >       __u64 info[];
> > };
> >
> >+/**
> >+ * struct drm_xe_query_gts - describe GTs
> >+ *
> >+ * If a query is made with a struct drm_xe_device_query where .query
> >+ * is equal to DRM_XE_DEVICE_QUERY_GTS, then the reply uses struct
> >+ * drm_xe_query_gts in .data.
> >+ */
> > struct drm_xe_query_gts {
> >+      /** @num_gt: number of GTs returned in gts */
> >       __u32 num_gt;
> >+
> >+      /** @pad: MBZ */
> >       __u32 pad;
> >
> >       /*
> >@@ -175,6 +207,13 @@ struct drm_xe_query_gts {
> >       } gts[];
> > };
> >
> >+/**
> >+ * struct drm_xe_query_topology_mask - describe the topology mask of a =
GT
> >+ *
> >+ * If a query is made with a struct drm_xe_device_query where .query
> >+ * is equal to DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, then the reply uses
> >+ * struct drm_xe_query_topology_mask in .data.
> >+ */
> > struct drm_xe_query_topology_mask {
> >       /** @gt_id: GT ID the mask is associated with */
> >       __u16 gt_id;
> >@@ -192,6 +231,41 @@ struct drm_xe_query_topology_mask {
> >       __u8 mask[];
> > };
> >
> >+/**
> >+ * struct drm_xe_device_query - main structure to query device informat=
ion
> >+ *
> >+ * If size is set to 0, the driver fills it with the required size for =
the
> >+ * requested type of data to query. If size is equal to the required si=
ze,
> >+ * the queried information is copied into data.
> >+ *
> >+ * For example the following code snippet allows retrieving and printin=
g
> >+ * information about the device engines with DRM_XE_DEVICE_QUERY_ENGINE=
S:
> >+ *
> >+ * .. code-block:: C
> >+ *
> >+ *    struct drm_xe_engine_class_instance *hwe;
> >+ *    struct drm_xe_device_query query =3D {
> >+ *            .extensions =3D 0,
> >+ *            .query =3D DRM_XE_DEVICE_QUERY_ENGINES,
> >+ *            .size =3D 0,
> >+ *            .data =3D 0,
> >+ *    };
> >+ *    ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
> >+ *    hwe =3D malloc(query.size);
> >+ *    query.data =3D (uintptr_t)hwe;
> >+ *    ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
> >+ *    int num_engines =3D query.size / sizeof(*hwe);
> >+ *    for (int i =3D 0; i < num_engines; i++) {
> >+ *            printf("Engine %d: %s\n", i,
> >+ *                    hwe[i].engine_class =3D=3D DRM_XE_ENGINE_CLASS_RE=
NDER ? "RENDER":
> >+ *                    hwe[i].engine_class =3D=3D DRM_XE_ENGINE_CLASS_CO=
PY ? "COPY":
> >+ *                    hwe[i].engine_class =3D=3D DRM_XE_ENGINE_CLASS_VI=
DEO_DECODE ? "VIDEO_DECODE":
> >+ *                    hwe[i].engine_class =3D=3D DRM_XE_ENGINE_CLASS_VI=
DEO_ENHANCE ? "VIDEO_ENHANCE":
> >+ *                    hwe[i].engine_class =3D=3D DRM_XE_ENGINE_CLASS_CO=
MPUTE ? "COMPUTE":
> >+ *                    "UNKNOWN");
> >+ *    }
> >+ *    free(hwe);
> >+ */
> > struct drm_xe_device_query {
> >       /** @extensions: Pointer to the first extension struct, if any */
> >       __u64 extensions;
> >@@ -526,6 +600,7 @@ struct drm_xe_engine_set_property {
> >       __u64 reserved[2];
> > };
> >
> >+/** struct drm_xe_engine_class_instance - instance of an engine class *=
/
> > struct drm_xe_engine_class_instance {
> >       __u16 engine_class;
> >
> >--
> >2.34.1
> >
