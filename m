Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A49BC87FCB
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 00:47:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E622910E06F;
	Thu,  7 Aug 2025 00:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fv/YFNbu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6805510E06F
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 00:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754527619; x=1786063619;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iOh9pMhtSt2YTPWNY9T3jpCMbc/09OdwV+5+FxD+bIU=;
 b=Fv/YFNbutT6y9A/zSZontccwovMmcXJ08pBKiW5BJXu2w1IjnL7Fq4J+
 2RtLRuuap0dVNE6ZwWid6wnp3R3X1+/J375Xx+GgEceA2KuKtJY478yXO
 T+W08+eBvpLbIvrP17pnaml6BQ6x3Frd9j1IIXlT89jYDtiZrDMmlmily
 lBeDNokCct62kbPN+/RFByaU5/Zn0Q5Q+WXYYvDTm/AA8Nb2xBnTOTaVb
 f2FMphFcAm1teOfGgCfbBSBdCJORDcVRKqnQbP8/5pM/WKbofA1gIPhoz
 jeaUszvub3VfYYQQssrYmgDqRGiEUk2vVwxlBRhDr7Z5hxvzGZafsbczR g==;
X-CSE-ConnectionGUID: NL6gcBGXTASBlsC/y1xgjA==
X-CSE-MsgGUID: ls929GiIRyyHbfTlVeZ+Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60666093"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="60666093"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 17:46:59 -0700
X-CSE-ConnectionGUID: el7vLBWQTKimAcwz/m8Gng==
X-CSE-MsgGUID: ZgjNNilGS1+l7Bj4lWMXnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="164812592"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 17:46:59 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 17:46:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 17:46:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.78) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 17:46:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bw01hmw8CGZ697nhMv0AlF3tyuAMIZ02dkZ7xjlmPdoRJyoVsc0V+DyIbfjwYEotJrtK3RZLczNpWTIIvr1Obw/9otZZ2n/P13dQnPtDH1r4S8NNMfKKJIYeGJBwjFAjCXcfousKoGk9ZyD/nByThRGe9KjjuEKnC1uPODVC66eEh8oHnmpFtyyev7H/TPXvzvD6p1ZowY8ogJLAbGfFtgGXzMRlyz0jlSj+UQSy9OCT20To022TiTOc7AruP2olkCBAwsYXCr5ljG3pphXDHK4xcF3GzLDc6lL15s+uCttgeB1w+ipeLLp2Iw0dGJVrHBg7niDzqhUVnatHFdXXkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBAw349HXzmpwKRy7X6NajWdBU004cwH6pzfKB2pZFs=;
 b=teXD4df4fAHa1G+LrSUkORV3lIfFkT3F9fDMaq95RiJJmEZQqDX14k5+/2cullMKblrpDYhPSAoPMXcHU8W1MO9rfHEFEO6hblAkKgE8vxy7B4udXJ9Hhpwy7Z3RDo+bTe0/scvn+8LEcg6kPsjutttsw80t6xLBKWZnIf/nf5+Z3MoC9ZvAT3R3n3n6q6W4M3EOCSUTJ9wo4OUktEqHOk3HojBH73ez7to1RTat0ZuIDNUkZAZ0zvM6NMljk9VLt7eFUrdTyNsrtOpOnYC2CkY81m2OGVbzfm1tk/LDrOvE5UkqkIXUihVcm6jqQtcZShQKbrgMyGgHVYv0pIfypg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) by
 PH7PR11MB6977.namprd11.prod.outlook.com (2603:10b6:510:205::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Thu, 7 Aug
 2025 00:46:51 +0000
Received: from DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0]) by DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0%4]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 00:46:49 +0000
Date: Wed, 6 Aug 2025 17:46:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe: Disable compression on SVM
Message-ID: <aJP3ds63iFJCl9t7@lstrano-desk.jf.intel.com>
References: <20250805220653.745400-1-matthew.brost@intel.com>
 <20250805220653.745400-2-matthew.brost@intel.com>
 <965adc2e-1d2d-44de-b1c2-96ed8af76052@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <965adc2e-1d2d-44de-b1c2-96ed8af76052@intel.com>
X-ClientProxiedBy: MW4PR04CA0167.namprd04.prod.outlook.com
 (2603:10b6:303:85::22) To DM4PR11MB6527.namprd11.prod.outlook.com
 (2603:10b6:8:8e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6527:EE_|PH7PR11MB6977:EE_
X-MS-Office365-Filtering-Correlation-Id: c90c190f-2c76-478c-62cd-08ddd54be49d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zLS2MJghpoDRJb6QzzwsrSUuXdTq2/SyaixvdlzHBuC5a1WA6PEEWxFAQWAU?=
 =?us-ascii?Q?oVfksxuo5ibuqjIFgMle20JCc9McFRqNZxk0+xHM9WMf6s67SIThC1Z6ng1O?=
 =?us-ascii?Q?P3X/lfW6vHUYecX/uUV4rzrLBOKn9OIvE+LTzjzM8/oEuAxzyzFHQvDtT9UQ?=
 =?us-ascii?Q?YUjBD6trtFAvKuC79NPC0oPA35MCKZO7bT566FpMg6OXvMKa9+PWG0mVKlXe?=
 =?us-ascii?Q?Frk2oBrilFRWnYftnGoR2qWdblFtDynT5OUTl9mv5BFTIb0QVapigbIWZhIF?=
 =?us-ascii?Q?XflrykBQQj7Zq7UjihAcNUk8JnuGWR83I89J/MCADGnYFP9WB5xSB++G7YI1?=
 =?us-ascii?Q?72lB0CcaW7ejI0haAACjTkBHfJsn0Z6Sa2/brd/AWSr88M6iqg7U8gxhlaAm?=
 =?us-ascii?Q?/dJhq9wkBprrZ5R2b+J55zP7P+OLcIcXTCT+f19INdqMSEizK4Dgb4hPBtME?=
 =?us-ascii?Q?W+QS8x8MkAUTNhuf+yOv4ZVG050LxNMHJI1vRKObZKuYJlLUSBWWXkq13rJa?=
 =?us-ascii?Q?4NMhj/XscqmVuj1Y0OrxdlI6jAKdhYet/foGQi7KFjrX12m7YlATlhdOYPVb?=
 =?us-ascii?Q?CM7BE+wUJeVlM3A7tKy9CKjQyJ2Q7J8SXV8oGAqv8eaYpuNodhD5k1H/vDcj?=
 =?us-ascii?Q?UATrAE3+GQRnVNNMJRPr5b9D5laNQ7dQLBhv0mzsEUFUEvRUHfxRj9dPo3y4?=
 =?us-ascii?Q?9I9DxTXnHjgGzqLNHncEzR1W8HuGibnVWP88mwZoxn+qFySrXoePoIsqTCjf?=
 =?us-ascii?Q?9lHUxnHyPhnDkEBn7yWEWIrNNbSzWETmD8ub2/oUv9NoocjwkUYf1cBcW1yU?=
 =?us-ascii?Q?UaiGBcsZMstjZJfUS0beman7K8LCxTivMZuON+tzMRzKxQmriKWTjFLkVh6c?=
 =?us-ascii?Q?kF3w5TJG8nb4+GJDy7BJWvOad4T99A9npEewV4RyjwLsRWzdCyfJgDalTZpE?=
 =?us-ascii?Q?fYA31gY9JtUB33CoDm47cpHc0wXKfDjuASMh1iwr2ij2EV0ulkmUjSUKVZ1z?=
 =?us-ascii?Q?oW7A1b5i2FhdGvf/mRqHxa50vSqhoDr8+9U+uhXs9manEdbKV8qFUn0Ygtis?=
 =?us-ascii?Q?zF6WJC14dOTYkoqr9NbFFLJvHViMrpeEnRRP1daPgFR6rYzOVnO4EtP80cDA?=
 =?us-ascii?Q?dJxEPYQnKL9n9ELT9W1xPtTKlBl57o/2AfbZjbM9hazl74uXPvJtHahbMszy?=
 =?us-ascii?Q?fUYBHajzXnPPA+I4DRyB6Vo5mYWdRT/fLRuBpaloNk9Ev2qmmxOCPA6sPSJ0?=
 =?us-ascii?Q?yw2nmz9J0x/xfmESuB/ZNBkvNdjAYSXWc7PAdy1hdryH27x6Tlljbim9g5GP?=
 =?us-ascii?Q?b7TvbRqtzNcc6G+ssp+1hnEoaThUTjYZRQH2cFHG+7h4hpmiF4k4Nb5G+UtK?=
 =?us-ascii?Q?H/u14zZtwRA2h2wYdBXUrGRQbWzHFiBRGOcGk3nWEk1e8j4UcjJQvOMoe65a?=
 =?us-ascii?Q?na0QLB0UQcE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6527.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ahDrRcHkySrd0MT1pNVlkSGHwmynUEZk6oQ64l9XSHW3yPFsGi7wLYN5PNdW?=
 =?us-ascii?Q?5BVSvqjXc5dhfy963l94jm+5wcvcaRfCH3FSsGUQxkYAmyCtnvZdTrRagLPk?=
 =?us-ascii?Q?KumW2IplqFw2mLx0U+HIgqiQ4HJpBUjLIHpilDisuwkt+xJnRLNiG3Hg2m83?=
 =?us-ascii?Q?l9AOEf6p/aqo3/ANHx7fKcFqbXY5Tbd0zC/2fT6S//IffOzMAjZfpEcOQtDM?=
 =?us-ascii?Q?CliXqTKffrTMW6wTq32D87fjsz37otrGVB0+BuEGSQn72shc02Zf3Pw+VudF?=
 =?us-ascii?Q?G1bF1DjX8CKd8hkahNn6PbFkEwPBS2LSDAK7Idze/4qcwgSQcL8j+Pr/6ybJ?=
 =?us-ascii?Q?p+8nTrBFNc/G8eICYe6xFjFwbRunC2qo3TweexujbkVPO7AWmaxiNixwX204?=
 =?us-ascii?Q?u1lo4oo7TTtXwUqhcYRI3HdmRhOYKEYlecIWijh8HLHg1hQXgW3MWYzNbfgj?=
 =?us-ascii?Q?Sgb0yxI74nD5rb7qCA0GUGVxmsolQTtBxEP0LyWw8INcSp0tJVUdQywYRNt2?=
 =?us-ascii?Q?0fCdQHOuIt31uJu7n+iBQPTP5puiXXfJFriZpscJfJpBg1meNl74JGVNXuM5?=
 =?us-ascii?Q?T9s+zTqzDN3QyCZn10FQDOy74/7JRIyNJ/oPhlGYSbWRg62nrwr3U1lPfBcS?=
 =?us-ascii?Q?XmPV5Hk+LMOifqDBNwaCshdiczIJ7l0P2WVyyRmpgc4jg17IFdpa4qPyDKLU?=
 =?us-ascii?Q?tvPMoOWyr4txC4aXJXbwY8lldHc9WUL78pDQY7EbtxUo526JGKC5ro0FP4mi?=
 =?us-ascii?Q?djJfYcyM7wAG3f66mbhzkoQS0LYajWtJ4vd5aPyQmXtyMazXa997unAeVu16?=
 =?us-ascii?Q?2shfuxjzWotoN/q9IFkBi3Z35k+COI2c90FMQSGbpyg+32uwm9exWKS87S2C?=
 =?us-ascii?Q?w1nqYrG5LxzMFyUz0Qj6kRXk4sc9LCstacJIwfiyyRmvRtQroC4pZwgSIGBf?=
 =?us-ascii?Q?1n+ZLpQOqpPHS1h/fHFanHvBMLjos+fMVoZ21jylUq6uTxXiZPoLFrhEGAbt?=
 =?us-ascii?Q?D/oNRtvYgH9ndMIovnwcuO8lCNfU2TQBvIhen+TOTC+bwj+vFa0QkTgDvO8C?=
 =?us-ascii?Q?1tJJsi6wJagLz/5NOgqTu6aZWF5UYDMIg28UwYVv0f0DYcHK+ygzNfnhzqvz?=
 =?us-ascii?Q?FUd4HoY7MwClO42gvTFPyIu39Yu7Vn4sXo5g25/nVplFm++jlPy8MZL4qGSB?=
 =?us-ascii?Q?BcBY+H9ouDUS4MPy8oUUdjnKNCVnMIY+rOxuqZIiUJk9nDFC2M+1+KlVz/zA?=
 =?us-ascii?Q?rfGZlv52s87zdFMcDvkXba8bx4tiHKN9wF4SzeX2by2x3HYYfZsOyWYdGo2q?=
 =?us-ascii?Q?DkLFZGMT0sb5KhXjE2L3qTETlh/D9oZuRR+B2PUVcFU1FVTxDqxeydUq2jHa?=
 =?us-ascii?Q?Z70IGEQwwfNun+BziFBuTNA+Us0YzPpXTdecVn+r29CbVsAXzxFDErF2tzht?=
 =?us-ascii?Q?K6Xl8xwjYfRDpTEGINWFkycC2AJJyjNx4yLrQ1u0ESmmv89GwJD1nFC2NJoR?=
 =?us-ascii?Q?8nv7viWAh+eAoTD/Ohp564GGHf1KqVevOXMo+GUXkCGqJOFoSKISUiEcfggM?=
 =?us-ascii?Q?Q4VFYW4YC6x8i2FRwqqE3GCVeLKf5TUBlrzKM4dFndRPonHoxB0iYXT20Ook?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c90c190f-2c76-478c-62cd-08ddd54be49d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 00:46:49.5066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GkV0yuA35SrxdtA+DycAcc1jLOlLRmNA24/lzLt3vtA6kS+sxXysna1Jb79BnbYw1cfQJyD2oMfp5PDJvPtoLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6977
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

On Wed, Aug 06, 2025 at 10:12:42AM +0100, Matthew Auld wrote:
> On 05/08/2025 23:06, Matthew Brost wrote:
> > This is not yet supported, forcefully disable by setting pat_index to
> > zero for CPU address mirror VMAs.
> > 
> > v2:
> >   - Use XE_CACHE_WB (Auld)
> >   - Only modify pat_index if compressed (Himal)
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: b43e864af0d4 ("drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_pat.c | 10 ++++++++++
> >   drivers/gpu/drm/xe/xe_pat.h | 10 ++++++++++
> >   drivers/gpu/drm/xe/xe_vm.c  |  7 ++++++-
> >   3 files changed, 26 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> > index 2e7cb99ae87a..ac1767c812aa 100644
> > --- a/drivers/gpu/drm/xe/xe_pat.c
> > +++ b/drivers/gpu/drm/xe/xe_pat.c
> > @@ -154,6 +154,16 @@ static const struct xe_pat_table_entry xe2_pat_table[] = {
> >   static const struct xe_pat_table_entry xe2_pat_ats = XE2_PAT( 0, 0, 0, 0, 3, 3 );
> >   static const struct xe_pat_table_entry xe2_pat_pta = XE2_PAT( 0, 0, 0, 0, 3, 0 );
> > +bool xe_pat_index_get_comp_mode(struct xe_device *xe, u16 pat_index)
> > +{
> > +	WARN_ON(pat_index >= xe->pat.n_entries);
> > +
> > +	if (xe->pat.table != xe2_pat_table)
> > +		return false;
> > +
> > +	return xe->pat.table[pat_index].value & XE2_COMP_EN;
> > +}
> > +
> >   u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
> >   {
> >   	WARN_ON(pat_index >= xe->pat.n_entries);
> > diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> > index fa0dfbe525cd..8be2856a73af 100644
> > --- a/drivers/gpu/drm/xe/xe_pat.h
> > +++ b/drivers/gpu/drm/xe/xe_pat.h
> > @@ -58,4 +58,14 @@ void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
> >    */
> >   u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
> > +/**
> > + * xe_pat_index_get_comp_mode() = Extract the compression mode for the given
> > + * pat_index.
> > + * @xe: xe device
> > + * @pat_index: The pat_index to query
> > + *
> > + * Return: True if pat_index is compressed, False otherwise
> > + */
> > +bool xe_pat_index_get_comp_mode(struct xe_device *xe, u16 pat_index);
> > +
> >   #endif
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 432ea325677d..83f507ea7f30 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2362,7 +2362,12 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> >   			op->map.is_cpu_addr_mirror = flags &
> >   				DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
> >   			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
> > -			op->map.pat_index = pat_index;
> > +			/* XXX: We don't support SVM + compression yet */
> > +			if (op->map.is_cpu_addr_mirror &&
> > +			    xe_pat_index_get_comp_mode(vm->xe, pat_index))
> > +				op->map.pat_index = vm->xe->pat.idx[XE_CACHE_WB];
> > +			else
> > +				op->map.pat_index = pat_index;
> 
> Just to double check here, there is nothing scary with coh_none here on igpu

I think don't igpu vs. dgpu matter here as on either system memory could
be mapped into the gpu. If we apply userptr rules here, I think we'd
disallow coh_none too.

Matt

> + svm? It gets rejected somewhere or somehow there is no way to bypass CPU
> clearing on host side?
> 
> >   			op->map.invalidate_on_bind =
> >   				__xe_vm_needs_clear_scratch_pages(vm, flags);
> >   		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
> 
