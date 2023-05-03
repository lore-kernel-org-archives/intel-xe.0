Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E59C77B78
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 15:21:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8FF10E304;
	Wed,  3 May 2023 15:21:48 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AEB310E304
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 15:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683127305; x=1714663305;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9M9JP+msgFuxvsQJ8F5gsuiQK07PnRy5sSIppvk+3vI=;
 b=Vm6/hohUvM7Ij0p4xODBzakNWQkZ/acSQfbGbsF3EXM0/azVCo0LkpR7
 DIVnpGsfmBl34a24w70FIWAvA4HQWUEmfly+Rgs7O2LUDFAlSQ2/xGZLs
 5UM9ogQfr1RkiZY0K24oVdRH4PP1jvskAKneVjOiaj5CNBv24g5aVZZoO
 CtbWJnwpSF9SwsDG9dMjk+KQ7z/u1hWhL/0WvlhnL+wiIun4CH2+/QroV
 4ttv+VqCdG/HzSrIpoVU9XT7gw3dLIvY8K8c3KYmJXVwf69P9ws2vCJow
 S1xp8kY9UgYKKCH6Qe7CmyBMziG9N1mjDoT4sss1q/T26XE3iaIdAtf4s w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="376746752"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="376746752"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 08:21:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="729373573"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="729373573"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 03 May 2023 08:21:21 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 08:21:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 3 May 2023 08:21:21 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 3 May 2023 08:21:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ns6FMYDvpZPEGHats0dhtzYgkfS9bWpKg7rr7J6Ft6LzC/XVK9Md1W2jg+vuEN3zI26mRs4TqW4izCEkyqy+37TR+WaDNA8LVHDTLjJU6t/x+hRos43DHsr/jUZbHwTBJFEcfVk0uBp/cJo2uguJrvbuF18ke6bDebvELjyGutD1hLdiihbWafopGr3kRMeb49foDfXhjqEzMIaWr45NVQYZfKqi09le34Sfm/521XT3r6okUD4L9rRfTwVIelz9/hTW72DiZf8Omvv/2udDT4vLHBQoE75QDtAJtVV3rZF2VnRZHA5tJnb6i1V4Y9Z+2D5TdtSGI406JYQVkPedmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9dYnyNJw7Ox0RonviWHjHpGKOWNxeuZa0C9npTVEjg=;
 b=I8saJwGN1jIWP2lL+isMWPM/Ux9DzBFR4XBdRT/DZx1WyWp6eIanFxK6sVsP/Y8uCkDb4EvqB3KnU9cDaYHEHAxY1T1X1MnNqbC77yTn7hhKu6uGEWCYyB57A+cvkdmnlSt0BBXiUA8A0tF/jxFTF6CyGjaEDcDUqmx4iiej6sVBVRap9slmH+NjJuLxyKaBC5gi8+OMjETyvVS+wQJyJOaGtcziFxuPi53OYGg6LtgyQ8px3b0h4p5VPZAhY7tLACIGmTksxgChLdjbJMg6c/WvWy9FJvhAeYOcCEuvmRV5j8RMtYcIrkt1TIl69xHcxO4Sa2nvLT4SMoROuR0LWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5265.namprd11.prod.outlook.com (2603:10b6:610:e0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 15:21:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 15:21:19 +0000
Date: Wed, 3 May 2023 08:21:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <u2lemgl5ytin2qlyjwtp2pfm4r2oqctluojilspof5brhd5l5l@yxr7bfwn2kvr>
X-Patchwork-Hint: comment
References: <20230503131005.1602412-1-jani.nikula@intel.com>
 <20230503131005.1602412-3-jani.nikula@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230503131005.1602412-3-jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR11CA0058.namprd11.prod.outlook.com
 (2603:10b6:a03:80::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5265:EE_
X-MS-Office365-Filtering-Correlation-Id: f4965c3a-4e19-4277-5944-08db4bea0b87
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vbIwtGnF4Vb0NSAbHpjK54+ny+0X6WKvUFXLfWSYdHi3v1VAPQR9/ZvhStaWTACb/ISPLeGoKxJdI43Q8zN5OvJDINUIoGEA08a7lF5rW7kkydKzipkDSpCR7Ij0aDZpT9xEFyL5N8VlK12HX8IjxEm0Mb9F3o+hHhGpUbaUTZJzFLUzqBlAgVQzN+DBf4UQXt5fywDvkf6uN8X2282NXvTfG63DfMCA4WNncauHpPL8hfuyXe0D4BhzGxU2FYtgSw7mY8MbzQf3u32B8ZNIQVa3lC/4GuPLyMMYkrI10+OrReiQG4MNkHLJceqxQq15R6mu4Umabvk9O+tscQkJgsniwDGsOewZNR3ZFsRxNu47XaO2hFDV0fJCnc6CtD0YBP5GWeOd8OxNZKRb9FD5Vmh2pdz1szg/MWpz/Kkhfub+SVBtpuYEedSC7hYsIqcS6P9gCq9W7iFIWCLQDocjHbB1IY2i6DUVyb+k3eyP+lCmQHRY3zojJmJ0tdP/JZhdmnzknwt/44YGSqxuO77hscKcouQgkj0ViN5uXJniXwbMVaHPNPTjGDblbzkD/hhJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(376002)(346002)(396003)(39860400002)(366004)(451199021)(6486002)(66946007)(66556008)(66476007)(6636002)(4326008)(478600001)(316002)(86362001)(6506007)(6512007)(26005)(9686003)(8936002)(5660300002)(8676002)(6862004)(2906002)(41300700001)(33716001)(82960400001)(186003)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fxARKU7qzpLj7mU7nY3RZDDQAf3rTk04aTEwgX2vFrG8f6JbcVYjw2SnNz?=
 =?iso-8859-1?Q?IqLld70OVXHAYl96+BWlPIdpJzkr+5AkyVq1fj7x6HwmBfFnUyr6lQM/WK?=
 =?iso-8859-1?Q?PTHE5/6jplX3CPs9EDHNsd6Ia75e7P8gteyWz+RDH7cfm2IFgVi+fAmILG?=
 =?iso-8859-1?Q?Ia6fQ3AFDJHq7hW2MSl3xjQ+rqbYVWQ5ix5wFqvBndvitDYufKhqhbCQKM?=
 =?iso-8859-1?Q?C/DFaHjYYrI/1zJXi9kKkOvoFfYBitBw51NukrOuT+rtL5VXehWeHzRvix?=
 =?iso-8859-1?Q?BK3qSX2Ofk3Kwc1lxMgGgB+Vnx0ooqXWt68Efgq0furpOPocS6N59Z+0M1?=
 =?iso-8859-1?Q?Y+/0yovjgcVhKpKTjnQ1CC9Rk36A80zvjXJ8TSHVIQx6+4eS6Dgzj1Q/fN?=
 =?iso-8859-1?Q?SPn1sBQzACtymMeddY0leRw+DzNzR9bic7HFBKCswLIjcxQb5CWZgRxL1F?=
 =?iso-8859-1?Q?tw7U7i/4zbiaM4P+fzzObgZ8pJIdTS7Z7lBQ2nValuistmlDAYDw4bodN9?=
 =?iso-8859-1?Q?CBEC/3MLzHiLudI/rJee4GtZyCGEdt1Eg2G+yGqxk+bSh4rykCozHX9Gd3?=
 =?iso-8859-1?Q?demU2E9V3VqH36IIwDlsiLqqNm85O9RFGK7kcChhCzSAalI+Gft5HKcBFB?=
 =?iso-8859-1?Q?IwiO+hKOt4dVzDQA5iw1VfisykmKijmr6IN73I3ryM4uHv7iUGg3KunYQX?=
 =?iso-8859-1?Q?JHyOJqyj9IqF6gwSHxlRx0ru4ERtGTjQUUTEZeaTEZSDENFCty+bbBaKJ4?=
 =?iso-8859-1?Q?2/YqZjYrB6eeIjbDlbE4Heom8jFeTG9/d6808jEsP6jtSFvdMiuHNSsrXW?=
 =?iso-8859-1?Q?o2FgRbj31YyNfweCm8uh1bYKqfTUG+999IwQx2UawSDGnRFveCw6sOkIPl?=
 =?iso-8859-1?Q?HQ/andk+arNhg4T7Y4R8hpRh7chcV/8AYQGs+tB+TpX7vMMSKrj1bBmSJF?=
 =?iso-8859-1?Q?bJO/mY6LcvIOa5+rFYPiz2FrDsHCYy1D9vUXzqSvwNNhS7+BVxRSEeZTjN?=
 =?iso-8859-1?Q?Xo/6jS7n3d+ytx9dvSiJYA/aIAVQB0yBr2DMtSzga+3R6RLRJGPMFrJrRb?=
 =?iso-8859-1?Q?6uyxq4mRYZZ9PtYHEyQcUISJgQ9GrtBPcPhEBZCQucpskqB7Wxr2E1lNvZ?=
 =?iso-8859-1?Q?/Dvcd2+XBaudNxmL18YOOi8BjKCfHKp0l/GOqX2W17kx7+pCXPT+N5b6tp?=
 =?iso-8859-1?Q?Rsr39jZAGJOs2SIFoCTrYm/lnIIvFUuw82xbcnjCT+IiFu/TjK47KaHOz1?=
 =?iso-8859-1?Q?mqMEs2/hPC7HM2GI9FSg2pHQDzMFi17K1RI1OVyt/Y9z4++jc1uTyi/msL?=
 =?iso-8859-1?Q?u386aV6XgBiQPh3GOx9FtJwaGIb2oj8KLfOe56isEVJqDW9RDl97Ji+JsL?=
 =?iso-8859-1?Q?NZb+v5AlBHlLUQJtn4y7SEUuIT0UhYOQ8CnPEgj+EQG1PdGgGuCXEiZxI8?=
 =?iso-8859-1?Q?pdjJsHK1apNu68JFc+OchSDL6KOTutb+QYtu5OM7Th9T7VDA+dFMGotdE+?=
 =?iso-8859-1?Q?oxkwMD7oBgfk3Ay7jYC3dBFn971ZLnXqm2y+KJrbh9PAJIf73UUwtEVYUg?=
 =?iso-8859-1?Q?CAIjZz7zrjbu4aqUriX9A5OnuXVDuQPXu/2hBKbYlJy2CPtO7Cwcna5cCk?=
 =?iso-8859-1?Q?eA8770ADl+lKh7XIJczH+7n2mk8hQjj37PwU6OsGt2pPe8Gf/8UVRANA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4965c3a-4e19-4277-5944-08db4bea0b87
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:21:19.2580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PlZdPH5hk8PvNRFPnPuK0A9EAPmzvwl0vW7jx4VxH9ADqvzp4oTmyVaLQH9948yeXNQ3VnwqUVN51KRbKk03w2GWesOC8XLGV0pYvTf0gRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5265
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 02/18] fixup! drm/xe/display: Implement
 display support
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 03, 2023 at 04:09:49PM +0300, Jani Nikula wrote:
>Add compat intel_uncore.h glue layer to direct all uncore calls to xe
>mmio.
>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>---
> .../drm/xe/compat-i915-headers/intel_uncore.h | 99 +++++++++++++++++++
> 1 file changed, 99 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>
>diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>new file mode 100644
>index 000000000000..960e2327d217
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>@@ -0,0 +1,99 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef __INTEL_UNCORE_H__
>+#define __INTEL_UNCORE_H__
>+
>+#include "xe_device.h"
>+#include "xe_device_types.h"
>+#include "xe_mmio.h"
>+
>+static inline struct xe_gt *__fake_uncore_to_gt(struct fake_uncore *uncore)
>+{
>+	struct xe_device *xe = container_of(uncore, struct xe_device, uncore);
>+
>+	return to_gt(xe);
>+}
>+
>+static inline u32 intel_uncore_read(struct fake_uncore *uncore, i915_reg_t reg)
>+{
>+	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg.reg);


humn... I think we will have to wait the move of display up in the
branch.  xe_mmio_read32 doesn't receive a u32 anymore. If we do a
autosquash now we will have to fix the implicit-conflict/build-breakage
in the patches in the middle.

Lucas De Marchi
