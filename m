Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1B9C53219
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 19:11:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A0110E117;
	Tue, 28 Jul 2026 19:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T6g2VsHV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F8810E117
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 19:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785265890; x=1816801890;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cL/2jcXnbsNsYiuhH+n9iIvxLf9hyKT1Hhaztjkhbbg=;
 b=T6g2VsHVHIxD3YN7ZLgl0K/8S0EVuJYXGr1ww6CN53odP9kvXlNbjdZ/
 cz8VEkutnOQiTq3ks1vxdY4jamBrMNb+RLjIFN+KrgOy6BRnRbqgh5cKz
 X5+JvXwKuk2V6WbZr/uPo/aJubv5X+Q68/df5p0kQtFlzw6abHsP1WIYR
 PT2a37lXDK27yjZVOtucviJ9V0yUYWZ1qhgQUaou+RKh91qM4WaNkerqm
 EBEyeDt/AXIMhiI9dyyRwN/LrFO8eHI7tuewrqxdBZhZatNrn3x/8a6pi
 Ki8eyUo2dFhE7rOl7mkVsPnDTgGQnUXeSpaAhGXPvC6brgAzpGG87V84e g==;
X-CSE-ConnectionGUID: Pex5Ik4lSM2/WqJbtE33dw==
X-CSE-MsgGUID: OpXxJIkASS2m0D2EAf4tbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="88403818"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; d="scan'208";a="88403818"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 12:11:30 -0700
X-CSE-ConnectionGUID: DmnPlkJ7QBqNx+yyE3wfRA==
X-CSE-MsgGUID: KHsFAgaVQQaxa37t4id3pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; d="scan'208";a="259226574"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 12:11:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 12:11:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 28 Jul 2026 12:11:29 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 12:11:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2gKDz7Bbyhm8QqFgAtd8ikr0M33AaC0WivRRtzUBobwRT2kxnw3R68iPZnQKEfnmyaBtFE/b1tT4BkRG67vS1KhGzAOFl/oyzN2IDW6MPXZ+MNxKfuh2w3oadXFcKEboMMTImeYuEW0gG184UH9LpJdGabOIisgpD5qoytwUFx6VWRFJRUzvBzqFo8BblG5kHULr+CCNQ9k1GRrcRbmvXHQqjlMPnb8ArxLYbQPKyKNdvL7IdqtJYPKeP0Z05RoU4hlGyeXuvbVVX4Olt6RFPYWuebfZtm0tAq8Pl/vJlk1b7VUWhkJc503aS2hMR/On/9276hgger3jtTSMGMXOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cv52zHxiT7QaXfhDV7X1COY4WsERBRKP1vNFnNwFylU=;
 b=YU1odegxRkqpDQC9XV+gDttG5tJ8ujK9hXUiDGduWuJh6xay7ykFMiKuzTX2oK2DSzPyMjkfMYT6Il/mhybn5t5TNIg5y8Hc3rQ3vh8Afsb1sC++jf8SEuc0d82doe3s8F45EomCB8b/S7aqyjK0Xy1g/vhmMxeRaCtv19lWt5Zv2uhugoWggEiUPSkJ6MeliEu6fDb5YWMiFTh6Im7+gUsX9DFlD5DyhzOZ8Dp9rmDIc+qExb8d38Z1WVZjDqjGHmAmT9WeQ3jGOlIV5kBR1WRWFo/E9n2BIH9bhmqSzjmz3oHYU/bkQfAz0sZYVGxGbG9NgIuYqRZ2JQRzwM+zSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by IA4PR11MB8992.namprd11.prod.outlook.com (2603:10b6:208:56e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 19:11:24 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 19:11:24 +0000
Date: Tue, 28 Jul 2026 15:11:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2 01/22] drm/xe: Introduce xe_any helpers
Message-ID: <amj-2H-M7vsYzXCL@intel.com>
References: <20260728161039.579-1-michal.wajdeczko@intel.com>
 <20260728161039.579-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260728161039.579-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0061.namprd03.prod.outlook.com
 (2603:10b6:a03:331::6) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|IA4PR11MB8992:EE_
X-MS-Office365-Filtering-Correlation-Id: 6980833e-b32f-4478-e96b-08deecdc0434
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: yemOcaK2Z7dc8ktzHAB4Hhcjvp2vXxcpdot5NUAx3tzUcO6dfesr5yD+mPoHbTODSvkxAkeO/JUDrY4JwK63Qb/Ym19y2bFwg4mOmpMfrjKCCLv2XqkxjgeNQlKk6aYb9k+fslW8num5yCYN3tzDyLdb1DrbJqXHZD3uf6X0CvEP7iFwJ/LjE4R1yXRLSKCjLRV8Rk6rOzfFg7TaK5M8JVS37A2We9Mxuctqy/5QPHZNxa3pbeYGb8dqC9Vk+vI07zjmUY03uanB38AWSAKwLc+oeUza2/pMoUuv3/12Ac6nmMwLdKM8908tQ+GWMB9CW/JrhnIiDXIfucBu6wb3cm4OSnt0bxXDBpCrXL1EcxdJZ+/HXzka5DXvShLHz+fzYFabvyTb+WpkafwiEKjq0gIFsvVPL2gY+eKQH80eye7q46T3pURxhEIu2nmtrMMbFWyqdII5yhdx9V8drJjy5xsuyhUQqndxeAZx1vCmhgs8ejmgAHnh9UJbyQbtKssnOAVT5exWNnpYm6gkWR/BOjUan7mNi8vUopm8MeHW79RjFG3Js1DjM1O4uMYCijSDFRgVLklHpyvKnTsSUyFnEgNmPVY+YwJBY7pFqew2hKGI9EOMzq/BGkWNybJQOUIarUHvhRIjgo495YZaT3dUmAiXrQhz+/Z8QoyF2aEu+Qg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?d15rpo9EPg7zJ3PS3tfEVirwwGlaN+g1a3lCxSpLKDikwNcy/PubrkugbQ?=
 =?iso-8859-1?Q?E9mF1+Ht1VnnM2LuMJpRgi21rSlhBnPTORkENK8efrQ0+mLrFV5CAJE69Q?=
 =?iso-8859-1?Q?8KC8c3cKB2bn7GavV9n88WH1KG5ZaNnPwwgSZGv7Y2lzbgFGXWQ/karfV/?=
 =?iso-8859-1?Q?fg1B6dAnwe9R53XSFoixoh0sxy8JAi1wjbyl5kNxqqPB2a0YkZ/xeS4g9r?=
 =?iso-8859-1?Q?/AYKg7xJcyG8KWJSBcPkRYFbB8Lwq7I7M2WZmUEdNi7QMcIcv4AZD9fLjh?=
 =?iso-8859-1?Q?OZNSSiCieOFlBjMN4zksaV4cCvzj2jklGXKKRYt1R/D7EtOBDzdSc7gN6r?=
 =?iso-8859-1?Q?u4R89WEYswn/C0YgCc9T4b/9I4dkvJMr2UBj5tmvOm19MJH2jkC+TOPZFK?=
 =?iso-8859-1?Q?8Iv0zhYbKnJV1E+Z/VhwjmffZMF/NBTsqSZbdpLyT9+OYH6RYw1HqAZrdf?=
 =?iso-8859-1?Q?XgsBzMUJ3FXVQ5sP/lM5QnoIJ1l2UJCyzz8I5cWpPG01cqWJDD3hrzM8re?=
 =?iso-8859-1?Q?yDJ3F1DMsaWhLHyeoXpydkWSTn9KhHvaJLRf/4d6CYALMrCeOw9dRXSicH?=
 =?iso-8859-1?Q?D4+YxYOIvkFHYpixh1c+edfESjS89hMh39pTtZ2/+rRf/Fnj5q7d/c9BmY?=
 =?iso-8859-1?Q?nphYtWSQx7pCsXaL0iFcGe+IiYEErplBO/b1NFbSdjVW58pc44liGB2hzk?=
 =?iso-8859-1?Q?GoXwHXVdqHO5ri5uFt7rMBchJL6q3tjXk6VwbDLpsUzfxJ3fdGqGyFLk94?=
 =?iso-8859-1?Q?SRQDn6PF8CQohUNA+iNby7lamGbSAFfrEfVIlbYxP5dI8YTWOsEPhoi0wG?=
 =?iso-8859-1?Q?cFO4EOgq/wrnq73+NdvudOz64O7cP4qpL130svJgxIg4Ko7eXSaTU6ADBC?=
 =?iso-8859-1?Q?GM42yPInQbe56ZwmZKNr0AP6PFYj9gH03Xn0eMzq22wCVm4Gl5ufCfzdoM?=
 =?iso-8859-1?Q?wGQWlsYCD596c0KXcuY6/Dj/b23WrHmpztJRsKPtlYwQ1kjs8+uoNxDsXr?=
 =?iso-8859-1?Q?00jJ217h/5f+d3pGsl1a6SX60a9KJqyiRoxKZ3vJBGx2vmnywMq90iSeIa?=
 =?iso-8859-1?Q?o37kdZmgSQ0CAE25PHyHZwmR/1lE3aDtZlMH2UIIeFDsPDyk2BA5pu5t8x?=
 =?iso-8859-1?Q?PJ5SJaYFfg604J89Ckc0RPZWN+9BtLsC4OKAPBSxTJav6SSZMucb+3U4Cm?=
 =?iso-8859-1?Q?FNzclrYRy3XbpmceYjxzSxsrL176WABvWSchYTqLGSf6zT9N3IgqMXvR7D?=
 =?iso-8859-1?Q?b8yoTnqVfPTFVrRHNBghzJxBQrvhMlpuQ12DZrTtWkQbKNz86wji0VEr+I?=
 =?iso-8859-1?Q?lEDbGCfQgMxlukxOlSgvyGpHR9yutlmeyGrmKObL+IvTh/oGpW0fYd2vql?=
 =?iso-8859-1?Q?mNdeRRfw9o1Os9V52LdGAq7EQ7BtjI6hKGTVbIleW6ZyRvVvq6bOMZ6t6I?=
 =?iso-8859-1?Q?ED2tYD2VMTl+CgfQDJsjyrNLtKbyQYnxY48lubVM/iFa6yNj44U49xJoIu?=
 =?iso-8859-1?Q?8YPurOdjiipikuYTUiDONHgZ5umWigICzi4+oqKbyIDXnRPLxq9aTUVPnZ?=
 =?iso-8859-1?Q?VKBNkBQg0Qxcmw95k8yb41Kv/e9d67faVXK5P6ppTJvk/uoFFLMN1B1qGV?=
 =?iso-8859-1?Q?J7kVoLVzqoM3nvp/8hiqEoCRLOOJ4S2R8Svw8/qknl495imBXU4X28zmwb?=
 =?iso-8859-1?Q?QVrHMcleam4JiCytN+yFkJvMRgjBfkOFQ+9ISD6agWmiJ6gb9c5V52URy3?=
 =?iso-8859-1?Q?Jk55L7A8qpGPUtPsqx4hmPCSliic/eUKg9lcEXuynYHOj2T2/2PBbImYpC?=
 =?iso-8859-1?Q?3t0f8ykAwA=3D=3D?=
X-Exchange-RoutingPolicyChecked: R5SdGOoek4xkzK0khxXz1eLEgWZuhNir+mmUVmLQsBT7g/oR5SbC1mnBoamCEHkUnWFx8dX+bDQyY0g7W/ioK3X7vekd4tiOjBv7oJhQpDOAx+mTqBnAjfgHQWV+j/cokH7voSCqaVUhtQ+3EbSO/CA35kWsRdw5CmAbHFjFaDMYE7Pg/MNiNtPZ0YFEIWYOc75YTWtZi+onU//3N9sZ7+psngOXJJwsPO4PT8oFZ/VOtQ8ABIaEB8FB7YVpZMRorvjKoWUv1rHAGd17x7QnhffPhpm11LhvkQbI1EMr+efjISWAb2fKDuBHr2IXuari9UAM8j2nfHiCU2pZr8g3Aw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6980833e-b32f-4478-e96b-08deecdc0434
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 19:11:24.2799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQKOIi1R/Ru4Sg6t37ZoXjpLm3U85aiqivyd8x4exs0KcArNn/ma4qpZayebQWBQOzH51Jj8Meg00gsFA+F7mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8992
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

On Tue, Jul 28, 2026 at 06:10:16PM +0200, Michal Wajdeczko wrote:
> In upcoming patches we want to define macros that will work with
> either xe_device or xe_tile or xe_gt pointers. To make them work
> and to allow compiler optimizations, introduce set of helpers
> that will return either expected pointer type or NULL or make
> necessary conversions to/from the struct xe/device/pci_dev.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
> v2: add include (Sashiko) and const support (Mallesh)
>     reuse existing to_xe() helpers (Michal)
> ---
>  drivers/gpu/drm/xe/xe_any.h | 112 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_any.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_any.h b/drivers/gpu/drm/xe/xe_any.h
> new file mode 100644
> index 000000000000..a2b1e42fbc5c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_any.h
> @@ -0,0 +1,112 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_ANY_H_
> +#define _XE_ANY_H_
> +
> +#include "xe_device.h"
> +
> +/**
> + * xe_any_if_type() - Get the pointer only if it is @type pointer.
> + * @any: any pointer
> + * @type: data type to look for
> + *
> + * Return: the @type pointer or NULL.
> + */
> +#define xe_any_if_type(any, type)						\
> +	_Generic((any),								\
> +		 type * : (any),						\
> +		 const type * : (any),						\
> +		 default : NULL)
> +
> +/**
> + * xe_any_if_gt() - Get the pointer only if it is &xe_gt.
> + * @any: any pointer
> + *
> + * Return: the @xe_gt pointer or NULL.
> + */
> +#define xe_any_if_gt(any)	xe_any_if_type((any), struct xe_gt)
> +
> +/**
> + * xe_any_if_tile() - Get the pointer only if it is &xe_tile.
> + * @any: any pointer
> + *
> + * Return: the @xe_tile pointer or NULL.
> + */
> +#define xe_any_if_tile(any)	xe_any_if_type((any), struct xe_tile)
> +
> +/**
> + * xe_any_if_xe() - Get the pointer only if it is &xe_device.
> + * @any: any pointer
> + *
> + * Return: the @xe_device pointer or NULL.
> + */
> +#define xe_any_if_xe(any)	xe_any_if_type((any), struct xe_device)
> +
> +/**
> + * xe_any_if_pdev() - Get the pointer only if it is &pci_dev.
> + * @any: any pointer
> + *
> + * Return: the @pci_dev pointer or NULL.
> + */
> +#define xe_any_if_pdev(any)	xe_any_if_type((any), struct pci_dev)
> +
> +/**
> + * xe_any_to_xe() - Obtain the &xe_device pointer.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the @xe_device pointer or backpointer.
> + */
> +#define xe_any_to_xe(any)								\
> +	_Generic((any),									\
> +		 struct xe_device * : (any),						\
> +		 const struct xe_device * : (any),					\
> +		 struct xe_tile * : tile_to_xe((struct xe_tile *)(any)),		\
> +		 const struct xe_tile * : tile_to_xe((const struct xe_tile *)(any)),	\
> +		 struct xe_gt * : gt_to_xe((struct xe_gt *)(any)),			\
> +		 const struct xe_gt * : gt_to_xe((const struct xe_gt *)(any)),		\
> +		 struct pci_dev * : pdev_to_xe_device((struct pci_dev *)(any)),		\
> +		 struct device * : kdev_to_xe_device((struct device *)(any)))
> +
> +/**
> + * xe_any_to_dev() - Obtain the &device pointer.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the @xe_device pointer or backpointer.
> + */
> +#define xe_any_to_dev(any)							\
> +	_Generic((any),								\
> +		 struct device * : (any),					\
> +		 default : xe_any_to_xe(any)->drm.dev)
> +
> +/**
> + * xe_any_to_pdev() - Obtain the &pci_dev pointer.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the @pci_dev pointer or backpointer.
> + */
> +#define xe_any_to_pdev(any)							\
> +	_Generic((any),								\
> +		 struct pci_dev * : (any),					\
> +		 default : to_pci_dev(xe_any_to_dev(any)))
> +
> +/**
> + * xe_any_id() - Get the identifier of the underlying object.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the identifier of the object, or 0 if nor applicable/available.

as Sashiko pointed out s/nor/not

Please check the other Sashiko comment around the xe_any_to_dev default,
but I believe we should be fine with that.

with this

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> + */
> +#define xe_any_id(any)								\
> +	_Generic((any),								\
> +		 struct xe_gt * : ((struct xe_gt *)(any))->info.id,		\
> +		 const struct xe_gt * : ((const struct xe_gt *)(any))->info.id,	\
> +		 struct xe_tile * : ((struct xe_tile *)(any))->id,		\
> +		 const struct xe_tile * : ((const struct xe_tile *)(any))->id,	\
> +		 struct xe_device * : 0,					\
> +		 const struct xe_device * : 0,					\
> +		 struct pci_dev * : 0,						\
> +		 struct device * : 0)
> +
> +#endif
> -- 
> 2.47.1
> 
