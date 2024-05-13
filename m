Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9DDC25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 15:51:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2963910E368;
	Mon, 13 May 2024 15:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T9j3fFqB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FBB10E368
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 15:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715615475; x=1747151475;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=diIBymp8RgMeHfT6ayyfanplBg7FISe9yXcyGd6MJdE=;
 b=T9j3fFqBzJIyuzxna0Px8BH7KlGO/E2yK9WF/71gqilUYTGfAZhv4thp
 LSBLaCodCsppcKgrrINNuFUYFGAYrLlEoUBqvfSd9gUs4u4+OG+tjUD6C
 WHTMH4pH6toEESpH8pE6v7/ZcVQhxCNHkeb16K59sUUEVJ2bzBFIcVzma
 U1leFFLDZJRSqXgCsh49DwctIcNJMTeDXPtXLMkoAiftEysB0lSG32pb3
 Se8m0tKxDI1wc8wWkpDHVlZtiMZxzeS0d0UdV+vHEdquyyETsI2CnVfyY
 3m3mk/LxMI1DoIeaaNMXjmy3kRnHluKhol1yGS7Cof7V2XfnjM9tKqzzq g==;
X-CSE-ConnectionGUID: Q5Si6Ii6RE6lSuv/ovoGLg==
X-CSE-MsgGUID: mGVAf241RgW5DdK8cBxK9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11378523"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="11378523"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 08:51:14 -0700
X-CSE-ConnectionGUID: RBHvbrxoQ2K+S8uGauowLg==
X-CSE-MsgGUID: 69+UtV4dTU6JYmrRNNikzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30438173"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 08:51:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 08:51:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 08:51:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 08:51:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 08:51:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGgVb2sNk1nAasmoMzVIeL29JKXXcfwRHDN2OUb//r2JR42OwXdIuqVts4aJ57ik2ihXoyD+t29dOviwG0uzh9KSGKXIAoq5IyQjGYdH6mjBcxjj7Wb+f2m9Dzs05+QwpMZ8fNW6kPPMb4XdhGhVe+j2Y4siN8i4KSdV99pkrUFHUAgXUV4FfrsJyogFCjwKxzxPEf7ZgEXgksc1vtXTlRyyhSlIyrXSPGR0g58uCgKTOdgrlq9loW8BlDEhVP6W6g6JwkVbvFBWr1kfu9AKitM6PEh8dYxk+jRt43Jd5uKWhcjFrNbu3FRXymYIuUNyEF5rww6hyNuoglBBa76Xfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KsCK06gfTnMSvEYMWnXbLEeiJ52V3DPXtNUCtNM7AhA=;
 b=OJcUuUj2OyWVM2yQ9VgxE/0QQnFA//5k4l9CrnDcIw4LtT6PmQGMcsRf2U7R8Bt0UYZ9HyQ3swoBskP1P65GC6VisgGmw6utwmtFvYbNAKDtSN0+n6zeTape/Ql62uue3/nf+Y3828doXqLuGqIsG/vhsun7j22RwCM1M7AHdU9t5wMt+JrwqZ3p2Rr8B9rbHlYh46yRK1TM5v3OTSt0+vFflHBDuMkM9c2LGIs5O7U8mjGsrICdyl6xpJNwwotSYEN9M70ivjh6KxXThYObuAjamLEXCC6AlOdwmGr4KTVylxnpwxJfx5PUtT+Q6cwl4cDa/I+f+/GLHPcbAVYjhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL3PR11MB6433.namprd11.prod.outlook.com (2603:10b6:208:3b9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 15:51:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 15:51:09 +0000
Date: Mon, 13 May 2024 11:51:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>, Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: move disable_c6 call
Message-ID: <ZkI26XXGaplaUrdO@intel.com>
References: <20240513070546.3754640-1-riana.tauro@intel.com>
 <20240513070546.3754640-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240513070546.3754640-3-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0225.namprd03.prod.outlook.com
 (2603:10b6:303:b9::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL3PR11MB6433:EE_
X-MS-Office365-Filtering-Correlation-Id: cb09c425-0a27-455f-f369-08dc736481ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gTnlZYA5G13gXGR9IN1g24oxCNAVM6XL15yc1bKvFZHJXtDQ9Hiyfs/AmP0b?=
 =?us-ascii?Q?oKCMfCSY4Ili3WwsliiXm9zmpJlGRmiyIZUwLodhESjuekHJiHZ4zT7Ff1pI?=
 =?us-ascii?Q?WbqS+6BB3Dcz7rD01i5v83oyvAHcx3DUUGrdlOJnxKte9//jDnXG9BDmvKyJ?=
 =?us-ascii?Q?9SUZLRvklNWpYwvRENhXNcAzUCCzRK7TjAepmtVDiVuYSDDtDhNO4vXxMYjs?=
 =?us-ascii?Q?1nkrYw+W+ZD28hrcJHpZg8l17aEkNABBcWHo3a6h2vc0uW1wXxt7nrSV4AXX?=
 =?us-ascii?Q?l4FFcTwbHORpHDIV6HueVCZzD2cUmg7qNFE7mCq3T2DdACqgj/rhMSOaRKCS?=
 =?us-ascii?Q?HrjkMJXZIcY+XE+lrt1pLxgLNHcbOy+mvI5bNpL/fU9KhBJ+TLLTYtsEOV64?=
 =?us-ascii?Q?9ySrElBH/Nw4ZNhpWEby0UNzDJ9PZyA1Tzwu77XikTPfNCPjg66zkvZT2/7X?=
 =?us-ascii?Q?gcCLfceC1N06hmUHGV61Qp9eBU+FUW1jhd5WDyDKoMIGwWYg+UlPjNdhim9K?=
 =?us-ascii?Q?fK7JKtJ8uPa5I58MeeA+VWe8AWqJFRbKLndY60IAsU0slTeopIHMXk7u+uq3?=
 =?us-ascii?Q?En9gUv3naQxJ3TIlaAsXs+PgypsYwF/j2pWwB3UrhcGNbp9y7SpaeUD6qlWZ?=
 =?us-ascii?Q?56g+K9BDwfBvvpKHa/kreA/8cOUS12b5rRkODFl9dHSnavHFqU/s6mShfky1?=
 =?us-ascii?Q?5XhKkK8MV7wvvllJMTa4AGYalSYiWOqrMXoFPNJlARIk6INPQAY0DsELV71Z?=
 =?us-ascii?Q?S5O3lAAlMY6yIourfq5XWYkrVqBuYxNM31UPumsvFiWx7nVx1w5bHI9JHM7c?=
 =?us-ascii?Q?F01sgAGkpo/TETtl0lfQk236gm3jiTYN7PzvhZeaAAoNKvH/RgcX5V4dlifV?=
 =?us-ascii?Q?2rTfDj+tahHsS5NrbtyznbpqbNkTl7FeQS1YAQdoL2x1cNRKo2rttVINcnj/?=
 =?us-ascii?Q?8lhOe58tb3etaJmB0HItufpLC6836/gI4yQcP6UZjw/j3LQXAmKKs1NQ9XJA?=
 =?us-ascii?Q?+f1L1FHbJWW0Pu6OkKcBt68WHiV7VaNM308EWHYoNlEIyjywblYO1JctAhcc?=
 =?us-ascii?Q?GLOv3QIqFjjWK1TmGpEAGKLB+dPBDwB5vGBiUdTmdRaA7avi/eQHkp5p84r9?=
 =?us-ascii?Q?lP7DV9CboFjwFibd+8KH9pPe4NaFlERPAaiRjHbw7vrdSs/pIp+t/4lfGf8A?=
 =?us-ascii?Q?f5daug2R31qzn60Iq6bvrG5zhJHuHqupnshKNl8jSV39KNO2S+lJmpyTF2bu?=
 =?us-ascii?Q?tTNNyURFDYl4XscTwUGu78fqN6d7rn2AcvN6iABNNw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f0TjvVbxKyKVkWSLddk0J1134ti4w6WLAuTZcJvMwyYRRRrvjUeK06ysfryz?=
 =?us-ascii?Q?DNEgyuDkWFAjw5OhONoWwvlty3v1tA9yJL1Dm1Eql5dNKJig57Iss2zsEqia?=
 =?us-ascii?Q?x5aGzkrIEHdN9Bt28XM9S7bwy6cTXEXrjPnVe0z5zNQyAEFTwDBHz0RAezTo?=
 =?us-ascii?Q?11ssal4wqEhA+OIFz66OHa1BddQ3sB9TGEEqE6DtzPgpBE5ruzR/0JeChw8l?=
 =?us-ascii?Q?yUBF1YGKVUpSrQ0kYj8bZIt1HO+ib4ii/2M1i15OwZiQzw0EHQo2Vg5uTdnn?=
 =?us-ascii?Q?8GCh3Q9iIgRpdM2q5ZuumFHIY9QsU+LR9njFZNDP3n+Ripx93HLRy7BVRwDz?=
 =?us-ascii?Q?Rikdirk2MdxBC0fCxJGgfi676NidHietYFJdIRk99BgqLHzqMP7/ka+D7/Ff?=
 =?us-ascii?Q?4yINkr7f5QquThJ3F2GkmJQk3t2bUxsnbOB0D6F8YJjSY1/uz0nyIxaTnfCK?=
 =?us-ascii?Q?zzsJv88PARvUZ3gAHxJTNCYOku60yf6nfe7CZVVVGgrnzrwoV1Dnz9DJ2YxJ?=
 =?us-ascii?Q?ao9A2xp/kVi4LhyVeRSQq8aSr30wc15zTw58DqT2tQNmamE1GgejQdvHztFi?=
 =?us-ascii?Q?ajyHhORE8Dw1zyO23NUr9MnfuD+ZvoUQ6bjSmMv5TN5qXceN15TZDQ+v7mt+?=
 =?us-ascii?Q?LneNsLMzUiY5v2C+CaB3ti0Qd9Atalbl4wKAKCGg9KdLh+vkfP+fIr2U+95P?=
 =?us-ascii?Q?Acd8YKSIBELgZPkqjsTqHU/5lPwA0bE0Uw6SUO1BRqCaBDisguUPrlfxueAC?=
 =?us-ascii?Q?1n4X2Kpv+7tDEVW+ws1GEeH8EBoZaJq5VtRjsmNSTSAiCK4x2265yKHaQUfW?=
 =?us-ascii?Q?CeKHgSNAxtKffvjSDkCAgpRQVt0/1b6bnfCAQeVmO3lXimq7ffxi4qelIirq?=
 =?us-ascii?Q?P8RYG/9uh4oGopHqL1EA7MUWuq3Q0qCLXi35tHlLgdDhxvA3Lj0eS8sOXVyu?=
 =?us-ascii?Q?6OOQAseG04bVNB+6svwPVQWDMSfWIy5kgheP/wg95aR8YJP9gezoOW04awRS?=
 =?us-ascii?Q?QHPY58zSGOQaMi4jRNQJrgBSfkpn2kUIBsJC5WJB3bZNDg9RuUImKWlWM7Ou?=
 =?us-ascii?Q?2k/wtnxGzsX/rznd/IpMcpiGhSmYaHZRjkFta4NEJnCoWmcU6jdkrgzuFOTI?=
 =?us-ascii?Q?rMok9Hp6jwhnCpAQAL/NoOVzRKuBW+0rvRfkgwT8YdSJHlGFWJVowC2d7g+u?=
 =?us-ascii?Q?h2fbDN5nyJXiy/6XmisvBrfp46qx0jXixMcuQTa6BaTIwKhVHxVp8p7W/5NJ?=
 =?us-ascii?Q?rxxtRgToMc07tMBCKVptWj1ZV6P6sHyUXP2eCS49Ws4c0SgT1R6jUBmlqZwd?=
 =?us-ascii?Q?hHBiaTfZr/uv/sYFR4WZYSzdii4fEi8AkUJ1iNAsFsCyqZ+CvpVlkZVa+QRU?=
 =?us-ascii?Q?hTVNp4iuQJ6u7e1X7l3gUNKCJYZHqT+Z+WNUvibLlzK9UtYaL8HbElaryJOp?=
 =?us-ascii?Q?o8O9W/0BVLzSo5W794hVvb/A/jG2w0C6lO8+LajahoVj5yHHOLwNSUGq5sC5?=
 =?us-ascii?Q?eqjZxzbBCWJMI/7plKjdajzJZvBCVsxmYzRF32v6xh/lFV35m4mZIDBcFNRw?=
 =?us-ascii?Q?fNQb6O0d3rbsf3jYVNMyDzKY9u0WgGCOUDCJCGXr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb09c425-0a27-455f-f369-08dc736481ec
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 15:51:09.6797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8WZfZc33adZNSDktK4YERuFfCSJLyBsNp7nzLZeq0QDKj6OBdLBf0056/pDZJ8O0X7m2TxPPiiR/1UGPypuKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6433
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

On Mon, May 13, 2024 at 12:35:46PM +0530, Riana Tauro wrote:
> disable c6 called from guc pc fini on skipping GuC PC is unreachable.
> 
> GuC pc init call returns earlier if skip_guc_pc is true and never
> registers the finish call thus making disable_c6 unreachable.
> 
> move this call to gt idle.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_idle.c | 11 +++++++++--
>  drivers/gpu/drm/xe/xe_guc_pc.c  |  5 -----
>  2 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 2f247cb910d1..0fc865e07965 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -145,9 +145,16 @@ static const struct attribute *gt_idle_attrs[] = {
>  	NULL,
>  };
>  
> -static void gt_idle_sysfs_fini(struct drm_device *drm, void *arg)
> +static void gt_idle_fini(struct drm_device *drm, void *arg)
>  {
>  	struct kobject *kobj = arg;
> +	struct xe_gt *gt = kobj_to_gt(kobj->parent);
> +
> +	if (gt_to_xe(gt)->info.skip_guc_pc) {
> +		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> +		xe_gt_idle_disable_c6(gt);
> +		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +	}
>  
>  	sysfs_remove_files(kobj, gt_idle_attrs);
>  	kobject_put(kobj);
> @@ -182,7 +189,7 @@ int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
>  		return err;
>  	}
>  
> -	return drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
> +	return drmm_add_action_or_reset(&xe->drm, gt_idle_fini, kobj);

Cc: Matthew Auld <matthew.auld@intel.com>

gt_idle (RC6 control) is more a hw thing. shouldn't this also be converted
towards devm?

Anyway, it can be a separate patch.
This patch itself is correct

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  }
>  
>  void xe_gt_idle_enable_c6(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index d10aab29651e..d0bc5e3090bd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -898,11 +898,6 @@ static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
>  	struct xe_guc_pc *pc = arg;
>  	struct xe_device *xe = pc_to_xe(pc);
>  
> -	if (xe->info.skip_guc_pc) {
> -		xe_gt_idle_disable_c6(pc_to_gt(pc));
> -		return;
> -	}
> -
>  	if (xe_device_wedged(xe))
>  		return;
>  
> -- 
> 2.40.0
> 
