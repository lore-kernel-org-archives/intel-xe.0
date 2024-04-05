Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A916CD11C2
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 13:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59091113711;
	Fri,  5 Apr 2024 13:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RQCeRbAn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A28113C17
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 13:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712324397; x=1743860397;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rdd7tfiysEap8mMTmRA+aODZ0XFoIzexHYhh9r7VtLY=;
 b=RQCeRbAnggrmRSob/t6nyfprGkQeIt11W2DR/Jm+4uFwOZ+qf/sfjSro
 JeQXqi9vq13RPg5//bOxREooHHsdD/0hRUiw0Ff0U4JTjPbOaPs1SFLKz
 ncRIl3gAhfnL7rx935H4sir0ukaqJhxPRnoRtzgADfwvDTuMCH2rcrVrq
 MUDfaA1j0T9q3p3slNUQB1bhnX0KxuPvJTjqfQ8CyaUjqnDIWrMmqTN8D
 7lfkml9T7OL7E3CHi7nDlw4bqi9iWWFy08LTlALrdynWFwaZDilpye4Lp
 pvvKITA0dioOpbB4kidMaiGJPw86RVxwRHG6jRNISbIWKAFX4EG+U8PuB A==;
X-CSE-ConnectionGUID: 8CbRNoVsQ5ygGxOn2epU4Q==
X-CSE-MsgGUID: sLh1mb2TRaK8aOsNNmaAIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="18793493"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="18793493"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 06:39:37 -0700
X-CSE-ConnectionGUID: sPU4R/3hTjWp4pL0/mEbXA==
X-CSE-MsgGUID: sdsmPp8fRcmjDcWuLaZK3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="42338374"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 06:39:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 06:39:36 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 06:39:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 06:39:35 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 06:39:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FitGceRmHyF9unZ0zqYwBDb5W1CGJ4oaiMvjfTn9FBpX5+KpKA75fGW1uR7EpjmJjmFod5PnTuMt8r2JU+xlW4LVlGfn/QdUpKrig3lbOenp9AZ70IXXxarpbtSq5c2LhdY/bRW1jI9PQP4XmBTCDg01khrNVYjeaBddncRyzd74bz1WL+TY4mrD/wkExhJ0a/nZ9OfspcLIgmMELgIieyhWZb3hsV6F173OYoo47xTc02IKkMZOwrnZyaAvRiTL1hXf+YLH1ce3DkdHOAqine5jRpMLGB4YzMNKjm7ox7+QGbKfaYO8QhLD4ojSEQ2qETgbYEUnLA7GFK431DNyPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdd7tfiysEap8mMTmRA+aODZ0XFoIzexHYhh9r7VtLY=;
 b=h/9JxrsWqQEO6bsem9fQIzcKzIHtkvlxw4Kz9OpZagDL5BORIZjV3Jt9QWNFDZE7hKsSs6WEIrVza8lhzyxVG87QiTg1SVMLb0L2s54WKIkZzaDxCHTEcbF/o4pbzpJQnF9ziy4mcLEM9I983/ah5WHYzNQnx+bh3G611ayoLWN6Tev03dG5qkBr0hzAkEEeAPrCJ9i6ZF9OnVyDR3i1BV4l5LYj65GgDFZBUQgIoyJkIvLA05bXY/xVHaOve+RAgDjNuQrZgc/5CGVi6HB4dLmngad7a+mYDBVPZDaXBc2+RLhq+y2RbTt2pjrKGEd0OM18OTjBh+55jnM5sfZUmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB7977.namprd11.prod.outlook.com (2603:10b6:806:2f3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Fri, 5 Apr
 2024 13:39:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 13:39:33 +0000
Date: Fri, 5 Apr 2024 08:39:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Move PTE/PDE bit definitions to proper header
Message-ID: <oysi4i2ybx5mp4xonjzd7373q57bsscz2ccdwl4gkfavue7amx@wycke3x4olqg>
X-Patchwork-Hint: comment
References: <20240405123520.847-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240405123520.847-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR06CA0002.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB7977:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yA3cb/+UulbyTrgB59uhwd47Bg7bA4cOcS9mmF9lFdlHE4ksryALKXa7xMJLeX0EvuSkQVxjHsshBwmSSHleQcSNYl/rD8k3UzBp73ZlSab5fNDgcoj+FTr3k6q2ddpBZ3Kog9PxlUI4NFlVi/asQbkx5rXiaJV1v2GoCGeTFV0GXOm4quLGeXLzAFT/Asj4IeuYAxqyZ0CQqDC1Nhlto5tFDPUvXxTLOMk2nKTFEDeJfQdSgZkZoKRlRh+NAnXgtJSrrMaQXVoysWbMLVYvd1keglcsvys+c4o34CKfEbCTSsxQCNADF3qmPpeMuAEEnJxGOywEa2nEgwMnnbBicvvZENVQDd/RBuL1sEWixQxpqf2YL1obZyIP1Nc6soJmQHGxpCpxqsB15vRz8+WbnlDiYOiJSMav52JS4JLWXI8BtQGamcmsCBhGR/ZG7aA6oTkgX2kgARbMt4ayZFxC3gz2bNJqzuS1FF/zHg3x7Q1vyKRmh1lPnxnlNVEmOe6udKrXgrfRDl5ucSdiJ1dUmBGS3o3k0FIfdh/cgh3LK7bTogUzjRYsnr6WUSmOXdWdAStaZsVt3B2u819pQ0DPYqqquuYcKybDIfAHCuwmcMcIvHt3E9/BbsF37yHb3uBWApP8xJ3Agzqt6EO/mCPNDPVB7nv6RqWQBcDCOKA1Zi4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rM7PITNniy8HObaR1eDL+gNeaVAjNuoM4i5IyRtngzKsKlJxRqL1LBPA/TLT?=
 =?us-ascii?Q?lm8duPBYod4lGJU3uBoA7H54iyDawllp2qrMUNQt7bOJrc7Zxsy0Kb+TJlu8?=
 =?us-ascii?Q?VHEoeHFyGqLcntpPNMsqudv3xABd2GAa2BPTD8w3NIXryodNz7c9TQTyzVTx?=
 =?us-ascii?Q?5gVmw/2853rym0o9rAwxsX7b75GB8QNb8MrmNAGzkAP2+SSA+DAFuVFg+Z+0?=
 =?us-ascii?Q?JykEXWXXGflbvLGau7FPg/EwYrmq8nO0eT6/ywtRynYBGTAD5xnfeGxnwm/j?=
 =?us-ascii?Q?LLWEE+YwF7JVT8GtgaoW038UVD8YhEfaIPRiPQdJzUaWLLVMHQcbvbo+YGJl?=
 =?us-ascii?Q?sBjFN7ixejNDWz11Em0G+FVO1ORZtsQ8n0e/EcXOk87076MrbZNiCbWojT1n?=
 =?us-ascii?Q?Un70CjFnE7YD4ysub/Vn/87R/QJBB2QI4MoGKLtuFy+tCPrFBOSBPrPP1HNj?=
 =?us-ascii?Q?FkbqJ7xEV4BRx4tx0MwJpN3wOrb3/yImBWp/sV6ljEiNG3TMj92bitR0B0ni?=
 =?us-ascii?Q?dphm349CnAkM4zsRDt9rsVpN9q+Wok7ydxWNzva3almOPmRIWMQKAGuIczCC?=
 =?us-ascii?Q?gki1x8iz59VDyd7kB7dCkuV3sAo/t+nD7+FtCpQsfckgi8IcyeXGVXtjnPeQ?=
 =?us-ascii?Q?z+WUGk9SoPfQeulsnko2F8yYyYFmchNQsuWwYxaCboMt4x2JCGY/+B1FW4xy?=
 =?us-ascii?Q?+ulnvq3PdNFiYw9CzKK/OUEwNGK+el+lNwtPHSLz4NXgkwVzTLWzv0L+Wa5m?=
 =?us-ascii?Q?0XJgt33XXWlrnoV4io6zbOhNwpDYjidmamgv/DvVVjTJTYAdIk6zl3V20TOt?=
 =?us-ascii?Q?DYyUXnXIh6k4YMbl3wcsyl45vpkGiTm8a/vXcTahBxpJEXnd/J2pKVpVE90I?=
 =?us-ascii?Q?A0/JIH4eZkAz+h5c5YGqvaaAWiO7UH3I5sHAmnBZMu1E9CbVugDGLSpM5i26?=
 =?us-ascii?Q?gUeOcJG7t0/a3ckMlutF0KjsfgnP8DaJ6wUW/fK7VTp917CW1uVVMl97x5VP?=
 =?us-ascii?Q?YnTV+GIli1xDZgJHP9Bo2+eXf7iIM4HZrwoXMnCT5JtA2zHvnZIJQJSeYxAW?=
 =?us-ascii?Q?8mhwEFUn5Eipu64xhL9wCIsiPX105QwDqwkdw/mamgbBJzz49cOgOLBPUHWI?=
 =?us-ascii?Q?P4FwvvdRa/M6CiBwpvGQMhGMayfw5lPK/0rociF8loWdaWdsXVlvL9K8uMeV?=
 =?us-ascii?Q?PA8a+Vt0vSQBbjfEoF8bjAiy/MA4vQnq/pesCdbB6HAENK+IdwGzssKvo410?=
 =?us-ascii?Q?ZUVXuEcTRABZVYFLkBo7dGP05N1NmIRRhPI5+OSfPxGT+afDoXzGivFM5D8A?=
 =?us-ascii?Q?O3eRV1ooNM6zWKsBRjpPB4WcWoQb+vYRoxtuWvQf44FTGoU0J8Eg2obCAATx?=
 =?us-ascii?Q?Uk6ngyD5lJP3vVJWxUgHCH/Uj8cN5p1tnAGV6c1+P94Kaebx0PjUZknP5Ink?=
 =?us-ascii?Q?EIUGzoohpKPmSWXlQIr5RvWnRfpkDIk/IyzBfPqoBPLOYMAsF4dA0QhZQyGi?=
 =?us-ascii?Q?cv3Cl2s4/vOa4qW8yRlXqAdkcVnNpYRW1Q4yHtx0nLl2Bxuyb0arxzjUnhOo?=
 =?us-ascii?Q?zTYWXn/XExdP1WlbjRDDYCftIGshiqWiJig8r4opAkVdQfuYpFjxBiOxKA5T?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a5518c-26ca-48fd-12a9-08dc5575d3ff
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 13:39:33.6755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j5tnVyBgAXiytEPZMOg8Ts2spPZWviDVPuiLsmZxGKeWro0IY2I9RJvupEXuFboAZKKTUVgil8f9jj5/+yq6b423cz60OREG/E4jHaBqhn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7977
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

On Fri, Apr 05, 2024 at 02:35:20PM +0200, Michal Wajdeczko wrote:
>We already have dedicated header for GGTT/PPGTT definitions.
>It's also cleaner to separate them from implementation macros.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
