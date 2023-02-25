Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E89C64EC7
	for <intel-xe@archiver.kernel.org>; Sat, 25 Feb 2023 05:34:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1433010E087;
	Sat, 25 Feb 2023 05:34:08 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521B310E087
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Feb 2023 05:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677303245; x=1708839245;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZXUd1NpF8m27ziuQgQbD6mQWCyJF2NUvPko7M2FVUm4=;
 b=Q9T0kDvoYx1OOMLUPlc8zMUqpQdBiZpw2yuq3K9G5xoSKMRAcHTe9Sdo
 tTJdSyGRv6IZFs224QhalH6V8GB8xQih8cb+me4sVOZhF1EeGrqm5e+xl
 CesHBBlgWnTv1+IU9KSSiqBJmOyUI/SaWfuXs9XtrjrX1yBT/PLP72uYa
 NluK7XZSmd12Z0Y/QMr3cZ8G6DMwdq8LCxWDjbMVopIr1GyStfNX1gP/t
 OifpO40Ad31xZnAgQTYpu5BE20sT6sf8ezWcbVRp/IjPyGUiR7iOKx2DD
 eir6fczWYnKnqhQmnuHAOYA4A1GIowcqg6Rtmh6PuzpOMbrmcy/iP3+sY w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="361144654"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; d="scan'208";a="361144654"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 21:34:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="673124968"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; d="scan'208";a="673124968"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 24 Feb 2023 21:34:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 21:34:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 21:34:02 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 21:34:02 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 21:34:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzbHReC9eHk52l2Dil2sPdlXp97iERMsguiMUo/+DtfQ/s6oNinx/NraHgoXl4356gd/JOwinLopQYMEh65vTS4SIrwcVMscgNs9TPC2WWr/zzeY1cqelaKcwOR4TJSmCiTR5z8Y4Ym1dHoQHkeBO/EuseepFyHo+XpsXALk5IIRIblTZwVB3SRPgdLNM5HogHng2gFUT2ZVpo43df5nOHhQy+eVKpmUqcxwFmhXUNe+bKBEok/2LrkQYfAH036TkyxEu94bUh5p91mxGpfluLipkmjVwevIkL/kdMyMWCOmLmPldm2dSVNXICDXW9AQ4uf4s1EtA+JZnOZ3DXplcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHwSBx1kI3dHsEqybjl5EBSe1pzMklzuawdG89HtHAM=;
 b=O+6YDl+P3J1KcEzy77R4A91htFgdnEmcR7Bqi1u7UrnZ0jCb742/0P9hIiR5kk21qq/GeRKhyqgmqeO3BpQsd2vpI7p43FKJHRIY62FwPA+MyaehV6rBpat01aom98WJtNMUBDKxBTWwujB3JCSLrKc+T36rM2ALOGQH6AlP1kgJk+uSxlP0jaF1RIVM0SCaFGRW2OLlD+YvnqganD5up8WLh5HDHTSlKN9CByVZq+aNWR8u/nXMOBGYhDT0fcspEREPBn/vz8BqhWeHP2ZZUOqLKoVQG0/3TK1okDlXzu2boGNbATcQpsCuFSCMEpbhX0XN0o5PSJkk3NcVRdwzFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4970.namprd11.prod.outlook.com (2603:10b6:806:11f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.25; Sat, 25 Feb
 2023 05:34:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%5]) with mapi id 15.20.6134.024; Sat, 25 Feb 2023
 05:34:00 +0000
Date: Fri, 24 Feb 2023 21:33:57 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230225053357.vkalte6rvkot7gfv@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230225001548.1743820-1-lucas.demarchi@intel.com>
 <20230225001548.1743820-11-lucas.demarchi@intel.com>
 <Y/la5HXodsbmcd6U@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Y/la5HXodsbmcd6U@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4970:EE_
X-MS-Office365-Filtering-Correlation-Id: f9b61bf6-0cdf-4fc2-62d7-08db16f1e59d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BWLseZYlqrHWqSRJDmEq39fbCV85e5/04m3IW0qZICaERpe2WPZ+auri64S22VVKrJ/JEsgHIPYvhBAACaHbizs6je8y3HVHnasuDOTq+VzgBNJH0jFZJ1O/P2sdWJ3kVMDLgsGiaFR82HcDsgqbJK6+4Jvsxu6Y4/j/TjJtGHmj48buRaTPmupIibGcyiZZ/bvPWG6pVJX9R5OXKrF5qA3dhdFzcwHayTqVEsT57NbxeYZLeh4zBGzS5EpphUu3OnTCwkfRo0XP/UfWdMxnv7MeZbU/J5buC2nse2sNOPXkMq9EzBJaUGKKwYvYF3ZUsfxmKxr+7rVx+okCc14BwMqn5UWX3C9HQkjsp7mQOUrp86x0HhPTcMBbOlkniU5DqpXysPx1i9SCaj5KgkpnA6a96reIXZpcCJ9HTyyit5eqczx2PhMHAShwOklfLfyjRXi7mi7i3XCf9MFOsvxUpotbNX2tXGryr7+lRW/1YENDKImqEvSkSjip9323ogC1wTR0Y0sD2vPygJCXzriTdkPNO18MXj8t0t7JZLWN7Af30pBK4mR/F/DFuJmikljvaO75zuEeKQAevImMVnzDsYvCV798bIFyIPMnCd64GMghvG7W2xy73g4saPz+cPP4CSHT8p2vrp33Aq2C5joEuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199018)(36756003)(86362001)(6486002)(2906002)(107886003)(1076003)(186003)(26005)(6506007)(9686003)(6512007)(4326008)(6666004)(66946007)(66556008)(66476007)(41300700001)(8676002)(5660300002)(6862004)(8936002)(54906003)(6636002)(316002)(38100700002)(478600001)(82960400001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RNhQK3PTGNe2mLpwMJ9TB3qsZBM8L6SwwiLekc6HEYUXFH2Oxm9mUm2HxrYt?=
 =?us-ascii?Q?CKPQzdHfFORZOQSHyUVo/hkNSVQPi5C63t7oOSE1YQYnpIPmNwN66TZK5QqK?=
 =?us-ascii?Q?8gn3uj6ONvKbQbsS3NW8FlGHtHplEzMQpnUSWMAhRXxVTWRhStVDMwdrtOAM?=
 =?us-ascii?Q?A6EATk04SZ/TWW8aoSgO3tmrMpatb1omeXUa87VuKMc+JcDESIQPCGiP4Bz4?=
 =?us-ascii?Q?rBCrHCFLwenEaDtkSkVXz+GwxrfE5AOJ14erhfQo0HIhoRt/5rD20BXcAzCh?=
 =?us-ascii?Q?UapbB16FRVc2i1FPTzaFnKjbUb7OLUoOlfKAadvuWxwDml/Ev1a4U07T1YUB?=
 =?us-ascii?Q?VG/t5eomeil+rXLQSGHv22BpWBOTK3TL8VHrB9i9h0gD32jI7qRP+YuAt/9u?=
 =?us-ascii?Q?JAyxlaaV7flkonz5/co37MuvZE1K4vIIilmTKQtZbzEvdYYcuvgKNu1OLVj0?=
 =?us-ascii?Q?iUapRYVES0ZyVwM+mBxeeEjDpNWqf/cI/jH01D4asb8AJp1HrP881QHkP27o?=
 =?us-ascii?Q?wkEMblUeAKAGl1bymWt+IUiS1TFFjOCn0VqM5TXwrYbYGJEcaiN4q44J7bLG?=
 =?us-ascii?Q?mmHG/noFgBjVbk1kJSgAYP6hpaYHwoMs3EFBQUiiP7m2QqsqZT0NLmciTyfS?=
 =?us-ascii?Q?TipjREYpOemHn0H8p4m3VoLT8FEX2UlIWsmJkhUczSIM1MANSNTUoNm89/8+?=
 =?us-ascii?Q?HoPHzQAfQAj5GuK8ph787joZ8Fase6H60VTqNdaIFt+BrjQ3eMPiZTmvjuo8?=
 =?us-ascii?Q?GBsSoguvd6lkUXoDeD2/ix8+MPBh9Hnoh0Tc8qa+bWHkcOixvQjzfo4/x2Zl?=
 =?us-ascii?Q?wHfD6yaBRjGrJ9SXB6We5P1U+4Iagi5ePsXPDu+/17h+gBp0V4i0LCBG7zOE?=
 =?us-ascii?Q?Sa9IWFH0xau62szmxi7rCTbMA4WVHvpNuz/jqPbdODlf5xgKz5DL1R5l2XP/?=
 =?us-ascii?Q?QPGqj3fSR9nUp+VObXZFbee0EMScXoXS1hyr5DIXMTUu86vvZ7YnCT2J/tfV?=
 =?us-ascii?Q?X5oGKQUkvIe2CHOAF9O2r3uQvL8ZqFVDoM6cGLzjCALR6lb+P/oMRHjl1poc?=
 =?us-ascii?Q?wGoVM5NE70AZ8B2vV+il5sFnZJLKlb+YQkHm9Bn8u0ROntIdbRc89cEyPNGf?=
 =?us-ascii?Q?zZokFe2eFkZhXj0bYr6EvqjMsQNmgUGvKMwcUi8oKyDDASV5kqybrWO6hrYK?=
 =?us-ascii?Q?trdQhnlXxicxqsV546CrxVkVMaElpTnTIsqdc0mS7d2s35zrc7VDHhsXW/4t?=
 =?us-ascii?Q?uwGNYrUCocfYqW+H9KlTWM+Uan0MBZlUbUQm7DpHg0R0yXyCg5nEpbazWYQi?=
 =?us-ascii?Q?qvrZF/K82f8SozTenfhSs1ig8Y7FViujWtut7fdbU8+HEtVpS9TTJ0bu4Uq8?=
 =?us-ascii?Q?aERYjPSJe5eh8EQT8P7QxffNOR4jYS1q1HNZhTltt/fLhj/9dk9laFV+rO68?=
 =?us-ascii?Q?kkynsjT6cREuptoWTgyZHS4Zi8ziicizdtq8Q4rqczEf24Qkz5vnXEJbWdHP?=
 =?us-ascii?Q?iNofkEsiVvhaE6VDg2m1SEhsPcrhEQJprPtgSeB6iLiHAFdl5fyKHeul0Tr6?=
 =?us-ascii?Q?ybTaHxBxJ3eSv/5ULhVbedF0Ity23I1UwGjDSrNUHaLoE65w86WrCgC+mFlR?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b61bf6-0cdf-4fc2-62d7-08db16f1e59d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2023 05:34:00.0625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S5G5DVbAVemoqmWDLtCsgxGJW76gTaE6bAq1qXmEfXHVl1yRN2IymWjWYetFlNaav0UwYIUsNlm7yUo/UZh3eDHSW89pvhPv6cZGxu0h0Sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4970
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 10/12] drm/xe: Add missing includes for
 i915_reg_defs.h and others
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
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Feb 24, 2023 at 04:48:36PM -0800, Matt Roper wrote:
>On Fri, Feb 24, 2023 at 04:15:46PM -0800, Lucas De Marchi wrote:
>> Several places were missing the i915_reg_defs.h include. Any place using
>> the i915_reg_t typedef or macros like _MMIO(), FIELD_PREP(), etc should
>> include the register defining them explicitly.
>>
>> This has gone unnoticed due to the way the display is integrated. By
>> including the display headers the i915_reg_defs.h is indirectly
>> included. Also, although the Makefile tries to add more cflags for the
>> display part, it fails in doing so: those cflags are actually added to
>> the entire Makefile (see subdir-ccflags documentation).
>>
>> This change is obtained by temporarily removing display from xe and
>> fixing the breakages.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c       | 6 ++++--
>>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 2 ++
>>  drivers/gpu/drm/xe/xe_gt_topology.c  | 2 ++
>>  drivers/gpu/drm/xe/xe_migrate.c      | 2 ++
>>  drivers/gpu/drm/xe/xe_pcode_api.h    | 2 ++
>>  drivers/gpu/drm/xe/xe_step.c         | 2 ++
>>  6 files changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 45e3c740fda2..8f2b2acd4024 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -31,6 +31,10 @@
>>  #include "xe_vm_madvise.h"
>>  #include "xe_wait_user_fence.h"
>>
>> +#include "../i915/i915_reg_defs.h"
>> +
>> +#define SOFTWARE_FLAGS_SPR33         _MMIO(0x4F084)
>> +
>>  static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>>  {
>>  	struct xe_file *xef;
>> @@ -405,8 +409,6 @@ static void device_kill_persitent_engines(struct xe_device *xe,
>>  	mutex_unlock(&xe->persitent_engines.lock);
>>  }
>>
>> -#define SOFTWARE_FLAGS_SPR33         _MMIO(0x4F084)
>> -
>>  void xe_device_wmb(struct xe_device *xe)
>>  {
>>  	struct xe_gt *gt = xe_device_get_gt(xe, 0);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> index 0e7047b89a83..19403dbea9f5 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> @@ -20,6 +20,8 @@
>>  #include "xe_trace.h"
>>  #include "xe_vm.h"
>>
>> +#include "../i915/i915_reg_defs.h"
>> +
>
>Does this file actually use any i915/xe register stuff or is it just the
>generic FIELD_GET() definitions causing a problem?  If the latter, then
>maybe
>
>        #include <linux/bitfield.h>
>
>would be more appropriate?

yep, looks like we can do with only linux/bitfield.h

Main issue in some place is the use of REG_BIT, REG_GENMASK,
_MMIO and MCR_REG, that are i915ism. But here none of those are used.

For REG_BIT/REG_GENMASK, I think what we want longterm is to add a
REG_BIT_U32 or GENMASK_U32 or so in a generic kernel header so we don't
need to rely on the definition from i915.

>
>
>>  struct pagefault {
>>  	u64 page_addr;
>>  	u32 asid;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>> index c76aaea1887c..264d6429318b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>> @@ -10,6 +10,8 @@
>>  #include "xe_gt.h"
>>  #include "xe_mmio.h"
>>
>> +#include "../i915/i915_reg_defs.h"
>> +
>
>I think there are some registers defined at the top of this file from
>before we figured out what we were going to do about register
>definitions; those should probably migrate into the new register
>headers.  And then we can just include the register header instead of
>the reg_defs.

I was thinking about leaving the register definitions that are need in
just one compilation unit in that unit rather than moving to the header.
But that was before the i915 -> xe header transition. So, yeah... I
think we can just move them to the header.

>
>>  #define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
>>  #define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index 6c0033cb238f..d845f7cadbd4 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -28,6 +28,8 @@
>>  #include "xe_trace.h"
>>  #include "xe_vm.h"
>>
>> +#include "../i915/i915_reg_defs.h"
>
>Maybe another candidate for linux/bitfield.h?
>
>> +
>>  /**
>>   * struct xe_migrate - migrate context.
>>   */
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 0762c8a912c7..2103f684a8b5 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -5,6 +5,8 @@
>>
>>  /* Internal to xe_pcode */
>>
>> +#include "../i915/i915_reg_defs.h"
>> +
>>  #define PCODE_MAILBOX			_MMIO(0x138124)
>>  #define   PCODE_READY			REG_BIT(31)
>>  #define   PCODE_MB_PARAM2		REG_GENMASK(23, 16)
>> diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
>> index ca77d0971529..e5e77cb9ea09 100644
>> --- a/drivers/gpu/drm/xe/xe_step.c
>> +++ b/drivers/gpu/drm/xe/xe_step.c
>> @@ -8,6 +8,8 @@
>>  #include "xe_device.h"
>>  #include "xe_platform_types.h"
>>
>> +#include "../i915/i915_reg_defs.h"
>
>And another linux/bitfield.h here too?


yeah, I will move those to use linux/bitfield.h

thanks
Lucas De Marchi

>
>
>Matt
>
>> +
>>  /*
>>   * Provide mapping between PCI's revision ID to the individual GMD
>>   * (Graphics/Media/Display) stepping values that can be compared numerically.
>> --
>> 2.39.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
