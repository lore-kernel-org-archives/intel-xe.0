Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E345CAC587
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 15:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40D210EB6E;
	Thu, 11 Sep 2025 15:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bkS62ViG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6DA10EB6D
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 15:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757605700; x=1789141700;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qN3XhBh9/7fyoXA4k5k+pCjoB3e5f8MC2UXnOHhutUc=;
 b=bkS62ViGOcTYpqhP6BZ1CSVImRXJPqkZHv3ADd/tSmqQObEyvmlhLvSo
 JfYuP/J3uJoxq1Ntt4q0oHk7gtx+xU7/SZFOumvUozlpkUrJVH2fPfq2S
 vbW6rPtjOr8DuQSr1zF1L2v7s27b8ApOmD4q9ivIL+7qvP02vI2cm4aTl
 z7VXzG01ELyRsZwRMIgJUGO6SDwK9MjEh/b/ejG5a7pqiuSOgc0Ix3Wsa
 l8c3buGaSYxCqcD0IARFNLjmhtWDaKoPfBJmt5CJvduSjiFhLDvlAxwAr
 S0xAf8MOMtBlbrXl5RF5D9f4x4ZxBbgtoJ0Eb9YMM5QVcnDIkKFEXrsls w==;
X-CSE-ConnectionGUID: qZYNf8uzSPm5uDhxJv9b+Q==
X-CSE-MsgGUID: iOQs1T8+Qsul26Q/JcdYXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="85384311"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="85384311"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 08:48:20 -0700
X-CSE-ConnectionGUID: lVmWSKOASUSe8l4nZ6WKcw==
X-CSE-MsgGUID: uXTAG8Y4RDmxXcEthKid9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="204723861"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 08:48:19 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 08:48:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 08:48:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 08:48:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QySwr2hPCOeJzA9iHCy4ihZURhESWuvB/QB0UOmOV+IlrkZuVbiQtEjIVoFXVIG905aGW7WQPz/SLdoae+9G+GEE99nXgtSmzyZRiK0zu6FVoQ+yHcTmA8FrvpVzhBIbLStT7lC4RrCBUdKXew0VeHJpPpFx8hEintM+9+OxD8vTmUykCbwGk+Zl7ybF1gmx1DkM638aDOOm6Wmigi33sdSjlGZuoQgKoWpulTQi+B2MRXct/oroBMbtOEcE8Fp3slpN9Z6qWJHssa4iJAWfzlea8CBbAlb/46WQNRBDq7AoBEq2Ba9fL90iZCJm/Bgjrp8uDVYj/IgRRI5RTK38SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z61CLEi00olCDYhpCzmMwJGi2UN5vaC8kV9tG83CG2s=;
 b=taKc7HILTEIpAGlaNKeVKk+TuB3AZLK3O+Emo1zWIN9Bv8B3lybMsJuvI1HrFT840UKXzGLbEVrXmZPRZ6QroNYF3gdKu10IaoiOgTS10Hao3Io1WN/t/1ZGBxzYgtmXFta0iLtzT26JO8Q8AY2MRc3/Q/dAnAuHvYHk7pSCnqOyto/5WE6RxMHl+0821YNtiTxonPZf8WHvdQkOXZRdMxymRszH+xwrpI7CaAXy7A1WMkeKOfkMqdl7aBEHd9bneCUO8+zjL7dmStSdUAvSRGMciAWKguyVOP6+msoT4GN7m9wy0JC7EvVV/WQCnCiXhkozMtPOrWQUA6K1Oy8U4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7970.namprd11.prod.outlook.com (2603:10b6:8:121::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 15:48:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 15:48:16 +0000
Date: Thu, 11 Sep 2025 10:48:14 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] drm/xe: Work around clang multiple goto-label error
Message-ID: <7rnbrgucb2oagr7paavzdcdk3dcnsvuaifanqrsa7ifq2hjbnf@by5worobtu23>
References: <20250911080324.180307-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250911080324.180307-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0295.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7970:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f80acd2-27d0-435d-c71e-08ddf14a9f92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?w+b9JPa3Obp/zR0RgleuIl5HSoDyOHSyrGBQt1LYigog7JI9kDxZYCwcsM?=
 =?iso-8859-1?Q?ENLveyFghs/6aK2/gGKd/ZqmEOKAf86NXzjrpAE1ChbklEfNNddJ025Yec?=
 =?iso-8859-1?Q?GhtKi+FD4tLkghnSXlD5JUZg5LobZNkTIuhu1p9F8mm9fAjYb3ugebJV+R?=
 =?iso-8859-1?Q?Avws0VHXgD3p9A3fSA6KzP68inYK4RWLXhX7b2PIG78EiKsNx3/zj0I2e4?=
 =?iso-8859-1?Q?ufGH0FXIL1SE9P+hDM08E5+AdGAQu+fywasSyXO8AhlVlJ4QpvnpXs3tDw?=
 =?iso-8859-1?Q?Vz4d1PylwzR0gRsIFQyEAPbh0+f/RKtNAx88FsL4PlAMTSNXjtOHuWZ5SN?=
 =?iso-8859-1?Q?lslYzTyQiWso6bITA1SVa5CqWhGK/Epyvane6mrsvveR9Sxbs65qr56Z5v?=
 =?iso-8859-1?Q?h3zpmlWaAHW/L7ppX01cQ5gGmF/WNhaL1sVAjVMV36H6PD/M/l583ugi8T?=
 =?iso-8859-1?Q?SviqjR/6UBrr0c/E9Ky0druJZGUuhI7Xh6IbfAX8s38wh8UOQ5RdXOf1L2?=
 =?iso-8859-1?Q?HenAyMsf4/sgUEV1DGBFbA7zmWEadDHHAaZJs21X8S9gzDnADAWzo/JC2a?=
 =?iso-8859-1?Q?ihiBlKe8lWl9WANoChkKR4zo6D4QryMjurty8/4ImO6Oft1ROtHhq7k0l3?=
 =?iso-8859-1?Q?N7BMKDYRDurzjTviMnbRVwjFcXHWyzy/xDp3vkANDA2hN4IRdVNqdddx4X?=
 =?iso-8859-1?Q?yCY9qYsGg3Kc89hCNYE6MMmc14E7KfBEZudjNWEoLhppoeM3fbKi1Tm0lW?=
 =?iso-8859-1?Q?gwOf1HaLJPFgHt+eep7tTv8RpWRoG/g1ut1kzVI7m805ikW45h2lVzsKlu?=
 =?iso-8859-1?Q?lIO4Dg5CjY5l91bXj7zou3hAWwwoUBb5wNiIXrlsY8BXcGfsfUGl3ej6Fl?=
 =?iso-8859-1?Q?6NJLHSBcMKhoBtITCcKS/JOie64YqLbC8N5zeSQb5O+W7NeiJS84rlS/+0?=
 =?iso-8859-1?Q?OcifgWa8zoiQlo20eO+UuJIFAUREyq72If3w8O+syHDVwQNLr1iZo3D48x?=
 =?iso-8859-1?Q?ULt1A5wTSTYSWLu3CUjE+bOyQUsPH4/0h2NISlQprBfDITkII3uN9u7v7Q?=
 =?iso-8859-1?Q?CjOCiiVVPWQoVr4+LtOvGMHle8R/GECpzRKu3V7M6Bb6zxYaHDGcapHcye?=
 =?iso-8859-1?Q?H/NNWW2iTQTG88HbSULbSxeg1lJyat3d33G6NY6RGadVEVdOxNCs54WUIO?=
 =?iso-8859-1?Q?g4xGU7Jbcs+NnNm40QQ7DXt9n4PXyDcgwsMdYjg/pXLxSEZXhkBkHCrct3?=
 =?iso-8859-1?Q?QCzZVMQAIkuQ+l2XLcjXP+BoftR2dTBCkGNFpq94VHp3Q8+kbG6PHTYVUv?=
 =?iso-8859-1?Q?VvSe+RhgrilvhE7Etj+8cBqLohnKQUXN5jIb0lruW4Vg0nX0HNdrAhQwKu?=
 =?iso-8859-1?Q?YxCNnmuAygmJ02MJIrX8YJWYPhcaAjuyflC/Maeahc+veTMUrUaqI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pjJXxIiP5fAvBsw2GkhiSjZIb7prc3/zWaxUMkDWu5d7eg44/HFzLUw80q?=
 =?iso-8859-1?Q?m/5uz9zmHh3pk7qlQmW621m8zfZyW64OxJWn+ObsyvQ6lSHHDqrF+LjmbO?=
 =?iso-8859-1?Q?ObwnC40bHDmiSZolRMKsfnS5/+VnVWxeh7ChN0FXOgTRAMk0EkM/7eopvA?=
 =?iso-8859-1?Q?yT0Jx0H2HajTdHFFz5iBHOP0xaMhGsxaEPFh5D7xookitZi5vwY72RBpjb?=
 =?iso-8859-1?Q?VLvh7/HpyAjta/mCz0CrD9w8pwgHWbcG/5gfqI0U23GcFhvT1tlHPUmkFV?=
 =?iso-8859-1?Q?QV7BcxH2X6Q1nT+7jTAr7Lko/MYa4kvD2vxS2HS9m3Ab4EpYx5a5/UQU7c?=
 =?iso-8859-1?Q?9VlnMeD9sB3JdwTQGYmfxf92Gh3WZxfvrnQQ7hcPE/Ga2FMwwywENFVh0B?=
 =?iso-8859-1?Q?N3OMdfGAiMei+COh5sONafo0fvPbfFN02hVz6qMe6jrSxWhz8HyLl4Tcoh?=
 =?iso-8859-1?Q?2L49APL+Lfd8rpw4zV//dqb592a+uNPm8/2fJ0vKRhyaQgDrmtCnKtqdWm?=
 =?iso-8859-1?Q?R0cSgjdvXI/u6DVcKCiUXX8TSEgybzMjCKhTiWebmWzVzZW+vjWobiDN9f?=
 =?iso-8859-1?Q?khhtHEqYW4bzmv6ODY613JYOehvNX84Jhy88m1wq0dxSRliaBiBMD46WMj?=
 =?iso-8859-1?Q?OI88KpUpK4APCGQ528VVE1aWw8Biso9CyV5Qgpdx2NtW8P/ezwLl132dVi?=
 =?iso-8859-1?Q?dkkwrCXnZvfKVE4vnAKUE3BxMl9Cp5NUkSeJVIKZSx8Du950Qp6KICAexW?=
 =?iso-8859-1?Q?j+JarpdtaEtniCSQz9uTi/a+sVVWVxZzlgW+nhV/iszuk88yfCnfcT0cdx?=
 =?iso-8859-1?Q?zewwbZywb6aS8ZUp7Q9GF0hpDrqEIL3AiqiJa0BVJ0ji+jgyWltt2vt81u?=
 =?iso-8859-1?Q?s2u2Ziu84+tCj4E8ss6S3WTV7MrWpPuZg3hi2pm91ZiXOCqDwZzLpB5eRk?=
 =?iso-8859-1?Q?YFGsEKrVYDj4mhM69EkWTDu7Rxr+AE62xhqUSKbA1M0fvA5s7ZtwrnSV1T?=
 =?iso-8859-1?Q?4alisao2HI+nZAsb6cuyg5lK185Uyx2k+/lmpkTp2QbgARfPxqk+q7oQtD?=
 =?iso-8859-1?Q?cGZtMyzqCjD4NDU0Nt/hFnmwGGbFyEjNl5+oHdfzitujFXqN1axZwP/OKR?=
 =?iso-8859-1?Q?EKxkN1O2sHdPMUY6Hi3aif+9nNCC0XvtMblh1E447BD/O3feQRvwtA/ypw?=
 =?iso-8859-1?Q?3b+uMqNaJrW6QVz5g/D6TLkzP/5vzBxzgzdUI/JX1d+RvyWiKDWf7SCLGW?=
 =?iso-8859-1?Q?RMPwL7sjAnd7o21k8MIrjkgVtKjybSl4gTA1LT/mU7D2nCrahW5EsRcKGf?=
 =?iso-8859-1?Q?V9EL5oG8Nzwpyo7u0gtyx0PcJxjNFOTV7nY6qrWqDQTOgVIGP4iosXheku?=
 =?iso-8859-1?Q?jO5JqZGjlU0E4veSuSQ3+0pWlsx9RybBJgrP7FpfDf9SHUFTfuVQbkYvbv?=
 =?iso-8859-1?Q?+BpBpnraUJK3wsEqwrp2s1h+jYvFHecdjU4BtmzUmDY/yC/Na99lo1CLoD?=
 =?iso-8859-1?Q?heMn8Z4+wITGHh16ENlgYSwdb5EoEk6mkl5vNTPjtl16D3RT6QY/FslJ/1?=
 =?iso-8859-1?Q?FAGaUrOFZTPpS9CrrBCg4w9rRyqhnaxY/wp0NulFZoGkMrKPCLdLB1KyVf?=
 =?iso-8859-1?Q?DyL9SZSuogAZFWboDjSTc9T5VpY3rGvbVY+zokCCMf3cQHvFjOQHSLbQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f80acd2-27d0-435d-c71e-08ddf14a9f92
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 15:48:16.5534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JKo8l5pA6qPNelzu+2KMHPT+PwvZ16Jvg03aHJ0EruExE68mXxiCyiGWhXkqp3iMtgx7xgP7PIRshjxPEaHSBkF0PhCoH6FWSlo8p9LEw9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7970
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

On Thu, Sep 11, 2025 at 10:03:24AM +0200, Thomas Hellström wrote:
>When using drm_exec_retry_on_contention(), clang may consider
>all labels for which we take addresses in a function as
>potential retry goto targets, although strictly only one
>is possible. It will then in some situations generate false
>positive errors.
>
>In this case, the compiler, for some architectures, consider the
>
>might_lock(&m->job_mutex);
>
>as a potential goto target from drm_exec_retry_on_contention(),
>and errors.
>
>Work around that by moving the xe_validate / drm_exec
>transaction to a separate function.
>
>v2:
>- New commit message based on analysis of Nathan Chancellor
>
>Fixes: 59eabff2a352 ("drm/xe: Convert xe_bo_create_pin_map() for exhaustive eviction")
>Cc: Matthew Brost <matthew.brost@intel.com>
>Reported-by: kernel test robot <lkp@intel.com>
>Closes: https://lore.kernel.org/oe-kbuild-all/202509101853.nDmyxTEM-lkp@intel.com/
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

after replying to v1, I noticed the analysis from Nathan.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_migrate.c | 29 +++++++++++++++++++----------
> 1 file changed, 19 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>index 6fad5d469629..1d667fa36cf3 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -394,6 +394,24 @@ struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile)
> 	return m;
> }
>
>+static int xe_migrate_lock_prepare_vm(struct xe_tile *tile, struct xe_migrate *m, struct xe_vm *vm)
>+{
>+	struct xe_device *xe = tile_to_xe(tile);
>+	struct xe_validation_ctx ctx;
>+	struct drm_exec exec;
>+	int err = 0;
>+
>+	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
>+		err = xe_vm_drm_exec_lock(vm, &exec);
>+		drm_exec_retry_on_contention(&exec);
>+		err = xe_migrate_prepare_vm(tile, m, vm, &exec);
>+		drm_exec_retry_on_contention(&exec);
>+		xe_validation_retry_on_oom(&ctx, &err);
>+	}
>+
>+	return err;
>+}
>+
> /**
>  * xe_migrate_init() - Initialize a migrate context
>  * @m: The migration context
>@@ -405,8 +423,6 @@ int xe_migrate_init(struct xe_migrate *m)
> 	struct xe_tile *tile = m->tile;
> 	struct xe_gt *primary_gt = tile->primary_gt;
> 	struct xe_device *xe = tile_to_xe(tile);
>-	struct xe_validation_ctx ctx;
>-	struct drm_exec exec;
> 	struct xe_vm *vm;
> 	int err;
>
>@@ -416,14 +432,7 @@ int xe_migrate_init(struct xe_migrate *m)
> 	if (IS_ERR(vm))
> 		return PTR_ERR(vm);
>
>-	err = 0;
>-	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
>-		err = xe_vm_drm_exec_lock(vm, &exec);
>-		drm_exec_retry_on_contention(&exec);
>-		err = xe_migrate_prepare_vm(tile, m, vm, &exec);
>-		drm_exec_retry_on_contention(&exec);
>-		xe_validation_retry_on_oom(&ctx, &err);
>-	}
>+	err = xe_migrate_lock_prepare_vm(tile, m, vm);
> 	if (err)
> 		return err;
>
>-- 
>2.51.0
>
