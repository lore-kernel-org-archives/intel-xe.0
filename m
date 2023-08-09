Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD3CC001DE
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 20:18:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA7410E10A;
	Wed,  9 Aug 2023 20:18:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE5010E10A
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 20:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691612308; x=1723148308;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=paP2m2hD6XAsv3N25tZOLQzcEBT7H/xQAV2HCmXlqT4=;
 b=R2uD2Qn2kak5Ir76fA70n0btCXjKwXcqAKC1xVfEdJ05UIzo4wJMdq3H
 fUNeHxucKmyTVxh1yUW+8ewHj8rgEY3syHO05/tSdcHNckZaVvP0KIUmg
 Jt/EqGtKGD8gqSuTdz1a5rBVS1e6w5wGfshRSqD7hVKGO7Uux12YeZUxH
 AiSlrI3VZDVKCgydAaD1xfwvmfQ3R3Fp0jv0yw8citr5A7Aut2FeFghnp
 8nIzLleJcEo5BD6FbzZ/IylASY2CEmGk1D2hxl4tWJQnGxLNLEHkoBv4y
 nlv5vh+VlaEOWgNTWDyUl8d156f6TVgjlDmkOBXfuOtdS6fPb3n4yJrYp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="435114243"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="435114243"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 13:18:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="821975018"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="821975018"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 09 Aug 2023 13:18:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 13:18:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 13:18:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 9 Aug 2023 13:18:27 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 9 Aug 2023 13:18:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbndSqg7RXy3LtfDrSFRKoIK7HRommBdF4XNnjNm7IjIzEIO+2xwKFE0GwPZ0KCbqE7KyGXbUzrok9VrWUWvBapR7I9rS2JXA3b9dFoqReEKWJsk/u2w0HV0lOGbnGkosrRoTIyHEsmOJsE+FROEQp3/dK6MidBecW77jbzAzzb0cLStT0acZbfjSACaq0uEmUnYNX2qX70D64TsI7/8B7rY8TC2YgrMobasxvVK/66UfZQMqMC35vnoQGxN6cEBEqpuRqt8AXrLb9WywO0xV2UpUwiZ3GW9tk1DOLWjzAKE6oIbR3Rz7ivyTbP65ueRUbKn9djG02F1D1UPo6D84w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IefgJNxvLe+NeZ9oiwZMqTpkIRc7bbz7ul+XTu0WFY8=;
 b=M1Tw6cVRlyGNd1i8eE/5u6dzXPTEOqbOQH5NQAvmT+Uw6OXXYLPk8KodeZg31tJE79LTLFrINlpW2piCDkBEFC7wrdPEZ2DXss3lNJ7hYhcauWfDTaiWt6dMeEj7Hm9uXvNjZxmcUreHJrb2NvGxzlUl+zQhpMHioWB5AQYt31A96KskLSXHFFVNf2M2WmIsA8C1nubBmBYuHi/3jwDXN9HNMk3QWLQXn/lAt8+NrYHVHYSZ20iops2mbsDnugU791MND547v0KkdK3WEVBAK6Q22zS2kZSqS/qF1j352ei8R7xX/2V4RWzQ4yLkOXglxzH7QQyzQV1svihA+2L9zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 20:18:23 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::439e:63f:b4f:f27e]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::439e:63f:b4f:f27e%4]) with mapi id 15.20.6652.026; Wed, 9 Aug 2023
 20:18:23 +0000
Date: Wed, 9 Aug 2023 13:18:21 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZNP0jZoSicE+5pAK@orsosgc001.jf.intel.com>
References: <20230804213253.2381705-1-umesh.nerlige.ramappa@intel.com>
 <20230804213253.2381705-4-umesh.nerlige.ramappa@intel.com>
 <227c8bd8f1545354861a8a91a17ad29a730fcc48.camel@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <227c8bd8f1545354861a8a91a17ad29a730fcc48.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:303:8e::16) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|MW4PR11MB6714:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d5daeb2-302d-4963-8bc3-08db9915c83f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9SfG0Yp9d0qagDTS1DLJc1uVe3s5dwnJP/BKPfwMIbwicguIVByK4Q3FMtx0C5/TJ7/pMGU3TBeCluAAT8DCXZbQGjTlh7Y7TM/s93IMT6NodJatOEJS6ivp3yFdq21g+hbZvAttV1qP5Hdbk83CGBE41xI59t2xwSqAUC+wvH15ccA/QrTipZw1ly+/Nd2nA7G+evElawO8v/nzLTeHgH9RtKaLE7tVETUmjB4lHND6xbIlllTN3M3rfP54yW2V9PrtSsERHzSFMZYZ8gSqcOgdc1PEM6/f7t2kAfvFtv900LH61Qrlb/tkhThqHMi0W+zmaGap8+dxHuEw4Rimn6x4dJKTr04f0Hr6skzEwOqnfEluIjwak6XtZXOzQmvKr4IN2ACklaCeUAnJZssw8U0IguKLAxCYN6VH78eJFFhNp4WEIFAvog5fYzsLDl/YoDLINFjS68kNK5wgC8oyDRAZrNPHIXgiMhKk1BVO4ER7QL7PXSApusvU30fhWkjA7ba3e38IQiA+TRN+gvNu5iCLG2MwokOKqCo7TNldHALVsWrHXOoj6sHDYtQ3/EQ/yzJQzgEZw2ZZjOD8NqEuiMPS89/d8FcQzvu9sbr1VxfkWEbE7Uv53KychxBMlIhi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(39860400002)(396003)(136003)(366004)(1800799006)(451199021)(186006)(966005)(6512007)(6506007)(26005)(54906003)(38100700002)(5660300002)(86362001)(30864003)(2906002)(66476007)(4326008)(6636002)(66556008)(66946007)(316002)(6862004)(8936002)(8676002)(41300700001)(6486002)(478600001)(82960400001)(83380400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzUwc1VkLzQxRVF5TGhqZkJUL2NBcDRZRUl3ZjV3cllXZHRkd3h5NHpTT05p?=
 =?utf-8?B?YlRBUThRSnJORml1K3Ewc05XVGtCeWdnOUF4bEJJczQ5MmMyN3ZGYlI2S2Zs?=
 =?utf-8?B?VkVuV01pSnBVTHBCdkNYSjZtcHBNRmRUQnBFR1NhL1krd1A0L2hZUWVZY0V5?=
 =?utf-8?B?T1hXY0xNY0VGLy84N2ZLakk5dk8rREFrdWR5Y2Zxa0VHeDNrWUFIcDNCUytT?=
 =?utf-8?B?QlFsS2VwZzByLzV6Q3dLV1ptcEZiZzlGMm9rVzN0aXQ4eDlKdGYrY2d1NDZp?=
 =?utf-8?B?UUpUVHhrSm8xT0dNOXRFTDdmOFpmSG1zZ3lHYVhtUzZQeDNPTWQ0SVhkQ2ky?=
 =?utf-8?B?WTlqRlN1ZHRYVkxDQkd1THd2TXhBVFUrQjFuOFVEcFRvNlB3a0xJYVp2eGNh?=
 =?utf-8?B?UTRtbFVISFlFWTVReGpOUjRjbTBoR1BSdE5NTzhhT21qdlZrVS8yV1JHTmlB?=
 =?utf-8?B?T2htUkNDK3cvN20rTC96Uit4b3A1bzZ6akJiNzByQUhRSTVRYlQyZitMRkRC?=
 =?utf-8?B?azA4WExhaWpKR0J3a2NyVHcyT1hNWjZ6TmI1SGpXanIwTUNFNlMxcTd6d1M2?=
 =?utf-8?B?R29oN3pLR1NUKyswTlQ3ZzQ0U1hjUllRd2tVU25GNVlFK0twU0thVWJuWDdJ?=
 =?utf-8?B?MTdHSDFsMm1XM2p5YjVQVUJtWlBrZGc1QW1vSTNzZjAvOHJrMGRUVWFlbWtw?=
 =?utf-8?B?L2R4REpVcVE3d1VRWUd0RXYrajE2YlBWV1FaWE1wNHg5dExzNGRtZGtvUkp2?=
 =?utf-8?B?b2RaK3BVcFI1M3IwTEVObzcyYVZER3ZlbjBmbEVkaGNacHJSS0d0d3huV0dD?=
 =?utf-8?B?ekl6RC9tT2cvSzA1ZFFSckdSUXFWT0xkNGd4YVM1aHUxWlBhNTZYSUd2aDdq?=
 =?utf-8?B?WWJ4aHgrcU4vY3NXb0JaUnE0S1htZ1I0bkxaL085c0NDVFRKdTcrZmZNVy9X?=
 =?utf-8?B?MWdlY2x3UUZKVmFDU3dtVEQ3R2RWSjBtcmtITWIwaW5vVThSY29zaEdqeG54?=
 =?utf-8?B?bFhTOG90bmY5ZmZveFlxMkxEOHd0YkR3d0JoSklRSjZVdkJLMDBMTVJVTkN4?=
 =?utf-8?B?N011cktCeHFweTJRc2VYc2hDaHJFRzQwR1liVDYrSWhXNm45ekhUTzYrNW40?=
 =?utf-8?B?MFJ6S3hNMWR3VG0vOWFRbEFNZGVzZGxpQ3lxTDNPQ3RZdGVWWFUrd0JnUllq?=
 =?utf-8?B?TjhpeXVERVQ4TEN1VVZoU292NTZ0T2xjNHVtVENnVyttWVNMRGZmOFlFVkRQ?=
 =?utf-8?B?SkoweWlLYlFKTG1mdnF0SWNkN3AvakdmeGVUQ2lSTDV1eEZMN2pMOG43ZVhi?=
 =?utf-8?B?OFVRRTY4Zld3VkxQeFRabUZyb292ZlAyWW9uT2ZpVTJ3VC9pUFV6Q2tRaEpM?=
 =?utf-8?B?aXNURzVHZHRjWmFGQmNjYnRQTW5Ea0dKa1QxUEtGTU03TjdGTkMzN1Zvb0pv?=
 =?utf-8?B?OGJRQmxSNlhGN0hpdTNOMEJXQmxqcEhFcnViQ0R2S0MzeXNucHM1WVAyazZS?=
 =?utf-8?B?YzcrT0NVdlNmQVZjYS81cDlSVW5UejQyeVhENThBQzVkMUR6aVAzWDRVYi9w?=
 =?utf-8?B?aDErOVBoVEFDcklQTWlwVFpWaW9hMC9JV0VLV3F4c0IzTGcxeXBvTERGVnRR?=
 =?utf-8?B?YnJjTjh3emk0MUdrN3pQZ2FDcmlvYzFHbjV1bkNQb3VoTTVlYTc5U0x3R3VH?=
 =?utf-8?B?M1p0YWZ2WmV5c3FDZUNKVG11V0twVHhlaHIzMVpuMW01ZVR1MUZESU13aXFh?=
 =?utf-8?B?RW1PTmJST1JiYVVlTWpYbEVudkx6eUVEdWNVVGV5ek9SWXZNM1QrWDZpVkcv?=
 =?utf-8?B?YmNDdkh6bWQ4VWxkVXcxMXgrcTBWTlpJOWppbHVmb0VBNG1QejJPRUJISXNI?=
 =?utf-8?B?ektlUXR6UGlad0F4eDJhUG1JQTFLT0Mzd1FyaVczMWp1eXFMaFZPdStvL1lL?=
 =?utf-8?B?azJxbTc4NnlPUTYxWVRTVzlITENZTURiazc1bVhNSlhBUzM4bFFFZTdYaUhW?=
 =?utf-8?B?QWZqcDRTMkkycXhDVUVEQnNNOTllYndwekJVOUNJRWlISGVGYWJGVml2Q3dJ?=
 =?utf-8?B?MXkwRUV5UEl2VUZYa2xGNXBXNDh5YzVQR0ZFUWhQRGxIZUxkSDl1VDY4UG01?=
 =?utf-8?B?eFkyNVowRS9RUjllbTJJOHN2a2NVT2RrNUxndDRNcjBqNElLN3FEVGRSVnpV?=
 =?utf-8?Q?G9oBs0w8DNqcHDl5Ub5M8Ak=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5daeb2-302d-4963-8bc3-08db9915c83f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 20:18:23.7454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LafNP4EMXBkTVU+xfgB78cKdu8rloAiDJXLbzESpnlNzs3k0ksd7KR8ldo8j5/4j916lr/xGSJKN+bTB/8A9DI0jv1OxpcJAi/k71o7MOkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6714
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Correlate engine and cpu
 timestamps with better accuracy
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
Cc: "lionel.g.landwerlin@linux.intel.com"
 <lionel.g.landwerlin@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Aug 09, 2023 at 12:55:37PM -0700, Souza, Jose wrote:
>On Fri, 2023-08-04 at 14:32 -0700, Umesh Nerlige Ramappa wrote:
>> Perf measurements rely on CPU and engine timestamps to correlate
>> events of interest across these time domains. Current mechanisms get
>> these timestamps separately and the calculated delta between these
>> timestamps lack enough accuracy.
>>
>> To improve the accuracy of these time measurements to within a few us,
>> add a query that returns the engine and cpu timestamps captured as
>> close to each other as possible.
>>
>> Prior work: https://patchwork.freedesktop.org/series/87552/
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_query.c | 141 ++++++++++++++++++++++++++++++++++
>>  include/uapi/drm/xe_drm.h     |  95 ++++++++++++++++++-----
>>  2 files changed, 218 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>> index 99a4800c7c53..ae1e810267a7 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -6,10 +6,12 @@
>>  #include "xe_query.h"
>>
>>  #include <linux/nospec.h>
>> +#include <linux/sched/clock.h>
>>
>>  #include <drm/ttm/ttm_placement.h>
>>  #include <drm/xe_drm.h>
>>
>> +#include "regs/xe_engine_regs.h"
>>  #include "xe_bo.h"
>>  #include "xe_device.h"
>>  #include "xe_exec_queue.h"
>> @@ -17,6 +19,7 @@
>>  #include "xe_gt.h"
>>  #include "xe_guc_hwconfig.h"
>>  #include "xe_macros.h"
>> +#include "xe_mmio.h"
>>  #include "xe_ttm_vram_mgr.h"
>>
>>  static const u16 xe_to_user_engine_class[] = {
>> @@ -27,6 +30,14 @@ static const u16 xe_to_user_engine_class[] = {
>>  	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
>>  };
>>
>> +static const enum xe_engine_class user_to_xe_engine_class[] = {
>> +	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
>> +	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
>> +	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
>> +	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
>> +	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
>> +};
>> +
>>  static size_t calc_hw_engine_info_size(struct xe_device *xe)
>>  {
>>  	struct xe_hw_engine *hwe;
>> @@ -45,6 +56,135 @@ static size_t calc_hw_engine_info_size(struct xe_device *xe)
>>  	return i * sizeof(struct drm_xe_engine_class_instance);
>>  }
>>
>> +typedef u64 (*__ktime_func_t)(void);
>> +static __ktime_func_t __clock_id_to_func(clockid_t clk_id)
>> +{
>> +	/*
>> +	 * Use logic same as the perf subsystem to allow user to select the
>> +	 * reference clock id to be used for timestamps.
>> +	 */
>> +	switch (clk_id) {
>> +	case CLOCK_MONOTONIC:
>> +		return &ktime_get_ns;
>> +	case CLOCK_MONOTONIC_RAW:
>> +		return &ktime_get_raw_ns;
>> +	case CLOCK_REALTIME:
>> +		return &ktime_get_real_ns;
>> +	case CLOCK_BOOTTIME:
>> +		return &ktime_get_boottime_ns;
>> +	case CLOCK_TAI:
>> +		return &ktime_get_clocktai_ns;
>> +	default:
>> +		return NULL;
>> +	}
>> +}
>> +
>> +static void
>> +__read_timestamps(struct xe_gt *gt,
>> +		  struct xe_reg lower_reg,
>> +		  struct xe_reg upper_reg,
>> +		  u64 *cs_ts,
>> +		  u64 *cpu_ts,
>> +		  u64 *cpu_delta,
>> +		  __ktime_func_t cpu_clock)
>> +{
>> +	u32 upper, lower, old_upper, loop = 0;
>> +
>> +	upper = xe_mmio_read32(gt, upper_reg);
>> +	do {
>> +		*cpu_delta = local_clock();
>> +		*cpu_ts = cpu_clock();
>> +		lower = xe_mmio_read32(gt, lower_reg);
>> +		*cpu_delta = local_clock() - *cpu_delta;
>> +		old_upper = upper;
>> +		upper = xe_mmio_read32(gt, upper_reg);
>> +	} while (upper != old_upper && loop++ < 2);
>> +
>> +	*cs_ts = (u64)upper << 32 | lower;
>> +}
>> +
>> +static int
>> +query_cs_cycles(struct xe_device *xe,
>> +		struct drm_xe_device_query *query)
>> +{
>> +	struct drm_xe_query_cs_cycles __user *query_ptr;
>> +	struct drm_xe_engine_class_instance *eci;
>> +	struct drm_xe_query_cs_cycles resp;
>> +	size_t size = sizeof(resp);
>> +	__ktime_func_t cpu_clock;
>> +	struct xe_hw_engine *hwe;
>> +	struct xe_gt *gt;
>> +
>> +	if (query->size == 0) {
>> +		query->size = size;
>> +		return 0;
>> +	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
>> +		return -EINVAL;
>> +	}
>> +
>> +	query_ptr = u64_to_user_ptr(query->data);
>> +	if (copy_from_user(&resp, query_ptr, size))
>> +		return -EFAULT;
>> +
>> +	if (resp.rsvd)
>> +		return -EINVAL;
>> +
>> +	cpu_clock = __clock_id_to_func(resp.clockid);
>> +	if (!cpu_clock)
>> +		return -EINVAL;
>> +
>> +	eci = &resp.eci;
>> +	if (eci->gt_id > XE_MAX_GT_PER_TILE)
>> +		return -EINVAL;
>> +
>> +	gt = xe_device_get_gt(xe, eci->gt_id);
>> +	if (!gt)
>> +		return -EINVAL;
>> +
>> +	if (eci->engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
>> +		return -EINVAL;
>> +
>> +	hwe = xe_gt_hw_engine(gt, user_to_xe_engine_class[eci->engine_class],
>> +			      eci->engine_instance, true);
>> +	if (!hwe)
>> +		return -EINVAL;
>> +
>> +	resp.cs_frequency = gt->info.clock_freq;
>> +
>> +	xe_device_mem_access_get(xe);
>> +	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> +
>> +	__read_timestamps(gt,
>> +			  RING_TIMESTAMP(hwe->mmio_base),
>> +			  RING_TIMESTAMP_UDW(hwe->mmio_base),
>> +			  &resp.cs_cycles,
>> +			  &resp.cpu_timestamp,
>> +			  &resp.cpu_delta,
>> +			  cpu_clock);
>> +
>> +	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> +	xe_device_mem_access_put(xe);
>> +	resp.width = 36;
>> +
>> +	/* Only write to the output fields of user query */
>> +	if (put_user(resp.cs_frequency, &query_ptr->cs_frequency))
>> +		return -EFAULT;
>> +
>> +	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp))
>> +		return -EFAULT;
>> +
>> +	if (put_user(resp.cpu_delta, &query_ptr->cpu_delta))
>> +		return -EFAULT;
>> +
>> +	if (put_user(resp.cs_cycles, &query_ptr->cs_cycles))
>> +		return -EFAULT;
>> +
>> +	if (put_user(resp.width, &query_ptr->width))
>> +		return -EFAULT;
>> +
>> +	return 0;
>> +}
>> +
>>  static int query_engines(struct xe_device *xe,
>>  			 struct drm_xe_device_query *query)
>>  {
>> @@ -373,6 +513,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
>>  	query_gts,
>>  	query_hwconfig,
>>  	query_gt_topology,
>> +	query_cs_cycles,
>>  };
>>
>>  int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 86f16d50e9cc..a5a5a02253f2 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -128,6 +128,24 @@ struct xe_user_extension {
>>  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>>  #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
>>
>> +/** struct drm_xe_engine_class_instance - instance of an engine class */
>> +struct drm_xe_engine_class_instance {
>> +#define DRM_XE_ENGINE_CLASS_RENDER		0
>> +#define DRM_XE_ENGINE_CLASS_COPY		1
>> +#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
>> +#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
>> +#define DRM_XE_ENGINE_CLASS_COMPUTE		4
>> +	/*
>> +	 * Kernel only class (not actual hardware engine class). Used for
>> +	 * creating ordered queues of VM bind operations.
>> +	 */
>> +#define DRM_XE_ENGINE_CLASS_VM_BIND		5
>> +	__u16 engine_class;
>> +
>> +	__u16 engine_instance;
>> +	__u16 gt_id;
>> +};
>> +
>>  /**
>>   * enum drm_xe_memory_class - Supported memory classes.
>>   */
>> @@ -223,6 +241,64 @@ struct drm_xe_query_mem_region {
>>  	__u64 reserved[6];
>>  };
>>
>> +/**
>> + * struct drm_xe_query_cs_cycles - correlate CPU and GPU timestamps
>> + *
>> + * If a query is made with a struct drm_xe_device_query where .query
>> + * is equal to DRM_XE_QUERY_CS_CYCLES, then the reply uses
>> + * struct drm_xe_query_cs_cycles in .data.
>> + *
>> + * struct drm_xe_query_cs_cycles is allocated by the user and .data points to
>> + * this allocated structure. The user must pass .eci and .clockid as inputs to
>> + * this query. eci determines the engine and tile info required to fetch the
>> + * relevant GPU timestamp. clockid is used to return the specific CPU
>> + * timestamp.
>> + *
>> + * The query returns the command streamer cycles and the frequency that can
>> + * be used to calculate the command streamer timestamp. In addition the
>> + * query returns a set of cpu timestamps that indicate when the command
>> + * streamer cycle count was captured.
>> + */
>> +struct drm_xe_query_cs_cycles {
>> +	/** Engine for which command streamer cycles is queried. */
>> +	struct drm_xe_engine_class_instance eci;
>> +
>> +	/** MBZ (pad eci to 64 bit) */
>> +	__u16 rsvd;
>> +
>> +	/**
>> +	 * Command streamer cycles as read from the command streamer
>> +	 * register at 0x358 offset.
>> +	 */
>> +	__u64 cs_cycles;
>> +
>> +	/** Frequency of the cs cycles in Hz. */
>> +	__u64 cs_frequency;
>> +
>> +	/**
>> +	 * CPU timestamp in ns. The timestamp is captured before reading the
>> +	 * cs_cycles register using the reference clockid set by the user.
>> +	 */
>> +	__u64 cpu_timestamp;
>> +
>> +	/**
>> +	 * Time delta in ns captured around reading the lower dword of the
>> +	 * cs_cycles register.
>> +	 */
>> +	__u64 cpu_delta;
>> +
>> +	/**
>> +	 * Reference clock id for CPU timestamp. For definition, see
>> +	 * clock_gettime(2) and perf_event_open(2). Supported clock ids are
>> +	 * CLOCK_MONOTONIC, CLOCK_MONOTONIC_RAW, CLOCK_REALTIME, CLOCK_BOOTTIME,
>> +	 * CLOCK_TAI.
>> +	 */
>> +	__s32 clockid;
>> +
>> +	/** Width of the cs cycle counter in bits. */
>> +	__u32 width;
>
>Not much clear what are the 'inputs' and 'outputs' of this struct without reading the implementation...
>Would be better adjust the comments to help with that. Also you could change the order to make the 'inputs' first:

The input/output is documented in the structure description rather than 
the individual members. I guess it's better to add it to the individual 
members.

>
>drm_xe_query_cs_cycles {
>eci
>rsvd
>clockid
>
>width
>cs_cycles
>cs_frequency
>cpu_timestamp
>cpu_delta
>}

Sure, I can reorder the fields. Not sure if that affects alignment in 
any way. Will check.
>
>Also maybe rename cs to engine, command streamer or cs is not used in xe_drm.h.

will do

>
>Other than that LGTM.
>Mesa side is implemented here: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/24591

Thanks, I will include this link in the commit msg.

Umesh
>
>
>> +};
>> +
>>  /**
>>   * struct drm_xe_query_mem_usage - describe memory regions and usage
>>   *
>> @@ -395,6 +471,7 @@ struct drm_xe_device_query {
>>  #define DRM_XE_DEVICE_QUERY_GTS		3
>>  #define DRM_XE_DEVICE_QUERY_HWCONFIG	4
>>  #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
>> +#define DRM_XE_QUERY_CS_CYCLES		6
>>  	/** @query: The type of data to query */
>>  	__u32 query;
>>
>> @@ -737,24 +814,6 @@ struct drm_xe_exec_queue_set_property {
>>  	__u64 reserved[2];
>>  };
>>
>> -/** struct drm_xe_engine_class_instance - instance of an engine class */
>> -struct drm_xe_engine_class_instance {
>> -#define DRM_XE_ENGINE_CLASS_RENDER		0
>> -#define DRM_XE_ENGINE_CLASS_COPY		1
>> -#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
>> -#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
>> -#define DRM_XE_ENGINE_CLASS_COMPUTE		4
>> -	/*
>> -	 * Kernel only class (not actual hardware engine class). Used for
>> -	 * creating ordered queues of VM bind operations.
>> -	 */
>> -#define DRM_XE_ENGINE_CLASS_VM_BIND		5
>> -	__u16 engine_class;
>> -
>> -	__u16 engine_instance;
>> -	__u16 gt_id;
>> -};
>> -
>>  struct drm_xe_exec_queue_create {
>>  #define XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY               0
>>  	/** @extensions: Pointer to the first extension struct, if any */
>
