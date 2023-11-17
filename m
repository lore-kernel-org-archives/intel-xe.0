Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3766C072A2
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 18:54:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D56A10E148;
	Fri, 17 Nov 2023 18:54:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063BC10E148
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 18:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700247239; x=1731783239;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=ng3qxakjN8ytJYITe9yGvvfBjRQwc1s+oOr2t8riBcw=;
 b=FdA9+UKcfY2Qx+atLTKyg4zaJEYp/d7VK6zVvKf8Edi7h09mfkabDEM2
 Jz0C+2JM7skAZR5bmgTAN1WvHuyBjjklSGmP0sbNB2w4w7DMLSuNZHrb4
 A2oQ3Fd7lbJQ9g7eEP3r+wcxsQ7+5QHaOx6OhAut9BkCU5RqNogK5RnM0
 khXfDTgoXgLfgn0c0EkQRT3m6kQvhqLnS2dDhoEJJiWWcg2bMC2bSeCm1
 OF16DaRD11uHPHZtPn/ZRU9WuPykdwZfinlFuswxB0ZBISoUYDtSTLuUt
 47agR26DyVHJZ5chGsr/1Eb75CdOKCJRagvxYOme111SiZtq1HnSg3wRf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="370701792"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="370701792"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 10:53:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="1097178981"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="1097178981"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 10:53:41 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 10:53:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 10:53:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 10:53:40 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 10:53:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGfvCujWwxvlXU9DwnK2cV9ztvwi7jNuMDh8/zmneekw9bN5I2MoCaVAR00P2PolcVARbQTWOOp1FjadvFlmG1uxnxz3vH+S8vvtdjeAAw6IToPOXFJ6AEEoT/APKjiRoJEBulZ0kXGekQX0Gl6ULHaHrb91OOCad8Wabhg6G2ezM6junyoMF6zyAhIYRyNuQpVOo8VxcLNZGjUgvboVCRRYw+dMuNIOKkRD1RKFwwInwk7v/F7xwJLG2jUOuG3l3kULyidwL+iZM4Jy52+/lH3IMHtLN0HALwBsLFYd3oNcmtXbSR9hdafnO1AdcOdRUMKU4hFUHihCnmx6AzvPaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xn0dNivhbPKQsBoVP6bcWqVbH8SSwObsk6UgLDbnR0=;
 b=Y55uwo0qIZ9SD949cpAzJxGKglbHkOohDKS3Gep/z54YkOVs0Qbxm0mY86tEU6F3DtoA19uD/rvLSa7tBBunJWMJ83RLXYb6jSZ/28P2jfLWN0e7j3IDCL7zVfywa4FJsZWRIfAoQPk9F+1FbXPH0OQMqyN3qcU4ugdYsWwpP6qfGgW7whNZEmJfc10O8luR5b0nc+RcFTuBre8PKKZUXs5op/XZln4QL6SoBXx8BuasSeJW5+w8ITekPfV6rInkC9Psbbjts6FPLij6lDSLLuwrO4+F9rMf65h+4DohyC0DEuD8pmTxShJHPte07MsDmcj87scqK3Mzp3byig0Qwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by PH0PR11MB4789.namprd11.prod.outlook.com (2603:10b6:510:38::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19; Fri, 17 Nov
 2023 18:53:32 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::78eb:ce50:6f36:7b2c]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::78eb:ce50:6f36:7b2c%7]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 18:53:32 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231117175624.535520-3-lucas.demarchi@intel.com>
References: <20231117175624.535520-1-lucas.demarchi@intel.com>
 <20231117175624.535520-3-lucas.demarchi@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Fri, 17 Nov 2023 15:53:28 -0300
Message-ID: <170024720873.47595.12058921351905390944@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BY5PR20CA0023.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::36) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|PH0PR11MB4789:EE_
X-MS-Office365-Filtering-Correlation-Id: 65d5aaa8-5249-40bd-8655-08dbe79e7f0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9qkEBnNIu/Z69DiXPJFKXzkkykN2Ve7f3oEhlLtyNWHFnX+HWQ88tosLBJ8zfjqnIfMUEKib1CIHLrJmxyFvYKIP9Jic3b4AxinoscZAQqEz4DYD/7SWffUq4pVZ34f/R21Ng6xTPO8+ktP0n9lwht+yS8pl/8uaWtwWaqpjhbInxLH6TGojcQ1G9/EPm1n3qRQ+XZiolFwdFTg7UOG9GmyhgsFEXzYn/3yruCkqCvKYBE+ouvrzC1rUwKALzh5G1aIC+JfOHbHaGtAggT4FVkSiVIuHpai+c/QyKZTa0wfeAAb0rkEvSBRPFyPQq4ZlF/qN1dzDzz4AZ6pBwFCjCkOkglC/KkYe8HRp7iC7bDAvPW00Mknn3ygai71V/0OPrtlySK6VHujEhXdC72P1OAPjHWfS7zTnB0jj7Bag2yhcTXsROY8YjiHHx+gr92rljPu0903rm4ic1VEK4cP7rZkB3wOGIMClrmfTUvlYbdxXpIYa26x7Vn7eyWbwDy4PCcdGLmCkM7/lXtjhNUJh8o79jUyMsf8kWNTMwsSdl7JVD9tOieddrboAo/p/QUD9TG1IicFF/VF4IK6c24iZ6aPA9jxQxbWQRxQDhgJKJ2FLbzayZJO3lzmsV1ouQOwX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(376002)(346002)(366004)(39860400002)(396003)(230922051799003)(230273577357003)(230173577357003)(186009)(1800799009)(64100799003)(451199024)(6512007)(9686003)(83380400001)(26005)(107886003)(33716001)(2906002)(5660300002)(6506007)(6486002)(82960400001)(8936002)(66556008)(66476007)(4326008)(44832011)(8676002)(41300700001)(6666004)(66946007)(478600001)(4001150100001)(86362001)(38100700002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2hFNVB1TDhVWVFrNGoxd2p2WHVOdVNIREJKK0ExZkh2WXZxN1ZNQ01sVjNS?=
 =?utf-8?B?cmZwc2l0MVZwZnVwWDlxSXlGVkN5bEhtMmRkS2VCeG81bTBwL0tCZ2ZBUW94?=
 =?utf-8?B?bDZ6UjFwMGZJWlhZNm5TbUxpWm84MDVCM1NhYThUZ3JSdW5RNU1BT3J0YW9F?=
 =?utf-8?B?enRZdE9vK2dMOGFrWldEVVNUTmFxekRDaUtmeW91TzFIcmZ1cXhRRFF5anVM?=
 =?utf-8?B?c25WcWY1cDQwRGg0bU0rZDMzOThmSm84djZpUTNQeWR2ZnpNYnFzMDNQeGFB?=
 =?utf-8?B?TDRDWW83dVAyZC84UzBVWWxxdUtsNWNkTTlURjVjQkhrVnRGU2xIRnd3VEp2?=
 =?utf-8?B?OGhOdmx1eUdFdkl3Z3d5UmMrejAydU14eEdsT2RXaXlQYUpwb1dQOVpiZm02?=
 =?utf-8?B?S1FnYXcrdjR3NVhqalFCa0k1ayt0UFdiSnZ5SjUzcEhubzBHaEg5TEM4cU5T?=
 =?utf-8?B?Uk5GbGthTjZMbEhoY2RqUzlUOHpNTi9IelQxVHhnc3htVzdvWXRXenRJVTZq?=
 =?utf-8?B?OVRxWWp2dHphSWtwc2YzTWxZYXBLd1RNaE8yYUh5cERtTlBpekY5S3dodVZ6?=
 =?utf-8?B?UE9tZ2FjK0VpVEtNVjk3WTZlbXRyVTI0QUdiU1dBTFYrRm5ZeitoVUV4QURx?=
 =?utf-8?B?STEwVUs3RFJ4bW1mR2hoKzhadHZyQnNFaGIzUWlCaXU3QXNXbFVXWU5SZzB1?=
 =?utf-8?B?bStlMWNUM3FIeERLd0pKeFl1OEdmU3RFSWl0YVgvdE1XVTR1NUVMWEx2RmFN?=
 =?utf-8?B?aVpzR3hRQmhIYWJTOFVVM0U5S2dKUmNUMXBYeUtMTDhRS2RGREJBL3UvMDRG?=
 =?utf-8?B?eEhDWmlyWUdteWFpSHRvQ050VStHMWFEZXRvRVhzQVN0Rk5UT3JqcnBlaXdV?=
 =?utf-8?B?MGZaMTJKQnFyMHFrNDlVZU9KcEcyeUMyUnZnd1crU2pLUjdSS09sZVcvR1Bu?=
 =?utf-8?B?WkpZNk1WZVFMY09pcEl5TkFLakZPTVJzc3lESFhCNVBlVWU2OG02aG55eFBC?=
 =?utf-8?B?ZXJkb1ZNU0s1ODBMbmJ4QkJUUlhoU3JnOVo4amg3UUpHTjRIbDNjK1ZNVkpu?=
 =?utf-8?B?Qmh1WWwxdm9OMFIwTUNWYlFPdUNTakVOdkpwd0hFemE4R2ZVbCtaWUo1V2hN?=
 =?utf-8?B?dHFsNXFmajNUblI4YktGRkt6cGcyNGpmRVhlcThmUXBDajlTZjdaRXczRXo4?=
 =?utf-8?B?WTg1eGNTNWVRbUwwa2VsQnNpdTYrUGliSTRJM0ZzV0dzTjRGdFVvUUlnRUVn?=
 =?utf-8?B?VmRock9qOTN6VGExcTR5TDNna1lwbGh5Y3BTbTdUSjNZTlFzT2VLOHllZ2hF?=
 =?utf-8?B?TUp2Ly9tZ29tUjBLYmVCL3JieHVWdHV5a2J2QjV4dFBXY2dPMU01TmtrbHAy?=
 =?utf-8?B?cG03a0JZaFlYS1Q4aDZrOVdtdGoyMzlXOWdsT3ZvZlJRNk1yNUtEQlo0aHdn?=
 =?utf-8?B?UGlPSlJndUVvWE5hVnc1T25sc3gwVXdJVldaOUhGOGV3MzU2UzVOdFFqWWh3?=
 =?utf-8?B?c05RUnJIbW0wMlk0SnZpQUF5K3lHOXZ3eWZXZUlyNkI2RkFRUDVJT3VYbVdk?=
 =?utf-8?B?UGIvSzNwZ0FpY0k1T0p2L1pBVmJiT3hEQUU4bWpiSWRWYjRTTlNCT3paQ0Ja?=
 =?utf-8?B?cTdKS1RQMWdEcmlGaVBPRSthbGllZkozUnlPeUdGZ2Jjdk1oQm9LY1VTMEpC?=
 =?utf-8?B?OENoWjZvaGJVQytGSkhUOTdqRDZxV1l2REF2eFhnTUpneWRKcVpFVU9CaEFj?=
 =?utf-8?B?d0tlaU0zRzNubVBTVVo3TEEyZGRWVXgrSGd1Mm9WUUt6VGpyT2pnSE90Wm5O?=
 =?utf-8?B?anZ6MVFzcENUSTBDalhEb3Z0QVNEQndEN3BobnlrSDRhUFBFU3dva0RCSklG?=
 =?utf-8?B?bXlVbk9neEN4ZGNXVi93YmhNUXBnUUMvUThubnpvNU5HWWZsWnkvWWtvV1R0?=
 =?utf-8?B?bnlZTmZvTkI4YWlyYjUrOUdxOWZYc0ZFcXFvczZnUmNqVDVYUEhLcHdxa0Fk?=
 =?utf-8?B?cGRCWTBHS2E5dTB5Y3pNRE04WmZ4Q2RYK2pocWFwbXFHWnpURm9IVk1aL3lR?=
 =?utf-8?B?WGc4ZkNsa3QyWmN4OEJZNWJ5L21FSHlzeUN1NWxFdTg1VEltcmZ2N29ESGth?=
 =?utf-8?B?YU9Kemo2OVcwU2dYSDFocmh1YUt5QzQ1UzdvRmV1ZmZpcU56U2NjcjJ0MHpi?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d5aaa8-5249-40bd-8655-08dbe79e7f0d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 18:53:32.6555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WMJ3kAy+32FCCiEvN9y6bhtZWgRdwbMiSsMeOnOCjNkZWnTP5wj8FTweT/YlpFDqLV/646qrD1yPhjPj7pUgwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4789
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] fixup! drm/xe/display: Create a dummy
 version for vga decode
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Lucas De Marchi (2023-11-17 14:56:24-03:00)
>Fix build with W=3D1:
>
>          CC [M]  drivers/gpu/drm/xe/display/intel_fbdev_fb.o
>        ../drivers/gpu/drm/xe/display/xe_display_misc.c:10:14: error: no p=
revious prototype for =E2=80=98intel_gmch_vga_set_decode=E2=80=99 [-Werror=
=3Dmissing-prototypes]
>           10 | unsigned int intel_gmch_vga_set_decode(struct pci_dev *pde=
v, bool enable_decode)
>              |              ^~~~~~~~~~~~~~~~~~~~~~~~~
>        cc1: all warnings being treated as errors
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/display/xe_display_misc.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/display/xe_display_misc.c b/drivers/gpu/dr=
m/xe/display/xe_display_misc.c
>index 81ff97e704ea..242c2ef4ca93 100644
>--- a/drivers/gpu/drm/xe/display/xe_display_misc.c
>+++ b/drivers/gpu/drm/xe/display/xe_display_misc.c
>@@ -7,6 +7,8 @@
>=20
> struct pci_dev;
>=20
>+unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_=
decode);
>+

Not pretty, but gets the job done.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_=
decode)
> {
>         /* ToDo: Implement the actual handling of vga decode */
>--=20
>2.40.1
>
