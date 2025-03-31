Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FE8C3600B
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 15:16:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B474410E420;
	Mon, 31 Mar 2025 15:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lelma59C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC0E10E420
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Mar 2025 15:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743434207; x=1774970207;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4HvcQTRxGAlhO2KfeMVVfM3rShyhBNYTnGBmhbp9Q2I=;
 b=lelma59C39BUidhAqfyGuBHN/s1rr9opul/H7iMsNATKNMEfA71VVLZ/
 A9d9XcJsNAjf1Ia7WrycBHtRrnZjt+UE5QHE1n2DpI8YjVudBt//72Otc
 lSzCnbLhpMwNWP/7LNi3SKccTWTg6y+jfrL51NzEmpakngndBBaMdUAca
 GVPbCZCBp6I2yWlllB4Aw0DUpYmLIdr2TANnpMF7nxmqKtWXHbqDITbjY
 r1oXCBvE9PnZipBtzFNLApMB4LO7CH9fyURULfVXUBXMPrUUGmFw3Lm7q
 lW+zgGB6rbcDxug1hHuO4hpi6og0F8Z1g01qQbBzPQkyutxMa+4TV0nw1 g==;
X-CSE-ConnectionGUID: diZ9PKE6T6+wGvCBp8AogA==
X-CSE-MsgGUID: QSP6RXM/QteyI2tAOYeczg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44901301"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="44901301"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 08:16:44 -0700
X-CSE-ConnectionGUID: C47pc8GNSpOWN0K/WVpY3g==
X-CSE-MsgGUID: J5Er3TMNRLq80CeZKlmkcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="157119006"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Mar 2025 08:16:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 08:16:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 08:16:43 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 08:16:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nX5hCZ6SgrDUagHNczzkM2nTmIU42QwDSSAlutCHOtrxAjqcpJlMoxtTZxtIr0ZUwwI+LfOh6oAVJd8l4xE6RUY2vxQVX6tZ//3SuA2U0NuHBk2BmOfGeOkSRnjHCw6AQzkBSHxGR0DcYRSd0OXtbZWTRKuZZT/4p71jI9Vg/I9eoDc34X4Q+UPt3NHyey8BVSt6osJYD498/me5V0H0PiEZMUQzRAEg4qTOLlKalpYfDbx3WmFSZc8iMFjuGv/9sL6jQ3E05jU1CYBIpT0b6P77IWY4TaJ1d+WBTGG8FczPlGuUp2zUtIfeceNAOg2oZn0HATR143Gm159+oPnY2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruqpeSsfQyWp9n1qpqNtI+hU5/BoZwnxMBplRildrW4=;
 b=oRFidHIzdmw68BUXEfn+xZ4vrlmFLPC0EjISS/03s9TNriVnQvlJMFgCVBaPMqvjKjAn6WxjkAzi55Gh0awVdP4uAYHQqJQxg2il4tzeKRN2uM8VPzAiIiqtQlCitE6U9eBvcHxoyi4fw66/33ObgitRWU47wNZ/MkmVehse9br/dVqxvGwifOS/1ybVj2ePkKVEAIYWItnuFi9pgvTqp7MN8CVhtKbAZdMD/DQCKBtDt1CyhrF6gP5xbFowURNPrXIr6xogRCWudwWFDH4evCu3kfL8OQj+tZEX4c3dvSKJeWy+ohyVe4EzKnDsIyrxOoArTaBsqktDsDI92frCvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB7300.namprd11.prod.outlook.com (2603:10b6:610:150::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 15:15:59 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 15:15:58 +0000
Date: Mon, 31 Mar 2025 11:15:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>
Subject: Re: [PATCH v1 1/2] drm/xe/debugfs: Expose PCIe Gen5 update telemetry
Message-ID: <Z-qxqtVP6gP64GVb@intel.com>
References: <20250331142336.640226-1-raag.jadav@intel.com>
 <20250331142336.640226-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250331142336.640226-2-raag.jadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0185.namprd04.prod.outlook.com
 (2603:10b6:303:86::10) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB7300:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bae7e8c-1ba6-4ae5-b9ed-08dd7066f0a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lCPt6yMtuvaqLBRXc9J/rZyWBqzFbJ1B4hcpI9a8lWufdsC+jIgmB7wpZLWw?=
 =?us-ascii?Q?JKNZgfG9GHKf10r72EFEcndo6jakfVVKX3j/78ADi33yRrNIEy9eBlIfMqbt?=
 =?us-ascii?Q?ehFTL5GmOkg6tma7qanKqUvoBDawrPmrExB6i5xr/HMigBzb9Rd0rlpEykqu?=
 =?us-ascii?Q?pv3ZiVJ5P9a2hK/33kYTx5N02+acCSCtvPkJohVEZzK5ulYpwVoMBfhZ90GT?=
 =?us-ascii?Q?vlsKkLsKO3e67nmh27xrtaNgNtJO5FFLHClklMhtYsl6aNq6l9S2Te5oeIxp?=
 =?us-ascii?Q?RjWFt5KBU8oGGMWGuQtMv/vJ+MAYTsFN0U9gy8h1IbJLm3u2ReiY7EdjjzCN?=
 =?us-ascii?Q?D8tdLNhbOpp902ZHTCVC0pCfuoeU8vlAFN6mCxC+Cgfd4SA0o/mvly3sdnDH?=
 =?us-ascii?Q?enIGumZJ3+FUuEfb/tWmdzXApilTAsebmLuZkNwQebm/b9O0LENWpD4EMERj?=
 =?us-ascii?Q?NBVe8NY2t0hFp8NbqdihunqQ3IufxOybeZw4AzfApdndgGT7L5zpZY/nITFz?=
 =?us-ascii?Q?q1Q/U5aRBjfGGbY14Ah2eaYxLP0HMUIqqDy2+qIcc/HDhJYdQiV6X9h3hDDq?=
 =?us-ascii?Q?SiaBaN9t4dPfv/Do7djcTd6HiNFQpsrDEWImc+iIshcZYkHk2ga2ABwbgO1t?=
 =?us-ascii?Q?qGNj8iHk31/ILbho6sQfaN3ePPUz/0ofLVFwh+v2fJ/GIvCfmRKS+aUz/3Pb?=
 =?us-ascii?Q?PTYB+bBMMU/+DzpUEoU3GozYCXNRUutLeDcpMGjtlpG9zATrwILcmTCDjtDp?=
 =?us-ascii?Q?ErXj2pGi4Gt9PH9zs71pAtFU3CJ8L93CUzJb0Bxyr47AIea/BxCkzQEsDDap?=
 =?us-ascii?Q?8P+MUZ2yQQaSDk2Zf6j72HP1jBiweeNwTl6ZaLV8Uq6h7DhiJG93SKn4zodf?=
 =?us-ascii?Q?ZS5FLhtX73MSrRjs97zVDChE6EFHxciufas10doFrwGwAltQMNyzLexLR/O/?=
 =?us-ascii?Q?gc1BxQHkXgThMMThTmW9o/FLV1I8bCNcWNoCBP4n3AUR+5CwJKTJV8z+ivXr?=
 =?us-ascii?Q?KeXKjLfwcGgP8e/L4e0rnka01u0Q2V65gPhn69HMhY+8jstZY9HVjrkQ4ecG?=
 =?us-ascii?Q?Yw/qw6s+0s2cdVMke94Z7IfmroknNfUUgv/8wRed6F+0RIK646oU8HFa7uxg?=
 =?us-ascii?Q?BUOnNuLkbvvrQQqb6ro/mKJoDbzceIFV/dB+auq5Kw6tndhYoMX0peaZ4/x2?=
 =?us-ascii?Q?yknzs/20mFqga7JVxDSdhp13NwepPkdJXXwARA1vhELaEx0Oo6LJw5/87PSN?=
 =?us-ascii?Q?EgVu0aoc3PFHWz9yXyAKryAMrDtcWrSDZgl6bIZIqV4G4UhT6RANFSGp/Rth?=
 =?us-ascii?Q?gj5PBun/bnVRpmNSTSEqqwh+Qd870sJBXcrtVaNV6kkAWSRFfqDRDC03Fo2V?=
 =?us-ascii?Q?gpaROObB0R6i3F/pK1aFeZuW93YC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vFbhLEj7pYKOYEz+a7cBw8s5UVstoE2DYAzJuldx8/vpv3/oBJ0ZxTt2Cgbv?=
 =?us-ascii?Q?KeAfPF5Clounqt96RZ7oEnwb8DwgSyC/gN8LvQWAs6Bs+dVY+ONUIVOhUNmp?=
 =?us-ascii?Q?HmFnf2WBqGXHOwL5wgv0E7zdZRSjAMdCcO4z3LeJwuWLvD05AsLETV/ONtCm?=
 =?us-ascii?Q?+ZtYnPakuHtwHCRrzaC+wDIo/JgLZsCThwBlNefLd+OIJb+obx1rg9NjiexB?=
 =?us-ascii?Q?z48lu3d/RlWTW57kzFWfwtumE5z/Sr2U0MNMi7PgaXCxvOlDlKD81qg0cph6?=
 =?us-ascii?Q?kMCk8/M+peCVWKi9rHsOPaBK/iCWfzXTy6hDDT3xXVateiPjml6ovVN2nCv2?=
 =?us-ascii?Q?cti+Mot5P4bFrnx+cz17XUnWUeXBj2K5+GQXmP+GUPazU9gOE0DOZr6Iz3eo?=
 =?us-ascii?Q?Z2c/8qlFXaj7gF1fWEjFImEg1tTeF6bTF6cxjqSPvP0R9X+pr+cGjmHTu4kX?=
 =?us-ascii?Q?MzeWwdqsU1yQA7zyvx96/tBgHNEzLJWxCPzo+7QOBOpLBDupIRY4Xtdm8v/Q?=
 =?us-ascii?Q?xyqdhseQelwzw2E6T7gWpUrdsf8CljLmKzRt/AxgIXnsJKD+eto7zMXvdF2h?=
 =?us-ascii?Q?Zl7VpZAz8MNlPFSTJjmG9KKsJxv+jkoInPEapbI/3dSvJNw1WVg5tHVeMBNX?=
 =?us-ascii?Q?jv6u28yOaZRX39D68j85VUHfOMi9VcqBddmdLCzhTxtwt9KjsbsGaOWTEL8g?=
 =?us-ascii?Q?NVhKsk/o4kCfqkxCm8YOQEwip+z/T6PF+vnU1T9Eq/0gdeDwwPNQ1kWJpLQI?=
 =?us-ascii?Q?q+JsNg+4MOVFjCn8Q7xwm8YljIwqRrx5Gf5li0nWLBr01jGGEuq2D5SZKDEY?=
 =?us-ascii?Q?PJa+QF/wDfd4nYOZPPY8KDhAXdJDjwrUvPrV1dRfzuOVTrLDJkT0XJFbQxwn?=
 =?us-ascii?Q?Y5CfqQYkj/bOfDiJEWPlQ5SAvM/jeA5OgodzuVq6vAOaU+DSKHvXYFgckuT1?=
 =?us-ascii?Q?ZSgZX/JYjp/A8QxB34sBW9Zvbty/QJoWWK7oMmnPqX7A/91oYD7KG0mtGIku?=
 =?us-ascii?Q?rlYpk6E789GJ5nrfy7owP/zZRaFHjgMNc1XUwqSfj7sim9yxKTNWy3TGGWll?=
 =?us-ascii?Q?4RifJMcCRSmfv++4qBGF2MiADzrZYXB/AstU9K9Qee4RSKERcLtoY3NmVlPL?=
 =?us-ascii?Q?ja34KKiCboZFmKlatAqTvt2snhGSXLCC05IrHcSAjj7axe+WVkVHb0xTLoBU?=
 =?us-ascii?Q?qliLZ5CKOv8BA0JmVnS3WHomVgbETeJ0TklvnQvnX/1iYv3eKoIapVeb9OVp?=
 =?us-ascii?Q?qhmLEv3n+GT2YUePhAtljKv6v6QuF8/E3FbsNlFy2Gp+CgR+9RrZGSReBzld?=
 =?us-ascii?Q?SDvXvn1/haD0wQx7uE3Ge0bEGsj3zEmJxNfIyXi43uJz/oHsr7Se9AaEI8/O?=
 =?us-ascii?Q?ELrABSI6/lQESLe429ry4gbqi4N8KZ/Z+hBYC00+lnZTcEDriskmpY7jLIIE?=
 =?us-ascii?Q?dfmQM6OHVWhC1IZENkb6R82fGxh8a2ufFmnTkGG+4rWyVic2JI5gQuNbstWO?=
 =?us-ascii?Q?VlWBjoEEinsJrNzq6MCUYtOBt2r4XBcREFuDdpHaA00y7OyXHkMntBWGK88X?=
 =?us-ascii?Q?H9SdkPxNgPPgCj7PeopZO1BmT7r1AD+Nj/a8ZLB3MogQrtfeKgB0/BnNx3Jq?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bae7e8c-1ba6-4ae5-b9ed-08dd7066f0a6
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 15:15:58.5366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXGewrBDaXLYPXWGoHVB0ggVkuf+bIuGbXyr/naun7xAzQuojbWmmvXulqZVEaglkIhNbweVuQssDOsor5gG0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7300
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

On Mon, Mar 31, 2025 at 07:53:35PM +0530, Raag Jadav wrote:
> Expose debugfs telemetry required for PCIe Gen5 firmware update for
> discrete GPUs.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c   | 93 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pcode_api.h |  4 ++
>  2 files changed, 97 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index d0503959a8ed..67c941abf4fe 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -17,6 +17,9 @@
>  #include "xe_gt_debugfs.h"
>  #include "xe_gt_printk.h"
>  #include "xe_guc_ads.h"
> +#include "xe_mmio.h"
> +#include "xe_pcode_api.h"
> +#include "xe_pcode.h"
>  #include "xe_pm.h"
>  #include "xe_pxp_debugfs.h"
>  #include "xe_sriov.h"
> @@ -191,6 +194,89 @@ static const struct file_operations wedged_mode_fops = {
>  	.write = wedged_mode_set,
>  };
>  
> +/**
> + * DOC: PCIe Gen5 Update Limitations
> + *
> + * Default link speed of discrete GPUs is determined by FIT parameters stored
> + * in their flash memory, which are subject to override through user initiated
> + * firmware updates. It has been observed that devices configured with PCIe
> + * Gen5 as their default speed can come across link quality issues due to host
> + * or motherboard limitations and may have to auto-downspeed to PCIe Gen4 when
> + * faced with unstable link at Gen5. The users are required to ensure that the
> + * device is capable of auto-downspeeding to PCIe Gen4 before pushing the image
> + * with Gen5 as default configuration. This can be done by reading
> + * ``pcie_gen4_downspeed_capable`` debugfs entry, which will denote PCIe Gen4
> + * auto-downspeed capability of the device with boolean output value of ``0``
> + * or ``1``, meaning `incapable` or `capable` respectively.
> + *
> + * .. code-block:: shell
> + *
> + *    $ cat /sys/kernel/debug/dri/<N>/pcie_gen4_downspeed_capable
> + *
> + * Pushing PCIe Gen5 update on a auto-downspeed incapable device and facing
> + * link instability due to host or motherboard limitations can result in driver
> + * not being able to successfully bind to the device, making further firmware
> + * updates impossible with RMA being the only last resort.
> + *
> + * Link downspeed status of auto-downspeed capable devices is available through
> + * ``pcie_gen4_downspeed_status`` debugfs entry with boolean output value of
> + * ``0`` or ``1``, with ``0`` meaning no downspeeding was required during link
> + * training (which is the optimal scenario) and ``1`` meaning the device has
> + * downsped to PCIe Gen4 due to unstable Gen5 link.
> + *
> + * .. code-block:: shell
> + *
> + *    $ cat /sys/kernel/debug/dri/<N>/pcie_gen4_downspeed_status
> + */
> +

I know that I was the one pushing for debugfs, but your code and doc are
so clean and it clearly shows the importance of having this information for
any admin. So, please, let's make this as is into sysfs under the device level
same place as vram_threshold...

> +static ssize_t pcie_gen4_downspeed_capable_show(struct file *f, char __user *ubuf,
> +						size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	char buf[16];
> +	u32 len, val;
> +
> +	xe_pm_runtime_get(xe);
> +	val = xe_mmio_read32(mmio, PCODE_SCRATCH(16));
> +	xe_pm_runtime_put(xe);
> +
> +	len = scnprintf(buf, sizeof(buf), "%u\n",
> +			REG_FIELD_GET(PCIE_GEN4_DOWNGRADE, val) == DOWNGRADE_CAPABLE ? 1 : 0);

I don't believe that this explicit conversion from bool to int is
needed here.
Also perhaps it is better to put this into a variable so we don't
go over the column limits.

> +
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
> +static const struct file_operations pcie_gen4_downspeed_capable_fops = {
> +	.owner = THIS_MODULE,
> +	.read = pcie_gen4_downspeed_capable_show,
> +};
> +
> +static ssize_t pcie_gen4_downspeed_status_show(struct file *f, char __user *ubuf,
> +					       size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> +	char buf[16];
> +	u32 len, val;
> +	int ret;
> +
> +	xe_pm_runtime_get(xe);
> +	ret = xe_pcode_read(root_tile, PCODE_MBOX(DGFX_PCODE_STATUS,
> +			    DGFX_GET_INIT_STATUS, 0), &val, NULL);
> +	xe_pm_runtime_put(xe);
> +	if (ret)
> +		return ret;
> +
> +	len = scnprintf(buf, sizeof(buf), "%u\n", REG_FIELD_GET(REG_BIT(31), val));

Please let's:
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -34,6 +34,7 @@
 #define   DGFX_PCODE_STATUS            0x7E
 #define     DGFX_GET_INIT_STATUS       0x0
 #define     DGFX_INIT_STATUS_COMPLETE  0x1
+#define     DGFX_PCIE_GEN4_DOWNGRADE   REG_BIT(31)

> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
> +static const struct file_operations pcie_gen4_downspeed_status_fops = {
> +	.owner = THIS_MODULE,
> +	.read = pcie_gen4_downspeed_status_show,
> +};
> +
>  void xe_debugfs_register(struct xe_device *xe)
>  {
>  	struct ttm_device *bdev = &xe->ttm;
> @@ -211,6 +297,13 @@ void xe_debugfs_register(struct xe_device *xe)
>  	debugfs_create_file("wedged_mode", 0600, root, xe,
>  			    &wedged_mode_fops);
>  
> +	if (IS_DGFX(xe)) {

Let's make it BMG only please.

> +		debugfs_create_file("pcie_gen4_downspeed_capable", 0400, root, xe,
> +				    &pcie_gen4_downspeed_capable_fops);
> +		debugfs_create_file("pcie_gen4_downspeed_status", 0400, root, xe,
> +				    &pcie_gen4_downspeed_status_fops);
> +	}
> +
>  	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
>  		man = ttm_manager_type(bdev, mem_type);
>  
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index e622ae17f08d..1f802d9793ad 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -66,6 +66,10 @@
>  /* Auxiliary info bits */
>  #define   AUXINFO_HISTORY_OFFSET	REG_GENMASK(31, 29)
>  
> +/* PCIe Gen4 downgrade capability bits */

I know that the spec simply define that as the scratch following that
survivability generic status, but for the survivability we only
use the first 16 scratches, this 17th with specific meaning on this
platform deserves a new definition, even when we don't have a good
spec to point at:

So, let's do it here:

> +#define   PCIE_GEN4_DOWNGRADE		REG_GENMASK(1, 0)
> +#define      DOWNGRADE_CAPABLE		2

#define BMG_PCIE_GEN5_CAP	XE_REG(0x138360)
#define   PCIE_GEN4_DOWNGRADE                REG_GENMASK(1, 0)
#define      DOWNGRADE_CAPABLE               2

or something like that...

> +
>  struct pcode_err_decode {
>  	int errno;
>  	const char *str;
> -- 
> 2.34.1
> 
