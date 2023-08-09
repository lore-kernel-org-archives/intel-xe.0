Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB71EB64DD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 07:46:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B76D10E25B;
	Wed,  9 Aug 2023 07:46:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9140E10E25B
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 07:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691567212; x=1723103212;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0o8lSQKlkHxq5n5llY60jJJ2+E3kN9g0xiGTvVRZPnQ=;
 b=PbJJrwgWm5Ur6bBmoSnktoU8GvarRtLnMx4GOKv8L1Oc5MD4QWPM4mXg
 nDleZtD0u0jZqvi8N/Qye9BBrjmP20CIl69Tm9MvrD0P2xA5L+MenSNFE
 9Xd6eQu9f0bJeeSijB48a4wOsS3sXIfwxcB8bglMSuhgOCEOrSyEipfXV
 SlfLm0L/nxjpJk6IkUO3amZID+dTnmSncWyzwY+nQOelHX8S9SczpL5vC
 pXIHfGKcUovPYxC9LHB7Xlslsry/kUu41dqy8Gx1+Mh9GMDC7A2wn1yL/
 2IG7OKFsYh6Qo17EUOnnaYYuwK1rm5DIJUBegCoeJ4neclLMTVggQ2ZOW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="361177658"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; d="scan'208";a="361177658"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 00:46:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="845844669"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; d="scan'208";a="845844669"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 09 Aug 2023 00:46:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 00:46:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 00:46:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 9 Aug 2023 00:46:35 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 9 Aug 2023 00:46:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjvzFvPHjzZcex7TFmbXutFL4ctfDlLZvYvFAKawCUCfeZwQkhHM+1dsPmeSFm14NZQZWl4yt/8M326ENX8dgpSiGu0kIZG9pUDYsPiui3rUibDNyMDEGQClu2NpwqIXK9dlvqIuxYOcM5F/pNEWw49q2Cs+iQ83L9GpRhUspKqYqKj0yQNd3cUDGqrqOF6AswtJNaa4AujDKXsMahGmH+mwTmHkOQPlmKl4gPFuvAn1vx2LXhySZxK5QhjpWu5srk6xKUAskOOTAhalNx3eNwH7GpoUl18BTWB4n8Y8tQMIFb4LQN/zaqud+x/+gk1RWTyEy5mwY1DawleXFscANA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqcq292nsWz+UATt17Vz7HJ5EI4KoCVBuX+qUeQl/AQ=;
 b=fs7AGp8i/evdPpLwnuL8ctRc7rG1PNbwaV+TtdYeSh0Sw9ytvK5zLrubQcctJ7LAu3Q7dZzq+UU5YDN07PlGnuU+827c0EP+jkbSebu7XlYIhNCh4F8zV2OXwlXCz24wJlRO4Yq7w+KOiC2VLsbz9h+8aWFJsvQm63NYOy+qZzE+9nrvBZirOvOlfJCIOLdGw/r3VodAhIp0BzmY8PpAGdpDra93jlVuNHrM7rl3EbD+GTbsV+AxSQ5Jn0Zh2lc35uMc0TGqTw+pDba0mymuPvJW3UFgUn5JAftK3+lTJXEd2/7VkRNTH5Z2c3kK1SckZ5pzvFjuGslFyENQznDNiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by PH8PR11MB8257.namprd11.prod.outlook.com (2603:10b6:510:1c0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Wed, 9 Aug
 2023 07:46:33 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153%7]) with mapi id 15.20.6652.026; Wed, 9 Aug 2023
 07:46:31 +0000
Message-ID: <b557820a-39b8-edc7-844d-900c3a9eb7df@intel.com>
Date: Wed, 9 Aug 2023 13:16:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230808115436.400611-1-aravind.iddamsetty@intel.com>
 <20230808115436.400611-3-aravind.iddamsetty@intel.com>
 <877cq4y8s3.wl-ashutosh.dixit@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <877cq4y8s3.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::9) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|PH8PR11MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: 9887484f-db1f-41cf-8b5f-08db98acbf2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AzrBh4Vok6c1rXiOl12Rj96j/CiiKuSrYlVEbg07S5s9UpSAAxzgQG2hCEoHeA9hHklImseEXSqfOUCVZrVhLBOd1HNCWdwLtB7/2Fbq95OTmfH9DHHdKrdA0Xfw3fcij9o5IK09lYZt4fMdHBX8uLUjz/IvLa6Uy6oBsCSVJXm4AQbBx20vnWHNnSS7IJLbvyygtX5+hz46XUAEaqcvojv8K3ZEpOCF7f2ISAeZorlZv5E6rMt77p6ZTWgjqZvDQ4WiVImgdY4LCZIZZZ7TE0H20UCQnNea7cfvu2lEuW2ptK29DD3QgMW0BvlBFjkpWlnJvKbkqrMMrMDWizy2gX4N/Bl88hT4rCSV5BY4HBB6qfn39HZvFrNMSjjft2VYusFAT3F5OwpMRIUU2ajkeQmr17sVOv9a+Di3wGetoAk6LWkXJWdTUX65P7daPff5KCXHtssorxZgYviCYNXZ//GQoB8b1xeT9i8Yu6jhp9PscuGpZ4uP9bh1KzHgqGMtgbNDgYmgP9YOrkjlw/dbjxqKq1dINs7EEmEYwSJEs8THiRORegAn5KYdEY7UqDKZvoYlIhDKyf94vt5BrSU1sSzTSvAr9XLZL4+3p7xFMZjS5lLOT83xOzklgm+CuKLRYuHClRUdsU1SAwvlo/ZtVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(136003)(39860400002)(376002)(396003)(451199021)(186006)(1800799006)(41300700001)(86362001)(36756003)(31686004)(31696002)(8936002)(26005)(83380400001)(478600001)(54906003)(37006003)(6512007)(38100700002)(82960400001)(8676002)(53546011)(6636002)(2616005)(6506007)(107886003)(6862004)(6486002)(6666004)(66476007)(66946007)(66556008)(4326008)(5660300002)(316002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnFWU2h4Q0ZWRVdtNjh1STV6UWtlUzRidzBGTURwa2dOMHVxNjh1ZWZqRDAz?=
 =?utf-8?B?YURlK2dSV3ZibXpUS2VFTllLdWYvNlBBUkNoZGphaCtyUjFYM0ZvN250anJ1?=
 =?utf-8?B?cDJCck5PQkdUaWFsV21UVFNXR1RhTHl5eWJPTWRFNnBOTmE1N1pRM0xQR3I1?=
 =?utf-8?B?UDVLYVhOMmdOT1VrY3REemNGYjB0aHVKd2lMNmpCNXpkRzZQWm5wanhYRHBG?=
 =?utf-8?B?eTA1TFZ1a210TVh6WXozdW9PN3BNcU02cGZCU0lzUHFsYUw2Y1UwQ0w3WFdT?=
 =?utf-8?B?N0E5cHRXaWdSS3hhWkVTUGdUUXlZZGxsSVg0RjlxdWNvQWV6aFJKSkFLQ0tY?=
 =?utf-8?B?azdwNTMyL1JmbWY4Ykd2Q09MbTRraFhqOGoxd0NLZmxpYWMzRHg3clRkbTFw?=
 =?utf-8?B?aEpNWDd3djQ5b3JsK05MNk1PQzhOV00yYlFLNjdyanBEZnVpeE50cEFSWE5W?=
 =?utf-8?B?eTNuVzZvdFBjb2FCTHhrRlo4ZmNpTURneXl1MEtCbEpxVXovc04xNkE0Ynlx?=
 =?utf-8?B?Zk5VZnNWTGJlb010ZngrZkM5b096MjNQSitIdE9kYmNXeXJxMnlZbHZWS083?=
 =?utf-8?B?WnRHRlM1K0dIWktGaVEvNG5CUEZpK1FWYjV0YndMVU5JSDlZN1lYV1FUaTlj?=
 =?utf-8?B?aEhWZEM3cjhpZ01VSHhxTkRRNXQ5L1lRUVhvUDFhNFZHN0Nqa1dSbFNIWW1r?=
 =?utf-8?B?eVJYUFZjc3lHM1lKU2RxVkRjUW9xaDVsR2UzUmtZUFVNQ2swUDV6THB4ZG1F?=
 =?utf-8?B?TUdoZVhMeHpGZUJ2ckJJQ1hUTEFzUUdqdnhiU1o2R1pWanFBWEE5TmM2N3lC?=
 =?utf-8?B?QUQ0NysvN25zSE54RXliTC9Ma2gvcmhaZXRFVWFZVGJTY2R0Tkl6STRCblhX?=
 =?utf-8?B?TUY0QjJjNDkxVEFmdFV3WnMzcUhLN2JjaUxEU1lwM3AwWEVPaTRVcGxLWnFP?=
 =?utf-8?B?UE84cFV5UU5WWWFERkFqQnkvazB3ZUNaSmhjSE1GVXRrbi8rTmIzR3pSQlhD?=
 =?utf-8?B?UmZNR0xhNFdwL3o3TUtQdVZEL3pBOS9xSFQ3R2tYQzZDMGxwRm9CZ3dVQXRI?=
 =?utf-8?B?WERuZ0c5U1Z0TThpR2N5MGtRZFVMUGY1ZStiR1VrQnVocEo0RDY0STlpS2xj?=
 =?utf-8?B?aklmMW1wcjBmUzIrN0JoWGUydWFYR3NLVmdXQXRYc1AvZ1FhSVpwRjNIRWU0?=
 =?utf-8?B?U2REUjJTRUxJdGpaS01nb2tsVUZWREdENVVObDFCTkQvRm1oMjlCTVlvK3pY?=
 =?utf-8?B?UnFMdnUweDZVZ283ODhCclpVckdwZmgyOTdzYktDNnBCaERnMzdKYmhzaXBO?=
 =?utf-8?B?emdVK0FDZS82amt5T3J4WmhYcXNQTlc1c0xMK3hXbnNlTU1uN3pDcEtEMFcz?=
 =?utf-8?B?Wi8yQWtjWTJrQUE5cVpubjgzZS8zQVR3N1ZmR0x2MGtTUS9JNmo4K3ExaWY4?=
 =?utf-8?B?YnFlcTNPd2d2S3NQeXNxWWtseXpjMjMzRGNmU1o2L0VMZFBvNjYvQW9mZWpM?=
 =?utf-8?B?VFhPaDhXVEMyTmRURXZSa01nM0FEYVFrM3VpWTlURnd6RlZjQllZMHlGMTdY?=
 =?utf-8?B?MlUzNnE3V3BZSHg5cy9jYWVjdEpaRzhtdUNMQklBME45NmNHbFVmWTBJTkVO?=
 =?utf-8?B?RlFlSGprTHYwV3lOVysrRnNYa1dzTVBSWFdSaEEvNWtYRkRNNFBneDBDUG15?=
 =?utf-8?B?OU5zcEZmWjFkczk1NkxoaElZYzBaVDJkeVR5cXFrSjFoamFJTitCbktSaVR3?=
 =?utf-8?B?dVc0cU5BSnBqZFpwQ1ZmM0dreUJ3WWlieEVRN2tXaWtMb3BqWG9SNFVXOVp2?=
 =?utf-8?B?WWVmKzdRUy80c2xlOWJVcnRsVjd6VXFUTnNWY1VUeDNkTVZDbHJxN21MNHRK?=
 =?utf-8?B?clp1ZXh1WkR0ZTlYTW8yM1RPa3Y0REtlak91a0dsVkE0amRLMXJSaU92WFdY?=
 =?utf-8?B?VkRlaitSbG5UNzhrSithVVF0WjByaGpGSU5Bd1dDb1pZQ2VDRTl2V2hOaWxv?=
 =?utf-8?B?U2VuYUtURXI4d21WZTZxbzc5aUZlNW9vZTRUalF1V2RFWk91VUhoMER6MG1m?=
 =?utf-8?B?MldRRHovUGJERUxDZjNFRWgvVVh2a05qL1NvZ0k2b1Q5V1UwendUM3ZXNjBh?=
 =?utf-8?B?NVptMXdhbWpaQ2ZGSzFBRmVpWERnVzl1UUdvNWVkTFV4OWZwRHBmaUNGMklK?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9887484f-db1f-41cf-8b5f-08db98acbf2a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 07:46:31.6025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6LC8vj9NlHbonioDWVv7ppeawc5iO9wHolzS3ejFAx/x5UvYo4Yi9+mEu3Ze19JZtlkMXSCl0Hp7e10KDtb0TeNBjsowc4MTmELRlnjXKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8257
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/2] drm/xe/pmu: Enable PMU interface
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 09-08-2023 12:58, Dixit, Ashutosh wrote:

Hi Ashutosh,

> On Tue, 08 Aug 2023 04:54:36 -0700, Aravind Iddamsetty wrote:
>>
> 
> Hi Aravind,
> 
> Spotted a few remaining things. See if it's possible to fix these up and
> send another version.
> 
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> new file mode 100644
>> index 000000000000..9637f8283641
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -0,0 +1,673 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_managed.h>
>> +#include <drm/xe_drm.h>
>> +
>> +#include "regs/xe_gt_regs.h"
>> +#include "xe_device.h"
>> +#include "xe_gt_clock.h"
>> +#include "xe_mmio.h"
>> +
>> +static cpumask_t xe_pmu_cpumask;
>> +static unsigned int xe_pmu_target_cpu = -1;
>> +
>> +static unsigned int config_gt_id(const u64 config)
>> +{
>> +	return config >> __XE_PMU_GT_SHIFT;
>> +}
>> +
>> +static u64 config_counter(const u64 config)
>> +{
>> +	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>> +}
>> +
>> +static int engine_busyness_sample_type(u64 config)
>> +{
>> +	int type = 0;
>> +
>> +	switch (config) {
>> +	case XE_PMU_RENDER_GROUP_BUSY(0):
>> +		type =  __XE_SAMPLE_RENDER_GROUP_BUSY;
> 
> One extra space here...
> 
>> +static u64 __engine_group_busyness_read(struct xe_gt *gt, int sample_type)
>> +{
>> +	u64 val = 0;
>> +
> 
> What is the forcewake domain for these registers? Don't we need to get
> forcewake before reading these. Something like:

I'll check on this if its needed
> 
>         XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> 
>> +	switch (sample_type) {
>> +	case __XE_SAMPLE_RENDER_GROUP_BUSY:
>> +		val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
>> +		break;
>> +	case __XE_SAMPLE_COPY_GROUP_BUSY:
>> +		val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
>> +		break;
>> +	case __XE_SAMPLE_MEDIA_GROUP_BUSY:
>> +		val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
>> +		break;
>> +	case __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY:
>> +		val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
>> +		break;
>> +	default:
>> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>> +	}
> 
> And similarly here:
> 
>         XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> 
>> +static u64 engine_group_busyness_read(struct xe_gt *gt, u64 config)
>> +{
>> +	int sample_type = engine_busyness_sample_type(config);
>> +	const unsigned int gt_id = gt->info.id;
>> +	struct xe_device *xe = gt->tile->xe;
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	unsigned long flags;
>> +	bool device_awake;
>> +	u64 val;
>> +
>> +	device_awake = xe_device_mem_access_get_if_ongoing(xe);
>> +	if (device_awake)
>> +		val = __engine_group_busyness_read(gt, sample_type);
>> +
>> +	spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +	if (device_awake) {
>> +		pmu->sample[gt_id][sample_type] = val;
>> +		xe_device_mem_access_put(xe);
> 
> I think we can add the xe_device_mem_access_put right after
> __engine_group_busyness_read:

yup agree.
> 
> 	if (device_awake) {
> 		val = __engine_group_busyness_read(gt, sample_type);
> 		xe_device_mem_access_put(xe);
> 	}
> 
> 
>> +	} else {
>> +		val = pmu->sample[gt_id][sample_type];
>> +	}
>> +
>> +	spin_unlock_irqrestore(&pmu->lock, flags);
>> +
>> +	return val;
>> +}
>> +
>> +static void engine_group_busyness_store(struct xe_gt *gt)
>> +{
>> +	struct xe_pmu *pmu = &gt->tile->xe->pmu;
>> +	unsigned int gt_id = gt->info.id;
>> +	unsigned long flags;
>> +	u64 val;
>> +	int i;
>> +
>> +	spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +	for (i = __XE_SAMPLE_RENDER_GROUP_BUSY; i <= __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY; i++) {
> 
> Change the termination condition to 'i < __XE_NUM_PMU_SAMPLERS'.

this is specific to engine group busyness, so in future if we have some
other events they might not fall into this routine hence the check.

> 
>> +		val = __engine_group_busyness_read(gt, i);
>> +		pmu->sample[gt_id][i] = val;
> 
> Let's eliminate val and just do:
> 
> 		pmu->sample[gt_id][i] = __engine_group_busyness_read(gt, i);

OK.
> 
>> +static int
>> +config_status(struct xe_device *xe, u64 config)
>> +{
>> +	unsigned int max_gt_id = xe->info.gt_count > 1 ? 1 : 0;
>> +	unsigned int gt_id = config_gt_id(config);
>> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> +
>> +	if (gt_id > max_gt_id)
>> +		return -ENOENT;
>> +
>> +	switch (config_counter(config)) {
>> +	case XE_PMU_INTERRUPTS(0):
>> +		if (gt_id)
>> +			return -ENOENT;
>> +		break;
>> +	case XE_PMU_RENDER_GROUP_BUSY(0):
>> +	case XE_PMU_COPY_GROUP_BUSY(0):
>> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>> +		break;
>> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
>> +		if (!(gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0))))
> 
> Why change this? "if (gt->info.type != XE_GT_TYPE_MEDIA)" doesn't work?

Yes the previous is not sufficient, as we can have media engines fused
off like in PVC and also because the previous check is more applicable
to MTL+ and the current one applies to all platforms.

> 
>> +void xe_pmu_register(struct xe_pmu *pmu)
>> +{
>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +	const struct attribute_group *attr_groups[] = {
>> +		&pmu->events_attr_group,
>> +		&xe_pmu_cpumask_attr_group,
>> +		NULL
>> +	};
>> +
>> +	int ret = -ENOMEM;
>> +
>> +	spin_lock_init(&pmu->lock);
>> +	pmu->cpuhp.cpu = -1;
>> +
>> +	pmu->name = kasprintf(GFP_KERNEL,
>> +			      "xe_%s",
>> +			      dev_name(xe->drm.dev));
>> +	if (pmu->name)
>> +		/* tools/perf reserves colons as special. */
>> +		strreplace((char *)pmu->name, ':', '_');
>> +
>> +	if (!pmu->name)
>> +		goto err;
>> +
>> +	pmu->events_attr_group.name = "events";
>> +	pmu->events_attr_group.attrs = create_event_attributes(pmu);
>> +	if (!pmu->events_attr_group.attrs)
>> +		goto err_name;
>> +
>> +	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>> +					GFP_KERNEL);
>> +	if (!pmu->base.attr_groups)
>> +		goto err_attr;
>> +
>> +	pmu->base.module	= THIS_MODULE;
>> +	pmu->base.task_ctx_nr	= perf_invalid_context;
>> +	pmu->base.event_init	= xe_pmu_event_init;
>> +	pmu->base.add		= xe_pmu_event_add;
>> +	pmu->base.del		= xe_pmu_event_del;
>> +	pmu->base.start		= xe_pmu_event_start;
>> +	pmu->base.stop		= xe_pmu_event_stop;
>> +	pmu->base.read		= xe_pmu_event_read;
>> +	pmu->base.event_idx	= xe_pmu_event_event_idx;
>> +
>> +	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
>> +	if (ret)
>> +		goto err_groups;
>> +
>> +	ret = xe_pmu_register_cpuhp_state(pmu);
>> +	if (ret)
>> +		goto err_unreg;
>> +
>> +	ret = drmm_add_action_or_reset(&xe->drm, xe_pmu_unregister, pmu);
>> +	if (!ret)
>> +		return;
> 
> The error unwinding is not correct here, should be something like:
> 
> 	ret = drmm_add_action_or_reset(&xe->drm, xe_pmu_unregister, pmu);
> 	if (ret)
> 		goto err_cpuhp;

is it not same as above , on success the ret is zero, so if is true and
return or else will go to through the destroy path.

> 
> 	return;
> 
> err_cpuhp:
> 	xe_pmu_unregister_cpuhp_state(pmu);
>> +err_unreg:
>> +	perf_pmu_unregister(&pmu->base);
>> +err_groups:
>> +	kfree(pmu->base.attr_groups);
>> +err_attr:
>> +	pmu->base.event_init = NULL;
>> +	free_event_attributes(pmu);
>> +err_name:
>> +	kfree(pmu->name);
>> +err:
>> +	drm_notice(&xe->drm, "Failed to register PMU!\n");
>> +}
> 
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>> new file mode 100644
>> index 000000000000..a950c892e364
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -0,0 +1,76 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_PMU_TYPES_H_
>> +#define _XE_PMU_TYPES_H_
>> +
>> +#include <linux/perf_event.h>
>> +#include <linux/spinlock_types.h>
>> +#include <uapi/drm/xe_drm.h>
>> +
>> +enum {
>> +	__XE_SAMPLE_RENDER_GROUP_BUSY,
>> +	__XE_SAMPLE_COPY_GROUP_BUSY,
>> +	__XE_SAMPLE_MEDIA_GROUP_BUSY,
>> +	__XE_SAMPLE_ANY_ENGINE_GROUP_BUSY,
>> +	__XE_NUM_PMU_SAMPLERS
>> +};
>> +
>> +#define XE_MAX_GT_PER_TILE 2
>> +
>> +struct xe_pmu {
>> +	/**
>> +	 * @cpuhp: Struct used for CPU hotplug handling.
>> +	 */
>> +	struct {
>> +		struct hlist_node node;
>> +		unsigned int cpu;
>> +	} cpuhp;
>> +	/**
>> +	 * @base: PMU base.
>> +	 */
>> +	struct pmu base;
>> +	/**
>> +	 * @closed: xe is unregistering.
>> +	 */
>> +	bool closed;
>> +	/**
>> +	 * @name: Name as registered with perf core.
>> +	 */
>> +	const char *name;
>> +	/**
>> +	 * @lock: Lock protecting enable mask and ref count handling.
>> +	 */
>> +	spinlock_t lock;
>> +	/**
>> +	 * @sample: Current and previous (raw) counters.
>> +	 *
>> +	 * These counters are updated when the device is awake.
>> +	 *
>> +	 */
>> +	u64 sample[XE_MAX_GT_PER_TILE][__XE_NUM_PMU_SAMPLERS];
> 
> s/XE_MAX_GT_PER_TILE/XE_MAX_GT/ since the PMU is for the entire device not
> per tile, as I mentioned earlier.

right, so for a device this shall be sample[XE_MAX_TILES_PER_DEVICE *
XE_MAX_GT_PER_TILE][__XE_NUM_PMU_SAMPLERS]

Thanks,
Aravind.

> 
> Thanks.
> --
> Ashutosh
