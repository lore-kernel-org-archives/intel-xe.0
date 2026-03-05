Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C54F47CCD
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 20:21:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC9010E1AA;
	Thu,  5 Mar 2026 20:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CcIQrljw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC81610E1AA
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 20:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772742106; x=1804278106;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5mTjX46i3o2Kz0DM1Qd+n9quMMuDiurBym5XtV14D+U=;
 b=CcIQrljwPrOM3YTNSPu32FNTkDf3cVUOPfeSBN48uTy/5rHItVvGzfDm
 4kUuHyNedxzAkGlCfiUPEEgvb++ROW1ulmSW0dTXKdGm7yUBU4HQSrLB1
 EZz0GeVuk7sE7JPukvcBMl3cLAoquujB1ZRg24HeUPFBeAj73xYNIpQa8
 m+iatGl7+aEbcue80B0+SR1xtE8JdAWmNbescmxv91xbL2QNJkufAwopf
 h5ypOEeD1zLlfqPOTG5yjYu6d6X1vvM9Qe7oo+7rJ5dCSFfB1lEnnzUpI
 DOm4DUalPZv6HDUcVqcdE58n/XS1EPUQ1BS7NXiPyeOX2AXGi1F0rSKMa Q==;
X-CSE-ConnectionGUID: izx9vCRCRbiNExNKIzYZZQ==
X-CSE-MsgGUID: m07bvhxfRMGRdmxVcFfqww==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73917771"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="73917771"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 12:21:45 -0800
X-CSE-ConnectionGUID: oNpyDnLsT5eYHFy5E4oh7g==
X-CSE-MsgGUID: I7YQSG7pQ1ab8JWSTGlhiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="223489547"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 12:21:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 12:21:44 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 12:21:44 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 12:21:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCql4UAhZkngwVlmy3F4dh/Yywelpm2dWp+raEFdXHW+n4an29i4cGMJ0NvPYpmD5JbTjsATJBo0R08aZR6pFFS6F+7e20UAoAoeM3/ieVvv92VJivGFe42mknlhrouSeAzR/oqd4J9KrWfN7XUw6Tjn925rDmSLBjIPeNo/HknvC51EMIgPd9DrJuAfRU4Zrys7hOc30lbnDjiHCfJto578wvNgzU4/xQKcE7Y6cJgAlnITLZO6aWXLv7qH1ABMW7igSfHFD1m6dNqeX1Lm4ACMAVYQruiKumh/1dcnYC7sJ7aGYepq+Gn+UZkCSshe6f0EOzxoaMCgq+BSVOo3Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzZHfG5qcxzINrpKX/lAH50pxG19hyDg2FQH1ANwC7Q=;
 b=P2LCe16sC7Agk/hduh42OPndwLU7tVzsw0jzyT8ACBzmst2FaGRA/WPpTksKIvzhI+WCTu50i4VPyNHjQ/BsLiTtYir+jkWeBV4Esw9HlxlawPswnk6w67x9tYmHPsZJTHIDxDC/Q0hzZl9ot7IbtmvCBJR8R2xW3rSIEBUWIOuB2wj3QT7GKrYqcbelAQaHCOlTUxLjBglSVzTPH5E6+XvtcacEXIo7zxCcbUYzbAL8NeyOPyXLbX9ckL/0Wj3eFAsdFnfEK4SlHwo5f5y6yjSg7i97dzrOwMK1EdhqXWO+zcHaJgvvMZFM4tNgw7lh8yrbn/0gigwOewN0cNqi4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH3PPFE1E3F709D.namprd11.prod.outlook.com (2603:10b6:518:1::d56) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 20:21:42 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 20:21:42 +0000
Date: Thu, 5 Mar 2026 21:21:34 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <arvind.yadav@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 19/25] drm/xe: Add ULLS support to LRC
Message-ID: <aanlzvd0M_YM8ROI@fdugast-desk>
References: <20260228013501.106680-1-matthew.brost@intel.com>
 <20260228013501.106680-20-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260228013501.106680-20-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZP191CA0005.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::19) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH3PPFE1E3F709D:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c73f42d-12de-4d12-6801-08de7af4d0b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: BpyITJ4NAaaA0vrUywsKjLV45PA+DavJM8wDB9KS69jWow7uMVGlD+Tlch/9llu12UZaqKv3DOXve7IXntegp6MFPSE/x27GB5kSqvGw+Phodfx2II3b/LJPTh+7OsqsIn7rHd47R7bNQJhLN/ZRomOdakglMK8oyHr/wkMxU6Ny6vAtjv+l6LUypEkn1RElAlgUvAJcn63r6G0BOd2uTd8GcqiNKMjVcuXivtj/VIL/VtR80L8XplHFBVXyA6uNWP3jde9iz0j7TZf8AivJWm1RQVf96Pqp0sBpI88CEnyOv9sSsR+cpx6fpd65aE5yHIhLOybVuyXqmgz05/+iMrneCsjaEgIIvHy5aDrzbV4PKt7MQwc2VzX5XPNa5a9qaoXP4iU0EB3l7CMLnBBVzK+GhNBJkPNJLGzwj9XB2OYwuTOtpAX7tbzjg72J8ySkMJ6vMSMCznlhfp8lDTbUaNx2YkAqAApPEOM0QwbTH8+9L8ydo/5W6NK6C9i1ruAtxW8r6yMdXL849TDTUNjTpO9L39pVCdWnq+v2rvqJ+/mfQdWMZZT5rZWlAd/R09cCB811bBTaIMBz7W+5aFQFX4ddcLOITqKSbw+Q1I17LO1mQ3IkBT5rlbYbwZbwIZcFyXBIKLnnyeQtfLbm87C50oRd3clAcJQ1y4Q5MgCcjlqZA5V1ZuXV9R+E1t+RKNvINYtelzADmCzn0D4MEnPWFWMOxZn0tLlXs+M0RYYlpk8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QFu/yxpWJRzszS0hm6/bRK+gC1ikmbAuWFqDvBa+APLxh8O2bd5aenRgkq+D?=
 =?us-ascii?Q?bArMo2fZC8BTcb5Nl/2JF2tr4QB1QoOFhbfQvjFGzBaqrGGfRJ5h7juk/Ssn?=
 =?us-ascii?Q?1uGfkyvYR98FyG3TM3rtwyi/KxdXEQZs8HYMGd0wSbn8nPuvoZ/p9SF6lI/E?=
 =?us-ascii?Q?i5KcSAO93aP3Ee4SAZU6LIzhCuT7D9QJDwVjiXrkuz7o8fJ56igGtuBfuuyn?=
 =?us-ascii?Q?oJ5s1kK4xMpnbV2JArcYzjoyJt8sNRGwQLeadN0TNOAU1jPaUDVh8XftfqEM?=
 =?us-ascii?Q?1/alsg4dxsJ/Up2nbtP8RlKao4qgbkM8aRcauXybg3eOSQK6HHHEIyflmY0o?=
 =?us-ascii?Q?6yr6h22X0ryEohpCpMmazgQIadovJPdK/cIPrqurrpWWPHqpdrkKLNrZCkI0?=
 =?us-ascii?Q?ZViFAI8M8uH3FoOab8UTT+i7D105gLGB1aa/QdO9+XwdWB8Mv264zYuiu5iA?=
 =?us-ascii?Q?JCIrx9nMrgTMI8AwB6DwQMaEO20jcQZd/5FQ05T550QjpafuiG2nRMeD1PXG?=
 =?us-ascii?Q?5j8+KorkB/YXK9osklboB+8uqFMQi+fgb/ujExJjOAruhG5ryCl7Ok1tF/3e?=
 =?us-ascii?Q?3h2qKFbozpyPaI8lOLJqs0kfRKyh7LsDYtwiSMH76GMvuyt1lCVXPfZt1fGJ?=
 =?us-ascii?Q?kN3lV0cZHP6u+1xwmZN+nh4rl17XYlAd18zeVTOetNe6OIcTvREcnFuXcOt0?=
 =?us-ascii?Q?YFpcmdWxKM4sSd5BLAQTtsaM12vMRLOfg21HSyBzl6OH5RaJ7ejRT3tf+6Yo?=
 =?us-ascii?Q?foNhf53lxe2bPA2KIq0egnfEI48p6CwaTkklqf4eIaf97ZGguvhsFKkUt7tX?=
 =?us-ascii?Q?Y3d/26U0G2pMZiF165EnEgs7FtOxvAGGBGYtNMTsnhDD1tcLHRXgKJhI7ZdV?=
 =?us-ascii?Q?aK/yuvMAe2MDxxLMghPdHN+7jDit0UXBMvrNXXfxYApw0MIdyVkzhLzKYUqB?=
 =?us-ascii?Q?mb6jF58CPAdGaFg4eiatP5Zj7ABY4MTtOK07ExCT66gnknE7FcAS+xj7kPWY?=
 =?us-ascii?Q?al3BeIOHGKj6bSFaVEmON7j6u8nzO8ARoMe42XwvtbPd9K1dVvsvabMQe7AT?=
 =?us-ascii?Q?62o2uF4GHEDF8bWEpBa3frLZpvtktCA9O20VPcXIrtbt50lTpdBUDMlZrmDI?=
 =?us-ascii?Q?bdg//ZG41SmBWQ6ibD2bDy9OxfdFtuRagkbW+Ui4x19/TM6hOaRqOn+4sUVc?=
 =?us-ascii?Q?2TKQU9USrWwy2dMVW4sDJLFyfXPleFEvXVNcJrLA4MvRNL3s1YGRFwTWhX5c?=
 =?us-ascii?Q?8+1nHwBTf95cBFaEjfuvVdAGojgCHSqs2YACjzoeIb0PDlOUUs5uOQ43uFCW?=
 =?us-ascii?Q?uF9DL/0S2kUKCdVorKEzmmYX/iNFixk5wUY/j0b9gYI/fSLqVMs4eMZoFWkk?=
 =?us-ascii?Q?6yxwL4JHqDhkJHZ7gL9nE5N5Y+fmfzrA6O0O8IO2oTuvQRIMwG8KvwH9WOnr?=
 =?us-ascii?Q?OtDhwQOcrVqY0d+vO+GmYJAvhBDR4EKY0EgunTCngnYgQg8gDP7MlMyQFftK?=
 =?us-ascii?Q?DiruhXmwVaDyo2rMnRhNHRXyVWQHxHTCrBzwkpLPu2XeoGlWHDrsd84rahJD?=
 =?us-ascii?Q?Er4b8NvaGPXPnQKq+rB2ZTgKNcTDydWjJlBKCrTTe5HfMO8/Vw9WENOfTbMk?=
 =?us-ascii?Q?ZMhIBi3+z9Jc6EPYsPhj7zfVU3QDJofE+aamMFlHbAID+1YjVsz6hGsDQ3bl?=
 =?us-ascii?Q?mSI7YDMK6qcFT88GJM6OSdOd/QZHIfax9v9WGvZdgOPiZhvXk7j1Jyr3OJ4y?=
 =?us-ascii?Q?vRJtlqAy8MYN5XCTx4g/fX5u2RoScO4=3D?=
X-Exchange-RoutingPolicyChecked: grHzzmVjjOwgfXMg/NxL2nT9/jIMwQZFlSeBHZsZrlkSwx69tFzF8q1DuzktGWVNe42wSILDb5hHK2dykzS4nTiWho0NJuS2ADIV4zn2ghQDeGlXTWEhUb+NID3jqeBcztbnxe4erfibB9PRsEX7upSgRo1Wl32gPMWpcwc5U9kOXbnqUQYHsS5PZtG79GcVZU4fWt496TGOY590NX2QI1NS5Xnko3fRQ++VdRDkRTLFGlG9+YZFebLRlEZ4uJzSlc/eqUkiiMZp4uUuruHl/HI6tKpoVrQ0LKmI3OO0evxJs6/aXok8LqmmP/Z7V/olSOcMaph5VQz8r00MARQqRw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c73f42d-12de-4d12-6801-08de7af4d0b6
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 20:21:42.6401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3ryXnzQnF9H9SVVa2D8OoYljgUne5N8DJuQt6JZ2FIpnQDTHnrKuX3Wn4ctHwtpfv2LGPg2msAPLfrpgamAxEcre8Ga4uxvq9A0Z+JuA5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE1E3F709D
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

On Fri, Feb 27, 2026 at 05:34:55PM -0800, Matthew Brost wrote:
> Define memory layout for ULLS semaphores stored in LRC memory. Add
> support functions to return GGTT address and set semaphore based on a
> job's seqno.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c       | 51 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_lrc.h       |  3 ++
>  drivers/gpu/drm/xe/xe_lrc_types.h |  4 +++
>  3 files changed, 58 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 384f9b31421e..44fb600bd228 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -718,6 +718,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
>  #define LRC_CTX_JOB_TIMESTAMP_OFFSET 512
>  #define LRC_ENGINE_ID_PPHWSP_OFFSET 1024
>  #define LRC_PARALLEL_PPHWSP_OFFSET 2048
> +#define LRC_ULLS_PPHWSP_OFFSET 2048	/* Mutually exclusive with parallel */
>  
>  #define LRC_SEQNO_OFFSET 0
>  #define LRC_START_SEQNO_OFFSET (LRC_SEQNO_OFFSET + 8)
> @@ -773,6 +774,12 @@ static inline u32 __xe_lrc_engine_id_offset(struct xe_lrc *lrc)
>  	return xe_lrc_pphwsp_offset(lrc) + LRC_ENGINE_ID_PPHWSP_OFFSET;
>  }
>  
> +static u32 __xe_lrc_ulls_offset(struct xe_lrc *lrc)
> +{
> +	/* The ulls is stored in the driver-defined portion of PPHWSP */
> +	return xe_lrc_pphwsp_offset(lrc) + LRC_ULLS_PPHWSP_OFFSET;
> +}
> +
>  static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
>  {
>  	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
> @@ -830,6 +837,7 @@ DECL_MAP_ADDR_HELPERS(ctx_job_timestamp, lrc->bo)
>  DECL_MAP_ADDR_HELPERS(ctx_timestamp, lrc->bo)
>  DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw, lrc->bo)
>  DECL_MAP_ADDR_HELPERS(parallel, lrc->bo)
> +DECL_MAP_ADDR_HELPERS(ulls, lrc->bo)
>  DECL_MAP_ADDR_HELPERS(indirect_ring, lrc->bo)
>  DECL_MAP_ADDR_HELPERS(engine_id, lrc->bo)
>  
> @@ -1860,6 +1868,49 @@ static u32 xe_lrc_engine_id(struct xe_lrc *lrc)
>  	return xe_map_read32(xe, &map);
>  }
>  
> +#define semaphore_offset(seqno) \
> +	(sizeof(u32) * ((seqno) % LRC_MIGRATION_ULLS_SEMAPORE_COUNT))
> +
> +/**
> + * xe_lrc_ulls_semaphore_ggtt_addr() - ULLS semaphore GGTT address
> + * @lrc: Pointer to the lrc.
> + * @seqno: seqno of current job.
> + *
> + * Calculate ULLS semaphore GGTT address based on input seqno
> + *
> + * Returns: ULLS semaphore GGTT address
> + */
> +u32 xe_lrc_ulls_semaphore_ggtt_addr(struct xe_lrc *lrc, u32 seqno)
> +{
> +	xe_assert(lrc_to_xe(lrc), semaphore_offset(seqno) <
> +		  LRC_PPHWSP_SIZE - LRC_ULLS_PPHWSP_OFFSET);
> +
> +	return __xe_lrc_ulls_ggtt_addr(lrc) + semaphore_offset(seqno);
> +}
> +
> +/**
> + * xe_lrc_set_ulls_semaphore() - Set ULLS semaphore
> + * @lrc: Pointer to the lrc.
> + * @seqno: seqno of current job.
> + *
> + * Set ULLS semaphore based on input seqno
> + */
> +void xe_lrc_set_ulls_semaphore(struct xe_lrc *lrc, u32 seqno)
> +{
> +	struct xe_device *xe = lrc_to_xe(lrc);
> +	struct iosys_map map = __xe_lrc_ulls_map(lrc);
> +
> +	xe_assert(xe, semaphore_offset(seqno) <
> +		  LRC_PPHWSP_SIZE - LRC_ULLS_PPHWSP_OFFSET);
> +
> +	xe_device_wmb(xe);	/* Ensure everything before in code is ordered */
> +
> +	iosys_map_incr(&map, semaphore_offset(seqno));
> +	xe_map_write32(xe, &map, LRC_MIGRATION_ULLS_SEMAPORE_SINGAL);
> +
> +	xe_device_wmb(xe);	/* Flush write to hardware */
> +}
> +
>  static int instr_dw(u32 cmd_header)
>  {
>  	/* GFXPIPE "SINGLE_DW" opcodes are a single dword */
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 48f7c26cf129..9e51222191ea 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -111,6 +111,9 @@ void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe);
>  void xe_lrc_update_memirq_regs_with_address(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  					    u32 *regs);
>  
> +u32 xe_lrc_ulls_semaphore_ggtt_addr(struct xe_lrc *lrc, u32 seqno);
> +void xe_lrc_set_ulls_semaphore(struct xe_lrc *lrc, u32 seqno);
> +
>  u32 xe_lrc_read_ctx_reg(struct xe_lrc *lrc, int reg_nr);
>  void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
> index 5a718f759ed6..7cf84e32f998 100644
> --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> @@ -12,6 +12,10 @@
>  
>  struct xe_bo;
>  
> +#define LRC_MIGRATION_ULLS_SEMAPORE_COUNT	64	/* Must be pow2 */
> +#define LRC_MIGRATION_ULLS_SEMAPORE_CLEAR	0
> +#define LRC_MIGRATION_ULLS_SEMAPORE_SINGAL	1

s/SEMAPORE/SEMAPHORE/
s/SINGAL/SIGNAL/

> +
>  /**
>   * struct xe_lrc - Logical ring context (LRC) and submission ring object
>   */
> -- 
> 2.34.1
> 
