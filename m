Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAF9EDEBFA
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 23:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A2B10E8EF;
	Tue,  3 Mar 2026 23:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nuaOXMPp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8B710E8EF
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 23:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772578864; x=1804114864;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ry+FWbM7hdyiVUtslmMHUuxomZ50Y78xNncVkh1NYKw=;
 b=nuaOXMPp7gRbfydlgs2nzJ24tneY60+sAERhl8RCLqk0J9FNmUBOWKC+
 a6JqL4oIpbUyqRBnwSKbXSSx9Q8wWwSG3qvHQQdLCAP5CMRwDMgHyIm2r
 TRkuKcQfzXoYQYv3t0DNDO8cjacECyFoJCri77JblpVfcl0AqbSFtFyar
 MXb/1oxtCjPcVmExpLuMLB9vf8SedTzLQHZSsbXIXDxX6p84+i6rT1zGS
 XubHuax/Gt2Pv9qzn4iA9qgVUiHO0AQX4O3PHmCFMYso02EycGRW2rp41
 e+cNH3RIcaV/86aWafq8C5cbJFLAkge7Bm2cHy0xIT9K0fhHE9cEjcizC g==;
X-CSE-ConnectionGUID: 0ft4xQoHRSCRR0CbrzoQpQ==
X-CSE-MsgGUID: jq7t7peKTi6+f0IbuE478g==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84723382"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="84723382"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 15:01:03 -0800
X-CSE-ConnectionGUID: si4gMczIQNytu31XLnicHw==
X-CSE-MsgGUID: 76uXvSuMSRah8vnibcgTFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="244916644"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 15:01:02 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 15:01:02 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 15:01:02 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 15:01:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AroB68qSG68mvQNdvu85ivKJSHoho4kJ19gz8vmW/2PCrA/0S6E2BPtwU0vhEZ17KahQKE/uDzbpap0bMGWObZlb2LwZFg2cha0pd75hZ2JzMd67PVb0xUUmFKn/UyyRv2elEm+wCTGlwuyiwqwC1IM/6DWKvzZAx6BwlE6NMsaqxfj138N31NiL3gUEzknBvOCXw0X3sj5BQjIDXbJwfo+RHD/+TXulTEGvAUPaNqOnkJFVjeggL9FuF/Nfps/h2Kps2okjuP4N+F/M21J3W9EdPWYJA8eguIxJQfSHcCqFDOPrms0Jn4IMul/ZEkoU3N+O7QJ/+wOoyBZUmiY83Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=joZr9HiYoKDztjs1ScEq46jy0v87l+eDZYPjElCyubg=;
 b=D4qb5riMeb6tlTwSegV2qCFpLmZhockk3uSbjEesulUxWAPidPI8pRa4H/0h+L3QN7HrOfwT7/RJnc7TBc5O/9BdNLJ/BZwiLm4i1hjax1ICnobDQ5WeMwhDqUdmHOmi7ZUfkg3Pwom4nwmtpZxpxmOICIhaUJGXw2v6d65h3QBv/UlrbUAq40S/rz3YExYiFFgtYDRAaVWIl/KW7j6GcV1nNa1IS8aUmpzgpaVDSw12BBsuytmTkFdZR3Gj/Z3tmIh/s9kzR+NH42V73xbZ9GXR5O3OWoOs340cWccSm9yvdVXkFz5yHnCBagBdUAwHHyG0aPVXxJta1WN9rPU00g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB5268.namprd11.prod.outlook.com (2603:10b6:610:e3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 23:00:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 23:00:59 +0000
Date: Tue, 3 Mar 2026 15:00:57 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Yadav, Arvind"
 <arvind.yadav@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH v3 07/25] drm/xe: Update scheduler job layer to support
 PT jobs
Message-ID: <aadoKVDiLPVS5kcQ@lstrano-desk.jf.intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
 <20260228013501.106680-8-matthew.brost@intel.com>
 <f766b45a9c633aba750334406b1c7a657d186a98.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f766b45a9c633aba750334406b1c7a657d186a98.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0332.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB5268:EE_
X-MS-Office365-Filtering-Correlation-Id: a11c4ebd-6813-41d7-5677-08de7978bc61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: INzUyorw7nHgKV9CEOgiT0IeICYyrMk4yqUrEQuiORMi4sWqMCj3X8Zi6efd3VQaR0x/OrsiWXa3Cyk8ilDCg859g6yZLXBZ9jlDevOUiZ/1WermtYXtrU7ngx00XvRNMZTd7x5eSq5tJiJLYFbJLMQIIve9PTsm2dYr1ajXmkQBTUtIkKWUf/udnLGWr7uGMq0qMlv/PjKTOUd2yHE9Ia685RiozRRS1wPuDWsQXPtrmkiNWRnonqN7yCa2fySdhJb9DuRPkcGwG5hhHyZl3qK6sI+SDOPfax8v7dk83xW4q7Lo4erXyGREPZvrgSK8Lfsu38YXZpO0sWgToKaqzDq9As9iUj1A7zF+GSELdyXFmxLiz1QdoSqXf1FIbiCmMPG5ErGeuaclG2JC4GLe7SlastZbeOgrrHA+VoQnQmUA082nGqrHuBWW10hrbeq4S06QvhwgCywkMSAl5ZQ1lkZdKp7mf5CRGYv/Hr63+liWJLJifKFeOV14S7GsZOPJpmk5lTUFikq5KAVpI1cswdAAsGGw+m+sBlWPR26zYj+yOfrqlEVCFMEAfE/FExulmbJXhqo8NJ+OY7nFnnk6lj/0h2kA++2rwU5retnhWEN9DfTf7e4hvImToc5xbGDmWnctUqdq+Mxin3h/d90jUsXtzMyjkxKCL1R7vUx2ql223P8L80fSqLhxnHHBmZiDz84snr6s/NnRCG84rISuCZiuKesyu4vq1nEqb1K14OU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGJTdERhVTN1WnBiS2lhTVFUV1BTZDZPckNtQUc4K1gyU1NzZ2VjT0E4NnhF?=
 =?utf-8?B?NVNuS1RrcEd1NWpIOVhyd3dzOC94eC9tWWwxRlkwT0YrZVRYRUZvWEdrUTNM?=
 =?utf-8?B?NEM1ZXdIMTF0eWVBVFVhZ3lna3daK3Z1M3pWMXFBV3N0bjVkNW1UQ2tRN3JZ?=
 =?utf-8?B?YUtMS3IyNFhVVVZseWpraVdzZThzeWlhQ1FpeWJmdGpYSVkzRFY1VVlJbklv?=
 =?utf-8?B?dXV4L04rTVgxa1RaUFAxRHdXYnZoR0wrZVp0d1ZoRVl2OWxYS0tRbVdMWnN0?=
 =?utf-8?B?Ris3bWhWTkhJTW96cGdaZkliKzNQVS9QMTJHV01yS3ZjU0NYL1F0TmVkemRL?=
 =?utf-8?B?RTRtZENyM1NHa1dPRkxuVHBxN21FTFBJZnZmSVRTWjk1YlJQS1ErT2RYS3RM?=
 =?utf-8?B?NWxYdmIwTDBwZEhaS2t5UW5Kd2Zndm4yRHBreExkSC9RNXNqckZVbGhUaTJj?=
 =?utf-8?B?eG1LRVlXTmk3VUU0M1dPQWwwMldMZWZWb2tUeDRNWXF3Uk5GYzNtdHJDb1Zw?=
 =?utf-8?B?U2FaeVZRcTRhd2M3ZzduTlhQaGNkcnRORW5FL3BrT3VTWWExTlZycWlyL1J0?=
 =?utf-8?B?ZVRZeFpBYjQrKzEyeU41cEE0aVltNFFYMjdlRm5icVYxQWdSWnpaTlA1c2o0?=
 =?utf-8?B?Ujd3NVgreTZveW14ZGZ3RTBibkNaN0s0SFJRWEE5aWpRYVpwdjdzS09mR0w2?=
 =?utf-8?B?Z2FxWXVZMDlYYUZ3bHpocDBjNWkvcGkzQysrRTZUeEF1K2VqWUVtc1VQMHdn?=
 =?utf-8?B?YlJKWlZOdCtCTmxxblpIQzlnK3lhNnMxZjNqZFBEdExSNjhqaklyVnA2YzBB?=
 =?utf-8?B?TWY2Q3B1Vk85RjBIdFlIcUpaQWlPdnBUT1ZjRVNUZWpDZXRSbDhZTHdISnR4?=
 =?utf-8?B?UWE3SEJXUHJueVhEb2tLVnJGL0N3TFJXcDJ1aEFvVVkyeU5sREg0NlZlMGtN?=
 =?utf-8?B?WjZIQm81QkUwclBDbGYxbDFBMC90YUVvQXFNTlY4dXdMR2xWTTNDSHcvVWJM?=
 =?utf-8?B?WFZ6aFowWkY1TEY3M1hTMEZ3NkRWNVBMc3NmRkNlSXVhcnRsNkJEVGFZRm10?=
 =?utf-8?B?VFdrZmYxV2lPVlBub1BZUVd0L0xNN0FPOTAyMGF2aDdOc1BQandHa3JUVDg5?=
 =?utf-8?B?MU01WjhUL3k0a0JUUkRHU2k2WVluRW9DUWlMZW9xcVZnZnVVcmtJZm5ZM1Nm?=
 =?utf-8?B?eXoxTk4zRnQ5WlZqWEgwNk8wUTRLTHFNZXE2Y1JmTWpLM2NMQUVDbFZOVVBv?=
 =?utf-8?B?YW5ycFFrY0tvS2ZFMjhtUlZCQmRreXRscGRzcGRTN3lUY0xzMHRFUTZRbm84?=
 =?utf-8?B?Q0hhWkM1UzMxSmkxU3AzV2FUSm1rMVFITFovTlpsYUo5cDVweDIwN1VkUFpr?=
 =?utf-8?B?RlFldUI1VlJpcStnWFQ2dGc1WmpmOGZXOUJkRFpWbWVyV2RQUmVTbWg5MURW?=
 =?utf-8?B?QWtlQTNKY3Jmb3F4ZTY3N2w2ZHFodEFJUmhkMldXT0hKcEtvSUdhalVYZGpC?=
 =?utf-8?B?eFNiKzhFSXJZQ3NZNlJ2dlE3L2xhZGJOa1VXS1JBVmhQTHBRMTQrRkdhRklJ?=
 =?utf-8?B?THY1bnlDVnVvaGFPWUptL3BtSWFjT3oyME9yaWMzOVhPY2twUnZMVFQzUkpl?=
 =?utf-8?B?aUNoK3FsUm1COU5Kck5ablB6S1FXYWR6RDR1dnF6NlQ1Y0NPQlFLZ0FtYUFn?=
 =?utf-8?B?N3J0OVErNzR3M1VDV3hEcGFTcHlkK0FleEEzbnFsVFlzSWwxd3NVUkpCOHRk?=
 =?utf-8?B?bXBiT3VzS2JVVjFBeGlXS3Q2b055elpRMGFwRklQQUZ2aXZoUWczRlN4RXBN?=
 =?utf-8?B?TTdWRUU0bWhuRmU2THlDN2FiVktiS1kyNzhxTDJMQ3Q4eUpQbWFrWjdpT1pP?=
 =?utf-8?B?UXdYaDdML21JTHA4c0pqcHIvS1VZdFFwV1VRSngrQ1RvdnZSVWNycHFtNHkx?=
 =?utf-8?B?eU9lRkR3dVMxcmZTS2V5RWhTTHFLb0JENlFpY3h4UjUyb1pielVqU1FHUWI5?=
 =?utf-8?B?ZGJOQ3dsYUJBdXBpK3B4aENGeGprYndDVjFML1BGdnEzVDgyeHE2d2gxakFu?=
 =?utf-8?B?ekgyUHh4ZmxmTVdha0xsWlhJQ0t5REEwTml2SVk0ejJRREtNZWdMcUhpTkdQ?=
 =?utf-8?B?ejd5UHZWbitCNzVvazFWV2RkVlVuQTgrYTFlZjBKR0dwYWRpQmloM1FjZ25K?=
 =?utf-8?B?MTdzRnMzVHZra2ZiV1VJSDVPR3ppM3RET0xYMUxCUG9FNE5QcVdId04vZjli?=
 =?utf-8?B?YTdqR3V4L2hVYUY5dldYS2xDZ2dRZEhmQklwazcvM3o0c2hqMnV3YmZTUDJZ?=
 =?utf-8?B?VHEwTVdueVVDSW9Nc1U5elh2a3BDTW5BSUhjQ1I3QzVJQzc1dVBhQVA4dVpW?=
 =?utf-8?Q?4ZaS9WN7LcplKgC0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a11c4ebd-6813-41d7-5677-08de7978bc61
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 23:00:59.8112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2BEidcH3gOR/nUIs3K2wCKlHQ5cJrbBTAmXlUK2mlkTdWa5LaHo8uogn5WQlTV1XNUrIaGwRZQH7IDwjsujfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5268
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

On Tue, Mar 03, 2026 at 03:50:58PM -0700, Summers, Stuart wrote:
> On Fri, 2026-02-27 at 17:34 -0800, Matthew Brost wrote:
> > Update the scheduler job layer to support PT jobs. PT jobs are
> > executed
> > entirely on the CPU and do not require LRC fences or a batch address.
> > Repurpose the LRC fence storage to hold PT‑job arguments and update
> > the
> > scheduler job layer to distinguish between PT jobs and jobs that
> > require
> > an LRC.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_sched_job.c       | 92 ++++++++++++++++-------
> > --
> >  drivers/gpu/drm/xe/xe_sched_job_types.h | 31 ++++++++-
> >  2 files changed, 88 insertions(+), 35 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c
> > b/drivers/gpu/drm/xe/xe_sched_job.c
> > index ae5b38b2a884..a8ba7f90368f 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > @@ -26,19 +26,22 @@ static struct kmem_cache
> > *xe_sched_job_parallel_slab;
> >  
> >  int __init xe_sched_job_module_init(void)
> >  {
> > +       struct xe_sched_job *job;
> > +       size_t size;
> > +
> > +       size = struct_size(job, ptrs, 1);
> 
> Nice..
> 
> >         xe_sched_job_slab =
> > -               kmem_cache_create("xe_sched_job",
> > -                                 sizeof(struct xe_sched_job) +
> > -                                 sizeof(struct xe_job_ptrs), 0,
> > +               kmem_cache_create("xe_sched_job", size, 0,
> >                                   SLAB_HWCACHE_ALIGN, NULL);
> >         if (!xe_sched_job_slab)
> >                 return -ENOMEM;
> >  
> > +       size = max_t(size_t,
> > +                    struct_size(job, ptrs,
> > +                                XE_HW_ENGINE_MAX_INSTANCE),
> > +                    struct_size(job, pt_update, 1));
> >         xe_sched_job_parallel_slab =
> > -               kmem_cache_create("xe_sched_job_parallel",
> > -                                 sizeof(struct xe_sched_job) +
> > -                                 sizeof(struct xe_job_ptrs) *
> > -                                 XE_HW_ENGINE_MAX_INSTANCE, 0,
> > +               kmem_cache_create("xe_sched_job_parallel", size, 0,
> >                                   SLAB_HWCACHE_ALIGN, NULL);
> >         if (!xe_sched_job_parallel_slab) {
> >                 kmem_cache_destroy(xe_sched_job_slab);
> > @@ -84,7 +87,7 @@ static void xe_sched_job_free_fences(struct
> > xe_sched_job *job)
> >  {
> >         int i;
> >  
> > -       for (i = 0; i < job->q->width; ++i) {
> > +       for (i = 0; !job->is_pt_job && i < job->q->width; ++i) {
> >                 struct xe_job_ptrs *ptrs = &job->ptrs[i];
> >  
> >                 if (ptrs->lrc_fence)
> > @@ -93,10 +96,23 @@ static void xe_sched_job_free_fences(struct
> > xe_sched_job *job)
> >         }
> >  }
> >  
> > +/**
> > + * xe_sched_job_create() - Create a scheduler job
> > + * @q: exec queue to create the scheduler job for
> > + * @batch: array of batch addresses for the job; must match the
> > width of @q,
> > + *         or NULL to indicate a PT job that does not require a
> > batch address
> > + *
> > + * Create a scheduler job for submission.
> > + *
> > + * Context: Reclaim
> > + *
> > + * Return: a &xe_sched_job object on success, or an ERR_PTR on
> > failure.
> > + */
> >  struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
> >                                          u64 *batch_addr)
> >  {
> >         bool is_migration = xe_sched_job_is_migration(q);
> > +       struct xe_device *xe = gt_to_xe(q->gt);
> >         struct xe_sched_job *job;
> >         int err;
> >         int i;
> > @@ -105,6 +121,9 @@ struct xe_sched_job *xe_sched_job_create(struct
> > xe_exec_queue *q,
> >         /* only a kernel context can submit a vm-less job */
> >         XE_WARN_ON(!q->vm && !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
> >  
> > +       xe_assert(xe, batch_addr ||
> > +                 q->flags & (EXEC_QUEUE_FLAG_VM |
> > EXEC_QUEUE_FLAG_MIGRATE));
> 
> Ok..
> 

I do plan on reworking the 'EXEC_QUEUE_FLAG_*' in follow up but
overloading the kernel bind queue on EXEC_QUEUE_FLAG_MIGRATE in this
series as that is what EXEC_QUEUE_FLAG_MIGRATE meant prior to this
series.

> > +
> >         job = job_alloc(xe_exec_queue_is_parallel(q) ||
> > is_migration);
> >         if (!job)
> >                 return ERR_PTR(-ENOMEM);
> > @@ -119,34 +138,39 @@ struct xe_sched_job *xe_sched_job_create(struct
> > xe_exec_queue *q,
> >         if (err)
> >                 goto err_free;
> >  
> > -       for (i = 0; i < q->width; ++i) {
> > -               struct dma_fence *fence = xe_lrc_alloc_seqno_fence();
> > -               struct dma_fence_chain *chain;
> > -
> > -               if (IS_ERR(fence)) {
> > -                       err = PTR_ERR(fence);
> > -                       goto err_sched_job;
> > +       if (!batch_addr) {
> > +               job->fence = dma_fence_get_stub();
> > +               job->is_pt_job = true;
> > +       } else {
> > +               for (i = 0; i < q->width; ++i) {
> > +                       struct dma_fence *fence =
> > xe_lrc_alloc_seqno_fence();
> > +                       struct dma_fence_chain *chain;
> > +
> > +                       if (IS_ERR(fence)) {
> > +                               err = PTR_ERR(fence);
> > +                               goto err_sched_job;
> > +                       }
> > +                       job->ptrs[i].lrc_fence = fence;
> > +
> > +                       if (i + 1 == q->width)
> > +                               continue;
> > +
> > +                       chain = dma_fence_chain_alloc();
> > +                       if (!chain) {
> > +                               err = -ENOMEM;
> > +                               goto err_sched_job;
> > +                       }
> > +                       job->ptrs[i].chain_fence = chain;
> >                 }
> > -               job->ptrs[i].lrc_fence = fence;
> >  
> > -               if (i + 1 == q->width)
> > -                       continue;
> > +               width = q->width;
> > +               if (is_migration)
> > +                       width = 2;
> >  
> > -               chain = dma_fence_chain_alloc();
> > -               if (!chain) {
> > -                       err = -ENOMEM;
> > -                       goto err_sched_job;
> > -               }
> > -               job->ptrs[i].chain_fence = chain;
> > +               for (i = 0; i < width; ++i)
> > +                       job->ptrs[i].batch_addr = batch_addr[i];
> >         }
> >  
> > -       width = q->width;
> > -       if (is_migration)
> > -               width = 2;
> > -
> > -       for (i = 0; i < width; ++i)
> > -               job->ptrs[i].batch_addr = batch_addr[i];
> > -
> >         atomic_inc(&q->job_cnt);
> >         xe_pm_runtime_get_noresume(job_to_xe(job));
> >         trace_xe_sched_job_create(job);
> > @@ -246,7 +270,7 @@ bool xe_sched_job_completed(struct xe_sched_job
> > *job)
> >  void xe_sched_job_arm(struct xe_sched_job *job)
> >  {
> >         struct xe_exec_queue *q = job->q;
> > -       struct dma_fence *fence, *prev;
> > +       struct dma_fence *fence = job->fence, *prev;
> 
> Looks like this was a bug where prev would be NULL in that first for
> each queue width loop below? Would be nice for this to go into a
> separate patch.
> 

No, the existing code works, so does the code after.

We set 'fence = job->fence' so when we go directly to arm the
'dma_fence_get' works.

> >         struct xe_vm *vm = q->vm;
> >         u64 seqno = 0;
> >         int i;
> > @@ -266,6 +290,9 @@ void xe_sched_job_arm(struct xe_sched_job *job)
> >                 job->ring_ops_flush_tlb = true;
> >         }
> >  
> > +       if (job->is_pt_job)
> > +               goto arm;
> > +
> >         /* Arm the pre-allocated fences */
> >         for (i = 0; i < q->width; prev = fence, ++i) {
> 
> Can we either use the goto above or change this to align with what you
> had earlier, something like:
> for (i = 0; !job->is_pt_job && i < q->width; prev = fence, ++i) {
> 
> Just for consistency...
> 

Let me use a 'goto' in both cases. I've gotten push back on boolean
short circuits in the loops in the past.

Matt

> >                 struct dma_fence_chain *chain;
> > @@ -286,6 +313,7 @@ void xe_sched_job_arm(struct xe_sched_job *job)
> >                 fence = &chain->base;
> >         }
> >  
> > +arm:
> >         job->fence = dma_fence_get(fence);      /* Pairs with put in
> > scheduler */
> >         drm_sched_job_arm(&job->drm);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h
> > b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > index 13c2970e81a8..9be4e2c5989d 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > @@ -10,10 +10,29 @@
> >  
> >  #include <drm/gpu_scheduler.h>
> >  
> > -struct xe_exec_queue;
> >  struct dma_fence;
> >  struct dma_fence_chain;
> >  
> > +struct xe_exec_queue;
> > +struct xe_migrate_pt_update_ops;
> > +struct xe_pt_job_ops;
> > +struct xe_tile;
> > +struct xe_vm;
> > +
> > +/**
> > + * struct xe_pt_update_args - PT update arguments
> > + */
> > +struct xe_pt_update_args {
> > +       /** @vm: VM which is being bound */
> > +       struct xe_vm *vm;
> > +       /** @tile: Tile which page tables belong to */
> > +       struct xe_tile *tile;
> > +       /** @ops: Migrate PT update ops */
> > +       const struct xe_migrate_pt_update_ops *ops;
> > +       /** @pt_job_ops: PT job ops state */
> > +       struct xe_pt_job_ops *pt_job_ops;
> > +};
> > +
> >  /**
> >   * struct xe_job_ptrs - Per hw engine instance data
> >   */
> > @@ -69,8 +88,14 @@ struct xe_sched_job {
> >         bool restore_replay;
> >         /** @last_replay: last job being replayed */
> >         bool last_replay;
> > -       /** @ptrs: per instance pointers. */
> > -       struct xe_job_ptrs ptrs[];
> > +       /** @is_pt_job: is a PT job */
> > +       bool is_pt_job;
> > +       union {
> > +               /** @ptrs: per instance pointers. */
> > +               DECLARE_FLEX_ARRAY(struct xe_job_ptrs, ptrs);
> 
> Nice..
> 
> Thanks,
> Stuart
> 
> > +               /** @pt_update: PT update arguments */
> > +               DECLARE_FLEX_ARRAY(struct xe_pt_update_args,
> > pt_update);
> > +       };
> >  };
> >  
> >  struct xe_sched_job_snapshot {
> 
