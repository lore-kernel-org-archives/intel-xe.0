Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED1FC4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 22:36:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B36F10E87E;
	Wed,  8 Nov 2023 22:36:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F2810E87E
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 22:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699482953; x=1731018953;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=f7eYen9rKme6YCX10U4BGJpB/3G+u0FKlCw0MXeCFp0=;
 b=JY2J5GJ7G486/8MDZXz2TMX8TeMXf7axcctFiTH9WigCjzWahL/arHwV
 40UdGjtuH2Qky7UStWRaNUykSWr2ofL5OqwGPmVUxEHAZqaJn36SYhmVA
 sGEC3WyU8oFwniSsNfkH/tANc6pBdADIHmatM8iPHTUensjk8jMJrm602
 JAaIVw2CWzvvKsI5p96XiKYzFJ6R1yG/T3H5YOxVU5HM4p3P5JYAODBJ3
 MbUDq1X5dpIwvvacMRpcA+o+XpJhNJkrLxK871D/yO5pAaVXKCgONF+je
 5WbTrbyh5qjEfbjpYzqXamsLRH+LtF/o5nC+XfyuHGd1pHY+eW5EEu6du g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="370078118"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; d="scan'208";a="370078118"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 14:35:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="739652889"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; d="scan'208";a="739652889"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 14:35:41 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 14:35:41 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 14:35:40 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 14:35:40 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 14:35:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpysPPKIQZgIYDBBKKzXxnTTNi+WbovgnJangY0gO+och+thg/GU3MK768pXQ2tvlTgkHJZm7R6e1X7ZPWLYmwGpyjfLCvDCNa3IDrxSjKe6AdFrRsFiGVq1UKdGfxXfk0v/prxCcqcjeugzz7CnBS/dRt4x88LBJ0n0x/XktScTSVh2Db6pZ4igvCaemVKOERSFMWbUBaPPBgt6CQ5y6/MPN598xpAfSQQbnyqQgA77lTq8FxLxMHmgnJuWLHh9U4efNRRhWOWQKUKKHwKGQdU4ZDy3gHKRFMEXdmC5qLK9k7KtffqRTISpjqYnUfnFND6TAwWUEOMRbcqGd3itOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8rHk674Iz3xHTkZCBP0Qfwi4oDAkRj41yAJ1MsZ04M=;
 b=QENbAibp5IiekPlFJwx+GiAAsXZi6IfYRs1TgUV/sspypLGMGtVjZD+qYlIWmPepSKzevy0oC+1L6nkAhuFdYqD4NGaxsfWvoAx5R9rjnhRqD4fgaOJA68jnKdnCvLgOo4qyLwSnVi2mdJNrZL5CHRQTOxFGJV8XefwXWmWHNBA4ZV6HmRmNuWeAjhcL0dClCq5i71rDt4pxDE0cuoa2v/FNpOMClN/dmomcrmGQl8QTSACY9TBLBblh+YGofdo9UVYT6V/kGr5ZRdvZR7HrStEeF54rbcWPF81q/FQS03BpAPZHVf3YdxOiGkKhZG0kMsleUUJIl6JxjwpJLkGbaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS7PR11MB6176.namprd11.prod.outlook.com (2603:10b6:8:98::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.28; Wed, 8 Nov 2023 22:35:38 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86%6]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 22:35:38 +0000
Message-ID: <67739f02-f959-48a2-9b2e-40867adf73dd@intel.com>
Date: Wed, 8 Nov 2023 14:35:35 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-8-daniele.ceraolospurio@intel.com>
 <7ad899dd-460b-42c7-b0a1-4007f817bb37@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <7ad899dd-460b-42c7-b0a1-4007f817bb37@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR20CA0020.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::33) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS7PR11MB6176:EE_
X-MS-Office365-Filtering-Correlation-Id: 04903697-9037-4b79-67c9-08dbe0ab07c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: exLs/GRmWPI+3Po+BPZm+jA2soQG6RR5RxUc7Pryo8X0W3jo9YV01JfHTOdeAiAgUfXVsPSIbo62fBi5Nx04D+jkA1BwXIWxHOqEFXMQOcLeMiCcqK+FgZoqptF0XP+NPJx3IT89QX0tYEe+pV3vvxbLNzYY9cicgHKTGYWDU/paPkWej98J6OueFMDHk88avZhskmb6/xCPUzb7jU+yWBn3vZvBnN3NQifBgf3AWzMlcydlz41HHVk0/Y9g0SgJuiuPiZPvV7FAKSGv6QgsvfXf1A0IPZtsifI8t8dx9q726Cp7/NkIakgkewHrCQ4uO9NAOZHKl9O7Ip1QiiAH4qt6lT9KIuuadSCZrVaRKaP8VZg3hSWb4YWVZJwFAodJQ7VXGR3EeslKeKlZhMDsBFRwZFAYB2AFf7TY+nrnYvkOjAJRM0E+LGk1FDJlEQ7DZ5GdfQJ18sBL3V4KArzRpypJHKFmvb++pvfW7Zcv02dnnr246bPWR0+lN8eLBQmt2txpIDuw1BC7BMHKVjC8k+CvBare+ufWG1TA3cXnI4FtMFcBxx3FDsSff1jRkpcxQfd2EemCd6o65RcJsvS5hPubb69Eh4wJbGz0D1PHNV2VDa70+w4twIAjcFplBPtv8wZBQ5W5VYuOzUgx1B57ow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(366004)(136003)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(38100700002)(82960400001)(83380400001)(478600001)(53546011)(6506007)(6666004)(66476007)(6486002)(66946007)(26005)(66556008)(2616005)(6512007)(316002)(5660300002)(8676002)(86362001)(36756003)(31696002)(8936002)(2906002)(41300700001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2ljUHlIcnBSWHZzajVoa1d1c3lYV0kxMlkya1JvamRLVFZnVTU1TU5DcUxZ?=
 =?utf-8?B?TUI1bUU4SUFMVEJCdVBOQVpSL3hHbWFweXdsRkhLZHllcTk4RkJ2KzFZcC85?=
 =?utf-8?B?d3NVc2JMTnN2d3dRMjRoMnRZQ1ZpbE8veDNvci91M3ZYZmQ2R040bHd1NWF0?=
 =?utf-8?B?NFZDejBTZUhSVzV0UUVqR3VOSWFHckNDODU2RGVvNEFxMHAzTjk1bFI1ZVNP?=
 =?utf-8?B?aWNkMk9KL240Rnd1TmZKQ0htb0drR1pTNnhFVnRkbnVZTmp0Y2lhQ2pkVCsv?=
 =?utf-8?B?R0ZkSDZwZHJuTC9vbEN1WGVMd1Y0VlhXcStHRm10VVdBUmk4SEwrL3F3OEVt?=
 =?utf-8?B?a0pxb0RlVmRoUy9aNVZsQ0Z5SWhpWXoxcTBmUnhPeEI2TDlEQlBaMzZPY1FP?=
 =?utf-8?B?TG1oNHA5RFhlQStFcHdUTyt6dVFDdVMwYjZmOWczeVlTUFlnVUtaZ0pGTEhD?=
 =?utf-8?B?eGxjUDZSVlEzUHd6bjFQdWpKeGhiVmtzWHI4Vkg1WTRsbTBwYndRVFdaK2M5?=
 =?utf-8?B?RytLdzgwaFJPdm5xNVVaL3BoejRsNG1YcHRXajNjNkx5V1ZUZVBXdVc3cVc2?=
 =?utf-8?B?VHRybk1XUWhLd3VnenlmM0g4Ujg5aFdUbmk0N2d4eW9DSll4UGVGbUdKbW5T?=
 =?utf-8?B?V2ZrUFAyZHhsczEvRXdvRTFaa3NtSHhOeVN1ZVBJR0NqS0laZVFLU1FyR29M?=
 =?utf-8?B?OCtMNy8xTG54ekxTZFVPVnQ1M2k0a3haWTRRUkVXdGVBYy9KMi90ZTB6QUJu?=
 =?utf-8?B?NDQ5VVdsNm5KMzNIVmZrcDdWMTZacTdFb2dxQ0d4emlvR1c0R0haMEQ4M3Mw?=
 =?utf-8?B?Z2pCYTM3d3B2UklqTDIvQ3dLZXgrVllxQUhoZWFHemM2TXdwQXNGbUdGVVpC?=
 =?utf-8?B?MEhlZDlacUxGVGFKR0xuM3UyeFJHYjVxQ2gxRGJDa2lzZkJNTS9GSDNwa3Bi?=
 =?utf-8?B?MlJiSnVHUEFQTjRTQ09Gdysyb1R3NkdtQVhmUWxxZy9YUWdZSXU4eEhkOTBl?=
 =?utf-8?B?NVJ2WFJ2TU1ZbUZKRW9EK2orYVNXOXhFYkxFYUkwQjVTODBieFJoN2ZseG53?=
 =?utf-8?B?aXdVcmk5WGlhaG8xUG5aUnNYUVM5Q2VDUCsvaG80YzZMMjFkUUlKaWlWRW5q?=
 =?utf-8?B?Q0UwSVdxRm90WjFvWkw2RlJwLzU3VUxTS0d3ZUpETlJwZ2E0NTVaanZWS2VJ?=
 =?utf-8?B?UVZ3MW92T3RHSmZzUjJtOHc3OGVhcTk4a0ZNdjJucGtjMTVHMmh0VDhlMlFs?=
 =?utf-8?B?YjZFdndVQU1CaURMdGIrc1ZmZzhEa0xiTGlrb0J3bWZUZWoyWEFrZDFzTlJX?=
 =?utf-8?B?OWxHUkd5ZC9ad0lVVGJIbTNvREZ2WFVka3NXaWZlYXFBcTBaRDQ0YXRhbDN3?=
 =?utf-8?B?QlY4SVdXTTFhMHVJdEZra2FzRjZTeWE2bU5WUUtZT1l6UUZJcnRKb1NaN01u?=
 =?utf-8?B?MGNFZVJkbHN0OTcydHpHZFJXNnRZbTJ3VUYzU0xkbnFiL09oNHJORU5IbG1H?=
 =?utf-8?B?UUFrVHRnVlZpM1cwWnJKMjFoRDFwWHNvUjYrUDNFK0tQeHJzaUlnMlNXMFBu?=
 =?utf-8?B?NVFadU1uNjJ4ZXRsR2psbm5TbWxQN25WR0FEeXl5akxxUUJNd09YNUZNWWgz?=
 =?utf-8?B?VFRrbzZoVGdsY2w1Z0FmeGwraWJCb1czN1Zwa1plMUdma2NQMGRoU1hkWGRX?=
 =?utf-8?B?bWVrY05FcC9TZ3FnTk16dU1zOTJoVzU2NzZBZ2xTbHFqU0szUzRzTjlUbkFa?=
 =?utf-8?B?RE03eWl1bmRHWWJEOVMvUFM0MnNrcVo3cXZGQlkyRzBPazh5eFFOWUZUZzNX?=
 =?utf-8?B?QjlFWnBKRHg0N3pZMmpCWG4xS0htZGo1VEFqZUplendVeVZkd2FYb2dQdEQ1?=
 =?utf-8?B?SWJybFlITWVVK3YyT2VtcTRUaUF0azVnYUlhT2Jhek9CeUhZaVcra0ljYVds?=
 =?utf-8?B?d2JjZWp6S25IcnNXblN1NUNtM3pOcnhMYkxRQUwwV20xWDdhbkVCUm9lanhQ?=
 =?utf-8?B?TXlwcmNFcFpiQ1BaZUx4OUNiMUtROG5FVi8rUnlQY3BLTzVuclc2RXN1WUpL?=
 =?utf-8?B?bTYvS3M4RURrOXp2ZnQvbFJBd2k0V1J1cVhYWVdNamVCdjM3SmthQUtPM2N4?=
 =?utf-8?B?NTduc2gxdjlRT0NIaE9BcklWSXpDelRwQ0lUZDRVcCtRcWUrYVlHcitxZXpk?=
 =?utf-8?Q?RfnqtEt/wedt5JiZS4kOoqo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04903697-9037-4b79-67c9-08dbe0ab07c2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 22:35:37.8496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQgXHQk+nrpzD2HmQkm19sAxa9xFpXUbjwnL5EnIAG0aXf5R6zAgljogyxageLe8kgsQJOUBHGzv7OUNVRCqoiEshLgngHzGE+dv+TUHfG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6176
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 07/12] drm/xe/gsc: Implement WA 14015076503
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



On 11/8/2023 2:22 PM, John Harrison wrote:
> On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
>> When the GSC FW is loaded, we need to inform it when a GSCCS reset is
>> coming and then wait 200ms for it to get ready to process the reset.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: John Harrison <john.c.harrison@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile           |  2 +-
>>   drivers/gpu/drm/xe/regs/xe_gsc_regs.h | 10 ++++++
>>   drivers/gpu/drm/xe/xe_gt.c            | 44 +++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
>>   4 files changed, 56 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 474b6044d054..4a442dcf4d79 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -37,7 +37,7 @@ quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
>>   $(generated_oob) &: $(obj)/xe_gen_wa_oob 
>> $(srctree)/$(src)/xe_wa_oob.rules
>>       $(call cmd,wa_oob)
>>   -$(obj)/xe_guc.o $(obj)/xe_migrate.o $(obj)/xe_ring_ops.o 
>> $(obj)/xe_vm.o $(obj)/xe_wa.o: $(generated_oob)
>> +$(obj)/xe_gt.o $(obj)/xe_guc.o $(obj)/xe_migrate.o 
>> $(obj)/xe_ring_ops.o $(obj)/xe_vm.o $(obj)/xe_wa.o: $(generated_oob)
> Is it not worth splitting this into multiple lines?

Not sure how readable it'd be if we have a rule on multiple lines. Maybe 
instead I can just add a variable with the list of files and use that in 
the rule. Not sure it belongs in this patch (or series) though.

>
>>     # Please keep these build lists sorted!
>>   diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>> index 22d2ad9cb64d..9a84b55d66ee 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>> @@ -16,6 +16,13 @@
>>   #define MTL_GSC_HECI1_BASE    0x00116000
>>   #define MTL_GSC_HECI2_BASE    0x00117000
>>   +#define HECI_H_CSR(base)    XE_REG((base) + 0x4)
>> +#define   HECI_H_CSR_IE        REG_BIT(0)
>> +#define   HECI_H_CSR_IS        REG_BIT(1)
>> +#define   HECI_H_CSR_IG        REG_BIT(2)
>> +#define   HECI_H_CSR_RDY    REG_BIT(3)
>> +#define   HECI_H_CSR_RST    REG_BIT(4)
>> +
>>   /*
>>    * The FWSTS register values are FW defined and can be different 
>> between
>>    * HECI1 and HECI2
>> @@ -26,4 +33,7 @@
>>   #define   HECI1_FWSTS1_PROXY_STATE_NORMAL        5
>>   #define   HECI1_FWSTS1_INIT_COMPLETE            REG_BIT(9)
>>   +#define HECI_H_GS1(base)    XE_REG((base) + 0xc4c)
>> +#define   HECI_H_GS1_ER_PREP    REG_BIT(0)
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 73c090762771..0e8e24bded1c 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -10,8 +10,10 @@
>>   #include <drm/drm_managed.h>
>>   #include <drm/xe_drm.h>
>>   +#include "generated/xe_wa_oob.h"
>>   #include "instructions/xe_gfxpipe_commands.h"
>>   #include "instructions/xe_mi_commands.h"
>> +#include "regs/xe_gsc_regs.h"
>>   #include "regs/xe_gt_regs.h"
>>   #include "xe_assert.h"
>>   #include "xe_bb.h"
>> @@ -504,16 +506,58 @@ int xe_gt_init(struct xe_gt *gt)
>>       return 0;
>>   }
>>   +static int gsc_fw_is_loaded(struct xe_gt *gt)
>> +{
>> +    return xe_mmio_read32(gt, HECI_FWSTS1(MTL_GSC_HECI1_BASE)) &
>> +                  HECI1_FWSTS1_INIT_COMPLETE;
>> +}
> This function is duplicated exactly in the GSC source file. That seems 
> bad. Either it should be exported and shared or the usage here should 
> be moved to the GSC specific file.

This was on purpose. We do have a bit of duplication for simpler 
functions in the Xe codebase; e.g., guc_to_gt() is re-implemented in 
every single file that uses it (I count 6 copies). I can see that this 
is pushing it a bit tough, since it's a GSC internal detail in a non-GSC 
file, so I'll export it as you suggested. I might also instead export 
the WA code from the GSC file to hide all the GSC internals in there, 
will look at both options and see what looks better.

Daniele

>
> John.
>
>> +
>> +static void wa_14015076503_start(struct xe_gt *gt)
>> +{
>> +    /* WA only applies if the GSC is loaded */
>> +    if (!XE_WA(gt, 14015076503) || !gsc_fw_is_loaded(gt))
>> +        return;
>> +
>> +    /*
>> +     * wa_14015076503: if the GSC FW is loaded, we need to alert it 
>> that
>> +     * we're going to do a GSC engine reset and then wait for 200ms 
>> for the
>> +     * FW to get ready for it.
>> +     */
>> +    xe_mmio_rmw32(gt, HECI_H_GS1(MTL_GSC_HECI2_BASE),
>> +              0, HECI_H_GS1_ER_PREP);
>> +
>> +    /* make sure the reset bit is clear when writing the CSR reg */
>> +    xe_mmio_rmw32(gt, HECI_H_CSR(MTL_GSC_HECI2_BASE),
>> +              HECI_H_CSR_RST, HECI_H_CSR_IG);
>> +    msleep(200);
>> +
>> +    return;
>> +}
>> +
>> +static void
>> +wa_14015076503_end(struct xe_gt *gt)
>> +{
>> +    if (!XE_WA(gt, 14015076503))
>> +        return;
>> +
>> +    xe_mmio_rmw32(gt, HECI_H_GS1(MTL_GSC_HECI2_BASE),
>> +              HECI_H_GS1_ER_PREP, 0);
>> +}
>> +
>>   static int do_gt_reset(struct xe_gt *gt)
>>   {
>>       int err;
>>   +    wa_14015076503_start(gt);
>> +
>>       xe_mmio_write32(gt, GDRST, GRDOM_FULL);
>>       err = xe_mmio_wait32(gt, GDRST, GRDOM_FULL, 0, 5000, NULL, false);
>>       if (err)
>>           xe_gt_err(gt, "failed to clear GEN11_GRDOM_FULL (%pe)\n",
>>                 ERR_PTR(err));
>>   +    wa_14015076503_end(gt);
>> +
>>       return err;
>>   }
>>   diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules 
>> b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index f3ff774dc4aa..132c35497f74 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -19,3 +19,4 @@
>>           SUBPLATFORM(DG2, G12)
>>   16017236439    PLATFORM(PVC)
>>   22010954014    PLATFORM(DG2)
>> +14015076503    MEDIA_VERSION(1300)
>

