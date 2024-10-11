Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7BDD0D791
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 13:47:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6889A10EAE8;
	Fri, 11 Oct 2024 13:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mtxL5LRo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A2510EAE8
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Oct 2024 13:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728654441; x=1760190441;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YjtuwuY34hZSmtPSPmkE8J0MnbNJYezwQYVUGvh7vZs=;
 b=mtxL5LRoTavH7BpqLuj6GBLIzlb943SDSgbSNrIiTX4cwZ/yJiT0ULRx
 PwHdanOA+hiCgi4tKCZ7r7Dj0uKM3E7L5CYLSos4EsXOevliwfd2wYocY
 Pef0yjG+hJgO2dvJbrnVkNChOf4BDuQw9ljYlFdLMom5pZuDq3BSVbTAm
 YCkefpV68MathytbGCXy8/kMue701hV4gpgn3L8Bd8gfsXYUBmgG5qJR5
 +DG9t7WHrdGrinoIMdVLT7YIANaRwGMC6gUMeKrnbrNDHCyXlavs0PMtt
 b3oTqO/j1n+3gPGwK3WcrXcAIRVFUI1mKfzFXPibxezWIP2+X2iPZP3s8 Q==;
X-CSE-ConnectionGUID: QMBoN5fNSo6p6dEdPZkswg==
X-CSE-MsgGUID: 1Esqi4bFS9iWWXpzwv6sGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31846712"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="31846712"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 06:47:20 -0700
X-CSE-ConnectionGUID: AG/AWNE5RIKercL0dBKEbw==
X-CSE-MsgGUID: /P28eEvtTDCP3AZtI6kOPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="107644407"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2024 06:47:20 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 06:47:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 06:47:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 06:47:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Oct 2024 06:47:19 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 11 Oct 2024 06:47:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABepvI1r246zYfeNliyZtYeJZ2bc3EnkzsAJL2K2LYqFVQJhzOky4xuluw/miRkdeBXD4h/uUcI5Gjoxx7XhLOeE9mMUB2FmQFXr7iJkFj8sqeNkQwiAb7/jHK6jl6UhaST8orRu2In07ZE3yOeLNpZbIX1aSNVkgFcWZfBzYTPIK8V41RqiyTvKVerCW7wHmf943wVDqSWRMdHLqW2t6d8S+ZFg77NUC4oNNna9kyHi2loL4nQaTZNb8Uv+8uBfkXo4WKkTkY9ar/C01J3ybAFVUoAwIyarE0l0wNl/X7FITdpjTl/Z+PWYp05ivDwOdcK9pU0HeuMK10fqnJjNVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COJ8L5FmrUY5eiVEg/L6ufIrgdDFB3hGwZE2zNueEPk=;
 b=AaupOrMs5GFs61QpCtK754lzqmnoDfZC6n3qeR0Iy9opSyKki/B7OOnIYs5FMOIjXsb5/rtE885OHAACWfMGr5XPaeQc49GmauDGklj07LsFAlFRSEqnPrQmh1svkBVOxrEhgzxYkJsF9Xt3ZjKyudqfcTyeKUdA5YzZy7qq4y6CTaUgyAnwvKSpQ+pwdtstXCtmLmSdIDeVcuJgrW4g9hl7gVeTTfB9j424q8WBBWQQJ3X23lsxz5anIEFNbpDV3qqy1xeqQSYVT1d1dvnSXnb6DNpZEMTVdERLq7pfdpEufyadUhaK0T6gLFoQLSZiuKhLww3TUF0QPvyVsmEcnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW5PR11MB5810.namprd11.prod.outlook.com (2603:10b6:303:192::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 13:47:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 13:47:17 +0000
Date: Fri, 11 Oct 2024 08:47:13 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <fei.yang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>, "John
 Harrison" <John.C.Harrison@intel.com>
Subject: Re: [PATCH 1/1] drm/xe: enable lite restore
Message-ID: <rp3yb6cgtawboewuaygtea7uz3ybdzpycmsodpfdlffsbsz25o@wtuxv5gj7v5h>
References: <20241010173142.425498-1-fei.yang@intel.com>
 <20241010173142.425498-2-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241010173142.425498-2-fei.yang@intel.com>
X-ClientProxiedBy: MW4PR04CA0043.namprd04.prod.outlook.com
 (2603:10b6:303:6a::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW5PR11MB5810:EE_
X-MS-Office365-Filtering-Correlation-Id: 64cbd12b-42f2-48fe-b0ca-08dce9fb3847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3wWevNNOREcxsrZbhn3WX5FkqcZEzF3fKqQd/YDM1e0YJxMDYXOjyFEjtoOM?=
 =?us-ascii?Q?aDCXN477+0EJdSKOHaB/tesGhsmIWeh0D7WU4zy4Bl5wZs3cxMs6S9sGpzAf?=
 =?us-ascii?Q?ZxbcYS6SQNMdxgQkDhEJHa88vaQFWgjc/bwi3tXTnM7qhRpwUgLQunbuuFN/?=
 =?us-ascii?Q?rMyP/Q/nyI9A7x9Y0BqIFEPysEIF4FP/qFsIXtSSVP6Gr3mpWltF5mb3GfvF?=
 =?us-ascii?Q?6OY3862iIY46kpu9/H1e6qjiQzDL3X4pgSQFa98WW+0W6lMqO/BkHBo98jHc?=
 =?us-ascii?Q?X234zQXVbv9ep7SJ5i84vkAD7HulTAmmfYt7JdvQDmdVoUuDE8C6CC83qTYg?=
 =?us-ascii?Q?EGdnDftPb5oyBikxd0KT9nx0EXQdqCog4k9Z3MaSXSBfP7o13vzH5oVxr9Nr?=
 =?us-ascii?Q?mAu9QMKfn1TAVMDGqKkXJ0inJjl5L8DHjLXF4Yi/s9oEz75BxlmJYjpnxQKl?=
 =?us-ascii?Q?+UuMhJuqtxDhmC8H3mcGT8X79/YodU2QlcDFp0pDrgrPsEQRrXAdSgURprlL?=
 =?us-ascii?Q?SPTmua/fOloBJfnpGHn/peQoIfWxaVhtE14Ja7WXmT/dLg4YoOUMOqC9Gq2e?=
 =?us-ascii?Q?me7eCld015qgDasH+eLUSXs3BvlGj69dUhRg15uSg2dJCqP4YYRhhU6Y93eB?=
 =?us-ascii?Q?CxjiLld37c+c8bff8rYDKdOUiRf8M5r+wn3rDOYk69ZGe+BNW2skPIqENmJP?=
 =?us-ascii?Q?oH9xtT5W/uV/B1aGaQJavGkmEDw1jTiZlO/kKkEbiM1QliEGLtUvpKSntvIo?=
 =?us-ascii?Q?sP9+YEfBcKMYhggiNmogNeKLjy/9Fb30i6TKvGOzHPR5I2WAxBsq/Tp+xmKi?=
 =?us-ascii?Q?ZAQBS8GPj/KFa4n2mlkshF+924cpjeli/eEahejwtfoJzzOshk4VNvKHgSNr?=
 =?us-ascii?Q?45LOnrmhAD1dqSCCE0Ti/z9vKO25kWbgHAQlzzYxgixa4dAtUpVvQpr5b6i2?=
 =?us-ascii?Q?QPxVz8raCcXp4BZFkd32LwgczANzxnV6uY9ORT8UiUfQJbqNHwXGel4B8k8b?=
 =?us-ascii?Q?LWndj1ELVDUZCT1TWkZfGE7VDVsg31toL9q4W0p6+erFX1mdboCOrQbc21E5?=
 =?us-ascii?Q?H+fCikEsWBOsW9pQp0c5BoJDNz3eO7ZX0gxO+fPC2tXiPMBXTGF/kpA8Ww+f?=
 =?us-ascii?Q?5v4kkLdhv1KYOxXISspF3iSfQsSkDwR7xbQoKfXo/vw7Oe7tR5kW6DvLFBVi?=
 =?us-ascii?Q?bzGARPmHaLpSoEUSIUM7BGFbxHutTmQ4GaKU4EW1hna3GMei6emS0Vr6KwYC?=
 =?us-ascii?Q?M5PVeXzLBeKhuweQXVf/BQ9bffu3/Px4auwtXN6clg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4TOP2oL12lFtYrcPXQkx2+Oi7wZnA/rGcvNg/mPihKUm4rreWk9w3zCT+JHF?=
 =?us-ascii?Q?nLgzX5+fmKk351aZwIg64c9/kKlOJLD7FrET8ed+tsA6+uFUFKtKEJE1tqSN?=
 =?us-ascii?Q?E66a6FGgvwL7oEuNKIatRMIodTTxvu6zi6SA4V5a5tf5KEhq5SkAZ2NI35GL?=
 =?us-ascii?Q?nedgamF0NS3bV8LuoXy0abcpYVZr4SnZ0IST4IXZvSPCuAZSBa9zurTtw/F2?=
 =?us-ascii?Q?33Wp9ZyoVCtPy4EfqN0auT3jGkKzgYDbhgkhX4iklreXi2llnHzWBtcJEGKa?=
 =?us-ascii?Q?L6DxMuNF4XjejvX1ytTA/79UYi2FR43t69Azt3/WwRxHFu2LWDpYDv/8A3lJ?=
 =?us-ascii?Q?ZHWSUkY2uvNmeb6iJqY5TTkyIqC7rbfMZ5arqBTnDvQro3DtIQRa9V14ky5q?=
 =?us-ascii?Q?3XupY4lkfc0WpwAdltXOVUI3hu0q4iSlX8/bKZ6RqysxhviePV1pHrNYTwH8?=
 =?us-ascii?Q?oLafE9hL4huwk6TFTDKW9aw84OU/4bPLsi19XfqRlg4p6UzBjmcLCBquvwtm?=
 =?us-ascii?Q?/gkS2UUyuFG2Xy605s06SoMO6HngnK0qWnMaGNh6EhThk3t7NzAtdOcXnmRA?=
 =?us-ascii?Q?lQv1FMpbirrXfUir/uFijjgmyNGWoBNPjy7bjIQcy69nPbiRV5Yu0ShUiCuS?=
 =?us-ascii?Q?VGUwUtIKMT/S6XHdyX5N8qndlgzhxHgf52wsPPVwp8yKNVRuvELhd3vX1W3K?=
 =?us-ascii?Q?JhsiFMjNn7rB5l5gRkSA4BvjAqpLr9Xe3HIfUoY4DMyR7dyGIjFDtaBmd0fS?=
 =?us-ascii?Q?VPuu7DxPzhQKT3c20DrvvCDac2g3X/flNPSqLEz3k0r82L1MnpGKhotT3uHo?=
 =?us-ascii?Q?sufaeEbcRS6Ag3vpLCnrtNqRUbyYjBmEcYdurso6fHlkWjlhnjCsMK2bviYC?=
 =?us-ascii?Q?os7sk+u2KZwAaFTIvpuFD3u+4GIonthJxDIhuxs1RHjGUQcAEsHtmYb2b3Pv?=
 =?us-ascii?Q?Y7toa1ojUGVEqDAKCG8OR9DF/PfhMdZBbC3LT0HE2PE8617JNBEd8WVQTVZp?=
 =?us-ascii?Q?kGZvbohLYINFmvQC8ICE86cSMTK3sv+VckkkAozZg8TdvkXzWDOwtsReXRKU?=
 =?us-ascii?Q?vB/4d6iRO6NBAzmy8GeOnYTJ8Z6qXYQbXKfKboliRtIvRgoD20HfRJfuZD8W?=
 =?us-ascii?Q?P/bxu5XibG/kTAzlm5k4Hul2d1qX4WRJf3oc/b4TrrlTq8LpPr4xSTkl3xua?=
 =?us-ascii?Q?c81sQz7WLXKeXXZdFt6bA0A1trzZhq8A4H3RsyfKVCZl5CQlh0eakFA6P16+?=
 =?us-ascii?Q?glSdcSpGD3bc2zZGX6d0DXbYAkiHJvaxociivC35mVngm6FLDu145z/4o3A0?=
 =?us-ascii?Q?uzF3814M1/E3reHEE4i/XOGd/EDOA447OXdWvDABdTtSJUjvOx9B0TmseYxT?=
 =?us-ascii?Q?3vAZGhwj1jeCfwQ3gZ2BezH36GRN4ilbkY05Snnx6F/7wOhTESVb5ZE2rwHG?=
 =?us-ascii?Q?Ww2BiXd6KJUmuhdhhh3CWUcM7C4OzclsyW/mxbSKN7d2L4KLSuZCfbR79Ea0?=
 =?us-ascii?Q?XCDd/MNdG6kWSwkMP9xsImKiEAVDYGE7btdU58Z4oT3BSsPWSwk+h59CAHvY?=
 =?us-ascii?Q?vFjf1o1brl0kub9cBPidmEiHNtUia4k+AmmiyuFUJRZD8PZjm09I/H3f1Pcq?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64cbd12b-42f2-48fe-b0ca-08dce9fb3847
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 13:47:17.1999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhGnFXTnhP/Cq+nsXRgh60/cDIodDxddWH7ubl87ORxY8uT6Fd2nV77aJk5ghtGHHx+oQ5ZL3RcbIr/zlhdxbToHR3qXSY8GFLB408Av7CU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5810
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

On Thu, Oct 10, 2024 at 10:31:42AM -0700, fei.yang@intel.com wrote:
>From: Fei Yang <fei.yang@intel.com>
>
>The lite restore feature is supposed to be enabled by default.

I think you could be a bit more verbose here and write a couple lines about
what this is... "supposed to be enabled by default", why? For what
benefit?  Something saying this should give a faster context switch when
the next context is the same would be good. At the very least a
"Bspec: XXX" in which one can find more info.

thanks
Lucas De Marchi
