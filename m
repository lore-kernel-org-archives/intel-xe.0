Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC70DC001DE
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 20:26:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFCA10E080;
	Thu, 13 Jul 2023 20:26:54 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E8B10E080
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 20:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689280011; x=1720816011;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oqxmHLEDHBvMWPPXsMeAXSA6Kgnn6RAzuqHOylVSU9c=;
 b=mC/y+7lSFDmAlESWNrRru2Xg9oMih8j5Ea+abggDtcAOIsoaCLbJ0GfS
 8pfQLAZz+hoASFZuO0zixn6VkyVZ2qQMHQjcnS0FMtmuda3KVhs8xggsb
 8xoMGBWUiGOrmda+YJB6PmjiXXAbvrNe1VE96pOAKJSJ8Rn3ieFVebqEP
 SKD3Ic2NGuOD5/ef6C0UAGIS3TMtMO/cAJs6kgOgf2yR0/tFe3/ToLA+c
 cxhofoy2CMFsbf75E1RRXBUqLXW4LL5VwdZkXTk4ukbf9f9df21I/7/pS
 DdqkUAem5UG+MeDZeHYJOx6qJU2aZsrmO1r98WWgQmdCU0MiRpJYG9bPW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="396114345"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="396114345"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 13:26:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="812158764"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="812158764"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Jul 2023 13:26:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 13:26:34 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 13:26:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 13:26:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 13 Jul 2023 13:26:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qqn5FK0X6DL2yiCrYl2jmK/s3PQAWr94ifKAn6ura+9KQifqbzDJOWKw73rU2pkBGiuJh/Vg+sHDDBqTu41y7tDvYW5CdLviPvLqwPzwCzO49BRake7SZ9NXfXlV2otVr1anoeunHlKFW3Jld7sa/wgYGnu7gKVOFt3MdekrrUu75M8UyDelBL9f1MKR10OtE/9E1AuwGB1931+VuEuURZMPdekH9QLSzYMsWL5QyejVTXI1h39zfmqi7LmFr67B5iCGlNrgUP+oxZxqrCeNmhRy6Qpm6hZ1bw6yH9V1MQksJKQabJsibVLJtM+YFbz1DdqPxa5lkkxGYOFwLXlkjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmRSOvaoN6rfRVCzlNzR1seFmcbnkfqBmicp58N604c=;
 b=lQ65/8/ZHDLNpNLyKQMii3DzBbVqs/g/ur3XLOUWg7EqPzcPdaLQaUxE2fGuX4dpEZzXsqrr7YaPbzUu5DzJgvplzhJuT7UbO8vAjoB7oDyRyvwpYHAxGt6/6lL1+UgveKeJA4s4uQrAU6TQMNzDCyqMFTe2uW2khLHvAIP+36mEncu4/uZun0ZVNw3ps84xFccSvN42EfM6IazGthcQQKybYI0rbV3pTSvZ956WfM17lj+ZmgromRyGQYpnFwvGJISrQfYwyBS5NdNRwwDtW961G3Hn4jVhzeQQF13X8u2Vgmo6P/s5qY8g1q9zL65o4G5125W8sgZgOgK07p7d8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA2PR11MB4777.namprd11.prod.outlook.com (2603:10b6:806:115::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Thu, 13 Jul
 2023 20:26:31 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227%5]) with mapi id 15.20.6544.024; Thu, 13 Jul 2023
 20:26:31 +0000
Date: Thu, 13 Jul 2023 16:26:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZLBd88JCZQ1rXD3k@intel.com>
References: <20230711212748.2029455-1-matthew.brost@intel.com>
 <20230711212748.2029455-6-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230711212748.2029455-6-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR21CA0026.namprd21.prod.outlook.com
 (2603:10b6:a03:114::36) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA2PR11MB4777:EE_
X-MS-Office365-Filtering-Correlation-Id: c81bad19-ac67-4ea5-0216-08db83df716c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ljk4nCytkBJtK6w7XRCN7umcEiuteWZ0BF9KZRVmysZNjssZkW0QJ8wofYCncmbTIoZorSBHLrMEMAtA97gI2T1wYh77Ig2suWLw8LsqVudgAmCx+KjrkPSzH5zDxcfwTzOM3XAzLtgencZzrIpWkxMdjT5d7tZyi1t8sz5fu81puocFrGisaGDGD12x31ssnuvExDNaXts2umF/e+V5lO5UsrF1SCG7pfcp4sF6XfTFeBp1sRjd9Qdqda8L0c4xqb87AV9EQpR1RckcEcIxDWbKyxOG1OfFS4DMpHcr44ZmwuBWzy2EAcXREgV2338C9heomoJuRpP87LhMMUc+9fy0osztrVI/8/0m0+6lSyPQ4U+nqdqDM6FCIINzr5Nhmdjf1kcBVIrmM703q0c5Bev8JcyGGGkYk0krsswRPZnTu23/K7aXPRFe3tNEoJDa9lvLC7SABPDuOxdyAK4nrE/kYC4wQmy7myBpJu7+rBSnbwcQqAzEsRWx2mc7E2F31LS3vPE7M2uq6GjpLT5yqhd1QbPdrC53BO5gYYoeX6w1DEqAuoCa+mtgjBwY/zp5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(376002)(396003)(366004)(346002)(451199021)(6666004)(6486002)(478600001)(37006003)(6862004)(83380400001)(36756003)(86362001)(2616005)(2906002)(6512007)(26005)(6506007)(186003)(66946007)(316002)(41300700001)(8936002)(8676002)(38100700002)(5660300002)(6636002)(66556008)(82960400001)(66476007)(44832011)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fifAM5mjudSto0wLT4DDoEWrbxZgMiKneIwfAQjnH8wTsnjKFVxFmzPM+NOo?=
 =?us-ascii?Q?SMHA8WPgcJ83Yu7hb8HjhjjRZAE8hytF84EfBG4kx02tsenta3x5XazM3GqO?=
 =?us-ascii?Q?WZhlYUcqdCMfgM9ZIpY1SVgCUoDTPNnTP/y98g21SQ616r/I+aNan85wS3px?=
 =?us-ascii?Q?75Ji9E4TIYZ9YAMptmUhkU+otrqtp6Hty/ZhRD4FGLXrqr4G3VDrYrpJVp3L?=
 =?us-ascii?Q?870eG5u5CvlnRK0zS6kqAgpXHHDHrhuvj0s4fnpTSf+auQJa5hSr0C4Cd9N1?=
 =?us-ascii?Q?w+8LuXz+/LpgIXSGLPy+AeJUSUtwgcAA5BwbXPRENnvJZrYxwRexz5ccNzVV?=
 =?us-ascii?Q?4fTXkWm3kKF7fSueCy5BUlyj5SRjX/ZZh5+9/Uwt7y6b5p+X33tcW56hgSG6?=
 =?us-ascii?Q?NOO2G1NxB5/gYzZci9wfcFHb9IzJfZzVWBwXPCNqlVhLGuVB6BEL770aH18m?=
 =?us-ascii?Q?AUsvTFEi/wPEXDXDdIQ8ZHEyyP1tI/tOHTVnahenn8OMo6GqGtC/lu90Gf0c?=
 =?us-ascii?Q?xPuswK1PjmzGiAg3ORbEtUmfBILM7TMwBGdCDaH76fKRRKQxu1VNOHZOmPDz?=
 =?us-ascii?Q?ICpb+zzRoW/t1Wl6PEl7p2lkT5+3FhnKSZUQPzgOYvVLUORyR5ymg9zmTETV?=
 =?us-ascii?Q?atHJag+HhQelf1XibythQvSiQ924oJgmRixBpUF7cncHgQaIJ2dp0IYLV2CB?=
 =?us-ascii?Q?Q9OoWmpL3cd7lc1Pn04Q81vQDZpcISUnpVIi7mLLmwW0TPN9c5KiOSTMP6qZ?=
 =?us-ascii?Q?tzqjtHzvgKPY0wfRK2H4QFVZnvC99P8TfSMf5CehgmJgwytlaWD1gPIyGSR5?=
 =?us-ascii?Q?rmO2gtH0kwea6HS3/W41EOizAuc3VV11gU6b8dJp3hNqf3TPJ4lQoZjm9ru0?=
 =?us-ascii?Q?DSU8ff9ojyQ2cy+XlLICYzK4lKdnngw3LFkvJbt+A9Ew9zE2gzaJ1YJbJbty?=
 =?us-ascii?Q?EPHFy5oVxa7xXHx4Yv/S//2S0DoJtpeqmWo+bgEflfiFQ2UPGFu5Is+16mE3?=
 =?us-ascii?Q?GHgK9wqY+F2EpruOhyQ+XuXA/lb8Hg8tf3JmyOCcoWORUYwGU6m3+YvSdAep?=
 =?us-ascii?Q?0Eeei6WAz3/QXPrO0q/UqvGEhA3ymKP/nNTIfB8RfsO1sFJnRRGlxcejRqH5?=
 =?us-ascii?Q?kJ6h/FLmvT0TSF7ECww3vzkRnnL5y2G4Et9RXDt8ocJYjkf5Ndw5wuA6/IGH?=
 =?us-ascii?Q?UFjGveuClx+zPIKnbZvqq1xHdbXKGPs9V/B6jdN3saW62Gql4xYi4Uu2HHws?=
 =?us-ascii?Q?71Sobjj1VtGYIx1yQb6CCD7+Hx7u8SfmiyXMrlyy5cN0bMb5RzhXkoV12OZT?=
 =?us-ascii?Q?vjq4JP7aB61ceqlW3Vtx8/XW6DyGsjHhQdHBmXIyhAxBeiUFSsgWONFl+y55?=
 =?us-ascii?Q?eLwyqQg5mnj7VCf93XHEFBuY3/gSwj8gmBpdreHw/NjdYrGMl7VT3CCM89og?=
 =?us-ascii?Q?HS/X0AtnYy4RGUbLBgI2JG1Uxc6eFsl/ITuLy5RWU5UriaB7fTFBElDOdFf4?=
 =?us-ascii?Q?+S9uLR7gAnoZWTBaVCOGTmWqerfl5GwEzmUWhTYfDWjDK6ZJ9xvJIhGju6t+?=
 =?us-ascii?Q?/SYdo92enZGzAiePDI3VZOxaJiT91NBQiBk91twEDIxsVTIXkBHjK2d3cj+s?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c81bad19-ac67-4ea5-0216-08db83df716c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 20:26:30.9778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z3xUocwJZwV5dm8qC9eplqHIiuuK8n0IpjCKflKbi1eKfKvAPv7NKCPO6uUJlp4VWmZ99SufSGNoyNPhVZrEMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4777
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/5] drm/xe: Only alloc userptr part of
 xe_vma for userptrs
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

On Tue, Jul 11, 2023 at 02:27:48PM -0700, Matthew Brost wrote:

probably worth to repeat the commit subject here in the commit
msg.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> This will save on space in common BO case.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c       |  6 +++-
>  drivers/gpu/drm/xe/xe_vm_types.h | 56 ++++++++++++++++++--------------
>  2 files changed, 36 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 762aefa75ed4..d1fdc9974f3c 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -880,7 +880,11 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  	XE_BUG_ON(start >= end);
>  	XE_BUG_ON(end >= vm->size);
>  
> -	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
> +	if (!bo && !is_null)	/* userptr */
> +		vma = kzalloc(sizeof(*vma), GFP_KERNEL);
> +	else
> +		vma = kzalloc(sizeof(*vma) - sizeof(struct xe_userptr),
> +			      GFP_KERNEL);
>  	if (!vma) {
>  		vma = ERR_PTR(-ENOMEM);
>  		return vma;
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 30beae541aca..80fb0b22bf0e 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -33,6 +33,31 @@ struct xe_vm;
>  #define XE_VMA_PTE_2M		(DRM_GPUVA_USERBITS << 6)
>  #define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 7)
>  
> +/** struct xe_userptr - User pointer */
> +struct xe_userptr {
> +	/** @invalidate_link: Link for the vm::userptr.invalidated list */
> +	struct list_head invalidate_link;
> +	/**
> +	 * @notifier: MMU notifier for user pointer (invalidation call back)
> +	 */
> +	struct mmu_interval_notifier notifier;
> +	/** @sgt: storage for a scatter gather table */
> +	struct sg_table sgt;
> +	/** @sg: allocated scatter gather table */
> +	struct sg_table *sg;
> +	/** @notifier_seq: notifier sequence number */
> +	unsigned long notifier_seq;
> +	/**
> +	 * @initial_bind: user pointer has been bound at least once.
> +	 * write: vm->userptr.notifier_lock in read mode and vm->resv held.
> +	 * read: vm->userptr.notifier_lock in write mode or vm->resv held.
> +	 */
> +	bool initial_bind;
> +#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> +	u32 divisor;
> +#endif
> +};
> +
>  struct xe_vma {
>  	/** @gpuva: Base GPUVA object */
>  	struct drm_gpuva gpuva;
> @@ -58,31 +83,6 @@ struct xe_vma {
>  		struct work_struct destroy_work;
>  	};
>  
> -	/** @userptr: user pointer state */
> -	struct {
> -		/** @invalidate_link: Link for the vm::userptr.invalidated list */
> -		struct list_head invalidate_link;
> -		/**
> -		 * @notifier: MMU notifier for user pointer (invalidation call back)
> -		 */
> -		struct mmu_interval_notifier notifier;
> -		/** @sgt: storage for a scatter gather table */
> -		struct sg_table sgt;
> -		/** @sg: allocated scatter gather table */
> -		struct sg_table *sg;
> -		/** @notifier_seq: notifier sequence number */
> -		unsigned long notifier_seq;
> -		/**
> -		 * @initial_bind: user pointer has been bound at least once.
> -		 * write: vm->userptr.notifier_lock in read mode and vm->resv held.
> -		 * read: vm->userptr.notifier_lock in write mode or vm->resv held.
> -		 */
> -		bool initial_bind;
> -#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> -		u32 divisor;
> -#endif
> -	} userptr;
> -
>  	/** @usm: unified shared memory state */
>  	struct {
>  		/** @tile_invalidated: VMA has been invalidated */
> @@ -112,6 +112,12 @@ struct xe_vma {
>  		 */
>  		struct list_head link;
>  	} extobj;
> +
> +	/**
> +	 * @userptr: user pointer state, only allocated for VMAs that are
> +	 * user pointers
> +	 */
> +	struct xe_userptr userptr;
>  };
>  
>  struct xe_device;
> -- 
> 2.34.1
> 
