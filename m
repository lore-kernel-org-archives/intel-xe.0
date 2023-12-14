Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE060C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 14:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BCA10E90D;
	Thu, 14 Dec 2023 14:18:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CFA10E84F
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 14:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702563474; x=1734099474;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9gEVbJSWY8HYfNZT3ALipUWQOOqpp90/6yUEJqd9UPY=;
 b=Ukf+cWn4N1L6SY1B9Bp0USqt1HQmig3FEaYn5+lKxL9Z4Puu0Bg5FSn3
 5l7zy5ZzIsQrJHcI29YP3qM4Q/VVx3y2MF8W3ZvBBs6zV2gAh+6yr10Ro
 spFn/oYXFRRTiVfGIldRcZkPfv9W61mtkhkK2mBH+AHlTuFPHx9dlyQKn
 twb6I77Rlt+3YqC7o04wPFSXF0Oas3l7YSa6FQxlgFgGVk9O5fLHMHFYe
 Y/2MzLTwMlgARhoIvEHqXf8MJMwnq7jL1MiKbNfJ7dz3CYrC2AMhcTWMS
 5XabafzSU18eEFdwsrn8KmkbbnWr2PEKf540Q8AmTpCyi0ebMxpfqngJD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1977789"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="1977789"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 06:17:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="750542424"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="750542424"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 06:17:53 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 06:17:53 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 06:17:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 06:17:52 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 06:17:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YycYgKgZV0+laOSCz0eCoRr40j+3QELq6AEOO+oLsPloK42PgDeQ9KxPsvSCh2t0AizNEteoriWMI8nVwWqPHdrUUlrP8jdYBuodJDODNdk1+RwsSTi+UWuMxYgncUDC7Kh99BQA56vCSLVTXggWSNZiPBq1Iac9xk6MJ8pf9eeKLbHm3qIco21FZxCdOfDTLaHwmE6RS5CErwehSxLvrPFkYvONFakyuaxlCpjXIFUtEe8AgM5F0Ub3yRsIfB/jajwiNWhqMgcNF22Act9rVazSyygJz7Xc/RqJyD5f+CRB9TR8/xdhTNGYHqUOTujkhi/Nr5hWoLR/zCXAgBuofA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OI9T2bqs08voRa5iVCX59MjbBvtwduORnehT8cZDWSc=;
 b=cGaJn9CeOSS9XJr/78GkjsgK+zEPdzVV5zhmQegAZXzqWeyIPMmMrqvPfboUZVkJFSskgq4zgx3pmDTh4m2Coh2UVS7zc6B0dht+Yqx2wXB4o+N0V7TXmtbNjtC2cDBDhAKDidbX4HiBy174KRNgl3i++vBaNO/iaUzv2v1hpQs4hU0oidL9R5MwYr1MxMi2Egy0euMrZ9iua1R0c6eP3nrvdzwL6Ye3UY3hW8izcGa/JAEO/arco/tSPcOt8bw6Zi7PNiNQz7q3dhS+hkqDDvu9oJJ1GEUdlCB7fnIpAu5T1gKAu+1bYs5oWqvdx2x5FKLSbsHIjCl6TrsYBLLPnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.28; Thu, 14 Dec 2023 14:17:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 14:17:45 +0000
Date: Thu, 14 Dec 2023 09:17:42 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH v1 02/14] drm/xe/uapi: Add missing documentation for
 struct members
Message-ID: <ZXsOhuF4uZyL73jh@intel.com>
References: <20231207135009.7-1-francois.dugast@intel.com>
 <20231207135009.7-3-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231207135009.7-3-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR07CA0081.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7904:EE_
X-MS-Office365-Filtering-Correlation-Id: 56e85875-4094-49ea-0204-08dbfcaf70ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jRSKIYCp7lGEUNDhVuHfPW1mJfpIWnonKWX8cggnts+hBgEmxFaPEN/JZpAMZhoZhH1AaFZyZT+fupzoRvqz5PtO8ksDZiKiPEylzdg0bQ/Rn8/3YxicCX+DwyuWQaCobxd2UVJfS3iR3K3OhrPUBSw6tMcCdFQMNhIO4p1AdmX5eurp7QvYHdFWp4SHzsLgkwaY9Lu0XBvJTeukl423i/Mh97zMA1FKABpXsos0UQPqi5CofEwmqTKgegkTccVgRPEeKIa9GKZAJqWouO4J83LDG8WX8O3kiz3NAYf0EqonsRe891dk4MMXJPztK76Ejl5uo2Uwf5QyoObcfZYCPERcFd7FjFEvMvwuXJRq1qQlVe5KHnTMPv1KjepXE2hDsS9PzZJuNI9/yjfOYQvXckrQxFukDsG7D7myI4i/1J5j2Xi8puJFRuYMdR+hu6T2VYzmt50tELpL7RqANC/bzZAFl08kl22MkdY8PNod1eKsJy7FY2eXW4LLPimh1kC/hie1Hbx37LKL9a7hNRZEdBLmc/ITh6jtQ6uHVFvitKPJ42C+JZselvC/tmH8ElHmmCY2t+gZgAiFIKygrsRUAz0kNFCTizqT/ETmXw4Ip/gJ+CK2kwE/OplRC962a+uU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(136003)(376002)(396003)(230173577357003)(230273577357003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(6862004)(8936002)(4326008)(44832011)(5660300002)(2906002)(6486002)(6666004)(6512007)(478600001)(6506007)(8676002)(66556008)(66946007)(66476007)(316002)(6636002)(37006003)(41300700001)(38100700002)(86362001)(36756003)(82960400001)(83380400001)(2616005)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yAzbIWd2fiBHLzFnGVc2Ub7WuLrAdnGTbEzqlliGzd/+XLLqSX4vrn5NSzOo?=
 =?us-ascii?Q?dEdX23BzNJCXj8mj/1uKAnigTbby2z/isEFFBLFany/RskenObQNmH2daTqU?=
 =?us-ascii?Q?xZ3zXv82GInx9S27b4SrQ1zlLeRXmXIgBmD8veu+EWdvu9Gvg8QN3CiIDEwJ?=
 =?us-ascii?Q?M0Xx0LVwquoi+uw9CmiSpIx/NJXPnClYSL7BuaQUUxSJm2qNb0z1dZmj+tkB?=
 =?us-ascii?Q?K0PL2I3jTQDI+fIrei/cUp6WOkKNCqH8oidgT7U34JlmNt/EkOzOkzFwDNSm?=
 =?us-ascii?Q?Ibwj+TYetA+TZ8b7KPgt5a/475LTfI8RBIHd796aANOlXGLUZH3LkcSf9XkS?=
 =?us-ascii?Q?VP1k9s599+I+/YOO4n4bYGyAVoj0OA+5txMNfBH8B6vKGCb61xm0ZXOmi7Tr?=
 =?us-ascii?Q?nr8jyY4odMtnAtrf8opnuDYm+trmV0Bt5V3Xi1wdk7G8POUL9Qaz5uCgauSL?=
 =?us-ascii?Q?1yNY95DoflTsWuGepItqLuhpJ4Pr9GTn5D9/ysE5wU0+XZAwA/OfD3CAh10Z?=
 =?us-ascii?Q?4pEJvhlV/hfYI6lUf/TzYFMB2XF15ZsnwsJyZn9ydV0zDpWZEZDTG8VmN6p1?=
 =?us-ascii?Q?arCLFN5xTDLdnsTnLVvek2kOwPOQdhyVPCvqOdUGGknQ6Gbi3G5/exkukXut?=
 =?us-ascii?Q?o5yY3k/RHUSov2vHM/19wxWCd8Y2oAw/TiXrJJ+9G6d4DOhLa89NzIOJjV3m?=
 =?us-ascii?Q?Md0hvwGWtKU34EEcj6hPQnWoGgs3bPuyDxeilx0KBXHz8MzZMssQiqzdy8ht?=
 =?us-ascii?Q?Zi/Sh5/aWw1HNQHwRBBOVd/pTOO/BaictrrUlltlC5krDjah6YwRGhN7QgfY?=
 =?us-ascii?Q?rG8tAQ65k8aUs54txeHqAReWKyPeehyYVLUeJd/3URrclmycl8p6Ec1B3YyW?=
 =?us-ascii?Q?Z4hpjd4O03KTaNLt0QunjXryg0Fcss4NsS0YQWgS32pICAS4ELmJ6qpWmLAk?=
 =?us-ascii?Q?NissJmrQOcnOSpnnbzThh/Ojh2N1kPKVIFRyd4x7Ukr7RQDyTEgf9YdVPwxx?=
 =?us-ascii?Q?dAOlD/pJo6X9RLr0jam1sV41KFWSymf3IMM6FpaPsTYMhyd5HIOAcTuSynYc?=
 =?us-ascii?Q?ZjEuTNnArLeiaZZIWkT4KpvWc86wB936w8hOF3rmggQByx/YMRoHCERYvMBY?=
 =?us-ascii?Q?GigVXBRo/FPmiy0+HXbOfJvYHSV0QUtzlT7xEs7lQvFsEa72BESYIxvhc+an?=
 =?us-ascii?Q?9R75WUXRu6hZfY4TeL5HakYZkqguGDBZEi9OKOYmgfmWZN5apjEgWvhJ7sph?=
 =?us-ascii?Q?E0ouVmacTdC0qQhdsrtcksr8kbWMWclBziMGyYqTQMdaf+v3kaOxgdWTHg6+?=
 =?us-ascii?Q?j135pySUT1NSvh9TeNtkKeqei5ScyidcxLCJH7WIWt+sibmBGuo12C+TCyqf?=
 =?us-ascii?Q?VhwbtXhKo9wGdy8ci07tep4wwzisOef0zcodk05gxEL3EkwsdjCX/iFcbH0j?=
 =?us-ascii?Q?kGO+AwT2Q5dLdgLKXnQCqLIcZnorL8U7nSnAZMaRJhEWCr4kh/1fGiSJfqqh?=
 =?us-ascii?Q?c09vyFSHsh6Fa2+9kyYchsfBnMCynei08z/4ReSqw+b3z1LF4VwFtE0KjvB3?=
 =?us-ascii?Q?GjYjw0qDb3U++Lvs8oBU2dpOBKrFhM0heX4uPfqUB0W9xDbQHM7oTuUjoXff?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e85875-4094-49ea-0204-08dbfcaf70ea
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 14:17:44.9776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ztSlYLyxWlLIANh5E0KtpxGnBZySQaIMQLGftRzLDjo9zxukUXwA7jzgW6G7ify10bppvnbVUUPFagD5PZJ4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7904
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

On Thu, Dec 07, 2023 at 01:49:57PM +0000, Francois Dugast wrote:
> This removes the documentation build warnings below:
> 
> 	include/uapi/drm/xe_drm.h:828: warning: Function parameter or \
> 	member 'pad2' not described in 'drm_xe_vm_bind_op'
> 	include/uapi/drm/xe_drm.h:875: warning: Function parameter or \
> 	member 'pad2' not described in 'drm_xe_vm_bind'
> 	include/uapi/drm/xe_drm.h:1006: warning: Function parameter or \
> 	member 'handle' not described in 'drm_xe_sync'
> 	include/uapi/drm/xe_drm.h:1006: warning: Function parameter or \
> 	member 'timeline_value' not described in 'drm_xe_sync'
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  include/uapi/drm/xe_drm.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index be58cd641324..d6cd76385e2c 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -820,7 +820,7 @@ struct drm_xe_vm_bind_op {
>  	 */
>  	__u32 prefetch_mem_region_instance;
>  
> -	/** @pad: MBZ */
> +	/** @pad2: MBZ */
>  	__u32 pad2;
>  
>  	/** @reserved: Reserved */
> @@ -861,7 +861,7 @@ struct drm_xe_vm_bind {
>  		__u64 vector_of_binds;
>  	};
>  
> -	/** @pad: MBZ */
> +	/** @pad2: MBZ */
>  	__u32 pad2;
>  
>  	/** @num_syncs: amount of syncs to wait on */
> @@ -986,6 +986,7 @@ struct drm_xe_sync {
>  	__u32 flags;
>  
>  	union {
> +		/** @handle: Handle for the object */
>  		__u32 handle;
>  
>  		/**
> @@ -999,6 +1000,7 @@ struct drm_xe_sync {
>  		__u64 addr;
>  	};
>  
> +	/** @timeline_value: Timeline point of the sync object */
>  	__u64 timeline_value;
>  
>  	/** @reserved: Reserved */
> -- 
> 2.34.1
> 
