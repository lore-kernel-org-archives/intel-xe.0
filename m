Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BDDC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 15:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D73113D34;
	Thu, 18 Apr 2024 15:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AcBKwnxZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9841113D34
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 15:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713452577; x=1744988577;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=t0+Q2nr5w7DeteNj4qnKfNSTw164mCbGBsEdSiQS8hY=;
 b=AcBKwnxZPKkPVmD4mV85gQwwSwy0RQ8vRtSyMGAXT4eaE/pOOCG3sVTT
 63xwI8QsJv9bpUV7lFFX/6efgDtdF3zZM01kWPanzN0Qdm8RWl1d9V4gN
 bgOtmdUYPbPCos3rjt9HAQbAFMgHaw8+x6wY6dXr5UyDd4sqou3VMQTWS
 WOjzJsj+2ubx9pJ/A2KZ5Rwerh7WTZJc/Fpc7x+RrJmEDSD6HVclN1V0z
 AXaghKFcGsX4nhZgDZsjadlzO/qFMrkPUF3hyBSnOKNGcCh14Y14wWQr2
 sXq6cOwLokXvplRVomivCF+FWxDwpdbiOZQGfgE3K2gb/vQkG0JFYbglZ w==;
X-CSE-ConnectionGUID: 0aHCyCoUTluwdKLgLw3gMQ==
X-CSE-MsgGUID: 7bFxSMxLTdK8zYWpo887Cg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12788911"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="12788911"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 08:02:57 -0700
X-CSE-ConnectionGUID: Yh48z3s2RNmRRKQMn99D3w==
X-CSE-MsgGUID: unSynyxuQRiD2EMCP8LNmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="46300736"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 08:02:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 08:02:56 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 08:02:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 08:02:13 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 08:02:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRUJICvmXcGkErDLQfJ6EScmOX94h0S/pd4k+Y6TK5t5yyXQ60cUaDCeZOdpyxw1ksCyNEUNzPdA6bWSehTww44Ax8AvgFKrwxfR1mFyxa1AHhVrGR+3Fgx6cFN3uEGVQ51fEwBscPFnzJgo6v3a2S8SD7btDPjpnhHxfzLKIe4+Xa2yPg8BG4/BZRLqpcJ2Bnf7Zzazjj3kP2nkD0X+VCzxgHbrQ1Tq/6l+ReUFPPz1E09PSItysSH9EpyAzUDF+PFTg+njVt9gkQOX4coPKtHYrdeaf+MnwzhPjsJRrRKWdP72tRswiHwYrXIvuM1KRPHhjJb9oIIDf8PsEKDCGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCA27E7+xw55q3bZIZxzCzKq+GRiKwIwSfY/oih0gJg=;
 b=doRwUxN9XHg5p9c7eBHQGsogl04MpHMbHkQPKV7/zQy028nb3Bz/qADoZrBIUC9qaZIHQIwH3aTmJURIrQzJMcdzSywrR08cnJc1Hd8/EHuuRHlcTxJchJ5Nxuzcs0rhZG5KgZLXhz/ysbjgjr3xQR0ShIP4t75WiuqF5nDPXIOOnE/z1mC2WZUbuzR1TYEA3f1XcK1KJF8rFatwZXHSa+nVlZp6LZV6gxJWTYphWjh6LXubqm4AmhO9CYKZF2Ps9Tsk1AKZwVAYCMr0grcyag3+vX3noHFLTOKc2VYx7QCpHHlhdLlAvvmj9cRN058Nsub3DAuVQEqCRDudEyxgLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV3PR11MB8673.namprd11.prod.outlook.com (2603:10b6:408:21c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.12; Thu, 18 Apr
 2024 15:02:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 15:02:02 +0000
Date: Thu, 18 Apr 2024 10:02:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 6/7] drm/xe/tile: Abort driver load for sysfs creation
 failure
Message-ID: <c5iudzcd6ka6t6ey7rrlzhtquh7ficb2huykae7eq5l2rq36eo@oh7klk6v26ip>
References: <20240412181211.1155732-1-himal.prasad.ghimiray@intel.com>
 <20240412181211.1155732-7-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240412181211.1155732-7-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BYAPR11CA0078.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV3PR11MB8673:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dc97bb9-2ec2-4b0c-f6be-08dc5fb880f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: XvUfSbZfjSkBXs7YsblDqqYlmOFyMLfs9W/FxwtVTIUOApAl899pj7BR2+XY4cRudHTswa7KZvZzg0oV1uB273sFdxSwaKuCrDDgz5+5K7Q2V9t/9OILkhLC55GeG/MUljyb+scXO50OKJ0QS45keU0mHpeUOIT/YuNlCoHqPohK67HTmfM38C6fTYPZ8YCMNHzY5ygtnPI0sdvv1VQCXVVaD/lsNx2NzYB8tDAXwRBhMrFHgSUnbzgbagTkc1yYPeRRlgW5z7ffoWMjRyOXHehZp7v3ZKQjQ/ieS4mH2XB8v/v7pTjZ0N2ZLE0vPO+e3KPLXRR1prGm0h45LSE4t+TCBAuwVcRcuXxyvZEpJx5o1VcnjU5ge2NocRoWR0i9n1/KeSSOu5eP2A50bm+ki+PVEROKIYxxsyTGC2LjIPr40g2imNaDl4FJNR21/MpBPPgG4qZhecc5oVV0Vk+MPlDN8vghwt+u2ILcRt3F32K/kF8gGAkzK5KRNT+XEpNongLuBmbGGuQn+Nzp91Hxz00zp1jv5vSxY1n7k/k55X7HFBU7h5CD1yFSbu9n3CtTlLCG6Hc1e2d5BHZmj96W/sCXbQiwzUTNPtHtKNA5Yi70E1OZzjngJDTYHSHmv0xthOW8B4TtZpGp0UmQjJVcRzGj1ezbk46/ybu8b1kRFco=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uql67AzRXT7IfJinesViPJ+KNGfuFQCYvViwgBGonruyLnrr6KOnvYleP3CC?=
 =?us-ascii?Q?kFMJM3AwRaQ3jR3l6K2r/KACGIxYXlLhSixHdnJmdidrDHUNo8A2VIu704Ag?=
 =?us-ascii?Q?Tiuz7+Ak9NDyAOA0/oHU5lDmuLuntnBUQ/b8gWg/Mk6r/PSrIQ0lG0I7TgTK?=
 =?us-ascii?Q?hsuhv39nT3Qbx23U4EsPk1nsK+MV9rCpBPvjknWycqKUC9sUkn5Wm8+Rnllh?=
 =?us-ascii?Q?U99U9K14CerEINJ/HWQJl6Njo/miXbxx5sjmKsXXRsRgow+mjZmIlGe52IsS?=
 =?us-ascii?Q?gotrLCouRHg4A5UdSlHmsBt3SS94zorO/51Qgw3PXqqjXu7N6GgO+CBlnA0t?=
 =?us-ascii?Q?LF/igMUcJ5xkYFr29SR92jDKdO1BN7DEAukVt12laD66ra0M7E+ZtMRMkjvq?=
 =?us-ascii?Q?JSy2QWTzNhXENllK4GyntPezNLspT3VsAS0JR/wHZNhk8+cJtutGaOQnfhL7?=
 =?us-ascii?Q?7D/BIuaboAY8MHEN4GE/zo/CnAM19na2Hbq2cT64TmWCeNlspUcHpDLwMHWJ?=
 =?us-ascii?Q?UZAnTe+m1tDSHdUb1TgwfGU3V8fi00N5eJVar278riDnHAhCW5Mi2kWTqKmw?=
 =?us-ascii?Q?z5ISOtGA8ojGE5ulK2Yv+zIQKdzaBb02VGcU7aRAotBnprYRtuy1z1+F/+QM?=
 =?us-ascii?Q?t8P6g3Gnzmil26OGzl5mWD/UIN42On62NjT1Ql9l4IDOTrY1BUymJSweHy8z?=
 =?us-ascii?Q?kYOHaXE9HXmNmwwVDbpp05Sv3uy+ur/EdYtdpSYE8iI3YWbApjTxMtIChbLp?=
 =?us-ascii?Q?nBCBJZhc8vm6pohIndr3W1hqPtIhPZBQVUY/pnwcMUou+BwC4yrWXL74rFk+?=
 =?us-ascii?Q?wlaFdH9KEFt6K37n4GsmUGpNcTTsriIcU091h7I3sqmISeTB4T/34CJruEJx?=
 =?us-ascii?Q?OlEvHr/WSNV0BSYdyYoEB2GJAHvoH+rVjR8a+h4TTvVCqe+lxAnKr2wkTKbr?=
 =?us-ascii?Q?ymIxP9cuMSfR6wnTXX9p1wChQcibiguTeihJRZCUZGHgaI1eY8b339HA1sBI?=
 =?us-ascii?Q?Z1P6DCQyaZI5GsvbSfeza4e4bQhMGvy9oKtpCzhd1XLMlqRxH3qfWZF8utNc?=
 =?us-ascii?Q?APyqJ4eLOBVaOtaiLZvm1eXgRItZH/nvrBxbMa8zJrGjRzu2oHqA/sKOgBAl?=
 =?us-ascii?Q?HtybcU0l4tklINEvC7nO6d3w5pw6lWof7jaE7MRb4YXx98NmtuoyGpTyu52C?=
 =?us-ascii?Q?MB509HmWBYCfR78vKr2ayyuFFWOwJLzD9CAvUygyZG9TEoENktR4B0YKevt0?=
 =?us-ascii?Q?P/byfwt4WNWrxApaa7DNFfUAZFeq59bp0t4M1b/z3IhuW8WzlLb0GpyiZp89?=
 =?us-ascii?Q?pdNbYZ2+CDtds9FINrniG07NyBveip/3RMXUuijKjHUh+Fr0Ef/7+XATyOxx?=
 =?us-ascii?Q?mKhd0/5ccv+qkjCABrfrf/HAhKRkhsSjKAZr9/PtQf4jP/aj3QRt+09jLj3J?=
 =?us-ascii?Q?pVw6rYQx9wy998YW7l6U/Ikw47VEJqKTi9juSiXl6GCHASO1oAA52j0Oarhs?=
 =?us-ascii?Q?gnYFTfjiI7KQjqM1JOVOhN9CvG3wpwPrPn+hFI73hic4nJYD9w6t+HEaRHin?=
 =?us-ascii?Q?LEdcdrzSnMAVAqenvygy5dtxYKCY9m3nf34r6eoCpVtJLbv51yJydQWf8Cb0?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc97bb9-2ec2-4b0c-f6be-08dc5fb880f0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 15:02:02.3855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: epk+uDHZ8+l3MJiaUwCG5BdVPYRQdjrN8ziPG2ydyVl9D8+4l5zjekDT0yL8Q3texOdYCJipLsrotPc+8ybHbgN9Nf93viw5roS3pfTbcKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8673
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

On Fri, Apr 12, 2024 at 11:42:10PM GMT, Himal Prasad Ghimiray wrote:
>Ensure that the status of all tile associated sysfs entries creation is
>relayed to xe_tile_init_noalloc, leading to a driver load abort if any
>sysfs creation failures occur.
>
>-v2
>Avoid unnecessary warn/error messages. (Lucas)
>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>---
> drivers/gpu/drm/xe/xe_tile.c       |  2 +-
> drivers/gpu/drm/xe/xe_tile_sysfs.c | 16 +++++++---------
> drivers/gpu/drm/xe/xe_tile_sysfs.h |  2 +-
> drivers/gpu/drm/xe/xe_vram_freq.c  | 20 ++++++++------------
> drivers/gpu/drm/xe/xe_vram_freq.h  |  2 +-
> 5 files changed, 18 insertions(+), 24 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>index 0650b2fa75ef..409cf55aa8a1 100644
>--- a/drivers/gpu/drm/xe/xe_tile.c
>+++ b/drivers/gpu/drm/xe/xe_tile.c
>@@ -173,7 +173,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
> 	}
> 	xe_wa_apply_tile_workarounds(tile);
>
>-	xe_tile_sysfs_init(tile);
>+	err = xe_tile_sysfs_init(tile);
>
> err_mem_access:
> 	xe_device_mem_access_put(tile_to_xe(tile));
>diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>index 237a0761d3ad..e1bfe0e4257d 100644
>--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>@@ -29,7 +29,7 @@ static void tile_sysfs_fini(struct drm_device *drm, void *arg)
> 	kobject_put(tile->sysfs);
> }
>
>-void xe_tile_sysfs_init(struct xe_tile *tile)
>+int  xe_tile_sysfs_init(struct xe_tile *tile)

      ^ extra space here

if we don't need a new version for other reasons, no need to respin... I
can fixup this whitespace while applying.

thanks
Lucas De Marchi
