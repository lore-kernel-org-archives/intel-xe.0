Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75447E8FDD1
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 06:50:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E853710E0D8;
	Wed,  4 Oct 2023 06:50:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A7F10E0D8
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 06:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696402253; x=1727938253;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=V3h37vYEon+NcTWzz/cy0GgQfO/U747de4VzKHSoKfw=;
 b=QFRgyfY+pXgOjuLgIbHQVRgmzqvFT25JBMjXHzAOwE3Hvn/yZ9xPt7pL
 lBvp4OpQTha/tdsWburaa7qKryACwnOf8Pn5pg0O/4+UHcHKrnDUC/IdE
 F6qf9+KvleHiDvgpIYH0nz5wgaNksVGjlPtyr8HHJhFgko8UWMkdEWyfn
 9BLsmSPY1EGu65aQFWugdxBkR2yIzFIxfx2R/rz++UUjLeVJAlYlwZruG
 HdS0znu8y8KfSU+m5VggoSeEV3PRoO3znckecTCZELnLQ0ibrIu271D45
 /IXIFR7Qdr+EVhJ72mm4j/07LMO8uXYl1vheQFjibxWUbf8zwVo/Id2MT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="362432943"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
 d="scan'208,217";a="362432943"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 23:50:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="754740450"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
 d="scan'208,217";a="754740450"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2023 23:50:52 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 23:50:51 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 23:50:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 3 Oct 2023 23:50:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 3 Oct 2023 23:50:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5gFRQzRq9DKy5h4tcwKeqjUH2uWOH8qBwWJHMIBaB/wUrQAeSjfWTssyQsI2TOisWKnGExWkB4Kv3z/yRFSmKHc9cuKalUpFyURcNXpYrmA2Ar80M5G0lJIvfY05Yyb7dW7fuyO8wA+2+3oB2XE4KoQyrVO5MyUuRdzOMrJFcCtwQ4IMyuMYs1krmGFrTeYqqw3pxwHOMljXiQPEDaoAgs/TAVEHIFpjtaZ4nzik/Z4ml82Yfof97spYtuTNuiCIVdjjNlEQRUTaTWy9d6yPQgCkHg9eas/DdRbsHxw2jwetXpwVod30Nyzcu8knntm97ZvETDi7mRm/GHJDPQUvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxtRa7vONThwHiz4Ew3tdB1Dt8eZLdr/CLsVX8TptXs=;
 b=Tm1IAER3ZOIvpqEHbJy2TqA0Z3DhG+TBqSteAacxKQObYIGhiK08mq5+KRMvCRKGz0ZBYmO7+IPQlHZ+f+un5at/Qrc2VpYwtWiAYGhScEXz9xfOZnHqSNstcoiLsdanv4vKguQmTtaI98XZ5RsYP8cX7j2YRjcDOVSRXVsPnGzRvInHZWcMbziYtxzx6jTeMitOgAH6c+77KcAIwX2IdvorYfsznLwfH8LKaGLPet1wv91DPLjOBQEEBGlQvIdmCHs2f4QaNkHQCoPZUlHTCWazdyiK9EJzOqk2z/zSPIW2p+OPx+iBPh3WQ6XNF4mCk7EZznRPzJXd2J54H5oNjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA1PR11MB7318.namprd11.prod.outlook.com (2603:10b6:208:426::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Wed, 4 Oct
 2023 06:50:48 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::82e:c2f3:6b0f:3586]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::82e:c2f3:6b0f:3586%4]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 06:50:48 +0000
Content-Type: multipart/alternative;
 boundary="------------krueNMn0cZog6ivmox9UcMAP"
Message-ID: <f0235d58-c1c3-4143-b5e4-0f0dbea12d4e@intel.com>
Date: Wed, 4 Oct 2023 12:20:39 +0530
User-Agent: Mozilla Thunderbird
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
 <20230927114627.136925-8-himal.prasad.ghimiray@intel.com>
 <a78dcbb2-d803-afa6-df4d-812147fa5261@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <a78dcbb2-d803-afa6-df4d-812147fa5261@linux.intel.com>
X-ClientProxiedBy: PN2PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::6) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|IA1PR11MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: 82a939e4-55b8-4128-b144-08dbc4a63d72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NyxuZRdzD3S/hs6YFKqQHGhaFkE6wHCgDxBDqYQTbfw3iezGyhpY0FKH1WX2Z/je9UApSv8zrPdzxWVYQJGctgXYfOzmRn2iOc9CqjrD3O/Vx/fOGOfeA3bo/ncs1BO4Km5r+drKJcWXNG8maQm/kUqN+dzkgc50MPqfDww6dC7JBSdmXXLlBCOsY8qbfkAAdcJGuMIsNZNIxjvmW/KREskdQZNsfSzMfA32SvwJ9vgjYkCtp/PvGIF/JaHwHi/nsIv6IsbQAcbumVagn0purVIL/jRqsZqfIw8/rKGDz709egr7yle3Q/ouKUU4wBlnVapCYIeq/625V90vw8ufPL6WbE1P8TwVHxAZsJ4Rfs2bbL0rwkoseMJOZzKlZ0vovMUEmc8QmGokRgZbaI+g0wjlNxrSbhjcWsqjCXg7b/wJ2VpgQgjNgf7JxoAXq+XN8iS6UBTK2G0ILtljGxXQjbMEgrSNMaNOYmjvccFj4NU1d+YEHxU0Daz4m3f28v222lN0NHQnfa9cxQ+/dlbgjttMY60zoIImzkDrSLzLSqTNr1Bwug+NOVPnj+dz4QTybb1bqjliPQYdXHGF00q+qNarZBYo9mZEsyT4xpkD7schRSOW0G9+FixIe+czQXLFJH5QbmrYddo9DKXtS96DWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(39860400002)(366004)(376002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(316002)(2616005)(82960400001)(38100700002)(31696002)(36756003)(86362001)(83380400001)(41300700001)(5660300002)(8676002)(66946007)(66476007)(8936002)(66556008)(2906002)(26005)(30864003)(31686004)(6512007)(6506007)(53546011)(33964004)(478600001)(6486002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXlMS1ZYWEVvbnV4aEptYUczWVd2WkQ1cmRQTG9tMVhSUFprQzQ4OHRsVkZY?=
 =?utf-8?B?aG5ybGRPR2tmMWM2MzJ4V1lSeWpnYk9IdHhySi92Q1F3V2hyMXU3L08vNHFQ?=
 =?utf-8?B?d3pxeUszSktVK3ltdWdha24rYko5ZkRoNE9jbU9hQkI4YW1MemUxek5Wdmhm?=
 =?utf-8?B?M0YrcVFMK0I5OHBpOEFmdW5rY3JGN0ZXWHh4ZmFjQk1seWp2ZnprRjdqK1Z6?=
 =?utf-8?B?aWNCRzkzV2ZIWUNHU1cxTVlLeC9xeFRGQnV6SHVHOEJrRWxmNlFXMXFLQmNo?=
 =?utf-8?B?S0Q1dVNkKytTMlZaN0NoelBPa2JtY0hpVkRSN21iSzhPekZKSVNFby9pWWdO?=
 =?utf-8?B?VE5UcmI3Q0liTmhWc1BBME5zcTdMNlVNZlZ0UjZBWXh3Q2tyVGlwQUZPb05X?=
 =?utf-8?B?MGFnSE45M1Q5eG53dWNOWFRtendKRURiR1ljWHMxQjZhVFRZMUx3NjVDOVFl?=
 =?utf-8?B?Z0VKLzNRWm80Sm9QTWZSVjBobzhRdk82MEhwZkR1QlRodnZWT08yQTNZL1Jp?=
 =?utf-8?B?UHNwUDYyM3pBc0V2SGNUcFF2ckJYUlRkWjl3QXIxY2lSWFRQb25WSTJUcnJT?=
 =?utf-8?B?VDVORXZIbncraEVBcTUxaE9UNzlYYkRRU0pzWVNGWVlLamU2UmZkdlltQlZZ?=
 =?utf-8?B?Uk1CVlZ0MXRKVmhwSzRYeEhQZXZuS25wYmUrcmc3OGtSQUJlMXhzQ3gybHd6?=
 =?utf-8?B?WHpXcjFMaXo0K0lQSFVGcVhkajU3dndtTThxa0dVUzg0elR5K1ZLOERxN2JE?=
 =?utf-8?B?dHBlV3NEakJPT09taUpzZWhYWkdLd2VYNmh6akROdkhRdVJQdU5SdlY4eWly?=
 =?utf-8?B?UGpOZ2NKL1QxbHVxYUsxWWVpVkViYUJoU0FmMGpmemlrNnBUSUIrUHROWnZk?=
 =?utf-8?B?bDdkK3JGOTI1UmVudU9zR0kvWjZhd2dTYWI1cVoyYXhQNFhDUTBXQVFqV1hF?=
 =?utf-8?B?b01RWkF4Wlg5dWgrellwNnMzM00zenU2R1F2d0M2VzFHSmpzRmEraHQrRFB0?=
 =?utf-8?B?c0hxNFNMWWlDdzlGSjFmMzdpZlIwTXhkWDNWR3VHbFE2em0zNG9CVXU0WXRt?=
 =?utf-8?B?T1ppdnNoNVdBMS9VNHpxMHN4T3FxblVKMFY1QzRWaHRqYmtCY0F0QVFrcVps?=
 =?utf-8?B?MHlraGRQMk9kQ1FMeDNBajVXOC92UXRqY0tmcEFCaGhBYWlXR0pmcldQamRX?=
 =?utf-8?B?NnhXU0VMcUlXcW1oQjlWSDBialZmS0pNVkg2SzdLRTA1clZoSjJ5OGp5TlI3?=
 =?utf-8?B?My9RUnAvZEYzcmFzeWdQSnJrZGMrbmlNRFhwc0t4NTNPbW9XRzc4ejJRbTBy?=
 =?utf-8?B?OGtDUFJkbmo4dXlDUXIvQjIydXpWRWpRMVBQaXNmSHB1V0RXTExFaC82cVkw?=
 =?utf-8?B?eGpoVzY4NVZSZVcvZEZDTUdhVGk2TVZIKytHZldmRjFrVXVPTUxvekFicXpM?=
 =?utf-8?B?QXIxMnlka0hrQzk2OFZVUjdwYlBJYTRkSnVIRGlRUXN0Z1JSS0VoNmUyUERh?=
 =?utf-8?B?Z0llV3ppSGJ5Q0tEZDV3TG5VVHd4SDZobGM1elJiSDJlck5pUzR1UlJkbGtF?=
 =?utf-8?B?N2I5QVFsVjdhUnI4TmpkenBBUXJhekkyQlFqOGtQN2U4YjdqcVpmTHFZQytu?=
 =?utf-8?B?MkdIS003ME1iY3gwU1hrcXVwRWQ1R1Z4UEx1VnNXb2h2S0x5bmw2Z2wzYTJL?=
 =?utf-8?B?UkJmUjlLV1E4eDV5Qi8yanlwaDhUM1BadXVRSmYyQndQa0JZeldyZ0pIaTlS?=
 =?utf-8?B?S2lRaU9vOUtkbC9HY052STFMT2FRQzJla0c3cGR5b1lMd0h2bFJOcjYza0c0?=
 =?utf-8?B?MlhFZVord1RhN090WlVCcitwaDlxNXFFV1o0U0hLc3FudUlZdnh3MUJrTHNy?=
 =?utf-8?B?NXhjalo0Rjh0MXJaZEdjdndnNmZqZnFQQXBITXE0b1BsQm9qYUpRQUJxS2Nz?=
 =?utf-8?B?MFRMMy9EU3dnZjBwZ2pwVEN1UXZ6Uk1GL3VqM1JPZ0QyS1BiS2VRRzBhVzU3?=
 =?utf-8?B?RVJ3UjJGakNxR2szV2pvdkV0SS9lc0lNRzkwYnNwMmVsZnF0a04rWVdKT1U5?=
 =?utf-8?B?aHgvNWliM3plQ2ZodmZLTkYyRDgzYUJhZWEyZkk4OHBjUFhOV0tvTFd5dUF0?=
 =?utf-8?B?QTdoOXd3djNlKzFVT2E1K0t3eFNXYjJ4SzlNanhZaC81Z1gvNU5KTDJxRGd0?=
 =?utf-8?Q?6QsL2VE3MjkDP6C6sbAuweE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a939e4-55b8-4128-b144-08dbc4a63d72
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 06:50:48.0710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ELt3ZuZfyhslB7/9bIYQWzsfx9q7rbVLFVN9ryJT6H1zsdC68GU4HVKBXAHo4JR4tDe41rvymicdfHp8U9LxfUqpidafHNEBVwTzz9VzF0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7318
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 07/11] drm/xe: Support SOC FATAL error
 handling for PVC.
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

--------------krueNMn0cZog6ivmox9UcMAP
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 04-10-2023 12:08, Aravind Iddamsetty wrote:
> On 27/09/23 17:16, Himal Prasad Ghimiray wrote:
> Hi Himal,
>
> I'm yet to review the full patch but sharing a few initial comments.

Hi Aravind,

Thanks for the review comments.

>
>> Report the SOC fatal hardware error and update the counters which will
>> increment incase of error.
>>
>> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  28 +++
>>   drivers/gpu/drm/xe/xe_hw_error.c             | 170 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_hw_error.h             |  58 ++++++-
>>   3 files changed, 254 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
>> index fa16eaf9436b..04701c62f0d9 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
>> @@ -20,4 +20,32 @@
>>   #define GSC_HEC_ERR_STAT_REG(base, x)                  XE_REG(_PICK_EVEN((x), \
>>   								(base) + _GSC_HEC_CORR_ERR_STATUS, \
>>   								(base) + _GSC_HEC_UNCOR_ERR_STATUS))
>> +#define SOC_PVC_BASE	               0x00282000
>> +#define SOC_PVC_SLAVE_BASE             0x00283000
>> +
>> +#define _SOC_LERRCORSTS		       0x000294
>> +#define _SOC_LERRUNCSTS		       0x000280
>> +#define SOC_LOCAL_ERR_STAT_SLAVE_REG(base, x)		XE_REG((x) > HARDWARE_ERROR_CORRECTABLE ? \
>> +								(base) + _SOC_LERRUNCSTS : \
>> +								(base) + _SOC_LERRCORSTS)
>> +
>> +#define SOC_LOCAL_ERR_STAT_MASTER_REG(base, x)		XE_REG((x) > HARDWARE_ERROR_CORRECTABLE ? \
>> +								(base) + _SOC_LERRUNCSTS : \
>> +								(base) + _SOC_LERRCORSTS)
>> +#define _SOC_GSYSEVTCTL		        0x000264
>> +
>> +#define SOC_GSYSEVTCTL_REG(base, slave_base, x)		XE_REG(_PICK_EVEN((x), \
>> +								(base) + _SOC_GSYSEVTCTL, \
>> +								slave_base + _SOC_GSYSEVTCTL))
>> +#define _SOC_GCOERRSTS		        0x000200
>> +#define _SOC_GNFERRSTS		        0x000210
>> +#define _SOC_GFAERRSTS		        0x000220
>> +#define SOC_GLOBAL_ERR_STAT_SLAVE_REG(base, x)		XE_REG(_PICK_EVEN((x), \
>> +								(base) + _SOC_GCOERRSTS, \
>> +								(base) + _SOC_GNFERRSTS))
>> +
>> +#define SOC_GLOBAL_ERR_STAT_MASTER_REG(base, x)		XE_REG(_PICK_EVEN((x), \
>> +								(base) + _SOC_GCOERRSTS, \
>> +								(base) + _SOC_GNFERRSTS))
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> index 76ae12df013c..fa05bad5e684 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -207,6 +207,75 @@ static const struct err_msg_cntr_pair gsc_correctable_err_reg[] = {
>>   	[2 ... 31] = {"Undefined",					XE_GSC_HW_ERR_UNKNOWN_CORR},
>>   };
>>   
>> +static const struct err_msg_cntr_pair soc_mstr_glbl_err_reg_fatal[] = {
>> +	[0]         = {"MASTER LOCAL Reported",			XE_SOC_HW_ERR_MSTR_LCL_FATAL},
>> +	[1]         = {"SLAVE GLOBAL Reported",			XE_SOC_HW_ERR_SLAVE_GLBL_FATAL},
>> +	[2]         = {"HBM SS0: Channel0",			XE_SOC_HW_ERR_HBM0_CHNL0_FATAL},
>> +	[3]         = {"HBM SS0: Channel1",			XE_SOC_HW_ERR_HBM0_CHNL1_FATAL},
>> +	[4]         = {"HBM SS0: Channel2",			XE_SOC_HW_ERR_HBM0_CHNL2_FATAL},
>> +	[5]         = {"HBM SS0: Channel3",			XE_SOC_HW_ERR_HBM0_CHNL3_FATAL},
>> +	[6]         = {"HBM SS0: Channel4",			XE_SOC_HW_ERR_HBM0_CHNL4_FATAL},
>> +	[7]         = {"HBM SS0: Channel5",			XE_SOC_HW_ERR_HBM0_CHNL5_FATAL},
>> +	[8]         = {"HBM SS0: Channel6",                     XE_SOC_HW_ERR_HBM0_CHNL6_FATAL},
>> +	[9]         = {"HBM SS0: Channel7",                     XE_SOC_HW_ERR_HBM0_CHNL7_FATAL},
>> +	[10]        = {"HBM SS1: Channel0",                     XE_SOC_HW_ERR_HBM1_CHNL0_FATAL},
>> +	[11]        = {"HBM SS1: Channel1",                     XE_SOC_HW_ERR_HBM1_CHNL1_FATAL},
>> +	[12]        = {"HBM SS1: Channel2",                     XE_SOC_HW_ERR_HBM1_CHNL2_FATAL},
>> +	[13]        = {"HBM SS1: Channel3",                     XE_SOC_HW_ERR_HBM1_CHNL3_FATAL},
>> +	[14]        = {"HBM SS1: Channel4",                     XE_SOC_HW_ERR_HBM1_CHNL4_FATAL},
>> +	[15]        = {"HBM SS1: Channel5",                     XE_SOC_HW_ERR_HBM1_CHNL5_FATAL},
>> +	[16]        = {"HBM SS1: Channel6",                     XE_SOC_HW_ERR_HBM1_CHNL6_FATAL},
>> +	[17]        = {"HBM SS1: Channel7",                     XE_SOC_HW_ERR_HBM1_CHNL7_FATAL},
>> +	[18]	    = {"PUNIT",					XE_SOC_HW_ERR_PUNIT_FATAL},
>> +	[19 ... 31] = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
>> +};
>> +
>> +static const struct err_msg_cntr_pair soc_slave_glbl_err_reg_fatal[] = {
>> +	[0]         = {"SLAVE LOCAL Reported",			XE_SOC_HW_ERR_SLAVE_LCL_FATAL},
>> +	[1]         = {"HBM SS2: Channel0",			XE_SOC_HW_ERR_HBM2_CHNL0_FATAL},
>> +	[2]         = {"HBM SS2: Channel1",			XE_SOC_HW_ERR_HBM2_CHNL1_FATAL},
>> +	[3]         = {"HBM SS2: Channel2",			XE_SOC_HW_ERR_HBM2_CHNL2_FATAL},
>> +	[4]         = {"HBM SS2: Channel3",			XE_SOC_HW_ERR_HBM2_CHNL3_FATAL},
>> +	[5]         = {"HBM SS2: Channel4",			XE_SOC_HW_ERR_HBM2_CHNL4_FATAL},
>> +	[6]         = {"HBM SS2: Channel5",			XE_SOC_HW_ERR_HBM2_CHNL5_FATAL},
>> +	[7]         = {"HBM SS2: Channel6",                     XE_SOC_HW_ERR_HBM2_CHNL6_FATAL},
>> +	[8]         = {"HBM SS2: Channel7",                     XE_SOC_HW_ERR_HBM2_CHNL7_FATAL},
>> +	[9]         = {"HBM SS3: Channel0",                     XE_SOC_HW_ERR_HBM3_CHNL0_FATAL},
>> +	[10]        = {"HBM SS3: Channel1",                     XE_SOC_HW_ERR_HBM3_CHNL1_FATAL},
>> +	[11]        = {"HBM SS3: Channel2",                     XE_SOC_HW_ERR_HBM3_CHNL2_FATAL},
>> +	[12]        = {"HBM SS3: Channel3",                     XE_SOC_HW_ERR_HBM3_CHNL3_FATAL},
>> +	[13]        = {"HBM SS3: Channel4",                     XE_SOC_HW_ERR_HBM3_CHNL4_FATAL},
>> +	[14]        = {"HBM SS3: Channel5",                     XE_SOC_HW_ERR_HBM3_CHNL5_FATAL},
>> +	[15]        = {"HBM SS3: Channel6",                     XE_SOC_HW_ERR_HBM3_CHNL6_FATAL},
>> +	[16]        = {"HBM SS3: Channel7",                     XE_SOC_HW_ERR_HBM3_CHNL7_FATAL},
>> +	[18]	    = {"ANR MDFI",				XE_SOC_HW_ERR_ANR_MDFI_FATAL},
>> +	[17]        = {"Undefined",                             XE_SOC_HW_ERR_UNKNOWN_FATAL},
>> +	[19 ... 31] = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
>> +};
>> +
>> +static const struct err_msg_cntr_pair soc_slave_lcl_err_reg_fatal[] = {
>> +	[0]         = {"Local IEH Internal: Malformed PCIe AER",     XE_SOC_HW_ERR_PCIE_AER_FATAL},
>> +	[1]         = {"Local IEH Internal: Malformed PCIe ERR",     XE_SOC_HW_ERR_PCIE_ERR_FATAL},
>> +	[2]         = {"Local IEH Internal: UR CONDITIONS IN IEH",   XE_SOC_HW_ERR_UR_COND_FATAL},
>> +	[3]         = {"Local IEH Internal: FROM SERR SOURCES",      XE_SOC_HW_ERR_SERR_SRCS_FATAL},
>> +	[4 ... 31]  = {"Undefined",				     XE_SOC_HW_ERR_UNKNOWN_FATAL},
>> +};
>> +
>> +static const struct err_msg_cntr_pair soc_mstr_lcl_err_reg_fatal[] = {
>> +	[0 ... 3]   = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
>> +	[4]         = {"Base Die MDFI T2T",			XE_SOC_HW_ERR_MDFI_T2T_FATAL},
>> +	[5]         = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
>> +	[6]         = {"Base Die MDFI T2C",			XE_SOC_HW_ERR_MDFI_T2C_FATAL},
>> +	[7]         = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
>> +	[8]         = {"Invalid CSC PSF Command Parity",	XE_SOC_HW_ERR_CSC_PSF_CMD_FATAL},
>> +	[9]         = {"Invalid CSC PSF Unexpected Completion",	XE_SOC_HW_ERR_CSC_PSF_CMP_FATAL},
>> +	[10]        = {"Invalid CSC PSF Unsupported Request",	XE_SOC_HW_ERR_CSC_PSF_REQ_FATAL},
>> +	[11]        = {"Invalid PCIe PSF Command Parity",	XE_SOC_HW_ERR_PCIE_PSF_CMD_FATAL},
>> +	[12]        = {"PCIe PSF Unexpected Completion",	XE_SOC_HW_ERR_PCIE_PSF_CMP_FATAL},
>> +	[13]        = {"PCIe PSF Unsupported Request",		XE_SOC_HW_ERR_PCIE_PSF_REQ_FATAL},
>> +	[14 ... 31] = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
>> +};
>> +
> we shall think of future extensibility, like we do in xe_assign_hw_err_regs depending on platform for
> other registers.

Yes that is in my mind. I was planing to move this struct under 
xe_assign_hw_err_regs once new platform support is added for SOC error 
handling.

But to make things aligned can be taken care rightnow as well. Will 
address in next patch.

>>   static void xe_assign_hw_err_regs(struct xe_device *xe)
>>   {
>>   	const struct err_msg_cntr_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
>> @@ -451,6 +520,104 @@ xe_gsc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>>   	xe_mmio_write32(mmio, GSC_HEC_ERR_STAT_REG(base, hw_err), errsrc);
>>   }
>>   
>> +static void
>> +xe_soc_log_err_update_cntr(struct xe_tile *tile,
>> +			   u32 errbit, const struct err_msg_cntr_pair *reg_info)
>> +{
>> +	const char *errmsg;
>> +	u32 indx;
>> +
>> +	errmsg = reg_info[errbit].errmsg;
>> +	indx = reg_info[errbit].cntr_indx;
>> +
>> +	drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR
>> +			    "Tile%d %s SOC FATAL error, bit[%d] is set\n",
>> +			    tile->id, errmsg, errbit);
>> +	tile->errors.count[indx]++;
>> +}
>> +
>> +static void
>> +xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>> +{
>> +	unsigned long mst_glb_errstat, slv_glb_errstat, lcl_errstat;
>> +	u32 errbit, base, slave_base;
>> +	int i;
>> +	struct xe_gt *gt = tile->primary_gt;
>> +
>> +	lockdep_assert_held(&tile_to_xe(tile)->irq.lock);
>> +
>> +	if ((tile_to_xe(tile)->info.platform != XE_PVC) && hw_err != HARDWARE_ERROR_FATAL)
>> +		return;
>> +
>> +	base = SOC_PVC_BASE;
>> +	slave_base = SOC_PVC_SLAVE_BASE;
>> +
>> +	/*
>> +	 * Mask error type in GSYSEVTCTL so that no new errors of the type
>> +	 * will be reported. Read the master global IEH error register if
>> +	 * BIT 1 is set then process the slave IEH first. If BIT 0 in
>> +	 * global error register is set then process the corresponding
>> +	 * Local error registers
>> +	 */
>> +	for (i = 0; i < PVC_NUM_IEH; i++)
>> +		xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i), ~REG_BIT(hw_err));
>> +
>> +	mst_glb_errstat = xe_mmio_read32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err));
>> +	drm_info(&tile_to_xe(tile)->drm, HW_ERR
>> +		 "Tile%d SOC_GLOBAL_ERR_STAT_MASTER_REG_FATAL:0x%08lx\n",
>> +		 tile->id, mst_glb_errstat);
>> +
>> +	if (mst_glb_errstat & REG_BIT(SOC_SLAVE_IEH)) {
>> +		slv_glb_errstat = xe_mmio_read32(gt,
>> +						 SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err));
>> +		 drm_info(&tile_to_xe(tile)->drm, HW_ERR
>> +			  "Tile%d SOC_GLOBAL_ERR_STAT_SLAVE_REG_FATAL:0x%08lx\n",
>> +			  tile->id, slv_glb_errstat);
>> +
>> +		if (slv_glb_errstat & REG_BIT(SOC_IEH1_LOCAL_ERR_STATUS)) {
>> +			lcl_errstat = xe_mmio_read32(gt, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base,
>> +										      hw_err));
>> +			 drm_info(&tile_to_xe(tile)->drm, HW_ERR
>> +				  "Tile%d SOC_LOCAL_ERR_STAT_SLAVE_REG_FATAL:0x%08lx\n",
>> +				  tile->id, lcl_errstat);
>> +
>> +			for_each_set_bit(errbit, &lcl_errstat, 32)
>> +				xe_soc_log_err_update_cntr(tile, errbit,
>> +							   soc_slave_lcl_err_reg_fatal);
>> +
>> +			xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
>> +					lcl_errstat);
>> +		}
>> +
>> +		for_each_set_bit(errbit, &slv_glb_errstat, 32)
>> +			xe_soc_log_err_update_cntr(tile, errbit, soc_slave_glbl_err_reg_fatal);
>> +
>> +		xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
>> +				slv_glb_errstat);
>> +	}
>> +
>> +	if (mst_glb_errstat & REG_BIT(SOC_IEH0_LOCAL_ERR_STATUS)) {
>> +		lcl_errstat = xe_mmio_read32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err));
>> +		drm_info(&tile_to_xe(tile)->drm, HW_ERR "SOC_LOCAL_ERR_STAT_MASTER_REG_FATAL:0x%08lx\n",
>> +			 lcl_errstat);
>> +
>> +		for_each_set_bit(errbit, &lcl_errstat, 32)
>> +			xe_soc_log_err_update_cntr(tile, errbit, soc_mstr_lcl_err_reg_fatal);
>> +
>> +		xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err), lcl_errstat);
>> +	}
>> +
>> +	for_each_set_bit(errbit, &mst_glb_errstat, 32)
>> +		xe_soc_log_err_update_cntr(tile, errbit, soc_mstr_glbl_err_reg_fatal);
>> +
>> +	xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err),
>> +			mst_glb_errstat);
>> +
>> +	for (i = 0; i < PVC_NUM_IEH; i++)
>> +		xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i),
>> +				(HARDWARE_ERROR_MAX << 1) + 1);
>> +}
>> +
>>   static void
>>   xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>>   {
>> @@ -498,6 +665,9 @@ xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_er
>>   
>>   		if (errbit == 8)
>>   			xe_gsc_hw_error_handler(tile, hw_err);
>> +
>> +		if (errbit == 16)
>> +			xe_soc_hw_error_handler(tile, hw_err);
>>   	}
>>   
>>   	xe_mmio_write32(mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
>> index ee7705b3343b..05838e082abd 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
>> @@ -65,6 +65,56 @@ enum xe_tile_hw_errors {
>>   	XE_GSC_HW_ERR_SELF_MBIST_UNCOR,
>>   	XE_GSC_HW_ERR_AON_RF_PARITY_UNCOR,
>>   	XE_GSC_HW_ERR_UNKNOWN_UNCOR,
>> +	XE_SOC_HW_ERR_MSTR_LCL_FATAL,
>> +	XE_SOC_HW_ERR_SLAVE_GLBL_FATAL,
>> +	XE_SOC_HW_ERR_HBM0_CHNL0_FATAL,
>> +	XE_SOC_HW_ERR_HBM0_CHNL1_FATAL,
>> +	XE_SOC_HW_ERR_HBM0_CHNL2_FATAL,
>> +	XE_SOC_HW_ERR_HBM0_CHNL3_FATAL,
>> +	XE_SOC_HW_ERR_HBM0_CHNL4_FATAL,
>> +	XE_SOC_HW_ERR_HBM0_CHNL5_FATAL,
>> +	XE_SOC_HW_ERR_HBM0_CHNL6_FATAL,
>> +	XE_SOC_HW_ERR_HBM0_CHNL7_FATAL,
>> +	XE_SOC_HW_ERR_HBM1_CHNL0_FATAL,
>> +	XE_SOC_HW_ERR_HBM1_CHNL1_FATAL,
>> +	XE_SOC_HW_ERR_HBM1_CHNL2_FATAL,
>> +	XE_SOC_HW_ERR_HBM1_CHNL3_FATAL,
>> +	XE_SOC_HW_ERR_HBM1_CHNL4_FATAL,
>> +	XE_SOC_HW_ERR_HBM1_CHNL5_FATAL,
>> +	XE_SOC_HW_ERR_HBM1_CHNL6_FATAL,
>> +	XE_SOC_HW_ERR_HBM1_CHNL7_FATAL,
>> +	XE_SOC_HW_ERR_PUNIT_FATAL,
>> +	XE_SOC_HW_ERR_UNKNOWN_FATAL,
>> +	XE_SOC_HW_ERR_SLAVE_LCL_FATAL,
>> +	XE_SOC_HW_ERR_HBM2_CHNL0_FATAL,
>> +	XE_SOC_HW_ERR_HBM2_CHNL1_FATAL,
>> +	XE_SOC_HW_ERR_HBM2_CHNL2_FATAL,
>> +	XE_SOC_HW_ERR_HBM2_CHNL3_FATAL,
>> +	XE_SOC_HW_ERR_HBM2_CHNL4_FATAL,
>> +	XE_SOC_HW_ERR_HBM2_CHNL5_FATAL,
>> +	XE_SOC_HW_ERR_HBM2_CHNL6_FATAL,
>> +	XE_SOC_HW_ERR_HBM2_CHNL7_FATAL,
>> +	XE_SOC_HW_ERR_HBM3_CHNL0_FATAL,
>> +	XE_SOC_HW_ERR_HBM3_CHNL1_FATAL,
>> +	XE_SOC_HW_ERR_HBM3_CHNL2_FATAL,
>> +	XE_SOC_HW_ERR_HBM3_CHNL3_FATAL,
>> +	XE_SOC_HW_ERR_HBM3_CHNL4_FATAL,
>> +	XE_SOC_HW_ERR_HBM3_CHNL5_FATAL,
>> +	XE_SOC_HW_ERR_HBM3_CHNL6_FATAL,
>> +	XE_SOC_HW_ERR_HBM3_CHNL7_FATAL,
>> +	XE_SOC_HW_ERR_ANR_MDFI_FATAL,
>> +	XE_SOC_HW_ERR_PCIE_AER_FATAL,
>> +	XE_SOC_HW_ERR_PCIE_ERR_FATAL,
>> +	XE_SOC_HW_ERR_UR_COND_FATAL,
>> +	XE_SOC_HW_ERR_SERR_SRCS_FATAL,
>> +	XE_SOC_HW_ERR_MDFI_T2T_FATAL,
>> +	XE_SOC_HW_ERR_MDFI_T2C_FATAL,
>> +	XE_SOC_HW_ERR_CSC_PSF_CMD_FATAL,
>> +	XE_SOC_HW_ERR_CSC_PSF_CMP_FATAL,
>> +	XE_SOC_HW_ERR_CSC_PSF_REQ_FATAL,
>> +	XE_SOC_HW_ERR_PCIE_PSF_CMD_FATAL,
>> +	XE_SOC_HW_ERR_PCIE_PSF_CMP_FATAL,
>> +	XE_SOC_HW_ERR_PCIE_PSF_REQ_FATAL,
> even though soc errors fall under a tile it is better if we shall have a
> separate enum for soc errors for 2 reasons, the other errors in
> xe_tile_hw_errors are from top level registers while SOC are from second level
> and also because these errors are most likely different on different platforms.
> so, we shall extend struct tile_hw_errors to have separate entry for soc.
Makes sense. WIll address in next patch.
>
>
> Also, I'm thinking if we shall use xarray types for all members in error counters under tile and gt
> with the enum list being big and which will increase with each new platform.

My initial thought was also to use xarray for soc error counters. But 
even if we use xarray we need to have separate identifiers to identify 
which indexes in xarray are actually valid hardware error and which are 
spurious interrupt. Hence found no use of using xarray, if we still need 
to maintain all valid indexes.

BR

Himal Ghimiray

>
> Thanks,
> Aravind.
>
>>   	XE_TILE_HW_ERROR_MAX,
>>   };
>>   
>> @@ -109,8 +159,12 @@ enum xe_gt_hw_errors {
>>   	XE_GT_HW_ERROR_MAX,
>>   };
>>   
>> -#define ERR_STAT_GT_COR_VCTR_LEN (4)
>> -#define ERR_STAT_GT_FATAL_VCTR_LEN (8)
>> +#define ERR_STAT_GT_COR_VCTR_LEN	(4)
>> +#define ERR_STAT_GT_FATAL_VCTR_LEN	(8)
>> +#define PVC_NUM_IEH			(1)
>> +#define SOC_SLAVE_IEH                   (1)
>> +#define SOC_IEH0_LOCAL_ERR_STATUS       (0)
>> +#define SOC_IEH1_LOCAL_ERR_STATUS       (0)
>>   
>>   struct err_msg_cntr_pair {
>>   	const char *errmsg;
--------------krueNMn0cZog6ivmox9UcMAP
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 04-10-2023 12:08, Aravind Iddamsetty
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:a78dcbb2-d803-afa6-df4d-812147fa5261@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">
On 27/09/23 17:16, Himal Prasad Ghimiray wrote:
Hi Himal,

I'm yet to review the full patch but sharing a few initial comments.</pre>
    </blockquote>
    <p>Hi Aravind,</p>
    <p>Thanks for the review comments.<br>
    </p>
    <blockquote type="cite" cite="mid:a78dcbb2-d803-afa6-df4d-812147fa5261@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Report the SOC fatal hardware error and update the counters which will
increment incase of error.

Signed-off-by: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  28 +++
 drivers/gpu/drm/xe/xe_hw_error.c             | 170 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h             |  58 ++++++-
 3 files changed, 254 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
index fa16eaf9436b..04701c62f0d9 100644
--- a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
@@ -20,4 +20,32 @@
 #define GSC_HEC_ERR_STAT_REG(base, x)                  XE_REG(_PICK_EVEN((x), \
 								(base) + _GSC_HEC_CORR_ERR_STATUS, \
 								(base) + _GSC_HEC_UNCOR_ERR_STATUS))
+#define SOC_PVC_BASE	               0x00282000
+#define SOC_PVC_SLAVE_BASE             0x00283000
+
+#define _SOC_LERRCORSTS		       0x000294
+#define _SOC_LERRUNCSTS		       0x000280
+#define SOC_LOCAL_ERR_STAT_SLAVE_REG(base, x)		XE_REG((x) &gt; HARDWARE_ERROR_CORRECTABLE ? \
+								(base) + _SOC_LERRUNCSTS : \
+								(base) + _SOC_LERRCORSTS)
+
+#define SOC_LOCAL_ERR_STAT_MASTER_REG(base, x)		XE_REG((x) &gt; HARDWARE_ERROR_CORRECTABLE ? \
+								(base) + _SOC_LERRUNCSTS : \
+								(base) + _SOC_LERRCORSTS)
+#define _SOC_GSYSEVTCTL		        0x000264
+
+#define SOC_GSYSEVTCTL_REG(base, slave_base, x)		XE_REG(_PICK_EVEN((x), \
+								(base) + _SOC_GSYSEVTCTL, \
+								slave_base + _SOC_GSYSEVTCTL))
+#define _SOC_GCOERRSTS		        0x000200
+#define _SOC_GNFERRSTS		        0x000210
+#define _SOC_GFAERRSTS		        0x000220
+#define SOC_GLOBAL_ERR_STAT_SLAVE_REG(base, x)		XE_REG(_PICK_EVEN((x), \
+								(base) + _SOC_GCOERRSTS, \
+								(base) + _SOC_GNFERRSTS))
+
+#define SOC_GLOBAL_ERR_STAT_MASTER_REG(base, x)		XE_REG(_PICK_EVEN((x), \
+								(base) + _SOC_GCOERRSTS, \
+								(base) + _SOC_GNFERRSTS))
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 76ae12df013c..fa05bad5e684 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -207,6 +207,75 @@ static const struct err_msg_cntr_pair gsc_correctable_err_reg[] = {
 	[2 ... 31] = {&quot;Undefined&quot;,					XE_GSC_HW_ERR_UNKNOWN_CORR},
 };
 
+static const struct err_msg_cntr_pair soc_mstr_glbl_err_reg_fatal[] = {
+	[0]         = {&quot;MASTER LOCAL Reported&quot;,			XE_SOC_HW_ERR_MSTR_LCL_FATAL},
+	[1]         = {&quot;SLAVE GLOBAL Reported&quot;,			XE_SOC_HW_ERR_SLAVE_GLBL_FATAL},
+	[2]         = {&quot;HBM SS0: Channel0&quot;,			XE_SOC_HW_ERR_HBM0_CHNL0_FATAL},
+	[3]         = {&quot;HBM SS0: Channel1&quot;,			XE_SOC_HW_ERR_HBM0_CHNL1_FATAL},
+	[4]         = {&quot;HBM SS0: Channel2&quot;,			XE_SOC_HW_ERR_HBM0_CHNL2_FATAL},
+	[5]         = {&quot;HBM SS0: Channel3&quot;,			XE_SOC_HW_ERR_HBM0_CHNL3_FATAL},
+	[6]         = {&quot;HBM SS0: Channel4&quot;,			XE_SOC_HW_ERR_HBM0_CHNL4_FATAL},
+	[7]         = {&quot;HBM SS0: Channel5&quot;,			XE_SOC_HW_ERR_HBM0_CHNL5_FATAL},
+	[8]         = {&quot;HBM SS0: Channel6&quot;,                     XE_SOC_HW_ERR_HBM0_CHNL6_FATAL},
+	[9]         = {&quot;HBM SS0: Channel7&quot;,                     XE_SOC_HW_ERR_HBM0_CHNL7_FATAL},
+	[10]        = {&quot;HBM SS1: Channel0&quot;,                     XE_SOC_HW_ERR_HBM1_CHNL0_FATAL},
+	[11]        = {&quot;HBM SS1: Channel1&quot;,                     XE_SOC_HW_ERR_HBM1_CHNL1_FATAL},
+	[12]        = {&quot;HBM SS1: Channel2&quot;,                     XE_SOC_HW_ERR_HBM1_CHNL2_FATAL},
+	[13]        = {&quot;HBM SS1: Channel3&quot;,                     XE_SOC_HW_ERR_HBM1_CHNL3_FATAL},
+	[14]        = {&quot;HBM SS1: Channel4&quot;,                     XE_SOC_HW_ERR_HBM1_CHNL4_FATAL},
+	[15]        = {&quot;HBM SS1: Channel5&quot;,                     XE_SOC_HW_ERR_HBM1_CHNL5_FATAL},
+	[16]        = {&quot;HBM SS1: Channel6&quot;,                     XE_SOC_HW_ERR_HBM1_CHNL6_FATAL},
+	[17]        = {&quot;HBM SS1: Channel7&quot;,                     XE_SOC_HW_ERR_HBM1_CHNL7_FATAL},
+	[18]	    = {&quot;PUNIT&quot;,					XE_SOC_HW_ERR_PUNIT_FATAL},
+	[19 ... 31] = {&quot;Undefined&quot;,				XE_SOC_HW_ERR_UNKNOWN_FATAL},
+};
+
+static const struct err_msg_cntr_pair soc_slave_glbl_err_reg_fatal[] = {
+	[0]         = {&quot;SLAVE LOCAL Reported&quot;,			XE_SOC_HW_ERR_SLAVE_LCL_FATAL},
+	[1]         = {&quot;HBM SS2: Channel0&quot;,			XE_SOC_HW_ERR_HBM2_CHNL0_FATAL},
+	[2]         = {&quot;HBM SS2: Channel1&quot;,			XE_SOC_HW_ERR_HBM2_CHNL1_FATAL},
+	[3]         = {&quot;HBM SS2: Channel2&quot;,			XE_SOC_HW_ERR_HBM2_CHNL2_FATAL},
+	[4]         = {&quot;HBM SS2: Channel3&quot;,			XE_SOC_HW_ERR_HBM2_CHNL3_FATAL},
+	[5]         = {&quot;HBM SS2: Channel4&quot;,			XE_SOC_HW_ERR_HBM2_CHNL4_FATAL},
+	[6]         = {&quot;HBM SS2: Channel5&quot;,			XE_SOC_HW_ERR_HBM2_CHNL5_FATAL},
+	[7]         = {&quot;HBM SS2: Channel6&quot;,                     XE_SOC_HW_ERR_HBM2_CHNL6_FATAL},
+	[8]         = {&quot;HBM SS2: Channel7&quot;,                     XE_SOC_HW_ERR_HBM2_CHNL7_FATAL},
+	[9]         = {&quot;HBM SS3: Channel0&quot;,                     XE_SOC_HW_ERR_HBM3_CHNL0_FATAL},
+	[10]        = {&quot;HBM SS3: Channel1&quot;,                     XE_SOC_HW_ERR_HBM3_CHNL1_FATAL},
+	[11]        = {&quot;HBM SS3: Channel2&quot;,                     XE_SOC_HW_ERR_HBM3_CHNL2_FATAL},
+	[12]        = {&quot;HBM SS3: Channel3&quot;,                     XE_SOC_HW_ERR_HBM3_CHNL3_FATAL},
+	[13]        = {&quot;HBM SS3: Channel4&quot;,                     XE_SOC_HW_ERR_HBM3_CHNL4_FATAL},
+	[14]        = {&quot;HBM SS3: Channel5&quot;,                     XE_SOC_HW_ERR_HBM3_CHNL5_FATAL},
+	[15]        = {&quot;HBM SS3: Channel6&quot;,                     XE_SOC_HW_ERR_HBM3_CHNL6_FATAL},
+	[16]        = {&quot;HBM SS3: Channel7&quot;,                     XE_SOC_HW_ERR_HBM3_CHNL7_FATAL},
+	[18]	    = {&quot;ANR MDFI&quot;,				XE_SOC_HW_ERR_ANR_MDFI_FATAL},
+	[17]        = {&quot;Undefined&quot;,                             XE_SOC_HW_ERR_UNKNOWN_FATAL},
+	[19 ... 31] = {&quot;Undefined&quot;,				XE_SOC_HW_ERR_UNKNOWN_FATAL},
+};
+
+static const struct err_msg_cntr_pair soc_slave_lcl_err_reg_fatal[] = {
+	[0]         = {&quot;Local IEH Internal: Malformed PCIe AER&quot;,     XE_SOC_HW_ERR_PCIE_AER_FATAL},
+	[1]         = {&quot;Local IEH Internal: Malformed PCIe ERR&quot;,     XE_SOC_HW_ERR_PCIE_ERR_FATAL},
+	[2]         = {&quot;Local IEH Internal: UR CONDITIONS IN IEH&quot;,   XE_SOC_HW_ERR_UR_COND_FATAL},
+	[3]         = {&quot;Local IEH Internal: FROM SERR SOURCES&quot;,      XE_SOC_HW_ERR_SERR_SRCS_FATAL},
+	[4 ... 31]  = {&quot;Undefined&quot;,				     XE_SOC_HW_ERR_UNKNOWN_FATAL},
+};
+
+static const struct err_msg_cntr_pair soc_mstr_lcl_err_reg_fatal[] = {
+	[0 ... 3]   = {&quot;Undefined&quot;,				XE_SOC_HW_ERR_UNKNOWN_FATAL},
+	[4]         = {&quot;Base Die MDFI T2T&quot;,			XE_SOC_HW_ERR_MDFI_T2T_FATAL},
+	[5]         = {&quot;Undefined&quot;,				XE_SOC_HW_ERR_UNKNOWN_FATAL},
+	[6]         = {&quot;Base Die MDFI T2C&quot;,			XE_SOC_HW_ERR_MDFI_T2C_FATAL},
+	[7]         = {&quot;Undefined&quot;,				XE_SOC_HW_ERR_UNKNOWN_FATAL},
+	[8]         = {&quot;Invalid CSC PSF Command Parity&quot;,	XE_SOC_HW_ERR_CSC_PSF_CMD_FATAL},
+	[9]         = {&quot;Invalid CSC PSF Unexpected Completion&quot;,	XE_SOC_HW_ERR_CSC_PSF_CMP_FATAL},
+	[10]        = {&quot;Invalid CSC PSF Unsupported Request&quot;,	XE_SOC_HW_ERR_CSC_PSF_REQ_FATAL},
+	[11]        = {&quot;Invalid PCIe PSF Command Parity&quot;,	XE_SOC_HW_ERR_PCIE_PSF_CMD_FATAL},
+	[12]        = {&quot;PCIe PSF Unexpected Completion&quot;,	XE_SOC_HW_ERR_PCIE_PSF_CMP_FATAL},
+	[13]        = {&quot;PCIe PSF Unsupported Request&quot;,		XE_SOC_HW_ERR_PCIE_PSF_REQ_FATAL},
+	[14 ... 31] = {&quot;Undefined&quot;,				XE_SOC_HW_ERR_UNKNOWN_FATAL},
+};
+
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
we shall think of future extensibility, like we do in xe_assign_hw_err_regs depending on platform for
other registers.</pre>
    </blockquote>
    <p>Yes that is in my mind. I was planing to move this struct under <span style="white-space: pre-wrap">xe_assign_hw_err_regs</span> once
      new platform support is added for SOC error handling.</p>
    <p>But to make things aligned can be taken care rightnow as well.
      Will address in next patch.<br>
    </p>
    <blockquote type="cite" cite="mid:a78dcbb2-d803-afa6-df4d-812147fa5261@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> static void xe_assign_hw_err_regs(struct xe_device *xe)
 {
 	const struct err_msg_cntr_pair **dev_err_stat = xe-&gt;hw_err_regs.dev_err_stat;
@@ -451,6 +520,104 @@ xe_gsc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 	xe_mmio_write32(mmio, GSC_HEC_ERR_STAT_REG(base, hw_err), errsrc);
 }
 
+static void
+xe_soc_log_err_update_cntr(struct xe_tile *tile,
+			   u32 errbit, const struct err_msg_cntr_pair *reg_info)
+{
+	const char *errmsg;
+	u32 indx;
+
+	errmsg = reg_info[errbit].errmsg;
+	indx = reg_info[errbit].cntr_indx;
+
+	drm_err_ratelimited(&amp;tile_to_xe(tile)-&gt;drm, HW_ERR
+			    &quot;Tile%d %s SOC FATAL error, bit[%d] is set\n&quot;,
+			    tile-&gt;id, errmsg, errbit);
+	tile-&gt;errors.count[indx]++;
+}
+
+static void
+xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
+{
+	unsigned long mst_glb_errstat, slv_glb_errstat, lcl_errstat;
+	u32 errbit, base, slave_base;
+	int i;
+	struct xe_gt *gt = tile-&gt;primary_gt;
+
+	lockdep_assert_held(&amp;tile_to_xe(tile)-&gt;irq.lock);
+
+	if ((tile_to_xe(tile)-&gt;info.platform != XE_PVC) &amp;&amp; hw_err != HARDWARE_ERROR_FATAL)
+		return;
+
+	base = SOC_PVC_BASE;
+	slave_base = SOC_PVC_SLAVE_BASE;
+
+	/*
+	 * Mask error type in GSYSEVTCTL so that no new errors of the type
+	 * will be reported. Read the master global IEH error register if
+	 * BIT 1 is set then process the slave IEH first. If BIT 0 in
+	 * global error register is set then process the corresponding
+	 * Local error registers
+	 */
+	for (i = 0; i &lt; PVC_NUM_IEH; i++)
+		xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i), ~REG_BIT(hw_err));
+
+	mst_glb_errstat = xe_mmio_read32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err));
+	drm_info(&amp;tile_to_xe(tile)-&gt;drm, HW_ERR
+		 &quot;Tile%d SOC_GLOBAL_ERR_STAT_MASTER_REG_FATAL:0x%08lx\n&quot;,
+		 tile-&gt;id, mst_glb_errstat);
+
+	if (mst_glb_errstat &amp; REG_BIT(SOC_SLAVE_IEH)) {
+		slv_glb_errstat = xe_mmio_read32(gt,
+						 SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err));
+		 drm_info(&amp;tile_to_xe(tile)-&gt;drm, HW_ERR
+			  &quot;Tile%d SOC_GLOBAL_ERR_STAT_SLAVE_REG_FATAL:0x%08lx\n&quot;,
+			  tile-&gt;id, slv_glb_errstat);
+
+		if (slv_glb_errstat &amp; REG_BIT(SOC_IEH1_LOCAL_ERR_STATUS)) {
+			lcl_errstat = xe_mmio_read32(gt, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base,
+										      hw_err));
+			 drm_info(&amp;tile_to_xe(tile)-&gt;drm, HW_ERR
+				  &quot;Tile%d SOC_LOCAL_ERR_STAT_SLAVE_REG_FATAL:0x%08lx\n&quot;,
+				  tile-&gt;id, lcl_errstat);
+
+			for_each_set_bit(errbit, &amp;lcl_errstat, 32)
+				xe_soc_log_err_update_cntr(tile, errbit,
+							   soc_slave_lcl_err_reg_fatal);
+
+			xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
+					lcl_errstat);
+		}
+
+		for_each_set_bit(errbit, &amp;slv_glb_errstat, 32)
+			xe_soc_log_err_update_cntr(tile, errbit, soc_slave_glbl_err_reg_fatal);
+
+		xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
+				slv_glb_errstat);
+	}
+
+	if (mst_glb_errstat &amp; REG_BIT(SOC_IEH0_LOCAL_ERR_STATUS)) {
+		lcl_errstat = xe_mmio_read32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err));
+		drm_info(&amp;tile_to_xe(tile)-&gt;drm, HW_ERR &quot;SOC_LOCAL_ERR_STAT_MASTER_REG_FATAL:0x%08lx\n&quot;,
+			 lcl_errstat);
+
+		for_each_set_bit(errbit, &amp;lcl_errstat, 32)
+			xe_soc_log_err_update_cntr(tile, errbit, soc_mstr_lcl_err_reg_fatal);
+
+		xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err), lcl_errstat);
+	}
+
+	for_each_set_bit(errbit, &amp;mst_glb_errstat, 32)
+		xe_soc_log_err_update_cntr(tile, errbit, soc_mstr_glbl_err_reg_fatal);
+
+	xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err),
+			mst_glb_errstat);
+
+	for (i = 0; i &lt; PVC_NUM_IEH; i++)
+		xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i),
+				(HARDWARE_ERROR_MAX &lt;&lt; 1) + 1);
+}
+
 static void
 xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
@@ -498,6 +665,9 @@ xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_er
 
 		if (errbit == 8)
 			xe_gsc_hw_error_handler(tile, hw_err);
+
+		if (errbit == 16)
+			xe_soc_hw_error_handler(tile, hw_err);
 	}
 
 	xe_mmio_write32(mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
index ee7705b3343b..05838e082abd 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -65,6 +65,56 @@ enum xe_tile_hw_errors {
 	XE_GSC_HW_ERR_SELF_MBIST_UNCOR,
 	XE_GSC_HW_ERR_AON_RF_PARITY_UNCOR,
 	XE_GSC_HW_ERR_UNKNOWN_UNCOR,
+	XE_SOC_HW_ERR_MSTR_LCL_FATAL,
+	XE_SOC_HW_ERR_SLAVE_GLBL_FATAL,
+	XE_SOC_HW_ERR_HBM0_CHNL0_FATAL,
+	XE_SOC_HW_ERR_HBM0_CHNL1_FATAL,
+	XE_SOC_HW_ERR_HBM0_CHNL2_FATAL,
+	XE_SOC_HW_ERR_HBM0_CHNL3_FATAL,
+	XE_SOC_HW_ERR_HBM0_CHNL4_FATAL,
+	XE_SOC_HW_ERR_HBM0_CHNL5_FATAL,
+	XE_SOC_HW_ERR_HBM0_CHNL6_FATAL,
+	XE_SOC_HW_ERR_HBM0_CHNL7_FATAL,
+	XE_SOC_HW_ERR_HBM1_CHNL0_FATAL,
+	XE_SOC_HW_ERR_HBM1_CHNL1_FATAL,
+	XE_SOC_HW_ERR_HBM1_CHNL2_FATAL,
+	XE_SOC_HW_ERR_HBM1_CHNL3_FATAL,
+	XE_SOC_HW_ERR_HBM1_CHNL4_FATAL,
+	XE_SOC_HW_ERR_HBM1_CHNL5_FATAL,
+	XE_SOC_HW_ERR_HBM1_CHNL6_FATAL,
+	XE_SOC_HW_ERR_HBM1_CHNL7_FATAL,
+	XE_SOC_HW_ERR_PUNIT_FATAL,
+	XE_SOC_HW_ERR_UNKNOWN_FATAL,
+	XE_SOC_HW_ERR_SLAVE_LCL_FATAL,
+	XE_SOC_HW_ERR_HBM2_CHNL0_FATAL,
+	XE_SOC_HW_ERR_HBM2_CHNL1_FATAL,
+	XE_SOC_HW_ERR_HBM2_CHNL2_FATAL,
+	XE_SOC_HW_ERR_HBM2_CHNL3_FATAL,
+	XE_SOC_HW_ERR_HBM2_CHNL4_FATAL,
+	XE_SOC_HW_ERR_HBM2_CHNL5_FATAL,
+	XE_SOC_HW_ERR_HBM2_CHNL6_FATAL,
+	XE_SOC_HW_ERR_HBM2_CHNL7_FATAL,
+	XE_SOC_HW_ERR_HBM3_CHNL0_FATAL,
+	XE_SOC_HW_ERR_HBM3_CHNL1_FATAL,
+	XE_SOC_HW_ERR_HBM3_CHNL2_FATAL,
+	XE_SOC_HW_ERR_HBM3_CHNL3_FATAL,
+	XE_SOC_HW_ERR_HBM3_CHNL4_FATAL,
+	XE_SOC_HW_ERR_HBM3_CHNL5_FATAL,
+	XE_SOC_HW_ERR_HBM3_CHNL6_FATAL,
+	XE_SOC_HW_ERR_HBM3_CHNL7_FATAL,
+	XE_SOC_HW_ERR_ANR_MDFI_FATAL,
+	XE_SOC_HW_ERR_PCIE_AER_FATAL,
+	XE_SOC_HW_ERR_PCIE_ERR_FATAL,
+	XE_SOC_HW_ERR_UR_COND_FATAL,
+	XE_SOC_HW_ERR_SERR_SRCS_FATAL,
+	XE_SOC_HW_ERR_MDFI_T2T_FATAL,
+	XE_SOC_HW_ERR_MDFI_T2C_FATAL,
+	XE_SOC_HW_ERR_CSC_PSF_CMD_FATAL,
+	XE_SOC_HW_ERR_CSC_PSF_CMP_FATAL,
+	XE_SOC_HW_ERR_CSC_PSF_REQ_FATAL,
+	XE_SOC_HW_ERR_PCIE_PSF_CMD_FATAL,
+	XE_SOC_HW_ERR_PCIE_PSF_CMP_FATAL,
+	XE_SOC_HW_ERR_PCIE_PSF_REQ_FATAL,
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">even though soc errors fall under a tile it is better if we shall have a
separate enum for soc errors for 2 reasons, the other errors in
xe_tile_hw_errors are from top level registers while SOC are from second level
and also because these errors are most likely different on different platforms.
so, we shall extend struct tile_hw_errors to have separate entry for soc.</pre>
    </blockquote>
    Makes sense. WIll address in next patch.<br>
    <blockquote type="cite" cite="mid:a78dcbb2-d803-afa6-df4d-812147fa5261@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">


Also, I'm thinking if we shall use xarray types for all members in error counters under tile and gt
with the enum list being big and which will increase with each new platform.</pre>
    </blockquote>
    <p>My initial thought was also to use xarray for soc error counters.
      But even if we use xarray we need to have separate identifiers to
      identify which indexes in xarray are actually valid hardware error
      and which are spurious interrupt. Hence found no use of using
      xarray, if we still need to maintain all valid indexes.</p>
    <p>BR</p>
    <p>Himal Ghimiray<br>
    </p>
    <blockquote type="cite" cite="mid:a78dcbb2-d803-afa6-df4d-812147fa5261@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">

Thanks,
Aravind.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 	XE_TILE_HW_ERROR_MAX,
 };
 
@@ -109,8 +159,12 @@ enum xe_gt_hw_errors {
 	XE_GT_HW_ERROR_MAX,
 };
 
-#define ERR_STAT_GT_COR_VCTR_LEN (4)
-#define ERR_STAT_GT_FATAL_VCTR_LEN (8)
+#define ERR_STAT_GT_COR_VCTR_LEN	(4)
+#define ERR_STAT_GT_FATAL_VCTR_LEN	(8)
+#define PVC_NUM_IEH			(1)
+#define SOC_SLAVE_IEH                   (1)
+#define SOC_IEH0_LOCAL_ERR_STATUS       (0)
+#define SOC_IEH1_LOCAL_ERR_STATUS       (0)
 
 struct err_msg_cntr_pair {
 	const char *errmsg;
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------krueNMn0cZog6ivmox9UcMAP--
