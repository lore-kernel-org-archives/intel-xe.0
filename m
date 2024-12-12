Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20752E77182
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 03:51:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F1A10ECAF;
	Thu, 12 Dec 2024 03:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jOFWgojD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC69510ECAF
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 03:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733975480; x=1765511480;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2SIV/StYz6yWXskqItFWqn7sBW9S2pBjMbqVt3MQHvw=;
 b=jOFWgojDCR5cchazgAEDVSPHUFmbD8LqwF4gByfzFhx2/wSyjRU67ued
 frkidsQ1GC+BdGVEgr8jaxxQqit8tyqNoLlT0xv8tEY4BHiukY0waevvF
 bP89tJ0d7hx6yoyFpb8sWDJtrBv7eBryXjXktjk8uEe/k5HCUPoUAZFUq
 J0cL9Si9NQlhGJn0mI/1cnb2c3MMb5JgP3qbuS3qgEwyvAFdASnanp+ug
 iCgjxvfoFE+Sy60KrjHI+4IkXRykb3lJWSP1tgrRn/dNf0Yr6NURZX55C
 o8eifPsFVdRK0x84cuCdicJh0IZwha47uQAwd0AMpfsle8iTbltlj/pSl g==;
X-CSE-ConnectionGUID: Ycy2nMfPQ2KPwCp6AadBtw==
X-CSE-MsgGUID: D4B6Z3nLSxyR6cVrMePWpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34299054"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="34299054"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 19:51:20 -0800
X-CSE-ConnectionGUID: VLZ76wfHTPyU+cYM1OR18A==
X-CSE-MsgGUID: Z2Td+7VsT16jegWCmroC4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="101108105"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 19:51:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 19:51:18 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 19:51:18 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 19:51:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UW/IYaM1T4bwIsPvqlqQ8RBqbas/4xsRFtMep8AC3Dagc06HPdm9/cgmErpXL/1jxltINHHwKJnCrLa2APjYEijWMVLgtKE7hcKIqjU246el9cyshYU5C6hqELTdjgcdeUev55xP70DX+OsflCHQ/NxpT4GAHmFbiM+r/Cl/54eqNqD2xMAkUhAzSABCDqbGX/wg027dy4bZGsIPaTRnhtl5W8FfCsNfq243Ojx3K1vGngTpngh5a4vNdLsDbSnq75G5LrNpcXWEfnfOC7SOlY27lBdyJFd9Lji98SdoNVz3c7IeY3Qi3/voIYEH5TyRxkfrlq+tqa10McbY1hVa0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rv7JKIxESVlW3e6EQJz5qkQTomToqMv/EqJSELCsHc=;
 b=niwAwklIWTfgxnHjfaB0mAYR9r3tKl9JxUKt4QCyimZf5wj+Rr64w/z7hbKIYvNS2Go40+M7cR5NOdocDugz9CKIdrcnTuT5T7EqZYc1+tzBc+dX6VCPJ0ma+chX8XAHp7yLjlzs4+2nQkxu8/aeoXSQcQgdQiXvLG++wfjVzyww1tpkgjT+p0A9t093a7FVf4Up+nM606ZEbDhBp/oE7vHu9xV5n6Z8aVp5T8qa3ITgUW3oX3Ed9dw+p75/EjqCoDn3DR7OcjKTOQG9NcOwgNGB1Be2VeiwH7AjJCymCkgkjhrtByESqIneCO4xo+81ha2LyjVVCdic0DjhaPy1Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB4991.namprd11.prod.outlook.com (2603:10b6:a03:2df::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 03:51:15 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 03:51:15 +0000
Date: Wed, 11 Dec 2024 19:51:57 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Fix fault on fd close when wedged
Message-ID: <Z1pd3co1pwBPvExA@lstrano-desk.jf.intel.com>
References: <20241211225332.1136152-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241211225332.1136152-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0280.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::15) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB4991:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a11b7e4-cb05-4d0c-956e-08dd1a603a7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BH3x2UfA1aengQcJeS7Pdg6J/fcv1CkNx6nGPguWXoNQAkKPWEQ1un6ipgB4?=
 =?us-ascii?Q?qWCghHPzKRjjm+k6zE6Hz64USt7XAFn27ExuB0xytjTC5/Gnv8wREAxu77E0?=
 =?us-ascii?Q?gaQBsvYgZ7iumCRUqfDFMXbRZr17OW/6iylCYLMHqp2O/p8xRk0iZieRIudQ?=
 =?us-ascii?Q?hzde/nlmfHZKlRxDtxxIR6LipfWBlFpI4ejwcMRE7x/D2EP+GjmePSzbSABg?=
 =?us-ascii?Q?DVVR7Cc48JB0mKHpCSIEZCUiGli+6RN6ol4T78aGpoERywHX4UBDIam39HbX?=
 =?us-ascii?Q?kSydtdTXLNNEdEcxhOu5/dhrisFMSX+8D3+S69wXjfzO+FhyBOQMo6UI2lWe?=
 =?us-ascii?Q?MgnvUgdfpa0aHc5Kr3a7PGGDCmX0bWT2o7s4d8pLhfQ85vLTkYqZGtacTjBJ?=
 =?us-ascii?Q?KqsnVMSP85/TmIz4ubmg5bKVoixcqkDLNA2+LWCjGQenLbKc33a0BVSdRO/w?=
 =?us-ascii?Q?AkR1imNpPZGwTb6B3ZngfnEMA/M/4y3jcUnRuY9y/fTI2Hc/ytBAJwaN0hTm?=
 =?us-ascii?Q?IBV51IusJU0+LpPWjEfq9Max48nuhjTwir8Nb3lXhx7a6ZKDOOLNqp9x0B4v?=
 =?us-ascii?Q?/xmjCuVOCem4XkxUC5NWXvEL3TYIEkX2AuiCTxw2fn7wco2rNbpMzWG/ADGr?=
 =?us-ascii?Q?PDXhHzO7XrVvp0nutISgi8yH6IvryCHsp5qmSFUb1F8gGy7AzzoQcIj+XuDM?=
 =?us-ascii?Q?q7BlOw2RyvCMEanfw0I7Ekz5CT61o5DSFhBQ1PJ1lmO8wjShnlpjPagQ9zkM?=
 =?us-ascii?Q?ct9m/hmL4mJhie8tYvuwpDEgz3EW0gJwcIk+XvkWMYjUQyux7z516j29vhIS?=
 =?us-ascii?Q?D3joS0fkO/76tMCaxI3oNXvQel+toJhGebvHL1HM/RrwH4qCgX/A30FSH/ls?=
 =?us-ascii?Q?GfRp8jHBAb11JqAFuBoZgaBD5grTVj/lfL+xOTMb1p7kbocIjOtaDqaVChC9?=
 =?us-ascii?Q?XAKIRMxdlnrp8m9R9r/2BzU1A/Yz1kug6IdOsZaSOl5Eq0Dqx72vD+rvayz6?=
 =?us-ascii?Q?4RgeBy61yg2S7VBCOmQnMyLLcGdCsIcxJPVLCjvpUEhx5idDiE1ib/RVxx+H?=
 =?us-ascii?Q?Wectnky386+SdjRPL5P+oPPaPAclRIaIe68JnCGFofLz6VnfposIpYWpLQ4U?=
 =?us-ascii?Q?i7l3vxtmljEsNSJ8vCdQAJagjOvOflYRCaxoO+RuYy4jM7bUKpehgsiKLmD3?=
 =?us-ascii?Q?XYcnq2/iuWVOCefVkanvrOeStMeqLOua57d8slFxfjNKPSNUuOlJXT16sveh?=
 =?us-ascii?Q?X0I57qEKEvlQszjfkl+zY7Rf7R3pcs9TdnAQYiQ7svV0X/eC6hBQ/WwLxaBe?=
 =?us-ascii?Q?KkU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XdFFkOVM8EBk1CKruowck7NQ4GXHrmvQK4KdQQFx1EPJXu5aAE5I8Ww1FHjL?=
 =?us-ascii?Q?dYIFjg4XNNEHzLZAYtjNnuhSWaTzXKqcrCQnoI2jv5UOTAGXSWG/rkmsC5sB?=
 =?us-ascii?Q?PNkIsqA9fQUxY3glPf1arhdPhIaOGu2kVfdY2gtoikv0tjL2ORBUdHVLkIj2?=
 =?us-ascii?Q?rhh9VGT6EwcSnDKqjd+mnJw3TFvpuV4CJl3UCg0oZrDF+AHv7M7sZJxfXvke?=
 =?us-ascii?Q?XzCMaxOwGfBI2Tjo9+dlQfAU8bZeIeBmBWhjjCjryxjwgq4U3BXq2iLyCmlZ?=
 =?us-ascii?Q?rRhgB83GLS/qmGSJZ8JKHyKcFYWWQegzcl0KUNt5X6JDSx91HRHlJAJ6T8sV?=
 =?us-ascii?Q?y9iUn27tVecrOGPmMk1EFJfkjmoI8uvm0JwpsLArPmwDKVOr3sgA9yZAeGOQ?=
 =?us-ascii?Q?Dnm1O1AZDW6MOaZeATeMG2Y8FQNWw+zzIgbbETawTihmego4gL8lTPt9YRG8?=
 =?us-ascii?Q?iWjA/hOOyUIngE+XfcRKEWdiCP4ZS845Ee+vLuv2mD6/xC3pucBhL0Y+vveD?=
 =?us-ascii?Q?afyQSLk9XXIB97oGW74aINQW8zIyGBEAdjEFfZjv/YU4QHlz3HATUrN/nzll?=
 =?us-ascii?Q?484LjiOFlvA9vnBcrBqCEuCz9z7iTOlaRmQ4BTS3g0u9uLIXV110/ewVDxO4?=
 =?us-ascii?Q?w956xzwZkStVuI3q2KJsCVJQAqcfeZysqQEmX0Xj9Bp1cMRpwzbFMGO3iTVK?=
 =?us-ascii?Q?VJV5xywWS7E+CSOBGd63b7IN+HlRUabe9DpIBn1IEx5IgQCWziz9nQpyN/lX?=
 =?us-ascii?Q?/j1+cffkEpv3WkyhlCDVodbWkj4xLbAwOfi0dDzP2yow/xuKBTgd8KH1dI4B?=
 =?us-ascii?Q?mrnlZ2fOmaCTuX19Ku6Pp0Wrl/AU61FIVBB4mjZy5n+a613Lr1twnCH7RCGQ?=
 =?us-ascii?Q?x4DfnjYhjMf/51QS6yjnp07COvtPkZf5EAZop2sZj886kt/rJpDDVx4QsQMt?=
 =?us-ascii?Q?gm9HB1gEQxd9B7pXLXzcSC2yMW0ZBYuHpMz//Ub/WklzdvLoelXqup76D35r?=
 =?us-ascii?Q?ALQTmtjGujF9nc1Pt6P64TrZ7tHU/1h89EwmgwkjUQC+NLeRVch5WQQsYlLA?=
 =?us-ascii?Q?RpVB+EfoCU2leSyjymYPA4Eo6H3ZRscOPrcZH74bvt6HxuwVO1N/7F1eE1ds?=
 =?us-ascii?Q?RDWagW1613/u9W9r10WihzUXQGj+7FidkOpuLaWCHGy5z/zrWbAAsQlOp/0U?=
 =?us-ascii?Q?KmDUI5pdLjaAhB43pb7nyc0jPLoV2oE5/8xSc23pPTl7Mn5ISDJlJ9/SXsib?=
 =?us-ascii?Q?Ll9tWFsDTHdu2GNPyOOiOhlyStLmHdzc+Z8jurSLOaeYMMT8+Cy+xgtUPd/j?=
 =?us-ascii?Q?d6BOoTNCWmc92j9YAYTlczI3p8cfcDuO9ICv7Jp26nPKnfGjW4H5fFk5FnGc?=
 =?us-ascii?Q?zI10asErWcYK7OP72tLJdguDhG5c4JGgfxVGwopCWVeQa3+eI/jcnvCKOYF+?=
 =?us-ascii?Q?ipTZa9QpyPNAmnadTstao/k2/AuzPGiLLYstn08d3t3hgPYnAg0rvLsqu9aX?=
 =?us-ascii?Q?/iNivMpmq1j3NjYAJbINYFpRbAJF3Vd0M+tXIXVOOR86YzZq0DQpuvfD2exB?=
 =?us-ascii?Q?4oVJ5kt4WIsZ51+WX97oLOTllON3duuXJDa6+GXqQlYfVi14OY6wD3oH4jtT?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a11b7e4-cb05-4d0c-956e-08dd1a603a7b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 03:51:15.8615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VUT5XGfVlj0D8JWDUXzIbs9z1KvNHWncrjFKY6JRoG+a8ED/12ey3SzV0dm1xFKB3fjhCj05saBCkt07Iw7JfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4991
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

On Wed, Dec 11, 2024 at 02:53:32PM -0800, Lucas De Marchi wrote:
> If device is wedged, the final run ticks update for the client should be
> skipped as it's already unmapped. Fix this pagefault when forcing a

Where does exec queue get unmapped on wedging a device?

Matt

> wedged state with igt:
> 
> <6> [IGT] xe_wedged: exiting, ret=98
> <1> BUG: unable to handle page fault for address: ffffc901bc5e508c
> <1> #PF: supervisor read access in kernel mode
> <1> #PF: error_code(0x0000) - not-present page
> ...
> <4>   xe_lrc_update_timestamp+0x1c/0xd0 [xe]
> <4>   xe_exec_queue_update_run_ticks+0x50/0xb0 [xe]
> <4>   xe_exec_queue_fini+0x16/0xb0 [xe]
> <4>   __guc_exec_queue_fini_async+0xc4/0x190 [xe]
> <4>   guc_exec_queue_fini_async+0xa0/0xe0 [xe]
> <4>   guc_exec_queue_fini+0x23/0x40 [xe]
> <4>   xe_exec_queue_destroy+0xb3/0xf0 [xe]
> <4>   xe_file_close+0xd4/0x1a0 [xe]
> <4>   drm_file_free+0x210/0x280 [drm]
> <4>   drm_close_helper.isra.0+0x6d/0x80 [drm]
> <4>   drm_release_noglobal+0x20/0x90 [drm]
> 
> Fixes: 83db047d9425 ("drm/xe: Stop accumulating LRC timestamp on job_free")
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3421
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index aab9e561153dc..9ad7a6b24cc3a 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -265,7 +265,9 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>  	 * Before releasing our ref to lrc and xef, accumulate our run ticks
>  	 * and wakeup any waiters.
>  	 */
> -	xe_exec_queue_update_run_ticks(q);
> +	if (!xe_device_wedged(gt_to_xe(q->gt)))
> +		xe_exec_queue_update_run_ticks(q);
> +
>  	if (q->xef && atomic_dec_and_test(&q->xef->exec_queue.pending_removal))
>  		wake_up_var(&q->xef->exec_queue.pending_removal);
>  
> -- 
> 2.47.0
> 
