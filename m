Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76C5C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 04:35:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A844910E9D0;
	Fri,  8 Dec 2023 04:35:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B7310E9CD
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 04:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702010118; x=1733546118;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y1+adYLROHjwiX1xRhqiSq6wa61ux6ztJu3kq/aLyEQ=;
 b=NQGrYQ/rQgqI+XLYaZbQChXHV1L5an5JaSJXRN+WCT56fjgexe51/baN
 jb/fRTEUFy6ubXJ9EGYN+oF3LjbmQBiL/LMWnPrYNGy2GEWHMUI4CCa4R
 tv0sI232BkuOoYR0th9+L/k1n+j8irTOAhXTCASGPOI3pGEJngbyNb2+g
 OjuklLVS61mt0/D9jtu2UR81zm6mQsDokf7YlcljxMVWrhqA5pTJC0qrs
 RuGuhf+sX5c67k0r2YoJlI8dgvfrtVgHEY8zijMbMOqVF2tcZocEMQ2SD
 bQ70v9ctlowE2hvr4fSjyNd72sv6i8xyNRExRpOfyAr23FWbBpDpq4fRO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="394095692"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="394095692"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 20:35:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765361163"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="765361163"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 20:35:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 20:35:16 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 20:35:16 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 20:35:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ht900yl/deiJaGnYldWxsH9N4TSvXAeeHdfQeafHIR9Fv7KolBN09EZN3Xxr7evKTyVKQac7wednMj765vy6DmQwAJQXfJd2XAzeZTTHYIq434EIBgHKg4EDnqxR9VnKrsZEJ2sNKUyHRph4UqMlfgp21KTQccaH6f21JqcEmbU2cBl1rrSrhzPnWsAMTrQF3qVLm8MJb/9ckiflcJ1ioyuOeNFyOt+0Aopsbe3ND4DWz3gPnkKmCOzw9Z/KDZSg9EvLwVQczxkWEulshGYcImsOyerGdOtn5erCrBw2Qq1RWU6btpUjefQWHG8SlmL9+aIBg68zgpf2urFfttOQPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34PNU8/jdgOGVOKdgTOn4yVbJXAiH+JEH7337rO46X8=;
 b=bJyhk9pFudX+1iV2XHFEoGNAhe/JynizUYXvhfOWtMBmn3I3XIj7GI7qnMravo2pKTRxmjhzM5bkabxpdAsOctdUpWYs51BBOnB+aWMeIkhYdc/uCaXn2yMxwmsAAP6mY4ip2zgwKy7aDzqqvoc9cXRSfuD8EjAiYjOsTV1qOClTkntjGkRHX6pOHdJKPhuEDyn1ZFuZz3Uc9VejfFf/kqjtwfcyQA0jEo6VwQtV85xlGw7S58BSF0UMbwPt7C9ttDooLfWtkbF+HSxaFsBx/RdzewLJlxOghkPhWIREZZt0KtGveW2BYEDRkh9OYDKpLY9gyKDQNaX1JiNbouvjcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB5972.namprd11.prod.outlook.com (2603:10b6:8:5f::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.27; Fri, 8 Dec 2023 04:35:14 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c%4]) with mapi id 15.20.7025.022; Fri, 8 Dec 2023
 04:35:14 +0000
Message-ID: <2bf6f273-1960-4386-bd9e-c229958aef23@intel.com>
Date: Fri, 8 Dec 2023 10:05:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-xe] [PATCH v4 8/9] drm/xe/xe2: Modify xe_bo_test for
 system memory
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20231206043126.984049-1-himal.prasad.ghimiray@intel.com>
 <20231206043126.984049-9-himal.prasad.ghimiray@intel.com>
 <20231207002314.GW1327160@mdroper-desk1.amr.corp.intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20231207002314.GW1327160@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0169.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::24) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM4PR11MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: e9045904-c551-4a65-3fbc-08dbf7a7122a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1RbQ4d02rO29adS/NDgEvBrtZtjVy8fks5/1MkYww3Z82x/jiqrhCixh1MGNhllyqyAySiOSWIX1jMuIMmmb8m5pl9+n0iberTVD/j/19wv16KChs/nS5q0OYnHZQOC4W6dntuRx6fNGPVI0Mu1FwIlOomGKbD4E34mLVb2A6zzeXGBgv7f+/mtif95EcWfOKcnI20q8/SjkHYtDe/4CX9RHFudD7AnJ/lgT/+rpClqYmpMruM5JieQzifT/gfjdu1O8XijHD3LGvhfwtmcnWHZE2jJMxyiewDXMMijmKpHEoj40zl16iXF1uLQUZ4X0C0IgQE/JHmw+Omwoi2/y9yq1q0jq9jZFUXFl2TNeKviqoAyOxM8gvDm3WLwxOzq0K5Tz/TSMPOu//L4xK0zrffxbexpX3dQmjQoAz1C8imufJ09E1ZtLloVs9UUOWFopoZkZQSLaWecV8cHxp/IltbRnMeiI7nelY1fDsPGFk34pPPcEadAYwt3aSXxAfxw818CfgbNug1CRAnVg6zrJOoRqA4/k9EWV7CIeOtAwISt9HiYrY7b9aOiXunptgXM/XhuTujRu50Ys9xFwpEIreygDd35bdO2wGcRzfbwbsHqV0RKMcoVh/mlus0to9MhheyBW2KlkZv08S1p+vlvXRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(366004)(346002)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(41300700001)(36756003)(86362001)(5660300002)(2906002)(2616005)(53546011)(6512007)(83380400001)(82960400001)(26005)(66574015)(6506007)(6666004)(478600001)(6486002)(38100700002)(31686004)(6636002)(37006003)(66556008)(8676002)(8936002)(66946007)(66476007)(316002)(4326008)(6862004)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmVJbHY2a1JSYTFldlFLenA0b1QrYldySUxyWGowYUNBQ3RteU1sN3E0UmRI?=
 =?utf-8?B?OUVMYXZLczFpN1VSN1Rkd29JTnhndFlFZlhCeUtVSjMzamt6OVNORzNZM2dy?=
 =?utf-8?B?eWZnK3cxRXRmdEhFWTNvZkpKNG54WnFWOXVrRm9KWmlTNERwdlJGNlUxVm9r?=
 =?utf-8?B?WTBaSjRYRkxTWGtGaUN1UkNqSUtId0QvNDQ1dHJCY0syb0VHMEZhSC9xa08v?=
 =?utf-8?B?SUEyWmJUbS9vZGt1cmNzeEhWRlF6RHdNS2hJb2F0amo1SkQvRFNyZktuT0VR?=
 =?utf-8?B?STVoanVKNW5jSG1LaGR0NmhFNmFYZHpxbmRiZ3lvMm8wdnpoSDFLTCtrNXJv?=
 =?utf-8?B?ZXFiT0Z3Vk5VRGNXYVNNd2ltckc1Snp4cHRlQTRDRnJ5K1FHdUxuWWZqck13?=
 =?utf-8?B?Q3pSYzlvVUdFZXNPelhBSi8yOEl4b2l1TEJYelVTSWU4elZ3aFFPdnNXcjNp?=
 =?utf-8?B?L3dpT3VpeWFtb3lta0tzakZVSmJ6R0NBWVRSRVBzWmllL2lqa213aE9STkQ4?=
 =?utf-8?B?MlNGOFk2UFdySUdhc3N1c0xiUGxyU1dwd0ZpYkdscU11TlBiODhFWWFvY0J2?=
 =?utf-8?B?Wmt6YzZXRUZEaUU5cXFkTXdrc0hPTmxyK1loRndMMHY4b0o2OGpNNG02N3A3?=
 =?utf-8?B?V0o5VmtUb1pNRytSUTRDMVZCVGZ0aHlGZWNHRDdJNGR2aE02c0pRY3pYTG9G?=
 =?utf-8?B?SWp6SFhYZXhPWlh3b3Rpd2dCdHNOakV4Nkx3OTdJaitHazRyK1cwUmpXQTVk?=
 =?utf-8?B?RElOTmRvbmV3a2ZzQUJNQUI5bm1SNDFlN0lkNUwrUE9GNFc5L0tod3hHQWF4?=
 =?utf-8?B?cWk1ZGFSc05WMUQ4cXg4eXVsNlhZNjNveVlDWmJuVTZvaVdCY3F3SHYyaTh4?=
 =?utf-8?B?TlZLMFlzMHdueFJYYWhTWkdKSmpKVlFYYlg4MllYSjB6WUl5bnRvTjFhTTdN?=
 =?utf-8?B?clZKNk1NZ1FzbmYxNWkzbjlUcG9LZkVqS2pCY0x1RlQzSjc5Z3hrSHo2amti?=
 =?utf-8?B?VWg0UVRuTzJXZXdQckVRMktEcVdoTDErWDNvMVFsZXdQRmszcWFyMFpjb0xE?=
 =?utf-8?B?SndHbGFXMWkzdnU4Z1hXczN2WitXS2EvVCswYTBFUG9vQkhBWFpCME1GVnhm?=
 =?utf-8?B?bkUvSGRvTkJNVUZsS0ZWaFVHSmE3YU9ndE5KRzBsbnRyMmlBa3lkQmNhNWxS?=
 =?utf-8?B?eXN2SzVjZUM5bFBXby91R0VHcmxncGhIelJEYXYrbUxBZjJLd0svTTdrVEdB?=
 =?utf-8?B?akx3MVV5VUFKSTMzU1FLekd1T2FTMUNWcy9FM2JjZXdqNWp0RUtWTXdoK1VM?=
 =?utf-8?B?MUZQdFJSdWxkbGVGNGtaVlA2L3J1NGFid0xSd3pyNjlrQkdndEFYNnBBZkJN?=
 =?utf-8?B?S3YyMnlLNlFEd3ZzdWxlbFkrWVRxRVluaVZLWkZVUnVBVHZmM1J1OWJ3TnZa?=
 =?utf-8?B?TGF5SHArZkRXN2t0WExpN3FZUnJweitUWmJGWmxVQ0JmZ3kzUVM3UlhYcHpY?=
 =?utf-8?B?ZlpOSFR2Mm9ERXE3cm5haHVreXlzcVVBUmFPb3Z2alpFMU1pemU3clRGUXNs?=
 =?utf-8?B?blBvWTBrdFFkM041anBSa3JuK2pUd1B2Sk1sU2RjMTE5c1E0RTYzOGVtdU5R?=
 =?utf-8?B?MlVhZ09TTG9QK2JFVlNoaXNuTEJLMkowblpVbEExZW9GTllpM2I1elU3Zy81?=
 =?utf-8?B?UDBDS3dZMjVYREJXYWkwZEdpWFRCejNoWmJpSnVEaS9uN1VWbnRyMGJlNGMw?=
 =?utf-8?B?SDNKL3haZTZZaDhTUTFaTTBPT2FDa2dlOC9BaFpDbUdtV0Y5VHVLMjF5YzRD?=
 =?utf-8?B?QUh2cStHWDhQeHUwMEt4NWNzd2l1R1dmWXRkV3gwVFQrMDZPc1Ixb2tuYkQx?=
 =?utf-8?B?OVNORkNXVWkxRWIyc2J1RmdFMDdmdTgwYWMyNFVRS0oyNGZqZ2NycWJrOWdB?=
 =?utf-8?B?WkZIY2tMd3pkL0Q4UnRYaWZFcEIzZnRaQlgxLzM4bWFYcDVJTGIwN3dodG9a?=
 =?utf-8?B?THlzNjhCVm95Q0xjUUFhV2JvcWpNc0R0d1RWVUlodlZYQ2tjQllvVWZuWU45?=
 =?utf-8?B?KzhkSUNkY2lZYjRqTmxuNVhGQTJqbUVNVllVUWxaRnRRTmk2N0hHMGovbnAz?=
 =?utf-8?B?TWw1bGE4d0E1V0FYZGg1UWE0dW5kRkN3R2lrWVVsN1RFWmlYbnpzL2dhYmN5?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9045904-c551-4a65-3fbc-08dbf7a7122a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 04:35:14.2341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wr9OvXVLdZqmoeoRdqpBhD8sSQTCAVRTFT/oNOYkIo33yRdGfCdBnTVNYgPg6HyrrYGmWV3L0urQfFpuILBCfQWkTZ88108eNhP2OnBpfoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5972
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 07-12-2023 05:53, Matt Roper wrote:
> On Wed, Dec 06, 2023 at 10:01:25AM +0530, Himal Prasad Ghimiray wrote:
>> Modify test to valid ccs clear and copy during evict/restore on
>> igfx.
> As on the previous patch, what exactly does "evict/restore" refer to in
> this setting?

Evict -> Movement of bo from PL_TT to PL_SYSTEM

restore -> Movement from PL_SYSTEM to PL_TT

>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/tests/xe_bo.c | 23 ++++++++++++++++-------
>>   1 file changed, 16 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
>> index 549ab343de80..5e4e19a246dc 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
>> @@ -112,16 +112,21 @@ static void ccs_test_run_gt(struct xe_device *xe, struct xe_gt *gt,
>>   			    struct kunit *test)
>>   {
>>   	struct xe_bo *bo;
>> -	u32 vram_bit;
>> +	u32 mem_bit;
>>   	int ret;
>>   
>>   	/* TODO: Sanity check */
>> -	vram_bit = XE_BO_CREATE_VRAM0_BIT << gt_to_tile(gt)->id;
>> -	kunit_info(test, "Testing gt id %u vram id %u\n", gt->info.id,
>> -		   gt_to_tile(gt)->id);
>>   
>> -	bo = xe_bo_create_locked(xe, NULL, NULL, SZ_1M, ttm_bo_type_device,
>> -				 vram_bit);
>> +	mem_bit = IS_DGFX(xe) ? XE_BO_CREATE_VRAM0_BIT << gt_to_tile(gt)->id :
>> +				XE_BO_CREATE_SYSTEM_BIT;
>> +
>> +	if (IS_DGFX(xe))
>> +		kunit_info(test, "Testing gt id %u vram id %u\n", gt->info.id, gt_to_tile(gt)->id);
>> +	else
>> +		kunit_info(test, "Testing system memory\n");
>> +
>> +	bo = xe_bo_create_user(xe, NULL, NULL, SZ_1M, DRM_XE_GEM_CPU_CACHING_WC,
>> +			       ttm_bo_type_device, mem_bit);
>>   	if (IS_ERR(bo)) {
>>   		KUNIT_FAIL(test, "Failed to create bo.\n");
>>   		return;
>> @@ -160,8 +165,12 @@ static int ccs_test_run_device(struct xe_device *xe)
>>   
>>   	xe_device_mem_access_get(xe);
>>   
>> -	for_each_gt(gt, xe, id)
>> +	for_each_gt(gt, xe, id) {
>> +		/* For igfx run only for primary gt */
> Even on a dgpu why would we want to run on non-primary GTs?  Should this
> whole loop be switched to for_each_tile() instead?  There doesn't seem
> to be anything GT-centric in this whole test, so it seems like we should
> be passing around and operating on tile pointers instead of GT pointers.
Agreed. Will make the change in next version.
>
> Matt
>
>> +		if (!IS_DGFX(xe) && id > 0)
>> +			continue;
>>   		ccs_test_run_gt(xe, gt, test);
>> +	}
>>   
>>   	xe_device_mem_access_put(xe);
>>   
>> -- 
>> 2.25.1
>>
