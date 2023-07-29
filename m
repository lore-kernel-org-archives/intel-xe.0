Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852E3C0015E
	for <intel-xe@archiver.kernel.org>; Sat, 29 Jul 2023 04:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D01D10E0C8;
	Sat, 29 Jul 2023 04:14:43 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB4110E0AD
 for <intel-xe@lists.freedesktop.org>; Sat, 29 Jul 2023 04:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690604080; x=1722140080;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5eUWR2fNYiy5roez2Nx4IPHw/yu3MGZ+JQji/HaFkV8=;
 b=OUayN6vLMJ/ynFVIL8z8XZ6M9zqVTpmaxWCh1K3k1VKGIbyrnTt69RSH
 RqtZqwkuUxZK8C0qezRvYKmSlBJO+FdHZ/YIRiFY2UGfh/flck8dDYfQn
 kTPStBdNKgDo9ndffwDWJ3fD0uBGP4xxXncmPBePr/HimFIu0SJJu+Eyx
 NOZoFZlI+xa+sp4D1TIejXW08e4XXCGWftHvqflvodklDP1SZR2SU71ud
 DrbzrZKlYH4coIYcbUUnZhiL9Rzr9yXUfPgSY8FfWf6KAYQKPpAEEoDoR
 AjFabfErjKUhf7aOYOvvRFjtlC0ipSfkbjzHX8j2VcJDlzWzAHSYfz1bl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="455086302"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; d="scan'208";a="455086302"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 21:14:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="730976652"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; d="scan'208";a="730976652"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 28 Jul 2023 21:14:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 21:14:17 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 21:14:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 28 Jul 2023 21:14:17 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 28 Jul 2023 21:14:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/cKAxtBoQ7PW2CzJB37FKyfgII9DsvEjOKmDGxorTShahEbXBp92oY+6/6zwaSzyi/Gf2/b3bNL0KCq3FAgoQXftzU2SpFsnAVJ5393e2rVwBTBbqcw0BjnjKJnDeG6edv3B46UUzq8eUA4b+Wtzh2sbG3/OspmLcp3CBBLrIfGQoD5ciZfYiLwt83i6KkbIP6qfrzvJT6N6JjDzcDYOUizLx61mRb5z6TS7zk/50ZeyPLRWqnG9/a4gNINQekS2RFy/uKwbRZQrVN3uvXuYAfNvpOZQswi4q4YqYWq4oJ7A0FOiCaGWj+Ja7V+vcKBD1gkhPob9SxvscLpQDQ5vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7mdxj5roowr3QABcvxWGyqhEXTrL4/Ocght5pUs9aM=;
 b=bXWBeHc/RZRVtvT7x5BAio06BdPeP505RwCnpcwqyf1L6jS4wtwOlb7m2TVu6xRnc7lXJiFBZCOLDswoPTlLsuGfBq4xLC5IAsEyZvbORJZDPlg+CTT5cO9HTMb/ziLww3sHGQtIFOGbLB7ePEw8j8kYGZWCPL4MVqUz+FhMqyEs8ehEWYzjc/JJ6DUWx5VCQIfClVoHJz1/AHpzP5OffgKWWINlaPUVafI0WGzJdKfzy1vJbzpi5ZLEGxoisvGnGHKn4w/dQFyfEWTo5O3+uyonfhQwwMEhtVtcua3AFJrGaoCRcGxlVeA2aYfNcOsd4G94BImRKTZyE9MVCpCiMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7867.namprd11.prod.outlook.com (2603:10b6:610:12a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.39; Sat, 29 Jul
 2023 04:14:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6631.026; Sat, 29 Jul 2023
 04:14:14 +0000
Date: Sat, 29 Jul 2023 04:13:28 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Paulo Zanoni <paulo.r.zanoni@intel.com>
Message-ID: <ZMSR6A99KrbjIKMg@DUT025-TGLU.fm.intel.com>
References: <20230729033059.2120121-1-paulo.r.zanoni@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230729033059.2120121-1-paulo.r.zanoni@intel.com>
X-ClientProxiedBy: SJ0PR03CA0335.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7867:EE_
X-MS-Office365-Filtering-Correlation-Id: 195cef78-83ea-44ec-5d48-08db8fea4454
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x8tCxHFivvEjmAOdAiGwgNRHnfoFT5su6LzqAukMoNwCc2sxO4IvFojsC7dTsYJ2E8w4FCjB3klmAFV2iHYgiHlwCmUBkQ17rTaDDytLR8oGMTa396E/4bZoJsqg5dDCyqp+6FElnjKlGKk5DAcSA1DlH9r5AkBGutnhB0L8AZMO3masaM3WuKUuTziQEdPL25vBtJLVwy9/5PQTdPmVWf3HvTK02t7Vv08tiQ/NU08zxD4QYwuFEegAqE7yqXKuZfnEtMeuIdUhnSldUlc6qp1eWM6OncdqmdVt5knetzZDol+YKErlvGb9cKnsM5+7gwEFc01yI9d7o6mIxzfVANeCMeLswC58U93HyNHyPHgwj23u1PSMYSWMwqC7XRNuJPK5iZSonPpSiLjKGDNckz4MCjhrh1qs6bjBCkB0+a3euoleUnru7ZoOv6Ew+MZcNfGRb9wrJo5d8P2bxF1F6VXsa+92529uq6bDNz/MxlEyIgvgmJkAcMyWwhQsassppz08F4Lpa1ZqlX37KirEkY/HqvHNVHWGAI0ZSqXqDgY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(376002)(346002)(396003)(136003)(451199021)(6512007)(966005)(6486002)(6506007)(26005)(83380400001)(107886003)(186003)(44832011)(66946007)(66556008)(82960400001)(41300700001)(86362001)(66476007)(316002)(4326008)(5660300002)(6636002)(8936002)(6862004)(8676002)(38100700002)(2906002)(6666004)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jt7MqqA08dMxXdeH2yv/hDIpi0+D17tdbW7xGV+/FLnvV8kRSCkryFhHezmc?=
 =?us-ascii?Q?1IH17wksbK6BBeTfDAXKAOHZWCbAtjzfp9wiE/d8rXnMHiN8gW/rAaqNYgm9?=
 =?us-ascii?Q?saUAOILYSLZIOj5emu+/d/NHzaN0p6HM48fehDHk8baPc2aD9tRg9wHQlkne?=
 =?us-ascii?Q?RgmWP5WPVq6t2GOmYmSWma2MKPYD6S6yPMJtOquVmSFvECyMdgimF+qYD9u9?=
 =?us-ascii?Q?D9VJ0Gl5Gp2acSwveugq8ZTMHLVNMzdyirzZo4cnNIrWihJCK1zxWILMD3V+?=
 =?us-ascii?Q?q7KFnZaRPbpXSzYTnbscpL/IBpNT7r114ZWwVtYH+9DhFth0HFTfeFZEwikf?=
 =?us-ascii?Q?yl4ugjAXf9soNNFXH7Mky01YGnDPK6/xHr+XZKaCwccr5ezKhslph7eBZJ6s?=
 =?us-ascii?Q?1MrQxbXbE02pirz+ZpSI6P8u+GJ7cGBpFZBqua+1XPE8jOeOiDdP9AtAjThG?=
 =?us-ascii?Q?UUKSGlIF5Sqnjy880bVbJECJ0ThJaaWNFCVHwclnaddml0StKpu3MyfUMSHZ?=
 =?us-ascii?Q?0tEkdMSKquMhDYxuwzMwO08l1kRyx6h0mpWzJQ/slnHeA92bVQDJJcyuHPFv?=
 =?us-ascii?Q?Q+x6lgd41aGqUXJeJjOgXTokBF1vcITLq7lfmCiomMLzLMatLKRn9DzfM8tg?=
 =?us-ascii?Q?2XR9wRNwYSgw6fbSAo2oFN3pKfMBxLv8yuKBl2OuHjYWuJBeSVog7EVqrwTz?=
 =?us-ascii?Q?vixcOyBcj/Nwm/QeywDKn4+tPq12Bw0JdPyCHp4T1SFCY5E3em/cVgZexxPE?=
 =?us-ascii?Q?LwcgE+wFpMzKEAdRLJDaN2xNsy/ERY3xb0TBQtp36BiVVyHwnFG2ypzIrWeL?=
 =?us-ascii?Q?d2+uw/CM5NeKUK17YMax1vSUcyc++ufRQTSv6PH68SYtsniKhoXBZCs3U43f?=
 =?us-ascii?Q?DdQ4MFoK8WnSXPhX8btbtxVKCbx7vd/sHazaA+QgB/dPmzK79g3zIB6NkTo7?=
 =?us-ascii?Q?528uhgXSSS2KMmSKufJVEf99aNKoK6K9ihs2FfKJ2DW5dGH62JKcZ2IDFRdw?=
 =?us-ascii?Q?zfOh0wkQi8lo/MJlAZeyZIZJpCr+IkRmxqGgdmtZ85yRCGBUbNqYXEUyDDWk?=
 =?us-ascii?Q?1HZaXnYX1L8gykEDGKp3rdRNYLDPg04leeNCwfiAEEA1HutaNrZNxJAf4uqu?=
 =?us-ascii?Q?jgPZqGk/zRzDUkuHSPZLasOReXjDZPI5z7N1mFAHk+slI63BHPE/+l9bsLTY?=
 =?us-ascii?Q?i2QV+B0Ph4Oe+1lGplu6WYMcJC2s/tSnJHKomBSJmtVKDUuzEeFFhLK25Z4O?=
 =?us-ascii?Q?D4jD/U3BabuJpIwvVNh+DyvXrdqHuW1c/DktXvyktM6X4LQwVm5vM5B9xUB5?=
 =?us-ascii?Q?BJ5FlejREZkNsJHsymWUtJMw4bfZZ0qsgqy0wNQ/XkyrwxipvILDpAaxli+H?=
 =?us-ascii?Q?P+iZlebc6r/HWIrPcYwyptBdqkJlPWdWvOCmcc04EHvt/6HNAVU35CMCoRTV?=
 =?us-ascii?Q?U05D3OS7OJ6NGUaOTP8CKiycd+yIhfSLt+/l6iiaanmvy8mX6dGh61Iwao+c?=
 =?us-ascii?Q?KEtZLyljgEjlU9yUACf3HGRAer+cZDUjextLFVoSWQ20SeidO9RccnjUyFKR?=
 =?us-ascii?Q?InOTcfnHD5YUVPd2UGBlyk5o8iuYb18zN1WjCA/I9mi7quOt2UwiqVEH8phK?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 195cef78-83ea-44ec-5d48-08db8fea4454
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2023 04:14:13.5996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 574UR9mkDep/7LklM9EDU3GpD+iWrhfgQ/jT7yVlXnnynF2u42yszWGsUnDJfQF2chdBpJ0+IFRK/2NSb02DCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7867
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: don't skip rebinds if there's a NULL
 binding involved
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 08:30:59PM -0700, Paulo Zanoni wrote:
> Commit a042bb4ca894 ("drm/xe: Avoid doing rebinds") causes
> regressions in numerous Vulkan dEQP sparse-related tests. The errors
> happen in tests that:
> 
>   - check residencyNonResidentStrict=true behavior (use NULL bindings
>     and check that they read/write zero)
>   - and use buffers bigger than 2MB
>   - and write through sparse buffers using compute shaders with ssbos
> 
> So for example, the test:
>   - dEQP-VK.sparse_resources.buffer.ssbo.sparse_residency.buffer_size_2_24
> 
> fails only if residencyNonResidentStrict is true, otherwise it passes
> (becasue otherwise it doesn't check the values of the ranges that were
> supposed to be bound through NULL bindings).
> 
> But the test:
>   - dEQP-VK.sparse_resources.buffer.ssbo.sparse_residency.buffer_size_2_20
>

Thanks for finding this.

> always passes because it uses a smaller buffer, despite doing
> everything else equally. By maninpulating the sizes of the buffers we
> can see that 2MB is the range where the test starts failing.
> 
> On the other hand, some other 2_24 tests were passing, despite having
> 4MB buffers and checking the contents of NULL binding buffers.
> 
> I can't claim I have a deep understanding of the code invovled here,

The problem is if you go from NULL to non-NULL or vice versa so I
believe this fix isn't quite right. Let me try to respin.

Matt

> but this patch seems to be the minimal 'revert' that fixes the issue
> and should be a good point to start the conversation on the mailing
> list.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Testcase: dEQP-VK.sparse_resources.buffer.ssbo.sparse_residency.buffer_size_2_24
> Fixes: a042bb4ca894 ("drm/xe: Avoid doing rebinds")
> Reference: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23045
> Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 6429d6e5113d..955f664ff1f1 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2512,7 +2512,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
>  					 * Userptr creates a new SG mapping so
>  					 * we must also rebind.
>  					 */
> -					op->remap.skip_prev = !xe_vma_is_userptr(old) &&
> +					op->remap.skip_prev = !is_null &&
> +						!xe_vma_is_userptr(old) &&
>  						IS_ALIGNED(xe_vma_end(vma),
>  							   xe_vma_max_pte_size(old));
>  					if (op->remap.skip_prev) {
> @@ -2547,7 +2548,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
>  					 * Userptr creates a new SG mapping so
>  					 * we must also rebind.
>  					 */
> -					op->remap.skip_next = !xe_vma_is_userptr(old) &&
> +					op->remap.skip_next = !is_null &&
> +						!xe_vma_is_userptr(old) &&
>  						IS_ALIGNED(xe_vma_start(vma),
>  							   xe_vma_max_pte_size(old));
>  					if (op->remap.skip_next)
> -- 
> 2.39.2
> 
