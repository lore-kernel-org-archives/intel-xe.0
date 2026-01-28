Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFE8D46BFA
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 21:09:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07CB610E0BC;
	Wed, 28 Jan 2026 21:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fCCQFZDm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8AB10E0BC
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 21:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769634538; x=1801170538;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AflPjyfxDg9MAaBTD2ba/H+7vb/eOSqzUlmTVoUt6+0=;
 b=fCCQFZDmTMisEfqQh+CPIVvIu+Wz+QKOh8XOaHPXVvlrTEQL+TyMnzBk
 ZfYVFe6xA94kS0e72z2TY0snMcOuvW3yRDjjEBrBUZdC/9yNicJqTVy6m
 XYosB7DnEKo0MLJXqX/khIBxn+XlPzC/IfcQkgGt/JsYttETlfTYWkSI8
 92rtDc7e6ZUwY7zHvrj0flxDUt6+ccSjzaGiKg3Xo4lNSsuGvM+jeX7dB
 7v60jq0N0V+q60AnRABDND7hHZrPqdYuECOuqs4LzL7I9RJpmwE1J5ipE
 U/VK4mvtQ70tMaYXue2HbZRXAzaLMuLSZkYFRya5rmRgtUPWOJWw/0pbk g==;
X-CSE-ConnectionGUID: E+sE/bhbQS2XQldAsN1H0Q==
X-CSE-MsgGUID: 0PYdZuJgQ7iv10jtxnVY8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81589181"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="81589181"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 13:08:58 -0800
X-CSE-ConnectionGUID: H32MfmASRCabDOFgXAcitg==
X-CSE-MsgGUID: xmjQyYycQee4uPZutR5npg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="239627513"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 13:08:58 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 13:08:57 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 13:08:57 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 13:08:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mv3xhKrrXAFZad4LUEmk6Vln6gLgqDSvhyP3/5AsO6wjUBtVPaG9v48XCdL6QFd34Z2jl55EBi12HJgxpYc+jSThCjmW+st2EjLc4glqVnWsQmGERCk5cM+82+3wDeu3S79eXa0MeySbFgxJL0cXVYw4TvYggYntk+McpAj+Yq6ZGlkqi2BzingP62LI/nJGVQQEyKROOJc1fgAVzYbwFZosjc0ljOfer9rhkhlhcj6pykjQNb9pCvQPciYk7EYjVeCgnc37/681ETOw6CTFkHgl7Y4gwlRo0rP7eptHgQZMtpcX0G4BHwiqHTNsSE6rzR2HyFnyG7RdvJ+NDBdL9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osWg65Pmpm+cUNz24JZn8F//nL85UON5H+Kslh3UNfM=;
 b=McIKlIRGVrSRNPmsQYi0oLe3O7ZOynOJDV2GBZQx6y5qNx3NWfkoiq2WRRqTqjdm/5UOEV2R5ZUQ1RdHUbaY7d6vpb0HGZuev9ff7S7E8NZIrLTavDQ81aYKZpaeafiThRKPnGYs7TRW1M41/ZHmYdL8JBq/7ifAmrPomwXT1r9+UXG6qjACbI1Ct5YyANxYrrxiNOwNaGXAfJ2WxiN1aFgh1j8ii5QoBKNKMDlaRESfdkWm8r6RLHRK6ljZi7E+5s5nzT8U3oD/UjD1h3D+7cno2wZGA9yiMnbTkZNilaGw03ZMVVADrDvvN2g+6tGoOlXybKR/AAFlhcAGxBN7qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB6424.namprd11.prod.outlook.com (2603:10b6:8:c4::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.8; Wed, 28 Jan 2026 21:08:53 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 21:08:53 +0000
Date: Wed, 28 Jan 2026 13:08:50 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 10/12] drm/xe/kunit: Include hw_engines in xe_wa test
Message-ID: <20260128210850.GU458797@mdroper-desk1.amr.corp.intel.com>
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
 <20260116-rtp-mcr-check-v1-10-d420b9c1a327@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260116-rtp-mcr-check-v1-10-d420b9c1a327@intel.com>
X-ClientProxiedBy: SJ0PR13CA0139.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB6424:EE_
X-MS-Office365-Filtering-Correlation-Id: c29f5fdd-17a8-463a-b913-08de5eb170ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QPbu3M9xDLEvq6XX+bdqSqCcdfvVYgoqSWxPe+X/gAQEl/mQIl6zPzatd9Di?=
 =?us-ascii?Q?hlkZSKGnQD85hwjGk6RnJ/9FKuBT0xGhVVMwqVDXYzGwcyWMio4iwS1t+NTA?=
 =?us-ascii?Q?zbnTGlH5OWpvCy2WQrRsuZslyXG/MQ72tyPvnba7D58WQ/tATzgQE84MNGuk?=
 =?us-ascii?Q?kDev11cHkvXcBpGrMQoosZzgB/DOL7zK+bvKgSX8v28j9m9ocu2jCxlDNO+5?=
 =?us-ascii?Q?BgXxF5IHrA6LQlHeAGePuV8Ilbpu1AzX6MZilwq3WCHtoMRtXJJFgfmWQ8xl?=
 =?us-ascii?Q?5OmGyZ1XO+QzHylalnKTqqUsrHW0s6czKFR86wrb/petxciGz5MlDOrWsYIu?=
 =?us-ascii?Q?FCXyzocIkYLNgCYe8jfgrDWP0S08Frmd29GXXilGqIfll4KWFd9XKcG9MXYU?=
 =?us-ascii?Q?OgJNpjvDeYdieW9wPDpG2oAhMHpK8UaP1ICefotkEjR25iDH5+RDbxN0JJru?=
 =?us-ascii?Q?jQjk77z4XXBDdEejO9QXqoVaQ3udgQWobRBrjpjoyNXGjMDVyUF1tALJtRCa?=
 =?us-ascii?Q?5EF7CvII/iX2ho3k/e6QTawMgFRt3T+PrBFyR9efdgV8orUZStTtyI0BKnBg?=
 =?us-ascii?Q?DLKxhwTge/MF4w3SekaG1zyPJDiksyRq9Z3InbAqZZcsncOT58QfBcejusFG?=
 =?us-ascii?Q?aBGgAo5Vwp9qp4otRIqDWkpDfzSZnN9BaeW9I2GoANa1/bUez07GjMI39ILB?=
 =?us-ascii?Q?VH2ZE47rwurtrC419RmzExjhmWD1VVSTDiq7Z7PZjedt0JdwLVq8OqEJ4IJ5?=
 =?us-ascii?Q?CZKCyaxdUoAb1RUR4ROhKS//oeOLLzrjYdsGDETvyJLKWs4r2yUdD6lulqMa?=
 =?us-ascii?Q?s07V6jmlQyvvAB0wTd/2jxWQrQn8PtgOedKAb286dh8bjm4Tb+J4uatVfN8E?=
 =?us-ascii?Q?XQFSCKO//3jA7v9DDhv+UwJvKjXxfiX5cv80tcenGX1ALLJtULFhbRGG2hE0?=
 =?us-ascii?Q?knOtEFj+6MUf6QVcau6yR2XbClsb4ztV+mWtwwTQZb679U15af95D9IA8G+u?=
 =?us-ascii?Q?FM6KCAK1sC4/4hKf7pLusxDtBuI5zudwN5xOxyTo5jGNk5+tECuJH3ar2oSm?=
 =?us-ascii?Q?7K2O7H1YSVGtlaqkJFDWyaGfOsxZKj0ooZ3+rNK+uhDBwbb6CpYtp1LS7+/Q?=
 =?us-ascii?Q?TIhme3tJy9Nw0IwGv3p+GYtexkw+WKcrJQ9E6ptmbI/gD3yMM3gHPL4GMv8O?=
 =?us-ascii?Q?HiyyxkGe6KaL35prpCvhvsQ2LzAd61cClGgvyzc46iMuPtKXHUlpmgMYjno+?=
 =?us-ascii?Q?r/D7XhdaGALwBNWfiC6CTn8tqAIK5ug7+wUhxTIjT8eeTFxetQLu+gpixzoa?=
 =?us-ascii?Q?RWVuW5qGPuYIE4doRZfQn9GcxFDWHabqn1TVk7JkhKS0CWpHdXzU2/8DrdsA?=
 =?us-ascii?Q?ZwI7JgKx7/9TXYRFjWRsNTyGXY8Xyss+Fpvda30ulQXeJzMhIwbzc/qLDLm7?=
 =?us-ascii?Q?U9qLJs3e0VkIGw5U3+85ihM2IXKdxiiGqb8QfPlqNWImaEmYehnCDz9qMiz0?=
 =?us-ascii?Q?vCI4IicOk4TPn/MrU45jGlvjekN2j70TmjkXFy60fCyEOWxtr1WKNObxE+rO?=
 =?us-ascii?Q?F/dHkTkaXqUrHLrDPUg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GjH3eeHg/tmkCSdv3H7EXQMZLtzEs1XSyA7S6vUp1klj2luVNFQaK0+neKio?=
 =?us-ascii?Q?IUQMZHIYGezccvvsh9YU2wGlW8rOJ3neGvuwlIXx6qQeRoFmbHAtORQdP0SZ?=
 =?us-ascii?Q?uf+3zC8mtS4nwkuGVx6KL08shva8gHIpT9zfYspLQW7Y3RcISylbCEftzpW9?=
 =?us-ascii?Q?+D1kYfb49dpiDgLqqP1eR8a3B6Vslf4xXZfrgcyuV1L6pkIVLVbTK49dvljg?=
 =?us-ascii?Q?BumJfiomigXB4JK4qrXAd+m5NfYWfEI4CcRp0+yrpEfUbYpnIZ+WSnp/nYlx?=
 =?us-ascii?Q?RHav42V03HlzjvnrV6FCxwx0p3y1l3MM+cO+t9SQWntuL/QJ0ilZ3spduc6/?=
 =?us-ascii?Q?IJdRqZOkIYpSuX9Wb3LVq0oUyUg86/5g5iN1Q7/XNPimE9itutuyZNeBuN9e?=
 =?us-ascii?Q?uvZ5+gdR9nx7hGbUokjZjQzcCrGEnDs1uXwh3z13z0GO6MY5D44so8VInpaV?=
 =?us-ascii?Q?6B7CYZK/uw6eBbmNq8vb7PcQz3yXyes7pHfTuewvBIZmBTwY831ExcpAoHtk?=
 =?us-ascii?Q?EtZmdNbYECsb2bKYg+hpTSciQ4N5foJJCZlbGNAOaYu1EkrQee4NBGDjniXh?=
 =?us-ascii?Q?JYdpRAlr2M5pvf4JH03SgZLB/2WxfL1sKT9iOMUhVl9C8Mq2blexww5padsU?=
 =?us-ascii?Q?D82321UKq+kXcvYeHGZOf1ZXhqo6PFVpy9Q91Z1NROtK2Ny+b06jwyKNQvrc?=
 =?us-ascii?Q?aELoIBWz5VIe/WuoWtp39R3DP/9Mq4EIMnGDgFgyKaiHAtNzgd377EBWFFK+?=
 =?us-ascii?Q?FzuXXatCdeUcyHwJkPcfftJENkzp/UQqySmAanwRK0PKn5agCEepTFZO8wwy?=
 =?us-ascii?Q?VWkAmIne1JycgzZo8RN7KDSVdDeKZE3CxIxJ2OGdmIwl02jQ9Hv9vTAcS55h?=
 =?us-ascii?Q?0O1/+z4o6CSZJjlEuP5g20gHs6Mb3oOhp98L3BO313giMvG3UXPXTfqwVgqA?=
 =?us-ascii?Q?WVEhwj+UWrMcs6ePkfB0dnZUqCL22O0YcNA6DZO2emkqXqNfDuoCcdOGI1af?=
 =?us-ascii?Q?ettK/9v09QCdxkg/U7uvRrfz76Y3QwE+0TRp6ajA69/rTNgx3CAoWPDQDN4G?=
 =?us-ascii?Q?5h6UB/CJcRpxnQA+jZDdx0MsVkvN5xDIa+OjaospzrlSvlGuOr1hwjxiiasK?=
 =?us-ascii?Q?ebqhYNDhmT351iQbNAvDOzkf63S2KOGWCQQjecutQRuMQs2nn7vkBLuwxy7y?=
 =?us-ascii?Q?SmBVCK+/K3SUMnIF/5w0jgg4YUC43u2KvdsI+vKRCsA7nZ/WfWrKhenxbm5Q?=
 =?us-ascii?Q?otk6GNnx5NZZM5osC8CLi1mJvMN+4Dtx1w9A1FULMChruWJsuPOU1X43K9Wg?=
 =?us-ascii?Q?0dd12MXvJLlRHSOnTiJowhcPjyZb0+8/tqYDsJlE3ufHT1OveralLCTJineH?=
 =?us-ascii?Q?4Vtps3pL4Srngsn1IrP4Uz4j2WZp8GgnWrn8DHFgjpxcgDiSoc4r+b+DWGPD?=
 =?us-ascii?Q?tfW/8jLb+waJ39wq0zT7rzngsIQSCNVt4MwOSzOPzrlqMCzRmbZxpa76dFHd?=
 =?us-ascii?Q?3D1PPxHXXin49lx1tdMAWCb4knHirduR0Z72VUtx0+l3cvBV3Ty+8sN3YfOh?=
 =?us-ascii?Q?QY2ZSIGF8HlHdzCQ2DB/E296pDXv9qkKnOsmyBulgmZYA3c4dCIFRUDjROgW?=
 =?us-ascii?Q?dEPq0tfFTg1/BZ0efS2HCXujB0Q96zmzMwkV+JmSuboqesaAP081l6Nyhf1G?=
 =?us-ascii?Q?5+YyJ5lzz+i3AANdXwte07c43K1WF46tBEDWtIhK1QnECcx3XzOZIKZRobnR?=
 =?us-ascii?Q?utQIA2FwmGitmoh3z03vy7XmdVNFcFs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c29f5fdd-17a8-463a-b913-08de5eb170ec
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 21:08:53.2050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omY0/E951joqFMCNxRibk4ZxwD4oQygqU9b6u+sll8m4FlBwCwejNP7D1RzrHg2hJ9ISbRzD/ioE8YyZx8rvrnpBKd+ynebppjaGgHvHY/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6424
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

On Fri, Jan 16, 2026 at 07:12:18PM -0300, Gustavo Sousa wrote:
> For better coverage, include RTP to register save/store processing for
> hw_engines as another xe_wa test case.
> 
> Note that, since one of the RTP rules involve calling
> xe_rtp_cfeg_wmtp_disabled(), we need to intercept a MMIO read to
> XEHP_FUSE4 to allow the test to run without crashing.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

The read interception approach may need to be changed if you take
Michal's suggestion on patches 5/6, but otherwise,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


> ---
>  drivers/gpu/drm/xe/tests/xe_wa_test.c | 50 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> index 2bf6fab015cd..3311f05a6fc2 100644
> --- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> @@ -6,15 +6,34 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_kunit_helpers.h>
>  
> +#include <kunit/static_stub.h>
>  #include <kunit/test.h>
>  
> +#include "regs/xe_gt_regs.h"
> +#include "tests/xe_mmio_intercept.h"
>  #include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_hw_engine.h"
>  #include "xe_kunit_helpers.h"
>  #include "xe_pci_test.h"
>  #include "xe_reg_sr.h"
>  #include "xe_tuning.h"
>  #include "xe_wa.h"
>  
> +static bool xe_wa_mmio_intercept_read32(struct kunit *test,
> +					struct xe_mmio *mmio,
> +					struct xe_reg reg,
> +					u32 *val)
> +{
> +	/* For XE_RTP_RULES(...FUNC(xe_rtp_cfeg_wmtp_disabled)...). */
> +	if (reg.raw == XEHP_FUSE4.raw) {
> +		*val = CFEG_WMTP_DISABLE;
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  static int xe_wa_test_init(struct kunit *test)
>  {
>  	const struct xe_pci_fake_data *param = test->param_value;
> @@ -33,10 +52,13 @@ static int xe_wa_test_init(struct kunit *test)
>  	ret = xe_pci_fake_device_init(xe);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
> +	kunit_activate_static_stub(test,
> +				   xe_mmio_intercept_read32,
> +				   xe_wa_mmio_intercept_read32);
> +
>  	if (!param->graphics_verx100)
>  		xe->info.step = param->step;
>  
> -	/* TODO: init hw engines for engine/LRC WAs */
>  	xe->drm.dev = dev;
>  	test->priv = xe;
>  
> @@ -59,8 +81,34 @@ static void xe_wa_gt(struct kunit *test)
>  	}
>  }
>  
> +static void xe_wa_hw_engines(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	struct xe_gt *gt;
> +	int id;
> +
> +	for_each_gt(gt, xe, id) {
> +		struct xe_hw_engine *hwe;
> +		int hwe_id;
> +
> +		/*
> +		 * The early initialization also causes RTP processing to build
> +		 * up each engine's reg_sr.
> +		 */
> +		xe_hw_engines_init_early(gt);
> +		for_each_hw_engine(hwe, gt, hwe_id)
> +			KUNIT_EXPECT_EQ(test, hwe->reg_sr.errors, 0);
> +
> +		for_each_hw_engine(hwe, gt, hwe_id) {
> +			xe_hw_engine_setup_reg_lrc(hwe);
> +			KUNIT_EXPECT_EQ(test, hwe->reg_lrc.errors, 0);
> +		}
> +	}
> +}
> +
>  static struct kunit_case xe_wa_tests[] = {
>  	KUNIT_CASE_PARAM(xe_wa_gt, xe_pci_fake_data_gen_params),
> +	KUNIT_CASE_PARAM(xe_wa_hw_engines, xe_pci_fake_data_gen_params),
>  	{}
>  };
>  
> 
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
