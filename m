Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36ABF364B6
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 21:10:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8735510E06F;
	Thu,  9 Apr 2026 21:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PJXnh80e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D341610E87B
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 21:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775769046; x=1807305046;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sr23XwCdVNISK1J/n4+D0er5r7V0QXFzo3qpAaYGbP8=;
 b=PJXnh80eqiG4d18XLbZa7iWwLET0KO/SWTMIaa9je/DEvqRHdoiDlizw
 AIHcfihL1jTbrZjFVhhDTwUMsk7kKi7oKGkYpH+Nbh7hdE+MypRMPqLgR
 z4cWiVDiGdAl8gQlCRHnGyLhA43Ee98AnSfhiYPWKoS70FDvWdtTpaniY
 eP6t4PjZQRcPDjdwN6z/T7g1CTug77Rg7ZUx9odQ3ETOqunACAFp563p8
 rriccO6M6H0DoE+ieyeEGu72Qz7jE53UEuO4TglWkGB1jVOH/Vk3AoCoL
 EWQIvtEnN8vuW9vJ1w8L6IKR+p6AJVaTc36PQpZn/QYB4t7sNDc38iXhC A==;
X-CSE-ConnectionGUID: kPuEs/jDSgCe2RLaE70B+g==
X-CSE-MsgGUID: cFWoEbmwTiyNK695zlxKLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76503512"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="76503512"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 14:10:45 -0700
X-CSE-ConnectionGUID: h6vLW9ZFQ56X13QRNkeukg==
X-CSE-MsgGUID: qjv2JP74SdWAj+HxgryUhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="228780648"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 14:10:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 14:10:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 14:10:44 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.23)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 14:10:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XP6n9qdPxsTHnWwHtQYAVcQTnlVDCD/QGgs1exd1Irs3J7SIgD65Zgxk9HSMEiwytiF7XGg7zcYMvDH71ZpT/pieZU8S3uApx8Qx82amt7BlmmaXrW6RL/FgIS2v5ai+zr8qsrs6Sd0RFsYdP0kbUT3f3tMBCX1b4xAB/VfzGcEQ+8FjcoVtTEl4Iy6N9SkcrsOyERpnslu7ZJfEZ2OSahxSVnh78JMHAj7YPSaCLjPcmqO9gYswN8OOj2Srqb0OIq0QNMgdtF0L+r4YlawMJKeQZJ2KEMJJf3GNTXUUAiTIIDCMSz12tmFhVMANlgCNmI7Ry2Lp/69CCO5pefBWEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rhToJQlE4lSSUZF86irQL/cB9ptqLKoXEPh/reBaOw=;
 b=A491KztvTmgLusT9HNba22RpOS8WjF9zLEkxDNoOh6YlS32Ra9AfulzckOUV6zTYRDxaiMGHHoHu3QlSBKx89VChbIZEu4NNYCutWiE7mcWNxWqbi8635fHzvfPYoLcHQiNkHqY4xU+mfOuSLyOhwLBR2duArpvIZ+y5x31hw7oSQVcVpVP3tfs5Qd8eKO9z6kNqhq6GY2ikfK+sIkGvCIQc35GUVY5mfIsjFophXa6TbdM6VGnb/wzWNj4gZv8eSt3kCRnrY7CSJC/II8O3jvOMqKqWtoku/ZQ82S6ePSnUATfdyj8ruP4N2LGReGUjxTVzI8l2qrXZDVOSSMKb3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ5PPF1EED2E381.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::817) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 9 Apr
 2026 21:10:41 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 21:10:41 +0000
Date: Thu, 9 Apr 2026 14:10:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 2/5] drm/xe/multi_queue: Add helpers to access CS QUEUE
 TIMESTAMP from lrc
Message-ID: <adgVzli5OrA737OY@gsse-cloud1.jf.intel.com>
References: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
 <20260409203714.1887402-9-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260409203714.1887402-9-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::19) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ5PPF1EED2E381:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c8ee639-89d6-4db4-dbe9-08de967c74e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: xxq9FexcbbutI1l6a4b/JKDSLj3jhuHvNa4vyjbWXKyieEQ1qVxf4YptD3I3lW2yvwmNQC6EZBK/aE3Ob2OxmkcVIiXADEcbqMSn/R+DJXCi8WtV1Yxj13mXGR1mK5T/QMQtu3D3T8k6hd+NRsLvsjIdnwRdpN83bx80DXTsGicLBe/PLtamGbeFR1nhnXhZymhZfg9BftOru+AFOJINpNf3GuAvrC2uobIPePaKKyJNYoQa2FD6MuyN3V4msTBqTgSMk3NRrdXhLeISVJqHHFGA2c7XEXsUfS9iEyfdpYBsyGmOn1vhroGoPdnlCm2FM66PV6xYfZMc7uPdUR/8NbtySR4BDpqkAJN78oTo6F/XMLbA4GFqOdAFwKTY0H0jplOryiOPAvfggISRKZDho/zBL1GtkPfyECR9eNxh7ilKiBlyfDTK+RVX3CkydrZM8MWO6GMTRzvnX9UljNUH5GPR7hKo6ceHhGLHutFD3jUP6c//d/UDcZXw29VTYctaM9nwW05igktnt7M9ij2zwg1dNVpJIrcavFTK9eGcTmwcCbgcRzWxwXL45+6J7kN22XTK+m4+itvt/g+x8ygjRrYghYT44zhWnNhRhisfN4I7ndlRathxfskWM3j9YxsvddP/C2xq2QEaOYrEms0YODpPs/IMLXBnR1kNrSThEL++Uh4nKzAp15JcJDHXWus+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3c0wsQiQWVgSRdcfy/S1HM+xssITh0/gLhsj/lXi0vytVznDTSEnd2BH5/yo?=
 =?us-ascii?Q?N1iFxbH+8tpVhLOSpHgGV86fj12vxKpSlRYWRRO3LFZzPjCKRxLRu9F72wSy?=
 =?us-ascii?Q?Vttt54vNzixtI1bQvJcHN9QTG1D0mfBzqH4/9Y3SrGwWaYz70cAY06vc+MPp?=
 =?us-ascii?Q?GE2176+ddj/UiD/6t6R6qTyxrQZw0SUtkv0VdNtk0+M9UkUSzIFvYvF3ZiR0?=
 =?us-ascii?Q?iozP0hrIgAFpQIJ9ZdMs0gna4vLox9gdJAsxzmvJFgTlHX1PqfYSsy6g5bCL?=
 =?us-ascii?Q?i81feXcv2r2TOwOcurXOVn3GC9Brp/VdS6WE654YBoNmt38z/C/w/kKsKwOi?=
 =?us-ascii?Q?b93UT3mu3wxpjSo/L6iMouODcdu4gCWw0MQ+vGSNj+kBQwXXaf6hEniW3Zvm?=
 =?us-ascii?Q?846RuvBqScimn1oVmQaaEwZQ+WlqTOg27dg4VvYSrvWLmWxjz/L1yKjEPMdq?=
 =?us-ascii?Q?YcQA1SopFrdPnfsvWg2MB+qjrMn5cdkMuxwFyvDligKr1ton+HAsi01UJzYk?=
 =?us-ascii?Q?sA7ZKXeamqcX8psdwgSJ2b9RxBcLsTM2rKwM7+cOlibk7xExbLCF8iZNa41j?=
 =?us-ascii?Q?4ZVRpQzOI9YFpcBHFMX958otmtSJFtugQCX1BF235tlodUDRczDXo7IHSRoC?=
 =?us-ascii?Q?2bg9Uytpv9yYT1a8XqHRQ79hmaCDgTO+sD2veYaKRRXtgrYZxW3cd3L/MQLA?=
 =?us-ascii?Q?7tbnNgbvl5HfiMle9MItY+vgzTB1bNZJYiDUckId7xNXa4zZjgLNcKP1118h?=
 =?us-ascii?Q?QtzLsDAbw1iPM2X9VQuTe9ZC0taMwgqtkuJ+pDrbP0Lox8pbYQctquDb2m4W?=
 =?us-ascii?Q?GDLVERhUGfjDPXC7tb0Utj5n8HeiTbcO1UoFyG/SaxTpNJfkVT9z7AbKHFk5?=
 =?us-ascii?Q?aGz+NUGKOXwgEoG7wHbYXUbz3y9y5xs9Tw3FONIMLkdxnUClDXzVC+Mq3SBu?=
 =?us-ascii?Q?C2gzYWFwYLdEreNebc6qaFeFZto+/9WY75CX7Z14jvqaOvX6HEKKWIbZx+o3?=
 =?us-ascii?Q?1yEVULavBv9lxOrAv4pRSKk9PYyjsBnNDpDwGbDdfeJ2c8Knvw7dYgtyfMOb?=
 =?us-ascii?Q?rXbG3wZPjnPZ1xPwx+nv9JCQfNxcJ9bG5WkcdLtL9OElsoW7dCYGzMVIdYRz?=
 =?us-ascii?Q?J7103wzSpYKO9rzB6MpPnT2Z7BD7IxKv6zxBerECWtsI6k2rW2ZjqaXBSUN2?=
 =?us-ascii?Q?Hg7F3s6102bAneSSVFIy0x9njgWhjUdTd3mnKUTwoFA5ibAnOo60jgrWffua?=
 =?us-ascii?Q?s09QuyX/t/ZOuPCwy82SWSAN1QVUX3gVgFFE5e8eTSDw44fYWYevO1j58wwW?=
 =?us-ascii?Q?pfU+QjlfU5RZFYeVQE0vDre48rIjMd9qvEtNk6drgGgOvrk14+Sgz+BaHmCX?=
 =?us-ascii?Q?H8g8pNTJfWRT/7ouUrJuvKsqLVpNUCjQMVv4ZP/+A2LVauVKaviCIiwdr+DH?=
 =?us-ascii?Q?krsPN9/O2IvKn7Ik4oR4qGp2nYN7YOOsahV+Q76lRLX97wD7IVeYePESt2P9?=
 =?us-ascii?Q?8INo1l0w5h+JiNMLd0tytdW4QWlVX4/kcDXg9hs0sf6PwvmS46/vkGf6/4p7?=
 =?us-ascii?Q?uS2wk4xH+dd1iWV6N/OdCee0Zry+9EGspoPbAuX7X72C20AfWhgKzXa8PKF3?=
 =?us-ascii?Q?cHJyO3MGNhgtI336Xjz5c+m/M+cbE8k1DvBE8CeYIiomGgsELgpXmKjwZZ9t?=
 =?us-ascii?Q?X1wm7oxu+G4YVNVOETh7i7C288JTQiX1bl9WIRaeF6ALmC6gCPTkxyNZsQJ/?=
 =?us-ascii?Q?vnRq9ElnrECxff6UVOG60j/f21xRmMU=3D?=
X-Exchange-RoutingPolicyChecked: mx/BnPD1KaYVtneGemkwlkLAoapFv8riV5ab65eOh4xrQs0bwTdj0/ggRGMWlqjA5XiV41xpVkLOmahtBrFrHpbZJYfpn9RFM02qutUg1Qr/2++/HrrmC/1RE/XmvMJ1bV7Xw34O7ek9nGSDVlAIJr2Cbh21ozOc+kcmipD+by5BH/FHJMKSP+eFWWCCiSo4BFTgpQ7wXahjHNDrr9VKVlPJ2c7/jdiYgD+YdJF8tWGvmEvP92GiNYszhqKz/J4q+qB5JKZjVMsrrb3donRhrWIic0Ld6/f8wbYpmbmAHF055Q1WfrOevYURz0bhfFnFhZptZCFpAtlifzuC4miFgA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c8ee639-89d6-4db4-dbe9-08de967c74e8
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 21:10:41.6743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8PLqZpTW5mXjnqd+Lkh+WcHJMSpbAFqGxx+Iusk9TzE62nWbH8ANc94BrwI1iy/L0KDz73RGtlPZT0OZLeXvVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1EED2E381
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

On Thu, Apr 09, 2026 at 01:37:17PM -0700, Umesh Nerlige Ramappa wrote:
> In secondary queue LRCs, the QUEUE TIMESTAMP register is saved and
> restored allowing us to view the individual queue run times. Add helpers
> to read this value from the LRC.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  3 ++
>  drivers/gpu/drm/xe/xe_lrc.c             | 44 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_lrc.h             |  1 +
>  drivers/gpu/drm/xe/xe_lrc_types.h       |  3 ++
>  4 files changed, 51 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> index b5eff383902c..4ab86fc369fd 100644
> --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> @@ -34,6 +34,9 @@
>  #define CTX_CS_INT_VEC_REG		0x5a
>  #define CTX_CS_INT_VEC_DATA		(CTX_CS_INT_VEC_REG + 1)
>  
> +#define CTX_QUEUE_TIMESTAMP		(0xd0 + 1)
> +#define CTX_QUEUE_TIMESTAMP_UDW		(0xd2 + 1)
> +
>  #define INDIRECT_CTX_RING_HEAD		(0x02 + 1)
>  #define INDIRECT_CTX_RING_TAIL		(0x04 + 1)
>  #define INDIRECT_CTX_RING_START		(0x06 + 1)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 9d12a0d2f0b5..be1030c74e21 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -788,6 +788,16 @@ static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
>  	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP_UDW * sizeof(u32);
>  }
>  
> +static u32 __xe_lrc_queue_timestamp_offset(struct xe_lrc *lrc)
> +{
> +	return __xe_lrc_regs_offset(lrc) + CTX_QUEUE_TIMESTAMP * sizeof(u32);
> +}
> +
> +static u32 __xe_lrc_queue_timestamp_udw_offset(struct xe_lrc *lrc)
> +{
> +	return __xe_lrc_regs_offset(lrc) + CTX_QUEUE_TIMESTAMP_UDW * sizeof(u32);
> +}
> +
>  static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
>  {
>  	u32 offset = xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE -
> @@ -837,6 +847,8 @@ DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw, lrc->bo)
>  DECL_MAP_ADDR_HELPERS(parallel, lrc->bo)
>  DECL_MAP_ADDR_HELPERS(indirect_ring, lrc->bo)
>  DECL_MAP_ADDR_HELPERS(engine_id, lrc->bo)
> +DECL_MAP_ADDR_HELPERS(queue_timestamp, lrc->bo)
> +DECL_MAP_ADDR_HELPERS(queue_timestamp_udw, lrc->bo)
>  
>  #undef DECL_MAP_ADDR_HELPERS
>  
> @@ -885,6 +897,30 @@ static u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
>  	return (u64)udw << 32 | ldw;
>  }
>  
> +/**
> + * xe_lrc_queue_timestamp() - Read queue timestamp value
> + * @lrc: Pointer to the lrc.
> + *
> + * Returns: queue timestamp value
> + */
> +static u64 xe_lrc_queue_timestamp(struct xe_lrc *lrc)
> +{
> +	struct xe_device *xe = lrc_to_xe(lrc);
> +	struct iosys_map map;
> +	u32 ldw, udw = 0;
> +
> +	if (!xe_lrc_is_multi_queue(lrc))
> +		return 0;
> +
> +	map = __xe_lrc_queue_timestamp_map(lrc);
> +	ldw = xe_map_read32(xe, &map);
> +
> +	map = __xe_lrc_queue_timestamp_udw_map(lrc);
> +	udw = xe_map_read32(xe, &map);
> +
> +	return (u64)udw << 32 | ldw;
> +}
> +
>  /**
>   * xe_lrc_ctx_job_timestamp_ggtt_addr() - Get ctx job timestamp GGTT address
>   * @lrc: Pointer to the lrc.
> @@ -1550,6 +1586,12 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
>  	if (lrc_to_xe(lrc)->info.has_64bit_timestamp)
>  		xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP_UDW, 0);
>  
> +	if (xe_lrc_is_multi_queue(lrc)) {
> +		lrc->queue_timestamp = 0;
> +		xe_lrc_write_ctx_reg(lrc, CTX_QUEUE_TIMESTAMP, 0);
> +		xe_lrc_write_ctx_reg(lrc, CTX_QUEUE_TIMESTAMP_UDW, 0);
> +	}
> +
>  	if (xe->info.has_asid && vm)
>  		xe_lrc_write_ctx_reg(lrc, CTX_ASID, vm->usm.asid);
>  
> @@ -2476,6 +2518,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>  	snapshot->replay_size = lrc->replay_size;
>  	snapshot->lrc_snapshot = NULL;
>  	snapshot->ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(lrc));

This is an existing problem but it seems odd that snapshot for
ctx_timestamp isn't 64 bits... Since we are here, should we fix this?

> +	snapshot->queue_timestamp = lower_32_bits(xe_lrc_queue_timestamp(lrc));

Likewise here should we make this 64 bits?

Or next level for readability covert these values to MS too? I had patch
for this but it died as part of larger series [1].

Everything else in patch LGTM.

Matt

[1] https://patchwork.freedesktop.org/patch/696822/?series=159479&rev=2

>  	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
>  	return snapshot;
>  }
> @@ -2529,6 +2572,7 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
>  	drm_printf(p, "\tStart seqno: (memory) %d\n", snapshot->start_seqno);
>  	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
>  	drm_printf(p, "\tTimestamp: 0x%08x\n", snapshot->ctx_timestamp);
> +	drm_printf(p, "\tQueue Timestamp: 0x%08x\n", snapshot->queue_timestamp);
>  	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp);
>  
>  	if (!snapshot->lrc_snapshot)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index b544c8169967..178d9519b196 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -38,6 +38,7 @@ struct xe_lrc_snapshot {
>  	u32 start_seqno;
>  	u32 seqno;
>  	u32 ctx_timestamp;
> +	u32 queue_timestamp;
>  	u32 ctx_job_timestamp;
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
> index 93972536214a..4bca394ff024 100644
> --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> @@ -64,6 +64,9 @@ struct xe_lrc {
>  	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
>  	u64 ctx_timestamp;
>  
> +	/** @queue_timestamp: value of QUEUE_TIMESTAMP on last update */
> +	u64 queue_timestamp;
> +
>  	/** @multi_queue: Multi queue LRC related information */
>  	struct {
>  		/** @multi_queue.primary: Primary queue corresponding to this LRC */
> -- 
> 2.43.0
> 
