Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33290C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 18:14:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD5810E185;
	Wed,  8 Nov 2023 18:14:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A1F10E185
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 18:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699467283; x=1731003283;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pb0tenTWkC/4MIfkFqVPWhzixVkBlzfK0R5kNQ9GrHM=;
 b=PvXOciLZGKwVtbjf/IdRS/ZWPDY+qHt6Jg2KpxfrDDqcbCCwHwZAyuZ5
 xpzQCjGHqaMsQtlCcjUX+UmHheCeL1xynGRA0ZT5mnX7RFARL7bZUmrX7
 8GKYfdEdE3rsfn0G9AvR5l3ig2Yp7k9XomGkaQAfZc4fJjmO4dadrDmFz
 ErMpyvXXlduCLKaKdT5txoSOmH4fvb2XJel3jutrvo8bsUbNiy2a+z1N7
 r7aAloq6y1L5s6BdQeaDWs6wPcYIzc5RvyHlkIbhSowrZ4/KVqRtE6fxl
 i2StLMvu3TBj6CgIgcbRwzHwAWRo0NZzpOfAyKiRDvZWyGwj568YlzAjN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="374873242"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="374873242"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 10:14:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="4268249"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 10:14:41 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 10:14:40 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 10:14:40 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 10:14:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OR4WyMwLd5w1X3c0BZAI3SgmiWKjwV31mVjOreBJstGZIBWdNO6Pw1GV3ycgdipvn780U0r+TuC9yHwz3KM1tMX++5T+800DQvbndI4ZldtCiMHmWCskBBW0TboxamEdEU4GNUvmAt9/Z5+NwTs1fs0lJWEXiFhrNkXaWE2AcSiBGOlJA78svbQ5YrGaCYmrGF7wCfliPMnqSSC9D/mFSvSYrnFl/PbihXjKm+041nmBszfkny2xJIgpULkrYhieErYu72/knFgnN9p9bX/ZiPC84QgB0qJDNQ+evMpXh+unwkVwOFK/iVC2Uxpq+eI78ulqWOGKT0dTN6VkM4XKag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxvgRIvtW9WIWQ2m+XhhabffEPgaG/OXC1kK1kCT3CY=;
 b=D+2Mlb90jglzMcCKUTdP8lkgC2Voa7A9gmTMk1cXlmJXRHlaRyif6T6jPOZb7/OqxyN/n2f87Jlnbwek9T9VgsDMq91DLl22VaYXLptX4o4V1SP8+Wty1cQhNbmGQhtwCjlWrvj+mx1WhYBxAMw6ox2UNNCIl8M48Bc8Jf0hvQyMtqbjGfIXYWmkes8toZPurVq6r9ErjDqpzOP3T6VH4QytwWBBx54MnHpKhhsuMUaNR5r8MWW+rxCByTtwrCEHsiEyQM+1OIbgglaPndJQ3ajBIJzHWgfJqVnQlkCGADKydjyKye18WhknYh1Mj/Tje5C99s65g8UqtkE7HNPnNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CH0PR11MB5561.namprd11.prod.outlook.com (2603:10b6:610:d4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Wed, 8 Nov
 2023 18:14:37 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86%6]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 18:14:37 +0000
Message-ID: <9c107d75-bcbf-47a1-bf35-19dbb2fa2ee2@intel.com>
Date: Wed, 8 Nov 2023 10:14:34 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-2-daniele.ceraolospurio@intel.com>
 <c645d629-0d1d-4f3a-9199-6edcb3745739@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <c645d629-0d1d-4f3a-9199-6edcb3745739@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0094.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::35) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CH0PR11MB5561:EE_
X-MS-Office365-Filtering-Correlation-Id: 47a2617b-81d5-4129-64b9-08dbe0869193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JJHRpAR1tZ5QzJaI5pkhMxnub+clXWV/8BBXafkRUeebLED8bGRf8I23zpmZ7ThsC1+FCkRHmB5CZIOCLKK5HQ0Z3YKgWPkR4Hy6sAPvc3QagMUAJJ5YBB4ZKVYo2dnQS2HWFTaFs++7187xmHbQ6fFs4vsjINK92M1bP1CXuuJEfbqE1F/TnzjWmvz3nGUShjzybfUgsLt3N/gxqfS5UCgB3P10Rk2/ThUj8fqCpKEN+XIXTdOQ9AV0hoYjjLnlJ8VxJ+998JCFWiK2PqEfslJOnds90N7ifTmH0BbfRamqFP6Wwz8UZKHFJxG5gyvWNF5JA0PwBm3al46htTWdmnU3qGaiwUclL+q5tA8ExWQlYcEd0fRU7r0cxRzusohYD+UN5n15Ojm4s+xWqyHG0bsxuIsVYCpZkPk7j4hoty+cS9uHIGQXIgYkWg3E5L+H2AAajg/I4GWRDwlMrKiBDwXotlf8wYKgWiWT3SDXmtBEPvKp70pkVAR/quzq2VCedcmgd41gBDjqpuFRrknNt0j6YA5pBMoUwbGZoghchrQ1B/JbiM7fJG5RMg/nSJLoPu0E07vp6pk3zTxcUJGvc5Be74o814TFzk4KYSfDrRclQtLQ1UmWA0PwvpE5Mn0Ma4oq1JXHaj/mVeOmooFjqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(31686004)(4326008)(83380400001)(5660300002)(8936002)(8676002)(6486002)(53546011)(107886003)(31696002)(6506007)(38100700002)(2616005)(26005)(6666004)(86362001)(316002)(2906002)(478600001)(36756003)(66946007)(66556008)(66476007)(41300700001)(6512007)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXBOK21BUE9tcjV5TGJPMWhxL1N1d29BS3lidGNvU1kzN1U1c2FGaHR5Y1kx?=
 =?utf-8?B?WGZDVTFSY0RSN3MvVHRiM1kvclVKYlZob093K1hZRjNwa3VjaXBieFdXRk8v?=
 =?utf-8?B?SU5SWWxFYkhHTnIzSkQxYTZRV1BXallPNUgwakdtMXV4R3Z0SVgrMWVwaXRQ?=
 =?utf-8?B?b2dWTitOdWpoWkxGeUZVakhoYS9mRVMwa29veFpqV09DU2xMOFRucWhzekE0?=
 =?utf-8?B?QStXVFpVWDhvNWVYWG0zdlc5Ym1Pa2luQUZrczQxMHczOFY4S2Z1bmpFOFVK?=
 =?utf-8?B?NXB6KzM2ak0xZDlHbzFkbnhUdlZ4RHN3a1lFK3dLcFlzRHpYdEg4ZXlvRUZK?=
 =?utf-8?B?ZDBLNXRCSnFIOUdmZ2tDSkVvY2ZRb0FHVFlveFJaMWpaMWhOS0dtRVhnMFlW?=
 =?utf-8?B?ZjhKaGo3SlFTT2hQdzlSdXU0MmxVWVAwK2JOMjF2Uk1DdEQ2ZzFycmhkZFM3?=
 =?utf-8?B?ZE9CanhHc2tzOXZIY2hGOEtKZE1iOE9KOU1kZC9xK0VZcUNRUytXSGl5NDJ4?=
 =?utf-8?B?QUJwbkJlN2xxSE9EVENMWXk3RGt5RXBNS0gzMWdCMGd1TXhYbEpUcGdBNElR?=
 =?utf-8?B?Uit5MVZUNWRTdVEwM2pnZjNmNnRhRXhEN0c0NnY5N2dPcEhDckswd3RJS1ZG?=
 =?utf-8?B?anMrREx3Wk5yeUMxckJqUmNyNEcvN3ZnNXNsaE44blpDanhFN0VmOXd6Wmk1?=
 =?utf-8?B?S0ZNbFkrS24wdkd4dDhUQ2xTOS8zTCt3cTFPY2xCUGxWZ3FIT25rREtmSm54?=
 =?utf-8?B?aUI3YjcyRVZVbEpUVTZLaHVxWjRRd0ZDcG9zZXh6TVAxNmI5RmFiS1dwd2d2?=
 =?utf-8?B?dE9kbVZSWmtCUWRNTlRSZktiUWdkbkZvdFMva0Q3aEdZK3RZNUdhazlvMW8r?=
 =?utf-8?B?UUprNVFselErS2xiYzFWZ1MxSVd3RGpGS3pHeGFxOHVFaVE1UkVPVk9GaFh3?=
 =?utf-8?B?VWxMQ2hVL0FDUCtRRE44a3lPNGhRcDNpVzVPSEZIL2VmNG1aQXpia0ljNWJU?=
 =?utf-8?B?OGFnMURib2p2aWZPUFY1UmVKdmY3QklYcHFaWnYzcEFwS2NHU3pCdlBNaWRn?=
 =?utf-8?B?bWpaRi9BNHZqbG83eUdXMW05NCt0dmgrVEo1c2xUcE4rdXpzZ3VQVDM3amtk?=
 =?utf-8?B?Ky8zKzNVNmMzWWtQYkl6WGl3MUZWYnlPN25uWll3d0JVWWpNaXRrN2Q2djM1?=
 =?utf-8?B?SU9saCtzN0lWOWVVbjZOTHRiWEpIWHdKRXBVbExKMVJEa3QxMzdEUTZPT0R0?=
 =?utf-8?B?OE9ES1VlUGJJdmYwZzJ2WGhleFAxY0lwSGVpaGg5Q3d5TnptajRzNGlvdHlv?=
 =?utf-8?B?RC9NTW9kY1U3RkdsSW0rQzZhL09EbGthNlY1cnljaFhIUzY3MWRSbnprd29o?=
 =?utf-8?B?L0ZkcWxvbUxCNHN0ZkVsVzZOeXd5UUU2SUx6dlZ2VTRSNzV0dUFLN0lxQkE3?=
 =?utf-8?B?UXJWSTUxOUJ1eGVEUnRhc2VHNER4SGNxODAvK1BYSUMwT1ZGRHZrbndlRjJT?=
 =?utf-8?B?TExDWVZuc29QWWRlYXdsUjJJUTA1VlIwd2duSVpVYmtIRFN4cktvYm5BRTVr?=
 =?utf-8?B?VXMvWnpsK1ZNNGlMc3lsNWZXaVdDaXY3ZTUyZG1VNXJXTnY5NExaekdNdGdj?=
 =?utf-8?B?TTlycG5hYTlPazdDbFJHZVFwS21PaVdKNjNLM2JOQmZEdStwU0ZHWkVqOEpT?=
 =?utf-8?B?MWpCS1U3RHRDUW1obkZLa2N5TjE1QS9xSWZiMVBzTFpwVWtqMFpLY05mVDdq?=
 =?utf-8?B?aWdGK0hlUUJyQVJrUXF2ZmdTdHVwV2ErMUowQmlwbkY3Y2pjWnhEYjM3TTIz?=
 =?utf-8?B?ZllHK09uY2txbmdoYU5uSkc4MlZUWUVaMkxHcmxZTWF3VE85L2ZWSmtPSHhz?=
 =?utf-8?B?MExMenFmcXNTeEpNdnZoVVB2MDlUbDFoT3BrWlFXOUp3OFdDWUtib1hqSklx?=
 =?utf-8?B?THQvUW5xcVdDOVpEbit3bUhURXZhWEx5NHhTY2ZFUmtTQXNRT3FQSUVZTDdl?=
 =?utf-8?B?T29iZ2tzM0h0azZ6RGdBY2drWHZQMm9tR0ZyQjJ1WnlhMy9GcjNPeEtuSVls?=
 =?utf-8?B?ZWd1S0Mwa043MFlRbVltRkM3aFc3WXk4UU0yQkhiaFBnUFNtMFB1Ym1YeUdi?=
 =?utf-8?B?cG0zbHNKOXdWTUM5d0ZNMnBva2ZrbXZtcFN5UXhpSFdpMGlIZElNczRJeXNE?=
 =?utf-8?Q?XW6ArpgeBREi5NUFWfmRWj4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a2617b-81d5-4129-64b9-08dbe0869193
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 18:14:37.6802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yiEohoojrTzhFYzVQ1oYBmGMfRDmmeWh+QZAT/c3o8NCvRlNLL+DdUGkVM5QvlEj8Jw5nfIYzQDkRelr/9oKdBWrfHulifMDEKxPsAu+PH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5561
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 01/12] drm/xe: implement driver initiated
 function-reset
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 11/7/2023 3:46 PM, John Harrison wrote:
> On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
>> From: Andrzej Hajda <andrzej.hajda@intel.com>
>>
>> Driver initiated function-reset (FLR) is the highest level of reset
>> that we can trigger from within the driver. In contrast to PCI FLR it
>> doesn't require re-enumeration of PCI BAR. It can be useful in case
>> GT fails to reset. It is also the only way to trigger GSC reset from
>> the driver and can be used in future addition of GSC support.
>>
>> v2:
>>    - use regs from xe_regs.h
>>    - move the flag to xe.mmio
>>    - call flr only on root gt
>>    - use BIOS protection check
>>    - copy/paste comments from i915
>> v3:
>>    - flr code moved to xe_device.c
>> v4:
>>    - needs_flr_on_fini moved to xe_device
>>
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_regs.h    |  7 +++
>>   drivers/gpu/drm/xe/xe_device.c       | 78 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_device_types.h |  3 ++
>>   drivers/gpu/drm/xe/xe_gt.c           |  2 +
>>   4 files changed, 90 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_regs.h
>> index 2240cd157603..a646d13af03a 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>> @@ -57,8 +57,15 @@
>>     #define SOFTWARE_FLAGS_SPR33            XE_REG(0x4f084)
>>   +#define GU_CNTL_PROTECTED            XE_REG(0x10100C)
>> +#define   DRIVERINT_FLR_DIS            REG_BIT(31)
>> +
>>   #define GU_CNTL                    XE_REG(0x101010)
>>   #define   LMEM_INIT                REG_BIT(7)
>> +#define   DRIVERFLR                REG_BIT(31)
>> +
>> +#define GU_DEBUG                XE_REG(0x101018)
>> +#define   DRIVERFLR_STATUS            REG_BIT(31)
>>     #define XEHP_CLOCK_GATE_DIS            XE_REG(0x101014)
>>   #define   SGSI_SIDECLK_DIS            REG_BIT(17)
>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>> b/drivers/gpu/drm/xe/xe_device.c
>> index 8341acf66e5f..515cdf599fab 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -5,6 +5,8 @@
>>     #include "xe_device.h"
>>   +#include <linux/units.h>
>> +
>>   #include <drm/drm_aperture.h>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_gem_ttm_helper.h>
>> @@ -260,6 +262,78 @@ struct xe_device *xe_device_create(struct 
>> pci_dev *pdev,
>>       return ERR_PTR(err);
>>   }
>>   +/*
>> + * The driver-initiated FLR is the highest level of reset that we 
>> can trigger
>> + * from within the driver. It is different from the PCI FLR in that 
>> it doesn't
>> + * fully reset the SGUnit and doesn't modify the PCI config space 
>> and therefore
>> + * it doesn't require a re-enumeration of the PCI BARs. However, the
>> + * driver-initiated FLR does still cause a reset of both GT and 
>> display and a
>> + * memory wipe of local and stolen memory, so recovery would require 
>> a full HW
>> + * re-init and saving/restoring (or re-populating) the wiped memory. 
>> Since we
>> + * perform the FLR as the very last action before releasing access 
>> to the HW
>> + * during the driver release flow, we don't attempt recovery at all, 
>> because
>> + * if/when a new instance of i915 is bound to the device it will do 
>> a full
>> + * re-init anyway.
>> + */
>> +static void xe_driver_flr(struct xe_device *xe)
>> +{
>> +    const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a 
>> 3s wait */
> 3s or 3us?

MICRO is the number of usecs in a sec, so that matches 3 seconds as a 
usec value

>
> And is it supposed to be the same timeout for both registers?

The spec says that the whole process can take up to 3 secs, but there is 
no indication on how this time is split across the 2 waits. We could 
subtract the amount waited on the first wait from the timeout of the 
second one, but that has very little benefit because if the FLR fails 
the HW is dead anyway, so it doesn't really matter if we notice a bit 
later; given that, it's just easier code-wise to have the full 3 secs as 
timeout both times.

Daniele

>
> John.
>
>> +    struct xe_gt *gt = xe_root_mmio_gt(xe);
>> +    int ret;
>> +
>> +    if (xe_mmio_read32(gt, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
>> +        drm_info_once(&xe->drm, "BIOS Disabled Driver-FLR\n");
>> +        return;
>> +    }
>> +
>> +    drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
>> +
>> +    /*
>> +     * Make sure any pending FLR requests have cleared by waiting 
>> for the
>> +     * FLR trigger bit to go to zero. Also clear GU_DEBUG's 
>> DRIVERFLR_STATUS
>> +     * to make sure it's not still set from a prior attempt (it's a 
>> write to
>> +     * clear bit).
>> +     * Note that we should never be in a situation where a previous 
>> attempt
>> +     * is still pending (unless the HW is totally dead), but better 
>> to be
>> +     * safe in case something unexpected happens
>> +     */
>> +    ret = xe_mmio_wait32(gt, GU_CNTL, DRIVERFLR, 0, flr_timeout, 
>> NULL, false);
>> +    if (ret) {
>> +        drm_err(&xe->drm, "Driver-FLR-prepare wait for ready failed! 
>> %d\n", ret);
>> +        return;
>> +    }
>> +    xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
>> +
>> +    /* Trigger the actual Driver-FLR */
>> +    xe_mmio_rmw32(gt, GU_CNTL, 0, DRIVERFLR);
>> +
>> +    /* Wait for hardware teardown to complete */
>> +    ret = xe_mmio_wait32(gt, GU_CNTL, DRIVERFLR, 0, flr_timeout, 
>> NULL, false);
>> +    if (ret) {
>> +        drm_err(&xe->drm, "Driver-FLR-teardown wait completion 
>> failed! %d\n", ret);
>> +        return;
>> +    }
>> +
>> +    /* Wait for hardware/firmware re-init to complete */
>> +    ret = xe_mmio_wait32(gt, GU_DEBUG, DRIVERFLR_STATUS, 
>> DRIVERFLR_STATUS,
>> +                 flr_timeout, NULL, false);
>> +    if (ret) {
>> +        drm_err(&xe->drm, "Driver-FLR-reinit wait completion failed! 
>> %d\n", ret);
>> +        return;
>> +    }
>> +
>> +    /* Clear sticky completion status */
>> +    xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
>> +}
>> +
>> +static void xe_driver_flr_fini(struct drm_device *drm, void *arg)
>> +{
>> +    struct xe_device *xe = arg;
>> +
>> +    if (xe->needs_flr_on_fini)
>> +        xe_driver_flr(xe);
>> +}
>> +
>>   static void xe_device_sanitize(struct drm_device *drm, void *arg)
>>   {
>>       struct xe_device *xe = arg;
>> @@ -294,6 +368,10 @@ int xe_device_probe(struct xe_device *xe)
>>       if (err)
>>           return err;
>>   +    err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
>> +    if (err)
>> +        return err;
>> +
>>       for_each_gt(gt, xe, id) {
>>           err = xe_pcode_probe(gt);
>>           if (err)
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index 44d622d4cc3a..9a0b0ccc1018 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -405,6 +405,9 @@ struct xe_device {
>>       /** @heci_gsc: graphics security controller */
>>       struct xe_heci_gsc heci_gsc;
>>   +    /** @needs_flr_on_fini: requests function-reset on fini */
>> +    bool needs_flr_on_fini;
>> +
>>       /* private: */
>>     #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index d380f67b3365..73c090762771 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -626,6 +626,8 @@ static int gt_reset(struct xe_gt *gt)
>> xe_uevent_gt_reset_failure(to_pci_dev(gt_to_xe(gt)->drm.dev),
>>                      gt_to_tile(gt)->id, gt->info.id);
>>   +    gt_to_xe(gt)->needs_flr_on_fini = true;
>> +
>>       return err;
>>   }
>

