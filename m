Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172AACDB47E
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 00:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB74110E052;
	Thu, 19 Oct 2023 00:52:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324B910E052
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 00:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697676739; x=1729212739;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5sAfS1eaR7AgSaCaSTNx2sFbJTRP8eMG6Q9w75hx148=;
 b=mUOIPfdQD60wo7Olc4YzZ4LM2ADSN9XIXRt/q0cVT4c1AbiT9KhCnFCg
 DL2XDulLUo57cIGxt0L+dtWbdeb9jhgpVfz6kVQF3l7YADdv9LMY3iIzc
 q8hxa4XoEhfDyh45MK/pF7mN2g59BTrxC22/NQJoSBjnWvD1PuqPNP5KI
 S082BvwO/I/f1CG3XXTHfY6m/1G/y7cLUM+24GWjE9DtFzU3qyWm8D2WR
 fRqHfVM56i1JaGeTEbegnVnv1DqNyiXHMHPfNg9Ifgnz0MKvmFh/DQd6B
 Ck20+yTE3cVQEByHJ2eSBgOwiNezfpCNW8E2o8QjJ2HYwq9sciso19rK4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="417256017"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="417256017"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 17:52:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="4761758"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2023 17:52:20 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 17:52:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 17:52:17 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 17:52:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QgoAfeihiTM2eiMbMBOIetrveMlekEsewrAmPyJC1OpMhiBzADSM0IMiBvCfw4Igmb3vyezkJS4eG/nx+m1NR59qSjoDYqaUT8l9sDeKPsc7crI9zuEcym/G3/Ie1/eYSZdNqCLATTf6JHOfaneUFxXYVc39V7KQgtDCnyfALko2aTAVIo89nD9ws5s9lFOizGHglH571PxRptT3yC9+QzsYachMkoMItq16mM54V88mM1J4g+NIhwS1wntMn64NkogyFPjLW2XUN6uLBMxEYMFpCApyopcayiq8IZNSNrlgCJWEfWYsUBLBKr229TIEQgl8MpQfRF/I3C6Ck6fSTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Yk+fIokB8tvD92dB52uzAsFo+sKNB961qdpDVETEfc=;
 b=JMFn7AFD/JmKYHj7cdmMv92+osQiva56IcwqrsM4mTRI9+rCtBwGqqpISM4WFWfey5Jz2GxNSrgnqu2/tbPCklOE0jDQDufIe8TP67xB83dXRi9yMob4Yjgt6roNUmvxn7UPVjRmh6xMOkxe4a6lnsDFNvah5nmeijVjvyVLCdrGlu4R/KntkqrLyDhgE4hgAoWE1CyIOVa0n5WA00DtAcNi9/kR0FVq8CIoKPy/6mAJUVfXx2PdmvZJ00so60ASBH0RatrTBMKV+dqsDVFlwkdhyzPAEIhu/AGSt9tkzGDOiW7yOtOFCqLUtWrSrcls6ZMXR1/5ssIJXTRecVj7/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by IA1PR11MB7773.namprd11.prod.outlook.com (2603:10b6:208:3f0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Thu, 19 Oct
 2023 00:52:15 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::51b2:a46b:a57e:9fd6]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::51b2:a46b:a57e:9fd6%6]) with mapi id 15.20.6886.034; Thu, 19 Oct 2023
 00:52:14 +0000
Message-ID: <be063286-ae1e-460c-80f2-89f86485a9c7@intel.com>
Date: Wed, 18 Oct 2023 17:52:12 -0700
User-Agent: Mozilla Thunderbird
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231018040033.1227494-1-himal.prasad.ghimiray@intel.com>
 <20231018040033.1227494-6-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20231018040033.1227494-6-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0261.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::26) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|IA1PR11MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 242bd361-52ed-40dd-9ff7-08dbd03da2a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jc1EgydoZXWk9NkvlaWBZF49AVoG/9MEfrbdiE+f7VpyfxBfWoApsjL/0/MlRkWZA85byWijNNBok96uBpnGbIclHVXK6XFYLXF6hxBWRKpRRs4PxksB6U9VW/+gQ77t3SweQiA2D76cCe6VtayJpBmzLFXPK0wJ4xrcUlNP6i/JK1dD5UplMJ9JLy1zFALLsCE105oo9CEPWMbckf/R8CsfmF//10I79iBqG4hFkbkr2F5wYUPKCeQbI7ioxhidmuYwO5Nzn7V6lA+PpP4LnGnKhZCID9ME8WRNf2Zz/Qm0qFI+A2drsTYeF/q45b2/ReDzWBLG8EduycBDwAVXgQhqeqjfPWBORzwKnMdYBY7SQEUlqTffTbpxBVNBDGhpoNf3x6o6ZkcPaPRvHoADOP5P/5IGZwgtbiI3l6fiwsB2CsHUTM1FK1IOyCkyepo+Cp32rvVfqrRaR6jIliH+sqEjDp/GbXk61HMjlFS8Yp4BjOG5Cy2oQsrud76N88p2r394NyXyPZj9R86MOI35sVpXbeeiyZJAghfi5P1Zk08+qcPug2jEK0tJ+4Rxx8cGGMtEKgnApGxdGpA43R2OnzBPvdOXNk051vHr/oYhlW1BVIAF0xYo+c54pbnWUa5U9fFdSYIfW+IW1M4coqjhVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(39860400002)(136003)(376002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(31686004)(38100700002)(66946007)(5660300002)(478600001)(66556008)(6486002)(6506007)(83380400001)(8676002)(86362001)(41300700001)(31696002)(53546011)(66476007)(316002)(2906002)(6512007)(8936002)(26005)(2616005)(82960400001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1M0bnJ6ZkpzNUo0eVBranNjM1p0NTY4SlUzSWpsV3BtOU82eTg3eHIyZHdl?=
 =?utf-8?B?K3oyVVBMTUdZUUlLMkV3T3BIcktCaExGaWhWQ3FIZ0NYQ0sxTGR1bTY2aWJs?=
 =?utf-8?B?UHJpeFBPNzAwdmZIWDRjaG5jQUd1SEh1QzVLOWx1b21KTU02V3MzeVkxZFEz?=
 =?utf-8?B?YkZsWDBIMGZzTUw3ajZ0ZFpOTFh4Wk5MMm9pYVNXeDhxcTBnU0pLYkxyYVFV?=
 =?utf-8?B?eHFxM3R1enZGU0Q5QVZZdFkrOHJwYVJqTi9WYjVGV2FxQjIxZXBpL1ZLeG1Q?=
 =?utf-8?B?L0xBOGtzVHh1YkNhREN0bFVQNGEzZVp6Q21rUCsxakZ4OU1BcmlabTVXMjFz?=
 =?utf-8?B?ZmZMSkF6ek4xUE83a3A2WXR5a1NTSGQ3cVlTUFlJTXJDU0o1ZHNPdjdCQVVN?=
 =?utf-8?B?SVBpNGovbkgvQ2VnczBsMmlCbWJFRmo4b3dXSkU4UFZWYnY3SzZZSU5xZUNo?=
 =?utf-8?B?K1JjK1loMDBZUW1aMzdOMGtzNE0yLzZxNElNQnpJUVQxM0phMGxlUEV6OTRZ?=
 =?utf-8?B?b2x3M3p6Szc2STUvYVBXcmEwWE5ITytJaVZ2M3RRbmFDYXRCTDFoNC9wRGJZ?=
 =?utf-8?B?K0JnUnRxQi9sZDdNbTN3TmVQYXVFSERQZ2FYVXJIWEluaE1HMUI5clVJa3Rv?=
 =?utf-8?B?b3FMdXJRQ2NzTUZCemJ3a1cydExwV3FXck9TWFBnKzdXZDB4WGUyVlZUT1NP?=
 =?utf-8?B?cUFTaHdsRzgwS3dRNzBTeVBGWWMwSXY3a3VrWGk4NUI3SVRuYUNwNDJMRHp6?=
 =?utf-8?B?cEJwRktyTkVycTJXK3pLZmROVm5wZ05wcnQvQi9DV0JOeGFnVm9TTlpPQ00v?=
 =?utf-8?B?eXk3RXJRQTBaUExERGUxUzU2V3VyenBNRk1DbzEra0taaEdnemJ6WnRZbDRp?=
 =?utf-8?B?bk1vem15VE9vU1RqZDNtaXc3TFdXV0hCK1VMd0p2S01LVWNlaHB5bktZd3J6?=
 =?utf-8?B?RDYva2p6MkhlSHVnQkF5VHRVL0lXMStCeG1UbXpBK1RxOXByYTU2MjByakM0?=
 =?utf-8?B?cEJIRnVXVENlVFluL0ZkdTNTd0hkWEM2ZWljdG40TnVUQmNMZS9zcm1MZzVV?=
 =?utf-8?B?T3VEc0I1alc2QTMwS25PNlhJd1lOc09Wb1FMQ25SbzZTejdycjMwUktIT0Nr?=
 =?utf-8?B?T1FiaWVmRGRqSHZwdHJuQkpLZGk4YldiUUpoek1MUHJEdDlEL1RmY1pveTE3?=
 =?utf-8?B?RHE0UURFQXh2Z0M4cW1RRmRWczRnbDVpc3BzQkNSZGhXNWxPR2pJb3ljZDZZ?=
 =?utf-8?B?cUp1OUl2Z1JkQzluK01ydnRaMUlsNGs4ZUlGV09rMS9NSVE2c3FPUVlkWDF2?=
 =?utf-8?B?bWhBcmRXQ1VUMS9QckF0c3hnVmpJdHUwaTJVa3hGZWNVdGdRcEc5amgxMnlv?=
 =?utf-8?B?Z2JpU3liTlhuNG5Pakk2OXRSVXpERlcyWmxBdGhhL3pwVTF6ZkxyTkFDTXBI?=
 =?utf-8?B?U2ZMUXQ4VGh2eFNoMWxUSXFtZmtRdTBmelBoclJnQm0wWWd6KzBsTnRmTC9h?=
 =?utf-8?B?ZHR1Nko3UmJzcEZnYzNxdkZEaGRKbjBiMTRuS3VuL0c0ampMS2pzS1JpeklX?=
 =?utf-8?B?MHBCVW9SZnBVWnBSK2h2SDg1dEFSUjNVam9BaE1MUDRnZGlBMVpHZUsrOTly?=
 =?utf-8?B?TVJpaWI5RjFzWGtKTTlEcVB2OU5ydHVIS1lBR0FwRGV4Qm1MVmtCbjVkNmI5?=
 =?utf-8?B?cmN4NWFaN1l5c1l5V1lqMnY2SHFzY281Vmx3YzNPUE1SUEhlZHZKU0tOYjVj?=
 =?utf-8?B?TXRoL05HWXZob3BrTTdiMHFqUkxTRGVURE10cVIrTGJ6QWFncGRVamVwVFB1?=
 =?utf-8?B?VkdrMGk0azVUcFpoSTBxSE5uUVNqYXE1UEo1R28xQWNNVXRrTnAva0Z5WUVZ?=
 =?utf-8?B?YStCMi9GVmEwZFRIaFA3cUhYQ1IwcFlCU1U4dG1LbzZQNGNreDhGOFNJUHVU?=
 =?utf-8?B?Z1M5TE80K1U4UzlnMm1OVmUwZXo5YTYvb3JrQ09JenlVeC8wZ2hxUG13ZmEz?=
 =?utf-8?B?KzROMTBQYU9HWHdvcFhoeFZPeEszN1F1Q3lnZ3Y4NWVsMllIaFhIaDh2dXBw?=
 =?utf-8?B?dXpmWlZ6ZUJ0ZGVFQk1BQjBGOEgvRUVndnVVRjBRbmkzSEd4Wi8zK1pJcHJn?=
 =?utf-8?Q?RWG5qqodd2oXxhbt7oOfMBe47?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 242bd361-52ed-40dd-9ff7-08dbd03da2a8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 00:52:14.8147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jk9yZYoOLRuWnxa5bvAYP3lAM88ADqe+SaqVgo59udX7bjI/rJivpAVwO8LfC5iocQ9VXUdXWuxDyHCwZ0QgXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7773
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 05/10] drm/xe: Notify userspace about GSC
 HW errors.
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



On 10/17/2023 9:00 PM, Himal Prasad Ghimiray wrote:
> Send uevent incase of nonfatal errors reported by gsc.
> 
> v2
> - No need to provide tile info in uevent because error is
> accepted only in tile0. (Aravind)

This is user API.  Don't we need to demonstrate user-space consumer of 
this before merge?  Do we at least have IGT?  Also see question below.

> 
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>   drivers/gpu/drm/xe/xe_hw_error.c     | 16 ++++++++++++++++
>   drivers/gpu/drm/xe/xe_hw_error.h     |  3 ++-
>   drivers/gpu/drm/xe/xe_irq.c          |  4 ++++
>   include/uapi/drm/xe_drm.h            |  8 ++++++++
>   5 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 2998ee517f0d..d2ee5549d20c 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -196,6 +196,9 @@ struct xe_tile {
>   	struct tile_hw_errors {
>   		struct xarray hw_error;
>   	} errors;
> +
> +	/** @gsc_hw_err_work: worker for uevent to report GSC HW errors */
> +	struct work_struct gsc_hw_err_work;
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 1e94ee72a34f..9ac817c1dd03 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -3,6 +3,8 @@
>    * Copyright © 2023 Intel Corporation
>    */
>   
> +#include <drm/xe_drm.h>
> +
>   #include "xe_hw_error.h"
>   
>   #include "regs/xe_regs.h"
> @@ -387,6 +389,19 @@ xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
>   		xe_gt_hw_error_log_vector_reg(gt, hw_err);
>   }
>   
> +void xe_gsc_hw_error_work(struct work_struct *work)
> +{
> +	struct xe_tile *tile = container_of(work, typeof(*tile), gsc_hw_err_work);
> +	char *csc_hw_error_event[3];
> +
> +	csc_hw_error_event[0] = XE_GSC_HW_HEALTH_UEVENT "=1";
> +	csc_hw_error_event[1] = "RESET_REQUIRED=1";
> +	csc_hw_error_event[2] = NULL;
> +
> +	kobject_uevent_env(&tile->xe->drm.primary->kdev->kobj, KOBJ_CHANGE,
> +			   csc_hw_error_event);
> +}
> +
...
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index d48d8e3c898c..06f6fce1531d 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -16,6 +16,14 @@ extern "C" {
>    * subject to backwards-compatibility constraints.
>    */
>   
> +/**
> + * DOC: uevent generated by xe on it's tile node.

What does 'tile node' mean?  If I'm not mistaken, isn't
tile->xe->drm.primary->kdev->kobj just the device node?

> + *
> + * XE_GSC_HW_HEALTH_UEVENT - Event is generated when GSC reports HW
> + * errors. The value supplied with the event is always "RESET_REQUIRED=1".
> + */
> +#define XE_GSC_HW_HEALTH_UEVENT "DEVICE_STATUS"

So both XE_RESET_FAILED_UEVENT and XE_GSC_HW_HEALTH_UEVENT are defined
as "DEVICE_STATUS".  Should be unique or isn't this going to be
confusing to the user reading these events?

-Brian


> +
>   /**
>    * DOC: uevent generated by xe on it's pci node.
>    *
