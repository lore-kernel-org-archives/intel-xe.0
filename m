Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D474C7EE2E
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 05:57:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A924910E13E;
	Thu,  8 Jun 2023 05:57:34 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F70910E13E
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 05:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686203853; x=1717739853;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N8Q9AAep4iiRKjgKPf1K6hPyzDCgcGlZGvjZkXxDR7k=;
 b=Q9jquHHEZd8gEDrHW3GM1+N+c/gVVEU+n1B+s+A2zWUKhCHpY+RT8Rkc
 YJ/YssizBmFbwHvcJPbALJha1FpMvomI7fUvvPl/C8bdNiTEe4FvPGu17
 Aw0KmtTMBc5S9mXnsGdvO6rdhS7i+T5cuz1GRvmHXrOVH1xV/3uB4c0DV
 EdejgtoyJgo0phLETSd2ag3e8kDLTnGCnHF8ioneHWffLGeaaLeKz2EM2
 LH4ad3xS79ZJWZWCRi3omvZBDsMEP36YAKGRPTCmYZwKKGMwvfrNj8Nu4
 pLXv2MF8yGs2dwD6sx2+aFnSJX2beG+0kJK7zLLNCzkNGixBAUG9sz69h A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="354703436"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="354703436"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 22:57:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="774925086"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="774925086"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 07 Jun 2023 22:57:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 22:57:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 22:57:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 22:57:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 22:57:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFyerLydrMuxyxZ7PJPlZbibiFJoWQ9g+u7EFlNT+KfaY16BqMBKZOKT6j6dYr983HgyBZZoQW/Vj1OytoECSzTgUXdxkpwLC7zGcl9tOMzCDpuFaGCaePE6sV14xM2RXFwcdB0f7tAzNaK1tvYvus7QkMvWRMURVFOoz8xZcOSb1qduLOSpOZ+2V/KUjTvfTnOLKyy8NRt3SGENv9DCdYdOJGM8zEibRsv/LEXV1o/T54THviQ+uwFARUzKnp1LmDejNbBLC0tnYFrm/KoNmSCNzC+6/KrGhRt6cMut2/gJ6rKKz9org6rS4qOe+3KalYJaOBQZqlKlH5fo1Zs3BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zAfz4Z1w4SZNqdLCnnpj6Y4uckY2OjFQpuqmP7WmKQ=;
 b=TMVgh+mvCDHectxyZcVcaZboXy4gHYlmciwMQuQZxR8vHlleK/eh6CpjNNt3ZyD2yVWWO7V4ZOsHAK6K4UET1n6FsVtboHQoJgYfiXog8Typr/5gDDWSHMLMlgInyjXiXQL/wyVhhCJedMPCZf2J3wuB+x1RW5cYU7W9jyAsUfIFaaUKBCym0W6TLMgzkq8oeewbZ5mGeYgI1xkjYdFzUgOl5dNRG72P9ladNTRf7+g5CIcw5a9VJXR78Fytcj4cFoAo3Vn+gmJ9SCwXd1w5YPzZ16nwA036uEIxvk8zG74G9RqJ1g1PI1FICV/ZwTqNhEowa4ZQWuaiXIxB716iQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM4PR11MB7400.namprd11.prod.outlook.com (2603:10b6:8:100::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 05:57:29 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::bb92:d504:7607:ed33]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::bb92:d504:7607:ed33%6]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 05:57:29 +0000
Message-ID: <0d06772e-b8fd-e2f4-fcab-555b08f4149e@intel.com>
Date: Thu, 8 Jun 2023 11:27:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20230607081004.887428-1-badal.nilawar@intel.com>
 <20230607224804.GP5433@mdroper-desk1.amr.corp.intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20230607224804.GP5433@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::15) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM4PR11MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: cf99a35d-3ed3-472c-6ce1-08db67e53dee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vethBxcP/jZNUEtKFLiPCc6riiwL0s7bEkh0+hLPhGR0keS4xpSEvd9VKGuAKwmwC3yXDd+QIqoUH0UEsTJSp89cjWChGdSxnU5lzVDDHhppwysglDtVKaMDpZ/4G8ZklvP2GSeTzJeS0jdx4CkIjMZSocTywzZjJw6SWj7v44u9lfvgxQsHPBNwUNYC0B2TFZrB4BgPyRiF9mXKJUnZ52a4kjW+cWoaoqAzc1xpWCm8kDjX1kzvx2fOya5LsUlT+Y0a5yDKf0/BQMnebHneyK5jSptbaRi5syjV3p2WOwe9Ni90Iw+1wHCD1birfMRzWpmhKnwKknP+Xa/jGUWLUFZY4BN6pHJeM7sRhSYJksCPFQWIMoovQVl2ynjRymX7utmz/SnEjz628u4n1OYjay3AWhk1vLMCExAG54n1GtiNqcY9BnWVgtcYIoRqTctB7ky+A2MdqN+3YIOeaExtw3njE+ifGuMIRk6OaqmGRy2V80k4hJhwYy5TFZtL7urJRqrmH10NcQT7U/ZAcwd0vOt1JMSN50pYrRRpWxZgH7iKghAaXNa2Zb0JhMQVmG53QtaJR3UWwQlllLLmY30Ci1Dlb3MSKkbDxHSFsqdV/ZJukc6MWO+1A0BHWyzNOiWP1SlizTfUv2W2EVtSEJc9Gg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199021)(6512007)(107886003)(53546011)(2616005)(6506007)(38100700002)(41300700001)(31686004)(6486002)(6666004)(26005)(186003)(83380400001)(478600001)(37006003)(66476007)(4326008)(82960400001)(316002)(66946007)(8676002)(66556008)(6636002)(6862004)(8936002)(2906002)(5660300002)(31696002)(86362001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVZQd3I3S2ZLdnRBMjJhMHZvZERpUzJsc005MGZyMU96azFKVU9YYkV1MXVm?=
 =?utf-8?B?d29TSmFkc0oybkVWRXl1THIyeG5CT2RJRkZLNzNXa0tOT3hwVGZmTVhUOEZK?=
 =?utf-8?B?bDlOZ3BWK3p6Zi9PVFJtQkd2QldUVTRBeEZnUlhvbDk3UmViM0dNakhhcmwv?=
 =?utf-8?B?TWczd1Z4OU56YjI2cGs1RTJUK3BpYk0raUlSTVhFVUlJVFJJaUE0MTFCRkNN?=
 =?utf-8?B?M1diS0Jmb1JQdG1lM2tvbXdpbzV4a0QvTkFObEM1eHNqaVlMSm84NDB5emw0?=
 =?utf-8?B?eHNFRkJOYTU2R2Uvd0UxdHdXTkU1cVlhWjRxOGFUWitCZGJCS3prT2NaUHhu?=
 =?utf-8?B?Nnl4NGxYZlFMbUJFVEIxRGFUVzRQSzJHeDlXOXQ5N3U2dUpoWGJxckNIQ01U?=
 =?utf-8?B?Z2xobkVPc0I0YmowcTFMSDFWYzVTN29RdGJLdm8wb2p3OU1JMDMxSXRuS2Vr?=
 =?utf-8?B?RDFZc25LcnBFOE9HclFTRlJVaDlMTmVQby84UVdyRy90MStGb1pZSytPWGVX?=
 =?utf-8?B?a3k3THdyWDl2MUg3ZXBDdHlvOW5DNzFLRjhvZGNIRW9zcHJtZWhaaThIZ1ly?=
 =?utf-8?B?L1c0WVlDWTVMM29QU0pQeE1rczNQc2Nkd1c5cG5SZXlOV0hWZ0RoMWQ5d2hp?=
 =?utf-8?B?VWtUNjByTGIvQmRDRUFsaG4yRTU5TnY0RURTTko3WURNZEFqVlVJa0JSbVNt?=
 =?utf-8?B?aTUxSEgraytPRjFwK0RUU3g3ME9CVVdJV21lRzVYT1h1UFZWK2hsTTRic2FS?=
 =?utf-8?B?RjJBcXl0MGlHVVQwd0lTYkJKd0lUK0NKY2ZPalNBbFhZTHRxc1JqUk5MYjVO?=
 =?utf-8?B?enBIK2tjZkRFNExjeVRPMHNNa25HOUZMTGFxVks1S1JkbjhFSGZkZ0Y1dXls?=
 =?utf-8?B?Sm02blFXbEVMZjhnTjN4YU9NdTZ5Z1A3MzZxdERNM1J4NlRyNmNDT1pwcGxv?=
 =?utf-8?B?RVJPTXdFNGhtMEk1Mmo1Y0FHdlJ0RkQrd2xjbnJURTRtR25GT1pNNTdUTDhE?=
 =?utf-8?B?YjZtblRGbVlhZml6Q2x3UHVVS09pTDRDSVJQV2hGVmVybUVSRDJCVjROeU9t?=
 =?utf-8?B?OXI5L2NsWlA2SnRVclRJaC9lMkw3R2p5NlBSeWY2OWIzcTFySlY0NU1JRjM4?=
 =?utf-8?B?Z1VnZithaG1sNnhsYURRM2hqWUhVenkvNm51aGJvY3ZMdkI0QzYxbUt6RFYv?=
 =?utf-8?B?aG5acFBuYWRXVWlTUzJ0QmR3cEVpc20rMlZVMzBMYm84NUxHblBiYy85bWpo?=
 =?utf-8?B?MDBmbElGSTk2REF0S0NNZUtmamRKbVJEUkxiOVhrTjVnajZ4R05lbGR4ZTIr?=
 =?utf-8?B?SEdVS0JGTkJEWnRhWit1bmsyaGV1U255cHpicHB2S3JWaFhXWWQxV3Z4ZkFC?=
 =?utf-8?B?UjZDbm1LUXpLUEF4RjRqdU9zTHF1ZjlWMW1DcndpcVB0RTdiYUhHL0hQSGNp?=
 =?utf-8?B?VHQwNUZFZHR4Q1BuSDRjSDBBeWI4VUZnOFF1QXJRVzNIVGJCT09ua3pwQTVR?=
 =?utf-8?B?RkpwaFkyUFZNTXU0TjhFQzNUdnRLNnF4VlZQMzFNOVNxbkcwRVVMcVloOFc5?=
 =?utf-8?B?M0pFRlZ3TmhGYTFNZnN4aFR5MXFjZzFCSFdaSitLS09ZbnpsN2lqM3AvdjBn?=
 =?utf-8?B?MHhidnRhbzlKSFVPTngxYzJCK0VvZkpxZS9qVjBXR3o2Ri9XcHI1aHd6aHdF?=
 =?utf-8?B?WFpDQlFjS3VaTHlPWDgyTnN0SmhrR1V5M0NhcDBSSlR2QWNoaHF6MU5UTThQ?=
 =?utf-8?B?cFRvU25ESVdhb1VicXJ0TVd5MW9uYkMxZy9qQzFRNXdUODZaMEFtd2JWaVln?=
 =?utf-8?B?MkprUlY3ZzJkaXE2UHZCM29FTFhZMjRUNFVGY090S3d2OFA4aTlLM1Awa0lq?=
 =?utf-8?B?bHk0ZndUUDNrWVQrSjgyTHkxWjdsMlArb1lSWm5ueWRPSHA4c3NuMllRYW10?=
 =?utf-8?B?emRPUmtwLzBPN0JIQTlmd1hJUVFsWmRpN2hzMWpsRlQyNlJsRnRRbGtLU3ZB?=
 =?utf-8?B?aHlwekYxakpYeFl6MUExQUVWeEJPYnBRMEo2d3IyaVlrSFJZNVpnbGVBWEVt?=
 =?utf-8?B?SFFtaUR0OE5rN0NQd3FQTENMNEM2KzlhTlJVeWJXZk5RWUUxWnZkMERTaUhw?=
 =?utf-8?Q?hZeTf2e7ZkR7qEg6frB7hQAax?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf99a35d-3ed3-472c-6ce1-08db67e53dee
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 05:57:29.0494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+Rq3lPv+o2rYb1vxPriOA5lIWbH9MLcMVYwptTFiCUNgaDXHC7Rk6lToyzbEi1KQIjLmQxJOMOyKx+ePCpIjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7400
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Donot apply forcewake while reading
 actual frequency
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
Cc: vinay.belgaumkar@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


Hi Matt,
On 08-06-2023 04:18, Matt Roper wrote:
> On Wed, Jun 07, 2023 at 01:40:04PM +0530, Badal Nilawar wrote:
>> The registers RPSTAT1, MTL_MIRROR_TARGET_WP1 doesn't fall under
>> any of the forcewake domain so doesn't require forcewake to be read.
>> When GT in RC6 frequency reported will be 0.
>>
>> Fixes: 7dbca224f176 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> 
> RPSTAT1 is an sgunit register and thus doesn't need forcewake (which is
> a GT-only concept).  MTL_MIRROR_TARGET_WP1 is within an "always on"
> power domain and thus doesn't require any forcewake to ensure the
> register is powered up and usable.
Thanks for RB. I will incorporate above comment in commit message.
Regards,
Badal Nilawar
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c | 10 +---------
>>   1 file changed, 1 insertion(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 67faa9ee0006..d04600b943e4 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -371,14 +371,8 @@ static ssize_t freq_act_show(struct device *dev,
>>   	ssize_t ret;
>>   
>>   	xe_device_mem_access_get(gt_to_xe(gt));
>> -	/*
>> -	 * When in RC6, actual frequency is 0. Let's block RC6 so we are able
>> -	 * to verify that our freq requests are really happening.
>> -	 */
>> -	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> -	if (ret)
>> -		goto out;
>>   
>> +	/* When in RC6, actual frequency reported will be 0. */
>>   	if (xe->info.platform == XE_METEORLAKE) {
>>   		freq = xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1);
>>   		freq = REG_FIELD_GET(MTL_CAGF_MASK, freq);
>> @@ -389,8 +383,6 @@ static ssize_t freq_act_show(struct device *dev,
>>   
>>   	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
>>   
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>> -out:
>>   	xe_device_mem_access_put(gt_to_xe(gt));
>>   	return ret;
>>   }
>> -- 
>> 2.25.1
>>
> 
