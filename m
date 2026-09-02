Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF2DC624D4
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 19:43:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5D010E6DF;
	Wed,  2 Sep 2026 19:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sb9M9F/n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A6910E6DF
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 19:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788378210; x=1819914210;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SsWslhS2J4vvqzeW4Ntv7hqmVzIQNxs14e6uYivSi2A=;
 b=Sb9M9F/nIKM6jrgInz1WTbKxY5eMVBmbxVV/a2l5n915CZE4dVrsb0/7
 vN2E9GOmO+95YKUBJuYnvwUNVdHE06XINSJKR2dPJlgzPasFGv5fr67Yu
 BPp9tCpyDw1I71EGNZWIjRGdISRuA2wKRUma7TZZSjM7IhtZIGtjwXsuB
 4widKz7k2rqAgOu+Cz5DD/xsBz1bfxEz+eaJkvJIW8DDylrHaWLBp9SV/
 iedAapcIy17Cw5Li3mrmjF60r6Zl4ETo9je5lNd5OlDocFfhL9blALI2T
 iSPJK80IcrfqKi6v7tdtsntzu9QgjCW8xEYBm9OaOKVXPEqmzDx9m02+k Q==;
X-CSE-ConnectionGUID: GyakCRHbQiiW5XuWv9Dh/g==
X-CSE-MsgGUID: tZTBTc+mQJupSOUW1L+upA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100364782"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="100364782"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 12:43:30 -0700
X-CSE-ConnectionGUID: MNpEDRklRDmYqJ4vgGXOCQ==
X-CSE-MsgGUID: DXIOiGcPSkKB0WpDUZI1Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="268184081"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 12:43:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 12:43:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 12:43:28 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.56)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 12:43:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ED1eFgIhBAR1py7UUd8+o4wgdyu9sxI6aMZTZsNf+ygnpDkTeKJYJBnsv3Q9z+Hg+bCgWgjaAAskcNUT7oFQpT9puUaw6uI2FMCOGmoNF/cEY9XRtoQsE1eCJhcxgkHcPaQY29UK6HXwbmdDL7NN8vyucJVz6Y54C7ih5xLZxdjq1H+eV/8JPljPEefHV9W2YK3JHbSe2LX8KJSK8Za9MZLJSoYD3Jt4W5f4FZ49mhZjeC/Hrbb3dloYosnEx19O7aNLMcuM4yrueSIXQw8sjU7KlltQ3iyuQc6FtiZZIj8RKeSD7ES0M8hDcm09xb5lHLSRa9a21JpUxioX4NiHKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/d6CPKV2+RVfbJDgUBgTsBTi7O9ccRk472YWu3Bbq8=;
 b=SNmXSfXtw/gz45mMU6N1Vv5nFjFRUfNx/70uw+V+h6Yxnofm8SbdvpmJfIg0z3+sYvtOyXp8JxwFgeZ7+uxmTEv/J0g9xJMBYhSUCzDNOLsEMqy7rHr0QT8wHtCDIP3Ks7a4If52pcnV9J+EvZdZ8EMxGIPfi0NYaLWhlDwMJVDRrbvih400toyw8gx0kFjaCnk9ofScq/YHPEU0OC3q61x2epCsfgBk5vYjImexHmM5xcs5lFtwMyuQe9MBkptD1XXFKZy38F1Ev13+QS/Hre74V229R32imJEO6kcfzAY7zJ5GWPg8v9HLX5mS4Wkq2JCfeCfwtRLu3m2gvSfbZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6942.namprd11.prod.outlook.com (2603:10b6:806:2bf::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 19:43:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 19:43:18 +0000
Date: Wed, 2 Sep 2026 12:43:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Stuart Summers <stuart.summers@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3 5/5] drm/xe/vram: add early VRAM health check
Message-ID: <aph8VNG33AzI/bcV@gsse-cloud1.jf.intel.com>
References: <20260902124117.918018-7-matthew.auld@intel.com>
 <20260902124117.918018-12-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260902124117.918018-12-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0237.namprd04.prod.outlook.com
 (2603:10b6:303:87::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6942:EE_
X-MS-Office365-Filtering-Correlation-Id: ba22e8ea-ea67-47ac-0264-08df092a703c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|10067099003|4143699003|11063799006|5023799004|18002099003|22082099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 88Skn76HeglRraSN8ZJ8TIVaWqTF3+X5n3puFfKZDGRcMPORPlT2mN0Qyrgqgai7aZBWn5buqhSm4a8WXF4IlTGz6HjjETqzsBF1abmdRF/AeOQ2MIE52pOCEYKslKUwVXkRO+08sZQGLtFxQqJKYcRp6U5heouU5yrAiTo9EUgodtDb29rLOkl7LzSyttzR7HoGLRj5agyeAc/FtTOyE3t7rZK4wYBsV6iZhOqtsrYyjfDnFpjMrMpEuxBfHk1MfiNyLujdwVsOE4eOFGh90yEjoyJXe8rL4TKTfLP28liPkmTe87D9DtzL3BUyOMW0RaK+aedtWSHegR00GmcYLIiLy4px0QbPUIHcF968Xe7AI0YhBrTsGFmws8jmf7yJFfXz/25ntUvx9CEcuPJnfuRyvFcyDZlLlYXnfndqvKcG9fzU1Kt7bsjrwPy80VwcR6ePV/XJb/PSH1cbN/euHecFmoTK6sYRxM9xtGuL9/LjCVcWmKs0PaR+5rDnqh0ScDGJSrBWTyeQ6SN/lI2Jfx7SU5DujakfKYCAodCt+Z100z/O66X+fLOV1H+JJ5qaUayu87sglMmzjxYeJZ+fASVRNahR4uhrCgidhHXMltadEc4FhUvs4nZ4nTYvuu5rIXB+FRT97rqRE0weRVVu8YS1DNGiCrdaPkw0DJe7OfE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(4143699003)(11063799006)(5023799004)(18002099003)(22082099003)(56012099006)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NbO8LLJNfllWAU1qVfxbFCyII2jA+ZMyS0eGPv/8xXV9yFRJ/849RftLBZ?=
 =?iso-8859-1?Q?Vuu2TPSdam4jgklC5qIoNx2jkjy+lysBPiEmhT3DKpPIs3ECG/9JqpGFoP?=
 =?iso-8859-1?Q?3PtiXnLIqRzP68SeFq9X+dXmlA56fd+ZtqmvSWxhgMn+c3Xol6uX2QN8f3?=
 =?iso-8859-1?Q?NJCB2T1cavs51n3fqTNOggjhTzowHKnFUkFQ5n6ypvRqqqvJfY55BgqQ0b?=
 =?iso-8859-1?Q?iFkVFDTz9wR6ZG7MH4i3MTzQ1Wv4wp7NqwupykUzZt4pAg6KqzaeBNsVmy?=
 =?iso-8859-1?Q?sg9artja2E3Ki7kI6Pi62Gm1F8BAw4pWFDW2aDxZcJonaid4U81jYpqgwS?=
 =?iso-8859-1?Q?tLr2mYabQ15iPvzvGpnPLW4FM83YV2NOxRpdZ2sqymXfw9mxRuO8bMJ4gU?=
 =?iso-8859-1?Q?8VGMQZMI6De3fTdSZfXMEt4a4JJd4KJ6raeIFkmedBV420WK+Vow3+zj9+?=
 =?iso-8859-1?Q?p68VpeA4g7e6iUzrZn+9pZfjK1CFq1nyfG/vmY90skK62GGMeKK05CKYt7?=
 =?iso-8859-1?Q?CYs5OBmvcAp0zW9U5apUcIRFPbl5alG0JkN4fQUUlKhZ2Cb1Ca3/jqunDc?=
 =?iso-8859-1?Q?rDTsRMZ43+wM1/Cn1Y5TjOfB/0uu8Wod/ZP1onOtIF3C3L8GWUE7HGou/1?=
 =?iso-8859-1?Q?Paci76ZY1HGysQGjvYCQo6bRUWUYBcIPqa5FsjyzBPwCdSCm2DfvBVoVHd?=
 =?iso-8859-1?Q?H25YkOtOCrcQe951EXbBtGCdsgLj1Xb6VRtOAlMjHnACpCCqsZoEnsxxt5?=
 =?iso-8859-1?Q?xYjfBJ9OIfRc5HqzkIIZ3lPiYtn92QQVgOb6R+NCpDjvDoQwOb1aL/14mV?=
 =?iso-8859-1?Q?uFKsYYa4/Im6uxGWC3Y9wwDxcrqrpevxu7yMuEXwGWNc0zhaauWczVe59a?=
 =?iso-8859-1?Q?Lyxk2EQ/y5a75rqp+z6T8Ug1E4qbnVD8bn+i7/r36VTjDd8ARwZL/tpCxp?=
 =?iso-8859-1?Q?fERpuavs+As9cYpQLByXTKjo6daGcPJOvUcuPbztAN8dcg6TKYLySxem/E?=
 =?iso-8859-1?Q?krzy4rDD2+SUHP2bDgscsZ1cecDYtU4bEPejGEGkPGzSxyUJVKGAnZS3iO?=
 =?iso-8859-1?Q?9ai8FZpenUI8otQainARDBPqL88PCzdjdNMQIXIeekuEf6xxhVpHolCG5M?=
 =?iso-8859-1?Q?nf7QAFxib3zvkdHUhr3OXOIHXfY1H7EXGTiumWuRka+UkEISKzwD50ne5g?=
 =?iso-8859-1?Q?I6ssLROmpEiUM8xjT1btua0CX31TKbEE/bldAG7qUJo9EOQ8Xfb7Z3STib?=
 =?iso-8859-1?Q?MCqTGGRO6f5LerqXxa/M8qWoXpGUZ1KKI4AjXVDj2x7pd/rbtj9iq43hCq?=
 =?iso-8859-1?Q?TtJ4halEJz2qVBdngPdRzU3phjnnf3qnzUx3HCGlk98v4EFMQTBj5uvUnW?=
 =?iso-8859-1?Q?8ShciXkFyR2SZspgDpwcQdlkqi7yXXMEXN7JdxVMUj3iEq8Kp8z/yDL5Dq?=
 =?iso-8859-1?Q?tU+fPaLQkLa9qo7AyyGiuBl5JYlo27nIGJ0+Cngppu3KRQbQsdHRmLjkiV?=
 =?iso-8859-1?Q?kQ++OldDDbPlR3rOOYe8QHKUBsQa267i9MKfiYTJAX8U0QmnitplUf3GQM?=
 =?iso-8859-1?Q?AtRgnqDruOLt6oKr2wazgTU5jmz4i5rUkSiOKFzEAIDntAyMpY454MY5Uq?=
 =?iso-8859-1?Q?iUsnoyhnc568RhAdz9oKnPjijdRDyx4EqJKs8iflrDwehpUpCJH5mxwjlb?=
 =?iso-8859-1?Q?ZsnSq3lmUzwc7GLQLIbRNvQ/8okNqFufSUQx3uLJ0JsTtSFFAkyVSK/piJ?=
 =?iso-8859-1?Q?cHnaMK4ILORwGlicHi6HOAgC5Mjl1qpTEEsl2OZyg/7e/9P4j9JJ9I94qD?=
 =?iso-8859-1?Q?jaTVnXZwUkzMx5lvTwX5ZDM1EQXWB8g=3D?=
X-Exchange-RoutingPolicyChecked: exH25I0iBu/3PwTL6uxHv7qQ8ei9s3Mi6cOOjvqdPslDBX+GfYgfEt1Ri2bVsUKcQHD+ns0NKlZnmEKX9hc55cJ3gJJ58st3L09P858jlo/J0Ze/Z0TUvZkAme53LPSh3GDtebXpsrirCfYp7aBdCfcLuxnd50QMeFCIeHC6t9MV/sAIwVedUU4zzJeqmku5+JOfUftJz/+R6vEvQaQkYWphtX4VdPeWNrhqm4prXv2Bg7lA1b0AvF283eHuRLwshx8fCDRReo/LrW13X2tiV676rpAmJKbva9VOMSFJe01HxVRh6bVzcbYjT5l/M4a4ebLa2X8soSSYRb1SeZ/aTw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ba22e8ea-ea67-47ac-0264-08df092a703c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 19:43:18.8238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ko74BEHkdWymOef+zbH3ovIDmJjXzODUca/yGP2D5YQMiqgmv++tZj3nJCSCKldq6pPfO2k9cWLW7EO8hqv0hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6942
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

On Wed, Sep 02, 2026 at 01:41:23PM +0100, Matthew Auld wrote:
> During early probe, use the last page as a canary for BAR sizing, CCS
> sizing, identity map setup etc. If something is wrong the last page is
> where we will likely find it. Hit it with everything we have. For now
> this is gated behind a debug config option, so shouldn't trigger on
> production.
> 
> Main motivation is around CCS sizing where on some BMG cards the CCS
> offset is programmed misaligned, for whatever reason, and our handling
> of that was busted, as found by Linus, leading to some amount of CCS
> storage getting pulled into the allocator as normal VRAM.
> 
> Nothing in our CI farm has such a misaligned offset it would seem,
> however I did get this to pop on my b570, which does also have the
> misaligned CCS offset:
> 
>   Tile 0: Running VRAM memtest...
>   Tile 0: VRAM bounds overlap CCS region! VRAM sizing is incorrect.
> 
> With the fix from Linus, this goes away:
> 
>   Tile 0: Running VRAM memtest...
>   Tile 0: VRAM memtest completed.
> 
> For the VRAM health check itself, this adds:
> 
>   - CPU access to the last page (BAR).
>   - GPU access to the last page (identity map).
>   - CCS overlap check. This one is more involved, but overall idea is
>     fill the last page with a known pattern, and also save the CCS state
>     for the first 4M of VRAM to some scratch memory. We then zero the CCS
>     storage for that same range, all using the proper CCS copy instruction.
>     At this point we readback the last page, and check if the pattern we
>     wrote changed. Finally we restore the CCS state. This works since CCS
>     1:1 maps with VRAM, so the start of the raw CCS, should map to the
>     start of VRAM. This successfully catches the issue that Linus found
>     and fixed.
> 
> Assisted-by: Gemini:gemini-3.1-pro-preview
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c     |   8 +
>  drivers/gpu/drm/xe/xe_migrate.c    |  64 ++++++++
>  drivers/gpu/drm/xe/xe_migrate.h    |   6 +
>  drivers/gpu/drm/xe/xe_tile_types.h |   4 +
>  drivers/gpu/drm/xe/xe_vram.c       | 241 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vram.h       |  10 ++
>  6 files changed, 333 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index fa98b2d12204..8583b2e9ecf4 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1051,6 +1051,10 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	err = xe_vram_reserve_memtest_bo(xe);
> +	if (err)
> +		return err;
> +
>  	for_each_tile(tile, xe, id) {
>  		err = xe_tile_init(tile);
>  		if (err)
> @@ -1067,6 +1071,10 @@ int xe_device_probe(struct xe_device *xe)
>  			return err;
>  	}
>  
> +	err = xe_vram_memtest(xe);
> +	if (err)
> +		return err;
> +
>  	err = xe_pagefault_init(xe);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 0bf000d7c901..ff45c24d8889 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -2650,3 +2650,67 @@ void xe_migrate_job_lock_assert(struct xe_exec_queue *q)
>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>  #include "tests/xe_migrate.c"
>  #endif
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
> +int xe_migrate_debug_ccs_overlap(struct xe_migrate *m,
> +				 struct xe_bo *scratch_bo,
> +				 bool write_to_ccs)
> +{
> +	struct xe_device *xe = tile_to_xe(m->tile);
> +	struct xe_gt *gt = m->tile->primary_gt;
> +	struct dma_fence *fence;
> +	struct xe_bb *bb;
> +	struct xe_sched_job *job;
> +	u64 first_page_dpa, clear_L0_ofs, scratch_dpa, scratch_L0_ofs;
> +
> +	if (!xe_device_has_flat_ccs(xe))
> +		return -EINVAL;
> +
> +	first_page_dpa = xe_vram_region_dpa_base(m->tile->mem.vram);
> +	clear_L0_ofs = xe_migrate_vram_ofs(xe, first_page_dpa, true);
> +
> +	scratch_dpa = xe_bo_addr(scratch_bo, 0, XE_PAGE_SIZE);
> +	scratch_L0_ofs = xe_migrate_vram_ofs(xe, scratch_dpa, false);
> +
> +	bb = xe_bb_new(gt, EMIT_COPY_CCS_DW + 1, xe->info.has_usm);
> +	if (IS_ERR(bb)) {
> +		drm_warn(&xe->drm, "Failed to create bb for VRAM overlap check\n");
> +		return PTR_ERR(bb);
> +	}
> +
> +	/* 4MB payload = 8KB CCS metadata */
> +	if (write_to_ccs) {
> +		emit_copy_ccs(gt, bb, clear_L0_ofs, true,
> +			      scratch_L0_ofs, false, SZ_4M);
> +	} else {
> +		emit_copy_ccs(gt, bb, scratch_L0_ofs, false,
> +			      clear_L0_ofs, true, SZ_4M);
> +	}
> +
> +	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> +
> +	job = xe_bb_create_migration_job(m->q, bb,
> +					 xe_migrate_batch_base(m, xe->info.has_usm),
> +					 0);
> +	if (!IS_ERR(job)) {
> +		xe_sched_job_add_migrate_flush(job, MI_FLUSH_DW_CCS);
> +
> +		mutex_lock(&m->job_mutex);
> +		xe_sched_job_arm(job);
> +
> +		fence = dma_fence_get(&job->drm.s_fence->finished);
> +		xe_sched_job_push(job);
> +		mutex_unlock(&m->job_mutex);
> +
> +		dma_fence_wait(fence, false);
> +		dma_fence_put(fence);
> +	} else {
> +		drm_warn(&xe->drm, "Failed to create job for VRAM overlap check\n");
> +		xe_bb_free(bb, NULL);
> +		return PTR_ERR(job);
> +	}
> +
> +	xe_bb_free(bb, NULL);
> +	return 0;
> +}
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index c3a268b01768..a9acc62f78f0 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -182,4 +182,10 @@ static inline void xe_migrate_job_lock_assert(struct xe_exec_queue *q)
>  void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue *q);
>  void xe_migrate_job_unlock(struct xe_migrate *m, struct xe_exec_queue *q);
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
> +int xe_migrate_debug_ccs_overlap(struct xe_migrate *m,
> +				 struct xe_bo *scratch_bo,
> +				 bool write_to_ccs);
> +#endif
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_tile_types.h b/drivers/gpu/drm/xe/xe_tile_types.h
> index 0048100ccb72..e1368c04846a 100644
> --- a/drivers/gpu/drm/xe/xe_tile_types.h
> +++ b/drivers/gpu/drm/xe/xe_tile_types.h
> @@ -97,6 +97,10 @@ struct xe_tile {
>  		 * Only main GT has page reclaim list allocations.
>  		 */
>  		struct xe_sa_manager *reclaim_pool;
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
> +		/** @mem.memtest_bo: VRAM overlap check BO */
> +		struct xe_bo *memtest_bo;
> +#endif
>  	} mem;
>  
>  	/** @sriov: tile level virtualization data */
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 04d831b101bd..dcedd8cfd731 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -17,8 +17,11 @@
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt_mcr.h"
> +#include "xe_map.h"
> +#include "xe_migrate.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
> +#include "xe_tile.h"
>  #include "xe_tile_sriov_vf.h"
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_vram.h"
> @@ -407,3 +410,241 @@ resource_size_t xe_vram_region_actual_physical_size(const struct xe_vram_region
>  	return vram ? vram->actual_physical_size : 0;
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_vram_region_actual_physical_size);
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
> +static void memtest_bo_cleanup(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	xe_vram_free_memtest_bos(xe);
> +}
> +
> +int xe_vram_reserve_memtest_bo(struct xe_device *xe)
> +{
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	if (IS_SRIOV_VF(xe))
> +		return 0;
> +
> +	for_each_tile(tile, xe, id) {
> +		u64 vram_size;
> +
> +		if (!tile->mem.vram)
> +			continue;
> +
> +		if (tile->mem.vram->io_size < tile->mem.vram->usable_size) {
> +			drm_info(&xe->drm,
> +				 "Tile %d: Small-BAR system detected, skipping VRAM memtest\n",
> +				 id);
> +			continue;
> +		}
> +
> +		vram_size = tile->mem.vram->usable_size;
> +
> +		tile->mem.memtest_bo = xe_bo_create_pin_map_at_novm(xe, tile, SZ_64K,
> +								    vram_size - SZ_64K,
> +								    ttm_bo_type_kernel,
> +								    XE_BO_FLAG_VRAM_IF_DGFX(tile),
> +								    0, false);
> +		if (IS_ERR(tile->mem.memtest_bo)) {
> +			drm_warn(&xe->drm, "Tile %d: Failed to reserve memtest BO\n", id);
> +			tile->mem.memtest_bo = NULL;
> +			continue;
> +		}
> +
> +		drm_info(&xe->drm, "Tile %d: Reserved memtest BO at offset 0x%llx\n",
> +			 id, vram_size - SZ_64K);
> +	}
> +
> +	return devm_add_action_or_reset(xe->drm.dev, memtest_bo_cleanup, xe);
> +}
> +
> +void xe_vram_free_memtest_bos(struct xe_device *xe)
> +{
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	for_each_tile(tile, xe, id) {
> +		if (tile->mem.memtest_bo) {
> +			xe_bo_unpin_map_no_vm(tile->mem.memtest_bo);
> +			tile->mem.memtest_bo = NULL;
> +		}
> +	}
> +}
> +
> +int xe_vram_memtest(struct xe_device *xe)
> +{
> +	struct xe_tile *tile;
> +	u8 id;
> +	int err = 0;
> +
> +	if (IS_SRIOV_VF(xe))
> +		return 0;
> +
> +	for_each_tile(tile, xe, id) {
> +		struct xe_bo *last_page_bo = tile->mem.memtest_bo;
> +		struct dma_fence *fence;
> +		bool overlap = false;
> +		int i;
> +		u8 val;
> +
> +		if (!last_page_bo || !tile->migrate)
> +			continue;
> +
> +		drm_info(&xe->drm, "Tile %d: Running VRAM memtest...\n", id);
> +
> +		/* CPU write and readback first and last byte of the last page */
> +		xe_map_wr(xe, &last_page_bo->vmap, 0, u8, 0xA5);
> +		xe_map_wr(xe, &last_page_bo->vmap, SZ_64K - 1, u8, 0x5A);
> +
> +		val = xe_map_rd(xe, &last_page_bo->vmap, 0, u8);
> +		if (drm_WARN(&xe->drm, val != 0xA5,
> +			     "Tile %d: CPU memtest failed at offset 0 (expected 0xA5, got 0x%02x)\n",
> +			     id, val)) {
> +			err = -EIO;
> +			goto unpin;
> +		}
> +
> +		val = xe_map_rd(xe, &last_page_bo->vmap, SZ_64K - 1, u8);
> +		if (drm_WARN(&xe->drm, val != 0x5A,
> +			     "Tile %d: CPU memtest failed at offset 65535 (expected 0x5A, got 0x%02x)\n",
> +			     id, val)) {
> +			err = -EIO;
> +			goto unpin;
> +		}
> +
> +		/* Non-CCS access via GPU on the last page */
> +		xe_bo_lock(last_page_bo, false);
> +		fence = xe_migrate_clear(tile->migrate, last_page_bo,
> +					 last_page_bo->ttm.resource,
> +					 XE_MIGRATE_CLEAR_FLAG_BO_DATA);
> +		xe_bo_unlock(last_page_bo);
> +
> +		if (!IS_ERR(fence)) {
> +			dma_fence_wait(fence, false);
> +			dma_fence_put(fence);
> +		} else {
> +			err = PTR_ERR(fence);
> +			goto unpin;
> +		}
> +
> +		val = xe_map_rd(xe, &last_page_bo->vmap, 0, u8);
> +		if (drm_WARN(&xe->drm, val != 0x00,
> +			     "Tile %d: GPU memtest clear failed at offset 0 (expected 0x00, got 0x%02x)\n",
> +			     id, val)) {
> +			err = -EIO;
> +			goto unpin;
> +		}
> +
> +		/*
> +		 * Check for CCS overlap on the root tile.
> +		 *
> +		 * TODO: maybe extend if we ever get multi-tile + CCS. Pay
> +		 * special attention to the l2 flush below. Currently that is
> +		 * hard coded to the root tile.
> +		 */
> +		if (!id && xe_device_has_flat_ccs(xe) &&
> +		    GRAPHICS_VERx100(xe) >= 2000) {
> +			struct xe_bo *scratch_bo_before;
> +			struct xe_bo *scratch_bo_after;
> +
> +			scratch_bo_before = xe_bo_create_pin_map_novm(xe, tile, SZ_64K,
> +								      ttm_bo_type_kernel,
> +								      XE_BO_FLAG_VRAM_IF_DGFX(tile),
> +								      false);
> +			if (IS_ERR(scratch_bo_before)) {
> +				err = PTR_ERR(scratch_bo_before);
> +				goto unpin;
> +			}
> +
> +			scratch_bo_after = xe_bo_create_pin_map_novm(xe, tile, SZ_64K,
> +								     ttm_bo_type_kernel,
> +								     XE_BO_FLAG_VRAM_IF_DGFX(tile),
> +								     false);
> +			if (IS_ERR(scratch_bo_after)) {
> +				xe_bo_unpin_map_no_vm(scratch_bo_before);
> +				err = PTR_ERR(scratch_bo_after);
> +				goto unpin;
> +			}
> +
> +			/* Save original CCS metadata for PA 0 + */
> +			err = xe_migrate_debug_ccs_overlap(tile->migrate, scratch_bo_before, false);
> +			if (err) {
> +				xe_bo_unpin_map_no_vm(scratch_bo_before);
> +				xe_bo_unpin_map_no_vm(scratch_bo_after);
> +				goto unpin;
> +			}
> +
> +			/*
> +			 * Fill last page. If there is CCS overlap in the last
> +			 * page this will snag the raw CCS storage.
> +			 */
> +			xe_map_memset(xe, &last_page_bo->vmap, 0, 0x5A, SZ_64K);
> +			xe_device_wmb(xe);
> +
> +			/*
> +			 * Global invalidation. Some BMG SKUs will cache the BAR
> +			 * writes in the GPU side VRAM cache. Make sure above
> +			 * writes are fully flushed out to VRAM, so this is
> +			 * hopefully more well behaved with the CCS unit, if
> +			 * there is indeed CCS overlap with normal VRAM. Since
> +			 * there is a separate CCS cache, the CCS unit might not
> +			 * respect the GPU VRAM cache for CCS accesses, so opt
> +			 * for being super careful here.
> +			 */
> +			xe_device_l2_flush(xe, true);
> +
> +			/* Use GPU to clear CCS state for PA 0 */
> +			xe_map_memset(xe, &scratch_bo_after->vmap, 0, 0x00, SZ_64K);
> +			err = xe_migrate_debug_ccs_overlap(tile->migrate, scratch_bo_after, true);
> +			if (err) {
> +				xe_bo_unpin_map_no_vm(scratch_bo_before);
> +				xe_bo_unpin_map_no_vm(scratch_bo_after);
> +				goto unpin;
> +			}
> +			/*
> +			 * Global invalidation. Ensure CCS caches really are
> +			 * nuked and the raw CCS data is visible in VRAM, for
> +			 * the below access.
> +			 */
> +			xe_device_l2_flush(xe, true);
> +
> +			/* Check if last_page_bo was corrupted by the GPU CCS clear */
> +			for (i = 0; i < SZ_64K; i += 8) {
> +				u64 payload = xe_map_rd(xe, &last_page_bo->vmap, i, u64);
> +
> +				if (payload != 0x5A5A5A5A5A5A5A5AULL) {
> +					overlap = true;
> +					break;
> +				}
> +			}
> +
> +			/* Restore original CCS metadata for PA 0 + */
> +			err = xe_migrate_debug_ccs_overlap(tile->migrate, scratch_bo_before, true);
> +			if (err)
> +				drm_warn(&xe->drm, "Failed to restore CCS metadata\n");
> +
> +			xe_bo_unpin_map_no_vm(scratch_bo_before);
> +			xe_bo_unpin_map_no_vm(scratch_bo_after);
> +		}
> +
> +		if (drm_WARN(&xe->drm, overlap,
> +			     "Tile %d: VRAM bounds overlap CCS region! VRAM sizing is incorrect.\n",
> +			     id)) {
> +			err = -EINVAL;
> +			goto unpin;
> +		}
> +
> +		drm_info(&xe->drm, "Tile %d: VRAM memtest completed.\n", id);
> +
> +unpin:
> +		if (err)
> +			break;
> +	}
> +
> +	xe_vram_free_memtest_bos(xe);
> +
> +	return err;
> +}
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
> index dd1c8bf17922..38425d81f777 100644
> --- a/drivers/gpu/drm/xe/xe_vram.h
> +++ b/drivers/gpu/drm/xe/xe_vram.h
> @@ -23,4 +23,14 @@ resource_size_t xe_vram_region_dpa_base(const struct xe_vram_region *vram);
>  resource_size_t xe_vram_region_usable_size(const struct xe_vram_region *vram);
>  resource_size_t xe_vram_region_actual_physical_size(const struct xe_vram_region *vram);
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
> +int xe_vram_reserve_memtest_bo(struct xe_device *xe);
> +void xe_vram_free_memtest_bos(struct xe_device *xe);
> +int xe_vram_memtest(struct xe_device *xe);
> +#else
> +static inline int xe_vram_reserve_memtest_bo(struct xe_device *xe) { return 0; }
> +static inline void xe_vram_free_memtest_bos(struct xe_device *xe) {}
> +static inline int xe_vram_memtest(struct xe_device *xe) { return 0; }
> +#endif
> +
>  #endif
> -- 
> 2.55.0
> 
