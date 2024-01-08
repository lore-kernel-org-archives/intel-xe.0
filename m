Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8919FC3DA6E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jan 2024 07:10:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4637F10E06E;
	Mon,  8 Jan 2024 07:10:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3480F10E06E
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jan 2024 07:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704697835; x=1736233835;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ryUKAVU7F8RTqgMxRrtMMMRYfNZ96zx0lQ1eSPVPzd8=;
 b=GfCT0G/gErR53HP69yDEAV5CQkDm6BPhfqdtscWbuJKrmYX+FG0EzEtr
 xwgOVXjAzqv3bqpA779al7XByeA4WmJrKaJAHFq4qRkK5PBTroLn6QMBU
 chhU/rdnjhTkKXICx5oMWJewJeG603X0wEvWhBDD9TlDIrz0BYY7I8vwS
 ziM5ibu2V/2k9mWENrEtNJ4UPkBUxrFV7Mxugi9p0mHK5MNKmmUSnLpkq
 rxgVcIK4W9TvhTw2zy+UAzD2ZYeX8zrH4mfJLL/oSB2qJKfryJKcAfUVE
 uUrqcHLFOiLj/zwKI7g+gKL7talR9NhO1R+RZPfDWPYap2dr89kXjYElW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="4570481"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="4570481"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2024 23:10:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="1028315327"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; d="scan'208";a="1028315327"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jan 2024 23:10:34 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 7 Jan 2024 23:10:33 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 7 Jan 2024 23:10:33 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 7 Jan 2024 23:10:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dl9QClIBhTBIYgShF4xEO7Rv76GuirauYD2rrN8CqiSrHcI7ZZpgUeiE0NhA7r9L5QIeqT4e/sd89GbvY5i48cm0288LB0U67KrI1pAFSJoXYrlriwh6NFbSIrUTDEWhvd4/lQC14rYumL5gBjWdzdZnrEMngkDdFAaxvjn53wd+zGFne8W3rdL/UDNB1DYqIxgF8BbL/IQB0J0odKoscQuXj67ctfYNjJlonMjiN3pQZFEwZetZpp4lnZFR9T/h5WCpfW3LTR+BoiMz6niU7Uis96FZTFmcnX8XNn0wuhcjLInOMoHey3pUHuppSrj76obMS3CAHCFIfY35F2NUlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L48D/bET4P6AM8ejElolTeqA4oHrhivD0pIK5amOTRE=;
 b=WWPnN/WbMuptHUfLvbAOel0/YQn0KUqKlkxm0idwXOe//wtSpfIaT/Wj8e6d7oXB87wl6R/EDJHaMBFlEQQ1km9tp1PgCueDpMTN7pKqL6osqVwOsm7ehZHum4Hk3VyUjiTcGpb9ITMHqDaGQpvkrEeDuE6e+hyajeYiTdCBO0W7CSbzEpINHKkc3Szavk8caOpcAhkCSExBpZIym4PT9hPOkSCVf6l3HVMYZBZd1r2m04Jk7kdKcPWrPckLlJFVi2FTqfaZBZ7KqHXtJqv/Btcd2b+gpKc3fe+yn+r0x9iChLk5YtELOHwBr9aiv01tfq1vGbLIKorNvq3wOE214g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 07:10:24 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 07:10:24 +0000
Message-ID: <a2a7734e-98f8-482f-bbb8-29483d67f283@intel.com>
Date: Mon, 8 Jan 2024 12:40:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v8] drm/xe: Add vram frequency sysfs attributes
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240105124503.1821966-1-sujaritha.sundaresan@intel.com>
 <583d82e9-ea11-448a-ab1c-4fda27eda143@intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <583d82e9-ea11-448a-ab1c-4fda27eda143@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0209.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::20) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|SJ0PR11MB4878:EE_
X-MS-Office365-Filtering-Correlation-Id: 9403fcdf-6341-471d-6e6b-08dc1018e1fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YxSrTiKtYD0O0/I+gdtCaKE/inI+MhvLrYloJCnRncNONyq5GFSGQCYqcNr/WGbL1GNqGit7myYe+O2bZSQLRRsIQalrLaqsXuYpeZLIHmy5y4aR3uXk3xYyhprMq7Job7xhXAQ8GJlOw+bzH5D611cv1WPNrWdmbHN4YwYKcKGaASNwBaNjLkHNXixAOMIQPAuFKEX3WkynPgRGhazoCjQk4NAbR+z9+F8OZJXZgwwQnrBexiUhccjNEV9nKacZNsVq5Fjn5BT+fbXjfzljOLFKZqeMZOK4DjkpmJiKBQVkvRh2CZ9BSUV/q/WpcA23Wxri5adJQ7LsQPDLubgZ05QdYSJAJXBXbcil+1RHCNTB7c3sn+O3a9k0h6sDKfEBWkmoimEYfSMnPJgnB0aqawWX8cuB9l2vFwNw4ZyKwUOK3zBzkA1IW2Wp8SDY2Z57MxRzfSI8zFonW4sk+CyZBhAl23LfWep+znhwR5IEayR9gPYKPDKWr5caW4TG0FqmXGzvUq7JKR3gDqGUmF9F8WYt7II0g4WYaT0bUjlwcuvrVYE/cMCzFDuPi8+cY6pSCktKBBtH0bVjI2QKZGHWDgd4igJvtMQ0d/iRt19x/KQpgbPFjN7yrdaOEXOxEc33KvvGB33ufn0VCn9PbWhy1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(346002)(136003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(31686004)(26005)(53546011)(2616005)(6666004)(6512007)(6506007)(478600001)(6486002)(38100700002)(86362001)(31696002)(36756003)(82960400001)(5660300002)(2906002)(41300700001)(66946007)(66556008)(66476007)(316002)(8936002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3BMakhMRUdkcldveDREOG5jTG5IcjltYUlVVDdWOTBHM3NmL1N5VVQ0Ym9J?=
 =?utf-8?B?QmdzVzNORmViNzJzZ0tWZE9ia2IvZmYzSS9Hd3F4aDBmRzdITEpPRWJ5VlAw?=
 =?utf-8?B?U0hhM3hVUDJ1bFJvcE5wUzg3MWdTSnhCQWk2aUU5T0RmZ0c2U2hFcEZrOFhR?=
 =?utf-8?B?YzJYZUZFb3BPT1JGSEpFWW5oRWRaVG1ZOGJWK1IrYzVpcEN6blE5K1d4VXhZ?=
 =?utf-8?B?VHd1eHIxYitlRFMxL3NVaTNLRkpYQTUwNmJrUG5uNUJINC9pMTVRaTJaZE45?=
 =?utf-8?B?RjYzTm1CY0JoNU53elNCdjhzVjI1MHpZRDc0UWFzVzBzNW03bnNDY1JyTnRu?=
 =?utf-8?B?cWZLOWVWQXJGMzc1akhnRmFnQnRpd1NqdG5NWmVjSDdLUkJ1RDczZnBpS1dn?=
 =?utf-8?B?SnRnZkJsNWdIaFM1NE8wK3M4eFdZMlhIY2dLN0Y3dG80ZlBCSE1oYlhEbVln?=
 =?utf-8?B?ZlNMK2t2K0dMb1lhUnNpRks3clJheGdVQ3pyZmUrSmZPVkFJOG9DdVB6bmZ3?=
 =?utf-8?B?L1lhV1ZnVFpQVXdqMksxK1luclRDdWw3YktyVTVPSGZKSzdkNDFyNVVVUlJ0?=
 =?utf-8?B?MllHeUJIdXpWeEZmQVFPb2piZmRncTNsVEU3azVRSDNhOFphekZWSWQ4dXdY?=
 =?utf-8?B?TUZBcU5HYU4xSzJuY2pscTA4U3lEbTJ3eTRxckNHbzRVVUdGNTZJcTZMamdR?=
 =?utf-8?B?ZFMvSlpYaG16YTlLdk9ZNk9KRXlibUVkeUZoQW8zR29TSC9VYVJMcTlEUGls?=
 =?utf-8?B?b1dVazdyUTJNTFRrZjE5NUMyV1VVVzMxNEFOaEd4Mnh5aDlqdkxHZnJXV2Jl?=
 =?utf-8?B?a2xOMjNVK1ZSU21aaTZaQ1FOZjZmeTlrVTlCajZMWEx2enpPN0tkRFRudEdQ?=
 =?utf-8?B?bWJCZDFETElEREpUdVo1Uy9VdVVmUTN2QUVGYjZ4K0xZUnlxdVhPN0ZKeGR1?=
 =?utf-8?B?b0NrV01lYkJLZXUraFkxT1JKNEI2d2JxZlViMHNDTzh3WHJzVS9ZNlIxVWpw?=
 =?utf-8?B?bEtnUzdPbFZZL05UQnR3SDhhUGsxbG1hUHRPWWN1ZE9yUi9PR0l2WkhjZGlG?=
 =?utf-8?B?enJaQjBQOE9DbzBJWko0K004d3FhMVBxdUkwR0V4V1JjbUhPOVE3ZVdSeWJM?=
 =?utf-8?B?d08rZGRVWkVVNHFJSStpQWU0RHlCQlFNZnFDRW9aVnZKcXExV3BEN2dwd2Fv?=
 =?utf-8?B?TU0yZ3p2VDdnSHB1T3E4VU83bW9SOVhuWEVNditKMzR4STFLSk1HMnpaN0Uz?=
 =?utf-8?B?dmVLVVpQT0JheHdOR1d2V0thc2x0cUkzL3l4T0V4djJjRWNRcHF0aFJrUU53?=
 =?utf-8?B?UDhiSW8xV1R6cDVwcXExOUU2alZlSEhxN1FCakxEL2gyVFhtb0p0UEMwaGtv?=
 =?utf-8?B?NzdLZGkzY3ZkdGJvWDFTdThQSm5aemVWbW82ZTcwRjBYWEJOMmlNOVh3OVdD?=
 =?utf-8?B?NnJRakw0aU5jckJUMGR5RVpyWTE3NGdET2VWSXNvUWo0M3VDOHdCNWFFLzRH?=
 =?utf-8?B?YjgyZ1pMQXdsbHdBanNFdDJLeFFMR0xkMVhyMWpvUnRGUG5YWEF5eG1ha2NT?=
 =?utf-8?B?bitWblRSQmIyODIwSjdhRnJOTmExOE1VSVJmd1NXQkZmV003Y1RBYTJmb3Iw?=
 =?utf-8?B?YUcyRUJrTFFDU1piZUhaaFVyNFNoVTd2RHdLbGVLL21IQW0rVmIrUlYvWmVy?=
 =?utf-8?B?T0VIaFo4d2JVem1RT0pWSU85dkNsRDV5NW8yM2ZDRnhXWFJKUkI4Y1BLTnha?=
 =?utf-8?B?QURlQy92a2k1OWJyeFpXbFB0bzc2K1ZIbmNPMkhSNzVQOGZFWEhOSmVlZXkw?=
 =?utf-8?B?OVdtTEJESkpqeUhJMjlyUFBicDFKUHVBNEJ2Q1l2OWZjdlQ0SERadS9YQXhH?=
 =?utf-8?B?emhpVzh1Q3hGS1ViNndVeW9lKy9hK2xpbUhFNDZXWWprcTFCZ0U3K1ZPMDly?=
 =?utf-8?B?MlA5bFNPUEdZZFlTRmlWMlVaWi9ZTlp5NHdXN0ZaZ3pkUm4xRWo4OEE1NjJF?=
 =?utf-8?B?NjM5Qmg1TGVVdVRnRWNBVVBYSWIybUxjdmI2T1dNL0lFa1JoT3p4Tm9aWlND?=
 =?utf-8?B?Z3N5bitIYTdZNUQrbGhSblo4elY3TW1ZbjU3VzNKU2xVeStqS29tZUZTWm9D?=
 =?utf-8?B?cTEyTngxVnpaRnFHcHIrNnNFcnVReE5USVo4OFlJeXFheGdBcU53T1dydXBF?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9403fcdf-6341-471d-6e6b-08dc1018e1fb
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 07:10:23.9826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aF4qeWJcwitjc9ymODQ/Rk832MXw8+MgEqN9gRUocikfRqRTZjk4yWwFpfrt0dCF5nAXXAyTMCV7ZoRMtdG6x653b3NOfaGWfOSLfW88PNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4878
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 1/8/2024 12:13 PM, Riana Tauro wrote:
> Hi Suja
>
> On 1/5/2024 6:15 PM, Sujaritha Sundaresan wrote:
>> Add vram frequency sysfs attributes under the below hierarchy;
>>
>> /device/tile#/memory/freq0
>>             |-max_freq
>>             |-min_freq
>>
>> v2: Drop "vram" from attribute names (Rodrigo)
>>
>> v3: Add documentation for new sysfs (Riana)
>>      Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)
>>
>> v4: Create sysfs under tile#/freq0 after removal of
>>      physical_memsize attrbute
>>
>> v5: Revert back to creating sysfs under tile#/memory/freq0
>>      Remove definition of GT_FREQUENCY_MULTIPLIER (Rodrigo)
>>
>> v6: Rename attributes to max/min_freq (Anshuman)
>>      Fix review comments (Rodrigo)
>>
>> v7: Make documentation more verbose
>>      Move sysfs to separate file (Anshuman)
>>
>> v8: Fix platform specific conditions and add kernel docwq (Anshuman)
> fix typo before merge

Will do thank you.

Regards,

Suja

>>      Fix typos and remove redundant headers (Riana)
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile        |   1 +
>>   drivers/gpu/drm/xe/xe_pcode_api.h  |   7 ++
>>   drivers/gpu/drm/xe/xe_tile_sysfs.c |   3 +
>>   drivers/gpu/drm/xe/xe_vram_freq.c  | 129 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_vram_freq.h  |  13 +++
>>   5 files changed, 153 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_vram_freq.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_vram_freq.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index df8601d6a59f..17884e422cec 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -139,6 +139,7 @@ xe-y += xe_bb.o \
>>       xe_uc_debugfs.o \
>>       xe_uc_fw.o \
>>       xe_vm.o \
>> +    xe_vram_freq.o \
>>       xe_wait_user_fence.o \
>>       xe_wa.o \
>>       xe_wopcm.o
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h 
>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 5935cfe30204..f153ce96f69a 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -42,6 +42,13 @@
>>   #define        POWER_SETUP_I1_SHIFT        6    /* 10.6 fixed point 
>> format */
>>   #define        POWER_SETUP_I1_DATA_MASK        REG_GENMASK(15, 0)
>>   +#define   PCODE_FREQUENCY_CONFIG        0x6e
>> +/* Frequency Config Sub Commands (param1) */
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0    0x0
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN    0x1
>> +/* Domain IDs (param2) */
>> +#define     PCODE_MBOX_DOMAIN_HBM        0x2
>> +
>>   struct pcode_err_decode {
>>       int errno;
>>       const char *str;
>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c 
>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> index 0f8d3e7fce46..ed60d12f5cf0 100644
>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> @@ -9,6 +9,7 @@
>>     #include "xe_tile.h"
>>   #include "xe_tile_sysfs.h"
>> +#include "xe_vram_freq.h"
>>     static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
>>   {
>> @@ -50,6 +51,8 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>         tile->sysfs = &kt->base;
>>   +    xe_vram_freq_init(tile);
>> +
>>       err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>>       if (err)
>>           drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, 
>> err: %d\n",
>> diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c 
>> b/drivers/gpu/drm/xe/xe_vram_freq.c
>> new file mode 100644
>> index 000000000000..ea8b4511767c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_vram_freq.c
>> @@ -0,0 +1,129 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +#include <linux/sysfs.h>
>> +#include <drm/drm_managed.h>
>> +
>> +#include "xe_gt_types.h"
>> +#include "xe_pcode.h"
>> +#include "xe_pcode_api.h"
>> +#include "xe_tile.h"
>> +#include "xe_tile_sysfs.h"
>> +#include "xe_vram_freq.h"
>> +
>> +/**
>> + * DOC: Xe VRAM freq
>> + *
>> + * Provides sysfs entries for vram frequency in tile
>> + *
>> + * device/tile#/memory/freq0/max_freq - This is maximum frequency. 
>> This value is read-only as it
>> + *                    is the fixed fuse point P0. It is not the system
>> + *                    configuration.
>> + * device/tile#/memory/freq0/min_freq - This is minimum frequency. 
>> This value is read-only as it
>> + *                    is the fixed fuse point PN. It is not the system
>> + *                    configuration.
>> + */
>> +
>> +static struct xe_tile *dev_to_tile(struct device *dev)
>> +{
>> +    return kobj_to_tile(dev->kobj.parent);
>> +}
>> +
>> +static ssize_t max_freq_show(struct device *dev, struct 
>> device_attribute *attr,
>> +                 char *buf)
>> +{
>> +    struct xe_tile *tile = dev_to_tile(dev);
>> +    struct xe_gt *gt = tile->primary_gt;
>> +    u32 val, mbox;
>> +    int err;
>> +
>> +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
>> +        | REG_FIELD_PREP(PCODE_MB_PARAM1, 
>> PCODE_MBOX_FC_SC_READ_FUSED_P0)
>> +        | REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
>> +
>> +    err = xe_pcode_read(gt, mbox, &val, NULL);
>> +    if (err)
>> +        return err;
>> +
>> +    /* data_out - Fused P0 for domain ID in units of 50 MHz */
>> +    val *= 50;
>> +
>> +    return sysfs_emit(buf, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(max_freq);
>> +
>> +static ssize_t min_freq_show(struct device *dev, struct 
>> device_attribute *attr,
>> +                 char *buf)
>> +{
>> +    struct xe_tile *tile = dev_to_tile(dev);
>> +    struct xe_gt *gt = tile->primary_gt;
>> +    u32 val, mbox;
>> +    int err;
>> +
>> +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
>> +        | REG_FIELD_PREP(PCODE_MB_PARAM1, 
>> PCODE_MBOX_FC_SC_READ_FUSED_PN)
>> +        | REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
>> +
>> +    err = xe_pcode_read(gt, mbox, &val, NULL);
>> +    if (err)
>> +        return err;
>> +
>> +    /* data_out - Fused Pn for domain ID in units of 50 MHz */
>> +    val *= 50;
>> +
>> +    return sysfs_emit(buf, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(min_freq);
>> +
>> +static struct attribute *freq_attrs[] = {
>> +    &dev_attr_max_freq.attr,
>> +    &dev_attr_min_freq.attr,
>> +    NULL
>> +};
>> +
>> +static const struct attribute_group freq_group_attrs = {
>> +    .name = "freq0",
>> +    .attrs = freq_attrs,
>> +};
>> +
>> +static void vram_freq_fini(struct drm_device *drm, void *arg)
>> +{
>> +    struct kobject *kobj = arg;
>> +
>> +    sysfs_remove_group(kobj, &freq_group_attrs);
>> +    kobject_put(kobj);
>> +}
>> +
>> +/*
>> + * xe_vram_freq_init - Initialize vram frequency component
>> + * @tile: Xe Tile object
>> + *
>> + * It needs to be initialized after the main tile component is ready
>> + */
>> +
>> +void xe_vram_freq_init(struct xe_tile *tile)
>> +{
>> +    struct xe_device *xe = tile_to_xe(tile);
>> +    struct kobject *kobj;
>> +    int err;
>> +
>> +    if (xe->info.platform != XE_PVC)
>> +        return;
>> +
>> +    kobj = kobject_create_and_add("memory", tile->sysfs);
>> +    if (!kobj)
>> +        drm_warn(&xe->drm, "failed to add memory directory, err: 
>> %d\n", -ENOMEM);
>> +
>> +    err = sysfs_create_group(kobj, &freq_group_attrs);
>> +    if (err) {
>> +        kobject_put(kobj);
>> +        drm_warn(&xe->drm, "failed to register vram freq sysfs, err: 
>> %d\n", err);
>> +        return;
>> +    }
>> +
>> +    err = drmm_add_action_or_reset(&xe->drm, vram_freq_fini, kobj);
>> +    if (err)
>> +        drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, 
>> err: %d\n",
>> +             __func__, err);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_vram_freq.h 
>> b/drivers/gpu/drm/xe/xe_vram_freq.h
>> new file mode 100644
>> index 000000000000..ae3ed6ce68f8
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_vram_freq.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
> 2024
>
> Thanks
> Riana
>> +
>> +#ifndef _XE_VRAM_FREQ_H_
>> +#define _XE_VRAM_FREQ_H_
>> +
>> +struct xe_tile;
>> +
>> +void xe_vram_freq_init(struct xe_tile *tile);
>> +
>> +#endif /* _XE_VRAM_FREQ_H_ */
