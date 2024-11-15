Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4B9D68BD9
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 21:53:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C36910E114;
	Fri, 15 Nov 2024 21:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="krJ80FHC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE0E10E114
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 21:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731707598; x=1763243598;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Chxr+4ztitTc+GyP3YDQ2CZ51GUBeUoVU4kyDHQS1fo=;
 b=krJ80FHCwlrVMEcckufTjF1iHjP5N70j/gQVtSh8tPItaU7jynsMrspr
 ag4abLP+lm9P0tuSzpU3AlatB+8FGgi6A4gZdNCx81YbHVS/XULSAWrHi
 B/LAQSE2eq3ijnzn8fDlnLAlG0nv6nvQXaRz3ebGfh5xt55Khb+J1OypN
 qLqsq8SeXYZF0iXoNdXHVrlBjTh2CuODxeRmODShMWnJz7zzn2/spVpNY
 Q38yW8HX4nRQ0BU1d4iVBiepTAHSkz5y5Ra6Co2ZjghgQODOjEFPnXDhO
 yPgxctb1kNEyFThnLHTV/25qzulat8zbYir0gHV97oqUmqaTmWvyMGNrt w==;
X-CSE-ConnectionGUID: SC8CMlDeSe+vBsrIjaq4/g==
X-CSE-MsgGUID: E/GVhogPRomkZr8EmJEURg==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="35658459"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="35658459"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 13:53:18 -0800
X-CSE-ConnectionGUID: s/gO7a6CTBOYAjlf1rDChA==
X-CSE-MsgGUID: y8Vs7pvvQ9OVGZ4opiTXSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="88848019"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 13:53:17 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 13:53:17 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 13:53:17 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 13:53:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlqaK9/SvXoTDJCTfD7cdpvUqIN94abYsq7br4vM74M17Tje2ucEuiG13f0GNwJFIiIqL2cu+OIh1qPliCniINHn/jRP0T1GRl4Ia+zcnR4h7SWLE7xeK3YNlGa1dBWZgKPFCcO2YqVb7ZlTlJRfHEIqTj6KspzlYAfli7TkPICT7cTVQlUig9V7sRoO62dkitrIgUhYM4I7nsYXkx5bsEJwpu2x/VydWzbmzoNHpvowUOySVhyzpWuLwY0eqypkDymFHIitOyA/10Fg2smp1HuRYOd3tDBIpGgRiqc/SxFHA9zg7vZ3fVBoC4eiU2gw1NWjr7dzNndlJsDXuWR+YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3mvCsplnyQIMil4Qnl1rdvyLAIekyk9QnT9L1WjTis=;
 b=YIJccmxlA1mdu6RErz8E7XSUnA4+dVrcfjOinc8hJO0Tn1WW9ZtZDlVjOdNRGUqQEs5yBiz+Ck1Ko90U6+4yGN3UuZkoPEjai+okVVknhP16UKlnDj0NyaXwPUGDoDvMwmnJIwm+nv7fdjQ7n7xVATQ2OSOSCCL+KxjJK8lJQepPtRrWNaQyv5cXd9NyJ67Pha1pKI9gFI4xwA19Ple0inelp146lfuSP9eBAk8Aond5L8TVm5Z6RY80JNDPJw6PvYW1U4deCH50YUxwyjE71O43mL2gHA7kXwlThd67DLZOGL9QT0XMyOLvAnoRYHeLmU7FZBgulZdkqyxEnl3dXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7632.namprd11.prod.outlook.com (2603:10b6:8:14f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 21:53:08 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Fri, 15 Nov 2024
 21:53:08 +0000
Date: Fri, 15 Nov 2024 16:53:04 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Drop useless d3cold allowed message
Message-ID: <ZzfCwCZr0byTqGj1@intel.com>
References: <20241115192155.2050987-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241115192155.2050987-1-matthew.brost@intel.com>
X-ClientProxiedBy: MW3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:303:2b::27) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7632:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b43bd45-920d-44a7-bce8-08dd05bfe3fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r/s41XWXoK5+ath2iLQQYVjf4gcHHbyEwYTrPnUfEpl6W/KYwheHEQwV3PR8?=
 =?us-ascii?Q?SxiC/AFoYMHwWaFvdP2V1vSABa2C7KGSqJ56xx4byPT9EAZNXVvfquuI8txR?=
 =?us-ascii?Q?q/+R3cYF2/SVGtWB+Buf/2RWp0fuiTN+lwJ7s2thM0d8IVl1HKZhWL7vCJWI?=
 =?us-ascii?Q?1Cnf3Ab+D18tfqNSJ6tduNir+JSV7eO4Rc0ECAnUglTHfzN11wPftc0iKRp1?=
 =?us-ascii?Q?IYTc8Rsrztdq77MnFQjv+JcxqOj5FU2ZJAVUIgBjJAm3y4stZcSxyqXbxYz7?=
 =?us-ascii?Q?AO7KBsxKujG17iGH09uR5TmHza6L5kuA8iSYby+20wSqtato26xxI1x0FO/S?=
 =?us-ascii?Q?I7NXNmMnJVe+hf8zcs5Pxe0b3oGyzJXxxmQdbRD1VSjlA+O+qqU0PJM3gGOV?=
 =?us-ascii?Q?lCpjmjsvXUAmnDhexduJfFT/wr4olHj+ImS2ox+0oXQcRkJpErskcDiQ4FdL?=
 =?us-ascii?Q?LWuBpascIDqqx/00DAcWOUFRUXEi5KW02hueS2PwsoOjW3StUboZZ4mDjIKJ?=
 =?us-ascii?Q?AsnEKfUHBUvWc18srZGmNf6BXDpqb8ZfBZoA5GO3AJIIvQbif41yfXHIVWia?=
 =?us-ascii?Q?QVKvThuv5p1U51n84rEb/Lk79mtUS+KaHGJjrM/8BNlFf+B4n9SFvgSLh8yo?=
 =?us-ascii?Q?OZ2U5AvucJjKVmd2Kmo1h+S2MsJ3yUjAIfhPqiGUBqMO9lvfv8kwuXJhfl/P?=
 =?us-ascii?Q?0YquyLMafCYH8XvFUQHuP/DzUgJfXLlKFY6MJmlUj4Upx0+upA2+kVqKuiEj?=
 =?us-ascii?Q?LqsFHgm/WS2/yvon9YRfSNk7MIDFhoP7ja93GGUdlzneNIUetvhYTMkAoY6J?=
 =?us-ascii?Q?UWS9NqZJaFX3XWKwm6gEKBClNoCdAwwXQLdK7Vc27XAcM7raUUeJYNP2vHIh?=
 =?us-ascii?Q?VBcBFxZC7lWvM9QtLE32B1BzyLdkQeVnDiNMSjZZR41N6wbX0YPaQUn3CuDz?=
 =?us-ascii?Q?3T23q+KGaMsTXW3Rbcx6EkbmQuMuLmsxu1ajHG6tAYjt9kvj494shafbFxkP?=
 =?us-ascii?Q?XY5p+ky7UQDMb9IoN6BTCRtwnGIG6vEBXKKut56PSXCqoh2cnvi1do1qGl18?=
 =?us-ascii?Q?c/i8W+vSwbyjeQn2HysDtsRrWj1ibLZ/fNT7e9DKiw+AzuACBaqJc+wUYrjJ?=
 =?us-ascii?Q?TMHouQxV0VcJEi4RDS8K1Qu88s8UbF3Fa3jtBjbNVln4GIl/YZOWUGqg5C+U?=
 =?us-ascii?Q?oyG+SasLwK9fIG08jpcLaaAFbtnwcvOB54DGJpLlr6BCcgDJYwVzwWXl2YhG?=
 =?us-ascii?Q?i2SL2tml5dSxXT6aOZpWWHz4uIVFBCW2htdV84Qh+RXSEJih2hqeF95MiF1v?=
 =?us-ascii?Q?vILsnTfqtiLytCvqOh0SdIMT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lJaKsZbhnP/y2xJiF9cEnyhwL7CN+CGzapTsYNvSguTJ7/bCTkMpFaHfZiy7?=
 =?us-ascii?Q?IhBrsCJusEdt22cXXmdy+60PGffmaNMauEIRQsEKHeLq5FqmAS4Gmf+n9wPl?=
 =?us-ascii?Q?AOJwIDodcnQHyueZP1KTiv5PDkZCd/zSjlgrDbVZRmfvUsEYc0BafrgbLPxW?=
 =?us-ascii?Q?1Z21cV+LYqgLaPcU8jfngGe4ZbA/RsCk/zEB/qh309u2dCma9Z3QDUA5IkCw?=
 =?us-ascii?Q?czR1Uw3y4Yxhj2m2+yooGNeyeNUYYmaBBnf4uJ9D4/LyB8ug8j505pvnVdGB?=
 =?us-ascii?Q?WMMpRiuBmysq+/EfU9wWTHYd+gtFfgE34zIpCph89qxlbkvFAuuuGR+sS/sD?=
 =?us-ascii?Q?cQY1ERIonh+O7HDcAPXn6yMwpXsch40Iw73E4WKIm/4fqGEUc9nqokKHsP9K?=
 =?us-ascii?Q?lKUqHUC0uau8mYJVHOyzNhHU8yism2EP09GHUxcC4/P99F3+kH/xhnnW6Rz0?=
 =?us-ascii?Q?51wEfmqAc7rca1gh8f0AvSafD8U2pHYsMKfKctYw+z2gqFtQoLGM6yWd5lle?=
 =?us-ascii?Q?citK8xDUWPb+wUCVeYBSv83D+X8nrUD8WPsYda1o06DUOoMd7RMvFA+kMtNk?=
 =?us-ascii?Q?2etFIvisYce9TKj8HC3lS8m7GNqN0ri8U5rwA6Y3cPmJdWbPlF1QDWAaFen5?=
 =?us-ascii?Q?RCL/wnSDDm1ly2O4zqnmq6TIQsepCH6oNL85y4oVMEdxsJx3BaysNF6sAdUM?=
 =?us-ascii?Q?IB6bJNSrVK6wg5u35bthbkdAlmo3gg53t5LAWtWI1EpWz2Xfxv5vO7lk7xiU?=
 =?us-ascii?Q?evIcEMj1M+YirJM/vFyFSypdq7gixFoNLA23xNEz3JDWYF9IV0sveSW+jbhc?=
 =?us-ascii?Q?/XD91cKKb+VP+M7iW0Rqag2a+iB35ckqpy8vDBPQHJpm7A8B91oGU9ylvJnj?=
 =?us-ascii?Q?AHVSiIkvsWC5BB0o6CaV6TFLaFo+AwowN7UZ2iN4ePEAWnWULuOQTf+a9ReN?=
 =?us-ascii?Q?tTqh0p8uwSG1AErLPhBYx14n67+UhyvS2404D6vHn9m32h5FGf8ykRJ/qUo/?=
 =?us-ascii?Q?ygtmFDa/1LhxSvRRGLE8MbiQ2FVbh4616/jAW/z2/MHodUA1owRzQsckGLPR?=
 =?us-ascii?Q?ZZTSMEgcwOYzVCjnmluW/Rj2g2/vxxNyW6UiGeb1/kgRlVgcFTyhIMF27RRt?=
 =?us-ascii?Q?9lIwn9t2tMsSv/MHxTpvoBo4QtGkV9kB4vNuQmgDG35VmB4ZTvM+8PPgbIMV?=
 =?us-ascii?Q?mEulUrS+7CAL0+IQzvxO65sTai39MO0+Nd3PPS1sc98IlvNQrDgr7gait2Dy?=
 =?us-ascii?Q?DZOpgNgMwY0tPk2Mr9jtYkxMQxzq7q6ERW/PMulSzXJzM+yUOSOf1s2ttTQW?=
 =?us-ascii?Q?o6wT4CpaBjtY2DvTzMLH0pEwGf/XTd5ckS2sG4BtfeWGhV23FzzN8CcjrkTw?=
 =?us-ascii?Q?w1g+jb0sukgWyvGMbBDLlfVXW/8NaIqjcogz4PwU4pFhkfMSWkYxcN2JhTjo?=
 =?us-ascii?Q?/OLtwaK2+1Rojbm2RYyEiP1/YO1LWDUytj3ZqUax/TCIheLDonRwW6ZvC2C0?=
 =?us-ascii?Q?fiQeUsecKNF46yB0gEN8OCaH1APqjdMBYacStXw7DaiRHNjNdZoCBGr740vs?=
 =?us-ascii?Q?EsRTXjfK4gd1F6uMOjaYobuBYvj3JlU4lcsd1yf/eI2v3e6KQ3yAeaskiYqI?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b43bd45-920d-44a7-bce8-08dd05bfe3fb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 21:53:08.4235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Su9RQvbx0I08FikiwQj6B6RAUZyFAg+VKRFZSdGHsR5yMjoG1A+loWHCZ+BkiF39tJYP/FF0ZO3bMUV1mraL8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7632
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

On Fri, Nov 15, 2024 at 11:21:55AM -0800, Matthew Brost wrote:
> This message just spams dmesg providing little benefit. Remove it.

I don't believe it is useless, but I also hate the spammers...

perhaps we could bring the status of it in some debugfs form
as a replacement?

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 40f7c844ed44..80699dbeb2e9 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -738,9 +738,6 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
>  		xe->d3cold.allowed = false;
>  
>  	mutex_unlock(&xe->d3cold.lock);
> -
> -	drm_dbg(&xe->drm,
> -		"d3cold: allowed=%s\n", str_yes_no(xe->d3cold.allowed));
>  }
>  
>  /**
> -- 
> 2.34.1
> 
