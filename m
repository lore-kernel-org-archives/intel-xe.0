Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29106EB64DD
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jul 2023 05:11:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF28610E0AA;
	Mon,  3 Jul 2023 05:11:24 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14DB10E0A6
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jul 2023 05:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688361082; x=1719897082;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hHicyd3C57RgtAFfi56LSDy6k4Ju6xMiKt+6Zp5ZWRo=;
 b=BTWw189NiitpeN2JwJ9Y7wJSycQ3g4q/u0hhlwpzqLuXcCrwAxVX4j53
 /xLXH+ADxRFPcyjbT3+MkrJZ0r1g+UzrtdHJ2HK5oPvJ1fVhGPDSJzokg
 JIkpHCWqYwD5t5EMpOZ3aXjmxfHih/rd779XlC8PKk1Mr/6axrgOI3k3A
 X7WuB9ReRa70nFEvzuNJe15kwjvPWmRE7xXh2ewqyHnjK8W0CQDQbmVfk
 K8l0lb8w6dpWLfjsG0Er3RzjkSKPY8WZXhafghKZ67Z/kut1P/cLw0ne0
 iL3stMnQrl6EDq0t8+oN5BSY3CYu5qgY8WWcIo566xmcqmpSEXYhJSYQn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="352615756"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="352615756"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2023 22:11:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="1048929475"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="1048929475"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 02 Jul 2023 22:11:20 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 2 Jul 2023 22:11:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 2 Jul 2023 22:11:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 2 Jul 2023 22:11:18 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 2 Jul 2023 22:11:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k49mVr5fuMNbXTfcvXrDrDT6MpDj8LIjNly5LN34DFgVs41IGOk/1F9/lL15TqbLu4XFJ7VO5ehptvkq5/Ggz4tms8zsl3TRmfAMrD10UW7cKz16x4a7AlcOxWLfRyxmz/qLi/AvuNsT2Yzb+qbj2LGKfmlyugRcZqTkdfK2nog8fDhlnB3LgXgwPnL5m25pfyxSs4nH/+iCg/ARSkXlv24X/dq4HBjdgADPFB32mXrwevATuHE76+p3/Pf1zmcpsj44ri3aTH2YxhFJo8ae2Awqq9ja3pxpHEZgKQoTYatysL4nTUC9G/eqT0QFbANeWplnBDMp9hRqZqewkd5xuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9UbN82OBRaOs5dcAkel4FLXsr+asIyvcFZ2pV6TNL0=;
 b=dlEPmVIBTGM038IDwO4MIit+CGoldHg6OYjYrBXradsRiumP9Ta06+utBT/IDSwVE6VF1nlGAkIdY8PBBN1WsRD7z90rvMsJ5sYVh325l5zBCvhOefUChD5jBLVkjXBBwpV5yEO1y2S/sz1ybMcoVDpRXI2jfsbfHjzmTOv/tkkSLWfRoP4Jf93E4VNCclDycR42NqFeHGLx6JH8y7ZnOkGadvj07R5fRi1Hej0l9pNXqdjxjH3M5pxceZguj1jHX+rVcdHhOVOAj03oKknJwMr3sntQmPPurRJ9quXxxOZjmgSjyyYFtPc8z046+60lM1SwdBMlqyZoiVhP28+RsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by SJ0PR11MB5678.namprd11.prod.outlook.com (2603:10b6:a03:3b8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 05:11:16 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff%4]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 05:11:16 +0000
Message-ID: <7bdabd8f-538e-428e-5ba5-c5fd7059e1e1@intel.com>
Date: Mon, 3 Jul 2023 10:41:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230627122113.1472532-1-aravind.iddamsetty@intel.com>
 <20230627122113.1472532-3-aravind.iddamsetty@intel.com>
 <SJ1PR11MB6204869780C4653DAAAAFAB2812AA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <SJ1PR11MB6204869780C4653DAAAAFAB2812AA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::13) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|SJ0PR11MB5678:EE_
X-MS-Office365-Filtering-Correlation-Id: fc3f902b-6661-4e51-edd6-08db7b83ed55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NowOrSa1+vQDlN/pt38x9yTpfdHZIRoHtGCRWBIFZCCheT4CZ7PhZnS81gnWS0fgJrt3q8xl9IflxWU8uhDokch8Ev1vEGFXoxUmcc0Hk4s+4y7fRWZtkMAK/UxtsMNLpwwfNzzWiPNnHkRnvoiEb1bGyV0GYxITDgqJdjgftw7W4QXq4Se6RR2ExDsT1a3jmbNKwSqPh2Z2kN7FIcUxqRPga5g2kbzUBfXmMpCgjIYaDpQF4NIWU4aTG194XqYsItrFsTUFDyPAJZYJVAk6/FZha2qYx2RFPYTkR6NI7LN3Nb0gcXH2bAWc/ctBmek6ITQ1CqncCdIHOF/BhkH24jVPzMiVpDJI+vSP4FjgDKx0m7ZLrlaKgPwy9Ca8aek8sR4EZdhVwrj+mnTxOmTvjX+6TWuWp6buujxQDTjAZ/Dmwfo8euShPX1oQwKUk5JUdXNB9TAapYX0gMgwUOD+siQ7K6yi9eS1qMkcQ1mAQ+kX45w89dkWRAZfzn4A9WXTEUIBLbhQSjXKcR1Qrawe3gdAqPAcJeRo1Lhz0s01SSNDWwVxLoA3Muz1Lc985toBliEifqfY6SdAsZs5VH9VmtO5VTpkxHlZ/c2i8Aq9gihzJGYBvCCPghyXahaDo7I2gt71DuZxxW0LjN0zkejkgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199021)(82960400001)(6506007)(53546011)(6512007)(316002)(66556008)(66476007)(66946007)(4326008)(38100700002)(107886003)(2616005)(83380400001)(66899021)(186003)(26005)(478600001)(110136005)(54906003)(8936002)(8676002)(31686004)(30864003)(5660300002)(2906002)(6486002)(31696002)(86362001)(41300700001)(6666004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmxraENkUG4xKzNlNmF4dEU1Y2piazh1ckk2RlBNbk40RitEd09EazI5ZVFX?=
 =?utf-8?B?b3UrUjh2V0ZWc1RET3RzdGZISzlHN0pwdXBVdytoZXh4Yy8rblk2SE5HSU8w?=
 =?utf-8?B?d1BjaUU4dExkMUcvNjZVRG5XWGE3aDc4aEhkbml5S21XMElva3JoMDdYVUxZ?=
 =?utf-8?B?SldVaWM4N2lRWWt3MXUzTWRSZlk0QWtPd3lEN0swR2hJeUhmYUtJZzZNZHc5?=
 =?utf-8?B?cGZpWmNtWUpYQkovazdZb1VoNFFZenYrUFNvN1hzTi80Y2Qzdm1RWVU0eGcw?=
 =?utf-8?B?dENvNnZvRURhY201amVBRmFBZ216dEJ3V1B3OEZvWkdPTTVLWDNXNG5pQmp1?=
 =?utf-8?B?cEl6N3g3bzRkMXRINmFWbHlTRmg0YjBUWm12b0xTbXR4dTlTeGE4OG5nYWRa?=
 =?utf-8?B?VUpkOHNmSWlrSFBzSmxrdDl3V1F6UnpWWHl5a3V0VlppLzFnOGRTUW5seEw2?=
 =?utf-8?B?eTI0Z2UrMC96WWE3NWV4NHQ1V2paMlpkeTdzeFRHNXY4OFFBcGlLbzB0RWtq?=
 =?utf-8?B?OWhtemE0OXEydFlZb2I3Lzd4c3ZhYlFKa21wOFJiOGtnUUlkcmdWNHlvdnZH?=
 =?utf-8?B?LzZRdkVrZW1nM2ErSlg3T1Jxd0loelA5Z2tLdW8ydDdSUVd1Z0pkRDBoeXMr?=
 =?utf-8?B?Yys4aWNBa1Y2ajV0bnpGbS9MamdLQmRtM0lVVUx5dkZ3MHA4dGhwaTBVQm9P?=
 =?utf-8?B?NUxIUkl0YktlWlcrdytaelJBTjRiNG8vd1o2aDQwZWxCcHVqcTI5cnhVV2VT?=
 =?utf-8?B?TXVWR2J5VndnaVExZ2NqbEZUSFUxYmtWRHZvREd5OHFBNm45MGpIZWJjUlEv?=
 =?utf-8?B?ZklwRWFOVUdDQytYbnk1eFREUDRGV0FBMmJ6bUFsdktkSFk3MlR6NVJFOFJz?=
 =?utf-8?B?MkpET0JyR0VJbTJuYjllM3YrdTg3SWFQVDhlYVNyVWZ1b3FFVjNxVlg2UVpK?=
 =?utf-8?B?eFkrSi9nYWlGRTU5TGY0Slh3NVpIMDdHTG9rUVdZOFNpb0hYVll1bjdkT3Jz?=
 =?utf-8?B?djZzV1NSUTZoQmtpcFRIUVg3WU9pVzYvM0M5VVBFSE5kaEpvMllXcGw2ZDFV?=
 =?utf-8?B?bno2dVpuaGVlUFFnNUZubm9pNXR0Z2xSWFNwRHNwRVNFSDIxWFJTZlhkTm5i?=
 =?utf-8?B?TjI0VmN1c0J2KzI3WnlXRVZpWGc5RUhOcHF2eVdUSGR1RGFvb3g3NDBMaUto?=
 =?utf-8?B?NkFVMlA1di9FT3lDbC9mY2pNNXYzY1hpUWZpa2R3YnhWT3RWSlkyYmV3THp0?=
 =?utf-8?B?MlpuVDgvemlMQW1jKzdBT1JKUDh4Qm9ybDFrNlpFeStZMzdjUVBTY0dKaE15?=
 =?utf-8?B?Y0pJQlg0bTBJOFR2TWU5ZktJY3lzSXhUUDNYWWpoMTlYQnRuY3NJQW5HM3dT?=
 =?utf-8?B?VXpQWXhSdkczem5HTVcvQlBsM1VZV1FBdUZwTGRpT1ZGMDhrYktQQUxHVSs3?=
 =?utf-8?B?WHAzdXA3QS90TFpqZ016Z3BlMUJCejFseHgvdEFoT2J6b2RidGExZi9acERw?=
 =?utf-8?B?amVLZG5xYU5lbzNpMGxvcnU0ZEM2VzNONEJ4VDAzTGQ4OWdGY3pvTG0rdk9B?=
 =?utf-8?B?WnZVRmxuY2lOMDh0SmMzMExTczFvWEF5Z0Fld2xnVkg3VnpqK1g2dDZkNVUr?=
 =?utf-8?B?dzk3bnkwZCtVTWJNelFFeTJMdG83b1h3TVVEQkxnMkhGQTFBaCtScm1EZWFj?=
 =?utf-8?B?RlZqaGJGMVd2WmlYT2M3cHBYOFZpaXNtQ1ZhVldDdWNwcWo1YWEzY2txWmRO?=
 =?utf-8?B?N2paMzYyZEJXakJRcFRycE0ycVEzUGpvSGRSc3JRS2hUckJSSG40K0VDeTRu?=
 =?utf-8?B?UHN3SUd1V1pRWmNwSDZlZlJrRnRLRi9vWFJXMkNDNk1uWXg3bXpzZUQvYi9s?=
 =?utf-8?B?ZjFLWUlMeVc5cHdOOUJaZjBONjFNMGFBT202b1Uzdi8xOHUxdVplVWdvbTVE?=
 =?utf-8?B?cS9LWm10US9DK0lzOEw3cmlQWTIvcEI2RktuMTdhdlQxZ0d5MCtLSEVIZjFJ?=
 =?utf-8?B?NmgyYXlIeW5DS1ZocWRNazFJeE5iNkhMU0drMHk2RHMzYmNBcmNRcDl3M015?=
 =?utf-8?B?bHd1aXdHZjBpWEZ4K24xUDhVclpONnFHZDg3VEdFNWtQYUtNUThWYUdlVWNC?=
 =?utf-8?B?T3g0Q1JmRHkxc2UvZExtVGovbjYxQnZrenhYdXhOd3FHbUd3NVF5OFlEVzZj?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc3f902b-6661-4e51-edd6-08db7b83ed55
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 05:11:15.9336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKJ9gkbMK2rpnGPIizbvrXjCmMBfp1kCkQ07N591KIMgSaAlWwC7ynA152G2yaYEIF76GQmj3+vdGHbpQlhM3a/tD7sy0T2Y/3s9JGOkTyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5678
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



On 30-06-2023 19:23, Upadhyay, Tejas wrote:
> Review in progress, as it is large patch , its taking time. Some initial comments as follows:
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
> 
> Should not you pass gt_id here?, like XE_PMU_RENDER_GROUP_BUSY(gt_id), I know it will not make difference right now as we have max 0 or 1 id of GT, but in future this might be still compatible if we pass gt_id.

__engine_group_busyness_read is already having a gt reference hence no
need to pass again in config.

> 
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
> 
> No newline needed here I think.
> 
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
> 
> We can skip checking pmu->name again here.
skipping the below will not catch the error. i can combine them to an if
else.

Thanks,
Aravind.
> 
> Thanks,
> Tejas
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
