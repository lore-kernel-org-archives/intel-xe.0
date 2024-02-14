Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A9FC48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 19:13:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7160110E24D;
	Wed, 14 Feb 2024 19:13:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EK0cId37";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E35710E24D
 for <Intel-Xe@lists.freedesktop.org>; Wed, 14 Feb 2024 19:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707938023; x=1739474023;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EyT7nM6BIyQBl8s6ktK8ZqVzP9mTAusuaJ+LzRwOido=;
 b=EK0cId37L2MccTACMhoTlFcePu6ZQeSfD96l1z2lohNJPV6Qv7q/gehQ
 Gxf1eg77XIoKUUTqiAVMhMqMelCAuYiAGAa6nIzED7+pXEt4O8L4MHG07
 2KrjAi2EE14siKGwaxeRYW/gsNBcsu7lbVTnAnkxCC4KT4BAx6n0f4gIG
 9ZvVM6WtxTfba2wqNU4diqdGCrRfVp6YcwReEobqssaQ+7EYCT6822pqR
 vezw/cvgjCahQ1es+6sIc7eDukOmYWusexVWuykKK/WwpFJMW1FV8Q+KS
 sGV/AP0+AsB9x25NdvHNsJ+Cdtu1iERtkTpyPppw/E9ZR7aPZMg+eloPI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="13399846"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; d="scan'208";a="13399846"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 11:13:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="3267079"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 11:13:41 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 11:13:41 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 11:13:40 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 11:13:40 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 11:13:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHwXozD3NHdFyKGgiWbFltuSsfBukA8TuJ4oZPABPvAwI65OddEaPKi+MTGec6JHjIg4olFDdjACQ2Oxkk5mCsId1mWoNDewpgooteHGkY7fWrMsWfADIrgtQc/FeOs6dPOJOKW0fGC9TqH0Yu3jHpxWcCtzQM/KzmPEEL6bX3GQjSllI7LwvZWfKFYSHJ5TOZOwYi3L1rMQ0BKwfZ5CJf9E2+L6nCLf7Ho/yCgjtTcLR78RA+Exs17fhr1j04iJTfLTwlEqtarj7Fd5t+yXx4+zm4DwCmwd0AFN4gLwfYcAeser2QHmBlHkXghCAeCKdcGem1cUs3Mg/b4zhR0ajw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWi2eIzntoUn2HFCw6y+RYWCovnsPUi4W18Vjj5atNQ=;
 b=XYURJLLZFZqFwGuw0bnRQ8LJwaL2jt2Lku3JHbEj57xIsofWW20AV+Ko1OMiiogNok9kSOrMk8IFdzpC9UJ7bRJfi3uV5UxHtdBk8Ltm1Y2ZMlwsOK8/U6VD6ZGXP0ietG+p08cWpRYuW0UywhR8Mw8svE/QLNtST/dBHD898CdqtyQUcdVRvr2aKaPjD1rV3CazSm6lWsx5d3aUfbIzbQyf9tS4FwHPw/Tnq/NA2KdTEpntUQf+57n2Z/j9Ew3t/LZysramlatBNEkBWa9Ii8W16xkD+3GBUyShfK8jbbL/cthaj03Pf6/zEmk/3vhVij2wLXtP6yPLvAw7jckEzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by IA1PR11MB6466.namprd11.prod.outlook.com (2603:10b6:208:3a6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Wed, 14 Feb
 2024 19:13:37 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7292.026; Wed, 14 Feb 2024
 19:13:36 +0000
Message-ID: <88530ac2-a69f-433b-ae5f-5212599cb85a@intel.com>
Date: Wed, 14 Feb 2024 11:13:33 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/guc: Port over the slow GuC loading support
 from i915
Content-Language: en-GB
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240213003426.3943662-1-John.C.Harrison@Intel.com>
 <20240213003426.3943662-3-John.C.Harrison@Intel.com>
 <d8ec5d48-b356-42c6-9140-41c6868a1546@intel.com>
 <81c28b98-82f7-412c-a60d-9b19e372faeb@intel.com>
 <a48cc9b7-6d1b-4264-b400-3949583c0d5f@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <a48cc9b7-6d1b-4264-b400-3949583c0d5f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:a03:505::11) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|IA1PR11MB6466:EE_
X-MS-Office365-Filtering-Correlation-Id: 2317982e-0777-42f0-f50f-08dc2d910b05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vGmBi8kMJs1B8uVLl3i2x89qu/CAfta9KBNBgRlr0aofS3L7Q+oJ7EdCrYnUH6xJ86ZhB8TJOwqODz7FKF1+IybCmXfF7C//uYVMvGpHKk3/8l7hNhBhmp1Qg608TKh2OrZmKi8JUgyNfSziXka84aQtegfs46iGhg0oTLG/LlG+xFlvq8ewB+x/Uv00GNQOblWaSPzRByhCEXKowxhlNH6iwKNBMJ/sYdE4/Zija2aM9Xkg3322qvL3HAlpDXWiQEz2bvDIBdvj1AowW7+sGWOdQnN9+xKoBsYMbjBNA2NVomCELus5uoYL0DYQYX6xY8wZqptukNDwXV3usQmcSse62jOcM61zrmCYmq7MlFNsEHe2pJv3Phbr2tpkzKS2e/eA+cj/4G/7n+670uB07NhZZhPE/d15S9o4RyBbXAprFgRnHEzQID6rtk7LMrkqUJsjazcInSNVqdoX706D+sgOCm5PN8KFOby1N+JQRD2YEOuVtqDFB0ANCCyu1eOEB4hDN9kyEOrLh4xmwiIBNXfvoxwZEIXLPeTGuTlxHOekQq87+n9gDmqOp4cWuSEH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(396003)(136003)(366004)(230922051799003)(230273577357003)(451199024)(64100799003)(1800799012)(186009)(36756003)(41300700001)(2616005)(26005)(6666004)(83380400001)(6512007)(8936002)(66946007)(6486002)(478600001)(316002)(8676002)(86362001)(31696002)(66556008)(6506007)(82960400001)(53546011)(38100700002)(66476007)(31686004)(30864003)(2906002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3N6NUltZHdnUGlmZ0hpL29mR09oeng0TGdzbmdlYStMQWVvek4rOHpBOWdm?=
 =?utf-8?B?RUFDR0hsODNPSFdPVjNJdGUrcGg2Y1g2MHhoTWRNTnBwdWVGZjhjMGZLM3V3?=
 =?utf-8?B?UGtTdFdaY29vL3FjUlpCZVlzTytoT0FKUWxEQzRVZkF3UnFhL1BUbENYMWdV?=
 =?utf-8?B?clYweHFNTXpoeXRvTkd5TWFXa2NKOWQwWHpGS0t1dk8yMFZTOThKbUNUTFls?=
 =?utf-8?B?dVBYYThJQTNtbXQzRURhR2lseHpieU1ieXRIRGFCZ0VWVC9EWjVNYW1PVlR0?=
 =?utf-8?B?ZE16MTNXRnU5WkZVYXhSQ2Y4Qzk4TDNtZFV2TkxCT0F1NVp6SUxMeVJ3N3pY?=
 =?utf-8?B?ZG01ZHVjWkNhTHR3Rlc5b2p0V1JoUUJRVzgxOVJqZklSQVlnQ0dCR0x2VXpG?=
 =?utf-8?B?aFFYYlB0VEdRaUM1RTBYM0dlQXpybitzblJ4bm9vYzNqWDhIRUljQk4wNUhh?=
 =?utf-8?B?NVNMWGZTemxYbWtvUEFKNXFKenZ3RXFoRUVGQkhUQzdXN0hkQmpKVVF3L0hk?=
 =?utf-8?B?dWxjVllWOGxMYnRYZFFveEsxQURxWllFaUdDbjByMjlBa0dIOVFTd1FTUWk0?=
 =?utf-8?B?bElaZ2w1cUlOUG5BeEpjUlNxTEM3ajBzL3kvdGhOVWNSQzNXRG4zV1Q5WjZL?=
 =?utf-8?B?Yk11ZnNvMEYyN2ZSa0dUcGJCd2dCY1o3eURDQ3lrbTZTWmhKZk05c1Y0NnJx?=
 =?utf-8?B?SDBUbUJIUGs5eDA0Z1puZXFNYlp0dVJmdnpzdXVWdjY1NGtrYjJrL3dIVHIv?=
 =?utf-8?B?eW85S1lGUHc2MXRiZFQ3MFFFT2RmUEgvdjZ6Yno1MU1wVnBLRXdaZVUydnNJ?=
 =?utf-8?B?eG0wdUY1VDdUaW8vcllYQ0FjUVQzUVgwbnJaZmY4OGRudzBvMlhUZHAwc1NJ?=
 =?utf-8?B?clVQSzBBU1VoQ3Z2ZCtYcytFMXZSUTYzaTlEaERodzBHWkJqZk82bGJBbjho?=
 =?utf-8?B?dUo3WFgxYlFqSmdIdVlVRGhVQWYvL290aC9kWWNVMWNpRVYrNzByR0prTkJV?=
 =?utf-8?B?V0VFVVN4UHNxV1ZrNDR5RXFzTzdpU1hPZXUrMHRYZi9HRE5TMktobzdKTUR6?=
 =?utf-8?B?Ly9PYVZxOGROVEN3ZEJ6aU05akExVmhyejBNVmpKTDh4UHFyQnRFdVltR0dH?=
 =?utf-8?B?Z2NBQWkwUm1wd0lhajdtajJpZ0FidFY3RTd4Z0o2bWltVG9ZOHZHa0VyRGRB?=
 =?utf-8?B?a2x5akVqMHNySkJuV0NxMmlqc1JDOG53WG1PNzl3TnVJSk1LNGtOU2FUQWlw?=
 =?utf-8?B?VlJneVpmQVNTUHhCeWNLL2lkSVpsbDNuRU9HWVRXY3lxaElqdGkremZFMCsy?=
 =?utf-8?B?aHV6K0hyOWVDZFZ0VzltTkVpeHBIcFN0RC81OW9Ca0N4NUhDclVEWTlnaXFn?=
 =?utf-8?B?QlpQUkpEZG1IeDk2Qy91ZHZwUjlmL3pDbnVSSnZHcWdGeVZ2dzdWYWFvanBC?=
 =?utf-8?B?L0RxOTFZVTg5T284UjVHWEorL1h5WjRkN1JCK0ZuWkNKN2dudWNyZ1FzVG05?=
 =?utf-8?B?cUdZcG1pU2tGSWN4V1d2QWxBQzFvVnFGb2dxTzhyN2pNajgxV0UveWUwNDBq?=
 =?utf-8?B?ekJtS04vWFR6NTE0UVpUMDVUWnJmV3FPT2N5Yk9WVUw5eWcvVXhMQTdiaGNW?=
 =?utf-8?B?eXVTd1Q4SU5oZDJNWVc5M3hnSktJdmNWSXlkVkxNbEJXc1VCSTdRVlRLSDZv?=
 =?utf-8?B?OVdKWFoxNnNJdzd3cDBkS1RXS1VIRkFVSTNVcVlGUnEwYjB5QnZ0cmhzZzlz?=
 =?utf-8?B?VGh6bUdhSmNPQXBiVDMrTGtYRTkwR08wZ2dGZ0F3R1Fpa2VCN0VIK0VCOUFJ?=
 =?utf-8?B?TkJINlUrQ1d5UGFDL2pNS2tFbGZxVks2MFptREZIbGpaYnRkVHZhSlZONUdJ?=
 =?utf-8?B?L1VrSXo2TzNxM3Q2eUdHZTdyVUk2WUVRRlMxdDJKZDErbEYwc2pOeWl5Wkta?=
 =?utf-8?B?SUR4YVN6czhMTUtudnFaSlc4b1ZjMmN4V1BTSUhwek92d2s2akduZVpjdk5s?=
 =?utf-8?B?VnFtSVAyMVJQZWhNYTJtMG9UK0V6ZU16K3ZDQUR6YlhjMEZrQTEzbjFCTlBH?=
 =?utf-8?B?ZGNSeHRWbjBrQkd2SHphaVdLM3hRaS9vZERoc0xnbXVzWTV1MTJTbE5UQ2d1?=
 =?utf-8?B?eDlaQUpaM1N2UGw1U1lseTh5VVB5K1hBL05OLzlOYkJjUVpCU3g2U3hGVVMr?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2317982e-0777-42f0-f50f-08dc2d910b05
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 19:13:35.9919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GS0encelfUEb6g/PxEkH67tn7YxREX3J1ywK0kBbp9wQYgFsgItHiRuUFj3VsxgaIdTRgQg/Ll504TQi8doTMZ+h/s1gnm+O6O6U336e5EA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6466
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

On 2/13/2024 21:39, Nilawar, Badal wrote:
> On 14-02-2024 07:44, John Harrison wrote:
>> On 2/12/2024 21:17, Nilawar, Badal wrote:
>>> On 13-02-2024 06:04, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> GuC loading can take longer than it is supposed to for various
>>>> reasons. So add in the code to cope with that and to report it when it
>>>> happens. There are also many different reasons why GuC loading can
>>>> fail, so add in the code for checking for those and for reporting
>>>> issues in a meaningful manner rather than just hitting a timeout and
>>>> saying 'fail: status = %x'.
>>>>
>>>> Also, remove the 'FIXME' comment about an i915 bug that has never been
>>>> applicable to Xe!
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/abi/guc_errors_abi.h |  26 +++-
>>>>   drivers/gpu/drm/xe/regs/xe_guc_regs.h   |   2 +
>>>>   drivers/gpu/drm/xe/xe_guc.c             | 197 
>>>> +++++++++++++++++++-----
>>>>   drivers/gpu/drm/xe/xe_macros.h          |  32 ++++
>>>>   4 files changed, 214 insertions(+), 43 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h 
>>>> b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>>> index ec83551bf9c0..d0b5fed6876f 100644
>>>> --- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>>> +++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>>> @@ -7,8 +7,12 @@
>>>>   #define _ABI_GUC_ERRORS_ABI_H
>>>>     enum xe_guc_response_status {
>>>> -    XE_GUC_RESPONSE_STATUS_SUCCESS = 0x0,
>>>> -    XE_GUC_RESPONSE_STATUS_GENERIC_FAIL = 0xF000,
>>>> +    XE_GUC_RESPONSE_STATUS_SUCCESS                      = 0x0,
>>>> +    XE_GUC_RESPONSE_NOT_SUPPORTED                       = 0x20,
>>>> +    XE_GUC_RESPONSE_NO_ATTRIBUTE_TABLE                  = 0x201,
>>>> +    XE_GUC_RESPONSE_NO_DECRYPTION_KEY                   = 0x202,
>>>> +    XE_GUC_RESPONSE_DECRYPTION_FAILED                   = 0x204,
>>>> +    XE_GUC_RESPONSE_STATUS_GENERIC_FAIL                 = 0xF000,
>>>>   };
>>>>     enum xe_guc_load_status {
>>>> @@ -17,6 +21,9 @@ enum xe_guc_load_status {
>>>>       XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH       = 0x02,
>>>>       XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH       = 0x03,
>>>>       XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE      = 0x04,
>>>> +    XE_GUC_LOAD_STATUS_HWCONFIG_START                   = 0x05,
>>>> +    XE_GUC_LOAD_STATUS_HWCONFIG_DONE                    = 0x06,
>>>> +    XE_GUC_LOAD_STATUS_HWCONFIG_ERROR                   = 0x07,
>>>>       XE_GUC_LOAD_STATUS_GDT_DONE                         = 0x10,
>>>>       XE_GUC_LOAD_STATUS_IDT_DONE                         = 0x20,
>>>>       XE_GUC_LOAD_STATUS_LAPIC_DONE                       = 0x30,
>>>> @@ -34,4 +41,19 @@ enum xe_guc_load_status {
>>>>       XE_GUC_LOAD_STATUS_READY                            = 0xF0,
>>>>   };
>>>>   +enum xe_bootrom_load_status {
>>>> +    XE_BOOTROM_STATUS_NO_KEY_FOUND                      = 0x13,
>>>> +    XE_BOOTROM_STATUS_AES_PROD_KEY_FOUND                = 0x1A,
>>>> +    XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE            = 0x2B,
>>>> +    XE_BOOTROM_STATUS_RSA_FAILED                        = 0x50,
>>>> +    XE_BOOTROM_STATUS_PAVPC_FAILED                      = 0x73,
>>>> +    XE_BOOTROM_STATUS_WOPCM_FAILED                      = 0x74,
>>>> +    XE_BOOTROM_STATUS_LOADLOC_FAILED                    = 0x75,
>>>> +    XE_BOOTROM_STATUS_JUMP_PASSED                       = 0x76,
>>>> +    XE_BOOTROM_STATUS_JUMP_FAILED                       = 0x77,
>>>> +    XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED               = 0x79,
>>>> +    XE_BOOTROM_STATUS_MPUMAP_INCORRECT                  = 0x7A,
>>>> +    XE_BOOTROM_STATUS_EXCEPTION                         = 0x7E,
>>>> +};
>>>> +
>>>>   #endif
>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h 
>>>> b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>> index 92320bbc9d3d..a30e179e662e 100644
>>>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>> @@ -40,6 +40,8 @@
>>>>   #define   GS_BOOTROM_JUMP_PASSED REG_FIELD_PREP(GS_BOOTROM_MASK, 
>>>> 0x76)
>>>>   #define   GS_MIA_IN_RESET            REG_BIT(0)
>>>>   +#define GUC_HEADER_INFO                XE_REG(0xc014)
>>>> +
>>>>   #define GUC_WOPCM_SIZE                XE_REG(0xc050)
>>>>   #define   GUC_WOPCM_SIZE_MASK            REG_GENMASK(31, 12)
>>>>   #define   GUC_WOPCM_SIZE_LOCKED            REG_BIT(0)
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>> index 868208a39829..82514d395704 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>> @@ -16,6 +16,7 @@
>>>>   #include "xe_device.h"
>>>>   #include "xe_force_wake.h"
>>>>   #include "xe_gt.h"
>>>> +#include "xe_gt_freq.h"
>>>>   #include "xe_guc_ads.h"
>>>>   #include "xe_guc_ct.h"
>>>>   #include "xe_guc_hwconfig.h"
>>>> @@ -427,58 +428,172 @@ static int guc_xfer_rsa(struct xe_guc *guc)
>>>>       return 0;
>>>>   }
>>>>   +/*
>>>> + * Read the GuC status register (GUC_STATUS) and store it in the
>>>> + * specified location; then return a boolean indicating whether
>>>> + * the value matches either completion or a known failure code.
>>>> + *
>>>> + * This is used for polling the GuC status in an xe_wait_for()
>>>> + * loop below.
>>>> + */
>>>> +static inline bool guc_load_done(struct xe_gt *gt, u32 *status, 
>>>> bool *success)
>>>> +{
>>>> +    u32 val = xe_mmio_read32(gt, GUC_STATUS);
>>>> +    u32 uk_val = REG_FIELD_GET(GS_UKERNEL_MASK, val);
>>>> +    u32 br_val = REG_FIELD_GET(GS_BOOTROM_MASK, val);
>>>> +
>>>> +    *status = val;
>>>> +    switch (uk_val) {
>>>> +    case XE_GUC_LOAD_STATUS_READY:
>>>> +        *success = true;
>>>> +        return true;
>>>> +
>>>> +    case XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
>>>> +    case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
>>>> +    case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
>>>> +    case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
>>>> +    case XE_GUC_LOAD_STATUS_DPC_ERROR:
>>>> +    case XE_GUC_LOAD_STATUS_EXCEPTION:
>>>> +    case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
>>>> +    case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
>>>> +    case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
>>>> +        *success = false;
>>>> +        return true;
>>>> +    }
>>>> +
>>>> +    switch (br_val) {
>>>> +    case XE_BOOTROM_STATUS_NO_KEY_FOUND:
>>>> +    case XE_BOOTROM_STATUS_RSA_FAILED:
>>>> +    case XE_BOOTROM_STATUS_PAVPC_FAILED:
>>>> +    case XE_BOOTROM_STATUS_WOPCM_FAILED:
>>>> +    case XE_BOOTROM_STATUS_LOADLOC_FAILED:
>>>> +    case XE_BOOTROM_STATUS_JUMP_FAILED:
>>>> +    case XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED:
>>>> +    case XE_BOOTROM_STATUS_MPUMAP_INCORRECT:
>>>> +    case XE_BOOTROM_STATUS_EXCEPTION:
>>>> +    case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
>>>> +        *success = false;
>>>> +        return true;
>>>> +    }
>>>> +
>>>> +    return false;
>>>> +}
>>>> +
>>>> +/*
>>>> + * Wait for the GuC to start up.
>>>> + *
>>>> + * Measurements indicate this should take no more than 20ms 
>>>> (assuming the GT
>>>> + * clock is at maximum frequency). However, thermal throttling and 
>>>> other issues
>>>> + * can prevent the clock hitting max and thus making the load take 
>>>> significantly
>>>> + * longer. Indeed, if the GT is clamped to minimum frequency then 
>>>> the load times
>>>> + * can be in the seconds range. As, there is a limit on how long 
>>>> an individual
>>>> + * usleep_range() can wait for, the wait is wrapped in a loop. The 
>>>> loop count
>>>> + * is increased for debug builds so that problems can be detected 
>>>> and analysed.
>>>> + * For release builds, the timeout is kept short so that user's 
>>>> don't wait
>>>> + * forever to find out there is a problem. In either case, if the 
>>>> load took longer
>>>> + * than is reasonable even with some 'sensible' throttling, then 
>>>> flag a warning
>>>> + * because something is not right.
>>>> + *
>>>> + * Note that the only reason an end user should hit the timeout is 
>>>> in case of
>>>> + * extreme thermal throttling. And a system that is that hot 
>>>> during boot is
>>>> + * probably dead anyway!
>>>> + */
>>>> +#if defined(CONFIG_DRM_XE_DEBUG)
>>>> +#define GUC_LOAD_RETRY_LIMIT    20
>>>> +#else
>>>> +#define GUC_LOAD_RETRY_LIMIT    3
>>>> +#endif
>>>> +#define GUC_LOAD_TIME_WARN      200
>>>> +
>>>>   static int guc_wait_ucode(struct xe_guc *guc)
>>>>   {
>>>> -    struct xe_device *xe = guc_to_xe(guc);
>>>> +    struct xe_gt *gt = guc_to_gt(guc);
>>>> +    struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
>>>> +    ktime_t before, after, delta;
>>>> +    bool success;
>>>>       u32 status;
>>>> -    int ret;
>>>> +    int ret, count;
>>>> +    u64 delta_ms;
>>>> +    u32 before_freq;
>>>> +
>>>> +    before_freq = xe_guc_pc_get_act_freq(guc_pc);
>>>> +    before = ktime_get();
>>>> +    for (count = 0; count < GUC_LOAD_RETRY_LIMIT; count++) {
>>>> +        ret = xe_wait_for(guc_load_done(gt, &status, &success), 
>>>> 1000 * 1000);
>>>> +        if (!ret || !success)
>>>> +            break;
>>>> +
>>>> +        xe_gt_dbg(gt, "load still in progress, count = %d, freq = 
>>>> %dMHz (req %dMHz), status = 0x%08X [0x%02X/%02X]\n",
>>>> +              count, xe_guc_pc_get_act_freq(guc_pc),
>>>> +              xe_guc_pc_get_act_freq(guc_pc), status,
>>> I think this should be current requested frequency 
>>> xe_guc_pc_get_cur_freq
>> No. The point is to report what the actual frequency was to see if 
>> that explains why the load is running slowly. The requested frequency 
>> is under driver control. That should be at maximum during driver 
>> load. The
> Is requested freq set to maximum in resume path as well?
It is meant to be. There was a bug raised recently where it seems that 
it is not. I believe Vinay either has a fix or is working on a fix.

>> granted frequency is not under driver control. That is the unknown 
>> that needs to be reported to see why the system is not working as 
>> intended.
> Agreed but in the expression "freq = %dMHz (req %dMHz)" actual 
> frequency is being printed 2 times. What is significance of "(req 
> %dMHz) here", I thought req stands for requested.
Um. Blurgh. You are totally correct. The original version of this only 
had the actual frequency but after the recent debug effort that 
triggered porting this over from i915, I added the requested frequency 
as well. Or at least attempted to but evidently got it wrong. And then 
promptly forgot that I had done so and was only reading your comments in 
reference to the code in my head that matched the i915 driver. Doh.

Thanks,
John.

>
> Badal
>>
>> John.
>>
>>
>>
>>>> + REG_FIELD_GET(GS_BOOTROM_MASK, status),
>>>> +              REG_FIELD_GET(GS_UKERNEL_MASK, status));
>>>> +    }
>>>> +    after = ktime_get();
>>>> +    delta = ktime_sub(after, before);
>>>> +    delta_ms = ktime_to_ms(delta);
>>>> +    if (ret || !success) {
>>>> +        u32 ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, status);
>>>> +        u32 bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, status);
>>>> +
>>>> +        xe_gt_info(gt, "load failed: status = 0x%08X, time = 
>>>> %lldms, freq = %dMHz (req %dMHz), ret = %d\n",
>>>> +               status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
>>>> +               xe_guc_pc_get_act_freq(guc_pc), ret);
>>> Same as above.
>>>
>>> Regards,
>>> Badal
>>>> +        xe_gt_info(gt, "load failed: status: Reset = %d, BootROM = 
>>>> 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
>>>> +               REG_FIELD_GET(GS_MIA_IN_RESET, status),
>>>> +               bootrom, ukernel,
>>>> +               REG_FIELD_GET(GS_MIA_MASK, status),
>>>> +               REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>>>> +
>>>> +        switch (bootrom) {
>>>> +        case XE_BOOTROM_STATUS_NO_KEY_FOUND:
>>>> +            xe_gt_info(gt, "invalid key requested, header = 
>>>> 0x%08X\n",
>>>> +                   xe_mmio_read32(gt, GUC_HEADER_INFO));
>>>> +            ret = -ENOEXEC;
>>>> +            break;
>>>>   -    /*
>>>> -     * Wait for the GuC to start up.
>>>> -     * NB: Docs recommend not using the interrupt for completion.
>>>> -     * Measurements indicate this should take no more than 20ms
>>>> -     * (assuming the GT clock is at maximum frequency). So, a
>>>> -     * timeout here indicates that the GuC has failed and is 
>>>> unusable.
>>>> -     * (Higher levels of the driver may decide to reset the GuC and
>>>> -     * attempt the ucode load again if this happens.)
>>>> -     *
>>>> -     * FIXME: There is a known (but exceedingly unlikely) race 
>>>> condition
>>>> -     * where the asynchronous frequency management code could reduce
>>>> -     * the GT clock while a GuC reload is in progress (during a full
>>>> -     * GT reset). A fix is in progress but there are complex locking
>>>> -     * issues to be resolved. In the meantime bump the timeout to
>>>> -     * 200ms. Even at slowest clock, this should be sufficient. And
>>>> -     * in the working case, a larger timeout makes no difference.
>>>> -     */
>>>> -    ret = xe_mmio_wait32(guc_to_gt(guc), GUC_STATUS, GS_UKERNEL_MASK,
>>>> -                 FIELD_PREP(GS_UKERNEL_MASK, 
>>>> XE_GUC_LOAD_STATUS_READY),
>>>> -                 200000, &status, false);
>>>> +        case XE_BOOTROM_STATUS_RSA_FAILED:
>>>> +            xe_gt_info(gt, "firmware signature verification 
>>>> failed\n");
>>>> +            ret = -ENOEXEC;
>>>> +            break;
>>>>   -    if (ret) {
>>>> -        struct drm_device *drm = &xe->drm;
>>>> -
>>>> -        drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
>>>> -        drm_info(drm, "GuC load failed: status: Reset = %d, 
>>>> BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
>>>> -             REG_FIELD_GET(GS_MIA_IN_RESET, status),
>>>> -             REG_FIELD_GET(GS_BOOTROM_MASK, status),
>>>> -             REG_FIELD_GET(GS_UKERNEL_MASK, status),
>>>> -             REG_FIELD_GET(GS_MIA_MASK, status),
>>>> -             REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>>>> -
>>>> -        if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
>>>> -            drm_info(drm, "GuC firmware signature verification 
>>>> failed\n");
>>>> +        case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
>>>> +            xe_gt_info(gt, "firmware production part check 
>>>> failure\n");
>>>>               ret = -ENOEXEC;
>>>> +            break;
>>>>           }
>>>>   -        if (REG_FIELD_GET(GS_UKERNEL_MASK, status) ==
>>>> -            XE_GUC_LOAD_STATUS_EXCEPTION) {
>>>> -            drm_info(drm, "GuC firmware exception. EIP: %#x\n",
>>>> -                 xe_mmio_read32(guc_to_gt(guc),
>>>> -                        SOFT_SCRATCH(13)));
>>>> +        switch (ukernel) {
>>>> +        case XE_GUC_LOAD_STATUS_EXCEPTION:
>>>> +            xe_gt_info(gt, "firmware exception. EIP: %#x\n",
>>>> +                   xe_mmio_read32(gt, SOFT_SCRATCH(13)));
>>>>               ret = -ENXIO;
>>>> +            break;
>>>> +
>>>> +        case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
>>>> +            xe_gt_info(gt, "illegal register in save/restore 
>>>> workaround list\n");
>>>> +            ret = -EPERM;
>>>> +            break;
>>>> +
>>>> +        case XE_GUC_LOAD_STATUS_HWCONFIG_START:
>>>> +            xe_gt_info(gt, "still extracting hwconfig table.\n");
>>>> +            ret = -ETIMEDOUT;
>>>> +            break;
>>>>           }
>>>> +
>>>> +        /* Uncommon/unexpected error, see earlier status code 
>>>> print for details */
>>>> +        if (ret == 0)
>>>> +            ret = -ENXIO;
>>>> +    } else if (delta_ms > GUC_LOAD_TIME_WARN) {
>>>> +        xe_gt_warn(gt, "excessive init time: %lldms! [status = 
>>>> 0x%08X, count = %d, ret = %d]\n",
>>>> +               delta_ms, status, count, ret);
>>>> +        xe_gt_warn(gt, "excessive init time: [freq = %dMHz, before 
>>>> = %dMHz, perf_limit_reasons = 0x%08X]\n",
>>>> +               xe_guc_pc_get_act_freq(guc_pc), before_freq,
>>>> +               xe_read_perf_limit_reasons(gt));
>>>>       } else {
>>>> -        drm_dbg(&xe->drm, "GuC successfully loaded");
>>>> +        xe_gt_dbg(gt, "init took %lldms, freq = %dMHz, before = 
>>>> %dMHz, status = 0x%08X, count = %d, ret = %d\n",
>>>> +              delta_ms, xe_guc_pc_get_act_freq(guc_pc),
>>>> +              before_freq, status, count, ret);
>>>>       }
>>>>         return ret;
>>>> diff --git a/drivers/gpu/drm/xe/xe_macros.h 
>>>> b/drivers/gpu/drm/xe/xe_macros.h
>>>> index daf56c846d03..eac8f2c9fba5 100644
>>>> --- a/drivers/gpu/drm/xe/xe_macros.h
>>>> +++ b/drivers/gpu/drm/xe/xe_macros.h
>>>> @@ -15,4 +15,36 @@
>>>>                   "Ioctl argument check failed at %s:%d: %s", \
>>>>                   __FILE__, __LINE__, #cond), 1))
>>>>   +/*
>>>> + * xe_wait_for - magic wait macro
>>>> + *
>>>> + * Macro to help avoid open coding check/wait/timeout patterns. 
>>>> Note that it's
>>>> + * important that we check the condition again after having timed 
>>>> out, since the
>>>> + * timeout could be due to preemption or similar and we've never 
>>>> had a chance to
>>>> + * check the condition before the timeout.
>>>> + */
>>>> +#define xe_wait_for(COND, US) ({ \
>>>> +    const ktime_t end__ = ktime_add_ns(ktime_get_raw(), 1000ll * 
>>>> (US)); \
>>>> +    long wait__ = 10; /* recommended min for usleep is 10 us */    \
>>>> +    int ret__;                            \
>>>> +    might_sleep();                            \
>>>> +    for (;;) {                            \
>>>> +        const bool expired__ = ktime_after(ktime_get_raw(), end__); \
>>>> +        /* Guarantee COND check prior to timeout */ \
>>>> +        barrier();                        \
>>>> +        if (COND) {                        \
>>>> +            ret__ = 0;                    \
>>>> +            break;                        \
>>>> +        }                            \
>>>> +        if (expired__) {                    \
>>>> +            ret__ = -ETIMEDOUT;                \
>>>> +            break;                        \
>>>> +        }                            \
>>>> +        usleep_range(wait__, wait__ * 2);            \
>>>> +        if (wait__ < (1000))                    \
>>>> +            wait__ <<= 1;                    \
>>>> +    }                                \
>>>> +    ret__;                                \
>>>> +})
>>>> +
>>>>   #endif
>>

