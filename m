Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35056EB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 10:29:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077FC10E5F8;
	Fri, 16 Jun 2023 10:29:22 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F36E10E5F8
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 10:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686911359; x=1718447359;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pMYKmVDcE5fEqXtlKUkU/JH+xipzVCKcGpIbG8OOHwk=;
 b=OxhdcrRznPYFb5QAErFwQgmRRQA58qIZRb+K+4mtUQweU0TUCBqwDwSD
 ypcEFwWCzyNw64tHvfN1HiGmXlTIxmsNFTFc+mKLTLC7MLz/WP11wx/TN
 yxXHUAhaCYpfanN30YTgl/DXyDVmsut8QfMvnT2Xf0ZGj5znJ3R7bOxTe
 MYoWvG7o+qa6FE9KCHZcQlSynfPCrIrD1azXUIZ3QUl3krJqikrgRNhGn
 KknNgNCmgZ8nnPBh+8Ce3PELbLRhDXTsWkrNNDN0+B6ur7y0xaxQnozw3
 kQ4VItija6iXonj0+VgHhGfRqYj0T98Lqij0OiZWvO2xIXoNAxDkGHKQ2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="339510677"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="339510677"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 03:29:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="836996687"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="836996687"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 16 Jun 2023 03:29:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 03:29:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 03:29:17 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 03:28:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Brp8IL4OnWk1D+SLjzKD9YUVXFF/O8ypJxOxz5LrB9HcdYuzD135CcvZJVv0+jMTb0WMDvJCgSV9bT8T9JVukAA7PNN4nD1u3rdFlpFr8ZdecRRbLYF2kvdlQxFtSWHrqGIaLNO5kgMhH+mWjOzfHatc6LC9jfxrZU29aQJSaFxoYq0Xac0NY1vwAtlerynQEcKVWBsgVW8iIVAQWI4JWfWIozpBUaem9qeGKuvZ7AxHnVPMZND93dNae+11Kw+knoexxRNI+STfvI897NzomtiZq9GB1mGUUvveBLwQT0aGs1yziyy1UzUgVJUMv2M0YxROumfkdw6MP4s4O5TfJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/M+Yl7Zb8PgTgWZ6ayFKug1X5DuOdhti1qd6VtsUp8=;
 b=a/1zK3gBvn3Rlle6Iij4ojhjvDIUV6SPyZprBHWyab1j//xB6NlfnTTXNaPxWbg728QEwV/hukWkRRnlgugzNKO7IGHQAaH3OvuPH1+KObaCrmOwEQnnwp2bkVnS+rqGuaoO3s8yxb4aOWAazI5sba0bSlZLuAhLLhBiwXpG5T9Q3Qhx4MjPCsB7koZsrwzO8X/T0Qh30Dqg3s0DQLyndLfO3KwLKf+mAp1AblwSjiG1BpUh4ETNYn0FS/VPtBLoxfaNYBXJ793CzGtVkRGx368e9Z+LDXAI86XTN7QyvopqRBOh7ovB0czRW4Zq9za0rFn4QgjuTJ0csbSLgfQ8sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 10:28:57 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5%7]) with mapi id 15.20.6500.025; Fri, 16 Jun 2023
 10:28:56 +0000
Message-ID: <da4eb08d-ab93-f13e-88c0-face6cd56de6@intel.com>
Date: Fri, 16 Jun 2023 15:58:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230616092521.3862926-1-riana.tauro@intel.com>
 <20230616092521.3862926-2-riana.tauro@intel.com>
 <ZIwzYJd+1Q6rnslF@ashyti-mobl2.lan>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZIwzYJd+1Q6rnslF@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::9) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|MW4PR11MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: c8387a99-41b2-4d53-2346-08db6e547d68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fg6ct2Q6y/Orv22Hd0pkTDNHLCKaB441JVn0uv7+iaGxBBx+O6y7yaDm87FM0W9NRHjtCG4OzFt2PrhxOvewounoELIfPERH9YPdBz2PLxtPjzvt963kKVSNGkQoHQYBVvGJyG0cEGDz4YO8Ko0EWubLOqHsYJHzB4lTInCtvm0HEotp9CME1WmzPCYEWg3Ok/ytFdxORRp19YTsBOGkXrMBbhoYPYo5qg2kYDItqLJ37HXEiNrB/OwIxsvuD/21Q2wnkUDsdzQ7nlcNckJCVGcKHhHZSnztxdwABOtbFvfRI3A4e6xU0fBMDjXzVOwTAOBq0LY7hAgyuzuswexN6TauCYwDY0gXvkRHoz9QmBS/7UI3MyA/JeL4/jb/7CdNz3GB80v+wuTQxbZwBEKFeSPXAk9A1UOMcAGY686pkJWFrr2jrePe6Dk554BV0jWm71RRBOMxTFv5asdvB3l0aN8lJ2oh+xvjR4nV2Totf4V3EGbDhX+asMi2OOZ+7S4GkyXjak+6FcM5LlVVyHlmyBy1dhAzraCdyifgW4/ID+Ot617pEik5M7N9zFiyzTRe9F0mqPo9imQ8G1K379wq5y4wPXFRoF94Yyl50w5/IZeKu2/BRR2maVDpWplt2HA+JC1sMMzl+pmMCDq1ywqKEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(136003)(346002)(39860400002)(376002)(451199021)(53546011)(6512007)(6506007)(26005)(6916009)(66946007)(4326008)(316002)(66476007)(66556008)(2616005)(83380400001)(31686004)(186003)(6486002)(6666004)(478600001)(38100700002)(8676002)(44832011)(82960400001)(8936002)(5660300002)(86362001)(31696002)(41300700001)(2906002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDdTWlJ2VHdkNEc4SG5zMDVKak5kMTBpZy9tTDgwaXI5b0dDYUNFT1Qva1Zx?=
 =?utf-8?B?TjNOTGdIZFRzRjM5MTBnb2g1VktXMGg3SXFTd2MvNzFGc0ZIU1Z2d3hTaXNI?=
 =?utf-8?B?M3ROWHIyWGJ4Z29BVGNjMkxPeFVkWThHb3g3SzNzK1M4VzA5bS9WVU9CbDNw?=
 =?utf-8?B?TU1LMi83MEJDTjBwUDQ1dE5KVUdLOC8zYjJDQm9YdU1kc3VVZU50RDQ3TlpK?=
 =?utf-8?B?alQzdnlrV0lqN1o0djJ6QUJoNjJZVklVdm5OeEFTYVlMVHZqaDFzU09MZmRT?=
 =?utf-8?B?cW5FcGk0MS8vZW40RWs1QUUxclhERlBVRk9CZGU3RWUrQm1BcnROaU05b3or?=
 =?utf-8?B?VUhseTFaazllZ1RiKzlrcUthVmF2dERKQ0VEMTVpWU5VakxadmdBZVRkZWlT?=
 =?utf-8?B?c0NISGdqYXdPTkZWQ3pFQTdaUlRCVHNvUytreUhLT1V2eE92NGpnM2duVUpt?=
 =?utf-8?B?dTdTY3lKL1I5MHMxRXBRYmIvY0FJUWdvTFhreXYwT2t4QWhpa0VVeTZXbWo2?=
 =?utf-8?B?bEJWdy83NGNZdzJWbkcyamFHRjlROGdHS21jdlVzTC9IQlZGQTVMYUZhZ3ZX?=
 =?utf-8?B?SitCSGZnRTRqZk11aWdCSE1TY25JR0crN0hleU91aDBqd1Fpc0phVHJoZ3gx?=
 =?utf-8?B?aFNnbmdSalFOSEtDQmJVWUFDa3hHYlJKcy9zYVY5TnlQVEZjQy81WXpmS2sx?=
 =?utf-8?B?ZFVUUVFOWjlCWXRISk5kRE1aRlExanJxVTVlVVBYOUw1ZmFvcnRhZ3piU3FB?=
 =?utf-8?B?MmsyTkw1ZHh1SmxmWU9sMkRQRDRld216OTJVNUE3cjNDN25Td0todnU1Vll6?=
 =?utf-8?B?RVVnMDhWdVRBK2ZqY3B0bkQwQjdocUZGeG10OGlrZ3hwOG92N0dCQWQ3NzhG?=
 =?utf-8?B?T2JxSG5OR1Rya2dNaXRBTVFDbTd5Z1pDblF2bGpXaE5OaUh5ZzJqcUh4eGk5?=
 =?utf-8?B?Vk9wS0c1R1A0Z0QrSDRJZ21aVFJrTDhTdnRLcnN1ZFc4NGNPWkV6MitEQldo?=
 =?utf-8?B?RDlaVHNZT2RwRXA0Zm1oYUdvRERkWURISUo1MU1Wb1hodCtlelBxSmZlL2Rr?=
 =?utf-8?B?UnU4ZVhNenlnL3BMZ0JJY3BYWmFCWE1Ka0dPY3RxVlY2Wit2dHdCSG4vdnM4?=
 =?utf-8?B?YVNVak00TWV2UlM1cWFzSmV2eklMa1RPS1FjUjZyZHljL3ZVRmpRclNHS3Nw?=
 =?utf-8?B?b1NlaitVYllZZ0paQUZPcVkrWE90SGR6RE9FZHV2azdNRWJLUHZtZnh6dnNv?=
 =?utf-8?B?WktSa3BxdE91ZW0rdTZ1bVBhUTRySlpDMmF0QlR5aTdhODBzeGRrN1ovbEZU?=
 =?utf-8?B?c1VnODVIbk0wT1QyWjFCbXNoemJWYmZEeEpMMElNaVgxMFRVVXdzMjBjaVhk?=
 =?utf-8?B?ZjgyTGU2V2VFR3BFWmlSTG1iajVzOWYwWnlMVTdQZEYrZE1paG5zNTJ5MjVi?=
 =?utf-8?B?dzhUMnlIQVRzMFJEY0lkZjUybkNWdE12V21rYkFwTWZRZ3BDSTVhVm93UDJR?=
 =?utf-8?B?SEQ4MlpGUU45a3o1dm9weDZybDV5M2ZENCtQL3JabGdWc0ZuczRaQnJWRWRH?=
 =?utf-8?B?T0FjSlBHUFBHdElhelU4STF1eC9EangyN28rYTFqdzFzdFNhcHpGNnhzUGxX?=
 =?utf-8?B?bFhZM1g1eDRDMytGUVo0YXJoU1BtSDlxc2MwcGdsbGlRYzFRdVJHM21iVzJ0?=
 =?utf-8?B?Vi9MZ2s2cHlsWE93WGVVNThJVGFsM285MUJRaGJEcE11a3FBUTFOVkRTSlZW?=
 =?utf-8?B?eTRmSW5EbjVGMjlFWnJFZENPSkZkNHNlaWYxQlNwMWpLMk9CU3dYVzZDbnJ5?=
 =?utf-8?B?TUtBMnNkTzR5QTFGOEFaWGJadHhjZ1BGWmRteHQ4YTlNUGpCRVo0MExxK0o5?=
 =?utf-8?B?RWhhbDJ3WE5pTHovUnZmOFpMRlJ5RWNGVWtTUEJOY0xOVGMrUkJ4R3IxSDJL?=
 =?utf-8?B?QU1nbW5QcS9YTEQ5OGxNLzhESFZGam9HT3hpbHdHSm10akYwWm5tOUcra2dM?=
 =?utf-8?B?bk54QzVrc3EzUEV2ZCtVWnRuZ3IyTmhycXBZbUw2a1VMTXB1QkdSS0tqMUQv?=
 =?utf-8?B?dzRJMlA1bS9VWTlpZ0MvcHgyS1RLZldUbHljWTZZVGxUYkRVTkZhRXVNNkhC?=
 =?utf-8?Q?FA6ECxw9YBaneXn/EEOmLX0gJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8387a99-41b2-4d53-2346-08db6e547d68
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 10:28:56.7236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iQKf+oN4xZPk3XBxYcY7ss42MvfE6650wCym4YPPD8hh1m0WDTQf/PD4zY2bu0fjPOANZiFE5NflwEJUuMHq1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe: add a new sysfs directory for
 gtidle properties
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
Cc: joonas.lahtinen@linux.intel.com, vinay.belgaumkar@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Andi

Thanks for the review

On 6/16/2023 3:33 PM, Andi Shyti wrote:
> Hi Riana,
> 
> On Fri, Jun 16, 2023 at 02:55:20PM +0530, Riana Tauro wrote:
>> 1) Add a new sysfs directory under devices/gt#/ called gtidle
>>     to contain idle properties of GT such as name, idle_status,
>>     idle_residency_ms
>>
>> 2) Remove forcewake calls for residency counter
>>
>> v2:
>>      - abstract using function pointers (Anshuman)
>>      - remove forcewake calls for residency counter
>>      - use device_attr (Badal)
>>      - move rc functions to guc_pc
>>      - change name to gt_idle (Rodrigo)
>>
>> v3:
>>      - return error for drmm_add_action_or_reset
>>      - replace file and functions with gt_idle prefix
>>        to gt_idle_sysfs (Himal)
>>      - use enum for gt idle state
>>      - move multiplier to gt idle and initialize (Anshuman)
>>      - correct doc annotation (Rodrigo)
>>      - remove return variable
>>      - use kobj_gt instead of new gtidle kobj
>>      - move residency_ms to gtidle file
>>      - retain xe_guc_pc prefix for functions in guc_rc file (Michal)
>>
>> v4:
>>      - fix doc errors in xe_guc_pc file
>>      - change u64 to u32 for reading residency counter
>>      - keep gtidle states generic GT_IDLE_C[0/6] (Anshuman)
>>
>> v5:
>>      - update commit message to include removal of
>>        forcewake calls (Anshuman)
>>      - return void from sysfs initialization function and add warnings
>>        (Andi)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> 
> looks good!
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Andi
