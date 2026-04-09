Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98245F364BA
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 21:16:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593DD10E05C;
	Thu,  9 Apr 2026 21:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XHizmjmH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E965710E05C
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 21:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775769391; x=1807305391;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vV9vYDYnMvinXcV/fqJ6v5VfCxSeaiIa37jA7Syeak8=;
 b=XHizmjmH1bWoEpRgaRxp9ILZlhIAbZqN84Ub/JTp7grQ+u3bdI3bgAYe
 CjUCEWirX9qM+ew+llao5kv3ddu98MLlMJw5AbJL+6VphQLjwqawLjd5I
 ogJIlUQID7kOu2zxgWGb6M0oX1dsLvfyXRZnlY6Qo2P6TQ36M6Ixcb7Q1
 XFjQSEHujpPdeIxxZ1QWi5E+Ff4f+kga582cjr3F4V/aEACRkw2PRDp8O
 91bvfRKENiXMTrz36Tb65btHZzYHaFPZiFChqidhyddQyY7nUx3yMqJUi
 nKbCvRcxugejTblX7DX3nMj63dtkrlczth0mco5z40PBUXPYrJOp3ErD2 w==;
X-CSE-ConnectionGUID: aUrlS8oMQROQFqsq8UVCXw==
X-CSE-MsgGUID: gEALJ3d+SC6WCG9ObBQdJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76504014"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="76504014"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 14:16:30 -0700
X-CSE-ConnectionGUID: t2oBd8aRQnORyEkR0fGowA==
X-CSE-MsgGUID: BxitGD7DTVmBo91DjA6Jqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="228782497"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 14:16:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 14:16:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 14:16:30 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 14:16:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAoYPhTGbm5//gaYgRsfcigmDESL39Jr2UjiYYl9HUOrfVTzyBevXDiPq+Tw0AEz4f/Ki2VZ0bubUUvAJNgxPg2MiFU2ARCHNVX0zhUGeAkTqlFrDB9/zkh+yGeW93woTxbVBy/ke/n8gIye5FbPnHC74YvFOOBuPWqiUPk6ymceroF1Y8T/fnKWtLFJLQ+MjEkd9fpBPWDgctNj5ULo3W7CkVVgevVK10KjdAl8RPCahPc02ogL5ojZvqLWm5Fe3bN+iLe4rnGQx2pVc/992pdZzjUAu169O7t0PSBkBv/nBHMauUz7pRGgB8AFJg+8RJhQGaSH43/ZctO4ZsTMLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPKva0rSEkR67t3I3z47OlxEXQCM9EXlA8B6L+akAK4=;
 b=JqbWDk61LLOoyOudM+bGCRgOo38DiKVDeIaWFT29neKVy0InJ/8fAa3Fn8p5InQFrykHjvj00sw9dBHBgZWusCCNRabDaa29KqVy/pqrJ2GY3+DouDKshAPyRg47a2KNHKQWe9T5/qWXAksX3eTUJiKwduQqVGtTFNT9Jfdy6xw/qSAKW6evKyWAYKxfeGbffgyviezTbS5MsQnmo4Ig1zoQdVi27VloMhsIjXEO3bTnuuizb+ZzeFafd8yFdyuUGOVfppqyU8JRj3wx7/a6jJuhW31HT4ln1Z7FhtpadYqLEgKD4qYGyEWN9yvxGY8SME33SUvZTKCfO07e2e6Vvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 21:16:27 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 21:16:26 +0000
Date: Thu, 9 Apr 2026 14:16:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 2/5] drm/xe/multi_queue: Add helpers to access CS QUEUE
 TIMESTAMP from lrc
Message-ID: <adgXJ4jkaVK/d69x@gsse-cloud1.jf.intel.com>
References: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
 <20260409203714.1887402-9-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260409203714.1887402-9-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0122.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::7) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA3PR11MB9226:EE_
X-MS-Office365-Filtering-Correlation-Id: 91fbf61b-e3a4-473b-c973-08de967d42a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 9AD+PEeccFOIX1VHS70gnmIiJuzTfu3jHwyQLSfdUk1oz3ZtSHBk/us5xuIDXWKcjoRwigs5vAoIUg3m8zybEEG2imAlXkFz90nODquRUFODRk7xvG1wLdokhHWxE82v2zUbmfvkSMaFne+zL+JgcBdjrMFLyNazSfr8kfT7+zGhEvA+f4BkLqDatc9JgwL318SuhkYY/4F0cmk9mQsiXveCrBtAKURlN0U1LRbi3kUxzaqnVbjjOyBy3tSohVP8eQdtzerhKvci2I2bRcsSsVUiNE/IkYzxp9W/y0K3WzHtLdeGlya2icPVeZwcQ8RgsCQmzUC5sAZHxEEa93ZvKKE+zKX1RpFyXm2rwXUo5wp5kLL7BBZg5YT3HfMmTGNip8u6Kzptfa9tIsRFFCqQ90MuuNyJJtj2jS9c5CknAHzJKje3t8bh7yDVR+0V5GyF49Qm0QTYrNsoa/aaY6eQExmdoJ5lCcl2yaUP1cMEDjzBVlveQK2cTByrLRZF8funU7QZZQtkHO0HyJiLGFT67XmOQvZmlwrLuJVMdDueo+lwFxtm66SDmOfVCeFSdWM9nN/yGidE0l5nzB1VApu6sk7prNjUhVxdvm6HdXNolgTE4Xp3hzvLXHMHq8BcV2/AHg1xnj8We4oNi71i8gwz/OO+OdXsZVJ17H563+9ObbrioXzEKoTfloOYE0L9WgqJmGuJkiJ6vzCweVOGumT5g86Fl4tEyuZLZrah8H6z4IM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?enkQVlHR0mG8ZK9MKCrNDepb4sQTq85Mp9PCWB7BXYiADnq+l52ZkzJ1PXqo?=
 =?us-ascii?Q?Ndmb7sL/FsVl1+knAJZkuG/V0FkVh0I+oGTcTNIxDbaHR46mXBNtoluUt8aT?=
 =?us-ascii?Q?MZSfQw1A4GCu75M95HLY0tkkrKpwdvzxe75t6rLHV/uKwZiPPIcOMxhlZJcD?=
 =?us-ascii?Q?B8MaNZdN/3G+Y/pXMrM3sY9OhKSGfl4gi9/qBlupGNwO9DAFcRdgLtGRBBVA?=
 =?us-ascii?Q?0R6cw69UN33RTVGoc/loYwqKoEJbgQ6SeHS29mVZ27oSgHYIw1lQfDZ56J+D?=
 =?us-ascii?Q?FrHQgfclpxx2zeHRlhVVI72sNkZqN7jbsb22j/IDx1AdCBIX5SI+SgTOQbp0?=
 =?us-ascii?Q?ai9bz769H0U4lapzinNtcoC/tplarZUn24BDcfYRnBS1PayC9c/0p4TL6aci?=
 =?us-ascii?Q?KN5yl9ZfYcadJQ9qScX79/K1AJO20RLWZl2Te/awcMndGcJpx516zg6vCpba?=
 =?us-ascii?Q?v9mCGHq+Gjg1SFunAKHywyL7zK4ihwxowx2Mp467mrvy4lnZR0vxbISgiIGN?=
 =?us-ascii?Q?/qnYvBSMUe7TP9uqimXw7wZ5gkuXVvK/ABh0nOMSsBdl4v1BrQM7EJNtcBrI?=
 =?us-ascii?Q?XZJTLVlitNaTWrQYomfsTxQ9VrZJL2Z6P2wZnJGkaaYCwhaala/KZ646+U9N?=
 =?us-ascii?Q?yCv919B4UNUh3cbljFxvX9JWaulrVYqmXV0MZEjbzjxb9IIbgKDp4/H6HoZ+?=
 =?us-ascii?Q?VqTUbtCwtL/aT8eFlMAALcdVdGI8LQ36flEFpPDfeG18ur406XFgf+fkhyAl?=
 =?us-ascii?Q?nk6zIsjDJ4PIrGM41zEvy6jl68oaOJfEboPe6YxxzfkW4TKdBZnyMedmTtZb?=
 =?us-ascii?Q?Pjf6XynKB0AhrhcdYhuBJXgxGVVF6bVl2UMrgtM/94UnxOKCJoqYd618p391?=
 =?us-ascii?Q?anhDmqNLIFoXJWE6KqzGB11b6h8yqgb7BkBGo2EiD/i7MUQETJP9ifuDm2/e?=
 =?us-ascii?Q?gNw/v0DDVbHwaubc6XmIn0KeYe944YhYPCL08zEnqNx6DuT2D+dcvKYHEg+9?=
 =?us-ascii?Q?z2iRFGEEq6sm6FTTY0ijYnyQkKa5+QobAHVgnMjqdg8dmzxA0jg+y5yR3NOb?=
 =?us-ascii?Q?t0Oqd6mYnQDMClO8THUOpCLMXq4AWfDT69jwbZeVuMg45hGk65qXeQQLMe9z?=
 =?us-ascii?Q?VzCk0A6ErM9af+EcecVDtOKQPqGTdUMvBooztHS7ku6DrUSE1/LzKxr6DCff?=
 =?us-ascii?Q?BhohYC0FxsLLzUH2QJXga+UhxszdrJc6p4+y9faiyROm+b7gBXXco1ADHFAh?=
 =?us-ascii?Q?HlPNgFe8D+URJfhyw8Gx3DM6aMyKNHiZwhlqHNGY+9ZNmSZtaE0NS9eBGSFf?=
 =?us-ascii?Q?0Pk2bsB2nPhf/e7p2OiQADxgt80khsAGpYjAYAvYe7UTx5jvbJRn0t7GWwe2?=
 =?us-ascii?Q?iVY/jcvEgVfVsZtFxRUP60V2rr0nqUjIA5cFdAJitQ9HpulKAf4p6f0gSI8V?=
 =?us-ascii?Q?nTLWXpmrLJmv++Emwjyk9TBuPV72S6HdOnnoSVPHft58dCgoPql8E5raOu8n?=
 =?us-ascii?Q?3YXfEB0qfUHy+ZUE3KWSz+QGANPpx1Fi/cYBVg+LL7GgE5F/w7Wls/llxdaM?=
 =?us-ascii?Q?LViOndnkgVSh1jrb76eBdKN5zCQruiruuH0JsLH61DRCXhB7jLouFf4nlago?=
 =?us-ascii?Q?h/hDLtuM6JGBHUl3igUiN3eYP6ur/CEZ76wNX4zZpFMZ+lzs/I1qxBa23ch8?=
 =?us-ascii?Q?wec4dhUfxd0nOJXKObL6HVH6wvfy69LlAEynTULx9fvdO3uaKTCGpUTUegmD?=
 =?us-ascii?Q?OZ92xYgNufY6S9mm0le980dSpAwMVUs=3D?=
X-Exchange-RoutingPolicyChecked: vJBbG/xBx2fWJZe1lqIupKBzeECA3kylAUUweEAN59a5w1p42yuBRGvI3CkgDYPDIUKosyOBaeDWpz1QEKNqQ8/4VUPapB2w0Z1y8BA5ICbQYc+zVcCdJjMkfPYPMihZA9QGSSOnYLWI+x9aPywhHax+kCQurx+GxK6B2d7gFOc+tOLAg4MOZPMeqgbGs+ZIxBstZXLM8lJ7ciX4wcsUarY4/Z8WN2eeNanHlBxGgZdSDEZT/q3TKfiBG7tEn1x5rPoY3h6iGvHLbK3c3z7j0rJj8s6VaHyKbN0GeNc7TRJFnfVZJ1N7IIWUVO/+rC9zvWnCR93aCk+KMrrYd1s2KQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 91fbf61b-e3a4-473b-c973-08de967d42a7
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 21:16:26.8312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0qemtKW2P1LHmcux5YuG1pmaMRMZIMM5ePUIl49peUMof4ZTq7gXWyra8+A/6gcqG/VmHUKMwkbo8MKk0ArDBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9226
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

Missed this - can we stick a Bspec reference(s) in the commit message?

Matt

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
> +	snapshot->queue_timestamp = lower_32_bits(xe_lrc_queue_timestamp(lrc));
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
