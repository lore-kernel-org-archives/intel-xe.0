Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103F9EB64DD
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jul 2023 04:43:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC6F10E12C;
	Wed,  5 Jul 2023 04:43:11 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7692510E034
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jul 2023 04:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688532189; x=1720068189;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1+r3ZaFDmQ5UfP6G5wzl0ogh6EjrL4vWuv143i52Fu8=;
 b=dh16S49Mb7bOZCz+S791u9B2am3mBuaoepi47K8g0/bAheDRHko/oYSP
 qfgHSBkcd6Kry0o5giZRjo9u08+3aD+byrOKXvAKFbG+Y9DQ+VeILMEiH
 KWBJme+KNgIkKxL6xPF/MHX768u/fq1KaP2Lqr/1XWLEUqpW8L4HLIO2H
 8k+/AolxO/pgi+qqVKLiwkpW2AXTVvTTR88OAomym4TWUrNKfc75+gM/P
 /PSA34vNjcy/2XHuysC1NUbPSE8hXRLJl55lgM7KQEwCtnTDtllaYwYo5
 tIyttZYFhQ2dU1M5krqLFHiVxNvbog6SZAQ+Ex863vB+pN3/lLxnjgG9b A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="342838680"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="342838680"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 21:43:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="784394532"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="784394532"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 04 Jul 2023 21:43:08 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 21:43:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 4 Jul 2023 21:43:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 4 Jul 2023 21:43:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFQ8Jmw62v9dI/dG2X9B5eSL65WoSs3SaVqGv04YP/oPOSTnpsNfeseJ4rUgiwLxOldPCUpso9aHoUvrOziBSbQRN/w51jQlj72FmovxLNzT+nfStjqCojOZgjVtOdvsiOVQNhH3uG7KoKJPEpMFFwbTXCTWTC9eZkksnqOhjiO7nRD0EM+jklYiWjNbABTJPozG79zXlM7ljmzgbJH4iuq3NuBkZmfazAvBGxbryOjhX1j5zBsCNi7mGXTPSaSBoxDczF+GTc//a+wqYCSFLhzFlN/of+iM3KH4NcsswYm9DhpF2G/z2WHOaYA9ZQGAKO528GY/9xu2MBBsuOxLwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzO4N5hxk56UVcvVnYyLayy9AGGXlocihj3REL6s1as=;
 b=HvVrHpNc2p/cEWb7r5srscl6a6sMhsH7gnWmOy0//NXplPrqAPVKaQgcF9+icEBF35z5FBCZ430LvOoxa8MDadfc/vdtDQT2XGsQVzuEq+Lkzjew+hw1eWfx6xr6bEJrRqnPuOpPWSpGSmH6DsmrhKxFCh7UhYRh63bT/DeZkWBaNCoLiz0axQEkrk6VBXRQrAQZ+l2FB50xeuCMUQJGW1UKJTCS+lOB9Q2/2IkwMAjE+jR2aF8YK6T03iAxgNbrk3/PSFyDvnsQsg+rySzTUn1QI65IjdCCghy7K/e0q7JKXVnCaTp2WFQf8Xv5/1qRlansaZMi//ey1PX+A67IqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5480.namprd11.prod.outlook.com (2603:10b6:208:314::6)
 by CY8PR11MB7268.namprd11.prod.outlook.com (2603:10b6:930:9b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 04:43:04 +0000
Received: from BL1PR11MB5480.namprd11.prod.outlook.com
 ([fe80::144d:7ed6:e742:7353]) by BL1PR11MB5480.namprd11.prod.outlook.com
 ([fe80::144d:7ed6:e742:7353%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 04:43:01 +0000
Message-ID: <9f9dcec5-bfb5-125d-f068-94ece3e021a9@intel.com>
Date: Wed, 5 Jul 2023 10:12:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-US
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230627122113.1472532-1-aravind.iddamsetty@intel.com>
 <20230627122113.1472532-3-aravind.iddamsetty@intel.com>
 <SJ1PR11MB6204F45CA81BA3985CF539DA812EA@SJ1PR11MB6204.namprd11.prod.outlook.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <SJ1PR11MB6204F45CA81BA3985CF539DA812EA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::25) To BL1PR11MB5480.namprd11.prod.outlook.com
 (2603:10b6:208:314::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5480:EE_|CY8PR11MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: d18d802f-65a0-41f8-ed5c-08db7d124fbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uZAU3b4OEIhdDcHPuKmSvbGYmVdsrLmF6ZjWyDmwdqvncMc6oNrTh6p7audut1GDK2AKrVJHSOQA37qtc+MjlSE7Ypmr0dtcTrZ3qN5NhGf0qhb4LiP5W+u5suHKUPBbMLa7d/HblkO42f+pvCyggT0OGbYKr0aof7tELLVIgUqd+fF/Kmws/C+qg4G7ulnjb9DqGS4fYQITrJsa4U7O8GZPuXFvhme849PSptEqL/+5ZsTZUkjTJVz/XwnPoUgpq9daWHAnSIB3ms+6kqs4IL0Z7vuMWsdogO/T+DhoVlwf5vNPvanaDbgKybpr3e5bidogCsqVLHyLp0Y2vZ67hpACMubRqW/n5NnAFj36FY3YPKU7K2xIukG25Bo6l70vWCfGagz47VGaeN+uQQiMv2s06O5rHIbYsmZAX3DbWy3ogVxk4uQSX3J5Gpc54aJ2Fo8gZv2qeTsXz9HltB9imvjoLz9VmZIfQr2D6vJkI5Fqtka9b0iZSpN+CtA96hGwDv6VvCFNRtIm/hR40+z/4PYbdgpqTjosfh7qL09tbFhJS2wD2jPObiQGGvm0lYg9SHiA3d/+oFYgIuX1puRrwEtqvXlq5PS4F5vOW4cyzCpfALSMsOGs/0AXE/5EePCaBIXUkGVtROBjX9giWhJwIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5480.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199021)(31696002)(41300700001)(30864003)(38100700002)(6486002)(6666004)(2616005)(82960400001)(107886003)(186003)(83380400001)(26005)(6506007)(53546011)(6512007)(54906003)(86362001)(110136005)(478600001)(2906002)(316002)(36756003)(66556008)(4326008)(66946007)(66476007)(8676002)(8936002)(31686004)(66899021)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zy9kYkMweEEwOXhTTU9wbENiZDFCbTNvcDJIVnpPOUs1WThGOEJlYitPamUr?=
 =?utf-8?B?T0lHSnNQeXREZUNObUZIRTNTWWVwYit3QnJXNm4vSUZVZE00RDZqWjQrSjV0?=
 =?utf-8?B?VFpFR2h0anNPYjMreHFGSmdpWWtkNE5wZ0Y2SlFnUEMzZFNEWTRqcWp1THc1?=
 =?utf-8?B?d0FEMklFZVBnMkMvOHVsTjVIRTVkN0pNanRkc3Zka1ZNVnRzOW42T0Joazlk?=
 =?utf-8?B?R0JVc01LQkZpNjlzc1NUYk9Zdjh3ZEszVTJDRUNuZ1EwRkdjTFpWNDQyK2pI?=
 =?utf-8?B?SS9uODYrN2V5bUZUdThKcGNIY3pzZkpVWjF4eHBRcjlrV1plalh1RVU4T2lK?=
 =?utf-8?B?L3MrTlNTYUJEbTQxN1Z0Z0xzdWNOWHlBYzc0ODVnbmVyWVJRczVXQnlyd3ln?=
 =?utf-8?B?SFdSNHNWUGh3NTRsbVpQMjhjckpxT0hKT0tmRHF0NWRwWnZDdFE4MGE2SzA4?=
 =?utf-8?B?S0w4eVAwM2R5V0lEZVBBV2pkRlFMZ0M1UVBEOXI5cUhMNjZlNTFhM0JLTndz?=
 =?utf-8?B?RXd6SU1wMVdIRUgwNmZUbThidDBTTk1OK0lRbG5kZU8yWjZZdEFZczBuZzJ0?=
 =?utf-8?B?R2VsaU45Z2VtaDN4VVRIOThMVkM0cXo5dXlCNFhBdytrT2owMlJqYXRXY1RK?=
 =?utf-8?B?Q2xEcHpaUC9QOW9DVUt1V2d6clF4WjliZHdFN1Zic3Q1TlF6d3JXdTdLcG5G?=
 =?utf-8?B?QXhqUExrQTRnTFc3OVgvTWZjN20reXJpaGpVcDBBQUNQVFdpd083b3lkT0RU?=
 =?utf-8?B?dWtJV2NFbC83bEhEVnBaWEZ1THRiVDlwS3o0SjhCTFNLY0FZSWZtT3cwejE1?=
 =?utf-8?B?VUdkWGFSdS9zVTM5SU9PTW5YSWJhVDBRMm0rNDIrUi9TZWp3WHFJcytxRWFj?=
 =?utf-8?B?cVBjSmppL1duS2Z3VWN5dFhIbCtwWGI3UmduQmFFTE0wZFp2aUdKL3ZTcXFR?=
 =?utf-8?B?M09GaDkwNWtKQVZrbktHT2RVRGdEWGJxZFhzNWNIZ3RDbldNRGZsUGxWenNk?=
 =?utf-8?B?QzhPSHNFOEdPS0srMFIxQ0dTd3pDcVlRQUQ2cTVHSkpFSTkwaDN6WHlDSzh5?=
 =?utf-8?B?NHFvQU1lRUMwYWdabHJSRDcxaDNRVDJod0dSMEtxVlM4TXdneG84aWdGT3pF?=
 =?utf-8?B?MmdTeFQ4eTdwVFNranBQMTNCUnM1RFd5TFBIV3I2MmpBVUdGMTJ6ZjhsTnZQ?=
 =?utf-8?B?OGMyMXpWazlNWUxlU3NIQWp1NGtISU1YS2crbC9vcS9KeWtKdWN5NGhBSnpz?=
 =?utf-8?B?QmY1cVJ4WGtpMXp5NEdjS0JvaWhmMHpWdXIvSW5PazRTYXpSNGUzTi9GbVZX?=
 =?utf-8?B?eVRENVR4QkdvNVcxN0FDWlFOckZscnBKdmNDbEllRjZmMTlGMG5XSDJNVHNt?=
 =?utf-8?B?cmxuTE5MbHEwbTVCQnErNGFTU2VzYnVidElacnNNM2ZyMTZxeHdGcnpMWFcr?=
 =?utf-8?B?WWxZZmpqUU9LWDQxaDNRelBldWlDL0tkc2JTd09Yb09nR2ZuWUYwL0VYZi9n?=
 =?utf-8?B?ZWxNNGRGVDhaaEhmYVFZRHRJYVhnd2Jyb3JFZHYwT2JWNHNrcnB4ZTdDSFM3?=
 =?utf-8?B?NWxmWTE5TzNHZ0Z0UlAwakxycW1mbzExRFhnOWhDdWxCeTVrUDlnNGpySm80?=
 =?utf-8?B?SS8yWGJmM3RaQkkrSUEwODFuTlFZTVR5V3NLbC9taTdVVlE0SWhrRnVTNC9Z?=
 =?utf-8?B?UTNkY2J3WEtSMG9xeWtjUTNwek0wQUhhSjF4R0pUTzlmeExiWmphK3pBeGw0?=
 =?utf-8?B?NlNMREFVdnUwMnduK05rbzFTYndQUDNBRXJ4ZHBxSzk2R0hhRXhzRUVPOTlY?=
 =?utf-8?B?alF2UnFPTFJ4OGZXZVc4SjZNcjg5VGJ4WEJJeFZBWHVjRFN5aUNxTndtZ2FQ?=
 =?utf-8?B?SGFRS3NBQThTSjJzSFRRUWtVWmN3MWh5QmpLckN1Mkd2cUtDWEtZQThjd2M1?=
 =?utf-8?B?cXRHNEtsRGRIbGhCUGNnU092Z083TFlLckt0bmQxajRCZjlxR2JHbHVUbFZC?=
 =?utf-8?B?L2lmZ1FlY2ZHSTJJMTNzZHNuWVQ1Y2FaUThqYlBJQTIvRmI0bEFlSFBIOEw4?=
 =?utf-8?B?WWZack50OUhYQ0g4SSs1elJ1RS9GWlBERTIrSzV6dmJoWTFFTUtkMmVxdjQw?=
 =?utf-8?B?c0pxSEZESzhUbWh4SlJFZkxWNGV1cjJnb1ZvRk9ydTZSbm5leXNXMzY4NGFP?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d18d802f-65a0-41f8-ed5c-08db7d124fbe
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 04:43:00.8928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SEMWzVwYPobIR5UrrJOla/607N6a6226jmiSpHVenHVBhneij5I0gwkI9aDb/4+Ia+urRSKlHskPeCcd2Gpm3dVjK6Ure7BwnWRJRFaVMPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7268
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/pmu: Enable PMU interface
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
Cc: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 04-07-2023 14:40, Upadhyay, Tejas wrote:
> 
> 
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>> Aravind Iddamsetty
>> Sent: Tuesday, June 27, 2023 5:51 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Ursulin, Tvrtko
>> <tvrtko.ursulin@intel.com>
>> Subject: [Intel-xe] [PATCH v2 2/2] drm/xe/pmu: Enable PMU interface
>>
>> There are a set of engine group busyness counters provided by HW which
>> are perfect fit to be exposed via PMU perf events.
>>
>> BSPEC: 46559, 46560, 46722, 46729
>>
>> events can be listed using:
>> perf list
>>   xe_0000_03_00.0/any-engine-group-busy-gt0/         [Kernel PMU event]
>>   xe_0000_03_00.0/copy-group-busy-gt0/               [Kernel PMU event]
>>   xe_0000_03_00.0/interrupts/                        [Kernel PMU event]
>>   xe_0000_03_00.0/media-group-busy-gt0/              [Kernel PMU event]
>>   xe_0000_03_00.0/render-group-busy-gt0/             [Kernel PMU event]
>>
>> and can be read using:
>>
>> perf stat -e "xe_0000_8c_00.0/render-group-busy-gt0/" -I 1000
>>            time             counts unit events
>>      1.001139062                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>      2.003294678                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>      3.005199582                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>      4.007076497                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>      5.008553068                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>      6.010531563              43520 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>      7.012468029              44800 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>      8.013463515                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>      9.015300183                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>     10.017233010                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>     10.971934120                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>
>> The pmu base implementation is taken from i915.
>>
>> v2:
>> Store last known value when device is awake return that while the GT is
>> suspended and then update the driver copy when read during awake.
>>
>> Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile          |   2 +
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |   5 +
>>  drivers/gpu/drm/xe/xe_device.c       |   2 +
>>  drivers/gpu/drm/xe/xe_device_types.h |   4 +
>>  drivers/gpu/drm/xe/xe_gt.c           |   2 +
>>  drivers/gpu/drm/xe/xe_irq.c          |  22 +
>>  drivers/gpu/drm/xe/xe_module.c       |   5 +
>>  drivers/gpu/drm/xe/xe_pmu.c          | 739 +++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_pmu.h          |  25 +
>>  drivers/gpu/drm/xe/xe_pmu_types.h    |  80 +++
>>  include/uapi/drm/xe_drm.h            |  16 +
>>  11 files changed, 902 insertions(+)
>>  create mode 100644 drivers/gpu/drm/xe/xe_pmu.c  create mode 100644
>> drivers/gpu/drm/xe/xe_pmu.h  create mode 100644
>> drivers/gpu/drm/xe/xe_pmu_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 081c57fd8632..e52ab795c566 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -217,6 +217,8 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>  	i915-display/skl_universal_plane.o \
>>  	i915-display/skl_watermark.o
>>
>> +xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>> +
>>  ifeq ($(CONFIG_ACPI),y)
>>  	xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>  		i915-display/intel_acpi.o \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 3f664011eaea..c7d9e4634745 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -285,6 +285,11 @@
>>  #define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
>>  #define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
>>
>> +#define XE_OAG_RC0_ANY_ENGINE_BUSY_FREE
>> 	XE_REG(0xdb80)
>> +#define XE_OAG_ANY_MEDIA_FF_BUSY_FREE		XE_REG(0xdba0)
>> +#define XE_OAG_BLT_BUSY_FREE			XE_REG(0xdbbc)
>> +#define XE_OAG_RENDER_BUSY_FREE			XE_REG(0xdbdc)
>> +
>>  #define SAMPLER_MODE				XE_REG_MCR(0xe18c,
>> XE_REG_OPTION_MASKED)
>>  #define   ENABLE_SMALLPL			REG_BIT(15)
>>  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>> b/drivers/gpu/drm/xe/xe_device.c index c7985af85a53..b2c7bd4a97d9
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -328,6 +328,8 @@ int xe_device_probe(struct xe_device *xe)
>>
>>  	xe_debugfs_register(xe);
>>
>> +	xe_pmu_register(&xe->pmu);
>> +
>>  	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
>>  	if (err)
>>  		return err;
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index 0226d44a6af2..3ba99aae92b9 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -15,6 +15,7 @@
>>  #include "xe_devcoredump_types.h"
>>  #include "xe_gt_types.h"
>>  #include "xe_platform_types.h"
>> +#include "xe_pmu.h"
>>  #include "xe_step_types.h"
>>
>>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> @@ -332,6 +333,9 @@ struct xe_device {
>>  	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
>>  	bool d3cold_allowed;
>>
>> +	/* @pmu: performance monitoring unit */
> 
> /** @pmu: performance monitoring unit */

right I noticed this in CI it complained.
> 
>> +	struct xe_pmu pmu;
>> +
>>  	/* private: */
>>
>>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c index
>> 2458397ce8af..96e3720923d4 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -593,6 +593,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>>  	if (err)
>>  		goto err_msg;
>>
>> +	engine_group_busyness_store(gt);
>> +
>>  	err = xe_uc_suspend(&gt->uc);
>>  	if (err)
>>  		goto err_force_wake;
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>> index b4ed1e4a3388..cb943fb94ec7 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -27,6 +27,24 @@
>>  #define IIR(offset)				XE_REG(offset + 0x8)
>>  #define IER(offset)				XE_REG(offset + 0xc)
>>
>> +/*
>> + * Interrupt statistic for PMU. Increments the counter only if the
>> + * interrupt originated from the GPU so interrupts from a device which
>> + * shares the interrupt line are not accounted.
>> + */
>> +static inline void xe_pmu_irq_stats(struct xe_device *xe,
>> +				    irqreturn_t res)
>> +{
>> +	if (unlikely(res != IRQ_HANDLED))
>> +		return;
>> +
>> +	/*
>> +	 * A clever compiler translates that into INC. A not so clever one
>> +	 * should at least prevent store tearing.
>> +	 */
>> +	WRITE_ONCE(xe->pmu.irq_count, xe->pmu.irq_count + 1); }
>> +
>>  static void assert_iir_is_zero(struct xe_gt *mmio, struct xe_reg reg)  {
>>  	u32 val = xe_mmio_read32(mmio, reg);
>> @@ -325,6 +343,8 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
>>
>>  	xe_display_irq_enable(xe, gu_misc_iir);
>>
>> +	xe_pmu_irq_stats(xe, IRQ_HANDLED);
>> +
>>  	return IRQ_HANDLED;
>>  }
>>
>> @@ -414,6 +434,8 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>>  	dg1_intr_enable(xe, false);
>>  	xe_display_irq_enable(xe, gu_misc_iir);
>>
>> +	xe_pmu_irq_stats(xe, IRQ_HANDLED);
>> +
>>  	return IRQ_HANDLED;
>>  }
>>
>> diff --git a/drivers/gpu/drm/xe/xe_module.c
>> b/drivers/gpu/drm/xe/xe_module.c index 75e5be939f53..f6fe89748525
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -12,6 +12,7 @@
>>  #include "xe_hw_fence.h"
>>  #include "xe_module.h"
>>  #include "xe_pci.h"
>> +#include "xe_pmu.h"
>>  #include "xe_sched_job.h"
>>
>>  bool enable_guc = true;
>> @@ -49,6 +50,10 @@ static const struct init_funcs init_funcs[] = {
>>  		.init = xe_sched_job_module_init,
>>  		.exit = xe_sched_job_module_exit,
>>  	},
>> +	{
>> +		.init = xe_pmu_init,
>> +		.exit = xe_pmu_exit,
>> +	},
>>  	{
>>  		.init = xe_register_pci_driver,
>>  		.exit = xe_unregister_pci_driver,
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> new file mode 100644 index 000000000000..bef1895be9f7
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -0,0 +1,739 @@
>> +/*
>> + * SPDX-License-Identifier: MIT
>> + *
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
>> +static unsigned int config_gt_id(const u64 config) {
>> +	return config >> __XE_PMU_GT_SHIFT;
>> +}
>> +
>> +static u64 config_counter(const u64 config) {
>> +	return config & ~(~0ULL << __XE_PMU_GT_SHIFT); }
>> +
>> +static unsigned int
>> +__sample_idx(struct xe_pmu *pmu, unsigned int gt_id, int sample) {
>> +	unsigned int idx = gt_id * __XE_NUM_PMU_SAMPLERS + sample;
>> +
>> +	XE_BUG_ON(idx >= ARRAY_SIZE(pmu->sample));
>> +
>> +	return idx;
>> +}
>> +
>> +static u64 read_sample(struct xe_pmu *pmu, unsigned int gt_id, int
>> +sample) {
>> +	return pmu->sample[__sample_idx(pmu, gt_id, sample)].cur; }
>> +
>> +static void
>> +store_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample, u64
>> +val) {
>> +	pmu->sample[__sample_idx(pmu, gt_id, sample)].cur = val; }
>> +
>> +static int engine_busyness_sample_type(u64 config) {
>> +	int type = 0;
>> +
>> +	switch (config) {
>> +	case XE_PMU_RENDER_GROUP_BUSY(0):
>> +		type =  __XE_SAMPLE_RENDER_GROUP_BUSY;
>> +		break;
>> +	case XE_PMU_COPY_GROUP_BUSY(0):
>> +		type = __XE_SAMPLE_COPY_GROUP_BUSY;
>> +		break;
>> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
>> +		type = __XE_SAMPLE_MEDIA_GROUP_BUSY;
>> +		break;
>> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>> +		type = __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY;
>> +		break;
>> +	}
>> +
>> +	return type;
>> +}
>> +
>> +static void xe_pmu_event_destroy(struct perf_event *event) {
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +
>> +	drm_WARN_ON(&xe->drm, event->parent);
>> +
>> +	drm_dev_put(&xe->drm);
>> +}
>> +
>> +static u64 __engine_group_busyness_read(struct xe_gt *gt, u64 config) {
>> +	u64 val = 0;
>> +
>> +	switch (config) {
>> +	case XE_PMU_RENDER_GROUP_BUSY(0):
>> +		val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
>> +		break;
>> +	case XE_PMU_COPY_GROUP_BUSY(0):
>> +		val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
>> +		break;
>> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
>> +		val = xe_mmio_read32(gt,
>> XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
>> +		break;
>> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>> +		val = xe_mmio_read32(gt,
>> XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
>> +		break;
>> +	default:
>> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>> +	}
>> +
>> +	return xe_gt_clock_interval_to_ns(gt, val * 16); }
>> +
>> +static u64 engine_group_busyness_read(struct xe_gt *gt, u64 config) {
>> +	int sample_type = engine_busyness_sample_type(config);
>> +	struct xe_device *xe = gt->tile->xe;
>> +	const unsigned int gt_id = gt->info.id;
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	bool device_awake;
>> +	unsigned long flags;
>> +	u64 val;
> 
> Many places Christmas tree order for variable declaration group not followed. Please apply wherever applicable.

sure will take care.
> 
>> +
>> +	/*
>> +	 * found no better way to check if device is awake or not. Before
>> +	 * we suspend we set the submission_state.enabled to false.
>> +	 */
>> +	device_awake = gt->uc.guc.submission_state.enabled ? true : false;
>> +	if (device_awake)
>> +		val = __engine_group_busyness_read(gt, config);
>> +
>> +	spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +	if (device_awake)
>> +		store_sample(pmu, gt_id, sample_type, val);
>> +	else
>> +		val = read_sample(pmu, gt_id, sample_type);
>> +
>> +	spin_unlock_irqrestore(&pmu->lock, flags);
>> +
>> +	return val;
>> +}
>> +
>> +void engine_group_busyness_store(struct xe_gt *gt) {
>> +	struct xe_pmu *pmu = &gt->tile->xe->pmu;
>> +	unsigned int gt_id = gt->info.id;
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +	store_sample(pmu, gt_id, __XE_SAMPLE_RENDER_GROUP_BUSY,
>> +		     __engine_group_busyness_read(gt,
>> XE_PMU_RENDER_GROUP_BUSY(0)));
>> +	store_sample(pmu, gt_id, __XE_SAMPLE_COPY_GROUP_BUSY,
>> +		     __engine_group_busyness_read(gt,
>> XE_PMU_COPY_GROUP_BUSY(0)));
>> +	store_sample(pmu, gt_id, __XE_SAMPLE_MEDIA_GROUP_BUSY,
>> +		     __engine_group_busyness_read(gt,
>> XE_PMU_MEDIA_GROUP_BUSY(0)));
>> +	store_sample(pmu, gt_id,
>> __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY,
>> +		     __engine_group_busyness_read(gt,
>> +XE_PMU_ANY_ENGINE_GROUP_BUSY(0)));
>> +
>> +	spin_unlock_irqrestore(&pmu->lock, flags); }
>> +
>> +static int
>> +config_status(struct xe_device *xe, u64 config) {
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
>> +		if (GRAPHICS_VER(xe) < 12)
>> +			return -ENOENT;
>> +		break;
>> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
>> +		if (MEDIA_VER(xe) >= 13 && gt->info.type !=
>> XE_GT_TYPE_MEDIA)
>> +			return -ENOENT;
>> +		break;
>> +	default:
>> +		return -ENOENT;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int xe_pmu_event_init(struct perf_event *event) {
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	int ret;
>> +
>> +	if (pmu->closed)
>> +		return -ENODEV;
>> +
>> +	if (event->attr.type != event->pmu->type)
>> +		return -ENOENT;
>> +
>> +	/* unsupported modes and filters */
>> +	if (event->attr.sample_period) /* no sampling */
>> +		return -EINVAL;
>> +
>> +	if (has_branch_stack(event))
>> +		return -EOPNOTSUPP;
>> +
>> +	if (event->cpu < 0)
>> +		return -EINVAL;
>> +
>> +	/* only allow running on one cpu at a time */
>> +	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
>> +		return -EINVAL;
>> +
>> +	ret = config_status(xe, event->attr.config);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!event->parent) {
>> +		drm_dev_get(&xe->drm);
>> +		event->destroy = xe_pmu_event_destroy;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static u64 __xe_pmu_event_read(struct perf_event *event) {
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	const unsigned int gt_id = config_gt_id(event->attr.config);
>> +	const u64 config = config_counter(event->attr.config);
>> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	u64 val = 0;
>> +
>> +	switch (config) {
>> +	case XE_PMU_INTERRUPTS(0):
>> +		val = READ_ONCE(pmu->irq_count);
>> +		break;
>> +	case XE_PMU_RENDER_GROUP_BUSY(0):
>> +	case XE_PMU_COPY_GROUP_BUSY(0):
>> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
>> +		val = engine_group_busyness_read(gt, config);
>> +	}
> 
> Do you need to handle default case here?
ideally i could but an unknown config will not even reach this far, but
to satisfy the symantics of switch i'll put default.
> 
> Also, if possible can you please think of breaking up this into small patches. Its huge patch to review. Split it only if it makes sense.

well if i break most of the routines will be dummy in one of the
patches. But let me see what I can do when i spin the next version.

Thanks,
Aravind.
> 
> Thanks,
> Tejas
>> +
>> +	return val;
>> +}
>> +
>> +static void xe_pmu_event_read(struct perf_event *event) {
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct hw_perf_event *hwc = &event->hw;
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	u64 prev, new;
>> +
>> +	if (pmu->closed) {
>> +		event->hw.state = PERF_HES_STOPPED;
>> +		return;
>> +	}
>> +again:
>> +	prev = local64_read(&hwc->prev_count);
>> +	new = __xe_pmu_event_read(event);
>> +
>> +	if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
>> +		goto again;
>> +
>> +	local64_add(new - prev, &event->count); }
>> +
>> +static void xe_pmu_enable(struct perf_event *event) {
>> +	/*
>> +	 * Store the current counter value so we can report the correct delta
>> +	 * for all listeners. Even when the event was already enabled and has
>> +	 * an existing non-zero value.
>> +	 */
>> +	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>> }
>> +
>> +static void xe_pmu_event_start(struct perf_event *event, int flags) {
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +
>> +	if (pmu->closed)
>> +		return;
>> +
>> +	xe_pmu_enable(event);
>> +	event->hw.state = 0;
>> +}
>> +
>> +static void xe_pmu_event_stop(struct perf_event *event, int flags) {
>> +	if (flags & PERF_EF_UPDATE)
>> +		xe_pmu_event_read(event);
>> +
>> +	event->hw.state = PERF_HES_STOPPED;
>> +}
>> +
>> +static int xe_pmu_event_add(struct perf_event *event, int flags) {
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +
>> +	if (pmu->closed)
>> +		return -ENODEV;
>> +
>> +	if (flags & PERF_EF_START)
>> +		xe_pmu_event_start(event, flags);
>> +
>> +	return 0;
>> +}
>> +
>> +static void xe_pmu_event_del(struct perf_event *event, int flags) {
>> +	xe_pmu_event_stop(event, PERF_EF_UPDATE); }
>> +
>> +static int xe_pmu_event_event_idx(struct perf_event *event) {
>> +	return 0;
>> +}
>> +
>> +struct xe_str_attribute {
>> +	struct device_attribute attr;
>> +	const char *str;
>> +};
>> +
>> +static ssize_t xe_pmu_format_show(struct device *dev,
>> +				  struct device_attribute *attr, char *buf) {
>> +	struct xe_str_attribute *eattr;
>> +
>> +	eattr = container_of(attr, struct xe_str_attribute, attr);
>> +	return sprintf(buf, "%s\n", eattr->str); }
>> +
>> +#define XE_PMU_FORMAT_ATTR(_name, _config) \
>> +	(&((struct xe_str_attribute[]) { \
>> +		{ .attr = __ATTR(_name, 0444, xe_pmu_format_show, NULL),
>> \
>> +		  .str = _config, } \
>> +	})[0].attr.attr)
>> +
>> +static struct attribute *xe_pmu_format_attrs[] = {
>> +	XE_PMU_FORMAT_ATTR(xe_eventid, "config:0-20"),
>> +	NULL,
>> +};
>> +
>> +static const struct attribute_group xe_pmu_format_attr_group = {
>> +	.name = "format",
>> +	.attrs = xe_pmu_format_attrs,
>> +};
>> +
>> +struct xe_ext_attribute {
>> +	struct device_attribute attr;
>> +	unsigned long val;
>> +};
>> +
>> +static ssize_t xe_pmu_event_show(struct device *dev,
>> +				 struct device_attribute *attr, char *buf) {
>> +	struct xe_ext_attribute *eattr;
>> +
>> +	eattr = container_of(attr, struct xe_ext_attribute, attr);
>> +	return sprintf(buf, "config=0x%lx\n", eattr->val); }
>> +
>> +static ssize_t cpumask_show(struct device *dev,
>> +			    struct device_attribute *attr, char *buf) {
>> +	return cpumap_print_to_pagebuf(true, buf, &xe_pmu_cpumask); }
>> +
>> +static DEVICE_ATTR_RO(cpumask);
>> +
>> +static struct attribute *xe_cpumask_attrs[] = {
>> +	&dev_attr_cpumask.attr,
>> +	NULL,
>> +};
>> +
>> +static const struct attribute_group xe_pmu_cpumask_attr_group = {
>> +	.attrs = xe_cpumask_attrs,
>> +};
>> +
>> +#define __event(__counter, __name, __unit) \ { \
>> +	.counter = (__counter), \
>> +	.name = (__name), \
>> +	.unit = (__unit), \
>> +	.global = false, \
>> +}
>> +
>> +#define __global_event(__counter, __name, __unit) \ { \
>> +	.counter = (__counter), \
>> +	.name = (__name), \
>> +	.unit = (__unit), \
>> +	.global = true, \
>> +}
>> +
>> +static struct xe_ext_attribute *
>> +add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64
>> +config) {
>> +	sysfs_attr_init(&attr->attr.attr);
>> +	attr->attr.attr.name = name;
>> +	attr->attr.attr.mode = 0444;
>> +	attr->attr.show = xe_pmu_event_show;
>> +	attr->val = config;
>> +
>> +	return ++attr;
>> +}
>> +
>> +static struct perf_pmu_events_attr *
>> +add_pmu_attr(struct perf_pmu_events_attr *attr, const char *name,
>> +	     const char *str)
>> +{
>> +	sysfs_attr_init(&attr->attr.attr);
>> +	attr->attr.attr.name = name;
>> +	attr->attr.attr.mode = 0444;
>> +	attr->attr.show = perf_event_sysfs_show;
>> +	attr->event_str = str;
>> +
>> +	return ++attr;
>> +}
>> +
>> +static struct attribute **
>> +create_event_attributes(struct xe_pmu *pmu) {
>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +	static const struct {
>> +		unsigned int counter;
>> +		const char *name;
>> +		const char *unit;
>> +		bool global;
>> +	} events[] = {
>> +		__global_event(0, "interrupts", NULL),
>> +		__event(1, "render-group-busy", "ns"),
>> +		__event(2, "copy-group-busy", "ns"),
>> +		__event(3, "media-group-busy", "ns"),
>> +		__event(4, "any-engine-group-busy", "ns"),
>> +	};
>> +
>> +	unsigned int count = 0;
>> +	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>> +	struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
>> +	struct attribute **attr = NULL, **attr_iter;
>> +	struct xe_gt *gt;
>> +	unsigned int i, j;
>> +
>> +	/* Count how many counters we will be exposing. */
>> +	for_each_gt(gt, xe, j) {
>> +		for (i = 0; i < ARRAY_SIZE(events); i++) {
>> +			u64 config = ___XE_PMU_OTHER(j,
>> events[i].counter);
>> +
>> +			if (!config_status(xe, config))
>> +				count++;
>> +		}
>> +	}
>> +
>> +	/* Allocate attribute objects and table. */
>> +	xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
>> +	if (!xe_attr)
>> +		goto err_alloc;
>> +
>> +	pmu_attr = kcalloc(count, sizeof(*pmu_attr), GFP_KERNEL);
>> +	if (!pmu_attr)
>> +		goto err_alloc;
>> +
>> +	/* Max one pointer of each attribute type plus a termination entry.
>> */
>> +	attr = kcalloc(count * 2 + 1, sizeof(*attr), GFP_KERNEL);
>> +	if (!attr)
>> +		goto err_alloc;
>> +
>> +	xe_iter = xe_attr;
>> +	pmu_iter = pmu_attr;
>> +	attr_iter = attr;
>> +
>> +	for_each_gt(gt, xe, j) {
>> +		for (i = 0; i < ARRAY_SIZE(events); i++) {
>> +			u64 config = ___XE_PMU_OTHER(j,
>> events[i].counter);
>> +			char *str;
>> +
>> +			if (config_status(xe, config))
>> +				continue;
>> +
>> +			if (events[i].global)
>> +				str = kstrdup(events[i].name, GFP_KERNEL);
>> +			else
>> +				str = kasprintf(GFP_KERNEL, "%s-gt%u",
>> +						events[i].name, j);
>> +			if (!str)
>> +				goto err;
>> +
>> +			*attr_iter++ = &xe_iter->attr.attr;
>> +			xe_iter = add_xe_attr(xe_iter, str, config);
>> +
>> +			if (events[i].unit) {
>> +				if (events[i].global)
>> +					str = kasprintf(GFP_KERNEL,
>> "%s.unit",
>> +							events[i].name);
>> +				else
>> +					str = kasprintf(GFP_KERNEL, "%s-
>> gt%u.unit",
>> +							events[i].name, j);
>> +				if (!str)
>> +					goto err;
>> +
>> +				*attr_iter++ = &pmu_iter->attr.attr;
>> +				pmu_iter = add_pmu_attr(pmu_iter, str,
>> +							events[i].unit);
>> +			}
>> +		}
>> +	}
>> +
>> +	pmu->xe_attr = xe_attr;
>> +	pmu->pmu_attr = pmu_attr;
>> +
>> +	return attr;
>> +
>> +err:
>> +	for (attr_iter = attr; *attr_iter; attr_iter++)
>> +		kfree((*attr_iter)->name);
>> +
>> +err_alloc:
>> +	kfree(attr);
>> +	kfree(xe_attr);
>> +	kfree(pmu_attr);
>> +
>> +	return NULL;
>> +}
>> +
>> +static void free_event_attributes(struct xe_pmu *pmu) {
>> +	struct attribute **attr_iter = pmu->events_attr_group.attrs;
>> +
>> +	for (; *attr_iter; attr_iter++)
>> +		kfree((*attr_iter)->name);
>> +
>> +	kfree(pmu->events_attr_group.attrs);
>> +	kfree(pmu->xe_attr);
>> +	kfree(pmu->pmu_attr);
>> +
>> +	pmu->events_attr_group.attrs = NULL;
>> +	pmu->xe_attr = NULL;
>> +	pmu->pmu_attr = NULL;
>> +}
>> +
>> +static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
>> +{
>> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu),
>> cpuhp.node);
>> +
>> +	XE_BUG_ON(!pmu->base.event_init);
>> +
>> +	/* Select the first online CPU as a designated reader. */
>> +	if (cpumask_empty(&xe_pmu_cpumask))
>> +		cpumask_set_cpu(cpu, &xe_pmu_cpumask);
>> +
>> +	return 0;
>> +}
>> +
>> +static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node
>> +*node) {
>> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu),
>> cpuhp.node);
>> +	unsigned int target = xe_pmu_target_cpu;
>> +
>> +	XE_BUG_ON(!pmu->base.event_init);
>> +
>> +	/*
>> +	 * Unregistering an instance generates a CPU offline event which we
>> must
>> +	 * ignore to avoid incorrectly modifying the shared
>> xe_pmu_cpumask.
>> +	 */
>> +	if (pmu->closed)
>> +		return 0;
>> +
>> +	if (cpumask_test_and_clear_cpu(cpu, &xe_pmu_cpumask)) {
>> +		target = cpumask_any_but(topology_sibling_cpumask(cpu),
>> cpu);
>> +
>> +		/* Migrate events if there is a valid target */
>> +		if (target < nr_cpu_ids) {
>> +			cpumask_set_cpu(target, &xe_pmu_cpumask);
>> +			xe_pmu_target_cpu = target;
>> +		}
>> +	}
>> +
>> +	if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
>> +		perf_pmu_migrate_context(&pmu->base, cpu, target);
>> +		pmu->cpuhp.cpu = target;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static enum cpuhp_state cpuhp_slot = CPUHP_INVALID;
>> +
>> +int xe_pmu_init(void)
>> +{
>> +	int ret;
>> +
>> +	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
>> +				      "perf/x86/intel/xe:online",
>> +				      xe_pmu_cpu_online,
>> +				      xe_pmu_cpu_offline);
>> +	if (ret < 0)
>> +		pr_notice("Failed to setup cpuhp state for xe PMU! (%d)\n",
>> +			  ret);
>> +	else
>> +		cpuhp_slot = ret;
>> +
>> +	return 0;
>> +}
>> +
>> +void xe_pmu_exit(void)
>> +{
>> +	if (cpuhp_slot != CPUHP_INVALID)
>> +		cpuhp_remove_multi_state(cpuhp_slot);
>> +}
>> +
>> +static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu) {
>> +	if (cpuhp_slot == CPUHP_INVALID)
>> +		return -EINVAL;
>> +
>> +	return cpuhp_state_add_instance(cpuhp_slot, &pmu->cpuhp.node);
>> }
>> +
>> +static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu) {
>> +	cpuhp_state_remove_instance(cpuhp_slot, &pmu->cpuhp.node); }
>> +
>> +static void xe_pmu_unregister(struct drm_device *device, void *arg) {
>> +	struct xe_pmu *pmu = arg;
>> +
>> +	if (!pmu->base.event_init)
>> +		return;
>> +
>> +	/*
>> +	 * "Disconnect" the PMU callbacks - since all are atomic
>> synchronize_rcu
>> +	 * ensures all currently executing ones will have exited before we
>> +	 * proceed with unregistration.
>> +	 */
>> +	pmu->closed = true;
>> +	synchronize_rcu();
>> +
>> +	xe_pmu_unregister_cpuhp_state(pmu);
>> +
>> +	perf_pmu_unregister(&pmu->base);
>> +	pmu->base.event_init = NULL;
>> +	kfree(pmu->base.attr_groups);
>> +	kfree(pmu->name);
>> +	free_event_attributes(pmu);
>> +}
>> +
>> +static void init_samples(struct xe_pmu *pmu) {
>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +	struct xe_gt *gt;
>> +	unsigned int i;
>> +
>> +	for_each_gt(gt, xe, i)
>> +		engine_group_busyness_store(gt);
>> +}
>> +
>> +void xe_pmu_register(struct xe_pmu *pmu) {
>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +	const struct attribute_group *attr_groups[] = {
>> +		&xe_pmu_format_attr_group,
>> +		&pmu->events_attr_group,
>> +		&xe_pmu_cpumask_attr_group,
>> +		NULL
>> +	};
>> +
>> +	int ret = -ENOMEM;
>> +
>> +	spin_lock_init(&pmu->lock);
>> +	pmu->cpuhp.cpu = -1;
>> +	init_samples(pmu);
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
>> +	pmu->base.attr_groups = kmemdup(attr_groups,
>> sizeof(attr_groups),
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
>> +	ret = drmm_add_action_or_reset(&xe->drm, xe_pmu_unregister,
>> pmu);
>> +	XE_WARN_ON(ret);
>> +
>> +	return;
>> +
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
>> +	drm_notice(&xe->drm, "Failed to register PMU!\n"); }
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
>> new file mode 100644 index 000000000000..d3f47f4ab343
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu.h
>> @@ -0,0 +1,25 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_PMU_H_
>> +#define _XE_PMU_H_
>> +
>> +#include "xe_gt_types.h"
>> +#include "xe_pmu_types.h"
>> +
>> +#ifdef CONFIG_PERF_EVENTS
>> +int xe_pmu_init(void);
>> +void xe_pmu_exit(void);
>> +void xe_pmu_register(struct xe_pmu *pmu); void
>> +engine_group_busyness_store(struct xe_gt *gt); #else static inline int
>> +xe_pmu_init(void) { return 0; } static inline void xe_pmu_exit(void) {}
>> +static inline void xe_pmu_register(struct xe_pmu *pmu) {} static inline
>> +void engine_group_busyness_store(struct xe_gt *gt) {} #endif
>> +
>> +#endif
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h
>> b/drivers/gpu/drm/xe/xe_pmu_types.h
>> new file mode 100644
>> index 000000000000..e87edd4d6a87
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -0,0 +1,80 @@
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
>> +struct xe_pmu_sample {
>> +	u64 cur;
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
>> +	struct xe_pmu_sample sample[XE_MAX_GT_PER_TILE *
>> __XE_NUM_PMU_SAMPLERS];
>> +	/**
>> +	 * @irq_count: Number of interrupts
>> +	 *
>> +	 * Intentionally unsigned long to avoid atomics or heuristics on 32bit.
>> +	 * 4e9 interrupts are a lot and postprocessing can really deal with an
>> +	 * occasional wraparound easily. It's 32bit after all.
>> +	 */
>> +	unsigned long irq_count;
>> +	/**
>> +	 * @events_attr_group: Device events attribute group.
>> +	 */
>> +	struct attribute_group events_attr_group;
>> +	/**
>> +	 * @xe_attr: Memory block holding device attributes.
>> +	 */
>> +	void *xe_attr;
>> +	/**
>> +	 * @pmu_attr: Memory block holding device attributes.
>> +	 */
>> +	void *pmu_attr;
>> +};
>> +
>> +#endif
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h index
>> 965cd9527ff1..ed097056f944 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -990,6 +990,22 @@ struct drm_xe_vm_madvise {
>>  	__u64 reserved[2];
>>  };
>>
>> +/* PMU event config IDs */
>> +
>> +/*
>> + * Top 4 bits of every counter are GT id.
>> + */
>> +#define __XE_PMU_GT_SHIFT (60)
>> +
>> +#define ___XE_PMU_OTHER(gt, x) \
>> +	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>> +
>> +#define XE_PMU_INTERRUPTS(gt)
>> 	___XE_PMU_OTHER(gt, 0)
>> +#define XE_PMU_RENDER_GROUP_BUSY(gt)
>> 	___XE_PMU_OTHER(gt, 1)
>> +#define XE_PMU_COPY_GROUP_BUSY(gt)
>> 	___XE_PMU_OTHER(gt, 2)
>> +#define XE_PMU_MEDIA_GROUP_BUSY(gt)
>> 	___XE_PMU_OTHER(gt, 3)
>> +#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)
>> 	___XE_PMU_OTHER(gt, 4)
>> +
>>  #if defined(__cplusplus)
>>  }
>>  #endif
>> --
>> 2.25.1
> 
