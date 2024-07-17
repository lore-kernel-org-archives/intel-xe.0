Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6676FC3DA60
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 19:23:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A79610E355;
	Wed, 17 Jul 2024 19:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cbnmT8g5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6E810E355
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 19:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721244224; x=1752780224;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=i8ETFdFSYZ51/8l5faJ0Zzc7vKYwm93F5GjaP47pCnw=;
 b=cbnmT8g5wYGfbEaYEluZjT1s8WZ+f0pssw/LR2hSOcyJGdEeJCk4ViN0
 THUuAY6Vg2NWLG7vvnF/kD7+TniitFx1iHL5oMi1YRxTp7PYvKPKLrcv/
 fn6U/QNL1Uh20VCUcbWr05mAinYDBFLIW63zr+8m33Y5krqvmfsPfw/eB
 8idDIQipWJUNyTFvniTCGdl5t75XG1jYKd6rh1U1Z0ng/SLzduCqWGUho
 H41MkZ/roNCwSOGGhnrY8063Oai3s15coFoP4Rcgyi/bcmyQc3BPUgs60
 TM4GLhLAtQuK+2FkFyIqPZl6oLg6hovK9TKnor1DHH3nYhSqtw9owKMVk Q==;
X-CSE-ConnectionGUID: XsnlUlOHTHiP6ogVm3iWzA==
X-CSE-MsgGUID: EwFDSiOlRaqXj61JDIqdhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18726443"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="18726443"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 12:23:44 -0700
X-CSE-ConnectionGUID: bRmQSE6QR8Ox36OfBGJBVA==
X-CSE-MsgGUID: eJ82lUOsS+i4c6C3xywz2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="50370827"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 12:23:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 12:23:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 12:23:44 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 12:23:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLLh/mi02ifjyTTOHg0ZWo9PWv4gS2bttNIZvefzFMIYahjDK+8BZ66SKAcfbiYkjoUpAO1M4VTlPgwVOyCttXnDwZI09TP/Yob7rxbVmujlIniLAck8dDpDqRL4EOetApetBEJJu0Rt2heeCJBY2q8hB2fGZ3cXa+6TvEIfxCHszWJA4ul91IjQsXE3EDEnx7QyBEdjPoaYB2pUP4nwty2l5jAn/Q+oLm9nfXvrp/nrI8kWx/lUW/gEFnj8HSF3YD/SzTND7drLVIn7wPwiZOV5e0LwhSZIi6YcdL+0TL3wdritHBIqQmQAOJku5X1d8LyIBl16WpVLi5zpUJ5ngg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwAFHgrKv/x7ERH6ZQ2sm9dU0oBxEPN/KsjeR08eE3U=;
 b=G6NbwicrUpH12Ixgzg9GhGOovk4VDEXBoIqiK7oiYRe3CC7p9quAMKaOgGOnpCcV0nH6YHtnyZS8vYGuDDiXanJnZTEK+SLAboTeH96w3qBF+IAOl/mVmTdUAahOPHCL7zDISaAXUtMZFi/0Ju6Oo7wU86sdpkSxfZ3JKGpl9uEHBmj00UvvZaemhjlsIVdKpw0Ha6a/KWJ1aURb/hIz73+y3QhxjWhHIG8eDwQzJhZIro178Dzir2Ny8gH2yh9+7XrICYEhRn1Jy5jpVophTLtu9C1y2fCALirWotEPemZls4rse0zTdBVTVKuSnZ90JPiZAb3I+ju4dI/CIZsc1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 17 Jul
 2024 19:23:41 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7762.027; Wed, 17 Jul 2024
 19:23:41 +0000
Date: Wed, 17 Jul 2024 12:23:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <vinay.belgaumkar@intel.com>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] RFC drm/xe/xe_gt_idle: Expose Coarse power gating sysfs
 entries
Message-ID: <20240717192338.GV2906448@mdroper-desk1.amr.corp.intel.com>
References: <20240715095455.4069296-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240715095455.4069296-1-riana.tauro@intel.com>
X-ClientProxiedBy: BYAPR07CA0075.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::16) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6211:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a103dc7-f253-49c1-29d6-08dca695f74b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTJsN3BTcUNHZThyK0ZqM2pnOXhybzF6ZkorT1BrMFZuck0yeFh2bkg0ejk0?=
 =?utf-8?B?ZGluUzg1K0JQcmEzRTVYcjRIZ3FhSHJTU2VSbVBPclpxaEhPR2Ixb2drMGVC?=
 =?utf-8?B?N1dEMm1JeTNpQk91dk9jTjRJOWtvMGtwS0JwaTNONm9VZWNSWEdkUHlkVjhM?=
 =?utf-8?B?V3lmZnJaWFNMU1NCL0tkWGxqOWE2N21xSURIMCtOcStEQ3dYR2ZrVG5INWU5?=
 =?utf-8?B?MjhGVkdhTjhReS9YR243WkRvM2dPcWlmYk9WVHJadTBMbW52bjBuVUx1ZGJH?=
 =?utf-8?B?QlVieElxdnZ4YUxUSkE3bk1iYUpGWGVMSVZLZU9uTlEvUjlTRVJqNUtsaURs?=
 =?utf-8?B?Yy92Yk9Ma1VGcml1THVuTmpyRUUvRUYwVkwyUDM3aWp3NVF6R2dvQzFNa2I4?=
 =?utf-8?B?eFp1LzFIUlhtdks2SDZBcXhEdHFCV0xlMFdpNFpHbzVreDZ5RHFadzV0bmxF?=
 =?utf-8?B?Vm0zakE2NXcvZnZQdVNYLzlIM1RPSkpjOWlDNE40dVFxd1BwWk8rK2RJUUZu?=
 =?utf-8?B?OWZ6RWlvZUN1RDRYNERic2R2WW9LQVdneklkbzNyZmMwcytIZGZxYzEva1VY?=
 =?utf-8?B?M083VGQrVUNxUkJPdHk2L3hRV1k4QnNOc2Z2VittVFAzcEtYOHl6ckpDblY5?=
 =?utf-8?B?Z2QrYXlhcXhNblhTbk1CV1luWWlnOFVMN3JpU2VJZHhkSWNZWVNMQTk3WExz?=
 =?utf-8?B?NUF0Q3dNNUlJZlh3VjhicUFOMkREYm93WWRzNm5uakpiWHpGLzF4MzhHS3BV?=
 =?utf-8?B?WlNvNGlRQ0dUdGxDTmlVdk9yUEdPWnovcmMrbFZqazAyUFlBZm5UNFl2dXhB?=
 =?utf-8?B?TnR1QzZsWGVSWVRRRXNJWTNPOE1jYmlmY1M0Y25TNHhPMVczQTR1OGt1UCty?=
 =?utf-8?B?ZE9BWnpqcXlJNllrOXlDOVNuOHROd1ZGdlQ0YTJDa2hkeWxza0RoNFk4eGhn?=
 =?utf-8?B?KytJcEw2aCt5ekR1VDVyZlgvaFZ1OXFGQk9sYTIrYkRDZUdYUU54U1dVQ2l4?=
 =?utf-8?B?S1hRZ2VDdmR2MzJVaHVEU3JzVG41TTRPUndqNlBkZDhZZkNkVGR6ZnNQclpQ?=
 =?utf-8?B?NW1lQmhoWGJvVi9sbklMclRsYnp2WnM0VW9iaG05Y0xJZkU4dEZGS0xpTXoz?=
 =?utf-8?B?K2FvNk1LUzRQYmkxeXdGbjFrR0F0Rm5FL3pKMGx1d2wyNFdHaEZLMEVubFR5?=
 =?utf-8?B?WGFIU3lWMDhzVnhoRjNWUnIvZUlmbTQvNEtGbmFqNHZhTmVLWld4bVJXMXBs?=
 =?utf-8?B?cTVqWnJPUXZ5d01RRngzUkg3b0FjV1pEdG1zMWkzbVlrOXRHYVpncjBrQk9P?=
 =?utf-8?B?MUcxY0dkQStZNm9CT0c4WktjeWpGY2NleHd2TzliZVkzSm1DQ1RGRndvZXJp?=
 =?utf-8?B?ODZYWHpkWlgxUHdJc3A4aXNXcjNxa2oyL1dCZVBhNXRzakpjYjFmdVJRalV4?=
 =?utf-8?B?YWI4Q3EwNXR5elR3VjR3MlBzT21qb1ZKSUhROENVRkJEcDZHelY0ZHFaQlpo?=
 =?utf-8?B?YzNjNzlxaXVTTDl2TGRqc3VWbC9MK09BZXVWWmtmSFZZVVg5RDBFajRLQk5h?=
 =?utf-8?B?MHVzaGt3MUkwK0NxZ0EvWTB6bG9JMzI4NVVyTmM0V1ovM1FqclZuK1BJSEJk?=
 =?utf-8?B?R0VsMGZQbXZIMTV1MjRZa2JpeHZTcnFQWlJkVjdocVNnczBXT1phWmZUUWZF?=
 =?utf-8?B?dEhPREFIYThEcnh5VkRvZERVbDhmMTFZMm4yWG9raHdGUFE1QklicWJsREZ4?=
 =?utf-8?B?bEF5b29ZamV0aC8wTVRVS1AwNDZZd0R1TnhnWEl0RHdQTVF0YTVLUnJ2bGdl?=
 =?utf-8?B?dTFsZTJJb2dSK0Y5VG0xUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVNaenZaY2ZidlNJQTB5NTF0MTZyWlNGTGkxL0Jtck5wdUV0cjllb3VQN0NW?=
 =?utf-8?B?TE5LLzNORklxOTFXWDIyV0lERWNWWEhLUWtJMUZkZEZZeE5vMWxleVFQVzBt?=
 =?utf-8?B?T0lGNDFtWDVwaWx3aHZsc0s0Zk5hVVp6M0xJMnhzOHlObHN1RkxXWmE3aTk0?=
 =?utf-8?B?SXhESk5RUTQwaEswUWRFL0hNbWV2ZnBCY1M3V0hQTStaRmNYLzJ3aVJBRGpY?=
 =?utf-8?B?bWR4bkZlaWxaNVlyZFpTWTF2aUd6TU9KNzBEOUpzYUoyLzc1OWhLeGNabTQx?=
 =?utf-8?B?RWtHYkp4K0FRSjJsMGRYZmoycmJVQkRKMUJIbCt4QWYwVzhaanV1cEdFbjBo?=
 =?utf-8?B?aU1kYVNzUkhmWGNwWkN4MzJtYXYwK29ydXJvZCsvWEFwbmFEbXFMdWtTZVVC?=
 =?utf-8?B?RzhQOW9Yc2FMRWNHUFJPSzIyTWQ0NzRwbldUcC9hanc0cVVic3dhcUF4WHpl?=
 =?utf-8?B?WVlnMldJSEtteWhielM0TUhYWFVKVkh2aEREMHM3WWV3U0ZhMDNucmQ1MzBY?=
 =?utf-8?B?MXRSVlBNTDBoRzA2QzBOamNmM2xIQjh6bDNkckpTaEpxZUNoRmxFL3hzVkg5?=
 =?utf-8?B?Q0pibjJtRUs4VVJtVnRCRnIrVUdoK0dpbU9lV3V1WHdtQ20vSytlTklsSmRp?=
 =?utf-8?B?M0hNVlRJYW9URWNqWDhXcm80MlJXRDNUMmNVdjlOOGZOWVVHUVRORnkySkZq?=
 =?utf-8?B?ZVNrNEdGZDVlN0d5ZDhUb3J6dzY5aENwVVVLWDVLYkxkUjVZU3luZkU0YW9o?=
 =?utf-8?B?cU1LT3RxNS8vSWRUQjlZZlpZd1JDVXlLcjIyY0hWRytLM0NZT1VFSTIxUjVJ?=
 =?utf-8?B?dCs2Y1pidkVIYkJEencvTjdZcFB0cG1OU0F4dGFPZnBkK250WGFKYVZIVXpI?=
 =?utf-8?B?RCs1cWkxZGhCdWRpUzlINEFuL0JYUzVtZVZqdWhEdzRsbzUwdTVXUndWNitl?=
 =?utf-8?B?TldJdmxxSUZWek16Z2ZSajlPUklmNTgzalNMS2xpN2hHVzJmbSt5enNiR0FB?=
 =?utf-8?B?ZS9sYlIyWmVRWlNaL0RhdGY4TWVuNkxqS2kxcnNXZW0rM3IzSzFjNkhKSmtt?=
 =?utf-8?B?ZzU4SXZpRFZxeFBMVFlLeGFGY0FyRFJyaFF1NHNVU0V6bmpxY3RJQnRib2Qv?=
 =?utf-8?B?WDI5VEVHZUdERGNaZkNLUVQzK256RXBTTkpJQWVqcmxZTnNzU1JwUHE5M0R0?=
 =?utf-8?B?dGxCeld2YkZxSnptZU9HY3dwaXIrU0VqLzNRcC9tZ0RFNzhLUjFVbkt4Tjhr?=
 =?utf-8?B?eFdWaWtXVWJKc2g3dmhoVTFRQU51S3Fla2wrZnpGYUd3Y3NwVW5peDJtTUtt?=
 =?utf-8?B?WjdHUjU4UlcrRFZWL2dlN3MwQy81U040NnU5NUx5akNCNnNCQ0JHOENWZ2VZ?=
 =?utf-8?B?bjVzbzZ6NmxDRWhZVG9iQ083aHNmcEIyN0dlVVBVR0tFNXMwZEFFYU91WVVO?=
 =?utf-8?B?Zi9TaDZ2WE1LMFE0ZmRhdC81YWx1YVVYNFNORDVJRzVBcTROc0NSSllENFJp?=
 =?utf-8?B?Vm5MbVVWSFpkUkxxN095Z1M1ZVRIYzEzQnhlL3kvK2hjTlROeUdIQUpsSmNU?=
 =?utf-8?B?QVZUMDJxTGREem0yODJHTmtXTjlhMjhCUnNJTHA3YUUzUXBpTTEwemwyZ3kr?=
 =?utf-8?B?MFFhOFlrYm4xUnFieklraUF1akFGYjdjRkNPYUxMSTQyazlwdWhNdTYrZmkr?=
 =?utf-8?B?bG9MMks0UlJXRVNYdTNxaXhmVStpTUVpSW5qbEJ6eHRsL1h6d1V4ZURqckFY?=
 =?utf-8?B?MVowbTlONHM4eTBvbWlqclZwWCtGcS9OYjF0RHJONkRBOGVSQzVzSGZ6dmRZ?=
 =?utf-8?B?STN4NjJ3NXdua2xRakJ4QVdIUHkvaCtIZTcvZTNWNkZxNzFUUHJtU0RybDFx?=
 =?utf-8?B?VkJ1WFdYTEUxYlhWc3U0NnE5c25QRGJzakp1L0RtOHpqMEx3L2JKZWI0ZTJI?=
 =?utf-8?B?cFlaYjNuaXFybVZBVHc5UGFhNHViUU5scUN1ME5uMCtybXVuN1lUSlplbG1p?=
 =?utf-8?B?L0J4NGtteVdGYi9DQmkwbi9iVlJxQjhpamx3NWdxSXE2Zy90bWU5WTB5MDdn?=
 =?utf-8?B?Ylc2OTF5Q2JkaTJCcmFqbmlVbE51Mmc3cFkxU3ZESyt2M25GaklKcmkwaEpn?=
 =?utf-8?B?RlUyOVhORytYaStqdzM5bnRzNVVWZCs1UTUyaVJvd0UyWFlaZ1R1RWp3cG9Y?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a103dc7-f253-49c1-29d6-08dca695f74b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 19:23:41.3458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xkv0z4XUhTzQUeoYFS2wjhn7X60QbARGTtATh9SuBVsqtUUsI4OWxePnvXg9WhDZjprqTelKYBd2ilfCKsrvROZNy7cEqnSTY3Yuir+QrjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6211
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

On Mon, Jul 15, 2024 at 03:24:55PM +0530, Riana Tauro wrote:
> Add coarse power gating sysfs interface under gtidle directory to
> display the powergate properties.

You might also want to explain what "powergate" really means here.
I.e., how does this powergating differ from what happens with RC6/MC6?
When can powergating kick in?

> powergate sysfs directory will be enumerated for render and media
> if present.
> 
> The new entries will have the below layout
> 
> 	tile<n>/gt<n>/gtidle/
> 			├── powergate0
> 			│   ├── enabled
> 			│   ├── status
> 			│   └── type
> 			└── powergate<n>
> 			    ├── enabled
> 			    ├── status
> 		    	    └── type
> 
> type:    type of powergate [Render or Media]

What userspace software is expected to be reading this interface and
what will it be doing with the data?  I'm surprised that they want just
a single "media" powergate rather than providing the actual powergates
that the hardware supports (e.g., one entry per individual media slice,
which would allow userspace to either consolidate them or split them out
as they see fit).  If we just expose whatever the underlying hardware
has (which may vary by platform), then userspace is free to consolidate
some of the values itself if it doesn't need the lower level of detail.

> enabled: true if powergate is enabled for the type
> status:  Indicates status of powergate [Up/Down]
> 	 For type media, status is "Up" if any of the media
> 	 slices are powered on.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h  |   7 +
>  drivers/gpu/drm/xe/xe_gt_idle.c       | 214 +++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_idle_types.h |  17 ++
>  3 files changed, 237 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 8a94a94d2267..8586c830bea6 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -335,6 +335,13 @@
>  #define   CTC_SHIFT_PARAMETER_MASK		REG_GENMASK(2, 1)
>  #define   CTC_SOURCE_DIVIDE_LOGIC		REG_BIT(0)
>  
> +#define POWERGATE_DOMAIN_STATUS			XE_REG(0xa2a0)
> +#define   MEDIA_SLICE0_AWAKE_STATUS		REG_BIT(0)
> +#define   RENDER_AWAKE_STATUS			REG_BIT(1)
> +#define   MEDIA_SLICE1_AWAKE_STATUS		REG_BIT(2)
> +#define   MEDIA_SLICE2_AWAKE_STATUS		REG_BIT(3)
> +#define   MEDIA_SLICE3_AWAKE_STATUS		REG_BIT(4)

Nitpick:  bits are usually defined in descending order instead of
ascending.

> +
>  #define FORCEWAKE_RENDER			XE_REG(0xa278)
>  #define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
>  #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 67aba4140510..fca13e645d24 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -25,13 +25,26 @@
>   * device/gt#/gtidle/name - name of the state
>   * device/gt#/gtidle/idle_residency_ms - Provides residency of the idle state in ms
>   * device/gt#/gtidle/idle_status - Provides current idle state
> + * device/gt#/gtidle/powergate<n>/
> + *                              ├── enabled - indicates whether powergate is enabled
> + *                              ├── status - status of powergate [Up / Down]
> + *                              └── type - type of powergate
>   */
> +static struct xe_gt_idle *kobj_to_gtidle(struct kobject *kobj)
> +{
> +	return &kobj_to_gt(kobj->parent)->gtidle;
> +}
>  
>  static struct xe_gt_idle *dev_to_gtidle(struct device *dev)
>  {
>  	struct kobject *kobj = &dev->kobj;
>  
> -	return &kobj_to_gt(kobj->parent)->gtidle;
> +	return kobj_to_gtidle(kobj);
> +}
> +
> +static struct xe_gt_powergate *kobj_to_powergate(struct kobject *kobj)
> +{
> +	return container_of(kobj, struct xe_gt_powergate, kobj);
>  }
>  
>  static struct xe_gt *gtidle_to_gt(struct xe_gt_idle *gtidle)
> @@ -129,6 +142,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>  	}
>  
>  	xe_mmio_write32(gt, POWERGATE_ENABLE, pg_enable);
> +
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));

Unexpected whitespace change?

>  }
>  
> @@ -145,6 +159,70 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>  }
>  
> +static void gt_idle_powergate_enabled(struct xe_gt_idle *gtidle,
> +				      struct xe_gt_powergate *pg)
> +{
> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
> +	u32 enabled;
> +
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> +	enabled = xe_mmio_read32(gt, POWERGATE_ENABLE);
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +
> +	if (pg->is_media)
> +		enabled &= MEDIA_POWERGATE_ENABLE;
> +	else
> +		enabled &= RENDER_POWERGATE_ENABLE;
> +
> +	pg->enabled = !!enabled;
> +}
> +
> +static void gt_idle_powergate_status(struct xe_gt_idle *gtidle,
> +				     struct xe_gt_powergate *pg)
> +{
> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
> +	u32 status, reg;
> +
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> +	reg = xe_mmio_read32(gt, POWERGATE_DOMAIN_STATUS);
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +
> +	if (pg->is_media) {
> +		/*
> +		 * Media Slices
> +		 *
> +		 * Slice 0: VCS0, VCS1, VECS0
> +		 * Slice 1: VCS2, VCS3, VECS1
> +		 * Slice 2: VCS4, VCS5, VECS2
> +		 * Slice 3: VCS6, VCS7, VECS3
> +		 */
> +		if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS0)
> +					    | BIT(XE_HW_ENGINE_VCS1)
> +					    | BIT(XE_HW_ENGINE_VECS0)))

If this is false...

> +			status = (reg & MEDIA_SLICE0_AWAKE_STATUS);
> +
> +		if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS2)
> +					    | BIT(XE_HW_ENGINE_VCS3)
> +					    | BIT(XE_HW_ENGINE_VECS1)))

...and this is true...

> +			status |= (reg & MEDIA_SLICE1_AWAKE_STATUS);

Then status still has an undefined value here.  Ditto for the other two
conditions below.

> +
> +		if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS4)
> +					    | BIT(XE_HW_ENGINE_VCS5)
> +					    | BIT(XE_HW_ENGINE_VECS2)))
> +			status |= (reg & MEDIA_SLICE2_AWAKE_STATUS);
> +
> +		if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS6)
> +					    | BIT(XE_HW_ENGINE_VCS7)
> +					    | BIT(XE_HW_ENGINE_VECS3)))
> +			status |= (reg & MEDIA_SLICE3_AWAKE_STATUS);
> +
> +	} else {
> +		status = reg & RENDER_AWAKE_STATUS;
> +	}
> +
> +	pg->status = !!status;
> +}
> +
>  static ssize_t name_show(struct device *dev,
>  			 struct device_attribute *attr, char *buff)
>  {
> @@ -197,10 +275,130 @@ static const struct attribute *gt_idle_attrs[] = {
>  	NULL,
>  };
>  
> +static ssize_t status_show(struct device *dev,
> +			   struct device_attribute *attr, char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt_powergate *pg = kobj_to_powergate(kobj);
> +	struct xe_gt_idle *gtidle = kobj_to_gtidle(kobj->parent);
> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
> +
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +	gt_idle_powergate_status(gtidle, pg);
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
> +	return sysfs_emit(buff, "%s\n", pg->status ? "Up" : "Down");
> +}
> +static DEVICE_ATTR_RO(status);
> +
> +static ssize_t enabled_show(struct device *dev,
> +			    struct device_attribute *attr, char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt_powergate *pg = kobj_to_powergate(kobj);
> +	struct xe_gt_idle *gtidle = kobj_to_gtidle(kobj->parent);
> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
> +
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +	gt_idle_powergate_enabled(gtidle, pg);
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
> +	return sysfs_emit(buff, "%u\n", pg->enabled);
> +}
> +static DEVICE_ATTR_RO(enabled);
> +
> +static ssize_t type_show(struct device *dev,
> +			 struct device_attribute *attr, char *buff)
> +{
> +	struct xe_gt_powergate *pg = kobj_to_powergate(&dev->kobj);
> +
> +	return sysfs_emit(buff, "%s\n", pg->is_media ? "Media" : "Render");
> +}
> +
> +static DEVICE_ATTR_RO(type);
> +
> +static const struct attribute *powergate_attrs[] = {
> +	&dev_attr_type.attr,
> +	&dev_attr_enabled.attr,
> +	&dev_attr_status.attr,
> +	NULL,
> +};
> +
> +static void powergate_sysfs_release(struct kobject *kobj) {};
> +
> +static const struct kobj_type powergate_sysfs_kobj_type = {
> +	.release = powergate_sysfs_release,
> +	.sysfs_ops = &kobj_sysfs_ops,
> +};
> +
> +static int register_powergate_sysfs(struct kobject *gtidle_kobj, int idx,
> +				    bool is_media)
> +{
> +	struct xe_gt *gt = kobj_to_gt(gtidle_kobj->parent);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_gt_idle *gtidle = &gt->gtidle;
> +	struct xe_gt_powergate *pg = &gtidle->powergate[idx];
> +	int ret;
> +
> +	kobject_init(&pg->kobj, &powergate_sysfs_kobj_type);
> +
> +	ret = kobject_add(&pg->kobj, gtidle_kobj, "powergate%d", idx);
> +
> +	if (ret) {
> +		kobject_put(&pg->kobj);
> +		drm_warn(&xe->drm, "Failed to create powergate%d sysfs directory\n", idx);
> +		return ret;
> +	}
> +
> +	ret = sysfs_create_files(&pg->kobj, powergate_attrs);
> +	if (ret) {
> +		drm_warn(&xe->drm, "Failed to create powergate%d attrs\n", idx);
> +		kobject_put(&pg->kobj);
> +		return ret;
> +	}
> +
> +	pg->is_media = is_media;
> +
> +	return ret;
> +}
> +
> +static int gt_idle_create_pg_attrs(struct kobject *gtidle_kobj)
> +{
> +	struct xe_gt *gt = kobj_to_gt(gtidle_kobj->parent);
> +	struct xe_device *xe  = gt_to_xe(gt);
> +	int ret, idx = 0;
> +
> +	/* CPG is disabled for PVC */
> +	if (xe->info.platform == XE_PVC)
> +		return 0;
> +
> +	if (!xe_gt_is_media_type(gt)) {
> +		ret = register_powergate_sysfs(gtidle_kobj, idx, false);
> +		if (!ret)
> +			idx++;
> +	}
> +
> +	/*
> +	 * Do not create media pg status if the entire first media slice
> +	 * is absent (i.e., no VCS0 or VECS0).

Is this an attempt to work around the bug above?  Otherwise I don't see
why we'd want to tie this to media slice 0 specifically and not report
powergating when only the other slice(s) are available.


Matt

> +	 */
> +	if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0))) {
> +		ret = register_powergate_sysfs(gtidle_kobj, idx, true);
> +		if (!ret)
> +			idx++;
> +	}
> +
> +	return 0;
> +}
> +
>  static void gt_idle_fini(void *arg)
>  {
>  	struct kobject *kobj = arg;
>  	struct xe_gt *gt = kobj_to_gt(kobj->parent);
> +	struct xe_gt_idle *gtidle = &gt->gtidle;
> +	struct xe_device *xe  = gt_to_xe(gt);
> +	struct xe_gt_powergate *pg;
> +	int n;
>  
>  	xe_gt_idle_disable_pg(gt);
>  
> @@ -210,6 +408,18 @@ static void gt_idle_fini(void *arg)
>  		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  	}
>  
> +	for (n = 0 ; n < 2; n++) {
> +		if (xe->info.platform == XE_PVC)
> +			break;
> +
> +		pg = &gtidle->powergate[n];
> +
> +		if (pg->kobj.state_initialized) {
> +			sysfs_remove_files(&pg->kobj, powergate_attrs);
> +			kobject_put(&pg->kobj);
> +		}
> +	}
> +
>  	sysfs_remove_files(kobj, gt_idle_attrs);
>  	kobject_put(kobj);
>  }
> @@ -248,6 +458,8 @@ int xe_gt_idle_init(struct xe_gt_idle *gtidle)
>  
>  	xe_gt_idle_enable_pg(gt);
>  
> +	gt_idle_create_pg_attrs(kobj);
> +
>  	return devm_add_action_or_reset(xe->drm.dev, gt_idle_fini, kobj);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_types.h b/drivers/gpu/drm/xe/xe_gt_idle_types.h
> index f99b447534f3..603f7f6b509d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle_types.h
> @@ -7,6 +7,7 @@
>  #define _XE_GT_IDLE_SYSFS_TYPES_H_
>  
>  #include <linux/types.h>
> +#include <linux/kobject.h>
>  
>  struct xe_guc_pc;
>  
> @@ -17,6 +18,20 @@ enum xe_gt_idle_state {
>  	GT_IDLE_UNKNOWN,
>  };
>  
> +/**
> + * struct xe_gt_powergate - Powergate properties
> + */
> +struct xe_gt_powergate {
> +	/** @enabled: powergate enable */
> +	bool enabled;
> +	/** @status: status of powerwell*/
> +	bool status;
> +	/** @is_media: indicates media powergate */
> +	bool is_media;
> +	/** @kobj: kobject for powergate sysfs */
> +	struct kobject kobj;
> +};
> +
>  /**
>   * struct xe_gt_idle - A struct that contains idle properties based of gt
>   */
> @@ -29,6 +44,8 @@ struct xe_gt_idle {
>  	u64 cur_residency;
>  	/** @prev_residency: previous residency counter */
>  	u64 prev_residency;
> +	/** @powergate: powergate properties */
> +	struct xe_gt_powergate powergate[2];
>  	/** @idle_status: get the current idle state */
>  	enum xe_gt_idle_state (*idle_status)(struct xe_guc_pc *pc);
>  	/** @idle_residency: get idle residency counter */
> -- 
> 2.40.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
