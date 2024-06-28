Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD94C3064D
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 15:56:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F9710EC7E;
	Fri, 28 Jun 2024 15:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j1TLXUwS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9E610EC80
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 15:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719590192; x=1751126192;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FSoE8ZvNRjOd85pVopr+beheFppmoonmqt0h7OhSZ8s=;
 b=j1TLXUwS3Vz+SMhBMrwAxSKtAgtJqoaaaYkeyu8qvWblihgBUPvlQmo2
 CnSc+I4p33ErngZqIp92Gx8o33/bviVq3+XDO51C7+U/zOtDqrTNOSSay
 0W/kvEK5Yu8+7UtzUovrjkT70CgENbIgiXHsB3CxqsYkJbF3l1KW3efrH
 jW0qRS3zgN9dwpY5dT9Rh3TcZEhUDTSuPwN9LYiVy0TOEwfIg+GZcd5td
 u/zBxmQjGqBHo99EfN4t670AlMIQTYup82vuu8wV/uc/4khnVqCvZfd8W
 Hi4fiFsZ6SUADonEaTLUn2NRZ3F2U6DKxb8wlAupjPmX1Sgmm528I56eN Q==;
X-CSE-ConnectionGUID: j7WbUafBRpSscDDO+iKTQw==
X-CSE-MsgGUID: wY9WQoqlQ9y2WfNxLLOuKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="20595950"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="20595950"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 08:56:31 -0700
X-CSE-ConnectionGUID: wjZacq16R3aJscIumC5QVg==
X-CSE-MsgGUID: wmghgeB1Tra4nQERsLEnWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="75500919"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 08:56:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 08:56:30 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 08:56:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 08:56:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 08:56:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MddNa0KVnFGjGBM6Kd6pRkVzTXUWHgTp+r5JpDcB3YXJWB2f3GtX++BN6gbBBboxEltFeW9gJSzAOYfn0uHZacYlHnu2kOqqENWLeDMNOSwGUdyuP5Sq9UaeTi5WMxy+K8eJ0e0iM3O0h4fddp/5Alj3Ld5cHEeWmvH9ArTGK2x+teCq4sGBJbA6cLZXH1yrz48Rj/JkEtbdZgZkBZTDaOrTbE7TVtP8NroIdeH5W8XrRnwFwTirKXzzmF++rfAoCf/Yy3Aabj1sXujb6x5B5NYrzzEjlc1Lyepj0xN81/ZGYy3N1akxtvanJrOuBRlyRNl/kC954lVEnmqeAu2yfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSc44642R5t74KvpABca1KWFEPVeFtYjTkXpWSPcc7U=;
 b=elCEc0tQ5AT3cuEuzTOwYTXQKNEpMawJmh2xnq1LGwpnKp3OJhVvitcl1g+pUB52IdVFyITkOfhctQiJSaEzxPXSz8avVAgeooLfQDXlC34tBeETczssdMLjfKp91TGpbg0aJ4HoxRHRSw9sjY4Hl7Npk0ZqsTJy6Fi0U34YGyT2p99hNdQBRMAvKvxrXdCO2dWmKVxCiPBshoYGq6zONN7azI2fuQrninu0IRVNxhjN917dIFG97/EXIlufWwzfjAGYSH4OVT9rHMwjHTh+6xQl7Vp9Ircmq4a5P5iGme7bwElkG9hgxLgOtD6rNn9BJ7ppVZVNhzJWh9GWDKPmBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ2PR11MB7501.namprd11.prod.outlook.com (2603:10b6:a03:4d2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.33; Fri, 28 Jun
 2024 15:56:20 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 15:56:20 +0000
Date: Fri, 28 Jun 2024 15:55:33 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 6/7] drm/xe: Update PT layer with better error handling
Message-ID: <Zn7c9Ut3Ewn0KeKR@DUT025-TGLU.fm.intel.com>
References: <20240626211546.4099339-1-matthew.brost@intel.com>
 <20240626211546.4099339-7-matthew.brost@intel.com>
 <5e1beaef-42f7-4eb3-abd0-e13f305dc45c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5e1beaef-42f7-4eb3-abd0-e13f305dc45c@intel.com>
X-ClientProxiedBy: SJ0PR03CA0376.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::21) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ2PR11MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d22954c-7175-47b7-e51b-08dc978ada01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Gf/4Y7mmx7VZ8FkfuQMfFZFlnKre15Yff+AhHNKCSCdoig7gBNPweeJjdCHG?=
 =?us-ascii?Q?AXvP36AgYRFftM3XADf8k9G+skU7vA8obYXSQsOqL2wSgbCwcj1MA22urgrY?=
 =?us-ascii?Q?I8uT2fM2SmAdLhXRTyK/6NzqmQQENy5ZNFM6or7sQiL6AaZ0LdYWDtgaeN93?=
 =?us-ascii?Q?wIvf91gsTSLibtNM41mT1/YcN7lUd8ry2BJGitu3dPMl9nz1svawQSVRGG/A?=
 =?us-ascii?Q?H+T8RmaV6ht64SVjLR57WEHGT/VoPdy4PQmX8j9ClCoWcCgbZWzO+Jr9HHAL?=
 =?us-ascii?Q?uy652/I/LqHveLWUPMEZQwXcPr31NmpjFUjSyZbCgt2Jfzs3KTc/8634mCgT?=
 =?us-ascii?Q?dzQ+Lce63XAH2Ql2KE9axPpX0lNnNLLTk/v7yuelf44nJtprPiEoZtDrP6TM?=
 =?us-ascii?Q?WUBca+q5MQW7/2uK3y+sWQe3SogpypHHuU/U/vNNCixu088zqzyOnBsWWbn5?=
 =?us-ascii?Q?DjdA7EFkUcC7SjudUZE3k1Lg/JJH8bsLPuUCJ+7EFIop4KTw7qSy4OQjXJOf?=
 =?us-ascii?Q?knBfGVB5caPSTEu4BXfFJQ0CkpBSfT2MK8dqixi+4dUUWuZH6SyVypNcQ3dJ?=
 =?us-ascii?Q?W2Q2Fd1hvKnbw1yFN9QzF+vMJLy6WMESTjRFASMFT73oKPI+hZ2PsCJY0bTi?=
 =?us-ascii?Q?9uYbgYSMBb6BeSkFy0+zU4TzOMeCIfXy7q3SQhFX1EzKz8UcM97cV5cskvGT?=
 =?us-ascii?Q?Sgd7r5zrcdxmeqBlppWa92Cr+uPJZcnF7j+AbEmkK1gof4XIxfH9CJGQxT/K?=
 =?us-ascii?Q?ksMQgMsfK2bOTtcouR2lEgzLqzSZhgEl6pfj7WAVYw85gjuQctrQ89uBmt7O?=
 =?us-ascii?Q?d76tuAVdPZ++KV8dDQGmFu3il/ObGbKQSWIZSOKkVoLTy9gL+BDXoEbpv/qr?=
 =?us-ascii?Q?9tenRYjKloE3nNk4LgcQuO4W7E5DjYrKxGE6TACm3L3ZtR0xZ7JEORO8UQJj?=
 =?us-ascii?Q?bR8Mx+gKaDN5bVPUR6S92vVRp3zpByVnhOpfxaXCFqWRVB4f7pGPKNqALuP/?=
 =?us-ascii?Q?rrSXFrATideHmy/rU8sM/e4dqckdtIf3Gwan38lUQeTnWYA6VvDs1Q0xq8Tk?=
 =?us-ascii?Q?o/7+BqqVboje572EXbk6HsRRmzizhL3eAdNXq2uO8jqEMhOzAE1/ewB4Ldm3?=
 =?us-ascii?Q?W7AS2AOSZRGzDy3/hx9FW5rZr1PXEv5Y6leaKrG6Ubub7R1OZI18NrMkKaQF?=
 =?us-ascii?Q?OeVLjLLex2aEk5T7Ic78iO1vG3+jUTTxWtONnqq8GeenKWl/JQ2tUEuTuafp?=
 =?us-ascii?Q?2t5frmn86G6VmeWEZWrBUXbn2o86P5IWbGdESJcGc+hQRVyhojyht23D+upQ?=
 =?us-ascii?Q?jK1xeefM4c5ZS2mFV+fUVx2smV4rJcdP0RpB0RGMR6MiUA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mi6Id1DlChxV5cG7q8UxqQmI/3ZuZfLHsSO5vbDmwf27gD8ZeV7XBz63tSZI?=
 =?us-ascii?Q?15RLl+zbXJ43wH6/MT8ktLuOCI5yWTbYbgGcux9AonU/2b74CS2+TwZaxMFH?=
 =?us-ascii?Q?bU4Z+aQOpiM5h2X2nIkngxvrcf0Of8l3t3/euBTvYLfPEsetjNQ8Au0FBpR4?=
 =?us-ascii?Q?E/xPgOsphpOH0b3gyQJ1nduyDpphhMPYQ5MTXBA4NlsLdaYeZCjHFimvhYj3?=
 =?us-ascii?Q?KSAkmPa61O3TfQK2hiGQwTqL0TgyzNH1e/HWSHPs1DZxML7picEeyCD8C850?=
 =?us-ascii?Q?J9asbtTVICgrV3tgINvtVkdP1OTqeIlhSjHa93hAE1aoOjlLMt6nyPJ8HVSQ?=
 =?us-ascii?Q?5gUVf/d/0In9JoWqn+5IeKV17pHDSxFYQ/RwVMdgc5DsXNMEV70Pxgp/lTNT?=
 =?us-ascii?Q?M2iqXPmEv3EPv1Zg+KTz2WtP8qpXH+1oG86L9KPP4EyqBNiwrfr6Q0GYBJWr?=
 =?us-ascii?Q?DMoSbhZ59tV0SIUA6roql/uEOzPnmc0yxiaK80T8MuhotAGdZWa8cDuALqGT?=
 =?us-ascii?Q?sq+YnfquspOXu2iGMMaMDkHMVAwb7zYfAldrNAYV6aqFD2K+bGA5+sU15JhN?=
 =?us-ascii?Q?d2b9iuO7FScyob2JT0Rwxe+EzzdyxTmRrJB2Ka6yLGNTFRz53sjAJmcZ6a9r?=
 =?us-ascii?Q?DArlmfbB22EJ3Drk0/zLua9NW7/+Tih3tFgAyVBsWRVURXZUuIi+V1aopL7c?=
 =?us-ascii?Q?UdWnCp0uZk4iI6eC2u4NjAmpWXB7q9Lypy7aylzU0WRIuO0pKAjBRWtD5z3t?=
 =?us-ascii?Q?K55BhJLsLDiqjOjbQDkka/d4ACsNoZFZsji5NTYZylrLoLYWKVIj5CBJricS?=
 =?us-ascii?Q?9lLIju0nb2pOVPRxmIGXvHI+GmDwCRowE9/hNJR6MeyDxVyYYFHCGQHGKilZ?=
 =?us-ascii?Q?mPN9skAbazB1IaXg8wiFevntG4oevsa36IvBS3HPruvW2ZhsICLgXdw1xWOi?=
 =?us-ascii?Q?8Hk2AWarFr3kWvQZBauYb4zikvWiIeSNZ78ZSY6bS7C5jx+deZYwAZFm/Cr7?=
 =?us-ascii?Q?Mw+HgVYjjom/v8TWgtZ6a01zcGa8yETQs8q8oVP+DJOyi06MTqO8lVF511zr?=
 =?us-ascii?Q?A2DhFLqwh+xO22QgzSUPEHZtdfupfVx+kVwiu1gLcYvWnv1RgweCN/d9KVW3?=
 =?us-ascii?Q?E6GDs2iEPLgWyPWkQ5YGeQMUTOz2/wqbr3mlGjr5876WHJ+EybHF1NLY+L5H?=
 =?us-ascii?Q?gN+UervSzs1gV2S6VWJRgFfOHXXoIftxaHuf4N0/uPzr+cL63LDCG0IAQWTG?=
 =?us-ascii?Q?zzJuWBBOfgOTvM8aM6QPahT87+LLsKfuEHjzADxv2JW7UqqOO4N5FhQoyX5G?=
 =?us-ascii?Q?1m7ReGCvpX+7LduFte8oPA8JKj3dNztgqwYYhJC96Nu17sR4QgtTSLkqu0t4?=
 =?us-ascii?Q?s8ygzajE6SUQBaHO4Dnp+3u8PBBiQCdp9O+77ayQYxyeec4IuMSc7c+Nb6Uy?=
 =?us-ascii?Q?HbXWYaagQTswmKwhFYEErERdDDJtSWI76JCxX26rAHrnkQ2uEgdUHJ0wkDjN?=
 =?us-ascii?Q?EcXW78iM5tyvD18xXe2BWUaUfwyLE96AG1fCf6QTgF3Pj3ouszrCjOwg8BxI?=
 =?us-ascii?Q?/I9MjPJoCWLlozms0xMMs66KDvCm+TUZnL0LOtp+HjsnT7K2M/IvHksKeLxC?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d22954c-7175-47b7-e51b-08dc978ada01
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 15:56:19.9470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPjG85Y/LSqR3vQad+lISXHTLT8mXzaPua6hT4FhDqpBJoTe9keonOdS4Y4aQ1Cp+uXNhIsCzh1COUDADmlbqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7501
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

On Fri, Jun 28, 2024 at 04:00:57PM +0100, Matthew Auld wrote:
> On 26/06/2024 22:15, Matthew Brost wrote:
> > Update PT layer so if a memory allocation for a PTE fails the error can
> > be propagated to the user without requiring the VM to be killed.
> > 
> > v5:
> >   - change return value invalidation_fence_init to void (Matthew Auld)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_pt.c | 227 +++++++++++++++++++++++++++----------
> >   1 file changed, 164 insertions(+), 63 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index f46f46d46819..c043752c0308 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -846,19 +846,27 @@ xe_vm_populate_pgtable(struct xe_migrate_pt_update *pt_update, struct xe_tile *t
> >   	}
> >   }
> > -static void xe_pt_abort_bind(struct xe_vma *vma,
> > -			     struct xe_vm_pgtable_update *entries,
> > -			     u32 num_entries)
> > +static void xe_pt_cancel_bind(struct xe_vma *vma,
> > +			      struct xe_vm_pgtable_update *entries,
> > +			      u32 num_entries)
> >   {
> >   	u32 i, j;
> >   	for (i = 0; i < num_entries; i++) {
> > -		if (!entries[i].pt_entries)
> > +		struct xe_pt *pt = entries[i].pt;
> > +
> > +		if (!pt)
> >   			continue;
> > -		for (j = 0; j < entries[i].qwords; j++)
> > -			xe_pt_destroy(entries[i].pt_entries[j].pt, xe_vma_vm(vma)->flags, NULL);
> > +		if (pt->level) {
> > +			for (j = 0; j < entries[i].qwords; j++)
> > +				xe_pt_destroy(entries[i].pt_entries[j].pt,
> > +					      xe_vma_vm(vma)->flags, NULL);
> > +		}
> > +
> >   		kfree(entries[i].pt_entries);
> > +		entries[i].pt_entries = NULL;
> > +		entries[i].qwords = 0;
> >   	}
> >   }
> > @@ -874,10 +882,61 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
> >   	xe_vm_assert_held(vm);
> >   }
> > -static void xe_pt_commit_bind(struct xe_vma *vma,
> > -			      struct xe_vm_pgtable_update *entries,
> > -			      u32 num_entries, bool rebind,
> > -			      struct llist_head *deferred)
> > +static void xe_pt_commit(struct xe_vma *vma,
> > +			 struct xe_vm_pgtable_update *entries,
> > +			 u32 num_entries, struct llist_head *deferred)
> > +{
> > +	u32 i, j;
> > +
> > +	xe_pt_commit_locks_assert(vma);
> > +
> > +	for (i = 0; i < num_entries; i++) {
> > +		struct xe_pt *pt = entries[i].pt;
> > +
> > +		if (!pt->level)
> > +			continue;
> > +
> > +		for (j = 0; j < entries[i].qwords; j++) {
> > +			struct xe_pt *oldpte = entries[i].pt_entries[j].pt;
> > +
> > +			xe_pt_destroy(oldpte, xe_vma_vm(vma)->flags, deferred);
> > +		}
> > +	}
> > +}
> > +
> > +static void xe_pt_abort_bind(struct xe_vma *vma,
> > +			     struct xe_vm_pgtable_update *entries,
> > +			     u32 num_entries, bool rebind)
> > +{
> > +	int i, j;
> > +
> > +	xe_pt_commit_locks_assert(vma);
> > +
> > +	for (i = num_entries - 1; i >= 0; --i) {
> > +		struct xe_pt *pt = entries[i].pt;
> > +		struct xe_pt_dir *pt_dir;
> > +
> > +		if (!rebind)
> > +			pt->num_live -= entries[i].qwords;
> > +
> > +		if (!pt->level)
> > +			continue;
> > +
> > +		pt_dir = as_xe_pt_dir(pt);
> > +		for (j = 0; j < entries[i].qwords; j++) {
> > +			u32 j_ = j + entries[i].ofs;
> > +			struct xe_pt *newpte = xe_pt_entry(pt_dir, j_);
> > +			struct xe_pt *oldpte = entries[i].pt_entries[j].pt;
> > +
> > +			pt_dir->children[j_] = oldpte ? &oldpte->base : 0;
> > +			xe_pt_destroy(newpte, xe_vma_vm(vma)->flags, NULL);
> > +		}
> > +	}
> > +}
> > +
> > +static void xe_pt_commit_prepare_bind(struct xe_vma *vma,
> > +				      struct xe_vm_pgtable_update *entries,
> > +				      u32 num_entries, bool rebind)
> >   {
> >   	u32 i, j;
> > @@ -897,12 +956,13 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
> >   		for (j = 0; j < entries[i].qwords; j++) {
> >   			u32 j_ = j + entries[i].ofs;
> >   			struct xe_pt *newpte = entries[i].pt_entries[j].pt;
> > +			struct xe_pt *oldpte = NULL;
> >   			if (xe_pt_entry(pt_dir, j_))
> > -				xe_pt_destroy(xe_pt_entry(pt_dir, j_),
> > -					      xe_vma_vm(vma)->flags, deferred);
> > +				oldpte = xe_pt_entry(pt_dir, j_);
> 
> struct xe_pt *oldpte = xe_pt_entry(pt_dir, j_);
> 

That should work.

> ?
> 
> >   			pt_dir->children[j_] = &newpte->base;
> > +			entries[i].pt_entries[j].pt = oldpte;
> >   		}
> >   	}
> >   }
> > @@ -926,8 +986,6 @@ xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
> >   	err = xe_pt_stage_bind(tile, vma, entries, num_entries);
> >   	if (!err)
> >   		xe_tile_assert(tile, *num_entries);
> > -	else /* abort! */
> > -		xe_pt_abort_bind(vma, entries, *num_entries);
> >   	return err;
> >   }
> > @@ -1305,10 +1363,10 @@ static void invalidation_fence_work_func(struct work_struct *w)
> >   				     ifence->end, ifence->asid);
> >   }
> > -static int invalidation_fence_init(struct xe_gt *gt,
> > -				   struct invalidation_fence *ifence,
> > -				   struct dma_fence *fence,
> > -				   u64 start, u64 end, u32 asid)
> > +static void invalidation_fence_init(struct xe_gt *gt,
> > +				    struct invalidation_fence *ifence,
> > +				    struct dma_fence *fence,
> > +				    u64 start, u64 end, u32 asid)
> >   {
> >   	int ret;
> > @@ -1340,8 +1398,6 @@ static int invalidation_fence_init(struct xe_gt *gt,
> >   	}
> >   	xe_gt_assert(gt, !ret || ret == -ENOENT);
> > -
> > -	return ret && ret != -ENOENT ? ret : 0;
> >   }
> >   struct xe_pt_stage_unbind_walk {
> > @@ -1441,7 +1497,7 @@ xe_pt_stage_unbind_post_descend(struct xe_ptw *parent, pgoff_t offset,
> >   				     &end_offset))
> >   		return 0;
> > -	(void)xe_pt_new_shared(&xe_walk->wupd, xe_child, offset, false);
> > +	(void)xe_pt_new_shared(&xe_walk->wupd, xe_child, offset, true);
> 
> Why do we ignore the error here, especially now that alloc_entries=true?
> 

We shouldn't. Let me fix that.

> >   	xe_walk->wupd.updates[level].update->qwords = end_offset - offset;
> >   	return 0;
> > @@ -1509,32 +1565,57 @@ xe_migrate_clear_pgtable_callback(struct xe_migrate_pt_update *pt_update,
> >   		memset64(ptr, empty, num_qwords);
> >   }
> > +static void xe_pt_abort_unbind(struct xe_vma *vma,
> > +			       struct xe_vm_pgtable_update *entries,
> > +			       u32 num_entries)
> > +{
> > +	int j, i;
> 
> Nit: i, j inversion, and then below.
> 

Will fix.

> > +
> > +	xe_pt_commit_locks_assert(vma);
> > +
> > +	for (j = num_entries - 1; j >= 0; --j) {
> > +		struct xe_vm_pgtable_update *entry = &entries[j];
> > +		struct xe_pt *pt = entry->pt;
> > +		struct xe_pt_dir *pt_dir = as_xe_pt_dir(pt);
> > +
> > +		pt->num_live += entry->qwords;
> > +
> > +		if (!pt->level)
> > +			continue;
> > +
> > +		for (i = entry->ofs; i < entry->ofs + entry->qwords; i++)
> > +			pt_dir->children[i] =
> > +				entries[j].pt_entries[i - entry->ofs].pt ?
> > +				&entries[j].pt_entries[i - entry->ofs].pt->base : 0;
> 
> s/0/NULL ?

Will fix.

> 
> > +	}
> > +}
> > +
> >   static void
> > -xe_pt_commit_unbind(struct xe_vma *vma,
> > -		    struct xe_vm_pgtable_update *entries, u32 num_entries,
> > -		    struct llist_head *deferred)
> > +xe_pt_commit_prepare_unbind(struct xe_vma *vma,
> > +			    struct xe_vm_pgtable_update *entries,
> > +			    u32 num_entries)
> >   {
> > -	u32 j;
> > +	int j, i;
> 
> And here.
> 

Will fix.

> >   	xe_pt_commit_locks_assert(vma);
> >   	for (j = 0; j < num_entries; ++j) {
> >   		struct xe_vm_pgtable_update *entry = &entries[j];
> >   		struct xe_pt *pt = entry->pt;
> > +		struct xe_pt_dir *pt_dir;
> >   		pt->num_live -= entry->qwords;
> > -		if (pt->level) {
> > -			struct xe_pt_dir *pt_dir = as_xe_pt_dir(pt);
> > -			u32 i;
> > -
> > -			for (i = entry->ofs; i < entry->ofs + entry->qwords;
> > -			     i++) {
> > -				if (xe_pt_entry(pt_dir, i))
> > -					xe_pt_destroy(xe_pt_entry(pt_dir, i),
> > -						      xe_vma_vm(vma)->flags, deferred);
> > +		if (!pt->level)
> > +			continue;
> > -				pt_dir->children[i] = NULL;
> > -			}
> > +		pt_dir = as_xe_pt_dir(pt);
> > +		for (i = entry->ofs; i < entry->ofs + entry->qwords; i++) {
> > +			if (xe_pt_entry(pt_dir, i))
> > +				entries[j].pt_entries[i - entry->ofs].pt =
> > +					xe_pt_entry(pt_dir, i);
> > +			else
> > +				entries[j].pt_entries[i - entry->ofs].pt = NULL;
> 
> entries[j].pt_entries[i - entry->ofs].pt = xe_pt_entry(pt_dir, i)
> 
> ?

Yes.

Thanks for the review will respin for CI with these changes.

Matt

> 
> Otherwise,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> > +			pt_dir->children[i] = NULL;
> >   		}
> >   	}
> >   }
> > @@ -1580,7 +1661,6 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
> >   {
> >   	u32 current_op = pt_update_ops->current_op;
> >   	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
> > -	struct llist_head *deferred = &pt_update_ops->deferred;
> >   	int err;
> >   	xe_bo_assert_held(xe_vma_bo(vma));
> > @@ -1628,11 +1708,12 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
> >   			/* We bump also if batch_invalidate_tlb is true */
> >   			vm->tlb_flush_seqno++;
> > -		/* FIXME: Don't commit right away */
> >   		vma->tile_staged |= BIT(tile->id);
> >   		pt_op->vma = vma;
> > -		xe_pt_commit_bind(vma, pt_op->entries, pt_op->num_entries,
> > -				  pt_op->rebind, deferred);
> > +		xe_pt_commit_prepare_bind(vma, pt_op->entries,
> > +					  pt_op->num_entries, pt_op->rebind);
> > +	} else {
> > +		xe_pt_cancel_bind(vma, pt_op->entries, pt_op->num_entries);
> >   	}
> >   	return err;
> > @@ -1644,7 +1725,6 @@ static int unbind_op_prepare(struct xe_tile *tile,
> >   {
> >   	u32 current_op = pt_update_ops->current_op;
> >   	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
> > -	struct llist_head *deferred = &pt_update_ops->deferred;
> >   	int err;
> >   	if (!((vma->tile_present | vma->tile_staged) & BIT(tile->id)))
> > @@ -1680,9 +1760,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
> >   	pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
> >   	pt_update_ops->needs_invalidation = true;
> > -	/* FIXME: Don't commit right away */
> > -	xe_pt_commit_unbind(vma, pt_op->entries, pt_op->num_entries,
> > -			    deferred);
> > +	xe_pt_commit_prepare_unbind(vma, pt_op->entries, pt_op->num_entries);
> >   	return 0;
> >   }
> > @@ -1903,7 +1981,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> >   	struct invalidation_fence *ifence = NULL;
> >   	struct xe_range_fence *rfence;
> >   	struct xe_vma_op *op;
> > -	int err = 0;
> > +	int err = 0, i;
> >   	struct xe_migrate_pt_update update = {
> >   		.ops = pt_update_ops->needs_userptr_lock ?
> >   			&userptr_migrate_ops :
> > @@ -1923,8 +2001,10 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> >   	if (pt_update_ops->needs_invalidation) {
> >   		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
> > -		if (!ifence)
> > -			return ERR_PTR(-ENOMEM);
> > +		if (!ifence) {
> > +			err = -ENOMEM;
> > +			goto kill_vm_tile1;
> > +		}
> >   	}
> >   	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
> > @@ -1939,6 +2019,15 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> >   		goto free_rfence;
> >   	}
> > +	/* Point of no return - VM killed if failure after this */
> > +	for (i = 0; i < pt_update_ops->current_op; ++i) {
> > +		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
> > +
> > +		xe_pt_commit(pt_op->vma, pt_op->entries,
> > +			     pt_op->num_entries, &pt_update_ops->deferred);
> > +		pt_op->vma = NULL;	/* skip in xe_pt_update_ops_abort */
> > +	}
> > +
> >   	if (xe_range_fence_insert(&vm->rftree[tile->id], rfence,
> >   				  &xe_range_fence_kfree_ops,
> >   				  pt_update_ops->start,
> > @@ -1947,12 +2036,9 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> >   	/* tlb invalidation must be done before signaling rebind */
> >   	if (ifence) {
> > -		err = invalidation_fence_init(tile->primary_gt, ifence, fence,
> > -					      pt_update_ops->start,
> > -					      pt_update_ops->last,
> > -					      vm->usm.asid);
> > -		if (err)
> > -			goto put_fence;
> > +		invalidation_fence_init(tile->primary_gt, ifence, fence,
> > +					pt_update_ops->start,
> > +					pt_update_ops->last, vm->usm.asid);
> >   		fence = &ifence->base.base;
> >   	}
> > @@ -1969,14 +2055,13 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> >   	return fence;
> > -put_fence:
> > -	if (pt_update_ops->needs_userptr_lock)
> > -		up_read(&vm->userptr.notifier_lock);
> > -	dma_fence_put(fence);
> >   free_rfence:
> >   	kfree(rfence);
> >   free_ifence:
> >   	kfree(ifence);
> > +kill_vm_tile1:
> > +	if (err != -EAGAIN && tile->id)
> > +		xe_vm_kill(vops->vm, false);
> >   	return ERR_PTR(err);
> >   }
> > @@ -1997,12 +2082,10 @@ void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops)
> >   	lockdep_assert_held(&vops->vm->lock);
> >   	xe_vm_assert_held(vops->vm);
> > -	/* FIXME: Not 100% correct */
> > -	for (i = 0; i < pt_update_ops->num_ops; ++i) {
> > +	for (i = 0; i < pt_update_ops->current_op; ++i) {
> >   		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
> > -		if (pt_op->bind)
> > -			xe_pt_free_bind(pt_op->entries, pt_op->num_entries);
> > +		xe_pt_free_bind(pt_op->entries, pt_op->num_entries);
> >   	}
> >   	xe_bo_put_commit(&vops->pt_update_ops[tile->id].deferred);
> >   }
> > @@ -2016,10 +2099,28 @@ void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops)
> >    */
> >   void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops)
> >   {
> > +	struct xe_vm_pgtable_update_ops *pt_update_ops =
> > +		&vops->pt_update_ops[tile->id];
> > +	int i;
> > +
> >   	lockdep_assert_held(&vops->vm->lock);
> >   	xe_vm_assert_held(vops->vm);
> > -	/* FIXME: Just kill VM for now + cleanup PTs */
> > +	for (i = pt_update_ops->num_ops - 1; i >= 0; --i) {
> > +		struct xe_vm_pgtable_update_op *pt_op =
> > +			&pt_update_ops->ops[i];
> > +
> > +		if (!pt_op->vma || i >= pt_update_ops->current_op)
> > +			continue;
> > +
> > +		if (pt_op->bind)
> > +			xe_pt_abort_bind(pt_op->vma, pt_op->entries,
> > +					 pt_op->num_entries,
> > +					 pt_op->rebind);
> > +		else
> > +			xe_pt_abort_unbind(pt_op->vma, pt_op->entries,
> > +					   pt_op->num_entries);
> > +	}
> > +
> >   	xe_bo_put_commit(&vops->pt_update_ops[tile->id].deferred);
> > -	xe_vm_kill(vops->vm, false);
> >   }
