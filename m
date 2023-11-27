Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0836C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 18:47:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8EE510E3CA;
	Mon, 27 Nov 2023 18:47:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8465710E3CA
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 18:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701110826; x=1732646826;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tQBulMX8oZ+/4dzZ7NPKTAEAsjAHj8jKlQgmbPGPAlk=;
 b=ZU1rTTNF6KrJnJKcpgSgyQ4RM12fxyceA5O0Or/ubVFex8BzvnPCBTCf
 AsMnC5C5Jl2Y5qJ1bXSxFkLcXFD0lX+RCsRZQCCrO/E791luHG7lgQKcd
 imvAiCYy8J9DHP6b4hR3CZ/Ds2V+2W1dkp/rnF7XsXIFuxKjn0j5TYm1z
 WZMUaEXuQ5OCcvFUO9OR0/0tjxce20lOeSwxEvxneDLSR3HW0FvTSeGZH
 eq7hOT8dXz56pJjN13Ja0DrIIWz4J7SIMVkDCF+Agifav92pzaDRSgmgy
 Gn7EqZPOoxkd/7ce7odIGt/qVBxIp+DbvhC8dCnFfI7DW02GN5wKHbM7Z A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="389920701"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="389920701"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 10:47:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="16375677"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2023 10:47:06 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 10:47:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 10:47:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 10:47:04 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 27 Nov 2023 10:47:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/m2eiKSgL8mhRwnevdVq/Y5ml//HJb1PIlP42KDD8HJG8LWDYY2PZ7xPXcrfNeboXNkYHlHD1HsXMnqlXXF/H/KDnAn6iWlHYmr7u/TReVxUY0PtmJZyGY9OzuyUT6ZMX/k7r/4YEQd2bqSx2YmMaiipogIHerMTI9tbHhDJatPxZF+/ha67v4SD3pNqhB+NIyppEkbxlHJCehhxhUzSDbObqpRDheIfEh98nwBQQIiD2RuhbPLFwWqtGNSCday5vpdv58EZ5NMVlfUmmj4fMGYtzBul5iazKv+Vrr6rGr3bYfwsAH+Ve2PvpiOSqAyaUFIsIdSb/CARNP4VxiQhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85ebO6t7eKIfUpyd4n82wLucsQeQrq4bscFv2phtdRw=;
 b=bfFOmfnK70Wgbe+dxIxC30XgHgj/RMStppXiQpxdoWGfwga4RicCyjzyO24+M3I2kE0kZk3mLvJPZhKI0jDcKfbnFmTiY5yzi/W5mJfaQG9qXbjHjJOYiQN7VqEd3072gG3/gEjhxCAAPavguCxTE0lni/7UdALGCjsp7tvPbwXLLgUEVhYK+P/TLIX0o1foprHBinFZN9Ytf3g0icDhwXZgU5hl1XaT+RrCVNGvV1NTBB5BCccd0innOVBUGRXBZ/PRQr+UmVrwaYgH/hrAPvplH3RfExi2XwDGTou9eFOxZpwKZv8rjXqgr2Lfn/q+vLVjm4Hj2KBpaXlwG38T8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 18:47:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 18:47:00 +0000
Date: Mon, 27 Nov 2023 13:46:56 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZWTkIF13SYmeFuE/@intel.com>
References: <20231127150330.38041-1-thomas.hellstrom@linux.intel.com>
 <20231127150330.38041-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127150330.38041-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR11CA0093.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ2PR11MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bfba6ef-4cbb-44cc-d9a8-08dbef793cfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ogYpNnWf6mo6foskVipGZDp5gIE36KIbf8u1K0wLDByt/1IU8snAYDGCHQvlqt7OHnBldchVQ0WOwEDDCfKCpvd+TR6/TvjciVwsMcVdQFMyHiC0zzR8tcS5zEEQHPahPtQk1XMNDopBQrvXTQTnAfeD3/V/0xbaPEBpTv/QRKJepbJ18E6D4RrN6Whyqf5T+/awJ1kBTXp1gWQhGzqh7VX9S9p+h+T4GCZ2m3pDJdkTNUqxNfZLPxSj0xH7UHNpH675D9LLM3+c3IKqshmouCHcNKVO4hCbi3fp8gazkxLsdbUa4ZOakr97y8cZz5AtaMEpz3I3LE+/jbfJEFyO1En9jMIy8IpvTPU8PGXVGOdPfqnj0VFn4JddpHsPqHbYZSdwu7pPn9wwVshXBoWdkQOynVKfJepq1tnE4cve4/VohBlxDhbHqyCsx9yX362oIyOTeKrbmHdazX8NXc3by797JDcBNnk/q7CNwYDkQuHknN5dwqr8+bcjQd4ku4VTs+71p2Yiw2yIYJ9lxrJh+CvozqvSAJKKI3tcRuw/RYzIacBWGx6m4ON4tJWHLHhd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(396003)(39860400002)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(26005)(41300700001)(83380400001)(66574015)(6512007)(6506007)(2616005)(82960400001)(38100700002)(86362001)(36756003)(8936002)(44832011)(4326008)(316002)(8676002)(6486002)(5660300002)(2906002)(6666004)(66946007)(66476007)(66556008)(6916009)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?amx83ZnKT16ExV3WfqeeOQVjPJ5FYJXDaA13UsCWCYkwIpDspmb6ZwPrb1?=
 =?iso-8859-1?Q?bmaZyK1gdxH2lAce6Wq9GkaPTxtFARCbpXQnXOVjrc2B37My2MCvBXL9Ts?=
 =?iso-8859-1?Q?x3lekLOQgwfS3LFJ8A2Rm5pqUprC7GykGr+MAuxQedLpZg/jjgYP6qeLF7?=
 =?iso-8859-1?Q?CUF/HkyXtXncuVLYYkh1ul9TwaiJ5dTZEI6ZLZm/y4G+nxygO4vouA9Ui7?=
 =?iso-8859-1?Q?P5ygy9NwbHi/jzeZPKJw0qmJ+gRayvhQT7ggRFPUgjnXKiGv3VBHXd/bNr?=
 =?iso-8859-1?Q?d0xLLWKAXlk3q3GarqWmC8M3BPRNP21gO6hdZwWDEujFSG7bKDGVr5f9zP?=
 =?iso-8859-1?Q?PTx9cV4QlBY2UWwAjm6S9QrISE/HX5G+U7sU6pi+0HjC/0Fcpm1eI1SIpu?=
 =?iso-8859-1?Q?OCnPoFbs3Q/1PH5QWlQ/gWv3eiZtCgZZrZxcNE1aS3VV/Oa+VEBMBbz3Nj?=
 =?iso-8859-1?Q?1p3tmkCDit8Hvss0p4MpafQnsr5McjnXkSKZz/XLHEL9AJH7kqPk/PJpOk?=
 =?iso-8859-1?Q?5oYJ/UQt99kxxfsyqMNcNrT0zKlaYhsrhmSTYs90bWl2+kDmeKSxgziRwI?=
 =?iso-8859-1?Q?csXMb1RPJRZmOSrbt84GN+HfexBj9uJ474IW40dSa1xlIdr77wKNDou0i4?=
 =?iso-8859-1?Q?m+VJTOSe8f1bhldJPZvaaDSBdsdlEQ2W7N7q8gA7j086RxMjCLJysSHwzY?=
 =?iso-8859-1?Q?kjd8n74bEOe/WowLunn8IfwYtrSjC7TaBp2SXv59GHschmml+Fd7q3S0P9?=
 =?iso-8859-1?Q?opkMQL4rX9MIu7uHrkCwPySNlqVi4NLos4RcMDO84VzniJCVWHqaY0jJo/?=
 =?iso-8859-1?Q?XnPDK2SbnZT/H2jidRsoSlZmM4SZZiduskRE5fJ5P1+Od0Y6kW5t9hLSz+?=
 =?iso-8859-1?Q?B0rXQ/+5qbaS1zGmDBmJhojNrEYulSzeC8Zo4vzgSqN8s3QHEBup8/XvEF?=
 =?iso-8859-1?Q?RjtuuYz6FixTFzqlRo0CJPfYupvaOT/avtDTkZPQRPdqjqosf4I1dYVf/I?=
 =?iso-8859-1?Q?Uh787Hu9I/X9W3TlMlaXIv6WVehubRXLVA5xmuBQtUvon6mPj2Nq6B3rqd?=
 =?iso-8859-1?Q?tngIIzB/acIUzf4jghdyKvSxuTbq6Em0K+69dOtq1/2b7Funx+uv4PC7Gj?=
 =?iso-8859-1?Q?HVspDZ/sk49RCNN7gMEXos6e+791TvbaiXWL0EVWaVt+US1P9TbHWb4sA5?=
 =?iso-8859-1?Q?8la1HPzGMKePWbHVdDI/wYnXozIoT1N880LwVJD7Cdgi1sNJmb391MSpON?=
 =?iso-8859-1?Q?Ol9tcH2RYuTv7AD5tLRc7lh9rj6yMfURPnuzoc2JQ+qxXRbvWsbRoVPNS0?=
 =?iso-8859-1?Q?+RX9MbG3CdPN27qoe4nCcQreEmL3AwJ/ErKVkVUY7oVvnnl1sNPj2hwrEc?=
 =?iso-8859-1?Q?W3cWokX3wKYOu7Ju0kDzFROfIQtO44aMpDt1J34sYy9MOtTyJL+VPM4+D4?=
 =?iso-8859-1?Q?27iImbkIM4qlF/Ub38N/b+C0bS5z4L+gjRK1q3JeAlz7qnH1wslNCLu+K3?=
 =?iso-8859-1?Q?UVOItmAEb43DpyGGPlPyEgx8LBJIziuaq0uKd8RiD6S0SkNuUK8JixjaLe?=
 =?iso-8859-1?Q?q/AkqNkhGeCG4kQdoU5Reqi2i9t0v2Gs397diSabubM12H6ewuHlby0NFS?=
 =?iso-8859-1?Q?c87UKogtOzlVv4e9/SZZZ2df1pYPykIKhs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bfba6ef-4cbb-44cc-d9a8-08dbef793cfa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 18:46:59.9990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXRfTgE02S8zua0QRj0Kbb+/Ul6+gmqGApMTCu0ImW/K5RmcyG5Tyh8JgSw37LwT8wCP96iUpsA9b8PUay/jDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8370
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe/uapi: Use LR abbrev for
 long-running vms
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Nov 27, 2023 at 04:03:30PM +0100, Thomas Hellström wrote:
> Currently we're using "compute mode" for long running VMs using
> preempt-fences for memory management, and "fault mode" for long
> running VMs using page faults.
> 
> Change this to use the terminology "long-running" abbreviated as LR for
> long-running VMs. These VMs can then either be in preempt-fence mode or
> fault mode. The user can force fault mode at creation time, but otherwise
> the driver can choose to use fault- or preempt-fence mode for long-running
> vms depending on the device capabilities. Initially unless fault-mode is
> specified, the driver uses preempt-fence mode.
> 
> v2:
> - Fix commit message wording and the documentation around
>   CREATE_FLAG_LR_MODE and CREATE_FLAG_FAULT_MODE
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c |  8 ++++----
>  include/uapi/drm/xe_drm.h  | 23 ++++++++++++++++++++++-
>  2 files changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index aa965e90ce12..6d35067ed8bc 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1919,7 +1919,7 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
>  }
>  
>  #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
> -				    DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE | \
> +				    DRM_XE_VM_CREATE_FLAG_LR_MODE | \
>  				    DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT | \
>  				    DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
>  
> @@ -1955,7 +1955,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
>  		return -EINVAL;
>  
> -	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE &&
> +	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE) &&
>  			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
>  		return -EINVAL;
>  
> @@ -1972,12 +1972,12 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  
>  	if (args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE)
>  		flags |= XE_VM_FLAG_SCRATCH_PAGE;
> -	if (args->flags & DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE)
> +	if (args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE)
>  		flags |= XE_VM_FLAG_LR_MODE;
>  	if (args->flags & DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT)
>  		flags |= XE_VM_FLAG_ASYNC_DEFAULT;
>  	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
> -		flags |= XE_VM_FLAG_LR_MODE | XE_VM_FLAG_FAULT_MODE;
> +		flags |= XE_VM_FLAG_FAULT_MODE;
>  
>  	vm = xe_vm_create(xe, flags);
>  	if (IS_ERR(vm))
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 88f3aca02b08..2810997a6db4 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -589,8 +589,29 @@ struct drm_xe_vm_create {
>  	__u64 extensions;
>  
>  #define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 << 0)
> -#define DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE	(1 << 1)
> +	/*
> +	 * An LR, or Long Running VM accepts exec submissions
> +	 * to its exec_queues that don't have an upper time limit on
> +	 * the job execution time. But exec submissions to these
> +	 * don't allow any of the flags DRM_XE_SYNC_FLAG_SYNCOBJ,
> +	 * DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ, DRM_XE_SYNC_FLAG_DMA_BUF,
> +	 * used as out-syncobjs, that is, together with DRM_XE_SYNC_FLAG_SIGNAL.
> +	 * LR VMs can be created in recoverable page-fault mode using
> +	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE, if the device supports it.
> +	 * If that flag is omitted, the UMD can not rely on the slightly
> +	 * different per-VM overcommit semantics that are enabled by
> +	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE (see below), but KMD may
> +	 * still enable recoverable pagefaults if supported by the device.
> +	 */
> +#define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
>  #define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(1 << 2)
> +	/*
> +	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE requires also
> +	 * DRM_XE_VM_CREATE_FLAG_LR_MODE. It allows memory to be allocated
> +	 * on demand when accessed, and also allows per-VM overcommit of memory.
> +	 * The xe driver internally uses recoverable pagefaults to implement
> +	 * this.

what happens if user selects this flag in a hardware that doesn't support
recoverable pagefaults?

> +	 */
>  #define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 3)
>  	/** @flags: Flags */
>  	__u32 flags;
> -- 
> 2.41.0
> 
