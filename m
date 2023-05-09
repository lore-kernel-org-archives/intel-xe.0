Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D71C77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 05:12:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D583710E0AD;
	Tue,  9 May 2023 05:12:03 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567D310E0AD
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 05:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683609121; x=1715145121;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tXoOpH26KOZ3Hk3MXMGXfCRgYPYKHRuV9ilbraowhsE=;
 b=nZOJ0vfdqGWGm+27wFLki+UY6JzBxGJmUpyV1IKzBD/6BX2kLoeOB8yu
 Bdz1D+OJtNCyvqC+L4webiYJDteL4dRWgsWk7EtG9txiMeGNRKRCBvsjS
 HvS/DWnHEQdQvk5gwlUMuS64ppQSW9RHiONwHASryEG4XzKyJaN6o9B36
 hVtBfXGVD+OCindMvzbsotU7hk0T1BpIsCar6qQdi9sbd8H+vSIx+3Lt3
 V7DuZN6zVmd6yBiUI7FX/l9qCQIbHOhINh5Qk2Fr7Zu3W07kTQ4FGWQOt
 5V59gqsYqTlXsxlEnmMXKvxCEtMQvbxtdIC6v+ND7mIYvSLQSnfengMjz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="436128644"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="436128644"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 22:12:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="822923395"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="822923395"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 08 May 2023 22:11:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 22:11:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 22:11:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 22:11:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 22:11:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYM4ACI6aDhEuxEuwz5Kb7tAKB9wz2afxmpvaVMe30LbyjErMRgrzBenDNSs7REiEBcTbE4Dj6wTCzNwZWXuK4VgPjuU7/bhFxKiYnpEg1xYEWqZEr4IGvliuvAgeaVarCeJFSPQ/fc4nfajQyC55pPjDvIZOXRyAKtg7Aooz6ZjQAIUEGf3DhPCheku2uacl8AZhywcgu4g45xZB5nlrT/lLZ06e4uuVrTYn19v3+WPCdKjtH7PPBXwQGdz57NFdvnSq3t4qLSGaRb/ZI0ZQMqXMTXs4bduuYKO1F5FGcOylXuJVlBNQQbfRz3xTju2RE9Ue4ZrhWqk7TXoqwgRrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87hkYnnCJnusLAzS8aHJNaSJkOxF5renCuNX++eBzUE=;
 b=nF/5b3neIV4fqg0ecVkz/PND4cVLwV3gr+CIeojyi+pjDF0Hs10JOs81rj63/nRKesYDZuEtLKr6ccvLrxIZcleUml5wLSlx4DJsjcgpy2zFZP0F/YmBsOg56iZD3qSlIVZW5PAvWxjRmZRfDuzG+qVOtlTFdY8RkfWNgQqjGWeGItLbyRewPtaElf4qWBUQlQAS/O+d+PfggUPNpacgw2TtUXj7E/orr6SUFmQm0y3KsgjpfcerdfHIIZgKgHK2p18yV5fC1H7dp2Te5BMoJYAMaBbx7khlfm0k5uXZA9N2I9d10bXFQU4ECYuRFIJQIeGFgIHNMb0BoCxsxQCPDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by CO1PR11MB4996.namprd11.prod.outlook.com (2603:10b6:303:90::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 05:11:52 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::9c58:34e2:84e5:751b]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::9c58:34e2:84e5:751b%4]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 05:11:52 +0000
Message-ID: <22d0494f-0db8-01b2-7611-8d43b2d79e2b@intel.com>
Date: Tue, 9 May 2023 10:41:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-US
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20230508134823.585186-1-himal.prasad.ghimiray@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230508134823.585186-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::20) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|CO1PR11MB4996:EE_
X-MS-Office365-Filtering-Correlation-Id: f110a4d8-2589-4300-bf47-08db504be60c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1GU5l9QkwIvuDkMsHXFgAwNZCxCNNt+1GecftR36h5WPEWDMEtMVYRB6VUQora1k6JiQqBjVdv1anA0NjWWi+9Pbij1j5VMpHVyDCDGRvxPPsy9vtK85+HQ608L8VH9NWkmosSUeHuJxsFHpY4gx1zYwQT/vnJ+uueybRcB6HdpiL1WAS0RfzbHcfE8AXiUQ6kOeRKOuSu90qflDJvDnnpt/qr+qEsjru4OtNeIItvxoP5VI5QbJ2ZHAkf8yiaXmcW7GljuUjP+ogiSTv2rQ1WsYGZAuQTfl89QiHZ2jdNfIwF7NzUNNAiafALO+vN+GYX6OernDSxwJ5b6kmxJvmdEx4iMotDjB/GjMV6zFDwp2F1/WllZ7QoP7U6TWArAP3xRmI4Tq8DMi779q80O/YwVdO0mjD+4Oc2jDP+qQcU0GOXFvdLM/pedOdLXweSG41LXQBchdw2eLjIQqFIYSK498+XvbZL8OYdUFxU2QKQsO3YUVOyHSQhTu7U+/PqkKv445+9zTzeAPkgZPopJ18Fxyv5O8cGTvkcJI2FTOEJiHI+hRArY4HnasJX7Xdj9E8Nlz7xNI0IIZiti+xeRGIWZC97msvBLnYJzfB2XyA40=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199021)(5660300002)(110136005)(478600001)(31686004)(6486002)(41300700001)(6666004)(966005)(8676002)(316002)(8936002)(6512007)(6506007)(6636002)(66556008)(66476007)(66946007)(53546011)(26005)(2906002)(2616005)(83380400001)(186003)(82960400001)(31696002)(86362001)(38100700002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjNXY2UzZXZ6NHBMYytXVXZXandGSHZ5TVZIWHZwNWpYRDVMQWV0M1YvNWc3?=
 =?utf-8?B?NHFxVnpHdU5rRHdqSWN1VXZnWXoyd3FUUldpODRrdnd2ZWo1c3JIaW9IbDBp?=
 =?utf-8?B?dU5VczBFbERoYUZYWGdWYkFTRkNFOFY3YTdTUVN6aXZKRDRjWnlPeTdSc1V6?=
 =?utf-8?B?UWRPNytmaXZ2UzR1VkJna0Mvemh3UCtzSk9zRmwyQ0lneU9uanhRUUcwZERt?=
 =?utf-8?B?bWZlM1h6Rllyc21MbEdkWDVBVG9HKzd4NlBEN1NDY3BRMVN3QWVIbFg0aWlq?=
 =?utf-8?B?U3loMTlrRVFwL2Nuc2V6SGZ2RWkyOTM3TFJscFZ3YWJuazQ3Y1o1Z2xVanNs?=
 =?utf-8?B?NVM5MEFlcGRxTUh2bk5tSm1xQnZ6MXIwYzVCZmlxbnFoWVJ0SnE3OUNOcm1a?=
 =?utf-8?B?dDVuaTM0V3lhd0Q4QU0rZmRzcm1tTlJsNWdhMm9MbVZpNEJqYXA3ZmNBdU5v?=
 =?utf-8?B?ZEwyU1ByMG9YdFk5Wkh2R01GRC9LQmplWkhxZjdNMHI3eXNKVTFwWEptWHlK?=
 =?utf-8?B?c0tWUnFpV1ZLT2ZkWU9iblVrTFlVVHpXM3NLZDUzdDJydTRrWVlMVjY0VHp4?=
 =?utf-8?B?ZGhKNVp5QUdNRTdzS1RCZkZDZlVYR3VpWGJrZFpqQThHUERzaXNCR01oUGN0?=
 =?utf-8?B?Yk8zdXA0NWlLZXBJN1NpdjE1bXJVQjFyQXI3aVZpbENsRk8vYkdyY243UmNY?=
 =?utf-8?B?WkhiNHV2ZFFzRlNxVTd6c3NxcC9wa3ozOTV5TXIydEd2dUw3Z0NWVmFndWx5?=
 =?utf-8?B?NWJmSWRUVjFuNys2TERHZllPQUpVVEgzaGVNekx3UHd2cDZldDB5ZlYyQTRO?=
 =?utf-8?B?TFl4MTdtTWQ1czlMc0JNSm96cXA5clg5STdqYlZIajB2cjMxNENEVVhBVFhL?=
 =?utf-8?B?bzVVUzNDMXA0eko1K3JQRk9NeFFHQnp3bkxBYlFNSUxidHJYd2hwSVR5eE54?=
 =?utf-8?B?aWdGcVAxS0xvZENMQjFrNUpndElLbjIybGdLbVRYenhPbDdlWnNnMm94S1RO?=
 =?utf-8?B?STRwZXVRTlN2NDJJWm9tZksvd0J6SEJNdER5M2xZbTd5SWtpVVBmc1JtRE1G?=
 =?utf-8?B?K1Mrc280TEIwd2pLT2pqeE9mbzI1MFRVRW91QmhPYTdneXExUEJtZklXRGRP?=
 =?utf-8?B?c2lYZzJiNG4xcVBoQ3hNblkvSkFjRmJ5bi9JbHozcWZLNyttZWFIYkdBc2ZX?=
 =?utf-8?B?OFVZemtPWWwxSzdJV2JGV0JITGx4a0lTUzBLTTUxVVRqRWswVHdMWmVKYTZW?=
 =?utf-8?B?N3FXYmZXdlN3Z0s5WU5lTXhVYm9pMW9QVHBCWi9kbkJZM05qbzJINVB2ajFj?=
 =?utf-8?B?UWttV1FvajRHV0hBVmgxYjIyeWpPUUxuWWRNWFRoS3pObC9sQmhINlBRZEFM?=
 =?utf-8?B?R0hXQmptUEoraGNGUUZPeE5rZjIwOVZZcnJTRHFkMmpVTS85MEx5Wll4VFJv?=
 =?utf-8?B?NEc1YkY2SlpvaFEzSmpQNkVmbjcyWFZkRk9TUmdDNWtGcjFwZXowQlFlZGtC?=
 =?utf-8?B?WEs1UUgvSnNQaGZaN21LWkxOb3pIdk12THB2QmovTVJCQ1RLajNCT0hBa3Fl?=
 =?utf-8?B?eEwyOEZya2FsRWIxQlZhelBWTHkySHoyNWVZUXlOMWVPRFhoYm9DTGNOK0lX?=
 =?utf-8?B?SmI1aStFbk9lRFZha1E4eFRoMjVlSUlvQ21GNnBneVUrVGVwVk1XRkRTR2pl?=
 =?utf-8?B?L2NqUzJqZGgvNGFpZGIvNkZ4R1hxc09CVXc2UWQ1Wm5ISmZUTldpcWR6RWg5?=
 =?utf-8?B?RW5VaUNqMFdsRUliTzJBTTBmM2M4V3hQYlY2Wkp6aHVwR0g4T213Q0ZqdW5v?=
 =?utf-8?B?TXYxNGwxeXFrWGNwMzZtRmxRYkw0QmVISkwxMzZmdGVPN3pCSmllNmZSZVJk?=
 =?utf-8?B?YnY3eEh1OGMzdy82VXFBVU9LQUk4dXplNlBmUWg4bSszUjFyOEdzSVIydThG?=
 =?utf-8?B?UXJ0N3NZVU5IUkh1VjRJRktUQ0JVeXFwNW41dWRCNUF2Q045QkNwd2hEQm1o?=
 =?utf-8?B?OEYxQkNISFFSaDZwb1RzQlFnclBIZ25BT284WjgwMEw5QURqSEtNTWNiMGsz?=
 =?utf-8?B?U0t3bk5wLzVTd1puc2t0dUpWZWpiVWhCbVVvYk5qdWdaNmFyeTczSml4SDlG?=
 =?utf-8?B?NmREdjFKb2hBT09OdjhmeVl0R3B4d2gwN0QvL2krdjdtWVV5bHhMUkJOOEpw?=
 =?utf-8?B?RlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f110a4d8-2589-4300-bf47-08db504be60c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 05:11:51.8645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vTPy63q6UEvOXlvdXmYceMdHgeqFFC/fNtkcEWVEBS8fuhasT9m/ZKChgC3PRGZQUD6pJd1lisx/vU3+xR9NBUUH9ppteuCCc9gc0d4diUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4996
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 1/1] drm/xe: Notify Userspace when engine/gt
 reset fails.
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



On 08-05-2023 19:18, Himal Prasad Ghimiray wrote:
> Send uevent in case of engine reset or gt reset failure.
> L0 sysman would like to generate device reset needed event when
> gt reset fails
> https://one-api.gitlab-pages.devtools.intel.com/level_zero/sysman/api.html#_CPPv441ZES_EVENT_TYPE_FLAG_DEVICE_RESET_REQUIRED
This could rather be an intimation to userpace monitoring tool to do the
device level reset/reboot when GT reset fails. udevadm can be used to
monitor the uevents.

@rodrigo, your thoughts?


> 
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c         | 18 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc.h        | 18 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.c | 23 +++++++++++++++++++++++
>  include/uapi/drm/xe_drm.h          |  8 ++++++++
>  4 files changed, 67 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 3afca3dd9657..2c3ffa1db74e 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -8,6 +8,7 @@
>  #include <linux/minmax.h>
>  
>  #include <drm/drm_managed.h>
> +#include <drm/xe_drm.h>
>  
>  #include "regs/xe_gt_regs.h"
>  #include "xe_bb.h"
> @@ -590,6 +591,20 @@ static int do_gt_restart(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +static void xe_uevent_gt_reset_failure(struct xe_device *xe, u8 id)
> +{
> +	char *reset_event[5];
> +
> +	reset_event[0] = XE_RESET_FAILED_UEVENT "=1";
> +	reset_event[1] = "RESET_ENABLED=1";
> +	reset_event[2] = "RESET_UNIT=gt";
> +	reset_event[3] = kasprintf(GFP_KERNEL, "RESET_ID=%d", id);
> +	reset_event[4] = NULL;
> +	kobject_uevent_env(&xe->drm.primary->kdev->kobj, KOBJ_CHANGE, reset_event);
> +
> +	kfree(reset_event[3]);
> +}
> +
>  static int gt_reset(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -639,6 +654,9 @@ static int gt_reset(struct xe_gt *gt)
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  	drm_err(&xe->drm, "GT reset failed, err=%d\n", err);
>  
> +	/* Notify userspace about gt reset failure */
> +	xe_uevent_gt_reset_failure(xe, gt->info.id);
> +
>  	return err;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 74a74051f354..845c57b95562 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -56,4 +56,22 @@ static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
>  	}
>  }
>  
> +static inline u16 xe_guc_class_to_engine_class(u8 guc_class)
> +{
> +	switch (guc_class) {
> +	case GUC_RENDER_CLASS:
> +		return XE_ENGINE_CLASS_RENDER;
> +	case GUC_VIDEO_CLASS:
> +		return XE_ENGINE_CLASS_VIDEO_DECODE;
> +	case GUC_VIDEOENHANCE_CLASS:
> +		return XE_ENGINE_CLASS_VIDEO_ENHANCE;
> +	case GUC_BLITTER_CLASS:
> +		return XE_ENGINE_CLASS_COPY;
> +	case GUC_COMPUTE_CLASS:
> +		return XE_ENGINE_CLASS_COMPUTE;
> +	default:
> +		XE_WARN_ON(guc_class);
> +		return -1;
> +	}
> +}
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index e857013070b9..663908573d5c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -12,6 +12,7 @@
>  #include <linux/dma-fence-array.h>
>  
>  #include <drm/drm_managed.h>
> +#include <drm/xe_drm.h>
>  
>  #include "regs/xe_lrc_layout.h"
>  #include "xe_device.h"
> @@ -1589,9 +1590,25 @@ int xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  	return 0;
>  }
>  
> +static void xe_uevent_engine_reset_failure(struct xe_device *xe, const char *name)
> +{
> +	char *reset_event[5];
> +
> +	reset_event[0] = XE_RESET_FAILED_UEVENT "=1";
> +	reset_event[1] = "RESET_ENABLED=1";
> +	reset_event[2] = "RESET_UNIT=engine";
> +	reset_event[3] = kasprintf(GFP_KERNEL, "RESET_ID=%s", name);
> +	reset_event[4] = NULL;
> +	kobject_uevent_env(&xe->drm.primary->kdev->kobj, KOBJ_CHANGE, reset_event);
> +
> +	kfree(reset_event[3]);
> +}
> +
>  int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_hw_engine *hwe;
> +	u16 engine_class;
>  	u8 guc_class, instance;
>  	u32 reason;
>  
> @@ -1608,6 +1625,12 @@ int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	drm_err(&xe->drm, "GuC engine reset request failed on %d:%d because 0x%08X",
>  		guc_class, instance, reason);
>  
> +	engine_class = xe_guc_class_to_engine_class(guc_class);
> +	hwe = xe_gt_hw_engine(guc_to_gt(guc), engine_class, instance, false);

this can return NULL, so a check is needed here.

Thanks,
Aravind.
> +
> +	/* Notify userspace about engine reset failure */
> +	xe_uevent_engine_reset_failure(xe, hwe->name);
> +
>  	xe_gt_reset_async(guc_to_gt(guc));
>  
>  	return 0;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b0b80aae3ee8..79ef5947c172 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -36,6 +36,14 @@ extern "C" {
>   * subject to backwards-compatibility constraints.
>   */
>  
> +/*
> + * Uevents generated by xe on it's device node.
> + *
> + * XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset engine
> + *	or gt fails. The value supplied with the event is always 1.
> + */
> +#define XE_RESET_FAILED_UEVENT "RESET_FAILED"
> +
>  /**
>   * struct xe_user_extension - Base class for defining a chain of extensions
>   *
