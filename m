Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542FCC3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 16:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D5210E647;
	Wed, 28 May 2025 16:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M7PR/gHR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B6C10E631
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 16:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748450739; x=1779986739;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3Ilz66opCRMNylfvPmxdYW+zybBTmMBpBtb2RIhTfT0=;
 b=M7PR/gHRQmsC5r2vDfAP9c8vjab+b0u3a0HZx1c2WfaIOYL6Q4jc4Qsa
 cEpKqadXQd6wPHALn3J8itVwO8+0pZzD4yNR5X5GS2YUYizqAyrt/MpAD
 WaBi4O9Lmr40WvR5T4RCNpZ9OelcIOTCQKbRma46lVxzqqylLuWZqnvot
 uI/jhsH1ardi+8hJ+E8/tVZMbqCGzEmkQbfI+mfXTc9Nc6CbIoGmQCkyg
 9hMaa6Eb9HDuMpSHHi85Wp1N9SN9fXpby0wBpqX49Mi0niLjjdLEjrTdw
 KKsoVTQ3GckhA/3Ui4ZatsZIbV1eZd/CcW1bP1Ztq2G3az8yV1A9VNOim g==;
X-CSE-ConnectionGUID: 7Hme+SDeQa+EuJTexFJ24g==
X-CSE-MsgGUID: cGC+ysdCQKucAQ8vDZudHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="68036288"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="68036288"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 09:45:33 -0700
X-CSE-ConnectionGUID: sbZrtBpHS0i3Jd5PmuSoQQ==
X-CSE-MsgGUID: ndk8XpKtTIO2m1KVNLPg9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="174297130"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 09:45:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 09:45:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 09:45:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.44)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 09:45:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+vDUxsAqQpaAnEm5fT3fcn/BDPVvGStkm02L0DaKF4I972HrlKY+6pmn7q7+rGvRC+rQln8DGukSckWgtBbT6tpsuUtFP/ziIRXQudwoNkuoE0hBX6FMDPkX0JpZUYWezsdQjWynWOafrsr+d5Me5NINdPtSuQY2Gmznx5tmnPN+XRKPPRrNRCIRlf6QDpglQusXTJ0bUEO0UY3JStjn+tirhtfSwk8xdo1CD3bu9weJq2gVSAiABGkDhf+TWmm7IWcSW0nELVX1/TVj7PRU3tqCm3+8VIxeJWeSXDtn7e7KA9bsLNY6eXVSUsojkTUkrnPpDqSCFoXfQavSOAyUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8wf/mr6Rt/spIWWmA/0URA6z6NnJYUfTNgmc7UTkZQ=;
 b=J5DEEYjbN2T3vkEvwBoTjtbAcZVdYB73p6B7+OYEPjXOXSZlk/PleVsXv7X0W2WV6/0IJ7WgrtSrKzd7S3j9RXGWtyKYGj7VKbKPF+hPL/KoyqVTiXYY5arl8HJatV+SD1mu6VI9DFjZ0t8cM4acZElYtNDMz5YlbiZztm1/uS70yHdlkWrBYuZXud1KvRLm8xImfADQ3roRBeiJiARdXzntiLPbGRBGBRyuVvTkaJYv6GpZ24nuH//2t17xt3dGWuiJNA/H6h3cb8RAWMuFoIU8JX3/XT3AZFC8NTWTRzEC005hpXL3n8eA//l7GI1mz3Afp92TneR68yTT73k5cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7327.namprd11.prod.outlook.com (2603:10b6:8:105::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 16:45:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Wed, 28 May 2025
 16:45:23 +0000
Date: Wed, 28 May 2025 09:46:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 03/19] drm/xe/vm: Add attributes struct as member of vma
Message-ID: <aDc9/kLMinC+H/qc@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-4-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250527164003.1068118-4-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW2PR2101CA0003.namprd21.prod.outlook.com
 (2603:10b6:302:1::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: 122f7d72-3d80-4f4a-8eef-08dd9e070a68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BMmMW+o0HACY5+q9IyIuXuxBI4zfTOJ0xIkiKi6ISNGdQFtjnu5AnpNVjQJ8?=
 =?us-ascii?Q?o78onJUGQ4xDVSGBwxazLqwZEZq4IpRrOWeXSh1fX44jmJw+5LRtkaFeQWh8?=
 =?us-ascii?Q?kpAzWikWnnb6MEkGktwdJPN4nm1EEALO2SewDx2WwAiVKvpQTVt1C8Qrrpng?=
 =?us-ascii?Q?MtxTNC6MxYuELjUTyPpCg7+1Xrf/S/24NGJvbG5qxCwMkv6ui9ngqLd/lTWB?=
 =?us-ascii?Q?w2HlXpAM0kO0/kaZyO5VCyAk/UDUVDYM6LJu2IeLYbJyWL5uHRqDosRL9ClG?=
 =?us-ascii?Q?2jarOIWtBicRalvWpoeS2vhof1fgsClwUp7En3D2n6LOF+AhyHPMPSyIMLFG?=
 =?us-ascii?Q?rNqT9g0QSAOv6Gjx+VejhdMIJ6Iay9GVWlConrpYvXgB/hV3oSNQAljzjquY?=
 =?us-ascii?Q?mOZjb5bpoJmRuBJEMTV46gICryAhtbUQc5fujwtwOX96lhBlTJvWChSZMK5g?=
 =?us-ascii?Q?URV/bVVifushw80szUPOd/U+BIptSgxJ9g985bAwW2pEwY5RMELvT0nwXtSi?=
 =?us-ascii?Q?tX4vLYx9DdJUAe716BZp6PrdSNJDhhM323uK02q7bBE1iubEl6x3j0VSs/0n?=
 =?us-ascii?Q?b14hP34CS0KExtj6WUhTnQr1909nuunMx7QOBw+R7uw+ox+7NsUM9aSBEFkN?=
 =?us-ascii?Q?FLv2v8yxf6yrX5Zjb8zUs6yNioqbPev3Xutp/ZqCtOkcCQywnRmCy3PsDPjw?=
 =?us-ascii?Q?SgitgmTvxBAc+CF28rJp7k4DklWa8lBcM+cVZe1SohdAiqd/y739HPTTGu4C?=
 =?us-ascii?Q?AOBwdOBZ50Wlm0Y775jSIozaxU6kSPRlM6AdH99fwLc2jTvPQgtn0JfLASDm?=
 =?us-ascii?Q?/9mDcw2imODU1z93LXz6ZwgT1jnJNZXK/vKvb7LLf0gl6i6MxqEs+YDpFqBO?=
 =?us-ascii?Q?nv6FduuGh5PO5G0kgwhAC5VPt5sCyVgbUOwIDY3A3ZMGMpOAlz9lZYQuyeE2?=
 =?us-ascii?Q?fQ6fR1VoQu88Evy/cIV0U3mAN32gt0GPg79n/I2Yq2ysHoJb8rnfPOJ6VOic?=
 =?us-ascii?Q?xDNC0VyCdAo5MxJzgM2n7XlsWvv7O61ZC1c1jCjcKVKH/hXx0tAqt8W74upQ?=
 =?us-ascii?Q?+yDmcjfAA8fYim0scbJ07jG2nvScIRkck7lLjOIKCtMdADJNlBw6zLxk8Weg?=
 =?us-ascii?Q?MwCeNy8PKtTIQaP6pVHwt+nsIWRsV3yo2P4rSm4dpZ84nkimmZzVVH8gR+f0?=
 =?us-ascii?Q?8dugXC21YYyppynQBRebDBeItST9MWlLqE2vVD+I3L/FGr3g9/LWo+d11ob3?=
 =?us-ascii?Q?mam3qtvR4r2mxmcS94Y3lIZBjjyzOTHMGvjWJGy3CfzkT4dYzQD/NG/7BJyX?=
 =?us-ascii?Q?Vv2wNuEbvMCF+DYjwps+W1r7dO1Oo0lMGY6A5PnyNR5GYQyr9kJA8dgFJ1jS?=
 =?us-ascii?Q?Jsqm9yPYG2qjh8WIgDBD728MVrV0/Mj6r1jnt+5Hpc+aP/sq3NPTIy1f1dGE?=
 =?us-ascii?Q?DwP5nCE7htU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bEaoI0l/WHrDbO6M/JhrPHp5ONAnc0SMcp30zEw677judbMP118ylfP6GFcU?=
 =?us-ascii?Q?U9zc/MVjrAAhOuz5heEuJjkoDP5GyKS5zLL8Wq519VOsF4SO4YRHGzqpfAXu?=
 =?us-ascii?Q?THyO9nYJKi+g9pxfyKcqWR7m3ZRmybw5NVyaml5+T5uI8uc9RVCsBaWkY+Rc?=
 =?us-ascii?Q?2WSFsksvuT5lO6ys0CBRcdBkJ0RxY1Obh91Fy26nRkkaH9Sn7/BprobEP1wh?=
 =?us-ascii?Q?ximqxD8xaOxTYN1wqCx09bZh0ffUrzRu+XxGERGicnbRffqAsdSiCBmDqWIw?=
 =?us-ascii?Q?dwkq3VCMFIGVCTDyzqeZnnyConIAcni9cEHmAECdi56qXdcexIxevwN8OQoh?=
 =?us-ascii?Q?+eFew/oOzcvAYm1rE0SCLWwesWTZ7dwJ+fGl734+hHT33dP/w/09C5URS87w?=
 =?us-ascii?Q?se/Ma4Sw/7j1ajvBvwNLlc6JEBn8Mht3owBU21acba4xgg2fpZ70PPFxiokq?=
 =?us-ascii?Q?dQsWseYJcaq4Il67so8JOFES0J5vrI41PxkTjxTuRMm9jf/aNT8HLdOcxyZz?=
 =?us-ascii?Q?zc6ZyNyPXLjurBXevQY7ivkkoyUVlgYKrlMpgEpQEx3yl5IDqtfrioRN2G2N?=
 =?us-ascii?Q?AaeGnZK7iGHFJX1COscSLefX6/Kbl3gZE19sk/DXaUv7Na0BakfK3RBQd2ez?=
 =?us-ascii?Q?BauKKpsjDVlj4p0Xoz97JzpU1+EH0bcGDSmsZdNuPRn2i+4J1fbC73tiUriG?=
 =?us-ascii?Q?QYTnylXGXgV46jCgeWpZVivVoaVn9qGh+5KHD8q7Fv+AJvajyLDXjsZ3A+Lq?=
 =?us-ascii?Q?rDX5vmJuocSTWsc9o8txLt4iS0UOtgKlM0nGf3dIrTqcUxhI4/q6AOXW+CyS?=
 =?us-ascii?Q?9a5QtfkY0e4/Gl4i6tHK/e+6X2DP/fjs6cKa3BHPG+dUt4brdXp27J4Zibte?=
 =?us-ascii?Q?WtTv42aUNWPh+5+gbzq5o9vA7Cnlao7RARVy0rXk/mx4MN5nS3U4uvC8LDnY?=
 =?us-ascii?Q?ggqCzs/psx+qRe9Xp2dKXWQO6NcgBnebp1miovOVMxxRRKnzwusWbdAIShs0?=
 =?us-ascii?Q?bN9A5b9RwBgRmS/7J+rO5jNQOYBzXCFCr1bEntruwRO8b423C6tkVxdT8GFa?=
 =?us-ascii?Q?BRt/kIRubbvn8AhQoI8rtWIytAUv1QMMGhYo3odKv3lascAW+inBC7Wim+2r?=
 =?us-ascii?Q?I+I2YrkLsbm/IjKSC8NFasCzF8tHRYIl2kSLL+UOY9R7Q44k/DQoZtPQV/v7?=
 =?us-ascii?Q?WkPuNJH1/bg+u18RdwtREKjSdVU5ShSQMDsHmtm1aVXu3OXJTXEGiZWyg8Y5?=
 =?us-ascii?Q?Ac8WwOaVvFC56DN5IIxdvLGjy7fDVo158TcZbYt2N90WsNFVxiy17aONwlxT?=
 =?us-ascii?Q?OKW04ph8FEdMiVonEWwEc8cIgZmkSWKMyNCDDaziquTAbn3vxqBC2flCJmaX?=
 =?us-ascii?Q?8AWuai145efAwp8d3jKxIaJfq731kl1MI6eLd07EDLdHfSegef8ojhpmYrV1?=
 =?us-ascii?Q?0M4FX3GV8tqK2C3gn6E5pWk5LkG5YhiDqNdmJp8Mmeiv+sihx4snrLNU0JW5?=
 =?us-ascii?Q?O+26mXYhpNN2ssq3Ch0VLic1PAqR2iwjsC6PAQoznKAFHcFCm3FRIYXToKSk?=
 =?us-ascii?Q?BaLsLKDWnnD2dFpHXbCtpweLIhU2jf1Q8Gllay4tMUi67VQLXWJ8i3eyAPXv?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 122f7d72-3d80-4f4a-8eef-08dd9e070a68
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 16:45:23.4408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qtxA+Uw/um8L6356NyQQKf4FeYei5RveEEp++GGccZDu2R8xMHxQC/cYpHFrcCWwEsO0cTwq9s1aSG5gev5e/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7327
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

On Tue, May 27, 2025 at 10:09:47PM +0530, Himal Prasad Ghimiray wrote:
> The attribute of xe_vma will determine the migration policy and the
> encoding of the page table entries (PTEs) for that vma.
> This attribute helps manage how memory pages are moved and how their
> addresses are translated. It will be used by madvise to set the
> behavior of the vma.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm_types.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index bfc145baad49..5d4bbe547d0d 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -77,6 +77,19 @@ struct xe_userptr {
>  #endif
>  };
>  
> +/**
> + * struct xe_vma_mem_attr - memory attributes associated with vma
> + */
> +struct xe_vma_mem_attr {
> +	/** @preferred_loc: perferred memory_location*/
> +	struct {

/** @preferred_loc.migration_policy: ... */

> +		u32 migration_policy; /* represents migration policies */

/** @preferred_loc.devmem_fd: ... */

I'd also mention that -1, 0 mean system memory or closes device memory */

Matt

> +		u32 devmem_fd; /* devmem_fd used for determining pagemap_fd requested by user */
> +	} preferred_loc;
> +	/** @atomic_access: The atomic access type for the vma */
> +	u32 atomic_access;
> +};
> +
>  struct xe_vma {
>  	/** @gpuva: Base GPUVA object */
>  	struct drm_gpuva gpuva;
> @@ -128,6 +141,13 @@ struct xe_vma {
>  	 * Needs to be signalled before UNMAP can be processed.
>  	 */
>  	struct xe_user_fence *ufence;
> +
> +	/**
> +	 * @attr: The attributes of vma which determines the migration policy
> +	 * and encoding of the PTEs for this vma.
> +	 */
> +	struct xe_vma_mem_attr attr;
> +
>  };
>  
>  /**
> -- 
> 2.34.1
> 
