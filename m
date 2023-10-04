Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01308E7C4EC
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 18:19:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CB610E3AD;
	Wed,  4 Oct 2023 18:19:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B412C10E3AD
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 18:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696443594; x=1727979594;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=emUSDZJSVc+z6TZBJ6fwUkqdLZq6D9FYYTSY5B0H2ec=;
 b=ZZ46ZOz2MMhb4xJCHD7wDhBm0w2IMLFch/6tMTOSj4e1FBJoBRzGf3+B
 bNRznzAVlRoBuEAmRm1jAjZqcJMP1/eC0vUQJMqfOuE+9MIxUPGnqxcwY
 5BKjQkag0Gn8eYLkfXEKyillelHkl5Nulja/d9Iv4NTSPy+f1VAqxTY6q
 nul8INXn+xAzHqR8SQDSH2YSOyYK0NjnRKOcMku1VldMl8kG6a3nRYZ4V
 0K3TbInTK0LpSpAx+Fy9vvHmhHDO/RO+HAJ5JpGkE5M0wNJWH+I9WGGMs
 hhNf4lNjZ8lriNMdrV1wyvjm+jReE5Jw+vxo3zZJjRFZzJ5RNDXkHTvKx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="414175300"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="414175300"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 11:19:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="875224819"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="875224819"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 11:19:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 11:19:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 11:19:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 11:19:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HcjfErn1J41xz5e2dKe5RHx39OlogoR8lYs+yiyB8tmccRYgZgIoozPkHo1yZFT0feFA1cl/K8yYlf4DDbKsGRrKyoQtO6+We/oWSUeUlzzv+u5BKvqJlKkL87+CfxkwlCqvCFjxmt4Vwfn3V+OxpO4WzeDihJfqtKgZ4jkAJMsgF4LcyhBb3PdwGcdI3rN9Ads3D247FgpSi37dUWKK3ciXcaAhv7tb1Bfh74xaoyA0Xpj5Q50nF7XqAvhw531KqbYYPuwGk/kmW3krH27cr1uQqLX6pEsiQNoVRKEzHT+AKlmxJf63XFtbojQKriTbbZlX2vS29r/Eadz/2jfB6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnTSx245wFqAVtJv8r9AfAmFHY6wx3m8+2iySrf2j+M=;
 b=XSfxmcZ0QW787yTfJO4FORn7Nh3XUu25LIgp4/dZmN39qekOI0H7mL49BhzozF7dci+gLf57gdRDqJRXOEYzgPJtR8Sy/xaR/ocsKTXmH8L0bO33CD17ZjQvNN/fRsRRwQKWDEMTRPDD9Exts9JCTxksf8FsvV2p503HXHt8aQpBh/Dj58UfZhCt84DnI/6dDc6tSaEm1XfHyn+dYzDZ5v5x98/+RjEu1aIGlbAe8IZkYTgJs4wD65xEipCizFGgGWVTQS5fziO/EEpx3dPsX1US+wZHL5x45IZP57m6niEG5aZ7juUCKdrn/gEMST/hX3UV6tVnD32AaQo3dW4Aww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7674.namprd11.prod.outlook.com (2603:10b6:610:12b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Wed, 4 Oct
 2023 18:19:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 18:19:49 +0000
Date: Wed, 4 Oct 2023 13:19:05 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <ffjzhryjn2rcjsibogd3ph47qxgm2c6fjrtcdq4vtins42ybzm@tce7n3qxoili>
References: <20231003203716.108979-1-anusha.srivatsa@intel.com>
 <20231003203716.108979-4-anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231003203716.108979-4-anusha.srivatsa@intel.com>
X-ClientProxiedBy: MW4P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7674:EE_
X-MS-Office365-Filtering-Correlation-Id: 07dfabb6-032f-4f0a-d7db-08dbc5067e9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WvWARbtOZLkCGxeB7u78OLuUcZRHYVBrkxWU6pLWHzQobGHP0HAwfPYmjQeT/Zyh3DeU82I7JJo3HQDUbD6zpSTi4oxRxObQ/IqIKHjyH+FNXf5Smzl57dpRvQ2hNsGHc3C4X0VBXCrmOOtH9MXGw7gXDpq3TFWUSWWRiERK3bxkkNZgrJqJXXFjzvKcw+E0JpPBynwb0hBzho4JcMSBGcZObI/utA4F1GiIFOVYqPa37fgevwq1WiavE0vrKLFvng9p3Swh5yjTz8DG6hXsbchOWQySMbsIEoHH/KsuIDrhBNOOzy69gQuG4xXrIAgVDXbYCzg74DEAOH6LGXAZ2MSxMLF5pMhuyiis8RS4LblfxA7YRN3iGJLiNJUquATtnjQc/yLE0kp8+KpXQ7aoAVK7+VimghBoutqUIPurCHvWGthdy+9b75PNIHk6o5au0p/MJ2BmcYs5vewippF5XXyhOxCZdBz09BGIH1e5YfEXRG0AdF7EaOdgm6u92zSoql6LsUsG1Kd9bxDbn1XTrvVArwFWn3VD7eX+tdMC0W0VuEFE+f6IVGk/jpIBCkbV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(366004)(136003)(346002)(39860400002)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(107886003)(38100700002)(66476007)(66556008)(66946007)(316002)(6636002)(41300700001)(6512007)(9686003)(2906002)(33716001)(6506007)(26005)(6666004)(5660300002)(4326008)(8936002)(8676002)(6862004)(82960400001)(6486002)(478600001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VUFblSt2E0nwYYbQ16ZKv2yMOMhYDsKsKPYTS6cyBSzqKT10cK5C/kTq6g96?=
 =?us-ascii?Q?/8DmvfjNz6UCzybFTiZVsFn69jOCz0JHvWrDAO0aN1O4hac63lnIJisWPABt?=
 =?us-ascii?Q?PiYZJTjdFfz4fqR5kraRzGniEqJDor+JHMpWDiuzsQi7R3Aqny1kBanupxlJ?=
 =?us-ascii?Q?ufOpamV7FATd66lNuQ25s2Jp4H6DZm1C5I2dElSF5b0Bn/xwg/WodVvvLxEZ?=
 =?us-ascii?Q?flyfI6gwz/YbLFATD7rwlW7zoViBR0FfwT39YOAxew1h+uWmM7aQ1ycKfobY?=
 =?us-ascii?Q?3fEYCN+mtNu5O6mbi1hXkMrs6xquVYU5q31rgnRHfuCMSSrzhhnF/ZGgKKgO?=
 =?us-ascii?Q?3X3qlsxLHph6fR+hUhz1qW/xZieU8bELGJuGigmJqv+YP/BFcimB0q9qOWm2?=
 =?us-ascii?Q?EjPheIPTZDbtIXL2mTy7eeImEAvSwuXh+7P+PDQStdlP4qrJyiLJ92vj04JD?=
 =?us-ascii?Q?DputYuo08PNoOpOkb2880Tk3aK4d4nL5SIvd7ws7w1I65IEzqUw+GO+K0tki?=
 =?us-ascii?Q?6CBxMnxxapDqEo/XOuG+LI+4h2gna9oRGXfNkc5S8ZRlhQDYA9ELZaLH1c32?=
 =?us-ascii?Q?Wu5LH7JEEpzGkvOfeNjBergwvJ6Mt3coKWUkjfQPxbVTwDOzk6sYXaLNz1uJ?=
 =?us-ascii?Q?0rpemqh+rMeX7pSo/80Wt9JcJLt0vgXVLYYQe+SFhRLoijrQuPx3qoaknRgA?=
 =?us-ascii?Q?VbeiloxEzt03I+7V/8/M9JgLJCRTlwjswXqR5dUThZhkH1LY3692/EfR0ZpS?=
 =?us-ascii?Q?qQMPV9uyYL+BUnyW7MDEuE7XJy81mUL3rtp5V3tjbchmLb5/G8JFhOzgetkP?=
 =?us-ascii?Q?uTfDLftU2838Z7EtIsfDix243Dl6bNVGaMbzWCHP+uzAVNSz4cXAp/O2ewLE?=
 =?us-ascii?Q?QUYFDn9As9hB1iZcxXa6TNyfUqGZ3njO7pYggeHzBpE7uzMTp+e93uAd7wnr?=
 =?us-ascii?Q?v1Nhn01OTfebKOD+g921XZBrn3aEPCCQIqgQat1COhvit7APyIKIpkt7ZdIE?=
 =?us-ascii?Q?08ewMET5XFMrUy9EGe0m9+Lz/Z0DPAGPxb7y7he3tQj+uKmZne4IrEDI2qCv?=
 =?us-ascii?Q?32RUT87RjLliVsPbJkMB2/f8/8RPhyoKBJwX2p01e+bm7YCtXPS+Vc/MLUDG?=
 =?us-ascii?Q?9F3gojU2JqbhWP7LZZA8bQ50CWs1pkNN+P1ybk4L7vc2aKRF0SZvdWKRcoGK?=
 =?us-ascii?Q?p+zbFvUUYyxjQp7hNHKavE0T2X94lguAQOXzcqaBrVumUNscmSsCV+GdNYnr?=
 =?us-ascii?Q?hLKeERSCINPj1FvpqdLNGQP47aWLT5djTYTXgqENLjy5JoImzWTABLNLi+XO?=
 =?us-ascii?Q?iveyNPJ4QD2K3kt0O7bOI/y2pFjzSQ0FHaMcTivasDWNyBdXE/svlvZfuv4Y?=
 =?us-ascii?Q?vnVSNMtCY3GkF9805PkNeDwCB+ZKhS2XP0OPwVckYeglLjf1rK8TUOC+P9PP?=
 =?us-ascii?Q?u4NPlgU0bKooSf4zejkSSzVLwDqGqmYmMv1uap29JjU8yrQY/e8jLbFzLQ1j?=
 =?us-ascii?Q?c1xjim+iRKnGvEy15dThBW/ZbyYm3v30TeNeYBbAe8dsgSKKKbGm7iHFtGmI?=
 =?us-ascii?Q?vC1NCovo8EJpo34R3LeSq1APpE3kp+2cJma+OOfdPQtS/XoReIVEk4pupqeC?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07dfabb6-032f-4f0a-d7db-08dbc5067e9e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 18:19:48.9792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nC2avZNiyWhpx2vcnEJ+Ea15XbR3AAaXOMxpALHg5dyvP+dR/0VCoa3S9qSLBBO9jlsKMDQh3b8Z72T5hpyWPcQPBuVy+eW7ioi8LlcL/IA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7674
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/5] drm/xe/rpls: Add RPLS Support
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 03, 2023 at 01:37:14PM -0700, Anusha Srivatsa wrote:
>Add RPLS support that was missing apart from the PCI IDs.
>
>v2: Also add the support in xe_wa_test kunit
>v3: rebased.
>
>Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
>Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>(v1)


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/tests/xe_wa_test.c  | 1 +
> drivers/gpu/drm/xe/xe_pci.c            | 7 +++++++
> drivers/gpu/drm/xe/xe_platform_types.h | 1 +
> 3 files changed, 9 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>index 16f7f157c875..69c9ea1fa82b 100644
>--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>@@ -49,6 +49,7 @@ static const struct platform_test_case cases[] = {
> 	PLATFORM_CASE(ALDERLAKE_P, A0),
> 	PLATFORM_CASE(ALDERLAKE_P, B0),
> 	PLATFORM_CASE(ALDERLAKE_P, C0),
>+	SUBPLATFORM_CASE(ALDERLAKE_S, RPLS, D0),
> 	SUBPLATFORM_CASE(DG2, G10, A0),
> 	SUBPLATFORM_CASE(DG2, G10, A1),
> 	SUBPLATFORM_CASE(DG2, G10, B0),
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index ba67f6fcfb4f..da485fb324eb 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -221,6 +221,8 @@ static const struct xe_device_desc rkl_desc = {
> 	.require_force_probe = true,
> };
>
>+static const u16 adls_rpls_ids[] = { XE_RPLS_IDS(NOP), 0 };
>+
> static const struct xe_device_desc adl_s_desc = {
> 	.graphics = &graphics_xelp,
> 	.media = &media_xem,
>@@ -228,6 +230,10 @@ static const struct xe_device_desc adl_s_desc = {
> 	.has_display = true,
> 	.has_llc = true,
> 	.require_force_probe = true,
>+	.subplatforms = (const struct xe_subplatform_desc[]) {
>+		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
>+		{},
>+	},
> };
>
> static const u16 adlp_rplu_ids[] = { XE_RPLU_IDS(NOP), 0 };
>@@ -352,6 +358,7 @@ static const struct pci_device_id pciidlist[] = {
> 	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
> 	XE_ADLN_IDS(INTEL_VGA_DEVICE, &adl_n_desc),
> 	XE_RPLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
>+	XE_RPLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
> 	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
> 	XE_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_desc),
> 	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
>diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
>index b6fe4342f9f6..553f53dbd093 100644
>--- a/drivers/gpu/drm/xe/xe_platform_types.h
>+++ b/drivers/gpu/drm/xe/xe_platform_types.h
>@@ -28,6 +28,7 @@ enum xe_subplatform {
> 	XE_SUBPLATFORM_UNINITIALIZED = 0,
> 	XE_SUBPLATFORM_NONE,
> 	XE_SUBPLATFORM_ALDERLAKE_P_RPLU,
>+	XE_SUBPLATFORM_ALDERLAKE_S_RPLS,
> 	XE_SUBPLATFORM_DG2_G10,
> 	XE_SUBPLATFORM_DG2_G11,
> 	XE_SUBPLATFORM_DG2_G12,
>-- 
>2.25.1
>
