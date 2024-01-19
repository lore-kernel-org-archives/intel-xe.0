Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06F2C4725D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 12:22:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B6E10E1A8;
	Fri, 19 Jan 2024 12:22:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D37910E1A8
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 12:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705666934; x=1737202934;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KKt+Wybr6di1+63zQGKlmYWtbcf8Exjipz6hjfUrraA=;
 b=NaRu5gMc24L2PsckpKkiBiXtavo9ZW9KwYMzkY6uWCFWe2KLlyVSg4O5
 x1At7AVTbSWjWsN2erL12Dd4PhTNtVLxW7yYhlIQGmN5yNpRjzzGgL0t5
 5hbAfNQ/VYHrMvjT8c5GxOrZMqGEriBcsZqdmDOk6pWdc3bWSiQsBqvE5
 PpApS+JTIZCFvAa2H7rzN7HC1tO48HiCTJbCp+yx0g3VGZP8+tn/ojTUo
 2G1jKqmVihzVeQPch5V5nLIiLKXDqzXnbirs/YUR3tkTI0yG7Dq5a+awB
 hAXy6lZebUBetaFpJLvuJv9Wdc7d/1czKf3pZ0eS7FiUHx6T7JeqXNIIj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="22223244"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="22223244"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 04:22:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="583760"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2024 04:22:15 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 04:22:14 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 04:22:13 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 04:22:13 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Jan 2024 04:22:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8FeAEJPPBPo4HOovMapWSZIU69v0gIO+OhfN6VQ6KdyLbMsGPOEM21bgFHl1/6fXejbxYnco0DVuZVBMcqtNTNu3jEFOtQNhnXl9PPWKbKOBumjUr5yLqLJ/CFib3uv87X13EYugUNDXOFKflDSk+nM+zbNILUG6XqaYEJOmOxC8cLLcZCc1ghKVPbnkyfF2+LZUer9Vwm5Ha8Paoa8kr2JQV/9fDgeb9/qg64s1tYR1WJCxLRVh18Hyn+ygXzKnEDCPSTo9sp0CUZAoTZgzu1aPvsw5wEN2rn0dw0Uqwd4e+Tzi+zAe7tXVxbtzxsaFmg/6gTrT95C4UMwpylFUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ua5QHA4xh/y5zvg0++8fPzTF03ZpABYXcAR0a05RB+Y=;
 b=Wx7DlW97a26u2AwwouaeJKdGYMWVFUsrIO4dBfqfElHc3nrckusmvl4+trR2bfUtUzQwj68GTN+t0A3Xy5cGXkKvQ4KslSGFwleZk1xmrFMshAk1IabngUeC31ksF/CHC0hnLUQYGrdehrjxEDu5DnC7Ls2VS0TaTjhcG+990G/SSS4fjvHriezKrlG3YImwYWkS9lEksQGYoYJicN8qioeh7QeyVq0nPdJSXo12lCdjVII60SLfuiJbWvvgs7PUCW2nKN/MwxxMSLTAo167TQVsXSpHScfRk8w0UX958q8GcrffFSPWZ0ek1JkJ8s6BE46eo/xQDHti7PQs76pLNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SN7PR11MB8261.namprd11.prod.outlook.com (2603:10b6:806:26f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.26; Fri, 19 Jan
 2024 12:22:11 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 12:22:11 +0000
Message-ID: <9a0b1e1d-7ff8-4d39-a6de-c547033c70f7@intel.com>
Date: Fri, 19 Jan 2024 17:52:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/debugfs: Expose debugfs entry to check guc pc
 support
Content-Language: en-US
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240119081852.1858212-1-badal.nilawar@intel.com>
 <CY5PR11MB621172B0F827E4FD706646DB95702@CY5PR11MB6211.namprd11.prod.outlook.com>
 <d4620fae-0316-4881-ac03-cb4d6f99b01b@intel.com>
 <CY5PR11MB6211834CA364535838F7EC8095702@CY5PR11MB6211.namprd11.prod.outlook.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <CY5PR11MB6211834CA364535838F7EC8095702@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::8) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SN7PR11MB8261:EE_
X-MS-Office365-Filtering-Correlation-Id: fe979602-f997-4164-c78c-08dc18e9433d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ecO5lLGcyaSL9cfS9hXWpr2d7PZ3evX7ifr7Mi7FtgkjEf/Cbege66lebLMqCsVbO7iLHmurSv3fFBEFBdHMTK42Cdd9e+3mgWrI8nI1ycIb1HLiKIq8I6BQJdB1/9apgnM+G1AmV17D0n3TLbYP1ottlKwQQ53upndznHBL0CCNpcPBcV9suf+erEzsxjvevgoz2Big4o7xrLmHiQktG2WD5dxq82CbtIxh7NTt3/3eH424+c4Pi9/AxMK8vb+IluN7MMERY/aZpgOx7heGe8yeTO5AL2ERot4Sk1CyVc0hkfHrDVXZo4+vZ3QZfrrYN2aklm9wfBzaUNfPLiDB2OdCs9GM1A9BLURd9h28MRJ8CqlQXFIQpPH1323tEABdP/yO1j/6Wm821Rf7CwIKfNywwv2EITydgiQ6zUUE5g2EAttv+KR1CiCsFYm/dQTZBZHzOk57NFzoPCYUAzTdXQbj3mRKWDrirJIfUKhh6FM02o2TwW2D//ZuSolGVjepwK87B7ulYNaYLG13vp2IiKzQaMGsNTSq4tkYQ3/cV/lreD4ujEaYMjo4juFNU+2hLyHcTZRXPy3F4Z025YS70LpshTUUxIlVfs33VZ3ucqvG8fd3KpiTNjD5cRhTYS29bJXXw6iPstzGTpAui13nww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(396003)(346002)(376002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(53546011)(2616005)(478600001)(26005)(6486002)(6506007)(6666004)(6512007)(107886003)(83380400001)(2906002)(5660300002)(41300700001)(66556008)(66946007)(66476007)(316002)(110136005)(54906003)(4326008)(8676002)(8936002)(38100700002)(36756003)(86362001)(31696002)(82960400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEwrZDhNRnZtZHROR0ticVZ2SXRpUi9aaVY2Lzg1eHN5cENXSHAwODRiRmhm?=
 =?utf-8?B?VWVlWWRmVSs4QjQxbGF5RE1CNDNib2pGR3AxSGpqVjVTb2FkZ2JTSStlakw5?=
 =?utf-8?B?WHZCV1RvcWhjMXNZeWFraHJabUc1R2F4Z29mbnJOOG5PMUU0aVJwcXpjUGhS?=
 =?utf-8?B?RXhVNDdyOVVrMnAwd1hHdkdERGRoMlQrOHpRSTE0WjA0RUZFWDRGeTNOTkVH?=
 =?utf-8?B?MlMrSkJEMDVXZlAxUk0rcGlBZDUwVVZXdGxGb0Y0M3FEVDRhUjhlbUs4R1Vh?=
 =?utf-8?B?Y1RBV2JPRUFhQzBRQ0JOK0J3a3NtekxXbDVMYTRacTN4dFZPZngrV1JOcC8v?=
 =?utf-8?B?eWo3OW5YdHdoWGt6YldpRW9CUW5FWm5haEhGQnJReXZkNU9taUdzaHM3L21J?=
 =?utf-8?B?eXUwc01wcjM4TC94UzUrakxlMnZPWksvRXZod3c4UVZPMEFMdHdxRkNIV1g3?=
 =?utf-8?B?WVk1YTRTeDRUczF0M2QyQ3ZSWnB1a0RoQUE4N3RpNzRiMDZiV2c1TmpWWVZ1?=
 =?utf-8?B?T2NVMkpKZ1N0OHg0R0NnOW96V1Z2eHE0ckFxejNTL0RJWnFZZ2YxMUxXdCtq?=
 =?utf-8?B?cmRTQXRNR3pEZC9WSklzeVZVdk1FNys5VjdqTTJJT1JvV2RuMVRGbUtDWmFT?=
 =?utf-8?B?dUtqdUE4ZFJqMzJldDJSMUd6UjQrTVBIbjRWVXhtLzN6ZjlUZUJrUmJFQTB3?=
 =?utf-8?B?ZkJ1R2duc2dBQklvb0dPRXp5Z1VQNnVqRCtVQVZvNnZ0UDNPQWtZd1JaSDUz?=
 =?utf-8?B?RlJOZU84V3RFYjBUbkczZXc2eW5kejVuYkhYN2xVVTBJQlc0YndYWFZRU241?=
 =?utf-8?B?UGZJM1JQc3VrdGNIZ2FXVnBicVlBeWtIcXk5SUZBM3FDNFVOVElSaE5sZzlr?=
 =?utf-8?B?d0VqQXU0WDJKZXlmaUJIMXZRZTZNM3NXKzBIRkJJVklEK2ZsMC9Oc3ZnUFNq?=
 =?utf-8?B?NFFzN3hJdG1DdzJpWkpEUHpwQ1ZwdkhDZDFVZHJEY3I4MnVwQVZyTDdRNzlm?=
 =?utf-8?B?UTVRNVRIS1BUbDhydERtWGNhZGhwV0pPY3FYQ1pGb1hmbEJiS1ZzeUhuU21B?=
 =?utf-8?B?SkZBSVczRTNFQ096ZkJ2MlkvaVVPbkY2T2pyQWozWTdWWVBoRloxaUFlZkJ5?=
 =?utf-8?B?U2RCRHkxOU9oZVNSUFJwN1JEU2RWSm5lN3FFVUd0MFJGU3l2eWVhTW5BWTZ6?=
 =?utf-8?B?RzNsM2hvd2YrQmFtbEVmQUYxWlpKMGhYT3I5UXk2OGhVdktieU9aNTI2cUxq?=
 =?utf-8?B?cGNEbmY0ajBoNzBndWFIRGJnekhURm41bG9tdUVzVmZCdHJZYkRmS0JRMmRY?=
 =?utf-8?B?SFBsNi9JcnVGWGFZeThDdzgwUDB2Zi9EWEJDYkhxRHRpZVVteVJlT3lDS0Z1?=
 =?utf-8?B?VGtTR09sbjd0NGtmeWVyTEo1SmRMaVNreEhSOFJpUC9La3N6bmlkZ2s2TDJy?=
 =?utf-8?B?NHUyTldGMFRQbkFHaEtGbjZvV1kyZHBsWisvc1dyMG5EZFFxUEtNaTVzaFV6?=
 =?utf-8?B?QnNaTDh3RkRXWkZGSVdBTklTQTd2TUdNQ1EybSs1T0NxTlU2S0ZWVVd3RDBK?=
 =?utf-8?B?WS9WbGVJdloxZnlvU0d0WjNTZUVMdUwwZ3A3RjIwL25neUJuMmlrYmFUUDRm?=
 =?utf-8?B?YTNGbmVHUkdzcGQxcGgvdHVPWmRCSTdKM1hZTC9qRm52R1FSaVFLbVFPSGxt?=
 =?utf-8?B?ZTAycEJCU3hkQnNsUkIrTE9FdnoydmNEdGVRRG9tSHlaTENTRXdwQ09vVnNi?=
 =?utf-8?B?d3JGdUpobDF0NHVNU1l2bWZVR2k3dzl0TDdTejF5YUdrMWxDUloyQWVLNUEv?=
 =?utf-8?B?aC92MzVlWEFaY3l0NE1lbkdPcVd0alp5WEI4bzV3TmowMktyRGZqUXZweUpx?=
 =?utf-8?B?cWNFbXBBU29vbDIwdEZ3dElZL084Zm1SYmJIRXlHaXdkUElMKzEzWHJhUUsv?=
 =?utf-8?B?cnlnZXYxeHVNa1FBKzZVRVo2L0RBYjJqS1lSMis3UzFPTVFlUGV1ZEY2NHdU?=
 =?utf-8?B?b2ZaM3ZUOEJpYkt3NEhKZ0l4ZVNxeTcxUGt6dHpNQmNkWmVDK1RwcHhhUEtF?=
 =?utf-8?B?TS80TjlwakNlNGVWdG10eG5JZXlINnFjbGs4MEt3MkFWSWg3cThhdXhPbGdJ?=
 =?utf-8?B?WVo2V2RrTzZvdndPK0RKejdYVXRnUU9vRktaTmU1NFBWUnVtOUJzbmt6Nlpw?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe979602-f997-4164-c78c-08dc18e9433d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 12:22:11.7744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PiewvrUc5tMPaOwzJy13c9G/7NemryVh/6784fhV+WExFh1yim2b+UoBwbzcPbsLHFYDD4LyzNVbjsFcmwX4VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8261
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 19-01-2024 15:05, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Nilawar, Badal <badal.nilawar@intel.com>
>> Sent: Friday, January 19, 2024 3:01 PM
>> To: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Roper, Matthew D
>> <matthew.d.roper@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
>> Belgaumkar, Vinay <vinay.belgaumkar@intel.com>
>> Subject: Re: [PATCH] drm/xe/debugfs: Expose debugfs entry to check guc pc
>> support
>>
>>
>>
>> On 19-01-2024 14:58, Gupta, Anshuman wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Nilawar, Badal <badal.nilawar@intel.com>
>>>> Sent: Friday, January 19, 2024 1:49 PM
>>>> To: intel-xe@lists.freedesktop.org
>>>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Vivi, Rodrigo
>>>> <rodrigo.vivi@intel.com>; Roper, Matthew D
>>>> <matthew.d.roper@intel.com>; Dixit, Ashutosh
>>>> <ashutosh.dixit@intel.com>; Belgaumkar, Vinay
>>>> <vinay.belgaumkar@intel.com>
>>>> Subject: [PATCH] drm/xe/debugfs: Expose debugfs entry to check guc pc
>>>> support
>>>>
>>>> Expose debugfs entry to check if platform support GuC PC (SLPC) feature.
>>>>
>>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_debugfs.c | 8 ++++++++
>>>>    1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
>>>> b/drivers/gpu/drm/xe/xe_debugfs.c index c56fd7d59f05..2f474bf0e7c7
>>>> 100644
>>>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>>>> @@ -30,6 +30,13 @@ static struct xe_device *node_to_xe(struct
>>>> drm_info_node *node)
>>>>    	return to_xe_device(node->minor->dev);  }
>>>>
>>>> +static int is_gucpc_supported(struct seq_file *m, void *data) {
>>>> +	struct xe_device *xe = node_to_xe(m->private);
>>>> +
>>>> +	return (int)!xe->info.skip_guc_pc;
>>>> +}
>>>> +
>>>>    static int info(struct seq_file *m, void *data)  {
>>>>    	struct xe_device *xe = node_to_xe(m->private); @@ -67,6 +74,7 @@
>>>> static int info(struct seq_file *m, void *data)
>>>>
>>>>    static const struct drm_info_list debugfs_list[] = {
>>>>    	{"info", info, 0},
>>>> +	{"is_gucpc_supported", is_gucpc_supported, 0},
>>> Above debugfs is per device.
>>> We need this debugfs for each gt.
>> The field skip_guc_pc is device specific so kept debugfs device specific.
> That make sense but then it is better to have a print in existing info debugfs
> as this is filed in xe->info ?
>  From igt we can grep the skip_guc_pc either "Yes" or "No".
This make sense. I will update and send new rev.

Thanks,
Badal
> Thanks,
> Anshuman.
> 
>>
>> Regards,
>> Badal
>>> Thanks,
>>> Anshuman.
>>>>    };
>>>>
>>>>    static int forcewake_open(struct inode *inode, struct file *file)
>>>> --
>>>> 2.25.1
>>>
