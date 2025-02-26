Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8357C021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 18:05:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B8F10E9A4;
	Wed, 26 Feb 2025 18:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MwcN6t6+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D250610E9A4
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Feb 2025 18:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740593146; x=1772129146;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OD3fgVFWCiFMTTbvokqc3v50Nd7xWGVb4mcW6Mll5/E=;
 b=MwcN6t6+GnQCRFwE2HdHNXjbPM5yiVyRI8gjmsVjoi9fkgncUMdUEh62
 c5qC3AIBEHBqr5o1+zDAn13mzibbabJAs8ConDq8qA9QRvGqnEZmKikB/
 e3nwFYUO22t8EC8dy9WrQZPmcPJK4Rp1+MVCV+knFjbg37UHLF8WHK/1y
 c3Gv90HmhbpH8Wr97UWjdnmqs9cclXSidxa0nggeMr4TCOUqkGeT5I3RW
 mVpNYfJLRNtdcbp/bDIDfPsP0Ex4XrRtSAhHkq7za0x9ptNPfyjaGkcGR
 MDqxFf4i/7ZhvBDXnG6rDNUTBoxOaLi6YO1mSNSZP4+uR0qDrYSeyJNqh w==;
X-CSE-ConnectionGUID: 592qrRgVQRChzzBR9srspw==
X-CSE-MsgGUID: ugF7w4QzSR+8z8Fa7r9GeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="45109152"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="45109152"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 10:05:43 -0800
X-CSE-ConnectionGUID: ZDHEg2mRQaSsp+h95Fw4nQ==
X-CSE-MsgGUID: /kJMHdluSYajJPwKyc59IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122034402"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 10:05:43 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 26 Feb 2025 10:05:42 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Feb 2025 10:05:42 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 10:05:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fgmh4FhBb28MD2MKBcx8pczsUC0Rlb5KfcPN3cT3UtBBzNKW6cJ8hjJvem/ytleemK0YiOhcwBELzNaw7cJ6qqj0hSplJVWsV8T4OsZE1hUZoMRrEBTLEojPicbMXN1XQ9z2zHdtaFD13p4YNbHrbjnTpFVA3TEwWjT0K7bYgBNLLXWmioPerVMFspffWqJ5L1xpKsqnVEQD1WnVSQtAGxal31QDdcrjHlINp8zMG1lt4IxetjCUb2iulUWR5fQAyaqavU9Ivv6/G1GyzTCsbT0K5ncH46XrKQ3Evjx2VpQA3XAhkYeH2MnruBu07B9Dw8SZBB4n5LH7bjAh8Df4TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQ+ujowpKxKGlg0H8ftdpJQhnXZJARq4akY4htwrBJg=;
 b=CCkyppc1oJueLojfKobzp804u1tuhN+JX8TIkbUdIWYDKwZml1aCsft2H3jBF3hnDSNIipgvFtdVRP7wZFTLeWUrLBtnNPdGp18SiFK85E8bWx8P9vRWAedPtofs56jSkb3xv8QgCUBmuAF6bx4pcMuROVJ6KCFXuRw/V5gb9PugCDgX703bEBbWmOqWPj6e9LpO+IH6GvwYSFUwSzByaKoMp48+AqPNm/8msvIjy8k5/LGtI5mxsfUyVA/JKA2PwKPLWGLw/hGhG3/hZIEtcVESaT+R25FEMnE0TvmUShxhGKQTEbC2YTfuev/FwYyEbaO/6/Loumi90xItbkFwyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7382.namprd11.prod.outlook.com (2603:10b6:8:131::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 18:05:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 18:05:41 +0000
Date: Wed, 26 Feb 2025 12:05:37 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matt Roper
 <matthew.d.roper@intel.com>, Gustavo =?utf-8?B?Sm9zw6k=?= de Sousa
 <gustavo.sousa@intel.com>
Subject: Re: [PATCH 2/4] drm/xe/gen12: Add Wa_1604555607
Message-ID: <ekcbjeapswo73vrk5o6c2rrokyu3csujwtmdkzt5l5uapwzcnm@lbsee67yzjjj>
References: <20250226112106.28173-1-tvrtko.ursulin@igalia.com>
 <20250226112106.28173-3-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250226112106.28173-3-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW4PR04CA0078.namprd04.prod.outlook.com
 (2603:10b6:303:6b::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7382:EE_
X-MS-Office365-Filtering-Correlation-Id: f88d5de7-aaa9-43c1-c83e-08dd56902e3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Wr5pkGqNTI34iLVoZ5La245FY8Xxkr6IcR9Yu9162cclEs3w7Z+L5BtobB6I?=
 =?us-ascii?Q?DQLsdONE1gIznX3Hax4SxZndrksWiDqa4QlbDtDe1WJC6XHK02V+6bUPHp6g?=
 =?us-ascii?Q?YzHQJvTTFc2urovzUzWr+sIonlEZsrhmMc2qXi8TaUU9XGqxN7Nbti3xYYaE?=
 =?us-ascii?Q?3ICcOlsQKSh33OOdOEVUHybc0412AEi6CxaEb81UH/RMuaB2IjBEUcF3E2Fg?=
 =?us-ascii?Q?j5gUv1E1QkJPxq8eaCmKxjil7xbVDQiDck6WczEir5o2/VDM/YhFLT0HnHKS?=
 =?us-ascii?Q?fi3vXrdkbK1BWVnplROuPyCpSp8mfUsy1jIaxu0WlFUYmiNxhkvMg1g9SNVu?=
 =?us-ascii?Q?uXCg6yZboa5Slc/vFiXTpNgyzogSlBOQyBpTAOY0wJVxNDIltwJ2ymDpPnsm?=
 =?us-ascii?Q?fLgTINr56hDaECIyLs53k0YV0ZQREiv2xfSWhMA0diBGGW1lXY90+T4pprPa?=
 =?us-ascii?Q?z1rvAOvZHaIEwUPffLj8a3MffQ9KhH7FHyLh1Nv6WjAV5jJbxV3HuhBh3kof?=
 =?us-ascii?Q?NmK9qXc6UbcycAt83RKxdiZeE8ktUbwjGVyEHO7qg8msp0jfRUwFLmYP0PHB?=
 =?us-ascii?Q?bzc1MHrhPcpGtVMYFOq3KnGMYFkh1gafywVPJhyg1fDYI32UT9kDt9FuuWCd?=
 =?us-ascii?Q?O93krRNRXrtLEjw2Y5Wb/dJvvsrQW/IQYqvPr3L8rbQz65n6ZkvkWOnmSa7t?=
 =?us-ascii?Q?Z8XhA/JOFUMK2GBQTl5FQqmW7bSDlmXNkt93fLyZ3gKzbnuMmqg/kHMhaVUh?=
 =?us-ascii?Q?GE4SjBo6exsD8np2JW3lNfUBjb/RK1rDgZ2/PYh0mfW5c1OI3jh2TV1LuTMS?=
 =?us-ascii?Q?P3Hb1veXdWfXi8xko4e/Ts0RJiKVGrQJLG/E03mVlo3xCbcE9ET1t+XJI3bz?=
 =?us-ascii?Q?5j5FuwQ2LDj4ApqTfH5frIsw+RTqlBrgqyrR1JfSTdlb4bQoGfBy8Q2D1770?=
 =?us-ascii?Q?BhJTgnjqhfroFz7cMk40roiLtTbhoeUbtTn+XwNMi6JDWaNC32NCpkUCvV0T?=
 =?us-ascii?Q?XTTXVO4h2JsPYwVybcoO5uwT8HOjNYLl1L41Rp8VmjBCBqEqZrXUWbPoQqvQ?=
 =?us-ascii?Q?vSLIgrGavnQAHrXd0E9YtTNwCreLRvXkcRyuosBcY0+elsIepGismkxJIekI?=
 =?us-ascii?Q?TtgstwXUd8jgAUDQ5/kDzCEZZ6ZJ1CV4bYspF1V1knHSKpq65iafE0f1iDk0?=
 =?us-ascii?Q?tFFjXZbeP3nk98K5Xx63birf6y9K3XFkAKzfRMT2yrxksMTDukYhbE+dr+XB?=
 =?us-ascii?Q?zwlACDSbmaaFDJYEyb11n2Z7eiBqsXBD89iglgUfw+uSolOXTbK3QdhExVaO?=
 =?us-ascii?Q?F9vUkmlhJbgixtu/lQsnkw1P5hTrpEnOFM9WAMfoghnmsCdqZ91md2hJMRUe?=
 =?us-ascii?Q?CEMh6ZjXY/HIeM7rcGxibWEh86Sc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lwCs7HRUOWSDtfAPAzN7RuJrWRz3wCb3wiHcddoAg/aVEXrUY+Xqn5lTzfC0?=
 =?us-ascii?Q?/hvijU1+AsazZDstvxcZVTR/mI+fu1wJCFVpELWROj33nqXvFzPpqcbW9M8B?=
 =?us-ascii?Q?z27g9ZN5dmalym1M+2tA5nb1G+VWVTmFxr2N2YJpSu57RAuJblqlQQnd7VrF?=
 =?us-ascii?Q?SItHwlZKhoiSVQ5+rlrm7Ar5Dnkkwu46BVecFMTK1Mtxp5V30ktRIrUK6u9I?=
 =?us-ascii?Q?kIWuaadUP2UImIeMomGB0s2PS4ZUoeWmWbRHLOw58omvRvdzKqpU+kTehTBC?=
 =?us-ascii?Q?jdwCD5VN243TFyqrDXESrCFuTG7ldFpJsQqwJfItl/dNYGiiyJ4Ss2EMQHCG?=
 =?us-ascii?Q?lusRwM+5jnjZlByREOZizkNWHpQtDF1rGT9aCbR8zmJgBBmjny+KGLBMfwLU?=
 =?us-ascii?Q?IXIcu9/amIconm06Uf3V9O0WcRPicdwrqnNetev0yEsARvsJQ3T12gj5p+0M?=
 =?us-ascii?Q?kyNd+MGjq7soLAzDnu+dnuUL+Im5whG9FqjhNUL9vZ430RNFjWY3T9TFRkku?=
 =?us-ascii?Q?H59cpX70ZFSQjOdoNsSriJr2y5ryEc0axpPxYAi0mnz3LbQ7pGm9egQAE9C5?=
 =?us-ascii?Q?QihapZ7DabNxqRM1+zYmueNqAucvy+LARsQQ5TxwfOHdtyQqBbgbb062yg6r?=
 =?us-ascii?Q?yEaqPUeOSaAVc8QfBTAmS5bZz9bl7DMjxqMp1RYIkVPEfJOrRNKd4WAgTxHh?=
 =?us-ascii?Q?3qcZ/ceBmRxFQgKyHFZyZVAphRfGRku0PePYxWTWBPdd8SCDIqClIyDh+tI6?=
 =?us-ascii?Q?AVWtgMZLt20rZ76fiLzwehUTEsm8dBbYOqEg10/s7oefOor2Gz0GCqHiuR4n?=
 =?us-ascii?Q?/x+6u/LVmS0LdS7blPTjjroSSkVNp9hQ/xxUPFpeO+/GmsLUxIFvBohWEmCD?=
 =?us-ascii?Q?zxx/OfEUN71hJ9VLkPKFcdCN5TODnBmyTBRfDPl0NwN6ng3RpOG9slFaHxDC?=
 =?us-ascii?Q?FbO12LcGraD37IClefFXDqNePB3y06cAIMt+Ja8/SYmJXaXqVk0YSq9DoPs7?=
 =?us-ascii?Q?oslBDEWbcjUhvpaxaZXya1yEPZe8dNQq5PlrIfcSMVZuzi8omyyxBmxGfzeb?=
 =?us-ascii?Q?0jqplvt5or/Vwgv++c8n1LgUo6MQkbR94PRMuHvZdFPBw294NeYneR6jpKxC?=
 =?us-ascii?Q?Yga3V4VArPRZ3Rti1eWUHjJL5q0Ac8PW3bnaHQMHRDcnv+ZtVqhAd29OOpQ5?=
 =?us-ascii?Q?Fur5ShdGWTUSTt2tSPJpKGglSWBj6/rKAvYegAlENWCtXhYKm+cREtlWLgNg?=
 =?us-ascii?Q?LmNIxVbEplGa5Z75Ug7ZQsymF3yLZobqeyE2RWf4qLVeYWNL1ehagHkrOVJF?=
 =?us-ascii?Q?rVoKJDBA4L+p5FYjff/XQ57nTGmATog+HYJGcyX0/akrEkJntMQ1ouWFsUXU?=
 =?us-ascii?Q?Yc8gEjQhBOsXMigPnHM1GFTFJddVhRFfOsD/Qkvkn+XY2zfrbuQhcLTPOaTu?=
 =?us-ascii?Q?TV9K0C44sFQVc4CiA5BspmkS7wAnquBo0iTmwKVsS5CprZwXQnf7QZ/a4hR+?=
 =?us-ascii?Q?P+IcQSoQ4p1fQI2sboSMph+5nGiP2uwoHll+XidpCrVakxLJNjAObjiz+vQW?=
 =?us-ascii?Q?OpHViR9cQK72yuLq9a13jMtNPWmbc6syN7Q/5uzLhOAXLfeLp0wFJU3HA0Gg?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f88d5de7-aaa9-43c1-c83e-08dd56902e3c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 18:05:40.9510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YFgxdQOoZoLbboiERX+8Cbk8r5RNIzdYyCvKbJcKfHkkpaY6ipOOtjqaxcZ/a1Q24PYUIPRBKFc5ziGuX3caT7bsVuDb6LXDTB9tORVEv8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7382
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

On Wed, Feb 26, 2025 at 11:21:04AM +0000, Tvrtko Ursulin wrote:
>According to the i915 code base, apart from setting the GS timer, all
>Gen12 platforms should also set the TDS timer. Make it so.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>References: 2b5298b0aa09 ("drm/i915/gen12: Add recommended hardware tuning value")
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>---
>This needs checking by someone with access to the proper docs and proper
>workaround database.

Tuning and WA db are 2 different things. Digging through it...

Tuning:
	Bspec 31870 only tells to program TDS (bits 23:16) to value of 4. There is no
	**recommended tuning** saying to program other bits.

	That is FF_MODE2_TDS_TIMER_MASK = FF_MODE2_TDS_TIMER_128.

	Same bits are also recommended for DG2 in Bspec 68331 covering DG2 and
	MTL (however in these platforms the register is  multicast).

 From the WA db:
	TDS is documented to be programmed in WA 1604555607,
	to the same value as the tuning, for graphics versions 12.00 and 12.10
	(I'd have to dig more for 12.55).

	GS (bits 31:24) is documented to be programmed in WA 16011163337
	for graphics versions 12.00 and 12.10


>---
> drivers/gpu/drm/xe/xe_tuning.c | 8 +++++---
> 1 file changed, 5 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
>index d449de0fb6ec..9e7ec36dbd47 100644
>--- a/drivers/gpu/drm/xe/xe_tuning.c
>+++ b/drivers/gpu/drm/xe/xe_tuning.c
>@@ -97,12 +97,14 @@ static const struct xe_rtp_entry_sr engine_tunings[] = {
> };
>
> static const struct xe_rtp_entry_sr lrc_tunings[] = {
>-	{ XE_RTP_NAME("Tuning: ganged timer, also known as 16011163337"),
>+	{ XE_RTP_NAME("Tuning: ganged timers, also known as 16011163337 and 1604555607"),
> 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> 	  /* read verification is ignored due to 1608008084. */
> 	  XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(FF_MODE2,
>-						FF_MODE2_GS_TIMER_MASK,
>-						FF_MODE2_GS_TIMER_224))
>+						FF_MODE2_GS_TIMER_MASK |
>+						FF_MODE2_TDS_TIMER_MASK,
>+						FF_MODE2_GS_TIMER_224 |
>+						FF_MODE2_TDS_TIMER_128))

so... I think this should be only about TDS, also known as 1604555607.
then in xe_wa.c, the GS programming added for 16011163337.

Matt, Gustavo, can you double check that?


thanks
Lucas De Marchi


> 	},
>
> 	/* DG2 */
>-- 
>2.48.0
>
