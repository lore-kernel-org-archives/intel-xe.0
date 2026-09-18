Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78315C88E75
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 03:09:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0BA10F153;
	Fri, 18 Sep 2026 03:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IAXPBcPH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8BF10F153;
 Fri, 18 Sep 2026 03:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789700984; x=1821236984;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HfvPUTWumMkG+THTy2rIkZ9K25oPefZYGGhc5rVi+qw=;
 b=IAXPBcPHnL+uKiWFFL4cdGbvcl4daLFjhEvzfotFCVpzvYyUpZ+kiiGi
 KCH1MO9QdJak1IlsqiwMKqO0tKScz0Az/EtVtnIaKlbC1MoQIo/XgFG1M
 23UeEYQcfBeJDRefyYlDMxs0hAbLfzd/+stQBd53dU/J/63R49VeW8f3R
 +carLMrljoRjxXYw9nVJD9fw0dPtTVdHllUvBXuGfbGBuOISL+Jz5Bg2y
 f/MaZuLdfOJeudjwwdGxnO7RkQS44aJL7YC/oHmQtqWcxG+9dgfMEkFCQ
 pWZsxG+WH4O8oNxpr433WHevsou5rfuqZKZNiqMTOAFbQLs6rbj1P/y3m w==;
X-CSE-ConnectionGUID: wZ2ei8zqSP+zBFEEW3z9VA==
X-CSE-MsgGUID: 6AZ2GfzjQx+a5oUD06QHQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115713682"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="115713682"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 20:09:44 -0700
X-CSE-ConnectionGUID: KIdQSvpKSVSndEm8KB01lw==
X-CSE-MsgGUID: +M8CT8QBRBWdkimQHByGXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="269870372"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 20:09:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 20:09:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 20:09:42 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 20:09:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4L/zRbtYn3bR+IyHQ+rGMSS5ClMw60MfCgCpL5/mhIQ2dXm8wqzwWnnDmP/JJSNAbS1MAdb87AqVo4/M0zzm92eAFnXNVJRVgrTztgm/vD304Llh4hHWabdp95za6jFQ0ZN81NsvEDh+PlA+GUP2qcSgicoC8s87nByduiqwUH7YQG15mDlCe3IxuTHvtw/DNhYtvbEwzDRRTd2AU23jyMrQKVDlGEQvwJzt7z7huumMVVy8fGe3cCRmBcJdWgeMJtNAkDQXxFpwE+YUUFhzNd++/Efq7pLosaOEK/JafnCVzw+XckMweK+mO3uRqr0twMy1QfkxiKH2klq8KXocQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7W4ttu1QgLIkvI2YnL4GOQoDqTn21DtgAfTnmrKFu4=;
 b=qMNoGQiPgp0FLqpxTZd+ilDZTO7waZURt236XLhIDy/AsLrd6xHGWGGZMH4vF5QXtJbH6gdMLrZsAI5Ii4zyLo2UU6tt/lC3Es2LBSsxfcOry4EoZach0bzr7urj26SQ5FuFdmsiMK6cq9XF4/8x0Y8CtceO3YD04oi2PBluqHHJUxe1LOekfCE2eciJvxMsbItDD7mgFRjvH46mt62pGfJa4Ll3z+wrNlE7f3tCeNlFBrB3xLRyMQrxlrKLeZ/1GUWa43OcTVAJBwUlejFM+BDfBn1zA4cU2TWmceQniyvM21CWlFTXT5zmyIPnc5qZzCV/BUJDanC5XbhqS+22gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPFE26A71A1E.namprd11.prod.outlook.com
 (2603:10b6:518:1::d58) by CY5PR11MB6140.namprd11.prod.outlook.com
 (2603:10b6:930:28::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Fri, 18 Sep
 2026 03:09:33 +0000
Received: from PH3PPFE26A71A1E.namprd11.prod.outlook.com
 ([fe80::713f:b691:3881:b27b]) by PH3PPFE26A71A1E.namprd11.prod.outlook.com
 ([fe80::713f:b691:3881:b27b%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 03:09:33 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH 06/11] drm/i915/dp: switch to drm_dp_dpcd_{read_byte,
 read_data, write_byte, write_data}
Thread-Topic: [PATCH 06/11] drm/i915/dp: switch to drm_dp_dpcd_{read_byte,
 read_data, write_byte, write_data}
Thread-Index: AQHdRbWsSpqTCkj0AkOB7bVPbJZYILbTqpKw
Date: Fri, 18 Sep 2026 03:09:33 +0000
Message-ID: <PH3PPFE26A71A1EF360359D68E397593B32E3872@PH3PPFE26A71A1E.namprd11.prod.outlook.com>
References: <cover.1789547331.git.jani.nikula@intel.com>
 <ad0a642c726436b5d41f2315e1c431d65fe2ea24.1789547331.git.jani.nikula@intel.com>
In-Reply-To: <ad0a642c726436b5d41f2315e1c431d65fe2ea24.1789547331.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPFE26A71A1E:EE_|CY5PR11MB6140:EE_
x-ms-office365-filtering-correlation-id: c5fcf224-af91-4d8c-a5ba-08df15324359
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|56012099006|6133799003|18002099003|22082099003|10067099003|3023799007|38070700021;
x-microsoft-antispam-message-info: 03r/T4ZGGDOdNPOcbilgE4fObxNlLwElZBhYi8DEkBV9xwBSLyBcB8bjEG1qIr5pWfiZbV05h8DhVkfezGUbyzgECqabJ+JSVdIXVVghg9/TUKnyvSHZ+Ooljj9XNUZFKJ4ZzBrDfrfMEmF1eHbiOWzFmxLrnLC/bbqIKllpURlDniDYR6y8ftDd92WJmPJDMeG/57euAEWfWxS+InZzdfVFIoQVI98Ym7cplATON9RcgSGcq+4jv+JrimG8X6MA2ZQ4wHSPlQtU1b5LVogd3IFXpMjJucZ5VME5P+bI1wocHkpsGwa4qCxK0PN8YXOAME47z3jbDP3K1f0x2bxBHs8skQBZDomH7H/ZqEGnIuBZqkE8d5bNDKfkF7JD/HomxotohPTZnWKZNtkfdWrrWwNQrtkbfW6zEgYbrv4YG4RFZ3IsrpVIIOgk34QTg3km89M03gHwEt/v0new8YSTPp+dwKHlwmx4x5G+qjBTnAgBjeFfC3lGavFApy8nH4OfSV4GQNlZgbo9BJ1NuL3vzhQktvDagPKrCDgdsCefGhccF5ixKVnJnJxi64gxYBc0FGVe9KIgea8DpQssMKg7sjxMVE7ERVBo6HYiw8ISG4DIyauzxHKrXT+2FXGn9zkrV1UxT89H8DBMghVOn9oShOgTsl3Jity3R5CcHGdAfj7BBV8fYyYZ92KDVe02FBAJ0wFDcTNswyeP25DwpGmouA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPFE26A71A1E.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003)(10067099003)(3023799007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IwZPgw+PplWy1I3fUw149chHTzvAuSndiP2UCf53gdlUquk3lFM576v+G50+?=
 =?us-ascii?Q?B7pDn3XCmcuoIKOcdX1+lHAKlOaNtaQsSTiIXo8JkiZ2uYTysXXaOXjp70Wk?=
 =?us-ascii?Q?MnB6iaYI96VkRFJUZWPoaqSx41qGM+8Kd8rN7qrQLL5xWki8I/mMJotKXeIR?=
 =?us-ascii?Q?wTGP3iHny853ANjvxNoQLJtUz3KwQlCcci1M9qAIMX7wemSgjeP+RF7O03vk?=
 =?us-ascii?Q?5AiyHy0kKhM7MX31T34gM0NikuqVIUFZXqTSd2dVzFZ0aIC1kKxKDGAfSAno?=
 =?us-ascii?Q?WAs1ws3XFphR62SPqNhvdJhlVj/4gnIpYE56Nx0cFNnsFWyLuf7+T037ottd?=
 =?us-ascii?Q?IOdvRQ+8VE74U2SFmv4jF9rQpzFxgLCztfs+IdPyoI7vJvvfS2uR1GC9tHn6?=
 =?us-ascii?Q?QtivuHdLDcd1hHqgFq+tWLsPC8ZWp2eMCONy5mCVBfeEqq7Er0+4+k8wf8aI?=
 =?us-ascii?Q?J7GA/Dds6T8DRPYOwAc2bbC6OzskQvGS5IpJ74FnNDdEp055x7P4ZhDFoeZs?=
 =?us-ascii?Q?vUT4rsjrc7a8Y/WC/qik9z0xN8/HdHOx8OWJiUWepdXTamKNvgEcqVMzpGQG?=
 =?us-ascii?Q?rzDfI7VARbAThLsIJf6qRFnD7oVK4FsNNXLQN9Kv59xr8+G8E64XjQXB6TwS?=
 =?us-ascii?Q?QT4rWd1cV2kmCghdrZ+QtZHFQfuTHTwvbpV6SwuyZ1prBVO5RIfFz7YGsO8y?=
 =?us-ascii?Q?nuHbsR5IsXvfhhWPET4F3oeK484QgMTiZrwoR6Olp9qHnRey2dOvil+aAQyO?=
 =?us-ascii?Q?R2nQ3zyhkx63VK05CLbhF4OSoEY/YigpCKp5hBZFm/jXLv5AVTK30gmVm3I3?=
 =?us-ascii?Q?dp1yrPJwAHPZ34Ji4hEe5fG3D9Tz3qBjbI6ocJ+0ML8dEDCTpJWECKrWDj5e?=
 =?us-ascii?Q?Y9SAfAAzVV+ghK2CXtwGuI29LEPBzu9NRhiCk4UU0VK+24SmQnRJ3pMjWDJC?=
 =?us-ascii?Q?xkjyAHvfnvA/cEG/QTnHBVaIIq0wuJYtpQDR/aZi9IfeSkPUifJrTdev8msk?=
 =?us-ascii?Q?Q8Pv75c3NGInOBs2LrQDdmK2aYvgfh0BlYWM6QxoP01oE/kB16lCYL14OzCp?=
 =?us-ascii?Q?XOmgtaQU9qXMiyA5wQZsZbRmzmTkMspJJL11oDiYw/+ULdEkKwc7Yh6z6/wg?=
 =?us-ascii?Q?Kwm9ui3vZHjdAgU3KhLIxaczVjXNPMqQ+uwFTfOR3tQZt8QOj0Vs44d68Yp3?=
 =?us-ascii?Q?WSuEDOMnglr77t9KnT1jmQuCM3/bmckqFOs1ztfi/b+md8Aj8pHYUZrXZS1u?=
 =?us-ascii?Q?7qhLnr150xSmBebfIlybQ8jMkvCDehxLx5jci+e81QlX63bh+YtGAl9K0EYt?=
 =?us-ascii?Q?yf2ZzWjR85oOBliJBmzJoJJVEPV0tixhCrwaRmbOnC0/uDOR4acP+eTFzj5v?=
 =?us-ascii?Q?LnIH9E3oix9xGiNZYmJpNAH27fh0ijdQWv+h3ebHFt8v2NCnIZ6dBqDyfQTi?=
 =?us-ascii?Q?Jyi7o+DrDFySEmpe2ssoMhMx6eDYWiNcODaFltVyBBpyNV8aZLAexclSVen/?=
 =?us-ascii?Q?KDwiSbXFfElHnpyc9JbabwP4gF3Fa9tIDeSKLGBI3gwsh7OKxGVoERapdLU3?=
 =?us-ascii?Q?vY+sQvR/59EyqyccfsAi1jnvy5Tj+LxBCzLNerWGtqWJurrRCCeRrLj9i0iX?=
 =?us-ascii?Q?k4ArZtvzcdffRUseWEVBf5CxHkTaoZ7lOwYsmV2z84kj6qhxHHLaW1RjlMxU?=
 =?us-ascii?Q?YDKz90f/GfTK3nRSJxTMHIbwWDQHslXyOd9tlJB3ohap2cDnZ7x00jC+IrRX?=
 =?us-ascii?Q?HPtgtgzqrQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 0UMNEPw59inYkJ4LZ69d1d7C3g3s4RRPNREEE6B3wDGUm6mdJDdzGsofQmVO1NUpMZkTOdZqsBXmouYIkrFnnvxuXFX3tsh5q+vdxx6W/Sdn4g/53wUZ397X45IQui+mAaBtsTFTKhdmFrDPTSGOajikjIcYg1b64aAVgGcp4HQLhtv0w2EXdovr44ZD4Sn3Tff7hngZE0mcoGZBScvJIzRH9wbxOQu0l+o7zPYxcqC77ParsWIJGzFL6kc9Ch2G+sFJ9tFcWP9oUqtGLIEBqBQDv2Uxi5pLxsQHuLXubobYGMccGRXB9zPJFDWK2TbPUfDTEWAobCDlICXYlUgRIA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFE26A71A1E.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5fcf224-af91-4d8c-a5ba-08df15324359
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 03:09:33.1767 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TDKNVUHSIBolcSVF+9PEF2+/b92usuSf5HbnAkh3l7mVRlKpFbWVwvhRe9TdmKlgqiEDu5RPp3UyBYT5mf/zzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6140
X-OriginatorOrg: intel.com
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

> Subject: [PATCH 06/11] drm/i915/dp: switch to drm_dp_dpcd_{read_byte,
> read_data, write_byte, write_data}
>=20
> Switch to the modern DPCD access functions that return negative error cod=
es
> on errors, -EIO for incomplete access, and 0 on success.
>=20
> Use local ret variables for the return value instead of checking inline, =
where
> sensible. Rename local int err to ret for clarity and consistency.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 142 +++++++++++++++---------
>  1 file changed, 88 insertions(+), 54 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 0cd5e6b5034c..6a8cf3987aa5 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3734,19 +3734,19 @@ static bool downstream_hpd_needs_d0(struct
> intel_dp *intel_dp)  static int  write_dsc_decompression_flag(struct
> drm_dp_aux *aux, u8 flag, bool set)  {
> -	int err;
> +	int ret;
>  	u8 val;
>=20
> -	err =3D drm_dp_dpcd_readb(aux, DP_DSC_ENABLE, &val);
> -	if (err < 0)
> -		return err;
> +	ret =3D drm_dp_dpcd_read_byte(aux, DP_DSC_ENABLE, &val);
> +	if (ret < 0)
> +		return ret;
>=20
>  	if (set)
>  		val |=3D flag;
>  	else
>  		val &=3D ~flag;
>=20
> -	return drm_dp_dpcd_writeb(aux, DP_DSC_ENABLE, val);
> +	return drm_dp_dpcd_write_byte(aux, DP_DSC_ENABLE, val);
>  }
>=20
>  static void
> @@ -3910,6 +3910,7 @@ intel_dp_init_source_oui(struct intel_dp *intel_dp)
>  	struct intel_display *display =3D to_intel_display(intel_dp);
>  	u8 oui[] =3D { 0x00, 0xaa, 0x01 };
>  	u8 buf[3] =3D {};
> +	int ret;
>=20
>  	if (READ_ONCE(intel_dp->oui_valid))
>  		return;
> @@ -3920,7 +3921,8 @@ intel_dp_init_source_oui(struct intel_dp *intel_dp)
>  	 * During driver init, we want to be careful and avoid changing the
> source OUI if it's
>  	 * already set to what we want, so as to avoid clearing any state by
> accident
>  	 */
> -	if (drm_dp_dpcd_read(&intel_dp->aux, DP_SOURCE_OUI, buf,
> sizeof(buf)) < 0)
> +	ret =3D drm_dp_dpcd_read_data(&intel_dp->aux, DP_SOURCE_OUI, buf,
> sizeof(buf));
> +	if (ret < 0)
>  		drm_dbg_kms(display->drm, "Failed to read source OUI\n");
>=20
>  	if (memcmp(oui, buf, sizeof(oui)) =3D=3D 0) { @@ -3929,7 +3931,8 @@
> intel_dp_init_source_oui(struct intel_dp *intel_dp)
>  		return;
>  	}
>=20
> -	if (drm_dp_dpcd_write(&intel_dp->aux, DP_SOURCE_OUI, oui,
> sizeof(oui)) < 0) {
> +	ret =3D drm_dp_dpcd_write_data(&intel_dp->aux, DP_SOURCE_OUI, oui,
> sizeof(oui));
> +	if (ret < 0) {
>  		drm_dbg_kms(display->drm, "Failed to write source OUI\n");
>  		WRITE_ONCE(intel_dp->oui_valid, false);
>  	}
> @@ -3971,7 +3974,7 @@ void intel_dp_set_power(struct intel_dp *intel_dp,
> u8 mode)
>  		if (downstream_hpd_needs_d0(intel_dp))
>  			return;
>=20
> -		ret =3D drm_dp_dpcd_writeb(&intel_dp->aux, DP_SET_POWER,
> mode);
> +		ret =3D drm_dp_dpcd_write_byte(&intel_dp->aux,
> DP_SET_POWER, mode);
>  	} else {
>  		struct intel_digital_port *dig_port =3D dp_to_dig_port(intel_dp);
>=20
> @@ -3985,17 +3988,17 @@ void intel_dp_set_power(struct intel_dp *intel_dp=
,
> u8 mode)
>  		 * time to wake up.
>  		 */
>  		for (i =3D 0; i < 3; i++) {
> -			ret =3D drm_dp_dpcd_writeb(&intel_dp->aux,
> DP_SET_POWER, mode);
> -			if (ret =3D=3D 1)
> +			ret =3D drm_dp_dpcd_write_byte(&intel_dp->aux,
> DP_SET_POWER, mode);
> +			if (!ret)
>  				break;
>  			msleep(1);
>  		}
>=20
> -		if (ret =3D=3D 1 && intel_lspcon_active(dig_port))
> +		if (!ret && intel_lspcon_active(dig_port))
>  			intel_lspcon_wait_pcon_mode(dig_port);
>  	}
>=20
> -	if (ret !=3D 1)
> +	if (ret < 0)
>  		drm_dbg_kms(display->drm,
>  			    "[ENCODER:%d:%s] Set power to %s failed\n",
>  			    encoder->base.base.id, encoder->base.name, @@ -
> 4086,6 +4089,7 @@ bool intel_dp_initial_fastset_check(struct intel_encode=
r
> *encoder,  static void intel_dp_get_pcon_dsc_cap(struct intel_dp *intel_d=
p)  {
>  	struct intel_display *display =3D to_intel_display(intel_dp);
> +	int ret;
>=20
>  	/* Clear the cached register set to avoid using stale values */
>=20
> @@ -4094,9 +4098,10 @@ static void intel_dp_get_pcon_dsc_cap(struct
> intel_dp *intel_dp)
>  	if (!drm_dp_is_branch(intel_dp->dpcd))
>  		return;
>=20
> -	if (drm_dp_dpcd_read(&intel_dp->aux, DP_PCON_DSC_ENCODER,
> -			     intel_dp->pcon_dsc_dpcd,
> -			     sizeof(intel_dp->pcon_dsc_dpcd)) < 0)
> +	ret =3D drm_dp_dpcd_read_data(&intel_dp->aux,
> DP_PCON_DSC_ENCODER,
> +				    intel_dp->pcon_dsc_dpcd,
> +				    sizeof(intel_dp->pcon_dsc_dpcd));
> +	if (ret < 0)
>  		drm_err(display->drm, "Failed to read DPCD register 0x%x\n",
>  			DP_PCON_DSC_ENCODER);
>=20
> @@ -4255,13 +4260,13 @@ int intel_dp_pcon_set_tmds_mode(struct intel_dp
> *intel_dp)
>  	/* Set PCON source control mode */
>  	buf |=3D DP_PCON_ENABLE_SOURCE_CTL_MODE;
>=20
> -	ret =3D drm_dp_dpcd_writeb(&intel_dp->aux,
> DP_PCON_HDMI_LINK_CONFIG_1, buf);
> +	ret =3D drm_dp_dpcd_write_byte(&intel_dp->aux,
> +DP_PCON_HDMI_LINK_CONFIG_1, buf);
>  	if (ret < 0)
>  		return ret;
>=20
>  	/* Set HDMI LINK ENABLE */
>  	buf |=3D DP_PCON_ENABLE_HDMI_LINK;
> -	ret =3D drm_dp_dpcd_writeb(&intel_dp->aux,
> DP_PCON_HDMI_LINK_CONFIG_1, buf);
> +	ret =3D drm_dp_dpcd_write_byte(&intel_dp->aux,
> +DP_PCON_HDMI_LINK_CONFIG_1, buf);
>  	if (ret < 0)
>  		return ret;
>=20
> @@ -4407,6 +4412,7 @@ void intel_dp_configure_protocol_converter(struct
> intel_dp *intel_dp,
>  	bool ycbcr444_to_420 =3D false;
>  	bool rgb_to_ycbcr =3D false;
>  	u8 tmp;
> +	int ret;
>=20
>  	if (intel_dp->dpcd[DP_DPCD_REV] < 0x13)
>  		return;
> @@ -4416,8 +4422,9 @@ void intel_dp_configure_protocol_converter(struct
> intel_dp *intel_dp,
>=20
>  	tmp =3D intel_dp_has_hdmi_sink(intel_dp) ?
> DP_HDMI_DVI_OUTPUT_CONFIG : 0;
>=20
> -	if (drm_dp_dpcd_writeb(&intel_dp->aux,
> -			       DP_PROTOCOL_CONVERTER_CONTROL_0, tmp) !=3D
> 1)
> +	ret =3D drm_dp_dpcd_write_byte(&intel_dp->aux,
> +				     DP_PROTOCOL_CONVERTER_CONTROL_0,
> tmp);
> +	if (ret < 0)
>  		drm_dbg_kms(display->drm,
>  			    "Failed to %s protocol converter HDMI mode\n",
>=20
> str_enable_disable(intel_dp_has_hdmi_sink(intel_dp)));
> @@ -4452,15 +4459,17 @@ void intel_dp_configure_protocol_converter(struct
> intel_dp *intel_dp,
>=20
>  	tmp =3D ycbcr444_to_420 ? DP_CONVERSION_TO_YCBCR420_ENABLE : 0;
>=20
> -	if (drm_dp_dpcd_writeb(&intel_dp->aux,
> -			       DP_PROTOCOL_CONVERTER_CONTROL_1, tmp) !=3D
> 1)
> +	ret =3D drm_dp_dpcd_write_byte(&intel_dp->aux,
> +				     DP_PROTOCOL_CONVERTER_CONTROL_1,
> tmp);
> +	if (ret < 0)
>  		drm_dbg_kms(display->drm,
>  			    "Failed to %s protocol converter YCbCr 4:2:0
> conversion mode\n",
>  			    str_enable_disable(intel_dp-
> >dfp.ycbcr_444_to_420));
>=20
>  	tmp =3D rgb_to_ycbcr ? DP_CONVERSION_BT709_RGB_YCBCR_ENABLE :
> 0;
>=20
> -	if (drm_dp_pcon_convert_rgb_to_ycbcr(&intel_dp->aux, tmp) < 0)
> +	ret =3D drm_dp_pcon_convert_rgb_to_ycbcr(&intel_dp->aux, tmp);
> +	if (ret < 0)
>  		drm_dbg_kms(display->drm,
>  			    "Failed to %s protocol converter RGB->YCbCr
> conversion mode\n",
>  			    str_enable_disable(tmp));
> @@ -4470,8 +4479,8 @@ static u8 intel_dp_read_dprx_feature_enum(struct
> intel_dp *intel_dp)  {
>  	u8 dprx =3D 0;
>=20
> -	drm_dp_dpcd_read_data(&intel_dp->aux,
> DP_DPRX_FEATURE_ENUMERATION_LIST,
> -			      &dprx, sizeof(dprx));
> +	drm_dp_dpcd_read_byte(&intel_dp->aux,
> +DP_DPRX_FEATURE_ENUMERATION_LIST, &dprx);
> +
>  	return dprx;
>  }
>=20
> @@ -4490,9 +4499,8 @@ static int intel_dp_read_dsc_dpcd(struct drm_dp_aux
> *aux,  {
>  	int ret;
>=20
> -	ret =3D drm_dp_dpcd_read_data(aux, DP_DSC_SUPPORT, dsc_dpcd,
> -				    DP_DSC_RECEIVER_CAP_SIZE);
> -	if (ret) {
> +	ret =3D drm_dp_dpcd_read_data(aux, DP_DSC_SUPPORT, dsc_dpcd,
> DP_DSC_RECEIVER_CAP_SIZE);
> +	if (ret < 0) {
>  		drm_dbg_kms(aux->drm_dev,
>  			    "Could not read DSC DPCD register 0x%x Error:
> %pe\n",
>  			    DP_DSC_SUPPORT, ERR_PTR(ret));
> @@ -4508,7 +4516,7 @@ static int intel_dp_read_dsc_dpcd(struct drm_dp_aux
> *aux,  static void init_dsc_overall_throughput_limits(struct intel_connec=
tor
> *connector, bool is_branch)  {
>  	u8 branch_caps[DP_DSC_BRANCH_CAP_SIZE];
> -	int line_width;
> +	int line_width, ret;
>=20
>  	connector->dp.dsc_branch_caps.overall_throughput.rgb_yuv444 =3D
> INT_MAX;
>  	connector->dp.dsc_branch_caps.overall_throughput.yuv422_420 =3D
> INT_MAX; @@ -4517,9 +4525,10 @@ static void
> init_dsc_overall_throughput_limits(struct intel_connector *connector
>  	if (!is_branch)
>  		return;
>=20
> -	if (drm_dp_dpcd_read_data(connector->dp.dsc_decompression_aux,
> -
> DP_DSC_BRANCH_OVERALL_THROUGHPUT_0, branch_caps,
> -				  sizeof(branch_caps)) !=3D 0)
> +	ret =3D drm_dp_dpcd_read_data(connector->dp.dsc_decompression_aux,
> +
> DP_DSC_BRANCH_OVERALL_THROUGHPUT_0, branch_caps,
> +				    sizeof(branch_caps));
> +	if (ret < 0)
>  		return;
>=20
>  	connector->dp.dsc_branch_caps.overall_throughput.rgb_yuv444 =3D @@
> -4537,6 +4546,7 @@ void intel_dp_get_dsc_sink_cap(u8 dpcd_rev,
>  			       struct intel_connector *connector)  {
>  	struct intel_display *display =3D to_intel_display(connector);
> +	int ret;
>=20
>  	/*
>  	 * Clear the cached register set to avoid using stale values @@ -
> 4553,12 +4563,14 @@ void intel_dp_get_dsc_sink_cap(u8 dpcd_rev,
>  	if (dpcd_rev < DP_DPCD_REV_14)
>  		return;
>=20
> -	if (intel_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux,
> -				   connector->dp.dsc_dpcd) < 0)
> +	ret =3D intel_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux,
> +				     connector->dp.dsc_dpcd);
> +	if (ret < 0)
>  		return;
>=20
> -	if (drm_dp_dpcd_readb(connector->dp.dsc_decompression_aux,
> DP_FEC_CAPABILITY,
> -			      &connector->dp.fec_capability) < 0) {
> +	ret =3D drm_dp_dpcd_read_byte(connector->dp.dsc_decompression_aux,
> DP_FEC_CAPABILITY,
> +				    &connector->dp.fec_capability);
> +	if (ret < 0) {
>  		drm_dbg_kms(display->drm, "Could not read FEC DPCD
> register\n");
>  		return;
>  	}
> @@ -4668,12 +4680,14 @@ static void intel_edp_mso_init(struct intel_dp
> *intel_dp)
>  	struct intel_display *display =3D to_intel_display(intel_dp);
>  	struct intel_connector *connector =3D intel_dp->attached_connector;
>  	struct drm_display_info *info =3D &connector->base.display_info;
> +	int ret;
>  	u8 mso;
>=20
>  	if (intel_dp->edp_dpcd[0] < DP_EDP_14)
>  		return;
>=20
> -	if (drm_dp_dpcd_readb(&intel_dp->aux,
> DP_EDP_MSO_LINK_CAPABILITIES, &mso) !=3D 1) {
> +	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux,
> DP_EDP_MSO_LINK_CAPABILITIES, &mso);
> +	if (ret < 0) {
>  		drm_err(display->drm, "Failed to read MSO cap\n");
>  		return;
>  	}
> @@ -4813,9 +4827,9 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp, stru=
ct
> intel_connector *connector
>  	 * method). The display control registers should read zero if they're
>  	 * not supported anyway.
>  	 */
> -	if (drm_dp_dpcd_read(&intel_dp->aux, DP_EDP_DPCD_REV,
> -			     intel_dp->edp_dpcd, sizeof(intel_dp->edp_dpcd)) =3D=3D
> -			     sizeof(intel_dp->edp_dpcd)) {
> +	ret =3D drm_dp_dpcd_read_data(&intel_dp->aux, DP_EDP_DPCD_REV,
> +				    intel_dp->edp_dpcd, sizeof(intel_dp-
> >edp_dpcd));
> +	if (!ret) {
>  		drm_dbg_kms(display->drm, "eDP DPCD: %*ph\n",
>  			    (int)sizeof(intel_dp->edp_dpcd),
>  			    intel_dp->edp_dpcd);
> @@ -5044,6 +5058,7 @@ static bool
>  intel_dp_get_sink_irq_esi(struct intel_dp *intel_dp, u8 *esi)  {
>  	struct intel_display *display =3D to_intel_display(intel_dp);
> +	int ret;
>=20
>  	/*
>  	 * Display WA for HSD #13013007775: mtl/arl/lnl @@ -5052,24
> +5067,30 @@ intel_dp_get_sink_irq_esi(struct intel_dp *intel_dp, u8 *esi)
>  	 * inadvertently.
>  	 */
>  	if (IS_DISPLAY_VER(display, 14, 20) && !display->platform.battlemage) {
> -		if (drm_dp_dpcd_read(&intel_dp->aux, DP_SINK_COUNT_ESI,
> esi, 3) !=3D 3)
> +		ret =3D drm_dp_dpcd_read_data(&intel_dp->aux,
> DP_SINK_COUNT_ESI, esi, 3);
> +		if (ret < 0)
>  			return false;
>=20
>  		/* DP_SINK_COUNT_ESI + 3 =3D=3D
> DP_LINK_SERVICE_IRQ_VECTOR_ESI0 */
> -		return drm_dp_dpcd_readb(&intel_dp->aux,
> DP_LINK_SERVICE_IRQ_VECTOR_ESI0,
> -					 &esi[3]) =3D=3D 1;
> +		ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux,
> DP_LINK_SERVICE_IRQ_VECTOR_ESI0,
> +					    &esi[3]);
> +		return ret =3D=3D 0;
>  	}
>=20
> -	return drm_dp_dpcd_read(&intel_dp->aux, DP_SINK_COUNT_ESI, esi,
> 4) =3D=3D 4;
> +	ret =3D drm_dp_dpcd_read_data(&intel_dp->aux, DP_SINK_COUNT_ESI,
> esi,
> +4);
> +
> +	return ret =3D=3D 0;
>  }
>=20
>  static bool intel_dp_ack_sink_irq_esi(struct intel_dp *intel_dp, u8 esi[=
4])  {
>  	int retry;
> +	int ret;
>=20
>  	for (retry =3D 0; retry < 3; retry++) {
> -		if (drm_dp_dpcd_write(&intel_dp->aux, DP_SINK_COUNT_ESI +
> 1,
> -				      &esi[1], 3) =3D=3D 3)
> +		ret =3D drm_dp_dpcd_write_data(&intel_dp->aux,
> DP_SINK_COUNT_ESI + 1,
> +					     &esi[1], 3);
> +		if (!ret)
>  			return true;
>  	}
>=20
> @@ -5079,20 +5100,24 @@ static bool intel_dp_ack_sink_irq_esi(struct
> intel_dp *intel_dp, u8 esi[4])
>  /* Return %true if reading the ESI vector succeeded, %false otherwise. *=
/
> static bool intel_dp_get_sink_irq_esi_sst(struct intel_dp *intel_dp, u8 e=
si[4])  {
> +	int ret;
> +
>  	memset(esi, 0, 4);
>=20
>  	/*
>  	 * TODO: For DP_DPCD_REV >=3D 0x12 read
>  	 * DP_SINK_COUNT_ESI and DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0.
>  	 */
> -	if (drm_dp_dpcd_read_data(&intel_dp->aux, DP_SINK_COUNT, esi, 2)
> !=3D 0)
> +	ret =3D drm_dp_dpcd_read_data(&intel_dp->aux, DP_SINK_COUNT, esi,
> 2);
> +	if (ret < 0)
>  		return false;
>=20
>  	if (intel_dp->dpcd[DP_DPCD_REV] < DP_DPCD_REV_12)
>  		return true;
>=20
>  	/* TODO: Read DP_DEVICE_SERVICE_IRQ_VECTOR_ESI1 as well */
> -	if (drm_dp_dpcd_read_byte(&intel_dp->aux,
> DP_LINK_SERVICE_IRQ_VECTOR_ESI0, &esi[3]) !=3D 0)
> +	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux,
> DP_LINK_SERVICE_IRQ_VECTOR_ESI0, &esi[3]);
> +	if (ret < 0)
>  		return false;
>=20
>  	return true;
> @@ -5101,18 +5126,22 @@ static bool intel_dp_get_sink_irq_esi_sst(struct
> intel_dp *intel_dp, u8 esi[4])
>  /* Return %true if acking the ESI vector IRQ events succeeded, %false
> otherwise. */  static bool intel_dp_ack_sink_irq_esi_sst(struct intel_dp
> *intel_dp, u8 esi[4])  {
> +	int ret;
> +
>  	/*
>  	 * TODO: For DP_DPCD_REV >=3D 0x12 write
>  	 * DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0
>  	 */
> -	if (drm_dp_dpcd_write_byte(&intel_dp->aux,
> DP_DEVICE_SERVICE_IRQ_VECTOR, esi[1]) !=3D 0)
> +	ret =3D drm_dp_dpcd_write_byte(&intel_dp->aux,
> DP_DEVICE_SERVICE_IRQ_VECTOR, esi[1]);
> +	if (ret < 0)
>  		return false;
>=20
>  	if (intel_dp->dpcd[DP_DPCD_REV] < DP_DPCD_REV_12)
>  		return true;
>=20
>  	/* TODO: Read DP_DEVICE_SERVICE_IRQ_VECTOR_ESI1 as well */
> -	if (drm_dp_dpcd_write_byte(&intel_dp->aux,
> DP_LINK_SERVICE_IRQ_VECTOR_ESI0, esi[3]) !=3D 0)
> +	ret =3D drm_dp_dpcd_write_byte(&intel_dp->aux,
> DP_LINK_SERVICE_IRQ_VECTOR_ESI0, esi[3]);
> +	if (ret < 0)
>  		return false;
>=20
>  	return true;
> @@ -5706,14 +5735,17 @@ intel_dp_handle_hdmi_link_status_change(struct
> intel_dp *intel_dp)  {
>  	bool is_active;
>  	u8 buf =3D 0;
> +	int ret;
>=20
>  	is_active =3D drm_dp_pcon_hdmi_link_active(&intel_dp->aux);
>  	if (intel_dp->frl.is_trained && !is_active) {
> -		if (drm_dp_dpcd_readb(&intel_dp->aux,
> DP_PCON_HDMI_LINK_CONFIG_1, &buf) < 0)
> +		ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux,
> DP_PCON_HDMI_LINK_CONFIG_1, &buf);
> +		if (ret < 0)
>  			return;
>=20
>  		buf &=3D  ~DP_PCON_ENABLE_HDMI_LINK;
> -		if (drm_dp_dpcd_writeb(&intel_dp->aux,
> DP_PCON_HDMI_LINK_CONFIG_1, buf) < 0)
> +		ret =3D drm_dp_dpcd_write_byte(&intel_dp->aux,
> DP_PCON_HDMI_LINK_CONFIG_1, buf);
> +		if (ret < 0)
>  			return;
>=20
>  		drm_dp_pcon_hdmi_frl_link_error_count(&intel_dp->aux,
> &intel_dp->attached_connector->base);
> @@ -6218,6 +6250,7 @@ static bool
>  intel_dp_sink_supports_as_sdp_v2(struct intel_dp *intel_dp)  {
>  	u8 rx_features;
> +	int ret;
>=20
>  	/*
>  	 * The DP spec does not explicitly provide the AS SDP v2 capability.
> @@ -6240,9 +6273,10 @@ intel_dp_sink_supports_as_sdp_v2(struct intel_dp
> *intel_dp)
>  	 * support from Display ID.
>  	 */
>=20
> -	if (drm_dp_dpcd_read_byte(&intel_dp->aux,
> -
> DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1,
> -				  &rx_features) =3D=3D 1) {
> +	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux,
> +
> DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1,
> +				    &rx_features);
> +	if (!ret) {
>  		if (rx_features &
> DP_AS_SDP_FAVT_PAYLOAD_FIELDS_PARSING_SUPPORTED)
>  			return true;
>  	}
> --
> 2.47.3

