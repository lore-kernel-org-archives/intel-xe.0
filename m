Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A737CC46CD4
	for <intel-xe@archiver.kernel.org>; Fri, 22 Dec 2023 07:42:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B1D10E75B;
	Fri, 22 Dec 2023 07:42:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F362410E75B
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Dec 2023 07:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703230975; x=1734766975;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=owX6eDlODNesOVfscsPh6DufcACLtCjUNLIl+dYz34k=;
 b=Ku0Mgh3gE3m8HeQ1qNbeqHynL12HRtZmt0fsFqaVbgaiKwvIOfUXRwua
 3nZv7O8MFMLfhzbQSYkeM0E2kc+dLxj1vbzLGsNf4TVgaclk1Q9fMmw3I
 3ePyMjuKi81Sp666XNwAgobFVBO3rxspzWIOORvTGE5JvaT8oqTyl/vWF
 Ov1asAZbNQkSiRqrFt4NyJFrZ1d0XhdO7lrbEr2Aa/ycBRNbnmZDRsjIA
 nVOmU9m1eVNwJsT1NG+dbu5o9L1BZ9hqFxEO31UiNap7LouwGbFJVslUF
 wa+CJSzyxz6ssedS6JbJcDI72pumZzpt0zvEo/99lcQ+LRasOo7tMUI2d Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="462526883"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="462526883"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 23:42:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="1024126243"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="1024126243"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Dec 2023 23:42:54 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 23:42:53 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Dec 2023 23:42:53 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Dec 2023 23:42:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i75TyXf3xaNz3n3jprfaUPiLzswb6MvhHfmZV2FixwdUiSsXgW9wDU/fGkpPwEVhUuOLbw6P+hGlvsajiARYA1P74B8eCHyHyTaHEIyaF9UtnbQdElwGrifeAJpzbDzeTz+Lc17EO+VEE+67GC8ABoS+6L0uZJstfLRJyPVv/GDkp52jeLgqhkuPAvprM5WDLr3gPN77c6/iUPBaUUj+MB0aOUq0P7po5XGvWeyW6/K8+4ZsmJIRrcWE1BsRX5ncAIQ/7UbADj+byG8PJ5VhBeyWXKVf8xlp8A7kVMrzbiT8Roi6ogtXTxCyFOqmHrOozODEPgSTMb4H7zhkLMJ0JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWVUYny8q4Yn0PneLAlAzBf2TwDCNbFwhIPnT/Ss0IM=;
 b=eYZhZ80XctAl4BGkiEwA8Iq7yJzEGrMnHYjJzXOswAGKVs1+E7w0SBgk/hRabK9ijXYwzRgAJwUlzB5uKYCcDzK+fHwnpojbh0/YkzerUcQCpOoX029ku8dzCwFmNJ3ruL18gVzDErWltKwdRHpph4surkuo2YdnzlV5K0UfYUgykekgxPLPanqkhN9rkFbkBcL1w9qTqAhVy8QeEXGYPXC2AbHdofiLqX3Srf8uHU4bAbznLyjYSn1Yz+SVjyqY86qDDaG3n51e8ZNAHDOFNUFqgCkrHcPYq+V74a8+OvmHO6axeY6cGFnAlrZ69HobOtmLRpFvQeGgRCioUEMU3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM4PR11MB6120.namprd11.prod.outlook.com (2603:10b6:8:af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 07:42:51 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::51c3:59ea:6d4:8bc0]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::51c3:59ea:6d4:8bc0%4]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 07:42:51 +0000
Message-ID: <feaad7a7-a343-4f46-bae2-211930c77e5a@intel.com>
Date: Fri, 22 Dec 2023 13:12:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/dgfx: Release mmap mappings on rpm suspend
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231220185028.218622-1-badal.nilawar@intel.com>
 <b9b4ea2e-5843-4933-894c-1f2417f9b2ec@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <b9b4ea2e-5843-4933-894c-1f2417f9b2ec@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::13) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM4PR11MB6120:EE_
X-MS-Office365-Filtering-Correlation-Id: 715d358c-b2d6-4515-f2bf-08dc02c198f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BulacqvIctBh+M4MO1eb1UzV6SMDKMcelYHdZJ/g2gbrc6yGL9rnYhpp4cT+koZqm8XapUx8AHNeFg4o66pzHx7no4T+mr210/Gce9m9bZYezBrFd82CG7EYhuEojGO6MDpVKk8oXcX5RxIUiaAKfcHHLgA87oF99m0AZTYkxwY7ddY64kY67ks1IDVFKpAztGnKmWcKblBAcYSIPi+Nni8BwT9IrEwAdiiLDzqp4U64kMLfC8xhvie3knXBuEqAI/vJX0ZH4dg55Qx045OgyvL0S1ukZCTe8tnBbrR3GqKTkWZf0EkcwI/sOxxH88yVawZ/uJjXAv0R6xVErQpe4wEJ1OvTl8Vq8IyTzP90tWkUhQuvFsxO/vnQvelQxiNGKVWgYjW5AG9iR+2O9DMrkvVEL3/T0dvey/Z16D2nQ6NThffpqksHTZ/8M39MDThjtzvMywzbGnpo/awiYZZXX62idRIq+/VA/ulke6fsv6gA8CoNVEAGi6lPKOuQ77ip3jI+WgcC7srTXC2ojfE4onEyOK6PEenzAYaBtc9ahZ3QAI/2NxntxerFFOA3gisyL/1k0fMFyT+rkqA5CIZCoe4eHcuOzQPvSVYV6Anhl8poaF67m6/65bqwm8Eppd8KgUGa6BSJ67sdYf7h9iPOrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(376002)(136003)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(66899024)(478600001)(6486002)(4326008)(38100700002)(5660300002)(15650500001)(316002)(66476007)(66946007)(66556008)(8676002)(8936002)(26005)(83380400001)(66574015)(2616005)(107886003)(31686004)(6666004)(53546011)(6506007)(6512007)(36756003)(31696002)(41300700001)(86362001)(2906002)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXZaYzFpbHBSaUsvRjlaVWNKV1RoN0dIQnZOZXRTRTBuVEdHenBpamFlSXVn?=
 =?utf-8?B?SWZBdVlOeVZHOFg0aUNJeC9zdjZQb29TenF0ZkpmUm15S0hWWWFiV0FxUnFF?=
 =?utf-8?B?S1Z3bHE1Y2hLUGpkREVmVGd4S3pwbDNTdlFpQ3p0R2hyZ3gvY3d5ZUxnNzQ4?=
 =?utf-8?B?K3V6MUpKUHcyT1VDOUtsMTAzMjNEUXE4WkhMZks4V0ZrdDFuRVBLMnR1ZTEw?=
 =?utf-8?B?U2V6MUVxYXhVa2YxV1FlbWxDY1k4dWVMeTRKRE8rODExeURnTjcrZUxWNXR3?=
 =?utf-8?B?bTYxcm1JaWw3cDVuM2I1bzR3OVUya0hvMU95ZzBNT0Z2cU1PSjBma1ByZzdm?=
 =?utf-8?B?Y0Via2l6K1FCNURkdTNGTFNhN1F5bW8xRWdoa0EzaGNKYzJ4eitpWmUxT1NI?=
 =?utf-8?B?M2svaXVtOFl2WS9EbFdvcnkxbGxVekVWaUhuWFptbGdWSWcyTzNHQkllRHRa?=
 =?utf-8?B?ZnJKWVluZFRHUGtWUjBPbjJYcXVYT2IzeW16dGtKNHJVNDUvWkFYdUJmeXFu?=
 =?utf-8?B?V01FdDVCY2pDT3V4NGQ3MGFGekFkeFVEbnF4YVJ6SStGOS9PcWdKK01MNVJU?=
 =?utf-8?B?SmpGNy9OUm1pL1k1ZEhaNTNFOXl2Q3g3dWJhSnlKaHQvbTdZNWNzN2wvR2U4?=
 =?utf-8?B?c1VHcXAvY0c4VWtPbkpPWHlqVWp5NDY4bXhrUnBpU0NNN3hxWVBOQ0lmbXlM?=
 =?utf-8?B?MmJ2cEF0RlppL2hoTFJOM3UxckR3T1hxOTFQcDNlMnJtVnhrOVZURC9Tcndn?=
 =?utf-8?B?WHg5cmdDdGZkYlEvNjIyTGc4Nnp2S0RocHQxUDlxcUNFMU4vMUMvbCtzSWk1?=
 =?utf-8?B?aW80cGI4bjFDM2d0L1FrS29PczVCaWRzbTVPdzdkRXJWU2NmQ20wM2ZnekIr?=
 =?utf-8?B?RGVMbFh6Q3BEY2tvUmZadEQyRDNkM3EyeWd3SFRNTWJxd3lRZkh1d1VsVytp?=
 =?utf-8?B?N1YyOGhwdVFMVlFBdjFkcXNtTVo1WWg3eFBKZ3NvNFJheUZxdmtBR2xBMXVm?=
 =?utf-8?B?WC9zVmg3MDV6NS9rbm9NaGJsRmdleWEvWmlTdmo1SGdxcEl5endldnJINDdI?=
 =?utf-8?B?VzlaTmRXNVF0R0hXT2ZnZ1RIaUhiOWRsYVNEaFVwTXlYU09kZDI4R0ZjU2Rp?=
 =?utf-8?B?NkV1akQ5SzQyOUlOZ3J5NlBFNVluOXRPei81elkwbzBXcEtkbm4zQ2svZ09U?=
 =?utf-8?B?aXFBc055ZDdpOE9aY2d3UytPeTIvK0JublM2UGROakF2Rzg0NGdFcFFKbWpU?=
 =?utf-8?B?UjBvRERhS2VvemEvT1EvZ3hEOHBldk1oejR5WHc3YVdSUS82YmRDVnhJMXlU?=
 =?utf-8?B?S3c4dnhmOUkwa2t6VUpoOVNJa3VkYzJrVndJUG0zQTNKaEZBR3hMS0dhK1Na?=
 =?utf-8?B?NUdjNk40ZTV2UkpEMmdtZDBMZWFaSHphRXFpMTNFWUQzRlUvczI4bTNIZ05T?=
 =?utf-8?B?NzNCalRFUHlQQ3htcjAwdkFDVmlqNVdyQU1JWEVNU09vdjFBZUxaR2FWdHgy?=
 =?utf-8?B?ZWgrdW00YktwSGtTMzkxaHFBd1F2aWxlaVBjbXVVMXZZWHpQWGZ0K0lxQjZq?=
 =?utf-8?B?WU1jbGNXdzdsVHZ2WmtqTjM4R2tTcEN2NUJEN0tNZi8vbDAxc2V5amtQU1Z3?=
 =?utf-8?B?MTc3Skw5aTNrSlRTSkIzV0FidnlGNThFS3VIdjRmRlNzK2xzV3oyVjFyQWUv?=
 =?utf-8?B?MDlOdE5lbWpnRTg3Tlg3OXBDcW5IclpXQ3UzUTQrdVR3eDFxb1lPZUtYbXBZ?=
 =?utf-8?B?VWFLa2JIVkV1Z2E2NU9vbU9tUUJTUG15bzVyYzdPVnVWcElwS0dRck4vQzNj?=
 =?utf-8?B?TmRJOU5SSElsM1ZXdXhzNEZwWGMrK1hHYnh6UnhXTkgyaTcwSk5WdkFDQlU0?=
 =?utf-8?B?bG5xRmkzaXc0OTJ1ZHVlT3FFTFd4QTFxaU9GU1JJNmZMWXgrR051VzVmd0JM?=
 =?utf-8?B?Z1c2a2dBY0dUM1hwS2lQaEJmUk9jbkhYSEhsLzJlY1F0U3V6ZWs5NGlIQWlD?=
 =?utf-8?B?dDFObnhHSkhzejBKckZSNnRLVkZMUDR6TFR2TnVmbDNML0lLampCSkxPbnl6?=
 =?utf-8?B?YmhYSUU4NFZjM2lScVZNbVJqK3NPRGgybEFZdWkybllxeE5zV2RSV2hIZE0z?=
 =?utf-8?B?dFdSTzUyeklLR1FYTVBmSi9wWDcycks1QmZVdVBGa2t3eEJiUFRTQ2ZISUc3?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 715d358c-b2d6-4515-f2bf-08dc02c198f8
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 07:42:50.1469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQAxJgIYL/UXrksMNsRowHp1BrSoYytfLRF9qdX71Z9Hfj8azTVlWFd59w8w+4QoCa968EtGFAfelWll2l7tig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6120
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
Cc: thomas.hellstrom@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 21-12-2023 14:51, Matthew Auld wrote:
> On 20/12/2023 18:50, Badal Nilawar wrote:
>> Release all mmap mappings for all vram objects which are associated
>> with userfault such that, while pcie function in D3hot, any access
>> to memory mappings will raise a userfault.
>>
>> Upon userfault, in order to access memory mappings, if graphics
>> function is in D3 then runtime resume of dgpu will be triggered to
>> transition to D0.
>>
>> v2:
>>    - Add lock dep assertion before updating vram_userfault_count 
>> (Rodrigo)
>>    - Avoid iomem check before bo migration check as bo can migrate
>>      to system memory (Matthew Auld)
>> v3:
>>    - Delete bo userfault link during bo destroy
>>    - Upon bo move (vram-smem), do bo userfault link deletion in
>>      xe_bo_move_notify instead of xe_bo_move (Thomas Hellström)
>>    - Grab lock in rpm hook while deleting bo userfault link (Matthew 
>> Auld)
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c           | 65 +++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_bo.h           |  2 +
>>   drivers/gpu/drm/xe/xe_bo_types.h     |  5 +++
>>   drivers/gpu/drm/xe/xe_device_types.h | 20 +++++++++
>>   drivers/gpu/drm/xe/xe_pm.c           |  7 +++
>>   5 files changed, 98 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 8e4a3b1f6b93..2ab933f50192 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -586,6 +586,8 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>>   {
>>       struct ttm_buffer_object *ttm_bo = &bo->ttm;
>>       struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>> +    struct ttm_resource *old_mem = ttm_bo->resource;
>> +    u32 old_mem_type = old_mem ? old_mem->mem_type : XE_PL_SYSTEM;
>>       int ret;
>>       /*
>> @@ -597,6 +599,7 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>>           return -EINVAL;
>>       xe_bo_vunmap(bo);
>> +
>>       ret = xe_bo_trigger_rebind(xe, bo, ctx);
>>       if (ret)
>>           return ret;
>> @@ -605,6 +608,18 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>>       if (ttm_bo->base.dma_buf && !ttm_bo->base.import_attach)
>>           dma_buf_move_notify(ttm_bo->base.dma_buf);
>> +    /*
>> +     * TTM has already nuked the mmap for us (see ttm_bo_unmap_virtual),
>> +     * so if we moved from VRAM make sure to unlink this from the 
>> userfault
>> +     * tracking.
>> +     */
>> +    if (mem_type_is_vram(old_mem_type)) {
>> +        spin_lock(&xe->mem_access.vram_userfault_lock);
>> +        if (!list_empty(&bo->vram_userfault_link))
>> +            list_del_init(&bo->vram_userfault_link);
>> +        spin_unlock(&xe->mem_access.vram_userfault_lock);
>> +    }
>> +
>>       return 0;
>>   }
>> @@ -1063,6 +1078,11 @@ static void xe_ttm_bo_destroy(struct 
>> ttm_buffer_object *ttm_bo)
>>       if (bo->vm && xe_bo_is_user(bo))
>>           xe_vm_put(bo->vm);
>> +    spin_lock(&xe->mem_access.vram_userfault_lock);
>> +    if (!list_empty(&bo->vram_userfault_link))
>> +        list_del(&bo->vram_userfault_link);
>> +    spin_unlock(&xe->mem_access.vram_userfault_lock);
>> +
>>       kfree(bo);
>>   }
>> @@ -1110,6 +1130,8 @@ static vm_fault_t xe_gem_fault(struct vm_fault 
>> *vmf)
>>   {
>>       struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
>>       struct drm_device *ddev = tbo->base.dev;
>> +    struct xe_bo *bo = NULL;
>> +    struct xe_device *xe = to_xe_device(ddev);
>>       vm_fault_t ret;
>>       int idx, r = 0;
>> @@ -1118,7 +1140,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault 
>> *vmf)
>>           return ret;
>>       if (drm_dev_enter(ddev, &idx)) {
>> -        struct xe_bo *bo = ttm_to_xe_bo(tbo);
>> +        bo = ttm_to_xe_bo(tbo);
>>           trace_xe_bo_cpu_fault(bo);
>> @@ -1137,10 +1159,31 @@ static vm_fault_t xe_gem_fault(struct vm_fault 
>> *vmf)
>>       } else {
>>           ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
>>       }
>> +
>>       if (ret == VM_FAULT_RETRY && !(vmf->flags & 
>> FAULT_FLAG_RETRY_NOWAIT))
>>           return ret;
>> +    /*
>> +     * ttm_bo_vm_reserve() already has dma_resv_lock.
>> +     * vram_userfault_count is protected by dma_resv lock and rpm 
>> wakeref.
>> +     */
>> +    if (ret == VM_FAULT_NOPAGE && bo && !bo->vram_userfault_count) {
>> +        if (tbo->resource->bus.is_iomem) {
>> +            dma_resv_assert_held(tbo->base.resv);
>> +
>> +            xe_device_mem_access_get(xe);
> 
> Thinking ahead for d3cold, we probably don't want to introduce more 
> places that do dma-resv -> access_get. Not a big deal for now, but at 
> some point someone will have to fix this. Please consider if we can 
> easily move this higher up now.
Sure I will change this as disscussed offline.
> 
>> +
>> +            bo->vram_userfault_count = 1;
>> +
>> +            spin_lock(&xe->mem_access.vram_userfault_lock);
>> +            list_add(&bo->vram_userfault_link, 
>> &xe->mem_access.vram_userfault_list);
>> +            spin_unlock(&xe->mem_access.vram_userfault_lock);
>> +
>> +            xe_device_mem_access_put(xe);
>> +        }
>> +    }
>>       dma_resv_unlock(tbo->base.resv);
>> +
>>       return ret;
>>   }
>> @@ -1254,6 +1297,7 @@ struct xe_bo *___xe_bo_create_locked(struct 
>> xe_device *xe, struct xe_bo *bo,
>>   #ifdef CONFIG_PROC_FS
>>       INIT_LIST_HEAD(&bo->client_link);
>>   #endif
>> +    INIT_LIST_HEAD(&bo->vram_userfault_link);
>>       drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
>> @@ -2264,6 +2308,25 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>>       return err;
>>   }
>> +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo)
>> +{
>> +    struct ttm_buffer_object *tbo = &bo->ttm;
>> +    struct ttm_device *bdev = tbo->bdev;
>> +    struct xe_device *xe = ttm_to_xe_device(bdev);
>> +
>> +    drm_vma_node_unmap(&tbo->base.vma_node, bdev->dev_mapping);
>> +
>> +    /*
>> +     * Other callers xe_ttm_bo_destroy and xe_bo_move_notify also 
>> checks and
>> +     * deletes vram_user_fault_link so grabbing spinlock here.
>> +     */
>> +    XE_WARN_ON(!bo->vram_userfault_count);
>> +    spin_lock(&xe->mem_access.vram_userfault_lock);
> 
> AFAICT exclusive access is needed for the entire list op, including the 
> list iteration prior to this.
Ok.
> 
>> +    list_del(&bo->vram_userfault_link);
>> +    bo->vram_userfault_count = 0;
>> +    spin_unlock(&xe->mem_access.vram_userfault_lock);
>> +}
>> +
>>   #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>>   #include "tests/xe_bo.c"
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index 97b32528c600..350cc73cadf8 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -249,6 +249,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, 
>> void *data,
>>               struct drm_file *file);
>>   int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>>                    struct drm_file *file);
>> +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo);
>> +
>>   int xe_bo_dumb_create(struct drm_file *file_priv,
>>                 struct drm_device *dev,
>>                 struct drm_mode_create_dumb *args);
>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h 
>> b/drivers/gpu/drm/xe/xe_bo_types.h
>> index 64c2249a4e40..910b35c05acd 100644
>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>> @@ -88,6 +88,11 @@ struct xe_bo {
>>        * objects.
>>        */
>>       u16 cpu_caching;
>> +    /**
>> +     * Whether the object is currently in fake offset mmap backed by 
>> vram.
>> +     */
>> +    unsigned int vram_userfault_count;
>> +    struct list_head vram_userfault_link;
> 
> Nit: Needs proper kernel-doc. Also consider maybe wrapping this in a 
> struct:
> 
> struct {
>      struct list_head link;
>      int count;
> } vram_userfault;
Sure will fix this.
> 
>>   };
>>   #define intel_bo_to_drm_bo(bo) (&(bo)->ttm.base)
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index 71f23ac365e6..6890d21f7a4c 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -385,6 +385,26 @@ struct xe_device {
>>       struct {
>>           /** @ref: ref count of memory accesses */
>>           atomic_t ref;
>> +        /*
>> +         *  Protects access to vram usefault list.
>> +         *  It is required, if we are outside of the runtime suspend 
>> path,
>> +         *  access to @vram_userfault_list requires always first 
>> grabbing the
>> +         *  runtime pm, to ensure we can't race against runtime suspend.
>> +         *  Once we have that we also need to grab @vram_userfault_lock,
>> +         *  at which point we have exclusive access.
>> +         *  The runtime suspend path is special since it doesn't 
>> really hold any locks,
>> +         *  but instead has exclusive access by virtue of all other 
>> accesses requiring
>> +         *  holding the runtime pm wakeref.
>> +         */
>> +        spinlock_t vram_userfault_lock;
>> +
>> +        /*
>> +         *  Keep list of userfaulted gem obj, which require to 
>> release their
>> +         *  mmap mappings at runtime suspend path.
>> +         */
> 
> Nit: Not properly formatted kernel-doc here and above.
Ok.
> 
>> +        struct list_head vram_userfault_list;
>> +
>> +        bool vram_userfault_ongoing;
> 
> Also maybe consider wrapping this in a struct:
> 
> struct {
>      spinlock_t lock;
>      list_head list;
> } vram_userfault;
Ok, will fix this.
> 
> Also vram_userfault_ongoing looks to be unused.
Will remove it.

Thanks,
Badal
> 
>>       } mem_access;
>>       /**
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index b429c2876a76..bc1cb081e6e5 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -181,6 +181,8 @@ void xe_pm_init(struct xe_device *xe)
>>       }
>>       xe_pm_runtime_init(xe);
>> +    INIT_LIST_HEAD(&xe->mem_access.vram_userfault_list);
>> +    spin_lock_init(&xe->mem_access.vram_userfault_lock);
>>   }
>>   void xe_pm_runtime_fini(struct xe_device *xe)
>> @@ -214,6 +216,7 @@ struct task_struct 
>> *xe_pm_read_callback_task(struct xe_device *xe)
>>   int xe_pm_runtime_suspend(struct xe_device *xe)
>>   {
>> +    struct xe_bo *bo, *on;
>>       struct xe_gt *gt;
>>       u8 id;
>>       int err = 0;
>> @@ -247,6 +250,10 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>        */
>>       lock_map_acquire(&xe_device_mem_access_lockdep_map);
>> +    list_for_each_entry_safe(bo, on,
>> +                 &xe->mem_access.vram_userfault_list, 
>> vram_userfault_link)
>> +        xe_bo_runtime_pm_release_mmap_offset(bo);
>> +
>>       if (xe->d3cold.allowed) {
>>           err = xe_bo_evict_all(xe);
>>           if (err)
