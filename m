Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D7AEB64DC
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 03:27:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A0C10E178;
	Thu, 15 Jun 2023 03:27:15 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CD010E178
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 03:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686799634; x=1718335634;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WHFRByauZPJilfPbr+jLHTEluo89IeRpgItjNoaB8K8=;
 b=hbmO5ZRlPGhi6YORT2/tV628SG+FeCMEuTsvlNFIEMx6uvxNvo8QdWd/
 N10LcYVvOcfC4n0deknGWZhB9Vs9l9gVP8wSzbnmZFLfe9mCrKCllrD7P
 Defyvx6cXVtsnQiQuH41FYspYKKmqyWzk2kSbsqPCXQyIjFc+ESRPn6FM
 BEqxJcnYC7f6KlNV0Ndy8z9W1/YcaLVXcBRH9XgEz1eUuYHNnDYJmBOTK
 eJ23Pwf3EbLMhFFioqkLX9BnDihmiyqsSbCmUNadCcrjnXbyP0cSmPHf7
 gMoH2CfTfZzcDsmdzKAJ3TXxAIkT9YPg7Rgch0QHoUn9HXPdQnPtiVphu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="348468654"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="348468654"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 20:27:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="706471643"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="706471643"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 14 Jun 2023 20:27:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 20:27:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 20:27:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 14 Jun 2023 20:27:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 14 Jun 2023 20:27:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJCedlIcOuGdBey6fnBR/R58UQJt2NWRBrzigGVe9cgg41VzhIuhFH0esqrrtwPRGhDljSG8WmNEuqi1OO2ijZ2jfdcatGMcD33+i7BBa4s4n4vmhDudAGcY0E0/II7StQvIL1Riz8QIS3HKf9XOAV5c3NcYP8KkYm4xq9DEEE71CedMsa8tQZQNnzOutFd26xS/B0BB60YB7UL0C71PxRrIIrCIVRyt5yNhsJQV480bxGxskeNf9m3KAk3N0NiFyr12+nqmXQpFGah1Ogbfe0i7JfoT7tVDv8VzOh1HkQENaipYChg5eCSHRA+KCxIDY8tKXMb6Qs0QOtE+++UZAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ApAHGyLgmu8RA9FDy3WMcYJa7cuGhIF7zSyX7/DQ7+k=;
 b=A0bjGBO5hPch5lQL9gPwKKICFVMFxbhKYjWkMEEnnukYq2YQxoyJ9dXexb1ERpus0iSVK4cbhkUp92YSgJyIyPqYDqraeMoUKpber9ahOlLux8q8zmnEhEM/nNQtbehdFwqlHcqhbG2UF0zg8cSgUU9gKsRbKTxR/RzRiUj2IF+S+Oy8Nv2Y7bpyHY9UinFeRKrdC+bjSS9onbEzRky8Wub3DHokDyok49cD4gBTPTzmL/rJiyqj3jSuD4EJtgvK0cbZn+MtjWP7XekG1nnOfStLUlvC1CAsnvjrVrroF25MjIisskGc/mfpJaQYGLkYr5dOsGUh03PtPyECRxUI4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 03:27:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6477.037; Thu, 15 Jun 2023
 03:27:03 +0000
Date: Thu, 15 Jun 2023 03:26:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZIqE0U6JyaS34Ujk@DUT025-TGLU.fm.intel.com>
References: <20230607160334.4111289-1-matthew.brost@intel.com>
 <20230607160334.4111289-2-matthew.brost@intel.com>
 <55c6ca62-ae94-10a4-5916-e60b8f2a53e1@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55c6ca62-ae94-10a4-5916-e60b8f2a53e1@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0213.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5309:EE_
X-MS-Office365-Filtering-Correlation-Id: c8fc0df5-dac8-4cc7-9fde-08db6d5062f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n4GE6YBr7DOzOMXRj4yDD6RE9+J1jU/K31iyO/ZETAvPe4mwxP8nORY1xZ1TbtrVEH01CkL9S69RsnQe089GzQS1iChSf0VIGZn0+rQnQPEkxMBhcl547sgvhUrcY0h2flegDjZJGT2hXqW+xhBTjr7mRIDhtmR8r//SUrS4uZ5LPNXEe3EOVlC0824x3kmQFhcImz5z/qaDgK/Je1s9rygEcRjN7Cg3RMalxaRgBSNSygE/mQXEbqoxPggtkUCVTPFFYObqNQ3Ek9MA+mxC5pi1dx5Fh9z+wBlkFZajX6WhtgTY3jrLPMj/dG7Q+Ihc4E7nlYTfy0ts0cnXoXagOI+u/S05NIh/sB6HvcUNLK6SX7/sysh8WigUuF3xKHlFy90G0Ff9eC+tfkOjiFp0UGKScUJpqWRddTB163PqnLu+1ubk87XGl5KZu28cPSF4JU8rai20x9g1dQoLl/0jRk+b4+4uC3HxpxAWodVNlTDBuZxOB7PWJq174xpmolWnIhuDAoD+aFlftF/27fjyib4KXwHSO2t8QQUOZbPI1ulxsBdOghOPMQxeLwSMljJa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199021)(2906002)(86362001)(44832011)(66574015)(6486002)(83380400001)(186003)(26005)(53546011)(6506007)(5660300002)(6512007)(82960400001)(478600001)(66946007)(66476007)(6916009)(4326008)(316002)(38100700002)(66556008)(8676002)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JK2fxmqt1lNigjTp6T3/ZGa3qRjMPf7ERdVCN2jesBf4Y0GJFlrl9VcNJW?=
 =?iso-8859-1?Q?iy+rPSnGpGVDoN3vLcGMmfkRU7iI6vRz2LGcrhWgZKTjXQ+ChZN4w+/YnV?=
 =?iso-8859-1?Q?lVP8S3RgeYD7dlF+ybxCi7CZG+5CAN7BxPWn9sDcQjDrGS7HGuz9wQrQg+?=
 =?iso-8859-1?Q?YHDtG79bP8m0x272OnFsAerUnYT/BU3EhXUQAOraWgcC8m7E9j7xCqRcIr?=
 =?iso-8859-1?Q?cp1cOD4aU6HvN8mKwMOooRnmJsqh+xvgC4aiYRtWVSMkzCQF0xussoE7wO?=
 =?iso-8859-1?Q?zVP/18OswtG64113GAl0f3vYwyb6MOxEy4Feoscx4kJNoQERE8hgkfNL+V?=
 =?iso-8859-1?Q?avXK263plzWINBQEPVwJmi09yqL2ILLXxgmTmejeNtkxJrubmDHqMHGGyF?=
 =?iso-8859-1?Q?YO7NUeuviHcraxpB6poFknAo7sj77pKKWVM5FczLOu9Q67Hgi2gEtO+gn+?=
 =?iso-8859-1?Q?dQwvSU4mr2yrXCYSxtSCKaNFj15UjjyCMz+O9A36uJqEqM1AhBwEzyWTP3?=
 =?iso-8859-1?Q?a0ZiG076CQ/H5sNMsbFb3hqsyvJc/xUP/Y1udPBJXgwHruCeBYEED+1V72?=
 =?iso-8859-1?Q?ntOl0EiimHAHAr/bqkgFoxAyoDFLFuv9RMsIZrGAnLeNMqn11qRfl1Snlv?=
 =?iso-8859-1?Q?8KpYLYxJRr3jlFsz2VAe87gbHpS+ztGTm77mwOQovpacdHnv/WfInj2QnZ?=
 =?iso-8859-1?Q?Pe2oJdRpgrnSxq/cdVfmMShTdtEEDhdgxInC90tZL2LI0KH+UDdLJrM32S?=
 =?iso-8859-1?Q?rQ1BiUWmPG3Rxde9y4bVIFLhnWoDR4YLlDh1mMgI7FgyynjScl5Pd+mrGm?=
 =?iso-8859-1?Q?DP8LCqM0Zo4eam32UdOb9ZcZbzG39rrf3jHzQ58Nn1vu7xkvmCHIGiS5Jw?=
 =?iso-8859-1?Q?xE3M5TBnA0L4zizhW7qcKiq7ZXXovH/9MPUOdoGaupQTvkXKsK96p0MTs8?=
 =?iso-8859-1?Q?YOj/+8FdKk5amz4ZX7rTw7KhZpORRM6pxHUID0VC8dTjXnE3BSSmHE51UO?=
 =?iso-8859-1?Q?yeqk1aEQV99RT7yxc309Gi9WPRvLv80I/PaWvzWe+lUFtC04aLjTWBhbmJ?=
 =?iso-8859-1?Q?3mwV8pfk0v/Yrsa4OcXRgEOig1lL558HyBekkbuNnRI2PhWHXg7LyULYnG?=
 =?iso-8859-1?Q?+fqsfPtWhEBIK1hE4QeN2NqzOPUDh4H/8Ocxh3y8FhCp87grJ/IDvdeEj9?=
 =?iso-8859-1?Q?OSYuib9wtorYDWYLQYkB4DDG1WffZJwq7dIH/+1q8cyLSJJcmmQ3yoUfEo?=
 =?iso-8859-1?Q?MFBN+XZwutQzDJ6Fr9wUQFC5/lRBkQNVY+IBgZ2v4ZyPRXwGESOenzdZ7i?=
 =?iso-8859-1?Q?wDEOYouZLYZJTGAcrImxRX0mNkw9OhoXh1JzUTINcnZnkkQQODriqKvZ+C?=
 =?iso-8859-1?Q?BPSoH2ivQHFRcJdnsGErkRxqgo2cKVdPnK+YFKC138C+XOmeWrYMMOuHok?=
 =?iso-8859-1?Q?Xv7Y/mNCfsv7ZygnhQKJBifFtWpAxm6g6eX9dXzZ1FCKrUw0jcKtbZYV7P?=
 =?iso-8859-1?Q?ILQOkJ4T0K+CpG+I1DAezHIu6dvsES515Ub7micmS6Qe3/quI3P92eJH8s?=
 =?iso-8859-1?Q?SJizs1lLyshxup6x8JWFC9OxTt00KBQv2CDpav/SdVQxDumSCf6rWv22mB?=
 =?iso-8859-1?Q?IZNmVW8REQjm6895mFmvEJKZXxTlEoAdcisql+NfAiBD80r/5q/U1ETQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8fc0df5-dac8-4cc7-9fde-08db6d5062f0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 03:27:03.0362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BL5Z96b1ytCoctQzIu7lL8pnO61wLgfCrLRtphIaRzhpbcJCicsExveYZoQgY2lJTJDslRJUfTgv/1igAJw4SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5309
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 1/8] fixup! drm/sched: Convert drm
 scheduler to use a work queue rather than kthread
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jun 14, 2023 at 10:29:19AM +0200, Thomas Hellström wrote:
> On 6/7/23 18:03, Matthew Brost wrote:
> > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Could we have a description what this fixup is doing and why?
> 
> /Thomas
> 

Idk if that affects the auto-squash, it just created this patch when I
ran the command Rodrigo gave me but yea can add a comment.

Matt

> 
> 
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
> >   drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  2 +-
> >   drivers/gpu/drm/lima/lima_sched.c          |  2 +-
> >   drivers/gpu/drm/msm/msm_ringbuffer.c       |  7 ++++---
> >   drivers/gpu/drm/panfrost/panfrost_job.c    |  2 +-
> >   drivers/gpu/drm/scheduler/sched_main.c     |  4 +++-
> >   drivers/gpu/drm/v3d/v3d_sched.c            | 10 +++++-----
> >   drivers/gpu/drm/xe/xe_devcoredump_types.h  |  1 +
> >   drivers/gpu/drm/xe/xe_execlist.c           |  2 +-
> >   drivers/gpu/drm/xe/xe_guc_submit.c         |  2 +-
> >   include/drm/gpu_scheduler.h                |  1 +
> >   11 files changed, 20 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index 64e7584c5dd2..2e776ece4251 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -2364,7 +2364,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
> >   			break;
> >   		}
> > -		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
> > +		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops, NULL,
> >   				   ring->num_hw_submission, 0,
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
> > index b60199184409..e1cff31f147a 100644
> > --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > @@ -93,9 +93,10 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
> >   	 /* currently managing hangcheck ourselves: */
> >   	sched_timeout = MAX_SCHEDULE_TIMEOUT;
> > -	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
> > -			num_hw_submissions, 0, sched_timeout,
> > -			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
> > +	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
> > +			     num_hw_submissions, 0, sched_timeout,
> > +			     NULL, NULL, to_msm_bo(ring->bo)->name,
> > +			     gpu->dev->dev);
> >   	if (ret) {
> >   		goto fail;
> >   	}
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
> > index db70a57a3a1a..6bc29d509161 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1178,6 +1178,7 @@ static void drm_sched_main(struct work_struct *w)
> >    *
> >    * @sched: scheduler instance
> >    * @ops: backend operations for this scheduler
> > + * @run_wq: workqueue to use for run work. If NULL, the system_wq is used
> >    * @hw_submission: number of hw submissions that can be in flight
> >    * @hang_limit: number of times to allow a job to hang before dropping it
> >    * @timeout: timeout value in jiffies for the scheduler
> > @@ -1191,6 +1192,7 @@ static void drm_sched_main(struct work_struct *w)
> >    */
> >   int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   		   const struct drm_sched_backend_ops *ops,
> > +		   struct workqueue_struct *run_wq,
> >   		   unsigned hw_submission, unsigned hang_limit,
> >   		   long timeout, struct workqueue_struct *timeout_wq,
> >   		   atomic_t *score, const char *name, struct device *dev)
> > @@ -1199,9 +1201,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
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
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > index c0d711eb6ab3..cc3ff3ac47ff 100644
> > --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > @@ -11,6 +11,7 @@
> >   #include "xe_hw_engine_types.h"
> > +struct xe_ct;
> >   struct xe_device;
> >   /**
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> > index 5d2d26e361b9..f0eb8bb277ce 100644
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
> > index b209e4c2a3a9..5c9a6866bd3d 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1064,7 +1064,7 @@ static int guc_engine_init(struct xe_engine *e)
> >   	init_waitqueue_head(&ge->suspend_wait);
> >   	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT : HZ * 5;
> > -	err = drm_sched_init(&ge->sched, &drm_sched_ops,
> > +	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
> >   			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
> >   			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
> >   			     e->name, gt_to_xe(e->gt)->drm.dev);
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 79311df9dd09..419c0446edd7 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -547,6 +547,7 @@ struct drm_gpu_scheduler {
> >   int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   		   const struct drm_sched_backend_ops *ops,
> > +		   struct workqueue_struct *run_wq,
> >   		   uint32_t hw_submission, unsigned hang_limit,
> >   		   long timeout, struct workqueue_struct *timeout_wq,
> >   		   atomic_t *score, const char *name, struct device *dev);
