Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EB8E7D277
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 10:32:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C0C10E0E7;
	Tue, 26 Sep 2023 10:32:08 +0000 (UTC)
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Tue, 26 Sep 2023 10:32:06 UTC
Received: from mgamail.intel.com (unknown [198.175.65.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9355310E0E7
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 10:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695724326; x=1727260326;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TACScVNuM4j/VeD/zxGOJXHe06PtJGzckh8QWLgJzRw=;
 b=FLoJx4j2DyHsSoF1x/haeCEOqjCPynqsmqhcA2d97asW6lAe+eOuhi1N
 R0H94651lQRlozdOKY6fZLma64jRItO98VFbZmO+nER8B/R3UMWmPrajz
 H47ZCrYc75et1mGE0IFqP7bfbMhOADOfwJA1k/hCiU8h9byAirbI2y8fQ
 X5B+B1pf31u/yQCQBT4ANy0Hsp8BEnicH5ocRcnJe4Y8PEL2Yg9zkPtED
 iMxdkqEGyel1rc+83aGgRBSseHBaoCCk7JPLLxes8veIDImrYqR7F4Qnl
 S/Z9ZU3MfL9upEPkI/bNFGGVz1xAm6KLt/tpqprPT/09qqWDN3PoLief3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="178174"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="178174"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 03:25:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="99469"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 03:24:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 03:25:00 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 03:24:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 03:24:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 03:24:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gn/bPj1mEBo2jE9bMGa7P2BjfW8km+O+uI576cpuxYz8FUqGdjZDJDYKr9TM18dNFPP6Hm+ZnmYb+DZ52rDjDS7B8stkGuPkKx5zpTy1UuclMzPZPZkVtJF3BO/rIJGnFfw0v/EuUkInghMluak80IA5dfWrvBxuVX5jK6DWNNQb3Fg6rxGaQ2nJnYum7JQKPxBsdos1ABuQDDSfPZsy+lvS4681fqEX9AzK7uriHbpitijnJwQit7g52+oies7VwNxEwpe6fBG5iDaJZiYHqmuk7At+qmYogZeqeDUBqCAVE5DpfhghMBpOxOzvMzQ5K4f/kyQyTCA7hq1R0h/9KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKPEXr5iQCYzOlUg1FuCHja9hGWrdymb4JSYezzAYz8=;
 b=gdcfPA7KnYs/+jP3HiFwhpnSn7lWGS998HD6FigMiX5y+OD2Dzh8aNSpmZhbZBoZ46t7pRsQUxFPAw7t2UO2bELRzLrkKxB3urSNBIaUXzKGR1bzoiX6z0BdGY+s6l+gl5ja0cL1fnHVk31Oo8H3jWzosuVrF8lUkmjZOrnTPQ3xU9bek6a21T4zamtWETBQLosu7lxQy4PhssEoPywhR4c/DbL9QBDf3y+0gDu2LMWujuoFFwWRqiaSr3iDYoiRlcxTpIaQ9NTUuBhLAid/SC3EUN5ntR517oVa+MGywyZJxzpkubOrvmS1pz5PC8dPwjYs0eRBINtTKkjxAlwM5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB8776.namprd11.prod.outlook.com (2603:10b6:610:1c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Tue, 26 Sep
 2023 10:24:57 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::82e:c2f3:6b0f:3586]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::82e:c2f3:6b0f:3586%4]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 10:24:57 +0000
Message-ID: <038a6b85-f7f0-4ec8-b83e-d3972e9f3d2b@intel.com>
Date: Tue, 26 Sep 2023 15:54:46 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230823085842.1440523-1-himal.prasad.ghimiray@intel.com>
 <20230823085842.1440523-5-himal.prasad.ghimiray@intel.com>
 <9d63f599-3cf5-f1c4-8ade-a4a808c78cd2@linux.intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <9d63f599-3cf5-f1c4-8ade-a4a808c78cd2@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0175.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::20) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB8776:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e669c6c-28c3-435e-1140-08dbbe7ad503
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MFW2fm1qpCKs30UtQRPpyfpNB3ACcUB30Zhw+C8AIqf9D0VtaRzNgqKfG+47JMk+Md2FTFvXjoK7DO2xN4o6R/Dq+pVYx2sVNrqbggJCt1E6ApQBBeA3newTaTiq6lqIZv5nFvk5HelrJv40nkCa83vLWGP9PrHAz/gOiaXkNGzKj+E4MdxF5ttkhwCHi5M/HbExAfRpgy2g6zKh6t+29BXl0nqyQnkIQkDKcv5m1vonTttvds5FVy+dyZKAZ4/wSpjQ7Q89KdzYEhDh3YkeGaGNVObkwH067/DtD4RQn20MLKlB9TzJ48IZR8mRhJSc0wANqJMUV1Rb3ke+Jjv6NhF6RGsffN9AVCpE237Zo9tjwVX+AkkGOhHS0BClMNysJXBcIY2/zmeJhm0XX0W3ZK5xgkE7N98P4Z8rglRL0yaSkliTTAqV5bkl6+fg8A83L1GCvM7zMXh5SYToPiE0fYSFrm2FYcwgN03n61QnNiSH3GZPxPeXBLIRDzmBfY7ytK3RB/OOmrf+vGHeWKfuqE39bYM0EYlvbFXHmT4JLW14jxjHW0WLy7V6SnMfONK7HzsxPKr8KCCR+e3IVViGE+JWV3X9QXMJK1r7v8qECtKlAb44j8Zo8BTfvnpaaae+ig/EFVxrufqDxz98Y7QrdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(136003)(396003)(346002)(230922051799003)(186009)(1800799009)(451199024)(6506007)(6512007)(53546011)(6666004)(6486002)(83380400001)(5660300002)(26005)(66556008)(316002)(66946007)(4326008)(41300700001)(54906003)(66476007)(8676002)(8936002)(36756003)(86362001)(478600001)(31696002)(82960400001)(2616005)(2906002)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z21hbnlDY05FUEdSV25tRllaTytzNzg5LzRkUVkxTmYza0JIanZOQ0RqWStp?=
 =?utf-8?B?M1ExaFpCWlV1MmN5bUlkSkpWQ1JaWVYzang2a1Rmb1ZCdGpLZFpmVkNJaGxL?=
 =?utf-8?B?cnFQcEloSzJydlczcHNBOVAyWWt1YVVkVCtIQ0V5Uzk3U3lVTTVNZldyRERV?=
 =?utf-8?B?M01TRUtQNTJIVGZueFh1bGwzdjBBcURGMW1mS251NFFsMm1rN1ExNFBDR0RL?=
 =?utf-8?B?QVVSc0V4SUxsY21ZNmllTFVhK092c1ZpZkZodkNoWEdiUzVUZU50dE9wWDlp?=
 =?utf-8?B?eWNFNTA2ejBrNkFpT1ZnN1oxVkhjbTZBYS9yZ2ExaktKUGplak9UdjdveVZZ?=
 =?utf-8?B?eC9ZYmp6S0xoZndEY2xtY1B4MmFGYmd3WDFXcTA5NVNHbXF6VDdhcFhHcEZP?=
 =?utf-8?B?a2pIeXlmQ05DUEJmVVFxVE5DQ1lmNm9zOEZnYlNVdzB0SDFSZUI5RXFTOSta?=
 =?utf-8?B?V00zVkNHVy8xRU5EVGowbGRycHlrT1duYVY0QTFKdkc0VWxRL2dqbkZHRjh3?=
 =?utf-8?B?N1dwOEgyMEtsL2dTZzVTUGdacHI4WlMyNGlnZFgyaVRJTUJMRHlseTdIUzY1?=
 =?utf-8?B?bmF4WERnUWNPeTRXamd5dGlIVUcxbE5zTzgwWW96YkxCNDRzYXNsTFNhejVC?=
 =?utf-8?B?ZjBBYUwrUk5sRy9VUkpxOUQxSW83dDZVWGdlcUxyMkVLUjhsNmJVdUdPUFFt?=
 =?utf-8?B?ZFdxQzBKcXhMMUI2QnZ2MlpSaFQrcytBbnpzL2FadzF6K0xkL0J3R255VWxX?=
 =?utf-8?B?dE5ZcVgwd3VpZVQyU2tvbm81anBJKzF6b2gvZmF1T1M2bm55YlRJdnNhQy9Q?=
 =?utf-8?B?UzI3TFlFd3ZGM1FTRlhtek9qQlhRbWZYVlk3V3c0dnNkMzIzaDVkeEExZ2do?=
 =?utf-8?B?L29VbU5VMXFmd1U0U0xPWkJyeTNmbWw0YkxGelg1TXA2eGR1aVk0WDQ1amx6?=
 =?utf-8?B?QWlLT3ZsWFdQdG5BcGJkQmJCa2hxOTVNT1NTWnFoeTNnOHhaMldDdllxclI1?=
 =?utf-8?B?OUxKVGN5d3BZaklrSm5JNU0yRmZJVkZXV3QvUUVkNUNyYXJXM3hZT1FtSjhM?=
 =?utf-8?B?a0dpL0N2UXo3YzJDY2c1WStNM3RBejhhLzJlMFRyQmMyM1dhQktOYnFKeFU0?=
 =?utf-8?B?OEtORGdQQmhzV2laVmFVV0lRUUd5MHBRRHA2aENNTDhZOW4wOTBNRGFkR3VE?=
 =?utf-8?B?MUluTjhKQ1lrNVRocUdDSWdhT05FSlY2dGw0SGJJUlhsRllwMHlwYW9qQkNa?=
 =?utf-8?B?cVJrbjlDcC9NZlJleDE5SytDTUk2Z1ZRWDI2dStMeDZpTW96OW93NFhTb1lL?=
 =?utf-8?B?cUY1NnBiSis3dk9Wa0cxVnByeE4vZjhnaU9ScnRTK3NXN2E2RWdhTHc5NWpP?=
 =?utf-8?B?OHRwMzliQ1J0Wk5lZThCVnRjVGxLZE9sUnJMWW1XT1dhenNNS09aaElyazlz?=
 =?utf-8?B?eFJVVUF5SlNDbjAxZzlNNVZxRjVMRWQ1THRSVk1aTTY2ZXp1OG5mWjZWS2h6?=
 =?utf-8?B?YVRpWjI2Rzg1L2tSZUtXZExTK2ZPNGdzQlQrOGxKbEJzWDk2Qi85aXBNRG9B?=
 =?utf-8?B?ajhEUlhKTVI5RHBjWmJjcW5LdURDV0t6VnhpakJIWlRqRXNTVmNMVW9YaHhO?=
 =?utf-8?B?NlZmcEp0Smk0UnptSTVMR1BmSVFmUis2aVBWRGl6cWV4QzBpZWx6ZXQzVUJh?=
 =?utf-8?B?ZUkzbmZxcEF0djJkd1RKc3grbFZwaVZ4UHRnbnRwaUdFNmN0RDN2bWxSQ2h6?=
 =?utf-8?B?ajJoeS9KeXk4OTBzOVgwRUNwMDllRWV1d0NTL1M0UnFSb3hhUVMrYVVweXBU?=
 =?utf-8?B?NTN1WHg0dC9Ga2xIVDNoY082ZXdnb3Y5OHZ3a3paM3JQRVJjTW16RDNjbWgy?=
 =?utf-8?B?bWZxOHJNNXhTSUh5eFc3WGlLeHhFQy9IcW5URWlTbzF6Qml1blBoeTM3VXhC?=
 =?utf-8?B?aGJwV1owWmd2MXJIZ1Z3V1NxZVREWmNDUlJiYjVRem5QME5JMm0wWVBIWTE3?=
 =?utf-8?B?Q3JUdW1qK2JEaGtQbzVkeUR3OHpOWG5EU1pVaUtaTGpkTElrZU9FVUxESU9N?=
 =?utf-8?B?R3gxanpHZFQzdWhMaHJJdlExVW4xbHM2ZVdqSFJmOVdjalpzTEpXejFDSkJ6?=
 =?utf-8?B?TkRnMGNiWTlvZkEzMm0yVk02dW1OcmhQTzRRbkIrU1JxMWlPTGFSS05VTW1L?=
 =?utf-8?Q?z9P6y1uVzZdIJ48xcjxfSB0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e669c6c-28c3-435e-1140-08dbbe7ad503
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 10:24:57.5280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T6BaJh0K4QaTj7ktNgOZJzGf1ff5DSyPkotX8XzMwT59DzE0my0qhvtaPYH6vsiTCKslsrKnfwT8cbyqw4Zxx95FyOXr2HjZFU8YT7bsqJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8776
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 4/4] drm/xe: Process fatal hardware errors.
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 26-09-2023 09:51, Aravind Iddamsetty wrote:
> On 23/08/23 14:28, Himal Prasad Ghimiray wrote:
>> Fatal errors are reported as PCIe errors. When a PCIe error is asserted,
>> the OS will perform a device warm reset which causes the driver to reload.
>> The error registers are sticky and the values are maintained through a
>> warm reset. We read these registers during the boot flow of the driver and
>> increment the respective error counters.
>>
>> Bspec: 53076
> please mention 50875 as well.
sure.
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_regs.h |  3 +++
>>   drivers/gpu/drm/xe/xe_hw_error.c  | 37 ++++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_hw_error.h  |  3 ++-
>>   drivers/gpu/drm/xe/xe_irq.c       |  2 +-
>>   4 files changed, 42 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
>> index e223975a5acf..b8f2b1762d3f 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>> @@ -90,5 +90,8 @@
>>   #define   GT_DW_IRQ(x)				REG_BIT(x)
>>   #define   XE_ERROR_IRQ(x)			REG_BIT(26 + (x))
>>   
>> +#define DEV_PCIEERR_STATUS			XE_REG(0x100180)
>> +#define   DEV_PCIEERR_IS_FATAL(x)		REG_BIT(x * 4 + 2)
> place it as per the address.
>> +
>>   #define PVC_RP_STATE_CAP			XE_REG(0x281014)
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> index deb020a509d2..9595e3369656 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -183,7 +183,7 @@ static const struct err_msg_cntr_pair err_stat_gt_correctable_vectr_reg[] = {
>>   	[2 ... 3]         = {"L3BANK",		XE_GT_HW_ERR_L3BANK_CORR},
>>   };
>>   
>> -void xe_assign_hw_err_regs(struct xe_device *xe)
>> +static void xe_assign_hw_err_regs(struct xe_device *xe)
> change it in the patch that introduced it.
>>   {
>>   	const struct err_msg_cntr_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
>>   	const struct err_msg_cntr_pair **err_stat_gt = xe->hw_err_regs.err_stat_gt;
>> @@ -417,3 +417,38 @@ xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>>   			xe_hw_error_source_handler(tile, hw_err);
>>   	}
>>   }
>> +
>> +/**
>> + * process_hw_errors - checks for the occurrence of HW errors
>> + *
>> + * This checks for the HW Errors including FATAL errors that might
>> + * have occurred in the previous boot of the driver which will
>> + * initiate PCIe FLR reset of the device and cause the
> this is not right, in fact it is better to rephrase as:
>
> "fatal will result in a card warm reset and driver will be reloaded."
ok
>
>> + * driver to reload.
>> + */
>> +void xe_process_hw_errors(struct xe_device *xe)
>> +{
>> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>> +	struct xe_gt *root_mmio = root_tile->primary_gt;
>> +
>> +	u32 dev_pcieerr_status, master_ctl;
>> +	struct xe_tile *tile;
>> +	int i;
>> +
>> +	xe_assign_hw_err_regs(xe);
> lets still have this in xe_irq_install, as it serves for a different purpose.
ok
>> +
>> +	dev_pcieerr_status = xe_mmio_read32(root_mmio, DEV_PCIEERR_STATUS);
>> +
>> +	for_each_tile(tile, xe, i) {
>> +		struct xe_gt *mmio = tile->primary_gt;
>> +
>> +		if (dev_pcieerr_status & DEV_PCIEERR_IS_FATAL(i))
>> +			xe_hw_error_source_handler(tile, HARDWARE_ERROR_FATAL);
>> +
>> +		master_ctl = xe_mmio_read32(mmio, GFX_MSTR_IRQ);
>> +		xe_hw_error_irq_handler(tile, master_ctl);
>> +		xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);
>> +	}
>> +	if (dev_pcieerr_status)
>> +		xe_mmio_write32(root_mmio, DEV_PCIEERR_STATUS, dev_pcieerr_status);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
>> index 3fcbbcc338fe..2812407dd4bf 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
>> @@ -104,5 +104,6 @@ struct xe_device;
>>   struct xe_tile;
>>   
>>   void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
>> -void xe_assign_hw_err_regs(struct xe_device *xe);
>> +void xe_process_hw_errors(struct xe_device *xe);
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>> index 48b933234342..be152ebd6ce9 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -573,7 +573,7 @@ int xe_irq_install(struct xe_device *xe)
>>   		return -EINVAL;
>>   	}
>>   
>> -	xe_assign_hw_err_regs(xe);
>> +	xe_process_hw_errors(xe);
> this shall be called before xe_irq_reset.
>>   
>>   	xe->irq.enabled = true;
>>   
> Thanks,
> Aravind.
