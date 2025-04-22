Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C81C369D7
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 19:35:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8344C10E3A0;
	Tue, 22 Apr 2025 19:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ND2Vt6AT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D35910E3A0
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 19:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745350503; x=1776886503;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=shAbsoVpruudWjD9FL0LUp6O+ZzTwAsAQ8gk2Yuy0oc=;
 b=ND2Vt6ATBx3rBQhHqyLhB1gsYD6DoSJ4IxfMDmdmtkzxXmnFCglmQ/pk
 UVbYBosE/oVpufMZch9oozwbRL+xQWR+uH3ZptS5houV1+ZiswP52Ldx7
 lcfMg687tDcdvknohR/4xGkupZB9HP2bLEcGnGsfDN3kxKczh+fhBkIGe
 D43H7u+AZWt8VMJLrtlcjHOSYa90/l53/elJZUGbQ69K1Mc0Pg3C6JKec
 ubIOizVsw3Q9UGqk67mzJDfyAEb6mVpjTbUl9DYoAsWPR6LhVIki3KfnF
 Yt2ro+Rgl2+44S7w9upaT6X08R2RwYZXCOskJzy+A73ID4OEKes6/YQ4W w==;
X-CSE-ConnectionGUID: lrbWTd2UT4+4dzMYa5iDqg==
X-CSE-MsgGUID: 2wVTVAsMTgmsy9IKB2/trg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="47103705"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="47103705"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 12:35:03 -0700
X-CSE-ConnectionGUID: InqIC2SqSTqnHrhPE90DKw==
X-CSE-MsgGUID: NAmijebzRD+Rjf53HeNKUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="163159111"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 12:35:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 12:35:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 12:35:02 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 12:35:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKrrblwx+Hu5D3sIUx6MEdLkotKxYc7pymVJqVIc8HdOd3Tr7c2aIoxA5I8Fx0uQ8wWKryRINntPhaYjAeP0TrQ0sJIAr5afexQpgqOE2EoaQSDpAGu+vc4hXhEBWAlItvgx1xKzfqhHDQ1b726JSINPDPHfNX13aD5F7LGavgJO46VuebOsqxv2uL+KIh7kzTwnydxeuP8Y4dI1e7odkaOZiS9fvB8Zlii/KYFPYRHntdILy0YegGg75SvHMQ5H04ANAXHht0cvmJw3DxphKkXzK1iLaQCoNNAxBvgmfsCsvvextxmvonRMEbm8BPTmdFtG39XoMrRrtR8bfgXOPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhaL+q5NfYYMoxh0R+TbxlUd3xKJxe84oNwoW7QPQKQ=;
 b=IZNx7jDdK/ut/STsgaQtR666wT4jsGvc8BXMVV8RXcONwcVRj1LwSu7Ya28B4RVn2yk75afPMxjfI79mBDKdO5DOcVO0ZOVV7JcB0U4sdOyRMsPxUaJpQMqEx+gOdzrPeRBgox+Aqpw9k7Wy7rBwbTGlCRsb3SftY/pd9Ncl5zEZc6tYEZn6YhfOhTL5bdSJKfJoqa2PTQh1PgkLBP7D7Uah9IZM8wz9Efzlq/QYK0xjp+4Qx4dkmcNSrbCpdhBB7bwynq5LRNfHboM7sU3FBS/BNCmLPKCqmf/U0AdD/luqV9StmAc4PNb0N2nZDj4Fwhl4pquVyf3nMbJToCvMLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 19:34:44 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 19:34:44 +0000
Date: Tue, 22 Apr 2025 15:34:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>, 
 Andi Shyti <andi.shyti@linux.intel.com>, Raag Jadav <raag.jadav@intel.com>,
 Ulisses Furquim <ulisses.furquim@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/hwmon: Fix kernel version documentation for
 fan speed
Message-ID: <aAfvUOeRN1dt0gYJ@intel.com>
References: <20250421-hwmon-doc-fix-v1-0-9f68db702249@intel.com>
 <20250421-hwmon-doc-fix-v1-2-9f68db702249@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250421-hwmon-doc-fix-v1-2-9f68db702249@intel.com>
X-ClientProxiedBy: MW4PR04CA0169.namprd04.prod.outlook.com
 (2603:10b6:303:85::24) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ1PR11MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: 80d4be75-7b08-40e4-6baf-08dd81d4bbbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JFsISTdz9RK0iIEYDrV7/fpvSz217urX9VfmuFwpCvu8I4sghMX8wwXV4uVi?=
 =?us-ascii?Q?UXe35xH6bhBMQbQPIhVkS7dMJQqBfacwTlWJ/df+BZgAi7xLYJOGZbAsJVr1?=
 =?us-ascii?Q?CDgdchIzkKAo7oflOuv9k/28OnooFQXyNM+GC3jslBPGmOWvtR2uA/lUdFCa?=
 =?us-ascii?Q?+LqEAGlf1ydHWXq82SQv/p3qpw57quBmYihSl/SgmT0mMx4EWSqN2w7Mn3es?=
 =?us-ascii?Q?NnB3ib21lVWsVu60ts5/XJ+HqbuMSdMsKUmymuXBVBjartCIWYz88L1wzc9B?=
 =?us-ascii?Q?nHSflgV16X9fzhGdnMDSjCtYt8gp0/BlfzO0FlB/CjPQ+41+grpd53+0seFd?=
 =?us-ascii?Q?lpxGk/cFDg3cMtAw+Z1rinuUV5zrFaJJqZmKdwSA86GdfRhEk5fRQJtVcVyM?=
 =?us-ascii?Q?pAHATLadmYEPSNmkqnuKasy0UhvgRgphtYTak8SJVHkY3ZwVQJTeiMzRADIr?=
 =?us-ascii?Q?TGcFUo4KQDUyh6Z5fH1COPAy5Hbpyl4G3ce83GTRNinFCsxaGNNzh+uxtcra?=
 =?us-ascii?Q?SSO7C64+Vb6ZcyQgilp83diRksdhmIN6fIAAXmYNAcq9GCOXTW/h81siu5oi?=
 =?us-ascii?Q?sxt840zBI+W+5OC+pV7Y6VWPtVOnuE+20ryHaMWv3xY31Uk3FIB29lBNuJg2?=
 =?us-ascii?Q?PHiiuV8mxCDtgEvBRmUfJHNihkEmuXW4LXnrObDR0z3yrPrZBWSZh+wqIGJY?=
 =?us-ascii?Q?pXLbBQe6PgMuT2TVUIclFsq5JhAUoLUeS1dO+E1wS5MZ2LXlXz37FE1Lkk7e?=
 =?us-ascii?Q?Y84oP7Y4I4+lZ/VVQi5shrfaVorsKry94xIiao8FWNe2Z85Bjle7dx/yWumu?=
 =?us-ascii?Q?9vnA5ID73r+mI/fJLgL+rJmhfmlVMyAp+ZgtCO4YQAoCJBBiu/odjJ/S6/eq?=
 =?us-ascii?Q?QBHBL9gQRu1CNzOtqPWqb9x+g1YUPFB2yOdkdBfQKJhYojnz5dhelnnJ0101?=
 =?us-ascii?Q?qXFnzxz66LglAw/3+4cTMJHCGWg2kqlE73Or/9WpF8pGi44l+vchZvbKt8yT?=
 =?us-ascii?Q?hxkxKzsU0Xr7NHIOTQ8NM3KJK7Z6Ge2whAoYpXsqaRe5O4HN9uqR5jO7ejva?=
 =?us-ascii?Q?3N6u7pMeQvAM8w66jhFfrOiXdn5ssudh0H3a3/3o8eG6AosJUwK2+J+Pz63E?=
 =?us-ascii?Q?W/4nHScWDvcE7kgLZY/B64EW1pUeIufaYalzU9iRKwVdciFcYUB2BXLCcv9A?=
 =?us-ascii?Q?ntZE7hT2wrbX2KFma7/YH+KWrMQXPyvWt5aT9y6O4APyETgOYvDjosApakzw?=
 =?us-ascii?Q?sGJxyF3sv9a5UVmKle6rs1OiEaseVhBK28k4cEC2KsR6OYvp1m/DSy7Nb6aB?=
 =?us-ascii?Q?MHnguwLYp7pWIedh78lPrkllF8sNgowIc3FgRp/5/j/UM97RyuSqrIz16J90?=
 =?us-ascii?Q?UetLric=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a//HG40kHm1ti1MZmqog5WvFImyPEPsiwScyqSt42luTVXUPe386eS3qEXtU?=
 =?us-ascii?Q?RyUo8qj2N2waCfAYthQ9kHcHavqdmOF6KSFh4BZsw59bZT9RBo6XNp3TEUye?=
 =?us-ascii?Q?Oy+gQpT5IsVn7Q8kfYZajBfQ+AuZN6Ck7JxBBFZnB3EbfWf3hCDosQjJ5SR7?=
 =?us-ascii?Q?2mSWap2wDUZfiacIoVQvZKnCJ/WJSoLZ2wgPcUdkpuyb3HxhS3RvuqYMscA5?=
 =?us-ascii?Q?xxAe1kzft8DgNzuwIQB4BhBdQvtgKM23GKyWsZhTWwHawuxCqSQW3YG2eow2?=
 =?us-ascii?Q?q5Yc1KuUG6qziIEMj2zGTCmvBEXJS2viakaB8vsMKS++A5U2Wo0NgkN0ywyp?=
 =?us-ascii?Q?mOdNZK+Izr5m8L/6721v6pEOWZ5lSUpW99enEi89JfbD+nxGuQYSKZOOvUEe?=
 =?us-ascii?Q?bk8EEp9ZjOaHiQ1qFeZQ+Z2lXkiV6QlKui5bG69+5m8QdJoPzKDbnYLpvygn?=
 =?us-ascii?Q?Sayj0iSMNHFBuYwXj0gn/LloIY2WYw0vPjewo0pZ2e9eqZBiVz0jV3AdWOiB?=
 =?us-ascii?Q?1XF70NDLLPIvyZ82aq1JMr0CfbOxzgKZjGJEugCRjHYhShJPb3twAySEMnwy?=
 =?us-ascii?Q?FwP1azmfLoJC605FKhoft61GsYR0x7/DlRiuEV99CSYucX9YQr7Az7zxw0kE?=
 =?us-ascii?Q?SqEwEGTYxeNn1OaY8dnuw39TETU/7Bj7EigTFtGaNZwvbXHGYpGfv0gO0klF?=
 =?us-ascii?Q?Fw7kOBz5SkrgOSiwNbwFHzYhZ6Bt0N/1/jdfo04BEsx/Sq3/wtPlWiZuWPC+?=
 =?us-ascii?Q?56psfvupzV7HYaEF4cvEAmallModCPIYBfL8muTxhf4us2xBbA1ZIaWCmGF3?=
 =?us-ascii?Q?H9ePEmfg2GOIYcjFQ61t4dfecxoOdbsN471Rn/6KIh0xjQLz61QG8W3d66Xv?=
 =?us-ascii?Q?qHS8209PxVJAxF15VrgZTzrgIT679ZuMkUBB46LWPIBckvzH5/z5o/DGj3IL?=
 =?us-ascii?Q?w1xpHL5dAR/acalqR7FgVBt93flkYyTgTDS9CpOIbJIHtkV5Z/fsTNO0JfmR?=
 =?us-ascii?Q?rS979m8ckJFRXgOpM0quEF5pL4bi6gOR+a+0hxo36tg+/9eKxJ9D+dc/2UeD?=
 =?us-ascii?Q?Be1tiw1LwffBa7yvwnZSy4btaYn1sDFCHeATLuUkrtYxH3I07f8kY/ANZ2U1?=
 =?us-ascii?Q?99k910NiyznXjBhE9K1XWf2f0K09J/S22E7ssZ8Pm/H6O3Xz3IMa29Hjcf5b?=
 =?us-ascii?Q?iE+f0R5aB6eIp+v5Srwx8VEVm3UqDg/bKqLd7z1KwDkFVWRGp1vLp11+nZG7?=
 =?us-ascii?Q?Xc1ZmrnmgkY69AfLhdqIrRdnc9S7kCdg6rqpv6t2CNmoxjzJEN3Lv09w4ML4?=
 =?us-ascii?Q?qrktl52HSwCdxHrh3He7hmMTme9DXSsTVGP7CWGV3dWAYCYQRpFgvvQ1/Yub?=
 =?us-ascii?Q?hUxjvirJyVpkn9rmiSdr+SwQb5sIgXFazJx6lbJpRJaIh9zbBy79nfIPl2oB?=
 =?us-ascii?Q?gaDnTYOidOJUvuo763XRVdy5qynpNwJmwefmhxSegDlp7r8V0q1BUwipq7px?=
 =?us-ascii?Q?9BPRybLAReSAP5i/dsn5xHseQbbxC9HlLVs1/XAxu6t8BSrNnCAbzPjdmSJL?=
 =?us-ascii?Q?2iF1EK3uAiC+rl5WlOZzsMGt/wiDdlFn7aqHotxcEKLNL3xua1MWc/91ZaHf?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d4be75-7b08-40e4-6baf-08dd81d4bbbd
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 19:34:44.1372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DycmJRv83OKVTLzVZscTE9z5LzmSlFev1SH93uORUrTVbzakKk2dOQ/XWpu+/LfXQC1CnovKogTUW0478k7nSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6129
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

On Mon, Apr 21, 2025 at 08:15:39AM -0700, Lucas De Marchi wrote:
> Wrong copy and paste from other entries: these are starting to be
> supported with 6.16.
> 
> Fixes: 28f79ac609de ("drm/xe/hwmon: expose fan speed")
> Reported-by: Ulisses Furquim <ulisses.furquim@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4841
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 6fbab98fb639d..4ca917ac6382d 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -127,7 +127,7 @@ Description:	RO. VRAM temperature in millidegree Celsius.
>  
>  What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan1_input
>  Date:		March 2025
> -KernelVersion:	6.14
> +KernelVersion:	6.16
>  Contact:	intel-xe@lists.freedesktop.org
>  Description:	RO. Fan 1 speed in RPM.
>  
> @@ -135,7 +135,7 @@ Description:	RO. Fan 1 speed in RPM.
>  
>  What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan2_input
>  Date:		March 2025
> -KernelVersion:	6.14
> +KernelVersion:	6.16
>  Contact:	intel-xe@lists.freedesktop.org
>  Description:	RO. Fan 2 speed in RPM.
>  
> @@ -143,7 +143,7 @@ Description:	RO. Fan 2 speed in RPM.
>  
>  What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan3_input
>  Date:		March 2025
> -KernelVersion:	6.14
> +KernelVersion:	6.16
>  Contact:	intel-xe@lists.freedesktop.org
>  Description:	RO. Fan 3 speed in RPM.
>  
> 
> -- 
> 2.49.0
> 
