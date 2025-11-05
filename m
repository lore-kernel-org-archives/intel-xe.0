Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776DECCFA05
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 11:58:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3710D10E704;
	Wed,  5 Nov 2025 11:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fhxJOY0m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE06310E704
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Nov 2025 11:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762343879; x=1793879879;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SwhRdbRRXuTnJOMS9n7DYdzr8/68GyXbNWqOLfSTBpk=;
 b=fhxJOY0mdUFwVkcVmTppv+hUcORt8UANEa1lQ+i2ydQOpyEITexQ6dl2
 Kmd+1IQa999PSF69SG+AaOfOGrNxN6bhPW8T6SgGnMNw3o+qpBWDLa6o9
 1ZXLaBRLwDFMZbS/GuSRQeM25uKUUQOo9YnYtnmw+H8iPtD+ISY0vFcSg
 pKo6EeZdzXSLPNHUIm9z2/B/dyGwfxH/Bu3atdDbmLMZg1YmpdiVj+3fS
 OTTsxpS0Zjb/Q2uS+0eRl2QX1D1giy2XecOtJjEO2DvHn95lok/Hi76fp
 cXCGBzY/2hBNakiazCXxbkK13qvdjHmp8ZZ+BcOkp58JpZlTxa+vyn2St Q==;
X-CSE-ConnectionGUID: oHQa0nkSSrW2Ggr5TOelBQ==
X-CSE-MsgGUID: sYgoMNWjROeLg5ndY690dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="52025365"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="52025365"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 03:57:59 -0800
X-CSE-ConnectionGUID: xBkM1HsgTZSc4UC4Jc8poQ==
X-CSE-MsgGUID: 2SpW3cHhTeCk02LcJA5HYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="224684047"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 03:57:59 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 03:57:58 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 03:57:58 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.21) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 03:57:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1IseWYM78q4HKEvbPh2saMJ+/KdMl3tVOBDj4PBMdVG/AkIt8SLIWcC0bYsUHTh0/4sY1JJbfNKpycvFeERXMmkL3D7cQ1b34r4dQHRY5ZqxHpsHjSNJVXaarPebGmx7ol5LM7uePxcYCJUqfSp7QBAAPsKfpvR/sh8Oi7uDJe2GBX9T8Q9Nk0BvxV7xYWprkcf2vRNu/GO53xzlhLVLQuIo5U7dsUNUdDwUnp9EkpiemXOliRX5hC2zczFjPkXl+CFXaDmh3jPtZDJWCLTTlr2EU1zKBACqllNEjN7qKLcPvJUkZ1WJ+0Vu/GmJe3XSpGo/1R0hWpkRzLaUPgvzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2qngbFLG7TeLIYgo9k4BUNo5sFTuWCkABLYc0WzQ14=;
 b=oFqAUdV4dG3J0/MN70DxlL1eAge/rRaYL4xtANK/iTnL1EZoYM6IqzSkwsoAk8dkASlXiV+8f527Q6KBQnLC8feR3qnSERZ+aKOSl0VI1LjFmgxrbfVyBKm73Qs/HvQrcs+3kknX7D/+cl3hevgNdnazI+bBMUB8Q1I1RfudshAFBVAQVbTNhQsLNSzBBiKLSqxfcRQz90k2QEMC9oEP9upvQpjrWl4NvjPJ6tJz90fiUwmrsRHCiHZJqSlbfGLL/wCHV35hBUjuR+wT+kgjqTyhx9xAZI8Z5mXYqw2NVETq1hC4l6dQOGYYfDE2ibRG5xb7VdmtDHK23/JwEeREhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by IA0PR11MB7741.namprd11.prod.outlook.com (2603:10b6:208:400::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 11:57:51 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 11:57:50 +0000
Message-ID: <734f51f8-b34b-4603-9186-380fa2e92f72@intel.com>
Date: Wed, 5 Nov 2025 17:27:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xs/sa: Shadow buffer support in the sub-allocator
 pool
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
References: <20251103152006.1954098-1-satyanarayana.k.v.p@intel.com>
 <20251103152006.1954098-2-satyanarayana.k.v.p@intel.com>
 <aQj/BMaGWq+7Jx2A@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <aQj/BMaGWq+7Jx2A@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::35) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|IA0PR11MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: d465ea70-da47-4c90-f5b9-08de1c628b8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2VwOFBQWGdiYWtSY0JrMngxWWgzNGtwSWtyVEg2OXgrQWZNdjJGaU81U1RS?=
 =?utf-8?B?L0Y3bmlTdDlXSDh4MmNzbkF5QmhNWEJsRDZDVHZteUN0b0V4OC82c3BZRng0?=
 =?utf-8?B?L3lOY0sraEJNZkdzNklFNXNiRllhYzRnVEJOSktQTlAzS2FzVTNFVm1zRS9t?=
 =?utf-8?B?eVpwMkJsNE0yL2RrdDh1cGxXMmYxYTZZcWM5ck5GRXBiRzBrR3FNRnowOThF?=
 =?utf-8?B?d0V5RXNRWHd1WHJSNER3a2h5bktQNkhWN0ZSTTRXeEplUXZ3VlZFYTNJVUoz?=
 =?utf-8?B?SlRzckFaSnpDNEFaRmN0WWdTdkkwNG5SQlhacWxsOXVRcFhGMWVvT2JoSXJR?=
 =?utf-8?B?MS9jd09uN3NSSjBVRUE0VTRIRzRqTHJkN0Q5TTFkRE41Q2NsVU1PenJTczhW?=
 =?utf-8?B?S0xKUnJMSC8wQXpBZitpeEVoSzhKdFFzdjIwOTdnMFNxNjc1M1pSZmtPeXhr?=
 =?utf-8?B?Q1Zad0JPSG1aS1pUZXhIdzJXZERQUUZvNVlabmJ5Z1FmV3dpR2NmcGxwZEpo?=
 =?utf-8?B?R21QcUlnT1FSbElxSlVXSWtTZFFWODMxeXI2ZVl0NE05elVvemVweHkxR0s0?=
 =?utf-8?B?czJzVmdaVFBZZVVXc0lUVm9ITm1iQjUyWlVGWmtJc2VHMXl5VlFINXhuOTV6?=
 =?utf-8?B?d3hTdXExOWpQLyt3RWM3d1orUmUwcDZoR29CNU5Lbk5MSEVPN1h6UjJ1MzZH?=
 =?utf-8?B?aDR4ODdIUWtOSm11U1dZUFhTQStPYmxDSmFRMjJzb3BhQkE0c1kxUVg5elZ1?=
 =?utf-8?B?endjSWMyTGQ3ZHRCWGN3b2Evcjg0Q3NSakpZYmt6WWhTekpWelRENHdPZE9l?=
 =?utf-8?B?czdJV3JXcUhoOSt0dUpZdkY1azdQRW1CTVc0aTl0TnVnVjBscWVXaklxTllv?=
 =?utf-8?B?TnlGNW01a2hUbk1ocVc3c005KytnRE9qTC85Y0gybkhSNE9DMkxickhQNTRY?=
 =?utf-8?B?RG9TeW9zWU9KT0pNSzdxcEpoTFp0U2lGVTBjUzdyZzNSL202TzhvK0pwSWJw?=
 =?utf-8?B?S1o5Z0o2UzdqT053TWdnNnVJeG1GQVR1dlQ4MFNvMUVzRTljTTh3L0NqYlZ2?=
 =?utf-8?B?ZnRqNy9Nc1owQXpKZ2VzTUdZMndRdGp4akd4Zm83a09DK2xEZkQwNzBhWmlZ?=
 =?utf-8?B?RVRLM0xqQmRxMktzN3o2UmY4SGpMWnA3aURBK3V6Tk9kSFM2Vm5UTFFEaGg0?=
 =?utf-8?B?bHBrQ08xYTlQZGlTdlI1ZTdKM3J2VjJhV29yekNZS2F2ZGM1ZkU1b1NOZndR?=
 =?utf-8?B?b0ZQUytCRUsxaG5DMElwTnZkTVU4UGxDUmdhSWdYaHlaZlFrckh2YlF0SG1V?=
 =?utf-8?B?M3l5eEZrQ1B0N2t5RHgrWDFKOEVyVndiVkdjN0N3aGlZc3VJZlUxVC9WZHNB?=
 =?utf-8?B?QXl2RHFheVFycXhvQVM2T2N1S1NWRm5kSDY2WmJRK296Y0hnNDhpWFNmcGdr?=
 =?utf-8?B?NTdid0xlQ3cvNWZISElQU3pkdU5WdytyL2NzTFVyV1ozNFU2a2daL0V3Vkdl?=
 =?utf-8?B?dlJTbHJrYSs2ZHpkWk83US9mU094ZzJjR3k0MnFwRTBjUUt3UmZzcThJVWFC?=
 =?utf-8?B?dFpUdnk2N0t4Q2xiS0xuRXM4YS9sOUVpNHYzWWFFTnVCRXd3UGRwbWZLdEtN?=
 =?utf-8?B?SjF0a0JGRllVMHhnWUVIYk1qVnNHbVJjSk5KZGRhazJ3UWdUSmNVdXZMSVFG?=
 =?utf-8?B?bHpZR0tXVElpUk9iWGJpQ2o1VFVVckExT2RKemNKTnMxY0lWODVCUzRSNHFu?=
 =?utf-8?B?c2hqOWQ3NmJlRTJIMEpjeXl5U3VNRjMzc09mMFBxQ3E1aFR3SkVGYVhMQ2dv?=
 =?utf-8?B?VlFrYkpTbWxQajg0ZlRzNWhsYzlaL1ZCVmpJYm5yRWMzSmg1aUYvSzNwRklQ?=
 =?utf-8?B?OXp0SVBMZEYxS3VKWFgyWnJLbzhBNkpZQzhtZjNaSThvQi9hL3M2QXF4VCtk?=
 =?utf-8?Q?3n8cxQOZYyceYxuaEVkvaamLQ1T0BDqX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clUrTlVaY01Ga2ZEUzZLSGFCZkNrVkhrOUdIY0o3aXhISHh5ampETHVhUU1B?=
 =?utf-8?B?cjIramEzL3NSYS9tZU55K0hnQkNFQzFhclkvSGc3TlN6am1IclJQQ2lyUGVD?=
 =?utf-8?B?UXByUURDMkJXRVcydjQyNldWQXBrMUNGYkErQThjZnJvWjJRdGh6QkMzLzkx?=
 =?utf-8?B?VGJhSXl0ZklnYjQ0RUE2NGRkWnVMVEZKNHJZVlJJektQb21ZQnhYTFNiczRo?=
 =?utf-8?B?U0kySE11RmM3emNzeTNoS3BRSEVIdTQ4SnVKZ1Z1Q3JpcXFWbEs2eURyN3Uv?=
 =?utf-8?B?NWR6blhPVlpEZ2pia2VmaFBrSUc5ZlkvQVFSdVhYdEVPVWZUcTJQSGU0cUd4?=
 =?utf-8?B?M3JsSCtreURrVmJRM0l4NU00cVU0M0x5Y3krbGordlpoV05JdzM0cDN4OXB1?=
 =?utf-8?B?K3ZwUzZDSTVWQnIwNjlrVnE5TndQbVNLTmZXKyttc2RWNzd5UGxNTEw4ZUNL?=
 =?utf-8?B?aUkzaDF0SWVDNnZ6V1l1Uk9La0JyU1dDcUxZamhUSDY5Q3ZrWnlVeTJaNGtT?=
 =?utf-8?B?clZnUWg4WXVqUm1rcEZZU3phVk12S1doZkxkUEQ4QjBqUkJidzJseFpPbDVk?=
 =?utf-8?B?cUJWaE1EMTNnYkR4bUdwaVVodlppRHBSNmdrSlVRbVBuQTY1MEN3UWkyNFBs?=
 =?utf-8?B?YmEyMUNSd2xScHVIb2R2WkNNODNVSjlFdEp6U2haRTZDZzJRblBjUThSb2Ev?=
 =?utf-8?B?QVA4cVZpRy9UdSt6cHN1RlBEL3RMMVN4cG12NkdReElTZnFDbTRMYnRXb3RN?=
 =?utf-8?B?RG0xcmhNVVpHYUhObWpVVjZiSXFuT3l2aDFjUXJhdVpFV2p2YVJ5d0tMaEpi?=
 =?utf-8?B?TWNmS0RneEpUVmhPRU9qNXdTYjE3OERTSWNFc2pZRGtVeXViRE8rQit4bnUv?=
 =?utf-8?B?SjNZNmtzWHFGTkdhbUx1dFZXSE9rOXhyaGhoQTFxOGdkSzF2aG9RZlYzbFVX?=
 =?utf-8?B?MmZRUitHZHk3VUdYYnV1aTdielFtcmxSbWpVa09ub1RQQ3VSZ0pUUmV5d2I2?=
 =?utf-8?B?aFF6ampGT3FmUUNvczRNUEI5dmVZLzg5UmI4TmlKU205RGtnenFPOU44L0pM?=
 =?utf-8?B?UzBnR3Jydk5HU0lobTZMdzVsR2RscmRQdkMwbTlzM0xQV2hDckRzd1FkcFRL?=
 =?utf-8?B?dmI0U0J5c0JiRndxMDRUQnpvaXViZEpQZ29vTFVpYUhqYXptY2Uyb3FvSzBE?=
 =?utf-8?B?RGlMSVFwVWtBY2NRODlRakVmKy9GZXFhWlp2dVk5NE9xaFA0OG9sSkM5dWFD?=
 =?utf-8?B?aVFmS2pQajh1cFRKNDVRL25KZVI2TGFkYk1GV3hBemx1aUZqTko4K0gwSm1D?=
 =?utf-8?B?Z0phUEpTRHZpM0RhTHgzb1dXdUt1eiszRkNqclZMd2s1QVlybWdidXNtTGdU?=
 =?utf-8?B?U0crcTlhZ1BDSXVIeWdjb0gwMkw4cTJscXN6dkpsc0ZqUkxmQ0g1NVdCb3Vw?=
 =?utf-8?B?Z0IwWjVBMlEyNFJReDJ2bm9SQVhTUk1VREtuMXlFVGJvbzI3VzZqdU10bURY?=
 =?utf-8?B?NlRBOStRbVNka3NyUDRrMXJLNU9rVTVaNFJzWlcwaEl6aFZzU2IzWTBLN3dJ?=
 =?utf-8?B?NDE5dDdYRmxtS3VNaG5GUWNKVDF3ZEFSUWlmb2hVeWV4eE8rR3AyUk1PbEc2?=
 =?utf-8?B?UFJoK0Y2MXNJWjJSNlV4VTgwc1lwdFVqZTVRb2pXb2srbjJzVmh1Q2g0b3pl?=
 =?utf-8?B?TjhTWTkvcEdjdHBDWktHSFNuL05TTS8wZEFTeGh6cWNpbHI3Qjh0MnZXamJx?=
 =?utf-8?B?ZFcxczZoQ2VlNkIzSTRLMVZtcnRyd3EvNEloSklicjNEVzJnTzZ4cHFUTkNR?=
 =?utf-8?B?c3RXaTNNenhRTmhFRUhCeFFxNm02Q25sUlkrRGJrNTE4a01UdFIyR3FZUGV5?=
 =?utf-8?B?QkhlNklkekFtQi9VVkJGVWVoSjZ1OFVZMnl0SEtJeW5jdFUwb21Va3BabkhP?=
 =?utf-8?B?ampvMWxvQitmTDRWYmtVd1pDbWlKVjVFUm42aEVFNTZuOXF2ZWppcGtNWXlt?=
 =?utf-8?B?RDRTU3BKdUN4ZjlYL2dnSUtmL3EwYjl3NWM4NzdrUUFqaG4zMEtHSzBzZHc4?=
 =?utf-8?B?VXE1bHFUL1pkSE5QSUh3ejcxVFJsN2syZUpoUWxnbXFZVFpWQkZTQXBvQTZW?=
 =?utf-8?B?VExjOWlHeERObTl4cEtkRGJDZVh3MW9kSkRXQUg0bWpjUiszcFBLR1lKSFBC?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d465ea70-da47-4c90-f5b9-08de1c628b8c
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 11:57:50.8166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKPAzWMOAQ60PTZg7KWN4BbljmA5oRLCyfy+zi+23MKlvHI1llI5XTr7xjCNJw3b65YGOVoBvWLsJpE9VV/wr6TySCZCaE70O0dTJ48zoOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7741
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



On 04-11-2025 00:44, Matthew Brost wrote:
> On Mon, Nov 03, 2025 at 03:20:05PM +0000, Satyanarayana K V P wrote:
>> The existing sub-allocator is limited to managing a single buffer object.
>> This enhancement introduces shadow buffer functionality to support
>> scenarios requiring dual buffer management.
>>
>> The changes include added shadow buffer object creation capability,
>> Management for both primary and shadow buffers, and appropriate locking
>> mechanisms for thread-safe operations.
>>
>> This enables more flexible buffer allocation strategies in scenarios where
>> shadow buffering is required.
>>
>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_buf.c      |  2 +-
>>   drivers/gpu/drm/xe/xe_sa.c           | 51 +++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_sa.h           | 19 +++++++++--
>>   drivers/gpu/drm/xe/xe_sa_types.h     |  3 ++
>>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |  3 ++
>>   5 files changed, 74 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
>> index 3ce442500130..c36fc31e0438 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_buf.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
>> @@ -30,7 +30,7 @@ static int guc_buf_cache_init(struct xe_guc_buf_cache *cache, u32 size)
>>   	struct xe_gt *gt = cache_to_gt(cache);
>>   	struct xe_sa_manager *sam;
>>   
>> -	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), size, 0, sizeof(u32));
>> +	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), size, 0, sizeof(u32), 0);
>>   	if (IS_ERR(sam))
>>   		return PTR_ERR(sam);
>>   	cache->sam = sam;
>> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
>> index 63a5263dcf1b..3551e726843e 100644
>> --- a/drivers/gpu/drm/xe/xe_sa.c
>> +++ b/drivers/gpu/drm/xe/xe_sa.c
>> @@ -29,6 +29,7 @@ static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
>>   		kvfree(sa_manager->cpu_ptr);
>>   
>>   	sa_manager->bo = NULL;
>> +	sa_manager->shadow = NULL;
>>   }
>>   
>>   /**
>> @@ -37,12 +38,14 @@ static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
>>    * @size: number of bytes to allocate
>>    * @guard: number of bytes to exclude from suballocations
>>    * @align: alignment for each suballocated chunk
>> + * @flags: flags for suballocator
>>    *
>>    * Prepares the suballocation manager for suballocations.
>>    *
>>    * Return: a pointer to the &xe_sa_manager or an ERR_PTR on failure.
>>    */
>> -struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 guard, u32 align)
>> +struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
>> +					      u32 guard, u32 align, u32 flags)
>>   {
>>   	struct xe_device *xe = tile_to_xe(tile);
>>   	struct xe_sa_manager *sa_manager;
>> @@ -79,6 +82,26 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u3
>>   		memset(sa_manager->cpu_ptr, 0, bo->ttm.base.size);
>>   	}
>>   
>> +	if (flags & XE_SA_BO_MANAGER_FLAG_SHADOW) {
>> +		struct xe_bo *shadow;
>> +
>> +		ret = drmm_mutex_init(&xe->drm, &sa_manager->swap_guard);
>> +		if (ret)
>> +			return ERR_PTR(ret);
>> +
>> +		shadow = xe_managed_bo_create_pin_map(xe, tile, size,
>> +						      XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>> +						      XE_BO_FLAG_GGTT |
>> +						      XE_BO_FLAG_GGTT_INVALIDATE |
>> +						      XE_BO_FLAG_PINNED_NORESTORE);
>> +		if (IS_ERR(shadow)) {
>> +			drm_err(&xe->drm, "Failed to prepare %uKiB BO for SA manager (%pe)\n",
>> +				size / SZ_1K, shadow);
>> +			return ERR_CAST(shadow);
>> +		}
>> +		sa_manager->shadow = shadow;
>> +	}
>> +
>>   	drm_suballoc_manager_init(&sa_manager->base, managed_size, align);
>>   	ret = drmm_add_action_or_reset(&xe->drm, xe_sa_bo_manager_fini,
>>   				       sa_manager);
>> @@ -88,6 +111,32 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u3
>>   	return sa_manager;
>>   }
>>   
>> +void xe_sa_bo_swap_shadow(struct xe_sa_manager *sa_manager)
>> +{
>> +	struct xe_device *xe = tile_to_xe(sa_manager->bo->tile);
>> +
>> +	xe_assert(xe, sa_manager->shadow);
>> +	lockdep_assert_held(&sa_manager->swap_guard);
>> +
>> +	swap(sa_manager->bo, sa_manager->shadow);
>> +	if (!sa_manager->bo->vmap.is_iomem)
>> +		sa_manager->cpu_ptr = sa_manager->bo->vmap.vaddr;
>> +}
>> +
>> +void xe_sa_bo_sync_shadow(struct drm_suballoc *sa_bo)
> 
> Opps, I missed xe_sa_bo_swap_shadow, xe_sa_bo_sync_shadow need kernel doc.
Added kernel doc in new revision.>
>> +{
>> +	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
>> +	struct xe_device *xe = tile_to_xe(sa_manager->bo->tile);
>> +
>> +	xe_assert(xe, sa_manager->shadow);
>> +	lockdep_assert_held(&sa_manager->swap_guard);
>> +
>> +	xe_map_memcpy_to(xe, &sa_manager->shadow->vmap,
>> +			 drm_suballoc_soffset(sa_bo),
>> +			 xe_sa_bo_cpu_addr(sa_bo),
>> +			 drm_suballoc_size(sa_bo));
>> +}
>> +
>>   /**
>>    * __xe_sa_bo_new() - Make a suballocation but use custom gfp flags.
>>    * @sa_manager: the &xe_sa_manager
>> diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
>> index 1be744350836..8a674eccc0e2 100644
>> --- a/drivers/gpu/drm/xe/xe_sa.h
>> +++ b/drivers/gpu/drm/xe/xe_sa.h
>> @@ -14,12 +14,14 @@
>>   struct dma_fence;
>>   struct xe_tile;
>>   
>> -struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 guard, u32 align);
>> +#define XE_SA_BO_MANAGER_FLAG_SHADOW	BIT(0)
>> +struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
>> +					      u32 guard, u32 align, u32 flags);
>>   struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size, gfp_t gfp);
>>   
>>   static inline struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align)
>>   {
>> -	return __xe_sa_bo_manager_init(tile, size, SZ_4K, align);
>> +	return __xe_sa_bo_manager_init(tile, size, SZ_4K, align, 0);
>>   }
>>   
>>   /**
>> @@ -69,4 +71,17 @@ static inline void *xe_sa_bo_cpu_addr(struct drm_suballoc *sa)
>>   		drm_suballoc_soffset(sa);
>>   }
>>   
>> +void xe_sa_bo_swap_shadow(struct xe_sa_manager *sa_manager);
>> +void xe_sa_bo_sync_shadow(struct drm_suballoc *sa_bo);
>> +
>> +static inline void xe_sa_bo_swap_guard_lock(struct xe_sa_manager *sa_manager)
>> +{
>> +	mutex_lock(&sa_manager->swap_guard);
>> +}
>> +
>> +static inline void xe_sa_bo_swap_guard_unlock(struct xe_sa_manager *sa_manager)
>> +{
> 
> We also need kernel doc for xe_sa_bo_swap_guard_lock, xe_sa_bo_swap_guard_unlock.
> 
> I think we can annotate thes functions with __acquires(&sa_manager->swap_guard),
> __releases(&sa_manager->swap_guard) too.
> 
Used guard (mutex) in the new revision as suggested by Michal Wajeczko.> 
Matt
> 
>> +	mutex_unlock(&sa_manager->swap_guard);
>> +}
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sa_types.h b/drivers/gpu/drm/xe/xe_sa_types.h
>> index cb7238799dcb..1085c9c37d6b 100644
>> --- a/drivers/gpu/drm/xe/xe_sa_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sa_types.h
>> @@ -12,6 +12,9 @@ struct xe_bo;
>>   struct xe_sa_manager {
>>   	struct drm_suballoc_manager base;
>>   	struct xe_bo *bo;
>> +	struct xe_bo *shadow;
>> +	/** @swap_guard: Timeline guard updating @bo and @shadow */
>> +	struct mutex swap_guard;
>>   	void *cpu_ptr;
>>   	bool is_iomem;
>>   };
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> index 797a4b866226..9959d619addc 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> @@ -162,9 +162,12 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
>>   	offset = 0;
>>   	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
>>   		      bb_pool_size);
>> +	xe_map_memset(xe, &sa_manager->shadow->vmap, offset, MI_NOOP,
>> +		      bb_pool_size);
>>   
>>   	offset = bb_pool_size - sizeof(u32);
>>   	xe_map_wr(xe, &sa_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
>> +	xe_map_wr(xe, &sa_manager->shadow->vmap, offset, u32, MI_BATCH_BUFFER_END);
>>   
>>   	ctx->mem.ccs_bb_pool = sa_manager;
>>   
>> -- 
>> 2.43.0
>>

