Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E74CE79A4
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 22:08:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0CD10E335;
	Mon, 25 Sep 2023 22:08:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BD010E335
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 22:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695679688; x=1727215688;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A/xezv3AO963ldWSNGlE3caFH5HSRNKVppKfABVNsSg=;
 b=Dz+eKnsS2HV2RLuGOsRfM4GogVRMmlk+D67qI2VMz0HnUyETdQSzd2FN
 zWFZPXJwRDZ2C00PJZkS+OewsXIwmVxLRAV1OzVXzStfy3KMlVpzLzBI/
 wnSN2VB1Tf6hVhtl6YK9cVHCo+4RCSFF7+k0JCzFliRw26Zpup5UFkiIP
 Xmv/U/R6OXuuZApltkontHUJ7QmKodj5Dlhsv68s7V0wLZATcpiZj8pp9
 +e+H4tYsUfcBSL4KOwUcLgLNw8PjAsKHjCiVAHjR4GnzdbvXiFevrRpbz
 wV2OcyS209YFpHlGbDiwyZZYpBmyDTa+GuqX8v5pi3KwjyKhi4oeN3NOv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412331802"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="412331802"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 15:08:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="742087142"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="742087142"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 15:08:07 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 15:08:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 15:08:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 15:08:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NboI1thBs8V/8ux3yY5BNGd3eFrtSoeS0RklNAGtgCng6fDLV5nAXblOUVlCpj4AktWqwkh1qY2S8bLxCCpWNjdM39Pgf5vTw8a/XHBEBUVNqJ2+uU8NhJrNIYRQ8au71tTGHMUi6OmIMS9a9j6RXKNyS4q08eHOYgzG9utue497AbLS4uk2w/ATsaamp5PvUs1qKs51jkH2Jbjn3xADWYRQmQM6T669lLZDhQhFS8kBLuEB6EBZdAn+EZNuVLIY/c76MB89KkBMnV9rMRv0tvJamP/lZgzNsAzEN2jTWH2ScQGW1pEZGq0aC/XrqR1ql7zqvVzib+pyWzYxx8oa9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRf6paAlBuC4AQUNCjQ9ks8U6bEf7koPciM4ApUQsn0=;
 b=Lywh/iUYG+6K9wRD5wyYEdj5XMyauqkJG2EcQHaYax/hE3UmxT+zxzRQM9h8C2AWsMNY5Oy4WVpUTNwFEgAlOT6nhV5SX2ESN3hKcQENFiw7h0ZroxiUCK7vQT2Ed697oJQfCnF5njNn7X1z9rdhHN0lYf3YRc20B8RQk7UKlxDNGaN91nVaMrz3Ul6nD6KHYxCkuHk3B8C684iF2SeG7sVFZYUyihA5+JH7Hjkem0L3cDeyqDtxlBOm27Q8WYI+6VFDFP0VsrgfLrFG3INsExbd0fGLEAdOHVgsdtqwuLcR3x68DcmSOYQk4cquDwHO9X/f8mkPHEbwRVAwPe5UcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM8PR11MB5656.namprd11.prod.outlook.com (2603:10b6:8:38::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.28; Mon, 25 Sep 2023 22:08:04 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Mon, 25 Sep 2023
 22:08:04 +0000
Date: Mon, 25 Sep 2023 15:08:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20230925220801.GR233750@mdroper-desk1.amr.corp.intel.com>
References: <20230925132113.59900-9-matthew.auld@intel.com>
 <20230925132113.59900-15-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230925132113.59900-15-matthew.auld@intel.com>
X-ClientProxiedBy: DS7PR03CA0305.namprd03.prod.outlook.com
 (2603:10b6:8:2b::25) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM8PR11MB5656:EE_
X-MS-Office365-Filtering-Correlation-Id: 45409048-f154-4fd3-2acf-08dbbe13e3f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x2hqZ3qYqdnoO3S0RppLk2eMqHGDOAIQ1Wb/mZvF+HXi8J3tec+4q9OReqCkR0POaFckaHqC3/qi224f3dZ1Ts5PeTGJxm8KOGwaBotxuLtwEFuO8EijU2vMaC0sqJx9UlLgh2G6Ag6JqPVycOzYZzaHfATwSIgoBo5ju5kAQbTJn1i8PXg4Ex1+aRVWkExf0aRpl3BTev67IxvVS35K5pmY2ysKvHA/suqoQmccj09CKos11IF5ayFs3fMb990yKOE1sIfhIRBSmrIi0LAaSFhE6EUod2Xd0Jo2iCogKDU6vdVB81d4eMmbwblWm9UvXNDmNo+TeS9scAm/7SfVv624pFVrXdzL1/JxEjX9OxgwlC3Ut8OYLK62fG/AMELp3DgTA01xz39SetPI1yUtpg/foHYSK/YZncyT05xfb1kiVOhJNEtTyEk8xnz+OCqmAtpx5IGNLZ72h9f4VDfksqGfhTLXBDXLngoA+eSe99Ku80Zt4JMsE0r5tT9BjimlbB5qJwi6kb3H7MsQBKk+HFBarF0dhpDmVL3aDeDwW0vcMjMZzIZS+4+eIXJxvYuvFPoHmrtSrKNgHI9eXpP5sMfomD4vBil0waqOVxFrVpo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39860400002)(376002)(366004)(396003)(230922051799003)(186009)(1800799009)(451199024)(26005)(6506007)(6512007)(6666004)(82960400001)(6486002)(107886003)(1076003)(33656002)(66556008)(66476007)(66946007)(86362001)(478600001)(38100700002)(83380400001)(54906003)(2906002)(5660300002)(8676002)(8936002)(6862004)(4326008)(6636002)(316002)(30864003)(41300700001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I4ADDdk8tHuS3LRxzr+zOnJb+FOeho8DjAQ9Zw5pJBYPBTdtNxJvNQqf64Dl?=
 =?us-ascii?Q?mC5SSv6qBtxG3oygc8i0zWy+7CgCq+NezkvMMB8Oxazz96YLWIrUBPoEJE0m?=
 =?us-ascii?Q?YM3xgL3CU3xy/YEA4GHcRyIB06if4/u3288hiV3O9FaI7vrzQ09dauEyYu8s?=
 =?us-ascii?Q?7bGz+CPth+x4UV/jlyMrTrVlJG/HjATxFQlzSdQxCjIdJX+KnJ3qaL8wcTok?=
 =?us-ascii?Q?4iBI4sccDnAM09n2pQt0ENp6Sk5Z3TLKrspKLbK/juGrPeRhCHC5UKQraqTF?=
 =?us-ascii?Q?RCekYo5I3GXtcpTZNLfNFTtS7pgrU4jKed2vBE/uyBknm/R1r8Ta7fJQo76L?=
 =?us-ascii?Q?3MGSCrgn3d6AIK5fvA7rowx+3es0W9U+hQYdcP2Dv684w51QabpdzEQJ3O51?=
 =?us-ascii?Q?Qqz9U659l3MAwzrPd4ZM3E8Df6Honrt1zhOKK/GtaSvPdKXNtQ3qG4a/teiZ?=
 =?us-ascii?Q?jG0MgAbv7QaWCF8hcIzEEHyGK0b39Hf51YoVV/GYtlBloebBuvsPFtyfxfry?=
 =?us-ascii?Q?olBaqW/54y4Sr3xwefnhs/YeGt7XeDOTuMHrXsjzSFvKQhKg82d3U2VlMxjY?=
 =?us-ascii?Q?StRYxxXxpu8zLeqSfwncj5ttJeKLNNgyxkF28Tf9hRyPNnJyoKmzsMNc5Csc?=
 =?us-ascii?Q?oeunJVdVGL2LLhD0eNeX9A5KmpBTXTaLMBYDOC6Zz6nQdU4JuFBtMf7861FM?=
 =?us-ascii?Q?xEzoq5oHUDCfBxflIbLl5KG+WcadsygS2VoNPXvk1XzJWpTKi1pKrhmx7IeT?=
 =?us-ascii?Q?O1gnr72ktnzUakvg5YKPTo7qSNqyYVwd1JXhdhiZFajHsqAF2aHCwEeQq0V5?=
 =?us-ascii?Q?Eiu0jTdXokoESCzolQke2G4RrsY93DJrG+InePO2rgyibxWgEt/5Kj4mdn7u?=
 =?us-ascii?Q?6VMsnSXL4EK7b/2dSaDM9CRtmj7SPGFaJWDO5+lf1Oud+d5r3kyjcEji2yZh?=
 =?us-ascii?Q?IsPuM3tRmF1O8mcvCqyOW7ynkI0ARaSNtRi5J+GfYTkjozHtLlLPmwhjh0Av?=
 =?us-ascii?Q?yESqItAdSkB91b0KVLLE1/da8Wrzwq61MHXCE+l0B/Fh/+nkxKfV33/f2aIu?=
 =?us-ascii?Q?W+ioP2cZlzDf2rgu/8KfjsBvtQSrr9vIrOovMdWEzrf4aUv60HNCQ3dstKPM?=
 =?us-ascii?Q?rTer+/SGXAg4GaQnfKhqvAV77w1ATo8QyVNlrKNhcr7kh6HoBAE64VgMuV8j?=
 =?us-ascii?Q?lQfaEh0dng1mPTmwYnxcaCnGCS/wjVWdPLcIHAK5KoAD+VTufTRrSTwcT/Rw?=
 =?us-ascii?Q?A3epuTkde28feT/uelMTAHzxjMs5RhP6cSH7f8ZPH74VHFLgfYVY+c0/xGi+?=
 =?us-ascii?Q?4rOuuMuUeUMCfx3ID6ibUuGyQ8frpkMvEvOx4wbt8GIzzixXknFfsYVILGmi?=
 =?us-ascii?Q?xf0BR4h5Eafv9m8SJ1zUoowWjfxH9y+98LUtIqqg5J8EXyV6ru/imSRD1hcu?=
 =?us-ascii?Q?pWdX3kL6W7acRrBKNYrwWAJGWwvAHLOd0eCvBVsd7fUFCmINlAlNuA7TMMQm?=
 =?us-ascii?Q?MZSHk09691LebggU8ut4eRMJrzEOwPJXk5GjYZs6KNB57yZRlcwOCquN0yUg?=
 =?us-ascii?Q?fnni2tdTsfU8o/JTg1p6HZEv5eUKXweqW2en0wkLD6BE+rn0ArCwKY3e+keS?=
 =?us-ascii?Q?Mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45409048-f154-4fd3-2acf-08dbbe13e3f1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 22:08:04.3505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BwcyK34z7NpG+2m+AgTk5gIxj31TUWI3ufh4pz9CeAgS1xB22/lbDW7cT7bOcRWBqbx88t+PwX77l9SFB9DbFmpLxSdXqSUxE0A3mnR7IU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5656
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 6/7] drm/xe: directly use pat_index for
 pte_encode
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 02:21:19PM +0100, Matthew Auld wrote:
> In the next patch userspace will be able to directly set the pat_index
> as part of vm_bind. To support this we need to get away from using
> xe_cache_level in the low level routines and rather just use the
> pat_index directly.

It might be worth adding a kunit test (in a separate patch) that ensures
every platform's PAT table can provide a valid index for XE_CACHE_WB and 
XE_CACHE_UC, which I assume are the two the kernel might want to perform
lookups on in general code.

At some point we may want to replace xe_pat_get_index() completely and
just cache the indices for the "important" PAT settings at init that the
kernel will want to use elsewhere in various places (e.g., something
like gt->pat.cached and gt->pat.uncached).

> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Pallavi Mishra <pallavi.mishra@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
>  drivers/gpu/drm/xe/xe_ggtt.c          |  7 +++----
>  drivers/gpu/drm/xe/xe_ggtt_types.h    |  2 +-
>  drivers/gpu/drm/xe/xe_migrate.c       | 13 ++++++++-----
>  drivers/gpu/drm/xe/xe_pt.c            | 15 +++++++++------
>  drivers/gpu/drm/xe/xe_pt.h            |  4 ++--
>  drivers/gpu/drm/xe/xe_vm.c            |  8 ++------
>  drivers/gpu/drm/xe/xe_vm_types.h      |  3 +--
>  8 files changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 6b4388bfbb31..d3bf4751a2d7 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -301,7 +301,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>  	/* First part of the test, are we updating our pagetable bo with a new entry? */
>  	xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
>  		  0xdeaddeadbeefbeef);
> -	expected = xe_pte_encode(m->q->vm, pt, 0, XE_CACHE_WB, 0);
> +	expected = xe_pte_encode(m->q->vm, pt, 0, xe_pat_get_index(xe, XE_CACHE_WB), 0);
>  	if (m->q->vm->flags & XE_VM_FLAG_64K)
>  		expected |= XE_PTE_PS64;
>  	if (xe_bo_is_vram(pt))
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 2002b6597dbf..1c447f1a4fbb 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -41,7 +41,8 @@ u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
>  		pte |= XE_GGTT_PTE_DM;
>  
>  	if ((ggtt->pat_encode).pte_encode)
> -		pte = (ggtt->pat_encode).pte_encode(xe, pte, XE_CACHE_WB_1_WAY);
> +		pte = (ggtt->pat_encode).pte_encode(xe, pte,
> +						    xe_pat_get_index(xe, XE_CACHE_WB_1_WAY));

Hmm, looks like this series is still based on top of Ravi's old series?
I believe his series was going to get reworked to remove stuff like
XE_CACHE_WB_1_WAY, so some of the underlying code here is likely to
change.  I think Lucas was going to help with reworking that, so he
might be able to help reconcile the updates to Ravi's series with the
changes on top that your series is making.


Matt

>  
>  	return pte;
>  }
> @@ -102,10 +103,8 @@ static void primelockdep(struct xe_ggtt *ggtt)
>  }
>  
>  static u64 xelpg_ggtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat,
> -						enum xe_cache_level cache)
> +				     u16 pat_index)
>  {
> -	u32 pat_index = xe_pat_get_index(xe, cache);
> -
>  	pte_pat &= ~(XELPG_GGTT_PTE_PAT_MASK);
>  
>  	if (pat_index & BIT(0))
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> index 7e55fac1a8a9..7981075bb228 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -31,7 +31,7 @@ struct xe_ggtt {
>  
>  	struct {
>  		u64 (*pte_encode)(struct xe_device *xe, u64 pte_pat,
> -						enum xe_cache_level cache);
> +				  u16 pat_index);
>  	} pat_encode;
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index ebae0117f577..9d201bdb9f25 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -25,6 +25,7 @@
>  #include "xe_lrc.h"
>  #include "xe_map.h"
>  #include "xe_mocs.h"
> +#include "xe_pat.h"
>  #include "xe_pt.h"
>  #include "xe_res_cursor.h"
>  #include "xe_sched_job.h"
> @@ -162,6 +163,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
>  	u32 map_ofs, level, i;
>  	struct xe_bo *bo, *batch = tile->mem.kernel_bb_pool->bo;
> +	u16 pat_index = xe_pat_get_index(xe, XE_CACHE_WB);
>  	u64 entry;
>  	int ret;
>  
> @@ -196,7 +198,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  
>  	/* Map the entire BO in our level 0 pt */
>  	for (i = 0, level = 0; i < num_entries; level++) {
> -		entry = xe_pte_encode(vm, bo, i * XE_PAGE_SIZE, XE_CACHE_WB, 0);
> +		entry = xe_pte_encode(vm, bo, i * XE_PAGE_SIZE, pat_index, 0);
>  
>  		xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64, entry);
>  
> @@ -214,7 +216,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  		for (i = 0; i < batch->size;
>  		     i += vm->flags & XE_VM_FLAG_64K ? XE_64K_PAGE_SIZE :
>  		     XE_PAGE_SIZE) {
> -			entry = xe_pte_encode(vm, batch, i, XE_CACHE_WB, 0);
> +			entry = xe_pte_encode(vm, batch, i, pat_index, 0);
>  
>  			xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64,
>  				  entry);
> @@ -259,7 +261,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
>  
>  		flags = XE_PPGTT_PTE_DM;
> -		flags = __xe_pte_encode(flags, XE_CACHE_WB, vm, NULL, level);
> +		flags = __xe_pte_encode(flags, pat_index, vm, NULL, level);
>  
>  		/*
>  		 * Use 1GB pages, it shouldn't matter the physical amount of
> @@ -454,6 +456,7 @@ static void emit_pte(struct xe_migrate *m,
>  		     struct xe_res_cursor *cur,
>  		     u32 size, struct xe_bo *bo)
>  {
> +	u16 pat_index = xe_pat_get_index(m->tile->xe, XE_CACHE_WB);
>  	u32 ptes;
>  	u64 ofs = at_pt * XE_PAGE_SIZE;
>  	u64 cur_ofs;
> @@ -494,7 +497,7 @@ static void emit_pte(struct xe_migrate *m,
>  				addr += vram_region_gpu_offset(bo->ttm.resource);
>  				addr |= XE_PPGTT_PTE_DM;
>  			}
> -			addr = __xe_pte_encode(addr, XE_CACHE_WB, m->q->vm, NULL, 0);
> +			addr = __xe_pte_encode(addr, pat_index, m->q->vm, NULL, 0);
>  			bb->cs[bb->len++] = lower_32_bits(addr);
>  			bb->cs[bb->len++] = upper_32_bits(addr);
>  
> @@ -1254,7 +1257,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  
>  			xe_tile_assert(tile, pt_bo->size == SZ_4K);
>  
> -			addr = xe_pte_encode(vm, pt_bo, 0, XE_CACHE_WB, 0);
> +			addr = xe_pte_encode(vm, pt_bo, 0, xe_pat_get_index(xe, XE_CACHE_WB), 0);
>  			bb->cs[bb->len++] = lower_32_bits(addr);
>  			bb->cs[bb->len++] = upper_32_bits(addr);
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index ddb4d9c33181..5686ed9be175 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -11,6 +11,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_migrate.h"
> +#include "xe_pat.h"
>  #include "xe_pt_types.h"
>  #include "xe_pt_walk.h"
>  #include "xe_res_cursor.h"
> @@ -68,7 +69,7 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset)
>  	return pde;
>  }
>  
> -u64 __xe_pte_encode(u64 pte, enum xe_cache_level cache,
> +u64 __xe_pte_encode(u64 pte, u16 pat_index,
>  		    struct xe_vm *vm, struct xe_vma *vma, u32 pt_level)
>  {
>  	struct xe_device *xe = vm->xe;
> @@ -86,7 +87,7 @@ u64 __xe_pte_encode(u64 pte, enum xe_cache_level cache,
>  	else if (pt_level == 2)
>  		pte |= XE_PDPE_PS_1G;
>  
> -	pte = vm->pat_encode.pte_encode(xe, pte, cache);
> +	pte = vm->pat_encode.pte_encode(xe, pte, pat_index);
>  
>  	/* XXX: Does hw support 1 GiB pages? */
>  	XE_WARN_ON(pt_level > 2);
> @@ -104,7 +105,7 @@ u64 __xe_pte_encode(u64 pte, enum xe_cache_level cache,
>   *
>   * Return: An encoded page-table entry. No errors.
>   */
> -u64 xe_pte_encode(struct xe_vm *vm, struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
> +u64 xe_pte_encode(struct xe_vm *vm, struct xe_bo *bo, u64 offset, u16 pat_index,
>  		  u32 pt_level)
>  {
>  	u64 pte;
> @@ -113,7 +114,7 @@ u64 xe_pte_encode(struct xe_vm *vm, struct xe_bo *bo, u64 offset, enum xe_cache_
>  	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
>  		pte |= XE_PPGTT_PTE_DM;
>  
> -	return __xe_pte_encode(pte, cache, vm, NULL, pt_level);
> +	return __xe_pte_encode(pte, pat_index, vm, NULL, pt_level);
>  }
>  
>  static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
> @@ -126,7 +127,7 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>  
>  	if (level == 0) {
>  		u64 empty = xe_pte_encode(vm, vm->scratch_bo[id], 0,
> -					  XE_CACHE_WB, 0);
> +					  xe_pat_get_index(vm->xe, XE_CACHE_WB), 0);
>  
>  		return empty;
>  	} else {
> @@ -597,7 +598,9 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  
>  		pte = __xe_pte_encode(is_null ? 0 :
>  				      xe_res_dma(curs) + xe_walk->dma_offset,
> -				      xe_walk->cache, xe_walk->vm, xe_walk->vma, level);
> +				      xe_pat_get_index(tile_to_xe(xe_walk->tile),
> +						       xe_walk->cache),
> +				      xe_walk->vm, xe_walk->vma, level);
>  		pte |= xe_walk->default_pte;
>  
>  		/*
> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> index 0e66436d707d..6d10823fca9b 100644
> --- a/drivers/gpu/drm/xe/xe_pt.h
> +++ b/drivers/gpu/drm/xe/xe_pt.h
> @@ -47,9 +47,9 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
>  
>  u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset);
>  
> -u64 xe_pte_encode(struct xe_vm *vm, struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
> +u64 xe_pte_encode(struct xe_vm *vm, struct xe_bo *bo, u64 offset, u16 pat_index,
>  		  u32 pt_level);
> -u64 __xe_pte_encode(u64 pte, enum xe_cache_level cache,
> +u64 __xe_pte_encode(u64 pte, u16 pat_index,
>  		    struct xe_vm *vm, struct xe_vma *vma, u32 pt_level);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index c53d5c1580df..28e6429488ee 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1196,10 +1196,8 @@ static void xe_vma_op_work_func(struct work_struct *w);
>  static void vm_destroy_work_func(struct work_struct *w);
>  
>  static u64 xe2_ppgtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat,
> -						enum xe_cache_level cache)
> +				    u16 pat_index)
>  {
> -	u32 pat_index = xe_pat_get_index(xe, cache);
> -
>  	if (pat_index & BIT(0))
>  		pte_pat |= BIT(3);
>  
> @@ -1217,10 +1215,8 @@ static u64 xe2_ppgtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat,
>  }
>  
>  static u64 xelp_ppgtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat,
> -						enum xe_cache_level cache)
> +				     u16 pat_index)
>  {
> -	u32 pat_index = xe_pat_get_index(xe, cache);
> -
>  	if (pat_index & BIT(0))
>  		pte_pat |= BIT(3);
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index c4d866840d6a..685c2179e533 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -340,8 +340,7 @@ struct xe_vm {
>  	struct xe_file *xef;
>  
>  	struct {
> -		u64 (*pte_encode)(struct xe_device *xe, u64 pte_pat,
> -				  enum xe_cache_level cache);
> +		u64 (*pte_encode)(struct xe_device *xe, u64 pte_pat, u16 pat_index);
>  	} pat_encode;
>  };
>  
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
