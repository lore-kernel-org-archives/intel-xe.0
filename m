Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73A9C004C0
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 23:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877C610E0DD;
	Thu, 19 Oct 2023 23:08:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A7510E0DD
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 23:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697756901; x=1729292901;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8F1xyCfu3+9iIjMYl1g3BT5Vef9CWv7ioHKUE7/6sOY=;
 b=EPIAmguM4bGu2AKmwyVLo5xv1ihsndENaUvqOkoCHQrE9nUhPvQk1JW3
 O6pqEYgqy8DuMwFN0jtH9p03r9O6TDQwWhngzi4iGL1C5zFuB6+GK1Dis
 QzrPByw1k4s45RRu8Z21IkkcCBZcWViwwXWaqKk2/8orJixcdsE5RSWWi
 tl+dNNEe8r3zW/D2PSlBUUz1h8TPRQUOOiB0zq1udZAul759WX/5GRURI
 P4Ov/Val/1bpWv16l65VjhPnGYuwiLyVCuBE/89rVAKMQTfPIsNma14DO
 Yg8CMM0Y6YaJYRzQuixSZWJ/w7lhdFXGYZ+ca1v/2DNQoW/plIkbsHZAB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="452865830"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="452865830"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 16:08:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="823014674"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="823014674"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Oct 2023 16:08:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 16:08:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 16:08:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 16:08:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7n6eTYdTU2/Vvnpzatjc+ypCzERshDO2BhN8dd082pa+WBgW8t22GkyqQwEj4fFTifqHM1FXy3m1TTBsvyGs4rQohEQn8pDRZRbfeYCEjP6DDOtWH14s7kMPPH9JEjT4sfTeYq2zEw/5qdgQ7UQB2exi6tUUJqeWER31u3/BlSC3pX8MO5oemn8JpoY0g+l3E6iJ5WrPpwibrs8AHkAPT50DQ4GrfU1wfzbek8vvpAL5H2e36S3nujeNQuNu57/aaRy2VaNBfMP+HXr7GzWQ6u6HNrFGaMEw4p5USDel4fxsEM81Pfq996JtJoLPABLvVrM1eSt40jGmrNTnzBeeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwX3SXaUtNE62kzcuzR8SeiGaz1ooqc94WUq9/95xJs=;
 b=DMSmxR6DUn1ukv4IZSMHCxB5GRyIqKakVAkkWor0BbeOFbUKd77wkeuHF4D84NxH99J4BIp9kUxKT9XXLjFHbTaLwYYsQ6/D8E5STEuyIgpjPXxtd5xxgXrX4DHMVnL2q+T68epmF5T6CbfBCqv/X0rEgSAqREPJe2OpqhBpduQrBFkIPuCIT0TDBvH/Ybqjpp6IK8zOAz5SnmgOFuaddLtBPFhugWx3r55l8l1Lt4qgdObubc8hEOORukfx7ET61uTECx3Z6higxoVBm1u0dy2eW3uPxyl1BQiWIlSh4YiM2Aj0yOiqrf8O/09/GihNZ8hM7jd2tps7KUU5GvAq3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6140.namprd11.prod.outlook.com (2603:10b6:930:28::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Thu, 19 Oct
 2023 23:08:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::c228:5055:b7da:d0bf]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::c228:5055:b7da:d0bf%6]) with mapi id 15.20.6907.021; Thu, 19 Oct 2023
 23:08:03 +0000
Date: Thu, 19 Oct 2023 18:08:16 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <2bbc4nyusu3zdpfrxlvkz67jzv7t7hwmm44znc7ekbugybc4st@alhg2sbdfqux>
References: <20231018225707.1685294-1-daniele.ceraolospurio@intel.com>
 <20231018225707.1685294-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231018225707.1685294-2-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BY3PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:217::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6140:EE_
X-MS-Office365-Filtering-Correlation-Id: f22623a1-7b0d-43a1-adb6-08dbd0f83f16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3EBbKDugH4BOwcth0EgB5rFoXz5qR/XsctxsibQDLFAo4KxMhBk2pYiaQ8SG7YBwCjYejunM9ET7VFI/HoRzOgAUMA6PyuZaPmNcYQ4yC7m04/qHtBYVwoBWInyJ7ClmwHSv7ZkvhgiLZxZgK2u02xnZUpVCdEX8tMlSFxqslBbD4qGW58gRoPC926QAFKt8f8AEFE9flp+CkHpk094kKEmqQ2hpN+lyvJBIw6gaBvvFLXpiLhLiQPw4AV4hWyR4w1MU3gJsbG2ypxnGk6oufeGJfOXXcpUrZ4ovIjXeEaA6FO9rr597Qqn5AmQE4Kl0+mUQPGIbjtQgoC6zjx53+lGLqty1/AYNtRBVXu3fZulT2JKWquh5q65vWIAPBx9VYdpv9tznbGuOleIEIhWv01hXaZJFf8WlWOxfKT9cEtXj0ofR/IPKZqV2KERzvbfdKql0sHmQnpVG2JT2DuwE4HY9rV4zjWNWzvyk91c1w3cNGeui8XN3cMJ4SlVba8uGd1nfjrsUqXCR4fs0iYByNo0fRi5qal887NoxZFmU+xHNz4dz9fFp58DNp4CvZh0Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(346002)(366004)(39860400002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(26005)(6666004)(83380400001)(6506007)(8936002)(316002)(6486002)(2906002)(5660300002)(41300700001)(4326008)(8676002)(33716001)(478600001)(6862004)(86362001)(6636002)(66556008)(66476007)(66946007)(82960400001)(38100700002)(9686003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ieYt2GVVt1mUDywbV2k6xHGOTL3XFVq1kBMGfch8THCjRXEvh8OxunusSXwL?=
 =?us-ascii?Q?Yw5nb/8Ou1bra1nwygEXR0uvEeKXzemS/w6yKCL06IZ9nZOjMTEDN4NKWUA1?=
 =?us-ascii?Q?j3vsq3IiCFiuFlHFMw4/bpEBzV0KdTdVwnqoXtpKGz7JTZ5NrlbnvBQ25MZD?=
 =?us-ascii?Q?sENoPGpaxqOPW4AjswClP5t6k4MeJPUVB234fZrDCb91qg+3tlhpASt7b+rI?=
 =?us-ascii?Q?Zh+H83oj8BmCGZ9M6H6myj+CZWmEpD1CHNPY3LtQQpRH/XUYsKzcXBsnoUey?=
 =?us-ascii?Q?m1n2FPTV1c12MBNHX/8fDd0OPq8I6sKGiqUAyjed86l4IMYKz16can06sEuh?=
 =?us-ascii?Q?AdacqhQhWBrKroVVSMfeW2/p2CLHMXsISDv4eI/7pYkmbKNJke3YD5iieITS?=
 =?us-ascii?Q?q5b8n+GK4cFlJeKyXSQX6B0jSFVf8+NKNQ1+fg3ZiiVl7qAeRo/XYv0RM9hs?=
 =?us-ascii?Q?U6TtJZllQge/s3svKTpO96swvhq1wr6k2iLzf91Lp+E0cN87MeCTliWugUml?=
 =?us-ascii?Q?lFapPdmIAtfyPas4dOO4GDu1E/mRiZAwX6hNIlnUv3dhxX7llUFTROEg87RA?=
 =?us-ascii?Q?l67K+xK//LyeH9y8Dt7tCTGT+AvZTj6SXDeFWb3gre9GdeAGbbgLK1+yJQHE?=
 =?us-ascii?Q?g2izW8IiA471ueFETj3FhqM3/qyoIW0zHy8iVO3+tM177Ex3ogItl0i6cy3a?=
 =?us-ascii?Q?B/A2lNtKryoCZtEZfYb3c5G7qTnuQClQ6EOtc58mjKZGelFM46dh1zKtX9yJ?=
 =?us-ascii?Q?VnmljncX1Z3ePRaSJ5aNOPPbIZ6QJ6prgsXRs4AMjJR9Gjwfty/FY0BAs1LZ?=
 =?us-ascii?Q?juiDAt/r+zzkwjGa+6Q3smGdw5KFtlfFx1ZF/rlQRYiDbtucn19Q8H+B7/er?=
 =?us-ascii?Q?6gkeMSrDn1+naKt4kTuOfKW9Z20tfOjx1bqFE50cj56lNZw0CsYAc8G0crWi?=
 =?us-ascii?Q?Zmmmqr68wnmqcSxtUgaQQcZqldFLvbke+0F62mEJgeBWR3VvraDCCagdfMtW?=
 =?us-ascii?Q?3ccvge00L+ORYPmjUXcnADSDycdx6cGnOHbuY7sGKT7jd5jBHtc4bALlAAEF?=
 =?us-ascii?Q?xa+KxFgbntaqydTVF32n910lX2DoECnUNHomxtWfoilMr26hTaRF12ftgQiF?=
 =?us-ascii?Q?sjKWkwurPDk6PUK4hhdqxBR2j7xu7CZp6oMkMfODpQSwvuxVDTYjZKJX2+rW?=
 =?us-ascii?Q?eBSsp7X/uEJOiFkRiIWIn8+mCiAxetD4D6YbpnUWxVedosT8XJH0fCEqgpre?=
 =?us-ascii?Q?Bt6UOaULgtqpDsW0jVRy55jO/IhoTFs1S5gVf0Puz9azYCinZIy7lb3/vt/b?=
 =?us-ascii?Q?x/T9VTrL5hWmDPyz+JeGnW9RNRIJzqEvp0YUGdIY9zMLveLhznbKPf5rxff7?=
 =?us-ascii?Q?n4HEhld5alg4guY7ebGQXGpGXku/DnAil0mvh4wciye7vh11jWBdUaGwtn32?=
 =?us-ascii?Q?UgpW+JH0Q4qsEmouOqCVvxMt4cx93juJs/WR4w5bSRrqctudmf4zqkZ34Uc6?=
 =?us-ascii?Q?3oLoPxCi6ZvMm0+kGRlbIRMTp87Fn3PvEad4AT5QDUSjuYkzPSrjqjcKimA+?=
 =?us-ascii?Q?JnhkDnvdOizSB2A3f6+UWaWItycPP6e13SmKRwWc8qYwxvIuE7+SNWyFfw0Z?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f22623a1-7b0d-43a1-adb6-08dbd0f83f16
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 23:08:03.3637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxPyJYvtD/PfIYujfWXsEwraMriDzEyqyDEqt3uBW0qJXX5sE3aWh9Sj+J7mKHJ+fdtsYxd/s1s7Ff4cfzTAI0g+X3qfZBL1r9mG7+vrRAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6140
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/5] drm/xe/uc: Prepare for parsing of
 different header types
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

On Wed, Oct 18, 2023 at 03:57:03PM -0700, Daniele Ceraolo Spurio wrote:
>GSC binaries and newer HuC ones use GSC-style headers instead of the
>CSS. In preparation for adding support for such parsing, split out the
>current parsing code to its own function, to make it cleaner to add the
>new paths. The existing doc section has also been renamed to narrow it
>to CSS-based binaries.
>
>v2: new patch in series, split out from next patch for easier reviewing
>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>Cc: John Harrison <John.C.Harrison@Intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> Documentation/gpu/xe/xe_firmware.rst |   2 +-
> drivers/gpu/drm/xe/xe_uc_fw.c        | 117 +++++++++++++++------------
> drivers/gpu/drm/xe/xe_uc_fw_abi.h    |   7 +-
> 3 files changed, 72 insertions(+), 54 deletions(-)
>
>diff --git a/Documentation/gpu/xe/xe_firmware.rst b/Documentation/gpu/xe/xe_firmware.rst
>index c01246ae99f5..f1ac6f608930 100644
>--- a/Documentation/gpu/xe/xe_firmware.rst
>+++ b/Documentation/gpu/xe/xe_firmware.rst
>@@ -8,7 +8,7 @@ Firmware Layout
> ===============
>
> .. kernel-doc:: drivers/gpu/drm/xe/xe_uc_fw_abi.h
>-   :doc: Firmware Layout
>+   :doc: CSS-based Firmware Layout
>
> Write Once Protected Content Memory (WOPCM) Layout
> ==================================================
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index edaa195fa25f..7345f0409cf9 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -13,6 +13,7 @@
> #include "xe_device_types.h"
> #include "xe_force_wake.h"
> #include "xe_gt.h"
>+#include "xe_huc.h"

it doesn't seem this include belongs to this patch


Lucas De Marchi

> #include "xe_map.h"
> #include "xe_mmio.h"
> #include "xe_module.h"
>@@ -344,57 +345,22 @@ static int uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
> 	return -ENOEXEC;
> }
>
>-int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>+/* Refer to the "CSS-based Firmware Layout" documentation entry for details */
>+static int parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t fw_size)
> {
> 	struct xe_device *xe = uc_fw_to_xe(uc_fw);
>-	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>-	struct xe_tile *tile = gt_to_tile(gt);
>-	struct device *dev = xe->drm.dev;
>-	const struct firmware *fw = NULL;
> 	struct uc_css_header *css;
>-	struct xe_bo *obj;
> 	size_t size;
>-	int err;
>-
>-	/*
>-	 * we use FIRMWARE_UNINITIALIZED to detect checks against uc_fw->status
>-	 * before we're looked at the HW caps to see if we have uc support
>-	 */
>-	BUILD_BUG_ON(XE_UC_FIRMWARE_UNINITIALIZED);
>-	xe_assert(xe, !uc_fw->status);
>-	xe_assert(xe, !uc_fw->path);
>-
>-	uc_fw_auto_select(xe, uc_fw);
>-	xe_uc_fw_change_status(uc_fw, uc_fw->path ?
>-			       XE_UC_FIRMWARE_SELECTED :
>-			       XE_UC_FIRMWARE_NOT_SUPPORTED);
>-
>-	if (!xe_uc_fw_is_supported(uc_fw))
>-		return 0;
>-
>-	uc_fw_override(uc_fw);
>-
>-	/* an empty path means the firmware is disabled */
>-	if (!xe_device_uc_enabled(xe) || !(*uc_fw->path)) {
>-		xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
>-		drm_dbg(&xe->drm, "%s disabled", xe_uc_fw_type_repr(uc_fw->type));
>-		return 0;
>-	}
>-
>-	err = request_firmware(&fw, uc_fw->path, dev);
>-	if (err)
>-		goto fail;
>
> 	/* Check the size of the blob before examining buffer contents */
>-	if (unlikely(fw->size < sizeof(struct uc_css_header))) {
>+	if (unlikely(fw_size < sizeof(struct uc_css_header))) {
> 		drm_warn(&xe->drm, "%s firmware %s: invalid size: %zu < %zu\n",
> 			 xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>-			 fw->size, sizeof(struct uc_css_header));
>-		err = -ENODATA;
>-		goto fail;
>+			 fw_size, sizeof(struct uc_css_header));
>+		return -ENODATA;
> 	}
>
>-	css = (struct uc_css_header *)fw->data;
>+	css = (struct uc_css_header *)fw_data;
>
> 	/* Check integrity of size values inside CSS header */
> 	size = (css->header_size_dw - css->key_size_dw - css->modulus_size_dw -
>@@ -403,9 +369,8 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> 		drm_warn(&xe->drm,
> 			 "%s firmware %s: unexpected header size: %zu != %zu\n",
> 			 xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>-			 fw->size, sizeof(struct uc_css_header));
>-		err = -EPROTO;
>-		goto fail;
>+			 fw_size, sizeof(struct uc_css_header));
>+		return -EPROTO;
> 	}
>
> 	/* uCode size must calculated from other sizes */
>@@ -417,12 +382,11 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> 	/* At least, it should have header, uCode and RSA. Size of all three. */
> 	size = sizeof(struct uc_css_header) + uc_fw->ucode_size +
> 		uc_fw->rsa_size;
>-	if (unlikely(fw->size < size)) {
>+	if (unlikely(fw_size < size)) {
> 		drm_warn(&xe->drm, "%s firmware %s: invalid size: %zu < %zu\n",
> 			 xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>-			 fw->size, size);
>-		err = -ENOEXEC;
>-		goto fail;
>+			 fw_size, size);
>+		return -ENOEXEC;
> 	}
>
> 	/* Get version numbers from the CSS header */
>@@ -433,6 +397,60 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> 	uc_fw->patch_ver_found = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
> 					   css->sw_version);
>
>+	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
>+		guc_read_css_info(uc_fw, css);
>+
>+	return 0;
>+}
>+
>+static int parse_headers(struct xe_uc_fw *uc_fw, const struct firmware *fw)
>+{
>+	return parse_css_header(uc_fw, fw->data, fw->size);
>+}
>+
>+int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>+{
>+	struct xe_device *xe = uc_fw_to_xe(uc_fw);
>+	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>+	struct xe_tile *tile = gt_to_tile(gt);
>+	struct device *dev = xe->drm.dev;
>+	const struct firmware *fw = NULL;
>+	struct xe_bo *obj;
>+	int err;
>+
>+	/*
>+	 * we use FIRMWARE_UNINITIALIZED to detect checks against uc_fw->status
>+	 * before we're looked at the HW caps to see if we have uc support
>+	 */
>+	BUILD_BUG_ON(XE_UC_FIRMWARE_UNINITIALIZED);
>+	xe_assert(xe, !uc_fw->status);
>+	xe_assert(xe, !uc_fw->path);
>+
>+	uc_fw_auto_select(xe, uc_fw);
>+	xe_uc_fw_change_status(uc_fw, uc_fw->path ?
>+			       XE_UC_FIRMWARE_SELECTED :
>+			       XE_UC_FIRMWARE_NOT_SUPPORTED);
>+
>+	if (!xe_uc_fw_is_supported(uc_fw))
>+		return 0;
>+
>+	uc_fw_override(uc_fw);
>+
>+	/* an empty path means the firmware is disabled */
>+	if (!xe_device_uc_enabled(xe) || !(*uc_fw->path)) {
>+		xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
>+		drm_dbg(&xe->drm, "%s disabled", xe_uc_fw_type_repr(uc_fw->type));
>+		return 0;
>+	}
>+
>+	err = request_firmware(&fw, uc_fw->path, dev);
>+	if (err)
>+		goto fail;
>+
>+	err = parse_headers(uc_fw, fw);
>+	if (err)
>+		goto fail;
>+
> 	drm_info(&xe->drm, "Using %s firmware from %s version %u.%u.%u\n",
> 		 xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
> 		 uc_fw->major_ver_found, uc_fw->minor_ver_found, uc_fw->patch_ver_found);
>@@ -441,9 +459,6 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> 	if (err)
> 		goto fail;
>
>-	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
>-		guc_read_css_info(uc_fw, css);
>-
> 	obj = xe_bo_create_from_data(xe, tile, fw->data, fw->size,
> 				     ttm_bo_type_kernel,
> 				     XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
>index 89e994ed4e00..edae7bb3cd72 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw_abi.h
>+++ b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
>@@ -10,9 +10,12 @@
> #include <linux/types.h>
>
> /**
>- * DOC: Firmware Layout
>+ * DOC: CSS-based Firmware Layout
>  *
>- * The GuC/HuC firmware layout looks like this::
>+ * The CSS-based firmware structure is used for GuC releases on all platforms
>+ * and for HuC releases up to DG1. Starting from DG2/MTL the HuC uses the GSC
>+ * layout instead.
>+ * The CSS firmware layout looks like this::
>  *
>  *      +======================================================================+
>  *      |  Firmware blob                                                       |
>-- 
>2.41.0
>
