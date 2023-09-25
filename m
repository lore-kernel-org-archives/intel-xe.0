Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A628CE7A95
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 15:36:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FE210E280;
	Mon, 25 Sep 2023 15:36:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8631A10E280
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 15:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695656174; x=1727192174;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3Xag3SU/aTZfgPyhfzO4X9XiVlUZ84NZZwZ0UJhWd80=;
 b=WV4YR5zxCvyW/kmr3SxTnzK28zIVQfTqzkZ4GMI6AH5WrUygGtuhP8US
 0k2aMlXSAaQSpIIDevX7BJxqlaTi6EAB6/0KKRkcVNXhGqHoqpuCEXOZZ
 FJIoXiawgorzSgmnY0OOIRQFixq2kRQPvYv6z2pCss7LxXQ6bqcladQG0
 ss+AkPcI2nzg6DrHN0cJgJ3gM/W4PxeJC6nYnuL483ymTP5mbzepdhRGU
 9Es/MUNFzJMJQftaRcVxjhGpo7pmC7u014zA1owDBdwR8VJCmrvCIh6X4
 diX/bucef+7AD18CP2mzL/abIQjReqMIUHohyyw2YW7ZgCPsxbl4Dwozq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="445389706"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="445389706"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 08:36:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="814015988"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="814015988"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 08:36:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 08:36:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 08:36:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 08:36:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 08:36:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0nmgCbgjb0TJHmHU4j5e2oUjc/Q0qDEmtIIh9m9H42myecjqstmRNq6SHHRgflMvxd52+WG05NjtFUv3dcqU/ie+/t2WiCe79jlHk999VXQZOv9JP9YYCcemB+XLLOh5nLI7FUqYP6F90wvHho4luNEniqKnV0ICETp2FcvLXZKOkU8w+DPGLCLDh3ZrQLPy0Bev2O19H19tKJQMFizyFnkyCy1NJsqYSuZ6CzsvdXA0PyExssT58kjIE0uZqLcYMALGpeEU4YOstcooyyEd1mDsikX93zTuiPW6DcJ+OxV0HKuJYQS0fHVZ5QjuRt34cJhhWPq0YDm2Tdixs0Afw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxRUEXg33/Ki3mKS9N8PL/MRrJ2cL8iHs2s9jREdfrA=;
 b=L34BOn3cl6tOHgaaHG6ECNk+B81n+ijK4zPCGMswuSSWURq5l//jTgLYEg0hmSzcni/qUmVhvWIfn80UfFpgh9M81dJb6Im+86CIA4xx3pOJapW6euIqFxeA0M7i2KwOSw6sSBn3uT7aeRD3aGGXhmqrSM5Y4dt694cTjb3jY8BUDp1f6acg8BphFukiPDDjH5iBuPAuqOAOi/0ybxs0oZShubfx3cYYRrWGf/UtytoxTpL8jX6rr54ZkMarkBF51sfBYDnYEv5JDE3ay0s6rify0tTpPjT0VZDcf4JTN31W3hlbAZgPO+tCnth2grVuyUrtFKz+kXQRhAc3oQiejA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 15:36:09 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::82e:c2f3:6b0f:3586]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::82e:c2f3:6b0f:3586%4]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 15:36:09 +0000
Message-ID: <49f3218e-d0d4-468e-b9f2-0de244c6f792@intel.com>
Date: Mon, 25 Sep 2023 21:06:00 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: <intel-xe@lists.freedesktop.org>
References: <20230925144359.192835-1-tejas.upadhyay@intel.com>
 <20230925144359.192835-3-tejas.upadhyay@intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230925144359.192835-3-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::19) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ0PR11MB5214:EE_
X-MS-Office365-Filtering-Correlation-Id: 5318dd31-fbaf-47a9-cd42-08dbbddd2418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TaxDEXduzYSTwnKDpLlecBSVI4CnWtyD8nBrIJJBQwmiQmoUnh25QBgihBLqytmoBKDNceNmFYHs6SBrvM0zdBtfzkXXcTCYBSiReVEAfI8+Ns7N/y2JWp5XH0r0Ou/DLCG1kGqrXyHn0+8tnfFY1J8yToPaxGMvGQzgubKxh+FhuQrsFxAkDU8NXN6iQE/WaN55k5yTt2B2KTMItgzfs7RIqm3TeaZhLZXfKHMN7CwZ/gY9WXXyM7bIs6yn1mgdZ7j7VlMF/3oWct2tnTwuWQ9rCZI9U5BmEAAocGzxYnslJ01+l3yjK0ve4l5lRmxK1QLpzwqoVWgQACU38VzK/BT+BF+vc+//YCbtFNDW2Ja1kDMEZxxjuB17Y1U+SKEtJ1V9ogu40mH4dJhpfJscJGlRfKSvQyFvPhpmYsLOyYVKvjV9cCgq4huDlu2MingGHfGAsbeY+bMBuBis2Cw9YQkw5jWyOP7jvcKopS2fiXqhJT+6p39EXgHjyPWdrDz3FirM6Bf/YP4mI5LJ+hyapZmghsqGGQVwl+byqtTcycxx5d7ug5ClUtCDXtjoY4wKUDxLvfSNJFj6TNKrt9YVlA2H8ygw7lhNQvJwMTLDvqNtQbznvl19ADS/QW4yI/dA2XxbTMEB+YXatlq/bp1B3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(346002)(136003)(396003)(376002)(366004)(230922051799003)(186009)(1800799009)(451199024)(2616005)(26005)(6486002)(6506007)(6512007)(53546011)(38100700002)(36756003)(82960400001)(31696002)(86362001)(83380400001)(8936002)(8676002)(316002)(41300700001)(6916009)(66476007)(66556008)(66946007)(5660300002)(15650500001)(30864003)(31686004)(2906002)(6666004)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlVNNWVqQk1FQkVBSGpwcXZIeEdvRnBvZ1U3bC9vQkZJYkxPUzc5eHBTQlVq?=
 =?utf-8?B?dEFGSEgza1dXUzQ2Si8vdCs1QnBQNlAzckIrTGZwMDNvSUFrTW9mV3YxMkNW?=
 =?utf-8?B?NCszUEkyOHoxOUozTWdNS1BJNCtxb1NRVlBoUURnZXNNVS9VcDBwSU5VNjVZ?=
 =?utf-8?B?ajRzTUo4ZDgyTUdMbjlnajlTV2dxOFJpRDJFNDF0dXYvZHdDUWhwdTdSMStN?=
 =?utf-8?B?MlVYY1ZJN095NWFZaVBHUWNGYzZnanhzL3djY2pCemlNRkFYcnE1eVNRZitr?=
 =?utf-8?B?Sm5UL3g1bGt6ZVFIOXpqOThrU2dxQXRqZ2VSU1RHcnJab1hqTG9aMTJETlJx?=
 =?utf-8?B?QlFsUDgzaUZWOGdHdnhQV21ZazlVOFRuVUwwZjZBeE5IcVd1QWRUWjluQTVT?=
 =?utf-8?B?Y2hRbEFGaUlmS3Y3UkN0TzRSTk15Wm54UTBXdDBFOEZRekg1aHZNRkZKUTBE?=
 =?utf-8?B?ejFhekJoRTV3Mk1EbXB3eDdRaWx0dFZxY0ZtaWROM0c4cHZJZmdZVDNYQTJv?=
 =?utf-8?B?MlhqdUJiMTgyNkJrcEJxeE5oQlFKUzVpVlFnaDZDQ0tEeXhlTnNPY3J5V0E2?=
 =?utf-8?B?VXBBRzUxdTR2ZzRWQ1g3UENzVUpNT2FhRW1UcFJoaFBmMkI1QXlEVVdJNHp3?=
 =?utf-8?B?MVUweDVZTnYwOEpYckRZYThrbWp2UUxUS0xCQmRWMWgxWnh3U2cvdVAyUDdq?=
 =?utf-8?B?MVE1cXpLUmtnTmUxREJTUHphelQrQmtLZ1d2a0JZa293a2VXYkdOVkF1QjE1?=
 =?utf-8?B?VjZ5aWVaWWY1VUx5WUtKTzlZWFNKOXJkTTFnaG94R25DWHhXeldlWjRGK2E5?=
 =?utf-8?B?bVpqNkVKY0dlZ2lvRGJhNklhclQxM2JnNWtwTjBtYm5YWDNFRjFoNnpLbE5q?=
 =?utf-8?B?djZjbytRVFZLNkJPbGY4U0F2ckdlNmJrNFJRQTFzZWxIMWpqYUpUWVV6LzV5?=
 =?utf-8?B?d09ndVpXWlVJWUhuUUpKVHVLMEh2empqUmlaRVkzS0g5VkZaMDFUQjZhMGQv?=
 =?utf-8?B?OEtjdTdDNHd1TjBMN0pOUGZlaDFwSEh6bVg1dVJZclZyMHNZQ3V0M2dTaUlj?=
 =?utf-8?B?RkRFQ3prcFdCMEc5R2Nya0lDcXpab2hjY2h0dXZGTDlGV3EzTTBzN2Q5eEI5?=
 =?utf-8?B?VUxVSUltSW9LOXNveTY0b1VuKzlHcllXQXBjOHlNQjVxaHY2ZjhjbXVYMnJk?=
 =?utf-8?B?N1FBTTRjQWRRTWN5d0FjV0JFUkdvVVZNTGdOR1ZPSDdVd01DYzU2SVl0TzFX?=
 =?utf-8?B?SGdLU0ZTVG02VFF0MEg5d0R5SzdYT3hhMFg0RmxjUWdHSFlwakQvejM4QVJr?=
 =?utf-8?B?dXlTc2xjVWpDOVc0Q0FiMDV1YVpVd3lyQlc5VmFXR090MS8rbXJ4NzRnSDRO?=
 =?utf-8?B?Z21mNkZmOTVDRWZkWG5YdlYzZUJxYnZISlpaVHZORG5ieHZjb1M0N3FtbTNT?=
 =?utf-8?B?Yjhnb1hKS0FhTjRsaSswT3BtYnpQcEV3YXdkbVpRSTh2Vko1Q3Z1aXZadkdi?=
 =?utf-8?B?aVJhSkF0VFczT0dvYmVFbXovU3hyTTI4Yk5tWlAzVDYzK2VkMkFVaXdFZmJK?=
 =?utf-8?B?YjJQVlhuNUYraXhlSE5adm1sQ0IwRXFoVjgzaTdYV3VyRXJlUzI2a3dCMGFO?=
 =?utf-8?B?WjEyb0luclpzRzQvMmdBSzJHSjdCckY3VUp2N2FPN0hYcHJMM2ZCM2NXZ2FK?=
 =?utf-8?B?ZloxYWhFTnZ1N2FDZnFMS1RvUnVIdGJRL1lIVlNOS2lPWUo0ZFNscjZtWUdk?=
 =?utf-8?B?M1FIRVpMWENhYnFZVi9rMkxDMVk5YXVTQnVqTmZ3WUlrMTd6OGNSS1QrYkJY?=
 =?utf-8?B?OG1KemVRQjE0S2ppekY3QTBMRytFazUxN3AyNTNXbWNML1FLODU4N1c4eE1v?=
 =?utf-8?B?TVUrSHNLQyttQnpUaTBwYldSSTRSNWE3V0U4NzRERXZ1UGhoNGE3WUUvRWlE?=
 =?utf-8?B?K3Y4bjB3anlIODlvS2gyN21PKzh4OTkwM2QyeXliRzgxbnhCTE8xdURWUk0r?=
 =?utf-8?B?SHg0eTlZbGYxTkVWQjFqR2lDQzQ1UFlEb2xpT1pkL0FYODZMc2lmT005UkpU?=
 =?utf-8?B?U1hDMjlyM0d4YkxZTVZvRDJZL2ZPMXovMWNxRmVEUHlkcXo1ZEJkYkI5ZjFt?=
 =?utf-8?B?ZUUwVkFCY0hHM20wbVY4VFhnZkxqRGViZGZFdG8xR1JnZVFqd01JSmZERkFs?=
 =?utf-8?Q?MUsZSa9Uzw4zH0F7zIlhV10=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5318dd31-fbaf-47a9-cd42-08dbbddd2418
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 15:36:09.7871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2Ie4t0DIa8b2rS5dqSAzwZj5kdIh4Ug5YvO0k3fIv8jCUzdYBuvSKIYhCtHADFEcPeJGBpQ7RNk3DfU7D02pkf7rf2BNMSw3XSykzlXcBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5214
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3 2/2] drm/xe: Update counter for low level
 driver errors
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


On 25-09-2023 20:13, Tejas Upadhyay wrote:
> we added a low level driver error counter and incrementing on
> each occurrance. Focus is on errors that are not functionally
> affecting the system and might otherwise go unnoticed and cause
> power/performance regressions, so checking for the error
> counters should help.
>
> Importantly the intention is not to go adding new error checks,
> but to make sure the existing important error conditions are
> propagated in terms of counter under respective categories like
> below :
> Under GT:
> driver_gt_guc_communication,
> driver_gt_other_engine,
> driver_gt_other
>
> Under Tile:
> driver_ggtt,
> driver_interrupt
>
> TODO: Currently this is just a counting of errors, later these
> counters will be reported through netlink interface when it is
> implemented and ready.
>
> V2:
>    - Use modified APIs
>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 ++
>   drivers/gpu/drm/xe/xe_guc.c                 |  3 +++
>   drivers/gpu/drm/xe/xe_guc_ct.c              | 11 ++++++++++-
>   drivers/gpu/drm/xe/xe_guc_pc.c              |  8 ++++++--
>   drivers/gpu/drm/xe/xe_guc_submit.c          | 10 ++++++++++
>   drivers/gpu/drm/xe/xe_irq.c                 |  1 +
>   drivers/gpu/drm/xe/xe_reg_sr.c              |  4 ++++
>   7 files changed, 36 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index bd6005b9d498..0a9c96316599 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -37,6 +37,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>   		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
>   		drm_err(&gt_to_xe(gt)->drm, "gt%d: TLB invalidation fence timeout, seqno=%d recv=%d",
>   			gt->info.id, fence->seqno, gt->tlb_invalidation.seqno_recv);

How about embedding the info related to error category in drm_err too ? 
This way apart from counters logs can also be reporting the error type.

> +		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GGTT);
>   
>   		list_del(&fence->link);
>   		fence->base.error = -ETIME;
> @@ -331,6 +332,7 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
>   	if (!ret) {
>   		drm_err(&xe->drm, "gt%d: TLB invalidation time'd out, seqno=%d, recv=%d\n",
>   			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
> +		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GGTT);
>   		return -ETIME;
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 84f0b5488783..2f3f3b814455 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -665,6 +665,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>   timeout:
>   		drm_err(&xe->drm, "mmio request %#x: no reply %#x\n",
>   			request[0], reply);
> +		xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_GUC_COMM);
>   		return ret;
>   	}
>   
> @@ -699,6 +700,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>   
>   		drm_err(&xe->drm, "mmio request %#x: failure %#x/%#x\n",
>   			request[0], error, hint);
> +		xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_GUC_COMM);
>   		return -ENXIO;
>   	}
>   
> @@ -707,6 +709,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>   proto:
>   		drm_err(&xe->drm, "mmio request %#x: unexpected reply %#x\n",
>   			request[0], header);
> +		xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_GUC_COMM);
>   		return -EPROTO;
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 2046bd269bbd..1dbfea2f39ac 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -734,6 +734,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   	if (!ret) {
>   		drm_err(&xe->drm, "Timed out wait for G2H, fence %u, action %04x",
>   			g2h_fence.seqno, action[0]);
> +		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
>   		xa_erase_irq(&ct->fence_lookup, g2h_fence.seqno);
>   		return -ETIME;
>   	}
> @@ -746,6 +747,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   	if (g2h_fence.fail) {
>   		drm_err(&xe->drm, "Send failed, action 0x%04x, error %d, hint %d",
>   			action[0], g2h_fence.error, g2h_fence.hint);
> +		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
>   		ret = -EIO;
>   	}
>   
> @@ -842,6 +844,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   		drm_err(&xe->drm,
>   			"G2H channel broken on read, origin=%d, reset required\n",
>   			origin);
> +		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
>   		ct->ctbs.g2h.info.broken = true;
>   
>   		return -EPROTO;
> @@ -861,6 +864,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   		drm_err(&xe->drm,
>   			"G2H channel broken on read, type=%d, reset required\n",
>   			type);
> +		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
>   		ct->ctbs.g2h.info.broken = true;
>   
>   		ret = -EOPNOTSUPP;
> @@ -919,11 +923,13 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   		break;
>   	default:
>   		drm_err(&xe->drm, "unexpected action 0x%04x\n", action);
> +		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
>   	}
>   
>   	if (ret)
>   		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d\n",
>   			action, ret);
> +		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
>   
>   	return 0;
>   }
> @@ -960,6 +966,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>   		drm_err(&xe->drm,
>   			"G2H channel broken on read, avail=%d, len=%d, reset required\n",
>   			avail, len);
> +		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
>   		g2h->info.broken = true;
>   
>   		return -EPROTO;
> @@ -1026,9 +1033,11 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   		drm_warn(&xe->drm, "NOT_POSSIBLE");
>   	}
>   
> -	if (ret)
> +	if (ret) {
>   		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d\n",
>   			action, ret);
> +		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
> +	}
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 8a4d299d6cb0..c9501229a0ac 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -196,9 +196,11 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
>   
>   	/* Blocking here to ensure the results are ready before reading them */
>   	ret = xe_guc_ct_send_block(ct, action, ARRAY_SIZE(action));
> -	if (ret)
> +	if (ret) {
>   		drm_err(&pc_to_xe(pc)->drm,
>   			"GuC PC query task state failed: %pe", ERR_PTR(ret));
> +		xe_gt_report_driver_error(pc_to_gt(pc), XE_GT_DRV_ERR_GUC_COMM);
> +	}
>   
>   	return ret;
>   }
> @@ -218,9 +220,11 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
>   		return -EAGAIN;
>   
>   	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> -	if (ret)
> +	if (ret) {
>   		drm_err(&pc_to_xe(pc)->drm, "GuC PC set param failed: %pe",
>   			ERR_PTR(ret));
> +		xe_gt_report_driver_error(pc_to_gt(pc), XE_GT_DRV_ERR_GUC_COMM);
> +	}
>   
>   	return ret;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 19abd2628ad6..ba4494c3981b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1497,12 +1497,14 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
>   
>   	if (unlikely(guc_id >= GUC_ID_MAX)) {
>   		drm_err(&xe->drm, "Invalid guc_id %u", guc_id);
> +		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
>   		return NULL;
>   	}
>   
>   	q = xa_load(&guc->submission_state.exec_queue_lookup, guc_id);
>   	if (unlikely(!q)) {
>   		drm_err(&xe->drm, "Not engine present for guc_id %u", guc_id);
> +		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
>   		return NULL;
>   	}
>   
> @@ -1532,6 +1534,7 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   
>   	if (unlikely(len < 2)) {
>   		drm_err(&xe->drm, "Invalid length %u", len);
> +		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
>   		return -EPROTO;
>   	}
>   
> @@ -1543,6 +1546,7 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   		     !exec_queue_pending_disable(q))) {
>   		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
>   			atomic_read(&q->guc->state));
> +		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
>   		return -EPROTO;
>   	}
>   
> @@ -1577,6 +1581,7 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   
>   	if (unlikely(len < 1)) {
>   		drm_err(&xe->drm, "Invalid length %u", len);
> +		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
>   		return -EPROTO;
>   	}
>   
> @@ -1588,6 +1593,7 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   	    exec_queue_pending_enable(q) || exec_queue_enabled(q)) {
>   		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
>   			atomic_read(&q->guc->state));
> +		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
>   		return -EPROTO;
>   	}
>   
> @@ -1611,6 +1617,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   
>   	if (unlikely(len < 1)) {
>   		drm_err(&xe->drm, "Invalid length %u", len);
> +		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
>   		return -EPROTO;
>   	}
>   
> @@ -1646,6 +1653,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>   
>   	if (unlikely(len < 1)) {
>   		drm_err(&xe->drm, "Invalid length %u", len);
> +		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
>   		return -EPROTO;
>   	}
>   
> @@ -1672,6 +1680,7 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
>   
>   	if (unlikely(len != 3)) {
>   		drm_err(&xe->drm, "Invalid length %u", len);
> +		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
>   		return -EPROTO;
>   	}
>   
> @@ -1682,6 +1691,7 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
>   	/* Unexpected failure of a hardware feature, log an actual error */
>   	drm_err(&xe->drm, "GuC engine reset request failed on %d:%d because 0x%08X",
>   		guc_class, instance, reason);
> +	xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_ENGINE);
>   
>   	xe_gt_reset_async(guc_to_gt(guc));
>   
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 504cb94d0ee8..654c9f34b162 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -224,6 +224,7 @@ gt_engine_identity(struct xe_device *xe,
>   	if (unlikely(!(ident & INTR_DATA_VALID))) {
>   		drm_err(&xe->drm, "INTR_IDENTITY_REG%u:%u 0x%08x not valid!\n",
>   			bank, bit, ident);
> +		xe_tile_report_driver_error(gt_to_tile(mmio), XE_TILE_DRV_ERR_INTR);
>   		return 0;
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 87adefb56024..2b3fe4ff2009 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -131,6 +131,7 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>   		  str_yes_no(e->reg.masked),
>   		  str_yes_no(e->reg.mcr),
>   		  ret);
> +	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS);
>   	reg_sr_inc_error(sr);
>   
>   	return ret;
> @@ -208,6 +209,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>   
>   err_force_wake:
>   	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
> +	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS);
>   }
>   
>   void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
> @@ -237,6 +239,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>   			xe_gt_err(gt,
>   				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
>   				  hwe->name, RING_MAX_NONPRIV_SLOTS);
> +			xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_ENGINE);
>   			break;
>   		}
>   
> @@ -260,6 +263,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>   
>   err_force_wake:
>   	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
> +	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS);
>   }
>   
>   /**
