Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E329CC54798
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 04:59:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A428711212A;
	Tue,  5 Mar 2024 04:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gleIHlGD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236CE11212A
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 04:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709614785; x=1741150785;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MC/d394rznhhETy0QOv50Q528c3mX3dTWBNtj0PooMs=;
 b=gleIHlGDHbPSI7oc7zdibveO+KxpjGY0fPHKl60m4g0UY1klQChmUHlW
 m9k+xOmLwkJYTOmHEnibYOm0+RkN8+WJVJbbt3F5QVFJhZlrTfqbem/Z8
 BzgDWllRJhgjuUoQ8ptq8tSod2XSWSINuo0w3O1sbAp46FqiKckTPOi6b
 YkLor9vle1Q/NpETWQ0mhGJ1aRcZylco/zCXHJjQOJoabZoz1dBH4CuGN
 oGezm2AAg2wHN6JKLNoZF16sb0Ezg5JEMpxX+KdpGGKzfbBy/PrrTJ7k7
 wzZwhXqMtOsVww6NWmUlYszjpNpc8XeX5tnI7Hpje8Wz/bEn82theJPQT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15285023"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="15285023"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 20:59:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9821815"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 20:59:45 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 20:59:44 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 20:59:44 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 20:59:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcMi6rtvYk6CebddEYIqhjJjFkT/a5A6nlH+eGWnPXTp7qVJdBdYpy4YCavUQNiHP/HBqDHa1G3q0F3vUo8c/r+ArPrC1Djztihq4EbPuNK8EjBeNNCcisLSp1oKJCJ0JibOw3Hga2qULUOfr+clNm24AriYxSAQ8MEFzN7T6ZWY83R/vBqAGPhLLbb+V/Z4taYBRyvzj/EUmLuq0w3Ml4oOVhTyOwSSERpiY3RFo3pmvn4h2ycbFaUsFt3L9D/0O6YPnwbmaxVcDC10A8Ev0Sf4ZCAaVSXkafAyMIX7jCfBVmzqKqnDzNyLuzTMjE0+ZfDfP3aw3dBwGWPw6rZdWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wIw238scHJ0On2SgHIVeg99ztgYvrsqpxa7WCeiR1HU=;
 b=hV02W9FRHrEvy1P/KHsh6GHsNvOG4LfHQ8pRSuxOgHI+RRxISnr82MLK0mbvTxuQpDNhpnFykbYd4TpzWQrqSyhEr9iudMFYYnNs/QhtW/X9leQJ0YcVK3SZDGjK50TR3a0aXHsMgJZDe9iZLAlpHGwnn/ZwpeTj274HJzKvRNoqicACuTt0+43ul4AwLpQ/A2mRfntyz4VyV94JIUTxASkBRBPH8/6Yyz1r21BMEB3lItfbEcoDTfcwuzQ6dYxWJQv8x9VGITy5FzfzbvZn2ngLeZdQEP5NJl00UPL8d5swdaJvyqXHuLb/jN8BPu8fmUVIkbVkxtKpBUEn/jHERA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5275.namprd11.prod.outlook.com (2603:10b6:408:134::24)
 by CY5PR11MB6235.namprd11.prod.outlook.com (2603:10b6:930:24::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Tue, 5 Mar
 2024 04:59:41 +0000
Received: from BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::46dd:6e91:5461:35a]) by BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::46dd:6e91:5461:35a%7]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 04:59:41 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Jablonski, Mateusz" <mateusz.jablonski@intel.com>
Subject: RE: [PATCH] drm/xe: Drop WA 16015675438
Thread-Topic: [PATCH] drm/xe: Drop WA 16015675438
Thread-Index: AQHabowAcs97NCUBt0WuUI7qlRE7XbEoloKQ
Date: Tue, 5 Mar 2024 04:59:41 +0000
Message-ID: <BN9PR11MB52759A4405794FAB8AE65BC4E7222@BN9PR11MB5275.namprd11.prod.outlook.com>
References: <20240304233103.1687412-1-lucas.demarchi@intel.com>
In-Reply-To: <20240304233103.1687412-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5275:EE_|CY5PR11MB6235:EE_
x-ms-office365-filtering-correlation-id: d363fb2c-2c24-4030-c428-08dc3cd11166
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TngzkcxmH5yJvOUWLl9kbA9Au9gkZ7wQirxmkJc1GBZWwUL//vS4evbBXJ/nAvq7FFJt1qoY7kbwZKh+Vnv3C6npmCgNTgOGViBl0Hfm2ZhsCGDd9hIGshGLOEwm2DK76IqXRMMGmqz8LRnnetjI67FuQ7rInihq0ZyNNAyXzkeT1wopwkZuYQZSTE4TmImZy5EYo1jgNNCmAjwnhTQDRARK6mwUg9kBIohEjMPtX6vu1d1F1FOZ84DoWUraFATICUcV6853mG20dEaBSn9kIK/lazbnxlwxF3MyEhEgFIgTelzp4fR9DBEvCSll27HtTYbEwhuvB19eCtGkH1brfVt0zU7JA3HFsZtQUfPRJIYpY4qg55QFQ+AlkKCCJXEu4pvMX5BgFuppk5gRe9EjdU5QSZQeD8npXpZewa9LwZvzX+LadXGloCOpGCGhBqk3oEz/N5dFyHEJ30OnbqQ+9eRRXrlqPTC5ZaKr0/hExh8tCD1yrnaGGbPvD7+mMq5RKRbfE1Yy1zRRIY7zUsBPAq/cBhNY5QbqD1iVaYXUWBBtqBQHZ/kmYdr1Hk7bziSIab1qRNa+Rhk+/FmiHDI3Ff+pjESwb3t5oUepJhSSOKI6lUT1Sx2HTgX+aLbKcNc4fJtlzohaeveOQo0Xqrtj7wopmuXY5S7zdjaL5NlVYwm4jfdP0sGfNQpEnU7aum6SMAuU6KMEQ/bisWBau5ulsg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5275.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hy6w04nSaMPX9GyrS26Wd7SAywF66PpMdmkYjeE8lflex+QBZObAaIwr2eOr?=
 =?us-ascii?Q?7L66x7M359Xytx+pRGtd84EGnuOdiV8BoCLBN9PLC4cNQSFVICXxW9v3IhM4?=
 =?us-ascii?Q?tmB8bYpfcFG47dH/akHRhL/nUo/P3gPBRFq3siqe1j5+uyRB1lmtB4HfPkb9?=
 =?us-ascii?Q?oKVd37RhZK70dZW0qiSmopcBRUhv7yZWcg5A7oWWEZeywyT/+5eYhvzJf0P6?=
 =?us-ascii?Q?YAmC8/dgMoehLagc4dwsaOJLEUsEKowbHWkTlyUNprzL+6dnWXSGPK4m6jFT?=
 =?us-ascii?Q?fp2cxCtAyllI/4BBMZyDGdElfTyPb1sq0K2OGihSyDrHzb77jIIbgdjmbh1d?=
 =?us-ascii?Q?BoYZk0NSXhkwHUeac2hYy8zlkTDGmEmuY9CjTbeYZ8wou5cv0HPJR2v1UNmz?=
 =?us-ascii?Q?5EgqIAWk7c2KzBbfrJvsZ/VKdbbi9JCno5QucKwjgSukGUe6YeOS9RizLr2B?=
 =?us-ascii?Q?4itJ6IPvUCnZT+fL/YtzM7vTW1fKuvnOZjYjQXy1chpRvIJwwpaubmiJlNlD?=
 =?us-ascii?Q?WUY1VfeDyRnge8QXTw6yTD8iWK1gkLBfVvo9TGjYFM2evDD4Grg0kBI9Ri3j?=
 =?us-ascii?Q?nP2pT3qbLS1oMwgQ1NTO/Iec9cTpV2Qnbdms9BBQUhOTgMMQ5lo1Ly8N3lyJ?=
 =?us-ascii?Q?RLZ/us9czcRG43nh6oTCEOrX0EPPuCq+gvJfuougvvJ76nTJC3+/cFex894Z?=
 =?us-ascii?Q?4iqrDZsyh+eXnsLvH2ml+44UYo9NxOoBfxloWTQYN1/iglzhsQZ6wXgQ1yfn?=
 =?us-ascii?Q?nIIwIKkeXBaJwhi9q1hu7vbBm88YvzBHRNVUOPActpHTnv6ShUlK2x/ioyA+?=
 =?us-ascii?Q?ho0EojJHhCBNSnHYj/3cQ4Q6Ydxb0e7UFKgKHaHi+2/O5BHfw+GYq21x9+WG?=
 =?us-ascii?Q?IcKUGdtDVyf+d9RnIsB6yoUOuupOHS6+Jvrjuj/hYlNIcin4mrcBPVMb0hXI?=
 =?us-ascii?Q?T5llPRcyrMoGc6f/KA59mvcFvefYtiiClvhv1mv0EJ+qgmQmxEu25X68z92w?=
 =?us-ascii?Q?JLxar8t1P8U13oc07JrPZYuIMnWEhs/cVMT8n3hUUxD0aqQ9Hg3uFSsCtUP/?=
 =?us-ascii?Q?YsRdG/QOOFUhd0htzLDHWY4KlsKlucKjqaQR6n7XLQMn/dji0yaD8oQD8xVE?=
 =?us-ascii?Q?G/x7LEjucq5e19Cv6q4T7tGq3x8+cMyuL5opBbtXV4Gvd+AJ8sNTX3ShSze1?=
 =?us-ascii?Q?0Bw73Qb84iD1enYeOoxFMcmyacgUf2pDseIy88g02ZU6PlhUzlEfdWJXlHcL?=
 =?us-ascii?Q?6UQc/X06vO/LFXlzoynW8xLoMj+8SruK5rlblxL2RZcEi18LCVQDbTSaQ4n4?=
 =?us-ascii?Q?KJDxbxuqNO5NQblDhwp9dAcFfPBqlVzaO7eF7H/l6N6uUmWwLfUg423xUqCa?=
 =?us-ascii?Q?TGdSb2YHYUGxzhrUJZ9KrMjbMOrYhiOHcTHKbD3sYByPRfNgvMQndcHBDD/v?=
 =?us-ascii?Q?0iUdT/Xm58o0ZBI6G4Ti+NN6TnD4UXlx6WNA1Z6x3BNDxEWfX3k+hjIZff+d?=
 =?us-ascii?Q?lq8j3GHbZa2XntuedG4QiWwM+ESYSO50wSoGizx5uNCYQetYnxtJqK7lION8?=
 =?us-ascii?Q?2fXHOTOJEq7fC1JdOXMlUKsJKyLwu+jtYa0dUOoN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5275.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d363fb2c-2c24-4030-c428-08dc3cd11166
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 04:59:41.6970 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HcBoXJS+mETOa4HRpo4L5HQoD0RsLkTNRbZBPgXcw1JRMHwInhWXbqZ8/dvVm3TvIWx4/Li/kqT1yF/JkQi9Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6235
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

With dynamic load-balancing disabled on the compute side, there's no reason=
 left to enable WA 16015675438. Drop it from both PVC and DG2.

Note that this can be done because now the driver always set a fixed partit=
ion of EUs during initialization via the ccs_mode configuration.

Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c        |  2 +-
 drivers/gpu/drm/xe/xe_wa.c         | 11 -----------
 drivers/gpu/drm/xe/xe_wa_oob.rules |  3 ---
 3 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c inde=
x 0d2a2dd13f11..caa86ccbe9e7 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -164,7 +164,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	if (XE_WA(gt, 22012727170) || XE_WA(gt, 22012727685))
 		flags |=3D GUC_WA_CONTEXT_ISOLATION;
=20
-	if ((XE_WA(gt, 16015675438) || XE_WA(gt, 18020744125)) &&
+	if (XE_WA(gt, 18020744125) &&
 	    !xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
 		flags |=3D GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
=20
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c index =
a0264eedd443..b972e281d891 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -328,12 +328,6 @@ static const struct xe_rtp_entry_sr engine_was[] =3D {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE))
 	},
-	{ XE_RTP_NAME("16015675438"),
-	  XE_RTP_RULES(PLATFORM(DG2),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2(RENDER_RING_BASE),
-			     PERF_FIX_BALANCING_CFE_DISABLE))
-	},
 	{ XE_RTP_NAME("18028616096"),
 	  XE_RTP_RULES(PLATFORM(DG2),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
@@ -383,11 +377,6 @@ static const struct xe_rtp_entry_sr engine_was[] =3D {
 	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute))=
,
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE))
 	},
-	{ XE_RTP_NAME("16015675438"),
-	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute))=
,
-	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2(RENDER_RING_BASE),
-			     PERF_FIX_BALANCING_CFE_DISABLE))
-	},
 	{ XE_RTP_NAME("14014999345"),
 	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COMPUTE),
 		       GRAPHICS_STEP(B0, C0)),
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_=
oob.rules
index b138cbd51bdb..48cdba1cbf95 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -4,9 +4,6 @@
 22011391025	PLATFORM(DG2)
 22012727170	SUBPLATFORM(DG2, G11)
 22012727685	SUBPLATFORM(DG2, G11)
-16015675438	PLATFORM(PVC)
-		SUBPLATFORM(DG2, G10)
-		SUBPLATFORM(DG2, G12)
 18020744125	PLATFORM(PVC)
 1509372804	PLATFORM(PVC), GRAPHICS_STEP(A0, C0)
 1409600907	GRAPHICS_VERSION_RANGE(1200, 1250)
--
2.43.0

Acked-by: Michal Mrozek <michal.mrozek@intel.com>


