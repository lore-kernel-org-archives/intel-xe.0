Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE75C001B0
	for <intel-xe@archiver.kernel.org>; Thu, 10 Aug 2023 08:17:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED80810E4F3;
	Thu, 10 Aug 2023 08:17:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B15210E4F3
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Aug 2023 08:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691655425; x=1723191425;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dOQzhwduy5aa6CPxmESHXYt55QuSsah7SeL60aBeouo=;
 b=Aol4e/SLFdq6Ta3khCstSdAAqAcR/S3gyZf+g8dqFLAFetBJM1DWNTeZ
 4fAk6QP4lk0EZnGN60T0i6U5ZkB7lU5LsdliLwHOK4gb3ZHIknYmNSsby
 uOdh+aAK12uzgyjcxj53OgRscMmR9y0xtaWUQUkJ0ZwlowqJ6D37aXogG
 b8urV0Ka3nDjkOQb8lYbw07ykRMrPymjgLuIO1+dKbD7abjr7b4szbLXZ
 eAH3bBWFqOwaI4ifNmsbqgBvZpuhT1Py7aodLYh9Jp0iLOGfRHh0pU4gl
 2Xfv4H591ErtTDU/467+lzGe3Uxe17BDa8JnyPZV9E17Vp5IL/wi9NhO1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="350917894"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="350917894"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 01:10:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="761715973"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="761715973"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 10 Aug 2023 01:10:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 01:10:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 01:10:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 10 Aug 2023 01:10:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 10 Aug 2023 01:10:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbjh9YSomfTPy2dCAY2V/RI9Be3TujmlcBhWd/XyMikaO5uvu3fynFGlszilaRVR2W8oMhl2VCvd2Ryoq1OoUPKEeE2A7wdeKQ+BkHgztP+2mm1L9XoKkW4CrBOUTAgL6ovK69FTh+VD+N/fxxR7Cg7AP4a1zKR5syo8c0fhClxZBM2Y+dM2vNpxUQp+McLmqT4q9q028QL5oEOk/dXmSYurwYsEsU4h2G3rcdxtzpbSpjB+jXmL7NFI654POX8R+y07d3eKf6pS5LEFmqhLOsFLuH2xRB/eVLHiXFMEytvcuQegHcaGi8M/2x/6Lldu2gNJWfI6n7FEAlXYF1OQ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iivkRvyjn9A87isVlSkjvcavoYvym5R4TpgpSJ6tuzk=;
 b=GY3pPUM6unBtpxmQP8m/OMMYdW68J+J6Hizh1fBWbxAg7wfHKQFIKOXfXHv/sOlppP7qAgvLLm2SWTAOl55/Hnm8irbg+HQF6hNL0tSpbuHvaNEJ0Iz9pcOPEKuBpp7DNAII5RQYwyvQv2VFT2oXD9OMJLULkQhng1EysRLwCluTw1hXgVOAsSFTsRxwZ8LXUmPGBjfEmPqcwLe2AUMcYRp4DvFXgOaHXoCWrYlQqnVy0IjPr4sW9li1102GfCc6G/Wfn8oG7hkSychn9BePDqoxEgFm1cgQ/Y8rfhFKPu2GzqlefZ1Qxk9aqpG9SkIh+gaR2pLsQGbLCUNm5Neflw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 08:10:28 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153%7]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 08:10:28 +0000
Message-ID: <badff12b-ac9f-b0ea-9ed2-147b426dfaad@intel.com>
Date: Thu, 10 Aug 2023 13:40:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230808115436.400611-1-aravind.iddamsetty@intel.com>
 <20230808115436.400611-3-aravind.iddamsetty@intel.com>
 <877cq4y8s3.wl-ashutosh.dixit@intel.com>
 <95750d7f-df24-a9c5-ab39-86db69767bac@intel.com>
 <b9496a4b-bea2-fa15-6ae1-5810baf70260@intel.com>
 <cec5ddd7-e79f-c848-653f-81e21240f29a@intel.com>
 <87msyz39iv.wl-ashutosh.dixit@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <87msyz39iv.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0216.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::14) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|DM4PR11MB8132:EE_
X-MS-Office365-Filtering-Correlation-Id: e9650cf8-6029-476f-96ae-08db9979418f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xn4z330cDj8wGbL91kQJp05fAM3V5FcYsBf+mHGdsPkLdviDAzTHkrbSUH2nPhJKEeH05vbvMxgbZUuFex1SdxFqI8hC/nmCFrKtC452hQb5MDwBAzEoVHsnLkXdir5SBweNtVn9aiyUux9baRpowlMrZph7SJt0/Sjkjbd6EAf0iDW8oogh9GC0/i5DWZNSMbp32T6ZsrDP1D08XuV6p9psLSherxvXlkNozylviZhUhA0MJKblnNPfg5+kqLWPytL8soS2iniZRRrseKy2Wajd9327FAmUnf85KTh3ryj4Up7YEhBYfMO5M1sKvYM8QD5pLr4cJZ0qDQ7joUAqYBoiCoKZ6XT4y0JeUpnAUAcI9W3edIW/tDr1dVTbLxIWpdx/jCsB1FlcE+fJSexpWk3G4EYuQLFjw1/K1AhNA+gH2U1ZxwRahPzBjFbcTvItUFNxaPB4BxLHMaO2nALfbw58oIKOdxdYyTHCcfCKyqxLH1FYr66wsMHwbWCuzB0n4ba2ytLKjOG9KktN7QBAub8vHZ5wKyEz4rd5WtA9kgQHl6iJBChUSeoAj4fsFhzTAFMgVrFyZR1/cViYlFKDRSsfBc/m9ijGqMm0e4n+lW1HMHwH5LcqIrkBdCoMCP9K3rLeK9j01aVE6eb3GgttdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(136003)(396003)(346002)(376002)(1800799006)(451199021)(186006)(2616005)(478600001)(31696002)(86362001)(6512007)(6666004)(2906002)(36756003)(6486002)(6506007)(26005)(53546011)(107886003)(83380400001)(54906003)(37006003)(316002)(31686004)(66476007)(66556008)(66946007)(4326008)(6636002)(38100700002)(41300700001)(5660300002)(8936002)(8676002)(82960400001)(6862004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWRqWUI5b0gwUFROMnNMODh2NUFiU1ZSYUpKWXpUOGpJN04xTG9wNjJ5dzhS?=
 =?utf-8?B?UVdmZmhUanI2VnJzcml2elJPQkljNjJXbEpOQTRtMnhGMmtFaEwrcG90c0Na?=
 =?utf-8?B?STkzMVpJMkNDUGRqc0prM1FEbHpOSWt6V214WUs5Z0xqeDZxMkRGQ1JCSzNN?=
 =?utf-8?B?QjhZTkFVU09ZVHFhSUJ6QW05UUNwVEZ0VDNYUGVMTXdCN2R5MlNNUDV1alFU?=
 =?utf-8?B?WGFKMUY2L2tsYmdZODRtMUxSUW9jK3F1bFhteXRmMmhZRmRVa2hvd3FuMzRx?=
 =?utf-8?B?ckU2UHBialNKT2ZmMUkzcElBSjlRNlFGNWp4NUdQWXMwTXJxSTFoVU1RYTB2?=
 =?utf-8?B?K1RUZU9jeW1HRUo5cjNwaWN3UTQ1Rk5IcFRDaldiMEVvczNSSFRiN2p5M1R6?=
 =?utf-8?B?azdDL0pJUlpwc1ljOGZpcWU1eUJBQlNBUUFRaHJjWVZOOFdoTmV6M3J6SDJR?=
 =?utf-8?B?QVBqSXd0WkJ0SzRYa04vWDlQaFFjR2xaR002ZUJxOVRZVGNsWmh0ZzVTdUgy?=
 =?utf-8?B?ZFg4ajlPUCtMb045ZVI2TnVxaGFGUTcxcW8rSjRzWVpGUXZ6TXExOGdJOFYr?=
 =?utf-8?B?Ny9JRkI0Y3JQbEZVWVQ3V05mN2tFaHVuaGJDUDErOUozcktOckxyU3laSk9G?=
 =?utf-8?B?d2RnN1dQYWRtaUoyWFVFaldVQTBoWVlaZFBtTy9sVmpteDd2MmVJb1RyS0di?=
 =?utf-8?B?a0hHZU5lMnVVY0FMMkNuYklRVHArTnBlUmVXTExhcnJNQnF6Mnk3dVgzWHNN?=
 =?utf-8?B?TUhabS9LOCtNQTQ4cmlVOHVBZFFvdElJMmlvYkZCbkVNT2E1RllObFVtTkQ0?=
 =?utf-8?B?NXkxUll1VmJWSU5SRlNVZlpwbDFRV0hPQ2JZd1VPSU1UZ09lcVl4dWIvbXJJ?=
 =?utf-8?B?YktHVDA5QndUbys1cDYwSHE1Z0xOZWROTGt0WkM0Q2lhbmxudkVOSUY5Yis4?=
 =?utf-8?B?dkZmb3FkWno4VTZweXlHRUpwUmwxbUJWaXV4UTEvbXRsbjZkeXhzdTg5S1JL?=
 =?utf-8?B?U1YwSC9yYWVBZUtOblYyRTBHcGtwTXVOWmxLM0NMMVRsbm1NMHl6S1I3Rjlk?=
 =?utf-8?B?UVJwOCtXZVpWTWdsM2REc2lGb0k3K1QzLytuSVE5NE5EMjR4Q0ppZ1FQRmtK?=
 =?utf-8?B?S0ZlaXBhWE92UlU3OFhuS1BIUDBhZjVqNGxlQzk5aHBUTU9oWEM3TklJSFhJ?=
 =?utf-8?B?RFdvSmVmNlV5OGVuNzVkTTdZN1QrNVFpTVAvSkFBWHR3bkpoSWdyR1ZJSXpC?=
 =?utf-8?B?WFhSWjhRcDdFNy85TExVL3BjcVhaWkFiblZWYS9HeU1GZE9tb1pqOHMydUs4?=
 =?utf-8?B?Ynh3L3Vqb2syK3hoNjBFaVo3eHlLV1p5QzFueUp4aXI0NmlEN09pQmpObGJv?=
 =?utf-8?B?QlRQNnhIcVdnVDNPdTFFZHV3bHhXa0twd1AyUXJGYUdsYWhlN1pxUXBzSTNz?=
 =?utf-8?B?QmU3WDh4eGE4YlVCZDBQd2NlUEtZejBUT2podTZrbkJPcGgrdU1KSFZpcnR1?=
 =?utf-8?B?S1UyajN2VVZnRmJyNEVlc3hQeDNwYnRGWkRHcjVjTXFFOXRkTTQ5SUdVNktt?=
 =?utf-8?B?RzY1azZITlVoL1BVdHRXRHVjbDJJdDFIdERUZkhRZFRyU3RqQXdvU1lGYWVi?=
 =?utf-8?B?QkVDdmpVYnpTaWdEOVRiOEVGekdaZ25wOEIrWW0wZUk5VmJtRUFoMWY3YnlX?=
 =?utf-8?B?WDRud2JOQ040QUZLV0kxNTlhTWoydDZoS1R2YSsya3YrbitGMkYxSXRJTHZF?=
 =?utf-8?B?WktpRm9TT3AvSEdJT1NGdzBPT1FVVTJUWDJWMGhkaW9WS0tuWG1QN3NMaUhG?=
 =?utf-8?B?M2Q1UDhJWklFbGFmdGExb1BNK2FWT3B5OEp5N2xUSFQrTFg1RVZRY3ZnTGhs?=
 =?utf-8?B?VTU5bEZLelJTUlJCZU5SdjJsVllkODNVakg3bStUNEpkdkNlcDlSQzc0TTRq?=
 =?utf-8?B?NXpKV0dza2lPNkljWTJIT29IRUJFNTl6R3FpMHNyRElhZkc4VlhUcVVPYXRG?=
 =?utf-8?B?RklDc3dJaWo2NU1FMUJySXIxblpFZnQwNUJWakIwcXJMN3RwdEc4bUJ0RjFE?=
 =?utf-8?B?Sm5nMnkwS2dBbTd6ZWlCbkZrUWNGSFNhcTBJdGlJQy8vT0xnbERCS1Ryb0pW?=
 =?utf-8?B?VE15WTE4WUQ5T3RjR1FldURWZFE2Zm9WYnN4VGFTZno1OUo1ak5mT0NQRUc5?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9650cf8-6029-476f-96ae-08db9979418f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 08:10:27.7103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHfMcoA7NWgJiD190JlFQpIZAYrDbA37TNfDIojyreWh1S2gB8SChSFOLCrzOqfSfA7ojTGROUZYITWoVj4Gx7lS3slyCXmlU0bdJ4lkkgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8132
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



On 10-08-2023 08:10, Dixit, Ashutosh wrote:

Hi Ashutosh,

> On Wed, 09 Aug 2023 06:11:48 -0700, Iddamsetty, Aravind wrote:
> 
> Hi Aravind,
> 
>> On 09-08-2023 17:27, Iddamsetty, Aravind wrote:
>>> On 09-08-2023 15:25, Iddamsetty, Aravind wrote:
>>>> On 09-08-2023 12:58, Dixit, Ashutosh wrote:
>>>>> On Tue, 08 Aug 2023 04:54:36 -0700, Aravind Iddamsetty wrote:
>>>>>
>>>>> Spotted a few remaining things. See if it's possible to fix these up and
>>>>> send another version.
>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..9637f8283641
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>>>>>> @@ -0,0 +1,673 @@
>>>>
>>>> <snip>
>>>>>> +static u64 __engine_group_busyness_read(struct xe_gt *gt, int sample_type)
>>>>>> +{
>>>>>> +	u64 val = 0;
>>>>>> +
>>>>>
>>>>> What is the forcewake domain for these registers? Don't we need to get
>>>>> forcewake before reading these. Something like:
>>>>>
>>>>>         XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>>>>
>>>> based on  BSPEC:67609 these belong to GT power domain, so acquiring that
>>>> should be sufficient.
>>>
>>> But if i understand correctly taking forcewake is not allowed here as it
>>> is an atomic context and forcewake can sleep and that is what I'm seeing
>>> as well, might also be the reason why i915 didn't do that as well.
>>>
>>> [  899.114316] BUG: sleeping function called from invalid context at
>>> kernel/locking/mutex.c:580
>>> [  899.115768] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid:
>>> 290, name: kworker/27:1
>>
>> that is the reason why in i915 we were doing similar thing of storing
>> the counter as we enter rc6, not sure how do we do that in xe.
> 
> Just to check, which code path(s) is/are aotmic context:
> 
> a. xe_pm_suspend
> b. xe_pm_runtime_suspend
> c. xe_pmu_event_read

pmu_event_read and runtime_suspend are atomic contexts.

> 
> Now I am wondering if GuC should provide these counters too along with
> other busyness values it provides, since GuC is what control RC6
> entry/exit. But let's try to understand the issue some more first.

do you mean GuC reading these registers and presenting us in a way, will
need to think over how does it fit in the PMU.

Thanks,
Aravind.

> 
> Thanks.
> --
> Ashutosh
> 
> 
>>>>>
>>>>>> +	switch (sample_type) {
>>>>>> +	case __XE_SAMPLE_RENDER_GROUP_BUSY:
>>>>>> +		val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
>>>>>> +		break;
>>>>>> +	case __XE_SAMPLE_COPY_GROUP_BUSY:
>>>>>> +		val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
>>>>>> +		break;
>>>>>> +	case __XE_SAMPLE_MEDIA_GROUP_BUSY:
>>>>>> +		val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
>>>>>> +		break;
>>>>>> +	case __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY:
>>>>>> +		val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
>>>>>> +		break;
>>>>>> +	default:
>>>>>> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>>>>>> +	}
>>>>>
>>>>> And similarly here:
>>>>>
>>>>>         XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
