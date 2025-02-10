Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8703DC02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 15:16:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A8610E099;
	Mon, 10 Feb 2025 15:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E9Ra8eor";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77DB10E099
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 15:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739200587; x=1770736587;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F1L3SrTIwOakay/7aXrMtAqiyaG+vkBWjMjCZaVaDjM=;
 b=E9Ra8eorXaShc2RRiDzg/xxrWARL7YHtmkigCLU/I5ss+anMh8wAaupC
 bDmTA0tgNOSJRBw5GB2yo1aU82NPCsXXXMKlJ3hB72QL8EkkSo4nUZk5v
 Skz699HkvB7L6+QWPdRaPJKyZx3a2c1Og0s/mtygikMADVXo0lbtv8MRu
 KDhyjGtDVjRk6ioxFqKU31oHL4YJKXrtfRHu/9Ua77X/vLUehTOAjdbGf
 82JIYmrgeHvAG3wkY2BD2dX22e3k1GkcpMqvWcGQN424BPDj2NtUB/4DP
 p/vZvcq9ZhtOqa3Z5RT0bgVQSIn5cSBwYHa4p//HBRADJyN+7VTz824pY Q==;
X-CSE-ConnectionGUID: NwGlmDpgSWaXCZniskQaQQ==
X-CSE-MsgGUID: CH5+ySSNSCmIhbPDEbzI6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50422742"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="50422742"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 07:16:26 -0800
X-CSE-ConnectionGUID: bMZBD2yGSk6iQNYUCx1LSg==
X-CSE-MsgGUID: VXNhwYH3T3OIacHcWkC2Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="112738538"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 07:16:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 07:16:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 07:16:25 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 07:16:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLwu3iHtS+eCK+Kaa+hEswcdvsNJkVLlhZ6IceF72ikoe7FcCvCquywOqaL7Tn0z/Xn9Sm8zNq/Dqd8XtFBmZkqI+x/ZGqaN4lSx+8HIfzvlTkklJeGgDGE8tf4i3yeO+npQD3HfPEVNfQ7c/xrNWC2WpnR7DjsO0dDAaIOKT6bh8v4dnPkCGCy/fykwL29RWDlff1ylYEKc1DRfqP+oxY8hchzxEoJWvlM0XCFLNkJte/8x9zEtifeIBjXHDmQOUhLrggW7/TGBcV4nDnii1/3ad0BbmbMz0us56Rm+ZMw6w5rpBlXi53qIGzmZyJQ3jIAXnEtjkGyGWDT0GBpa9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFgeAP1E5tljadIVYYiwzrA8iKWXmH6YFxGHPXmAuVU=;
 b=H4ZdK3k+cwyu27lvX0w1FDyToiJ64GFqXzEusQAX42yd5JbFecH8MnfGPco5PIfAIGx+AHZ87ejWgdeRHC1IDQHSOSfhDErGkrZlN2bwKvHEX/jx18ZvX9c3sk1JOM8AoTF+rE6Qy77d5PjVtcQgU31xRoB5p7jaQqEvQyZPVD5UWK9UVgxKdjPEerMxKR37ONPdWibx7Iwv/mi8TA/72J2SMOcZTsxuHzmGkVdbTZsuFNi4SZWOLM1WEqb/KvekX6aGwLSWPA5Wrx/M/kbD+14V3zU1lU4ojYPJ57pz7d+IIzYMaw6Sqqv2qV6n3VrCdmWxLj1whP7r15E1ZYNj1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Mon, 10 Feb
 2025 15:15:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 15:15:40 +0000
Date: Mon, 10 Feb 2025 09:15:36 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ashutosh.dixit@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Karthik Poosa <karthik.poosa@intel.com>
Subject: Re: [PATCH v3 13/13] drm/xe/hwmon: Stop ignoring errors on probe
Message-ID: <uuvuoxdimp4iqy6m3o7q67z4ruh7nfmhsnxenbhjd4h7dlhbak@epph57yfuqxn>
References: <20250207221945.2878241-1-lucas.demarchi@intel.com>
 <20250207221945.2878241-14-lucas.demarchi@intel.com>
 <44030d2e-2921-407a-a32a-1c52e2b13062@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <44030d2e-2921-407a-a32a-1c52e2b13062@intel.com>
X-ClientProxiedBy: MW4PR03CA0179.namprd03.prod.outlook.com
 (2603:10b6:303:8d::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6335:EE_
X-MS-Office365-Filtering-Correlation-Id: 92a89c67-3e6a-475e-a8a5-08dd49e5c747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cGJ84PP1Db66v3VK8LABKTydVk/zGH2PmENmUwrUWYJE2WcRbHvlT7NRpbnA?=
 =?us-ascii?Q?jSULCCBWXy6X5RP/eNvT2xSCX5CIryS154/TqBjly9aSaNE6L1lRpwfI6tac?=
 =?us-ascii?Q?mOO0XxJiPupeXy9WvJ59UX+j4kB1yacElriV+oAz7h3vFUlEZ2sDkdi0hTH+?=
 =?us-ascii?Q?J9h59ZXgkEXibPzZEarzaowsdG2lcwd9OtKHu2R/iXsPJ+huBvPGhfwk0xWG?=
 =?us-ascii?Q?G/MKQd0+MkwYqXbxX1JYeacQgewg6ec9YWfFzMUsCCPDWFRifXCCy2N8osTW?=
 =?us-ascii?Q?IiNZeiWXzijhhhZrGXBwJgAGnF6okBP4EuGh0aaHli70BAArlu2AkNVeo43h?=
 =?us-ascii?Q?EtsE5JZud9RcClimizzsmTJ5BXUm1yhK+25ybnhWgyYApIHEVQTs8z16NaVr?=
 =?us-ascii?Q?BQkKHPhkixX1qkYF9UqE/XFJW7uYoadsvpUFpjW16uO0CKcU+Vh+xxNbpFN9?=
 =?us-ascii?Q?82onI3yyOAipynFKFxVQDweUeG3+OVuJB5mXPgsPIwFBVOdGfoM/cOiuduoN?=
 =?us-ascii?Q?1LFuc95EzdsI20jhmIad+RUP2FKYeWFPm16gGNEe8QeJdD89Yry1jCYzQfm7?=
 =?us-ascii?Q?r8u/SVXa9WGevN4Q8r5JreqK7I0hF8q60uVvpBJywQrp6FSUJDaUxSLUUjBQ?=
 =?us-ascii?Q?tPRkFYxEkPXmMjspD+aAYMWQZjwBfYLSeaZC/XnJ1mfPByRPtvs5oxBgmcGK?=
 =?us-ascii?Q?hupaWlZlRnbJRW74FnIWk+QIeFYfQf9BwkJqKDa/akc2IuZ7IVnlMvMyllNp?=
 =?us-ascii?Q?hpRdgEA7RAiwX5GlgF+3l0XSgxBmhz7KwX9RV29bw6SDaVcDnh2/9o+TZgWM?=
 =?us-ascii?Q?tD3sVMoylCHlMIiv+1mVwHT7/SdA3PIsYL1+ehA7futJ+sNE2BmgvedOoPXN?=
 =?us-ascii?Q?b1//tHuqNI1glVc8L2qt3Ur66rbd/RYPm625Im1uEm9Ak2yTMyL0LkgSTMpT?=
 =?us-ascii?Q?u5RgYoMQ8wbO1vFqPnEJhb0o2x8D+KUc0EEykcsFagrK9xfbtQ4lKdoJWbbE?=
 =?us-ascii?Q?l4XWfEhy+OVOYgPiPRDcMsqkqS5FXl9bmcztx6mkMF3Ese34OJMXC9f+e/4f?=
 =?us-ascii?Q?EhMV09vnUEekqoa6OTio4o13fO/9KkXruGYP5QG74f4dlwi/16uMyfSxvh5r?=
 =?us-ascii?Q?dXp8mvsD5ziJHMOu2jIX0+FLd4Gv/4cmVPBvaUpWkSvYXrz36YaP+5b/RIeW?=
 =?us-ascii?Q?TEuekh3s03X5+DKvvYi4jxP8DuYTlDgToV/RZ7mB6BOl+dwIuFrlQX0Drf2s?=
 =?us-ascii?Q?0XkIjNadhi+FwLLUePUGqeiEpNLAM0Wx+xBZ+jfEXfIHEqtwSa76oLz0kqLC?=
 =?us-ascii?Q?4IpYII4ivl3UhaOBhVVEGKQRmcNBdIEd/E9smbaubXfyHCXONHMCHZHS7Zr3?=
 =?us-ascii?Q?6lJJEpJJvKEgwKN3x/89Ntp9iLs7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gCtwfImkyqiyRm175RBLFwJKKvKjNKFoQwYlqhl9MXiC4Bu9YFT9K7UCQeu6?=
 =?us-ascii?Q?1A9M+37L8xsSz/2WovlkOfAZ9v83W4J671wfUYoxHLB1IOHO2+jryg7nO4Pe?=
 =?us-ascii?Q?d+1Uffsn4Ul7e5vB3dRRns24/CDty9WhaUn4sBnWrjarNvKk9XZmrXkU4LKA?=
 =?us-ascii?Q?dDkFUYllPJkamtD80fCncXdBsbEMUipHuy5CwXh5lrk0ZpusS000vnLhpz+Q?=
 =?us-ascii?Q?RW+MmjnXa3nBx5gIzUNp3KEEuyCf6WJ0F9d1V6zuTIUel1CJZ9GRN5W3OTxv?=
 =?us-ascii?Q?cvnVFpA/NsoySOdMcG1uevqjSXiFnMWU7L0UvZpRqbnyc8iIoM5rFhvr7x/s?=
 =?us-ascii?Q?6LwNgIZVtdj26zAuQmRggCd0Hi2YRrO5mI5R0ajeWuWbLM7UCHDRUcFe5/U1?=
 =?us-ascii?Q?gA/JRwxHuORw0NEKvW4QzA0GJsDqoORJQTTB6aRmhd2lOELdadAxgkm0gNu3?=
 =?us-ascii?Q?yW8SObgaQBGuGKzmeg5XJDoyIx4r3X97andXT2h/wu8BYumK/hiyMZcY2hjA?=
 =?us-ascii?Q?1aakwkShN/hSPb5SmWDX8yunYi3EMnChuTuKBGe9U3eVmivO91a8k1pkguiL?=
 =?us-ascii?Q?oQJK2XE5iSYhV0R4lWMuJcg9owl0in6RT8QgA8fFFU+1SzrAxDFaJzr8tRNm?=
 =?us-ascii?Q?C3Y9oHkv804NjU/g4X77H/DVowv9EOW9XgbzfJbe4bOwXvpkS2sVbRl3DLC8?=
 =?us-ascii?Q?W6Dvvi96xw9IVzzEuIQM8zd9SslHe1lbZGFPGCSaTJp1Mxy51SVNAnMgcNRw?=
 =?us-ascii?Q?hp6pUlfRYzsDRhm81E3dqX2bj0thM6DoKtyKqAGAOHoHQKK2leG2IOZcBQQB?=
 =?us-ascii?Q?QoG7luaAqEti27f7QH6LU3ewA0yvNtj85eDV7j1+A9c0qV7TZRh8n5+dYatA?=
 =?us-ascii?Q?1125rnrUgHSY1JA3wvGUWp0OcZLyFVFKupIgAa0VkX2qSu5CrGRK15ixC9yg?=
 =?us-ascii?Q?9x+CssTj0aShk6++tupfTzf6HbhhQ/YtOVNNrCZro31b5Q3ggb3K5NHw6Ot8?=
 =?us-ascii?Q?OZnSXHY7ijt4Flf49vIAN69s65xZ0t9wzNh5JRYUrTk/EZGeWsS++YnT9GBC?=
 =?us-ascii?Q?GodXw2ZSmPC6ueU94LKzSxRZGSGTCiCweclDLiGMsZHqILAndhRbXtV9C4JY?=
 =?us-ascii?Q?N0J+TqVcANGy4nSbZADiiXC/+kt5B/scLJg3oVh/LaJdexHJ8LLTYQpq1vPx?=
 =?us-ascii?Q?0IST98qAjQ+OkqkucOrBhYdOu28/YLNYtbuy1ynFQpe4RdtpedyJTipvg7Ko?=
 =?us-ascii?Q?DiGpKNOo3Lm0VyPfGo6MThOqHZB+AChvM6nk/1KrDaO4NeHLUYAq5Nbrp+Pe?=
 =?us-ascii?Q?eLzxlqyh1tX2lVrj85SJTwM0YKK1/TpYjIzma/yiFxiGVnRoPK3WV5iQzMJl?=
 =?us-ascii?Q?t5SeP1c1BTrLLVWFujy+3VDlfI2ZNKaqFo4PDE6V8U8vpcCWa3E5SS0PKNsk?=
 =?us-ascii?Q?clkV3ZFyDfMFsraWyV8fjKZyPtLW92XniWCZfnZsE83WWe2KKIqPDbX3ulDA?=
 =?us-ascii?Q?Yqd/4ryv71UNVG6VHX7RZ36dCVvSVuLEoOt+jb/aiTxq19ECmGnGQ60CFDxy?=
 =?us-ascii?Q?1P2e/Ihx0MNVBxoQtPQztXzaV66F8GeXvqe7T51nXiEBqVn9dRdp96JEG1nZ?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a89c67-3e6a-475e-a8a5-08dd49e5c747
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 15:15:40.5300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Gxs4GEgDZDTyUEfquOuU+vsAuz4dAvhETPd2hQ56mXenMGo4TO4IjpSfyTso9tXkcwSWXi/y0hDWngz4RBDB8GhBwQD2OqAvtnosPoobFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6335
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

On Mon, Feb 10, 2025 at 11:01:15AM +0530, Nilawar, Badal wrote:
>Hi Lucas,
>
>On 08-02-2025 03:49, Lucas De Marchi wrote:
>>Not registering hwmon because it's not available (SRIOV_VF and DGFX) is
>>different from failing the initialization. Handle the errors
>>appropriately.
>>
>>Cc: Badal Nilawar <badal.nilawar@intel.com>
>>Cc: Karthik Poosa <karthik.poosa@intel.com>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_device.c |  4 +++-
>>  drivers/gpu/drm/xe/xe_hwmon.c  | 31 ++++++++++++++++---------------
>>  drivers/gpu/drm/xe/xe_hwmon.h  |  4 ++--
>>  3 files changed, 21 insertions(+), 18 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>index 002e066f5f288..2e6f42d1b1d01 100644
>>--- a/drivers/gpu/drm/xe/xe_device.c
>>+++ b/drivers/gpu/drm/xe/xe_device.c
>>@@ -889,7 +889,9 @@ int xe_device_probe(struct xe_device *xe)
>>  	xe_debugfs_register(xe);
>>-	xe_hwmon_register(xe);
>>+	err = xe_hwmon_register(xe);
>>+	if (err)
>>+		goto err_unregister_display;
>>  	for_each_gt(gt, xe, id)
>>  		xe_gt_sanitize_freq(gt);
>>diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>>index 7f327e3342123..48d80ffdf7bb9 100644
>>--- a/drivers/gpu/drm/xe/xe_hwmon.c
>>+++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>@@ -839,10 +839,9 @@ static const struct hwmon_chip_info hwmon_chip_info = {
>>  };
>>  static void
>>-xe_hwmon_get_preregistration_info(struct xe_device *xe)
>>+xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>>  {
>>-	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>>-	struct xe_hwmon *hwmon = xe->hwmon;
>>+	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>>  	long energy;
>>  	u64 val_sku_unit = 0;
>>  	int channel;
>>@@ -876,33 +875,34 @@ static void xe_hwmon_mutex_destroy(void *arg)
>>  	mutex_destroy(&hwmon->hwmon_lock);
>>  }
>>-void xe_hwmon_register(struct xe_device *xe)
>>+int xe_hwmon_register(struct xe_device *xe)
>>  {
>>  	struct device *dev = xe->drm.dev;
>>  	struct xe_hwmon *hwmon;
>>+	int ret;
>>  	/* hwmon is available only for dGfx */
>>  	if (!IS_DGFX(xe))
>>-		return;
>>+		return 0;
>>  	/* hwmon is not available on VFs */
>>  	if (IS_SRIOV_VF(xe))
>>-		return;
>>+		return 0;
>>  	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
>>  	if (!hwmon)
>>-		return;
>>-
>>-	xe->hwmon = hwmon;
>>+		return -ENOMEM;
>>  	mutex_init(&hwmon->hwmon_lock);
>>-	if (devm_add_action_or_reset(dev, xe_hwmon_mutex_destroy, hwmon))
>>-		return;
>>+	ret = devm_add_action_or_reset(dev, xe_hwmon_mutex_destroy, hwmon);
>>+	if (ret)
>>+		return ret;
>>  	/* There's only one instance of hwmon per device */
>>  	hwmon->xe = xe;
>>+	xe->hwmon = hwmon;
>>-	xe_hwmon_get_preregistration_info(xe);
>>+	xe_hwmon_get_preregistration_info(hwmon);
>>  	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
>>@@ -910,11 +910,12 @@ void xe_hwmon_register(struct xe_device *xe)
>>  	hwmon->hwmon_dev = devm_hwmon_device_register_with_info(dev, "xe", hwmon,
>>  								&hwmon_chip_info,
>>  								hwmon_groups);
>>-
>>  	if (IS_ERR(hwmon->hwmon_dev)) {
>>-		drm_warn(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
>>+		drm_err(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
>>  		xe->hwmon = NULL;
>>-		return;
>>+		return PTR_ERR(hwmon->hwmon_dev);
>
>Hwmon is not part of drm subsystem so we didn't tie hwmon registration 
>failure with xe probe.

We don't want a half-initialized driver. We never did. The problem is
that we added integration with other subsystems and brought this
initialization-style from i915. We are just hiding bugs.

Lucas De Marchi


>
>Regards,
>Badal
>
>>  	}
>>+
>>+	return 0;
>>  }
>>diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
>>index c42a1de2cd7a2..d02c1bfe8c0a0 100644
>>--- a/drivers/gpu/drm/xe/xe_hwmon.h
>>+++ b/drivers/gpu/drm/xe/xe_hwmon.h
>>@@ -11,9 +11,9 @@
>>  struct xe_device;
>>  #if IS_REACHABLE(CONFIG_HWMON)
>>-void xe_hwmon_register(struct xe_device *xe);
>>+int xe_hwmon_register(struct xe_device *xe);
>>  #else
>>-static inline void xe_hwmon_register(struct xe_device *xe) { };
>>+static inline int xe_hwmon_register(struct xe_device *xe) { return 0; };
>>  #endif
>>  #endif /* _XE_HWMON_H_ */
