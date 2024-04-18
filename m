Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D757C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 20:12:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA9A113FA8;
	Thu, 18 Apr 2024 20:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RrlTqQvj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5E0113FA8
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 20:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713471152; x=1745007152;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=coUSJABBPgqked9n0BwzktMCzU7v6znK6RKPulRPv3E=;
 b=RrlTqQvjZq4ECDjfHcQWUi+8sWThjlBnyMRd18ix6xZwlFvYqMw6roVK
 QCmtnCbux6POxAq+r0jchCS/EbeZkEM7KCi1rwskf6zacFrJo5f5NvGEE
 kLoTGNgS0Tj4PiTjWF2OM0O4QXNt12tawnoASuVBFfjU5gi9UiKYedtIq
 DEogtfwHboIEilAdWn5Xq2Et7EOeIn1eBuwHj9uVxXyPZ8q/QN+UEyeIx
 EdX5fyHQpzavODdVbUpR+dY3pT2liXl1hW6YHZjfq73CtGxCzrGpp9TlI
 K0uIJEX4aLDZ24TKgLoRma7L1Juk00aWazt0t5uCPpbJ6dVB0U1pHjEq1 w==;
X-CSE-ConnectionGUID: ixWWG4WHTb+mZiUia45M8Q==
X-CSE-MsgGUID: GJGD8cxYQQi4dW/CBysD0g==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9163441"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9163441"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 13:12:31 -0700
X-CSE-ConnectionGUID: nm2Wm4pASUWQKbDDrF8eaA==
X-CSE-MsgGUID: 3fnz4DPyQrS/2o8ujoDuzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="54018128"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 13:12:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 13:12:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 13:12:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 13:12:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fp69PqrLm8ROe7C911DY5a38fTGzrD0SpjLukRdYUtg+Q6rUcuhygStkYmdRxanFzVX0X4vMO/NzEou3MIjPQ93Av0gB5+SRev5jE13t5axeufhs9XQsGa+tbnPRM49CNU+ySx+tQR/HzN0muAFxZH/neXywWqQctm77K2R/ia6EP5KVFILaPyjBJMNoZLgKbDubV1pDYUFyCfzFFAOywuhOJEoSJOickPADCPSzv0PLkZfOtKbiz4ge8crGGyo4uXE5gERGu6DEC/KpSw67hadZyie/D3PGeCvSZR0DFB9d+jDKjBYricx7F2HaESYN55bgCsc9UUE9iS1+15unig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dzo08wkhzZ32dnkKFrQJJyOv29/0mRBpZ5HcDHtdQ6c=;
 b=FGpKliQXOTkqGaL2SIg5m0c7qrMrkGS2gfglEu5FTpEBUVReXQvWIwf1IOeOpD46/c8UV7hgFlTvUO96ZZp0ZeZUXVSdZ3BM4jhr8D7bvalRgZEJEYDoBOz7jDU/RnV5RyEJBnDfYqjKEdPRf9ZXWoixcBrjuEhRL2De1MusilRBigtkpw2faq0ai9Zsh4LpLqD0QW32I+lJYclTL0uMmTvkhjjMK0kuugrcisOv1RMzPTorBtjCYWfhaxCjIywYkVMfyBrqvpTmktdBerZ9YlPVPuVGXciQepErOa62yPI66cgX08lY5QK/xYTgCbwIwy9r+D0M3H0kbIxM3t+/ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB8188.namprd11.prod.outlook.com (2603:10b6:610:15e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.12; Thu, 18 Apr
 2024 20:12:27 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 20:12:26 +0000
Date: Thu, 18 Apr 2024 13:12:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: =?utf-8?B?4pyTIENJLkJBVA==?= =?utf-8?Q?=3A?= success for
 drm/xe/xe2lpg: Extend Wa_14020338487
Message-ID: <20240418201223.GE2948065@mdroper-desk1.amr.corp.intel.com>
References: <20240417212501.312346-1-gustavo.sousa@intel.com>
 <171341019126.1483981.7289464632855274564@8e613ede5ea5>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <171341019126.1483981.7289464632855274564@8e613ede5ea5>
X-ClientProxiedBy: BY5PR17CA0018.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB8188:EE_
X-MS-Office365-Filtering-Correlation-Id: 18de7de5-739f-400b-3aa7-08dc5fe3dd8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 7tl5ADDZDeYaYCd1GGogyrkoyTTd01KGQu0ijp2d3jvf0M4lAQ31wazXbRm8O9hdhzyopmLfcvTL63iPyuR3M9vN/EZVlPjx05f2wQoRoqHoIuJ2EM4xCsO+0hZMh6X9YmHrzhnZyH665jQVu80oTX8IGLyEZgNsEVBSx49rMF8cxsYhKHZrhetGo+UOrvxvRSVHJWvEPCA6eP00RLdOw2bhYyyhRZXfWtxgHZd+5ERZNHhJU8SkNm1fovPeOurdgGq1RzrDs6qLNn/6paxJGi9fg4n6uja2oaEz+OjC1e+rgvUHC2sop2Sy89zXyIqC39Q3h45cxejTITW8Ci5CFSR148yKHqVCxUjdQ/gUxcfE39vLLM/KoGPCpLivDg0N0GjQjRyHcJVrrPGdZMzV/nevapsJO4qBz5PMmacxFrxYo3CYVyif4aSEmpMziC4bRKAfbX3O3g4OQsFn9wIEEVEfkH1/w4ZaKPkuci95h4HZA+17HPhYvz9a0Xazna1q1G/rMb9dJaC1stm7WIc96pxi7ZHkBXU+ekgCdwNRP+KwFXL7D8LfdvQgRRr/DCy3sVzTzd1EjxSQ+SBo988yclmrLR35rdGXtysBSnIkB9fzdXtsotfaDp9eDHvUcJhJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h16oIDAU1jidTE0szMVmqLDBBDR4fQCf1qoA6IDL+MxaiBnGYTbzss/4XmUs?=
 =?us-ascii?Q?PuMgaFV5d2SxYxKsJFcIoZRNdHWg71/c9BjSlj0RgI4oGIQuooO4xfAaQ3K9?=
 =?us-ascii?Q?RuLUNxyYgM6A5tjRTLNfTJASI28qGP4NpGuESIYb5R46fnUHvoZO5EnTjK7F?=
 =?us-ascii?Q?UZMUa1yI5Z0L2Nf+9iemsCEdrFc5z3wHQ0b+BtowgmRjArskVt0b+RWfw/+P?=
 =?us-ascii?Q?Y5EWYbH5Z6d75kea5/E0ja66Cz35QyoCNY2S5vaF7/risOliI2LU8lUfN6O3?=
 =?us-ascii?Q?qTFvGTae89yWZSxAHeKVvNVA06ICSl2ineajmg5vt94I6VeNWPlIM4DjIQ91?=
 =?us-ascii?Q?GySYbY8yaE33ypuNL3u9uh4p9NkYNVfY+JjQ3mYfgeCROtFXE6Vi1j8hr9CB?=
 =?us-ascii?Q?jI7xsQ7E21oJXttlZN/pXroaRFlXx7rS/pKBnVa+9xbHAQ4rmcVIXR60R6uF?=
 =?us-ascii?Q?P8mhIP9L3yPMaiBs/PK9KeDmJWYM1KAV74DTsoXi5uoPrKlmjaAJ1RpYYAB9?=
 =?us-ascii?Q?JnI8r4Yc/YsKgYD7W/iQnmUkpdMEwsEZaRYMsDktS8V5MhPmFif5M/ns6OrK?=
 =?us-ascii?Q?HPmIZokWOZuA1snZVmv9Ye7n+/uVLXwxPm6MHA+iB0K4lvMI0pY+Ds4bJ/7W?=
 =?us-ascii?Q?tD8Q2dwg0ZLWx9HLZvHgJ/lj4Ek+ZfHQmIb7xmgbjDtw714eL/c+tKQWq5Fm?=
 =?us-ascii?Q?y31M6QO2iG05Imh9EFfyCemYkK/lvTeXK29C7LRjVy/h2yuARnuk/thP2bzD?=
 =?us-ascii?Q?faMslJPU7z3OkASIuRbAnt+xyPEvY/iyakXzFvjKTfV90p3E0cmF3vY2c7E3?=
 =?us-ascii?Q?zuHCGwYshq1F8jtKExNDjX+x7OWW/2pClUSRGdKAUSQN3muaEd/KV0OkFHfk?=
 =?us-ascii?Q?WO8W+9g1RnLgI61a7/XQiR6TGmGWiOVa5o3YmepS2xx5r7YUjryIn5Cqmn4Z?=
 =?us-ascii?Q?BeucL2tRfGQ1YXId1s1QrQ2NJcKsAv1WSOByFQnakWKM8BYkde5ulSvbs5Dq?=
 =?us-ascii?Q?kxgCje49mw2rm71bSyzhmWZtulkEiLXgkUHYHTFboE4ZAksgdwldrVqkojhJ?=
 =?us-ascii?Q?OC1hjQHkbxGH3Bjm4NacMfwDDOsHoGtJrH75jF2Uu4GJI/oACBnzVDWeQWHU?=
 =?us-ascii?Q?dt4C9ChBqDdfYtlPssMu7aHib4od7anJ5WWhTkPkQ9ieq5ZfIdyFf3Xs7Qwr?=
 =?us-ascii?Q?YpMvvTFCYo0jxR+m5hPCukkYZL5ZvyVokGnMA6msQ5mVA4I35ILf0Q3nBkwD?=
 =?us-ascii?Q?7o0zLr9eki5dm/aW46FWJcj0QYUjj5TEATKH7O9utFl5XHNaZiTwS0nsYvmD?=
 =?us-ascii?Q?40CLZmOof6jYqTOQYmxWYcHv5SM+U/hc56ya5SnhtKcZ5otobbfaLrHWuoL4?=
 =?us-ascii?Q?2pMarRwKcleELorGg1Cyp2RU8tvfV6UrJHU3pY4M6K83VlfAUQZ1vVI8Kkdj?=
 =?us-ascii?Q?mSxPi4hgkmrZq0mPPrAMpp266T7coOYtxOY2YB6QG0kqvK63CfchQNKMi5uB?=
 =?us-ascii?Q?QASnQNRnWg8thURj4MBkku+t/YgkliRJ33xpAx7MSCEibqk9FzZ7qUJw8pxX?=
 =?us-ascii?Q?hSmmGwBc0wfQqHHQtrVYwwhhbqonheV/aI9uRl9+sOzZwHv5JxlEdmb33woa?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18de7de5-739f-400b-3aa7-08dc5fe3dd8c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 20:12:26.0213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xoh/i/8+S4vKpm5o5BY//+cKPMe+t1xObjIeOrm4BAqDSbIvAKGxQCygqfsvu02z+z2Fzqaj3gmq08cWdEFOMQimiRcXSst6yJu5KlCP8Ek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8188
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

On Thu, Apr 18, 2024 at 03:16:31AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe2lpg: Extend Wa_14020338487
> URL   : https://patchwork.freedesktop.org/series/132582/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1110-a4f566444a645b1ade1b8d948f6e0286136b2cb3_BAT -> xe-pw-132582v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks for the patch.


Matt

> 
>   
> 
> Participating hosts (0 -> 0)
> ------------------------------
> 
>   No changes in participating hosts
> 
> 
> Changes
> -------
> 
>   No changes found
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1110-a4f566444a645b1ade1b8d948f6e0286136b2cb3 -> xe-pw-132582v1
> 
>   IGT_7811: 2d95df5757eb99a42ea9ac30fd74001dee804d03 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1110-a4f566444a645b1ade1b8d948f6e0286136b2cb3: a4f566444a645b1ade1b8d948f6e0286136b2cb3
>   xe-pw-132582v1: 132582v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132582v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
