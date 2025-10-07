Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B03CCA470
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 14:24:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B35610E14F;
	Tue,  7 Oct 2025 14:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OHu5F5tf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0E210E14F
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 14:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759847056; x=1791383056;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=k+v1fk22ZWkdvKHATu6CCMV/byhImd5aacl2PQy+lW0=;
 b=OHu5F5tfrbJrTXcXkfa8FVUJ4Mye/lvIpXpq9mYfNJaUWna6OXrTyLLf
 RI+H88l8z8vQSltq+S/EwEvPfQBJvUeSXXZVbuB4sC4avKAAcjvKh125p
 U4Age0yxGuK+sl0H0rn/Q+0OZfCUmxwIYc67IgVJFEpLnHXHphjtbpmJC
 9nIn364gkV7lUYMa52cWm8TZznSjK2ml2ArkqT0OfViXU4JAJpwYuPrao
 gomQVf+doSO0N0g4t11ExKUgPcW+z/uQtBK+sOdcCWBZiLtRXqkFhqMQq
 CKLI+j6tWNvP/YRVqEkr7LonTQRJqxCzSJxOi6VUZdzKNL84CvMXAUBfY Q==;
X-CSE-ConnectionGUID: 4Qe2iXSmR/+RaOmPMeCDxA==
X-CSE-MsgGUID: MVoLyG5hTP+WOOxHTx3nBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="62074513"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="62074513"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 07:24:15 -0700
X-CSE-ConnectionGUID: lgiwADAXTFWGMNd63ZY9GQ==
X-CSE-MsgGUID: HZaziRg5SkS9h3JUZUlNcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="184445610"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 07:24:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 07:24:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 07:24:15 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 07:24:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ln6soK2pmUEKQf8xmt3BqixCmDecCVUAqOFZ15wOUS/HHT/3VJQtZvc0A1HS95QT8DkN1BmXTABivEy5+ndrXIfbWHwaST5HG8NcgxD2H1P4Nj4lad4WvBo1EYhB85IlDpOHS5/44FKoxJFNqOwAznfWRhuvQBzACU6fta0kjS6raAMWk1WqhbjF+5m1ob5Q1MFjKAFQ1ULo+CUpkt0yAcYyz5XIErhL1wqepdcC8ShQ61LmxBgLqX287+VGj8Y9WqTg4NRPaZ5Iwp1+1wAeiOTV/6SXfDR8wtFzBedE9BpTckDdQHGOPreJnhq6PCrBQfjUP/X1tuvV0ujaWMhmFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSBzXZartdG3yODP9FaLjoPMAFd6O8zlR0j7azYFcYI=;
 b=H4dmkB1hDCEWkRqP6pwXdPZmS9vOKURKDyfLtw8BC8vLtLyZVKa5MPI0LHwNWRC/f+yZ2BlHmZYj4F9kzV4eXL35wcUPhwBnMXQ3mSaDqL+qZIq9ygatR9tXQiiNs/jMzgbVusTk5PTYJc+yP2jRecKnVDo8CplG+Q5154u+eUvW00Y1x0FQrJCQeFePJoxY2JKveoAn/T5zDR1W1ZEntU/SKbncUjQpvqfnW3Yk/tqg5f/if03vdzX9aEDHkg+UX3tq8urqfJHkYojS112qKMIucu4dvaU2f3wK0m5+FeBZbG26ufOpYgdyhf9afWAn4FygqH51jMPiiS5PvrT+rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB9454.namprd11.prod.outlook.com (2603:10b6:8:28c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 14:24:09 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 14:24:09 +0000
Message-ID: <780a0a91-617a-4ce2-b7cf-8feec8bb23d7@intel.com>
Date: Tue, 7 Oct 2025 16:24:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 23/33] drm/xe/vf: Start CTs before resfix VF post
 migration recovery
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251007130505.2694829-1-matthew.brost@intel.com>
 <20251007130505.2694829-24-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251007130505.2694829-24-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0286.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::13) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB9454:EE_
X-MS-Office365-Filtering-Correlation-Id: 45ffe3db-c9e4-4f39-6189-08de05ad2dc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDJub1hHT0VOK21Bemo2MmR2bEhTSVNNbGxXRWtXdjlneXg4TEpiUUVkaTh4?=
 =?utf-8?B?UUZZbHY3QkNRUEM0aW9jYW1RektBWEk5SVFCZ2RVM21lS0UvNGkyOFVsK2E4?=
 =?utf-8?B?ZmxOMUd2bkg2MGpvNUJKbHdoM1RjOTc3dXdRZFRvamZONTlmY1ZBSVQwcGds?=
 =?utf-8?B?a25jRzZiVEEvbDZBUEY2TmtCNGJoYWtrRW5iUUJkaklqa29zWWF3THZvSlhy?=
 =?utf-8?B?YzQ2KzNJYlJlTWNySjNialdCVUpvOUYwd2J4MFUxOEE3K3p6ditSaWRMUmsv?=
 =?utf-8?B?dC90QnVZMkF4cnZPdXBmdWxnOHQ1WHBXaXpINlZyakhsMjg2eTNkSmpJRUNE?=
 =?utf-8?B?aHZSTDNjZTM5bmNIcC9FNHJyNDhwTXNrSStGclVoOTlsUGcybzRiVDlPeHhJ?=
 =?utf-8?B?cGNJK2Y4ZXAvQU81TGsvbWNDdHpNL0p3WmNrNXJrOWc0WUxHeElLRndDUEgw?=
 =?utf-8?B?NlJVQ1hQbUwweWNnQldUUkJGQ3hYeE13Z213UyszV1dFdEo1TXVGTWhFbkRJ?=
 =?utf-8?B?RFpqRkJpc3R0WTR3WDR1UmRSNFY1Vmc1T1dKWUlYdXZWME9lWnpuRUVJb3d6?=
 =?utf-8?B?U0Y2Zk9pOWhFOGNrTDJYNlAyUS9obEErMDlXWlVIZGpUK1ZVR1hzTTQ0LzNo?=
 =?utf-8?B?c0drTHUrVFBoM0lSbUZ1NW5Pcm5xbVE5aG5rSU91aWZZeDFibWorK205NG4y?=
 =?utf-8?B?WCtnaFZlTEx4SW9ySnpPWlR6VTVCeTVGa2xYN1lCVmdWVmdjeE5mU1JWcVJS?=
 =?utf-8?B?dThubUJNdVNnQWVLNm5sMVdncTlaY3NZK1h0MmtNN09qbXhXYVBHZGNZckp0?=
 =?utf-8?B?UllZdWxLQnAzd0RqRitoM0IzbTl2eWpZcDkzM2tteUgyaGo5WXdiSGZZTEU3?=
 =?utf-8?B?cC80OWpROHNvRnFuZlltTFE3UUxIZHlUMjB2eGlmSnBTL3FZZEZXVmZpZHRj?=
 =?utf-8?B?ZDY3U24vdlJOY0wrMjAwZVA5UjNKTTVjVGFTRDJPSitNRXI2ME5JeEhlQUlQ?=
 =?utf-8?B?b09QU0RySVlrTERicHo4OUdLaEpqeVlLbjUybmh0dm9DblJHMTVtRGpmK1Zs?=
 =?utf-8?B?b0ZLQ3NRVDFzMUlxVjRCbStaeUxRdXA0QVF2TG9RYnhFWkI2N1Z0QVdqcFV6?=
 =?utf-8?B?NitnWHVjTjZ2WkZ2NFF4QlViQVZWYUFZcHhMUmdQNHk4bVFqVTJId21TakE5?=
 =?utf-8?B?cmtkYncrdXNTbUhGcGFZazAzUUE4S3JFTFIveVFrT1llMVlMYk9vQXFUejNJ?=
 =?utf-8?B?eGRrSFVWMmwyQTd5SkJWenRmWmlLWWJuMXQ5WER4OEtDKzBZZE9qeWtvRFh3?=
 =?utf-8?B?VXdUUU9KRGcxSTJLM2dCaFpvVUs3UEY2TzM1OVl1L2Q5L3I4dzI1VFRYb1dO?=
 =?utf-8?B?R0k1Z2tFd0dDclJFY1F1b0c1emorSGVhQ1J1ODhJUDY4OVBHSUppVk1QemJY?=
 =?utf-8?B?YWJBZFNlVTVONmQ2TncwWUZnODdOaEM4VWFHUk1KWmJKdlBwVmpFNExqQ3Yy?=
 =?utf-8?B?ZjN1R3N5c3hEbGxtRUtxdzc5RTlIeFRBRkFXdFdSOERxNTE0SUxzV0tKMW43?=
 =?utf-8?B?YXRIQldIYy9JYWViL0pramthNGgzVnZPWW5XNXNSTkJ3NU1VQXJRSEErV2o0?=
 =?utf-8?B?VkNHNTlwTmJoYVAzUmVLOC95bW5tSVpZOGhoaG1qOC9IUWZncGJXa0d5OVRv?=
 =?utf-8?B?YmMrVXBhQTVscE0ybFlQY2dlb3VQSU4wTWNBS1dLRjJsUU5wajFHY2xYM0NJ?=
 =?utf-8?B?SnlZN1ovMkFnbmQ4RXBORGRtRDJiRVB4clFodVM5WjJkYnpkaGZZS2NEdXIx?=
 =?utf-8?B?MHo5RDNFejhqbERVUWRpQTE2dXAyUWxweW9aZ1BpY3NQM04xVms0bGVpRk1U?=
 =?utf-8?B?R0UwRW8rbU5jSDdmQkI2bkdNdkZwckE1a1lMNFJwOXR2d3hsbUMvTy9TS1h0?=
 =?utf-8?Q?I8T0B64SnhEBJR8Ta50uRVL8pR3Vd5zs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkFpUHFXczNRelFBQWkzeWw1Z3BNMjhYWitLVzVNYms3RHB4Ui9adHNUWkc4?=
 =?utf-8?B?Sjh4VWNCV3hSa2FTZjdON3dvcGRXcUtlUVQ3djJCNHR6bWVuQ1JnQkgwdGJv?=
 =?utf-8?B?d2kxYlVRNHJGc0xEN0lKai9lNDF2cHU0SlJlODF5N0ZJbWtPcnVRUnMwMlVv?=
 =?utf-8?B?M1JzTndhVE80NU1Jb2Mzak14aGtiUk5uc01GSHg3YzNCMEZGa21YRWtWaGtu?=
 =?utf-8?B?SS9vYUxkMEsrT1hBTk0rZzVDM3BCQkIyaW8vaDh5ZGZOOW1SU1gweHBRcGt6?=
 =?utf-8?B?b0xGZDdEN080eTlNNW1BRzhzaTcxTzB2OUl3aVJtRTVKYUUyQU9qQk55Tnpa?=
 =?utf-8?B?MWtrUmRsdlEvMUNHQzJWUE94Y0FVSW1lOG5IU05xN1dLM0FEWTBtVnJVMURU?=
 =?utf-8?B?WG9FOFRiYWc2ZzRMWS9wdThKcGVUK2hwUFVnTjB1OEdGOGJEY3pZejY0Zkpj?=
 =?utf-8?B?OFVFWkhWUzR6THc4NlJZZGVWbmtyVDRMUGlMUUFqU3laTDkwclAvczFBZThN?=
 =?utf-8?B?RGpJaEprMUl4VkJ6UjlyWXRMNjR0TUlacldMVEppLzlOMjlKNzdtT21EcnRP?=
 =?utf-8?B?N3d1Sk93VzlYQlBKeXdqRER1MHVlVmtCZ1RxZUo1bytjL012Y3lnQWtUdzZZ?=
 =?utf-8?B?NFZaNjhYNitZSFZ3Y0JhWUlMRmplUy9sNGFQZlMwcHhZWU03ditOdGtkVGZi?=
 =?utf-8?B?M1UyNU1wRkRhcGtvMHA5c1k3bkxyRWpuNnA2UkFzbk1RR3hUdnR2QXdFcmZ4?=
 =?utf-8?B?eDg2VHE5Y2FMemZWMGR1UVoyYlFBc1BGOGdKL0s5ZVJYcExSMlk0cXM1OFdR?=
 =?utf-8?B?V0tiWjdLcXZDOHpzZU12di9yeE1PNWswb1pGNUt5UHpKeHMyZVlSNVoxaVFk?=
 =?utf-8?B?aStDbXpodXhKZGxvc2doV0Nta2xKdm1LdGp6azNOSEx3V3h2RUNaZmhoaUh2?=
 =?utf-8?B?ZW80dVNmQ3JmZGdRMHVmNVIyZ3lZRUp0andPMDZ2UGtjSm4xU0w2KzBCeUNM?=
 =?utf-8?B?T0xTTTVFcjh2MGxPeGllV2lHQW8rVHBTTCt2eWZ0QWdjbzYzdjI4bnZwUmFZ?=
 =?utf-8?B?aDZVendwSTRWWU5pNmQwaEdsZnQyUjFMZTl1enBQVllRZ2ltRkJCeW1Od25I?=
 =?utf-8?B?dFR1ZlViZU0yWUxxYTNteFMxNDJXakhuWWdYeE9DSHVqWlloR1QxS1N4U2xQ?=
 =?utf-8?B?ajRXU3N6MEIwdVZUT3BDS3hMclVrck5rVGVkM0lCcjBGaVlscEMyeVpzQVp2?=
 =?utf-8?B?YStBMkFwNUs5ejJRTW9jU2VtY0xyYW5qWUhyNWJjWEV5RDkrTTgrb0w0M2VB?=
 =?utf-8?B?QnorbGxnR0hYL3ZTNSthb1lpcWVLVTZFMnJDUXM1QTRnN0FaSXFGNWVQOEMy?=
 =?utf-8?B?eWRhQ0ZsTlB5S1ZyeFZlRnBwWHVjcDJvSEhWd1k5SWtwdURRYWdqRlVaLy83?=
 =?utf-8?B?Y0cyc0d1b1NDVHpGdkNiNmZHem4zanlXOUwyaHhHL3Nqc29QWDEraE1lVkVQ?=
 =?utf-8?B?T0ZRNXQ2OC9aQVV4R3RWNFk2QUhmdnZrYzkzU0EzamRNVS9uS0NNcmhOK0E1?=
 =?utf-8?B?T1Fmb3hGU1lCUHp4N2d4bExNZzhaMlZtSGJGZnNFdkdDaGhmdzRVN0xkb01C?=
 =?utf-8?B?ajhJSzJlVzJMSnQyUU9UOFB1WlVhcHNoYjZlRkdDMGUvM2FxT3MvRVdSMnhj?=
 =?utf-8?B?L2JkZzYyUVArWFFtbmhqWlFpeHFXdW1CaXdHVnhoR2ZzR2FyUDBkcHVLZG9B?=
 =?utf-8?B?SUs4OVBheEtZVVFSOFJCanFoOStPYVZ4N1FNby81aVJ4OG1RSTRpamFNcTdH?=
 =?utf-8?B?cTh0SnFyQ2JsZm1ZWDRHU2V3MjBPNE5Sd0pORE0zWVEyMDR5WDlzY2Rsa2Nx?=
 =?utf-8?B?OGJUb0ZSa3c2a1NsZU05ckViMXpPTzZCTVdaSk9UbjNnSXRUcXlJcThqNWEy?=
 =?utf-8?B?TS9Kbk50aVRDQ0xPKzhhOE0xbUhhNkNTQ0VKSUg2SXBITTZiaVl1bjNiV3ZG?=
 =?utf-8?B?czRwVkg2eXVuK0RxZ3VHU3VWZCtVb1QyZDdscGtMWldVREJsMU5nTEdmbmxT?=
 =?utf-8?B?dUg5dm13ay85aFJwWWdxaDRrc1F0MjhGckFpNCtMVmtONG9kdkgvOGNVZFBD?=
 =?utf-8?B?S05WYU1XWUJaVkxXMW5UVTA5SVVkUlFrNmlNS0p4bzBMeTdlS3BLRnR2bi80?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ffe3db-c9e4-4f39-6189-08de05ad2dc8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 14:24:09.1586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v6NDDQrVAj/DpBSYbKcK7Ae4Wkf913PVnrnr3siUkG/WaUPWG4d/KWLcn+MkavMUNew56tNOU6rAS/ZuHVliNVd1/3spnyqMjrn+0h6o2VM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9454
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



On 10/7/2025 3:04 PM, Matthew Brost wrote:
> Before RESFIX_DONE, all CTs stuck in the H2G queue need to be squashed,
> as they may contain actions which contain invalid GGTT references or are
> unnecessary after HW change.
> 
> Starting the CTs clears all H2Gs in the queue. Any lost H2Gs are
> resubmitted by the GuC submission state machine.
> 
> v3:
>  - Don't mess with head / tail values (Michal)
> v4:
>  - Don't mess with broke (Michal)
>  - Add CTB_H2G_BUFFER_OFFSET (Michal)
> v5:
>  - Adjust commit message (Tomasz)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  7 ++++
>  drivers/gpu/drm/xe/xe_guc_ct.c      | 59 ++++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_guc_ct.h      |  1 +
>  3 files changed, 54 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 1575ffaaaf52..675bb0d43343 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1128,6 +1128,11 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +static void vf_post_migration_rearm(struct xe_gt *gt)
> +{
> +	xe_guc_ct_restart(&gt->uc.guc.ct);
> +}
> +
>  static void vf_post_migration_kickstart(struct xe_gt *gt)
>  {
>  	xe_guc_submit_unpause(&gt->uc.guc);
> @@ -1179,6 +1184,8 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>  	if (err)
>  		goto fail;
>  
> +	vf_post_migration_rearm(gt);
> +
>  	err = vf_post_migration_notify_resfix_done(gt);
>  	if (err && err != -EAGAIN)
>  		goto fail;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 503cf5cb5d33..d0666d6d12f8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -502,7 +502,7 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct)
>  		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
>  }
>  
> -int xe_guc_ct_enable(struct xe_guc_ct *ct)
> +static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  	struct xe_gt *gt = ct_to_gt(ct);
> @@ -510,21 +510,28 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  
>  	xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
>  
> -	xe_map_memset(xe, &ct->bo->vmap, 0, 0, xe_bo_size(ct->bo));
> -	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> -	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
> +	if (needs_register) {
> +		xe_map_memset(xe, &ct->bo->vmap, 0, 0, xe_bo_size(ct->bo));
> +		guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> +		guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
>  
> -	err = guc_ct_ctb_h2g_register(ct);
> -	if (err)
> -		goto err_out;
> +		err = guc_ct_ctb_h2g_register(ct);
> +		if (err)
> +			goto err_out;
>  
> -	err = guc_ct_ctb_g2h_register(ct);
> -	if (err)
> -		goto err_out;
> +		err = guc_ct_ctb_g2h_register(ct);
> +		if (err)
> +			goto err_out;
>  
> -	err = guc_ct_control_toggle(ct, true);
> -	if (err)
> -		goto err_out;
> +		err = guc_ct_control_toggle(ct, true);
> +		if (err)
> +			goto err_out;
> +	} else {
> +		ct->ctbs.h2g.info.broken = false;
> +		ct->ctbs.g2h.info.broken = false;
> +		xe_map_memset(xe, &ct->bo->vmap, CTB_H2G_BUFFER_OFFSET, 0,
> +			      CTB_H2G_BUFFER_SIZE);

nit: maybe we should say somewhere, that in case where there were some unprocessed H2G messages by the source GuC, this "0" above will be actually treated by the destination GuC as CTB header message with 0 len message payload, so it will be hopefully silently consumed by the GuC up to the retained HEAD/TAIL pointers

> +	}
>  
>  	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
>  
> @@ -556,6 +563,32 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  	return err;
>  }
>  
> +/**
> + * xe_guc_ct_restart() - Restart GuC CT
> + * @ct: the &xe_guc_ct
> + *
> + * Restart GuC CT to an empty state without issuing a CT register MMIO command.
> + *
> + * Return: 0 on success, or a negative errno on failure.
> + */
> +int xe_guc_ct_restart(struct xe_guc_ct *ct)
> +{
> +	return __xe_guc_ct_start(ct, false);
> +}
> +
> +/**
> + * xe_guc_ct_enable() - Enable GuC CT
> + * @ct: the &xe_guc_ct
> + *
> + * Enable GuC CT to an empty state and issue a CT register MMIO command.
> + *
> + * Return: 0 on success, or a negative errno on failure.
> + */
> +int xe_guc_ct_enable(struct xe_guc_ct *ct)
> +{
> +	return __xe_guc_ct_start(ct, true);
> +}
> +
>  static void stop_g2h_handler(struct xe_guc_ct *ct)
>  {
>  	cancel_work_sync(&ct->g2h_worker);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index f8370fa4727f..ca1ce2b3c354 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -15,6 +15,7 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
>  int xe_guc_ct_init(struct xe_guc_ct *ct);
>  int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
>  int xe_guc_ct_enable(struct xe_guc_ct *ct);
> +int xe_guc_ct_restart(struct xe_guc_ct *ct);
>  void xe_guc_ct_disable(struct xe_guc_ct *ct);
>  void xe_guc_ct_stop(struct xe_guc_ct *ct);
>  void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);

besides the nit above, now LGTM

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


