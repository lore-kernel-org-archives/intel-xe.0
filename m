Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091DAC71130
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 03:49:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABCC410E0A4;
	Tue,  8 Jul 2025 03:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gcDU0PZy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50F010E0A4
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 03:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751946573; x=1783482573;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r6ZRNbr2sINi+HQKd0wpdqh+vGr685MbSZ71bIHX7bk=;
 b=gcDU0PZy6xPQJFAEli55z3LBFfnHtk1RlMNRieOWMWzIwHHeogm7QaxD
 TpzffjcW85tAQRcnFDXMo5A81dSFiNwBpLrRxHaWSqI95lno9z09pOEL3
 5rIUYNGnionxRJXg7BLMt/snyBmL2DWzpVPZvcBZ1Y6it3iez20GANtUu
 oHHgnJWquDPqmbeWUFn6BEjlsKAEoaYmiTE5mzpOShlbtL6jtPWoUheLZ
 1WRPgHzGOJBOexa1MBTtQ9IeDArfHsCJy4/iNn/ACp0aHWNuEJvmHFR6n
 Be8HymLsmMfwSjLV1iPbHSp3NWSuTYgY3IXj57SPplu/56r63QY44OMtQ Q==;
X-CSE-ConnectionGUID: 0/7EAkzRQYyZ0zjCKY43ig==
X-CSE-MsgGUID: 5fLF56GpR0iqf7io/wfBIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53293567"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="53293567"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 20:49:26 -0700
X-CSE-ConnectionGUID: UZqqoMJBQiSifhI+c3atKQ==
X-CSE-MsgGUID: 4loGz9YaS8ScxjFIltPo1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="155873468"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 20:49:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 20:49:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 20:49:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.84)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 20:49:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=poosDA4sIq4qwyEe2cJguqkUygQ2WWSXIaSXbSRVL9Sljt6nSyNayJRcWfIj9qFRuaQuYk4+hGC2KIQn/VF7NcLYP8qsdlF2lqa98fzjZ94dHrDMyTAf9fuYXZlmrcnQrJe0l9/uysaNMAxXjSUfKUeRT9OMO8002cIFFz6L1zMPc5tOIcLhTbc6sZXd9nW9dhdRomqWRIXYK/9VPjbn2JjiBCx4JPzh5O4UBiGP/Mhg3TwbKgOucLh4+r7eMJLANtoMRW2x3zFdYbZ9aS5sbFcXonAbnd9dnDoMsvyN/GvXHjTZdnMvaxmt9tIfdXRxF+wqEbE/R4gvgmEUnPzslw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UJkzV1H+PC/XRGtFVbGvxZphYQW2ZVCvM0rqlgY5Lc=;
 b=NEiRDIU3G/pvdTwFZz3EIMv5XTlgXYQupNf/rPCBt/NkhcIhZ3pIHrW49dc7Ne8rTseQg+FK2bYVPUD3ObUg3oEHQtxutjGMnyGiYbqIiUdyHNEWRyAd5Ckj35QC/QlMLSRsN3fsskb4T7L4zqnctEYjupWQIMQtD5+Hz+5gadwc2dDt1gtL6C+dcAtmkhn1iGLoa4VrkHPaHk+a5D2z5TYCk0x+ciwmMSl8PirEJtye23/l27EP6IMByYSm41nHciwIEVQIpICBEtLKk7DUSLDpkWEgM9Ex022zVeiyeH+faMcraXHCh5qWiJ4zHBkb8Uq23EDpbS6dfEOQyr6L2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA4PR11MB9419.namprd11.prod.outlook.com (2603:10b6:208:564::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 8 Jul
 2025 03:48:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Tue, 8 Jul 2025
 03:48:41 +0000
Date: Mon, 7 Jul 2025 22:48:38 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe/pat: Use XE_WA in xe_pat_init_early
Message-ID: <3ab27we7l3262ltktojmwxt6m35iv2qx7k52cnfsjidqts6h6m@qxmnk52eaeg2>
References: <20250707222111.3214505-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250707222111.3214505-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:a03:40::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA4PR11MB9419:EE_
X-MS-Office365-Filtering-Correlation-Id: 48275a2a-564a-4bc4-1945-08ddbdd2541d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rbY6qHrIuKpXFo0PfivTcQLxzQbPimKs4yLLVIZ23H2KPE/idbrKMgQf9pZg?=
 =?us-ascii?Q?pQ6V1e99VaEJVFwwl7oA9ea83jRv2PyqE6XG7UIdrwFxMlLKJytFKP4Ohztu?=
 =?us-ascii?Q?3e9FCHxszi0kjBZ1BTsdsTjkgxMQSl28qwAJ4drxzcOTC6hSozhOHa1H1OHZ?=
 =?us-ascii?Q?BI8ZE4YjHY+7XFx8ShCsQOjNZSBYcI2X3VVIRP2+BSCEsyumDAxlz83Z61WC?=
 =?us-ascii?Q?4NJu4UAJkfwa62yePjUiZv4p+Xb1mq+9TfegFqosKwFDky8r1X/XoBj/njt2?=
 =?us-ascii?Q?++obnZ3Yh0XMxxLoXJxzElc1TSUDQ3JUeyD4VGSOh3FnZZGac1Rx7e/4+0CG?=
 =?us-ascii?Q?TzIGmznGjhcmrtBcQ2wZUFlNlisfraMMsqc6dIRN17loAtMID4RuinHZP1BJ?=
 =?us-ascii?Q?8aSV4Ykf/kowj675g2pqeQZU8AjgPCgdXuAsD0s/fsn/o4TcoprLikwYQft3?=
 =?us-ascii?Q?pxZc03NY1uEexWS5yJHwuVdgEZ7x9DfvxDqn9f3pWTtcaz+go/3weHyI/kFJ?=
 =?us-ascii?Q?hIuTuhe9a3lb/Q7KPyIcepJZ4HeaMOyAQIQL5LcDFkFuaKSjodMUDK7jtHgX?=
 =?us-ascii?Q?KGlisCqPxuqNIlhdbHfOcOk/SB5plaR3OEeJ1kTBzKLMNBzV0Sx2cobUZQSd?=
 =?us-ascii?Q?Ra5p2y1oelgNY21IlYoDXeZ6buyuSHHR0oQmeBeEucadND6f6Q9X2N74iK2u?=
 =?us-ascii?Q?8MAabUPeo/NXfvSloUCfsreG1hB1AufZbNWnyX0LPhys/SVuLEQSdtKLFJTo?=
 =?us-ascii?Q?TV/XxbFeyciygzZ4w8t0Sve2L3smB05J+RmORlKePEpGrq5quZYQH52x9StP?=
 =?us-ascii?Q?lxatLd4orpuDo9Hy/hCffin+1CywgAvfomnTSMzxgGka1rk02M9f31QYWMgh?=
 =?us-ascii?Q?dY0cIO1xo50xzbtZJ4BhQd08tP9+mV9oXdqMexNg4f15Wdj9iuajwLH6uyW+?=
 =?us-ascii?Q?iP5yNs48UvOUq0J1yuGPDX7nES+KauUQI5bsVCKFF7fnHPm0wTx3KwuwDx4B?=
 =?us-ascii?Q?iN6Tx9QvJqZtkAOIL/aj+ZkEu3t+mp1uVl6LZvAPB6lhOCb861sXcRkKwFEx?=
 =?us-ascii?Q?IVkmZwyIv0JZjP76x7hIxO2UzbkO/MOLmafU973aAXkikIYrr0DSpd6AmEC9?=
 =?us-ascii?Q?USw9NzFwwLrPrG75MbdRF8oM2KPLWc9WhYqpEPuzeutH5BPpN+WqEscha3+P?=
 =?us-ascii?Q?kVysItSS67/CvJ3yQq6LArhaed2bijx7uoQaejWtI689AI/ah7GXgKIsrAfQ?=
 =?us-ascii?Q?NSkygGn1nB2z+GnilGoZqbHdcgFGFj9tH0IBBj/TEWCBuwfxhmhBma4tgn+9?=
 =?us-ascii?Q?v5MdI3j8EnvAaKLHPOJMxBFmr/kEPfKndg+gJ6zWyXs5yTbqzE230geu7lw9?=
 =?us-ascii?Q?BaPMJv6iJGPiKAmuYMfOHUhVkFbP1c67+3CFr+1JU4+Kv5j/bIu51oOXYNUh?=
 =?us-ascii?Q?++KQPEjjZeI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kQQcBvwdHBb1ND0Ww2kamrLYlrwN8CmPQYpOEkmCYvUaKIkr/nsIYx0pf2Ci?=
 =?us-ascii?Q?j34mKv2ksxoMrI+qv1fuO7vG/W52tEMHLvqlWoMxG4oZV/efkUTyOC4MnHSZ?=
 =?us-ascii?Q?PnOp5EY3P+/HjMxMgooPM2ezBX35DIWp6LqRKgZPTtVvaFr1/GZ76JqSI6Mu?=
 =?us-ascii?Q?bgwzLelnLnZzEzQ2h8oyWEYw+tut8/2kgWmsaJlOcWxtQteJJA+neP1LqkmU?=
 =?us-ascii?Q?CnpyVen/XdMfAZQSdtNbV1jZuY6F/H1Sx/0SzXin2LKNfZ9RemLcha4AkfRt?=
 =?us-ascii?Q?FGYBWBp42KYovb5Lb/FdnN+6/c68k3YXi7cSM3mIFdoYHbHurvIJQU79J5rG?=
 =?us-ascii?Q?KIZCE5BoLEkivGmQIGoVc7SMMNNmLVSweFSixVsNRD4jrMJsvCutJz3fKVpA?=
 =?us-ascii?Q?blpzsk2H4sGs8ybeQa7wab0gyEL21HIDP4Y53mevrGEqHF5XSK3+JttVzQ0h?=
 =?us-ascii?Q?ysL9vt6Fzp8ZtvpCoqpemAZKRGc0sErF0IgMKFnftvvAQbJiMMjYJ8MXwRsx?=
 =?us-ascii?Q?8GtblBhh68NE+lHWlqgpGiaYrwc5oWAXl6V6Atvd53Pw+c4mxySOwIvcEzhE?=
 =?us-ascii?Q?foA5uAmhZeF1sPITUwYqNLk54WV6kqGs20Lb7nFTcAy32KtiWN9g9SweDV9v?=
 =?us-ascii?Q?2u1jj8SL5buMCTRo6Kw0XLLpso8MD24Oka0qFMdbNXghRMGOUJ2qMUNMjgmG?=
 =?us-ascii?Q?VOp6HBpLHSWbeHeJUblHr4Tg6z7HqZSztVQC5WBDGEsNynSqYVKMBUaxE1pv?=
 =?us-ascii?Q?rmL1g5+TwUOWWVDLmHt4HLp1V/xjFFcTQWVUdIV4Cbqeg4BAIC1McbWNjPKs?=
 =?us-ascii?Q?bJxxw35gTgsPbKb9U1w/W2nZkirdxNf2a4ERQyV6Q8yrV6RWRW2ItLdv965n?=
 =?us-ascii?Q?TqWHhOKsx1rfmkvtnsy9ddVpFV6brXmKifiMJMoThAYl2FXuqlbS4Jh11wr7?=
 =?us-ascii?Q?Dcb5G7DVUaOtxsSD4O51CfF3GK1p7EP9RNyLY9/WubsPYWf2Ym7j2CX/ukbc?=
 =?us-ascii?Q?rqmojcNTD/RSrNxEHCwGmcK0Y9O0snk6BceyXcqLHQ8dzodtwFliT8/oj7BY?=
 =?us-ascii?Q?NQnQXz+aGsHrd9m0XYHLv/EZiVIDfW4t5Va6P2vGJDMerC9MhPt+dMVLfo3R?=
 =?us-ascii?Q?UQfRq0vij4bdpmF+XvIf9rx+asUxDh5jFuhIdEywpjOWD6hqRzsoJoQjudch?=
 =?us-ascii?Q?PyG4NJLbqRAe2tu1ZDhvoR5tNOrWUtENapsYBf9LEMhjxuRbwJlkAOXaHTLn?=
 =?us-ascii?Q?Du7z5hysVVqtb3EFyIlhuF9Erbm9ekE6q7uejRDcrsJxaHmG8Na0V1DgH4WH?=
 =?us-ascii?Q?fgSwWhYFWyU6c2MPnOOv+LMreAtChf/JFpL0nNJ7k7nvEcuugFobghTQfF6j?=
 =?us-ascii?Q?NNHzyocP+JERwVkqj6zNKbOur5gydsW0IOsYoz3RC/puOoED6CPue/JXEXEm?=
 =?us-ascii?Q?9McZS/U53qjpS/gtaLASgw1ERr/VDscb/OHjamG/65kBYf5c7MuOtST5bNb1?=
 =?us-ascii?Q?jhniEWo37oSq0zeyCanvgyUbz/K0TunvGRmvIErE18OYHQCeGbTxVP2dcYNh?=
 =?us-ascii?Q?aZj7DPYWExTOHStgJ5F4Y15MLU0+5s4wcTGhmvE2qaE4d1f8yaHfV65JsMMV?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48275a2a-564a-4bc4-1945-08ddbdd2541d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 03:48:41.0139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AbRmGRjZ29OlBc+uX5VnMpcrtYbvQA+6ESEceGrc2KIj0LNfRoa4erpoKfayYFs/UPjRSaVPIdxy8MaSmOrXO+JciRC4WsazAFFmIdte6yM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9419
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

On Mon, Jul 07, 2025 at 03:21:11PM -0700, Ashutosh Dixit wrote:
>Add the missing XE_WA in xe_pat_init_early.
>
>Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_pat.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>index 2e7cb99ae87aa..d36da052f8a43 100644
>--- a/drivers/gpu/drm/xe/xe_pat.c
>+++ b/drivers/gpu/drm/xe/xe_pat.c
>@@ -384,8 +384,7 @@ void xe_pat_init_early(struct xe_device *xe)
> 		if (IS_DGFX(xe))
> 			xe->pat.pat_pta = &xe2_pat_pta;
>
>-		/* Wa_16023588340. XXX: Should use XE_WA */
>-		if (GRAPHICS_VERx100(xe) == 2001)
>+		if (XE_WA(xe_root_mmio_gt(xe), 16023588340))

xe_device_probe()
	xe_pat_init_early() // -> OOB WAs are not initialized at this point
	...
	for_each_gt()
		xe_gt_init_early()
			xe_wa_init()
			xe_wa_process_oob()

you should see this assert triggered:
	xe_gt_assert(gt__, (gt__)->wa_active.oob_initialized); 

Lucas De Marchi

> 			xe->pat.n_entries = 28; /* Disable CLOS3 */
> 		else
> 			xe->pat.n_entries = ARRAY_SIZE(xe2_pat_table);
>-- 
>2.48.1
>
