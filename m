Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBFBCCF9F8
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 11:16:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BEBA10E1C0;
	Mon,  3 Nov 2025 11:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hmM5TJfK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E3B10E1C0
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 11:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762168572; x=1793704572;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e4Kht6WFA7FZ0J5TbFtfRzf/5d3GULnRxlHcQl3dgeE=;
 b=hmM5TJfKWHKwK1FAuOuD6guIJNN0MWFUnFyLPSXt78UHDD59BIMjymOR
 6dfhwymdNBHZEjFf4BzoZYpjuU2LeTiAQh19WjLdHuY1iGZ+UXUJgi+du
 YkiCVzPKlP33+6OoX8SdwBwxgdfnBdko2Bk6c/31lOp5ccu6EresVrxD1
 0LRSmVS1NmSsg42N2yjDkX51xpEqESY+qToTWWW6oYdUm4uDonq/kDjEz
 NeqlPBT9JgcMR7VaA0ZTIs6LmJMR9rAVwxXOv/79gypRSsraYurvmzl8J
 JHbSlQj9Xvr0VcrlmxEPr+sOYiFL7gH5ltG2tNAU98siGLH8VHYXrcvaG Q==;
X-CSE-ConnectionGUID: xXb6+Bd2RliwLG/Qs4QORQ==
X-CSE-MsgGUID: YHTdl5aVTzaVbX2yF1R7UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="81869183"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="81869183"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 03:16:12 -0800
X-CSE-ConnectionGUID: wz31U+3VR3y/qzdM4xNDeg==
X-CSE-MsgGUID: uNzKW5EtRA+ldmj706xYlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="187299104"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 03:16:11 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 03:16:11 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 03:16:11 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 03:16:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ernXRzWHsEN2h3eOJHa/DA2IrWc8l/5NKkPZxobmXTxkVc6L3P0gOPtUXlwgAq/CjDkUr2gMdYOAAF++UYe2KRPLVBh6hE+rPF2d7ZDIaa4sXcjLzsffO6Caiuv1wOd32rct1yGAs1LprY2LVQl/xCWKbN/co9B4ldbhjkYQ7XA1vw0QSPVXhEH/P7CkgK/nKffTy5h48y3L4L/NvpUnO8kAmLKSMpe6HKDEJNTjfNL/jAr8SwYckbpaBq7MyXgXdrO6mfgJnOaSKh9OC3G0lF9vGJy5aXHlkUPxlpMqf7KxgpqKm6R5O9r3wf982xiuq1FXIZ/hAjaCgh50WaETbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZ29TF92Qr+hsUOZmwfxIfd1csi/PvW9m9OY7fYcCWM=;
 b=WtDLUeqXpX88oqwrZlzZ3vj7dHutpFky9N90lrvav7VW/mezsbM41gIsUL8rPtxilRw/6QUEjOuLUo3bSrNWAIYHvnBhQ7Ng81KkQhHlJYtNhClYUCxN5IyE2tGpyHYFt3LFFH9/LTu50wC1COwnJ1hjN5i0EFW/oNUtIYpwC+cVwugHV3I2fsupMhMhYxdU8veDDMe+btaT8tc2cHIt2DduXNNSNihOvZd8H3iDFcltcCkee/g1KKVXdjKNZC8qdk/rCWmptehKxpiMcM1O5YpOyr3GclprIZZ9iQhsznQgFbPePzTIOMnQ+kTCs5Pz2Ly5w9fyBRoIVmTVI/rIWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16)
 by PH7PR11MB6675.namprd11.prod.outlook.com (2603:10b6:510:1ad::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 11:16:08 +0000
Received: from LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::dc22:ef1e:53e2:f00f]) by LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::dc22:ef1e:53e2:f00f%7]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 11:16:08 +0000
Message-ID: <41719271-c1d3-4218-b882-c84c002eb693@intel.com>
Date: Mon, 3 Nov 2025 12:16:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/vf: Fix up GGTT on S4 resume under SR-IOV
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Winiarski <michal.winiarski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251023064610.4499-2-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251023064610.4499-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0184.eurprd09.prod.outlook.com
 (2603:10a6:800:120::38) To LV2PR11MB6024.namprd11.prod.outlook.com
 (2603:10b6:408:17a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB6024:EE_|PH7PR11MB6675:EE_
X-MS-Office365-Filtering-Correlation-Id: 498b1980-9607-4511-db0a-08de1aca6344
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHdkM2YvVFN6TVM1VVVYZllMSDE2THBmZFR6WHBBQW85bjRXN0RmU2pSb0FW?=
 =?utf-8?B?T3cvNXlBMTNBbWpybVErbURzU2xISXY3NVBrZnhGOE9WMW9tWkV3S05xZFpU?=
 =?utf-8?B?K0ViZzllT1BzMEh4QWhSWlpvWnZwMHFMSHQ0eFdjcnJxOXBFSlQyditWYjBZ?=
 =?utf-8?B?VDJjNlBJR29uVm9Db3VnQjc4VG1VY3FicjhwaDhqc1V6b1ZXWUZURzZOcDg3?=
 =?utf-8?B?L1VudnBDVllZSWdMT2o0VzNJSStEeUhsSzZmZWJiak9tY09YMFVRbGFNVXJy?=
 =?utf-8?B?L2l3Q0Q4SSsxQ3NIRFJNMkZBWnBnYkFUUnlxVUgzS1RSd2EyUUswSUxWSGNR?=
 =?utf-8?B?RXBzYTJqZHUrbG9ubzlaalZpUGpMb1Q2blJ6TS9qUDBLQWZlYndTRGdhMS85?=
 =?utf-8?B?Y1ZMenhSTWN2SXN6Q1F4NHVXcmpSbEhsUFUyRWFTRXE0aTVhSnREcmlJRElR?=
 =?utf-8?B?ZWJFZFhmemRuVElUN3RTekY1MmlpcG01Um9JcHJlazlYNGw4T0poNEJQWHoy?=
 =?utf-8?B?anpuZmlMYkFaWWpQeEpNU1FYekwwaGNpVWdFMi8xQkpmdTFlRS9iZWpndzQ3?=
 =?utf-8?B?NlpSRHI5TWVnZCt2K09tWlBTNUM3eGRqZ2IraUZHNGxXbUI1MW5KY3hZbUZm?=
 =?utf-8?B?RTFZM2tVK3hpbDlhR3VsdVdHYW1qeU9nTCtZN3NHbGo5aTlkRzNnS0pLTnMr?=
 =?utf-8?B?OW1OL3NObDIxaHBpSVlnSCtpblFkUFpleXBacEdCUitlYmJGbDV3cXRxZWxH?=
 =?utf-8?B?SkFYcE5lMkFqbHloM0hEWStNQzJvSURwWVRDVnJlQjY1WFZEMVd1c2hCWFhL?=
 =?utf-8?B?NHFlall4d2tLVy9LUnlWUHI5Wk04QS9HVml1VmxSRUV0cDEraXJqTGZEdFpj?=
 =?utf-8?B?OXVhVW5WaGpFV0p6Ym9VL09id01CUXRXZVFHVTBBejhFZjZpZC9HQUhiYitw?=
 =?utf-8?B?MUQxQWtmc2Z2U2JIY1JEVnRIb3Q3TDQxY2NENVBRWTRESldLSHFPN2sxNHF5?=
 =?utf-8?B?dHBBZkJRNnhtSmhEK2VhVUowellURnd2OWJRL3FZcjR4dVdXWjJiUUtmN1RI?=
 =?utf-8?B?VVJhR1hITzlrRFIzWHc2aWl2RWlDYnBBTzhrZDNnVlo0b09qcVB6WEJNeHdK?=
 =?utf-8?B?M0dmQmVSTWZzYTkwcm9GcGIrYy9JaWlOVS9PUENhd1hVRGZRdkhEK1gzUnkv?=
 =?utf-8?B?KzJRRlNjbVJCbG5MRThhSTgxd3hmZXIweFFuNHoySUl1VHBZb0VoMFd5c0xP?=
 =?utf-8?B?alk4aU5UbEpuV0R2TGg2UjZPekRWR0MwVGR4UHNiNVcrN0F4K0o0MnR4OE1s?=
 =?utf-8?B?dEoyU0t4WXNVRCt4NTZ3R3BGKzZNanZHd2tOTjExUTlsWkxNb0pRV1BmZGc0?=
 =?utf-8?B?MWNmbnY5QUo1amFESWY3cnl1SnRpRDdWREIzY0QyMGdsd0tZQ2d0eUsrUytW?=
 =?utf-8?B?bzVxR2I4aHBWK3BLUm5MUnZ3Smp2RHlrUVhPZ29NKzJvalphcGw0SE5qRjNQ?=
 =?utf-8?B?VTJ2bGNMUTJ4UDNKOHdTTDFaZDI2WFhEUFFQb3dqOWwvQnNDYURXSEpUUElB?=
 =?utf-8?B?Um1SQXF5M01Wem1qTDhURXJhKy83RVNKNEIwVHA3cy8wd0d0blFvY0lOMGhJ?=
 =?utf-8?B?VTdWbXhBM2VmYnpnaExPUGhjU0pjaFJkVEdHMUN2aWg5TkVzWkI0Z0lEaEZS?=
 =?utf-8?B?MThWUjJmMFNqbHlUZHpKQ3ZYTTRkbVNlclF2bytYMDdDcnpzVTJSaTZsK2Jz?=
 =?utf-8?B?aE1zdjdGamVLeG9sOXBSREtrR3hjSXF1S2twcjRiQWkydG1mVDRwU3lZbFJl?=
 =?utf-8?B?UE1FVGYwOFlZTTNMZ3loTjhnckxka1RuWjhjZ2NJeENGOURlYUJtcnp2WHRr?=
 =?utf-8?B?MUg0OVd4ZHZGNDIrSXowMmtCMDNPQllReWVlUGhRaWR0d0JEeFZvWnFWM2Fi?=
 =?utf-8?Q?CE7e/EzsumOwwuy4oLKuJ8YO0uCh9alY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB6024.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWQyZTN5eVB3cExXOHNHYW5oUGVmS290bzNGTzFnMHBxWDR4QkxqMWFONzF2?=
 =?utf-8?B?T251Uy9GTWhWZlBQWVgxdkk0WXRnUGN1cDlncms0a0ZzR1VSdmNTTTB2a1V2?=
 =?utf-8?B?VXl0SUthcDFoa0FDZkE3TFpxNktVb2NVbGo1L2o0ZFZkeEpMSEIxWWdtREds?=
 =?utf-8?B?c21LNHhteDZJSW9EWENjRmNmandBQzRCNU1nUzBmMnRpV29vZ0tPNDQ2MXJ6?=
 =?utf-8?B?ZGM3QWNCclhtUXlVck5jMC9LaHZua21LNFl5UmVqcm1zanJJOEkyVFFaVEhL?=
 =?utf-8?B?Qit0MHhadzhTVkdKclF3RGppRW9Kc3h2Qmlka0N3TWhSQy9tZ0RFU2JpSkRO?=
 =?utf-8?B?QzZ6UHJIUkNEOFRYcCtQSXdPOURxUVVRS3J3bzM3eTlLbGpKS1hMY1hBWEdY?=
 =?utf-8?B?VGNrU1JpTjJaUEl3TXgwMWRUV3FpMUtSOVRaaDJEajVmbE9NeGpYaXc3ZDdk?=
 =?utf-8?B?elAzRkpQZXN1TnAyK0Z3OVJlcHFOeVBmdTRWS2RqNFgxVFgyVEF1dG94QkJ4?=
 =?utf-8?B?OUJYR2FncVB2SkJxTS95WWJNR0lMemdDRmhEdTJjdDNjZG1KUEhZUXRyTnNu?=
 =?utf-8?B?RUoyVU9hMWlRZXRZTVRhalFBaUtWOHlQTTQ3KzZJeFVQMEtDaXA0ak9XVWZ3?=
 =?utf-8?B?RS9WdHpCTk5BWmV1L2lBczFqV3YvN1ozTjVlN2hsN1NkV2VybDRYZ0htTnA1?=
 =?utf-8?B?RnNxUU1LWFl0aXBmem1KdEdoUFJuUVlLUVJPOVlESU1qWVpUMURFTkU2Wm9i?=
 =?utf-8?B?U1hRdGF1WFdhQk80U2VPOFBOSjZkbWhIVU90THhvWmJBWmNXbDZFNStqN0k3?=
 =?utf-8?B?NVRXbVp0TysxVURSRythVmxRbElKcjBSby9Cb1RLN21JVndlM1dVQ1ZBb1RO?=
 =?utf-8?B?MnJzZFVJSXlDeUJyU3VvTkhBWTIvd3kvUlhnczEyM1VSaVcrRGYrR00vWVgw?=
 =?utf-8?B?ajZTSHU1bHdKbUt1dEFOMGZDb3VQc3puNTViZHJIUjExOUVWWHk5amxjN0FC?=
 =?utf-8?B?YXpDbU8ra1g3NzlEZUMwdUNFRmhRR3RjV3VOUmFySVBkaXY3Q1pYSHViclZj?=
 =?utf-8?B?Zkk1cFdTL3h4T3l4a2ltcVcyMGdwTDNNMFJNdUR4eHd4K2M0ZnBEUE10Vm90?=
 =?utf-8?B?TTNEVjlqNGVsL2tzY2Uxb3lvUWR6NHNWVGxYU01FbWJnaFh1S1h3QytFdUFO?=
 =?utf-8?B?dGQrdUlraFBrVGJHbHBvZjZhQXBqZkxxL2Vyc2hSSHd2bVVCQVpFK0NNZW9p?=
 =?utf-8?B?OTNWeWZNQVhCSEZqY0ZkUkRaaXAyaTRUTlUvQkdvS0NyOFRUdWxDZDJraHpn?=
 =?utf-8?B?d25oampxcmVtK2kzWmF0WnhqNmwyZlhEWkVTcHR3WVNObUI3ZDIzWm1lbE1N?=
 =?utf-8?B?Z01UbE1kMHBjT1pjcUpJYTIrQ2tlWHA2Znl2THczTWdyUnJoMnN4LzRlRHp6?=
 =?utf-8?B?a1kvd1QwNENPdE5TVVF3MTR2SmQyYTEzYmw4MXZyeE5hemFlQ3lNcHVlRCto?=
 =?utf-8?B?dlYrOXE5cXByaldOaE9pVW81UStDbUZ6eXlKc2Y5N2ZzMDI3SDlTUXFRTTdj?=
 =?utf-8?B?MG41cHJwUkJEa2pZem9JbVBKT2N3ZlZkZEJQOExXM213UUpzZjFPVGd5eUNB?=
 =?utf-8?B?WXFkNHdrQ0NxOUtLWmI1TG1EZzV5bzNmVVdEWDZhM2F1VXl2MGFncGd3Vy9B?=
 =?utf-8?B?QTMvZXBVSGV6MERmaWFRcmhXSzI2emcrM011aUNmWm5kcy9OWGJ4RkoyTm9i?=
 =?utf-8?B?NlBPN1JPL1k0bHBRTWtJQnRINTVWdEdSZzQ5dHA0YnN5Q3pjZWZiSEhkekx6?=
 =?utf-8?B?c0FXZE56RHF5YW5QMEpMVmc1N0RiTHprWnJnMnlyK1AwS3ZjK3QvQnBBMnRV?=
 =?utf-8?B?N0kvOW1Ob2ZwMTRmS0lyT2YrMkNaQ3QrbjdjU0kzMDc3MGx1RVBvbFdLd21q?=
 =?utf-8?B?TGJSSFIwSlhub3diOE5MVU5uT29hV2FCa3VSQjFIb3BIZ0U3cXdSTC9EQllS?=
 =?utf-8?B?SDkwWVp2VEI5SUFUVzJjUE95YThkTVJBZ0pVd2dRdEkybTl2emsvc0lXSGpS?=
 =?utf-8?B?UHVxbnRoNVBkLy8rUENvWTM0RHRiZTJQaW1aa3ZzRlRqVmVaUjhBUVlZV3A4?=
 =?utf-8?B?d3kvczVtcHFudmdBNGNERnhSbk9nY1lnVDl5NDUyZzhzUGViYzJxd0lrL2I5?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 498b1980-9607-4511-db0a-08de1aca6344
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 11:16:08.7255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YElulTAf26+VPWMAXViQ2AHnicH3Y7Nr5smHLv1eI8Ef6daxhcuQdt1CKBEXh9S+yxELkDSUdvHF0yL9Epx33ACGSX0jHzfdFl2Sudr8wlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6675
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



On 10/23/2025 8:46 AM, Satyanarayana K V P wrote:
> With SRIOV enabled, while resuming from S4, there is a possibility that,
> the VM might have been suspended on one VF and resumed on another VF.
> Since GGTT space is not virtualized, we need to fixup all the GGTT
> references while resuming.
> 
> While resuming from S4, check whether the GGTT space is same or not for
> the given VF and fix-up if it is different.

is this an optimization, or the regular MIGRATION notification and flow
with the GuC does not work in this case ?

> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> ---
> V1 -> V2:
> - Rebased to latest drm-tip.
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 32 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
>  drivers/gpu/drm/xe/xe_pm.c          | 12 +++++++++++
>  3 files changed, 45 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index d0b102ab6ce8..38528495478f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1375,3 +1375,35 @@ void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
>  					       HZ * 5);
>  	xe_gt_WARN_ON(gt, !ret);
>  }
> +
> +/**
> + * xe_sriov_vf_fixup_ggtt - Fix up GGTT on resume from S4.

    * xe_sriov_vf_fixup_ggtt() - ...

and I don't see anything special about S4 in function code below

> + * @gt: the &xe_gt.
> + *
> + * This function shall be called only by VF.

this just says about the 'requirement' for the caller
> + * Main GT and media GT share the same GGTT space. So, fixups are needed
> + * only for Main GT.

this only about why there is nothing to do on media

but we still don't know what is special about S4

> + *
> + * Returns: 0 if the operation completed successfully, or a negative
> + * error code otherwise.
> + */
> +int xe_gt_sriov_vf_fixup_ggtt(struct xe_gt *gt)
> +{
> +	int err = 0;

no need to initialize here

> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	if (gt->info.type != XE_GT_TYPE_MAIN)
> +		return err;

hmm, you could return 0 here, but vf_post_migration_fixups() called
below actually does something for media GT (hwsp rebases), so maybe
we shouldn't skip that step here? 

> +
> +	xe_guc_comm_init_early(&gt->uc.guc);

shouldn't be needed since xe_gt shall be already fully initialized

> +	err = xe_gt_sriov_vf_bootstrap(gt);

this is much more than simple "do fixup" as given in the description

and "vf_bootstrap" just do a handshake with GuC, it's not querying
for any new self config
> +	if (err)
> +		goto out;
> +
> +	err = vf_post_migration_fixups(gt);

instead, the GGTT query is done as part of the above call (which is
already part of the recovery flow)

so the question is:

* why can't we wait until migration recovery is triggered?

or is it because it will not be triggered because GuC never return any VF_MIGRATION status?

so maybe we should initiate the recovery once we learned that new GGTT base has changed?

> +
> +out:
> +	return err;
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index af40276790fa..17004223f33a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -39,5 +39,6 @@ void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
>  void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
>  
>  void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
> +int xe_gt_sriov_vf_fixup_ggtt(struct xe_gt *gt);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 210298c4bcb1..68bf08ae62f6 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -19,6 +19,7 @@
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
>  #include "xe_gt_idle.h"
> +#include "xe_gt_sriov_vf.h"
>  #include "xe_i2c.h"
>  #include "xe_irq.h"
>  #include "xe_late_bind_fw.h"
> @@ -248,6 +249,17 @@ int xe_pm_resume(struct xe_device *xe)
>  
>  	xe_display_pm_resume_early(xe);
>  
> +	/* GGTT fixups (if needed) have to be done before restoring BOs */

be more specific " .. before restoring pinned BOs" 

> +	if (IS_SRIOV_VF(xe)) {
> +		for_each_gt(gt, xe, id) {

but maybe instead of new for_each_gt loop here, update the previous one:

	for_each_gt(gt, xe, id)
-		xe_gt_idle_disable_c6(gt);
+		xe_gt_resume_early(gt);

and there call VF specific code there:

+ xe_gt_resume_early()
+ {
+ 	if (IS_SRIOV_VF())
+ 		xe_gt_sriov_vf_resume_early(gt);
+ 	else
+ 		xe_gt_idle_disable_c6(gt);
+ }


> +			err = xe_gt_sriov_vf_fixup_ggtt(gt);
> +			if (err) {
> +				drm_err(&xe->drm, "GGTT fixups failed with %d\n", err);

nit: xe_gt_err(gt, ...) and likely better to inline that in the fixup function

> +				return err;
> +			}
> +		}
> +	}
> +
>  	/*
>  	 * This only restores pinned memory which is the memory required for the
>  	 * GT(s) to resume.

