Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51277606A331
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 15:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Oz0u/Tv8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147DC10F646;
	Tue, 24 Nov 2026 15:15:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FD710F655
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 15:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795533317; x=1827069317;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=vnLU/1uYbXwB4sWi28JGfRuwSi87EclTG8aitQEyCZE=;
 b=Oz0u/Tv8W5D2XzZqoJo/Yf/hbKXVgWHclGEtAJpk27e+YYBYmxUPU4HH
 9oOzA9zAN5ff1Qb5Kx6AKc4r0HRRuyaWOa/luny0ZIyXnsWxc8vVzy7Zj
 uhSj+fMns5jvPRJ4G+50bdle9vcN4YTxUe1mLkY6ydnFSNqDON4Vd4AOQ
 hObWFcs8C9wuU5hmRu3qgCjt2qoLAzn6K/iyipH0l/+ZVZSh60p1OEwpe
 PNQQkBvJS6kOo1gtLhF2GdNjcw+NLbZI+jzeB//nBJMkFSIni3ajTDM6C
 dnHlT805sja3Mgydn+3De9dGlUM8/D6WYrBN17DZJvKqmQHdKxDv16aqD Q==;
X-CSE-ConnectionGUID: NJNyN6NHTPyzGyK4Wvqhtg==
X-CSE-MsgGUID: 6Ou82KE3RoSS22uvuicEjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4247704"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4247704"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 06:25:10 -0800
X-CSE-ConnectionGUID: SEFwGSK0R4WVnQTDha1Grg==
X-CSE-MsgGUID: v4FuZ+I9RTS3DgVF+FyF5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11484546"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 06:22:54 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 24 Nov 2026 16:22:51 +0200 (EET)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com, 
 anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
 matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: Re: [PATCH v23 02/19] platform/x86/intel/pmt: Use the pre-populated
 header info for crashlog
In-Reply-To: <20261124020752.30551-23-michael.j.ruhl@intel.com>
Message-ID: <9867facd-1512-94bb-a50e-04397033dc38@linux.intel.com>
References: <20261124020752.30551-21-michael.j.ruhl@intel.com>
 <20261124020752.30551-23-michael.j.ruhl@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1807635651-1795530171=:1182"
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1807635651-1795530171=:1182
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 23 Nov 2026, Michael J. Ruhl wrote:

> Crashlog reads discovery data directly from the discovery table.
>=20
> For parents that provide a read_discovery callback, this data may
> not be readable with this method.
>=20
> Update to use the pre-populated discovery data (disc_header), rather
> than reading directly (disc_table) for probe.
>=20
> Reviewed-by: David E. Box <david.e.box@linux.intel.com>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
=20
--
 i.


> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 24 +++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform=
/x86/intel/pmt/crashlog.c
> index d7018b495217..e2af09732dd6 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -27,10 +27,10 @@
>  #define CRASH_TYPE_OOBMSM=091
> =20
>  /* Crashlog Discovery Header */
> -#define CONTROL_OFFSET=09=090x0
> -#define GUID_OFFSET=09=090x4
> -#define BASE_OFFSET=09=090x8
> -#define SIZE_OFFSET=09=090xC
> +#define ACCESS_IDX=09=090
> +#define GUID_IDX=09=091
> +#define BASE_IDX=09=092
> +#define SIZE_IDX=09=093
>  #define GET_ACCESS(v)=09=09((v) & GENMASK(3, 0))
>  #define GET_TYPE(v)=09=09(((v) & GENMASK(7, 4)) >> 4)
>  #define GET_VERSION(v)=09=09(((v) & GENMASK(19, 16)) >> 16)
> @@ -208,10 +208,10 @@ static int pmt_crashlog_disabled(struct crashlog_en=
try *crashlog, bool *state)
> =20
>  static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *c=
rash_type, u32 *version)
>  {
> -=09u32 discovery_header =3D readl(entry->disc_table + CONTROL_OFFSET);
> +=09u32 *disc_header =3D entry->disc_header;
> =20
> -=09*crash_type =3D GET_TYPE(discovery_header);
> -=09*version =3D GET_VERSION(discovery_header);
> +=09*crash_type =3D GET_TYPE(disc_header[ACCESS_IDX]);
> +=09*version =3D GET_VERSION(disc_header[ACCESS_IDX]);
> =20
>  =09/*
>  =09 * Currently we only recognize OOBMSM (type 1) and version 0 or 2
> @@ -608,15 +608,15 @@ static int pmt_crashlog_pre_decode(struct intel_vse=
c_device *ivdev,
>  static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
>  =09=09=09=09      struct device *dev)
>  {
> -=09void __iomem *disc_table =3D entry->disc_table;
>  =09struct intel_pmt_header *header =3D &entry->header;
> +=09u32 *disc_header =3D entry->disc_header;
> =20
> -=09header->access_type =3D GET_ACCESS(readl(disc_table));
> -=09header->guid =3D readl(disc_table + GUID_OFFSET);
> -=09header->base_offset =3D readl(disc_table + BASE_OFFSET);
> +=09header->access_type =3D GET_ACCESS(disc_header[ACCESS_IDX]);
> +=09header->guid =3D disc_header[GUID_IDX];
> +=09header->base_offset =3D disc_header[BASE_IDX];
> =20
>  =09/* Size is measured in DWORDS, but accessor returns bytes */
> -=09header->size =3D GET_SIZE(readl(disc_table + SIZE_OFFSET));
> +=09header->size =3D GET_SIZE(disc_header[SIZE_IDX]);
> =20
>  =09return 0;
>  }
>=20
--8323328-1807635651-1795530171=:1182--
