Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3AAC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 03:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9FC10E1B3;
	Mon, 27 Nov 2023 03:26:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA9910E178
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 03:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701055562; x=1732591562;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=yoiWjh+6vRQtUa+EmxuUv2zY+38uZGSsfTQgGaROeAU=;
 b=Uyuq2c186vg6n8lK0wyHrPs6eU9f6hFUElc3slSqqb3h3/hN+aHmw3Tv
 sSjsNFKUknFaD3vLPzC5rZnO3fldzFYeaIA595dgUc52hoM73DVfCNVSt
 stzL5Wt7OJr2lZOIOYc7ysFvyx2QkmseEENMx/RfIWs1EqrotyfvOaYIR
 qtKmUoULdge8vSDM+fHb2OnF/tkzt8DizhXawaBczl1H4AFqA2DLuMwck
 XzaxmkPf4uXqDr+DLCQ43pMb5v1uwy/Svk8RiXuls0CZJ4UowZytYHIE1
 oYI49cu8gI4Aem5+H0p/Dahulp8m3VBe5rpLhtm4zKYWq6byvT5wymZ9T w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391501804"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; d="scan'208";a="391501804"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2023 19:25:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="838583332"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; d="scan'208";a="838583332"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2023 19:25:56 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 26 Nov 2023 19:25:55 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 26 Nov 2023 19:25:55 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 26 Nov 2023 19:25:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncma+ShyzVFDO/PM4USVef0pu5zPrV43fnD1+LF3XeexvMwkZK7udOs1YxazAeXKeUHeP4Is50NCsyph1pVg7wxyHcwusNKGSUW9d9dogEFPPGoIPjzRirh8m639BOHjAqmDoPMatXBUupeWgbAIQQ5q+JNDIdpHw4PvpaI2tX/yrK+zcO7bu9rMap/bxP4VtcjO7v6K0LJeUzufmm58n2aZV/c6kJhZF94dWK3kkp+EIjWEXXlXPzcvtlRaIXLSefwQro447PrBauP3+80qEE2KYahfEIp53uMz6Pa8Wmo3q/h5RKVfZjQrERtomFGTMHDT2ggG36TZYCe2MPx9fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CnGYCk/mQfww/HYqQjApsGfJ0eOT8eMSdNC+WN11Z/A=;
 b=iKtAk0QTCjAj8Er7WCQFjm7eeNRTH73qjPDjVd7QtEYwuy2sbhCiJUIoJXd7fBb1j6pjJC4NaDZahFzpB3NhGKCewOQT4jPdmxJ/lXpYXXJeqCUIjqRTv6fgO7yVJfejZePdYs3BE4u9SKGBJzchcOnWDOmkG5Cizo9D72InoQtpYYzUIwj4M2B3tY2k+tKxRqKby6A5sno05DZYk+Im7ofrKiCb77ao+khadQaDy9eFdyVVclkVnjY62AMOif/vJ0cFiF3L86KZmYiGpH49AYvALDY1LVMv07caNQ7EFxDCw6PL1fMRfi3pXjnVAyr9I4U0WCHhvCjScUR46iVtLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA1PR11MB7269.namprd11.prod.outlook.com (2603:10b6:208:42b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 03:25:49 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c%4]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 03:25:48 +0000
Message-ID: <8fe89536-b2b4-4705-b11e-55f56ae0320a@intel.com>
Date: Mon, 27 Nov 2023 08:55:43 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231121100906.3587649-1-himal.prasad.ghimiray@intel.com>
 <20231121100906.3587649-7-himal.prasad.ghimiray@intel.com>
 <6b29f9a6df44e12aa6c11a96da56a16754e4b6b0.camel@linux.intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <6b29f9a6df44e12aa6c11a96da56a16754e4b6b0.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::27) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|IA1PR11MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d9ea93e-6fad-411f-e8ab-08dbeef88cdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bJ1dp+cGK/YxadH1CG2z76sibLyjAmOGQjgoIc1yTQTQNpBGBfUitSdrwHi/T7yDVCuLo01IdraElu/0EswljeqVR9+xwIW7O92K4NDqD1L1o9txQRUfc0X9CpPOe82o/5my+Mmt+tXF1icvDLme1teh2Js3NBy0EiKws5Hrd7ffenNUAFn2B/YM36PfVTkEflbK0H2FycBjTG64ZwiF2mBcOXxX7E4crLQT58GQuoaT8FRgSEata4KKSTmOt5NO8O2H0doS/YEUBIunPmBbbznEpOe2vW6P/f5n6zXgSMgETavmIJEzmVH5R19oxYFEs+kfVyiSzyBJKs7NtgWHKWKzkgnpUb5ZSB8uDm4RApcxPS6PJ/4fBaB0mU0C7cNEXKZjgwFFx2n0BTJysgX+b0eMhIP0yOA2/pNiebHgQceXIqFQK1yABPyrjsLoaqSsmGe2N29ponzrVUDr0t0SxoFUHMZLfocWhnhl6MQPHRIRW5Glhzn1wjhGj28YQ4xn0UPyyOHXXIZpwW22Aw16OEDtp/0oz1ekkZOBNhTkIxP+7qdUdJYaOZSyaUQ53tO/k/KxbhvzIHDPuPcE7ozjKi03RWeFdeSWwjfqu670UcyFBxbAeUiFPNAFU72nnch8hEEoXHEeBWB4wLJLShmStA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(230922051799003)(1800799012)(186009)(451199024)(38100700002)(36756003)(31686004)(4001150100001)(2906002)(83380400001)(5660300002)(82960400001)(66574015)(26005)(86362001)(2616005)(6512007)(53546011)(6506007)(6666004)(8676002)(8936002)(31696002)(6486002)(508600001)(66946007)(66476007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tlg1WGJveDluTkpTOXlxMUM1VmhtOFVlbGtsSElub3hMSlNsYjBrdTg2cWRw?=
 =?utf-8?B?alBYLzM1cHFYY0NBWCs2UkJ3VlNqVW9meStCR0wzR3BuOTIrc2lteEpJVjlC?=
 =?utf-8?B?U3FzMjVsN3FLNzFqVFNjdnVjbXZMY2pXVWNvUHpqbVhxc29UWDAzRDB5Q2dk?=
 =?utf-8?B?NDJPUUc0RDBqQmZpZzU1RlpLTTBwV2ZQSmVzKytHME0yUkhOdUtJdW5rUGUx?=
 =?utf-8?B?aUlXdHU3TnZQKzZGMElYbVZHUm9ES2t6ZDZVNEJ0U2xzYUVLaWgvWGw4TnNQ?=
 =?utf-8?B?L2MzbVNWTU5BV1dYclhhM0k3RVlIRlJRTXFTNUtEOHFsc0pFTGZtcnJ0cWhM?=
 =?utf-8?B?akRVa09qUUV6akpiaTN3dU5iSFN3Q1g3WVM3YUh5VjRieWQwYVVWZExOQ3hH?=
 =?utf-8?B?WTk2RE1ndXYxNEF4SU5rNVc4eGtoZG4rbDJQUWd1WVVwUm45WXpZMWE1OHlo?=
 =?utf-8?B?NVBRWiszM01vSXBOUFR5c1VnSmpqK09RTDU3cTRydGpndnllNk40cDhVVEl0?=
 =?utf-8?B?UW5IZkRNdEd1dFAvd3F6c3ZtSGViL3doT29JTDdCa0s0K2thS1hGREl3L1lB?=
 =?utf-8?B?dGdabU81M3B6SjFjVHlJU1ZiNE92Y0JTQUdHNnJBTVZaQ2x5QUYzeXBpN0U2?=
 =?utf-8?B?RlQzRFUyOWR2TFFPRGpLbVpQS3I5aVFrRGMwMzQ0dlRkdFpFTUlTb1Q4NDQ1?=
 =?utf-8?B?eWs4STREbVl1QnJteE9TRnRIRUVqYXAvZEJPZ0ZqbnF3V2hmUzl2UFZUZ0c1?=
 =?utf-8?B?TVEzSXhSYUtlYXVmay80dU80cGJjTTg1YWpvL1JwL21oMEZHWlBMc3ZZN1Bj?=
 =?utf-8?B?blRJb2xLcmVmVXM0Wm5KT3cwRnA0YWlyY1NqUWZJcDhzbFpoYnNhNVRra0Rj?=
 =?utf-8?B?Y1FvQ25nS3VEMXNzektnaXp1WUZFd3hsWUxIQXcxMVpkQWdBVEpxdGZuOWVZ?=
 =?utf-8?B?MFJPWTBIMlpBOFozNS9QOWxHaUlMZXIrbWpuSFVUYXBJSUlGbHJIVGNPdGU0?=
 =?utf-8?B?QWJXWHdOWG5DMVhUcVMvSTVFbllYeHIyMnE2YWREZ1FSaE5qeVlhWXp4Tllw?=
 =?utf-8?B?RVR0UXN3UW9RK1dDLzczaE1tL3I4aEowb2Y0VUFjdjJtQ0t4MS9aaGxSTjdh?=
 =?utf-8?B?VDZiNWZicU9OeFU2N1RVVTdIRzJLc1doTjE1dWo4bGVxWUhzUUoybjVNRXdu?=
 =?utf-8?B?R1ZZdkhreTh4c3Q3STgrSWxhY3Y1MEZMQkpEMFNtb1BiVXZ6OWVJd2dYYTlv?=
 =?utf-8?B?Ylp6MTdoRUllQ3haNytsMHRLV0tYcHlNSU1rSEdRM1JaNk1tcWIvZzVMNlJa?=
 =?utf-8?B?RkQwbXl1ZXZZdkxtQXVpcXJVVmtDakI0SUJWMWJxUThLWVd5d1dPWGlPTWV2?=
 =?utf-8?B?bjF4VUhjZWlndGRITHJlR0xkYnpWT204c2FMWi81VmdlRTdQWkFabVRWZkxD?=
 =?utf-8?B?V1Q4MWM5OEVqMjZkMHVxSGFxQ0htcEkxbUg2RTEzSFBGTnFNaldMRDlUZWVC?=
 =?utf-8?B?RlVLOCsxdlVFaG5KTEc3QkpBL1Y5UjlBVlpUZnR5SzVybzFhQVl2V0s4a3Na?=
 =?utf-8?B?MUxyZXJTU3VvMjNIMDZoSnpYQUxnaE0rTy8yVGZvK1BPUnhwRUpwMEZES2ph?=
 =?utf-8?B?NlhEK2o1VlhzbUcrQzlORmZDa0pzUmRVOWpuS0htS01TaEFQSFV6dWY3ZjNE?=
 =?utf-8?B?UTBvZ054UWZoMDhORWZIRENUMDBQV2tUUUdkZkwva0RKL1FQaVBUL2ZCTmRU?=
 =?utf-8?B?eUhpZkdRampXd25iZEZ4WjhGT29Sb0tuVzFVWHA2dElJMTljdUwxOThydS8r?=
 =?utf-8?B?bVVDS01NRXFKVTQ2WUltTEloNHl4eGRrRjVSY1dWK3pRVEo1OTNhM2RCMEtU?=
 =?utf-8?B?S2RiSlFUcGE4UDlPMVhxcnRpc3hGMmQrV2NPQmt1LzA2eDg0bXBKbEJYc2xa?=
 =?utf-8?B?WGtzeDV2c2tHTWNhZ1FFWUhkSkV2NHR5YUZMRnl1ckZhUDJZNUdaN1BCQmRr?=
 =?utf-8?B?MC8xa3pZWlZlY1p0R3Q5b1JwN3dRdXVNQnNISnpDaU9CZEpFRkpMSi9lYitj?=
 =?utf-8?B?MGZYTlVMSzcvRG4vam4wZEJRelZGN3ZaNTZleXpLTG5UR05jU2cvTlI3QVRT?=
 =?utf-8?B?SElrMlVpYWp3d2F4RERiRmZBWVZJdVZKQXowY2Q1Y3FZVno2Sm95MklaQTYr?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d9ea93e-6fad-411f-e8ab-08dbeef88cdd
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 03:25:48.8660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: butca719lcQgW9I/JdG6lw21BDXBZThsTYiiWoLzz06p1zhhetNzPtz8mXOw0whwSy4y2FXni2QNjcjCIrTlD3W8pnq1/4eaywtgiLzQLJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7269
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v2 6/6] drm/xe/xe2: Handle flat ccs move for
 igfx.
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


On 24-11-2023 21:18, Thomas Hellström wrote:
> On Tue, 2023-11-21 at 15:39 +0530, Himal Prasad Ghimiray wrote:
>> - Clear flat ccs during user bo creation.
>> - copy ccs meta data between flat ccs and bo during eviction and
>> restore.
>> - Add a bool field ccs_cleared in bo, true means ccs region of bo is
>> already cleared.
>>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Himal Prasad Ghimiray
>> <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c       | 25 ++++++++-----
>>   drivers/gpu/drm/xe/xe_bo_types.h |  2 ++
>>   drivers/gpu/drm/xe/xe_migrate.c  | 62 ++++++++++++++++--------------
>> --
>>   3 files changed, 50 insertions(+), 39 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 4730ee3c1012..a40f17ae21e7 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -630,10 +630,12 @@ static int xe_bo_move(struct ttm_buffer_object
>> *ttm_bo, bool evict,
>>          bool move_lacks_source;
>>          bool tt_has_data;
>>          bool needs_clear;
>> +       bool handle_system_ccs = (!IS_DGFX(xe) &&
>> xe_bo_needs_ccs_pages(bo) &&
>> +                                 ttm && ttm_tt_is_populated(ttm)) ?
>> true : false;
>>          int ret = 0;
>> -
>> -       /* Bo creation path, moving to system or TT. No clearing
>> required. */
>> -       if (!old_mem && ttm) {
>> +       /* Bo creation path, moving to system or TT. */
>> +       if (((old_mem_type == XE_PL_SYSTEM && new_mem->mem_type ==
>> XE_PL_TT) ||
> I figure moving from SYSTEM to TT must always trigger a copy or clear
> of CCS in the handle_system_ccs case?
>
> /Thomas
AFAIU that is correct.
>
>> +            (!old_mem && ttm)) && !handle_system_ccs) {
>>                  ttm_bo_move_null(ttm_bo, new_mem);
>>                  return 0;
>>          }
>> @@ -648,14 +650,13 @@ static int xe_bo_move(struct ttm_buffer_object
>> *ttm_bo, bool evict,
>>          tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
>>                                (ttm->page_flags &
>> TTM_TT_FLAG_SWAPPED));
>>   
>> -       move_lacks_source = !mem_type_is_vram(old_mem_type) &&
>> !tt_has_data;
>> +       move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)  :
>> +                                               (!mem_type_is_vram(ol
>> d_mem_type) && !tt_has_data);
>>   
>>          needs_clear = (ttm && ttm->page_flags &
>> TTM_TT_FLAG_ZERO_ALLOC) ||
>>                  (!ttm && ttm_bo->type == ttm_bo_type_device);
>>   
>> -       if ((move_lacks_source && !needs_clear) ||
>> -           (old_mem_type == XE_PL_SYSTEM &&
>> -            new_mem->mem_type == XE_PL_TT)) {
>> +       if ((move_lacks_source && !needs_clear)) {
>>                  ttm_bo_move_null(ttm_bo, new_mem);
>>                  goto out;
>>          }
>> @@ -686,8 +687,11 @@ static int xe_bo_move(struct ttm_buffer_object
>> *ttm_bo, bool evict,
>>                          ret = timeout;
>>                          goto out;
>>                  }
>> -               ttm_bo_move_null(ttm_bo, new_mem);
>> -               goto out;
>> +
>> +               if (!handle_system_ccs) {
>> +                       ttm_bo_move_null(ttm_bo, new_mem);
>> +                       goto out;
>> +               }
>>          }
>>   
>>          if (!move_lacks_source &&
>> @@ -708,6 +712,8 @@ static int xe_bo_move(struct ttm_buffer_object
>> *ttm_bo, bool evict,
>>                  migrate = mem_type_to_migrate(xe, new_mem->mem_type);
>>          else if (mem_type_is_vram(old_mem_type))
>>                  migrate = mem_type_to_migrate(xe, old_mem_type);
>> +       else
>> +               migrate = xe->tiles[0].migrate;
>>   
>>          xe_assert(xe, migrate);
>>   
>> @@ -1229,6 +1235,7 @@ struct xe_bo *__xe_bo_create_locked(struct
>> xe_device *xe, struct xe_bo *bo,
>>                  alignment = SZ_4K >> PAGE_SHIFT;
>>          }
>>   
>> +       bo->ccs_cleared = false;
>>          bo->tile = tile;
>>          bo->size = size;
>>          bo->flags = flags;
>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
>> b/drivers/gpu/drm/xe/xe_bo_types.h
>> index 4bff60996168..508e67c81427 100644
>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>> @@ -79,6 +79,8 @@ struct xe_bo {
>>          struct llist_node freed;
>>          /** @created: Whether the bo has passed initial creation */
>>          bool created;
>> +       /** @ccs_cleared */
>> +       bool ccs_cleared;
>>   };
>>   
>>   #define intel_bo_to_drm_bo(bo) (&(bo)->ttm.base)
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>> b/drivers/gpu/drm/xe/xe_migrate.c
>> index bdcb20f23531..bac24768fe2a 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -564,14 +564,14 @@ static u64 xe_migrate_batch_base(struct
>> xe_migrate *m, bool usm)
>>   
>>   static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
>>                                 struct xe_bb *bb,
>> -                              u64 src_ofs, bool src_is_vram,
>> -                              u64 dst_ofs, bool dst_is_vram, u32
>> dst_size,
>> +                              u64 src_ofs, bool src_is_indirect,
>> +                              u64 dst_ofs, bool dst_is_indirect, u32
>> dst_size,
>>                                 u64 ccs_ofs, bool copy_ccs)
>>   {
>>          struct xe_gt *gt = m->tile->primary_gt;
>>          u32 flush_flags = 0;
>>   
>> -       if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs &&
>> dst_is_vram) {
>> +       if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs &&
>> dst_is_indirect) {
>>                  /*
>>                   * If the src is already in vram, then it should
>> already
>>                   * have been cleared by us, or has been populated by
>> the
>> @@ -580,28 +580,24 @@ static u32 xe_migrate_ccs_copy(struct
>> xe_migrate *m,
>>                   * Otherwise if the bo doesn't have any CCS metadata
>> attached,
>>                   * we still need to clear it for security reasons.
>>                   */
>> -               u64 ccs_src_ofs =  src_is_vram ? src_ofs : m-
>>> cleared_mem_ofs;
>> +               u64 ccs_src_ofs =  src_is_indirect ? src_ofs : m-
>>> cleared_mem_ofs;
>>   
>>                  emit_copy_ccs(gt, bb,
>>                                dst_ofs, true,
>> -                             ccs_src_ofs, src_is_vram, dst_size);
>> +                             ccs_src_ofs, src_is_indirect,
>> dst_size);
>>   
>>                  flush_flags = MI_FLUSH_DW_CCS;
>>          } else if (copy_ccs) {
>> -               if (!src_is_vram)
>> +               if (!src_is_indirect)
>>                          src_ofs = ccs_ofs;
>> -               else if (!dst_is_vram)
>> +               else if (!dst_is_indirect)
>>                          dst_ofs = ccs_ofs;
>>   
>> -               /*
>> -                * At the moment, we don't support copying CCS
>> metadata from
>> -                * system to system.
>> -                */
>> -               xe_gt_assert(gt, src_is_vram || dst_is_vram);
>> +               xe_gt_assert(gt, src_is_indirect || dst_is_indirect);
>>   
>> -               emit_copy_ccs(gt, bb, dst_ofs, dst_is_vram, src_ofs,
>> -                             src_is_vram, dst_size);
>> -               if (dst_is_vram)
>> +               emit_copy_ccs(gt, bb, dst_ofs, dst_is_indirect,
>> src_ofs,
>> +                             src_is_indirect, dst_size);
>> +               if (dst_is_indirect)
>>                          flush_flags = MI_FLUSH_DW_CCS;
>>          }
>>   
>> @@ -642,6 +638,8 @@ struct dma_fence *xe_migrate_copy(struct
>> xe_migrate *m,
>>          u64 src_L0, dst_L0;
>>          int pass = 0;
>>          int err;
>> +       bool src_is_pltt = src->mem_type == XE_PL_TT;
>> +       bool dst_is_pltt = dst->mem_type == XE_PL_TT;
>>          bool src_is_vram = mem_type_is_vram(src->mem_type);
>>          bool dst_is_vram = mem_type_is_vram(dst->mem_type);
>>          bool copy_ccs = xe_device_has_flat_ccs(xe) &&
>> @@ -682,9 +680,7 @@ struct dma_fence *xe_migrate_copy(struct
>> xe_migrate *m,
>>                  src_L0 = xe_migrate_res_sizes(&src_it);
>>                  dst_L0 = xe_migrate_res_sizes(&dst_it);
>>   
>> -               drm_dbg(&xe->drm, "Pass %u, sizes: %llu & %llu\n",
>> -                       pass++, src_L0, dst_L0);
>> -
>> +               drm_dbg(&xe->drm, "Pass %u, sizes: %llu & %llu\n",
>> pass++, src_L0, dst_L0);
>>                  src_L0 = min(src_L0, dst_L0);
>>   
>>                  batch_size += pte_update_size(m, src_is_vram, src,
>> &src_it, &src_L0,
>> @@ -704,8 +700,8 @@ struct dma_fence *xe_migrate_copy(struct
>> xe_migrate *m,
>>                  }
>>   
>>                  /* Add copy commands size here */
>> -               batch_size += EMIT_COPY_DW +
>> -                       (xe_device_has_flat_ccs(xe) ?
>> EMIT_COPY_CCS_DW : 0);
>> +               batch_size += ((!src_is_vram && !dst_is_vram) ? 0 :
>> EMIT_COPY_DW) +
>> +                       ((xe_device_has_flat_ccs(xe) ?
>> EMIT_COPY_CCS_DW : 0));
>>   
>>                  bb = xe_bb_new(gt, batch_size, usm);
>>                  if (IS_ERR(bb)) {
>> @@ -731,10 +727,13 @@ struct dma_fence *xe_migrate_copy(struct
>> xe_migrate *m,
>>                  bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>>                  update_idx = bb->len;
>>   
>> -               emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, src_L0,
>> -                         XE_PAGE_SIZE);
>> -               flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
>> src_is_vram,
>> -                                                 dst_L0_ofs,
>> dst_is_vram,
>> +               if (src_is_vram || dst_is_vram)
>> +                       emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs,
>> src_L0, XE_PAGE_SIZE);
>> +
>> +               flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
>> +                                                 IS_DGFX(xe) ?
>> src_is_vram : src_is_pltt,
>> +                                                 dst_L0_ofs,
>> +                                                 IS_DGFX(xe) ?
>> dst_is_vram : dst_is_pltt,
>>                                                    src_L0, ccs_ofs,
>> copy_ccs);
>>   
>>                  mutex_lock(&m->job_mutex);
>> @@ -907,6 +906,7 @@ struct dma_fence *xe_migrate_clear(struct
>> xe_migrate *m,
>>          bool clear_vram = mem_type_is_vram(dst->mem_type);
>>          struct xe_gt *gt = m->tile->primary_gt;
>>          struct xe_device *xe = gt_to_xe(gt);
>> +       bool clear_system_ccs = (xe_bo_needs_ccs_pages(bo) &&
>> !IS_DGFX(xe)) ? true : false;
>>          struct dma_fence *fence = NULL;
>>          u64 size = bo->size;
>>          struct xe_res_cursor src_it;
>> @@ -936,9 +936,9 @@ struct dma_fence *xe_migrate_clear(struct
>> xe_migrate *m,
>>                  batch_size = 2 +
>>                          pte_update_size(m, clear_vram, src, &src_it,
>>                                          &clear_L0, &clear_L0_ofs,
>> &clear_L0_pt,
>> -                                       emit_clear_cmd_len(gt), 0,
>> +                                       clear_system_ccs ? 0 :
>> emit_clear_cmd_len(gt), 0,
>>                                          NUM_PT_PER_BLIT);
>> -               if (xe_device_has_flat_ccs(xe) && clear_vram)
>> +               if (xe_bo_needs_ccs_pages(bo))
>>                          batch_size += EMIT_COPY_CCS_DW;
>>   
>>                  /* Clear commands */
>> @@ -953,7 +953,6 @@ struct dma_fence *xe_migrate_clear(struct
>> xe_migrate *m,
>>                  }
>>   
>>                  size -= clear_L0;
>> -
>>                  /* Preemption is enabled again by the ring ops. */
>>                  if (!clear_vram) {
>>                          emit_pte(m, bb, clear_L0_pt, clear_vram,
>> &src_it, clear_L0,
>> @@ -964,10 +963,10 @@ struct dma_fence *xe_migrate_clear(struct
>> xe_migrate *m,
>>                  bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>>                  update_idx = bb->len;
>>   
>> -               emit_clear(gt, bb, clear_L0_ofs, clear_L0,
>> XE_PAGE_SIZE,
>> -                          clear_vram);
>> +               if (!clear_system_ccs)
>> +                       emit_clear(gt, bb, clear_L0_ofs, clear_L0,
>> XE_PAGE_SIZE, clear_vram);
>>   
>> -               if (xe_device_has_flat_ccs(xe) && clear_vram) {
>> +               if (xe_bo_needs_ccs_pages(bo)) {
>>                          emit_copy_ccs(gt, bb, clear_L0_ofs, true,
>>                                        m->cleared_mem_ofs, false,
>> clear_L0);
>>                          flush_flags = MI_FLUSH_DW_CCS;
>> @@ -1024,6 +1023,9 @@ struct dma_fence *xe_migrate_clear(struct
>> xe_migrate *m,
>>                  return ERR_PTR(err);
>>          }
>>   
>> +       if (clear_system_ccs)
>> +               bo->ccs_cleared = true;
>> +
>>          return fence;
>>   }
>>   
