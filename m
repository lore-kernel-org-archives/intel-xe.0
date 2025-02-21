Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E660C021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 21:21:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5407110EB3C;
	Fri, 21 Feb 2025 21:21:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X/z3NkiY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515A510EB3C
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 21:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740172868; x=1771708868;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0yijDFBfIZtReQNnp/rZ5ki/TAbYOrVB1Cv7lI7ccHs=;
 b=X/z3NkiYFx6JPetDGgapakWDwwju15KpMA35Cvdok6WO1aL+mjxCCqK0
 cW0C8qc5z2YRbQl3ms7YNI4GU0aJ5Fba/OsYlWG3x0bp8Tr5xaSFuBPwH
 XGlSAdSmFAmMvy7n9ZdH6vnjjNRv9t3kjLYGYmBQlRxkiIgjA1cRGGJyO
 NX0brVSGY69+LyOLQmagl3nU1lAuPLzM6eeBoL5VfPVcePM0GC3GUuMju
 /EydteuoAVlXw4Y1LEp+iOzhrKQodEbNw5LtrGvWr/U9PPuCnctIV65+U
 nSVUfcNKJrmbRqaBtMPfG2K1ydYO+qqTQaKdyr1SdXCLZnBj+f16qY9Nw Q==;
X-CSE-ConnectionGUID: HON4thCPStar7GodzsGQfw==
X-CSE-MsgGUID: uqE3z+E3TlO9QV800yJSMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="51220048"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="51220048"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 13:21:07 -0800
X-CSE-ConnectionGUID: MqmWWyM1REudWZvZ6PO4Kw==
X-CSE-MsgGUID: SxkoOiXKQaSFOt52gXQ1eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120452813"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2025 13:21:08 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 21 Feb 2025 13:21:07 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 13:21:07 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 13:21:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v51SNzMQrcBhNoa1081HrVvEKrzfQxsw3up4gAxLWg5pe+W86XILF6fxJShqEbyuuP4nGCe7geVxF9bhp7e3pHW4wC37lo3ZBMQUJU80WC1nCn65vTCGXa+u4E0s1YLUsUVNorLcgu6hJj85MtWsrxwZhrcdHzoFw9cGjOU/pQUaQNtTOVsrSfLWI8ZK42pVaM/7O8aYRvp7A50PfxeV86W2qvhzGkAxgHItm9AxPJj3YqS/Un1izAnNz9sNZdcGlZHbI0bchb/5n+1ST83HY3OmcH/k30QtFsxZz1iz9V37sJ3vaz4d+gcqjWkdYAKyF+b5Eo2CFw43nB+sRzhIag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YX6pA96SQaFoUwDO52SReksE5JuGtGB9d9sTupYPEhc=;
 b=LykIIcvmUNTWDoQHhQfuNq1HZcKiaDF0wg7fGg/m9wHDAhmioobcSyP3K1L5yfyviVW28Y9Ou3tOsvBWFXXedPNPNK1Za1gOgGkwxLZp1PyEXlS3SXt7qluklUBqGwR0tw/92u19Ir6IrGJ3PxP69uDnD05ZTqVnA8+kcXTXQrQU/YqyRYBxc6bln609cWrQ9yP2Cx94yARFuJcDkl840wo8DxnvksaVnhSkUS+yntmytKg8ZMf1pjDQvvLgCh/48h4KPZrMAgp+ynNgzd1tJDM7oYuGw9gm0wrkhGKXkaWD32gNIZC6FC6Fvu72V3nfGVkZfn1bj//pUT3Bk2Q3nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB8042.namprd11.prod.outlook.com (2603:10b6:806:2ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Fri, 21 Feb
 2025 21:21:04 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 21:21:03 +0000
Date: Fri, 21 Feb 2025 13:21:01 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 5/7] drm/xe: Convert pre-GMDID IPs to struct xe_ip
Message-ID: <20250221212101.GZ5109@mdroper-desk1.amr.corp.intel.com>
References: <20250221-xe-unify-ip-descriptors-v2-0-5bc0c6d0c13f@intel.com>
 <20250221-xe-unify-ip-descriptors-v2-5-5bc0c6d0c13f@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250221-xe-unify-ip-descriptors-v2-5-5bc0c6d0c13f@intel.com>
X-ClientProxiedBy: BYAPR01CA0068.prod.exchangelabs.com (2603:10b6:a03:94::45)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB8042:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fa5f0b5-d8b9-4678-a1c9-08dd52bda574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HkNxJ4mahJ7OZ2SYfxI7ns3LFVJV9ge2hYYTC28WKYwF1XSQooBjACX26eXC?=
 =?us-ascii?Q?2d6WM+5SLOoTA4dhestiGeZKB7lE28oOy+l3k8QM1uPt8lHahdIbNjqPzGrl?=
 =?us-ascii?Q?hoDCr1H7Gvk+yOLSN/zcg9tiK6e82x+1gW3XO/GqttdWOv2NXb5bG8O3CFu0?=
 =?us-ascii?Q?ol2c/yul4MvV84YPvtuKGnsji2QAx4w/BHiKNBYB1fcaHzDzlEQdBYtYVhnX?=
 =?us-ascii?Q?tgdDKyl4wl/3ftbF7NO+3rbtND2n0C5r9q4MiTDm1tZ/inzI82va+DxjX6kr?=
 =?us-ascii?Q?S05MStXl09G0mKfNCbeBT+bMXeipVxVaYY89w7x0K3KZSAdcViOhbolIV1em?=
 =?us-ascii?Q?XTcb7ae2bDw3iRXvcBy4UNWuf3z3kVsje3WaGYaLYYdx3J+Q6ZEkHU4alzGA?=
 =?us-ascii?Q?K9zTm4OQU5IiOvYzIxBwluun8DjNU795kjPBJqbbn5p+TuktgwvHAAEPBXob?=
 =?us-ascii?Q?g5Pbfcx+0L6ZrdsbpAhNd0w54x9YFFwL+eZsavixKCoSm+CfM4G4AZ3qfjYR?=
 =?us-ascii?Q?eD3k/mrbdb51HD1ZH3j4tD97hoARQIyJOWsZ51dkksdRKWM7dkbt+8SISmOx?=
 =?us-ascii?Q?1PKVDxcevpXLZohL0/nheRMc61FelnTYxpw+PgONy9mYDZJJ7RQ3VjJ2n/jo?=
 =?us-ascii?Q?0Rox8kzXA7qMnLjQtaJLHnqPw2Wbel/Z9q5einQ/n1pkHMf6/j+J26VSHIZK?=
 =?us-ascii?Q?vOnnPUggD0BNryUkAC1NQ7tSyYFE54aJTEIQnXt6Xfs+5iyEQfNKfK+Bd4CM?=
 =?us-ascii?Q?wDH9orAaSLtPZFyp8hJ7/BlZs6785arm/G4YVXix8aPXMi+Oqb3ShpEgoHBg?=
 =?us-ascii?Q?NhA2CtIuiEGY/31Wd+mDYQPKIz9C5Zli3h8JEkd8RipbgVQJvPQGVt6+YZbW?=
 =?us-ascii?Q?ADso9uM3Uz2I7ZqWPh/xh2imnrOhWGibQqOw2a61mBrZuLWTPhGV1w4TyCEO?=
 =?us-ascii?Q?OEpnT9/aroSOof4fAmWDIzpRYbJMalKCAR06ApkIhkqtt5fkYFVRYfe01hbM?=
 =?us-ascii?Q?78PhFLobN5Wn8sGUrHbNE9DHrAbIZD4FCENqsEOXYqhqAKQF5zKqppLTKQlc?=
 =?us-ascii?Q?UZ1q+pQf3JPGvSAjSLauUmNft9x9qcxcI+B4f2SQaLmS4aRelMJUW2AagKPb?=
 =?us-ascii?Q?QFyunQhMEPt10egWb88W/gPu5KBtkKFo46naGkzt5JM34YUgR/NuzG1KG+b4?=
 =?us-ascii?Q?Z8K/s18R6tRB111zEmkKpwRr7kOab2cKF4LFzXc3nfcM02HMYlkaZrkWWGSy?=
 =?us-ascii?Q?YAUMBFiRlXl40ULf3sZEwSZBtGMcNXRPkR7RXrYualr0+iYV6QW4eWxIWr/t?=
 =?us-ascii?Q?F7ILjOVCSKX9919obt9SFgZQcGaSvhSnJLPYR7A2MyxGEhGirbDmTxJnIlJ2?=
 =?us-ascii?Q?EAMwfQo3h/1P4t04eKzWsG8omV/h?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UYDIKC9+sZ61A7/ymxhgQPTnYXmSj4KVD4A661X4a6qdeDPPtk2l7P1tjnHn?=
 =?us-ascii?Q?Wi64cvSsPXw25LP8BtuR/PTNG8j5kYvYn3DQ/VI/UvrXimiERi/9K35uyuUZ?=
 =?us-ascii?Q?xH0x7gMmnoUmXiV8vWA/4qbVFLEH+rbKfrJ+qJDJEATlfk3n/pybK+toBqRW?=
 =?us-ascii?Q?i/ptWuFwoybJW+G/uAUg+5wwPWAUaOk5OOrmTAfdkhKewG+NrmzO9fp4Hu5t?=
 =?us-ascii?Q?meVZX1S1v9r8jziRbKvUNCyprUA1chHI0kxIaBnZkMgi5mRTaJoWIWY7f/MR?=
 =?us-ascii?Q?MuCSAFP1m0zGjhJe/tZJ/O0EjRsVx1LauP4/gRy8tkLNwrVlVrdDNXai7fNU?=
 =?us-ascii?Q?9qm0jmfnOG8uFGAOppNj1Q1/y+P9exohXop4AFIY+/gCbgpLVd+adLHTA19K?=
 =?us-ascii?Q?isN8HWlQPK5Yap5RmxBTiYFMcasWnWpoOSfQtU+s+3IHaFADfhEd3gKM3CRi?=
 =?us-ascii?Q?aKvSLdti2FXhS7x0ytcw6r/0k+v0dZdctaYLyuUEvkJkrX+VKwZrJkTLyR6N?=
 =?us-ascii?Q?w/xD1ivq1SYlYd/2NVdLmX13m/qX9P94d6PM6JRq46nNGBIlEcWgYzWqOvWk?=
 =?us-ascii?Q?Bx4zIWJaAmxul/hYzkFPpM83F1sH5mGyXO4LXklK3h4eAFi1kTFP1OOxtufK?=
 =?us-ascii?Q?oT5bNuUmCsnfa1oiD73BrQIyOfaSCOrmDF5yXZl2gdziiKriSmCRH+SvVqsP?=
 =?us-ascii?Q?L4yVB3/cS94fqRHzlEy+teWRQLxyChAJDhpkfZaFyHji6bjuDRt7r9wE7Fu8?=
 =?us-ascii?Q?B7KWqtauNfLWNCkOcTvvcI2n3GnIR07vwLwoywA5NiI899INoiUuCWnouoAq?=
 =?us-ascii?Q?OKssK4OZuC4vXpfD+GfgGt6+z60zu/VyAauhJ2WZOCkOdgTrvZPrCat6nD9R?=
 =?us-ascii?Q?q/WYzpmeBmdLIj+yV3zevy69mD1nMItPjHiPFeB8Gysl1WXekiVZXAUa1C7b?=
 =?us-ascii?Q?1lZiIx1aFRWmXc1GZHHaMf3f0L7FLc8IBNttHdOHlHXpzclbu7Rd1i/58cdA?=
 =?us-ascii?Q?zOG05d3Z2N6hdxGJQtCFgsiFB3Jf+7aQdFnfaZ5PRcuudyKgj8XkbmMqW6eg?=
 =?us-ascii?Q?7igl9Mt1WHWZZDcdkDDKWSu+oyklJa99B6TNph5bl2pzHmG4Gjjb0njR8FyD?=
 =?us-ascii?Q?HuW2+kkgU2dXoAS9acyMnjAnKADOweJsDGbWpstrDLkmWXPRTPUTMwwUDYc0?=
 =?us-ascii?Q?bdizpgXMNTSEsnJdBk67x1H3xE3XIz4AP0ZsmksdRfeyqJZOmPT5gxWTYO9a?=
 =?us-ascii?Q?g6WTD+1yDs+SKEk0rwR86vvivGl9Lm6srZ4DqtN/HrG42qCJGTfyb88Fh+4O?=
 =?us-ascii?Q?cyEPQGDJx57BWV8WbuKqoWNtk5kjblXxt26qbO9mLQ60RgxmivCpvtR/e8zs?=
 =?us-ascii?Q?reE4eo5HpqQ+o8B691ulyJcUpY45UDW0Ms1lRVUJ0vqps7oPgXtMo571l9FO?=
 =?us-ascii?Q?cpgjOyHxJicP+YhsIN4zlnnDImVKCP2/KgHxsDfkF+OKs3nSseF3RVj2cKud?=
 =?us-ascii?Q?u1ctFwG78KR5IKcxZGvlxuHnMwaKWZoQ2OFFhUSxWgzpRiQAS7OIIRnk5ZYA?=
 =?us-ascii?Q?fDkTWp5ZCdBx1DJG5NMeSdOaXrbhjeusrMUh4bqdNqYvflkY2Q2uDLWumuqz?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa5f0b5-d8b9-4678-a1c9-08dd52bda574
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 21:21:03.6246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jabf5OMR/muUMx3xhCxBf9NPo8II3o/YKQTxScUbQYrXdZoD9jM26FFRDPNPmB1ekfEadI4Bd101kb9ZIGj+IBNB87wVAK5ftM2n5vG1rdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8042
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

On Fri, Feb 21, 2025 at 03:51:44PM -0300, Gustavo Sousa wrote:
> We have now a struct xe_ip to fully describe an IP, but we are only
> using that for GMDID-based IPs.
> 
> For pre-GMDID IPs, we still describe release info (version and name) via
> feature descriptors (struct xe_{graphics,media}_desc). Let's convert
> those to use struct xe_ip.
> 
> With this, we have a uniform way of describing IPs in the xe driver
> instead of having different approaches based on whether the IPs use
> GMDIDs or not.
> 
> A nice side-effect of this change is that now we have an easy way to
> lookup, in the source code, mappings between versions, names and
> features for all supported IPs.
> 
> v2:
>   - Store pointers to struct xe_ip instead xe_{graphics,media}_desc in
>     struct xe_device_desc.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c |   2 +-
>  drivers/gpu/drm/xe/xe_pci.c       | 112 ++++++++++++++++++--------------------
>  drivers/gpu/drm/xe/xe_pci_types.h |   8 ---
>  3 files changed, 53 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index 5132c1961472f7d039783193d608721a717252da..1d3e2e50c35509cf8de039052784d54227bfd1d9 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -110,7 +110,7 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>  	kunit_activate_static_stub(test, read_gmdid, fake_read_gmdid);
>  
>  	xe_info_init_early(xe, desc, subplatform_desc);
> -	xe_info_init(xe, desc->graphics, desc->media);
> +	xe_info_init(xe, desc);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 2c00b37e2e835a7c2edad1475a2b76964ee85b8c..b533251300bd4d086618d2a98b44eae52e996847 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -46,9 +46,9 @@ struct xe_subplatform_desc {
>  
>  struct xe_device_desc {
>  	/* Should only ever be set for platforms without GMD_ID */
> -	const struct xe_graphics_desc *graphics;
> +	const struct xe_ip *pre_gmdid_graphics_ip;
>  	/* Should only ever be set for platforms without GMD_ID */
> -	const struct xe_media_desc *media;
> +	const struct xe_ip *pre_gmdid_media_ip;
>  
>  	const char *platform_name;
>  	const struct xe_subplatform_desc *subplatforms;
> @@ -82,10 +82,6 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>  #define NOP(x)	x
>  
>  static const struct xe_graphics_desc graphics_xelp = {
> -	.name = "Xe_LP",
> -	.ver = 12,
> -	.rel = 0,
> -
>  	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
>  
>  	.va_bits = 48,
> @@ -93,10 +89,6 @@ static const struct xe_graphics_desc graphics_xelp = {
>  };
>  
>  static const struct xe_graphics_desc graphics_xelpp = {
> -	.name = "Xe_LP+",
> -	.ver = 12,
> -	.rel = 10,
> -
>  	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
>  
>  	.va_bits = 48,
> @@ -109,10 +101,6 @@ static const struct xe_graphics_desc graphics_xelpp = {
>  	.vm_max_level = 3
>  
>  static const struct xe_graphics_desc graphics_xehpg = {
> -	.name = "Xe_HPG",
> -	.ver = 12,
> -	.rel = 55,
> -
>  	.hw_engine_mask =
>  		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
>  		BIT(XE_HW_ENGINE_CCS0) | BIT(XE_HW_ENGINE_CCS1) |
> @@ -125,10 +113,6 @@ static const struct xe_graphics_desc graphics_xehpg = {
>  };
>  
>  static const struct xe_graphics_desc graphics_xehpc = {
> -	.name = "Xe_HPC",
> -	.ver = 12,
> -	.rel = 60,
> -
>  	.hw_engine_mask =
>  		BIT(XE_HW_ENGINE_BCS0) | BIT(XE_HW_ENGINE_BCS1) |
>  		BIT(XE_HW_ENGINE_BCS2) | BIT(XE_HW_ENGINE_BCS3) |
> @@ -175,20 +159,12 @@ static const struct xe_graphics_desc graphics_xe2 = {
>  };
>  
>  static const struct xe_media_desc media_xem = {
> -	.name = "Xe_M",
> -	.ver = 12,
> -	.rel = 0,
> -
>  	.hw_engine_mask =
>  		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>  		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
>  };
>  
>  static const struct xe_media_desc media_xehpm = {
> -	.name = "Xe_HPM",
> -	.ver = 12,
> -	.rel = 55,
> -
>  	.hw_engine_mask =
>  		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>  		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
> @@ -201,6 +177,12 @@ static const struct xe_media_desc media_xelpmp = {
>  		BIT(XE_HW_ENGINE_GSCCS0)
>  };
>  
> +/* Pre-GMDID Graphics IPs */
> +static const struct xe_ip graphics_ip_xelp = { 1200, "Xe_LP", &graphics_xelp };
> +static const struct xe_ip graphics_ip_xelpp = { 1210, "Xe_LP+", &graphics_xelpp };

We can point this one at graphics_xelp now (and drop graphics_xelpp
completely since it's identical).

Otherwise,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +static const struct xe_ip graphics_ip_xehpg = { 1255, "Xe_HPG", &graphics_xehpg };
> +static const struct xe_ip graphics_ip_xehpc = { 1260, "Xe_HPC", &graphics_xehpc };
> +
>  /* GMDID-based Graphics IPs */
>  static const struct xe_ip graphics_ips[] = {
>  	{ 1270, "Xe_LPG", &graphics_xelpg },
> @@ -212,6 +194,10 @@ static const struct xe_ip graphics_ips[] = {
>  	{ 3001, "Xe3_LPG", &graphics_xe2 },
>  };
>  
> +/* Pre-GMDID Media IPs */
> +static const struct xe_ip media_ip_xem = { 1200, "Xe_M", &media_xem };
> +static const struct xe_ip media_ip_xehpm = { 1255, "Xe_HPM", &media_xehpm };
> +
>  /* GMDID-based Media IPs */
>  static const struct xe_ip media_ips[] = {
>  	{ 1300, "Xe_LPM+", &media_xelpmp },
> @@ -221,8 +207,8 @@ static const struct xe_ip media_ips[] = {
>  };
>  
>  static const struct xe_device_desc tgl_desc = {
> -	.graphics = &graphics_xelp,
> -	.media = &media_xem,
> +	.pre_gmdid_graphics_ip = &graphics_ip_xelp,
> +	.pre_gmdid_media_ip = &media_ip_xem,
>  	PLATFORM(TIGERLAKE),
>  	.dma_mask_size = 39,
>  	.has_display = true,
> @@ -231,8 +217,8 @@ static const struct xe_device_desc tgl_desc = {
>  };
>  
>  static const struct xe_device_desc rkl_desc = {
> -	.graphics = &graphics_xelp,
> -	.media = &media_xem,
> +	.pre_gmdid_graphics_ip = &graphics_ip_xelp,
> +	.pre_gmdid_media_ip = &media_ip_xem,
>  	PLATFORM(ROCKETLAKE),
>  	.dma_mask_size = 39,
>  	.has_display = true,
> @@ -243,8 +229,8 @@ static const struct xe_device_desc rkl_desc = {
>  static const u16 adls_rpls_ids[] = { INTEL_RPLS_IDS(NOP), 0 };
>  
>  static const struct xe_device_desc adl_s_desc = {
> -	.graphics = &graphics_xelp,
> -	.media = &media_xem,
> +	.pre_gmdid_graphics_ip = &graphics_ip_xelp,
> +	.pre_gmdid_media_ip = &media_ip_xem,
>  	PLATFORM(ALDERLAKE_S),
>  	.dma_mask_size = 39,
>  	.has_display = true,
> @@ -260,8 +246,8 @@ static const struct xe_device_desc adl_s_desc = {
>  static const u16 adlp_rplu_ids[] = { INTEL_RPLU_IDS(NOP), 0 };
>  
>  static const struct xe_device_desc adl_p_desc = {
> -	.graphics = &graphics_xelp,
> -	.media = &media_xem,
> +	.pre_gmdid_graphics_ip = &graphics_ip_xelp,
> +	.pre_gmdid_media_ip = &media_ip_xem,
>  	PLATFORM(ALDERLAKE_P),
>  	.dma_mask_size = 39,
>  	.has_display = true,
> @@ -275,8 +261,8 @@ static const struct xe_device_desc adl_p_desc = {
>  };
>  
>  static const struct xe_device_desc adl_n_desc = {
> -	.graphics = &graphics_xelp,
> -	.media = &media_xem,
> +	.pre_gmdid_graphics_ip = &graphics_ip_xelp,
> +	.pre_gmdid_media_ip = &media_ip_xem,
>  	PLATFORM(ALDERLAKE_N),
>  	.dma_mask_size = 39,
>  	.has_display = true,
> @@ -289,8 +275,8 @@ static const struct xe_device_desc adl_n_desc = {
>  	.is_dgfx = 1
>  
>  static const struct xe_device_desc dg1_desc = {
> -	.graphics = &graphics_xelpp,
> -	.media = &media_xem,
> +	.pre_gmdid_graphics_ip = &graphics_ip_xelpp,
> +	.pre_gmdid_media_ip = &media_ip_xem,
>  	DGFX_FEATURES,
>  	PLATFORM(DG1),
>  	.dma_mask_size = 39,
> @@ -315,8 +301,8 @@ static const u16 dg2_g12_ids[] = { INTEL_DG2_G12_IDS(NOP), 0 };
>  	}
>  
>  static const struct xe_device_desc ats_m_desc = {
> -	.graphics = &graphics_xehpg,
> -	.media = &media_xehpm,
> +	.pre_gmdid_graphics_ip = &graphics_ip_xehpg,
> +	.pre_gmdid_media_ip = &media_ip_xehpm,
>  	.dma_mask_size = 46,
>  	.require_force_probe = true,
>  
> @@ -326,8 +312,8 @@ static const struct xe_device_desc ats_m_desc = {
>  };
>  
>  static const struct xe_device_desc dg2_desc = {
> -	.graphics = &graphics_xehpg,
> -	.media = &media_xehpm,
> +	.pre_gmdid_graphics_ip = &graphics_ip_xehpg,
> +	.pre_gmdid_media_ip = &media_ip_xehpm,
>  	.dma_mask_size = 46,
>  	.require_force_probe = true,
>  
> @@ -336,7 +322,7 @@ static const struct xe_device_desc dg2_desc = {
>  };
>  
>  static const struct xe_device_desc pvc_desc = {
> -	.graphics = &graphics_xehpc,
> +	.pre_gmdid_graphics_ip = &graphics_ip_xehpc,
>  	DGFX_FEATURES,
>  	PLATFORM(PVC),
>  	.dma_mask_size = 52,
> @@ -548,17 +534,21 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
>   * media is optional.
>   */
>  static void handle_pre_gmdid(struct xe_device *xe,
> -			     const struct xe_graphics_desc *graphics,
> -			     const struct xe_media_desc *media)
> +			     const struct xe_device_desc *desc,
> +			     const struct xe_graphics_desc **graphics,
> +			     const struct xe_media_desc **media)
>  {
> -	xe->info.graphics_verx100 = graphics->ver * 100 + graphics->rel;
> -	xe->info.graphics_name = graphics->name;
> -
> -	if (media) {
> -		xe->info.media_verx100 = media->ver * 100 + media->rel;
> -		xe->info.media_name = media->name;
> +	xe->info.graphics_verx100 = desc->pre_gmdid_graphics_ip->verx100;
> +	xe->info.graphics_name = desc->pre_gmdid_graphics_ip->name;
> +	*graphics = desc->pre_gmdid_graphics_ip->desc;
> +
> +	if (desc->pre_gmdid_media_ip) {
> +		xe->info.media_verx100 = desc->pre_gmdid_media_ip->verx100;
> +		xe->info.media_name = desc->pre_gmdid_media_ip->name;
> +		*media = desc->pre_gmdid_media_ip->desc;
>  	} else {
>  		xe->info.media_name = "none";
> +		*media = NULL;
>  	}
>  
>  }
> @@ -660,25 +650,27 @@ static int xe_info_init_early(struct xe_device *xe,
>   * present in device info.
>   */
>  static int xe_info_init(struct xe_device *xe,
> -			const struct xe_graphics_desc *graphics_desc,
> -			const struct xe_media_desc *media_desc)
> +			const struct xe_device_desc *desc)
>  {
>  	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
> +	const struct xe_graphics_desc *graphics_desc;
> +	const struct xe_media_desc *media_desc;
>  	struct xe_tile *tile;
>  	struct xe_gt *gt;
>  	u8 id;
>  
>  	/*
>  	 * If this platform supports GMD_ID, we'll detect the proper IP
> -	 * descriptor to use from hardware registers. desc->graphics will only
> -	 * ever be set at this point for platforms before GMD_ID. In that case
> -	 * the IP descriptions and versions are simply derived from that.
> +	 * descriptor to use from hardware registers.
> +	 * desc->pre_gmdid_graphics_ip will only ever be set at this point for
> +	 * platforms before GMD_ID. In that case the IP descriptions and
> +	 * versions are simply derived from that.
>  	 */
> -	if (graphics_desc) {
> -		handle_pre_gmdid(xe, graphics_desc, media_desc);
> +	if (desc->pre_gmdid_graphics_ip) {
> +		handle_pre_gmdid(xe, desc, &graphics_desc, &media_desc);
>  		xe->info.step = xe_step_pre_gmdid_get(xe);
>  	} else {
> -		xe_assert(xe, !media_desc);
> +		xe_assert(xe, !desc->pre_gmdid_media_ip);
>  		handle_gmdid(xe, &graphics_desc, &media_desc,
>  			     &graphics_gmdid_revid, &media_gmdid_revid);
>  		xe->info.step = xe_step_gmdid_get(xe,
> @@ -861,7 +853,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		return err;
>  	}
>  
> -	err = xe_info_init(xe, desc->graphics, desc->media);
> +	err = xe_info_init(xe, desc);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index f46426ef8ed8555af5587137601de0be4d1f2f82..e9b9bbc138d37733ee2b808724ea1cd5f283f8f5 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -9,10 +9,6 @@
>  #include <linux/types.h>
>  
>  struct xe_graphics_desc {
> -	const char *name;
> -	u8 ver;
> -	u8 rel;
> -
>  	u8 va_bits;
>  	u8 vm_max_level;
>  	u8 vram_flags;
> @@ -28,10 +24,6 @@ struct xe_graphics_desc {
>  };
>  
>  struct xe_media_desc {
> -	const char *name;
> -	u8 ver;
> -	u8 rel;
> -
>  	u64 hw_engine_mask;	/* hardware engines provided by media IP */
>  
>  	u8 has_indirect_ring_state:1;
> 
> -- 
> 2.48.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
