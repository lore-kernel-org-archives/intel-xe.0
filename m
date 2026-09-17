Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04507C88E72
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 13:54:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF17710E49A;
	Thu, 17 Sep 2026 13:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LbzJddnj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF97210E49A
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 13:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789653243; x=1821189243;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=doC9Ot3cV4O/JcRe96mpNSn0pk6yxcM1jzhNoQZ/5Yw=;
 b=LbzJddnjPWTkRUbl7v6SGhY5ix+Lu27K6XcuY/oWN6FGWZ7zbowLKLSb
 qZ76iR5T+3zHEXH5guSHraQ2JPiUWpFSxeusWbY1sxbEqwTroh7qFQV9w
 x4mb37pvrqZJoXUOSKYQYTv1PQDdmALafcj2giAWbQFvUW7PulmQcpoP2
 00ZxFgLngN+C3QO1GslpOsorBqyDBUMq4UJ5lxnwue+HMOetS/7NR0Ia5
 wH0TqY19ruTX1JoZgQedE4D5QUs6BtA07KSyxZEVLHGv+TQp42kZuYetl
 i2GTOiNMz3C/zv1aA930EJ1vA17ljop0eZ9yO/5mrCy2tlmalevO5Pp1Z w==;
X-CSE-ConnectionGUID: jNUx8QqVTQSBCLjHkT5QUQ==
X-CSE-MsgGUID: O3guzY9kTzKgiZmgXU905g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92586377"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="92586377"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 06:54:03 -0700
X-CSE-ConnectionGUID: Zbp1BFNiQ0y4UcOjnvCPqQ==
X-CSE-MsgGUID: jWhbpod3TSyQZWVvkFJsJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271160246"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 06:54:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 06:54:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 06:54:02 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.22) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 06:54:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6ogzOLexQ/DOEpX4Zq91b0L4RM45mxW1lhrnwsxVxaaln6De1K3r+y51jgwGE/F+UHTo2thD3uuq3PjkduGUyS5y1Zhw3jCN4fveCh5GxMvflrdaqCh4wWAwiyx8TW7w5NEGpP5blr5qaqSoTuN3W663oQSHehwuQTMzIBpB065REv9tnap000pXAtuAEbCqyB++xSsu+e62bk+bJPCEzcMHsU4n0QYlA3xB3fAAqisLfq4pg5u46KF1wFIwUHLZIKT6ufs05UQpelK61/5OEFBXQgDVHyuNwFAvzUqZbgvP/zTaMaFs3927S6g0zXUbZN3r+1puqfcEYP+uDK0qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpXLCvLw0RPnu25MhnJrB1St4O6mR2YgX1wa7HnqT0M=;
 b=lWRlAuBDTn7IpUW2A5z8H99Uu6+FiDpWnwD4sBZAmjU0fYT6DtFhEl37PLSPti9BBcB/KlitdLb3An8fMnhOL+5u/Ii6ZW0yCzihAHg6TYoS4+ULCzjv+EOZGTA84Y5pME+1I04/ZIesYDJCr2I/JesYLtMudCJljSLTqpnhchrDgK+xKwsLIgJSrDA4tufPXsb8Lb0whARTHwebeMaXo/xK3Hdpk6LTYDrRV+qjeo3iNUIXqmMdpDqj9xrBfuL+YrP5BNt4IlDn0rKw2aoSzLxItSGXIwMxVNaYp5NGob5p2Tz4zlLzeWytEAHh11UuCqcULFFA4yZ/2/bA3MKtqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5366.namprd11.prod.outlook.com (2603:10b6:208:31c::17)
 by MW4PR11MB6933.namprd11.prod.outlook.com (2603:10b6:303:22a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 13:53:56 +0000
Received: from BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848]) by BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848%4]) with mapi id 15.21.0406.007; Thu, 17 Sep 2026
 13:53:54 +0000
From: "Gupta, Varun" <varun.gupta@intel.com>
To: "Gupta, Varun" <varun.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH] drm/xe/guc: Demote uncorrectable local error log to info
Thread-Topic: [PATCH] drm/xe/guc: Demote uncorrectable local error log to info
Thread-Index: AQHdRqvXIKGK0D5KmEmkhUroRwbQUrbSyoRg
Date: Thu, 17 Sep 2026 13:53:54 +0000
Message-ID: <BL1PR11MB53669484FACDDE5177287EB4E8B82@BL1PR11MB5366.namprd11.prod.outlook.com>
References: <20260917135121.3590045-2-varun.gupta@intel.com>
In-Reply-To: <20260917135121.3590045-2-varun.gupta@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5366:EE_|MW4PR11MB6933:EE_
x-ms-office365-filtering-correlation-id: 22f2aa88-2f8c-4fc2-4f39-08df14c31cea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|10070799003|366016|38070700021|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: KRjkUjd3q/5NJjUN79qdmKxrhrAdPQKrzdWHyUz2jYMVI6+Y94iVDEAxMkW749bwdZ6uVObrub/4pzk9KGSg1gCvJBiqBwqC9WdeyGjCpPDDBEXHUn4MrHrwVEJo/AeFaZFkVAh7C8rZ2xja13hSNTL2/YGNnLdWS5HAJ+aP7gCzMG/qz0wAZ5bY04MYEg8L7ItCC3q0/reL7/Qf6a/5BQHOSN8aiwgJcrkuzREPFm26c7Q+ArAIxyBVCFKbPKk+KbXu6l2IiA8Ck82SLo3Er7neeeymXvnxsNw+9koud6QhlVpQURffeverY3FjmRE5gsxbQNmC6h1B9SBU1Eow69A/SMzTPxA+82BuyD/lUmb7bsEhCzDpgQyqNFUcTo7wcQbEuGx9ez6cTY4dA9P+vT1lxs2TRT4xjRkHhQII7PZpXCrnWE1j9Ru+B2T0E3UW3AxpCNoAKw5aFsd8UYzqedKZxG6WgCzjCHCBNLteQTIxhTvvSdVqr5y8v/reAwOAOApGivKREZNPRj84L8OiVrcyU342lWZXgmt1TF+g6nFicyU9LztcysTe5OH1DCCDlP0qzKtLtvzrGtSPx5DaglG7CdUJMkHrXEvuNbhvR1IVFsr+JV8pLDlVpWdViNmkcnHVwTc3kuKd2h6uj31zEWQ7O9Tc5onl8qfQIjyeHHZ6HHqzJSUCIkaVfgMZmpzJ/fw7D0SljAzU9TA7rBHKFA+u8zTZV7OCTncY1CLlW4s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(10070799003)(366016)(38070700021)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fEoqi2cJYoRZXmqGKyPgRimORIDQnbFBCpn+V/T8gYTYTa7EAa2DItn6jbBe?=
 =?us-ascii?Q?WvaBFzrexbMMAXL4StyqhB3+OXCtJ6xf3VLaAE7o/z5MR9HEBE86KvlOTNk0?=
 =?us-ascii?Q?cxQC8ph9pP14Qi4WepEQkWNzq5LqfcFNoLacftt7DUhSos11EQCuHN8+jUYy?=
 =?us-ascii?Q?rV/RhtBcNcIDOgvKRgFxg48MokO2FAzK/rxZh4m896C6Okya7J2K0fi5Eehj?=
 =?us-ascii?Q?xi7MzIN97GMDc1Tuw2wf8MGuZPfBylEgI8p5WnjJbiggCFxljXopQgCD8pkD?=
 =?us-ascii?Q?o/UYAX+nbtPTChPoX7UYXRaCwN7weG0H6734OVhqrS0wDvuMwT5ExqbzbIkX?=
 =?us-ascii?Q?RO1qklSQ81v0LmeWkBsERBTyskR3uSGFaB3zJ9I/CNPXhZzNWHqeEg/4/ny9?=
 =?us-ascii?Q?E9cqL4/yNTqxYUb5rksY8buXKXlm/TKHrMzaelVVyIbzE19+BkVC/e6ClEOs?=
 =?us-ascii?Q?mMvjcmp+JbeMBony2K1VrwglSVbAFUBDyoRmNkKT0uOj0ymEoN8kcyCYTIBn?=
 =?us-ascii?Q?hHSZoKugEZJ+/LQbDTmEu9xWrl00++PtEo0q41obJvityHeWVFLuv4YuQQYt?=
 =?us-ascii?Q?vrQejhbQQHH1nVf0lNsl375Yfy6uF5lj0mgevZ0lpEw1n5oMYui8yGC5B5Ki?=
 =?us-ascii?Q?UCPR9NTYRmD2ucRMPKnZhYNgvLyxh9iDzlvsKHp4S5QdeNAAYPiFL1hKiZNj?=
 =?us-ascii?Q?pUDSm+/HoLmYWyhBDQXCOEd8RbDk09AJI5cbgU5HiDbwvufEQYHD2n/pyZPt?=
 =?us-ascii?Q?5GW/Zg1pd9J3N2GwzrjiYlTwVVlxZstaS+In4AmRsYniMnntvACz41UblNW+?=
 =?us-ascii?Q?CGklUXows0/GXsWNH7gGTqf87IEEPtW2vzwvi7sbiDx/nvcF01HOPdrUTDsL?=
 =?us-ascii?Q?74MIetWbnMojziTZC63l8l4HkF/HTsg7ePP0Yf/5OMRTnuoQvZwCVV7RGBEY?=
 =?us-ascii?Q?bkrMAU4AOB4StzfP8OC2fZ8JIrWzkvCtW7zz8xvW6k5WxaP7zfM5QqwouvRK?=
 =?us-ascii?Q?34qxIC+DKj1HaVNqo1zc5EorD3WtlJCStz90x7C1C/7IlqXAtfWzcjQ+RwLa?=
 =?us-ascii?Q?DAyTPRl8TmyiJC2Qx6g7EsqArb/zt03WgTWbPiDcD4seShjGHs7mO12Kjpw/?=
 =?us-ascii?Q?5AmjCXr5YTnZvUJtPmNZRkQvk50+kYMZWeDQfPrSns5EkRJ+7C7K9oXyC5TI?=
 =?us-ascii?Q?yxJ8yMCWiTC5nmaOk3gUYeHf/vdJhKwFonYdJA7EC1TVeC4gmV7hWAshpeXs?=
 =?us-ascii?Q?6wnxA/J1iXZDyk2i78gy7vHNYZBVZFSt89HschZ1GAdQ6Q/7oRuckWsXkTnD?=
 =?us-ascii?Q?WaUxgv6Ybj0MyazQzlGMtoawZebwV+0k6Bcz6FDyLVA4SMMwL7lJiDmjdeoa?=
 =?us-ascii?Q?jbs1crj8F00aN29zMKRFFW0my4xgggWgfBAPzhxWPZp7nSk94MuDkifMzpej?=
 =?us-ascii?Q?bX1HFS/WL8qxvdmo8aM2sCfEm8xr/Usbdlyu7uHo80mMxexlCtJyQD0rTmUh?=
 =?us-ascii?Q?dP4pRc6Kx9re4aHU/D0lGcipxnpZqoupKy0JC04f0WTT/vIV1SYarWPIJX2e?=
 =?us-ascii?Q?KpHydfAK/xi4tSGF0YHLg/PJU/fPcDO+yUg11PG/bEkDI8SCP87Mfqto2aYB?=
 =?us-ascii?Q?q7LlTC/PMMxfPCQLaSPBf6QJdFLfN846B9bf0pHMuYFldpOUNzmuKZ3i/XAg?=
 =?us-ascii?Q?2qHIpSlYiLBLTMvgeXl8qfVCcbthgSPMezwG+Is4LGMvozXbZyk4DoIBzusi?=
 =?us-ascii?Q?By50mmUbkqzXiKQinLwJc1dZrX1Wqt8gOXYROESoDrXeEQLSBfm7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: xUiq+8Ez5Ofr64vcZC6hseTzcWdcDVpP3BVVvOMQtdVBDId+oXMIZN7kBfYI3oRqqkx1++bkEQjPZrc8kPNNZwNhccMI3mtryLPCiD3XDh+muMQiL+FLXHnHMLMwAv3OZQaZhLVeoMk2eeUcnYTYwjsPAlSdIKWD+/lWT2BZ4j+ui7Wr+9m6NbLGH3ngcTcnK0NELh6rDhvGOhb2mYUDYchfcL/HaAhwSsfxVnEOPxW/ryOygrbJmhANIUN86cvzrKqes4xXUFJxCVGI5vWcNH4kzstf9JHA7a/hoDNiN5LUdF9+dnfhngjn1N+JrXmu2mrjy+d7i/Z+zbXkOPMLIg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f2aa88-2f8c-4fc2-4f39-08df14c31cea
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 13:53:54.5898 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WLeOHeuNZ6CYsYeDNbA1P7yHlBItLWJJCwKrLaF1USKIbi1JR0wpRstVMVH6Mjig9+uqLORAPq92VBSKKbFENw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6933
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

Sent V1 again by accident, pls ignore this.

Thanks

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Varun =
Gupta
Sent: Thursday, September 17, 2026 7:21 PM
To: intel-xe@lists.freedesktop.org
Cc: Dong, Zhanjun <zhanjun.dong@intel.com>; Ceraolo Spurio, Daniele <daniel=
e.ceraolospurio@intel.com>; Ghimiray, Himal Prasad <himal.prasad.ghimiray@i=
ntel.com>
Subject: [PATCH] drm/xe/guc: Demote uncorrectable local error log to info

The UNCORRECTABLE_LOCAL_ERROR notification sent by the GuC indicates a loca=
l, queue-level context termination rather than a global device or driver fa=
ilure. This can be triggered as part of expected recovery flows, including =
intentional fault-injection tests.

Printing this at ERROR level is too noisy and causes false-positive dmesg-w=
arn failures in CI. Switch the log level to INFO, matching the adjacent CAT=
 error handler.

Fixes: 4e57574fa3a3 ("drm/xe/guc: Handle GuC local uncorrectable error noti=
fications")
Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc=
_submit.c
index f3ba8abfc228..23ccec0adc8c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3495,7 +3495,7 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc =
*guc, u32 *msg, u32 len)
 	if (unlikely(!q))
 		return -EPROTO;
=20
-	xe_gt_err(gt,
+	xe_gt_info(gt,
		   "GuC: Uncorrectable local error! guc_id=3D%d class=3D%s, logical_mask=
=3D0x%x",
		   guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
=20
--
2.43.0

