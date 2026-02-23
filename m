Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8A1EC110A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 17:00:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5176A10E402;
	Mon, 23 Feb 2026 17:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JxgI4sCG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB1310E402
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 17:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771866011; x=1803402011;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aAi2COgJwebY3xYrtdbQhSYFC3yyf5+7tPusmy3MBdg=;
 b=JxgI4sCGU093un//zJZdfUmYWjIbgFDkjLPr4XCko6z+heXrzaX3TXbv
 umAjIJvWLALG2XDtvm8BQbTl9shUtKnH7DOWfzcer2DzfuUGW9+7Zawy+
 EI6XlCyF64bpK6nNh2qvLBByaESBvCd+DR/Q4IloiV6Cq/KU+eo+B4ECt
 O1N4Gh7HpPc1bMFop2OnrAlLvbl71xY5jVhqiLtY4LOm5SxOgnraQpI0+
 iaY9DzHnHePAUlIVW15YpT63rp5lW9MA+njxhyM6U/C9IjE/qxUhiOSaU
 LPwq/4eO+HjhIeKbEMr4iMBYZn6ymtwk1q4DP4ioWHRL6ZT+nJqgGpzd1 Q==;
X-CSE-ConnectionGUID: PGqHwtqCQPSZUtTm+JzXXQ==
X-CSE-MsgGUID: 0lZvU88lScuy62aF7DN66w==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73045419"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="73045419"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 08:59:49 -0800
X-CSE-ConnectionGUID: vX3i7PZ1SIu9N/6I8dggCA==
X-CSE-MsgGUID: onTq8IoTQWCnU15pByXmzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="253346174"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 08:59:50 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 08:59:49 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 08:59:49 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 08:59:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZOyVn0x56jYY+jEHWGCMIx1p4McmCea346UehYE6N6aLAWNx585he0DeXpyoxFhUNDDeEMaENYLTPFp0mua6rPOmjK+GL1/fkl4OcA4Og06xYCFC0RjKGDnkgqhDGQRg+SMTJ1xvl1fJsnpiY2Zy0xNL6EQGK0UtEKX5WTQXIPkfSCxqSTtkCG9j5wQ7KjnK8tHfIVqA01LjfOrl2Axb8nsFGnJHdQynHYJWQ5jJNmu3kvrilRKHdaf87tq75ZXAw3pez7paH7GNycuLYGpmYU1zVN36RFYSo5Q+7mXS387Vqb0jPsxxPPCHCwCh5tZKHC5Zl84MvNSNivaeiWVYeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUSw1xamzM8bPJdTXWfTUQqURGD6YaUSHJNV+km51YI=;
 b=kSDBTb/uIH2CIvwyHjiLt3ycGth+p/Ps6mekrwc5BlTBu4SpeyjC7SJVGfCBupvhBMgMggIX8Dj0nrdpJRZSpwIrYwATf+YXW789bRVf4fAFNrh3rSp+slAGXK4FeN2IauKq+ybqeCu38Vcv/maU62duAzltAdmwPRBKrVHcwIjloTSGgUVJScHNEKhrtIj74HHnw3kOpFxho3lIvuH9d24UgbvtpVVokTulKHr329UwgrK0yFegJetHuV8ibXfF16qWG35MTf5VqQGSd41PIIWYYRECQg58OgJSAS9FVA6XnGAA8iJO7uSYWBYKudnshY8e6XO9fyyqRwzP0SOTyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4675.namprd11.prod.outlook.com (2603:10b6:5:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 16:59:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 16:59:47 +0000
Date: Mon, 23 Feb 2026 08:59:44 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/guc: Accumulate CT H2G retry sleep budget
Message-ID: <aZyHgAwAkptpb5Ah@lstrano-desk.jf.intel.com>
References: <20260223162350.3205364-4-shuicheng.lin@intel.com>
 <20260223162350.3205364-5-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260223162350.3205364-5-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4PR03CA0130.namprd03.prod.outlook.com
 (2603:10b6:303:8c::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4675:EE_
X-MS-Office365-Filtering-Correlation-Id: e6c4bc69-f9ef-4f21-cf16-08de72fcf33f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3jNFSZwg5XYbq5leAx2E6F7lZjJioZFJnzFdGvrttpmcS4y1e1ghXr3lpSo8?=
 =?us-ascii?Q?+Y5YwFUWkztG5/Qq643zvcvsji/5g7e5HbL7DgK6b/TDYtUBI0tfUqCchB3e?=
 =?us-ascii?Q?pX8yZOAiiE+M4IaTkNYsYy1uxU+hKpZ4NPThm/EYQwqe+yZulUV1NCfle5tO?=
 =?us-ascii?Q?9emrdm4CmY4bzm/DOBKkMeuJ+7KxofCCQwoOUDhCJXKWTUg3qSvU+x5bf96D?=
 =?us-ascii?Q?nUddXgOsEAgQtfaKyEucoxoVgnq5T2oVTgXVyV3FARPOD39Aej53K0/6iifQ?=
 =?us-ascii?Q?SOcPLMi0W4d5T5daToL9Pq54Ld4MBxES5IsKuRblFx4lUViI87MA4Tw5JyIP?=
 =?us-ascii?Q?8uJG4pNkAok34tGq/f4UOqJLJVEpGpZbGZuvzk6Ktm9fKNVbPUkGkaEqTvDm?=
 =?us-ascii?Q?uY3j3uzUcq4eC+we8yaJdjAjZcp8LUeLy5hBk2vJ25e8rvOdAHz1NhI0OnnX?=
 =?us-ascii?Q?GMs4aGbRk6L43yXqaRW67fYcaU8OoduRbg0Imyb6SdQTx+9X5BVF6SDP0jNN?=
 =?us-ascii?Q?mwSL2iZKycDnGAAHen5qi1idoCDRnc3Sdm/jlbYWQQg019GIOikbYniWjnuS?=
 =?us-ascii?Q?yRCJBdDmo+2RuTm/Gqs6/7Klb6WJKfQnDTq25vYzCm6SvBIsO1wUeXVCPfqv?=
 =?us-ascii?Q?w7heZ9+3vAMMQWFr4QuqzMMecpg6p0x7Vxw/84CR11+NSXhLznMhdRpnvrfa?=
 =?us-ascii?Q?kbvboxqFKrMJNi6okk6mKr2mQcMsptbwqnO2w7dhBFKJn40iif/8lJZ/ODeL?=
 =?us-ascii?Q?rJDwEhhngJf0baqanlEvwWkoDoDeSRyt7AyxlMAVdKRvp8cAzd3vDv4e0wIa?=
 =?us-ascii?Q?n/drlywRVTqmHr0+HJs/I/cheHHA9HgLXzVkSKzcor0wNeffmlgXw+JNvUL8?=
 =?us-ascii?Q?ha398H08IthmpryUWZZGAhJ+sMOiZMbzJFSIWUictaM0DLv/RSLzUp4xnVHC?=
 =?us-ascii?Q?aK0hXYF9Ii6WVl04WAFRWLnS0DW1z7EURJ1Z1F+MaC4fO0pOQbtPNVK8WNnf?=
 =?us-ascii?Q?IDEziiKEqtbJrAWWqf8ERFRwVXDl34SyJvCSfA8RGHkHvv1LQvXX0N4XyV+2?=
 =?us-ascii?Q?hsQql+KH65m351gXVB/gLJc08y7bPHAlFVipImTWylBg9mf/nNGz9vU5Kf5K?=
 =?us-ascii?Q?1meo3hUDeuppklgTsb6M+l47kFxp0e22zaqnnK2Fd0Hi1MkqHNbUEno9hJsD?=
 =?us-ascii?Q?r0bcy6hCmMaVewsHdc0N+czDThGp5tm81MEUKwJxi5UOLGrVm0iVWD7DRCGa?=
 =?us-ascii?Q?rGfnCC+DBx6RC1VDfukUKPCoND7q0xSXUpTx9j/niLrFnlswkD9B1vvqR9JV?=
 =?us-ascii?Q?VrMWlaEWTX3UbrBAkKcVH/jOUD/ZmkG+hMVypqvROO8+wJUCWzgC2+ZgFr+1?=
 =?us-ascii?Q?C9WwrJ6pQP1MlTgMmiM7CjQqazvgn4s6wmQ+3ZhalJJ/2X45ObzjlNUGvzzX?=
 =?us-ascii?Q?sjl7eVvCDHw//6YJv+aqGfgigaOBeD7CzTwsi7qbs/6q06QDieiemsMP6Dl1?=
 =?us-ascii?Q?SEfP0m/Hps4tySlxRwFIKAff8bfk6G/Qhn6UkvzlhajGpBjCxiPe+dASZCHS?=
 =?us-ascii?Q?ooXJmsoW+f67H5lyww4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LYDLq5hPeWRLZSqFDtbTq3qvLRFM/Z31OVgy+7oj480NX3dO/qeZEFvT3HKu?=
 =?us-ascii?Q?P9vBuyKWNJxYXKOJyYJVlPr66D1liabWwrVQJMV1GSUgNM2m5lJVmFrWBnI6?=
 =?us-ascii?Q?GJrblyjZ8PIIkCsBekTWLcq0vIAkUoKONi7kP4/1awVf2XBfpbaEQWGhWqqt?=
 =?us-ascii?Q?6ZopE+iPbfpnN3Jkv5iPFIpRrR0z51yNn2dBNjXp8u4ur1AeRXFfpHNMAxYZ?=
 =?us-ascii?Q?TxpM4GSPzJUae/CQXV6s8tOk+Nu5ikiU5KMxN/u+GLwdgVnAbEe5XCYmPoZo?=
 =?us-ascii?Q?8i4jL6bG90Syrf0YSPn90a+2eEdFT8IQldkA7iEn323yJJD9+EK/hdN7WTGb?=
 =?us-ascii?Q?b99LVyRANL8A6leFQJp/iGfapH/9JW2i8216wPf8nGu+8OBmZNDBEDnJuLb9?=
 =?us-ascii?Q?cvcz+W0ILn6ri9VKNB3Qkq/VAHATo2uCvu0LstkjxdE3hYic9l8vse2uWVRb?=
 =?us-ascii?Q?0ITqBww0HvF18oRRtJa+NVhyipUFxBVZ850JSfuhS1zPdtD0X8Ub7Z/kYXPb?=
 =?us-ascii?Q?QM1t8apWCWwtIfEbRl/EXsH9W60lR8byaHt1s5T4r8tsnPbVPPfj7IcrWiqz?=
 =?us-ascii?Q?zXlrUIlaNEzr3/Ph4CNdi4m3UrtAZVnxhIgSWABLPTWnTOqBI6NwhArikVWU?=
 =?us-ascii?Q?B+Jz8pTHxj2LY3J4eVx08fZZBtmPS9I2QVNAZLdLS0gv7WI1zgDHGK2C/HkB?=
 =?us-ascii?Q?EDkXUz80kRhPaTEm5u6Josytk/8freNZ3/5X1VgqV8a63VoDxePzt9wFsErM?=
 =?us-ascii?Q?/mUOQ6k/ylqpyhWj9zzE2TJTcqV245M3jwagjdQ3Wb/cpzO3FlpCh5aBqxR3?=
 =?us-ascii?Q?SHTZkKnmm8MYM1jUl+M2kKbV0QTR4coOKKnXx5iE6h9icia44PCgP08ECQn0?=
 =?us-ascii?Q?40cB+Cwc2ShapoT5/rrKytz8Y/oNyzqOB+7089DpYYrNwbBv4PQYGcHHgnJk?=
 =?us-ascii?Q?PegrjGcNbpf7rI1xwoJAp36M8/6YSlXLrWFFv6dt4GRDxCRbG0SuJHKKiEWA?=
 =?us-ascii?Q?dJL+ethLE5N0Y9ChS2xst/Wr7HrE+itHY2VGl1UkDKJ1FFqv5NC118NuAxSm?=
 =?us-ascii?Q?lJN2HmyREa0lmGdVP+0bu7GYkhIDrcgTLEeORQgfA0jDRcm+HUPMs+Y4AJ5g?=
 =?us-ascii?Q?AxFBAMRgBo4NJUOon2UcJ5qIv9voS0klGP8jTYRqNb3sfKrmFvBwrwB+xKus?=
 =?us-ascii?Q?Hqc3La2Qiz0b1Cw7AsnxuoD/TRw4DhSeTSTmNIZ/rRmnQm/RNRc8TsKQ5as/?=
 =?us-ascii?Q?PSp5O0jP0gywjVAn05imp7imvOToDBYVaJ0BL3Qckm9Q+a2zInEkQ7fvVryq?=
 =?us-ascii?Q?e5o7oHGR4QNs4FYBtFFaEot/4ANnU7HKh38omHO3qzP20n0iCouNd5JJhKdm?=
 =?us-ascii?Q?569Ij7jJrtmq7pOx7scaPOPS2+NWCm42MjiBOQkyWOUpAsaPaNTLrtDPil+5?=
 =?us-ascii?Q?RPXDQ7e5jQoFAiYCDeIvjAg6AQ1X4ADJEEwluv+dGI+iMk1i52CXM/4Jcd9G?=
 =?us-ascii?Q?AALCFdIQO0hc/KoUODB+mj0Xtq8FyC19JipuU4g9bT/qPKLS5jcjtvjay2l7?=
 =?us-ascii?Q?3TMsnp1RjrL2pYT6YD3l6T2GJh9D0LyRmrEE/8qr8rQO6lfTC7/EFRdoIAY1?=
 =?us-ascii?Q?YLQVziZT09G0HDjqBz92OFQle8c6S8/v2hvz6uFwxoEcXuX4wZabKnMuztx0?=
 =?us-ascii?Q?18fAv8gg16FZZunCr5uqIcBj5LT6J4avH7JAgjM8qehcH6rNHrREJvmdcuDQ?=
 =?us-ascii?Q?DpQTvsZWvzzz7vJ1Ch7DKfwLfWVqhfY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c4bc69-f9ef-4f21-cf16-08de72fcf33f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 16:59:47.5055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ouo8mRUtvVgNblVeldWXjb+DxpZiz0NckkmQvVMKOAIWqkNlpmeRFCWXvt/8QK3zKIH/9J9+yTmTe1VAJ/CE4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4675
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

On Mon, Feb 23, 2026 at 04:23:52PM +0000, Shuicheng Lin wrote:
> guc_ct_send_wait_for_retry() introduced sleep_total_ms as a
> budget guard, but never incremented it. As a result, the
> "about 1 second" bailout condition never triggers in the H2G
> backpressure path.
> 
> Accumulate the delay returned by xe_sleep_exponential_ms() into
> sleep_total_ms so the timeout logic works as intended.
> 
> Fixes: 943c4d0637cf ("drm/xe/guc: Limit sleep while waiting for H2G credits")
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Ah, both Michal and myself missed this.

Looks like a good fix:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 8a45573f8812..1c37813d2ccd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1124,7 +1124,7 @@ static bool guc_ct_send_wait_for_retry(struct xe_guc_ct *ct, u32 len,
>  						 h2g->info.size,
>  						 h2g->info.space,
>  						 len + GUC_CTB_HDR_LEN);
> -		xe_sleep_exponential_ms(sleep_period_ms, 64);
> +		*sleep_total_ms += xe_sleep_exponential_ms(sleep_period_ms, 64);
>  	} else {
>  		struct xe_device *xe = ct_to_xe(ct);
>  		struct guc_ctb *g2h = &ct->ctbs.g2h;
> -- 
> 2.50.1
> 
