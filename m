Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DBFC54791
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 20:57:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4EE10F863;
	Wed, 13 Mar 2024 20:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YjkLP2r9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 412C510F863
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 20:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710363421; x=1741899421;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zNWrCmflGFxhbuwBnJ5Z8xbrcZ1IzZXg/fce19wRp3s=;
 b=YjkLP2r9/Ken3voRRp3m27iGs2u9hAiSPdJ0/+RMbrvD2C53I/tfmkra
 vkxU0WNUss2fWlhNAt1ZKYS5JBu/TjORPumnblOKaRrxF16KF9onAr4H5
 ZCte024tZ2UmZW1Ju5NQ0dRENEndNmiIoBLYHrzDnsnC5peCMqWPiTFl+
 UEJbgXg8SliHwQvjL0hIosNlE2bqcZ1d6Afl/DaazJq0qMNQUjL9povW8
 OLh/E/LP87/k9HnRtYnAzCqb0uEp2ZqWp/YalUq7Mqwr5ep4jIec2alQt
 WH3RubAIdegEBIz/VjYit2A1QbuHH1Q9Zt3arW5boe9uHCYJjxPsX1xbe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5022462"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="5022462"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 13:57:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="11950464"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 13:57:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 13:56:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 13:56:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 13:56:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1+AqdWeZZgpcYX3SGKltCy4rEFBsg2Z2ky5sWUGWez9hOv93zSJ+Y7Xg8ZTHa12NF8X1XC0M5Byl5OquGp8WZe9DSHvmCqDoBQJ+BYoJ236obGltkdp9IMJZ+O4s3zXanl+fwBKeb4efypyBOJSI/05+GTPnawoAowdiV+O0XXPbTKGw3rczlQyC7bqrHkQIuABF4RHLyFDoEFx7mr7swE+2O0pG1XTmz/8G5tTF7KBJc6kkN9c1/jsEQuXzqOLQFXrlCdkEeFQKJa9hQZttfWLFjRJ2AGGEVB9yGAZP/uIhV9yGpjR05tiCbBVT14TQ1M4+uONEI76IR2J3FTnzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIvLsrmV0nB3hJVEUXiEKKnqhvOQjG08ZFZVJD403Xg=;
 b=C/tzMhz5Atcb4go20QuzyFzZAZ9agAFIFqUTv2Un8+F7TfFHhHv0HXXqH1XFUE4h9sddfyXALhVwPsDwsvAa91fkgF2Kl7sNpswXNBpC6STNWP0KyigByFw6T10SxjmOAdBP+ivyeP5uQqfgG3h3qDGi1P/aSs5wLktt+eCCcdjp/cmHKcuYFgdjSG3uJPVRSoZjEwvnSGMGXNYNLiCNDim5nq7U4y+kaYwmY883hEjdCrhC2Ya6Bnj2c0vB7+9ZgltXeX/Opc9n4mtpmJ4BmdtzgakoHIHBi4VfIXOpYIhg33o1I494IasHTYCLOA/h+Mn9fAKY3bcLs16ArWHWvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2616.namprd11.prod.outlook.com (2603:10b6:a02:c6::25)
 by SJ0PR11MB4830.namprd11.prod.outlook.com (2603:10b6:a03:2d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.15; Wed, 13 Mar
 2024 20:56:55 +0000
Received: from BYAPR11MB2616.namprd11.prod.outlook.com
 ([fe80::fd9:3be2:214f:db56]) by BYAPR11MB2616.namprd11.prod.outlook.com
 ([fe80::fd9:3be2:214f:db56%3]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 20:56:55 +0000
From: "Somaiya, Himanshu" <himanshu.somaiya@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Teres
 Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Kumar,
 Prashanth" <prashanth.kumar@intel.com>, "Lakkakula, Sandeep K"
 <sandeep.k.lakkakula@intel.com>
Subject: RE: [PATCH 3/3] drm/xe: Force wedged state and block GT reset upon
 any GPU hang
Thread-Topic: [PATCH 3/3] drm/xe: Force wedged state and block GT reset upon
 any GPU hang
Thread-Index: AQHadYBdSD+r3DBw2E6DthYS71K+jbE2JQIAgAABbJA=
Date: Wed, 13 Mar 2024 20:56:55 +0000
Message-ID: <BYAPR11MB2616A38618995F91F7E68B178D2A2@BYAPR11MB2616.namprd11.prod.outlook.com>
References: <20240313195459.141463-1-rodrigo.vivi@intel.com>
 <20240313195459.141463-3-rodrigo.vivi@intel.com>
 <7chi3xtzjj46u4ape5o5uz3mkgqyogyu4egb7772j5mbk5i6z2@glcn273zt7o7>
In-Reply-To: <7chi3xtzjj46u4ape5o5uz3mkgqyogyu4egb7772j5mbk5i6z2@glcn273zt7o7>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2616:EE_|SJ0PR11MB4830:EE_
x-ms-office365-filtering-correlation-id: 253b02e5-2bf3-4a71-b898-08dc43a01dc2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8StvRPKCZ5twCH5/YbqqvAuUj1wmOkTnizgtWrxWsjCgapVZNZh1P/BkfKwgypC6JyE98+4GLE5HdDN6FTGvg3MbRcXrZ22FK5CnixaStDJZIclQq5Hq6jafI1FOB5vaGe952Yq2kkAiFwDt77l+AivnHRZoOKd3PI68LlMs1jPq2C+5u1Q7X7LZWadZ6dyebfES4v+Axg7Q5stqhXXu+2ng2XqqdFEt0rb49mJR3f1kaBxs24rrvFVOYC8EpCYhVcABmy+4XAeR00hebgM9Id9t7b6DtNmLaeT0X+mqgizVpAwsbR/NOHLgZOey1EmJRlp29eUSSqw/VSu/nbN7CX8V5FUStQiYTu5hloxv45HkVdxpjyg31nlYjA+5P36L78Ei31D80ED2LIouzhqAxKvRIaw4dgxXLSvmYIoYFi8LgQVlEPtXzKRf/PUfWR07hobC8M98hNeXhKaiBYeZFiGgOKYZ571+7sRnw+oZGmZOzWlp7z6EokKBxqFr6bP11C+IU3Vb3z/pdCdXVDDoRzxe0ZJ+Sxit1CcsoqWaeQECR4+m4nXDVW9NGOSa+BE6MGxjOkiXXaG/Yt5PFEHiDiCWLDSbe1EU+jy+o5eDpFI3OYZy1rEDUlAOuVTCZxqhqVigBpbEOsCz/WvJcK9kgnKfrWp5zp8r9Hgd3H0E/qqIpMPZ2G1WVqSWV3o7q1l62jFLuv7Gq1bHppyhk9msMPi70G6pfBOvjzM5xYeenzQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2616.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WWhjhL9/EZRXzCRcbsliRRmrfhDqVQXuM83zWfZM5ZsXC6Rs1pEvF2mRSlcq?=
 =?us-ascii?Q?b6IIuwFvcx0DtGi9/1yQN/tTYLkb/sxI4YPC0gWoMSTFeo6x9EJspJCS2lYE?=
 =?us-ascii?Q?+urBIG5HQigaQlVemXKMPuOAiG2uTlTEuxiichYgvpevCgGJS3eCTDQK+ajn?=
 =?us-ascii?Q?Cn3Bnca4SCwnw+POIfd/gKUrk3USs9EpNyLj5Nf7CUHjbcL6CjGBSE0q1HP9?=
 =?us-ascii?Q?2R0u27SC8yh/X6Ys8UDkFMc5dc43ThlNOEXLPWIMcHgIuaVP7O6bs4HTJUYw?=
 =?us-ascii?Q?mUtU84qhvAU+ecPBhcwVzWyeh6Mu8axYVnp9UMDjT1Br0Kmk8tZ1qHmodiLO?=
 =?us-ascii?Q?ISR+sm/ZEI2hlz/hOGbiu4FyJTZwQ2BsTpUc44s4m6tZtuz+ZRcGhRq0vTGD?=
 =?us-ascii?Q?hdjYxWWPnSsu5T+4YlTLCWo7ElXh9xdU7tKJsNL0eNcDeXoccXUDWwobI9cB?=
 =?us-ascii?Q?GdRdL2Zq/s1Xd/M5fKeZF8bPk7qWkc8liDWnOUDFBzWR/53MAKlrZ9wXAkaH?=
 =?us-ascii?Q?SfFCXjkwUl7gBxvNWhrDPVgS8JQlQbY2nVX7mIowelhQ+jFNvODV6dDMoNX4?=
 =?us-ascii?Q?HAFmv3cztv93ekxDUtpM7QjQ3OJDlZRKOiBNusUg0VMhtYqj22OJyKYLcDgP?=
 =?us-ascii?Q?kVDWMFswpU3DLvYOcpVhDeeK6+wMN4x3ACr1+SxUrNldTJfGBSZUUUvS6EQi?=
 =?us-ascii?Q?pDgUSBUea9LyIYgR2dsC7OID9cDN5gOdGY/ixWFdsDyPIBwltBPzca8xgaWC?=
 =?us-ascii?Q?Voc4H+VNJ20KCHyyjtG1RFTFsD9JUW4CsYb3zkBe05vaiET/r/BME0LaokTO?=
 =?us-ascii?Q?3mGWiFn7mpgbsxYwqnuL/oEYpXG4fnGCmnd6MGJO66lozmvHRolLdgZKptnd?=
 =?us-ascii?Q?7D5atHs/e+26C7pM+R9XXmnIBC/9qegyKHL5+1qoUH1bB3MdEyumSJg8oWAj?=
 =?us-ascii?Q?L+S9+WoJFkzW5/mOnpXauv282Phz9LoAU18CC20bo8N41cDGSbVW5UapERY7?=
 =?us-ascii?Q?k6yoQOOE1Ga+T//6VOEC+oihAayW0T0M6+1uJ9isOTVgCFq0YNqVDE4Pks7a?=
 =?us-ascii?Q?uAeDhTTYEv8MSGNxkH4hiTFVXFo9bltfaefxcHDlPgexd7os3n5Zm+XYEuVY?=
 =?us-ascii?Q?WT9jFqV8sd2VdYju0dFjXJdy13G0PTDZlCb5+LIU9jW6yKIsVgLFSxBXzomA?=
 =?us-ascii?Q?RvQaWWvp5m0URA7tHxnuJSbxEBuF5CF/mrxn2STf3B2oQWiwkp6KA4ZHsEgl?=
 =?us-ascii?Q?fD+i62KHXRc6DR2k4dJMjG3aEwLzx/OVOMQkmog9Dc74H676MoRpJRYkm/1d?=
 =?us-ascii?Q?/eCp9KaPVR/9ONUGsFxOHZ4s28AgxxUdXeQZP+NuKr8Eep9Bft6BpmOBA9Ib?=
 =?us-ascii?Q?9i14jvyYPA4klfTcPgiSD1sYreLr6F0f7pqDS+7FRM9xiCsE/Bk/jl+CGWFx?=
 =?us-ascii?Q?wdSVbcZ6l7a6bPkefzFN1QjSA0A7ZUMVP0OLrqYP5bNZzTeK6DHI9gQBCXW+?=
 =?us-ascii?Q?VPTZslxGD4HsU2XOAeITWvF3kJrf6fx1FyM1dq0XbP8o9LmNKY4ZGFQTx0ks?=
 =?us-ascii?Q?6oK50WKJDGuDvz/usyG7hcVVxHGwcFN+kslMkWoIvK13CqwM40IEwD39zmGK?=
 =?us-ascii?Q?Ag=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2616.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 253b02e5-2bf3-4a71-b898-08dc43a01dc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 20:56:55.2375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HARYfVnjzI1KNBokvZ2EOpICDasYQ4uRAG8YqVXV61124sg5beRKOmVG0TvZWpmjqzlM5Ygx4UwuKsJGONH1U4cT0ILG150OJJ7A9c1HHgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4830
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

++

-----Original Message-----
From: De Marchi, Lucas <lucas.demarchi@intel.com>=20
Sent: Wednesday, March 13, 2024 1:50 PM
To: Vivi, Rodrigo <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org; Teres Alexis, Alan Previn <alan.previn.=
teres.alexis@intel.com>; Somaiya, Himanshu <himanshu.somaiya@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Force wedged state and block GT reset upon=
 any GPU hang

On Wed, Mar 13, 2024 at 03:54:59PM -0400, Rodrigo Vivi wrote:
>In many validation situations when debugging GPU Hangs, it is useful to=20
>preserve the GT situation from the moment that the timeout occurred.
>
>This patch introduces a module parameter that could be used on=20
>situations like this.
>
>If xe.wedged module parameter is set to 2, Xe will be declared wedged=20
>on every single execution timeout (a.k.a. GPU hang) right after=20
>devcoredump snapshot capture and without attempting any kind of GT=20
>reset and blocking entirely any kind of execution.
>
>Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>Cc: Himanshu Somaiya <himanshu.somaiya@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c     | 22 ++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_device.h     |  6 +-----
> drivers/gpu/drm/xe/xe_guc_submit.c |  4 ++++
> drivers/gpu/drm/xe/xe_module.c     |  5 +++++
> drivers/gpu/drm/xe/xe_module.h     |  1 +
> 5 files changed, 33 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c=20
>b/drivers/gpu/drm/xe/xe_device.c index 5f0a2bdb7c24..296bc75a55f7=20
>100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -774,3 +774,25 @@ u64 xe_device_uncanonicalize_addr(struct xe_device=20
>*xe, u64 address)  {
> 	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);  }
>+
>+/**
>+ * xe_device_declare_wedged - Declare device wedged
>+ * @xe: xe device instance
>+ *
>+ * This is a final state that can only be cleared with a module reload.

same thing I mentioned about module reload elsewhere.

>+ * In this state every IOCTL will be blocked so the GT cannot be used.
>+ * In general it will be called upon any critical error such as gt=20
>+ reset
>+ * failure or guc loading failure.
>+ * If xe.wedged module parameter is set to 2, this function will be=20
>+ called
>+ * on every single execution timeout (a.k.a. GPU hang) right after=20
>+ devcoredump
>+ * snapshot capture. In this mode, GT reset won't be attempted so the=20
>+ state of
>+ * the issue is preserved for further debugging.

Maybe make it a little bit more drastic so people don't use it when they sh=
ouldn't. I really hate the amount of reset=3D0 I see on machines being used=
 with i915 with the additional patches to achieve a similar goal.
IMO it should be a very targeted tool in a toolbox, not the hammer it becam=
e.

"In this mode, GT reset won't be attempted so there will be no recovery.
Any GPU hang will completely kill the GPU so an autopsy may be attempted.  =
Use with care, if you know what you're doing."

>+ */
>+void xe_device_declare_wedged(struct xe_device *xe) {
>+	if (xe_modparam.wedged =3D=3D 0)
>+		return;
>+
>+	atomic_set(&xe->wedged, 1);
>+	drm_err(&xe->drm, "CRITICAL: Xe has been declared wedged. A module=20
>+reload is required.\n"); }
>diff --git a/drivers/gpu/drm/xe/xe_device.h=20
>b/drivers/gpu/drm/xe/xe_device.h index d10664d32f7f..de3149baf82f=20
>100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -181,10 +181,6 @@ static inline bool xe_device_wedged(struct xe_device =
*xe)
> 	return atomic_read(&xe->wedged);
> }
>
>-static inline void xe_device_declare_wedged(struct xe_device *xe) -{
>-	atomic_set(&xe->wedged, 1);
>-	drm_err(&xe->drm, "CRITICAL: Xe has been declared wedged. A module reloa=
d is required.\n");
>-}
>+void xe_device_declare_wedged(struct xe_device *xe);
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c=20
>b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 19efdb2f881f..987a57205fc4 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -34,6 +34,7 @@
> #include "xe_macros.h"
> #include "xe_map.h"
> #include "xe_mocs.h"
>+#include "xe_module.h"
> #include "xe_ring_ops_types.h"
> #include "xe_sched_job.h"
> #include "xe_trace.h"
>@@ -949,6 +950,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_=
job)
> 	simple_error_capture(q);
> 	xe_devcoredump(job);
>
>+	if (xe_modparam.wedged =3D=3D 2)
>+		xe_device_declare_wedged(xe);
>+
> 	trace_xe_sched_job_timedout(job);
>
> 	/* Kill the run_job entry point */
>diff --git a/drivers/gpu/drm/xe/xe_module.c=20
>b/drivers/gpu/drm/xe/xe_module.c index 110b69864656..61272553f40f=20
>100644
>--- a/drivers/gpu/drm/xe/xe_module.c
>+++ b/drivers/gpu/drm/xe/xe_module.c
>@@ -17,6 +17,7 @@ struct xe_modparam xe_modparam =3D {
> 	.enable_display =3D true,
> 	.guc_log_level =3D 5,
> 	.force_probe =3D CONFIG_DRM_XE_FORCE_PROBE,
>+	.wedged =3D 1,
> 	/* the rest are 0 by default */
> };
>
>@@ -48,6 +49,10 @@ module_param_named_unsafe(force_probe,=20
>xe_modparam.force_probe, charp, 0400);  MODULE_PARM_DESC(force_probe,
> 		 "Force probe options for specified devices. See=20
>CONFIG_DRM_XE_FORCE_PROBE for details.");
>
>+module_param_named_unsafe(wedged, xe_modparam.wedged, int, 0600);=20
>+MODULE_PARM_DESC(wedged,
>+		 "Wedged mode - 0=3Dnever, 1=3Dupon-critical-errors[default],=20
>+2=3Dupon-any-hang");

as we chatted earlier today, I think there's one thing missing. If an engin=
e hangs, we won't notice as GuC will reset the engine by itself.
We still need to pass GLOBAL_POLICY_DISABLE_ENGINE_RESET as a policy to GuC=
 in the ADS structure. This is what I was attempting earlier today.

I was wondering if we could even update that in runtime with INTEL_GUC_ACTI=
ON_GLOBAL_SCHED_POLICY_CHANGE so we can target the debug only to when we ar=
e ready to reproduce the issues and only on the specific device.

Lucas De Marchi

>+
> struct init_funcs {
> 	int (*init)(void);
> 	void (*exit)(void);
>diff --git a/drivers/gpu/drm/xe/xe_module.h=20
>b/drivers/gpu/drm/xe/xe_module.h index 88ef0e8b2bfd..0f95dcd8942f=20
>100644
>--- a/drivers/gpu/drm/xe/xe_module.h
>+++ b/drivers/gpu/drm/xe/xe_module.h
>@@ -18,6 +18,7 @@ struct xe_modparam {
> 	char *huc_firmware_path;
> 	char *gsc_firmware_path;
> 	char *force_probe;
>+	int wedged;
> };
>
> extern struct xe_modparam xe_modparam;
>--
>2.44.0
>
