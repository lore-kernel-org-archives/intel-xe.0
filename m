Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE96C64EAE
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 20:54:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBC010E090;
	Thu, 17 Aug 2023 20:54:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B4B10E090
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 20:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692305660; x=1723841660;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NnE52w3bESGbodJaq/q1hR7NBDnJNi4fanphcdkWsxE=;
 b=KqTjEOGp/cksMrAqDowMcpYLf52Lf3isosWMrQLNnkl2G5WSpR2DTDOh
 A3pGinwGCkDuEdK990QSZE4Gvx+pUgb+vNVeJiK5iBZF1uEmISTsi9kAO
 F46jzbpJDNw+6CbWd84ydSp/RYc8C37EMfbjsamPZphBzpx9e5pBhsQuC
 s7/M+jN9JnmnBvlaSl6G8Gf7qeT0aK3haOb+RwjgXRlzAqnQye9ks7HO+
 iuQo6sHaN9TCBxeMiL8ULFg3yyjL+5b+YkOr7Ls7bYyHQeYDV99NGB17a
 Lcd+sIRHV69WM2DDY4AJ+yaOXVysxJGnueTsnYfYHPi/ukToD/oPfwkBb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="357896178"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="357896178"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 13:54:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="824798890"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="824798890"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Aug 2023 13:54:00 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 13:54:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 13:54:00 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 13:53:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYckkxtGebERLhxWi6Trb2C9+WKTYFwOB6uXcvGj+VQNHoujCdF0NX3CvwM0hKcXb9A6J6k7ennyupFV6IZ96rj3cMOIAszEjH2woTvmdK6AuZ+Tfl9h4ACC0fmhwVKx+lGKm0Rc61thsh1G86o7Q5zOKGuKCJIUJxy4MdQ7BQ4Lyl3IFmncMqMTiJWDLM167RleE9OhI0UAyX4VWXaJF+ZlcnClk9GR10Q8XjlaXBVsY+8hGafV/ijYT5uB+zxAgI+OkgQ0SMz4PYaMyYGzpDgrVSm0lMX13wnlCzLSYgnPaHwRJIm43jAf6JJcJZYYNuAyAcbExttS0Dxkgu/FxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4cJ1e0pySHXth69QioZ8L48LrwD/NlEyeXHP3RwjFE=;
 b=VGpHyw1RloFJF+wjKLndWfD1RZHMIz1eCioDu5EZ2l0h64oUzTEmD1RREYtge4xkU+VjHl1EPWzSRNF7qnljq7UCMlovENq3g7PFa8Pwjf9MZUIDTnRUzaZANmI0rT5aiy68hcJxVsq70S2X+fG82nZxLUgh5GYVW8TuTKmtnyccGuciQgbLrBTpRDjnZhu+uDgiIAT/TatS5OkyoSXXt1BjeE/WFlJal6bAhJTZt9KgOWW22geON4YLNg5GPzuUpMIQRavJQBEiUvbAmgH3rJr+gtFu3Cn9jsi5N7Lnq/7rFFjR77XNO4LSglBSLu+M5WnXZ60MPWjPPZflZ8D3tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9)
 by SJ0PR11MB5893.namprd11.prod.outlook.com (2603:10b6:a03:429::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 20:53:58 +0000
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::a014:919b:81d9:3e2f]) by SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::a014:919b:81d9:3e2f%7]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 20:53:57 +0000
Message-ID: <0bcf7453-c6cf-3bb8-052e-667438fcd7fe@intel.com>
Date: Thu, 17 Aug 2023 13:53:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20230817201831.1583172-1-daniele.ceraolospurio@intel.com>
 <20230817201831.1583172-8-daniele.ceraolospurio@intel.com>
 <20230817204442.GF3375865@mdroper-desk1.amr.corp.intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230817204442.GF3375865@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0088.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::29) To SJ2PR11MB7617.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7617:EE_|SJ0PR11MB5893:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b6495a-0df8-4228-82de-08db9f64136a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gnY4/UGVq8rpY8yBrF4VcpcwzK4wMPSbP/BZOzj6U/DTl3tlDdVD2oQUNSnHhOJRBr2wta1DUSgOM+5WkqRc2T+xb4JHmBHkiJ3xFzIzawyIGTsiCQoLl4Xr/vS18ZHug5fEjJThmL+MJ03yRZ70UUn8auBf/eiMJop3OSncy4T3OsO7HXy1kijIXlkYDZPHN1BFW+sq3wKdVwgHRemhYPlP2/81gvrCXh7OpiC+pIFDTMS+phob0ph+frWOfaG6GDQcy39c2P6y+snlfwFetnUfKclTqR4mI7GwfF+lpT7mKUZaA2OfqJjpXAI4L727/r6d7IBAoaYtN6555CCuYQjMgOIAFxx89HbFGrGVthOy2DFxaTAIBDZd0qU5ecu8wlBsKezojV1G9bt2MOgB7FYOs6UF2CSFEc0fI1t10mWF6dCFJ5FzYa6aj7crj21Aqtc3n1djKUipQsujTI12+5EBhWBBhKY/0DHWe4SBPRqHCoMcIh8lmXZFtmGn+furP74oNoQex6A2X2t7HTSfrbXotAWkB0VyDEUISegAwfZfkFeuUlJHy9s8F6NG0v4zM5UDGiFD7ORltxBVX8pj5OSlbt7LTyZdoLbKOVdzL+0e/tDPArt9plyU0WkWLR+5lRiN6lRuACt/hbBCkW9+uQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7617.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(396003)(39860400002)(136003)(451199024)(186009)(1800799009)(36756003)(86362001)(31696002)(31686004)(83380400001)(8936002)(5660300002)(6862004)(8676002)(4326008)(2906002)(41300700001)(26005)(6506007)(53546011)(2616005)(6512007)(6486002)(478600001)(82960400001)(66476007)(38100700002)(316002)(6636002)(37006003)(66946007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WW9lK1lyTXByOUUrZWc4dGZqdHZZR01qc0dDcFUrbnhER3B0V1FCZVhZcGI0?=
 =?utf-8?B?NXZuVUdOVXN2bTlDTVlDYjlhZ1VlSGQxMWJzcmJBbVYyUjVwWkMvaklCa3g2?=
 =?utf-8?B?L0tYeWFxNXF2YUlIcy9qcGVCY0JxcjVpejJBQitkeURYbmtkS2VWNktYeFJ4?=
 =?utf-8?B?QlJpT1BuNXBjQXNiOU4xdTBqZHgvUjgwdjBMQWhndWI4T3RhSDViNWF1cWpq?=
 =?utf-8?B?TW5SSGw1N1ByVVVYVGN3dTVMUXkwbzRiaUZzL3hKdHRmZXJ2SmljamNmbzBu?=
 =?utf-8?B?alpYWm5lZ1dveDlHQ2NJcWtVa2NieVZYYWFiSFBmV1dmOW1BNGVUTkxlUVZV?=
 =?utf-8?B?RHNJM3FMTWJzYjQzczViMEFjRkVGcWxKeVJEdjMrWDAwUS9UY1lBczdTMm50?=
 =?utf-8?B?RXR2dm5HWnhaVVd5aVlaYmdpdFZ6UFd1T3ozeUxiMENZbkpKWGdNZEl4TDNL?=
 =?utf-8?B?bHZWQXlEL2VYSmI3aTVHditFK0ZrTWNZTlduK2RDczhJakFhcm5YWmE3b1c0?=
 =?utf-8?B?UGRrSzlON294K1FIYkRFaXg0U0pzUUE5RUlnWFZTd21qbDRPNGxMK1pUZUpF?=
 =?utf-8?B?cytMUm1LL1VhajM1Yll4dDU4dnBhcFNNM3NBajFyWElZbjI0T200Y2oxWExB?=
 =?utf-8?B?dDhVUG5ZeGNaRkZIc21vWWUzU2JyTUZldktJbFRqWDNuaFNOWkhyY1cvSXIy?=
 =?utf-8?B?MlFrdjZpVTRuNS9pUi82aksvcjRSNFAwYjgyalhhTnRnSGkrd1dRb3F0MWdw?=
 =?utf-8?B?RnhLZzNzOUg1WTdlK1paalFNSVZrZGRPRDhVbHpJTEhtL3ZnREJySHpIRGhq?=
 =?utf-8?B?UUpDb0I5cU9acy9IOUZKK0pjWGRPNXZqZVFaQVF1MGIvaWcrMWpXajZ0aXdV?=
 =?utf-8?B?aXZXcG1icEd6V1lqRWVwUnI1b1V0cTQwU3FnN2l5RGpMSGlOYzhIREYvUjdw?=
 =?utf-8?B?SWNaZmUxM1BKUHRka0ZTdFEwblVsVCtsa0R6SlFFekc3UC94c0lOcDZHWXlY?=
 =?utf-8?B?VDhLd25jTGcxenorSDBDL3ZxeEVjeVFSeUJoZ2ZCN2JqSDBaQVZJTlpnK2RT?=
 =?utf-8?B?QlpEN0srUG1PRXhQTCs3M0tEa3BpU2pXN0ZpYUpJTFRzTEw2Zk5MbkIzUnFy?=
 =?utf-8?B?dm56ZnI0VDlyTEpIMCt2ODdyc1VPaXMvd1d5bjI0Z2JXcEN5TmtDaDZJNkxh?=
 =?utf-8?B?RTI0ZjU0clI5UHZQZzhIK0RCWHhCSVNNa25UMmRBVVFMcGhhUmhWdnhZcy9u?=
 =?utf-8?B?UkNhQlpkZ2syZ09TbWdWcXY4OHkyOVZOZUJHYXV3WFlndFFsQUQza2tSMHFY?=
 =?utf-8?B?N0hpQUJsT3I4eGUrcFA0YkJRYlVMTGRBZDZkUmk2TFRTSWswV2FaQTZIbGlY?=
 =?utf-8?B?YTFSQlFub3JDYURZL0lHT2VMbS9yS2UzM3Q2VGJPTGw3YS9EbEVTUFFkc1hj?=
 =?utf-8?B?RkZ0emxkTm42cVFWWGhPeGlsRlU5NHNZdS96MnVpRnErTlFXRStVa2ZKTFFn?=
 =?utf-8?B?ZG9DYjBQNlBQdzZ2SFc3ZHI3V3FpU3JlNmVXVi90OGhXWEV5VHh4bUlxSjRH?=
 =?utf-8?B?TlpYZzNsTmFYSFNPM2dHWTQwYXBzK3R2N1doNW85SEptMFQvUFNSbFNma2Zr?=
 =?utf-8?B?Z3Z0RXVUQVhIVVhsaHdvMysvYWtwT2dXcHI3NUpCbkwwY2VqR3RnMm96dHdk?=
 =?utf-8?B?UlZNMFZZc0NqcWZiUXd3Z051TWdTUXBUd2huajBKaHpBOWRFK3dsbExpNTMy?=
 =?utf-8?B?amJDdERycEJCR2NxelkwSzNrOGFWR2E4Wi94TEhxaEI5d01xQ1pPdTFteHdr?=
 =?utf-8?B?RXhRaDdkNzhFcGowajM4bDRPZ2VkMW1mV3FOT0F6QXhrOWY5SUpRSUVGbE1T?=
 =?utf-8?B?ZmVvRzloaEo2NlY1ZWZMamx2dnJnME9hWE5vNVBXZFF4bGVQVFZBbG85SU5u?=
 =?utf-8?B?UXZVL1phSlNJT1BBZnZmSXlna3NrU1krUngzeHV2alJvL2JFYml3cTVCaEg4?=
 =?utf-8?B?RHN0aUlRV0V3eDNObytVZUVtZGNHUnRtSTFRRHM1NzNVcEttWWZNY2hQaFUw?=
 =?utf-8?B?S3B4YXkwcXR2bExTaTMrSHRDTUZKMDZraml4VkZZOGZqUXJVYjJFZDlxamJQ?=
 =?utf-8?B?bFV0L0phUFN3MjVxcU1TQm15VitwcGtxdVdtMGJBMXRQZHk2S012cUNGWGRp?=
 =?utf-8?Q?ODpj+7uUNBjDKN7S7bV8qAo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b6495a-0df8-4228-82de-08db9f64136a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7617.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 20:53:57.8349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XE7DWBzYn3w6Sp6WdrKOPV+HUaC9xBdpaEx603GtLJQJrhevHzysgFrWKse63sqD2toK4lR2NLUwY/TcAUcqAUi66L6bh2GLRbt2eO6q2BY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5893
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 7/7] drm/xe: enable idle msg and set
 hysteresis for GSCCS
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



On 8/17/2023 1:44 PM, Matt Roper wrote:
> On Thu, Aug 17, 2023 at 01:18:31PM -0700, Daniele Ceraolo Spurio wrote:
>> On MTL (and only on MTL) the GSCCS defaults with idle messaging
>> disabled. This means that, once awoken, the GSCCS will never signal its
>> idleness to the GT. To allow the GT to enter the proper low-power state,
>> we need therefore to turn idle messaging on. As part of this, we also
>> need to set a proper hysteresis value for the engine.
>>
>> Bspec: 71496
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_engine_regs.h |  4 ++++
>>   drivers/gpu/drm/xe/xe_hw_engine.c        | 17 +++++++++++++++++
>>   2 files changed, 21 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> index 79873bf64e8d..f012a66cb3da 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> @@ -22,9 +22,13 @@
>>   #define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
>>   
>>   #define RING_PSMI_CTL(base)			XE_REG((base) + 0x50, XE_REG_OPTION_MASKED)
>> +#define   IDLE_MSG_DISABLE			REG_BIT(0)
>>   #define   RC_SEMA_IDLE_MSG_DISABLE		REG_BIT(12)
>>   #define   WAIT_FOR_EVENT_POWER_DOWN_DISABLE	REG_BIT(7)
> Nipick:  might be best to put the new bit at the bottom since these
> usually descend.

ok

>
>>   
>> +#define RING_PWRCTX_MAXCNT(base)		XE_REG((base) + 0x54)
>> +#define   IDLE_WAIT_TIME			REG_GENMASK(19, 0)
>> +
>>   #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
>>   #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
>>   #define RING_IPEIR(base)			XE_REG((base) + 0x64)
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index 81281e9c02eb..cd0ac3ce5abf 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -339,6 +339,23 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>>   					   ring_cmd_cctl_val,
>>   					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>>   		},
>> +		/*
>> +		 * To allow the GSC engine to go idle on MTL we need to enable
>> +		 * idle messaging and set the hysteresis value (we use 0xA=5us
>> +		 * as recommended in spec). On platform after MTL this is
>> +		 * enabled by default.
>> +		 */
>> +		{ XE_RTP_NAME("MTL GSCCS IDLE MSG enable"),
>> +		  XE_RTP_RULES(PLATFORM(METEORLAKE), ENGINE_CLASS(OTHER)),
> Although this change wont' be inherited by Xe2 IP and beyond, there's
> always the possibility that this Xe_LPM+ IP might get re-used in another
> non-MTL platform (e.g., some kind of refresh platform down the road).
> So it might be best to still use an IP version check here to cover that
> case.  I.e.,
>
>          MEDIA_VERSION(1300)

ok

>> +		  XE_RTP_ACTIONS(FIELD_SET(RING_PSMI_CTL(0),
>> +					   IDLE_MSG_DISABLE,
>> +					   0,
> Rather than FIELD_SET to 0, I think it would be more intuitive to do
>
>          CLR(RING_PSMI_CTL(0), IDLE_MSG_DISABLE)

I missed that we had a CLR macro. I agree this is cleaner, will send v2 
after CI confirms that nothing is broken.

Daniele

>
> here.
>
>
> Matt
>
>> +					   XE_RTP_ACTION_FLAG(ENGINE_BASE)),
>> +				 FIELD_SET(RING_PWRCTX_MAXCNT(0),
>> +					   IDLE_WAIT_TIME,
>> +					   0xA,
>> +					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>> +		},
>>   		{}
>>   	};
>>   
>> -- 
>> 2.41.0
>>
>>

