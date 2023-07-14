Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D96EB64DC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 05:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A422B10E11D;
	Fri, 14 Jul 2023 05:30:56 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462B210E11D
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 05:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689312654; x=1720848654;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mQWhCVNtQBj8OCmnlh7K/LShnsvoG+5GxMRoeph6sRM=;
 b=HF0J1Lewi3CWRkKYOY/ari4z2/R8FjboeNeDkXQcDM4KuntG2f/ZD9CR
 +kS8LyrP7kFEbWeyYC7AIkwGMWQOTaBx9zIgNEHa1EEdEZt9yQIpesegG
 pkCaP/2KVbkkHrGiFd3DWspdA8oWk5q5TnW6nX2DDPz67oMuHwbKlLmGg
 +ac/hW8g/gExC6KPmtrjTm7rGXGmagBhV+FzRGGU33ijATrgL9UIyH2rI
 6mVmhSK4y34z16Athnww+gcqJGzXo9ONTyfNvEhxafjVQAHYXkHvWiLid
 kC6+yw8KXlry/HgE9Cwvw2Hz7XZMs613Yf9VrWHdcz3vv8ZR763UyVCMa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="451759548"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="451759548"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 22:30:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="722267023"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="722267023"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 13 Jul 2023 22:30:53 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 22:30:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 22:30:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 22:30:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 13 Jul 2023 22:30:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQTx4MGKhO+JpItVXPC3ZFqG3jZKhtt8Vr3+vDFIdw4KNyjyRuu/WyRW+dS4tEhNTTIjqO3T/y4vOsCTI5VEPDLVQ/3slAYr9vL41sYfW69j42OYk+mAphjIkMKyPX3lJWKiinAV06X8n5tL/z/8WtD39nwvMUoLJCrBzb0D2letxX2WVAXlCr+K5lAi88YpZtVTJcMmJyHdCzRvGQlhXNUQnB8V6Ulg0MVYFRMS0/ljlI4TeCCPzTgkAE7q/7OoBuQfgwKg39qaXY3wolxd5cUgmY4/4is+vodd9YjlJc16Lt8fUxJ3mu68YYNykOGuikcRL/chcYA4+s2YCqclRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScNREByEmXU4cAZYNk4XSGu0HUdZ0wDpu555oLe6t2s=;
 b=OIRDRoJBzS0rx9T5qlLEDI6u8o1mVmG4xbrOPIuyNQSyhVnJ8sWACLzOM8P4uVsG7+LoVb9ncKUvBU3J0Gpi4uPFcjuQVv05ahJKo2fqQxu+hO1JSUpu5LHpjImyRZmOJ/P7z7qYJoFfBAj+Rvj09gRgeJ5aBXpzBF4n0GfREETfoGYVnCNV8f7112/bwDdBYZs49GPEWHCc0r/rHoTFwc3kCLUDwzZzWkgoZHqv2yKLhL7Tb1QQtKicoVoN3Vsyh3/gfW8HvK4Fbw3kaRKFK0adMSlOI0987v/Aia1tBSBIhXwqtXo9VzSI5MTaatyBF+no0VIjBCAht6ZOCh8owg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CY5PR11MB6464.namprd11.prod.outlook.com (2603:10b6:930:30::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Fri, 14 Jul
 2023 05:30:44 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::4707:e1f0:b32d:c123]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::4707:e1f0:b32d:c123%4]) with mapi id 15.20.6565.028; Fri, 14 Jul 2023
 05:30:44 +0000
Message-ID: <cca8abfd-8f1d-08c4-91c0-06a9fd2b1596@intel.com>
Date: Fri, 14 Jul 2023 11:00:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230713053832.1386402-1-riana.tauro@intel.com>
 <ZLBfAjQ2dqm4fg9o@intel.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZLBfAjQ2dqm4fg9o@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::18) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CY5PR11MB6464:EE_
X-MS-Office365-Filtering-Correlation-Id: 84306d46-a752-4697-2aca-08db842b7854
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7VQJ+zuhu9/QvEE7lyj6SP9MOKeXAhOtPLGBLJckv2LqFO6I6UaQK32dJhQTLW8ZY+eDk+3sP52lN92Bi2nqddxDxqIAuuq/i87l0bCcmjJvjATPBYLjTtGZ+dNQLL8aHAiVeuSBnAzbBWzNTY99Kjhz/03qDIMcnYXJzN+/YpB+V+Cmr9e73WqZAeYKDlZjELxky9JkCWDMurHCyOr/uM4fDrPhAN7ZxrCa57kD0jI01C2jJoiIgcHrLsrG+9mAECtWsDaqydJl2fjYSMOLI4k6rpNpteMUycdkuPy4sdRx7Uo10BYweh+u9dFTgx80ekm0SZ5F6njaOHQUPoC+w1Pofb4ZrwtVYNoUiIA/56hNV2/epyIN8/fAkiHv9zh0llviCxeBQyBqsiHX9c874/BQj6JWrYXn6Laf5oozW322YBUkXXDZkiL4HoCiC1UL8bMnqDssgS5Di+P7M8iQ+ry8LMZKviZ+aWf7iG4HVSnLSOAZXTokmHHVoZMuHJqQx0A/x1XpvDY/1vES0JiChydJmT0wIaCFSiKF3TAoNDjEcqq5vK5tCteU0Y1ZuOdnzrC2nKPkCu3EL3iVT2tW0sDqnEXKCOdBLeKl/86dvfUZh7HRa2Ke+9Nao35O6hssRQTlQqfBaYWy8vLMCtpRyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199021)(36756003)(2616005)(316002)(478600001)(86362001)(15650500001)(41300700001)(31696002)(8936002)(44832011)(83380400001)(8676002)(6862004)(5660300002)(66946007)(66556008)(66476007)(6636002)(4326008)(37006003)(6512007)(186003)(82960400001)(38100700002)(6486002)(53546011)(6506007)(26005)(31686004)(6666004)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VE5oMm1pWTQxaE5XT3oyQjZKd1I1b3hUZ1l1eVczdWE0WElFdUhpMlJIbWRG?=
 =?utf-8?B?YnBuTmpra0p2ZmtLRE5lZTY2bUI2OEszcW9vVTY5Y2RicVdlSXp6RGo3TG1N?=
 =?utf-8?B?cEdyL3A3SUpOa0pRUjNzUTJHNzhULzNmUnM2V1h5K1NET0NQMzRvYmU4YUlH?=
 =?utf-8?B?c3ZaR0hVME02bUd6V3NNKzhiR28zNFVsYVNxdUlvMUVSa1Q4RGVmSTEzbkZC?=
 =?utf-8?B?eVFNdFI3ZkQrbmlHTkV3dG94UnpVK0VGOVZKVTluVXoxT3Y2djZNVEN4V1VJ?=
 =?utf-8?B?YW5MR1V0TXNiUGRrVGwyalNZOFpERTVGVURWWlBKTVphMmU3MUVnWWpEaDhz?=
 =?utf-8?B?VXQvb2FrNFkwQVREQnZhaE5XbWJCTEZLVFFMeUo2YjBHMzg4a1VLbnF1MFR2?=
 =?utf-8?B?MlU0MWR6STZwUVM2QmtXUEJ6UHMyM0xXcjJ4bmE3enJadFExdkltekZrVmd2?=
 =?utf-8?B?cFF4aG4vUXV2amJlMG9rODcwYXJadE9UZDM1cXlxczFRaUFzNm1CUm1yaEpr?=
 =?utf-8?B?d2kwRGc4cTVFc3NlVUYrVlF0d3N4SGNwdlhKT1gxK09na0toekxtQ0grZkd4?=
 =?utf-8?B?TkZVQUZnbmxncDAyYm9lOGtjR04va21McVZZRlBJMURpT3A2czU1QjlCMUZV?=
 =?utf-8?B?MmFCdlRVaXh1ZUFhVy9yeEJnOEFtelI4Y2h5K1RDQXhTQWVHVUgyK3VYT2tC?=
 =?utf-8?B?eThUTWtOZlUzcTFuZDVCWVpna2dkOXpQV213MEhsUjZ4SUQ2a1NtUWxjc05j?=
 =?utf-8?B?MGtXYm9OMFJWVUJ6bUtKTUdJZVNzYTA2WlpLNDRCVjlBL1VmVi9Jd0RBV2o3?=
 =?utf-8?B?Z1JRL3o0azQwZ0dUVGgyNG1oVVU0VGNDb1BncFNFby9CaitPVUJmbENucU9l?=
 =?utf-8?B?ZHNTcHZ2Y090QUJhQTM1dVNQaVFxTEdHUEpwZ0VNbzUrZm0wclNMYUovTFNC?=
 =?utf-8?B?cVoweFl5SzZYZWhoTVQwaXNqYnR6REc3Q0xwcWNwWStWN0p2VHA0WUVKWE1v?=
 =?utf-8?B?UEFuOXF4REFwS3Q5aEliVFdXSFRwUVVoamZZTDFicmtLWTFJNmJhMm82ZjhR?=
 =?utf-8?B?ajgvZGJRMllmT3MvRHdaczVkTjZPRXhqc3dqbkVBRHZPN2NKT0FDcEdjcjJr?=
 =?utf-8?B?UHJOblJnMlpoUDl6b1FIcWJLM1RlOHdUd2VjSVYvOUVQV3kwREgyaXF5cGRV?=
 =?utf-8?B?NmhWcDFwM1YwTEZjcmlkU3pFcWM5cXBQMUFDZko4eWpiY3lBamlxbmdkOU40?=
 =?utf-8?B?dG5zRlFzVlllNUNlUzhaWHp6c09EK0JMd3hzcUwyazZFQkZabTRpc1FGUmVh?=
 =?utf-8?B?NnZDcjlZQXlSdVhESzBzQ1lsZ3FVdnpzYW84ZHJlKzRvS1ZvRlloY1YvWXZr?=
 =?utf-8?B?WFo0Q1YzaXo0VnJpdVpaZDhkNDZaNVp3WWpmMWRuSkFVU0E3N2EvMlRhWU5P?=
 =?utf-8?B?c2x3Nis2RzFIMHJXbkZ5RlVOU1dUT3ljTElDWG04RVlGbEpCMXFLM1NkRGpT?=
 =?utf-8?B?TldjbkdqSVF5VDBKRFpLUnhSWk1HbUFHNHdvUExTYjV2dXJvdHRQVUdsbUJr?=
 =?utf-8?B?R0ZmYWIxSFo3RUtycXh0MjBMdHpyMHRjdzk4Y0V0czdLTnRJczl0bW1YeGFR?=
 =?utf-8?B?VUlnbEhkakROMGZvRUVzT1lsWkltaEVvQXYwNU9uVUk4L01PWWVrZU1BU3J5?=
 =?utf-8?B?cS9lekErc2cvQTAyMDUwMHNEUEo1OUtsUUMwaVR4RnUvaVAxTFpsOUVqaVN6?=
 =?utf-8?B?L2Z0VWpTYndGVHRHc1lmcVNmOTdGWUx0bG1MSTJhYnNJM2kzZDdvT3dpMnpW?=
 =?utf-8?B?MzRQWGxncW9TK0p6bkNUU29RUldJSTg3THRkMm9IazBFQi9td0U0VlU1TWo2?=
 =?utf-8?B?ZHc3Y0Jmby9yVjRLUkc4bC9XQ3V2YW54Mnd5MGlPSy9JSW82bGczbjRabVNi?=
 =?utf-8?B?V3lpZ1ZKa3dzOVo5UEs1WmVzbEFCeFZKWWdERjZhZllXVjlmOHo1dE5UQW9Z?=
 =?utf-8?B?NWhrWGtmdERJNW15RlAxNWd0Z1JrakhMT3p6TUZBUXFpMGhQSkFUNUM0eGFK?=
 =?utf-8?B?ZmFTc0xPamgxNmVzQWFVNkRkeDg4SDFSOFhHNTJQMFcyamRuYlppSUJoWjB2?=
 =?utf-8?Q?MenUW67wGDjW5PQzgeG41prmP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84306d46-a752-4697-2aca-08db842b7854
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 05:30:44.4823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UPWU4v7o+DYzJbRHs/XfcQiDlmWKVqW2Dz4WfO5HN3JTcjVOqN7lapmL2bNpLKEThO43KJsHPxkAYDBckJUt8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6464
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: remove gucrc disable from suspend
 path
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Rodrigo

On 7/14/2023 2:00 AM, Rodrigo Vivi wrote:
> On Thu, Jul 13, 2023 at 11:08:32AM +0530, Riana Tauro wrote:
>> Currently GuCRC is disabled in suspend path for xe.
>> Rc6 is a prerequiste to enable s0ix and
>> should not be disabled for s2idle. There is no requirement
>> to disable GuCRC for S3+.
>>
>> Remove it from xe_guc_pc_stop, thus removing from suspend path.
>> Retain the call in other places where xe_guc_pc_stop is
>> called.
>>
>> v2: Fix cosmetic review comments (Rodrigo)
> 
> it is actually documentation result that changes here, and
> we should care about the documentation. They are not just
> cosmetic comments...
> 
> anyway, I'm not sure why I have not stated that earlier:
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> :)
Thanks for the review
Sent a new rev with updated revision message

Thanks
Riana
> 
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c     |  1 +
>>   drivers/gpu/drm/xe/xe_guc_pc.c | 17 +++++++++++------
>>   drivers/gpu/drm/xe/xe_guc_pc.h |  1 +
>>   drivers/gpu/drm/xe/xe_uc.c     |  5 +++++
>>   drivers/gpu/drm/xe/xe_uc.h     |  1 +
>>   5 files changed, 19 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index bc76678a8276..d3a2bd3db12f 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -517,6 +517,7 @@ static int gt_reset(struct xe_gt *gt)
>>   	if (err)
>>   		goto err_msg;
>>   
>> +	xe_uc_gucrc_disable(&gt->uc);
>>   	xe_uc_stop_prepare(&gt->uc);
>>   	xe_gt_pagefault_reset(gt);
>>   	xe_gt_tlb_invalidation_reset(gt);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 3093cfeff0c2..9a7fae727dfa 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -730,7 +730,15 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
>>   	return ret;
>>   }
>>   
>> -static int pc_gucrc_disable(struct xe_guc_pc *pc)
>> +/**
>> + * xe_guc_pc_gucrc_disable - Disable GuC RC
>> + * @pc: Xe_GuC_PC instance
>> + *
>> + * Disables GuC RC by taking control of RC6 back from GuC.
>> + *
>> + * Return: 0 on success, negative error code on error.
>> + */
>> +int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>>   {
>>   	struct xe_gt *gt = pc_to_gt(pc);
>>   	int ret;
>> @@ -827,7 +835,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>   		goto out;
>>   
>>   	if (xe->info.platform == XE_PVC) {
>> -		pc_gucrc_disable(pc);
>> +		xe_guc_pc_gucrc_disable(pc);
>>   		ret = 0;
>>   		goto out;
>>   	}
>> @@ -850,10 +858,6 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
>>   
>>   	xe_device_mem_access_get(pc_to_xe(pc));
>>   
>> -	ret = pc_gucrc_disable(pc);
>> -	if (ret)
>> -		goto out;
>> -
>>   	mutex_lock(&pc->freq_lock);
>>   	pc->freq_ready = false;
>>   	mutex_unlock(&pc->freq_lock);
>> @@ -876,6 +880,7 @@ static void pc_fini(struct drm_device *drm, void *arg)
>>   {
>>   	struct xe_guc_pc *pc = arg;
>>   
>> +	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>>   	XE_WARN_ON(xe_guc_pc_stop(pc));
>>   	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
>>   	xe_bo_unpin_map_no_vm(pc->bo);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index 370353a40a17..81833a53b3c9 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -11,6 +11,7 @@
>>   int xe_guc_pc_init(struct xe_guc_pc *pc);
>>   int xe_guc_pc_start(struct xe_guc_pc *pc);
>>   int xe_guc_pc_stop(struct xe_guc_pc *pc);
>> +int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>>   
>>   enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>>   u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 70eabf567156..f8cbd292d6d0 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -176,6 +176,11 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
>>   	return xe_guc_reset_prepare(&uc->guc);
>>   }
>>   
>> +void xe_uc_gucrc_disable(struct xe_uc *uc)
>> +{
>> +	XE_WARN_ON(xe_guc_pc_gucrc_disable(&uc->guc.pc));
>> +}
>> +
>>   void xe_uc_stop_prepare(struct xe_uc *uc)
>>   {
>>   	xe_guc_stop_prepare(&uc->guc);
>> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>> index d6efc9ef00d3..42219b361df5 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.h
>> +++ b/drivers/gpu/drm/xe/xe_uc.h
>> @@ -12,6 +12,7 @@ int xe_uc_init(struct xe_uc *uc);
>>   int xe_uc_init_hwconfig(struct xe_uc *uc);
>>   int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>>   int xe_uc_init_hw(struct xe_uc *uc);
>> +void xe_uc_gucrc_disable(struct xe_uc *uc);
>>   int xe_uc_reset_prepare(struct xe_uc *uc);
>>   void xe_uc_stop_prepare(struct xe_uc *uc);
>>   int xe_uc_stop(struct xe_uc *uc);
>> -- 
>> 2.40.0
>>
