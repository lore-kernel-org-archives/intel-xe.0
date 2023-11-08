Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AEEC4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 00:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F72C10E6CE;
	Wed,  8 Nov 2023 00:06:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCDF10E6CD
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 00:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699401961; x=1730937961;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BXIayPN0hBGhoXq+t9xBgUpMGXUrx8Co+f6aYVBuhEY=;
 b=GttuIRHbA5yOoVu0OuSDOyd2bXMVL+0ayFRx2QK0zeqdVeMzTZBQMeUp
 6FPiGicSVA89IzbVISIcUyZn2nVt51jvl9/9dr2WwLGWMiyTcJazAV7qp
 dVgZPrnapp6iB8+8iOWhlVMWwS1aH+thOWPY6oOKgbpuRXSzhoTJJ0kQ2
 cJymk7s39NCItD9Q7e7IyQifm0uvrtJ5NBBai8jd5BZpkdv8PqEBfPO/5
 V5DHl8h3fARKSgu/SQqCYmwk7dcR5wldGNQwaiXOqKaS84GEiwrb0+PgE
 qAXqRKjJJhci7bOaiKl3APar4toUVl/UpUlHjoyfheoKn43AFuDladdgC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="11204616"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="11204616"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 16:06:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="792003667"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="792003667"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 16:05:59 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 16:05:59 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 16:05:59 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 16:05:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KopLOnjCqB2bapEdhDO9NasGv3vAh9+UrRkdJ6kwmARPhasfebBA0HI9cRJtCI2laExnWvV8Bzq2ti4zQgB1a+qSGotjg7hWM68LaRnojGWSxPzGonOuE9KEw0DQVZrwDxXbnUHOJDZHCM5xNIXX+50/sglzat+Mm0bKjSNcnZA6QIJA54qfOBtSMLXINY9aBwJGefj6EYUbfn5yvkeQ1Y4NI7EQwUShJ0LSjEbZ3471BDJyrYs72KDDdY6Ewn1vqlc2sqTn/MQdJYpIc2fKJjZRGvYBVw8kILxqsYykc2DtpyzjnizvTFXkRlMVFPdyrZvGVA7zIl0es2Dfwg4Q7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWfXPcWcDNOb7RqJPmiuRtCIwseaLANJ9/QtI9fMMc4=;
 b=i+rjexIcDQYCmU9ACDPyRKHtUnP9D8uh6kXRlgbEClGjBeMuUcUir1V4iJI4tonDedhkwsEqnFI465Gy3ZctdHceU42dAVEkiPkIljSvYlZrdQPy+K1AueVfVSUdo95qkFOJUELodCmqGiUNr1Nhm3as5DuhtZcXy/mPpQSb5EXLtXgEzYS4AvGLQn8RlUmi5TdS9JpVExy5nei863FN3rPnlIbPeu2nBS6BL1ngHBReKlkvgFFSXxkji5np8b01bed7xTFUgUrRvTAbGgsy+bnvdoWX27iw4Bq7EnHpGETTvTivo3YWOUlBOTm0/UqNqfn8VmrW+UB2w6mH4lkJRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by LV2PR11MB6045.namprd11.prod.outlook.com (2603:10b6:408:17b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Wed, 8 Nov
 2023 00:05:56 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::7c9d:a4c7:4e1e:aebc]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::7c9d:a4c7:4e1e:aebc%4]) with mapi id 15.20.6954.027; Wed, 8 Nov 2023
 00:05:56 +0000
Message-ID: <e19494be-fd50-4aad-bdc0-44e9901fec37@intel.com>
Date: Tue, 7 Nov 2023 16:05:54 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231103143456.7-1-francois.dugast@intel.com>
 <20231103143456.7-46-francois.dugast@intel.com>
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20231103143456.7-46-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:a03:505::27) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|LV2PR11MB6045:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a4fd0ab-d130-4110-65c8-08dbdfee7b2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WlzFv9nVa59St6CLEnLbYxAs2PVLC2qsO6GHA5ly4AIu3SvCHAiClaIdDcmDoSzgt+M7ju+38VI/kvd4iM04rVkPthhNX/8gXeIQH1fl5XPGbexGRLq2+mLqA12e/pDTdwVv3hO2UVH4bIA0vxrkqh6JoRaHHEVVxRwfiqbufz4TXu2Hqfxr9xyHFNUdtlmD5ickixoXyVQGcFJN4FF1DIlmCCbnLhXDVdsJTM/mkto5LVOFCHBENjqIZ3+mmjdOBiLpfb4USbn/JP2u+nlcwJYGaPktkBdF0iq641aSGlNXtS+Ay87Mb+nthdfvFPUqUi9C4UjmSOreQSqCzx585zJbOmMAeE0Z1SuPdlw/rAxbYYbDhnpjpDC0anAsgt0n8jvbpOrQnwQ1byI8DHI+BcoMpOtclG2T4JZUAEn2HTH7daKupB8qm43DmimtgPFW2/+XNpndVGD00xi2FcJ9Xg/iefAScKLFy0BQ4tUEnjt37pWKY0iRxtNXWHk8s3zgjYrPbYSvkXaumA52LznsVBmnZnynmTDsB3BdTDuW/x3DvWCpUB36XlZ3oVTq+6M52hz//fjGQFmUQHsbyGtE2FCK6tJl8LqQ+TC9HmaZxpMV2XUo2NXi+Tuzi/kVmorEpioxbH9DvYlBYPKXwzXqCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(366004)(396003)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(36756003)(316002)(8936002)(4326008)(8676002)(83380400001)(66946007)(66556008)(66476007)(5660300002)(6512007)(41300700001)(2906002)(107886003)(478600001)(6486002)(6506007)(53546011)(2616005)(31686004)(82960400001)(31696002)(86362001)(38100700002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXh6ZFIwVU8yM3ZaMkV0aGZ6ZDkxQXJYZlBPQ2hGR1NuSzFPaGVjbVR0aXFM?=
 =?utf-8?B?U01yb0dIY3VtdEd2TEpTbUtVS2hFUi94VWd5WUQxQnM4Z2Z1ZzlBNXJJemsy?=
 =?utf-8?B?TGEvWTFHSWNxT1NOakpxcnZqS1dqaFM2em45ZHNrYWRLQlp1a3JnZ0FCT2U2?=
 =?utf-8?B?MCtUNjAyK2txY1R1NmRuTlFhSGZxYkZacmxGUEVRaHV5S1Q2UUZQYTdmYlZO?=
 =?utf-8?B?dG9TOXhxczAwRVFUYjF1d0puVDlMZndRV2dHbEhvNlA2bjZ6akdBZk1kay84?=
 =?utf-8?B?Q2k5d05kSjhOdUxmTjYwcWlIZkUrYW9udkNTVVhpV1ZNNlhZY0NIYlhCSHJx?=
 =?utf-8?B?cGxKNnE1VUpyclBvQWdMTnlyaHl0YmJjVHlQUEtlZUljakpBMktacjJPSndK?=
 =?utf-8?B?NFhmSUZOc1pyNHpNUzYxTkUxZEUwcEJDc0E5elJXRXZrbFdTUUFHQjZJOUJS?=
 =?utf-8?B?VFo2ek5VWDF5b1Q0L3pqVHAweDRhV0xkRUdCZjVKaHEzSFpuZzJ4UWlCZXNh?=
 =?utf-8?B?dEptajBwQ2ZhalJ6RDRWdjhSY1JWRW5RcnJhZHhMeER1QXgvZjRiYmE0Qnh3?=
 =?utf-8?B?eU1Zd1dhNk5pV1Ftdi9vR241UFlGZWFQWklpaldYNkZvbFIveTdNeXJUZ0Jv?=
 =?utf-8?B?WFhLS2piMzN6bEY1M0xxU0tTelVRREJxNUxqdW1GYUZNZnUwOUw5dFdUNVFs?=
 =?utf-8?B?cHhZOUZVYTUvcDZIYlk0WmJ2a1pYUjh5M1Z3S2lPUnJ2TTFJaWRLekJ5RmFJ?=
 =?utf-8?B?dE5iYW11cTVRWTNiZExTTFo0VE5ZbWN5ZlhVZ2JsUmJsblA1WmgzSU5yZno0?=
 =?utf-8?B?dVNBOUNBNkVHQjRaU3NpdkNoUHc2OVFhc3hzc0thQytmMFVDbDV0MlMwMDBO?=
 =?utf-8?B?YTRwTG5KT29lc1pDWDJPN3htQzN4MXFkRFBaMlBRVmN6MjBjakwzVnZMNVVz?=
 =?utf-8?B?REFGZWE5djRtVUJxZDh1VFhXdk5ZUmVBM283UHJNeHovNFV0czFsbnpETzZG?=
 =?utf-8?B?Q1g2Y3RNZWhnVkM3RTR4a0VzMjhVb0YzMGFjcFg1NWU1clI5c0k3bGp5SG9V?=
 =?utf-8?B?NXNqWHdiNy94RXZ6dTNXanpRWG8wL043TTdpWmZWMmFNRlcrMWc3c0dXVTQz?=
 =?utf-8?B?blBIWS9wSUIwQmxuQ2N5Q3MvWldvZlNtTUE2WG4vMkFVZ1hqOFNvaGRLU1lW?=
 =?utf-8?B?Vmc1aTBJVTBRRGhnRzNXYjNZcmdkNldvYlRIcUpmUnBaaWdMVTAxOThnYXd3?=
 =?utf-8?B?aWNyMVFmNkJkTGJWK3BoWU93a3hhTXFlZlphZndUL2JmQWpadWQwaGcxM3g0?=
 =?utf-8?B?c3U5VTlUSDlESjB5RVBMc3cyaU5zS01INm9uYjIwN1JjNnlETTFGWXlnc3lR?=
 =?utf-8?B?QkRuZndKWE4zSzhtbk10Q040UGgyTWVOZlZHWlpEMFdJMkpKZ21YS1VQQWt0?=
 =?utf-8?B?SzRWbkhGVlJPM3c0WHc1azJZNUd5UVlKV1hhNmlUaldxeUtPaURSdldGQkxv?=
 =?utf-8?B?Vk1GeTdhMlJmZEdRVFFjS0FHTERpK1E3bFA1azVBeENySWRkN3lGVkd4RHcw?=
 =?utf-8?B?UmVpdlpNU3hhbmhCcHN3VFFNbk9jSFR3Z2VtTGZ0b0o3czg5V0FPc0xUeFF5?=
 =?utf-8?B?NUVFWk9PTFpBdHk3L1hnMWFiWkY1KzMydmdiUFErcVVodDJnRDk5eHpTSjJo?=
 =?utf-8?B?cS8vMEcvbWk5aTRtMExxQm5RYTh4VG5tQzh0V1RaMjVkRmJOR2c0UFFEb2RN?=
 =?utf-8?B?bEkrVVlFbkpHdzJtZkpzRWNqK0Z3blg2U2JmSmVrNWxSMVFVUDVXenZXS1ZL?=
 =?utf-8?B?Vk5oVjJDRnBuS3JHNTdmaENuTlhLNGxKRHlkamU1TEdRbVUvakZTSGVUSjl3?=
 =?utf-8?B?TjBaTGZ4dngvQ3RUdlBwOFN2MzBNWkk0VHNSOE1VeWI4UEw4TDE0SEY5eWhH?=
 =?utf-8?B?VTJxZWNSSXBuZHFLaGxaNWkzaG9uRVl3Y3R6enc2eVNiQ3NwTUZhUG9Vbzdk?=
 =?utf-8?B?SnZLUWhNU2xpUUdiTGFxbk9ONDgyZFZ2b1IrbHhZRkRrd1R1VHA3L1NRVVdq?=
 =?utf-8?B?ZkZSYVVJaUplSGIxdVVGRm5VYWx1QnF2WUN1SThBUDhFVFZPc204V1IrMXZ1?=
 =?utf-8?Q?5Xsc1m1HYOSX4VY84fYZ6xGfS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a4fd0ab-d130-4110-65c8-08dbdfee7b2c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 00:05:56.5984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iBjvWkDCyyR2byOnxQoH8IAy38ZTzI8WxdE0HPPIjHYJ5T8ugqsbQfu+dpVtTrAIGSuGVyKfp7j6Sk+clxSeDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6045
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 45/50] drm/xe/uapi: Remove bogus engine
 list from the wait_user_fence IOCTL
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 11/3/2023 7:34 AM, Francois Dugast wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Right now this is only checking if the engine list is sane and nothing
> else. In the end every operation with this IOCTL is a soft check.
> So, let's formalize that and only use this IOCTL to wait on the fence.
> 
> Upon timeout, userspace need then to inspect the engine properties
> like BAN, in order to determine the reset status and any other
> information that can be (or be added) there.

I think the point of a per-engine wait was for long-running context?
In that case, a large timeout value would be specified...  and then if
engine is reset (due to hang for example), it would abort the 
wait_ufence early and return some error other than -ETIME.
But as you say, understand this is not even implemented right now so
makes sense to delete it.

If this is indeed needed in future, this can be restored again using
the drm_xe_wait_user_fence.extensions, correct?

-Brian

> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_wait_user_fence.c | 56 +------------------------
>   include/uapi/drm/xe_drm.h               | 17 +-------
>   2 files changed, 3 insertions(+), 70 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index dcbb1c578b22..a9d231548498 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -58,29 +58,7 @@ static const enum xe_engine_class user_to_xe_engine_class[] = {
>   	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
>   };
>   
> -static int check_hw_engines(struct xe_device *xe,
> -			    struct drm_xe_engine_class_instance *eci,
> -			    int num_engines)
> -{
> -	int i;
> -
> -	for (i = 0; i < num_engines; ++i) {
> -		enum xe_engine_class user_class =
> -			user_to_xe_engine_class[eci[i].engine_class];
> -
> -		if (eci[i].sched_group_id >= xe->info.tile_count)
> -			return -EINVAL;
> -
> -		if (!xe_gt_hw_engine(xe_device_get_gt(xe, eci[i].sched_group_id),
> -				     user_class, eci[i].engine_instance, true))
> -			return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
> -#define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP | \
> -			 DRM_XE_UFENCE_WAIT_FLAG_ABSTIME)
> +#define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_FLAG_ABSTIME)
>   #define MAX_OP		DRM_XE_UFENCE_WAIT_OP_LTE
>   
>   static long to_jiffies_timeout(struct xe_device *xe,
> @@ -132,12 +110,8 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>   	struct xe_device *xe = to_xe_device(dev);
>   	DEFINE_WAIT_FUNC(w_wait, woken_wake_function);
>   	struct drm_xe_wait_user_fence *args = data;
> -	struct drm_xe_engine_class_instance eci[XE_HW_ENGINE_MAX_INSTANCE];
> -	struct drm_xe_engine_class_instance __user *user_eci =
> -		u64_to_user_ptr(args->instances);
>   	u64 addr = args->addr;
>   	int err;
> -	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP;
>   	long timeout;
>   	ktime_t start;
>   
> @@ -151,41 +125,13 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>   	if (XE_IOCTL_DBG(xe, args->op > MAX_OP))
>   		return -EINVAL;
>   
> -	if (XE_IOCTL_DBG(xe, no_engines &&
> -			 (args->num_engines || args->instances)))
> -		return -EINVAL;
> -
> -	if (XE_IOCTL_DBG(xe, !no_engines && !args->num_engines))
> -		return -EINVAL;
> -
>   	if (XE_IOCTL_DBG(xe, addr & 0x7))
>   		return -EINVAL;
>   
> -	if (XE_IOCTL_DBG(xe, args->num_engines > XE_HW_ENGINE_MAX_INSTANCE))
> -		return -EINVAL;
> -
> -	if (!no_engines) {
> -		err = copy_from_user(eci, user_eci,
> -				     sizeof(struct drm_xe_engine_class_instance) *
> -			     args->num_engines);
> -		if (XE_IOCTL_DBG(xe, err))
> -			return -EFAULT;
> -
> -		if (XE_IOCTL_DBG(xe, check_hw_engines(xe, eci,
> -						      args->num_engines)))
> -			return -EINVAL;
> -	}
> -
>   	timeout = to_jiffies_timeout(xe, args);
>   
>   	start = ktime_get();
>   
> -	/*
> -	 * FIXME: Very simple implementation at the moment, single wait queue
> -	 * for everything. Could be optimized to have a wait queue for every
> -	 * hardware engine. Open coding as 'do_compare' can sleep which doesn't
> -	 * work with the wait_event_* macros.
> -	 */
>   	add_wait_queue(&xe->ufence_wq, &w_wait);
>   	for (;;) {
>   		err = do_compare(addr, args->value, args->mask, args->op);
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 757e6da97f87..aada6f75b905 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1278,8 +1278,7 @@ struct drm_xe_wait_user_fence {
>   	/** @op: wait operation (type of comparison) */
>   	__u16 op;
>   
> -#define DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
> -#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 1)
> +#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 0)
>   	/** @flags: wait flags */
>   	__u16 flags;
>   
> @@ -1312,20 +1311,8 @@ struct drm_xe_wait_user_fence {
>   	 */
>   	__s64 timeout;
>   
> -	/**
> -	 * @num_engines: number of engine instances to wait on, must be zero
> -	 * when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
> -	 */
> -	__u64 num_engines;
> -
> -	/**
> -	 * @instances: user pointer to array of drm_xe_engine_class_instance to
> -	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
> -	 */
> -	__u64 instances;
> -
>   	/** @reserved: Reserved */
> -	__u64 reserved[2];
> +	__u64 reserved[4];
>   };
>   
>   /**
