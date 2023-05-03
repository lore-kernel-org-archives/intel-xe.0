Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53460C77B75
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 15:12:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DF610E2F0;
	Wed,  3 May 2023 15:12:18 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA3B10E2F0
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 15:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683126736; x=1714662736;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OtdYbb2C1AZ36fxM1Ky5/IRxFwr7LvHwqtF4Iibcqdg=;
 b=CANi/3hv/wV3hPeOrc8IZqjJyqHZ+St5xb7UXX1Ndc4BInkosmLsjK8R
 kuP2N8/yezmvPBRy+UkBGjlriSn4ad6TZmMzV0RRG8w+yt3LZD0xUcra6
 rUBanuRFVono2dtFNCeYCtxZTccw7j2PtojMy4Xg3d1jpE0vAeb4pckqO
 WHG71ZY4ui8wsqnpAYTvoDHYgBXIdv2jOlcg56rqyjL3rQSsMPkVxxnIZ
 7hfNQ3zPIWjjNtUR1CtHYaD/KaAaSsq8LHTnGNOfvn/58C7fjM2PuamH8
 PYNp7RDar2ed3T4ZrQJ+cM5BcvuqNog6A1JHKVwGvhuelCQwjeQnPauXN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="333040577"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="333040577"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 08:12:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="786124425"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="786124425"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 03 May 2023 08:12:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 08:12:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 3 May 2023 08:12:14 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 3 May 2023 08:12:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aO5LeelSB0X5IiU3V7OmlzV80VI/7e6ncGgpP70y51SBieWPdxJvLedGLlz6u0R0wyaCC3oG9/Wh8O56YGfzwkePAiiTE5jkChs3nh2JYuDVkCjCmblF/rZ2XnihH/jXAmX0cvhZmoMAJaICHgD2uYBLIjOEmL8bdXmMdlYswv74/ctEG3LAUwHymDvlooZMcm1shIEwE00mbhHM+TrRl+K4+7lcodJmQBcEBQRRwlFUmJ+R3to/7zpBpx4gHLgC0bbTiV8YACsHysXcFYFzD3ooSxCVbSQHucMtv7PdD358abHqh34QJEKLPm4GN1lEmkeY1zYvlo3OVYsiaJTNSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCFy55y2B86VLGSvwqstVk+UIqeA05a/YPli2Vn7hPU=;
 b=a2nEPKtIBKgoAFpgPJz2XdvssP90RrE7fRampQSDuQw6NCtSzAiD0UhM7gAHsyI3bV/zMyK6vqs3FgYt4c3eGJOmHvdYcAIdXVIL0BHDn5HX8bhVFKNsNzTDTm8eXINT18kDmIW+vzz1BDCqFsqbGsLPpE9Ga+m2/QHVH8F1BmFOsGrUcmXlhCE78wXYKgjU+P+JKGDKgb28nbuUdrCphJxxYSpcRaPgn7zgODOHMXLMvIO6ZjUrPDdIwXFVANlcT2z++G0GvVvWH25cCK+76iUb3RXfU+MQ11cyzKGT3ml1LYHW6fW/nhmgoP2JLYYfKDKWifnrmewUqoMJwC2q5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7116.namprd11.prod.outlook.com (2603:10b6:806:29b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Wed, 3 May
 2023 15:12:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6340.030; Wed, 3 May 2023
 15:12:12 +0000
Date: Wed, 3 May 2023 15:11:55 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZFJ5u3kQ0EjeBx/5@DUT025-TGLU.fm.intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-3-matthew.brost@intel.com>
 <fedb615b-f05d-68b0-e1a9-f8aad1ebc955@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fedb615b-f05d-68b0-e1a9-f8aad1ebc955@linux.intel.com>
X-ClientProxiedBy: BYAPR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7116:EE_
X-MS-Office365-Filtering-Correlation-Id: f99c7826-51ff-49b6-bb3e-08db4be8c56a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mGtOcDnkrNKZy6Hau9NYKjlqJ//aJb632+CBOMgi3+bd0I8uvWaxYw+9m83sb+/ueeH0L2rPks0xzjDQ4zxnD4oToD8KXXEn50mzknSmfjd/kCBw14/FdEWDaAqa20xEKB0pePgM1z5ED8acqPy4C0Pn2MJwxBHuOoxyGyPv2dmhII61aoT05I62RMW+LLZZy514xDNY9wLg2nR6s+EjNLsxg5D6BadC9G8e6rt/4RJza8t47J2GM+f6GFAtRSbo3Jan9W8oa+8B3WvUZ3HoPEPfNwexjccmw9UFBQEeKruvythQ0j5zek3+aXKpPHWFC5tQE7ly843jy/SBUAp5nxVWojlLQfWZuJkdTZVHBYmxqrWc+8aoWo2CE+nBGrF98BpQL6Y0agvPijrPdMoOV3E6nNf2xxR/EbAiE0W2zzNBSaiAsx9sbN1c6o3cfQ56kdzCkWHk1QgyMaAlSprseU4yMjZiRoI/gwi3PCcC2u0l1oH3WbUm/ZJxoDV9hIP7PvRxz6oWm4YH3BgamDG5yGAgrJIkj2MzJT8idmeMGrE2gzqBj7a9kN7MZ37+mAb7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199021)(82960400001)(8936002)(8676002)(5660300002)(41300700001)(44832011)(316002)(86362001)(2906002)(30864003)(38100700002)(6506007)(26005)(478600001)(66574015)(53546011)(6512007)(83380400001)(186003)(6666004)(6486002)(6916009)(4326008)(66476007)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hiN9AF+RPBJHEXYYE+l0WdjuSoAgH43PgxLg4b5rJPi4OlJj6bWj4jDp1I?=
 =?iso-8859-1?Q?x/kdkkpZF3S91HosI+kMv1l6mNefzvwhjgxfHVCIhFoQE5e/QbbzKg8Htt?=
 =?iso-8859-1?Q?ViNlTXAe4Ove3DHlzHiOhxatyY5BeLuIsUNyrWr9dKEPMY0An6dNGA83+o?=
 =?iso-8859-1?Q?Wpuc9sWj5mODdhKF4W7Vpn5CMtnmZx3rke2VLrB2SCp/H3m2u3mSOvCbmL?=
 =?iso-8859-1?Q?ABJKPPiqP8i0+0KhuGrtXaAlZCdU2SDj60aGZOPdq1mUFDDkHCxmr0I8k5?=
 =?iso-8859-1?Q?r9Km4XQp1yEmParFyNERcC5bPlsc3qvy1wOB34imwB0F/Eix13gPoe/sHX?=
 =?iso-8859-1?Q?y+4bGRmIHPQCv16oPyO7ypQRDNE0Yh8EQsGFc/k+BTSBnMCTzYUxJaTpbl?=
 =?iso-8859-1?Q?Oa8s7AfPeZMeo0gwlic/vJWRQrbrLz1P42hYKZnw01q+Q3+9tLYLc0MXz2?=
 =?iso-8859-1?Q?CbEcNEOF0qjwJoaSkMnn50hb2EzUGrTueBsrxbytlf0PbednrKxZlNSM5K?=
 =?iso-8859-1?Q?hVHO0z2gqNfSiDBqB8WPq7ZnTu49KVJXp+1JihpVj+ccIdj80QH12F9fb1?=
 =?iso-8859-1?Q?p/cFNQLI2DMJC4o8iLM9fSa89X4fyFFT66h6xLC15CUk6WSTnigcwFl/LW?=
 =?iso-8859-1?Q?IZrbWLSES85Wl559a4+8nY4hIY01qMXzL3aCftpD1jx7O8bRi1u5zSU7X3?=
 =?iso-8859-1?Q?Ph3079rZj7flesCdTZzqB/wS0356AZIx+iaChInSbEjRwpjWEUTD8zXZAv?=
 =?iso-8859-1?Q?uo/tptytOB8RbF3F3MnYNBDTe9U1qZu9/OnR5b44tP36YVh2mnNFTCOFDd?=
 =?iso-8859-1?Q?kDaRXmSWiZCzfC4z33BJhB0d4jLe7dQIHMVqHPy6vvItql4PLihEE4hy7v?=
 =?iso-8859-1?Q?2v5ViC5bn846Cd0h+KqoJyc3swA5018usFtmKCa7kKcbSXy9mZRdF8hftB?=
 =?iso-8859-1?Q?1/omPDSHhapsS7mr/XISrCsOhcUqo+hsfu487P587uYu8RRXL1QruNPgXy?=
 =?iso-8859-1?Q?eaoLT8skJIf7XO7YHo25C0XSMgwtxoRuKTP2pYfvhPKvnrlEChMFnMuxoN?=
 =?iso-8859-1?Q?Z8ifeAj7/fxj12W2m6s0lsCr5ofLbxPPJtVqHiC0aFqhK3YPpcyYllOgW2?=
 =?iso-8859-1?Q?aBsq32h56ik8916MoK64BLk+uSni/Uy4L2UsV5xhOsS4w4m7frTQFnIdiD?=
 =?iso-8859-1?Q?P7sKqyX6dqhStHkP5PVxIrd5HYEcpZdhkj4cP+6oaixZYqiYsNr+Q8H2Km?=
 =?iso-8859-1?Q?IDOgrVth4zynK2Ytht0+mHd6eDRaVbB5HIsd7quZjoFcJArGsbUlVQSHag?=
 =?iso-8859-1?Q?SwR5Y54iL6KMdWt2X4u4YDbQBDyA6iZjzRsFLz8UFfeKAOTWS2mHxkMt7k?=
 =?iso-8859-1?Q?hCx50DX8ChHZB4NPdRzk1hxQbxwCGHhN+5uI3+Oso4TgmQ2DIcSadMpDLk?=
 =?iso-8859-1?Q?orFTYz7Z0iW40PiOCk7vXWCggrhIJMkO8WVlIc23O45buQhBQem54pWOYE?=
 =?iso-8859-1?Q?X7NN/NFeX6dBMsyk3LkktOAuFcQQb14W+/D7TlgdKhm17zbfkPdshdUhgu?=
 =?iso-8859-1?Q?s/YP88IppyyX9u4a9emWm5cvUf/jNjML1l+38DK7Xvha0iGx0fzO1z25g8?=
 =?iso-8859-1?Q?np9MAuJkFvSXdRJjDh/1gpnWDrjVKkKxdz07AS6NaxP3dUEz9qmxpi3g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f99c7826-51ff-49b6-bb3e-08db4be8c56a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:12:12.0833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u9Xs+ovHZs7RGtgzf0xwwDzUbitE8Xz2oJl/JtoV/5TPX3R8vocrEiOC4OpvLxjx9AcJOnLuLxoSHVeaos7iog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7116
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 02/31] drm/sched: Move schedule policy to
 scheduler
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

On Wed, May 03, 2023 at 02:13:15PM +0200, Thomas Hellström wrote:
> 
> On 5/2/23 02:16, Matthew Brost wrote:
> > Rather than a global modparam for scheduling policy, move the scheduling
> > policy to scheduler so user can control each scheduler policy.
> 
> Could you add some more info here, about why this is done and how the
> scheduler policy is supposed to be controlled? Should it say "driver can
> control" rather than "user can control" at this stage+
> 

Rather than a global modparam for scheduling policy, move the scheduling
policy to scheduler so driver can control each scheduler policy. This is
required as it is possible in certain drivers certain scheduling polices
are not allow, thus the driver must set the policy rather than the
modparam.

^^^ How about that?

Again this is a placeholder patch as it should land upstream first.

Matt

> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
> >   drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  3 ++-
> >   drivers/gpu/drm/lima/lima_sched.c          |  3 ++-
> >   drivers/gpu/drm/msm/msm_ringbuffer.c       |  3 ++-
> >   drivers/gpu/drm/panfrost/panfrost_job.c    |  3 ++-
> >   drivers/gpu/drm/scheduler/sched_entity.c   | 24 ++++++++++++++++++----
> >   drivers/gpu/drm/scheduler/sched_main.c     | 21 ++++++++++++++-----
> >   drivers/gpu/drm/v3d/v3d_sched.c            | 15 +++++++++-----
> >   drivers/gpu/drm/xe/xe_execlist.c           |  2 +-
> >   drivers/gpu/drm/xe/xe_guc_submit.c         |  3 ++-
> >   include/drm/gpu_scheduler.h                | 20 ++++++++++++------
> >   11 files changed, 72 insertions(+), 26 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index fe28f6b71fe3..577ea5b98cd5 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -2368,6 +2368,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
> >   				   ring->num_hw_submission, amdgpu_job_hang_limit,
> >   				   timeout, adev->reset_domain->wq,
> >   				   ring->sched_score, ring->name,
> > +				   DRM_SCHED_POLICY_DEFAULT,
> >   				   adev->dev);
> >   		if (r) {
> >   			DRM_ERROR("Failed to create scheduler on ring %s.\n",
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > index 8486a2923f1b..61204a3f8b0b 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > @@ -136,7 +136,8 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
> >   	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
> >   			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
> >   			     msecs_to_jiffies(500), NULL, NULL,
> > -			     dev_name(gpu->dev), gpu->dev);
> > +			     dev_name(gpu->dev), DRM_SCHED_POLICY_DEFAULT,
> > +			     gpu->dev);
> >   	if (ret)
> >   		return ret;
> > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> > index 54f53bece27c..33042ba6ae93 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.c
> > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > @@ -491,7 +491,8 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
> >   	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
> >   			      lima_job_hang_limit,
> >   			      msecs_to_jiffies(timeout), NULL,
> > -			      NULL, name, pipe->ldev->dev);
> > +			      NULL, name, DRM_SCHED_POLICY_DEFAULT,
> > +			      pipe->ldev->dev);
> >   }
> >   void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
> > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > index 5879fc262047..f408a9097315 100644
> > --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > @@ -97,7 +97,8 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
> >   	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
> >   			num_hw_submissions, 0, sched_timeout,
> > -			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
> > +			NULL, NULL, to_msm_bo(ring->bo)->name,
> > +			DRM_SCHED_POLICY_DEFAULT, gpu->dev->dev);
> >   	if (ret) {
> >   		goto fail;
> >   	}
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > index f48b07056a16..effa48b33dce 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -819,7 +819,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
> >   				     nentries, 0,
> >   				     msecs_to_jiffies(JOB_TIMEOUT_MS),
> >   				     pfdev->reset.wq,
> > -				     NULL, "pan_js", pfdev->dev);
> > +				     NULL, "pan_js", DRM_SCHED_POLICY_DEFAULT,
> > +				     pfdev->dev);
> >   		if (ret) {
> >   			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
> >   			goto err_sched;
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> > index 15d04a0ec623..2300b2fc06ab 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -33,6 +33,20 @@
> >   #define to_drm_sched_job(sched_job)		\
> >   		container_of((sched_job), struct drm_sched_job, queue_node)
> > +static bool bad_policies(struct drm_gpu_scheduler **sched_list,
> > +			 unsigned int num_sched_list)
> > +{
> > +	enum drm_sched_policy sched_policy = sched_list[0]->sched_policy;
> > +	unsigned int i;
> > +
> > +	/* All scdedule policies must match */
> s/scdedule/schedule/
> > +	for (i = 1; i < num_sched_list; ++i)
> > +		if (sched_policy != sched_list[i]->sched_policy)
> > +			return true;
> > +
> > +	return false;
> > +}
> > +
> >   /**
> >    * drm_sched_entity_init - Init a context entity used by scheduler when
> >    * submit to HW ring.
> > @@ -62,7 +76,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
> >   			  unsigned int num_sched_list,
> >   			  atomic_t *guilty)
> >   {
> > -	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])))
> > +	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])) ||
> > +	    bad_policies(sched_list, num_sched_list))
> >   		return -EINVAL;
> >   	memset(entity, 0, sizeof(struct drm_sched_entity));
> > @@ -75,8 +90,9 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
> >   	entity->last_scheduled = NULL;
> >   	RB_CLEAR_NODE(&entity->rb_tree_node);
> > -	if(num_sched_list)
> > +	if(num_sched_list) {
> >   		entity->rq = &sched_list[0]->sched_rq[entity->priority];
> > +	}
> Why are brackets added here?
> >   	init_completion(&entity->entity_idle);
> > @@ -440,7 +456,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> >   	 * Update the entity's location in the min heap according to
> >   	 * the timestamp of the next job, if any.
> >   	 */
> > -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
> > +	if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
> >   		struct drm_sched_job *next;
> >   		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> > @@ -528,7 +544,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> >   		drm_sched_rq_add_entity(entity->rq, entity);
> >   		spin_unlock(&entity->rq_lock);
> > -		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> > +		if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO)
> >   			drm_sched_rq_update_fifo(entity, sched_job->submit_ts);
> >   		drm_sched_wakeup(entity->rq->sched);
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index e79b9c760efe..6777a2db554f 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -62,14 +62,14 @@
> >   #define to_drm_sched_job(sched_job)		\
> >   		container_of((sched_job), struct drm_sched_job, queue_node)
> > -int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
> > +int default_drm_sched_policy = DRM_SCHED_POLICY_FIFO;
> >   /**
> >    * DOC: sched_policy (int)
> >    * Used to override default entities scheduling policy in a run queue.
> >    */
> >   MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
> > -module_param_named(sched_policy, drm_sched_policy, int, 0444);
> > +module_param_named(sched_policy, default_drm_sched_policy, int, 0444);
> >   static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
> >   							    const struct rb_node *b)
> > @@ -173,7 +173,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> >   	if (rq->current_entity == entity)
> >   		rq->current_entity = NULL;
> > -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> > +	if (rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO)
> >   		drm_sched_rq_remove_fifo_locked(entity);
> >   	spin_unlock(&rq->lock);
> > @@ -956,7 +956,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> >   	/* Kernel run queue has higher priority than normal run queue*/
> >   	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> > -		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
> > +		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> >   			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
> >   			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
> >   		if (entity)
> > @@ -1190,6 +1190,7 @@ static void drm_sched_main(struct work_struct *w)
> >    *		used
> >    * @score: optional score atomic shared with other schedulers
> >    * @name: name used for debugging
> > + * @sched_policy: schedule policy
> >    * @dev: target &struct device
> >    *
> >    * Return 0 on success, otherwise error code.
> > @@ -1199,9 +1200,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   		   struct workqueue_struct *run_wq,
> >   		   unsigned hw_submission, unsigned hang_limit,
> >   		   long timeout, struct workqueue_struct *timeout_wq,
> > -		   atomic_t *score, const char *name, struct device *dev)
> > +		   atomic_t *score, const char *name,
> > +		   enum drm_sched_policy sched_policy,
> > +		   struct device *dev)
> >   {
> >   	int i;
> > +
> > +	if (sched_policy >= DRM_SCHED_POLICY_COUNT)
> > +		return -EINVAL;
> > +
> >   	sched->ops = ops;
> >   	sched->hw_submission_limit = hw_submission;
> >   	sched->name = name;
> > @@ -1211,6 +1218,10 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   	sched->hang_limit = hang_limit;
> >   	sched->score = score ? score : &sched->_score;
> >   	sched->dev = dev;
> > +	if (sched_policy == DRM_SCHED_POLICY_DEFAULT)
> > +		sched->sched_policy = default_drm_sched_policy;
> > +	else
> > +		sched->sched_policy = sched_policy;
> >   	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
> >   		drm_sched_rq_init(sched, &sched->sched_rq[i]);
> > diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> > index 38e092ea41e6..5e3fe77fa991 100644
> > --- a/drivers/gpu/drm/v3d/v3d_sched.c
> > +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> > @@ -391,7 +391,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   			     &v3d_bin_sched_ops, NULL,
> >   			     hw_jobs_limit, job_hang_limit,
> >   			     msecs_to_jiffies(hang_limit_ms), NULL,
> > -			     NULL, "v3d_bin", v3d->drm.dev);
> > +			     NULL, "v3d_bin", DRM_SCHED_POLICY_DEFAULT,
> > +			     v3d->drm.dev);
> >   	if (ret)
> >   		return ret;
> > @@ -399,7 +400,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   			     &v3d_render_sched_ops, NULL,
> >   			     hw_jobs_limit, job_hang_limit,
> >   			     msecs_to_jiffies(hang_limit_ms), NULL,
> > -			     NULL, "v3d_render", v3d->drm.dev);
> > +			     ULL, "v3d_render", DRM_SCHED_POLICY_DEFAULT,
> > +			     v3d->drm.dev);
> >   	if (ret)
> >   		goto fail;
> > @@ -407,7 +409,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   			     &v3d_tfu_sched_ops, NULL,
> >   			     hw_jobs_limit, job_hang_limit,
> >   			     msecs_to_jiffies(hang_limit_ms), NULL,
> > -			     NULL, "v3d_tfu", v3d->drm.dev);
> > +			     NULL, "v3d_tfu", DRM_SCHED_POLICY_DEFAULT,
> > +			     v3d->drm.dev);
> >   	if (ret)
> >   		goto fail;
> > @@ -416,7 +419,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   				     &v3d_csd_sched_ops, NULL,
> >   				     hw_jobs_limit, job_hang_limit,
> >   				     msecs_to_jiffies(hang_limit_ms), NULL,
> > -				     NULL, "v3d_csd", v3d->drm.dev);
> > +				     NULL, "v3d_csd", DRM_SCHED_POLICY_DEFAULT,
> > +				     v3d->drm.dev);
> >   		if (ret)
> >   			goto fail;
> > @@ -424,7 +428,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   				     &v3d_cache_clean_sched_ops, NULL,
> >   				     hw_jobs_limit, job_hang_limit,
> >   				     msecs_to_jiffies(hang_limit_ms), NULL,
> > -				     NULL, "v3d_cache_clean", v3d->drm.dev);
> > +				     NULL, "v3d_cache_clean",
> > +				     DRM_SCHED_POLICY_DEFAULT, v3d->drm.dev);
> >   		if (ret)
> >   			goto fail;
> >   	}
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> > index d6d60ebf3d5f..48060d14547a 100644
> > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > @@ -339,7 +339,7 @@ static int execlist_engine_init(struct xe_engine *e)
> >   	err = drm_sched_init(&exl->sched, &drm_sched_ops, NULL,
> >   			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
> >   			     XE_SCHED_HANG_LIMIT, XE_SCHED_JOB_TIMEOUT,
> > -			     NULL, NULL, e->hwe->name,
> > +			     NULL, NULL, e->hwe->name, DRM_SCHED_POLICY_DEFAULT,
> >   			     gt_to_xe(e->gt)->drm.dev);
> >   	if (err)
> >   		goto err_free;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 735f31257f3a..9d3fadca43be 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1084,7 +1084,8 @@ static int guc_engine_init(struct xe_engine *e)
> >   	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
> >   			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
> >   			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
> > -			     e->name, gt_to_xe(e->gt)->drm.dev);
> > +			     e->name, DRM_SCHED_POLICY_DEFAULT,
> > +			     gt_to_xe(e->gt)->drm.dev);
> >   	if (err)
> >   		goto err_free;
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 09bc39840dc8..3df801401028 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -63,11 +63,15 @@ enum drm_sched_priority {
> >   	DRM_SCHED_PRIORITY_UNSET = -2
> >   };
> > -/* Used to chose between FIFO and RR jobs scheduling */
> > -extern int drm_sched_policy;
> > -
> > -#define DRM_SCHED_POLICY_RR    0
> > -#define DRM_SCHED_POLICY_FIFO  1
> > +/* Used to chose default scheduling policy*/
> > +extern int default_drm_sched_policy;
> > +
> > +enum drm_sched_policy {
> > +	DRM_SCHED_POLICY_DEFAULT,
> > +	DRM_SCHED_POLICY_RR,
> > +	DRM_SCHED_POLICY_FIFO,
> > +	DRM_SCHED_POLICY_COUNT,
> > +};
> >   /**
> >    * struct drm_sched_entity - A wrapper around a job queue (typically
> > @@ -505,6 +509,7 @@ struct drm_sched_backend_ops {
> >    *              guilty and it will no longer be considered for scheduling.
> >    * @score: score to help loadbalancer pick a idle sched
> >    * @_score: score used when the driver doesn't provide one
> > + * @sched_policy: Schedule policy for scheduler
> >    * @ready: marks if the underlying HW is ready to work
> >    * @free_guilty: A hit to time out handler to free the guilty job.
> >    * @pause_run_wq: pause queuing of @work_run on @run_wq
> > @@ -531,6 +536,7 @@ struct drm_gpu_scheduler {
> >   	int				hang_limit;
> >   	atomic_t                        *score;
> >   	atomic_t                        _score;
> > +	enum drm_sched_policy		sched_policy;
> >   	bool				ready;
> >   	bool				free_guilty;
> >   	bool				pause_run_wq;
> > @@ -542,7 +548,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   		   struct workqueue_struct *run_wq,
> >   		   uint32_t hw_submission, unsigned hang_limit,
> >   		   long timeout, struct workqueue_struct *timeout_wq,
> > -		   atomic_t *score, const char *name, struct device *dev);
> > +		   atomic_t *score, const char *name,
> > +		   enum drm_sched_policy sched_policy,
> > +		   struct device *dev);
> >   void drm_sched_fini(struct drm_gpu_scheduler *sched);
> >   int drm_sched_job_init(struct drm_sched_job *job,
