Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA03C4707B
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 01:02:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CE110E9D8;
	Fri, 12 Jan 2024 01:02:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6D510E9D8
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 01:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705021330; x=1736557330;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wg/PfpcKbJ2nvLrnRJYQzo25Up6w2HGywMoWuHgC5Ko=;
 b=HETenm3Y9xyqmpx3ar5OMnn876VcgVwAX+uh8UiUNj/3AZ6G143WtBkx
 ix1ASsju+EN1LOQAuHOyMZbew6WcKDOUrwY0bXq/zIfm7+TbFBk5qgQmi
 GdGcL1KBJclCHxXs5bdbrSqdBMKcH5x/cqTdkqOmSHwLOoiJ1JINWhWTO
 OsAeGmBQVj3Vo6MumqP1TDc6//OH+2USqqT8qR2zBz0XroxpG0L2K6WRe
 KwPhwQiOI/mxbNHJ74A4TZ1k7234WocTgBamoqQyHixdbW5ml78PY+q/g
 eLs1u6XHhbbEPtKij9g5Nz59wHvcne4QsSgbk0NlHKxeUA7WGNenYmNEL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="463331076"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="463331076"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 17:02:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="31209119"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jan 2024 17:02:10 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 17:02:09 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 17:02:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Jan 2024 17:02:09 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Jan 2024 17:02:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XBY+07Jze/NgYqfU2gMaREQ+9n3YiucpJoWqnm1+tcY7Bc7+uLt5AUYXO9mDSAIr/mayMOJ7rr0Ol/of0QHvnwH+cSfwNT0+++acf0elfGrI1O9/c3HReLw8mCj6D8Tb4kgkuoho2bOms8udsSkMNXXOqYYNieBQiXcD0WXuDYj/HFven0ueSfXfoFnL/i+AP4N+Q+kUZngw1bmonhgB1Xe39PKzezvx5HG9Br6QuyoFeih8pcmvGp0vxtCWVORBnuVtDHk1fL+YO/SZZejh5/6s7Pa+pNtc9302Mr97/rKXnitV3gNWkRgOoqQtm7G2L7Eo1B52KWGeiDWb+mBFyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jf9TjnFy6ybzbobQAhHTBcwDP9XKoyyEfVj1QFVVzEY=;
 b=lBZCTHzqBtYMmTVG6ejIfYa15v1oi+dlS9N4b+sMlPXXO+Pg8Az9FiCi4y9aAIgE9BsPDCCAlZkrGRmxhfwNwTEHgL5gxBaW6mZjj/FYbbkVR2L2wm7aLC9/ugj6jquTZtH2A2HYJNEdKFap0FBo6o7e9nzF36dnfpq3ZnTRHp5U1EgYjj96pYcqEODDZYVwVEXP5KVsFFE1cHxQpPetE6jmTWlhhf6L7jc/GT5j68xDJDHjYcztcY0rxitbVs5gHb2Z5O6dY5Gstg2889VUyzj4VsuVlr/Lpy/wnNsdbH0mRIdhfbjs/clTvjd8INfTV938mawsFLhLob0W9On/Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by CY5PR11MB6162.namprd11.prod.outlook.com (2603:10b6:930:29::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Fri, 12 Jan
 2024 01:02:06 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e%7]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 01:02:05 +0000
Message-ID: <4e920073-18a0-493c-8b74-6103131e8eac@intel.com>
Date: Thu, 11 Jan 2024 17:02:03 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/xe: Add CLOS specific initializations
Content-Language: en-US
To: Pallavi Mishra <pallavi.mishra@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240109235758.1432987-1-pallavi.mishra@intel.com>
 <20240109235758.1432987-4-pallavi.mishra@intel.com>
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20240109235758.1432987-4-pallavi.mishra@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:a03:180::30) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|CY5PR11MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: f79b4f71-0352-4a64-e9b8-08dc130a1816
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: badxlv9i/cuaqHZt/QnaWK6FVitauhu9I+t0N43+Ikere4cQbI3ctO+07kQZG4RYQRpY0npap4SJ6+kwKYfSmIvs75syT3jVPBqCctBoOiRtBfDb6EXp0aGhBefZWCj9uXlKyBIoTQpVGTL27CWdKKDZlrq1Hb5ml4Zt/mBryumuElYqCjlAp5Qy3g4bimOZx1BleHV03miQtewGUkFE/foIHhl4y6s0uUIQmvmBN46AQWp8JivLIlReYGjVEeHkcZX6G46u0OYg4gUk+Th6+scb+FPZ5HgpxEL3cwaz3fqspeR1cMzF6xzm64CqdHV/Pe4PnJN/SvLF7/aNEuay1GDpbylw0PYqakaL1HPB19jfEUYCMZ2Asxlgw9nqfi8uX/cT3yoOtT47jQWAzGJgZU4vZk0GukDQL7BgOVtKpgD944O82JF3XJuWb2nleJjEjpBvmGxX1K7up4W+VgHyAyFmlZ7hSOpjhBnINTJmQ41ZqzN7OzZ//7lUPMMHKye7j/Fd0PWvCl/FbMVn1nLhWaRR3MT/Ar9Bu+CEhYO5h3usNTGpBgZ60D2Jx2VTvRQunjbR1l1fALwohT9gQPvz5k1e2ualQIi+ETLhfQhQeak4VlZPoxiwQurU1g3XGqSsyFmnGMe5Pbry8qK00ABx9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(107886003)(6512007)(53546011)(2616005)(26005)(38100700002)(478600001)(8936002)(4326008)(8676002)(2906002)(66476007)(5660300002)(6506007)(66556008)(6486002)(316002)(41300700001)(36756003)(66946007)(31696002)(82960400001)(86362001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXJmemozMFN0czRmQkd3anUrWTJDVHBHR0xaWENkbnhxMm5SdCtuaUY2bEhG?=
 =?utf-8?B?RkJmRVJlODIrOGlWWkZFNTBqVmN0MGJoZGduV3JXK0d2S2xWaDIwSTZOZ3Jo?=
 =?utf-8?B?azhjV29MemhnQ3dQWHNmbzRLaUVsMVl3TWg4cnpQZitjR3l0VDRtVVA5Ykto?=
 =?utf-8?B?QUxrRmg4UkFwRnZYb1ROS0RkenhQNzhxQkJZdTNNTFlzVVZKNjZyRlpCK09l?=
 =?utf-8?B?dC8xU2FsTVoxc3pTZ1VtWHFoN3c0NVlFV1NDM1F0SVloMjNVbG9ZUE9oR01Y?=
 =?utf-8?B?YUw0d3JrSk9kcm9wclkxSkpjcHZSRk5Vc280V1Z6ajRhSWRwb2NnZWxkbUtQ?=
 =?utf-8?B?aU9FTnFMOWNMNjREY3hPTndDZ0s1NEM3d1kyTFB2ekk4WUZGdzRUZWVEbTg1?=
 =?utf-8?B?QW96cWVJWXlaQ1BleHN2bGdHeEpTeFdzWU94MkdPTFhYcExPd096VUhqSTVG?=
 =?utf-8?B?MG5LcE56SGllbExpV2FaWmM4U3pNeGNhZGhkQ1l1RmJRcEErVngzNEdHckZv?=
 =?utf-8?B?MGtZa3ZJa2JvRkJOOXhybVdpWjJwYU9jVER1dGtjcDNhM2t3TWxpQStaTDQ4?=
 =?utf-8?B?dy8wTFBQbkV4UDFMUDBBVEVBMjhsTlcyMkthYXVEUjBIeE11YzdxbTV2aTlR?=
 =?utf-8?B?QmdZaCt4VWtYWThSaHFwTzFoODBiZGtRc0pXSVd5ZE9zZWVtcVZpM2EvWnhC?=
 =?utf-8?B?NGxmMkY4aWdUOXVVUHB1UGh2WmkyczJJd2Exa2VjZkNmYzJOSmhQN2F0SytK?=
 =?utf-8?B?RkIxUXk3dW9Ecm9OZEdVSzB0cHVuUmpSa2tjNVREc1JMTmJFQUxiQmZqUVNV?=
 =?utf-8?B?T2VLZUQ0RFp0MzNFTWJHQzc4U0JIaUNoRi9oZnlSMWJCK0Q0QlY1MS9mN0pn?=
 =?utf-8?B?SzdOcGZIT2tWcm1GTENoeGp6bytnSmFvTXhybEZSNC9ZckNFRkgzeEdvY2JX?=
 =?utf-8?B?VmZnU2ZaRlphVVlIa25DcUJ4bDV3dDgyOURlSjBMd1ZGSkNjbFV6OUFLSndh?=
 =?utf-8?B?OEwwSHVUaW5XSENEWTdWd2I1bFJIbVI2UWQ0c3BuZHRvNlV3TThtNmRYMkQx?=
 =?utf-8?B?aER0TUEzRGphVHo2RWRzS0ZFcm9ONFFiV3VsUjg0UzRPQ3NrYmFZdTNSRjFo?=
 =?utf-8?B?OS91L2xwUjVnUXl2dmF5T0Focmpxa29YZEhncjRVR0Y5dEo5S3NFWnBGcFhp?=
 =?utf-8?B?YjFUREpOLzRjcXdwbmtnSjRGUHZFYWJhbXptS2lkeVZLbDk3UXlacWtNSWVM?=
 =?utf-8?B?anVIZ1FjM2RwVWs3Vmw5SjAzVlQ1RXFhNVNoYzlmdUtvUjRVY3J2bzZpeDha?=
 =?utf-8?B?aFJndFk4QUo0ajJFSkN0RXhzU1pUL1Zlb0NucjUzWGhlVkRrMnZlTllyRUxh?=
 =?utf-8?B?TmpzSVEzZEg2NnVHcFljajBQODh6MTNCYjRCQ0ZzM1FDY2RJQ0dnYmdPVEZr?=
 =?utf-8?B?N2svZVMxQVBFQ1YwOURtTWlxWGowamJwa0ZkM1hDcm1WdGJ1c2x1bTNOM0dT?=
 =?utf-8?B?dkZaRlBVRFoveC9OYlNhWWMwSEJJN281MXlWZVpmYWJvMnFuMHQ5RlZrOEhX?=
 =?utf-8?B?aDdiYTV6K3dpelkvdGFUaVl2MXRqMDV6blF2SUVuTDZEUW5JOXUxZWxyQlRG?=
 =?utf-8?B?UG9tbE1TTXhQKzQ1QmVhbVpFa0V3bkpvRnhnSi91NXF3VmFHRE96ZFFER3VL?=
 =?utf-8?B?VzN5bEtlUXNlNFhheWcxbFVnTlpnNnJYR3Y1bFRZd0FocnVzK1pIcUV6Z2lN?=
 =?utf-8?B?K3ZGalVIZzVoK0JLTDN0M29tdVZIRVhXcURGZG80NlltN3FtVm9ZdkllM3Bq?=
 =?utf-8?B?YXJMMUZBb2RqakNEd0FmTUwzM3dwdk5WUWRYRjNld253YnNPcUFXY2hORFh0?=
 =?utf-8?B?VzFpTkw0SmNTZm14bVhqMnBKZ2FsREZWcHphNkdqeEJVaWw3L1FUaDdIVTVY?=
 =?utf-8?B?K1pUK0pmczVkZEdWMTdIMWRURTFZTDlnTmp5RFFhWDBFZmVWT2h2VWtUUTR5?=
 =?utf-8?B?NmlOMW1KdGhsZ2JFWU10RXBqVlliK1ppZEZUeFhlTUhkRkxPNVlNd2tpS0VL?=
 =?utf-8?B?dmdZVXpiaFgyczk0WVlKVld5bXRXa25nWGxnNmk1bFpFVjBYY1pSRGZQS0RB?=
 =?utf-8?Q?8xkD+41ZUVx/tce89iVE2RXSF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f79b4f71-0352-4a64-e9b8-08dc130a1816
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 01:02:05.5659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zAYsSzNvqNlLpl1vpPemBQ4/CSmxkAjFEX/V8Pj1UwVHW+yNGU8ax9AlbOdNQNinGXLqhBpxbGmgMKnyMD8ZUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6162
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



On 1/9/2024 3:57 PM, Pallavi Mishra wrote:
> Handle CLOS specific initializations and PAT
> CLOS compatibility check.
> 
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 15 ++++++++++++++
>   drivers/gpu/drm/xe/xe_pat.c    | 36 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pat.h    |  9 +++++++++
>   drivers/gpu/drm/xe/xe_vm.c     | 12 ++++++++++++
>   4 files changed, 72 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 004e65544e8d..4e3d4f2c0f9b 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -43,6 +43,7 @@
>   #include "xe_vm.h"
>   #include "xe_wait_user_fence.h"
>   #include "xe_hwmon.h"
> +#include "xe_clos.h"
>   
>   #ifdef CONFIG_LOCKDEP
>   struct lockdep_map xe_device_mem_access_lockdep_map = {
> @@ -81,6 +82,7 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>   	xe->clients.count++;
>   	spin_unlock(&xe->clients.lock);
>   
> +	init_client_clos(xef);
>   	file->driver_priv = xef;
>   	return 0;
>   }
> @@ -101,6 +103,9 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>   		xe_exec_queue_kill(q);
>   		xe_exec_queue_put(q);
>   	}
> +
> +	uninit_client_clos(xef);
> +
>   	mutex_unlock(&xef->exec_queue.lock);
>   	xa_destroy(&xef->exec_queue.xa);
>   	mutex_destroy(&xef->exec_queue.lock);
> @@ -138,6 +143,12 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>   			  DRM_RENDER_ALLOW),
>   	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>   			  DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_CLOS_RESERVE, xe_clos_reserve_ioctl,
> +			  DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_CLOS_FREE, xe_clos_free_ioctl,
> +			  DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_CLOS_SET_WAYS, xe_clos_set_ways_ioctl,
> +			  DRM_RENDER_ALLOW),
>   };
>   
>   static const struct file_operations xe_driver_fops = {
> @@ -542,6 +553,8 @@ int xe_device_probe(struct xe_device *xe)
>   
>   	xe_hwmon_register(xe);
>   
> +	init_device_clos(xe);
> +
>   	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
>   	if (err)
>   		return err;
> @@ -574,6 +587,8 @@ void xe_device_remove(struct xe_device *xe)
>   
>   	xe_heci_gsc_fini(xe);
>   
> +	uninit_device_clos(xe);
> +
>   	xe_irq_shutdown(xe);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 1ff6bc79e7d4..ccdefba0f2f3 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -45,6 +45,14 @@
>   #define XELP_PAT_WC				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 1)
>   #define XELP_PAT_UC				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 0)
>   
> +#define XE2_PAT_CLOS1                          ((1 << 20)|(1 << 21)|(1 << 22)|(1 << 23))
> +#define XE2_PAT_CLOS2                          ((1 << 24)|(1 << 25)|(1 << 26)|(1 << 27))
> +#define XE2_PAT_CLOS3                          ((1 << 28)|(1 << 29)|(1 << 30)|(1 << 31))
> +
> +#define XEPVC_PAT_CLOS1                                ((1 << 4)|(1 << 5))
> +#define XEPVC_PAT_CLOS2                                ((1 << 6)|(1 << 7))
> +
> +
>   static const char *XELP_MEM_TYPE_STR_MAP[] = { "UC", "WC", "WT", "WB" };
>   
>   struct xe_pat_ops {
> @@ -148,6 +156,34 @@ u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
>   	return xe->pat.table[pat_index].coh_mode;
>   }
>   
> +int xe_pat_index_clos_check(struct xe_device *xe, u16 pat_index, u16 clos_index)
> +{
> +	WARN_ON(pat_index >= xe->pat.n_entries);
> +
> +	int err = 0;
> +
> +	switch (clos_index) {
> +	case 1:
> +		if (!(((1 << pat_index) & XE2_PAT_CLOS1)
> +			|| (1 << pat_index & XEPVC_PAT_CLOS1)))

Don't you want to test just one of the XE2 bitmask or XEPVC bitmask.
Based on what the running platform is?
Isn't it okay for pat_index to be outside the XEPVC range on XE2?

I guess I thought we could simplify this more....
Instead of using the defined bitmask constants here, we could instead 
store those values for current platform in xe->info.

So then only need to test here something like:
	((1 << pat_index) & xe->info.pat.clos_mask[clos_index])
And can remove the whole switch statement.
Thoughts?  Maybe want to get feedback from maintainers on this.



> +			err = -EINVAL;
> +		break;
> +	case 2:
> +		if (!(((1 << pat_index) & XE2_PAT_CLOS2)
> +			|| (1 << pat_index & XEPVC_PAT_CLOS2)))
> +			err = -EINVAL;
> +		break;
> +	case 3:
> +		if (!((1 << pat_index) & XE2_PAT_CLOS3))
> +			err = -EINVAL;
> +		break;
> +	default:
> +		drm_err(&xe->drm, "Unsupported CLOS value\n");
> +			err = -EINVAL;
> +	}
> +	return err;
> +}
> +
>   static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
>   			int n_entries)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index fa0dfbe525cd..afac06bc425f 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -58,4 +58,13 @@ void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
>    */
>   u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
>   
> +/**
> + * xe_pat_index_clos_check - check whether clos has been reserved for
> + * chosen pat_index.
> + * @xe: xe device
> + * @pat_index: The pat_index to query
> + * @clos_index: clos index to compare
> + */
> +int xe_pat_index_clos_check(struct xe_device *xe, u16 pat_index, u16 clos_index);
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 1ca917b8315c..8e8c0302c8a0 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2800,6 +2800,18 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>   			err = -EINVAL;
>   			goto free_bind_ops;
>   		}
> +
> +		/* check whether Clos has been reserved for chosen pat */
> +		if ((GRAPHICS_VER(xe) >= 20 && (pat_index > 19)) || (xe->info.platform == XE_PVC && (pat_index > 3))) {
> +			mutex_lock(&xe->cache_resv.clos_mutex);
> +			err = xe_pat_index_clos_check(xe, pat_index, xe->cache_resv.clos_index);
> +			if (err) {
> +				mutex_unlock(&xe->cache_resv.clos_mutex);
> +				goto free_bind_ops;
> +			}
> +			mutex_unlock(&xe->cache_resv.clos_mutex);
> +		}
> +
>   	}
>   
>   	return 0;
