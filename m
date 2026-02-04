Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43320EA7941
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 19:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1CF10E1FF;
	Wed,  4 Feb 2026 19:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PQjFEoNz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FA210E1FF
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 19:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770233708; x=1801769708;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yMQDGbB1P+2jC2aqfwhmqeWgiiQ+J6+fYRMTGuJl1QA=;
 b=PQjFEoNzs1u5ndnw35ZuCVqSMJ5wf5cje+EeG1ds3SLECbWrl7UiNKzI
 0JhlDsna+iqszakBhxP+qMT6wMSsSB1o1go4Wf2+lmvJZtHwMI5itTvV4
 azAe3P6bLF/8KXqGp6hFtSn3cOD1VNSoafQzg+2IGkWVGhgBx6qWkO3hV
 sIA2znu7YtNDT+kBaHaslB937M48VPKKTo/AF248JhWhIlC34vNVBCa35
 0W1bx+K2jAWYsHZ3nbwOpN8k3uKWH3xoGZ0zMm7+MM5wFb+d0mwm0M9xs
 cf0iiDBLUQx01LHpklxLBpeSmhAXOOs00TgIdF1u65AAkefocmQlcrn5i Q==;
X-CSE-ConnectionGUID: kKDj1NIYSYOYwpPqvAiYIA==
X-CSE-MsgGUID: XeHSeYSdSGCZA9WutCBQFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82864585"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="82864585"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 11:35:07 -0800
X-CSE-ConnectionGUID: L0SHwGRcSUCbZHiV1gCmQw==
X-CSE-MsgGUID: uNbQ5O2gTl+AIfptV8nFxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="214749718"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 11:35:07 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 11:35:07 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 11:35:07 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 11:35:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMMvbOoXx+DADFNIhy/sQeXY9FKKxT26FujnR3Mpm59RrbBvruCaGWYHb8f7VCVqKiRSK0nDX0ghQpC5EBotOZfb9Pm7qbNoCRox5BwAzO7LfiY+IFEqOSpvaVD6ZqZ1ShQz4FNiTLDGDGlUX6qQIZ9UYsodHMePoIXscinuk+em7D85mP+lONiLS597M2RlT3fSZpKQ+G2/cLE4zwa2t6XMmWo1v79KcHfn2rs4/uc/qj+zbdV02+OkU3gztAbU0LVXkYJ7+ltL63jLZG0cc9F5ZpgLSfpznKdkpxPKqQLVzm9LfwuQsZJ86yBJOVhgejgFiOlb2rYL0YHKkxLTiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7EjBa69clLGF5sWLcdJMj/0ydCgnMRwCozMXX4XyIn4=;
 b=rsHYhhhEZ2EnSRiPelQlGwXyKrYFG+gue+TX0LEdjtMtWtamvb+wN4WI4HFOwQRNA4+b/DeIAPx+7Y4CEOhjQDjkqEf5Bi/gHS/clk5ruYMKO82ceoV8PviJfio3wBDaYQS4ph4CgNjacAMLYAGTbxNFE/anJRm6+WxLKmjS6hYNkFLKSldUt7bHLu2NvHkM9lLhGvK9IvzQPtrH0sBdJA7so0yzfsXQ+vAsytV6QXKLfnNs0AqBC4dptrLcT5E+GlEAf0ZZsritb83PguWTjpp2DLCqlmLnRs9SaQHw3nJ7bOqeg+ROYQvsaS4J3NQStPZTysveWG+bq3ghQM8uFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by BL3PR11MB6459.namprd11.prod.outlook.com (2603:10b6:208:3be::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 19:35:04 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%3]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 19:35:03 +0000
Date: Wed, 4 Feb 2026 11:35:00 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Drop unnecessary goto in xe_device_create
Message-ID: <aYOfZKjaGufsbN/+@lstrano-desk.jf.intel.com>
References: <20260204191025.3957211-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260204191025.3957211-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::27) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|BL3PR11MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: e6ca4c1f-5be4-47e2-4c19-08de64247e67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xz38ebt4L6CVt6vgtCLk/4NQ54cLaBXN8VVExD40dXMqhDPYOhjoD0yLb4B5?=
 =?us-ascii?Q?hyEPDOqYj4e/XqjUmO3/0x39x3QnYbb1qyccyy6bQ8eWFxbw4Xsmn3v+Gibu?=
 =?us-ascii?Q?p7Am/2ixbA+djEadq8kFfWebajWwOjHmp6UGR2EGq5m0+O0qrx4lXWN7hEdI?=
 =?us-ascii?Q?aSgCXuEOfxdYTijLErCy1ZeG/BjVISakIGQEdzKeHleOFrCSwUdS3zBtFefr?=
 =?us-ascii?Q?dXw1Ohgn5ltIhFsn+NcuOQS06pcxXnIp+Gzr6LRZjz1dyJ+RlPmpT8y8WOYc?=
 =?us-ascii?Q?/dCHKcTWjwABSiXVIg5OFWrRmQ5ZPvwnpaXPMxPOpP9lBlizK078CgEGeJYR?=
 =?us-ascii?Q?Pf/rYteGIfNMc4o12NnmcB+HMc0BLpZkF/Vc9aJg3H70BOIlbsc15Y0v50aB?=
 =?us-ascii?Q?YZc/XgM0szxL8xMdH8ancJMe4BZ20ldUy/nOPb5uXkXqHIl2IWTHtVsoAlWS?=
 =?us-ascii?Q?HBXLyrwB5KhZJWGSHCL595Db2r+2M0juqENi3dMD0Eehjdqjiu6B0KboQbVY?=
 =?us-ascii?Q?mtF+EFHfuZXLTi0I2jG3jIMVnJZxhiqLXhCDqy2wf1I3AzfW27yjxAuHUQ7x?=
 =?us-ascii?Q?s958w3yRogdKQna9T/FXVQDnAmxRfHsFM62IZ8RSE6ubMPxnt4IMPw05N+bE?=
 =?us-ascii?Q?CM7UqukELwoleRtf83Zw3r7dj4JiQmeVBJMVUr1O9LFi7jC/JmZyHTtjo3Rv?=
 =?us-ascii?Q?xWFI8r51h9Ibox63o9zaKjopEmwtp93W9jkbKUBFRvGU1cTYgE/Hjh68xQFD?=
 =?us-ascii?Q?LZ94lqv7HTXvUFe86aezGANf2GCgKvAJqjbNY2J32uS7xcdLXEsyje0oV+z5?=
 =?us-ascii?Q?a4B4ROqmopcm2o2aX/JissxcKcm6K3dwmnTw+p5MtgnLBz92XZouhhYwn0Kj?=
 =?us-ascii?Q?plWOAGS41n3ejdJpzu2mhRQJMt0D7RChnSsTJXT+NTyMWkp30IB3dzGKU3ng?=
 =?us-ascii?Q?jcePQ+uGxUuz98J0MU0eaikD4NzOcV/tFuLl1q57fZQ1Z2zlRAWAKyM3P8ol?=
 =?us-ascii?Q?kRqISWXLy9d9eHNU2dz3uWWLTGmudFmNnb3FRwbfsEHAPEmrgxHqLb4wKul+?=
 =?us-ascii?Q?gQW4cDaHtLD+biTU/d2gXE07TspHXk9c938F6uBC7m8QeDwRg9LpKRu8frsL?=
 =?us-ascii?Q?SnTbA/1j0TgkZc0sSNe/6aVAUd9F61DIHwK2KAroRAKabWhw6YPFJysOK5N1?=
 =?us-ascii?Q?JkZ3/9BcGsqoNZlzjxRpZaL2aIU3B+tIb9HqZ0Fkxy1X3xUCCMPQfWc64PYO?=
 =?us-ascii?Q?XcSP3YH2bAEtz7Lm+uBNdv+R6TA7lfLoporqFxUTyh61xV7LKOV982A2NCaR?=
 =?us-ascii?Q?PyyXafZJApyA4jd0Nn6T+peajBkFicHZAaXyIoLEX4dOkDlrrzzBGLrFmBr0?=
 =?us-ascii?Q?qGzsFM0iJuF4dkicm+SYmrifvM3GX5RUyRU5jZSvaOv2zOuJQ7+q4b04rdvk?=
 =?us-ascii?Q?2EoCIwRC3Zz0PbBhDpmCxki2u0jyX9y5//grKLqBEUAf6PjJK2WU30quqftD?=
 =?us-ascii?Q?yz3f3PDjbVUBEAmJoKJ65XquOHpm1xBFNSA8NC/jMj7Jzm0s2/QheZyZn09A?=
 =?us-ascii?Q?jeczbrd4Ff0TC7eT+0M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wAqcSYjlKTvkJSFvBmB26aYfVK6foQW2VX52wa+aVI0WP7SevhcYuV9wdoeu?=
 =?us-ascii?Q?MKMWAoj2X/LmLbstLpB1XnvoMT+GS//km2EprcaDgNSYY5hVkr/hyEvjeDI+?=
 =?us-ascii?Q?15774PgW40KMdIMn1NXju+SOGgxQIR44JYjtN0f+lPVIpi477y8+tlrFRk2U?=
 =?us-ascii?Q?0Y3ZshPph7xk2qCCmPSwHsKFqqFq1qJCifrp1NUP+iJmZmibvuHSHlASAbWe?=
 =?us-ascii?Q?nIox0frfpy5Z7ho/BW2LuT9rMqEsVHtStuuYgJteOu05CrHbX+wH6SaedYyt?=
 =?us-ascii?Q?V6Yc78r8y+rukVtrN0yo29WHiWsN+eEoMb+eJKtCnChDtotVtDQOH8JIxP1r?=
 =?us-ascii?Q?cJRsJUQPfGZJumx40UFoluRmKd/SBrEtrRTXAfROA1mGWjSATPC8KiR6oTmb?=
 =?us-ascii?Q?PVnMkN00SXhkBIsfqzcaKkRQ1wz55yAbDA5vbQpioOvTxtEyn3HNJxcoeefL?=
 =?us-ascii?Q?pBmGv8YyEQ2fnHtaNW+B8+NP3uiHUB8162gGIwmHXTexoUr2NDc0qR2K54iw?=
 =?us-ascii?Q?AMzPFGOQAI2tH2j9ZqeWiJQ62TNw8+FXMCgHDyaYJJKXK1f8J8kc046zo+W+?=
 =?us-ascii?Q?U+3QfBtepTvqFSRoRUZbl3ce1FfVjZhTRd9vSsLhZx+cCL8t+yBsO/8dXnLy?=
 =?us-ascii?Q?eO4x01HdhaeDCucnHX/CRttVurTqTTonip7hLa8WsVn6JxH2Z8UO9jkRoTll?=
 =?us-ascii?Q?ULsGpRuc5AcNnDvPoLhjz5A0vYIsvnvhNnf4g6UWO0+LkjNU53zzI9EHVOpq?=
 =?us-ascii?Q?RjGBAaMRQMGpfaSAScaVZMozUPS3RTpoVjiCbi87gv3LulTpFiYA9BGTJDcq?=
 =?us-ascii?Q?wlRY+DSa1n+kxkgiGws0t2D6fZBmh80+pDnkYFJENl31j29S4FirqFZnBdRR?=
 =?us-ascii?Q?rS1G8LvoKlEWfb/E+MHkxEDqKeNQbzTtNpWg5smL5Zyn9USyu7cIZ7y42GXX?=
 =?us-ascii?Q?YgQYExghhUV86i6VEDuWj1cYsfHdsnJ/EkqfgRY4MXSvEf3y+uZknAkMqQJ4?=
 =?us-ascii?Q?SBSiBS3WRPfcZTiOoAX3oqmCbksXFTAcKFi5BVO5YjerZ3JSQwKfUnPJfjwv?=
 =?us-ascii?Q?L7jsqfvsu2BevoUck6YeMk2FIIF8Mbruso9GkU/r3/Ptr3HkD8RiBJwhtGn6?=
 =?us-ascii?Q?tvMJ0+6QaJryNEABefLkm+m+Lv1LyB5gEP2u4xtv51uKzbKYEGQQ0VSGxqhJ?=
 =?us-ascii?Q?2ZGqGpg0MBQ9lL4asU7AFtopxtNyGPPuxr/kAlAiIaPbotjYmlrPWRg8a3E9?=
 =?us-ascii?Q?NbgyAmEXJuoDOW8RsRJsPTNckSZX6hHn55XKjoTVQ8nMvy6r1FXFIehhYdjf?=
 =?us-ascii?Q?irt/GsxJ7YRLKMtszJIsSPh81W57VNKOhHvbj4GZA8wlNxBA2JEG+CIwAECm?=
 =?us-ascii?Q?TDYxDULkiJQETCCWF7+VsfeinS1PL0yQzP/VK6ZKABjP9ZblRxnTD9zv8sMm?=
 =?us-ascii?Q?xemrsYfATFKaxtS2UjDsxKVe7/qFbLyUgjFgtPSpq9d2j5jfdWitFX2AsG/4?=
 =?us-ascii?Q?NkXH/fqFy6KZtxLJAeBtBKnttwveZawN4lvKPT9UgTArHoUgjOBakDYLIm/r?=
 =?us-ascii?Q?k9w74qms1cN/zuDEBVxuH0fhLWJnbv/CaoRBZtEjhIbiFIEhbktEP3S+ltyx?=
 =?us-ascii?Q?kswb3thdJpZ6mB4+KOTAqd4/rX6IIJ3jX0HKr0wtLH92MfvPsNl22JfAO/OE?=
 =?us-ascii?Q?vfGM5HtjKnG4VoR4U89N5maP0cCTnkeLX2fpRBU82II0870BFCnxWZRHnS4w?=
 =?us-ascii?Q?ItS+BJi0eK2GbaSWmla0Qe2B4l0Oeuo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ca4c1f-5be4-47e2-4c19-08de64247e67
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 19:35:03.8221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DhrQcQZWw+pHbu0nzQsQX2BtC7puqLvGh44mBwsSJYAo1t77L8pdqi7+mYTNLWl6pzp21ysklFEZTsn03a097Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6459
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

On Wed, Feb 04, 2026 at 11:10:26AM -0800, Matt Roper wrote:
> The error label in this function just does an immediate return without
> any further cleanup or processing.  Replace the goto statements with
> returns.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 055084fa50e5..743c18e0c580 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -456,16 +456,16 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  			      xe->drm.anon_inode->i_mapping,
>  			      xe->drm.vma_offset_manager, 0);
>  	if (WARN_ON(err))
> -		goto err;
> +		return ERR_PTR(err);
>  
>  	xe_bo_dev_init(&xe->bo_device);
>  	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
>  	if (err)
> -		goto err;
> +		return ERR_PTR(err);
>  
>  	err = xe_shrinker_create(xe);
>  	if (err)
> -		goto err;
> +		return ERR_PTR(err);
>  
>  	xe->info.devid = pdev->device;
>  	xe->info.revid = pdev->revision;
> @@ -475,7 +475,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  
>  	err = xe_irq_init(xe);
>  	if (err)
> -		goto err;
> +		return ERR_PTR(err);
>  
>  	xe_validation_device_init(&xe->val);
>  
> @@ -485,7 +485,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  
>  	err = xe_pagemap_shrinker_create(xe);
>  	if (err)
> -		goto err;
> +		return ERR_PTR(err);
>  
>  	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
>  
> @@ -504,7 +504,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  
>  	err = xe_bo_pinned_init(xe);
>  	if (err)
> -		goto err;
> +		return ERR_PTR(err);
>  
>  	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq",
>  						       WQ_MEM_RECLAIM);
> @@ -518,18 +518,14 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  		 * drmm_add_action_or_reset register above
>  		 */
>  		drm_err(&xe->drm, "Failed to allocate xe workqueues\n");
> -		err = -ENOMEM;
> -		goto err;
> +		return ERR_PTR(-ENOMEM);
>  	}
>  
>  	err = drmm_mutex_init(&xe->drm, &xe->pmt.lock);
>  	if (err)
> -		goto err;
> +		return ERR_PTR(err);
>  
>  	return xe;
> -
> -err:
> -	return ERR_PTR(err);
>  }
>  ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
>  
> -- 
> 2.52.0
> 
