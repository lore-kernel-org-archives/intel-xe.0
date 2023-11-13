Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAEEC4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 21:33:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B5C10E430;
	Mon, 13 Nov 2023 21:33:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E0710E430
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 21:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699911197; x=1731447197;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ONSQ3T/rZ5HDEEJj4ejvFdmBZCZAvTBcOUSNwwaRZG8=;
 b=fbnB8uyeZDP62cLyr5MhBnnr8XqCAjKhxfV9i61zIW+DLsC70ZX5bvG+
 blwExEIsWAaCXMzMZJ/9YmOhZPEqmr8a8+QZTKXG4viRXDGECMgjJFKCW
 rhK3eWD6z4Jp6L3TqzEnOMlJiLft0Nn+P0i5hBnET779D00O64ch8++8B
 gqEMBR61T+pPrHPRVi5+v75W2C9zXCHKl7AaK+Ztwv0hpO6+8jQrvNXpZ
 dANGhD7YgGmA9kU8mBsfa6bW8uXlp7QmJjnFLMJtrOnL5Wes//Sb/7GA6
 fLctlG7ytjADIEoZ8cTXQ8fAZ8pviszLARhZNY7SLEncuzIOmJNryEXay Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3602944"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="3602944"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 13:33:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="5790777"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 13:33:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 13:33:14 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 13:33:14 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 13:33:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgoEp6MayZVOorDlz/EzFg2z7Bo1kLsKe+eUTpTtxnX2lRV6O6vcnUW1Y0mZuhsIze0QZvlm7o2B82SL913aQ4tNmFenGq7D3pjHdV4kATaPDZ7YjV8hG3LCnVYFMWVItCf8zJ0qOJ9VfTDxgd72xlmhSN9roOlHxgjW1wqnUG11EBDDXkxekcgdt72Nq5FD4sKgA8lwQA9hqNm9ilqgsjF/Tyz96R4iVAwdzQHNo/Pg1FE2wWOfsEmRqqw9t5NC6Cc0Y/kAFHsQA6pnzL65yX2knE6I+7vMO0xuf2EhYwWEj+YzkUexOgOYcxYlTxuaNTHLjcroAvr+4V0JFBu0KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJJZzwkUksZgY9doWxFHGJmRtdr27HWB8qebikHosso=;
 b=dumMhOXckFDcVBDPErIW0ba8oDZsmVpeXfR2qjsL+SJdGneSxt2IlbUr1N0fJRi3g72Oo13i63TZ5Qad2FznuCt21PKmSjFZDvY7eh0U/BljwxSxl5qXiuDaEcJL2SFBE9lXFZaOLj8bkyLoqHS5y3HH7ElbVjQqmS7zKEsPor6MhKHmPvTiL1qzeGaHwr5HjlaLkGSz8MCMgf1M0XLKmxTti4BNkC8tqyZAXkT7rT5mzkV1ALVNqWEEYuGt6KsGXzf92T1+KC93Vet1Ao6Bz2w/B4ktiWvluOM/wS5uigtDvvFxc9t2QbxShmdqJRDtPkpQszMF0VMGClIyc7P+ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CO1PR11MB4978.namprd11.prod.outlook.com (2603:10b6:303:91::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 21:33:11 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86%7]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 21:33:11 +0000
Message-ID: <7af83841-78d9-46a5-a1f2-cf03c391b677@intel.com>
Date: Mon, 13 Nov 2023 13:33:11 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-13-daniele.ceraolospurio@intel.com>
 <a565e56a-3dc0-4073-b657-399a3966f650@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <a565e56a-3dc0-4073-b657-399a3966f650@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0375.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::20) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CO1PR11MB4978:EE_
X-MS-Office365-Filtering-Correlation-Id: d221baa9-1d9a-47ba-1231-08dbe49022cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2xGYj+ZyTLSMcq0wkTFaYXW/6nbIDfcH3hpbdgSIjkXp/oivJEUPqXC3dlX2Ydgro/jHtg5RHw/iClpIjA5Et1gfvASfdXEeCZ75+PbGQMn+xreeqAPBBgvsErFsLuv4UH8kf7Mq5gvHKUAlr43vbeCeWnEqA9B16AQLZrKB/WClWLMid4uRVwq0RGmzzGS/ga8VRwm+jz8gFmaqXa/LlRPh3FdMDh3Gc5psuRURyJNyY5nRlBUGIkSF6GC+IDA459266unZF8JbH2AztdWqPC/99fDdACNmQj0driOChUGJImtjOy+3QtrAFijNeRFaay+M+zxGMayXd2spVN0lTtD2Q6QnjOpQjI61rnABqPY1K9tQR4db1/efAMdBJdS34BiqnOKP29HlWo/GS7tKf/5clnrE1bUZ14dLQx57Y35gArSZZ4wI97XQGnipILMKAR4mxuEdTJt4R1JmC9TAwsBc/DjWXdP/BCiVmtGEwHAH1Pdul43BVheiKtfrBEA7c8EAsQS3x7AiPxF6B1Zmqs8LGDkMc+qxDL/Qljg/XFaL5WV59utofl2etkccwrXLwoi2MjKNeVqKN2f01OKKiP6cO4yzaW9D/YDFgn3caRLIsbtaR2kwtn/m0mWo52hXLQxSAIzCjdSgy9JfybiOeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(346002)(39860400002)(136003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(38100700002)(2616005)(8676002)(8936002)(53546011)(6512007)(6506007)(83380400001)(26005)(31686004)(82960400001)(6486002)(478600001)(316002)(66556008)(66946007)(66476007)(36756003)(41300700001)(2906002)(5660300002)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXk2VWkwM0RlZzNVRjJOdHZuNG54Z2FCa3QzaE9CSE9XSDR6U1dYbTFhdmNw?=
 =?utf-8?B?STJ4RkZqSVJ2clVQL0cxc280QVkxbDJPZGxLT1pXQ1ZSMEZhN1JpK3k3UkQw?=
 =?utf-8?B?OEs1eDFBNnBQVXA3THJ6YjYxMDJLZVgrVXpKdkQxSnkybE1xSkNabDg2UmVn?=
 =?utf-8?B?bW9NeGNPc25iUGlYbUhyTFY5NjdFZXlQc1NuMXU1YTgzM2hXZ1dnNDRBRngx?=
 =?utf-8?B?enllN0ZoOVdjV3A2RDVOYUlWd1paMHVMd1VOSTAreUFWSHFKOGJhdmZ0cUhE?=
 =?utf-8?B?cE9UWWlMODZ6NFVJRXdESTJrOXpxNXhQQVNWRzRlU0RqWE1qUzJGcDB1OWhs?=
 =?utf-8?B?L1doQXMzckU1cUcrbGU5NkcrUDVJenFnQzFlK0IwK1kzUEEyeVJTZzJvWG4y?=
 =?utf-8?B?cDhCU0UvZzBGcUxFUWc1QW5XeDlNVzArWUtwN3BqWElwRldlWENFVE80TVNs?=
 =?utf-8?B?cGEvR2NMQzJDVUtQSXpzQ1BpMDlmOFV2d0tVbm5rWWNtN05HcWU2Ry9RTXBT?=
 =?utf-8?B?ZjNmVHE5ZnZJL1VqK3lKcXdpQUt2c2x3NEFNaHMwNi9yaHJKT2NRYXlsOXNM?=
 =?utf-8?B?R0R0SkY4UWd0ZWpVQ0ZOV3pCaFNodmRPMkhRcHZnYXNnWldjakZNbGFRQnkv?=
 =?utf-8?B?QjB3b1grUzNacW9IdkE5QVNZanV2K1hVandMMmx0QkhZVnVXb2RyeDNFRWho?=
 =?utf-8?B?Wjd3TjZ3MTRBajBXVnMyUmdXTnFZaUtIdVo1bGJ2eWIyZklMTGtKOTF1VkJD?=
 =?utf-8?B?VVhGL0hYL2ZneFVubVV4dmVBKy8zSng4RlBNUlBXZGpNdjIrU2FqQ0pNQWs5?=
 =?utf-8?B?cDdrNUJQV1RGZitaOUVGTlRiVWJscG9xZkhxZ3ZvRjdlR3Y0VUtSZ2JGbWRk?=
 =?utf-8?B?T1FyWnltcTliWWdmelp0Rk5aSCtycWhxVURRUFJPRXVMM2Z4SlpNUldpTU5p?=
 =?utf-8?B?SktPendHM2xESTRoMzdpbWFON3U4eDluQkIzcUtDQlVUVEhHNkhPbm05Vjh6?=
 =?utf-8?B?WndmUEZkMFl2UXVFZ28wRnZHKzI0SmpnSFJNVEs2RzZhSURHdFQzVUFmcG83?=
 =?utf-8?B?MmtJSndGWVczd1JTeUVtWWxuNkU4eVJiSlpuUEpRQXdjZFVVK29zUE5tMFkz?=
 =?utf-8?B?T2FMRlowUmdrU0tnMElsNGMyQkQzV3JDYmlSc3lsQ0I4bmVLUWJnSUk3a0V6?=
 =?utf-8?B?M0R1N3BIR3poRGFQNU9pNGJwTkhXb3ZJZy9kanlpV1l1NlFBZkduTkxQbDZt?=
 =?utf-8?B?MWFtWC9MS1VtdEJoem00Y3NsWCtWWEdsZzVLWU11TlRqMERUMHJaeUdRYUZW?=
 =?utf-8?B?QVdXVGMzUGdEN0RwdmZjblV4WGRGYUVDckw4VGxpWDBUN09yMDJnbC82a1hO?=
 =?utf-8?B?K2paMDh4Nm9LcC9pZExTVE11RUxJWEVCWUJIR0JZTHN2eCs3Ny9ETERJazZX?=
 =?utf-8?B?MlVaYnB0Z3dkVDMyK0xZTllBSWNpS1haNG1IT1pWb25HaE9lbG0wZjFiVkdz?=
 =?utf-8?B?aUlKU0xqMEFwUVJkMjJUZDFaQlgwMUlTQ3JVK2VWcWNHTnZySHBhQVd5cVVQ?=
 =?utf-8?B?Z1EzcFAxRGNVS0VwMnJUSkZHWXpacXZ1ejVwWUkyNElVWTRqejJqU3V6M05l?=
 =?utf-8?B?dWpEQ1hQM0RObWlPRnc5Q0kwWkVaQXRydEFHa0JoNnEzT28wTmd5UTEwNVpu?=
 =?utf-8?B?bkFZMFNsSmV0NjlGdXMwNExqN2hRb2h1VW9QSjdkQVByaFlBZ3JHWHcyaTFH?=
 =?utf-8?B?TWR5ZHRSUElPNTNObVl3SHBmaW5qclFTY1VQa2d6cHJ1Vk1zWjc2TXd6UFZE?=
 =?utf-8?B?MUdHWWZRY0FpS0tGcko0QWJhTnlEY0F2eTladjNpOGs2Nk1QS2hNYlBLMlB5?=
 =?utf-8?B?bnExSnBjbCtNQUZTYzJNSVlJQVl2eENLZUtHcUFWaUhycFQ5eEVRUWQ4QU8r?=
 =?utf-8?B?akVYYXZ6cTBRODZxODhobE5FWEE5aVpiN2pjWkJZeFUyMmZoU2ttKzl3S0NG?=
 =?utf-8?B?UmxoZVlVUVowUDd2VEJqWWtuSnVlaVI2L2Fvb24xczVvYlp4T01PYmNzVkl4?=
 =?utf-8?B?YjFGcHoyR2dlWHBoWWFscmowczJLREVlbUowclpZWTR6WVlINEE5UW0xRk5E?=
 =?utf-8?B?VjZ4eldBbVlaT2Z4VTBjVks1UGpRWlQ5RlJjTDRHMTFYTXduQjdxeldvdTZL?=
 =?utf-8?Q?QvQ0k2tun2BgQLkSYLms4o8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d221baa9-1d9a-47ba-1231-08dbe49022cb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 21:33:11.4481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uLYDIUY3imAJkAuVRmjIJ+hvdhBdefsVHUfrNx3VuZeBnlxY0kA6XqeuyZfZlHqVLlHW1VFOnhQs5njcEhxL8sTkieE5jdMGicL+Fk32R+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4978
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 12/12] drm/xe/gsc: Define GSC FW for MTL
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



On 11/13/2023 12:26 PM, John Harrison wrote:
> On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
>> We track GSC FW based on its compatibility version, which is what
>> determines the interface it supports.
>> Also add a modparam override like the ones for GuC and HuC.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_module.c |  5 +++++
>>   drivers/gpu/drm/xe/xe_module.h |  1 +
>>   drivers/gpu/drm/xe/xe_uc_fw.c  | 20 ++++++++++++--------
>>   3 files changed, 18 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_module.c 
>> b/drivers/gpu/drm/xe/xe_module.c
>> index 7194595e7f31..8df7aea64ad5 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -41,6 +41,11 @@ module_param_named_unsafe(huc_firmware_path, 
>> xe_huc_firmware_path, charp, 0400);
>>   MODULE_PARM_DESC(huc_firmware_path,
>>            "HuC firmware path to use instead of the default one - 
>> empty string disables");
>>   +char *xe_gsc_firmware_path;
>> +module_param_named_unsafe(gsc_firmware_path, xe_gsc_firmware_path, 
>> charp, 0400);
>> +MODULE_PARM_DESC(huc_firmware_path,
> s/huc/gsc/;

D'oh! Thanks for spotting this.

Daniele

>
> John.
>
>> +         "GSC firmware path to use instead of the default one - 
>> empty string disables");
>> +
>>   char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
>>   module_param_named_unsafe(force_probe, xe_param_force_probe, charp, 
>> 0400);
>>   MODULE_PARM_DESC(force_probe,
>> diff --git a/drivers/gpu/drm/xe/xe_module.h 
>> b/drivers/gpu/drm/xe/xe_module.h
>> index e1da1e9ca5cb..7f49f95630d5 100644
>> --- a/drivers/gpu/drm/xe/xe_module.h
>> +++ b/drivers/gpu/drm/xe/xe_module.h
>> @@ -12,4 +12,5 @@ extern u32 xe_force_vram_bar_size;
>>   extern int xe_guc_log_level;
>>   extern char *xe_guc_firmware_path;
>>   extern char *xe_huc_firmware_path;
>> +extern char *xe_gsc_firmware_path;
>>   extern char *xe_param_force_probe;
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index f57476f57de9..c9360d918b96 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -121,6 +121,10 @@ struct fw_blobs_by_type {
>>       fw_def(ROCKETLAKE,    no_ver(i915,    huc, tgl))        \
>>       fw_def(TIGERLAKE,    no_ver(i915,    huc,        tgl))
>>   +/* for the GSC FW we match the compatibility version and not the 
>> release one */
>> +#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)        \
>> +    fw_def(METEORLAKE,    major_ver(i915,    gsc,    mtl,    1, 0))
>> +
>>   #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)            \
>>       __stringify(dir__) "/" __stringify(shortname__) "_" 
>> __stringify(uc__) version__ ".bin"
>>   @@ -155,6 +159,7 @@ XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
>>                fw_filename_mmp_ver, fw_filename_major_ver)
>>   XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
>>                fw_filename_mmp_ver, fw_filename_no_ver)
>> +XE_GSC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE, fw_filename_major_ver)
>>     static struct xe_gt *
>>   __uc_fw_to_gt(struct xe_uc_fw *uc_fw, enum xe_uc_fw_type type)
>> @@ -196,23 +201,19 @@ uc_fw_auto_select(struct xe_device *xe, struct 
>> xe_uc_fw *uc_fw)
>>                        uc_fw_entry_mmp_ver,
>>                        uc_fw_entry_no_ver)
>>       };
>> +    static const struct uc_fw_entry entries_gsc[] = {
>> +        XE_GSC_FIRMWARE_DEFS(XE_UC_FW_ENTRY, uc_fw_entry_major_ver)
>> +    };
>>       static const struct fw_blobs_by_type 
>> blobs_all[XE_UC_FW_NUM_TYPES] = {
>>           [XE_UC_FW_TYPE_GUC] = { entries_guc, 
>> ARRAY_SIZE(entries_guc) },
>>           [XE_UC_FW_TYPE_HUC] = { entries_huc, 
>> ARRAY_SIZE(entries_huc) },
>> +        [XE_UC_FW_TYPE_GSC] = { entries_gsc, ARRAY_SIZE(entries_gsc) },
>>       };
>>       static const struct uc_fw_entry *entries;
>>       enum xe_platform p = xe->info.platform;
>>       u32 count;
>>       int i;
>>   -    /*
>> -     * GSC FW support is still not fully in place, so we're not 
>> defining
>> -     * the FW blob yet because we don't want the driver to attempt 
>> to load
>> -     * it until we're ready for it.
>> -     */
>> -    if (uc_fw->type == XE_UC_FW_TYPE_GSC)
>> -        return;
>> -
>>       xe_assert(xe, uc_fw->type < ARRAY_SIZE(blobs_all));
>>       entries = blobs_all[uc_fw->type].entries;
>>       count = blobs_all[uc_fw->type].count;
>> @@ -248,6 +249,9 @@ uc_fw_override(struct xe_uc_fw *uc_fw)
>>       case XE_UC_FW_TYPE_HUC:
>>           path_override = xe_huc_firmware_path;
>>           break;
>> +    case XE_UC_FW_TYPE_GSC:
>> +        path_override = xe_gsc_firmware_path;
>> +        break;
>>       default:
>>           break;
>>       }
>

