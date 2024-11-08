Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16D7D64097
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 23:14:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8797C10E027;
	Fri,  8 Nov 2024 23:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J4Dodbav";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1FB10E027
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 23:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731107658; x=1762643658;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ztEiEs5HdM7NodJgz71X6RNxQjYu3AF3BispHQegt4g=;
 b=J4DodbavvNF0mh0cDFoUHAxr5dnGow3OcLhgBoCekJhzhkrQnXzjUefJ
 vkFccpvSGWTFtdFrVD0sG/+4cV6rBKt1JkANm3CatEpu0JkZ7rYk0OYQs
 VveoCfAWEaa+h4Y8ix0ngUYPKVr7c4tmRN90BIYARv7V495TlkUcFeoIq
 ZsqIdlkETToN4c30Vc2qrsf/TKLC+6EExIbASiLcFRqIk9KyLXBIdb7ml
 /MTcHadnGlLbPFmcV90zGipvTy/9t/8H8z+GtfuKpgSknq/XFE+UtytdU
 m4gGLrCwtwlsUDj2jPhIpsao1Gxliu0fdAZduPuNBXo5klbefESXDG72P A==;
X-CSE-ConnectionGUID: JsHSUXCoT8+4zGSymDQ+rw==
X-CSE-MsgGUID: AfQS3zVfSBu89bByBDB4Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="30420453"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="30420453"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 15:14:18 -0800
X-CSE-ConnectionGUID: bHQqZ9J2QsatSvWSRpO/EQ==
X-CSE-MsgGUID: jhyP3XrpSeSIYCoc/wtJyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="116595198"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 15:14:17 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 15:14:17 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 15:14:17 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 15:14:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7YW1v0ZCBBGPqxmCG32Q8mjbx7ae0M01ys3gu/rkNZfCvR1kOFMiRDVr36LOSml8EypWOjqu90f1W/3U1LxxAavSL245mZC+bIH5RE+ilqF6KbPvFm7n/igC/7YV9EQFzUQk8aFl6c8vkhunsBCSO3+fkzJg9QytZgNV9Tmb4X3FqOLvVGYOK3jl+mRo+NBzakDxz3mlnYrSHXyDcv072KGTj8f6LrOejpbMV7Otv5jokJeAGjQIixbzLMHj9oFmQA54lKsZJ797SD+n+jYLsDLIw1/16aybDvfMZos2i3hL0jKp90niC7t9LQE3/eM+8mneYsuOxL+YC/oLRenig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhzZasSAH3pZ607DR5wOabtQ23xR0RBTEokGjyD909E=;
 b=OOi5Gs9E+4Tyi+DBDsx9cXIP9D1T4d09wgpbk+mRkSHJvJEe1C4d4g0Z+TljMGQSNDBa2fICJPBO69IXc1VhHNuUCI+fhlnU3H/hCmjZuiygWANEVWP5026hfcULqqDdTNVINWx5ZO3jwkUq4l/nLmztyOE6GdAuvVndpSTwId5LAI25cZHxmmSps5j8yt8BZtdzy37QkZt/Pkv9kLWbI7UXmuzwQ4OCrKBWvGcT9lNcsJNEVwIzK+2/e8lRxFNyri96GRabBMHiuORJID2Vo2FOr6bmJzZU473bUsEPsVtDE/B0brLVheGdW+o+98f9G3qpvbmmAHLBmsv6KkEmJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6959.namprd11.prod.outlook.com (2603:10b6:303:228::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Fri, 8 Nov
 2024 23:14:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Fri, 8 Nov 2024
 23:14:14 +0000
Date: Fri, 8 Nov 2024 15:14:46 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/oa: Disallow OA from being enabled on active
 exec_queue's
Message-ID: <Zy6bZgJmdaMisqZ9@lstrano-desk.jf.intel.com>
References: <20241108230602.2984959-1-ashutosh.dixit@intel.com>
 <20241108230602.2984959-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241108230602.2984959-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: 52d7db8e-9626-4ae1-cd1d-08dd004b0fc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QoVy1D+jNwmcAvYCWioSiU+5vlAKS9aUETkKwK9DcYA0lhg2Z3JMhViR1YQC?=
 =?us-ascii?Q?8PeL18UsfAQZrY4ynh3egOWB8LvJLwVhGPTCOaH6hZUex81Kghl8NocE2Afu?=
 =?us-ascii?Q?PtlGSk1HfKMGNutIiGMFA6m+HkwrjtN8aqh/wTDVoHyuYlCe0J5eXnKqms+N?=
 =?us-ascii?Q?i4LDA1dwXPm767F9i+mhvIqff79S/ga4PmQWuwn3fb9o7YxLSrLdyxEqtIuF?=
 =?us-ascii?Q?mL7cTD+PsMY+KJy38YUC2L8DngJD30pZMeNHU88EF2AOJjgAmYDShnjxss36?=
 =?us-ascii?Q?NVEBnoOwnp4llNddez8uy+k525sYskKK2pRn1WvNvQvW3DLfFALEFr+jXD3O?=
 =?us-ascii?Q?N7YgNK7DD7LHbGhZrNmi1NpoYEuNORRKHJZKl881vLYDGWKofgeAXcJm5kw6?=
 =?us-ascii?Q?OE9jtuBlOlTEA7IIK8Ef5x9H8gkn0OOyP58la6Dcr4aR8VRKEUG1z4dH7IyF?=
 =?us-ascii?Q?vonxBhw6mtgVD1mFQSygNxGItsOLmIr6QZXhGR00BOn1fvT2Gyo1cmbOeDpV?=
 =?us-ascii?Q?3xLHdE3Ru7REG3c5WlQ73wgohAyQ4Aba3F/ckKlXR6mVS/rsb91An0HHD1Ml?=
 =?us-ascii?Q?W38WRqujMUiJnGhyWMlggxFlIUyJZPJGRMSa/Ly/k9EMwdJZWa3VmbPvwng9?=
 =?us-ascii?Q?PBMRmN0jVq50zVnY8IQSqOmoyO+S9bK0wTGvNHB0KOVHg4ADP2aFzmgvGzwo?=
 =?us-ascii?Q?qKuPZG8zklj271X1DhEEPkPPPZlib/btWpSn8nLFnhy4xjJJIqTEN9vRLvO0?=
 =?us-ascii?Q?zrVF7hl7Gj4eK9NiGnpUWGZIsEJLw5pDFPnLVKdFiBXdPzP1tKPJlMAmbopZ?=
 =?us-ascii?Q?bUgx2HpgccP2mIdqUpAPkPuLk03sTOMpoiZSVdzQzJ4v/Ai6yW7qo3iUrj/J?=
 =?us-ascii?Q?4sOn/ix79t0W9WYx4WYfEpisMdcWlBNXvv9TVXl2Xi7XzcoyDfUhKRC+R2d4?=
 =?us-ascii?Q?Or0eNlqz8ZXnXudCLROBiOfftHUYSzZTN+pfWYVaKzY5aU2F7C4TjHoAOV8f?=
 =?us-ascii?Q?NRL6V8NwlUR2QkxQ3bBHOdhzTD+mpDLdKfx8p9XLH4xVQg4ybLAkIC6xHk+j?=
 =?us-ascii?Q?0iazCRNJalisbLg9AHSOPG7kIXXHW9BkbAu2lkT6PqBLHVKQoBE4j783vYxQ?=
 =?us-ascii?Q?4ZOZ+8JOCDbkDQWnA61gD6a5LyehZnQOKvQpGFfq93rBYqKSn6kUVBCDxQ1P?=
 =?us-ascii?Q?afTrOHYq2Az2x0vD+wh7mUvtpCSE3fJdibWwUntg5DpWTP9SE6RuHmYKNqgl?=
 =?us-ascii?Q?2rPqbPSbLkKSjfR58g5m+6ezq18TCNqtP7rMdFPQrsF8DXtD/Dj1wQ28MGWo?=
 =?us-ascii?Q?mLt55joGJWMcz2ZgdcBqJRLu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B7Q1l69NLvOOMJhLD9EhqUuRwuGfyYzrAJjNTLtztgnXXRJsprLTwRX0s358?=
 =?us-ascii?Q?fvUZVk+73Sp3ozDE02P19J3qiRjcsLk4WJYvFSRfsH6eTRo3jgO8aad1/FR2?=
 =?us-ascii?Q?D+iu8Lzdr1h8+31YMnJG0pT87Rz9V6f5+fe1WVgb2BQ1WJZBNrjAiavGyGV+?=
 =?us-ascii?Q?NFPc4cdKfU6He8yhY4UdBjLa8xY3nakZg6mOpGTQvUCLPD3iMq1mUPa90SJo?=
 =?us-ascii?Q?GWQU5l8CgH6IBNCjK4WcjWxLqIijgOzN7jRRkkXMjvwrcNJfOkK/Mvv0hqwl?=
 =?us-ascii?Q?+W9hYltQxYpj5mKwc/kgq+T2GU8m1R9jZXZc6/fpoNRlC+g9rLlfASXf1pKr?=
 =?us-ascii?Q?4n5miGf21CxRBj6aATXzWa3fX2QQgqJEBF135Ug0jaHxDVAbOH90PjxcJsK8?=
 =?us-ascii?Q?WSjqNRtT1GAQYn19xBcc6JhNdIBD/B4NYhRcIC9QWXe1S5nrtfXl+dud51uE?=
 =?us-ascii?Q?iqO/D3o/9M/70o9fvRiWGszMHFj5fxdfR0dlTlNw++0SCjpBtu/O/ygE418t?=
 =?us-ascii?Q?4A4sac+J0ZwwfaIxnPehuvFL2wAqKYNpAYq/EagDwd6Zs/3Egre/IO+hIdMi?=
 =?us-ascii?Q?pMKHWWg0zp7vuJ1UeFFwhVaNxwlOGrQ7Nn6X2xmA2W3VqEusB1DccvlPeswl?=
 =?us-ascii?Q?PdizXF9HOTcnPh5VSMwUv7egRRi60maUKTmLIU9l3vMDIaJWNtW9oqLsTvr/?=
 =?us-ascii?Q?yQJuwWgthCWu0WEKuLQHGv0Mg7Z17zcTUwaIBvk/AcqM6mcS5pXZfEfDFsyy?=
 =?us-ascii?Q?FdEho1naz4RNLZAJkl5kJOBHkrqt2pQtNGeHWdbfBrCzyV32XZh0vmrfhFXP?=
 =?us-ascii?Q?VfcQmzHLc+DZegZIAqcf2jR2HL212wchizVfACX2ZI+bO6DsBwgyovhhDAw+?=
 =?us-ascii?Q?m75jikO60w/kQCKPyD6iR5EGY4niI1PynZwEuxWf6mCnNVd5aTLA0GaRIpTz?=
 =?us-ascii?Q?JVPfJK3Jl9m7wOWbtb76HKl6x/sd7vdjOkYDLr3ZVWpUD0wU24ZN97o2Mj3a?=
 =?us-ascii?Q?GKAPCvUw+HMFedSDhHfBuzlqXsqjYPE5qw4TUeXJKXgp+GaQIvC1ukTURhl6?=
 =?us-ascii?Q?asfkpQYdCdROjqVmuR/pjVLwl/zBucTOYYOi1TKnw6iB7ZdUN4U5A6Znjg4F?=
 =?us-ascii?Q?439OApCf7F5x74RTI96sDHHlL1yw0EQiReshIHXRWndU4x3p2T9Lvfs1nr0l?=
 =?us-ascii?Q?7y7j7Ct78REKhKqSxXCbYTUHmmBO9gllHQTss0EoE2YKgG+OlRjKjPJ3PZLO?=
 =?us-ascii?Q?A2hZ1iqunOFbfY4eQsMqQ/DDNKyyKCL7pDghf1iIMfdsVHQ8bPxWih+CjGzv?=
 =?us-ascii?Q?jFuLgeiv1neZ32mZOrXHeZy9EaEiLpAsCmu0d8Uhz1MzXcqWcM7d4JwuJ9no?=
 =?us-ascii?Q?1ziriKi4cg6oOxXuxGE8n7IOEo0n2qRVrzCTPy1NwGMSC6ppC2rsS6KszltA?=
 =?us-ascii?Q?MIP+B9F5PBdt7wuY1zPyimAuD9b6bNXVy0mVagn28F8x7gwJao2LFpK0/ift?=
 =?us-ascii?Q?OqSNXt6gU1cBtf84kad+g35ZhYTra+HAircmJtFEIIA/DVke3Tx9wbcIe6iu?=
 =?us-ascii?Q?4iBnkXGXTNGuGxJtuZPGBCszKuNOvsxj7oFl8Z+6j+VkDrjtt0JGDXOc1qYG?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d7db8e-9626-4ae1-cd1d-08dd004b0fc8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 23:14:14.5207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOevkyY1+7m6yDGjZ6d8cVC1s8yvi6Nt83/nUB99O0re804TcJ31yOWyog6wYU4Owt83EYQqNFxVowSmOj1ITA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6959
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

On Fri, Nov 08, 2024 at 03:06:00PM -0800, Ashutosh Dixit wrote:
> Enabling OA on an exec_queue toggles the OAC_CONTEXT_ENABLE bit in
> CTXT_SR_CTL register. Toggling this bit changes the size and layout of the
> underlying HW context image. Therefore, enabling OA on an already active
> exec_queue (as currently implemented in xe) is an invalid operation and can
> cause hangs. Therefore, disallow OA from being enabled on active
> exec_queue's (here by active we mean a context on which submissions have
> previously happened).
> 
> Transition from 1 -> 0 for this bit was disallowed in
> '0c8650b09a36 ("drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream
> close")'. Here we disallow the 0 -> 1 transition on active contexts.
> 
> Bspec: 60314
> Fixes: 2f4a730fcd2d ("drm/xe/oa: Add OAR support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c |  2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.h |  1 +
>  drivers/gpu/drm/xe/xe_oa.c         | 11 +++++++++++
>  3 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9e0f86f3778b2..5c285d966fd5c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -83,7 +83,7 @@ static void clear_exec_queue_registered(struct xe_exec_queue *q)
>  	atomic_and(~EXEC_QUEUE_STATE_REGISTERED, &q->guc->state);
>  }
>  
> -static bool exec_queue_enabled(struct xe_exec_queue *q)
> +bool exec_queue_enabled(struct xe_exec_queue *q)

Don't export this. Use a xe_exec_queue_ops vfunc. Current vfunc
'reset_status' would kinda similar to this. A vfunc protects use against
baking in submission backend specifics into other layers. We only really
have 1 ATM that works (execlists backend is still here for some reason)
but this is the best practice.

Matt

>  {
>  	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_ENABLED;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 9b71a986c6ca6..a3bde061dd53c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -12,6 +12,7 @@ struct drm_printer;
>  struct xe_exec_queue;
>  struct xe_guc;
>  
> +bool exec_queue_enabled(struct xe_exec_queue *q);
>  int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
>  
>  int xe_guc_submit_reset_prepare(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index fd2ffe8df1561..b0692b8ca0a3d 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -28,6 +28,7 @@
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_printk.h"
>  #include "xe_guc_pc.h"
> +#include "xe_guc_submit.h"
>  #include "xe_lrc.h"
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
> @@ -2064,6 +2065,16 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
>  		if (XE_IOCTL_DBG(oa->xe, !param.exec_q))
>  			return -ENOENT;
>  
> +		/*
> +		 * Disallow OA from being enabled on active exec_queue's. Enabling OA toggles
> +		 * the OAC_CONTEXT_ENABLE bit in CTXT_SR_CTL register, which changes the size
> +		 * and layout of the underlying HW context image and can cause hangs.
> +		 */
> +		if (XE_IOCTL_DBG(oa->xe, exec_queue_enabled(param.exec_q))) {
> +			ret = -EADDRINUSE;
> +			goto err_exec_q;
> +		}
> +
>  		if (param.exec_q->width > 1)
>  			drm_dbg(&oa->xe->drm, "exec_q->width > 1, programming only exec_q->lrc[0]\n");
>  	}
> -- 
> 2.41.0
> 
