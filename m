Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1040CCD18E
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 19:43:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A97C10E236;
	Tue, 14 Oct 2025 19:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mnVe4K3O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C8B10E236
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 19:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760471023; x=1792007023;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9AxwTlI8hityz2EABVB2JLSJsYiCY/Nxeb6rUixhB1c=;
 b=mnVe4K3OEdSzaIMOuU5y3iGvoBkd8aVTlvmsH5LgZjacpZyov+AR4kVb
 GWElB0JOHnR990flJ4yYNaVzOJxXMP6qIuz/AQTb8mjEYNaIb+Ha349ZG
 IKj6I7jfG8imsNU6nSEjaxDDVEd0ebrz2/2w8igUFJL/Dwg/Mx93MNOm7
 /dQbBZTjl4/XVRvnt/8CW1TQgWe8m4f4u+Q81gpoarOrKMhemIrSG4ZI9
 lxjg7Md5Fq5wKith0VBxG8Tjuotu7FHZWDbZHSdWOc4/YnObb62XE0+EX
 eP08y2A9+mji9RSg4cF3eZj09hjwJK4JZ3v5oafJH6RyQFhxera9Yirwk A==;
X-CSE-ConnectionGUID: JqXzeVk0TXC/FGWR2PTbKA==
X-CSE-MsgGUID: KOqphjnFT6yU4nxv3H93eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="74087956"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="74087956"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 12:43:43 -0700
X-CSE-ConnectionGUID: CGRD4qMeQIuKimBWrCwaCg==
X-CSE-MsgGUID: nyU0JPcwSa6jIUeqrwpFPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="187064989"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 12:43:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 12:43:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 12:43:42 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 12:43:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XmfqmE+ZV/AHRSAvol82G4Zxaj+xT0AYw3hM/lWcxjAYbjJmfg4Vfpk8jC8Kpm/d4toxYfaClHtazk+0Nx43DZzETgLphmpGpPZlh+6EMrvQgu3kZAy7BFMprJ1RRpGXAjXQGUk2E49V+lyZib7V3jOs2PISZpQcLnvze2lzqA1M+NADEdiEjgT7WO0X/M4vt/r4fxFW1XKVlEnXwSocd0hdZ3K2PDvwp1Hr2aH94OGwP6Y6iIMTAXEpHmjszPoY30p8A8ko4VB+8aZbZPZWaaCGDyLodW+tUNWT1Of3QlzyA2sXrvlgI625t8Nt3X2pZ9cJ2C1s5kYsM0iLzfLKmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=he6xGYA5bJiUDV+CE734yE/dUhPHjjF+6gDZmpWvI/Q=;
 b=yeoCQGK9Q1zHaNYQ7GHmdSmevpvxY2KMc5Ki0is/4GzkTjS1PuvR7+ZBurUai3Ed2fDw1sas44dtb9kHTCA67FnCbE4BvyoltBZ3qg4kh+fxQz3J3inWpNSINjIpqE7CUqK0RclWZoIAFBQXUthJYQPPaB8tHvqEiXUvayrrPKBGB0gGKV/KGwbHQWBUpoukgd9Gq1+BSQzbpZjO4Wv1V74/C/yiJTDN3T3+ZxJniUFzPVaOCtqKp3yn5Nqg8x4CmnPFrCzh1Mg9UMrud3NVSCtXn0qZP0wS4NEbltCXUh5JCh9rb6Uo90pHRPWstqdFTA5x3XEqsYUu5a+haKfEBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7067.namprd11.prod.outlook.com (2603:10b6:806:29a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 19:43:40 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 19:43:40 +0000
Date: Tue, 14 Oct 2025 12:43:37 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH 11/23] drm/xe/xe3p: Enable L2 flush optimization feature
Message-ID: <20251014194337.GC5409@mdroper-desk1.amr.corp.intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-11-bfb74f038215@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251013-xe3p-v1-11-bfb74f038215@intel.com>
X-ClientProxiedBy: SJ2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a03:505::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7067:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b04b98e-96e4-4dee-ff93-08de0b59f96b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IyUAg10nIg59Sc7BR1+TEeFuW31q397pcDvnkq2IDeK/bfMJ/LdxzS+uJhev?=
 =?us-ascii?Q?8IdkSDaW7MQHthA+w/R66H4z1m7A0hrqccIDjJAUgRFxULXCHrkov0O5X2HW?=
 =?us-ascii?Q?Sr2UZiShAycY99Da4obcOiicf6J07tJSUew2RGFWBS1xiXFL7OG+bZeJNokX?=
 =?us-ascii?Q?P65lvPyYsj8zcl7cq22lSu8xTThoI+a6jYRIIcbeh5pRktNwIcyKixNXqgwL?=
 =?us-ascii?Q?tIHIUiPZfLLLqFLghBteSMKDUMlc6lyUA6VRC1vV+R+576IACTW324xNFACB?=
 =?us-ascii?Q?RCBrTJ1hA1qp0nn6nZREsk8d+xx8JrTIPsqQrmqiJXOAN6ECUjM2o6YN1Rvi?=
 =?us-ascii?Q?XwaGqLfB/lChKBbkQ+yQVH5S8T79F7WtwyiDC6fcCT0Dna7qSef132jdAnmi?=
 =?us-ascii?Q?lgb7R5KH9VT+c53CFcYrNRuuiOlK8keoDZhTilf5s/ddHu0il8k26XkPaiAD?=
 =?us-ascii?Q?74/9LZ0uHKOWMHCuc2hBP5UOwODjJzWubPfqM3EAnjSLEj/hPpCQn8oK46qD?=
 =?us-ascii?Q?f6w7TPfNdP5KfBwJ12Q12N0SUfcsG/wPDEW3ETLj4bs7kw5aWF3DEEP9d9kV?=
 =?us-ascii?Q?i08ZOy8jBNhooIqrET03qVaKBW8Tz0jwoA2zVZP+l0cjrVUZOcdW4ocWB7ox?=
 =?us-ascii?Q?scoRvIx00KCVM2MR7S671xunIDpTrkL3QpMxqLH6FUe+T7WOpm0RsfKfNWLF?=
 =?us-ascii?Q?fi34/q07LUX1PD0OLPgRybRjH65e7VWtMblTuJJUEJeUTPZi3vszlgeiJnnH?=
 =?us-ascii?Q?P7tPRS00bvS0tPNDf8fngADkstrQqTecZ85dIppXc0/sv0MDrG/K6tztmmWs?=
 =?us-ascii?Q?DLxNjl0pDh3JvgceWOWaOPelFNmDgQuUveTC0/R5tA5kLRy2GFlg5FJeloL1?=
 =?us-ascii?Q?9870WUHfYAgepLZMYRqdMmVbzPuEECFZHz8asL6jkz/edpEJvkqbEq2l7SBD?=
 =?us-ascii?Q?qfDBcKoL17kGVLx419AbNs1f3gijcaqCF600x8jRZpJ7s6O8ZoTNBmnIZ9kV?=
 =?us-ascii?Q?pbPSL7WEPOP8HqwevHsLMHygNBO/UyTnVigOqYKTIRyXX0MXEdlLIDtKCwXL?=
 =?us-ascii?Q?Ykrx7hpx1BvEQF6VmJc+YPIFJQrDUqJrT7YcBQXL6a8q2FR8NOIxIBORNvLo?=
 =?us-ascii?Q?lpcABjkKx+en/wpauYSFlnYvmhMTm0kRnJtYGujtXWCbbz8IDaHZCQMus9rk?=
 =?us-ascii?Q?BK4hWOwOMcnmXQb35x+KuIseo9V/5aXPtAAAiwUHiJIOl8bLc3kClXE+abbd?=
 =?us-ascii?Q?kC6nFXGt0cSCpmEjyvRmoFt7qePL9A2ZNY8SxTDUmRxgHX1jHhY+0k7VyIQW?=
 =?us-ascii?Q?dX3UMzw7cXyxw8d9qiWKIfVfdYkir3qd2CI/SF1/l3PpbX2FfDoPWHgWAHJA?=
 =?us-ascii?Q?XBow+TBdrhWpid8A3CPaAfUkFRe7tysmVPEq9oEaVq/sVahsTra8GSI2iPkm?=
 =?us-ascii?Q?l4qq/LOAIUZf5U6WhtGe2+33hpQKY+f/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?py57/STXvIbts56dB8cHDtkEBOwT07l2m2ueONMX2XSI0k1/+fKTlN8piIn4?=
 =?us-ascii?Q?qTmyUvZxJQf3UFW8WHxUZWaLpDDeEGSygb0i3nmGoLksC984rCg8NU7mTFUw?=
 =?us-ascii?Q?u+DTatwySQKwVhTRVfa1cbleyjJz0jQAZ7xb0l6+6cWQ3Nve301jjBT2Dq1q?=
 =?us-ascii?Q?cpuQABc0xwgHn9Enm24XQYw4THdJCYXwoVjzTTE1GuAZZcGZFP6JtztqL041?=
 =?us-ascii?Q?DwXd8xPClJGK016fZiC9GC+gOnq8AxrhPdskYk0K0Agp4RbGO2mB9YhF7h2v?=
 =?us-ascii?Q?FzxAECi5lCf8n/qgoy/DXbc5QFA+oONZWIr7GYl4kIqtPMhLST+tW0h4P1LM?=
 =?us-ascii?Q?lNuHKnnfrmyCQCuAgZDU8TclwKFNBvfDgNe7loc3NmeMRaagTZtifNjLup4o?=
 =?us-ascii?Q?bfnQVCAYN9rvk/h8zeTWNxBgdS86vTSWLCFKOLVD8jrz4KY8qfJUxtKVfeFU?=
 =?us-ascii?Q?RBJTeaRES1sFiHOtKTvaQ82+djQflV/vXWsWcBBd8UJYm8eoqtNNcSSGFGCL?=
 =?us-ascii?Q?6Fpy9EaBVkFL4C6d9oiJBqD0gjZn9j+JKtVdfjWUUYkmss3panLKvWskmG6m?=
 =?us-ascii?Q?NImYFVABmXZSMFTeqgEt6B7TGdLm5wLQtFUuKroBNI9YEnjVfgLY1kMSupex?=
 =?us-ascii?Q?BwOyM9+pxR6cKIdEktd72oRzf7UpMvvO0c7Ba1X3ts04FFT6MJ4FY2J3VSVy?=
 =?us-ascii?Q?uYPR9meE9aHds4b8iYkIaMElGu+C/b6hwUieotQe6EMfS+aqaBacxfpVY6lL?=
 =?us-ascii?Q?fO4X9GDgawMAsHGiSWFAdRQj7LTV/dMVUQqST72r1830nzUR2ws1XO3kPPLW?=
 =?us-ascii?Q?5K60Y73E9YPpKn2hwJ3tRx7SpZE0WzJ7AHxFdW0t/PbHsfu+Sk23BMxh/YnM?=
 =?us-ascii?Q?a4NW0gTkVNHFVngWRdRUyMuLrnuvfeFeKdGo70vy9C/RUikW47ktUPMAJITa?=
 =?us-ascii?Q?AQD2p4Y569CgCWYj0H23ztbgr6KbCLjmwA7mCpRIqS9agGPzRoWkP49fElKi?=
 =?us-ascii?Q?AsHQrsDkjEvsODnH5SIEPc3nSR4jNdc2GPT745USpAiFD0hR9rpLE6MA2khc?=
 =?us-ascii?Q?ZBBIcFTkrjDITBpJ33oe04lJGjZfvR/h06WyUtm6qM+dv0lMQL/zp6VCmmz6?=
 =?us-ascii?Q?UK4liAC4dxKaczn8beDK5ynVzOMfzlxVGEEDGDLiq++wFg4EIv/BtUw9TwVO?=
 =?us-ascii?Q?H4z3swvow4zNSbpiJQZmOVHpQKTD38LEE1DpffKZPQzrCCsu26BH1r/kNQAo?=
 =?us-ascii?Q?ChTRBw/y90t5oS3a/O3i9CM12HBrRqorWhvcChZJoncaBgMQLWv812N3u6m9?=
 =?us-ascii?Q?4U2ttmwlu6gI9NehAo+R09xA99VCUfX2gBjVf7tQ6vFf+bUIRBWjOd9i50xM?=
 =?us-ascii?Q?8HnbuW+uUNF7P7i0mdTabq1dL6dxeEyztPaN7oS17NWl4jGDJPB7lXMR4Xty?=
 =?us-ascii?Q?9JAzRG229NRQ7CvMR2HzUOB+0RAYxqkO7VMQ/QQVzSiKVKDVYHpInBZIBuJH?=
 =?us-ascii?Q?B6YMczdlA4q502UEDpeNPq6LvAbAaf/TEFdEXwPIbeUQv0OH4dVGt/P349ya?=
 =?us-ascii?Q?uswwCAqmS5EyoDYOpev8qxssAAJgBuz7TQr99Lupbsdg8M+hpQYsu07ImzHw?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b04b98e-96e4-4dee-ff93-08de0b59f96b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 19:43:39.9753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKJqFcQd3pJJI/0kPnSUyXlhZeiSDqU6Q4ll0qZznZzvXFkgCndaytp2vPbmJ0ZrgAUKgulGO4qV4IDIrc6W5u9yhgIg2+zGBZDdCid+d50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7067
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

On Mon, Oct 13, 2025 at 08:24:43PM -0700, Lucas De Marchi wrote:
> From: Tejas Upadhyay <tejas.upadhyay@intel.com>
> 
> When set, the L2 flush optimization feature will control whether L2 is
> in Persistent or Transient mode through monitoring of media activity.

Similar to the previous patch, this commit message doesn't really help
the reader understand what's going on.  I believe the intent here was to
inform the GuC that it should be doing some of the special handling for
app-transient caching according to whether media is active or not;
that's why we have an unusual condition that checks the primary GT's
version, but then applies the GuC flag on the media GT.

But as noted on the previous patch, we still don't have a way to mark
data as transient yet on Xe3p (of either the display- or app- variety),
so this change may be a bit premature; we should postpone this to a
later series.  And at that time we should probably start out with a
kerneldoc patch first that explains these new caching behaviors so that
readers have the necessary context before we start changing the code
behavior.


Matt

> 
> To enable L2 flush optimization include new feature flag
> GUC_CTL_ENABLE_L2FLUSH_OPT is used when media gt type is detected.
> 
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c      | 3 +++
>  drivers/gpu/drm/xe/xe_guc_fwif.h | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index ecc3e091b89e6..3296f28803593 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -94,6 +94,9 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>  	if (xe_guc_using_main_gamctrl_queues(guc))
>  		flags |= GUC_CTL_MAIN_GAMCTRL_QUEUES;
>  
> +	if (GRAPHICS_VER(xe) >= 35 && !IS_DGFX(xe) && xe_gt_is_media_type(guc_to_gt(guc)))
> +		flags |= GUC_CTL_ENABLE_L2FLUSH_OPT;
> +
>  	return flags;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index c90dd266e9cf9..c42572306158d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -115,6 +115,7 @@ struct guc_update_exec_queue_policy {
>  #define   GUC_CTL_ENABLE_PSMI_LOGGING	BIT(7)
>  #define   GUC_CTL_MAIN_GAMCTRL_QUEUES	BIT(9)
>  #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
> +#define   GUC_CTL_ENABLE_L2FLUSH_OPT	BIT(15)
>  
>  #define GUC_CTL_DEBUG			3
>  #define   GUC_LOG_VERBOSITY		REG_GENMASK(1, 0)
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
