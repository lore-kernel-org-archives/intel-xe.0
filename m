Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5303DF94CA2
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 02:50:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6F110E077;
	Wed, 22 Apr 2026 02:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dM+/64Wk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8EAF10E077
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Apr 2026 02:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776826205; x=1808362205;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PqLTPbGlX1J+9o3fLqmBrBNU6lAtwVP1ziCFInIJtjI=;
 b=dM+/64WkJX3KmD/A3Xjc8ov+kQIthu7p1KZuZ1UwG8h+XxzDbeb+Sk50
 7eca3LO/wSt2jWmtiySjukB3A6HL3DkczWAlUiXK/U/j+payNXgBO3Q5E
 47gl171l3Nm6hRzfnWULK15jDJrafB5Fvh4fgQpXYjDvaWgZ+BfrUSfMp
 CS3ziwXH3pJqS3eFZVaHSFuPrNDRbJUsKAkuhGt9kggyUQVe6exLNMao6
 rtumJpVd6RtshSGShi+KecIZ4mki+h4wj7x+wi0E2l37nzkgvDjg9IlWF
 d4rND5DsmiMV0hG1Voy7woJFnJ7GevP/2tpQGJQZzoMUgRQbNG5cR3QKV g==;
X-CSE-ConnectionGUID: GjHNkOlPT42G6McVczKO9g==
X-CSE-MsgGUID: JcxiVSmhSjGIG+jyXSmTuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="100428289"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="100428289"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 19:50:05 -0700
X-CSE-ConnectionGUID: kMYVsp7LTYqXqDMOhsxaWA==
X-CSE-MsgGUID: etdrrj9URnmDuKfauYZ8bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="229547311"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 19:50:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 19:50:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 19:50:03 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 19:50:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IsWuGMqTvG8a6x5MBaS4PQ+SoGsfwNZf65aFjJ8Dk2Tbl2lvnvLSZdTeGftFCUF6J0tArsu35AAi2NxFzFIz6hJ9J5oAtZHsu1qVPI7pDp8sBgQKbpRrzoOZsSp4bPHP7gv0+q0F5ej7ww1WWJKumvvcD2jrI7d8Z2IVcLa8wfYdxtuLhF+WsEjjUuheK2EnSniaHRqVqrQXqZXdrwUB/bQUPgl8HTzOtekSXZT5pevFAtKGo4gUOFi+4zIua+xbqi7aszKcR2PG70+XJT/OZ+D15RqysX3y6hJGYk7P3ljAaDKuQ+9glly9sNLt4qZrISQ3rhJS2722fr2gPJuG1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYEk5ARd4Bgpng+ZIVlhwzjMDocXpzAW1C0RGUfK+bM=;
 b=adCjE/LNjuVG2Rwg6uCPjhMzZG1FoA06SX6SHCiEYMNoN3Eqr+uC18mm1aJH7BGqkFmCVODWnSXECYfPTu3hB1aFNu655iSM7pimS8Tl12DNSfFy/Ddang0wpxiGrp1f23X9baxyPau5uksSG/nIa5iXPxMiG5vu6AXNYwtkyXmojlFHv8W2LAm0SuA+n2mcoDi0qJ8vcv+GOnByjIY9KTM2w29C4FH+ce6Tx8UcA39OJcW1GJFtt20zBhrdHt740wDVjVV8ENAN1svhXxYNm0cWxt5NIRLCLUm6jsdJ84htvqsyDs2RePaErhanWu+TDTVpqSkwf4UfBa4rN4vDrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LVUPR11MB9590.namprd11.prod.outlook.com (2603:10b6:408:3a4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 02:49:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%7]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 02:49:56 +0000
Date: Tue, 21 Apr 2026 19:49:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <fei.yang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers
 <stuart.summers@intel.com>, Roper Matthew D <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Wait for HW clearance before issuing the next
 TLB inval.
Message-ID: <aeg3UcVPkPuzJ8Wj@gsse-cloud1.jf.intel.com>
References: <20260418000349.1398567-1-fei.yang@intel.com>
 <aeg1NgXPg+y8E7Ho@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aeg1NgXPg+y8E7Ho@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:303:8f::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LVUPR11MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: 60e54837-cd89-45d8-6577-08dea019d644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: OCHtrX1QA3v0fkVYJAqD8qHLuwWodPb//E2aJ7BcekITNdpMRHQqq2qp5dN2l+36Et/WPDmT32lDTXDyRe/ZJZIVJ036kJNIYZmsuuvnv+pzTyMIM4Gqww7bsW3DYxKNK3JcuF0foI6WZZQDEP14XMfOGhcOdG1okW7OWWPPY0X+Nj9HspEZ9OOYXFJWrOqocyfWlA/SZvGmf+CMLC1n6/zC8bThtjECNWUrlbVpioXZXFSIU3MLrQEN2pF5RzP91An5DjUCGEzEMxvUpxpch3Y/XzAQM7VrKHxXKG1qUOAahC3nGxCueUYN42ike+v8cJXtRSpulp7JiSOQ4m3ttomMbNMgZNj3PLDTRNtzYgqm9hzaRnr6PHpAKjdCGhboro1iicvrh78SS4oBLVv6Qfohd/lkarah9f2+/RvxPHCRbfRffYq6/lExYUqLxU3xYTtvlSzb1eSd2yGUvoz3u1ERdCxlhv8PlxOPh6nVVnpQ8qZRiQqlbUjuwlBbv5wO4YAYW1ofqnnzOPlawmaW4lqFz3pt6R/Y1VFp6xOGyIwVAZw2hcAYxRVg4iSlVABeWET+eb+/uFF6Ra2ejlrVQ43mCDUx7Ol0rsMUJ3sH2vfbJHTbEqGmQOPh2jHL2qijWr7Q1SorVOYUfl1KaZs4611FgzJmaYdpChzBDsqe35C59ZMGYqcK0LpilNdm3H1k
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SMv+zDOCBAxSwtUdbYUyPSWB9yBnhgMSzWlIsKpbvYVaUyfoFZQZhB/9OIam?=
 =?us-ascii?Q?gTtfsVP9VjAdbAQZqw4gFmhqkVStVGMSU9uqhj/TGsY1zZizGT1OleVITnm0?=
 =?us-ascii?Q?+MAIF/mnSHi7qTKcqxHMwZZt4wCSpKn7TvOmrzePoTWwiTg9YlwHtW+S16lE?=
 =?us-ascii?Q?QH8xWOVlpVuTa1SQeafjSPUcW1vD16iFCL1tdZCLx4Qs45eh6vdbxDDUrgGD?=
 =?us-ascii?Q?OywnJ4PBPQmHFoxaqIejTzVGMlNqajsLArkg5f35trFu1EmOdDHvNoT0Fqa3?=
 =?us-ascii?Q?xVWjctI9m/SW8GIVbtH0xGg/Faw/jV3azdTZXfTHQxZfSIZeuWN2zBxYsZbD?=
 =?us-ascii?Q?vAp2jogOY0/aMP894aKau0iOCbCOz2rypG42vJDQ1/RTivEScCeyrWpHcEPq?=
 =?us-ascii?Q?svJbbs7ztoLkTDlFh8mhh4q+CKaSW3dzf9lL4fSybXNBnHbh6344dGoHETcV?=
 =?us-ascii?Q?22UGDOgJo2UruhfGR6CU1/vBfnT6OL+v/3VDImCspmAEuVP9yhhPDw4COo/O?=
 =?us-ascii?Q?SJwk+bisE+7XjEIphqh0+JoWzb4rArLxkGxhO4B4UY2r2qzTThUyLLiE5wBR?=
 =?us-ascii?Q?IkSGIZwUurkzA0azg1mSZbY4XNKEMW6YFDGfPgtQ4nI7p6Co8D70feBEkezS?=
 =?us-ascii?Q?9QpqOR6+X9HfYZn2IQt3TqrDloAxjzrRJ0Xzwi233ATGsYHZUBQlLANdjJIG?=
 =?us-ascii?Q?u1T8ZpSfU9DFJfT5janZwplKkXYOVrpkm1DuDfT5jzh87bim9QZO76MwC3lC?=
 =?us-ascii?Q?3MgDohx/NnVqvSOJ3YpNOOYVCxripKJ13FY9oHPSoPDRCa9179lBtktunnYk?=
 =?us-ascii?Q?TMwcTPWndHmgEGNt2dvSvuSztCl6KQc8tF70ShAfiswPNi1EFlK4+2rfHJnJ?=
 =?us-ascii?Q?+LT4a22kkDC6CVpJtlmVmwCqEpHUI8s0J5nYx5srR4U1z8Mm8/wcHLxePTyb?=
 =?us-ascii?Q?7azVjGr4SzxmDTOXievMW3ExEjmhrsbrpRAv7On0nbqqIR5YfbUGnjhjs5lO?=
 =?us-ascii?Q?5S56kdoZlGXXALHlpKdoH9COsx7K6m7G5FrAIBGTqyUzsCV5Aj8KD2qL6Ro7?=
 =?us-ascii?Q?/O6KV2wRESFfSp0w8kgz7xiuP1zNl+3CLySm1ZtGnf2IcXnYvb9SorVtbqaS?=
 =?us-ascii?Q?Tc38omTonPK3QVUTzcqxd7xgCMXnBLftUlTyLhJb8NrR6899W1ISDIT6h1cA?=
 =?us-ascii?Q?RASPIeCi3rnJCFbePTKrgX129PMcC/fjljK6Hh0fnz4dD1l0/RJuKUV8h4aT?=
 =?us-ascii?Q?/CjmLO00KVfIHXkpOfQL3z4WJDV8Ff6RKqnnGN08SWiYbuggEpo0Cc4fHpaI?=
 =?us-ascii?Q?pkV1XMv0SgEtmSOCo3iu3JSyHNiyrSqYsoDZbZfSsnJrl5rN7b+iYaEFuLuH?=
 =?us-ascii?Q?yIgUgdlTgOF2m0oOdEFwSI3f7xVYpfG1DHtvhkSvkNHBl8LOFCnJY5Zm78ra?=
 =?us-ascii?Q?bpzFddZnwKt3ZD1vZ9PbUpCf6HWqWmuzoeqR9HmggDwA0gkxy3xwKQ1OGo/g?=
 =?us-ascii?Q?5+toeljXYteG667WNMV6t1LZFzb1WIBZe+AWLr4U534ywE+Nk0TPapF6zO5a?=
 =?us-ascii?Q?33jgyyyK4AVHC4puCTqyIuVudRFKgijWHTDFLKz+seI+uvZzO9w2PYYAkTjw?=
 =?us-ascii?Q?Aw/Am9VkWrm50L+Z5v8JhO0eHxAWR1mO75ULth11gr1x+xktY8K8Mrm6CmBV?=
 =?us-ascii?Q?HCGFoFzI81SVhAVrDwI1yfbKhi2mzrDMRbIyUv7VNhGX9LbRRdULiFc4P2z1?=
 =?us-ascii?Q?9tZe43m/uoyFtCHR9+Ih/J+4NXeVzn8=3D?=
X-Exchange-RoutingPolicyChecked: jV33IjWVW2WYEHtFyCk48+AZiqsC7LK4rIfD6Z1OwjDR9GZaadjuNQFRJsWHYwMVqq1pzwG4HkCpklvpt519pPPQ77d4HcdWnGgxq+0qnURgxZNuTAeW4wd7GGFTETbjx5oiWzqS7YHpgsjli3bXn5P45lO1+RuzUbn3E7uegWFDBOKT2LcFiMfsAvXd2vuz9dktVsZxodO7dzyTzm68nCVlQM03ZhzFTqi52ZcMvooA4g3HES0qyXr4ABlUD8dOi3mLUbRWPXCovGZ4vmx4ophUzghXZNVYtFh/1Ojl2i3xO/UgtMvzpANxZZ8kfHVNXHQP22nydeRb6nxBg46MDw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 60e54837-cd89-45d8-6577-08dea019d644
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 02:49:56.3799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +4wHlQjb1E1Hirap2qBgQh6x+1MmK0NEfvx1CrnsanacQ/bS7UCzjnomG8ugVTEdAf2wJ2Ez5sDg9FVYS5eoTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9590
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

On Tue, Apr 21, 2026 at 07:40:54PM -0700, Matthew Brost wrote:
> On Fri, Apr 17, 2026 at 05:03:49PM -0700, fei.yang@intel.com wrote:
> > From: Fei Yang <fei.yang@intel.com>
> > 
> > Hardware requires the software to poll the valid bit and make sure
> > it's cleared before issuing a new TLB invalidation request.
> > We also need to avoid racing against GuC on TLB invalidations. In
> > order to achieve that, add a mutex to serialize TLB invalidation
> > request, and whenever KMD initiates TLB invalidation, make sure
> > we poll for the clearance of the valid bit before and after issuing
> > TLB invalidation request.
> > 
> > Signed-off-by: Fei Yang <fei.yang@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Stuart Summers <stuart.summers@intel.com>
> > Cc: Roper Matthew D <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c            |  8 +++-
> >  drivers/gpu/drm/xe/xe_gt_types.h      |  7 +++
> >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 63 +++++++++++++++++++++++++--
> >  3 files changed, 73 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 8a31c963c372..186b1c10334b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -486,15 +486,16 @@ static void wa_14026539277(struct xe_gt *gt)
> >  
> >  int xe_gt_init_early(struct xe_gt *gt)
> >  {
> > +	struct xe_device *xe = gt_to_xe(gt);
> >  	int err;
> >  
> > -	if (IS_SRIOV_PF(gt_to_xe(gt))) {
> > +	if (IS_SRIOV_PF(xe)) {
> >  		err = xe_gt_sriov_pf_init_early(gt);
> >  		if (err)
> >  			return err;
> >  	}
> >  
> > -	if (IS_SRIOV_VF(gt_to_xe(gt))) {
> > +	if (IS_SRIOV_VF(xe)) {
> >  		err = xe_gt_sriov_vf_init_early(gt);
> >  		if (err)
> >  			return err;
> > @@ -514,6 +515,9 @@ int xe_gt_init_early(struct xe_gt *gt)
> >  
> >  	xe_force_wake_init_gt(gt, gt_to_fw(gt));
> >  	spin_lock_init(&gt->global_invl_lock);
> > +	err = drmm_mutex_init(&xe->drm, &gt->ggtt_tlb_invl_lock);
> > +	if (err)
> > +		return err;
> >  
> >  	err = xe_gt_tlb_inval_init_early(gt);
> >  	if (err)
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > index 7351aadd238e..3dd07d75d195 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -324,6 +324,13 @@ struct xe_gt {
> >  	 */
> >  	spinlock_t global_invl_lock;
> >  
> > +	/**
> > +	 * @ggtt_tlb_invl_lock: prevents back to back TLB invalidation
> > +	 *    by serializing TLB invalidation requests with polling for
> > +	 *    the valid bit enforced in between
> > +	 */
> > +	struct mutex ggtt_tlb_invl_lock;
> > +
> >  	/** @wa_active: keep track of active workarounds */
> >  	struct {
> >  		/** @wa_active.gt: bitmap with active GT workarounds */
> > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > index ced58f46f846..2062f990e9de 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > @@ -63,7 +63,9 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
> >  	struct xe_guc *guc = tlb_inval->private;
> >  	struct xe_gt *gt = guc_to_gt(guc);
> >  	struct xe_device *xe = guc_to_xe(guc);
> > +	int ret = -ECANCELED;
> >  
> > +	mutex_lock(&gt->ggtt_tlb_invl_lock);
> 
> We already have a ggtt mutex and TLB invalidation mutex held here, this
> is not the part of the code which needs extra protection.
> 
> >  	/*
> >  	 * Returning -ECANCELED in this function is squashed at the caller and
> >  	 * signals waiters.
> > @@ -76,26 +78,81 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
> >  			MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
> >  		};
> >  
> > -		return send_tlb_inval(guc, action, ARRAY_SIZE(action));
> > +		ret = send_tlb_inval(guc, action, ARRAY_SIZE(action));
> > +		goto out;
> >  	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
> >  		struct xe_mmio *mmio = &gt->mmio;
> >  
> >  		if (IS_SRIOV_VF(xe))
> > -			return -ECANCELED;
> > +			goto out;
> > +
> > +		/*
> > +		 * If there are pending GuC TLB invalidation requests
> > +		 * KMD requests should be avoided
> > +		 */
> > +		if (!list_empty(&gt->tlb_inval.pending_fences))
> > +			goto out;
> 
> The above is not safe without tlb_inval->pending_lock. This should also
> be moved into xe_tlb_inval layer function.
> 

This is also functionaly incorrect. The check here is if
!list_is_singular as current invalidation on already on
tlb_inval.pending_fences. We also happen to have helper for this
already... xe_tlb_inval_idle()

So...

if (!xe_tlb_inval_idle(&gt->tlb_inval))
	goto out;

Matt

> >  
> >  		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> >  		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
> 
> The MMIO access does need protection. In practice, we already have
> locking via the GGTT lock, and this is currently the only place where we
> program these MMIO registers in the KMD. However, what happens if we
> need to program the GAM port somewhere else in the future?
> 
> This is why I think the MMIO code should be broken out into a gam_port
> component with its own locking around MMIO access. i.e., A much-simplified
> version of xe_gam_port.c in [1]. It may be a bit overkill, but it would
> provide a clean, reusable layer, and with clear ownership of the MMIO
> port.
> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/patch/707237/?series=162171&rev=1
> 
> > +			/*
> > +			 * In case of any failure causing CT to be disabled,
> > +			 * KMD needs to make sure there is no pending TLB
> > +			 * invalidation issued by GuC before sending more TLB
> > +			 * request through mmio. Wait 1-second for the valid
> > +			 * bit to be cleared, otherwise cancel the request.
> > +			 */
> > +			ret = xe_mmio_wait32(mmio, PVC_GUC_TLB_INV_DESC0,
> > +					     PVC_GUC_TLB_INV_DESC0_VALID,
> > +					     0, 1000 * USEC_PER_MSEC, NULL, true);
> > +			if (ret) {
> > +				ret = -ECANCELED;
> > +				drm_dbg(&xe->drm, "Pending TLB INV not completed\n");
> > +				goto out;
> > +			}
> > +
> >  			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
> >  					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
> >  			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC0,
> >  					PVC_GUC_TLB_INV_DESC0_VALID);
> > +
> > +			/*
> > +			 * In case the CT is recovered, make sure there is no
> > +			 * pending TLB invalidation request before GuC takes over
> > +			 */
> > +			ret = xe_mmio_wait32(mmio, PVC_GUC_TLB_INV_DESC0,
> > +					     PVC_GUC_TLB_INV_DESC0_VALID,
> > +					     0, 1000 * USEC_PER_MSEC, NULL, true);
> > +			if (ret)
> > +				drm_dbg(&xe->drm, "TLB INV not completed\n");
> > +			ret = -ECANCELED;
> >  		} else {
> > +			/* See comments in the if clause above */
> > +			ret = xe_mmio_wait32(mmio, GUC_TLB_INV_CR,
> > +					     GUC_TLB_INV_CR_INVALIDATE,
> > +					     0, 1000 * USEC_PER_MSEC, NULL, true);
> > +			if (ret) {
> > +				ret = -ECANCELED;
> > +				drm_dbg(&xe->drm, "Pending TLB INV not completed\n");
> > +				goto out;
> > +			}
> > +
> >  			xe_mmio_write32(mmio, GUC_TLB_INV_CR,
> >  					GUC_TLB_INV_CR_INVALIDATE);
> > +
> > +			/* See comments in the if clause above */
> > +			ret = xe_mmio_wait32(mmio, GUC_TLB_INV_CR,
> > +					     GUC_TLB_INV_CR_INVALIDATE,
> > +					     0, 1000 * USEC_PER_MSEC, NULL, true);
> > +			if (ret)
> > +				drm_dbg(&xe->drm, "TLB INV not completed\n");
> > +			ret = -ECANCELED;
> >  		}
> >  	}
> >  
> > -	return -ECANCELED;
> > +out:
> > +	mutex_unlock(&gt->ggtt_tlb_invl_lock);
> > +	return ret;
> >  }
> >  
> >  static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
> > -- 
> > 2.43.0
> > 
