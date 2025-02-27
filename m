Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098FDC197BF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 21:13:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C987110E127;
	Thu, 27 Feb 2025 21:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QUxfqzxw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D82810E127
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 21:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740690824; x=1772226824;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7crhYvEIbFGrfUE8mTZEakcxWVdFqVOwkR2Wz/U9Hls=;
 b=QUxfqzxwnttLYDTi2YAfwa9FlzbIPNKrLpsjeKLbNLqwo9bAgHSy8Bxj
 VTnSX341R+z+jpFsCRxo1O3rp2tKF7N3ePRpM9iKnxosnavZkjrCvBOTa
 wJEsyEZv92D+5X6IfUpv2OqwXM/WPDbB+LJG3XETLGTCdIz0sbZ28Aojc
 yS0lncw59pZuuU8WdtOpLj6jSIxK2k9HpFphVbHC7kwsp4mFMgFU/inrN
 b7gFvUlRog7GgiWYUufbi/1A/qq/EQpmdC+OJ07IIre+qpZm+Nn4F0nSO
 rYmf04PBh8TNSOVGhCZG8lzjtXy/QGswrRa+OgRxbnfz8gQbZuitkcc79 Q==;
X-CSE-ConnectionGUID: 4+A0O32YRrSeuutI2hioFg==
X-CSE-MsgGUID: gdalskjtRg+E8WoPIeWuxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45252253"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="45252253"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 13:13:43 -0800
X-CSE-ConnectionGUID: PPrfu8BkSu2K90KgRM5h4w==
X-CSE-MsgGUID: 3Ozi7nQyTBGjhTb/oqSAMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="122091793"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2025 13:13:44 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Feb 2025 13:13:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 13:13:42 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 13:13:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7wxf3kJ4m+c79qRa7SaeBOupdGa9KkiWtQttjjRG2AO1oM3R2MSu8wGQ5PkRfK66r+wItM9Viv6HjlJQb2IuiwQ+7NEPg0zZZxd4AOBPJ/oMkypt2ewtFHqbrmUBEBLeACBV0qQTVS2a7JITCYxOLlbHnS2JVQ8xrfeOyvoG8cpbltJIjX4RvHFQGMgTS7Atd6v+/HF0TwfmCA8iESXtCBlWQLqIRnrhHIqODIPZPNPbO05iLYNi7KxvqhxVxRrZbAKX0nXpO0nJRPWxQecdMMm8XvF3a3M2OrxXu+DYtP/bs3KkZ+BXsZfXJtRXP2XTIdG4BKHdlmruRJ1vB6OtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6w5Y33VSnazOj/QfJ1p+hC9JyODB95Af83qNFmo5nC0=;
 b=KJHolI6guKrrc1vNKxSXWalhK413mo6/tFpzi6Kepu8v5vPbh2grft4+evI+S27HcPQ7QzAboz3g7eJ3iVTjqYpKPV1VK47Yavvk4dLrUKoz22gqnih0i4TiwrROqgmbo/KAq5TNoDICgGM0kxNevJur1ct9W4lPZmUOZHM9PtQaR24k65w4tCM/bHKI3qb7iJJPCGM3Sv2L8dtuue6V583B0eWJPQpXCPPV//UI2NMsSXw78QeFaq4X/ynMOmtSH/+xa7eMdQZRZF/UJ2chXeQLQPwWXcBmUG6vB4tE4qxQ/xRsYSMTdy+Uegg7p3CfDUQB0WW/U1njP1PRERlskg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CYYPR11MB8306.namprd11.prod.outlook.com (2603:10b6:930:c6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 21:13:36 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 21:13:36 +0000
Date: Thu, 27 Feb 2025 13:13:33 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH 3/5] drm/xe/xelp: Add Wa_1604555607
Message-ID: <20250227211333.GR4460@mdroper-desk1.amr.corp.intel.com>
References: <20250227101304.46660-1-tvrtko.ursulin@igalia.com>
 <20250227101304.46660-4-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250227101304.46660-4-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: CY5PR19CA0032.namprd19.prod.outlook.com
 (2603:10b6:930:1a::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CYYPR11MB8306:EE_
X-MS-Office365-Filtering-Correlation-Id: d064a581-49e9-46eb-81c4-08dd5773994e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?skLkdkxZKz2yMVMaOL41Uf1kUKl43AWa+NJB5RBfyF5NiGKWth55kcLoMNzd?=
 =?us-ascii?Q?QV3CfPHXcS+xab+yaQJVBdd1DgpBxKY9jSmxtiQ+ERDknPyFohEqr/4+QHl2?=
 =?us-ascii?Q?cw9BM7L26Ig1PjZCOPwgjwENtPfwgTQoxIBrx5TBXnm4i/pEHSGtyA+gWc6O?=
 =?us-ascii?Q?8gUPkU1ikIFDlnTGlyWjNKlxG+m4GwS3yvEisfLi0zZzS+4ViqvG3gTvSNYf?=
 =?us-ascii?Q?hd1alfpp9FtGgc7Kj8bwlXpJtjOQXJd7XmfqCBwMOkBajRCj/iCmfM2kHAOP?=
 =?us-ascii?Q?+BGcDIXztu1YdvhL7+fO+RbR3CAwDMOMrNJxy3JFs9a4pCsUu2bHISFQ1tTE?=
 =?us-ascii?Q?11//9PfGX2hewFUfbX32HJ9lp9987RAiC5lLReqyroiZ9zSCk13PzzKSIcuS?=
 =?us-ascii?Q?Bvk+lnc5haQDrzVkCKPStPXyIAUJtbmfLNcqZuP65teYnelOGaa2lMLB6WF5?=
 =?us-ascii?Q?d+8r7su1WLOFrmSU8TZzaKqY48QlOJ60VHISO5Zh9s9XASuaK8hijeObs9vq?=
 =?us-ascii?Q?40BnhLsPTAOfb8kZ2gnxRabMm97tteAgQo/tTY9rY2TGEDse65H+WCtY+AO7?=
 =?us-ascii?Q?brFz8SjVeA8gIaR4XehxGtVYHXmLBq3llSPa9Vjh82ftAlvgcNGJ4CUij20W?=
 =?us-ascii?Q?bi3+HKkksxUMsgND1nrEGhvjLrHq2SjuMlOOrukn+5d3JcXj70gxuaOhk4qz?=
 =?us-ascii?Q?metLIGWqVWZXdp24YVwzPCRrXnGN0papC5/6x3yHeYVk4OUC0zu/61YUyTN9?=
 =?us-ascii?Q?d4+X41RmsMQbvR5OBD7S2taNiD+1k9f8zJwS+qjYeReKA0bjOD3JOdPANjDi?=
 =?us-ascii?Q?iGzMvWmVhwJmUkE7kCVGkghJQxwFVtEAeEz8hmyu1ALpq082znHENFcjEEv5?=
 =?us-ascii?Q?BM97lgeurB6jRbja9A6LIBMxTEYIm5ghz4aPvH99EEQqsL2U6to+5O/PJkR3?=
 =?us-ascii?Q?YqXs4ODs4sAiW8X3NfZioM0J4fI5d1o9tsK7JpBlPT0ZwRtlpWZPm3ifGZ4M?=
 =?us-ascii?Q?9Zz4lh3Iv58Ni8YBv0CSCQ07YVHiXlkchHPECGQq0QRgCihuxh7E6qVURXkU?=
 =?us-ascii?Q?HdPLoE7GLmBjIzgINzFiZuVGuccIw08q1My+F5JQm2fUAzpbQowXhLRvgPKp?=
 =?us-ascii?Q?uzYYnl70r+TXvV+YnEdzxykbKOpQ/6K9NRWwo039vl9JOzwp9doSIhh+kNHN?=
 =?us-ascii?Q?EzMmeiXhHhvUTMW7RulMwBL8d1db5rjD55kZ/QpXlVGm5OenJySzCQagtver?=
 =?us-ascii?Q?/QHymiLjqHi13u1HGeibskYKyKxbppnT1AqfCpEvvzg5pIeiXmeqk9AfFup8?=
 =?us-ascii?Q?8fABnByaWdRwqXjPEq/HTbUWVGWz6/AeNtUX8eQVtIuWr1/GwHY+N4emU4G4?=
 =?us-ascii?Q?kAcAzMfdtSRYRtmDI13lw5h4pkpU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/ntXdmdbphWp4GX5ShR5cynLK+meB3J2yG4KLoWvgW86dCrXdfynGKclNKsW?=
 =?us-ascii?Q?8vYhU4MnBqozXLJR3Fzup74+wZUejI46c9wVV9QL2tufUVsbj0bC2aQflcmv?=
 =?us-ascii?Q?HpoeCZXj2II/dG2YHPy9JU5A3eUSGwg8JRtR+Lx730QJeaFVlqEk9/pxA+hq?=
 =?us-ascii?Q?VKsudMuD1q0nDK4of6ZwgSHSgxgV7RLlnyriJC4QzrEJncqb295iYyHJbAqw?=
 =?us-ascii?Q?G1r4CBisnlDLfIsM7OLw8uq+GyR1VHY/svGJw6ihYXtK+M/PL9y48yHYfwLl?=
 =?us-ascii?Q?TJOLrEgKFjrp5xWmqjWwHGI1JT+PNi7loEqgkT7Jc632OKyM1YwQ6yjqCWXc?=
 =?us-ascii?Q?RiVeFhYbgsoL9HQW7Yyxih2Zaegju469nlxgx7DOTJRlaSSKDAFxiPzyETCb?=
 =?us-ascii?Q?5Yxo2PU0lzPT55z9oZuaaBmNqw3JfKzFVdqskzBmSQCzHGPqwE0C/JovLHSD?=
 =?us-ascii?Q?/hXXeQSnSv42iopDJa/vHM0omD81lU2+L/HQwYcATxssHC13XXAMkw+BSl3o?=
 =?us-ascii?Q?suQilRnZIong4sOj8yk/dT1SyYDQoYt0tS7y9XjueN7uCPJdQ+NZS0030viB?=
 =?us-ascii?Q?YfVTYWNO2KxHV8I3ujOk8kZzerV7ODo2b6XmdkU24yYbfIKEm+r1PDCM5xR6?=
 =?us-ascii?Q?y+S3C1gHEGGV4+TRgOk/Wr3I6ur7nnpmuJdk0tKVxq0FWgemTR8V3D3ZBOZ+?=
 =?us-ascii?Q?Wmt0rNGzWwWfjYg/i0FWp/LGhouDO4gWVamzplJujiLdLQGwwPFybkKR/gXz?=
 =?us-ascii?Q?kL92Mz17dvGt2yWj1w7nvZhw6Mf5xdh1KcYr1hDiu0JUmfcAPvvupYIpMuLM?=
 =?us-ascii?Q?e7bk996e5CtPFcFtS2dQhKJT+A/koNEjwDqum42R2nuSEdUgjf17PJ8Z2X0X?=
 =?us-ascii?Q?b+Xsf304LXQingtxmKGmfOrnr1LVyLT7txyDdZ7k7VeyjCWUFiWmhblQHb2U?=
 =?us-ascii?Q?gz+OMHCX0XRrRmfW8NoqJX6Y1PgXm+xnQBzI2mOgC4vfBrbEAzgNRMkMSMoY?=
 =?us-ascii?Q?SV4/39gn5dR5ZDB156oDDpYy95T0vztYfsNzCzsAVBn7zZWoyOXjTh2dQAdD?=
 =?us-ascii?Q?E8NApwgqbqdlwN+sl1xZeazWXOtQxZ+n4BBOOvfyUNCjf4MDs4GlmXstxb4E?=
 =?us-ascii?Q?WOlfBBs4PB9mfjkra/H8BtS1kclFTFhkCWU1LBYdSwKJbhscDenwXwiu0rmF?=
 =?us-ascii?Q?JDmVa43scC4+bGBPZ6wK6mttNmVQso9dLfnh1Mq1JKvETafr1kzdqzxr2XE4?=
 =?us-ascii?Q?pLmrMbeQuxbBgCBbpEi7xZxSs38OlcPmxLimN1WtcX4tiVpamD4O1/zJW7dr?=
 =?us-ascii?Q?UyfIpg8VDKttS9nmCsHSfJPEJaUf10v/Oly/Ep67nrPTD0GpmyWXMVkQKIh5?=
 =?us-ascii?Q?w38Dnmx/6eJC4TU+wNU4ISoboKTJSdDzVUJUH2KjJPckddGNy1q/iJrJXaXi?=
 =?us-ascii?Q?i/DpifdEGv/Tkc3OsUYmHrzw3D4JTZx1Dzo7GOjNYUy7hMIg7yWJKp0f8HRg?=
 =?us-ascii?Q?BcqZQwapEn8vp9yioKXB+qt+Mni15cHmoQ81iyCYqEHYk9ObkucTH5Dhlw1a?=
 =?us-ascii?Q?B2VzL80zInaQtfijc082XWEDfgFgqdLARjpLWnxq7KJ9nKeTElhRmxOjEwpw?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d064a581-49e9-46eb-81c4-08dd5773994e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 21:13:36.3215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kkklkHYrjfpUFJZV8bBX/u8hhDaZ7ySFPn8jop7TErSkBQpUNrrlnFrjtRzpfnYQz/qXAniiK1LSei3mMJOvwuBu76HH3WHdN2yZprEDV5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8306
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

On Thu, Feb 27, 2025 at 10:13:02AM +0000, Tvrtko Ursulin wrote:
> According to the i915 code base and as confirmed in the workaround
> database, apart from setting the GS timer, all XeLP platforms should also
> set the TDS timer.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> References: 2b5298b0aa09 ("drm/i915/gen12: Add recommended hardware tuning value")
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wa.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index e446bde3a52b..398bfd0984c2 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -631,6 +631,13 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  						FF_MODE2_GS_TIMER_MASK,
>  						FF_MODE2_GS_TIMER_224))
>  	},
> +	{ XE_RTP_NAME("1604555607"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> +	  /* read verification is ignored due to 1608008084. */
> +	  XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(FF_MODE2,
> +						FF_MODE2_TDS_TIMER_MASK,
> +						FF_MODE2_TDS_TIMER_128))
> +	},
>  	{ XE_RTP_NAME("1409342910, 14010698770, 14010443199, 1408979724, 1409178076, 1409207793, 1409217633, 1409252684, 1409347922, 1409142259"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
>  	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN3,
> -- 
> 2.48.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
