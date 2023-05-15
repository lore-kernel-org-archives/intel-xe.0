Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D46C77B75
	for <intel-xe@archiver.kernel.org>; Mon, 15 May 2023 16:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B56889130;
	Mon, 15 May 2023 16:18:59 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF4389130
 for <intel-xe@lists.freedesktop.org>; Mon, 15 May 2023 16:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684167538; x=1715703538;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NEi4xwkVLT04gOsPhHE+Kg9C/mtfwrOMk1EQ13AwfpE=;
 b=HP4ylzxXbazaQrkpGdBOHJcyhQe7B1MNUBD4LUQJbcFW7h67iGZn/skP
 Y3CfTztrtR8FnVUekqJ8DN6SAHBoJwSpyLfwV+6H1CxBbG995q473SMy1
 BRT343S2r8doRvOGP9U8MjDsHlLK6q5G4NzGESneCet6Nj3tZZvmaMfG7
 /nxGdZ0/X0Oj9kAWiUfOyy/9OblwzT1s7IYtQsnjeOf2SzVRop+02WCXL
 chz0hAlmfMoi/dlSPyXvo2lj+odRG5Vbmo1m3dB+08geK8Ajecptk3Acp
 03GMxQnitCiS5JrID2vB2GT1mTKUY1ty8pC9+Hm5ASS/Yuo9tsD4pqcer w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="340597949"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; d="scan'208";a="340597949"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 09:17:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="651470406"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; d="scan'208";a="651470406"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 15 May 2023 09:16:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 15 May 2023 09:16:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 15 May 2023 09:16:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 15 May 2023 09:16:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 15 May 2023 09:16:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdJ34um8I+sy8Bag7w3Z491SoWNWgsYhYMilz0L3aIxNwPzSF44/ydZVZJ6ZrzhlFihSe/8LkOASu1L0X5WDQisJd68t5M9BQcDOHLQO1nWB+A86EPL9O1aOWUCwJKhVUMEdTQKmKs/eop8VHNLQaepUfL52deOGhVoZOl8hLVGacOkZ+9qAN+Idysp+n/nPxdVGVAc4t6GDtYRPZF8qObv/uJiHmr5rFR345cmaf87zKDcJH8eaINRiRHuQj7KWJ3onTQqLph5E2RYEsNrLKFd11oN+P8FlnV9gNAOmWLt38Ay+rpgWM9wCdAs41jOR1je9YIDSDEVFdgNLy6Uclg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOQJqkV3OxgiKoV20Ig1bFlRJmo4rBU3DV0ree+uiaw=;
 b=OIWq/ue7ql7rWw1Qo9D6vm5CBLH7OoyqY0P6duzDJxE/dIwopZiOrNCGSwMDlNbebiZwucTe5PW+UzD0oVvEKJmEpseoq7dWtT15Yd0jr5xT55iTcnReB8nYgFzR/FKwBUA8KpnDOXry196S1C+oIg/qzYeBlaLFwTmFfkWNammiseMy6AAdwxN1ksV4c72GeUUOkx5im0ulkO/PuHWM/QjCoOzAAaQqajBRjbbV8lVebFYOsexBbwN1Q95EUSJ1Q4a9Nh3jA/9em+v/Eqi2OJw36gnX4GICQyMEvTPXv4GS/tdwmTrFYmPDYqZy89l7nmc9TlHaRwrbgkaClOPZLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MN6PR11MB8102.namprd11.prod.outlook.com (2603:10b6:208:46d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.29; Mon, 15 May
 2023 16:16:56 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::2e91:4229:bc5c:cb31]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::2e91:4229:bc5c:cb31%6]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 16:16:56 +0000
Message-ID: <a5b88190-7bc1-70c0-b729-dd9cf3292c08@intel.com>
Date: Mon, 15 May 2023 21:46:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Harrison, 
 John C" <john.c.harrison@intel.com>
References: <20230509082558.614913-1-himal.prasad.ghimiray@intel.com>
 <def394d8-f723-d036-d5c1-a249ede937d4@intel.com>
 <MW4PR11MB70569ED202909F1F60C3F578B3749@MW4PR11MB7056.namprd11.prod.outlook.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <MW4PR11MB70569ED202909F1F60C3F578B3749@MW4PR11MB7056.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::10) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MN6PR11MB8102:EE_
X-MS-Office365-Filtering-Correlation-Id: 893f9ad5-dd56-499e-1038-08db555fcd97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A23xqbrwZB42rHlDWl3vmHsVe/jUh3kRtA/vd8FJ4i+OKEBhivyJeO84K/H4pB/f90uf0v4EHOY59GsTCkqugeg4eQfCi6D5HWyAd6gBfxELtZNpYNA1IEthe2sx4vrypz0/x3YwpNUgGXT/WoS32+94lgo9dkQOFMtyrZiBXaYpyMKRjJyB/Eipp75/pfpO6eD3bNPSyL+Bq5PxHbLo/83AcSljP26RHrrc3GdVN/wUP14RYw4ArZ2mCKTmuZ9F1jDE8JdSiqFaVd8DpZ1d457Lel72MOnhbAsH1ADj2aeRhmP0EqDXdFtAkI1/YYi8UupzTOjH47GKo0IutBNqjfxI8GfMayN7PS+165L3XdGdLb7LyPwfJea2X7DO/KF0SOnLuZhleh4BV1ICx3m/iQ0cZRK0HuqH+TajGOQTiXSJ6IW1hKYM1+n2smcKKHyHto/ahVKGFamnvJ9w5Mk0PG4Tvxz/A6lxltuCUItexuQmm02tJ8yBOA2z0j2f9nKHeqtufmAO+TrkWACYSaxOq3YuusEkeeDBQ6r7g7R14u7eh+/Sa3E+7JWaa5v97pSQvAHYxBCEWNEokc14qmG72uxb9bkAWkvwOWU3/2CBXd6x11PKXHuo3gPOkplxulxwP/7Ix+xTt0zt3uwQt6jMkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(136003)(346002)(39860400002)(376002)(451199021)(83380400001)(107886003)(2616005)(66556008)(66946007)(26005)(66476007)(6512007)(6506007)(6486002)(53546011)(478600001)(186003)(110136005)(5660300002)(6666004)(86362001)(54906003)(8676002)(8936002)(31696002)(2906002)(36756003)(82960400001)(6636002)(4326008)(41300700001)(316002)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VCtWdytERVlKRlNaa3FFNUJPa2NIcHg0N00rVmZobGtqOTR6d0xkR0lxVUV2?=
 =?utf-8?B?aXBYSUZJajFqVkxmdU05eVZ5eW5MTUJad2plaDQwaTZlMnFqSjdwMDRjcEJq?=
 =?utf-8?B?ZlFtc0xhc2cxK09DWnVHV0toVC91U0pZNnBDdFBaUktoMXB2THZwUFFWUExn?=
 =?utf-8?B?UWRpbDF4LzZseXRqeHdtZmxRNytXMURNeSszMUpMSGlWNWlTcnBaTzlQclBG?=
 =?utf-8?B?QUZqTFp3TjQrL3FYN1F4NmFPWGt1UlhLdS9CUDF5OG1iM0I3TUdjVHJsMVFU?=
 =?utf-8?B?M0M0TWJrWjFsSEVWU1J1K3NvZkdQUmNReEF6ajVHRThPV09uQ2htclMyWlBO?=
 =?utf-8?B?aDZFL0lNd0NkQVVwR2V5eDRZRkNQUzNOdk9lVXpPTEc1d1hTUEIyRlRlb01s?=
 =?utf-8?B?QWxGdUpORlNUVjl6Sk9SK24yanNaUDlvNmZKM2RCQ3dhTnh5eHl6eWg1RnZi?=
 =?utf-8?B?V0xaUjZWbXVxbU51RkJvdnhheFFadFZXTXFqZDhMWkc3T2YrZkVBTU1DaFQw?=
 =?utf-8?B?TVZtQStOOWl1cjlvVVMrSUM3ZU9qb3JhT3BvVDFZb2xSYkpFSGxCdzVma0dP?=
 =?utf-8?B?eUI0RHVQR1MxQkhrbmwwZjc0WGFLWExwREhyUlQxT2FEV3ZUV2JVS1R5bi8z?=
 =?utf-8?B?K2dTbzIwOW5wdTdTRW85ai9RS1A0c0pnbUFpeEdsSGJ5dVl0dUwxZGhkc2or?=
 =?utf-8?B?Yklmdmp5RVQyZi9GVlE4WVdOSjZyNGp0TEFQeFlra3RBYUk4dVMyYmpLWUJS?=
 =?utf-8?B?alhMTEo2blJhRlVyQks3TnBkWTA4Z0w4N1BCWTIwTmJnK0xaeWQvYUp1WWFo?=
 =?utf-8?B?WENCdHduWGExeDc2QmJQczJEWUtJeW0yeEhTdlVjdXIxYlg1T21la1YrUjda?=
 =?utf-8?B?YmxFRFNvUHZWK1pWN3FTcVhGMjg4NXZuWHlEZ21Cb2gwaC8vbFlPcEI5L2ZV?=
 =?utf-8?B?RU5XRSs2Q1EyQmRnelpVNE1tV3hIMGFTalNOOVJBemxWU1lVM3VmVXNPbVRl?=
 =?utf-8?B?bFBVdzIveDRnaWhGM2VUZzZWQkEyc1FtUU9nODFodmppd0RlbTdkVG5vc21R?=
 =?utf-8?B?U1FSNFFEM2V5WFIrMUtWUCtYMEpOYlFqdjFjUTU0dVZISWc5RjM1dk1KMmtU?=
 =?utf-8?B?RWRLemFaZzgrV1dPOXJwOHpYdjZwREs1OGRhWTJpcVlLTS9rTHNsbXpFajll?=
 =?utf-8?B?OVNLNlhHNi9Kb3V0akZPRkdLcVVjMFp2SENzMkgxd2dCMWdyTjIvK1hpbk80?=
 =?utf-8?B?QlVTMFdDL0R1YW1KTHpFTzdUTUJWdStnWHV6YzZFYnBFeGtXQkxrNXhrcmh3?=
 =?utf-8?B?NEladUhmQUxQSGlKQmN3NVl1T2lHL3pRSG9sYkh3VkhXOWhjazE0ZW9HUEk2?=
 =?utf-8?B?NWdDZVNMYjdNNktUL3hJTnBwTlJpOGIvMkFZREZwWWJOemdzMloxb0szNGMy?=
 =?utf-8?B?eG5JRllndlRkMWNjbk9Sdm9BK0hhemhiSUhtM3Y1eER0TCtZWndSRnd2d1dT?=
 =?utf-8?B?SS9pSlV2c20ySnFGcW5MUG9TekM3ZkNpSzRKb3FzbHZTQm50aVlseDlwYVZj?=
 =?utf-8?B?MGFDWG5TdXlFWHZiaU0rL25GZ0UwNXdFSHZwbXEwRU5abisvTW9LZG4xdFY5?=
 =?utf-8?B?a1h6UUNwNnlycG0wbUFoR0wrODRtSEI3UWNvZEprSWh6TE9IVXlyNVZtSGJY?=
 =?utf-8?B?ZFBQenNPY29RaTgrYWRPb3ZpWlY4YlQ0aWl2RXhIamRNdlBaMllGc0lXSkNi?=
 =?utf-8?B?UDJBcDI0NU0rSHZJNFNqa1hlSldib0VqTTlzZElybEE1NkZkUWZXTDlCaVhx?=
 =?utf-8?B?OHB5eDJoYlNNWVBWZW5Ca21CV3RBNXhyRnI1NG95MEw0cUZpRjdUNis0UWxk?=
 =?utf-8?B?TXhidzMrdFJYSjg0cW9zUTZYUzhVa3RvbmdJOHFaWk5pSFZZL1pnVld6akF4?=
 =?utf-8?B?MWxQd3p4NVJJdXhDZExBT3RLNm1RM2ZJMnN0MjlZZ3dERUJ6V0JjL2VkdGFm?=
 =?utf-8?B?MzNodGt1bnliTlVZcjhmZndTMnl5OURTUWVEZ082OE9heDE1YWRhRkh4c0pI?=
 =?utf-8?B?QVdGUm1uTWhTR1c0R3hNLzJWZi9pcldQMlpObXVCSUR6MVZqR1RpdFRBUDZQ?=
 =?utf-8?B?TXRueldtejBJcUxzejBsMCs3ZFJ6TkQ5SlNIRzA5QzNGbk9SZVpSdVQwZ3VP?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 893f9ad5-dd56-499e-1038-08db555fcd97
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 16:16:56.6138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4xPBsKWBGDrDE5ixns0FdWivPmQJN1HfxF2D9BXU7ETJpE0sRfiUKUWR0MDODuCxk7i12zfiO65YKhrhELWLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8102
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Notify Userspace when
 engine/gt reset fails.
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
Cc: "Argenziano, Antonio" <antonio.argenziano@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 11-05-2023 17:13, Ghimiray, Himal Prasad wrote:
> 
> 
>> -----Original Message-----
>> From: Nilawar, Badal <badal.nilawar@intel.com>
>> Sent: 11 May 2023 10:07
>> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
>> Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Notify Userspace when
>> engine/gt reset fails.
>>
>> Hi Himal,
>>
>> On 09-05-2023 13:55, Himal Prasad Ghimiray wrote:
>>> Send uevent in case of engine reset or gt reset failure.
>>> This intimation can be used by userspace monitoring tool to do the
>>> device level reset/reboot when GT reset fails. udevadm can be used to
>>> monitor the uevents.
>>>
>>> v2:
>>> -Add NULL check for xe_gt_hw_engine return(Aravind) -Arrange variables
>>> in Christmas tree order(Tejas) -Check GUC_GSC_OTHER_CLASS(Tejas)
>>>
>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_gt.c         | 18 ++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_guc.h        | 19 +++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_guc_submit.c | 23 +++++++++++++++++++++++
>>>    include/uapi/drm/xe_drm.h          |  8 ++++++++
>>>    4 files changed, 68 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>> index 3afca3dd9657..2c3ffa1db74e 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>> @@ -8,6 +8,7 @@
>>>    #include <linux/minmax.h>
>>>
>>>    #include <drm/drm_managed.h>
>>> +#include <drm/xe_drm.h>
>>>
>>>    #include "regs/xe_gt_regs.h"
>>>    #include "xe_bb.h"
>>> @@ -590,6 +591,20 @@ static int do_gt_restart(struct xe_gt *gt)
>>>    	return 0;
>>>    }
>>>
>>> +static void xe_uevent_gt_reset_failure(struct xe_device *xe, u8 id) {
>>> +	char *reset_event[5];
>>> +
>>> +	reset_event[0] = XE_RESET_FAILED_UEVENT "=1";
>>> +	reset_event[1] = "RESET_ENABLED=1";
>>> +	reset_event[2] = "RESET_UNIT=gt";
>>> +	reset_event[3] = kasprintf(GFP_KERNEL, "RESET_ID=%d", id);
>>> +	reset_event[4] = NULL;
>>> +	kobject_uevent_env(&xe->drm.primary->kdev->kobj, KOBJ_CHANGE,
>>> +reset_event);
>>> +
>>> +	kfree(reset_event[3]);
>>> +}
>>> +
>>>    static int gt_reset(struct xe_gt *gt)
>>>    {
>>>    	struct xe_device *xe = gt_to_xe(gt); @@ -639,6 +654,9 @@ static int
>>> gt_reset(struct xe_gt *gt)
>>>    	xe_device_mem_access_put(gt_to_xe(gt));
>>>    	drm_err(&xe->drm, "GT reset failed, err=%d\n", err);
>>>
>>> +	/* Notify userspace about gt reset failure */
>>> +	xe_uevent_gt_reset_failure(xe, gt->info.id);
>>> +
>>>    	return err;
>>>    }
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>>> index 74a74051f354..a3637eeaaa37 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>>> @@ -56,4 +56,23 @@ static inline u16 xe_engine_class_to_guc_class(enum
>> xe_engine_class class)
>>>    	}
>>>    }
>>>
>>> +static inline u16 xe_guc_class_to_engine_class(u8 guc_class) {
>>> +	switch (guc_class) {
>>> +	case GUC_RENDER_CLASS:
>>> +		return XE_ENGINE_CLASS_RENDER;
>>> +	case GUC_VIDEO_CLASS:
>>> +		return XE_ENGINE_CLASS_VIDEO_DECODE;
>>> +	case GUC_VIDEOENHANCE_CLASS:
>>> +		return XE_ENGINE_CLASS_VIDEO_ENHANCE;
>>> +	case GUC_BLITTER_CLASS:
>>> +		return XE_ENGINE_CLASS_COPY;
>>> +	case GUC_COMPUTE_CLASS:
>>> +		return XE_ENGINE_CLASS_COMPUTE;
>>> +	case GUC_GSC_OTHER_CLASS:
>>> +	default:
>>> +		XE_WARN_ON(guc_class);
>>> +		return -1;
>>> +	}
>>> +}
>>>    #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> index e857013070b9..d068af0ca7df 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -12,6 +12,7 @@
>>>    #include <linux/dma-fence-array.h>
>>>
>>>    #include <drm/drm_managed.h>
>>> +#include <drm/xe_drm.h>
>>>
>>>    #include "regs/xe_lrc_layout.h"
>>>    #include "xe_device.h"
>>> @@ -1589,10 +1590,26 @@ int
>> xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>>>    	return 0;
>>>    }
>>>
>>> +static void xe_uevent_engine_reset_failure(struct xe_device *xe,
>>> +const char *name) {
>>> +	char *reset_event[5];
>>> +
>>> +	reset_event[0] = XE_RESET_FAILED_UEVENT "=1";
>>> +	reset_event[1] = "RESET_ENABLED=1";
>>> +	reset_event[2] = "RESET_UNIT=engine";
>>> +	reset_event[3] = kasprintf(GFP_KERNEL, "RESET_ID=%s", name);
>>> +	reset_event[4] = NULL;
>>> +	kobject_uevent_env(&xe->drm.primary->kdev->kobj, KOBJ_CHANGE,
>>> +reset_event);
>>> +
>>> +	kfree(reset_event[3]);
>>> +}
>>> +
>>>    int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg,
>> u32 len)
>>>    {
>>>    	struct xe_device *xe = guc_to_xe(guc);
>>> +	struct xe_hw_engine *hwe;
>>>    	u8 guc_class, instance;
>>> +	u16 engine_class;
>>>    	u32 reason;
>>>
>>>    	if (unlikely(len != 3)) {
>>> @@ -1608,6 +1625,12 @@ int xe_guc_engine_reset_failure_handler(struct
>> xe_guc *guc, u32 *msg, u32 len)
>>>    	drm_err(&xe->drm, "GuC engine reset request failed on %d:%d
>> because 0x%08X",
>>>    		guc_class, instance, reason);
>>>
>>> +	/* Notify userspace about engine reset failure */
>>> +	engine_class = xe_guc_class_to_engine_class(guc_class);
>>> +	hwe = xe_gt_hw_engine(guc_to_gt(guc), engine_class, instance,
>>> +false);The The instance here is considered as physical instance of
>>> +hwe but while
>> submitting contexts kmd passes logical instance to guc. With that I assume
>> guc might be passing logical instance or for this notification it is passing
>> physical instance?
> AFAIK for reset failure notification the instance passed by guc in g2h payload is physical instance .
> @Harrison, John C Can you please confirm ?

Spoke to @Antonio, he confirmed that to notify engine reset failure guc 
is reporting physical instance to host.

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal
> 
>>
>> Regards,
>> Badal
>>> +	if (hwe)
>>> +		xe_uevent_engine_reset_failure(xe, hwe->name);
>>> +
>>>    	xe_gt_reset_async(guc_to_gt(guc));
>>>
>>>    	return 0;
>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>> index b0b80aae3ee8..79ef5947c172 100644
>>> --- a/include/uapi/drm/xe_drm.h
>>> +++ b/include/uapi/drm/xe_drm.h
>>> @@ -36,6 +36,14 @@ extern "C" {
>>>     * subject to backwards-compatibility constraints.
>>>     */
>>>
>>> +/*
>>> + * Uevents generated by xe on it's device node.
>>> + *
>>> + * XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset
>> engine
>>> + *	or gt fails. The value supplied with the event is always 1.
>>> + */
>>> +#define XE_RESET_FAILED_UEVENT "RESET_FAILED"
>>> +
>>>    /**
>>>     * struct xe_user_extension - Base class for defining a chain of extensions
>>>     *
