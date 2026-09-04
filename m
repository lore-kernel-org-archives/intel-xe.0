Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE46FC79F82
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 18:18:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A783110E56A;
	Fri,  4 Sep 2026 18:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WxeDIOIq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DB210E56A
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 18:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788545924; x=1820081924;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OhLj8gp2PPhES61z0SAg0Xwr1f4y0yOGGGPeDGPL3sk=;
 b=WxeDIOIqrdsS3N1De5lV4LHEmF/G6lXB2QRMsD3HnX+SapPZ2THNUkQD
 cpDbGa4pcTTYsyjFwBvvVmlmamR0y1zYT+NxQE9sQAYbMuimsEAd18dR/
 zQN9gJiuRORrX5TChTXndwozLXc2GbWh3cyHEzNQCyKpQbPzDXjrJmgGZ
 tIC9Aajd0WMl0gl89Jx8pz2iHCBWc0S/eoIMdt57Dng0w54cslT5aYNI0
 uAs7cYE7t84YGRuySYmWvlXbADDq+WgRcwCpRmvIeQHQwRCrOfnD9h3Dh
 B34leaCFT9CI4MvHNtg6jBe4FaA4OyIQrQ/vfa3K5fGH4JAFNkqCuWYFw w==;
X-CSE-ConnectionGUID: iRtwjosmRAyJHXMDG9hkdQ==
X-CSE-MsgGUID: S4W4xC43RaSk+XZjPCEHlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="92751559"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="92751559"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 11:18:44 -0700
X-CSE-ConnectionGUID: O1bBb3qFRgW6yaE6hr72pg==
X-CSE-MsgGUID: z8kjTNTDSM+UA09MExp6aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="270634166"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 11:18:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 11:18:43 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 11:18:43 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 11:18:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1xL9F4d88WZcj0USXVCsHIZwe0FyugfAo9AECi8C3lWzRWRHa34d9NsGaOz5yo3XhyHOcVQYq+dIryPNUv5niPPObVlbMzdepknENGziqmwEJ0BZA4Y7ci59r1L94IcHgnVRGSuBHb1lxcRJ9B3NQQ3ZT1mlVuI12cD/reFjNJTnNQltYb0frEVuXOhbSuiQbgZzJzn68neAt90W7e3FbHseewRyriaIoyWtVPzrZoGoVLP3/v1EdAYqx/lcRU0VcK6at49J5YTGlOS5WSTLx3MpnX/mu0oEUp7INBwBMWl0wOMapLO4NpqiQheXqaftVo3+KY8mCUhbuHyUzuMqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7x7OMfqOsOBbyo3lTxB+Qd1mq2Qgob7JQwKQfoQvhw=;
 b=wjhdtpvifKkum7wj6TYfP7X/edLlrQxv/2uq5CVOGqwQ8TJAyolREeBntU9CItl4iYpLJ5lzFNdXmx1k6aIGeQlgI5J7hbFDVtDAxGA+/5LD95Hqfg3gR5sEv2tRNjBfYoSejLFPuTG0jz6aiBmBEiuuIRG16G0L0gPeD1VSg+wiLhzPWUx9unumeQbvAi8PtU0NsdhwvvJ99IVnoPVo88nea2wKtvfBs6BR9XZY0XrsWxLDIRSlqLueeDgU7P4BsGRnlmPnj5egkWq7css7RGeJJbjckfXGWnbNKuViMuOo8k7PBBMvz63Xl//TRL+hMP5sHcHARJ7etK7MowwBRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPF453C3BEC4.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 18:18:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 18:18:40 +0000
Date: Fri, 4 Sep 2026 11:18:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jia Yao <jia.yao@intel.com>, <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shuicheng Lin <shuicheng.lin@intel.com>
Subject: Re: [PATCH] drm/xe/guc: skip TDR timeout check when ctx_timestamp is
 0 or 1
Message-ID: <apsLfbXfIYuJgKUl@gsse-cloud1.jf.intel.com>
References: <20260904180943.3455267-1-jia.yao@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260904180943.3455267-1-jia.yao@intel.com>
X-ClientProxiedBy: MW4PR03CA0359.namprd03.prod.outlook.com
 (2603:10b6:303:dc::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPF453C3BEC4:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fc49292-7395-4d6a-b92e-08df0ab0f25d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Zni27URJlYgtNiPN8+Z9xvteMzDplQLq6E4SImTdzlrK9USyehyeAZiFogLvoemg+KkEJESjInvHisYxkKfD6gpQlLFvuGfVeK4a7g1SuPEpxmdNG2VoKxAHUrStNjHNKIVaHwLsJK1D2y5yhQtFZQ9lm2i22AOzdTTCe8q3JkYZJ+IU1xvujCBa+5cfLtWhVGCXsAu0FdW2Qq+RBI/7QwxYVN2uqR2gP2s0Q0KyjQrwwaeqD6rfuFN1PnEYimjj6xNzPfBsMNC28JVAzHIXkBGjGXqP9sco4nRB+OmOHL7DTS6JwwwQAih+ZwpkhNny2iJhldUWX1599CwUUf5EqmVl3CxPDr88SXSyVfDeyQiGDHDvduZ8QCiPAVVavIDM1dxAcRg0zCdbDz4ESXGDxxNmFDAP8NQUGddzrr1C8gxKNfbpY2Otc0pAte/C5rMkiGcYq+Qt1U+lqTKygTHzJtXxPEfkqnPfCSwW0nMJ85n2yy5YuJetnmUlB+I1WdlZJQ5D3ufKajlXTQOPDunvSm3VLr6jGk74Nv0BUBZfsDt7qKoAwORuQMD0gHEqSqKSNlSTiH4fNjNEeG2mjYVng/YJBtSho5rUpdHSkHQXh5FoL3nl9kTCgldgvz+SZMiLnQfevGy6lzNDMKs4J36E/bOdzrcBmLxO4qj8EcrjFKU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?elZeCFDAeSJkJy5faDejKwHdITYdmfU6EHfnU/iBa6783mBxkgqTatjnwYl7?=
 =?us-ascii?Q?uYof4yfWcKaLcZU9flzje3TldbFa4Awwy4vpll+Mq28alRF2DZshaXJUKnS4?=
 =?us-ascii?Q?CxyXWZoXfP9zUl7BQwCDGj0OW91tNNBj7C98INBSoubA06BtokkcjvupIdHc?=
 =?us-ascii?Q?JM5LS20KpFZZsvK+TNVaPY+NdReK9anMudaqZllzCBs2wAbcVbv+qbXZiT8D?=
 =?us-ascii?Q?nxr7c2P0KgFA2eVAk5lVN04X7xDd/DYSfbdKD2Oi/oGCTw6oLhiOitBsS+jj?=
 =?us-ascii?Q?67zkB1w2EJxhoUo1W7wBnuLz4hBkVQ0CGDmUf1wFcwG/vwFthXUTsvNiZdPs?=
 =?us-ascii?Q?d0+FfuSV1Im2mt3PKlL2k/M0FMzF/JaTn7p68xZDUwrTOSar9Mx+QsEzcrmF?=
 =?us-ascii?Q?fGrPvlOo3Nmx6Duu3vrOYof2z9lq3YkrfBW5qY9B6pp2T6deZpl0fAfAvevu?=
 =?us-ascii?Q?d2ytS0PHdEJZfLF/weYKU4vwHd0wRF/pKKQFs3tObanBeFBKrypyLUfgAfhH?=
 =?us-ascii?Q?WCumlYkrcFg/4cuH5R9iyBgVc1acHJMQzgkEfcNJRKAnVAZENhaj1QEmEHFN?=
 =?us-ascii?Q?UFmy8R2nUDy3+82q+QsCzSifTeAv138/qq9lFJCMfvoN0VGrxOjo7HAZISSQ?=
 =?us-ascii?Q?/iAy/XBjwQVISGkYYKItB38gNeu1RWUdkhVGLCLaE39sPg71YA5AlaR37zKg?=
 =?us-ascii?Q?nEX3tv5rq4zIaweYNwzRy9pN7NPaHV1nQiim+q+lpZfn2FMFnsnZyqqRHnoK?=
 =?us-ascii?Q?v/+tTlOmoFbBBE5iOkGTvVd8QV15OD42sCHnLm2sb2OEpFhxbeDQ1Hns0sAO?=
 =?us-ascii?Q?Jq9jltsRfrmCGaUOBbFyHL3qAn9M8d6mjMGvBAqUeQ7tVysFvRY+c96b1Nki?=
 =?us-ascii?Q?gFkLGBlEJAhVvXsjFmIzPueVSQ4DPY7bCv3veuo05Q5jI6Ghky9o89peXezb?=
 =?us-ascii?Q?AKm0x3HMuFRKwH0Dy+NjfuRGhH3DXjArij6sL5K3cdRrhsSYsExYFk+crEii?=
 =?us-ascii?Q?K3sMhVu8VLN09jcNRvJVNbIZ8vgSvFwDMvg/EYqUB8mirBiTbabTd17Ygy3x?=
 =?us-ascii?Q?PinnH5BfNiBmL1O2F8zeu37BKMD133DTRQUOLW5+0oSMSL/yM8QcEWbAnKWt?=
 =?us-ascii?Q?YLxK4SfetSaDxfgwLl+amDyqMMgtTty73HoMugThiASVlida2NGarqfWSdsv?=
 =?us-ascii?Q?9fyxuY8D7xXYmRJXWDyWdCoqG+6qtCMCo35PPibEMlK5vmPhV72R3Beft1HL?=
 =?us-ascii?Q?3kUN6Cx2RLbGLDMGSK6cgqAwZWllkG60zpyJSn4nA20YS5I6sTZ500c7s47y?=
 =?us-ascii?Q?y/wrdD6qlHXYe65N/hz1wM/mMXvqXqikwxmMnCNIYUFwcIvByvzTKoN/JkPN?=
 =?us-ascii?Q?PTAi5Xpiet9KE8l6WabKE8Pz4Y0w6Pnu7b/cjusogJgNy1o7o/Y1/MIlXsrI?=
 =?us-ascii?Q?Rsyqki6PIW6we0ZoqjRTPyUlq88E5OmvluPkD8BAHsIg86YP5L0t5pi4k/09?=
 =?us-ascii?Q?P3cE4+O66nYFLFgxSkODoD7oGLnBazb8UEtHQQVq1KGxiGWVcFslaO9/0J2k?=
 =?us-ascii?Q?BLJMr+Q2dGzdrcGSpE6wVT+auN5zwXQWoXfJoZ6gz86VX0rEn9I14j4HnzTL?=
 =?us-ascii?Q?mfxXEkXgp2IA/rXVWz0+5LOVbvo0oVWzdJi0int4NnjFHoMSz/o41y8bdL+m?=
 =?us-ascii?Q?uVtzphbfwbJjRs/bhs8EOTR+3AF7cdjHt4rNjQnjqBJ9nJzPDAtU6ix9iDC1?=
 =?us-ascii?Q?vPH8osqDnHXbxDJppxecA5yOJqEnm+s=3D?=
X-Exchange-RoutingPolicyChecked: fnsOtXQeEJHrU2tKbW40lHdNirQrQG+qhUtaJdjotIKlkV89nWAwAKmqw/yiHjbk6gpN+fj1OwV1zLk4FQ9wl3dkSha0SH/Cc6hS3BxcGOjvw1Qg6uWgH4JZjgIg55EutK0arI6bGIwwxMmAtR00nNwo09nmEF/JPv1i4ZJNIz4bKkHSJHk3g1z9diAMN8QQKvPhRIMwv+VxzLUfmRyXbouG/mD7ZlaarboypPhCMzZj9WH5BBgGjAcG8AXHf77vupjbatpppQORQYQq8BITiLxoPn11N3EuT5znLAAXq1R+1dU+VZpq+nG4CRAd9DS/cJ/IJXAlj+1QhNVVy+LKvw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc49292-7395-4d6a-b92e-08df0ab0f25d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 18:18:40.8332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgB36n43GOK6FH2R/BkLZuPzNs9CgapmPsE3R9sb6vhSV9C6KWJS1fP0sRBtgCvnC/FmY624VXHe00ZjEP2xww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF453C3BEC4
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

On Fri, Sep 04, 2026 at 06:09:43PM +0000, Jia Yao wrote:

+Umesh

> A ctx_timestamp of 0 or 1 indicates an invalid timestamp:
> - 1 (CONTEXT_ACTIVE) is the cookie written by the WA BB immediately
>   after a full context restore, before the spinner has run.
> - 0 can occur when lrc->ctx_timestamp shadow is uninitialized or was
>   last updated while the context was being restored.
> 
> In both cases the timestamp is not yet valid, so reset the sampling
> baseline and wait for the next check_timeout() call.
> 
> Signed-off-by: Jia Yao <jia.yao@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 0a6e2b81b5a5..caf02d265533 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1429,6 +1429,20 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>  		return xe_sched_invalidate_job(job, 0);
>  	}
>  
> +	/*
> +	 * A ctx_timestamp of 0 or 1 indicates an invalid timestamp:
> +	 * - 1 (CONTEXT_ACTIVE) is the cookie written by the WA BB immediately
> +	 *   after a full context restore, before the spinner has run.
> +	 * - 0 can occur when lrc->ctx_timestamp shadow is uninitialized or was
> +	 *   last updated while the context was being restored.
> +	 * In both cases the timestamp is not yet valid, so reset the sampling
> +	 * baseline and wait for the next check_timeout() call.
> +	 */

This isn't right. `ctx_timestamp` is the 32-bit value returned by
`xe_lrc_timestamp()`, so 0 and 1 are valid values when the timestamp
wraps. If you were checking the full 64-bit value, then this might make
sense, although I'm not convinced of that either.

My understanding is that `xe_lrc_timestamp()` only inspects these
special states and takes additional action when 0 or 1 are detected. As
a result, those special values should never be propagated to the caller.
In other words, this is not a raw timestamp read, so we shouldn't need
to handle those cases here.

Umesh to confirm my understanding is correct.

Matt

> +	if (ctx_timestamp <= 1) {
> +		job->sample_timestamp = U64_MAX;
> +		return false;
> +	}
> +
>  	job->sample_timestamp = ctx_timestamp;
>  	ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
>  
> -- 
> 2.43.0
> 
