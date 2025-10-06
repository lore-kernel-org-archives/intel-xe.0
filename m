Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF09FCAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 15:54:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A93A10E36D;
	Mon,  6 Oct 2025 15:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T4oin6zv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA12510E36D
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 15:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759766067; x=1791302067;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=J58HA8Y8N/GQZE2UmR7ZFrzSNZ9eOlPmB9f1QQcqGM0=;
 b=T4oin6zvwPvdpXH8af1AhOcPr/RSIuWt06gTDohf3DcA/VUbbJr4IFQ7
 gGPC6kfL5K7MlB2I4aDWhEZnB6n4t1RsfFqkW4fE/KnrRnS8FftL3XSSu
 7k154ByrhrJYQ3igy7Q9Mt/A3HdmheY5bLYa20LGcdZ/Z0n75jUsFUTGD
 1nrAUydZEpcS62UDzNpLAsXqzoYD2Jp20gCjGzCU7JfD41qHnCKoW+JDu
 HEPryRIxxlxD5/xH8C07c0Hh+eNyxk2kgzYP/qZ2HZg+O4finBOnNc1yZ
 fjqb8fpdFPYDIUcfKTuS7jIKKlwN/HDs6EzpqsJ1ZntJaScCkXA6gd0bG Q==;
X-CSE-ConnectionGUID: qocngj4cRu6f4I4UwXHjkw==
X-CSE-MsgGUID: JTacYoZARymRsLiyastazg==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="72556564"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="72556564"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 08:54:26 -0700
X-CSE-ConnectionGUID: /CUCcFk3QpCqajU6W+ZPjw==
X-CSE-MsgGUID: XjbUla+MSfWl94giBVt3/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="179728415"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 08:54:25 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 08:54:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 08:54:24 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.18) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 08:54:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNUrwNECpGwU6f/iru6Z/pR7QAU5QazsjIBuW3AS+h57sst3hSyPyInJgDJitgyUQLyIUmaUQKmYhIfTyWf0gqpfdC/uWt6y7i2Yh43DbTPODsNMfJ2Jc/EWOhosF5UpB8Z+1MyRhQa069zHpcTi9O5Gv8xDk8HlInNGmYGmaXpONBn69h/mhR3vU2e6b/kFZF6ackqJdUmIPxpLeaSuEuXHegHof6tVZsMT9FKRr4E41QownB2VUlx71ICX8zz8yVCr+SuVV+KeZnKYQ2NoJOKVFDC6wZskulrQ5OSpdJVwwmlu2ucECxxkqNIZpDimq4cykcAzGDi8bjJ+K8drug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dLlRitfLfIzFa4eaS4yyt1iaORDLt/vjIsUhcvr7i7U=;
 b=GdViwqa9E8P4o/JTFMDE7oF5egaIdPLtdlQQQPsZXwD3msDWqH5lEMepcvFCWqeMG7exNBkQS3SGWWUUItqMAE++C3xQJauUr58f8TtHcN1OdN4Q6G3uA3wsquAT5N6CbRXdoamFE6bgVnaH+bve1FsOMjD1GRWsXA/wpCuVY2gkhrdtZm2ULgFjtLQjarZ23wGDX99CkmF4XAkmBB/QJBOAqjlrwkPZtKOWSvvvZKavwkQMd2u2aE/ItEKAPqazrVSUqaIkXx0tinkYH/QSHT9pIEE4Nn5tqq0fINa21jQrefB+ceMtiecq4EPHLziF0OOD6n0hPaLDiY7WtpYFwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6915.namprd11.prod.outlook.com (2603:10b6:930:59::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Mon, 6 Oct
 2025 15:54:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 15:54:18 +0000
Date: Mon, 6 Oct 2025 08:54:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 14/30] drm/xe/vf: Wakeup in GuC backend on VF post
 migration recovery
Message-ID: <aOPmJ/U1TRvoTXP0@lstrano-desk.jf.intel.com>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
 <20251006111038.2234860-15-matthew.brost@intel.com>
 <94961e87-1826-4059-bb81-b79073074ea8@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <94961e87-1826-4059-bb81-b79073074ea8@intel.com>
X-ClientProxiedBy: BY5PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6667e7-0bfa-4443-5979-08de04f09b8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m+hpHJSxi6wl3SK0QyTFoizvmbu8w1qO+hIyAWAUU4eyyyRCXMIoZJYeayD6?=
 =?us-ascii?Q?5iUXNjk0XSiJTOt1V8En+zol75iXucOG2agSSL1D5G/jE+yVdnb42mMX0zJa?=
 =?us-ascii?Q?yJ3zgQjdHiDml1JPBSB+BsWnNX7hu1gTk9IJzUV2xyQ4/CG9SmjBKX9IAqiv?=
 =?us-ascii?Q?yFZUSyOQU+dOJeAc09saUhggaVy/M0gr+tgfhllSIwlrHTu9JKYSsxxRs7re?=
 =?us-ascii?Q?bJ0xsN/7JZ3fJTV1Z13Nj5j7yENEhZ7AW42cAM+nvtJg3EjkJKAwVSZTL8mv?=
 =?us-ascii?Q?44X8rHxyBSeRdxO7D/5GLNinAxWd5zNr+/9lcHZ/6wtxj0pHK9+dgyC6idQx?=
 =?us-ascii?Q?kU9hlhaXuZB5xlNn2LDiRZdaZ0oXVMNj08Y7quuc2f6TAZG/ls3W8ld5RG+4?=
 =?us-ascii?Q?IySdXqeX4SmXIx7wB2mjObMHTj5iryGndmyYQ3u8s/2+mHULqaPOkk8dHl+g?=
 =?us-ascii?Q?HwfWFPGKdLKBFXSS3yaxNdha0bao8o0NdOSFvbT8mXHLjohdw9Ivht2bn9zq?=
 =?us-ascii?Q?nvHbB1Xq7LpkSay/JyRKR/o3p1NGUVib3j2idgOb1nE8WPTbBxMHZww3/FFz?=
 =?us-ascii?Q?HmNbkVedymmXRdtNrqHLzJL+tnLiaBOtSXXRwAnfe+cKBweATKbUBKxgpna1?=
 =?us-ascii?Q?Ke+YkjjdCqr31Srh5rdgjtYrgNYu3Zfq3O9X/dtTWP3NfzQx1pn/PEiBpNRq?=
 =?us-ascii?Q?uKctoV1Ya4Yayhks/E2ni53o3XX2c7urXrpKhUn4ZhvZQB24Vv7VMt4fmeae?=
 =?us-ascii?Q?O1CBfweQrzi1J/bgq8t7u/dW6TynDmuP4Dx77mp7L2pq6GzV8q9R+aMpH8PU?=
 =?us-ascii?Q?+TMNucxoOG79D4Czplo3E/3z7libW2PH+68bYj2nKGRUSCAEdf75FEMXm6KV?=
 =?us-ascii?Q?ynvckbjGSlQzce6H9y9PzBPo9Z7HxLUvFnGYCyA7SQfXLaRcxyufjkZ3YMxh?=
 =?us-ascii?Q?H6hjka53UP35Su5EcRNxwlEeH92FUZ/7PbbCyJHFfNLrFq+XzebhAB0M0tiY?=
 =?us-ascii?Q?CR0YJx1zP/kk1Im8sDGczrODseLJACftkmq9T4OyWDpEL1pkvGM2ZBrAdjoB?=
 =?us-ascii?Q?foCoDchI4X7lnmocYV690494eN94HV6OA84Z3VWhw5IvEKc0EITabxfDRbIm?=
 =?us-ascii?Q?M7HtoQjImtsS7v4wTOYc9zKIA/b5VmS0AdVeeERVBjPC8uyL5Vf+wrnNiz6X?=
 =?us-ascii?Q?xXBTwllhSbnyqdgO0FoiHuzTYwGM6VdxsoYboMb0xqK5/A1Lf11HlvQ5OiPn?=
 =?us-ascii?Q?7c1dR4kHSHk53uspy5ldjFAf5GBfMoY8/W1oqiL59I6r4VKVy5nOky45xEOa?=
 =?us-ascii?Q?NhvvAVyINqGbwjgE2Fv+bSUS3VIGYsyrWxpQFzHEZWzq6heQBIm6PalZebgS?=
 =?us-ascii?Q?PbJG70l8wU6YIOhfMlnSNT1C+J54Nhv54BOzajwXaGpAnyt7XySFnjbbvvKe?=
 =?us-ascii?Q?yDxPYhmfJM99nwy/LedVIMPQu8AUUE5N?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4kfZa2SMrdqfEeVk5Um4ukti9SOM0Wi4NABDBZPLVvd7GyMNg1FM3DXTJZmi?=
 =?us-ascii?Q?hDYmYFF75j/OTE2mLEDZzG1xjQ8S0vokzpE5D89YvxEysGZ7/PSdKAwHeN8Z?=
 =?us-ascii?Q?NVz3PASHisHT2j9/o/EERghxq92fmRwASXegiHR6PMVGFfTZj8kED6ocLg0r?=
 =?us-ascii?Q?YMzVB65erwdT838dcf1/mOk5SscZES8QtYCu7D345F2laYCsofLGkra49OvC?=
 =?us-ascii?Q?STXGGmR4et31ukAj2zpw2XVeppLZaaF1vFphbT2Qi1MOLf2JaTEkLuxsrlNI?=
 =?us-ascii?Q?UEl1OSQw2qpqo57QxjvNTDxTYrx4xZRC94Td+LSluMQblDe+kqLQ2OSJicgA?=
 =?us-ascii?Q?Wwu6aGS2IU1i28APsV5NkY4Bq1iQpqar/fK4ycJgYn7VzaxcUIe04dHFUQkO?=
 =?us-ascii?Q?tmuSrtYMn2GbMBxmzY4yPOpInkhOeNZO02X/VuyvdkOdklcNCUH3fk/Lr4TO?=
 =?us-ascii?Q?6H+0HmSGN2VRXBZR9DrBJ6fjZizZ5U1Kl6ZcV6Gq6kQ5udqtsCx6vJ/c1BRK?=
 =?us-ascii?Q?w5tUE0wQye2Y6Fi7uvXVZKF5Y6DYHTpZWE0x/QnO4cGo5bj/rvLVAGs/RKB9?=
 =?us-ascii?Q?xw90VO2bxA3PuP6vjd4k3uDe6kDjB4WHIYgCT7q8qQX6RWBAUIvWAQX9mX7e?=
 =?us-ascii?Q?twmrgG4YCTSELnNd+40XuYH7tKK0X6qMoqvw6InLntfXWNbvP6AGlcw4U+Px?=
 =?us-ascii?Q?e5j2moT5EMI8WJ4UA2pD/RfnT/kTnIYnJje3pznZny26p3mdAndiNgbbsYTQ?=
 =?us-ascii?Q?0TGraAbBP0nEqXCGo/2rP4Za87bcPfO3DgbhhlvgnauZX23+Tg8u3H7dfXzB?=
 =?us-ascii?Q?3vCSZMmZqDanXJ4oqeyLaGyOynzvHuNbrJhFRhk6Xmnxy7yV/FBmNFRc6FOa?=
 =?us-ascii?Q?9x3g8vbsY0P8fwN7WY75O9zkgL77AqwAkS9tDsUIeY9OpA0xuFirwX47H/G8?=
 =?us-ascii?Q?wSv+yUdGdqNHAt5zjIBJl480dWqoFlIeK/94xXNteRBUJl6A5goCk2OMt8ND?=
 =?us-ascii?Q?Uc7xXynzOEQ1LeevbNRFDF03ZgZxL1ZVclCoJhpLYOCNjGWi1pgppJubmc84?=
 =?us-ascii?Q?jXK77glSFHz3FhiNuSESN25zdLnYQRAYrLDbr+VUYEe9vF9c6b8zp0cX+M0v?=
 =?us-ascii?Q?R1NXleTwNN1M646EyLEDduwa0F4JpEilGrnuQC97dDHmTPaEeDEW68xfjC3O?=
 =?us-ascii?Q?ySeFNS/6bg3rsIo4ipLfzMEdR6Wz0+wNPg9hImxiJYhijt6xmyV3/+06S4lo?=
 =?us-ascii?Q?xrqmDKplrimAc5TQsp43gHJwJn+n4T/qbiDHGbpj86h/Ba3mWo4d0fMqe1gj?=
 =?us-ascii?Q?HkFSvKWV0AGOfmplmFjFYqhvNmuLnZD06hLBVHknDclnWxfpteoyqtYSTJCy?=
 =?us-ascii?Q?agnLOuileg73tGyPIbstou7cLvUcVdzr7fZ0cyjaf/gNALFZ6Rd7rp5+KT3r?=
 =?us-ascii?Q?z3UhXk0XIeVLJ1f3rh6SS5ll8Sg2SNj/9Rl+Q7tNe+opatnkXLEhOttCDWKE?=
 =?us-ascii?Q?rPDwwb2l5LtY3PvN4OCFP3pneQt2P/vz8NPht0mj0d+QLtbqR37J/ltTxz9y?=
 =?us-ascii?Q?htUh4DYJaQSyHDvCP6AgbDXEulMqeruzolEWg9slv48ko3mm+u5xjoOX+GYu?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6667e7-0bfa-4443-5979-08de04f09b8b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 15:54:18.5515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OKnwRsRaYqSAkG2tYl4KbREAC56FAt1uArHUfdRNpQLUHT7lvhTYSlflrOzyvPz/dHd1e2lACKCHL6GFT7Fb7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6915
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

On Mon, Oct 06, 2025 at 04:35:51PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/6/2025 1:10 PM, Matthew Brost wrote:
> > If VF post-migration recovery is in progress, the recovery flow will
> > rebuild all GuC submission state. In this case, exit all waiters to
> > ensure that submission queue scheduling can also be paused. Avoid taking
> > any adverse actions after aborting the wait.
> > 
> > As part of waking up the GuC backend, suspend_wait can now return
> > -EAGAIN indicating the waiter should be retried. If the caller is
> > running on work item, that work item need to be requeued to avoid a
> > deadlock for the work item blocking the VF migration recovery work item.
> > 
> > v3:
> >  - Don't block in preempt fence work queue as this can interfere with VF
> >    post-migration work queue scheduling leading to deadlock (Testing)
> >  - Use xe_gt_recovery_inprogress (Michal)
> > v5:
> >  - Use static function for vf_recovery (Michal)
> >  - Add helper to wake CT waiters (Michal)
> >  - Move some code to following patch (Michal)
> >  - Adjust commit message to explain suspend_wait returning -EAGAIN (Michal)
> >  - Add kernel doc to suspend_wait around returning -EAGAIN
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 +
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c      |  4 ++
> >  drivers/gpu/drm/xe/xe_guc_ct.h           |  9 +++
> >  drivers/gpu/drm/xe/xe_guc_submit.c       | 82 ++++++++++++++++++------
> >  drivers/gpu/drm/xe/xe_preempt_fence.c    | 11 ++++
> >  5 files changed, 88 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index 27b76cf9da89..282505fa1377 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -207,6 +207,9 @@ struct xe_exec_queue_ops {
> >  	 * call after suspend. In dma-fencing path thus must return within a
> >  	 * reasonable amount of time. -ETIME return shall indicate an error
> >  	 * waiting for suspend resulting in associated VM getting killed.
> > +	 * -EAGAIN return indicates the wait should be tried again, if the wait
> > +	 * is within a work item, the work item should be requeued as deadlock
> > +	 * avoidance mechanism.
> >  	 */
> >  	int (*suspend_wait)(struct xe_exec_queue *q);
> >  	/**
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 7057260175f3..7f703336d692 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -23,6 +23,7 @@
> >  #include "xe_gt_sriov_vf.h"
> >  #include "xe_gt_sriov_vf_types.h"
> >  #include "xe_guc.h"
> > +#include "xe_guc_ct.h"
> >  #include "xe_guc_hxg_helpers.h"
> >  #include "xe_guc_relay.h"
> >  #include "xe_guc_submit.h"
> > @@ -743,6 +744,9 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
> >  	    !gt->sriov.vf.migration.recovery_teardown) {
> >  		gt->sriov.vf.migration.recovery_queued = true;
> >  		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> > +		smp_wmb();	/* Ensure above write visable before wake */
> > +
> > +		xe_guc_ct_wake_waiters(&gt->uc.guc.ct);
> >  
> >  		started = queue_work(gt->ordered_wq, &gt->sriov.vf.migration.worker);
> >  		xe_gt_sriov_info(gt, "VF migration recovery %s\n", started ?
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > index d6c81325a76c..ca0ec938edac 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > @@ -72,4 +72,13 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
> >  
> >  long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct);
> >  
> > +/**
> > + * xe_guc_ct_wake_waiters() - GuC CT wake up waiters
> > + * @guc: GuC CT object
> > + */
> > +static inline void xe_guc_ct_wake_waiters(struct xe_guc_ct *ct)
> > +{
> > +	wake_up_all(&ct->wq);
> > +}
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 59371b7cc8a4..b2ca4911efe9 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -27,7 +27,6 @@
> >  #include "xe_gt.h"
> >  #include "xe_gt_clock.h"
> >  #include "xe_gt_printk.h"
> > -#include "xe_gt_sriov_vf.h"
> >  #include "xe_guc.h"
> >  #include "xe_guc_capture.h"
> >  #include "xe_guc_ct.h"
> > @@ -702,6 +701,11 @@ static u32 wq_space_until_wrap(struct xe_exec_queue *q)
> >  	return (WQ_SIZE - q->guc->wqi_tail);
> >  }
> >  
> > +static bool vf_recovery(struct xe_guc *guc)
> > +{
> > +	return xe_gt_recovery_pending(guc_to_gt(guc));
> > +}
> > +
> >  static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
> >  {
> >  	struct xe_guc *guc = exec_queue_to_guc(q);
> > @@ -711,7 +715,7 @@ static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
> >  
> >  #define AVAILABLE_SPACE \
> >  	CIRC_SPACE(q->guc->wqi_tail, q->guc->wqi_head, WQ_SIZE)
> > -	if (wqi_size > AVAILABLE_SPACE) {
> > +	if (wqi_size > AVAILABLE_SPACE && !vf_recovery(guc)) {
> >  try_again:
> >  		q->guc->wqi_head = parallel_read(xe, map, wq_desc.head);
> >  		if (wqi_size > AVAILABLE_SPACE) {
> > @@ -910,9 +914,10 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
> >  	ret = wait_event_timeout(guc->ct.wq,
> >  				 (!exec_queue_pending_enable(q) &&
> >  				  !exec_queue_pending_disable(q)) ||
> > -					 xe_guc_read_stopped(guc),
> > +					 xe_guc_read_stopped(guc) ||
> > +					 vf_recovery(guc),
> >  				 HZ * 5);
> > -	if (!ret) {
> > +	if (!ret && !vf_recovery(guc)) {
> >  		struct xe_gpu_scheduler *sched = &q->guc->sched;
> >  
> >  		xe_gt_warn(q->gt, "Pending enable/disable failed to respond\n");
> > @@ -1015,6 +1020,10 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> >  	bool wedged = false;
> >  
> >  	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
> > +
> > +	if (vf_recovery(guc))
> > +		return;
> > +
> >  	trace_xe_exec_queue_lr_cleanup(q);
> >  
> >  	if (!exec_queue_killed(q))
> > @@ -1047,7 +1056,11 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> >  		 */
> >  		ret = wait_event_timeout(guc->ct.wq,
> >  					 !exec_queue_pending_disable(q) ||
> > -					 xe_guc_read_stopped(guc), HZ * 5);
> > +					 xe_guc_read_stopped(guc) ||
> > +					 vf_recovery(guc), HZ * 5);
> > +		if (vf_recovery(guc))
> > +			return;
> > +
> >  		if (!ret) {
> >  			xe_gt_warn(q->gt, "Schedule disable failed to respond, guc_id=%d\n",
> >  				   q->guc->id);
> > @@ -1137,8 +1150,9 @@ static void enable_scheduling(struct xe_exec_queue *q)
> >  
> >  	ret = wait_event_timeout(guc->ct.wq,
> >  				 !exec_queue_pending_enable(q) ||
> > -				 xe_guc_read_stopped(guc), HZ * 5);
> > -	if (!ret || xe_guc_read_stopped(guc)) {
> > +				 xe_guc_read_stopped(guc) ||
> > +				 vf_recovery(guc), HZ * 5);
> > +	if ((!ret && !vf_recovery(guc)) || xe_guc_read_stopped(guc)) {
> >  		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
> >  		set_exec_queue_banned(q);
> >  		xe_gt_reset_async(q->gt);
> > @@ -1209,7 +1223,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  	 * list so job can be freed and kick scheduler ensuring free job is not
> >  	 * lost.
> >  	 */
> > -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags))
> > +	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags) ||
> > +	    vf_recovery(guc))
> >  		return DRM_GPU_SCHED_STAT_NO_HANG;
> >  
> >  	/* Kill the run_job entry point */
> > @@ -1261,7 +1276,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  			ret = wait_event_timeout(guc->ct.wq,
> >  						 (!exec_queue_pending_enable(q) &&
> >  						  !exec_queue_pending_disable(q)) ||
> > -						 xe_guc_read_stopped(guc), HZ * 5);
> > +						 xe_guc_read_stopped(guc) ||
> > +						 vf_recovery(guc), HZ * 5);
> > +			if (vf_recovery(guc))
> > +				goto handle_vf_resume;
> >  			if (!ret || xe_guc_read_stopped(guc))
> >  				goto trigger_reset;
> >  
> > @@ -1286,7 +1304,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  		smp_rmb();
> >  		ret = wait_event_timeout(guc->ct.wq,
> >  					 !exec_queue_pending_disable(q) ||
> > -					 xe_guc_read_stopped(guc), HZ * 5);
> > +					 xe_guc_read_stopped(guc) ||
> > +					 vf_recovery(guc), HZ * 5);
> > +		if (vf_recovery(guc))
> > +			goto handle_vf_resume;
> >  		if (!ret || xe_guc_read_stopped(guc)) {
> >  trigger_reset:
> >  			if (!ret)
> > @@ -1391,6 +1412,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  	 * some thought, do this in a follow up.
> >  	 */
> >  	xe_sched_submission_start(sched);
> > +handle_vf_resume:
> >  	return DRM_GPU_SCHED_STAT_NO_HANG;
> >  }
> >  
> > @@ -1487,11 +1509,17 @@ static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *ms
> >  
> >  static void __suspend_fence_signal(struct xe_exec_queue *q)
> >  {
> > +	struct xe_guc *guc = exec_queue_to_guc(q);
> > +	struct xe_device *xe = guc_to_xe(guc);
> > +
> >  	if (!q->guc->suspend_pending)
> >  		return;
> >  
> >  	WRITE_ONCE(q->guc->suspend_pending, false);
> > -	wake_up(&q->guc->suspend_wait);
> > +	if (IS_SRIOV_VF(xe))
> > +		wake_up_all(&guc->ct.wq);
> 
> maybe xe_guc_ct_wake_waiters() ?
> 

We have roughly 10 other calls of wake_up_all(&guc->ct.wq) else where
that need fixing. I suggest we fixup the entire driver in follow on
patch to this series.

> and I guess some small in source comment why we differentiate between VF and !VF case would be beneficial
> 

I've added this.

> > +	else
> > +		wake_up(&q->guc->suspend_wait);
> >  }
> >  
> >  static void suspend_fence_signal(struct xe_exec_queue *q)
> > @@ -1512,8 +1540,9 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> >  
> >  	if (guc_exec_queue_allowed_to_change_state(q) && !exec_queue_suspended(q) &&
> >  	    exec_queue_enabled(q)) {
> > -		wait_event(guc->ct.wq, (q->guc->resume_time != RESUME_PENDING ||
> > -			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q));
> > +		wait_event(guc->ct.wq, vf_recovery(guc) ||
> > +			   ((q->guc->resume_time != RESUME_PENDING ||
> > +			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q)));
> >  
> >  		if (!xe_guc_read_stopped(guc)) {
> >  			s64 since_resume_ms =
> > @@ -1640,7 +1669,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> >  
> >  	q->entity = &ge->entity;
> >  
> > -	if (xe_guc_read_stopped(guc))
> > +	if (xe_guc_read_stopped(guc) || vf_recovery(guc))
> >  		xe_sched_stop(sched);
> >  
> >  	mutex_unlock(&guc->submission_state.lock);
> > @@ -1786,6 +1815,7 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
> >  static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> >  {
> >  	struct xe_guc *guc = exec_queue_to_guc(q);
> > +	struct xe_device *xe = guc_to_xe(guc);
> >  	int ret;
> >  
> >  	/*
> > @@ -1793,11 +1823,22 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> >  	 * suspend_pending upon kill but to be paranoid but races in which
> >  	 * suspend_pending is set after kill also check kill here.
> >  	 */
> > -	ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
> > -					       !READ_ONCE(q->guc->suspend_pending) ||
> > -					       exec_queue_killed(q) ||
> > -					       xe_guc_read_stopped(guc),
> > -					       HZ * 5);
> > +	if (IS_SRIOV_VF(xe))
> > +		ret = wait_event_interruptible_timeout(guc->ct.wq,
> > +						       !READ_ONCE(q->guc->suspend_pending) ||
> > +						       exec_queue_killed(q) ||
> > +						       xe_guc_read_stopped(guc) ||
> > +						       vf_recovery(guc),
> > +						       HZ * 5);
> > +	else
> > +		ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
> > +						       !READ_ONCE(q->guc->suspend_pending) ||
> > +						       exec_queue_killed(q) ||
> > +						       xe_guc_read_stopped(guc),
> > +						       HZ * 5);
> 
> nit: maybe both magic 5sec timeouts deserve some comment?

That's just the standard time we pick for dma-fences to signal
everywhere in Xe. Again perhaps we do a follow up and replace HZ * 5
with global dma fence timeout value.

Matt

> > +
> > +	if (vf_recovery(guc) && !xe_device_wedged((guc_to_xe(guc))))
> > +		return -EAGAIN;
> >  
> >  	if (!ret) {
> >  		xe_gt_warn(guc_to_gt(guc),
> > @@ -1905,8 +1946,7 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
> >  {
> >  	int ret;
> >  
> > -	if (xe_gt_WARN_ON(guc_to_gt(guc),
> > -			  xe_gt_sriov_vf_recovery_pending(guc_to_gt(guc))))
> > +	if (xe_gt_WARN_ON(guc_to_gt(guc), vf_recovery(guc)))
> >  		return 0;
> >  
> >  	if (!guc->submission_state.initialized)
> > diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
> > index 83fbeea5aa20..7f587ca3947d 100644
> > --- a/drivers/gpu/drm/xe/xe_preempt_fence.c
> > +++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
> > @@ -8,6 +8,8 @@
> >  #include <linux/slab.h>
> >  
> >  #include "xe_exec_queue.h"
> > +#include "xe_gt_printk.h"
> > +#include "xe_guc_exec_queue_types.h"
> >  #include "xe_vm.h"
> >  
> >  static void preempt_fence_work_func(struct work_struct *w)
> > @@ -22,6 +24,15 @@ static void preempt_fence_work_func(struct work_struct *w)
> >  	} else if (!q->ops->reset_status(q)) {
> >  		int err = q->ops->suspend_wait(q);
> >  
> > +		if (err == -EAGAIN) {
> > +			xe_gt_dbg(q->gt, "PREEMPT FENCE RETRY guc_id=%d",
> > +				  q->guc->id);
> > +			queue_work(q->vm->xe->preempt_fence_wq,
> > +				   &pfence->preempt_work);
> > +			dma_fence_end_signalling(cookie);
> > +			return;
> > +		}
> > +
> >  		if (err)
> >  			dma_fence_set_error(&pfence->base, err);
> >  	} else {
> 
> just few suggestions, but overall LGTM, trusting you (and CI) that it works, so
> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> 
