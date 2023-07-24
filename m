Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA5DC001B0
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 08:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F210B10E1B5;
	Mon, 24 Jul 2023 08:03:49 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E202210E1B5
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jul 2023 08:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690185828; x=1721721828;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3WcWPX5pss2aegvEZVM5i+EnRshnIdsIf00YUm+f4e4=;
 b=nLuNKdKmYo3fuzJ/C67uUnG9GTSjHGQSjRmXtGnHF788558ggFlYcFtZ
 r4DVK95A11AiUV/nNfaPl5I+L0tUHowWP+clVSs1EGrz/K2fxwQZCpRmv
 lryl+KnSnWmP9l6WpkQGi3mh1mOCisf1VaHURGYVS1gdnPKMnyi0dtFI6
 KbQJuROmCfroACWtFq8huc3j7VszRnwr/HYVYX4C7LajogkjlFoYl4UAD
 AKimutBaU1o95gypnAgYZpd1LtGN0fWiC+ePERLBTqzU9ITDd/BSfIJ8N
 00nAScxV5Y09NhIJQqa7gveM3lvacCDetT0jnY1FR3NRg4th7I+LfD15I A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="366270030"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="366270030"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 01:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="899424745"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="899424745"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 24 Jul 2023 01:03:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 01:03:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 01:03:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 01:03:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 01:03:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8ul2qlXXtlK81U1xfBnujoUV1oXOlS3VMWb03sahS3SdNe/F0lWe7+TezuQVhK8ZQoXlfKh8fpdKqtYJwAKozNqQWHnYwLo/8UqRJdKOzvH0+K8+8aAtYFgcbChQTD9cr8AfZWpjrcBp3OJjiR0W2dpS3w8qTNolvOnaqgTHUmFnIispoNL+zx6oyVp+4Kp+TUtVEIUiLprCw9xGGilx+4yu1Uc/rNHEOR3C5Lk76vSlat240X+jfCxYIaQlVZzcPM3IHLHKJvHtmBsJzMXwygUIRa0UwkDw2aHVQN031MAGCUhgoVk7UEQrLmKi5CiQBMZ54eY8kaRuIueE6Ekbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHmE1fBj7mBRET9w/oNyv1AJ9NRc4AydSZyQiAoGqMU=;
 b=hk8SsGFQL1HaeiIi2uHWAKhtA1CrKVvJeAd36f2x6GCqHp7y7GngQVnBm5M8KmlHoL+zrODfqFBzwEFTcCr1C21DDy7ITXhNAHJuAbQDemJ8aHMz4Q+wZ+TGo3+uqnCz2B3j0Eq29cpnEFOoXFay0kaJjV3LCaBuILjIziO10B1fbKCq87fppxmnCFErxXhjErDQz+D2ay63qmx+pymZ9lNfmAVEVIslRBKmXLzeQ9GyXR+KTxBM7+DiEV+TuAx33z5AtgDt8O53mhsPy0lZ+ny7x2mKFCA51X2m3Qmx6DxBIyKSntxWY2ihcGzDBo1pzGHTcGxohHOluK5mqZq26g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by PH7PR11MB7073.namprd11.prod.outlook.com (2603:10b6:510:20c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.30; Mon, 24 Jul
 2023 08:03:34 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 08:03:34 +0000
Message-ID: <8fd9bc04-b737-0acd-a0c9-4f163c1a117c@intel.com>
Date: Mon, 24 Jul 2023 13:33:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230627122113.1472532-1-aravind.iddamsetty@intel.com>
 <20230627122113.1472532-3-aravind.iddamsetty@intel.com>
 <87cz0mqdpi.wl-ashutosh.dixit@intel.com>
 <f4f6c8f9-a97d-6072-cf0c-4122b3d4f93f@intel.com>
 <877cqsrg65.wl-ashutosh.dixit@intel.com>
 <875y6cqy6p.wl-ashutosh.dixit@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <875y6cqy6p.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::16) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|PH7PR11MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: 649d4084-ea5e-4b7d-500a-08db8c1c7a17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QSaWKXTbqPrSObmAk6j3/HGXd0h37/nxM+VmKrTUl1mmvij57ipofkOJSgykxKVkfNLCzThoRDnexdB5pqrynxmVN4UA08d3YEttkILfan0nj9wEyupXnaF0seV1h39ZaKjQz2Hmxapim/LIdhHpV6SaKl/HqQxt0KeVO1HZ9Xh8xDULyeXi7oQ05Nub7yctiwffeKhP+mEg6T0YoE5+gwr7QwhW+9eHlQ7DwITsRczbPe4QvHgCcFWGq+BtbmzZqTW3hr9acXRiSkBy0Z851odmnaI/d53X6frVhLNkU98j8gqbKb9FeewHKO9aNSOJzKvqjEuoWBEqQElrLPwZPyjQIGiajsygbq4rj5schZ/1eJhFg2SmH0AksGsJrmh2FoiI5nrzKtmWwWYOhN+TQwS9ZfZWjKfxaaQ7kRnylstePCs1gR5Gu30g77dSBlOxypgkwQwGRPFuEfu33J6F0hSvJUg9OZRYxFKOz2qT0T6QUuyFhTlE+GIDfxE5k2+VM5dVgC7Q68IOljgKVNPCEjW050Ag3Rdj1ZKYctgERx8rGzIWFREV6ko2VUH6P7g78y9cwnol+gy7O7QOqXtaQ3idHL1GHgYUuThRsM8HKueB9zzQr4M+YZo19EhDOu1qrKgPk1Olgj7OQb5kUMTTB6ZbLHw2pVDfk5eD/xgo31E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199021)(53546011)(30864003)(6506007)(41300700001)(186003)(83380400001)(478600001)(26005)(6666004)(2616005)(966005)(6512007)(2906002)(6486002)(36756003)(31696002)(86362001)(5660300002)(66476007)(66556008)(66946007)(6636002)(4326008)(6862004)(8936002)(8676002)(316002)(31686004)(107886003)(82960400001)(38100700002)(66899021)(37006003)(54906003)(43740500002)(45980500001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2MyVURtVGNLRWlCZEdaM1NuV1Fydm1YVzR1ODRpYm9GMFQyZUF0RkhoeHZY?=
 =?utf-8?B?bHVSbjVDMndJQkw1d3FmUy80TzhmTU0vSU5Xc08yOUp2c3JIRDFoU3JMK0gr?=
 =?utf-8?B?a2E3ZUQwbjNaQnYxUElZNm15eWZuWko2UWd3eHR0VWlxNDdoVjRBRWFESUFj?=
 =?utf-8?B?ajNJZ0JQVUcrbkw1RGpTZ1Zwd1JraGxtYXlxcVU2U0FYelFpRGxPYklIR1pt?=
 =?utf-8?B?WWd2blRHSHdPbzB6WlJFUEdoNXFmOEMwY0h3T0dsQ3FVbzNOWGZiTmRjVW10?=
 =?utf-8?B?Y1BTazlhZnc0OERSb21IRUVLNkZPWk0xZXk1MGp5dllWdEg2QXpNU3hERkZN?=
 =?utf-8?B?NExHK3lrbUQvOUNUSXJKbktHdWN1YVp4TjZvWW1pa3EyYTUwWlpoTlRHVCsy?=
 =?utf-8?B?MnM3VnBqbnpMb1cvbEgrTGRXSXdRUlBPSnhYNGQxZXZDc0N4SUg3WG4rNFNM?=
 =?utf-8?B?SjkrS2ozdkU2M0VFM3NxVFBzbHRsQ2JZbVVaVUFXVitZaU9qWVA4bnBwSW5s?=
 =?utf-8?B?ZW5hVCtYbWVTRlprdDhLMFVzZGpDWnlMZ1FCV1FRMjE1aC92ODF0WmJYcDR0?=
 =?utf-8?B?ekhySDAvMzkxWWxVR0UrOW1VWEIrR1J3V2xva0RnQUYzRFhjYmt0WlZ6eHdt?=
 =?utf-8?B?UCtmVUxaM2NXNUhleTFaeHBxVng4UkV2RUdUUTIyZkV2VWpUVzJUcFBjUXA4?=
 =?utf-8?B?VWxNZGVFUVNCQjhwVTMvWUJCM0c0R0xaYlI0VHhoYlQ1QmhnTExwdzVhRlNu?=
 =?utf-8?B?ajRhclV5WEZoTFRncHJ2d2kvMVdxTUErMnBBeW5pMjd0SEJRczZqY0h0SnZk?=
 =?utf-8?B?bFVJdXprT2ltSktQMEp0dCtOMEdZYzlGRmdQL3JXSDN2ZjZPOVN6Y1JRRzds?=
 =?utf-8?B?ZU9TRVlqc25oTk5jSDRIQW5DMm5tamM4dTRReDF3ZE5uUGtRTm85S2FIaU5R?=
 =?utf-8?B?L2ZVVjJYa3lLcFhVRVVYWnlseVlrUjBndHh2N0tWWFV3bWZKR1lIelVRWDVl?=
 =?utf-8?B?b2Q3dWZUWGk2UVNGM25KOTdOQUErM1dvdWFxMFcva0ZRSHh1STBRZ0NJZm1N?=
 =?utf-8?B?dml1bGo4R24vQ050dUJ0bDg1SUtVNi9iOW9Xcno3YUVHeG15eXh3MDViQVRI?=
 =?utf-8?B?UVZhaXo3c3RxTDNzZ2VmcU81T1RTT0RwUEdpYUNrVW8veFJWYmEzV0N6ODZj?=
 =?utf-8?B?SDBoNGtaUU1EUFZUNEZZcEdmdHFGMk1OYW5veDVCdkl1MTlWL2c5bkpnbGpu?=
 =?utf-8?B?UDNqSFprZHJrdlV6anBEamZNNUhjaEs2UERrZDI4L01JblN5UTlmM3pzcnFE?=
 =?utf-8?B?d0NlaXVLN1RMeDJiVzhqeU5DbmxnVE9ONDlvSDFKdkNRd1ljbzFtaDhFNmtK?=
 =?utf-8?B?c2E1aDFGTlYyOWNPNE1kdlB0VTVPTEtkZ2ZxeHFmN3RFMnFjVXB5UkNabmpq?=
 =?utf-8?B?U3dodkxBRk9pRVUzNTkvaU9uZE1TUEhwdnlRWTZncTZ2RTJrYmtSb0R4eXBu?=
 =?utf-8?B?TGFMTDBsUFU0WVZ0cUtGbGpjemN3NTJ1TXAyZzZGODFINk9ZNFdtd1J0OGdz?=
 =?utf-8?B?eDNYNlRTS2tkNW0rTEtKTXRsTXNubjY4L3ZtcGxFMEFSM3lZZStBMWhHbHUr?=
 =?utf-8?B?UzVhRmgyNHNuOGszbGpWaTl4RGRuZ215ZlRPN0lWUVZiYVNzZlh1MXlmK21K?=
 =?utf-8?B?eHJwU1pSZzdLUGR2YTFSbEp0bCtkcTliU0svdTZoM1h6R1V1aHpTYVFIT2J1?=
 =?utf-8?B?ZC9jbThzNFBWVm1KWGxlTWlHOXhkeXR0Y1lWdHpZbEFaZHBZNlpXWVVhRXdr?=
 =?utf-8?B?empxUy82K0FWMU4vdUdObllnalgyV1hSQUczdWZBZ0lqNGFwMHlibW1MclhH?=
 =?utf-8?B?bC9saDZzMTVWZWVOSWpZcDBBMDZrOWx1cHI4b2cxSGsweCt2Y1I5M0FEQng3?=
 =?utf-8?B?bXhRQ0x3WmVFSnczUWlQd0NjbkQ0U2V0U3RHQnJRRWFNTFRHa1czWWVLR3Va?=
 =?utf-8?B?T1Y2ZVNtYnVEMVNEMlZ6cUhBMkRMZ2RQN253U21yOFpxMjhNVy8rTDZPYXhx?=
 =?utf-8?B?VmI4ZUxveVlqNUNXbjhUZGRGUUI5R0d0V296QzRkQlRKTHA2eEdRNnlpMU9O?=
 =?utf-8?B?Rm92bDhkaGJMdXBYTjBWbFV4K0FTbTU3eEV3eVV4OVlQY0xHa2hVQUxBUnFO?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 649d4084-ea5e-4b7d-500a-08db8c1c7a17
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 08:03:34.2862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gs8g0fOFOIWZoavFmwnF0NZXID7Pz4PTFwCtmrkBAko/0lbHKCyOF/SVfqg5VNvikgblR8Xmq+Mxtcmqm6MfjuW6Znc5gL6jgTT90JzMcr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7073
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 22-07-2023 11:34, Dixit, Ashutosh wrote:

Hi Ashutosh,

> On Fri, 21 Jul 2023 16:36:02 -0700, Dixit, Ashutosh wrote:
>>
>> On Fri, 21 Jul 2023 04:51:09 -0700, Iddamsetty, Aravind wrote:
>>>
>> Hi Aravind,
>>
>>> On 21-07-2023 06:32, Dixit, Ashutosh wrote:
>>>> On Tue, 27 Jun 2023 05:21:13 -0700, Aravind Iddamsetty wrote:
>>>>>
>>>> More stuff to mull over. You can ignore comments starting with "OK", those
>>>> are just notes to myself.
>>>>
>>>> Also, maybe some time we can add a basic IGT which reads these exposed
>>>> counters and verifies that we can read them and they are monotonically
>>>> increasing?
>>>
>>> this is the IGT https://patchwork.freedesktop.org/series/119936/ series
>>> using these counters posted by Venkat.
>>>
>>>>
>>>>> There are a set of engine group busyness counters provided by HW which are
>>>>> perfect fit to be exposed via PMU perf events.
>>>>>
>>>>> BSPEC: 46559, 46560, 46722, 46729
>>>>
>>>> Also add these Bspec entries: 71028, 52071
>>>
>>> OK.
>>>
>>>>
>>>>>
>>>>> events can be listed using:
>>>>> perf list
>>>>>   xe_0000_03_00.0/any-engine-group-busy-gt0/         [Kernel PMU event]
>>>>>   xe_0000_03_00.0/copy-group-busy-gt0/               [Kernel PMU event]
>>>>>   xe_0000_03_00.0/interrupts/                        [Kernel PMU event]
>>>>>   xe_0000_03_00.0/media-group-busy-gt0/              [Kernel PMU event]
>>>>>   xe_0000_03_00.0/render-group-busy-gt0/             [Kernel PMU event]
>>>>>
>>>>> and can be read using:
>>>>>
>>>>> perf stat -e "xe_0000_8c_00.0/render-group-busy-gt0/" -I 1000
>>>>>            time             counts unit events
>>>>>      1.001139062                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>      2.003294678                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>      3.005199582                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>      4.007076497                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>      5.008553068                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>      6.010531563              43520 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>      7.012468029              44800 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>      8.013463515                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>      9.015300183                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>     10.017233010                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>     10.971934120                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>
>>>>> The pmu base implementation is taken from i915.
>>>>>
>>>>> v2:
>>>>> Store last known value when device is awake return that while the GT is
>>>>> suspended and then update the driver copy when read during awake.
>>>>>
>>>>> Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>> Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>>>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>>> ---
>>>>>  drivers/gpu/drm/xe/Makefile          |   2 +
>>>>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |   5 +
>>>>>  drivers/gpu/drm/xe/xe_device.c       |   2 +
>>>>>  drivers/gpu/drm/xe/xe_device_types.h |   4 +
>>>>>  drivers/gpu/drm/xe/xe_gt.c           |   2 +
>>>>>  drivers/gpu/drm/xe/xe_irq.c          |  22 +
>>>>>  drivers/gpu/drm/xe/xe_module.c       |   5 +
>>>>>  drivers/gpu/drm/xe/xe_pmu.c          | 739 +++++++++++++++++++++++++++
>>>>>  drivers/gpu/drm/xe/xe_pmu.h          |  25 +
>>>>>  drivers/gpu/drm/xe/xe_pmu_types.h    |  80 +++
>>>>>  include/uapi/drm/xe_drm.h            |  16 +
>>>>>  11 files changed, 902 insertions(+)
>>>>>  create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
>>>>>  create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
>>>>>  create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>>> index 081c57fd8632..e52ab795c566 100644
>>>>> --- a/drivers/gpu/drm/xe/Makefile
>>>>> +++ b/drivers/gpu/drm/xe/Makefile
>>>>> @@ -217,6 +217,8 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>>>> 	i915-display/skl_universal_plane.o \
>>>>> 	i915-display/skl_watermark.o
>>>>>
>>>>> +xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>>>>> +
>>>>>  ifeq ($(CONFIG_ACPI),y)
>>>>> 	xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>>>> 		i915-display/intel_acpi.o \
>>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>>> index 3f664011eaea..c7d9e4634745 100644
>>>>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>>> @@ -285,6 +285,11 @@
>>>>>  #define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
>>>>>  #define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
>>>>>
>>>>> +#define XE_OAG_RC0_ANY_ENGINE_BUSY_FREE		XE_REG(0xdb80)
>>>>> +#define XE_OAG_ANY_MEDIA_FF_BUSY_FREE		XE_REG(0xdba0)
>>>>> +#define XE_OAG_BLT_BUSY_FREE			XE_REG(0xdbbc)
>>>>> +#define XE_OAG_RENDER_BUSY_FREE			XE_REG(0xdbdc)
>>>>> +
>>>>>  #define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
>>>>>  #define   ENABLE_SMALLPL			REG_BIT(15)
>>>>>  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
>>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>>>> index c7985af85a53..b2c7bd4a97d9 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>>> @@ -328,6 +328,8 @@ int xe_device_probe(struct xe_device *xe)
>>>>>
>>>>> 	xe_debugfs_register(xe);
>>>>>
>>>>> +	xe_pmu_register(&xe->pmu);
>>>>> +
>>>>> 	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
>>>>> 	if (err)
>>>>> 		return err;
>>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>>>> index 0226d44a6af2..3ba99aae92b9 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>>> @@ -15,6 +15,7 @@
>>>>>  #include "xe_devcoredump_types.h"
>>>>>  #include "xe_gt_types.h"
>>>>>  #include "xe_platform_types.h"
>>>>> +#include "xe_pmu.h"
>>>>>  #include "xe_step_types.h"
>>>>>
>>>>>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>>>>> @@ -332,6 +333,9 @@ struct xe_device {
>>>>> 	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
>>>>> 	bool d3cold_allowed;
>>>>>
>>>>> +	/* @pmu: performance monitoring unit */
>>>>> +	struct xe_pmu pmu;
>>>>> +
>>>>
>>>> Now I am wondering why we don't make the PMU per-gt (or per-tile)? Per-gt
>>>> would work for these busyness registers and I am not sure how the
>>>> interrupts are hooked up.
>>>>
>>>> In i915 the PMU being device level helped in having a single timer (rather
>>>> than a per gt timer).
>>>>
>>>> Anyway probably not much practical benefit by make it per-gt/per-tile, so
>>>> maybe leave as is. Just thinking out loud.
>>>
>>> we are able to expose per-gt counters so do not see any benefit in
>>> making pmu per-gt, also i believe struct pmu is per device it will have
>>> a type associated which is unique for a device.
>>
>> PMU can be made per gt and named xe-gt0, xe-gt1 etc. if we want. But anyway
>> leave as is.
>>
>>>
>>>>
>>>>> 	/* private: */
>>>>>
>>>>>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>>> index 2458397ce8af..96e3720923d4 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>>>> @@ -593,6 +593,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>>>>> 	if (err)
>>>>> 		goto err_msg;
>>>>>
>>>>> +	engine_group_busyness_store(gt);
>>>>
>>>> Not sure I follow the reason for doing this at suspend time? If PMU was
>>>> active there should be a previous value. Why must we take a new sample
>>>> explicitly here?
>>>
>>> the PMU interface can be read even when device is suspend and in such
>>> cases we should not wake up the device, and if we try to read the
>>> register when device is suspended it gives spurious counter you can
>>> check in version#1 of this series we were getting huge values. as we put
>>> the device to suspend immediately after probe. So storing the last known
>>> good value before suspend.
>>
>> No need, see comment at init_samples below.
> 
> Sorry, you are right, I changed my mind about this, I see your point. See
> more discussion on this at init_samples below.
> 
>>
>>>
>>>>
>>>> To me looks like engine_group_busyness_store should not be needed, see
>>>> comment below for init_samples too.
>>>>
>>>>> +
>>>>> 	err = xe_uc_suspend(&gt->uc);
>>>>> 	if (err)
>>>>> 		goto err_force_wake;
>>>>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>>>>> index b4ed1e4a3388..cb943fb94ec7 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_irq.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>>>>> @@ -27,6 +27,24 @@
>>>>>  #define IIR(offset)				XE_REG(offset + 0x8)
>>>>>  #define IER(offset)				XE_REG(offset + 0xc)
>>>>>
>>>>> +/*
>>>>> + * Interrupt statistic for PMU. Increments the counter only if the
>>>>> + * interrupt originated from the GPU so interrupts from a device which
>>>>> + * shares the interrupt line are not accounted.
>>>>> + */
>>>>> +static inline void xe_pmu_irq_stats(struct xe_device *xe,
>>>>
>>>> No inline, compiler will do it, but looks like we may want to always_inline
>>>> this. Also this function should really be in xe_pmu.h? Anyway probably
>>>> leave as is.
>>>>
>>>>> +				    irqreturn_t res)
>>>>> +{
>>>>> +	if (unlikely(res != IRQ_HANDLED))
>>>>> +		return;
>>>>> +
>>>>> +	/*
>>>>> +	 * A clever compiler translates that into INC. A not so clever one
>>>>> +	 * should at least prevent store tearing.
>>>>> +	 */
>>>>> +	WRITE_ONCE(xe->pmu.irq_count, xe->pmu.irq_count + 1);
>>>>> +}
>>>>> +
>>>>>  static void assert_iir_is_zero(struct xe_gt *mmio, struct xe_reg reg)
>>>>>  {
>>>>> 	u32 val = xe_mmio_read32(mmio, reg);
>>>>> @@ -325,6 +343,8 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
>>>>>
>>>>> 	xe_display_irq_enable(xe, gu_misc_iir);
>>>>>
>>>>> +	xe_pmu_irq_stats(xe, IRQ_HANDLED);
>>>>> +
>>>>> 	return IRQ_HANDLED;
>>>>>  }
>>>>>
>>>>> @@ -414,6 +434,8 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>>>>> 	dg1_intr_enable(xe, false);
>>>>> 	xe_display_irq_enable(xe, gu_misc_iir);
>>>>>
>>>>> +	xe_pmu_irq_stats(xe, IRQ_HANDLED);
>>>>> +
>>>>> 	return IRQ_HANDLED;
>>>>>  }
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>>>>> index 75e5be939f53..f6fe89748525 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_module.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_module.c
>>>>> @@ -12,6 +12,7 @@
>>>>>  #include "xe_hw_fence.h"
>>>>>  #include "xe_module.h"
>>>>>  #include "xe_pci.h"
>>>>> +#include "xe_pmu.h"
>>>>>  #include "xe_sched_job.h"
>>>>>
>>>>>  bool enable_guc = true;
>>>>> @@ -49,6 +50,10 @@ static const struct init_funcs init_funcs[] = {
>>>>> 		.init = xe_sched_job_module_init,
>>>>> 		.exit = xe_sched_job_module_exit,
>>>>> 	},
>>>>> +	{
>>>>> +		.init = xe_pmu_init,
>>>>> +		.exit = xe_pmu_exit,
>>>>> +	},
>>>>> 	{
>>>>> 		.init = xe_register_pci_driver,
>>>>> 		.exit = xe_unregister_pci_driver,
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>>>> new file mode 100644
>>>>> index 000000000000..bef1895be9f7
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>>>>> @@ -0,0 +1,739 @@
>>>>> +/*
>>>>> + * SPDX-License-Identifier: MIT
>>>>> + *
>>>>> + * Copyright © 2023 Intel Corporation
>>>>> + */
>>>>
>>>> This SPDX header is for .h files not .c files. Actually, it is for neither :/
>>>
>>> But i see this in almost all the files in xe.
>>
>> Look closely.
>>
>>>>
>>>>> +
>>>>> +#include <drm/drm_drv.h>
>>>>> +#include <drm/drm_managed.h>
>>>>> +#include <drm/xe_drm.h>
>>>>> +
>>>>> +#include "regs/xe_gt_regs.h"
>>>>> +#include "xe_device.h"
>>>>> +#include "xe_gt_clock.h"
>>>>> +#include "xe_mmio.h"
>>>>> +
>>>>> +static cpumask_t xe_pmu_cpumask;
>>>>> +static unsigned int xe_pmu_target_cpu = -1;
>>>>> +
>>>>> +static unsigned int config_gt_id(const u64 config)
>>>>> +{
>>>>> +	return config >> __XE_PMU_GT_SHIFT;
>>>>> +}
>>>>> +
>>>>> +static u64 config_counter(const u64 config)
>>>>> +{
>>>>> +	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>>>>> +}
>>>>> +
>>>>> +static unsigned int
>>>>> +__sample_idx(struct xe_pmu *pmu, unsigned int gt_id, int sample)
>>>>> +{
>>>>> +	unsigned int idx = gt_id * __XE_NUM_PMU_SAMPLERS + sample;
>>>>> +
>>>>> +	XE_BUG_ON(idx >= ARRAY_SIZE(pmu->sample));
>>>>> +
>>>>> +	return idx;
>>>>> +}
>>>>
>>>> The compiler does this for us if we make sample array 2-d.
>>>>
>>>>> +
>>>>> +static u64 read_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample)
>>>>> +{
>>>>> +	return pmu->sample[__sample_idx(pmu, gt_id, sample)].cur;
>>>>> +}
>>>>> +
>>>>> +static void
>>>>> +store_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample, u64 val)
>>>>> +{
>>>>> +	pmu->sample[__sample_idx(pmu, gt_id, sample)].cur = val;
>>>>> +}
>>>>
>>>> The three functions above are not needed if we make the sample array
>>>> 2-d. See here:
>>>>
>>>> https://patchwork.freedesktop.org/patch/538887/?series=118225&rev=1
>>>>
>>>> Only a part of the patch above was merged (see 8ed0753b527dc) to keep the
>>>> patch size small, but since for xe we are starting from scratch we can
>>>> implement the whole approach above (get rid of the read/store helpers
>>>> entirely, direct assignment without the helpers works).
>>>
>>> Ok I'll go over it.
>>>
>>>>
>>>>> +
>>>>> +static int engine_busyness_sample_type(u64 config)
>>>>> +{
>>>>> +	int type = 0;
>>>>> +
>>>>> +	switch (config) {
>>>>> +	case XE_PMU_RENDER_GROUP_BUSY(0):
>>>>> +		type =  __XE_SAMPLE_RENDER_GROUP_BUSY;
>>>>> +		break;
>>>>> +	case XE_PMU_COPY_GROUP_BUSY(0):
>>>>> +		type = __XE_SAMPLE_COPY_GROUP_BUSY;
>>>>> +		break;
>>>>> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
>>>>> +		type = __XE_SAMPLE_MEDIA_GROUP_BUSY;
>>>>> +		break;
>>>>> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>>>>> +		type = __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY;
>>>>> +		break;
>>>>> +	}
>>>>> +
>>>>> +	return type;
>>>>> +}
>>>>> +
>>>>> +static void xe_pmu_event_destroy(struct perf_event *event)
>>>>> +{
>>>>> +	struct xe_device *xe =
>>>>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>>>>> +
>>>>> +	drm_WARN_ON(&xe->drm, event->parent);
>>>>> +
>>>>> +	drm_dev_put(&xe->drm);
>>>>> +}
>>>>> +
>>>>> +static u64 __engine_group_busyness_read(struct xe_gt *gt, u64 config)
>>>>> +{
>>>>> +	u64 val = 0;
>>>>> +
>>>>> +	switch (config) {
>>>>> +	case XE_PMU_RENDER_GROUP_BUSY(0):
>>>>> +		val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
>>>>> +		break;
>>>>> +	case XE_PMU_COPY_GROUP_BUSY(0):
>>>>> +		val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
>>>>> +		break;
>>>>> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
>>>>> +		val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
>>>>> +		break;
>>>>> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>>>>> +		val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
>>>>> +		break;
>>>>> +	default:
>>>>> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>>>>> +	}
>>>>
>>>> We need xe_device_mem_access_get, also xe_force_wake_get if applicable,
>>>> somewhere before reading these registers.
>>>>
>>>>> +
>>>>> +	return xe_gt_clock_interval_to_ns(gt, val * 16);
>>>>> +}
>>>>> +
>>>>> +static u64 engine_group_busyness_read(struct xe_gt *gt, u64 config)
>>>>> +{
>>>>> +	int sample_type = engine_busyness_sample_type(config);
>>>>> +	struct xe_device *xe = gt->tile->xe;
>>>>> +	const unsigned int gt_id = gt->info.id;
>>>>> +	struct xe_pmu *pmu = &xe->pmu;
>>>>> +	bool device_awake;
>>>>> +	unsigned long flags;
>>>>> +	u64 val;
>>>>> +
>>>>> +	/*
>>>>> +	 * found no better way to check if device is awake or not. Before
>>>>
>>>> xe_device_mem_access_get_if_ongoing (hard to find name).
>>>
>>> thanks for sharing looks to be added recently. If we use this we needn't
>>> use xe_device_mem_access_get.
>>
>> See comment at init_samples.
>>
>>>
>>>>
>>>>> +	 * we suspend we set the submission_state.enabled to false.
>>>>> +	 */
>>>>> +	device_awake = gt->uc.guc.submission_state.enabled ? true : false;
>>>>> +	if (device_awake)
>>>>> +		val = __engine_group_busyness_read(gt, config);
>>>>> +
>>>>> +	spin_lock_irqsave(&pmu->lock, flags);
>>>>> +
>>>>> +	if (device_awake)
>>>>> +		store_sample(pmu, gt_id, sample_type, val);
>>>>> +	else
>>>>> +		val = read_sample(pmu, gt_id, sample_type);
>>>>> +
>>>>> +	spin_unlock_irqrestore(&pmu->lock, flags);
>>>>> +
>>>>> +	return val;
>>>>> +}
>>>>> +
>>>>> +void engine_group_busyness_store(struct xe_gt *gt)
>>>>> +{
>>>>> +	struct xe_pmu *pmu = &gt->tile->xe->pmu;
>>>>> +	unsigned int gt_id = gt->info.id;
>>>>> +	unsigned long flags;
>>>>> +
>>>>> +	spin_lock_irqsave(&pmu->lock, flags);
>>>>> +
>>>>> +	store_sample(pmu, gt_id, __XE_SAMPLE_RENDER_GROUP_BUSY,
>>>>> +		     __engine_group_busyness_read(gt, XE_PMU_RENDER_GROUP_BUSY(0)));
>>>>> +	store_sample(pmu, gt_id, __XE_SAMPLE_COPY_GROUP_BUSY,
>>>>> +		     __engine_group_busyness_read(gt, XE_PMU_COPY_GROUP_BUSY(0)));
>>>>> +	store_sample(pmu, gt_id, __XE_SAMPLE_MEDIA_GROUP_BUSY,
>>>>> +		     __engine_group_busyness_read(gt, XE_PMU_MEDIA_GROUP_BUSY(0)));
>>>>> +	store_sample(pmu, gt_id, __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY,
>>>>> +		     __engine_group_busyness_read(gt, XE_PMU_ANY_ENGINE_GROUP_BUSY(0)));
> 
> Here why should we store everything, we should store only those events
> which are enabled?

The events are enabled only when they are opened which can happen after
the device is suspended hence we need to store all. As in the present
case device is put to suspend immediately after probe and event is
opened post driver load is done.

> 
> Also it would good if the above can be done in a loop somehow. 4 is fine
> but if we add events later, a loop will be nice, if possible.

I do not think loop would solve the furture events as there can be
selective i.e only few needs to be stored. pure counters like interrupts
need not be stored.

> 
>>>>> +
>>>>> +	spin_unlock_irqrestore(&pmu->lock, flags);
>>>>> +}
>>>>> +
>>>>> +static int
>>>>> +config_status(struct xe_device *xe, u64 config)
>>>>> +{
>>>>> +	unsigned int max_gt_id = xe->info.gt_count > 1 ? 1 : 0;
>>>>> +	unsigned int gt_id = config_gt_id(config);
>>>>> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>>>>> +
>>>>> +	if (gt_id > max_gt_id)
>>>>> +		return -ENOENT;
>>>>> +
>>>>> +	switch (config_counter(config)) {
>>>>> +	case XE_PMU_INTERRUPTS(0):
>>>>> +		if (gt_id)
>>>>> +			return -ENOENT;
>>>>
>>>> OK: this is a global event so we say this is enabled only for gt0.
>>>>
>>>>> +		break;
>>>>> +	case XE_PMU_RENDER_GROUP_BUSY(0):
>>>>> +	case XE_PMU_COPY_GROUP_BUSY(0):
>>>>> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>>>>> +		if (GRAPHICS_VER(xe) < 12)
>>>>
>>>> Any point checking? xe only supports Gen12+.
>>>
>>> hmmm ya good point will remove this.
>>>>
>>>>> +			return -ENOENT;
>>>>> +		break;
>>>>> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
>>>>> +		if (MEDIA_VER(xe) >= 13 && gt->info.type != XE_GT_TYPE_MEDIA)
>>>>> +			return -ENOENT;
>>>>
>>>> OK: this makes sense, so we will expose this event only for media gt's.
>>>>
>>>>> +		break;
>>>>> +	default:
>>>>> +		return -ENOENT;
>>>>> +	}
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static int xe_pmu_event_init(struct perf_event *event)
>>>>> +{
>>>>> +	struct xe_device *xe =
>>>>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>>>>> +	struct xe_pmu *pmu = &xe->pmu;
>>>>> +	int ret;
>>>>> +
>>>>> +	if (pmu->closed)
>>>>> +		return -ENODEV;
>>>>> +
>>>>> +	if (event->attr.type != event->pmu->type)
>>>>> +		return -ENOENT;
>>>>> +
>>>>> +	/* unsupported modes and filters */
>>>>> +	if (event->attr.sample_period) /* no sampling */
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	if (has_branch_stack(event))
>>>>> +		return -EOPNOTSUPP;
>>>>> +
>>>>> +	if (event->cpu < 0)
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	/* only allow running on one cpu at a time */
>>>>> +	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	ret = config_status(xe, event->attr.config);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	if (!event->parent) {
>>>>> +		drm_dev_get(&xe->drm);
>>>>> +		event->destroy = xe_pmu_event_destroy;
>>>>> +	}
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static u64 __xe_pmu_event_read(struct perf_event *event)
>>>>> +{
>>>>> +	struct xe_device *xe =
>>>>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>>>>> +	const unsigned int gt_id = config_gt_id(event->attr.config);
>>>>> +	const u64 config = config_counter(event->attr.config);
>>>>> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>>>>> +	struct xe_pmu *pmu = &xe->pmu;
>>>>> +	u64 val = 0;
>>>>> +
>>>>> +	switch (config) {
>>>>> +	case XE_PMU_INTERRUPTS(0):
>>>>> +		val = READ_ONCE(pmu->irq_count);
>>>>
>>>> OK: The correct way to do this READ_ONCE/WRITE_ONCE irq_count stuff would
>>>> be to take pmu->lock (both while reading and writing irq_count) but that
>>>> would be expensive in the interrupt handler (as the .h hints). So all we
>>>> can do is what is done here.
>>>>
>>>>> +		break;
>>>>> +	case XE_PMU_RENDER_GROUP_BUSY(0):
>>>>> +	case XE_PMU_COPY_GROUP_BUSY(0):
>>>>> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>>>>> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
>>>>> +		val = engine_group_busyness_read(gt, config);
>>>>> +	}
>>>>> +
>>>>> +	return val;
>>>>> +}
>>>>> +
>>>>> +static void xe_pmu_event_read(struct perf_event *event)
>>>>> +{
>>>>> +	struct xe_device *xe =
>>>>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>>>>> +	struct hw_perf_event *hwc = &event->hw;
>>>>> +	struct xe_pmu *pmu = &xe->pmu;
>>>>> +	u64 prev, new;
>>>>> +
>>>>> +	if (pmu->closed) {
>>>>> +		event->hw.state = PERF_HES_STOPPED;
>>>>> +		return;
>>>>> +	}
>>>>> +again:
>>>>> +	prev = local64_read(&hwc->prev_count);
>>>>> +	new = __xe_pmu_event_read(event);
>>>>> +
>>>>> +	if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
>>>>> +		goto again;
>>>>> +
>>>>> +	local64_add(new - prev, &event->count);
>>>>> +}
>>>>> +
>>>>> +static void xe_pmu_enable(struct perf_event *event)
>>>>> +{
>>>>> +	/*
>>>>> +	 * Store the current counter value so we can report the correct delta
>>>>> +	 * for all listeners. Even when the event was already enabled and has
>>>>> +	 * an existing non-zero value.
>>>>> +	 */
>>>>> +	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>>>>> +}
>>>>> +
>>>>> +static void xe_pmu_event_start(struct perf_event *event, int flags)
>>>>> +{
>>>>> +	struct xe_device *xe =
>>>>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>>>>> +	struct xe_pmu *pmu = &xe->pmu;
>>>>> +
>>>>> +	if (pmu->closed)
>>>>> +		return;
>>>>> +
>>>>> +	xe_pmu_enable(event);
>>>>> +	event->hw.state = 0;
>>>>> +}
>>>>> +
>>>>> +static void xe_pmu_event_stop(struct perf_event *event, int flags)
>>>>> +{
>>>>> +	if (flags & PERF_EF_UPDATE)
>>>>> +		xe_pmu_event_read(event);
>>>>> +
>>>>> +	event->hw.state = PERF_HES_STOPPED;
>>>>> +}
>>>>> +
>>>>> +static int xe_pmu_event_add(struct perf_event *event, int flags)
>>>>> +{
>>>>> +	struct xe_device *xe =
>>>>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>>>>> +	struct xe_pmu *pmu = &xe->pmu;
>>>>> +
>>>>> +	if (pmu->closed)
>>>>> +		return -ENODEV;
>>>>> +
>>>>> +	if (flags & PERF_EF_START)
>>>>> +		xe_pmu_event_start(event, flags);
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static void xe_pmu_event_del(struct perf_event *event, int flags)
>>>>> +{
>>>>> +	xe_pmu_event_stop(event, PERF_EF_UPDATE);
>>>>> +}
>>>>> +
>>>>> +static int xe_pmu_event_event_idx(struct perf_event *event)
>>>>> +{
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +struct xe_str_attribute {
>>>>> +	struct device_attribute attr;
>>>>> +	const char *str;
>>>>> +};
>>>>> +
>>>>> +static ssize_t xe_pmu_format_show(struct device *dev,
>>>>> +				  struct device_attribute *attr, char *buf)
>>>>> +{
>>>>> +	struct xe_str_attribute *eattr;
>>>>> +
>>>>> +	eattr = container_of(attr, struct xe_str_attribute, attr);
>>>>> +	return sprintf(buf, "%s\n", eattr->str);
>>>>> +}
>>>>> +
>>>>> +#define XE_PMU_FORMAT_ATTR(_name, _config) \
>>>>> +	(&((struct xe_str_attribute[]) { \
>>>>> +		{ .attr = __ATTR(_name, 0444, xe_pmu_format_show, NULL), \
>>>>> +		  .str = _config, } \
>>>>> +	})[0].attr.attr)
>>>>> +
>>>>> +static struct attribute *xe_pmu_format_attrs[] = {
>>>>> +	XE_PMU_FORMAT_ATTR(xe_eventid, "config:0-20"),
>>>>
>>>> 0-20 means 0-20 bits? Though here we probably have different number of
>>>> config bits? Probably doesn't matter?
>>>
>>> as i understand this is not used anymore so will remove it.
>>>
>>>>
>>>> The string will show up with:
>>>>
>>>> cat /sys/devices/xe/format/xe_eventid
>>>>
>>>>> +	NULL,
>>>>> +};
>>>>> +
>>>>> +static const struct attribute_group xe_pmu_format_attr_group = {
>>>>> +	.name = "format",
>>>>> +	.attrs = xe_pmu_format_attrs,
>>>>> +};
>>>>> +
>>>>> +struct xe_ext_attribute {
>>>>> +	struct device_attribute attr;
>>>>> +	unsigned long val;
>>>>> +};
>>>>> +
>>>>> +static ssize_t xe_pmu_event_show(struct device *dev,
>>>>> +				 struct device_attribute *attr, char *buf)
>>>>> +{
>>>>> +	struct xe_ext_attribute *eattr;
>>>>> +
>>>>> +	eattr = container_of(attr, struct xe_ext_attribute, attr);
>>>>> +	return sprintf(buf, "config=0x%lx\n", eattr->val);
>>>>> +}
>>>>> +
>>>>> +static ssize_t cpumask_show(struct device *dev,
>>>>> +			    struct device_attribute *attr, char *buf)
>>>>> +{
>>>>> +	return cpumap_print_to_pagebuf(true, buf, &xe_pmu_cpumask);
>>>>> +}
>>>>> +
>>>>> +static DEVICE_ATTR_RO(cpumask);
>>>>> +
>>>>> +static struct attribute *xe_cpumask_attrs[] = {
>>>>> +	&dev_attr_cpumask.attr,
>>>>> +	NULL,
>>>>> +};
>>>>> +
>>>>> +static const struct attribute_group xe_pmu_cpumask_attr_group = {
>>>>> +	.attrs = xe_cpumask_attrs,
>>>>> +};
>>>>> +
>>>>> +#define __event(__counter, __name, __unit) \
>>>>> +{ \
>>>>> +	.counter = (__counter), \
>>>>> +	.name = (__name), \
>>>>> +	.unit = (__unit), \
>>>>> +	.global = false, \
>>>>> +}
>>>>> +
>>>>> +#define __global_event(__counter, __name, __unit) \
>>>>> +{ \
>>>>> +	.counter = (__counter), \
>>>>> +	.name = (__name), \
>>>>> +	.unit = (__unit), \
>>>>> +	.global = true, \
>>>>> +}
>>>>> +
>>>>> +static struct xe_ext_attribute *
>>>>> +add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64 config)
>>>>> +{
>>>>> +	sysfs_attr_init(&attr->attr.attr);
>>>>> +	attr->attr.attr.name = name;
>>>>> +	attr->attr.attr.mode = 0444;
>>>>> +	attr->attr.show = xe_pmu_event_show;
>>>>> +	attr->val = config;
>>>>> +
>>>>> +	return ++attr;
>>>>> +}
>>>>> +
>>>>> +static struct perf_pmu_events_attr *
>>>>> +add_pmu_attr(struct perf_pmu_events_attr *attr, const char *name,
>>>>> +	     const char *str)
>>>>> +{
>>>>> +	sysfs_attr_init(&attr->attr.attr);
>>>>> +	attr->attr.attr.name = name;
>>>>> +	attr->attr.attr.mode = 0444;
>>>>> +	attr->attr.show = perf_event_sysfs_show;
>>>>> +	attr->event_str = str;
>>>>> +
>>>>> +	return ++attr;
>>>>> +}
>>>>> +
>>>>> +static struct attribute **
>>>>> +create_event_attributes(struct xe_pmu *pmu)
>>>>> +{
>>>>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>>>>> +	static const struct {
>>>>> +		unsigned int counter;
>>>>> +		const char *name;
>>>>> +		const char *unit;
>>>>> +		bool global;
>>>>> +	} events[] = {
>>>>> +		__global_event(0, "interrupts", NULL),
>>>>> +		__event(1, "render-group-busy", "ns"),
>>>>> +		__event(2, "copy-group-busy", "ns"),
>>>>> +		__event(3, "media-group-busy", "ns"),
>>>>> +		__event(4, "any-engine-group-busy", "ns"),
>>>>> +	};
>>>>
>>>> OK: this function is some black magic to expose stuff through
>>>> PMU. Identical to i915 and seems to be working from the commit message so
>>>> should be fine.
>>>>
>>>>> +
>>>>> +	unsigned int count = 0;
>>>>> +	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>>>>> +	struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
>>>>> +	struct attribute **attr = NULL, **attr_iter;
>>>>> +	struct xe_gt *gt;
>>>>> +	unsigned int i, j;
>>>>> +
>>>>> +	/* Count how many counters we will be exposing. */
>>>>> +	for_each_gt(gt, xe, j) {
>>>>> +		for (i = 0; i < ARRAY_SIZE(events); i++) {
>>>>> +			u64 config = ___XE_PMU_OTHER(j, events[i].counter);
>>>>> +
>>>>> +			if (!config_status(xe, config))
>>>>> +				count++;
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>> +	/* Allocate attribute objects and table. */
>>>>> +	xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
>>>>> +	if (!xe_attr)
>>>>> +		goto err_alloc;
>>>>> +
>>>>> +	pmu_attr = kcalloc(count, sizeof(*pmu_attr), GFP_KERNEL);
>>>>> +	if (!pmu_attr)
>>>>> +		goto err_alloc;
>>>>> +
>>>>> +	/* Max one pointer of each attribute type plus a termination entry. */
>>>>> +	attr = kcalloc(count * 2 + 1, sizeof(*attr), GFP_KERNEL);
>>>>> +	if (!attr)
>>>>> +		goto err_alloc;
>>>>> +
>>>>> +	xe_iter = xe_attr;
>>>>> +	pmu_iter = pmu_attr;
>>>>> +	attr_iter = attr;
>>>>> +
>>>>> +	for_each_gt(gt, xe, j) {
>>>>> +		for (i = 0; i < ARRAY_SIZE(events); i++) {
>>>>> +			u64 config = ___XE_PMU_OTHER(j, events[i].counter);
>>>>> +			char *str;
>>>>> +
>>>>> +			if (config_status(xe, config))
>>>>> +				continue;
>>>>> +
>>>>> +			if (events[i].global)
>>>>> +				str = kstrdup(events[i].name, GFP_KERNEL);
>>>>> +			else
>>>>> +				str = kasprintf(GFP_KERNEL, "%s-gt%u",
>>>>> +						events[i].name, j);
>>>>> +			if (!str)
>>>>> +				goto err;
>>>>> +
>>>>> +			*attr_iter++ = &xe_iter->attr.attr;
>>>>> +			xe_iter = add_xe_attr(xe_iter, str, config);
>>>>> +
>>>>> +			if (events[i].unit) {
>>>>> +				if (events[i].global)
>>>>> +					str = kasprintf(GFP_KERNEL, "%s.unit",
>>>>> +							events[i].name);
>>>>> +				else
>>>>> +					str = kasprintf(GFP_KERNEL, "%s-gt%u.unit",
>>>>> +							events[i].name, j);
>>>>> +				if (!str)
>>>>> +					goto err;
>>>>> +
>>>>> +				*attr_iter++ = &pmu_iter->attr.attr;
>>>>> +				pmu_iter = add_pmu_attr(pmu_iter, str,
>>>>> +							events[i].unit);
>>>>> +			}
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>> +	pmu->xe_attr = xe_attr;
>>>>> +	pmu->pmu_attr = pmu_attr;
>>>>> +
>>>>> +	return attr;
>>>>> +
>>>>> +err:
>>>>> +	for (attr_iter = attr; *attr_iter; attr_iter++)
>>>>> +		kfree((*attr_iter)->name);
>>>>> +
>>>>> +err_alloc:
>>>>> +	kfree(attr);
>>>>> +	kfree(xe_attr);
>>>>> +	kfree(pmu_attr);
>>>>> +
>>>>> +	return NULL;
>>>>> +}
>>>>> +
>>>>> +static void free_event_attributes(struct xe_pmu *pmu)
>>>>> +{
>>>>> +	struct attribute **attr_iter = pmu->events_attr_group.attrs;
>>>>> +
>>>>> +	for (; *attr_iter; attr_iter++)
>>>>> +		kfree((*attr_iter)->name);
>>>>> +
>>>>> +	kfree(pmu->events_attr_group.attrs);
>>>>> +	kfree(pmu->xe_attr);
>>>>> +	kfree(pmu->pmu_attr);
>>>>> +
>>>>> +	pmu->events_attr_group.attrs = NULL;
>>>>> +	pmu->xe_attr = NULL;
>>>>> +	pmu->pmu_attr = NULL;
>>>>> +}
>>>>> +
>>>>> +static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
>>>>> +{
>>>>> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>>>>> +
>>>>> +	XE_BUG_ON(!pmu->base.event_init);
>>>>> +
>>>>> +	/* Select the first online CPU as a designated reader. */
>>>>> +	if (cpumask_empty(&xe_pmu_cpumask))
>>>>> +		cpumask_set_cpu(cpu, &xe_pmu_cpumask);
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
>>>>> +{
>>>>> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>>>>> +	unsigned int target = xe_pmu_target_cpu;
>>>>> +
>>>>> +	XE_BUG_ON(!pmu->base.event_init);
>>>>> +
>>>>> +	/*
>>>>> +	 * Unregistering an instance generates a CPU offline event which we must
>>>>> +	 * ignore to avoid incorrectly modifying the shared xe_pmu_cpumask.
>>>>> +	 */
>>>>> +	if (pmu->closed)
>>>>> +		return 0;
>>>>> +
>>>>> +	if (cpumask_test_and_clear_cpu(cpu, &xe_pmu_cpumask)) {
>>>>> +		target = cpumask_any_but(topology_sibling_cpumask(cpu), cpu);
>>>>> +
>>>>> +		/* Migrate events if there is a valid target */
>>>>> +		if (target < nr_cpu_ids) {
>>>>> +			cpumask_set_cpu(target, &xe_pmu_cpumask);
>>>>> +			xe_pmu_target_cpu = target;
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>> +	if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
>>>>> +		perf_pmu_migrate_context(&pmu->base, cpu, target);
>>>>> +		pmu->cpuhp.cpu = target;
>>>>> +	}
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static enum cpuhp_state cpuhp_slot = CPUHP_INVALID;
>>>>> +
>>>>> +int xe_pmu_init(void)
>>>>> +{
>>>>> +	int ret;
>>>>> +
>>>>> +	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
>>>>> +				      "perf/x86/intel/xe:online",
>>>>> +				      xe_pmu_cpu_online,
>>>>> +				      xe_pmu_cpu_offline);
>>>>> +	if (ret < 0)
>>>>> +		pr_notice("Failed to setup cpuhp state for xe PMU! (%d)\n",
>>>>> +			  ret);
>>>>> +	else
>>>>> +		cpuhp_slot = ret;
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +void xe_pmu_exit(void)
>>>>> +{
>>>>> +	if (cpuhp_slot != CPUHP_INVALID)
>>>>> +		cpuhp_remove_multi_state(cpuhp_slot);
>>>>> +}
>>>>> +
>>>>> +static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu)
>>>>> +{
>>>>> +	if (cpuhp_slot == CPUHP_INVALID)
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	return cpuhp_state_add_instance(cpuhp_slot, &pmu->cpuhp.node);
>>>>> +}
>>>>> +
>>>>> +static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
>>>>> +{
>>>>> +	cpuhp_state_remove_instance(cpuhp_slot, &pmu->cpuhp.node);
>>>>> +}
>>>>> +
>>>>> +static void xe_pmu_unregister(struct drm_device *device, void *arg)
>>>>> +{
>>>>> +	struct xe_pmu *pmu = arg;
>>>>> +
>>>>> +	if (!pmu->base.event_init)
>>>>> +		return;
>>>>> +
>>>>> +	/*
>>>>> +	 * "Disconnect" the PMU callbacks - since all are atomic synchronize_rcu
>>>>> +	 * ensures all currently executing ones will have exited before we
>>>>> +	 * proceed with unregistration.
>>>>> +	 */
>>>>> +	pmu->closed = true;
>>>>> +	synchronize_rcu();
>>>>> +
>>>>> +	xe_pmu_unregister_cpuhp_state(pmu);
>>>>> +
>>>>> +	perf_pmu_unregister(&pmu->base);
>>>>> +	pmu->base.event_init = NULL;
>>>>> +	kfree(pmu->base.attr_groups);
>>>>> +	kfree(pmu->name);
>>>>> +	free_event_attributes(pmu);
>>>>> +}
>>>>> +
>>>>> +static void init_samples(struct xe_pmu *pmu)
>>>>> +{
>>>>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>>>>> +	struct xe_gt *gt;
>>>>> +	unsigned int i;
>>>>> +
>>>>> +	for_each_gt(gt, xe, i)
>>>>> +		engine_group_busyness_store(gt);
>>>>> +}
>>>>> +
>>>>> +void xe_pmu_register(struct xe_pmu *pmu)
>>>>
>>>> Why void, why not int? PMU failure is non fatal error?
>>>
>>> Ya device is functional , it is only that these counters are not
>>> available. Hence didn't want to fail the driver load.
>>>>
>>>>> +{
>>>>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>>>>> +	const struct attribute_group *attr_groups[] = {
>>>>> +		&xe_pmu_format_attr_group,
>>>>> +		&pmu->events_attr_group,
>>>>> +		&xe_pmu_cpumask_attr_group,
>>>>
>>>> Can someone please explain what this cpumask/cpuhotplug stuff does and
>>>> whether it needs to be in this patch? There's something here:
>>>
>>> comments from original patch series in
>>> i915:https://patchwork.kernel.org/project/intel-gfx/patch/20170802123249.14194-5-tvrtko.ursulin@linux.intel.com/
>>>
>>> "IIRC an uncore PMU should expose a cpumask through sysfs, and then perf
>>> tools will read that mask and auto-magically limit the number of CPUs it
>>> instantiates the counter on."
>>>
>>> and ours are global counters not per cpu so we limit to just to single cpu.
>>>
>>> And as i understand we use the cpuhotplug support to migrate too new cpu
>>> incase the earlier one goes offline.
>>
>> OK, leave as is.
>>
>>>
>>>>
>>>> b46a33e271ed ("drm/i915/pmu: Expose a PMU interface for perf queries")
>>>>
>>>> I'd rather just have the basic PMU infra and the events in this patch and
>>>> punt this cpumask/cpuhotplug stuff to a later patch, unless someone can say
>>>> what it does.
>>>>
>>>> Though perf_pmu_register seems to be doing some per cpu stuff so likely
>>>> this is needed. But amdgpu_pmu only has event and format attributes.
>>>>
>>>> Mostly leave as is I guess.
>>>>
>>>>> +		NULL
>>>>> +	};
>>>>> +
>>>>> +	int ret = -ENOMEM;
>>>>> +
>>>>> +	spin_lock_init(&pmu->lock);
>>>>> +	pmu->cpuhp.cpu = -1;
>>>>> +	init_samples(pmu);
>>>>
>>>> Why init_samples here? Can't we init the particular sample in
>>>> xe_pmu_event_init or even xe_pmu_event_start?
>>>>
>>>> Init'ing here may be too soon since the event might not be enabled for a
>>>> long time. So really this needs to move to xe_pmu_event_init or
>>>> xe_pmu_event_start.
>>>
>>> The device is put to suspend immediately after driver probe, typically
>>> pmu is opened even before any workload is run so essentially device is
>>> still in suspend state hence we cannot access registers so storing the
>>> last known value in init_samples. otherwise we see the bug in v#1 of series.
>>>
>>>>
>>>> Actually this is already happening in xe_pmu_enable. We just need to decide
>>>> when we want to wake the device up and when we don't. So maybe wake the
>>>> device up at start (use xe_device_mem_access_get) and not wake up during
>>>> read (xe_device_mem_access_get_if_ongoing etc.)?
>>
>> Just going to repeat this again:
>>
>> xe_pmu_event_start calls xe_pmu_enable. In xe_pmu_enable use
>> xe_device_mem_access_get before calling __xe_pmu_event_read. This will wake
>> the device up and get a valid value in event->hw.prev_count.
>>
>> In xe_pmu_event_read, use xe_device_mem_access_get_if_ongoing, to read the
>> event without waking the device up (and return previous value etc.).
>>
>> Or, pass a flag in to __xe_pmu_event_read and to engine_group_busyness_read
>> and __engine_group_busyness_read. The flag will say whether or not to wake
>> up the device. If the flag says wake the device up, call
>> xe_device_mem_access_get and xe_force_wake_get, maybe in
>> __engine_group_busyness_read, before reading device registers. If the flag
>> says don't wake up the device call xe_device_mem_access_get_if_ongoing.
>>
>> This way we:
>> * don't need to call init_samples in xe_pmu_register
>> * we don't need engine_group_busyness_store
>> * we don't need to specifically call engine_group_busyness_store in xe_gt_suspend
>>
>> The correct sample is read by waking up the device in xe_pmu_event_start.
>>
>> Hopefully this is clear now.
> 
> Actually I think it is not necessary to do anything in xe_pmu_event_start,
> as long as we keep the engine_group_busyness_store in xe_gt_suspend (so we
> can just use xe_device_mem_access_get_if_ongoing, don't need
> xe_device_mem_access_get as you said).
> 
> Afais, the problem of huge values in v1 was due to reading the device
> registers when device was not awake. That problem we've already solved in
> v2 where in engine_group_busyness_read() we only read if the device is
> awake and skip and return the previous value when the device is not
> awake. So that fixes the problem of huge values.
> 
> The problem in this patch (I thought) is that we are effectively sampling
> the registers each time perf calls xe_pmu_event_read, say every 1 sec. So
> we are sampling the registers every 1 sec. When we sample (every 1 sec) if
> the device is awake we will return the correct ns value, if device is
> asleep we will return the old value. If the device wakes up and does some
> work in the 1 sec period but then again suspends will miss that
> activity. That is the problem that is being solved by storing the samples
> in xe_gt_suspend().
> 
> i915 solved this problem using a 5 ms timer but I like the solution of
> sampling in xe_gt_suspend better, so let's keep it.
> 
> But init_samples is not needed, afais we don't need to do anything in
> xe_pmu_register or in xe_pmu_event_start (and we don't need to use
> xe_device_mem_access_get). xe_gt_suspend will take care of storing the
> register values before the device suspends.
> 
> Hopefully it makes sense now, sorry for the confusion.

yes you are right we do not need init_samples.

Thanks,
Aravind.
> 
> Ashutosh
> 
>>
>>>
>>>>
>>>>> +
>>>>> +	pmu->name = kasprintf(GFP_KERNEL,
>>>>> +			      "xe_%s",
>>>>> +			      dev_name(xe->drm.dev));
>>>>> +	if (pmu->name)
>>>>> +		/* tools/perf reserves colons as special. */
>>>>> +		strreplace((char *)pmu->name, ':', '_');
>>>>> +
>>>>> +	if (!pmu->name)
>>>>> +		goto err;
>>>>> +
>>>>> +	pmu->events_attr_group.name = "events";
>>>>> +	pmu->events_attr_group.attrs = create_event_attributes(pmu);
>>>>> +	if (!pmu->events_attr_group.attrs)
>>>>> +		goto err_name;
>>>>> +
>>>>> +	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>>>>> +					GFP_KERNEL);
>>>>> +	if (!pmu->base.attr_groups)
>>>>> +		goto err_attr;
>>>>> +
>>>>> +	pmu->base.module	= THIS_MODULE;
>>>>> +	pmu->base.task_ctx_nr	= perf_invalid_context;
>>>>> +	pmu->base.event_init	= xe_pmu_event_init;
>>>>> +	pmu->base.add		= xe_pmu_event_add;
>>>>> +	pmu->base.del		= xe_pmu_event_del;
>>>>> +	pmu->base.start		= xe_pmu_event_start;
>>>>> +	pmu->base.stop		= xe_pmu_event_stop;
>>>>> +	pmu->base.read		= xe_pmu_event_read;
>>>>> +	pmu->base.event_idx	= xe_pmu_event_event_idx;
>>>>> +
>>>>> +	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
>>>>> +	if (ret)
>>>>> +		goto err_groups;
>>>>> +
>>>>> +	ret = xe_pmu_register_cpuhp_state(pmu);
>>>>> +	if (ret)
>>>>> +		goto err_unreg;
>>>>> +
>>>>> +	ret = drmm_add_action_or_reset(&xe->drm, xe_pmu_unregister, pmu);
>>>>> +	XE_WARN_ON(ret);
>>>>
>>>> We should just follow the regular error rewind here too and let
>>>> drm_notice() at the end print the error. This is what other drivers calling
>>>> drmm_add_action_or_reset seem to be doing.
>>>
>>> Ok ok.
>>>>
>>>>> +
>>>>> +	return;
>>>>> +
>>>>> +err_unreg:
>>>>> +	perf_pmu_unregister(&pmu->base);
>>>>> +err_groups:
>>>>> +	kfree(pmu->base.attr_groups);
>>>>> +err_attr:
>>>>> +	pmu->base.event_init = NULL;
>>>>> +	free_event_attributes(pmu);
>>>>> +err_name:
>>>>> +	kfree(pmu->name);
>>>>> +err:
>>>>> +	drm_notice(&xe->drm, "Failed to register PMU!\n");
>>>>> +}
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
>>>>> new file mode 100644
>>>>> index 000000000000..d3f47f4ab343
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/xe/xe_pmu.h
>>>>> @@ -0,0 +1,25 @@
>>>>> +/* SPDX-License-Identifier: MIT */
>>>>> +/*
>>>>> + * Copyright © 2023 Intel Corporation
>>>>> + */
>>>>> +
>>>>> +#ifndef _XE_PMU_H_
>>>>> +#define _XE_PMU_H_
>>>>> +
>>>>> +#include "xe_gt_types.h"
>>>>> +#include "xe_pmu_types.h"
>>>>> +
>>>>> +#ifdef CONFIG_PERF_EVENTS
>>>>
>>>> nit but maybe this should be:
>>>>
>>>> #if IS_ENABLED(CONFIG_PERF_EVENTS)
>>>>
>>>> or,
>>>>
>>>> #if IS_BUILTIN(CONFIG_PERF_EVENTS)
>>>>
>>>> Note CONFIG_PERF_EVENTS is a boolean kconfig option.
>>>>
>>>> See similar macro IS_REACHABLE() in i915_hwmon.h.
>>>>
>>>>> +int xe_pmu_init(void);
>>>>> +void xe_pmu_exit(void);
>>>>> +void xe_pmu_register(struct xe_pmu *pmu);
>>>>> +void engine_group_busyness_store(struct xe_gt *gt);
>>>>
>>>> Add xe_pmu_ prefix if function is needed (hopefully not).
>>>
>>> OK
>>>>
>>>>> +#else
>>>>> +static inline int xe_pmu_init(void) { return 0; }
>>>>> +static inline void xe_pmu_exit(void) {}
>>>>> +static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>>>>> +static inline void engine_group_busyness_store(struct xe_gt *gt) {}
>>>>> +#endif
>>>>> +
>>>>> +#endif
>>>>> +
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>>>>> new file mode 100644
>>>>> index 000000000000..e87edd4d6a87
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>>>>> @@ -0,0 +1,80 @@
>>>>> +/* SPDX-License-Identifier: MIT */
>>>>> +/*
>>>>> + * Copyright © 2023 Intel Corporation
>>>>> + */
>>>>> +
>>>>> +#ifndef _XE_PMU_TYPES_H_
>>>>> +#define _XE_PMU_TYPES_H_
>>>>> +
>>>>> +#include <linux/perf_event.h>
>>>>> +#include <linux/spinlock_types.h>
>>>>> +#include <uapi/drm/xe_drm.h>
>>>>> +
>>>>> +enum {
>>>>> +	__XE_SAMPLE_RENDER_GROUP_BUSY,
>>>>> +	__XE_SAMPLE_COPY_GROUP_BUSY,
>>>>> +	__XE_SAMPLE_MEDIA_GROUP_BUSY,
>>>>> +	__XE_SAMPLE_ANY_ENGINE_GROUP_BUSY,
>>>>> +	__XE_NUM_PMU_SAMPLERS
>>>>
>>>> OK: irq_count is missing here since these are read from device...
>>>>
>>>>> +};
>>>>> +
>>>>> +struct xe_pmu_sample {
>>>>> +	u64 cur;
>>>>> +};
>>>>
>>>> This was also discussed for i915 PMU, no point having a struct with a
>>>> single u64 member. Might as well just use u64 wherever we are using
>>>> struct xe_pmu_sample.
>>>
>>> OK.
>>>>
>>>>> +
>>>>> +#define XE_MAX_GT_PER_TILE 2
>>>>
>>>> Why per tile? The array size should be max_gt_per_device. Just call it
>>>> XE_MAX_GT?
>>>
>>> I declared similar to what we have in drivers/gpu/drm/xe/xe_device.h
>>
>> Our 2-d array size is for the device, not per tile. So let's use XE_MAX_GT.
>>
>>>>
>>>>> +
>>>>> +struct xe_pmu {
>>>>> +	/**
>>>>> +	 * @cpuhp: Struct used for CPU hotplug handling.
>>>>> +	 */
>>>>> +	struct {
>>>>> +		struct hlist_node node;
>>>>> +		unsigned int cpu;
>>>>> +	} cpuhp;
>>>>> +	/**
>>>>> +	 * @base: PMU base.
>>>>> +	 */
>>>>> +	struct pmu base;
>>>>> +	/**
>>>>> +	 * @closed: xe is unregistering.
>>>>> +	 */
>>>>> +	bool closed;
>>>>> +	/**
>>>>> +	 * @name: Name as registered with perf core.
>>>>> +	 */
>>>>> +	const char *name;
>>>>> +	/**
>>>>> +	 * @lock: Lock protecting enable mask and ref count handling.
>>>>> +	 */
>>>>> +	spinlock_t lock;
>>>>> +	/**
>>>>> +	 * @sample: Current and previous (raw) counters.
>>>>> +	 *
>>>>> +	 * These counters are updated when the device is awake.
>>>>> +	 *
>>>>> +	 */
>>>>> +	struct xe_pmu_sample sample[XE_MAX_GT_PER_TILE * __XE_NUM_PMU_SAMPLERS];
>>>>
>>>> Change to 2-d array. See above.
>>>>
>>>>> +	/**
>>>>> +	 * @irq_count: Number of interrupts
>>>>> +	 *
>>>>> +	 * Intentionally unsigned long to avoid atomics or heuristics on 32bit.
>>>>> +	 * 4e9 interrupts are a lot and postprocessing can really deal with an
>>>>> +	 * occasional wraparound easily. It's 32bit after all.
>>>>> +	 */
>>>>> +	unsigned long irq_count;
>>>>> +	/**
>>>>> +	 * @events_attr_group: Device events attribute group.
>>>>> +	 */
>>>>> +	struct attribute_group events_attr_group;
>>>>> +	/**
>>>>> +	 * @xe_attr: Memory block holding device attributes.
>>>>> +	 */
>>>>> +	void *xe_attr;
>>>>> +	/**
>>>>> +	 * @pmu_attr: Memory block holding device attributes.
>>>>> +	 */
>>>>> +	void *pmu_attr;
>>>>> +};
>>>>> +
>>>>> +#endif
>>>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>>> index 965cd9527ff1..ed097056f944 100644
>>>>> --- a/include/uapi/drm/xe_drm.h
>>>>> +++ b/include/uapi/drm/xe_drm.h
>>>>> @@ -990,6 +990,22 @@ struct drm_xe_vm_madvise {
>>>>> 	__u64 reserved[2];
>>>>>  };
>>>>>
>>>>> +/* PMU event config IDs */
>>>>> +
>>>>> +/*
>>>>> + * Top 4 bits of every counter are GT id.
>>>>> + */
>>>>> +#define __XE_PMU_GT_SHIFT (60)
>>>>
>>>> To future-proof this, and also because we seem to have plenty of bits
>>>> available, I think we should change this to 56 (instead of 60).
>>>
>>> OK
>>>
>>> Thanks,
>>> Aravind.
>>>>
>>>>> +
>>>>> +#define ___XE_PMU_OTHER(gt, x) \
>>>>> +	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>>>>> +
>>>>> +#define XE_PMU_INTERRUPTS(gt)			___XE_PMU_OTHER(gt, 0)
>>>>> +#define XE_PMU_RENDER_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 1)
>>>>> +#define XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
>>>>> +#define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
>>>>> +#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
>>>>> +
>>>>>  #if defined(__cplusplus)
>>>>>  }
>>>>>  #endif
>>>>> --
>>>>> 2.25.1
>>
>> Thanks.
>> --
>> Ashutosh
