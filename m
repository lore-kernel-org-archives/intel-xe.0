Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550ABC48BC1
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 20:21:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACCB10E1D2;
	Wed, 14 Feb 2024 20:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iUqmGujE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503EC10E1D2
 for <Intel-Xe@lists.freedesktop.org>; Wed, 14 Feb 2024 20:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707942104; x=1739478104;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QxzQybFQHeNCxl5QJV625kCTYvaKvZMgjg1EO3soWxM=;
 b=iUqmGujEJhk5Ac6kcutXcfUrXLehDc4UyMzC5jvTA+W4hoLz+tV3JXs5
 u8KqT/F2UeD0jl9dG0VffKD7UZfBAKIfoR9GwyTO2Og3ICkt5o8YueBX5
 HgWmRZUUW7x7daa/014VqsGhWUuMOZYX/nB5PsR6F4m8S0ZteQpKYV6He
 95DZYPTZDrFxA7AxIAC25TTYeRLaSmHwnoMxz4hJFOAplAYgOd5baRZ+V
 L5EUHkKDwpSKfnglfRuuLu0298aus2oFkweUVImlb52+HsuqBsmjbhC0F
 XFVJ7uaKeGct3hrJ7ckNaaEINp2acAjmIjliwHoehddsWwSZ4EdCpX6uk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="5827303"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="5827303"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 12:21:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="3312530"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 12:21:43 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 12:21:42 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 12:21:41 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 12:21:41 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 12:21:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6LtcY6f1qXoQuic7Y5IZhW9teLusPqjlRn5tpPtC63jaS7XEiJssYf9VaKoGddC504iYpBWaotafaAV3WJcKelxnOrNdfSGuz3QGXrGnMtWg7AuB0ocmV4O2OlBFGacxrsTYgbTUpE0unkI1Zm4TgNe8VhHh2oCbpEk/JFwZrlDLlxp0QwgODxBIs0mkmFNx/20tqCLThhYJGSVvrHu/18CKW+r0VUA/q5hguTSQyoZff8hfh82gSwZOt3gkmeNDjaf6W6FjcpkFcv44d+MCGM2+RBUrarist2eybVQRPrRG5Hm5qS8rVBa7gWrt+M/NuAe7/fvWKgaEGqHG/IemA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCiM0gd6pPwgCVYeYzoa9I2Hs01kuWECzNLc10wKiKU=;
 b=kP4jLmSL9ZBSNiqtodJnBuKi2WN0tg0pXOe0dO0/tzu2J/x/8BWPnhPgeSyb8cAKax8vgwFfx4fEekRpddiAxXZ66n2Eq8WaW/teP+EO08+pVJsZLYiwB79ghSCKVCexDJNdlwWKaygrtDUKzgDiOdFd3DzAdfqSVDKeIKyh2hjFnUIxDJPDxtFMHPPsMWch7u8UUiWIxZ/jDZJskDZKjwd6Ug1GvGoASkesBJ0t1+tjC+3wJIkiZQg+GVyQH5A7/mlxlSn++cgaQ3pDOLQdY83wXqrAtcyjoLZ7RYyc4QZvNKwidRtkdheGTLp/8XxRjTkyVBsLAA3ZN8SSiW6x8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by IA0PR11MB8354.namprd11.prod.outlook.com (2603:10b6:208:48c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Wed, 14 Feb
 2024 20:21:39 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7292.026; Wed, 14 Feb 2024
 20:21:39 +0000
Message-ID: <8bb4e787-fa91-4167-9790-f801945ecdc2@intel.com>
Date: Wed, 14 Feb 2024 12:21:36 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe: Make read_perf_limit_reasons globally
 accessible
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20240213003426.3943662-1-John.C.Harrison@Intel.com>
 <20240213003426.3943662-2-John.C.Harrison@Intel.com>
 <ZcuJOkUkZnss9ttl@intel.com> <7d8760f4-5867-4e07-a82d-d2e64e564272@intel.com>
 <ZczGFSmfKZwei7on@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZczGFSmfKZwei7on@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0052.namprd11.prod.outlook.com
 (2603:10b6:a03:80::29) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|IA0PR11MB8354:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b281a85-8501-41a0-0e4d-08dc2d9a8cf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o6E0tzobgc6gms4ZWNhq3DuylUd51l/P/BVgx9mch+SS0PZgcjN3zWpWSQhe06ya8SSgkDxZS6E9Wzr3WMuw2vuQh/zLnTNV1J4LGd1/llZTr55yTLs+RyN+fxu26Db3qd01QFzYuyph/WfLaIUzoptoqbTMFR8XVLv97IvLAnMAdjoKCAluf6XguJsz9J+k5u93lyHmydEEb4RedNeglHglC/gmnh/YgOKc/5Hzy7Iz349l9/HE7pUxcnHoxnnifc9uzxHwDTguXnhcqS3TqPykbJJK3xKpisxpHFZzGB99UDr3GwutkAXp3W5z73MdVKzXFO/441rQlm1R1p7DX6Y0CNIZfxaDYd9uYa2gLXLOcbuTODudXF8CWKHNU2dB3ZFehrffEO0DWOPldmIF0bhsN+sZZ8Cbv1XfaL7L58XAI5Mhc3FKm8PFlt+yhB/VmY1GSE/fUIfsy+edl6iCfZUZoFfi+zhuzPmjmBe90ebKYjs35daybjzWeFquUzdUTNGC9knpl5F1mcagtlmxHMUYGNuYR9Fk/XYBkn1i5mbSGn8A9he5kjJo5lwltZQl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(376002)(39860400002)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(6512007)(478600001)(6486002)(31686004)(41300700001)(66556008)(5660300002)(6862004)(8676002)(2906002)(4326008)(8936002)(37006003)(53546011)(86362001)(6506007)(6666004)(66476007)(66946007)(6636002)(316002)(83380400001)(31696002)(82960400001)(26005)(2616005)(38100700002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzhqSXNKNlpWdWxRL2hwOVVvdEI0Mnl1ZWZmSDhjM21qTVJFMHI2cXE1MXNt?=
 =?utf-8?B?SzFLUGhZVzUvcFF6MmRXZ2RIN25XUDlhd1ZzNXVIY245ejArWCtLQXV2Z2w1?=
 =?utf-8?B?V1gxNWtwR2xLQWNKM29rbDFGZUc1SUgyZGJXYmwwZEUyUjFjaFBmL1N2NmVm?=
 =?utf-8?B?WEZ5elBTNEhJcWJqdERrSkVuT1IzK1NFQXVSQmM2dmE4V0RkR1BONmloNlVH?=
 =?utf-8?B?TEt3ZFZPNEdnU2JFeENsRTl4VWprNEpmT0xVaGF1VVF3ZEZ6NjRaMjA3TDlX?=
 =?utf-8?B?a1dWZzhlekx2TS8vTXFzbFM2SlF0QWg5R29lekJNTmpPNTVyNkMyeFN1aWd4?=
 =?utf-8?B?b1hNa2NIMFJqZFBqTWxqS1RXSHlEdHFWc0NEOG11eG1Cd3QxV1lTVm9uRU1E?=
 =?utf-8?B?bCsyTGhycW83SWZaZThrSmlpTjlxeHBIOXN1SjY2SWtJVExvblNlU0J0TFdT?=
 =?utf-8?B?WGpIaUhFOWl4NHZCRGFnZDUzM1RGMC9DR1IvQTNNWXVySlBiTDV0d09idVEr?=
 =?utf-8?B?dWRXdGZiVG0rVTY2YmFyR0ZWazVNV1o5NnFWa2x1RDJqRHVnWHR3alc3UFEx?=
 =?utf-8?B?MXM1WkYyR0FDNzhnV1BlWlNpNWJuTHlXWmxRbTBkQ0lSZTRmSWxBSlczSkxI?=
 =?utf-8?B?NXBTNUw0Z2FObFJtMEF4Q0RtaXpEQTQ5QlZwMXFJWDRlRzl4MklMQ2tzelZK?=
 =?utf-8?B?UlU5S1hZOFR5MG5mL2pDVUwxNjkrZVBwc3JrditjaWRrZk9OU05tRnlTT3gy?=
 =?utf-8?B?QktUSVdydmtXR3RGZVVDWHR2TWhDVldYeGtiakhuNVZwTXNjVWJEaVA1dytV?=
 =?utf-8?B?ZW14blhYL1I3RUtnM21RdzRxaEdhWmM2T1d5VEpTY0pobytGcGJyUlJsN1k1?=
 =?utf-8?B?SjE3aU0yaUdaNlZBZVFaQkw2RU1lclQ1VE1xMWJ4VGFEMnVUelpyVWkrckFI?=
 =?utf-8?B?VFlDZHBtdXNTMlY2WXRLc3RyQjhBVVVwR3RzMUI5Vzc5MmNOTzRnbWlmbTFZ?=
 =?utf-8?B?bk1teC9md0pqaDg3dHdlb2tINU00Y29XRVZET0FhMStRaUlLZ200dTRuUjZ1?=
 =?utf-8?B?TWIvZGZzbmZrYUtHMTZLY1lWVmZpMUhoY1pMM0l2bmk5NGtmSnExVlFSMWNM?=
 =?utf-8?B?cVhWNWRGejFkUyszMEF0dkViUkVIV0twSFNhQWZvRWZicjFlckFKcnp4Y09W?=
 =?utf-8?B?dE43Z0dCSkFXMHkyOTdvMlE4a0RJekl6SVltc3JzV052RG9nRG5tMW5jMzc5?=
 =?utf-8?B?elpwcnpZc1FNdklMRjJScDFuK3ZXU1hYZ3lnRFpXMERxc05JcHlLdW1vL0R1?=
 =?utf-8?B?bmltK1M0dEw1ajg1VDZSRitxQVN4R3NINzZobEdIbW9WQjJsbWdNS2cvWk9w?=
 =?utf-8?B?bHpvQ2s1QW1FVXpKc1FrcGtlK09KUkRmZno5TjIyVUlZL1Z1a3QxbWtUL1FM?=
 =?utf-8?B?ejlSREQrWmpyT3BrMm5RTTVrTFh2UzBtcHBjVW5QWHNMSjM5Z2FsN1Vlbk9m?=
 =?utf-8?B?bFFTZnM1eThHLzdRS3VPdkUzdnZCL1AzSzBjdU9CeENzdGFXUFZPeFBhOGVM?=
 =?utf-8?B?YlQrN3pNSWRoWUVkU2hKMmV2YkV2MUxNc0VrcE9za1Q5K0ZUUUtCbWNvWDdM?=
 =?utf-8?B?N2FUZXdXd3I4QkRkNjYveHB1TmlQK2VwSUd2QXlpYWlFbi9oTG9QaWVzMEtn?=
 =?utf-8?B?Y0RVZE1tVm9vMGc4VEk4UzhkZXhoMTNxaDVpTUExWndEWldxNjA1ZG5Hb25K?=
 =?utf-8?B?L0pEWEpOZVNZaFJXTHEzTWd1VDVIZ3JYMXJLWnNSTGl6NWsxd2NQK1o4Z2VV?=
 =?utf-8?B?TWRZV25yME5Zc2U0aHNlSFNaNCtxRFdtNlJHVXQ2MzRPakY1S3BadUJPR3BD?=
 =?utf-8?B?YjRNOHJXY09XUCsxcklSQkpvb2JueUJUZ1cyRmRRakx6NmFUaGExZzBsSEFH?=
 =?utf-8?B?UnBNWStXS2ZsN2kydGtHQmpZM2h3TEpWaVpnbTJnVlc0MFJnRkQwZCs0YjZM?=
 =?utf-8?B?aEhCc3kvd2drTjZFQWcyRk1FbWF0Z0JYSTJPMmJSNWE3dkdWaDY4L0RCemtp?=
 =?utf-8?B?dE91WkFSWm9ZSDZ6cG1lcVdpZklyL3EwVDlhL1JPd1d6KzdYTm5uajJMZklK?=
 =?utf-8?B?VmtZa2VaM3BSUjBQK3psN1RXUzFhVm82VDl2RWV2YjV2cXBEdHJHa3hlbnNh?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b281a85-8501-41a0-0e4d-08dc2d9a8cf0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 20:21:39.4137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fWVl0NDLYCaTN29Qg3BCb3FKlLuF4E2m/wwuReEZKNYgzMHf1bNpWRPve2aJhevVI4ay4X4gpdbXb16RE3d+aQbqsixXwmE/MR/hBtgrmIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8354
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

On 2/14/2024 05:54, Rodrigo Vivi wrote:
> On Tue, Feb 13, 2024 at 06:12:11PM -0800, John Harrison wrote:
>> On 2/13/2024 07:22, Rodrigo Vivi wrote:
>>> On Mon, Feb 12, 2024 at 04:34:25PM -0800, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> Other driver code beyond the sysfs interface wants to know about
>>>> throttling. So move the query function out of sysfs.
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_gt_freq.c           | 15 +++++++++++
>>>>    drivers/gpu/drm/xe/xe_gt_freq.h           |  4 +++
>>>>    drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 31 ++++++++---------------
>>>>    3 files changed, 29 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
>>>> index e5b0f4ecdbe8..51645a24009e 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>>>> @@ -11,7 +11,10 @@
>>>>    #include <drm/drm_managed.h>
>>>>    #include <drm/drm_print.h>
>>>> +#include "regs/xe_gt_regs.h"
>>>>    #include "xe_device_types.h"
>>>> +#include "xe_mmio.h"
>>>> +#include "xe_gt.h"
>>>>    #include "xe_gt_sysfs.h"
>>>>    #include "xe_gt_throttle_sysfs.h"
>>>>    #include "xe_guc_pc.h"
>>>> @@ -220,3 +223,15 @@ void xe_gt_freq_init(struct xe_gt *gt)
>>>>    	xe_gt_throttle_sysfs_init(gt);
>>>>    }
>>>> +
>>>> +u32 xe_read_perf_limit_reasons(struct xe_gt *gt)
>>>> +{
>>>> +	u32 reg;
>>>> +
>>>> +	if (xe_gt_is_media_type(gt))
>>>> +		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
>>>> +	else
>>>> +		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
>>>> +
>>>> +	return reg;
>>>> +}
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.h b/drivers/gpu/drm/xe/xe_gt_freq.h
>>>> index f3fe3c90491a..89be518b4967 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_freq.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_freq.h
>>>> @@ -6,8 +6,12 @@
>>>>    #ifndef _XE_GT_FREQ_H_
>>>>    #define _XE_GT_FREQ_H_
>>>> +#include <linux/types.h>
>>>> +
>>>>    struct xe_gt;
>>>>    void xe_gt_freq_init(struct xe_gt *gt);
>>>> +u32 xe_read_perf_limit_reasons(struct xe_gt *gt);
>>> this component is xe_gt_freq, not xe_ nor xe_read or xe_read_perf.
>>> Please use the right namespace prefixes.
>> Argh! Forgot to update that.
>>
>>> But besides the namespace, I don't believe that these limits
>>> belong to xe_gt_freq anyway... why are you taking that from the
>>> throttle reasons and moving here?
>>>
>>> What about removing the 'sysfs' name from the xe_gt_throttle
>>> component and making that to export a function
>>> xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
>>> ?
>> Because that seems like a lot of unnecessary churn. The intention is to
>> simply add the throttle register to debug prints so that CI bug reports can
>> be triaged more effectively. Re-writing the entire sysfs file to split it up
>> into multiple units is not worth the effort when all that is required is to
>> export the function to read a register.
> No, that's not what I meant... I don't believe we need to split the file.
> just remove the 'sysfs' portion of the name of the component itself,
> so we have a component responsible for providing throttle information, either
> with direct exposing the sysfs and also with the exported functions that can
> be accessed by any other component that might make usage of the throttle
> information.
Still not sure I follow. You mean rename the files to 
xe_gt_throttle.[ch] and rename the exported init function to 
xe_gt_throttle_init() but don't change anything else? Leave all the 
sysfs code in the single file? And have xe_gt_throttle_init() as just a 
stub wrapper around a static gt_throttle_sysfs_init() or keep it as a 
single level init function that is generically named but only does sysfs 
initialisation?

John.

>> John.
>>
>>
>>> Thanks,
>>> Rodrigo.
>>>
>>>> +
>>>>    #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>>>> index 63d640591a52..89d9f89962ad 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>>>> @@ -8,6 +8,7 @@
>>>>    #include <regs/xe_gt_regs.h>
>>>>    #include "xe_device.h"
>>>>    #include "xe_gt.h"
>>>> +#include "xe_gt_freq.h"
>>>>    #include "xe_gt_sysfs.h"
>>>>    #include "xe_gt_throttle_sysfs.h"
>>>>    #include "xe_mmio.h"
>>>> @@ -34,77 +35,65 @@ dev_to_gt(struct device *dev)
>>>>    	return kobj_to_gt(dev->kobj.parent);
>>>>    }
>>>> -static u32 read_perf_limit_reasons(struct xe_gt *gt)
>>>> -{
>>>> -	u32 reg;
>>>> -
>>>> -	if (xe_gt_is_media_type(gt))
>>>> -		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
>>>> -	else
>>>> -		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
>>>> -
>>>> -	return reg;
>>>> -}
>>>> -
>>>>    static u32 read_status(struct xe_gt *gt)
>>>>    {
>>>> -	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
>>>> +	u32 status = xe_read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
>>>>    	return status;
>>>>    }
>>>>    static u32 read_reason_pl1(struct xe_gt *gt)
>>>>    {
>>>> -	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
>>>> +	u32 pl1 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
>>>>    	return pl1;
>>>>    }
>>>>    static u32 read_reason_pl2(struct xe_gt *gt)
>>>>    {
>>>> -	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
>>>> +	u32 pl2 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
>>>>    	return pl2;
>>>>    }
>>>>    static u32 read_reason_pl4(struct xe_gt *gt)
>>>>    {
>>>> -	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
>>>> +	u32 pl4 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
>>>>    	return pl4;
>>>>    }
>>>>    static u32 read_reason_thermal(struct xe_gt *gt)
>>>>    {
>>>> -	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
>>>> +	u32 thermal = xe_read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
>>>>    	return thermal;
>>>>    }
>>>>    static u32 read_reason_prochot(struct xe_gt *gt)
>>>>    {
>>>> -	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
>>>> +	u32 prochot = xe_read_perf_limit_reasons(gt) & PROCHOT_MASK;
>>>>    	return prochot;
>>>>    }
>>>>    static u32 read_reason_ratl(struct xe_gt *gt)
>>>>    {
>>>> -	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
>>>> +	u32 ratl = xe_read_perf_limit_reasons(gt) & RATL_MASK;
>>>>    	return ratl;
>>>>    }
>>>>    static u32 read_reason_vr_thermalert(struct xe_gt *gt)
>>>>    {
>>>> -	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
>>>> +	u32 thermalert = xe_read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
>>>>    	return thermalert;
>>>>    }
>>>>    static u32 read_reason_vr_tdc(struct xe_gt *gt)
>>>>    {
>>>> -	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
>>>> +	u32 tdc = xe_read_perf_limit_reasons(gt) & VR_TDC_MASK;
>>>>    	return tdc;
>>>>    }
>>>> -- 
>>>> 2.43.0
>>>>

