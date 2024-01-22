Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03E3C47DD9
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 17:19:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC8510E3C3;
	Mon, 22 Jan 2024 17:19:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF32110E3C3
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 17:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705943982; x=1737479982;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=s1hViBjyXlfmnuZLiq7LBuiZbowcemZ+13v3pqi8yjY=;
 b=Kg/REsi2IfWKhxnTgtiJ8a8SocTzV+GzUYp+V5yjTDTAgsIGLB5L56WN
 0nZ/5cUZvPrxDgJAvUZwmA81rI6+PUoTZIoGcrZ02gY+0VuIBwBEhyRK8
 jS3FA6OolNofgaD8yowewr9BHjfbErM8ho6z8A1CaDi5AFl1Q+PzakIrC
 3/GzaCyp3UOHwJDkkrFpeVK8Pgrqi3vxFqt6kJzyPp2q1Z+ndd+++xqvu
 naWCtkvW1zbu/2kVsaRg9KNcLs6B/uv3YmEFIMKPSTAYWe4ZeehsYWLal
 XjJO2rSCUG9AP3CAp0xiyhwu6ub9j2chQa0DK8pw1TNXcZTQLO9VtN005 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="398422246"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="398422246"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 09:19:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="27430421"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 09:19:41 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 09:19:40 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 09:19:40 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 09:19:40 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 09:19:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4N6U4qtS6PprNsx5xcHEjYETuckkOeRz5dm2u+BZDbjNKhDhDhfRlJaXEH/Ae/ViHdGc+myInr0QJJixZXVOvG5ISAg2ECWq3pg4VGOl3M+czoIMMUpEAot0OmrRF9ofD3yW7EXjA3FlsYv0SFQVqjeT/CHGYC2bbxa95n7x6WnWBy+jcX5KxU4QxvJtCBeiQSqSBSAnjtkz9NB0jtA9t9ugBDZwPNfpG0gfgaZHw0uBfRUU3ibLA5glhqGE4YYUS8PE4pouUTJECMXDAK9vT8+fu+6pADAsRMiKse6xuaUtDAEvSZiBlwDIf+OhnwiEsSDgV+S0+w9az/X1TqmeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrSqPAvAhZrzDAClkLYbxBoaqhbfi4YwLjSiZQfJHno=;
 b=BhUcAGQ0IZl9lJxcrGKgOD47hI2h9jqE2HJ1Ooyc4kAeZUZBQYniIunzQMqeMpcjM3vZc4DGC1WAieJp1s9TarOYLPxCrrlA34landjkmpggzjiJcHlR5iN3z9Ha410jD5bIn2eB4hzFzkoDAE76nubhrPwLqDqCz7V9b4K4YAm+uzOXApMnVx+ggWxE8mzYNZBf2JaPpkRt4BfG/uh0Rv+wBo/xBtUN301AIeB2bHkRuEJ1W+XLAR4k8HN14mEr2vhCdlJDPUL5GU6f9/iE34245C/pgEzXG2kCbzOxegsSkn3n0rhVRXokB8RXPo5hgX98WX8NLM8E/H5LOrCZ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6489.namprd11.prod.outlook.com (2603:10b6:208:3a7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.29; Mon, 22 Jan
 2024 17:19:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 17:19:32 +0000
Date: Mon, 22 Jan 2024 11:19:30 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: drop display/ subdir from include directories
Message-ID: <47hzp5ya6cwdcidq7cwid5ykpkn6wavxtf3ynjf3xgirbgulsc@afsk7pgae3lx>
References: <20240122101428.2683468-1-jani.nikula@intel.com>
 <20240122101428.2683468-2-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240122101428.2683468-2-jani.nikula@intel.com>
X-ClientProxiedBy: SJ0PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: 301cbb37-650e-4d15-6148-08dc1b6e4c59
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nkMAqPj4yth/Smj1ER4SHqyboaectZn4p3LsSVQdK9aVERYl1iD6YqEA+ISp2xycPBn2tz4jN72gVoVsJK5iDl41oClJiDzwHo/D7k570mti1sARdM6OgcEeCFDJzsAa1oUuWhrHRdGIrFDUR0rrj9enuJcljZRv7wVO0GOWwAu18YPIxD1sFSTGXt+buaHAuqpRWODQna0/JaJ9y+ifBAewNN8WBTmpF21ZuGS5RH8q+n8oirPjhGBeWZGkdHjD26eqslzHkoXeeBteJDB8KfChPtcl54dsg4dNnioRC+BRtapK2jAkshLbjqf/gVXQKB+Dy+lk+1g9agXjofLmxtm0WsMltPlqpmHlx7OhjdFek9tzAo402+nZCT4aOz4IXUxZjukgWt6drSK6c9JyrS2A8VL7EfYVQWWQDViCX6VPmdOxksXk28tbwg7P7io+SFxrlwlX4CwlUvpzcwJWpDpMaCYdRkrbSRHScob3Vq1jNaFwnUVy51gzWDCNkuBjUkM6AqnYY518Zss/9OvANazKXRPPWeUzWwsNTfDJuLOXqGigBv4puPH8VhUJSNpl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(396003)(136003)(366004)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(478600001)(6512007)(6506007)(6636002)(66476007)(8936002)(66946007)(8676002)(66556008)(316002)(9686003)(6486002)(26005)(83380400001)(33716001)(5660300002)(6862004)(4326008)(41300700001)(2906002)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ebwRRnGQOu7/u7BNuniuRAziBChqticwXQCsrkHcfM7UypNJQSmoiL5srFBb?=
 =?us-ascii?Q?qSMUD8XjUWGRY3PFMclz2jCWRXR6hPlq4QFLn7wINmBIG6cW9kTWcdgmcpf8?=
 =?us-ascii?Q?t7ZuNwil0EhjXh3w96ubwr3QjzKA3lSpLt5oJes1cUomt2+HQwkDwTnZmwmW?=
 =?us-ascii?Q?G504iGuPRu46a4jSQFbD3ANka9YZaWOFpHt/tnO2Fe52sBSqaHzA/+S03PeW?=
 =?us-ascii?Q?BIMZgu/drerYClurub1qJryC7o6vI3LoB9gkpc+Ttew2/Q4DgObLoST7jtli?=
 =?us-ascii?Q?Omj25ByZlpXSe/pk8qZVqNrH+NK1L0kMJ+TboSabxZ1nI7T79SInvDc/hk7X?=
 =?us-ascii?Q?v2Jk+2Ynlv4v3gvXejpYSWNXYzkrJthSUH2EF/V8ytn/EDrlB85+o0DPGKKG?=
 =?us-ascii?Q?YDn0Sk3eDTc3JoWHWiWWMmVW2bdk+h6WeYpCyX5MVn1cv3C2efo8BwMFSFaO?=
 =?us-ascii?Q?TR4Opof2a+SJxpgEsiKhjdct739MBC8ZF6XCB2wM7N6RtznUJtN5Ef6nbANn?=
 =?us-ascii?Q?1ecIDXPiijxiRBq35/nBJqT75z06F9SCLb3hPcIVbiB6+yetTULgVgGoR9EI?=
 =?us-ascii?Q?chZI/wf2ZqMIgQt9ySVwklYuVrcRTYFSOhi8MsWNaVeI9ephSq3uVYUt1XRv?=
 =?us-ascii?Q?DWRYOniW25vvDyJkDgCFukMR8SoJr/6244PU2KUh4SlQJehuh6VFlO8QF6CK?=
 =?us-ascii?Q?6De/6TJw6DMx1IdnccSnlG2dZfW3Fdb1bFz1kfF4YHT2Ho+UAFWTdHiFmaty?=
 =?us-ascii?Q?tJtzlJWfPIBGiey119FPXgVabZwQg5Caj9vBLT8KxNPeFDe9pMqf360HzRtn?=
 =?us-ascii?Q?sjkp6uA8z5jc5EhvVMjK8i9/0vx6R51k3H4RhQdqTGfNAcSVj7g3KGy9IFr4?=
 =?us-ascii?Q?/EEredXC2I9gLtv+9C50MAstFMx4KC550+X+ezGRaYm7cR1rQo0NQhhDvebP?=
 =?us-ascii?Q?0Fx11nisa7Pm438zkcAGqXJzfuYjSy1UuF0SO16G9IJvKZoab5z4j2QUpSAf?=
 =?us-ascii?Q?UPTEFomAm8lLDIXmMUFKfsE4pmbGVQq5VFg412gM9nP8BDhHUzxTB3c3z5pt?=
 =?us-ascii?Q?ie3osv0YAoVw19HQbrohxXT6PbFCJcBGc5trtRglHxrkOx0S8F+TUEtwqy8p?=
 =?us-ascii?Q?zZMZ2HCvCYDOMJF5HozTGin0V0PTDAnwfR0AeyGq6OC8+dpqsgukWlXMNxoe?=
 =?us-ascii?Q?5oKAg0LLveEgVlnk0nbk06qV5Df86+Gg5DJODCciTZJuKN3IP4MXTx3OgZx2?=
 =?us-ascii?Q?x4ulpUOlUYpH1/X14ydsQ1ttZ2hpZtIUgPc38z1t1ZZ9sSzo8h+tBpLR5eLF?=
 =?us-ascii?Q?woYaXmYcKCZtsLZnRWAfeYqRbsAxmY2RHaSZ4RGe2SknmJ/DAQfu+Mqjk3rN?=
 =?us-ascii?Q?wy+/LnLZ9ekZLjjZF14HgPuN2x+IbCnnEgmAZQNmZ3VjVPvqGC1ltK9bbbGv?=
 =?us-ascii?Q?IiMMObvrZpqjTf/3npSYgV4RfDAeJwrKaW5QYlfpzbGX/9+yO99swEPiIc4j?=
 =?us-ascii?Q?KqvmPDBte7UKF5O3nRlCsYa3xTbRYfiEgu8HYaVyx2+1ZEM0Skf8L4vfbF6i?=
 =?us-ascii?Q?prDcQs/Rjnokn3ouwt4LYNuMAYqJwS0xQc059/1/6BYPVxgcqUSJHUOS/f4h?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 301cbb37-650e-4d15-6148-08dc1b6e4c59
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 17:19:32.3850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rx0iF9bUpHZVRpZzGyy3LcZ7SFPFaK+JeBdczqYih3LmT67c96bLx0tqBntrhHyPlIfbI9AdNhVLcHmot8yAGkobXFrlp1BnYSTCpF0lYy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6489
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

On Mon, Jan 22, 2024 at 12:14:28PM +0200, Jani Nikula wrote:
>There are very few places that need to include anything from under
>display/. Require the display/ prefix in #include directives, and drop
>the subdirectory from the header search path.
>
>Sort the include lists while at it.
>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>---
> drivers/gpu/drm/xe/Makefile    | 1 -
> drivers/gpu/drm/xe/xe_device.c | 6 +++---
> drivers/gpu/drm/xe/xe_irq.c    | 2 +-
> drivers/gpu/drm/xe/xe_pci.c    | 2 +-
> drivers/gpu/drm/xe/xe_pm.c     | 2 +-
> 5 files changed, 6 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index e06f99def559..789d310cb5bc 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -165,7 +165,6 @@ xe-$(CONFIG_DRM_XE_KUNIT_TEST) += \
> subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
> 	-I$(srctree)/$(src)/display/ext \
> 	-I$(srctree)/$(src)/compat-i915-headers \
>-	-I$(srctree)/drivers/gpu/drm/xe/display/ \
> 	-I$(srctree)/drivers/gpu/drm/i915/display/ \
> 	-Ddrm_i915_gem_object=xe_bo \
> 	-Ddrm_i915_private=xe_device
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index ab417f4f7d2a..eea0b259ae85 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -15,20 +15,21 @@
> #include <drm/drm_print.h>
> #include <drm/xe_drm.h>
>
>+#include "display/xe_display.h"
> #include "regs/xe_gt_regs.h"
> #include "regs/xe_regs.h"
> #include "xe_bo.h"
> #include "xe_debugfs.h"
>-#include "xe_display.h"
> #include "xe_dma_buf.h"
> #include "xe_drm_client.h"
> #include "xe_drv.h"
>-#include "xe_exec_queue.h"
> #include "xe_exec.h"
>+#include "xe_exec_queue.h"
> #include "xe_ggtt.h"
> #include "xe_gsc_proxy.h"
> #include "xe_gt.h"
> #include "xe_gt_mcr.h"
>+#include "xe_hwmon.h"
> #include "xe_irq.h"
> #include "xe_memirq.h"
> #include "xe_mmio.h"
>@@ -43,7 +44,6 @@
> #include "xe_ttm_sys_mgr.h"
> #include "xe_vm.h"
> #include "xe_wait_user_fence.h"
>-#include "xe_hwmon.h"
>
> #ifdef CONFIG_LOCKDEP
> struct lockdep_map xe_device_mem_access_lockdep_map = {
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 2fd8cc26fc9f..d31e87de5a1c 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -9,10 +9,10 @@
>
> #include <drm/drm_managed.h>
>
>+#include "display/xe_display.h"
> #include "regs/xe_gt_regs.h"
> #include "regs/xe_regs.h"
> #include "xe_device.h"
>-#include "xe_display.h"
> #include "xe_drv.h"
> #include "xe_gsc_proxy.h"
> #include "xe_gt.h"
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index df6b3b31f419..09c50471331c 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -15,9 +15,9 @@
> #include <drm/drm_drv.h>
> #include <drm/xe_pciids.h>
>
>+#include "display/xe_display.h"
> #include "regs/xe_gt_regs.h"
> #include "xe_device.h"
>-#include "xe_display.h"
> #include "xe_drv.h"
> #include "xe_gt.h"
> #include "xe_macros.h"
>diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>index d5f219796d7e..4d3984ae4ff1 100644
>--- a/drivers/gpu/drm/xe/xe_pm.c
>+++ b/drivers/gpu/drm/xe/xe_pm.c
>@@ -10,11 +10,11 @@
> #include <drm/drm_managed.h>
> #include <drm/ttm/ttm_placement.h>
>
>+#include "display/xe_display.h"
> #include "xe_bo.h"
> #include "xe_bo_evict.h"
> #include "xe_device.h"
> #include "xe_device_sysfs.h"
>-#include "xe_display.h"

the downside of patch 1 is now that core xe code can include any of the
display/ headers, but only xe_display.h is acceptable to keep the
interface sane. Or are you thinking about changing the interface?

Lucas De Marchi

> #include "xe_ggtt.h"
> #include "xe_gt.h"
> #include "xe_guc.h"
>-- 
>2.39.2
>
