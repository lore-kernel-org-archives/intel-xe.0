Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6503AE8181D
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 04:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3727310E34B;
	Tue, 26 Sep 2023 04:57:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85E010E345
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 04:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695704259; x=1727240259;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fN08LwThbrRvr6uVCqZ+ZPwzIFdxE4ju5Rfp2nSs/4o=;
 b=i9Z/bmNKEtylTG+avBiMG2+x9FZLs+GtQhQGwJ+WwRGe7GHbFLrKWucS
 NRm5JNgM0+nD4Wl2IrX0XCXgkXPJAliN+P7MEuymOIyQ/IxVHSNFxzbxA
 0jiiNQHFwsc5HRAYF+fQuVCvWrjm3ipaJtvqgcpWQQC0xCdbVca5ypW5O
 ot8D4/IniOiHIA67zJ8h6N1zdtypeA8/aC9cKu6zM/2X6yptl9hzKVugC
 XMNCOtS4oYyMme3KzxCqSF6VWKtWPczleKXrJapIbtj4QjgMMeQOLwS4J
 OQ4avnioVJOxztSYI9tnEf6YpF4cIy5YdcJ09tvEqYwhVDM1cNmVSc7pw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="445615356"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="445615356"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 21:57:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="742219785"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="742219785"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 21:57:39 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 21:57:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 21:57:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 21:57:37 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 21:57:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WiXLj6Z8dGUvHy1tjsAHdWnENnfVuzqPvLfKEREwkgVr1lr1UZhlpDyM1Y/DS1VXpDiuhoJYZp27IzUpfPOUnf8J12roMlVfHmshI61qwwWfoLEXkZjWhPN3wcgLbCrDTN554fzb0p+UoTxK8aj5TKdJ4qoMvSU/xN8WVOrVANI+E0g3riHIh6cnabFMD/4GNu8JV5bpWATsNZk7Qo12uGJOLUQflV+ciiSODHd9wDw2Co821Z70nBEQkQAcwYx4qC0Ef3qEz1T3j1oUWEkShAdZotdB0NSpdIIddEUn7nks4U4D3bpD1MysRYjwxgmqtukkk/FWG3xC1WfuNWvw6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRAFFyfj+ZG4+tY1j1Jo0bDHja9nfPsE3lWfnllUq5M=;
 b=aGgw2VgoC84tLgmfR6o7BAWtc/lRbFT24RRIbGED3It9OiM+f9dMxkjNE89QCh9geY19fd7ORCN3tANhIMOHc4Nv982WR2erApK+u3cFHEiRqgbtbHs0fSxVOTkiIaKvknDGq5z9PpQaYM2ay7rWPx00E6jBdqEwYfr2qBFUwbu0w9aRwkov6waibz3JeFPeCWGzG7BHw/Fss1of6GNAVwmXsCJ7VKN3MRmGZrIikzGpZCUjCMhOyQe4uFuk3YGdXZiGFM+MHp6fCvpCQBIG5g6XS4C8qe/SE5NPlAeullF2ClbZN6rpL5UpVqEzhkaKsbWHiYYpi/3+xxKwaAUZsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA1PR11MB7775.namprd11.prod.outlook.com (2603:10b6:208:3f3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 04:57:29 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::82e:c2f3:6b0f:3586]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::82e:c2f3:6b0f:3586%4]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 04:57:29 +0000
Message-ID: <b969fb61-e4a7-4d18-a6c8-2414d074a5ef@intel.com>
Date: Tue, 26 Sep 2023 10:27:17 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230823085842.1440523-1-himal.prasad.ghimiray@intel.com>
 <20230823085842.1440523-2-himal.prasad.ghimiray@intel.com>
 <43cfbdbd-2dfa-58df-88b1-6180112a1c9a@linux.intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <43cfbdbd-2dfa-58df-88b1-6180112a1c9a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::35) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|IA1PR11MB7775:EE_
X-MS-Office365-Filtering-Correlation-Id: bb90658a-82e6-4e6a-93aa-08dbbe4d15d2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5k9f/aJwyBCT/lhvS5Hk+3axhk/1I+uj+sjrZEkNjdiedelo7z4/qQACnOaLen5mBPLVjVLGOVQDObqJT5uGifSi7pcd1SfCwIKQdjYaiFN/mlKM9c9KCBrMYHM/DGp1iQ/DONTVDu/lVhG84Xen2RvzfpmhPzgNBqHz9DKzVd/YS2KPEF1eRFkJYgumpBnXbHbeaCjOoHRZOrHfcTy9HMjPY4WtEzmwSOiIFJya587RX6tj9AdNoNH3DhD2WwBAjbluy50PdVvgV0X99oTgRn3wOronyj1brzwA7i3g0dS6GLoqQ/VFSusLHpGgla0fZD73Fi3q45fSd1xMXVInaToJk93nyztJIsfqAW0ObukJ7/Zn5dTDb0EYzUaLgpFRM6+dTSeO0J9rb3lTmKCSkBfcRQdJGbT0Y/QaM4bNMpJrA3q3KaSf+6TyOkAoIdoBu1d82fM8nw4LuUDQpEhzyAw/Wsv82dcQT5rg4ugZQACtU8J7uo8HaFBY5sTR/lTK1vR+DIc+wzg0QhVQMzfeAGIZOQ1080yCfyqzPkqCmmxcX1l4/exHBFtf76tIzsBZtzbEKOGVe0TDB948V+mmhjT62RdhMxseG5oNDKAS4dXp+lQDeBTEWqrolWDM/yUH1kIE+lYAWDjuCPrBbCUomA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(136003)(346002)(396003)(230922051799003)(1800799009)(451199024)(186009)(6506007)(6486002)(2906002)(83380400001)(30864003)(82960400001)(38100700002)(54906003)(6512007)(66946007)(66556008)(66476007)(6666004)(5660300002)(26005)(53546011)(316002)(41300700001)(8936002)(8676002)(4326008)(478600001)(2616005)(31696002)(86362001)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDRaVFhKTzZuYlFoNU1FNWZOOXlUUlVtN0xoZlU2Yi9tdEVCTzFMS25qQnFt?=
 =?utf-8?B?bGpOMHJPc0grR0ZDSW5DajY0OTZCOFRaSGY3MEhXVGVWaWFMQnZlbVlnSFVO?=
 =?utf-8?B?VkIxektRQVJBcGl3ajQvRXJPbURrb1RRNWsyS05HL0ViWVlHRUVleEVSaW45?=
 =?utf-8?B?WmdpYTBWY3I3VEwvTHZTTlFGeW82cnZxc2RIOE5IUldvaWFCYjY5Wk5VN0Vj?=
 =?utf-8?B?QkpTVzlQWDB2bjJ2TEJrUHUvaWZLYTcyUm9SRFQramQwSDVEWFRTL3NiaHNJ?=
 =?utf-8?B?WjFhOFlkTjQxSXFPa2NGNUx4bGtZZTZYOGZXYWVvd2lmMzZDVXA3VGVUcjFs?=
 =?utf-8?B?eTJOMnRhRHZwTHBsVWZ0bUNQN0xEa2pIR0dGOGRiYWt1STJRMmFxQTJ3NzdT?=
 =?utf-8?B?VzNXVzkvc3pSdnJrWkFzRXpwZi84UXYzMzVvNytFOUxqUERodGErRUhJcWll?=
 =?utf-8?B?ZlN4eWlwWnE0ZE9Xa3BjZUFMeWhLK3U2Z2lZTTRQZHA2alRGT3UxOWFiTlJC?=
 =?utf-8?B?SkFNLzdRTFgza2FzK2hWalVPc21TYWxzQTQvWTZKU3F5RGZ4K2VwQTZEU1JU?=
 =?utf-8?B?b0lHQ1pFZllUTks2S3hpZHNFa2FwOGQ0NXY1bFJ5TnJFMmpZdTFKUlFHY0dl?=
 =?utf-8?B?NHBGaDlqVTBNK3NWNG5Yb09wMjhiUXI0WVh5VG04M0YvOXhNeGNTOG51MGU3?=
 =?utf-8?B?NnVpSWNUY1BzT3NzK3R2UVIxNTI3TzVNR3BaR3lmR0FuVW5IVk5SS3hmNkl5?=
 =?utf-8?B?aUpUTXBJa2EwenhOeUVibFk3OWJMN0pMWXFlNkd1RVFzZjBveUVrRW1Pbzhh?=
 =?utf-8?B?YnZ0eWV1cmkyZDVBQnFjdUFFc3h1K1VPVWlqVHhlcFFsNEZ6VUtyUG1ETDNk?=
 =?utf-8?B?aHNScWdvZWRhd29UK0tpVGFsSCtMalE4bmY2R2huRE9yNzY3MnpPdVgxR1BD?=
 =?utf-8?B?UjBpeUI4YVk2d0crZFIyRW1LUjJZZUQwOEZ1ZHBxcnFvNHBTdFAycm4rZGRC?=
 =?utf-8?B?ckdJU2FDNS9RbGlyQnhxSkFQaCtBUVdNT1l2aUlZZ0l4TEJTWWVXY1diL3I2?=
 =?utf-8?B?UjVyM3hPdmZ2eTMwd1VVZ1lBdjM5MTR1Q1lEWnNrWTk5MG5IV0hScW8rYTh0?=
 =?utf-8?B?dFZocGxIUHoxQ2RYS3VEc3VGVDdhZHBJbXNYR2xZL2J0dldIdU5LKzQxWE4r?=
 =?utf-8?B?K1dTdEZhQW9TZnRtVjlDck5aTGdpbmc1YlU3MnRDOUtWK2pvcWlXOTRSNVFY?=
 =?utf-8?B?MEU1V1YrVmErMjVuYldaRDJlLzZxcXdOVUs1MjU2bDZ1d0dobGIyR05SMFhv?=
 =?utf-8?B?aXZpb294RUNKVnkxMmJvSFlJTVpYbHZaN2VjVlR3VVhoa0ZvN0JvN2MxeU1W?=
 =?utf-8?B?WmNoRU5SVmxlajliMVMvblI5a0ZGU0FXSnFDd0EzVmVobUNyUlJWSlNrTEVE?=
 =?utf-8?B?UnBORG4zTjhQNFFSVzVjblRJNTQ3WGp2V29GRTNyeisyOGNud0VWYnY0UXVU?=
 =?utf-8?B?ZWVTbGc0VktFbW9MSTY3QWRxSVFoYU5mTHN2dThISy9ZUVNERVNPMVhCcGVz?=
 =?utf-8?B?V0I1eDFzRWxPM0Zybzd2NUZ0eVhYSkhKNzREZ2tGd0svTzJiYzlIeU15b0dW?=
 =?utf-8?B?bzI3eFM4MmdQMkNuSkxML3BDdEljWlZYOVpjcTNOSndKOXlKN05mOXg4R3BM?=
 =?utf-8?B?cjF6VjAyalNqRXFYWlFFZnFFcTNWU2R6WGRLNWNKcFhHdjRKS3BlSVJPSndX?=
 =?utf-8?B?dVU1UzkzQXIyOVdHR2R4T0U5Zm9lUm8zSEFEZGJJZ05iMUxkMytmaVc5REsw?=
 =?utf-8?B?TUJxV2tnbW5IdzBlMWhlM2RIaEZ3dEs2TnFNMld2SUN2cHlyWHVHMVd2cm9K?=
 =?utf-8?B?dE1RQVI0WitRYmxWSVBMWlc4Ymtnd3lFTHpCOERHOVdwZFZuUGYyVHlac1lh?=
 =?utf-8?B?VldtK2w1RmpqaXZkM1ZjaGVnU2lzNHBycmpIejNUK3NjWStDQkFYT0tHVldJ?=
 =?utf-8?B?cHpQT2hxUVdGZW83c3lpdm1JSkpyYjlkeVVnOWtLNXd4ZmFJTGgrRXhNMGhN?=
 =?utf-8?B?Z0RqS202ZDlpM2pUQWhuL1Y1MU5sUXMwQzY4UG9hY2pYZ3hUZlVKMmdheGFW?=
 =?utf-8?B?UEM4TUtiQkYzYzdrK3ZsWG51M2NQWVRGYm5PeTNWRHk3d0o1d1RMNnFzeHEw?=
 =?utf-8?Q?8lcDz09gXXMznCxSrIVhS40=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb90658a-82e6-4e6a-93aa-08dbbe4d15d2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 04:57:29.3003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1QqJ740CyZDwIKk+QZbGd5EGEbt16NaBVACNiItgrPdoqdApSMmi99COkalBleOnwL9rUzmKPFg0RaZMLo0eZO451TUWjoMKbhbrIt0ekYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7775
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 1/4] drm/xe: Handle errors from various
 components.
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
Cc: Jani Nikula <jani.nikula@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 26-09-2023 09:50, Aravind Iddamsetty wrote:
> On 23/08/23 14:28, Himal Prasad Ghimiray wrote:
>> The GFX device can generate numbers of classes of error under the new
>> infrastructure: correctable, non-fatal, and fatal errors.
> The GFX device reports two classes of errors: uncorrectable and correctable.
> Depending on the severity uncorrectable errors are further classified as non fatal and fatal.
>> The non-fatal and fatal error classes distinguish between levels of
>> severity for uncorrectable errors. Driver will only handle logging
>> of errors and updating counters from various components within the
>> graphics device. Anything more will be handled at system level.
>>
>> For errors that will route as interrupts, three bits in the Master
>> Interrupt Register will be used to convey the class of error.
>>
>> For each class of error: Determine source of error (IP block) by reading
>> the Device Error Source Register (RW1C) that
>> corresponds to the class of error being serviced.
>>
>> Bspec: 50875, 53073, 53074, 53075
> Also may be you want to squash this with the last patch where fatal error processing is done,
> fatal errors are defined here but processed in your last patch or move all fatal definition to last patch.
Makes sense. Will squash in last patch.
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile                  |   1 +
>>   drivers/gpu/drm/xe/regs/xe_regs.h            |   2 +-
>>   drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  15 ++
>>   drivers/gpu/drm/xe/xe_device_types.h         |  11 +
>>   drivers/gpu/drm/xe/xe_hw_error.c             | 211 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_hw_error.h             |  64 ++++++
>>   drivers/gpu/drm/xe/xe_irq.c                  |   3 +
>>   7 files changed, 306 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 550cdfed729e..6290c8ce0e84 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -75,6 +75,7 @@ xe-y += xe_bb.o \
>>   	xe_guc_submit.o \
>>   	xe_hw_engine.o \
>>   	xe_hw_engine_class_sysfs.o \
>> +	xe_hw_error.o \
>>   	xe_hw_fence.o \
>>   	xe_huc.o \
>>   	xe_huc_debugfs.o \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
>> index 39d7b0740bf0..e223975a5acf 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>> @@ -88,7 +88,7 @@
>>   #define   GU_MISC_IRQ				REG_BIT(29)
>>   #define   DISPLAY_IRQ				REG_BIT(16)
>>   #define   GT_DW_IRQ(x)				REG_BIT(x)
>> +#define   XE_ERROR_IRQ(x)			REG_BIT(26 + (x))
>>   
>>   #define PVC_RP_STATE_CAP			XE_REG(0x281014)
>> -
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
>> new file mode 100644
>> index 000000000000..db78d6687213
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +#ifndef XE_TILE_ERROR_REGS_H_
>> +#define XE_TILE_ERROR_REGS_H_
>> +
>> +#include <linux/stddef.h>
>> +
>> +#define _DEV_ERR_STAT_NONFATAL                         0x100178
>> +#define _DEV_ERR_STAT_CORRECTABLE                      0x10017c
>> +#define DEV_ERR_STAT_REG(x)                            XE_REG(_PICK_EVEN((x), \
>> +								_DEV_ERR_STAT_CORRECTABLE, \
>> +								_DEV_ERR_STAT_NONFATAL))
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index dbb732e14606..4e4184977709 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -14,6 +14,7 @@
>>   
>>   #include "xe_devcoredump_types.h"
>>   #include "xe_gt_types.h"
>> +#include "xe_hw_error.h"
>>   #include "xe_platform_types.h"
>>   #include "xe_step_types.h"
>>   
>> @@ -172,6 +173,11 @@ struct xe_tile {
>>   
>>   	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
>>   	struct kobject *sysfs;
>> +
>> +	/** @tile_hw_errors: hardware errors reported for the tile */
>> +	struct tile_hw_errors {
>> +		unsigned long count[XE_TILE_HW_ERROR_MAX];
>> +	} errors;
>>   };
>>   
>>   /**
>> @@ -359,6 +365,11 @@ struct xe_device {
>>   	 */
>>   	struct task_struct *pm_callback_task;
>>   
>> +	/** @hardware_errors_regs: list of hw error regs*/
>> +	struct hardware_errors_regs {
>> +		const struct err_msg_cntr_pair *dev_err_stat[HARDWARE_ERROR_MAX];
> I'm just thinking if it makes sense to move it to respective structs like tile or gt, any thoughts?
These structures are platform dependent not tiles/gt. IMO device is 
right place.
>> +	} hw_err_regs;
>> +
>>   	/* private: */
>>   
>>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> new file mode 100644
>> index 000000000000..357d0f962d91
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -0,0 +1,211 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include "xe_hw_error.h"
>> +
>> +#include "regs/xe_regs.h"
>> +#include "regs/xe_tile_error_regs.h"
>> +#include "xe_device.h"
>> +#include "xe_mmio.h"
>> +
>> +static const char *
>> +hardware_error_type_to_str(const enum hardware_error hw_err)
>> +{
>> +	switch (hw_err) {
>> +	case HARDWARE_ERROR_CORRECTABLE:
>> +		return "CORRECTABLE";
>> +	case HARDWARE_ERROR_NONFATAL:
>> +		return "NONFATAL";
>> +	case HARDWARE_ERROR_FATAL:
>> +		return "FATAL";
>> +	default:
>> +		return "UNKNOWN";
>> +	}
>> +}
>> +
>> +static const struct err_msg_cntr_pair dg2_err_stat_fatal_reg[] = {
> the name err_msg_cntr_pair might not be appropriate as it err name and index into
> tile_hw_errors. err_name_index_pair ?? thoughts
ok.
>> +	[0]         = {"GT",			XE_TILE_HW_ERR_GT_FATAL},
>> +	[1 ... 3]   = {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
>> +	[4]         = {"DISPLAY",		XE_TILE_HW_ERR_DISPLAY_FATAL},
>> +	[5 ... 7]   = {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
>> +	[8]         = {"GSC error",		XE_TILE_HW_ERR_GSC_FATAL},
>> +	[9 ... 11]  = {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
>> +	[12]        = {"SGUNIT",		XE_TILE_HW_ERR_SGUNIT_FATAL},
>> +	[13 ... 15] = {"Undefined",             XE_TILE_HW_ERR_UNKNOWN_FATAL},
>> +	[16]        = {"SOC",			XE_TILE_HW_ERR_SOC_FATAL},
>> +	[17 ... 31] = {"Undefined",             XE_TILE_HW_ERR_UNKNOWN_FATAL},
>> +};
>> +
>> +static const struct err_msg_cntr_pair dg2_err_stat_nonfatal_reg[] = {
>> +	[0]         = {"GT",			XE_TILE_HW_ERR_GT_NONFATAL},
>> +	[1 ... 3]   = {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>> +	[4]         = {"DISPLAY",		XE_TILE_HW_ERR_DISPLAY_NONFATAL},
>> +	[5 ... 7]   = {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>> +	[8]         = {"GSC error",		XE_TILE_HW_ERR_GSC_NONFATAL},
>> +	[9 ... 11]  = {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>> +	[12]        = {"SGUNIT",		XE_TILE_HW_ERR_SGUNIT_NONFATAL},
>> +	[13 ... 15] = {"Undefined",             XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>> +	[16]        = {"SOC",			XE_TILE_HW_ERR_SOC_NONFATAL},
>> +	[17 ... 19] = {"Undefined",             XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>> +	[20]        = {"MERT",			XE_TILE_HW_ERR_MERT_NONFATAL},
>> +	[21 ... 31] = {"Undefined",             XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>> +};
>> +
>> +static const struct err_msg_cntr_pair dg2_err_stat_correctable_reg[] = {
>> +	[0]         = {"GT",			XE_TILE_HW_ERR_GT_CORR},
>> +	[1 ... 3]   = {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
>> +	[4]         = {"DISPLAY",		XE_TILE_HW_ERR_DISPLAY_CORR},
>> +	[5 ... 7]   = {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
>> +	[8]         = {"GSC error",		XE_TILE_HW_ERR_GSC_CORR},
>> +	[9 ... 11]  = {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
>> +	[12]        = {"SGUNIT",		XE_TILE_HW_ERR_SGUNIT_CORR},
>> +	[13 ... 15] = {"Undefined",             XE_TILE_HW_ERR_UNKNOWN_CORR},
>> +	[16]        = {"SOC",			XE_TILE_HW_ERR_SOC_CORR},
>> +	[17 ... 31] = {"Undefined",             XE_TILE_HW_ERR_UNKNOWN_CORR},
>> +};
>> +
>> +static const struct err_msg_cntr_pair pvc_err_stat_fatal_reg[] = {
>> +	[0]         =  {"GT",			XE_TILE_HW_ERR_GT_FATAL},
>> +	[1]         =  {"SGGI Cmd Parity",	XE_TILE_HW_ERR_SGGI_FATAL},
>> +	[2 ... 7]   =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
>> +	[8]         =  {"GSC error",		XE_TILE_HW_ERR_GSC_FATAL},
>> +	[9]         =  {"SGLI Cmd Parity",	XE_TILE_HW_ERR_SGLI_FATAL},
>> +	[10 ... 12] =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
>> +	[13]        =  {"SGCI Cmd Parity",	XE_TILE_HW_ERR_SGCI_FATAL},
>> +	[14 ... 15] =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
>> +	[16]        =  {"SOC ERROR",		XE_TILE_HW_ERR_SOC_FATAL},
>> +	[17 ... 19] =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
>> +	[20]        =  {"MERT Cmd Parity",	XE_TILE_HW_ERR_MERT_FATAL},
>> +	[21 ... 31] =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
>> +};
>> +
>> +static const struct err_msg_cntr_pair pvc_err_stat_nonfatal_reg[] = {
>> +	[0]         =  {"GT",			XE_TILE_HW_ERR_GT_NONFATAL},
>> +	[1]         =  {"SGGI Data Parity",	XE_TILE_HW_ERR_SGGI_NONFATAL},
>> +	[2 ... 7]   =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>> +	[8]         =  {"GSC",			XE_TILE_HW_ERR_GSC_NONFATAL},
>> +	[9]         =  {"SGLI Data Parity",	XE_TILE_HW_ERR_SGLI_NONFATAL},
>> +	[10 ... 12] =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>> +	[13]        =  {"SGCI Data Parity",	XE_TILE_HW_ERR_SGCI_NONFATAL},
>> +	[14 ... 15] =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>> +	[16]        =  {"SOC",			XE_TILE_HW_ERR_SOC_NONFATAL},
>> +	[17 ... 19] =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>> +	[20]        =  {"MERT Data Parity",	XE_TILE_HW_ERR_MERT_NONFATAL},
>> +	[21 ... 31] =  {"Undefined",            XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>> +};
>> +
>> +static const struct err_msg_cntr_pair pvc_err_stat_correctable_reg[] = {
>> +	[0]         =  {"GT",			XE_TILE_HW_ERR_GT_CORR},
>> +	[1 ... 7]   =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
>> +	[8]         =  {"GSC",			XE_TILE_HW_ERR_GSC_CORR},
>> +	[9 ... 31]  =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
>> +};
>> +
>> +static const struct err_msg_cntr_pair dev_err_stat_fatal_reg[] = {
>> +	[0]         =  {"GT",			XE_TILE_HW_ERR_GT_FATAL},
>> +	[1 ... 31]  =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
>> +};
>> +
>> +static const struct err_msg_cntr_pair dev_err_stat_nonfatal_reg[] = {
>> +	[0]         =  {"GT",			XE_TILE_HW_ERR_GT_NONFATAL},
>> +	[1 ... 31]  =  {"Undefined",            XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>> +};
>> +
>> +static const struct err_msg_cntr_pair dev_err_stat_correctable_reg[] = {
>> +	[0]         =  {"GT",			XE_TILE_HW_ERR_GT_CORR},
>> +	[1 ... 31]  =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
>> +};
>> +
>> +void xe_assign_hw_err_regs(struct xe_device *xe)
>> +{
>> +	const struct err_msg_cntr_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
>> +
>> +	if (xe->info.platform == XE_DG2) {
>> +		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = dg2_err_stat_correctable_reg;
>> +		dev_err_stat[HARDWARE_ERROR_NONFATAL] = dg2_err_stat_nonfatal_reg;
>> +		dev_err_stat[HARDWARE_ERROR_FATAL] = dg2_err_stat_fatal_reg;
>> +	} else if (xe->info.platform == XE_PVC) {
>> +		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = pvc_err_stat_correctable_reg;
>> +		dev_err_stat[HARDWARE_ERROR_NONFATAL] = pvc_err_stat_nonfatal_reg;
>> +		dev_err_stat[HARDWARE_ERROR_FATAL] = pvc_err_stat_fatal_reg;
>> +	} else {
>> +		/* For other platforms report only GT errors */
> why only GT errors??

Because GT errors will only be common to all platforms. The other errors 
are platform specific.

>> +		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = dev_err_stat_correctable_reg;
>> +		dev_err_stat[HARDWARE_ERROR_NONFATAL] = dev_err_stat_nonfatal_reg;
>> +		dev_err_stat[HARDWARE_ERROR_FATAL] = dev_err_stat_fatal_reg;
>> +	}
>> +}
>> +
>> +static void
>> +xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>> +{
>> +	const char *hw_err_str = hardware_error_type_to_str(hw_err);
>> +	const struct hardware_errors_regs *err_regs;
>> +	const struct err_msg_cntr_pair *errstat;
>> +	unsigned long errsrc;
>> +	unsigned long flags;
>> +	const char *errmsg;
>> +	struct xe_gt *mmio;
>> +	u32 indx;
>> +	u32 errbit;
>> +
>> +	spin_lock_irqsave(&tile_to_xe(tile)->irq.lock, flags);
>> +	err_regs = &tile_to_xe(tile)->hw_err_regs;
>> +	errstat = err_regs->dev_err_stat[hw_err];
>> +	mmio = tile->primary_gt;
>> +	errsrc = xe_mmio_read32(mmio, DEV_ERR_STAT_REG(hw_err));
>> +	if (!errsrc) {
>> +		drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR
>> +				    "TILE%d detected DEV_ERR_STAT_REG_%s blank!\n",
>> +				    tile->id, hw_err_str);
>> +		goto unlock;
>> +	}
>> +
>> +	drm_info(&tile_to_xe(tile)->drm, HW_ERR
>> +		 "TILE%d DEV_ERR_STAT_REG_%s=0x%08lx\n", tile->id, hw_err_str, errsrc);
>> +
>> +	for_each_set_bit(errbit, &errsrc, 32) {
>> +		errmsg = errstat[errbit].errmsg;
>> +		indx = errstat[errbit].cntr_indx;
>> +
>> +		if (hw_err == HARDWARE_ERROR_CORRECTABLE)
>> +			drm_warn(&tile_to_xe(tile)->drm,
>> +				 HW_ERR "TILE%d detected %s %s error, bit[%d] is set\n",
>> +				 tile->id, errmsg, hw_err_str, errbit);
>> +
>> +		else
>> +			drm_err_ratelimited(&tile_to_xe(tile)->drm,
>> +					    HW_ERR "TILE%d detected %s %s error, bit[%d] is set\n",
>> +					    tile->id, errmsg, hw_err_str, errbit);
>> +		tile->errors.count[indx]++;
> The register here is a top level register and some of the sources have second error level registers
> so the count shall be at second level source for all those that have and not at global level as here
> it will not give granularity.

My idea of having counter at top level was to have cumulative numbers 
for errors.

It will provide summation of all MSI's in case of correctable gt. Can we 
removed but looks logical to retain it.

>> +	}
>> +
>> +	xe_mmio_write32(mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
>> +unlock:
>> +	spin_unlock_irqrestore(&tile_to_xe(tile)->irq.lock, flags);
>> +}
>> +
>> +/*
>> + * XE Platforms adds three Error bits to the Master Interrupt
>> + * Register to support error handling. These three bits are
>> + * used to convey the class of error:
>> + * FATAL, NONFATAL, or CORRECTABLE.
>> + *
>> + * To process an interrupt:
>> + *       Determine source of error (IP block) by reading
>> + *	 the Device Error Source Register (RW1C) that
>> + *	 corresponds to the class of error being serviced
>> + *	 and log the error.
>> + */
>> +void
>> +xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>> +{
>> +	enum hardware_error hw_err;
>> +
>> +	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
>> +		if (master_ctl & XE_ERROR_IRQ(hw_err))
>> +			xe_hw_error_source_handler(tile, hw_err);
>> +	}
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
>> new file mode 100644
>> index 000000000000..c0c05b9130eb
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
>> @@ -0,0 +1,64 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +#ifndef XE_HW_ERRORS_H_
>> +#define XE_HW_ERRORS_H_
>> +
>> +#include <linux/stddef.h>
>> +#include <linux/types.h>
>> +
>> +/* Error categories reported by hardware */
>> +enum hardware_error {
>> +	HARDWARE_ERROR_CORRECTABLE = 0,
>> +	HARDWARE_ERROR_NONFATAL = 1,
>> +	HARDWARE_ERROR_FATAL = 2,
>> +	HARDWARE_ERROR_MAX,
>> +};
>> +
>> +/* Count of  Correctable and Uncorrectable errors reported on tile */
>> +enum xe_tile_hw_errors {
>> +	XE_TILE_HW_ERR_GT_FATAL = 0,
>> +	XE_TILE_HW_ERR_SGGI_FATAL,
>> +	XE_TILE_HW_ERR_DISPLAY_FATAL,
>> +	XE_TILE_HW_ERR_SGDI_FATAL,
>> +	XE_TILE_HW_ERR_SGLI_FATAL,
>> +	XE_TILE_HW_ERR_SGUNIT_FATAL,
>> +	XE_TILE_HW_ERR_SGCI_FATAL,
>> +	XE_TILE_HW_ERR_GSC_FATAL,
>> +	XE_TILE_HW_ERR_SOC_FATAL,
>> +	XE_TILE_HW_ERR_MERT_FATAL,
>> +	XE_TILE_HW_ERR_SGMI_FATAL,
>> +	XE_TILE_HW_ERR_UNKNOWN_FATAL,
>> +	XE_TILE_HW_ERR_SGGI_NONFATAL,
>> +	XE_TILE_HW_ERR_DISPLAY_NONFATAL,
>> +	XE_TILE_HW_ERR_SGDI_NONFATAL,
>> +	XE_TILE_HW_ERR_SGLI_NONFATAL,
>> +	XE_TILE_HW_ERR_GT_NONFATAL,
>> +	XE_TILE_HW_ERR_SGUNIT_NONFATAL,
>> +	XE_TILE_HW_ERR_SGCI_NONFATAL,
>> +	XE_TILE_HW_ERR_GSC_NONFATAL,
>> +	XE_TILE_HW_ERR_SOC_NONFATAL,
>> +	XE_TILE_HW_ERR_MERT_NONFATAL,
>> +	XE_TILE_HW_ERR_SGMI_NONFATAL,
>> +	XE_TILE_HW_ERR_UNKNOWN_NONFATAL,
>> +	XE_TILE_HW_ERR_GT_CORR,
>> +	XE_TILE_HW_ERR_DISPLAY_CORR,
>> +	XE_TILE_HW_ERR_SGUNIT_CORR,
>> +	XE_TILE_HW_ERR_GSC_CORR,
>> +	XE_TILE_HW_ERR_SOC_CORR,
>> +	XE_TILE_HW_ERR_UNKNOWN_CORR,
>> +	XE_TILE_HW_ERROR_MAX,
>> +};
>> +
>> +struct err_msg_cntr_pair {
>> +	const char *errmsg;
>> +	const u32 cntr_indx;
>> +};
>> +
>> +struct xe_device;
>> +struct xe_tile;
>> +
>> +void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
>> +void xe_assign_hw_err_regs(struct xe_device *xe);
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>> index 1dee3e832eb5..48b933234342 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -418,6 +418,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>>   		xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);
>>   
>>   		gt_irq_handler(tile, master_ctl, intr_dw, identity);
>> +		xe_hw_error_irq_handler(tile, master_ctl);
>>   
>>   		/*
>>   		 * Display interrupts (including display backlight operations
>> @@ -572,6 +573,8 @@ int xe_irq_install(struct xe_device *xe)
>>   		return -EINVAL;
>>   	}
>>   
>> +	xe_assign_hw_err_regs(xe);
>> +
>>   	xe->irq.enabled = true;
>>   
>>   	xe_irq_reset(xe);
> Thanks,
> Aravind.
