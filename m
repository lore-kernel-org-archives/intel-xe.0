Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D0CCFC50C
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 04:40:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4C110E04D;
	Sat, 22 Nov 2025 04:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UpImC0iL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F4010E04D
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 04:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763786440; x=1795322440;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Vm7AN/ZZVaavpWa4lhBkjSPoxNR0YpOMcFO/fRffhSw=;
 b=UpImC0iLFpklFCXOpRA0mU/Q5oyqJIJ+YLTw2fT5j/lBqPpjEUX0La0T
 EB/81Vuiyzetv0sVkT48XjT+Dz5yCT+9k5ppRMrume06ZbR9OxHvv9GPZ
 j+5LHQGlWfBgnXzNDxNp5qn2BIcBWAjsApM26ap1161O0DJf4SwlyvYXd
 1PAEknHi1UonO4cFDH6tf1p3vJdmBDeMMx8QmVZgmMnRLX9LU8SXFS7nw
 USK3VsM0hhUu9FtmivtuFXtgieDPLuoPDOt2t0myOAg/ehfR6+5SpYOj9
 4svECaa2CJ1EyH+9+sxJm5lPPJs2UWI8lANfc4VhSrVrddZXRJ0vApQba w==;
X-CSE-ConnectionGUID: n1JOIzm7TR65eQGrpyZ4nA==
X-CSE-MsgGUID: y7uMvNIdSWylEvJKDtJmuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="69744061"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="69744061"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 20:40:39 -0800
X-CSE-ConnectionGUID: y+g/WdnOSYiELRoU3zEVeg==
X-CSE-MsgGUID: oiErjghuT0yFOaFrPun8yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="191046321"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 20:40:40 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 20:40:38 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 20:40:38 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 20:40:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tvpbR9Y71/I/HZP+3xUPzqTU1EiEfRUgjd/4l8UZ2GP8UxHQ9LMjP0SgxVjuHKQHLpopbC26BcIcX6VdRzdsfqPgk+aOeWN26WzkDo3vbuwUJfXasBk0XKm21R1ya2Hsu0NKDrIM+lB0V4IgtxtbqRzRbY16eglpoySlFqy2bLdxwAHoR2z5RbcO4xlXugAqWCaXNf0Be9x9COSKTzIB9JNIyu0HhFwC4qpro8zkDavyHDo6Se1dtWmAGt7QrfiTFrGbMgJT1rLG9BZ66J5pXxwczmxm1FkBJ4OlVTJu8yWU2hMpFpW47oKgvhRkgnzTV/hKvR3ydRzo+MNXN07Q9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ct90U6CjfbSQBPz4Qq5MTHHsp6pZZMVxlkLHzTNqqbE=;
 b=xOf+bv47UL3wE5tRsXpbk5HnbjFtbdBs0GCyyuIx0zsC8fAxtSRXSMQj850espomBblAwMHPZ7vLA7oiQ47bJZJpuI1oiT49/sWh83hyKIJ9WR2+oSMsPsuNzIykI54I4vwVwXMZHhUT+JDPT0Z8dId1vImBEg3Epw8rG3G79N2JyK0L/7WuP0ZSRZdtgDfKk9s96buj81V3FMa2MOYSjrTWYNEG4jWzJeb3eInnjURkytGctTP8h1G+rCeEPdbR06OgYlc5pvYwVSMd70XYoROlaL5hbAjGOEgScYbTKJQD7cw1W9T+kbKv7LsGXu6EkKEgLlO89KsbSxmlaUvSFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by CH3PR11MB7722.namprd11.prod.outlook.com (2603:10b6:610:122::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Sat, 22 Nov
 2025 04:40:36 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 04:40:34 +0000
Date: Fri, 21 Nov 2025 20:40:32 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 09/18] drm/xe/multi_queue: Handle tearing down of a
 multi queue
Message-ID: <aSE-wIdY4uNuB6gd@nvishwa1-desk>
References: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
 <20251121035147.766072-29-niranjana.vishwanathapura@intel.com>
 <aSDvyLS/vDfpMGMa@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aSDvyLS/vDfpMGMa@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BY3PR10CA0007.namprd10.prod.outlook.com
 (2603:10b6:a03:255::12) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|CH3PR11MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 90021ccb-4399-4783-be7d-08de29814686
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cV6K1gkp2exBVy2S7diKqYEjvU7LOWhwnnIOzJ8b4sZkGFdP3M/qFbMynjBB?=
 =?us-ascii?Q?K6s+7g4pnXQasXlLGB0zexe4i5Dd9WKPO4e6ngk3SYT0QPb8JJ41XVt0WgXp?=
 =?us-ascii?Q?zxby/AOBD5ysMFsv/IKK1RacBSYYbxYP170J3RQGMVebRDYu2wiL9EgLf5ut?=
 =?us-ascii?Q?Ld5ztw6zWSDRIK1pIbNuQ4bh8++9asgMXHXyIo85d3kgdo3f4nHWRFEO7kB3?=
 =?us-ascii?Q?nOj398Yf6aaTOeYY+Rau3tFBg3R971dMXYlcuG0PdmOEg0TnWIZnQO866p9p?=
 =?us-ascii?Q?CjliZVUmqcQDbKMA4UorO7IRhfN/BF7nHg7NEFcKCXKLZdaDsOsKcnkXMUFA?=
 =?us-ascii?Q?Xj25rVheHH0zBOHL1Hsr1V+zlecwyiJ80duLDYraOYz++oZfzK0LiKAQqUoT?=
 =?us-ascii?Q?tx+inDe0mmXUhQ/65applWqjEK30Xa0rUiuKw2i7MyLeih8LoXLdDOsxhGOd?=
 =?us-ascii?Q?v3M+no550eFrHsUYB66E8pKG0l5Rk5SVRm0Is1SM0gWlParJePsLC0x3+Yw7?=
 =?us-ascii?Q?/nQHdNWzlrasoUPM7OJA94IHZWxng20TcRIGuHpD1htPB3b5t7YuwxHClHwv?=
 =?us-ascii?Q?MRJzxxIngM4C39Ac5wAGwhL0gurPO+2PsqDscaDfTlm9M5XSIqAxmtXJyYHs?=
 =?us-ascii?Q?YjOY4fGMzmBL26yKVHKzrdIqOkYzPVMavw1t7PBKpv11cfpSj7m9yuU6BFRw?=
 =?us-ascii?Q?45RfbtdZMwpGbiEo7YbrJpS/TM8DUATgXyJ1i+d+N070LJgAGiw9KO5DTrt0?=
 =?us-ascii?Q?mHFELX5rxbweJW3DLChu9eYIyKgYoZkaNdhzDj0NtgEbGTx2aCWiulJcAPD2?=
 =?us-ascii?Q?mnIkGJ+W+waqEcEIoPioHjDXfnqypn1ZIOhvXbC0J9APpmIOVhgbE4S4ery4?=
 =?us-ascii?Q?WUaJPz0ozIZSzbywyI+v8YmMOEKcFprN8E/1ZCcWi68/PFfSn0XPYFkEEzTs?=
 =?us-ascii?Q?zrfk+bFR2ZtHFXciGMKXPk1XgN3N46nY1JU1xHgMkihhDJfiMI2/J4hjx/pd?=
 =?us-ascii?Q?TejlVSQyaGIKMkbpQOqBFaEnRqORJQhjLXSh8p4fwsxD7pncPrnv9JhD0J02?=
 =?us-ascii?Q?G8yF5sLDtTfOeyw6ww+dDNCpEeN9XggZ7X630AHuRg2mjH7xOzlVqPdEE+8E?=
 =?us-ascii?Q?usVWCua+koj7Os9DltbzcYV6UdRBI/BU9RbTk9FLn+6Cst+N+57if9JuCa0q?=
 =?us-ascii?Q?wjhduZXm2Xc2Os+cuV17qY7HYKaSaamPMzfnXbaheRaWou6T5cWW0FkqlkjW?=
 =?us-ascii?Q?U3OUeXXEg7WKRddl80GFV9nEtx5s+XhbHGu4mMXkt2C/t57x7NrBDF+3/slo?=
 =?us-ascii?Q?Zkk/3xj9jM4/6JJC+Gkuqc0B8wIvTe4qPujbCBaYU3aToU27SLH2m4tKaH8N?=
 =?us-ascii?Q?Gb/nrZ0viaAffGEXjKKRhEqevXl+tjHZKfk6UrOrVeNhyMj2yGI6msAWd/Mp?=
 =?us-ascii?Q?yji+md6NpsPNiemrK3Etrhvxg7qGk/7h?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6Rzan64tota+SqXDdAqU8wCBMCrsrTNAx9IyJEpf7sdjSRp0aDWZKKIeRXgP?=
 =?us-ascii?Q?lI2YhGN5vQnVWPv4JF8ENC0TaqDAnz+4klDiqcxGudmcDhI1FO3MJIBT2cD4?=
 =?us-ascii?Q?Ui1tOFELhgTy74jatyY9eX/MTuA4ey8m2a6Rgb5sN6ccOk+5gJwC4Y5xWUm/?=
 =?us-ascii?Q?x9Dlo/s0W2h8o/3HjsdiUJOButlm8MAIf5ZbNlJ7lfcezbbpGk9xcVd4FqTe?=
 =?us-ascii?Q?e74uh8+MK/XR2mHrvc17WkABIKFXbgj1c3rX+GtyXc3L1494o7MReIm3fsOf?=
 =?us-ascii?Q?pFBAa8o7gp24SchNFjhG9Czf3BaFJdR3h4PyA4IAcZ1DQpzBa5Z3VijXKJnU?=
 =?us-ascii?Q?8sIXtQ3/UQaB39SnfombxtsKl2TNqbOI5pp+SD/udDx9WiWleql6xY4Nlf5l?=
 =?us-ascii?Q?6QFyeAcmA1A5jCqp7P3GKYNE115F5684VwF2St5nfdztOxOA6JyeIpsxtgWZ?=
 =?us-ascii?Q?inydzPIMCmZfPM0sgR1pxslrUgov674uNF7VrgX7/CZbuhYoyLA0tIs6GnWS?=
 =?us-ascii?Q?414j6sOdGAtTMJqVIVmNtGK72zUznFxVHqH+62Wa/w4PmNtBiwyexPT96gIo?=
 =?us-ascii?Q?a4+6RibwVytbRYR+EuPSZH69qsEubgtj2wfhPGcNdw4NQNTZ6FxvKk/tPyr6?=
 =?us-ascii?Q?ypZcoTIngpxO4FBI1FQ4Xrr8d8NLRM6LcnuZ3GrczMVd8G5vcd49NY3UGdA3?=
 =?us-ascii?Q?lk1JnOi2b0oz9TmVQFAlmCgiegA7AmtCqMVX8S0LVLnZVcEtud3wqVjAdYbk?=
 =?us-ascii?Q?pXZwol1xTE0fH1TesUH/AXTih1i4uTUceifbQhoRLPfTMUddhsKhPdpf2b5K?=
 =?us-ascii?Q?qq1otIUCBOomr5nACqUnAhJcipvMrwMzQit1VyrKsOx2vCyJaZmY4gR4350m?=
 =?us-ascii?Q?xhdSFtmV6riJgb49wJ2CZEL8IHHOAVXKzQPEWqWWmuH8OWVulqvzmjNiNXZx?=
 =?us-ascii?Q?5IloTtEgHYDG1zWFNjyvfnTIMdQLwH9D3VDh6STu1xR2UUXDS3pzMRzirIsq?=
 =?us-ascii?Q?jBOTLq77Li0gCHq0kVoKZnxqmKSr+Iszuk/pO0pA1u52Sveu6MDWgtQAa8jL?=
 =?us-ascii?Q?UepcqaP/ujv29s57eRVk4osv0zmWDOwbMHIkS2LO0ni9DF/xTR/+6feeH2st?=
 =?us-ascii?Q?xM6g9LWekKL6bXE7jqXcLqWrEFnvPNeZPTDkc8I+lotY96NtsuQYtax+xep4?=
 =?us-ascii?Q?LaxDthNQiA28cyQ+fZWPgXBKs6AbU3nByUMMixXBulVK/dl6QqvR7uadjqgB?=
 =?us-ascii?Q?MOAF73OOqzXJkL6sLfK8Ngt6YDg+AoKd+iWIUnWEYEFX5vHp6MLvDZpqkh6C?=
 =?us-ascii?Q?6CdXhJfMuOp7AaTAjQeJydTPpsYeXYIAal1aIVU2LhrBVxY9R1MoAvkC8YTC?=
 =?us-ascii?Q?q21SzuGDYay1WboC+Qs00dg3kkG/6CiJVI2aNSLLrpcCChwiC7RDMxCb1XCT?=
 =?us-ascii?Q?ngO4as+TFFsynEgQ9dXZqRuSlwhcaN9MnsOEUHDUmvB9q/jTfYB4RqXSi5wD?=
 =?us-ascii?Q?PZkC8yPm3pr6D8LqLuNhJwCvJiFMBN20JTO4fPksIEcv2ME5IngbEnQlf3rY?=
 =?us-ascii?Q?Fj5U2w+kUyyv4cgKLcKvUfgUk3iUsiqjLDf8CFo9PQ0X85qcPJmoAocJtoJ5?=
 =?us-ascii?Q?HfQxI3eva18/D6sizydC1L4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90021ccb-4399-4783-be7d-08de29814686
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 04:40:34.5717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fUdlM7LPIfTxUO9Nl77256R/Hc1hZSu4Fy7op68BDTP1HIzzEB6OqjmPjRjlaLpSujZgkaZY4kwWFhrWouLBgKPeCfNlhH98lvlQZNh1aSxmp9i63VCxteHB+cWSo30o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7722
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

On Fri, Nov 21, 2025 at 03:03:36PM -0800, Matthew Brost wrote:
>On Thu, Nov 20, 2025 at 07:51:43PM -0800, Niranjana Vishwanathapura wrote:
>> As all queues of a multi queue group use the primary queue of the group
>> to interface with GuC. Hence there is a dependency between the queues of
>> the group. So, when primary queue of a multi queue group is cleaned up,
>> also trigger a cleanup of the secondary queues also. During cleanup, stop
>> and re-start submission for all queues of a multi queue group to avoid
>> any submission happening in parallel when a queue is being cleaned up.
>>
>> v2: Initialize group->list_lock, add fs_reclaim dependency, remove
>>     unwanted secondary queues cleanup (Matt Brost)
>> v3: Properly handle cleanup of multi-queue group (Matt Brost)
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_exec_queue.c       |  10 ++
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h |   6 +
>>  drivers/gpu/drm/xe/xe_guc_submit.c       | 154 ++++++++++++++++++-----
>>  3 files changed, 142 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index cdc044d3c96c..ab161b74fef0 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -87,6 +87,7 @@ static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
>>  		xe_lrc_put(lrc);
>>
>>  	xa_destroy(&group->xa);
>> +	mutex_destroy(&group->list_lock);
>>  	xe_bo_unpin_map_no_vm(group->cgp_bo);
>>  	kfree(group);
>>  }
>> @@ -627,9 +628,18 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
>>
>>  	group->primary = q;
>>  	group->cgp_bo = bo;
>> +	INIT_LIST_HEAD(&group->list);
>>  	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
>> +	mutex_init(&group->list_lock);
>>  	q->multi_queue.group = group;
>>
>> +	/* group->list_lock is used in submission backend */
>> +	if (!IS_ENABLED(CONFIG_LOCKDEP)) {
>
>I believe the polarity is inverted above.
>

Oops. Will fix. Thanks.

Niranjana

>Everything else LGTM.
>
>Matt
>
>> +		fs_reclaim_acquire(GFP_KERNEL);
>> +		might_lock(&group->list_lock);
>> +		fs_reclaim_release(GFP_KERNEL);
>> +	}
>> +
>>  	return 0;
>>  }
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index cafb3ba9a123..5721fb4bad1a 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -58,6 +58,10 @@ struct xe_exec_queue_group {
>>  	struct xe_bo *cgp_bo;
>>  	/** @xa: xarray to store LRCs */
>>  	struct xarray xa;
>> +	/** @list: List of all secondary queues in the group */
>> +	struct list_head list;
>> +	/** @list_lock: Secondary queue list lock */
>> +	struct mutex list_lock;
>>  	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
>>  	bool sync_pending;
>>  };
>> @@ -145,6 +149,8 @@ struct xe_exec_queue {
>>  	struct {
>>  		/** @multi_queue.group: Queue group information */
>>  		struct xe_exec_queue_group *group;
>> +		/** @multi_queue.link: Link into group's secondary queues list */
>> +		struct list_head link;
>>  		/** @multi_queue.priority: Queue priority within the multi-queue group */
>>  		enum xe_multi_queue_priority priority;
>>  		/** @multi_queue.pos: Position of queue within the multi-queue group */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index ce870a119800..2e5fff7ad69b 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -577,6 +577,45 @@ static bool vf_recovery(struct xe_guc *guc)
>>  	return xe_gt_recovery_pending(guc_to_gt(guc));
>>  }
>>
>> +static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>> +{
>> +	struct xe_guc *guc = exec_queue_to_guc(q);
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +
>> +	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
>> +	wake_up_all(&xe->ufence_wq);
>> +
>> +	if (xe_exec_queue_is_lr(q))
>> +		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
>> +	else
>> +		xe_sched_tdr_queue_imm(&q->guc->sched);
>> +}
>> +
>> +static void xe_guc_exec_queue_reset_trigger_cleanup(struct xe_exec_queue *q)
>> +{
>> +	if (xe_exec_queue_is_multi_queue(q)) {
>> +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>> +		struct xe_exec_queue_group *group = q->multi_queue.group;
>> +		struct xe_exec_queue *eq;
>> +
>> +		set_exec_queue_reset(primary);
>> +		if (!exec_queue_banned(primary) && !exec_queue_check_timeout(primary))
>> +			xe_guc_exec_queue_trigger_cleanup(primary);
>> +
>> +		mutex_lock(&group->list_lock);
>> +		list_for_each_entry(eq, &group->list, multi_queue.link) {
>> +			set_exec_queue_reset(eq);
>> +			if (!exec_queue_banned(eq) && !exec_queue_check_timeout(eq))
>> +				xe_guc_exec_queue_trigger_cleanup(eq);
>> +		}
>> +		mutex_unlock(&group->list_lock);
>> +	} else {
>> +		set_exec_queue_reset(q);
>> +		if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
>> +			xe_guc_exec_queue_trigger_cleanup(q);
>> +	}
>> +}
>> +
>>  #define parallel_read(xe_, map_, field_) \
>>  	xe_map_rd_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
>>  			field_)
>> @@ -939,6 +978,50 @@ static void wq_item_append(struct xe_exec_queue *q)
>>  	parallel_write(xe, map, wq_desc.tail, q->guc->wqi_tail);
>>  }
>>
>> +static void xe_guc_exec_queue_submission_start(struct xe_exec_queue *q)
>> +{
>> +	/*
>> +	 * If the exec queue is part of a multi queue group, then start submission
>> +	 * on all queues of the multi queue group.
>> +	 */
>> +	if (xe_exec_queue_is_multi_queue(q)) {
>> +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>> +		struct xe_exec_queue_group *group = q->multi_queue.group;
>> +		struct xe_exec_queue *eq;
>> +
>> +		xe_sched_submission_start(&primary->guc->sched);
>> +
>> +		mutex_lock(&group->list_lock);
>> +		list_for_each_entry(eq, &group->list, multi_queue.link)
>> +			xe_sched_submission_start(&eq->guc->sched);
>> +		mutex_unlock(&group->list_lock);
>> +	} else {
>> +		xe_sched_submission_start(&q->guc->sched);
>> +	}
>> +}
>> +
>> +static void xe_guc_exec_queue_submission_stop(struct xe_exec_queue *q)
>> +{
>> +	/*
>> +	 * If the exec queue is part of a multi queue group, then stop submission
>> +	 * on all queues of the multi queue group.
>> +	 */
>> +	if (xe_exec_queue_is_multi_queue(q)) {
>> +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>> +		struct xe_exec_queue_group *group = q->multi_queue.group;
>> +		struct xe_exec_queue *eq;
>> +
>> +		xe_sched_submission_stop(&primary->guc->sched);
>> +
>> +		mutex_lock(&group->list_lock);
>> +		list_for_each_entry(eq, &group->list, multi_queue.link)
>> +			xe_sched_submission_stop(&eq->guc->sched);
>> +		mutex_unlock(&group->list_lock);
>> +	} else {
>> +		xe_sched_submission_stop(&q->guc->sched);
>> +	}
>> +}
>> +
>>  #define RESUME_PENDING	~0x0ull
>>  static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
>>  {
>> @@ -1117,20 +1200,6 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>>  			       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
>>  }
>>
>> -static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>> -{
>> -	struct xe_guc *guc = exec_queue_to_guc(q);
>> -	struct xe_device *xe = guc_to_xe(guc);
>> -
>> -	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
>> -	wake_up_all(&xe->ufence_wq);
>> -
>> -	if (xe_exec_queue_is_lr(q))
>> -		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
>> -	else
>> -		xe_sched_tdr_queue_imm(&q->guc->sched);
>> -}
>> -
>>  /**
>>   * xe_guc_submit_wedge() - Wedge GuC submission
>>   * @guc: the GuC object
>> @@ -1204,8 +1273,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>>  	if (!exec_queue_killed(q))
>>  		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>>
>> -	/* Kill the run_job / process_msg entry points */
>> -	xe_sched_submission_stop(sched);
>> +	/*
>> +	 * Kill the run_job / process_msg entry points.
>> +	 * As this function is serialized across exec queues, it is safe to
>> +	 * stop and restart submission on all queues of a multi queue group.
>> +	 */
>> +	xe_guc_exec_queue_submission_stop(q);
>>
>>  	/*
>>  	 * Engine state now mostly stable, disable scheduling / deregister if
>> @@ -1241,7 +1314,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>>  				   q->guc->id);
>>  			xe_devcoredump(q, NULL, "Schedule disable failed to respond, guc_id=%d\n",
>>  				       q->guc->id);
>> -			xe_sched_submission_start(sched);
>> +			xe_guc_exec_queue_submission_start(q);
>>  			xe_gt_reset_async(q->gt);
>>  			return;
>>  		}
>> @@ -1252,7 +1325,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>>
>>  	xe_hw_fence_irq_stop(q->fence_irq);
>>
>> -	xe_sched_submission_start(sched);
>> +	xe_guc_exec_queue_submission_start(q);
>>
>>  	spin_lock(&sched->base.job_list_lock);
>>  	list_for_each_entry(job, &sched->base.pending_list, drm.list)
>> @@ -1410,8 +1483,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>  	    vf_recovery(guc))
>>  		return DRM_GPU_SCHED_STAT_NO_HANG;
>>
>> -	/* Kill the run_job entry point */
>> -	xe_sched_submission_stop(sched);
>> +	/*
>> +	 * Kill the run_job entry point.
>> +	 * As this function is serialized across exec queues, it is safe to
>> +	 * stop and restart submission on all queues of a multi queue group.
>> +	 */
>> +	xe_guc_exec_queue_submission_stop(q);
>>
>>  	/* Must check all state after stopping scheduler */
>>  	skip_timeout_check = exec_queue_reset(q) ||
>> @@ -1568,7 +1645,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>  	 * fences that are complete
>>  	 */
>>  	xe_sched_add_pending_job(sched, job);
>> -	xe_sched_submission_start(sched);
>> +	xe_guc_exec_queue_submission_start(q);
>>
>>  	xe_guc_exec_queue_trigger_cleanup(q);
>>
>> @@ -1592,7 +1669,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>  	 * but there is not currently an easy way to do in DRM scheduler. With
>>  	 * some thought, do this in a follow up.
>>  	 */
>> -	xe_sched_submission_start(sched);
>> +	xe_guc_exec_queue_submission_start(q);
>>  handle_vf_resume:
>>  	return DRM_GPU_SCHED_STAT_NO_HANG;
>>  }
>> @@ -1623,6 +1700,14 @@ static void __guc_exec_queue_destroy_async(struct work_struct *w)
>>  	guard(xe_pm_runtime)(guc_to_xe(guc));
>>  	trace_xe_exec_queue_destroy(q);
>>
>> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
>> +		struct xe_exec_queue_group *group = q->multi_queue.group;
>> +
>> +		mutex_lock(&group->list_lock);
>> +		list_del(&q->multi_queue.link);
>> +		mutex_unlock(&group->list_lock);
>> +	}
>> +
>>  	if (xe_exec_queue_is_lr(q))
>>  		cancel_work_sync(&ge->lr_tdr);
>>  	/* Confirm no work left behind accessing device structures */
>> @@ -1913,6 +1998,19 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>>
>>  	xe_exec_queue_assign_name(q, q->guc->id);
>>
>> +	/*
>> +	 * Maintain secondary queues of the multi queue group in a list
>> +	 * for handling dependencies across the queues in the group.
>> +	 */
>> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
>> +		struct xe_exec_queue_group *group = q->multi_queue.group;
>> +
>> +		INIT_LIST_HEAD(&q->multi_queue.link);
>> +		mutex_lock(&group->list_lock);
>> +		list_add_tail(&q->multi_queue.link, &group->list);
>> +		mutex_unlock(&group->list_lock);
>> +	}
>> +
>>  	trace_xe_exec_queue_create(q);
>>
>>  	return 0;
>> @@ -2140,6 +2238,10 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
>>
>>  static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
>>  {
>> +	if (xe_exec_queue_is_multi_queue_secondary(q) &&
>> +	    guc_exec_queue_reset_status(xe_exec_queue_multi_queue_primary(q)))
>> +		return true;
>> +
>>  	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
>>  }
>>
>> @@ -2801,9 +2903,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>  	 * jobs by setting timeout of the job to the minimum value kicking
>>  	 * guc_exec_queue_timedout_job.
>>  	 */
>> -	set_exec_queue_reset(q);
>> -	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
>> -		xe_guc_exec_queue_trigger_cleanup(q);
>> +	xe_guc_exec_queue_reset_trigger_cleanup(q);
>>
>>  	return 0;
>>  }
>> @@ -2882,9 +2982,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>>  	trace_xe_exec_queue_memory_cat_error(q);
>>
>>  	/* Treat the same as engine reset */
>> -	set_exec_queue_reset(q);
>> -	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
>> -		xe_guc_exec_queue_trigger_cleanup(q);
>> +	xe_guc_exec_queue_reset_trigger_cleanup(q);
>>
>>  	return 0;
>>  }
>> --
>> 2.43.0
>>
