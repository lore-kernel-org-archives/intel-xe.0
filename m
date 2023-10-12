Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80EBCDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 16:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9221210E526;
	Thu, 12 Oct 2023 16:59:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA5E10E4B4
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 16:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697129970; x=1728665970;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NIzKlufYGLebUMJPdUf6q6X+uElDKZ2ecWtrqB2wd24=;
 b=BcJj31vd8z8i07r+nhHlS+THsm5FtqpkHPLfq1UkN13hgy2wTpFma0wC
 fEg8I8aNJx6MjfreEHmTr4vgxwCIMcnSbcedJprD4BJ2BlqAGp5re62Kq
 PXBdu+sL3Lew5+6Y5FcPzB1KoVh+FXM+02LHjfsZ2ZJqYv2zRQcX4BSC1
 R3Bgoxs/ZiLBTcuB5Pe3eqZjq91SbE2loE+uu1wYLMSydAACzCPlBHOlC
 QrzjSmKUOcotS3ncPEH+e2qkN9/IoQ+0BJotZl7a87ZU/tUh44YxOupjT
 Hzse1L0W3dQgAD/6ahU6jiC58TkybA+Kzl1XhfdpvOe4OoGO1qXXmbLsp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="370047453"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="370047453"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 09:59:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="789489927"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="789489927"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 09:59:29 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 09:59:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 09:59:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 09:59:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GVM5xR+d77be93bPqIu1yKUNvSDiBqVJmmIxaWtCuN4Xj7prnDeQ3XKtA1W1/tUFZ9a67RUSilkvz72Gs/91GDoKKdrINzkRdlnEVAteS3Iklxc46E+dZWF95fb2Z8SI2zfxyYG9sug04DXCXyIJKUzIVXU6kBIW193Gvw2rPVX7JZrElTu1MrpLnLG35H6N1+bTiFmZHvStSKhkzH59sjKCI5afAonAjQNAWKKFqET9CaiBAHMX1Cd24bgcVhdWa1jhvNXXei3YSdnyBqbo8zEcLsmQH8r3Tr0ZijWmvrj5aY8uSQusgJj189k6S9am289z++afsoY5Zokyb5O8Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdFy35w0oANJOrHWRl5ERZLAg4Zs0VYEgAbteJI1yKQ=;
 b=hEXYsWM3wBZ2a5pyPcyI/3R7c/YDDcw54BYtwsKYUp/xsTPzA6T3gAcfCN2iiAtF//ap7JZV0Eed1HDxMDpfhQ41Obs9xJYMrJXKaJnZrRXhSYWWM332wbxwxI0Um+mdLtIvsZ6Xx5lDZ9gTwrFiIC67RDOU64XeDbmXt1/Ishag+BA9UI7HjCWjZbg4xq02BxjDh6HeS1JQifgsoyJbf5mE+yeNzRIJ4/NBe8jfJ9dU9RTQyiSMf5/rJbpp24rqyAfdKCpD8VCVEe2KlpPOdqB1g4VPc5w9kqOeMMU8jiz9qzgL88Y79+QqBec3Lt/P/hHjvFmLq7ZiSPcuTDAoxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA3PR11MB7464.namprd11.prod.outlook.com (2603:10b6:806:31b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 16:59:26 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::cf65:94e6:cdd3:cfe]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::cf65:94e6:cdd3:cfe%7]) with mapi id 15.20.6863.032; Thu, 12 Oct 2023
 16:59:25 +0000
Date: Thu, 12 Oct 2023 11:59:21 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Message-ID: <opaijpckzlmscgltti5o552ryzuqjc24t32pqkdvfzdowagsxz@63taggrkrdjv>
References: <20231012125410.2127337-1-chaitanya.kumar.borah@intel.com>
 <20231012125410.2127337-5-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231012125410.2127337-5-chaitanya.kumar.borah@intel.com>
X-ClientProxiedBy: SJ0PR13CA0165.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::20) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA3PR11MB7464:EE_
X-MS-Office365-Filtering-Correlation-Id: 517237f3-5781-4dcc-4a01-08dbcb4496b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7nhN22X+hGUdw3ucJ/g541VTYK+OlDzTAz62y/TG3/Wjxo3vNl86tqlWno0rdDBjzAo4TyCVaVdkD6AJm/R788hCyX+q4WQPMOIeJydU6UNuYzoVfED0faYm5HxWzFp9m9AidsVW2fCagg95Whv4VA7jOihugaxQCs6DkaKoObp2r2LfvFot5F8tfQ0saMEOTHtYSvXX7W0vRV3M/QV/iGKpMXFtOZrFZTXnz03ppMmEE8X3AGr6Z2oPla4J/R7BFup1rI5bg1y7i5H6XYZ3B4qmSaBfuduBrpkDwNfLZrHku3W78cRmYv1bV2ddIGhBKl00Pw6PBuEHmGrfAZoWMNK966Iy4s0ufWx0a02Z/ScpAQl3J2ia3VYXOlDM412T4oQZ07wVoim2+Q+I8RRX/4H5Eh7OMiXdwYzC6NueoL3RFi7DDu7wJsRUGFoJ++yZ2b3OJs4+ssjXpFFnEaMJ9x8h3U6QRKvG8edYsRsZDw0O9FteE18iEwUNhnbMlUm6s47qHHU6FIGYmSBbYM0mvrIS7bAC+Kmsl23quJarHzb+SIwZPw8ImZRoMKjHGsO9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(39860400002)(346002)(376002)(366004)(396003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(316002)(6636002)(38100700002)(8676002)(8936002)(6862004)(82960400001)(86362001)(33716001)(4326008)(66476007)(66556008)(66946007)(6506007)(2906002)(41300700001)(6666004)(9686003)(6512007)(6486002)(5660300002)(26005)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KnzfImc54VDFywm4IsBJTYooYN7BJD/DZE3+Fgn96YTHWUNRqz3M4LUvc+?=
 =?iso-8859-1?Q?shx353wJIKZt0TiJXyYC+Shwi7NCViUh0U8Ngoud1+hp0GIzgE57opMnvH?=
 =?iso-8859-1?Q?0Yo3dU6x29XpvLfJeCpvlaNUiAd0tSUdHKIiDcaKDhXNqNg+qZnAxsy/wQ?=
 =?iso-8859-1?Q?ksvX2GBu1u3/fs1qbSaQfhY/euJf3b371pUFuaMC8FT4ofVqaaVE5q0MHX?=
 =?iso-8859-1?Q?bu11y5b3CKq3Rr5w4zMjqJ9YR6eMYLwgcXXcwg1PBEQugmbgQPhnApnyL7?=
 =?iso-8859-1?Q?tBDqa7gs7JjHb2JGXM8+HmPizM4w4AZJN1JrEYk0I2bHPOdNrbxKecgy/w?=
 =?iso-8859-1?Q?SmP3DsM+7rHJsb3yZokk5PtUq/YH3v6oHKWw5z681pQK42JYdqfLM1A5Yt?=
 =?iso-8859-1?Q?apZg37o4Sz+SFSvgTbB45p3IaLE1kcMiqYUuWZJXHeYtT0lccCH/a6wMpK?=
 =?iso-8859-1?Q?AW70G/dndqTDfbJKQ9ATOiUSmXUy9oIC8qwX07X71MoU9I3dCIS9Zg+oM5?=
 =?iso-8859-1?Q?FLgqKh7xRkVPcnlA4cuXhsEE/1PGozbu6+1lFc/4V/tgBkG45V/mcTGjZB?=
 =?iso-8859-1?Q?lx78MG2NLYIr6xotZ96faPf8P7mdXe7j7B6+C6OrdveE4gN/eiEACFcu+6?=
 =?iso-8859-1?Q?Mf4lgzJ0ucqRFFwXigVDTRQyDCGvsUH61Fq1i5ghn6qHytj8PsBSLGTpgi?=
 =?iso-8859-1?Q?Hw3C0NzbRyOT/XaeeonLuKX+v0TeVSDYe34IY5bm+NuiWmjVINH1OK6VcL?=
 =?iso-8859-1?Q?RVNc6jHSNDXRFmvs4bRXgeyp5VlpvTCremIwyOR12mBEoKNr/fW/S1h4Hv?=
 =?iso-8859-1?Q?Hu3e5QOE9jCIk3FLuGk5lLcZQeALolqDkX/u4L4txlwDRrUdOMVVb7FyF3?=
 =?iso-8859-1?Q?OYH3PZ6FEHnH4N+3+vqJMYnqHOmC33rTAuSiPTTCUsikD7bw+s7oLSyUw5?=
 =?iso-8859-1?Q?Ia50ADSa58QL6MiJTwJG8H/EjgZ6/0WqHrpr+3ommx2047PATf/tRi3W4Z?=
 =?iso-8859-1?Q?HJkWmf1YfCXR2Lv/N4Y1l6X0TNrtZ69ArhQOvLIvCnRiXZrQ1pUked0BRM?=
 =?iso-8859-1?Q?M4Vk+6qc4h+pY6VftP90CK1m0WUBSlqSQ7Kd1rhH6/HvO3Ny/fPVASEbbw?=
 =?iso-8859-1?Q?9lRFn+mMoAao7kQMvhhyNUonJH/kQ6LvVNxtoigzV5I53yuQ0//BlJBJ0X?=
 =?iso-8859-1?Q?9Q4f3QJgoNfcJO8KIuJEMSqqVkV/3VpfKjTz5MbeNebUy+5Cki5zoBZY8w?=
 =?iso-8859-1?Q?hVUs609mLIlSMENkaRoBSViekTQgaNrksHjDAINssMI4HIKC35BNIkrR2K?=
 =?iso-8859-1?Q?T9nklClPzMnIsqwRQNn7j/yM6DADYRySbE/fvEQZ+EuJ8PUG4uJMKC92fW?=
 =?iso-8859-1?Q?H0k/Y8Nnrx2k3F/JnOTw+qNH1BaWQUxZo3Rf3UORx6tAl8VgBdleyxvGQC?=
 =?iso-8859-1?Q?OUr4IF6YK8tb9/RfQgozWCgLBf2owJm/q9l/tLR06gWIIbltvp5aiIuSaY?=
 =?iso-8859-1?Q?6E4478XA69n5RnDmQJzbCHGT4qWBwPE+Z9glRCT5eLiQjfkDxgWIMK/UgM?=
 =?iso-8859-1?Q?3ytSTQQG6QKP1qsswzVozFxOGchFLFCOGfgnAux8wJbiMM7J7iFyNMX6m+?=
 =?iso-8859-1?Q?6kbN2zzYvqCMoxdBcgAJmwvsT4gVR7IHLmW16W9HRJvFJ70rOYJwMb5Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 517237f3-5781-4dcc-4a01-08dbcb4496b2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 16:59:25.3014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/x3uIgHqe4QldEGt0J0eTNAei9rY+6nTkEt2j+MSt8plJyA5n5S96YzpxFzTzuN2fI80i5F8DvG6CcNSCMmFI6DJM2MW1oTworyoA/qatQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7464
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/6] fixup! drm/xe/display: Implement display
 support
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

On Thu, Oct 12, 2023 at 06:24:08PM +0530, Chaitanya Kumar Borah wrote:
>Add compatibility header with helpers to get display step name. This
>is needed to maintain compatibility with intel_dmc code.
>
>Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>---
> .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  1 +
> .../drm/xe/compat-i915-headers/intel_step.h   | 20 +++++++++++++++++++
> 2 files changed, 21 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
>
>diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>index 8f55f63ff28b..ed7c39b4f770 100644
>--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>@@ -20,6 +20,7 @@
> #include "i915_reg_defs.h"
> #include "i915_utils.h"
> #include "intel_gt_types.h"
>+#include "intel_step.h"
> #include "intel_uncore.h"
> #include "intel_runtime_pm.h"
> #include <linux/pm_runtime.h>
>diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_step.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
>new file mode 100644
>index 000000000000..0006ef812346
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
>@@ -0,0 +1,20 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef __INTEL_STEP_H__
>+#define __INTEL_STEP_H__

in xe we keep it consistent at using 1 underscore:

$ git grep "#ifndef _.*H__" drivers/gpu/drm/xe/*.h
$

in compat-i915-headers there is a mix and match between 1 (used by xe)
and 2 (used by i915). Maybe we should normalize compat-i915-headers to
user either i915 or xe style.

$ git grep "#ifndef __.*H__" drivers/gpu/drm/xe/compat-i915-headers/*.h
drivers/gpu/drm/xe/compat-i915-headers/i915_config.h:#ifndef __I915_CONFIG_H__
drivers/gpu/drm/xe/compat-i915-headers/i915_debugfs.h:#ifndef __I915_DEBUGFS_H__
drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h:#ifndef __I915_GEM_H__
drivers/gpu/drm/xe/compat-i915-headers/intel_pcode.h:#ifndef __INTEL_PCODE_H__
drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h:#ifndef __INTEL_UNCORE_H__
$ git grep "#ifndef _[^_].*H_" drivers/gpu/drm/xe/compat-i915-headers/*.h
drivers/gpu/drm/xe/compat-i915-headers/i915_active.h:#ifndef _I915_ACTIVE_H_
drivers/gpu/drm/xe/compat-i915-headers/i915_active_types.h:#ifndef _I915_ACTIVE_TYPES_H_
drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:#ifndef _XE_I915_DRV_H_
drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h:#ifndef _I915_GEM_OBJECT_H_
drivers/gpu/drm/xe/compat-i915-headers/i915_vgpu.h:#ifndef _I915_VGPU_H_
drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband.h:#ifndef _VLV_SIDEBAND_H_

Lucas De Marchi


>+
>+#include "xe_device_types.h"
>+#include "xe_step.h"
>+
>+#define intel_display_step_name xe_display_step_name
>+
>+static inline
>+const char *xe_display_step_name(struct xe_device *xe)
>+{
>+	return xe_step_name(xe->info.step.display);
>+}
>+
>+#endif /* __INTEL_STEP_H__ */
>-- 
>2.25.1
>
