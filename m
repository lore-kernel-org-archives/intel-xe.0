Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEB0C77B75
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 15:06:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E51110E2E3;
	Wed,  3 May 2023 15:06:51 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD6C10E2E3
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 15:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683126408; x=1714662408;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bEkdM7cjjyPaUAN8XbB/IVg2FCDl99jFT3MkaCs1PII=;
 b=BeeYc/RpvPSuLHew0SNgnJ5I1JTi93Sg0G9ZPmXY7DeUWQwGGiaUSIX3
 w1dQZj0uMYMcK5IrtGRpme9Beuvrs/TuDOiXz66VtqdzYB4J/6lZ0A9Jw
 Rlf70sJG/ujk69mJTVTApclUurAdZ5lDUBcozxr6E2LnveiTIh2znZmZ+
 h2A3CCjHZEriF4lmnCiN6EaQ8kedDgJWupdhWgm367SkzaZyhPQMyw1sU
 iUoS3enRnrt88vOwSJ7Xr+UnQKFtAeTxHlTGtCD6xG0eiRxIMnV//j0G3
 +jiUWd5HtAaFib9QUwBoQ3TwWptC/+u+Az2KnMNmvfcbQQreuHWh6rEeK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="434987855"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="434987855"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 08:06:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="690714894"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="690714894"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 03 May 2023 08:06:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 08:06:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 08:06:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 3 May 2023 08:06:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 3 May 2023 08:06:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2IQQ1hpb8X3CPspTKLxxDj0wjApIR8zlNLYRlFWBpNc9GYUk7aoxnH6+MWmEt6kPyBq2XnjSMtQcTXD3O6xbTbEem/pzt6/Z3Ro4dUNhhE325EaFSayb4pPFUyW5LINlpDSq/yl4wpO8DmYcFj9Ly6atme8cJXpoUo8y4NQvHOKnruS10kP6qOEnVBOwZ5QaF0GwlTqAoqnzgj7rSib55hxLKdWYYQael4zx18qEmd1dOr4btRPR2GQLLv+YWmthKk5iLdPuuY5Xe+9jprQN/NCXYMmg15QaOZ675z6OugaHJxMokh1dFo1e9vqCfhH33j/I4mqcNiOkZkm8Tcprg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2R/IJ1JsNVZ1u93LOS5poAC6o4Z+Hiauhwl9H2XCtYQ=;
 b=ayRVIAybfpQM1Gfcvu2vKsrdtU5LOE+lcRQjbkZ4u12CY+qXU8KjbrCYdW+anV/95PVQWq0XfacG1+HkQg3++PsKbWHQ3auva2L8T60hRwaLnCtQSrF70nzfbZEXZ3mrXtYFzFz6AVBo7R/JurGXRWJe8pxW4fP2IDGPzC1Kcepict6ZT1UJXC1sHi0yfgaweTTwtwyFS0qBaEWrQh5BXhcrO0RElXlniEkoou8GP6Ce2fxfIgbFTMC6ZGPGDuC4HYAnJRHTBbT8QiP3g0BHT6C8YPLwWeJNvfeo3294zR1LUU63i5stLjmoS8gaCa7byRc0WOHdGKWc2i5DJIJMmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8139.namprd11.prod.outlook.com (2603:10b6:610:157::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 15:06:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6340.030; Wed, 3 May 2023
 15:06:23 +0000
Date: Wed, 3 May 2023 15:06:06 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZFJ4XpjSe8X81q1C@DUT025-TGLU.fm.intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-2-matthew.brost@intel.com>
 <7f63b928-6c20-096b-f1c8-0439289c29bd@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f63b928-6c20-096b-f1c8-0439289c29bd@linux.intel.com>
X-ClientProxiedBy: BY5PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8139:EE_
X-MS-Office365-Filtering-Correlation-Id: 90e8e7a3-54d7-46c2-63a7-08db4be7f593
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0fy8Cbbeeku07KNVl99DMe21dbf98KuP35mrjlwjtDDowlyuaygnmtiYWWi0tKV7PTKTCxZvQkLkzOjWuUbeJMl9TGlE+l68Z9FaIDVVLlb4jmyf0psjF6OLWPIlZoqkIbVyZJlhAjjEOgD+fsVESuTbcLJCU8zPPVK4RedJed5Yjj3uvILzTj/AO+JiPPe6gVGS5a1GtHoOnrlsq197mXibRKVc1Bu3Cx/HziEuDTKdtGu6SoIxgJZ9cYFZ8UrlkIUcHRWCp9GrA5EaIF/2jT+xSmByIUPjJR3hjLiMW69VdC4+eFgeGMhW+4up3mV6mHU8uaGVw+A9H4JXv5ZjvAQSAIRRYp3ZcX7bMRiZ6pQkN/yilhdnOOJONXoGKE0dQCm3PfxDCXeUlDPoKai02CQ2J9C64zxjR8EXxkoZS72fzH+F7WgnV+fjCMg7ta+RrPTUg/qESEuL0eHrbFYE7VrrsM4WZGo0zeKBM4v3Z3E1KSvHrRBL+50e68BzXpEjxK87G/MlgeMYgdhNvAMVyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199021)(8676002)(8936002)(966005)(6486002)(6666004)(86362001)(6916009)(4326008)(316002)(41300700001)(66476007)(66556008)(66946007)(82960400001)(5660300002)(478600001)(38100700002)(2906002)(66574015)(83380400001)(6512007)(6506007)(53546011)(186003)(44832011)(66899021)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GIz2HFoPF+Ii7XgYogNKDrzofUGDxoNcxTx+YaaEEtSrHxLmX/nLCUBYOa?=
 =?iso-8859-1?Q?iyYZ/aQrW8ovG75Xyfnr4//SIUSYVJSmz+fScYnzwgR7jygeY68H+ZYqm+?=
 =?iso-8859-1?Q?G/uai3cHWQ+xFlEnU1+GEVwtFc6GUKa82d/4wCmD3zrtk3c3jAVC8NAOd3?=
 =?iso-8859-1?Q?8xV9NSf7lTb0L2RTW50wQwnue5xMLH1RJgcNToGNynmnukq7ZB+3dG+qJS?=
 =?iso-8859-1?Q?7CxV+moSNVWM2sh/A1h+98yD8ceHi7GRS915i7j+3UbuopruRXAT89DXRI?=
 =?iso-8859-1?Q?pgAQMBpBbNbNav7bEZdfcKuK8lFt2N/6CuVSo3Hn/O0j7MigzrUuYWfduH?=
 =?iso-8859-1?Q?2YocrghgIUofghRWZDdPdKrBuhgiNGlwOun5T9o7H/xQt+JDXoplgl7v9P?=
 =?iso-8859-1?Q?3W5NDS914t0whM0/un1gZkuz7SS4FQvRIQVQfHrJ719JxAe361kjrCC9ja?=
 =?iso-8859-1?Q?Ti9luUu2vfYgjsdG2bX1bZ6mCMKcqFuoz5Ph3UYoT68xViz/JDyZWc/iyE?=
 =?iso-8859-1?Q?1LAx05y2R3dZXCLdjO7nJ3uaNJBunZapySWXr5S96J/1o+QO+dfuEmegiU?=
 =?iso-8859-1?Q?eSA+W9Sr34ZwrONYghYGEslmZajeoHmXtB81/GMMXSPXkZXH4GUrmidWYM?=
 =?iso-8859-1?Q?vvpMW51OEyJBVDVaxCnQAsuNUHDd85ZzvgMNcjj2Q3AUaI2KnfNobgyz9X?=
 =?iso-8859-1?Q?kkctasFSUW2KiRIl9N7FmxH3oF6YgrYKXYpy47EqBV6jU5WJJXHPzB6gm8?=
 =?iso-8859-1?Q?hTkT1bqxj3vWRMa3LRdRg2nlEaoc2ob6nAIGvdK09yZFPxoi0TXUvhsCnJ?=
 =?iso-8859-1?Q?TEqzYbQ/SmbklgsSPctT2YGMnVGMPqz2sLVJWdIitx7pROJGraatgQR6it?=
 =?iso-8859-1?Q?GWzhASHruAp9KS72lNZwaBYh1jVTwHB23ETeQ+f3hep2RxNdG+822VjsTD?=
 =?iso-8859-1?Q?XcYr3tlTd0WT2W/pjAvytHYqUg8WkVYbfIUZasvPHnU2Og1wrGYw4a9SZL?=
 =?iso-8859-1?Q?7tjBkhkcvBHD79KGOBuYjbni4/wUiOAOKwN5b0Q22bVrCUYnmU7XYxGA08?=
 =?iso-8859-1?Q?+e/Uq3dCJv86jtIQ/kDiLt18W4nVwBgFCbWEO8CKw0DU82s8rAg46Xtkad?=
 =?iso-8859-1?Q?C5tGbqgSGiazsBvR8ax24sFxotqn6jphkmHdvor5V2bxagcIlLhVV3tYPy?=
 =?iso-8859-1?Q?Vf6vp8QrZ9cEKH49kgENArePQQjhRCGnJIskWNUwBDhWrEfCwassmKJ3cQ?=
 =?iso-8859-1?Q?AbMW5DXzKmXCOOeDVvdhlIZW2Y6x34dvzoF8PRcBTe+PgXgG0pjS8Tq7gx?=
 =?iso-8859-1?Q?nvFzjJ172NbIR0c2IXtvffUDE0gERG7e8dmPalNVO0lNi4eFGVzxboc28V?=
 =?iso-8859-1?Q?WAzVQQaU7Sf/5j5PdEBtWHHmTYfSfMHwRYurslNsf5OqX4Yn/n/FG2D0v4?=
 =?iso-8859-1?Q?+d4HztvouHMBP5pIvj5b7t5Ec3qMoEHTfsA+ec/lWGctbV+wqEFP4Jh5vH?=
 =?iso-8859-1?Q?qMetlZub8q9Ifnkj+iDbYHbkMp7ryxKvqy3rfZdZrNhe5I0Qec+He6iiek?=
 =?iso-8859-1?Q?9Axx69Qibh2mwSQdf5hhyljN8D/0BpE/X/OtWyVlAXZY+LEcjqkVnxtfJJ?=
 =?iso-8859-1?Q?7bZ3X3jRAkDUv2bXN66UYX3TZ5emVUwYZEi/RQATSvG7miO7JfDlGl6g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e8e7a3-54d7-46c2-63a7-08db4be7f593
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:06:23.4553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJE8GuYwGvesZq5+ZVmtMhLULTdFL/b1+zEkNK3ukuFi8LUIp0yrAONO5dZsCrfv0ZAYFJJkNTqsOIq7pm9xDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8139
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 01/31] drm/sched: Add run_wq argument to
 drm_sched_init
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

On Wed, May 03, 2023 at 02:03:49PM +0200, Thomas Hellström wrote:
> Hi,
> 
> On 5/2/23 02:16, Matthew Brost wrote:
> > We will have this argument upstream, lets pull into the Xe repo.
> 
> Please rephrase the commit message. Add explanation, imperative wording and
> remove mentions of the Xe repo (nobody cares about that once it goes
> upstream)
> 
> /Thomas

This patch gets squashed into one eariler in our repo into t upstream
version:
https://patchwork.freedesktop.org/patch/530648/?series=116054&rev=1

Can reword if you think it is a big deal but this is just a placeholder.

Matt
 

> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
> >   drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  2 +-
> >   drivers/gpu/drm/lima/lima_sched.c          |  2 +-
> >   drivers/gpu/drm/msm/msm_ringbuffer.c       |  2 +-
> >   drivers/gpu/drm/panfrost/panfrost_job.c    |  2 +-
> >   drivers/gpu/drm/scheduler/sched_main.c     |  4 +++-
> >   drivers/gpu/drm/v3d/v3d_sched.c            | 10 +++++-----
> >   drivers/gpu/drm/xe/xe_execlist.c           |  2 +-
> >   drivers/gpu/drm/xe/xe_guc_submit.c         |  2 +-
> >   include/drm/gpu_scheduler.h                |  1 +
> >   10 files changed, 16 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index 902f9b5ff82c..fe28f6b71fe3 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -2364,7 +2364,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
> >   			break;
> >   		}
> > -		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
> > +		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops, NULL,
> >   				   ring->num_hw_submission, amdgpu_job_hang_limit,
> >   				   timeout, adev->reset_domain->wq,
> >   				   ring->sched_score, ring->name,
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > index 1ae87dfd19c4..8486a2923f1b 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > @@ -133,7 +133,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
> >   {
> >   	int ret;
> > -	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
> > +	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
> >   			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
> >   			     msecs_to_jiffies(500), NULL, NULL,
> >   			     dev_name(gpu->dev), gpu->dev);
> > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> > index ff003403fbbc..54f53bece27c 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.c
> > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > @@ -488,7 +488,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
> >   	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
> > -	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
> > +	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
> >   			      lima_job_hang_limit,
> >   			      msecs_to_jiffies(timeout), NULL,
> >   			      NULL, name, pipe->ldev->dev);
> > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > index 57a8e9564540..5879fc262047 100644
> > --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > @@ -95,7 +95,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
> >   	 /* currently managing hangcheck ourselves: */
> >   	sched_timeout = MAX_SCHEDULE_TIMEOUT;
> > -	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
> > +	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
> >   			num_hw_submissions, 0, sched_timeout,
> >   			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
> >   	if (ret) {
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > index dbc597ab46fb..f48b07056a16 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -815,7 +815,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
> >   		js->queue[j].fence_context = dma_fence_context_alloc(1);
> >   		ret = drm_sched_init(&js->queue[j].sched,
> > -				     &panfrost_sched_ops,
> > +				     &panfrost_sched_ops, NULL,
> >   				     nentries, 0,
> >   				     msecs_to_jiffies(JOB_TIMEOUT_MS),
> >   				     pfdev->reset.wq,
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index cfd8a838e283..e79b9c760efe 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1182,6 +1182,7 @@ static void drm_sched_main(struct work_struct *w)
> >    *
> >    * @sched: scheduler instance
> >    * @ops: backend operations for this scheduler
> > + * @run_wq: workqueue to use for run work. If NULL, the system_wq is used
> >    * @hw_submission: number of hw submissions that can be in flight
> >    * @hang_limit: number of times to allow a job to hang before dropping it
> >    * @timeout: timeout value in jiffies for the scheduler
> > @@ -1195,6 +1196,7 @@ static void drm_sched_main(struct work_struct *w)
> >    */
> >   int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   		   const struct drm_sched_backend_ops *ops,
> > +		   struct workqueue_struct *run_wq,
> >   		   unsigned hw_submission, unsigned hang_limit,
> >   		   long timeout, struct workqueue_struct *timeout_wq,
> >   		   atomic_t *score, const char *name, struct device *dev)
> > @@ -1203,9 +1205,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   	sched->ops = ops;
> >   	sched->hw_submission_limit = hw_submission;
> >   	sched->name = name;
> > +	sched->run_wq = run_wq ? : system_wq;
> >   	sched->timeout = timeout;
> >   	sched->timeout_wq = timeout_wq ? : system_wq;
> > -	sched->run_wq = system_wq;	/* FIXME: Let user pass this in */
> >   	sched->hang_limit = hang_limit;
> >   	sched->score = score ? score : &sched->_score;
> >   	sched->dev = dev;
> > diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> > index 06238e6d7f5c..38e092ea41e6 100644
> > --- a/drivers/gpu/drm/v3d/v3d_sched.c
> > +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> > @@ -388,7 +388,7 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   	int ret;
> >   	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
> > -			     &v3d_bin_sched_ops,
> > +			     &v3d_bin_sched_ops, NULL,
> >   			     hw_jobs_limit, job_hang_limit,
> >   			     msecs_to_jiffies(hang_limit_ms), NULL,
> >   			     NULL, "v3d_bin", v3d->drm.dev);
> > @@ -396,7 +396,7 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   		return ret;
> >   	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
> > -			     &v3d_render_sched_ops,
> > +			     &v3d_render_sched_ops, NULL,
> >   			     hw_jobs_limit, job_hang_limit,
> >   			     msecs_to_jiffies(hang_limit_ms), NULL,
> >   			     NULL, "v3d_render", v3d->drm.dev);
> > @@ -404,7 +404,7 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   		goto fail;
> >   	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
> > -			     &v3d_tfu_sched_ops,
> > +			     &v3d_tfu_sched_ops, NULL,
> >   			     hw_jobs_limit, job_hang_limit,
> >   			     msecs_to_jiffies(hang_limit_ms), NULL,
> >   			     NULL, "v3d_tfu", v3d->drm.dev);
> > @@ -413,7 +413,7 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   	if (v3d_has_csd(v3d)) {
> >   		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
> > -				     &v3d_csd_sched_ops,
> > +				     &v3d_csd_sched_ops, NULL,
> >   				     hw_jobs_limit, job_hang_limit,
> >   				     msecs_to_jiffies(hang_limit_ms), NULL,
> >   				     NULL, "v3d_csd", v3d->drm.dev);
> > @@ -421,7 +421,7 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   			goto fail;
> >   		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
> > -				     &v3d_cache_clean_sched_ops,
> > +				     &v3d_cache_clean_sched_ops, NULL,
> >   				     hw_jobs_limit, job_hang_limit,
> >   				     msecs_to_jiffies(hang_limit_ms), NULL,
> >   				     NULL, "v3d_cache_clean", v3d->drm.dev);
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> > index de4f0044b211..d6d60ebf3d5f 100644
> > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > @@ -336,7 +336,7 @@ static int execlist_engine_init(struct xe_engine *e)
> >   	exl->engine = e;
> > -	err = drm_sched_init(&exl->sched, &drm_sched_ops,
> > +	err = drm_sched_init(&exl->sched, &drm_sched_ops, NULL,
> >   			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
> >   			     XE_SCHED_HANG_LIMIT, XE_SCHED_JOB_TIMEOUT,
> >   			     NULL, NULL, e->hwe->name,
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index e857013070b9..735f31257f3a 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1081,7 +1081,7 @@ static int guc_engine_init(struct xe_engine *e)
> >   	init_waitqueue_head(&ge->suspend_wait);
> >   	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT : HZ * 5;
> > -	err = drm_sched_init(&ge->sched, &drm_sched_ops,
> > +	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
> >   			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
> >   			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
> >   			     e->name, gt_to_xe(e->gt)->drm.dev);
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index cf85f93218fc..09bc39840dc8 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -539,6 +539,7 @@ struct drm_gpu_scheduler {
> >   int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   		   const struct drm_sched_backend_ops *ops,
> > +		   struct workqueue_struct *run_wq,
> >   		   uint32_t hw_submission, unsigned hang_limit,
> >   		   long timeout, struct workqueue_struct *timeout_wq,
> >   		   atomic_t *score, const char *name, struct device *dev);
