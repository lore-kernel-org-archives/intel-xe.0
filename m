Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E62DC48BC3
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 15:06:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE93210E4A5;
	Tue, 20 Feb 2024 15:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EVRBJWhO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA07810E4A6
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 15:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708441603; x=1739977603;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=93qL9Xde3HYuITfZgwbyjXb5KTW/w7S5ORAJa/AejG0=;
 b=EVRBJWhO+wPR/9w0xmfG0ZY2iQ9rwkLuOTzFKdiGQJc0rybqZcVFB9sC
 xX990Pkr6YslZdqowV55A9/AvZ89dsx+AmeM2fxuVJOgIT3nQRDmdxDrO
 VaS2aURbZsbRMC920CbC8H9pjTvJtqvPt8NMtKbj4ybLlMf8v1QUFcfK3
 xokZLf9O/TT7PMsk/siwm8WwW4PYT8Fb73K+GVcCdkL91hga7C2/Frgsb
 Q3zuvyaoMeU3OY97mcBGdzIVRPjlyV1F4MvoFvWXSGn4+ACxpaFjvpogX
 6OELxSdCz4d1T5Z/2fWdcC1T1I7FhzLoqCuQyOgSvf3r+iVicKMM+dLG0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2425930"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2425930"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 07:06:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5155551"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 07:06:33 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 07:05:49 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 07:05:49 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 07:05:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWxe3h5X0NlUoePG8h/VfdrraM5ahQ2IRAkv18kRc52W5S8OVkMDbR/xVQOLKp6+oWUwoFTHVtKJT9J8xGO7Ymes5t2YEyYpWkT+nQxYMTrZqxrK9yv1IE1W4aBQOsfwawKLyg/tg4sNK6UWSjyrDRrCoIIZ7FUXqSLeriE1s0sNuFMVOTuan9jbJX+beVlJI6yzzkB7/vZMOI94QF+XL7hhmD8UjWevL0QpL94/+JYxRhUvV9v5PSokWF5tKCt0Gx/C8z2qgJdASEocxuQMjoVnaeeIJGpVg/OV6cOIl6vFzOxgkZYo9aFRq0xFW4YeTW1YBx12L/JRo2u28PWqZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwuxTsOrFlWcrjRPO2IS+KXJiudcntt39AnFhtmv8EI=;
 b=M8qBFvGRDZdZv3a5mY5KOHI1avdSwEiIOZQ4bvjfLMG8mE7Mk493coHkRlm7TF6jSOO8XpE/ZY7bV7Z6TjxL2WB34KpLG3BpHT2cAWtyacV/HkAw+m742TT7kYi6PX0velVEyXEwfYt9aeY6RALUOPKvE0LVt6EPxLxnB1IRBFQ6vbqJjNAMAOfwCFQl/hDIiLn78u0+INfavcLP76FDgCfvgJLBlBL1YhxXmSMx8rp3MpGHa95SzyAeqR/KYQfYX4JgYyQ21Ghmw9iDiUQv5ADy6ytn58SB5OyvMrV+ioZyhEf8B3+9GNnSuZlghjvceGRLrGn5xiYedlfQhF1PiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7562.namprd11.prod.outlook.com (2603:10b6:510:287::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 15:05:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7316.018; Tue, 20 Feb 2024
 15:05:38 +0000
Date: Tue, 20 Feb 2024 09:05:35 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dafna Hirschfeld <dhirschfeld@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, <ogabbay@kernel.org>, <obitton@habana.ai>
Subject: Re: [PATCH] drm/xe: change 'include' syntax for generate/xe_wa_oob.h
Message-ID: <mkj4vb64j5no2ko374lxqr5gen5hhls2qieipflhut7crdjnmh@cfeusfaiyhlt>
References: <20240220090003.1523866-1-dhirschfeld@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240220090003.1523866-1-dhirschfeld@habana.ai>
X-ClientProxiedBy: SJ0PR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ec7251f-56e5-4c3b-3f40-08dc32256559
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9BpziNgDn/r9NZOHp5XJD+UeFxxrTkpL2l3H0pWQBEkzyCYjwGOU3vZ5qUgiAO3tHd4Pte1eAzSAfbmuDB+hhkQM8WlyY3VId/wI2Of8Pg5nHhKwMUu4OzkbqKd21pwVG/zmyE49c6dJzSQOXVj0t4YPUidL/qryIaj5uDpn5Y+5h7agXxsT/bB5rdTA+i8Dq8wnlKCWpnAok+g703lu3rlZO8oK6sMHeYqzRdH/g0b8ke1so+Nklnm4e/ilVZMAFToBO36j2WLkQEPYp5GRYuYYiii8u3geYYafH7y8vWU6kgSnKcaRgW1TAhnTvFk+ONI+YsyMiBoLrWNAYcnlSiCrC9wBa1l7n0UhTLdhcxfzJYOKpgfIWO2pylUV4lb2Xti6PCQJfZMyMpnuOs288kmPie1Ahn/DHpx6q4RPATisbuq/xYCAITb3cR6Tz/iTX0l/iNNOhqukbt6/6PpoJDT1wMeuYKxVTOT6hvWqrmfG6TjRPjrZadfNFa6rvJX8q+Ilr4vLySSvxGmowWncgVDK3spqYbKxGpxhrrqpecGz0+WYbDpnSNkr7N4zKxI8m7liepAm/jwhLHOhVZiraAVTu2QHcK/jgTN/JXzc1co=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(27256008); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fDxkmVF8NkV6JNkjloeL04Qihfn5sgJ/8863xD5gxoP7OZnvoaYVDPuOOaKs?=
 =?us-ascii?Q?aRgTaCPjktrzd+uxL0CITvEwlw4D8HPiyVOnDshfyhQatmLwohyuPZAIcG5D?=
 =?us-ascii?Q?o3Qu9wfITlAtuPdbo/v7FBA56yU8bFzzYUR+ig7LzRTP6iyOeyJv16NBhzCm?=
 =?us-ascii?Q?zOYwI7FbayDV2hodrndZTgLZYoXH3JHdCZMKyvS113rxfkUwmQ2KjvU4O2Ew?=
 =?us-ascii?Q?0TQzMsLPvs8d4HfiTIlqCJcGtWabCUCikIr8jlAY8/1MdaY56E6sDo+Nl9Qj?=
 =?us-ascii?Q?DSmISW+JpHdnPovl57hpmZR/Kit5Ov8OlwMe5LyULRBZMZ+kIYc92b8Mhuiy?=
 =?us-ascii?Q?FNzU2WtJmCFvfpZN87vof2YPVUU0ooCjKxrkAN3Kj/z44y3NftX1XQgyC9I5?=
 =?us-ascii?Q?oYuey1ZH/9MJJrP0Vqc4KscBkcLSWWoAXUFM1DijmkpSSbSyBaxrnviturz0?=
 =?us-ascii?Q?Npyi6xQpV+nbxl8K0HxQDFtKki0NGOj6TaEX2jgYdiKcwcen3TMMOzV1/PZB?=
 =?us-ascii?Q?7yxx/wRuxGGUEv0Kr+1oBdZkN2Qot2tbuMaOop4Ery5OywttwD/KyU5+eBuz?=
 =?us-ascii?Q?3hDjy8jWZ+BsaGyCrOS9I/eFR5zXWpkUFfXzEs2rcs+iR76CYGRV/Vf4dcoJ?=
 =?us-ascii?Q?hkptFTz0781x3dQWnSmPLqDiKl1Wlzmickapf85sR52lN8MfaZDXC8FmLpHb?=
 =?us-ascii?Q?sVQui7hAaenQ8CxuOOJUb/lDA+N/kFT88TxbNiqjSMqXX7qVAYcNsGHZMCxV?=
 =?us-ascii?Q?/am7xMcahJ+/opFV+8GdxBsaW0FxP/U1+d93wkB5UU5WoB0DWFVvCSvCIKpF?=
 =?us-ascii?Q?ERCLzbvtD/9EX9C0VExm9jrG9bMl/rLGzVgdGR+/RCxJZFR+PV7oKWzfpp96?=
 =?us-ascii?Q?2ei1VcYB5LEGtHKfCpsdowdXYkwwWKHKNDLIGSGV+ccHEBWfr9oMzDs1veV/?=
 =?us-ascii?Q?f1rMweoFM3oCxyFX5rP4iDArncpLqK9pmGG0o+CKrwjcO0n0IqmVOqgeG8j1?=
 =?us-ascii?Q?cL8XS9kAl/uSB0XXz7PCMlaU9O/dIgR5gPm3vmzSdNEONe7BxnsBr3okWDjA?=
 =?us-ascii?Q?B8HYNw2F5kTiEFLbK4RNKF+k4MRg4jBgJjPuvVaq88U5EQ/lJpR1ObAap16m?=
 =?us-ascii?Q?5F8b8OVGC1gk4qxNzlWo3dO202wwxOg1hiTtf3WbXWcvReM1bs/GRq7JnXg5?=
 =?us-ascii?Q?DtEjtU1Y9EN8r1shG8O+JnEgDyM0lToYXKduKqYe18UOXvyKayU5KLHBBR9w?=
 =?us-ascii?Q?DxBrjuqFl+QGgp1E+V5vNMygNLzbKegMvFXw4SPv6GPNk8dpsbl9cKtSwc6+?=
 =?us-ascii?Q?LbN3hLoJ5vJzn4RX8ya12MS4i5qEx7C6jc0AkAjWJtWwq8+Wf20eDPa2V0gl?=
 =?us-ascii?Q?UqWP2e1kJGdo9ACzKFNtf4XBDWTHhNHWtjPVHAVLreL5PzaffzNdqFzxqVxL?=
 =?us-ascii?Q?KPAe1OJ1jzfQniM8eGkjyy5GH+TeahgyyzCj54UgC3jrjUAcNTNCDrGIWe+H?=
 =?us-ascii?Q?DYZ+WGzvEINzP4V6BZ9n8ugC/xem+gf3uuFphEgLleu2hV7wZ5qtY8n/LSHz?=
 =?us-ascii?Q?ZSgTjiAbzNvELtYPV2ENTTqvDaEeqMIhsjJTD1mdriHYipMq00JKliWCPXoh?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ec7251f-56e5-4c3b-3f40-08dc32256559
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 15:05:38.1132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RxXsqw3Z6LVco0yVxW3pbq5HiigQVo0slVfIaZKKGCQVVTHX2n22p3MalEDLq/EyvKVsgD3tTan9qNNBY4kF0SntYP4mFrtlDw62fo9UTpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7562
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

s/generate/generated/ in the title, but a better patch title
may be:

drm/xe: Do not include current dir for generated/xe_wa_oob.h

On Tue, Feb 20, 2024 at 11:00:03AM +0200, Dafna Hirschfeld wrote:
>The generated file 'generated/xe_wa_oob.h' is included using:
>"generated/xe_wa_oob.h"
>which first look inside the source code. But the file resides
>in the build directory and should therefore be included using:
><generated/xe_wa_oob.h>
>
>Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
>---
> drivers/gpu/drm/xe/xe_gsc.c            | 2 +-
> drivers/gpu/drm/xe/xe_guc.c            | 3 ++-
> drivers/gpu/drm/xe/xe_migrate.c        | 3 ++-
> drivers/gpu/drm/xe/xe_ring_ops.c       | 3 ++-
> drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 3 ++-
> drivers/gpu/drm/xe/xe_vm.c             | 3 ++-
> drivers/gpu/drm/xe/xe_wa.c             | 3 ++-
> 7 files changed, 13 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>index 0b90fd9ef63a..ea01caeb423c 100644
>--- a/drivers/gpu/drm/xe/xe_gsc.c
>+++ b/drivers/gpu/drm/xe/xe_gsc.c
>@@ -6,9 +6,9 @@
> #include "xe_gsc.h"
>
> #include <drm/drm_managed.h>
>+#include <generated/xe_wa_oob.h>

let's be consistent with the other files and add a blank line above this
to separate the groups.

with the above changes feel free to add
my Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


thanks
Lucas De Marchi

>
> #include "abi/gsc_mkhi_commands_abi.h"
>-#include "generated/xe_wa_oob.h"
> #include "xe_bb.h"
> #include "xe_bo.h"
> #include "xe_device.h"
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 868208a39829..fa217f5a386e 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -7,9 +7,10 @@
>
> #include <drm/drm_managed.h>
>
>+#include <generated/xe_wa_oob.h>
>+
> #include "abi/guc_actions_abi.h"
> #include "abi/guc_errors_abi.h"
>-#include "generated/xe_wa_oob.h"
> #include "regs/xe_gt_regs.h"
> #include "regs/xe_guc_regs.h"
> #include "xe_bo.h"
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>index 3d2438dc86ee..a66fdf2d2991 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -12,7 +12,8 @@
> #include <drm/ttm/ttm_tt.h>
> #include <drm/xe_drm.h>
>
>-#include "generated/xe_wa_oob.h"
>+#include <generated/xe_wa_oob.h>
>+
> #include "instructions/xe_mi_commands.h"
> #include "regs/xe_gpu_commands.h"
> #include "tests/xe_test.h"
>diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>index d5e9621428ef..c4edffcd4a32 100644
>--- a/drivers/gpu/drm/xe/xe_ring_ops.c
>+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>@@ -5,7 +5,8 @@
>
> #include "xe_ring_ops.h"
>
>-#include "generated/xe_wa_oob.h"
>+#include <generated/xe_wa_oob.h>
>+
> #include "instructions/xe_mi_commands.h"
> #include "regs/xe_engine_regs.h"
> #include "regs/xe_gpu_commands.h"
>diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>index 662f1e9bfc65..3107d2a12426 100644
>--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>@@ -11,7 +11,8 @@
> #include <drm/ttm/ttm_placement.h>
> #include <drm/ttm/ttm_range_manager.h>
>
>-#include "generated/xe_wa_oob.h"
>+#include <generated/xe_wa_oob.h>
>+
> #include "regs/xe_gt_regs.h"
> #include "regs/xe_regs.h"
> #include "xe_bo.h"
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 836a6e849cda..efe9a0d300c0 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -18,6 +18,8 @@
> #include <linux/mm.h>
> #include <linux/swap.h>
>
>+#include <generated/xe_wa_oob.h>
>+
> #include "xe_assert.h"
> #include "xe_bo.h"
> #include "xe_device.h"
>@@ -34,7 +36,6 @@
> #include "xe_res_cursor.h"
> #include "xe_sync.h"
> #include "xe_trace.h"
>-#include "generated/xe_wa_oob.h"
> #include "xe_wa.h"
>
> static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index 3299130ba10a..a0264eedd443 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -9,7 +9,8 @@
> #include <kunit/visibility.h>
> #include <linux/compiler_types.h>
>
>-#include "generated/xe_wa_oob.h"
>+#include <generated/xe_wa_oob.h>
>+
> #include "regs/xe_engine_regs.h"
> #include "regs/xe_gt_regs.h"
> #include "regs/xe_regs.h"
>-- 
>2.34.1
>
