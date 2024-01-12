Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFCAC4707C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 09:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9619410EAC8;
	Fri, 12 Jan 2024 09:25:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99DC10EACE
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 09:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705051530; x=1736587530;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aKKsU3LUuR7w/sUK7bCRJ2ghURauYYRVx/gNktdzpbo=;
 b=I35TWpVY/Yb89YIZpM1dVOIJN9cI3OhrGF0KWReX2w0pKs/E0ym/4NIp
 gj9YzhoGiZFjNg1AHPHkQk1QrhRFXTXzdr2ttqbx85C/x/L2uVN0iPPeu
 gsCcmzOjdpMJ58JyFv5hd0tqjCOHeoreIpFWgF7uwFagBHm/Mq88lmXw2
 4xOeYy2M94JapJmFkm4KV9mzlWhz4hFhcxSaaZc8Wny/mqs67lAwM921I
 yniV54DYo/K7Q7pLgzgPA3BsQKfuwnxSmtDB9unYuhoPjA8eWwmjc0Rve
 UHNqTsab/mZ4+QgZeW/WbUEUE+Ek9uS1TmXeGvbL30J9vfkLcG0xYF0sF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="5850411"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="5850411"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 01:25:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="759076416"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="759076416"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2024 01:25:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 01:25:28 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Jan 2024 01:25:28 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Jan 2024 01:25:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtU2JHAXOAZmKMTPJVavQ/aUfGAtRH1yoBRwBG5EzO+uAwRU5bkA9JVOX5YLQkfw7EYP/cHYS1mzQs2sAdB8C2THYwDpiDN151ez5Kfi1fU2pueEV7COmw4Mk6da/CpVoFXKGP3iIl1kABc/JDA0YfJW1HSJ1Ah5SiSJupikes+lTmTX1g5gM9Iymso4pLURySbMHTbtFi4Bx3deElcJu2BtfthIQRx7SaqIgOtXx9LsQq1KlheLxSUJxtDvRYt+ZaOUPkCSnws7YJvKrpxAfhf2BM1SMtU9B6afdnzgjIyqiN39MqRNhuVJ0Nezikyei+wc7xKrNkMRkqxmwdW29Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4c8W5tOeVz7Ra5lJVGGkeRCs8Ag3XBMqiJFObDKv6QM=;
 b=A9IYolp/h5Ft40MCnn/Spazgqd7Rk3AMbJJsGBXFJyWYgmOb6tqgiHTb/jd7VwhmHsQJYlQjMQ0Y+XPgIi9NaNFLXZGdwRISePJ3Ra6Et8lbYiAXG0DQjO+J9l2kkhHSzKttEzkaqCCA4lEsU0txo7CxVdO90iZaU7ItATSquEeDSrvhSI91Lpn4RtDZ3GNYjc0jUwrEHhQ7BBEQ7UzPofMtNhQaNRvekKIH4EDdn2g57WSyLOtMdTUwHlN5Iy5CctbfEw3HuUPcg3h5hoxY9nKv4cVhFGaLrLV1cTeYVSlCqWkEuMHPYF3YMlFIxhIJ1u0PX4VBHb3fAV6OyrDdgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CY8PR11MB6867.namprd11.prod.outlook.com (2603:10b6:930:5d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Fri, 12 Jan
 2024 09:25:25 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626%2]) with mapi id 15.20.7159.020; Fri, 12 Jan 2024
 09:25:25 +0000
Date: Fri, 12 Jan 2024 10:25:23 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe: Allow to exclude part of GGTT from allocations
Message-ID: <20240112092523.ir4ktzlhotrvo375@intel.com>
References: <20240111182559.629-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240111182559.629-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DU2PR04CA0047.eurprd04.prod.outlook.com
 (2603:10a6:10:234::22) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CY8PR11MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: 0085fb0a-a593-4f60-dbe0-08dc135068c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vEbG+7Dc3fIvgVAwsLaisrC6uJ6V3hqtwCOO7FI4qoy5cbGSqFbsS60gwWwLVMI1Bm5qxreO/QD69Ier/9FTCHRsxw2a4V12Jm4zyw2lb5osLmH9ppD0yMrd9wcvFFglvhPnvKYZz8vxNePXQj01QaBePTGfUcmIl7lqbWTES5HFtFnPbIPWmMc1UaG3AybPnxrmxRoKpIhUh6pEE8bI5jWkE2lT2aOg2W2U+NfDp+O9ZojZmZBv1MDMORLVd5ng5hKRFvHs+4pYvpZoq97hlLw3WiKJp7jEA8ofI9hlFVAn+6c3YsSsJBO2Kt7w2OXApUWItzFA6ZqncOaH4zNzVgpZnRkr5JGpwuLC58z1M1S6b6hq5BGdGcgcNKC8EWhCndrFZ13U5l9z7O93Rp1K94drUfDD8FOMi3aY4oercWn7oJnqsSyGITuxDX0ZHpzpgkax2PNS8SfAcX3DfrSvaKg/zQZYCZHHeZRtBJ561sPLlP4CQsNAawKcewzva5iX+D4Tp9yUrz+cqqOXVynP8B6mT7KwybaUD1TiQIlOCAegcKIherTL0DpCBmVhJ/IC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(346002)(136003)(376002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(1076003)(6486002)(6506007)(6512007)(26005)(66574015)(2616005)(36756003)(83380400001)(38100700002)(82960400001)(86362001)(41300700001)(478600001)(8936002)(8676002)(4326008)(6862004)(5660300002)(66946007)(66476007)(66556008)(37006003)(6636002)(316002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzNHckc1NHYrWC9kTjNRdExmYTdwUjZPRGR0alJrS3RQRUlUd1I4d1hTTy9S?=
 =?utf-8?B?Z2MwbDloaEdZR2I1eWdSVFRESU82Ky9pa0VoK3VaMXMrclpCSEFLQ1oyOVY2?=
 =?utf-8?B?QnkrOFRENkFQd0doSjZFYUNQQVRsZUpoaU9aU0lGMlpPR2UxdGZkaUhjOHor?=
 =?utf-8?B?emJud2tCMk96SURCUWpFTC9FZ1RRM1VYWGhqK0wzT1p3dkJ3cnJFV09PaWlm?=
 =?utf-8?B?YUZZYkR5UkV1a2RhZVpDS29JMy9kV3VMV0dPNHowMGZUZVVnMEFwcTYzdEhS?=
 =?utf-8?B?eHNmcElZb2E5ZDJYcUdicldwNVBveW5ncS90Vkxod1E1NTBuaFFjY0NtbnAv?=
 =?utf-8?B?RmM0ZmZuR3JsdHJ2Y1I0QnZ0cGtEaEtML294eitXMXRZd0EvcUN0RUd0dEJk?=
 =?utf-8?B?YlgwdHdIQnB0NzBuaWdzZFdERUZZZWcxc1RnZGlBL05hZWZRbUJkVHdvbjhl?=
 =?utf-8?B?L2I4L0NTSng2VWlKSU9GaTN0MDJUU2JVanM3dXVKMXo5VVJqN2hGUU9lcFpy?=
 =?utf-8?B?aG4vWFI2UFByN3hBSXUyRHRGWUNKa0V0UHRhSWlMVXlkdW1wS2Q0WjFJZVRG?=
 =?utf-8?B?dWxTN3ZVZHpXRzE5U2piTHM4S3YwcGVsZDFCZVIydS9uVHFXaklVc1NEazRn?=
 =?utf-8?B?VnRNWHdRaWplRnpEVmFaTEpmaXZuSnBOdE82bkg3TVF6bTJ6dTVXbFBldzVz?=
 =?utf-8?B?ZmR3YmRFOW8zaHRRbll4TDYyZUlFdjFFcVJpTGdmTE1hSVJ4T29XSWh0TklZ?=
 =?utf-8?B?SmNFS1d6WHRNSFhISC9wMW9NTSs3eG5OL1oxaFRrb1JNRENYM0pyb2ZUenRM?=
 =?utf-8?B?am1MeWhOUzNxV0d4TlBBKzRkT0N3SFhQUzNFcUluNFlnT1Vidms2TS9KYmFj?=
 =?utf-8?B?QngrMWFqYmVvSFVHK0MxVWdQNlRibEZ1OTBjZkZlWmhRQ1Fva3dBV2pjQVo0?=
 =?utf-8?B?Q3JuMVlYcE1HNDJRekVvNUdqTWxxRS9TV0hrK2gzcDFhcmUrVEZTN1JndDNB?=
 =?utf-8?B?VUJhRldabnJZUGprSnF5bTdXbGYxRy94ZGZKeTV5YkZIRWVYTmpHK21rL0Fi?=
 =?utf-8?B?TDdDdjUvU3Bjdll3blU3YktMcnpsUjI4SXg0c2FFOVYzQTdJZEtTM0RKT2J6?=
 =?utf-8?B?bzFyK21mQzFHQTZHUFB3ZjlwS3NpU3RmTnJFV0p2aVozaVYvemRNdGRqQ25V?=
 =?utf-8?B?eWNjc21scDIzZkhOMk4xUUt0aFBuVmg0QkU2MjRyMStEWDBSNXUvZVpVdmVU?=
 =?utf-8?B?bEQ1NjhKd0QxMWVzWUxEV2QyM2tPZStQRjIzWis2SGhnakQ5aFVPamY2N0tQ?=
 =?utf-8?B?c3NQS1p1ZHVLUHBIMDgxay9jZzBKMVdDODU4d2hWdjVmdHlVK2NYeHdRenBK?=
 =?utf-8?B?ZFVwMXIvQmRMN1E4ZmJlZ1NBdGk4SXczMzJadmkrOVg2RENxdDMvZnVYOVZm?=
 =?utf-8?B?WlNWZ2s5eE1zSFJCcGhqaWpHVEJ1WFBjWWc5SjFhYyt6ckppLy9pYW9Hak4z?=
 =?utf-8?B?eEg1OEhKd1hLMjdsdmpnU2R5T0lmUzFKc0JZZTJoOE00M2NER0dRN1VkQlN3?=
 =?utf-8?B?Vy81VDFiblpoRDcvSksyaVBSR1UrSG1DQ1VLdjNTdkRTSlh2RVFqSy9TbHhq?=
 =?utf-8?B?dElxR0FzQnRmb3B0cExoZ2JFZVhCWGV5V3F3dnZVeEJWQkRKT290RSszTHBI?=
 =?utf-8?B?OFVGbXVvU1MvNnoxUG45SXVvK2FGb0Y0MU5OaFZmUFJ4SlFSK2w4aC9mbEhN?=
 =?utf-8?B?YkFUby9GWmtDc1l6QmhkMDR3MEFCMUJib1dDVzQ5Tmxtb1UwWGdFdHQwcXpM?=
 =?utf-8?B?SmRyMlJvOEZ4KzZURXAxejBML1lIckFtN0pMakp4VlhLL2w1bC8xUGsvZjFn?=
 =?utf-8?B?MGs4NkJmRW15UW5Tcmp4UWdVQi9KZjRtblJCQk5seGtXQ2lUNzRkOEpSTnlB?=
 =?utf-8?B?QUJlZkRYWHgzZnBHNlowUFBqOVNyT2IxZFI3WTVkTXJZSWNvbEZMV01uNkZH?=
 =?utf-8?B?UlpZbW5oVTFRc0E2VnZzTGFsSThEQk1FbUpQS0lHU2VRTDMwL2VqRVN4QWVR?=
 =?utf-8?B?ZjZuSEd4VHQzQXFuYTQ3NXV4YVNTRmFiMytJeXZhUEdsZHZjZHRwc3JvY3My?=
 =?utf-8?B?TXB0bEFzditTdGFVRnJBQThIcnNBUHVaK2VWVGF1VFl0bUhjbnZYQ1psY3J3?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0085fb0a-a593-4f60-dbe0-08dc135068c6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 09:25:25.7320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v85crqQSHlMRziBlqfY9H6M1QY5qx2pzUIEKvUPRlxPLoJdPBsZIjTrT9XanLVZccbVcBuBl+sktCHZOVSr6fy1coVVSa8I68YlCQVmQmOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6867
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2024-sty-11 19:25:59 +0100]:
> Soon we will be required to exclude some of the GGTT addresses
> from the allocations, since on some platforms running the SR-IOV VF
> mode, we will be able to use only selected range of the GGTT space.
> 
> Add helper functions to manage such GGTT range exclusions, and
> follow the naming from the similar concept used by GVT-g.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 71 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ggtt.h |  3 ++
>  2 files changed, 74 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index c639dbf3bdd2..6fdf830678b3 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -11,9 +11,12 @@
>  #include <drm/i915_drm.h>
>  
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_regs.h"
> +#include "xe_assert.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> +#include "xe_gt_printk.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_map.h"
>  #include "xe_mmio.h"
> @@ -312,6 +315,74 @@ void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix)
>  	}
>  }
>  
> +static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
> +			      const struct drm_mm_node *node, const char *description)
> +{
> +	char buf[10];
> +
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> +		string_get_size(node->size, 1, STRING_UNITS_2, buf, sizeof(buf));
> +		xe_gt_dbg(ggtt->tile->primary_gt, "GGTT %#llx-%#llx (%s) %s\n",
> +			  node->start, node->start + node->size, buf, description);
My personal preference in the log is for the address range to be 0x1000 - 0x1fff rather
than 0x1000 - 0x2000.

> +	}
> +}
> +
> +/**
> + * xe_ggtt_balloon - prevent allocation of specified GGTT addresses
> + * @ggtt: the &xe_ggtt where we want to make reservation
> + * @start: the starting GGTT address of the reserved region
> + * @end: then end GGTT address of the reserved region
> + * @node: the &drm_mm_node to hold reserved GGTT node
> + *
> + * Use xe_ggtt_deballoon() to release a reserved GGTT node.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct drm_mm_node *node)
> +{
> +	int err;
> +
> +	xe_tile_assert(ggtt->tile, start < end);
> +	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
> +	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
> +	xe_tile_assert(ggtt->tile, !drm_mm_node_allocated(node));
> +
> +	node->color = 0;
> +	node->start = start;
> +	node->size = end - start;
> +
> +	mutex_lock(&ggtt->lock);
> +	err = drm_mm_reserve_node(&ggtt->mm, node);
> +	mutex_unlock(&ggtt->lock);
> +
> +	if (xe_gt_WARN(ggtt->tile->primary_gt, err,
> +		       "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
> +		       node->start, node->start + node->size, ERR_PTR(err)))
> +		return err;
> +
> +	xe_ggtt_dump_node(ggtt, node, "balloon");
> +	return 0;
> +}
> +
> +/**
> + * xe_ggtt_deballoon - release a reserved GGTT region
> + * @ggtt: the &xe_ggtt where reserved node belongs
> + * @node: the &drm_mm_node with reserved GGTT region
> + *
> + * See xe_ggtt_balloon() for details.
> + */
> +void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node)
> +{
> +	if (!drm_mm_node_allocated(node))
> +		return;
> +
> +	xe_ggtt_dump_node(ggtt, node, "deballoon");
> +
> +	mutex_lock(&ggtt->lock);
> +	drm_mm_remove_node(node);
> +	mutex_unlock(&ggtt->lock);
> +}
> +

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>  				       u32 size, u32 align, u32 mm_flags)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index a09c166dff70..42705e1338e1 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -16,6 +16,9 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt);
>  int xe_ggtt_init(struct xe_ggtt *ggtt);
>  void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix);
>  
> +int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct drm_mm_node *node);
> +void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node);
> +
>  int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>  				u32 size, u32 align);
>  int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt,
> 
> base-commit: 79184e72263e91528195db01783148435c7e4fad
> -- 
> 2.25.1
> 

-- 
