Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9ABCCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 17:04:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B5910E39E;
	Mon, 13 Oct 2025 17:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M1TGGUWc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B8910E39E
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 17:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760375075; x=1791911075;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NLRQE2+zj0UPX02NKpBsgVq+a9ho4kaUCHWNZjCX4fs=;
 b=M1TGGUWc30BtH/bn5syBaA5rB1LYbDn3eUVLiXCqwZNx6h7EfKYH4/JP
 6TzZIixGB7yxsCGZLjdUK7aNK1FLVrd2UYI/m4gczm4uPeAuni4YTUI2U
 owzzfRur9qiR9Fl7K/QEiNQaMCCs7kXZnGwepmmX1WgjludL3TNa8S8f/
 BaLyRCDwoGUvHmRp9/gkZrx2F23o5WLIUIC9yEjZOHUqg4sg1qXXaQKjh
 RzEm84G2v+IAdQTl+CH28Hc06Mg787ej66HIf79HAcozkvEML1A5idcWM
 twyUkIQEA+uMhatNSyTWyw/WS/TnaObNk50cmexYVhDsovsqpQaszw3gF Q==;
X-CSE-ConnectionGUID: pV7BWjeGTpiq2mM5gaM5Wg==
X-CSE-MsgGUID: PFfhULJ6SJStIK9OkdW6DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73124370"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="73124370"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 10:04:20 -0700
X-CSE-ConnectionGUID: +X/B147CTZao0afVj+AE1A==
X-CSE-MsgGUID: mEy+FzKxSi+WFPW2I2sOTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="181218078"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 10:04:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 10:04:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 10:04:18 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 10:04:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3ViK+C9QqSthZf0Fmez8b1PMz1iq+8eXtXUkym3UPifwLMWg8jWccQFvM8RLjen782eZBlH/1PUeKLR9ObYexYV+2DE6P+IxTXuKbPMafiaqj6udtpcsDJqEcbrt3uGVOSzC+w319Z1IHjrpQhLepcwLRES1Bhuel/jMoU94TMHSzHsapRwE3ifXZJEPEW5Q8X8+GVp9914fp2of3m9VzjuymAhUEK44scmI7HaJOf06yixnDexiHbS9QoLRBJmy2JcLY5f+eWYJLoqes1hmlM6a/4XI5KeHyTjnRWu5K5chQ9a/xQ4YN8hf0F47Nrzjd4OyXYVTfj+GpOhHM0CkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ksf2IhLEMLDyLFG56mupQM+Vo7kzai3V5W/QCw/cM4o=;
 b=seOmcV8OZA89/dW15kXZx8xUkTz39tArOCVJDGC+NqfT7w9Vx+bkBJWgTkQtiEvUHMORGM0gO7eE7awZSDs4FrzWpWt0g6z6PqZuTDX1eoAf54Ee++i9ukYtc+aJTRhbnXDeKZkuLOIRnv5JgJLf+9ueAVCtLtVCQIj5xAVHsD3anJQ3TY7y87uAmUA//PMhCud45w+9W2jSp1LUe9cm3lWzztEcZl8CMVc8Trc3LmJvccr7Y+Ck9dp5o4Q72Rz/xoBuTk2iL+KdTYPaGzZIBUXnr1+ZyBcq5a/rIas9XvqnCQOLrvAsNk9eqsVx9VwVBFfK3q97AyHfAAzRteFf+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA1PR11MB6539.namprd11.prod.outlook.com (2603:10b6:208:3a1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 17:04:15 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 17:04:15 +0000
Date: Mon, 13 Oct 2025 10:04:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 0/7] Fix a couple of wedge corner-case memory leaks
Message-ID: <aO0xDCa/rTPp9++8@lstrano-desk.jf.intel.com>
References: <20251013162504.7768-1-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251013162504.7768-1-stuart.summers@intel.com>
X-ClientProxiedBy: MW4P223CA0001.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::6) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA1PR11MB6539:EE_
X-MS-Office365-Filtering-Correlation-Id: 66ab0886-bf3e-49a8-b4f7-08de0a7a89f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g2zibs0MZ5ElgbbVShCf8jhYuO1hqx4yPyw2ZJpDWGq9/VblHRpmWTZ3bv4B?=
 =?us-ascii?Q?gEwPUelDoC1ybE0KhX2ArrCa6bEzCsti/N0ysJTAHulXcPhIKkRJk4zhYEHZ?=
 =?us-ascii?Q?1EgnUMNPadxBD/lmh42iP2d1XprMK49E4qOVGwjaUZTA0s7yMVxdKKh9Zrpj?=
 =?us-ascii?Q?S+by9gsl5Yc81sMDEGtYO+N5dUjCsAAH0ju2OPZg0X9jCORdyVBBnPen2VKS?=
 =?us-ascii?Q?3sYOHbWzDKT+kOqI/7eLyjpksPzHVX89vb5bREDVwq1inmp4XwDQUO7+qWEm?=
 =?us-ascii?Q?86GDtZ0dhCYr6L3Fr64xOfDEeXJHkNNG4Rok4uihifyuk0yoQ8TXkzd6LNMS?=
 =?us-ascii?Q?wx2k0bEgP6kvWZ1+atTrzYuDqclQZvNCzucfFZ15cIpmQxhVbdG266l2+Oiy?=
 =?us-ascii?Q?g7GQlYfdhvu9qqrvHiH7H1Uz5qK4O7bi+4olXEAXakXBNkPxFIZODFBYrwKF?=
 =?us-ascii?Q?9R3Oyeby1mT4Ngajb7Fr8obztHbip66GHw92GXkc/BKb+m+hLQ1nKL0iPYiI?=
 =?us-ascii?Q?rCeca0NQipXJsiypYiDBauymFQbfn+uTDjOso9btWM8fHyJsKupfkV2t9W5l?=
 =?us-ascii?Q?cpEqvKhxxAuTg6mO4fphi30KqLl70xo7qjMaRlSlzeole2Hs/a5mGuFA/KJ8?=
 =?us-ascii?Q?aOKHDpSgKXUlTUs/DrkPV9bwBvCqI4sVpM04KMGBwQDFeVnUbZJsq5VfKlSS?=
 =?us-ascii?Q?Mnqs5Se/TLlv4NUty3QTB8sD0kAuwF1GPaTypDRspMO2PcCnTJfB/Ybj7G0X?=
 =?us-ascii?Q?4LhdLjCiRy2zhMdPrLoZPvB8F0DGRnddfCSF7D+3RLJzmW/3SD8wdUtPNTrT?=
 =?us-ascii?Q?Gy7iZHBYFB41NVXr5iwMbc1riDHhIKMMa2QWK5+wne6DWEDiU6JQGwFpehel?=
 =?us-ascii?Q?kAhyUOI1CajKxCmechaVVorB2jHohhF3od0DRsjXqHCPDcwy/I/PLQiLwqMQ?=
 =?us-ascii?Q?yVjCj+xp95dWJoJsNxW8GlyiTM2gG6m9uBtkEBA9izcSE6UGvmcOILRzyFd7?=
 =?us-ascii?Q?iaIkzB86OsjdnPdXpvUWsWqMsZog1Fjn/QOqK1m9r3N4C6XFSIP0zw1cBCwN?=
 =?us-ascii?Q?2JWjlVgBiE/yhi/hCr6zc4+QpKH9IK8KsRqNljJ2+b6DlqQDFF+6744LpqKJ?=
 =?us-ascii?Q?2ZM+bduJVk6200RvwxLSNc0WnCi7SxAcHGhTOer0rnumQged2pUuR1TFfTuq?=
 =?us-ascii?Q?TgxW8ldVC25MA1LhSKz7XZ+yxfKbCT+vtnS138OJO2HPrZtOKFXIONT6OyJA?=
 =?us-ascii?Q?cGTeU9G4uFilBDBbVdWlQyHxmQiFrfuh8qgvKeG80VV7qgqHbBYYVcFzEAMX?=
 =?us-ascii?Q?X5zAbxgLNYXixm06MWM3SdtAe42GzHJ+w750BUlSY/PfsUMqxejZfzUbp5Cj?=
 =?us-ascii?Q?QDeb/KIDco9kfniBfFBziC1CDwnAF1r94y7/sUWtjoP70R2SXg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MDwbrF3KKy2Qc95i65GxWDf/luFksY36Zl9f9HLSzMXyGx3aaQsv+wS/2UBt?=
 =?us-ascii?Q?jK0lhj8tbzGO8OKYLXGc8a1NobnRrUwZByDT1QVZVkJtLUU3479LGIR2/Lkf?=
 =?us-ascii?Q?IjiXs1BVuH9pzPBfAdSXK1KtWgPSZ54rzoEEajwpX5fs8cOcyJxTZ+R+0yQ6?=
 =?us-ascii?Q?JSmSjtVCzy6GfHpoGKCvu38L/u/I515XbaxNkBXySU2oaVEqWyQXHH+zKSkJ?=
 =?us-ascii?Q?lz94TJyUCclE/zNHL/cHENTxTAw1PQsybwtYJsdjWmYmzSTcpIyJjVaFuovy?=
 =?us-ascii?Q?U3jP1/VTKbvShH0merUkZ2MKd/LI8df+q9wek86i8D+oNrNNcSrVNG7k7kYM?=
 =?us-ascii?Q?T3LXLjSnRZhKOiCPSfGUhFyn9zK/j+ztysTm1Vyd1jT85swJnTtahMpTqSww?=
 =?us-ascii?Q?mkWcHBGR/XLwdrsh3ljT8veE23CbBFQ83F1jBymx1krMSXQrYW/VsNliB4tl?=
 =?us-ascii?Q?RAGT925Mrvkd9V40dwPhx10JVNmFj9vd5heRm3vRDDcJPMhDlzvSdPPsMhAj?=
 =?us-ascii?Q?D2n5sgSns/3gl0v1JVTQ0WADG2KxeUsZyQ2lSJUuKl0Vi1tE5nDhwEhvJKs+?=
 =?us-ascii?Q?9ksCBZKU4BWNKarvnaU+kk45HqVKF9anf0fk8mmTI2HNWp7oSPKOHKXNHYdu?=
 =?us-ascii?Q?yui87Szom1w25Cju752hwl0lZrzN//nZzQiKPzo5Bw9rmnhnVcSwD5bwNLSt?=
 =?us-ascii?Q?8MlfBCRdI6+kHbtfnmw7BuoSqkBiKgGcbV1Ask/VziJD6VYBEiTTdTzkhw6f?=
 =?us-ascii?Q?N9lsKTUdABtAkfqOxP2B6a76oWqy/rmUf5B0JlJt5Ignm519Esl9VLz+7NYK?=
 =?us-ascii?Q?cCq0BUo/8RkvUn77emulhn3+au4RFVRM7uYLdV6ywSHXyKkrlZTC7HJE+Dqb?=
 =?us-ascii?Q?IJUr0NcUKGmuWt4SjtBh6Q9WpRjOQVn8VMCdHLn2JNUxKTG6O8uFz+hEzYIs?=
 =?us-ascii?Q?dCAN7hUKFAWM2iqClMFi2FTXgiMJXbqcdFCcCKcFwRAtOyPVVSd6OArOgiBS?=
 =?us-ascii?Q?KfLhEozngKhQUC5NDpjll/vSfKoAO0G1iDLjz6JNFCoNs1Mkt8OWGyClpl7U?=
 =?us-ascii?Q?sxpbg7hwUSls/6A30beM4N+M5jz9pbhqyW7XapS2n25Fh/AM3hPhddozFfua?=
 =?us-ascii?Q?m2Iv9h4pFNWgbtzklKZ37EbkxcsJidOb+VMvmjhtqjE0ytnhRU6RF3iUxO03?=
 =?us-ascii?Q?HAbWyTvxYf1jcKbkuZ1KLIn1CJy5DMDmS+T9+4lU70UPSQipRlMVM7rQ/1UC?=
 =?us-ascii?Q?vuRoQtvCNJsUqxJxYXd+Q1SMkziW061pboSzRpT8e0xJy7SvrbPPDiB/OFy2?=
 =?us-ascii?Q?RevUBWeZRnmKCrFadn7McRA1dCZAa6MdHlwMpXxrt6GceeXaZUk6qLLDVwVg?=
 =?us-ascii?Q?I99t36IxKX0YwBURv+xRJkD2o0foHkKjIq1bW9cmAdmtPBeNl6YF9/uzbVQe?=
 =?us-ascii?Q?FAo2wfpaaKyTDvVgL0tW0X+B+I0OPFFUZM+tFtKSeix6VicPnz4NaQzmae0l?=
 =?us-ascii?Q?yAgjWHznJQ1cU8QzTPGOxrt3fM34Kx1E7llOGcOek0qJUfUhXPsPI4/V4YiF?=
 =?us-ascii?Q?YEndOhU2zULhldkhAvBppoCXwt/nUGqVvxCfKH6uaK5Y0cb6bQzZ0GIq7tPx?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ab0886-bf3e-49a8-b4f7-08de0a7a89f9
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 17:04:15.2678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3CB2sRHlcxIpEqCi85LmT7GPeYQ3VavouSr/5Z2qwN99VldyOXOG+Yc4H4a2CprZ1d4gwrHFSdNFKs5SsWbKMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6539
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

On Mon, Oct 13, 2025 at 04:24:57PM +0000, Stuart Summers wrote:
> Most of the patches in this series are just adding
> some debug hints to help track these down. I split
> these up in case we want to pick and choose which ones
> to include in the tree. I found them useful.
> 
> The main two interesting patches are the last two in the
> series which are fixing some corner cases when the
> driver becomes wedged in the middle of either communication
> with the DRM scheduler or in the event the GuC becomes
> unresponsive. In both of these cases there is a chance
> we could leak memory around the exec queue members
> like the LRC and the LRC BO. These patches fix those
> scenarios.
> 

Ok, I think I see the problem. I believe the correct approach is:

- Apply [1]

- Ensure all schedulers are not stopped in guc_submit_wedged_fini

- Clean up any lost H2G in guc_submit_wedged_fini similar to a GT reset

- Wait on all async scheduler work queue opertaions complete somewhere
  (this is part of VLK-80263, I was going to try to look at this part
  sometime this week). 

Matt

[1] https://patchwork.freedesktop.org/series/155417/

> v2: Address feedback from Matt:
>     - Let the DRM scheduler handle pausing/unpausing
>     - Still do the wait after scheduling disable/deregister
>       as with the previous patch, but skip the intermediate
>       software-based schedule disable using the "banned"
>       flag and instead just jump straight to the deregister
>       handling which will fully reset the queue state.
>       Note that for this case I am seeing a hardware failure
>       after submitting to GuC but before receiving the
>       response from GuC. So even if we wedge in this case
>       (monitoring the hardware state change), the queue
>       itself is not wedged because of the active GuC
>       submission (CT is not stalled at that point).
> 
> Stuart Summers (7):
>   drm/xe: Add additional trace points for LRCs
>   drm/xe: Add a trace point for VM close
>   drm/xe: Add the BO pointer info to the BO trace
>   drm/xe: Add new exec queue trace points
>   drm/xe: Correct migration VM teardown order
>   drm/xe: Don't block messages to the GPU scheduler
>   drm/xe: Check for GuC responses on disabling scheduling
> 
>  drivers/gpu/drm/xe/xe_exec_queue.c    |  4 +++
>  drivers/gpu/drm/xe/xe_gpu_scheduler.c |  6 +---
>  drivers/gpu/drm/xe/xe_guc_submit.c    | 24 ++++++++++++---
>  drivers/gpu/drm/xe/xe_lrc.c           |  4 +++
>  drivers/gpu/drm/xe/xe_lrc.h           |  3 ++
>  drivers/gpu/drm/xe/xe_migrate.c       |  2 +-
>  drivers/gpu/drm/xe/xe_trace.h         | 22 ++++++++++++--
>  drivers/gpu/drm/xe/xe_trace_bo.h      | 12 ++++++--
>  drivers/gpu/drm/xe/xe_trace_lrc.h     | 42 ++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_vm.c            |  2 ++
>  10 files changed, 106 insertions(+), 15 deletions(-)
> 
> -- 
> 2.34.1
> 
