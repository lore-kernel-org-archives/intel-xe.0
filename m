Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F46CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 18:45:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6E210E0A0;
	Wed, 27 Aug 2025 18:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PlQJH+Tr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8AD10E0A0
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 18:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756320329; x=1787856329;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ETXztRQh1qCF998jdx52XFYsOlHGmYbzCe4o60tKdNA=;
 b=PlQJH+TrM+g33AD99faMlcLA/0XvQ+32eeCRpdAKdZ6DHoRbMamvkY0s
 gW+TXUs1upnttY5LyyhhQS6vrtpwR+DTAJESL7aRD+kqndW2LYvUf7k9B
 9tZ25i5ZjVNv9hWOPqbMr0+OCIa5zGIrZr+HfsZyNhKhKP33uKvWtNwBC
 Fk7Yv0E61kTfg6N4v5hu0Slin5J+jOZDzlPAlRBZIwdQUydtm4wFMY8Gv
 p+KrtzH9ynM+lVQtt6xfH2FqwIanXmfT+Xx97PJ2vta1ivX44KnFVsykk
 va43NZdZS8/URKReg4EfZSnDvJygnlnMdIP+W55A1+d5IAZRHK3R96DjX w==;
X-CSE-ConnectionGUID: x7sXtwk3QAGqUCF7ITDTTQ==
X-CSE-MsgGUID: SuOxXSA5SGirsybIsKa69g==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58730819"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58730819"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 11:45:27 -0700
X-CSE-ConnectionGUID: GRgYEZgDSVOSD85WDnSzMw==
X-CSE-MsgGUID: AdxPejP1QWKbzWWnLQ7o8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="175177685"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 11:45:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 11:45:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 11:45:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.54)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 11:45:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=esxGaxoi4bvV1T1GRTtNue95Ghbf+ZSfIr8Pu+RIGelatICFXOsA01OpN2XU4gJ09YIqkbSC3Sd7nLYFtJcAAjE1sD/sCuPawNJ05Krx2kn3/c2XyoaLztn/I7RHfG14JTh2jXcLNdaf9mFDIwYaJAGBeDdI/FONOaM9MMtzzwr7CFQrUTaoZ5kWLU12N2VQFm+pN9Ts80anI/icgqWT1nFi75gm2f3hx6kNPbSKv1aE+TzOUVavEzGbgkC7X1cIKMaF81UI29dyQ6ErDj53TOMjuJ//HXBag/51J1ZFNy0JhjBxCwB2ojtsD3K4qpIXKhT58zkVMUnmTPWnQ4SYUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tf4DXIZfk8GXYqGc64NFbvynE0SjcXPo7lfbcUseI8=;
 b=Bj2P5M1o6rp9RpbZVz9/S+5sqZU8bIsuMujBWjTQKuvN9btNS4FZus9hNGRHIwuvH+orspn+TxU9/1wj48uv4drvlrxjLOhPsuTZNdw8kbisy1AW1EPcn/a19mB6sHnAk+qBs65SBrfy2mX0GIsdh3fwAsIofY7zy4/88W/9Klb5Zi/lwc09Pu+KzdBweNqu8L2J3HQivYrX3sJ2pSMxSfNNYbMklH2XZPlYx/xac2APrvbrmJOiaQC4HFI6GS8nYi+Bnz8SAGIdyeCcV3s7oqDQWHnyeXPLT8/lmZ+7BkO9APbQYQBMqfd3D8vx9jO9Y/RrTrjekBbUq9HnCXKlCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MW4PR11MB7031.namprd11.prod.outlook.com (2603:10b6:303:22c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Wed, 27 Aug
 2025 18:45:21 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 18:45:21 +0000
Date: Wed, 27 Aug 2025 11:45:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Fix kernel-doc formatting for madvise and
 vma_query
Message-ID: <aK9SPl80UTjp5Cvt@lstrano-desk.jf.intel.com>
References: <20250827190136.3810508-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250827190136.3810508-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::15) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MW4PR11MB7031:EE_
X-MS-Office365-Filtering-Correlation-Id: dc92cad2-3ddd-4b17-e18f-08dde599e081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?gteiNOnwu7ouV7oTzHa2/LprQopIiXSamVQ0ZbqICqY2WYtMCIHG6t69q/?=
 =?iso-8859-1?Q?REEtgPs44LxYGjG5WsXX7NEMi2eEYFZY5npMuSDGRwnMHCiK5oVNgiPNqB?=
 =?iso-8859-1?Q?dhErETvC+Plqby9GcDeqiyd2tbE5w/CMOWKthVmnXV1qPTULbfCpG0ihKp?=
 =?iso-8859-1?Q?NLcYkGx9ud1FRmjw4AUkofUbI31ltsh9CV1ipR33Ol5aZKKG9mNx7G7TVP?=
 =?iso-8859-1?Q?lWZrJ2P47Vi3hkirCzbgsJRGao1pTF6vMv6KuhfmBuPBKfbkyQOlj94wNe?=
 =?iso-8859-1?Q?sVB8QG0pm6OEdqLYhBGUCcLhltZsb2cZr1MTDSaupNjv10jw/selkKiOBC?=
 =?iso-8859-1?Q?Lko67OX5X45YGKVxTEg5AgtLmgnp0qFnhN6qdROPxD8w/CAslbyex5w7q8?=
 =?iso-8859-1?Q?pN9JZFEHL7LtOm8Nd5F82h1hbLSabCUQIhV9/x9yK6TKbHmgyn41W3cSyN?=
 =?iso-8859-1?Q?0+saYfOO9KH+rxzhUfpEhVPOEunNi4JAaPq1zPObe/LBQ1bNbty/ot29ut?=
 =?iso-8859-1?Q?6vMBiZ16ZpCDNcXRPMplttbi1/dTEpNIqkrOlQqpY+aAA1G2Mipobuf9b0?=
 =?iso-8859-1?Q?LuvBIulHeq2aSj4euLOb0fufCwRqTsEmLvzwPLNr3X5l4rqTeg1STEvPrO?=
 =?iso-8859-1?Q?qMHYAp7Y8pN3G+B9utPebjknmH2IEn1blULGVymg1jFR488ur3OQpDtq+g?=
 =?iso-8859-1?Q?wuH87uJ0s/63rkDd+Z3VdJJqw4otkr5U3Mn64Nk6c92ZaBUHnhMcO2hZMc?=
 =?iso-8859-1?Q?HRbry6bzsvjiELIzp6DAYPl3QICP8YFdWT/UeFPhQBKvTQrGEXlshBlSBb?=
 =?iso-8859-1?Q?l2wz4cCH8+O/kNErMPKV5RE7iw/9au8u/WitH8VFRrXsZrUv3VOZSrCaHa?=
 =?iso-8859-1?Q?lObk049YYX0uAC+ohGVKGFYDeMckfIEh62svggYjpXKjUfR33K6x2D75Db?=
 =?iso-8859-1?Q?LODM4hXSFjEodb3bGldPBiytUDo7+rxFRvJM7lEdAexvylZr7UakY+ox/C?=
 =?iso-8859-1?Q?SaM9PoQDJjXNDFjJQUMwsJcYPlZyIz3CU58G7aOwn5vnacY3yEe5Jf6SA/?=
 =?iso-8859-1?Q?hHhzDnV5DI2BujVR6F8oSf0sJ9FLl3EPctJaBIRvfPHlukU3uDDa6USOqV?=
 =?iso-8859-1?Q?0n0lxhMhEvfz7c5yBzE532MQURF+mzW8MggGfFUtoFKpRc1OkuBbMF4iOn?=
 =?iso-8859-1?Q?kuQP7FbD3+K75I9jyNcCUphap3YIOZJzCVZim4syRffldqkyK9gkVQ/qfB?=
 =?iso-8859-1?Q?BP6pbk7muGjH1hU69tD8psqzU9XJqlT2yAl6qjalkFGEglPbQbK36CxB6s?=
 =?iso-8859-1?Q?kO/0gFvs5w7HKBobMz4NZvHlLHwDnuB6TPVn4lGUPmZn0i5BdK+ErtpoOT?=
 =?iso-8859-1?Q?r1vJAem7gHez5tjRjYpQsicrqnA0Fxlv6MW0f8QbMg3J7fN3jEiPK470ZR?=
 =?iso-8859-1?Q?A5MOzebElQM0Kp8wbfSZsXAXIvD6YRD9L6LNw+L5xer6sZgrR9hl/JFXMR?=
 =?iso-8859-1?Q?s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dzSwVmSHSXn9f2fhThyb6JDGeeFUbTM1uiTJ9YjxG9NBCYYSokQPKrY5uF?=
 =?iso-8859-1?Q?LaE1A1kyEuxutyogueFlMYBaLV0Nl5fztZiN/IUfbvqoVTf5PU2CFU9KIe?=
 =?iso-8859-1?Q?ktGaTdragBD1fbGhRfNJ9axGnlpaM2no4a7cse7p+dAA79cxFGHKYo/AuX?=
 =?iso-8859-1?Q?7NPu4GqKuRgXrmmSmYswWb+H9GMDYZxO0qrXGFSShjoH1Ei0Qfg4T9P6AA?=
 =?iso-8859-1?Q?22T/OcfY3jCSdSAc8dzRRbohBdIZoPhUmoi6/Evym+3RUoE5x3hTxIeO//?=
 =?iso-8859-1?Q?mlT1oUw7Ed9DuOeNDK0CV5yQALPi/UJmsx6hIWRwa7xwjyLiwB+6zVkLFN?=
 =?iso-8859-1?Q?gXP+GieTJIQe+1WPxujPWhEe95Ru5Bvd/kT470Gyo8AWCwp6SzvVY/j7Sg?=
 =?iso-8859-1?Q?aLhdAXplOpTadxiGxZoKeVjL4muNoX/nWConSfhozvpNCBTND4qI8n8WdC?=
 =?iso-8859-1?Q?DxDlGWAnKVPaT9E3t3EHapsleEFvr9rV/i3r69x47W3F2MBbiNxUJZJ/yh?=
 =?iso-8859-1?Q?jkF/H2dUvtLEfKYQiWNEnrOwXg874QYWqK4jthzYhFkO5EEMDmDkcct88r?=
 =?iso-8859-1?Q?21IMoMzqAOtubKvbYUOYakMRsGZ4uo+I6JG1QxznoaLplqPTrNSM3u3ias?=
 =?iso-8859-1?Q?TuU+BOdN3g59z0W7v15OttwO/QUihUBaRk5lStLmw13qy72BWlJYmGZvK8?=
 =?iso-8859-1?Q?TW+OxHQaRUr/QmiB1rQgJfHKxHesMyw4F/NUCoRenoWRpPtuOOSFmh7x1s?=
 =?iso-8859-1?Q?hn+Ch/2rdUmXg3G9Ns4SCr1h2lef+hHpLYJTHKTYp79+yMbMX/prV9RKji?=
 =?iso-8859-1?Q?V20xCFT1ECkCIhiME7lytxlRGVo+7U4rTm315d+VqUV/Aqko7NNnhUbtqM?=
 =?iso-8859-1?Q?1zDPkkaq8iVUcpwRp/tf2HHEILkfmmox5kSPQy76jed9miYr3X/DtGMJm7?=
 =?iso-8859-1?Q?8w9e1XNLUrjv+P9yxpFSTvOTRxoYtyOR/Cq/hITEOlEQZWT7FdiZoidxcs?=
 =?iso-8859-1?Q?dezr6d+X0/LA+8y92W5vAuWm3i9FNEFpqZ/NXIxgM54gt8UshLB0z25+Qa?=
 =?iso-8859-1?Q?14m02TBvVe657e9OvNLxuIq/VGwp2pNcode8euj+bX8iOg44l9kYPB0LLh?=
 =?iso-8859-1?Q?2bdCG2hvUdCqh/wF5Kv26a6TQ8cMSiYx/3euVm/GUoyu04s9HYLe5EoWq7?=
 =?iso-8859-1?Q?xvG4TVI+SHWi4iGLA1gDAosqmm3YUciA8bZCEubdV4elLHNV96RvKz2lGp?=
 =?iso-8859-1?Q?PolBkJmVhsUcLLtzeYrpTt3BMbwPeaHzVsjMCxNgTi6YFa6GfzOiOgLyv0?=
 =?iso-8859-1?Q?tvzmKPeaaNFjHCLp2a0O4sTydTjjNwtGJ3pkNVKRoAgXUGXS2ykjw3iC2n?=
 =?iso-8859-1?Q?6nmVsfu7aUCTMaOBpEckIv50V/FPSOQzdRhdCZDw1XVV7Gqfbh6bY/gMT0?=
 =?iso-8859-1?Q?knXY4pDeyhObC11jfsLHzbtoBMhnoHcbCccWzbjzPNlRaUvecfq1HcGUz0?=
 =?iso-8859-1?Q?NrklSDIOK/4JcVWumXpTL2L4EMYYhP0Wn75LDsppyI7kXqL7rC0+2LlJw4?=
 =?iso-8859-1?Q?kyKzXicZzDAapmI9m4+NPdjHk1YpgvPsMpfmYRSLKau60IzFNa2DJnWRFB?=
 =?iso-8859-1?Q?IY7vciTYogGGnZWwk93/mB8o6vdIbcZtmimu76BL4g07KX1iCgfXe7Ig?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc92cad2-3ddd-4b17-e18f-08dde599e081
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 18:45:21.7451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNl/2PlQE1OKNpQRzSezEBShxrPGR2DY/um7+wG5C8xsPROlIR1hlbbGqwgw3NjT+lNt4hNRCCys4JRsDzr7xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7031
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

On Thu, Aug 28, 2025 at 12:31:35AM +0530, Himal Prasad Ghimiray wrote:
> Correct kernel-doc formatting issues in the UAPI definitions for
> madvise and VMA query interfaces to resolve docutils warnings during
> documentation build.
> 
> Fixes: 418807860e94 ("drm/xe/uapi: Add UAPI for querying VMA count and memory attributes")
> Fixes: 231bb0ee7aa5 ("drm/xe/uapi: Add madvise interface")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 7dedd45ab995..a164deedae33 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -2006,12 +2006,12 @@ struct drm_xe_query_eu_stall {
>   * .. code-block:: C
>   *
>   * struct drm_xe_madvise madvise = {
> - *          .vm_id = vm_id,
> - *          .start = 0x100000,
> - *          .range = 0x2000,
> - *          .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
> - *          .atomic_val = DRM_XE_ATOMIC_DEVICE,
> - *         };
> + *     .vm_id = vm_id,
> + *     .start = 0x100000,
> + *     .range = 0x2000,
> + *     .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
> + *     .atomic_val = DRM_XE_ATOMIC_DEVICE,
> + *     };
>   *
>   * ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
>   *
> @@ -2073,12 +2073,16 @@ struct drm_xe_madvise {
>  		 * Used when @type == DRM_XE_MEM_RANGE_ATTR_ATOMIC.
>  		 *
>  		 * Supported values for @atomic.val:
> -		 * - DRM_XE_ATOMIC_UNDEFINED: Undefined or default behaviour
> -		 *   Support both GPU and CPU atomic operations for system allocator
> -		 *   Support GPU atomic operations for normal(bo) allocator
> -		 * - DRM_XE_ATOMIC_DEVICE: Support GPU atomic operations
> -		 * - DRM_XE_ATOMIC_GLOBAL: Support both GPU and CPU atomic operations
> -		 * - DRM_XE_ATOMIC_CPU: Support CPU atomic
> +		 * - DRM_XE_ATOMIC_UNDEFINED: Undefined or default behaviour.
> +		     Support both GPU and CPU atomic operations for system allocator.
> +		     Support GPU atomic operations for normal(bo) allocator.

Missing a couple of * here?

Matt

> +		 *
> +		 * - DRM_XE_ATOMIC_DEVICE: Support GPU atomic operations.
> +		 *
> +		 * - DRM_XE_ATOMIC_GLOBAL: Support both GPU and CPU atomic operations.
> +		 *
> +		 * - DRM_XE_ATOMIC_CPU: Support CPU atomic only, no GPU atomics supported.
> +		 *
>  		 */
>  		struct {
>  #define DRM_XE_ATOMIC_UNDEFINED	0
> @@ -2196,6 +2200,7 @@ struct drm_xe_mem_range_attr {
>   * Example:
>   *
>   * .. code-block:: C
> + *
>   *    struct drm_xe_vm_query_mem_range_attr query = {
>   *         .vm_id = vm_id,
>   *         .start = 0x100000,
> -- 
> 2.34.1
> 
