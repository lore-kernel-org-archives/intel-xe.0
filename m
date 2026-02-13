Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7F8EF99D3
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 21:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC6910E319;
	Fri, 13 Feb 2026 21:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XV9wZ3or";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A87F10E319
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 21:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771017447; x=1802553447;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JS9jY7ikEk7GSmunMtYu16JsxjxKZ61eH0A9dteeP8w=;
 b=XV9wZ3or6zADKF9tg8GECa6dl5swyDIl65pFpTtNdLQ6atxRsUGErifi
 kcTEPSF8WVujfT6NQJ6fBivci7GU/nTJbJrvp/yfK4dLTGvEEkVggcr5A
 qlGif8fPKtHCZ4EcdD7oxMayLfPpaVPwqy10ZSbycv17O8Tq4NiD9Gir0
 WgtB8icMOsz169zCfAZNjPrt9BRMJtNLXGrODKMG+nlZqlQRnUZjg4tvZ
 QlT7cCNtjsbI5QlHL0HqsEwEb153io+ZDd92BaSlgjQEuwSs1IkHpdaAI
 xzry65Nt235/1jwzYa2wIt1Gd9WsIXM/dNXsnikkU3dXrmQ4ejGJVBE0E Q==;
X-CSE-ConnectionGUID: gkeGeMTNSdSmf3Wzzi1Nxw==
X-CSE-MsgGUID: ttYW2fIdRP2bG8E/lq6Z7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="82932698"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="82932698"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 13:17:26 -0800
X-CSE-ConnectionGUID: lvIWqA4eTzCphANj2rFVDA==
X-CSE-MsgGUID: CJtvnJROQ0OyidN/OENnkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="211912060"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 13:17:26 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 13:17:26 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 13 Feb 2026 13:17:26 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 13:17:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vayhr2UvoSRirCZMAtwGbYL/scEIqEbgx//nKA+gXi58KeFDoZgBKn/A4FtfStWWkbljXEXXdNtIyXvcHly0OQCCQmuxZUP2ZluxoW6nXEKaEzr/Pp8HvVWbga5mPt0kAwh6a9OBqx9xct/Ff0C2t3vPxq4r3qfw2XD9S2kYtI+qFSU5AB542VzC3d5IUeMaqXZz2dZbN+QDKjhtCcMRQQwBt7uxiwrO5ML7tdC6R2oEHq0oPqEvsPSTJ+gbHA0pSmqgf0wID0Jtjr6Bq+k7e/F/+YYOl9drosEYUB2kg4FgZKAHXkhdRRDAMlJw/X2jcnH7UBDy/kCj52TWMGVXuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yObQIZT/5fh0SDQGWthAo3KY7D2ZtQ/Q4NdYJAZu3V0=;
 b=wXscZJ4q1Tbnv3M2zZkSZfMA5ZcWg+0kPoxGiuQ+HKBnvELnOspVCMhwQ+4gjvxawOz6fSMocJ89QhbPok0uEC5jhsKIXCuLGW7+EkmJGxWPKdd7MEAHHk5+mSW2VTWqMdIs77XtWDeqCycmTQl8md//4wLidiNhQgaqw8BufzoFjo/cIAGiJyFZ64zEUcP5rFmEdZLInS39DigrhNY1LzNMizzoG68rub5/LY1Q8uuYdpoOhfHlSBBuFquxEQY1WCMvEhpOqYRCydoTat3Gt8NRqNGDp1swtA0UxMkBHLO/YibiJGiWcBJ8B7cczCtk+wUdVyX+avqdP2YRaw47SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS0PR11MB7801.namprd11.prod.outlook.com (2603:10b6:8:f2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 21:17:23 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 21:17:23 +0000
Date: Fri, 13 Feb 2026 13:17:19 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <francois.dugast@intel.com>, <daniele.ceraolospurio@intel.com>,
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Split H2G and G2H into separate buffer objects
Message-ID: <aY+U3x8a9wV+Ajw5@lstrano-desk.jf.intel.com>
References: <20260213205043.3111176-1-matthew.brost@intel.com>
 <20260213205043.3111176-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260213205043.3111176-2-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR05CA0206.namprd05.prod.outlook.com
 (2603:10b6:a03:330::31) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS0PR11MB7801:EE_
X-MS-Office365-Filtering-Correlation-Id: 9198ead1-4237-4a64-6a0d-08de6b45476f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDR0UmVFU2haN1pXN3dDTWlVQVJoeWwxQ1FQYjFJOGdMNXlLSUM2NTlpbXor?=
 =?utf-8?B?bGdJS1dlVGp0dlZxTytHMmcwd1UxQ1VtY2phK0o1a1kxUEUrbXBwcFZpT2U0?=
 =?utf-8?B?T3EyRGwxTGR2bzNRc29BTUJWWEJ5YngvOXVRMjlDcERXb0RvK1lwWXppbzM5?=
 =?utf-8?B?MXJmNVBHLys4Njk1cEFrbmd4Ri8xbGtVUUJ5eWpUa0ZyRVQrQW5QTnlBSWth?=
 =?utf-8?B?Y1JoTERZU0pEdWpQS1ZxUFZ6MGQzNXFLd2VHWjE2UVlIWndRM1pKQ3c0eXFu?=
 =?utf-8?B?bnF4Njl5d0dPYWhFQ0ZCMkQ3ZTdGTThjbzdLVjBHQU5aTEdYVXJqWUlXQ2ZE?=
 =?utf-8?B?QkF2cDBsMVlhNTJTdGFBR1JjOVJ0RFVJUFZ0QU5RR1Fuai82eHUrRkg0OTc5?=
 =?utf-8?B?bGw0ZWN0R1RTVDcwNTJxaE1GdURSWVZoK20wMVhmcjh5bGJvNm1Eekt1TGlY?=
 =?utf-8?B?Rm5NR3N1bjcxekNVN3BqUlRxNlV3VWVaaU54TVZCRWZxbGNOS0JLejZFOHRB?=
 =?utf-8?B?TUxtYncwcFBLRTA4b2w1VkxUb1JtaEdDdFZPQ1NKL1owUllpbGUzOFpKVlNy?=
 =?utf-8?B?cHdnR2RVbStha0xyL1ptdkxtZ0pRWE5uSDJac3NWRTlmNjN6eDROdnV1UWJl?=
 =?utf-8?B?MnVHbitOV1M0VFRDcnZ0K1Q5THJ3OHlTT1c5eG9McEJscWpsUGNQUVkyMkUz?=
 =?utf-8?B?cUdqbDIwZVBvQjAzTHdqc1J3c2swWGJVeEZYUmtTNDU0ZDYzeGRORm1hRHN5?=
 =?utf-8?B?K240OFVEVVFydEgyakZUNS9iQmo3RlFPeFlOeXkvR0hnbE1maUFmMVF2cmZx?=
 =?utf-8?B?TExXWnhOcy9DM1pON0YrRFlhYlNLSHdFdFlWL3FhUXVHY0tEVTBRTzJZTFlw?=
 =?utf-8?B?bnVCWnNYdUdPdk1HUGlCcDBobGp0a25nQXlzME4wd1RoV0dROGtvWS83aVJG?=
 =?utf-8?B?ZisyK3ZScmptaVdZSzBMNmpiaGJqM1M5blhiUnRpSVRBR2NjZlJOSHZZWnZG?=
 =?utf-8?B?LzNxTVJrTkVHNk9mdC84OEIzUXRwZVZoMUlEM0xyZ1d1bFZhRCthSUxqRzJv?=
 =?utf-8?B?MVJJUVhNT0UvWEZZaTBNcHR6Z1ZtbXpIbTJnV0xYL2VZNHRMem9wRmk4ZWR2?=
 =?utf-8?B?Mmt0Qng5Y1E4Q3VraHdySnBVRU1yalRSc2o3MEVadkEvTkVNdy9MbDgyNHYv?=
 =?utf-8?B?RVl6QnovZ3cvSEp5eXg0UFF2cHFVSmx5cmZhNFpFb3ZIYk9ONlJTVmMvMjQ5?=
 =?utf-8?B?TW05QThhWVJQdENHbTZMZHBlYkR1MmZHendmeThNemxoeWtUeHdKTUhSQmtl?=
 =?utf-8?B?b3V3MG1vNFM0bnU0YVpyMjlaUkh6VWRMZ2tlSzBOZVhnSG9ZMXNMU3dLYk5M?=
 =?utf-8?B?bDBwVmd4Vlp1MmJiZm1RTDcxclc5VHRyL2RCTjVhVG1ydklUV2pDS1RXazlu?=
 =?utf-8?B?dFZlak9oQ1pDeUNFRGZadjUyc1lTd0E2NUVodWk0bVh5UnQ4NDYvbGxHMlFt?=
 =?utf-8?B?WUtYREZ1NHlCYUZsNUppMHNFR3BnM2U4MXVpM2pjb3I0TytqZEppaEhIWWN3?=
 =?utf-8?B?bzVVcjlSdGZRNXEvTmZYOWtnckRWSkpZQ1J2SjBycVFKdmRTMjNIMEFWRXdF?=
 =?utf-8?B?YkYwNVY3UDJkVnYrZEJSTVd0V1preHA3SnVmSGRaQ2xYbXlvb0lkVThFalQ5?=
 =?utf-8?B?dG41V1N1SlNTMm1nUW95SzA5dnFnQlV2T05nZDg3S0pLZ2FVc1RjeitoT24x?=
 =?utf-8?B?T204MHlnL2VKZmJ1N0RCd2NrU0tYeGZHS3ZwWTFuaUp4UjBNcU1FSVU4eWJB?=
 =?utf-8?B?LzZ0elRwSWkwRktsL0h0aDRkTE1Sbk1KRGpOQkRyOGZGZVFtRDJQRWlPdGh2?=
 =?utf-8?B?MEFjcnpNa0tBdmYvV1NkZTd0UE01djRIbHRIdmlzNkZtMXRlN3htUloyREFI?=
 =?utf-8?B?dXEzRkc0SGZMLytCM2Q5K0lMR0ZhWlU1dnloQXVmenVyU3ZuVm1maWtIcElO?=
 =?utf-8?B?elB5Sy9nS2JCRWFwZ3lkS0FGdDZGa285NnJpeElKL2ZPVG9DUTdEdjlwcERX?=
 =?utf-8?B?RW4zMGVVR0dRZ2d1RkEwdE1LSlRrZmlZTWhFYk4wVFIrYmQ4NEs5ZG5YcjUx?=
 =?utf-8?Q?5FFI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjJOSU04M2RjeUJ6cGxEb0wyUlNISVF2QnpubEpidms2bUNrc0p3bittNVBJ?=
 =?utf-8?B?bWZVeFh3d1Znb0RieEhTWFZmTUNhQjNNYldpSlYzeUZBclBOdzBaWUZQV0s0?=
 =?utf-8?B?UFFDVElxS3Z1aFIzU25iMmk0MUlMclA5SGFhTGNXS3hEdHp1cWNqTHhzVitL?=
 =?utf-8?B?NHQ5VjBWdGpvZGRWQmNkQkt1d2puZWM2SUVxZFJZQUJNUm01WWxhWGMzbVE2?=
 =?utf-8?B?Qlc3WE1Sb2tscitaYnN6M3RDUnJ4MWNjWFpLTUFEY2pIQk1Xaldxc2NsLytT?=
 =?utf-8?B?NHFwVkxIZWlQK1gvc1BjOWhJK0RTVDRmVTVkR1RGTkVGVDlZZXNTUkZHTXRQ?=
 =?utf-8?B?RjZOVE4vcWwzQkI3N21VckZtWWVLaEk4WnI2cWNyNzcvU2dUKzZLN3F2clBB?=
 =?utf-8?B?YzFiTDlQSGJoS3BLSlIvL2VtVGFlMzJoZUMrV1l0Y2NSYmZ4R04wL0FXY211?=
 =?utf-8?B?SHVpWXN4NEprOEI3aXNENkljSUFvRGQ2MmNvc01OcXdmZFZMVWl6OUg0bVl0?=
 =?utf-8?B?UHR2MVZHK0xEQXNwVjhaQlNUSS85eWg3WDZqcUEvTzB4T3ZkcXlNbDBDZXlu?=
 =?utf-8?B?eU5ud0p3OU9sNXEwbkkrTEVaM2ZhMkIwNDUzZTlvaTlWMzR2QjBlUmEyZnZ1?=
 =?utf-8?B?REZEOVlid3daQ21xdzYrTE1BUTQ3ZVV0a09lS1c4cklXWU5qb290eHdOWmNh?=
 =?utf-8?B?ckgyekVNWVljbVNjbFhsVllCbHBBLzVKeWV3a092anMyR3dBRjdzSlRHVUlh?=
 =?utf-8?B?N3E1a2l2eEJyT1BuMVQwa2lqaENxSFA2UzgxZWNqUlhkbFpKUDZvNkJ5S0ln?=
 =?utf-8?B?Mk9IejlyeElYRkJhL2NReHdDRDBKQ1NqRTJCRmxmT0JhTDZGNG5PSFdtUW84?=
 =?utf-8?B?TTdPN1k1bE51RWIwVFhqSHh3cFRiY2ZkRkpjOE5WWU5CZzI2Z0NCV2xoanRP?=
 =?utf-8?B?MUhJQmZRbFNMajBieEp3dEVFYThWU0J0WWdZU0d3cXdzUUpuWk5ocjQxaUYx?=
 =?utf-8?B?UFBwbUE2REJwd1doditLR2JCc21kSkhPdnJqU2xKa25YRnh1TjV1aHRaQ29L?=
 =?utf-8?B?Mmc1WUQ0eklLT21hSnVJY1YxL2VzMlpsY05DTFp6LzB2YWIwZFFGRU91aG5o?=
 =?utf-8?B?d2w5TzNtQkpxcU9XUjU0S2l6L2FMVkZHb1oydG1BMWFFZXZ6Zng1Y0lRY0FT?=
 =?utf-8?B?MXhaNDF6WFMxRll2T0V2Nk8wOTQveUpmbVJLb0k4bVQ5ckhvQ1RuK08wYzIv?=
 =?utf-8?B?REdReWFDczBoTWhzUUpXb2V0cElJTmRYOWRBaUN4S2VzZWg1RFBRN08zeldR?=
 =?utf-8?B?Um5DdDZzUU1nMStMcFpzMStFelM4eENPY3UvVDBXUlBxTkZnZU5Fek1aaENX?=
 =?utf-8?B?ZjNWby94NWNad2d3Y3NQL3ROSWw0a09hWWQvSVB3MkR1VitkcmxsZmJDWmIz?=
 =?utf-8?B?akdkQXAzNmVBWUFPeUdpU1FidGZiSHF5alZQS0FhRWN4Q2dRcFZBdmloVlB1?=
 =?utf-8?B?L3hHTFJDZVI5YWNNdHVOdnRxSWkrTlJvdjZITy9MTjJOa1dJVkUyaW1GSHph?=
 =?utf-8?B?dmhGeG4xY2toMjdPeHhVWXlXbnlzeUUxcHFKS2ZPYkxyeGl6OHFlOGduS1NU?=
 =?utf-8?B?UWlWQi84bzNKSHR5ZG9HTmJQaGZpZ3I4WWRuRjlpaGZ0K08yU08rTFVYaGI4?=
 =?utf-8?B?NEE0K2tuc21VLzIxaXErZW5hWTExLzlCWG52VGhUa2JwMGJYMWpqa0ptQ0t2?=
 =?utf-8?B?aVBEOERoMGxlNyswUnZ0MmZtU0N3L3NDeHFjNWZjZ3g2dEsyM1lPaHp3dWs2?=
 =?utf-8?B?UjhXQzRkc0NmSThXS1BCQU9KNGdRSXFxcUxJUTU1UFhtd01BZWFzbmhTWFZo?=
 =?utf-8?B?aHAreG9ETG1nTzZ6dUlFYWRzalF5bytQVm9MaFdlbk8za3VvQ3lvRWliQ0Iv?=
 =?utf-8?B?bmZKMXFvRFB0amwyd2QwcEV3dDl3N2ZYTTI5cnBaalVEU0xWeHZzNm5LQzJF?=
 =?utf-8?B?VXR1Wm5qMUYxWVh0bEdCR3RkaTk5NHIrTG1wTlFmL3Y2VFVJbzBIWlQ0Uk1B?=
 =?utf-8?B?U001UnN3SzdudUt2cjhDS1JCUWpXL3hJc0FBTnlyR29FWVBVOEhtMXhvU25H?=
 =?utf-8?B?NGVBQ2J0NVBIZUVBWThMN1FnbHBnUGNJMkF4K3FBY3VVZXcwS2lONEtCcUV2?=
 =?utf-8?B?TmpkYmE5M1h4eTIyeVlOV1pRTFF0b0h5K1p0VEFYL3VDV2lxdE9BQUJsbzBC?=
 =?utf-8?B?K1JMMkdtdVpNb2ZLeXh1aVJ0OGVZd0hQRG9hSXZTMldVbzV0Q0pNWXFLU3JU?=
 =?utf-8?B?WXQ1VkZXT1BXNURFWW5iQmh4UzFCeGZsK2FWOExjS0JCVVJ1TVFYTmJueEdK?=
 =?utf-8?Q?FORVnL71WqsqvQkc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9198ead1-4237-4a64-6a0d-08de6b45476f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 21:17:23.0109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ZZGQfn2G13jZOFhEDG6uJDRduVOC8tmalsz7ixh9OTHK5j3YX3b1oMQx99BjnNoq6x9OiNDA5Bzw925q4DK3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7801
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

On Fri, Feb 13, 2026 at 12:50:42PM -0800, Matthew Brost wrote:
> H2G and G2H buffers have different access patterns (H2G is CPU-write,
> GuC-read, while G2H is GPU-write, CPU-read). On dGPU, these patterns
> benefit from different memory placements: H2G in VRAM and G2H in system
> memory. Split the CT buffer into two separate buffers—one for H2G and
> one for G2H—and select the optimal placement for each.
> 
> This provides a significant performance improvement on the G2H read
> path, reducing a single read from ~20 µs to under 1 µs on BMG.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c       | 66 ++++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_guc_ct_types.h |  6 ++-
>  2 files changed, 48 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 8a45573f8812..5d8d90a4f879 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -255,6 +255,7 @@ static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
>  
>  #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
>  #define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
> +#define CTB_G2H_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
>  #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
>  #define CTB_H2G_BUFFER_DWORDS	(CTB_H2G_BUFFER_SIZE / sizeof(u32))
>  #define CTB_G2H_BUFFER_SIZE	(SZ_128K)
> @@ -279,10 +280,14 @@ long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct)
>  	return (CTB_H2G_BUFFER_SIZE / SZ_4K) * HZ;
>  }
>  
> -static size_t guc_ct_size(void)
> +static size_t guc_h2g_size(void)
>  {
> -	return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE +
> -		CTB_G2H_BUFFER_SIZE;
> +	return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE;
> +}
> +
> +static size_t guc_g2h_size(void)
> +{
> +	return CTB_G2H_BUFFER_OFFSET + CTB_G2H_BUFFER_SIZE;
>  }
>  
>  static void guc_ct_fini(struct drm_device *drm, void *arg)
> @@ -311,7 +316,8 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
>  	struct xe_gt *gt = ct_to_gt(ct);
>  	int err;
>  
> -	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
> +	xe_gt_assert(gt, !(guc_h2g_size() % PAGE_SIZE));
> +	xe_gt_assert(gt, !(guc_g2h_size() % PAGE_SIZE));
>  
>  	err = drmm_mutex_init(&xe->drm, &ct->lock);
>  	if (err)
> @@ -356,7 +362,17 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_bo *bo;
>  
> -	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
> +	bo = xe_managed_bo_create_pin_map(xe, tile, guc_h2g_size(),
> +					  XE_BO_FLAG_SYSTEM |
> +					  XE_BO_FLAG_GGTT |
> +					  XE_BO_FLAG_GGTT_INVALIDATE |
> +					  XE_BO_FLAG_PINNED_NORESTORE);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
> +
> +	ct->bo_h2g = bo;
> +
> +	bo = xe_managed_bo_create_pin_map(xe, tile, guc_g2h_size(),
>  					  XE_BO_FLAG_SYSTEM |
>  					  XE_BO_FLAG_GGTT |
>  					  XE_BO_FLAG_GGTT_INVALIDATE |
> @@ -364,7 +380,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> -	ct->bo = bo;
> +	ct->bo_g2h = bo;
>  
>  	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
>  }
> @@ -389,7 +405,7 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct)
>  	xe_assert(xe, !xe_guc_ct_enabled(ct));
>  
>  	if (IS_DGFX(xe)) {
> -		ret = xe_managed_bo_reinit_in_vram(xe, tile, &ct->bo);
> +		ret = xe_managed_bo_reinit_in_vram(xe, tile, &ct->bo_h2g);
>  		if (ret)
>  			return ret;
>  	}
> @@ -439,8 +455,7 @@ static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
>  	g2h->desc = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE);
>  	xe_map_memset(xe, &g2h->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
>  
> -	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_H2G_BUFFER_OFFSET +
> -					    CTB_H2G_BUFFER_SIZE);
> +	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_G2H_BUFFER_OFFSET);
>  }
>  
>  static int guc_ct_ctb_h2g_register(struct xe_guc_ct *ct)
> @@ -449,8 +464,8 @@ static int guc_ct_ctb_h2g_register(struct xe_guc_ct *ct)
>  	u32 desc_addr, ctb_addr, size;
>  	int err;
>  
> -	desc_addr = xe_bo_ggtt_addr(ct->bo);
> -	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET;
> +	desc_addr = xe_bo_ggtt_addr(ct->bo_h2g);
> +	ctb_addr = xe_bo_ggtt_addr(ct->bo_h2g) + CTB_H2G_BUFFER_OFFSET;
>  	size = ct->ctbs.h2g.info.size * sizeof(u32);
>  
>  	err = xe_guc_self_cfg64(guc,
> @@ -476,9 +491,8 @@ static int guc_ct_ctb_g2h_register(struct xe_guc_ct *ct)
>  	u32 desc_addr, ctb_addr, size;
>  	int err;
>  
> -	desc_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE;
> -	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET +
> -		CTB_H2G_BUFFER_SIZE;
> +	desc_addr = xe_bo_ggtt_addr(ct->bo_g2h) + CTB_DESC_SIZE;
> +	ctb_addr = xe_bo_ggtt_addr(ct->bo_g2h) + CTB_G2H_BUFFER_OFFSET;
>  	size = ct->ctbs.g2h.info.size * sizeof(u32);
>  
>  	err = xe_guc_self_cfg64(guc,
> @@ -605,9 +619,12 @@ static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
>  	xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
>  
>  	if (needs_register) {
> -		xe_map_memset(xe, &ct->bo->vmap, 0, 0, xe_bo_size(ct->bo));
> -		guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> -		guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
> +		xe_map_memset(xe, &ct->bo_h2g->vmap, 0, 0,
> +			      xe_bo_size(ct->bo_h2g));
> +		xe_map_memset(xe, &ct->bo_g2h->vmap, 0, 0,
> +			      xe_bo_size(ct->bo_g2h));
> +		guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo_h2g->vmap);
> +		guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo_g2h->vmap);
>  
>  		err = guc_ct_ctb_h2g_register(ct);
>  		if (err)
> @@ -624,7 +641,7 @@ static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
>  		ct->ctbs.h2g.info.broken = false;
>  		ct->ctbs.g2h.info.broken = false;
>  		/* Skip everything in H2G buffer */
> -		xe_map_memset(xe, &ct->bo->vmap, CTB_H2G_BUFFER_OFFSET, 0,
> +		xe_map_memset(xe, &ct->bo_h2g->vmap, CTB_H2G_BUFFER_OFFSET, 0,
>  			      CTB_H2G_BUFFER_SIZE);
>  	}
>  
> @@ -1963,8 +1980,9 @@ static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bo
>  	if (!snapshot)
>  		return NULL;
>  
> -	if (ct->bo && want_ctb) {
> -		snapshot->ctb_size = xe_bo_size(ct->bo);
> +	if (ct->bo_h2g && ct->bo_g2h && want_ctb) {
> +		snapshot->ctb_size = xe_bo_size(ct->bo_h2g) +
> +			xe_bo_size(ct->bo_g2h);
>  		snapshot->ctb = kmalloc(snapshot->ctb_size, atomic ? GFP_ATOMIC : GFP_KERNEL);
>  	}
>  
> @@ -2012,8 +2030,12 @@ static struct xe_guc_ct_snapshot *guc_ct_snapshot_capture(struct xe_guc_ct *ct,
>  		guc_ctb_snapshot_capture(xe, &ct->ctbs.g2h, &snapshot->g2h);
>  	}
>  
> -	if (ct->bo && snapshot->ctb)
> -		xe_map_memcpy_from(xe, snapshot->ctb, &ct->bo->vmap, 0, snapshot->ctb_size);
> +	if (ct->bo_h2g && ct->bo_g2h && snapshot->ctb) {
> +		xe_map_memcpy_from(xe, snapshot->ctb, &ct->bo_h2g->vmap, 0,
> +				   xe_bo_size(ct->bo_h2g));
> +		xe_map_memcpy_from(xe, snapshot->ctb, &ct->bo_g2h->vmap,
> +				   xe_bo_size(ct->bo_h2g), xe_bo_size(ct->bo_g2h));

Logic bug...

xe_map_memcpy_from(xe, snapshot->ctb + xe_bo_size(ct->bo_h2g), &ct->bo_g2h->vmap, 0, xe_bo_size(ct->bo_g2h));

Ignore this rev and skipped CI.

Matt

> +	}
>  
>  	return snapshot;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> index 09d7ff1ef42a..385a607e4777 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> @@ -126,8 +126,10 @@ struct xe_fast_req_fence {
>   * for the H2G and G2H requests sent and received through the buffers.
>   */
>  struct xe_guc_ct {
> -	/** @bo: Xe BO for CT */
> -	struct xe_bo *bo;
> +	/** @bo_h2g: Xe BO for H2G */
> +	struct xe_bo *bo_h2g;
> +	/** @bo_g2h: Xe BO for G2H */
> +	struct xe_bo *bo_g2h;
>  	/** @lock: protects everything in CT layer */
>  	struct mutex lock;
>  	/** @fast_lock: protects G2H channel and credits */
> -- 
> 2.34.1
> 
