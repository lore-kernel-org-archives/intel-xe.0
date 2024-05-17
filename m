Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BFEC04FFE
	for <intel-xe@archiver.kernel.org>; Fri, 17 May 2024 04:19:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA1710E3A2;
	Fri, 17 May 2024 04:19:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AmDtmAyi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601FC10E3A2
 for <intel-xe@lists.freedesktop.org>; Fri, 17 May 2024 04:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715919585; x=1747455585;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TFjm/yZZcYnIW7r5zkQG3Rw6MokGhg+68LdU8zDWiZg=;
 b=AmDtmAyi0ck4Wszpidfy5+apflnqkdQiQEIRdmJZrpF6qdUDk+1PtMEz
 HAKktvAnqD0kqNExTvjXwvHZeR3L3r63vFBlbAifQzCdPBSLIBKkw0GYG
 AB+enHHz0FJsA0SuAUwjnlziHKT35L4L+Wvbif6g8AWOHV3WxcWzwpJce
 fqeqq5PxWgR2gZV7yl2hSGVuphro4bOGBTS8JTKs2d7moPg+C77n5AU7e
 SK4/A+1QAGlY3b92E/I3ikOQaAzEwP3d/BzC1UYQXOClsRAbfGSPBc2Dx
 zHmWZpd7BsWAPzEFEbTB4B3atMxmW125CMA5GpRdJc2Uzltb4J2sBW0MC Q==;
X-CSE-ConnectionGUID: 5biAJlNcSsSrXgYIEjkkng==
X-CSE-MsgGUID: ua+A4qaDTd+quUVcO4ROpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="15027426"
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; d="scan'208";a="15027426"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 21:19:45 -0700
X-CSE-ConnectionGUID: T5iusOAiRqK6Z5lwUhfKUA==
X-CSE-MsgGUID: dfL9dBCKTgm1oSLa7QrFFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; d="scan'208";a="69120898"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 21:19:44 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 21:19:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 21:19:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 16 May 2024 21:19:43 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 21:19:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Is4HrEKnaEIgCpdC2I8iQsTpXAgaHRaN6ZU7YVZeZgkR1RomdezhmTzpfC9VKP+RnBWGHgNyzLGOBCwjecWBNu++HkySE7i7Vpb5LWiFyvlr1UoG4SrHnPCZKNhEDLvTVb5ACa3QW6hRFUrC9IdB/d6gDBgRjv7xu010KVf4UjgeDLcgCqV2G+hO8BX8hjg76kXVGvhNnqVLtfdu2k4XUOK1uvE4ZanzOzbsV4oPeqEHTpF8h6r9rkmYBXBDxe/oAjYdx5w9OETgrOwsSxWgIfyDctElc9IPhi1WSP0Ifo3XmwluOfRzP0lIGKv0vNE8q0FMqjGis3IGEav6mswVOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4l7yU+7qUtVZANv3fjHLriwb09N8+WNxlI480IxN2J8=;
 b=g+8Yn2LJTt5VwLObnsQIhRBtIh8CAyhSY2wxiNrKaAPgqV6J0ooNDVt27wxuvbpeIWepSI+1PkfLk4R21MhqvuUNxYkbiPE9tSurL5k0TqVvDmed6QMO8fovGBWjjZ1IQXpFbbUAzvKF9zqNFvlkvvBdEY6CRumWjkbOZtaUy225PNRm5lJmBp9AWgP37/Jbzx0fu9o0UB3zVORa5ii/EaWyq1tj3uHdMfdVYdIoLdPAsn7BaTUf7JcSpocXQMig2AyjsB5nQU137p+jKAOLGGO99/Mg4N6fIHGVIBsuaydXWZmEdbmFK9EzQzp69SXfGfrEsS9kNwx6DLbrBSHm5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH3PR11MB8495.namprd11.prod.outlook.com (2603:10b6:610:1bd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Fri, 17 May
 2024 04:19:41 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7544.052; Fri, 17 May 2024
 04:19:41 +0000
Date: Fri, 17 May 2024 04:18:39 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Use distinct error code in VM_CREATE for device
 fault mode checks
Message-ID: <Zkban+zI3zKiv0VH@DUT025-TGLU.fm.intel.com>
References: <20240423234707.6587-1-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240423234707.6587-1-brian.welty@intel.com>
X-ClientProxiedBy: SJ0P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::22) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH3PR11MB8495:EE_
X-MS-Office365-Filtering-Correlation-Id: c4edbe96-bbac-4986-fb0f-08dc76288d92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s8Li/cZnt/Ga1R61Ry6C9pQGf8jXEMEpHhwoURCXwz4T7BlmRGuqsGMeyYUJ?=
 =?us-ascii?Q?q7v0u/29J6I5qLqIGRniJvD5qUZY/gL3+dN9z3t2zdLBzv3XkBpsUinajdBo?=
 =?us-ascii?Q?zPo4J/vV1zWajMvo1bjK2JXVuJ2NYFztcRQfrxvFskD3HLhK8/T8at6ttP+e?=
 =?us-ascii?Q?WKSpI8JrQynNri7q5YXWHxf87e08BuKGe4tX69imqDv6qkKQ1B4Va7DkWYav?=
 =?us-ascii?Q?V19C7a/iaqjnOUsrQ2t1Z8yaOXTDeWHNT8UCFSH/AC8M+5OZdXddAjOFughq?=
 =?us-ascii?Q?5ULzcJxt5vEXMcYpDR4fh5/m1lymogQWmjZPRfVpY7FC38SZnYblKyLdoocO?=
 =?us-ascii?Q?y9WHyDG3Mkl7Q4e/fsM6aOoPogLBJGxVBKkO3AZjxMTmGugnyMwTYqtbq+b3?=
 =?us-ascii?Q?dzO2354D9cwsqdD/UR2Mr1LSyw7aYuOyYoDqO8UlHm8yPUSOwZX657fyEL6c?=
 =?us-ascii?Q?+8I25mKFLa2wkBB8J7xdtLM2dQGecBnDyTlrfjQ3ixrn1ka4chYI36NcKZh0?=
 =?us-ascii?Q?fV+gpEb0s945VqSlYj2vkcinwUooX5JaX7j/8gsZiBsTsxCvG0KY6VGqS3xB?=
 =?us-ascii?Q?9sppfD9ns8oJsO4S4VTxyGCgyDrzf0+2c7PbRyMTgwb/J5+Q10kixm4hXm4S?=
 =?us-ascii?Q?1rkied3+jGxmaIJu6qmPGtR+b9BJKxjC9eJyBCTb4MkrGC9ja8qi5DpvTNxn?=
 =?us-ascii?Q?shLcG1KrSFry0Kp7Ib0+vKAX/lUOQVu+WpJQH4LRH3+gXURLI0bsaTogwW4B?=
 =?us-ascii?Q?NTvyRfnttItmuvI9XprSOyToUTZx1KAJEma6PbLoXcqToOKi0/bDKQDr+1kV?=
 =?us-ascii?Q?00qQg/Rolwb0DCIV7qtiOihBshKDTCfk9RH+zEG+wKmtarO2O3x5DX4yhIh2?=
 =?us-ascii?Q?JItP1XtMuBZz+Zk+0WPBbcloPlGg6biVF0nuk2QL9stjSi/rlIk035OetSV8?=
 =?us-ascii?Q?gK89ea6Q+qUHg8IlrweE24F3EvzUZUyMu90OY7eTQdOGNV4+aMuomRs2h1qL?=
 =?us-ascii?Q?KbbC+gwIiqHpgqB6/qEQYEVtkQfAXIuUOT2sFtURkRrBp7T88E2oghR4OEzc?=
 =?us-ascii?Q?vF/gBQkE0bek/vmr0Mix+d8c1bX5/J0YJ9zGzJ1i1qrSdubZ7R9cAkwmQV7B?=
 =?us-ascii?Q?RcPcin8fe4LlcjgbDpdGz1a31jBumZwS13JLJNL85DgpVib9SKcUX5LxbJgE?=
 =?us-ascii?Q?kkV4fokHuGxiP73avB/8CLxfcP30z4BoFzfGvXNJfH+ZVSgAPAfsNlDE2bim?=
 =?us-ascii?Q?xwf6do/VfVAYh5knTBD8sdJmkK1iivGf34YCecx30g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?45oYJ4VR/FwaNm2rSayio42G60q3u5YFUddgSdONl7WdYDUBDharsJ5GTJfk?=
 =?us-ascii?Q?6Tq9wY+5e2ZlROzsPC2NaLcX8IMRRaJ+GqWYjrgZjtqcFmx769nClkG/EQ31?=
 =?us-ascii?Q?NHNcXzuBLS48tglgs0K95xktMReNmX23KLcKx3SNXnkX8omC0uTptOMRT7HK?=
 =?us-ascii?Q?Hn1XsBuPr9eMIhxzbwmQQ6Kg+V/u7Xrq+XmO8+s0dCLin7XmGDRatwNCS/i5?=
 =?us-ascii?Q?cVjE2KLPHdN8KP5hXbCI24bojGCnYjbX0E0tZ7Ito8A1ih7uzBH7rN8vQp2e?=
 =?us-ascii?Q?nRt9j+e6z4MdSUNZO8ZQBgYIH3mMlJYh/2QVH3x8cD+gN0setYDeP/+Hv/HT?=
 =?us-ascii?Q?TQzzvOGRaBifT9UkhYtQn/xkZs/vjJND6BNwSbWDUlIEIMSzm8igq/ENXpRq?=
 =?us-ascii?Q?bunxr1INgs63QxbDKP+IFOuDiCeFMpvvVTbJo3NZyo4VF3zzpNHN2qN3XzCn?=
 =?us-ascii?Q?ccGy/eVECHwPQ7nsaBZstjHBFUSfoORr+XELgrS1rwK57/mBx4+gxysn1qRf?=
 =?us-ascii?Q?Is8j+GdPB06P4HnPi/9j4YDrglFaOBz3NT4eZ9cgADdTs+zAuuXwqhc9qRSU?=
 =?us-ascii?Q?8MMm4ntfRR3HpsILL+oG4PEbp3+FTc+PUKKF3LCu6PdDUCk47m/JJdDbtnGF?=
 =?us-ascii?Q?Qv+XiOQYSKzGoD/HYnJa00R6FWzdrJRpHkB4nyaoJPwUqlCzmUJlZbfDHsg1?=
 =?us-ascii?Q?EeLcb0PCcSR9dA0nIEtbZKqRdE+GtgbudKxz+a/NCaHgKwtv7QMscWdTfim5?=
 =?us-ascii?Q?VIvm761DCLPPbsLghsZwMPMZURuzevhjunBQQ+WxCeCIuChyOOt1h7rHxFYT?=
 =?us-ascii?Q?SNo94cPgbNfvzbzVRs2yRUWH86XFGWWLTnsZ6CYNkbE8074yUxBtfE7ysgQv?=
 =?us-ascii?Q?pqGeqdFErV6nCUHKfZjp6Z0PFUJXAi/U4KKwqoaKnNY+xkGKq/3rsu5G6Ojf?=
 =?us-ascii?Q?Q1cmHAKA+sNXeN1+Tw+GSgGVjVYIX6FOTviBHnHWoqQFBM302d9FHwNZah4u?=
 =?us-ascii?Q?TNTWmzn3Im5k/BPtkCDdSf/sA0wBu9smUpqKTKBDHbSQWH3gvTpd8umJSkuT?=
 =?us-ascii?Q?ct1onebaodGWnxXPO+qN9AEO2rzfRjcA14bmvHai031nTFXdV1MDPUm7U4hu?=
 =?us-ascii?Q?mOOiYgpn0SqVcDI+1aEcoYtuHv2jkkTuGJBaA9fgD0bR6zLQdSR8ese9gahz?=
 =?us-ascii?Q?B/II9yjPDUUeJDAmYFQnQQOc7q+fzkkTdoABZ8YqXAl+Ict4D41g5Yz2RaXC?=
 =?us-ascii?Q?kYSYewMYqK9nkKQzmVTc5nxe9+bUdnEmFlnXJMQXEqBrNUTv2tT+aW85934f?=
 =?us-ascii?Q?A6J2KvNXlfgaqT6/yUYsZVz5PFwte85vNIXlOQyWsc1iNL12OlBm8OgEtGCg?=
 =?us-ascii?Q?SxEHOzLu9troXDXhaa7p5/cpeWKiPNOG8Iz/qe97fS57HPi+O6Tn4VGsDKns?=
 =?us-ascii?Q?2EHUi3EUY8KbFlcq+7IX/AkwWuZKWTnU0P1X7Dj68SFrliO85qFbpw+yMj/+?=
 =?us-ascii?Q?Xt7Vu/DvyIEb3VQzOfJj7mVeQ6pturlyWs1I2a3A8JUrXGEAlMuQgcvJZP0I?=
 =?us-ascii?Q?D6lqB9HHshNSkuG+73OfCwWeHwn/flVBApCG+BOf8YPIWd1aHqgd1h6WM660?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4edbe96-bbac-4986-fb0f-08dc76288d92
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 04:19:41.2327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rsuOqzqoT9EBRv2IzoG/QIfn2NvM3qcxTb+yQaWlMKFq1xtJs2+6zFyYr8MB8VJPWscPCMT3MOFawcCUsJLzIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8495
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

On Tue, Apr 23, 2024 at 04:47:07PM -0700, Brian Welty wrote:
> vm_create_ioctl doesn't allow creating new VM in fault_mode while existing
> VMs are in non-fault mode, and vice-versa.
> This is not necessarily the user doing anything wrong if others are sharing
> the system. Instead of returning -EINVAL which suggests the user provided a
> bad argument, return distinct error code of -EBUSY for this class of errors
> so the user knows they can retry the vm_create when system is idle.
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 85d6f359142d..e8628a982db6 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1840,16 +1840,16 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
>  		return -EINVAL;
>  
> +	if (XE_IOCTL_DBG(xe, args->extensions))
> +		return -EINVAL;
> +
>  	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
>  			 xe_device_in_non_fault_mode(xe)))
> -		return -EINVAL;
> +		return -EBUSY;
>  
>  	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE) &&
>  			 xe_device_in_fault_mode(xe)))
> -		return -EINVAL;
> -
> -	if (XE_IOCTL_DBG(xe, args->extensions))
> -		return -EINVAL;
> +		return -EBUSY;
>  
>  	if (args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE)
>  		flags |= XE_VM_FLAG_SCRATCH_PAGE;
> -- 
> 2.43.0
> 
