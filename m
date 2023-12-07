Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFD6C10F04
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 05:21:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BD710E7AE;
	Thu,  7 Dec 2023 05:21:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BCB10E7AE
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 05:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701926515; x=1733462515;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y82VuoiA1QpsDc8KY1clp9+9yTMwrDa7wHfThQbcr/o=;
 b=T9bDU7e921e5W/WqlxGFly/reGiAH6UppSlrA57MyM7ZIV+RaFb5QZMN
 eGnDRTEByre6yhSeKyJZv9Io/7ymWQqvNBQic6tABVqkkMWSuxqQyvZv3
 1w0U8mGo/FWXEoWEMgfsyM4F6a5FdX/4unNOVw4rDU7scX6M0TP3ygC3s
 neuG/0BQU0fc9ZIxyXdouboYqPC/9rpJDrPGXgOAigAaMiP6AgYmOvkRs
 5Zi3P68UNG4V12a9ONjfndiAUerKZVQaUPyxjHIGybnRDoKqxDzAd3wfM
 BcDsC84cWQm3h286WrcH8jMs94k02LAgy8RueR6DBxTJQCRU2eKbT+xl3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1045558"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1045558"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 21:21:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="19580426"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 21:21:55 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 21:21:54 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 21:21:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 21:21:53 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 21:21:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzK/Q5osDEzBrwGN/TIKDJniTRK9yYgq3AWyz7FGKIvYbJmXuiA6LBVgiU+EFgqlTeHEimg2BkboDN83b844cd+iWby5rYC2sqmLegxXBjlUC9rfnDRAbZ0j5v+/4itzswG0OYy4emkClleD8xTHuhXhvEcu9do1FuSBZszjV/6uvty6tpt+spneIDgXaheueCm5tsHgJxXXRAe3LsZOUnZO1DcusTp9znQTcvW0zYJSF1CuovpYXtLlUmIg0vO/llVD/JxGt77FK0QUihK7bwQlZ46kEgrRhP0YpGiEGwzW6iYkLqrUMrTrksZoNXkpAqrvbK9PwfLt1EXPPfERBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFzdXefapEVUzY8HOC6+7FB09jhFI2oWYrkmfx/VZh0=;
 b=hTmEaDiQGylG31Htc9e1f+HO8EPq/uO78vKBSggk6r7VNQ1oCZhlbZ35G6G0bN3m2UYLiAZZjRpw0h0d3p/obkFX2n7vjvZZDD93GkvilNiOaTmP+lawWNV7/NNKmO3+HF4QSLMQY1L4la7jUD7gbo8W6y+SjQEz8GDhfO5oMK8jt0hev6HX1qYsUe4pYtG+OWLj8qs/xZ0rhvqEOLm5d/ydVhIrCM+TLUHpuMmHggrA2dnO9Ob9qbEQT5LtWTPc1mHF8H2ImvdfINBCJrXiQs5vGaiGlyryBAIFBwsRS/IajoWNluHATFIQBi3zPJMRnYZ/5D9CscoebkYapVEnTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SJ0PR11MB4798.namprd11.prod.outlook.com (2603:10b6:a03:2d5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 05:21:51 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 05:21:51 +0000
Message-ID: <65cbe85b-30a2-470c-974f-ba811ec38b52@intel.com>
Date: Thu, 7 Dec 2023 10:51:43 +0530
User-Agent: Mozilla Thunderbird
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20231206044735.966213-1-sujaritha.sundaresan@intel.com>
 <20231206044735.966213-2-sujaritha.sundaresan@intel.com>
 <CY5PR11MB62113FC5A386520506F9912C9584A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <d9e06457-ec98-46b4-9235-8e9b3b71ffa0@intel.com>
 <7b70c647-6fb6-46ed-98e0-8e898625b5a3@intel.com>
 <SJ1PR11MB62049D5B2C629111948A668E818BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <SJ1PR11MB62049D5B2C629111948A668E818BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0209.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::20) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|SJ0PR11MB4798:EE_
X-MS-Office365-Filtering-Correlation-Id: 292e48f1-8f1b-4dab-1dbb-08dbf6e46ac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DgXMJkuDmUAckq2iX/XhB5dPJuiWq6LzcwOkoFyS437PN+0R4xUZ99pSKWb8OFK94vg0qxja97xf91sHTeXDX57k1g0nc/Zy1cr78VLRzkvWG8yYzwXBnGHZJ9Q4PuFqxiuhKRwqOKvuBj0YuILdsOYoiAFN4KmFZ0Au0DZADsCK673/Ytudx8QzNKyqlP5bbvxnPv2R48+GQ1UnG1DDnkPWBUkA1hCWWQTgsDzDyU/xSYIy5LoQq1u5WvTW/LmuVlUdoRESX4wSr7gu+10Hu/EdeGZFhwvp7WcX1TaeU3pG3aDWtxrMOk5SFRnfc4n3MQNfvhzymT0IRKWwtbpQD8OBSgjLIxuMC1bYR4ka5dQVpe/bibWXZwzI38qZ2/JHZUP4RA/67tNdi5W+Ape/deMTcDS9JDBL7xCizrpV1eKjoh3u4QL/7BXiFG3IiZF6q4VyOEp41mxN7igwh+RrG7iTcW21PK4vadEQHvq7Wl8guvnEKfdalkJwthBFJoK25KZkIaP+gEAFJcRFTFa/lkYB0oyh6ZVY+gvfa+suMX/mwrB8D382c4HzN4gpJ3D71amMzkEe9e6GpHuKe1lnwiZKvN909a9z5qcepeTQyjDF0ALfC550swgaSqyNM6NAlAs9xBuztj/H/PUk40HdIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(82960400001)(38100700002)(41300700001)(86362001)(31686004)(31696002)(83380400001)(107886003)(2616005)(6512007)(53546011)(36756003)(6506007)(2906002)(6666004)(8936002)(8676002)(6486002)(478600001)(316002)(110136005)(26005)(4326008)(5660300002)(66946007)(66556008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmNQNjhGRDVkY3JVWXQ4c0ZiUmlmbk1nOENTQUhDK2h1OEhiUkdobWNhdk9L?=
 =?utf-8?B?RWZXV3BocUNzaDdNTVp5d1FCcTdad2IyZldGckM3Ni96Yk1OanBNN0paZWZS?=
 =?utf-8?B?a2VwYkxNYUllVzlJNFFpSDZROUxkQkREVUdtTUFXaUNxdlkwS3JJUTdZakI2?=
 =?utf-8?B?RWZZQlg4Rk1EMkhKUHZWME1QN2RJeS8ranZYV3RBT29aOEp6Z3FuRkhOUXM4?=
 =?utf-8?B?a0JNQjhGL0c5b0RYVVZacnNrNVBKVzVCVk9qV3JiYytaWVMyanQ2VjBHRUhy?=
 =?utf-8?B?ZEVWOXBuZmVjcEdqTlk0d3R1OGZjYVZLTXJlRGpBdUFRVnp6TXFDV1VEMmJj?=
 =?utf-8?B?TEFIYUlZeDk1a0hVT3VwaUY0QWhjSTQ2V2pmRFBycGhLcHBvTEdNdjFudGFo?=
 =?utf-8?B?eWtYaHN0d2xLZU9ybkhCdDdXYXlvOXZPOUdLK1RPTGkxYm9ONUtYMzd2d0ho?=
 =?utf-8?B?ajZYVEFxRUJBb0lTM1ZzT0NyMWpFMWhSWGR0TmxFYU5JMWRuSkU4b0NLdVMz?=
 =?utf-8?B?RHpHbDhBdzE1c2tyRGJFeVN0NW8vc3dubXc5bklrazBnSEJSNlZHTmVhcVdV?=
 =?utf-8?B?Ly82NEc1WUNDNzBrUTlrNUdwSFFSOHVXcUw5REpxR1hLUkhhbFcrZVNaaGtQ?=
 =?utf-8?B?NFpRYWo1Rmc4ZHFINVpKZEVKZDJPQnFBUUFITlZKbEwrYnpHNnY5SHJOVFVo?=
 =?utf-8?B?VElMMWRGdlo5SFlneWQ2RHd5NnhzbWl2M3dsTWJPVmRKVjd4bzZwa2xjWDBy?=
 =?utf-8?B?ZmN6RGRwemJraEpsMXA3ak1CMVBmU3duTU13S1htbVBiTlpsTjA2cUQvZGJ1?=
 =?utf-8?B?NTQ3eWlHb2VyNDQ3VUFhRXlOTUMxOFI5VzErL1h2ejduYitXTXcwUHFMK2RQ?=
 =?utf-8?B?UkdaK0J5dnhvZ0lwNXQxUUNFZ0h0NWhuM050emRrRllWYmJGZFB2MUdKbncr?=
 =?utf-8?B?dHU2MDIwQ1ZiRW9JL3FxUERUZ01Yd3lSWU5FVHdibUlCZEVUTDU2NTZneThM?=
 =?utf-8?B?a0gxTUNYYlZmVlFkdWdWL2VSVjVkcmYyQlEvUUxRNExiTVdYNnM5SC8zc2hE?=
 =?utf-8?B?Vk0zeStYdkdQclFyVlQ3VHNlN0NaSi8rM2w1eituTkxKMUtoUnhoYVdTOHVP?=
 =?utf-8?B?YzBsekkzcDIwam1JVHRnUVRUR1hIaDEzMEJ6Y1pOZEZFUlpBN21jd1hvN2M5?=
 =?utf-8?B?OUsxWjE1eXQrR2VkRW5hOVhHZk8yVEFXVEozbmFNbXFWcTJHT295SERYVStX?=
 =?utf-8?B?dkd2bHNSZ2l2eWVwdjBRSEpXZysvZGZlUzFPZkZVWHJmMGZYQ2FwYVI5alBN?=
 =?utf-8?B?emtuZ0tEOWVEcCtNcnh3UVZ2ZU8wMEVoSW9NZDl2U3RYOExGSnZLcEo0TmNQ?=
 =?utf-8?B?TVFsakxJNzhWTVQ0a2hNNGh4ZklCbDRkOEJ1RU5mbGpQYkR6dFBTZ0drZmV1?=
 =?utf-8?B?UXFXSERsblBtRGtUVXZOMUZSRzE1cGNxdXZxUXUwY1VQOXQyd1N6MTRBaGZ2?=
 =?utf-8?B?d1pUQ2djU1RCUnRweGlRWkJEb2txT0V0Wm1NOHF3aW5RSFAvcWVFTG5hZ0hB?=
 =?utf-8?B?VHA1UkwzYlQ1NEROL25tMXBUZEJPcW4yT3M0ZXI3ejFpekM2R0ZERjArZngr?=
 =?utf-8?B?bHZGdFlqRnMvcmZacnZoRm15OFJVTTd6K1ZadjV0dVJsUmhoaStqVHh0ZkYz?=
 =?utf-8?B?QzJEazd0eW53VWUrVTZISHZjMDRjNXRLdzVGS0JHd2xmdlVyYm96d1gyQU01?=
 =?utf-8?B?L3J5SUFlYnFPY3o0MzRaWU8yZDFveDN3cDVrdVVwMGxWTEtRdEo1cDBIYWY1?=
 =?utf-8?B?UVZsNzVoMG8veXA3YXJySkdBRm0zTE5oc01NVGRFalR6a1F6Z2xIcGtqNjlq?=
 =?utf-8?B?ZG9wM05ZbUdlbkZOQ040YVZ5S243SlNad2ZJUUlHQnNVcWl4NWR1aGVDNkFi?=
 =?utf-8?B?Rmwvb3plNlhSZWFKMVNyb012b2RUelNXZ3pCVmdPRjN2ajFuNDMzeXdKK0Fa?=
 =?utf-8?B?OGtZYkdMZVVrc083eVUzK0hmREtmR3NOQXVVQkQxZWJiamNXZ0dLaHRJZnJH?=
 =?utf-8?B?UFFUbTRlMGlBNTdpMXBBUkxBa2VqWkVHdUdyL1NLZmlKWnZtTUFvMGFaNExN?=
 =?utf-8?B?YnZ4NUJ3bjNGK0x6SGZMN05WUFVDeFcyaXpVVVlyMXZRQ0FjSWUva2s5OWUv?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 292e48f1-8f1b-4dab-1dbb-08dbf6e46ac3
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 05:21:51.0516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OgklSw57lLiMR+ppO7Ke2IjUI0yEVM7Ur552rAnsWgRYGyJClzvqin13tA7EoUVmEKZPQSJKq4Nb3gNdzBZYHSH/tFb3F43U2RkUUnGBUIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4798
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory under
 tile
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


On 12/7/2023 10:42 AM, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>> Sundaresan, Sujaritha
>> Sent: Wednesday, December 6, 2023 5:44 PM
>> To: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>> Subject: Re: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory under
>> tile
>>
>>
>> On 12/6/2023 5:38 PM, Sundaresan, Sujaritha wrote:
>>> On 12/6/2023 5:23 PM, Gupta, Anshuman wrote:
>>>>> -----Original Message-----
>>>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>>>>> Sujaritha Sundaresan
>>>>> Sent: Wednesday, December 6, 2023 10:18 AM
>>>>> To: intel-xe@lists.freedesktop.org
>>>>> Cc: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>; Vivi,
>>>>> Rodrigo <rodrigo.vivi@intel.com>
>>>>> Subject: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory
>>>>> under tile
>>>>>
>>>>> Add a new memory directory under /device/tile<n> and move
>>>>> physical_vram_size attribute to the new directory.
>>>>>
>>>>> New hierarchy:
>>>>>
>>>>> /device/tile<n>/memory/physical_vram_size_bytes
>>>>>
>>>>> v2: Fix heading typo (Riana)
>>>>>       Fix cleanup error on unload/reload cycle
>>>>>
>>>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_tile_sysfs.c | 15 ++++++++++++---
>>>>>    1 file changed, 12 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>> index 16376607c68f..e8ce4d9270e6 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>> @@ -24,7 +24,8 @@ static ssize_t
>>>>>    physical_vram_size_bytes_show(struct device *kdev, struct
>>>>> device_attribute *attr,
>>>>>                      char *buf)
>>>>>    {
>>>>> -    struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
>>>>> +    struct kobject *kobj = &kdev->kobj;
>>>>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>>>>>
>>>>>        return sysfs_emit(buf, "%llu\n",
>>>>> tile->mem.vram.actual_physical_size);
>>>>>    }
>>>>> @@ -38,7 +39,7 @@ static void tile_sysfs_fini(struct drm_device
>>>>> *drm, void
>>>>> *arg)  {
>>>>>        struct xe_tile *tile = arg;
>>>>>
>>>>> -    kobject_put(tile->sysfs);
>>>>> +    kobject_del(tile->sysfs);
>>>> Why kobekct_del instead of kobject_put?
>>>> Thanks,
>>>> Anshuman Gupta.
>>> Hi Anshuman,
>>>
>>> Basically when sanity checking, after reload we see that we are not
>>> doing a proper cleanup.
>>>
>>> kobject_put will only decrement the ref count and possibly free the
>>> kobject.
>>>
>>> But that is not happening in this case. There is a duplicate remaining
>>> of the tile directory.
>>>
>>> This required a clean unregister of the parent from sysfs hence the
>>> use of kobject_del.
>>>
>>> Thanks,
>>>
>>> Suja
>> As a continuation of the above response;
>>
>> I can probably add a kobject_put call as well to ensure that we are cleaning
>> up the memory side of
>>
>> things as well. Will add.
>>
>> Thanks,
>>
>> Suja
>>
>>>>>    }
>>>>>
>>>>>    void xe_tile_sysfs_init(struct xe_tile *tile) @@ -46,6 +47,7 @@
>>>>> void xe_tile_sysfs_init(struct xe_tile *tile)
>>>>>        struct xe_device *xe = tile_to_xe(tile);
>>>>>        struct device *dev = xe->drm.dev;
>>>>>        struct kobj_tile *kt;
>>>>> +    struct kobject *kobj;
>>>>>        int err;
>>>>>
>>>>>        kt = kzalloc(sizeof(*kt), GFP_KERNEL); @@ -64,8 +66,15 @@ void
>>>>> xe_tile_sysfs_init(struct xe_tile *tile)
>>>>>
>>>>>        tile->sysfs = &kt->base;
>>>>>
>>>>> +    kobj = kobject_create_and_add("memory", tile->sysfs);
>>>>> +    if (!kobj) {
>>>>> +        kobject_put(kobj);
> Do you mean to put kobject_put(tile->sysfs) instead of kobject_put(kobj) ? as there was no Kobj created by the time you reached here!
>
> Tejas

Yup this should be fixed.

Thanks.

Suja

>
>>>>> +        drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -
>>>>> ENOMEM);
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>>        if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
>>>>> -        sysfs_create_file(tile->sysfs, physical_memsize_attr))
>>>>> +        sysfs_create_file(kobj, physical_memsize_attr))
>>>>>            drm_warn(&xe->drm,
>>>>>                 "Sysfs creation to read addr_range per tile
>>>>> failed\n");
>>>>>
>>>>> --
>>>>> 2.25.1
