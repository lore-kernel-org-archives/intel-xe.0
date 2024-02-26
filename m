Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EB4C5478C
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 21:46:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E8F10E1A7;
	Mon, 26 Feb 2024 21:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aoXYE/p1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870AB10E1A7
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 21:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708983972; x=1740519972;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GikA2/ML2jlnmVB9Y7FvvF8Ar6lZWoIw2co9/Uv4APo=;
 b=aoXYE/p1JfW6sYFu3XBW9DhoyrOpfbRUUokeFRFREPsRpc/djE/d4y5r
 fqapZIlcXgSyIgmCWNg5fzxcmFTHWYve3TB9+kBl7Jn1urRFnAxqvBgue
 tQaYLFy1Owvy5sqOUA4SoTZkkgAokdUP4IuNNeJBtf4HQ9KMC7IjVbsLu
 DOFFC0yD4K+4XHtIbmMKV/KYvOisY7jrtZIPWVxdksMhvq9taL2cm7zV8
 kgzpfjWy5M50cv1v13yw4fIQtDypAU9J2lOkOqjHgIdKVuqMbp/8jmZQf
 ykn0wO3zvz1prY53eqsdWG+moqjYF0mKwqX4uGNW3gex3kc5u8ctTVP/e g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3415444"
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="3415444"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 13:46:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="7026358"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2024 13:46:10 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 13:46:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 13:46:09 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 13:46:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4QA7dEq8RP26UO8LpvHMUtlhzOwoeCow3zFtltX79+oJNRsnCahG+4Nt1nNF+0TSPjrEBqA8VQF1S0K9mVeroInr3MAks/CGBuk7InGtO0Ci0budrVzuzEpbuSk7X8+28e2hfdm3pEy3mmv7VOdO/ZtphiWRUo8+VdTUWrVw+tRwLFaNPqgP/IxtWnnfOtgxRv4cnp7fU9uJCP8cJk14KzSE/fZ5Kv7HsbFxmH520n0EtcyQh2SXxrE/MCe8hZEAYaAnyWKN9Np2Zygtqr+FW7Z3NPohu4XKlNnxKvIPHUVReOJCjrTLpZjqVXLWBMCJr+ObkGUlr1n5torzTw+5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUdH6wey3i/3rrE3Vmj7pwu+VfQ6b/1w2WktViMJpx0=;
 b=f/vuqxXpVQaS7cH/+6BYXPQsH5kaB/rGBRcEPpmNS0xQ8vYwmUGr2d2jcNt9NnozKokTZxpsMzQsWf3nitGjfPmz9LYQm2fD0sfVoJgnjpxWyBvNQfLfYIpJ7LiU+ZeZAYDc5QQVaKzFDK1sA1dSsu+i71F4EcSOd3J7gSh6K9yC6gYeaQDgkLnentI4rNtM7wUKhHej9r55H6KxT8jT2pZAMeg4EYueH1aCs0hRrPPA2Wzs1gpbr6/wq1Jx37JKJ+sXQ/XCfeTWmE8RL/9VDnmRPNnrSydtqNVIj8iKu1B+SD2NsrmxKnu9Ir2dM4MmeSzGlOalnVIZK/0F9vj5oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB8265.namprd11.prod.outlook.com (2603:10b6:303:1e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.22; Mon, 26 Feb
 2024 21:46:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7339.022; Mon, 26 Feb 2024
 21:46:04 +0000
Date: Mon, 26 Feb 2024 21:45:29 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 3/3] drm/xe/bo: Allow migrating local bos to TT to make
 room in VRAM
Message-ID: <Zd0GeZgRZB/RPEA9@DUT025-TGLU.fm.intel.com>
References: <20240226164455.10179-1-thomas.hellstrom@linux.intel.com>
 <20240226164455.10179-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240226164455.10179-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0199.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB8265:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b79da9d-1d85-45e4-e469-08dc371454a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: up13zI04q27GxJDWC0w1P1+Th39pYXmEK6r6tVD9JqCGpHsNPvaSrXFdEDI0VmLMXF+Q16hwUsapj/PGoLlZY8k+vtuX26WTiPBCXyVofYYU6NeIj/hms/G4Ly1nxBzyKDD87hSpI7dqxC0QY3bSnT1DXFy0eC/rX2zqaoMiJpr8rmzjnIgydrs3r96/A9kxwu5ngBiIObW62yY0M7x1Ak4BAMU68nSy8ID/IbpISEwxsvyE1II3hkw/wSu4PMEjN0sLEkRJyfvOndZEXgMJyC7B10ZoisSahPbLVrOKBt6m8h8acH+pb4LyWca76++PRRxbmTcKVBYJLcnRerCZeld3gl/vCenK6i5IORJ/5+oMFX4SB6zaVCQ0v6MZL6ImVq/yYAB9FaO8wrkk3KNsWlhkoO6liei8OVZlX4kyIpTRAEmr+zXt8GgOt25JO5qDhaR1cGZsWCoyKACsC0kiITp+KAanabDcXiJC2w7eStqx/D20hbh+W6a4lPoaJo3Jxkk5BTSAVS4qflQptmMlMtmyo3xM7BvvxPRyzHUwab/aaF/ZrxdLISJibIQGsdSBzwPkaPdqCaWqtuBwHhgUabqDP98XuCgBxqVpYdo6Pey98GcWmiXNpRurGyHcFZpLqE/hvoCw0SqDZ1O8QTnZ5DxAxh9AS1h/2hRHIVZ/fmo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8ODuEqSda55hVn7ZoAU/bSp5EBOTZ0mZ0jMktoX+B2q525AUyC1aPu6jSI?=
 =?iso-8859-1?Q?pdIf8RMbSvk0GUp+B21w3WaqFfoJFNstVvzgt1taNUvyomMfY/yjEHHEsI?=
 =?iso-8859-1?Q?a/wj+oer4ooOZ1+ydykS0YzWPrn6l4wdkkt/KqhUp/5Xu/XAh1mBrRVMcR?=
 =?iso-8859-1?Q?puHRYv7wbqSgmgBHw6SIV9yBRIQynIQsRKm0PB5d+yHyVlcaC+o1naVUdS?=
 =?iso-8859-1?Q?74aADRUZV38z7phGeoUS1yxOIFzfa5wnuBltNJ9EDuoYbVTHF8Thu4bTkl?=
 =?iso-8859-1?Q?9Gw9otp+HkL0OX1YNtqPxjlob+H777wiZx4Tf/pPZ7n2yxwr1MhKpeOG87?=
 =?iso-8859-1?Q?YuZsn8M6WxvsXCxqbsTFBRD8iXPVzphjLwcQ0nlLjbt9+/8q5odB3igsqL?=
 =?iso-8859-1?Q?w6vhCZSyijHiifcshx1D8xfhAGDL2ZqP92qEGwkEyMRCQglb1L15pc6T9T?=
 =?iso-8859-1?Q?Leqrn6GOEPykBXR9ejL3H5FhOTEK924ZBFmTaS0v8SwYwa1TbX5W8Cl5CX?=
 =?iso-8859-1?Q?ELF5MOcLBS4uS5/0ZDU3uUUg5H/y5/qloIy+D8cX5CDBM3y08xLgLBsj8S?=
 =?iso-8859-1?Q?BBljw+AjHoEc/VuphF1FmWyDQBoo6F+4vnQqNeXPaBPvX8TouBQ9bBUce1?=
 =?iso-8859-1?Q?4qUNb+DrphbZ7vFiqjh8AwHWUfvPen2CfrmSrdWrz6cYnsP7u1GASUpX5z?=
 =?iso-8859-1?Q?dIeqdHXf2p53Yw4lBnsU0eQMLhGAkapLwUR6r1cAEHF3KiheFagoJ1dDxj?=
 =?iso-8859-1?Q?aA3zhpuU6ori9uVBiij0nKUil2mtzj+WSZkAN+g1bguBHSwl3J+NfQ1jJg?=
 =?iso-8859-1?Q?ZhThWZb59y3By1QBzyR1DNoiPFoPec//500EYkdvTXr7+l8FoJFmWZJ49b?=
 =?iso-8859-1?Q?ukIQcZUy2OE1RrSSxcaRG5cpYwBfAsrYG8QAvE5W8YtujKPVlKnJ2IK++f?=
 =?iso-8859-1?Q?JAMpgT0yqmpTS8bSP/25y14cRuRXgHcgYoWa+7Ls/vl1iUQ//uJ2U0ijRS?=
 =?iso-8859-1?Q?Sjr12Tqv0iZsZWFLkXL7pH3F6yQWeLDmz0+1gWWPVuYtt/qA3fFTIWfK6u?=
 =?iso-8859-1?Q?laBnuTUXjfszN5Wn4pQ2WyA9Oz3/eYf9De8uzIWzEf9jWl5F0SmtoMRELD?=
 =?iso-8859-1?Q?asHXOwL/v28flHkaKgjre4ptG6al+HuF2eHJMt+WPZ8mrIlc+fxh55UmXk?=
 =?iso-8859-1?Q?X0mYZMPAIbpvhBY/0gKZByUgivkhmAQpKfKmIsoVb5xevf3ri8mWcuEKkr?=
 =?iso-8859-1?Q?EDYi4HU6mi3Z/W7ee2wguacrGu8MBJCYan/XPly6o6cT2P9b+QkW+rxGc6?=
 =?iso-8859-1?Q?cC9OBQKZaqswAawXwUtVOegsTPnfz8qMIYO71duQjoIUgMMmxaFcEeOW+W?=
 =?iso-8859-1?Q?qtBgQwqQw/MXuavU3PY4BgK0nTJppwTXEQ+tC0AhbCbKZBKHMMfAIaFyaw?=
 =?iso-8859-1?Q?+Nj98Vfn43H9GTdxMYft/ue3/IdN4ggTO3TLVG48y3DuNGPR/+UqXPJXFs?=
 =?iso-8859-1?Q?MxjIbGkOunwTnChL4toxhIZzFUF06pgHJh3+vrAfxUjPdCGW4ArN+AODYB?=
 =?iso-8859-1?Q?lB9A7/q9+9sAj5ybm1NXTnHV2ciLRHnKgn6VroYxP8dSmjINUKWcZdQbfy?=
 =?iso-8859-1?Q?Hi8e3LCbWa63q7jBVobTZL5IIfpG4HA3bwesMOZH7VF/7U/lkVjto5LQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b79da9d-1d85-45e4-e469-08dc371454a7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:46:03.9950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 16eb4APRrMMdlTeT19L9lA2edcxJ8qoCvc71lqbMMtYRCgkHXKRZ12684QdWU/ig2HkU/TRSBCjfIcGcOgZUNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8265
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

On Mon, Feb 26, 2024 at 05:44:55PM +0100, Thomas Hellström wrote:
> If VRAM is full and we want to evict local bos we can't typically
> do that, since we require all local bos to be residient at
> execution time.
> But we're allowed to migrate to TT if that's a valid placement
> for GPU access, so in that case, do that.
> 

Make sense to me:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external- and evicted objects")
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 2931b9030503..21141f877850 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1049,6 +1049,21 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
>  	}
>  }
>  
> +/*
> + * Does @bo have @mem_type as an allowed placement?
> + */
> +static bool xe_bo_may_reside_in(const struct xe_bo *bo, unsigned int mem_type)
> +{
> +	const struct ttm_placement *placement = &bo->placement;
> +	unsigned int i;
> +
> +	for (i = 0; i < placement->num_placement; ++i) {
> +		if (placement->placement[i].mem_type == mem_type)
> +			return true;
> +	}
> +	return false;
> +}
> +
>  static bool xe_bo_eviction_valuable(struct ttm_buffer_object *ttm_bo,
>  				    const struct ttm_place *place)
>  {
> @@ -1061,6 +1076,10 @@ static bool xe_bo_eviction_valuable(struct ttm_buffer_object *ttm_bo,
>  			/* Not bound to the vm? */
>  			if (list_empty(&ttm_bo->base.gpuva.list))
>  				goto allow;
> +			/* Is the bo gpu accessible even if placed in TT? */
> +			if (ttm_bo->resource && ttm_bo->resource->mem_type !=
> +			    XE_PL_TT && xe_bo_may_reside_in(xe_bo, XE_PL_TT))
> +				goto allow;
>  			return false;
>  		}
>  	}
> -- 
> 2.43.0
> 
