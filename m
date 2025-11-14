Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B275CE8D4F
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 16:39:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA8310E24D;
	Fri, 14 Nov 2025 16:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bi9G5IuE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6336610E24D
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 16:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763138364; x=1794674364;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rtSA+KFtHatoJW3WDficlZy3s1khIRwNWKnK/vAKoQA=;
 b=Bi9G5IuElLC9Z0sgyUrNuB4RNz16Qov2NIinyAe0pH82PR7YU/5TFpTD
 Tmq+rZXCdtYPWw53J4lWxZA7gHF6F8xIUBWcj0boyWCs3L3Llztl0zZSd
 zT+uJ+ZWyNM+k75Doxv7/z3SudqLFn0fsx7kbRAYi4mpKaYgoawcwanM2
 oXtbHCeemd/ISDCidx1QXWdp4YD+Z2ib5fanR7LqCA3sLuYKH8innaZbv
 aEzle5Y0AZnYM+wYg9eIxSrsTEb9E+HuSyDoY+yRzORyZGO5LgMQ6X6v2
 JBb6czjGL1mBKtrmb0MPPCSj7CHjaTr/k8UJYqgUj4UHvTlPCrMYGUKGI g==;
X-CSE-ConnectionGUID: s0+R3E93RK2J2EjJLGX1wQ==
X-CSE-MsgGUID: qFLQxLx/SYSYszlyUfO0eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65139363"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="65139363"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 08:39:23 -0800
X-CSE-ConnectionGUID: rrqnruYXTaa1w5ymYHh4TA==
X-CSE-MsgGUID: PSkuZWkKTlSNv7I4mdlYEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="194115568"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 08:39:23 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 08:39:23 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 08:39:23 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 08:39:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myZfgtJ/o2GQ3YcE+4fMnswUkS81Pue8H1iVCiGCPPLx7zqY6kMcvRks+jg6Y8NZblf377tcXJKbhXuTuQxaWuFJo4hi3VtWL452dOlTX9R87p6KqimlyPbdfHqfZyGlZdxN7Q4qMai/U8wQ736nWREJOVGwZWAaS5qNGUT6f1Fib7mTMQsarIYuz8PqIywFapK6UQvvZJ9BmQfxXsAxEkxI4zhDi3/0jaJ7JA5RET7XbhldBOuKFwxrsrCwQUCfAEZ4mVTyfneoeSvMSk0nmB6FPCu+tjyCJxZ/Bj6hCRGqALus6hFgVWJFgThUOC3A7Fq6RXeUSqWPxHFaNm3dSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4YbXG13Qq3SOPtciDOBQelJAaodrJSEERp+gg7ExaU=;
 b=ZwSTtfYFt5npX2Y3T3YsEwAfFnX5CEbtxlhL1X48j8/1sBi5dKh02OmFBINwq7UaS11ZuYcLM/TRwCW5W6HGopDZzGlpl4tAwUQO+RvMBNOjRoV2A4SHu9Fuv7M9slDBzZ0umqH5rbPadR6b8NoUUaVpUJD2oo8w9i1aJKc3OpzhsDYQmnIK9XTpvvduz2arElWUPBxxzMvVQi6BfktaovwpFkWzdI9tnFsr8G0VCKnZcDBt17ip1lv6U24hhJdzl4iJuBUQAVOGADRpmj0OVOrhK+oVVBJsSMfdda9AiFMHMqhYqDbcpfdfJjPmi1B3sF1+GUeUE2qs+ljblSwvcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7773.namprd11.prod.outlook.com (2603:10b6:208:3f0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 16:39:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 16:39:16 +0000
Date: Fri, 14 Nov 2025 10:39:13 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH] drm/xe/kunit: Fix forcewake assertion in mocs test
Message-ID: <qdbhgnsiknjpqjaliztrpokasvv4g4unbnyu62p5bxgyibowwz@uza4yrzk4f7d>
References: <20251113234038.2256106-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251113234038.2256106-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR11CA0068.namprd11.prod.outlook.com
 (2603:10b6:a03:80::45) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 11e93435-b5bd-4823-0e0c-08de239c597f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jMNmLlCShJDdzWJUOHB1edW/k9YfwzA8RnTl/54ORgTz+1+hQSvZGDnaF8Kd?=
 =?us-ascii?Q?bgyTuFo+cqQ1mu3w+rLTiLGrHneXCWWfWGEJwegOcsLCQhxkCKd/2XhWaHd+?=
 =?us-ascii?Q?gQ13bMXQrXbgEs/Rzml4kw0Dv/MSjn8WQ6EEss0XCBeip+DaEWzWmEvq/Jul?=
 =?us-ascii?Q?1o/7l5KzeG0c8eiBhJ4G2/kEY0D462ys0+NgWXJyi9ijM118fUnVHWBG3Tqv?=
 =?us-ascii?Q?3kbe0r9NzUyZ5MKTixELLhJCxP283cEMjhnTi6wGyML+1rQeMhDVv2TqcJ/Q?=
 =?us-ascii?Q?81DVvKwMDGyuNNssxROMogrXW/xhuIxHYLGG8ywAPwDRwDYnS8GvEbb/GOm8?=
 =?us-ascii?Q?xapN4RkxS2O4F/E6NaNrxbQL2kriiNdD/0yF5Hs84itZWDltOpLnv1PQWycb?=
 =?us-ascii?Q?Axk7+Rqf3xIFqlrJg3hrDmfT3VPd050EdTfiM6P1k3ccbn+QsSYjojvdnSEi?=
 =?us-ascii?Q?Ylx+9CO8/lXCANqJ8taIpXbsfus1FSnS7fM5ztpO0BEWBjbWsfGFscfE1Xt1?=
 =?us-ascii?Q?6I8YgWhsmPDnxoCGWeMA6PWuGRjywofKsTe6LVsMpVi1DbzScm+N1B94Yi6k?=
 =?us-ascii?Q?e/Tn6d14pCDKnXctFHouaKnfQ0Pf6lAVTH/QPg5chpox1BMSo8VIZNqtVS0N?=
 =?us-ascii?Q?v6ToogGA1clb4wJxF42+CK1mVyqFGB5+JEqe6MnNYN4P3mO+vS5rUE1CUcCm?=
 =?us-ascii?Q?EsNzKHy3l3cVe1eMPvwE9D2JVSgMNiDMKhfEKxgnhXtOuA3uttHvsnr6BFNP?=
 =?us-ascii?Q?BjMmnir3dRDsKip2/kp7lxDZg0KVoG1CNm6FMhInJ/fxVQpK9i6FofuIvuNR?=
 =?us-ascii?Q?uIHRUdb54Wv6nblQn+j5n/hyO+J5SYsRvMSc0V8TwMR3Di8bJ1hJ1ZaIuSNU?=
 =?us-ascii?Q?rDxUW/BmLxqbKexIyVAAwWBB0k/u6k0EkDC87AtERR+5zckIm5rXxpE1qlR0?=
 =?us-ascii?Q?gy5lV0PWhbVUsETM97RxPdMC1SmnjEQhswTJ5/ENgEgb4Wck3Pa8WIEUXqLM?=
 =?us-ascii?Q?PPNNb1GieKbNeQae7uTTgH0+z7Q86wMS6/nNeC0IoNS+xvf8c2lF4HhPo8Tw?=
 =?us-ascii?Q?8MjTnln2vYemsSBb7BTCpiD1eq8ULyNGz/a42o5T5y96nUnPwrN9R2j+cMI1?=
 =?us-ascii?Q?avfyDVzWtdHps9l72BNbRf82bPwZ6diaXWo5PtXRYsGUo1GJunzgynY66AAd?=
 =?us-ascii?Q?mBvUy1L59OTAQgG2V475J2axJeLCSJ1n61w1qzkSxp2n3P9wLnhL568vKc+B?=
 =?us-ascii?Q?87+0Qlao/S6cbvmPdA0X+78mh5w+M/up9i+z3iozpTDTCzj79dFwAhJtjMkM?=
 =?us-ascii?Q?v+0NznFWKxYtS0vp+vCG1PhWJX77HVKXPrjb/1uUVpzD6Soylkc7ngScMJHc?=
 =?us-ascii?Q?93O3Uuizzeg6S8lJdULsM3tbuBWzLX3NM2c4CL9HaJwhyG/Nt1fm/Z+4R0Ad?=
 =?us-ascii?Q?VQ1Jyt7fOiz+sNTJgZqhZBfxp+Wdu3mE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HuzhnRwaGU2Z1oSYqUzNxM9+9zay5NXAyddRaHsjJ5btJlcLl6DDXEq4Sjlb?=
 =?us-ascii?Q?oWynQVB0Zt3/vRM8S9iVkG3TVLmD15T+TjvxLGnvBrnfkDH/h+Ll8NEhei9Y?=
 =?us-ascii?Q?DpmqLpJNSRbl10tVhO/6KllULBH9GaJMQ6NJi5IhxMsj5N7FxHP7dwm7FofU?=
 =?us-ascii?Q?4i283RgMWGXsqdR666SCeNj54y8nOZqqCirDqDgj8krJ9Y3GteaZ2aZxAYnw?=
 =?us-ascii?Q?wP1sno1ZSRVRYor0JOxTIi9vEDEwM89pUDTvgAv09gCd3LI8t5n7iXCzQLCu?=
 =?us-ascii?Q?pZdG1Y8nnjNqJg7aRsB3saoPvfucUjmvcYcZFH2UWWEqGxo2Y42hl0tjc18S?=
 =?us-ascii?Q?Ej8DWlpwkgMpn9bXQCPWdq1ZwpsB/OEy9BwSmARHWCN3gU1LFVWMdjWM4b/b?=
 =?us-ascii?Q?8rZgTNXRmzulVUVl1LDqQ+/eWDGpw69Jvh3LwI5IPVt7tTlTlm9UEC6hgMN/?=
 =?us-ascii?Q?nXG4ZMCXDtCXSPui4yQ66s98BMgNL2TysFaBoN03q1XSn87O97vjKsvxZKl4?=
 =?us-ascii?Q?aaolsDkCubZTuRrvyJ+JyYYeBY3/MuQgPlXnpzRfeSkTnm169plQpxUMBm70?=
 =?us-ascii?Q?2Mwkm4a10fnsOMhOqVCnxEVRVNSdab4W+oiwe01se+EsOnkxyIzGbOzneKxR?=
 =?us-ascii?Q?Szuzykjtby+r8S38N8Zza0L1cKnwZGdKcgLSnzIFxOlS56654PdEW0qB7/+w?=
 =?us-ascii?Q?NXSjzwEkdSL+VzGVxXMgoGm2EBeMCuUaBWSizwnd8qo4eFw//0m9q40YXi38?=
 =?us-ascii?Q?VO232D20XrWtwD34vk5twxQUtKRltkd/Lju56iLmEJy8GFs1NjqE41Jd+DoP?=
 =?us-ascii?Q?dasSA4jrP/GA+ZkiUKZmlIr6wV2fQoP3G1ATCNGHvKsrG43x+sKlVJmc8CXa?=
 =?us-ascii?Q?fG/YjSZzmVRTRn9XWNZJ9PCC4xE9041ypxxZykpOqFM4ESHcn9kJVlZ7yUMS?=
 =?us-ascii?Q?leDVHeUC0l+h4Fkt1eV+mccwHwg17OU21u6gyKNlGP0uas9Iq0yzEMOIM8AV?=
 =?us-ascii?Q?24HFqgPbdma+TA6G/GOsMFapx5lQHe8rQfGfOTr5z8imouPcbnbzlFSX2Chl?=
 =?us-ascii?Q?ZxamHA2UwKS81tXf/B+sVnuLh65K+9J3+qHJGeGiTYiRLlRcWFCPbIxpmipl?=
 =?us-ascii?Q?gfvYjWNw0uE8Zq0CCt95ZW5UfuB0sImOF/Qh4N5XpJBFFNYpCLdi+bwk7hw4?=
 =?us-ascii?Q?unTfI9x9yMmGYBxsRTBQ6WLr793sOoh4NsuGVJZl0Cov2BwUgUC7cS0o0U98?=
 =?us-ascii?Q?FPz/L5bxK3Qn9rzu/qWzyx7DOu/AS0LAlORPGlJkUROBDiLBOp0JmZbkXZFx?=
 =?us-ascii?Q?mWqQAFHQtgV8V1Hp+JDL9mrb3llakRPVl8DONy/HIZKOKLUgoT2RBOcWSz7Q?=
 =?us-ascii?Q?ikUVH+botqCxdwF4NCFSde47tM9KHokcBUWWPS5mUXu0ATcMO7adq83JCEz/?=
 =?us-ascii?Q?1sgdcOoqehnaqKnZhzrNCdtP/SbiEdGIWhNDEqMyMebW1hva8tqvmwNSZCZL?=
 =?us-ascii?Q?utvIKANOvafmCq7XgaAjRpfDMylojkQlcL6ugFDTRO1t4l0GwiPGvmz2gQLa?=
 =?us-ascii?Q?1uhKCzu9idp3FqGhTmrh43bxKioQ6X1KQg01SNuInANDwoVhC03YcWPXgumK?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e93435-b5bd-4823-0e0c-08de239c597f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:39:15.9632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9yFggPQnqihF8xwUxghl5BdQ0uevSQc81YZTRkOqMMj7WokjIzZHu2nXU1CbQOEzgeJBP8D3WMzTwTtvQeNSVJ5kX+bAlrlGxTQEIQdA+HI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7773
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

On Thu, Nov 13, 2025 at 03:40:39PM -0800, Matt Roper wrote:
>The MOCS kunit test calls KUNIT_ASSERT_TRUE_MSG() with a condition of
>'true;' this prevents the assertion from ever failing.  Replace
>KUNIT_ASSERT_TRUE_MSG with KUNIT_FAIL_AND_ABORT to get the intended
>failure behavior in cases where forcewake was not acquired successfully.
>
>Fixes: 51c0ee84e4dc ("drm/xe/tests/mocs: Hold XE_FORCEWAKE_ALL for LNCF regs")
>Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/tests/xe_mocs.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
>index 0e502feaca81..6bb278167aaf 100644
>--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
>+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
>@@ -49,7 +49,7 @@ static void read_l3cc_table(struct xe_gt *gt,
> 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> 	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> 		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-		KUNIT_ASSERT_TRUE_MSG(test, true, "Forcewake Failed.\n");
>+		KUNIT_FAIL_AND_ABORT(test, "Forcewake Failed.\n");
> 	}
>
> 	for (i = 0; i < info->num_mocs_regs; i++) {
>-- 
>2.51.1
>
