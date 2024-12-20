Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92805E77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 16:32:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FFE10E051;
	Fri, 20 Dec 2024 16:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zk3kPZUq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320E510E118
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 16:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734712335; x=1766248335;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rmZpXz3yLvEoM+BIxo/wBDEw9KqqzrV8GCoQH7rKKeE=;
 b=Zk3kPZUqqDx0oXlYS7AvopxeGSTA6j96JLmpO0yHHVxueHCDMtfRXhqP
 3/G5yTkmxoONfInY64XiIhiaPzOVBGbCPG6AeuyMCR7y6xMQJ173vxxdo
 2J3UplRcukn8yMToRQ/tB7Kn07KtKgT/h7lTafbaWP2XDW47MNazz2A5K
 T9tNQtzyY7LiwTKQM5iy+5wiuqFEoCGCM2je7jvXRAmMRjDfwJnI2PZI3
 UBvOeEvjns/h8yfgJpsU5nEoLdJuEXeRQemaEnyon9Nc6aVeLkXfSNOA9
 5oXqRaAxwJ3aMqaZOxNvusQIQznZJtSqSP9uLNgABQHQFw6LoFLobNTht w==;
X-CSE-ConnectionGUID: 75s60yCnSSSvKHlKkz88vg==
X-CSE-MsgGUID: 72lu14X4Qza5jKkSAb5B7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35387225"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="35387225"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 08:32:15 -0800
X-CSE-ConnectionGUID: XR3hTNejQqKXIEMFmQyMFg==
X-CSE-MsgGUID: dKUBSbvLSfCDIIk/NPrP5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="98330158"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 08:32:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 08:32:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 08:32:14 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 08:32:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xObr51NF2PZrsrBJ6fdvwoYxZKkdXXEIv4+KNz8B4ZiKNqXJKJzFejxnOKtCn27NedcU0zjLirGWxJn6IYh8L7jD6RyFBBzHRsLdEhd5XwHzKfLsMvK6Vz88J5/xVg6lhBHIDVyEMc03ANI0ndqcf1E5lFFBOXYjlUJGB5M4a56NbdTsTZKi9IqoeQI+hICrMBacMvzgFE2M7l4mYbxwIuZ88EnGLM6p0r7uDM5cbKGOdp1TpFnyzj/A9BzQQMdkDr5Fc2AUHlE7YSPQqauOkp6CV30LhnCK5LssY/zLdDrXRJ1VCG6CYdN7nyeGwRT4iT2DFYFiv1jbmrI5vLxySw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAt2ZAXDOO3V+zxV9UQZ6Y+vwaFou/I9l6k+W2wfoEo=;
 b=QadrRYqqOV/iFKAjQxs/LXpgzHiGqtB4hmGxzYp5ItOo+bvH214ZnxeQ08qzXJILcFdDpA/v3HgoI6xRn9935D7BpCcBx0hwI77tkVR4roOZc5lia76joNXNr67x49kieMtjGU5fcW4bIWvg+0MUsXeM7ZgpzScWchJJoCkQv3ffNxkHxMAutk3M5hZJ1Vyoh/SihGlrIfVVNe3RPA758oVmgSab2PBHUxtUPkUnHITh8ollMzvshOETZG91loO7h0yHVUd4ONwe2krkwOOY6yIZ+cdT5BVj4bcjWbCl9X4gwelkeuqdzDQx+Lp+FJ1If12iwpsMK5y7T1Q7bCoHFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by SJ0PR11MB6624.namprd11.prod.outlook.com (2603:10b6:a03:47a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.12; Fri, 20 Dec
 2024 16:31:53 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161%7]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 16:31:53 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/lnl: Enable GuC SLPC DCC task
Thread-Topic: [PATCH 2/2] drm/xe/lnl: Enable GuC SLPC DCC task
Thread-Index: AQHbUvQ6/C/40LXNyUKeteqy8TLq+7LvUaCw
Date: Fri, 20 Dec 2024 16:31:53 +0000
Message-ID: <BL1PR11MB5445956D02EF53D8DFC77BA0E5072@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20241220153010.623747-1-rodrigo.vivi@intel.com>
 <20241220153010.623747-2-rodrigo.vivi@intel.com>
In-Reply-To: <20241220153010.623747-2-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5445:EE_|SJ0PR11MB6624:EE_
x-ms-office365-filtering-correlation-id: 64edce4e-6167-40a4-75f5-08dd2113d038
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?idcI5mkFtQ25PSWKgdD9u6D64ZaQYIdoshJFqmm33nmSpZ43dm1V5BB1GrT3?=
 =?us-ascii?Q?sDbX6YA63Pn1LMnEgv/Ft55QISRczjX7yLFoSGMlwWFimbxeIGGn5rUeno5S?=
 =?us-ascii?Q?UnK6rx2JkEu31HYss2JHk4zNzAGf41UASNZBzokb2dvinD5gRxu6sZkYrLry?=
 =?us-ascii?Q?afPzJ6EKFuYX8HPGuRe5XVjpVopEND6Eqi5qbN7bSF/1bHToZr4ev3q8WEr1?=
 =?us-ascii?Q?KC71U1LCuaShpAtcyuc5702UOP40kJBR2OTNKCCchV2OICwFGR0aQI5Cqsw4?=
 =?us-ascii?Q?F1I3jwWxjixf1KEeMneQVr8xv3YCigEr9Mb6Wi9uRX88NRJAUDkW0ECMRa6/?=
 =?us-ascii?Q?PFCCzMZ6aYfZqhkdTKAzy9kWPLncdX8jtRVYP780KSw24NBKbEoG5G9ODiZr?=
 =?us-ascii?Q?0RKIikJuSkGWXOxDUV+H0rwB/Xt7C95LxMZ+SZhj3nW6kgvFkBSiGDJ15uPz?=
 =?us-ascii?Q?duDUjGCLjc+tR6zNUD6j2UMEwEC313gRFalzB4cd5BwTSQ8o+3i0hnwVXsGg?=
 =?us-ascii?Q?6TiUQjMY5MOK8kPnYyXFfS1r6Bsn2Yl9xYvY2h6HLkULXj8vsw7zQX9FcZXZ?=
 =?us-ascii?Q?6byfX8MIz3LiIRxUlWSzyeyoxpxgzpSpGIQnhgyAIcmY7oSlGAoGgPaR8yXy?=
 =?us-ascii?Q?FCA5GM9ghe1C5vMrMjXKXRQ/BhTWRBgNvfQnTqjyhmCJjeQGhCSllMescAHC?=
 =?us-ascii?Q?9HnimRF4j6dANuV1rbq3O520MzqaXqXOLVC8uCwmX+4XmkknuTTJzdhsjbx0?=
 =?us-ascii?Q?r7LGZ6oMbSrThqHnHW7PZVTgIZ7VzbzYREFZFB2mfj638NEJEUTVYeR5g0y2?=
 =?us-ascii?Q?aqp7WI0Wk3bM9eKcrw/ejmagyUfXRVJpF/mLZJmS5A2RkQaPW/bNh4a0ZDqg?=
 =?us-ascii?Q?W68nAEGtmLIg2HGSsLGddT1lnqviKvyS8BBm7BLWPfIu9/3abgxq+pnOQfAY?=
 =?us-ascii?Q?kei530/T09QdfEXE4kZ1Obx5poxj3n+wAlY5PHaWe5JBj++I8YVSeaOfmbFA?=
 =?us-ascii?Q?OSpmgJmefJ3wiZ/rPdpsfbW9l01sh9X1Gh5gQsYPckiQz6am1OYIn67Pne62?=
 =?us-ascii?Q?JhrTL7mxZ2N9Ox6S5aSo+xKI7A7lMe6fyz7apWncVvTRXIFkjUi1YAZ4ibTd?=
 =?us-ascii?Q?bVl70chtglk9hMdgpwSFX5Gb+Vm5lCan4QctDxTyZVOm88ABpd9XcVhJ9nbq?=
 =?us-ascii?Q?CRzeK8s4sj0FAsGFYs5MXnyV9J16S2GWQlP/U+AlWikSTIHRcKlDmhStCOCZ?=
 =?us-ascii?Q?aVQOZYAuwxze9RWWKfFcle/h+JLvgSGV7hDoqpPBNeUz1Nmcz2bSKISKdixM?=
 =?us-ascii?Q?BZmLlfmEgvHZvgTuEkdJtdpsbSCg0yM3WNEENBldg9u8DKi4jgaKoG+dEutX?=
 =?us-ascii?Q?6Alp92z5/mOooUCRHL0Cee9ytZksnc3cC3dNg9hYYEJ1aA/vDdffSqt6IC3P?=
 =?us-ascii?Q?vpTwD0Jcsq9spJU5m09VLzWtvh+FN2HL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SdVZu+PnseRxvBPgx1GdJTcroxFeUVAWX1TJW8MirIxSSzR642SzWW2zZTpU?=
 =?us-ascii?Q?/YQP6VQLPlvhOmzZCd5GrDeKzuzMDCrMWdCPWw/TIY2U9unrSMjUm3McLmbJ?=
 =?us-ascii?Q?A9F5lbXyYXE9HvSF9olI1rSP0PJ4DyZudFAfn0HGlcFzast/d9JPFyBkCRYq?=
 =?us-ascii?Q?LZVXaMfbTDKDNRcse+ZUJMtRJsSs/mLPZtOi1I10xYwuTYzDlCBXk6OTvlV6?=
 =?us-ascii?Q?CvpTPPZwa2+kLAVnF2YQz+hn4ktMBv7+bY3qqxiHtpRWG/JPZnoMhW+HjFOQ?=
 =?us-ascii?Q?kTpRhcdlzJQuUu2+Fls1Mlnm5UP/caMwn/hpySlHo7C+dGZFDdGbiZiAhdre?=
 =?us-ascii?Q?yWsmdHKde7FWb+fOId/3dLYaWbfxmBvJDVNfgT2IJG+KzXzqOKoDvpab2vtY?=
 =?us-ascii?Q?bDG0jrW+IWNLzCf/P2OqTNmLCLq36trm/TxKLgAnQK4e0LG5bQc7XFI2HoFt?=
 =?us-ascii?Q?RD79Xvo/0vgX/oMUMcF3+Jsb7RzWdQTWPCBaDOIgfVxvOwMARd19+aa4hEVl?=
 =?us-ascii?Q?8aHVFVPMtSu1/VivToAz3lID5kwcPdIFT7z/X/a+w7bj4Xh+mLn4zcss4j8Y?=
 =?us-ascii?Q?HFhsfo9ZkbihuxBBih3zaSmHHHpRP2E+jFxZdQZnGpoNx+yuPQbCt7GQs2al?=
 =?us-ascii?Q?56s+teyqAxFzVVNDu66mScYZ1qn8mq1QG+nKpTb6JsAGPbno0OftaHTtnMNi?=
 =?us-ascii?Q?Y6Tv1setxbUnF0GHkfwghSwDqf1Wt6EtY/mOg95rm9CiGpQH7kVBVSpP86ke?=
 =?us-ascii?Q?PdyNlntgtdJcHHVqETV/d1XttsDiMhLkpc7Z8qzgmS40UPGchE7I+fBOUv5G?=
 =?us-ascii?Q?RgjPqTK9F0G51NVHsvWTdPJ+v57V2NCEh49j335R/ZAr+NoGe0vUXYgnwJ0K?=
 =?us-ascii?Q?1qpcs4DGGdQRqPOGeq7mpRg/QpTDQmFhOoYllD6lIr3V9W7LsPyVoZrygS3W?=
 =?us-ascii?Q?S26js/hdsgao4kwREGafCEkPWMpu5U6yfd3jO/KXs1HcGom7BIWptnl92j8e?=
 =?us-ascii?Q?bUVJ+msBhvriFKw7BgkMYcXMWuHQB0V0iE/ctGDOYkerS26ZkyInOJ2oczgb?=
 =?us-ascii?Q?dV1GR6q+V21vR3LrW+p9oa31P1Tg7H0swm/ioZAq7Z/FlTSeXPGS+uRJizqg?=
 =?us-ascii?Q?iKqJooMyTzsAhes3eDsifTDzOG9/E0iJoTvzfTszXQSMWdCYge+L6/BpVssv?=
 =?us-ascii?Q?B4s+mAlCTe9q4HCgFNyBsb5V2X3e+LrLpNbFXcEjFpcD6x5ldUeWQTYBP99p?=
 =?us-ascii?Q?3W9ykI+O2eY+YOJF6BKhJbxWhtWvGoeKGhA3XI+Rf/iKkMmWtKJ3QP/zP38l?=
 =?us-ascii?Q?l+OuvHLyypTRQSRFSPo4hy2FbM+cG2G99aoM+ZXzAxv63PSTK/At1irjgRPu?=
 =?us-ascii?Q?rg7/tkQD2kZ2Bihtp0tSr+fb5bDtLXm1LPvGkt2tJMjO+d+Cbm4TwCuAdRxh?=
 =?us-ascii?Q?QDzhrFgud7DIPT3lQFj0g2pAQ3Rh4Ky39Ge4hPANLCouaBlWZ2BCpicnX5nX?=
 =?us-ascii?Q?ld+Jao4bp8h8oyv/QqzQFf5wQNcKFVRUJ8Q4VWsFEyNwKuaP+u1S26vIX4vC?=
 =?us-ascii?Q?03FE2wFn3eRxiFzQm/pLbzVhqnWS3z4+0sVEPQUA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64edce4e-6167-40a4-75f5-08dd2113d038
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 16:31:53.7912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gIz+eHH5G96xD654RHB4+GWpE1nIb7yaLiPqIEOLxx7SM2xIc+zfNtKPq13hqQfgBxCms4OOZ21EfIvRVuzncHEhjdeIcJxL5Jkz3zD40RU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6624
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodrig=
o Vivi
Sent: Friday, December 20, 2024 7:30 AM
To: intel-xe@lists.freedesktop.org
Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Belgaumkar, Vinay <vinay.belgau=
mkar@intel.com>
Subject: [PATCH 2/2] drm/xe/lnl: Enable GuC SLPC DCC task
>=20
> Enable DCC (Duty Cycle Control) in Lunar Lake.
>=20
> DCC is the SLPC task that tries to keep
> the GT from operating inefficiently when thermally constrained.
>=20
> Although the recommendation is to enable it, LNL GuC is leaving
> it disabled by default on LNL.
>=20
> It would minimize the GT frequency oscilation on throttled
> scenarios, what could potentially reduce latencies.

s/oscilation/oscillation/
s/what/which/
But otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
> v2: Move set_policies call after wait for running state, so
>     we ensure it is not overwritten. (Vinay)
>=20
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_p=
c.c
> index 9f9e0642c796..4233679036de 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -956,6 +956,16 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
>  	return ret;
>  }
> =20
> +static int slpc_set_policies(struct xe_guc_pc *pc)
> +{
> +	struct xe_device *xe =3D pc_to_xe(pc);
> +
> +	if (xe->info.platform =3D=3D XE_LUNARLAKE)
> +		return pc_action_set_param(pc, SLPC_PARAM_TASK_ENABLE_DCC, 1);
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_guc_pc_start - Start GuC's Power Conservation component
>   * @pc: Xe_GuC_PC instance
> @@ -1000,6 +1010,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  		goto out;
>  	}
> =20
> +	ret =3D slpc_set_policies(pc);
> +	if (ret)
> +		goto out;
> +
>  	ret =3D pc_init_freqs(pc);
>  	if (ret)
>  		goto out;
> --=20
> 2.47.1
>=20
>=20
