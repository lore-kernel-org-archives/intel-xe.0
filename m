Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57701C19F32
	for <intel-xe@archiver.kernel.org>; Wed,  5 Mar 2025 06:11:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5B610E067;
	Wed,  5 Mar 2025 06:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kGqiGz3i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8288110E067
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Mar 2025 06:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741155070; x=1772691070;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vjAkumBB/x9wMl9IGosjCQwkppjNH61OgzGAQ5ZkE+s=;
 b=kGqiGz3iCg07xCiAk03iIDJvGPtXWVSzEAvjSJx5u4RizM8b/zDTiyqc
 HiMbywEFKXdETl98N5O9pI8HOkZEjo4oPsoVGpK774fJrgMdZk9EIzhat
 HemY2wiz+ldxg+Yo+hiKryOzTDiTIkET/M2Ug8YLMjLETjs3pU9uW/UQl
 Jgpe31unG/qmFUPMxKMDpvW8mb3+PxKxfqeNIYdsw04GzaNwi43Wgm3bJ
 wEJSFvS5nBgKQj78It1qsnZHeq6umP44iLi41yYVpq8c4xNLFJTtJqpLj
 +RpchFADO2pPUAPHT2nsx69R3mBLaek4oUKJCfjxnBMWRCZ7HzOtiGho/ w==;
X-CSE-ConnectionGUID: zN1CvNCoRk+pKr6AUoU3LQ==
X-CSE-MsgGUID: PAWUQ90xReyNJkP+5FIB+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53498550"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="53498550"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 22:11:10 -0800
X-CSE-ConnectionGUID: AZEx7dGCRr2nrazf/INqPQ==
X-CSE-MsgGUID: NjCnhmGFSy+seioKRRYKWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="118607535"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2025 22:11:10 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Mar 2025 22:11:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Mar 2025 22:11:09 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Mar 2025 22:11:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUgMsapt1aPIi9l9GXGaFhguEA+ih7BT1R/O51yW3lVxwffqK8kxbnPz1nuOOnnsLfABoJt4lu9ZcP7sWYzlM8v7M7Cza7sIQtAsQgLdkap10pVGqEVeOAZ3HcAYxS1yVhs4pbwGI/IQYNgsDqKO+cOJYEDEVxR5zuOr1zK4HDhNLsYOAi8KVMck2OqyW3ZClPHQfW8Y+dRYPsQrWuv5bKTp5Dd2k5sa0H0NzOzvSrQgNXBVY9wfYMtO+Zt0akboYCNI5TBooy8ZdXYrFHjugYBy2KQqhimWrL5eFZP2XC0/TNz7/swXFjAPy8YmHTcIVSkvc/LCptSREhAhAVnQNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agWVM5IVVeXUumpcW9FVGoPb75dQZdwcLm6eVLVKd6A=;
 b=qtU9RMElaCuO+Fy8ycU7dx4hqtsNWRnjUpAkw3Or5V0OJNtp9f0QdRkB0WBkBBDj9RY0IMtpR1yCXnPb6Prrl9uYlwlf4enghKasbGnSJrd9dfMaB+0Hm7EZXFhqTPrE0fn6fRig8xUpoTnbuJiJe6tYzSBehi5wqMzhzXs6SUohwzmwEbhoYuKczjt0nbhoSNm9LsoNbNB/JLZAjzLYoVa68QxUTj7FyJZKVqKGlvJT2q/O5ST/F6nCopcEOx8+vFhur1T8fZMfoxJSETjOJSz+wfGOJSP+D/df3YA3sALN7JjNLYNqDalYXhKp9ksqwZ/0P/s6mnvv7cGB5jFxDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4571.namprd11.prod.outlook.com (2603:10b6:303:59::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Wed, 5 Mar
 2025 06:10:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8489.028; Wed, 5 Mar 2025
 06:10:25 +0000
Date: Tue, 4 Mar 2025 22:11:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Oak Zeng <oak.zeng@intel.com>
Subject: Re: [PATCH v3 0/3] drm/xe: Userptr invalid page access fixes
Message-ID: <Z8frE6L2styWTD2R@lstrano-desk.jf.intel.com>
References: <20250304173342.22009-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250304173342.22009-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0159.namprd04.prod.outlook.com
 (2603:10b6:303:85::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4571:EE_
X-MS-Office365-Filtering-Correlation-Id: 68cd0406-1a23-4058-20c3-08dd5bac6b68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?25PERAWPED1sYOR6SBQsZQ34Qzvr6Micd10Oy8j37xoZSNY/twO/on1nbp?=
 =?iso-8859-1?Q?U4t3ewyBRgr8m186+89TEhPjx69DpPzvLnO6S3N8NbkwssvExC/0P387hC?=
 =?iso-8859-1?Q?z7HXwAY6JF80jHbGEw6tZyuue39oMKWtjJKnUXTajNrhi7JRrAp9NeT+1k?=
 =?iso-8859-1?Q?kLkapd4t4S3oTPyzyo9cjtw628PQahIZTMzQHuJIt5FHnmNcqzd4QiX7US?=
 =?iso-8859-1?Q?7XKZy1LsFQ6YavJfoWpo8GvFsG70UUs1/+JkQIgbZV2hDrwWU6RsCpT0uM?=
 =?iso-8859-1?Q?YXxEUuT1Dm2A4ZCPOaP55NPlMeLLMShC+pLlW0ZmxL8amKbCw4V+fX4RVL?=
 =?iso-8859-1?Q?gjJCixWVJaJIblQSnBlkvAsKveDeilmHGxij5mkZK1vBZW4GYwIHk+6tCO?=
 =?iso-8859-1?Q?U8dRKaHbxcCgxQxntxTGGyQauUC3bw0SnpptazmD0VAQ86PeVGNs98nnGV?=
 =?iso-8859-1?Q?m0nnuirULOuoPhaaM0LA5+RcWORRGvzg/QKFjc8/UW1YStnGmoNGYtRGrp?=
 =?iso-8859-1?Q?KNPhEIi2dlKQlURnFaSBHdgATStaZM1Rl2o2nM4+eVW4uUNJVAoHQHPZCq?=
 =?iso-8859-1?Q?bnE8E4lJ8mOgh/OFs3JIkDa6fIpxugtTRHEZj3z+jj1JxUEuQI8k6xbDeA?=
 =?iso-8859-1?Q?PygyEUa+LFKhLUhk6CdD1kViXpw7ubkbIqLKPJhHbwjWLSCL/QDeGMwuBT?=
 =?iso-8859-1?Q?b225lPTpp0gS+FZ9VC9rwolSFL2GJgzfcuxyVNDntjsPkEl8rWIl2VU/O7?=
 =?iso-8859-1?Q?XfXeh4GeUnDszT0rCkgmCdCEpgxTxxPsL1//mPTMkeQctUGBBQO7NvIB8Y?=
 =?iso-8859-1?Q?ADeyw0ZvXyStro2hpmrfiXzu/7/m/yEhOwMNqVaLLpq/QRxtzvwhdeVvDe?=
 =?iso-8859-1?Q?8ticdm68uEWwzJ/5RV0uJ48PaOCN99QAJOF1b8vAhVK9sJR4JOxYZVany5?=
 =?iso-8859-1?Q?Y8Y38Womv42MQYRsOWRvrTfanFWBxaMDd5YoVF4oYy51OEF5Oh+TyIoZtl?=
 =?iso-8859-1?Q?c0ICbKIuv2oU7LYNBRCNhZDh80JvcqvQjuxO6F1rttBapLd2fsYPXGHfdi?=
 =?iso-8859-1?Q?bKYSy0rVhDATw3/z5cgM0DiEFz+gyuwQ+w8xTpsXtXP7tNdoMT53BBwXVg?=
 =?iso-8859-1?Q?E6ROgyOwQvD+r6J8pVY8Psbmye1YCCaACH/nyyIdTZ4oig0il82qcMUikO?=
 =?iso-8859-1?Q?2NLQFmg8MTwvICIp4yu+Om1vgAlrIW+7kj24iWjYo3J6N+7R69/jT7fNWu?=
 =?iso-8859-1?Q?+4YI7QP0mDVJNUazYHjhZTVrkoxYlZKYfgfyVYqSKmXfGgAt8Aj/Ep7Dal?=
 =?iso-8859-1?Q?MG8dECVE/hH6sTgNFqYMb+0/kPFY1BHB3Pf3aCqDcGTxOFmqkukQrVSjHc?=
 =?iso-8859-1?Q?szQ7j+7cAc0D1hUGwboNC1PTBiinxfGOXDRXpXFUJaU/pzoq5lO9xL1E3V?=
 =?iso-8859-1?Q?0ujO6/7A9pjZ9Bb+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4U+8AKTaBAl2SMB2pB04GRx+FeGnCcBKmpbMGUefAt9Qyga0/1pdI5oHv3?=
 =?iso-8859-1?Q?G6B3hDmfEhv2q6xHe3gK5xtsWqeD9gLxbxTVyQentSRNGgOFm5HLBsRQ1D?=
 =?iso-8859-1?Q?K7pY8JFk/mpXr7mrtAfDkDDicJ8VZ5cpy7CYFTJWiqQlBWT+FE6EDQJMi1?=
 =?iso-8859-1?Q?tZEYcXA84ow4v41NRVoBzdScqT0rSEG9wyveoMFvadmBwEKQt7U4AEwhxY?=
 =?iso-8859-1?Q?FljUeiHD/yxMCDN38H7TMRlcj6LlwedS1ctY5fGD46yRVhHCBKpfod1aqH?=
 =?iso-8859-1?Q?GsmjHNqh9buHh7tTgLK8SWeB3/YACml97yI3gciHTnUwc0+i6vMV9stzpU?=
 =?iso-8859-1?Q?UvNlxqBYMAdQP+7SyetKA946Vwk5cGMIiCB27XIBdRQrfrNmpU6gRNYFFF?=
 =?iso-8859-1?Q?ufOQoneDFp1fb4fHDOgA3uKYcQGwJcABjyEYul4wxztnYQS5wYJ48IbVgB?=
 =?iso-8859-1?Q?TkLkYEV6JwLyCY39BK1dYgKD+A2j395RsFf1j9EMBN3Z107aYTOamWWXDD?=
 =?iso-8859-1?Q?8CbruCDk027JQJlmmr7Hhlc8eYmmUwgeVD096hsC0uC7gb7fZS8PHD2LzK?=
 =?iso-8859-1?Q?dZXSC5onAZhKsyEO8dQZ17bQwH45I6P9w2x1ocpz75kH1G8HgTqteu0Z6K?=
 =?iso-8859-1?Q?WhzTrg3eHDPxtkErW8cfDflobm6xdKvdTVegAZQSV51tVUtHgw2sTyNmiP?=
 =?iso-8859-1?Q?9Tei7lz2r3hfV86iKJNJA1cEPklPX8yIf5Lb3BFkn/BA+8gfTQkwLv7yXM?=
 =?iso-8859-1?Q?aqlbrQlOIiwe4kyk44WWfBwvwlXGvvDBGpEr/Rdm6N1g8qgQXEkmQGLTOT?=
 =?iso-8859-1?Q?qToHxGiZ3kwoi9+5vta2KW5oqAtIh7998d6LMnCUEiLH411Uju6WKcSNrP?=
 =?iso-8859-1?Q?yOsFZS3gKSXZMeK6MJZB75I6dMZ7x26hkhnhnfkicxC/amH/C291ASo06O?=
 =?iso-8859-1?Q?ZM3Iirvr0hy7TSkmrKl2Q/8MPsBt81cQE9IvVsVbOHi07mmRsl2Nv9Vzja?=
 =?iso-8859-1?Q?e3RaqceOFkznKV0R+rAsydU8+CKZZRhtzzbrPsk+MUSYc0Cq7lSgqB8ouB?=
 =?iso-8859-1?Q?h4qsVN5IRBMm8GF58Ow/oeBPuMoD77qHE2MnXm2RNOgi13SB9HoLVIWh6Z?=
 =?iso-8859-1?Q?k3dRHsAZG8O5hr/a97jbNoi22OOQoh/bRnHEhlMpEvGlL4UdV0LBJbaWac?=
 =?iso-8859-1?Q?m0F2lzWqnp/FG/zmbA6lo8VMK4ZIkIaYzqiV6ws6JqVLbSD+sWaIplzCah?=
 =?iso-8859-1?Q?giLSJiN+/0143ERUq42ShxqBvz0VXvl7pXvUPl9nBB86B152jqL1JJVldT?=
 =?iso-8859-1?Q?epC0ZXoTkz/ZEodHqqM0yKIc3oGaGYfddj8yQ1fTXqNJKn14P7jRdWMiHh?=
 =?iso-8859-1?Q?Ntq3haVSIM5Eq50aWY7iXOgDj3dVWCwTtacOxZBQ7T55cwDeVduR22xeho?=
 =?iso-8859-1?Q?DxMD6JvYLVDnD7PIy3mMKMeSsK64tCgED0TyQkrAPO+z5/pyxpTe/T4LCY?=
 =?iso-8859-1?Q?+lu3ehIE47yajfhdMG5tvmj1WK/qZyrVqlsAsb8qSTT+qPvukxP5+xOjLU?=
 =?iso-8859-1?Q?if/q4/TrtqF0xQvQtvw4ndwhQYPxcUxSGiCviqXDVu+F+D8oCZJFpkLDCK?=
 =?iso-8859-1?Q?zfgh7sxdAS+7vwC5CmM/wkEfkoQSGn84LIYRr3X4GdMxRJhwM4xqnVTA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68cd0406-1a23-4058-20c3-08dd5bac6b68
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 06:10:25.2741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4yR6dSdfX5h9S7hNvocqYZWGa+lzb5ts65w+TQKbYjApWtoayPg7nLODXktJwgW/yoB1O3p9bmgSl8z/1jfSqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4571
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

On Tue, Mar 04, 2025 at 06:33:39PM +0100, Thomas Hellström wrote:
> Fix a number of potential invalid page-accesses by the userptr code.
> 
> Patch 1:
> - Some coding style fixes.
> Patch 2:
> - Avoids invalid struct page accesses during userptr pinning.
> Patch 3:
> - Block xe device accesses on mmu_invalidation on the iommu level.
> 

For the series:
Acked-by: Matthew Brost <matthew.brost@intel.com>

In the long term, I believe it would be beneficial if we could unify Xe userptr
with the DRM common GPU SVM get_pages/notifiers. This is really hard to get
right, and I think everything we have fixed here has already been correctly
handled in GPU SVM. It would also help other drivers getting userptr correct
going forward.

Matt

> v2:
> - Address review comments by Matt Auld
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> 
> Thomas Hellström (3):
>   drm/xe/hmm: Style- and include fixes
>   drm/xe/hmm: Don't dereference struct page pointers without notifier
>     lock
>   drm/xe/userptr: Unmap userptrs in the mmu notifier
> 
>  drivers/gpu/drm/xe/xe_hmm.c      | 170 +++++++++++++++++++++++--------
>  drivers/gpu/drm/xe/xe_hmm.h      |   7 ++
>  drivers/gpu/drm/xe/xe_vm.c       |   4 +
>  drivers/gpu/drm/xe/xe_vm_types.h |   4 +
>  4 files changed, 145 insertions(+), 40 deletions(-)
> 
> -- 
> 2.48.1
> 
