Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3C1C3DA6E
	for <intel-xe@archiver.kernel.org>; Thu, 21 Dec 2023 00:50:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CBA10E646;
	Thu, 21 Dec 2023 00:50:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFF210E644
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Dec 2023 00:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703119814; x=1734655814;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=V08LbT0IvNv3XSUKj04MYamCZSEph7Ul2RJ1YXzgxLE=;
 b=c5uEM1OrZEqNnakwzgvDn1co8+98GmUQq/ihMvUUyTN+kgaMWWJ3Uzi8
 TXOtxvRy5+mcMtfmtT2PWAs2ol80quvkCrr1zQx77pH4PmzsZgT4atCe4
 L3jqLzE8bT7sUDwZhZDWQDKe1lVo6WE8ZjgqgzlLJMsUkxfOzzaWUFbGm
 Xln4pVTxuWNF47rYpEbCWlys3Xjotk5QIb2ibrN6X0ZpzpXAJSahzZbI9
 RnrH0LCry7PjthBGAO9YuJM4mnb1xu7la3oDtyzhgVutZxP53vKnMfNmf
 9u62ORvWNFGjhSBNScRSqQu7TBUi4lmWwWoEZfLU6oMCtpV1Rxq1ReMW0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="380886204"
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; d="scan'208";a="380886204"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 16:50:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="780023325"
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; d="scan'208";a="780023325"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2023 16:50:13 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 16:50:13 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 16:50:13 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Dec 2023 16:50:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLRC+wBja+wZjgkpRqF2/qH5smcFqK+RKmpay0DUMUyX8bRMSvPYV+4GWOp8mPBuqdx8zOK44QMJO/zPPsqH3FRtTP/lK7KyrA8jMulvgz7mHILh+DZPIJScsiBVpgupOpispLxGMpgU80szbm6zXjUst1/HaUXVrlMn4oziK8ibsB3kA2t8tpTuMsdS6zYSnXwi7BEMVVbbqa9yGFM5K4DZOCtJTJBskV2ALpdfzbiPOCk6y7j1xVyCqzD/w9RdFqLlVIlO9D7QD0X6ub8G9Fogg7Tuo5n0/6hd2o75wRbgA9Xaje4hA50z3HaKred84AiPsa+73Yq1JGmATpBlEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPjvS6ns3JUeyOP7VwazTx+xhrtMZRc8Th2Il660CxY=;
 b=d/CqtaU8ZP4608D2GzI6EoGQKdJPkuqsTYC3ePv+g4bpT77lMwbA/1xw1sO5Uz2iPDOkHTLOp2uzIRaQZDbaSZdirLKBoYAPUJyW/d195pJJHwZybAtm13Z6dLW8NfFAswpXvWRZtmTO5SXtOrCvcIo8DJPvNAeMPZyJ3lfbkTT+ZcGwEUpGmMrr0UgnYDQOvedfYG/C+sEJbXgA8ciusg6ZBrMj2KC8pC7UpTHc1TV+94a51mo6shx826t1cHSBGw7VPtEGa5dEyqoaEW360P0kQFlWkmcBEMzv62dw9Z9CixhQrIzUwx51ae5QywdQxTzj4ax8PTJz/jazfDwZKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SA3PR11MB7436.namprd11.prod.outlook.com (2603:10b6:806:307::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.37; Thu, 21 Dec 2023 00:50:10 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9%7]) with mapi id 15.20.7113.016; Thu, 21 Dec 2023
 00:50:10 +0000
Date: Wed, 20 Dec 2023 16:49:59 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH v2 2/8] RFC drm/xe/guc: Add interface for engine busyness
 ticks
Message-ID: <ZYOLtyll4gC9RHyh@unerlige-ril>
References: <20231207125802.3730165-1-riana.tauro@intel.com>
 <20231207125802.3730165-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231207125802.3730165-3-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR04CA0332.namprd04.prod.outlook.com
 (2603:10b6:303:8a::7) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SA3PR11MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: 32ef703f-d32d-406d-26f5-08dc01bec893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VWsKawFcgRQhohhHTcab4AbAMaMeAeBF+P8uPskIKcoLyG//N1kmwrhAqAOOkkaydTZEEdg1TRn+eP59C5LwXClH8c6LbpGEhKhE9rS6K2mUbh+D29o+8nGWulVO8OKUlwuN9/atoJWWnuZiROa7Ohe+YQDTl8FJr6fHpZ9OScTIUs9Uos5zxthFDe9zARnKQTo3OaLCIGgF/p2y+J6ks83sQ90Fq9Aw2F1LW+CJ2UfUFbkR1KPHswyPAEz+pNokplcFRZE45UF2DDJHeaogwRIXPW3cVPh0Sy3v0hRcxIkS0sUwPHzt2BKAbagsp3LQsnBGV37F8wBKkROGoQWmMhYo3h7Cmh6mEOdQKkDh729pXf/On3s/NxBkTLr7YCGgLgzJedL65SCm1A/9YTJkSVhpBOXK1lS0pWLOtFUzZz+o+ekdNle7nG/0/vSJgBONBrYR2J5Yousp06jWVzQGRxk5b+sWoArKW376xUmCzdIRqohbl9GQEZFQG1EGeeZx33hPgj9a4zuxjByPdwJJwg+KFZjSTreJpB/psdFc1kERoORFmJHlRlVpfwCOQZLQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(366004)(396003)(39860400002)(136003)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(6862004)(26005)(8676002)(5660300002)(6512007)(30864003)(9686003)(6636002)(6666004)(41300700001)(6506007)(33716001)(478600001)(2906002)(8936002)(4326008)(316002)(66556008)(66476007)(66946007)(6486002)(82960400001)(86362001)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzBUNjQyazAxK2tTN3VyOGpPei9QL2JPdTdnbGdSc2NiNHNNMUd2c0t3TS91?=
 =?utf-8?B?alJDTFJNQU13NklHaklGQWlKYkRxMGM5Mk55blNybUVOL0U3T2tuMWI1UXc4?=
 =?utf-8?B?TXdIMFJtdnd5N2xKYUFXdXVWUnlYeFh2MG8wUmZJdkNxc2QxbDNPUUFxSmJR?=
 =?utf-8?B?ei8rWU1rZEdJZWw3MU9uSlZxOVdSQUQ1K1NicUhkb3FZZVNLWWp6YjQyMW5a?=
 =?utf-8?B?MERmYlZKQWYxUE80djVwVEx1Nk9yUzFUWWcyY2NmVkhQUHlHWWZDTHZZKzBq?=
 =?utf-8?B?Yzk0NFA5Y3MwcDdLTFN3TEhqSEROcks4NC9Na05md1dVZHhZc0x0cEgvRmZl?=
 =?utf-8?B?ZUpRSGNScWw1ZFpwZEx2aVA0cHpZbnkwY2pVWUVYcHFoditDSThFTVRNMVkv?=
 =?utf-8?B?YnJ1M0FKeVFaYU5DS2JjcjltTGMzNXc0Y1hZNTNMekk2WXRXdk9BY3ZjTHls?=
 =?utf-8?B?ZWs5QTN0V1R3N2JGOERXeTU0cWdOcDlKVDZ6alp0N2lDNXcwcjVyRWxOWld4?=
 =?utf-8?B?ZjNzMmJGYXdQVjdwMXJwdXNneG9pdXlYOUVUREF3Ty9BWkQrdGlxWDNCbUVr?=
 =?utf-8?B?WlAyMnZ6Z0VYOVlNWC9EbkkxRG51MWtCT0pXdmNNaml6WnhBYmpJOTlZNVQ4?=
 =?utf-8?B?Vld2TXVmMXhYQ0NEVHByL1dqSXJLSFFiSDlCTkRrTFBlVHRGTE1kQlNGTHBp?=
 =?utf-8?B?V3pObVhpc0hoQ2NUSDZZRGZ6cWRLekVVVDVDUGhrZGljTndjVzZINWhwcFVs?=
 =?utf-8?B?TlQ5NnI1MjhTWlArMDRYM2tTRTJPZXJXaExmZG5VNURlQjJTUUhZWUtNY1BT?=
 =?utf-8?B?MUgzV3RydXRwMXc1OWVQT0NOdjZZN2gzVmZxOEx1MXdkOVRnT0hIZ3M3VERz?=
 =?utf-8?B?RWw3dnRGaXNXcTV6TlpEUXdEUDdoOC9mVWxDenpleUZvZFhLZFZMdWpmZGdG?=
 =?utf-8?B?TFlZcldVRTVTN0dOb2FJcHJVdVdsRk04VXJheDFRcnk5Rkl1aEJzQlhXbmhk?=
 =?utf-8?B?dUMvWFhhWEh4MS9WOUtWUlAwWlRUb2h0Wm5EL2dEZ3JIZnFTa0pXMDNGd2cy?=
 =?utf-8?B?MGJCL2U0SU5VajNaRCszRnB3ZC9hSnJpSDc2RWRzR3llZXFyTGlLUW9rSTNN?=
 =?utf-8?B?a1ZYWGdsUEFnMXVSaVhNVUo4MTNMTk0wYkorZllKZzdibUdrMGgzTGxITXF1?=
 =?utf-8?B?SHpkT0h5U0xvSXFUWVY4TUxYTmt0SVZ2VmMwQ3l6MytXbjJPcVZ0OE9OR1Ji?=
 =?utf-8?B?bGhDejAyZDR4TEZ5WGcyamU1VGt6eXFDa2hGTjR0NGhuSUt0ZjBjUFlBZHJG?=
 =?utf-8?B?M1Npc1N0NXdiczVHNXNJVHFTLzdQY0xVUjhjamVyRnhxSVcvcXRlRWpJL3Fz?=
 =?utf-8?B?cnZzRGsrTjE5VG11UTR2b25RKzlzMkZJbzcycU5MY0RhaGhRRU1RUFpZNWdl?=
 =?utf-8?B?bkZvKzF3b2ZlbVdZeUN2Tzh1OXUwL1N2RlFsVU1GcitHWGpJNE83eVZFOVNY?=
 =?utf-8?B?RjJCUWRsLy9qQXE5czIrb1VQSmNYNDB0MzlqMjQxVEtoeWtBd3dYNXRmNVc1?=
 =?utf-8?B?MnVTQ3c2MkZmd3Q4NE1nelYxdFNNMWFueW5EdFlKUzk2Wnh3OXRoOERzVkkr?=
 =?utf-8?B?TEVvOHpITFlzWkpZSCtsZ3YyaHZrNG5talZ6amhoNWZrS1BHRDRxRFhhQVpY?=
 =?utf-8?B?OUtOSGZBcGtxa2VIRTFpVFFuUEtUemZGaHFoSzVzREhrMUEyNU8rRlFjSzds?=
 =?utf-8?B?V1FBV0sxY3Fma2E5TGpja1E1anZZN1c4a09sVjl2dUhzS2hRckRRRDQxM1NG?=
 =?utf-8?B?ZXhBODNrYUZ1TmZteE95NFE5djFRdXlDL3BQd25jN1ZxdXZ5NDlyaHFGVmdj?=
 =?utf-8?B?UFY5eHI1VHhhYjRlRXVQcFJObU4zYkY1TStuUSt2Yldpa3Byc0ZGTFFHTWx5?=
 =?utf-8?B?dkhDQXRZZXJiNmtocFNIQnpYTDV6RkltZFVVekNwdGpPWE1PSmRHWXBuSDhF?=
 =?utf-8?B?NEpqSi9hSmREY0NRcWhqbVJoQ3pZREh0RlhCcDlYM1VMcnNjb1I2YVlzRmRv?=
 =?utf-8?B?QnMramR5M2RKRDZCbjEyeE5Ta3JINVY3TllOekMzN256c0hDRkFncjdGdGsv?=
 =?utf-8?B?SWJsakMrOFRISTNGRjNKeUNPanoyNm8rdm42OW83a1QxZ3JIWG5RR1VodCtu?=
 =?utf-8?Q?cLF6GPEqs+nE8VjgtMhX+1o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ef703f-d32d-406d-26f5-08dc01bec893
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 00:50:10.2245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DJ6OIaUx3pTQhKNMGONSSJ0p0Etzzv+CpPxSuxCozcbbIrLrJoRnKt6aCJ83o6743svYYmhcz7DrjUHBPASS4+eudGfFhNewBAmLkTXkRIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7436
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

On Thu, Dec 07, 2023 at 06:27:56PM +0530, Riana Tauro wrote:
>GuC provides engine busyness ticks as a 64 bit counter which count
>as clock ticks. These counters are maintained in a
>shared memory buffer and updated on a continuous basis.
>
>Add functions that initialize Engine busyness and get
>the current accumulated busyness.
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/Makefile                 |   1 +
> drivers/gpu/drm/xe/abi/guc_actions_abi.h    |   1 +
> drivers/gpu/drm/xe/xe_gt.c                  |  13 ++
> drivers/gpu/drm/xe/xe_gt.h                  |   2 +
> drivers/gpu/drm/xe/xe_guc.c                 |   7 +
> drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 153 ++++++++++++++++++++
> drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  17 +++
> drivers/gpu/drm/xe/xe_guc_fwif.h            |  15 ++
> drivers/gpu/drm/xe/xe_guc_types.h           |   6 +
> 9 files changed, 215 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_busyness.c
> create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_busyness.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 86691f3b9077..7418e6a07bc8 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -83,6 +83,7 @@ xe-y += xe_bb.o \
> 	xe_guc_ads.o \
> 	xe_guc_ct.o \
> 	xe_guc_debugfs.o \
>+	xe_guc_engine_busyness.o \
> 	xe_guc_hwconfig.o \
> 	xe_guc_log.o \
> 	xe_guc_pc.o \
>diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>index 3062e0e0d467..d87681ca89bc 100644
>--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>@@ -139,6 +139,7 @@ enum xe_guc_action {
> 	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
> 	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
> 	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>+	XE_GUC_ACTION_SET_DEVICE_ENGINE_UTILIZATION = 0x550C,
> 	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
> 	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
> 	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 154d6c7072b9..3d735b66f60d 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -31,6 +31,7 @@
> #include "xe_gt_sysfs.h"
> #include "xe_gt_tlb_invalidation.h"
> #include "xe_gt_topology.h"
>+#include "xe_guc_engine_busyness.h"
> #include "xe_guc_exec_queue_types.h"
> #include "xe_guc_pc.h"
> #include "xe_hw_fence.h"
>@@ -783,3 +784,15 @@ struct xe_hw_engine *xe_gt_any_hw_engine_by_reset_domain(struct xe_gt *gt,
>
> 	return NULL;
> }
>+
>+/**
>+ * xe_gt_engine_busy_ticks - Return current accumulated engine busyness ticks
>+ * @gt: GT structure
>+ * @hwe: Xe HW engine to report on
>+ *
>+ * Returns accumulated ticks @hwe was busy since engine stats were enabled.
>+ */
>+u64 xe_gt_engine_busy_ticks(struct xe_gt *gt, struct xe_hw_engine *hwe)
>+{
>+	return xe_guc_engine_busyness_ticks(&gt->uc.guc, hwe);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>index a818cc9c8fd0..2e3cd7031287 100644
>--- a/drivers/gpu/drm/xe/xe_gt.h
>+++ b/drivers/gpu/drm/xe/xe_gt.h
>@@ -42,6 +42,8 @@ int xe_gt_resume(struct xe_gt *gt);
> void xe_gt_reset_async(struct xe_gt *gt);
> void xe_gt_sanitize(struct xe_gt *gt);
>
>+u64 xe_gt_engine_busy_ticks(struct xe_gt *gt, struct xe_hw_engine *hwe);
>+
> /**
>  * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the
>  * first that matches the same reset domain as @class
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 482cb0df9f15..6116aaea936f 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -18,6 +18,7 @@
> #include "xe_gt.h"
> #include "xe_guc_ads.h"
> #include "xe_guc_ct.h"
>+#include "xe_guc_engine_busyness.h"
> #include "xe_guc_hwconfig.h"
> #include "xe_guc_log.h"
> #include "xe_guc_pc.h"
>@@ -306,9 +307,15 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>
> int xe_guc_post_load_init(struct xe_guc *guc)
> {
>+	int err;
>+
> 	xe_guc_ads_populate_post_load(&guc->ads);
> 	guc->submission_state.enabled = true;
>
>+	err = xe_guc_engine_busyness_init(guc);
>+	if (err)
>+		return err;
>+
> 	return 0;
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>new file mode 100644
>index 000000000000..287429e31e6c
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>@@ -0,0 +1,153 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+#include "xe_guc_engine_busyness.h"
>+
>+#include <drm/drm_managed.h>
>+
>+#include "abi/guc_actions_abi.h"
>+#include "xe_bo.h"
>+#include "xe_guc.h"
>+#include "xe_guc_ct.h"
>+
>+/**
>+ * DOC: Xe GuC Engine Busyness
>+ *
>+ * GuC >= 70.11.1 maintains busyness counters in a shared memory buffer for each
>+ * engine on a continuous basis. The counters are all 64 bits and count in clock
>+ * ticks. The values are updated on context switch events and periodicaly on a
>+ * timer internal to GuC. The update rate is guaranteed to be at least 2Hz (but with
>+ * a caveat that is not real time, best effort only).
>+ *
>+ * engine busyness ticks (ticks_engine) : clock ticks for which engine was active
>+ */
>+
>+static void guc_engine_busyness_usage_map(struct xe_guc *guc,
>+					  struct xe_hw_engine *hwe,
>+					  struct iosys_map *engine_map)

indent slightly off

>+{
>+	struct iosys_map *map;
>+	size_t offset;
>+	u32 instance;
>+	u8 guc_class;
>+
>+	guc_class = xe_engine_class_to_guc_class(hwe->class);
>+	instance = hwe->logical_instance;
>+
>+	map = &guc->busy.bo->vmap;
>+
>+	offset = offsetof(struct guc_engine_observation_data,
>+			  engine_data[guc_class][instance]);
>+
>+	*engine_map = IOSYS_MAP_INIT_OFFSET(map, offset);
>+}
>+
>+static void guc_engine_busyness_get_usage(struct xe_guc *guc,
>+					  struct xe_hw_engine *hwe,
>+					  u64 *_ticks_engine)

I would swap the _ between the local ticks_engine and the one passed to 
the function or better just use a different name for the local variable.

>+{
>+	struct iosys_map engine_map;
>+	u64 ticks_engine = 0;
>+	int i = 0;
>+
>+	guc_engine_busyness_usage_map(guc, hwe, &engine_map);
>+
>+#define read_engine_usage(map_, field_) \
>+	iosys_map_rd_field(map_, 0, struct guc_engine_data, field_)
>+
>+	do {
>+		ticks_engine = read_engine_usage(&engine_map, total_execution_ticks);
>+
>+		if (read_engine_usage(&engine_map, total_execution_ticks) == ticks_engine)
>+			break;
>+	} while (++i < 6);
>+
>+#undef read_engine_usage
>+
>+	if (_ticks_engine)
>+		*_ticks_engine = ticks_engine;
>+}
>+
>+static void guc_engine_busyness_enable_stats(struct xe_guc *guc)
>+{
>+	u32 ggtt_addr = xe_bo_ggtt_addr(guc->busy.bo);
>+	u32 action[] = {
>+		XE_GUC_ACTION_SET_DEVICE_ENGINE_UTILIZATION,
>+		ggtt_addr,
>+		0,
>+	};
>+	struct xe_device *xe = guc_to_xe(guc);
>+	int ret;
>+
>+	ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>+	if (ret)
>+		drm_err(&xe->drm, "Failed to enable usage stats %pe", ERR_PTR(ret));
>+}
>+
>+static void guc_engine_busyness_fini(struct drm_device *drm, void *arg)
>+{
>+	struct xe_guc *guc = arg;
>+
>+	xe_bo_unpin_map_no_vm(guc->busy.bo);
>+}
>+
>+/*
>+ * xe_guc_engine_busyness_ticks - Gets current accumulated
>+ *				  engine busyness ticks
>+ * @guc: The GuC object
>+ * @hwe: Xe HW Engine
>+ *
>+ * Returns current acculumated ticks @hwe was busy when engine stats are enabled.
>+ */
>+u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>+{
>+	u64 ticks_engine;
>+
>+	guc_engine_busyness_get_usage(guc, hwe, &ticks_engine);
>+
>+	return ticks_engine;
>+}
>+
>+/*
>+ * xe_guc_engine_busyness_init - Initializes the GuC Engine Busyness
>+ * @guc: The GuC object
>+ *
>+ * Initialize GuC engine busyness, only called once during driver load
>+ * Supported only on GuC >= 70.11.1
>+ *
>+ * Return: 0 on success, negative error code on error.
>+ */
>+int xe_guc_engine_busyness_init(struct xe_guc *guc)
>+{
>+	struct xe_device *xe = guc_to_xe(guc);
>+	struct xe_gt *gt = guc_to_gt(guc);
>+	struct xe_tile *tile = gt_to_tile(gt);
>+	struct xe_bo *bo;
>+	u32 size;
>+	int err;
>+
>+	/* Initialization already done */
>+	if (guc->busy.bo)
>+		return 0;
>+
>+	size = PAGE_ALIGN(sizeof(struct guc_engine_observation_data));
>+
>+	bo = xe_bo_create_pin_map(xe, tile, NULL, size,
>+				  ttm_bo_type_kernel,
>+				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>+				  XE_BO_CREATE_GGTT_BIT);
>+
>+	if (IS_ERR(bo))
>+		return PTR_ERR(bo);
>+
>+	guc->busy.bo = bo;
>+
>+	guc_engine_busyness_enable_stats(guc);
>+
>+	err = drmm_add_action_or_reset(&xe->drm, guc_engine_busyness_fini, guc);

Wondering if we need to store the busyness values prior to reset and 
restore them afterwards. Depends on what type of reset this is. Does 
this reset GuC as well?

>+	if (err)
>+		return err;
>+
>+	return 0;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
>new file mode 100644
>index 000000000000..d70f06209896
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
>@@ -0,0 +1,17 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef _XE_GUC_ENGINE_BUSYNESS_H_
>+#define _XE_GUC_ENGINE_BUSYNESS_H_
>+
>+#include <linux/types.h>
>+
>+struct xe_hw_engine;
>+struct xe_guc;
>+
>+int xe_guc_engine_busyness_init(struct xe_guc *guc);
>+u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe);
>+
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>index 4dd5a88a7826..c8ca5fe97614 100644
>--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>@@ -37,6 +37,7 @@
> #define GUC_COMPUTE_CLASS		4
> #define GUC_GSC_OTHER_CLASS		5
> #define GUC_LAST_ENGINE_CLASS		GUC_GSC_OTHER_CLASS
>+#define GUC_MAX_OAG_COUNTERS		8
> #define GUC_MAX_ENGINE_CLASSES		16
> #define GUC_MAX_INSTANCES_PER_CLASS	32
>
>@@ -222,6 +223,20 @@ struct guc_engine_usage {
> 	struct guc_engine_usage_record engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
> } __packed;
>
>+/* Engine busyness stats */
>+struct guc_engine_data {
>+	u64 total_execution_ticks;
>+	u64 reserved;
>+} __packed;
>+
>+struct guc_engine_observation_data {
>+	struct guc_engine_data engine_data[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>+	u64 oag_busy_data[GUC_MAX_OAG_COUNTERS];
>+	u64 total_active_ticks;
>+	u64 gt_timestamp;
>+	u64 reserved1;
>+} __packed;
>+
> /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
> enum xe_guc_recv_message {
> 	XE_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
>diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
>index cd80802e8918..4e9602301aed 100644
>--- a/drivers/gpu/drm/xe/xe_guc_types.h
>+++ b/drivers/gpu/drm/xe/xe_guc_types.h
>@@ -70,6 +70,12 @@ struct xe_guc {
> 		u32 size;
> 	} hwconfig;
>
>+	/** @busy: Engine busyness */
>+	struct {
>+		/** @bo: GGTT buffer object of engine busyness that is shared with GuC */
>+		struct xe_bo *bo;
>+	} busy;
>+
> 	/**
> 	 * @notify_reg: Register which is written to notify GuC of H2G messages
> 	 */

Except for some minor comments above, this lgtm,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>


>-- 2.40.0
>
