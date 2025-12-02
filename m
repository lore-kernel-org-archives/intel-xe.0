Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC0DD1266C
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 19:54:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A090410E6B2;
	Tue,  2 Dec 2025 19:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="clYxbbXs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D463E10E6BA
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 19:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764705287; x=1796241287;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vHNqkrata+hjcJIc7HiKV25r5RR4r80iOx6+BYO04sU=;
 b=clYxbbXsxWwnrdUCi6amdrJH7WnDm8cVe0Qn8UVl1wPeAVU4GYOHX1Uc
 yVSM+y8SLM9bWA28NG0YVHSfiihsHwlM49eKKzn65NQIDcxD4uHQ7ZB+g
 V5mw/Chvi0h9kEotur6FQFOBiknYoi0ORuZSmgo5kScY4+eEW5Txrd8Ih
 9muvJHivpaE6EeGu06FGkuKYRRagjsvZpkhnCqjpSxLovDBfcyV2t48w4
 lQxN1yn7Iu7yXpLvVyTKtg46x6FaRQ9Hyn5cg3/VOL/BWFZgkxBzAe9Xv
 C2Uf1bz4oJZGCbpxkMGusdbEp3F5EGvZS8h6023qXOllvOrr9jrJ3QURP A==;
X-CSE-ConnectionGUID: 80/kFJscTiejBuyLh0kRWw==
X-CSE-MsgGUID: fvTI4w9uQtqhB0mP/Ibg7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78034089"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="78034089"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 11:54:46 -0800
X-CSE-ConnectionGUID: S6DHHiM/ScqzLPMl5DA2XQ==
X-CSE-MsgGUID: 4hxYBhC/TxKQdNmLop3Xog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="198649410"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 11:54:46 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 11:54:45 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 11:54:45 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.22) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 11:54:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=baVANqjpoaEiI8BhA2VdFQU2zqeFQHaGqLqC6vFDzvaysoSwxMLJSBkAaohE2C7DA9HAMkVUDsfNoQ+xCv9CHQ2RqluDiiuXunMtOy8jsh+Zt3wsQ9uU4aH+oDA5vkp0a+TFSORr24pHSXcuahI3uxzM0H7jsxMVf/enF5CXihVg2k+0BLfYPYQLz33auIuiDQoPpJiFPOwNgbJGVI91qmGUhaP3RK2QwI1tbtXvIs7jG7Y/15KxFiD15hFxujwQNfo1Bi8mYT+X1cI1iH5csdqBdlN1gM7ebyn5zluBtoFUvd9g8kch3QEaxZy7fYXGXgAkS1WOp6AAIv0aNso4RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XstvSjvaYJWS2AC6RKq28+VT2wF54T+hIRfCbuXAabI=;
 b=skLESzZtPpVGXKuCEJYmJznyuNnVQ/mY9hlc+qgO8dOELhhEtIS0+XbqaUoX5VhF1rCR+qIED+GQ6bFNB/sBAIeFZg5WjLSS5fIL079W7aVc2Do0qWpbEarfVXWPcevi0JN5wnfYhZfl56jAtKOEPoUb4ihBv3F2bu9IyHtwUKzczQQjuGKwmsk7Cn0j5/OGRHlYbwkMHeKmVT4hS9WCKInh4nBtgj0zu/M9JtKBd+OQP27nbCN89zWbdMkkHOaI89/Y89pNwKRL6wZX4KjqwtWccXQ6pBeRwBCFQE5JgsgJt7ok+gIe7P2M5X/VMWo2F0Cb/1IS8iFybvzoVpEI8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS4PPFCAADA7A6C.namprd11.prod.outlook.com (2603:10b6:f:fc02::4d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 19:54:42 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 19:54:42 +0000
Message-ID: <aa947c74-4c12-4d34-ac48-28562d4dbfcd@intel.com>
Date: Tue, 2 Dec 2025 20:54:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] drm/xe/sriov: Add functions to set exec quantums
 for each group
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-20-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251127014507.2323746-20-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0157.eurprd09.prod.outlook.com
 (2603:10a6:800:120::11) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS4PPFCAADA7A6C:EE_
X-MS-Office365-Filtering-Correlation-Id: 6907270f-486d-43b0-c0c6-08de31dca247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXJ3ZnBOcWF3WnAwcXRoWFJoOXUrdWZvUUpESDZlUzhJY0hDU2N5dE1uOExX?=
 =?utf-8?B?djJ1Y3JpcUtYak9PbVBjNXJCTFNYYTNNWXdSc3dWemlYTW5CU3B1U3psbHdL?=
 =?utf-8?B?OXAvdGZCYjVNRC93a25ndWNmVHNBOXF1SER2UUdGRHFvRURvQWJCcTlwL2VI?=
 =?utf-8?B?RHduTjJtNTBqMUM2TUxySlVjVHFtRFpvT2pLTStnRHNzbkZTazFpSlNHN2th?=
 =?utf-8?B?T0FRcFdTem9BUkUxaTYrdjI3cHFRU25oU3BwbTg3OWVKN0pqbXB0TnNCVisy?=
 =?utf-8?B?c0RneVhkSHNrY2FwbTFiZTRhRDlhMDFKOFhDNkhQaFhpNE5YWUhDc0hNNmtu?=
 =?utf-8?B?QktOdG9Ic1hMZGRLY2RpK0w5TFQ5TThhR3dLbFRmQ0taK1N1Si9MYjBXWWRN?=
 =?utf-8?B?NEtLN1VlQmlsL1MwMStzUk91VkkxdlBYdEE2aWRwdTZWcUp2dkF2ZEpmL1c2?=
 =?utf-8?B?bmVmcXVFOXlLcDZFeGRBanQrYkhWTGkyUDk5aDh3aXRPZFd5bWkwMWk3YUdl?=
 =?utf-8?B?NGt4VDRqZ1YyRnFKUE56djRacDRObGVtemdPM2dJRnVycjVQbEhCQjFkVm5D?=
 =?utf-8?B?R0xHVWV1dUo5YmU2VElBN0xzYzd5ZWE3TXRpeldBR0xlUXJoanpBWFhUV2dK?=
 =?utf-8?B?eWhxNHhxVjh0V3l6ZXBnL1h4cE5rTmYrUFZPdlM1dGNxTEx0SVc1czkraU5s?=
 =?utf-8?B?bHkrMm8rK2ZRcmhsQUx4MmNsdnREdndGNGRCMnMzT3NRaHB4S0JuNjgxL2VF?=
 =?utf-8?B?aThOK2tNQ2RxdXhuVXQveWpkdGtZTDJVUTYrMkRuYlV2bkZTbHlsMjRhbkFl?=
 =?utf-8?B?VzFwN3VGYVVtMFlpTnF4cmhKMXFVdVZvTjlzWFAyRi9RUUVsaVJYb3Rnd2NM?=
 =?utf-8?B?MUdaWGgzblVmUkthaHJrKzZKcEJMYnJWRmVBVHliaFJHU2NzbVI1NnRzM2Jl?=
 =?utf-8?B?NGRVNm1aODN2amNrTzl3Mk95SHlnL3p5SllxNEVhTkpFSjNKdm5DU2I3YnNS?=
 =?utf-8?B?aVc0RlpQUXpaZ0lmWFJZSitYb3k3VW1Xc2FmWlZiMUYvT3l6N0N3dXBZMW8r?=
 =?utf-8?B?Mkc4eTBVUVI4RFB4ZTVBejZpc3R0b2I3N0FRK2ZwN2NtcE01d3d0OG1OdHcx?=
 =?utf-8?B?aHFCaFROVHhTUTBkZVc0SUxnSVVNQnVhNzFTM1Q5MUdnSm8vYThFRGhhL0pK?=
 =?utf-8?B?MWxtRU01SEsyWTVnZkVodDlRZzdYZ2hUZ1VRUkhBRldKbGxXSW5HMTJsdXpQ?=
 =?utf-8?B?cG5aT2JiblQyL2VOT2tPQWpEaEE3M0dqQWJBamZQdXVWTlNXS2hoRE5IM3BR?=
 =?utf-8?B?d0xqMURWR0dvbHdYdFpsTDdid3ZiNW5odk1GVmlUM3JacTNLZ0JLUXVnczVq?=
 =?utf-8?B?Z3NpdEFFWElRR2lkYWR0MllsZk8yRjBocjhSNE5IdmJVNnZuZWk5SlFNanB2?=
 =?utf-8?B?UnlnMEtBY2RxSFpKSEk0VFFYTkFsQWRabG9iWmRDcHd6UHF2M3I1MnZUSUZY?=
 =?utf-8?B?THRJSmltNWxzZXEyUmkwVSthZmZFRlJZRCtqaFJnTFN5MHpkMUhMZlFoQXhJ?=
 =?utf-8?B?TTgyRVp0Mkp6blFkQmcyd2IzalNjWXhWbHJoYTk1QXhkMExySjdyZ04xZWdN?=
 =?utf-8?B?aVRvOUI4cjUyOVBLTGJUTFZndmYrdW4xSm81d203ejRqUWV5S2JPSktaS2tI?=
 =?utf-8?B?OVAzc2p1UUxNS2pPOVVxWEZSWk1ndjNPU3hBVS9vbGczc1JHTEprck9TaTJW?=
 =?utf-8?B?OUVCRENISU90WFBSYjZIelJIQk4weGxDbEoyLzVSTU96Rkg0NU42V01MMUZi?=
 =?utf-8?B?ODZvU0w0YVFoQzFXYURhcVZYVk9uVnNibW50VGQrdVo1S2dKUnUxV09Zdllz?=
 =?utf-8?B?c2xvelRMSFhTa1RIeVdhbStnZC9ZUFBrTnVCNWtlYXkzd1JCVkhKK0xZRmhD?=
 =?utf-8?Q?5HzAlwXHrGrXnqf00+2mwbpbDe//psiR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0pqRXRyTXZQVG83RmhlaWkvWU44Um8wWC9uc3ZnbitEVzBRYVRzS1ZnSHpT?=
 =?utf-8?B?OGVIUmNVQ1hVL3ltLzNlemU3MVFjNG5qRUtRMW5MckQvVG02Zk5GNjRLcGoz?=
 =?utf-8?B?M25ISm9TMit4ZGhGSWtmMlNQRWxheWJZbVdsNTJKUFdBcnJKdW8wb1JwSUxz?=
 =?utf-8?B?bkRVYlczRGQ2N3ZUUVdZL2hNSWlZZWlHcEF6OUVPSzh4Z2JYQ0p2UTFUV29r?=
 =?utf-8?B?eXI4MUxrUnViNjdYTkd3UHY2dXYxZVFRalBWYldGcXQyeVdsUC9DdnI5RGJF?=
 =?utf-8?B?amZrZ2UrdFdVTXdHNGN1aUpvMTJxY2pwOVVZbXh1cVhWSkFUWDBveDdpQ0R4?=
 =?utf-8?B?Um83dzJ1ZzZGdndQdGJ1QUlFZjh6SWZoN0g5ZTVaS2FyYXhsZzVYTytBZVps?=
 =?utf-8?B?bnp0cUdoUW1CSklvYTJ2UWZNK1k0UmxrY3U0UDVFUnZRYkxSZWE3RmJhTVhH?=
 =?utf-8?B?Tk44bnlna0lVRTdVWXA2dXY2cSsrQXcwODRTQi81U3I1Q3BVRHZyRWh5a2kz?=
 =?utf-8?B?MzV4SGpWNEx2L1RnaXNnZ3hPNDNjdnVBZ0cyMWs2SE5RTzdxTWJvT1FucjJG?=
 =?utf-8?B?N29Uc2ZLc25UZkZDZ1dJTSswcmlwQ0ZxNjJpNC82RkJacHBzQnpHd3pXM3FO?=
 =?utf-8?B?dmFQRXdEMG9icXJyRk1PM2VseGRmdmplOTVRMmdGMlFWeEpCTnVxMDBpdzlw?=
 =?utf-8?B?WFJQLzI0LzUzak4wODUyRWU0VFA3RVAveXI5WC9RcnZmL29rUGJ3Ym05M0Yr?=
 =?utf-8?B?ckZibkdERXVXWWhmUDBmV0VZSVVTV1BOaW5QTFhTbVJjeGVldEpoMWJvYXRj?=
 =?utf-8?B?M0ROSDNJZ2VaelphcmhBK04wb1Y1bTRFQWJuNEN4SmpFcm9HRGZjS05OOGNB?=
 =?utf-8?B?Z0k5OUVseGJxTGt2dnB6UnU3ODBQUVdCM1dHc1c2a1FmaGJUVmQ5aUdNYkYz?=
 =?utf-8?B?U2lZR0pCS3I1OUptNkYzTHpCR202Vi9NM2RTSmR1NDMzMHd1THZFeVJ2TXdW?=
 =?utf-8?B?Sk8zVm9xM0JjYzRhaTQ4S0d3ZHV0QTRGVlU2dllZeUsyN2tCdm1yYWlsWG5u?=
 =?utf-8?B?RStOamFiVjRldlFvSm9NK0hSdDRaZUJKcjd2b1o2OEZnWTg3NGNGRm1XVWVh?=
 =?utf-8?B?NlNhVG8raUl0UkZYYmdDd1JGaEY4YzI1YlRkUi93ZnBsVDVtRmZCSGpJVGIy?=
 =?utf-8?B?MWdVN09NZFBDYWY2WGErSDZDVWZScHFoU25IMThJYWpuUXp6WE1BQ0JPejAr?=
 =?utf-8?B?eC9EcDM3WTZwMThxWWdWL0NkLzcwVXBpdEh3YzdsZ1J1ejQ2ZDQ0MWs1cm9F?=
 =?utf-8?B?b3ZPbnMxR296cFBua0QrWDduUy83RDU3Rkt2ZldhM3FWejRxRENjQi9JR3ZD?=
 =?utf-8?B?RlhDVTBBcDdWTXFEZlhRUzNqd3FBN1lPUkZjakdmNS81ZENscXY0Zy9UeW5L?=
 =?utf-8?B?L0VKTXBGa1pHOHhIdE9BYlo5Qkg2K0pvUTNjR0FoQlY0NHRQWExjaEdPYzNJ?=
 =?utf-8?B?RCtBQUlnVHVteWJvRlY0OExXSTV3T3d2bjFuUUhHOVB2SUo4RURFSEhpcWE5?=
 =?utf-8?B?LysxMFhpNitaRnVrVnNtb0ZTZEpkYzd4QXdFczBXQWlvT1k5TCtQRXUxYml3?=
 =?utf-8?B?TW5uNWorQmpUdU13b0JabldWRUxUbzlvQ1YyVzc5TVZCMVNIc3pMeis3VU5N?=
 =?utf-8?B?Ujk0R2hTTDNvUGZTaS84anBZNEpMMU50ei9GQUUyQkYvc1BKcTNIRTB3SDEx?=
 =?utf-8?B?SDJEOG51Q2NydGJiSXkxcC82VFNFSTlhVjg5YWc5Zm9NWHc4Y2FubTFkLzFJ?=
 =?utf-8?B?Ry9iVUdsT1V0dzBrRDVMLzUwazFCeVZrbVFSNmY3QVo2d01adVd1RWQ0bENM?=
 =?utf-8?B?S0hPUnI3emVPSVBHU1B5R1VveW50MkxMcGU1RnlSYjYyVUE1TkhINzhwQkZ3?=
 =?utf-8?B?aEpmODM0R1BGaU9PWE9hRmIya29DclZRaFZydTVTWU9ONnNtOGxRMmU0M0Fq?=
 =?utf-8?B?UnhBRW1vRllMYXVUelJQRjZYMS9UYzdISUhCQnNkTC9QdW5TNGFrVkI4OWdm?=
 =?utf-8?B?Tkl5Q2tOSHBPYVJDalpDRm9HOHc4enc4MDNVRlcySXNtam5xaG1CU2dtQ2RW?=
 =?utf-8?B?R0UzTFpxVG52cytrV04yRmM4K1RTODgzcmlyQjVRRnRPdWJJN21SUWwwMWFF?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6907270f-486d-43b0-c0c6-08de31dca247
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 19:54:42.0251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hUhU28hva7yNRP77SG/LrlcStQyD+TC/D2g0J/TfUvnHfN8VLB3G/2kQog7362hW2ZLeI9pz49i5KspvLbBJqIoT9UjM7YvUK93x+VRW9c4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFCAADA7A6C
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



On 11/27/2025 2:45 AM, Daniele Ceraolo Spurio wrote:
> The GuC has a new dedicated KLV to set the EQs for the groups. The GuC
> always sets the EQs for all the groups (even the ones not enabled). If
> we provide fewer values than the max number of grops (8), the GuC will
> set the remaining ones to 0.
> 
> Based on this, we offer 2 ways of setting the EQs:
> 
> 1) provide a list of EQs, which is passed straight to the GuC. This will
>    cause the GuC to use zero for any missing value as mentioned above
> 2) provide a single EQ for a specific group. In this case we send all 8
>    EQs to the GuC, using the current values for the groups which are not
>    being updated.
> 
> Note that the new KLV can be used even when groups are disabled (as the
> GuC always consider group0 to be active), so we can use it when encoding
> the SRIOV config.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h      |  12 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 244 +++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |   8 +
>  drivers/gpu/drm/xe/xe_sriov.c              |  18 ++
>  drivers/gpu/drm/xe/xe_sriov.h              |   1 +
>  5 files changed, 266 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 48f47e26132d..a0763cc15518 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -383,6 +383,16 @@ enum  {
>   * _`GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT` : 0x8A0D
>   *      This config sets the threshold for LRCA context registration when SRIOV
>   *      scheduler groups are enabled.
> + *
> + * _`GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM' : 0x8A0E
> + *      This config sets the VFs-execution-quantum for each scheduling group in
> + *      milliseconds. The driver must provide an array of values, with each of
> + *      them matching the respective group index (first value goes to group 0,
> + *      second to group 1, etc). The setting of group values follows the same
> + *      behavior and rules as setting via GUC_KLV_VF_CFG_EXEC_QUANTUM. Note that
> + *      the GuC always sets the EQ for all groups (even the non-enabled ones),
> + *      so if we provide fewer values than the max the GuC will use 0 for the
> + *      remaining groups.

don't forget to update xe_guc_klv_key_to_string()

>   */
>  
>  #define GUC_KLV_VF_CFG_GGTT_START_KEY		0x0001
> @@ -444,6 +454,8 @@ enum  {
>  #define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_KEY	0x8a0d
>  #define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_LEN	1u
>  
> +#define GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_KEY	0x8a0e

what about MIN_LEN and MAX_LEN definitions?

> +
>  /*
>   * Workaround keys:
>   */
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index eb547fedb6da..1bfb25bda432 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -195,6 +195,22 @@ static int pf_push_vf_cfg_dbs(struct xe_gt *gt, unsigned int vfid, u32 begin, u3
>  	return pf_push_vf_cfg_klvs(gt, vfid, 2, klvs, ARRAY_SIZE(klvs));
>  }
>  
> +static int pf_push_vf_grp_cfg_u32(struct xe_gt *gt, unsigned int vfid,
> +				  u16 key, const u32 *values, u32 count)
> +{
> +	u32 klv[GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT + 1];

this magic "1" is GUC_KLV_LEN_MIN, please use it

and maybe we don't need this temp storage and can use CLASS(xe_guc_buf) ?

> +
> +	if (!count)
> +		return -ENODATA;
> +	if (count > GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT)
> +		return -E2BIG;

this looks like our coding error, use assert instead

> +
> +	klv[0] = FIELD_PREP(GUC_KLV_0_KEY, key) | FIELD_PREP(GUC_KLV_0_LEN, count);
> +	memcpy(&klv[1], values, count * sizeof(u32));
> +
> +	return pf_push_vf_cfg_klvs(gt, vfid, 1, klv, count + 1);
> +}
> +
>  static int pf_push_vf_cfg_exec_quantum(struct xe_gt *gt, unsigned int vfid, u32 *exec_quantum)
>  {
>  	/* GuC will silently clamp values exceeding max */
> @@ -269,9 +285,11 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config,
>  }
>  
>  /* Return: number of configuration dwords written */
> -static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool details)
> +static u32 encode_config(struct xe_gt *gt, u32 *cfg,
> +			 const struct xe_gt_sriov_config *config, bool details)
>  {
>  	u32 n = 0;
> +	int i;
>  
>  	n += encode_config_ggtt(cfg, config, details);
>  
> @@ -297,8 +315,15 @@ static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool
>  		cfg[n++] = upper_32_bits(xe_bo_size(config->lmem_obj));
>  	}
>  
> -	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_EXEC_QUANTUM);
> -	cfg[n++] = config->exec_quantum[0];
> +	if (xe_sriov_gt_pf_policy_has_valid_sched_group_modes(gt)) {
> +		cfg[n++] = PREP_GUC_KLV_CONST(GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_KEY,
> +					      GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT);
> +		for (i = 0; i < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT; i++)
> +			cfg[n++] = config->exec_quantum[i];
> +	} else {
> +		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_EXEC_QUANTUM);
> +		cfg[n++] = config->exec_quantum[0];
> +	}

I guess it's time to extract above chunk to new encode_sched() helper

there we could encode both EQ and PT and avoid double call to
	xe_sriov_gt_pf_policy_has_valid_sched_group_modes

>  
>  	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_PREEMPT_TIMEOUT);
>  	cfg[n++] = config->preempt_timeout[0];
> @@ -328,7 +353,7 @@ static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
>  		return -ENOBUFS;
>  
>  	cfg = xe_guc_buf_cpu_ptr(buf);
> -	num_dwords = encode_config(cfg, config, true);
> +	num_dwords = encode_config(gt, cfg, config, true);
>  	xe_gt_assert(gt, num_dwords <= max_cfg_dwords);
>  
>  	if (xe_gt_is_media_type(gt)) {
> @@ -952,6 +977,21 @@ static const char *spare_unit(u32 unused)
>  	return " spare";
>  }
>  
> +static void __set_u32_done(struct xe_gt *gt, const char *name, u32 value, u32 actual,
> +			   const char *what, const char *(*unit)(u32), int err)

please keep the pf prefix:

	__pf_config_set_u32_done(...

and maybe we shouldn't change the meaning of the "name" here (as it's still about PF or VF)
but rather augment the "what" was changed, like:

	"execution quantum" ->	"group0 execution quantum"

so the only helper we need is:

const char *to_group_name(const char *what, unsigned int group, char *buf, size_t size)
{
	snprintf(buf, size, "group%u%s%s", group, what ? " " : "", what ?: "");
	return buf;
}

then we could call existing helper as usual:

	pf_group_config_set_u32_done(gt, vfid, value, actual,
				to_group_name(what, group, name, sizeof(name)),
				unit, err);

which will result in:

 [drm] PF: Tile0: GT1: VF1 provisioned with 1ms group0 execution quantum

or

 [drm] *ERROR* PF: Tile0: GT1: Failed to provision VF1 with 1ms group0 execution quantum (-EIO)


> +{
> +	if (unlikely(err)) {
> +		xe_gt_sriov_notice(gt, "Failed to provision %s with %u%s %s (%pe)\n",
> +				   name, value, unit(value), what, ERR_PTR(err));
> +		xe_gt_sriov_info(gt, "%s provisioning remains at %u%s %s\n",
> +				 name, actual, unit(actual), what);
> +	} else {
> +		/* the actual value may have changed during provisioning */
> +		xe_gt_sriov_info(gt, "%s provisioned with %u%s %s\n",
> +				 name, actual, unit(actual), what);
> +	}
> +}
> +
>  static int pf_config_set_u32_done(struct xe_gt *gt, unsigned int vfid, u32 value, u32 actual,
>  				  const char *what, const char *(*unit)(u32), int err)
>  {
> @@ -959,18 +999,47 @@ static int pf_config_set_u32_done(struct xe_gt *gt, unsigned int vfid, u32 value
>  
>  	xe_sriov_function_name(vfid, name, sizeof(name));
>  
> -	if (unlikely(err)) {
> -		xe_gt_sriov_notice(gt, "Failed to provision %s with %u%s %s (%pe)\n",
> -				   name, value, unit(value), what, ERR_PTR(err));
> -		xe_gt_sriov_info(gt, "%s provisioning remains at %u%s %s\n",
> -				 name, actual, unit(actual), what);
> -		return err;
> +	__set_u32_done(gt, name, value, actual, what, unit, err);
> +
> +	return err;
> +}
> +
> +static int pf_group_config_set_u32_done(struct xe_gt *gt, unsigned int vfid, u8 group,
> +					u32 value, u32 actual, const char *what,
> +					const char *(*unit)(u32), int err)
> +{
> +	char name[24];
> +
> +	xe_sriov_function_and_group_name(vfid, group, name, sizeof(name));
> +
> +	__set_u32_done(gt, name, value, actual, what, unit, err);
> +
> +	return err;
> +}
> +
> +static int
> +pf_groups_cfg_set_u32_array_done(struct xe_gt *gt, unsigned int vfid,
> +				 u32 *values, u32 count,
> +				 void (*get_actual)(struct xe_gt *, unsigned int, u32 *, u32),
> +				 const char *what, const char *(*unit)(u32), int err)
> +{
> +	u32 actual[GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT];
> +	char name[24];
> +	u8 g;
> +
> +	get_actual(gt, vfid, actual, count);
> +
> +	for (g = 0; g < count; g++) {
> +		xe_sriov_function_and_group_name(vfid, g, name, sizeof(name));
> +
> +		__set_u32_done(gt, name, values[g], actual[g], what, unit, err);

in case of error, does it make sense to report the same error up to 8 times?

>  	}
>  
> -	/* the actual value may have changed during provisioning */
> -	xe_gt_sriov_info(gt, "%s provisioned with %u%s %s\n",
> -			 name, actual, unit(actual), what);
> -	return 0;
> +	if (!err && count < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT)
> +		xe_gt_sriov_info(gt, "All remaining groups provisioned with 0%s %s\n",
> +				 unit(0), what);

this prints:

 [drm] PF: Tile0: GT1: All remaining groups provisioned with 0(infinity) execution quantum

but there is no info about the target: PF or VF1

but OTOH do we need to shout about implicit configurations, so maybe just drop it?

> +
> +	return err;
>  }
>  
>  /**
> @@ -1869,11 +1938,16 @@ static int pf_provision_exec_quantum(struct xe_gt *gt, unsigned int vfid,
>  	return 0;
>  }
>  
> -static u32 pf_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
> +static u32 pf_get_group_exec_quantum(struct xe_gt *gt, unsigned int vfid, u8 group)

do we need to use fixed size integer for group index ?

>  {
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
>  
> -	return config->exec_quantum[0];
> +	return config->exec_quantum[group];
> +}
> +
> +static u32 pf_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return pf_get_group_exec_quantum(gt, vfid, 0);
>  }
>  
>  /**
> @@ -1980,6 +2054,137 @@ int xe_gt_sriov_pf_config_bulk_set_exec_quantum_locked(struct xe_gt *gt, u32 exe
>  					   exec_quantum_unit, n, err);
>  }
>  
> +static int pf_provision_groups_exec_quantums(struct xe_gt *gt, unsigned int vfid,
> +					     const u32 *exec_quantums, u32 count)
> +{
> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> +	int err;
> +	int i;
> +
> +	err = pf_push_vf_grp_cfg_u32(gt, vfid, GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_KEY,
> +				     exec_quantums, count);
> +	if (unlikely(err))
> +		return err;
> +
> +	/*
> +	 * GuC silently clamps values exceeding the max and zeroes out the
> +	 * quantum for groups not in the array
> +	 */
> +	for (i = 0; i < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT; i++) {
> +		if (i < count)
> +			config->exec_quantum[i] = min_t(u32, exec_quantums[i],
> +							GUC_KLV_VF_CFG_EXEC_QUANTUM_MAX_VALUE);
> +		else
> +			config->exec_quantum[i] = 0;
> +	}
> +
> +	return 0;
> +}
> +
> +static void pf_get_groups_exec_quantums(struct xe_gt *gt, unsigned int vfid,
> +					u32 *exec_quantums, u32 max_count)
> +{
> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> +	u32 count = min_t(u32, max_count, GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT);
> +
> +	memcpy(exec_quantums, config->exec_quantum, sizeof(u32) * count);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_set_groups_exec_quantums() - Configure PF/VF EQs for sched groups.
> + * @gt: the &xe_gt
> + * @vfid: the PF or VF identifier
> + * @exec_quantums: array of requested EQs in milliseconds (0 is infinity)
> + * @count: number of entries in the array
> + *
> + * This function can only be called on PF.
> + * It will log the provisioned value or an error in case of the failure.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_set_groups_exec_quantums(struct xe_gt *gt, unsigned int vfid,
> +						   u32 *exec_quantums, u32 count)
> +{
> +	int err;
> +
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	err = pf_provision_groups_exec_quantums(gt, vfid, exec_quantums, count);
> +
> +	return pf_groups_cfg_set_u32_array_done(gt, vfid, exec_quantums, count,
> +						pf_get_groups_exec_quantums,
> +						"execution quantum",
> +						exec_quantum_unit, err);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_get_groups_exec_quantums - Get PF/VF sched groups EQs
> + * @gt: the &xe_gt
> + * @vfid: the PF or VF identifier
> + * @exec_quantums: array in which to store the execution quantums values
> + * @max_count: maximum number of entries to store

just @count ?

> + *
> + * This function can only be called on PF.
> + */
> +void xe_gt_sriov_pf_config_get_groups_exec_quantums(struct xe_gt *gt, unsigned int vfid,
> +						    u32 *exec_quantums, u32 max_count)
> +{
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));

maybe assert that count <= MAX_GROUPS ?

> +
> +	return pf_get_groups_exec_quantums(gt, vfid, exec_quantums, max_count);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_set_group_exec_quantum - Configure PF/VF EQs for a sched group.
> + * @gt: the &xe_gt
> + * @vfid: the PF or VF identifier
> + * @group: index of the group to configure

GuC ABI does not allow directly to setup single group EQ, so why bother?

> + * @exec_quantum: requested EQs in milliseconds (0 is infinity)
> + *
> + * This function can only be called on PF.
> + * It will log the provisioned value or an error in case of the failure.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_set_group_exec_quantum(struct xe_gt *gt, unsigned int vfid,
> +						 u8 group, u32 exec_quantum)
> +{
> +	u32 values[GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT];
> +	int err;
> +
> +	xe_gt_assert(gt, group < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT);
> +
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	pf_get_groups_exec_quantums(gt, vfid, values, ARRAY_SIZE(values));
> +	values[group] = exec_quantum;
> +
> +	err = pf_provision_groups_exec_quantums(gt, vfid, values, ARRAY_SIZE(values));
> +
> +	return pf_group_config_set_u32_done(gt, vfid, group, exec_quantum,
> +					    pf_get_group_exec_quantum(gt, vfid, group),
> +					    "execution quantum", exec_quantum_unit, err);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_get_group_exec_quantum - Get PF/VF EQ for a sched groups
> + * @gt: the &xe_gt
> + * @vfid: the PF or VF identifier
> + * @group: index of the group for which to get the EQ
> + *
> + * This function can only be called on PF.
> + *
> + * Return: execution quantum in milliseconds (or 0 if infinity).
> + */
> +u32 xe_gt_sriov_pf_config_get_group_exec_quantum(struct xe_gt *gt, unsigned int vfid, u8 group)
> +{
> +	xe_gt_assert(gt, group < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT);
> +
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return pf_get_group_exec_quantum(gt, vfid, group);
> +}
> +
>  static const char *preempt_timeout_unit(u32 preempt_timeout)
>  {
>  	return preempt_timeout ? "us" : "(infinity)";
> @@ -2527,7 +2732,7 @@ ssize_t xe_gt_sriov_pf_config_save(struct xe_gt *gt, unsigned int vfid, void *bu
>  			ret = -ENOBUFS;
>  		} else {
>  			config = pf_pick_vf_config(gt, vfid);
> -			ret = encode_config(buf, config, false) * sizeof(u32);
> +			ret = encode_config(gt, buf, config, false) * sizeof(u32);
>  		}
>  	}
>  	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> @@ -2554,6 +2759,11 @@ static int pf_restore_vf_config_klv(struct xe_gt *gt, unsigned int vfid,
>  			return -EBADMSG;
>  		return pf_provision_exec_quantum(gt, vfid, value[0]);
>  
> +	case GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_KEY:
> +		if (len > GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT)
> +			return -EBADMSG;
> +		return pf_provision_groups_exec_quantums(gt, vfid, value, len);
> +
>  	case GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY:
>  		if (len != GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_LEN)
>  			return -EBADMSG;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index 4975730423d7..aaf6bb824bc9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -46,6 +46,14 @@ int xe_gt_sriov_pf_config_set_exec_quantum_locked(struct xe_gt *gt, unsigned int
>  						  u32 exec_quantum);
>  int xe_gt_sriov_pf_config_bulk_set_exec_quantum_locked(struct xe_gt *gt, u32 exec_quantum);
>  
> +void xe_gt_sriov_pf_config_get_groups_exec_quantums(struct xe_gt *gt, unsigned int vfid,
> +						    u32 *exec_quantum, u32 max_count);
> +int xe_gt_sriov_pf_config_set_groups_exec_quantums(struct xe_gt *gt, unsigned int vfid,
> +						   u32 *exec_quantum, u32 count);
> +u32 xe_gt_sriov_pf_config_get_group_exec_quantum(struct xe_gt *gt, unsigned int vfid, u8 group);
> +int xe_gt_sriov_pf_config_set_group_exec_quantum(struct xe_gt *gt, unsigned int vfid,
> +						 u8 group, u32 exec_quantum);
> +
>  u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
>  					      u32 preempt_timeout);
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index ea411944609b..eecdd4aaf972 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -159,6 +159,24 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)
>  	return buf;
>  }
>  
> +/**
> + * xe_sriov_function_and_group_name() - Get SR-IOV Function and group name.
> + * @n: the Function number (identifier) to get name of
> + * @n: the scheduling group to get name of

@g or better @group

> + * @buf: the buffer to format to
> + * @size: size of the buffer (shall be at least 18 bytes)
> + *
> + * Return: formatted function name ("PF sched group%u" or "VF%u sched group%u").
> + */
> +const char *xe_sriov_function_and_group_name(unsigned int n, u8 g, char *buf, size_t size)
> +{
> +	if (n)
> +		snprintf(buf, size, "VF%u sched group%u", n, g);
> +	else
> +		snprintf(buf, size, "PF sched group%u", g);

	char name[10];
	snprintf(buf, size, "%s sched group%u",
		xe_sriov_function_name(name, n, sizeof(name), group);

but honestly I'm not convinced that we need this function at all

> +	return buf;
> +}
> +
>  /**
>   * xe_sriov_init_late() - SR-IOV late initialization functions.
>   * @xe: the &xe_device to initialize
> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> index 6db45df55615..df2b02cb97d0 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_sriov.h
> @@ -14,6 +14,7 @@ struct drm_printer;
>  
>  const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode);
>  const char *xe_sriov_function_name(unsigned int n, char *buf, size_t len);
> +const char *xe_sriov_function_and_group_name(unsigned int n, u8 g, char *buf, size_t size);
>  
>  void xe_sriov_probe_early(struct xe_device *xe);
>  void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);

