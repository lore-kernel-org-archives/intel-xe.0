Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C305C3DA7F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 18:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC3910E4DF;
	Thu, 15 Aug 2024 18:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XBxA7QIG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B41810E4DF
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 18:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723745953; x=1755281953;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YQ/Ijxj+42XChOO0ee4LC2jwFXPjlm6Eybi/50GJ2bU=;
 b=XBxA7QIGFd7CBcFL6qX9yH7Mb4l4SYPAhQZWhyW4rmHnrvOVRsvxy9JB
 /V8Jq27SFtdjQaIjhPqWT6ZdQ1B+TqSvKdW0svAlcQo28VHO0yG64jnm9
 QEI1xWehh6zfYmi1BLK977p2gUALRsUXXL5EClChMovM1n/zeFNeoBVYs
 dKAboyngNR7moPVIp1547Rh859pXuuzWsgb+AgjFaJ5nkqrA0QwJ3HlRQ
 j9S8D2CAaJjzj5/9ox1fDWAcKHZWqIDdb9HMScXTDeA1cgGUIEzLlHmsy
 EDiqwLmBuridLhtHNmkWJaqRKPY3Qaf5lDvgqBpmTrHVEnTlmnwOkktYA w==;
X-CSE-ConnectionGUID: VLk9D8TFS2OEGPYQdf3u+Q==
X-CSE-MsgGUID: rn4zxr5tSV29ii4U9inZbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="44539517"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="44539517"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 11:17:23 -0700
X-CSE-ConnectionGUID: EI2gnZFbS1S/vt9daFDTAg==
X-CSE-MsgGUID: xLPQfKo3R9e7PODZOPMYug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="59460513"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 11:17:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 11:17:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 11:17:12 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 11:17:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0AjnZTSLcUU2U7HUQQECCLCh5pxncyAB2VmDhUhHVjwsfyPZcvKlJ/Sx8yisDVdlRLEV2wTGDOJptepTfWt+AfjVH5bK8W+ZNkYCyV4B8ExVecpy2UP7x0xll+s7q8BsJsJgJMu15/fey4a2Tz89SV3JOSe1DvOubbrrqQ7aDP80rhE6G42T9Nld71Y/6c8DqmMISCWCVg1Y70DjHVqYTqyQgnIM+qjBsI5wVegQg2TwGDruHuPHcJQvkmHrCY4j4snVey/gjE/oIOwRUIRSaReX7aCFSQaUY/nZIvpoMhnWMHAjCx0TpnTWDafhCImidXnFxobZ1zPqZdGbPKytQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0tgN+P74PLsw//+TBSIN5Ry8KgOnmkFYJdDK3/0iU4=;
 b=yfuUh7G/enI1JOuYl+6vkQkBc96YvvORIsr1wDTlKS32jUYCtYLFwxPExfeZkd8MN5QISNfMowSmUmtzkFFwhrG1HqEIEED7tbJZ4HvguZlWUEeMgnyRL422MNaQzu0Zy7MG0iWDvQ4fNtLCLpVspsIctg7zsu+K9TWttewR3bWlwHyKP+cV1gOx4q8/aFpqshvLkZxuoxULb+/LGEJnCxXDnegALhrhOvyNFfY8b+caOA9Ed197931k+3BqjuV63Vyoqy8z1DRvG0euHydDfQ52CeqdrUvwj3vm/hDDre+wMw3VcvfF7vr971Kvbwoxurrh8Jbcwkiu89oIX3HWnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ1PR11MB6228.namprd11.prod.outlook.com (2603:10b6:a03:459::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Thu, 15 Aug
 2024 18:17:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 18:17:09 +0000
Date: Thu, 15 Aug 2024 13:17:05 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/oa: Destroy dangling oa streams when xe_file
 is removed
Message-ID: <b7wpmfrqkk4mjguhu7ecadtlkkbwaxyywajuedzeaai7yoaca5@dme6wvhaoci4>
References: <20240815162758.36495-1-jose.souza@intel.com>
 <20240815162758.36495-3-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240815162758.36495-3-jose.souza@intel.com>
X-ClientProxiedBy: MW4PR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:303:16d::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ1PR11MB6228:EE_
X-MS-Office365-Filtering-Correlation-Id: b3a10d05-de41-4f92-176a-08dcbd567a42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?t+wK9dosJut1h2E508Wt8NwBeefD2Rv16dFcw2T5NFbmen7c+VNGt+nKmw?=
 =?iso-8859-1?Q?RMOXTCtsSphhIRB1pLmCLvRf0O4HcVdJT8STMOYF6Vw68z/AJx+IJCJUYg?=
 =?iso-8859-1?Q?D0fS4sXrHwVVQ2WxPRfhQ2CxcPBUU9kGlAY7iKD27W3v4fD+Yasi+zVHEk?=
 =?iso-8859-1?Q?3GLLfG5FdvN13NnbYQk28xrbdpNtCIvr3rnXSR/v87cxqy8/QBGhI0Gj0d?=
 =?iso-8859-1?Q?TuOa/4viWJmC2pciW/PesSFwLoa098J9p+KImYnAuiyVdzXJmWC2NtEP2y?=
 =?iso-8859-1?Q?vdvc/8440pQlEW3cSSBqTmWRI+xM/pXk2LAMNWiKqQH0TUcXaE9oHJLUuu?=
 =?iso-8859-1?Q?QNTVC8rVsD4FFLZV16jFJOJwMW5dm6Mwos08il688Z6L6gYp5fvje2zTbA?=
 =?iso-8859-1?Q?Fw56mSo91hrvTcSiLPr47DQEvnRYV2v0trPeKWeOVMVvfBr50uwJVC4CIX?=
 =?iso-8859-1?Q?8rrT1gc22uT+Y9xxhge16x/XrI26A5qKS7+pwDETrzpCShpy6l6TXbAmHH?=
 =?iso-8859-1?Q?GdmXnCLo7iEd11ZZuGORqdWTcq99RzrVvjs7dVyeMIBB9BkjYGYtUQHo0+?=
 =?iso-8859-1?Q?j1uLXmZhGlTAjVCSqiWDDJixt6qGYmTkonHbdK7Z7jAQBuBJBOEZCUlJ+h?=
 =?iso-8859-1?Q?s9beef3VcIdx0haOBr1IPAs4tnJFtCXk48qb9CvCEPyysmWi5ovJGN6Jlx?=
 =?iso-8859-1?Q?XOLiU+dfNwL6tJV+QWCaZjU2uQPcg/0kYv5DqG9NPa0D4GGtlI1jHey6Y4?=
 =?iso-8859-1?Q?Y54+0VG77gQHseRlALyrPyLCTn8JElit+oZKtG+CRAhL81HDvwusRqmc07?=
 =?iso-8859-1?Q?LhDlRuhvXkXNIjzXmIHJTiO5ah7iVghrSDtcqYnAnv8zAvGGWcqzUR2Zy1?=
 =?iso-8859-1?Q?CCCcEnh8rM0l8YaOmJAQITuIzPSMArcbRJ736FjRikJgvCcfjD072CDhiB?=
 =?iso-8859-1?Q?Bl89EL4WccxnTD5Frkbc6PSDUFevYIWYoDQj0lK2IBQHBi9fZXXXowvYo+?=
 =?iso-8859-1?Q?uKOFBQSA6uQUaTrjMsacNAl8CAn9II0/ewfY3akb6gp2kYjuffpeyNYcnv?=
 =?iso-8859-1?Q?1vPpB0k5zqGbnyUY7HTROVZ/VlpkluoxJdQ7HHMvq/ujLiFDoh3p57Ugvz?=
 =?iso-8859-1?Q?CFRmp0ROIU4vAvWbDUzXVSUwTkPBqJFWRPY9RLsNJMSIAVc2/FVoEYhQm2?=
 =?iso-8859-1?Q?1XSd6wx+qT0Yj0Z1jfmLR5NvwqC5GJ0KDcVH+EpV07YBeIPRtEYMhPLz8J?=
 =?iso-8859-1?Q?ZnVhIcGoack/WFweGDY5wmk6Iig3mrpvn6aN4QivVCoNKr+RIeAo6O7fn0?=
 =?iso-8859-1?Q?OgeD5vphKvRPU9fQFzioSt4IM04xvgzn8TpC0HcrzNlh+xw9rJ8DNEDNpy?=
 =?iso-8859-1?Q?2g+mwCpFDjg+xLgCxSkFV5ha+9IN7rLQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gGHVyznWVnbjl95vR7IpazdYOt9pQ4pEIjTe1EGgYoWLWKXcMOPP6kyONA?=
 =?iso-8859-1?Q?WXxaK/uOY+R1UEBhLOHkoO9yEZV/EEJbbn57bqY8G96pHEth0YQVyApNzT?=
 =?iso-8859-1?Q?Qe8n6+LRHdl6WRx8PRe6bMfdls9SPzf+m7HtMAWmuZDUHwmA6W0MjeW4GS?=
 =?iso-8859-1?Q?8AtEPHTlRYC7wZD3lFrKS7z+/rlo6S6HQb4+W1Yf3VajUJBigstwZzJW6A?=
 =?iso-8859-1?Q?rWRuZsaliEcXTZ2z136NYazEI3cHnxWgR/z9sf1ssden1TSkyCF7Y4vm2R?=
 =?iso-8859-1?Q?zZZa814PDk+ieTFgywu5gzTM9uuty7VuSgoXpcZ8s2uL0uYppURSTNjPQE?=
 =?iso-8859-1?Q?fDsMk2PleIC1fijnF9XGixSIRcL+tzDZmWutb1EIIP8tAZtJ7D1HZ6aksB?=
 =?iso-8859-1?Q?O8AahQNoePxt+f63G2koAhZYPkKLY75Gvk2p2tEoNkRTHOuqN7/0o8vq0S?=
 =?iso-8859-1?Q?bYK/diR60O5JrPP/5jMmcr6Kg4oz3BDlLaVCWBKEm1JiG1BYtYoTa24tp4?=
 =?iso-8859-1?Q?Hv0vb+hQEGXNSR/YQMkrPWZJqNmHjOMBLgxcoS/AR5+7rzzPONYKgF1QDy?=
 =?iso-8859-1?Q?1VZu5E4y4ViEMRay1cPefuSGisAR3heliEghcqMgAnd7YRQ+Ig7+8+FABp?=
 =?iso-8859-1?Q?EsdYCOQxltq3OT/x+9Z32uiGVY8p5cOlciI5hZjNz0S3FKu0ibVg1ipR63?=
 =?iso-8859-1?Q?UItTL3sYPYIoFDZtV5qc9eYV2d9syFYKZcj5fD90AYGoGTIodZDoWsO5sM?=
 =?iso-8859-1?Q?tq3d5ZOIaQj6j/PtOLxeGE0fCgJCKuNNBilCJ87Sjyobpsng9I6emx20Wm?=
 =?iso-8859-1?Q?g08sP6IFWwoVSZf2qi35m9Car9H+xozLCzI5RnEi1AkpBdPcg7Jf2YScgf?=
 =?iso-8859-1?Q?1RoYj5kevGJUieOyzEZgBJUXmxJBuYw8LQ+LK1wkupfV5WZZ6rkxacjX/R?=
 =?iso-8859-1?Q?L4U1olWMjyXFY32Z15P8BAiYnJt98ddvqbig790LMHZ5OrAzR3crH32DlW?=
 =?iso-8859-1?Q?gCO8vdEjdkPtTsX1SsOVcyUj2viEgPgiybHWsDjqjsfYpq1XfDkHjxgxea?=
 =?iso-8859-1?Q?lDeXDwjEuveQJU5kMgHCF1z+yGOectNg0R+xDuO5fcfzj7uJe5scPfuT/O?=
 =?iso-8859-1?Q?lCUvicAjWCG0MnsdA64oB6pVT3f6d6Sty0Gc0y8CxYISFMTQ7S6XmYBzS/?=
 =?iso-8859-1?Q?f7hABcbvSz4LI2at2u19iKFwwkCtE44qRa25/Dun/RlctqL/BOEk5ySgUd?=
 =?iso-8859-1?Q?rVqCX4dkDOVwHi78X9gaKW7KUiQIWkyyLq7PjwTVpv7xlHpCU2kyhW0Fnk?=
 =?iso-8859-1?Q?0hHza5VCGy6KZ6guiSCNWT+MYtSQ1bJFj7porAcrTgSj35MEobMqjn9YL8?=
 =?iso-8859-1?Q?cxo/NdBZwU71Kuqg1MExKOckWHWBSw/PKDFezg9+N5wEK2VvJVMySenFTI?=
 =?iso-8859-1?Q?YYg3JMna3deOjrBeXn4ym1v1j0jcdu78pnEmcDhWtJMA7HEUmRTkRBEqtA?=
 =?iso-8859-1?Q?llcsDOIE9qeYGqKmv/f2ZJO/sqDUBw4ZsulttfyJkTqErhWFNVGOngs/QI?=
 =?iso-8859-1?Q?6pgIhmWE2s/fbBMHGEg2iDsYj3HCpClRTg+m+/SKe6qCkAie71nGgcHdn+?=
 =?iso-8859-1?Q?etZDuLAEIZy58Qz3BnvSlg0M1RHMFkb8tByIZb494Cbd/ZsNZjsKMd4w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a10d05-de41-4f92-176a-08dcbd567a42
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 18:17:09.8847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4AgqU5xEPMhNL7u0oFWW0gNZBh6y06HDVNqJo5+6G3o/BW6HNKfrB0gBpAvOccTihxngnCgDEiamc88yLtoExXwjHkPsgK11dYKJLuJgow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6228
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

On Thu, Aug 15, 2024 at 09:27:58AM GMT, Jose Souza wrote:
>If an application opens an oa stream and for whatever reason it don't
>close the stream the oa unit associeted with it will never be release,
>so no other application can use it.
>The only workaround was to unload the driver or reboot.
>
>So here adding a list of oa stream and and when a xe_file is closed
>it will also destroy all oa stream with the same xe_file.
>
>Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c   |  2 ++
> drivers/gpu/drm/xe/xe_oa.c       | 28 +++++++++++++++++++++++++++-
> drivers/gpu/drm/xe/xe_oa.h       |  1 +
> drivers/gpu/drm/xe/xe_oa_types.h |  8 ++++++++
> 4 files changed, 38 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 2063283871503..b098685ed3636 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -158,6 +158,8 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>
> 	xe_pm_runtime_get(xe);
>
>+	xe_oa_file_destroy_stream(xef);

I'm not sure about this impl giving xef for oa to delete from a list,
will leave the to Ashutosh. Comment below about a mistake though

> static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream)
>@@ -1480,11 +1484,15 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
> 		goto exit;
> 	}
>
>+	stream->xef = param->xef;

if you keep a pointer to xef, you need to get a ref. Use
xe_file_get()/xe_file_put().

Lucas De Marchi
