Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321DCC52D7C
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 18:24:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F1010E14C;
	Thu, 15 Aug 2024 18:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WFITt+tC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94EE10E14C
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 18:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723746298; x=1755282298;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4/WDZgGW/sqTphW0DIO51byHmqeP5/xmaV+W7FhsrQQ=;
 b=WFITt+tCUN7zdYka9CjKcdcBW4ZY4eDuHKLCmM+DV6DgQbn92nBgD1Q/
 PgG6oYawytE4zFYx52OPJhimpfDJgq/yMRHUo59xDb3Rn6Yp8feiUeOAz
 urApzG1bpvczfE664VdlAUHIscJDdPxqB0roLwGg+lsLEaW0j/okJGMCg
 N14inI/0ffma47YPfuwb0JMVnKZIuOpqhDaFj2mJy5oGPnDSG6LgGXJx1
 l1lldpVNCczb53nHLhkIR9tEeAtNwh0y7TgJ6JHh6R9wVFmw9D+FPkvx4
 9GeRq/d9WKGYMKZPM/umVZeCTyjCeRIJsERC6PdkmnBcTgp/b1AMe7Rq/ w==;
X-CSE-ConnectionGUID: oG3Ioyl9QtGs05lAsSAW7A==
X-CSE-MsgGUID: waZCghVNRBarTL3YXr3ykg==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="47424880"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="47424880"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 11:24:50 -0700
X-CSE-ConnectionGUID: a3n7wgnnQYqqL0kzrqqD2w==
X-CSE-MsgGUID: e3Sb3lWmSP6fIQA2/lViXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="64331048"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 11:24:50 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 11:24:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 11:24:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 11:24:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 11:24:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xy2OtW1kqNdV7tYzDWo0JYF7yua0MKDsDKCeRuH3sKbSOqIK9X1b9Q/+XGTEEwetPOlAmo8coVsupfMb5BsbA5vOD9zgsA7awdv4utBbfIom0umcYwPic4xXI00iQFgmoz0G6BJCdcEq9jZbM6DN1RMU9smI3OBBH+0FX4WmOVKjoGGvknP+d8Osu/KgQOFEsnmZ7qwJ2B2WRTKg7TfXl4HNwloONJM+76WYIfQ30t0ERCKZoHfKDeS23CD8CIafuwsOqN+4To44KGyjYRRngINFD2JeTMwc13cS8OLTIDd+40xUA6QFJcfvL57ZAwEw9WiEZ5VISWp2qocfkQTziQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7XsSM44UIU/TxHdY5uWDB90XFzZH6yX+iQtTZ8fCx4=;
 b=LD/4mNi6zxw4I0cwu3uF/RAziEpcgf+sfp1+LUZ5lqrhTyjwr+I1RRH5t89huO2Fk5kUhRYAZdaoJw8fUACBPPAso3zBwY70nYu6FmxEX+KM+oOSXiozDMiYCpkB+quyUBJ0N/xKnBqbmm4Klm4vpNBvzqKTpZd9519tsLwW+KI961lk7OgAzfRz6ltEHvvOeZ4Ah6JoPU3VtUrOcgs4xI1CTFfF/Sbw43OEMtFzlYnOf/OQQhrobPa2D/M0PPAjis/Kehl5Gy4AODbfL8zqQ3PsxOk2v+m2la/gCUW/BszdxNbj7JcIBVuyKOx013u6xU6mlLj72AGOTnc/Trg5Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB8100.namprd11.prod.outlook.com (2603:10b6:208:445::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 15 Aug
 2024 18:24:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 18:24:47 +0000
Date: Thu, 15 Aug 2024 13:24:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison
 <John.C.Harrison@intel.com>, Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH 1/4] drm/xe/gsc: Do not attempt to load the GSC multiple
 times
Message-ID: <svbnhowtvlajsqvjeqqdv4qqv7wkckjbw77teqawc6t24d37w6@pspdsg22k43r>
References: <20240813231148.1663731-1-daniele.ceraolospurio@intel.com>
 <20240813231148.1663731-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240813231148.1663731-2-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: MW4PR03CA0325.namprd03.prod.outlook.com
 (2603:10b6:303:dd::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: ac61b666-73f4-4bc0-2400-08dcbd578ae1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HSNBsrZVyqiPlq/aw8FhDCyllB96WQV2M5qKJy3dHiWRcPcMtuiIgl59rcR+?=
 =?us-ascii?Q?Vh9IOYimRlqjhupXQzFha5dDrC1ygh9aZGniYj8zvU3glpnH/Jhdtj2GGYFV?=
 =?us-ascii?Q?+0ygDOSkZBmal3/vXS4v8Hz7cLYks5QW/ueJecwGIozYrSN8B6W9VBSFjwJ7?=
 =?us-ascii?Q?YtZ3wB169c2OoGEEVbp0kB5ftDUczMWxccrCgXQQoN4CPG7cL/fr9uUML1j1?=
 =?us-ascii?Q?+Jnf/vYrT+Ly1Sosbfnc5ktrXG6AkQrzn/bKCroE5tvJMBKteV6EwLuM6hbt?=
 =?us-ascii?Q?tFeqpzM/a5mpKIkg32ntt69W+dGa7eZWq1skfLf72Fy159v19RRzt1qRHthk?=
 =?us-ascii?Q?UdfnTKpgEFkuGE1wZPIDgCHPXn2TY8x2jRQeGNR0HxP2EUWK0z4wb5E3RgeH?=
 =?us-ascii?Q?yk0XnKevBWYYcdvtOq9ofv/hq6M3WYHLKnT5wQi9VurXYFCLzcmj+Skpd8UH?=
 =?us-ascii?Q?vcTRDD0m7J63vmv6ioVsP8B6fuQfR/RO27N4r2J1IkYJfudqPTU0J8AhBaYG?=
 =?us-ascii?Q?2KUKCE1tEujPcpwCua50h10Jy7LkMAOAlpE4hG7wOqC6vVWMrSijUdTqOHPL?=
 =?us-ascii?Q?0pO5K/jR4+R5ZkoMrlFsGEyUqokMV6Mc1vzpgN89kB15C6H6vgYvQ5Hw3zer?=
 =?us-ascii?Q?+9nXxVUNmRzxxr/rqeZI28FXgX4sQ/Lp63VM+gLQ3dZmwvmFEu21cyELrWiH?=
 =?us-ascii?Q?sHtgr3whMNwIrWkucpJfMV2sFwHq+wHGxZsvDmip/YVJvLGwRPuzSASCOlR2?=
 =?us-ascii?Q?DR5IIrEyH4Crl8kvv+V1xBf0nbVVIPVrLesL9HTyiV3xGs4np8S6wMoVSYgU?=
 =?us-ascii?Q?ECN0rJirMcyHvNdc4Ku2JsAtu7sZR+R2fb5YvpunOBKqE2gfHv+s36S9anGW?=
 =?us-ascii?Q?fV+k64nyQ6544F9+MaKaRHe914XcPPixogwXfzsDqNyqpSXAU/fkla3HVm3A?=
 =?us-ascii?Q?FRX5lZW1J4umzHFuh00iFc3343mCfrt3vVc0ynU46osFV27iXq76F7fcEuHI?=
 =?us-ascii?Q?Ni1i9bkSx3HreV7ZgvXQN99QhpJwo1MIUx394pK5wFs42oiokhV5N+OvMFXr?=
 =?us-ascii?Q?gF3gXMcaA+Hoib2qMMC3K/UQLmkl1hZVnd7DqbCkNhxwcgaJqxz9GVDDJBaS?=
 =?us-ascii?Q?RpF+j9l5gM8HN61ft06Sg8uabfWeMoXEGctjLxxDBIhzn0G3Y4QqkOjUmioE?=
 =?us-ascii?Q?SgX1sB6w6cc75dJpz/96pI+1IoIsMpPniD86soax555hU/Kx1N4Zb+ptrsqH?=
 =?us-ascii?Q?+kAlE4KNxyfojr2JpGr25wIiF0fOTjx8IdCnc1cXs7CEB/iSw2yS9PgWdjEF?=
 =?us-ascii?Q?4Y7OFdv70c6jvVR51fu5DwIm0lWSxiopHDeT/9jUjlSQ6A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cgfar/+KNOTBnVdbA0whvPZt+oxDD0B8oG0o8dO4JbQEJOsW/qToLBMlq/mw?=
 =?us-ascii?Q?aax50Ttt6q5oJM/j0uR1Qo5GfzAoydkryfneyrX5pgDKV08zKw1m6SiJMCVE?=
 =?us-ascii?Q?WSLSpRXqASgW+EgrtC3znI4TJ/Iy1tnrvWC43LnknJ81U3JpM4t/NrjFLaTi?=
 =?us-ascii?Q?iMtNWLywlG7MpLqQdx+cBXq6Jz7l88aPUM558+R+NxK5wT0DM5RN16RdeQQU?=
 =?us-ascii?Q?t4Bn6KijNB6/GlgvktxGlfqe46Mfx/hEk15t8MnhYZe/v56mpivVSr34nP4H?=
 =?us-ascii?Q?bnnkNufWl0ErmEIhJeZAockvzjzFmW7MUj5rvy2twiPNpefxcaIqi1HhT9fg?=
 =?us-ascii?Q?RjzRA4L9W0EB82XO5wWE5DpWjMhMOySFInmOnpxPAw5/fblrP2QtJCBlDl5h?=
 =?us-ascii?Q?1shmz5jaZ2A3d20wvjmxDBvYKo04FqW7NUsoQqVd88/g2epXtECMmzdYWcHN?=
 =?us-ascii?Q?o+zfGFek2D/1zOG+cA3bQ31fj2QCluXEp49rnK5zf2Crp49n0iYmiX0h/N5N?=
 =?us-ascii?Q?QeGsYUeItlRtiwzDwb509SBAkfTHFPsQEbm4da0TybKn2Ls5Fk6lzEEv0awb?=
 =?us-ascii?Q?XcmTegAuEsKtd7PfGF2xL4XG38X4JPml5qnPcT5tuEdrJvXHkQeEziHK5cgr?=
 =?us-ascii?Q?xV1IhfM9NbrtMTf9zwgajX5cJG4jxylBgFV94HVgArOjN++z+oSUQ6SmnwIW?=
 =?us-ascii?Q?rKsB1OfD0SbhpXY4i2sgaGZ9vbV8UEpTLlnjTF/bfcDvSDtCI2pCyYiND/Jm?=
 =?us-ascii?Q?IQEPeAZCldMqyJXobJyyArgiR02HqJwXPre+uB6sqjFlQgEt6Lo5NINVxWzb?=
 =?us-ascii?Q?e/T4DgTMMnX5cFYij7QvhNBMwJ6vcMhoih+HG6qztJlwlIgsNHRSAKH5BvUW?=
 =?us-ascii?Q?+6MifBkIpDTrrOw1qSAx/h7j6n0ph+7W0n7xWbHsz/Mt+d8Zg3d/yqdppAbD?=
 =?us-ascii?Q?p6/Zr6a12cjJR4udB18Za60m+Zb7hmnb7FF/JrE4H9OJYVumvw2Jh7InS/hQ?=
 =?us-ascii?Q?6Gki8s80YFG0iRp4GjifJpdENpGKj99eyZ5wW7ObRc7fqpn9nTaMi6odXTu7?=
 =?us-ascii?Q?rDrdB5SCkjlPSXNj5DaIz70Vz4OPjfhPK6NKJQWLVa+OuQjeOUHuDEu6Ok1g?=
 =?us-ascii?Q?p7eL4rPRl8PCuyD47Oj11TCLQaYcgfbl7ReGdGbULAW8XKILQvplxcAm/Wzi?=
 =?us-ascii?Q?v3Iy2FMIDsOPW3u1sf7GHXWHoTseYWmXGMARV1cx9H5ccYQiXRlhBoPAhyLs?=
 =?us-ascii?Q?HPlGQTdUbgLMbxvq2w2P8fcvJg9b5biOxsJDbWJoiAmeCnbX4lyIpKaXb9ei?=
 =?us-ascii?Q?+WJ2AFHjGEMhKE4attAGb0LRgdMobfzEGPwYFFRYzfql3gUxuh85wAGp+9IG?=
 =?us-ascii?Q?QWEwrAVEd6Y7m0IqtCiWmCncQ7GiTnEaor/cAgTu0jitRw41m2ExthNKvgmJ?=
 =?us-ascii?Q?OP7Vr4rF8DbArgiNr2nf+d54N/V3c85sCNvWLGAieT5ti+zqhl3e9BrBqwG6?=
 =?us-ascii?Q?iv8qt2rNBw2wIaDGpY5EYmdGeJmYM0E5dNLQSszrwKVGk5qyt16xyTzooy2f?=
 =?us-ascii?Q?A10/sYCp9pSTv9q3hKrThsnGuXgrP5/Vp7jB1a+VKp4qnlwISA7lyBptMpwZ?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac61b666-73f4-4bc0-2400-08dcbd578ae1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 18:24:47.1471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cUDHWscqnRB1xTrOusWo/EBf7m152vd9gSS2PpAWaIR26o2TzTIY5iEUD8XHj6D8ntkNtFjvj/nARc8wmtzGMbV6exmgbzWKog9u9XZirJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8100
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

On Tue, Aug 13, 2024 at 04:11:44PM GMT, Daniele Ceraolo Spurio wrote:
>The GSC HW is only reset by driver FLR or D3cold entry. We don't support
>the former at runtime, while the latter is only supported on DGFX, for
>which we don't support GSC. Therefore, if GSC failed to load previously
>there is no need to try again because the HW is stuck in the error state.
>
>An assert has been added so that if we ever add DGFX support we'll know
>we need to handle the D3 case.
>
>Fixes: dd0e89e5edc2 ("drm/xe/gsc: GSC FW load")
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: John Harrison <John.C.Harrison@Intel.com>
>Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>---
> drivers/gpu/drm/xe/xe_gsc.c   | 12 ++++++++++++
> drivers/gpu/drm/xe/xe_uc_fw.h |  9 +++++++--
> 2 files changed, 19 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>index 77ce44e845c5..66963e26c574 100644
>--- a/drivers/gpu/drm/xe/xe_gsc.c
>+++ b/drivers/gpu/drm/xe/xe_gsc.c
>@@ -519,10 +519,22 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
> void xe_gsc_load_start(struct xe_gsc *gsc)
> {
> 	struct xe_gt *gt = gsc_to_gt(gsc);
>+	struct xe_device *xe = gt_to_xe(gt);
>
> 	if (!xe_uc_fw_is_loadable(&gsc->fw) || !gsc->q)
> 		return;
>
>+	/*
>+	 * The GSC HW is only reset by driver FLR or D3cold entry. We don't
>+	 * support the former at runtime, while the latter is only supported on
>+	 * DGFX, for which we don't support GSC. Therefore, if GSC failed to
>+	 * load previously there is no need to try again because the HW is
>+	 * stuck in the error state.
>+	 */
>+	xe_assert(xe, !IS_DGFX(xe));
>+	if (xe_uc_fw_is_in_error_state(&gsc->fw))
>+		return;
>+
> 	/* GSC FW survives GT reset and D3Hot */
> 	if (gsc_fw_is_loaded(gt)) {
> 		xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
>index c108e9d08e70..e4709d9b380d 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.h
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.h
>@@ -65,7 +65,7 @@ const char *xe_uc_fw_status_repr(enum xe_uc_fw_status status)
> 	return "<invalid>";
> }
>
>-static inline int xe_uc_fw_status_to_error(enum xe_uc_fw_status status)
>+static inline int xe_uc_fw_status_to_error(const enum xe_uc_fw_status status)

this const addition here looks gratuitous. Even if uc_fw is const in the
caller, this doesn't need to be.

I'll leave the review to the Cc list

Lucas De Marchi


> {
> 	switch (status) {
> 	case XE_UC_FIRMWARE_NOT_SUPPORTED:
>@@ -108,7 +108,7 @@ static inline const char *xe_uc_fw_type_repr(enum xe_uc_fw_type type)
> }
>
> static inline enum xe_uc_fw_status
>-__xe_uc_fw_status(struct xe_uc_fw *uc_fw)
>+__xe_uc_fw_status(const struct xe_uc_fw *uc_fw)
> {
> 	/* shouldn't call this before checking hw/blob availability */
> 	XE_WARN_ON(uc_fw->status == XE_UC_FIRMWARE_UNINITIALIZED);
>@@ -156,6 +156,11 @@ static inline bool xe_uc_fw_is_overridden(const struct xe_uc_fw *uc_fw)
> 	return uc_fw->user_overridden;
> }
>
>+static inline bool xe_uc_fw_is_in_error_state(const struct xe_uc_fw *uc_fw)
>+{
>+	return xe_uc_fw_status_to_error(__xe_uc_fw_status(uc_fw)) != 0;
>+}
>+
> static inline void xe_uc_fw_sanitize(struct xe_uc_fw *uc_fw)
> {
> 	if (xe_uc_fw_is_loadable(uc_fw))
>-- 
>2.43.0
>
