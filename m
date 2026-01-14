Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60ACED3CC87
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 22:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFE110E0F6;
	Wed, 14 Jan 2026 22:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H+YpnDpK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE5010E0F6
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 22:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768431466; x=1799967466;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=Oasb6N14gkC1iIf104aXupdjceKUKhaXPyVq84jwW98=;
 b=H+YpnDpKvqiWPhnCi+orcd/z9tssfG4Dsh+LAV3DwINZrSOtH0WZitCA
 bvjf3gieRvYffSa5UbSjo8Iygy4e/By3caaq6Y7lZ96RTJau/bb8w7heH
 L3q45vTKNvvrQ7DKOLi5GwmnOvF1r2C4NdCYOA03IXPY7ctjiUPrNXUR1
 xLjlX3LEqILoMenT6gm/gD9EOftd5C6FAONTlIScFARzpN+DGWQPwwtLK
 Ihytwndv8pt0ONMWwo0uycL4w3yjjM3tryFnx1Uv+Dyrv2mv6tWhjDmHq
 Lm46BrT4wun6x/F+zmh9eWc4mtrBAi180IQKHufhix+XFUltOHSoc3ZUa g==;
X-CSE-ConnectionGUID: VcGGdcibRSOiTdPJNn7mkw==
X-CSE-MsgGUID: /Wt6qcfrR+S9LYhuNKmIkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80849346"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="80849346"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 14:57:45 -0800
X-CSE-ConnectionGUID: kaWZqpt0QjSdrExCE30EIw==
X-CSE-MsgGUID: 0ggMtcjlSkOq94Kir/EZtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="204418539"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 14:57:44 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 14:57:43 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 14:57:43 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 14:57:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OiJTkpPquzzRntNhuR68XAoTc7jm+7+rdBBjIKotQ6TTNpJGo4eFzNKqseREtoZyWFbNphX4qE08kKNnvUkMBxNukw7WM9+UCy7ycZZZtH/lWZA8HIIU/KgvU094WjyFHVuBBFNUHdqEtj9+wpfYGpj5j19NhUw45kYff+t0Bwo4h2JaDw1PVSG9CtOeNcegm63RcTXqzlpyGBn8lBOxAXYm6Kea5DV4DMvBiXJuzwiZYd8SODU8et3RV1eGCSNwwouVhwCZ1rIRVCPbT2eKibDI98CeUVzTjqF0jGqklLwaOep0VM+GjTLoDyu+ER5Av7OgxwUQBtEloy0y6mrFqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFvHS2ph8LidjDYPm40xXZ8KF9bbFJT35asPYM0jLVY=;
 b=tI/TktrqjrZJQtxq/jRHDBLOMfg42jhm9NBXZtV+o6DiZ0WA4pqGwKJbx+V0wkgPIgHZCbXZQiOJP++D4g2R1vDBVNhTzb/dWlNvrFslj0W/xXL2yCVwnle0L/urZzOwz5HYWXVVig6JtEh2CujOH/fNiHkrCLLArAU7AWtVppaKqb3RrQ7T7JzEdhup11YVO8DaewHChwjb/BLqL5c5IWL3W9+zPxYXs3jsuiL3BytS8bayp18lh7aqaWRaMOxpRvzXCTuZBBuAtSLEwu2OEMIw3cdo0z0VLaVyHEs7CBb5Qs3o9Bybx0xc0cvAt5WD3kbWrnai/G+rKba2wDsScQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA0PR11MB7792.namprd11.prod.outlook.com (2603:10b6:208:409::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 22:57:41 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 22:57:41 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260114-rtp-rule-parser-v1-1-fa9029586bff@intel.com>
References: <20260114-rtp-rule-parser-v1-0-fa9029586bff@intel.com>
 <20260114-rtp-rule-parser-v1-1-fa9029586bff@intel.com>
Subject: Re: [PATCH 1/6] drm/xe/rtp: Write kunit test cases specific for rule
 matching
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: 
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 14 Jan 2026 19:57:36 -0300
Message-ID: <176843145689.12683.4615769418012675933@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR08CA0028.namprd08.prod.outlook.com
 (2603:10b6:a03:100::41) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA0PR11MB7792:EE_
X-MS-Office365-Filtering-Correlation-Id: 038636b5-947e-4501-eb92-08de53c05241
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|16122699012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2o5SEh1RFlSckJKbmYvNUIvc3ZMbU4wUWFaenNjMG1JWGRoSmRHSncybWJu?=
 =?utf-8?B?ejNHOTUxTDZLdEVVZWZ0bHYzOGVqQzVvbVd3TnpRVDVKYjl6eHhuc1JwRkx6?=
 =?utf-8?B?MTlUQ1RDMFdPRVlGbjBlZWRUNEt5M2Q3T0lUSzI0Q01XSm1GRFh4UTI1aDF2?=
 =?utf-8?B?eWFQUmNVL2hBNzlFTkFja3NNUlVjVXBTQnNKcVJDZ2VBZkRxaUUwRlpRK0tw?=
 =?utf-8?B?TDVDeUp5Rkw2YlJOYmQ4Smk3aloySmhSenlQVUhpYy9iOFFIQ0wrbnZBRVk5?=
 =?utf-8?B?T2w1N1RyY0xJMWZOREpBdHBNQVRlYkFTSjRWeW1td2U3WWFUSkVYK0c5S2xW?=
 =?utf-8?B?U1hjblRUbkFHL0NCTUxXak9WZGlwOXU4WUdMYlFNTWcyaW0vRDBrMDhkNS9F?=
 =?utf-8?B?Nk5FQURRaTNYRFZ2enpwZnlGaVpla1UzUmFreEJTQm5hSnZsZjYxeVJCaUdu?=
 =?utf-8?B?aTgvVnpLbWIzRUJQM0pYN1ovemNoeThRU1ZPRHZ1SWVkT1I5ZS9hUUplZDVw?=
 =?utf-8?B?YUhFOU5FY0J5MDJueHZJcWlUbCtLN0tSTWVjbGFuVjFZdlVjVmR2a1dGaWpr?=
 =?utf-8?B?L1l5WlpoTkx4SjMvSTRsVEE5dmtXU0hXMjJXblA1SnUvaTM4T2tkbHZKS0du?=
 =?utf-8?B?d0NJMVJQTElVYWM4cGdEZDAweFJ0MjQ2WXVmZkhnY1pYWUc5dndKWjRNaFZF?=
 =?utf-8?B?QzFrc0ZnQ21CWG5xNDFybnNkUDdoWWova1JlMDRIaHM0bWpSYklQYm9yemZQ?=
 =?utf-8?B?SEh4V2xpTjVOQ2hiTlh0ajYydlNwc0E0WXR4M2xjcm5VNkp4Z29oVGYzRDFr?=
 =?utf-8?B?ZFZyMjA4MysxSGhIUEJKRmorQVRUT1FYeHlYaHJjTjB6Rng2NzllOGd3RnMv?=
 =?utf-8?B?YTFrOXRvanZwVlJCL25LbzBDbXVua0xuT2VQZ0U5OTdoU0puU0NSdDNiM1lZ?=
 =?utf-8?B?QXYxd1Zmc00rTFRnMTExd0ZqdEZZZHI0TXJITS9qcmhEVk5pRHRrRVBEUWp2?=
 =?utf-8?B?dFE4TndXcnZjWS9zdmtDRGxHNWgrQ0g2L25yV0N4ZERsU0t5OXIzTlV5TGlG?=
 =?utf-8?B?aEg3S3h1TXMrVkFsY3lWZDhMMm42UVBtSXVvWU9tWmY2MGRZVFQxR0xncC8x?=
 =?utf-8?B?V0RGM0lqZnpPRTdFV085YXNjenJkMWRCNDdTREZOY2pkZmc2SkRZRGZQckVt?=
 =?utf-8?B?V3dLVGNlVUMzNmZaRGtMQVRZN1hNdHBiTS93WXloNG55bDc3WUtSUUpUV01w?=
 =?utf-8?B?RittMkFMWmJCeVRCczdZWkdROFZGUjk0R2tyWit3S1Q4ZTFpM2oxbDhQTW13?=
 =?utf-8?B?ZFhzOXN3RVZDSUJuelRtVnQ0YjNYR3lQVDRsaDFBSTRXbnkxeE5aVVRPL29W?=
 =?utf-8?B?QnAzZm94UHZ5T3E0WjJVNUNXNG9DRExvSmhLWUp5SDg1VmVnWkl3b2ZRQmJS?=
 =?utf-8?B?SWJPSmQrTjFOVmEzOHJDQmpkUGg1cEpzZXZGRU1PM1F1R1BBaWpFbVRIWUFt?=
 =?utf-8?B?OHVGMEtKNyt1ZTlmVzNjQmdvdmxyYWxFVXNhMU5sanVSeDliRENWZUJLcU8x?=
 =?utf-8?B?ZG92VkZSUEI0SFlzbWVNSVhsaHJXWTlYOXVIdXc1aE0xMmpDRmRwYUZEc3I4?=
 =?utf-8?B?MzFZY0FFTEFPaWRQT0t4RTNaWXpPT3NpeERTVFBXUmJDeWlFckVRbkNQa3pK?=
 =?utf-8?B?YXNvUmpJUDV6R2F6N29ld21TUkZORmZwTGxXdGcxWnJ5MCtiVzlNWG54RnlD?=
 =?utf-8?B?VXlXUWZNV0wvV0pQYzU0SzdCbDJLVW5CL0lFOGFzYzdjZVgyckdlQlBacGRK?=
 =?utf-8?B?Z3hPK0l6aWNURWNwUTdLOGYxYVFzenExMnp5UkM5TVpmODZWMG9rbFFqaDBu?=
 =?utf-8?B?RE9yZXBBVW5XZ3N6YWgzN2JJQkxERmcwRWc3Q0RGY3JWaXEwaFQzbVc5Vnly?=
 =?utf-8?B?N2VtRytZR3ViZS9pa2ZDbmk5M3VrK1M3ZHRjQWxqWXNwSHFNb1RCZ0xFYzhz?=
 =?utf-8?B?TU9vQU1kbmlFbW93M2tXMHA2S3F5Nmp0bDNqOXdnQWdjSlNsUjBqMmZ2ckM1?=
 =?utf-8?B?eU5GN1VQUlRRdWFZaFFhRmhIOVNUZXR2aURscXQ5YnBLa293bklvQVZ1cnBV?=
 =?utf-8?B?RVhPTmQyWGlOVXRoMHM3R0RvSGRCWWVLS0FkaG9XWFJhaVg2N2VHRjljSXVy?=
 =?utf-8?Q?2zOPlGIdWDxUage81MIKYik=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(16122699012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aSt4eHhSRm1GcGEzRjlKNXJ1bm9EZno5a0x2R294TU0yUnUrTDV4TXJISjZ1?=
 =?utf-8?B?VldBN1FYVjNWZDdYWDhabXRrYWNUOHVjUms4NnNwV01naHhHUm14SlZpdWJr?=
 =?utf-8?B?aVRCclFyb1NIRTY5ejNhaGVMM0dxNVpwU2VaUlhocEJiWXJzOUVIbklCVkJz?=
 =?utf-8?B?eVV3bDJXcnc3ZE82THdhNGhyNllxOXBQa3VHVkxIeVpwVk9ESHlINXNEWGFC?=
 =?utf-8?B?T0xXZVRCMjhUaFN2cmNLZUhwem9SdjB4ckltek5KWHRJalVuYm5uMzJ0dFNZ?=
 =?utf-8?B?R0lILzFTWFlKaXNOdGVKTVpPZmFQV0l4c0Y5bXVVRHhrc0dHcUtVRkI4ZXB4?=
 =?utf-8?B?SnFxUEhRZzMxNTJwN0g3Y0lKL2pKRHlFZm9lSHl1VWVkWUZMN0RxUUdJSHJL?=
 =?utf-8?B?azhuVi9QeDF1U1d6RW1tZkdGdXY3WjdoMjh6ckpUVmpVb0RzYU96SkRYTUlG?=
 =?utf-8?B?TjNZUlJBZUpXWDZtLzI0RlUweXlhVDBhU2czaUhjQ21sSnhmbUQ5eUpSaVBN?=
 =?utf-8?B?U1A1cWVNdmJCUWZNclE0TEkwelllbVlWaGpqcFZuOW1YbkFlS0JJMDBaVlZu?=
 =?utf-8?B?aWUwYXdoQzZIV21vTU5HRkRMbWIzdC9Rd0hEalU2dVRYYW1ud3JINzh0WDVl?=
 =?utf-8?B?SHlEZGxTUXdOME1YdW5vWUJXeXB4WWRDQUhyT3REeC83d1k1OXlndXIwQk5J?=
 =?utf-8?B?KzZ4bTk3alNFMWxEZFNBL0J6dHY3VHQ2ZHVaeDlPb0xIaGZWNFRVSUxwSmd4?=
 =?utf-8?B?bWl0TmdKZGlQUTU4UG5ac0lTNXo2bXVSQVlVT2V2T3lxNXRLVjkwT1l0dmNj?=
 =?utf-8?B?SUI3bmlZZkRmZU9SNXNqdU9OOHM0S21oM2Q3Sk1wT2lHQkFqY0JVQlNyYlNr?=
 =?utf-8?B?WmJZdTRzVTNJTTZuUkNvVjRLQU1zYndHemEwT2NrSE40TGdTb1ZMYm1NZ0xE?=
 =?utf-8?B?OTJNZ1laaFhobFAxWTVYVVdGZXM4Z2x5ck90RXBZUmE0a2hZZjQrQk5Pd1Bs?=
 =?utf-8?B?Z3ZST3Y4Z3ZGMHphcnVwalN6cWtmZDVhcHlZTHJIMHBJLzJ3NEdTUE9YRFVv?=
 =?utf-8?B?eG5wUVhTYkVJU3g3bWVOYnFNTTlyeXFOUEp5SVJJWlBVa1JHUWFmRUNtb2Nq?=
 =?utf-8?B?K1FBMUZ4RERXRlNCbFhmLzdyOFVzbzVUUFdKSWRFRnp1SHU5ZkY2eHcwWG9p?=
 =?utf-8?B?L1dNeFZEUU55QTJOeS9FaTVuaXdZYVUvK3h6Z2JUWnYwTUZpM05nbUFhY0Ju?=
 =?utf-8?B?aUhsVmYvWnlLMkRTRXhxQ2JsLy8yMzlIQUR1by9UV2tEQTRtbjIvekZqVmRE?=
 =?utf-8?B?bzArMlFQMFUwbHhTVk14VXpXelVmanBrYS9RaitSbEJWdkNzYWNOSTdIb3ZT?=
 =?utf-8?B?WEJYRXo1ZjBMSk9pc2kweUFyRWNLUHdXYS9Db3A4dTdZcWY2b0sxQ2lObmVa?=
 =?utf-8?B?bW55STZoN0dnQkY3MEZ1enI1Ykl5UUFpdDdLZmUxdjI5cWpYc0ZqYkpId3FF?=
 =?utf-8?B?YU1lT2NnbWRLT3pTZy9xcGErVWVBUi9Ja3ZvSWlUWkFTK3JFaXlMS2pIMGdp?=
 =?utf-8?B?ckQvaEJJWjdQc2N1anBLd2NEaEJ0eTV6SHV1M3g4V0dRbzVrZkNNVTZoWXQy?=
 =?utf-8?B?ZU1qU1k3a3RwN2Zpcm1VR3ZGSW8vT0lmZStLQ2pPUjh3c3BuM1ZJVHI0RXZX?=
 =?utf-8?B?OVBuR3VwQzFCc2YrNDhJMTJRbkVEa29ZUTFablZIRzRzWEpvbHFid0xXV0pi?=
 =?utf-8?B?Y3MxUC9FMDdOcTBTQWdBdHZkMFVaZ0hZWnV5Tk1LMW9MRnhXTkswdzJPMnpM?=
 =?utf-8?B?cXJ1RnBOMHM3ZDdhTmdNMjBqdlQ2OG5kaytpazV0VU9kV2R2VEJwRnROYytm?=
 =?utf-8?B?eFhRVjQydHF4WjFPdmEwcTl0SkNjT1dnbkpNamh4WTZlV0E2Q0FSU0tzRzMr?=
 =?utf-8?B?VEF1SldoZ3RWa2xOOUFSRzh0SWFCM2xCT3BPQXV2M1hpYzFyMWViekI3Smw3?=
 =?utf-8?B?ckUwRXJXdnlGVHhucXVtTzdVZlovUFNGTXZiQXp3a0FPQnB4WjNSZEZSTk9S?=
 =?utf-8?B?eElBdGxkRXNoZ2xZWmp5aEpxWDFZcjRucUd4aDlkZDhqYXBlVlE5M1EzdUFx?=
 =?utf-8?B?ZGExcy9LcGxBWkIrWFJJeGdaVGtCQXkwOE56TXZOcDZYclNyTGJTUTRXT1U3?=
 =?utf-8?B?djdrYUVIK2pyQ0FFalFER3dVcmh4QU1RNzFDZzJxRUdaMDhpK01JUHZiZmsw?=
 =?utf-8?B?RDVVU3hqWWxKUTJydzNGYVJqd2RtdTI2d2kzOFhnS2dESTVPUnMzSW1QVHNj?=
 =?utf-8?B?MFhOb1NxekY2bi80NUNqV1hvcDFBRWZRNXMxWnpiSGtPUTVyNkYrUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 038636b5-947e-4501-eb92-08de53c05241
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 22:57:41.3544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MPr10MSdQEVO4RAKfMVYjR8eKH8QqCKhfAoMFQxeAnzOyFRHUet71lhWdENfJbf4JLGGbaIeumjyz+uhrxpLWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7792
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

Quoting Gustavo Sousa (2026-01-14 19:49:51-03:00)
>The kunit test cases for the RTP framework are currently separated into
>those that validate xe_rtp_process_to_sr() and those that validate
>xe_rtp_process().  In both of them, we also have mixed stuff to validate
>rule matching functionality, which should rather be done in a separate
>test case group.
>
>Let's create such a group, specific for validating rule matching, and
>also add an initial set of cases.  In an upcoming change, we will do a
>cleanup of the other groups by migrating those cases intended for rule
>matching to this new group.
>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_rtp.c      |  38 +++++++++
> drivers/gpu/drm/xe/tests/xe_rtp_test.c | 141 ++++++++++++++++++++++++++++=
+++++
> drivers/gpu/drm/xe/tests/xe_rtp_test.h |  24 ++++++
> drivers/gpu/drm/xe/xe_rtp.c            |  55 +++++++++----
> 4 files changed, 242 insertions(+), 16 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_rtp.c b/drivers/gpu/drm/xe/tests/=
xe_rtp.c
>new file mode 100644
>index 000000000000..b3a8b75936d1
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/tests/xe_rtp.c
>@@ -0,0 +1,38 @@
>+// SPDX-License-Identifier: GPL-2.0 AND MIT
>+/*
>+ * Copyright =C2=A9 2026 Intel Corporation
>+ */
>+
>+#include "tests/xe_rtp_test.h"
>+
>+#include <kunit/visibility.h>
>+
>+/**
>+ * xe_rtp_rule_matches - Check if a set of RTP rule set match against the
>+ *                         device/GT/hwe
>+ * @xe: The xe device
>+ * @gt: The GT struct (may be NULL)
>+ * @hwe: The hw_engine  (may be NULL)
>+ * @rules: The array of rules to match against
>+ * @n_rules: Number of items in @rules
>+ * @err: Pointer (may be NULL) to set error number.
>+ *
>+ * This parses the set of rules and check if they match against the passe=
d
>+ * parameters.
>+ *
>+ * If passed, @err is updated with a non-zero negative error number or ze=
ro if
>+ * no errors were found during the parsing/evaluation of rules.
>+ *
>+ * Returns true if there is a match and false if there is no match or if =
an
>+ * error was found.
>+ */
>+bool xe_rtp_rule_matches(const struct xe_device *xe,
>+                         struct xe_gt *gt,
>+                         struct xe_hw_engine *hwe,
>+                         const struct xe_rtp_rule *rules,
>+                         unsigned int n_rules,
>+                         int *err)
>+{
>+        return rule_matches_with_err(xe, gt, hwe, rules, n_rules, err);
>+}
>+EXPORT_SYMBOL_IF_KUNIT(xe_rtp_rule_matches);
>diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/t=
ests/xe_rtp_test.c
>index d2255a59e58f..c3fea547da32 100644
>--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>@@ -19,6 +19,7 @@
> #include "xe_pci_test.h"
> #include "xe_reg_sr.h"
> #include "xe_rtp.h"
>+#include "xe_rtp_test.h"
>=20
> #define REGULAR_REG1        XE_REG(1)
> #define REGULAR_REG2        XE_REG(2)
>@@ -31,6 +32,14 @@
> #undef XE_REG_MCR
> #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr =3D 1)
>=20
>+struct rtp_rules_test_case {
>+        const char *name;
>+        bool expected_match;
>+        int expected_err;
>+        const struct xe_rtp_rule *rules;
>+        u8 n_rules;
>+};
>+
> struct rtp_to_sr_test_case {
>         const char *name;
>         struct xe_reg expected_reg;
>@@ -60,6 +69,130 @@ static bool match_no(const struct xe_device *xe, const=
 struct xe_gt *gt,
>         return false;
> }
>=20
>+static const struct rtp_rules_test_case rtp_rules_cases[] =3D {
>+        /*
>+         * Single rules.
>+         *
>+         * TODO: Include other types of rules as well: GRAPHICS_VERSION()=
,
>+         * MEDIA_VERSION(), etc.
>+         */
>+        {
>+                .name =3D "no",
>+                .expected_match =3D false,
>+                XE_RTP_RULES(FUNC(match_no)),
>+        },
>+        {
>+                .name =3D "yes",
>+                .expected_match =3D true,
>+                XE_RTP_RULES(FUNC(match_yes)),
>+        },
>+
>+        /* Conjunctions with 2 operands. */
>+        {
>+                .name =3D "no-and-no",
>+                .expected_match =3D false,
>+                XE_RTP_RULES(FUNC(match_no), FUNC(match_no)),
>+        },
>+        {
>+                .name =3D "no-and-yes",
>+                .expected_match =3D false,
>+                XE_RTP_RULES(FUNC(match_no), FUNC(match_yes)),
>+        },
>+        {
>+                .name =3D "yes-and-no",
>+                .expected_match =3D false,
>+                XE_RTP_RULES(FUNC(match_yes), FUNC(match_no)),
>+        },
>+        {
>+                .name =3D "yes-and-yes",
>+                .expected_match =3D true,
>+                XE_RTP_RULES(FUNC(match_yes), FUNC(match_yes)),
>+        },
>+
>+        /* Disjunctions with 2 operands. */
>+        {
>+                .name =3D "no-or-no",
>+                .expected_match =3D false,
>+                XE_RTP_RULES(FUNC(match_no), OR, FUNC(match_no)),
>+        },
>+        {
>+                .name =3D "no-or-yes",
>+                .expected_match =3D true,
>+                XE_RTP_RULES(FUNC(match_no), OR, FUNC(match_yes)),
>+        },
>+        {
>+                .name =3D "yes-or-no",
>+                .expected_match =3D true,
>+                XE_RTP_RULES(FUNC(match_yes), OR, FUNC(match_no)),
>+        },
>+        {
>+                .name =3D "yes-or-yes",
>+                .expected_match =3D true,
>+                XE_RTP_RULES(FUNC(match_yes), OR, FUNC(match_yes)),
>+        },
>+
>+        /* Conjunction and disjunctions. */
>+        {
>+                .name =3D "no-yes-or-no-yes",
>+                .expected_match =3D false,
>+                XE_RTP_RULES(FUNC(match_no), FUNC(match_yes), OR,
>+                             FUNC(match_yes), FUNC(match_no)),
>+        },
>+        {
>+                .name =3D "no-yes-or-yes-yes",
>+                .expected_match =3D true,
>+                XE_RTP_RULES(FUNC(match_no), FUNC(match_yes), OR,
>+                             FUNC(match_yes), FUNC(match_yes)),
>+        },
>+        {
>+                .name =3D "yes-yes-or-no-yes",
>+                .expected_match =3D true,
>+                XE_RTP_RULES(FUNC(match_yes), FUNC(match_yes), OR,
>+                             FUNC(match_no), FUNC(match_yes)),
>+        },
>+        {
>+                .name =3D "yes-yes-or-yes-yes",
>+                .expected_match =3D true,
>+                XE_RTP_RULES(FUNC(match_yes), FUNC(match_yes), OR,
>+                             FUNC(match_yes), FUNC(match_yes)),
>+        },
>+        {
>+                .name =3D "no-no-or-yes-or-no",
>+                .expected_match =3D true,
>+                XE_RTP_RULES(FUNC(match_no), FUNC(match_no), OR,
>+                             FUNC(match_yes), OR,
>+                             FUNC(match_no)),
>+        },
>+
>+        /* Syntax errors. */
>+        {
>+                .name =3D "or",
>+                .expected_match =3D false,
>+                .expected_err =3D -EINVAL,
>+                XE_RTP_RULES(OR),
>+        },
>+        {
>+                .name =3D "or-anything",
>+                .expected_match =3D false,
>+                .expected_err =3D -EINVAL,
>+                XE_RTP_RULES(OR, FUNC(match_yes)),
>+        },
>+};
>+
>+static void xe_rtp_rules_tests(struct kunit *test)
>+{
>+        const struct rtp_rules_test_case *param =3D test->param_value;
>+        struct xe_device *xe =3D test->priv;
>+        struct xe_gt *gt =3D xe_device_get_root_tile(xe)->primary_gt;
>+        int err;
>+        bool match;
>+
>+        match =3D xe_rtp_rule_matches(xe, gt, NULL, param->rules, param->=
n_rules, &err);
>+
>+        KUNIT_EXPECT_EQ(test, match, param->expected_match);
>+        KUNIT_EXPECT_EQ(test, err, param->expected_err);
>+}
>+
> static const struct rtp_to_sr_test_case rtp_to_sr_cases[] =3D {
>         {
>                 .name =3D "coalesce-same-reg",
>@@ -488,6 +621,13 @@ static void xe_rtp_process_tests(struct kunit *test)
>         KUNIT_EXPECT_EQ(test, active, param->expected_active);
> }
>=20
>+static void rtp_rules_desc(const struct rtp_rules_test_case *t, char *des=
c)
>+{
>+        strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
>+}
>+
>+KUNIT_ARRAY_PARAM(rtp_rules, rtp_rules_cases, rtp_rules_desc);
>+
> static void rtp_to_sr_desc(const struct rtp_to_sr_test_case *t, char *des=
c)
> {
>         strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
>@@ -533,6 +673,7 @@ static void xe_rtp_test_exit(struct kunit *test)
> }
>=20
> static struct kunit_case xe_rtp_tests[] =3D {
>+        KUNIT_CASE_PARAM(xe_rtp_rules_tests, rtp_rules_gen_params),
>         KUNIT_CASE_PARAM(xe_rtp_process_to_sr_tests, rtp_to_sr_gen_params=
),
>         KUNIT_CASE_PARAM(xe_rtp_process_tests, rtp_gen_params),
>         {}
>diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.h b/drivers/gpu/drm/xe/t=
ests/xe_rtp_test.h
>new file mode 100644
>index 000000000000..0579c1522424
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.h
>@@ -0,0 +1,24 @@
>+/* SPDX-License-Identifier: GPL-2.0 AND MIT */
>+/*
>+ * Copyright =C2=A9 2026 Intel Corporation
>+ */
>+
>+#ifndef _XE_RTP_TEST_H_
>+#define _XE_RTP_TEST_H_
>+
>+#include <linux/types.h>
>+#include <kunit/test.h>

Oops... A leftover that should have been removed.

--
Gustavo Sousa

>+
>+struct xe_device;
>+struct xe_gt;
>+struct xe_hw_engine;
>+struct xe_rtp_rule;
>+
>+bool xe_rtp_rule_matches(const struct xe_device *xe,
>+                         struct xe_gt *gt,
>+                         struct xe_hw_engine *hwe,
>+                         const struct xe_rtp_rule *rules,
>+                         unsigned int n_rules,
>+                         int *err);
>+
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>index ed509b1c8cfc..e955df6c22ca 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.c
>+++ b/drivers/gpu/drm/xe/xe_rtp.c
>@@ -30,16 +30,20 @@ static bool has_samedia(const struct xe_device *xe)
>         return xe->info.media_verx100 >=3D 1300;
> }
>=20
>-static bool rule_matches(const struct xe_device *xe,
>-                         struct xe_gt *gt,
>-                         struct xe_hw_engine *hwe,
>-                         const struct xe_rtp_rule *rules,
>-                         unsigned int n_rules)
>+static bool rule_matches_with_err(const struct xe_device *xe,
>+                                  struct xe_gt *gt,
>+                                  struct xe_hw_engine *hwe,
>+                                  const struct xe_rtp_rule *rules,
>+                                  unsigned int n_rules,
>+                                  int *err)
> {
>         const struct xe_rtp_rule *r;
>         unsigned int i, rcount =3D 0;
>         bool match;
>=20
>+        if (err)
>+                *err =3D 0;
>+
>         for (r =3D rules, i =3D 0; i < n_rules; r =3D &rules[++i]) {
>                 switch (r->match_type) {
>                 case XE_RTP_MATCH_OR:
>@@ -58,14 +62,14 @@ static bool rule_matches(const struct xe_device *xe,
>                         break;
>                 case XE_RTP_MATCH_GRAPHICS_VERSION:
>                         if (drm_WARN_ON(&xe->drm, !gt))
>-                                return false;
>+                                goto error;
>=20
>                         match =3D xe->info.graphics_verx100 =3D=3D r->ver=
_start &&
>                                 (!has_samedia(xe) || !xe_gt_is_media_type=
(gt));
>                         break;
>                 case XE_RTP_MATCH_GRAPHICS_VERSION_RANGE:
>                         if (drm_WARN_ON(&xe->drm, !gt))
>-                                return false;
>+                                goto error;
>=20
>                         match =3D xe->info.graphics_verx100 >=3D r->ver_s=
tart &&
>                                 xe->info.graphics_verx100 <=3D r->ver_end=
 &&
>@@ -73,13 +77,13 @@ static bool rule_matches(const struct xe_device *xe,
>                         break;
>                 case XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT:
>                         if (drm_WARN_ON(&xe->drm, !gt))
>-                                return false;
>+                                goto error;
>=20
>                         match =3D xe->info.graphics_verx100 =3D=3D r->ver=
_start;
>                         break;
>                 case XE_RTP_MATCH_GRAPHICS_STEP:
>                         if (drm_WARN_ON(&xe->drm, !gt))
>-                                return false;
>+                                goto error;
>=20
>                         match =3D xe->info.step.graphics >=3D r->step_sta=
rt &&
>                                 xe->info.step.graphics < r->step_end &&
>@@ -87,14 +91,14 @@ static bool rule_matches(const struct xe_device *xe,
>                         break;
>                 case XE_RTP_MATCH_MEDIA_VERSION:
>                         if (drm_WARN_ON(&xe->drm, !gt))
>-                                return false;
>+                                goto error;
>=20
>                         match =3D xe->info.media_verx100 =3D=3D r->ver_st=
art &&
>                                 (!has_samedia(xe) || xe_gt_is_media_type(=
gt));
>                         break;
>                 case XE_RTP_MATCH_MEDIA_VERSION_RANGE:
>                         if (drm_WARN_ON(&xe->drm, !gt))
>-                                return false;
>+                                goto error;
>=20
>                         match =3D xe->info.media_verx100 >=3D r->ver_star=
t &&
>                                 xe->info.media_verx100 <=3D r->ver_end &&
>@@ -102,7 +106,7 @@ static bool rule_matches(const struct xe_device *xe,
>                         break;
>                 case XE_RTP_MATCH_MEDIA_STEP:
>                         if (drm_WARN_ON(&xe->drm, !gt))
>-                                return false;
>+                                goto error;
>=20
>                         match =3D xe->info.step.media >=3D r->step_start =
&&
>                                 xe->info.step.media < r->step_end &&
>@@ -110,7 +114,7 @@ static bool rule_matches(const struct xe_device *xe,
>                         break;
>                 case XE_RTP_MATCH_MEDIA_VERSION_ANY_GT:
>                         if (drm_WARN_ON(&xe->drm, !gt))
>-                                return false;
>+                                goto error;
>=20
>                         match =3D xe->info.media_verx100 =3D=3D r->ver_st=
art;
>                         break;
>@@ -122,13 +126,13 @@ static bool rule_matches(const struct xe_device *xe,
>                         break;
>                 case XE_RTP_MATCH_ENGINE_CLASS:
>                         if (drm_WARN_ON(&xe->drm, !hwe))
>-                                return false;
>+                                goto error;
>=20
>                         match =3D hwe->class =3D=3D r->engine_class;
>                         break;
>                 case XE_RTP_MATCH_NOT_ENGINE_CLASS:
>                         if (drm_WARN_ON(&xe->drm, !hwe))
>-                                return false;
>+                                goto error;
>=20
>                         match =3D hwe->class !=3D r->engine_class;
>                         break;
>@@ -160,9 +164,24 @@ static bool rule_matches(const struct xe_device *xe,
>=20
> done:
>         if (drm_WARN_ON(&xe->drm, !rcount))
>-                return false;
>+                goto error;
>=20
>         return true;
>+
>+error:
>+        if (err)
>+                *err =3D -EINVAL;
>+
>+        return false;
>+}
>+
>+static bool rule_matches(const struct xe_device *xe,
>+                         struct xe_gt *gt,
>+                         struct xe_hw_engine *hwe,
>+                         const struct xe_rtp_rule *rules,
>+                         unsigned int n_rules)
>+{
>+        return rule_matches_with_err(xe, gt, hwe, rules, n_rules, NULL);
> }
>=20
> static void rtp_add_sr_entry(const struct xe_rtp_action *action,
>@@ -385,3 +404,7 @@ bool xe_rtp_match_has_flat_ccs(const struct xe_device =
*xe,
> {
>         return xe->info.has_flat_ccs;
> }
>+
>+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>+#include "tests/xe_rtp.c"
>+#endif
>
>--=20
>2.52.0
>
