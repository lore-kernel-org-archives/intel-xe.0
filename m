Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2043DC61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 05:45:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D778610E188;
	Thu, 12 Jun 2025 05:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S5+senF5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E5A10E188
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 05:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749707135; x=1781243135;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DNr8OEZ4Z5jPPgGz+N62/jKVYpKcnuW9Y+uu22qg4kY=;
 b=S5+senF5jOTQsHDYHAUMuMsofRdYQxqJbyYuD4oPr34At2NpsxU88MOJ
 EDU6nFg++eA3a7roZh7OsDpMDXnSiQSQshN59HkZtqQAI7ZiZ5qbHym36
 Hv3BjEifo4Y+USWwVRg5t7CJniev4kwZ1PMPITiBKpFfWgoZWtNDyDNuk
 pYoGZohIpni8tT2UOCvF3uX6DmQKl2QQG2oIPZvN6YeBobTtueV9FRMTt
 NVzUYYqSvHLNBtWXrvmd38UPIdQrHxBNciDNdhAf6/WPZxLoH96ZdyE1Y
 GXONPrbJeAXRHpxaez3dt5e+kLpIoB0yLakIL91LRCP4QWHG6dSZHemI/ w==;
X-CSE-ConnectionGUID: 1TPl2aAcRcGXSL/dSknLpg==
X-CSE-MsgGUID: y+n1IyU/Qw66zvUO3hojGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="63279369"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="63279369"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 22:45:35 -0700
X-CSE-ConnectionGUID: juIIM1v/SQSD1T7VHqM9Nw==
X-CSE-MsgGUID: mVtTPsBaQ5WpyFSOoVl8Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152183636"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 22:45:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 22:45:34 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 22:45:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 22:45:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bsl8vA7TOvRCIoSiFK86sXCV9ynigLCCWUEi8+FPJLnV7qFu8YLOsY1Moynrmnrlmvv8T9NOD2X991mCDaInfrUJRlmBC/Ptx8ZVHf1GX5loSoU/Ewu6asdP/DBkbxQOgkbwjTZaI2/B4zpXbOyUjUhB0cfRIKj0IiFpIg00/h2femcwVFMplzYPW5ySuBVDlZMQPCJn2jTZunR1VU0EyTtPYbQOi8SMwjTyab2ILj4MhZ7F1HofIUqj1H/buK2NAtWrqjkFqCVUYlkC6bmd8Lu9drYtXjJysIdtJ80hdKcFAn6tb7LKv8nUpf02xMfdv59sOpx6hOafMkztaYXxig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTvu+sLxGU1acN+bVLuO/vp+AFYi/8NoqEcGIn41+3E=;
 b=deEfOCBWKvAmUFAnwrlO7LwOcGtW9ZXMyrROIYViel+ddb0NQHGbNK2sRicQd9RLs02Aqac3PHLknf7dauVqMovyFKJ6XZlrw2DjLc0R/5JFzabPBGEJRU+S/8DbA8yN6R67NhZOCLqVdCdvJuGNTIuly3/LbamwhQxSAcV8Dv5+X4N/Uc3xM41cVq1FJlYDz59RXp8W5ANCSEEZxG8zpQ+wur3D5XLO+ID92yx4T7GhXH/GLv2CmwvHkDLuBRBuMPcLd6cJPP9/gGZ8y7I1scf0gTdFPgXM6XYJ5tz0ZE1G4g31jeeCeumGZzQhqIsSRyKLxvCa0Xb9I+ODE2PlnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CO1PR11MB5092.namprd11.prod.outlook.com (2603:10b6:303:6e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Thu, 12 Jun
 2025 05:45:31 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%4]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 05:45:31 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>
Subject: RE: [PATCH] drm/xe: Make WA BB part of LRC BO
Thread-Topic: [PATCH] drm/xe: Make WA BB part of LRC BO
Thread-Index: AQHb20iZ/gMqvklF80C3RVI9BJZQjrP/AsmA
Date: Thu, 12 Jun 2025 05:45:31 +0000
Message-ID: <DM4PR11MB5456A4455DB5D46C8F44E927EA74A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250612031925.4009701-1-matthew.brost@intel.com>
In-Reply-To: <20250612031925.4009701-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CO1PR11MB5092:EE_
x-ms-office365-filtering-correlation-id: 194c3c06-a6e6-467b-bf39-08dda9745802
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?4eFsOp5FjLJSnqLdlsAa9h3g+SwqZqTSvNScv3FgQd9LdXxhZYYflgjBW+SU?=
 =?us-ascii?Q?PR1z1OahRzGxB5zmyKPAvLhu1rzqU/w8u23YpuXV480+8Ft6KrSAOP8+FIAv?=
 =?us-ascii?Q?PlQ8xfoxmEyenTM+Ibj+IEb8iTY2G16w9A4ob9assLp77gleGHo4clYPFHgl?=
 =?us-ascii?Q?SRwNUNYSW7aNgBt7/5zQNlWu8xAMuiCy8Qfr/qxB/6/atMpE6k0ULm3rxt0S?=
 =?us-ascii?Q?QiRumWRfgvxKdMI6O5AMj+KCn59fIzq75shYbbEZW5BZPADCV2z6irYv77z2?=
 =?us-ascii?Q?1MGidE0wsDZxWJVtxipNSII2nD0CO4ZrJlNjNUFCXlbdey1u9+hYOcRcbHeU?=
 =?us-ascii?Q?CQyuP5vUlJCrZDJ6VD4LG9R5ONYpjR28HAcLN5cFC+0RVXAEyUf/PqhAK3Le?=
 =?us-ascii?Q?JcFWZ1WI0GM1zf5hM30kZsdYEKpNeXr1r/fBuPJHxNOUiciXcAVYRvVkJure?=
 =?us-ascii?Q?dyF8j2dCGjsiBnQuSTTneewbVtGL5r1/ImthIJW/bufm5r2lT6TlTUXm2C6t?=
 =?us-ascii?Q?XTz8PNnqkBsNoGCISfJlC25QZtxCxfHUbJtckElK+hbQBqwnD7A1ctYVYdrX?=
 =?us-ascii?Q?rQVQ5O1ZObtLl1kCAiztICz0DUIy5mfbwWz4RwMtGml4H0LM2HbyCOsS0OHh?=
 =?us-ascii?Q?MYutDAGA23jywem0Mq657MQNxm5PnCJYkhqXlVEgBu48uPlHw2P+d9DzCmtV?=
 =?us-ascii?Q?hTJ5eCJRX2pS4ypor0Gi4Zpug1MY//HeQquPnG0b2g5vv0JZJYQzvj15a/7c?=
 =?us-ascii?Q?1EHSFFOguYoWQ7E2pyLmLnuZ7P7DjGG5T61EEQc9KMMXpbmBJP+zKTlt2DFk?=
 =?us-ascii?Q?YL3ulyKKXtMPhPWTeC3e88NHcf9U3pUsNrQxMQY5T2LKYj8G7hg1EIcUIMHg?=
 =?us-ascii?Q?fQMNUfgm73oRF3HzDrIKeTRA/toJaNSu7KZ1LIazYXEhdH9XX56qSIrmIlVZ?=
 =?us-ascii?Q?T8tBC8aUbvK1cwLvbZWxMu4BsIsBhm3z93RPgTbPAhxnLgT4qYVjY7gOklmB?=
 =?us-ascii?Q?5lDLHjWz5t6vt3+KNCjRljGb/QEpvG0f9cx9QNlmkFztUeYto6IXaGkXGNkN?=
 =?us-ascii?Q?lvfr0fbaTiMeBYHmNaq4BzoaoeG7bMYxe73Z6WP81IJ992tLy9RElpDcf5sz?=
 =?us-ascii?Q?IJQKerwq2OHb0VURlznEDyW4OcnEAYDBsDe1WKMpH+CdMfELbkJbq/Hbt+Op?=
 =?us-ascii?Q?VjHO+xVSa00xtZTWh5/9ugwnK4kdezk/R3zbZG810rdVh6XQrBDeqJgTv2Oy?=
 =?us-ascii?Q?BgJ+BBDDRz8OcmK6J+63SpIrmJikpk0TS5LqUjZdRox5djiNWZrxjhZ3TOTb?=
 =?us-ascii?Q?+yfIo5lC+eKnJxaLHzlJpw6UltCJM2ZtzIaw//1GLnD+cu9C8hHRJo3FU5rw?=
 =?us-ascii?Q?0aDMu7Z9sd6Tuarc1OkpYAdJZtwVadnC90NwB1Q4TQvR7Oip0hSGtpcJ/J3+?=
 =?us-ascii?Q?8/SEEqYake7xKa+dXVNg2ZfSoFU6ToSd2dLDEEijGXZl6lWqwUrGgQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zi9u/FWK9Q4MZQuvV4yYq7HwZ3Kg1yMEUOwIT/Ip5MAL+o7pCugC5XQi19Qv?=
 =?us-ascii?Q?nio4COna35/IVaTMN2fxCsnvsEEv/oDQDdTjxPQiPNRrzzGx4s/tvxfx2cuP?=
 =?us-ascii?Q?gjO/LCpMxmbeIUK8IYBXkXlCI3yzwsRIIutFpJXjXlgorJEFwNJAe5vztaEE?=
 =?us-ascii?Q?o7E+CEKzvxFgIID0q3r+rI3r+xVk7bthIq9CyONMntyw7LSbCsguC8xdnc7c?=
 =?us-ascii?Q?FYj2amEEpHrRYB0MES5wXzd0y9tjedJiSHS254GAQ1pj3mMczhpVnZgFjyhk?=
 =?us-ascii?Q?U7LUiCbdr5NNGNW2VTWkB8KeYTA4/iGA9U+Go/pH77ZlQHuYzkhnwpxKLruc?=
 =?us-ascii?Q?KoKGURpxreH9rp7VZr8BO2Z3UsYE1++RmoqDp8kYskMNVqt2TPsT+q1cyrod?=
 =?us-ascii?Q?t9cKPuTd2kqU8hJ6BUIudzzimS8nzPYD+FmzV1oBir5s5qQHbmMc0YMeR6t6?=
 =?us-ascii?Q?zhL0Zf3DX7s2AYiY7S313TgWRtt0BFblyVm8p/ZDjlTGTK22ZW9Atip5pXfx?=
 =?us-ascii?Q?J/AbghAAhMMgD64Bd9UBiMdhw6PzRevWGq3OpABp57Xs1v0MW24bM1GkYtq7?=
 =?us-ascii?Q?Hj15lGGrb45P+rlxrTgaetNGcD86twqSrnH3pmLq8AEg8k1PsFEnOYspAjXs?=
 =?us-ascii?Q?dhuQavcWB1OiPWngdEIbqp6BHDfeM9xIpCsCopMnedXNeQNVJcAFsLRKs2bv?=
 =?us-ascii?Q?YL6wweJmORazNH8HAZZXANIDoFRknAl0/CsYkNOz3UXjR/DMQv/PSMYBXcnq?=
 =?us-ascii?Q?dUNHotvAJmEDOO7XfdQm+2xTMeaAXGX0Oq+wVM9RmSKh6PiSscA0S5YUOEyl?=
 =?us-ascii?Q?85LJp9Kz2RLr/TSVtFuOCfjmBF6WgTlaIre1HgxN8jMJ0d3fSKfqTXlHHcyj?=
 =?us-ascii?Q?gjRAvDhqijcZY2VJbfyLkyWmyTySVDXPjZVkl/avloaKI15EwA2yrco3HxXB?=
 =?us-ascii?Q?X8e95Z07Pv6pKUGuMP1c27CZfbuBMvHQ1nt8SEbQ6oh6y+/nTmy05ZdMlOdN?=
 =?us-ascii?Q?gX7kPkUvYp6G5j+4aJ5tQWx/7Vc2qjMZvPfqMp4+0Mz7Z+SzyXBowcAe/jbj?=
 =?us-ascii?Q?++mkV2fdYx96XCyNNCAgW14C2f5P2llT9uijSBg/lluVSesW9F4Ou883znMd?=
 =?us-ascii?Q?+Qkf1P8mCh90xRBANBCqyEQV2icW1CljETPrPuAjh529OzCVZrqZphP8QANN?=
 =?us-ascii?Q?+wu10Jpj/h/L0/KYUQD1x0ABIHnx0FRBRpcRJ7UgwAYl57tFsyX/kxKzmLSi?=
 =?us-ascii?Q?DrCAmcjLVB38lXfenUMHgn3p8SKiPDmjB6AXoi7x6F8jFje5C4kp49eCrXd2?=
 =?us-ascii?Q?2eAmkKKVwFs40cXYdzV8kuw5NWurMZw7irw3ly4l49Rn2VbjhJ2aOfIM/0ui?=
 =?us-ascii?Q?0fhxMolNEsPp1r3NK5fTRRGN43n6a4c3yVdUB6wE7awAQO/nDWR/8qTpozwO?=
 =?us-ascii?Q?1xkChkEuNTd5uBy5eZmDrpKKPVcFHPFuYU1VsCS7iun14lP62mLbOor+M90Z?=
 =?us-ascii?Q?Z2Ymw4AnSz6UVVJDDjiiaiVAjhLRk+1mw1+kxqCbnqPO8Yv1QUL6JQtQgjAD?=
 =?us-ascii?Q?zsMOKEih7bk0Akm1sLjLENNmjVGknAk5A9Lxm6CF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 194c3c06-a6e6-467b-bf39-08dda9745802
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 05:45:31.3967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bNQg7ZpOUen8Yp85QPbashDLoIB2kQ1TEHNysnffiIMgKquhi9Z6bTJn09jzBLYYThY5AvZewGWGJJo+HrfJYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5092
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

On Thur, June 12, 2025 11:19 AM Matthew Brost wrote:
> No idea why, but without this GuC context switches randomly fail when run=
ning
> IGTs in a loop. Need to follow up why this fixes the aforementioned issue=
 but can
> live with a stable driver for now.

I confirm this patch could solve the issue. Do we have bug to track the iss=
ue and find the root cause of it in the future?
Thanks.

Tested-by: Shuicheng Lin <shuicheng.lin@intel.com>
>=20
> Fixes: 617d824c5323 ("drm/xe: Add WA BB to capture active context utiliza=
tion")
> Cc: stable@vger.kernel.org
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c       | 36 +++++++++++++++----------------
>  drivers/gpu/drm/xe/xe_lrc_types.h |  3 ---
>  2 files changed, 18 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c in=
dex
> 529c6a972a55..a875b93697a5 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -40,6 +40,7 @@
>=20
>  #define LRC_PPHWSP_SIZE				SZ_4K
>  #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
> +#define LRC_WA_BB_SIZE				SZ_4K
>=20
>  static struct xe_device *
>  lrc_to_xe(struct xe_lrc *lrc)
> @@ -910,7 +911,6 @@ static void xe_lrc_finish(struct xe_lrc *lrc)  {
>  	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
>  	xe_bo_unpin_map_no_vm(lrc->bo);
> -	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
>  }
>=20
>  /*
> @@ -973,22 +973,27 @@ struct wa_bb_setup {
>  			 u32 *batch, size_t max_size);
>  };
>=20
> +static size_t wa_bb_offset(struct xe_lrc *lrc) {
> +	return lrc->bo->size - LRC_WA_BB_SIZE; }
> +
>  static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)  {
> -	const size_t max_size =3D lrc->bb_per_ctx_bo->size;
> +	const size_t max_size =3D LRC_WA_BB_SIZE;
>  	static const struct wa_bb_setup funcs[] =3D {
>  		{ .setup =3D wa_bb_setup_utilization },
>  	};
>  	ssize_t remain;
>  	u32 *cmd, *buf =3D NULL;
>=20
> -	if (lrc->bb_per_ctx_bo->vmap.is_iomem) {
> +	if (lrc->bo->vmap.is_iomem) {
>  		buf =3D kmalloc(max_size, GFP_KERNEL);
>  		if (!buf)
>  			return -ENOMEM;
>  		cmd =3D buf;
>  	} else {
> -		cmd =3D lrc->bb_per_ctx_bo->vmap.vaddr;
> +		cmd =3D lrc->bo->vmap.vaddr + wa_bb_offset(lrc);
>  	}
>=20
>  	remain =3D max_size / sizeof(*cmd);
> @@ -1011,13 +1016,14 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct
> xe_hw_engine *hwe)
>  	*cmd++ =3D MI_BATCH_BUFFER_END;
>=20
>  	if (buf) {
> -		xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bb_per_ctx_bo-
> >vmap, 0,
> -				 buf, (cmd - buf) * sizeof(*cmd));
> +		xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bo->vmap,
> +				 wa_bb_offset(lrc), buf,
> +				 (cmd - buf) * sizeof(*cmd));
>  		kfree(buf);
>  	}
>=20
> -	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
> -			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
> +	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR, xe_bo_ggtt_addr(lrc-
> >bo) +
> +			     wa_bb_offset(lrc) + 1);
>=20
>  	return 0;
>=20
> @@ -1059,20 +1065,13 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct
> xe_hw_engine *hwe,
>  	 * FIXME: Perma-pinning LRC as we don't yet support moving GGTT
> address
>  	 * via VM bind calls.
>  	 */
> -	lrc->bo =3D xe_bo_create_pin_map(xe, tile, NULL, lrc_size,
> +	lrc->bo =3D xe_bo_create_pin_map(xe, tile, NULL,
> +				       lrc_size + LRC_WA_BB_SIZE,
>  				       ttm_bo_type_kernel,
>  				       bo_flags);
>  	if (IS_ERR(lrc->bo))
>  		return PTR_ERR(lrc->bo);
>=20
> -	lrc->bb_per_ctx_bo =3D xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
> -						  ttm_bo_type_kernel,
> -						  bo_flags);
> -	if (IS_ERR(lrc->bb_per_ctx_bo)) {
> -		err =3D PTR_ERR(lrc->bb_per_ctx_bo);
> -		goto err_lrc_finish;
> -	}
> -
>  	lrc->size =3D lrc_size;
>  	lrc->ring.size =3D ring_size;
>  	lrc->ring.tail =3D 0;
> @@ -1860,7 +1859,8 @@ struct xe_lrc_snapshot
> *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>  	snapshot->seqno =3D xe_lrc_seqno(lrc);
>  	snapshot->lrc_bo =3D xe_bo_get(lrc->bo);
>  	snapshot->lrc_offset =3D xe_lrc_pphwsp_offset(lrc);
> -	snapshot->lrc_size =3D lrc->bo->size - snapshot->lrc_offset;
> +	snapshot->lrc_size =3D lrc->bo->size - snapshot->lrc_offset -
> +		LRC_WA_BB_SIZE;
>  	snapshot->lrc_snapshot =3D NULL;
>  	snapshot->ctx_timestamp =3D lower_32_bits(xe_lrc_ctx_timestamp(lrc));
>  	snapshot->ctx_job_timestamp =3D xe_lrc_ctx_job_timestamp(lrc); diff --g=
it
> a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
> index ae24cf6f8dd9..883e550a9423 100644
> --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> @@ -53,9 +53,6 @@ struct xe_lrc {
>=20
>  	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update
> */
>  	u64 ctx_timestamp;
> -
> -	/** @bb_per_ctx_bo: buffer object for per context batch wa buffer */
> -	struct xe_bo *bb_per_ctx_bo;
>  };
>=20
>  struct xe_lrc_snapshot;
> --
> 2.34.1

