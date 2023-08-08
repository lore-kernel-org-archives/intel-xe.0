Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A466C001B0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 16:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2224F10E1DA;
	Tue,  8 Aug 2023 16:28:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E235310E1DA
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 16:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691512087; x=1723048087;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OFLJTja2p1fgdH0DBGjZ//ZfkkAf3EQIbibA9lDWcsk=;
 b=RmzAUEC36OvluVSJVBE3vuSI+VUQpg3n4EsSzv72rplFuCMSWTJdnulX
 FP03UuzitfJVMm/DyoHGD6Jjkjf/zw6mQIwJEQq0OYRG1D3jn7HK31CBY
 vTVw5yqG+X3Saup8PWnBVlHJW10sbFP40B+dCF/dJ+lpC0izCaCz/4Ne+
 QtEKzkPoH/GVaJ2bAFsU9uSVmRfBW33ZkoBF3gEvONAuH6OFy5/sVcbuQ
 Xn9NVEvxTkFT15SU0dKraXHtwW+EI3gVpHmfKfYNAD53ZBQPy4jMywbj7
 1WQDOdvCSWIdd+pV8h+QOaj1ofMhsB9SYPJwpewYj2wuYv6lLAeTlDsBp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="457261782"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="457261782"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 09:28:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="821453344"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="821453344"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Aug 2023 09:28:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 09:28:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 09:28:05 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 09:28:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWJGzKJkHi69JlZ4HC7Big2Pn0g7NGXT/hOzKwqAlb+Cgz6MInUAlOjk3A0S491dUl/cE/F5Gfnx7Qe3FLF4S6N58KRcsCycCQY8nMMWsswy2IZwT3aAINI/SW1uqHWQp+tu/QQxWsWdqs/5+Kd4/yvLdAD/3viCer4HXMyv+X1HBlbPa1cp5qbuhPaaXRvixeK7vqAlgqzKH60ZSzhgtp0ukYGlLwcH/S223DVT/c5mFxmAlViCxZPba8eyZpSkYllm14rep3jV9LAVizWZZTpj+8+D7sTXIQUCzcO/TRIXD6scXASTrA56UK2lhP3wSkQNYyvDaOavw+w1v2gV3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2nW5uwtI7z/KWnh0N3olpXazgasxlVcZ7+WZUY8hL0=;
 b=B4C6sivnlyBP2VqBtnn+kdxdVQnQ6gu+C5nB6O9heefaQKW9auPV9q3abp22oDU1IWuZLdrToeY0rDAVLZHUCwxPTbg9qFEWTeHcJzqL+aatpDJsgBJbMhSxVNzXVmUa9k5nAyF84YUInXhSOGqrPYVso4momI0dUyKZ2w0/TziGug78F/sNLlW+5IiW3DhQ035cilSYLIE7592xcfDNF/No0eHM4IaOyURfapur00ZXCwlMKYngOz2VFLXOWfzt3kFqZaeGyipUKhZUY7PxFAUzN0lh8uS8Vz5nIzdMTW5PpBlSfaQ6OWsv77y39fHvEAhG3qVjfu77jIUHBJMM8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4931.namprd11.prod.outlook.com (2603:10b6:303:9d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 16:28:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 16:28:03 +0000
Date: Tue, 8 Aug 2023 10:28:01 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <uc5h46hdu34kr5yrng7jpn4o5fobs5z5ttkfqshqzqg3i4lyfc@ecqj62tyqw5o>
References: <20230807173446.2039-1-michal.wajdeczko@intel.com>
 <vrhcmrdcsrd4pw4mgwcrbrmdinoh2ce3uu7ebrabpqcc7kjjll@2aor4ajoytf4>
 <87y1ilshhn.fsf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y1ilshhn.fsf@intel.com>
X-ClientProxiedBy: MW4PR04CA0316.namprd04.prod.outlook.com
 (2603:10b6:303:82::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4931:EE_
X-MS-Office365-Filtering-Correlation-Id: a1cde23e-7ab7-4c94-6ab8-08db982c707d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bwxw2GdpANcDE3au1TTXc4Ud22FmAc/bT0peoOlMgTpsmgNNnsQCtAlsd/bZ+q3TvNA+2zWHHL0tX2/0i+HOmjYG2oN5PNFdfFrzWET3h4/9vn91T7tR8CpL9ZIfJCFO9FpLmbnrClCRmNXZeFodhIAJlJMZZiURJ3nD2qAJDvMwBzk71jYqK7/AAgxww9QtbADhOqiY1ukKXj0l3XwWX0K876DKOm2k0cFohQ+gtSF3xLHO0w9U4RqhgBMmIc7OUHLINEFDtbarYXdxVzZJy/d8VQTr4FNFkgUdmJSqw8jKsJylKv3zEMmjCZEzvzEfw7QUiXxgjH5uI5++FEvii1eBrBwGeq5oAxNHdAyJkr9ZCy1DppoBRAh9XYXcLuTY+UnSAgS76JSmaByVPmqvwrPEE3YeEm4FjcrYE1mCmGeSK9a0Pc7QkANi8e1qJmy+fUI65ZjdfFU+7HAp0dvUhhqZOJHZlIk3ddIc8AE27dsuueg8JZtu8rvCsXCPkgB9Ur7LtG7LU7FebvYuZtk3zjVCs5xp6RbAdvv8SboGIedplNBJcJ5LmxbAMtIyxxxh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(39860400002)(136003)(376002)(396003)(366004)(186006)(1800799003)(451199021)(8936002)(26005)(107886003)(41300700001)(2906002)(5660300002)(83380400001)(6862004)(8676002)(316002)(38100700002)(478600001)(6506007)(54906003)(33716001)(6486002)(66556008)(66476007)(86362001)(6636002)(82960400001)(66946007)(6512007)(4326008)(9686003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ugtsMFkOJcLqAnelqSLkFfD0Lhbfw7fw/yzVtuLVX3LuLLfL5CcOHmC4VF?=
 =?iso-8859-1?Q?TTkZpZKEW9EsRoPV4aDeKl3PLNwRGnYaCx9nFwNN8cSIUWDTnf6AW8/A2m?=
 =?iso-8859-1?Q?a77rKL9NtWQH+jaCRHoduzX9Ut6LDzodrfylxd/sFWWR1svYjO67J6wo97?=
 =?iso-8859-1?Q?mqhO2VhTCBlWtKIcFLfjIxihEcqI6I8Tm9ckV1/QDnwe12uUdGu1Rd7EHP?=
 =?iso-8859-1?Q?kUvcqeCP5kyvr8igm6n9IQQKUS/WuR4/d2hDiXTe6lgbRAkMnJAIfAjflp?=
 =?iso-8859-1?Q?5NZ/O+e64FRh0KpqjI0d1MdfTyC1RjcbvrAAUmHx7enYOR3NL4Cimh59Od?=
 =?iso-8859-1?Q?mXXmAD4PtffWfmZIyYoPsvcflko4YsFK5APSelmGlkui0RbQTGXJRP5Why?=
 =?iso-8859-1?Q?kFdf8Xh6udOs02DvybdPtZOycZpuiVWpXucbWhN5FPHNN/dSv2O4D06ZKl?=
 =?iso-8859-1?Q?nhoKpfRWYiyUgPcaJ7onH5EvRDuSaZrCvgvJ0WHBMS++oqxxZZY/LSjn0m?=
 =?iso-8859-1?Q?M9KkxOgBuQMY9iH3aBz0ixrgt42QqqSnRSvxHFU22n7LIFrmLfVYC1aJiR?=
 =?iso-8859-1?Q?7+OgKCd5qZ+2fUVl43OV+1qfEplEqRaBJdxhj7omsGbusH2RHlSIoxHn/d?=
 =?iso-8859-1?Q?rV8UGtxDIbIWwv1oOpvGOq/a8xYoaSK/9mhgJqWTULFbWY+WIGBA1fkz1+?=
 =?iso-8859-1?Q?lx1yovkudGj7moumjpGsXVsM+IZ5CZI5f+JjL12CoYd7SvZaWPEq1dEEYf?=
 =?iso-8859-1?Q?wgxVrcq+wL1uFO77ycwhHPL+B0rPd7rSuxNSqiDpXPzvKHUrNBfzuedwhe?=
 =?iso-8859-1?Q?jxeMGbBzlxq2kMFCDUaISvnv+Ptt+z0Go0mBPm+9y3JAMV1rPKRipz8EC6?=
 =?iso-8859-1?Q?50MzJOstz9ecfBmvpRYilFGrtG5EYGKqGfyf64A/amxpBJ/vuUSbsxtPus?=
 =?iso-8859-1?Q?xuIVoWIZ1CMqkm/fWfRLE/IH2y1T259eSsKi2w9SRJOysLPI+LDLDbN7M7?=
 =?iso-8859-1?Q?W+BW84UhV9sJ2Tf82sUkl93Gv9a2BAc7UUB0bZB2FyXWd39DDhxGl0v7gf?=
 =?iso-8859-1?Q?b+g9sduADlhBbSOwgbxvjhER6LVA8POZX/+CcIUOZcyt9svqYS9sn84Jk6?=
 =?iso-8859-1?Q?ahXBdoJ1mNl9WsjNq+lmRjoYDPVDVA3WK1yjkaGW6UYPvQgAItuOhRsTVr?=
 =?iso-8859-1?Q?wlsEGHC+apwJeggUHzKZA48Lr8tXeR76IX5I3073ezPcjeplKZuxMpHNYx?=
 =?iso-8859-1?Q?W3gSw0fnPfJ6+r7TiZX8f03oB+lCVsq84N5gDrjkRhFd1fP9HY+ozCangs?=
 =?iso-8859-1?Q?QW3XZyJW2oeWoWIGey5lh7TtdMHjOZv3PG8+UXOiLE3y7ioFpQRIPGErl4?=
 =?iso-8859-1?Q?13YzGLxX9abX/NxMrEzmSXsgMi4L/I+d/JXKN7s0ZmNUw/PmqRowMHeVwP?=
 =?iso-8859-1?Q?gH3RMQcXRh3IYNOB441qyw+WSb9JrQPWT8jVN8/8T9Ua62oguEMp6ZxZV5?=
 =?iso-8859-1?Q?mstBNMO8bEwMh/m/SHUf8rDDfOyXZr/Fl2KJpBUBhZiXhUInpcTS+jSuvM?=
 =?iso-8859-1?Q?7842lxU/IMNtPYYAlv1ycTA9Ib2M+QqQHwTWReXInhnz7ag6jKWzgpDIDC?=
 =?iso-8859-1?Q?BEm7k/e/cQIbKHncTUI1INbtg7KhlOVHW//BBF4YDR7CB7pDf1YkPmDg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1cde23e-7ab7-4c94-6ab8-08db982c707d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 16:28:03.7782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vEPKjwe4sWNegDRlA4U4T0WbDkCOpYQ1Qb1oRAyBukn+Pxd2BOviEQzVYOebNDJXB64SSuW4iCdsANi5P5FPa1FkNczeeoeuNpTHTKTf+hw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4931
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Introduce xe_ASSERT macros
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 08, 2023 at 06:04:20PM +0300, Jani Nikula wrote:
>On Tue, 08 Aug 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Mon, Aug 07, 2023 at 07:34:46PM +0200, Michal Wajdeczko wrote:
>>>As we are moving away from the controversial XE_BUG_ON macro,
>>>relying just on WARN_ON or drm_err does not cover the cases
>>>where we want to annotate functions with additional detailed
>>>debug checks to assert that all prerequisites are satisfied,
>>>without paying footprint or performance penalty on non-debug
>>>builds, where all misuses introduced during code integration
>>>were already fixed.
>>>
>>>Introduce family of xe_ASSERT macros that try to follow classic
>>>assert() utility and can be compiled out on non-debug builds.
>>>
>>>Macros are based on drm_WARN, but unlikely to origin, disallow
>>>use in expressions since we will compile that code out.
>>>
>>>As we are operating on the xe pointers, we can print additional
>>>information about the device, like tile or GT identifier, that
>>>is not available from generic WARN report:
>>>
>>>[ ] xe 0000:00:02.0: [drm] Assertion `true == false` failed!
>>>    platform: 1 subplatform: 1
>>>    graphics: Xe_LP 12.0 step B0
>>>    media: Xe_M 12.0 step B0
>>>    display: enabled step D0
>>>    tile: 0 VRAM 0 B
>>>    GT: 0 type 1
>>>
>>>[ ] xe 0000:b3:00.0: [drm] Assertion `true == false` failed!
>>>    platform: 7 subplatform: 3
>>>    graphics: Xe_HPG 12.55 step A1
>>>    media: Xe_HPM 12.55 step A1
>>>    display: disabled step **
>>>    tile: 0 VRAM 14.0 GiB
>>>    GT: 0 type 1
>>>
>>>[ ] WARNING: CPU: 0 PID: 2687 at drivers/gpu/drm/xe/xe_device.c:281 xe_device_probe+0x374/0x520 [xe]
>>>[ ] RIP: 0010:xe_device_probe+0x374/0x520 [xe]
>>>[ ] Call Trace:
>>>[ ]  ? __warn+0x7b/0x160
>>>[ ]  ? xe_device_probe+0x374/0x520 [xe]
>>>[ ]  ? report_bug+0x1c3/0x1d0
>>>[ ]  ? handle_bug+0x42/0x70
>>>[ ]  ? exc_invalid_op+0x14/0x70
>>>[ ]  ? asm_exc_invalid_op+0x16/0x20
>>>[ ]  ? xe_device_probe+0x374/0x520 [xe]
>>>[ ]  ? xe_device_probe+0x374/0x520 [xe]
>>>[ ]  xe_pci_probe+0x6e3/0x950 [xe]
>>>[ ]  ? lockdep_hardirqs_on+0xc7/0x140
>>>[ ]  pci_device_probe+0x9e/0x160
>>>[ ]  really_probe+0x19d/0x400
>>>
>>>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>Cc: Oded Gabbay <ogabbay@kernel.org>
>>>Cc: Jani Nikula <jani.nikula@intel.com>
>>>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>Cc: Matthew Brost <matthew.brost@intel.com>
>>>---
>>> drivers/gpu/drm/xe/xe_assert.h | 160 +++++++++++++++++++++++++++++++++
>>> 1 file changed, 160 insertions(+)
>>> create mode 100644 drivers/gpu/drm/xe/xe_assert.h
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
>>>new file mode 100644
>>>index 000000000000..7ea295b7091c
>>>--- /dev/null
>>>+++ b/drivers/gpu/drm/xe/xe_assert.h
>>>@@ -0,0 +1,160 @@
>>>+/* SPDX-License-Identifier: MIT */
>>>+/*
>>>+ * Copyright © 2023 Intel Corporation
>>>+ */
>>>+
>>>+#ifndef __XE_ASSERT_H__
>>>+#define __XE_ASSERT_H__
>>>+
>>>+#include <linux/string_helpers.h>
>>>+#include <drm/drm_print.h>
>>>+#include "xe_device_types.h"
>>>+#include "xe_step.h"
>>>+
>>>+/**
>>>+ * DOC: Xe ASSERTs
>>>+ *
>>>+ * While Xe driver aims to be simpler than legacy i915 driver it is still
>>>+ * complex enough that some changes introduced while adding new functionality
>>>+ * could break the existing code.
>>>+ *
>>>+ * Adding &drm_WARN or &drm_err to catch unwanted programming usage could lead
>>>+ * to undesired increased driver footprint and may impact production driver
>>>+ * performance as this additional code will be always present.
>>>+ *
>>>+ * To allow annotate functions with additional detailed debug checks to assert
>>>+ * that all prerequisites are satisfied, without worrying about footprint or
>>>+ * performance penalty on production builds where all potential misuses
>>>+ * introduced during code integration were already fixed, we introduce family
>>>+ * of ASSERT macros that try to follow classic assert() utility and can be
>>>+ * compiled out on non-debug builds:
>>>+ *
>>>+ *  * &xe_ASSERT
>>
>> pass by comment, not really checking anything else here... Why are we
>> mixing upper/lower case? It's perfectly fine to use XE_ as the namespace
>> like is done for other macros.
>
>I think it comes from drm_WARN, but yeah, could be XE_ASSERT.

yeah... I think copying that would be like perpetuating a mistake.

Lucas De Marchi

>
>>
>> Lucas De Marchi
>
>-- 
>Jani Nikula, Intel Open Source Graphics Center
