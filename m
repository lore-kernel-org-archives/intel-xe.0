Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A658C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 16:12:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F4211A5BF;
	Thu, 25 Apr 2024 16:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eolR1E3+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F19611A5BF
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 16:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714061518; x=1745597518;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AYift7mm4wSoAvs/fsNDjYcelIypO0D9P6s1gqXghUk=;
 b=eolR1E3+KM6EIT3bOtSYaM8iaMh1qmAnWVWQg0imobkq95x614AsYfDr
 dOZrjz4aUWkW4kDhnWcOhOP+3U2b94LQSYCyuPcHdc+RTNv2C2lbFmql3
 AtZsTaQTS5/Gdt8tU4817h0MSzmuLenZtagkBqoBGSc7CvlBIZZXVAiM1
 fBVfauTyy3qQU5J6DoFnh4JdkGWpvArDSlYE/eKM6pC+RMtfkq6TRfV/e
 lYJUj4MliPwpEbrSCu7H+RpuX0Q8+DtlC7skSm74qqx084wlhl+4R6ETM
 /OdLQVd7t9o+5wXQcbxmno8liPnffWlKbzAiH6WEy6A8eyWaZQvD7d/hr Q==;
X-CSE-ConnectionGUID: XBLD1vleSJePkIx2aQl/0A==
X-CSE-MsgGUID: KApZodKBQNaU0wSnF32MIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="32256331"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="32256331"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 09:11:58 -0700
X-CSE-ConnectionGUID: QlrRgDbyR4uYDbR6ZSg48Q==
X-CSE-MsgGUID: nNgc70SMQ1uDqUXLvxosbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="29749285"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 09:11:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 09:11:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 09:11:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 09:11:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0vgQXa5Gf8SO/uOxmnxqb0LEkDVYhO/V7yT1eAv0LYbCIA+Dotw3/83pSJOW1JXebbmHTN4IVCELB6LBq/BxkHMWmj6dftId8In5uIm7ft7o9yRP9m6VWdsjHPvxXq4iOLvmTePKdMAhhDpwK+fhrb2t3Sx47iGXFgIVkTw1CBLLW74zslIyB/yuGA152oKKKvyLbv3BmdX7i9FVXq2uUJYaYWRe6Gh4a4LQ5oFfDDhCu5nTghb+XZDNPfOUMCv0ssjFdc7WNtV0xzgP+j4HwnVcgACxJzb+3EYEZPCRBi0MS9OY+CCST1Ed7b1d3fPfXWi4jW0el7xZ3RiOXfdlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwJIS0X+SGkCZllRKRhrhBGd/EVs/zGUrDlNXBgVaRM=;
 b=fAxYSMzs93aKYFVv9EhhBw1sQreRvvWotsdCB0Xen45qwYsSA2ioUGZn6BP7jMiVJx+hh2mZ+T2iUQxnqOWxH8D95fQSE3ADwzL+g1NZX0vvc622r7QkHCygbTiTHUjxfkM4nksA757k8JMpQ+qXnPe4qwqNVV/nYVtDKscKTtoxju8+oXO5Fl8QpBcRk0QrNKezLxRxbzUzBZ05AkvstS2P06KLmB7fY4JuabqTpZ3tCNklBjrKQXO9QVvY2VsYoXmq3s2WQb/7vks4EWz+q21maUHBHF4HYnTOhB6utkV72EA9Ay+hpQX9gAv4rTT6INpAF6ST6w0gjrqfAxXTFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7478.namprd11.prod.outlook.com (2603:10b6:510:269::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Thu, 25 Apr
 2024 16:11:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.020; Thu, 25 Apr 2024
 16:11:54 +0000
Date: Thu, 25 Apr 2024 11:11:51 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ramadevi.gandi@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] drm/xe/mocs: Add debugfs node to dump mocs
Message-ID: <cavhfcapykkmtenzny2ww4637ctgl2b274oucjcdat4kzsp3qp@2pzyrlqy5eep>
References: <20240422100550.1088856-1-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240422100550.1088856-1-janga.rahul.kumar@intel.com>
X-ClientProxiedBy: BYAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7478:EE_
X-MS-Office365-Filtering-Correlation-Id: 27afa94e-1962-4743-904d-08dc65426c35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WC+pkYJ52L3VKRnvAWv2dZSqR70k8qjpC9NRKvjNFNeyiwZ+8SubyJrS5sKH?=
 =?us-ascii?Q?u0ZKJYTsBJiQOGW3ItUmKwRqiIcd1H0MBx3jLCktDW2+6Mlhs4bJC2JrUBai?=
 =?us-ascii?Q?/eggfr9Sru2D9G3yXI2oOGerhMT7mpUHTJ6T18I7HiZgcPldwh45LTeE6fH8?=
 =?us-ascii?Q?AScC0p1JJpljZSnufDYTSNahgzhIwlnP8lx8v92F7JWFyNdQznjncE/SfzXG?=
 =?us-ascii?Q?IHsG8fhtG9k9g7bhusUUcmvGBOETXOxD41JYE+eQsRUkBAkYIYloncgxxStl?=
 =?us-ascii?Q?Iye1sO15KF/B2wLkETKL5KNa02jNxDdqMwtfJY2C6WuywAaEpMpb9eunRyrr?=
 =?us-ascii?Q?Cqt4oMlaeR0crZGd1qlT5ODxOUu2ibm50L0oSDD7P3siJyYeVWY1yHxRFd1K?=
 =?us-ascii?Q?DA+qN5oMS7wWuSlGW+VN4/NR3c/4hlnO8YwAzysGB5sWAWmlwOy3345ZugVs?=
 =?us-ascii?Q?lI8ljTL50oPBOezec/dZZlJFrxUqyehwU4S1V5IFesI2qaVAe0bvXYTcRzwZ?=
 =?us-ascii?Q?v2CmKcdSGsO6imSisuPEWM78YizDfYErrRB1CJ0MT/DLkWDjAnjM1duqFp0d?=
 =?us-ascii?Q?qqBcXT+8fKmkioH+iMix3OJeNudnQq2Vb77gARxrC13oRa+F72NfhEjLzPj4?=
 =?us-ascii?Q?4QAYagkzdE22osQo0k3BOIXEQbZTCxWQBNgni6SYgsrPgWMqCBgoNgRfJjmJ?=
 =?us-ascii?Q?BDswkLeHXGEmceuYjEO8F3+gJufBp/ezVv9Ovs4s2pv6GVQoC+p8SC9gvth9?=
 =?us-ascii?Q?2vDk+5LvetyQTtqEKeH6DWr7TL2u4kOwc4zFCSPa6S17vgVFMgBaZDU3dh5Y?=
 =?us-ascii?Q?MbhWg1Nw30T+SfAchEKlnbySg9ua83O0LIqF6RIMZCF1+FisKfceAxsO24B1?=
 =?us-ascii?Q?49935cYVRjzI2Oe9nkxe1aFICgBysgJxeW8Q5C29dsvPMutmAcazURfZ45IF?=
 =?us-ascii?Q?mmSvarngNlvF5vSqr1mH/2/O1rHIlBFSVBvpi5NheMDwwpcZng2mvX3TAl9Q?=
 =?us-ascii?Q?8An6XRJylsoajV2+inC5UoSyAkaYLd3CqQONCJpRVTbkoCdg9gNUgRBreVUZ?=
 =?us-ascii?Q?pZUoUqDfDEDtgDgESaqzWaK8CkkPCZfbuPOV9GbiCnFoDOGGZmI5BX86B0d0?=
 =?us-ascii?Q?cJN6+ZxYDm+BTmuJbPP59ncP6EfXa09VmES2VB64PMFKovyF72RZFhXu1V0O?=
 =?us-ascii?Q?8fSVqCydfYbtMJ1dAdPdwLgBYIgjXbWVw3en5yM2dPiNf5A/Us/adUIOIENI?=
 =?us-ascii?Q?YS+jhVOKUbd5wefiv+ZBOMNBpGiD922dLjd6v2FmfA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K+jv4pg8pikrCWwSiA4orD5FKebT/OdH/3tOZSdF+g4eWcFqoww7M5dHSJ+U?=
 =?us-ascii?Q?BjUGBv45ecA1wcvRRZmODwS4tXVYuB+3W/CVlkXp311dS9oORjG5dYua49NU?=
 =?us-ascii?Q?k4yoMhBYBHrcLL2T4Hjfw1qtFfJIsdWaFU6ouAKR46EfrJexnnXuwlsVLo8G?=
 =?us-ascii?Q?Zsxo94tj5J+wQWdOD1NdgJoy86jrl6v0TgbtofuHLea1GodlRy5MWxgmN8RM?=
 =?us-ascii?Q?Kyf32+UJf3lv6IxEG5aKv5lfU6AMDciictTPTIBZR6oVpBr2xFIbSRN0WloT?=
 =?us-ascii?Q?QJUosAA6cN/jNXdgVneT6PmqJmiZDonZ2EBVTtlpAZOslq4cOSr4eXxxRu0a?=
 =?us-ascii?Q?4EAggHIlq5XuUzg0Aw7CJr9sUEZxpwlgJ+Y/1rbsxxUQ7uH/eizzD2E9IXpq?=
 =?us-ascii?Q?/6tJ6QXt1o0govmHYAeq3XDIu+K1frwMDgw1UUgKsI1GcivDIG02SkAZyDJP?=
 =?us-ascii?Q?vU1Kayp6pjdx7izomURkq7BcGFvvDNAa7oTXZDps9Jj6OtwU4TghBZN9grPv?=
 =?us-ascii?Q?sxlxRiS3EqJ9pAkYtEuPUfLZOHfQv/fRSiWeNI+9tKOePBYvsqPblI3ucvpa?=
 =?us-ascii?Q?HPwWpMsGjTEFeB+r4Dl6An/Jz7MokvwyNqo1s4lvPy6/9C0OluqQj1B3zIO8?=
 =?us-ascii?Q?yAgFswXUHPn2hCWZqoTB4iJLQZusanA+oX9V3c3LrbvhKXPcNz3lwOWp59pb?=
 =?us-ascii?Q?aMDpfLGsFh5f4Jh6A7G52c+2IqdY1dhv1y/QSUTINzVU8xtJSChDO5nWW9fp?=
 =?us-ascii?Q?3ffMs6rEwjTBBqCY6QakjfW4nEASGLwCYvnuliORAPkc9IZMsMAicFLePcmK?=
 =?us-ascii?Q?oHp241aZ1yKvQGzvE2u34vYu8mk38vkPNTx+b545Y0YFZOGh41vIIOTh5VK4?=
 =?us-ascii?Q?4UjqKLe1hPUpkDNmIaSdxB2A4JxykuneYEDRGkl0X3b2nQQCf9DjsvM8Iwzy?=
 =?us-ascii?Q?ZnOdBWE/TF9bdRXRKFBz6yjht1zWF577Nmwfarto0vUsOZ4a1KpenmUnY+FF?=
 =?us-ascii?Q?53k4URfopVPbhiBOfDSSk9r2ejLJ/4h4o/aaQjpdFzxbuEFtpHWPeMafPLIJ?=
 =?us-ascii?Q?zXrI6HZJvflZRjBjylpvfH7rc7SJQmFrDyVjeCfCgu/JJwOmXnZZU6PVWues?=
 =?us-ascii?Q?MJcP2RBTsUOJdB8dgaZj25ZYk5kAYvYp/HlSoT0Zub62mH3SZCB57O5rTk0P?=
 =?us-ascii?Q?tcynqJJzu8Ssa5qvaAwzRLBEs/TK67MvwJT6a4KhOzwidT7DELEqfmVwoDgQ?=
 =?us-ascii?Q?JemenEklWvDwJ2WUdUdaAiwEStv3Qbh+qpZYQh5psBjkFToO+Z1/wx2uLnls?=
 =?us-ascii?Q?JjXeWlPgwVqXX6xbv7wOvk1qfKeQ1okKshkcO0MH60RfNnlucJ2BLKz91KHr?=
 =?us-ascii?Q?+oQl/73VeMMorRTFzCuUr2Pz3Vte/ykFBWlNNlYK0AgVquFvc6jUQRhUG1RN?=
 =?us-ascii?Q?crAAEirwIkoyC2IEI0i8xlJ9VJVnJ3mBGt7Jkfx2ReXwjKAkBweRlXSnAPRF?=
 =?us-ascii?Q?SUDzbTlDbsS4Mk3Hq1lni+BZQrxN8MQBTG46j5LGSR+RJGr5EFdednXXw4X4?=
 =?us-ascii?Q?7MTdj2w1M6EPSa/eXIgW9EmSCNE97AX5Ni+YlpennGdEapCKr/zk6SBz7VTh?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27afa94e-1962-4743-904d-08dc65426c35
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 16:11:54.0665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WRICy8dES4rSlDKx42OnKf6RVJEvJ46s3LakNdPmniYwDzwGyJIX5FYK0EGc5mBcXY4YBPfAjJc3iRqHdQOtWmbsNTq2vRS7h9H1R8oerPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7478
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

On Mon, Apr 22, 2024 at 03:35:50PM GMT, Janga Rahul Kumar wrote:
>This is useful to check mocs configuration. Tests/Tools can use
>this debugfs entry to get mocs info.
>
>v2: Address review comments. Change debugfs output style similar
>to pat debugfs. (Lucas De Marchi)

it looks like there's an igt series that is supposed to use this?

Please add a "Test-with: <msgid>" to point out to that series

>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_debugfs.c |  11 ++
> drivers/gpu/drm/xe/xe_mocs.c       | 274 +++++++++++++++++++++++++++--
> drivers/gpu/drm/xe/xe_mocs.h       |   8 +
> 3 files changed, 283 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>index ff7f4cf52fa9..041eef92b705 100644
>--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>@@ -17,6 +17,7 @@
> #include "xe_hw_engine.h"
> #include "xe_lrc.h"
> #include "xe_macros.h"
>+#include "xe_mocs.h"
> #include "xe_pat.h"
> #include "xe_pm.h"
> #include "xe_reg_sr.h"
>@@ -198,6 +199,15 @@ static int pat(struct xe_gt *gt, struct drm_printer *p)
> 	return 0;
> }
>
>+static int mocs(struct xe_gt *gt, struct drm_printer *p)
>+{
>+	xe_pm_runtime_get(gt_to_xe(gt));
>+	xe_mocs_dump(gt, p);
>+	xe_pm_runtime_put(gt_to_xe(gt));
>+
>+	return 0;
>+}
>+
> static int rcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
> {
> 	xe_pm_runtime_get(gt_to_xe(gt));
>@@ -253,6 +263,7 @@ static const struct drm_info_list debugfs_list[] = {
> 	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
> 	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
> 	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
>+	{"mocs", .show = xe_gt_debugfs_simple_show, .data = mocs},
> 	{"default_lrc_rcs", .show = xe_gt_debugfs_simple_show, .data = rcs_default_lrc},
> 	{"default_lrc_ccs", .show = xe_gt_debugfs_simple_show, .data = ccs_default_lrc},
> 	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
>diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
>index 1e92f8ee07ba..e45d2b2caadf 100644
>--- a/drivers/gpu/drm/xe/xe_mocs.c
>+++ b/drivers/gpu/drm/xe/xe_mocs.c
>@@ -43,6 +43,8 @@ struct xe_mocs_info {
> 	u8 uc_index;
> 	u8 wb_index;
> 	u8 unused_entries_index;
>+	void (*dump)(struct xe_mocs_info *mocs, unsigned int flags,
>+		     struct xe_gt *gt, struct drm_printer *p);

please follow the same pattern as xe_pat.c. Everywhere we use function
pointers we put them into a ops struct.

> };
>
> /* Defines for the tables (XXX_MOCS_0 - XXX_MOCS_63) */
>@@ -57,6 +59,17 @@ struct xe_mocs_info {
> #define LE_COS(value)		((value) << 15)
> #define LE_SSE(value)		((value) << 17)
>
>+#define LE_CACHEABILITY_MASK	REG_GENMASK(1, 0)
>+#define LE_TGT_CACHE_MASK	REG_GENMASK(3, 2)
>+#define LE_LRUM_MASK		REG_GENMASK(5, 4)
>+#define LE_AOM_MASK		REG_BIT(6)
>+#define LE_RSC_MASK		REG_BIT(7)
>+#define LE_SCC_MASK		REG_GENMASK(10, 8)
>+#define LE_PFM_MASK		REG_GENMASK(13, 11)
>+#define LE_SCF_MASK		REG_BIT(14)
>+#define LE_COS_MASK		REG_GENMASK(16, 15)
>+#define LE_SSE_MASK		REG_GENMASK(18, 17)

convention for register in regs/ is:

  * Define the register contents (i.e. bit and bit field macros) from most
  * significant to least significant bit. Indent the register content macros
  * using two extra spaces between ``#define`` and the macro name.

it would be good to follow it here too, even if not technically in the
regs/ dir. So, let's define those masks with LE_SSE_MASK first.
However.... are we too verbose here? Main use for this is to double
check with the spec. Do we need to spell out each field individually? We
were already logging them to kernel log:

	mocs_dbg(gt, "GLOB_MOCS[%d] 0x%x 0x%x\n", i,
		 XELP_GLOBAL_MOCS(i).addr, mocs);

Similarly to xe_pat.c, I think the output should match and the only
difference being the time in which we are outputing it. +Matt who added
the PAT ones for his opinion... it seems the PAT ones are also a little
verbose, but we don't print to kernel log on probe.

>+
> /* Defines for the tables (LNCFMOCS0 - LNCFMOCS31) - two entries per word */
> #define L3_ESC(value)		((value) << 0)
> #define L3_SCC(value)		((value) << 1)
>@@ -64,6 +77,17 @@ struct xe_mocs_info {
> #define L3_GLBGO(value)		((value) << 6)
> #define L3_LKUP(value)		((value) << 7)
>
>+#define L3_ESC_MASK			REG_BIT(0)
>+#define L3_SCC_MASK			REG_GENMASK(3, 1)
>+#define L3_CACHEABILITY_MASK		REG_GENMASK(5, 4)
>+#define L3_GLBGO_MASK			REG_BIT(6)
>+#define L3_LKUP_MASK			REG_BIT(7)
>+#define L3_UPPER_IDX_ESC_MASK		REG_BIT(16)
>+#define L3_UPPER_IDX_SCC_MASK		REG_GENMASK(19, 17)
>+#define L3_UPPER_IDX_CACHEABILITY_MASK	REG_GENMASK(21, 20)
>+#define L3_UPPER_GLBGO_MASK		REG_BIT(22)
>+#define L3_UPPER_LKUP_MASK		REG_BIT(23)
>+
> /* Defines for the tables (GLOB_MOCS_0 - GLOB_MOCS_16) */
> #define IG_PAT				REG_BIT(8)
> #define L3_CACHE_POLICY_MASK		REG_GENMASK(5, 4)
>@@ -107,6 +131,8 @@ struct xe_mocs_info {
> #define XE2_L3_1_XD		REG_FIELD_PREP(L3_CACHE_POLICY_MASK, 1)
> #define XE2_L3_3_UC		REG_FIELD_PREP(L3_CACHE_POLICY_MASK, 3)
>
>+#define XE2_L3_CLOS_MASK	REG_GENMASK(7, 6)
>+
> #define MOCS_ENTRY(__idx, __control_value, __l3cc_value) \
> 	[__idx] = { \
> 		.control_value = __control_value, \
>@@ -255,6 +281,82 @@ static const struct xe_mocs_entry gen12_mocs_desc[] = {
> 		   L3_1_UC)
> };
>
>+static bool regs_are_mcr(struct xe_gt *gt)
>+{
>+	struct xe_device *xe = gt_to_xe(gt);
>+
>+	if (xe_gt_is_media_type(gt))
>+		return MEDIA_VER(xe) >= 20;
>+	else
>+		return GRAPHICS_VERx100(xe) >= 1250;
>+}

this is a prep patch moving the function

>+
>+static void xelp_lncf_dump(struct xe_mocs_info *info, struct xe_gt *gt, struct drm_printer *p)
>+{
>+	unsigned int i, j;
>+	u32 reg_val;
>+
>+	drm_printf(p, "LNCFCMOCS[idx] = [ESC, SCC, L3CC] (value)\n\n");
>+
>+	for (i = 0, j = 0; i < (info->n_entries + 1) / 2; i++, j++) {
>+		if (regs_are_mcr(gt))
>+			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
>+		else
>+			reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
>+
>+		drm_printf(p, "LNCFCMOCS[%2d] = [%u, %u, %u] (%#8x)\n",
>+			   j++,
>+			   !!(reg_val & L3_ESC_MASK),
>+			   REG_FIELD_GET(L3_SCC_MASK, reg_val),
>+			   REG_FIELD_GET(L3_CACHEABILITY_MASK, reg_val),
>+			   reg_val);
>+
>+		drm_printf(p, "LNCFCMOCS[%2d] = [%u, %u, %u] (%#8x)\n",
>+			   j,
>+			   !!(reg_val & L3_UPPER_IDX_ESC_MASK),
>+			   REG_FIELD_GET(L3_UPPER_IDX_SCC_MASK, reg_val),
>+			   REG_FIELD_GET(L3_UPPER_IDX_CACHEABILITY_MASK, reg_val),
>+			   reg_val);
>+	}
>+}
>+
>+static void gen12_mocs_dump(struct xe_mocs_info *info, unsigned int flags,

s/gen12/xelp/

>+			    struct xe_gt *gt, struct drm_printer *p)
>+{
>+	unsigned int i;
>+	u32 reg_val;
>+
>+	if (flags & HAS_GLOBAL_MOCS) {
>+		drm_printf(p, "Global mocs table configuration:\n");
>+		drm_printf(p, "GLOB_MOCS[idx] = [LeCC, TC, LRUM, AOM, RSC, SCC, PFM, SCF, CoS, SSE] (value)\n\n");
>+
>+		for (i = 0; i < info->n_entries; i++) {
>+			if (regs_are_mcr(gt))
>+				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
>+			else
>+				reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
>+
>+		drm_printf(p, "GLOB_MOCS[%2d] = [%u, %u, %u, %u, %u, %u, %u, %u, %u, %u ] (%#8x)\n",
>+			   i,
>+			   REG_FIELD_GET(LE_CACHEABILITY_MASK, reg_val),
>+			   REG_FIELD_GET(LE_TGT_CACHE_MASK, reg_val),
>+			   REG_FIELD_GET(LE_LRUM_MASK, reg_val),
>+			   !!(reg_val & LE_AOM_MASK),
>+			   !!(reg_val & LE_RSC_MASK),
>+			   REG_FIELD_GET(LE_SCC_MASK, reg_val),
>+			   REG_FIELD_GET(LE_PFM_MASK, reg_val),
>+			   !!(reg_val & LE_SCF_MASK),
>+			   REG_FIELD_GET(LE_COS_MASK, reg_val),
>+			   REG_FIELD_GET(LE_SSE_MASK, reg_val),
>+			   reg_val);
>+		}
>+	}
>+
>+	if (flags & HAS_LNCF_MOCS) {

watch out for coding style... shouldn't have the { }, here and in other
places.

>+		xelp_lncf_dump(info, gt, p);
>+	}
>+}
>+
> static const struct xe_mocs_entry dg1_mocs_desc[] = {
> 	/* UC */
> 	MOCS_ENTRY(1, 0, L3_1_UC),
>@@ -279,6 +381,14 @@ static const struct xe_mocs_entry dg1_mocs_desc[] = {
> 	MOCS_ENTRY(63, 0, L3_1_UC),
> };
>
>+static void dg1_mocs_dump(struct xe_mocs_info *info, unsigned int flags, struct xe_gt *gt,
>+			  struct drm_printer *p)
>+{
>+	if (flags & HAS_LNCF_MOCS) {

you should eather uses flags or use the function pointers to
differentiate these. From flags we have:

	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) >= 20)
		flags |= HAS_GLOBAL_MOCS;
         if (GRAPHICS_VER(xe) < 20)
                 flags |= HAS_LNCF_MOCS;

So if keeping the flags, dg1_mocs_dump() would be gone and you'd simply
use xelp_mocs_dump()

>+		xelp_lncf_dump(info, gt, p);
>+	}
>+}
>+
> static const struct xe_mocs_entry dg2_mocs_desc[] = {
> 	/* UC - Coherent; GO:L3 */
> 	MOCS_ENTRY(0, 0, L3_1_UC | L3_LKUP(1)),
>@@ -291,6 +401,43 @@ static const struct xe_mocs_entry dg2_mocs_desc[] = {
> 	MOCS_ENTRY(3, 0, L3_3_WB | L3_LKUP(1)),
> };
>
>+static void xehp_lncf_dump(struct xe_mocs_info *info, struct xe_gt *gt, struct drm_printer *p)
>+{
>+	unsigned int i, j;
>+	u32 reg_val;
>+
>+	drm_printf(p, "LNCFCMOCS[idx] = [UCL3LOOKUP, GLBGO, L3CC] (value)\n\n");
>+
>+	for (i = 0, j = 0; i < (info->n_entries + 1) / 2; i++, j++) {
>+		if (regs_are_mcr(gt))
>+			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
>+		else
>+			reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
>+
>+		drm_printf(p, "LNCFCMOCS[%2d] = [%u, %u, %u] (%#8x)\n",
>+			   j++,
>+			   !!(reg_val & L3_LKUP_MASK),
>+			   !!(reg_val & L3_GLBGO_MASK),
>+			   REG_FIELD_GET(L3_CACHEABILITY_MASK, reg_val),
>+			   reg_val);
>+
>+		drm_printf(p, "LNCFCMOCS[%2d] = [%u, %u, %u] (%#8x)\n",
>+			   j,
>+			   !!(reg_val & L3_UPPER_LKUP_MASK),
>+			   !!(reg_val & L3_UPPER_GLBGO_MASK),
>+			   REG_FIELD_GET(L3_UPPER_IDX_CACHEABILITY_MASK, reg_val),
>+			   reg_val);
>+	}
>+}
>+
>+static void dg2_mocs_dump(struct xe_mocs_info *info, unsigned int flags, struct xe_gt *gt,
>+			  struct drm_printer *p)
>+{
>+	if (flags & HAS_LNCF_MOCS) {

same comment as for DG1

>+		xehp_lncf_dump(info, gt, p);
>+	}
>+}
>+
> static const struct xe_mocs_entry pvc_mocs_desc[] = {
> 	/* Error */
> 	MOCS_ENTRY(0, 0, L3_3_WB),
>@@ -302,6 +449,34 @@ static const struct xe_mocs_entry pvc_mocs_desc[] = {
> 	MOCS_ENTRY(2, 0, L3_3_WB),
> };
>
>+static void pvc_mocs_dump(struct xe_mocs_info *info, unsigned int flags, struct xe_gt *gt,
>+			  struct drm_printer *p)
>+{
>+	unsigned int i, j;
>+	u32 reg_val;
>+
>+	if (flags & HAS_LNCF_MOCS) {

if it's a pvc-only function, we know what it has, no need to check
flags.

>+		drm_printf(p, "LNCFCMOCS[idx] = [ L3CC ] (value)\n\n");
>+
>+		for (i = 0, j = 0; i < (info->n_entries + 1) / 2; i++, j++) {
>+			if (regs_are_mcr(gt))
>+				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
>+			else
>+				reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
>+
>+			drm_printf(p, "LNCFCMOCS[%2d] = [ %u ] (%#8x)\n",
>+				   j++,
>+				   REG_FIELD_GET(L3_CACHEABILITY_MASK, reg_val),
>+				   reg_val);
>+
>+			drm_printf(p, "LNCFCMOCS[%2d] = [ %u ] (%#8x)\n",
>+				   j,
>+				   REG_FIELD_GET(L3_UPPER_IDX_CACHEABILITY_MASK, reg_val),
>+				   reg_val);
>+		}
>+	}
>+}
>+
> static const struct xe_mocs_entry mtl_mocs_desc[] = {
> 	/* Error - Reserved for Non-Use */
> 	MOCS_ENTRY(0,
>@@ -353,6 +528,36 @@ static const struct xe_mocs_entry mtl_mocs_desc[] = {
> 		   L3_GLBGO(1) | L3_1_UC),
> };
>
>+static void mtl_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
>+			  struct xe_gt *gt, struct drm_printer *p)
>+{
>+	unsigned int i;
>+	u32 reg_val;
>+
>+	if (flags & HAS_GLOBAL_MOCS) {

ditto... if it's MTL-only function, we know what it has.

>+		drm_printf(p, "Global mocs table configuration:\n");
>+		drm_printf(p, "GLOB_MOCS[idx] = [IG_PAT, L4_CACHE_POLICY] (value)\n\n");
>+
>+		for (i = 0; i < info->n_entries; i++) {
>+			if (regs_are_mcr(gt))
>+				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
>+			else
>+				reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
>+
>+			drm_printf(p, "GLOB_MOCS[%2d] = [%u, %u]  (%#8x)\n",
>+				   i,
>+				   !!(reg_val & IG_PAT),
>+				   REG_FIELD_GET(L4_CACHE_POLICY_MASK, reg_val),
>+				   reg_val);
>+		}
>+	}
>+
>+	if (flags & HAS_LNCF_MOCS) {
>+		/* MTL lncf mocs table pattern is similar to that of xehp */
>+		xehp_lncf_dump(info, gt, p);
>+	}
>+}
>+
> static const struct xe_mocs_entry xe2_mocs_table[] = {
> 	/* Defer to PAT */
> 	MOCS_ENTRY(0, XE2_L3_0_WB | L4_3_UC, 0),
>@@ -366,6 +571,32 @@ static const struct xe_mocs_entry xe2_mocs_table[] = {
> 	MOCS_ENTRY(4, IG_PAT | XE2_L3_0_WB | L4_0_WB, 0),
> };
>
>+static void xe2_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
>+			  struct xe_gt *gt, struct drm_printer *p)
>+{
>+	unsigned int i;
>+	u32 reg_val;
>+
>+	if (flags & HAS_GLOBAL_MOCS) {

xe2 always has global mocs, regardless of dgfx or igfx.

Lucas De Marchi

>+		drm_printf(p, "Global mocs table configuration:\n");
>+		drm_printf(p, "GLOB_MOCS[idx] = [IG_PAT, L3_CLOS, L3_CACHE_POLICY, L4_CACHE_POLICY] (value)\n\n");
>+
>+		for (i = 0; i < info->n_entries; i++) {
>+			if (regs_are_mcr(gt))
>+				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
>+			else
>+				reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
>+
>+			drm_printf(p, "GLOB_MOCS[%2d] = [%u, %u, %u]  (%#8x)\n",
>+				   i,
>+				   !!(reg_val & IG_PAT),
>+				   REG_FIELD_GET(XE2_L3_CLOS_MASK, reg_val),
>+				   REG_FIELD_GET(L4_CACHE_POLICY_MASK, reg_val),
>+				   reg_val);
>+		}
>+	}
>+}
>+
> static unsigned int get_mocs_settings(struct xe_device *xe,
> 				      struct xe_mocs_info *info)
> {
>@@ -382,6 +613,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
> 		info->uc_index = 3;
> 		info->wb_index = 4;
> 		info->unused_entries_index = 4;
>+		info->dump = xe2_mocs_dump;
> 		break;
> 	case XE_PVC:
> 		info->size = ARRAY_SIZE(pvc_mocs_desc);
>@@ -390,6 +622,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
> 		info->uc_index = 1;
> 		info->wb_index = 2;
> 		info->unused_entries_index = 2;
>+		info->dump = pvc_mocs_dump;
> 		break;
> 	case XE_METEORLAKE:
> 		info->size = ARRAY_SIZE(mtl_mocs_desc);
>@@ -397,6 +630,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
> 		info->n_entries = MTL_NUM_MOCS_ENTRIES;
> 		info->uc_index = 9;
> 		info->unused_entries_index = 1;
>+		info->dump = mtl_mocs_dump;
> 		break;
> 	case XE_DG2:
> 		info->size = ARRAY_SIZE(dg2_mocs_desc);
>@@ -408,6 +642,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
> 		 */
> 		info->n_entries = XELP_NUM_MOCS_ENTRIES - 1;
> 		info->unused_entries_index = 3;
>+		info->dump = dg2_mocs_dump;
> 		break;
> 	case XE_DG1:
> 		info->size = ARRAY_SIZE(dg1_mocs_desc);
>@@ -415,6 +650,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
> 		info->uc_index = 1;
> 		info->n_entries = XELP_NUM_MOCS_ENTRIES;
> 		info->unused_entries_index = 5;
>+		info->dump = dg1_mocs_dump;
> 		break;
> 	case XE_TIGERLAKE:
> 	case XE_ROCKETLAKE:
>@@ -426,6 +662,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
> 		info->n_entries = XELP_NUM_MOCS_ENTRIES;
> 		info->uc_index = 3;
> 		info->unused_entries_index = 2;
>+		info->dump = gen12_mocs_dump;
> 		break;
> 	default:
> 		drm_err(&xe->drm, "Platform that should have a MOCS table does not.\n");
>@@ -467,16 +704,6 @@ static u32 get_entry_control(const struct xe_mocs_info *info,
> 	return info->table[info->unused_entries_index].control_value;
> }
>
>-static bool regs_are_mcr(struct xe_gt *gt)
>-{
>-	struct xe_device *xe = gt_to_xe(gt);
>-
>-	if (xe_gt_is_media_type(gt))
>-		return MEDIA_VER(xe) >= 20;
>-	else
>-		return GRAPHICS_VERx100(xe) >= 1250;
>-}
>-
> static void __init_mocs_table(struct xe_gt *gt,
> 			      const struct xe_mocs_info *info)
> {
>@@ -578,6 +805,33 @@ void xe_mocs_init(struct xe_gt *gt)
> 		init_l3cc_table(gt, &table);
> }
>
>+void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
>+{
>+	struct xe_mocs_info table;
>+	unsigned int flags;
>+	u32 ret;
>+	struct xe_device *xe = gt_to_xe(gt);
>+
>+	flags = get_mocs_settings(xe, &table);
>+
>+	if (!table.dump)
>+		return;
>+
>+	xe_device_mem_access_get(xe);
>+	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>+
>+	if (ret)
>+		goto err_fw;
>+
>+	table.dump(&table, flags, gt, p);
>+
>+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>+
>+err_fw:
>+	xe_assert(xe, !ret);
>+	xe_device_mem_access_put(xe);
>+}
>+
> #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> #include "tests/xe_mocs.c"
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_mocs.h b/drivers/gpu/drm/xe/xe_mocs.h
>index 053754c5a94e..d6fa4485a6e9 100644
>--- a/drivers/gpu/drm/xe/xe_mocs.h
>+++ b/drivers/gpu/drm/xe/xe_mocs.h
>@@ -10,8 +10,16 @@
>
> struct xe_exec_queue;
> struct xe_gt;
>+struct drm_printer;
>
> void xe_mocs_init_early(struct xe_gt *gt);
> void xe_mocs_init(struct xe_gt *gt);
>
>+/**
>+ * xe_mocs_dump - Dump mocs table
>+ * @gt: GT structure
>+ * @p: Printer to dump info to
>+ */
>+void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p);
>+
> #endif
>-- 
>2.25.1
>
