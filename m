Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EC2CD5BD5
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 17:21:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C87310E162;
	Mon, 25 May 2026 17:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mgsPzzxN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E262410E162
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 17:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779729717; x=1811265717;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iirRCFQMiu+UZceNpqKusHKa/KxBOQiUzJZWb/YKi6A=;
 b=mgsPzzxN0i15Cp7rpRf4BaXZ5oJNwbR1K4vasYrREWSWNwrnaNUfQb1x
 5hu3e6RkIGOTrErggULjWoS2n9d4kwsof+kBthnhNqm0Uuk/tGMwoQ8jh
 DwbQMcZYs1S1hITSZ8gKDW3JXyhxzCfRZZoT+PcV4Jsv0WP1EK7BS51qy
 2PhFJ1gMonkboivNcQrTh2xtRNappD+wBazHP0sxrK/rdtgxeg7HVRPx3
 tozig1qejMDxTSDfECPir6rpB1xg6y2J6FrVJv39dQPgysdx3uwGOzWG9
 1B2gDmHdeTOpeTzh73XL8Os6YwzL/6hIM+UIdWymrXYOh32V2Mco8nppD g==;
X-CSE-ConnectionGUID: isLoCWSAT1WZOPhsRMG+2g==
X-CSE-MsgGUID: 7UQuQo8OSDqheMP2iB8EKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80457186"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="80457186"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 10:21:56 -0700
X-CSE-ConnectionGUID: w5NkUC/sRNCKx1ZENl5VRw==
X-CSE-MsgGUID: I8E6IS6nT52H/WOnbLM0mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="241836861"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 10:21:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 10:21:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 10:21:56 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 10:21:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wrl0NdlAqIci1KSTlwk3dW1KmmpukQOhsF8a47YmSXgBe89y7/kPE3Ne6E5zkwysmN/6tWLPKzjjk8/Oxeux9b0x+PGiZvnSSdE6ttNEwcaXTJKAQJ6gyqDjShQpQcgFmhQsPKLZcK0vUJ6g6t2kDyp8wZO7kKIiTuZunAi/L+jAIH+zvk068MZZFA0YFAK38zlNBMW0YbUnuaTDIldF74z0ptsJSc4TmBEnRdQcp0ZQ995ryO1NpfjJpPFToeD+4jucvwAe5aHn/zjqziutJuv+cyuJKT770TnLW2J+QamwiSBeobhxbiT3fk6RgJCMgfNPhvWvlSWHDrwfchJRqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xzNVw9g/yTIdOi0C9hEKcDElkMvNbuP72V08TEUzwFs=;
 b=EDExUl+KDs9xqKx94jt3zhl39fw4m4QsPlBa4Mc7lLwuo9Nzj+Eh7lhP4YMLLmt/RnlEGhTgtK8u7SYigxLiVSLXUDdGseyV2tPITEUmjgD51gnv+c9ri0tK3ZYDsTFYptwHdWvJg0uYKTWo4FlKMUJHNYAt3afyXOUFGIYNxsLMnx4runR8ewQLMZewMqHOqjOBRnhZgqUy5U5VXKLqXWXMXrLHvFf2ZBkZyw7ni7SphmimyUj9UV/qdCiVnXMqvxN4JisHzxTLPRfrKJ2754jkRn/TVSKs3NELmJ8N+uULcYA5Jpvfg8DxiKhy0hGz1LAGu1pzCUJ24u4DGzBHPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MN2PR11MB4565.namprd11.prod.outlook.com (2603:10b6:208:26a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 17:21:54 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 17:21:53 +0000
Message-ID: <da722f1a-c062-4062-ab0a-ea94f6ad170d@intel.com>
Date: Mon, 25 May 2026 19:21:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/15] drm/xe/xe_pci_error: Implement PCI error
 recovery callbacks
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Matt Roper <matthew.d.roper@intel.com>
References: <20260525100619.3155663-17-riana.tauro@intel.com>
 <20260525100619.3155663-20-riana.tauro@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260525100619.3155663-20-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI6PEPF000001F8.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::906) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MN2PR11MB4565:EE_
X-MS-Office365-Filtering-Correlation-Id: fffef420-f617-41c9-54d1-08deba821d07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003|6133799003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 1EnD57oSlKi77GH7hv+92sspHF7l+sVdTg2SdDS6+yZMWUUAnNY4uhlcdIHme6Q9Ink/U+pyCBBYcgqf/JLT851ypSyqYwNX+Gvn85jHfiHJzwVO3sIlFLbN+TSmn8s4AebB5aMmPSFvrnlMn+lpZ6gvwIl2ziq+jp35qnHLtQVMfF2BDvtfTzfbYyqXJnYHy8yYP1yK2F/7YTSp/PlquDUeSQVYoRfCKvaTM4TOXQj8qMB99IvR4VyK+RoawSN7RSHq0GsETdr5SXdEBb5m9+EmDiGbCYpRBLWw6Ja4Xdy/jystoAtgNID4WWdT04sSVSyt8++N1Emh0Vap61D3dHkMcyGdyK10gMwNwv0OL+7yXD+jcR2Y8NKHREHru7g2Fin3XwPBpIhQ7g5KRsTXkETRhHP5j+YoTMKT/jnnhW7IiMdXkVrsBQsVlLQQU9FYeL0GvAA2RyYGiVDqBNXStNPeVGPTNN3Wr48kmuPUnDVhAiJNbNX0I7e7l8LyqNputdco2kxh+Gjrw9a0gV7bbhV8s/hZXXTAjyygROi2iBY4Q1PNlrnkjy8t0yH3vJfTaQk+Wjng9JEAb+2o68gWvRkh7qO1pKWKJtnSFJ347gjmcVVBWQh9OzuXDCFiLXHE5kXlD3B3AtJGOs+00gGXKu5+wcuAQoVdVRQDsPCHSBvws5q4pQRVVhwAvLXqzrY5EEx2aCIx4uyhlMpq+RBxyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003)(6133799003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTUydHVyd08xcUNzeXBpWTdoNkFuaGNMVklYcDFPRVVyVGlzNU1TRTZIbDFP?=
 =?utf-8?B?MEh1cXFDQXVhZHBrNDBCaTg4YXdKWXlyek5EV05hYnhqQjlaRWRERDN3NmJ5?=
 =?utf-8?B?V3ZFR0o4TGNoMmprMG1XRnlEY28vMlJlblkvanNKUUpJazJ2aWZMRWxOUFg5?=
 =?utf-8?B?ZHNrdUhNYk00U0ZCRXFBUHpwZmZhRzU5SmxMZEt2bWNxNG5BSS8vNGt3Mkpu?=
 =?utf-8?B?RGRGL0R2cjkzY3BnbTRJOTNpbG4xNm5LZi92TkxWREhZbkZTZThwejA3U3FN?=
 =?utf-8?B?OHJ1UjQzOFVhd1FncTcrTjM2WlpYSXNGUGRPYnNNamlVTThFUVdKTitzb1VB?=
 =?utf-8?B?alhCUlNkSWVaWG96U0pnTzNqS2cwWW4rQzFGNjNOSTRhRVRMMi9TRGt0UFN5?=
 =?utf-8?B?NVVyckZVNk5ldzgveHBKYnVwSE5PWlhSdHJlRTNsTXFhaUp0eG95cFpCVlgx?=
 =?utf-8?B?NXZVTUZ5UThIY3NWeGF4UUFSNE1vcHhYWHVMMDY3Z2lyTmtTSFpBbXgrbDdk?=
 =?utf-8?B?aXhZdnpwV3JCSjN2S3ZQQm0xWkoyKzN5MEQ2RzFYa2phY0tpSWNXdFg0NVhr?=
 =?utf-8?B?c1ZQUS9pb01lYVRpbEFBSlJjSWhRNVFmMlJlbXVCd1R4L1lHTmFyM3dId0Vi?=
 =?utf-8?B?VzVLQ0s1RWZBaXR6YUN1ajVxV1oraXFGY1VNNmx2dVJkcHZRb0lZblZPQ0RD?=
 =?utf-8?B?d1ZSRjRSQ0FzbzJMT2lDbGxycTJwMC83Tmp0UFRTdzAvWm1FeXEvZGlsUTNU?=
 =?utf-8?B?U3hNWmM1dlR1M014Y1IraUxzQm10ZzFHM3RuYis5MFBtZ1laaDVVOUNVRTdn?=
 =?utf-8?B?eGNLcXV0SEhhWEphRlRwbGZBandnTlg3ZGpGSEtpUytSWFZmREk3Z21PbFVi?=
 =?utf-8?B?T1Btd1V6Uk1iNGdheUphWGVhOVRWd3Z6Z1JrMWgya2tvKzRKUFVOQXRGakl3?=
 =?utf-8?B?cWpLZ2MyK0pxTVFmdTdNeThSZ0hhZ1Iwa0thQ1BkcEhaemFzQWZUTVpTVW9K?=
 =?utf-8?B?aC90cktwU1J0L1ZpOFBDSXZVbUhSeEhDUmpTeXF5OHVVc1M0RnpaWWxoSWEw?=
 =?utf-8?B?dzZuUWIvNnZWbThwUEpOME9tYmR2TmNhcVZQMysxUlNvdjFuSGlkQVR1bkUv?=
 =?utf-8?B?MUR4amx5RjFOK2VBOU5MUmhqZFFwbG5FejJWaWRxRG5qQUh3OENjOHJ1djRs?=
 =?utf-8?B?U3A4YU5KWFR0M2l6ZlJacm1IbDU0dEl4TmJvdDNZMGpRbWlIc3JlNzVwWTZr?=
 =?utf-8?B?SzFDbExyNDVPUmljcERVajJSNFhueUN3VVVXSkZhS2tOaFVyNEsyRHZHS1Rj?=
 =?utf-8?B?eVl5NEtiZ3hrSGNwS1h0S1BNM1FaaDhVUUdTTmJvQ3ZNeEZFcEdHNmVHUjE2?=
 =?utf-8?B?cWJXVDhGS0s0RDFKTTdyVmxhN2VCaWxZY1l0citRaW5COHF3OE5QUWhXUE1W?=
 =?utf-8?B?YTJlMkxXK1Rqc2JaOXZ5cFhCY1M3RXgvSHhKT1NnRExrU3IwUGNLSVNNcEdv?=
 =?utf-8?B?a2Jkc3duWXdsRVVUbjNFdG95bnYwN1FzS2R4ckZ4aFJIaWY0NHRaS2kyNWkz?=
 =?utf-8?B?NFI0RU10d3FFaEdqUGNXbGJwTzA3dnptNWgxUGRLMXN5ZHA3Mm90Szh0QjVm?=
 =?utf-8?B?dDNJWFAxOFZ4SVZHUlFtRnhkOEErTjRQUmlLa1FnN0pibmVQVTZybkVHSHFa?=
 =?utf-8?B?ZnFwSll3T2ZyRjhRaDdrQWMvK1RDZDZXR09nOFVOekg4Rmh6TDU4OWsrQW1m?=
 =?utf-8?B?MWh0Y1RIb3lvbnlxRW9pcWlzakdHcG1wS25NS2F2K1UwT0Frd2dPbE1GZFgy?=
 =?utf-8?B?Ty9jc1V2K1M4b0p0ZGFVYmV5Zm5wVStqRFc3MENRVG8wUnpQdTFuSmV0YTha?=
 =?utf-8?B?ZlVpenVLVjRTQ2VKckg1SzB2cDUwN1RPWjV4b2pzWDNzYUxSalRTVW9RWk5B?=
 =?utf-8?B?TytQL0tVcTlPeFVJOC9VU1VacFBjem1sQ3FjdTJMZVhhS29pdFdSVG9pblFm?=
 =?utf-8?B?OTNUVUxRSEVCV2sydnlmVkFIN0FpVitHdVNrYVpaZVVValU3M05iVE9ZbGZu?=
 =?utf-8?B?aHkxaVNVTU9zMWRVWWZneXgxV0IrZVVZK3duYUpON0NCRnFnTVRINGlCZEVD?=
 =?utf-8?B?SFBpL1dFU2pBOUpNRTdTalBTZkIvVjBZZFYzMVJ5QkEzMlZvUEJ4dE9FKzNx?=
 =?utf-8?B?VFkzM0tmM3htZnVhNXlHd29BME12N1hVc3V6QnVWTzFDRUVsdEVNYitXdmU1?=
 =?utf-8?B?bHR6Z2k1a0NKZkZjL3c3V25jODZjdUpuVEZSemdHdVBoZVNpNHZQNmhRWG8z?=
 =?utf-8?B?QldpbUNFb25JMFp5emlMdkFPZmMxbU41NDRJWUF6eFBGWlMxR1R0ZDN5cTVV?=
 =?utf-8?Q?Btzrj6H5AXLSMmrg=3D?=
X-Exchange-RoutingPolicyChecked: kOXjqzLu1CQco4zAS0c5CjXnR1e5glhL9nFz+64rnL5ssIZ3Y52DL2ZwemT3yuPjuCp/7XohPEgU+rYYIwWyvffD1/6xgjWyyXg4JjCcnSUYDEqDWE41hyXdPaZ0fn5R3DfH8WzauT6Rd2NoJxfFu9tK/8Fapgxo8ccWDEOYmMWwK3+sgmozlze5i5WeoVYK4+JtSSDrYY8V5CqwWO/Xu6yee9JU/MWUg84CKHsFFaeSolxZlkykUlODT3mPN8DyP9GeoK+G8SkgHlToAb4GRWWgyM64uoZVMUoTpnE0FoU45a24MY8VammzK/3CaJg3Yn3WrbbWYsXdmTxsyF4i1A==
X-MS-Exchange-CrossTenant-Network-Message-Id: fffef420-f617-41c9-54d1-08deba821d07
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 17:21:53.1230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9b3epRNWe02qQD2I7DhR/tez0Y/30LWX2FLCKIjpBw9NDA84xlNINf0A6YMA/BUOiu6VozlEaJWhBHxPOgtri8meSd3nbfPaTmY/gmxnSR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4565
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



On 5/25/2026 12:06 PM, Riana Tauro wrote:
> Add error_detected, mmio_enabled, slot_reset and resume recovery callbacks
> to handle PCIe Advanced Error Reporting (AER) errors.
> 
> For fatal errors, the device is wedged and becomes inaccessible. Return
> PCI_ERS_RESULT_SLOT_RESET from error_detected to request a Secondary
> Bus Reset (SBR).
> 
> For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
> error_detected to trigger the mmio_enabled callback. In this callback, the
> device is queried to determine the error cause and attempt recovery based
> on the error type.
> 
> Once the secondary bus reset(SBR) is completed the slot_reset callback
> cleanly removes and reprobe the device to restore functionality.
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: re-order linux headers
>     reword error messages
>     do not clear in_recovery after remove
>     return PCI_ERS_RESULT_DISCONNECT if probe fails (Michal)
>     only wedge device do not send uevent (Raag)
>     set recovery flag in error_detected and clear on resume
>     add default switch case (Mallesh)
> 
> v3: do not set in_recovery for disconnect (Mallesh)
>     return if already wedged or in survivability mode
> 
> v4: Add comment (Matthew)
>     Fix tab (Mallesh)
> 
> v5: remove in_reset
>     disconnect if already in survivability mode or wedged
>     block I/O operations in slot reset (Raag)
> 
> v6: acquire runtime pm wakeref while setting the
>     wedged flag(Matthew Brost)
>     rename function from xe_pci_error_handling() to
>     pci_prepare_reset()
>     call pci_prepare_reset() before requesting SBR
>     add blank line after copyright
> 
> Note: The re-probe in this patch will be replaced by
> minimal re-initalization once below patch is merged
> https://lore.kernel.org/intel-xe/f642453c-f657-41c7-a01b-5a0baf886cd3@intel.com/
> ---
>  drivers/gpu/drm/xe/Makefile       |   1 +
>  drivers/gpu/drm/xe/xe_pci.c       |   3 +
>  drivers/gpu/drm/xe/xe_pci_error.c | 120 ++++++++++++++++++++++++++++++
>  3 files changed, 124 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 09661f079d03..091872771e98 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -101,6 +101,7 @@ xe-y += xe_bb.o \
>  	xe_page_reclaim.o \
>  	xe_pat.o \
>  	xe_pci.o \
> +	xe_pci_error.o \
>  	xe_pci_rebar.o \
>  	xe_pcode.o \
>  	xe_pm.o \
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index e2a1232c4fbf..5462ddb25d29 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1331,6 +1331,8 @@ static const struct dev_pm_ops xe_pm_ops = {
>  };
>  #endif
>  
> +extern const struct pci_error_handlers xe_pci_error_handlers;

hmm, as you introduced new component xe_pci_error then maybe it deserves
its own header instead of this random forward declaration

also, maybe like in other cases, expose functions used by this ops struct
instead of the struct itself?

> +
>  static struct pci_driver xe_pci_driver = {
>  	.name = DRIVER_NAME,
>  	.id_table = pciidlist,
> @@ -1338,6 +1340,7 @@ static struct pci_driver xe_pci_driver = {
>  	.remove = xe_pci_remove,
>  	.shutdown = xe_pci_shutdown,
>  	.sriov_configure = xe_pci_sriov_configure,
> +	.err_handler = &xe_pci_error_handlers,
>  #ifdef CONFIG_PM_SLEEP
>  	.driver.pm = &xe_pm_ops,
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> new file mode 100644
> index 000000000000..218d67074385
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <linux/pci.h>
> +
> +#include <drm/drm_drv.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_pci.h"
> +#include "xe_pm.h"
> +#include "xe_survivability_mode.h"
> +#include "xe_uc.h"
> +
> +static void pci_prepare_reset(struct pci_dev *pdev)

nit: it might be risky to use pure pci_ prefix

> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	struct xe_gt *gt;
> +	u8 id;
> +
> +	/*
> +	 * Wedge the device to prevent userspace access but don't send the event yet.
> +	 * xe_device_wedged_fini() releases runtime pm if wedged flag is set, so acquire a runtime
> +	 * pm reference to avoid underflow.
> +	 */
> +	if (!atomic_xchg(&xe->wedged.flag, 1))
> +		xe_pm_runtime_get_noresume(xe);

maybe instead of open-coding this logic, this should be done by the xe_wedged layer ?

> +
> +	for_each_gt(gt, xe, id)
> +		xe_gt_declare_wedged(gt);
> +
> +	pci_disable_device(pdev);
> +}
> +
> +static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	dev_err(&pdev->dev, "Xe Pci error recovery: error detected state %d\n", state);

nit: while this is PCI error handler, shouldn't we still use xe_err/drm_err
to provide consistent "[drm]" prefix in all error messages the xe generates?

> +
> +	if (state == pci_channel_io_perm_failure)
> +		return PCI_ERS_RESULT_DISCONNECT;
> +
> +	/* If the device is already wedged or in survivability mode, do not attempt recovery */
> +	if (xe_survivability_mode_is_boot_enabled(xe) || xe_device_wedged(xe))
> +		return PCI_ERS_RESULT_DISCONNECT;
> +
> +	switch (state) {
> +	case pci_channel_io_normal:
> +		return PCI_ERS_RESULT_CAN_RECOVER;
> +	case pci_channel_io_frozen:
> +		pci_prepare_reset(pdev);
> +		return PCI_ERS_RESULT_NEED_RESET;
> +	default:
> +		dev_err(&pdev->dev, "Unknown state %d\n", state);
> +		return PCI_ERS_RESULT_NEED_RESET;
> +	}
> +}
> +
> +static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
> +{
> +	dev_err(&pdev->dev, "Xe Pci error recovery: MMIO enabled\n");

shouldn't this be xe_info() instead ?

> +
> +	pci_prepare_reset(pdev);

and this shouldn't be done in error_detected handler?

mmio_enabled is just another recovery step, no?

> +	return PCI_ERS_RESULT_NEED_RESET;
> +}
> +
> +static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
> +{
> +	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
> +	struct xe_device *xe;
> +
> +	dev_err(&pdev->dev, "Xe Pci error recovery: Slot reset\n");
> +
> +	pci_restore_state(pdev);
> +
> +	if (pci_enable_device(pdev)) {
> +		dev_err(&pdev->dev,
> +			"Cannot re-enable PCI device after reset\n");
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	}
> +
> +	/*
> +	 * Secondary Bus Reset causes all VRAM state to be lost along with
> +	 * hardware state. As an initial step, re-probe the device to
> +	 * re-initialize the driver and hardware.
> +	 * TODO: optimize by re-initializing only the hardware state and re-creating
> +	 * kernel BOs.
> +	 */
> +	pdev->driver->remove(pdev);
> +
> +	if (pdev->driver->probe(pdev, ent))
> +		return PCI_ERS_RESULT_DISCONNECT;
> +
> +	xe = pdev_to_xe_device(pdev);
> +
> +	/* Wedge the device to prevent I/O operations till the resume callback */
> +	atomic_set(&xe->wedged.flag, 1);

can't we call driver->probe() in resume()?
then we could avoid going though another wedged cycle on new xe

> +
> +	return PCI_ERS_RESULT_RECOVERED;
> +}
> +
> +static void xe_pci_error_resume(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	dev_info(&pdev->dev, "Xe Pci error recovery: Recovered\n");
> +
> +	/* Resume I/O operations */
> +	atomic_set(&xe->wedged.flag, 0);
> +}
> +
> +const struct pci_error_handlers xe_pci_error_handlers = {
> +	.error_detected	= xe_pci_error_detected,
> +	.mmio_enabled	= xe_pci_error_mmio_enabled,
> +	.slot_reset	= xe_pci_error_slot_reset,
> +	.resume		= xe_pci_error_resume,
> +};

