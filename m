Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B39C25B7A
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 12:32:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E43910EA2E;
	Fri, 24 May 2024 12:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YJLlgJIv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0597E10EA2E
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 12:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716553954; x=1748089954;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=msWdjXJq68QBZw1RVEf4kwkHtnJtU5mU2zz313nKjLk=;
 b=YJLlgJIvCoj6jXViBEaMV5HLKxrA+skSZ4cF442nUtpnNODlurLL84f2
 jdCYAgSk53XU4U7GPg4Mi4ybAmvGehwnLt+8yXfnn9j4cmWZ+HmZwmvFv
 2jmJsnrJGKO7d32Vm5YDAauDg0ar/UjFLvwaqg5iQi3WtOizWFDBVv/S3
 dFpdE9loZjuPSlRyzzKa/PRxdZXbGfjKnFrhU2GPw2ssCo+vxWPb1vL+p
 SN/so5Rl2QNJGwCu56lnTi8YqUOkNo/mg37GTr/bKML8fEVwfqTfbVvB0
 CtyycTcCsPc1lhkG9bQJrV7TS33sgz3XUV93gBPJ2JFEMt8hO1HU9uGxM A==;
X-CSE-ConnectionGUID: U/7mLJNNT16DzBDxsFVvig==
X-CSE-MsgGUID: h0c66xhjRE+L7Geof0LsTQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="23534061"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="23534061"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 05:32:34 -0700
X-CSE-ConnectionGUID: 7q8v2XeeQWmmuzGL1J5//Q==
X-CSE-MsgGUID: jwnBLOeZSWKYW8+r83YjYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="65222625"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 May 2024 05:32:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 24 May 2024 05:32:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 24 May 2024 05:32:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 24 May 2024 05:32:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 24 May 2024 05:32:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkcujKZsX1m0QoG884TKShZ5A8EBl/DVvSXHviQgEyIc6JuF3wf3yZ1PNbolF6uoagzCKX2gJY6QfmYb+Ji4DkWE0dJKBUh65eLKCEyX43qJLulTvFmBFgG4LHAQB51g2LjXitJPhnp6sUoh0jgjD0Aflya1z6qiLuG/XvbRlsrH944uYDjagTeQW9AKSUFjQKZ4CFgu/Mf7Kxjf734jkeHV32uo0go+zLcEWC4w51mIpn7mm6ZcdoBqueCm/MEV/smirbLXgNv6n38J2mV29g/ckDYevCtOYKH/r/yDu+TsVoLK/2RgCjgjqilu1wI2aOZA9c62pbdvRvWCxbZRbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXUkTvS92MCUw3PIa9kJ+SwSfNM/QhFXlgiyC5NyCLM=;
 b=hzRW4gJlQjaborbbazl6f+IQHBT8W63UFTBHQLKSnefMG2YydY3xsT5bCKu5Y+swb0T/dA1PdtOSHcnm1vaE7psExRd4h/qkQB/+HiNTEFd3sZJss1gu5ObCbRs3KWaPWsY0NeuMsR/iaz0CbQb7TSeKllmQPukxDsqiuxwGgw9XKhsKgYfCEtBIFuQaGG+RW4vXJHbL6ltDyCTBxdVOfMo0BXz6oIrKihL5DcGenpnX3l1VqaI8ZF0cpk8+bUOpXiYA2TIFbz9bhr4QsEsZtg0QyBV1qtO6THFTzl9n0lLraouU40XuZN8GwbClmSgcxkwEBT87HNxccU1euM2RNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7853.namprd11.prod.outlook.com (2603:10b6:208:3f7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 12:32:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Fri, 24 May 2024
 12:32:30 +0000
Date: Fri, 24 May 2024 08:32:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v3 2/5] drm/xe: Split lrc seqno fence creation up
Message-ID: <ZlCI2jTQuHHtiij0@intel.com>
References: <20240524071940.83042-1-thomas.hellstrom@linux.intel.com>
 <20240524071940.83042-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240524071940.83042-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0009.prod.exchangelabs.com (2603:10b6:a02:80::22)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: 02f5d5bf-a98f-4bc6-a699-08dc7bed941b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?eYD+qDXiN4i0K6JB+YPLIpr+V2vSc7HtrBZu336E1SbT30Gi32QB5KQk9I?=
 =?iso-8859-1?Q?RzT290tfw/I4JLlBoXZkU3AlBo6isqFPRYbTus8ypX3YH6B2zntVsVw9qE?=
 =?iso-8859-1?Q?VNN/0NPiMJihi+1CVIIGUZ3GHxz0rK3pvSgX2KWWqFiIRE6vk6/i4fbDnI?=
 =?iso-8859-1?Q?XZaaxu9rjDFkKH4rbWdc0fDHVlvO6kkPZgMlnbFevdtnQw7w3t35aKFWGF?=
 =?iso-8859-1?Q?M+T5OJKFpTCKMzsGimdQ4sifNMNqsVdFmfev6tbMRZf3R6pVb2wpyefjjK?=
 =?iso-8859-1?Q?pLrF9Xg+E5Xs6WIltJAWjmEExZ+IiOUSc5JLndR3zx88Pp2UX8tEXV9fOL?=
 =?iso-8859-1?Q?/pYj909mlQf8ubUnGJsiLQSIMJLilPuXJaEonnPCZ83anwSIf5iYtcRTK/?=
 =?iso-8859-1?Q?nKXpRqalphB6mi1W2PrhnP6Ab+oJJ8YlNW6RZiTs08JJE4Hqng+3td6R8h?=
 =?iso-8859-1?Q?E56Zu6PhBIXILkJlZRDv/HXackFC9pjgpLUdrb1wSre7DJZXiz+dWJ3wdN?=
 =?iso-8859-1?Q?qNUlrE0GRLBM4zIO9yyOYwMj9WKeLzpFK1hUfh+mil/siE9r/DwzfAJWtm?=
 =?iso-8859-1?Q?Twg2BnAgHEOdT7OzI9p6DPqZ+kbhmlJGUmTQ1+rLmLf70PZL+3jjmpMh/P?=
 =?iso-8859-1?Q?cGyNfkdVWrpquOfwB+MvpwFjZhB92NCbnnDqhRU9FtCX/aEHl8kWI16+VJ?=
 =?iso-8859-1?Q?R+9tA9sOhDEgvtCTkfReHzAlzMT+qiHQ2Nw/FH8aRW3YyAj7SLL8Ml5ezZ?=
 =?iso-8859-1?Q?iNtu59IYCYdm9a9Kd7pX1Q0CQcEm8nKeSsjliH+DhPluyvI7bNqY7glOWn?=
 =?iso-8859-1?Q?mAEbYkuT5TnXQrmRfFtTTfW819p9yuyf4ySSxznt+BZjp9Bd83kFEQSO/E?=
 =?iso-8859-1?Q?rW7eK8xw1fOKVI1sfZu4A/su3fJ5TtFbvmBVbNIuDPP3LEo6Shdyrua3WW?=
 =?iso-8859-1?Q?+cfo49lNNp4tcHITjb/lr/+wNknRHCWM6HfUKJkQRUiUpBwmJtv8wI7Rg9?=
 =?iso-8859-1?Q?1/9NYcNOJu1iucoP7qRrqrbsNtdC2I4vRCZMsc2Xbh7agG5LSh9rM5E0JF?=
 =?iso-8859-1?Q?ZSUC1aBiciIBDbVbyxYY8W7rAeSfrk/T0p2VnS/0jkSwCIY7KMb5n8r14W?=
 =?iso-8859-1?Q?O81rC0CpsK9sxFLBRuXp40BJjilUyyk5FiyxhgXvMp/1U7eEe9Y5KkIbyL?=
 =?iso-8859-1?Q?tYBSBs3ZRNs3wuoiG7uuCxeQPFyUPVMIjfA5Ql9zdT0kcaV9+qQQ2ud/yN?=
 =?iso-8859-1?Q?5mvhfkeOtU/Qk2DkyLTcpUTWdbPtosxahxRGzCnYrwyaMLTNiRgHvZGI3S?=
 =?iso-8859-1?Q?TkvRthWk2FVLVv2WmYbn3w8Rjw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?cQ0QsNP8v01VgNan0DSSEAEarMOzFPwaCVTRYTlY2w60NqXcYlTk3HYENa?=
 =?iso-8859-1?Q?0xkuNfdtzww1zTTOKq1lPCFzaqRqH2On4JCc/37LSyyL1nY8Mt2EpqvfZ6?=
 =?iso-8859-1?Q?QhfG1C8kG/+P6zrBvqLkz9B/uZK03L9HF2SFX2WVlfzXwoUsJR0QtkpZE3?=
 =?iso-8859-1?Q?wKj+Y+wE000BSOToE7yJI8JGO/Bh64coSdNDJYpy6/tC63tP5iOlpFrj48?=
 =?iso-8859-1?Q?oHuyeZmBY8ob0+P08RuXYoyRs/7KEo3DAptNDJIzl/mDuxSBTAqbST/TEB?=
 =?iso-8859-1?Q?A6k0gA5Mx8RCLvoqoZR0bxyCZQkrWk73v7j0Nn1NTgVxy+kcT2ZW9tqQ0s?=
 =?iso-8859-1?Q?CPKQq5BztdMrXZyUJXACn0zMJ/c80Tk+3IGVTTL4fHVWOh1jduF4HIPzF+?=
 =?iso-8859-1?Q?NxF7R33m9nN6+DRvvJHz6jbXjoHpf/rBCl98huALVD2PPAzo/XbNundVa5?=
 =?iso-8859-1?Q?Fy3e20zz9wDUGsWFvnkmYmKOPXZg1BIR/Uen8uZAQzB/E3oVMB6lsxiTZZ?=
 =?iso-8859-1?Q?TFHA8JlPoLBmLo1kiNDQKAydc0I8kpf7UHW3gX2KFtn3RQFEmfQ8MuTgAZ?=
 =?iso-8859-1?Q?lNjWRcLfUL5CoRRN2LHCIDAfMOxGlnzh8Ma0QzbFvwJpWUpBq8ilnSdO6b?=
 =?iso-8859-1?Q?36G/sjEGlaC/pHCsFSwWLWMZrm//JuHpPOIZKTpveV08Jhl1GphEm/jCCZ?=
 =?iso-8859-1?Q?w6lXbk1VyOapEPcD70YXTLf2wwfPSadAjvqEoQCD6Xp7ePygEzHl+j1hBg?=
 =?iso-8859-1?Q?zBZASLPKZl0Uv9a/ASh3yVthWIguKfxAtxvr8HlfiAUHDzCJPlcUgQe/1n?=
 =?iso-8859-1?Q?XGZOIlf5+o57BAkwDF7a1Peoolorb/esTgUJNFR3gGh3bJCEYB7uLIqHrV?=
 =?iso-8859-1?Q?nyPn6eIMLNLoE5YXi0KtBOnXaariqKoWHnNz1qc3uHJeIXCSdbZ+8woeqi?=
 =?iso-8859-1?Q?VZEF5nloawJSnoz7EcGCigaOhcmj5edwd9vWLpfE47VQR1HekaM2rKb9S6?=
 =?iso-8859-1?Q?oOB1Uo0kSl6sYZns7dI0knROONimY6q+EYmBm1bQVx2f0WFPPfq+sQ1/Eu?=
 =?iso-8859-1?Q?78MRkzy4tNvP7feQAvx3IAn/WYqlVIv7ZiK6S5AJjDIXq9VUpP2oppQq1j?=
 =?iso-8859-1?Q?nTbzanpOeuV1AWE7mPg4067aCwrJYMO+U/t3kQCOHj1BJGUS3Dm2ex7JHL?=
 =?iso-8859-1?Q?fc2zxpLpdQWpx6W4FQyAdiP2TutrGq78ugTK8ojx3w0LycvSHQzOm5rhQU?=
 =?iso-8859-1?Q?oc6Okr+n3EGnbw3IlVVgMFaQQvex+WWhpUhIPxHrGEQulypaFxPHMlMvAh?=
 =?iso-8859-1?Q?mtcvPX+M9RohHAJFHY8GGTgysKL1ny7NwQusuNoWndg+Ey6wzbtbJiasZt?=
 =?iso-8859-1?Q?qqznRQ5bVNTvhWJsD+XmbTfQ0CFxWBeOYbBambnh4xFT3Ta+72LXBbvk4e?=
 =?iso-8859-1?Q?1GnfMT4UZl15mbIVKFwtg+6itBMGf/lQuvQVyDeB6arB3ylhZNoxyw5c++?=
 =?iso-8859-1?Q?kmFe1ObW+wYFRpXFdJUWsDXUXuQ5n1T2CKR5fu3yfG950G3GmIQQQvC8lX?=
 =?iso-8859-1?Q?z8XHnYFmX2eLBK056t3YP6TOXEN43qeZYFXwXxcFSHHvg89dh17WX5JWgV?=
 =?iso-8859-1?Q?sRtLQkhqlvFZmmwr9AH0tXmKS1pGQg9D/f5Ola1Um/N5voFplmQpvwHQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f5d5bf-a98f-4bc6-a699-08dc7bed941b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 12:32:30.4014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mw+mLrii1hFobFeCw+3WsK3X/mm8RYd39OU+fZjt0wVrs5B4aUZhkOOlxKj24B1iHOetWyGZHJdP2d7/dp/fkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7853
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

On Fri, May 24, 2024 at 09:19:37AM +0200, Thomas Hellström wrote:
> Since sometimes a lock is required to initialize a seqno fence,
> and it might be desirable not to hold that lock while performing
> memory allocations, split the lrc seqno fence creation up into an
> allocation phase and an initialization phase.
> 
> Since lrc seqno fences under the hood are hw_fences, do the same
> for these and remove the xe_hw_fence_create() function since it
> is not used anymore.

This patch strengthens my idea from the previous patch to rename
the job seqno to fence_seqno.

Then in the message here and in the rest of the patch below I would
swap the terms and use 'fence seqno' instead of 'seqno fence'.

But other then that the patch looks correct to me so up to you:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_fence.c | 59 +++++++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_hw_fence.h |  7 ++--
>  drivers/gpu/drm/xe/xe_lrc.c      | 48 ++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_lrc.h      |  3 ++
>  4 files changed, 101 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
> index f872ef103127..35c0063a831a 100644
> --- a/drivers/gpu/drm/xe/xe_hw_fence.c
> +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
> @@ -208,23 +208,58 @@ static struct xe_hw_fence *to_xe_hw_fence(struct dma_fence *fence)
>  	return container_of(fence, struct xe_hw_fence, dma);
>  }
>  
> -struct xe_hw_fence *xe_hw_fence_create(struct xe_hw_fence_ctx *ctx,
> -				       struct iosys_map seqno_map)
> +/**
> + * xe_hw_fence_alloc() -  Allocate an hw fence.
> + *
> + * Allocate but don't initialize an hw fence.
> + *
> + * Return: Pointer to the allocated fence or
> + * negative error pointer on error.
> + */
> +struct dma_fence *xe_hw_fence_alloc(void)
>  {
> -	struct xe_hw_fence *fence;
> +	struct xe_hw_fence *hw_fence = fence_alloc();
>  
> -	fence = fence_alloc();
> -	if (!fence)
> +	if (!hw_fence)
>  		return ERR_PTR(-ENOMEM);
>  
> -	fence->ctx = ctx;
> -	fence->seqno_map = seqno_map;
> -	INIT_LIST_HEAD(&fence->irq_link);
> +	return &hw_fence->dma;
> +}
>  
> -	dma_fence_init(&fence->dma, &xe_hw_fence_ops, &ctx->irq->lock,
> -		       ctx->dma_fence_ctx, ctx->next_seqno++);
> +/**
> + * xe_hw_fence_free() - Free an hw fence.
> + * @fence: Pointer to the fence to free.
> + *
> + * Frees an hw fence that hasn't yet been
> + * initialized.
> + */
> +void xe_hw_fence_free(struct dma_fence *fence)
> +{
> +	fence_free(&fence->rcu);
> +}
>  
> -	trace_xe_hw_fence_create(fence);
> +/**
> + * xe_hw_fence_init() - Initialize an hw fence.
> + * @fence: Pointer to the fence to initialize.
> + * @ctx: Pointer to the struct xe_hw_fence_ctx fence context.
> + * @seqno_map: Pointer to the map into where the seqno is blitted.
> + *
> + * Initializes a pre-allocated hw fence.
> + * After initialization, the fence is subject to normal
> + * dma-fence refcounting.
> + */
> +void xe_hw_fence_init(struct dma_fence *fence, struct xe_hw_fence_ctx *ctx,
> +		      struct iosys_map seqno_map)
> +{
> +	struct  xe_hw_fence *hw_fence =
> +		container_of(fence, typeof(*hw_fence), dma);
> +
> +	hw_fence->ctx = ctx;
> +	hw_fence->seqno_map = seqno_map;
> +	INIT_LIST_HEAD(&hw_fence->irq_link);
> +
> +	dma_fence_init(fence, &xe_hw_fence_ops, &ctx->irq->lock,
> +		       ctx->dma_fence_ctx, ctx->next_seqno++);
>  
> -	return fence;
> +	trace_xe_hw_fence_create(hw_fence);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
> index cfe5fd603787..f13a1c4982c7 100644
> --- a/drivers/gpu/drm/xe/xe_hw_fence.h
> +++ b/drivers/gpu/drm/xe/xe_hw_fence.h
> @@ -24,7 +24,10 @@ void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *ctx, struct xe_gt *gt,
>  			  struct xe_hw_fence_irq *irq, const char *name);
>  void xe_hw_fence_ctx_finish(struct xe_hw_fence_ctx *ctx);
>  
> -struct xe_hw_fence *xe_hw_fence_create(struct xe_hw_fence_ctx *ctx,
> -				       struct iosys_map seqno_map);
> +struct dma_fence *xe_hw_fence_alloc(void);
>  
> +void xe_hw_fence_free(struct dma_fence *fence);
> +
> +void xe_hw_fence_init(struct dma_fence *fence, struct xe_hw_fence_ctx *ctx,
> +		      struct iosys_map seqno_map);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index f679cb9aaea7..c28796cfaa03 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1033,10 +1033,54 @@ u32 xe_lrc_seqno_ggtt_addr(struct xe_lrc *lrc)
>  	return __xe_lrc_seqno_ggtt_addr(lrc);
>  }
>  
> +/**
> + * xe_lrc_alloc_seqno_fence() - Allocate an lrc seqno fence.
> + *
> + * Allocate but don't initialize an lrc seqno fence.
> + *
> + * Return: Pointer to the allocated fence or
> + * negative error pointer on error.
> + */
> +struct dma_fence *xe_lrc_alloc_seqno_fence(void)
> +{
> +	return xe_hw_fence_alloc();
> +}
> +
> +/**
> + * xe_lrc_free_seqno_fence() - Free an lrc seqno fence.
> + * @fence: Pointer to the fence to free.
> + *
> + * Frees an lrc seqno fence that hasn't yet been
> + * initialized.
> + */
> +void xe_lrc_free_seqno_fence(struct dma_fence *fence)
> +{
> +	xe_hw_fence_free(fence);
> +}
> +
> +/**
> + * xe_lrc_init_seqno_fence() - Initialize an lrc seqno fence.
> + * @lrc: Pointer to the lrc.
> + * @fence: Pointer to the fence to initialize.
> + *
> + * Initializes a pre-allocated lrc seqno fence.
> + * After initialization, the fence is subject to normal
> + * dma-fence refcounting.
> + */
> +void xe_lrc_init_seqno_fence(struct xe_lrc *lrc, struct dma_fence *fence)
> +{
> +	xe_hw_fence_init(fence, &lrc->fence_ctx, __xe_lrc_seqno_map(lrc));
> +}
> +
>  struct dma_fence *xe_lrc_create_seqno_fence(struct xe_lrc *lrc)
>  {
> -	return &xe_hw_fence_create(&lrc->fence_ctx,
> -				   __xe_lrc_seqno_map(lrc))->dma;
> +	struct dma_fence *fence = xe_lrc_alloc_seqno_fence();
> +
> +	if (IS_ERR(fence))
> +		return fence;
> +
> +	xe_lrc_init_seqno_fence(lrc, fence);
> +	return fence;
>  }
>  
>  s32 xe_lrc_seqno(struct xe_lrc *lrc)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index b9da1031083b..7a8752fd8484 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -44,6 +44,9 @@ void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
>  u64 xe_lrc_descriptor(struct xe_lrc *lrc);
>  
>  u32 xe_lrc_seqno_ggtt_addr(struct xe_lrc *lrc);
> +struct dma_fence *xe_lrc_alloc_seqno_fence(void);
> +void xe_lrc_free_seqno_fence(struct dma_fence *fence);
> +void xe_lrc_init_seqno_fence(struct xe_lrc *lrc, struct dma_fence *fence);
>  struct dma_fence *xe_lrc_create_seqno_fence(struct xe_lrc *lrc);
>  s32 xe_lrc_seqno(struct xe_lrc *lrc);
>  
> -- 
> 2.44.0
> 
