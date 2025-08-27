Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87D9CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 20:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F44910E17D;
	Wed, 27 Aug 2025 20:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nj5XRQym";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B01E10E17D
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 20:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756325842; x=1787861842;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=V7RA4H3fRNrqDiMdo7dEs9m0YWrMwEDBwKbPaGUEZV0=;
 b=nj5XRQymokCzkvijhrJlbNgl5a1RtkbnQ36gkmT2IIluMaxOkO0FA0rm
 JHGaKn504x38+XxzCaK1Ot2hsa6sWrnsVpmj7Fc3ysTMMjeNMFPsmXO9n
 Yxyg0kwH5jq3+sOFRFTTVu34XvYpuiGz/LVF0vMNiXZ7XoG1lOagBCgwZ
 ebTSi8ZJtsbiwi4Pe8QNh6eAhSbEwt3geKzIow18QN0eSivuzWTvMKn9K
 i4KiLKVhwMOIRkj98drTiuESxJV+pD/DR0UOfK4IJpSoAslzas48pj2vS
 3LlAsIDgypsvIcWfMEuXRXFToGG0IsLWidUlwD3WdlBuFq8SbM2HS8d27 g==;
X-CSE-ConnectionGUID: uzX7sFowSGG5rgy35R3Y4Q==
X-CSE-MsgGUID: EX6FJtOgS0eT/f8edMy6iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="62407983"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="62407983"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 13:17:22 -0700
X-CSE-ConnectionGUID: GCzyYK6LT9SpvuvrAMXTrQ==
X-CSE-MsgGUID: 9Jlqb1kvS86quC8iQ/y/bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="193578786"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 13:17:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 13:17:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 13:17:21 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.58)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 13:17:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlpJKVB7g9lANlIKn9s8myYC4J+HukAho5qhosADfTAdkuSZWK5MY7IDX7sH0R5aFcN4wQKbnvkucz4smduL+qzo1zUTdNDVbBs779U5QvTRKEHtkWip0AYK8aEO2FzoBFoQEefRd4UAH4fj6mLHb97w6GvEODZVGKL6L68lj6SrX0Ug5goF4k5VMmMjmGpF31h3JsQpUrzbZKkET0I2+uout55yUSUVAHbAg3aEFRleox0CkEs1uG/v4djCEIPchh1WEZReotsX6thgLl5dOGRlAID1P5fkCD7qp3FdLEqIclaSTNVa/7fS0zUzbXVGkARVmLVglRCWLetgd66oqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJ14ZKXIashOtV2JI94BaZhXvDwaGhryRCe/7NU47dc=;
 b=VJbl16+GmUxnQWpmMgvrcij6QanBtpbRXbNdVCVMSxu8DWtc28JiG1cQf+dSNcz7UWJgMUqTrBX7OcRKotzFwPfM+3lcX9qoeVuQRXFEY8z8SOyIDGbRViSf1Q8opAljC9ptTt3U2oOk12nZLpArz6N+mx2ZogYLP+szzEOtUGHfpA4wM49aRVye8jiFbVjIlmUggt7KjCDYAVU9kuYNj7dWbrKZS3wSR4dDWHRibWbO8k7EDupdT1tMrGee9JsmgEmIbfmRgQJ2XdQzCazGB6Q2BMeBP9/EdCsFDdDiefUT10eqsLs+UBSlqJOKxsGa4M3GnAlwo7mQkDJg+7UpKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA1PR11MB6845.namprd11.prod.outlook.com (2603:10b6:806:29f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 20:17:13 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 20:17:13 +0000
Date: Wed, 27 Aug 2025 13:17:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/2] drm/xe: Add more SVM GT stats
Message-ID: <aK9nxX0rYz4gkCcR@lstrano-desk.jf.intel.com>
References: <20250827184352.175550-1-matthew.brost@intel.com>
 <20250827184352.175550-3-matthew.brost@intel.com>
 <eb17d7cc-bc60-4eac-86c0-ae6df3976db3@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <eb17d7cc-bc60-4eac-86c0-ae6df3976db3@intel.com>
X-ClientProxiedBy: SJ0PR13CA0146.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::31) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA1PR11MB6845:EE_
X-MS-Office365-Filtering-Correlation-Id: 236b662d-f063-4f4e-fab5-08dde5a6b5b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wDUlCqkOWlu9cVyq6sFzj4NXtIX6Tbi+iNIHPq+Ik2VKURBGYM7w+4pINfz1?=
 =?us-ascii?Q?D4A5jz3V2tYx4sQ5HlFrydzj3QkEPvE/tvJcPnuzPsqR6rd2HaAKZpluCABs?=
 =?us-ascii?Q?GEUA2oJchSzGKn3vZD3Ilzrs/8UDiB+dcR1Z+8+/OjupmVS493p28p9wSUNt?=
 =?us-ascii?Q?NXJam1OVIcO4Rbiz29lfg//SbBOecPaJwVcTS1iJuDDm288CPBv8oYnA6ie+?=
 =?us-ascii?Q?0Obuv3fVSvHprXPo4HBEIoiznp/Plekk+oYcxg7ghukDuiAHzDijC+Mwppye?=
 =?us-ascii?Q?EhQEfOfbd3b1WSlOCuAtqo7J44M363WiTPwvOyK8saxWlWVuj4g/rol8k1F/?=
 =?us-ascii?Q?3nYZmjfmWovhtxUPlNmy4S5T0cIRFtbE1kve28Tkjin1LNi6s0RfwvdQD1z1?=
 =?us-ascii?Q?9mjUdbHmTGZVH7wzKG0vgqoPH+Pw1D+cb3WqxT0G//Hv8t6DwH3uBMx7PUMs?=
 =?us-ascii?Q?Yq6AJ9nR0ybGCOWlxljjfOYkZS6huYYLk2JbsJsML5nDgRlkrimACK5o6gE7?=
 =?us-ascii?Q?Dh8364aeCi0NIxo0/UDAgn5qMY4gdXUz5EgzobIUVB+2XKA62c/LPgkhPb8r?=
 =?us-ascii?Q?bdThCrw8dWt9S4UmHrbpnSJucnOdTZkjpGDOyHsK3YY6LYFWSibgL0QpcKr1?=
 =?us-ascii?Q?TG4v5TGLpgycUIK6pp8NUTPl2y33FxnpGop8rkioRHrt79grzIKHz0qcHGYV?=
 =?us-ascii?Q?imN70cVhogNdyqqu6kUmS0LYtl5mTnxArdkKhdbzGEW2gXJwhG/wfdGW2o0r?=
 =?us-ascii?Q?QpTIKvo0m3os1cQWSy5bta7m5scFJ0hCh1/jC2gkXu6zBs1PsovK/rixC2FR?=
 =?us-ascii?Q?oyAbVa64zsdsIU7p9Gf8QziwPfRB6nrtGAk86nhjFa7Blxzgcp+jgGbYvXfe?=
 =?us-ascii?Q?FaWcg3JHxCSL62X/Ih9aJeo8ceDG1BOx0e5o7oAEJWuVcF0uRDCtKHChMfyc?=
 =?us-ascii?Q?EMk++6JqLuE+7ep9SRpUUgnfwWEf0538uVdbdmXgqjfmV2g6+G5nN2kX9zC+?=
 =?us-ascii?Q?eADHtlcNZOdxt40+iF6H3v7BLxXySi+92narQWCfcITeY7uenYUXv5YuCch5?=
 =?us-ascii?Q?82h+N+1eOIhNFaICgfEi3BgPYLAxJyRhBPPFQhOIiSpNg3WHxU8ZLWSjtKRK?=
 =?us-ascii?Q?Yi/jTfQhrUqTWZcALEa4VKzQDQBEjuRZ1oZG9UKElN2TfRaQNTnbcw/wytcs?=
 =?us-ascii?Q?texxpsE8LEc5ETM0KFMsCAPbrubBoJoeSvWepYgKYWkll64DdCms0C6Iz+/H?=
 =?us-ascii?Q?gyDw68iKNmNDSASpa9jwsP9mqZOHMBOPgsqxdogXFltmETJXAG7Lc0wBwwIs?=
 =?us-ascii?Q?deBTRYd3Q1q99cjMMXlp8HXunGACCDj3c6j60MSRzAFEi97GLsnzYOA4uK5R?=
 =?us-ascii?Q?Z6tNhuTVARsbPiDEYA+lgrwx+hGYO4yVLZVt5bJWTkaGUPTn2oKOkXePkLIC?=
 =?us-ascii?Q?YmfDgIhRq6s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CrbGJUlmbQl/hTwqEv79xmf7E2EJ24wO78xWY87VvpbWumWlqLbe24gMdOos?=
 =?us-ascii?Q?cUWjH1QLWzFR65vHonPORPQ9pFq+faIM0JcOdbZ+HFYFhEK4zTmOq4CA7LDR?=
 =?us-ascii?Q?jUExFVFVn4x88P4CnpKQtHAhRNVeSkDT7qK78sabo1mhZF6ZchBQ5xE2tsc6?=
 =?us-ascii?Q?wPjly2hR6tsLHuJhL9DUaQ+fIazDCsqODsQLO9a0pSkRW2RsqSIpddNz7I3Y?=
 =?us-ascii?Q?/ncJXF36iDzc23b9Au6IAvIbQrFdP7jgiPvbvDjUUSYjKvSRUr510BaP0QjN?=
 =?us-ascii?Q?fdCwl7gcAjxWSiRFbh966EyhmChTDID9shcOQXDs/xa4Dnaj4eONlZcdoJod?=
 =?us-ascii?Q?T+ZKyPwYuZA9HemI1t1NzEpNIkO3Zj1xhvH3iw8jWbedCZXr/GNpwqF2dWVm?=
 =?us-ascii?Q?3E0jnqgA31LRcJi2v4GetsXK2KZO6ciO3TOHsixZkOrAq34nmLLmQ65GMhbN?=
 =?us-ascii?Q?MC5LffB9OBXKHrbBWlhki/IM+I5znMmVLcsmfVB9srKcIP5TGHUk0y4JRBJE?=
 =?us-ascii?Q?gV6OB7xb2vuvmZLD3olH/L5A/F+FYyJvg6XAQfN4ZlW0dvkm9yEQtQi7aWC/?=
 =?us-ascii?Q?V5JZOpKyrg+dN26iqVdFbNhdUHz74H8uWx8tf9FK6hCCBVPv1Xy4rgSwXz1J?=
 =?us-ascii?Q?ZXMJYe2DBeKmHcWjPXVQEsNSPQ74bAa9PEJBy1Zl55J0ICiP8aRAeEDwJGcD?=
 =?us-ascii?Q?tc9Actcfmv9KcvZkQzdplwdDx9hplLs9EtgE/yOCughPaoOGsCjxrdFwBOq5?=
 =?us-ascii?Q?OAGSTxIdLBzRfT5qO7FOssrhrsSSxKeAr7PbfiKmVagxv0rkz+dwEHnDlAGa?=
 =?us-ascii?Q?71K6q5qFRZDzlPGXZ4ssRrILnCK2ds24Mh0MpmtasNMxfimJi+BDFbCoRMd8?=
 =?us-ascii?Q?+lXqOvw19cR/jEd5n1Pffcp8I0BAb1WyisBhk0nN/2zMjCNxEqwt72UPqEWK?=
 =?us-ascii?Q?lmCh4C2NXVgS9OVRX+9psYrmqpY/A0+0p38lpTQ7G9R+6TCXp6zvBr6AOUpd?=
 =?us-ascii?Q?eJVU4k9/VwhgpI9CA0CMIvSICXSFO4RqiNaQpooI/chxQuDdLkNHu3gQj5tz?=
 =?us-ascii?Q?Y4oxfKvKHpUoDSQPlpUX49Pyv3qRsZwsr5jD5aU3Sx1BYPBRI5pLLL71yDAA?=
 =?us-ascii?Q?L/+gfrpjpJ9mviIQ9IZghZOcYZtB9ZGgYi77N0vMFI5ZKdCo+mlTPIqZHHk9?=
 =?us-ascii?Q?KPNPUL3sb4/E5lWsSFwSgIIokZ/0rOUHT6/y5s+LDX+jcXya5Ya9g4OSftwg?=
 =?us-ascii?Q?2+koDfVpq8HWQIKo9p1VSM+Hf8vg3EES47n6HSvm+lj+Ao2MN2+waMkI0XvC?=
 =?us-ascii?Q?0BBIPomx3nccrn+n0OL9140R95GkEJLUzpmND+SiAXK7dl6npbqRGTm7yPOS?=
 =?us-ascii?Q?29zDqxO+Rj/ViaGuyes5SMa/ik/iw20quroCCWZIe/GTubL7Q1QLrrcNjlCF?=
 =?us-ascii?Q?P5lCGHBUdt78YEQ3xaaYnNpe5QLeZHnrPM4R1mKWgxH+rPNRrvA1Hd3ZzM/x?=
 =?us-ascii?Q?KewRAQrb8+DYOxvz5+zNZ1yWlCX+Z7HuhawpB4X5hdvgQJi8eOikHu5/+xBP?=
 =?us-ascii?Q?+Mmfob+scyiJe18w5LO+zfXsLz3QHbeTpg2m6Hj8ZlhFjPcnqykuGUKtyOrG?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 236b662d-f063-4f4e-fab5-08dde5a6b5b8
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 20:17:13.4559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tp1/JFXXJVgl8Moi8rUMUgJ8I1tvGvymS2lr+C4uCgLLAi9zROjoonHlKUkqh8z1NNDdQJy5Ook+CQ3ffD03oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6845
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

On Wed, Aug 27, 2025 at 09:15:46PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 8/27/2025 8:43 PM, Matthew Brost wrote:
> > Add more SVM GT stats which give visibility to where time is spent in
> > the SVM page fault handler. Stats include number of faults at a given
> > size, total SVM page fault time, migration time in us, copy time in us,
> > copy kb, get pages time in us, and bind time in us. Will help in tuning
> > SVM for performance.
> > 
> > v2:
> >  - Include local changes
> > v3:
> >  - Add tlb invalidation + valid page fault + per size copy size stats
> > v4:
> >  - Ensure gt not NULL when incrementing SVM copy stats
> >  - Normalize stats names
> >  - Use magic macros to generate increment functions for ranges
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_stats.c       |  33 +++++
> >  drivers/gpu/drm/xe/xe_gt_stats_types.h |  33 +++++
> >  drivers/gpu/drm/xe/xe_svm.c            | 196 +++++++++++++++++++++++--
> >  3 files changed, 253 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> > index 7e12fc3759e2..2422577e4dee 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> > @@ -29,8 +29,41 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
> >  static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
> >  	"svm_pagefault_count",
> >  	"tlb_inval_count",
> > +	"svm_tlb_inval_count",
> > +	"svm_tlb_inval_us",
> 
> maybe use
> 
> 	[XE_GT_STATS_ID_SVM_TLB_INVAL_COUNT] = "svm_tlb_inval_count",
> 	[XE_GT_STATS_ID_SVM_TLB_INVAL_US] = "svm_tlb_inval_us",
> 	...
> 
> to avoid mistakes?
> 
> and I guess it would be ok to use helper macro like
> 
> #define DEF_STAT_STR(ID,name) [XE_GT_STATS_ID_ ## ID] = name
> 
> 	DEF_STAT_STR(SVM_TLB_INVAL_COUNT, "svm_tlb_inval_count"),

Sure.

> 
> or if you're brave enough go with a super-macro, like [1] ;)
> 
> [1] https://elixir.bootlin.com/linux/v6.17-rc3/C/ident/MAKE_XE_GUC_KLV_THRESHOLDS_SET
>

Probably over kill.

> 
> >  	"vma_pagefault_count",
> >  	"vma_pagefault_kb",
> > +	"svm_4K_pagefault_count",
> > +	"svm_64K_pagefault_count",
> > +	"svm_2M_pagefault_count",
> > +	"svm_4K_valid_pagefault_count",
> > +	"svm_64K_valid_pagefault_count",
> > +	"svm_2M_valid_pagefault_count",
> > +	"svm_4K_pagefault_us",
> > +	"svm_64K_pagefault_us",
> > +	"svm_2M_pagefault_us",
> > +	"svm_4K_migrate_count",
> > +	"svm_64K_migrate_count",
> > +	"svm_2M_migrate_count",
> > +	"svm_4K_migrate_us",
> > +	"svm_64K_migrate_us",
> > +	"svm_2M_migrate_us",
> > +	"svm_device_copy_us",
> > +	"svm_4K_device_copy_us",
> > +	"svm_64K_device_copy_us",
> > +	"svm_2M_device_copy_us",
> > +	"svm_cpu_copy_us",
> > +	"svm_4K_cpu_copy_us",
> > +	"svm_64K_cpu_copy_us",
> > +	"svm_2M_cpu_copy_us",
> > +	"svm_device_copy_kb",
> > +	"svm_cpu_copy_kb",
> > +	"svm_4K_get_pages_us",
> > +	"svm_64K_get_pages_us",
> > +	"svm_2M_get_pages_us",
> > +	"svm_4K_bind_us",
> > +	"svm_64K_bind_us",
> > +	"svm_2M_bind_us",
> >  };
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > index be3244d7133c..d8348a8de2e1 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > @@ -9,8 +9,41 @@
> >  enum xe_gt_stats_id {
> >  	XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT,
> >  	XE_GT_STATS_ID_TLB_INVAL,
> > +	XE_GT_STATS_ID_SVM_TLB_INVAL_COUNT,
> > +	XE_GT_STATS_ID_SVM_TLB_INVAL_US,
> >  	XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT,
> >  	XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
> > +	XE_GT_STATS_ID_SVM_4K_PAGEFAULT_COUNT,
> > +	XE_GT_STATS_ID_SVM_64K_PAGEFAULT_COUNT,
> > +	XE_GT_STATS_ID_SVM_2M_PAGEFAULT_COUNT,
> > +	XE_GT_STATS_ID_SVM_4K_VALID_PAGEFAULT_COUNT,
> > +	XE_GT_STATS_ID_SVM_64K_VALID_PAGEFAULT_COUNT,
> > +	XE_GT_STATS_ID_SVM_2M_VALID_PAGEFAULT_COUNT,
> > +	XE_GT_STATS_ID_SVM_4K_PAGEFAULT_US,
> > +	XE_GT_STATS_ID_SVM_64K_PAGEFAULT_US,
> > +	XE_GT_STATS_ID_SVM_2M_PAGEFAULT_US,
> > +	XE_GT_STATS_ID_SVM_4K_MIGRATE_COUNT,
> > +	XE_GT_STATS_ID_SVM_64K_MIGRATE_COUNT,
> > +	XE_GT_STATS_ID_SVM_2M_MIGRATE_COUNT,
> > +	XE_GT_STATS_ID_SVM_4K_MIGRATE_US,
> > +	XE_GT_STATS_ID_SVM_64K_MIGRATE_US,
> > +	XE_GT_STATS_ID_SVM_2M_MIGRATE_US,
> > +	XE_GT_STATS_ID_SVM_DEVICE_COPY_US,
> > +	XE_GT_STATS_ID_SVM_4K_DEVICE_COPY_US,
> > +	XE_GT_STATS_ID_SVM_64K_DEVICE_COPY_US,
> > +	XE_GT_STATS_ID_SVM_2M_DEVICE_COPY_US,
> > +	XE_GT_STATS_ID_SVM_CPU_COPY_US,
> > +	XE_GT_STATS_ID_SVM_4K_CPU_COPY_US,
> > +	XE_GT_STATS_ID_SVM_64K_CPU_COPY_US,
> > +	XE_GT_STATS_ID_SVM_2M_CPU_COPY_US,
> > +	XE_GT_STATS_ID_SVM_DEVICE_COPY_KB,
> > +	XE_GT_STATS_ID_SVM_CPU_COPY_KB,
> > +	XE_GT_STATS_ID_SVM_4K_GET_PAGES_US,
> > +	XE_GT_STATS_ID_SVM_64K_GET_PAGES_US,
> > +	XE_GT_STATS_ID_SVM_2M_GET_PAGES_US,
> > +	XE_GT_STATS_ID_SVM_4K_BIND_US,
> > +	XE_GT_STATS_ID_SVM_64K_BIND_US,
> > +	XE_GT_STATS_ID_SVM_2M_BIND_US,
> >  	/* must be the last entry */
> >  	__XE_GT_STATS_NUM_IDS,
> >  };
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index 0596039ef0a1..7ab63e6b77b0 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -6,6 +6,7 @@
> >  #include <drm/drm_drv.h>
> >  
> >  #include "xe_bo.h"
> > +#include "xe_exec_queue_types.h"
> >  #include "xe_gt_stats.h"
> >  #include "xe_gt_tlb_invalidation.h"
> >  #include "xe_migrate.h"
> > @@ -113,6 +114,11 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
> >  		   &vm->svm.garbage_collector.work);
> >  }
> >  
> > +static void xe_svm_tlb_inval_count_stats_incr(struct xe_gt *gt)
> > +{
> > +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_TLB_INVAL_COUNT, 1);
> > +}
> > +
> >  static u8
> >  xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
> >  				  const struct mmu_notifier_range *mmu_range,
> > @@ -145,13 +151,19 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
> >  	 */
> >  	for_each_tile(tile, xe, id)
> >  		if (xe_pt_zap_ptes_range(tile, vm, range)) {
> > -			tile_mask |= BIT(id);
> >  			/*
> >  			 * WRITE_ONCE pairs with READ_ONCE in
> >  			 * xe_vm_has_valid_gpu_mapping()
> >  			 */
> >  			WRITE_ONCE(range->tile_invalidated,
> >  				   range->tile_invalidated | BIT(id));
> > +
> > +			if (!(tile_mask & BIT(id))) {
> > +				xe_svm_tlb_inval_count_stats_incr(tile->primary_gt);
> > +				if (tile->media_gt)
> > +					xe_svm_tlb_inval_count_stats_incr(tile->media_gt);
> > +				tile_mask |= BIT(id);
> > +			}
> >  		}
> >  
> >  	return tile_mask;
> > @@ -171,6 +183,24 @@ xe_svm_range_notifier_event_end(struct xe_vm *vm, struct drm_gpusvm_range *r,
> >  						   mmu_range);
> >  }
> >  
> > +static s64 xe_svm_stats_ktime_us_delta(ktime_t start)
> > +{
> > +	return IS_ENABLED(CONFIG_DEBUG_FS) ?
> > +		ktime_us_delta(ktime_get(), start) : 0;
> > +}
> > +
> > +static void xe_svm_tlb_inval_us_stats_incr(struct xe_gt *gt, ktime_t start)
> > +{
> > +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> > +
> > +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_TLB_INVAL_US, us_delta);
> > +}
> > +
> > +static ktime_t xe_svm_stats_ktime_get(void)
> > +{
> > +	return IS_ENABLED(CONFIG_DEBUG_FS) ? ktime_get() : 0;
> > +}
> > +
> >  static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
> >  			      struct drm_gpusvm_notifier *notifier,
> >  			      const struct mmu_notifier_range *mmu_range)
> > @@ -178,8 +208,10 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
> >  	struct xe_vm *vm = gpusvm_to_vm(gpusvm);
> >  	struct xe_device *xe = vm->xe;
> >  	struct drm_gpusvm_range *r, *first;
> > +	struct xe_tile *tile;
> > +	ktime_t start = xe_svm_stats_ktime_get();
> >  	u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
> > -	u8 tile_mask = 0;
> > +	u8 tile_mask = 0, id;
> >  	long err;
> >  
> >  	xe_svm_assert_in_notifier(vm);
> > @@ -232,6 +264,13 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
> >  	r = first;
> >  	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
> >  		xe_svm_range_notifier_event_end(vm, r, mmu_range);
> > +	for_each_tile(tile, xe, id) {
> > +		if (tile_mask & BIT(id)) {
> > +			xe_svm_tlb_inval_us_stats_incr(tile->primary_gt, start);
> > +			if (tile->media_gt)
> > +				xe_svm_tlb_inval_us_stats_incr(tile->media_gt, start);
> > +		}
> > +	}
> >  }
> >  
> >  static int __xe_svm_garbage_collector(struct xe_vm *vm,
> > @@ -385,11 +424,66 @@ enum xe_svm_copy_dir {
> >  	XE_SVM_COPY_TO_SRAM,
> >  };
> >  
> > +static void xe_svm_copy_kb_stats_incr(struct xe_gt *gt,
> > +				      const enum xe_svm_copy_dir dir,
> > +				      int kb)
> > +{
> > +	if (dir == XE_SVM_COPY_TO_VRAM)
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_COPY_KB, kb);
> > +	else
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_COPY_KB, kb);
> 
> shouldn't we code this like:
> 
> 	if (dir == XE_SVM_COPY_TO_VRAM)
> 		id = XE_GT_STATS_ID_SVM_DEVICE_COPY_KB;
> 	else
> 		id = XE_GT_STATS_ID_SVM_CPU_COPY_KB;
> 
> 	xe_gt_stats_incr(gt, id, kb);
> 
> to have just one function call? or we rely on the compiler to optimize that?
> 

I don't think this matters.

Matt

> > +}
> > +
> > +static void xe_svm_copy_us_stats_incr(struct xe_gt *gt,
> > +				      const enum xe_svm_copy_dir dir,
> > +				      unsigned long npages,
> > +				      ktime_t start)
> > +{
> > +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> > +
> > +	if (dir == XE_SVM_COPY_TO_VRAM) {
> > +		switch (npages) {
> > +		case 1:
> > +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_DEVICE_COPY_US,
> > +					 us_delta);
> > +			break;
> > +		case 16:
> > +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_DEVICE_COPY_US,
> > +					 us_delta);
> > +			break;
> > +		case 512:
> > +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_DEVICE_COPY_US,
> > +					 us_delta);
> > +			break;
> > +		}
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_COPY_US,
> > +				 us_delta);
> > +	} else {
> > +		switch (npages) {
> > +		case 1:
> > +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_CPU_COPY_US,
> > +					 us_delta);
> > +			break;
> > +		case 16:
> > +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_CPU_COPY_US,
> > +					 us_delta);
> > +			break;
> > +		case 512:
> > +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_CPU_COPY_US,
> > +					 us_delta);
> > +			break;
> > +		}
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_COPY_US,
> > +				 us_delta);
> > +	}
> > +}
> > +
> >  static int xe_svm_copy(struct page **pages,
> >  		       struct drm_pagemap_addr *pagemap_addr,
> >  		       unsigned long npages, const enum xe_svm_copy_dir dir)
> >  {
> >  	struct xe_vram_region *vr = NULL;
> > +	struct xe_gt *gt = NULL;
> >  	struct xe_device *xe;
> >  	struct dma_fence *fence = NULL;
> >  	unsigned long i;
> > @@ -397,6 +491,7 @@ static int xe_svm_copy(struct page **pages,
> >  	u64 vram_addr = XE_VRAM_ADDR_INVALID;
> >  	int err = 0, pos = 0;
> >  	bool sram = dir == XE_SVM_COPY_TO_SRAM;
> > +	ktime_t start = xe_svm_stats_ktime_get();
> >  
> >  	/*
> >  	 * This flow is complex: it locates physically contiguous device pages,
> > @@ -423,6 +518,7 @@ static int xe_svm_copy(struct page **pages,
> >  
> >  		if (!vr && spage) {
> >  			vr = page_to_vr(spage);
> > +			gt = xe_migrate_exec_queue(vr->migrate)->gt;
> >  			xe = vr->xe;
> >  		}
> >  		XE_WARN_ON(spage && page_to_vr(spage) != vr);
> > @@ -462,6 +558,9 @@ static int xe_svm_copy(struct page **pages,
> >  			int incr = (match && last) ? 1 : 0;
> >  
> >  			if (vram_addr != XE_VRAM_ADDR_INVALID) {
> > +				xe_svm_copy_kb_stats_incr(gt, dir,
> > +							  (i - pos + incr) *
> > +							  (PAGE_SIZE / SZ_1K));
> >  				if (sram) {
> >  					vm_dbg(&xe->drm,
> >  					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
> > @@ -500,6 +599,8 @@ static int xe_svm_copy(struct page **pages,
> >  
> >  			/* Extra mismatched device page, copy it */
> >  			if (!match && last && vram_addr != XE_VRAM_ADDR_INVALID) {
> > +				xe_svm_copy_kb_stats_incr(gt, dir,
> > +							  (PAGE_SIZE / SZ_1K));
> >  				if (sram) {
> >  					vm_dbg(&xe->drm,
> >  					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
> > @@ -533,6 +634,14 @@ static int xe_svm_copy(struct page **pages,
> >  		dma_fence_put(fence);
> >  	}
> >  
> > +	/*
> > +	 * XXX: We can't derive the GT here (or anywhere in this functions, but
> > +	 * compute always uses the primary GT so accumlate stats on the likely
> > +	 * GT of the fault.
> > +	 */
> > +	if (gt)
> > +		xe_svm_copy_us_stats_incr(gt, dir, npages, start);
> > +
> >  	return err;
> >  #undef XE_MIGRATE_CHUNK_SIZE
> >  #undef XE_VRAM_ADDR_INVALID
> > @@ -846,6 +955,57 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
> >  	return true;
> >  }
> >  
> > +#define DECL_SVM_RANGE_COUNT_STATS(elem, stat) \
> > +static void xe_svm_range_##elem##_count_stats_incr(struct xe_gt *gt, \
> > +						   struct xe_svm_range *range) \
> > +{ \
> > +	switch (xe_svm_range_size(range)) { \
> > +	case SZ_4K: \
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_##stat##_COUNT, 1); \
> > +		break; \
> > +	case SZ_64K: \
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_##stat##_COUNT, 1); \
> > +		break; \
> > +	case SZ_2M: \
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_##stat##_COUNT, 1); \
> > +		break; \
> > +	} \
> > +} \
> > +
> > +DECL_SVM_RANGE_COUNT_STATS(fault, PAGEFAULT)
> > +DECL_SVM_RANGE_COUNT_STATS(valid_fault, VALID_PAGEFAULT)
> > +DECL_SVM_RANGE_COUNT_STATS(migrate, MIGRATE)
> > +
> > +#define DECL_SVM_RANGE_US_STATS(elem, stat) \
> > +static void xe_svm_range_##elem##_us_stats_incr(struct xe_gt *gt, \
> > +						struct xe_svm_range *range, \
> > +						ktime_t start) \
> > +{ \
> > +	s64 us_delta = xe_svm_stats_ktime_us_delta(start); \
> > +\
> > +	switch (xe_svm_range_size(range)) { \
> > +	case SZ_4K: \
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_##stat##_US, \
> > +				 us_delta); \
> > +		break; \
> > +	case SZ_64K: \
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_##stat##_US, \
> > +				 us_delta); \
> > +		break; \
> > +	case SZ_2M: \
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_##stat##_US, \
> > +				 us_delta); \
> > +		break; \
> > +	} \
> > +} \
> > +
> > +DECL_SVM_RANGE_US_STATS(migrate, MIGRATE)
> > +DECL_SVM_RANGE_US_STATS(get_pages, GET_PAGES)
> > +DECL_SVM_RANGE_US_STATS(bind, BIND)
> > +DECL_SVM_RANGE_US_STATS(fault, PAGEFAULT)
> > +
> > +
> > +
> >  static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >  				     struct xe_gt *gt, u64 fault_addr,
> >  				     bool need_vram)
> > @@ -867,6 +1027,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >  	struct xe_tile *tile = gt_to_tile(gt);
> >  	int migrate_try_count = ctx.devmem_only ? 3 : 1;
> >  	ktime_t end = 0;
> > +	ktime_t start = xe_svm_stats_ktime_get(), bind_start, get_pages_start;
> >  	int err;
> >  
> >  	lockdep_assert_held_write(&vm->lock);
> > @@ -885,23 +1046,34 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >  	if (IS_ERR(range))
> >  		return PTR_ERR(range);
> >  
> > -	if (ctx.devmem_only && !range->base.flags.migrate_devmem)
> > -		return -EACCES;
> > +	xe_svm_range_fault_count_stats_incr(gt, range);
> >  
> > -	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only))
> > -		return 0;
> > +	if (ctx.devmem_only && !range->base.flags.migrate_devmem) {
> > +		err = -EACCES;
> > +		goto out;
> > +	}
> > +
> > +	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only)) {
> > +		xe_svm_range_valid_fault_count_stats_incr(gt, range);
> > +		range_debug(range, "PAGE FAULT - VALID");
> > +		goto out;
> > +	}
> >  
> >  	range_debug(range, "PAGE FAULT");
> >  
> >  	dpagemap = xe_vma_resolve_pagemap(vma, tile);
> >  	if (--migrate_try_count >= 0 &&
> >  	    xe_svm_range_needs_migrate_to_vram(range, vma, !!dpagemap || ctx.devmem_only)) {
> > +		ktime_t migrate_start = xe_svm_stats_ktime_get();
> > +
> >  		/* TODO : For multi-device dpagemap will be used to find the
> >  		 * remote tile and remote device. Will need to modify
> >  		 * xe_svm_alloc_vram to use dpagemap for future multi-device
> >  		 * support.
> >  		 */
> > +		xe_svm_range_migrate_count_stats_incr(gt, range);
> >  		err = xe_svm_alloc_vram(tile, range, &ctx);
> > +		xe_svm_range_migrate_us_stats_incr(gt, range, migrate_start);
> >  		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
> >  		if (err) {
> >  			if (migrate_try_count || !ctx.devmem_only) {
> > @@ -918,6 +1090,8 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >  		}
> >  	}
> >  
> > +	get_pages_start = xe_svm_stats_ktime_get();
> > +
> >  	range_debug(range, "GET PAGES");
> >  	err = xe_svm_range_get_pages(vm, range, &ctx);
> >  	/* Corner where CPU mappings have changed */
> > @@ -937,11 +1111,13 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >  	}
> >  	if (err) {
> >  		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
> > -		goto err_out;
> > +		goto out;
> >  	}
> >  
> > +	xe_svm_range_get_pages_us_stats_incr(gt, range, get_pages_start);
> >  	range_debug(range, "PAGE FAULT - BIND");
> >  
> > +	bind_start = xe_svm_stats_ktime_get();
> >  retry_bind:
> >  	xe_vm_lock(vm, false);
> >  	fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
> > @@ -955,14 +1131,16 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >  		}
> >  		if (xe_vm_validate_should_retry(NULL, err, &end))
> >  			goto retry_bind;
> > -		goto err_out;
> > +		goto out;
> >  	}
> >  	xe_vm_unlock(vm);
> >  
> >  	dma_fence_wait(fence, false);
> >  	dma_fence_put(fence);
> > +	xe_svm_range_bind_us_stats_incr(gt, range, bind_start);
> >  
> > -err_out:
> > +out:
> > +	xe_svm_range_fault_us_stats_incr(gt, range, start);
> >  
> >  	return err;
> >  }
> 
