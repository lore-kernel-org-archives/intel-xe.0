Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF7DC04FEE
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:43:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFB110E021;
	Wed, 20 Sep 2023 19:43:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A37B10E021
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695239005; x=1726775005;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Y35e7Sm6EdNoxl55I5/QwI8onDTe4mAa7BV6YRMNPvI=;
 b=e639y4HON7tc9Fd0f6bpDHcnwMJY7T6FrWW1/3SrB+L5meH23hkIWF4H
 1wse2x6KVJP1pXrpZJMOnMVQenxe76NraTHK2StIOcP5BQ00gwQifV4o1
 /YWp1tEA3PpuZxukSWj5iiGB/F4adQAwxyfIVNTxcx0MEWnDj9JVZkUeU
 ufMkDCj5nsCFJqdcZoCov5bZ1Zi343LABzgqx+szGXBH3VJ3oKy17nGSu
 UapDZVJ/FBIuO9tgCAG/pd/Eo9LO0Ig1HDtU03FeooJZpDzTEJl7gw52P
 GiglT4McfYXs3QyJCfjNFrQm5ssWDaxvNhZSBG6O8C6unAl32IBZKySCw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="359704343"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="359704343"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:43:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="920421985"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="920421985"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:43:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:43:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:43:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:43:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:43:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRaM0k8gmLclRAzsTodkebfnGA28mWtFdsu78NWqEH81popvoU/Y5pu2extALzwPKlWeQ4hhZiHdEuwWwgxorn65nxraurQ1ZOdFxlVEugZfBBWytw1to1nI+qFD0Gf5y31Bo0llvxlVbJM9oLny6drrAUtSjyYoi8Pe05lGrm8E9hzZ9uu7ZAtC48GkBG01iTfAVymrTquDAirXShdp46eQH8cig4smO3nnN3JC9Ozh4u4J3TnuDIr+VK6VU7yXhecVC4QdjcnKZNrlgnwK1yeXC17jkKgVtz+yjBHHTa8lPaYcmfQpOXxMDyLEVjytRFH9v96Hz756IMmfElr2iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DDEz4JD17xh5MAcVDPa59cjx7+xWi5B3iFTolBU9KxU=;
 b=SaA524Xb17eJxe9BL5O19ggKWwGMhUfXOYLIUVc/MiAnQnrS8eaZs0bXiMLHSoG09icnrnoFeNzPSfDtvWlDEG7HK1UGvkqlan2IFzF2K0rOkI362/6PdAim7bKGmAIf6C81L3zYQJq1H28cDU8aAiynEocdS9qMsSuDo2MgRBdK1qwMmWTv1VTJ2egl+jzDbFwEqvQWkQiOLV19iQ5XEoBOBFlCQeo88HvWof7efsb7CHCIb/eqGaxQ5JMFcO4hOwrKbNFL9Zm37TBFt4UCEbgGWSvIRwAL6x5AY42ILReQI5mhTPhHwPtr201DIweAQahakkjj8OWWCVbBfi98GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB6935.namprd11.prod.outlook.com (2603:10b6:303:228::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 19:43:14 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 19:43:14 +0000
Date: Wed, 20 Sep 2023 15:43:10 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZQtLTgnMqyKNSb5j@intel.com>
References: <20230920082217.2093-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230920082217.2093-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY5PR16CA0007.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: d1fb1357-531c-4c10-3c13-08dbba11d435
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3dAoWGldemr+jjuL/+IpGQZzxw9pFNeW7obcUn/pYQmGNtHeKxvUhvyguZEDdFw6KVIaNcXF5Ykowubx/y9jzvMoLkBjhqBxeSVjXznSGox8xooPFxdnIJTmVmJd6NaCVPsczLgCCIXf3IvEn5/Hosqqn9noVaKYHHeKEm9/t3UDF7iEkr8IyLh+Ia7Xo+Ue4fXXF/NjMkT4L1cyqz+TEym0XDD6SItktH37CIalPk8ftjTS5CZkzqS4BHfpK2hOOvijLJWXwp3Oxtj8C5DbQUIOdm87zYZlyFu4emL2u1PE9brton5AxMTdAqcfc+RNve1fdRiDugr3+QlgWTA7ns51sX0969IU224cRsia56U6gBvMqn0WupgiSKNdTQiNKtirAYbyN0ly7TxF332mQ0UzYPOiQGofmuW8vq7sKrz+ODMAstviDC7z3QYVZmjMtnXa4sc1KhJ8JWmQaR0PvOiiZ1j9Z6Goj/DzhiEaXkjiMZlUrsbIit2PjhwQxNiUwmhIj/40pPs6mfOSF6Qh8aO22rnqQHuNSSuJCkzaWYJ0z7WJku0SXoVGlyy7ztN/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(346002)(376002)(136003)(186009)(451199024)(1800799009)(2616005)(26005)(6506007)(6486002)(6512007)(36756003)(82960400001)(86362001)(38100700002)(66574015)(5660300002)(44832011)(83380400001)(66476007)(478600001)(41300700001)(6916009)(316002)(66946007)(8936002)(4326008)(8676002)(66556008)(6666004)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2e0LPR5yIYdh8Ogk16kLLtLw/FciiSriVMDQggqY73YXL56UrrGa8lz82J?=
 =?iso-8859-1?Q?r3PPa/LggrSRXlmFqTQuu2xdYIU7d4+Esg/cKm84Ommar3r068q6mN16SV?=
 =?iso-8859-1?Q?EBB89zqxg3Ax2TT/i1M4jTfO6ul/+GEDskzkQp5aVytReeCzLEfkiF8bKT?=
 =?iso-8859-1?Q?FqPECxftxp6ecMbE4HzTaoO+wDVxh3MHigO2CkXBzklW5CQ2hxDDgKrXLU?=
 =?iso-8859-1?Q?+CY7RaYJcWnAgoeVWYvqk3RllrKczHHKZlO+M7nTvVmRFv0P19FEApCXvO?=
 =?iso-8859-1?Q?f6tmq9ih0yCppF3gOp/5QDtoyMMJrnjLCZ2XpjGMsyFW3Ced66T0uziwe5?=
 =?iso-8859-1?Q?e7M3BrjLm+bnd9iEOF8jn9JGOZzF2YP/yE3NE/O+75wBaCAXhFc5qKf+aC?=
 =?iso-8859-1?Q?icLqAtknVAWpx2MNFE/HKGzIlOROm+Fi/2gAONCgOElwiJp13Zb4bLVdLn?=
 =?iso-8859-1?Q?Em47AtwPY+cPcULjJp3p2z71Udggg/3AFqKt55+rNZ2TdyhvNXebJJtr7J?=
 =?iso-8859-1?Q?wwuncTiZJDXW6Or9WbcCDf3OdRz2XrZW5XGrIRsZNH99d+jFYpNYKHnBdX?=
 =?iso-8859-1?Q?xyXggWEZRWX5wMDcVzNk4FccjFd56j93CkPaxptn0NhQFTSwR3yc0EXI/F?=
 =?iso-8859-1?Q?kFqtciWvVHqRIzKWSnMNy8yeahMmhDstsU5NABzJnouNvBiqHJd1XB/8Ud?=
 =?iso-8859-1?Q?Ic4QItf1w3pJVosLb2eq/QciQmfeBoMsl1bejKB7izOagiwMOSXJLXSQLc?=
 =?iso-8859-1?Q?LTeQ6OhWRzvNfaFaTmiKi47Rh/wTA4p7+ZpV2T/AO6Uo9BVKHz/PhBX4GF?=
 =?iso-8859-1?Q?cpDLQPZSdi1JL1OYuSEv0FA/Rt/7hs8gY8XfeVTRM0qCPhMqs+Hhv52Qnt?=
 =?iso-8859-1?Q?mLpyhJT3aEAZ/3xpphvKIbWkltrAlh1fNSy4px63en76i0BR2qo1VTfh04?=
 =?iso-8859-1?Q?OVs5slldcH8rqhQIahxGmriF1Pz3Dx+ekpzuQI2X8LwuLN99Oss/QVOw8p?=
 =?iso-8859-1?Q?lWIuDSxhou1/LexT7aPaj6eUXMOXN96aaGOz940PJPNshW2gxofSdtDUSP?=
 =?iso-8859-1?Q?QYznuql6AehYs5KuYvseabcjSQhoB1UeWUTM1QH03gyIZzXcB6vl/yqqsS?=
 =?iso-8859-1?Q?rXCksnuHVQ3g74wanGNXZPiCle2XwRb4Hb0jo+kD1VfdX+Kj6mWHLUPxV9?=
 =?iso-8859-1?Q?oSS3wfFaaMhGlleD07KXKjocS/JrW5qLJNre13FfMT/a1W1Tiw/c6/tZL+?=
 =?iso-8859-1?Q?/orp9KWFpN+LoQd87bDgsShHjZ3OqodRoJYuWw2uUO5opKSR9sx8u5+r5R?=
 =?iso-8859-1?Q?rDBYb0QRwW7pJPmoasLw0/gX3Jpk9B/hxxxrTlGUWCY3PXl4nK/6fieI/9?=
 =?iso-8859-1?Q?+mZ8va5ZNpHrlj3fPy4bkO33o1BJLby8TVs3F7qerdvx+CtS7nyM6YCAk1?=
 =?iso-8859-1?Q?1VXit6KcETOjOzd2XVa4hACLdjRXTsaIw/8DJSlaaQquVE7SnDl1K8m9Pz?=
 =?iso-8859-1?Q?U05l5ZiOLCDlYem7dsA0Bon8/dA4pXbyfvZy4x31ZBq7pmEY7FvBbnMIpV?=
 =?iso-8859-1?Q?dtXG/PZq8JFUcgUSjlxlzNZAqFjJF9gdwebxNRnAmQpAYgqXYtX/3d3cE1?=
 =?iso-8859-1?Q?7Ckz84ULWZ5jt3hf5lRrKJVCZEG4u8cYXxLL2LzvToxo86zqtk3wdiAg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1fb1357-531c-4c10-3c13-08dbba11d435
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:43:14.4083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XLpfGKdB/36lkt/oTTO0ktpzqVNrYB0NKM6cv1HEH84bAOUmi/nkxcGYMx9X5/Js0LAFEQ30s8nY9K9Cajy4/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6935
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/bo: Evict VRAM to TT rather
 than to system
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Sep 20, 2023 at 10:22:17AM +0200, Thomas Hellström wrote:
> The dma-buf kunit test and to some extent the dma-buf code assumed
> that all bos were evicted to system. Fix this by having the dma-buf
> code not assume anything about eviction placement and the test
> code assume that VRAM bos are evicted to TT.

I believe that we should minimize the fixup patches now and use that
only for the display ones that still need a lot of work.

This could be a simple Fixes: case. And even the commit message is
very good for a standalone patch.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> The patch applies using automerge conflict resolution.
> 
> This fixes the following errors:
> 
> [  102.102086]     KTAP version 1
> [  102.102102]     # Subtest: xe_dma_buf
> [  102.102113]     1..1
> [  102.102377]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> [  102.106167]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
>                Importer wasn't properly evicted.
> [  102.106327]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> [  102.107136]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:98
>                    Expected xe_bo_is_mem_type(exported, mem_type) to be true, but is false
> [  102.107691]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> [  102.108099]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
>                Importer wasn't properly evicted.
> [  102.108158]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> [  102.108294]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> [  102.108742]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
>                Importer wasn't properly evicted.
> [  102.108800]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> [  102.108908]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> [  102.109080]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> [  102.109842]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> [  102.109941]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> [  102.110131]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> [  102.110236]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> [  102.110402]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> [  102.110731]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
>                Importer wasn't properly evicted.
> [  102.110790]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> [  102.111498]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> [  102.111793]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
>                Importer wasn't properly evicted.
> [  102.111851]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> [  102.112302]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> [  102.112580]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
>                Importer wasn't properly evicted.
> [  102.112638]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> [  102.113292]     not ok 1 xe_dma_buf_kunit
> [  102.113296] not ok 1 xe_dma_buf
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_dma_buf.c |  5 ++---
>  drivers/gpu/drm/xe/xe_dma_buf.c       | 11 ++++-------
>  2 files changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> index 1c3f4bc72b99..1c4d8751be69 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> @@ -72,7 +72,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
>  	}
>  
>  	/* Verify that also importer has been evicted to SYSTEM */
> -	if (!xe_bo_is_mem_type(imported, XE_PL_SYSTEM)) {
> +	if (exported != imported && !xe_bo_is_mem_type(imported, XE_PL_SYSTEM)) {
>  		KUNIT_FAIL(test, "Importer wasn't properly evicted.\n");
>  		return;
>  	}
> @@ -91,8 +91,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
>  	 * possible, saving a migration step as the transfer is just
>  	 * likely as fast from system memory.
>  	 */
> -	if (params->force_different_devices &&
> -	    params->mem_mask & XE_BO_CREATE_SYSTEM_BIT)
> +	if (params->mem_mask & XE_BO_CREATE_SYSTEM_BIT)
>  		KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported, XE_PL_TT));
>  	else
>  		KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported, mem_type));
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index bd8d51e7f93f..cfde3be3b0dc 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -98,13 +98,10 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
>  		return ERR_PTR(-EOPNOTSUPP);
>  
>  	if (!xe_bo_is_pinned(bo)) {
> -		if (!attach->peer2peer ||
> -		    bo->ttm.resource->mem_type == XE_PL_SYSTEM) {
> -			if (xe_bo_can_migrate(bo, XE_PL_TT))
> -				r = xe_bo_migrate(bo, XE_PL_TT);
> -			else
> -				r = xe_bo_validate(bo, NULL, false);
> -		}
> +		if (!attach->peer2peer)
> +			r = xe_bo_migrate(bo, XE_PL_TT);
> +		else
> +			r = xe_bo_validate(bo, NULL, false);
>  		if (r)
>  			return ERR_PTR(r);
>  	}
> -- 
> 2.41.0
> 
