Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4D9C021AA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 19:53:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851E910E880;
	Wed, 19 Feb 2025 19:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BOINtuyo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641A210E880
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Feb 2025 19:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739994830; x=1771530830;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SFlDIroBzH67YfYKn00HxCcqZqPINkN9qdi85+WS2pA=;
 b=BOINtuyoIJhqkKZSDoAVtw8wqJ8arbRniZ1qrHNmBUqbJJ/OhqCpfDSM
 74UJT0F82KmJR0ilfFJjZGgZOUCkD7cg9qA3n/FZymZPw8H3Yp+saix8y
 qpzDYpRVL5Tgo4rlXrH/ZseJ/9FW8J7T6B+TvS2RSCyZbw8x4ECkj1KCI
 6mkOua2LLTBdEo/x1RV0Mxm9dBeAEp41CabXXelyqhYdmAcIc8nF67+mL
 OX8BfbdwuKsNfXUIrxqdgXfZgfHpKZCI4t9nHLNl/gEhBQMytXZkCGycj
 aSqAa22YOgV9/bmc7NCHHAquznYfa0CKjx+VE87AfcuKsDav0hhm4q/96 Q==;
X-CSE-ConnectionGUID: CsaDbcXRSka/ZCD8CfWTmw==
X-CSE-MsgGUID: 8KUG9HGET6iajZXq5D/Spg==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="50963137"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="50963137"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 11:53:49 -0800
X-CSE-ConnectionGUID: BqoOm8u1RCiuDk/H4NwILA==
X-CSE-MsgGUID: 8B43Y0KkR5ihKDWdi48x9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="114795501"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2025 11:53:48 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 19 Feb 2025 11:53:48 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Feb 2025 11:53:48 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Feb 2025 11:53:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvFM8B1Sd3eoiM7Qem1BXhk28yqsFEQLVeT1lw4bHwBrsZME/xdzoZYy1SlZnd5Hb/b+MkvH/jQy7H0nAQIaORvTg56NBGCnotkrM2jgzfJ5HgPlKt1JSJzEaCxl1TUdfixZ1A2RT6q67h0ctL4x7EaAXLoj0B5M4Ae/WziMgs25Hv9+KIvhfkcZycwcSQMIuMPYSS8SD2yMZ9AakQvpCCuoBsnGa8V2s7thL9IPZB6W+Yb4FqnwFT09iH3lWIx99HgdeZIalNodf9U9eVaQ3o6MA95vozveDrakNd4pc9/WxRTk3el7t7WDT+bZCm71nlnLR7LCrbS3KrUnoE4I+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwZBK/qUaB0uPzyiUXRFfPVN8ix/WWLe7PS2tJBIP9A=;
 b=IqLqkdLbMZAsRY5BjM9SzlRIYrjI1sogDhgqBRCdaWBglfZFXYsdKAglNKKSM8gaqUADFDuZESGCcavjdT9gHWmrHPy8+Dd2STf6mPdDxaxxheu1HVORp8c2KNaP432Muh8QrY2o29+AmivlsCOXolgncfsW2+12Aqo/btGghcRp8x+h5SeDbYzjTLt68g3PVhuDDDIia+T8BnsozF2o9mRfSIEkaIUNVcj1cLv3wDQ+QW1u+/IajrgkKILTc6MF2UxokkDGPf5O8F1bfQmWy8jtUHAEjAULGDUbpgZLAOWqO5Xo4rjLgUoOHBO7TX6hD2utNatJ8YA4WRX0Nn0XIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB8418.namprd11.prod.outlook.com (2603:10b6:208:487::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 19:53:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 19:53:46 +0000
Date: Wed, 19 Feb 2025 13:53:44 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH] drm/xe/devcoredump: Fix print typo of offset
Message-ID: <rs234y7bvwmvoydficu53hdeylbfnwve3j35zgubhwvwwhf67z@qybsikuspwkz>
References: <20250219190739.1775077-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250219190739.1775077-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:303:8f::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: b3b19e2a-5523-400b-5129-08dd511f1f1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oboIgxom+HTFlRv/G6B7bth+Az/A9UzhRMBuyeOZQLSJoYKLZZ+Dm9S/81wr?=
 =?us-ascii?Q?GWF83x4O3y48Rzl9PIYhUfUdQzXROYtpfS9+2Nw8cAWISyZnIF+Hhu9oWiJN?=
 =?us-ascii?Q?6vrS+0eb+o4VXkLcJh8sfC1eRERU8TqhqbnhlwVo8f6M+rnO3zYeNbVjQcug?=
 =?us-ascii?Q?u4DLEotzQjklW605tWR2quw0oAD0PGZqyp+XLlwesfZYHf8hJs8DjP0OOyx9?=
 =?us-ascii?Q?FpbMsIhsIjYCcyFR50fcPTsegN6ak9tnRuuA5Mr/AMyUppXyFlpa5me5kFIq?=
 =?us-ascii?Q?yXTokbj/7I4lY0x4/U7WRQ/38vo8whULMTp3FlM8wjVLjsUsrNK9zNbAihYE?=
 =?us-ascii?Q?zJG8uG6nXe4OrnPe7XypnyfPMzP5BCOToclHWNBQf/zAQi0kOz+h8HePScy7?=
 =?us-ascii?Q?a5AHADPfrfm4VAOa33LKoKPnucLheVhg7htDA9foc+ccid5PhrkpCDTuWTP0?=
 =?us-ascii?Q?4S/f6lm9TBzWqHmFh89+TU16u7WuLJFLdWvp/M+D8WltTyWhvJy+5M0ujh5x?=
 =?us-ascii?Q?+wRBEjZyEQGGcEtdjeUplrrOdvkCgDDB5Ez/D9a6Ffc9qXrchZppsZxFiHdr?=
 =?us-ascii?Q?EY1HouD2PQ8qhYvU2EBfbYx1MmouBxQoCEDd6flB3qCUmqQbamIw8m323dRQ?=
 =?us-ascii?Q?wUSLhiiFPdqsnIPBax99u1WZnlUrAFn8mZcTrrA4Y77wvW913UIipr3UjDJp?=
 =?us-ascii?Q?daQyrVndud1PL3etlx7DdwlrCL2DsG5QXZ4QIfGpruZCG6gOpL0q081796Jv?=
 =?us-ascii?Q?adhSO3q7wbRe4SYZ+xMeIIcfrQ+ZwEls4XF1FrE+a5Sx5DXp7t33fkKAnI/i?=
 =?us-ascii?Q?EKtmelZRNi+l46NL0IO1eMv0jeRGqOatRS91LKCOZCjZdWu277gD2Q9A3nX9?=
 =?us-ascii?Q?4UlegZuJLsy/cWvDNAQ0EdQvsXhD16em0ZyduWIAuatf4VBLZ50z29k7/ARi?=
 =?us-ascii?Q?JR6pngNze4U2rIe5o3fDTig+xnJTAIVtKuu9Eu4YIiJ+yWgV/5oiy7/4P/1+?=
 =?us-ascii?Q?s9QcqVWON1OuPAwXpjV9Ude1CHckFndf1w6FQ+vx3D+PZiwHjbgHXgw/r7Bv?=
 =?us-ascii?Q?uvTKEA7gFkyR0uJKtaznDXiimlAdXVtZnDN7KwH6zP2aMYerET/E10iWMiQG?=
 =?us-ascii?Q?pD0loQDjwM9l0biX4cCe/qXy6yf1/Z/F1Hfds/1dqaon/ndckbfh5w98333I?=
 =?us-ascii?Q?XGeCLtUcYkMNlacP7urzSbtPwP1s0x1g+gtaI99kXi0TW5rfHRLcaSolIwB9?=
 =?us-ascii?Q?+h8+7d4gE8ZMxnMPQpKJO0NEMIySA3JnpXnDsuAuaMGME+Md0HzZWvqZ0BcZ?=
 =?us-ascii?Q?jrsshcLre0e94SzJWeJALpjj98Qh7s3S79IZQ1GzheOXclcbuWAF5HNYqHFM?=
 =?us-ascii?Q?hLzm0oEG/ZKmCyB/0RcYj80zqsRlClyVYKvK/VxZUIsL0EdKwfDnWLYU8wYT?=
 =?us-ascii?Q?b6EWEzOnwBag9ASnPvtcFhLxqFh342dg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qzAM3BanPGbJp91NexzCspb5SV4E/LcWEuJiPZ8Exi3HYXmZto8RRUgK+wcX?=
 =?us-ascii?Q?w2CuZpe5KN0FRHZSb2EIdVs513g0GYGOezZDlMRxnWQFYYSTUz2BRRhI8+l7?=
 =?us-ascii?Q?pEPvLka/VSYIfc5en1If+auXZwMX35v+V5DVhNh/9Wx/JsKKeuImK01tSsHQ?=
 =?us-ascii?Q?oLK1lrmOu1ORvCmBA4lolWEsLdkdiZvixmwCTnvamo6WFtfg9aEIM28KeFVw?=
 =?us-ascii?Q?11KXKeDyfU8jHa7B5M47nqYP0ypyIbjM781LJ8VnRX+ukmN3SXSe6e8tNCAz?=
 =?us-ascii?Q?8yiQy6xAEu4g9t+dVzXxS3nF16zt6pjHbyqc5cDVmKKhQwqbt3A6lgT/+oXq?=
 =?us-ascii?Q?otsX+MS0nRcI+g90SODqhmcO3fMsdQa4AuB+TXI5bc2FnmqUs5xGMmNMw+BK?=
 =?us-ascii?Q?7AAcYuG8pIY4Smkm2zcUEQfdhsZYlWo6ipniapxSMbfNSCo7s1OKWkdiyp4K?=
 =?us-ascii?Q?tO86Ulk+C+gD8o6rgmS0WmeC8Z6Rq7mTPXId7X+Ta/SpEd1dwqYUnasU1IfN?=
 =?us-ascii?Q?RdkW6vPdqF5s0WIOT4druU8yb6Oi1xYYAlZ/9d9Eoq1VWIP3DpiqX5BExngj?=
 =?us-ascii?Q?LMc2bQs8aSlFr8njCNl47pCCzlgCec1sHYrthvlK5jP4HLctRGYMEjp/oEwo?=
 =?us-ascii?Q?O2gU/35jr0/CLSsqgb0oz2gaV+sqerdydAlf0fXUQ0RMwn1yzWLMt1WajMEG?=
 =?us-ascii?Q?JmdO4ilJkqq5vaXAXYVrANi+AQ72mPBLUAcuLDz4f1ETJ7E5I46qmvl2G44j?=
 =?us-ascii?Q?/7B8PFPMknrcqAhGYGjugs/FbvZEeO53ZKwnqgcjSRkuhOGV+8XezlGXvcYe?=
 =?us-ascii?Q?/Y9PjiKaDNHSw+3MRIelHEc75fMgIo3Qa5/okk1mh9uuZWAVYq5pngkJpmN1?=
 =?us-ascii?Q?Nfm1jNgCo/0jdy1F8rWguw5Rok9VjwlRF55zEX8MjALjbRdmxaPCLoXMUGua?=
 =?us-ascii?Q?j0WP9YIStqLqTWPuWVyQR0OBOIwaZ3LrP+p1BwNzCYaahHnP4cgWgW7jsWbS?=
 =?us-ascii?Q?a+jfUPc2ln9dIhH35ygFHHQvU+QQi8CCMDhLhFJs3VNKW5Z5bo3MYLcv+YVs?=
 =?us-ascii?Q?eS948qd7q3bZ5rR7R0LbGGE0lFlvRKEyUiY4/S7imOW3VWA8sJgr8zS+c85d?=
 =?us-ascii?Q?ITxgu60+bsPXwwiEsha/1bR2JP2YvMvPIO+YgFUQHDWSvXGMzJhT/XR4l3Mg?=
 =?us-ascii?Q?xOzFWqL2+CSPDb81S+Flud7uVY6SLPp6HHY4W+zzUy36g7YfKGoQWoOanzdk?=
 =?us-ascii?Q?xay+HHDh8yr1DtN3NpjYPUqXG8HnMvFIKJRfb4oT+BI99GweV5NSH0/zbdCB?=
 =?us-ascii?Q?F5qVVQAK9HA59I45XnCQ2xwLBh6jrVAn2AFQ/wDzGBPeaKljgsiNfkAuQdFg?=
 =?us-ascii?Q?S+HkiT7KV5okS48zjmmi/UA2v77nMPk1TWLrzEupzi0a2q1GYBJeQKyRM/xp?=
 =?us-ascii?Q?7Kv7wWqbPk8o0JU7UiNgctBU2yqQYubhsGCMT39BXWtnm6VRt7w6IeGEsK+t?=
 =?us-ascii?Q?y4ALkv+i3ruSP5w06IwTqkqRooQqsfQionZqjOeUkLskp3WUNCtivh5AKvLr?=
 =?us-ascii?Q?agP3pQZEr6iRhoRUw4ce+UYkzXORKwwzQegw6v51zkxTDUQxx6FvABhsPLoA?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b19e2a-5523-400b-5129-08dd511f1f1d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 19:53:46.6448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xi4zGAP56Poh0WazGwt8mvjnkGbdqh79gJq9j9S8WTxfwNW6ZUWipSsLTPXoMRgkZJOCy2dC/P/YDNR4b4lE35JcOiBhHf9nbeaShCSxMIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8418
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

On Wed, Feb 19, 2025 at 07:07:39PM +0000, Shuicheng Lin wrote:
>The log should print with "offset" instead of "size".

patch 1 ^
>
>kzalloc returns a valid pointer or NULL if the allocation fails.
>It never returns an error pointer. It is better to check for NULL directly.

patch 2 ^

and in one of them mention the typo fix.

thanks
Lucas De Marchi

>
>Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>Cc: John Harrison <John.C.Harrison@Intel.com>
>---
> drivers/gpu/drm/xe/xe_devcoredump.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>index 39fe485d2085..81b9d9bb3f57 100644
>--- a/drivers/gpu/drm/xe/xe_devcoredump.c
>+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>@@ -237,7 +237,7 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
>
> 	/*
> 	 * NB: Despite passing a GFP_ flags parameter here, more allocations are done
>-	 * internally using GFP_KERNEL expliictly. Hence this call must be in the worker
>+	 * internally using GFP_KERNEL explicitly. Hence this call must be in the worker
> 	 * thread and not in the initial capture call.
> 	 */
> 	dev_coredumpm_timeout(gt_to_xe(ss->gt)->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
>@@ -423,11 +423,11 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, char suffi
> 	if (size & 3)
> 		drm_printf(p, "Size not word aligned: %zu", size);
> 	if (offset & 3)
>-		drm_printf(p, "Offset not word aligned: %zu", size);
>+		drm_printf(p, "Offset not word aligned: %zu", offset);
>
> 	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
>-	if (IS_ERR_OR_NULL(line_buff)) {
>-		drm_printf(p, "Failed to allocate line buffer: %pe", line_buff);
>+	if (!line_buff) {
>+		drm_printf(p, "Failed to allocate line buffer\n");
> 		return;
> 	}
>
>-- 
>2.25.1
>
