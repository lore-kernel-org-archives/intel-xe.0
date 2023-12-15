Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1ADC35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 22:02:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDEC10EA9F;
	Fri, 15 Dec 2023 22:02:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DBF10EA9F
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 22:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702677733; x=1734213733;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=88V9f0f1UfRpYjYRegAQWyHSAilPo31eukmnckqquFA=;
 b=hEawK8+knEramjs9JJGP1TZ9GqYdMumTs3eqvvXGFmcWW+Vr2eS2Upab
 6ag3zOltD8xYM8V9m3l1BOYJNCbYaJKk8ozEzlXMILz2g9v61pt+pkXbh
 PRDZILB6hnL7WxtO0VdCthQojtsuna2tXQd4xsG23+BfvrcGfoIjC/ttT
 5sSQRsso6OldlC7ig9lxfuNB+RaHz9HcZZo6i6foeBAd4yV7kY+shlDbv
 eoiDKphEfomskDyUAKg2XTfADXQRKGex70zOx9zZGhieGTy7ieyFo4oq9
 Iqdxqw0Yj+BU44eNBcwcn6jgMprv2f8Q1ITttqC9pEG3QDtU/rqRjNLxh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="2420523"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="2420523"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 14:02:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="918579806"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="918579806"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 14:02:11 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 14:02:11 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 14:02:01 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 14:02:01 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 14:02:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k655duO+zb/VnLB3Ao/b5lyZcNk2cg2/1ZlNlWwrAJUoIme0npeVWV0WX3uqceejcPED33o7qNHVoAGIKKtGihGDvrjX1fDIXTkxaDGMpbHQKnF/YynffujxSrRTmeg2jV8egj5IJpFYlzaXBw7OaJMtCEvwjvC03aOJPjvsWrhh8E5GVXjfxNAjBgWs7KdYmO3NUnlckIp/+MgsqFiHo9SDY7I/ZarAIewkxe4VIvW+oNPFiAM36kc/Kzn3RpYgvrSEEFCdJW8pwx04Mp34vBBJv/jPtA/A89PYeGrDKIrVMoz5G3l4+qAKGKvXu/0v9hhvEXcQkq9CEo3eW7ar4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihfGAuE8X4h/qvAGwtU14LHdv1tkO28Sl/qtFJrssBM=;
 b=AalRdMrCDNuRL0sWkulXAV0aub9e21ZM8GzoUPX/H6FZuI5amTWF67Fy6uPRhouEi4weYNrfkeOX5rV2pAQiAEoogDqf/Itsv9ng3RKMSMFHGTd1CZ7qYipX086lA+jmpFpiBngyugp/qzCacGG07EaH+eVVbjhCHGliwY2vJO8oqkbH/vGSRiH9d2P4Y19xjgIDsoAgxoWyHHURan9V3QT43LOIwOE+zbaguhYPRts/XAXxy+wGJ8bqSOVDQibtymF2vASaUiDYDRePPPLGHgnYms2914tp+8eXBRIHraHr2YVLgtsjkR7CKaR0wb4+4r2LQCqwjfHQWdyKx7MbGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7753.namprd11.prod.outlook.com (2603:10b6:208:421::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.32; Fri, 15 Dec
 2023 22:01:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 22:01:58 +0000
Date: Fri, 15 Dec 2023 16:01:56 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 05/10] drm/xe/kunit: Define helper functions to
 allocate fake xe device
Message-ID: <pc3jbkahgocow55fjzuspt35zupmngr2sy2dsgki2dk2jpmunu@4otywwyhmy2d>
References: <20231215162502.1879-1-michal.wajdeczko@intel.com>
 <20231215162502.1879-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231215162502.1879-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR02CA0050.namprd02.prod.outlook.com
 (2603:10b6:a03:54::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7753:EE_
X-MS-Office365-Filtering-Correlation-Id: f9637b6f-2566-4798-4c0b-08dbfdb97542
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uhqZIzmorXAck+Rw2vxp/NgvBaz0uURfI32oOvd4nD895iA2Z9qf5KX4jPj/VgN7mRCJRlwi8+6uWj7NwmkCtn7ORQw2v9mRssHC8Nwmpq20qxiko7CSrNm38TZ6ZS4jFizdBpYY7VpHU38hPUItio5Nd2rdh9AyAB+X+0GvSyE5WYugKXl/3VvA2OdoazLGhf50Flg1/9Ph8ry2Mg4BSYNoekkg05MqJUYdPXxFDlxfF2TZ3uv2Aioc0QABLwcUZC80P38WYhifboLrU2HM5ABchQe19/f2am3NE2G0tvRZpPMybt207F3/v8Vv739gXMGQMOtu13mOJWtZdL5fq0I7C3vW+JqBSEyEGrC9RWkBYCXMcdkZoHVBm2/HqgJv26FOa/pnh8MVZZ1Ex999GBOxJCpqlI29yJ1lfhNq7aD4Di9SCKjLsZP1BGgFFpNzYKn80/LVcidrMf0Kl5t1a4d3n+1apDh06UhdJZQu/SEdqWe7w7+JhrXafLzHu2XleOvTxd1h+vACpudG8mD+ljSQMugcB3Kq2h3S36wADMbzxJMfmS1LXLx+pTjMgJaO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(376002)(396003)(136003)(366004)(346002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(26005)(2906002)(478600001)(6506007)(66946007)(6862004)(8676002)(8936002)(6486002)(4326008)(66556008)(6636002)(316002)(9686003)(66476007)(6512007)(38100700002)(5660300002)(83380400001)(41300700001)(86362001)(33716001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+tEdZ9/iFlMgDoEhAvStny9h3+orPJKiXHqgL+yIAV4e73UY1b3XTX0q+U?=
 =?iso-8859-1?Q?TCh9woFSl68/1KS1Pz4lPIZEdIiD7edjEGTrRE+2GkdA7pUmFvi9F40IrZ?=
 =?iso-8859-1?Q?QQERdLO5L8r9lFe0gj46BNwPSxjc7dsPb+/JttLk3KIkOeezfG7+qIwhxx?=
 =?iso-8859-1?Q?3emf5vBUPfqvxxUc1VbisZwbpcpFjDhePhU47Yiq3h00aZ3zpyiwAzvCo7?=
 =?iso-8859-1?Q?y0fG+bj9YuKjFb1nHI2CBTHfGaOI89EH/cOSJe2tytxdm+6kTGuNEnDpGM?=
 =?iso-8859-1?Q?Mskcp+sj+f8OOoJsbbD8untDsUzVNQW3sxgwhzyk2Zp4f5iezAMzcpabcW?=
 =?iso-8859-1?Q?KBbUvMNq/XTzgSc2CnnhgIxARnE0p8+gf1WpO3B4pIZxKeqMTJLm8vEaJ1?=
 =?iso-8859-1?Q?AOYRSlRPKahVXGl1Y0VBMVVcSTCoCDI2hCe+6CtRSNSSuZrejJ0V9i53Tm?=
 =?iso-8859-1?Q?DqafXgIwX9P7zQNuT6RWgOO90cvlu18aGO2lVp2fzjJ9xo+yEBpHGMfvCy?=
 =?iso-8859-1?Q?y8LKgt9WKzhA+9PHpoyWAd2yXJmQm7l0Sjg6c7TOlKJ21D18hgp20h17gZ?=
 =?iso-8859-1?Q?nfwph2sT0t4QnsKa3UcS2RTbaqyzRqDRi2IsYqmxlE2Cy0uT81Tp3lImwu?=
 =?iso-8859-1?Q?PNqJcZxZ8QhwlPQBLB0a4wSYxEQQWJAzdWTPUUUcXy8LGs+gcNcRlWcu0e?=
 =?iso-8859-1?Q?0oNlQv3UUUh/59TOTyvG+v20mcuyhlcRNVGwWI57Kmq5EYeSLer41tEQpy?=
 =?iso-8859-1?Q?VcmQEB9ugoJZNrqfcjL4CFW9tAbnIiSPkVgxDaxmvS+UCv7hWwo/Vv4qqh?=
 =?iso-8859-1?Q?bz/p66oVpsPg83yjEY0fwOVfVzsdrREfd4XEbKhxBgTbRhQWdYka/TKNG+?=
 =?iso-8859-1?Q?FbXnrLDRbBDMbpT5orlE2D45jDOx0t09xyL73njZ0QJYldSOQwq9fYomr+?=
 =?iso-8859-1?Q?ln7DHuf0iUVjEd9ySPTWqAIL2yEJxMqhM5SvFDb1pGfNLX4chru2NmH6gr?=
 =?iso-8859-1?Q?ILRpDcEEUO3RqsXUHMUS6SWb8eZvNzwZl7lfmtNO4ZV0nDnW149jgpKEhW?=
 =?iso-8859-1?Q?eZodi8MaSgV8veXI/paRux8GUCwltk5DiwxA9bsgkrqxJGMepVYcM+6i5a?=
 =?iso-8859-1?Q?6ivl8v56JRyi/G3MuEpsi1dHWdjpObNdJQauhKf/QttGH8AxdJn3GgFGxg?=
 =?iso-8859-1?Q?lPBpY5kwOqdkLP/Tw1zcuhTl6LDq2x++UPdhRplIUKXep926CysmjP2IUa?=
 =?iso-8859-1?Q?oFjYX/8M+hykTG/8AvoGfitLy71NVS9uNmfyg/nb43syPvdhlVV5eDm2D3?=
 =?iso-8859-1?Q?wL366IBEyTAyVIqB9bWtrjlPUTiipQtOqXlqnf/o3e7XlZCmmBOdCM3155?=
 =?iso-8859-1?Q?GubZiAfijGeiZyFyjTSq8iT3K6CcbThMF4zDYsNdPPwUJM0neNwBjaIBqQ?=
 =?iso-8859-1?Q?w3Jep6sdQzYlvBjbZJDZ7tWU/R4+WE2qiyNO39bFd5GaC+aU36wjMp1a8V?=
 =?iso-8859-1?Q?ZBOYlTrlwSAQqD1HG92CEtMu14rt+TVJw1vCded0JzW2pXD8zz0dIIzIaf?=
 =?iso-8859-1?Q?EzhhUMtWsLYXuBXBAbEueoxzcu8N37505o3jGnp/LWNP2iVZvllT3x4Gro?=
 =?iso-8859-1?Q?CoPHbBed5KOWPZVo6ojBjkcEr04XH8RvwqUu47fOCLW1Dy/Lo6DBA9HA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9637b6f-2566-4798-4c0b-08dbfdb97542
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 22:01:58.2945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wr4D+iamY/CAIDPmVAPvXvx/n+j/xJC50mYKMg64e63IYZhsqKIFPfMt1Ea7a2BY6Zg8/Sun43RtuRV31oOUvJLXKRSQ66OIu4ia0H/v9X8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7753
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

On Fri, Dec 15, 2023 at 05:24:57PM +0100, Michal Wajdeczko wrote:
>There will be more KUnit tests added that will require fake device.
>Define generic helper functions to avoid code duplications.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
>v2: allow compose paradigm (Lucas)
>---
> drivers/gpu/drm/xe/Makefile                 |  3 +
> drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 80 +++++++++++++++++++++
> drivers/gpu/drm/xe/tests/xe_kunit_helpers.h | 17 +++++
> 3 files changed, 100 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
> create mode 100644 drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index bfdc2cd92844..d1cc61cbab46 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -154,6 +154,9 @@ xe-$(CONFIG_PCI_IOV) += \
> 	xe_lmtt_2l.o \
> 	xe_lmtt_ml.o
>
>+xe-$(CONFIG_DRM_XE_KUNIT_TEST) += \
>+	tests/xe_kunit_helpers.o
>+
> # i915 Display compat #defines and #includes
> subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
> 	-I$(srctree)/$(src)/display/ext \
>diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>new file mode 100644
>index 000000000000..6d72dbf06139
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>@@ -0,0 +1,80 @@
>+// SPDX-License-Identifier: GPL-2.0 AND MIT
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#include <kunit/test.h>
>+#include <kunit/static_stub.h>
>+#include <kunit/visibility.h>
>+
>+#include <drm/drm_drv.h>
>+#include <drm/drm_kunit_helpers.h>
>+
>+#include "tests/xe_kunit_helpers.h"
>+#include "tests/xe_pci_test.h"
>+#include "xe_device_types.h"
>+
>+/**
>+ * xe_kunit_helper_alloc_xe_device - Allocate a &xe_device for a KUnit test.
>+ * @test: the &kunit where this &xe_device will be used
>+ * @dev: The parent device object
>+ *
>+ * This function allocates xe_device using drm_kunit_helper_alloc_device().
>+ * The xe_device allocation is managed by the test.
>+ *
>+ * @dev should be allocated using drm_kunit_helper_alloc_device().
>+ *
>+ * This function uses KUNIT_ASSERT to detect any allocation failures.
>+ *
>+ * Return: A pointer to the new &xe_device.
>+ */
>+struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
>+						  struct device *dev)
>+{
>+	struct xe_device *xe;
>+
>+	xe = drm_kunit_helper_alloc_drm_device(test, dev,
>+					       struct xe_device,
>+					       drm, DRIVER_GEM);
>+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
>+	return xe;
>+}
>+EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_alloc_xe_device);
>+
>+/**
>+ * xe_kunit_helper_xe_device_test_init - Prepare a &xe_device for a KUnit test.
>+ * @test: the &kunit where this fake &xe_device will be used
>+ *
>+ * This function allocates and initializes a fake &xe_device and stores its
>+ * pointer as &kunit.priv to allow the test code to access it.
>+ *
>+ * This function can be directly used as custom implementation of
>+ * &kunit_suite.init.
>+ *
>+ * It is possible to prepare specific variant of the fake &xe_device by passing
>+ * in &kunit.priv pointer to the struct xe_pci_fake_data supplemented with
>+ * desired parameters prior to calling this function.
>+ *
>+ * This function uses KUNIT_ASSERT to detect any failures.
>+ *
>+ * Return: Always 0.
>+ */
>+int xe_kunit_helper_xe_device_test_init(struct kunit *test)
>+{
>+	struct xe_device *xe;
>+	struct device *dev;
>+	int err;
>+
>+	dev = drm_kunit_helper_alloc_device(test);
>+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
>+
>+	xe = xe_kunit_helper_alloc_xe_device(test, dev);
>+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
>+
>+	err = xe_pci_fake_device_init(xe);
>+	KUNIT_ASSERT_EQ(test, err, 0);
>+
>+	test->priv = xe;
>+	return 0;
>+}
>+EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_xe_device_test_init);
>diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>new file mode 100644
>index 000000000000..067a1babf049
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>@@ -0,0 +1,17 @@
>+/* SPDX-License-Identifier: GPL-2.0 AND MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef _XE_KUNIT_HELPERS_H_
>+#define _XE_KUNIT_HELPERS_H_
>+
>+struct device;
>+struct kunit;
>+struct xe_device;
>+
>+struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
>+						  struct device *dev);
>+int xe_kunit_helper_xe_device_test_init(struct kunit *test);
>+
>+#endif
>-- 
>2.25.1
>
