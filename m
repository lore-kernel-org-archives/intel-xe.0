Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092D1E77184
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 03:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B153110E278;
	Thu, 19 Dec 2024 03:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ur7PKCUA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF0110E278
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 03:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734579707; x=1766115707;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ridk/OCQmIbwG/KmdlystU4Jgt5POPCsQNYZ2uLkgDU=;
 b=Ur7PKCUANzgOjx7D0eUo//hBUB+KHG4k1bxL861ILI0OR09fZLTcCSOQ
 kqIhiEaCQUbfXLbBf6IRl3Wa5112PRH2sZQgwq8eXr1VCfdPrfHHBuiDW
 3tQxJMw/0HBoO+9tz3i1lsTuaM4RkkeITjdn+1Dht/lfrcJOApsKPpy7V
 1jdmGd8SLPaJnAFeZqrdoTifeLReDChdHuOBtfi5vNXNP1JM2n5RrQflA
 8HRFSIEOO31uU7gqxNTgk8NpSiItlFIfuVdXEEOwIG3Rz7rc47ipEq8fk
 WSKwXCtoavcmrA43pHj+98j1AV5mP+5/xCGTHevZcAZ2+LNNaS6SEapj2 Q==;
X-CSE-ConnectionGUID: 6McEgrAiQlK6jMd0ruUmSw==
X-CSE-MsgGUID: ec5AFHulRjatuFejGIVxIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35206837"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="35206837"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 19:41:45 -0800
X-CSE-ConnectionGUID: +5SJpuRmRTCJ+kC4jMWHgA==
X-CSE-MsgGUID: UFHhtbkNQkuMZv8DS3k8zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="98126389"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 19:41:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 19:41:44 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 19:41:44 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 19:41:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=notq95ptq+i6P1K7U+ExkEUZiEQ+rWLqi8d5YZB4tgkUTv8nfGmM/MVsc7DM6tiYM/oinqa5pG5EhMbHN2T5PzeN3kz80r3lBYxJXXi6ru22aYzxMewcpZzcW/aV1VukIqiQDMiIQAtl/RYlEw7PC0VQKFA2UoBr4Ea7VHEMuEN5yHIwkQpIbBV/5TotOYdc72Xjl8FMsar4Xj3/s+tqab017Bi/XOunLvTSvK0rnTZKCw6EwGaG7kXfpz87fYHi/1vNJ1twgCRR397IDLj329M+aYipUNu+rzzwMK2X0h76o5W87JraXB2BUUf35hYyAMcc2A/j5wQjUhdUPrcP/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpKuv8SLGKmsNuzuvDp7hs5x5EX9v/aiv2nXd6RjWhE=;
 b=WmRKK+9sbZ21AQa+766EbM2e8/AhnGqgEmBoyijMSJEp4gTj5Q66DB8Dtej/LkPATfFn+o4TtjLsB5g1IZJtdmJk00XmBfLsVSx/PdWZltiOlE97IZ3VRgTTIxDNs86lP5zxw+FHwGz1PekzkA/C6pn8yEpMRNBpFDdzT9XsE5BB885APYsSnLePuw+Pt5RDy4diCL04PtYHAk9DVfwwnl1/e21yviRCYu0F8SwZKmYD37Tfdte7ufKrYSl1froxqvSehiBsu8LdXGBiDqJgD2nBeOZ17tssB1q/NwnUMb/OlkjgmfnFOQf+VNkPksDwRlF15fQ43Ioe2gQnYSQFWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by BL1PR11MB5301.namprd11.prod.outlook.com (2603:10b6:208:309::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 03:41:37 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 03:41:37 +0000
Message-ID: <8589c55c-6442-49d0-ac48-a6c56836a130@intel.com>
Date: Thu, 19 Dec 2024 09:11:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/slpc: Remove unnecessary force wakes
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20241216194119.3017792-1-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241216194119.3017792-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::21) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|BL1PR11MB5301:EE_
X-MS-Office365-Filtering-Correlation-Id: b3f37810-b123-4395-95e1-08dd1fdf0a3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0tLQUdGSTJHZTR3RERzUnFUd2krSjdiWHoxdVVQcmFNZWkxR3RkS3Rjbk9i?=
 =?utf-8?B?MXdRdnNvYy9sbzVhdFZjVE5oc1QrYzZtNUEwVVRIR3laTEs2UGd1WHVSYnZC?=
 =?utf-8?B?dlQ5ZGlxbkZoK3ZaOTRNY2JMMG5jdTBycWh0UGZ2aWNSYmxOR04yQ2F5N2ZU?=
 =?utf-8?B?bTNHM2pVUWkyUW50Z0RUcUd5dEV6akRlcmxKdEJDWUdqMkZaWUI3UUwydnA5?=
 =?utf-8?B?N1Z4OUZtZjdIVkhXUXNwWkZoeTYzbm90am1wYWd4VkNKL3d0ODBLeklRb2l3?=
 =?utf-8?B?bURIVGdBd25JaUoydHJaYUVhWkQycC9qK2dnT0wveXJkcHBwbERMVndXeTFr?=
 =?utf-8?B?NjBlQUNHR09uZGhuQzZxU1NCQWlyUTVlcWpLUVUrUTViZWtzSFRJelpCNXd0?=
 =?utf-8?B?V3ZvVEI5V2JENlRvNis0aTkzUURtUjc3NytFOFprQTNtVy9GSUttNUc4NVdP?=
 =?utf-8?B?OG5YUXZtNTc0dW9rQ21XN0dVRlJ4OWlIakJHOEZmQ2M5WGp5RDFBWGR0TmJ1?=
 =?utf-8?B?Q2Z3M21QYkc2NGtSR1B3Q01EMHo3ZlpSUlI1K055MjJtTHRNTzlGdVBmaCt2?=
 =?utf-8?B?OXVsa2E5NnVxdVZqMzJuT2dBVHY0clpZdm13RWpGcmJtVjhwQTI2Uk9sODBl?=
 =?utf-8?B?bjg1ajBvemNwSk9reEdaWHA0TGtRczdiN2wyeU43M0R0WERxVWMxN2ZjUll0?=
 =?utf-8?B?VE5uUDBkMkxROFpqQ2dpVzhPcCtXeWc0NGFXUlpaYU9VVGlwaityKzBabkJN?=
 =?utf-8?B?aVpoWFU4SUF6MzVQanhDV2VDWVRmV0Q1QlMrTmxqL0VNbFFBS0I4YzVKcis4?=
 =?utf-8?B?MTVyQ2pLMkpjQVBFZmlXaVBmSURIUE1iVW1GN0xva3lnMWVXNmNzYVdNdmtw?=
 =?utf-8?B?Z3F1bW8xRHYwNHNNNjZWSTVLYjVjUkFXNXJRY2tuRWJ3ZGpoQ0twSVE2WVVB?=
 =?utf-8?B?a1ZqZDl4cGRHL3RXZVlCQmpyeHpaTGg1LzZDV2pUNFZMUmV5WkdVUUlucTVC?=
 =?utf-8?B?b0VsWThNVEExRU1YUVdKWGhrcTdiL3VZc0tyVEIyV2xxNGd4WWc3VlY4UkFO?=
 =?utf-8?B?ZWpvakkwU1VrcXNQU2czclJJUmgzYlZZSUd0YngyRnhOVER4VFdvcmhZUWFk?=
 =?utf-8?B?YlNBOXJqOHpiMWtDcndRS1ZsNVQvMFFBajVuY0VyN1E3U1VadkFJYS9CbUVv?=
 =?utf-8?B?VHlCZnNhUk9OelFjOWl4am05Z1p3dmNGWDVqbUw0eFkrVHhWMVp6Um5iVkJz?=
 =?utf-8?B?UjJTMTZ4MThzckNDL0pzVTB4cXk2Tk0vSGRXYXNac0lkbkdmYStteUlyRlVw?=
 =?utf-8?B?YTgrZk4ycW0yVlBoT3BZMTIwL2hoU3lMNkJSU0VTQkEvVDUxZWNXMUNaKy9C?=
 =?utf-8?B?RmdWSG9BMnAvMTdPWlBsZFd0UGdkN2cybUFQRy9hRENLV0xkNHF0Sy9URmN4?=
 =?utf-8?B?UWd1UjU1eS9uNkNBOUNhUWhyVklwYmFGVllxS043K1c4RzNZVVF0ZmgvQ0kr?=
 =?utf-8?B?anlJZWRsMDVVMEtrVGhwc0xVbmk3Y2xBeDlCMHBEV2ZyNU1uL3ZDY2dLaC9S?=
 =?utf-8?B?dFRRTTk1RE9LZm93VkdUc0hVMkZjZVJlWGlHdHE5aU15eFVFbFdkZlhqYS9F?=
 =?utf-8?B?TnNhYzBtUFlQWG5FWU9NT2ROc0dYRnVwZFRyVXUzeHRrRm80R0lqSFZ4eWp1?=
 =?utf-8?B?eE8rVjVFQjR6cm52UkwvZHJaTmNiMjNuV3ordTFkYWtiSkxGUE5zNjlDTkxo?=
 =?utf-8?B?bktFZ051aHBLWlYzbUs5MXozbUlUeDYveDVsQVUydEhKM285blBLRmREQzhq?=
 =?utf-8?B?SG93OWIxR25ybTB3elcxSEI5OUZlc29yN2VEUmtXTWFWc1lFYVdxc3FQeWdS?=
 =?utf-8?Q?7OOutRccOUoRD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0NBNXNWOER0Mk9iNEt0WTU1a0JpUFZ5emRCeVBFVno3VmdlT3FDaGlnNnR3?=
 =?utf-8?B?Q212RG1MQitDWUxqcEtsZnoyWmZkVUhUMXh2cDBXKzh6V0FETnhRdTVzYTNl?=
 =?utf-8?B?NTdKSzZUNUh0NExLc2Q0MmluOUc0RnN3cTQ1MlhtUS9YeDZwNGdiVUI1R3RV?=
 =?utf-8?B?NVNGR1hFUDFxNThtTmRNN0dTTlRlVGFUdDZwcVZ2VGltU3lHeDFQYllUSjFz?=
 =?utf-8?B?UGkzQ3hLT2NUaXAzelNBSFArb0RzV1NsY3hUMnM1dlpnOTY1b2IxeURMRFFL?=
 =?utf-8?B?SVdYWGJaR0lQUXNEMWc0TFhwYVE2STRnKytzSU9Vc3IzdzdsR2c5c3JycFdY?=
 =?utf-8?B?ZStlb1R4VWF2VTFJanE1V3VYYVpkTDhhZE9ZQlNVOVV0MEk4RDZVdWZnWGdZ?=
 =?utf-8?B?c1BuZFBHREdGaGdXRnB2aUtZTVk5bHZqbTlWZDJtZzVLK1ZIdDd1THFFNWZW?=
 =?utf-8?B?VGtvSkV2QUNjWjZXWXRkaDcvNHVHUmI2bmkzUitTK1FnY01lRG1oZVRlNjhr?=
 =?utf-8?B?OFVLL25IdUt0dHExS1lZVndGTFkzajdlR21yT3g0WTAzY3ptT1VtTlZCK3hY?=
 =?utf-8?B?NG84bzF2aDNNa29leGxmdjVKSHdDNUY4V0gwUUI4MlJjOXM1N3h6YXdhZVd1?=
 =?utf-8?B?Z2NLeEl3QlpoZEMweEdGa1NsSk8xd1RtQXRLM3ZXSTQvT0RTN0pZcG9GR1hJ?=
 =?utf-8?B?K2hMTyt4Nzh2U0hGYmRjNm9ZalRVRXRkTndVaWQ4SDVIUTRhR1RuZXFaQWY0?=
 =?utf-8?B?aWU4TmtWTGFTeUpwOFo4WXhyV1REOFl2T2k2VWRrQ21NbDJwNWhqaDJRbCtD?=
 =?utf-8?B?M0ZpUzA5RHZCWmEyTjVieHVmL21jNksvWUtzTmxVbkh4aVFsNS9EdU92ZmJy?=
 =?utf-8?B?NWFDR29qTGhHVTdLaXVhT3FEUjMraEtQek5JSDd4b3c0ZVpXSmZSeUN6QVI2?=
 =?utf-8?B?MXJ5ZlJ0aXRhYVdEcC9HME00NlJuaDFGT0swai9sbmxpb0JLd3IreU1BRGRH?=
 =?utf-8?B?WXd0blFBcjE4QzFaSTg2czhpUjRVMXVyVUtiRVJwS1MreGdSSXFHTUVEYTRJ?=
 =?utf-8?B?bzdhRkptZjNheHI5ZkVxOVovVUpmeTYyUTlUOEhUd2hnallyM2wwVC9qUEFJ?=
 =?utf-8?B?ZmFhQkMvVzNCemF2V2xCN29IbkI0UDN4NjlsbG5VcE1DaHhWQUZLUGFGZXlr?=
 =?utf-8?B?aW9sbHQrczRaK1I3aEhKWVVidWZmcGNvSmt1Ri9ESll4QXlZQ2t5OVRKNkRo?=
 =?utf-8?B?aTYzSXo3dFRSdzZjd3l3QUlvRjYwa0t2MjBRNXd3S0hxNDRQR2o3VytWb1hW?=
 =?utf-8?B?VVpEbnBQQ0I4bkpIMC9waU9OaHBlRWw0STZnUlFYRTlvS055WUxBRC91SXBk?=
 =?utf-8?B?bloza0h2Y2kvYkE2QS90VXN2Z25lUVF3K0RnQm5vVlJnRUN2MUFWako4OHNR?=
 =?utf-8?B?eXY1UVBLMzJPK2E0bG5LQW9uS1RZV3Q0bnl0Z2VaVWlVK3lkWEpvWk1EY0Zt?=
 =?utf-8?B?ZnA5bnQxcHFEOUhEVGd4UGZicFl6ZVNWRlJuNFBRNkdwVENrZ2VyVmlXTGNi?=
 =?utf-8?B?ZW02RnI0Y2FnemFUMmlUTGxiVUdPVjFmSG9YNncxSmZ0ZTFaVnVGWDRlWWpJ?=
 =?utf-8?B?TU9QTmxJa0NrclRvQ2FaZjZ4RnAxQnZEbVByS0V6RGxCS01XYlMrQnowNXJ2?=
 =?utf-8?B?bTd0YWRwVTAyYVMzUXdtNUthRUlTcGl1ZGx4ZTVTdWFKcUJFUDFvQVRFMytD?=
 =?utf-8?B?R3JuRUxpQ1RnVStuMVcrc1dUZkR1cmVTVUE1cHZSN1dIc3hCSHpZOHNiV05P?=
 =?utf-8?B?cWdUYndFaUd5U2lMSWtDVnFrNDB3bGlrVWoyUVVRU091dmc2VzN4emR0WU1Q?=
 =?utf-8?B?bGZLZWxxSUljdENUcmNscUZmTUlvVEViQWdIcVZocDFPWGdYeWY1MGQ0ZVVX?=
 =?utf-8?B?Y0d1VHdseS9qbElQYXFYL2VQTHdzYXo2TGozZlZ3SDJlVC9kVW0zU2FhMVps?=
 =?utf-8?B?cUtkTmFwOE40cktESVNHb2g2U3dYckhmK3FFZDJHY29leE01QmNVTTJCN2M4?=
 =?utf-8?B?UWxZQ2lvcUNKUjArbEZDUThEKzc0OWVLRWdzSXg0MnJ1aDRLbU9SQTlCUnJu?=
 =?utf-8?B?Ty9iREJtQ2pCUFppblZwM1ZrTE1SRUxFY3JRZ0JNbjNKUTZ5ZG5FTkdsUk1S?=
 =?utf-8?Q?98ZhAp7oGxnQ5YAGI1j3KSo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f37810-b123-4395-95e1-08dd1fdf0a3f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 03:41:37.0012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i8yxgGOPpAwDbfWoIGkepFAi8EAezE7d+4RPonoiBTGVLL1XZvGDMO+sHfBGHe6wjaQOAP/aEq1VesVx5S5Zjnhcc8TmwHBlynxoIogmzwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5301
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



On 17-12-2024 01:11, Vinay Belgaumkar wrote:
> FORCEWAKE_ALL is not needed when we are trying to read the cur_freq,
> we just need to wake up the GT domain. We also do not need a force wake
> to for a H2G query to obtain min frequency.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_pc.c | 26 +++++++-------------------
>   1 file changed, 7 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index e8b9faeaef64..5f9828ffc19c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -421,8 +421,8 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
>   	 * GuC SLPC plays with cur freq request when GuCRC is enabled
>   	 * Block RC6 for a more reliable read.
>   	 */
> -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT)) {

Since you are getting forcewake for single domain.

if(!fw)
     return -ETIMEDOUT;

is sufficient.

>   		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   		return -ETIMEDOUT;
>   	}
> @@ -481,10 +481,10 @@ u32 xe_guc_pc_get_rpn_freq(struct xe_guc_pc *pc)
>    */
>   int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
>   {
> -	struct xe_gt *gt = pc_to_gt(pc);
> -	unsigned int fw_ref;
>   	int ret;
>   
> +	xe_device_assert_mem_access(pc_to_xe(pc));
> +
>   	mutex_lock(&pc->freq_lock);
>   	if (!pc->freq_ready) {
>   		/* Might be in the middle of a gt reset */
> @@ -492,24 +492,12 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
>   		goto out;
>   	}
>   
> -	/*
> -	 * GuC SLPC plays with min freq request when GuCRC is enabled
> -	 * Block RC6 for a more reliable read.
> -	 */
> -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> -		ret = -ETIMEDOUT;
> -		goto fw;
> -	}
> -
>   	ret = pc_action_query_task_state(pc);
>   	if (ret)
> -		goto fw;
> +		goto out;
>   
>   	*freq = pc_get_min_freq(pc);
>   
> -fw:
> -	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   out:
>   	mutex_unlock(&pc->freq_lock);
>   	return ret;
> @@ -969,8 +957,8 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   
>   	xe_gt_assert(gt, xe_device_uc_enabled(xe));
>   
> -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT)) {

same as above.

With these addressed. Patch Looks good to me.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>   		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   		return -ETIMEDOUT;
>   	}

