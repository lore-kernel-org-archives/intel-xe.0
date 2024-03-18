Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6887C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 20:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F54F10E7AB;
	Mon, 18 Mar 2024 20:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGRMnb0l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3255110E7AB
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 20:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710794332; x=1742330332;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gii6spzwOxkdpbkkL17QEkL33wI0OHdhCeCtbH6odus=;
 b=eGRMnb0l/v7ObiK0Zuhee+gRXrncQB4Uq3a9pBwqbCeJcs6++oZBOcbc
 w3qgEWphN8laEaupFP9s9bQM6znblpJQc2BCcYi2X1Oi7Q2eNNEamyiU3
 QTJkgYSc+xzlJ4PFp+G3Gm9Vou8kapJoTv/UJPPuSXPcQGBPzyYe0JXC/
 1uyIi4k94BKSTA1IlauoacDqrw0hHW/+QoBBI2nhHQb5aZk+PrVlJBi2I
 93mFLytGdXGkPyDi1GtshxLkMvVvVC6Yin2++WeYOBPQgf3Q+T5VS/Gwp
 XdL7XiiW+70oDKGor8zUH+T9p7FpRyywvy/aXeXAHSh5kMAbpLavb1L+M g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="8577764"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="8577764"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 13:38:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="18059671"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 13:38:51 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 13:38:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 13:38:51 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 13:38:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/wBhV/YYHXUPENlFvGFsgOX3wU8wqU9mGw6POfw9vgoHABXiZOiWBYqXQpq5PFqYDfSJTqSE6H9ejaq3sYL38LKAEXYwTh3+Up/tdXitVHa+ji4gGJvW1tZddYrZ8HXa3WtgQOhG0ZBcJhhDtnhwKI2cBBi/04TOgRHi4r2Ls8a0d2k0gny0aos+zQkCD+Ye/SUcxxdbz1/rJ2xjuDL64/8TUVYxy45SDM6np5QVk+DDk91pXVwurSioPiZ1+DV7ct5ogGImSq0bQfkMlUySdv3GUrwofdtyQV9F8lImTfdaH0Op4yKBuxLTAIQvqfzwoTLR1mCi8DiEI+2cA4ogA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rp4glUmSXr1yAY7Kd0MmqQ0Gf/eWHUJ2SvHD/ecFtNE=;
 b=WNPTVrwEiL+jfWPZXn71CRn1VxoE8BjxvEY8QaRkoje87EHV9fR0EmN1BJ8J0JQXSTDsHqJV+I3i/HHEgqEXQ+JLxA/082vrEkLmu1kCWcUht5lvAaXuFZSA6Y1fVJ62cC55FiW9pK0uK+GEpEvoJtU19jdGp9ujOvBtAEP27q2bKtS4/w/9uoVqx+Vc27UsUAVo4ltAMcRZbw3U0WCoJrAQlEnCrSSyNFrShV28Vksyp5hP7t9U3LXqiAf4WBgYRh4JrYJsxaXAw89aygC/zxuc/e/jyYjPsQgsUpTlemNR9Mvj8OgQxCluYMTouR/fs4DII1/0F/g8TiBPn/37Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV3PR11MB8481.namprd11.prod.outlook.com (2603:10b6:408:1b7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 20:38:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 20:38:49 +0000
Date: Mon, 18 Mar 2024 16:38:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/xe/device: fix drm_WARN_ON() check
Message-ID: <ZfimVQfEp32JOj9F@intel.com>
References: <20240318113708.32938-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240318113708.32938-2-matthew.auld@intel.com>
X-ClientProxiedBy: BY3PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV3PR11MB8481:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BPM3+98YOGcQs0Q3URUG7x4l9s5vyJZPJ/4WkW15nxdsYXjcOWLwl4sKppGKlgl6mjuNqH6aad7Uvo1STQvKNABUkku0tDjMi/dto0KPJL0fuFU3QltKRiCluSZ7SEoDDTZuPWKe4mqHtuVCSNEuZLP5oJQIUS3/F3ItemomBS1yYUBkoSaNHOJf0PX5edtEOU43eFQx1pgN0vvdf+cThSbN99tmAFqsX3eja6SJtzOyisuvzYRBudZvVapoaPoiLHRzCe/4RpXC9FdmZGV+vhaB+Y82nCnFycOHxwQq6HjD72UAvW3lHFx4G4hjcfGPYc1nCbIJiZ2PcndeWuOlSXgnFmowDvwLEkG9eGOZqpvw+FVnHX6yK+6g3+afrdWBKu4lHBRkRAiADf7NJdDIRAeB7lO3ZhaiMdGopOCvMmDmDJN4NziUp58zRNXSoWx306dDR92lHnBuGOKRBxZcSJaoNpwM0Uq6Effa47lPtG4KwWoTysXoVXB6J4E7KDudIju/mD3CHbj5VpxSl9jziE4afhwDsL1jdOcWquEonvgdK0Ftdzrnap5aMtxE+DPtGgD+Vg1iXAVSraIL1/uXL/6fpnzQgpStj/8Q9mBh034LLFl41iOGLs0fmuGibR43sp4KUmxDRpG3o1uFMe0LHOyOke/fmpoaeGD766wbMwo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1ebSZ/U3DirkEGZKZu0VHrLwG7vyU4evdg9E1eiNLsFRpHlh8COyXn9OzNTA?=
 =?us-ascii?Q?gtVqPa79jO1crTJCpp3Q6pGXEXTbTeuD0Y250u5J8dlhFfaQ5b16cJoyQ5Ux?=
 =?us-ascii?Q?G7CXmlXjxmq49Szoa06f2ySYunGpfAbvj6l49yBYt4qDrfjfn2ZrOUclPvMi?=
 =?us-ascii?Q?gVXmDkJde4fSRxJ91TQoUq1QmqcBZEcG4TZHWB9ubCzjmrhjn1mV6LXlMJNT?=
 =?us-ascii?Q?Idi+IN8Lhn4UkfP/tF570g0uj034ic2++G2T0e5aWIiuciZzgOTN5tGelG5f?=
 =?us-ascii?Q?cw4IpfZOK0GBQkMVDDtaxJjg/7a5ZnlCWlRCPkOiHlstgXrr6peGvqtkgVG6?=
 =?us-ascii?Q?kNpxKeHlmUtK1uF8v1rfl+wydivZdNx/lqHXWpPxhLTdXa7XsctoDHbBOgLD?=
 =?us-ascii?Q?g5iDDc7M/Utl4M+rl8U9N3EzIxI3xmu03jXYiDQf8TUPi2TqZ2E9Vt6bwZDD?=
 =?us-ascii?Q?anOvSmyraj4FLFL93+U7leZZfDHcVwAx6GqVNieqyEYi48fynyFI2x3Hx0RT?=
 =?us-ascii?Q?6+pm9QDZw6vVhBUWoL2h8pdsd0+KsvJfjV1swQgnKzT0ed5KKkgbh3YmSxMM?=
 =?us-ascii?Q?BRmt1XedzAdJgVEgA6JYxfdl8EOA6ydJ21Y2GYrcyLbR27NxSTwyZ8MfMB4J?=
 =?us-ascii?Q?+GXymwskPgPzmmAX21TKL6E/sLMi1OejdEMRmhJhRWJ+VYT983qvHPtOPwEN?=
 =?us-ascii?Q?ZpHmB1JcrzCU0Jv20oaCM4TqlxcFxHfA+pCTMqb5dar0n0f8T6e5RLyFO4kB?=
 =?us-ascii?Q?FjDq/VpCrWR9MCZYza8yfPgIUgEpb5IvvrpJZHm0lkfxjRhI7PKlo47g+iHD?=
 =?us-ascii?Q?b1Pj7SgWCYcr6rHnTU5hJ7bbst1+ZEbOMncg7ufgBxLMDE57WfR/CQ69rh2v?=
 =?us-ascii?Q?XRNHED36HUbT95WDRDBC5/qdNx/rnZ/EuP9wUdLEi/DHpOc8uYzeQTiGMrIx?=
 =?us-ascii?Q?9MGAMo9P8/cFNWKe1Ri07rjsuKLcOJG39zlYA7l/AMsG85d9hYbN+7Mhw4Pg?=
 =?us-ascii?Q?eeQ7Xe8U7UmFTsGqnzzcQwCBaX8sEdPvcSNFCUtHBlPq5VnjU/yk0LfxbKvc?=
 =?us-ascii?Q?smKC0GhsxdDBo7FWduWmfPWciHnkVOsdl51YGpWRo+WPbJ83/Fa9thMugtis?=
 =?us-ascii?Q?HVfgz6BJddnrW0d0Fgl2PB6cs21ooQBJ0gT+yk+gTWgnWx4qxmdVt0nIqtEJ?=
 =?us-ascii?Q?MLzBgL34BtNXB0XfW5tyR968V1nq/4Eg3GxHmf42VyRScwr2F0bRec7xVpqS?=
 =?us-ascii?Q?MVE1nXvLRdqNo46ywRBZ+SroxVo4n9pEVVH020KQAQ5dRspIe3DjBlv6WPd7?=
 =?us-ascii?Q?/Bx1IeI6b1asevxZMq9vIdHkZxsL+TezK8jUA16tmLRENExiNkwhULGyl2lY?=
 =?us-ascii?Q?DKXocjTl46fxP/MR0oqdg6XT3T6+o5RqFvvYuQygI7q7Cb5/BnP1Zu2/8Fhk?=
 =?us-ascii?Q?46JQ6TrwTYITB+Byo/ewkptlaRwErTfpWoPjVXBPTDEEfQpXxm+QIXCmV7PK?=
 =?us-ascii?Q?NQURVNZDc//+srnYJF7b3kMuIkrCTAUGerMcQlVDBsWs3Hovv9bGc1fwV/IN?=
 =?us-ascii?Q?Yn6Kp71PEewookvAdy0zoSRKnn9883+KgKSsyl2+IwBZCXcOBj/yhtblaZSY?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e61fc1ed-0b67-4664-a0ea-08dc478b6a9c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 20:38:49.7213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UAec61fyltcSp89k9hqz/vaecwaTbCNiGKzEdJcErYFdiaBZvgKUVmO1jG+ltagA0LF2nTrbWpwMptI02b8/3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8481
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

On Mon, Mar 18, 2024 at 11:37:09AM +0000, Matthew Auld wrote:
> Here XE_MAX_TILES_PER_DEVICE is the gt array size, therefore the gt
> index should always be less than.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 14be34d9f543..6b32f09a4c89 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -79,7 +79,7 @@ static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
>  	if (MEDIA_VER(xe) >= 13) {
>  		gt = xe_tile_get_gt(root_tile, gt_id);
>  	} else {
> -		if (drm_WARN_ON(&xe->drm, gt_id > XE_MAX_TILES_PER_DEVICE))
> +		if (drm_WARN_ON(&xe->drm, gt_id >= XE_MAX_TILES_PER_DEVICE))
>  			gt_id = 0;
>  
>  		gt = xe->tiles[gt_id].primary_gt;
> -- 
> 2.44.0
> 
