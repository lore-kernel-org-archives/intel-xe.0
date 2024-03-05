Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA217C54E41
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 10:43:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902A6112A0D;
	Tue,  5 Mar 2024 10:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MI5UBCsu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52AFD112A0E
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 10:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709635407; x=1741171407;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version:content-transfer-encoding;
 bh=UkA5J+1JjK77spQc77HJSl6b48kYsy2WHrnavngJCIw=;
 b=MI5UBCsuvvKVr7q1qmKMa/CtcoyNeOLdwHsbTM4l92G+LMq5kIhDef/M
 zBn+3OQmfx+vQhQI5WqIJmf88ACs5g7dSbqLyDnrRiGm2G6fggfnD+Q/I
 SnYdC/+/qZPxmoQkR11ShDrFboMiyiDZWHPvThsvSdxH7cvcoK9hIGEZ7
 mTvK87tMAZ8TFnEiy6FmWsCcNl/I+0cLlkWQCvQdE7e8Z58o9tQjz2L3K
 oa1AIeplBP9PEbNnAhN40UYwVzTUpDmTb/yKegT20PDOpNOkgYwmieJCi
 DAVSmj3k/GvGSKRgh3qjcYAVry8kNqyKmPy0vzu98mBYc0ZBfR8I62BAf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4343409"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4343409"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 02:43:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="46865580"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 02:43:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 02:43:25 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 02:43:25 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 02:43:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQY+cfLNTnZymoHNhmVuYpPKpzJ2eYlBrCRp/jYZMaanD5lscXmbSZuL8Fh5HiBZZHLjC8w+VtFw1h3fqk7ZDUN0438DjXiVacPyfw8L0pNwXAKxsdAQjHlnnnpWlwgf+yLPdPW8smfrUkRe+kSHQYBpR4PW8uMKkwTB6tTx4Ka/bgmri/p9eYccRbdc1M+Xn9ymx9wBWOQvKy975/v7L8QGvqXmDoA2iVEPZ19HCIVS4934Y0nGNxObmmcDNv8Lbu+D3F6Y8otejq6G+QfGLhkPSn0/XEMOIw7v3DUHDGLVXsNNY7ldhbste4+3B0LaDzgKljV4ddCKC7Axlngc4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFdjuK1dp8MAWgsEuHOcYlbjBFubyzud/XvLvBDh9tw=;
 b=Gqk26IIpfsDYdgk+/ZhMnGt2QcBHTAhUh25FBGeWLo8bfRHNlzQrldz1FbM+t3uB+OKhIqo4fjIwSoWPbuzZe3aS7OKlVGBC9dxTP4U8PfUKrfp4nQlWyseJX7ZM36RTLSrDmyVo1ZZAE7Swgi7YcGqYyFUVmiGG07kjYSm4lfD6CJJyRsiRTKFpxlyy3aFWSV+/G59VA6rCgC2Yp1Q/KUFkXFySAG7mQnBuXM/MJYZt4nWn/6oOzIzeq9AB85OxkUTYvzw2Zio7AejvRvbGjRd82kE1VaFg3zCmAH/wmFTo8pZqSTn1B/MYEbtXnn4+CinKLe0Tdh2I+BvE8Dt18g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5821.namprd11.prod.outlook.com (2603:10b6:303:184::5)
 by MN0PR11MB6109.namprd11.prod.outlook.com (2603:10b6:208:3cf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Tue, 5 Mar
 2024 10:43:22 +0000
Received: from MW4PR11MB5821.namprd11.prod.outlook.com
 ([fe80::2769:a1e8:3236:e5a1]) by MW4PR11MB5821.namprd11.prod.outlook.com
 ([fe80::2769:a1e8:3236:e5a1%4]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 10:43:22 +0000
From: "Jablonski, Mateusz" <mateusz.jablonski@intel.com>
To: "Mrozek, Michal" <michal.mrozek@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Drop WA 16015675438
Thread-Topic: [PATCH] drm/xe: Drop WA 16015675438
Thread-Index: AQHabowA7d8CAWZAQUqkalb2EY8H17EolsSAgABe6GA=
Date: Tue, 5 Mar 2024 10:43:22 +0000
Message-ID: <MW4PR11MB5821198DB671C89564D8169AF5222@MW4PR11MB5821.namprd11.prod.outlook.com>
References: <20240304233103.1687412-1-lucas.demarchi@intel.com>
 <BN9PR11MB52759A4405794FAB8AE65BC4E7222@BN9PR11MB5275.namprd11.prod.outlook.com>
In-Reply-To: <BN9PR11MB52759A4405794FAB8AE65BC4E7222@BN9PR11MB5275.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5821:EE_|MN0PR11MB6109:EE_
x-ms-office365-filtering-correlation-id: 94d9677e-8d4b-4006-390b-08dc3d011438
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w/ntWFnJZjepAdsxGP1rZ3kUmobSnzBcV0hKX+ugxJ3MRfspUgDH9t4Rk4TJJo9yNXhNy9R5+6KZ6uu4mUt8UPQ2c9InYhsVsCxhWRH+Cpd4kIK26JpMexg6seebj8LlfS9qv9+poSpma9xjq2V8geNevIwiD5okUsckBMs2jhdfWOPlvYUfjvOEzk4kSNNuk51Xyp3eNw4PVaVibrwc03eYgq3dVpkBzij0ZgL9Gi0WbgFz6jQMkCEOVmKmPd54jQbVTcqQXnq45Cv6gcpTr3ZaMFRdPIdkI6Y9WwlFUZyg3JIzJqAspNvlL/0ryZhY2NQli2u8tT7oBhefgJgAZzH9pls9ADP3t+etlo2pAlQZwhF4GOBeKr93Wsv1NkjMSwc9GomlyLRrA/8ieww5oreUjLza5LjfSdkwhl+0fHzoaTnBhn3QPvpDnH9tufnSh428vIZSxnkqZr6eNjY3AwT1TxT6srZcLDXOAyqTJkgZLr1W6exoShdbd+7FV6To0YWyEwDPivZBnnY0GNwd0tzEtbAOWkLJVVYeZ1sJV1fERxlrqGvs1t0EzC0RAwT7c+weSNyzDg5kly/qJdI7J4dVRqLIWHx4oBTxZv4RdffAlgD38ZkhEOPsYGrBDktMN+vj9zMbavKv2gV01FV7XwQNsfMp1qVcnw3ZNJWzfFZq9G3H1VQReUrRRM6vPmFsQ5yRrSLpv4zdvUMXWj4jSQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RIJ5e8HUeH0/iHhDWrUTuk5QWvxiIy6E/2Sslcts6hoh3vBd5XC49mLYA0IV?=
 =?us-ascii?Q?4aEO9EusybFV88A+OHJlvui2cjLyGHAd3c5bbNz/UWFTMDirlKHBySzi+1To?=
 =?us-ascii?Q?Q8LvTuf0ntfcwJ53l2LeH19zNMh6eYD9Z+uHBbecJxewqjmAoixjyhTmd4u8?=
 =?us-ascii?Q?xtKPZZPNzyh7M1wVYkU3B5eOa9cgayRsc1/xIpGpZ2693vv7QP63nn35Llzv?=
 =?us-ascii?Q?NQ6JL8uIbnnSdnSepxDL4+3L8sh/t/Nqay7NYzQ2kyuUpI2TpV+J2mviJZm8?=
 =?us-ascii?Q?JIPI78QbNmIuY0/IuRWL0fObWgfKojncCBziRlTpScpDa4ZzkFyu9zJciWTI?=
 =?us-ascii?Q?Wh82ALxVkNzHHY9zEFwTD7tswPtXbyW4rAXz2RfFHtRLbCN1oOvjMQ8GqWs3?=
 =?us-ascii?Q?GNx1PyFyw/I9ju5nU0WajNjhI7NDAesobe0tlhmj6PqNcq7qpfx0PnuvNu2B?=
 =?us-ascii?Q?KGILFDk1CHBxwU5iLOz9CYj81vH2dJenDkoZ27XW9j5i1pH8rtdd+VeRgT7L?=
 =?us-ascii?Q?FgZf6+JDxdtUSC3kT3zpFaPXr9+VxVMotCgmjIWUUayAVtsiZ9iAed2H0iKu?=
 =?us-ascii?Q?XRXz5exGrwMDJQaF8nZnSZlPbFWGYCJX760gYUu4DYD9nTcsYc70bJMBlLt1?=
 =?us-ascii?Q?uSMS39xXC69X49JC1FVZycnxaMVWe8vBICrLSjx8wnb64SJejpsd3aURMPrO?=
 =?us-ascii?Q?h3k6cJAh3r3ONlE+Lgg7l6Id5/mZwBvOXlRTrlX8JY4HVyJudQIL/4GyaDl7?=
 =?us-ascii?Q?eVC8549tIfJSXM6AAVHcEA+9bTYlV8f6tF/ccnVUOXbfHGJIPT109HZqqg/U?=
 =?us-ascii?Q?VE5Kb5NvalsguLMo8NxUBcqh7Y61kv9/VC/HZe1qLkkQLDKog5wFFyw7jBv3?=
 =?us-ascii?Q?q+7OCMZOLRtqcfz8seskoioVet0Mg21KRVGjJUqSnU1LvdmfV8Yb+7RzyAXo?=
 =?us-ascii?Q?c0TGu/5QRJNL4g6dSKfwMNRTZc+XI+tmt7INVXHGgqvkyHSZTLaSTRAmpNTG?=
 =?us-ascii?Q?1+jwjiioZS9Djlb9dYjqxJB18z0zIjhvXqjZrSVDnDuJ5X/ROhAT9fwb4uyf?=
 =?us-ascii?Q?h6gc3wihKcuYColKEPIVJ9ldhcGeTl49hztQjht5Av+E20rpVG6O246aIwpp?=
 =?us-ascii?Q?pOXcVt0/Z3x/3QdJtiCjhKfXVeg+lDN1C7LjodfJRJpOI/PdC/e0SE9jA5Zn?=
 =?us-ascii?Q?e8Y8cYS3TRwNG8E878a1/gxzp4qCX1kQx7dlhNuJ16KtLnG8SvtQbf0ZE5Id?=
 =?us-ascii?Q?8RleD2M/QdOA3LuqE5VLcrClWfIq2m40biquPPz7KU/ay2CrilMnCA4Cq6+8?=
 =?us-ascii?Q?gHhhjiMF8YaIBdcKgUhvM4sldPqMn2A2z1At+OD9GqtsgMgW9rYvzZ4GzjqP?=
 =?us-ascii?Q?iwRjsCO41/HuKoPAXdBo/QB+ki0s6lQAmugvUO3CN5iJ/VeAC2Pc5X9hfOB5?=
 =?us-ascii?Q?ilon0S5kY8flnigM1OaHcVUGjieJUWJI+8LPjUuggN5CAWhVVqTVxfLWYK2z?=
 =?us-ascii?Q?dmUUjIZtGboa5iTyzJURS6rWDQMxBUIXQO8B0rLz40dQw5GiQi2naSqsiGRs?=
 =?us-ascii?Q?nWWD0t6vpB8jwwDVlztR5Gc63SOFQpRKxorGRiAcfXlFPWBkWnxzM+O3aCkY?=
 =?us-ascii?Q?iw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d9677e-8d4b-4006-390b-08dc3d011438
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 10:43:22.3015 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bJSTnX11XGEQby8D70ZMANrUILGIu1qKK5fqmjUu3y9qHpk/3buuGj9APC/cydv/br8u85BwZ3MtUuZwDBEACd7kzgVvEK+91AGZd0IzfMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6109
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: quoted-printable
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
 =

-	if ((XE_WA(gt, 16015675438) || XE_WA(gt, 18020744125)) &&
+	if (XE_WA(gt, 18020744125) &&
 	    !xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
 		flags |=3D GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
 =

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
 	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE))
 	},
-	{ XE_RTP_NAME("16015675438"),
-	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute)),
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

Acked-by: Mateusz Jablonski <mateusz.jablonski@intel.com>

---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydz=
ial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-31=
6 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu usta=
wy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w trans=
akcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata=
 i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wi=
adomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiek=
olwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the s=
ole use of the intended recipient(s). If you are not the intended recipient=
, please contact the sender and delete all copies; any review or distributi=
on by others is strictly prohibited.

