Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4223FCA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 15:17:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DC510E948;
	Wed, 10 Sep 2025 15:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oEbapjbu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E200010E948
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 15:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757517433; x=1789053433;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uaOTDBh7bYKMLnbh1wfwMjgoAg2Fd1UKZy8EZ4jswfY=;
 b=oEbapjbuuDrUYlGA/KdUq4MaRWV7svq7AOW05wu6Wse9itE36loEMLmg
 TylJDTilBi0tS8RVmed741V3JLqEpnew+ZKzKp1UmwEuEP7E/wNRFIL+f
 X8oxpqL6qBgV14LV51nciWxsZD0owrdzp53HZVtimxotgB0K5FSthohL3
 EZjzE+hIFZsAWnvyehomnNaGjBfmwpPkew5+Jud1zrsB/NqC3mUl+S/yh
 gsa+rGvEW3nyAf1AARIUMHyiodIonIumXmo2ItzUgWd83sVQ+BDq53iC1
 nC9QykVkuE+JfOerA6342UsoXvOsXZwIYaLALs+a/4wWPuBes5S+FqGYZ A==;
X-CSE-ConnectionGUID: OIS2dMlcSOmhSE/Rfx30ag==
X-CSE-MsgGUID: yhxpPDgoSWGe/hZdI2mOFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59907534"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="59907534"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 08:17:12 -0700
X-CSE-ConnectionGUID: 18E6IK5VSV+PzM2ohEPi8g==
X-CSE-MsgGUID: XVBxJl89TbmSc8h9ZElY5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="173271772"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 08:17:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 08:17:11 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 08:17:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.61)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 08:17:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8afgjLBbNWPVorvmaSlYn7+R1GOvYbY5x3Av3jmzBbvjn1kJfkXAU3kzcdmrQkpPU8qE0PXy+avGGdGp2cyrF7nU/BtK2dcJCxAErCxEppGEZZ/n8zL5Tfglr0kUcln72GPyoxYM1E4uR+O+kpHkpphOIU78PjmRPl8dCoYfajWNbjkZddNfKsZkqC+FrtPFExz8chB+YElRGRM2Z1Wo37se4yEsCYJ2kvfZ1HQS00XSRsm48DF2X2scFHsGyN8KQiSeGL/WX+aO68iqWlNMJkfGZjw+IyRKd/IYPd5BYSyzVQ8Sz/7u8sxg1BZx+XJZNNm1Y3z6AAHah4tdI2v1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ClzadALFAkEYiPpI/TFyq5xDDCu9bJd/obI1dAQLPnA=;
 b=WenLOCHLwTVyR/zSlDqUDHQPtoBF+MKBsHAqfrgHAdy9O1UC/aV5CgVRDvyZSfTZU5rbNerPhg/2/xCBJlFr82WSTuU/O9TR5860kMjWqcVvkOwRB+yHWdpGe2iw0rYxTQapXhMFZNaW6N/NnFSTe371+jIg8HTgCKTvrwiBL1HiiG43I7FIpBDi6BBX61WrVTmKXzhPEE7ACpmPfGNkygHh4eTXb4kt1BWPlBPronqk49o+xPC8PWnFD5nT3HJY4jn/IxGeeQ7zvYf32Muoiv5tchOeA7sCDAGVAVJpvRcFw+t1aEOnp5i3eag/Yk4SqDdDRmZbV0/EHLUdlF8C3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7964.namprd11.prod.outlook.com (2603:10b6:510:247::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 15:17:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 15:17:07 +0000
Date: Wed, 10 Sep 2025 10:17:04 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <mallesh.koujalagi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>
Subject: Re: [v3] drm/xe/hwmon: Remove type casting.
Message-ID: <k7jtr3bayzdyoiano6uenl2wlyadvcpwckk6slxcatfo34voro@smkkebm6caeo>
References: <20250910025346.2598839-1-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250910025346.2598839-1-mallesh.koujalagi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0254.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: bc1712d5-7bc2-4983-58c9-08ddf07d1b10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b6KHyRM14fGoopdJxB/t4mQ7UXNb8q3IW1HspdQwp9wUlI7Fd/+37eJrXWlB?=
 =?us-ascii?Q?ljAGHo9tpmwquABymIIYbeAzubqOgjB135Uo498z4GdO84nnr4r6BfbKsQBx?=
 =?us-ascii?Q?6L5a4j9xgngvqXyAbwwc+KZCNHlYcwQQ/ekLOt65odKIkv8h88UdHTDVfr32?=
 =?us-ascii?Q?yZQMyi9Und0u4bbU6vbG7MlzC7OCxLV4k4wuIZimWzyUQ4tY1pxTurOxsb4X?=
 =?us-ascii?Q?GuJruj6ycKR1zyyxN8sdR/ui0KJt//nmPv/IBZp/I6rxiG+XVqvhRi9zZbUh?=
 =?us-ascii?Q?zmw8U8m3Aih88qqIEQ+eI/ca6QCWzG0lCrjMW/GGwateV+VFI7y7KZql8y/T?=
 =?us-ascii?Q?7liKbi3FNhEyv/tg+HbfLzaR6+xfq+2y8JmYyiyc6yHDcH0XxiRC6iNMuAJs?=
 =?us-ascii?Q?orDgedaT1DTPze1GGTOpz9cNIc5u0lojB87FnSwE6BaCQhkg3cLmKqrEpW0f?=
 =?us-ascii?Q?1j4InegjOAwtSyF0yWff4NgEpQ7s0Z1OqXZcwXaUXRZbf6xDnYLGojFZ5aBM?=
 =?us-ascii?Q?NsRfe6XYQYwaPQOGewUtjmZ5tQdpfCueTiDRS17kcIoZsT1sxRX/kR+07HoE?=
 =?us-ascii?Q?SAuetZAXNbTT4lMUI2delej6NznZGrSlMM7N6ZdpTCRut35tkiSVXunY4P4+?=
 =?us-ascii?Q?jn5Mt1zaFTLODroSjot2fBfZZ9xVPBee7+p7CmsvKH9gz9MiSeWjwWKTsDeT?=
 =?us-ascii?Q?ZAY+cYi8SaNCNyaE8+8Q9FO6B+TSUuPMbP2XKCOakUYQU6SkbVvTHcMroGx4?=
 =?us-ascii?Q?pTH0XR/PYShKEq5Zu7WPu9ZjdcSP8Y/zq6/Mr8MymW0l3ky0V2/e8KCSXEUO?=
 =?us-ascii?Q?TftDlnPsr7ILm0+GVlochXT33+H1k7W2IDlmXvK35u27DDyiFqFTZK6+OTGb?=
 =?us-ascii?Q?QSbfxJHChKl6tuHHo+/IS5M4DRnvx9QQac3p0UNhVPcKK5cBSGAbibFfjOBy?=
 =?us-ascii?Q?xMJBBo3brQazoquBEvuBsR6dpSAopOfzebnfvjN7Xuk0IFPS3J1CY0DLKzio?=
 =?us-ascii?Q?48R7B8s7gpeeemw2XcookuUEHRdtKA1ZJL7QZX3bUA5qaJxztnQcXtGNZIfm?=
 =?us-ascii?Q?4QDBFZQSz60JmaKBTFI0MX0cIA/tL2mHDjc/+FmN4riga6thcSWpElsNNM0k?=
 =?us-ascii?Q?ni7uTluecTD1CJSbtqcfxPKLjQcycf6g+1HveIvvVQBuQ6pQvVQbtqIomZiN?=
 =?us-ascii?Q?rP0NjlHfC8sgQJYtBCioLnwoL1PBOfJZ+690vNXI/esK2/QCgXTX75/OS5Rt?=
 =?us-ascii?Q?yJmRhUI7QDyrUC7fF2ByPWVT5fMiGbHoroyI7Ji3xCQdfILSefGKjgrbCK+x?=
 =?us-ascii?Q?uqXB9i1avC7OtkfpQ0mZLN98BOIj4DJ3XwsN1IomzKl+0ueJmHWahH3uNkPc?=
 =?us-ascii?Q?F9BzQxiaOIFROtIeAI7NbyBmVvDuGjEytGIrseHHIimSeh8XgYN6RD9e2U5r?=
 =?us-ascii?Q?41MmNeIpA14=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bto1NT2F9ozlUtXE6ayBOf+b5RX14KgdhMDJIKiaXXL0wNc4/tTCQh+rWu/t?=
 =?us-ascii?Q?MehzgIgtwSs072bQIUdPhx2JDmjYXB2k12rbXlDyj55jlBoFbdeJFnJ7rndV?=
 =?us-ascii?Q?FbZVj/4hWibCKlbrM7wMA+1EsTPbm2gf5BC3QEByDxEXuf2k2VdeqEsrBzzX?=
 =?us-ascii?Q?hZInzIFgff6dq8frZXp47vko1PDqO3q5hOvjPLFaGjeyUS+cR2jbck1DUbs3?=
 =?us-ascii?Q?KRSlR7M6uXWlAxSCr7XzxXTLB1Jb3122z0mjIGjCJYUbYhd+sCRh5VyGSIaa?=
 =?us-ascii?Q?+POdCs1FmNcV1g5NCGCmYlTGtE+O96+AybKMURyMduFAsmDAsDS8WiqWe9fY?=
 =?us-ascii?Q?r3pDbmiaqY+e13CE7hN2QDxazeEtdjh+lLxL8v+aL1FpowOlgL2ni/pheJjK?=
 =?us-ascii?Q?E+W1v70RpauGPUialoHRrNfk7OQDP3vrRfbF6aOwze+tB1jpdmTF7XmW4ar8?=
 =?us-ascii?Q?5oOZrjRTGDc2MlnZH+jeur6Nyc9LqZW5Zk0Qod5nB3dB4oG5FkeMUOti6b5O?=
 =?us-ascii?Q?L5MHvl0I2lZtRDc+AdVdHTbGpXRX031zNhCuVR4mwGAAmjyksWOfPWC5T9IK?=
 =?us-ascii?Q?XOzTfEZMcwImmsQfg3oZHb/1lylgSP8/EJBV/CPOc3dSVsFD/MbS504WMgtz?=
 =?us-ascii?Q?xvI/G8kXYUamWAYM9ruHNHhXyAh9QKIpEGM6pYlal3l0kC5mYSqXg9glXknb?=
 =?us-ascii?Q?aUYKaYYDL1ffN+06xwsjazvLEQhkpKgjjG5mbOca/GGzJft7KwLxbBPMewRO?=
 =?us-ascii?Q?W106lIUpqpLXVvnmlYpmmk3s90j7AsqpQXtMiPWV82VN/TIttuZHXh9HGaBR?=
 =?us-ascii?Q?08lU5pNRM2D1JTgpHKuhfu1e6NN451vQByJFU8Hv7Ft19s/LoFHAgIWOhJ9V?=
 =?us-ascii?Q?DGdu1UWw83ZMBaVWToGk7RnS/Ost4Sr1NxH6g/XgmdA6M87UKVZpR6UJk6U+?=
 =?us-ascii?Q?NqtszCgo9XsRCNcYmxtOHO4o1GM7q83eQ3+cRJBiSwJxF9tKBbrus1G6JEzQ?=
 =?us-ascii?Q?z6U6TFDLGbCsOGGfct5bUo2AFbUXKQO4RVqcAyq4BjDbESK5Z0/G81k6QAlc?=
 =?us-ascii?Q?cQ32PUyFlqzTKL1yHVLY/kW0ynTBzevPkL4M5GYfT9azGQYm/tG3ttBx6Q3y?=
 =?us-ascii?Q?iuUm8fTwkZw3xdClGpaWAnC3JVNo8V2zpwQZpHz05NSOE0StTzlqBmtlMI3A?=
 =?us-ascii?Q?NM6oFz4NMEdMy1WzusPAJU7oVUa7eAZAjZYwPAxJL1QfiRapFe+rXSiJYl8r?=
 =?us-ascii?Q?AxjVvB8h/wN3zYQ3om1r0UKX0kg+v0WgGQmwugm8Bd0C+hRCRuSO55DTygbi?=
 =?us-ascii?Q?Hys71m9cMpqECY4Mc7bOUWEmi6AVnb9rWjx7R4EbfZVHbxH45vYCp9bP3+kg?=
 =?us-ascii?Q?WK/XlMDc+TgoYWavbDQMnG9xPYx50pau4qCpl8p4LqBcmK+xjGarIv9cqD8V?=
 =?us-ascii?Q?MlHambhFrGXMerV2i9ht53kkeqClgxiVwloXRaDSw4bz9G40JSRBeIeIK39S?=
 =?us-ascii?Q?UptJXqOFQQmqRnlqNWTO8f/h9H+nFhriemQZ7UC/VGyRm2y/HAk2f3Pwc+q+?=
 =?us-ascii?Q?X7SY1VdtJxHC928Ow3RhjpohapppX0tsU6g1XDomO81U2anL9Hp5nCb/KB2D?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc1712d5-7bc2-4983-58c9-08ddf07d1b10
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 15:17:07.4029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5t6ni8Wz0RCKhhWXoKpF671S2kPJ9iXQ4DCpQU1YiLUAWnBc3Ir25G1I8MZf2hpVFil8Uf5JW2PeRZbfGDS/VxxPW6k6TnZQcPO7T+VNi64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7964
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

On Wed, Sep 10, 2025 at 08:23:46AM +0530, mallesh.koujalagi@intel.com wrote:
>From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>
>Refactor: eliminate type casts by using proper u32
>declarations.
>
>v2:
>- Address review comments. (Karthik)
>
>v3:
>- Use the proper u32 type and drop cast. (Lucas De Marchi)
>- Modify variable when actually using u64 value.
>- Change r value to reg_value with u32 type.

much better now.

>
>'Fixes: 7596d839f6228 ("drm/xe/hwmon: Add support to manage power
>limits though mailbox")'

This should be a single line, part of the trailer (i.e. no newline
before the Signed-off-by). Like this:

Fixes: 7596d839f6228 ("drm/xe/hwmon: Add support to manage power limits though mailbox")
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

>Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>---
> drivers/gpu/drm/xe/xe_hwmon.c | 33 ++++++++++++++++++---------------
> 1 file changed, 18 insertions(+), 15 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>index e65382d4426a..ae3cc9234dda 100644
>--- a/drivers/gpu/drm/xe/xe_hwmon.c
>+++ b/drivers/gpu/drm/xe/xe_hwmon.c
>@@ -286,7 +286,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>  */
> static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *value)
> {
>-	u64 reg_val = 0, min, max;
>+	u32 reg_val = 0;
> 	struct xe_device *xe = hwmon->xe;
> 	struct xe_reg rapl_limit, pkg_power_sku;
> 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>@@ -294,7 +294,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channe
> 	mutex_lock(&hwmon->hwmon_lock);
>
> 	if (hwmon->xe->info.has_mbx_power_limits) {
>-		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, (u32 *)&reg_val);
>+		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
> 	} else {
> 		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
> 		pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
>@@ -304,7 +304,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channe
> 	/* Check if PL limits are disabled. */
> 	if (!(reg_val & PWR_LIM_EN)) {
> 		*value = PL_DISABLE;
>-		drm_info(&hwmon->xe->drm, "%s disabled for channel %d, val 0x%016llx\n",
>+		drm_info(&hwmon->xe->drm, "%s disabled for channel %d, reg_val 0x%08x\n",

doesn't really matter the var name here. Keep it val as it's more
user-friendly in the log.

> 			 PWR_ATTR_TO_STR(attr), channel, reg_val);
> 		goto unlock;
> 	}

a few lines below this there is:

	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);

this now doesn't seem needed  since both values are u32.

	*value = mul_u32_u32(...) >> hwmon->scl_shift_power;

Lucas De Marchi

>@@ -314,9 +314,11 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channe
>
> 	/* For platforms with mailbox power limit support clamping would be done by pcode. */
> 	if (!hwmon->xe->info.has_mbx_power_limits) {
>-		reg_val = xe_mmio_read64_2x32(mmio, pkg_power_sku);
>-		min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
>-		max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);
>+		u64 pkg_pwr, min, max;
>+
>+		pkg_pwr = xe_mmio_read64_2x32(mmio, pkg_power_sku);
>+		min = REG_FIELD_GET(PKG_MIN_PWR, pkg_pwr);
>+		max = REG_FIELD_GET(PKG_MAX_PWR, pkg_pwr);
> 		min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
> 		max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
> 		if (min && max)
>@@ -493,8 +495,8 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
> {
> 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>-	u32 x, y, x_w = 2; /* 2 bits */
>-	u64 r, tau4, out;
>+	u32 reg_val, x, y, x_w = 2; /* 2 bits */
>+	u64 tau4, out;
> 	int channel = (to_sensor_dev_attr(attr)->index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
> 	u32 power_attr = (to_sensor_dev_attr(attr)->index > 1) ? PL2_HWMON_ATTR : PL1_HWMON_ATTR;
>
>@@ -505,23 +507,24 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
> 	mutex_lock(&hwmon->hwmon_lock);
>
> 	if (hwmon->xe->info.has_mbx_power_limits) {
>-		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, (u32 *)&r);
>+		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &reg_val);
> 		if (ret) {
> 			drm_err(&hwmon->xe->drm,
>-				"power interval read fail, ch %d, attr %d, r 0%llx, ret %d\n",
>-				channel, power_attr, r, ret);
>-			r = 0;
>+				"power interval read fail, ch %d, attr %d, reg_val 0x%08x, ret %d\n",
>+				channel, power_attr, reg_val, ret);
>+			reg_val = 0;
> 		}
> 	} else {
>-		r = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel));
>+		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
>+								channel));
> 	}
>
> 	mutex_unlock(&hwmon->hwmon_lock);
>
> 	xe_pm_runtime_put(hwmon->xe);
>
>-	x = REG_FIELD_GET(PWR_LIM_TIME_X, r);
>-	y = REG_FIELD_GET(PWR_LIM_TIME_Y, r);
>+	x = REG_FIELD_GET(PWR_LIM_TIME_X, reg_val);
>+	y = REG_FIELD_GET(PWR_LIM_TIME_Y, reg_val);
>
> 	/*
> 	 * tau = (1 + (x / 4)) * power(2,y), x = bits(23:22), y = bits(21:17)
>-- 
>2.45.2
>
