Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB48EDE9AC
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F82510E141;
	Tue, 10 Sep 2024 18:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P8XFmO4y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2914510E141
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725991279; x=1757527279;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9V2ed7uFVfFQz6Ca/HM4m6f0LPPnnmVMloOw1FEp6Rk=;
 b=P8XFmO4yXGI3/MWaumJwv5i1z0kvSE47cTZbh6h4Z42uioVc3KIicSLA
 0ornqJPUs+DcJB2qgFU01dX9jvIneLqYVbomIyaPP50ghR1C4p1aQnLpT
 /rAHSMleECPBMQqPkj/jzD7LMULhtEIdZDuiY3v1i274U7abGc9eC/JAY
 DlaT6RGT7nO0FkBiJg5E+Qk6FvS8R7/YpauUN+Wwy/McehX0JBJFNhDQG
 7DKJNUSFfd3JsqFBJZcgWJESR2PS/dX4b8eiU1j5irt0UCzDkV3npy/Gw
 DnaCCv9HD4Ll78r3YcI4/ADhdypsT1lqpedKJ03Nu+HS2jV6P5N5qKOGL A==;
X-CSE-ConnectionGUID: 0TzNfU7MTgifD2JvjJfUgA==
X-CSE-MsgGUID: Jqj1yJeWT3aBz9tO0rIYEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24861989"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="24861989"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:01:11 -0700
X-CSE-ConnectionGUID: HPC176N3SVuLgrdRJn3XWg==
X-CSE-MsgGUID: 9c3HC492S5SOKeZK8DYdNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="67349931"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:01:10 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:01:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:01:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:01:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqOmu5jGCGF7T9gWZWLNdITJUVDJcxOPFuI98IQcFmUpEKyYUy+8jTkxvHNOT2OdljIz8GAvOQqZuoB5f5sP+rGeBfu8196l/l5ebZji0gRYXdilblBc8HG0zpdxFv8KkpbYnYwRa//Isr2ekfowMZ33HxUktGi8ppMPO0wMD1NhlaqIL6m4wEXaXqCOe2RH2mIlviZ5pcG1+Rb4i3/AW78D6fIgZEK4Z8yUYQMVUsbB1QSUk+Dq8+t2TmLS7h3Kv9gD20qdEb560iRP6c5GT/hrY4PRJLpKbShS1v/vHa3hB1He+bNB61cPq0If9oV2a/xsn0J2PyF753kdp5mW1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qz2M6okd/ulyEMqyAtJFyikNH67Ce495AOdY0C4Mo18=;
 b=SaF1VwXAjwyUJ1mAHdwgPvjPkmCEgtaSyDOj4CFBt834vpi/kEBpp6zfAlKFhwqqrz5nhjWe70t7AOH3rV+/bIf0u6MxmnjDJoo004CXSRi6VZrlkkbw7sCHLjXHSy6JpQuVa9t7Y1Js/BTy0/7010GT5c1fQfhMt/O0JHQkGX4X9EgmdZ1bZm5n4YBMwyT4+fcF6OW25CTYZcLTk3bRiXHHs7BJH4pfFhM5rrT0M2/bsSl4D9IRibyjGxhNXO4DybS96lPMf8gRvx+Yft8O09NRVGWNg9JbCujUweM9kAiEaeCXJH0HRZ+tgj2krORStXq5XXY27DKv7Falu/A/0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ2PR11MB8497.namprd11.prod.outlook.com (2603:10b6:a03:57b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.18; Tue, 10 Sep
 2024 18:01:07 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:01:07 +0000
Date: Tue, 10 Sep 2024 17:58:51 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/xe: Flush all page faults when closing a VM
Message-ID: <ZuCI2/yNNSNZPYLr@DUT025-TGLU.fm.intel.com>
References: <20240909223225.665761-1-matthew.brost@intel.com>
 <20240909223225.665761-2-matthew.brost@intel.com>
 <adc25f0b-c960-4e9f-927e-4ae8c786f9a0@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <adc25f0b-c960-4e9f-927e-4ae8c786f9a0@intel.com>
X-ClientProxiedBy: BY5PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::25) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ2PR11MB8497:EE_
X-MS-Office365-Filtering-Correlation-Id: edba2410-e598-4bc7-f8c2-08dcd1c28b32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qw+hVeJ6fd4hkxCT4u0LJ8mBoYTtxP6yiV/EzfQSqtR7oKdQj+GjZJS584JI?=
 =?us-ascii?Q?j46267B54tVJarybXHROM+bLREcualHK8uuYTDf9+OmEbGIXhcU3XxnNFXK1?=
 =?us-ascii?Q?av3aN4bsrfGEzHBq9nCBZeCOR/K0L3x+8eg9aWBv1QkKA17kGlyVf4NhJCo9?=
 =?us-ascii?Q?nAYhYDrZS7jN+FO+083ZkavcORPRU0QmHqf/Bmf/8ke6/IQBo6g7ioXFain8?=
 =?us-ascii?Q?mObervFDWartuLczAlJldX2Sg2JYvahX0PnomfmVLD9vcWlrOOW+W7HjPJm2?=
 =?us-ascii?Q?1/jcXyfV7diptesMTaFd0onWEcrznLKSZ18DfIftGkGeNPpkpbnH31hVh5/p?=
 =?us-ascii?Q?xqkdXqD0nV5HjfvGF50KHSzfYbqsjdadPpeW+3AiMteDeQsTE7sJjjm46dgk?=
 =?us-ascii?Q?fawCSTJzAgTlAQtaUg98WVVZvnXhwmQXEFmYBdRW9JuCawaT/StkyYdQABmc?=
 =?us-ascii?Q?TPlyGki4VDjcf+o6mvL/aHUw9niRNPwgRBW8nKCPjt9WdyK61ax4pZW8gr2e?=
 =?us-ascii?Q?+8Pl/Z1jV5tz9u0R3ji6AWPNvQonxXLPFs9SSFd7o+yjjV8i4KWA+SbwLxjl?=
 =?us-ascii?Q?vmoH8lXh5TjQd3EKPhIFtfdtRLCv0J/jQFHVy/uSP/ru5cXN5J4VfyakNdWZ?=
 =?us-ascii?Q?lOit5UVEuJ3A9nE2gmyQN/5Pd88h/WYhkYtBuoO8uYyzAOHpjtxuGe8IK3Bc?=
 =?us-ascii?Q?NPprf4sCqv04VbzqWfhrTR59hZf338EdUkY4eL86PM5d2V40GJNltuEriAS6?=
 =?us-ascii?Q?zkc083XwSKN8T4Awc2xBsdOVqS0mXUGoYL5ntVTZG+qmirl6VltdAb+aLTsk?=
 =?us-ascii?Q?V4tmmwgaC7ieFcVbxzQqhm7YjblA28pOFyatA9kieatNa+55O5BuR1oshcBx?=
 =?us-ascii?Q?l5crg3yj0CzIHpgg/8S+cq2xzjoHXUA4VtStb42OoxS77IL/lOBoWSAcWPQr?=
 =?us-ascii?Q?xOrQBZJW/eCaOIHe9NSlPo21syZmmmCYedt7UkKq5vz9xB6Z6pvT8mckb4YR?=
 =?us-ascii?Q?XAKaQE6a/H3YjFzVtZ+T/Deh7DRWZScyLEH7Vvdww35OIvo2wz95GgDySAit?=
 =?us-ascii?Q?jmAZnoyT+IDwysgGPCb4s8GBJS9GrZZmRhgwSbvsKURuIfQxvMpHoFJhd8Jk?=
 =?us-ascii?Q?Y+tN1TgkkugjyL3a8W2KZpHJnr+98xrqCB2VNQ4CsqDMl6Cp5Kb8vmmo1MRN?=
 =?us-ascii?Q?iOVIhg8t6fe+Sz12tnnUZLIEnjvvJ/UhVQaKLc67CSou452i42hfD3QTCkaZ?=
 =?us-ascii?Q?G504ood63BOuwoF5nhiBBWrnMS6k2T9370UvRqfxCB/or8krDC2A5ctyLEgc?=
 =?us-ascii?Q?mv4BVx0QuL4Htra2vwJ+8bwRpjut6iUKijD5x+d+h+DAaA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ytoEpTazKFUO8Kkp02STcAF428cBpGGYbcaEbxmRRe22WF0105j+9EKIsVdJ?=
 =?us-ascii?Q?Ekgn9LxYSKA/fOffg8tleY9iMT49yGuo4g28BnObcycOgMbUxWYRnb1M33Sg?=
 =?us-ascii?Q?63vUnnWjm3X1pdUkcd5hhZALQi2yzu91OXhPcKMO/GqG2BzZQhB3Iv1wN1RM?=
 =?us-ascii?Q?vuZ5+jxkYKatMCVCzEH83IFsIrYAOPh1uNiNXuAiyqS6wnz84zAJ+Gh0db6F?=
 =?us-ascii?Q?Z608rHg/qDW5Ty2qCJhxVL3t6r5ToxDB7sBjUnzWCpqPrgYcjpfmVroXgyfl?=
 =?us-ascii?Q?PZiWKG7VjQP8dlNoRv5Ts/L+Kzsb9Z0lSfIhgSi/NiLPraJPNB0plpZcg66/?=
 =?us-ascii?Q?jewOWRWavyUHykayfvS7Tl0/CXQ39UOIwnJEkI7B6r9QSSJBXzfhC/Vez2kC?=
 =?us-ascii?Q?ejNtenTiJ+AWod50bA44lJcMbMT46/9Y4d/zasoamkwYCAcNjChN+AZ02a+H?=
 =?us-ascii?Q?6vl3N49LPdUv1yDTH2H2QiohQ8jEEOYM3sZdTwUYD3Ns1LdfwEk40LCqqqie?=
 =?us-ascii?Q?ps2Xngn8/awCEFCnAO+Qzi0XF3Rmg4zFaj4+TnCP/adLOg3r0VMXRPuX2wv2?=
 =?us-ascii?Q?qskia+ShVAw0t1Uq1vEpCblFhQJqe1OOPEdqJzaSGF6s/TvnxSHERuEWe2wu?=
 =?us-ascii?Q?ACu1+g0jzBJAljRQUlLP8uO/GJxtJzGavHsj77mxAC7vH1qjoNayJeK2r+ET?=
 =?us-ascii?Q?218Drr3++gJmLEcUrMsw9qMwq3ORyxpexBx8UqOeNWlbQYDxPI4Bm58++5Yc?=
 =?us-ascii?Q?mmC/uSpRrn0cnlDDSbOVeF4jn2lafp7u/zk/ES/o7AED13S89w/lXdA8hdoe?=
 =?us-ascii?Q?CGkerXSPGLrU0iFY/0DX4dtBpiY7oG8dqxHIImaTIvC6rsPRR631KqeZe+tO?=
 =?us-ascii?Q?y5exzj06Pzno7m0OPcSVuLzr++qG4HCkTVbrlh4PMVDJWBU2uCBBXsqcCcPq?=
 =?us-ascii?Q?KzqqC3JVG4MNU0h/2zWnZ892XENpcLzn1QqoGkXf7FTXtJP0N94mB+r6jjFS?=
 =?us-ascii?Q?qOvLUglsyc+J7NrR61F+7QPZbYFka4/9ptv+OKObw+0pyVE/LBCxmUqLfwfc?=
 =?us-ascii?Q?1rtkHF0iNptuBL/NipK8Y+RaG/QV/1Dyr+pF0DwPwmu8HU1Czl0vKnYRLdzA?=
 =?us-ascii?Q?Gcq2t9nqoUmGyE9lLIm/fDORWYozhOTHCXJSGlY5Js3DHA+4LnM4UE1+9F2H?=
 =?us-ascii?Q?K6fBuZ49SHp/09R5fcb7c9jmmrYTuFRUFZo1htiugcbhFTXU3hdYBjPAq+0l?=
 =?us-ascii?Q?I+kR6I3LIxubAzswn0s0rraUWWM2KVZhvUi8bXZPLVPssbqzksM7elmxmcaY?=
 =?us-ascii?Q?Shw3I+B43UU5otWhcZMp5KPiYXjKl35i0r4VsGrXU2V2LZ+f7BzQdcbAYa7y?=
 =?us-ascii?Q?pfiQpXo90bMw5h35iV1flkCaHP4/pKbbNDNMq+AaqLD0YTB+hQQmoTFRLaX1?=
 =?us-ascii?Q?4pHCOlX8n0zoOHC62q1/Lpz9rIlgyx2Ok093gz09Y6twA6SqpvRPLNA/Ew/F?=
 =?us-ascii?Q?iScu/B6e1nuZNGi40na0ubbAJPm7Sej/ngX7s7phSor33mGlnXa75ufFoIvj?=
 =?us-ascii?Q?Un8DRcOMkeazc1iHeds0nwuMsccplADPjyGzxwbZWKYX6yc6FXnXwY5e6qUd?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edba2410-e598-4bc7-f8c2-08dcd1c28b32
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:01:07.1572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: liS0zpe4vGfd4rnXGsYpZHcPxrjBUnJYx2szL3vp+7YdufPTYkKlPtNSBd0MflnVYzmMyjgKmPiXs7nZ01Is1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8497
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

On Tue, Sep 10, 2024 at 01:39:41PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 10-09-2024 04:02, Matthew Brost wrote:
> > Ensure all page faults on VM are done when closing a VM before removing
> > page table memory.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt_pagefault.c | 15 +++++++++++++++
> >   drivers/gpu/drm/xe/xe_gt_pagefault.h |  2 ++
> >   drivers/gpu/drm/xe/xe_vm.c           |  7 +++++++
> >   3 files changed, 24 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index 730eec07795e..2dd7065ce54a 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -304,6 +304,21 @@ static bool pf_queue_full(struct pf_queue *pf_queue)
> >   		PF_MSG_LEN_DW;
> >   }
> > +/**
> > + * xe_gt_pagefault_flush() - Flush page faults for a VM
> > + * @gt: the GT object
> > + * @vm: the VM objecy
> > + *
> > + * Ensure all page faults per GT and VM pair are done executing.
> > + */
> > +void xe_gt_pagefault_flush(struct xe_gt *gt, struct xe_vm *vm)
> > +{
> > +	struct pf_queue *pf_queue = gt->usm.pf_queue +
> > +		(vm->usm.asid % NUM_PF_QUEUE);
> > +
> > +	flush_work(&pf_queue->worker);
> 
> 
> wont this mean we will be delaying vm kill till pf worker is executed for
> other vm's using same pf queue ?
> 

Yes. Realized after I sent this we can just check for closed in PF
handler under the vm->lock. Let me just do that.

Matt

> 
> > +}
> > +
> >   int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >   {
> >   	struct xe_gt *gt = guc_to_gt(guc);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.h b/drivers/gpu/drm/xe/xe_gt_pagefault.h
> > index 839c065a5e4c..9f4166617f04 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.h
> > @@ -10,8 +10,10 @@
> >   struct xe_gt;
> >   struct xe_guc;
> > +struct xe_vm;
> >   int xe_gt_pagefault_init(struct xe_gt *gt);
> > +void xe_gt_pagefault_flush(struct xe_gt *gt, struct xe_vm *vm);
> >   void xe_gt_pagefault_reset(struct xe_gt *gt);
> >   int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len);
> >   int xe_guc_access_counter_notify_handler(struct xe_guc *guc, u32 *msg, u32 len);
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 7acd5fc9d032..5139a731ae79 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1543,6 +1543,13 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> >   	xe_vm_close(vm);
> >   	if (xe_vm_in_preempt_fence_mode(vm))
> >   		flush_work(&vm->preempt.rebind_work);
> > +	if (xe_vm_in_fault_mode(vm)) {
> > +		struct xe_gt *gt;
> > +
> > +		/* Stop all async faults */
> > +		for_each_gt(gt, xe, id)
> > +			xe_gt_pagefault_flush(gt, vm);
> > +	}
> >   	down_write(&vm->lock);
> >   	for_each_tile(tile, xe, id) {
