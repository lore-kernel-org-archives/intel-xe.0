Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A590C77B75
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 14:57:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7584210E38C;
	Tue,  9 May 2023 14:57:33 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D36010E38C
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 14:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683644251; x=1715180251;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XhiDa19NXHdCusALrIx/Ne4+qaiCGTJKQXcCS8Veqts=;
 b=PmcDH8mvgcj0wz0BnbvOMeX2fwvCBG+RiQG0Rj4fDN4LCH1hFMN2B5Zr
 hi/W4ifuxAebMhG/NKvW4fF2leKYXNmYBiaeSNqVpgM+kAbp52p4HT5F0
 iE18bHvxZt1PVMwE446EGHSOpSlwLv02rAHm+8qcbExSq7Jk6mEVZOkPV
 lYZ0lYIMJripoPOL7FvbcIsvBfJzNMjDeQSb+fwuJe7kfBkaSLoX1FaTX
 whv/zfiI7QQz5eRf3jpl9VQIfOnGpuqYb59poTpLBJ1C8pDzojTqtuTVb
 EH4xWDv2Mh6YAmZXiNCGxg7jtxXming9UBc2X0zbc+aOeZ1WL3m2hANYL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="348782786"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="348782786"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 07:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="945317476"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="945317476"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 09 May 2023 07:57:28 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 07:57:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 07:57:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 07:57:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LcZXSfHlgDnOvRWcrB1KKlc9nmxpfHmKwemCyBkfErBOCu+4lFeFNn6jv140s6teLQVD+pFoGopoGQOWPT+CZNqwIiboR8aQLGQ5AJ2L8mrzdGUvmjVZHFdB59Q5HblAj+zxw+4YU2zuDWtqyXrkMtt4J3l5zcj1/RFlJxDNfr2WV4/NnMkRW1YtECuNCe+GqpjTBm4RKhbZ8vt6HFEpTeczEf/8LSegZUXjM76vMt9q9ApxFaTZZR3H8WcSDzgkLfDPP87NW3P0TzA/Z3pTwSlWtDp1dqRKaehcyetoQrni6ZcRrxADIj+6uzbQZ8gDztWfAY5UgA/i1lW/PW5oCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FiLAWiH0888Jbbo/kfRalcSDb2bcYem/Cm7EUg/3pmY=;
 b=RZEkLCNs5fYWcXX55NM0BT7jp+qgrvAbk8fBad6h8nz/TUU3TXfitMYJer+P1PCu1IPDKZ6aQiE7+jblhDPCXtEwMz01OYnR8p2XaOjbEc7p0WM3kzY8qfKAxPIjcquFyVUCu5eaySGqJFZ6Sn/QzZaXNEzxyDL3mB8D6iR8ZvI67uXqgJNhv5i0WJIQ50LrhsjZm/t0NUxoeI63yDD0/MfkB6amW4zBnZ6bWMJ9duxnFYNOsxQSRzUUo+CiBjAhrxfkxDi1SxJ54ypVUowpmVE+bJ1uu8eh1jUiWMV0e7hu1pjwkBHrajK68ej86QAxKIAYvM4d5fBLEfzNJeCFIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7672.namprd11.prod.outlook.com (2603:10b6:a03:4cd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 14:57:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 14:57:26 +0000
Date: Tue, 9 May 2023 14:56:51 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZFpfM0cvsd76A+tY@DUT025-TGLU.fm.intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-6-matthew.brost@intel.com>
 <90b4e835-c21a-f9b3-4b22-aa59c911f54f@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90b4e835-c21a-f9b3-4b22-aa59c911f54f@linux.intel.com>
X-ClientProxiedBy: BY5PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7672:EE_
X-MS-Office365-Filtering-Correlation-Id: c3927ebf-835e-404b-0c2b-08db509db388
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eEsaozshY+8yLv7Wa29BiddWhCaqJdowDzeQ1ExMRZTJblbGPJ65FxJxojIcM4Tg3hTa31wQdD3XOonfgauxKsjB4/OeIdLRB7Gu/MtDMmNbH1xwv1EI8yKZtjHotoU63IsJLE4ahg9ug12HkOSf0i2SEBX2+4uZ/H0Fhpgz9qxjGmJS4eTTgNrqQoOhmiQqmGIOtsPjzGe1X2Hg536mBi/NhLQJqVI+MEDY3ZEMu30chwGLVbuHbXe7IQW0HbYcFsXo+cyFBeV4t4NwJ+D3JFmYaSzlCyP92rdsy341mqGBpMSQNPGhi9PsEx2XNqQDu+jZBxFa4B6lGViraKm8KP5N2eLXJHjUZW7wDdgixGVSVztZ73IU0w5hqWFMhq7GgWtGyt2zHvaplpCzojWsWDoYVQ7IkgzRO2bP/Wu7bM8lDqFJtIRsisMU5URILFuBCgMk7rddYy2GVIqd7zSDfWpDic6SyQMW+anTwBxItS1vVYyFFIkZa3L24VT37TtdDaEGLx1ZocP+vwzzw+NCvVitX3INY8qjOqouprKZLhabVGiQvI3TbSR3fNnNRqnbxuGTsfSRqSN7DWxldzRdypD07v7+Q6Xuj+Tm5++5JbQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199021)(6666004)(6916009)(478600001)(66556008)(4326008)(6486002)(66946007)(66476007)(316002)(86362001)(83380400001)(66574015)(26005)(53546011)(6506007)(6512007)(8936002)(8676002)(2906002)(30864003)(41300700001)(5660300002)(38100700002)(186003)(82960400001)(44832011)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0dVM+GpdHuHKP3w43lwxaM5BH+oAQS+i45OFKJ/iBYtlnfRHEQDtQr2cgu?=
 =?iso-8859-1?Q?YA9DE54l7L8msRkJN+9j5fPpA2z2QYKJEoVNcL5NYjbuFpuKNIQ3VyaqK3?=
 =?iso-8859-1?Q?IIv+f66pM6pJi0TKpJhBVU6Gfm+Xsc7uRYrixug+LkLjFljkBOUI9vs76w?=
 =?iso-8859-1?Q?Xvw/HA5KuUL8fUawnE2pxUtRlmRHIPIvDNamzG9kkVKbYjguIprXWLn6Eg?=
 =?iso-8859-1?Q?2otdJYehb4ig6xhQdZC3n5Xl+t1i50Dfk34egxUPto/RbZWGvGjjZMoIE0?=
 =?iso-8859-1?Q?wADXt4qsWdXbYp4xyNzMR9XsnEVKBhQVef2XBj3s4j1Y+5ebvGG9MMGeoy?=
 =?iso-8859-1?Q?9vGR2IgrvPHl4kI2CtkPxMWDpPb+sXfM+SdC0WOwMngcuSUnt6iJCLlcML?=
 =?iso-8859-1?Q?0z77er8hnw3WKZqbH9FP3DmQXIuqlbNg1ztfOEhUpXMJ9MO6YhOLNswvOf?=
 =?iso-8859-1?Q?VogNh6H0qXWNizq5pPcVVlVHxzyGSElFPWBJ47YIwVEPGjOk6QTr9mJJsZ?=
 =?iso-8859-1?Q?sBjLK0dcPAmsH6et5BKebfezwglIija371p7HRd5Vd9ExLvYckyrvlCq+O?=
 =?iso-8859-1?Q?NURia2OUskcdmzxKAfG/UcaNlme3RQkqvV5oLNfXQW0dhyug8K5rHEMkzg?=
 =?iso-8859-1?Q?HLtRLBRe/bVFxTSzKHb/KLeJPH6KpzPxI20tpF7Qo/3cGu48yaBgLfD7vu?=
 =?iso-8859-1?Q?dTXENmGCOrvJm/AgF6EhprgtgAk8q9XrzfP3T4oJwgqnGmQJIjbuQipGni?=
 =?iso-8859-1?Q?51ohA8LXyTD8hb88SoYf5Si1jGI5qKT1W8NoD8sjacyaLCl6zrABLcv3ws?=
 =?iso-8859-1?Q?X6V58IrfX7zx8QjoFSAFRe+Wu5rXezWy0lvncNshl00uPbr/a1P+cm/Iy+?=
 =?iso-8859-1?Q?7UstFG7VR86aGHuVUI/lYL1bhhQV4zRcFdpYY/unz6C04L5/f/J9J5p5yz?=
 =?iso-8859-1?Q?LW4MjPBvOoWRL25yDTil44FxUCVymmyhqOF/S3fiVhwQ3gIwUl9L7PfdSr?=
 =?iso-8859-1?Q?+Gvsv0ps3zREQKtN1e9BjKFsyS5fINJr8Fs1HXAtsAzU7ard9z26+SpJnb?=
 =?iso-8859-1?Q?IRGG4E5aueIVeg5gUjq4J8bxf8XEnkXHMTHu9Oq2H2u47YzdLFyCvx4cTt?=
 =?iso-8859-1?Q?fsPv/1UNifEBiPQpTiw/AMAEU/gPo/bgWQuFM4moXC3EMDOD96du80B3Ih?=
 =?iso-8859-1?Q?Rgsj3MN3KuVxhX3x2GyYqI10fJ6t7HfnbjMJBL/Eyylikf+J4wgewnDDpc?=
 =?iso-8859-1?Q?VzueMdRfXhPU30EfB6pr2gLhbNlezw/HKl1bj5jQLObCrzwAkp7qf6yH7D?=
 =?iso-8859-1?Q?6SXYnbsOA3Deda2xHDXnKxRa8ZdAULYl8HgGUKFab+iknzrRVTQuqwb8fD?=
 =?iso-8859-1?Q?aaY6RnnIMyVMDK5rb0cOJqs8BKbSx00p9qvwaP4TouwijmpDeaId3yuTAc?=
 =?iso-8859-1?Q?J8vQZdGQ+QBnA2vn+ZxEaTGiG8cIi8qG22NkCSamBiNCyDZj3e1pPL2y/7?=
 =?iso-8859-1?Q?tvkuKL6yA8vjtlfPa+piXaeAErm2ENNcxiTMKq2CC1t7zmexMGh4aDohh/?=
 =?iso-8859-1?Q?gSubzZLI1Iu4vusu1H/EtbLzdFmlquQB64LHfnrfdWnx67j37YRtQAtFJF?=
 =?iso-8859-1?Q?E/f+eGXyuox/TEM7sT9tgYk26gQf1QedhdoqjHqprGkHCImLAr0WREEw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3927ebf-835e-404b-0c2b-08db509db388
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 14:57:26.1415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pRhWWnHhyUP5dYUbnQKwnZe1yLXfdmdvFm+coz2/jdCJcUI0EGepnb8r2iOVWl9aGYpZ2R/fFdZUZ0CnzQamQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7672
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 05/31] drm/xe: Long running job update
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

On Mon, May 08, 2023 at 03:14:10PM +0200, Thomas Hellström wrote:
> Hi, Matthew
> 
> In addition to Rodrigo's comments:
> 
> On 5/2/23 02:17, Matthew Brost wrote:
> > Flow control + write ring in exec, return NULL in run_job, siganl
> > xe_hw_fence immediately, and override TDR for LR jobs.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_engine.c           | 32 ++++++++
> >   drivers/gpu/drm/xe/xe_engine.h           |  4 +
> >   drivers/gpu/drm/xe/xe_exec.c             |  8 ++
> >   drivers/gpu/drm/xe/xe_guc_engine_types.h |  2 +
> >   drivers/gpu/drm/xe/xe_guc_submit.c       | 95 +++++++++++++++++++++---
> >   drivers/gpu/drm/xe/xe_trace.h            |  5 ++
> >   6 files changed, 137 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> > index 094ec17d3004..d1e84d7adbd4 100644
> > --- a/drivers/gpu/drm/xe/xe_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_engine.c
> > @@ -18,6 +18,7 @@
> >   #include "xe_macros.h"
> >   #include "xe_migrate.h"
> >   #include "xe_pm.h"
> > +#include "xe_ring_ops_types.h"
> >   #include "xe_trace.h"
> >   #include "xe_vm.h"
> > @@ -673,6 +674,37 @@ static void engine_kill_compute(struct xe_engine *e)
> >   	up_write(&e->vm->lock);
> >   }
> > +/**
> > + * xe_engine_is_lr() - Whether an engine is long-running
> > + * @e: The engine
> > + *
> > + * Return: True if the engine is long-running, false otherwise.
> > + */
> > +bool xe_engine_is_lr(struct xe_engine *e)
> > +{
> > +	return e->vm && xe_vm_no_dma_fences(e->vm) &&
> > +		!(e->flags & ENGINE_FLAG_VM);
> > +}
> > +
> > +static s32 xe_engine_num_job_inflight(struct xe_engine *e)
> > +{
> > +	return e->lrc->fence_ctx.next_seqno - xe_lrc_seqno(e->lrc) - 1;
> > +}
> > +
> > +/**
> > + * xe_engine_ring_full() - Whether an engine's ring is full
> > + * @e: The engine
> > + *
> > + * Return: True if the engine's ring is full, false otherwise.
> > + */
> > +bool xe_engine_ring_full(struct xe_engine *e)
> > +{
> > +	struct xe_lrc *lrc = e->lrc;
> > +	s32 max_job = lrc->ring.size / MAX_JOB_SIZE_BYTES;
> > +
> > +	return xe_engine_num_job_inflight(e) >= max_job;
> > +}
> > +
> >   /**
> >    * xe_engine_is_idle() - Whether an engine is idle.
> >    * @engine: The engine
> > diff --git a/drivers/gpu/drm/xe/xe_engine.h b/drivers/gpu/drm/xe/xe_engine.h
> > index a49cf2ab405e..2e60f6d90226 100644
> > --- a/drivers/gpu/drm/xe/xe_engine.h
> > +++ b/drivers/gpu/drm/xe/xe_engine.h
> > @@ -42,6 +42,10 @@ static inline bool xe_engine_is_parallel(struct xe_engine *engine)
> >   	return engine->width > 1;
> >   }
> > +bool xe_engine_is_lr(struct xe_engine *e);
> > +
> > +bool xe_engine_ring_full(struct xe_engine *e);
> > +
> >   bool xe_engine_is_idle(struct xe_engine *engine);
> >   void xe_engine_kill(struct xe_engine *e);
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index ea869f2452ef..44ea9bcd0066 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -13,6 +13,7 @@
> >   #include "xe_device.h"
> >   #include "xe_engine.h"
> >   #include "xe_macros.h"
> > +#include "xe_ring_ops_types.h"
> >   #include "xe_sched_job.h"
> >   #include "xe_sync.h"
> >   #include "xe_vm.h"
> > @@ -277,6 +278,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   		goto err_engine_end;
> >   	}
> > +	if (xe_engine_is_lr(engine) && xe_engine_ring_full(engine)) {
> > +		err = -EWOULDBLOCK;
> > +		goto err_engine_end;
> > +	}
> > +
> >   	job = xe_sched_job_create(engine, xe_engine_is_parallel(engine) ?
> >   				  addresses : &args->address);
> >   	if (IS_ERR(job)) {
> > @@ -363,6 +369,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   		xe_sync_entry_signal(&syncs[i], job,
> >   				     &job->drm.s_fence->finished);
> > +	if (xe_engine_is_lr(engine))
> > +		engine->ring_ops->emit_job(job);
> >   	xe_sched_job_push(job);
> >   	xe_vm_reactivate_rebind(vm);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_types.h b/drivers/gpu/drm/xe/xe_guc_engine_types.h
> > index cbfb13026ec1..5d83132034a6 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_engine_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_engine_types.h
> > @@ -31,6 +31,8 @@ struct xe_guc_engine {
> >   	 */
> >   #define MAX_STATIC_MSG_TYPE	3
> >   	struct drm_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
> > +	/** @lr_tdr: long running TDR worker */
> > +	struct work_struct lr_tdr;
> >   	/** @fini_async: do final fini async from this worker */
> >   	struct work_struct fini_async;
> >   	/** @resume_time: time of last resume */
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 68d09e7a4cc0..0a41f5d04f6d 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -500,6 +500,14 @@ static void register_engine(struct xe_engine *e)
> >   		parallel_write(xe, map, wq_desc.wq_status, WQ_STATUS_ACTIVE);
> >   	}
> > +	/*
> > +	 * We must keep a reference for LR engines if engine is registered with
> > +	 * the GuC as jobs signal immediately and can't destroy an engine if the
> > +	 * GuC has a reference to it.
> > +	 */
> > +	if (xe_engine_is_lr(e))
> > +		xe_engine_get(e);
> > +
> >   	set_engine_registered(e);
> >   	trace_xe_engine_register(e);
> >   	if (xe_engine_is_parallel(e))
> > @@ -662,6 +670,7 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
> >   {
> >   	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> >   	struct xe_engine *e = job->engine;
> > +	bool lr = xe_engine_is_lr(e);
> >   	XE_BUG_ON((engine_destroyed(e) || engine_pending_disable(e)) &&
> >   		  !engine_banned(e) && !engine_suspended(e));
> > @@ -671,14 +680,19 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
> >   	if (!engine_killed_or_banned(e) && !xe_sched_job_is_error(job)) {
> >   		if (!engine_registered(e))
> >   			register_engine(e);
> > -		e->ring_ops->emit_job(job);
> > +		if (!lr)	/* Written in IOCTL */
> 
> Hmm? What does "Written in IOCTL mean?" Could you rephrase to something more
> descriptive?
> 

"LR jos are emitted in the IOCTL"

Does that work?

Matt

> > +			e->ring_ops->emit_job(job);
> >   		submit_engine(e);
> >   	}
> > -	if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags))
> > +	if (lr) {
> > +		xe_sched_job_set_error(job, -ENOTSUPP);
> > +		return NULL;
> > +	} else if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags)) {
> >   		return job->fence;
> > -	else
> > +	} else {
> >   		return dma_fence_get(job->fence);
> > +	}
> >   }
> >   static void guc_engine_free_job(struct drm_sched_job *drm_job)
> > @@ -782,6 +796,57 @@ static void simple_error_capture(struct xe_engine *e)
> >   }
> >   #endif
> > +static void xe_guc_engine_trigger_cleanup(struct xe_engine *e)
> > +{
> > +	struct xe_guc *guc = engine_to_guc(e);
> > +
> > +	if (xe_engine_is_lr(e))
> > +		queue_work(guc_to_gt(guc)->ordered_wq, &e->guc->lr_tdr);
> > +	else
> > +		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > +}
> > +
> > +static void xe_guc_engine_lr_cleanup(struct work_struct *w)
> > +{
> > +	struct xe_guc_engine *ge =
> > +		container_of(w, struct xe_guc_engine, lr_tdr);
> > +	struct xe_engine *e = ge->engine;
> > +	struct drm_gpu_scheduler *sched = &ge->sched;
> > +
> > +	XE_BUG_ON(!xe_engine_is_lr(e));
> > +	trace_xe_engine_lr_cleanup(e);
> > +
> > +	/* Kill the run_job / process_msg entry points */
> > +	drm_sched_run_wq_stop(sched);
> > +
> > +	/* Engine state now stable, disable scheduling / deregister if needed */
> > +	if (engine_registered(e)) {
> > +		struct xe_guc *guc = engine_to_guc(e);
> > +		int ret;
> > +
> > +		set_engine_banned(e);
> > +		xe_engine_get(e);
> > +		disable_scheduling_deregister(guc, e);
> > +
> > +		/*
> > +		 * Must wait for scheduling to be disabled before signalling
> > +		 * any fences, if GT broken the GT reset code should signal us.
> > +		 */
> > +		smp_rmb();
> 
> wait_event() paired with wake_up() family of functions typically set the
> necessary barriers to make sure anything written prior to wake_up() is seen
> in wait_event(). So that smp_rmb() is most likely not needed. If it still
> is, its pairing smp_wmb() should be documented and pointed to as well. See
> documentation of set_current_state() vs __set_current_state().
> 
> > +		ret = wait_event_timeout(guc->ct.wq,
> > +					 !engine_pending_disable(e) ||
> > +					 guc_read_stopped(guc), HZ * 5);
> > +		if (!ret) {
> > +			XE_WARN_ON("Schedule disable failed to respond");
> > +			drm_sched_run_wq_start(sched);
> > +			xe_gt_reset_async(e->gt);
> > +			return;
> > +		}
> > +	}
> > +
> > +	drm_sched_run_wq_start(sched);
> > +}
> > +
> >   static enum drm_gpu_sched_stat
> >   guc_engine_timedout_job(struct drm_sched_job *drm_job)
> >   {
> > @@ -832,7 +897,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
> >   			err = -EIO;
> >   		set_engine_banned(e);
> >   		xe_engine_get(e);
> > -		disable_scheduling_deregister(engine_to_guc(e), e);
> > +		disable_scheduling_deregister(guc, e);
> >   		/*
> >   		 * Must wait for scheduling to be disabled before signalling
> > @@ -865,7 +930,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
> >   	 */
> >   	list_add(&drm_job->list, &sched->pending_list);
> >   	drm_sched_run_wq_start(sched);
> > -	drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > +	xe_guc_engine_trigger_cleanup(e);
> >   	/* Mark all outstanding jobs as bad, thus completing them */
> >   	spin_lock(&sched->job_list_lock);
> > @@ -889,6 +954,8 @@ static void __guc_engine_fini_async(struct work_struct *w)
> >   	trace_xe_engine_destroy(e);
> > +	if (xe_engine_is_lr(e))
> > +		cancel_work_sync(&ge->lr_tdr);
> >   	if (e->flags & ENGINE_FLAG_PERSISTENT)
> >   		xe_device_remove_persistent_engines(gt_to_xe(e->gt), e);
> >   	release_guc_id(guc, e);
> > @@ -906,7 +973,7 @@ static void guc_engine_fini_async(struct xe_engine *e)
> >   	bool kernel = e->flags & ENGINE_FLAG_KERNEL;
> >   	INIT_WORK(&e->guc->fini_async, __guc_engine_fini_async);
> > -	queue_work(system_unbound_wq, &e->guc->fini_async);
> > +	queue_work(system_wq, &e->guc->fini_async);
> >   	/* We must block on kernel engines so slabs are empty on driver unload */
> >   	if (kernel) {
> > @@ -1089,12 +1156,16 @@ static int guc_engine_init(struct xe_engine *e)
> >   	if (err)
> >   		goto err_free;
> > +
> 
> Unrelated whitespace?
> 
> 
> >   	sched = &ge->sched;
> >   	err = drm_sched_entity_init(&ge->entity, DRM_SCHED_PRIORITY_NORMAL,
> >   				    &sched, 1, NULL);
> >   	if (err)
> >   		goto err_sched;
> > +	if (xe_engine_is_lr(e))
> > +		INIT_WORK(&e->guc->lr_tdr, xe_guc_engine_lr_cleanup);
> > +
> >   	mutex_lock(&guc->submission_state.lock);
> >   	err = alloc_guc_id(guc, e);
> > @@ -1146,7 +1217,7 @@ static void guc_engine_kill(struct xe_engine *e)
> >   {
> >   	trace_xe_engine_kill(e);
> >   	set_engine_killed(e);
> > -	drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > +	xe_guc_engine_trigger_cleanup(e);
> >   }
> >   static void guc_engine_add_msg(struct xe_engine *e, struct drm_sched_msg *msg,
> > @@ -1296,6 +1367,9 @@ static void guc_engine_stop(struct xe_guc *guc, struct xe_engine *e)
> >   	/* Stop scheduling + flush any DRM scheduler operations */
> >   	drm_sched_run_wq_stop(sched);
> > +	if (engine_registered(e) && xe_engine_is_lr(e))
> > +		xe_engine_put(e);
> > +
> >   	/* Clean up lost G2H + reset engine state */
> >   	if (engine_destroyed(e) && engine_registered(e)) {
> >   		if (engine_banned(e))
> > @@ -1520,6 +1594,9 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >   	trace_xe_engine_deregister_done(e);
> >   	clear_engine_registered(e);
> > +	if (xe_engine_is_lr(e))
> > +		xe_engine_put(e);
> > +
> >   	if (engine_banned(e))
> >   		xe_engine_put(e);
> >   	else
> > @@ -1557,7 +1634,7 @@ int xe_guc_engine_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >   	 */
> >   	set_engine_reset(e);
> >   	if (!engine_banned(e))
> > -		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > +		xe_guc_engine_trigger_cleanup(e);
> >   	return 0;
> >   }
> > @@ -1584,7 +1661,7 @@ int xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> >   	/* Treat the same as engine reset */
> >   	set_engine_reset(e);
> >   	if (!engine_banned(e))
> > -		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > +		xe_guc_engine_trigger_cleanup(e);
> >   	return 0;
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > index 2f8eb7ebe9a7..02861c26e145 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -219,6 +219,11 @@ DEFINE_EVENT(xe_engine, xe_engine_resubmit,
> >   	     TP_ARGS(e)
> >   );
> > +DEFINE_EVENT(xe_engine, xe_engine_lr_cleanup,
> > +	     TP_PROTO(struct xe_engine *e),
> > +	     TP_ARGS(e)
> > +);
> > +
> >   DECLARE_EVENT_CLASS(xe_sched_job,
> >   		    TP_PROTO(struct xe_sched_job *job),
> >   		    TP_ARGS(job),
> 
