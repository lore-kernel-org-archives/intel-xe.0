Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29391C46CD3
	for <intel-xe@archiver.kernel.org>; Tue, 26 Dec 2023 04:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8526810E038;
	Tue, 26 Dec 2023 04:32:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092F210E02B
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Dec 2023 04:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703565135; x=1735101135;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=57ViN0gcDgXFlLWX/7WZAu4KHjPRggSMsFrKe7Th368=;
 b=BZP3wjpv3kcZy9PFuVtviIR3nST6SIsqhJTKpMoc2aRy67jB2uJahWCs
 qjXXr7832tWv8e1XwFPmXhyD0O+NIeynddZy33EGa9Pfba8+k7SxMl+3E
 0LOKLHiOHwXjYWYShA8DluerVHVIHMmTqsFEKrv/IZ8R0Y5c8tB38vVbQ
 FQsoNQakI48znLJfU6LDdwO4kAcRDeQ3JNwe+J1Q/h5skKSQ6jyCBdCxG
 McWtpCLLIa+LIef9rKUv+TKi41p/H9DXBlm1SRp8O2oKxFfRegFAaXGph
 k64Aj+npcbj8RkkQu0i/0zJVWOSwZ/deK7Y5j8z21AIgfOSzyMrMY5N9/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="3404069"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="3404069"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Dec 2023 20:32:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="843786150"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; d="scan'208";a="843786150"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Dec 2023 20:32:13 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Dec 2023 20:32:13 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Dec 2023 20:32:13 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Dec 2023 20:32:13 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Dec 2023 20:32:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gx1B2hvxSLy+Tv+SDcNca1J4j5HxYB0V9/6EbnvBOY1kVW0ACja2FIl42OPta9vIRs+Vhlo/IgPiS4zp4dpLQKspE96VoOce/Wr95gvR6C/ImeWIMmQkvAx4jAFgixlmjOPXosOiNzKIUP62LNZsL8F+NMUeCURiysh5gTvnKrxv+SfEtJO1NF40v2h8sXx+j01fBUr7P9aZvwTE0KThGSlVO2yJAIPIpFT0Ib/jYGgG7Ej/CwDQtfxR8kMDYDuykmCUOhNUiaG3xNfXiojRvtdvBwlXJvsoxwddoNzTIK+uhcL+zDcacoD79gvU2pEz4ZzSbdl+3ugTL2QG2xoK1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOnzGCkbAt8cou9/ZysXlqgXpbTGXpTXzchd/amiEM0=;
 b=lTvQouHQ/eMmB0fAWoDzaMQinVHXUHHpoIBSxXdnLg4nd+PM1x6Y9zWwkHu9XY27HFikxR5+0wytRjqQhpaMSsLv2bYMzdrGVsRw1WKm1Gr8qHPK1sw/FYmd8wITepXazlBXcBtFaGPXlAKj6WZcQ4rHlD3yK1mezF/8rNr54iYctUGcwZWYvzrfvxXWM25nBWsNQo8Usd5Lj9f8MfWJoYgxLQBoiMTzD1xeTXQBZCsD5ld43WI2SbXykvewJuewyzu8X9f4Dk51vytlTTHt6jsLa/bQWVLHeGzsJLiB0cIx/luP0lMF6145N086uoeYkWbCkbm0vIAZRUadkvbOaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DM4PR11MB5421.namprd11.prod.outlook.com (2603:10b6:5:398::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.27; Tue, 26 Dec 2023 04:32:10 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7113.027; Tue, 26 Dec 2023
 04:32:10 +0000
Message-ID: <369acab0-b07e-48d3-ad90-c28969e8957e@intel.com>
Date: Tue, 26 Dec 2023 10:02:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v6] drm/xe: Add vram frequency sysfs attributes
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231222110631.999517-1-sujaritha.sundaresan@intel.com>
 <CY5PR11MB6211B2AC3B3E3B1A926252219594A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <CY5PR11MB6211B2AC3B3E3B1A926252219594A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0130.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::15) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|DM4PR11MB5421:EE_
X-MS-Office365-Filtering-Correlation-Id: 887da628-4d43-4164-e3ce-08dc05cba038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IGZJ9R+c5rPKiCcfzrSnDfHaz463oYIodpt50/mNIJZw44SF+ZIhMY51qSRWY9/oS/Pwz/4l7jjWlcU1pBOLJBup4FDxEM6qErStwIDmtdWpgPBTP3ET/C1L+BF+VKmlb5MTD/WxOp/YYCAdiqgsYBmXeSplxO9pWPrC1jtuDIfVh6omn3FxD9I8Yp9spUms/SruSh00Eqhb8wOVWQ5eLoDmxpQNntg03iEiLQZchf5udZgMTHZkLCZXt9q6VGec6QUFYzuJ4/t//SzFEsFvfUB+5lYDGCfQFfbzTCz0IseSIogSYuqo01sB8gBtAhTqzFjP8g3BmK3ty8AH76t2Z1aw0gQJz2ChVfkVjcBAuWyNOfFbiruqHH0z/aTpBwfZuawuXm7UcYW7heALG6DoUJ3sqOTkz8FAuu1mpPsUf7tRlTzhI7926TPLBA0gDP++AO7+CIgbwSwv+w3j6j8o+IoFb7I/9jOKcjnXmYQ1WnE7czGr9BWIYGz+bYyMLh7awRgAwvWjKsUk8Czr+dzJeLGa6uRRZ2Kb4nTozZ7C/d3PmPD0/DYSW69e2FsIaaJc2TM9fGNDZ9BBWyklWU6QxnKprny1hS3lSiQ/xaV3Sf1B9/AjpFpNHp5YckIZ/9cBWsO6OqcFf3a6TOohd1qRqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(396003)(136003)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(36756003)(31686004)(6666004)(6512007)(6506007)(53546011)(66946007)(66556008)(66476007)(6486002)(86362001)(31696002)(82960400001)(38100700002)(26005)(107886003)(83380400001)(2616005)(41300700001)(2906002)(5660300002)(8936002)(8676002)(478600001)(316002)(4326008)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXVvOGtlY0pScHRaVC9QSFdGM3ZQdmlEU0txYkNOYngwR2ZaeCtCYlNmaENK?=
 =?utf-8?B?cG8yTU1yeWllU2VjeGhrS0dGM1hORk05MmZ4SlU5MnVEY3lncmcvTHFYTWpT?=
 =?utf-8?B?QVlkVUYwcndXZE51WWt4a05pWGdsdVVzWjdRWVlsZkpicGtSeTJJQWZuZ3lV?=
 =?utf-8?B?aWZSYkVEY1VIeE13NnFDWndnRkdNSi94Ukg3WkFMQkZVK3JLa2pVbzNkNGZx?=
 =?utf-8?B?NmNvSWV3Q1NIQS9RcUpHdVpZMHpZaFhXb24wVkxuYTlGMG02VGUzdTdNUDRh?=
 =?utf-8?B?Yyt2ZCsrcGhtUHNFdHYySEhuZ2Z6L1A1bFNQd2ZBZmU1TTJlSjBsZktWa1BR?=
 =?utf-8?B?YWR3dWNjTHNBS1hQSTgzTFNVSHJTb04zRE1wUFlPeC9UblNqU3RkUkszRHFP?=
 =?utf-8?B?dzZlMlFzY05ENVRINTQ4Rktia0M3Q21mcjNVUVhwbVhSUlh5QVdDd1hKMEhs?=
 =?utf-8?B?MHM0eUxJRVphWkJlem5OOWM1SS9YKzU5UHBpdXZndDF0Z2k2bkYyMkx1SUdn?=
 =?utf-8?B?R2ZVVEg1UkFsQkFhL2RGSFdHcC9ZdEpXb0I1S3dRaDZKK1FFam5QdXRKVTIy?=
 =?utf-8?B?UFVNMjE0QW8vQkpVVUNVanV3bktEc0M0LzJncldSdUQ5NTZLM0Rjd045RXJi?=
 =?utf-8?B?dis1UU54ZWsyMStDK3FmK29oU3RJOWVWMzFyL0FzeW83aklGWmFHaGxpcGE0?=
 =?utf-8?B?VEpZL1d2Ny90NkxYV0Jsc3hnWGc5L3JBNUdEaXNnVkFVUGJ2VFpCencwR2F4?=
 =?utf-8?B?SndaaUVEY3A3QzAzQm1DeHkyMjQweXNXV1RTV0VVQnFublV0YU0zRkJLdUJq?=
 =?utf-8?B?R1VJbVI5NGJSSWRRR1NzMlFvQzlEUGlvQmY3VTlRWFJtR2wrbVllVU93dWtQ?=
 =?utf-8?B?RjNlS2h3R2lQYVE5ZnRLbmJtRXUra000eGl5S1huYTdzUjhFTTVOeklpdEZv?=
 =?utf-8?B?VXJpdVpJbkJTVXg4V0ljczN4UUpJak9DTjgvbG1uUUJteUh0ak5xRTJMOVA2?=
 =?utf-8?B?KzNlWDZuaW40Mm5ZV0g3a2IzMEVTTFlNSTkwTTFqay9wTnplNjBqb2gyYWxW?=
 =?utf-8?B?T0wxRW0wK2FseGY3QnRDcFFHR1FVTnA4dzhSL1ozOGdnZ0lnQ3czOTBXWVIw?=
 =?utf-8?B?K01RdWc0TTRDemxHQnRsdTZnTVNzbU1HcFZrUFQ2TGlQSEphRlZuK0ZTT3Q5?=
 =?utf-8?B?bzdiQjR2M0kxOEtFdXBEY2FUcnk1aU9FMW5wNno3TmFyamFyMStnWituaU9a?=
 =?utf-8?B?MmhjWWZOVmM1QWZDM2VNbE9wbmFZTWdKaGNtS1JEVy9vYUtCRXdBa2dUMmNO?=
 =?utf-8?B?WjVMVk1YcE1VRmx6aGllR1RCTWlwVVdjWEt3eUhQR3IrSEtrMnlFa1BSaXFK?=
 =?utf-8?B?ZjVGUU5UMjUwZW9ZendrTmtldjVORUhzWUkrUm5TQVRpNlpVUzYvRnNMR2ZL?=
 =?utf-8?B?MkZRUmpad0o4emJMTVpzV1prR2ZybEFueUZSUzZJYlAyRTV5K3gwR3hiQ3ln?=
 =?utf-8?B?Vm91VmxVb2Z0ejJZaEhzZ205S2w5UzFVSllUT2E4Qjg0eGdGQUFPVC9QVWtB?=
 =?utf-8?B?NkkyNTFRTGZaNmdvY2hkQnB3Rkw3MlBHSnpTUHZsSHRXQ0pIT3VVR2ZpaDRa?=
 =?utf-8?B?Y05sZnVGQlBjNVBBdVc2d2dJdTJkK09SWVV3Q05MdzBzNWRFTXNnQVJWbFJU?=
 =?utf-8?B?NWhmeDV0YTVzaHg5MTgralJaSCtOQnFXL1d2bE1JcEtOSkNzM2t2Z3M1d1pu?=
 =?utf-8?B?UUwzRHdweE9taUlGdzhrd1NrbHVxRHJNbmVyQUlFZWplQUV1TDZQdHExMTI4?=
 =?utf-8?B?aU9BWDBsMDdIZmdpd2hiVzdVREQ1a1p0NGJZdGt5a1l5VVpBL1F3K0psYkNG?=
 =?utf-8?B?ZlZ2TmxXZHpRWEhwQVNXRHNIeDByejNDcEZLVUliVFdwR1J5MGE0SEwxem1n?=
 =?utf-8?B?TWxKaUdSNnBqQzlZeUJndnlDOHd3bDFIdHJ1amplbi9kWERIV21GNHFId3Vy?=
 =?utf-8?B?R3NrS0hESmJCRGYwS25XUDhFM1RHYjl1Vkk5TkFZZVN0Uk10OHloNitIK3hx?=
 =?utf-8?B?dG5WN1ZXM0JsdUh3ajdUQVFIZE9BYlByM2UzVW5TZFU1YUNudVBMZUZ5UVFQ?=
 =?utf-8?B?aGJJVmpybGI5b3JQMWlBRGhVM3NDMUUxSHdKVncvSy9admRBMjNPZERIUmNF?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 887da628-4d43-4164-e3ce-08dc05cba038
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2023 04:32:10.8201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lTd9yK7V2s2cv5IY1T5fXDuVKyeHeqXVT45UVD/uOU2Xp5WAHNbKRWjs81yOGHFdVsm46CmCVpvUSJQDRxDRRYu5zocSs/pL2tpDJkBj+Gs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5421
X-OriginatorOrg: intel.com
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12/22/2023 7:34 PM, Gupta, Anshuman wrote:
>
>> -----Original Message-----
>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>> Sent: Friday, December 22, 2023 4:37 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Sundaresan, Sujaritha
>> <sujaritha.sundaresan@intel.com>
>> Subject: [v6] drm/xe: Add vram frequency sysfs attributes
>>
>> Add vram frequency sysfs attributes under the below hierarchy;
>>
>> /device/tile#/memory/freq0
>> 			|-max_freq
>> 			|-min_freq
>>
>> v2: Drop "vram" from attribute names (Rodrigo)
>>
>> v3: Add documentation for new sysfs (Riana)
>>      Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)
>>
>> v4: Create sysfs under tile#/freq0 after removal of
>>      physical_memsize attrbute
>>
>> v5: Revert back to creating sysfs under tile#/memory/freq0
>>      Remove definition of GT_FREQUENCY_MULTIPLIER (Rodrigo)
>>
>> v6: Rename attributes to max/min_freq (Anshuman)
>>      Fix review comments (Rodrigo)
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pcode_api.h  |  7 +++
>> drivers/gpu/drm/xe/xe_tile_sysfs.c | 86
>> ++++++++++++++++++++++++++++++
>>   2 files changed, 93 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h
>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 5935cfe30204..f153ce96f69a 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -42,6 +42,13 @@
>>   #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed
>> point format */
>>   #define	    POWER_SETUP_I1_DATA_MASK
>> 	REG_GENMASK(15, 0)
>>
>> +#define   PCODE_FREQUENCY_CONFIG		0x6e
>> +/* Frequency Config Sub Commands (param1) */
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN	0x1
>> +/* Domain IDs (param2) */
>> +#define     PCODE_MBOX_DOMAIN_HBM		0x2
>> +
>>   struct pcode_err_decode {
>>   	int errno;
>>   	const char *str;
>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> index 0f8d3e7fce46..cdc9dbbc97b0 100644
>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> @@ -7,9 +7,21 @@
>>   #include <linux/sysfs.h>
>>   #include <drm/drm_managed.h>
>>
>> +#include "xe_gt_types.h"
>> +#include "xe_pcode.h"
>> +#include "xe_pcode_api.h"
>>   #include "xe_tile.h"
>>   #include "xe_tile_sysfs.h"
>>
>> +/**
>> + * DOC: Xe Tile sysfs
>> + *
>> + * Provides sysfs entries for frequency in tile
>> + *
>> + * device/tile#/memory/freq0/max_freq - Maximum Frequency, not a
>> configuration and read-only.
> Let's increase verbosity of doc something explaining it is a fixed fuse point not a configuration.
Sure
>> + * device/tile#/memory/freq0/min_freq - Minimum Frequency, not a
>> configuration and read-only.
>> + */
>> +
>>   static void xe_tile_sysfs_kobj_release(struct kobject *kobj)  {
>>   	kfree(kobj);
>> @@ -20,6 +32,65 @@ static const struct kobj_type xe_tile_sysfs_kobj_type =
>> {
>>   	.sysfs_ops = &kobj_sysfs_ops,
>>   };
>>
>> +static ssize_t max_freq_show(struct device *kdev, struct device_attribute
>> *attr,
>> +			     char *buf)
>> +{
>> +	struct kobject *kobj = &kdev->kobj;
>> +	struct xe_tile *tile = kobj_to_tile(kobj->parent);
>> +	struct xe_gt *gt = tile->primary_gt;
>> +	u32 val, mbox;
>> +	int err;
>> +
>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND,
>> PCODE_FREQUENCY_CONFIG)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1,
>> PCODE_MBOX_FC_SC_READ_FUSED_P0)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2,
>> PCODE_MBOX_DOMAIN_HBM);
>> +
>> +	err = xe_pcode_read(gt, mbox, &val, NULL);
>> +	if (err)
>> +		return err;
>> +
>> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
>> +	val *= 50;
>> +
>> +	return sysfs_emit(buf, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(max_freq);
>> +
>> +static ssize_t min_freq_show(struct device *kdev, struct device_attribute
>> *attr,
>> +			     char *buf)
>> +{
>> +	struct kobject *kobj = &kdev->kobj;
>> +	struct xe_tile *tile = kobj_to_tile(kobj->parent);
> If you are missing to create a kobject for freq0 , then this should be
> kobj->parent->parent.

I don't think a kobject is needed for freq0, since it we are only using 
attribute_group for it.

Similar to throttle_reasons.

>> +	struct xe_gt *gt = tile->primary_gt;
>> +	u32 val, mbox;
>> +	int err;
>> +
>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND,
>> PCODE_FREQUENCY_CONFIG)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1,
>> PCODE_MBOX_FC_SC_READ_FUSED_PN)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2,
>> PCODE_MBOX_DOMAIN_HBM);
>> +
>> +	err = xe_pcode_read(gt, mbox, &val, NULL);
>> +	if (err)
>> +		return err;
>> +
>> +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
>> +	val *= 50;
>> +
>> +	return sysfs_emit(buf, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(min_freq);
>> +
>> +static struct attribute *freq_attrs[] = {
>> +	&dev_attr_max_freq.attr,
>> +	&dev_attr_min_freq.attr,
>> +	NULL
>> +};
>> +
>> +static const struct attribute_group freq_group_attrs = {
>> +	.name = "freq0",
>> +	.attrs = freq_attrs,
>> +};
>> +
>>   static void tile_sysfs_fini(struct drm_device *drm, void *arg)  {
>>   	struct xe_tile *tile = arg;
>> @@ -32,6 +103,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>   	struct xe_device *xe = tile_to_xe(tile);
>>   	struct device *dev = xe->drm.dev;
>>   	struct kobj_tile *kt;
>> +	struct kobject *kobj;
>>   	int err;
>>
>>   	kt = kzalloc(sizeof(*kt), GFP_KERNEL); @@ -50,6 +122,20 @@ void
>> xe_tile_sysfs_init(struct xe_tile *tile)
>>
>>   	tile->sysfs = &kt->base;
>>
>> +	if (xe->info.platform == XE_PVC) {
>> +		kobj = kobject_create_and_add("memory", tile->sysfs);
> How freq0 is getting added, I am unable to see the freq0 kobject as per the path  "device/tile#/memory/freq0/"
freq0 is being added as an attribute group. It is similar to the 
throttle_reasons implementation.
>> +		if (!kobj)
>> +			drm_warn(&xe->drm, "failed to add memory
>> directory, err: %d\n", -ENOMEM);
>> +	}
>> +
>> +	if (kobj && xe->info.platform == XE_PVC) {
>> +		err = sysfs_create_group(kobj, &freq_group_attrs);
>> +		if (err) {
>> +			drm_warn(&xe->drm, "failed to register vram freq
>> sysfs, err: %d\n", err);
>> +			return;
>> +		}
>> +	}
> Don't we need sysfs cleanup and kobject_put in tile_sysfs_fini() ?
> Have you made sure kmemleak won't complain here on memory leak ?
>
> Thanks,
> Anshuman Gupta.

I have already checked for mem leaks during the cleanup. The kobject_put 
is not needed.

Thanks,

Suja

>> +
>>   	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>>   	if (err)
>>   		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed,
>> err: %d\n",
>> --
>> 2.25.1
