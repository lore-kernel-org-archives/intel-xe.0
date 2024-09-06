Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4E2E6FE4B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 23:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA6D10E962;
	Fri,  6 Sep 2024 23:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PH731zvR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A0210E962
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 23:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725664683; x=1757200683;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e0Cq0CkqAKYzMLf9/P2L8DCT3EdUVk/bCPUxeKI1pro=;
 b=PH731zvRrYV54CsT7imZ0pvgS+RDoXW2aTk09ZM5uHhfTrXXxxFunGbH
 0nfaVK858+jCWxdroWuoQbDVfJ0Auf8k5Z/kGOqOq6hhT6hvfwyQ8uDpb
 Ar2e+DP21CzHlfixHdFFKgUpnST1nBp1Nv1JsQx7CqDbNjgd4n+USYDQf
 1G5o3reM3CI8wC+XOaiK4vgmf4MwDz8Zw+OKt2TJd1r5Ty83w9p8zBTmB
 LPfclPeU4eTzf7SncIcGjnsD686aQRDHmDFUobg+s/bvVVwON8MAm573A
 glroDjTr3SGcZtNI/DqPLND5nMZJ/LxaG4fAcIFkI4UHnp14YZSFmo/FJ g==;
X-CSE-ConnectionGUID: Vml+B3OyTDm9uYWw1zkbYQ==
X-CSE-MsgGUID: Zyknz6p6StebzhsbJunngg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="35581894"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="35581894"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 16:18:03 -0700
X-CSE-ConnectionGUID: cykqKFiQRQiaTSkfO01Jog==
X-CSE-MsgGUID: Uv8qGGvcRwingjkg7fj52g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="96806135"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 16:18:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 16:18:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 16:18:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 16:18:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qm7MAhUJehDpnilKD8vz3h9fYdoXEeaLJLUkrYvMdY1laxqSyvM1abpOVMKlzawGdq+7HleaY3Nl5jOnueKvw++eBfhvCyY/FHJFpHHS3zHup5NBqz7i/S0BegXc79VL1V36L4mQ6Sho0TdW1bnNg0ahMhL6SeYCAVaUkxn3ZsYa5IYBGl0A/tZhoLsGKwG1Dkc/KtlckXCIDUx2sQrJJricGgjCkTjrTz/pIC5V6VuUQGno88hy/9mQPQYizacQsOnGouh+mzKUPII5wNbQ0LTyQjhRpbX+Kbi1ijH4J9dSoUvrGmHHoJ/arsg2x1vffc6yGU1SC7Htc60iJngT7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUYA94zWPutiD3QMx0mX9xCg+f14D20r/2D+tV4mcMc=;
 b=EaSc1LSxgMjWatZi6g2PpMlgsG8s862Kmb+V8JrP+w+0wuaJqGnCdHIOkJ89olAUVhm0KLuTbTOEEDHMurZ7F2Mlps5Za3s8o7SpzzRVJXZkhMx1YfG7dffhDBUfIVXk6M+6aCUx8ZeBQ88AuVYi0XOceTbfQv6fZdL0IYejF0hBImrMziPdcVTaw63YrUBXiSzZGsCsuYMZFBj+c8zMXVTGyiGbaBqgOuIpsrcAWM8ZMrPEFkcaG8P59uRTe880OUXn4F2IjHX9ShCGRMAozUuaYA7Sv6r/aBCvBeC9SQwWpwG6LrgG/ihYdEoz3FwOhPOdh6tWAl2hs8TTDJrO0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4906.namprd11.prod.outlook.com (2603:10b6:806:fa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 23:17:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 23:17:59 +0000
Date: Fri, 6 Sep 2024 18:17:58 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 16/43] drm/xe/stolen: Convert register access to use
 xe_mmio
Message-ID: <6qjd7z7dhy4haf5jho5vozywfi6aqorwxp4bmccoqnxrm25poe@lwvrgaji36gi>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
 <20240904002100.2023834-61-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240904002100.2023834-61-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4P223CA0021.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4906:EE_
X-MS-Office365-Filtering-Correlation-Id: 999c0edd-0b3e-4ac2-4a86-08dcceca25cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?258roqTRFziW3YMi7wezbQb4iXuFBw5CTSzsVstokK3YiBO1xzJaP41YBEor?=
 =?us-ascii?Q?A08F1foAUdbLftqhDu5HgcYQ4qwlR9GoQBbk++lk3P7XyDw3d3CDm0TgKwqN?=
 =?us-ascii?Q?mno3O9T3CQdyPF300vRBtlF/eVZ1PuIFw+GXEdLfmLSbGTmqcAu/84Stw/4I?=
 =?us-ascii?Q?EkbOGCBOduQnl4BtTp/YRX2Z7E5/mFrm8lBUVWr2rf6fmsHJ/JemtZJz2QMU?=
 =?us-ascii?Q?I9fhgtrvBAKONIy2toOkuwJPw/oStD3psEiMWrgm9sF5G7rC7Gh7XEGsjrvc?=
 =?us-ascii?Q?gRMY0EZWt4vKCGC9XCM0H0DZpye84B4r8MDjZfAOSW1qydw+Oq5RTzubWjXg?=
 =?us-ascii?Q?V1xA/jDIfb37ERlYfjN/9IlYHVcoCQB+Lu0IGN5TUtrMQ1ZtsfxpUugOrqh0?=
 =?us-ascii?Q?D+QdaX8hT3FPFqHiBThf3tzmSTj4hnZn4Z/z8ou0OMNG1iAKyXTdLW28N0Xk?=
 =?us-ascii?Q?FeONOUnve1dWridWlggzWKN9X9q04AX4I4KC1K1I/UUgbg1uWmBcABWMDNsZ?=
 =?us-ascii?Q?Y3u6IBceUHbUP7ZuwWA94lH0PVhgay+frtuyZXWW1SoTqXMXmKQJp28/+QQE?=
 =?us-ascii?Q?26k/8Lh0MkAgt9Yr+FUY21UkYoso5HX/9BwDW5KEZdK0hELumTZaD3px/eCw?=
 =?us-ascii?Q?xMWSa9g57yf/bb7Vly73yVPB0V5mf0Ih+JyZaIizzZCqpWWLQTUI+bp4xlXQ?=
 =?us-ascii?Q?w3Q7KGNUiTYXmglEPrONON0KD3buLHgaqsFHg/g+c6WDhxKPI3hJ30Fo87C8?=
 =?us-ascii?Q?+ezNT46Std3+Sx27WDY45MT5ZLYcKuRIMKYtgTJFpWscMphcJNqlbY3mEyGI?=
 =?us-ascii?Q?bWHWQBKTER9sMvBehQu7XYtfXGX9sZiidq3QDBmlDqoKpzEXbcawvb/WJKhk?=
 =?us-ascii?Q?nOEx17mMK0oXKetqITxHgLPgGbbBY4Nxv1PqN5MMVaPQJS4hGGlwM2+st+zJ?=
 =?us-ascii?Q?3P22sa3YJs6YxoCGFN+HIhOz+PAwdYWuQraaSCKNZ3h53WpT3l9mekO56Zni?=
 =?us-ascii?Q?JzF70FOWnFxk894Tl26+6gdDBGin8fyt9gVEhVmWZtCWQBad+/fpHHxu32yi?=
 =?us-ascii?Q?yiVfXO0JQ/jQr+fOTNHzXXna3RsTM/QK1YwWsN3hClFd6HlVn3mn7GHnV0oh?=
 =?us-ascii?Q?dr/TcnLZXJ6YHbefEVqbh1ebbbziyn3HBOFAWSM/xSHRZr9onlDJFXNnRPw/?=
 =?us-ascii?Q?8vR1Tyvd+fJC63zjw8aI5+UnF1fP4g4EomDLMJYiY1hVYnkvdKutPZRmri1Y?=
 =?us-ascii?Q?mjB/Br+g5R1xz0SA150G7O0QNwtBr42t59K7jcKjgS7HpmqKAQUliBYQdjeN?=
 =?us-ascii?Q?cLejp9uW0CI5loJiKwJAUaxUwJxMu5h4SrL1GSu3PQpO2A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aAkiGBNc1ugqwbvX+W0bUGOCKmBFZo4dW5LYGAG/+C3Ni6ZnkD+G8z05NiDH?=
 =?us-ascii?Q?SfYlTlFnXz8MN10/Nd7lWLt15K/DhMFoiFItz/gYbYm5GETqqr6v1IsDV2Ju?=
 =?us-ascii?Q?w0q5lXzBqaWXFUUg0hDAyb45FTn6aigv20KEq3HvwL7xcYKnxlPY3iUc5j4d?=
 =?us-ascii?Q?wjBpRfK+vPeJhewKfze5T8Km7fTzHLLZkxadNU6AByCaTd9eoGSq4/gxp/T+?=
 =?us-ascii?Q?yzXq7TdyrQsnXLj/eAZcrC3ojwnEOHnHbAiiGNvkxix8JNPsQC5e2Qr49YuN?=
 =?us-ascii?Q?HarRbUjUSAlLkWxbY7eIU8pBdEZo7b0pSYOYcTY5TdO3Ms4uiEfCN/qaswHS?=
 =?us-ascii?Q?LfdVCxynBDvUS+++qiQNwq0afFAtFdHfQgIEBSMivZ2qveHNKmn2M/gTxZyF?=
 =?us-ascii?Q?+uYDTyJo3dloJXepbLD6MS4OcIa6vAk5qvBSfbfzalAovX4hzwznMLSPIV3t?=
 =?us-ascii?Q?PmdwHn7w1GHvrGMqVK+eMFfz6wERVte4Ls9s4eACHJpqgvexKeUUae+PuSYd?=
 =?us-ascii?Q?LbG1tz8OW36rH0r1ibOlCQbsbgMBvKHQTi+IBWjLZFEpn2wquUHtGyUaHIJ0?=
 =?us-ascii?Q?bV4WhC8YJJRb4PL/ejToRWugAXZ39kZkd5CwxalqvwqIzaAYPwBRKHJBbVzy?=
 =?us-ascii?Q?HxYh3a7he/ksz65jxtcSlavzl6Z4GkUhriRJLuXjCwjbg21WBB4shVleCMH2?=
 =?us-ascii?Q?DvPqNkmPVKFDKnTuJvS3bt9ldU7Pq3bDnojCPX5JtBKO5gdzFulmym7B1SfX?=
 =?us-ascii?Q?zbSCJ+ktqZRAiCMY0anYQxkf6bBbK3N8icVxKzlXiA6a3Oo0Geqc0HwsGH+9?=
 =?us-ascii?Q?5sHIaY9NZ5H5ibPCW+z0NuIvKbSvsAKZyjqOFCmBOuPH7HJJ3TIwq+V1AioB?=
 =?us-ascii?Q?KCIzhAMxno+9sxZK79RC8XjhnRC02HNFQ/71sl8njhDzb/46FUXnlcSTvBHb?=
 =?us-ascii?Q?WD5grEymhhkInuq88Ot/GqLBpnOyOHq0TT+F5Wm8gd5Z59M7myGoyfrsRP3z?=
 =?us-ascii?Q?HMItfXi9oDNMbIu67+pKe8wAabmHPjS+lzwxguSXUpSnzSDohREaNHgPLgRV?=
 =?us-ascii?Q?kNX2s00wEGFuZGEmsgOhzPjDKOZrtj5RZappdiqoI7BCQIYcwtWo5yduZKcR?=
 =?us-ascii?Q?cVhUxY/P0EvDnCzUlYngozyLb3spK6tUFrhnn9mvKTgaCqo/sqxb4wriON8g?=
 =?us-ascii?Q?L6cK57c6RQNdyzHP+ioS0S5rwlHdMPdTwklhg2lp0BNCQwFDeTfhpQF5OJLN?=
 =?us-ascii?Q?QD9l6xkGYQgz7IlnF1Aco3XWv35FsBQr1vu4rLp/RvoklVGWw5zya1FCEqLK?=
 =?us-ascii?Q?m+3YSJl997I2zQ7ivC+/fxH4HeBFyDZXMZDd8w197U6N9kkLIJMycdlKlQI0?=
 =?us-ascii?Q?qUHGf4PEqTS3qkOePiFvp9f1fQSLl0Hb51JH6eYh2DcEP5+8o/fB+xswyMfb?=
 =?us-ascii?Q?E8YORVoreCB4JEwOSvc8Sid0DzsdAvlGN+V4CNqZi5rM9p6BA1zGfXh2FogN?=
 =?us-ascii?Q?cG3J6Erd2lOqpmjunt9IZw0CSqn5yquFFyNdcNjeSScrAoUi26ykwfPxvrn3?=
 =?us-ascii?Q?Ia7zLwbgEw7ct3MwjJoxLhK6JyTcW+pN40sNWBD2gvIEkrrOhMiVxc1yy7dy?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 999c0edd-0b3e-4ac2-4a86-08dcceca25cd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 23:17:59.4489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wcyEXmGz4+ShUWiYDzdQZgXDyB2jYRykKyxvcH4oeqRNGkG9uLgRRUCZ7DaTqEf8tqW0A8lPihLZLH/MbHf/VihtEULhAFG6CCYt6sznxiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4906
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

On Tue, Sep 03, 2024 at 05:21:17PM GMT, Matt Roper wrote:
>Stop using GT pointers for register access.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>index f7113cf6109d..423856cc18d4 100644
>--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>@@ -60,7 +60,7 @@ bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe)
> static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
> {
> 	struct xe_tile *tile = xe_device_get_root_tile(xe);
>-	struct xe_gt *mmio = xe_root_mmio_gt(xe);
>+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> 	u64 stolen_size;
> 	u64 tile_offset;
>@@ -94,7 +94,7 @@ static u32 get_wopcm_size(struct xe_device *xe)
> 	u32 wopcm_size;
> 	u64 val;
>
>-	val = xe_mmio_read64_2x32(xe_root_mmio_gt(xe), STOLEN_RESERVED);
>+	val = xe_mmio_read64_2x32(xe_root_tile_mmio(xe), STOLEN_RESERVED);
> 	val = REG_FIELD_GET64(WOPCM_SIZE_MASK, val);
>
> 	switch (val) {
>@@ -119,7 +119,7 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
> 	u32 stolen_size, wopcm_size;
> 	u32 ggc, gms;
>
>-	ggc = xe_mmio_read32(xe_root_mmio_gt(xe), GGC);
>+	ggc = xe_mmio_read32(xe_root_tile_mmio(xe), GGC);
>
> 	/*
> 	 * Check GGMS: it should be fixed 0x3 (8MB), which corresponds to the
>@@ -159,7 +159,7 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
> 	stolen_size -= wopcm_size;
>
> 	if (media_gt && XE_WA(media_gt, 14019821291)) {
>-		u64 gscpsmi_base = xe_mmio_read64_2x32(media_gt, GSCPSMI_BASE)
>+		u64 gscpsmi_base = xe_mmio_read64_2x32(&media_gt->mmio, GSCPSMI_BASE)
> 			& ~GENMASK_ULL(5, 0);
>
> 		/*
>-- 
>2.45.2
>
