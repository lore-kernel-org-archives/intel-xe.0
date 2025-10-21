Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1044DCCD1A5
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 21:25:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD4A010E34A;
	Tue, 21 Oct 2025 21:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LFXKkPSf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4998C10E315
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 21:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761081957; x=1792617957;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yA9T0p4HZq9LB4yOv2ofnGpz+wM+xtrZZTt4rePWTFw=;
 b=LFXKkPSf646dQDIVfUtua4dkGsqteos8qTEoVtixQHMw4665RNqiRwfz
 laUs1VTmjZ+pOr5b+auEIwgi8NlAxE1tr7i5rJa8IJhdXMRAK8BqdOKyC
 o2vGpJLeqMren/ZO5fCGB9f1z2sHJaQOGvVwDwJrJRx/fwHrYqO32nz9l
 k68jk+fIGwEqxEs+O4X+Qm0b4cWAn+TOCzD3c6ZLuds42Su/BcSnDA+HY
 CMmoWUFSgyrGO5+RD6HTzXNZ8wijSAye5v3RHsoJTHRutNiQHVIJtW5LE
 VPMe+IvncJ4+wmzVnkWboNNh7A0KvCKWs7URG/KICxjM8DtHt8fLcBpbK Q==;
X-CSE-ConnectionGUID: RXlMx9wsQxelATSpxD2jxQ==
X-CSE-MsgGUID: LkCTbHl9QLuYVAWJ/hiEPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63130668"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="63130668"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 14:25:57 -0700
X-CSE-ConnectionGUID: kDpri5m2TP6ZlJAYTadp9Q==
X-CSE-MsgGUID: /L5MdeeRSJGO596wmmB0XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="182901027"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 14:25:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 14:25:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 14:25:56 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 14:25:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vylEv5+YiSUEckZtsQOSpE7QEI7pOgezJdNWdx9+P9Jcdgd8kSTU03SroBPmHqxs5ArqPaIXVRgWUVNQyR29sCoZ7kqj8rETDChyI/7TPdZmLh6uvER8VmoUtpYjwoD0xqM2FJImHEC6Dq6e9IAQBG53pWCaLwYlDDHS78yIPtcxDJDo5IV6cx7HrC+XsrFR0pg6m/HG+wrhI18gM+WtgRYOw2Bbos3Lf8QuVvlheJBzKWgEbpAMGHTNKMYTP4aUgUxZG2J5WCQG5CRJDFUPKRMgiF0uqGwlL8ybOYAyoT251NcfoyVHOqAZqyi51fUqapRmTaY35l8PMM/tk/7WGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWzCEAmBrYNCFPNq0z8vBpxGtlcTyjaTGN5eMZ77DG8=;
 b=PIBSpoesnIY16Vnv5r9tpOY3bwKqyQgnMbIlsDlHXVc525xrC5rCVCczmdg43lXaDPToeaNjr95PEKI062JIilF6quQq6sF4WC2LMiMMi1dcSZyhePJo5BxGbUPvsNdab7d5CEoHc7IovdMd/xTBY01WjDGwN3IzjvgN+x7tVY5KF6n9amgcTcltzXRmdF6gn19ettAQ4EJTRWISSEDOavpoXZxB5Wjxy6fowGssfwOVxj8UGAeEYhzxh9BQkhWbqPLN6vUJdnMMf7+jdR6lzvFN4XSuVQ0yzUjhjhRcJipZzsARCJnPdSKJh7jbIh/zIJ+JPARP4/j6daYNueYVrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH3PR11MB8657.namprd11.prod.outlook.com (2603:10b6:610:1ca::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 21:25:54 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 21:25:52 +0000
Message-ID: <31d17ab6-6f3a-46fd-8c86-a436e4a2fb11@intel.com>
Date: Tue, 21 Oct 2025 23:25:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/xe/guc: Add prefix to guc log buffer macros
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>
References: <20251009215749.378905-1-zhanjun.dong@intel.com>
 <20251009215749.378905-3-zhanjun.dong@intel.com>
 <046b8be5-1b11-4c43-94ba-095638e48be8@intel.com>
 <f19dea5d-5399-4c1e-b669-9a1cd2bd2c6b@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <f19dea5d-5399-4c1e-b669-9a1cd2bd2c6b@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0230.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::15) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH3PR11MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: 4023019c-695a-4452-1681-08de10e869bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bE9mT1UrYWhSV3dNQk5RMTFNWmxrMzZySC9vU0g1NE1wSWNTeGpyb0ZwUEtC?=
 =?utf-8?B?bTQzcWFBaFYycU5lenhlOWh0blE5UkRUQ1VtU00wUHQveDd3SnZiWXJGZGov?=
 =?utf-8?B?d1duaXBXczZQd2dZQXMydzlGVmNFVDdUZ3U5anowYkE3eVBJTUIyN3V5MkE4?=
 =?utf-8?B?WTFGbXUxZlJtOGh3cmJQWHlvUkNISmxvcVRwNGt0NXJzaUxDS1JtTjFqVk16?=
 =?utf-8?B?YkpiclhEUUszT2ZwWnZrMDR5R0lyeXFxRHlYeEZ3dG45NTYxUFlyR0xtUG9l?=
 =?utf-8?B?Wkd3UTFFVlFNMW81WnljcTNqcEd1ZGFzekllZDBjSmRRRURxOXAxamZtYnVZ?=
 =?utf-8?B?bFZXZUFRT1JFMWUvNDhwdUhTUHEzK1ZIaVl0ZDRZUnpSd2FXR1N1VEdBL1Zv?=
 =?utf-8?B?SHhlTHdlNVpMQUlJUFhhb2dhbFhXWC9WUDZ3d0x3aWxGM0Y4OVVjQjJoYkhV?=
 =?utf-8?B?bWNZQUpzK2kvc3JiY2pSVlV2dU94MFl6MmQ5akxmcGFpNkdTdFl5TWFUNTRr?=
 =?utf-8?B?M0Q4TENVTlNzTGdmdmg0NjRmMmh0N3orMlBqZHZnaWplV21VUUJ3ZDRiZzZ5?=
 =?utf-8?B?VjMzNzcwSmZDUTdrcERGc0FjeTdBL2hxVmZhUHMxOHhDWEtVWmJvUy9GVHZU?=
 =?utf-8?B?NFh1blBmaXV0Qkt2TGdMYWFpRGRYeDYvb3I0Y1Brd3ZoejJTd2pFWFlrRWFl?=
 =?utf-8?B?ZFJtUmtwT2J5eXRFWmlnT2FSYWNZRDhCWkVLY1JrMHZ3bCtRTmx4dzRnL0hK?=
 =?utf-8?B?OGVZSlJIS3BGNnZJVnJpb1BTZTcydkRZSkR0Z1VZVW91QkljV2JENU5yTkNz?=
 =?utf-8?B?cWFwTjhxRmhZR2NnWXlpUEswYUd6L1hkb05OQi90bFYwM0NYa1NVZldldWVq?=
 =?utf-8?B?TFZKZ1ZWazdIQ0ZFMktpTjgvYVkzMXlHQmxOSFQ3cEFQbi9MekIveXhOVzBH?=
 =?utf-8?B?OVcrMWlmbURVT1EvVkhHd01jUTAvWThkcUZDaDc3aU9zSkZIeGtXOTZkZElN?=
 =?utf-8?B?Y2JsbU96Tjg3TlQ2SGsva0tUbXBlNkQ1cmVUY2JNRXRqamU3LzdiOUJGcDQy?=
 =?utf-8?B?ekpCRHlPaCtiYk0vek1IbGJqT1MxOXpKdjJNZmJqb1BuWWFWcU1xb3h6Mzhp?=
 =?utf-8?B?enZsNkcwS0ZPZmdoc1B1Q2hScmh1cjNHMUNYckhUbCtVK2xReFdoczRoWXRG?=
 =?utf-8?B?MzVGMld5ZFdlQUI0Tm5hR2FxQ3VYSFFLV20zaWR3M2dGR2pmeHFsMFl1Vjlz?=
 =?utf-8?B?L0l4S1ExZFN5TTcvRW5SU2V2Q2E3V21VVmptMVVDekQvcnVSdFN4cm54REFk?=
 =?utf-8?B?S2RsdXI4Ynp2K1FxMmNHbXdlWFJrVkNHY2JLVWVDSXJJYWRmMW92VzRUakZL?=
 =?utf-8?B?aE9xdmFOekdUdEpUM3pHMExwREN2d3RFTDdZOHJUbmZBTXorYmI3WHJDYUhY?=
 =?utf-8?B?c2VIUkozYkFjMSs4M3J5V3Zub0JMNWRQdHJUcHkreWtHKzNJdkplMjhDVW9r?=
 =?utf-8?B?WnFEdWM4emZoMGJsZlZ1K3JvaTMvbmZwNzJheDQ3dG9OaC9CaWhNRHU1K3Qz?=
 =?utf-8?B?S0NRZkFwazI4RDdxaFVyMG1QK3BzazVFUE55UERxNHdHWHdpalZDSHZKSDdh?=
 =?utf-8?B?VmJHaWcyZFdmQ1lXSTlRVnovRHovRWoxMTVMSzlocnBjTy9hZmVjN0Z6ajRo?=
 =?utf-8?B?bExZMk54U0hFQlBHcXoxYkw4MCsrU2JRQW9YREp2NGUxbEpwMDNEOTJWTnZo?=
 =?utf-8?B?bUpEbGQ3TXRNNjZzRkozMXg4bStMSDAvL2JkaUdvK2pSNW5YZFBsRkNyYUxh?=
 =?utf-8?B?VjgvU0h2NGtsVWthSDl6NWcxbitwb1laY0JFeG1neWhVVlVnWGZ6NGZYaURC?=
 =?utf-8?B?L2ZHQytUcDZRTVc0TVFhMzFBWEx1TFV6YWlSS09sMjlBOGYrNnRqZE5XM1k2?=
 =?utf-8?Q?U2YogX7R2iGYHxoiQy27vis//XO9sjEU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmU2SG85KzRWdTkzanpFUjRaSmlKcHMzWGxEZ29uVUVDekdnaWU2cWZoV29i?=
 =?utf-8?B?c3RBK3VQTEN2ajFXN2RocVNyUlVtNTdPK3F1dlpYejNESFQ2QlpkcUFUd1d3?=
 =?utf-8?B?OGVXWUpHWmpxV2IxSnM1OSsrdHR6UzU1eEVHM0xpV21mQ0FPVmU1RDd0Mno5?=
 =?utf-8?B?ZXJUSGJvTGhRTTZwRXIzNkVjbHlaaTV2YmJDaDhOazl4bTJqcFZIeXRQRXUz?=
 =?utf-8?B?ckFnaFRFMUlRNlVPUlBpVGgvUEV2WDlZRVo1bkFySFh2TUYxZzBQWmJwbnhS?=
 =?utf-8?B?bU1HMzE5SjBnM0thUE1tN2ZmaG95RStpa3dzUVJIRTQ3MmJ2NEh6d0l6N2ZY?=
 =?utf-8?B?OE5EU0h4T3hHWkpLV1RRSnpPZldrYVdYUWxFVXRxMEJjNnNrTzBhTVBPYmwx?=
 =?utf-8?B?ZlA3cEF1RjJTbFlMZ0tQc0FaNDMrWlJpeUptWGltMVNUclBEeW0rY2s1UUhK?=
 =?utf-8?B?V3JPR1NJWU96NXo4R1lmR0VqUmxZMmNsaWNDNW4zUngwREpwR0FHN0diYmdo?=
 =?utf-8?B?MUZBR3IyZnB6bHU0TVBKOGlESTdxU3hxaUs4VFZmcmVScVFhNXFpQURBODJa?=
 =?utf-8?B?ZWM5Tk9Ld2hJTzdncTVWaVdQUWJXZHk5MjJrQ2NhekZxV1E2czdOSHJFWWFn?=
 =?utf-8?B?WnNCUUUrOWxRaXFBSThlY1FKbzYzZ3VmTzZQM25XM2s0eTJPYVdqeUdyalJw?=
 =?utf-8?B?aVJzUHI3bFVMU2txL01iN0NJa29oT0hmcDk5SFJiOG5zZGxwaXUvYndFTDB1?=
 =?utf-8?B?UE5tWkJrZGRFYW1wa1RQOXY3aWQvRVFwbG9ObTNLT1cxL0pwMEhhVzc5aHdB?=
 =?utf-8?B?UHlNOHUyanZMZ08xV0w2aC9CVS9GNkJZOGVINHpzWWRWaHVSL2FzK3FYRkdQ?=
 =?utf-8?B?YjB2T0pJalVPdFVmSUdKbEIxYUNjRHo5bTFGN25EZ2xGTHljbWQzdUx4VzNJ?=
 =?utf-8?B?RjBDbW8xeUxTY1FLQnVpODlZdUw1TWZrZ2dLcHRCUnJrczNyOEpIS3A2V29r?=
 =?utf-8?B?cVVJaWZ6NklZTlZPc1B1WkRMRmlzQXh6aitVL210UUsxSEFEYXpBejhTaFMy?=
 =?utf-8?B?UEVxeTFNaXdDcGZDME9QemJEN3IzV2YwTk1xcGpoeS84VngwL0JBNm8wS0VX?=
 =?utf-8?B?aTRYeW43L0ovblRCVXJRV3RkOGNVSFZJWGVjazJ2L1VubmcweDY1dXRMVWlw?=
 =?utf-8?B?TVVXeFFTWG1USkVpTkFwWVR1dEhzL3dRKys0em53bmxBWEtDb2RKbFVYek1H?=
 =?utf-8?B?QnUvYUl4b3hwTStPMFo4cjdQZ0wrNVYvOWttSXBYaFdwS2JiM04yeVd4aUxY?=
 =?utf-8?B?Um40YTBObEx6SzRnc3dBNlpQZEczVndVbnc3d0tYck1aSzRoVkh6QmVQRWVR?=
 =?utf-8?B?bWRaeGZXR1ZBWXBQQnpta1ExS0VieE5MajRYSU5URFplcGNVN1d3T3ZBY3Ir?=
 =?utf-8?B?RU5MUmM2bHJFSU9rQk1LYkc1Q29JUXB0bldyK0kwMklSZTljUDA3d3JkVjkz?=
 =?utf-8?B?c1NLMTlQQTVPeUp0RGNPMFNnTXl4QlVISnh0VDN2NkhIajllTm91N2EvU3hp?=
 =?utf-8?B?ZFAxOFRONTRNTlpSQ3ZtTTlLVzNuMlpTVExheWdRZkR6Z1FDWituTGZMaHBl?=
 =?utf-8?B?MzRYUkRTOHdMdE1kaG5lci9lS3h3OXRjdnV2VXJ3VTgvVHZrbzRJMGhuRWkx?=
 =?utf-8?B?R05xSi92bHJEaTV4aVBtOVZDUTJrNGF6N0NOTldONnArVFNkZGJjZFkzZUVm?=
 =?utf-8?B?Ry9QaGJXYjdtd2s4eG1nblhWdWQyaGo3RjE0WDAzTkRiTzBwYVhNK0pNM28w?=
 =?utf-8?B?MXRHcDlsT1NwZG1IQzJxdTJFeThZaHBja0ZHRXdndHgzOWd5UTlFc0hiR2RF?=
 =?utf-8?B?UjgxeXNVNHlmVUlxL1Z3c1hLaWZrU210dVFmMExkYnAyOFRtKzJSdkN5QjFS?=
 =?utf-8?B?dkVITXlrQm9WT2pGdDJTaXRrN2hSS0oxazVmbkpRTlliWm5scE5kK21ScnZT?=
 =?utf-8?B?aFJ2L2FzdGxLdndtZHVRdkhPS3A5SHdMUU91cDFMVXh5VFUzSUVsYlZIZU9X?=
 =?utf-8?B?RThsdXV0d2Z3aDhNaWxsOVZ1TTVlMCtiWjNhUzhwdGZvSUlEbEJkakUxOU4y?=
 =?utf-8?B?eDV4aXBkemdVRzJuL01xajhIaVZlRExDaStFc1Rkb2FvQ0NlUTVPUFFoZUR5?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4023019c-695a-4452-1681-08de10e869bb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 21:25:52.8823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qeq0SjEhdlL4qhjvlKHb6kleBJPMElQ4NeXs//UPFa1bw8hbofCGWWkTIQT4R9IigXLYfNewOVT83RtFOpSdPHoEFuCdO1GLw9ZyHCT5GR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8657
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



On 10/21/2025 11:13 PM, Dong, Zhanjun wrote:
> 
> 
> On 2025-10-21 1:49 p.m., Michal Wajdeczko wrote:
>>
>>
>> On 10/9/2025 11:57 PM, Zhanjun Dong wrote:
...

>>> +#define GUC_LOG_SIZE ((SZ_4K) + \
>>> +              (XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE) + \
>>> +              (XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE) + \
>>> +              (XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE))
>>
>> too many ( ), only one set is needed to wrap all additions
> 
> will change it to
> +#define GUC_LOG_SIZE (SZ_4K) + \
> +              (XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE) + \
> +              (XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE) + \
> +              (XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE)
> 
> I follow the rule that add () to all macros referenced as operand within an expression.
> This way if the operand macro was change in the future, the logic in this macro, like operator precedence will not be effected.
> 

but it is the responsibility of each macro definition to provide consistent outcome

while it is possible, it would be an huge mistake to define something like this:

	#define SZ_1K	1023 + 1

as that would break not just your code, but 1000's other places

so IMO GUC_LOG_SIZE should be defined as:

	#define GUC_LOG_SIZE (SZ_4K + \
		XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE + \
		XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE + \
		XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE)

and just make sure that all other XE_GUC_LOG_xxx macros follows the same BKM


