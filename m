Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D84C87FCA
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 19:14:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A1010E8FE;
	Fri,  1 Aug 2025 19:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ft4XO5PC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C841810E30F
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 19:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754075664; x=1785611664;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OaAGpz9xZHemc78UVrt/B+aUdOT8smNZUUt1sYaWCfI=;
 b=Ft4XO5PC45CRE5as7Exo4o/9JMmvcSpZAgH9pIgOO+b7nfFL1iywSv1T
 qp93nZiTq+OyYJwzYhXA+PowsQ8y8etVgy8g2YOmcVvfGDvdj3J7q+F4Y
 7mGdwfAQl8EED5WD8MfYF88Em48g2OQ/N6tm10w5J5i1ZJJAE6NrhemiJ
 ROoYKH5qhXhwDkKxihCk/JtJnrJSEfHuR8jObq+DjNgzw/hX6+lYy3wcj
 8NGpF6uVQwihaWyV9qh9AK4pqmDXeGs3VZ5SQacCUxjt5oXYHzTZ31juO
 Fm+w6vyCFTARTXov3YMaKigBJh1B5sBMNwA3+G7KzgSqx15Z4Ea8cj2SH w==;
X-CSE-ConnectionGUID: 86wsAbkER2y1zBwVvgQd6g==
X-CSE-MsgGUID: GJFVuMNOS9+rLEtRvnT5sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67124819"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="67124819"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 12:14:24 -0700
X-CSE-ConnectionGUID: wXCfES2SRH6+tFqdNfQFjw==
X-CSE-MsgGUID: q1RQYLy5RJ6n5Q8NZbp+VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="169021844"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 12:14:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 12:14:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 12:14:23 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.78)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 12:14:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8gl1Gh7PU+44/c72glmCPTXBRCl96zLN2jRzf5/+hVYipJ7mu04wzeT7H8r2rJ+y1bUkTWkoYOQiniPKjTGJY5a3W0pkq4Q9zvMRBdjYQc6vBo38CMDqSRVqqMHikPn7Qef0aNjZKgwB4M+LJ0S5CgbBx6zNtXItbu+Z3mAFA0tDqFcygt8MMo8+acrWy+hvuwAAu/6ankijyWr01eJlkTXRtVS6cErRRQJMQctfo+71t72JP6X3iXFhcNS5RFlWv9tAtLPavmtGtZHAXIpUPC4dlO0xsKy3fvDAEbvSlO9oak4zhYLP3WYjMzbImaTN7G7IDABIzvH8kDG14aAOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZViR4jrrmNkdsYu3CRT6I4LpHmYjRLi9/h4Pr0Sxvzs=;
 b=Hf6+MCsyWZc8+RxcnIDZ2/clcXzbh5Hdq4EoMBioaMI8G+k6Z0ymlLLBYqhhchXv0neqU0ZGBYbV5NN4U8xyKHx4vX/DWDi+h444xIFe4k/C7TqyA0p4z7+gtGDiS3e92W4Hz/n+k7qzyyKp2CqEobXmYzGNgXPJadcWKizRo7a4ms/RnPa6H2oqF5gY3dtS8X5TNRy5YE2coYjseZtzFj49ZtE9ybRfXbf7xoZN4/JSwwLclQJf3KMyWzZtm5j/lAD+bBENGaOUti4WOvFmZryrCq4sTZAdYOm/pbHa22/qUk9PsV4xOEA63ou45AWI9FvR44tZiaxC8Xr3oNBQBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CO1PR11MB4835.namprd11.prod.outlook.com (2603:10b6:303:9e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.13; Fri, 1 Aug
 2025 19:14:07 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.8989.017; Fri, 1 Aug 2025
 19:14:07 +0000
Message-ID: <76c193a0-bc72-4e01-b26b-e0c03633ae4f@intel.com>
Date: Fri, 1 Aug 2025 21:14:02 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGUvcGY6?=
 =?UTF-8?Q?_Skip_LMTT_update_if_no_LMEM_was_provisioned_=28rev2=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20250801144418.180584-1-michal.wajdeczko@intel.com>
 <175407450917.205465.17936240299771813151@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <175407450917.205465.17936240299771813151@1538d3639d33>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0122.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::15) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CO1PR11MB4835:EE_
X-MS-Office365-Filtering-Correlation-Id: e3b29d97-259b-40ea-43b5-08ddd12f962c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dE5pVTdrS1ppVXR4b0Q3d3lIRXh6bG1HVWlRZTlEZ0thNldzVHFQQi9KMjFK?=
 =?utf-8?B?Ui8xUlJVYndYdThlYUlBWUtsV2hxV2luTisxTXV3RXF3aTdObEFDejhHMHQr?=
 =?utf-8?B?dmJRWWJ5YmhpcHVqYjhYM3dtSjBYclRxM2ZEM2xEZkU3WFQ1QzlZM3NEK1pH?=
 =?utf-8?B?aFFBQUloQVBhem1OVmlHY2JKdlN4ZElEUlVoL2VWMUk3dkh0Sk04RHUwMmJu?=
 =?utf-8?B?VXY3Q3JralIwQzNkWDlsbDdxR3ZXYU5mSXVTUFV5ZnRJd1hIRjBCMml3Q3cz?=
 =?utf-8?B?VVJCWTE2SmhJV1JEV0hPamVxMmdpNGZkNnFITitMVlZiODVnalcyVEdQZmtr?=
 =?utf-8?B?WE51RmYzQkROQ2ViNk41RVZzSE5VNjBCTWpSWk1HMStXaWxKdXFmRXlsMCtQ?=
 =?utf-8?B?Y0dqWGJlWTZsc0ExS05OeHh1WlJOZTlxMEhmQmJ6NlVzdE4yaVViSllWaE5q?=
 =?utf-8?B?RHN4RC8zeCtQQ2t5YWt2RWlPZDR5dGJLUTdiN3hXelhBUWNHd1lQNE02YS9S?=
 =?utf-8?B?cHBkWk0zKzJpRHIrd2tHUW96anJlcTkwZHRHWTdBdmZSYUlGd0xFMG04c0R6?=
 =?utf-8?B?NDY5Q2k2QlljRENRSlBuZU93WDZWbHBjcFFrT2JiUWdkbzhaWUtmZkpKNE5H?=
 =?utf-8?B?T3o1Qy83RXZOUnUvUElLNEEvVlJqSVlRcDJtc3UzK1o2MlhtYUtiTVdWK1Na?=
 =?utf-8?B?eDE4T09JdjlNS3JmbDZmMzR0QUdJaTlDMkFETFpqSVpSRllWSnN0ZExOcDRF?=
 =?utf-8?B?TnN0cytxMXJTTUFRei9jYUcrT0RsdFJzUFJtN2MrNjNEaTBDWjZsNGxOeGVR?=
 =?utf-8?B?V2VlRE5jM0hWTnVnRTVxaEZrNGJnbmc5L01Ra2FLWk5iZFlMeWhseU5vSG1G?=
 =?utf-8?B?N3ljVkpaSEFzVCtzY0d0TE5BQzBJY2M4U1Ztc1JKL3lMNmJkQ1VVWDY1bDFz?=
 =?utf-8?B?RGVxZTJhd0pjRnVNZ2hwVGRpQlZCdi9TZ2JBUVA0cUxtN0RKcGJZcUxBSEVN?=
 =?utf-8?B?UkpJbWdqUFk0THMwcDZnSnV0QllVdUttbHdIOFhyakxKT1BCczJZNHA1N0hx?=
 =?utf-8?B?bGlDR3ZMRFZSOWphWEptb09pd08xVmczNUVvR2RXU0xrcTQzVG5TYTRHV0tL?=
 =?utf-8?B?RUVySWk3Vyt6MjhlV3l4MC9ySGNIZEg1ZlJBSk1NQkwvcDU2eTg5WitHTFZV?=
 =?utf-8?B?dmQyUm1va0V1QksxakIyckp3Yk4rVDVIOW44TWxRSjVnOGZsR2VkRitJZWV5?=
 =?utf-8?B?TUcxVzdnV2FpbU4rSnA4MWlFUXJZVWk4OU81WStDNWNEY2gvTm1BeEVZZkZR?=
 =?utf-8?B?dmRGUURKdXhQVnlHNnc0cFB5RWVKZnBBa1ltTDQ5VlNiVlJnNUFrRHk1TEsr?=
 =?utf-8?B?SlhWaFAySW56aFFjVHA4SlB6YWNPMzRXNGdMUDlMcUd2aWNKN0ZsRXNtZEh3?=
 =?utf-8?B?aDFQdG5lYnd5M1hEekVvdGVsSDBIR2FCV3JwQ3pGdUttZk5lTlJhQmVJcEZ0?=
 =?utf-8?B?SlhCQWNoVEM5YzI5YTZNcytjdEFrOENzdW1wODFLWStyT24xc1h3UWlobUtF?=
 =?utf-8?B?eUZwbmYzUzl6d0JmRFRVdUppM1YxMFc3QWJpOThRWmM5cHB6UWFPSW14Q2tP?=
 =?utf-8?B?VnVkQ0Y4TTd3L0lVUTFRSU5GK2VRdlFkaHgwSzYrOHNYZW1STFhiTUF2MU1i?=
 =?utf-8?B?M3hIREU2R2hoTCs5blFiNXJPaFMwS0xPdElhYjhhaklzWEQ0cEJoZ3RyUWpq?=
 =?utf-8?B?QVdRdXZuK3JpUTdYS3pBWTZINUptOWx6b1F5aHkvN0xwblhuVHFDTlJCczZo?=
 =?utf-8?B?UTdibG1BUGZ2bWdqdkRaQ3FFWmx1K0dtbzFpelk3RVFTbE5Id3NtbWZxTUN5?=
 =?utf-8?Q?0TsgEffbHjMbx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODVaVEY0c0k1RFR4RXNBWGtadkpvRHBMZklldW1lRUFPTjhCdHNOajFzOHVZ?=
 =?utf-8?B?QnBsWGMrdUhqR0MwWjVtYnAvSlRUTlJNK2JRM0lEVkhsRjVpdUY5QzNZcmho?=
 =?utf-8?B?elRjRVU4TWM5U0pnQk1qWFFnRVpxN3h3UldmUlZ2MmJ0SnlkRE8xeEdTekVO?=
 =?utf-8?B?T3duVEpZMHE0YWhpb0VCUUx5ZlhycWtYc0RINWxKTDV1WTNoVXNLK3gxNUNR?=
 =?utf-8?B?c2h6TmNrMVhmU0Z1aGtVRVQ3RW9HcTdmRmordkJPYXZIRUduOFQvbngzNkd2?=
 =?utf-8?B?MmlUVG81VDIwY1dQQTkyRG5KUnFrdGZ5aEVIZ1lqNDdkYThwKzV2WFBsWlB3?=
 =?utf-8?B?Y0YyV2lhNHhYK1B0dXZTZDk1VnVOY3UxY3FJUFQrRmJGL0lVUmdvRWp3M3Bz?=
 =?utf-8?B?bFRCZjA3SVR1aTczaThRQkVOVzJiVi9wZ2xSc0FrQk1paWFzSkZ4MXV3b1gy?=
 =?utf-8?B?K2h2a3N0N29lVTdCNEx5SFJYQnk2UGRFTTdnaldhd2dCcUhjcEtwdzJycFdY?=
 =?utf-8?B?KzRXTVd2SHFOQ1BjTUhGM1F4MGlTRjU2MDhRQW1CNkNrRHl1MXgzQkRQTDdD?=
 =?utf-8?B?MERGaUFORm5jT3IvaGtzS1Q5R0U5eW1qV2l4eWFpRkNmVkJYL21iZ0xoYTU5?=
 =?utf-8?B?RHhNOHVVdjNPbzhKcEN4bEVoNHVHRFRSa1VmSjN2a1RKRTh0Y1RiNHkxdnRC?=
 =?utf-8?B?UVlTNkl5blI2bkpFNExUdk1DNjZkaHRQNS8zUStnOEZGN28xNU9uZVM3OURH?=
 =?utf-8?B?MGE1NkJneGhrQXZuNjc4cTU1bm90cks2WHhzOVhrYVlIZVc1VDFNcFlLOE95?=
 =?utf-8?B?Z2EyS2VHSER0MHBEOW5nRTE4Sms3SE9XNXpiRW1tWkZEcXU3SlhCSkFLaEdq?=
 =?utf-8?B?bGhvT0NYUWZNcGNhaGJ5QURxY3FXaTJkQWgzL1Bla01kVUZDUC9BankvSHRZ?=
 =?utf-8?B?TmdldUNwQjc5Q1NrNzFUbm1wMWM4NjZ2eVk0SkhMcklWK3FpMWxNWEdFb0d4?=
 =?utf-8?B?Z0ZCK0VaM0Z1elp2VzgrSGZJN0MwMnlMQXhnbXNBSnBGWnRvU2UzVnpib3JD?=
 =?utf-8?B?TjcwTFFWT21nUTdqNnZYQnRvYmRLRTNSU0gwL1N5RmpPbkFGdTBKeis5ai9j?=
 =?utf-8?B?YUQwaTJ6MzF2Wk5HSmFaSUJzZDNKUjBwbEFBVzYyUmJWOEpQTUh6VlpMN0g5?=
 =?utf-8?B?SkUyWGtCelFqd0laeUU0ZzR5WnFST0V4Z004QWZOTHgwemViS1RYT2lyUHRo?=
 =?utf-8?B?SXBxR2pqeUk5eGFDWVdGazR2WUhFTGlybnFKcUNjQzVuaTM2ZFdLTmw5cnBX?=
 =?utf-8?B?M2kvUGhHSjRzQU5XVlJxbWZDVm1rWi9rd0h0ckF2amFGRGZnK3FRMVZBZjZ3?=
 =?utf-8?B?b0hqOW51Q3BiRmp4NGdzMk1MQkF0YTVIUC9jc0Q1Qy9RQzhBOWV0OVZkTVh6?=
 =?utf-8?B?K2c3T2trOTlVcUw0NEtYcnRXckY3QVgxZDUwSzRQQnZKb0Rta25BMHNGcTgw?=
 =?utf-8?B?eXIxRS82NUhoLzMxd0FnbU5iTUZHSFVWa2ZSWHZEbnR0YXZNQ3lwVFFvZ1NJ?=
 =?utf-8?B?TlgwWUdmUkExTWIzQ2VSRExYY2pwYm13YmlaN2JKdVVNM1BYZXFXZGhzdlVq?=
 =?utf-8?B?eGI5cm9aRGhWSWRHM284K2ppak1XbCsvUWkyL1VFOC9sb0k3eUF0a1BOekhj?=
 =?utf-8?B?eGRxVkZJTlZzTXNSSi9GMW9wbG43N2tFZE14L1pMVGhhNGVscHRCUUdUdzBD?=
 =?utf-8?B?VE1QVVV5TXBieFhCanl3dDVvWDJiVDNSWjdjRG94SThYV05mSndlKzIzdzBC?=
 =?utf-8?B?YTJualVOczdsU2ZPTUtPWTJyQWw2SHh6TTRuK2swakxleVREN2NHVTkyZVpN?=
 =?utf-8?B?clVJVjlBZHp5Y3ZlNmJLbFBtcWlmMXNFbzkxV3kraTJzdkFnR2xuV240cFQ5?=
 =?utf-8?B?eWtQMmt0V01qbE5JVndUdHZEQXNuWGlMSmdwSjhaN2EyZFVzdWtKeHFiL3lz?=
 =?utf-8?B?bkRjZW1MeDBZVVdQb0c1a2pLazBJdTRyR2QrVGV1QUtkbEN6UGJDaFNUaHVV?=
 =?utf-8?B?V3IrNHF0UlVsd3F0RVVlcnJCbVdQM2xJdjM1UG9pRE1yK1FhZXBCMW92Rncz?=
 =?utf-8?B?UzJ3Q3pMSGtmL21QOFk3MTU1RWRlRVRpSDZoUzIxaUswYmFDRHFEUFRsVEJq?=
 =?utf-8?B?cFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b29d97-259b-40ea-43b5-08ddd12f962c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 19:14:07.1710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lv/Eifl1D0UZRxiczaAMOWyE5ypLhLjDaqgZ2e/jK1qej4PXJuwkRcmb8v6N5L5s7A6YXmj7PiwEp1KYEgY08AFOvR8XcM2wxMxieiT3ZnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4835
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



On 8/1/2025 8:55 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/pf: Skip LMTT update if no LMEM was provisioned (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/152377/ <https://patchwork.freedesktop.org/series/152377/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152377v2/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152377v2/index.html>
> 
> 
>   CI Bug Log - changes from xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a_FULL -> xe-pw-152377v2_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-152377v2_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-152377v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-152377v2_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_exec_balancer@once-cm-parallel-userptr:
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-6/igt@xe_exec_balancer@once-cm-parallel-userptr.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152377v2/shard-adlp-2/igt@xe_exec_balancer@once-cm-parallel-userptr.html>

unrelated since patch is about DGFX PF, and fail is on ADLP

Starting subtest: once-cm-parallel-userptr
(xe_exec_balancer:5653) xe/xe_ioctl-CRITICAL: Test assertion failure function xe_wait_ufence, file ../lib/xe/xe_ioctl.c:585:
(xe_exec_balancer:5653) xe/xe_ioctl-CRITICAL: Failed assertion: __xe_wait_ufence(fd, addr, value, exec_queue, &timeout) == 0
(xe_exec_balancer:5653) xe/xe_ioctl-CRITICAL: Last errno: 62, Timer expired
(xe_exec_balancer:5653) xe/xe_ioctl-CRITICAL: error: -62 != 0
Subtest once-cm-parallel-userptr failed.

> 
> 
>         Warnings
> 
>   * igt@core_hotunplug@hotunbind-rebind:
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@core_hotunplug@hotunbind-rebind.html> (Intel XE#4963 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963>) -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152377v2/shard-bmg-4/igt@core_hotunplug@hotunbind-rebind.html>

also unrelated

<4> [541.575980] xe 0000:03:00.0: [drm] drm_WARN_ON(power_domains->async_put_wakeref)
<4> [541.575987] xe 0000:03:00.0: [drm] drm_WARN_ON(!queue_delayed_work(system_unbound_wq, &power_domains->async_put_work, msecs_to_jiffies(delay_ms)))



