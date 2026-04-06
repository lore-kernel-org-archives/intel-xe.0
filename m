Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBB7F46C44
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 14:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E6310E24D;
	Mon,  6 Apr 2026 14:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iq2zuaI9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E7F10E24D
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 14:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775486749; x=1807022749;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2hMDUKRjNMNJMGhkNs1KyQf+VG5PiNp7LYXAZSsEXK0=;
 b=iq2zuaI9QtKd/lQs+bvR/p9w7aRdiW6WkXQbGf4Q8Mi04j7NazrzYBJd
 d9qXufMyORMJdcBDCiq08UIkNW4HgaPE+SJgkZmBqsz875FXLZwryztSv
 eFcnTyWW7KRqsIXU/vv1coXpj/h9EY3jBtiRtZNcCqSxnZo6DoyuKtwRe
 +PAG5YB+Qq5fSHkkohtxOQNW/HepRNPkpYfGA6BsmMYu3syaowC7tFr5+
 3KinEk+Cg9I3R4V2q9rl8GKOQmqecwuNqixtzJhfHMO3f4YoKK9SyTW73
 Ver8JEoQ/VBU3ZNjPvaa+cdNipGziv3umTTSNn0WbpedZBu31rjCNumgm w==;
X-CSE-ConnectionGUID: EM+Q0bBpRUKycl3HEV+fjw==
X-CSE-MsgGUID: xoGSxY2CTCq6PObMM1Jr9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76623994"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="76623994"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 07:45:49 -0700
X-CSE-ConnectionGUID: epTL4sFCTbqZfN0gI/ecOg==
X-CSE-MsgGUID: ne/WmngMRQmYmYcv1YoObA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="223100000"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 07:45:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 07:45:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 07:45:48 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 07:45:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IuAtPMWyjaqzfblQupBXevxe5CaWexXRFXHoQpWQOdpz3jdk8HfoLh+/K8fx1PUQA2q82k0lzxdxN03mQmfGV6mCX+rLzR+XRp85lE3NK84nQJXqDr4CvUP+mFfagzkyE1gNRy0cH6MSjzkITIKMClNpKlYthR2Sl/x0XQp0cX+JOqdR8vV8UAiNx5foS7WVfBe69R55bLqo+II6qJKpEnAWNbJRSP+Ef2+54JKW4HEhJ0tbdEzGI7/DsRXBagG81xgDCQ73gtQUMIkA4gPqAa+GD0VDN6YpXMcKesDwWUMYBPz9QzE/pyaygm1+4V54peimN+RZfWwR2HHa83xN0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G937ZWSPEH0Be8oPOjmfjy9Zc1Fd+HmFH+brbgqp3VY=;
 b=AM7xGLrDB3qTnOfER9FOyc5foGGiseWn7HEt9qNSUEx/TziAd6mjjrs5Fqalj4srNJKVW/eI6Du0r7I1AnfcXpbEKbxi7ufu826sJrKDETGyvlyAsgkC5RCTbasb5U0/xf4NI1hzBOHl0FhERe5ACWd3DAMaYmvcvAOJOd1ImjfCb75LvrM7Un+xY1IKPa1N6ApSHBdSm7y0NZiHuP03Csan12nCI6aS/de3mlHyZM+M3GZMwMN8KMdHBwEZQiRxTpjhr8Oq4lWBUuwEVVzvwb+HO5KmP3qcuFGvlbIEX7Y7sev/suU8dGIEW4Kr3yHpGCLO1KFBa7uSP87zSqHOgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS7PR11MB6016.namprd11.prod.outlook.com (2603:10b6:8:75::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Mon, 6 Apr
 2026 14:45:45 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9769.016; Mon, 6 Apr 2026
 14:45:45 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3p_lpg: Add missing indirect ring state
 feature flag
In-Reply-To: <20260401223401.GH183713@mdroper-desk1.amr.corp.intel.com>
References: <20260401-xe3p_lpg-indirect-ring-state-v1-1-0e4b5edf6898@intel.com>
 <20260401223401.GH183713@mdroper-desk1.amr.corp.intel.com>
Date: Mon, 6 Apr 2026 11:45:41 -0300
Message-ID: <87o6jw406i.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0052.prod.exchangelabs.com (2603:10b6:a03:94::29)
 To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS7PR11MB6016:EE_
X-MS-Office365-Filtering-Correlation-Id: 90cdeebd-e8d6-435e-8648-08de93eb2f2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: zGxVT5bJqkfrUDtVfQYyPvYOpyxEaK40HdIYTCibUU2xOZUJmzLX0TF+STKGY/wqtZWz7ObqJfSLUawXEiLCmas1p4p0mQSvCTfRBY91QCuI0FaoxAmdNhcdzC5T1sLmNemZ3cs/EYJIkeBogjoDBZAqMqgHp4BkPhVPQX7G+TwNwPBgMvGLqALH13J5SSjUlX4/EnP8pSIBJTkU2i/YpOC4qwhGwSVnSuaE2YnX4LQD6M4jHwfytF8bZa5Khy17xqPZ6juDqbhft0zmCNtZuvuioNEYi7PHxjiAM6N6KvXcW/IRT7TvhnptWPahPFJIKG3TqdlNohM4KYwD76NRLT4RFu+Y9XH68xE65Sb3U2qFjonEDvYUoK4tssGmXhY76nwOx/Dq4gm0GEVrMjnueYWWd2GT+AEqms+G8PlX1dCSiYTq9nWFCEhaw7QQrm2ZSgJBCLE7RrYMrsqICXVGJZ7EeaxtrEBvxFKYA0kpGhNzcBAvRoK+kIiTRNqLUQAVJVErnZH+cgXEkjNo3DJn/as3CPDNyYwEkSsw1RN2XH4geLq4NWT4YmdDHs8/TFv8w1zcdj6meumMGAmGIqQNl6ylnMggA4BxDagSQ1DpzAus2o9sNE7yUnVCYXjop71UyOPxY1xm3oV3l5aQS24uw3wtAQfDajfirN0nK/UI1ljHnmR2QmWUloXBdNIbN7ocWOCxdnaMFhPG11U22n7mVwAqMDF2uSnPu+LFszT31+M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X/nc3gRkyCXUrgkRFvDMqYncwaGYW0z7/piSqfSmqV4NivrKK5rBQPvTNaXn?=
 =?us-ascii?Q?8FovfJe24tPv3OXY6uCvyB2viFz1Xs5MEOwbTYpvy26vQ5anfSDyzBXPgBl3?=
 =?us-ascii?Q?EAzj0rUOb890ogrZOQhXHPez9rILEIwxCLPLLxP7mjAaF+QKmNZyZGeokWe5?=
 =?us-ascii?Q?pcwfAgnmTxGR6nsnbxOEQI1geYhE9aaUZZ4wlKchNrTArBvUnjaYW6LO2ucl?=
 =?us-ascii?Q?gthc8pU/g+hnq6nk7RVUtp7MmYhd6I+XEwFS5Gg98HZxplG7Dm5nxJscN/RX?=
 =?us-ascii?Q?Z90qvE3XxQj8nNcuUVIHYmiiPQ1xt4ZdstRqHOkCcpOXYhbxc8N5dSKn7/ry?=
 =?us-ascii?Q?Vm8YY0O5iYmbjOVaP5OWHCp4QZRmAcPZej8O8ODOfLCMakfzJ6eWKnjVh27j?=
 =?us-ascii?Q?dTf99cLol7rVkJPKey42WF4LJk1ecXvJBFzBcWz3FmjbdmSDGOpTRR7UCekN?=
 =?us-ascii?Q?+HIyWDkmk4SVnyBTGLdC1Q5vSFtdh0X6uAwuj8QZsiqbbYV0v2EHZeCMjQJO?=
 =?us-ascii?Q?kCgPRJsIxdJ6W+K0rBjWWI9r2o5LV8TjzIBgWerxKO0a/6vLxzQRHL59qOqa?=
 =?us-ascii?Q?cbl1dWNjXUE5o5hp2mJ4Wsh9UddaWr/l0svDXJ2Zoeeebr/fQu6b+rULgkFT?=
 =?us-ascii?Q?gJy8Y9CSU22wOET693wQ5QQlAzIgdjgfBfhzEMElNcZVeZ8O6MTbnS+nn55f?=
 =?us-ascii?Q?snQasiqym5awnIPtcfnzOK7ujPSDGGZYkbTT4NAhcfEImR3piXMtAE0Sgjhs?=
 =?us-ascii?Q?k1Tn4VkHgWwfd8X7aL9xiRU7tgUWrV+md5lOcBsLgexmRPtvr+Gq7yTK9e6C?=
 =?us-ascii?Q?fW7qQ60+MP4gXq8WhDy2QJHav9mXmcKqhoInNelbGnC+TuaRGlLO8PjaM0l6?=
 =?us-ascii?Q?x3KX0Ir/Y0GByrfPoy/nzzXbrE3OvzNXXR4A2yANWgEqf1k7/2ESdeH2sZ7P?=
 =?us-ascii?Q?wjSsDdkXjKsbE9kmx+ZNHBYf52or5Ai+yEVfJqXABJrRRrnPHZl68t7Ghn8D?=
 =?us-ascii?Q?+LgWpqEb1e6X735AZctAqaJ5nj/Z/zZiHrX17wiYgNID+28r28a6qfrArIRS?=
 =?us-ascii?Q?jZxgXDqUR8fyNcJpmdVYz+Fyh+NrqIhVh1BjcN0Auo/nxtHe89J70HqpXlqh?=
 =?us-ascii?Q?9P+Kk2w7jSCBR6WLu69wD7iXalGYvtFgUGyYTK8NdU0Pgi6Y7zzM3uo1hgYp?=
 =?us-ascii?Q?g7JYc6DPxE+TZ9DGItLbVZWJ6SGxqTFpVcegxRGzBUMHVKLXnRSCSpslQ532?=
 =?us-ascii?Q?bpADbft8iTfrZxu9+LG6C6fffrxCfdi3OQ+IzKuop9IpNaeA+L2HKCAd1Tq4?=
 =?us-ascii?Q?5eZE+aTVdsIdP6sAFmzX7ASKGPBL6fJJJm767L0WYsy6ySU+TGNBjKOHIeUI?=
 =?us-ascii?Q?oSq2hdiG51nFBkGA+CdaX0o7zCK9he470OGhpV7SPNCB2L//lCuBJoqBMec+?=
 =?us-ascii?Q?m7iPU3S8OmlH1NOZOirPt6xfOyVGMg4NjS0jGblPtPKWLYlqVUaKBAdBav8O?=
 =?us-ascii?Q?VCYy4WPw/lX5nWOSJTTONtFrjkJklroCvZAGXsAnmeUInvzdqRvTE/QywlmC?=
 =?us-ascii?Q?R3HwoCx38QKAQ5fTymMeFLKvWIoFkx9d2RfaYgMHyAQzCqUEvvSJF+z9EP/H?=
 =?us-ascii?Q?6W2QfWkFX9MQi/TO/9LOROxATEVuv1QZFxo7KeQNl6wkXiWGHw5D7ZjJKqin?=
 =?us-ascii?Q?nA4DzCYz7QUfImlaSfnXYudPWgmjmdK72jdJldYafqLsIhyCzRyQEdUMYRh0?=
 =?us-ascii?Q?Phvx9iHnGQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: oGzy3vcJKESIz3XcJxPpMUkeWPJqZwaiYVUQ2WSrNHmswxPCNU+iS89YqfWQFICVTENrO+wJNYMFh/hUwsT4efsXt5krpfkYK4wzSxyfMAE8dj1m9uOkNEwH8G7GUYCciwomDXg55CavfEtRhRrkEyDq9M+vJmaTcKvRwIOCNw77LhUqIY/FN7MOsXxcVm5B3KuRdS2rxIIv/34fJI2E13J1Ho6T2HTmoCIrWOCcYPlJOz1pdUYrtbMADxAHItlY7v0e/CCzeOKwXyj5woucZf0tuIv9AaJqbM5fpTTeTy1/+oKNtNvtkkzlKAPJu9WkdQKuHMl/OWBYadtv6Qd0PA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 90cdeebd-e8d6-435e-8648-08de93eb2f2b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 14:45:45.4417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXQ0JjSOHRTZjaD6LXl7TKJab9soSonbqgFNsubU0idtBljUNiZdMHf3s3a21iTpb5TMBXvw8k/aBvD9BTKYcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6016
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

Matt Roper <matthew.d.roper@intel.com> writes:

> On Wed, Apr 01, 2026 at 07:10:51PM -0300, Gustavo Sousa wrote:
>> Even though commit 8fcb7dfb8bbf ("drm/xe/xe3p_lpg: Add support for
>> graphics IP 35.10") mentions that the support for Indirect Ring State
>> exists for Xe3p_LPG, it missed actually setting the feature flag in
>> graphics_xe3p_lpg.  Fix that by adding the missing member.
>> 
>> Fixes: 8fcb7dfb8bbf ("drm/xe/xe3p_lpg: Add support for graphics IP 35.10")
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Pushed to drm-xe-next. Thanks for the review!

--
Gustavo Sousa

>
>> ---
>>  drivers/gpu/drm/xe/xe_pci.c | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 1df3f08e2e1c..6e560ef84a97 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -118,6 +118,7 @@ static const struct xe_graphics_desc graphics_xe2 = {
>>  
>>  static const struct xe_graphics_desc graphics_xe3p_lpg = {
>>  	XE2_GFX_FEATURES,
>> +	.has_indirect_ring_state = 1,
>>  	.multi_queue_engine_class_mask = BIT(XE_ENGINE_CLASS_COPY) | BIT(XE_ENGINE_CLASS_COMPUTE),
>>  	.num_geometry_xecore_fuse_regs = 3,
>>  	.num_compute_xecore_fuse_regs = 3,
>> 
>> ---
>> base-commit: 40f5b5bc2d3df4c7c2d4e27b35b2d8179ac3f10b
>> change-id: 20260401-xe3p_lpg-indirect-ring-state-6220d15b2322
>> 
>> Best regards,
>> --  
>> Gustavo Sousa <gustavo.sousa@intel.com>
>> 
>
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
