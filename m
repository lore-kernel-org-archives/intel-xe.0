Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33313C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 04:59:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB9510E083;
	Fri, 26 May 2023 04:59:48 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B2510E083
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 04:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685077186; x=1716613186;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=c1BsOVhQt7p/0Rgbp6XTQ/WDMyuEhuEgpHzYY8Lc9Ms=;
 b=Avc2zpFIzbJXNYlbL+nKIQp+NfmLEEUx6XSAtL4Sr3z+u2J+u154GWA5
 MmxFhOmKZsyqQGug48WVEnXQjgcEL1FZzEE4Bp+fs8gDhoeLpQEiO1xYE
 eh77emdJyy2fxd5dBBzzijT6drtXC6DjO7Q9wyqZzzgC17G6UnlPtlHW/
 cwK53H3AFf+WlVSKVpQo9F2QDgG/qxCRFHMTm9DxlWkTylSPegZxiIikE
 //xnmb7akuWKPhdmKKoP2w4d7Ph1IXUofHH0tSbGolADdU+f0QJYLeQm2
 qf7hRlUyylycuaVybSnGzrpgeugLRrYEmFwt527RrtPpdJ8wwZVAzw7+X A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="356500191"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; d="scan'208";a="356500191"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 21:59:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="682599966"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; d="scan'208";a="682599966"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 25 May 2023 21:59:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 21:59:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 21:59:44 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 21:59:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LC/LMZQsV/kMPI+Ilsvx3mZ/cnqjHXAoaTZr0qNY/GPNhOE+XPWwIEEUfMSPpojbHLOMGtrN7PtxAEUDkc35B7cnDyAGw6sgZpuDA9d8mvqZE9uFxY/d85QUhxwhVd/rAA7EpPA4UJ9ORAQF1cFpk64e8W/bmRwMlcVMZD16c3PNOCXbfVciSrvylheGDkan9S1qTGExkV0jkaR0OPf3h+zG0rYCJTFOvDrISiyUZptYeGndxGAzQMOFrljTeXfRUQ+PcG7K8YhY1urpJb1Ndx5D9y5dnZYIM5AB7qUow1c649sVI0zZ8n3ga4XjcK5bzr3nSXScUasC2CglFsrUZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRk0iNRxeqAL9+9L2gMHIPek74MvHBghdGadkROkVfM=;
 b=Un1a8VuuMepbEz3rpln3teDDyFTeaeV4t4fBswZSo6Wq9Do3D8armZPVYCQmCVVhNyxgrjnyD0yEFc77JfPLZUSNVYFQfK/YPY/RABo5UXXCcd2OwaEShmBgypW3/hAt9PxKvxWwkp+ITJKf2nf7L+xDD+VNibOY4kOzxJJghWF15zt7uDMJLpVkJwb6j7Hm1xgP5ffSc+8cbFeMh1xXcTSTG497bfbvXM8BheS1lsF032nCyPL3MaySdiKWiEmr1uZkgkv5BdJnlERLoUtENsLaAnlbRGMjr7tCk/MGmtbnmDYzsRyi/Knl2RWl1MObtmDRhsuAAl11ct8L+aShOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB6939.namprd11.prod.outlook.com (2603:10b6:930:59::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Fri, 26 May
 2023 04:59:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6433.017; Fri, 26 May 2023
 04:59:40 +0000
Date: Thu, 25 May 2023 21:59:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <5j63hmoa4gkvnagiag7fkgh4egt2blk5v3rwzks62b35dhpxkv@ovmscmirz6ne>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
 <20230525213407.3907094-13-lucas.demarchi@intel.com>
 <20230525231327.GZ10045@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230525231327.GZ10045@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR08CA0065.namprd08.prod.outlook.com
 (2603:10b6:a03:117::42) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB6939:EE_
X-MS-Office365-Filtering-Correlation-Id: d755c36b-1ebb-4bfe-e1c4-08db5da6035f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8kVKndxeq2xKoCLN47N3RJ0EzdPPCiKa/GHJC62YqT5/d8/iPeLAUiQHaDMQiOiCoJv4RmgpjZW5RNrXrkvPHB7FJgV/0fMt7Qnsmo0Rj5q0n/TlkgHm8ZWskcjdR3XJT8duzrivFmHtiFWsVBfODzy932wq264e43aYrk6m9Srf844tKnfXYvp3uCVy9lPumK2G7ZGVd61l7P+tvUCylOcmJ6Pd02D5ldwlqbQDaUnkACmNO2KDWcxd/nt63D/+ETnTluXa3A/8FKFOtWvr9adMU7VbvwtWWAWRka4CLTTkMePXbV9BOiapIbQosrQItJTuBjBmVGSLuMYVETMZJNtPANyJEAv9wuh6JyCx5ruP9e/sgC7rVT7b+hhnuFRFaJ1WZu8exx4L1b5lsPFFSBrEseyzx+FllPZ3+BkQD+DN9aOVNjBv0wv7KRMmN2miS4+nRoRXukhwuwVacYB42uGd9l3or5JavFfYmtlufk2OgW5NHTtlUkEWNigTgQKz78xFcJHbJgMYTN5DLEJWcfN8MhyX317kZwc7w7FZFZYR1VIOwU7RJaYlhhv23CrK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(366004)(396003)(346002)(136003)(39860400002)(451199021)(83380400001)(30864003)(2906002)(186003)(38100700002)(86362001)(33716001)(82960400001)(316002)(6486002)(8936002)(41300700001)(6862004)(5660300002)(8676002)(478600001)(4326008)(6636002)(66556008)(66476007)(66946007)(26005)(6506007)(6512007)(9686003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OX6V1oBcOipMznxm+QqmKw3ba6LW+ML9hZO7iJzaXRb+29EAJV7Aomrew4?=
 =?iso-8859-1?Q?AidfJgCFHqPkBTfwFHiIAfV2PjY1xAqf9ujj9b+WGkm2hae+E8coD5p5v6?=
 =?iso-8859-1?Q?/QiVLBnBcenTEjtOxKKbDeSYKLt+ORPB/9XMsgInH1TzQEbJ77QD1k2xrV?=
 =?iso-8859-1?Q?V2oVCkAyHVIs/UHlyNhlBxnr+p18jUv+umQi5xyRevbhBx+1FAt5bR17Q8?=
 =?iso-8859-1?Q?FSz2TG+FEzIwuk6+0d07WmtIUfwV13nuZTLhkeH+852oGJRIuUP1SDBQOg?=
 =?iso-8859-1?Q?Uab9Xy2zHwIHe8LvzySDFsdM4cQZgolWM1P8Szh4igvyljA+I/6cZz846o?=
 =?iso-8859-1?Q?kdgbiUZX82X+FnNCvMrS8R9X2cG5Ri0/2ZobrqLMvsQ2O7Pqr0rR44xGog?=
 =?iso-8859-1?Q?IEJ8SnZFqXrCutogjaQhTvDGPYzDXbDNzfjGJn/YRADlTGssi5yn9soxWs?=
 =?iso-8859-1?Q?exFcx3PmlUdogOyESLnnb0R4pcHPS54fFFNqEqYAh+a3fBlMl+NRBqHpoy?=
 =?iso-8859-1?Q?Kvx2CNT5+aioc7mCS2nKDEZrRVF1A2+jRqUh56EusWovzYQ6Ja8+B+BDNh?=
 =?iso-8859-1?Q?t7YonzS4J3UY1+HV6TESiuaHj+mSIibQDF97Z8p6UMmJWgARdWuz0e5xsY?=
 =?iso-8859-1?Q?0dAh59SEaNbSiwbwEJ/QWqA+4Z6CTBjNmLwe3ZsC67945Ulx8XQMtyJr2L?=
 =?iso-8859-1?Q?d8j3GA7g0AWVsNg9Icf5fQUUlo45gGaLDOYWsSyKQoXf6E/Bhhiya31Vl1?=
 =?iso-8859-1?Q?WsgFEKPycbE6BpLjpkVxbq8b5O/LM2VVhDp6lh3apYtwZFOobhMtCSFEak?=
 =?iso-8859-1?Q?kXwaYsyO8XS4vFliG5smpF6hBTnOGzIMz5d2hzYi2qFfz0cPX/ZxKG9pB1?=
 =?iso-8859-1?Q?TLmgVHn/sL19x7kzNVh3yzs1FTAriNeh6fByYWqXJ371UPeoGTNU+kqzc9?=
 =?iso-8859-1?Q?c2OH0k4M3heJDBtZaFpH1CNaER3aEyh2DBJftprD+ilkx1zZyL0sIRrW8t?=
 =?iso-8859-1?Q?JdBoUWOrP/G/LteWROO3xTS/LeWH/XBQ/UyyyisBjgtY9zdTCEuFE954Ss?=
 =?iso-8859-1?Q?Ymxkks3R8pUc498YOHgEZuJDZWZrmulyc8VVLJBOOo+DvIZmUZDqIhYUjI?=
 =?iso-8859-1?Q?Rv3R4qoM8q0DhvRZN65OeV+jPiNnoLAS+hjI50reCcC9t+cuw8u/sboGEN?=
 =?iso-8859-1?Q?ZtSLCY6xpfxY+LemLdePI1pVQlryrTn+uskJRRnDTQee5bDSphaIS2R8a2?=
 =?iso-8859-1?Q?VGaM1iH6+wwKfn7i7UBnzFyaExNmc5A+1fQjcQy0tOuqQ2ZOmGJu9tsaUV?=
 =?iso-8859-1?Q?xCpm/NgHjaez7UWV9l5Al7BlWsRohz9b61M51Dlq74aDfT/vXQh7eRaDmL?=
 =?iso-8859-1?Q?exSBKIFb5FkjEK0D2/aNf+nlLME1w/6UHldx/p1SQSoma3JQXn6UEhXcuT?=
 =?iso-8859-1?Q?4O6Y9/CXzaN7EZqi7pUcS270bZjGT+4B6Njc2IlVCNwWUhGlV+hOdCTgQ8?=
 =?iso-8859-1?Q?aYZtQLYGH9HRtwbvtTFXxoSXaukDzc7IuB73Ys7b6B5PEqhaE1ILE1F0XC?=
 =?iso-8859-1?Q?roGL4CbVVDDmDtpWTNCw9Jvkuetll5DUBckOze7bDZ4bspc30sB78Y+4OQ?=
 =?iso-8859-1?Q?H/Ds5ZqLmWRbK0chRiygMTkpFEmF2VM5pydaYw6a4sAGTw9/8lRTwzNw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d755c36b-1ebb-4bfe-e1c4-08db5da6035f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 04:59:40.7757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7CZR3i6ZG8/OBmLhE8+sBO47V9qrhtJwSM6Kpt/gyHdD3mnm6WafFdp2tt92s+gudJAFBkPeoR8T0f96RLfJkRzVPAHaPPFTlCyYK+GnK/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6939
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 12/21] drm/xe: Add support for OOB
 workarounds
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

On Thu, May 25, 2023 at 04:13:27PM -0700, Matt Roper wrote:
>On Thu, May 25, 2023 at 02:33:58PM -0700, Lucas De Marchi wrote:
>> There are WAs that, due to their nature, cannot be applied from a
>> central place like xe_wa.c. Those are peppered around the rest of the
>> code, as needed. Now they have a new name:  "out-of-band workarounds".
>>
>> These workarounds have their names and rules still grouped in xe_wa.c,
>> inside the xe_wa_oob array, which is generated at compile time by
>> xe_wa_oob.rules and the hostprog xe_gen_wa_oob. The code generation
>> guarantees that the header xe_wa_oob.h contains the IDs for the
>> workarounds that match the index in the table. This way the runtime
>> checks that are spread throughout the code are simple tests against the
>> bitmap saved during initialization.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile        |  14 +++
>>  drivers/gpu/drm/xe/xe_gen_wa_oob.c | 164 +++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_gt.c         |   1 +
>>  drivers/gpu/drm/xe/xe_gt_types.h   |   2 +
>>  drivers/gpu/drm/xe/xe_wa.c         |  40 ++++++-
>>  drivers/gpu/drm/xe/xe_wa.h         |   9 ++
>>  drivers/gpu/drm/xe/xe_wa_oob.rules |   0
>>  7 files changed, 226 insertions(+), 4 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/xe_gen_wa_oob.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_wa_oob.rules
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index e058b1dda6e6..738975faaa05 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -26,6 +26,20 @@ subdir-ccflags-$(CONFIG_DRM_XE_WERROR) += -Werror
>>
>>  subdir-ccflags-y += -I$(obj) -I$(srctree)/$(src)
>>
>> +# generated sources
>> +hostprogs := xe_gen_wa_oob
>> +
>> +XE_WA_OOB := $(obj)/generated/xe_wa_oob.c $(obj)/generated/xe_wa_oob.h
>> +
>> +quiet_cmd_wa_oob = GEN     xe_wa_oob.[ch]
>
>I think we could use "$(notdir $(XE_WA_OOB))" here to avoid hardcoding
>the names?

yeah, sounds good.

>
>Anyway, the rest looks okay.
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>
>> +      cmd_wa_oob = $^ $(XE_WA_OOB)
>> +
>> +$(XE_WA_OOB) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
>> +	@mkdir -p $(@D)
>> +	$(call cmd,wa_oob)
>> +
>> +%.o:  $(XE_WA_OOB)

I don't know why, but when building for kunit this is not working for
me.  I'm having to replace it with:

$(obj)/xe_wa.o $(obj)/xe_guc.o: $(XE_WA_OOB)

but that is ugly and with the workarounds spread throughout the codebase
it will be a pain to maintain this in the build system. Any alternative?

Lucas De Marchi

>> +
>>  # Please keep these build lists sorted!
>>
>>  # core driver code
>> diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>> new file mode 100644
>> index 000000000000..930cdb7ccf52
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>> @@ -0,0 +1,164 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#define _GNU_SOURCE
>> +#include <ctype.h>
>> +#include <errno.h>
>> +#include <stdbool.h>
>> +#include <stdio.h>
>> +#include <string.h>
>> +
>> +#define HEADER \
>> +	"// SPDX-License-Identifier: MIT\n" \
>> +	"\n" \
>> +	"/*\n" \
>> +	" * DO NOT MODIFY.\n" \
>> +	" *\n" \
>> +	" * This file was generated from rules: %s\n" \
>> +	" */\n" \
>> +	"#ifndef _GENERATED_XE_WA_OOB_\n" \
>> +	"#define _GENERATED_XE_WA_OOB_\n" \
>> +	"\n" \
>> +	"enum {\n"
>> +
>> +#define FOOTER \
>> +	"};\n" \
>> +	"\n" \
>> +	"#endif\n"
>> +
>> +static void print_usage(FILE *f)
>> +{
>> +	fprintf(f, "usage: %s <input-rule-file> <generated-c-source-file> <generated-c-header-file>\n",
>> +		program_invocation_short_name);
>> +}
>> +
>> +static void print_parse_error(const char *err_msg, const char *line,
>> +			      unsigned int lineno)
>> +{
>> +	fprintf(stderr, "ERROR: %s\nERROR: %u: %.60s\n",
>> +		err_msg, lineno, line);
>> +}
>> +
>> +static char *strip(char *line, size_t linelen)
>> +{
>> +	while (isspace(*(line + linelen)))
>> +		linelen--;
>> +
>> +	line[linelen - 1] = '\0';
>> +
>> +	return  line + strspn(line, " \f\n\r\t\v");
>> +}
>> +
>> +#define MAX_LINE_LEN 4096
>> +static int parse(FILE *input, FILE *csource, FILE *cheader)
>> +{
>> +	char line[MAX_LINE_LEN + 1];
>> +	char *name, *prev_name = NULL, *rules;
>> +	unsigned int lineno = 0, idx = 0;
>> +
>> +	while (fgets(line, sizeof(line), input)) {
>> +		size_t linelen;
>> +		bool is_continuation;
>> +
>> +		if (line[0] == '\0' || line[0] == '#' || line[0] == '\n') {
>> +			lineno++;
>> +			continue;
>> +		}
>> +
>> +		linelen = strlen(line);
>> +		if (linelen == MAX_LINE_LEN) {
>> +			print_parse_error("line too long", line, lineno);
>> +			return -EINVAL;
>> +		}
>> +
>> +		is_continuation = isspace(line[0]);
>> +		name = strip(line, linelen);
>> +
>> +		if (!is_continuation) {
>> +			name = strtok(name, " \t");
>> +			rules = strtok(NULL, "");
>> +		} else {
>> +			if (!prev_name) {
>> +				print_parse_error("invalid rule continuation",
>> +						  line, lineno);
>> +				return -EINVAL;
>> +			}
>> +
>> +			rules = name;
>> +			name = NULL;
>> +		}
>> +
>> +		if (rules[0] == '\0') {
>> +			print_parse_error("invalid empty rule\n", line, lineno);
>> +			return -EINVAL;
>> +		}
>> +
>> +		if (name) {
>> +			fprintf(cheader, "\tXE_WA_OOB_%s = %u,\n", name, idx);
>> +			fprintf(csource, "{ XE_RTP_NAME(\"%s\"), XE_RTP_RULES(%s) },\n",
>> +				name, rules);
>> +		} else {
>> +			fprintf(csource, "{ XE_RTP_NAME(NULL), XE_RTP_RULES(%s) },\n",
>> +				rules);
>> +		}
>> +
>> +		idx++;
>> +		lineno++;
>> +		prev_name = name;
>> +	}
>> +
>> +	fprintf(cheader, "\t_XE_WA_OOB_COUNT = %u\n", idx);
>> +
>> +	return 0;
>> +}
>> +
>> +int main(int argc, const char *argv[])
>> +{
>> +	enum {
>> +		ARGS_INPUT,
>> +		ARGS_CSOURCE,
>> +		ARGS_CHEADER,
>> +		_ARGS_COUNT
>> +	};
>> +	struct {
>> +		const char *fn;
>> +		const char *mode;
>> +		FILE *f;
>> +	} args[] = {
>> +		[ARGS_INPUT] = { .fn = argv[1], .mode = "r" },
>> +		[ARGS_CSOURCE] = { .fn = argv[2], .mode = "w" },
>> +		[ARGS_CHEADER] = { .fn = argv[3], .mode = "w" },
>> +	};
>> +	int ret = 1;
>> +
>> +	if (argc < 3) {
>> +		fprintf(stderr, "ERROR: wrong arguments\n");
>> +		print_usage(stderr);
>> +		return 1;
>> +	}
>> +
>> +	for (int i = 0; i < _ARGS_COUNT; i++) {
>> +		args[i].f = fopen(args[i].fn, args[i].mode);
>> +		if (!args[i].f) {
>> +			fprintf(stderr, "ERROR: Can't open %s: %m\n",
>> +				args[i].fn);
>> +			goto err;
>> +		}
>> +	}
>> +
>> +	fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn);
>> +	ret = parse(args[ARGS_INPUT].f, args[ARGS_CSOURCE].f,
>> +		    args[ARGS_CHEADER].f);
>> +	if (!ret)
>> +		fprintf(args[ARGS_CHEADER].f, FOOTER);
>> +
>> +err:
>> +	for (int i = 0; i < _ARGS_COUNT; i++) {
>> +		if (args[i].f)
>> +			fclose(args[i].f);
>> +	}
>> +
>> +	return ret;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index d139554316d4..18eda5b1377f 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -321,6 +321,7 @@ int xe_gt_init_early(struct xe_gt *gt)
>>  		return err;
>>
>>  	xe_wa_process_gt(gt);
>> +	xe_wa_process_oob(gt);
>>  	xe_tuning_process_gt(gt);
>>
>>  	return 0;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index 017ab60f2498..b83c834e7ced 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -368,6 +368,8 @@ struct xe_gt {
>>  		unsigned long *engine;
>>  		/** @lrc: bitmap with active LRC workarounds */
>>  		unsigned long *lrc;
>> +		/** @oob: bitmap with active OOB workaroudns */
>> +		unsigned long *oob;
>>  	} wa_active;
>>  };
>>
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index b717e0025bd9..ded100245479 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -9,6 +9,7 @@
>>  #include <kunit/visibility.h>
>>  #include <linux/compiler_types.h>
>>
>> +#include "generated/xe_wa_oob.h"
>>  #include "regs/xe_engine_regs.h"
>>  #include "regs/xe_gt_regs.h"
>>  #include "regs/xe_regs.h"
>> @@ -73,8 +74,8 @@
>>   *      engine registers are restored in a context restore sequence. This is
>>   *      currently not used in the driver.
>>   *
>> - * - Other:  There are WAs that, due to their nature, cannot be applied from a
>> - *   central place. Those are peppered around the rest of the code, as needed.
>> + * - Other/OOB:  There are WAs that, due to their nature, cannot be applied from
>> + *   a central place. Those are peppered around the rest of the code, as needed.
>>   *   Workarounds related to the display IP are the main example.
>>   *
>>   * .. [1] Technically, some registers are powercontext saved & restored, so they
>> @@ -579,8 +580,31 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>>  	{}
>>  };
>>
>> +static __maybe_unused const struct xe_rtp_entry oob_was[] = {
>> +#include <generated/xe_wa_oob.c>
>> +	{}
>> +};
>> +
>> +static_assert(ARRAY_SIZE(oob_was) - 1 == _XE_WA_OOB_COUNT);
>> +
>>  __diag_pop();
>>
>> +/**
>> + * xe_wa_process_oob - process OOB workaround table
>> + * @gt: GT instance to process workarounds for
>> + *
>> + * Process OOB workaround table for this platform, marking in @gt the
>> + * workarounds that are active.
>> + */
>> +void xe_wa_process_oob(struct xe_gt *gt)
>> +{
>> +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
>> +
>> +	xe_rtp_process_ctx_enable_active_tracking(&ctx, gt->wa_active.oob,
>> +						  ARRAY_SIZE(oob_was));
>> +	xe_rtp_process(&ctx, oob_was);
>> +}
>> +
>>  /**
>>   * xe_wa_process_gt - process GT workaround table
>>   * @gt: GT instance to process workarounds for
>> @@ -641,13 +665,14 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
>>  int xe_wa_init(struct xe_gt *gt)
>>  {
>>  	struct xe_device *xe = gt_to_xe(gt);
>> -	size_t n_lrc, n_engine, n_gt, total;
>> +	size_t n_oob, n_lrc, n_engine, n_gt, total;
>>  	unsigned long *p;
>>
>>  	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
>>  	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
>>  	n_lrc = BITS_TO_LONGS(ARRAY_SIZE(lrc_was));
>> -	total = n_gt + n_engine + n_lrc;
>> +	n_oob = BITS_TO_LONGS(ARRAY_SIZE(oob_was));
>> +	total = n_gt + n_engine + n_lrc + n_oob;
>>
>>  	p = drmm_kzalloc(&xe->drm, sizeof(*p) * total, GFP_KERNEL);
>>  	if (!p)
>> @@ -658,6 +683,8 @@ int xe_wa_init(struct xe_gt *gt)
>>  	gt->wa_active.engine = p;
>>  	p += n_engine;
>>  	gt->wa_active.lrc = p;
>> +	p += n_lrc;
>> +	gt->wa_active.oob = p;
>>
>>  	return 0;
>>  }
>> @@ -677,4 +704,9 @@ void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
>>  	drm_printf(p, "\nLRC Workarounds\n");
>>  	for_each_set_bit(idx, gt->wa_active.lrc, ARRAY_SIZE(lrc_was))
>>  		drm_printf_indent(p, 1, "%s\n", lrc_was[idx].name);
>> +
>> +	drm_printf(p, "\nOOB Workarounds\n");
>> +	for_each_set_bit(idx, gt->wa_active.oob, ARRAY_SIZE(oob_was))
>> +		if (oob_was[idx].name)
>> +			drm_printf_indent(p, 1, "%s\n", oob_was[idx].name);
>>  }
>> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
>> index defefa5d9611..cfe685989524 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.h
>> +++ b/drivers/gpu/drm/xe/xe_wa.h
>> @@ -11,6 +11,7 @@ struct xe_gt;
>>  struct xe_hw_engine;
>>
>>  int xe_wa_init(struct xe_gt *gt);
>> +void xe_wa_process_oob(struct xe_gt *gt);
>>  void xe_wa_process_gt(struct xe_gt *gt);
>>  void xe_wa_process_engine(struct xe_hw_engine *hwe);
>>  void xe_wa_process_lrc(struct xe_hw_engine *hwe);
>> @@ -18,4 +19,12 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe);
>>  void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
>>  void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
>>
>> +/**
>> + * XE_WA - Out-of-band workarounds, that don't fit the lifecycle any
>> + *         other more specific type
>> + * @gt__: gt instance
>> + * @id__: XE_OOB_<id__>, as generated by build system in generated/xe_wa_oob.h
>> + */
>> +#define XE_WA(gt__, id__) test_bit(XE_WA_OOB_ ## id__, (gt__)->wa_active.oob)
>> +
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> new file mode 100644
>> index 000000000000..e69de29bb2d1
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
