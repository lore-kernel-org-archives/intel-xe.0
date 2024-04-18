Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC18C04FFF
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 14:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF546113799;
	Thu, 18 Apr 2024 14:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KXzNb+kI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF50710FC9F;
 Thu, 18 Apr 2024 14:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713450497; x=1744986497;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xkUhIhjIkPDrVXSQyOP/IF42rqw//ccVXgZBVwKixfg=;
 b=KXzNb+kIojsj6Md2Fftb9EAsjz2SLxRPOqMgYgKj8icwksHCks4LkSrZ
 SMSzkRqtiiyxdXyy51erD46hjUzQvWhG5Kg8Ls4U9rEhUhytck8vS/uen
 Z3zTuxY+xW0vnP7KhEBkXla4U0xuFI7+dwk3oBTHcD06TCN+hW2lCNmrA
 UPYSWIPS0/893LfcNa55Y/WSFD3z8YchEWaipUcrdOxobqX8rRFLSap6v
 wNFgNSysI1evu+Ql2Sx0r4We1WTSG4cs0p3h8J968jnLPRtFv4eVkuFcR
 QAvdmWsLVZi0/FbXK6UdAM1erSiWxAW0mGgIiZCGipShWgv4aars/j/hj w==;
X-CSE-ConnectionGUID: td9BuVHUSLuSjSQkyMiRsg==
X-CSE-MsgGUID: npQZw0CbTSeHW93aAjppeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8925917"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="8925917"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 07:28:16 -0700
X-CSE-ConnectionGUID: HcsRvf4aT1eaV3IUQDwNjA==
X-CSE-MsgGUID: WLZWC0BYTKq5pSfyBD17dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="23521262"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 07:28:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 07:28:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 07:28:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 07:28:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 07:28:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N19beNNTfpynWExhzQZJblsMtFeD9PC47r26zvdEAeeiiew+sz7dJqG/1sHDrWnXP/SZoQMluEa/6pd9U+PkRDZu7XxQflQ37KRhGMLtYzsT6cMInP1ussJtt45I7kFjKpIutmZmU4P4YxGCH2Q6bxA7R1edsFfsSgLt8r+Wk9jgbGqt+8fTrhiY/LTKsFtw4J9dvaFNFlFjAagiq0oalLkUK4QLnOKFK3aQAl+1XkXXXZjfvYqfVM9Gl7oiNPfPcZ4lMGj+zEWq69fkOTflDkMmcEjvMsOrpmjYkXoJbkf/3nfG5Az//7gnPjyIALlLrgIDs1p/jxsZxKJdr309IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJS6wI0bkzVSywOnYwuZQel8cwE56IpChDrAaP7HxMA=;
 b=OSl2d1MriX5E5s3+jt+jh4b70sJiFKgKIS3/oWd0+LjIpVfie16M6rK4fblU5vdclyn5xWy7GAvKvCoYpI/bZnfxZVB7eIq0RA2Bt3UPAEvm2owxo4IR69kkpzyr0kXzaug8PzkAUOblOWc5Hibe1EJk3QPsZbxE3hGYwGFPttlkKbHfV37J5utwn582f8CuKfeSmMzzz+hzW89uKP4umr5+d2oq7Fp4G6XwchpAsXgF7bQxnq5adLN8gQFsqeq6bYcHInbOqcGF7iZCRzasGjzVE6PHGc2vGIGvhZKRT+kx+zhmz0yC5XSFxkUSR0AGiOVsydHqduvLfk1XcadoVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA2PR11MB5066.namprd11.prod.outlook.com (2603:10b6:806:110::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.42; Thu, 18 Apr
 2024 14:28:13 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 14:28:12 +0000
Message-ID: <e7613a0e-0d65-4a10-bbc2-7955760333f5@intel.com>
Date: Thu, 18 Apr 2024 19:58:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] tests/intel/xe_wedged: Introduce a new test for
 Xe device wedged state
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20240409221908.1077893-1-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240409221908.1077893-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::12) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA2PR11MB5066:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bd18670-75af-421b-5cc3-08dc5fb3c72c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UIfpjv55uOTMGCGBmFxi0sLdf5ds7AOpNX7imFNGiXAK7kJ01I3pao4u0/LZ1LKNQclEeceZ5ct0vMb138jmc5y+R94gnAcgw69nfHbF8pFhiWZXWpOaNW9j2y1lfZEnyZecUzm3G+AO4UO8yHdVRZIhbGyFrvoOXoGgCEqLB5vSxdftGBWb0iDxF0jBU19i/xGhj95HngCwXbVvgUD9gcv776sqpUOZw35nwyWKgR1/FwWWUnSOpU7p0yKUWjQant1JS9kXPWJB/B6nMAbNJqtpieW5B20tbD13dYepjZnwx8gjqJBUKONuQuOuU1EKtpJmOJR8NmeWUcL8UJhVhg5dNibFIo2EIOHQJ2pgUQ5D19snL0jhWR/WdiB6If+r4usaQRgqcEggcPjr4alDkk74sAvNpbaC7Wll+HxpPTIUZ1IV6t4eT2W7Or/+yjNRGUQIXgYFn6N2STe2PSjA78LNLgBFJIXZynzGKeAAlWf38HXIWVAjF7dmKmimUAWTeVe3pw29klfmNaRf6FIsfMmXYO0kfUxh2Yrt6kTXRQhEC5AO/8KJypiqN+5Gtzgz4fBHGz9X9N4x4WI4NW+wpC4KGcRKbUp0p17atlXqbCq330qgcj3389UXVXXQ8ecc2A0iEdtNdJbIfHhQ7B1lXYhqRgCxw2l1E7G7NYUFgpA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTlDSmJkZUpwTXI2dDNKUm4yV1l4RmJDb3N1MzdpMVdFUU9Oa2Q1M0FaZmhV?=
 =?utf-8?B?M0RISThmMTQ0UTZ0VEZrU3kvUWR4QlFzRERqdkNxNFVySm9RenJDdDFDa3Rv?=
 =?utf-8?B?dEIxRks0L2Roc0cxVzUvZlJVTnBRMmlKcm9ZQVFpNmI1eFlrRWo3S01GNE1J?=
 =?utf-8?B?K0hKZlowOTMydnV2RG8veUcwMGFicTJCTk9nTGIvdkIrT0pBb0t1M2RnVXZ1?=
 =?utf-8?B?N1pHUjg4ODUvOUpPTTJVUW1ROU5QdVhLVWs1alZnVTB0V3RjQnZUUmJtRk5M?=
 =?utf-8?B?d05OQlBHU0NPdkUwamR5dFUxUXdYeEhRd2h2dCtOUUhmRjc4bGpUdHhSdVQw?=
 =?utf-8?B?c2NMTlVxRjhkVHhJTWcxKzIxSTA3VEdlRStOd21rUlFaYTJyQ3hKcWFzVzgz?=
 =?utf-8?B?VytzcVQ0Q3BPL0o0MkJteDBXaWJtNlZYSmh5eWIwakY1eDZqWStnSlFoSUwv?=
 =?utf-8?B?MlpJVXBYazhyb2xwSUNtSFdOQS9kQlpwd2VBVGQ3V3laNHJpb0MzVDA4UXFj?=
 =?utf-8?B?ckFsTGdMUitPQWxJSmlRTW81M0ZtN1NOY2Y3WStFb2o4aUl4UkdKOGcrM0lv?=
 =?utf-8?B?emh4aXRjL1ZVSWdMTCtjeTVZUzN1Qy9kTGovemVXOFhWSjAyQ01mS3FJbGlk?=
 =?utf-8?B?WnIrL2lrSFZUWlBNU0tpNk5IRko2VitMb2xWLzdGMFJUb2ZMZEx5UURjY3pu?=
 =?utf-8?B?UGpKY2ZMcVExMHJEZlRUUEEya3Q4a0Q4bkp0SjB3Q2RQREdBOU9yNVFYTkg3?=
 =?utf-8?B?dmRZZzF0ZXpqOFdKQnY0RWZJQ1JmOE1xS1BwWE5lcVY0Z0F0RzkxMWFKVlcz?=
 =?utf-8?B?bEFNbko3aVhHbG1VdmdvcG50Z1RBSC9tQU9iOGttSzJucXF1QkhjZjl3UzRP?=
 =?utf-8?B?MjF4THlGM3ZNU3NIb2twQW1zZlAxTVVDdXFJOGJlcnpiWmxEeVJHcUJwaUhr?=
 =?utf-8?B?VHNpbFJ1b2NEU00yRXpFY0cyUExlMzgyLytRZzdtUjNiUUxjd3o4aVJFQ2NB?=
 =?utf-8?B?RDR3NzU4ZnlPdGRGVVd6YnhMdERzblVxbFlTa1FvM2hPdEdsNCtuM3ZNVEo0?=
 =?utf-8?B?cHZlbVJLWGh3cTl2b0U3VUo4d2sycmZtNHV5aUtuYVJkR0pITzk3Z2R4UFNi?=
 =?utf-8?B?NURIbGJrcFNKV3dLMkN2ZTlRRkxSbUQxdkd2NStOMkRqeUJlYnNuQlJXRmJk?=
 =?utf-8?B?UEdhejcydjhnb3NGSk5YaER6SERtWFAxclNwL3NZUHMwaVFLS0d1U0tQWXh0?=
 =?utf-8?B?UE04RWNCeHNWVTI5T1B3U3lxdUxaZjNMbWZFamFMOFoycUpoM0ZPcW9oc1A4?=
 =?utf-8?B?dGVkSWNYbnpxeDdmWkpENEQxOTVBaWdVbjdMa0ZLNXVlWGxseXZURnZ5NjEy?=
 =?utf-8?B?a0VUcGllcXlhbEk2czFteDBkbmVxN1BNRmVLdmJEWjk4VHNPZnNVME95Wk1W?=
 =?utf-8?B?U1AzZFdvV3BMVzVQSGpJSStMYUJDeThUd1BYMXQ2TUpQSkZDc3puRGltZmFF?=
 =?utf-8?B?eGJkeDQyZTM2dVFhTEUrTXpQYWZ6Z2tFT1o3cnN4d0Z2NE9YWnRJOGRiWXVL?=
 =?utf-8?B?cncweWRJM1J4NHNZdkdVTUNsdVlLTWp1RjA1KzFscUwzNTNESW9FSXZHTE1n?=
 =?utf-8?B?QmFXSEJ3UGtSd1VoSXlhTzV0anhFMnhCS1AzUGlUVGlvVnljbHMxWEFaRnV1?=
 =?utf-8?B?dUFLbWZDWi9wemt1bGVFZW5ZWmZlUE9qMHNjcXdwK25nTkdhc255Q09TUGJN?=
 =?utf-8?B?QVJmZHpUcEFGTkZEVjAxYUdITGpMdDg2c3czV1htQnFvQkRoamxnei91eG5q?=
 =?utf-8?B?MThNNG9kYnBkMG9HVVpwUUxOOHdwVS9KTzJ6Y2xDVzUyLy9FTGpjNmVtUGhL?=
 =?utf-8?B?S2E2eXgwWElGenMvLzVHbWxOc2djM0VhMUl0Q2IxeVIwREJlTjJmRFNBSHVM?=
 =?utf-8?B?Uy9pY3BWSVAzRlM5bGxhV2Nuc1AyU2IydTFNNTRuZDJiRVh5NzVHZzl3TzFz?=
 =?utf-8?B?a1dJRWlrSUhFVi9nZlJ5ZmcrQlFIQWp0QXNZeDJMRnJzd1ZFODFCNEZUN3RF?=
 =?utf-8?B?V0dNLzllVFBhdXpKeS8zei9IaDBxd2swa1cwd21KdkY4SlgzazV4L2lOMFZo?=
 =?utf-8?B?dFlubWZXY3MrWkJzdE9EcEljME9HdGMxOWtZRXhiQ3d0dHZkNUtkenpCMXlC?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd18670-75af-421b-5cc3-08dc5fb3c72c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 14:28:12.8687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bu+2K6BKRg5ovk2+jXxxrnJ05ZeBRgql2oSUiv2fzMFub3O6ppxyblzhVE48V6MPjNRmkz/r63a+jSn4PU+zfzkpminWctyNE72Yf/pJcG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5066
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


On 10-04-2024 03:49, Rodrigo Vivi wrote:
> Let's inject a gt_reset failure that will put Xe device in the
> new wedged state, then we confirm the IOCTL is blocked and we
> reload the driver to get back to a clean state for other test
> execution, since wedged state in Xe is a final state that can only
> be cleared with a device rebind/reprobe.
>
> The fault injection of this test is entirely based on xe_uevent
> provided by Himal.
>
> v2: Use rebind instead of module reload (Lucas)
>      And other improvements also pointed out by Lucas.
>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc:  Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   tests/intel/xe_wedged.c | 108 ++++++++++++++++++++++++++++++++++++++++
>   tests/meson.build       |   1 +
>   2 files changed, 109 insertions(+)
>   create mode 100644 tests/intel/xe_wedged.c
>
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> new file mode 100644
> index 000000000..f2587cc43
> --- /dev/null
> +++ b/tests/intel/xe_wedged.c
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +/**
> + * TEST: cause fake gt reset failure which put Xe device in wedged state
> + * Category: Software building block
> + * Sub-category: driver
> + * Functionality: wedged
> + * Test category: functionality test
> + */
> +
> +#include <limits.h>
> +#include <dirent.h>
> +
> +#include "igt.h"
> +#include "igt_device.h"
> +#include "igt_kmod.h"
> +#include "igt_sysfs.h"
> +
> +#include "xe/xe_ioctl.h"
> +
> +static void force_wedged(int fd)
> +{
> +	igt_debugfs_write(fd, "fail_gt_reset/probability", "100");
> +	igt_debugfs_write(fd, "fail_gt_reset/times", "2");
> +
> +	xe_force_gt_reset(fd, 0);
> +	sleep(1);
> +}
> +
> +static int rebind_xe(int fd)
> +{
> +	char pci_slot[NAME_MAX];
> +	int sysfs;
> +
> +	igt_device_get_pci_slot_name(fd, pci_slot);
> +
> +	sysfs = open("/sys/bus/pci/drivers/xe", O_DIRECTORY);
> +	igt_assert(sysfs);
> +
> +        igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
> +
> +	/*
> +	 * We need to close the client for a proper release, before
> +	 * binding back again.
> +	 */
> +	close(fd);
> +
> +        igt_assert(igt_sysfs_set(sysfs, "bind", pci_slot));
> +	close(sysfs);
> +
> +	/* Renew the client connection */
> +	fd = drm_open_driver(DRIVER_XE);
> +	igt_assert(fd);
> +
> +	return fd;
> +}
> +
> +static int simple_ioctl(int fd)
> +{
> +	int ret;
> +
> +	struct drm_xe_vm_create create = {
> +		.extensions = 0,
> +		.flags = 0,
> +	};
> +
> +	ret = igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
> +
> +	if (ret == 0)
> +		xe_vm_destroy(fd, create.vm_id);
> +
> +	return ret;
> +}
> +
> +/**
> + * SUBTEST: basic-wedged
> + * Description: Force Xe device wedged after injecting a failure in GT reset
> + */
> +igt_main
> +{
> +	int fd;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +	}
> +
> +	igt_subtest("basic-wedged") {
> +		igt_require(igt_debugfs_exists(fd, "fail_gt_reset/probability",
> +					       O_RDWR));
> +
> +		igt_assert_eq(simple_ioctl(fd), 0);
> +		force_wedged(fd);
> +		igt_assert_neq(simple_ioctl(fd), 0);
> +		fd = rebind_xe(fd);
> +		igt_assert_eq(simple_ioctl(fd), 0);
> +	}
> +
> +	igt_fixture {
> +		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
> +			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
> +			igt_debugfs_write(fd, "fail_gt_reset/times", "1");
> +		}
> +		drm_close_driver(fd);
> +	}
> +}


Patch LGTM.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


> diff --git a/tests/meson.build b/tests/meson.build
> index a856510fc..65b8bf23b 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -274,6 +274,7 @@ intel_kms_progs = [
>   ]
>   
>   intel_xe_progs = [
> +	'xe_wedged',
>   	'xe_ccs',
>   	'xe_create',
>   	'xe_compute',
