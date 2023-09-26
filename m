Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E74E7E649
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 15:00:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB3BE10E137;
	Tue, 26 Sep 2023 15:00:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B38110E137
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 15:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695740405; x=1727276405;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mOu9YaWaH+HeGRBvky7ls5hUWhiCvbYwJUeHne9C2XE=;
 b=eMgRMtqqfmF8hU1yRKAUWc+drAsBlJMg8eoRHp+mvIOicLZzK679YOyN
 G05qh0gYZsZFopRE5pj1EMsaDnkW9jCp21cAUHG9/hU3oJKRgsfv8q1PH
 4gQ2+/QUvKoMXBhfmDaGG6vALtUN5s9eNiRSQ33ikT/271kj86Invw5iC
 ItQa5pLfSmEM6HlBpGpaqwCVLhlEVy3njFdURNPye/5gj8zbMiIduheoC
 N4R0q7/cVd2Rtgzip5sb98uo5zxzub2E/d9RW5l0kAjsfajFw4/BijRNf
 VZ7nYIhCKjAhDoYd10oczMBJHxksvRFRFvfBITpFX+yLcOJ4I5o3z7jJs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="445715254"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="445715254"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 08:00:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="167216"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 07:59:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 08:00:04 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 08:00:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 08:00:03 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 08:00:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYko42xByVCNlh4e3Qw8nA6nxz4HtWzlcwM73q2sH4w+dK2lD+SHGDNXYDWVbFG206jylQZHy5kndcwRdANec9ph3HScyMwHSA+3vNqRLhPUZYt4cEe2xoF1WgHnogsrsQuD/9ZKsxyH7NPrDD+yaUqFKgugN7YxHMC8MdCxveqMgFyfcf0iyn9l0aSTjf83QnJZns5H4JgVN+iqTLE3m3x5jJodYqSgwNmLthUFIRikZYUpZQ/JZocre4wpErzNLvpdAhEBS1AraC25FJoPLnGZkmZ2xMWgjY8gagzDHafDcHdPw496lOh8fcYLW1wjHjiEHu59n+o23ctguOwX9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ej1XCtdtRMJmuLPm/oKxUojfdGKUG4Zt1qqnvLSbuBI=;
 b=YTaB7/sJNx76KwYZojZhlG5YtJeyJ8y3IGZmu9uJWN4gtc3ewM0m21mYtlHMIDWpP5R9f9ItFAVhUTmFzUUHfZJm9HRcEJWf3bU6R0CARLvfU9Zq7mBsx2FHWZWbszPXBqQOaHfsr7EQW1VkjLnT6fhJsNmOu1aXjFSeJWnZ3e5yuRnJHRFThRmPwhvTE5cxf1/ip2r5U4GkG/SGF1GiXLSsK8VrcLkCTI6tElqgL8dBWbvKfmNvnPdxbk9eiorMCa/LLp88RRF13fE+0Ecl9JlVqk55Xp+TVPH1XDrazh2hnJABzJL4vjbnr9X41OJdPkv+oc6OwGsti9gyUxXohQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 26 Sep
 2023 15:00:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6792.026; Tue, 26 Sep 2023
 15:00:01 +0000
Date: Tue, 26 Sep 2023 09:59:57 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <uxnu6kdcpkjbfqr3man6fbh66milmcmsiayzj2rmltvqn7uily@okpywq6kyxlr>
References: <20230925221049.2681491-1-lucas.demarchi@intel.com>
 <20230925221049.2681491-8-lucas.demarchi@intel.com>
 <20230925232720.GD2706891@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230925232720.GD2706891@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY5PR17CA0035.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::48) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: 85473e44-2923-42d3-8f7e-08dbbea141cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: phXuG+QPTVZ4n1z7qxf5Y9sf/HCV0AzLRZrykodZor+jR4W7Ljw41wRED7+F2zYL7AcVzZdsW80SJITqUyOE+kCmiWIIv9jl92KhIAXYO+0CCoWu1XBnUbe9kRfOldoBLezfuw+1hhfiIG6GYQ9jrVGQA3akLnCRYIDZGGpAm2EYjK66gYgoRM76R3mQ+IahUciPPPmNbXRI+lzps7N0Qk5vzwyurBqPq+7P6H2U3dtQlkEqAR4Pa3+UzpxG/zDOhAhCcZEKW1S2w8CAm3IUJEIVlRmRrmHHYsxGjR3QcoWtLbIIRx/kU8q+oswz7CPHhTtb72ruiSVIz8ln9uB73SkicE+MrPxInKPF3yHt/yAu5pRdC5HRg4bmCUxCoJJHz8QicoftfOfKrs2IpWQkEQi1wlx8uHqkrjwe4FbeJ/aH4eHQwNfSVnYco4Xx8WbISgpqnOyEoC8nL2CVEF2Ow2t6MxVlMVQOe639D6+NceX85sclRib/rpK2M1zmmtzWlkRx+xBb9oM1+PV41Z3IWfhfWUMK4r+sVbatFe89S4E4wa628YkIomKdt8llGYjQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(346002)(396003)(39860400002)(366004)(230922051799003)(451199024)(1800799009)(186009)(6666004)(478600001)(6486002)(6506007)(6636002)(2906002)(38100700002)(82960400001)(86362001)(41300700001)(33716001)(26005)(8936002)(6512007)(107886003)(9686003)(83380400001)(66946007)(8676002)(66476007)(316002)(5660300002)(6862004)(66556008)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fk47yAJlw29Yrw4/S7PKn49bK+L6idW94Ar/O79UzI1Mgsa1r3NJxJrSCtfP?=
 =?us-ascii?Q?R/Bwna/3Y7qnIIhYF684+pHXijj7xfy6GOqR30NQd13cWISIPtCBxmkeilXy?=
 =?us-ascii?Q?b4BR/e5BHEhGYc9LFsLzWmHnBx8ysipV/56a1POHqok9kUni9ZQRM9/0NRrd?=
 =?us-ascii?Q?n/0Sbv2OQNKknZLuQ0varrfdGl47fgGNm2NChenkJvrXFzF55X6X0hsGepRl?=
 =?us-ascii?Q?hxAMq8HC7hD6JGl4RgHV8QaXflhPnARa43UI+STBjit4pnuqDeL53d9++40J?=
 =?us-ascii?Q?AljWFkazyOAANrQiDo27njN4+n2sqRK51QcBRcXsSEfXIO+e79cZgNtHzWpZ?=
 =?us-ascii?Q?/nyiK3L5eaCAJDRqHguo7n5kKD8o7My47DZm9w3t4uhN2N8XGig1WcqGKOjq?=
 =?us-ascii?Q?8gEYKLzgmW0EulPPoRhqEdJ4Z+JDjg0VY4FeFkzgL2n5TDGRJuqVMZaqejc1?=
 =?us-ascii?Q?kiPqAthJH9TSobSfsOltLoYvsrpfcmfLB5uF7Wfkjdd83ITMeoI6+b+6usUA?=
 =?us-ascii?Q?mY6BBpPhw/G46g5KpADxnbZWdg7A67kcPpqEmxalLArsBwzcPUuHpozSiGT2?=
 =?us-ascii?Q?q5ImqnviglqtOOxq6zaYDQa/q+1ynFjEiQs7vdYELV8LKerd37RMdTzApRp/?=
 =?us-ascii?Q?5n3vOwUrD6PAP0Xo5CeLpnej6/BollrYIQev0bOlhOxAy0Lc15md9VGaB3g7?=
 =?us-ascii?Q?7It8AILMFjEeDc0kwo/OHN7cAaKcX0tKwZdKNlrROMxZETCUn1TYPMfERpTv?=
 =?us-ascii?Q?teWRbD2an5umZK/UI+H0RolizpgC0ehWj0y9KfQQCcsYklQdprb9SVTucX4U?=
 =?us-ascii?Q?0TCSYlbLazrBZZRUjAFLX/rU0N92/XHLdD49B9FC33N9VO4dwyjkqE/gBKPN?=
 =?us-ascii?Q?zvXCeFFuztCEUi7BPKUWcei65EveyfnW73fTymSwxtMXlYaqb4U4POtUlx0S?=
 =?us-ascii?Q?+Bmj7aHSbiKpRs2WgGixt9a0lGK/hKooAsybT6QvaxLEJvVSoKbeWNFLbc//?=
 =?us-ascii?Q?GFXth96Geml9JwFc+GsZBaYIR4tR/bcxsRGwB/xSFSFw7Yn5H1Y4GAsiWrfL?=
 =?us-ascii?Q?W+llQraedBP6AxjKyq6QuEHS0nv35sIAAnMzBe06MAGLoCRh+6OGYavQBO1F?=
 =?us-ascii?Q?Hblkv+jmusOmtbmzEBl2+RjSIXNAKhtOepH9Gv0S6AQWY2yvVJ4GSPKoPY3v?=
 =?us-ascii?Q?hUCm4VY1PKCeToGX+ruuahJoigv9aGLgONzEBe+1AOIBdMxkVRt4HDodzFcn?=
 =?us-ascii?Q?T7T6j6Rl5MxFKbUu1TFZYHt8u102o7TuHzhSNUeuGTGIkm+vTLQYN9kHc98C?=
 =?us-ascii?Q?RgD/xYpAKLHyX7VfRtpSYHmGCHbQBvRJTdDb+3nuAZp7LNK/+b9eWHqOal5b?=
 =?us-ascii?Q?mSnM+3PfJ8KNNb3KA3W5Hz6GLsq1SZWfrVSVq85SI3iJjokUhND4q5T6B0HG?=
 =?us-ascii?Q?VqcNGIpinFkg8YnhveM96vg66DlanA3/wedr8S8CyuCi6ZUXa/wIXvVVCffB?=
 =?us-ascii?Q?tBDLNo3H9SMTPVpPvFFm7govJ0+xDdaV9HfGWN5j4YFps+K5RQPgwEZ8a87b?=
 =?us-ascii?Q?uGd5ZZpC3HKUb83opc0DDOWp6geu5hR3poIifOw1a7+FpUkQStByQf82/erx?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85473e44-2923-42d3-8f7e-08dbbea141cb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 15:00:00.9825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+6RY39pV8+w8VA7nUO52pikaclhEqche59LU+hO6LT4dTjSEPIALmfG0kN504TyNIWpFl1iRzMotcQ78R8XEkxYTPSebka4kqWwwe3uUE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7424
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 7/9] drm/xe: Use pat_index to encode pte
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 04:27:20PM -0700, Matt Roper wrote:
>On Mon, Sep 25, 2023 at 03:10:47PM -0700, Lucas De Marchi wrote:
>> Change the xelp_pte_encode() function to use the platform-dependent
>> pat_index.  The same function can be used for all platforms as they only
>> need to encode the pat_index bits in the same pte layout. For platforms
>> that don't have the most significant bit, as long as they don't return a
>> bogus index they should be fine.
>>
>> To maintain consistency, also add xe argument to pde_encode_cache().
>> This will be needed for Xe2 later.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_bo.h       | 11 ++++---
>>  drivers/gpu/drm/xe/xe_migrate.c  |  6 ++--
>>  drivers/gpu/drm/xe/xe_pt_types.h |  4 ++-
>>  drivers/gpu/drm/xe/xe_vm.c       | 50 +++++++++++++++++++-------------
>>  4 files changed, 44 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index e3c90d45e723..885412581158 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -39,10 +39,13 @@
>>  #define XE_BO_INTERNAL_TEST		BIT(30)
>>  #define XE_BO_INTERNAL_64K		BIT(31)
>>
>> -#define PPAT_UNCACHED                   GENMASK_ULL(4, 3)
>> -#define PPAT_CACHED_PDE                 0
>> -#define PPAT_CACHED                     BIT_ULL(7)
>> -#define PPAT_DISPLAY_ELLC               BIT_ULL(4)
>> +#define XE_PPGTT_PDE_UNCACHED		GENMASK_ULL(4, 3)
>> +#define XE_PPGTT_PDE_CACHED		0
>
>Shouldn't these two be going away?  Indices 0 and 3 are only correct for
>certain platforms.  The PDE uses the same PAT encoding as the PTE, as
>documented in the bspec's PTF_COMMON_BITS (55730) and referenced from
>pages 62361, 55731, etc.

I was postponing this change to when it's needed in xe2, but it seems
this is already not compatible with (at least) MTL and what we have
currently have in xe is broken.

I will take a look to include this in v2. Thanks.

Lucas De Marchi

>
>> +
>> +#define XELPG_PPGTT_PTE_PAT3		BIT_ULL(62)
>> +#define XE_PPGTT_PTE_PAT2		BIT_ULL(7)
>> +#define XE_PPGTT_PTE_PAT1		BIT_ULL(4)
>> +#define XE_PPGTT_PTE_PAT0		BIT_ULL(3)
>>
>>  #define XE_PTE_SHIFT			12
>>  #define XE_PAGE_SIZE			(1 << XE_PTE_SHIFT)
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index f22356d69ae3..11dc3b0e0350 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -261,7 +261,8 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>>
>>  		level = 2;
>>  		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
>> -		flags = vm->pt_ops->pte_encode_addr(0, XE_CACHE_WB, level, true, 0);
>> +		flags = vm->pt_ops->pte_encode_addr(xe, 0, XE_CACHE_WB, level,
>> +						    true, 0);
>>
>>  		/*
>>  		 * Use 1GB pages, it shouldn't matter the physical amount of
>> @@ -498,7 +499,8 @@ static void emit_pte(struct xe_migrate *m,
>>  				devmem = true;
>>  			}
>>
>> -			addr |= m->q->vm->pt_ops->pte_encode_addr(addr, XE_CACHE_WB,
>> +			addr |= m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
>> +								  addr, XE_CACHE_WB,
>>  								  0, devmem, flags);
>>  			bb->cs[bb->len++] = lower_32_bits(addr);
>>  			bb->cs[bb->len++] = upper_32_bits(addr);
>> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
>> index bf5000499251..bd6645295fe6 100644
>> --- a/drivers/gpu/drm/xe/xe_pt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
>> @@ -11,6 +11,7 @@
>>  #include "xe_pt_walk.h"
>>
>>  struct xe_bo;
>> +struct xe_device;
>>  struct xe_vma;
>>
>>  enum xe_cache_level {
>> @@ -40,7 +41,8 @@ struct xe_pt_ops {
>>  			     enum xe_cache_level cache, u32 pt_level);
>>  	u64 (*pte_encode_vma)(u64 pte, struct xe_vma *vma,
>>  			      enum xe_cache_level cache, u32 pt_level);
>> -	u64 (*pte_encode_addr)(u64 addr, enum xe_cache_level cache,
>> +	u64 (*pte_encode_addr)(struct xe_device *xe, u64 addr,
>> +			       enum xe_cache_level cache,
>>  			       u32 pt_level, bool devmem, u64 flags);
>>  	u64 (*pde_encode_bo)(struct xe_bo *bo, u64 bo_offset,
>>  			     const enum xe_cache_level cache);
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 23452b98d853..ab9cf1de566a 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -1191,27 +1191,32 @@ static struct drm_gpuva_fn_ops gpuva_ops = {
>>  	.op_alloc = xe_vm_op_alloc,
>>  };
>>
>> -static u64 pde_encode_cache(enum xe_cache_level cache)
>> +static u64 pde_encode_cache(struct xe_device *xe, enum xe_cache_level cache)
>>  {
>> -	/* FIXME: I don't think the PPAT handling is correct for MTL */
>> -
>>  	if (cache != XE_CACHE_NONE)
>> -		return PPAT_CACHED_PDE;
>> +		return XE_PPGTT_PDE_CACHED;
>>
>> -	return PPAT_UNCACHED;
>> +	return XE_PPGTT_PDE_UNCACHED;
>
>As noted above, we're getting different behavior from these on different
>platforms.  We should be encoding the same way we do for the PTE.
>
>
>Matt
>
>>  }
>>
>> -static u64 pte_encode_cache(enum xe_cache_level cache)
>> +static u64 pte_encode_cache(struct xe_device *xe, enum xe_cache_level cache)
>>  {
>> -	/* FIXME: I don't think the PPAT handling is correct for MTL */
>> -	switch (cache) {
>> -	case XE_CACHE_NONE:
>> -		return PPAT_UNCACHED;
>> -	case XE_CACHE_WT:
>> -		return PPAT_DISPLAY_ELLC;
>> -	default:
>> -		return PPAT_CACHED;
>> -	}
>> +	u32 pat_index = xe->pat.idx[cache];
>> +	u64 pte = 0;
>> +
>> +	if (pat_index & BIT(0))
>> +		pte |= XE_PPGTT_PTE_PAT0;
>> +
>> +	if (pat_index & BIT(1))
>> +		pte |= XE_PPGTT_PTE_PAT1;
>> +
>> +	if (pat_index & BIT(2))
>> +		pte |= XE_PPGTT_PTE_PAT2;
>> +
>> +	if (pat_index & BIT(3))
>> +		pte |= XELPG_PPGTT_PTE_PAT3;
>> +
>> +	return pte;
>>  }
>>
>>  static u64 pte_encode_ps(u32 pt_level)
>> @@ -1229,11 +1234,12 @@ static u64 pte_encode_ps(u32 pt_level)
>>  static u64 xelp_pde_encode_bo(struct xe_bo *bo, u64 bo_offset,
>>  			      const enum xe_cache_level cache)
>>  {
>> +	struct xe_device *xe = xe_bo_device(bo);
>>  	u64 pde;
>>
>>  	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>>  	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
>> -	pde |= pde_encode_cache(cache);
>> +	pde |= pde_encode_cache(xe, cache);
>>
>>  	return pde;
>>  }
>> @@ -1241,11 +1247,12 @@ static u64 xelp_pde_encode_bo(struct xe_bo *bo, u64 bo_offset,
>>  static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>>  			      enum xe_cache_level cache, u32 pt_level)
>>  {
>> +	struct xe_device *xe = xe_bo_device(bo);
>>  	u64 pte;
>>
>>  	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>>  	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
>> -	pte |= pte_encode_cache(cache);
>> +	pte |= pte_encode_cache(xe, cache);
>>  	pte |= pte_encode_ps(pt_level);
>>
>>  	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
>> @@ -1257,12 +1264,14 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>>  static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>>  			       enum xe_cache_level cache, u32 pt_level)
>>  {
>> +	struct xe_device *xe = xe_vma_vm(vma)->xe;
>> +
>>  	pte |= XE_PAGE_PRESENT;
>>
>>  	if (likely(!xe_vma_read_only(vma)))
>>  		pte |= XE_PAGE_RW;
>>
>> -	pte |= pte_encode_cache(cache);
>> +	pte |= pte_encode_cache(xe, cache);
>>  	pte |= pte_encode_ps(pt_level);
>>
>>  	if (unlikely(xe_vma_is_null(vma)))
>> @@ -1271,7 +1280,8 @@ static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>>  	return pte;
>>  }
>>
>> -static u64 xelp_pte_encode_addr(u64 addr, enum xe_cache_level cache,
>> +static u64 xelp_pte_encode_addr(struct xe_device *xe, u64 addr,
>> +				enum xe_cache_level cache,
>>  				u32 pt_level, bool devmem, u64 flags)
>>  {
>>  	u64 pte;
>> @@ -1281,7 +1291,7 @@ static u64 xelp_pte_encode_addr(u64 addr, enum xe_cache_level cache,
>>
>>  	pte = addr;
>>  	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
>> -	pte |= pte_encode_cache(cache);
>> +	pte |= pte_encode_cache(xe, cache);
>>  	pte |= pte_encode_ps(pt_level);
>>
>>  	if (devmem)
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
