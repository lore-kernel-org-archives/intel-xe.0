Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D0EC636EE
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 19:25:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD32510E5BA;
	Wed, 28 Aug 2024 19:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CncC7PMj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90A010E5D9
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 19:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724873113; x=1756409113;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Htrm5dkZz5GkY8ov6W4a1E+vAsM83Bv+VJDc+jEPsEo=;
 b=CncC7PMjDRXrZMGbTECG+AzSMzUvkeFtdpaMFTjT7OT0lPZIAlpH1U5V
 DkGOLm2+HKn2hY/ivctvC98aSj0YdDyVROvuk5UAFvVMYRkjFtDWd8Kae
 m2gzv2RP2Mjnm15GIF6wcbZvLrbBbpNa9c0IOMB8KfSIQTgVqtCoei8wd
 hkbhqPD39jB3DB1gAZnuOxyDG/kuCFUfY/b8zWjvHVOUfgo7x9bztFTWO
 +zOpOINYrhzC0pXIeQOA5GfTVyJNDpBmk2Z0EqUPblmSSeUcr0ZujAU0s
 Z2VlVTSA9YihquSR5O5E7h9NEJyeXSxbIlimWxbPEqK3BLZshsnBUV9hz A==;
X-CSE-ConnectionGUID: 9OOAFHedQ8izP9eYbs1UvQ==
X-CSE-MsgGUID: GFJcKa5ZR8+VnK77EOtGuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="48812785"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="48812785"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 12:25:12 -0700
X-CSE-ConnectionGUID: 03uCl+A1Tj2PjfPgybKEBQ==
X-CSE-MsgGUID: jtF1Tlc5TeycbQ2Q3dguCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="68227979"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 12:25:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 12:25:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 12:25:05 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 12:25:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXdY90HQSCRk/bHHurJ6ivbbzqWqFBsaRUeot5/wKjxT3ZWnT7PkkCz40SFz7RALRHBYlZCJRlq3Cv4sWYnPKuUF7tQfvv5vKLuJPdYCTwGTrYQP9DtpCHL2Vhq4DdmdPRKenHG5TO6X/u9XspksTVFTw2Q+SnNN8WRYGPg1Y/zc7S70sLs0hhRO8RLg08m/dqRWheMGdtHx1JF77xhLpJs74QouOH3DhzvUGz4+rTAprgNGDD539bDvYGCUGSEeouCoOJetSzloQKGX+2yZTTNlP/QWNjMiM6jwV+3fvHp+fG1r+vfvJJg4//V1okNEBv3hu20dzuAzX+sqtTqPZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Htrm5dkZz5GkY8ov6W4a1E+vAsM83Bv+VJDc+jEPsEo=;
 b=s3scpsA9ruUrHzoSqwSQgsKAGAseWpxhIEIg5Y4EL1OEFmy9iR4XbDB3/dX/zrUfvuwr0kmwjHZ5vi3MUFXORT7Hr9L9HTfio74heBlXAKQTPRWe6ZEjRf0zcXuBXHVCq8hYiqEr6KwU026znjcIBPo9qY5q8YjiUprYjiVm6ISHT0lWx/XAkz/rbbEn6rbJPwbX7uWw47OWd7zqaAXy00Q9Y1HxtR3LAtrWN+oenxG/xSvXRc8g2ewbP4dLw3eLDWvpnuP37Ybx8Zju+0fiKx7qvRS8E+aJGvsd4aMhPnEUOQbXEHktTj1Fw/R0CqGqg7LJoai/VQ5w//YqXSuxAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CYXPR11MB8753.namprd11.prod.outlook.com (2603:10b6:930:d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Wed, 28 Aug
 2024 19:25:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 19:25:01 +0000
Date: Wed, 28 Aug 2024 14:24:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 0/4] drm/xe/pmu: Enable PMU interface
Message-ID: <fst3oetabr5ib5hcps5d76gna3qhvrngfocrbvmwzdmhpuz7t6@ubkora5x2y52>
References: <20240827164107.47034-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240827164107.47034-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4PR04CA0216.namprd04.prod.outlook.com
 (2603:10b6:303:87::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CYXPR11MB8753:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c4541a6-8e1e-4a5f-7ed5-08dcc7971c8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AfQ3RyE66PMLDtbW02MYIQkpcSSKG9Q/EDPJmKhOfUFjmBiBsWxpiN0TtziE?=
 =?us-ascii?Q?3L9QHk40TJltyEKRgGeX6VPdILbVo1ygN12qtIQ9TfdskHv19goX2Td5u7uC?=
 =?us-ascii?Q?kkR32QZ809QEFhlFIaZaCkO2hs1aGQ2WE+0G8KVDPf+Dd7RSjKqQwV8d0y5U?=
 =?us-ascii?Q?CKXau0j2qg4c9q5RvVpoyAuuDeKKzwRvqrVIk48BE6Lb4G3sNRao1p1D/Mwq?=
 =?us-ascii?Q?0IHTV+KLGHssuQQi1f12u0Zmw3bdjJD1B2BTUxFJGcTE3pRX0Zt9as6prGCS?=
 =?us-ascii?Q?uJXTvI2NmxQzKy89SacclWeINCCCh5T80YkQWJxElkgZc030xUWqW9c1U50I?=
 =?us-ascii?Q?MZmpIT9R++M3v/Ju7RsF7rRiHERi+7ARrIqhiKgFKxs/+Eayh44nUIcIMO3D?=
 =?us-ascii?Q?hxRtDfQNVv8+M+9VsFngZOPjFnQKdVXsphM/fjS0lVstvwrp8AZMZOB09fsB?=
 =?us-ascii?Q?pbtbrh7ftXgzLgxRPd/y80uWRe3mTo0go7jKfmuUUu50XvVwwi2XW496u7lq?=
 =?us-ascii?Q?PWCRtmtqkZbbrLB+VAmW2GtECQjATV1DSJKtW+b/xbaPAVAh+yLSgR6syF2O?=
 =?us-ascii?Q?j5yq92h4hwmcSUduLpRO5H5LokBy8IIdt1BUVSaydnRCQKRcMOw4o7a+nSB8?=
 =?us-ascii?Q?F9cL1eBh0mVK77LBEwP/zsyUZfQcKMB9J9h0LglkFoPfk+K1PWFeeaFTT2uL?=
 =?us-ascii?Q?FxRaTRIVgnHFPP9CaBdzYRiE/wX125d0L/QuGe2Xr3bEL2iGXY8BHi7nBwmf?=
 =?us-ascii?Q?hrlJ8X9/IvfeDKDWJwy3Zg7mOBOzDis7tq7+IVFot5qKlmLqPYUAczFK6Ng1?=
 =?us-ascii?Q?zZHeWcMvK5KHAMuWrTo//Fxj6FWMI15k0vEMwD6QigfD/teweEvNUoC9oXev?=
 =?us-ascii?Q?geFESWEZdeYQ+SRil4t0VjZqe0d1Z2NbqlFvoOPWDcHPSfOmN8W44VlofRZU?=
 =?us-ascii?Q?ZJhW50WclTY9nLsH0F1JEHDuB7KUObqV671WyAUgqtioQYG0X502A9OZ5ayb?=
 =?us-ascii?Q?tkviPt83TBcgpwTI9nWqm3DWpwtZ7bnMDaxmudQa2ElZGuPWTGMlq5LRHNaJ?=
 =?us-ascii?Q?n0bFFZl5tp86UhMXLKbG59z+J0Rcm4PmfXH2DBVwyR9A0g8WZXmxbuPly7vx?=
 =?us-ascii?Q?gLtJxLMgxvIKyXKL+LS753G/nsv+wAhs6fvkEHkoqoWFutEBs4JM8JgUxIbD?=
 =?us-ascii?Q?8fHWEHs+veazBqLZSE5+zHtCYNBCB6mLcoG0zW7sDdchELIfNif17DAwdwRA?=
 =?us-ascii?Q?c/yASQ85wdY5FMjId1yxk/0bRXNKR7FxUV8CQ6Sr55yD+qC4XgYLdJELPGsZ?=
 =?us-ascii?Q?Of4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PzAr5p27xPYpj3FIby/zHN5qMwIPYA4+R4iUPfbQ+PcDZZvCeBGMuVXMVyhF?=
 =?us-ascii?Q?IQ31n2kwcWNy/ntl2EgY/5lgz6fQOlst1LdNlynwD7pLNlierVDgpREGiZyJ?=
 =?us-ascii?Q?CprvPY6mbeYFnn51eKv/wXT/NheQnXAVRdrb16lCbsUxofYHGMmKpsf63Hme?=
 =?us-ascii?Q?eacK+FYb0dsOUL/Hs00F+2qhuc6Jj6W8Zb2MS7FiuBv/yLDIEloizyxayx0K?=
 =?us-ascii?Q?tbE6XaW3eEBQTgFsh4G3U+NDhLztiF0qsdmIT0ZlMpEuF9VqYmQwARZbwZ2j?=
 =?us-ascii?Q?SHkTJCCRFoZbs+sYtevOrWZlNskndEkXG2/GFzbasJukXEzgHvGBJRdLVSD8?=
 =?us-ascii?Q?Ipnc+gKYAewWAE7wH8ziQx7pfTSg+7eyQ2Tq4eJpezvHhjAbCIJ7myBMtpmn?=
 =?us-ascii?Q?fPBZq0CgIJbdAEWllYjFYSZr7e2LtUxuPzbmuxYgNlUQ7AI+m/peJ7Mmthl/?=
 =?us-ascii?Q?L92aBqHLR00OD2g16c2xXtxGJeTP/kS/+mZsQkgAemAa15Gef/TQRc3Vub61?=
 =?us-ascii?Q?Y8ha/1QAJwWg/rC/6tMEkkdgzOiD0s2ElXf5ndNMWyxm+jE2J8dzBDaJTo1l?=
 =?us-ascii?Q?d8tRaLC/pnC9Wn5Vo0zg4fX+dxinnzZWB/yZcMsv1Wf4wz5bVW68FHGG28Ks?=
 =?us-ascii?Q?80meQnXxzPnGb5IEoWKUnF8yOH1+ZWYa5F+/Nv6Xk7SdyoucI96w0lfZ6xKm?=
 =?us-ascii?Q?eIIbzBUHBECj4WiPQ8ckRe+zM2UpVEJS9Jgqzr6deDbFkPO+Q4Soh+XKzL5f?=
 =?us-ascii?Q?pxJO39wt3jbhJ0yRpIJ3IntrLDIc5YFrJMeM2cijIXCArRliWPyQvzdRmgsL?=
 =?us-ascii?Q?d3j504sLkggMylTSq1izmF9XTWvd11qMZxvPJ+2c1HfdItXVh9vTAKTb+4T9?=
 =?us-ascii?Q?gfDnBD9VrZWVYyqCRqfJSWZJETWSw53o395mzAZ9MR6yKqU9MLTSGT/rQcYS?=
 =?us-ascii?Q?h4DAiTGb7DtkIjiNOHbc4t17ByqUngR2HxEL6B7W78Y6DtsQjSmCLubOwvyI?=
 =?us-ascii?Q?aFQjVQmcAvEdSfk3MnmEIIZfIVrGCClzaQP8YuWHjvCawenodzkZNkhJh8Cn?=
 =?us-ascii?Q?lvnYQQJ1qaAe1eg1XfGyUh7Jwbpok/0ybvVTNPO/nsHPttlA8IAE3oh5tj4/?=
 =?us-ascii?Q?Qh/r5SeL4qzpU2vqPrC+hf22i0LDOVHKjXfgomFFlv+nbGpspWNiWxliDd8D?=
 =?us-ascii?Q?PFsQ2ICkk3wDO2cAjLSS8+rr+FxBJhFIqyZEeYL+E8O9wZmxy7DSYNQF/CsB?=
 =?us-ascii?Q?D/iTBQz6csVFbwljAh/VxibD/bT1aWkGR3/eE+M3/2Efosc2XcQmV2m27oLA?=
 =?us-ascii?Q?q2qS4kuAcP1YOWFkBKkJjV2M1ipEzKubv4ScK3/ZgLYI6HCPc7VrdEt5ojqm?=
 =?us-ascii?Q?epItqNswKeU5+LtJwl3BearTMdNqJ8crkgJVutQUvCmHnJ8A6IeGluLzPu37?=
 =?us-ascii?Q?0Txddf1+XeQ7C22zQvl6xsR0/9kIQRN2s6x95cFaMdUadp7ujPd9Sx/VCoBg?=
 =?us-ascii?Q?D8U8kIEhDdYmlrU/aLy6UrOWsP/P0J/SUI8k5qDsERyEdSmpiztgMdBTEvem?=
 =?us-ascii?Q?OjMW7jWvl3wUVGQliMCNCtA0VA/vAzEFv4pppGDXkK2DactzEgzdYJgSz2i1?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4541a6-8e1e-4a5f-7ed5-08dcc7971c8e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 19:25:01.4295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QPwzcwmtdiaM5M5ZMDunSECGVM+QHlNRP7n5eJx4PoFXy7YfeJvx/nAPQTCpkh91aClfTDatGsPPOuWAUZ5+kEyD3cXkxhM24j44DOV4efs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8753
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

On Tue, Aug 27, 2024 at 09:41:03AM GMT, Vinay Belgaumkar wrote:
>Port PMU event capture capability to Xe driver. This is being
>requested by users of tools like gputop or turbostat who
>use these PMU events to monitor GT freq and residencies.
>
>First patch is from a previously done review-
>https://patchwork.freedesktop.org/series/119504/ and the rest
>of the patches are ported from the i915 driver.
>
>There is an attempt to break up the code into a few chunks
>so that everything is not a single blob. Basic PMU setup is
>done first, followed by timer init and then C6 and frequency
>events separately. One change is we now provide a modparam to
>control sampling frequency.
>
>A patch for IGT tests for this is in progress and will be
>posted in a couple of days.
>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

FWIW since this is copying parts of the i915 implementation,
I'm going to block it until that is fixed:
https://lore.kernel.org/intel-gfx/20240722210648.80892-1-lucas.demarchi@intel.com/

Because we don't need to replicate the same mistakes and then have to
fix both. I should go back to that and send a v2 soon, probably by end
of this week.

Lucas De Marchi
