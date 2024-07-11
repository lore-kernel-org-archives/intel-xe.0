Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF4BC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 20:51:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDA610E890;
	Thu, 11 Jul 2024 20:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PWf2FYY0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E87B10E890
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 20:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720731085; x=1752267085;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RBAOX+ehXq2sGw1ZQG/eUV8vPZcjVx8uwhYvLFQ0Ir4=;
 b=PWf2FYY0ow13dfQjjtZOQFA/UUgbjEMdjHgjMNjp+CEQksBHtpb8GQDF
 LHNyujR9xrYNIuskuJ7T5SS7blK4mIrnD+gV3AC5RZ2NzldFQsaGeC8Wl
 sbNJslmT+Y+uQeWbbS3oErTWDMKP5fgwV0oale11DxnLwwA6TodspxL5n
 tGr/A+KAIc23+biItBfjopejBcxQBTmeS4Q8Nx+RDFyglyB3rkDXVdAdL
 vg3LsULjwmPDYdYFb+PEe+qIGgEywmmn7LVmE7vijpOdByNa2eF+mzmrA
 4iTFwrIbUUf98fjnZKALdB2prMGBhqouVZQeyMroBc6Jd0Y3xGTztSuqQ Q==;
X-CSE-ConnectionGUID: 1SYEiIo6Qmu4ZiOh2OExDw==
X-CSE-MsgGUID: mWssS65SSc6ERsyjnX1Ciw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18351202"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="18351202"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 13:51:25 -0700
X-CSE-ConnectionGUID: HBJefcToT8SIOzIXwi53gQ==
X-CSE-MsgGUID: oLR8LnvpQUW0pZFtYBkgdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="86198054"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 13:51:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 13:51:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 13:51:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 13:51:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 13:51:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HbBJ7uStnzE8CJ8eWd6iEi2q2XMGzGW2owh8iqA0M09h+pv9B+z8ptk2Ig6Ze4yGQvGDFvHVZSLog/HaMoB/RkYBIUwH2qchhUY6oKXml61z0WVaCkTnscP39Tb16OBELNCrtlMMx/XV3M+O5IRAFSWYD7O/6AEsFWaYs/KW8HxF/YG04dMQC4eVDiWIhqa/Hn7uiKl9AIEUpx8wrKhI4OX5qkhQkyjqlU7FWM5AGH2QFeInL/0fa9qKf43W3huSOYT2Yy8edcFITNCKB9/vNTJfuC/pY5uiXMwJ+Tr1ha65XXtUyA29A/a5niKpXF16U//rqPB5oauTMXsC02tdYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7x3+swJ1WWpbqawRMxmwUR07MKQ10rvrUhagmLqdtY=;
 b=qUutstxhKy34C+CtRT64KwyQtCK3sYL4nynpEzKcaRPJRBKhn/qZlf2XVyJe2ytMp7JpybdbGZZHTqq4QF6hMd0JvrWzHleKUT/aTLVu+a0RP7/K7kVi05JWqgynYAcqdE8tpWfwYTgcWZKgRQdIZpVYUq/lj41e18erU4mmQrWvNVOo7FoFLLk2NoCzQ7pbo9g7a4gt/wLdfiRnnC1RsVSDY41YkCzVEQwmMv2DxAHUNkOwffqHosFNQkd8q6r3P0peZPze44bHYGFeGhHHsQEKAIhmJ3UNty31YaslLTbYRnO27LZWFj+7EHQBji71cXPPmOjzixA38W05pUD9/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6550.namprd11.prod.outlook.com (2603:10b6:8:b4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Thu, 11 Jul
 2024 20:51:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 20:51:21 +0000
Date: Thu, 11 Jul 2024 20:50:34 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/exec: Fix minor bug related to
 xe_sync_entry_cleanup
Message-ID: <ZpBFmnsstUpiuP7H@DUT025-TGLU.fm.intel.com>
References: <20240711204552.3724442-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240711204552.3724442-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR01CA0022.prod.exchangelabs.com (2603:10b6:a02:80::35)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6550:EE_
X-MS-Office365-Filtering-Correlation-Id: db3cca20-8a36-4bc4-48e6-08dca1eb37e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k5XG+oQPXAuFitv5ZtzfzELpAQyuoP9zAP4mdaHjohjzK/EMqsNtyd75wfIz?=
 =?us-ascii?Q?S795zZtG+BkpVQXNuXr3p++X2fomMcr7dMStqS0R9FP4/wy8JeJ84Yg4O97j?=
 =?us-ascii?Q?lSvW0MbIvhXMZAHBCpiOB4Em/g1mSW9h5zWYxMLLKtUXcFGWRENXXzB8MCFj?=
 =?us-ascii?Q?XA2lS4lg0istdro0T6sJrlFKxadVMbwRkX1PCeaGeQWuy4WqVGW8/3QoBAmO?=
 =?us-ascii?Q?do5u9z+5IETLMOuFRSxKPAY40t6mi/Brno7M2uomzYA6a9+mHHZ7Yx3ESGjJ?=
 =?us-ascii?Q?a1osmbkhxvGa6Sqcdw1bt+nOTMDD//pmDkR9RZ+PwniCm1yME4jUB3EkHCY0?=
 =?us-ascii?Q?h0DVGJ7V4HoRz8UF1soWmvAcg3n07GbWxZvggU+axueJxjckZALgtGmyXJeh?=
 =?us-ascii?Q?Azws+EV0HwKtjXj7qMbdDeNtmJuCaUrGR0EZcwZsymnTJr5e+k+/xDIbzbL0?=
 =?us-ascii?Q?3nSWYA5UItOdmYBkp7J2HB5Iz6A/S+Cwd+ALAtibzj85lEndj6v+HQSOJfMu?=
 =?us-ascii?Q?Zx2Z1tnLK85YGvGD+J36j+/ktBC+Bwf0aexlbgoXAJuMP2bYmnjDP2eorDqC?=
 =?us-ascii?Q?lcOKB1fZw92ij4kcmzcE+3Z5E3y8FGJEA0CxR+x20e1IktIGsT6sA4Ym+xh3?=
 =?us-ascii?Q?WlDy6DTfg+gUGDPG/QAazscp6J4Dwtxsm2HsvPaNxM8DS86rhyDQIDHKwwKU?=
 =?us-ascii?Q?CdQ0daHgs72HMScxIlLdFGMppJql812UOChjROR/8hl0nNz+nf/OzyJ554L6?=
 =?us-ascii?Q?iutD7SpYUw+/qavQkc4aZ/acdeRZSM+/17e62Q6QuPbNBdr8WjItYYNhcEoD?=
 =?us-ascii?Q?+aHsGMR/HjuQ3IcG2wSGZzZEv+vafTFOZiYH6axlKL3TcbmGnmbF7oOWuatd?=
 =?us-ascii?Q?HhUyIXaUsi218FM4HVc+MGN/kTBd0nBAboNmpXHsYfyi4H/GxvU5qVrpFycT?=
 =?us-ascii?Q?E2rs0NRAyAILMoYslNRCV2ewJJa/E43mMm0He1JHTp1Gu3cUs1GDLHYBNBR4?=
 =?us-ascii?Q?YrkuSQegXqUVz5bNIQEa53KKUvWIYC3tUrTZCgi7ueBcush83/KPEBUynFaG?=
 =?us-ascii?Q?buKuX2ZbQl9e7CNdxFkKO4GfxuTb8WH2WzRPXZBaP82wabEbOCla6f9gmTQS?=
 =?us-ascii?Q?h28zZ+yaUGhf56GKQWB3TAfgT6GDB2K3OtbBoKWVoh/I3+OboKfX3RLmILAI?=
 =?us-ascii?Q?oiwZ++D2YQFgWI+xYfPeHgOJ4QZpqYPW72kO2BCq6/S6TgPxBrVhPnB38BCN?=
 =?us-ascii?Q?Q+QYjSkyjGGzkOS3SaapxCim3Hxf/0l8rrOTXLAaMfz5EKFOjo+NYSs2p+q4?=
 =?us-ascii?Q?zC7yc37/TLWQyAv5aQdOH6HZfEZqbdxhUyhsje+4G0BfjA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YFjesx/sjmMpCVrO1dw3jOBdwD7EVXn7Nu0FJYBsWo4nUKkVXMfHqQbF169r?=
 =?us-ascii?Q?OzhPiLD42dIU0BrJUnrLEu68l67AFenPOkhYjOcOrA7kcHR1p1N0xwet4/aA?=
 =?us-ascii?Q?sV5289C5p8upn5DPp+K4c3JL66+/qO+IpC0ava5a5MWZFSsl0lvIvmPH4hph?=
 =?us-ascii?Q?ymdjYvDOn431xK5/1iEzpouJVgmYF9R8gfZao89k6NnknRwjGJb/JglaXwFL?=
 =?us-ascii?Q?iSmuSxEk5mG3oQ8z1FF9G56w7DQfZMjwmq3oOk2fAF4C0GrGggbqtrhsA9lo?=
 =?us-ascii?Q?mbVDXAz8s+bUzrD8cLGGpbR/SS/ZXubnSnwHHuJsSL6LxoaygqWkMrwGbrl9?=
 =?us-ascii?Q?Sse0MMAwT2TaN4UBZ0YUSGMlYFc2c3Q4jSMDZE1Nobk8mjU/UNv1Iu3+g23M?=
 =?us-ascii?Q?rbXY2x4ZSy6E9mxcB1usP3V51wlzP2xHdf4rO9XBKXb2o3n/e19RKU1/Nng3?=
 =?us-ascii?Q?rVRAUtqWb2fzuqVwiL7nzce9pYX4ES8UAfry1+EGZlpMfqG9+3JVTD9QVYwY?=
 =?us-ascii?Q?DQvMG4fbFn/UsJym3f9gQXMItQzuX9rcgA8mcCxdKQao0Qm9TB4zCSoUJpda?=
 =?us-ascii?Q?KNryQp7bSiLNlc4eVGXITW/l8hmuwkMaeLDzsm2DhxRb1h6oT4/C9O8DsstB?=
 =?us-ascii?Q?SImrfkNQ49Vu+ecZv9iVgvPYRe6HFZCmur/DmO33UBi7BHg7G/mJ/etG3WUX?=
 =?us-ascii?Q?6lDoTA1Z9p0cv7DhouKoefj7zZf4ijEpGYC8CreIXXn1oaTxDxcbZbF5GK/+?=
 =?us-ascii?Q?ewkEZz2ENMjrFvv3f/rFxwbl2Wa8zJu8HU0R6T2s1R4ALo/UpEfDcarhkF2B?=
 =?us-ascii?Q?UlIA4gDjec6H6f+XYQbWeI5rg4epDRd5vsmxj0tIqQGJXTxucvKv0r+QWRlm?=
 =?us-ascii?Q?u/kM//7WdnVO3N9RL2KLS04SM7uKXV9bqvfmbcodJk7Ng6N/lnNiyVoMOoDM?=
 =?us-ascii?Q?UsXSYKZ8nQYCLxJiepazIyDny4v/2sO22tquWfe/JNUwxeIdgCzzAS6N7e4c?=
 =?us-ascii?Q?qb3n7cneTOb2V3xNE1ahlUxoPiahRPlNgRfbSMRbmRUQIaPOuAOwIH3BO2lS?=
 =?us-ascii?Q?YX2/y5hzTCtGSELVuYNI47/2sL0SAUu3t2c3kFB64h9zpQsCkWeFNgyyT65e?=
 =?us-ascii?Q?ZTyY7U/fm0z3rIsmM6KmxpgSQrmvunAvCs/zDVGGTM9fDEisdjTBp4Ulp2Wg?=
 =?us-ascii?Q?XbQv1t0LnuZe1tIRM8aG4rcSmQZE0gebF8N/QtTS1eSdYRaE1jfGOdIyXJUJ?=
 =?us-ascii?Q?XB47ZcNSE+SUxZsQCSUeVZ4Q+dpx1acimqE4vUJM0g4U3HZxpxX5+E5p6E9K?=
 =?us-ascii?Q?+zsU1XDbbniE9rwzTZ6opHxM5WCNXwk6cP2JOtaabRwdBm/0cL66tNWYZGy6?=
 =?us-ascii?Q?ENkd6aVle3Wi3r0uXCRaETFdVIf0+nHe7cUXi8W1sQJLF/K0xB0x37fcL/ql?=
 =?us-ascii?Q?MWHgoR9liZScEBj57GkqIdIKXLO9x/tIDZgRTPWOE6NAWLiwWP5LHJXuBPN6?=
 =?us-ascii?Q?Uwo72hGvRFPxpiUU7rQCpbcM0HFEl3sYgWxPJHeHkhgfe7Q1SHJiQmaJk1is?=
 =?us-ascii?Q?dge49AfT0ox5RY4f7ZB1Qik9E0/0KRao19dUeUxTqYPvmtvMmWqOe/hQ9XgG?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db3cca20-8a36-4bc4-48e6-08dca1eb37e6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 20:51:20.8700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8EGiFN6Dsu2246zc1KFZvEdM39XPK55Ymv1NPr5XgelNUR7h0HscK3uxteDPHN3XAAx7z+ZGduQCWVI6OvwGdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6550
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

On Thu, Jul 11, 2024 at 01:45:52PM -0700, Ashutosh Dixit wrote:
> Increment num_syncs after xe_sync_entry_parse() is successful to ensure
> the xe_sync_entry_cleanup() logic under "err_syncs" label works correctly.
>

Patch LGTM. A couple of nits though.

Fixes tag?
 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 2d72cdec3a0b..95c0b21096f0 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -156,8 +156,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  
>  	vm = q->vm;
>  
> -	for (i = 0; i < args->num_syncs; i++) {
> -		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs++],
> +	for (i = 0; i < args->num_syncs; i++, num_syncs++) {

How about?

'for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {'

This is what we do in xe_vm.c.

Matt

> +		err = xe_sync_entry_parse(xe, xef, &syncs[i],
>  					  &syncs_user[i], SYNC_PARSE_FLAG_EXEC |
>  					  (xe_vm_in_lr_mode(vm) ?
>  					   SYNC_PARSE_FLAG_LR_MODE : 0));
> -- 
> 2.41.0
> 
