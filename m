Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4047CC02190
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 05:42:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F4210EA17;
	Fri, 31 Jan 2025 05:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="amazCKs0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C0010EA17
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 05:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738302126; x=1769838126;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=444HcAaPS14cb1tQc9wLkMlZtWEub4fezJkqjCt0fJI=;
 b=amazCKs0rjPe8le8c3Nsad43CEZtQaULXuNR/G/afb/YsxbLfKed7qiW
 Q8PIkxqXc+x5Zmk5CnIjN0b2/WBkF23AZUfaAq/8T7CQBx650eCZ+HlqF
 qCEIjZlatS6cwGf5VdV4aXBFReRlkik3ZQHXvC+xp++vlHTeO0WF1EaHr
 QwMPmniXyRA7X+4e8wBxkQk2NNXN/6MMKJnFvtVo3tcsI3/uL7gZqlUlR
 pRqdJu+E0qSpEibEr0koSKFmJkCok3GU6mEyN6qr4+cphmsPR6BBEQuS7
 rqZFVi1h1SyL+yzlk86yA+uUWVPuZy8vgFMFbBBHi7x//wygy80vx4/K+ Q==;
X-CSE-ConnectionGUID: UgbHHNSPQe2RoopCbJ7y1Q==
X-CSE-MsgGUID: WD74z/NXSP6N2fgF0x4LsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="61338694"
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; d="scan'208";a="61338694"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 21:42:06 -0800
X-CSE-ConnectionGUID: 9v8fJGvyQECWbAjmd9Xd1Q==
X-CSE-MsgGUID: oF2sfAmCSRWN7l5coSwY/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; d="scan'208";a="109383825"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 21:42:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 21:42:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 21:42:05 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 21:42:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EYY0urqFwayxyVVVtswCe20Jw8X2Lmh/pZOE4jBmlYtFAnaP5ECbt9pyUeJ+x2ILYYfedUvn7SAveDUtcZVfDxvsPXSop5DfK/+/C2A3flj6YWZaBzZZD1+27hwW0JLazaj/RDb2E6zZW3NPIZnJoCm4jNgrgwH54NxGhs7mjVGPEaUWa1sq0ja8ZXxKG42BjqYnB/T/qUSZHgyKrirWt9Xb+VyEAQrF14RVLxB3J+ZgSVzxfHnXymfCjgVyd0Fzm9B3zDwwhLSolDGJyF1RO97ELO4ZLXn/cRp17MVWW7Olv50bu07hbrk7sV7ALs4bPIVaj1SJW9mp9g9f2nu7HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nFxzvsx5Ora6dCisghNGvwDNa5GkXnXIH+0b539X20=;
 b=ITX6NT+9DexHnjZ/9X0aPMvER0N2IZZc5UhVfWV98FwfLf/culg3+PaOp2MaRDB/f5cwf4CJoC0hEzhGElCGouyH9aveS8WbTRwwE7Aw5z4rTBzhn1RnaE6lnQUDMoF/KCtaRZyUTagtrX4K4LtUsu4+XtrYzNM99DolmQ/4iIHsPxPBQbrTcxkqY5wc49YUdO1Ag46fXaId1famTACdXQIA5RimeMgQffLkRzwYS8fI13B3OqT78+s/Q6zIN2DBxHSiLni7lzr5x4p52Sdb4C9qAuzNbdloz7pr3biEyDuhd38IsJZMUE9TbU3CXZScChD83+bGLQ4sgLau98O2Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7574.namprd11.prod.outlook.com (2603:10b6:a03:4ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Fri, 31 Jan
 2025 05:42:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 05:42:01 +0000
Date: Thu, 30 Jan 2025 23:41:59 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe/pmu: Add GT frequency events
Message-ID: <vgfnvvmhwgnqmzitjkdi2zv6wo6ygyu3cck5dia3nbjszmjuvc@6zvmk5s3z35t>
References: <20250131044728.4107618-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250131044728.4107618-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4PR03CA0228.namprd03.prod.outlook.com
 (2603:10b6:303:b9::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7574:EE_
X-MS-Office365-Filtering-Correlation-Id: b6943244-4860-4fda-c00d-08dd41b9fc62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ol6Gx8Wecda9N7KTIR6jddOAdXv/DnTf4nR7YGwAmVRmX93IK1pWnE/3l4Ba?=
 =?us-ascii?Q?AKPVTtLqndUKPWh8EGTl9kcUDbvG9PFMjiKa6sjVY0CTd3I0zXn9BUR+2b6M?=
 =?us-ascii?Q?sL7gPeqCR4Esmujrk37yhuHEz+lzWBdPKqj9FLv07RTw/kbihd8jZJHtgpsw?=
 =?us-ascii?Q?0IMVCwePj/eO5HjnnuDAoGEyIQIPUvDW6sJoG13U/lIusBNCyTVsZUHu84LX?=
 =?us-ascii?Q?ZmtypjqtQ+Xsc7fgLfQ1B+Cq+y8g2zrUVc575VTDx9yQiM1og4BXEVJVP6Pk?=
 =?us-ascii?Q?SOeKZVLwJGtVePAeILViplqLZ5IUdIz8TkTTua3zJnj5ZmQMalHkmgWfBK02?=
 =?us-ascii?Q?mPboi6JXoT7tbNFU/0vpFU1iwvwbQ/Ii03Aq6jXrrKEnBKmUa0Snxv+8zj9x?=
 =?us-ascii?Q?/9Qb2cT7fW5o2hKOtbmNu7Y46rD2tkko8p4SUqrExxrXL1mwQXUb/jaZTQ2u?=
 =?us-ascii?Q?4NfrrwTg8vk192fVA4lG+AxyAxDRCCJkiKbChPf6g55EqTEJoieNLka7HdjQ?=
 =?us-ascii?Q?QKp76tTTMlaxg5qlw4Dw1Q/AiucGct4vbsuEfX4IzTl4mZovIY1pF2FshhOO?=
 =?us-ascii?Q?QVS9N4MrdpMeThjSGeRggVYVATaeMqFnIUIOzeMIYPf8YkECZoOM9ihhLacn?=
 =?us-ascii?Q?HF/yn14umMqn93ng5cXtXdoWWzfrZ102yp0uPx8OO6J4YmXZW3Ufl3ol2H65?=
 =?us-ascii?Q?YGB7lRLE/8WuLGNa+U668cOcXPaXybHxLXkj6cu0mDDrwmBQ67T0hKPLLu7q?=
 =?us-ascii?Q?jozx2thCyJhexUgAW9P4tTEeBG2+kxasZJbpaYOh31trjY0SfQOBIO9pxecS?=
 =?us-ascii?Q?uGY2cislfZTH71dw3hMz4MQWBTcG7FOT4I1l08qQbMd/WMTl4Q5LBwr98Ndj?=
 =?us-ascii?Q?DMyF6FRf3ZXrGwlH3U1qDRd3chhd/pvmSNcf39FSsbcDLYNbKo0SHYUFHyYP?=
 =?us-ascii?Q?wUI98jhCXW/mT/Nau0JQgpvaWWiGuY7cAeUN+Gil0DQJ+2CQN9Tevg3VIz94?=
 =?us-ascii?Q?mphqkxPik4HbRdH6KhaYPhVWpRBEOxPvbY/uWjKRb95hSA5z3hKEIXwyg017?=
 =?us-ascii?Q?M3/uitMEgVEfyO6hxjPEWL7J+WrSgJK8cE73CD3vF4GZSoATSOlDfKmI9jcC?=
 =?us-ascii?Q?6NkTMb4rynzNiiPmci9cQ0tKUh49H6Y3nGQ1hx/yVqyj0dKzRkFvvsVxiPJ/?=
 =?us-ascii?Q?EEtGzYeGEZ+A8qDOqeTWaOZGziL9NDT2oiQ7nEnNeMgr8Hu4tiPdEbTvVlXs?=
 =?us-ascii?Q?lDrRZCOxekIkHVXogGkEmRczggQexjYCSItaivEJjpPV6F4lQFJpcsVoO/X8?=
 =?us-ascii?Q?GWBoWZtT7KLtcbrk+oaeOg3RcrzJV2BkGvU76QM/ZM9UzVOCnXHU+L5/dSh2?=
 =?us-ascii?Q?66tSRfTwO6SZnlexvjXmj0sAPhM0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g3PnNAS8JaZnwBCoANX2cJVqR1XBsqdeleHqT4guAWtYJRrYKOcDsrgEU2oP?=
 =?us-ascii?Q?Ylvkfu145aCZcuE1pdQw4EQGV4yCkp8e5COs2bod/Q4MeJ4LPvnXB811ivgW?=
 =?us-ascii?Q?a9z6sOhhsQwh4YS58CfmmvNKqybxdXrD3Hsi5O7S2aRHBe1XifO2vLOl5pCy?=
 =?us-ascii?Q?YAgE5ZH7jsV8LY5EpudKEQGw3kVAHg35VGItTg0k8olYG+IYKFptohmedFhE?=
 =?us-ascii?Q?QkVKQic6dNbelWMFHvYJHkMjTncnYDlTSpa7zack8niIQ5ImREMcWxv6BegG?=
 =?us-ascii?Q?qiMgjTAIdvd9fzaPuktZyzTJ7nCRg4YcKhlUBz3YAIzOVlBnV8umYz36DIEC?=
 =?us-ascii?Q?7FFNyBisEDC84hb1xQN2UK4UgffAE6YflvveBzjPQvExOsN6hmW1GnJqAsFk?=
 =?us-ascii?Q?TWl/Sz7Nc5R8YbNJc7uzyTyHiQu7LRCxd/E+PjSxpviFTnwN8yCnoKGz80XD?=
 =?us-ascii?Q?XwfKc7eY6oAdolOmtytwr7yzpAA5LFzUixxikM+H5WCFYyd2zJUDgJEwZzuI?=
 =?us-ascii?Q?KyyYeSrCWOrsFaG7HEuOmdqn5uJ5reDbdbQUOwpeXNbQDAJSgaPqOZB4vVeL?=
 =?us-ascii?Q?yIFxemC/sr0FB9XxV5r2h/VBoXN3IL142hh2WaYHp9f2tAwL1qc0tky/h031?=
 =?us-ascii?Q?UIanw0eYqZoGgihgogCwR0j1v9HuEvXJA+gIm0S/aZ8myvIGtI+VCp7Swy3R?=
 =?us-ascii?Q?kv1IhktnLsigsao/1/b4RIBUMex/vfAvvkEnglmJwIKJPdoNWBdZ9FNa6VgI?=
 =?us-ascii?Q?M59o528/UpVE1bwz9PukXNY44lBRwHTk23Clcpex0hGsgbmzr9jJJqcL4Vvf?=
 =?us-ascii?Q?6CqhWO1JCnx3+b58HOT63teBbA+1wJAn1IVx8Tb/1Sg1a2TAUOgdFCuWJzd+?=
 =?us-ascii?Q?drTPtpsEdrgMy1+hKesIN8m5TbJfpLmK6BAIsm+C0SIulRnZQ5eKT1xglQFa?=
 =?us-ascii?Q?N0DjGPQOWxFvQUawPfIbJ59MIYRfRDdgbqS9VzFxeRqr/oodV5oN5V0N/wL1?=
 =?us-ascii?Q?R2q3wnaNezEPmSs0xxy/+Dt+Sh4nKXjW29Z0rR9d9kUNJblEp5E9/r83JC4n?=
 =?us-ascii?Q?b3Liy7R/gvRfa1pOFart3ClAvYi/Eq75B4PW0sw57HJeXFhlAdgyrW5Qigcd?=
 =?us-ascii?Q?5nW9tiUNYlM1KIePOLQ/hZwuQD5EbVLLuy3VePJ2FdM1UB5Oh5hgi4aHiFmm?=
 =?us-ascii?Q?dgY3nlvLx2Tnad74SDdc9mLgFjUmGt/lkBKfs7UVxETgCYzhlWZ7eOvlXxs1?=
 =?us-ascii?Q?QIjO+DiCaR8yL/HDQedtQv9qDyG737OxCGw9zZKYADoffYOwaMe2KjQcg5Lj?=
 =?us-ascii?Q?qUybL0Qi77R+FyVCsdcuKyPhWO5WYnd3E7ClK1VnRoMsEmZ6F4N6AOTzccoq?=
 =?us-ascii?Q?GQ6MU+fKFteCev/BWB6Yn+MCOglCS0bugXTs9zHHtGR6FiRY5B3GpTV3jCm3?=
 =?us-ascii?Q?gm+dECPYJUb9MpnnFh2h25/Ivj2jBe9ukt1VhjYnAc/TqSV/IPnNC9FrlJAF?=
 =?us-ascii?Q?0SXtEabwTAFgntqiIFPt+6eAU2GBxjiC+mM2KISeaHICvnaCYwq+8UccQshq?=
 =?us-ascii?Q?s8K3ZZuLV0LDnjT6j/PzoPnJylNHM+K8aXGvJHaRQxI5ubaCBocHxv/rXHPK?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6943244-4860-4fda-c00d-08dd41b9fc62
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 05:42:01.7542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0gdHn1Cfnku7um7Uhv5BT/tLlkKuK9kTRkVPV6YeuZON88IoXMJCe6akrgLtxq9ri5y06t9hUM5W0tMcTwY7as+OqVR2r9oe3/s4NBwrCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7574
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

On Thu, Jan 30, 2025 at 08:47:28PM -0800, Vinay Belgaumkar wrote:
>Define PMU events for GT frequency (actual and requested). This is
>a port from the i915 driver implementation, where an internal timer
>is used to aggregate GT frequencies over certain fixed interval.
>Following PMU events are being added-
>
>  xe_0000_00_02.0/gt-actual-frequency/              [Kernel PMU event]
>  xe_0000_00_02.0/gt-requested-frequency/           [Kernel PMU event]
>
>Standard perf commands can be used to monitor GT frequency-
>  $ perf stat -e xe_0000_00_02.0/gt-requested-frequency,gt=0/ -I1000
>
>     1.001175175                700 M    xe/gt-requested-frequency,gt=0/
>     2.005891881                703 M    xe/gt-requested-frequency,gt=0/
>     3.007318169                700 M    xe/gt-requested-frequency,gt=0/
>
>Actual frequencies will be reported as 0 when GT is suspended.
>
>Cc: Riana Tauro <riana.tauro@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>---
> drivers/gpu/drm/xe/xe_pmu.c       | 157 +++++++++++++++++++++++++++++-
> drivers/gpu/drm/xe/xe_pmu_types.h |  26 +++++
> 2 files changed, 181 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>index 3910a82328ee..31ce575c834f 100644
>--- a/drivers/gpu/drm/xe/xe_pmu.c
>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>@@ -8,6 +8,7 @@
>
> #include "xe_device.h"
> #include "xe_gt_idle.h"
>+#include "xe_guc_pc.h"
> #include "xe_pm.h"
> #include "xe_pmu.h"
>
>@@ -37,6 +38,12 @@
>
> #define XE_PMU_EVENT_GT_MASK		GENMASK_ULL(63, 60)
> #define XE_PMU_EVENT_ID_MASK		GENMASK_ULL(11, 0)
>+#define SAMPLING_TIMER_FREQUENCY_HZ	200
>+
>+static struct xe_pmu *event_to_pmu(struct perf_event *event)
>+{
>+	return container_of(event->pmu, struct xe_pmu, base);
>+}
>
> static unsigned int config_to_event_id(u64 config)
> {
>@@ -49,6 +56,8 @@ static unsigned int config_to_gt_id(u64 config)
> }
>
> #define XE_PMU_EVENT_GT_C6_RESIDENCY	0x01
>+#define XE_PMU_EVENT_GT_ACTUAL_FREQUENCY	0x02
>+#define XE_PMU_EVENT_GT_REQUESTED_FREQUENCY	0x04
>
> static struct xe_gt *event_to_gt(struct perf_event *event)
> {
>@@ -113,9 +122,18 @@ static int xe_pmu_event_init(struct perf_event *event)
> 	return 0;
> }
>
>+static u64 read_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample)

please reserve the word "read" for when we are reading from hw
get_stored_sample() would be better.

>+{
>+	return pmu->event_sample[gt_id][sample];

this is read by perf, written by timer, you will need a lock to
synchronize as a u64 is or may not be atomic.

>+}
>+
> static u64 __xe_pmu_event_read(struct perf_event *event)
> {
> 	struct xe_gt *gt = event_to_gt(event);
>+	struct xe_device *xe =
>+		container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_pmu *pmu = &xe->pmu;
>+	u64 gt_id = gt->info.id;
>
> 	if (!gt)
> 		return 0;
>@@ -123,6 +141,14 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
> 	switch (config_to_event_id(event->attr.config)) {
> 	case XE_PMU_EVENT_GT_C6_RESIDENCY:
> 		return xe_gt_idle_residency_msec(&gt->gtidle);
>+	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
>+		return div_u64(read_sample(pmu, gt_id,
>+			       __XE_SAMPLE_FREQ_ACT),

if you index it by the event id, then you can pretty much group them
here. However I'm not sure if the design is correct to store the value
read in one place. What happens when you have 3 clients reading the same
event? You are only storing the hw value in one place and returning it
in all of them. However the old value read is kept per perf_event,
so it will calculate the different deltas... maybe it's ok, but you are
definitely missing the lock for the hw sampling, which will need to be
a raw_spin_lock.

>+			       USEC_PER_SEC /* to MHz */);
>+	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
>+		return div_u64(read_sample(pmu, gt_id,
>+			       __XE_SAMPLE_FREQ_REQ),
>+			       USEC_PER_SEC /* to MHz */);
> 	}
>
> 	return 0;
>@@ -154,8 +180,109 @@ static void xe_pmu_event_read(struct perf_event *event)
> 	xe_pmu_event_update(event);
> }
>
>+#define CONFIG_EVENT_ENABLED(config, event) \
>+	(FIELD_GET(XE_PMU_EVENT_ID_MASK, config) & event)
>+
>+#define CONFIG_EVENT_ENABLED_GT(config, event, gt) \
>+	(CONFIG_EVENT_ENABLED(config, event) && \
>+	(FIELD_GET(XE_PMU_EVENT_GT_MASK, config) == gt))
>+
>+static bool pmu_needs_timer(struct xe_pmu *pmu)
>+{
>+	return CONFIG_EVENT_ENABLED(pmu->enable,
>+				    (XE_PMU_EVENT_GT_ACTUAL_FREQUENCY |
>+				     XE_PMU_EVENT_GT_REQUESTED_FREQUENCY));
>+}
>+
>+static void xe_pmu_start_timer(struct xe_pmu *pmu)
>+{
>+	u64 period = max_t(u64, 10000, NSEC_PER_SEC / SAMPLING_TIMER_FREQUENCY_HZ);
>+
>+	if (!pmu->timer_enabled && pmu_needs_timer(pmu)) {
>+		pmu->timer_enabled = true;
>+		pmu->timer_last = ktime_get();
>+		hrtimer_start_range_ns(&pmu->timer,
>+				       ns_to_ktime(period), 0,
>+				       HRTIMER_MODE_REL_PINNED);
>+	}
>+}
>+
>+static void
>+add_sample_mult(struct xe_pmu *pmu, unsigned int gt_id, int sample, u32 val, u32 mul)
>+{
>+	pmu->event_sample[gt_id][sample] += mul_u32_u32(val, mul);
>+}
>+
>+static void
>+frequency_sample(struct xe_gt *gt, unsigned int period_ns)
>+{
>+	struct xe_device *xe = gt_to_xe(gt);
>+	struct xe_pmu *pmu = &xe->pmu;
>+	int ret;
>+	u32 cur_freq;
>+
>+	if (CONFIG_EVENT_ENABLED_GT(pmu->enable, XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, gt->info.id)) {
>+		u32 val;
>+
>+		/* Actual freq will be 0 when GT is in C6 */
>+		val = xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
>+
>+		add_sample_mult(pmu, gt->info.id, __XE_SAMPLE_FREQ_ACT,
>+				val, period_ns / 1000);
>+	}
>+
>+	if (CONFIG_EVENT_ENABLED_GT(pmu->enable, XE_PMU_EVENT_GT_REQUESTED_FREQUENCY,
>+				    gt->info.id)) {
>+		ret = xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_freq);
>+		if (!ret)
>+			add_sample_mult(pmu, gt->info.id, __XE_SAMPLE_FREQ_REQ,
>+					cur_freq,
>+					period_ns / 1000);
>+	}
>+}
>+
>+static enum hrtimer_restart xe_sample(struct hrtimer *hrtimer)
>+{
>+	struct xe_pmu *pmu = container_of(hrtimer, struct xe_pmu, timer);
>+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>+	u64 period = max_t(u64, 10000, NSEC_PER_SEC / SAMPLING_TIMER_FREQUENCY_HZ);
>+	unsigned int period_ns;
>+	struct xe_gt *gt;
>+	ktime_t now;
>+	unsigned int i;
>+
>+	if (!READ_ONCE(pmu->timer_enabled))
>+		return HRTIMER_NORESTART;
>+
>+	now = ktime_get();
>+	period_ns = ktime_to_ns(ktime_sub(now, pmu->timer_last));
>+	pmu->timer_last = now;
>+
>+	/*
>+	 * The passed in period includes the time needed for grabbing the forcewake.
>+	 * However, the potential error from timer callback delay greatly dominates
>+	 * this so we keep it simple.
>+	 */
>+
>+	for_each_gt(gt, xe, i)
>+		frequency_sample(gt, period_ns);
>+
>+	hrtimer_forward(hrtimer, now, ns_to_ktime(period));
>+
>+	return HRTIMER_RESTART;
>+}
>+
> static void xe_pmu_enable(struct perf_event *event)
> {
>+	struct xe_pmu *pmu = event_to_pmu(event);
>+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>+
>+	/* Save the event config */
>+	pmu->enable |= event->attr.config;

same concern as above... what happens when you have 2 clients reading
the same event? You storing here the same bits, then when any of them
stop, you stop updating the other as well.

alternative is to have a linked list of active sampling events and use
the event->active_entry to track that, like done in
arch/x86/events/rapl.c.

Lucas De Marchi

>+
>+	/* Start a timer, if needed, to collect samples */
>+	xe_pmu_start_timer(pmu);
>+
> 	/*
> 	 * Store the current counter value so we can report the correct delta
> 	 * for all listeners. Even when the event was already enabled and has
>@@ -176,15 +303,27 @@ static void xe_pmu_event_start(struct perf_event *event, int flags)
> 	event->hw.state = 0;
> }
>
>+static void xe_pmu_disable(struct perf_event *event)
>+{
>+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_pmu *pmu = &xe->pmu;
>+
>+	pmu->enable &=  ~event->attr.config;
>+	pmu->timer_enabled &= pmu_needs_timer(pmu);
>+}
>+
> static void xe_pmu_event_stop(struct perf_event *event, int flags)
> {
> 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
> 	struct xe_pmu *pmu = &xe->pmu;
>
>-	if (pmu->registered)
>+	if (pmu->registered) {
> 		if (flags & PERF_EF_UPDATE)
> 			xe_pmu_event_update(event);
>
>+		xe_pmu_disable(event);
>+	}
>+
> 	event->hw.state = PERF_HES_STOPPED;
> }
>
>@@ -270,6 +409,10 @@ static ssize_t event_attr_show(struct device *dev,
> 	XE_EVENT_ATTR_GROUP(v_, id_, &pmu_event_ ##v_.attr.attr)
>
> XE_EVENT_ATTR_SIMPLE(gt-c6-residency, gt_c6_residency, XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
>+XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
>+		     XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, "Mhz");
>+XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
>+		     XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, "Mhz");
>
> static struct attribute *pmu_empty_event_attrs[] = {
> 	/* Empty - all events are added as groups with .attr_update() */
>@@ -283,6 +426,8 @@ static const struct attribute_group pmu_events_attr_group = {
>
> static const struct attribute_group *pmu_events_attr_update[] = {
> 	&pmu_group_gt_c6_residency,
>+	&pmu_group_gt_actual_frequency,
>+	&pmu_group_gt_requested_frequency,
> 	NULL,
> };
>
>@@ -290,8 +435,11 @@ static void set_supported_events(struct xe_pmu *pmu)
> {
> 	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>
>-	if (!xe->info.skip_guc_pc)
>+	if (!xe->info.skip_guc_pc) {
> 		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
>+		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_ACTUAL_FREQUENCY);
>+		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
>+	}
> }
>
> /**
>@@ -306,6 +454,8 @@ static void xe_pmu_unregister(void *arg)
> 	if (!pmu->registered)
> 		return;
>
>+	hrtimer_cancel(&pmu->timer);
>+
> 	pmu->registered = false;
>
> 	perf_pmu_unregister(&pmu->base);
>@@ -334,6 +484,9 @@ int xe_pmu_register(struct xe_pmu *pmu)
> 	if (IS_SRIOV_VF(xe))
> 		return 0;
>
>+	hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>+	pmu->timer.function = xe_sample;
>+
> 	name = kasprintf(GFP_KERNEL, "xe_%s",
> 			 dev_name(xe->drm.dev));
> 	if (!name)
>diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>index f5ba4d56622c..8dc235e1b6d3 100644
>--- a/drivers/gpu/drm/xe/xe_pmu_types.h
>+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>@@ -9,6 +9,12 @@
> #include <linux/perf_event.h>
> #include <linux/spinlock_types.h>
>
>+enum {
>+	__XE_SAMPLE_FREQ_ACT,
>+	__XE_SAMPLE_FREQ_REQ,
>+	__XE_NUM_PMU_SAMPLERS
>+};
>+
> #define XE_PMU_MAX_GT 2
>
> /**
>@@ -34,6 +40,26 @@ struct xe_pmu {
> 	 * @supported_events: Bitmap of supported events, indexed by event id
> 	 */
> 	u64 supported_events;
>+	/**
>+	 * @timer: Timer for sampling GT frequency.
>+	 */
>+	struct hrtimer timer;
>+	/**
>+	 * @timer_last: Timestmap of the previous timer invocation.
>+	 */
>+	ktime_t timer_last;
>+	/**
>+	 * @timer_enabled: Should the internal sampling timer be running.
>+	 */
>+	bool timer_enabled;
>+	/**
>+	 * @event_sample: Store freq related counters.
>+	 */
>+	u64 event_sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
>+	/**
>+	 * @enable: Store requested PMU event config.
>+	 */
>+	u64 enable;
> };
>
> #endif
>-- 
>2.38.1
>
