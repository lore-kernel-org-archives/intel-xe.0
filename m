Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A48C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 22:12:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261F310E93F;
	Thu,  9 Nov 2023 22:12:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883E610E93E
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 22:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699567920; x=1731103920;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oklPKQcjgucXzspezoGqbCFsGGRex8MKI7xV1qNlJqo=;
 b=LOFw+zARuht0KCHrV94zfT/Asb+AnwVtYdtQ/sbQFC0Sx/wY2lXSmTfz
 mDPiT9GXotOtgp8nzE5ADuKDDoj5F8vEC8Pc8JKn4Iop+BbeV0PF0GNYO
 2AtKYHip8MvKbcugsHkMdZtD7u+VdWtQ7+Bf9271/XdYNITGfKFPiVAyL
 xweiSP1hjmpAWSN6Nwezj26IBk/DbFWQfKHWVbxL972pF42hBezeYUGxO
 W56CFSH93B/hGRrJAAokn7T2qz4xGFEJ8gRy3OwjTQb/xJs+YCNiWCSuK
 EJITGe5WBVBIApaPeZ5V1bHc31QD6+KtoyRaqFkxK/CQW1kPrqs9sbres w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="392956886"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="392956886"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 14:11:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="763560453"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="763560453"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 14:11:59 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 14:11:58 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 14:11:57 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 14:11:57 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 14:11:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AD3JFiLwd0RfIJ0YNZhF846lqT6XEsXipt56hvWqfS5YY73VZNsUmGoaUd1FwKZ6tCoDOzNBkL0CJlgA5wRpNVmmhA5mAKUYLfYwvSNPNcethSONG4UOrbHRweESYPXATZZE2O4bGmCwuT633FGxb8pPPskAcsel5j8OWU837IcaQWIECgGhLwjPYcoo3uf4wtnGUeJd7mudI4b9vPrGcy37b7E5Diva6PP8a/YGQqnZfnuQc26+f0SyXvPWgiNLYxeDNX8bKTsrMERAhsTTJbu2Qb4KuKVU+sfo/pdDexQ7qbo4InuwMNOX62Nt5dSmPFSuFPohh+7Nq4BS3o8zbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/A1U+G5VPzaLynfmWvEYREejBKFr3pm6lTCMLsE8LcM=;
 b=iVrwftnaXsoBa+2G4Z+DIhxRP79W8E9V12Pfg2eUOc64rGBQoVRuan/fx5AB4QWIjaVXFH3T5HG6RNFtMYqLpy4G1sqSYqDNR6qdyLXGLaFFyqKBwHbc0X54esFOMvjxxJCAxay6JdXnBcQxdlDnFLdoT0Dn9HgT9RQurK8nGFSDmQsQMfeW4avgdVfAcRegzS0xrFX13CsBokUH+ELEQHApqrlPKhG8zK8mIiw0WQIMe5FWMeRbyVZeur6fOFkT+4VETqZV1eioG1WoipFqR4uVoLAK83hgtBwjeKq8IJLFovLjwTn2WzCTdcMoo9hje5c6FXdil8fM+oju7FN8HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4935.namprd11.prod.outlook.com (2603:10b6:510:35::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Thu, 9 Nov
 2023 22:11:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6954.028; Thu, 9 Nov 2023
 22:11:50 +0000
Date: Thu, 9 Nov 2023 15:10:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZUz2gQKl0SC7IluC@DUT025-TGLU.fm.intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
 <20231109154457.7-28-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231109154457.7-28-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR13CA0131.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4935:EE_
X-MS-Office365-Filtering-Correlation-Id: 87bdfb0f-faee-4881-9fbf-08dbe170df2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0nknNOmPcv5LLNwn6im/nzwxMHOut3yKTs2fgusCIht+QCZT5o/iq/zmdHLmbhjrRGYQn0g3iY+FPcMdjd0oXHRHVofVnH4OkTpd6ZUwY7egPeL32ZYKkVpA01ITdppxG1aXLBZc+jzwhs9UWbUWWb3/UbXJYghrkzXPsoCQ8tKuCTua21Us89yZ4Axk0MLF4srqP3GBRsdVJiy0D8m59bKHOxN60ybFADBVZU3JkalMDGfIpsuJHW5fc16erUM0R+7fSXRubzbNVB4jCBBCEO/O9oC304NZV/UiN4TN1KR9QNqHUkIx0tNFqgKZp3hUcKmLntDRwjCUm6luVGBNDt/7cXRl29/UivpUYln/fVlramiv/oiauSLOA4qhQLg+9b/XWDnudIsgK3Jw0ksyYPNT9elwYjgD3XWqu1hOQcJ0AQkmhFuitF4ReXSvdyuqazSeHUR8XeYJW9MOk+Z+m50BH9v7rCbWZrVKS2MR+KRxGJdiy0eDvILhbYas4V6Qz13/mtV3VllZKmvZkpPbqKKqovnezb08Tmvh0qKJP2MSUgg7NEnJ873Lfc8iSzUO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(39860400002)(346002)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(8936002)(26005)(2906002)(38100700002)(86362001)(83380400001)(82960400001)(5660300002)(6486002)(6512007)(44832011)(6506007)(41300700001)(478600001)(66476007)(66556008)(66946007)(8676002)(4326008)(107886003)(316002)(6862004)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UJf2xSKsRy+MNSmsCgQ2xTwIl3pThx47YJZIbJyuCe2PBNVA7RI5mWVBxIp4?=
 =?us-ascii?Q?gXIFmjjIYXbePb18Eww/qF7gTY7YduOy4pmqpap7mWGd9lsF19jYiPAakXeb?=
 =?us-ascii?Q?j8qtOhoq9Lj+bfjKXjyrwgi6f+SsI3TDJKhERpWSCZaHs5IscGzVH5kfPV8e?=
 =?us-ascii?Q?q6OAsaJlKES7QqCdTIVRARAW9JAMFOuh2TVd7+NOQbicoT9lBnFy5viQfz3w?=
 =?us-ascii?Q?wHGgDBET9m9bfOhe0xE7+2QW0MebWRAxSmX5A42WotF0s4yAi5/lY8EAohTA?=
 =?us-ascii?Q?RlqQrzU1cJhF4yiUjJfzJdvXj35pcz8+hIJrV/InJBP/lmjgyONqaLNRIKqA?=
 =?us-ascii?Q?WE0sF9q+fxzwLPxXedjuiY+UMiP+ZKI8E/cV9bUSEhC+aJkegyJr1B6lT06P?=
 =?us-ascii?Q?HuugC9sYynidxe1xaL6LG/Cxw9bsWz7kOttKi3UnjzB3ofD8tabPca/9ndby?=
 =?us-ascii?Q?lqc+f0SMdlQQARFu2FHvFGIkT3XB8NIpMiB4WY9bBEhTRRxAhSs4ItANVCX1?=
 =?us-ascii?Q?QD6lUGE4U4gLO3XtQRCH/A/+x7OD4TVdycNy0vj7Sc8izrOx3MFHgjfEYOyB?=
 =?us-ascii?Q?KM8V7nU16eigsKZkCjUzuDEZsC2rzbBEv60PY82YU687fcveWGQ2BOCezRzk?=
 =?us-ascii?Q?XSYD5ylj79N0CXz7deNK7Bai9qGxFKoGDfgY/61Tc1s8iUh3Z+lqfLYTOLOu?=
 =?us-ascii?Q?6zUoy2fmxyM1MVTlS296COD0iI6JuISjs9qYRhNdivWQgcYie8GvZHsu1Whb?=
 =?us-ascii?Q?bPxdWZSgr31f8hqsNNXF7bs2KY+lOgBffTeN6cIoqZeb99co7VBwTsVpIbCn?=
 =?us-ascii?Q?6zr2NHX7XiorFRTp4zV84Qx8KqvTyxyNpGmiGKT54xdkikPMe7GClNw8rz25?=
 =?us-ascii?Q?+ZClICs3faiHfAijO1lLqN0Q9dgki1fy4mHnkvX7Yf3AGJjGgwzNZnEEhbTd?=
 =?us-ascii?Q?tTSWZTpbqvPUuYvukjMkuFm7yntXpIKS2PwwLlrnC2GTyWcaH/MU2x4zjly1?=
 =?us-ascii?Q?ra77zQ/ptC4sfuQsoMTywzHXZ5Ma+SJLgMhYMQ6JA3rhKwFsir2PZTMnv+3O?=
 =?us-ascii?Q?VTR5p4/+x7wmIDvXkoive5rX9jAwTG/zEoVmddR6N1fVy0xxlZLNThc0plT/?=
 =?us-ascii?Q?+PfDiUY6nU+daq6koZxBqsAXc7vm14sPbn1sqeBfKma9ol+2RaQGDMK0j02W?=
 =?us-ascii?Q?stQcdnGe+5iyL11eFITacZQrptV75ANRaXVYbQqxd/DxlMYnZIrb914j1NnH?=
 =?us-ascii?Q?gIFw3zkXWn2GHerx2tM5mQZQPb0fo+nfv+nH2VomDiH0LrxY2tKKUB1v8jNh?=
 =?us-ascii?Q?R4s1c4BVL0jg3f/jXNVUTcBYAxOGucaTBJYqCrK2mSJOC6rcfXia5e4n1Wk7?=
 =?us-ascii?Q?Gw6fzDUwvl5G5FrlzQ5QdLfN6fv4oAxhTfBJzrZjVcXOM/Pu7tYq3U1A/RQa?=
 =?us-ascii?Q?wEzdusXekukMTRJ0R5J9IlxAs5SS0N7NArFywkVF0ZYE5aC4jeljoBam6I8D?=
 =?us-ascii?Q?ya7Tviyhb2z1MTFNSu0wOb6uFFJjNmdOJzyBiVNMKAwctzLC2yduLxTvKLp7?=
 =?us-ascii?Q?6qtIvd+cIslW98XYSA5rGQjVN++zLr0llmUHRJT8A9tHzHXQGnsZqDN9o51O?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87bdfb0f-faee-4881-9fbf-08dbe170df2e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 22:11:50.1181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMAFUCO2RnCboBgZTkKzvbG+uJuaGa/U4j+BDY+oWrok4GK2eFnkFA2zNsKOQjNd9sx2qLT3cPRPG46/++aLWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4935
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 27/43] drm/xe/uapi: Standardize the FLAG
 naming and assignment
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 09, 2023 at 03:44:41PM +0000, Francois Dugast wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Only cosmetic things. No functional change on this patch.
> Define every flag with (1 << n) and use singular FLAG name.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_query.c |  2 +-
>  include/uapi/drm/xe_drm.h     | 20 ++++++++++----------
>  2 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index bc2b4609a38d..71a4943cab20 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -333,7 +333,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  		xe->info.devid | (xe->info.revid << 16);
>  	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
>  		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
> -			DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM;
> +			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
>  	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
>  		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>  	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 0c004b24f820..5217558a32d0 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -354,7 +354,7 @@ struct drm_xe_query_mem_regions {
>   *  - %DRM_XE_QUERY_CONFIG_FLAGS - Flags describing the device
>   *    configuration, see list below
>   *
> - *    - %DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM - Flag is set if the device
> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>   *      has usable VRAM
>   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>   *    required by this device, typically SZ_4K or SZ_64K
> @@ -371,7 +371,7 @@ struct drm_xe_query_config {
>  
>  #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID		0
>  #define DRM_XE_QUERY_CONFIG_FLAGS			1
> -	#define DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM	(0x1 << 0)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
>  	/*
>  	 * DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - This returns the
>  	 * maximum value of the &min_page_size across all memory regions
> @@ -755,10 +755,10 @@ struct drm_xe_vm_create {
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> -#define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(0x1 << 0)
> -#define DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE	(0x1 << 1)
> -#define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(0x1 << 2)
> -#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(0x1 << 3)
> +#define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 << 0)
> +#define DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE	(1 << 1)
> +#define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(1 << 2)
> +#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 3)
>  	/** @flags: Flags */
>  	__u32 flags;
>  
> @@ -852,10 +852,10 @@ struct drm_xe_vm_bind_op {
>  	/** @op: Bind operation to perform */
>  	__u32 op;
>  
> -#define DRM_XE_VM_BIND_FLAG_READONLY	(0x1 << 0)
> -#define DRM_XE_VM_BIND_FLAG_ASYNC	(0x1 << 1)
> -#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 2)
> -#define DRM_XE_VM_BIND_FLAG_NULL	(0x1 << 3)
> +#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
> +#define DRM_XE_VM_BIND_FLAG_ASYNC	(1 << 1)
> +#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 2)
> +#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 3)
>  	/** @flags: Bind flags */
>  	__u32 flags;
>  
> -- 
> 2.34.1
> 
