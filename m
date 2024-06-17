Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15030C27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 18:19:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA61810E49B;
	Mon, 17 Jun 2024 18:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f1pDmUHX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE0410E49A
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 18:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718648346; x=1750184346;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ij3st37x1qD8lqv3n5sNmRRqvsaf1G5VCE/NUGwxqiY=;
 b=f1pDmUHXbMb6FPd59HzlGfpjVNt0NpVI/vDhoHE1Ic2LvsFFU5Q6/WEb
 Adx2Z7v8j3HMv3MvArakk9lDQbZOYtVq4rn/8rtIlnG7L4cjR04rdWZdR
 L+M/3m//vT7sJG848V+9aj5NHpsPQzw2u0uBFVM6eYMxv0jhWDb1l13TK
 KlILpI0wuMChcu2pCpZVWpJRa4309sfkWhnZqLre/XwlKLB8SZZHNTFcz
 SBxchce0UaWLQFBjcsu5ltaSoRuX3gPd2WLjHAKBXAZgF01exxneY1X9B
 f+9ygpCjdiunEg+GTjMagDES7O2IJRF6gZCnNfbQWxmQ6FG+xNN5XwbQw A==;
X-CSE-ConnectionGUID: Q2E2CtIVQGW+x/dsXHBgSw==
X-CSE-MsgGUID: FSl0aCDiQ2SjyJfzqZOExg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="19311304"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="19311304"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 11:19:05 -0700
X-CSE-ConnectionGUID: bBOzLg8eSPuUFL6LMR1KXg==
X-CSE-MsgGUID: iBCoYubnTXyG5MdB1xoBOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="41366774"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 11:19:05 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 11:19:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 11:19:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 11:19:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsKSL8bRTKsIr74LiUOqpJBTiqLO+PCdOVuhamfd2D3ILLxr9bgjMuEAfMCslBwS0ubXB2R090cXDGf6OpZ5iBBroW/YWW4DlAjCRMI2aIaemuYZPT92OTBSWlUUiiRoHZPeYi4eNt6O3p4YhEHCt8680ugp7E9QUNkf3SHTqrwA7o/nOyBwp6CMs79w7h2YpNwx1m41uPK3HrTaUKWfSZjugW9H7QYrK34xnxj8tIyVeyiJXPYGk7bi+/xuWj58EE0U8wl+VnB1+ER9fmVfjDr0gqDOq3QDjddokE/lYO4mmgubbhsSalaEyPE3PlzwJRXFXReki4ZR3Qc3IOmqDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8X0fAA3wLRu1FIs2eUQqi7jDA3K5oI2CZPTP0B35B4g=;
 b=aSgfn6A8ATQfdOjVQlhV7DDHhFW4ADvQHR21gt/oKrKM4rm0LeuK81tO0YRrUy8mg3dbqacSvXhjCB/pFirEueKYdizKesrpYmPcpdw3mAy2Rcs6l4v0WxW22Hsms8PpLvZ5K9hu7kBHZmi7Yeer8soQhIa+wSzX8We/kWTWTOTCBP1V/IB93f81k/clS4XxPZg7PHgsrjXhp/YNWJ+BqRo+cz4Jc35JIOylLV8LSMi2YWvW1oWQVJlqJF3B4e+eV+fk0JDlOTrhBQRwLZdrOLyRw6snQOqNIeSFWmoRYw+rB+FkrsUieMN3wuHtxFlDkyOBC4rgrvFivTiANSjzsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 MW5PR11MB5884.namprd11.prod.outlook.com (2603:10b6:303:1a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 18:19:01 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 18:19:01 +0000
Date: Mon, 17 Jun 2024 14:18:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/2] drm/xe/lnl: Apply Wa_22019338487
Message-ID: <ZnB-EfZZ8A6pCzU1@intel.com>
References: <20240617081051.3340442-1-vinay.belgaumkar@intel.com>
 <20240617081051.3340442-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240617081051.3340442-2-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::12) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|MW5PR11MB5884:EE_
X-MS-Office365-Filtering-Correlation-Id: 05bd5cd4-2605-4e51-b5d3-08dc8ef9f66d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NNZCyuPivhqRiYjpHBVOQ6VQ8u1q6Znu7X3nN51h79GxR8S2iuEfpU0a9dwN?=
 =?us-ascii?Q?+CmV8r23FO0ZF37C4OOjqCoO8HVLoJ5zK7Jqy1uGXgpwI7bG6BTZ0wi3wCK6?=
 =?us-ascii?Q?4i1uhzMC5y5uxLLBJgSvSLJypTwazD1S1EGijmRaRh6b9Ls82MzBW7xe2sRS?=
 =?us-ascii?Q?VadRB9hDkfbhqQYSTnRMnlX1Gc9hnK+oODKhQCmsY04gl00xByS5EvMDdL0o?=
 =?us-ascii?Q?xPbVvhFnii0O1WShfoYZFb1fpowINR5VjjIhcdhBTe3+VmVj58bE1l8COSrV?=
 =?us-ascii?Q?18EMF5A0NfsL9k8p0+Ua+3eGC9GexTEYlu9JMeoFHtyDxj9rTVsmYYuQPnuO?=
 =?us-ascii?Q?/3dKf8FhUejwwHHScSTwHrT/SwBwWoAuwa3WLc+0B0WCove8U25L0DWrsbT5?=
 =?us-ascii?Q?CEybxGBrQ8yxWAYkX8zlOrO9J7SL0pHjl0wLlTj3X6iOCihKRnCHunERN5sB?=
 =?us-ascii?Q?aiGbiEGv++hlZIJSognP2wCec/tGLDWMMC2F8ERGzScn6hIZXnHjmsPb50/H?=
 =?us-ascii?Q?Vzl9/cn54BoOlek/5pPRjnQPcuK3EWt3ZkBwaS4+5TcoI5LG1NML4hVeq7WQ?=
 =?us-ascii?Q?PluDgnsRcXzuoJdL1ezw32dse2s26VV6crJyYMRkO3TXFkiqVyDCYxP0ivMK?=
 =?us-ascii?Q?N9KZN+AYOR5z6x3kYNHdiZ3LBO6JbAhAyV01o8yJc7eeyX/8vIPgW/N0Impu?=
 =?us-ascii?Q?6cuNAle4/Pl/q80Y4R3tS40+F9KDldJYGW+sfiE0VgljlRLrfZ7Mi38n0fYG?=
 =?us-ascii?Q?gpfpKIv6VqUKRxhFzFg47sdUdwb2eElHNpnBwGEEm61J6/bfcF7Y8kxjBiZO?=
 =?us-ascii?Q?qvXFZejwUQtiJAYl9Vj2jKH0gKXJApgWjuu44hAgGFXZUqenevguDUGwMa/n?=
 =?us-ascii?Q?ShIAJ/kqxym6LSbrpeXO3P39TahiTJYtzzkEgtEK63VBPy9vS2f5vj/B+Guy?=
 =?us-ascii?Q?TpJbtBZkr8m8Re5MFn/CSvVLP1+YnVJCZ7tUrAgimCtuLd3eZvntd8Qc2LC3?=
 =?us-ascii?Q?wlrS1EN0dzwSlT3PINTCLoSVZSrjZw+0H1qBn/40zDWEovlcxLx3Q4EPSq9b?=
 =?us-ascii?Q?pN1yNxbxRFgnwbFj3RyuMqLbybmACBXM2uoEHW7+XSbE76hbH5QgIj5+EksC?=
 =?us-ascii?Q?DrnTUWER4T7TSdAsImmV779miNgLkOw9fdMI2XeowWlmOg/xfXmDK5c2tXv1?=
 =?us-ascii?Q?rwDTvO1nWUyqUO8BGgBM7eiA403+OloOzRhxumnMfeFVzQt8SYx/REZPB3Q8?=
 =?us-ascii?Q?uhQntl+ALcAYPXAMQVIH8c/gZJQKWBXmcDkRW55EtXrFG0lKYrCcq6Muv3dO?=
 =?us-ascii?Q?+uXhRhxhD2b53MQuGxFf6EeF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OV061oRVcf6wtnVjrMRMr2uht4R1FlBcQOo0tJhrqqzi4JvCaq/Mi2Zo64p3?=
 =?us-ascii?Q?XlF8LFTJJwiuVM3arHMHaNW3Rj85YJHMXAIwVd4qI+6zCzAVbAl6Cmzm1STp?=
 =?us-ascii?Q?7WLnWPJw8/pFPrUV0NgCPQJ6DrgiQ3go2b56FLcLveObsKWjEjERiK0x3oZ2?=
 =?us-ascii?Q?AuGlvKZuLbszWzQn+rNehnWjRJwrZK+xLYTxL0k32y1wZP+9fZdFZ3KEL9Ka?=
 =?us-ascii?Q?+ugxyvcnMQtKMNj6IwofV5Wy0TIuy3z0ncYF2owDdL39/Qa1K/zVOtCnTP0t?=
 =?us-ascii?Q?UX5erybeDsJHEBFqgsKMQhhYhahqoXuZM6OqDzKFAIsoR0uK595LXJwumd5D?=
 =?us-ascii?Q?yB7aFd0QyQfsQgQ6NDU2MLX9zXI3eSb/qpnnWH1n2wf7afFzPiN/X+bBUbF+?=
 =?us-ascii?Q?+OLvPQLiqaK3S1Opqzzh8zE8luPr8d0ZBpRHGZRqYMA8FYPsG6SA8zCGqFa7?=
 =?us-ascii?Q?GhIyOXIT8H640QB1afovipiahyJQnE3g/QGAPc4TbBCwsEoo+42tbk56dzEe?=
 =?us-ascii?Q?lbYl47lxLsq98cjy1sHk/9EYx9F1Qvu3i8ScSfrz52kRxdKG/EAN7olwSPaq?=
 =?us-ascii?Q?xsQOfI2pbuiNO2BltD7ttIJE5mGjS1Hj6L2sgKbUYs4cYoSR5Zgk9gYOzc/W?=
 =?us-ascii?Q?A/Gy2GpCkA3PoR12AJDlwplxUR7lXnwjT6bx8Q3PrpWJuovEFHU/y6yx4pS3?=
 =?us-ascii?Q?1FknDKNcE/NDHSRTSY7MRJNDI/LN+ssqzwzkIC+gYJ8CM7dFqvE8AcQqcsm2?=
 =?us-ascii?Q?fVQRWR6G72QLESkt5Fc3HXXbfHNLHRln/TtdYW3G9+Bofaar0FteVsDzlmUq?=
 =?us-ascii?Q?f8UHxuzWeQgIPs4vQ3JvL5wTzaZi6+CKw3kdrmuvlkxTq2ARFeNoNiAkKfoH?=
 =?us-ascii?Q?lEFepdnZNYoKBGe/BG0OUhu/RBNWG20+cCEZaMfuGKWzFSf6C1N7NCG1MlOK?=
 =?us-ascii?Q?72oQRJMlrVVDj2vCnl+k0GZr3443+Tmx3CPo69VBSGmTxSShPJGyiIJoPESa?=
 =?us-ascii?Q?StmV5TbokzIbMDMLH6lfR2EQaZj+wRQwDNxNjOAt+sNyH0FOeswURXzRDD++?=
 =?us-ascii?Q?/5YX/A/2qx9l7s9xQOKX7z/57AQc1vMNwJZlMaxNC+gS/Fo+E2oNz9+QVWKJ?=
 =?us-ascii?Q?FnJA8d3cD+5hIHDsGY/sPnyKbIBrEDIb+aA9OAPgA54E0As4VB2iKldz5ypA?=
 =?us-ascii?Q?eITVSxfg5Rmo4Bq7jEPgrAGyv3G2JnQV4RCudSAhh5L3ZQia7NUOUlJGnqOn?=
 =?us-ascii?Q?HYbUs8mngqQE1iTQv/j3uN54R5YonYXyBsQsTETgH0syp+iSp3H8EAsDnZsi?=
 =?us-ascii?Q?qU2As5Lr19spirN9QMxTS6ABpYeYee/ZCoRj6KYQdJRcsCc8pF2WRQHlFv4N?=
 =?us-ascii?Q?5RwBP0pboLUZ3FSbs0U/WkmSdVL9kzFxquH1zurJSuZTQk8ziDLDAGaDUK8z?=
 =?us-ascii?Q?O71DdKwWFO+6AbJa95un32LVKVV/9AGmjf6xim8HfYuDNS2oGHmKUq4U958y?=
 =?us-ascii?Q?m2HIVwR8lEyh/GGdEwDPyGagcFvxsSNOBwvhNFdlTltMcDEo7IndN8AT00EJ?=
 =?us-ascii?Q?RJo+dVV49+vFhfLjCha4GeeqtTPMDnTjtpJgaw0G?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05bd5cd4-2605-4e51-b5d3-08dc8ef9f66d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 18:19:01.5331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OuyBvYoMPCCqXcJiPZwi5/d3rWG4cJOWAy9kyUCWBFJCYYEGgUaMu1e33KbOvK30J0qx50noATxPs/zTe/hnVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5884
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

On Mon, Jun 17, 2024 at 01:10:50AM -0700, Vinay Belgaumkar wrote:
> This WA requires us to limit media GT frequency requests to a certain
> cap value during driver load. Freq limits are restored after load
> completes, so perf will not be affected during normal operations.
> 
> During normal driver operation, this WA requires dummy writes to media
> offset 0x380D8C after every ~63 GGTT writes. This will ensure completion
> of the LMEM writes originating from Gunit.
> 
> During driver unload(before FLR), the WA requires that we set requested
> frequency to the cap value again.
> 
> v3: Do not use WA number in function name. Call WA wrapper from xe_device.
> Rename some variables, check for locks in the correct function (Rodrigo).
> Ensure reset path is also covered for this WA.
> 
> v4: Fix BAT failure
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |  2 +
>  drivers/gpu/drm/xe/xe_device.c       |  3 ++
>  drivers/gpu/drm/xe/xe_ggtt.c         | 22 +++++++++
>  drivers/gpu/drm/xe/xe_ggtt_types.h   |  2 +
>  drivers/gpu/drm/xe/xe_gsc.c          |  5 ++
>  drivers/gpu/drm/xe/xe_gt.c           | 24 ++++++++++
>  drivers/gpu/drm/xe/xe_gt.h           |  1 +
>  drivers/gpu/drm/xe/xe_guc_pc.c       | 71 +++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_guc_pc.h       |  2 +
>  drivers/gpu/drm/xe/xe_guc_pc_types.h |  4 ++
>  drivers/gpu/drm/xe/xe_wa_oob.rules   |  1 +
>  11 files changed, 136 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 1905a80e61e3..8c72fe38edfd 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -24,9 +24,11 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
>  	$(call cmd,wa_oob)
>  
>  uses_generated_oob := \
> +	$(obj)/xe_ggtt.o \
>  	$(obj)/xe_gsc.o \
>  	$(obj)/xe_guc.o \
>  	$(obj)/xe_guc_ads.o \
> +	$(obj)/xe_guc_pc.o \
>  	$(obj)/xe_migrate.o \
>  	$(obj)/xe_ring_ops.o \
>  	$(obj)/xe_vm.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 94dbfe5cf19c..fee90f66246f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -668,6 +668,9 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_hwmon_register(xe);
>  
> +	for_each_gt(gt, xe, id)
> +		xe_gt_sanitize_freq(gt);
> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>  
>  err_fini_display:
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 8ff91fd1b7c8..e3fddd59fd9f 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -11,6 +11,7 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
>  #include <drm/intel/i915_drm.h>
> +#include <generated/xe_wa_oob.h>
>  
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_gtt_defs.h"
> @@ -23,8 +24,10 @@
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_map.h"
> +#include "xe_mmio.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
> +#include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
>  static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> @@ -69,12 +72,31 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
>  	return ggms ? SZ_1M << ggms : 0;
>  }
>  
> +static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
> +{
> +	/*
> +	 * 22019338487: GMD_ID is a RO register, a dummy write forces gunit
> +	 * to wait for completion of prior GTT writes before letting this through.
> +	 */
> +	lockdep_assert_held(&ggtt->lock);
> +
> +	++ggtt->access_count;

probably better the ++ as suffix since you are not in the middle of any check
where you need to increase before checking.

> +
> +	if (ggtt->tile->media_gt && XE_WA(ggtt->tile->media_gt, 22019338487)) {

This doesn't look right... it looks like we are counting all the tile0 as well
and updating the tile1 always.

I believe we should have something on the beginning like
if (!ggtt->tile->media_gt || ggtt->tile->media_gt != ggtt->tile->gt)
   return;

then do all the operations directly on ggtt->tile->gt instead of tile->media_gt

> +		if ((ggtt->access_count % 63) == 0) {
> +			xe_mmio_write32(ggtt->tile->media_gt, GMD_ID, 0x0);
> +			ggtt->access_count = 0;
> +		}
> +	}
> +}
> +
>  void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>  {
>  	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
>  	xe_tile_assert(ggtt->tile, addr < ggtt->size);
>  
>  	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
> +	ggtt_update_access_counter(ggtt);
>  }
>  
>  static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> index d8c584d9a8c3..73fe6837b9cd 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -34,6 +34,8 @@ struct xe_ggtt {
>  	const struct xe_ggtt_pt_ops *pt_ops;
>  
>  	struct drm_mm mm;
> +
> +	unsigned int access_count;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 80a61934decc..f8239a13fa2b 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -22,6 +22,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_printk.h"
> +#include "xe_guc_pc.h"
>  #include "xe_huc.h"
>  #include "xe_map.h"
>  #include "xe_mmio.h"
> @@ -284,6 +285,10 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
>  		return ret;
>  
>  	xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
> +
> +	/* GSC load is done, restore expected GT frequencies */
> +	xe_gt_sanitize_freq(gt);
> +
>  	xe_gt_dbg(gt, "GSC FW async load completed\n");
>  
>  	/* HuC auth failure is not fatal */
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 57d84751e160..301594d1e7a4 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -9,6 +9,7 @@
>  
>  #include <drm/drm_managed.h>
>  #include <drm/xe_drm.h>
> +#include <generated/xe_wa_oob.h>
>  
>  #include "instructions/xe_gfxpipe_commands.h"
>  #include "instructions/xe_mi_commands.h"
> @@ -54,6 +55,7 @@
>  #include "xe_sriov.h"
>  #include "xe_tuning.h"
>  #include "xe_uc.h"
> +#include "xe_uc_fw.h"
>  #include "xe_vm.h"
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
> @@ -678,6 +680,9 @@ static int do_gt_restart(struct xe_gt *gt)
>  	/* Get CCS mode in sync between sw/hw */
>  	xe_gt_apply_ccs_mode(gt);
>  
> +	/* Restore GT freq to expected values */
> +	xe_gt_sanitize_freq(gt);
> +
>  	return 0;
>  }
>  
> @@ -801,6 +806,25 @@ int xe_gt_suspend(struct xe_gt *gt)
>  	return err;
>  }
>  
> +/**
> + * xe_gt_sanitize_freq() - Restore saved freuencies if necessary.
> + * @gt: the GT object
> + *
> + * Called after driver init/GSC load completes to restore GT frequencies if we
> + * limited them for any WAs.
> + */
> +int xe_gt_sanitize_freq(struct xe_gt *gt)
> +{
> +	int ret = 0;
> +
> +	if ((!xe_uc_fw_is_available(&gt->uc.gsc.fw) ||
> +	    xe_uc_fw_is_loaded(&gt->uc.gsc.fw)) &&
> +	    XE_WA(gt, 22019338487))
> +		ret = xe_guc_pc_restore_stashed_freq(&gt->uc.guc.pc);
> +
> +	return ret;
> +}
> +
>  int xe_gt_resume(struct xe_gt *gt)
>  {
>  	int err;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 9073ac68a777..1123fdfc4ebc 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -56,6 +56,7 @@ int xe_gt_suspend(struct xe_gt *gt);
>  int xe_gt_resume(struct xe_gt *gt);
>  void xe_gt_reset_async(struct xe_gt *gt);
>  void xe_gt_sanitize(struct xe_gt *gt);
> +int xe_gt_sanitize_freq(struct xe_gt *gt);
>  void xe_gt_remove(struct xe_gt *gt);
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 666a37106bc5..d9194328b495 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -8,6 +8,7 @@
>  #include <linux/delay.h>
>  
>  #include <drm/drm_managed.h>
> +#include <generated/xe_wa_oob.h>
>  
>  #include "abi/guc_actions_slpc_abi.h"
>  #include "regs/xe_gt_regs.h"
> @@ -24,6 +25,7 @@
>  #include "xe_map.h"
>  #include "xe_mmio.h"
>  #include "xe_pcode.h"
> +#include "xe_wa.h"
>  
>  #define MCHBAR_MIRROR_BASE_SNB	0x140000
>  
> @@ -41,6 +43,8 @@
>  #define GT_FREQUENCY_MULTIPLIER	50
>  #define GT_FREQUENCY_SCALER	3
>  
> +#define LNL_MERT_FREQ_CAP	800
> +
>  /**
>   * DOC: GuC Power Conservation (PC)
>   *
> @@ -673,6 +677,16 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
>  		tgl_init_fused_rp_values(pc);
>  }
>  
> +static u32 pc_max_freq_cap(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +
> +	if (XE_WA(gt, 22019338487))

I'm afraid we are missing the check to be sure that we are in the media gt
here as we...

> +		return min(LNL_MERT_FREQ_CAP, pc->rp0_freq);
> +	else
> +		return pc->rp0_freq;
> +}
> +
>  /**
>   * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
>   * frequency to allow faster GuC load times
> @@ -684,7 +698,7 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
>  
>  	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>  	pc_init_fused_rp_values(pc);
> -	pc_set_cur_freq(pc, pc->rp0_freq);
> +	pc_set_cur_freq(pc, pc_max_freq_cap(pc));
>  }
>  
>  static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
> @@ -740,6 +754,53 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
>  	return ret;
>  }
>  
> +static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
> +{
> +	int ret = 0;
> +
> +	if (XE_WA(pc_to_gt(pc), 22019338487)) {
> +		/*
> +		 * Get updated min/max and stash them.
> +		 */
> +		ret = xe_guc_pc_get_min_freq(pc, &pc->stashed_min_freq);
> +		if (!ret)
> +			ret = xe_guc_pc_get_max_freq(pc, &pc->stashed_max_freq);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
> +		 */
> +		mutex_lock(&pc->freq_lock);
> +		ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
> +		if (!ret)
> +			ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
> +		mutex_unlock(&pc->freq_lock);
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_guc_pc_restore_stashed_freq - Set min/max back to stashed values
> + * @pc: The GuC PC
> + *
> + * Returns: 0 on success,
> + *          error code on failure
> + */
> +int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
> +{
> +	int ret = 0;
> +
> +	mutex_lock(&pc->freq_lock);
> +	ret = pc_set_max_freq(pc, pc->stashed_max_freq);
> +	if (!ret)
> +		ret = pc_set_min_freq(pc, pc->stashed_min_freq);
> +	mutex_unlock(&pc->freq_lock);
> +
> +	return ret;
> +}
> +
>  /**
>   * xe_guc_pc_gucrc_disable - Disable GuC RC
>   * @pc: Xe_GuC_PC instance
> @@ -854,6 +915,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  	if (ret)
>  		goto out;
>  
> +	ret = pc_set_mert_freq_cap(pc);
> +	if (ret)
> +		goto out;
> +
>  	if (xe->info.platform == XE_PVC) {
>  		xe_guc_pc_gucrc_disable(pc);
>  		ret = 0;
> @@ -902,6 +967,10 @@ static void xe_guc_pc_fini_hw(void *arg)
>  	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
>  	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
> +
> +	/* Bind requested freq to mert_freq_cap before unload */
> +	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
> +
>  	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 532cac985a6d..7ba875c3613b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -8,6 +8,7 @@
>  
>  #include <linux/types.h>
>  
> +struct xe_device;
>  struct xe_guc_pc;
>  
>  int xe_guc_pc_init(struct xe_guc_pc *pc);
> @@ -29,5 +30,6 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>  void xe_guc_pc_init_early(struct xe_guc_pc *pc);
> +int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc);
>  
>  #endif /* _XE_GUC_PC_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> index 2afd0dbc3542..13810be015db 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> @@ -25,6 +25,10 @@ struct xe_guc_pc {
>  	u32 user_requested_min;
>  	/** @user_requested_max: Stash the maximum requested freq by user */
>  	u32 user_requested_max;
> +	/** @stashed_min_freq: Stash the current minimum freq */
> +	u32 stashed_min_freq;
> +	/** @stashed_max_freq: Stash the current maximum freq */
> +	u32 stashed_max_freq;
>  	/** @freq_lock: Let's protect the frequencies */
>  	struct mutex freq_lock;
>  	/** @freq_ready: Only handle freq changes, if they are really ready */
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 12fe88796a49..a6b897030fde 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -27,3 +27,4 @@
>  16022287689	GRAPHICS_VERSION(2001)
>  		GRAPHICS_VERSION(2004)
>  13011645652	GRAPHICS_VERSION(2004)
> +22019338487	MEDIA_VERSION(2000)
> -- 
> 2.38.1
> 
