Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B964CEDE9AC
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:12:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DBFF10E8D5;
	Tue, 10 Sep 2024 18:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mmcZaMJ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E0710E8D5
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725991930; x=1757527930;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=viRf5k29Mzxgg+XBNtsB1WMySGUKXUcCOH7zDqvcSfs=;
 b=mmcZaMJ8Zjb9E0cypw24hG+Y1z5R/A+YhrZi0RJunF0JHKcZf+WjqIVu
 Ug1wAaroGhCZaFH/rXeRjp84zxOii8sMxNAPCiP226zqe9SgkbcEyNMe/
 LTvTXV9CHi6o6lSd74XTg0pU0LTTD99811MuuoD4sIdOlWaKjGzaPVwUb
 vETa+QYQEYVBiWBZ923HOfoegBKhC1Lqf2uOR7NOTTRpBkt+ayTjzLJId
 1Z3lqfHYavAS3JmPZ6QEu7DW/nMgWE2G8+C/KMwjW/ogmWYhooxk8JZgI
 E5T3lt967U+liuEDem0RYjB5+ZlX7pcR3c3G/sgMIaOzTBGU7RQZUv5l4 g==;
X-CSE-ConnectionGUID: OSkz/LEiSIupL9u5TX3MEg==
X-CSE-MsgGUID: N0k2Hg1oT5ugsE6SYbodSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24577159"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="24577159"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:12:09 -0700
X-CSE-ConnectionGUID: BkJkdaGlR1Cam9kdwOcLig==
X-CSE-MsgGUID: nnF50lFeSz6FSQFu2uzxMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="66748970"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:12:08 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:12:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:12:08 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:12:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8v1T8iJTh2VA4WItOS/aLYXTmb5SkmAw/6mpfEqZ0atKwHO5GpyeRtznQavuTqlMawJ8IIS3oT2LqvHKVgpdMuPWHgy5jc/nT8xxzFJF0Ufh6FxyBUKTGn9lrMGvT9I/ev8QSDSIFEawtvw3LT7VrRntAB9ZjRgdEK1d8lJmaN9n4YmV2S/L456x69BJ66zWMOwzQdFfFj4ggyPluyTLXvxbFQtrFDjVlIPr9hy9+ZKTFF2RL2/0XRa9/Ztx08RSulDub3op2qGuEAjQTJRpGBP/3w2hJyNDE8OQ9dJTiqo3WNNwULmn5E1E7SzvO8dZ5FVqTrGNTarYih8SxJG0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVlRhVy2V/+cQiFNEWbMULCTHL19ImBY+ka/NxBNRyY=;
 b=SXIoHtO0BZfQH2FRzgpZrCMe7Z/yw+rjCDQq6t1lySAvfkfHhbCeo8XBb953I04jmtYuhVWc6jbz1aBfZRm57/sLH0nHTUh+ulpWCwFgzvgnUuCJE1n/dmZs3oggiZskOhHwvm5uRPjDjyc84veUa3yo2Pf8xaxTucuJfTRCw5qAjK1PfoRLe+fTfWakWzcjFvkv41bW4hC+xTYrICp/VSS9ojZj8spKoouDujDb206qIriHO152216ivsgf0GUb5k0PXWf3+VPgtE5wC8H03nuzIygGXT9GHooaSg08bU7qBuLJT5XnwecF88V3diuLX3WHcsdma0g6ExyFZLiwkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB5984.namprd11.prod.outlook.com (2603:10b6:510:1e3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 18:12:05 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:12:05 +0000
Date: Tue, 10 Sep 2024 14:12:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 30/43] drm/xe/wopcm: Convert register access to use
 xe_mmio
Message-ID: <ZuCL8hqBGSwgSch9@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-75-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-75-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW3PR06CA0001.namprd06.prod.outlook.com
 (2603:10b6:303:2a::6) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: f9ed24ac-dbb0-4ca1-d191-08dcd1c4137c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IOSTlyoClaLhNbjyP0g85qb0+GCbLviXX0Ng/pDCbnYpV9QYyjjVGa149LDH?=
 =?us-ascii?Q?g0qlbjcrBYbXq/6HHWewT8UnYOWS8pVZlqpUn5Usgc9nGl5MOq0EfD9aZj+9?=
 =?us-ascii?Q?T/HnOozC8h+4DxRrpIuQMCW5Ikf7jLB6MKGq+rkUAlsIPh6ctLoItIzG0Qr8?=
 =?us-ascii?Q?WqzzPVCpS8pvR6sCEIQXVRlGGnEDkK+qFF7o5EmtOl62IxJCE9Sc9FSFC1Ow?=
 =?us-ascii?Q?gVKtBs33V+1RMzAdvvQp6QFE3LteBpKflJ33fPaML8AosMCDdUp9T4aC1Eva?=
 =?us-ascii?Q?HnF1XmRxcFR2TBeIfN+jqUT1Tv/bbwbPgeE9qHrG3QoftRcumxsIbsmfX2kA?=
 =?us-ascii?Q?r0//cLt6dPPL5cAmKzyZtKTtMit3kv9iN5H9jAkGIMkmLSCk5mAZO6y8LF2V?=
 =?us-ascii?Q?FrJkJ/5VGIMgeArHnXFl3JVwWuL7b/Zxj5vS2IOriTs/ZtppDCA+U4vedfpt?=
 =?us-ascii?Q?F9Fpqkr8w0kJehxaMoTROMvbEcCxiNu+OmUwuuJQSV5BrDbGQBS9oTOhSYIQ?=
 =?us-ascii?Q?T4hwLz37yBIqMmhxsKqpOOYjPPOqexn1HJeHDsr3kaAVlDdONc1xVBngUe+b?=
 =?us-ascii?Q?UnZcWFW1Bu8YkEppOZNafK0sMEh8UUYlMiNaQrOo2NeAah8ZL/4ytZRnCLdS?=
 =?us-ascii?Q?OMKPwcb7hR01ld1cmUdcP/WiEo5/Lsjqt3X6DxrQeGZX2U2YXbNmbqzNMngc?=
 =?us-ascii?Q?xiqdyo3bR6vBCeZJSqMBbBxpjZ0a8VJmrcybTSCrIAnOm2aIW9tGLNHbs6NB?=
 =?us-ascii?Q?s6ln/BkArP7T/X34w83cmPCXR4acLP+RoFD0CTQ2E81iYFtC2nPDiT7ZlxgJ?=
 =?us-ascii?Q?xX1ak89GAydz0pRyJFPtz2u/QZJcHv7Dk1WPIHc8qKvPKdWZm+31ju5IDvA6?=
 =?us-ascii?Q?k86oRuL9A8+BQTaLxaANQKbZaRrdXqBb41wDMPk/SqrGm+DulkRGO5gnAGUk?=
 =?us-ascii?Q?Eb9iUUXvLFMlH0dxypG7cs5OnegmNGGjvzDUZxonwStd6/vZfwxFqsN89HhI?=
 =?us-ascii?Q?5teR5pWZqjBcS++9ft4cIqhHhFS/ifz1YEdT0agGuaeztIRA4uORAF03H30E?=
 =?us-ascii?Q?Gs4zHml9QNL+seA7LeZ3aHdlBg5Y79bglCzA5CBLGd9Ke/29hUGu63IRbVn5?=
 =?us-ascii?Q?fVuvZQKiPLaWDbPCllIsan5DvUTsxw80BfHVT+l9kEhOd6w3HCnWiYdxs+Rs?=
 =?us-ascii?Q?cA3H7l2wX2W3+h9O/2/OiHk9r2cVse1+ld/aHZLAYMEkQHbvlewRe5NkdFPW?=
 =?us-ascii?Q?v/oKCctA5b6KNTX7Q9AvbaZrboqcrA/pjLM5X1MLbleeLKIIZDnrcSKIIYIv?=
 =?us-ascii?Q?d5xdknuMvn2dIUmXNe3KbiCPJbZVg/W9wp8ktz6vO1CSzg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hkh7iOnCLcFVu027hdEt1LCEj3l4VHxapPE8rfR60zRSJPNBoMqyTp7frcy3?=
 =?us-ascii?Q?pfz6+JKyKoi+AlwXcrua2vPlHxed05MfWAN+4gZsrkdAXZqYzjN3nyWC1yRc?=
 =?us-ascii?Q?LNN4q5IRF9U0IjDvh++N6DLqCPwPT09XU1Ep+FGrum/629xI3NcSALGqImni?=
 =?us-ascii?Q?QlwwbUpqaaIJ7XUGQE2BhJT8z4c93xX9n4TdI3rHY4i1HHm/c1EPqNXll1TI?=
 =?us-ascii?Q?Icj8cQ8pltcC8ECdBd/QubYcEwO7XRSauv8N1eRuUmyoCpnVsB9Sl06XX3KN?=
 =?us-ascii?Q?skxTiGGD4pRWgnoZHtGcsMM8l0p7DrKjyiXMh3EejlZLWaReKunLpGxUzufi?=
 =?us-ascii?Q?DRqHMs0/AsDzmXpN+Y0rv3GswoVtzhSUeEefqhIbOq+7g7s/s+Ksx0w/Olkl?=
 =?us-ascii?Q?nfyr2WX24Z8Wi3/z7GOmakiu+8+tZabipVNMlmc0yI2TFBxjNdK1aI/b1n/3?=
 =?us-ascii?Q?zDC1F9v5xOeChRJZ5q0kjQVF2H08tOV5Egu+bjVgViiO6g6OBk05nukriKDz?=
 =?us-ascii?Q?oEE70rbEZFniUETpahvqyjft9UlmUVTAu+RFjFi60Y9GC4BI28wKiS8mJ9ac?=
 =?us-ascii?Q?9rdD05p5MbFn7ifiJPUd71VU8wHDnsOh4BTWBLlWtjJVJCwwDfu0TqzH7qZm?=
 =?us-ascii?Q?EcQiFcZPo/Uyd4BrI5ZiIXwz+n2J9HJrXwq1teyEeRGTeKTtiPv7PaLHyG5h?=
 =?us-ascii?Q?Jq8foRYVgi5EghSjoMWbFk85tTnN21grFzKk0py5jp29A2CV7s7aEiugvSh/?=
 =?us-ascii?Q?6b8KwHoIQjv/LLPuiZrM4GOL+hzDlxb8LYfGbdnPna76OINMEXRNaWutQVui?=
 =?us-ascii?Q?zszm4Vlb/pClcc9NXrkxTRMNLSvXi8/dwVGJa/9rsg67X/w/ddlJ2dU+hmdi?=
 =?us-ascii?Q?ZaepCw0sQRQJEx5dxwjhfXqC5EbyxMPU56OEd8uACmW8ZJWKEdWHUZqtAFCe?=
 =?us-ascii?Q?OiBUYe7J6+9YzbRzHcZHWawatIEXjwUPJbl+iNAI2oNIGRi75L/BQEgpu2xi?=
 =?us-ascii?Q?HrXUhUpq49eCqoiO8/EMK/sk+f9Ppy5SMQbuv4mxehmWYJmnIiBpHTGdf3+6?=
 =?us-ascii?Q?O1cVE4aVRx1OeXUlh6PmYltrxgf35zxJwKKa797W3zg/dVCMh9qrck3SC+fu?=
 =?us-ascii?Q?haYmB94EkF8iIqaZB4hZAL0mLi3LaE+7KLEzP4B0pwrcoAczTNgE5EIdi3bp?=
 =?us-ascii?Q?t4QMbsOnYI2USywUgroWinyPZE/w6DqaPFXl80KC5NVfvTv3wP+4K2KP86No?=
 =?us-ascii?Q?p3mtoO1TwxG1rYye38Nb4KcQaZiXbW3wWyKIXcrZiJZkGQcYRXMjIgsz8UHe?=
 =?us-ascii?Q?Rk3tmvW+YdWja/NJo+udQscjGYVFuNKBUfuXRK60JT0VdLD9We7FRe/qvthg?=
 =?us-ascii?Q?tUMYOTQ9DjF5ro4ALmV1w+YsSocIhuu7Qm9Js+JkpwCUQN1z4QpN16Bt5WFs?=
 =?us-ascii?Q?Jnz8YYUsd829y3VM5uTH3EIW3mrPFoNO4X+XKo6PvYRwCIlH8B//5q/CWmqm?=
 =?us-ascii?Q?8pGWCuODCxEqKRdB8cMhExPS+LfKHUOhyUoxG483HLvFV8h6wyJYKg3ADG7C?=
 =?us-ascii?Q?W47TkCk5bxVkEk36eVE3/Mf4uxz6h3Ve9L+z/Lwckz0hNazMyxA70fgcNY24?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ed24ac-dbb0-4ca1-d191-08dcd1c4137c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:12:05.2512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qyOk0yp/JacfGlbOok/GxlhVRkxJQzKLdPGJXpvvUUFxPfZWgZ+YWml9c/nlap1pcGxkJBrPnLtLZJ7gA0dcSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5984
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

On Fri, Sep 06, 2024 at 05:08:19PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wopcm.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> index d3a99157e523..93c82825d896 100644
> --- a/drivers/gpu/drm/xe/xe_wopcm.c
> +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> @@ -123,8 +123,8 @@ static bool __check_layout(struct xe_device *xe, u32 wopcm_size,
>  static bool __wopcm_regs_locked(struct xe_gt *gt,
>  				u32 *guc_wopcm_base, u32 *guc_wopcm_size)
>  {
> -	u32 reg_base = xe_mmio_read32(gt, DMA_GUC_WOPCM_OFFSET);
> -	u32 reg_size = xe_mmio_read32(gt, GUC_WOPCM_SIZE);
> +	u32 reg_base = xe_mmio_read32(&gt->mmio, DMA_GUC_WOPCM_OFFSET);
> +	u32 reg_size = xe_mmio_read32(&gt->mmio, GUC_WOPCM_SIZE);
>  
>  	if (!(reg_size & GUC_WOPCM_SIZE_LOCKED) ||
>  	    !(reg_base & GUC_WOPCM_OFFSET_VALID))
> @@ -150,13 +150,13 @@ static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
>  	XE_WARN_ON(size & ~GUC_WOPCM_SIZE_MASK);
>  
>  	mask = GUC_WOPCM_SIZE_MASK | GUC_WOPCM_SIZE_LOCKED;
> -	err = xe_mmio_write32_and_verify(gt, GUC_WOPCM_SIZE, size, mask,
> +	err = xe_mmio_write32_and_verify(&gt->mmio, GUC_WOPCM_SIZE, size, mask,
>  					 size | GUC_WOPCM_SIZE_LOCKED);
>  	if (err)
>  		goto err_out;
>  
>  	mask = GUC_WOPCM_OFFSET_MASK | GUC_WOPCM_OFFSET_VALID | huc_agent;
> -	err = xe_mmio_write32_and_verify(gt, DMA_GUC_WOPCM_OFFSET,
> +	err = xe_mmio_write32_and_verify(&gt->mmio, DMA_GUC_WOPCM_OFFSET,
>  					 base | huc_agent, mask,
>  					 base | huc_agent |
>  					 GUC_WOPCM_OFFSET_VALID);
> @@ -169,10 +169,10 @@ static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
>  	drm_notice(&xe->drm, "Failed to init uC WOPCM registers!\n");
>  	drm_notice(&xe->drm, "%s(%#x)=%#x\n", "DMA_GUC_WOPCM_OFFSET",
>  		   DMA_GUC_WOPCM_OFFSET.addr,
> -		   xe_mmio_read32(gt, DMA_GUC_WOPCM_OFFSET));
> +		   xe_mmio_read32(&gt->mmio, DMA_GUC_WOPCM_OFFSET));
>  	drm_notice(&xe->drm, "%s(%#x)=%#x\n", "GUC_WOPCM_SIZE",
>  		   GUC_WOPCM_SIZE.addr,
> -		   xe_mmio_read32(gt, GUC_WOPCM_SIZE));
> +		   xe_mmio_read32(&gt->mmio, GUC_WOPCM_SIZE));
>  
>  	return err;
>  }
> -- 
> 2.45.2
> 
