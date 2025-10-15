Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389EBCCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 04:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAD110E038;
	Wed, 15 Oct 2025 04:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UySSCZe1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C49D10E038
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 04:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760500977; x=1792036977;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3t+T05k9z/95s+TzvF+BMG8+hVSK31/TS84/1NhE3Kw=;
 b=UySSCZe1NVdSHw1/hAGG8v8mhf5umJgfk0pffL54udcbRjLv++Vug4OW
 XCQW2s/wymAvlalnzSKURCZUgbztmRIzJ+vPFQ+vCbE5PcMvDP0+V7G1S
 v14MupLaVGLTSxTdw/8du+OpMUtnBwMVeDqLkNQgUaQhOWqMFIRs3xiHL
 dxFtFqjfAuNV/qGODNSYCSrsDv2Tvz8qWWenQ3hVwHNDuzsU7nklJE2ES
 QivJL3dzCT9GlxfaQnK+4+Jhfk7tXgWpaU/d2SVFMF3pY7mURAlMz+Em9
 qqpFFsmV3g/RfZhLmKBvXpTHv4HdQx1UhuSGJN72E5lLYlF15wF6PGf4l w==;
X-CSE-ConnectionGUID: 0dQ6MrkASOOX/QDeCtxYrA==
X-CSE-MsgGUID: 2WlAra8IQ5iLq/vTJfvc4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62709073"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="62709073"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 21:02:56 -0700
X-CSE-ConnectionGUID: mG1Ka38BSlGtzUscwslGyg==
X-CSE-MsgGUID: kBfqLo4oRyiWSOuRIP0riQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="182000502"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 21:02:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 21:02:55 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 21:02:55 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.52)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 21:02:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2+5lTT+MNmGyPbeaPgDoh6Wbp0DNm6zkkeZpr1GKDGP+iz/WAbrsHgaZzclL1wfowgo75oJsxLmkuejUcaeNQpcAfqkNT8F2PYsF2fKK8VZDwj10q4UuoopQQ+oKYzFGUx/3QZAejvR7ff4sfa5c+MnJY3VH7CbV/9QvqlYNP5flgu1kyO4rEsdvDVoLzfST12Awo0iek/Q78OpgZtni+hACCaS3LKItc79mLtKUyWPZ3+PJQl+DDwTJ1f0s1/P+fovuet5NiQh6VClwrIL8xHF9fsQ+NCnn+ld7DHGPzJbLk8xnXoR7C1d4qzydcvT6HZGbkf3sHcmedNWYrDFSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5teP+5gHi3/vXzTyv5OXcJ99fKTXemdCVtr3G8/k/M8=;
 b=ZEsAal/eJ/782zIk5RqLGNuO/AIIG9FZfOOTWepXXBePatVVx1hfwPBMrS08r3uSjn6ACzPH0XjCogDo9GWR2Nytljoqc02DUc1Q6naqq1U7IQXRpSs37v3MAF6Ef6r7kNUdcannf3lZV85eut+PdeaWYv6WRV+gDkLc8aTYx+OK/baW52WZZQ02he7vi3FMsLS9+T2HulK1gb+Doc39/HSfcXqOpJJoxiKk0GCiAP7yTKcmFqXwou3iWFrTUT0UoskYiQeYnAFmw7bNjKv4n/EmFXCtSt8JNu/Gj2k4DfNSHeDk315E9Zdy0BvaHpYks4W9aeI20Y0pcfQM39tAYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4696.namprd11.prod.outlook.com (2603:10b6:208:26d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 04:02:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 04:02:53 +0000
Date: Tue, 14 Oct 2025 23:02:51 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH 11/23] drm/xe/xe3p: Enable L2 flush optimization feature
Message-ID: <lxo5a27hwwi7dd43s7fjxeaesn52xdvosjogphkldil4pbmn42@zistvrfgzse6>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-11-bfb74f038215@intel.com>
 <20251014194337.GC5409@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251014194337.GC5409@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR06CA0005.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4696:EE_
X-MS-Office365-Filtering-Correlation-Id: 244d1807-7af6-4277-2e71-08de0b9fb73a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xHCj3a+8h5RdFdHOxxdMxJDnf55u+QDJphCaA0GMMrgNYX0u4F+zyi/RP8jP?=
 =?us-ascii?Q?Sru7uZghLue+/lP1y9mCOZxQPGsI9gOBuxzBcCIZwq0HQiAfuyOHicaDx+QD?=
 =?us-ascii?Q?8/s7iDAmrwYQKvQ3B/Jte0/AyAghpq8tQq+U+P1kFC1lQtDIbq40YpbeQncE?=
 =?us-ascii?Q?RYa3p9VzNdUR+MRod4X6SHzdJctyxP++5iaHSTit/ycLtWIigAvpa12WXjEu?=
 =?us-ascii?Q?mHT6TyijLv820W1WxE/UsJqklfhK/d9D/NhIiFUFaJeRPyowa3E7onf6yW2T?=
 =?us-ascii?Q?nbmwDNQnzNP1ivDQxki8UZEdi79ilgdkJJU52aor2TTszD9ZkFsDeycsRVOO?=
 =?us-ascii?Q?28gML0E/blER8XsQ/sEvnk6w7Ad7uC+K1Pw1jkJW7Y/e16bUyffq3u8Mt9xB?=
 =?us-ascii?Q?Ht3VhkCK+NkZnt5sd0QpPATa0EqVtpLTA/nEcDYlImEl9JUF93NaIJvWCy38?=
 =?us-ascii?Q?Qf2ekLHYUPniNTdmor7x5YSeP25rVN5iWQUmOvjZJHBGCrwLoN+RIDtPNHHa?=
 =?us-ascii?Q?wVfPqb36s0khyXpGZYuPsfifqZoTjDpNK2nTf2BlfDQN/6EoA0yCJvbPNR2+?=
 =?us-ascii?Q?6x89qYBh8vDr6SnYWuDkOkrSUizRSsAPzy/1jvsb7XwLJSIDtNgg2xUWA+YD?=
 =?us-ascii?Q?b4NQfcJDYPvefHx5tzRxk/YmjIwMKb21NlxdWoKy92SVTLkKqAGDkZqXMmOH?=
 =?us-ascii?Q?LmLGWbICqp5q95PPrX1Y2f/EDEo+BdK/HSSWA3Qq0/YSE2vTcSaK+cEpUKr8?=
 =?us-ascii?Q?Ro9kglEZMnil7QP0AM6QWb/5uhQhwqTAbFvNAq+QRk2Qrsam0/Y6NyCtasfb?=
 =?us-ascii?Q?CxJpKb8r8xVdLyYtVaRtgNuAiOxdTq3+0FP17GgpfTFSwSdwtNfR50XPz+eW?=
 =?us-ascii?Q?0OlTMaNPb8HZWjUbbyy3EneHV2ZCb6PyZAICfGG3BaeVromfxMVtY6ToJc2I?=
 =?us-ascii?Q?6I6iOpORDR/fClecHooG1A34K/xqNeQFkCmbKuFLuCKKsNKhIZL3jNjUCNzi?=
 =?us-ascii?Q?5V6HXBwr9wtIplZQpMD2cwYsyU+HAVrODuLIC4QXehgJY4hbb7FmECFDoDMf?=
 =?us-ascii?Q?taf5OScSCjQnmIxtmxcpT4dLUh0Cg+whMt9ttX6rfwn3Uhqu1DS4GlmOfi8W?=
 =?us-ascii?Q?fMwEwD3/bRm53Vh3IGqQK+V0X+cocSUpLvXyjxRCvU//DM2vZHoDncCwLn9Y?=
 =?us-ascii?Q?/yQm7dGvPlXLE85FVD/P9CGHkEH+6KjpYHDzuS//lVuuIO7kZBgM0rQS9x+4?=
 =?us-ascii?Q?1g1DZzkxCWE6QNealce9BqhnU+VRINpcFXc6gs8JHNNulIOZBdkUdh4Z/r5W?=
 =?us-ascii?Q?2IDnVCF/7B4H0JMH7vawyoDIk2u1JgATYiM/cvzlYJpcIcdPj6XbtHrSKdqH?=
 =?us-ascii?Q?5bqQSAmNYioxvV4xrsd+2FB11vNEnerbjD0tk72ytHJpKtLPJMmBBbQr4/pn?=
 =?us-ascii?Q?OkaDU2KFfdIRZICzLUYa5qxo1kJ7r9JT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MuTbqSjYUVmHb64VfS7W162r5VkmCJwMaw3vObXSInhX73pRuLlRdVetm6oq?=
 =?us-ascii?Q?N+xTwtloQ59DFsPpKu8KgyCjjZmABeLGPp+68IWqsRE0gmDHnxKxua7BLetR?=
 =?us-ascii?Q?RdB8bzTIPuKaqx4hmlekG2jrIysNDpmfE+TtpQtwmB15kflXQ7Lqa6Pogp5/?=
 =?us-ascii?Q?GgJcRcy+tICqm20Cf1aJg8AAFXdszxcH6koDj9Ngv3dWeSOTkQP97aw/X6nK?=
 =?us-ascii?Q?UBc81a6wIox5W7EmYknpA3pTF5MWiGWnerzJjOV2UvaUP+7NH2c4uWg+eDi6?=
 =?us-ascii?Q?39G+qDHhSUVndYKDVgVqmRefmjyvVFNvFWgJtpgzqnXdl75r64urGAdeCErS?=
 =?us-ascii?Q?MOFaVcdqgm7k89qaMZaUFCBeHcxQPesF+FgighrgNglUdT4FbLyEgMXypRmq?=
 =?us-ascii?Q?OwmgVgLyEQghbqDUJR2ruqwCNmcDA2Tfu9YZ+XmJ1hr+F2Dm3kIops+x/zBE?=
 =?us-ascii?Q?3aisK+csfizTRNlPjmMryo1vA0j4B0DvciQIoj1tdLALcuOkRBlDHv+tPqjS?=
 =?us-ascii?Q?zCAes1MTjChHGePLzz5XTj11eES2PVsry9GY9FGU/dPRJKFCsajcHMc2oafD?=
 =?us-ascii?Q?J9HdZyN2iJTY5hOlB7ZCjTPsYWT74g1ePNKTKaFz7fpyVsKLW/81eMr324kJ?=
 =?us-ascii?Q?/0dflO3G7HQp/8bmcdCJUweH957twYTK2nLayGw4VuQJIgrQLghJpNvQEiMV?=
 =?us-ascii?Q?RQLyhY3/BT/0bJhQ7/5Pz9mgzZVXbJyYPAim5MbGCFNabdPV+YZH2ZEh34re?=
 =?us-ascii?Q?dvIJf1vw93vXoRG3DjhFD7B4HQNL41XX4otW7GoUECqZkjta7XJ4yGeoVSac?=
 =?us-ascii?Q?XYFRYlyxOigdlKAuKXIH8OnQySTe37i0IVkWWn+lgdoVnQKSOTdO01F1jNBU?=
 =?us-ascii?Q?lv5Qp2pyF9Sv2+6Jdp8dvLc84EufQSfYreYFeBu3RdwpOEzVpNpI6VCULcOM?=
 =?us-ascii?Q?xlATOMjAn4aFPre6OwBQ8fkz5C+lqDseBLB4ForQDxW136etahGkNZB489j1?=
 =?us-ascii?Q?Ea9XHrGKTgTXrOYtn6ZQ/8Z5SdszyOZSHlbMwbiK3nnZx9WabYNKOaBGURFZ?=
 =?us-ascii?Q?Mz9/BNwgm2Y9+LLTtANJcSyuEmKCh+/ywxwxZ2vZUB8eAlqNo2dYwR2uGcNg?=
 =?us-ascii?Q?OAp/Go/VgwrxSl3MD6tPI/UZLUYJ8hZHQtSlLGz72SiZnQBpfqhZELMJ3JIb?=
 =?us-ascii?Q?BhFq13CjtIwKeir5CCX68VUUKx8D1k8+81az21ziU/Xvs44XzPVwSjjHds4w?=
 =?us-ascii?Q?pLYV87b7ZO6lJQtU3YB5QzB/hV2JMk2ibX0VD62NvVZHExlYdj1pbt6ueS5X?=
 =?us-ascii?Q?vAy7kiec+RsRwB7BJP7m+5GdpTgg7ec+b/My4Y3Gi0bdOhVBjpujmIIMRHKI?=
 =?us-ascii?Q?oovQowWgpQK0PLvSBVpI/ENTBQls9XjA3VL0EiraR/7YDJ+eeGZ05e49l5Fr?=
 =?us-ascii?Q?8eFuqU1PmPmgJjuEXxIgcwA5a1zMhIWcfy52doj8VAlXqyc/86HnMKGQCMWs?=
 =?us-ascii?Q?rHGBniYID66/qF6JvpHWUUKMSJ4EZN65OkfDhfSPY4bPzP9DuWt2atSiA8pT?=
 =?us-ascii?Q?rRA1/1mPtr8BhXAqic/JSshCPPdc0n+I+cXDaI5Z9xtn+Nf/IMzU0yyB3eLE?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 244d1807-7af6-4277-2e71-08de0b9fb73a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 04:02:53.6828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6n/TiEO1Nb8zb4cKqLermTpergYoB/uEcP88nmcK2TNxVPRiEMQmt20OrBWieaCO+n4rzbz+BZpFHwLWmlNoJcIM810o+zvyOvwc+1GwmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4696
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

On Tue, Oct 14, 2025 at 12:43:37PM -0700, Matt Roper wrote:
>On Mon, Oct 13, 2025 at 08:24:43PM -0700, Lucas De Marchi wrote:
>> From: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>
>> When set, the L2 flush optimization feature will control whether L2 is
>> in Persistent or Transient mode through monitoring of media activity.
>
>Similar to the previous patch, this commit message doesn't really help
>the reader understand what's going on.  I believe the intent here was to
>inform the GuC that it should be doing some of the special handling for
>app-transient caching according to whether media is active or not;
>that's why we have an unusual condition that checks the primary GT's
>version, but then applies the GuC flag on the media GT.
>
>But as noted on the previous patch, we still don't have a way to mark
>data as transient yet on Xe3p (of either the display- or app- variety),
>so this change may be a bit premature; we should postpone this to a
>later series.  And at that time we should probably start out with a
>kerneldoc patch first that explains these new caching behaviors so that
>readers have the necessary context before we start changing the code
>behavior.

agreed. I will drop this on next rev

thanks
Lucas De Marchi

>
>
>Matt
>
>>
>> To enable L2 flush optimization include new feature flag
>> GUC_CTL_ENABLE_L2FLUSH_OPT is used when media gt type is detected.
>>
>> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc.c      | 3 +++
>>  drivers/gpu/drm/xe/xe_guc_fwif.h | 1 +
>>  2 files changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index ecc3e091b89e6..3296f28803593 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -94,6 +94,9 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>>  	if (xe_guc_using_main_gamctrl_queues(guc))
>>  		flags |= GUC_CTL_MAIN_GAMCTRL_QUEUES;
>>
>> +	if (GRAPHICS_VER(xe) >= 35 && !IS_DGFX(xe) && xe_gt_is_media_type(guc_to_gt(guc)))
>> +		flags |= GUC_CTL_ENABLE_L2FLUSH_OPT;
>> +
>>  	return flags;
>>  }
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> index c90dd266e9cf9..c42572306158d 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> @@ -115,6 +115,7 @@ struct guc_update_exec_queue_policy {
>>  #define   GUC_CTL_ENABLE_PSMI_LOGGING	BIT(7)
>>  #define   GUC_CTL_MAIN_GAMCTRL_QUEUES	BIT(9)
>>  #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
>> +#define   GUC_CTL_ENABLE_L2FLUSH_OPT	BIT(15)
>>
>>  #define GUC_CTL_DEBUG			3
>>  #define   GUC_LOG_VERBOSITY		REG_GENMASK(1, 0)
>>
>> --
>> 2.51.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
