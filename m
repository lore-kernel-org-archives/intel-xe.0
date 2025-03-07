Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F12AC19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 12:26:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B7910E13F;
	Fri,  7 Mar 2025 12:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RcxkENh2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3B010E13F
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 12:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741350374; x=1772886374;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f4ol1u2glJcB0XXGzNf69qbSRaO23fcQtGKkslgHhjU=;
 b=RcxkENh2bw37a983e+7fZDoroJhp/xuRkWzs4UnXxjLFrlc1v66bcHAe
 rzjPTLkaBRZVQckrJ5MfuXw7qwDoWmhQcCpsJG9Wm9x05ANp4Rf/LIn1W
 G/wKV0nVJrC6r9iIHIstDxRJ4bvnEcmctUkSHIRH2e6TXkfOMxl2wL4W8
 KBd7XHb1sM6sn/3IR6wnsLtBgCRmTv+BKPdXh6BIyacZVVpYRgFuV3tPN
 M4iI0ulmqHbXluoVaYKCoZFMum22jntVrwBVtRZ1LKCxDSp2PVMgIbfFx
 m74x43T1QUyU1gR6NGa6Fi60QRp6zsAxY1BH87khMfVBbNXylE49gycBN w==;
X-CSE-ConnectionGUID: yABtuNueSYSglD0sl/h78A==
X-CSE-MsgGUID: EbQ5fQh2TwiC8o+rrWZBxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53038009"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="53038009"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 04:26:14 -0800
X-CSE-ConnectionGUID: Q0RDZG3nQmiR3nG6B7/KqQ==
X-CSE-MsgGUID: BBbkyPLNQE+N8mLVWoQbMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="142541782"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 04:26:14 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 7 Mar 2025 04:26:13 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 04:26:13 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 04:26:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TvXpzfqV8t4GzGiNXvLTfUrKf73mYaE+ccTi/AKEpjUmtPO93vH6NjnSK0IKu1Rf6j9JMdJ4QAmfi5JoyfjC+L/q5TviI5Di4ICjsx8sBLfSMH1uQ8J0RsoimJGLz9eYa8IrtcSdnxfAvjsGFzB/alDju84jrtrttRmJiLnOuJQ0K9R/Dktq6SgVR0XWsti2nUg+m6oqTMWwCGySuK7E927XjSLUxvF6V2OMLBXy2zq1nHEEHT3UzVbrSBNQQzJheRoC9wpOv4909u8/JRhOz/17KfZ+PfjNaKNk+FN94DWg9n6PKkRI70lqiGxW2pQTURdwN5olcHrPgYMBc2uSLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHQgt7Gj3Jh/sIXXRWSTL7vLY/nCQYwvp/7fi+CEnVA=;
 b=xZMtRSf3/+CF7NsQ/qBVTjqPZKeyCcGj3eTT+59z4PGuuTwLIjfKTdckr8OuFn+9WR8rchPhaS2bPwT6yIxxH5HwOWaUkv90enVmJAHL/SpdlDHSkiWjaJQIRFShOTeHSGsHn69z/JcAJBbOYhKMKQd6tY1HQ8gflJOHe9DDO8uNYNYHV204lFlx3nIK1p71PlTrdTqzjBhHwsLU6qw/7a7xF6MA9Y9UKJeAEBMeRwTzcqQZpHtf0h7xnpjtVQCs2yvywLK/QlTkBIhkVpSlEzj5z36b+Ti5Q1/PPS1afzM8yWBV0yMlm6prN5lGS1fr1GeNDFUcVjolc76kq9MxGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 12:26:11 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 12:26:11 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: RE: [PATCH 3/4] drm/xe: Pass flags directly to emit_flush_imm_ggtt
Thread-Topic: [PATCH 3/4] drm/xe: Pass flags directly to emit_flush_imm_ggtt
Thread-Index: AQHbj1Ic5BkBRKNLCUit3YpHWK++wLNnmXAg
Date: Fri, 7 Mar 2025 12:26:11 +0000
Message-ID: <SJ1PR11MB62045B08A498AB0EFA56EDCD81D52@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250307111402.26577-1-tvrtko.ursulin@igalia.com>
 <20250307111402.26577-4-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250307111402.26577-4-tvrtko.ursulin@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SJ0PR11MB4896:EE_
x-ms-office365-filtering-correlation-id: 088186ee-b1c8-4286-4264-08dd5d733eb1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?ONmGdNzOUhPCR55Pq+eFV8By3YGzKk9fbrmELPQt2Dq/SlgK5WXVXjxbGbW9?=
 =?us-ascii?Q?OPsCTLUqo7gLH0wfA2Ne8vr9cp7Yr4CTxTG2VFa9J4/Rmb65KQvu8WQb/QMW?=
 =?us-ascii?Q?3RrlKY4AZLqmjdp2+i6r4msHcun0K7+cY/ooF85m00BvvaWvG6Ke35Z5QUbT?=
 =?us-ascii?Q?+JWxBUNN0wCDAB1qoNyVXWBavHBZKY0/Dqt8VEOh2pfXi/Z0BIsTIfULyV/1?=
 =?us-ascii?Q?99B7RA1HPfUsPKXqf40cNiDUOq2/MprOOj2bqGvywqpjU9J/vvmeQpk4RE8z?=
 =?us-ascii?Q?uqeL/Um4Xfxz3Hgiw9ZKUJelQzbhtsuMNaVNf9qlhVC8swCarhR07zYqkKVn?=
 =?us-ascii?Q?VB6w2KSC/I8ZX0BUShIzcaeziqo/paeXig3mqBOmXSzrewGxccRpHJ09XZi7?=
 =?us-ascii?Q?cNb9epeZTB6vYE5Ysr1MvPzdJ7HSNB1smd2a173pQ3dmypeRrWHYOLA/f8Mx?=
 =?us-ascii?Q?8kIxWQJNGwkXbQqUV9HMfp68msht8L6RQOupPIYUG21k2Hn+TPoRxlmCifkc?=
 =?us-ascii?Q?HmIShes7uHoHgeIOnNLtIdzuurJPDFu+ziN7ON3Y4LvxXqXcq6dnUxm/lS6q?=
 =?us-ascii?Q?MJV6x+tGW+K64q+SSrCAvTLgcbcoYqM4Z1hAtIohyJAU1H0sNRmbn1aWrkKc?=
 =?us-ascii?Q?oKfzsCqKTYBdf/GiigmUNVHJ4Rp9w2LAgvwOwH5wlV1qb80nHbERsijvojEw?=
 =?us-ascii?Q?+UAJpzHeXU1oRYhxfSKmsVWqulWp9uZ4FEumfVr+IAcJjo8BPk5bteBH6Is5?=
 =?us-ascii?Q?g0Hcs/4qD2k33EWlxq1ZRTZzmnGCqMrPyor1SKgr2F5stYYD4WlDTrg/+sVv?=
 =?us-ascii?Q?c6cYKR5CdhEuQGKpB7MTzvIgeGgGY8Q405Tb/MqxmfeiBkpOa6gFPOmomwtR?=
 =?us-ascii?Q?ouwlETHlxBJ4EXVGJTZOkGzEQhagiXM4mqzs5os44MFGEIKao4oNPXqCPsYf?=
 =?us-ascii?Q?jg3gSEqomR9Z+XFEht1dNwioMN7UDTn/vQrQMeytTJ7BVZpUOYtq3U4FhVty?=
 =?us-ascii?Q?uDTZh5Qik5RdpBoZA+w9AcfRSmSqi07sJtDOSge6dVSMSBf2cS5zYDSYe2BB?=
 =?us-ascii?Q?KcZailO1JDiStB9by2ivGHW+QbQ6wTOtLJTPRV5602Gwls+g/0o4YOjjpOr9?=
 =?us-ascii?Q?b/4WskeD82otxGligd8pFIh5L2wnwYOovUNh/h3kcMIG0n8FtAAQjrqUdYtY?=
 =?us-ascii?Q?KRv6aEp5/QmYXm2fQ0B88qvkrLsKXAzOaWoyIgvJOMg78tqnpVA2GeaunVDG?=
 =?us-ascii?Q?Zr5y9DSRSrUbgrqJqBXY2M4atEhLQZy48qptRZ28shDaVqzuhDtW+AAVo4E0?=
 =?us-ascii?Q?m8wkLVoTFHWjCBXUrA3zNN5bUrRPnU42h7ECM/Xkpt+3/iPe7nT+B6bNg8Vw?=
 =?us-ascii?Q?XtlmmGFvEXCsJqzyqSYc8KG+NjMcAhFU4/hdXiZcIyzzShFkW3Y6MsNYAxbn?=
 =?us-ascii?Q?tZa87+WJaGXhBtQVCMThehRkTL3G3coN?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oJbiharYSMHLlnBrEhnFXuVloliD1oYNlmZmU1IwyrdiG+oxMTxLabbx6dsm?=
 =?us-ascii?Q?xqcjBQV+37dv/OpQVLykknVkHluNsPWyWOxnTUpUqEzI0bK1mPDqM4UDGBu4?=
 =?us-ascii?Q?sxebZOCWhH9rghN2n2qhOqb8t+Dp8ESHZoRf5gAA2mmI37r43MTkGcCtd1Q0?=
 =?us-ascii?Q?ZIfaM93jEtpkBfREGROsMj0CJvD2YayONo41DNqPzFV2L3S4nQAUrGh0tC4l?=
 =?us-ascii?Q?YUPE3ZaGi6BLXiGduWCtkRuO3uG22XfiG+w93YOAMpofZ7ce95GlugVnerIH?=
 =?us-ascii?Q?o3OCL6LDFJg8U/XF1ymXdMx2JIazRtEH/zHcOJt/LhKFVfuB6WraqiCqgNjE?=
 =?us-ascii?Q?jILHgvbqAI2LS+eoDCajwThD+Z6vZJYyzC3JWvFGTei74PZs8gDSJGYmngkE?=
 =?us-ascii?Q?InbeMGMegoHABuHKhmoXIWcSY7D/qSpi8YZSUkmesJPnwrrh/HVAlcFhf4nU?=
 =?us-ascii?Q?AjSGlQE+3mMORBtbfwmQ0plAZt6nnZ5XuD562lBCr7YttiBpDjxeTKveuxsC?=
 =?us-ascii?Q?+2kpedFwVEQxsg35Daxv2ZzK+LuWK3ni6OxqQTftX0rwSAQvzPGuDYhY5l++?=
 =?us-ascii?Q?Np5UrTyFMZzJIAHhL3ca7Ky4B4V00uQbYL/HHdfLxMBqH3rna9GItQUt41H6?=
 =?us-ascii?Q?bJF58mGoJPpFU/xzUN1bvl/HZNn5mLFu6CKNmKiDqzVLyMwRadsnBRMKrfII?=
 =?us-ascii?Q?GPmzGjz6hoCwnDnLq/jwLKqEHpfGu5fNerfrbUKPV9ulb/npKWgTaAZQCB//?=
 =?us-ascii?Q?myFyoq3pR+f+unRGbxoaGFoK6nncYUUQcvzVhWwjwqzIVzpsxtXVqksf6kh+?=
 =?us-ascii?Q?dy4KJ/EAyH9oDIwHzP0DriaTSPhwCMs9ZyQtXlSWxHmUqXadtLgvequsIS8x?=
 =?us-ascii?Q?e2eRMXeqnvmFlOykuYiSsLgumeN3Ci2KyY9dL5Jy6x105+FQP3VOoVIfQDEb?=
 =?us-ascii?Q?PrYlkfqHseNOC7iPSxwuFdQEm3Rl7bXO7ot8Vq9Fc7gIxuE7hy21pU+oS0qZ?=
 =?us-ascii?Q?j4e2vh86RL+3UxPRuimmbpVt1HFwT6pPBvOGvhIZyfTejPirxNpzcxL5sNFP?=
 =?us-ascii?Q?58/yKN1Ne5sHYfq+VGLE9OJN8/JWeL5MbFHmT5vjZclyYNsP5i6GlD6Nvbwz?=
 =?us-ascii?Q?HUypcpVWYdgwM198/DHCQYGeLnJX/oJqcizb+SJkoaXOaIr/pfUBia7/Z6/7?=
 =?us-ascii?Q?cgboXAxkU1rSDd4sq3wlPdxJjpXegYzMwVOGbLXlBJ4bDzoDQ5yOykDrgDPe?=
 =?us-ascii?Q?VvZeazRA27Ed6oG9ynGBjT9wGasy5jEMJqLLp6DULLD1cOP2o8Gx2SVHapXv?=
 =?us-ascii?Q?u/toDooQ4xQi2MH55MehHATmFxxotAD3qnE8saOEa2o+f4ngWJkIw2ju+8EH?=
 =?us-ascii?Q?ECXjjteueuh1KFKyO69qJFoYqac75udg9Jz8xX5UvCYUjUixI4uGNh+Bs+/r?=
 =?us-ascii?Q?CLgjjUz+WV/sWoy7Z2fwtG65yH7mXBgqU2To7aaKgmKHTXbwbrq8VJQ2AAiC?=
 =?us-ascii?Q?iGFmVUhi9w5tqAuMPSkJTs4YitF/MKZIdYjySoShNDO+J0q8xcMASamTWnz7?=
 =?us-ascii?Q?7WafmzlokktdChiZtW3BPd+I+YSkqF5KogxItD2/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 088186ee-b1c8-4286-4264-08dd5d733eb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 12:26:11.0836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t0nCo1jKIUjjmBWf3vig4UtYwJk9xsEyNcPka48Bj3Sk7/TQ3iSPrPZYPUL++iD7H/NoIjlnFCOFKdjAyaqBtfghG/mXBT76Xu2e9Veya9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
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



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Tvrt=
ko
> Ursulin
> Sent: Friday, March 7, 2025 4:44 PM
> To: intel-xe@lists.freedesktop.org
> Cc: kernel-dev@igalia.com; Tvrtko Ursulin <tvrtko.ursulin@igalia.com>; Ro=
per,
> Matthew D <matthew.d.roper@intel.com>
> Subject: [PATCH 3/4] drm/xe: Pass flags directly to emit_flush_imm_ggtt
>=20
> This is more readable than the nameless booleans and will also come handy
> later.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 3d1b4d3d788f..917fc16de866 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -90,11 +90,10 @@ static int emit_flush_dw(u32 *dw, int i)
>  	return i;
>  }
>=20
> -static int emit_flush_imm_ggtt(u32 addr, u32 value, bool invalidate_tlb,
> -			       u32 *dw, int i)
> +static int emit_flush_imm_ggtt(u32 addr, u32 value, u32 flags, u32 *dw,
> +int i)
>  {
>  	dw[i++] =3D MI_FLUSH_DW | MI_FLUSH_DW_OP_STOREDW |
> MI_FLUSH_IMM_DW |
> -		(invalidate_tlb ? MI_INVALIDATE_TLB : 0);
> +		  flags;
>  	dw[i++] =3D addr | MI_FLUSH_DW_USE_GTT;
>  	dw[i++] =3D 0;
>  	dw[i++] =3D value;
> @@ -254,7 +253,7 @@ static void __emit_job_gen12_simple(struct
> xe_sched_job *job, struct xe_lrc *lrc
>  	if (job->ring_ops_flush_tlb) {
>  		dw[i++] =3D preparser_disable(true);
>  		i =3D emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> -					seqno, true, dw, i);
> +					seqno, MI_INVALIDATE_TLB, dw, i);
>  		dw[i++] =3D preparser_disable(false);
>  	} else {
>  		i =3D emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> @@ -270,7 +269,7 @@ static void __emit_job_gen12_simple(struct
> xe_sched_job *job, struct xe_lrc *lrc
>  						dw, i);
>  	}
>=20
> -	i =3D emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false,
> dw, i);
> +	i =3D emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, 0, dw, i)=
;
>=20
>  	i =3D emit_user_interrupt(dw, i);
>=20
> @@ -316,7 +315,7 @@ static void __emit_job_gen12_video(struct
> xe_sched_job *job, struct xe_lrc *lrc,
>=20
>  	if (job->ring_ops_flush_tlb)
>  		i =3D emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> -					seqno, true, dw, i);
> +					seqno, MI_INVALIDATE_TLB, dw, i);
>=20
>  	dw[i++] =3D preparser_disable(false);
>=20
> @@ -333,7 +332,7 @@ static void __emit_job_gen12_video(struct
> xe_sched_job *job, struct xe_lrc *lrc,
>  						dw, i);
>  	}
>=20
> -	i =3D emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false,
> dw, i);
> +	i =3D emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, 0, dw, i)=
;

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>=20
>  	i =3D emit_user_interrupt(dw, i);
>=20
> --
> 2.48.0

