Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE115EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 17:53:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B428D10E52F;
	Thu, 15 Jun 2023 17:53:19 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A3310E0A0
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 17:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686851596; x=1718387596;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DE/JhvnRcmXIQ20ygftvd3RhLuGCQahatiBGJYn/ga4=;
 b=aDwgupquupFfxHnQIYacQKFPNDyuUwdVT/dJTiwJUHGLepP4gfurhmRV
 hH//hhfjB6FmVVWHLogn37l3cc6z62bnfaAsYFJkukEDPHQp3QAEbsjYM
 O7UXL4CZLyVrCtRgCkOUCs+YjfUt+kRe8n0bvtgwXl5sYR85i8GyrgZHO
 jeX+fbrrkpbgahPaskDjrWDtqRoHOS8TgRvH7yObK/1V+S4NSrqCsq+MZ
 VgI/JCBoRBdvbE+84FuuWBOPgg2wsy99wrpCCa7NQLRWNHfp0aRoraZBr
 ZXK5NcklszBUIjtgGO+fT5ihJY1E/nwBjFvMWyyLTmOOlrP2o8hVl0fxB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="343732747"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="343732747"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 10:53:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="742325555"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="742325555"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 15 Jun 2023 10:53:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 10:53:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 15 Jun 2023 10:53:14 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 15 Jun 2023 10:53:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgUd7uzNbBqB0nS9nQ/4JsUGLyR5PBJw7XgRvSF74aejoG38xD3pJBm8+TWcV9nPO7c3YRlYwhTYGooFquDD0Qyk5wV5I8N650p6QjYflO2JZkzsQ4EmCMXm8QeqBy3FJw8Wh9fwFj0kybOKGdk0TcQZfBsNzojlhw4APPJtHCDai4RyI2FImTzTJESEv4G//6IhAxWawENTBl0xrdiJy0Fl0hKFlCeSXj3QhJsVkEQwMFdCwFzm1vdmChZYxK9Cgr4dpkZeXzmSsUGLvMlKBAS84z1gxflZ2nAsGDzg4c1Ui4IhEfSgglE+CIPg3UUiKBDVhdHPsEbhvG7CF8csdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJQSiIENOwG5rRkOaWaderQDNG6H6jpCochX8S48tq0=;
 b=Py8189g3Ec7OA8HN3WFSorclwVdXnvHyU8WP7iiUR7MoUfM7Yo9xXdO+pp9h0xPMUtoYatO6XZxrb/hls7MFl8L9XrSLDzYKR+QDG11VA45RjLbTJNlU0wCCFNMgczUfFRQpon1an+UnOmMWiAsofKBPcM0ecG3gXu7p9yKVVGKsFNFqOM5J4hD+WIm78qU+QkSzrwL0VlymhTbdscFzf5qrtXE4rQWMCJMjS9RZTPQTJoZ9s8WBBR9sDHcF7hCovAYVcbnrHGhw0reQClZhEWJgx6+7KafRs8mYWG0RZZy+lvcxL0tsiJzENFbs5501uTgxWbAujB0okcE0KM7LMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7453.namprd11.prod.outlook.com (2603:10b6:a03:4cb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Thu, 15 Jun
 2023 17:53:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6477.037; Thu, 15 Jun 2023
 17:53:11 +0000
Date: Thu, 15 Jun 2023 17:52:39 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZItP53MCQL5DEviz@DUT025-TGLU.fm.intel.com>
References: <20230608050333.37581-1-matthew.brost@intel.com>
 <20230608050333.37581-4-matthew.brost@intel.com>
 <383a45fa-9eee-a292-d9df-21b519a0e05b@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <383a45fa-9eee-a292-d9df-21b519a0e05b@linux.intel.com>
X-ClientProxiedBy: BYAPR02CA0041.namprd02.prod.outlook.com
 (2603:10b6:a03:54::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: 46d00eba-184c-4e3d-f37f-08db6dc96262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ldwrbCWIEVp/iYidqo2Pszixq3CrS1jMnPiyO5xPV5a+cl04XLdK99sb5NmCNfE7C9dYimixm6AMlxAWZ82k4DxRFw+ZBIYaLavp5Qx0QzZRvnpuOsWOHydTBnTGMtaEIpBhnORoZk7ew9VlFSyOKgXpW6BTqftJN4hlGQf27CLoaJGQKGzBWkl6dyYzy2/S6YpQR/Szr8UUADwMq6pexlMRt7MkmxgKQRM/TBCDZj+vd4Is2xIAmJV/XdDimb+Zjuu0+/uSpmofkz1QqfvOpekJF58IF8lZPpFzYyBvevmPWXlsKnSWTCHKh50MpjL4kcNTwUuBuAdSilKGZ9ivIbK68VgCCqCAS701BsBfm0gaWPCnxXT/Cz+MWlLoDOtQRRC3q8MlCp54fnyBn2W6MDk3b/6aF9EdUF4adIwT/Ebn1E2hQh3Po3wtU8XYDxngHL3M3PVqdZlK+GkLtJ4Rql6zkArmahpS3MsJQgIxIK/WBauMTo7/FtkvUG4R9lJFd38soQHGC+i+0wQABDO0/e9YROM09KM5fDAK178KZmNswq+LU7TkHYwrk7Nl0iUW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199021)(478600001)(82960400001)(6666004)(6486002)(38100700002)(83380400001)(66574015)(186003)(6512007)(6506007)(53546011)(26005)(316002)(41300700001)(66476007)(66946007)(6916009)(66556008)(4326008)(44832011)(86362001)(30864003)(2906002)(5660300002)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GSre9d0TKNLYdfjiotW0xsgb+vlJOzvEXbDN6GZmd8u5U4Qlucq4733OZV?=
 =?iso-8859-1?Q?sqLrI5u4io4ObY+VwJf1HhPyqaMVw9/N/yGX/PDgqTbHLAxzB0q4p3Ccmo?=
 =?iso-8859-1?Q?7ToAVTZK1GgBpyb6LU9Kkpnn/3epW7GULrbqLVtkn18KmCWzpivKaQ9Xt1?=
 =?iso-8859-1?Q?jVmdHpIk3Gc/KiskiCFXdnCHsbb99xJouuEhTRrLJRpmsRvb/dB7koJMt5?=
 =?iso-8859-1?Q?SvYwxp4y34nOjqAFMWFlcswO6Q9nUU+bpSOI1F6cKjJ2NSB8Aa2GzOvkNt?=
 =?iso-8859-1?Q?xfzJgyxW7Sq6yTcRByvmN/Kj8gW0cgiIgMxyUEbosiUQAJUJvx0+L326U3?=
 =?iso-8859-1?Q?4A8qa7kwscWl/8Wf0DtkpmVaik9CpCb03RXiDILuauHCDgULWfIboHcPhC?=
 =?iso-8859-1?Q?3/J6kFPodm09lae9YDfTfr9b4WtM3656Styc2OHmcr4Xw9QeLaJHDMcioH?=
 =?iso-8859-1?Q?TFgkqJ9HjWGmelDqEr71jkIR5b8m5TnLjsIMKByieGQxLMoRH+uHDy1LBW?=
 =?iso-8859-1?Q?a/7RW4hDRtHSgwpmKVGQLC5Hnaakmew9KJuzGxGcloFVTWfNV1KvdhN6WG?=
 =?iso-8859-1?Q?k6r1zN4nQugDFNB0fSO594H4EKWZ2TKvqqg6BbD/OPSwZZdietbYGYDuPJ?=
 =?iso-8859-1?Q?qgbiFLf19vQBukTg7qoV1VVQNQOVsgPEaXtRFjLjjj+R2cIE5HryOfqklb?=
 =?iso-8859-1?Q?XOCo398YWnm6bJ3hRe7Po3kbuCtKuftAcLagUkytxKsufgyJokVeoS7tyC?=
 =?iso-8859-1?Q?ldBPuyGpqx59akusF0a8xzXSXTivPnVSEwL59lYjLnTB1p4hfzZt4MmM6t?=
 =?iso-8859-1?Q?1ANAS1YelWm+OGRNqbN4/xCc8dRxzUbjxIZQ3T2dttufnagyiA0jdHqHuI?=
 =?iso-8859-1?Q?at8EViArqLu6AWSdNFrfKU8BUAcj2nuip8Y25Jo7ylg81w5zgWmO6c0r7J?=
 =?iso-8859-1?Q?/ZsWxxp4ooiMq35ATtFQ26pHFH3yL431BCJZwfn9Hg4lqbew7UtZdz03jz?=
 =?iso-8859-1?Q?D2UQIVEZgl101Wp1pSVanvTX750fyc7Ot6mqVfmR0iFMw3ch8VO8mgqBAe?=
 =?iso-8859-1?Q?/QPrBqOsT8rPcjiKZWiA/2IQThZw+Ga5nNu93pJbBue96yh1N2OOZZaVMr?=
 =?iso-8859-1?Q?eoqTax0eZ7q+1PQPcndBL571p6WAaR/g6I4315ChAMUBTCHfV5HJPTsPQj?=
 =?iso-8859-1?Q?16UnXMm5QNcUHtXbCIxnM1bKC9TMoFMOFaw6tl4hjLk/P3zfWr0nCNm3XB?=
 =?iso-8859-1?Q?iGXLFu3bGknno+gyxQA2WCys7JNsiFku911byNGEmc4m3v8XILqhxZo72E?=
 =?iso-8859-1?Q?Y3bFxziIMyXxomyrr/abw50CiD1BTYh4QtbWOpg1RPNshAF098Hv0ucprm?=
 =?iso-8859-1?Q?UGu1Fso/30ViapSn0U7scUJ5Pj6lodNmVNZNfogCrrVSI1tA4I2RgeUqiN?=
 =?iso-8859-1?Q?+Z8A7NM05eYUjRMybDFIjQL4l2SkJXnc00eaxpCBFQtK0ptQ0tNcKooveF?=
 =?iso-8859-1?Q?Ry3lkRtaJ//HS921VK3UlQ4R0VooztJew2yJQXiSJHIomi4/ZFMNMwZTq+?=
 =?iso-8859-1?Q?qxsu+qLpo5ZGhVUqXZybsebUcOD8bnipB3Jf+tG3G0qdw7LTxgviGE99eJ?=
 =?iso-8859-1?Q?jdGulNxmXtQC/m+LXCJrcvxpNBK6+pAExEfgba0JMFrFwscBtJNn1RWg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d00eba-184c-4e3d-f37f-08db6dc96262
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 17:53:11.1050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qPx6/0YgmrS+KsGXWtjZojIfk8df/w+utBQBSuWyhWs4uq4LdWvJp10jq3BruMQW9onodOKG70NoQRmbEJy4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7453
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: NULL binding implementation
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

On Wed, Jun 14, 2023 at 10:17:13AM +0200, Thomas Hellström wrote:
> 
> On 6/8/23 07:03, Matthew Brost wrote:
> > Add uAPI and implementation for NULL bindings. A NULL binding is defined
> > as writes dropped and read zero. A single bit in the uAPI has been added
> > which results in a single bit in the PTEs being set.
> > 
> > NULL bindings are indended to be used to implement VK sparse bindings,
> > in particular residencyNonResidentStrict property.
> > 
> > Suggested-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_bo.h           |  1 +
> >   drivers/gpu/drm/xe/xe_exec.c         |  2 +
> >   drivers/gpu/drm/xe/xe_gt_pagefault.c |  4 +-
> >   drivers/gpu/drm/xe/xe_pt.c           | 71 +++++++++++++++------
> >   drivers/gpu/drm/xe/xe_vm.c           | 95 ++++++++++++++++++----------
> >   drivers/gpu/drm/xe/xe_vm.h           | 12 +++-
> >   drivers/gpu/drm/xe/xe_vm_types.h     |  1 +
> >   include/uapi/drm/xe_drm.h            |  8 +++
> >   8 files changed, 138 insertions(+), 56 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index dd3d448fee0b..3a148cc6e811 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -61,6 +61,7 @@
> >   #define XE_PPGTT_PTE_LM			BIT_ULL(11)
> >   #define XE_PDE_64K			BIT_ULL(6)
> >   #define XE_PTE_PS64			BIT_ULL(8)
> > +#define XE_PTE_NULL			BIT_ULL(9)
> >   #define XE_PAGE_PRESENT			BIT_ULL(0)
> >   #define XE_PAGE_RW			BIT_ULL(1)
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index e44076ee2e11..4f7694a29348 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -120,6 +120,8 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
> >   	 * to a location where the GPU can access it).
> >   	 */
> >   	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
> > +		XE_WARN_ON(xe_vma_is_null(vma));
> > +
> >   		if (xe_vma_is_userptr(vma))
> >   			continue;
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index 73db7f7c0381..6faebd02f3fb 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -533,8 +533,8 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
> >   	trace_xe_vma_acc(vma);
> > -	/* Userptr can't be migrated, nothing to do */
> > -	if (xe_vma_is_userptr(vma))
> > +	/* Userptr or null can't be migrated, nothing to do */
> > +	if (xe_vma_has_no_bo(vma))
> >   		goto unlock_vm;
> >   	/* Lock VM and BOs dma-resv */
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 39ec94549439..265ee45bee5c 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -81,7 +81,9 @@ u64 gen8_pde_encode(struct xe_bo *bo, u64 bo_offset,
> >   static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
> >   			   size_t page_size, bool *is_vram)
> >   {
> > -	if (xe_vma_is_userptr(vma)) {
> > +	if (xe_vma_is_null(vma)) {
> > +		return 0;
> > +	} else if (xe_vma_is_userptr(vma)) {
> >   		struct xe_res_cursor cur;
> >   		u64 page;
> > @@ -559,6 +561,10 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
> >   	if (next - xe_walk->va_curs_start > xe_walk->curs->size)
> >   		return false;
> > +	/* null VMA's do not have dma adresses */
> > +	if (xe_walk->pte_flags & XE_PTE_FLAG_NULL)
> > +		return true;
> > +
> >   	/* Is the DMA address huge PTE size aligned? */
> >   	size = next - addr;
> >   	dma = addr - xe_walk->va_curs_start + xe_res_dma(xe_walk->curs);
> > @@ -575,6 +581,10 @@ xe_pt_scan_64K(u64 addr, u64 next, struct xe_pt_stage_bind_walk *xe_walk)
> >   {
> >   	struct xe_res_cursor curs = *xe_walk->curs;
> > +	/* null VMA's do not have dma adresses */
> > +	if (xe_walk->pte_flags & XE_PTE_FLAG_NULL)
> > +		return true;
> > +
> >   	if (!IS_ALIGNED(addr, SZ_64K))
> >   		return false;
> > @@ -631,12 +641,29 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
> >   	/* Is this a leaf entry ?*/
> >   	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
> >   		struct xe_res_cursor *curs = xe_walk->curs;
> > +		u64 pte = 0;
> > +		bool is_null = xe_walk->pte_flags & XE_PTE_FLAG_NULL;
> >   		XE_WARN_ON(xe_walk->va_curs_start != addr);
> > -		pte = __gen8_pte_encode(xe_res_dma(curs) + xe_walk->dma_offset,
> > -					xe_walk->cache, xe_walk->pte_flags,
> > -					level);
> > +		if (is_null) {
> > +			pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
> > +			if (xe_walk->pte_flags & XE_PTE_FLAG_READ_ONLY)
> > +				pte &= ~XE_PAGE_RW;
> > +
> > +			if (level == 1)
> > +				pte |= XE_PDE_PS_2M;
> > +			else if (level == 2)
> > +				pte |= XE_PDPE_PS_1G;
> > +
> > +			pte |= XE_PTE_NULL;
> Why can't this block be incorporated into __gen8_pte_encode() and the test
> for null binding done in that function?

Will fix.

> > +		} else {
> > +			pte = __gen8_pte_encode(xe_res_dma(curs) +
> > +						xe_walk->dma_offset,
> > +						xe_walk->cache,
> > +						xe_walk->pte_flags,
> > +						level);
> > +		}
> >   		pte |= xe_walk->default_pte;
> >   		/*
> > @@ -654,7 +681,8 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
> >   		if (unlikely(ret))
> >   			return ret;
> > -		xe_res_next(curs, next - addr);
> > +		if (!is_null)
> > +			xe_res_next(curs, next - addr);
> >   		xe_walk->va_curs_start = next;
> >   		*action = ACTION_CONTINUE;
> > @@ -761,24 +789,29 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> >   		xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
> >   		xe_walk.cache = XE_CACHE_WB;
> >   	} else {
> > -		if (!xe_vma_is_userptr(vma) && bo->flags & XE_BO_SCANOUT_BIT)
> > +		if (!xe_vma_has_no_bo(vma) && bo->flags & XE_BO_SCANOUT_BIT)
> >   			xe_walk.cache = XE_CACHE_WT;
> >   		else
> >   			xe_walk.cache = XE_CACHE_WB;
> >   	}
> > -	if (!xe_vma_is_userptr(vma) && xe_bo_is_stolen(bo))
> > +	if (!xe_vma_has_no_bo(vma) && xe_bo_is_stolen(bo))
> >   		xe_walk.dma_offset = xe_ttm_stolen_gpu_offset(xe_bo_device(bo));
> >   	xe_bo_assert_held(bo);
> > -	if (xe_vma_is_userptr(vma))
> > -		xe_res_first_sg(vma->userptr.sg, 0, vma->end - vma->start + 1,
> > -				&curs);
> > -	else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
> > -		xe_res_first(bo->ttm.resource, vma->bo_offset,
> > -			     vma->end - vma->start + 1, &curs);
> > -	else
> > -		xe_res_first_sg(xe_bo_get_sg(bo), vma->bo_offset,
> > -				vma->end - vma->start + 1, &curs);
> > +
> > +	if (!xe_vma_is_null(vma)) {
> > +		if (xe_vma_is_userptr(vma))
> > +			xe_res_first_sg(vma->userptr.sg, 0,
> > +					vma->end - vma->start + 1, &curs);
> > +		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
> > +			xe_res_first(bo->ttm.resource, vma->bo_offset,
> > +				     vma->end - vma->start + 1, &curs);
> > +		else
> > +			xe_res_first_sg(xe_bo_get_sg(bo), vma->bo_offset,
> > +					vma->end - vma->start + 1, &curs);
> > +	} else {
> > +		curs.size = vma->end - vma->start + 1;
> > +	}
> >   	ret = xe_pt_walk_range(&pt->base, pt->level, vma->start, vma->end + 1,
> >   				&xe_walk.base);
> > @@ -967,7 +1000,7 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
> >   	if (xe_vma_is_userptr(vma))
> >   		lockdep_assert_held_read(&vm->userptr.notifier_lock);
> > -	else
> > +	else if (!xe_vma_is_null(vma))
> >   		dma_resv_assert_held(vma->bo->ttm.base.resv);
> >   	dma_resv_assert_held(&vm->resv);
> > @@ -1330,7 +1363,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
> >   				   DMA_RESV_USAGE_KERNEL :
> >   				   DMA_RESV_USAGE_BOOKKEEP);
> > -		if (!xe_vma_is_userptr(vma) && !vma->bo->vm)
> > +		if (!xe_vma_has_no_bo(vma) && !vma->bo->vm)
> >   			dma_resv_add_fence(vma->bo->ttm.base.resv, fence,
> >   					   DMA_RESV_USAGE_BOOKKEEP);
> >   		xe_pt_commit_bind(vma, entries, num_entries, rebind,
> > @@ -1647,7 +1680,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
> >   				   DMA_RESV_USAGE_BOOKKEEP);
> >   		/* This fence will be installed by caller when doing eviction */
> > -		if (!xe_vma_is_userptr(vma) && !vma->bo->vm)
> > +		if (!xe_vma_has_no_bo(vma) && !vma->bo->vm)
> >   			dma_resv_add_fence(vma->bo->ttm.base.resv, fence,
> >   					   DMA_RESV_USAGE_BOOKKEEP);
> >   		xe_pt_commit_unbind(vma, entries, num_entries,
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 94fc9c330235..f7629db275f9 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -590,7 +590,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
> >   		goto out_unlock;
> >   	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
> > -		if (xe_vma_is_userptr(vma) || vma->destroyed)
> > +		if (xe_vma_has_no_bo(vma) || vma->destroyed)
> >   			continue;
> >   		err = xe_bo_validate(vma->bo, vm, false);
> > @@ -843,6 +843,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> >   				    u64 bo_offset_or_userptr,
> >   				    u64 start, u64 end,
> >   				    bool read_only,
> > +				    bool is_null,
> >   				    u64 tile_mask)
> >   {
> >   	struct xe_vma *vma;
> > @@ -868,8 +869,11 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> >   	vma->vm = vm;
> >   	vma->start = start;
> >   	vma->end = end;
> > +	vma->pte_flags = 0;
> >   	if (read_only)
> > -		vma->pte_flags = XE_PTE_FLAG_READ_ONLY;
> > +		vma->pte_flags |= XE_PTE_FLAG_READ_ONLY;
> > +	if (is_null)
> > +		vma->pte_flags |= XE_PTE_FLAG_NULL;
> >   	if (tile_mask) {
> >   		vma->tile_mask = tile_mask;
> > @@ -886,23 +890,26 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> >   		vma->bo_offset = bo_offset_or_userptr;
> >   		vma->bo = xe_bo_get(bo);
> >   		list_add_tail(&vma->bo_link, &bo->vmas);
> > -	} else /* userptr */ {
> > -		u64 size = end - start + 1;
> > -		int err;
> > +	} else /* userptr or null */ {
> > +		if (!is_null) {
> > +			u64 size = end - start + 1;
> > +			int err;
> > -		vma->userptr.ptr = bo_offset_or_userptr;
> > +			vma->userptr.ptr = bo_offset_or_userptr;
> > -		err = mmu_interval_notifier_insert(&vma->userptr.notifier,
> > -						   current->mm,
> > -						   vma->userptr.ptr, size,
> > -						   &vma_userptr_notifier_ops);
> > -		if (err) {
> > -			kfree(vma);
> > -			vma = ERR_PTR(err);
> > -			return vma;
> > +			err = mmu_interval_notifier_insert(&vma->userptr.notifier,
> > +							   current->mm,
> > +							   vma->userptr.ptr, size,
> > +							   &vma_userptr_notifier_ops);
> > +			if (err) {
> > +				kfree(vma);
> > +				vma = ERR_PTR(err);
> > +				return vma;
> > +			}
> > +
> > +			vma->userptr.notifier_seq = LONG_MAX;
> >   		}
> > -		vma->userptr.notifier_seq = LONG_MAX;
> >   		xe_vm_get(vm);
> >   	}
> > @@ -942,6 +949,8 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
> >   		 */
> >   		mmu_interval_notifier_remove(&vma->userptr.notifier);
> >   		xe_vm_put(vm);
> > +	} else if (xe_vma_is_null(vma)) {
> > +		xe_vm_put(vm);
> >   	} else {
> >   		xe_bo_put(vma->bo);
> >   	}
> > @@ -1024,7 +1033,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
> >   		list_del_init(&vma->userptr.invalidate_link);
> >   		spin_unlock(&vm->userptr.invalidated_lock);
> >   		list_del(&vma->userptr_link);
> > -	} else {
> > +	} else if (!xe_vma_is_null(vma)) {
> >   		xe_bo_assert_held(vma->bo);
> >   		list_del(&vma->bo_link);
> > @@ -1391,7 +1400,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> >   	while (vm->vmas.rb_node) {
> >   		struct xe_vma *vma = to_xe_vma(vm->vmas.rb_node);
> > -		if (xe_vma_is_userptr(vma)) {
> > +		if (xe_vma_has_no_bo(vma)) {
> >   			down_read(&vm->userptr.notifier_lock);
> >   			vma->destroyed = true;
> >   			up_read(&vm->userptr.notifier_lock);
> > @@ -1400,7 +1409,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> >   		rb_erase(&vma->vm_node, &vm->vmas);
> >   		/* easy case, remove from VMA? */
> > -		if (xe_vma_is_userptr(vma) || vma->bo->vm) {
> > +		if (xe_vma_has_no_bo(vma) || vma->bo->vm) {
> >   			xe_vma_destroy(vma, NULL);
> >   			continue;
> >   		}
> > @@ -2034,7 +2043,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
> >   	XE_BUG_ON(region > ARRAY_SIZE(region_to_mem_type));
> > -	if (!xe_vma_is_userptr(vma)) {
> > +	if (!xe_vma_has_no_bo(vma)) {
> >   		err = xe_bo_migrate(vma->bo, region_to_mem_type[region]);
> >   		if (err)
> >   			return err;
> > @@ -2643,6 +2652,8 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
> >   					  lookup->start - 1,
> >   					  (first->pte_flags &
> >   					   XE_PTE_FLAG_READ_ONLY),
> > +					  (first->pte_flags &
> > +					   XE_PTE_FLAG_NULL),
> >   					  first->tile_mask);
> >   		if (first->bo)
> >   			xe_bo_unlock(first->bo, &ww);
> > @@ -2675,6 +2686,7 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
> >   					 last->end,
> >   					 (last->pte_flags &
> >   					  XE_PTE_FLAG_READ_ONLY),
> > +					 (last->pte_flags & XE_PTE_FLAG_NULL),
> >   					 last->tile_mask);
> >   		if (last->bo)
> >   			xe_bo_unlock(last->bo, &ww);
> > @@ -2742,7 +2754,7 @@ static struct xe_vma *vm_prefetch_lookup_vmas(struct xe_vm *vm,
> >   		      *next;
> >   	struct rb_node *node;
> > -	if (!xe_vma_is_userptr(vma)) {
> > +	if (!xe_vma_has_no_bo(vma)) {
> >   		if (!xe_bo_can_migrate(vma->bo, region_to_mem_type[region]))
> >   			return ERR_PTR(-EINVAL);
> >   	}
> > @@ -2751,7 +2763,7 @@ static struct xe_vma *vm_prefetch_lookup_vmas(struct xe_vm *vm,
> >   	while ((node = rb_next(node))) {
> >   		if (!xe_vma_cmp_vma_cb(lookup, node)) {
> >   			__vma = to_xe_vma(node);
> > -			if (!xe_vma_is_userptr(__vma)) {
> > +			if (!xe_vma_has_no_bo(__vma)) {
> >   				if (!xe_bo_can_migrate(__vma->bo, region_to_mem_type[region]))
> >   					goto flush_list;
> >   			}
> > @@ -2765,7 +2777,7 @@ static struct xe_vma *vm_prefetch_lookup_vmas(struct xe_vm *vm,
> >   	while ((node = rb_prev(node))) {
> >   		if (!xe_vma_cmp_vma_cb(lookup, node)) {
> >   			__vma = to_xe_vma(node);
> > -			if (!xe_vma_is_userptr(__vma)) {
> > +			if (!xe_vma_has_no_bo(__vma)) {
> >   				if (!xe_bo_can_migrate(__vma->bo, region_to_mem_type[region]))
> >   					goto flush_list;
> >   			}
> > @@ -2824,21 +2836,23 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
> >   	switch (VM_BIND_OP(op)) {
> >   	case XE_VM_BIND_OP_MAP:
> > -		XE_BUG_ON(!bo);
> > -
> > -		err = xe_bo_lock(bo, &ww, 0, true);
> > -		if (err)
> > -			return ERR_PTR(err);
> > +		if (bo) {
> > +			err = xe_bo_lock(bo, &ww, 0, true);
> > +			if (err)
> > +				return ERR_PTR(err);
> > +		}
> >   		vma = xe_vma_create(vm, bo, bo_offset_or_userptr, addr,
> >   				    addr + range - 1,
> >   				    op & XE_VM_BIND_FLAG_READONLY,
> > +				    op & XE_VM_BIND_FLAG_NULL,
> >   				    tile_mask);
> > -		xe_bo_unlock(bo, &ww);
> > +		if (bo)
> > +			xe_bo_unlock(bo, &ww);
> >   		if (!vma)
> >   			return ERR_PTR(-ENOMEM);
> >   		xe_vm_insert_vma(vm, vma);
> > -		if (!bo->vm) {
> > +		if (bo && !bo->vm) {
> Suspicious-looking indent.

How? Not seeing an issue nor is checkpatch.

Matt

> >   			vm_insert_extobj(vm, vma);
> >   			err = add_preempt_fences(vm, bo);
> >   			if (err) {
> > @@ -2872,6 +2886,7 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
> >   		vma = xe_vma_create(vm, NULL, bo_offset_or_userptr, addr,
> >   				    addr + range - 1,
> >   				    op & XE_VM_BIND_FLAG_READONLY,
> > +				    op & XE_VM_BIND_FLAG_NULL,
> >   				    tile_mask);
> >   		if (!vma)
> >   			return ERR_PTR(-ENOMEM);
> > @@ -2897,11 +2912,12 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
> >   #ifdef TEST_VM_ASYNC_OPS_ERROR
> >   #define SUPPORTED_FLAGS	\
> >   	(FORCE_ASYNC_OP_ERROR | XE_VM_BIND_FLAG_ASYNC | \
> > -	 XE_VM_BIND_FLAG_READONLY | XE_VM_BIND_FLAG_IMMEDIATE | 0xffff)
> > +	 XE_VM_BIND_FLAG_READONLY | XE_VM_BIND_FLAG_IMMEDIATE | \
> > +	 XE_VM_BIND_FLAG_NULL | 0xffff)
> >   #else
> >   #define SUPPORTED_FLAGS	\
> >   	(XE_VM_BIND_FLAG_ASYNC | XE_VM_BIND_FLAG_READONLY | \
> > -	 XE_VM_BIND_FLAG_IMMEDIATE | 0xffff)
> > +	 XE_VM_BIND_FLAG_IMMEDIATE | XE_VM_BIND_FLAG_NULL | 0xffff)
> >   #endif
> >   #define XE_64K_PAGE_MASK 0xffffull
> > @@ -2949,6 +2965,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> >   		u32 obj = (*bind_ops)[i].obj;
> >   		u64 obj_offset = (*bind_ops)[i].obj_offset;
> >   		u32 region = (*bind_ops)[i].region;
> > +		bool is_null = op &  XE_VM_BIND_FLAG_NULL;
> >   		if (XE_IOCTL_ERR(xe, (*bind_ops)[i].pad) ||
> >   		    XE_IOCTL_ERR(xe, (*bind_ops)[i].reserved[0] ||
> > @@ -2982,8 +2999,13 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> >   		if (XE_IOCTL_ERR(xe, VM_BIND_OP(op) >
> >   				 XE_VM_BIND_OP_PREFETCH) ||
> >   		    XE_IOCTL_ERR(xe, op & ~SUPPORTED_FLAGS) ||
> > +		    XE_IOCTL_ERR(xe, obj && is_null) ||
> > +		    XE_IOCTL_ERR(xe, obj_offset && is_null) ||
> > +		    XE_IOCTL_ERR(xe, VM_BIND_OP(op) != XE_VM_BIND_OP_MAP &&
> > +				 is_null) ||
> >   		    XE_IOCTL_ERR(xe, !obj &&
> > -				 VM_BIND_OP(op) == XE_VM_BIND_OP_MAP) ||
> > +				 VM_BIND_OP(op) == XE_VM_BIND_OP_MAP &&
> > +				 !is_null) ||
> >   		    XE_IOCTL_ERR(xe, !obj &&
> >   				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL) ||
> >   		    XE_IOCTL_ERR(xe, addr &&
> > @@ -3389,6 +3411,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> >   	int ret;
> >   	XE_BUG_ON(!xe_vm_in_fault_mode(vma->vm));
> > +	XE_WARN_ON(xe_vma_is_null(vma));
> >   	trace_xe_vma_usm_invalidate(vma);
> >   	/* Check that we don't race with page-table updates */
> > @@ -3451,8 +3474,11 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
> >   	for (node = rb_first(&vm->vmas); node; node = rb_next(node)) {
> >   		struct xe_vma *vma = to_xe_vma(node);
> >   		bool is_userptr = xe_vma_is_userptr(vma);
> > +		bool is_null = xe_vma_is_null(vma);
> > -		if (is_userptr) {
> > +		if (is_null) {
> > +			addr = 0;
> > +		} else if (is_userptr) {
> >   			struct xe_res_cursor cur;
> >   			xe_res_first_sg(vma->userptr.sg, 0, XE_PAGE_SIZE,
> > @@ -3463,7 +3489,8 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
> >   		}
> >   		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
> >   			   vma->start, vma->end, vma->end - vma->start + 1ull,
> > -			   addr, is_userptr ? "USR" : is_vram ? "VRAM" : "SYS");
> > +			   addr, is_null ? "NULL" : is_userptr ? "USR" :
> > +			   is_vram ? "VRAM" : "SYS");
> >   	}
> >   	up_read(&vm->lock);
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index 372f26153209..38731e200813 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -115,11 +115,21 @@ static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
> >   	}
> >   }
> > -static inline bool xe_vma_is_userptr(struct xe_vma *vma)
> > +static inline bool xe_vma_is_null(struct xe_vma *vma)
> > +{
> > +	return vma->pte_flags & XE_PTE_FLAG_NULL;
> > +}
> > +
> > +static inline bool xe_vma_has_no_bo(struct xe_vma *vma)
> >   {
> >   	return !vma->bo;
> >   }
> > +static inline bool xe_vma_is_userptr(struct xe_vma *vma)
> > +{
> > +	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma);
> > +}
> > +
> >   int xe_vma_userptr_pin_pages(struct xe_vma *vma);
> >   int xe_vma_userptr_check_repin(struct xe_vma *vma);
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 6daddd29d416..f775bafe4619 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -31,6 +31,7 @@ struct xe_vma {
> >   	u64 end;
> >   	/** @pte_flags: pte flags for this VMA */
> >   #define XE_PTE_FLAG_READ_ONLY		BIT(0)
> > +#define XE_PTE_FLAG_NULL		BIT(1)
> >   	u32 pte_flags;
> >   	/** @bo: BO if not a userptr, must be NULL is userptr */
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 0ebc50beb5e5..39a1ce89732f 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -456,6 +456,14 @@ struct drm_xe_vm_bind_op {
> >   	 * than differing the MAP to the page fault handler.
> >   	 */
> >   #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
> > +	/*
> > +	 * When the NULL flag is set, the page tables are setup with a special
> > +	 * bit which indicates writes are dropped and all reads return zero.  In
> > +	 * the future, the NULL flags will only be valid for XE_VM_BIND_OP_MAP
> > +	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
> > +	 * intended to implement VK sparse bindings.
> > +	 */
> > +#define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
> >   	/** @reserved: Reserved */
> >   	__u64 reserved[2];
