Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D59CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 20:09:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C2210E158;
	Wed,  8 Oct 2025 20:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MrFVwLjv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB72B10E158
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 20:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759954143; x=1791490143;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xgDjZuqGATWBfSYL3MwKtbUOnzILzMAGZJFv8ImMKzY=;
 b=MrFVwLjvHRucUMkVDcBMZ1v+XtyhKet+q2BibqyxQrhAXFiH4XFWY3rZ
 lzXhlpH0cnqKj0ek0Z0hMLSeWJSvk3wAEGaz6zRYp5qcPxqGuXEx3Ug3U
 d58rkMM3iI76FodN59xt+gy9XvL0Y+Z3vW6+6NZbVeGkNi3NNs6UTPIFA
 pjOvwF1vMr7uFRU2IHs6V49sOXoG5o0pFZqvAvxKINDqA+Lvzy2StSGAE
 BvNiQfn2NOeGWpGGR7vhm/mist2yXU5wSICgrsSRaz5p/gG5SGjMG5T1M
 VP52+w2s5JyCnnsUH/OxMkgiLPwx+j1TCqnC9aTw1fuoOiq6c1ahq/Seb g==;
X-CSE-ConnectionGUID: NkhE3g1URPmX6zf80YJzZA==
X-CSE-MsgGUID: +rhXSgwKSJePNoZigSXAHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62066593"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="62066593"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 13:09:02 -0700
X-CSE-ConnectionGUID: 3WjAIwRjRUyS9IU3abJudA==
X-CSE-MsgGUID: l92y69E0R5mJ+XUgyHEInA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="211475427"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 13:09:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 13:09:01 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 13:09:01 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.39) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 13:09:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AipuwOThKuWvM/k8AJyO2pgdYuLdUtrl99HkUkKFcTK6is2bbxT5HrIr5pW+eGBxw3kMPSNCA9APPoB2BbtXP0p53cTcM80808YzMMpdcJ2zpNuu563QsB1LIVwX/hKCXoewO74RfUXJzkbZ09hZeyDjUno9e9gBCXkroKvJG2neoAu9Ldu0/d6ODUGSrHSJG9nTaokQyw2X9e21Ut80KcIGWT8fOiyqOl8iy5bi+fS+nDLL77SLPPME8TVJpGatApFxH3gTOyByZYrWidGfPr7kZRo9MOuE/tvd2OBdTjfeGOYOH1c4xLuF0Yj245e/SUsLr2ceuhCxhGaXVdDFcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BH8CuV36qqAov/05Wozz6n3xesbIDa6AS3/Xlqiahog=;
 b=aGG4kDidgSqtNJHio0FAfW3nJz1t/XTcXS2oCuDVxLva7QrWKvL7od7/OAVxd/Fqiz4xJFgRwhoCcRYXNG5Fhk7Y7I5rCQi2pMItEcyEOFShPMujTL5yPpUcBF8q6x2JgY2xiHE4VEQ/KO2gsKjzCv09nQW1ay9MomK9dTXKVKxNt6DT6JoVR2JXSUcGZY5lxVo/+pVYEjlRArqDqOffTCUqnjGdYX3MKhE37zDzSx24w1T00xwH9JyiHPRsjUVTjK1qdWZe63jFZRKQhgwalMNBVM5Ic4Rc3ODQLDKwNmCf8UmF9h53T9Op2PW/EcPRbn7ZEGRI/uf0WmFumDAW4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN0PR11MB6182.namprd11.prod.outlook.com (2603:10b6:208:3c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Wed, 8 Oct
 2025 20:08:55 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 20:08:55 +0000
Date: Wed, 8 Oct 2025 13:08:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH v4 22/23] drm/xe/configfs: Add attribute to disable GT
 types
Message-ID: <20251008200853.GH5409@mdroper-desk1.amr.corp.intel.com>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
 <20251007204829.1468209-47-matthew.d.roper@intel.com>
 <c45b55d0-697d-4e3b-82d3-5cecda6362ff@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c45b55d0-697d-4e3b-82d3-5cecda6362ff@intel.com>
X-ClientProxiedBy: BYAPR07CA0080.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN0PR11MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: dc3e579d-8363-4f1d-bded-08de06a68249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXdnS1BiSEU4bVYxRVF6bVdzeDdRMVN4ajVEQUx0TEZwVjlSalZZUnkwUWxG?=
 =?utf-8?B?Vk9nNDd3ZDlUSUJ0ZkZleDl0c2paUkFlQWRDS242d1ZxUlZvS0NQRUx3aEkx?=
 =?utf-8?B?QmhjT1I0NU5uY3NkdWRhTnpqaTN4Q2hCZWx6UlU1TjhoY3BnY1JxR3g2aFRy?=
 =?utf-8?B?MWo1WHJSYjc2UGh2aTJaMXRoZWhGbUpxSTJmZEo4UnJvUy9lMVJNV21KSk45?=
 =?utf-8?B?MFRQN1hZSCtteHZYbjd6Z3R2R0YxQXVwWCtHNHVJbE11dWh4dERKeXRiRmtS?=
 =?utf-8?B?Z2xoWEI2NEs4d3JRK3QyanFZejZwM3lFMTZaQ05ydnNHV29HcXh2L0s2U20r?=
 =?utf-8?B?c2pzLy9iMW5taG9idWQ5alB1eW9MVkROdWc3Lzlud0xIREJkUzJnUG1EZmdB?=
 =?utf-8?B?MmloTnFvR3h0dEIybVhBS0FHdW5Bd2ZPMlIyV09BVFZVUVZWSmZKT1Z4UmxP?=
 =?utf-8?B?Q2ZxUnRUTUE4T2Z6c1hHd3hQbURHdzkzZ2dBdk9LajdCQXl1WDlsZmw4UlpQ?=
 =?utf-8?B?STdMQlRWY3VPTU9UWkwxeUpTR3JPRTh4S0dUSTAzT2tLdnpwSVk3TlNiL0Y0?=
 =?utf-8?B?NUk5RENhUXFNUlRzZmwyQjBsRThtOGZoV2pKRFZqZzFyaGw2L3dTSVJJK3FT?=
 =?utf-8?B?OEU3UGlJTlQrRzFDYWRqaWc2SmVWcWtnYnRXZWt3aFFESEIwK1ErSFRuVW9J?=
 =?utf-8?B?cXRnVmpHS0ZieVBLUFJpYnhFSEN2SkxWbzc5eVBJanpzZ3R3akl4ZXNBNTVG?=
 =?utf-8?B?VVlhNjVlQVRvVmw1M2dvR2J1K1NPNkNWRWc3SDgwSGo4NjJib0RtQ3QrQTZt?=
 =?utf-8?B?WUErZWtOT0l6aTlYU0NaMnRPTi9OcjcrNUhXS3Z2MDVpT3ZOQlZsSmNZUWdR?=
 =?utf-8?B?dXYxQ0dXYVFCeWNoL0h6M0R3N1BxVk1MbHVTNHZqbXJsMExCTmJGUzdWMUIz?=
 =?utf-8?B?R3ZmMUc0clJzcXdyMjNJRStTOUlhV1RabkVvTlJySmhtNnlGV2M4VHBMY2h5?=
 =?utf-8?B?NlBWWFhHR1MySmtMLzJMTkdTdnQrZjRvZVdxekVOSFgyMGc4Y2NhRlZFeTFz?=
 =?utf-8?B?SEVSdVBPVFUrelZpc2xKNS9INzZlWFVGdEx3eStHZ1dwcVY0OVJkSE1jTXhQ?=
 =?utf-8?B?RVpWais5bnFOcFVmNVFiU055Y05NUjgxMHFBczhnNVo0RSswVzdISmdNUElo?=
 =?utf-8?B?V0NGRGdES2MxdncweGZRRlNhQkkxU1FteHhNdkM0WjA5blFuZlBDYU9NV2Rh?=
 =?utf-8?B?cCtYMW14WVpHd1RkdmZvU0taTnJIWk1xcTBQVFlZSitsa09UNS9oTUc3dzAy?=
 =?utf-8?B?VHdiR28wY0dsU2VISU54V3hPVW1aa3JleURSQkVhb1Z6L1NvTE5GN0U3Q2dh?=
 =?utf-8?B?Rmt3MmZjRk8rZ1F5c3VYM3EzdEp5ZFBPZmlkRWJkeDZCOEN4dW5SVkhKS05x?=
 =?utf-8?B?REQzd0tIdXplOW1TZ2FSU3U4dnpJeUNDY0xyLzZXZnhYemZXbmJMNC9qTWor?=
 =?utf-8?B?a2djRkhTSXFQYys5RGFnSVpFeUNRSDBEanRBVHNkTSs2d3FtcWNSV0kwUHZG?=
 =?utf-8?B?T0w1NHpwalorbGdWL1JHUGZwUktIQ1BPRnpDQUtsZ05tM0FUenJsUnBVZEVN?=
 =?utf-8?B?Wml6bXNreHJseGpuTXlXR2ZSVWxoeC9MbjdxOFpya2FOU3d0b05ZMWdiUk5J?=
 =?utf-8?B?SVVCMEMrVGpVejg1b0FGb2krS2lTa3M5L3ZVYXFPdjNVL0NWMjdDaWhJUHQ1?=
 =?utf-8?B?K3pmZzRERTZ3UVY2SVdhZGtMNFFtQXltVSswdGQrWXpORDF3S3BiUEF0SHhE?=
 =?utf-8?B?ZXJXT0pWWFM4RXZJUGlueVE0UzBPV085VG9Pb3NFbEwvVGkrdUtBdHpDN05p?=
 =?utf-8?B?c09WcGFsbUhmR1RhKy9MSVhwV1M4bEhZdFVGOUlPNDRJMnRzTVh1UVYvU0p0?=
 =?utf-8?Q?5AyKtEj/kZd5xxc4uWT+shIgKkKZqfZu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXRVdFdUU3I4ektWa09nOUREeUhCRGcwdzRyMFRYc2pTUlVOR1F2em1udS8v?=
 =?utf-8?B?eVkveGxNVktBdXZ0d2F6a1FPSVdOblVFUUswYjlQa3ZQQ1h2cFNhVEJLZzNY?=
 =?utf-8?B?V0FtRkJ4WHVwQWdJNUQxN2FTSUJBUElHT2JHL29vQ3crL1J2N0c0Y1crZ3hX?=
 =?utf-8?B?RGJOUHo1REN4cjRYWnpwa0JMODhjMEZ4OW1IZ3FpYWMzQVFhNUdpQ0VKU2Fl?=
 =?utf-8?B?K20vU3RmTDRDWEtoR3pqWUdpaHRvY01NZ3Z5MHNtQTUxaUZYSXdaWm4yS0sz?=
 =?utf-8?B?RUVzRzIvM2lvZjkyWkVHaUM1UFhtSnovOWpEWVZnaklIRXZTZVdjbE9XZHZh?=
 =?utf-8?B?dzBWaW04c251NFU4V1M3UHN6SmhmMjhheTFzZDVqQjBYRmN6enI1eVgrWEFO?=
 =?utf-8?B?YnhJalh3OTlNTjlRV21yQVZReEMveTJFVHFkZStHYW54TUR6WWNxR0tIV1ND?=
 =?utf-8?B?d2RyM1Ira0ZJZ3JvT25PYTVHZjdXckdRRHhJWXkyWmZoUWF5Y215VGtCbTYx?=
 =?utf-8?B?NGNXQnlCYnV3cytyZWw5b3psVVh4L3ZsT0JEb1ZmOWJmWkdub2pSS2xVMDJo?=
 =?utf-8?B?VmtkamZPUnBwQmFiZURYeWNkMDduRWxmTXpCVTRZYWhVRkcza0ZpWTJlcjdO?=
 =?utf-8?B?Uk12d1VUWENvcVZOam1xNHNWTEpLYlBjemNndnVsSDNvanlkVGZxZDR6ajQz?=
 =?utf-8?B?Qk9ybEhSS0JhVmpHSUZrZ3BuSHRUQ2JMQU5STkxHYzZiNW9KSFEzQ24yWnJN?=
 =?utf-8?B?QnBqMW51UHFNNXc1NStzRGFPMkJPSkJBdjA4TldPaE4wdDZLTHArOEhESUVl?=
 =?utf-8?B?L2I4WGFPYWdyaFJ2bndXNmNsaDV5UDBPcWNFZlFMODl3dkFGVVkvN2g5NXdu?=
 =?utf-8?B?RmYvcWtLcTk3YWMwMGRHZ0t4TUsyN1JneENXOGhUaTBjeHBVbXpMQnU2ZXNU?=
 =?utf-8?B?eGJZOG0wbjN2ZDdJT1lxOWlrZjR5THZUMXFsSDg4Z29OWjN5VTFNbUR1ckhX?=
 =?utf-8?B?QXBxMnQwVGsvWklGMWpKKzZ2bGNXOUlteUE5Y3JzY09WNldDeW9MQ1VxNXRa?=
 =?utf-8?B?dWkwN2RCcDcyTnY4cXhXVXFIekxPanAzaDgwMHNnOFZWNGtkWC96NTFTT1Jr?=
 =?utf-8?B?eEFkdWo2ZSsvQytuMk1kbE81TERoZGQzdFdXRzZFWm13SDJtTGNvZTEzYWUw?=
 =?utf-8?B?dDlTRytSUUN2bmpLMHV4cUFpM2FWSWVtd2pVUHhDQzBRMHNubVJ6NnpDNlVQ?=
 =?utf-8?B?OXBrUk1aZ0p2cm8vc3VGWTNVZFdmU2hVQmE0WE5lMDM3Q1g4d1Q2bFQrVXlx?=
 =?utf-8?B?VUpWeHhpZ2VHcUNKS2YzSGFwSEtYei92RFZlMUZaYjB3V0RuWjNzL1h0L0xN?=
 =?utf-8?B?RVJzMUUxOHVYZmZ4SEpmVUV6UDVVSTRva3B4alZkUUpRMzhXY3M0OGRZTXc5?=
 =?utf-8?B?cXNaSnBPT2plUWFsWGxEN2ZJd0NkcHBzWWlCVFNYd0N0RkVGcWg3RnJJR2F1?=
 =?utf-8?B?TTdycXViaWZWSmZMOGpZRFpHNXhZNHJLMlR0djJWMFZKaXpxVTJEL1dnV1pt?=
 =?utf-8?B?MUxZTmtpeHYvYmlYY0pLYkdjeTkzYnp4YXNPZGN3SWZ1UTF1QVFkNi9FVkpF?=
 =?utf-8?B?a0hWRHB3Z2RuTFE5bGtUR0NCcGtKVjNOZDdTTXVHKy9XSDZvK0pTaEJoT1RY?=
 =?utf-8?B?ZVhUTmhRRnl5TkQrSlA2dHhPbGhxNlhWQStNRkIxN08xb01NTHpXeklra1dN?=
 =?utf-8?B?RWdaZkwxNDB5dHRCaVg1UENGenNBQ2VtckQwQ0VQNVJ3bGpCMm5NU1E0ckJu?=
 =?utf-8?B?U1Evcm1PNzg5QVVLUUJZZThBMnh3RWZvSjc1SkMzbFlWU29OTytHTms0YXZO?=
 =?utf-8?B?R25mWnEvSEpHSjNIOUhqRXd1dUhXVENKUW5mR1FEdUhDTk1WZHlHSTZOODJO?=
 =?utf-8?B?MnBCV3EvYndhYldKZUpSRHpUMzJTZUw4SGVTZUxYS0RzMGJuYktJallmRUdW?=
 =?utf-8?B?QWhsaW9KVmhXdEFZTmtNeWJnV3Fzb2ovUjZ6UFp4bmhWNFNPeVZDWFNpWnMv?=
 =?utf-8?B?dnI0WURTWHc3YUN5YWphM2JZeG9oenFwRjdsc2swOGNMazV3Z3lpajI2SnFO?=
 =?utf-8?B?d2IwT3VIa1hPRHZzWkpjd2tRNnZ5M0NQK3dVT1NmSUFSa1JYMjY3L214YWdp?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc3e579d-8363-4f1d-bded-08de06a68249
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 20:08:55.4952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HFYWtLpnc8+AGHioCmzxjJ7fQ7jDTsdpRiRo/8oBfChJAK5aLeuT0GhxpWuogzaRryxzc0Ho4OTmQ8TJCCd3QiDNEP5p86vA+qpdauUsT/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6182
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

On Wed, Oct 08, 2025 at 12:12:37PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/7/2025 10:48 PM, Matt Roper wrote:
> > Preventing the driver from initializing GTs of specific type(s) can be
> > useful for debugging and early hardware bringup.  Add a configfs
> > attribute to allow this kind of control for debugging.
> > 
> > With today's platforms and software design, this configuration setting
> > is only effective for disabling the media GT since the driver currently
> > requires that there always be a primary GT to probe the device.  However
> > this might change in the future ---  in theory it should be possible
> > (with some additional driver work) to allow an igpu device to come up
> > with only the media GT and no primary GT.  Or to allow an igpu device to
> > come up with no GTs at all (for display-only usage).  A primary GT will
> > likely always be required on dgpu platforms because we rely on the BCS
> > engines inside the primary GT for various vram operations.
> > 
> > v2:
> >  - Expand/clarify kerneldoc for configfs attribute.  (Gustavo)
> >  - Tighten type usage in gt_types[] structure.  (Gustavo)
> >  - Adjust string parsing/name matching to match exact GT names and not
> >    accept partial names.  (Gustavo)
> > 
> > v3:
> >  - Switch to scope-based cleanup in gt_types_allowed_store() to fix a
> >    leak if the device is already bound.  (Gustavo)
> >  - Switch configfs lookup interface to two boolean functions that
> >    specify whether primary/media are supported rather than one function
> >    that returns a mask.  This is simpler to use and understand.
> > 
> > Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_configfs.c | 145 +++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_configfs.h |   4 +
> >  drivers/gpu/drm/xe/xe_pci.c      |  22 +++++
> >  3 files changed, 171 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> > index 139663423185..e36cc5e1bc8f 100644
> > --- a/drivers/gpu/drm/xe/xe_configfs.c
> > +++ b/drivers/gpu/drm/xe/xe_configfs.c
> > @@ -15,6 +15,7 @@
> >  
> >  #include "instructions/xe_mi_commands.h"
> >  #include "xe_configfs.h"
> > +#include "xe_gt_types.h"
> >  #include "xe_hw_engine_types.h"
> >  #include "xe_module.h"
> >  #include "xe_pci_types.h"
> > @@ -56,6 +57,7 @@
> >   *	:
> >   *	└── 0000:03:00.0
> >   *	    ├── survivability_mode
> > + *	    ├── gt_types_allowed
> 
> I'm wondering if we want to keep such advance knobs at the same level as others?
> maybe create sub-group for them, like I did for sriov?
> 
> 	    └── tweaks
> 	        ├── gt_types_allowed
> 	        ├── engines_allowed

That makes sense to me, although I'm not sure if it's too late to make
this change now since I think 'engines_allowed' is already part of
v6.17.  Are these configfs settings considered ABI that we can't change
now, even though they're explicitly intended for driver developers?

+Cc Lucas to see what he thinks.

> 
> 
> >   *	    ├── engines_allowed
> >   *	    └── enable_psmi
> 
> oops, and it looks that I missed to update this part of the doc when adding max_vfs with:
> 
> 	    └── sriov
> 	        ├── max_vfs
> 
> >   *
> > @@ -79,6 +81,44 @@
> >   *
> >   * This attribute can only be set before binding to the device.
> >   *
> > + * Allowed GT types:
> > + * -----------------
> > + *
> > + * Allow only specific types of GTs to be detected and initialized by the
> > + * driver.  Any combination of GT types can be enabled/disabled, although
> > + * some settings will cause the device to fail to probe.
> > + *
> > + * Writes support both comma- and newline-separated input format. Reads
> > + * will always return one GT type per line. "primary" and "media" are the
> > + * GT type names supported by this interface.
> > + *
> > + * This attribute can only be set before binding to the device.
> > + *
> > + * Examples:
> > + *
> > + * Allow both primary and media GTs to be initialized and used.  This matches
> > + * the driver's default behavior::
> > + *
> > + *	# echo 'primary,media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> 
> maybe "all" as an alias?
> 
> > + *
> > + * Allow only the primary GT of each tile to be initialized and used,
> > + * effectively disabling the media GT if it exists on the platform::
> > + *
> > + *	# echo 'primary' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> > + *
> > + * Allow only the media GT of each tile to be initialized and used,
> > + * effectively disabling the primary GT.  **This configuration will cause
> > + * device probe failure on all current platforms, but may be allowed on
> > + * igpu platforms in the future**::
> > + *
> > + *	# echo 'media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> > + *
> > + * Disable all GTs.  Only other GPU IP (such as display) is potentially usable.
> > + * **This configuration will cause device probe failure on all current
> > + * platforms, but may be allowed on igpu platforms in the future**::
> > + *
> > + *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> 
> maybe "none" as an alias?

While we could add the all/none aliases, I'm not sure it's worth the
extra parsing hassle, since then we also need to check for nonsense
settings like "primary,none" and such.  Since only a small subset of
driver developers are expected to ever use these, we don't need to worry
too much about convenience aliases.

> 
> > + *
> >   * Allowed engines:
> >   * ----------------
> >   *
> > @@ -187,6 +227,7 @@ struct xe_config_group_device {
> >  	struct config_group group;
> >  
> >  	struct xe_config_device {
> > +		u64 gt_types_allowed;
> >  		u64 engines_allowed;
> >  		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
> >  		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
> > @@ -201,6 +242,7 @@ struct xe_config_group_device {
> >  };
> >  
> >  static const struct xe_config_device device_defaults = {
> > +	.gt_types_allowed = U64_MAX,
> >  	.engines_allowed = U64_MAX,
> >  	.survivability_mode = false,
> >  	.enable_psmi = false,
> > @@ -220,6 +262,7 @@ struct engine_info {
> >  /* Some helpful macros to aid on the sizing of buffer allocation when parsing */
> >  #define MAX_ENGINE_CLASS_CHARS 5
> >  #define MAX_ENGINE_INSTANCE_CHARS 2
> > +#define MAX_GT_TYPE_CHARS 7
> >  
> >  static const struct engine_info engine_info[] = {
> >  	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK, .engine_class = XE_ENGINE_CLASS_RENDER },
> > @@ -230,6 +273,14 @@ static const struct engine_info engine_info[] = {
> >  	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK, .engine_class = XE_ENGINE_CLASS_OTHER },
> >  };
> >  
> > +static const struct {
> > +	const char name[MAX_GT_TYPE_CHARS + 1];
> > +	enum xe_gt_type type;
> > +} gt_types[] = {
> > +	{ .name = "primary", .type = XE_GT_TYPE_MAIN },
> > +	{ .name = "media", .type = XE_GT_TYPE_MEDIA },
> > +};
> > +
> >  static struct xe_config_group_device *to_xe_config_group_device(struct config_item *item)
> >  {
> >  	return container_of(to_config_group(item), struct xe_config_group_device, group);
> > @@ -292,6 +343,58 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
> >  	return len;
> >  }
> >  
> > +static ssize_t gt_types_allowed_show(struct config_item *item, char *page)
> > +{
> > +	struct xe_config_device *dev = to_xe_config_device(item);
> > +	char *p = page;
> > +
> > +	for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++)
> > +		if (dev->gt_types_allowed & BIT_ULL(gt_types[i].type))
> > +			p += sprintf(p, "%s\n", gt_types[i].name);
> > +
> > +	return p - page;
> > +}
> > +
> > +static ssize_t gt_types_allowed_store(struct config_item *item, const char *page,
> > +				      size_t len)
> > +{
> > +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> > +	char *buf __free(kfree) = kstrdup(page, GFP_KERNEL);
> > +	char *p = buf;
> > +	u64 typemask = 0;
> > +
> > +	if (!buf)
> > +		return -ENOMEM;
> > +
> > +	while (p) {
> > +		char *typename = strsep(&p, ",\n");
> > +		bool matched = false;
> > +
> > +		if (typename[0] == '\0')
> > +			continue;
> > +
> > +		for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++) {
> > +			if (strcmp(typename, gt_types[i].name) == 0) {
> > +				typemask |= BIT(gt_types[i].type);
> > +				matched = true;
> > +				break;
> > +			}
> > +		}
> > +
> > +		if (!matched)
> > +			return -EINVAL;
> > +	}
> > +
> > +	scoped_guard(mutex, &dev->lock) {
> 
> probably plain guard(mutex) will work here too
> 
> > +		if (is_bound(dev))
> > +			return -EBUSY;
> 
> then we can take a lock and return earlier, before parsing input
> 
> > +
> > +		dev->config.gt_types_allowed = typemask;
> > +	}
> > +
> > +	return len;
> > +}
> > +
> >  static ssize_t engines_allowed_show(struct config_item *item, char *page)
> >  {
> >  	struct xe_config_device *dev = to_xe_config_device(item);
> > @@ -672,6 +775,7 @@ CONFIGFS_ATTR(, ctx_restore_mid_bb);
> >  CONFIGFS_ATTR(, ctx_restore_post_bb);
> >  CONFIGFS_ATTR(, enable_psmi);
> >  CONFIGFS_ATTR(, engines_allowed);
> > +CONFIGFS_ATTR(, gt_types_allowed);
> >  CONFIGFS_ATTR(, survivability_mode);
> >  
> >  static struct configfs_attribute *xe_config_device_attrs[] = {
> > @@ -679,6 +783,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
> >  	&attr_ctx_restore_post_bb,
> >  	&attr_enable_psmi,
> >  	&attr_engines_allowed,
> > +	&attr_gt_types_allowed,
> >  	&attr_survivability_mode,
> >  	NULL,
> >  };
> > @@ -846,6 +951,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
> >  				 dev->config.attr_); \
> >  	} while (0)
> >  
> > +	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
> >  	PRI_CUSTOM_ATTR("%llx", engines_allowed);
> >  	PRI_CUSTOM_ATTR("%d", enable_psmi);
> >  	PRI_CUSTOM_ATTR("%d", survivability_mode);
> > @@ -896,6 +1002,45 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
> >  	return mode;
> >  }
> >  
> > +static u64 get_gt_types_allowed(struct xe_device *xe)
> > +{
> > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> > +	u64 mask;
> > +
> > +	if (!dev)
> > +		return device_defaults.gt_types_allowed;
> > +
> > +	mask = dev->config.gt_types_allowed;
> 
> btw, as we are using guard during write, shouldn't we also guard during read?

I'm not sure; is there something racy you see on the read path that we
need to avoid?  An individual get_gt_types_allowed() call racing with a
configfs write doesn't seem like it would matter; rather the problems of
a racing configfs write would be if it happened while a device was in
the middle of getting probed (so some calls to get_gt_types_allowed()
see the old value and others see the new one, leading to inconsistent
device intialization).  But given this is a low-level kernel hacking
interface intended for driver developers, I'm not sure how much we need
to worry about them shooting themselves in the foot.  Maybe I'm
overlooking something?


Matt

> 
> > +	config_group_put(&dev->group);
> > +
> > +	return mask;
> > +}
> > +
> > +/**
> > + * xe_configfs_primary_gt_supported - determine whether primary GTs are supported
> > + * @xe: xe device
> > + *
> > + * Return: True if primary GTs are enabled, false if they have been disabled via
> > + *     configfs.
> > + */
> > +bool xe_configfs_primary_gt_supported(struct xe_device *xe)
> > +{
> > +	return (get_gt_types_allowed(xe) & BIT_ULL(XE_GT_TYPE_MAIN)) != 0;
> 
> can't we just rely on the promotion to bool?
> 
> 	return get_gt_types_allowed(xe) & BIT_ULL(XE_GT_TYPE_MAIN);
> 
> > +}
> > +
> > +/**
> > + * xe_configfs_media_gt_supported - determine whether media GTs are supported
> > + * @xe: xe device
> > + *
> > + * Return: True if the media GTs are enabled, false if they have been disabled
> > + *     via configfs.
> > + */
> > +bool xe_configfs_media_gt_supported(struct xe_device *xe)
> > +{
> > +	return (get_gt_types_allowed(xe) & BIT_ULL(XE_GT_TYPE_MEDIA)) != 0;
> > +}
> > +
> >  /**
> >   * xe_configfs_get_engines_allowed - get engine allowed mask from configfs
> >   * @pdev: pci device
> > diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> > index c61e0e47ed94..5624e965b911 100644
> > --- a/drivers/gpu/drm/xe/xe_configfs.h
> > +++ b/drivers/gpu/drm/xe/xe_configfs.h
> > @@ -17,6 +17,8 @@ int xe_configfs_init(void);
> >  void xe_configfs_exit(void);
> >  void xe_configfs_check_device(struct pci_dev *pdev);
> >  bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
> > +bool xe_configfs_primary_gt_supported(struct xe_device *xe);
> > +bool xe_configfs_media_gt_supported(struct xe_device *xe);
> 
> I guess we need decide now whether we want to continue to pass pdev or switch to xe as argument for all xe_configfs functions
> 
> >  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> >  bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> >  u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
> > @@ -28,6 +30,8 @@ static inline int xe_configfs_init(void) { return 0; }
> >  static inline void xe_configfs_exit(void) { }
> >  static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
> >  static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
> > +static inline bool xe_configfs_primary_gt_supported(struct xe_device *xe) { return true; }
> > +static inline bool xe_configfs_media_gt_supported(struct xe_device *xe) { return true; }
> >  static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
> >  static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
> >  static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index a5932e4f4a23..9c8ab2b41737 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -695,6 +695,11 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
> >  	struct xe_device *xe = tile_to_xe(tile);
> >  	struct xe_gt *gt;
> >  
> > +	if (!xe_configfs_primary_gt_supported(xe)) {
> > +		drm_info(&xe->drm, "Primary GT disabled via configfs\n");
> 
> nit: you can use xe_info(xe, "...") now
> 
> > +		return NULL;
> > +	}
> > +
> >  	gt = xe_gt_alloc(tile);
> >  	if (IS_ERR(gt))
> >  		return gt;
> > @@ -720,6 +725,11 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
> >  	struct xe_device *xe = tile_to_xe(tile);
> >  	struct xe_gt *gt;
> >  
> > +	if (!xe_configfs_media_gt_supported(xe)) {
> > +		drm_info(&xe->drm, "Media GT disabled via configfs\n");
> > +		return NULL;
> > +	}
> > +
> >  	if (MEDIA_VER(xe) < 13 || !media_desc)
> >  		return NULL;
> >  
> > @@ -829,6 +839,18 @@ static int xe_info_init(struct xe_device *xe,
> >  		if (IS_ERR(tile->primary_gt))
> >  			return PTR_ERR(tile->primary_gt);
> >  
> > +		/*
> > +		 * It's not currently possible to probe a device with the
> > +		 * primary GT disabled.  With some work, this may be future in
> > +		 * the possible for igpu platforms (although probably not for
> > +		 * dgpu's since access to the primary GT's BCS engines is
> > +		 * required for VRAM management).
> > +		 */
> > +		if (!tile->primary_gt) {
> > +			drm_err(&xe->drm, "Cannot probe device with without a primary GT\n");
> > +			return -ENODEV;
> > +		}
> > +
> >  		tile->media_gt = alloc_media_gt(tile, media_desc);
> >  		if (IS_ERR(tile->media_gt))
> >  			return PTR_ERR(tile->media_gt);
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
