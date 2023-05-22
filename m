Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9101C7EE23
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 01:16:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7B410E229;
	Mon, 22 May 2023 01:16:51 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982C610E229
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 01:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684718210; x=1716254210;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FgC7l9JO20trcimJWZ9YIbwQKKUjkTpYiATyqKbboy8=;
 b=GC03avGBiGE1kS0fp43GleDOj1seECkUCXT/Qo0U4+dDOaAp8XPqihgE
 Y5Y72qwJHvbF17wKL/fQGiP5Bs9mdajuaE4XShHo1An4rQDmjLVIq9+pv
 hofGFmIzz/8/twQqkkxmkXMJwQ0eegTK0PHMP8KjogbBD6lJ26ruZPGfO
 t69Jgz7h9koBXlSgymQr31NR53lduL/1FgMM3Bls6IHHwmMRHbIr9uGDX
 5daLixjl+tr854n8CMoACGtQ9qcnLh602Hp/F/G7TAHW+1osjzq18f8kY
 KbiDandQ9kLJzKhTPsCak+pQdkPgU5RMbN82xwKysQpZ+tlZviUyXNNIy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="332405734"
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; d="scan'208";a="332405734"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2023 18:16:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="827518588"
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; d="scan'208";a="827518588"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 21 May 2023 18:16:49 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 21 May 2023 18:16:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 21 May 2023 18:16:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 21 May 2023 18:16:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FraQgLv/szpWFTBC9wxP44fJw9GhETe7bD+OSd+Wf/ZjZPd84k+nDG5s5mVqXArV502tHg/4Ayed2GudrzIsXLbzH2qkGK9IwtENm9Z7AL81+pAnnW/b7n5lQwdO9rt+jQUlBLL7Ty6UjcXL4uAE/mTmKfNM1bNsRGGmlXJSyLyQp25LJ7jgKhROVJA5X2XKERMKurlOgnVk6JyDaAfBkmnWq2L0TnbXVleiMnj3ttdJwhaCyxNGs/1zpWDfGmiqd87wzMRkgIXwloLsbNUOjZIQNxPb+0r83ayo9NPJmDGGHe13VVjrnFhG2eSeX4hujG/KikQjkVo/HacDTU2DMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tm21npUbninnaQlhzOFNmxvvz/Z7KOeiapnD+OPiqgI=;
 b=M6tWXH6SYdihrflfh6+K4+plK1Jpey/50rNDb+ZdE3sIp0S7n1BjPkvX0M/ina1E9TJHsBvz1Nw0R/1wK/RH4OKAlKh/2Di6dfp0uB1d+7BYIv/YbHntGCeGZlMvpT7SEKxkVZOzU7fbKGdoJVVX8ELAfi3FmebVoENtYqv8H/2CsmrnEmkeMUDAQwJZxRhBiee902WXX9dwdyd6y5OqoO5vlbfaJuNVsB6c1wOZGXWCR4VpZD+wykkXu7VUpfLxsLfx12xjMB9on7ZdNuqgl28E0+Rszt/Pkioh6I1o20y106Dz3cw78oZjf75Alzq1d+lf5D2oPJ2uoxreFLikOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7093.namprd11.prod.outlook.com (2603:10b6:510:217::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Mon, 22 May
 2023 01:16:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6411.027; Mon, 22 May 2023
 01:16:45 +0000
Date: Mon, 22 May 2023 01:16:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZGrCZWD8lV7wlJhB@DUT025-TGLU.fm.intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-4-matthew.brost@intel.com>
 <fb7411b6-e11c-f985-5784-6e6b9d02e560@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb7411b6-e11c-f985-5784-6e6b9d02e560@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0071.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: fee91e79-15c1-4c1c-a9f1-08db5a623474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dgQR9gDnx6s1d5C7i+38S9xrpyqDthkvaru0pFe1QX/aKBU9A7EP2YNhJmlY8bm9Me2MMxJvBqtPJAKi6D3ExHSwfL6S5EMt1xLw+MHI74Oqf3+3jGRBZVprM5NgVQ7UOmiU+KBb96k0CUvwMP01sybr8JfsjcWenGATjtXefMjyEDGhTKJBul/JOyY9XZnUhAK/TKeP0FXEHzVeT3CC/WhlBZf7ex7uHds0GlSzT/0scp+d+5T5U9CImBmN+VN/eSG/+M7DizvnqtxBBSaChWbb+aRIYA/N24I9NTPEP1CiDnEXPtpdtYa3ykndg14FWRmL7HAejCX6Vh8GGx+OrBSQp3Naes7qHXKHcMBquO+MzyVopOZBA8CoIle5fofpqSqJ1sdcrwDTLajmo2VeFINS6TdwBU7iQF5xaccW0I41GTqbUai7BBr0bSHLAWvuzpM2IzP9CwlPh2KvM4WZiaFDvvtV/YPmC1Xk6967nCoBctdlvHUVzlTckAnfxYY5Bd7Npru1gZMnk+qHdi8Tjg5dB9NUCmZ+BZFDs7distnC0NWwV5weTt6n8n2ELhuPRJ2FRCJgh6knz4AITvFx8HTKwIUpOgjQjsvG5wMDaIM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199021)(6512007)(53546011)(6506007)(26005)(66574015)(83380400001)(38100700002)(86362001)(186003)(82960400001)(8936002)(478600001)(44832011)(30864003)(2906002)(8676002)(316002)(41300700001)(5660300002)(66946007)(66556008)(6916009)(66476007)(4326008)(6666004)(6486002)(66899021)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vPvmV7aCvMa/qoG/0Xu1teDq8XuOjn+8rYqz/0DPE8+r5NH8U6I2tmqUVb?=
 =?iso-8859-1?Q?MBqnwJCB8SqxgPBJzIoPKQn/b7SL6Uv2qiNI+1bD5Ta++kmmPQYAOEU5s3?=
 =?iso-8859-1?Q?ILHleRR4oybCtYMCph1L4orNFwqOERU/E6hXgYXEd/7qqD44OhgMCQceR6?=
 =?iso-8859-1?Q?MujNmvb8xdZniri7AvBd5WoMrGFrR6xZuI6V0iWgcOyBPRWph42kHeRB3s?=
 =?iso-8859-1?Q?JQrgDRaSNsidecEGgxE+ipfRvz9+TXmqM5CMTMvi7pF0r9G8skccOXxe31?=
 =?iso-8859-1?Q?AwmSyzQZQ6qTnfJfbGdTSITji2m+OXPs64jI0zC4iFyfmDsLlbDKhigMcB?=
 =?iso-8859-1?Q?5HeFp7YuA1LWTyRlAC+0qwOACHPAcEevAvpengyNi0Lh3Jj9RmZDe5itHt?=
 =?iso-8859-1?Q?gRJvmuGw1oRVewh+Zgnwd3Gr42IrBmpjJ6lUHUlAGnUzKsfihXZkq1euR0?=
 =?iso-8859-1?Q?EO11BuhhqWbtctjxfBcLF0JcgaMkSyiHMay4bkLJddv0s3buxnNi8UOHR9?=
 =?iso-8859-1?Q?RINoYZxjeZ0ntTlx+8wBhYXtHDyJg/KWdfbe2Re1++P9YKRBcTb32TO/Lz?=
 =?iso-8859-1?Q?OMPIotqmzpkHRPmerUst2nZF/jXwfKA2jVT4niNHww2tJANWbFrQXEbKiy?=
 =?iso-8859-1?Q?2oDNMc/3Xyw0ew4i3S2Kd5oLPdH9eFVkdPUbrM3a4DooWm335Nb8OfsL6j?=
 =?iso-8859-1?Q?jn4Ma/HraYpoLDPVAY+gdAvdZfFAqGW7J6QAiZIKY42OONCm1dKwtl0lzA?=
 =?iso-8859-1?Q?VSfsSfyP0vA2UwPqmqYNZAd6TVaA/Htn08RWZYHb/EeaRzvLsBHBVLo0vh?=
 =?iso-8859-1?Q?hSRKA1N0iFPOrwAWhpkhWWrV/LmvoN0qQQ4o4KgjbYJKNSvoY4hPxlORW7?=
 =?iso-8859-1?Q?+RtskUtT7Av2dwAmSIoU0FsVZJktTHfwcikxxZ3DCyX6LlU/vBQvBzdT3F?=
 =?iso-8859-1?Q?YY4q2Hd1/F+MtTDikxWqQSYEAEZm4yD5cQc8npmRxxAm/aStBrXOHq24Qb?=
 =?iso-8859-1?Q?negFuCmYfX1Ih8AzvqzuljSyOM6oeYbRx281Oz/OOqW0CO2gac5fmBoGi7?=
 =?iso-8859-1?Q?DWDPWBHD61XrOxkRB2eXR/7cmHvITyz11nxHzbuA0/SZLu1th9nHRNrG+7?=
 =?iso-8859-1?Q?p9+GXoeGfTqslLiO2mf/gzxFY9s1fao7UQbTPSaNSGuHboPJfRY9ab5z6L?=
 =?iso-8859-1?Q?SnEK46qTyra5IaX7QzUJ6P18gWxxtVmX6qPPjCHUMbeFX8ULYbJMJzQRHl?=
 =?iso-8859-1?Q?yfeT95pOjhzxguJl8ySKuOJBjJCM+DsSDFOtw9RoqfyxLz5uUcLD9ZvxKw?=
 =?iso-8859-1?Q?V4YVw971TH5t50fvkJL9rYSdqfgfC7WFm25/C1mwTKAQhTs982lHGfXcqk?=
 =?iso-8859-1?Q?cIXCbFUZgBC1FTMkNqTcGzGwElOXAXxPxFe87pTSfo1pUr75rTczNktEgu?=
 =?iso-8859-1?Q?I5GnWFKNshhqXcpmbnArwvcGGfq4XBJ+T/BK2zqGIZ/Heoh88KvB5Bo9TL?=
 =?iso-8859-1?Q?ng0Nu47kJU7CJuFi4MXio2kEnHSf/9JZztY8r6KRG6midCjsp2o+BI4aZo?=
 =?iso-8859-1?Q?PIWEfcGvKDLWtceGtBSvw01XthfqK9sD4Dc0I/NP/DCmbl7DuWQwfR6plm?=
 =?iso-8859-1?Q?oYwC3dBgIRH+SUDa22DdGPTvx4dNzZBg2ry2spk9WH0VVk3WA5GZMS2Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fee91e79-15c1-4c1c-a9f1-08db5a623474
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 01:16:44.4308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGdhabHHAl5KoNu/PRSSAzppFRghM8yNu4jS/j3kUDbrusteO6mEahxmye+AdDYUo2UFEoYf7erekDUVazkAPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7093
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 03/31] drm/sched: Add
 DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
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

On Mon, May 08, 2023 at 02:40:24PM +0200, Thomas Hellström wrote:
> An question below, with that addressed (possibly without change)
> 
> although I'm not a scheduler expert and we should ideally have additional
> reviewers,
> 
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> On 5/2/23 02:16, Matthew Brost wrote:
> > DRM_SCHED_POLICY_SINGLE_ENTITY creates a 1 to 1 relationship between
> > scheduler and entity. No priorities or run queue used in this mode.
> > Intended for devices with firmware schedulers.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/scheduler/sched_entity.c | 64 +++++++++++++++++++-----
> >   drivers/gpu/drm/scheduler/sched_fence.c  |  2 +-
> >   drivers/gpu/drm/scheduler/sched_main.c   | 63 ++++++++++++++++++++---
> >   include/drm/gpu_scheduler.h              |  8 +++
> >   4 files changed, 115 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> > index 2300b2fc06ab..8b70900c54cc 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -83,6 +83,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
> >   	memset(entity, 0, sizeof(struct drm_sched_entity));
> >   	INIT_LIST_HEAD(&entity->list);
> >   	entity->rq = NULL;
> > +	entity->single_sched = NULL;
> >   	entity->guilty = guilty;
> >   	entity->num_sched_list = num_sched_list;
> >   	entity->priority = priority;
> > @@ -91,7 +92,15 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
> >   	RB_CLEAR_NODE(&entity->rb_tree_node);
> >   	if(num_sched_list) {
> > -		entity->rq = &sched_list[0]->sched_rq[entity->priority];
> > +		if (sched_list[0]->sched_policy !=
> > +		    DRM_SCHED_POLICY_SINGLE_ENTITY) {
> > +			entity->rq = &sched_list[0]->sched_rq[entity->priority];
> > +		} else {
> > +			if (num_sched_list != 1 || sched_list[0]->single_entity)
> > +				return -EINVAL;
> > +			sched_list[0]->single_entity = entity;
> > +			entity->single_sched = sched_list[0];
> > +		}
> >   	}
> >   	init_completion(&entity->entity_idle);
> > @@ -125,7 +134,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> >   				    struct drm_gpu_scheduler **sched_list,
> >   				    unsigned int num_sched_list)
> >   {
> > -	WARN_ON(!num_sched_list || !sched_list);
> 
> Is there a way to get to the drm device so we can use drm_WARN_ON() here and
> below? I figure not?
> 

Correct, no way to resolve the DRM device.

Matt

> Thanks,
> 
> Thomas
> 
> 
> > +	WARN_ON(!num_sched_list || !sched_list ||
> > +		!!entity->single_sched);
> >   	entity->sched_list = sched_list;
> >   	entity->num_sched_list = num_sched_list;
> > @@ -195,13 +205,15 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
> >   {
> >   	struct drm_sched_job *job;
> >   	struct dma_fence *prev;
> > +	bool single_entity = !!entity->single_sched;
> > -	if (!entity->rq)
> > +	if (!entity->rq && !single_entity)
> >   		return;
> >   	spin_lock(&entity->rq_lock);
> >   	entity->stopped = true;
> > -	drm_sched_rq_remove_entity(entity->rq, entity);
> > +	if (!single_entity)
> > +		drm_sched_rq_remove_entity(entity->rq, entity);
> >   	spin_unlock(&entity->rq_lock);
> >   	/* Make sure this entity is not used by the scheduler at the moment */
> > @@ -223,6 +235,20 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
> >   	dma_fence_put(prev);
> >   }
> > +/**
> > + * drm_sched_entity_to_scheduler - Schedule entity to GPU scheduler
> > + * @entity: scheduler entity
> > + *
> > + * Returns GPU scheduler for the entity
> > + */
> > +struct drm_gpu_scheduler *
> > +drm_sched_entity_to_scheduler(struct drm_sched_entity *entity)
> > +{
> > +	bool single_entity = !!entity->single_sched;
> > +
> > +	return single_entity ? entity->single_sched : entity->rq->sched;
> > +}
> > +
> >   /**
> >    * drm_sched_entity_flush - Flush a context entity
> >    *
> > @@ -240,11 +266,12 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
> >   	struct drm_gpu_scheduler *sched;
> >   	struct task_struct *last_user;
> >   	long ret = timeout;
> > +	bool single_entity = !!entity->single_sched;
> > -	if (!entity->rq)
> > +	if (!entity->rq && !single_entity)
> >   		return 0;
> > -	sched = entity->rq->sched;
> > +	sched = drm_sched_entity_to_scheduler(entity);
> >   	/**
> >   	 * The client will not queue more IBs during this fini, consume existing
> >   	 * queued IBs or discard them on SIGKILL
> > @@ -337,7 +364,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
> >   		container_of(cb, struct drm_sched_entity, cb);
> >   	drm_sched_entity_clear_dep(f, cb);
> > -	drm_sched_wakeup(entity->rq->sched);
> > +	drm_sched_wakeup(drm_sched_entity_to_scheduler(entity));
> >   }
> >   /**
> > @@ -351,6 +378,8 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
> >   void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
> >   				   enum drm_sched_priority priority)
> >   {
> > +	WARN_ON(!!entity->single_sched);
> > +
> >   	spin_lock(&entity->rq_lock);
> >   	entity->priority = priority;
> >   	spin_unlock(&entity->rq_lock);
> > @@ -363,7 +392,7 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
> >    */
> >   static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
> >   {
> > -	struct drm_gpu_scheduler *sched = entity->rq->sched;
> > +	struct drm_gpu_scheduler *sched = drm_sched_entity_to_scheduler(entity);
> >   	struct dma_fence *fence = entity->dependency;
> >   	struct drm_sched_fence *s_fence;
> > @@ -456,7 +485,8 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> >   	 * Update the entity's location in the min heap according to
> >   	 * the timestamp of the next job, if any.
> >   	 */
> > -	if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
> > +	if (drm_sched_entity_to_scheduler(entity)->sched_policy ==
> > +	    DRM_SCHED_POLICY_FIFO) {
> >   		struct drm_sched_job *next;
> >   		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> > @@ -473,6 +503,8 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
> >   	struct drm_gpu_scheduler *sched;
> >   	struct drm_sched_rq *rq;
> > +	WARN_ON(!!entity->single_sched);
> > +
> >   	/* single possible engine and already selected */
> >   	if (!entity->sched_list)
> >   		return;
> > @@ -522,16 +554,21 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
> >   void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> >   {
> >   	struct drm_sched_entity *entity = sched_job->entity;
> > +	bool single_entity = !!entity->single_sched;
> >   	bool first;
> >   	trace_drm_sched_job(sched_job, entity);
> > -	atomic_inc(entity->rq->sched->score);
> > +	if (!single_entity)
> > +		atomic_inc(entity->rq->sched->score);
> >   	WRITE_ONCE(entity->last_user, current->group_leader);
> >   	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
> >   	sched_job->submit_ts = ktime_get();
> >   	/* first job wakes up scheduler */
> >   	if (first) {
> > +		struct drm_gpu_scheduler *sched =
> > +			drm_sched_entity_to_scheduler(entity);
> > +
> >   		/* Add the entity to the run queue */
> >   		spin_lock(&entity->rq_lock);
> >   		if (entity->stopped) {
> > @@ -541,13 +578,14 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> >   			return;
> >   		}
> > -		drm_sched_rq_add_entity(entity->rq, entity);
> > +		if (!single_entity)
> > +			drm_sched_rq_add_entity(entity->rq, entity);
> >   		spin_unlock(&entity->rq_lock);
> > -		if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO)
> > +		if (sched->sched_policy == DRM_SCHED_POLICY_FIFO)
> >   			drm_sched_rq_update_fifo(entity, sched_job->submit_ts);
> > -		drm_sched_wakeup(entity->rq->sched);
> > +		drm_sched_wakeup(sched);
> >   	}
> >   }
> >   EXPORT_SYMBOL(drm_sched_entity_push_job);
> > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> > index 7fd869520ef2..1ba5056851dd 100644
> > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > @@ -167,7 +167,7 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
> >   {
> >   	unsigned seq;
> > -	fence->sched = entity->rq->sched;
> > +	fence->sched = drm_sched_entity_to_scheduler(entity);
> >   	seq = atomic_inc_return(&entity->fence_seq);
> >   	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
> >   		       &fence->lock, entity->fence_context, seq);
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 6777a2db554f..870568d94f1f 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -32,7 +32,8 @@
> >    * backend operations to the scheduler like submitting a job to hardware run queue,
> >    * returning the dependencies of a job etc.
> >    *
> > - * The organisation of the scheduler is the following:
> > + * The organisation of the scheduler is the following for scheduling policies
> > + * DRM_SCHED_POLICY_RR and DRM_SCHED_POLICY_FIFO:
> >    *
> >    * 1. Each hw run queue has one scheduler
> >    * 2. Each scheduler has multiple run queues with different priorities
> > @@ -41,7 +42,22 @@
> >    * 4. Entities themselves maintain a queue of jobs that will be scheduled on
> >    *    the hardware.
> >    *
> > - * The jobs in a entity are always scheduled in the order that they were pushed.
> > + * The organisation of the scheduler is the following for scheduling policy
> > + * DRM_SCHED_POLICY_SINGLE_ENTITY:
> > + *
> > + * 1. One to one relationship between scheduler and entity
> > + * 2. No priorities implemented per scheduler (single job queue)
> > + * 3. No run queues in scheduler rather jobs are directly dequeued from entity
> > + * 4. The entity maintains a queue of jobs that will be scheduled on the
> > + * hardware
> > + *
> > + * The jobs in a entity are always scheduled in the order that they were pushed
> > + * regardless of scheduling policy.
> > + *
> > + * A policy of DRM_SCHED_POLICY_RR or DRM_SCHED_POLICY_FIFO is expected to used
> > + * when the KMD is scheduling directly on the hardware while a scheduling policy
> > + * of DRM_SCHED_POLICY_SINGLE_ENTITY is expected to be used when there is a
> > + * firmare scheduler.
> >    */
> >   #include <linux/wait.h>
> > @@ -92,6 +108,8 @@ static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *enti
> >   void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
> >   {
> > +	WARN_ON(!!entity->single_sched);
> > +
> >   	/*
> >   	 * Both locks need to be grabbed, one to protect from entity->rq change
> >   	 * for entity from within concurrent drm_sched_entity_select_rq and the
> > @@ -122,6 +140,8 @@ void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
> >   static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
> >   			      struct drm_sched_rq *rq)
> >   {
> > +	WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
> > +
> >   	spin_lock_init(&rq->lock);
> >   	INIT_LIST_HEAD(&rq->entities);
> >   	rq->rb_tree_root = RB_ROOT_CACHED;
> > @@ -140,6 +160,8 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
> >   void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
> >   			     struct drm_sched_entity *entity)
> >   {
> > +	WARN_ON(!!entity->single_sched);
> > +
> >   	if (!list_empty(&entity->list))
> >   		return;
> > @@ -162,6 +184,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
> >   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> >   				struct drm_sched_entity *entity)
> >   {
> > +	WARN_ON(!!entity->single_sched);
> > +
> >   	if (list_empty(&entity->list))
> >   		return;
> > @@ -691,7 +715,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
> >   		       struct drm_sched_entity *entity,
> >   		       void *owner)
> >   {
> > -	if (!entity->rq)
> > +	if (!entity->rq && !entity->single_sched)
> >   		return -ENOENT;
> >   	job->entity = entity;
> > @@ -724,13 +748,16 @@ void drm_sched_job_arm(struct drm_sched_job *job)
> >   {
> >   	struct drm_gpu_scheduler *sched;
> >   	struct drm_sched_entity *entity = job->entity;
> > +	bool single_entity = !!entity->single_sched;
> >   	BUG_ON(!entity);
> > -	drm_sched_entity_select_rq(entity);
> > -	sched = entity->rq->sched;
> > +	if (!single_entity)
> > +		drm_sched_entity_select_rq(entity);
> > +	sched = drm_sched_entity_to_scheduler(entity);
> >   	job->sched = sched;
> > -	job->s_priority = entity->rq - sched->sched_rq;
> > +	if (!single_entity)
> > +		job->s_priority = entity->rq - sched->sched_rq;
> >   	job->id = atomic64_inc_return(&sched->job_id_count);
> >   	drm_sched_fence_init(job->s_fence, job->entity);
> > @@ -954,6 +981,13 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> >   	if (!drm_sched_ready(sched))
> >   		return NULL;
> > +	if (sched->single_entity) {
> > +		if (drm_sched_entity_is_ready(sched->single_entity))
> > +			return sched->single_entity;
> > +
> > +		return NULL;
> > +	}
> > +
> >   	/* Kernel run queue has higher priority than normal run queue*/
> >   	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> >   		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> > @@ -1210,6 +1244,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   		return -EINVAL;
> >   	sched->ops = ops;
> > +	sched->single_entity = NULL;
> >   	sched->hw_submission_limit = hw_submission;
> >   	sched->name = name;
> >   	sched->run_wq = run_wq ? : system_wq;
> > @@ -1222,7 +1257,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   		sched->sched_policy = default_drm_sched_policy;
> >   	else
> >   		sched->sched_policy = sched_policy;
> > -	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
> > +	for (i = DRM_SCHED_PRIORITY_MIN; sched_policy !=
> > +	     DRM_SCHED_POLICY_SINGLE_ENTITY && i < DRM_SCHED_PRIORITY_COUNT;
> > +	     i++)
> >   		drm_sched_rq_init(sched, &sched->sched_rq[i]);
> >   	init_waitqueue_head(&sched->job_scheduled);
> > @@ -1255,7 +1292,15 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
> >   	drm_sched_run_wq_stop(sched);
> > -	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> > +	if (sched->single_entity) {
> > +		spin_lock(&sched->single_entity->rq_lock);
> > +		sched->single_entity->stopped = true;
> > +		spin_unlock(&sched->single_entity->rq_lock);
> > +	}
> > +
> > +	for (i = DRM_SCHED_PRIORITY_COUNT - 1; sched->sched_policy !=
> > +	     DRM_SCHED_POLICY_SINGLE_ENTITY && i >= DRM_SCHED_PRIORITY_MIN;
> > +	     i--) {
> >   		struct drm_sched_rq *rq = &sched->sched_rq[i];
> >   		if (!rq)
> > @@ -1299,6 +1344,8 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
> >   	struct drm_sched_entity *entity;
> >   	struct drm_gpu_scheduler *sched = bad->sched;
> > +	WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
> > +
> >   	/* don't change @bad's karma if it's from KERNEL RQ,
> >   	 * because sometimes GPU hang would cause kernel jobs (like VM updating jobs)
> >   	 * corrupt but keep in mind that kernel jobs always considered good.
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 3df801401028..669d6520cd3a 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -70,6 +70,7 @@ enum drm_sched_policy {
> >   	DRM_SCHED_POLICY_DEFAULT,
> >   	DRM_SCHED_POLICY_RR,
> >   	DRM_SCHED_POLICY_FIFO,
> > +	DRM_SCHED_POLICY_SINGLE_ENTITY,
> >   	DRM_SCHED_POLICY_COUNT,
> >   };
> > @@ -103,6 +104,9 @@ struct drm_sched_entity {
> >   	 */
> >   	struct drm_sched_rq		*rq;
> > +	/** @single_sched: Single scheduler */
> > +	struct drm_gpu_scheduler	*single_sched;
> > +
> >   	/**
> >   	 * @sched_list:
> >   	 *
> > @@ -488,6 +492,7 @@ struct drm_sched_backend_ops {
> >    * struct drm_gpu_scheduler - scheduler instance-specific data
> >    *
> >    * @ops: backend operations provided by the driver.
> > + * @single_entity: Single entity for the scheduler
> >    * @hw_submission_limit: the max size of the hardware queue.
> >    * @timeout: the time after which a job is removed from the scheduler.
> >    * @name: name of the ring for which this scheduler is being used.
> > @@ -519,6 +524,7 @@ struct drm_sched_backend_ops {
> >    */
> >   struct drm_gpu_scheduler {
> >   	const struct drm_sched_backend_ops	*ops;
> > +	struct drm_sched_entity		*single_entity;
> >   	uint32_t			hw_submission_limit;
> >   	long				timeout;
> >   	const char			*name;
> > @@ -604,6 +610,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
> >   			  struct drm_gpu_scheduler **sched_list,
> >   			  unsigned int num_sched_list,
> >   			  atomic_t *guilty);
> > +struct drm_gpu_scheduler *
> > +drm_sched_entity_to_scheduler(struct drm_sched_entity *entity);
> >   long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout);
> >   void drm_sched_entity_fini(struct drm_sched_entity *entity);
> >   void drm_sched_entity_destroy(struct drm_sched_entity *entity);
