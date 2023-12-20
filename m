Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD7FC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 20 Dec 2023 14:56:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4269210E5BC;
	Wed, 20 Dec 2023 14:56:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870CB10E1D4
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Dec 2023 14:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703084187; x=1734620187;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KIpt4pVJRhWDfYqx2rWm5LpYuRzoKTgMFyjRKXfgSco=;
 b=FhUBX61M+GlvT7YIQUleCus5oPZ4T799xKjxGvjtOhcbkQacvJnZihR/
 FmYcDfWQFVFW2N1yqTduqqwbU+2uSfLxI/pcyK+IQmGUtTggHIvndbHq/
 dvZOvX/1Ad0JO2PwnFAI9Td+/mXd6Qkk8lyis2sVxfE5Fc0xzChx0+dMh
 C6ftSsfXN9L21bKheOs3WzrOIDlPK136+UJ5gZazi+yWmZs3yaIrj3Y4s
 rj1b30bCU3/sQYyOxgU0r5EKcB020vchwMOcJ+ZLT6vZlXGL5j1/T8jAR
 qrpfllAIsELCal0tesjybUf2gcHfliSxhwUT61BCrK/sMLBgGXrlH5lc0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="3043341"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="3043341"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 06:56:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="776365519"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; d="scan'208";a="776365519"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2023 06:56:25 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 06:56:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 06:56:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 06:56:24 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Dec 2023 06:56:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=drkJ4JdMOylnuSzc+sQKSah1RUeXR7RLpZEbpRvvBJN5nSUcVhkZBRRDXjwxsnwW7Uy9J3XNZ+7Lt6etOkkCrYoQNBVrtuUMK6SoU+tkanZM3ILPt2QLR4aGo02f8x6tHe9xOdyANa7eN2GJSyZvXMdRHhZgOiN9ZdFUuGxt5L0DoONbF2o0aAfhAALqHyrchu4y0jX1MNaNXxvll5VdLK2cevyOzzCYIL603/UeURNBKBH7LNr0Ih+Yq41t4mFEf+QubSvF23L/D/4VMEiTNy7mfVChEE4ryVDKW+Ko6t1LWiTvLdllJjm2RIl6VHREOjASgXjR1XCLqHT+32oQMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mEoTYm1C7FlrHKlZepYuCZKMw6axrG2yZpmA9AvDbMQ=;
 b=CypKJLQFXztXc/opabv5i/Nm6cznz5Iji0elLBvY50N/5xrEumSzlHNt13iWKvXsZfQzfxzzrghRRGc2UvF+rWORKf6Kz7kLxb9YzU5Uw3qXEsePvwCitvefGnOF8a2sFOwj88Ir5Uyy7erqcdbrWIbRMx5mZk6BnXrsF9iUmzhSK35iIsHMu6qSIupfS0pohoVDh3Qy86s2J5GwVyVqC6f+U+SYuHvYBI55Xo4UdExEfAGU7YwtqeNRradJB+XSyU/qmcEreHVGbKBbI7YRcKAmOZaFLCG9pD/nWw3jVBeU+9xt1aZ2O+aD7in9ssWvCYmuJN8tnlp1lW3SLlaOmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by PH7PR11MB6030.namprd11.prod.outlook.com (2603:10b6:510:1d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 14:56:22 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762%4]) with mapi id 15.20.7091.034; Wed, 20 Dec 2023
 14:56:22 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [v5 1/3] drm/xe: Add vram frequency sysfs attributes
Thread-Topic: [v5 1/3] drm/xe: Add vram frequency sysfs attributes
Thread-Index: AQHaMmEdvc+gcMFRRkiW4YPcLby7OrCyRAKg
Date: Wed, 20 Dec 2023 14:56:22 +0000
Message-ID: <CY5PR11MB6211D392383C6898707C44D89596A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231219100711.645011-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20231219100711.645011-1-sujaritha.sundaresan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|PH7PR11MB6030:EE_
x-ms-office365-filtering-correlation-id: 6b0aa518-c8b6-45b0-adb2-08dc016bd4cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7uZq9WgfSQ1xS/5GgJR0UUzUKeR8eXrLSuN54d7hoEI6o9Xd/G4F+CpoL0y3Z4H5wbHuyZ3eEIFKqTwOccHam1S4cFElfRHf0c66o6z9e/cZyw66xMlrRj6kMV+EykgjPga5wwvLP/h7NwHAmZB8Ky4lCQU87nLrlur51bODxO88v3Vez80VgFkfBgOMmyxq8TVk/5aG9swGgbp7yYdzc9KgP3LKUQxuU5xnrlYMrKVTzW59SfXFXX3x31+QnoQCEhx+E0OOGNUcV52Dga4B/IYWKiqhzKvxw9aDvXXfkwULl1mnFGiJJAd3kPVRKLg2QLl5dJhVNiUZcYuRXhgRGvQ5zEyQEsAQ8BPspas6m8bubhsfcWWNYqIXA74fJJVAxqgVuksNkZzt3+D4TKw0/ZidTCuxjOWjFg13S44RHJqzTFVPX0KUWqCVD6D9TSKQ6vWDoHHhEGpNa+AclSxD/NswOX2qCeXaE2rHr2SrzNE/GPvV5pN4a54JN5TB39vYMSDkDQYf/g0x2/IKwcPkJluXQS781IehjpsVnZ7a7zEjWqJ2phypOPAyZtxX+lt8fARWQMpboWrvhjqx2iXBL7QSqV+akxMgbgc+Ig0IEW0wsbp3b7YuIm4gJfOfXM4n
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(346002)(396003)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(478600001)(110136005)(66946007)(76116006)(316002)(66556008)(66476007)(66446008)(64756008)(38100700002)(71200400001)(38070700009)(41300700001)(86362001)(6506007)(82960400001)(7696005)(53546011)(9686003)(33656002)(5660300002)(26005)(107886003)(4326008)(83380400001)(122000001)(8936002)(8676002)(2906002)(52536014)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aoS26GXP/R+QD/h6Ci5HPPND813ZmUvSFv6UVqu8+PqdpuMu2QDFeck/XPEt?=
 =?us-ascii?Q?GY74QwLLXyhJBxqyIDQGUh8wi8OCVRagmS/QjznFYgriyBcl7buZ9B6Jasbc?=
 =?us-ascii?Q?usrkA/Yx/Xbm5l9QHx8h43QyS5ERYNXb63Nyz3XHd1CaS6gXpoFV9aTg8LpD?=
 =?us-ascii?Q?sTejKYElI4qMIwhhBmJ3JJZGaYZv18wRRtJmorNrdf2aIHRUPveZhaZ4Av+n?=
 =?us-ascii?Q?KaJgkK+VRBL45KdmfQ/SxV07n5A+pS4ZRnHBWxBwzes3+CgTfrq3847cFd14?=
 =?us-ascii?Q?knKdEpo33WDsmTSjk9/iBsf0t0jllTS88zneXfLkZR/vwc7nP0UiT7XLepA/?=
 =?us-ascii?Q?+T2zXWJA3BqEf78o7PvcArUJcL35UWUxxwc/qKnmWpUWjdP/C5tuUeedB5gy?=
 =?us-ascii?Q?pwzKn5mH0CLR80sRhAcSpkBXk0wyeMEtKTxCqaM6VUJK/OeABSswN8dtacdh?=
 =?us-ascii?Q?8GWiS2FdpN6hVXYNfmmu9hiEuSl9wbIzCZ4RL6uVh6jpzSbqEXgusgfDOtl9?=
 =?us-ascii?Q?xUvwg3np/Prmv+7r6BJRTiP5qJlu0Hd2CWaW05/JjD0cTpCT9UGYdwx/vYrk?=
 =?us-ascii?Q?iaKRCtNpluIHsN+hXLLMhlwrffHbdaoQ4fjnVj6MlDpHL2iQdHzYmOJQLvML?=
 =?us-ascii?Q?ds4v4HusRvYrbTPQarRLVtvwgV8fHAtRYLrGe6iI9QaqhIyhhTq3GCYaCIN2?=
 =?us-ascii?Q?iU9nMGFHLY1djVOATmRGKTPB6Xq8YOBamku5vZpvBHX/T8ow5HQUb6Z21SLx?=
 =?us-ascii?Q?ZNXmsOTb3SL9RwfcK3mh3eJXu+Xr3EYSoz+xzb01r3MgpfIs1DTKBbV1uXw1?=
 =?us-ascii?Q?HJsszlBQLQ1HxHszVhVXEjg2JcGvI/Vo3ZuqvfS8IgHTNSiCnfHQ6FDlQXAA?=
 =?us-ascii?Q?xj9KcCHiCimOTfOMfduPX8Ds5B3kh9L6+0rDJ4ZabFv58JzazrSpBy+o1jZH?=
 =?us-ascii?Q?SGM0CvcnQh9h8WrVHiaviObJgfZ5Bmz7jS5pRsO2Bhw/lAOmeoJmRAVHWRjl?=
 =?us-ascii?Q?I2xciGKLlPUeKb4bKuZz4xnlKCdA7K4B+Y4kAV9dYUDk0EdKBLIS6ep7HaMA?=
 =?us-ascii?Q?AhHVD1Vc4qKcoU39TWTW9BNLgx/7fqHsIXKZuDWt6THaz8Ahqpoq9j22CTCr?=
 =?us-ascii?Q?Au0HHWpSLy3t4cBLZ+Mpx91YKloze77vGo4LnSv2hv/15f/julGdaoEOLlBT?=
 =?us-ascii?Q?RS+G5cepSahPgy1831u8YEAuiabZloYXn+iYxhDzHU43/PEmqs1Ic8g/gTo4?=
 =?us-ascii?Q?jrSSYYc2Pdd2AG+5DBkxkXOZlUR4wC4kDzZrH7kgtnS4aRV3DoIKxzH8m0VB?=
 =?us-ascii?Q?cWMi2BR9F4yKg6Ea+8cG1DjJ/AYnsms4uFpwf11/FE5bUuFHKK6IUYIPITU8?=
 =?us-ascii?Q?01KWaPRAz2n9SIF614NbaandX2YsAaIY6n2LFECZNT35d8+TQZ5ZA2kHqLVi?=
 =?us-ascii?Q?ovR1G9hHbJC7Z26lVmGy0RyhD+qDcrDxzkQUuna1ScU3OgMfrNBfMAhEvjZ9?=
 =?us-ascii?Q?ba7u3d3RJeqNCeCs+qFSnYB45H6XvGqswUh/w0cEeFxePpwm/uyWk5N+dGCR?=
 =?us-ascii?Q?V50sz9SlyGn3VI6CTAz89yViPoz4ME+55bC9LPbc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b0aa518-c8b6-45b0-adb2-08dc016bd4cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2023 14:56:22.3003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KRdN1qQRolP7BjRSEGMpHbWbFIjoeN1WV6oKMtJ0h9GWxZ68M8PdHeN02eFUfhUp/vb8Iflp7/CL4NBMMLp7qCKhXagfyCVKInxNRi44nYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6030
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
Cc: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Suja=
ritha
> Sundaresan
> Sent: Tuesday, December 19, 2023 3:37 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>
> Subject: [v5 1/3] drm/xe: Add vram frequency sysfs attributes
>=20
> Add vram frequency sysfs attributes under the below hierarchy;
>=20
> /device/tile#/memory/freq0
> 			|-rp0_freq
> 			|-rpn_freq
Hi Rodrigo rp0/rpn for hdm frequency seems confusing.
How about {max,min}_freq ?
Thanks,
Anshuman Gupta.
>=20
> v2: Drop "vram" from attribute names (Rodrigo)
>=20
> v3: Add documentation for new sysfs (Riana)
>     Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)
>=20
> v4: Create sysfs under tile#/freq0 after removal of
>     physical_memsize attrbute
>=20
> v5: Revert back to creating sysfs under tile#/memory/freq0
>     Remove definition of GT_FREQUENCY_MULTIPLIER (Rodrigo)
>=20
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pcode_api.h  |  8 +++
> drivers/gpu/drm/xe/xe_tile_sysfs.c | 86 ++++++++++++++++++++++++++++++
>  2 files changed, 94 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h
> b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 5935cfe30204..4076a4e9daf3 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -42,6 +42,14 @@
>  #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed
> point format */
>  #define	    POWER_SETUP_I1_DATA_MASK
> 	REG_GENMASK(15, 0)
>=20
> +#define   PCODE_FREQUENCY_CONFIG		0x6e
> +/* PCODE_FREQUENCY_CONFIG sub-commands (param1) */
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN	0x1
> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
> +/* PCODE_FREQUENCY_CONFIG param2 */
> +#define     PCODE_MBOX_DOMAIN_HBM		0x2
> +
>  struct pcode_err_decode {
>  	int errno;
>  	const char *str;
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index 0f8d3e7fce46..1d34912e6184 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -7,9 +7,21 @@
>  #include <linux/sysfs.h>
>  #include <drm/drm_managed.h>
>=20
> +#include "xe_gt_types.h"
> +#include "xe_pcode.h"
> +#include "xe_pcode_api.h"
>  #include "xe_tile.h"
>  #include "xe_tile_sysfs.h"
>=20
> +/**
> + * DOC: Xe Tile sysfs
> + *
> + * Provides sysfs entries for frequency in tile
> + *
> + * device/tile#/memory/freq0/rp0_freq - The Render Performance 0 level, =
which
> is the maximum one.
> + * device/tile#/memory/freq0/rpn_freq - The Render Performance N level,
> which is the minimal one.
> + */
> +
>  static void xe_tile_sysfs_kobj_release(struct kobject *kobj)  {
>  	kfree(kobj);
> @@ -20,6 +32,65 @@ static const struct kobj_type xe_tile_sysfs_kobj_type =
=3D {
>  	.sysfs_ops =3D &kobj_sysfs_ops,
>  };
>=20
> +static ssize_t rp0_freq_show(struct device *kdev, struct device_attribut=
e *attr,
> +			     char *buf)
> +{
> +	struct kobject *kobj =3D &kdev->kobj;
> +	struct xe_tile *tile =3D kobj_to_tile(kobj->parent);
> +	struct xe_gt *gt =3D tile->primary_gt;
> +	u32 val, mbox;
> +	int err;
> +
> +	mbox =3D REG_FIELD_PREP(PCODE_MB_COMMAND,
> PCODE_FREQUENCY_CONFIG)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1,
> PCODE_MBOX_FC_SC_READ_FUSED_P0)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2,
> PCODE_MBOX_DOMAIN_HBM);
> +
> +	err =3D xe_pcode_read(gt, mbox, &val, NULL);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> +	val *=3D 50;
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(rp0_freq);
> +
> +static ssize_t rpn_freq_show(struct device *kdev, struct device_attribut=
e *attr,
> +			     char *buf)
> +{
> +	struct kobject *kobj =3D &kdev->kobj;
> +	struct xe_tile *tile =3D kobj_to_tile(kobj->parent);
> +	struct xe_gt *gt =3D tile->primary_gt;
> +	u32 val, mbox;
> +	int err;
> +
> +	mbox =3D REG_FIELD_PREP(PCODE_MB_COMMAND,
> PCODE_FREQUENCY_CONFIG)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1,
> PCODE_MBOX_FC_SC_READ_FUSED_PN)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2,
> PCODE_MBOX_DOMAIN_HBM);
> +
> +	err =3D xe_pcode_read(gt, mbox, &val, NULL);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
> +	val *=3D 50;
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(rpn_freq);
> +
> +static struct attribute *freq_attrs[] =3D {
> +	&dev_attr_rp0_freq.attr,
> +	&dev_attr_rpn_freq.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group freq_group_attrs =3D {
> +	.name =3D "freq0",
> +	.attrs =3D freq_attrs,
> +};
> +
>  static void tile_sysfs_fini(struct drm_device *drm, void *arg)  {
>  	struct xe_tile *tile =3D arg;
> @@ -32,6 +103,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>  	struct xe_device *xe =3D tile_to_xe(tile);
>  	struct device *dev =3D xe->drm.dev;
>  	struct kobj_tile *kt;
> +	struct kobject *kobj;
>  	int err;
>=20
>  	kt =3D kzalloc(sizeof(*kt), GFP_KERNEL); @@ -50,6 +122,20 @@ void
> xe_tile_sysfs_init(struct xe_tile *tile)
>=20
>  	tile->sysfs =3D &kt->base;
>=20
> +	if (xe->info.platform =3D=3D XE_PVC) {
> +		kobj =3D kobject_create_and_add("memory", tile->sysfs);
> +		if (!kobj)
> +			drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -
> ENOMEM);
> +	}
> +
> +	if (kobj && xe->info.platform =3D=3D XE_PVC) {
> +		err =3D sysfs_create_group(kobj, &freq_group_attrs);
> +		if (err) {
> +			drm_warn(&xe->drm, "failed to register vram freq sysfs,
> err: %d\n", err);
> +			return;
> +		}
> +	}
> +
>  	err =3D drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>  	if (err)
>  		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed,
> err: %d\n",
> --
> 2.25.1

