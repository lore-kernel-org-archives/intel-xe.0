Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E48C77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 07:43:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C8E10E107;
	Fri, 12 May 2023 07:43:19 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E13510E107
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 07:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683877397; x=1715413397;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Jqsc0kCpBhm4BhPuHgCAU7rxDIgN1NkOkrUd7RgVD5A=;
 b=Bj/QPqas7WDIv4S/rMSkAHwn7YJaHN6Js+7uuSTZt1xQpWT2VvzrwqFM
 2gQq6VkpmZ4AooUy4rVq65OWe0jxZtW35P6XY6ElR5i2YUbJAQBnq5A+H
 Okec/1mnV1JFUceMRRB53epa2IHZyaWTIEYWtRy3bBDe4iFEjEF8wEXlQ
 RG/0gL1r3aRCnPL+qQaFGkZxcFYcthFV3AkzAvPlLTLm3wtx4/piEltno
 ShW6exiAgvYjXMWu/O0ICWFszQVl7RGwKWrcn6AahfV6IuU9w+dn+jRY9
 DBVr0w757gou8TZ8X3m0hGbutF1L+EcWAlS+Qn99BrMq+cHydUpvMXJWU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="348224546"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="348224546"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 00:43:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="874302073"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="874302073"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 12 May 2023 00:43:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 00:43:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 00:43:09 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 00:43:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCv7eZ/UlcRjyZqg2T1Eygfwxf09CJjKXRa2R+PO2Ht/P7X4ZuKLYXSERh9FINQFQfTRpyiQGWu+lfoCqtmyzqxngvpGCQ2prx+lFBsQ8NZ7mLuNl/9ZAIk9pOnDXBsMEFWOtB2XgI472HX1zS3co4Dgb/Tu2mdR2olYMEsoRn2SxppNsYxjW6tR+ToeD2J3yc87auPNaKcBGu8HCtQp5pegByGzPeVKvYtwwV73W+Dp3s9P+yRIqbeDwZGcdS0mqQoNplp7fbwon+2yp1DbuevxV/YGEjdX0EMm39Myyu+Xxk/6AGbjmNKBIoRnW0hTRkdIndyrgbrRPBiCpWH5gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OBJwCqbbVEEPd//mHZ93No0XJJCUm67KqHGHW/kEhQ=;
 b=M4rkSAkxDoRaxlMuqMIfNbFd5cbU56UkGjj4tOSiP9jPTk2qFUFkrQEI43VyiZfXI2ibB3oXjr1a1cu0oKG5JN5NiluVi68vzY3bS609khpL76K3QgNN6ZbMMZKvTWOlAGyrLUUrIyG5MwvHPszPx/j1224snaBs4aGq7cnP9PQpwdD/WBERMud6THcCB5y7+xcrmV6bZkaiLViPeQukQ15hP7dgpWwbolBOAJndyqes1g3aeuKHWhnldGHD1ZkOgfPP0E/9LQ20/VPW9B8g0K0aahJrur1gYR9/rP2wfgSPX6BaofU6894uchWsOOMh6FdZw05S1LZZuNn3FUmf+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by BL3PR11MB6458.namprd11.prod.outlook.com (2603:10b6:208:3bd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.23; Fri, 12 May
 2023 07:43:06 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::962f:b14d:4e3b:63b3]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::962f:b14d:4e3b:63b3%3]) with mapi id 15.20.6387.022; Fri, 12 May 2023
 07:43:06 +0000
Message-ID: <be5d1c4f-9b80-25c1-8f49-953dc867ddd4@intel.com>
Date: Fri, 12 May 2023 13:12:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230512052050.1308879-1-riana.tauro@intel.com>
 <SJ1PR11MB620489D583939A41F31A11B981759@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <SJ1PR11MB620489D583939A41F31A11B981759@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::18) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|BL3PR11MB6458:EE_
X-MS-Office365-Filtering-Correlation-Id: 66c7dbf9-2fec-4b0d-6d0f-08db52bc863a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cM1FlO/iM1zMJ7jaleU7sfvbIn6R/nfkQD/7By+Oe4qm/4WhuBrA56Z3agETyZG98pFoKAup8yPTCYOSYksMujyXIbBNixbahDEBwa3RgrWWNEXHEymXEFrArPjusS4G2tIgHqcEsIExUSxdhwPYUVmtQLbPhZDT9S2wZXyZA2HdXM4mqx1lKJrbOFHt7ArRqnpU7BxJHLYl4RJxEUu7+HEKRcHyd8Ks4bww7kjjqv+mDpstREq7XpCOfZGDWEHmFZqYB1eBJi4a75vibZe7qiDfLPwU60PyU0Ojp4t+iBEO+mhgU6nF+6PinwFca6rgmA1YXvE1RE3exKKZOCB3kzFecsLL4viY9RzlID7Zx4G44UoqaQ41L9ZrOqBnhMKNgbBQPjfaehSj2shf8QT1PINwartcfk/LNRpbESL8eiwutkUNPQqFXiY7OoRvcZzs0ZzBkAlMoTQTaMUKUNePnSsO6ozGsBVfwkAOjxDf3lYvqnfH6vHEXKIJGnF7CplTdPYXdgd2gIo9KHo++0AqBZDONiyq6fy4MV94mmzXmekiWoW8lp/1ny/1ry22aeflItGDfS7U7+EWlmiXTNFehhMwjFxLTNHtMvZmba+FAIGXK8+uMrcsEbJ12ESXANQDHzpoG0R7G3nSp8zhYS3NUrOH97iyIL50+9CB32WxW68=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(39860400002)(136003)(366004)(346002)(451199021)(110136005)(54906003)(83380400001)(478600001)(30864003)(66556008)(66946007)(66476007)(2616005)(6666004)(316002)(2906002)(4326008)(41300700001)(31686004)(966005)(8676002)(8936002)(107886003)(5660300002)(44832011)(26005)(186003)(6512007)(53546011)(6506007)(6486002)(82960400001)(38100700002)(31696002)(86362001)(36756003)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXhTMGMwYldqNndDRlV4MUtVUE9wMHNyeXhBdFljQ0NnUk50dlp3RWFaVlFr?=
 =?utf-8?B?SDRndnF3VHpUdVNTSmZGQzcwYjArdTdMWFEwbkxwb2dXRThEVmh4MDA0a0J2?=
 =?utf-8?B?RGtzNzh4UFNpWDQ4Wnh3aThZOEJpNWNHNFAya0NLT2JNSjFHb2s5R2JRMmJZ?=
 =?utf-8?B?VVRSSXFDNGdtZDhiVlNUUTVPQVJQMlNKUnVrZ1NrSUE2K3dEVFQrMXJ3c1dp?=
 =?utf-8?B?SUFmTS9yV1NuQW9LTERXbU9aNVY0Y3M0MldTbG5KalBnTGRoNnVwaE1meGxT?=
 =?utf-8?B?S3hBVFVMZTFOczFZZStkRldvNGZaYURpMm9rV29OR0lhODIybjg3eE9oUkRX?=
 =?utf-8?B?WjI0M2gxakZibHNLZlNkRXFNL0IvRmFaMlNNTmNRczlMRkYvSlhObEFOU3hB?=
 =?utf-8?B?Nyt1eXc2a3hoMHhpS1NLMXhTQ2NseFZQS2EybjJKdnEvMnpQVk9iRGR2VWxt?=
 =?utf-8?B?SEtld2ZjZGxXUG5CVG1MSTdYSFZWSEF6M0d3T2Q1dVpDRXZ0WlBSOHdMVCtz?=
 =?utf-8?B?VXV1SUFKUktReTUwcmhoWUljNndPV1RwbzZVY1RMTExkMW9NS2hDVXNKUy82?=
 =?utf-8?B?TmNRTmVOYU1uaFRzRi9jSnRKUWhXRVZrQWg0NnhrOUtqajd1TWx3d1g2ejhu?=
 =?utf-8?B?QUFTUGdtUnFBY0N5NEFrNUp4UWl3Vy9oQXV5RTFzdVJaQUZHb3RQUUZnTGU1?=
 =?utf-8?B?UnlQUDNhUVE1RTQ3dHNUTWxNYVRmY0haNys4dEVpT2JCZWkzT1l1bGx5V1Iw?=
 =?utf-8?B?RHJTbEllczdzdE4xMWJVU2dwc1NOZmpOQnUrdlhYWVhTM0YyN3pad1lWQ2Q2?=
 =?utf-8?B?L2tsVGFYSkR2WDlrdGNWK25XZWZSNFJXZ2YyUnVydkpucklkT3VSMWNRcEZJ?=
 =?utf-8?B?Z1MzejNoUXhRU0JMSmpObmFFWEViVkZTVTAzd1pOaTNCQU85Z1VJM3RjajhE?=
 =?utf-8?B?VUFOOGtEVzNqajVCWUpNV1Y1YW85akJLaU81ZGx4Zy8zRlpyN2ttVUt5aUQr?=
 =?utf-8?B?Yk9GM243MEpLdXczUjJrZ01RT3RCUDdxYzBXZ0o5VjFpbGtVK1BhVkVqd21D?=
 =?utf-8?B?VWhWVEpUc3k3aFFKTlFFaU9BSFNRNGdSMDZJbFhXQVBXcEhYdE9uaUplK25k?=
 =?utf-8?B?VWtiS29aakI4TnhDWTRVbjFVbmJ3K2JNUmJrcUFHWEo5NjZRWXVEdTArdGp4?=
 =?utf-8?B?S2FRRmNhcElUL3lFZWNhVGh2UUI0eTJKS3NFRFo0Q2lRQ0tVR1Z2Umt6U3l4?=
 =?utf-8?B?d2dEVFlzR2FzR0JoVTZSL1NYdjBCdFQ2MWJjTDJCK2p0YXJvWGY3Y0lobk9p?=
 =?utf-8?B?LythUlZFOHlsTWVib3c0TTBTQVFLQ3kyQVU2M2kwV0kzSUdJa0dVWG5TRzFz?=
 =?utf-8?B?RjJSNzJYZVJObUZjek5rRHZOdXlHa2xFL1V1dmxaRDFyREtYcFN5cHhza1Jp?=
 =?utf-8?B?Ni9QNzR1OUw2VUEzOVJOTUlESVpGTzRiSkIzTUdKa3B4Q1p3WEppemZjdlZy?=
 =?utf-8?B?eGMyWjVNbUl5b0N1Wk9JbnQ2UHJxbW52Q2NXbUo2K3Q1SC9USTZXVHhFRHJE?=
 =?utf-8?B?K1BPK0NOZ2l3OS9YWVN0dnhjRDI3bTduUVVibFJNd1NEdlgvRUp6T0dOV2Fs?=
 =?utf-8?B?ODIzOXV2QnByRXdNLzBiZFV2QU4zTG95YWQ2dFE3d1RxOTcwR0Yxek1SRFdY?=
 =?utf-8?B?WERGWGIrOC9IQ21zMjBBY0hlTm1ZL2JQU0lGYzhNcnEvNnl2by8yaTl2ZEtq?=
 =?utf-8?B?SDdFS0EwcVFCeThTc0xTZklwRHJEN2RUbk1uR2FlWitIcnMzSmRKa1V6Z04x?=
 =?utf-8?B?c0R4ZHMyN21mWFZyK3lRaGlWV2QwR0tQME5tLzV0WXJFYWtIN0NQK2N6Y3hG?=
 =?utf-8?B?YkRmQk1ESlZjV1d0WjN2MXZYUkJoRWdXM2NZQm1tQnpYOXpKa0RLMGNJWnpG?=
 =?utf-8?B?MW15SWhBb215NFZRQ0IwK2haZGtMdWlXdEN4UjIrOGRjMFFZdkZKRFdqM2w0?=
 =?utf-8?B?TnMzUXNkQ3Bhck1GUC9HaC9EdElsSkp0QXptR3U5SS8zVU8vVlN3OGtBOW9L?=
 =?utf-8?B?VS9iazZRVk9FOEZ6NXJXbS82ZC9GL3RjdG1TelRmNUJDSVhQMWRWcWxiQmtr?=
 =?utf-8?Q?ZJK31DikwXwrIJ/TClBbLorrJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c7dbf9-2fec-4b0d-6d0f-08db52bc863a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 07:43:06.6451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k+nAaPp30TM0utgv96is6eDB6T4X3AkdICq12AIIRc13ho6ivAQq39WwQlys8ID5RXewwhxCM5D8DumoR79bMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6458
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH] drm/xe: add a new sysfs directory for
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
Cc: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 5/12/2023 12:51 PM, Upadhyay, Tejas wrote:
> 
> 
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Riana
>> Tauro
>> Sent: Friday, May 12, 2023 10:51 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Vivi, Rodrigo
>> <rodrigo.vivi@intel.com>
>> Subject: [Intel-xe] [RFC PATCH] drm/xe: add a new sysfs directory for gtidle
>> properties
>>
>> Add a new sysfs directory under devices/gt#/ called gtidle to contain idle
>> properties of GT such as name, idle_status, idle_residency_ms
>>
>> v2: abstract using function pointers (Anshuman)
>>      use device_attr (Badal)
>>      move rc functions to guc_pc
>>      change name to gt_idle (Rodrigo)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile           |   1 +
>>   drivers/gpu/drm/xe/xe_gt.c            |   5 +
>>   drivers/gpu/drm/xe/xe_gt_idle.c       | 134 ++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_idle.h       |  18 ++++
>>   drivers/gpu/drm/xe/xe_gt_idle_types.h |  39 ++++++++
>>   drivers/gpu/drm/xe/xe_gt_types.h      |   4 +
>>   drivers/gpu/drm/xe/xe_guc_pc.c        |  87 +++++++++++------
>>   drivers/gpu/drm/xe/xe_guc_pc.h        |   5 +
>>   8 files changed, 261 insertions(+), 32 deletions(-)  create mode 100644
>> drivers/gpu/drm/xe/xe_gt_idle.c  create mode 100644
>> drivers/gpu/drm/xe/xe_gt_idle.h  create mode 100644
>> drivers/gpu/drm/xe/xe_gt_idle_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 84ad0e949044..93bec17ee0de 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -44,6 +44,7 @@ xe-y += xe_bb.o \
>>   	xe_gt.o \
>>   	xe_gt_clock.o \
>>   	xe_gt_debugfs.o \
>> +	xe_gt_idle.o \
>>   	xe_gt_mcr.o \
>>   	xe_gt_pagefault.o \
>>   	xe_gt_sysfs.o \
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c index
>> 0d4664e344da..9e1f7343f256 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -18,6 +18,7 @@
>>   #include "xe_force_wake.h"
>>   #include "xe_ggtt.h"
>>   #include "xe_gt_clock.h"
>> +#include "xe_gt_idle.h"
>>   #include "xe_gt_mcr.h"
>>   #include "xe_gt_pagefault.h"
>>   #include "xe_gt_sysfs.h"
>> @@ -381,6 +382,10 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>>   	if (err)
>>   		goto err_force_wake;
>>
>> +	err = xe_gt_idle_init(&gt->gtidle);
>> +	if (err)
>> +		goto err_force_wake;
>> +
>>   	/* XXX: Fake that we pull the engine mask from hwconfig blob */
>>   	gt->info.engine_mask = gt->info.__engine_mask;
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c
>> b/drivers/gpu/drm/xe/xe_gt_idle.c new file mode 100644 index
>> 000000000000..0060d8584485
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -0,0 +1,134 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_managed.h>
>> +#include "regs/xe_gt_regs.h"
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_idle.h"
>> +#include "xe_guc_pc.h"
>> +#include "xe_mmio.h"
>> +
>> +/**
>> + * GT Idle:
>> + * ================
>> + *
>> + * Provides sysfs entries for idle states of GT
>> + *
>> + * device/gt#/gtidle/name - name of the state
>> + * device/gt#/gtidle/idle_residency_ms - Provides residency of the idle
>> +state in ms
>> + * device/gt#/gtidle/idle_status - Provides current idle state  */
>> +
>> +static struct xe_gt_idle *kobj_to_gtidle(struct kobject *kobj) {
>> +	return container_of(kobj, struct gtidle_kobj, base)->gtidle; }
>> +
>> +static ssize_t name_show(struct device *dev,
>> +			 struct device_attribute *attr, char *buff) {
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt_idle *gtidle = kobj_to_gtidle(kobj);
>> +	ssize_t ret;
>> +
>> +	ret = sysfs_emit(buff, gtidle->name);
>> +
>> +	return ret;
>> +}
>> +static DEVICE_ATTR_RO(name);
>> +
>> +static ssize_t idle_status_show(struct device *dev,
>> +				struct device_attribute *attr, char *buff) {
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt_idle *gtidle = kobj_to_gtidle(kobj);
>> +	ssize_t ret;
>> +
>> +	gtidle->idle_status(gtidle);
>> +	ret = sysfs_emit(buff, gtidle->state);
>> +
>> +	return ret;
>> +}
>> +static DEVICE_ATTR_RO(idle_status);
>> +
>> +static ssize_t idle_residency_ms_show(struct device *dev,
>> +				      struct device_attribute *attr, char *buff) {
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt_idle *gtidle = kobj_to_gtidle(kobj);
>> +	ssize_t ret;
>> +
>> +	ret = sysfs_emit(buff, "%llu\n", gtidle->residency_ms(gtidle));
>> +
>> +	return ret;
>> +}
>> +static DEVICE_ATTR_RO(idle_residency_ms);
>> +
>> +static const struct attribute *gt_idle_attrs[] = {
>> +	&dev_attr_name.attr,
>> +	&dev_attr_idle_status.attr,
>> +	&dev_attr_idle_residency_ms.attr,
>> +	NULL,
>> +};
>> +
>> +static void gt_idle_kobj_release(struct kobject *kobj) {
>> +	kfree(kobj);
>> +}
>> +
>> +static struct kobj_type gt_idle_kobj_type = {
>> +	.release = gt_idle_kobj_release,
>> +	.sysfs_ops = &kobj_sysfs_ops,
>> +};
>> +
>> +static void gt_idle_fini(struct drm_device *drm, void *arg) {
>> +	struct gtidle_kobj *gtidle_kobj = arg;
>> +
>> +	sysfs_remove_files(&gtidle_kobj->base, gt_idle_attrs);
>> +	kobject_put(&gtidle_kobj->base);
>> +}
>> +
>> +int xe_gt_idle_init(struct xe_gt_idle *gtidle) {
>> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct gtidle_kobj *gtidle_kobj;
>> +	int err;
>> +
>> +	gtidle_kobj = kzalloc(sizeof(*gtidle_kobj), GFP_KERNEL);
>> +
>> +	if (!gtidle_kobj)
>> +		return -ENOMEM;
>> +
>> +	err = kobject_init_and_add(&gtidle_kobj->base, &gt_idle_kobj_type,
>> gt->sysfs, "gtidle");
>> +	if (err)
>> +		goto exit_kobj;
> 
> Perhaps here you should not call "exit_kobj" here. As you don’t have kobj to put. Please double check this.

Hi Tejas

The function doc of  kobject_init_and_add says

  * If this function returns an error, kobject_put() must be called to
  * properly clean up the memory associated with the object.

https://elixir.bootlin.com/linux/latest/source/lib/kobject.c#L426

Thanks
Riana
> 
> Thanks,
> Tejas
>> +
>> +	gtidle_kobj->gtidle = gtidle;
>> +
>> +	gtidle->residency_ms = xe_rc6_residency_ms;
>> +	gtidle->idle_status = xe_rc_status;
>> +	sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
>> +
>> +	err = sysfs_create_files(&gtidle_kobj->base, gt_idle_attrs);
>> +	if (err)
>> +		goto exit_kobj;
>> +
>> +	err = drmm_add_action_or_reset(&xe->drm, gt_idle_fini,
>> gtidle_kobj);
>> +	if (err)
>> +		goto exit;
>> +
>> +	return 0;
>> +
>> +exit:
>> +	sysfs_remove_files(&gtidle_kobj->base, gt_idle_attrs);
>> +
>> +exit_kobj:
>> +	kobject_put(&gtidle_kobj->base);
>> +	return err;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h
>> b/drivers/gpu/drm/xe/xe_gt_idle.h new file mode 100644 index
>> 000000000000..ac0ab970a3f7
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
>> @@ -0,0 +1,18 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_IDLE_H_
>> +#define _XE_GT_IDLE_H_
>> +
>> +#include "xe_gt.h"
>> +#include "xe_gt_idle_types.h"
>> +
>> +int xe_gt_idle_init(struct xe_gt_idle *gtidle);
>> +
>> +static inline struct xe_gt *gtidle_to_gt(struct xe_gt_idle *gtidle) {
>> +	return container_of(gtidle, struct xe_gt, gtidle); } #endif /*
>> +_XE_GT_IDLE_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_types.h
>> b/drivers/gpu/drm/xe/xe_gt_idle_types.h
>> new file mode 100644
>> index 000000000000..bc9c59249b6c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle_types.h
>> @@ -0,0 +1,39 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_IDLE_TYPES_H_
>> +#define _XE_GT_IDLE_TYPES_H_
>> +
>> +#include <linux/kobject.h>
>> +#include <linux/types.h>
>> +
>> +/**
>> + * struct xe_gt_idle - A struct that contains idle properties based on
>> +gt  */ struct xe_gt_idle {
>> +	/** @name: name */
>> +	char name[16];
>> +	/** @state: current idle state */
>> +	const char *state;
>> +	/** @cur_residency: raw driver copy of idle residency */
>> +	u64 cur_residency;
>> +	/** @prev_residency: previous residency counter */
>> +	u64 prev_residency;
>> +	/** @idle_status: get the current idle state */
>> +	void (*idle_status)(struct xe_gt_idle *gtidle);
>> +	/** @residency_ms: get idle residency in ms */
>> +	u64 (*residency_ms)(struct xe_gt_idle *gtidle); };
>> +
>> +/**
>> + * struct gtidle_kobj - A kobject struct that connects the kobject and
>> +xe_gt_idle  */ struct gtidle_kobj {
>> +	/** @base: The actual kobject */
>> +	struct kobject base;
>> +	/** @gtidle: A pointer to the struct xe_gt_idle */
>> +	struct xe_gt_idle *gtidle;
>> +};
>> +#endif /* _XE_GT_IDLE_TYPES_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
>> b/drivers/gpu/drm/xe/xe_gt_types.h
>> index 7c47d67aa8be..90b2d34efe5b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -7,6 +7,7 @@
>>   #define _XE_GT_TYPES_H_
>>
>>   #include "xe_force_wake_types.h"
>> +#include "xe_gt_idle_types.h"
>>   #include "xe_hw_engine_types.h"
>>   #include "xe_hw_fence_types.h"
>>   #include "xe_reg_sr_types.h"
>> @@ -287,6 +288,9 @@ struct xe_gt {
>>   	/** @uc: micro controllers on the GT */
>>   	struct xe_uc uc;
>>
>> +	/** @gtidle: idle properties of GT */
>> +	struct xe_gt_idle gtidle;
>> +
>>   	/** @engine_ops: submission backend engine operations */
>>   	const struct xe_engine_ops *engine_ops;
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>> b/drivers/gpu/drm/xe/xe_guc_pc.c index 72d460d5323b..e83283cbcb00
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -14,6 +14,7 @@
>>   #include "xe_bo.h"
>>   #include "xe_device.h"
>>   #include "xe_gt.h"
>> +#include "xe_gt_idle.h"
>>   #include "xe_gt_sysfs.h"
>>   #include "xe_gt_types.h"
>>   #include "xe_guc_ct.h"
>> @@ -40,6 +41,9 @@
>>   #define GT_FREQUENCY_MULTIPLIER	50
>>   #define GEN9_FREQ_SCALER	3
>>
>> +/* Multiplier for  RC6 Residency counter in units of 1.28us */
>> +#define XE_RC6_MULTIPLIER	1280
>> +
>>   /**
>>    * DOC: GuC Power Conservation (PC)
>>    *
>> @@ -76,12 +80,7 @@
>>    *
>>    * Render-C states is also a GuC PC feature that is now enabled in Xe for
>>    * all platforms.
>> - * Xe's GuC PC provides a sysfs API for Render-C States:
>>    *
>> - * device/gt#/rc* *read-only* files:
>> - * - rc_status: Provide the actual immediate status of Render-C: (rc0 or rc6)
>> - * - rc6_residency: Provide the rc6_residency counter in units of 1.28 uSec.
>> - *                  Prone to overflows.
>>    */
>>
>>   static struct xe_guc *
>> @@ -580,11 +579,41 @@ static ssize_t freq_max_store(struct device *dev,
>> struct device_attribute *attr,  }  static DEVICE_ATTR_RW(freq_max);
>>
>> -static ssize_t rc_status_show(struct device *dev,
>> -			      struct device_attribute *attr, char *buff)
>> +u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency,
>> +		     u32 residency_multiplier)
>>   {
>> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>> -	struct xe_gt *gt = pc_to_gt(pc);
>> +	u64 delta, overflow_residency, prev_residency;
>> +
>> +	overflow_residency = BIT_ULL(32);
>> +	/*
>> +	 * Counter wrap handling
>> +	 * Store previous hw counter values for counter wrap-around
>> handling
>> +	 * Relying on sufficient frequency of queries otherwise counters can
>> still wrap.
>> +	 */
>> +	prev_residency = gtidle->prev_residency;
>> +	gtidle->prev_residency = cur_residency;
>> +
>> +	/* delta */
>> +	if (cur_residency >= prev_residency)
>> +		delta = cur_residency - prev_residency;
>> +	else
>> +		delta = cur_residency + (overflow_residency -
>> prev_residency);
>> +
>> +	/* Add delta to extended raw driver copy of idle residency */
>> +	cur_residency = gtidle->cur_residency + delta;
>> +	gtidle->cur_residency = cur_residency;
>> +
>> +	/* residency multiplier in ns, convert to ms */
>> +	return mul_u64_u32_div(cur_residency, residency_multiplier, 1e6); }
>> +
>> +/**
>> + * xe_rc_status - get the current Render C state
>> + * @gtidle - xe_gt_idle instance
>> + */
>> +void xe_rc_status(struct xe_gt_idle *gtidle) {
>> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
>>   	u32 reg;
>>
>>   	xe_device_mem_access_get(gt_to_xe(gt));
>> @@ -593,37 +622,33 @@ static ssize_t rc_status_show(struct device *dev,
>>
>>   	switch (REG_FIELD_GET(RCN_MASK, reg)) {
>>   	case GT_RC6:
>> -		return sysfs_emit(buff, "rc6\n");
>> +		gtidle->state = "rc6\n";
>> +		return;
>>   	case GT_RC0:
>> -		return sysfs_emit(buff, "rc0\n");
>> +		gtidle->state = "rc0\n";
>> +		return;
>>   	default:
>> -		return -ENOENT;
>> +		gtidle->state = "unknown\n";
>>   	}
>>   }
>> -static DEVICE_ATTR_RO(rc_status);
>>
>> -static ssize_t rc6_residency_show(struct device *dev,
>> -				  struct device_attribute *attr, char *buff)
>> +/**
>> + * xe_rc6_residency_ms - rc6 residency in ms
>> + * @gtidle - xe_gt_idle instance
>> + */
>> +u64 xe_rc6_residency_ms(struct xe_gt_idle *gtidle)
>>   {
>> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>> -	struct xe_gt *gt = pc_to_gt(pc);
>> -	u32 reg;
>> -	ssize_t ret;
>> -
>> -	xe_device_mem_access_get(pc_to_xe(pc));
>> -	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> -	if (ret)
>> -		goto out;
>> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
>> +	u64 reg, rc6_residency;
>>
>> +	xe_device_mem_access_get(gt_to_xe(gt));
>>   	reg = xe_mmio_read32(gt, GT_GFX_RC6.reg);
>> -	ret = sysfs_emit(buff, "%u\n", reg);
>>
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt),
>> XE_FORCEWAKE_ALL));
>> -out:
>> -	xe_device_mem_access_put(pc_to_xe(pc));
>> -	return ret;
>> +	rc6_residency = get_residency_ms(gtidle, reg, XE_RC6_MULTIPLIER);
>> +
>> +	xe_device_mem_access_put(gt_to_xe(gt));
>> +	return rc6_residency;
>>   }
>> -static DEVICE_ATTR_RO(rc6_residency);
>>
>>   static const struct attribute *pc_attrs[] = {
>>   	&dev_attr_freq_act.attr,
>> @@ -633,8 +658,6 @@ static const struct attribute *pc_attrs[] = {
>>   	&dev_attr_freq_rpn.attr,
>>   	&dev_attr_freq_min.attr,
>>   	&dev_attr_freq_max.attr,
>> -	&dev_attr_rc_status.attr,
>> -	&dev_attr_rc6_residency.attr,
>>   	NULL
>>   };
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h
>> b/drivers/gpu/drm/xe/xe_guc_pc.h index da29e4934868..a6abac189c8a
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -8,8 +8,13 @@
>>
>>   #include "xe_guc_pc_types.h"
>>
>> +struct xe_gt_idle;
>> +
>>   int xe_guc_pc_init(struct xe_guc_pc *pc);  int xe_guc_pc_start(struct
>> xe_guc_pc *pc);  int xe_guc_pc_stop(struct xe_guc_pc *pc);
>>
>> +void xe_rc_status(struct xe_gt_idle *gtidle);
>> +u64 xe_rc6_residency_ms(struct xe_gt_idle *gtidle);
>> +
>>   #endif /* _XE_GUC_PC_H_ */
>> --
>> 2.40.0
> 
