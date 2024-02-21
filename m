Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A4CC48BEB
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 17:52:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C655710E0FE;
	Wed, 21 Feb 2024 17:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I2XnGlIv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE30A10E0FE
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 17:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708537968; x=1740073968;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8Mppdh+/qc3/M6YQ2OTZmSG+VKaUtuo0cgmeloqoYxc=;
 b=I2XnGlIv9YREre2IlqIuwmxexAAKpGo3ejqLrxxDf2iVyDwqJqJD20re
 AWsRiKfGHIeCBemiKmSK7VRhUIuPwP2+rbRwrMPvKcy+pg5X/1jDRD/KI
 UjJSLrFlysBzODKtw0IevU2cduLhYJsl+c8hyEkhTEexenn/BWv4Bnwfa
 vpB+J0HDvVWC+lFweovu5DmPMEPIRo2B/3EGagfh5ICkKCThKqmJbJg+5
 YmIzLupPv4WQqTXEuzZwQBOMu+OW8e0EwxP/++eGAAOyUZrBff0K7hQFD
 lzUruqYsLBG8tHpvQdqh4s6mwr2rETMQ+kx9vDaTBDIBoDfKjgQJiYkJr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="25180968"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="25180968"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 09:52:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="5565148"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 09:52:47 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 09:52:45 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 09:52:45 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 09:52:45 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 09:52:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7KS/y4orMOmUZ2JhkbWaEAQydtbVfl9x0qw4wRJIsJEaYjvFzgGqnM6gvtH1OPrCZ6TV3SCXLfHfhR+TWnSizPKaJbSKeiZbKc1qsKDt9w0RtjQ/wAXuL75cdKPB7MguSHA2KkoPB/n7hh3Ju6ZjCAWFjlh0K/IB9XOW98qHAFqLNLvAGi5VMO85wVgQ5VwvuKVIY7N+7KeLCVQdb3GgjIaWbnAZYpiuCziXCjcvP7YSl129hklqWDebFc7YM3JilcUVtiCeLeA2FI6FybdD4+sw6zYW9aRfu+fHRABEMOBIyQqgB1fIprR0VwyA5wA0wqysXBCAnctfILycY1vJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1K16vmSbUBUeheOgFmU+B2Rft0a/2SvZqokkvrBnEnc=;
 b=d7IayYKS/Sj70/gUC4wSZ8scK5ijb9FF59gxv1HWGEye2htLCQ27BS1hPx6UL8uRk6ThmaY/vN5eIzxcG9m32wNUjVfMaUWf/qeTwLOXPlQ25CMeEZE84oEOxzAoXLAwTe9hn7C2aaeIsDN56N5b1dyriZFHgWmThUDJqNd0hEycnp4FCCw4Wz81oDpv3TdmDQCIoNcR21XlJGIwpJqHPu6uC4U6RAg4qf/exK9MyCAuaug07Ouet2C6fWNmWOjwHT+uejKgC4L+ukkFSjnYgLCNT73MJr2BUsgAf3T1rpcfSCMNWj9erIMXWTb0l4HgTmJIhdwIVm3upmgb+T+pFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6528.namprd11.prod.outlook.com (2603:10b6:8:8f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Wed, 21 Feb
 2024 17:52:42 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7292.036; Wed, 21 Feb 2024
 17:52:42 +0000
Date: Wed, 21 Feb 2024 12:52:38 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH] drm/xe/pm: hide d3cold sysfs threshold
Message-ID: <ZdY4ZruHIJVNwRV6@intel.com>
References: <20240221171008.196673-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240221171008.196673-2-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0348.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: c8ec1d37-f3aa-48eb-16c2-08dc3305e6eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3OXWqy4UUOAJml1QGKq5z+/NKeXFsb+Mh+ws12k3Z34F4we4T9GSZwgEQBOXbUWJxQ3rnuUau6yh1Fh5P1UKZiqozBESD6V8shxd15g6XeJ507X6ywtw7QArIJYaUN9DuQL0FIkqP1DYAeOB/Knd/Lgy3n7WKFlWexClRFElf6k/02j3pur0eD/64NVnY09OeXWVzbeZRVVUD4jHD9zQgoRXL8s4yN8QLrVwBg4e/W5RJXuS11rjuaEPR9jJFB3dpWZLQZih6qkJuSQXWblgQOZqAK6vIFfUu3QrKTW49AVSBhsnPDm+DxCi0g/md+YXrrwBz4M8uVSxiVUP2dNwxmyndhEd8+h4kzx+5KZ+hfd2Tit7SVf2E41RwcDQuV5J5xQ35IcaY1hW0kuHUleDaOD611X4sB/J9YviBkE2MuHFZAwpQCa4E2knYKeltgxOoJhDUDqvOX2c9U2+ls1cAoQCYbcS47R1OmxlJxVyzVJnH2O+YUG/FrVo/rbZlEGffoY8R/Ats11GBMR4awe+eg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fwcp6WwEcmdTNK3EQQ5v5BC2S2w75Eh6OoE84FBXQk7m5ztOh/R83uPq7WD0?=
 =?us-ascii?Q?3tBbRZatsWgjiPj9xoNaqjKdeKWGnt+ciJwBdTJIDbNXgRGe7JVHPkfqqujr?=
 =?us-ascii?Q?aO0aqaYMaRLOnH+01fzZXbJH7nwgVZ6KAvYJ3xZeBbOajyTU0Td1Y6wd8loV?=
 =?us-ascii?Q?UCAnvQhdnveIl9E+Guxq3gugbkByNu2s0fdZ06nTWur/HMw1+DAXYOBxsMUf?=
 =?us-ascii?Q?Mj1469ik6IWoAzfxILG9glXayjv8HsK2as6f3GgwHbMrefySmOJ8Gh/DbqYq?=
 =?us-ascii?Q?4ptBsLWhongU8+VEkFCg2Y/MRVG/2H4nuMHoT7+EaNDT9BFrgBQiMwEF5JUs?=
 =?us-ascii?Q?uLc0vQklzoqBuVNS2pOe2D0TgJmWXU/VAoZzm81EUjmsyvXADLFjIdi9G839?=
 =?us-ascii?Q?6z+Hys5//s2wGMxI/xZPTRXXUAlPI+ahrzFSnEjlv3saMZZyqpPf9t3IlLS9?=
 =?us-ascii?Q?GuOfvHDF+xasmJSDjd/BUmhZVHcOJqaOHb8qEAYSAU124wMIC4akcvFEN+ju?=
 =?us-ascii?Q?iVm6T4Bmv3rnFQ0xZ9rkEPNm69+97DfwvEviaoFXrcSvoknbrzrCrG2ABuuq?=
 =?us-ascii?Q?eljQLmj25CHv/lrlsmprCusw8Jptc1bmqfo7D3LQ+ECCjq1eIO7BeaQSQXg5?=
 =?us-ascii?Q?RfVuUH2RMYaRLJ/C5BEItABOsnSO80l3xdjMjgRAs12a9hFA18jq6XCCIjla?=
 =?us-ascii?Q?rzhdRuL+3yAMF+ALZtFiI/9HNi/QaeQK3MIvKNIMwhWjb2iNOITQPhO7fXZN?=
 =?us-ascii?Q?QsITqXhxo17ooBxMlLkjSSnpYTn8OEU4GZiZJappOOzbCgl+abCfMWWNib37?=
 =?us-ascii?Q?aQHnygtHTWoliztrg3vzjYazqVJUz5FYpC5lTZu3jwB2OiejDmOQLrPS/2iP?=
 =?us-ascii?Q?loMEKQNBMLQ92+mp3ZXYO0d51QBaTKgN1Kftp77vtfaCivRAh/bidq8uRTrY?=
 =?us-ascii?Q?3/4QPBiTUWA9FlNiGJmTHNxFCIKnm/Re+ngCIBjeuacB9QsV4uclk7jJHGUE?=
 =?us-ascii?Q?pli3NjePtr8a7BUkzYF1YmHV1cixsitrfueY+UX0oN/8mbc4Uhz2/+An1xrZ?=
 =?us-ascii?Q?tUJT3QU0MNrKjh5CmNpsUjCnkwH++dnHQErbq9BP1WtG7H7QZtJhoVL3Zwxp?=
 =?us-ascii?Q?czFxM7VBgPfJYgUiaKeFrr6triZ+E7ytdmRJMVIN9LJl6QehTzVH8oSpViUH?=
 =?us-ascii?Q?1VQ/rYlOe8z+L+mxAHriJOI93fsygWDD7wE1sHouZKmc3EZl3ZJbQ9xTDGQP?=
 =?us-ascii?Q?nvfwmhXJwcAgRdRSRWrXUhLmm+JMdKOmpk6iYlpWdHgsSyj58stry+XHnFed?=
 =?us-ascii?Q?rgXgbBymTb+qgGZc9MHaXrRlOAkNeQJirkHv/j7ckXhMdoOyqGkgmd/+B7dj?=
 =?us-ascii?Q?OVtyjdVwFXZo24UVs4+31i5Ot3uakESwAwqWMZ3wyd2aS2ZydIxq7gU2AYN5?=
 =?us-ascii?Q?3DqIbOz8ZDc9JwYP06PsBBghEBGSq4YWUgWfuGjcTUXXgHx1iWA4t8KgoJCg?=
 =?us-ascii?Q?Ec5j0pBEY3II+YefVFGi5b/9KKBqhiOxpv3E+8Uonv1OT2I7/apxiNWaJtbB?=
 =?us-ascii?Q?xf6OngfEw1iDI3Ah1+Qu2lfJMo4Yk9tb77IgMoXJ8il6jsa/5wv1Chmf2ypr?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ec1d37-f3aa-48eb-16c2-08dc3305e6eb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 17:52:42.4470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uBMbgIpuMAhnbekCgqRf2mBPDqL7ZV2urcs02DgkmSXiVzRXfpJxsE5/N2+V+dbxV3SldqWUx4lvSz5vfNbUxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6528
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

On Wed, Feb 21, 2024 at 05:10:09PM +0000, Matthew Auld wrote:
> There are known deadlocks and lockdep splats with d3cold and dgpu, which
> is why it is disabled by default. However we still don't want CI or
> actual users trying to override the DEFAULT_VRAM_THRESHOLD and then end
> up enabling d3cold support. For now keep the sysfs hidden if
> DEFAULT_VRAM_THRESHOLD is zero.
> 
> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1246
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index ab283e9a8b4e..829f165e30b4 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -189,7 +189,8 @@ void xe_pm_init(struct xe_device *xe)
>  	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
>  
>  	if (xe->d3cold.capable) {
> -		xe_device_sysfs_init(xe);
> +		if (DEFAULT_VRAM_THRESHOLD)

what about using the module param as a check condition here?
So we woudn't need to build to run some test.

But anyway, we do need some protection here and remove this sysfs
at least while this is not fixed for good.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

I'm even wondering if we shouldn't move this from the debugfs
to sysfs and avoid this at all...

> +			xe_device_sysfs_init(xe);
>  		xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
>  	}
>  
> -- 
> 2.43.0
> 
