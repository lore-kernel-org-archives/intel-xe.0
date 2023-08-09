Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41402EB64DD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 11:07:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAB810E414;
	Wed,  9 Aug 2023 11:07:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB66D10E414
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 11:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691579243; x=1723115243;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m/4XEKJAmQnu2m4Sp2oAWBIQsMvx8WbpW7mIGP2rQII=;
 b=cUEPWq8kKnYm3e+Iray+YlULp8ZRRzIPQFAsDlA5Qvto6W8ZtIH2vFTV
 OU/SZ+vYJSqRs1Was3PvI3Qmy/0lp89WVRi36QmyBfOo375f27UjfHx11
 jMY0SWDx/MGbz0/9hVAaqeoEwFTOuWeraw98OwaDcFzwBH5df3I0LeHDN
 0GZev4NKwvNPuoeDT0IMo20+OjzatD5UvKmRjk6FIiiSBdP41P94pjGji
 kovLBCJxMmIEDhx3pIdZS/zbdI7gWI8ip5/I2pFcufgSLQYaDzK7wFTe0
 nh3Bz6NcQYQ3Ev5ok/qixX04YLsjG+42+JHyRTPR1yKwEwHA+0Lk3Cbv6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="356059166"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="356059166"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 04:07:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="845911041"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="845911041"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 09 Aug 2023 04:07:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 04:07:22 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 9 Aug 2023 04:07:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 9 Aug 2023 04:07:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jO0IpgFgJMeu+xml2NeWn464vCbpCYW+4Dtd8Fgokgph2BMV43DZhbRSEk5RtfvL+nRIw7DvRAXS+25szxcs9JHyDBZNBB3p/R4kh+ZNp6Tz4SabhUwQipiugYaXL12CV/va2znnpiqelICDMnFQki+DebcqIaU19bNMJAv/F2/p2ZAHcIsHx81yUEPQdSzAtqKM0GhD6ofQm+m4imqdw1huL5iUsIsEG2XMtQXJ85mMPHUF3De45sgvY67CmoqL5z3zkrY3OQF1EyURWQOnbN+hwtQRCHF6F8yDne3esSoQD6wac1YBubKlozuGSo3ZyDCpv8G3RXmgp1a4cDf4NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRb+ESn51k6uc0D3Qcug5Ovk8hiwr0oPNL1YgKafYqA=;
 b=lOGrQELKSIeyzR01ti3Fs+5U2bubbJQWoDCCnF7S4ksZkXoENiVskLvKkn5Eg9TeBJimoSWJiL2Os4HXJZVh9LEj8mfZh72hiqxrqbjxqyBmSWkKO680i8lJvQEOj1UhydpoErewmJfCuwHmlx/kmRueYAstfpwDrS7NKoRSBfa3zk3JxrH7Xnk7jPIcq1myOs63D6xwBeCPc8J6zDFSziPvR5LcP52fIO9945xFsSTgH3JfeAr87cOSy9lp015P13Mb+j+KlyhbvOq2bMlCJNL3SXlU6wY+eL54EXE2RQRqMLzFZ4I/D7ap59LZvjn3nrG0lwm+vuThneis7+mnfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by DS0PR11MB8051.namprd11.prod.outlook.com (2603:10b6:8:121::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 11:07:20 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153%7]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 11:07:20 +0000
Message-ID: <a5495c63-7961-740b-78a1-3df3c0de0cfe@intel.com>
Date: Wed, 9 Aug 2023 16:37:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230808115436.400611-1-aravind.iddamsetty@intel.com>
 <20230808115436.400611-2-aravind.iddamsetty@intel.com>
 <878rakyf9j.wl-ashutosh.dixit@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <878rakyf9j.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::23) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|DS0PR11MB8051:EE_
X-MS-Office365-Filtering-Correlation-Id: b637841f-5d7d-49ee-9dea-08db98c8ccd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2jWKrXGphETw9zZCafaW4PwO+YNJS+uWR9EX6Ib9rGlwUTvcG+fRPBX0QWYn+VaQfd69FEFlh2U20/2d0z6rCKH6hxWha/4gSytXf0T7xfHkwkL1v0eTochJfJF4u5u8pBhqlZ0kCrApM3JbV9P7WXd8P9O/L49qFqfs5nrgPleeAWc4j256oV5BrkThcpD4BJJQRuwcFZPIetQJ1jgWhxLTDD4+m9JR89eMxdLVdYOFkroEn+/BSbybYuQuYFExYEdu1DzD3oeW4pTPJWNYQv8Gmd1l1RFuEuBSzVYGaLULK1J5IaSbGW2jlMkkxdP/kwhsqKh3xWfsmy5P+ztsD0uS5QCPYpjfeqXVCD3uGzSTPVcemhNry+xZkqK7dzXJywBWoGWloD44shNMY6gBdSvwzMsbejN0e2p8iftMf9FGboGtkmXdfdw3ixJUJYf2NWCHvuw9V7qtP4FYkxwT0HUmaoIC1OKXV5BmHAHOV8GTwWUdmkxCH7+1UYXZyqRe7MF4icsOa/O8dVK4SuyRhtsheYuDTulL2jgH9aqN3ypFqEAMS0kj4FrT5FzpiH/uSIfBQECDzfPVTitxbmx0g89SpuDItaIxOn7OvJiG9E6CWA1R062T/nnJjbT7UTqlEOsMlueHhSlt7UQRvl+gTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(39860400002)(376002)(366004)(396003)(186006)(1800799006)(451199021)(31686004)(37006003)(66946007)(6636002)(66556008)(66476007)(53546011)(6506007)(107886003)(26005)(6666004)(478600001)(36756003)(83380400001)(2616005)(41300700001)(316002)(4326008)(6486002)(2906002)(6512007)(6862004)(31696002)(86362001)(82960400001)(8936002)(8676002)(5660300002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zzk5WFpKQ0F5L0hWRE1HREIvK3RnQkRVbHhnNkhLSXU2N0krT0dnZEYxVGt5?=
 =?utf-8?B?endwblhxQVQ4ZFR1Wkh2bWxReEhpL2ZhQ2F6cjFuVzFVejFYNzdYUms1TVVJ?=
 =?utf-8?B?NG14YUNMWDF1RmladENQajR2MEVOQU8vNFpQTWJlY09UMWl5NHM4MW1aa3dG?=
 =?utf-8?B?WkdYcUF3cVFPc0Y4RHQrV0ZYMkxGMVNIV0ZNdzM0bHFNNklEbWFlN1dlS0Jy?=
 =?utf-8?B?a0ltY010a1d6aTZEb2RnQmlJRXVkZ1htS3RGc2ZIYjh6M1J0ZEFBQ0s1ZFNn?=
 =?utf-8?B?YlNxdWR5MlJjVG9hR2xzcjBlVHV0N01JbGlIMzArZHRKcVBtVXBrL1NkWmkz?=
 =?utf-8?B?MWJsVksrY0RhMzR6RFV3WXI5R1c2dzRoNGwzeWZCbHRxMmJnNENrL29jbFQ4?=
 =?utf-8?B?SUFuRllRTndEZUxoTXJsSjV0WlhwL0s1Zm43N1VQcm1CTW9QejM1c3FzNU1T?=
 =?utf-8?B?WWNaWE1md1hiVVFhYVZGRU1uUUpMN2ZPNUdra1RjUHlKTkVqdVR2OW1DUEdS?=
 =?utf-8?B?UjhwNDFxUzJNMk1Dbno4cDBDZFNrZ1RKSDNjSEo1OHJOZG8zMXRxcTVHQVQ4?=
 =?utf-8?B?TE9HOTJkVElwRklEc2JwMEZqTWRjY1BqZ2ZQZmw0eGJNNGVCNTBtZkgwMU4v?=
 =?utf-8?B?dWpKK3I0akcvODNMMHZZWnZDek5ndWxVbXlYOW1XekVGbGZDbWV4Q1c2emIy?=
 =?utf-8?B?K2xJazNOdU04dVkxZWx5bmpza3FaTndBbDlxMm1TL2tLTjA3REJEcmxDbVBF?=
 =?utf-8?B?bnFBeXFwRWdiTU9XSG1IUkxZUjdRa1oyRUdmRzhkWkFxZjY3YkM3Nk9hNlFt?=
 =?utf-8?B?V2RBS3NOaURINjNnaVZvNi9YaytObmJ1WmlUY3I3T2xJdXc3Ymp5SW9hclgw?=
 =?utf-8?B?WUxjc3VvcDhvMUZ6SzZ3ZWdNWTVHODJvTzByRU9iUWpoWEZZeUtyMllLSFV6?=
 =?utf-8?B?Z0g4Qm80OUpzc1dxTGdwVDdTcWZrZzJLYXNCWHhQMVNRM2ptd0pqbzF6ckcv?=
 =?utf-8?B?dmRsbGpWQklXRHJ0ZUxKQ2wvT1R4R1lEb09QempzcW1xdjZ3b1NEQUMySTUz?=
 =?utf-8?B?a2VTRWZsOThsRkkvcWl2YXVEMVE2am9qN2V3NDR6aGt0dG5TYm5YYzNCT0d3?=
 =?utf-8?B?ejRUc1JCYXVaUEs4UjVTT0loSlRydkJJNmE0WXdIUFdSRnJKN3hRU0ZiU1c2?=
 =?utf-8?B?a3hyVTA3MHBtZFQ2dkw1TkpDc1JnRDhpWGJZVVltd1hqeVI1Y281Ym1JM241?=
 =?utf-8?B?QnNMbmFnZms0cThLRkdpZkFTMW5rQXAxQ2pTWkVzNmF6b0hGNC8vNEpHaERt?=
 =?utf-8?B?bzk0YVhBOERuMTZIUmRvWFdzN2hBR1dyMmNYQlFGTGpYeWRzVWJhN01rVHE5?=
 =?utf-8?B?Sm5IRk5tbWNqOFRQa0xNc2VHYlVhQm8yWlhzR1Z1WHN4c010Wit2RU56dEI5?=
 =?utf-8?B?UGUwUTFlOFZRNlE0YjJEcllzZ3d3ZklCb3g3S3RpL0pUQ1ppeXlLZXZBVjgz?=
 =?utf-8?B?ajQ4OExuUU4ydXUrTVVocVQxOWp2QUY4V0Fpczh0NHkzMU5lWFkvRytzYVcy?=
 =?utf-8?B?WGxJaFptSWhPTytZalR1OGoveld0UC9nZzJIL0Y5R1BSTmEzVFBkZ1czMGpT?=
 =?utf-8?B?TGs0eG91ZFNCQ1R6ZEZZR0tsV05xTHN3Sm9yZWR4SkZrdTVreUN6bXFZSElW?=
 =?utf-8?B?U0cySENiNytzT3UzMk9jajFuMFlFQ3Z2c2l2eWwrdUxiSDhVTUpnbVpuUkxW?=
 =?utf-8?B?alhsRUVlV1RwSXBmZ3dUYmlMeFpBcVZiY0EwSjEyRGc1a3BUSnllOEk3aEJn?=
 =?utf-8?B?WHoybG0xbnZKSXRZcWVTcS9oazRmWVZEcS9ONXJqdWNEVTlMODdmZjIvazhk?=
 =?utf-8?B?ZkxMQUIyN2dENW1USld2cHd1MTJvcUdHKzRuN0xodnVWOUp4R2dWWnR1Ujh4?=
 =?utf-8?B?aHZjV3g0djh0dWl6OXdwMDBKNzN2YXZNUUI1Q2NSQlBiakhQZ1Ztcms3WDJM?=
 =?utf-8?B?TDgwZ0kvZysrTzUrdktkbytSQTdlRUx1UlBMRjUvN0hTL2xDdnRoSjFERFQw?=
 =?utf-8?B?M1hXN3I1U285NUhZbjhBUnBjdUZjSzhvUEJSTkRmcXBpMnBRV1pLb1VsZmty?=
 =?utf-8?B?ZEhzMnRZVGQxYUZ0a2NJRDdFS2lSMVc4UVFwTW5sU0hsM1ByUnNhbmpEOE8r?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b637841f-5d7d-49ee-9dea-08db98c8ccd9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 11:07:20.4726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HnMopcgqQtF0Ymp1/QoV2aoeESiK+gve8t6830h7PLcHy3m0KCiCPVHCyK/M4rJVcfWUV+tXdwK8BDJX1oAsVIVd5qPz61qjmlmeRMS2zxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8051
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 1/2] drm/xe: Get GT clock to nanosecs
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



On 09-08-2023 10:38, Dixit, Ashutosh wrote:
> On Tue, 08 Aug 2023 04:54:35 -0700, Aravind Iddamsetty wrote:
>>
>> Helpers to get GT clock to nanosecs
> 
> Helper to convert GT clock cycles to nanoseconds.

ok.
> 
>> v2: Use DIV_ROUND_CLOSEST_ULL helper(Ashutosh)
>>
>> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_clock.c | 5 +++++
>>  drivers/gpu/drm/xe/xe_gt_clock.h | 4 +++-
>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
>> index 2f77b8bbcf53..88c29ad84146 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
>> @@ -78,3 +78,8 @@ int xe_gt_clock_init(struct xe_gt *gt)
>> 	gt->info.clock_freq = freq;
>> 	return 0;
>>  }
>> +
>> +u64 xe_gt_clock_interval_to_ns(const struct xe_gt *gt, u64 count)
> 
> I know this name is used in i915 but my 2 cents on this is that a better
> name is 'xe_gt_clock_cycles_to_ns', since count is the number of clock
> cycles. So optional but you may consider this name.

hmmm.
> 
> 
>> +{
>> +	return DIV_ROUND_CLOSEST_ULL(count * NSEC_PER_SEC, gt->info.clock_freq);
>> +}
> 
> 
>> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.h b/drivers/gpu/drm/xe/xe_gt_clock.h
>> index 511923afd224..91fc9b7e83f5 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_clock.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_clock.h
>> @@ -6,8 +6,10 @@
>>  #ifndef _XE_GT_CLOCK_H_
>>  #define _XE_GT_CLOCK_H_
>>
>> +#include <linux/types.h>
> 
> This is for HDRTEST I guess?

for u64 below.
> 
>> +
>>  struct xe_gt;
>>
>>  int xe_gt_clock_init(struct xe_gt *gt);
>> -
>> +u64 xe_gt_clock_interval_to_ns(const struct xe_gt *gt, u64 count);
>>  #endif
>> --
>> 2.25.1
>>
> 
> Also not sure if this merits a patch on its own so can be merged into the
> giant PMU patch if you wish.

ok will think about it.
> 
> In any case, with the optional tweaks above, this is:>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thanks for the review.

Aravind.
