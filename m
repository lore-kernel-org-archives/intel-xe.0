Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C58EB64DA
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jul 2023 20:49:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B0110E07C;
	Fri,  7 Jul 2023 20:49:11 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB86010E07C
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jul 2023 20:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688762948; x=1720298948;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9X1NkjPdbieiiTnAHu8YfWW++JjSKGn23ScZW5tg4/s=;
 b=F+qXp23IKSwj9lZAQ1QnSvSdhrnTJcmVI/YSNVkY3qhQe4VTG9B7o9/i
 xpPlUCGZbaQllsBdwjFjOKfdr2Ur/07nWu1C55/nlSEcKUXt7fFy1fHKA
 L/YP4Kq6L6REjnfCL9u5sXu8dxMpTrManXp9OkZupl6hgXeSVnPh1r8N5
 zXYzH5LXIgqW5VAm21hoEBf66ySEomzxwm3q+HxAaSVq3+2lUqMHKt6du
 ppEUpLcNET4FeDmZxNVl3vurWOw7kLUAji2yaJ40Dpg5tjfe1t9tieUyQ
 tF5XVSFYhsyUSTl7N2fdeF2zHAVd38cxUNLVABXrGbWeenXY+pJUySOlE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="348776716"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="348776716"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 13:49:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="833529376"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="833529376"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 07 Jul 2023 13:49:07 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 7 Jul 2023 13:49:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 7 Jul 2023 13:49:07 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 7 Jul 2023 13:49:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZlhHJBjyaiWwZUvp6oNeX6p4ycRiB+NHKYtoqD+7XVHJIIK5zUicaO1nW/9raaWeyE4Egftdu3ySAeQnoU5VvsNIaq6FbVXCjhK14HkPIp3bKAPmQG6qmySgb3ODETCcJqO0fxVUu86W5NyHHaF7h9VOnztP0iVSVLOvCOUQrIrVtSdY3GAKgr1oGwuTQhnunSuFmoKUKQZRFZzlBnnfLgP1UNPfdSzQJspWuj+8LNJlxiYgrZmdhzGBWTAfBAxGUYbtySfILElzLEFxrxNvi+YJHw4OPJotK9ivgRtROz18tP1nla0/049VMPvtX4431RbI16Si5NZcz1Yle9o1qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNkHEPBqeOPs1dQGFVoHAzu+uuYe8QrkVGTBsdOuIXY=;
 b=Jw4CfcTrUwOeoBatdppiwM2w2K4RdEAa31yQF1KQLDIYrY+hioajY1GZxWsoJxgi6ilPmmA4aUwQz7l2OvmEDEQ75M0uPoaOpJDUNZdUT7k802UQ36yHx+hyFf2qIypU/2HA9bDROhjqIt66slZVlF5J5sebypk2RbAjYX7qHm7QwWHYir5hUgVwSEg0FOEcwNO5+VX5Ia5kZUbsag0nM1wqoi4WXUXXntTeibO9JVj0qKbw3HQwAHzmvWANPLdMfkETm8rmjlWtraDNXj8usvOPu4STrss7mBWQzow7e6sQEUZJmW1jn7TLPqyDrTjwQiQSQNRIYxnFBQ7Cb1vLbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5927.namprd11.prod.outlook.com (2603:10b6:510:14e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 20:49:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f1c:4be6:c116:1bb6]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f1c:4be6:c116:1bb6%4]) with mapi id 15.20.6565.019; Fri, 7 Jul 2023
 20:49:04 +0000
Date: Fri, 7 Jul 2023 17:48:58 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <6gpkciv555zcg6lfmrueztilmy4ymbbcogaedib5dznu6tzg4r@d3t65gydqrxt>
X-Patchwork-Hint: comment
References: <20230706142728.6-1-francois.dugast@intel.com>
 <20230706142728.6-3-francois.dugast@intel.com>
 <87pm55jdx5.fsf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pm55jdx5.fsf@intel.com>
X-ClientProxiedBy: BY5PR16CA0027.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::40) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5927:EE_
X-MS-Office365-Filtering-Correlation-Id: 8698c90b-adc3-4a2e-5dc0-08db7f2b998e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LVRKFuhPvDNKpTjp2DtfnSRt1JDdKQUNzggwy73JY9bTRsEfHqvt00pvOsis5JWUt2veIYCBv7ZhrFRQHKtvQKyiULifkuPbZuaf2wvNWlsaadSqDcXm+JHHMr3zZ85K+lP4FseVeN4N8/whqaIECX3FRoGr6rw83tBnzqFVmzLIrA6bizCcmC0OXM5lxJRvfzxpOLKq/G4X3Zn/3kiqtVpYFY4hXd1NLPfTBi33WKeXko2TgdspEuJhL1tYF8lcxWyG6q8svI20UWEY+S2xC/zVQSUIEs4GF80/3hUlHWJC3CgIgRUOeeNndCzgMM6sZs2D6rnX9zamxwwdHocS6KEfFhs0DMLaUVd5oKZ9kvCJkl6LrJrN6XCEEeR3j4QkOyFrzIoInyJLZiFgxZ0absG/1XKVMpbtX/jjGz/Q5PCb7AH51odSZ8qi/HtbttisVC/j27JG6Me9g72s3QwnL2VL1nciIbd8SkP95Jbyo4NW25mh+YjlDqRi+qvOtdcfN6YHcqShZqb3RI4sIpM3ZKhgI9YKKTjJfVUKN/BLAvXVRtZfVNDHEiAkBr8LgHVP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199021)(82960400001)(86362001)(33716001)(66899021)(38100700002)(6512007)(41300700001)(8676002)(9686003)(26005)(5660300002)(186003)(6506007)(2906002)(8936002)(83380400001)(66946007)(478600001)(6666004)(316002)(6486002)(6916009)(66556008)(66476007)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IGGNF6eb546ted1na/dZJzqd6VPi385rJg6qa1fMfESqQG7h66UA8XlZjH?=
 =?iso-8859-1?Q?Qv9MeHWKN/xhmOp6l2u8e4Aa/YHp7P9S3nb5A7dwg6Ojg7hKCWI5mt5KUd?=
 =?iso-8859-1?Q?TD9631nDfduMzwBszfljvrxM6tCYlWwd7GENOFu8HxAsw++L4QWfWwc7qi?=
 =?iso-8859-1?Q?6kVZIDfk3agDSGtv3t4cCj1EOm7aJW10RXS1zmurPUx/BRHEuRiOkjoAG2?=
 =?iso-8859-1?Q?xwutCQAAsB68ehIS8Kel2SI45ICOmSZHD1Azsnv9BFco52K62JBYdNHRVk?=
 =?iso-8859-1?Q?c/c6jgZWIYCsH4okxaPypycJcYeihvDv9fH57VuEKMWE6bA0TXUcBhUm6J?=
 =?iso-8859-1?Q?fqAG32hubzN0kerAldBL7plGiuVZzfUkCrSADxBvIax//o2VCYI4sKA0qb?=
 =?iso-8859-1?Q?4Z5naTXt3Iao92ulGe9JqZF3hWPJEBIU+lB+xnHLi7VdXzbPDDahZ6XvTX?=
 =?iso-8859-1?Q?LzcnXbaYrWV1iKFgOxLeZZ4r4JOXprIAnr3HBj2+nB2WqknLJ3NG9b9IAZ?=
 =?iso-8859-1?Q?nqW29r9WdOH1YwN9nybUWbwnZoM4o6yI/1+baqCte9JCcgcKgZt+541//L?=
 =?iso-8859-1?Q?rn7Jjb/ND/7/PtpNiyCU0g8HKKp6DAwznlJ+vZmyEAgPICWJN8m9A45WDJ?=
 =?iso-8859-1?Q?c2hFGkCTRPkSHVNudFBNjv2x8TKXnGxj8Nlk3EZHPCYBqQLozog0p+zVQd?=
 =?iso-8859-1?Q?Su8Fy58CngpV5iM41lNzJzhFeFbXY1YJKoOM7DrRPrApf8le7wEg1R6vfw?=
 =?iso-8859-1?Q?7y1Hto14LOFgxV9+MyQmFuxrTUvCj6QyDBZyxI03dl2ZJzsw9EIf1b6LXf?=
 =?iso-8859-1?Q?4+nP0QnTjqbLQPoR2qtHvjvOZC4keo+MLLe0ZxGtIJX6gteXZtvOP8M5HT?=
 =?iso-8859-1?Q?IYueHj6SzLBcHTHAa1Umyxan6BUvWPTL8ovd/U13+2BKChAPR5osd0PCfT?=
 =?iso-8859-1?Q?zkLE+YWOR7o4k0JX/USxioZx5xhgAO9+2HisfXTZ9JK5acSGvECESPc4iZ?=
 =?iso-8859-1?Q?vyqpO2WBG0HEndwNARvMvw3q1SaXMoQkp0pDGysSN4ieFXEAddiNT9E3Kk?=
 =?iso-8859-1?Q?5vz0mmSU0DDHRYL8y0yMgO/qJDNxYtJGUA1LWHYNDrrxd5gejV2VOGiC36?=
 =?iso-8859-1?Q?oSxfXpXRn20DfoAVdQJY6dcGiPZQ2YCkk15QjAg11tuy8HXAF8Bv7cj8Xx?=
 =?iso-8859-1?Q?s8UD4OGni/C2PVrEHB3NHvt+9s5t9xc+AZkyM+O/zP299MJGr2+xUvEJJ2?=
 =?iso-8859-1?Q?iqCdBUm8uNRY6kwVUf6wo/3dl/kEK3+8YF5ATGHUGpXJttrhqbvmdETPdW?=
 =?iso-8859-1?Q?BiG/zLZX0VXTOsgfIBUzT70UakC5Ii9T5nudK8m6l34a8eFfX3N70jsER3?=
 =?iso-8859-1?Q?w/4Ja36vhw4d/qMhFOyoHz33bDF6x5mhKCMERUe77WhyxH7zHKqcH255zV?=
 =?iso-8859-1?Q?H/4u2BTFNzaKSQ/xyNoxRGhPuLgCmS7hIXcoQdk9v5ZN5YjI7SACiVp1uB?=
 =?iso-8859-1?Q?rVU2AQP8J9DcY2Eu3EaE0ZSuQf9K4mjFGTMZ+TKTnUTSPW1PaFshzF5YFi?=
 =?iso-8859-1?Q?wREjWX8g6hztRFiUgG/57Jc7ME6GQXVdO6OlwghfbkDOO1hrEft4sWbQVo?=
 =?iso-8859-1?Q?m3BHNDO2XlMBAYmROUOCfaAk1Q3g/Ztc6M?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8698c90b-adc3-4a2e-5dc0-08db7f2b998e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 20:49:04.4991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t32e8fwP+EfcG56jXF2PYYx0gxWfB9yZ6YYv/F7ZojYBRGbtsQ1cQm3XfhfGyA4nlxbkL9/35vybyi+lU6XCVMuDmG9uI2Ml2ylAVA4ibz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5927
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] fixup! drm/xe/display: Implement display
 support
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jul 06, 2023 at 05:46:30PM +0300, Jani Nikula wrote:
>On Thu, 06 Jul 2023, Francois Dugast <francois.dugast@intel.com> wrote:
>> Fix some SPDX license identifier warnings reported by checkpatch
>> in the display code.
>>
>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>> ---
>>  .../xe/compat-i915-headers/soc/intel_dram.h   |  5 +++++
>>  .../xe/compat-i915-headers/soc/intel_pch.h    |  5 +++++
>>  .../drm/xe/display/ext/intel_clock_gating.c   | 20 +-----------------
>>  .../drm/xe/display/ext/intel_device_info.c    | 21 +------------------
>>  .../drm/xe/display/ext/intel_device_info.h    | 21 +------------------
>>  5 files changed, 13 insertions(+), 59 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
>> index 1532ca7e0af6..65707e20c557 100644
>> --- a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
>> +++ b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
>> @@ -1 +1,6 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>
>The entire file is just a single line include, and it's going to stay
>that way. I really did not see much point in adding license or copyright
>boilerplate.
>
>>  #include "../../../i915/soc/intel_dram.h"
>> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
>> index 823803f7e853..9c46556d33a4 100644
>> --- a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
>> +++ b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
>> @@ -1 +1,6 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>
>Ditto.
>
>>  #include "../../../i915/soc/intel_pch.h"
>> diff --git a/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c b/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
>> index 0d67b0961d74..766c21a19181 100644
>> --- a/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
>> +++ b/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
>> @@ -1,25 +1,7 @@
>> +// SPDX-License-Identifier: MIT
>>  /*
>>   * Copyright © 2012 Intel Corporation
>>   *
>> - * Permission is hereby granted, free of charge, to any person obtaining a
>> - * copy of this software and associated documentation files (the "Software"),
>> - * to deal in the Software without restriction, including without limitation
>> - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> - * and/or sell copies of the Software, and to permit persons to whom the
>> - * Software is furnished to do so, subject to the following conditions:
>> - *
>> - * The above copyright notice and this permission notice (including the next
>> - * paragraph) shall be included in all copies or substantial portions of the
>> - * Software.
>> - *
>> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>> - * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
>> - * IN THE SOFTWARE.
>> - *
>
>The file is copy-paste from i915 for the time being. Please let's not
>deviate from the original for no real benefit. It'll be easier to
>deduplicate later.

i.e. it should be fine to change it in the original file. Or... these
files here in ext/ are supposedly to go away soon (?), so there's not
much point touching them.

Lucas De Marchi
