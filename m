Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCC2D6A221
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 17:40:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDC410E368;
	Thu, 14 Nov 2024 17:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hqaHbq87";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1201E10E368
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 17:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731606006; x=1763142006;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XPGYKTCHJ8x02kOEFcXkpiKkA/i7NTA5BS/aBeY6OLA=;
 b=hqaHbq87w8KsC27WS83NkxfAsKM+KSfjm7XejAY8DDEUM79p8Yf+nMQj
 bcvEBx4YNTXSIP3eF+JIo5T8OP5hep5FYy8Ri9TVNuXrknU5kd0/FipF1
 llGLZXCz+q7vibn1M61nmoFdTGb1q+i6f1tYJyngVhIfWdQai2Uk8w9W6
 G9Vo7eqKcTMsleV4qCYXvOL/nh1dZiksI9ZVmIX8oNU5BZj4dlcOBVh6C
 nXY2twaxJBljo4q48DqX8Elk6eOcrDaDv1GyI/VkIwCpQorg66947avPO
 ExZ0jYoG0hdVfKu7WVPNK9vqYjTMjj2g3ckUH9opXQISUYw5+EubVXf/l Q==;
X-CSE-ConnectionGUID: wdmawmunS2WFBmEoyekX3w==
X-CSE-MsgGUID: CRZGvrTST46eYxHheEAFSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="35287794"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="35287794"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 09:40:05 -0800
X-CSE-ConnectionGUID: zLRef4jAQj+7Xv0krt+5zQ==
X-CSE-MsgGUID: mfQo/n/yTtm9dxTepz1gqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="119221158"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 09:40:05 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 09:40:03 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 09:40:03 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 09:40:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXyGf+jL2Jq4h6NDX5ko3vfUPWfDmvIZ51arr7XxI7OPQln+x2deY8Qe6GOjb/edVTGRI3mN6zvNXWnlWXqR7XaX93ymGhshJL5HFPvUJuvJaDG7uuWLkWnilcacAE+SrMOcz3QDJWqBuk97Fwxa+xuOTj7dkvWQUalBlUffLVbY5xvCIHZskWSGyUyoptcUa+LCzHdEhrAZkSbDf/u5vdADtTlE9ZFyr7d5xwMe6tatZt4qxfVGwUd3p4CRxcZH0e7r6M2k6bIEjz+b52W3h9NzAsDpbhWsDKNpRZ1OwyUWhA3So6qMWglrDuX1+l69htVSuTOsugmjWl9F1boMsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJA37lE0p2o16Cn+Qk3UAfS31NITQEDC36Ff056UBQw=;
 b=JYNKT1aegm6EZIsHv+IX8363kIaTiDM4b+lLgOCoDvYgNIhgSSf3oDzUIHTseuXhWSRQBKkRpYTFov5xnfeR8OCqEGbeNhU6atPGYuBZ5+F2NCy22+ox1sb2xQ9nm0h+h98dSXFaotzmV5S48ySfcWKahU+0YrYvm6uRtucgCWN4WrJNO2R8YGx/SYyC61p7kMIF6nb9H7W91KVNxrT7ncHliCRZXVarqNqk3tK2DAv+uyo6/1FrVJcuA2M+86aLEmZ/3Y61+cRNsIbPnwGxfBLb3QKJDXfVPJ5pkKkcA1rwO7O4vp7D13EolptwVSLGyt8EBYw6yepxRNpk7D3hfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7684.namprd11.prod.outlook.com (2603:10b6:8:dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Thu, 14 Nov
 2024 17:40:00 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Thu, 14 Nov 2024
 17:40:00 +0000
Date: Thu, 14 Nov 2024 12:39:57 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Alexander Usyskin
 <alexander.usyskin@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 4/4] drm/xe: Split xe_gt_stat.h
Message-ID: <ZzY17YU-YLGxh_Ia@intel.com>
References: <20241114152148.572447-1-lucas.demarchi@intel.com>
 <20241114152148.572447-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241114152148.572447-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0038.namprd04.prod.outlook.com
 (2603:10b6:303:6a::13) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7684:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a880588-7c31-4bd6-f278-08dd04d35d40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?qzMhmj6c59SH1/G4G2WZwrJZCn34BWve8ioJWquYyGmcSZiRZEjQtUtv0A?=
 =?iso-8859-1?Q?giuwT6gpOQpRLgqYTJvrlv8w+Ga05s3N+TaaS46dIYFGyMg1nPC30ZqH38?=
 =?iso-8859-1?Q?nxntMPM9K6sKIN+kJncNvSmI6N6F1+tl20OgI0BPWh/f3pQ4d89ofH+q7o?=
 =?iso-8859-1?Q?XcWZM14npPQSX5M4x8U+r/Xy4gBXh9ACfywbbk8+4rFpRXb/mQEU5twZgE?=
 =?iso-8859-1?Q?M/CQFVD45B/7JXSvv8Gta1a6uH7VaIYpZIJWqWcIiYzb9OoFHWf6h3x6mC?=
 =?iso-8859-1?Q?vpeQRRyu586I5FrfWxKqfCBY8MDvh1Ibn/rBg2J7Y2rJwYEHEIraoNX7Bu?=
 =?iso-8859-1?Q?KJp/JtzVIBdhst8j2svmBxrJVTRZT0i11cjQPz5+zdfdR9rwoR/SYHrqtA?=
 =?iso-8859-1?Q?wkk3SgaMbs9ArYbmDp+UwooySdfePX3fuDbPk5SGS5HuA0J/1JSX7Xh+if?=
 =?iso-8859-1?Q?5EtLhcAZTMbHydiCUR4m6O45Dndxk50sNY3QZvup/imNSAkDy8ttf9D5Xd?=
 =?iso-8859-1?Q?AEGByYtrJslDYEw1VzwFLG30e1D5/4xE4ITkOg11Eh0qW0g+9lt3V7tpiG?=
 =?iso-8859-1?Q?V51LBG46ji9Dn8TioKPrHT9QLTBXrE1X6LHFI7Udmzbnx7GaB4rGtpJpAJ?=
 =?iso-8859-1?Q?quZzp+x2NgcyqCFpbPxKVFYSVx89DNWbQ/V4ZgOT7F2RTQ9JhBihVG8YIx?=
 =?iso-8859-1?Q?wpWh9d9t7uO8RXZobRQG/mdm1C1BpkOcMrFLl3Z+Lp73J6UnkYYyNTpeMt?=
 =?iso-8859-1?Q?3BH4zEWjEV+/dm/4HA7FtqrlScbLJZCXIvZlxZWJm9wB7iqkFoiajBomTs?=
 =?iso-8859-1?Q?xh5U8JNaRArrc5hHvEUyhdvDl42amSPMB6bTwk+aIUcKSjkTtk/fU+tYft?=
 =?iso-8859-1?Q?FwJl/dZ0Veix8a24vyxqe3JX5N9oZHQjrs1u+tTdLHw0dk717RFoccBjUN?=
 =?iso-8859-1?Q?QY/p+FxczBmaLjHcV8ubdXXjPlwJGZkxMSnHmZhynPjsTzfJSzf/fZ+ke9?=
 =?iso-8859-1?Q?ThvwWkE6OPoee7ekiTO1rbNDwS0Qh4JYmKel0e/+3QGRp9cymUtHqX6sJ1?=
 =?iso-8859-1?Q?ohEx+t/LqlZ1YxY6Kn6YGan/khJqhplI3dD5/SGZ79O6RJqdSIMgC8gPiR?=
 =?iso-8859-1?Q?OL4Tq4N8pLNYpZpGX8wF2gqyjwDuP1Skx1rDr3zTABAnCnAARfEInoCL4p?=
 =?iso-8859-1?Q?ieGrU21miUN4LG4AJD7Uj/RrEbpxc35YdhZo3AkFjTHeHiH2V75cK0lWWl?=
 =?iso-8859-1?Q?9HNqjEtLyr8nIjVk7TfKyrUobXytc5b6vWe8UjI+4dq+Llm9qWSG8rJaY4?=
 =?iso-8859-1?Q?G+rT0rnJSH3Veqbi3KqOEszWMM6w0oNEkZs4tAHuVz+9l0Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LoGFt80vXCVP8KreNfNlEm2oXRfIK227zqCZ+Id4k6Eyw3qlY7APnotT9d?=
 =?iso-8859-1?Q?1f7tRdPtQeh328dt0qirlKvsQqRLzRKw78Sp6K6QqIj9bi6iIK+slhE51k?=
 =?iso-8859-1?Q?UBMxer0tWELisSirJDMdILgxawnAMmjNwRk0Y9Vz0VyjTNaKvJRwtLSi3Z?=
 =?iso-8859-1?Q?JvdpIgIdMw93XVMQVIOMd2QWmtOKN1Z9gEGcw113R8UWVvpVafN4H8a+ug?=
 =?iso-8859-1?Q?1a2ypwujhIDykUiYqzpRKISEDFHB13R67uzF/eLuB/M1PnkNTzppMfN6HX?=
 =?iso-8859-1?Q?FfQDLopZwFkn33+36kEMnioZUxmgLmCQnqZsfXfAJTaNoI839rVb3ZyT3u?=
 =?iso-8859-1?Q?aCXWqfMAbxmV2GQelgH5KPmsA8C7GE8BcpG6c8DSH502u9w466owOkWcpD?=
 =?iso-8859-1?Q?kXF2pNgkDh84V42gxXZW5AbOfGSRROdiApwqWv7A+qed+5Om/JUrDo2Cqu?=
 =?iso-8859-1?Q?nkwYPdKKhDxpYEreLcdU7mpYHNX7Ga+WvYFquvEqU+A91RBXqGlzBzRUVQ?=
 =?iso-8859-1?Q?4AIKNZhBXuRCBBx7jN5zHesOW4ef+fbVItIZds4HPlSB8h7MTH8ifFItyz?=
 =?iso-8859-1?Q?0dEvcEzO7whcciFpQ62wMmcf+bmdOe+xSKL8cAhMIGZvnjpqxMTkNqcSEl?=
 =?iso-8859-1?Q?X8z7j0d2O1mK2l0o/glMxrblviaG80SlnCoSiqf3k8rZlbpm5SFixE0sYj?=
 =?iso-8859-1?Q?gBqlI04Rd5Akt57juvjPERnLT71cdUTMwR7i0PP3GcK40mIJgw1AjnKIh5?=
 =?iso-8859-1?Q?O/9hvbes3AHsCMp3V6Cz6xMr5lhWalxWnjB4Y2La9oKElONVU0qmJzt5On?=
 =?iso-8859-1?Q?fgP1u20Q6gpkrDqcca/Pug+zP7OjGAim/ogge8rFXHkeBtBkU1LQa1ueAY?=
 =?iso-8859-1?Q?i9Zh68m1BKL8JP0+AT7YX0nc8njorq/kNt5Zwodb/1S6/vCO1XhS6FcJ25?=
 =?iso-8859-1?Q?Z4pLkZkwYbdSEuF2TT1Y+4DwYt4stQ76DVPSyan4VwkGBTUFmB+dyhO/3E?=
 =?iso-8859-1?Q?LMt9PmA3w6Q7etD2SXIebkUFYdk49kIEhHur3No00jgKukyhME4Q9F1vEl?=
 =?iso-8859-1?Q?8HEAmB7K+mZCItqlPv5QK8sBRwx3IrCHKPl+cApMjs0Wv1bcHGEIeE/jYp?=
 =?iso-8859-1?Q?w6j7c0DuuaDpnscbFnCOhrjXH/r6KjbvrYtyZ+1RWEl2zvFBZbSSS5svoB?=
 =?iso-8859-1?Q?88TYRxAFi25F0aM7j+PhH4sNsxL65eiuhtUscuK1+V1XOqj2e82uz07I/H?=
 =?iso-8859-1?Q?VzUJBr1vsXeP+3NX9cYqu0Evo/uC8eaalFCh2jBofxOMsIPUdbtv55yB0R?=
 =?iso-8859-1?Q?8VK1wjV8dsYujI5JkWgMtwP22cLNeJ6W+QxyjEpmUQiAj0+o1lGDndyMBb?=
 =?iso-8859-1?Q?YvB/A4Gp9FzRr3JdPXgmr3mauYelv6UjCaL8Tnq75kw+pgpC3uMNdJ0tR+?=
 =?iso-8859-1?Q?l8dJdPM0Jcfm1Qnpzs1Wuu6kyH/cHXjV4Bhlegg6/NHG07dRU0ZfHQeL0S?=
 =?iso-8859-1?Q?VrnXLxNzCEmN0iWKWuYXf4amu5JYlqWNLXaBGNIOPgatJhUyXFOD/Ls+1e?=
 =?iso-8859-1?Q?/bnwB5pcicRgYG+hwxik4Yvk41ffwhHubGFb+KjfFp8hebdDRWs9koMObS?=
 =?iso-8859-1?Q?0tvA3roNLXDUYhGHobQcfyrwzvIdg9cO59qS9Al58cZWiEPeJG4lb5HQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a880588-7c31-4bd6-f278-08dd04d35d40
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 17:40:00.7409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PZpqLpwxmcyOBhLs1cu2jCqXVfiUFZ5o3onsg4dpjIosJHryR2bB3g+4+LqD4ZKtORMkMafk1zBq4mr8Bwgeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7684
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

On Thu, Nov 14, 2024 at 07:21:48AM -0800, Lucas De Marchi wrote:
> Follow what's done for the other headers, with the types split into a
> separate header that can be included by other *_types.h headers.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_stats.h       |  8 ++------
>  drivers/gpu/drm/xe/xe_gt_stats_types.h | 15 +++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h       |  2 +-
>  3 files changed, 18 insertions(+), 7 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_stats_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
> index 91d944f6c4e43..38325ef536176 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.h
> @@ -6,15 +6,11 @@
>  #ifndef _XE_GT_STATS_H_
>  #define _XE_GT_STATS_H_
>  
> +#include "xe_gt_stats_types.h"
> +
>  struct xe_gt;
>  struct drm_printer;
>  
> -enum xe_gt_stats_id {
> -	XE_GT_STATS_ID_TLB_INVAL,
> -	/* must be the last entry */
> -	__XE_GT_STATS_NUM_IDS,

would deserve a doc while moving it here?
anyway,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> -};
> -
>  #ifdef CONFIG_DEBUG_FS
>  int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
>  void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr);
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> new file mode 100644
> index 0000000000000..2fc055e39f273
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_STATS_TYPES_H_
> +#define _XE_GT_STATS_TYPES_H_
> +
> +enum xe_gt_stats_id {
> +	XE_GT_STATS_ID_TLB_INVAL,
> +	/* must be the last entry */
> +	__XE_GT_STATS_NUM_IDS,
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 20901c01ba29a..6e66bf0e8b3f7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -11,7 +11,7 @@
>  #include "xe_gt_idle_types.h"
>  #include "xe_gt_sriov_pf_types.h"
>  #include "xe_gt_sriov_vf_types.h"
> -#include "xe_gt_stats.h"
> +#include "xe_gt_stats_types.h"
>  #include "xe_hw_engine_types.h"
>  #include "xe_hw_fence_types.h"
>  #include "xe_oa_types.h"
> -- 
> 2.47.0
> 
