Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFBBC9830E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 19:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE2010FC1F;
	Fri, 25 Sep 2026 19:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KlKvwIdt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC9010FC1F
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 19:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790365100; x=1821901100;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fVXb/PqWOv8q5xp5WTWkTDVZq4kCrbpH6Ue3gyOego8=;
 b=KlKvwIdtpGccRaRxp5+1KU4LBZRaMeNt4n//AfywbNlgtS/5eDekwlAP
 VFo5M1mG9wBPcX6q6R66JSQiQwITcQhAg4seH2iqBbj7lsWJHr3ufs7J4
 PtAolzXmUiShKy6fZRU4EneRDBrLIliFNP8lUJQQeUVRdNajt7BvVmsVe
 Z3jfoCSUZmed8gBtsm15SjZ2E4GsxXz9IDHO74fkLsISr4zaVSWvH9kmZ
 hTBIcv8NpVe2V0iT4NNnE6shbBc5WRacxMvYzJPTRt6Z8fS3J+dwy7nT6
 zA6NVNOTSzSuDn/ZY5miRSFARkMEyuUQoQM61a4i5MjVN1fU91yK3LQFK g==;
X-CSE-ConnectionGUID: oN8zYWydTl+iLBWpNVZT/w==
X-CSE-MsgGUID: oBTstJFBQlqxQdULZil3qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="116687376"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="116687376"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 12:38:20 -0700
X-CSE-ConnectionGUID: CK0xpnouQEWM5QGfHLd1CQ==
X-CSE-MsgGUID: D+9Rp9QpSUqjh0U76B4dcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="300686934"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 12:38:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 12:38:19 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 12:38:19 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 12:38:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SCSwJPhgM/n1Wi+mb1B88XSA/FWKinrUZfdGu1oErPHKBybEiDtGeFK9/HlPnfJbPk+kry7S4c6m9/AFbPQ5VqWZb93Nca1JH5iojSyMTgpOWJ+YgQAToG1tIoFLKydJgblyHH6zEnSWsSAT/uQlhWIcM3lzwzJlfEn20LjcOj6q9A4IiHGAh1cjd/KMfg8nRVNt0E2Q3Oak+f8IKaST7GMmw6th59YmQNsNcz/nEtAvFaTde4Ux4qo6VDheZks8LsP1af3YYfoISGvZlYmsk/NV1MaZLPkiBY2so/QjjKe8LuPXvqu+7ANJoVs36P4qtPVG7VFvZj89MNXaecYc0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kay7qbBvvZHgSA1XWGtWjXTxLvowLzQOdBUbdT0NcA=;
 b=ufOtGAiG//JmU+NvC2gLGi8hhwnxBn11tWjj0sSF0eAQJpM0TLnLp1Tt6+hkk5tZuezZ+GIp48nFb+AXUsnCtjzRoKQeKkRdYPOHwsS5Ni/lFCdxOoNK9EiqZ9p2mLY0nVfJ/StWxeg5BTwhVckCVyZHLLj3wFmymwfKXz0pry3K2zq9KyDw2aGs0idex2jEdYlxL8ENhV18rDuhk+DSmKZBw9LEPUTKjZIF9uwGGpAqYYQnGAbItJeodtOJU6G2reeovAXJlzp93xqKAFvDVdTcFKX7fw3Yq2VQMMsRZEDz4c2tszf58h5mbht1S8DOG9KMnA2PsNe6VcwXZUgg7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by LVUPR11MB9833.namprd11.prod.outlook.com (2603:10b6:408:39d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 19:38:12 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 19:38:12 +0000
Date: Fri, 25 Sep 2026 12:38:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <maarten@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>, Shuicheng Lin <shuicheng.lin@intel.com>, 
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v7 22/24] drm/xe: Enter ULLS for migration jobs upon page
 fault or SVM prefetch
Message-ID: <arbNoqszyPTqaqBX@gsse-cloud1.jf.intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
 <20260925045320.1325860-23-matthew.brost@intel.com>
 <d6c5c5b2-781b-46c6-8de0-69d59ccf7988@lankhorst.se>
 <ara6nyX17ARDHBnU@gsse-cloud1.jf.intel.com>
 <1bea1f8b-19e0-4c4c-8b08-fa1c86e65845@lankhorst.se>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1bea1f8b-19e0-4c4c-8b08-fa1c86e65845@lankhorst.se>
X-ClientProxiedBy: MW4PR04CA0244.namprd04.prod.outlook.com
 (2603:10b6:303:88::9) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|LVUPR11MB9833:EE_
X-MS-Office365-Filtering-Correlation-Id: 40350bc2-1aad-43f4-8822-08df1b3c8930
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|56012099006|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: /Rc6pjwKdO8r1JHNTEea2DxfCR+QpGfS5j5smC2ukFkKvnLQGItcNTssvL5C1b6Z3bmJuZD3n1n2d3bW62mCwYqXtw5BWTer37/jpGnJHww3ZZRqysWQKUyAklVOz8tk42cN1cc2DZhFhoxhTsc0XEzwL8Xt+i/l+3MMeEqFjO89a0/ynNX/9ubEDNqmMEsrHNVuXU+KT9GzgC1VzEatbfJcFqU/HCxQQXm4V18yWHJdlzCR1pM82AyjP5TNQzlWZgMzX64U8yN4n9+3euKeKx0P33KOtXcd52+YLcc0U61vB4iIqK2pNGxWZH/23znX7wypZ1aKcBGYjeDQW+n6TKgagt79WuIDw7F58nJwDofaw0qPjvJl0tTf0aIvQRmajnDOqAvFf9qkzf3th0TVPJw5eN9tlJKDZaVU9EFxWY7HM/OoIv5Agy/sr4oRmPTlfWp5PIndoSVMjtjp09v/a3XHLI0JOVJ1+1JgCJId+wWzU8STXxDVuA2/Amm6re6zXWJRr4RUBUOwZiMTYVARH63qdQsr3i8y6zZZO+uqKo/GNpTcPagx/cP6a75f6AXUf0dvEdBU2RV1UhYpbyJ0OYRz/ZRYn0sK6txymS4bmvktCgs4wWakOe6AMQjsEQwnsvFsGFtFnU/u9RCStz03S6b3BxdNYW9XPxffENIvn+k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?V5DuEG1Xfl5tw1WpC6AIgj/lWYYWk8xbqTHs7f2XO/K9l68/z7PmZDDefW?=
 =?iso-8859-1?Q?PI8aO7jdGzxQQYHiXdUoPpoN+pWsw8LhyIQfjc/1C8/esKLxuz2rBHbeMx?=
 =?iso-8859-1?Q?0Leg8+F5Cxxtw4WpxnI10FNjEzlKBpmUJL0DPZmEykfm7MgYELJQsYLG4D?=
 =?iso-8859-1?Q?8heCG8wiyjX4Ku127wPdeQiD/9RdZlGXT+/5vOTueXVuTlu2PbTdSKLSiA?=
 =?iso-8859-1?Q?C0pub+pfZJ5BToCNWA2atcf/vptg7g9lJfKal+PfKLH8EeF5zdhxnx8nKi?=
 =?iso-8859-1?Q?rW74V0i9yb2jENRFa6yAKHmel3cxv1EIYszIbQNMhVCzxX0bZhGoey7xvt?=
 =?iso-8859-1?Q?qCi2Z6i9T3N+VmBxR0XxA32IRikWv502WJtqgY6zQedfvUgM9P8pU/a5rB?=
 =?iso-8859-1?Q?tQLnETYmr8W128k9owU8VxPGkFiZur/9HfIVSafAJDF3K6zw37r/ewKQWQ?=
 =?iso-8859-1?Q?evvxSE1i1Dw+VOjf87x7lCxo8SuqRid9gAZgaeJ8hR+AidvZ/v2EjWBX6l?=
 =?iso-8859-1?Q?+TEIEXJUKcFgy2YDAQ/kq4tkl0C9KBaMUi32Wmff1d72/uOdYMjfMpaYgi?=
 =?iso-8859-1?Q?sI+/WHJMXDSWh1DdF2MbB64vOeCOsls0KGKGopmJH2Y3z2pBWkbeykriOs?=
 =?iso-8859-1?Q?74vKQBWUGCmaS0Uy6fH/0ongf8VDVNbIhYCtvCX277SllrlQBmSctIWKKM?=
 =?iso-8859-1?Q?8uRX4JKCHNFuejVrl2MpyIW8lK4fFHbXFB4EFO7bDpgGVLbFHIp1Zk7Un6?=
 =?iso-8859-1?Q?fxBmyY5HicOHPoeTc8AIceTJdCbAAeXqlTsb1neR4bZOWa1PVfffM8mcTg?=
 =?iso-8859-1?Q?BXQa/IzH/Qq5r0YYamJpgsj3EwEVX84HucON5WU25Wjklus2h4y86D2eBf?=
 =?iso-8859-1?Q?5irb7xRuS8RbCROJbZwV/936VS0QCFpV3HwjmaeubPyUtl/Uf0bJaKZcOX?=
 =?iso-8859-1?Q?PyVyJqjREllhzsutzfS+Ba5XDFvYlhp70Q1gsy8qnq/qqH+w0u5htV0iZd?=
 =?iso-8859-1?Q?is3EqE72DcfzVg5qTUZR8n7S65VdhA63u/sl7wT4rcRI+jT7CxDPGOIye+?=
 =?iso-8859-1?Q?YK81nCzcj32/YuLSWEAH0AG9vdTep3AG1tbTz5It1i8xSzEhProRo38aE3?=
 =?iso-8859-1?Q?XPhlaCfelrrBw1ZWd3wmNYDkFA6tC5xONuQA+c38n8gZW3FT6TKEhYc9eP?=
 =?iso-8859-1?Q?AZhteFxREzhVccx2TUNwts6YU13pHuf/z0eefLrYGhmeMsrv0Pf87YqqNO?=
 =?iso-8859-1?Q?39kq+WWQhq1HRSb/cum+udIoNGeivogHHyFA4cEhlAj4gyxK9JW/8wyPh7?=
 =?iso-8859-1?Q?flY+rK1ziqPh45N4RGvvrjbHv4Teh3rNOdU8+wHusdnM4yE5PPXFWLWJmJ?=
 =?iso-8859-1?Q?7KLnGDph4wVzdOdCZEVw3e6cl+LYbeJxCpEpNwhyLxfOsAhBLrXNqxLhTq?=
 =?iso-8859-1?Q?BT9WOfE8Rg+M74eITPbnnICNisavCIMG/474S3+uT9361HSPHTD7VEDmVn?=
 =?iso-8859-1?Q?B7Mfo5y6RysSBtMAI+3En6YR9KWj1LUIHqe0TBTXq99Ea1vk0RZoxiznGC?=
 =?iso-8859-1?Q?XOhMyuYC5ghbpnraXZYf7r7T/fKhSfJWuFWP+VgRhsiJ3SmPwfjgcf6TYD?=
 =?iso-8859-1?Q?DAAnxMI7322XcwI3eGx1uZV3Q3QerJZmUhtJKWvnh6T8ra9mrbMDDQ4xWB?=
 =?iso-8859-1?Q?gj3cWbF9zJCZR+39MKEIIz8QNq2R4C9oZPy76qMIZZNWaUCgIQHfl/WeTo?=
 =?iso-8859-1?Q?e0NkUTJqCBWrEcGpwv4WAb49uY9fh+Ira16X8UJbAx3atUe7OvII9xeHLQ?=
 =?iso-8859-1?Q?p6zecsnLD1LZA9CiraQ7Uio/nUkUhv8=3D?=
X-Exchange-RoutingPolicyChecked: kXg3oHSbgop2WwzcNgRJFSpUDiocsULD36VoSCWxOiWekbVxDkIc3eb3PJIIT4WE+KVd8xVt9oZx02DNQXqklSooafpvk7rEjwzYmDQs7LNBtsc/WOpsUKILeCGjxVuik8AcsB+vrtBGZmZ4w+1NknOBcE5i7OKB/jO37+S6Rc32YyI+sAk+ZxOfbDQkRRfypJquY2407HAr8pvNxGuBAP5xR8DTOUHihdDZbKAnCtgz7e/OvjO7O69WSP6j6tP10wNp58BiFBCvXbZ1dkskcGh33UHQLC/nG6n//iPFaN7oqJiW0syLVMpJDVkeHTNLlkfGnj0964paD7rub5iRng==
X-MS-Exchange-CrossTenant-Network-Message-Id: 40350bc2-1aad-43f4-8822-08df1b3c8930
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 19:38:12.5398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uK9VsAp6q8WtUKw7O6jvjUos9lmTozDAezJrd86YF1HgHC/5iVI6Uysljtiuy9qcXIHFfsn94Mzq4bYrRF1XQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9833
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

On Fri, Sep 25, 2026 at 08:26:27PM +0200, Maarten Lankhorst wrote:
> 
> 
> On 9/25/26 20:17, Matthew Brost wrote:
> > On Fri, Sep 25, 2026 at 07:49:43PM +0200, Maarten Lankhorst wrote:
> >> Hey,
> >>
> >> I know this has been reviewed, but can it be changed to have xe_migrate_ulls_enter + xe_migrate_ulls_leave?
> >> It decreases the amount of pingponging with debugging enabled.
> >>
> >> I kept below patch in my tree that did just that, feel free to merge with this patch.
> >>
> > Ok, I see the potential races where before we get to a copy job in
> > either prefetch or a pagefault before the exit period ULLS will disarm
> > itself - I'd hope within the default of 5ms that would never happen in
> > practice as 5ms is a *really* long time in hot paths (prefetch, SVM).
> >
> > Is this the issue you are seeing in debug builds, I personally have
> > never noticed this but generally run with perf builds.
> >
> > Are you using ULLS somewhere else where 5ms can be hit more easier?
> >
> > Want to get a full picture before commiting to something.
> It causes different behavior in a debugging kernel. PROVE_LOCKING, DEBUG_SLUB, etc may cause
> a behavior change.
> 
> I believe it's better to  keep it as a refcount. iirc I noticed it when investigating a test failure from C
> in a previous version of your patch series.
> 
> In that testcase, the ulls fastpath was disabled before the fastpath completely ran, and a test failure happened.
> I'm not sure if the latter was related, but it made me aware that it is definitely a possibility when debugging
> that behavior will change compared to non-debugging case.

Well ping-ponging should work, I probably had some bugs in earlier revs
but let's me force ping-pong now and ensure that works.

Can we do this is a follow up - not opposed to the idea and we will
probably have use cases in future where we want a longterm pin on ULLS.

Matt

> 
> > Matt
> >
> >> Kind regards,
> >> ~Maarten Lankhorst
> >>
> >> commit 6beeb2f7ff909bdaf9f8b1eeaa014cd15a65c78b
> >> Author: Maarten Lankhorst <dev@lankhorst.se>
> >> Date:   Mon Jun 8 19:05:46 2026 +0200
> >>
> >>     drm/xe: Keep ulls alive while servicing ops.
> >>     
> >>     Instead of bumping at the start, when performing a lot of work ulls may
> >>     run longer, so keep track using a refcount to keep the full benefit of
> >>     ulls.
> >>     
> >>     Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> >> index d28da51d71452..f0b6641dd9815 100644
> >> --- a/drivers/gpu/drm/xe/xe_migrate.c
> >> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> >> @@ -58,6 +58,8 @@ struct xe_migrate {
> >>      struct xe_tile *tile;
> >>      /** @job_mutex: Timeline mutex for @eng. */
> >>      struct mutex job_mutex;
> >> +    /** @ulls_used: How many outstanding ulls operations there are */
> >> +    atomic_t ulls_used;
> >>      /** @pt_bo: Page-table buffer object. */
> >>      struct xe_bo *pt_bo;
> >>      /** @batch_base_ofs: VM offset of the migration batch buffer */
> >> @@ -475,6 +477,8 @@ static int xe_migrate_lock_prepare_vm(struct xe_tile *tile, struct xe_migrate *m
> >>   *
> >>   * If DGFX and not a VF, enter ULLS mode bypassing GuC / HW context
> >>   * switches by utilizing semaphore and continuously running batches.
> >> + *
> >> + * Pairs with xe_migrate_ulls_leave().
> >>   */
> >>  void xe_migrate_ulls_enter(struct xe_migrate *m)
> >>  {
> >> @@ -488,6 +492,12 @@ void xe_migrate_ulls_enter(struct xe_migrate *m)
> >>      if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || !xe->info.ulls_enable)
> >>          return;
> >>  
> >> +    /* Bump */
> >> +    if (atomic_inc_return(&m->ulls_used) > 1)
> >> +        return;
> >> +
> >> +    cancel_delayed_work_sync(&m->ulls.exit_work);
> >> +
> >>  job_alloc:
> >>      if (alloc) {
> >>          /*
> >> @@ -534,10 +544,30 @@ void xe_migrate_ulls_enter(struct xe_migrate *m)
> >>      }
> >>      if (job)
> >>          xe_sched_job_put(job);
> >> +    mutex_unlock(&m->job_mutex);
> >> +}
> >> +
> >> +/**
> >> + * xe_migrate_ulls_leave() - Leave ULLS mode
> >> + * @m: The migration context.
> >> + *
> >> + * Leaves the critical part of the migration context, it may continue to be enabled.
> >> + * Pairs with xe_migrate_ulls_enter().
> >> + */
> >> +void xe_migrate_ulls_leave(struct xe_migrate *m)
> >> +{
> >> +    struct xe_device *xe = tile_to_xe(m->tile);
> >> +
> >> +    if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || !xe->info.ulls_enable)
> >> +        return;
> >> +
> >> +    if (atomic_dec_return(&m->ulls_used))
> >> +        return;
> >> +
> >> +    guard(mutex)(&m->job_mutex);
> >>      if (m->ulls.enabled)
> >>          mod_delayed_work(system_percpu_wq, &m->ulls.exit_work,
> >>                   ULLS_EXIT_JIFFIES);
> >> -    mutex_unlock(&m->job_mutex);
> >>  }
> >>  
> >>  static void xe_migrate_ulls_exit(struct work_struct *work)
> >> @@ -599,8 +629,8 @@ static void xe_migrate_ulls_exit(struct work_struct *work)
> >>                   ULLS_EXIT_JIFFIES);
> >>      }
> >>  
> >> -    drm_dev_exit(idx);
> >>      mutex_unlock(&m->job_mutex);
> >> +    drm_dev_exit(idx);
> >>  }
> >>  
> >>  /**
> >> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> >> index 2e8be10fdb71f..c909e1afb476e 100644
> >> --- a/drivers/gpu/drm/xe/xe_migrate.h
> >> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> >> @@ -98,5 +98,6 @@ int xe_migrate_debug_ccs_overlap(struct xe_migrate *m,
> >>  #endif
> >>  
> >>  void xe_migrate_ulls_enter(struct xe_migrate *m);
> >> +void xe_migrate_ulls_leave(struct xe_migrate *m);
> >>  
> >>  #endif
> >> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> >> index 782ed50a2a43e..51b2cb8fdcf1c 100644
> >> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> >> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> >> @@ -315,6 +315,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
> >>  
> >>  unlock_vm:
> >>      up_read(&vm->lock);
> >> +    xe_migrate_ulls_leave(gt_to_tile(gt)->migrate);
> >>      xe_vm_put(vm);
> >>  
> >>      return err;
> >> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> >> index a1eca4871175b..fc9f587a35905 100644
> >> --- a/drivers/gpu/drm/xe/xe_vm.c
> >> +++ b/drivers/gpu/drm/xe/xe_vm.c
> >> @@ -2557,7 +2557,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> >>                  if (addr)
> >>                      goto alloc_next_range;
> >>                  else
> >> -                    goto print_op_label;
> >> +                    goto ulls_leave;
> >>              }
> >>  
> >>              if (IS_ERR(svm_range)) {
> >> @@ -2598,8 +2598,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> >>              if (need_put)
> >>                  xe_svm_range_put(svm_range);
> >>  
> >> +ulls_leave:
> >> +            for_each_tile(tile, vm->xe, id)
> >> +                xe_migrate_ulls_leave(tile->migrate);
> >>          }
> >> -print_op_label:
> >>          print_op(vm->xe, __op);
> >>      }
> >>  
> >>
> >>
> >>
> >> On 9/25/26 06:53, Matthew Brost wrote:
> >>> Call xe_migrate_ulls_enter upon page fault or SVM prefetch in an
> >>> effort speed up these critical paths.
> >>>
> >>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >>> Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
> >>> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> >>>
> >>> ---
> >>> v7:
> >>>  - s/migration/migrate (Shuicheng)
> >>> ---
> >>>  drivers/gpu/drm/xe/xe_pagefault.c | 3 +++
> >>>  drivers/gpu/drm/xe/xe_vm.c        | 4 +++-
> >>>  2 files changed, 6 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> >>> index f9e5bd41cfd1..f219e9e3b73e 100644
> >>> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> >>> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> >>> @@ -15,6 +15,7 @@
> >>>  #include "xe_gt_stats.h"
> >>>  #include "xe_hw_engine.h"
> >>>  #include "xe_log.h"
> >>> +#include "xe_migrate.h"
> >>>  #include "xe_pagefault.h"
> >>>  #include "xe_pagefault_types.h"
> >>>  #include "xe_pm.h"
> >>> @@ -281,6 +282,8 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
> >>>  	if (IS_ERR(vm))
> >>>  		return PTR_ERR(vm);
> >>>  
> >>> +	xe_migrate_ulls_enter(gt_to_tile(gt)->migrate);
> >>> +
> >>>  	down_read(&vm->lock);
> >>>  
> >>>  	if (xe_vm_is_closed(vm)) {
> >>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> >>> index f66bd1de2b70..425c678f4480 100644
> >>> --- a/drivers/gpu/drm/xe/xe_vm.c
> >>> +++ b/drivers/gpu/drm/xe/xe_vm.c
> >>> @@ -2528,8 +2528,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> >>>  			ctx.devmem_possible = IS_DGFX(vm->xe) &&
> >>>  					      IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
> >>>  
> >>> -			for_each_tile(tile, vm->xe, id)
> >>> +			for_each_tile(tile, vm->xe, id) {
> >>> +				xe_migrate_ulls_enter(tile->migrate);
> >>>  				tile_mask |= 0x1 << id;
> >>> +			}
> >>>  
> >>>  			if (prefetch_region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {
> >>>  				dpagemap = xe_vma_resolve_pagemap(vma,
> 
