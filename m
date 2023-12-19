Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA8DC46CCD
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 16:12:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C29A10E19D;
	Tue, 19 Dec 2023 16:12:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B70110E19D
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Dec 2023 16:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703002335; x=1734538335;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=m/HUwjWFDpuICfBFmdQWbWesJ3KfwYkFUIfxm53W2lU=;
 b=gPcmQgyvOT/FXGTxnC70Rph0FkzHVkIU6GLX0A95kloVuGcJOvEF3lNS
 D0J/IPmGB5v3tF7lnR72DT0tUNdH7s1Hl3wUFMDq8WNAxGehHP+PLRDot
 IZZG5g7OTlVbb622cuEdzJHOJgWZ9l0mp3OrvoFVtGFBezYpyHK/Bso37
 Rhn8gzoBYj0g7Yi9xXB71mFRnrTAEPJ1I++ZdZg8ntJsCcMADrcHZu/Zc
 EJZJgV9HRvdodSVWYvfjO8jrb73rOl2hA2sM+N+nLrw+ONqkz5ysXfYt0
 QguZHNxDLs+v4WOFxT4i5QC2sqBHlKvcnlTezb/NFVBlT4ith3CrPrKcP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="2505221"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="2505221"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 08:12:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; d="scan'208";a="17655510"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2023 08:12:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 08:12:13 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Dec 2023 08:12:13 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Dec 2023 08:12:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0DBAnhtZ0P8k3s6R4lTqA6dKIcIjL2/cmuxMu6E8z8XmNeVProIGA9G1kn6pikhfyL2BlspELtSmzfNtICc8J4WGHDc7IZS5qmt6eOqe+kGUbYsFcAIyz/w77kV++HfDBBj2baSBFfKTnnpR3ibYVHnxRPE8G5DPDaJXGSR74P20Ib1fj4ZvBFZz1s82Y3VdTJ2+RIdXerMxIpLPNRSdnUzJj1e/vqFFBM23oDGtYOVZu07FdfMjCdkgN2ZDmvXhoC7K/KmyBeZOL0qklbimLW8uCTeg4a5E3Ot2H6W2W7lLsReMsxcMY5P9le2Ud7S10iweGSMK40Rw7VldpIcqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pd8lJY0QTZ9m/xNumCBtt2FV1MbGx6dtcphsvpmj5Xg=;
 b=R0kWVdLkgysix/dRXWLYIeNFh5ghpPB1f15YVww0DcLj6Aq/SNE1ktwB502V+8tuyqhWemfgPrQaRjIMfGRZO5AAnJKI6ODjlLw0Z7+J6U7xnXO2LzJGzLb09ZsgC7vsZZPSBo5OjqFjgWeaO/Xb1s4Lx65+MpYcOc3SZNCpOMClIcXVq695W5l1BTzipou0hOiB89eXep5gstc9OkgEkOk28yZnvEV+2WtNJ1kgqsLGDcb7huQFwqtREIM0qpUOjXF5PWhHUrzxL/cL9INYdRmeWYEtZ1bjJq25Lk8G7ZVXd9sxkKsmGUvCJuPoG67+EtH3unVlGScEJMTcY1W4MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 DS7PR11MB7857.namprd11.prod.outlook.com (2603:10b6:8:da::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.18; Tue, 19 Dec 2023 16:12:08 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9%7]) with mapi id 15.20.7113.016; Tue, 19 Dec 2023
 16:12:08 +0000
Date: Tue, 19 Dec 2023 08:11:58 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 05/17] drm/xe/oa/uapi: Initialize OA units
Message-ID: <ZYHAznF+ot7+LHKw@unerlige-ril>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
 <20231208064329.2387604-6-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231208064329.2387604-6-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0071.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::16) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|DS7PR11MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: 97df473d-5259-4361-f9f9-08dc00ad3fc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0sm8vJG/lPXTGd2ww221QyELwgYe+g5wX1kxUYjrpW2yf+p6F2XhbSi9aSopK3rwtzbmAddqTdHLodg9eXbjHxoGHH2r4nPj3zWwtsb1DoQeV/jDUKDc/pTqIXxMpdq2+7DqoGCqBSLASiv3HfmXetb/ymrl6I4yHTjjl0DaAK9A6PuvX530o9y05xxYn4GtUJc8OIapSxG+FBQnhhHG+XmjUf8xVd7j2EpE7nvX23oXCs0FpSVTC0f/yJNFFMHPiuCYwtE/xGQ4L8FAA0YTMc1qbaxOBZ7DKUVwuHF/1yG9sFeOrLFqshZNLwRp0OB2QQodm/LpbKVO/vK2uPE2wrt0UpoRi7VAfj2ldBOpfPqXhcJN0RCrLBZ153WTGFCTR0BUxM7PX90hExhPoSyuvI5S62dVem9OLz8pyz3erFDYLQJjkH/CMDXGbV1LBqXU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(346002)(366004)(376002)(136003)(396003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(83380400001)(6636002)(316002)(66476007)(66946007)(66556008)(5660300002)(30864003)(2906002)(8936002)(8676002)(4326008)(6862004)(6506007)(6512007)(9686003)(6666004)(26005)(6486002)(478600001)(86362001)(41300700001)(33716001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW9sQVQzckJqT2NnNUQ2SWRja0xMTEgvelZJd3c4Ui9PR0hwTkZYSWR0Wlkr?=
 =?utf-8?B?Z1B1Y25wMDN4bnJiS093TFVSa2RYei9WdTNCV2V4S1B4d3BVcXNMRFVzNGtP?=
 =?utf-8?B?R1B3UjVKNW9VcWlBcnpkQndSVzI2NzU3K0JpbTZHQnNZL3NNZ25mK2M4NkNi?=
 =?utf-8?B?d3o2bW80Nm5INkFzK1dKcnU3cWJPVkZkazhMWkRZN0RVckl4OUltcU9BeTRH?=
 =?utf-8?B?bmY1eUJiaE5ITnBUWEI0eDdTWExoSW53Y1lqVkJJazI5OElhSktQU0dkWUpG?=
 =?utf-8?B?ZWZ5UlBFWGNjbklTdGpLdlgwZFI0Y3pKYU1zQVgvRXkyUGEwbEZIMkxUdktF?=
 =?utf-8?B?SkVJSFZvdlluNFZnOFQzZC9VUDFURklOMUdDUit4U0F4NnFqYU5UWEdIL1J6?=
 =?utf-8?B?S0RCWDFpcFo0cTg5bEVBekh0V1lpa2VmS1d6NGJ6dEh2dEU3L3RCemljK2NJ?=
 =?utf-8?B?MzV6S00xNnoyRitzV3llKzNSNW1UUFBvRlRrcXNudnJnS0VWaXRFczljd1lC?=
 =?utf-8?B?Ymgweit5alNaMUxBSU5UTjkvR1hpQ1pyVWU3WE1vUnEyQjJNQm5KSnZQN05L?=
 =?utf-8?B?WlZHTmtvQkVZUDYvY1o0RmpOK1lzbXlheUZaYlBiaG94VEtyS1hyVGpjL2tF?=
 =?utf-8?B?VnROL1p5YlNISFg0dFRNa2hDZm9QYXF6UEJRdHE0QUZjai9rN0ZzUU9XZVdU?=
 =?utf-8?B?MEVPeFBMUGVtVks0K1lobWpPczU1dFJKblNrTVYrT0FrOEdQTGMrN2xwb3Ra?=
 =?utf-8?B?cnhwWjZNR1BiekZXU3k5YW5vRVF0TFVqSXZEOXlxV3RMTWYySzhqYTlxNEpB?=
 =?utf-8?B?WllPVENBSTRlS3pjMFNrNTlqbWc3WURmTE5EQ3BQQ0JRTkR2Ky96dnFHbU9U?=
 =?utf-8?B?R3g0bUF5SFFEcjZtZXRuejNoVTM4bXdRei9uS21ET0s0ajJYQ2ptVEIwM2k1?=
 =?utf-8?B?UGZGREtmRXo1cXVqQXpPTW1ESlU0NUppTWZycFR4a1hJbVRDOEdoOG5WaW5m?=
 =?utf-8?B?eEcvRXhiMUQxN2l4bWIrT2VITEdCL2lTMCs2ejFFYXc2N3pyUS9rcjBiSkkw?=
 =?utf-8?B?dFhyd1FkMnlpQVZuVDdjMmxnYkU2UmZNaElLd3pJNXBXZk0zWFhkbVVRanhv?=
 =?utf-8?B?bnp1R09udUViUTlFZ1NQS20wSzJSVlhyMjZpZ1Q4N3g2eFhJeTY2OHNBTlpI?=
 =?utf-8?B?MUpQTno3WU1HWktNTjBpQi82ajRuekZOZ25yUEtLbEZGNGJRR0hsVGVMZ0Uw?=
 =?utf-8?B?QzVBdVZkckgxdHJEb1pGNHF4RWdzL243ZVdEbkVLUDFiT3M2R2pwUkJNN3dM?=
 =?utf-8?B?TjZTS3RBd0hIRGE4SHpVNlZCWjgyT0lSTkNxZjMxWG01bno5TTNkdjVqaXNI?=
 =?utf-8?B?UHI2c0lEeENuWVR3UmNkckZnSWc1TWhkanUyak1HMHFxUVdvZEpHL1BQek5r?=
 =?utf-8?B?LzNUb3daU3V3Z2FxWWVoMGpOeEoySUtRenlieExFRmZISWxuS0dFL2hzYTNT?=
 =?utf-8?B?eU9RamQ1d0hoWnZaTmd6NmV6Zk01d2dVV0FEM2sya3JxMmFOQ3ZvTXpxSGJN?=
 =?utf-8?B?ODk4N3lFZ3I2OXk1TnRuUWNMYWp3eHJFbUFPVGdSOHFhL1hRMUgrS3pYckRZ?=
 =?utf-8?B?ME56eElkcWNScDAxWm04QVJrZ05mQTlmWWhzTjRLbjZ3a2NUSjNESnh4THI3?=
 =?utf-8?B?dnZBMGlLUnhJNUJ0TEdxQzJIRkhVSXgwcEZyMlA3c3pzS0R3NURpN25mb2Zk?=
 =?utf-8?B?TEcxMitOWHdUMFBaRlNVWkR1bHYyenJsb09ZWUpYUkZPdTQ2M3RTeEJhOGtN?=
 =?utf-8?B?NFZuNHlCaWQ4MTROWFpteDhHQ0QyQnZMZFZVZWdrTmxvRVFyY1ByRmdHWWFr?=
 =?utf-8?B?U0N4U01MYVNhVldkSXk0NXpFcnBpaW1tdUN4ZnlWcE1QOTdZNE1TMGp5eG1O?=
 =?utf-8?B?clhUL3RGa0RmMjJVVm4vOGRkbmJMNy9KQXdKaVQ1aTR3N0pjYTUzSzYxUXZt?=
 =?utf-8?B?QUUzOHdQN0pKL0pPWlp1VXczTHgrampEb3lIZng3UG1oTUV3VkNoais5b1lQ?=
 =?utf-8?B?SERUQjVuTTVhZ1lzWTNYNFFSbnJaT21UREI1M1c2VC9XWFRhMEcxTWgwZ1pa?=
 =?utf-8?B?NGdkdG9HU3RNWHNaZkNwWkY4ajY1THhuRnFMcUVRbkE4bXFwOHM3N0pOZEsw?=
 =?utf-8?Q?uacD3tC7s9PX5lCG+/w+5Gk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97df473d-5259-4361-f9f9-08dc00ad3fc6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 16:12:08.1381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DZ0VkBazUpxw9uUE4P/K7nMXho++M6HZgJtC7QiGBIMwQdeaGe/eSGiMvXYkejZVw7h7pIF25cvd71QiASdh1wwyM0cfnWILY3oZYbkjYaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7857
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

On Thu, Dec 07, 2023 at 10:43:17PM -0800, Ashutosh Dixit wrote:
>Initialize OA unit data struct's for each gt during device probe. Also
>assign OA units for hardware engines.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_oa_regs.h    |  96 ++++++++++++++
> drivers/gpu/drm/xe/xe_gt_types.h        |   4 +
> drivers/gpu/drm/xe/xe_hw_engine_types.h |   2 +
> drivers/gpu/drm/xe/xe_oa.c              | 169 ++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_oa_types.h        |  56 ++++++++
> include/uapi/drm/xe_drm.h               |   6 +
> 6 files changed, 333 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/regs/xe_oa_regs.h
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>new file mode 100644
>index 0000000000000..4455a5a42b01b
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>@@ -0,0 +1,96 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef __XE_OA_REGS__
>+#define __XE_OA_REGS__
>+
>+#define REG_EQUAL(reg, xe_reg) ((reg) == (xe_reg.addr))
>+#define REG_EQUAL_MCR(reg, xe_reg) ((reg) == (xe_reg.__reg.addr))
>+
>+#define RPM_CONFIG1			XE_REG(0xd04)
>+#define   GT_NOA_ENABLE			REG_BIT(9)
>+
>+#define EU_PERF_CNTL0			XE_REG(0xe458)
>+#define EU_PERF_CNTL4			XE_REG(0xe45c)
>+#define EU_PERF_CNTL1			XE_REG(0xe558)
>+#define EU_PERF_CNTL5			XE_REG(0xe55c)
>+#define EU_PERF_CNTL2			XE_REG(0xe658)
>+#define EU_PERF_CNTL6			XE_REG(0xe65c)
>+#define EU_PERF_CNTL3			XE_REG(0xe758)
>+
>+#define OA_TLB_INV_CR			XE_REG(0xceec)
>+
>+/* OAR unit */
>+#define OAR_OACONTROL			XE_REG(0x2960)
>+#define  OAR_OACONTROL_COUNTER_SEL_MASK	REG_GENMASK(3, 1)
>+#define  OAR_OACONTROL_COUNTER_ENABLE	REG_BIT(0)
>+
>+#define OACTXCONTROL(base) XE_REG((base) + 0x360)
>+#define OAR_OASTATUS			XE_REG(0x2968)
>+#define  OA_COUNTER_RESUME		REG_BIT(0)
>+
>+/* OAG unit */
>+#define OAG_OAGLBCTXCTRL		XE_REG(0x2b28)
>+#define  OAG_OAGLBCTXCTRL_TIMER_PERIOD_MASK	REG_GENMASK(7, 2)
>+#define  OAG_OAGLBCTXCTRL_TIMER_ENABLE		REG_BIT(1)
>+#define  OAG_OAGLBCTXCTRL_COUNTER_RESUME	REG_BIT(0)
>+
>+#define OAG_OAHEADPTR				XE_REG(0xdb00)
>+#define  OAG_OAHEADPTR_MASK			REG_GENMASK(31, 6)
>+#define OAG_OATAILPTR				XE_REG(0xdb04)
>+#define  OAG_OATAILPTR_MASK			REG_GENMASK(31, 6)
>+
>+#define OAG_OABUFFER		XE_REG(0xdb08)
>+#define  OABUFFER_SIZE_MASK	REG_GENMASK(5, 3)
>+#define  OABUFFER_SIZE_128K	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 0)
>+#define  OABUFFER_SIZE_256K	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 1)
>+#define  OABUFFER_SIZE_512K	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 2)
>+#define  OABUFFER_SIZE_1M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 3)
>+#define  OABUFFER_SIZE_2M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 4)
>+#define  OABUFFER_SIZE_4M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 5)
>+#define  OABUFFER_SIZE_8M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 6)
>+#define  OABUFFER_SIZE_16M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 7)
>+#define  OAG_OABUFFER_MEMORY_SELECT		REG_BIT(0) /* 0: PPGTT, 1: GGTT */
>+
>+#define OAG_OACONTROL				XE_REG(0xdaf4)
>+#define  OAG_OACONTROL_OA_CCS_SELECT_MASK	REG_GENMASK(18, 16)
>+#define  OAG_OACONTROL_OA_COUNTER_SEL_MASK	REG_GENMASK(4, 2)
>+#define  OAG_OACONTROL_OA_COUNTER_ENABLE	REG_BIT(0)
>+/* Common to all OA units */
>+#define  OA_OACONTROL_REPORT_BC_MASK		REG_GENMASK(9, 9)
>+#define  OA_OACONTROL_COUNTER_SIZE_MASK		REG_GENMASK(8, 8)
>+
>+#define OAG_OA_DEBUG XE_REG(0xdaf8, XE_REG_OPTION_MASKED)
>+#define  OAG_OA_DEBUG_INCLUDE_CLK_RATIO			REG_BIT(6)
>+#define  OAG_OA_DEBUG_DISABLE_CLK_RATIO_REPORTS		REG_BIT(5)
>+#define  OAG_OA_DEBUG_DISABLE_GO_1_0_REPORTS		REG_BIT(2)
>+#define  OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS	REG_BIT(1)
>+
>+#define OAG_OASTATUS XE_REG(0xdafc)
>+#define  OAG_OASTATUS_COUNTER_OVERFLOW	REG_BIT(2)
>+#define  OAG_OASTATUS_BUFFER_OVERFLOW	REG_BIT(1)
>+#define  OAG_OASTATUS_REPORT_LOST	REG_BIT(0)
>+
>+/* OAM unit */
>+#define OAM_HEAD_POINTER_OFFSET			(0x1a0)
>+#define OAM_TAIL_POINTER_OFFSET			(0x1a4)
>+#define OAM_BUFFER_OFFSET			(0x1a8)
>+#define OAM_CONTEXT_CONTROL_OFFSET		(0x1bc)
>+#define OAM_CONTROL_OFFSET			(0x194)
>+#define  OAM_CONTROL_COUNTER_SEL_MASK		REG_GENMASK(3, 1)
>+#define OAM_DEBUG_OFFSET			(0x198)
>+#define OAM_STATUS_OFFSET			(0x19c)
>+#define OAM_MMIO_TRG_OFFSET			(0x1d0)
>+
>+#define OAM_HEAD_POINTER(base)			XE_REG((base) + OAM_HEAD_POINTER_OFFSET)
>+#define OAM_TAIL_POINTER(base)			XE_REG((base) + OAM_TAIL_POINTER_OFFSET)
>+#define OAM_BUFFER(base)			XE_REG((base) + OAM_BUFFER_OFFSET)
>+#define OAM_CONTEXT_CONTROL(base)		XE_REG((base) + OAM_CONTEXT_CONTROL_OFFSET)
>+#define OAM_CONTROL(base)			XE_REG((base) + OAM_CONTROL_OFFSET)
>+#define OAM_DEBUG(base)				XE_REG((base) + OAM_DEBUG_OFFSET)
>+#define OAM_STATUS(base)			XE_REG((base) + OAM_STATUS_OFFSET)
>+#define OAM_MMIO_TRG(base)			XE_REG((base) + OAM_MMIO_TRG_OFFSET)
>+
>+#endif /* __XE_OA_REGS__ */
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index a7263738308ec..a4a0170996982 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -10,6 +10,7 @@
> #include "xe_gt_idle_types.h"
> #include "xe_hw_engine_types.h"
> #include "xe_hw_fence_types.h"
>+#include "xe_oa.h"
> #include "xe_reg_sr_types.h"
> #include "xe_sa_types.h"
> #include "xe_uc_types.h"
>@@ -347,6 +348,9 @@ struct xe_gt {
> 		/** @oob: bitmap with active OOB workaroudns */
> 		unsigned long *oob;
> 	} wa_active;
>+
>+	/** @oa: oa perf counter subsystem per gt info */
>+	struct xe_oa_gt oa;
> };
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>index 39908dec042a4..4d2e2338db987 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>@@ -146,6 +146,8 @@ struct xe_hw_engine {
> 	enum xe_hw_engine_id engine_id;
> 	/** @eclass: pointer to per hw engine class interface */
> 	struct xe_hw_engine_class_intf *eclass;
>+	/** @oa_unit: oa unit for this hw engine */
>+	struct xe_oa_unit *oa_unit;
> };
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 11662a81ef6d8..5ad3c9c78b4e9 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -5,7 +5,10 @@
>
> #include <linux/sysctl.h>
>
>+#include "regs/xe_oa_regs.h"
> #include "xe_device.h"
>+#include "xe_gt.h"
>+#include "xe_mmio.h"
> #include "xe_oa.h"
>
> static int xe_oa_sample_rate_hard_limit;
>@@ -13,6 +16,13 @@ static u32 xe_oa_max_sample_rate = 100000;
>
> static struct ctl_table_header *sysctl_header;
>
>+enum {
>+	XE_OA_UNIT_OAG = 0,
>+	XE_OA_UNIT_OAM_SAMEDIA_0 = 0,
>+	XE_OA_UNIT_MAX,
>+	XE_OA_UNIT_INVALID = U32_MAX,
>+};

Right now, I think the enum is not needed since we are only defining 0.

>+
> #define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
>
> static const struct xe_oa_format oa_formats[] = {
>@@ -37,6 +47,143 @@ static const struct xe_oa_format oa_formats[] = {
> 	[XE_OA_FORMAT_PEC36u64_G1_4_G2_32]	= { 4, 320, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
> };
>
>+static u32 num_oa_units_per_gt(struct xe_gt *gt)
>+{
>+	return 1;
>+}
>+
>+static u32 __hwe_oam_unit(struct xe_hw_engine *hwe)
>+{
>+	if (GRAPHICS_VERx100(gt_to_xe(hwe->gt)) >= 1270) {
>+		/*
>+		 * There's 1 SAMEDIA gt and 1 OAM per SAMEDIA gt. All media slices
>+		 * within the gt use the same OAM. All MTL/LNL SKUs list 1 SA MEDIA
>+		 */
>+		drm_WARN_ON(&gt_to_xe(hwe->gt)->drm,
>+			    hwe->gt->info.type != XE_GT_TYPE_MEDIA);
>+
>+		return XE_OA_UNIT_OAM_SAMEDIA_0;
>+	}
>+
>+	return XE_OA_UNIT_INVALID;
>+}
>+
>+static u32 __hwe_oa_unit(struct xe_hw_engine *hwe)
>+{
>+	switch (hwe->class) {
>+	case XE_ENGINE_CLASS_RENDER:
>+	case XE_ENGINE_CLASS_COMPUTE:
>+		return XE_OA_UNIT_OAG;
>+
>+	case XE_ENGINE_CLASS_VIDEO_DECODE:
>+	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
>+		return __hwe_oam_unit(hwe);
>+
>+	default:
>+		return XE_OA_UNIT_INVALID;
>+	}
>+}
>+
>+static struct xe_oa_regs __oam_regs(u32 base)
>+{
>+	return (struct xe_oa_regs) {
>+		base,
>+		OAM_HEAD_POINTER(base),
>+		OAM_TAIL_POINTER(base),
>+		OAM_BUFFER(base),
>+		OAM_CONTEXT_CONTROL(base),
>+		OAM_CONTROL(base),
>+		OAM_DEBUG(base),
>+		OAM_STATUS(base),
>+		OAM_CONTROL_COUNTER_SEL_MASK,
>+	};
>+}
>+
>+static struct xe_oa_regs __oag_regs(void)
>+{
>+	return (struct xe_oa_regs) {
>+		0,
>+		OAG_OAHEADPTR,
>+		OAG_OATAILPTR,
>+		OAG_OABUFFER,
>+		OAG_OAGLBCTXCTRL,
>+		OAG_OACONTROL,
>+		OAG_OA_DEBUG,
>+		OAG_OASTATUS,
>+		OAG_OACONTROL_OA_COUNTER_SEL_MASK,
>+	};
>+}
>+
>+static void __xe_oa_init_oa_units(struct xe_gt *gt)
>+{
>+	const u32 mtl_oa_base[] = {
>+		[XE_OA_UNIT_OAM_SAMEDIA_0] = 0x393000,

The base can also be 0x13000 because intel_uncore will automagically add 
0x380000. I prefer 0x13000 so that the media related mmio adjustments 
happen in one place - intel_uncore. For functionality, it doesn't 
matter.

>+	};
>+	int i, num_units = gt->oa.num_oa_units;
>+
>+	for (i = 0; i < num_units; i++) {
>+		struct xe_oa_unit *u = &gt->oa.oa_unit[i];
>+
>+		if (i == XE_OA_UNIT_OAG && gt->info.type != XE_GT_TYPE_MEDIA) {

This is where I feel enum can be dropped since decision can solely be 
made with gt->info.type.

>+			u->regs = __oag_regs();
>+			u->type = DRM_XE_OA_UNIT_TYPE_OAG;
>+		} else if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
>+			u->regs = __oam_regs(mtl_oa_base[i]);
>+			u->type = DRM_XE_OA_UNIT_TYPE_OAM;
>+		}
>+
>+		/* Set oa_unit_ids now to ensure ids remain contiguous */
>+		u->oa_unit_id = gt_to_xe(gt)->oa.oa_unit_ids++;
>+	}
>+}
>+

All the above are minor comments, so with or without those addressed, 
this is

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh

>+static int xe_oa_init_gt(struct xe_gt *gt)
>+{
>+	u32 num_oa_units = num_oa_units_per_gt(gt);
>+	struct xe_hw_engine *hwe;
>+	enum xe_hw_engine_id id;
>+	struct xe_oa_unit *u;
>+
>+	u = kcalloc(num_oa_units, sizeof(*u), GFP_KERNEL);
>+	if (!u)
>+		return -ENOMEM;
>+
>+	for_each_hw_engine(hwe, gt, id) {
>+		u32 index = __hwe_oa_unit(hwe);
>+
>+		hwe->oa_unit = NULL;
>+		if (index < num_oa_units) {
>+			u[index].num_engines++;
>+			hwe->oa_unit = &u[index];
>+		}
>+	}
>+
>+	/*
>+	 * Fused off engines can result in oa_unit's with num_engines == 0. These units
>+	 * will appear in OA unit query, but no perf streams can be opened on them.
>+	 */
>+	gt->oa.num_oa_units = num_oa_units;
>+	gt->oa.oa_unit = u;
>+
>+	__xe_oa_init_oa_units(gt);
>+
>+	return 0;
>+}
>+
>+static int xe_oa_init_oa_units(struct xe_oa *oa)
>+{
>+	struct xe_gt *gt;
>+	int i, ret;
>+
>+	for_each_gt(gt, oa->xe, i) {
>+		ret = xe_oa_init_gt(gt);
>+		if (ret)
>+			return ret;
>+	}
>+
>+	return 0;
>+}
>+
> static void oa_format_add(struct xe_oa *oa, enum xe_oa_format_name format)
> {
> 	__set_bit(format, oa->format_mask);
>@@ -96,6 +243,8 @@ static void xe_oa_init_supported_formats(struct xe_oa *oa)
> int xe_oa_init(struct xe_device *xe)
> {
> 	struct xe_oa *oa = &xe->oa;
>+	struct xe_gt *gt;
>+	int i, ret;
>
> 	/* Support OA only with GuC submission and Gen12+ */
> 	if (XE_WARN_ON(!xe_device_uc_enabled(xe)) || XE_WARN_ON(GRAPHICS_VER(xe) < 12))
>@@ -104,16 +253,36 @@ int xe_oa_init(struct xe_device *xe)
> 	oa->xe = xe;
> 	oa->oa_formats = oa_formats;
>
>+	for_each_gt(gt, xe, i)
>+		mutex_init(&gt->oa.gt_lock);
>+
> 	/* Choose a representative limit */
> 	xe_oa_sample_rate_hard_limit = xe_root_mmio_gt(xe)->info.reference_clock / 2;
>
>+	ret = xe_oa_init_oa_units(oa);
>+	if (ret) {
>+		drm_err(&xe->drm, "OA initialization failed %d\n", ret);
>+		goto exit;
>+	}
>+
> 	xe_oa_init_supported_formats(oa);
> 	return 0;
>+exit:
>+	oa->xe = NULL;
>+	return ret;
> }
>
> void xe_oa_fini(struct xe_device *xe)
> {
> 	struct xe_oa *oa = &xe->oa;
>+	struct xe_gt *gt;
>+	int i;
>+
>+	if (!oa->xe)
>+		return;
>+
>+	for_each_gt(gt, xe, i)
>+		kfree(gt->oa.oa_unit);
>
> 	oa->xe = NULL;
> }
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>index 3758bd2879cbb..8f8cf6a2bf556 100644
>--- a/drivers/gpu/drm/xe/xe_oa_types.h
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -8,6 +8,10 @@
>
> #include <linux/math.h>
> #include <linux/types.h>
>+#include <linux/mutex.h>
>+
>+#include <drm/xe_drm.h>
>+#include "regs/xe_reg_defs.h"
>
> enum xe_oa_report_header {
> 	HDR_32_BIT = 0,
>@@ -60,6 +64,55 @@ struct xe_oa_format {
> 	u16 bc_report;
> };
>
>+/**
>+ * struct xe_oa_regs - Registers for each OA unit
>+ */
>+struct xe_oa_regs {
>+	u32 base;
>+	struct xe_reg oa_head_ptr;
>+	struct xe_reg oa_tail_ptr;
>+	struct xe_reg oa_buffer;
>+	struct xe_reg oa_ctx_ctrl;
>+	struct xe_reg oa_ctrl;
>+	struct xe_reg oa_debug;
>+	struct xe_reg oa_status;
>+	u32 oa_ctrl_counter_select_mask;
>+};
>+
>+/**
>+ * struct xe_oa_unit - Hardware OA unit
>+ */
>+struct xe_oa_unit {
>+	/** @oa_unit_id: identifier for the OA unit */
>+	u16 oa_unit_id;
>+
>+	/** @type: Type of OA unit - OAM, OAG etc. */
>+	enum drm_xe_oa_unit_type type;
>+
>+	/** @regs: OA registers for programming the OA unit */
>+	struct xe_oa_regs regs;
>+
>+	/** @num_engines: number of engines attached to this OA unit */
>+	u32 num_engines;
>+
>+	/** @exclusive_stream: The stream currently using the OA unit */
>+	struct xe_oa_stream *exclusive_stream;
>+};
>+
>+/**
>+ * struct xe_oa_gt - OA per-gt information
>+ */
>+struct xe_oa_gt {
>+	/** @lock: lock protecting create/destroy OA streams */
>+	struct mutex gt_lock;
>+
>+	/** @num_oa_units: number of oa units for each gt */
>+	u32 num_oa_units;
>+
>+	/** @oa_unit: array of oa_units */
>+	struct xe_oa_unit *oa_unit;
>+};
>+
> /**
>  * struct xe_oa - OA device level information
>  */
>@@ -74,5 +127,8 @@ struct xe_oa {
>
> 	/** @format_mask: tracks valid OA formats for a platform */
> 	unsigned long format_mask[FORMAT_MASK_SIZE];
>+
>+	/** @oa_unit_ids: tracks oa unit ids assigned across gt's */
>+	u16 oa_unit_ids;
> };
> #endif
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 5bfb2d5aba12a..778862a5b76d4 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1175,6 +1175,12 @@ enum drm_xe_perf_ioctls {
> 	DRM_XE_PERF_IOCTL_CONFIG = _IO('i', 0x2),
> };
>
>+/** enum drm_xe_oa_unit_type - OA unit types */
>+enum drm_xe_oa_unit_type {
>+	DRM_XE_OA_UNIT_TYPE_OAG,
>+	DRM_XE_OA_UNIT_TYPE_OAM,
>+};
>+
> /** enum drm_xe_oa_format_type - OA format types */
> enum drm_xe_oa_format_type {
> 	DRM_XE_OA_FMT_TYPE_OAG,
>-- 
>2.41.0
>
