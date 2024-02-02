Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6738EC4828F
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 20:02:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC26610E186;
	Fri,  2 Feb 2024 20:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DtFFmnLs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BBC10E186
 for <Intel-Xe@lists.freedesktop.org>; Fri,  2 Feb 2024 20:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706904129; x=1738440129;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BFC1SXWCSCCulOpwK+FV5T+V50K8qfPsmDsPtt/lsiY=;
 b=DtFFmnLslQ6LSiFkEf695rMDj5VUeVG1t8Q5YPaQvlE70gHQbiR+q3dR
 4OGzpRN3vFlNp9d3Um7QNc4lohionHeTIK1aBcMRMRimY72HFTXzpP0RG
 owEwefJP48lZ8fPiX54VuovWbovNAzMiW+F+NlFr+p3klQizJLyTh8D+r
 uqdhiXgrtVYCE8wRMNgbjpsKvdenJMyq9LaYVfO7/r5/hKxRiGI3R34rl
 vIYx1XDMudiQVEk9ERFN5XjNPVpGv479liimvC6+1m4a0UUji6xDo2igv
 IzJuolO/+QfHxk+gJbH1jn0FXwOfL+YG+d9wubzTzWjMu8kLwEFbRiWuQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="11597924"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="11597924"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 12:01:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4761526"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 12:01:54 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 12:01:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 12:01:48 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 12:00:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmXtvCtrNc4JP8TWMW2AhqYrXyxz3sZzW81bQUW8burnP/C3Bosf6D0LscqaosQpmUXwPASXzvubRtjBXl2Hyfp6i4shNjSaME9MpDoUlu2SJdkSqhCh1FwQvZGvSBiRd134GBh4uLyM9AyJos97Aq0QKgUM/f4JzkMWAyfQu83jcJP7Kj4Bnr1tPWSgeQieaMXT+KTBb123c4REe99QhqmlVTAENxsAk/6UcdpA6UdW6D2Y5RewLIPjowYDPbjXrx62VOaozz0Jua+nFKtnPWrqxIIh6klTTkRMKgTkAlOn7tmi+e+RrW2YGWW27BeGt3nYLBW6ZBHKA6AXqWrP7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6J4qaFmbZYqcJOXq479Y/5Oy6iEnpqDXitE71LYY2E=;
 b=MR1IDLCe/JXFyKI9PPVXh56sYkYz4wuFMYQ63P5TZruTgnJWHCIZcRRjiRFaeGrJhVXRrsyFfSqPxYxVZDMSUSV9VtwGaVRF2ZityWVVaLHLwsXGmRX77cGS7fVy3w+cW9g0U5+/Df5oA3ye+PF8XHhfIEHFsnI8/c0BpWXR03iSSJLtu15mQ8oZGclgIigG0xjq7O587KRrHri9uZMhkH+bOEfSoXPkT5ejgcZZ77OAw0QXT5YVlDa7u8T+4QgfIuEhB+UPGXSGPgo2Mjaunl2nboSVPIfuTsowRi9EBdUbPbJua1dNBQFbFUma6gQ1QKSfi9VCnPoqCFeONDtqdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SA2PR11MB5161.namprd11.prod.outlook.com (2603:10b6:806:fa::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.30; Fri, 2 Feb
 2024 20:00:54 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7249.027; Fri, 2 Feb 2024
 20:00:54 +0000
Message-ID: <04f74e08-7df9-4f8a-afa0-45cb48298aa0@intel.com>
Date: Fri, 2 Feb 2024 12:00:52 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/guc: Update to GuC firmware 70.19.2
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20240202073050.1986142-1-John.C.Harrison@Intel.com>
 <20240202073050.1986142-3-John.C.Harrison@Intel.com>
 <w63lpuqykxkgo73ryhmlslzj3uc64vai22prrzubiyakftd3bk@adwdanyes32g>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <w63lpuqykxkgo73ryhmlslzj3uc64vai22prrzubiyakftd3bk@adwdanyes32g>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0078.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::19) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SA2PR11MB5161:EE_
X-MS-Office365-Filtering-Correlation-Id: 808d61d3-f6f1-438a-b07e-08dc2429a9f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6bONSiTo76mY57m7NTeVWN55DL8i5JeSYOw88W62+2mmlqdrbR1nPJbT9DztBpzkTocPpKrOytQx1/JSLjSQdVEWMznpBi5Kw/IMYgjIa6sDH6/dgg4ULnAo6y2S8pFPVho+F7UXL+qFGgW6gQYVfbyJHZyZ8+AE+vkGYa6ut1Q4bvRtoNtmUAZceveHc684ySShRvp7Ad+u5tvaJ5YReZuNyoB7WLBbEJs4eZ93dTE52ZYvG5Qvf3uaG7vnx0zfoD6Y4w/s9jAR+HwxLa3ZY6bGGLVsDDDAF7kCGFI2hCX7S/DlBa8mU04fxSjIBdr9BiC2+lajCDwbpz+gfT3GpHPkRqJp0f/QfS0ARANhGZHMYc7yy4PnulxBdlm185w/t6TgKHr7MmVz/Pkm48GzdceJkS1xeWPDp0RsEFjc15YdgW3so8KLQzBg+y5f15K407dS92CE2NAMx17tJmP4yqUbWTO4vrB4wAZgm45WiJUwCSV+kv4HgGizIE8PMBlxuEnaNNhq4Z1u5CZe8h16RKa3ZSxu47ZOEZ90x0g1jcsnRDu9zhn5KRXA8/DGG4Pta07cAPXjQ6JfdnN/9FWs0JxgiJVg6VZXOCIr+H5QkThKJL6LW9TK8/6gvnbc9IxqIPuQFl6e3fgiufioToZ4og==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(396003)(136003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(31686004)(83380400001)(41300700001)(86362001)(31696002)(36756003)(82960400001)(37006003)(2616005)(26005)(38100700002)(6512007)(66946007)(66556008)(2906002)(6506007)(478600001)(6636002)(6486002)(8936002)(8676002)(5660300002)(4326008)(66476007)(316002)(6862004)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFNtUXhyQ2NQM0ZlZ2JzMHVsaEhXZGF3S25VOXpyVFlZL2pCeVJ5bmhxTlox?=
 =?utf-8?B?bzR5NnM4RTJJOFZTaEVLekFneHhBam9Md1RwbEJSTWh1b2VwbmxIck1NNVYr?=
 =?utf-8?B?UjhFT2QzZFdNUXJpZnNaNmFQVUlveTBWVVlKaTB3a05wK1daMlFNSXdVMHNG?=
 =?utf-8?B?ZmpKZjRXUmMyQkJXbzVvVlVtRS8yc0NqdXM5M0NGY2orSG9HYVk0NWx5dFZu?=
 =?utf-8?B?ZUkxNzF0dU4zSEMzR0wwdkNKaFJneUxqb0hKTUI3SExoaVBidmRuSGRBbHpm?=
 =?utf-8?B?V1lJcytNVFd5eU4wcHY2ZlZWVVJiYzFxSVpSdUxxMkdUb3NhSE1GRjhsVUZh?=
 =?utf-8?B?VDZER2gvc2tnMk5PWmVVUnBzZ3JRZ0I5YndOVGZabXhlL3B1K1J6VFV2N2p3?=
 =?utf-8?B?SG1ESEZodU9IRElXR05sREE3R2cyRzBGVEszWUZ0VHlSbldJUmNqTDBFR3NQ?=
 =?utf-8?B?d1ljUG4zbE5sb1lhS215VndQN1NqOWdVYmpxZGNQUitqTllkSmNvTVc0YjlX?=
 =?utf-8?B?aVgydFZnd1ZjY2J6VUlQZlVNSnQ2TkVPbXlMMFlGL1A2R0dIVXlGTnpzL0FS?=
 =?utf-8?B?TURsTGoxN3NoYlJtaFBPcHNCRUhmV2FnNlVxM2dYa1NaN0s2WW83bHUxTld0?=
 =?utf-8?B?Rko4cE5sYlRsTERkM21WTnViaGVGalFoazVvU3hFZExjam5KRHhiaStSOEN3?=
 =?utf-8?B?aFFZREdPMEo5bjJMTzlneG9UbmFXRHJXdDhVV3dET24rWlgxUExjQ2EwUHlR?=
 =?utf-8?B?OG1SYmRlOGkrMmNqSUhaNDd2akVMcDJKaHFoemg3MFdFSzNUVW9JbDdSUFdZ?=
 =?utf-8?B?bGdvdUdobTQwL2R4Ky9NTm5WZDVOdzg2L2U3QXNaT1UwbVY2aG94OTBQNlph?=
 =?utf-8?B?ZWtmU0FaRFp5V0ZKaHRVcXVOTXFHa1UySE9wd05Fck1naDBMWVB4cWRCZFZF?=
 =?utf-8?B?MUFXaE90STBsUVhwekF5NFBxTFRlVWxHRThrTmdZd3YvZXE2NFhqNUFtNlpk?=
 =?utf-8?B?K1NNRDk0ZTVlSVFUd0RvTkM3TC9ydG9Vd1Y5T09ZVXdSbzltVlN0MWYzdThr?=
 =?utf-8?B?Zm82MzRoc1pJaEprTE5NVWdBN1RDL2U5aW9WVXVpSlpKVnQ3NS9ETkdxbDhz?=
 =?utf-8?B?d3RVOGpxa1JJaXdZdTBKUzBZQi9PZEs1ZlB2SWQ5VHo2OE5uNFBITFByQzl5?=
 =?utf-8?B?eXpzTXFodnJPNGFHNllVdSsvNkVtTkg2Um15bGQvWjhMVzBpSWhmMkRSMXFF?=
 =?utf-8?B?aVRyMTFOMGQ3R09ONjFkamR6SStxQjhyR1B4Uzh1OHhacnZBUE1KR0lqejBx?=
 =?utf-8?B?bDhDRGpmOG1SUnRsblhKTWtER1l2UnR6OWFPdjhnaWphdjhaZ3pVZnB0QWdO?=
 =?utf-8?B?L0RpU2k3aGRBaTdiVy9zUjJJKy8wMEwvYkR5YnZZa1RtaSt5RDV6a3JSOU9m?=
 =?utf-8?B?UHZEcS9HOGVwSXZpQ2hvd2E4K2gyVFZmQ0FQMEo2RzRocnc2dGZuWmV3Vk0y?=
 =?utf-8?B?b0lydXByUkZvVzh5a3Y2Q2FzN1UvRWo1cmgyaXZ1SjlxTDcvWHVKQk15NEZx?=
 =?utf-8?B?VFJWanVNRmtzODNVcnFpVFd4aUlybjdmQW5uVmVRNnBBaXN1WE5ITHpNamZq?=
 =?utf-8?B?Vlp6cVlncUVQaGJqcWxYWTZzNE5NOVE0ckE4M3B6M1ppSWdJVW9GREwxLzRw?=
 =?utf-8?B?MzlZN2lDOHRqSVhpMnh0K1BHQUlyQ2crb1ljRTAvQ0p5bkl1ZmxJd2tldmVE?=
 =?utf-8?B?ZEIvY0hFM3FKNisrNkNaRnMzcUlMNFd6ZnpjRVVhZDQwVldoS1RYVzB3SXFY?=
 =?utf-8?B?bGJrWDd0YmFob3R1N014eGk2MUpMRVdpaEl6dm5IRm4xU0lRZUlEUWN0dVRh?=
 =?utf-8?B?dW01ODRmdVhlUFNLeDYxL1JoTW0wRG1SWEQvYTFQVkVUOEUwcGFvS2xHMVUy?=
 =?utf-8?B?Zy9qbU1PUXpHSjVUNTdKN2FVcDcyMDNQNTBGNjFMZ0xselFITjRnT3Y3eGRk?=
 =?utf-8?B?Y0NzS21jd2NKU0VHYlhPdml6aXZTSDh5UXExRHBJMUtycERMWnVvZTExVXF5?=
 =?utf-8?B?a3dmNmlHQW5GbzI3TE1mR09KcFRORjNldG1VWUFOaUFqaTk5VnpycGpBK21z?=
 =?utf-8?B?YUlPb25GalFpcTRNV1V6dXIyLzdXMG5WVFF6ZTVrZGg2TFRRaVVvM09QczFj?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 808d61d3-f6f1-438a-b07e-08dc2429a9f0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 20:00:54.4646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9aXJAsTWqI8zmBPuj53erAr7JABWVgjfspiqV1PVvY3PcmlQaI0utfZkaFba9aDGoqPOwdLBmoCmeEprUQyIJsY9W+XUyLf+ISWj0v4TrWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5161
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

On 2/2/2024 08:56, Lucas De Marchi wrote:
> On Thu, Feb 01, 2024 at 11:30:49PM -0800, John.C.Harrison@Intel.com 
> wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> API compatibility version: 1.8.2
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>
> once this passes CI and those firmware blobs are available in
> linux-firmware repo,
The official PR has been sent. It is now up to the firmware maintainers 
to do the merge. They are normally pretty quick about that.

John.

>
>     Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> Lucas De Marchi
>
>> ---
>> drivers/gpu/drm/xe/xe_uc_fw.c | 16 ++++++++--------
>> 1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index d3f0fe2101a7..d896c98dd0bb 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -103,14 +103,14 @@ struct fw_blobs_by_type {
>> };
>>
>> #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)            \
>> -    fw_def(METEORLAKE,    major_ver(i915,    guc,    mtl, 70, 7, 
>> 0))    \
>> -    fw_def(DG2,        major_ver(i915,    guc,    dg2,    70, 5, 
>> 0))    \
>> -    fw_def(DG1,        major_ver(i915,    guc,    dg1,    70, 5, 
>> 0))    \
>> -    fw_def(ALDERLAKE_N,    major_ver(i915,    guc,    tgl, 70, 5, 
>> 0))    \
>> -    fw_def(ALDERLAKE_P,    major_ver(i915,    guc,    adlp, 70, 5, 
>> 0))    \
>> -    fw_def(ALDERLAKE_S,    major_ver(i915,    guc,    tgl, 70, 5, 
>> 0))    \
>> -    fw_def(ROCKETLAKE,    major_ver(i915,    guc,    tgl, 70, 5, 
>> 0))    \
>> -    fw_def(TIGERLAKE,    major_ver(i915,    guc,    tgl,    70, 5, 0))
>> +    fw_def(METEORLAKE,    major_ver(i915,    guc,    mtl, 70, 19, 
>> 2))    \
>> +    fw_def(DG2,        major_ver(i915,    guc,    dg2,    70, 19, 
>> 2))    \
>> +    fw_def(DG1,        major_ver(i915,    guc,    dg1,    70, 19, 
>> 2))    \
>> +    fw_def(ALDERLAKE_N,    major_ver(i915,    guc,    tgl, 70, 19, 
>> 2))    \
>> +    fw_def(ALDERLAKE_P,    major_ver(i915,    guc,    adlp, 70, 19, 
>> 2))    \
>> +    fw_def(ALDERLAKE_S,    major_ver(i915,    guc,    tgl, 70, 19, 
>> 2))    \
>> +    fw_def(ROCKETLAKE,    major_ver(i915,    guc,    tgl, 70, 19, 
>> 2))    \
>> +    fw_def(TIGERLAKE,    major_ver(i915,    guc,    tgl,    70, 19, 2))
>>
>> #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)        \
>>     fw_def(METEORLAKE,    no_ver(i915,    huc_gsc, mtl))        \
>> -- 
>> 2.43.0
>>

