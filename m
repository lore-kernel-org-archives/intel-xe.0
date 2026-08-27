Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F433C5DF9D
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 05:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0824910E2A3;
	Thu, 27 Aug 2026 05:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iLl15yNh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4D010E2A3
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 05:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787809720; x=1819345720;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZPFQloi2jP0wBuzqlvcoqFsfFuPsQh501709Frkrbro=;
 b=iLl15yNhiT3JDhllxGlwDdngAVerEKY9fQf2YXimPCHmZD26SBxqapCw
 v07rP9sHHDGb2kuyemQDYb8bQSh8OeA+zbWLnzaibjFh1dJEq1EMR416T
 M8a3P/kwPNi5t4Ua7zN6z682mjiYYGOrwej7aWeqcSM4UgT3B25iVXA9N
 EiypjVu1X5TN6f5IUnXEgaJGupvVWwuohn6L/VVImLg/e9LBIYdChTFvo
 +xvfGQnZiyG8rTLgdw2GCg/PNVEGnTA5vgs6i34gfzDxrI4zH+b7xyb++
 OSjvoO10PbFyB/MpAb745qrBnzlkW89uFS+96PnzS5YQ0SKuKwM2jduqq A==;
X-CSE-ConnectionGUID: jov1fcOERFSDMug2Lmrm6Q==
X-CSE-MsgGUID: hBy14pOHQAGyyPKZ+2l6IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98636420"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="98636420"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 22:48:39 -0700
X-CSE-ConnectionGUID: 4Gc6R7IYTBOK/RZZXnhOfA==
X-CSE-MsgGUID: ItWK/OZ+ReyY7IQ5mPpQWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="265990466"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 22:48:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 22:48:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 22:48:38 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.21) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 22:48:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jMlxd27BAMnYx6Xv5R3dADvzYSfn1UrzeRnl2ebyVnswsK+uZodQulBLnD9IVVOQnNGDHCEt25krTkwFVU7zYNKzbw0/n6A8TlmIVxkiSmk9uEaGdpSqa03mHrLBM22lYK4rf3UwcPEXmssZcxopIGsMCMhtyTSAW/L3Fwg0bLorbs56GuN3TNKzDLYfWKhOCloIVKrbXE2E7MQOIJRj/WuYY7CcRftsC+JJ/B2/HaaLrkXRMzomjiUqjQjGORPoztP2dn93dyn5EIgEaTNmncfR80VKd77q9qNeSCSkbB+tOtXMLJ6e7pdk9O7Mqp53JMPUGNToJ0CE/n/9YvluUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BveWZNHf4v5fgMTSaE1//wVDZImp874HLN5VRWNoVg=;
 b=SIYFND2aPB7XvPue5wGpT7a9rNkex5sc+ihL1ll+tF17ySWxyFJu66eSp+TKnko7iu0uP0itLGk1iQr0UZs5XAQTiakWWHLs4jy2SrvTG6lF8kDx884Gv7J0lTy0E30PYJ5V1RDiYRXT/j15qnuDaKKfJ0B6vyrzjwm5RvlT8ZBeTrKO7IaoR2vDGXtBp/tH9YN5oZ8b3CJdtrCKTU+4AWBaDl3eVM2vcXxqQ+js1R1USyGsKS+yj6z0hHFnyQ41YMnUxFLDDQDqkyb6rbuNClLu9BW1iZSjKYRM77I1mcKKFX8A/NbfLN4YIkGr+HroI9fCKEMGuLlWYshX0Fa9Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB9478.namprd11.prod.outlook.com (2603:10b6:8:28f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Thu, 27 Aug
 2026 05:48:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 05:48:36 +0000
Date: Wed, 26 Aug 2026 22:48:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/bo: Take a runtime PM ref when shrinking a bo
 needing invalidation
Message-ID: <ao/Psuvcjjxkt8iH@gsse-cloud1.jf.intel.com>
References: <20260825224819.2182540-1-shuicheng.lin@intel.com>
 <ebc4797204a5aec94f122094e2fbe2fb1d0536c1.camel@linux.intel.com>
 <DM4PR11MB545658D01D36A23A72096175EAAE2@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR11MB545658D01D36A23A72096175EAAE2@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:a03:331::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB9478:EE_
X-MS-Office365-Filtering-Correlation-Id: dcdfdefb-baa7-4c3b-1075-08df03fed654
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|56012099006|10067099003|6133799003|18002099003|22082099003|5023799004|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: XXeHHtzwt4Czw9emqZajCUeEX098u4dHQfWZ6totZtWwkM6uKWsaFUM1VW2aGy2CJYMUVTLMNaqVpxYPKx1cWETxALVrVZnPXGDAzH9f10eIqwFIBD+Raxn2Vo5MYp1VxeUCk/n+k4bkAOq5EK8/m/3RlgvaN/Fs4oglvfGdM27O9kddQdyi+cTgewOrXXZTW0DJVvyjq1nptzCY2M15Yimp9EtX7Z3r+spOrCdddYp+CxxniOvMJDS9EoCjM6b2eLw6arp9Do5We2+wZZhRwKNXyoyaqQCZr8AWt7Mb9892LPDa24KD+3oLeLooQHzLJT87D9v4aP/Tty5biYflHlwLBXl3FiN5a7WX5NMD9zWNETnopSdndWaTQCutnFMahgAn4ACFqtdxPOddm+07vJfvMiHJTBV9xNKMiQePpsHEVoH5yjE0zfk9UJTI8O8w1ItTUJNH21b6Ctj7tPs//WFajo2hWjWeDUojVSk/+M2UnOcXAKBl0t2rCsbDhARPnua7DEJigipaE1TK/AMZMZKRRNqiyAn5AIch1cnIYRdYGG0EItYW/0vdsTNpVB6+Dakqn3RiGxZMfSEPaHNLkRBFGNXHhIkgloRN6P42jTB8nJE7DLoJh0K5zL/3h+tKjwweF+scjZzew3b2ZMB1fmqmDSVzuVxtMMDf7p0sYao=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(5023799004)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?oAV0GJt60QCeUmKBCs0PjFbUEbU5ei7Bw1OIvblWAtn8cfeQlYHH3tzYiW?=
 =?iso-8859-1?Q?+zqu5W6NmPnXuFc1LpiaYUBu8Pr3wfRAIcqj+Z8NfrK6cbFzgskgBPLuh2?=
 =?iso-8859-1?Q?Cdcef98ppc8ZRg04whwnIDzqVefMAsccFLuXkovxTImkZ1D9wPCdqv1fL9?=
 =?iso-8859-1?Q?VctEEpgEn2ZD2p6iZ/w0k1eVFSqTrK1R2olwVIjbeRq8szaY2FiwEUi198?=
 =?iso-8859-1?Q?1YqM1z25IaFbPqQCqwefWJVO3h9sUkmUL+Xnt/n1vljeB6//Llg08EZCvK?=
 =?iso-8859-1?Q?a8NW6PhfZeZ7+mEfXHyr6dgDMpoIv3MAIOzOqoDdZtI5ChV3h8FoLj7hBF?=
 =?iso-8859-1?Q?8BiyRk5vpSlwnUGuiVqVend4v+hwjV0riYWRZT23r3qvsqG0FAbqdNt/Ge?=
 =?iso-8859-1?Q?1Xntjn9iRN5wS6BcnNoHhx0nhLjkr+d0SkSRyBX9jQlnvf8rKy0tFNQefT?=
 =?iso-8859-1?Q?pmJFN1d76XxqwZ39yB83IpNCXAAvlEeXwbvsWMz7ADPTbLA2phTsHX4i4+?=
 =?iso-8859-1?Q?S7ff9k0zgL908Z/qGr+C5/4JH6rWrrZedH6OA6Sgv5urG34ldLj93x3gMf?=
 =?iso-8859-1?Q?daDkkvauhihyyV+nNXoxUw6TLyXcglYwwQ24Xj+Vjfl6gzxUYljOiSzg3y?=
 =?iso-8859-1?Q?BV1bAwYMMtcaIZVvs1YIU0GbdyvtuNFDhAU5n8dbnMcCytZTbRX9g42BSo?=
 =?iso-8859-1?Q?BZNIB1dHHWvLiIQoDDRkG9OKIkiIePuR2d2faMIElSHf1AsBAl9fA3aQnS?=
 =?iso-8859-1?Q?GjjJgylDPlR63lZEsVcMWj3p7PIOf8mptF/wKWvfxwyVFc2qHnWhXav5tF?=
 =?iso-8859-1?Q?6dBeQChV1aLwFYqNHyvhn9krgF0SJdF22DP0U3pXe/jHeYb5TDOEhfg3/s?=
 =?iso-8859-1?Q?v0LxtQJmC0T1tY9b856iHZJqAWOOfw/Aa1sO1zLkbqxi3i0Vusk/NZ3+cf?=
 =?iso-8859-1?Q?SeltstksmSSaDzIIujjGxnGZPSyP5lOgQp00YCEY7Dv34Ad1OpRCxQtYBT?=
 =?iso-8859-1?Q?F3ospRpg3srV2yQah1Zm7AQV+b5oteld0+TTav80Z13rGxMC6sYAT4rkSn?=
 =?iso-8859-1?Q?kqrzdz/8sx+1mtMEGcdLSj3TEDxLtfv5V00fn5CRS0Bq9hM1hFvHAZjsxd?=
 =?iso-8859-1?Q?Wq2EQb2SyPR99lV9uDS9ydUPncVi+Vyh70HDuSaDDIe3hd29SG4/rGJVsg?=
 =?iso-8859-1?Q?3idgF3uy4snRtNpug99AmxOPTQq+2nv81mxvGRG/SDeu071tgvnBY3QDGZ?=
 =?iso-8859-1?Q?VbgfQQ5rgdYMfmYIlfjSukmDi2OlpZzzLXPKL1v9mp19ZZ5YCRTaxDMy4j?=
 =?iso-8859-1?Q?I16YR0l5WOIg8zWJutveuPfp+HMOtKDMOlJIhe4HnWzf8JBtf6E60bl+L3?=
 =?iso-8859-1?Q?mZPyUM9SQL1Qptefo2SBdO++3QUlh3cjRhyXinLZOqRfJKiVTVi5OolksE?=
 =?iso-8859-1?Q?VzVCdv9v7+tk0avDy8ezqsd9gnECvaHOtBu3azTcL9Gj8X7OFih/jekt9e?=
 =?iso-8859-1?Q?GNpsY6tnxIs5J6uncSNVhsbYsX0xiatz1OCNT7ymSsAp5/j8tUvKH150FE?=
 =?iso-8859-1?Q?V52718jPdl9Vjb1KR4vSpMLm9xNENvAnK91WyjlTGyIqYKyMzPeNBpWYaQ?=
 =?iso-8859-1?Q?9oNPC/KUaRRazFrQYjCK6g3jB5KVe6K3FW2DgkPE8HLIY/vgAc5B+9koDZ?=
 =?iso-8859-1?Q?A3UP9ZmkEyNaPKnpL/BkvQ9XedYwj9/m3PKVlSi5Pwy3HC91pqKR+9zIpf?=
 =?iso-8859-1?Q?ebuD/vJ11SNfTJ0/wEMdHoXm6mxFHuJkjwaH2K7lUih+oAaAUIENcKIjZa?=
 =?iso-8859-1?Q?Sg/JKuD9Z+F0/HaSqQ3hGe05bpVlyeA=3D?=
X-Exchange-RoutingPolicyChecked: fopcd4Rysu7j9kXsxnYzTYaWFncbVIyD92MCc1AmGtUhYPQv2Zcqev083isELKck3lnP/1lsMHTW+LrZhGd/XD8HL4Aq7H8ioXnDCBjs6z4yxagUsTxnQeCx74E+flEJ1iP1NxFex0U0SCT2Lzx8s9rjO4XIiarq012Hu0Q1J5Kf3IDiwPNSgydGXh676kkUV97ukw40+qtXkk8x8O888gt7IuZ4DUHwL3Cl4b9dmV7vqaSYFrpo1BlwhqRPNcaUYoXlXmKxf6NKEpbhe50Rn9BOoRE5H2apoYn5YSVVukktPClx6Qljde4eHIWsdh/7AIQb6NNJNl+pbcdgRWchBw==
X-MS-Exchange-CrossTenant-Network-Message-Id: dcdfdefb-baa7-4c3b-1075-08df03fed654
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 05:48:36.6222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N415NDP6gNyCo2JwFUWa3WX172FUy+52eK1Qt/Fdc9xGrW2rUoRLcVAyFSwio6QUWV3kiHAhmRXe+OqGCRNQCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9478
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

On Wed, Aug 26, 2026 at 10:10:38PM +0000, Lin, Shuicheng wrote:
> On Wed, Aug 26, 2026 1:01 AM Thomas Hellström wrote:
> > On Tue, 2026-08-25 at 22:48 +0000, Shuicheng Lin wrote:
> > > xe_bo_shrink() only took a runtime PM reference for the System CCS
> > > backup case, and only after the purgeable branch had already returned.
> > > That branch calls xe_bo_move_notify(), which reaches
> > > xe_bo_trigger_rebind() -> xe_vm_invalidate_vma() and submits a TLB
> > > invalidation over GuC CT.  The non-purgeable branch reaches the same
> > > code through ttm_bo_shrink(.allow_move = true) -> xe_bo_move().
> > >
> > > When the device is runtime suspended the CT is disabled and the send
> > > returns -ENODEV, tripping the XE_WARN_ON() in xe_bo_trigger_rebind():
> > >
> > >   WARNING: drivers/gpu/drm/xe/xe_bo.c:770 at
> > > xe_bo_move_notify+0x1fc/0x450 [xe], CPU#2: xe_madvise/21389
> > >    xe_bo_shrink+0x20f/0x2b0 [xe]
> > >    __xe_shrinker_walk+0x174/0x410 [xe]
> > >    xe_shrinker_walk+0x56/0xf0 [xe]
> > >    xe_shrinker_scan+0x10c/0x1e0 [xe]
> > >    do_shrink_slab+0x176/0x7e0
> > >    shrink_slab+0x137/0x990
> > >    drop_slab+0x7f/0x130
> > >    drop_caches_sysctl_handler+0x9c/0xf0
> > >
> > > The invalidation is always issued for a fault-mode vm; since commit
> > > 4e7ebff69aed ("drm/xe/xe3p_lpg: flush shrinker bo cachelines
> > > manually")
> > > it is also issued for a non-fault-mode vm on hardware with an
> > > optimized
> > > L2 flush, which is how this surfaced.
> > >
> > > Add bo_needs_invalidate(), mirroring that condition, and use it in
> > > xe_bo_shrink() to compute needs_rpm ahead of both branches.  The
> > > reference is then held across xe_bo_move_notify() in either path, and
> > > is not taken for a bo whose mappings would not have been invalidated.
> > >
> > > Shrinking can run in reclaim contexts where the device may not be
> > > resumed, so a bo is skipped when the reference cannot be acquired.
> > > Have
> > > that skip queue the shrinker PM worker: xe_shrinker_runtime_pm_get()
> > > is gated on the needs of its own backup pass rather than on this one,
> > > and on DGFX it returns before queueing anything, so without this a
> > > scan where every candidate is skipped makes no progress, reports
> > > nothing scanned and returns SHRINK_STOP with nothing arranging a wake.
> > >
> > > Also gate the System CCS term on !xe_tt->purgeable, since
> > > xe_bo_shrink_purge() frees the pages without a GPU copy.
> > >
> > > Reproduced with igt@xe_madvise@dontneed-before-exec while the GPU is
> > > runtime suspended.
> > >
> > > Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")
> > > Assisted-by: Claude:claude-opus-5
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > 
> > Nice catch.
> > 
> > I wonder, however, can we skip the TLB flush if runtime PM is not available at
> > TLB flush time (runtime_pm_get_if_active()?) Assuming that if runtime PM is
> > not available, no contexts can be active and they will flush TLB implicitly when
> > becoming active?
> 
> Do you mean call runtime_pm_get_if_active() in xe_tlb_inval_range_tilemask_submit(), 
> or lower down in xe_tlb_inval_fence_init()?
> I'd prefer that too, as it would simplify the code. Two things stop me doing it here.
> 
> First, the PTE zap also needs the device, and it runs before the flush.
> xe_pt_zap_ptes_entry() does xe_map_memset(), which asserts via
> xe_device_assert_mem_access():
> 

I agree with this - the zap is not optional for fault mode, it probably
isn't for 'xe_device_is_l2_flush_optimized'.

>   Assertion `!xe_pm_runtime_suspended(xe)` failed!
>    xe_pt_zap_ptes_entry+0xb8/0x120 [xe]
>    xe_vm_invalidate_vma_submit+0xb1/0x770 [xe]
>    xe_bo_move_notify+0x1b3/0x450 [xe]
>    xe_bo_shrink+0x20f/0x2b0 [xe]
> 
> The zap isn't optional - the pages are being freed, so the PTEs have to
> be cleared either way - and xe_pt_create() uses
> XE_BO_FLAG_VRAM_IF_DGFX(), so on discrete it is a BAR write that needs
> D0. Skipping the flush alone leaves that behind.
> 
> Second, I can't find the implicit flush in the code.
> xe_pm_runtime_resume() only calls xe_gt_resume() (do_gt_restart()) when
> d3cold.allowed; otherwise xe_gt_runtime_resume() just takes forcewake and
> does xe_uc_runtime_resume() - no reset, no invalidation. That doesn't
> mean the TLBs survive, it may well be a property of the power state, but
> I can't confirm the assumption by reading the driver. Do you know if that
> is guaranteed? Thanks.
> 
> > 
> > IIRC It's not totally clear whether this would work for "has_ctx_tlb_inval"
> > hardware, and if so we might need to add something similar to this for that
> > hardware.
> 
> My understanding is that it falls out for free if the check sits above xe_tlb_inval_issue().
> Is it right? Thanks.
> 
> Shuicheng
> 
> > 
> > Thanks,
> > Thomas
> > 
> > > ---
> > >  drivers/gpu/drm/xe/xe_bo.c       | 62 +++++++++++++++++++++++++++---
> > > --
> > >  drivers/gpu/drm/xe/xe_shrinker.c | 18 +++++++++-
> > >  drivers/gpu/drm/xe/xe_shrinker.h |  2 ++
> > >  3 files changed, 72 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index 2eb5d6aac523..274ff97d8542 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -734,6 +734,32 @@ static int xe_ttm_io_mem_reserve(struct
> > > ttm_device *bdev,
> > >  	}
> > >  }
> > >
> > > +/*
> > > + * Whether xe_bo_move_notify() will invalidate the GPU mappings of
> > > @bo, and
> > > + * therefore needs the device resumed to reach the GuC.
> > > + *
> > > + * This mirrors the condition under which xe_bo_trigger_rebind()
> > > below calls
> > > + * xe_vm_invalidate_vma(): always for a fault-mode vm, and for any
> > > bound vm on
> > > + * hardware where the L2 flush is optimized. Keep the two in sync.
> > > + *
> > > + * Context: Caller must hold the BO's dma-resv lock.
> > > + */
> > > +static bool bo_needs_invalidate(struct xe_bo *bo) {
> > > +	struct drm_gpuvm_bo *vm_bo;
> > > +
> > > +	if (xe_device_is_l2_flush_optimized(xe_bo_device(bo)))
> > > +		return xe_bo_is_vm_bound(bo);
> > > +
> > > +	xe_bo_assert_held(bo);
> > > +
> > > +	drm_gem_for_each_gpuvm_bo(vm_bo, &bo->ttm.base)
> > > +		if (xe_vm_in_fault_mode(gpuvm_to_vm(vm_bo->vm)))
> > > +			return true;
> > > +
> > > +	return false;
> > > +}
> > > +
> > >  static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo
> > > *bo,
> > >  				const struct ttm_operation_ctx *ctx)
> > >  {
> > > @@ -1361,6 +1387,28 @@ long xe_bo_shrink(struct ttm_operation_ctx
> > > *ctx, struct ttm_buffer_object *bo,
> > >  	if (!xe_bo_is_xe_bo(bo) || !xe_bo_get_unless_zero(xe_bo))
> > >  		return xe_bo_shrink_purge(ctx, bo, scanned);
> > >
> > > +	/*
> > > +	 * Moving this bo out of a non-system placement makes
> > > +	 * xe_bo_move_notify() invalidate its GPU mappings over GuC
> > > CT, and
> > > +	 * System CCS needs a gpu copy when moving PL_TT ->
> > > PL_SYSTEM. Both
> > > +	 * need the device resumed.
> > > +	 */
> > > +	needs_rpm = bo->resource->mem_type != XE_PL_SYSTEM &&
> > > +		(bo_needs_invalidate(xe_bo) ||
> > > +		 (!xe_tt->purgeable && !IS_DGFX(xe) &&
> > > +		  xe_bo_needs_ccs_pages(xe_bo)));

This is a complex enough conditional that my current feeling is to just
unconditionally set:

needs_rpm = true;

In practice, on iGPUs where the display is in use, we always hold a
runtime PM reference. It would be very unusual for the display to be
suspended while the shrinker is running, at least as far as I can tell.
Let's drop this hard-to-understand, likely overengineered conditional.

Thoughts?

Matt

> > > +	if (needs_rpm && !xe_pm_runtime_get_if_active(xe)) {
> > > +		/*
> > > +		 * Resuming is not allowed from all reclaim
> > > contexts, so leave
> > > +		 * this bo alone and ask for the device to be woken
> > > up outside
> > > +		 * of reclaim. xe_shrinker_runtime_pm_get() is gated
> > > on the
> > > +		 * needs of its own backup pass rather than on ours,
> > > and on
> > > +		 * DGFX it returns before queueing anything, so ask
> > > here.
> > > +		 */
> > > +		xe_shrinker_queue_pm(xe->mem.shrinker);
> > > +		goto out_unref;
> > > +	}
> > > +
> > >  	if (xe_tt->purgeable) {
> > >  		if (bo->resource->mem_type != XE_PL_SYSTEM)
> > >  			lret = xe_bo_move_notify(xe_bo, ctx); @@ -1369,28
> > +1417,24 @@ long
> > > xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object
> > > *bo,
> > >  		if (lret > 0 && xe_bo_madv_is_dontneed(xe_bo))
> > >  			xe_bo_set_purgeable_state(xe_bo,
> > >
> > > XE_MADV_PURGEABLE_PURGED);
> > > -		goto out_unref;
> > > +		goto out_put_rpm;
> > >  	}
> > >
> > > -	/* System CCS needs gpu copy when moving PL_TT -> PL_SYSTEM
> > > */
> > > -	needs_rpm = (!IS_DGFX(xe) && bo->resource->mem_type !=
> > > XE_PL_SYSTEM &&
> > > -		     xe_bo_needs_ccs_pages(xe_bo));
> > > -	if (needs_rpm && !xe_pm_runtime_get_if_active(xe))
> > > -		goto out_unref;
> > > -
> > >  	*scanned += tt->num_pages;
> > >  	lret = ttm_bo_shrink(ctx, bo, (struct ttm_bo_shrink_flags)
> > >  			     {.purge = false,
> > >  			      .writeback = flags.writeback,
> > >  			      .allow_move = true});
> > > -	if (needs_rpm)
> > > -		xe_pm_runtime_put(xe);
> > >
> > >  	if (lret > 0) {
> > >  		xe_ttm_tt_account_subtract(xe, tt);
> > >  		update_global_total_pages(bo->bdev, -(long)tt-
> > > >num_pages);
> > >  	}
> > >
> > > +out_put_rpm:
> > > +	if (needs_rpm)
> > > +		xe_pm_runtime_put(xe);
> > > +
> > >  out_unref:
> > >  	xe_bo_put(xe_bo);
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> > > b/drivers/gpu/drm/xe/xe_shrinker.c
> > > index 83374cd57660..fb6ec77972a5 100644
> > > --- a/drivers/gpu/drm/xe/xe_shrinker.c
> > > +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> > > @@ -54,6 +54,22 @@ xe_shrinker_mod_pages(struct xe_shrinker *shrinker,
> > > long shrinkable, long purgea
> > >  	write_unlock(&shrinker->lock);
> > >  }
> > >
> > > +/**
> > > + * xe_shrinker_queue_pm() - Ask for the device to be woken up for
> > > shrinking
> > > + * @shrinker: Pointer to the struct xe_shrinker.
> > > + *
> > > + * Queue a worker that takes and drops a runtime PM reference.
> > > Shrinking can
> > > + * be called from reclaim context, where resuming the device is not
> > > always
> > > + * allowed, so a caller that needs the device resumed but could not
> > > acquire a
> > > + * reference uses this to have it woken up outside of reclaim. The
> > > current
> > > + * scan makes no progress on the affected buffer objects, but a
> > > subsequent one
> > > + * can.
> > > + */
> > > +void xe_shrinker_queue_pm(struct xe_shrinker *shrinker) {
> > > +	queue_work(shrinker->xe->unordered_wq, &shrinker-
> > > >pm_worker);
> > > +}
> > > +
> > >  static s64 __xe_shrinker_walk(struct xe_device *xe,
> > >  			      struct ttm_operation_ctx *ctx,
> > >  			      const struct xe_bo_shrink_flags flags, @@ -185,7
> > +201,7 @@
> > > static bool xe_shrinker_runtime_pm_get(struct xe_shrinker *shrinker,
> > > bool force,
> > >  			xe_pm_runtime_get(xe);
> > >  			return true;
> > >  		}
> > > -		queue_work(xe->unordered_wq, &shrinker->pm_worker);
> > > +		xe_shrinker_queue_pm(shrinker);
> > >  		return false;
> > >  	}
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_shrinker.h
> > > b/drivers/gpu/drm/xe/xe_shrinker.h
> > > index 5132ae5192e1..86d2a322cadd 100644
> > > --- a/drivers/gpu/drm/xe/xe_shrinker.h
> > > +++ b/drivers/gpu/drm/xe/xe_shrinker.h
> > > @@ -11,6 +11,8 @@ struct xe_device;
> > >
> > >  void xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long
> > > shrinkable, long purgeable);
> > >
> > > +void xe_shrinker_queue_pm(struct xe_shrinker *shrinker);
> > > +
> > >  int xe_shrinker_create(struct xe_device *xe);
> > >
> > >  #endif
