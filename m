Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16685C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 16:51:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C266C10E503;
	Thu, 13 Aug 2026 16:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dixCRuBt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CAE810E503
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 16:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786639905; x=1818175905;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kx23tQL1w3hjyLQoxF6Sjtpfead9eHwUFQDdqKrLFYE=;
 b=dixCRuBtUlCKnpcsSCE/zpGk4jmMfCy6PPg2m2YxmoL/PyiZ99UqvQYf
 QZzCK5oJPOt14kAlLq+swN8CxtiMTRKUMiL6iNNsYheWwQHGVdCaPtfcY
 5ExU/GKBqBbMCn/TVDGTo5Bo6DpSWBEWnilX7nwWeTtWS+eu8196hWRXV
 gS4YKg/KCdMugG0in55FPZKC9LT4Mr2OB8uff7RXK1pFHKOI5g3Jw6JRP
 oeSPnZmFWBcy0SPRywJOUI8AG1FTUbaioTZM4zgeAx5KBCC5upmKRzQEM
 jrTVlXXBvi9hJZrSQkCpigsMdHGVILSEeTsF6rdMA0hku8Xoy2HIjnjpO A==;
X-CSE-ConnectionGUID: MyO0aEM4QlGpXlW6ViKw+Q==
X-CSE-MsgGUID: zSB80wBkRf2tjq2eYzl7Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="104602954"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="104602954"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 09:51:45 -0700
X-CSE-ConnectionGUID: 5WJTmKLLQ6+alY4TjCjooQ==
X-CSE-MsgGUID: PFTWuPXzRPydEqmcG5hmGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="293916972"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 09:51:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 09:51:44 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 09:51:44 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 09:51:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qsMJQ+sSgHUd8XAQ/urHVA06dXLcjskNeOD/MaEvqgv0vuHZAz0iJ5AqJ9EdKBRn3ZCsb6ZESKzlzK3/svxN3WNuGF3yj6+k8gg5PfakMvucz4RA08URDSRn6uXwJBdcaxxsxoWTJra7MA70bpnYrH1Wjx6PlBPfTh8UtmlZ60gpvShnbUyG9AdKxpf0h0DSbzf/TxEU9st9OLFFo9f2Q/15lbWME0Fr9o+35GVwNq5wfLrEpvvWrr6VFyjSvTnVKwXV2QJib+8TQ+abkzETiNhN0JZEvHJyBYkZBlAE3G8Ll3iKjQGo3GeGLWAORfk+HGbYcpFXRlxFLJ9I3qoAyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BUMYFk0wUZv2LUbxXNXzkXUk2ZIA6ZSEyCRiMjhpALw=;
 b=hsP9rHqIXhe3SBFBU8hy8fyJBjkXNh7G0p+Nq8CSzy8ji86LCW1GShZDc8tDEFR1ZrIqtwQdXqbAYw3QvGRD+PJc1W/WEJ/K7ge171K8sruoASTXLhZ9d4v5m0Esoict965uiM+uIck+qJvNc3Y/9yZOhqKiVVrCgp0JYzYk4ufi6ZKMIGe9cgUwUbiufRv4FJYvVF2AKKwsPomo53hovUU2F1oxLojBydGWg8zlt8Y+dV2lzgPrsbTz2a6XotoqoBKqSUnu+WBqPQIf5RshjlyY3c3FjFvp5boxczODrZrHmvSr2ZBmQjmkXUYlGprpOXShDeqf9Jjo/Gb051WDog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 16:51:41 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 16:51:41 +0000
Date: Thu, 13 Aug 2026 12:51:38 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>, Jani Nikula
 <jani.nikula@intel.com>
Subject: Re: [PATCH v4 01/32] drm/xe: Introduce xe_any helpers
Message-ID: <an32GlSl8iuwKFPY@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260812191450.11690-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0145.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::30) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|DS0PR11MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eb14d5c-23d7-4d93-8c4b-08def95b2615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: 51lrjqrhikVwbWd7a0AdWwGB+u82dqMPl64poHMLwhjSx8WuPgQb6htb4ACFAPCuc79ZjyD1cx5X5TwCjjQjNxBAENqHFMRW8kXVzuUUWunl2IsUrETu1YmMNaLp3mY4pj9MhRoCrDTOGW7x+7nlevPDQ+LaRuph+hufjxkH52lxnYFQIq7ep8xqEy/MEAAwb0eHRTDyRmX5cG2TYUcoPV4thrlqnc6wpBG3kqEnlcCLvvLwHWijzmMMe7Jf3IgOl3kcrQZZtL1eXcStg9jemEXnni++gdNgyfoXDa4PkuYHr3KHlWnm7zyoGpQXAbdo2TxLj5tHA/LIQUd65vvFfLHgZgBz7QLW2X15UaVBhE7ATBN3sKTTHRnXAJ75bDfaWHaPi7zW2vy2IUlJ56LUq3yjWA169T4naWJ0QkrTHhmgpYvk6AzDFCg6SJ/nM9/XdlTXTAQIYSXgBMRbspWrDlX+5SXhU0AMU4gFD0oWPhzBQptwzsRouPpmY+xwgOKSvDc/F31loSIKE8LQyFoFFVgK3Ubd7R33wsDw9YIMjmavyrRmwmSHOylvJQsYAx/gYdPOHqYCqiRO7CYWyiMpzuYOJBdZUeK5wTCEOtFqY4/RUUQ4mS5DTodusGVPB70rfe6yWzsZ0KRAyfmMeZZo62JD+jY0jZpNlkusYVIcbzw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?oOZn95l0hiIVUMQBI25Z1ZPe5g5N7pazvz3JNI0NGMzZW0qutSXbTFjmp0?=
 =?iso-8859-1?Q?Pg0pa6CpNy4mTOgBMBbSEyD8w6QAf/BxDagC1fcs/FeBbkRNzISL2IqI80?=
 =?iso-8859-1?Q?sB0uoIobdzSPxAlJIgwxiZm4f05t2NGifH7CgDnwkPnjLfJ0ErBiHkaY5N?=
 =?iso-8859-1?Q?+LkRDnw6I7+H8cKNv2ZDu0tcT3+xa57Xb6GpsiDQeuIFNRopZ7oJA/RV3m?=
 =?iso-8859-1?Q?7lJ5UIsTzr0SJy6iOAofhAJP9xtwqo9Afifqujr8N4G2seqbB7xPin5RNh?=
 =?iso-8859-1?Q?2uo8FbANnE7ACJ1jpl5icDCAUJecS5SMdAix9rPO2Nxsoe8Y2krg8QWYNY?=
 =?iso-8859-1?Q?cUSbM40ypyP90+gsZTWth74/hQ2nlZf3nfVebxNJEAjt3LCO2rlmCSxUVQ?=
 =?iso-8859-1?Q?7OpJaqo3tuGljUz5zmfgGWT0b7V9RthJjiaUjhsUvGaocjKVdKopjLRKTN?=
 =?iso-8859-1?Q?B7oHSAuSRiQbyfCjKIz3Hc59WtXEkt+EyQOmtpUfzAJBRhuf9rMiBJHG+z?=
 =?iso-8859-1?Q?wh+HZ+JPCBKo4T+NQaDhTBfciQSWo4bpurzXgVeHEUCAxkOYDVE4xxjHCr?=
 =?iso-8859-1?Q?I/CkInE/ApO34mGrdGUAs/D4/LRQPfGsazTKlt2X5LN1ISq7VxMgv0CD7J?=
 =?iso-8859-1?Q?P2vAOqyXawZAQdT++3uuW65aT+XaYLKxoXcuVSvt0IIPABI/+94qJhW7sK?=
 =?iso-8859-1?Q?Mn/o7VrcKwy5TDLqcBHltQTqcPKYdPqrVQJq0WW+MTyRbOdkvqXqUucynI?=
 =?iso-8859-1?Q?P1WstAMrzcOomeQvuHalVW/cX/lM7KdBOVT5JYif1FLjh5i1XbLi2sQkvD?=
 =?iso-8859-1?Q?U+UOKm9JC3ptWFuSeCP/W1TO1iWRq6E/Pk8FgltHfIFrc88m48eBtrem3F?=
 =?iso-8859-1?Q?ghiDgOfTHYfVZbZiu4VeYH8drBYXOP+UZJmuWlI7rbaolb5OicUdydijL5?=
 =?iso-8859-1?Q?C3mUHKMB0bZSvI8lLVGMlm8SufLBcaF+rcC1wfrtR88Bd/pINvFF0aAPtp?=
 =?iso-8859-1?Q?KdEKSrAYSPiutL4rCXL5d7X1sNG+izRDNO1NBitnznqNJzcP7lkHnODvjZ?=
 =?iso-8859-1?Q?3NyCqgoPQDYx2ZwfKUNXDWcWPyP971wH2qm4TfUV/g2WXxAjyc2TgxacSL?=
 =?iso-8859-1?Q?SOY3tl0Z6x4xHQG8Rn5XAlXH9udWCuGR1SHCN5K1V5lBsE5ewqiLtHE51I?=
 =?iso-8859-1?Q?VZOCrOimWLyFlE/fGc/pqBa3z38cRWd8fW4sKqMh28EhefIq8D4+tyiPZT?=
 =?iso-8859-1?Q?VMgusiyHic7yGUtslAcMGNltqCzLkJsyctIpFndHArAS3HucHdnkrh0lD7?=
 =?iso-8859-1?Q?vz4Mh2p5Jyoh6HWTVlwDSjcBfImr3Ck2nnG/yOMob67LZLhX6yPhFcJ88B?=
 =?iso-8859-1?Q?gDmfWiXWYvfyumrsnYvUPfg9+lMQY60t70EzdddVqfSj7lWiaZIKAYSXRr?=
 =?iso-8859-1?Q?Yljjyic2l4xLD/PsLoZBgC0KWZcjk7mhLTSSnBpMJ9jKZobMZXAfSr5ncq?=
 =?iso-8859-1?Q?0MgYNtE9Ogi6amcMAFjr3DeUaVILSLhwJk7ciIbPwaWilkMuVBjj44daa6?=
 =?iso-8859-1?Q?8PuHLkKtEy8+PuTM0Y52LjoA5Ap010CVf8jYh5guaZ9TCrWwz/YojU0R/P?=
 =?iso-8859-1?Q?cI8MIGnGSA/vmrbvuU08O9S7iLO4yhhdkY2ceA7KBjd72JglX6mN1PjshW?=
 =?iso-8859-1?Q?Evl4wSiJPTwp/K3sPvFT5f3tZ8D1A975ur7Qugj/OQGTb0C0KhyPtxC5G8?=
 =?iso-8859-1?Q?rzRIWnNmpaqc3d/5OmCJypPaXmK71tvihjnAuijb4M1L1P2OWW9cfIcV2d?=
 =?iso-8859-1?Q?fyijPcpCIw=3D=3D?=
X-Exchange-RoutingPolicyChecked: iy7S5ZfSEOshD05EnkYJeTXlyHcZfxABniIRyWF6P32b+Eyblnh/eiyCbdZIrK4fJtqY8pz/Q6NSaDh80xmC517yLGbb3uPTdrJni33CMsLC3uQDo1fS1DPT6IKW2MhQ9dMZx6Rd84xLFOtG1y1FEQE08lsgHIPWe2N73NrsWrg6RnYPp0rIcWXkJyK0Sfoasieu7AwZt8PaqoS8A7rPm315/VvhsnXM2SAWTIEWWVpuVOu4Ge2IlfWNaWni1Z9LwXrfdwcoWov6Yu3o82Htf/LTkIojdrnFLltIIoh3/J+O+gQXWnxqRobhcieugFrBu8BuHrZsLg/GkcHzLvFabQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb14d5c-23d7-4d93-8c4b-08def95b2615
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 16:51:41.1797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a4Giwm60GuCikZVSMAOmUxvUzN3wURy+U7G7llLWRDCRFH7tvY7EVuRyB7oo1uhprJSXOFfiTSzaFkqK6wBUVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8208
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

On Wed, Aug 12, 2026 at 09:14:17PM +0200, Michal Wajdeczko wrote:
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
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v2

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com> #v2
> Cc: Jani Nikula <jani.nikula@intel.com>
> ---
> v2: add include (Sashiko) and const support (Mallesh)
>     reuse existing to_xe() helpers (Michal)
> v3: fix another typo and fix to_pdev (Sashiko)
>     use assoc macros/helpers (Jani)
>     add support for drm_device (Michal)
> ---
>  drivers/gpu/drm/xe/xe_any.h | 137 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 137 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_any.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_any.h b/drivers/gpu/drm/xe/xe_any.h
> new file mode 100644
> index 000000000000..5d97afa76915
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_any.h
> @@ -0,0 +1,137 @@
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
> +#define __xe_any_to_self_assoc(type, any) \
> +	const type * : (any), \
> +	type * : (any)
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
> +		 __xe_any_to_self_assoc(type, (any)),				\
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
> +#define __xe_any_to_other_assoc(const, from, other, p) \
> +	const struct from * : __##from##_to_##other((const struct from *)(p))
> +
> +#define __xe_tile_to_xe_device(p)	tile_to_xe(p)
> +#define __xe_gt_to_xe_device(p)		gt_to_xe(p)
> +#define __pci_dev_to_xe_device(p)	pdev_to_xe_device(p)
> +#define __device_to_xe_device(p)	kdev_to_xe_device(p)
> +#define __drm_device_to_xe_device(p)	to_xe_device(p)
> +#define __pci_dev_to_device(p)		(&(p)->dev)
> +
> +/**
> + * xe_any_to_xe() - Obtain the &xe_device pointer.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the @xe_device pointer or backpointer.
> + */
> +#define xe_any_to_xe(any)							\
> +	_Generic((any),								\
> +		 __xe_any_to_self_assoc(struct xe_device, (any)),		\
> +		 __xe_any_to_other_assoc(/* */, xe_tile, xe_device, (any)),	\
> +		 __xe_any_to_other_assoc(const, xe_tile, xe_device, (any)),	\
> +		 __xe_any_to_other_assoc(/* */, xe_gt, xe_device, (any)),	\
> +		 __xe_any_to_other_assoc(const, xe_gt, xe_device, (any)),	\
> +		 __xe_any_to_other_assoc(, drm_device, xe_device, (any)),	\
> +		 __xe_any_to_other_assoc(, pci_dev, xe_device, (any)),		\
> +		 __xe_any_to_other_assoc(, device, xe_device, (any)))
> +
> +/**
> + * xe_any_to_drm() - Obtain the &drm_device pointer.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the @drm_device pointer or backpointer.
> + */
> +#define xe_any_to_drm(any)							\
> +	_Generic((any),								\
> +		 __xe_any_to_self_assoc(struct drm_device, (any)),		\
> +		 default : &xe_any_to_xe(any)->drm)
> +
> +/**
> + * xe_any_to_dev() - Obtain the &device pointer.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the @device pointer or backpointer.
> + */
> +#define xe_any_to_dev(any)							\
> +	_Generic((any),								\
> +		 __xe_any_to_self_assoc(struct device, (any)),			\
> +		 __xe_any_to_other_assoc(, pci_dev, device, (any)),		\
> +		 default : xe_any_to_drm(any)->dev)
> +
> +/**
> + * xe_any_to_pdev() - Obtain the &pci_dev pointer.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the @pci_dev pointer or backpointer.
> + */
> +#define xe_any_to_pdev(any)							\
> +	_Generic((any),								\
> +		 __xe_any_to_self_assoc(struct pci_dev, (any)),			\
> +		 default : to_pci_dev(xe_any_to_dev(any)))
> +
> +#define __xe_tile_to_id(p)		((p)->id)
> +#define __xe_gt_to_id(p)		((p)->info.id)
> +
> +/**
> + * xe_any_id() - Get the identifier of the underlying object.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the identifier of the object, or 0 if not applicable/available.
> + */
> +#define xe_any_id(any)								\
> +	_Generic((any),								\
> +		 __xe_any_to_other_assoc(/* */, xe_tile, id, (any)),		\
> +		 __xe_any_to_other_assoc(const, xe_tile, id, (any)),		\
> +		 __xe_any_to_other_assoc(/* */, xe_gt, id, (any)),		\
> +		 __xe_any_to_other_assoc(const, xe_gt, id, (any)),		\
> +		 default : 0)
> +
> +#endif
> -- 
> 2.47.1
> 
