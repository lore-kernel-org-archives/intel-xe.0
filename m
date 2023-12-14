Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE41C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 14:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4672410E2F6;
	Thu, 14 Dec 2023 14:17:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5049E10E308
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 14:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702563461; x=1734099461;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=muGw2u/A9PA6WSz3MIT6YHT61tahOHlloQDw00+bs7w=;
 b=mubX4blAica362RiO26RMTgog7RHPXGr3KeeKD6IpUuRp2jRJ0ImHlY+
 kxmIrAenO6O7QsWLiUwugaIfaokq6e/HXSREbOFYBkpDECkXwe2eoJg09
 bCvZEb/H55DhLH463hYjaQFubD1I4fjnme5Vu6gFV8Ph9pYQj8+P0U3rQ
 Af++0VLmbpZRg04VjirG1+2v4ZThr6M6zGLsnU8i77MGNo/6297TAIccd
 PNYinh2qBHyMhzAj3JqA/WEV4Lb6RtmVPOjpOrqp5p6hsUMTfWWulD53L
 PXpEH7nvq5Jhq8CcyreVRe7d84z7K6X//ERTJs+8pDfFSmmSYbAwCyOpa A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1977735"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="1977735"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 06:17:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="750542202"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="750542202"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 06:17:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 06:17:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 06:17:31 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 06:17:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oERhWTI3gbiLM8TJz5ewlRi+Bcst9r1RS1PctEguPzSr0u2WMOaoK4Pw8O/ZaHZlBVNVGoiXkvhulK/HwXtHHyg+pTRtiaff6CFnaXDCGMFxTpXukCunT1GHMLEUrCcIi1toU83rv8+A5fusTFm28JMsoYE4QoYY2Dk8olGUNTmQ2LonQYXNlDaI5Ih3Sr6LYKvXuAJ5ZxeRZ7RfoLI/nmhgwixS4p8+dCUXnRX29+Y4c0LgmkthxYcolP90Y+a+Z6oEeX3cEtLFLpgSOdo/x0UaZRFyS67TRS47MGwlNqoOfir9xvjhwKzyKpQoCJTOi6hgkf4MjWteJY/zhnpzDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LaOr+VKcRLhaccf/IzkVgbTfm+P0TuNvqTw/3oseL4A=;
 b=GQi9EbjgBcDC4NH8c/mxt+woxir2MVhQAAGLr7zErbAKGM/HyE22a6SKAD8qjVbxxKLmd8NOawgNKWtJHumX0phRwWrh3efkSCP8NSuwBfQYOWLBsvsyKXoM1DSlCNMK+wok5Bbs5v/gvloZ1zURolBv7vLqMloqsnAGiKJzXapnKnCOloSp/0dcIYtRDHlgZvMi+dq66yxwEt8WgXgq6wqGUH5wavVFvO083W1mueqdq9MOiKYk/fwr23RR6VtrqBQZJNvQltYV7PuPM+qAp3b+gOzMPJqSzBSOp22DgLdAUooluaNNtcfpJ4Hb0krodI/coWUoUlmuSf9kW366kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 14:17:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 14:17:23 +0000
Date: Thu, 14 Dec 2023 09:17:20 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH v1 01/14] drm/xe/uapi: Add a comment to each struct
Message-ID: <ZXsOcGHOegW3MwEr@intel.com>
References: <20231207135009.7-1-francois.dugast@intel.com>
 <20231207135009.7-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231207135009.7-2-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR13CA0116.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cb9bd40-1edc-49e9-993e-08dbfcaf6446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z0K90+HS33iSh1h+rE6fWQixI7s6nJoEThOjpIgZbM6z1sQlI0Twy90ILRmKSVU8iNWKlhuvDt0C1kNqWINnbqet07wzsAJf6n68TWdO2vlxhZ5/+Pg1vKOeJ81xyfhTar7rufiFcJnk3XKP+KTRskIbASEQQtVoOko5UQgtO/HRd48aq1CjbYLRBD8Gj2mcYgbeTYx4Lkw33PkISNHCuBo43zKbXGHG9we3HW/Ck4bpOJZaSGCW38u03snmKCnifoW676R4+rMd5uWjmC3fTyht68Z80ZaQ4plhnL7GxC6BFf+cKL9uoO0IxwlHY5w2rQZG73ADderimZ9UQdd+pKUy1blkBUa31xwkAgehIa1gbtGoUna42dP/2obRjW0ZwXAJGVvoIWlL5XxD6ZhYtyxiYS0ksluauFLj9noW4YErbv2HekrmD7d7Lm+BQzIARCOYI9ynJy3IokgxQkv6mudm3xnOG5ei5cQdSZS2GjfJa3UoTkao/hkoJ98MMSg1FV9u+107PaJp6qKWaF0X0rh3+gfUl/3WaOIDEmMyFh+CUrA4lWU9oXiE20+EjdtH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(346002)(366004)(39860400002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(5660300002)(2616005)(26005)(83380400001)(6486002)(2906002)(44832011)(478600001)(316002)(37006003)(36756003)(6636002)(41300700001)(66946007)(66476007)(66556008)(6862004)(4326008)(8676002)(6512007)(8936002)(6506007)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z6ZEgJyJt8U0o2t6Z+EmAuXTlosk8yf8K9leJXJWNZpW35ZOFGbz1H0inH+w?=
 =?us-ascii?Q?/WC/7+ArjqVdfeY6Z8PPH0yt8jPJcXnX3L7Cn70w8XmL1U4hMfyDGQKK9DuZ?=
 =?us-ascii?Q?OqXcfQtlGLciDQBCFDB0qL2ai3ZUHruKzgEFW9ozO0wX0XxNk0TqqL7GDmAs?=
 =?us-ascii?Q?iA6oTz5Ueown0Iiqiqa5QrIVz8dMPZbD8z4MbTxxDv7U3dhRpnMl51bzWkxw?=
 =?us-ascii?Q?BBxaf4h76a/+e5mPKZewpY+on9dCOCOUMhoER7xfOT8HzV/td0fNiWQk2eOD?=
 =?us-ascii?Q?aA32DCtBjGKxC2FUsIIPOa0S2bzpv/cHUvlhlkk9ziX+c/aKaloyVNrZcj6G?=
 =?us-ascii?Q?in8+U/3Dphx8uQQfHKiYLUTw/t5DlvTPHheOvSjITuBVN1T/7vTA0XD3caAm?=
 =?us-ascii?Q?QobxD40o1PcEI79cUT+H6hnxoJxOJycBmojmL6+uWgvFnBqKv+4j7ppbVnxK?=
 =?us-ascii?Q?LJWSoGrMhLfMOygFZ1CzsVbFnBVvdtiqasEXCZcAwKXYIb3wH7bwbf9KkCXj?=
 =?us-ascii?Q?GwRHorBS7T1S+G8HR1helj29o1SbU1huj2vnCLuE+hpslA/W932rIXYB91EE?=
 =?us-ascii?Q?d48qSxAH7yYOPpZY+gupm0uTALl3CJYg6AdBsJ8uNDP66G5TwWBd02VnYxF+?=
 =?us-ascii?Q?eeVpmlQwPvsXIYKUaFz/QrpO9Rt5XyL44oVkCX3uHLjuHJUevTBvbXUam2LH?=
 =?us-ascii?Q?1sKBReoEkuXHRTyXgECCpq72N13ZFGZbvGrCU60ZvzvxPKcWnT4RKpk8/y7t?=
 =?us-ascii?Q?ic7fFISMLVA4pHtVPge9VZe1nlGBVuGV3nvWzYGb8Y39b34dCG2Sgo21fh+J?=
 =?us-ascii?Q?sjPTVwLwoQLZ898Mc2FfowbGn9dk2jXticNnfSsuxr2Cdq1Nw4yxCsQ0m5P5?=
 =?us-ascii?Q?wJnVOEMqc6j2hpYRp444ezUtY3TUnUOkNyhSVa8LUOJyr34FhwXMSNejF5mG?=
 =?us-ascii?Q?CU4ip7m7QsPdZpxf8pZpo4S3u/gojLXhyxzUEz4G6fOs1yIiktfKqMgTYMp+?=
 =?us-ascii?Q?5gZ9nt1vly+k1OFH3hehPZSTiPSh7QH9u3OPfdGdUnEsNVlr0tMufUhKm7E2?=
 =?us-ascii?Q?QwqfaNeDkGHkuJSviN3tG8CJt/VprgPDNV1a4WTtxfMmi6/vYn8m1IEjzhzn?=
 =?us-ascii?Q?2S2HahshB4PIPcRrBNMuCC6GUKdTJGHrNE/kJVuh8eZIhaxlDTYlI9A5Ov5j?=
 =?us-ascii?Q?VFKUgmK+o1R8WrxqF008o/xsJWcXO4N+/jjPBqvVP3lsPWI27H0IVr9PP8Bv?=
 =?us-ascii?Q?ztEVhzcENlAPA3DFK7p+ADkOnzLuaW0zshUkwnDF9/eekO1N8x8oOwHXzUyQ?=
 =?us-ascii?Q?M4JW8CLcU6qA8AuAE6z1u0nNpDEEm5r7emQsaj+p3ooHOMQ108iZ9t1d7iP4?=
 =?us-ascii?Q?arLSqsFvc2los9ddgfAJ+CsYJ2sQykshzO9x0jKyDcTv/g3Mx70dDqPZMICB?=
 =?us-ascii?Q?pGuF0dN947ooTmjVEKaYr3F22/Eo9xfl+1sGx4SL19zFZT0/0fbBVCxFjm13?=
 =?us-ascii?Q?Hjl0YBLRVlkU09mtruzhfXTApkV0s7wfS0dgUaY5fux/HP+akQMaG5lTXvKs?=
 =?us-ascii?Q?edv3VPqkB/pOMOY0hoEZPcOrfu37lDJIhtulZrMobpm1imLvuCa7w9RVJ5d8?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb9bd40-1edc-49e9-993e-08dbfcaf6446
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 14:17:23.8985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IjyxEdIpw/0k5fu0EcpVk9jb6rwn26d/O5nl1KI3yZ+6jcoEUIV3p8x2SvCRL9CwvQXLSaeENao+YuxBUxYVqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7733
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 01:49:56PM +0000, Francois Dugast wrote:
> Add a comment to each struct to complete documentation, ensure all
> struct appear in the kernel doc, and bind structs to IOCTLs.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  include/uapi/drm/xe_drm.h | 43 ++++++++++++++++++++++++++++++++++++---
>  1 file changed, 40 insertions(+), 3 deletions(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 0895e4d2a981..be58cd641324 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -466,7 +466,8 @@ struct drm_xe_query_topology_mask {
>  };
>  
>  /**
> - * struct drm_xe_device_query - main structure to query device information
> + * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
> + * structure to query device information
>   *
>   * If size is set to 0, the driver fills it with the required size for the
>   * requested type of data to query. If size is equal to the required size,
> @@ -528,6 +529,10 @@ struct drm_xe_device_query {
>  	__u64 reserved[2];
>  };
>  
> +/**
> + * struct drm_xe_gem_create - Input of &DRM_IOCTL_XE_GEM_CREATE - A structure for
> + * gem creation
> + */
>  struct drm_xe_gem_create {
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
> @@ -606,6 +611,9 @@ struct drm_xe_gem_create {
>  	__u64 reserved[2];
>  };
>  
> +/**
> + * struct drm_xe_gem_mmap_offset - Input of &DRM_IOCTL_XE_GEM_MMAP_OFFSET
> + */
>  struct drm_xe_gem_mmap_offset {
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
> @@ -623,7 +631,9 @@ struct drm_xe_gem_mmap_offset {
>  	__u64 reserved[2];
>  };
>  
> -/** struct drm_xe_ext_set_property - XE set property extension */
> +/**
> + * struct drm_xe_ext_set_property - XE set property extension
> + */
>  struct drm_xe_ext_set_property {
>  	/** @base: base user extension */
>  	struct xe_user_extension base;
> @@ -641,6 +651,9 @@ struct drm_xe_ext_set_property {
>  	__u64 reserved[2];
>  };
>  
> +/**
> + * struct drm_xe_vm_create - Input of &DRM_IOCTL_XE_VM_CREATE
> + */
>  struct drm_xe_vm_create {
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
> @@ -680,6 +693,9 @@ struct drm_xe_vm_create {
>  	__u64 reserved[2];
>  };
>  
> +/**
> + * struct drm_xe_vm_destroy - Input of &DRM_IOCTL_XE_VM_DESTROY
> + */
>  struct drm_xe_vm_destroy {
>  	/** @vm_id: VM ID */
>  	__u32 vm_id;
> @@ -691,6 +707,9 @@ struct drm_xe_vm_destroy {
>  	__u64 reserved[2];
>  };
>  
> +/**
> + * struct drm_xe_vm_bind_op
> + */
>  struct drm_xe_vm_bind_op {
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
> @@ -808,6 +827,9 @@ struct drm_xe_vm_bind_op {
>  	__u64 reserved[3];
>  };
>  
> +/**
> + * struct drm_xe_vm_bind - Input of &DRM_IOCTL_XE_VM_BIND
> + */
>  struct drm_xe_vm_bind {
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
> @@ -866,6 +888,9 @@ struct drm_xe_vm_bind {
>  /* Monitor 64MB contiguous region with 2M sub-granularity */
>  #define DRM_XE_ACC_GRANULARITY_64M 3
>  
> +/**
> + * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
> + */
>  struct drm_xe_exec_queue_create {
>  #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
> @@ -908,6 +933,9 @@ struct drm_xe_exec_queue_create {
>  	__u64 reserved[2];
>  };
>  
> +/**
> + * struct drm_xe_exec_queue_get_property - Input of &DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
> + */
>  struct drm_xe_exec_queue_get_property {
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
> @@ -926,6 +954,9 @@ struct drm_xe_exec_queue_get_property {
>  	__u64 reserved[2];
>  };
>  
> +/**
> + * struct drm_xe_exec_queue_destroy - Input of &DRM_IOCTL_XE_EXEC_QUEUE_DESTROY
> + */
>  struct drm_xe_exec_queue_destroy {
>  	/** @exec_queue_id: Exec queue ID */
>  	__u32 exec_queue_id;
> @@ -937,6 +968,9 @@ struct drm_xe_exec_queue_destroy {
>  	__u64 reserved[2];
>  };
>  
> +/**
> + * struct drm_xe_sync
> + */
>  struct drm_xe_sync {
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
> @@ -971,6 +1005,9 @@ struct drm_xe_sync {
>  	__u64 reserved[2];
>  };
>  
> +/**
> + * struct drm_xe_exec - Input of &DRM_IOCTL_XE_EXEC
> + */
>  struct drm_xe_exec {
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
> @@ -1004,7 +1041,7 @@ struct drm_xe_exec {
>  };
>  
>  /**
> - * struct drm_xe_wait_user_fence - wait user fence
> + * struct drm_xe_wait_user_fence - Input of &DRM_IOCTL_XE_WAIT_USER_FENCE
>   *
>   * Wait on user fence, XE will wake-up on every HW engine interrupt in the
>   * instances list and check if user fence is complete::
> -- 
> 2.34.1
> 
