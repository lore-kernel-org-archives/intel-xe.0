Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6B9CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 16:50:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F4910E50D;
	Thu, 12 Oct 2023 16:50:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD9610E50D
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 16:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697129414; x=1728665414;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=stCmmPJRMRC/APCeRVg2kXAy8me2TKZztEvtlColz/s=;
 b=ROo4IfDPg97hOdQTWioY/cfo1iSN8/8RC/fqoEjBmAUdfpAldh7FrNMu
 huPReX54y/jIx9NbgvoAOKJSnN5B3Q66QwdfDa4AhuGgh+9O791pW/OuD
 +LJTFqyO7QkZyzuEkrGdSB9KKPJVOYkfBg6L7LiV7RYEDLOQinVdpHicy
 OHwC/gLoE5z6xbIZAoJNLQwmrImWqgA2y6ZwaB0Pu0F+Zl3kkl+Xd/ylq
 fuzD/Ip7hyQKc28aH3b8SI7M1HF/m2G9vijrtzFWqaNd7n1J51f3SbUBt
 +TEOZGJAjATz9MmknEXk21dGDh0qSOsWhcDz1FGS+iztqQSkDZI4oBr3K w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375328057"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="375328057"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 09:50:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="898188745"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="898188745"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 09:48:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 09:50:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 09:50:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 09:50:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 09:50:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=laYmyLUTAf4/hxBnsBOghxJz/V8iW4PdRdMhwJW15VT9X7UqSUskJdXHs+ZJMZfSnzaBOKRaiBh3ZDHs/P4AfTt6bg0RO9TIq/G9IlIlQM2lAfnq1t2oYcvuVHrPW4pSU9kjG3tIPiUWKQQDvqrrKUi56OKc7La/QWjYyz8W/dzkqDNGNISwLaY6o0kZW25ooE+UwsI91mS1fEs+Ff1sjdh5OIY9njqdWlDRicIP1cRJOw4SlvcBxDy9OV+WT/fi9nw+oHh1lOqIHOE+gqkIqlKL7cqYHLDRoSxRd7phnCCavC/KWRrjOb4xJ7Y/+3brV8RTqOQDyIFLdyOtNeUgJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YmU84p8FEDqa/E+BcLagFK60tySe30QZDtGRBfCtZQ=;
 b=JQAqZVUvXgLCXfMCdbjlhWw4q29E8S7pyY7Do7GwMBLU55Whwp+YgNPHpr18dKE+wMprfEdQVLKKT68/8CRpc7PaZUjOVI6H6yL7u8bfoenVIwiI7mlgjJVYEVZrWK/FsRA3oZvefA7+SZRiqA6zE0eDSafFDfgD0a3YSUecOHKbqBFl4ozCkrIEO7Rp3F7MXWY/gS7Z5Q8qomoC9Ga6X6tulWMeW4CfAE4gGLnN0x169tycWASIQz9JcmNJRXlDenb5z3i2dVs2xzxPmKM3sTEnUvUZ8uI/hVK5pehy6e3eXsSUOfg8lbSuyx/FGU1Vn770dm57iAK75tav0WowMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CY8PR11MB7267.namprd11.prod.outlook.com (2603:10b6:930:9a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Thu, 12 Oct
 2023 16:50:11 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::cf65:94e6:cdd3:cfe]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::cf65:94e6:cdd3:cfe%7]) with mapi id 15.20.6863.032; Thu, 12 Oct 2023
 16:50:10 +0000
Date: Thu, 12 Oct 2023 11:50:07 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Message-ID: <finhh5yofvmiyiugkjf53gpjtdedg7f2gsnrwwfn6kgvt4cx3g@q3fspuyuj6fj>
References: <20231012125410.2127337-1-chaitanya.kumar.borah@intel.com>
 <20231012125410.2127337-7-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231012125410.2127337-7-chaitanya.kumar.borah@intel.com>
X-ClientProxiedBy: BY5PR16CA0028.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::41) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CY8PR11MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: d45748d6-0c12-46d0-8f53-08dbcb434c06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6trKMFtPvE8yCZRqB1+8GvQTm1fUfdxn1vigRKT1aZ1V2II5XXIsQQNrum3h8zaps86LY6exPdg5JYPoFUJOGhbl3LWQ6DEGbR8NNvgHwOKBoMYnKOA0p5Pv0pdPaj5ib84+fIM9XlmP0pNm6Vn5pac+wlvQFZF9gE1TabkD4ZcyJ6DrZGoAYc5fLufzaT5t9RTTkNBtnP6pmb8f835VfKHhduyc6lVTshLUXFG1s8X37RfIHRYm5eNtZLbtsk2ISbtdi5JaWgoIvFAbyYdhUJBaYQC/1wXPBV7hFq0Q5ZIQlk4qTOEjsCdLtpLoF1hmJeEBfTXP17Qwur7sOxMb8qJBThkpnHKESZXvgokhNwR79o13WAifdBAYLftcSnQw9ya5YWK+ywVUMdW65huhQ0BfyLZVad+Z2rv+Se219+ucT5x3oFsbbRuCn1MzpI9M1YofOV8vEAK1B+ZDm1z1uBA2Tf94WT2K4jmZST2mKLW8x6LV2U6hb9yzuuLq1XPtJvxzLTAP4cQUF7cCigc0ElHt3bvllXAg3Kpbfjm8L26VTCzoNd2cNTITzhwRNB60QV9CLJ8dl+1ooAovCmBIXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(39860400002)(346002)(396003)(376002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(26005)(478600001)(6486002)(6506007)(86362001)(6666004)(41300700001)(8936002)(8676002)(6862004)(4326008)(66946007)(6636002)(316002)(66556008)(66476007)(2906002)(6512007)(9686003)(38100700002)(5660300002)(82960400001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0gNQh8CGS/h+RLgbhspDI3PS/OOOuKelegBxzHh/sHIYqYouYV+46D9SRG?=
 =?iso-8859-1?Q?gX46pixkA1FE/q+lSUWMOeypdL5+2XgCqGGDyeRtyfUDI2hj/lmNMZOVJQ?=
 =?iso-8859-1?Q?KZa+Ol7JFz8Q4k2p9F4Ud2fd/qTq+2hcagEH7kq+lNOJ7bbv/LFEe+khAR?=
 =?iso-8859-1?Q?9Uod/zSnjOIuC8OWTJLqYp4gBab0PEeVGBYcQIWFHgv2NHEbowj6Jz2hwk?=
 =?iso-8859-1?Q?myjiJPKVWuqZbjVu98q8U+L3VIqegiiBPwT33ueXqULW6UGP8w6IU+CpBn?=
 =?iso-8859-1?Q?HDpN9gxMk0QZ6ozf47NLJDmjXnrsnJ2GTWWLxID0IB3u8qAlM3GoP4SYBj?=
 =?iso-8859-1?Q?uXRUue3XYbWAd87wknQcpcH1b3RTP13Z+aHMTRkf4Y1fiUq8JhWjUgm3PK?=
 =?iso-8859-1?Q?tgTF0tbzY52zNrPrVcgqEis7ZGOZdmrQJ7Xw45uXMNBCWwVdqPJw6lZOy0?=
 =?iso-8859-1?Q?brspSmxfba7yh1fxxxETCUlMHQOI1Fui/m4koPi+fnQSbkpRoQxX9S5Nqo?=
 =?iso-8859-1?Q?FBMmhoENgtsRmIco6rA0GauiBEYZZXsz1vqwW7O6S5Ju3fhs+6ktPzDoKi?=
 =?iso-8859-1?Q?j+U2fP4jvnmzsHVdxxggq23+nyXERR5NyTaIKNqMW0g+n7JhSrfK+JO/pt?=
 =?iso-8859-1?Q?1wexAYl5nk+Q7MZaV1gyN7r+5Tyv6P88+wyKPj2GvxN/yLN/PsUYL37Xky?=
 =?iso-8859-1?Q?AhO70+VUdiOplIUnvM251pWa1ClPs7Cg4OA6QlTGvFYwLR+M9RHcB5cXL1?=
 =?iso-8859-1?Q?YqU88yJYPHFn6c+Sp2v4Mkdz50tKDPyFfQgPKDAEp7OqVLl0Nbicgd4zTC?=
 =?iso-8859-1?Q?j9fjD9IF7wLfU/BXtJxyOz8bFCW9gIeJED/rNCpOZ7akFS6mSMFPPAtiYx?=
 =?iso-8859-1?Q?W9HhPvNlypbcFnkTkQmZvK32ebnRocKt87l6hmR0VTeT673epaWBms/wiM?=
 =?iso-8859-1?Q?hCuo2KXltHv/n5XyQ5+QpysQkyPO6YMGJbm4Y7BuGHcDOrhz6nz1vtln8M?=
 =?iso-8859-1?Q?T382p03gv+53t1xmUlcG49+/x3wVTTSNN3AGOu7KMXdoVgmbn4LckUqJXJ?=
 =?iso-8859-1?Q?SVSgeia8efGvbu6yDC/Zqrp15XhzxyRoUSo5YckGM1MPIgDwDTOQ9sit1K?=
 =?iso-8859-1?Q?LuwXxOLv23biPSy2VpOZOtMb14rWkJOMyK17kQGaPVCChsClu0NcxbptKx?=
 =?iso-8859-1?Q?gFzaine9OsGsVyNwaeWr2837edLYh/aMTYaxfGQ/c3PCqYp9FblawuUOKm?=
 =?iso-8859-1?Q?08TLZ6RHQT8BPnDbAXwU4YOoVKp1OVMTGC+ihON4MosnUyD1Elkmm9t03X?=
 =?iso-8859-1?Q?L3JlwHfOWGPvtd0cv7kPDbwXLZiFqe7f2kYkKFWcObnQsTE3+3P6YmUDyU?=
 =?iso-8859-1?Q?iP9+EvTmkE56tvMsBgMI6dSHXmajNcFvUXNF1UGEkWAVFORR5Zm5HNLbbn?=
 =?iso-8859-1?Q?i+nyeQiEzspJJa/uwxHDK9DtPzJA1qZTByJJwF6aHryxGCHPITtiTKgI2M?=
 =?iso-8859-1?Q?ZiDsYv3mVOXzKc6uxdgVW0CTMlkp2wX45FqzKKu7SsSeXpG6NUfDb67HVL?=
 =?iso-8859-1?Q?Qv+VVe9UUYal660Vy8Kd8LY5IqOlG4AyQ7oKRg7YAKGSjCvW2jkI0tI5oM?=
 =?iso-8859-1?Q?Rz1n741LRARpekjKxMaIumxY0HhHK5Sg2t4ruzQ+pNGKhfNJah/7tVvQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d45748d6-0c12-46d0-8f53-08dbcb434c06
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 16:50:10.8876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: th+vWQiq36xfUMP+VH6eR6ESylns+B1ja7WEVGb3+KzLG7EC5w+Cwv0Mb7MpIV+B2IQNcBivg14NMUQqc6Ahp0gPzpO4w8HqJ1duc4P4ZeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7267
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/6] fixup! drm/xe/display: Implement display
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

On Thu, Oct 12, 2023 at 06:24:10PM +0530, Chaitanya Kumar Borah wrote:
>Add definition for INTEL_UC_FIRMWARE_URL to maintain compatibility
>with intel_dmc code.
>
>Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>---
> drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h    |  1 +
> drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h | 11 +++++++++++
> 2 files changed, 12 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
>
>diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>index 9cbe16863be2..4e922446e40e 100644
>--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>@@ -22,6 +22,7 @@
> #include "i915_utils.h"
> #include "intel_gt_types.h"
> #include "intel_step.h"
>+#include "intel_uc_fw.h"
> #include "intel_uncore.h"
> #include "intel_runtime_pm.h"
> #include <linux/pm_runtime.h>
>diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
>new file mode 100644
>index 000000000000..7d37bc453165
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
>@@ -0,0 +1,11 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef _INTEL_UC_FW_H_
>+#define _INTEL_UC_FW_H_
>+
>+#define INTEL_UC_FIRMWARE_URL "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915"

that may not be the right URL for xe. For any platform officially
supported by xe driver, the expectation is that the firmware will be in
the xe/ directory. I'd rather just point to the repo like we are
currently doing:

drivers/gpu/drm/xe/xe_uc_fw.h:#define XE_UC_FIRMWARE_URL "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git"


Lucas De Marchi

>+
>+#endif
>-- 
>2.25.1
>
