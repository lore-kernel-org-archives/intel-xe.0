Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6549FD3C538
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 23:54:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29DA210E10E;
	Thu, 17 Oct 2024 23:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JTstnfMr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9603310E10E
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 23:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729209272; x=1760745272;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8OKlNgXxbqJQssdBlLwuq9yb8z37e1yE0MagXZfG7Lc=;
 b=JTstnfMrc4VlilPf6tC16O+iDxlj+CMuGBh8YCQyLsamPxOI1bjXWcN5
 6i+Hvg0vX3serxlN7c6e3fRNganpfG/O1/3DC3FGT1cIJ7YoIHbaxnjr/
 VI5tvPmPLVWucBzT3n8Vp7+IsZaJr1WwHLPGpS+eH7OwTKTOsY4HXqPYB
 OW9xt/Wd6FqwUQC7rbhjIBxfnUWzspM4BVUSs3rjXRUajAxvc45QSJsp4
 6s5wK/QxPVw16JBsYDYsQs5cy86tG7Q70R5d7pR30JcisqWpNeAgB3La+
 mDvx79B9zQcaRFbluVmzJq7Jsb/hkApJgNRsoNrn4FeNFjJwkOXMDTLYC w==;
X-CSE-ConnectionGUID: XswrtSG0QoG1xmClDuTcbQ==
X-CSE-MsgGUID: polHvFFwQCisgQ1F8YwGrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32409501"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="32409501"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 16:54:32 -0700
X-CSE-ConnectionGUID: RLhFbMMjStGUZZblbOb6Fg==
X-CSE-MsgGUID: 9J2mpGLwRfakn7KdxW09Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="83479377"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 16:54:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 16:54:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 16:54:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 16:54:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 16:54:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FX1sFauR8qb65G7sTx1WJRr1KWzfMO4IeegJWJgoq0Bekx5Bv8Om3RcAHj9dsvcke80LJbHDc7fcKhpvPiO2l7bJvNWrg+t3CgGo0AayMHgjeF6mZATj5rKQQnud8sZOn5p7qaQ+rpIU6zlEyRqhcOKgKpa8Z7JkNXXRyO6Dj+Gn9hwLBHenQONnRZ36VA1ZG1+Z2R4d/Zd/Qqq6ujKsdUxc/06z3zQvnJiX0fwS5AkSTesSQHr0quRTg4SPINS1DIpW4d3w7EYrFZw1vEfML/EOWTV6k1S9kaRpKBArEBkYdt+wzPGO04VvwHRSbo7Vq3D1tnP5ByqqR42/38cTlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X621SdbraUVfbjod8WDJiDcfv9dclNx6GHUT5tYy4Ic=;
 b=G5vIynyitgnDWFgeUNrzubDYfkDLDEz0TUD1Hevhb47Jxs3YpWJuBWsr8Ay6OJGO/g9orLX4pE5OliJ1gJVLLPvKGsnUrueXndGXXDrtpZBohudcJRX4pXKPwhnhRbBgNmqYPpX7KdUzH+dCbFt7U2MqtFwF+1Y2YzTGJ8TNBEwg7q7CmTtJH7/vCH9dwJXfnwcsj1ywnet2qNwpiyxZbKdHvxOY4NM4AR7WQ1N6458zp0rEfFM2T2lwy1thuimkM+AQV6TvwQDEsK+Pdbfw+GSFu4545lrG5e23tWb2/jQXxfRfbX2NEbVS0fV299xCHAyt5ezeprM4H0k6c4yS3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5200.namprd11.prod.outlook.com (2603:10b6:a03:2df::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23; Thu, 17 Oct
 2024 23:54:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 23:54:27 +0000
Date: Thu, 17 Oct 2024 23:53:39 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2] drm/xe/ufence: Kick ufence immediately when possible
Message-ID: <ZxGjg+DwLbDhiNOX@DUT025-TGLU.fm.intel.com>
References: <20241017094237.279327-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241017094237.279327-1-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR05CA0157.namprd05.prod.outlook.com
 (2603:10b6:a03:339::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5200:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a88799b-fa85-40c8-e843-08dcef070934
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FxcOoZ/+gzejaWNaAk3p5VneytHEPfYci9V7eg+eJSIWEWrW2b0YDhcXmnfM?=
 =?us-ascii?Q?Kh3u5znqyFXTLhFjzeAuF970bTDgO8h/KFKTkoirq0/LQt9tR62FpDduWeE4?=
 =?us-ascii?Q?xpY4MmstNg4ompxtTWaGzJcUU1CKgyTNE044ESNdCHGlBgaiqQ1TG5BnrBRj?=
 =?us-ascii?Q?Af2EImwyCCPfkRzPe6MRcLpAR1VnFdiMvwl8BW0EFuUAtwARde0Jnga+8f8b?=
 =?us-ascii?Q?DM725xAr2wZyYL9P3pLrfW/KCL95hmdaSyJvqx6HmF91yW7jECeypOAzEjzj?=
 =?us-ascii?Q?fnH5acIdfsnghdQFc4BflNWOuYwX6fAKf8HEhQEYCcdPdMON2si06B1xob+P?=
 =?us-ascii?Q?gBfBLkEdG4GliEf9DVcyP80FtDfBq01IOs8fgsaMj8CDgdj4TRajFaT78GWC?=
 =?us-ascii?Q?fqBsLNz1dVcQTbMV4FT1QyKoIifpaKt74g1k6CVzkKYBRf/hmICnO/KBO5cr?=
 =?us-ascii?Q?dhNDWp/M+PncYk2OmYQ6ZFozMwVPDUashg9l/Y0XgyCfenEqXZjfMY3+Hmne?=
 =?us-ascii?Q?JuxzdxJTKAGUHTPmlxK+QcrDKG+PJ11WANKXk+BlDUwDTLWfE0nwrh9K0idN?=
 =?us-ascii?Q?ppZTkS3RYhylP9vBGDJ5NH3dxpzhohUHpqqwzdc3F2noVw+ne249EZBMRxgr?=
 =?us-ascii?Q?YifkuT/uNvKccdL3U/qKfpSm422Mbw8hSxWjKMSD7f5ydLYYiDDY+LcKhaVE?=
 =?us-ascii?Q?9EGIiSquNvLhrAnfB1JKxAKZgtZ+Dv2b6ob9g+kq36LfwnMqRPbK/5wjtGR7?=
 =?us-ascii?Q?MG61aPAXHXNomgSRgTsv766niFuwIotclRHJ/z5u1l4Dpdty6F4iD/hqXFxr?=
 =?us-ascii?Q?i2b/V7xbSFFrTSTwgVzgaeCGHsCvuzHZsnSECh7B0byhuPhCFhrRjLs+MOzj?=
 =?us-ascii?Q?pp0pOJbERFklgPgGxJ3triRcXwgF3cKfRswdPXtZrq4epB5zo7b5anvO9xNU?=
 =?us-ascii?Q?cR6WIYU1Zo42Op0CwHkpbWLuEqvfaDRXUh7eS8NDiLAXoSMfQOszkHerSg4E?=
 =?us-ascii?Q?pN5lsE93x1wZfBMkfxup7nNIIzq/M/Lj79lktFl/pUmqIv/AAaSdg/zZd/D5?=
 =?us-ascii?Q?41jD4b5EbHijSfTcLsmUW81NmFYRGxj0xKk9/HPRfHUROyTN9DAcsVAI66Mb?=
 =?us-ascii?Q?3NoCDmXUM/nOg4Ot2YwF64XPMrmsv3XBaRMMc8oKNilJ0KmVtkZ2PDshdRA9?=
 =?us-ascii?Q?0U96EEfEYCce3QrU5TTGwa2dR2OGaazsYsphQe0g3me5vULVkr/Ym9DJeCvW?=
 =?us-ascii?Q?gMr3i02cnBUIARxYkxo+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?isnsHO3mLH9GpQmr2mYxrz8KATxPrOVigUcJZ5zRMAVtSlBCHMgOqZSwfhl0?=
 =?us-ascii?Q?+CSzLJp4yszaW+Jf2q6OU4N3HQMGKsYFG9V4iyrGzrq/t+0Aclt7w8uU0/Jm?=
 =?us-ascii?Q?Oi6LvnT6ZoOQoowu4EluhwHhejp8+pr7aVtxrhW0hzjLL79YfGsGHKjP+HLN?=
 =?us-ascii?Q?+RmKoT/mH6RMmHeO7X8lHqaOVE9aqFpsiMn7Sc0Vn5WPCigjTHgpPwlJVrDF?=
 =?us-ascii?Q?FJB2qR6i26UX/SbO/lbvOGp7LsaL57hFd28qqWwbh5FstcvQlo57v0f5EKyT?=
 =?us-ascii?Q?nVqVKYCa7K0he5TvChTp3OycuMr01kYo3GYozAxuDmgsSffbW7V8q1tEdifb?=
 =?us-ascii?Q?WFNenjq3Q8cuj2gP4Xyvhk4Nib2bIU7w1AQ4QhPO/hC3Nd3o8qdxgsLjbzFQ?=
 =?us-ascii?Q?fPoeYYvBR9ZzKheVk8w+S25oTvKbAIczbIXeS8OOJ23grtn2GfS51dnzpgSv?=
 =?us-ascii?Q?QsdaHaOjhZIRGVQtcT5w/rE4Xo+YeMvjVP/4fviR3IZ++Htzrr/YL7lq74bY?=
 =?us-ascii?Q?BxUq2eKtnqed1Nu/laVBklSGFqJco1sN5/+LubcILqburMBe2ztxLaIaV+qp?=
 =?us-ascii?Q?z02HhJqgzCdymKLxqaD2vHMSyt3dKWh1dMPSDi/BDJKkyKeVfiL2JHKUXSA5?=
 =?us-ascii?Q?EpHNbUEzAWr9qIs8mOfT2ryFsI10jVd8CWCZQvsD7cT44BbMr5rR2EQcr47C?=
 =?us-ascii?Q?bZTlnRTqzOI0xDWH2v7K/WacOMNqnVueXr+hTan2nQdhTd7aqSiLXApQ0GLb?=
 =?us-ascii?Q?1suOQU26YwWZTb7wUrBkyErVmIvP/wCvm2Jx5EkUgCJ0LFBGSPhRHrhxlmgF?=
 =?us-ascii?Q?N61wfvwgfX0A1jptDg/ZZYKIu1qT8ZV5ne8HnUfV//TwrWwLS2hMKqvM7WT4?=
 =?us-ascii?Q?B8Z5WakNWbLUswc5LyvSuqwjz+Na/5kij7HsGqTaVJJXvhdvkKAS4OfkJN2+?=
 =?us-ascii?Q?r4oRIqqdIDpgXi93UNGI4jQd2mCCPJJ8ttryDxVNIv0C+FHS8pMWr89HrngW?=
 =?us-ascii?Q?t3OD+cAZPvvdPK8iGLO7SdJ+YpHbmjKDyrywmaYdUsOK7ntDgJvkEIo767Ft?=
 =?us-ascii?Q?8RloU5hUdCCz0sM69m2sh5xnFrLxHA4qgUvpiqKNp/1r6DAwv1BBd2yzkSY7?=
 =?us-ascii?Q?As9F+5/LPX1UY/dZE++EDm/2QYB30F3eVTe0blrIW2Ni9y6wR4u/fM5ZH/4E?=
 =?us-ascii?Q?G8HervUfEmJglPgdGLHwrg38uzacG5YGQfElDtudkahwO1ZHDO9MlFKQRpgf?=
 =?us-ascii?Q?q06K5kWFFUamYsJGkOmB/wRmr3CSwEeZvpmcncztW4FGVOqQS3Id2BmfpGET?=
 =?us-ascii?Q?PRTRLZmF4kR7KLAf/xBDYVHvcNInQRGJHPPwZXk5O1bFB+YrO2t+F8Y4/0OK?=
 =?us-ascii?Q?+UvwkQSrZE47kzZuvU8U3vg3Kd+AIgUG1FZizrcI2/XZQhf94qNlsFt+rvoF?=
 =?us-ascii?Q?SGfysu6loapZcpaaSFTDuDYNQHu184xyoW7z5+mPBtc3ZyQAn/+xDA97NDZ9?=
 =?us-ascii?Q?61eGzrCrTdbhUmOt4w2F0s3jg4PfCdmuJZ9p004cTWKhC32rWGIG/L3H6dKo?=
 =?us-ascii?Q?frEw/g7nimzvBd7yfLBqF9ENdf4wzO7L8wRSmXat4i+oMA7SIuc0ssvzM6/1?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a88799b-fa85-40c8-e843-08dcef070934
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 23:54:27.9196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OPbOULU/pXO8m5RnH6r+iw38jZE9NGWj9yXVBD6TZ2Rv34n91NJ9R+AFuU7+VGsr/M+C4y/5XaOUHhcNuKHT+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5200
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

On Thu, Oct 17, 2024 at 11:42:37AM +0200, Nirmoy Das wrote:
> If the backing fence is signaled then signal ufence soon with
> system_wq. This should reduce load from the xe ordered_wq and also
> won't block signaling a ufence which doesn't require any serialization.
> 
> v2: fix system_wq typo
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
> Cc: Matthew Auld <matthew.auld@intel.com>
> gc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sync.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index c6cf227ead40..1a7907293088 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -89,10 +89,14 @@ static void user_fence_worker(struct work_struct *w)
>  	user_fence_put(ufence);
>  }
>  
> -static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence)
> +static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence,
> +			bool signaled)

Predantic but maybe replace 'bool signaled' which a flag. We really want
to avoid bools if possible.

e.g.

#define UFENCE_FLAG_SIGNALED	BIT(0)

static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence,
			unsigned int flags)
{
	...
	if (flags & UFENCE_FLAG_SIGNALED)
		...
	else
		...
	...	
}

>  {
>  	INIT_WORK(&ufence->worker, user_fence_worker);
> -	queue_work(ufence->xe->ordered_wq, &ufence->worker);
> +	if (signaled)
> +		queue_work(system_wq, &ufence->worker);

I don't think you need the work queue here, just call the work func directly.

s/queue_work(system_wq, &ufence->worker)/user_fence_worker(&ufence->worker)

Matt

> +	else
> +		queue_work(ufence->xe->ordered_wq, &ufence->worker);
>  	dma_fence_put(fence);
>  }
>  
> @@ -100,7 +104,7 @@ static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>  {
>  	struct xe_user_fence *ufence = container_of(cb, struct xe_user_fence, cb);
>  
> -	kick_ufence(ufence, fence);
> +	kick_ufence(ufence, fence, false);
>  }
>  
>  int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> @@ -236,7 +240,7 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
>  		err = dma_fence_add_callback(fence, &sync->ufence->cb,
>  					     user_fence_cb);
>  		if (err == -ENOENT) {
> -			kick_ufence(sync->ufence, fence);
> +			kick_ufence(sync->ufence, fence, true);
>  		} else if (err) {
>  			XE_WARN_ON("failed to add user fence");
>  			user_fence_put(sync->ufence);
> -- 
> 2.46.0
> 
