Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C2DC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 15:16:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B30310F6CE;
	Fri, 12 Apr 2024 15:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cRzfoi13";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2105610F6CE
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 15:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712934986; x=1744470986;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=pF9Om7iZLVDYMYxRQRTLFc11izl7IrR4ja+D+NMmKwo=;
 b=cRzfoi13ZdpxdeJ0pWKWcMFKaYZbRs//ShmLRCPNRiXkFOyme/k/TzDY
 smZzkp7+1PSED1IsfIRuB3jDHXNqSINW+3rZxsupoLsC3OjnIB/Eywh+R
 YPWuSv5kaQ7quEIxDKoU5VCpI9ZGtcQBUJtEnPiCnTk0agY8sRE+/WZLI
 l/CdmIUpwqTxAvLRR5ViDXNr7SUD75WUlLy6LDhVG9sdSjddy1wZDIOXI
 fafet2xoETZFGn51MvVTDopoILFVX4MHLqQMgzs70IoaV/C3wKTdU696j
 Cy5YiijKJ4edBHg5wAIIURXESY9wslKKWsNF1c6VKv5YjLapQVE/t1bo0 w==;
X-CSE-ConnectionGUID: v5AvNCnXRVqj99labVJe4w==
X-CSE-MsgGUID: j1QN6CwtTd2qCT/Uhh7C6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8569773"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8569773"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 08:16:25 -0700
X-CSE-ConnectionGUID: PDw4izzNQSeNmi7SzxOq6Q==
X-CSE-MsgGUID: vGVL5TVbS22R4v95acTVTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="25804423"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 08:16:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 08:16:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 08:16:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 08:16:23 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 08:16:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KI2s1GDg495LYUE5UYiaZqmoKDVi5wEOqo3sMD7hD00MGEOYPFLNGQk6LAEY2sY4VYb1EpJsskgYBJo61Tcn4jKOB5qkurlLsF4LBvdKfmgNreUJzdVqipqVyOy2uEZK/Oj7NAyevtrVDbTyaSM35w2eHwZHEOc6WIi3xziw4lhdd5J8qtQxK5enImz1xSCFIm6pX8iU/voYhVfUgF7D48SJdbTQpGnsqQr9UJzqOyp4ZOckueztLGa8aBIv6lNejQ9YH//98Y+amzUkKnCt1le9miretdyRW36fK0lffxYpBi4RVs8doGCa1ckHHF8GZHX7oTgdTE+WLoG7V6ALbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAW5P2sr9j+Xp6/PboYP/+eUGIDm0xb0dNWJi6Tzvpo=;
 b=fga8sQc1P7EOWm8N0wAudo2FoxbcPxKwnEmgKkSc5KQcwB0AZh9Q1LeSb+LQLFOiSAsFCDA1qTbU7Yi1W2kkIskCg80lMMh6x03Uco9++b/Gv6Quee5hzstqOJAqI44jIMqtIn6ghWUdEpHfo5GYVvKg39sLlYMbiOd++S/N4dxKoGNfIxa1H64na6YeXNtuJu41X3M+nlLlbr+W/SDo656+pa58LpIB5sLk6BOno7ydtFYYzG0hyZmzQlUo/eVyDI5l5szjvUVx/v+coItNJO8zLODHdRjTQ051WOTGa7cosL6X+6GfE63XU/vxVQjy1/Rkx7gpi7ajj5gmioZz/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 CO1PR11MB4866.namprd11.prod.outlook.com (2603:10b6:303:91::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7472.10; Fri, 12 Apr 2024 15:16:21 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724%7]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 15:16:21 +0000
Message-ID: <d9261183-780d-40ad-a79b-ac9b194ae24f@intel.com>
Date: Fri, 12 Apr 2024 17:16:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/xe/uapi: Add a query flag for
 has_device_atomics_on_smem
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20240412092249.3636-1-nirmoy.das@intel.com>
 <20240412092249.3636-8-nirmoy.das@intel.com>
 <cad95cdadee68a240fa5e645ced1f42c1c775ef1.camel@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <cad95cdadee68a240fa5e645ced1f42c1c775ef1.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI1P293CA0028.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::20) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|CO1PR11MB4866:EE_
X-MS-Office365-Filtering-Correlation-Id: 5af1a326-5fe5-4eba-af00-08dc5b038272
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uCYtF6Q8gmbMJGpaSTSDR0XXFKyGObMz5pyL0AqHN01c8tmtKgPPcAx+oJ3JmkM9oe9t+z1Kyjj4euFfeWdoVId7INe3SaqaktdhGl5oMxOfqKtc9/VOhIhMQHnv+XitKs1mO4Teys7fhRnQkCvM48gjYAH5SIqrCluK9wVMuXK40cu+et8Cql+ywVXgprvNhbBGbtcjOHvV9VHUYNts4jKG2I/GmZHVlriD5LIs4BroUs/HfDtYXcTpaFQ+uGd0f+oYf58ZsR8tZEiDFPbpgH/8pb3a36/YlUIX5Vgc4093rNR7J8Ag6c8raZBzTLfOkCVt9gh43qxJ15NbKP54hWlKvpe+ses7tyiRicyaXrk2D9vx9bPT0QdfRfgRTx44OgsaIeQutOCPfT2KDZ5SzhsWg7av4ZFqjck0EnGX+oyrS2mGS/ec3xdkt673dHxyOUP8/Fxfuotd9mYCMVTi7OiJo+J9QMXA9ElgzPh6cy0p8gEHgrF77FWOaSowdVFMg8bFNgb7HqYsdcQSCm8rlgyw4PnPNhO+mHAHkJfNtzq0kxaGAwpTpv8X0LJJMpjfaKlerD5NGooF3dEoRSv+OsLtEy8l09Mm20KNeQ3okYM6jbCzMUfIyuWty5mq7z0mZgOG7MkMR7i9ua7g8OiN2SeK58C1tzjFqEiEfaB2TMM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OExha2NvNjI0alN6TjRFK0dxalY0Qko0NW8rMWRuWXBxTklFUUk3Vjl4NXoz?=
 =?utf-8?B?T0FXWU5uNVJlaTVKdGU2bzVYaGRsTnRmK3JUdFI4K3BUbmFoUWw1bEJLcXgx?=
 =?utf-8?B?L2s2Q2c3QWFkN3lwWEsybUJSYkd0czRRdktJR1ZQc1JWK1MzNUVsRStQQklv?=
 =?utf-8?B?OCs0UW1jWVo5MThyRTQ4bmljcWdKaEkrSkhGMjREc04yZ3hhYkRKTkM1ZFB1?=
 =?utf-8?B?ZGxDMHg4RFlWclBpMVpnbCs1YjdsdEluUlpvMitsS1NYZitEZzY1WUQ0ZVVk?=
 =?utf-8?B?ckFnbUh0V0dibGdKMWFFZkxScU9reG9mcnJUV0xOZmpIZUlLdU9YTmd3RzJn?=
 =?utf-8?B?c3ZpOUZ0MDZ2SXRFQkw5c0sweXN0SE5hWlNTVGwzeHFJWnBEaktvRDI2WUxM?=
 =?utf-8?B?NDI4b0NKZU01Q2kwMnpIV2pnNENXaGFFZk5WRDhNQy9jaVZxVkw2YXhLeDgv?=
 =?utf-8?B?a21lTlpXZjd4eFVCZlBtcmJiQjZxV0MvTHgwOWlIMkJ5dG1lMjRVVUM0dy8r?=
 =?utf-8?B?NXlVY1IvK3RDSUZDL2NCM1lIQXF2YWNqdytteFBLUFlrS1g0WFZIeVpKQSth?=
 =?utf-8?B?bHN4TWFtazhPS1Q3YjJ4clE2bzdNb3lNRk1CaE1uTS9qcGYyVW1NWWRXOE5X?=
 =?utf-8?B?Q1J6RkNOTGdpWHJLaVM1Rm42dWR2cURhMnp6cnRZTVNTQWZWK2NybWkzZU0x?=
 =?utf-8?B?RG5JbXBRTWZETmlYUHk2NzRBc1hOQkFHQTIxVlBlenZXUDh4aFppd0h1Y0dn?=
 =?utf-8?B?Qi9ZZTcvOWdCQWRmVjBlYVlucTBYSWlKaTJqT25JNG02Z05PcmVOMHNaWXdI?=
 =?utf-8?B?SXNUdXpVbFlPU2VtZzJnbHFERlhDckFPaWtiaE5ldzNVcXBwMUlCUTFwSjM1?=
 =?utf-8?B?Y0JTMFRtNWJKdGJEQmZYTk5NNUMwdFdESEd5cmVtZEVEZmp4T00zTFRKa0U5?=
 =?utf-8?B?YlM0b3ZYcmF6NmQ3WmNYbTJscU9IUDQ4dGxDZHdqa0VwQjQ2Mjh4QTNFYnFC?=
 =?utf-8?B?Z2RWYzA3Q3FYdzVObzFlbFFUV0NhRE5Pa3dmdGoyVi8wRHVDYlBQanEvWktC?=
 =?utf-8?B?UDdIUmc0SDFGZkZQck1WNnVWSW04Y2Q0WDArM3VGd1dRVTNFRjQrbkgzMnpG?=
 =?utf-8?B?eDFkbkxCY3VqUG5TdXdKM0p4N2tPczZoaHBxcmNacmFvS1hldFdjdkV3amtO?=
 =?utf-8?B?bVZOZGNreWUyTVBpYWNkdHM0VU84STNSbTRBd2hyeE85dmtaMTZPQkFVNmY2?=
 =?utf-8?B?TWI4Mm82MGw0ckdDcXpWWUltbUN0cnhDVnhRTmRFdzRUUXFMc0RrSVRzb0Ev?=
 =?utf-8?B?aHBrV0pWMUgrU3ZKMXdnVTlGa0p3ZWtMYWFENU5ub3QrWmtTVFNUampzUVRI?=
 =?utf-8?B?RjJqQXlNM0ZoM1pOOW56NDBWeHpHV0FTTE1lZ29oT21BYnFDZEt1VjF0bjI2?=
 =?utf-8?B?NUZiOW1JUE9HeHdLRVRYUGk5VDI4QzZvTm45NXdETFBrRGYzQ2d0UDdMNWd0?=
 =?utf-8?B?R2pBZytuekxuT1dlK0piL1Z0VlFoQzdmZGxOVllBS1Z6MWlpa2p1NWxKTlR2?=
 =?utf-8?B?Tk9uamdydnRMdlBzK1FMNVB6SGt0L1R6TWxPUWRicmQyd2pqQ0t5QitFU0Fa?=
 =?utf-8?B?ZnE1eVpvS1JwSU5lVjdBUlpJdzJGUy9MOXlrdDlWQ2t0VWdaaUEzR2ZiajZU?=
 =?utf-8?B?YXdHS1kxb1pIMGpETDExV09EdVFrRFJPMm93VTVBQlNPMG1BQnhLYk9qczZM?=
 =?utf-8?B?NTNHVitlQURDcWN0dFltZ2xJS2dzWWVrQTBtV3lYOUlFaDZzZmhCdnAwcVU4?=
 =?utf-8?B?dHAwcWNBWUlHTlpsczBmZFNyTHhHc2paazZhVllVWjhKODllSjN1RzVvUkRt?=
 =?utf-8?B?RW52QVQ4b2JQZ0ZKTUtNbWZpMGp5QkdzUStGb2h0MEVIYTJ0TGF0bHVidFlI?=
 =?utf-8?B?THhoNmkremYvOFZmUWJoS1ZjN21aeWZkYUM2UjlmcmEvSXF1a3NGTFF5alBW?=
 =?utf-8?B?SnlQUVR1eU5rTStkeCs5b29YeUtpOXpiaTFlaDhJRXBZbVZzZFFPQ3lVUGlW?=
 =?utf-8?B?OHFhWWxCUmRuRkxmL2Nhdms0aU0rbW8vYmRGNktwdEZ6WTFkcUlDREtQU2hP?=
 =?utf-8?Q?lkHj1sfCRS7kfE/mm3ONlFS/m?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af1a326-5fe5-4eba-af00-08dc5b038272
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 15:16:21.3776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMdop7QJeUOteyk64YOBaOUpvkpPg094fIzAu/JHV5kvALbnI4nR1x2UTufc3rgUuxDaamgbpXrR+gXbpsv69g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4866
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

Hi Jose,

On 4/12/2024 3:37 PM, Souza, Jose wrote:
> On Fri, 2024-04-12 at 11:22 +0200, Nirmoy Das wrote:
>> Add a query flag for xe->info.has_device_atomics_on_smem
>> as this is platform dependent. This flag can be use to inform
>> whether DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS can be effectively
>> applied for a given platform.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_query.c | 4 +++-
>>   include/uapi/drm/xe_drm.h     | 3 +++
>>   2 files changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>> index df407d73e5f5..b8a606698e38 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -312,7 +312,7 @@ static int query_mem_regions(struct xe_device *xe,
>>   
>>   static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>>   {
>> -	const u32 num_params = DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1;
>> +	const u32 num_params = DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM + 1;
>>   	size_t size =
>>   		sizeof(struct drm_xe_query_config) + num_params * sizeof(u64);
>>   	struct drm_xe_query_config __user *query_ptr =
>> @@ -341,6 +341,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>>   	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
>>   	config->info[DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY] =
>>   		xe_exec_queue_device_get_max_priority(xe);
>> +	config->info[DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM] =
>> +		xe->info.has_device_atomics_on_smem;
>>   
>>   	if (copy_to_user(query_ptr, config, size)) {
>>   		kfree(config);
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index a44c057d4471..4804b8a5d028 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -394,6 +394,8 @@ struct drm_xe_query_mem_regions {
>>    *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
>>    *  - %DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY - Value of the highest
>>    *    available exec queue priority
>> + *  - %DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM - Flag is set if the device
>> + *    supports device atomics on system memory
>>    */
>>   struct drm_xe_query_config {
>>   	/** @num_params: number of parameters returned in info */
>> @@ -408,6 +410,7 @@ struct drm_xe_query_config {
>>   #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>>   #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>>   #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
>> +#define DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM	5
>>   	/** @info: array of elements containing the config info */
>>   	__u64 info[];
> this will use a whole 64bits for just one bit, better add as add as a bit in DRM_XE_QUERY_CONFIG_FLAGS(after DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM)

Good idea. Will do that.


Thanks,

Nirmoy

>
>>   };
