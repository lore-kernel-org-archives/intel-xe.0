Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC92C0015E
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 18:59:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7808110E6EF;
	Fri, 21 Jul 2023 18:59:31 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A580110E6EF
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 18:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689965969; x=1721501969;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=05epvqi+rAWul2IIglL8N0d3DAWbD2NPs/4OFNtgGho=;
 b=cqJYgUSaOR9KaGP7lCq+AESlRunm4V0W2f/xJGxv2u6ja1MLW2fRvct+
 ke9M4sUmzQiTcQoLrohEIUlxjMwW+mhI8SECcA9BkZzWqBRoaQIz+ZP6H
 xK+nu3xhRTKX52eySOhTWrbgmGgqXeWhoMi+CuoZ0dO6AIsg4XLw8lUQa
 sU3tbDD2gSgT6RP9wNR+ssW4xduZM9XyNkKeVulCDnjvAsqLz8s+i3VPA
 yAbT8/xEARuUr/8X6UIRl5GIWa1UM7Id3/ONHg1b6MrVLn4TQWvSr1oB1
 GrsGF75UhY4B+iaek+zsZhzUg2gs5q7V0gexxuTFDM4vh2PbM6F3TJtT5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="430887857"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="430887857"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 11:59:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="718925275"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="718925275"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 21 Jul 2023 11:59:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 11:59:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 11:59:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 11:59:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikTdDtmuH4taQoUR8NMDMhWseWVl04yZ7wYP8UMw96MOfItR4Pa1sllNBWy0UAPWl5NVK8fUZ6VbB1bXYy4INjbi97pTkXnngwc9n6XmX1KpPpsFa+Uq1MzBcpp48HKb3x2yqgtkNsHX6mPj9FJl8Q2BD7vNTPQA1V4bR3yBgdrSb7Im/LKiIzw40HiyMq/jN7kXig/d+BWal0AqIicA4hDe66YPYWtRpKTZehTqfMCbEdHqbMT0e12J4JdiOgVKn4HK++Q6p6a+a7zKv8UXRWX6KrSmA6CTouJab81CIjCn+1Ir+EWZzd3lOn7WIqCnECONXvyYRdxFKeJW6TM6fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYv+R3UVyLPRVxdyt5EgfFih40dbrzLWltTEtoaQ4WE=;
 b=GlNO5xo04JYLjCm/TdlPy64K02/w+D9tM+GQGpsrqxA8RUmlXPXXuPUqiMimvCWoyLKeaLdSImhVCN+xhoQIZ73KtFXAi9BqpM3a7ZwwHKg8xpv6RUsiXI/Jk6Tf5PIo3zXMBC1+FWrbSYt5qt0P+XfQNyLYEthmhNN+AkDT6xCbyB83Db6g60cyIH280Kj3NqVTjArJqIUDsA9+uVsZgDzJfe0VUimb89Qm86SzmDx+lpzVrKIrVFkbfdPGt1jaElR2ixpf7rohJLK2HruxX+lBoRkbfAe8f8CabuMOQqINmDEE/wZOLfineV/be5BXaFIOmktT6S7BixDFvh30sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW6PR11MB8311.namprd11.prod.outlook.com (2603:10b6:303:241::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 18:59:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.024; Fri, 21 Jul 2023
 18:59:26 +0000
Date: Fri, 21 Jul 2023 14:59:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZLrVihPCV44UyP5g@intel.com>
References: <20230721123424.473210-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230721123424.473210-2-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR01CA0040.prod.exchangelabs.com (2603:10b6:a03:94::17)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW6PR11MB8311:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c67cc6c-0b97-4ed7-87bd-08db8a1c9a94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TFSOtmWCOzRCROl3twbXGIlP1nbAsNS9K79FhrRCwzI0v7rvgd1lCDQZ14uAMSokehedA+1ogBnXg++g+z9PYVzMy+UDCIGfs6FgWuxR67ouh1qZUHse9Rer0KycD7UJQa31acSd74QFL/JJbaNdTRZ7k02/tGHDTjiShBTqeH5h/l/RMclDyMB7TFy+BeTwbFua/7PaLkT2Ufp24bRMDnDV/BGlHqpaXVCMQnu15P8kALUtQ4ZzAIqenOSd3++CJsafTZmWRHquNNzwLrytu0z23AapC7vqjj4LNXEdxqQui7MCNT7QF4k4RQINtrdlZnKJ4DP3WSCs6aMkzmhG2E1+Em6zkGxTu2i6F/i1oIW67g8Bo6wQr2w963/i0FBfXlq6yM4c2sRgZqB1bGxF/JZlH18qjY2MmzhnpgeovkAbekOknKacs1b6tXv1Ldf8q1PvhsQv6BmunRB6qUWVoj7TX0NG/A9mooJJUNhFecm0TLszXeHHEesnGVxyXCc2ohqtnj8NXs0z5h/LTUty+QCijKDEgoe9LpHA8nqLMFb/L/htUbTX0pIl1rUkeAw2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(366004)(346002)(39860400002)(136003)(451199021)(86362001)(36756003)(66476007)(37006003)(478600001)(54906003)(4326008)(26005)(66946007)(6636002)(6486002)(6506007)(66556008)(6666004)(8676002)(6512007)(2906002)(8936002)(41300700001)(44832011)(6862004)(5660300002)(82960400001)(38100700002)(316002)(186003)(83380400001)(66574015)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1agihGjgCOdLAvkMZfs6u4hN64FtJ/t0By9GjBsaQdaxGgcRKnci+DJEIy?=
 =?iso-8859-1?Q?v+Uq9cWqfzr8uGtGfYQDKYJhONd5rNd8v+ydT+PWilzoxBt3avTS1Dx4qa?=
 =?iso-8859-1?Q?261LkMOy3kB+mIj176iNlQV3TNcUw3HJaQx2+aXvFuyEzX6WjPVcIZ018+?=
 =?iso-8859-1?Q?26gP18ZH9LY7y0Ga3GhKo1NXzgWUjZA8b49gB07S8ZFcmhxkSlA2CCqBt+?=
 =?iso-8859-1?Q?14qZBq73U2Hp97Bn5Vjsg1ECpBRRAYJ42XDHi+49yHtM6gwBy/H470/5xg?=
 =?iso-8859-1?Q?VQd0kYkzpQQtv0HmmWKUskRj30eCZ6uLkvuUQF4TMEeco/0uLcqDmunXTo?=
 =?iso-8859-1?Q?DCw5/0FtAaLTPUwMWxwNgz/OHOfpbViTFx8SK1SndP043lhvqCyxj0JQp7?=
 =?iso-8859-1?Q?33zYo4LOy4RMNCrVxGUh08Kb8qd+u/GX5xoESPG7A6SViOPewanaAisJ45?=
 =?iso-8859-1?Q?8N1PQT0gO+IAFydSpGg/iQOYxy+GYKvu5JWGvN7KOXIf59qGHSujRR1p63?=
 =?iso-8859-1?Q?OmqJyvb/DbeZ2JQ5Alf24PFoZ/VQoI4ay2yPXu8HcZ6S3PaRmHQVAntLQi?=
 =?iso-8859-1?Q?iM15NEhCiXonoGsGn8CK6yzOZqhq8jhe3F3x9vHlq89mAp0xUHxZOZswr9?=
 =?iso-8859-1?Q?jxc/NUYJxRI7+XxFZo9NnJ4UDtoYa2VghbkE+3LL6iROTd/vBZQxv9r/XU?=
 =?iso-8859-1?Q?XFy7gesaKnn+Nk3FDB5Uj/kXrlI80LQoMmun+8EsamPNA4fTiX3fZzacyV?=
 =?iso-8859-1?Q?z3avAdvIr1JBNmerUCfzf9twNCz9pWpRaxVlHXfmSxZ3yDGFK7KbvUwQS1?=
 =?iso-8859-1?Q?lIyw7Y0Dj+wr5N/QiK54El/bgZLnbggU0kJRoJXZy5oKzb8KaJ7JcL4y9X?=
 =?iso-8859-1?Q?7EJ1ieuz7W3Lc+9uLWGdoAyX92XrXY7gQFJSQOmki47ttBHARxiEW49KuE?=
 =?iso-8859-1?Q?14S9cfP5+nCW52T1xCXfVWJjmoD3tt3IFLD0o/dO43C5za+3bvsYmFpIcB?=
 =?iso-8859-1?Q?SCHwhM2SgkBWPMGcdBPl3CTdXN+i3W8jEDHS6AOjrs1SSyI54LR7EZE1yD?=
 =?iso-8859-1?Q?R4kSquTuUSMHgFQr/KR7vsU0pqW6I3c3NKAfIrwx8WMYOxMoTNVTSyl1RK?=
 =?iso-8859-1?Q?oMyEdWts8hanmrsTszgRgMdqTzXay8TL5X74IdXN/EyQvxILk9NEMFFqkG?=
 =?iso-8859-1?Q?/CPhzqRIE+RSMcDtqS3qpvYjbrjEtjMohMaFo/CzF8ojYJPGOoHGMHRGJM?=
 =?iso-8859-1?Q?/9cQIju0jEE7l9ehGfhVnsW3lDCrDydbd2Z2QcR+OgQAHw8tA3GbnaKeFq?=
 =?iso-8859-1?Q?qegi6WEPwMXwbONTok6ecmZyDncQfbsY8mWlkLGXzyEnJUhZFnhUdv6Mg0?=
 =?iso-8859-1?Q?/YGoBGfeSWE9FTMc1fF0IBczaFVXp4D7NaxBoAuTpvZ8D/JE3peDE8sfqQ?=
 =?iso-8859-1?Q?2YDJIcWRssiSQ69X7JCRIj04G57037dTDGWWaxLsbKvaBcRNH91XPqwj7Z?=
 =?iso-8859-1?Q?N4TNQ6Ih8xxYDtF8RzP+Rp2K4OAVyYAcDFfCTc0HOzIayNgpLtbRIlIPW0?=
 =?iso-8859-1?Q?k3Dyc/yI5Sg5qxnzt5uUwcNkh4emXeB0f5U/lPlvKTDNUpcD5ugNSbKMcL?=
 =?iso-8859-1?Q?0oepcbC1O+TaQyxi9m1gClrciHIJwA2KVz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c67cc6c-0b97-4ed7-87bd-08db8a1c9a94
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 18:59:26.3826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fH7Bt0zW4TPaplesSxhmZA5DMQkcNPOSsGklYW5qlRsAKiBjigOF55BVXtxCNotTk1P8Td78GbSck0XpKuJ4tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8311
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: add lockdep annotation for
 xe_device_mem_access_put()
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jul 21, 2023 at 01:34:25PM +0100, Matthew Auld wrote:
> The main motivation is with d3cold which will make the suspend and
> resume callbacks even more scary, but is useful regardless. We already
> have the needed annotation on the acquire side with
> xe_device_mem_access_get(), and by adding the annotation on the release
> side we should have a lot more confidence that our locking hierarchy is
> correct.

good idea!

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |  2 +-
>  drivers/gpu/drm/xe/xe_device.h |  4 ++++
>  drivers/gpu/drm/xe/xe_pm.c     | 24 ++++++++++++++++++++++++
>  3 files changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 1c57944014e0..fed3015e2d96 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -36,7 +36,7 @@
>  #include "xe_wait_user_fence.h"
>  
>  #ifdef CONFIG_LOCKDEP
> -static struct lockdep_map xe_device_mem_access_lockdep_map = {
> +struct lockdep_map xe_device_mem_access_lockdep_map = {
>  	.name = "xe_device_mem_access_lockdep_map"
>  };
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 8b085ffdc5f8..593accb68281 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -16,6 +16,10 @@ struct xe_file;
>  #include "xe_force_wake.h"
>  #include "xe_macros.h"
>  
> +#ifdef CONFIG_LOCKDEP
> +extern struct lockdep_map xe_device_mem_access_lockdep_map;
> +#endif
> +
>  static inline struct xe_device *to_xe_device(const struct drm_device *dev)
>  {
>  	return container_of(dev, struct xe_device, drm);
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 17a69b7af155..d1b2aa52ea03 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -199,6 +199,29 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	/* Disable access_ongoing asserts and prevent recursive pm calls */
>  	xe_pm_write_callback_task(xe, current);
>  
> +	/*
> +	 * The actual xe_device_mem_access_put() is always async underneath, so
> +	 * exactly where that is called should makes no difference to us. However
> +	 * we still need to be very careful with the locks that this callback
> +	 * acquires and the locks that are acquired and held by any callers of
> +	 * xe_device_mem_access_get(). We already have the matching annotation
> +	 * on that side, but we also need it here. For example lockdep should be
> +	 * able to tell us if the following scenario is in theory possible:
> +	 *
> +	 * CPU0                          | CPU1 (kworker)
> +	 * lock(A)                       |
> +	 *                               | xe_pm_runtime_suspend()
> +	 *                               |      lock(A)
> +	 * xe_device_mem_access_get()    |
> +	 *
> +	 * This will clearly deadlock since rpm core needs to wait for
> +	 * xe_pm_runtime_suspend() to complete, but here we are holding lock(A)
> +	 * on CPU0 which prevents CPU1 making forward progress.  With the
> +	 * annotation here and in xe_device_mem_access_get() lockdep will see
> +	 * the potential lock inversion and give us a nice splat.
> +	 */
> +	lock_map_acquire(&xe_device_mem_access_lockdep_map);
> +
>  	if (xe->d3cold.allowed) {
>  		err = xe_bo_evict_all(xe);
>  		if (err)
> @@ -213,6 +236,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  
>  	xe_irq_suspend(xe);
>  out:
> +	lock_map_release(&xe_device_mem_access_lockdep_map);
>  	xe_pm_write_callback_task(xe, NULL);
>  	return err;
>  }
> -- 
> 2.41.0
> 
