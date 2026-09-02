Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD5CC61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 00:33:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C16410E076;
	Wed,  2 Sep 2026 00:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f3CMoTBa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D3610E076
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 00:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788309193; x=1819845193;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sM70ZnqqUOvyr3PlhAOXV3DX8yrFMtnwdtiFNxd9l0k=;
 b=f3CMoTBaIWTjmONqhN2x0HIPujJf3Fr695alQqAaLGH2ic6W16YnI8Lz
 c/fq/MqDYWm9JMu3d6mX3mf0e3Dc59gQIGL2Dct5Zsamv3cISHV+JMoup
 CeT+gr/VKXlwfQbjGyQwI2DEioWQ9j9tl5DAk9fJMchL3nGH4wtFH2x+P
 41Jx6mfwmbzfmNuhwgxEz6z94gMMaFZcl+S8qRBC2JSpttto3XL7anjeb
 58q61JjjpNAtLixQTC8ElJCTizl/I3/538KWSQPKairlkHcgf92iN3ZMr
 ijdLBxUhLTtMAvC5HfbLPrXFMMIJTOZE2KK43BYxAN+hhjDLPRqojGilZ Q==;
X-CSE-ConnectionGUID: TfbXFMTPSgi3Eo/eC6vw7w==
X-CSE-MsgGUID: fjgMFolJRjGOypAZb6RUUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="106127132"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="106127132"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 17:33:12 -0700
X-CSE-ConnectionGUID: UyL6SEzBR5WaIXK7v0R5yA==
X-CSE-MsgGUID: t7HC/UbgQcaYBj49ef2PIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="264963306"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 17:33:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 17:33:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 17:33:11 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 17:33:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJ3S1RSR+xw124qmYRg+oWgtIjKIKHPg21leYKnPPhdNLhhmeYqtZW3Cbikp9suDNqhCJADafdyE3XAPo9pl9qNym/g+nkqMfAMWl2o72iEg+/ojuOek0eJcEdYStOgvgFTRuxMXtzI8arVoICOQpTi0+WhgeZVd5CMRWzHrnU5f6CYzdhF7DNQieGtUzfr2Z/7wtcI+bWxlS581lR1Izk9fTuVrgCrHOJAgMNoLYFRGlYSua4nIspKVhRWjVTb2yyM9W41ohAsxC2fEB6ID7m94us3hEXzGmQW/C/3Alh4nJXmmfPt0E0YqDFNvILE+6TI9D0M5SMQvWgKvXOSFcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ny62ARbSHJXoy6ayKSHJrHWiKtfgTHonqU2gD2UG0rg=;
 b=i5CJBfPqzkKfXtnL8jGmfLWuF6XQ9XRETQwiLns0rT9yj5zbLvqWKaLuEfOQmynz0yRVwyakIjddDBpnL5q+hhmwcgtZ5HbbmQu7Q3X4HPa86JFFG1R//8p1HUF0O3suhiWvYuYilqMVZLgBAC1oYqsXbMpgNE6twmVES6bADJ4XSXZd8ClWPO/LC0FLKZRW1lfekeQ9i49rks0XTrp0Kfxb4feXhywQIRwtO/aoKAv00lkqH9By9tiPwjluadksVgIz1fv59eO2CiWGPuyIItv8Hwi1YLxkG5SxWpHzc0Omu7Ltf88sVPkrFS23T80Wk/DrRBgqVIrW6H3IMkDPww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4731.namprd11.prod.outlook.com (2603:10b6:303:2f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 00:33:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 00:33:09 +0000
Date: Tue, 1 Sep 2026 17:33:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <rodrigo.vivi@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>, "Arvind
 Yadav" <arvind.yadav@intel.com>
Subject: Re: [PATCH V19 03/15] drm/xe: Export xe_ttm_bo_purge()
Message-ID: <apduwqy46065v20K@gsse-cloud1.jf.intel.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
 <20260831064942.315720-20-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260831064942.315720-20-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR13CA0053.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4731:EE_
X-MS-Office365-Filtering-Correlation-Id: 877a966f-fb58-4ae7-000a-08df0889c316
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: WH2B0fow6e6eTJVtZwoBnzl2ODp0awCOe52SGxBsz9okXSMinnOtb1kYJnnxMrvPHwUUBhJBCaL2U1Z0WScMLVFtuns/9BdaRGg2yhyZvXLYnxcHPzhfp0g1ixYd1Ye1+0dsGuiHuSCN1ee1ZcZQgOL3Eoaq9lFPJIDGSaUecyxClOZe0Ms3hk3Eo4vUdvLU84v5WhphEsq2QwOWVZLUJUdR72tM+uft46QYi/6Uw7wg+ROP2gTLkYIhjvQy8D6b+t1ORQybk1DSKQyxaHAufnqkoetrftqjcUvvL/TY9fj6FWaCoVC0EPSK33tGySEsL3jRA/6pxP7VOHo0pL7+9D5PR71zPAfpBPbONREHknw+tS2yxc5eiV0GFdHWiGkxd31IQ9LX3qAaVUZxgqMonCePgXQLqwnPxk/r4EEIanr9B6Sywi0wbbhMtiwq6Bm/Ry+vts7DrNXq656sLXwcT8sT4/s8WbBLf+kU9bPKYxPhPrRLFU/A5VeiYUdYfXh8kLfN8qA66/Jghmkm3tkP/TwvxDjhscg0cCYlOg2WYsTwhpX9SEtjo9vuQFmlZG62W/wiD2bnzX9i1j0LAxMqf1CRgWsrsIGJPTXHTEpHmlkcPQeBKn1l+q554pWM1HuJglEuVAZd2ref0gJ5Z/LAkxCvYyocJL3knvw6lirVw7o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q0WfsohpapKEqccu1gG0sEWCfOcjgtvar/anb6hfzc2bHfxsCdJINydmdY8+?=
 =?us-ascii?Q?kJx4NnDUKGmeQWgbi+OR6t5v8FSXdP6v7RzAqg7Ca4EKaoOwG4N2Ld/77hnj?=
 =?us-ascii?Q?DkL4uE7DOfX3q1zGiQ1BW3z6S5XziFmAxSBPCECJZ5+0OtwjdtOjwHlIl2Pv?=
 =?us-ascii?Q?9xFCQ37kHm/U2qc+0B8U9epWuGO9sxerjyExehAQeN5FislVyYNEhtmfrNgM?=
 =?us-ascii?Q?2s1TGCpp6K5Hn5/FKK8lqIuqL2+P04zWToL4Upi8+01aBKCYNrUZrXbLYtR8?=
 =?us-ascii?Q?iPTk7MWQCKo0AD4aAanIwmxACVnvgLwZRozQqTAMH0geLfavBiaqcdl83RPu?=
 =?us-ascii?Q?log2yEl3f+CtGHutXgIExIod3GBX+P9vlyCjHSYPoKssfzC71hLMUA4792Da?=
 =?us-ascii?Q?H9A8thghUcZv0nhCTe/da8jxSArr+Yzx0jLdaARH/2QJZRokLsN9a03WqDod?=
 =?us-ascii?Q?nGocfheKY2KjvJoWIOjTIWpt0BOjSrj8znAEBp9Rjt9dZThReONALv8afq83?=
 =?us-ascii?Q?ifyAXIjnoycoBUgDIfuzmdq8bDOIKLJ4g/T0ExHU5zJNyTad5hInr1ZoDaLD?=
 =?us-ascii?Q?BdMvByISmXoO8BzMv3QggkaUfrME1ohJV2tOsId5Zl8ZHQitlnoh1UZr+EM/?=
 =?us-ascii?Q?49Ihibfx/oKtk6UvfwOUkyiQj1SUfhR/ZOiW4EJ6/ahxXPCbZ4FMfhjQW5jf?=
 =?us-ascii?Q?xSpe2kZO3DRurr2fWJHyxlH9FOzUpbEzKiwAmcdZ7/zxA41vE7c+NX4fQylx?=
 =?us-ascii?Q?JbiU4DAR1yveQnwl/peXBS3qKk1jL7nrLlo5JnX8xXIAL3fQ1bzoIjHbVLGT?=
 =?us-ascii?Q?ylr7q4zJYP+5a7H2yXDdqFE9h+oBGsp838F7fcs7ZjJE/e+355uNngExgtE5?=
 =?us-ascii?Q?JG7oRY6aKymOEYe/YKnn017g6uW2/2MFf0G/6Hh6MpNJiIYRqiWU6Z86MRXV?=
 =?us-ascii?Q?0YZZdVbFZJJC2THqGj2JUw4B0BOau9uxqsW/Y9HoTnx+Xexx5UWB+N8UI9eQ?=
 =?us-ascii?Q?emsuS/YN1xBZSAaLG3eRGDKrGx+VvhpLuvAR3Zev+9/z/belad+AucnHX+bI?=
 =?us-ascii?Q?BJXp+OBD2ToMjnI1LFBMU7u4Dk8UCWCOp3m2Irr2YMq056GP4sEHV32RCrHL?=
 =?us-ascii?Q?feb1FiFkgi07i+YFPIyFaCaaRIW9fxGtAQgMHc9nG5bnVJHYaDk1DFuSEUUZ?=
 =?us-ascii?Q?BOp2kQITHZru9aHUJdjOh0y2AzavNRuPctDn81kSu0ndPx1ohOlpTyYUQvI+?=
 =?us-ascii?Q?uvYObEc8X3qvjvuLQqjeP0YSlpbsYzBw4MPBPa+TqoLzvCjgcR9L/AztAl3j?=
 =?us-ascii?Q?1mnlsAVcMSnWJl5MZvL4RjoPsCnIRM/7Bi6ZXr2A+4iMBMlyRIK1CW/ZyafK?=
 =?us-ascii?Q?AEf5yct+dQ7JWw7cIEPnVJpISiwhu1F2G/aulfjCNkiCsDmntwTwLoElTNMJ?=
 =?us-ascii?Q?ayTKreVeEzq07/zm3KZM4+zlxaI9ofn1H6o/Gsv8tEN3wKyQSh0OrmqH+tTL?=
 =?us-ascii?Q?xcF1dFtDpnbaLoZ/gYmC6E0wnqPDMfeoNtnSFHxZerPxvVGG86T2hEP17DZM?=
 =?us-ascii?Q?2jV07PxX89Ey5swi5dTQfKfm3IaZ4Tcqbu3Dj3ibfrTjAa2J2F44tA652VzU?=
 =?us-ascii?Q?x6q7cQxWapeln35TDCjqLx17QuLeKy/DaMcwit+672dcKspu+ZJDliaPBrZ5?=
 =?us-ascii?Q?7N5e3bwDAJ6N5y2c1S99vLN8HIPzs8Fc6lst8e1bwFKDOScM7F4uGPHydwMP?=
 =?us-ascii?Q?KpuFEdvcMPSmwnbZvKHC57H/Sk2rQ/k=3D?=
X-Exchange-RoutingPolicyChecked: kWauoFsZMkdfVh43U5rP8uxDfsLeFVW80cwmehT4NMa71tpBVItySEFBO4xuKMC05WRlFmWm9Q89IVaPnCgIqF+gLgHy9uAFL8S5VOQgkhV+IL7B2LMPPwnTqbBxNKMdclGd3IMmW2dLJCnj6fw+bVmisPkWozLp0TMgZGUd+q1GGYu/C/htmHmkF84OAyLvCpmmQAxRprlN36fkJAJlBIQdMyKww/VdeTwDuqLKas31twhkX3D/+1Es1ogDLNUIsXIiYbd435Jm4a3uj84+9QapsQ41yKpH4wj3zA0y27JjNytylvlOVCi9/Z9/tezWWplqINzwDrq9cGjzusqOfQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 877a966f-fb58-4ae7-000a-08df0889c316
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 00:33:08.8915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYnHFKu8Y8OUireeptND1O1mhpT+9wFVOXqqIyphDhFj35ZeEaJpblRKZQHW+6f0sNdqULhBgVOYLkPxzlHh6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4731
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

On Mon, Aug 31, 2026 at 12:19:45PM +0530, Tejas Upadhyay wrote:
> Remove the static qualifier from xe_ttm_bo_purge() and add its
> prototype to xe_bo.h. This allows the function to be called
> from other parts of the driver outside of xe_bo.c, specifically
> needed for the memory page offline feature.
> 
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Reviewed-by: Arvind Yadav <arvind.yadav@intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 2 +-
>  drivers/gpu/drm/xe/xe_bo.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index dde309821237..8f93e09e51bb 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -921,7 +921,7 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
>   *
>   * Return: 0 on success, negative error code on failure
>   */
> -static int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
> +int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
>  {
>  	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
>  	struct ttm_placement place = {};
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index e8081af5bfc1..90b15fff36c7 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -600,6 +600,7 @@ struct xe_bo_shrink_flags {
>  long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
>  		  const struct xe_bo_shrink_flags flags,
>  		  unsigned long *scanned);
> +int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx);
>  
>  /**
>   * xe_bo_is_mem_type - Whether the bo currently resides in the given
> -- 
> 2.52.0
> 
