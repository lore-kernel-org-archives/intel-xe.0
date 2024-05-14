Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D64C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 20:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A076710E20A;
	Tue, 14 May 2024 20:21:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gj8SmEAd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BD110E20A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 20:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715718074; x=1747254074;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AwXBiZ8MJbIrfdD28cYWBLh8nHD0b2RyQP7oIV608k8=;
 b=gj8SmEAdEByqd+/18UViFUJ45RGdRKh4jFtle3/RHJEVv/dSn2e5vr+T
 GGKZ0NXbiobqAZ3U/dOsUFRxhQ1Xa5RbdKIALojKINp5D7u1RsG8KxpLG
 tkprGdrQPNovNVsnMq4bPoGggvCcw29jvY63KbrM1Nr0fgluSuBU/KUux
 gWn5tnPoPKZmdPFa8IFWhZWl1T9tqHZCjqT5XJOk0gaze8QxFW/Bf/Ay8
 t0K7V4RLL+VNqbaLXFFHeGc4gY18iPaUmgrFHvi5bsVmHKm0dfz4aHuY/
 71QPCqtYxW16xRW5Y19Ul1EEmniUZjyjcTwtmW1hE+MjBGUGrmXRPWspu w==;
X-CSE-ConnectionGUID: mNzaQvy2RG+QC+Ipp04wvQ==
X-CSE-MsgGUID: LKjn5NHARmSAn0M4IZk91g==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="29216606"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="29216606"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 13:21:13 -0700
X-CSE-ConnectionGUID: h2UHg4P+Sx2ecE6OxYhszg==
X-CSE-MsgGUID: GQLnsfBxTLWSN79jPwPNgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35284960"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 13:21:12 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 13:21:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 13:21:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 13:21:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdtHr02xEL4khShEWpJAE/EHVue1lnyM8bQxZx5QZ/fu7JwLsxQjm78lcfmqWua1VeK2eMpfkuALdmFCpFz6NGkibcIJOvK2zG2UOnNvFtL3GKLZ2cJknjrOOGB/5XiwiTJ6dInwtIKf5JJcwsd1JMeuwMSb0ya6FkDEylVSGYnAuK0tGBznIp/AqtZuvQg8wJmMkiVKqMC9rSuTpR7+RyG4QgqNnRZ+TjC4tQYOhGeSZttHuDi3l50J67YFKvFLxHVK+WgcLA+v6813kY1LDcZaqbgoRDYtldvNK35cRo5E39WACEAlQzdh4kRdrjy2bM78pg5GdK6myo7ktNiy+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fJnGTi+arJq4cmViNnecxNqZMGRkV5KwvI7mTEkdQU=;
 b=EWTcftVpQmplHKOY3M9V6cNa/0gAlXXYewNPeQxOjOsqt8pA5K2GTI61XA9y5hpG5oxyx3Bt4wSbw4bNggpdCSM1E+6mrm1/tsnWa+NLYOHVPhbOtDq0+14Xl5ABnZ6MJp2GWfzTz9SnbnPXuEslIdx4PbFA2zolWhDqf/HwpI/oIUQqX2I2zR0dY/q5JOKqt8TmBDEOUs0/Odw4BLakZBdl0GgZ6W8P6Zw9gdTHNMpudQtt0+RMj919iBX3D597AZjd2LS5IliaaUYWU1wkL0b/nLg/UJpUr08JYeuqloCKDmiEjhb0RPO+j6v5JFkGUEBMDqnOqHC+FL7mGbd59w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB5298.namprd11.prod.outlook.com (2603:10b6:610:bd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 20:21:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 20:21:09 +0000
Date: Tue, 14 May 2024 20:20:26 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Remove the pat_index field from xe_vma_op_map
Message-ID: <ZkPHiqwNPbqwzdUG@DUT025-TGLU.fm.intel.com>
References: <20240514110341.3581829-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240514110341.3581829-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BY5PR17CA0033.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::46) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB5298:EE_
X-MS-Office365-Filtering-Correlation-Id: 01cb4e97-811a-45de-97c7-08dc7453646b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?005p7F//EUsjuBSeQLQj8Ag33ZP8IcjqBfN9tJlC7VpGJh1j04v3LxfEqCgc?=
 =?us-ascii?Q?8KoolPZGUdIRPM31j+f60YyfBCuTFXn73PhbSZfL48tLP/3G/la4Dr0Ll7l2?=
 =?us-ascii?Q?2v5LMpozY0WTZ0Gj5OdadzMZJC5NM+/cshEATx/a9FzaMeD+JW0xVmetQ8d1?=
 =?us-ascii?Q?sWPp63otFS5evCun9TBYAgq7p0cdMmzIjcm7qjK1DQkf35eUobx26TO/u5c1?=
 =?us-ascii?Q?yo0URJm1WkppS3mC29lkfYSvoqjm2JCGL5xMsl7J8eyD9tlXIT0PsHGjJZuP?=
 =?us-ascii?Q?M/hZO2OYlr/viIM6ZcVSOVBl/FyGpWrL50wS9CKHfJRDlbdJ3wz02mK3H//M?=
 =?us-ascii?Q?XhXOIjVSUuf4YRJ7NT3opgteVz8c28DeUgM01Gy8zE/pQf6Od1u1Oux//Slf?=
 =?us-ascii?Q?GyehKFQx6mBYHup6FYe/FVURC++gmc0wok8o656CXC4BdRFREv/q13Prh45V?=
 =?us-ascii?Q?7j7C9H2MWicFETk7ofFVTMlwfY858yDWlqhFLrozp2k8m8rkv8mLC+I4SMSU?=
 =?us-ascii?Q?Pd7sBWSHVhIYt5bZZyI8BA6hrtQSLrZcVzAg6dVOSy/opkkRBojnIwPrzGKT?=
 =?us-ascii?Q?aKfLwsCeKP3hDUBApAnQ/+wEbxCA10mLaca7qe2pHl/gNdZ6njv3nQh/yiwf?=
 =?us-ascii?Q?dn6aMyVbkMBX06kLU89r9RjaliLrK+ptvA+hrtdM0OwTJ77jPq6nER4SEsGl?=
 =?us-ascii?Q?/qEO86ZGN//OpzXvfSifj3iHBiOHB2Nu/uJYqAq1shO8LcEaD3LaHv7l0wdE?=
 =?us-ascii?Q?Un66HNoSJyzCbMq6MlQhHc3u+zg9fYfEqfCgpAeR0YmXoM3ErR1izHt8OrCs?=
 =?us-ascii?Q?2t5J45BOxuuVNWGr1foiOK0AKyNACNaeegxjgdxHJga0mZzXLbI1rvv5ul5B?=
 =?us-ascii?Q?3a4x450gpMHGQyBhX3DxQ4LLm19vlKVKlndjLgK595vz8d58+p1ANbQys0eM?=
 =?us-ascii?Q?j/7p7N6eiUwQ/AK9VvPM7Brv84GenH5l+jQ4sx6O1NAJ/9Q8qDdSw9+CiWux?=
 =?us-ascii?Q?fT0ohCtC3LtXTHECL32imu7IQ4HxX/X8Q7RgLsOWCgdfE0D1JG42IDRYQJBw?=
 =?us-ascii?Q?6o1t3OGMSmEARg2kvqwaNSyZaGkxm6H2wseDHwskZVZBY3mRym7HIdWW9FFI?=
 =?us-ascii?Q?JayfZ2YFSOfpkN1V5oyXEIw90/tAXM78cT/Jbr1B+92M8SjMqzhdkJbj8O1m?=
 =?us-ascii?Q?THEVwSEWE4kjO5GF4UeAoK5eRQoPS4KfWcZZNOM5w4wDD5KsvvXK2+lwT0Y?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yJFcnzXwulFfY5SbTpc8DwKU805hnKE8rX3fgltmvjhbIczwU/OiDpXgNaAm?=
 =?us-ascii?Q?Jz218HOOkTBlGjiFq3yfBN/RrKaKWBisN1h2gc4NEOTIKhWv2N0kbQtitRcY?=
 =?us-ascii?Q?ZietAB50sYCKKOeaiBUgbwIj46UxO4mRVWJn/VU2++nMkMSY0KPKqULPlZi2?=
 =?us-ascii?Q?KYzB9vEyRs3AlkM4M59iTdJMyf+MZRqZJoVInyhohsXtSMu+kYqMDsrT6Sg6?=
 =?us-ascii?Q?obTiCgFaKjBGwQ8ATczSygZD8mp3oSWUgQJq2rcZHSH/l1F0UYF2N9k0nlKz?=
 =?us-ascii?Q?AYZYDcw9nI14t14gHvhedqWZWbfCfaAAlitVERiBNG0G1noWrIepl+Iydtaw?=
 =?us-ascii?Q?yS6HrNmq4KNEmb43SimTCi31pzz1WwG3QvLD/cFPY3TPiQ5u5CA+K6TO+i31?=
 =?us-ascii?Q?epX7AYZw+/6UDPJLiw4qv5cQl7pytYuRjGwZCKRwaJmGhuQSh1D0jtAQZh4u?=
 =?us-ascii?Q?+hcYbnyLYoqkQ4oPNyp7RJ7jUvAFNmLe84rquAcOrslTZV3rTHw5DBvgonQ+?=
 =?us-ascii?Q?pgxa2zjX7iwWkrJ5d23Mt836diou9DoV2JeNFDx0ktXv8UwxcnQqU9ZPC5/v?=
 =?us-ascii?Q?s5CEH9ipGj1+SqdzcfGerZ9GAa1eoZg48NSxtnMvhNWJEBqnPJjFufgNfkM4?=
 =?us-ascii?Q?Wc/mDGKKoDd3JYLJMIlxppv5qzjTluvslrsLT+/s7vgt3Sbsw5QlcidSyiIp?=
 =?us-ascii?Q?gaUzwfVu3xoaE1OsX+rDcgOUNcAk2A7qYwM/KeLG0mDZwc1RZ3uhXq7rm5Hn?=
 =?us-ascii?Q?4NmefBO4if6/mhC6N6hfsISssoq2/0aeAQqiIE9o1a31MfaacNx9Re+DWR23?=
 =?us-ascii?Q?LiNrC/a67WdwPeyUfC8M42bscpTMJCbX0+adXAzVq0q3oJF+m+njtypbLBUH?=
 =?us-ascii?Q?D5bMJ1P+Cb292xNx9Ie0fuNihRLWeAGX4+KY374/xZZo1SBAhj/n4uOyMpBq?=
 =?us-ascii?Q?ARdtCcTAa2ncHqYEU6P0RHHiwaEu6WYdPFoo7bDvpTB74moI/BFbsReiaB6h?=
 =?us-ascii?Q?WMGibgZyo2wBVKrWGFfbLXsmPa1w4ep5OV81BxA5MS2WaSCiikQG2drmZHlT?=
 =?us-ascii?Q?M7biWmi/GECT659jryaWU1ccPV927+tfTd1Tw1qQjqEAGT+iXnRGTLp4DeZZ?=
 =?us-ascii?Q?S5c4sx+duOUOixNDXqeSBRtZPTTniDgKzQGex5J/ChessOVSfR5nN8qhsn8U?=
 =?us-ascii?Q?t9clnacJmuS6+fVLdzuiRs4aQlwr6zXSELk51uZkG/qVZTcdp5wiTGLwzN10?=
 =?us-ascii?Q?Mr8bDaN5dd2x2URMTal1DJKeVbcUDkks9zMxJU33f01SoTT/B+Y0q519n/gH?=
 =?us-ascii?Q?zSBiMtmkXdDVsOyKs/ok2oTjB9buSnw3zKFGzE1WMstc0ZxcdY6xa/96b5z+?=
 =?us-ascii?Q?bHYN9XyVvrKjZWS+EB3VfuNWj7VhEGkZmkhW//BMT2Cbi+qBlElt+wschqic?=
 =?us-ascii?Q?HCdD277BYL2XG0cvUoBzXzBAEMptoNJHjmwf8cnTN+RqoqGERhVTBf/pFh0q?=
 =?us-ascii?Q?qlEOIr4WpS+3NoYtvvvvcvMPbTVkVCNbBqQ5gIR3u5cbm5gQbiRY47gwly5h?=
 =?us-ascii?Q?BU8tYs/rXoiztwi+7JiF3Y50Cp6BvtZHrJLnCbXhwVyHsTVwMCGTfvcnLRRJ?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01cb4e97-811a-45de-97c7-08dc7453646b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 20:21:09.7490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: okIFOsH+HLQ/C0p8+IUZsRKmLfDvohYZTpJGg32RIbv+vBqTgEjm9sBMNBhtqrxXmVHU13su3zvrZhFhjnyX0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5298
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

On Tue, May 14, 2024 at 04:33:41PM +0530, Himal Prasad Ghimiray wrote:
> The pat_index field within xe_vma_op_map facilitates the creation of new
> VMAs for DRM_GPUVA_OP_MAP as a GPU baseva operation. Rather than
> initializing this field in vm_bind_ioctl_ops_create and subsequently
> utilizing it in vm_bind_ioctl_ops_parse, eliminate pat_index from
> xe_vma_op_map altogether. Instead, directly pass the user-provided
> pat_index to vm_bind_ioctl_ops_parse.
> 

The patch doesn't seem to change any behaviors so can you elborate on
reasoning? I'm hesitant to accept changes to this code path aside from
bug fixes as I have a fairly large rework going on in this area [1] [2].

Matt

[1] https://patchwork.freedesktop.org/series/133034/
[2] https://patchwork.freedesktop.org/series/125608/

> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 16 +++++++---------
>  drivers/gpu/drm/xe/xe_vm_types.h |  2 --
>  2 files changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index c5b1694b292f..a11685e9546b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2055,8 +2055,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
>  static struct drm_gpuva_ops *
>  vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  			 u64 bo_offset_or_userptr, u64 addr, u64 range,
> -			 u32 operation, u32 flags,
> -			 u32 prefetch_region, u16 pat_index)
> +			 u32 operation, u32 flags, u32 prefetch_region)
>  {
>  	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
>  	struct drm_gpuva_ops *ops;
> @@ -2117,7 +2116,6 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  				flags & DRM_XE_VM_BIND_FLAG_READONLY;
>  			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>  			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
> -			op->map.pat_index = pat_index;
>  		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>  			op->prefetch.region = prefetch_region;
>  		}
> @@ -2278,7 +2276,7 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
>  
>  
>  static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
> -				   struct drm_gpuva_ops *ops,
> +				   struct drm_gpuva_ops *ops, u16 pat_index,
>  				   struct xe_sync_entry *syncs, u32 num_syncs,
>  				   struct xe_vma_ops *vops, bool last)
>  {
> @@ -2322,8 +2320,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  			flags |= op->map.dumpable ?
>  				VMA_CREATE_FLAG_DUMPABLE : 0;
>  
> -			vma = new_vma(vm, &op->base.map, op->map.pat_index,
> -				      flags);
> +			vma = new_vma(vm, &op->base.map, pat_index, flags);
>  			if (IS_ERR(vma))
>  				return PTR_ERR(vma);
>  
> @@ -3242,15 +3239,16 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  
>  		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
>  						  addr, range, op, flags,
> -						  prefetch_region, pat_index);
> +						  prefetch_region);
>  		if (IS_ERR(ops[i])) {
>  			err = PTR_ERR(ops[i]);
>  			ops[i] = NULL;
>  			goto unwind_ops;
>  		}
>  
> -		err = vm_bind_ioctl_ops_parse(vm, q, ops[i], syncs, num_syncs,
> -					      &vops, i == args->num_binds - 1);
> +		err = vm_bind_ioctl_ops_parse(vm, q, ops[i], pat_index,
> +					      syncs, num_syncs, &vops,
> +					      i == args->num_binds - 1);
>  		if (err)
>  			goto unwind_ops;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index ce1a63a5e3e7..e13400dd5ee8 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -284,8 +284,6 @@ struct xe_vma_op_map {
>  	bool is_null;
>  	/** @dumpable: whether BO is dumped on GPU hang */
>  	bool dumpable;
> -	/** @pat_index: The pat index to use for this operation. */
> -	u16 pat_index;
>  };
>  
>  /** struct xe_vma_op_remap - VMA remap operation */
> -- 
> 2.25.1
> 
