Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF1EC5475B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 11:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F93113067;
	Wed,  6 Mar 2024 11:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BNXUKjHt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9061129CF
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 11:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709723230; x=1741259230;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iZzbSHbo4oidD4MF59VFZ7gRb+ZfsQL1vRaqEma6AaM=;
 b=BNXUKjHtUR0sSElGeJTvF4FKItTpFd1CtVmNDD/lZlUaROoJvUtI2dl3
 RCbbdP5a5CxSxdNPG1TY/6RX8+EB+WM/7kCq6I/Jt46bhnDmhfdFcfr+f
 PoxHZ8OcmHTZBgWnDLCpQBJlAq29ZuOrYkL3UGUNRCyHu1behkrROOke7
 0515l8PJOn6jR7R4yZpE+HRxn000DlSZ03anJBSBBCJ4JGL6Co+aPv+I+
 4cGDYzPbE3wVbbIMnJtUDNP2AV8O8cRi4WLEQ4NrXQLHAtPfjXrK21AmW
 x5aDPoO51CX1l9TpcGCBHRmp8wpNwlCTWIkx2jE3EE6HTg8JJGIBc5QY3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="8135125"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="8135125"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 03:07:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="9807706"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 03:07:08 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 03:07:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 03:07:07 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 03:07:07 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 03:07:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IAQdauSHT1sVcqKM0dJhK0EeIvCqWy3padA5nLw4oU//Zm0RupWj33uhIcTjKdwNsSiPxObiSUNEo0DYaCjq2Q7DpJEoItxk8DPgNUP7ZWqGfec51FbdCFko0oku3YDz5Lf5ZNei1pjT1VfLKbPDIi2h4KSwudwglg8TWKWRr2xnAwEaM+mvllSSaxKNJuDDzzYYrQQUmD5E5FfeF6CaA5+j8YPJLbRp/2+SxdBzq7YSAcInTFIsUfoFhpT38YgQWrtgmRbioWdT0CnGa9FVgDbVltZOu/N2cj460x4Xk2CQSBju9iO5EJzGzn9Tgpmhj+/szgFKQmenxUCHAxZpYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqnfmcyjWuKthBZqwkb/kr1peoIZ/wbQ2yI4pQ4J8xw=;
 b=SHCKvbxPDtI8zOxMOD0CWqKZuhVnjU3ZbeBBplEZXL4LLlgLttTmcBleu4q24WQ3155ZjNJGSepfi4/yS9rQL3pio7hLwY6BKrRY045q3ouF3i7tiUgqDvLJSBWzmngPhRSSCN0a1PJ2N6sMswoItei8KEDjfPg1WW/QwwDhz5Fafnd/XnhADqZafsRRuAu9Fku/+q7PcgSf1GYJZVsUvfrF6Npto10Tqp5aoDBfDbripRWZQh1LFtUe5Bw/ww7mUhES1ZBgfCgNvScuNNEevZG3Mlm+KO1vXoGcGkfwJDaQ0MM9KhaJoaatbWw8cL0Tj3IgQOlvLgi267tM8qp7jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SN7PR11MB6560.namprd11.prod.outlook.com (2603:10b6:806:26c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Wed, 6 Mar
 2024 11:07:05 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::5144:aca9:5cd9:42bf]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::5144:aca9:5cd9:42bf%3]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 11:07:05 +0000
Message-ID: <ff14df57-690b-46bc-986e-90b428cd694c@intel.com>
Date: Wed, 6 Mar 2024 03:06:59 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Don't support older GuC 70.x releases
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison
 <John.C.Harrison@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240304162616.824884-1-daniele.ceraolospurio@intel.com>
 <dw54uqzedkjsbhoiadem4lzjhuwpud7m7njenel7tfbc5fuxwm@latczhpxzijn>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <dw54uqzedkjsbhoiadem4lzjhuwpud7m7njenel7tfbc5fuxwm@latczhpxzijn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0356.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::14) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SN7PR11MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: 66d0af22-7955-4d8d-9bf6-08dc3dcd8e61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ShbJg8Em4IdybreVySA/3IshCapm07UsLEXqp8hLM4mfx+/wwan1SFxX6rSpthV5EFXu9TvbEkYUotO8NIGLhX01LJavkwQTsaDhfq1AWHBUHmE3wJB+em9u6lXUcDIe9K43amBotvzmbnouJi1f6/VDW3SVxpBRr6wk64Eb1DMWTXtiUhM8iBsxW6MQ2PprKmczclzzOu5biCSV+uuyFeXtCvwT5qQJ5+EYfZAkQkBOv220RxvRlAwXTyKOuzyEVHARqeIKufFosnmHdBVkKU3lUutePQGouNCZKN8/heSZXtGjTw47WZVY15VbL3PCZUf1u0vYyat/AIJdWUpchxHaOZB23hRZhWS2YnaT3Sviwj7QVGMwJyF85CM6x6WEj23uVxLQzLzTQIBlRPKM2h0wOj+mL5g6D3/ioXV/UagvzllZ541wYa5tgJP6M3+IzdKFyJ6rYfp651dPbItrQUbAp0gusC9Wc0X3mFY3U0fOK0RdFfmmbM0ZzeAZrxMef8VkMuZvjs0IzaFCFlOoaqROu4qWd5IUWNjcFWYT105IlNEcl9mbdyZFZrAQqrftxI2o6SWWZwl0CMi/lpPRNBZdGpKhapI2niOZ2twju6e24lD0bZ+ZCCjgx1rme474uSJjLxqhZ7AJFEwoo1gtXwRsiM3Q8i0jEeIo4YmqPzI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3JPTGgzaW9TOXlrZnFqK3lCaEQyZm5lZjZJd2puTXo2VUJQU2FPeGhrNlEw?=
 =?utf-8?B?ckxSbUg0Y2tBbG5uZ0l2aCtSVTE2K0JSdmRMbVBnbnlvUXZFd01sT0dMR1BN?=
 =?utf-8?B?NjJYRjl0QTI4OXYySC83YjVJam1NVGlBRmpTRWdBdDVsajBzSE1vOS9PYll3?=
 =?utf-8?B?d21DZkR3SFJvakU5ZzJ3VjhHV1F5b1pnSkhCdWFrZzhFT3YzdGczaHhLbW43?=
 =?utf-8?B?Z2NQaU1NK0ZoZ2xRVXBqRjJ1WXJ1bmlwdHdJRlpCT0pZUGkzT2MxbXM3N3lk?=
 =?utf-8?B?ZHl4R2FZckdic1RmTUVaRVBmZ0V2alVyamhSbnk5c3oyVGZucjJLQmJYRUl5?=
 =?utf-8?B?RUk5SXQxQlpPeElnc3pubnhCUDdzSkZxY3FYUHZsMXBEdEZCY3BaUVZwMStD?=
 =?utf-8?B?aXhucnUzQVVSUlJ2S2kzc0lEUXJIOTFVazlaOVhwYmE2SXdvUmk5QTIvWGp0?=
 =?utf-8?B?U0F4Zmo4akkzb1pKSlBCT1lZem9iUTNTMitBaERUbENVS294Z2wrd3dmTnlo?=
 =?utf-8?B?eTI2T0Frd2NTQkdoczhNZXJCMUIwZDB2L0I5OGlZY0E5aThYMGZaK2lMajg1?=
 =?utf-8?B?N0hSMDRIM3hXZFdFTGEwOU5nQ3NQdUwyUm1Nd3MyNkF6amdZZTlwUGFmYlRH?=
 =?utf-8?B?blFtUWRFNjg3UUdNdGNuOTcxcXI2WnlnUzMvaU52VkRpLzJjTWhqWHNtQm1q?=
 =?utf-8?B?Mjl5dXZFNmY3UVp4Mnl0TUwwYUpEZkxaRnJ4MEFBcFpxbWNmcHJoNGlBQ25N?=
 =?utf-8?B?YlIxS3NPZFZKcVRtbXlzWHBXQkNkMjYxeTJhUlI3ZUtaUXJOM20wZEJsT2M5?=
 =?utf-8?B?T2hzNVdRaUxoTURRbGdsYTZGNjREbHhNU0VpdktsWCtCbGVLZUZXbXdCaXZh?=
 =?utf-8?B?S09JZi9OeVpENm9HRE5iemUyN0tKR215eG1rS1VyMDMzM0M2NFdGV2RRSy8w?=
 =?utf-8?B?L2V1Q1VqQTVqL1NjSDE1NCtJYjlqeGE3QnBacnE5SUltcVAvN2NjYUpJQkpn?=
 =?utf-8?B?UUlHNnJNOUhiVzduTlZER2tKQTc4RXVjNWZJanA1TmRZb2JtOHVsNm1SY2NK?=
 =?utf-8?B?cTI1amJENUdsSVg2anluQnlUYzhKOG9LSXJUMkNHR2hVR1grU3lZdjluNUFk?=
 =?utf-8?B?b0xlWVVRV3IwYW1Fa3VPT3BqYTB2YkFoVnNhc1lUSHFENFZpL2RqcTd1N3Js?=
 =?utf-8?B?WG9jY2hPcXI0YUlOa0lEN2kydTF2VzJvaUZ6SUR4dmpCSkU5aHB5N3kxZWFC?=
 =?utf-8?B?TXM5SXJlT09wSlIrMUxTdmdoWjNqWThIdjVYdFBJUnZZZ3FibzlOcktXb3lP?=
 =?utf-8?B?dkQ3TDhUampuczFRemxnYkFNbytiMzVqOE5GMkY0OWJCWUYvZFNFYW1PdlNE?=
 =?utf-8?B?a0ZZV0FTcW1ZYTNMTWpFUldCUU4zdG42ZE1xVnNvR0lMNFJRT2RkZlFRT3dZ?=
 =?utf-8?B?VnQ5Y2pBblVCSjlzd0htRUpKWlludC9SM0lnVzBQM0kvd3c0WTVNK2pkUjlZ?=
 =?utf-8?B?cmlOZWJZUmUwZ0VPWWtpQ2ovR1NVYnN0c21wZWFXT2doMU5YUkxhVUtSdFJX?=
 =?utf-8?B?TUdiallZQWpmVXJxTmdoZ3lJTXd4d3NHYkpycExPQjdIYUxVRS9xSDdoTjAz?=
 =?utf-8?B?SXM5MDk5ZFgvdFhDQUhMcUliWXMvVmlqNGFyMzJTUHQ0TGs3ZGp5QkVSbmxZ?=
 =?utf-8?B?Wlp6amVKR0daQ1RUYzlleXloVFhpM1g4U0paZ2NEc0tYMFBta3NnUEdQQys0?=
 =?utf-8?B?Y3IrMGFBMW4xeWxYV0F2VnMvK2dPNDNWTUdPUjVlOUFBRkExNUljS0pWWjlk?=
 =?utf-8?B?QnVyRURvaWRDa3VlN2E0cGdZaVJxZFZtQzY1Q240ZWVvWmkwcHR0OEU0RmV3?=
 =?utf-8?B?aGx2MUFITWdGSDBOOURYbWxFYkppVTdXS1VRbXdUN1NuZStMR0JjZ3lWRTR1?=
 =?utf-8?B?RHlDVkhDR1QrN1Q4ckFCbjVwSXAwa3oxUSszY2dCbm1iNTdtTzUwai8reGJV?=
 =?utf-8?B?ZHNkcWhKaW1wVmdmeDFFSHppNncvYkhZaVlaU2xORW93UUNqUGV2QU90bVhp?=
 =?utf-8?B?Q1NNcVVtWThEQWg5TC9adlpkV3NzUzFFczBUVUJ5QjRLdWxpKzBYVERIMXha?=
 =?utf-8?B?bG55L0JXeGFTOXRYSk5TZUR5MkErV0QyMzVVUTdYL0tHOFBIM1J1d2NTNm1y?=
 =?utf-8?Q?XPMsTJmUSvkLGwJ9O3guFqU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d0af22-7955-4d8d-9bf6-08dc3dcd8e61
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 11:07:04.8422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: evbTa6ltWj7O7KA1RVToHv+iV1MCQwySe3HuGM6ERAnq7n9Q1mwG5vBjipQ724UWaQWHisKiD1dBkHau27MMUkQmQzY7Ucy5hP0QZEoW1aE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6560
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



On 3/4/2024 8:38 AM, Lucas De Marchi wrote:
> On Mon, Mar 04, 2024 at 08:26:16AM -0800, Daniele Ceraolo Spurio wrote:
>> Supporting older GuC versions comes with baggage, both on the coding
>> side (due to interfaces only being available from a certain version
>> onwards) and on the testing side (due to having to make sure the driver
>> works as expected with older GuCs).
>> Since all of our Xe platform are still under force probe, we haven't
>> committed to support any specific GuC version and we therefore don't
>> need to support the older once, which means that we can force a bottom
>> limit to what GuC we accept. This allows us to remove any conditional
>> statements based on older GuC versions and also to approach newer
>> additions knowing that we'll never attempt to load something older
>> than our minimum requirement.
>>
>> As an initial value, the minimum expected version is set to 70.19,
>> which is the version currently in the firmware table, but the
>> expectation is that this will be bumbed every time we update the
>> table, until we remove the force probe.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_guc.c   | 14 ++------------
>> drivers/gpu/drm/xe/xe_uc_fw.c | 36 ++++++++++++++---------------------
>> 2 files changed, 16 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 0d2a2dd13f11..ba2ca6895917 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -133,15 +133,10 @@ static u32 guc_ctl_ads_flags(struct xe_guc *guc)
>>     return flags;
>> }
>>
>> -#define GUC_VER(maj, min, pat)    (((maj) << 16) | ((min) << 8) | 
>> (pat))
>> -
>> static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>> {
>>     struct xe_device *xe = guc_to_xe(guc);
>>     struct xe_gt *gt = guc_to_gt(guc);
>> -    struct xe_uc_fw *uc_fw = &guc->fw;
>> -    struct xe_uc_fw_version *version = 
>> &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>> -
>>     u32 flags = 0;
>>
>>     if (XE_WA(gt, 22012773006))
>> @@ -171,13 +166,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>     if (XE_WA(gt, 1509372804))
>>         flags |= GUC_WA_RENDER_RST_RC6_EXIT;
>>
>> -    if (XE_WA(gt, 14018913170)) {
>> -        if (GUC_VER(version->major, version->minor, version->patch) 
>> >= GUC_VER(70, 7, 0))
>> -            flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>> -        else
>> -            drm_dbg(&xe->drm, "Skip WA 14018913170: GUC version 
>> expected >= 70.7.0, found %u.%u.%u\n",
>> -                version->major, version->minor, version->patch);
>> -    }
>> +    if (XE_WA(gt, 14018913170))
>> +        flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>>
>>     return flags;
>> }
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index 7751d6ba6ce0..fa06b57d2af5 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -297,36 +297,28 @@ static void uc_fw_fini(struct drm_device *drm, 
>> void *arg)
>>     xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_SELECTED);
>> }
>>
>> -static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct 
>> uc_css_header *css)
>> +static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct 
>> uc_css_header *css)
>> {
>>     struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>>     struct xe_uc_fw_version *release = 
>> &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>>     struct xe_uc_fw_version *compatibility = 
>> &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
>>
>>     xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
>> -    xe_gt_assert(gt, release->major >= 70);
>> -
>> -    if (release->major > 70 || release->minor >= 6) {
>> -        /* v70.6.0 adds CSS header support */
>> -        compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>> -                         css->submission_version);
>> -        compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>> -                         css->submission_version);
>> -        compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
>> -                         css->submission_version);
>> -    } else if (release->minor >= 3) {
>> -        /* v70.3.0 introduced v1.1.0 */
>> -        compatibility->major = 1;
>> -        compatibility->minor = 1;
>> -        compatibility->patch = 0;
>> -    } else {
>> -        /* v70.0.0 introduced v1.0.0 */
>> -        compatibility->major = 1;
>> -        compatibility->minor = 0;
>> -        compatibility->patch = 0;
>> +
>> +    /* We don't support GuC releases older than 70.19 */
>> +    if (release->major < 70 || (release->major == 70 && 
>> release->minor < 19)) {
>
> there's slight chance of this getting out of sync with the firmware 
> versions we
> define. What about adding a define with minimum version just above
> XE_GUC_FIRMWARE_DEFS ?

I thought about that, but I was worried that'd make it easier to 
accidentally update it after the force_probe has been removed, while 
updating it here would have to be more deliberate. I guess I could put a 
big warning comment above the define for safety.

John, as the one who most often does the GuC updates, any preference here?

>
> Anyway,
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> for this patch or to carry over to a v2.
>

Thanks!
Daniele

> thanks
> Lucas De Marchi

