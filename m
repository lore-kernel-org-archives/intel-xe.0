Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAADFC88CB9
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 10:44:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A0110E438;
	Mon, 11 Aug 2025 10:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WJo3dDvU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BC510E436
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 10:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754909056; x=1786445056;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=pA4Va78dBeafybwL7Si9ZXHeoBy4bZ0pnEzfeDP9nno=;
 b=WJo3dDvUn3HOci6AZh8iZRpQYkyoRuU7//xQJtbm69XLb0BWx/L0FbRe
 Gwdabxpup+sv8hG0gcTnfqzMb9kId5TbBRX97KLoCffVDcUWd9Yr+/CJV
 Qty4uceg3dGYyWgzLlNO5RQT2ZMSdpntZQtCNEYLIj/bv79/5mlu61cuo
 ZJxoiaPyoogjuo3TJO62rs+B0er9kiP5sP/xWoOKbogrVZD7NWwSlcTO6
 1zBOKelAPp0JB8Vx9ue8MCY3OUUG3DfNsmYYB5FF0jCggWb7PfMgOxdd1
 iKPWog/btwcIP5KzybUHAgpia0C2XeBFHlgggE2temQKjEkg5wwvqYqM3 A==;
X-CSE-ConnectionGUID: 4G3S0ca9TFWzeDUeluiLUw==
X-CSE-MsgGUID: T0C2uZ1XSjWFaClj5ke3tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67865626"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="67865626"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 03:44:10 -0700
X-CSE-ConnectionGUID: oc36fhBpSJGd1CNjjWl2Ow==
X-CSE-MsgGUID: ZZsR2zhYQXec7jpgwUlPlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="196878660"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 03:44:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 03:44:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 03:44:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 03:44:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZrBxSAc6naJLU6DYCxRpYJU6lMiAJLA15RxS3Nhx/m6hlTLnGRwA1vFMWUfjUhFECVghp00xHesl4pPikC/aVE63fZXI2wOq6xPl9fykJsbKuh9VaXrCrxMEjCg2UtplLN7Yz8xLMiZoggWRKOApGe+AjxjK7c5lCSn7PaoAiaZLd4suXEL2sFr1Sw1qUKOaizeu1a4QfFkgWbbYCc+jtmrnGV2bHASZ4jXBRLTIwPYaCUUY/8HotkteOyp27IFpPeilIc532r5kQKpuwvHXfK6rPA+583ySoJQikzyf6kNQ8ZY+Fwz8R2eAwEQcXOu4JZlr7oi6w8luIqvYouNmTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARcF77OpcEquLQNsmzob5ZECMbM9X2Ma4FjGSK+dEYw=;
 b=RUS+2JQKaNBP3O2vKWTn0qoxXyzAEvFJcTac7x4Glfbs3fzxr9mxbexf2Ixgt/qR1M1rdwFpwAAtFUlLYTvjsT8QCsy3P82wcPFSXbDeGvhNzkLAfdel/jQZhrldlTxnRwNvLYybTXw0KNQUH1Xu9F20++VguRSws8FfLpDzJgw+tsSS62AhIF4u9WYWZM8QTh6iVKtXGpAdLMPjqAeb16D7Wh5wQcQxT/5JATN9DJMZ0KcA+NgdrYN2sRTCWQn89uWda4d86D/zNnS4Kr6XhKQ+3vjhkii7nr1HYalwurjPNp4JUW9UuJDUrcIxaV357uhuPN2t4UHJEH6VBFCcOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS4PPF2AD6B04BA.namprd11.prod.outlook.com (2603:10b6:f:fc02::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Mon, 11 Aug
 2025 10:44:06 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 10:44:06 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v3 0/2] drm/xe: Consolidate VM initialization logic
Date: Mon, 11 Aug 2025 12:43:56 +0200
Message-ID: <20250811104358.2064150-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0314.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::21) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS4PPF2AD6B04BA:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eff090d-6858-400e-cbc9-08ddd8c3fee9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGZyeE8wYUNGVmRiL1BpNWJicVpBWWNRRmVCUE8yeWU3RFExUlg3MzZPblF3?=
 =?utf-8?B?cFppTnFJTVEra1J6VTVyUG1pWEZQTHNWMVlnZWV2aW1UOWxpLzBzSjhCelJn?=
 =?utf-8?B?TWZsWXdTMmN3OFphMTkvVEtmWkVhelU5bGFmT0VpTy9rY2Y4a3NHNlcyckJm?=
 =?utf-8?B?REVmV0xEb0JPZExUSVBCOGJEMUt4NXp2YjFDOTNKOXhGNmFxZW9halBxc28y?=
 =?utf-8?B?dlBYY2h3RURkR0wrOXhsanQyMHJ1MWQ5VTJrV0drc0ZpdGFYNUdFM3Y0UHhQ?=
 =?utf-8?B?QWc4Nkt4RDRlMm1mNkw1VzNEZVZxTmNBRmZDamRHcVBrUHZsWGE2RkRicWlm?=
 =?utf-8?B?MmlMR1NSem12ejdSMlc0TUt1VS9vOEhaRi9SRVVXc2t4K3RCYjR0WEtpbVRL?=
 =?utf-8?B?Z3lnaFJTQ094Z3E0b3NXQmk5NVBSblVZZkVNRTgwbnBqYzYvb0tmampCRUJN?=
 =?utf-8?B?NldVSmZYSTlZL3JPWlN2VWU5M0paZmZsYnJ5K2dEZ3hjVDI5MFBOT0c1ZUE1?=
 =?utf-8?B?S2IwYldvNVdmME1SL2dxZ0R5czJOYjgweU1rUUo0Y1hkWHUrcmExRUNqVCtK?=
 =?utf-8?B?cXBJZlpJK0xvTmsvUkN4T3ExMFVNK2NocnRUaTFRd3NWY1BWTWtTalI2V3Rh?=
 =?utf-8?B?RkVGWjFEWEd4VTF0SU5FSEdhYjdBL0w0Z0pSTWx3WTRrL0wzNTg5ZlBCOWk0?=
 =?utf-8?B?YytGNHB0ZHZmQ2wvT0NRaHRueno5UzVldUs0ZHFPUW1vWWlNVHJrMENyOEQ2?=
 =?utf-8?B?ZmJHN1B1SG5PQ1d4czFXaGtBamF3R2FyMjZOeW1BUmxZQmsyY0pFc3owTDhz?=
 =?utf-8?B?NHQrQ0c5WU1JVDBnRWJiNi9sc1gxNFpKeHdybGw5dGFVb0lIcExxS2hhSldF?=
 =?utf-8?B?dmFIWDVmUzhGdWhPWElyblhramRkMFVCV040c2NtK1ZvaG5ONnMvWStDcVNJ?=
 =?utf-8?B?VTl4TTIrZUNkYUp3MWp1cVJOck9kSndPYjhwV045dEkxeDFkKytyay9hb2dx?=
 =?utf-8?B?b3pBR0hnOU51YWZUVXVpT0x2amxzRlhRZ2JPclZobWNiTnRDQk5rR2dneW1r?=
 =?utf-8?B?RnB1aVdtYXlPUWZDNHBSSUoxWWlJWFBIQ2N5bGd6bWZFdC94cUFGTDJnOGpO?=
 =?utf-8?B?eXErejQrbEJ4VCtoWmlOYVpETGFZOVUva1FFUWdMMGtyYWNMa1VOQnN0QTM3?=
 =?utf-8?B?eExUeUd5ZENaa25GS0lpR28ydlRYNEFIYWFlMUU2ZW1QU1BHckVVY2hWUXlK?=
 =?utf-8?B?V3pUSzUyK3dqM1pQK0ZldnFhQTlnaWllMWRUNlV6UzlWeitmcy9kRWsrYUpZ?=
 =?utf-8?B?U1NjaDFGNldlcEdBYjh2emloY3RNa2dQamNGOVJOZDQyV2IrQUxoWmNWNTlm?=
 =?utf-8?B?Nk1xUW9xVzUyR3p0cUI1NnllT2ZRdERaTGdUZDY4eWtGZExnRHQyM3pFQmNU?=
 =?utf-8?B?cjg0N3dXMUlwSW9xSGkzbHVKM2pSWCtDY2o5QXNoUGdxT0k2RGhpZ2V3d3FV?=
 =?utf-8?B?QisvRU5vcVRYSVRhWlZPcENrc2xFZ3hyS2dMdkNlV0puRUxib0lxMjh1YmhH?=
 =?utf-8?B?dHBBV0JHaXg1QWh6M3dpbm1rU0t1VWNpQTZkS1NkSi9NdXFZUXprdW9kNGxl?=
 =?utf-8?B?WVl0U1JKckk2WkIyNk11N1RmK3M3MzM4blRvWFZFeEpYQmswRzVJdDFnVzdp?=
 =?utf-8?B?ZmIzSGRTdTh0MVBzdFp2Q3JwNytQdVlKSzhXZmdhUUd6OHNIRm40anhDeHYz?=
 =?utf-8?B?VVlCTitFY3VtdnZUem81RHhLUnRVSDN4M3FJZWtaWG9JcEdSTzV0TVlWZW5K?=
 =?utf-8?B?SjhxRmRhS2ttakEyWmR2OU9Mdk45UXZRbDJ3eU9mRzk3UUVHYkVNREpjVlM2?=
 =?utf-8?B?bVZ1MW9ZNlYrYWRDV0hzT3kva1UrbEFCSlhsTzRXeldTZDhOUlB3OXRWcVIy?=
 =?utf-8?Q?5LemYU+o7lA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWtheXhNTlBheDRhNlhhdXpEOGNkbCtwbUNKMTVacDlEQzZnTUFJOWQ5Yloz?=
 =?utf-8?B?M2UvRjZoWUNuUWJEa21NS0oxeDZNYmdMaWtxK0FjeExlZkpjSU1KUmx1NFln?=
 =?utf-8?B?TlNwclZxZDNvblkzcGQvcUp2RE1CYm96Z1Y5S25mbVVxdG9LMmk2WG1DTEI3?=
 =?utf-8?B?T28rQ2hrZVI2UGVMK01lS3JSNXByQUxnTDMxaFVjRytrMS9JZWhXakZIdTY0?=
 =?utf-8?B?WjVXbHQ1R3pNdDQ3T0lRZkFhbSt3WXdzY3hnVnRUZVRyY0F2WTEvNS8xV3hl?=
 =?utf-8?B?ZUdvRUR3RDQ4cUhjMXIvMXA3ajA2VXJqa0tHRXVaMkMxd3pHSzlaYmNlaHky?=
 =?utf-8?B?cUlxUEhONmhuL1B6MmlvV3JhQmxNdmpvSVFReWFJU1pxcnN2d3A3bmYyb1Yv?=
 =?utf-8?B?SXZFTVd3ZHlKL0ptUjNjRlpJVTY1Z3drbm9zR3VyU200Z3dadVBQVGp1cm5E?=
 =?utf-8?B?VlRoNC9PWVVhRG9ncE9iNkZaaWJWTHlUU2k3S0g1WjkyNlRiWW9OaHAwaTlX?=
 =?utf-8?B?THVlMmdNT2VJSHVxOXN0ZHorNkF5dXIwMWJKSUJPRnhVb1NhQllGaXRpUnRy?=
 =?utf-8?B?cmFhREZ4T3dzZUZ4L3JrUHd1Q3V4U0hYdXM5eHVxQVlteWViSFUyaCt3UzRv?=
 =?utf-8?B?bUNpbUEzeHBhZlc5eERYNVkwV3E1VG01TnA3U0pKTjJ6TzE4U0lWS2JDNzND?=
 =?utf-8?B?cEJMaEtTMTltbytjaWc1QWVDOFMxYUR0WEdNNG1oeDNUV3FRblMvRk9KanM4?=
 =?utf-8?B?K2J4REZubDlTSGJGeCtPVENpakxHUTdKRmJCMEJFWEFFUW9JRU9Nc3pRTkcy?=
 =?utf-8?B?UGhkckprUjB1SFlsTHYxU3dsYlJ0LzIyNi9qYmJSdTY0SE5qVXNwY3ZOcTl6?=
 =?utf-8?B?b3M1Nm5JaWd1VzVtaENHMXgvUCtmVGxNODlMNFprWUpPUHZvOXVvOFVzalpN?=
 =?utf-8?B?Tkthamlyc1p2R2VzK3QySElERVNFRVRFZXgvZk5La3FjTFUwdDc1K0Zxb1FX?=
 =?utf-8?B?NnhJVHppYjlLc0dUNE9pRXNrNEFqRUF0OTlISjZSRUtjd0VqL3QxbGVsbjBX?=
 =?utf-8?B?L2w2MTA1QmJpYXdCMGZmSHhOdlpLcmVLOTNWNjNDYUdzaFFKRmJrMWVUOS8y?=
 =?utf-8?B?Q0I3Z3pZTUFMV1VnaitURVc0c0gxMXh2RlpXVGFvNVJtcDBvVWFwaU83S1pv?=
 =?utf-8?B?MTRZTFBtcFJZdHlsb3h6Mjc5M05oVVFtcmwyMHU5aVV5Z2xNNVUrQitWUGVB?=
 =?utf-8?B?WWpvRHFEOWkzWXZYMVp3WDhFSndBRk5pbXhKaVBhNDBXQ0xVUjE5SEhSOWk4?=
 =?utf-8?B?WklDaXFKQytBTDZ5cjMzZTNNNVBjcnlrMktvMnFuNnhhUEhmT0pNcjlGY0JR?=
 =?utf-8?B?b2Vwbm1JZ2VWSXIvQ0QySVNKbGRWMnA2eFZlSFJmYVV4ci85MXRLb0xZL3RO?=
 =?utf-8?B?bEFhNWtYaTdqeEZBTFRVSmhoYUJvV1FVSVJzTlJqNWlkUW5nN3pWcnRHV2U1?=
 =?utf-8?B?QUtSUmhMK3hwa2RLcFFxczZkM25mUnFSV0dWcURQcEV0K3U4aHovYkpVTEhR?=
 =?utf-8?B?cGFwVHY4b0EwRkpnelZWUTh6TkNJaDJjZFRrZ1Y2THRlb3BURmxuVlFzYWFV?=
 =?utf-8?B?QnlqNzVBMlZXRThpT1ViT2lvNkMxaTZMaEx2QkMydjkzNkJYd01DbmNvN21M?=
 =?utf-8?B?U3QxVFlESHBPWThnVlFpRmtmeGJTZ1N0RFZ5TmlaWXJpZUI1Zjg3YmE2cDR2?=
 =?utf-8?B?N0JzYW5vdHU2T3JJdHpFMmJWb0l3cVZpZjdHUlFOdlZlVk5zakF2Vm54N1Jr?=
 =?utf-8?B?T0oxaEZpdjNwQkhJWGJrZThKd1F0cjFOdGV1cUxQZGhJWTArcTQvRnBXNTdt?=
 =?utf-8?B?MHNpM0dpRElXKzZ4YVk5VGJWQjFOZHN4UnliK1dTWnc4MWZMS3RPZlpDSWZT?=
 =?utf-8?B?eVNTN2U0VHRYUkZVa084NWZiY2RraC9LU0RwRk4xcFI0dTY0dm9LUXplaWFY?=
 =?utf-8?B?Q3JFVE0wMXhjVTBNK3ZhNVNVRWFwdnc0UmpwbzNpazhLU3NVenVoOEwwb0Qw?=
 =?utf-8?B?b1ZyNi9KRFNLSWVVRHpnQkNTUTU3L2MrSUZad2JYTEJFVStqSGtaVjZFdVpj?=
 =?utf-8?B?azRCRkI3MnUzTytsVmk0WHFSRDlwTGNYSmFFbkRRN1o5SEZDR1FEWVU2dlA3?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eff090d-6858-400e-cbc9-08ddd8c3fee9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 10:44:06.4979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FozC5M4YF4S9skB5UbLLtWiTPgS+TdsY1LDuLD9m+UV19H2EfQsSCIoeAKCR37ttyNjRNa2V0JkbFoSULk2Aupob8/9GQDxJGAv5kqEzgM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2AD6B04BA
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

This series refactors VM creation to consolidate initialization logic
into xe_vm_create, ensuring consistency across all VM creation paths.

This also fixes a bug introduced in
"drm/xe: add XE_BO_FLAG_PINNED_LATE_RESTORE"
which incorrectly assumed that vm->xef is initialized before PTs are
created.

v1 -> v2:
 - take reference to the xe file object only when xef is not NULL
 - release the reference to the xe file object on the error path (Matthew)
 - move usm.asid and the pt tracking to xe_create_vm - new patch (Matthew)
 - add this cover letter
v2 -> v3:
 - removed unnecessary duplicate BO tracking code (it is alredy done in xe_pt_create)
 - using the local variable xef to verify whether the VM is being created
   by userspace

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>

Piotr Piórkowski (2):
  drm/xe: Assign ioctl xe file handler to vm in xe_vm_create
  drm/xe: Move ASID allocation and user PT BO tracking into xe_vm_create

 drivers/gpu/drm/xe/xe_migrate.c    |  2 +-
 drivers/gpu/drm/xe/xe_pxp_submit.c |  2 +-
 drivers/gpu/drm/xe/xe_vm.c         | 45 ++++++++++++++----------------
 drivers/gpu/drm/xe/xe_vm.h         |  2 +-
 4 files changed, 24 insertions(+), 27 deletions(-)

-- 
2.34.1

