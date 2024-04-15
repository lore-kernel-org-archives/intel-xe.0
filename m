Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D03C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 19:44:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F71310E3EA;
	Mon, 15 Apr 2024 19:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ji1m9Cj6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F8D10E3EA
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 19:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713210271; x=1744746271;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YPZrfYsLGIg4HwoNUGbrevQuCsAYmOnHpT+kCaY36aA=;
 b=ji1m9Cj6JYJLJl77wkvDa/RLUa38IHLjRZxFwhxjcz0RvB0uxV3P6B3Q
 kC0tVefvbDgfemGjzCiEvPSXxrWB1VvVQZ4g+oPz17pIioJXxLPG1qI2f
 HpdQAh1ShL3l2Wl9NY0bXTO1VvRfki+NVNDDtOJhNgHpX0sZJWkmhivDk
 3NH/K2gzAdP6ip9OKNUETnQzzXLkxD5SKNMdkPl7K4VecqZJU1knTCbRc
 QgG3vZ593E3oKljmz5e/KR+OjCVbM8DuvMbNl7taXqLcUS/TwHaQBPCMl
 rso2M2y5a9O70LDiwpEmzDT0uK33f+lsHjc9Ynk1ssSVBaG2OlFZ6Xq0N w==;
X-CSE-ConnectionGUID: JuS+kE4cTZSaJ7vJB99zWg==
X-CSE-MsgGUID: V2tcIoNHSE6e9HWnqKwmQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8741773"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8741773"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 12:44:31 -0700
X-CSE-ConnectionGUID: GSG9UM0gRhSupAoG9EdgEQ==
X-CSE-MsgGUID: Lbg8eKBYTtezRPXWrCPLvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22100681"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Apr 2024 12:44:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 12:44:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 12:44:29 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 12:44:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Klyy8Qqf96JX2oGQQ+ww2fSFUGyY8PQPAGJyJhBCEsDfuiAmUj8zL1+OKk3x/ghfTagRys/nc8HV5r3lOSEIkGnGDGlcuYQeZF34OEp4KDKdQJ/V4uCCb97Id5/jrMN4bsSSRYjw8USxdQEyShFrXZgQBy5/5mnTmhQDrtsTojhHEcyUkSfn3CUYVINFp/FIG/MDwYPhXJdr09fbe9lutlBGfi3iB8FEmqPj3vazMVN/3hVjQn8WcRuxPnSz/Y7vfafVhd23JDqPmXtD4xq0mq6oPnCEMVlAkKtt6ifYeDVzCeb2aBmjDo2IZ7N3aPPWlycTuokskxcPPWV+6iF6+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voG2oDAM/vdqLmtr9GeleMKZG0eKtnvhb7mrj8xEbRc=;
 b=Rle8dP+JZj8/JWIO7rAh12WEI4WAmxp1wbO94Hm8OZz66aTxjSvE4XfcbqWI/uqMn4XaaAwb3hrn1rc3cpF+kvwHFjDgLjYU+Qr9OdKs2AxGn6j1FzpYQZsInRIeNfdhS6vzSUgU8NH48lepICmUpTFQ1PD61zgQP6MkypS6NwSsSUEq0NMxsoogeZc/VSFNI4Gy0KXnCY011Wue6GmLv+XyGPHYAX+EVUhVhu7u9EJopXRiCRH3BGUXuam6TUxN0D+Cks30DibUw4bw/8fdzeOJjErQFVMIz+gPCRJRj4jixce9zPXkiaXe4IE+60GkN1eF3IKr6oy7tsNylwTKXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8328.namprd11.prod.outlook.com (2603:10b6:806:376::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Mon, 15 Apr
 2024 19:44:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7472.027; Mon, 15 Apr 2024
 19:44:25 +0000
Date: Mon, 15 Apr 2024 19:44:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, "Gupta, saurabhg"
 <saurabhg.gupta@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>
Subject: Re: [PATCH v5 1/4] drm/xe/lrc: Add xe lrc ring tail function
 definitions
Message-ID: <Zh2Dlx9hhQTTcuD9@DUT025-TGLU.fm.intel.com>
References: <20240415184608.2918959-1-jonathan.cavitt@intel.com>
 <dde80e98a80b9fcfbd46c9dab4ef9bc27bc108f1.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dde80e98a80b9fcfbd46c9dab4ef9bc27bc108f1.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0365.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: abeaf970-7a8c-49ad-a37b-08dc5d8474b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lr2MRL8RUerRPc9YkiTvwz1Lyp2J+RaLsskNIE9Hhql0+hhfV7gYe0U+ouoJ0VADtuS77MoV/MTK+5JYzUVX85zx5Uxkr9bjheH8/SVHuvAU3yyNCRGd5c0a28ZTEBjwMN8hb8fzXz1mdG/sLTP7kbZp100wh0CgfrmSBd+cO86Z2GFV3+GwYCZXAUuRLV2ddlxwomO1egfTd/L249rUm8QMaZyedC6TvMRJIp7mQK9sInZPQ16+m4dSJnlaUUss519GngClk0/DHvQL7/AopwXaUSDqUX7GXYApsyQInFPcQ1+MWLgixko3To0TNynRcqIgbHVeuAT8lKQMKnXOCsgO7iFrphlQxQCTAII0zh9ozdyOy063nTx5brvdfo1QdA/+Z/FBouTCeHdOR2Q4VdU4+HAK0wQrEu8IMsk2RvPTRfFAzaoFwMvGBtTer+PykdNH6mXo00OwHhLHzCVPk7Zp8vZRw2rLCgKAiyfv3BhfFpnMW2Dfyp+1AFb0zndKgjp7NR+t3DAoRny3ZLKh8Omcb+lE4Zg4nCXnHm/+zydqG2VAmh+m4Ud3Mx8tEQRYTs4wHe7tMtxjdEde7+uUzH1NCmK2a+B3IDZkCWGgIMjYlImbdP6QJDmNjN4ytig73cFojpk5SGW0DFL8vmLGg3nE8Ru1aObq2mugKWlJYfw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vo1c6Hu2HwY7ro7WFY8IOu9NuSrdgW17dfinSH5ekctCPkgnZJymLsM4WK?=
 =?iso-8859-1?Q?hR8ezH+9jemUmvCMoGE7tfM3gyMNqcQJBWBFrBCJgqeMsYKmehJHazf6rN?=
 =?iso-8859-1?Q?dDJr7Xgkwv3Kcx8STyxnGveHvh1XjAJ2baeD3BBX2UHQXXWo25ediQKV/8?=
 =?iso-8859-1?Q?UJKt0H0GDVFxPlHrkbLpbC55TdZTe+Aq/bRgy5cFb6grOQJ9S0Sz2UT7i4?=
 =?iso-8859-1?Q?Ky2TVqcYgLTq75m9fwFmJ9W6Y3YtwOegzWAvT/yd/+8GaJe7A6rZkIY56F?=
 =?iso-8859-1?Q?OPce2KlPQ29Bj8zZBgPYz4t6p3mgpGMI0uTXAJhg5WgX7WPV7Sup6CXW4R?=
 =?iso-8859-1?Q?YcwjrlKFwxWIcI1OW8PLO3VyWSUb9+paGObfEn411Zv76g7PT99WJ8mIWC?=
 =?iso-8859-1?Q?vZF0BX6SrYdtbKVOVirqfmgC/CyEvGKpp6nP/VzSis/1QbJ8Td5sYWX8Qo?=
 =?iso-8859-1?Q?gaHcEQWvvDL+AYy7S3HtfDl69PO43vYKDWs5oWebvM3soqa0JmpKhZKoXt?=
 =?iso-8859-1?Q?/OKf9mkKihwaWfnUeaYIWWBID+9ASJDzUG6/TK1a4u0pD57hCheIOfhXnE?=
 =?iso-8859-1?Q?fy+MDt2evKAnyP9ZMCT4nRcVpTySoaODJJjvezkF9Kz+uhh1Y2sqOcBxfJ?=
 =?iso-8859-1?Q?fcKNIdud8kYRvk3MgicFoKvYZfkY+ASiq00RY7UmWHsyy4p4m6dCE5QodQ?=
 =?iso-8859-1?Q?UvTPb/OqQ4GBcYYpn+mroBkOxlw5OTQUnhgmpV3+JiiZRjNA2VGXbW9/tq?=
 =?iso-8859-1?Q?87B29HGuBxmWuKkqyh8MvwPD6c07oA3TvQLIjYeQm8eUGk8m5Tzb+qQ0ZT?=
 =?iso-8859-1?Q?IeyYSFzBEcNcWf6tE+iPBCLUwEIpw90BthCe2qipmim883fdulL5zTmVPy?=
 =?iso-8859-1?Q?OqbU85CHEYZrHabFcTggj0WWDTikwsUbfo5ucRCDzmA00wAokRdFE1SI5W?=
 =?iso-8859-1?Q?IDotrzUnH65hv/lK/IODzmhOQmD0oF1Ko/DCrjqNpofYmYoH1qxeVsZDeL?=
 =?iso-8859-1?Q?zcSVpqxX0NxqGo22HXerN06Ijnw3V2u0GWJajHXWH+pimzRi/gMVGm5Sy8?=
 =?iso-8859-1?Q?8GTnIeMNtE2bLpcQGPxKE5jL/A5fN8tKJn74y8kvPTwziJV/5HLaiJxQ2O?=
 =?iso-8859-1?Q?JtwUpPmPcenRL2zlhWzGFOVqcBjxXEwWjtYGJ89hUEZ4VEkVUOeKexqkG2?=
 =?iso-8859-1?Q?nbtF2b1j+QCfG3SgF/BBDtx86VnhPT//MnQzGpu7gF5kYTCiXPprYs54Am?=
 =?iso-8859-1?Q?8hYtiAjoj8TF+FE4Zd5Tt52M8SrGFes1nIFO1f7xrBW6oaSU8HNqpvxaV5?=
 =?iso-8859-1?Q?AG1f+03WayQSGIHQxK3vXfYq6rbcNpT0Ayk16FjdhnZciYcy+zXQ8aUKA6?=
 =?iso-8859-1?Q?1FfoHctzbGawI6n9vUWxefJ88vdBy/iTboIyma60aYEm88cr5iCDXwL3n+?=
 =?iso-8859-1?Q?bQTFOZQZj0Pq4BJG54yrU+/eqKjAQgx0vHBJdXxnkT7C/WWdt6+vfW0hth?=
 =?iso-8859-1?Q?uOoOUNh5SPSZ0Gd0JJ6N6EHuJJjQaxzvCzH6vr0p9CutDsKllxgCUf8Nfv?=
 =?iso-8859-1?Q?Uvrorlxhwntcthcb6J7i//YqgQYjiyTL8TxNchyMNBmfRQ/7okqw2VYOdt?=
 =?iso-8859-1?Q?Ov75tVjZbDrio55eDtRnkJpkKcD1LsOrpvkcii69pLCixhweY/1zJ4hg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: abeaf970-7a8c-49ad-a37b-08dc5d8474b0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 19:44:25.5873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n4xTjkZnzA0Sx+Z+tQfiJy4Srmq2R2XC0nzeeTm/VzRvYDX6m1+LF/5RnKxuoM54DBp+E53BR31/WJ1Xh5CBEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8328
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

On Mon, Apr 15, 2024 at 01:31:32PM -0600, Summers, Stuart wrote:
> On Mon, 2024-04-15 at 11:46 -0700, Jonathan Cavitt wrote:
> > Add defintions for the functions xe_lrc_set_ring_tail and
> > xe_lrc_ring_tail to match the definitions for xe_lrc_set_ring_head
> > and
> > xe_lrc_ring_head, respectively, except tarting the lrc tail.
> > 
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > CC: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > CC: Brian Welty <brian.welty@intel.com>
> > CC: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_lrc.c | 10 ++++++++++
> >  drivers/gpu/drm/xe/xe_lrc.h |  2 ++
> >  2 files changed, 12 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c
> > b/drivers/gpu/drm/xe/xe_lrc.c
> > index 615bbc372ac62..e91ecbcceba5c 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -834,6 +834,16 @@ void xe_lrc_finish(struct xe_lrc *lrc)
> >         xe_bo_put(lrc->bo);
> >  }
> >  
> > +void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail)
> > +{
> > +       xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, tail);
> > +}
> > +
> > +u32 xe_lrc_ring_tail(struct xe_lrc *lrc)
> > +{
> > +       return xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL) & TAIL_ADDR;
> > +}
> > +
> >  void xe_lrc_set_ring_head(struct xe_lrc *lrc, u32 head)
> >  {
> 
> I see lower in xe_lrc.c we're doing this (xe_lrc_snapshot_capture):
> snapshot->tail.memory = xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL);
> 
> Should we change this call to use the new wrapper also?
> 

Yea. Also xe_guc_submit.c sets the LRC tail. It should be updated to use
the helper too.

Matt

> Thanks,
> Stuart
> 
> >         xe_lrc_write_ctx_reg(lrc, CTX_RING_HEAD, head);
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.h
> > b/drivers/gpu/drm/xe/xe_lrc.h
> > index d32fa31faa2cf..f355b0eeb5658 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > @@ -24,6 +24,8 @@ void xe_lrc_finish(struct xe_lrc *lrc);
> >  size_t xe_lrc_size(struct xe_device *xe, enum xe_engine_class
> > class);
> >  u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
> >  
> > +void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail);
> > +u32 xe_lrc_ring_tail(struct xe_lrc *lrc);
> >  void xe_lrc_set_ring_head(struct xe_lrc *lrc, u32 head);
> >  u32 xe_lrc_ring_head(struct xe_lrc *lrc);
> >  u32 xe_lrc_ring_space(struct xe_lrc *lrc);
> 
