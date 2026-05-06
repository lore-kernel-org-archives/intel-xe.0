Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E35CD3439
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 19:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0217610EE8A;
	Wed,  6 May 2026 19:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AC22xeJm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5103C10EE8A
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 19:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778095719; x=1809631719;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BBg5p8Ar0j/uhTtnq9wkkocsYxYZ6gW7Ivj9K9EhCM4=;
 b=AC22xeJmN7f5pzu1g61Qgv56Voyv1aLKItSgJ1MTZ2XnZ4dsVz01+2WV
 7WYiW+UsYEsXn1T1m+Ybh+eitzLrH5Agvn1unRJaP8cDvnrzfPy56/Zmv
 zjX8s8hVCWYB+wCZtS0I9MunCe8w3H6n3wX44gCdvCH/QdsxKB5hzMlR6
 W/h/+1EYGTuvxXEPOKi4yc+ZbRsk3ClM80YejEhdSZMqcYBKwIzUIVLml
 vW/pH21/Pb5p4f81W5g/KLnrh7dcJc34lP5DB+4kqX/QxNNSjOE8p6hgb
 3lPsovlQDdVHlMhjICtJyTkxOCYOyX3NRI+qkfE/OmyHS5/ZLuq5RI9N0 g==;
X-CSE-ConnectionGUID: rBEpYRS+SDej/Ux6qJw/wA==
X-CSE-MsgGUID: kRvM/YzMQlup59FK/I6/Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="90415634"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="90415634"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 12:28:39 -0700
X-CSE-ConnectionGUID: 15mo5vGdS+SgsHyxeOYT9w==
X-CSE-MsgGUID: kQtHEGfXTJa9JMPchzQlkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="241217553"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 12:28:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 12:28:38 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 12:28:38 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 12:28:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QpfEqC8fbShV9YuQ7f1QXkTXQDWbrgb3yIR6vJN8UisIas7pWBsNy54QsFmrGWfUbIKLowfKRXnkmgUKUhWNk+j3CUSySxGczgJABmgDVjfhgeJNtz7I7Ata/RDJZy1i5WlkOqoCx5Jdydm9PrV5kwW0b8RpmWjtSs0N+Y1twX+z17K1U9+7mp2qm9x8FK6wro6sU6ya7HRTdJeNOmx5Z6KraITRvlW9N7cRUPQDzdV8X63fmBS9JsrWuKsQ6AXhWIB4GkbC5w3pfwl4/NsXF3Wj0CjlmhBGyWv6WQFu23mIhn24cQJg/bRz86k/aiZCBSZzfX23IFNVSBERQKpUbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFuBR2eEf3QnsUA58MlyfZG93nw2ncBWby6MhYx/LbE=;
 b=h79yzYCicAqRydlqGeN+c3W0gzwFIfnDIyjkeVW5/A/+EmzcESMS9Ic/10WugkmRMiFCQZiwBVXhlsnyOZOWUPP2H3oF0uFoHqklU1+RUjmdf+Ex5gWsbuBMdVo6bTM+dpMLcuSMHZFq9Z0og9x1Ktdl8/3seVM2T9yygiliHzk7q9wIOcrlQ61kFCLIsb9Yf1Uew09IH1gTaLEOLqYEfjjkCMlUWeYU9QRsbmzgRSmX3vj5Xgl5c6SZ/TCy63GMUwQO7B64K10xYCPPGx4WCHj+TxhhSkfh2nO0Z540fpurMxGm5zcpo6djPs/7qMVxT/gsRbyKj9bAZsAKu5vjKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4634.namprd11.prod.outlook.com (2603:10b6:303:54::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 19:28:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%7]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 19:28:35 +0000
Date: Wed, 6 May 2026 12:28:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Ramesh Adhikari <adhikari.resume@gmail.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/xe: Add bounds check for num_binds to prevent memory
 exhaustion
Message-ID: <afuWYH88a4UaABXs@gsse-cloud1.jf.intel.com>
References: <20260506180636.23771-1-adhikari.resume@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260506180636.23771-1-adhikari.resume@gmail.com>
X-ClientProxiedBy: MW4PR04CA0177.namprd04.prod.outlook.com
 (2603:10b6:303:85::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4634:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c99982-ecbf-4ad0-97f0-08deaba5aa8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: SwiNLU831fwkuiZn1WHf1Tt1LdgxIOD6zkrd2zY0vnfvLKbE5vw7Hk09lOLH6MBP9cSG7YoN5s0uTtD/YYiUsaVfgpXaeXn/FB5mTKCVOFQV1FO5sT1NO9ehNolXKtNtlxwdt0lPF2NgLRfWvrjCY3AF4ien2GqFvRaNszwzRKg3/MPNLCxOEeNRfrkAweWhRGmTnqG5TQu+5W3pXazcBTug6hpidI4GqU97pVZG2EkGcXU8H45tAWvQrQ3N+U4lBixt3J0KmfaJ8TNSEPl+j940TCa9QVjHs0E8za7PMX/8maMT/9XSwXoAOoHaJX7qvoy91k3v66DmDqBg5k2MNpoG0zi1qyucXbvmt1ixT96HRWsalZt/Kmmv+D4YYlKpx6qJ4fZcJX98MWud0XvL51KtIcewlK86lGkJ0F2SoejAlOIpZAhe9cy+Ur5nqu3LbyastHo5D4+lBivUzjlgiZUYpwrrug8BVqSHoSfE2Fc5S8v4e2xOtTh1gKqFaZxaYnmHb69vTCMW6i6P/E0VGQrHwHA4Yj5C/p0axL0TwqsfWqsfk5xJ+DPsz30D14V6we3IJPWBIVAmjNuKa4Kjx63xvZXc6uym/w5swyOcqJAb3dN8rY08S7OvGfOOysM750GEGPbkcul+5FgC1DPZuhhIN6XCFJ28Fq1mIvwNnwLwwrybqmggVvZhnMX1BtxQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b391lS8j2kAFmM7OQDFHyhJo9xOis8K6W0DGU4+ZWQgg1t/Fqwct4OAJbiGT?=
 =?us-ascii?Q?K5XdoMiRomHGM6kD2Ufjb4k5+UpKWka2YvDoiCpYh4oviHfGTJOtwOvyNNXV?=
 =?us-ascii?Q?l/7e5HN0Ho5wLZ5/na/CxEDM/dsQJSanPIKgmXGEbUtxfNPFEOlaWIQngLP8?=
 =?us-ascii?Q?bLg3RUg5G9dsOV3O8GrRYxFTvEDK8zFt1APN9onL4/CKWsLw1cmYr4IsjZrY?=
 =?us-ascii?Q?xXePb7eq9Ciqs0CvAVVRoXXY0cUUs3NOIKqRRHGyJLQJ4vxskXzLWbj4ACBS?=
 =?us-ascii?Q?ho9POqksI9GL3t7HZXPLmzL9sh4yu3v5Ss1r5v5PvhrE/jBPnzDz5Em8D3SQ?=
 =?us-ascii?Q?ngONcqOPfjHQtI/XTfEn02e0OiCMB5mwFFShrgV1b5wZn7VlwIrlkhjYChMA?=
 =?us-ascii?Q?scRHQ/JRjPTw5ETXBXff0aUQA67vCNJFaaszamMNtZsOMtf8yMtwBnp43O2C?=
 =?us-ascii?Q?+wJ/ukDI2LWmQ1IfXBN3IissLMEj1Xjh/ssTiiR0OU2o9VkYGUlmSWWeAKFR?=
 =?us-ascii?Q?QUhxR8OPE2nvPiOl03ri1gByUus4d4otRRVFfrs5dntlxRq//e1YTVNjsjYs?=
 =?us-ascii?Q?OCKR09vVOH3Voo8Z7WVqmRchH9dTtvsGLC3KbUTJfMo36lpm5dYeya1AEOW7?=
 =?us-ascii?Q?sk+1aI+Do6aFTTE93ASz1q68GTsxNOMkFQBWHFPv+tmD6AZoipxGLuVbIb++?=
 =?us-ascii?Q?0ClfGMuSHlWTBMgj/oCzMP9Q6a4ei1PmYnbIcs+hESV/FbbrZVp093AGO73e?=
 =?us-ascii?Q?NvnfJjuPvaEU+/p2Ntvon9lNd3LhqnhS241hzjyvw0sEPJNMEAS75N1OJJgu?=
 =?us-ascii?Q?A0+Zrardn8vX/jWvo4apo2FtWu8fys+YX+1WzVqSiJ2HuMDsLDICervAnNQx?=
 =?us-ascii?Q?IHncEcZwS0eupMEp1N3caZeAUpafpzlvFMvfUtACA4w31m1zsARb0Wpn8tTp?=
 =?us-ascii?Q?cUHEPgbPvSYelZcTMV7KL6KllQDe2VXW0+ZosbjGMIUZeNOSQ10RMrdrIR5z?=
 =?us-ascii?Q?prmBkwwBwRgS4Fv/IiJRnfAXgF8gLZqoZGQrY6+hZWN4wWYEotBLoj76hTGK?=
 =?us-ascii?Q?jI/icId7DegIaRpxms7sCjIcFV0tFc6bWbSfSg6tUunbTd3G1F840cFpeyVc?=
 =?us-ascii?Q?/SvvGiIYC/1moCaSqbFaV0JM0k9j/pxJm0L/nIkbU1z2Jb+qn+88Nb75tga9?=
 =?us-ascii?Q?MaBx4e3cGqv2fbxsUXMIEPHcEjW02BYDqRbC56fzwxo22YYHIro1iDWxumqA?=
 =?us-ascii?Q?Ce29Zp/7q5dJ6dPP7AeSW7IPoiZ/jbDhYniaaAOxDnAA78gFZ+TqQkJA5dln?=
 =?us-ascii?Q?eRxpmJ9z199C12rKIPfNmwjphpxGW3nbcyfKbZRetHChdLzN2a05XfhUDSY9?=
 =?us-ascii?Q?1jM1102n6Nh2YsBYx70ve1XxjImYgGB43LhhbUB3cyxmw1rm8vzIfw0F3ZYz?=
 =?us-ascii?Q?Tmd7L3PtzU0GPSx8/q1JRDaDAVKHC7fX9Jalexm/1h9aLh3cKqNeDi4B3wre?=
 =?us-ascii?Q?TAC5FEYMljRPFyrx5CJ5rrTb6TfiYEV/IVs4k2NwsKcOIMqWR4AOZFdxJcZP?=
 =?us-ascii?Q?CBkg1qyKYWSjp3saZ3tESppwSnpokPQT7VpJ0j/BMhJ1aee4l0+BIJnZSdum?=
 =?us-ascii?Q?aLNBpKgHy4m47RqIkBetEj25v/zze7vu3uCSH0m4DEF1tRu20vwsAD9rqLmX?=
 =?us-ascii?Q?fyyGAYAC3Ssa4fEM/Rj4PXe4iOJzC1KIi14NqfLf4JjDA5AYAbHSVjhM4/Zz?=
 =?us-ascii?Q?XTor3uFjzQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: wQGsiDeZQoZ4lEMMvMnL16AvOfHh2eDEDkFtxoF4IBbrdO2OxCQzTxNyGHFUdQZ+IzTWk7F82tX5OekIHQ13lsGQ+m+WAM0+MM4blVueiv6MbPomn1hlWxIiV8hgMBehH3ZSKuWlegPncb+7txSwIA7VSYUp78luhvU+mOpyX8HHmlZJvqV2tOYMN84+lo+A9/rnuU0cmD7rvhm7okqac2gQ7iKSNLuNYUR3odunR/5gTbC1lA/QfHA4k+cqnAQb4FDUykdu4KAz0Z+BMU1UBoIx+o1E3Tx7zlUO/XpCePkLkFanAkY1l/jfC132QLAuMaFUy5kxk3GpCNOs9g0zFg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c99982-ecbf-4ad0-97f0-08deaba5aa8a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 19:28:35.4043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ytdXiTh4WQBGk7ljQ/pOS/fhu08234NktDdf9Zz9c/DU3PCn7mvxGst+hEzyWz+KpV9iFgzAUfXX8cI2Q0ZiYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4634
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

On Wed, May 06, 2026 at 11:36:36PM +0530, Ramesh Adhikari wrote:
> The xe_vm_bind_ioctl function accepts user-controlled num_binds without
> 
> bounds checking, allowing arbitrarily large memory allocations. This
> 
> follows the same vulnerability pattern that was fixed for num_syncs in
> 
> commit 8e461304009d ("drm/xe: Limit num_syncs to prevent huge allocations").
> 

The difference here is we issues kvmalloc (2G) vs kmalloc (4M) in the
sync case. So still possible a user triggers kvmalloc over 2G...

> Add DRM_XE_MAX_BINDS (1024) limit and validate num_binds before allocation,
> 
> matching the num_syncs fix pattern.
> 
> Similar unbounded allocations exist for num_mem_ranges and OA n_regs,
> 
> which should be addressed in follow-up patches.
> 
> Cc: stable@vger.kernel.org
> 
> Signed-off-by: Ramesh <adhikari.resume@gmail.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 5 +++++
>  include/uapi/drm/xe_drm.h  | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a717a2b8dea..1ff66874f43 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3841,6 +3841,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		return -EINVAL;
>  
>  	err = vm_bind_ioctl_check_args(xe, vm, args, &bind_ops);
> +
> +	if (XE_IOCTL_DBG(xe, args->num_binds > DRM_XE_MAX_BINDS)) {
> +		err = -EINVAL;kvmalloc
> +		goto put_vm;
> +	}

We had something like this early Xe, IIRC, the max was 512 but we found
for Vk / Mesa they will a huge number in an array of binds. So 1k likely
isn't enough and this patch would be considered uAPI regression, so this
as is a no go. Maybe we can figure out some reasonable upper bound (64k,
128k), idk.

Matt

>  	if (err)
>  		goto put_vm;
>  
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index ae2fda23ce7..804ccb23b11 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1606,6 +1606,7 @@ struct drm_xe_exec {
>  	__u32 exec_queue_id;
>  
>  #define DRM_XE_MAX_SYNCS 1024
> +#define DRM_XE_MAX_BINDS 1024
>  	/** @num_syncs: Amount of struct drm_xe_sync in array. */
>  	__u32 num_syncs;
>  
> -- 
> 2.43.0
> 
