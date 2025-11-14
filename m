Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CE6CEACD2
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 21:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47C910EB20;
	Fri, 14 Nov 2025 21:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gv+0kP8b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A180F89861
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 21:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763155936; x=1794691936;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5vbgU3TUYLRiVrnriht7MHACUIE2qOPlyic9KUftS0I=;
 b=Gv+0kP8bcuLL1ovtUzrsWfh5bNelkXS6uNt4i74HGgDXELkKPWe9l3t+
 omoWeiw51keqAHeP52qXNViewtEuC+MCMK8MBOoA962fiCEsFm7vdq30d
 Mrh2uhdlknvd6z4EjDHHjAi84gipzSbjKjVbGHC2+VIposkCAhMCzBlrl
 swDkGtEbWRSbD2X5CevL3MzMAadFRWYLHrDV6VVs7ZX/GO3ha/lYeUCip
 ksFXZvMOb7nlI9ol9iqCiqI0+7n1+t+opPg4QTdybP4MBKy+L/aDYfbD5
 hc/ipqX5lZDEDU6raMCMiJ31BfEGmo4PDobmnXR9YdHp19d0qsw3vTs/t A==;
X-CSE-ConnectionGUID: yTFjhGzTSMq+eVLaBzUetg==
X-CSE-MsgGUID: G1F0hjx+SwCrASB/K8syjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="64965995"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="64965995"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:32:16 -0800
X-CSE-ConnectionGUID: r37Y0EqEQyaMcwG6qt7XNw==
X-CSE-MsgGUID: TF8ibda4RP+8rP7cV9o+yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="189896523"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:32:16 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 13:32:14 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 13:32:14 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 13:32:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJ85IvlQle7gX4Iu7dem9XUeaxlfHJrLZpd2WzA4+MUcjBhxvVdv+hurvsN2htS5dISfGvu+uuhPCP5RHXIYaXkxWtRDaKTWV4hrd2xtSNjGyGkLwYBYDSCMRR/iNCV3ypDpZfDteYpZLjsvfg60mTMgXrw8UnScJ33u7Objed08HU4qAwb1mU2pjr+3cSAA4a2roWjqrCde1GpLseBV2qgTJKZ6b7QNUmIX3tuvMCoIhZNIogPQzyiY4Ycl6OiGtoBQZOWO2ahshV4zswL6TSmRbQZn+bPGVa4Itf3dIZCsEhuzGs0uo7xrGpHkTlUtyHiuv9vpqFRb30RVFOGPWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=didvc8kA52rj0924yeKjwLNLXAGHEkynEbHFl1UZ/sA=;
 b=tzBsIHUNd9ZaFCW+xvhTQAii1SayoZ04No+0M2he8XpTsqRwX/pr28Wx6FXn/fgGdXQpErJ/kqxHhpaR0b7+QBlXNrmLADrOuHP0OisGeG2162EAdLWiqQL7cpeDJ14ulpXXDsTLyOjntAcBgsdG6PPjaB/BqyrTq3/ISFlgknS6QX5jGGR4E62sxGT76193fZ0NimEqgm1/lBY3RhIx9wV9ewnN96lo57HhPv2A+3FAr2NYvGdxZoxCqoL4Ptk/lDw/qkRMjJWgX9nWfVtIA0riOCyCYinveEEiVg3rCQNBFu9yXptgp0sT2p4LvuQbawOJZNIVs9L1YeS9Wu5aMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by PH0PR11MB7167.namprd11.prod.outlook.com (2603:10b6:510:1e9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 21:32:12 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 21:32:12 +0000
From: "Wang, X" <x.wang@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Subject: RE: [PATCH] drm/xe: Fix freq kobject leak on sysfs_create_files
 failure
Thread-Topic: [PATCH] drm/xe: Fix freq kobject leak on sysfs_create_files
 failure
Thread-Index: AQHcVanLM8RFtzv7W0SoSjEUO4416rTyrsXA
Date: Fri, 14 Nov 2025 21:32:12 +0000
Message-ID: <SA3PR11MB804611CDBF833093BEDBB0DF86CAA@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251114205638.2184529-2-shuicheng.lin@intel.com>
In-Reply-To: <20251114205638.2184529-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|PH0PR11MB7167:EE_
x-ms-office365-filtering-correlation-id: f59824aa-a63f-4d72-e178-08de23c54614
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|42112799006|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?udwDKB3jqybZiU41Mttl8LQj7dpW/eCLyoZB1V8GEtucEVUWNVyhqrvzkwZR?=
 =?us-ascii?Q?tdJBaYqTzdKqFtOyMgpwANsK0qjMdshnynLE+NTsZp4DGMHaB2AFAQtfsyTC?=
 =?us-ascii?Q?xVUPAnHso21rP2Olgsb8OIF9Mvb24BzEMKoSJBKkasgzEKIRHQVJhYhjOUAr?=
 =?us-ascii?Q?7bacv3ndMCcXe9q7w4i608SNmsUZTNxyCZdw/tx+6UHgjgSvhtIv9FqiviLp?=
 =?us-ascii?Q?MVlm2IMlSt1XFseM4kGa1kzx3pf0TZ4JH/f6dKihLxV2k6JN5Ftr7V5zqhD6?=
 =?us-ascii?Q?j/oqeAFBDrAjMCBaU++mc3jxpCrqaYl7uLs/+H0TDdROobdC3L9VxwCqyP19?=
 =?us-ascii?Q?6MNKBtHcvPYDdndiqxxrijWTqQ1dWdIaZcczNwupfw8H7VJpSaMQnpi5XGKF?=
 =?us-ascii?Q?ZwSYBwKwFQq7cOUD8jVLEL1ByUc9v35j337v8X1RZoTDTX4OO/uDrre25Udp?=
 =?us-ascii?Q?4YM56221k9Fzj+wyCmmYLGTLG2BDLo1c9u/bKOoQ6P/fTw6H0pEiYtZHNkKB?=
 =?us-ascii?Q?xBZjOxr1JdcwifQPtGmT/DtgQLushcHkAGHhTnydiz2fjUaeDsRmwlEN0G4P?=
 =?us-ascii?Q?8bItutUibZJNCNkqYQAlLAn7ps85r3yVtOuTisXppouVg3hh5BySaH+0eX4O?=
 =?us-ascii?Q?CwtqiKBszFAFw/wCBGzTR+ghCP9oPDsWLnw60CidbMF/tC1gsjM5Q3EVQPB+?=
 =?us-ascii?Q?BQwC6m8JJGMuUgY7CX8JpODfQtYmN4tNDJcY3THjDrjcaOoDw2/CkgvwcGMn?=
 =?us-ascii?Q?CnfWguLpBk6tSTvHbjG1Q16w6Ewd0nIBDlGqNS+VjzNUt4c3y2+0efG4US00?=
 =?us-ascii?Q?VV9vavsqAjKOMa0HqyIoIrIDvhGyBcjJNDsoAivPMQA+0XQ5ttUKt/8MBjIh?=
 =?us-ascii?Q?tWAr5mAyBgC41KNIedMMBh5Nxmb6jfdfSXFBowNl5WSiMwFhSu6Y05elxE2O?=
 =?us-ascii?Q?JyHVW6r2EEFdo4ibTYmBpVzyFzdjfj5Idyixq3rq+pfpWgiyfa+x9thZewYQ?=
 =?us-ascii?Q?JXbpWINHkyhuCuZQfQPM/tZF1eNnWPAjCZEHPU8yfAe1Fi8EpwL2CkROEVJ7?=
 =?us-ascii?Q?qm7ivDJlDi6Ct5GWyuqlIl7+993uStQxi+y4MbIHFM3HQNDU02UmQ3Z+cy/v?=
 =?us-ascii?Q?os4oKDIUR3+pWZXI8gAgvOhTyLXKbGK8b7ZgI3pBElWQET6Ny3Mk0LtotFqm?=
 =?us-ascii?Q?3X5phcgpUUOF2/hJJ4hzI/f7f8WDqUgqFgDHpFxUNPusieA10YFtqB46v13Q?=
 =?us-ascii?Q?S9zlbyOKaMZiO8TlhyLBLB9kD7FFl09j5mHnoj7a3SksqID4awsiwquLnTEm?=
 =?us-ascii?Q?t2hdpMi+lz3jnEsyZFIIjHv67QoFgRr+L8fGGzP9YW24vQg24bGGlOG1GQij?=
 =?us-ascii?Q?rC/beTOG0niQHzRimkMz0FPEYolxdMw/oHeS9yC8pZ/AXFENWiOCpvKESZmN?=
 =?us-ascii?Q?URpRJGuEyKnumRBzT3WRnD5Qx9y0YpaHGHwdj/JmN8ZWUnimB+xFnCDlciZO?=
 =?us-ascii?Q?nfZpHFDm+9BDQWw+QubJIrOcRhYV+CUWgVTX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(1800799024)(366016)(376014)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WjwY+CzL20HtoFSTQe3Ug8Uuv/tyCIE1xLvp2zPflc2KxL3YQBeSgkjmeOc6?=
 =?us-ascii?Q?0ey9i019u9WorLatw1t6EtabBBSWIYuMUCvJM7uY8v7QUVYRwgFLYverd9hx?=
 =?us-ascii?Q?yOLO2RADBbcZ13ETV2pkf2S5Han+OyWJ3yQOex5/aliYBaHeTJJOo0ac8aq5?=
 =?us-ascii?Q?QE+sjoY2/eZiirDmBmkUE4UQRjIwTDrEpaxtsE3kEyvXLAgk+oGZh+7A2sns?=
 =?us-ascii?Q?MhXvjGj3EKerZl6FrZSw6+3SEAXbsL5bX4kOGQMToLmN6+DML/T68iwhECzN?=
 =?us-ascii?Q?rqeBOBsQ3twvmawWHTL5ELdK9UxpACoE5YaiUiSvbMFRuYuyYaAL/uGefNUi?=
 =?us-ascii?Q?CMV2H3z1H8w6ooonAF/5gU3SEHXUrCOQzc+oWezXlXjEerU9JYzcNvNxhv64?=
 =?us-ascii?Q?V1NYFGd0HILo23+9HtGV/ulzGC6k0tLhJXcC5e16g5epFQmGVB3ljaCCl5nv?=
 =?us-ascii?Q?qSl7Q9tz3RzD2pUfM9TIuglOF3/86VCopmU6zwvGkZTej31iUiJtTvukD0Dk?=
 =?us-ascii?Q?RfC815fJOX6KIMD1WOMdFoWf9hQaW6wsaZm/NA+Lu61aLw1E/+q0jKzoJ4NH?=
 =?us-ascii?Q?RrrLwiBYQFDF7Y9C3diRLVDBKPyCPTHcBIakQxti/Drs094TWv80pYffJbaf?=
 =?us-ascii?Q?6FqTA6i3+7Sea1wkA/9dvEiOGUlep2jG78zkjaxG0R4TMsuQSplqE20ZV0cI?=
 =?us-ascii?Q?NwCfxhPo4DOOZ9LQcv7da6Ygvysyzx5QlUjTVlpjhU0D1shEpdoeUrddfMM+?=
 =?us-ascii?Q?7l8sPX4eJCgidgnPxyALhsZQZho1m0//oqkPtU+rRqy99Hvno/OiDbXL5T1z?=
 =?us-ascii?Q?wvQH8WB+GTwrxMx350ZIkoz2LnIkp6M9mUJHQ1udWFKkS3z9P+qytykJ0RHi?=
 =?us-ascii?Q?iTurmVRUvtXt+ZAUOIhCrwGxOf0S0HAqf8iKEJhvoeLqT0HsvVd9Iq+dahMj?=
 =?us-ascii?Q?p5VCmGFpje7JjeJ/Z5CaOD9S+HaCkZ1JfkC23KLvaNKw/qWGrudEtmOxwMv6?=
 =?us-ascii?Q?lNNlJzjH/nhhypmUq81yv5CPHm8UaLoBmkdp2jHCVfYjSnp5kbPYMINUldrW?=
 =?us-ascii?Q?gN5SgsCWNPUJ1muF2f/YXLPTw102Ad9eTdhJSX9Fd4w67lAVbkW/BDfj1X5m?=
 =?us-ascii?Q?LE+Oa6i5nSvyYd1XsMIcNLZC7M8t9K2zYU5LlP6OKEjqoYYIjHAqitcE8iox?=
 =?us-ascii?Q?I8F2+eo97Mf5N/Oi+8inKaIHHwz2BjrNj/KVO61LRXKrae0l4Ww/4gWYd5w1?=
 =?us-ascii?Q?LRLfAvBKspcu2uaMNGlvcS7HbVQ348BKF3TFK25/WfLp9bpy8wmQTKneUwBI?=
 =?us-ascii?Q?Wk/OkqUsPlfcV4zyfy3zghmiQ8R+vFcpIdKjuxChdsABaVXsJly7gc7wHDR0?=
 =?us-ascii?Q?z+SNvyDCaVn9vk+nnuRBoxmGaXEHmCdiYx8fDkLhAgOZoYQJ22ibnjEqTijU?=
 =?us-ascii?Q?yFO6HK4INEsrKLcixCrP3EjR+iAIcsNwEyYJ9wtxB1wj/xewpImInfLiubq/?=
 =?us-ascii?Q?Rm5rlBLfGh88+Ylf0NSRqh+91HzoicjcxqUL3t/AksFZ+er3Y9wKRHLSe0kg?=
 =?us-ascii?Q?LeGS+ttD1ES2SsJ2W1I=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f59824aa-a63f-4d72-e178-08de23c54614
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 21:32:12.4230 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EisGC38LOa56rNkOzC+CaMAcmlYLRPSg9shlam6j+vwkTlKtcUcFz3BHSSXiSYHqqoJ2LH+FzrNV2pVRhsMuGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7167
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

A similar issue can be found in function :  xe_gt_ccs_mode_sysfs_init(struc=
t xe_gt *gt)
drivers/gpu/drm/xe/xe_gt_ccs_mode.c

Can you fix it also?

- Xin
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Shuicheng Lin
> Sent: Friday, November 14, 2025 12:57
> To: intel-xe@lists.freedesktop.org
> Cc: Lin, Shuicheng <shuicheng.lin@intel.com>
> Subject: [PATCH] drm/xe: Fix freq kobject leak on sysfs_create_files fail=
ure
>=20
> Ensure gt->freq is released when sysfs_create_files() fails in xe_gt_freq=
_init().
> Without this, the kobject would leak.
> Add kobject_put() before returning the error.
>=20
> Fixes: fdc81c43f0c1 ("drm/xe: use devm_add_action_or_reset() helper")
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_freq.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c
> b/drivers/gpu/drm/xe/xe_gt_freq.c index 849ea6c86e8e..ce3c7810469f
> 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -293,8 +293,10 @@ int xe_gt_freq_init(struct xe_gt *gt)
>  		return -ENOMEM;
>=20
>  	err =3D sysfs_create_files(gt->freq, freq_attrs);
> -	if (err)
> +	if (err) {
> +		kobject_put(gt->freq);
>  		return err;
> +	}
>=20
>  	err =3D devm_add_action_or_reset(xe->drm.dev, freq_fini, gt->freq);
>  	if (err)
> --
> 2.49.0

