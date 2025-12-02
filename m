Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6BAD12671
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 21:25:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0FC10E6DA;
	Tue,  2 Dec 2025 21:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PTyM7yPe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6ED510E6D9
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 21:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764710735; x=1796246735;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=nU6yVmAszBLEJVTHGnoz+R6721aae9ztaEdfzvJ0ze0=;
 b=PTyM7yPeIfQJB1Q5/dFdYT+wEY+rDuziPG+e12WTls6Fqx03+OvJsTpc
 q36l25A4OskQOTOjvRIiKCkwojXXW5vqvmuUxefiClcl+pRqeNnq4EV7D
 9Eb9rSvnyzpMD1A7FmUG04KBM4iGPOHVT4QS4SUlUZwuA/GMo5c3mAy3A
 srXT3ZYiNFgIjWNa9R7XxfU3e9tiBM9/qFRBcExK2i0DcsvtU+w/MJwEW
 K46m0mCPrq+BIMSBbjmWLeeLC8/b6rhuVfKMpE2VH+qCHSeOi55cHuoU1
 8T3kxEbywHcYpVzOm8OhHtH2L6sEpfsFMsxN6AEmwAI+7spptRSXh0j5V g==;
X-CSE-ConnectionGUID: ZG1FreLvSuyqPfDq7Q4e6g==
X-CSE-MsgGUID: SKo1r2f2QEKuERSzZJ+lAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="54244246"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="54244246"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:25:35 -0800
X-CSE-ConnectionGUID: vrBEsvZmQY+K6Juf5N79kg==
X-CSE-MsgGUID: JU/xsNSGTTiTf/fzKtoVDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="199436061"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:25:32 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:25:32 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 13:25:32 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:25:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rrVsaRZ6cmQIP/pa8ODM4c0RCPBQTYNWU2RGsp8NyhzPrvetg7VMulFam7KTPuVNUSNCy2dU3GHpXLT1ELOikNDHn0DnGIPNfxZWeVzQa/5nLX5nePw92Pcz6OaKDKxDI1Nq1shmlzvvGM1jhA0roGFK87md/Q/sfd3FTFDhQv9GJuHdRrEinP+qL4iLmDTJLxvetJELSJI/PttHVDvx/oQ5I96egR5KGTb9IhNPpHnKgeKd/YF1GrNwI6WFLe6/Ec4iBx7xE59la/Kid0LtnDuuJq5iI5bJmVJph6qFp/j4LZQ9KIa5zQxiGzVlaCIahgXMrg+WL4gJ1Bf6zs6mSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gY58F+EjkKHYJrXqauVAnWUAdad7DyGqqh/iPrL+b1c=;
 b=GIewcGmvlRyu0nlIvyBHEr/1HyTSojaNEPfrBWo9t4zkCV0Y3ddCO1N9W3eR+b9XcJD7xoplncNRZlVl7qc9pvr43v2bqfqeEwsPcyvw7zSbIfd7GW+feue/5Trx0LK5E4eGb8jW9I2TKn4bZIYluFOjXHIf5bRV0Ag297NHlCnT+5Qu7oZN/V6QjPQJIF8fKJBFZPQKBvm5Iuxs4Gmy2R/f2AyORZ78n/U5kiEbLwQAI8AzRw1+bpqeTRiZVjXUi5pYGZ4HRJU2Q1DiZ0JtrI6b5SrTd0Rh8WuAW852oPZiw8ORmE4HgQiZeJh7avwI8L0sOAyAUt3grGC7NeJtWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA0PR11MB7186.namprd11.prod.outlook.com (2603:10b6:208:442::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 21:25:30 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 21:25:30 +0000
Message-ID: <25b260ed-d7e0-497b-8b88-7a376402633c@intel.com>
Date: Tue, 2 Dec 2025 13:25:28 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] drm/xe/sriov: Scheduler groups are incompatible
 with multi-lrc
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-16-daniele.ceraolospurio@intel.com>
 <f9690fe0-a3b0-4ecd-a488-72457440a8c8@intel.com>
 <f14a6c48-fe8b-46d7-974b-0fa475b3b521@intel.com>
 <3a5dba85-44b1-453b-921d-420ce26d55b0@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <3a5dba85-44b1-453b-921d-420ce26d55b0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0252.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::17) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA0PR11MB7186:EE_
X-MS-Office365-Filtering-Correlation-Id: 04499398-390f-4fae-4504-08de31e95190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3pHV3JvQVRPQmkxRDZTMnF1YzEzRm5vRGh4cVF3bzcvd0FUSlU2RWxKM21Q?=
 =?utf-8?B?N0dxZjN5THhXWjFSOVFrWW1sb1dvNHhEVGJHNkUrTDNJeDE4dW12a3RuNEc0?=
 =?utf-8?B?T0ZKZzdxTVRIVG1rNmJGYm04aVpLcWYvTEJJbDlkYm5BZkx0UzdiNFBLS3dj?=
 =?utf-8?B?bGdUMENnMWN4K2E4dW4yK1dGUWR4N2ZCd2JpM1pVNkFlZzk1MlljdDE4bEhp?=
 =?utf-8?B?NXNaMHdHWnZZckhUdEZXMUFHUFVLYXk1N2NoWUVzL2ZaQmVQdCtMR1hHWUw3?=
 =?utf-8?B?YkFwU1A1MC9UTlVuM29mK2huNHZVZkxlWDZ0c2x5WVRSVXZTY1VaM0ZOY1p5?=
 =?utf-8?B?YW8xd1pPM0txbjdjNGxnb2V3VSs3dVlyMWk0ODNHSzQvK2s2c3JyRXlyREpZ?=
 =?utf-8?B?ZHNnY0hsQWlBMHp5bnJpRmJEYk5MWTJNMDRmQWpYUUtlRlRINGpGMFpPb2dN?=
 =?utf-8?B?L0xnZG05akRVMUtCUk5laDVCeTliTE54NmlxbWtVTXVzMEFBVGVKQnpnOHJk?=
 =?utf-8?B?YTI3WFZLOUlQblFXek1neU52anFIbGRUZHVaZ05oSVUwbk5ySlBkZS9ieDNH?=
 =?utf-8?B?UGZGbDRPQ1JhZ1lmU0xhaE50Z2R6V0YvTG9MWHZaZ1BJWTNqMUhFaHlBdGRH?=
 =?utf-8?B?eVdrNUtlYnZZZ3FZSURqOVNJbFoxeTdHS0F4bUI2ajFyUHYrN1VMTkhDS2FB?=
 =?utf-8?B?K1FkblNRVkFIN1lzNldyY3hvREZpVjQrZ1dKZGpUQVgxR2I3RVREZUVMazdv?=
 =?utf-8?B?aWY0ZjlOSXlqV09WMWJVbCtpUHdmbXJPYVlKRFRGZHRtays4OU9ta3BlZXY4?=
 =?utf-8?B?cFF0VjhuTHIwbVJWSDV6djFqY2JSaENCVXVFd2o1Y0hzaHZzeFQ5Ym1SdGt3?=
 =?utf-8?B?K0dUenVRUEJwbkpmV0tqM2l2bnN4NHFhbytJZGV2MmdHYW04L3NnZ3gzTWZi?=
 =?utf-8?B?enBGUTVpekRyNERzK3BwZ3YycEM4WDBNYVNadEdjUllRQTBQVWRNeWY1WDRF?=
 =?utf-8?B?dVBLd0RzK25LZTN5U01kQ21abjJLeDlFUklTdWlGdGE5S1hQUklqNlBSckc5?=
 =?utf-8?B?L1N2ai9rUzJpWXJwZVZZdmNJWDltYzJZY29qUkFzRWZaWnBHR0Vuc1FlYU9x?=
 =?utf-8?B?Rmx5K042NUZMRFBtMHV5NjVQYXVPOXFqZGZIdTJBL2J4YkpMTUdEV1dDZ3ZI?=
 =?utf-8?B?cVJObmlKVStkVlRkUG54NG9WTU9Pb1FYcThzaENBRUh0MWE2dTBjNFJkMVZL?=
 =?utf-8?B?RFlPNndpQmd3bXRtRGNFTkFGdy94MGtZVlVUc2kzbVZMVXE3b2JMNWxWQ0lM?=
 =?utf-8?B?VXBBUmp2cG82UlB4ZlRCSnlJQkJHY2cyVEcwbW9GVFBnRXR4V3E2YmxZZzFx?=
 =?utf-8?B?RnFxd3dvQVFNMDBnY0RoWittSDJ0d0phbG5FUkh3eTZldlFyV1RyNlZRV1Yv?=
 =?utf-8?B?dkRjbTZKZHdnanM5Y3puLzluVUtZUHhiSFdqMG83MDJQczZSV0o3aVBiRTdK?=
 =?utf-8?B?MUdVbit1ZDNzc1MrcnN4VW1yM25YNTNDNVNqelM3V1Z4SkFUdVpBOGcyOTdv?=
 =?utf-8?B?ZDJ2a2p3RmF3MUNUWFNjaEZvWk9VODNGak93MXdKUlQzN2trM2V3OHBld1px?=
 =?utf-8?B?Zm5leVVCbVV0U0sya2hsbXdGVDlCblR1NGhiN0tXYXVFeGxaNDFsNzhUSkxM?=
 =?utf-8?B?Wm1tYUkxbmZIaFBnUWlwWGVJOGNOTXlFc2tjaUpwNlZDNFk3NkVJWWY4anRZ?=
 =?utf-8?B?K0xvcm5jLytITnovbXhVLzA0UWxHRHpobjRWSElBaE5hcXlKTEZQV3BPNC92?=
 =?utf-8?B?RlkxTDA0RmJvTHBVUjJqVEpDNFplWmFWdDhnV1FpYnROa0NLYlB1U1BzNGtE?=
 =?utf-8?B?Ti9xRGtrQmYxVXorQ3pTUFpOTHl1Y2ZsZXV3azhKTm5UcHJmSlhJZ0pCKzB1?=
 =?utf-8?Q?UY2WSSVrg5MyCJo/Vnl/C6LXGvis1NZB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEFLdGhrZnVCakFZaHpYeXRWeWFmNjRhUGgyQStOMWJydWlrRlRaWlZQakNW?=
 =?utf-8?B?azdIZVBqaCt5TTlsWjlFTzNTN2FDbjBzV2ttd0g2VUpjeDBtV2hFbkdEdmJk?=
 =?utf-8?B?VDVUV2ZIZXU1T3dwUVByMUk5YkN0WjhRQ3ViZUg0OVhmVFdSa3FYL1dFa0Qv?=
 =?utf-8?B?djl4R043MG5DQmd1RUROdnhJTk84NzcrRVFjdEZQOUdDbWd0TGhVQmhWWGZs?=
 =?utf-8?B?b0Jmcmt5RUc3MkEyVXh5cklrVDV2ZEhrRkVVdWw1TGx3VzlqS3VHRUplSUZ1?=
 =?utf-8?B?KzFMYmozejV5NE1zTGt5Ym42NUtUaUIxWXpvbDZUU1RLVllrTGVvT2x4QzB2?=
 =?utf-8?B?dEtBT2wyV0xYQmxTVG9GOHM1UFFDOGx4aTFnVDdUdER5QUJoNVZ0QkROZ2tt?=
 =?utf-8?B?bjNoQjlLSFp5NDlCTHZxSXgrNEVqa2pYLzJ5bUZBRzgrUEE2aSsxU082UkVL?=
 =?utf-8?B?UEx6N3d2bWp3QkNRb29OUzZjYXI4WE9CK0xRbTZsU0p4Z1BXbUVYdkd4Mm80?=
 =?utf-8?B?YTRtVDRORE1wdTE1a2k1SFZtU1BpSFpMVHJLLzB2NmhzS3Y3eVhqa1ptQkk3?=
 =?utf-8?B?OENRSGgwdFFMSzRMOThDQW5QM3QwbHJpVFRmeTl6V3haaUFVQ09lODhwLzRF?=
 =?utf-8?B?MG5GK0d1dUF2Rk5KQlRZWE9XTmVpM3BrM1dMckNuYk1LQzIwQXJIc2lTMzU1?=
 =?utf-8?B?YlROeVFnbENxdDhsOE01bkFDcDJ0ZCtOeC9rMUd6bTdKRk5NeEk0bzRWNkNL?=
 =?utf-8?B?TnphNGpwVGxxMzM1VmVzSDlOTmkzckNuY0tqWnFpN2N4OHIzKzZkbkJzWXhr?=
 =?utf-8?B?bW1ndGpiekg1QUE5NU9FVUhuQnE0dXlGNkU2Z3dVNmpEMStpS2c0Qm9hVFNh?=
 =?utf-8?B?MzVBbkF6eDF1bzQ2QlR3SDhQMSt5K3lzK1Z4QUhKZFhUOGMySHpwVGQrRWNs?=
 =?utf-8?B?REJrUjZxek8waUo0cUFKb1htamlrKzlydGRROFMvakxud3EyNGVGN2JPUVM5?=
 =?utf-8?B?UEpGQjNPRmFXaUtQbTlwSnU2cUs1KzloUWx3cHp0VTdndTJjUzYwYzRWTE1E?=
 =?utf-8?B?djRWT2JLTXJUM0FNbStuKytEY3VSWFZNSnVENEhIbmF2WUdRYUJUN1ZUQmJZ?=
 =?utf-8?B?N3dObHpyMjVlam1sRTczZ1RGQmt4eFEyMy9KaU8veU5acWJvYitnVUVhd1k5?=
 =?utf-8?B?QVhrdlp1ajFVQXpoTVNBTEJsS201aGRWQnZzNWRHVjc5RThPRTQwUVhSZXdV?=
 =?utf-8?B?UG5NY0dUV1ZRbGhaek9FR3lFQWlETFBrbGNRUWQxMkRYVkVvSkxrdUowM0lX?=
 =?utf-8?B?VzBwcldGSnJTMXpNbE9qOU1iSkZyUzlJZHBST3ZBS1ZidHNSNWlwNFdLVXJD?=
 =?utf-8?B?MG9lVWt4YjV0dGYzaExpNFUycHJsL2xNTVFIQU9jR0Z2eE53U1R3ekJyRUhQ?=
 =?utf-8?B?OHREMzNTUHU2eHAvaVQzVDEzYjBncHlJNkVjdXRTYUFZcytHdDlqZVE3ZGJR?=
 =?utf-8?B?QUsxSHg2bGdoemREckZ6NDd3TDFzNkJ4VzBZV0NYdFcvdlhXRk9KZ3oyZE0x?=
 =?utf-8?B?ZmhLSkVrZlZuTkdQQUVFT0poTlNWT09UWVI0VnJDZzFLU2lzbFNmYU94SXJi?=
 =?utf-8?B?ZW5EZmpVNUdkZEV0L3NqUmdVRk52ZHJqYlh3NmFPalNsQWc2TW01cDNrdmNP?=
 =?utf-8?B?cFBEN0dSSzBKaVdoVWpzY1NYU1hSVGxUYytaOU9PSXhReTFjRm5xMENMVHhO?=
 =?utf-8?B?emZnNlh1R0FGbm85a0I4OGdRYnRpanFVYjRUSFE4UDRkUElpdjZaUXFpRE94?=
 =?utf-8?B?aEpodkFBcXZnZi8xSzQzZzFHdVdKc3pnb3lIeThNbWpxYkY4MFFyd1cxQndy?=
 =?utf-8?B?VTRpVEdpY2hXbEJDN3hNem9tZ3YzMmFqT2lQamowbjhMT3U1eVoyOUc5djZ5?=
 =?utf-8?B?bnJsUTVMaUkyYWN0NjVveTVPVVhyMlorN0VLTDBpVUVZbTZ5ZTVacXVUY1RC?=
 =?utf-8?B?amkxTGJGbEtYTlFhOWRnWS9zdi9UMEpGS1JoYUQ0NVVoQ3BVKzBMVU9oWEVv?=
 =?utf-8?B?VDNpNjUwQnZQNkNpVU5ML3JTU3pUa0dUUFFjNVJFajBodTdFMSt3U0FHcStq?=
 =?utf-8?B?ZUljYW8wVWJqM1BuN3krZllrWGZmYzh4a0YzMzJzeDlCak4vYUNDMTJMbGlO?=
 =?utf-8?Q?B8sIeDQZh0yaAiPz/Wxywgk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04499398-390f-4fae-4504-08de31e95190
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 21:25:30.0146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hpz1ZGALAPlnRRSGW4a3nmaWUX+KrRG8be+ylKMo3nF7AVvP2o4A3QSQUlv5UUyypmn7BCZyhNu6JNG+iqvTnhtzoCeUc24vhEpszskNHxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7186
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



On 12/2/2025 1:17 PM, Michal Wajdeczko wrote:
>
> On 12/2/2025 6:57 PM, Daniele Ceraolo Spurio wrote:
>>
>> On 12/2/2025 5:32 AM, Michal Wajdeczko wrote:
>>> On 11/27/2025 2:45 AM, Daniele Ceraolo Spurio wrote:
>>>> Since engines in the same class can be divided across multiple groups,
>>>> the GuC does not allow scheduler groups to be active if there are
>>>> multi-lrc contexts. This means that:
>>>>
>>>> 1) if a mlrc context is registered when we enable scheduler groups, the
>>>>      GuC will silently ignore the configuration
>>>> 2) if a mlrc context is registered after scheduler groups are enabled,
>>>>      the GuC will disable the groups and generate an adverse event.
>>>>
>>>> We therefore need to block mlrc context creation when scheduler groups
>>>> are enabled.
>>> s/mlrc/MLRC
>>>
>>>> An adverse event threshold is available for the new adverse event.
>>> changes related to introduction of new threshold deserves separate patch
>>> (as we need to handle GuC FW version checks)
>> ok
>>
>>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/abi/guc_klvs_abi.h         | 14 +++++
>>>>    drivers/gpu/drm/xe/xe_exec_queue.c            | 19 ++++++
>>>>    drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 30 ++++++++++
>>>>    drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |  1 +
>>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 59 +++++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf.h           |  3 +
>>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  2 +
>>>>    .../drm/xe/xe_guc_klv_thresholds_set_types.h  |  1 +
>>>>    8 files changed, 129 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>> index 274f1b1ec37f..a6dce9da339f 100644
>>>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>> @@ -46,11 +46,18 @@
>>>>     *      Refers to 32 bit architecture version as reported by the HW IP.
>>>>     *      This key is supported on MTL+ platforms only.
>>>>     *      Requires GuC ABI 1.2+.
>>>> + *
>>>> + * _`GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE` : 0x3001
>>>> + *      Tells the driver whether scheduler groups are enabled or not.
>>>> + *      Requres GuC ABI 1.26+
>>> typo: Requires
>>>
>>> and don't forget to update xe_guc_klv_key_to_string() with new KEY
>> ok
>>
>>>>     */
>>>>      #define GUC_KLV_GLOBAL_CFG_GMD_ID_KEY            0x3000u
>>>>    #define GUC_KLV_GLOBAL_CFG_GMD_ID_LEN            1u
>>>>    +#define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY    0x3001u
>>>> +#define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_LEN    1u
>>>> +
>>>>    /**
>>>>     * DOC: GuC Self Config KLVs
>>>>     *
>>>> @@ -369,6 +376,10 @@ enum  {
>>>>     *      :1: NORMAL = schedule VF always, irrespective of whether it has work or not
>>>>     *      :2: HIGH = schedule VF in the next time-slice after current active
>>>>     *          time-slice completes if it has active work
>>>> + *
>>>> + * _`GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT` : 0x8A0D
>>>> + *      This config sets the threshold for LRCA context registration when SRIOV
>>> ... threshold for _Multi_ LRCA context registrations ...
>> ooops :)
>>
>>>> + *      scheduler groups are enabled.
>>> "This is allows PF to monitor VFs' behavior when EGS is enabled."
>>>
>>>>     */
>>>>      #define GUC_KLV_VF_CFG_GGTT_START_KEY        0x0001
>>>> @@ -427,6 +438,9 @@ enum  {
>>>>    #define   GUC_SCHED_PRIORITY_NORMAL        1u
>>>>    #define   GUC_SCHED_PRIORITY_HIGH        2u
>>>>    +#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_KEY    0x8a0d
>>>> +#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_LEN    1u
>>>> +
>>>>    /*
>>>>     * Workaround keys:
>>>>     */
>>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>>> index 8724f8de67e2..e59c41c913b4 100644
>>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>>> @@ -16,6 +16,7 @@
>>>>    #include "xe_dep_scheduler.h"
>>>>    #include "xe_device.h"
>>>>    #include "xe_gt.h"
>>>> +#include "xe_gt_sriov_pf_policy.h"
>>>>    #include "xe_gt_sriov_vf.h"
>>>>    #include "xe_hw_engine_class_sysfs.h"
>>>>    #include "xe_hw_engine_group.h"
>>>> @@ -698,6 +699,17 @@ static u32 calc_validate_logical_mask(struct xe_device *xe,
>>>>        return return_mask;
>>>>    }
>>>>    +static bool has_sched_groups(struct xe_gt *gt)
>>>> +{
>>>> +    if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_sriov_pf_policy_sched_groups_enabled(gt))
>>> hmm, usually we don't want core code to look so deeply into PF subcomponent
>> I thought about that, but I didn't know which sriov file would be the right one, since almost all of them are either pf-only or vf-only. should I just move it to xe_sriov.c?
> hmm, but xe_sriov.c is device level function
>
> we might add helper to xe_gt_sriov_pf.h where we can also provide stub there:
>
> #ifdef CONFIG_PCI_IOV
> bool xe_gt_sriov_pf_sched_groups_enabled(gt);
> #else
> static inline bool xe_gt_sriov_pf_sched_groups_enabled(gt) { return false; }
> #endif

Do you mean to check for both PF and VF from that function, and just 
have it in the PF file for convenience?
I could also just create a new xe_gt_sriov.h file and place it there, 
making the function an inline.

>
>>> also, do we want to work in hybrid mode where one GT is using MLRC and other is not?
>> The GuCs allow it. I didn't want to block it in case we do get a scenario later where this is needed (e.g. we might get a split primary GT but still want to do mlrc on media)
>>
>>>> +        return true;
>>>> +> +    if (IS_SRIOV_VF(gt_to_xe(gt)) && xe_gt_sriov_vf_sched_groups_enabled(gt))
>>>> +        return true;
>>>> +
>>>> +    return false;
>>>> +}
>>>> +
>>>>    int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>>>                       struct drm_file *file)
>>>>    {
>>>> @@ -790,6 +802,13 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>>>                return -ENOENT;
>>>>            }
>>>>    +        /* SRIOV sched groups are not compatible with multi-lrc */
>>>> +        if (XE_IOCTL_DBG(xe, args->width > 1 && has_sched_groups(hwe->gt))) {
>>>> +            up_read(&vm->lock);
>>>> +            xe_vm_put(vm);
>>>> +            return -EINVAL;
>>>> +        }
>>>> +
>>>>            q = xe_exec_queue_create(xe, vm, logical_mask,
>>>>                         args->width, hwe, flags,
>>>>                         args->extensions);
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>>>> index 48f250ae0d0d..c7f1ea8eb9c5 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>>>> @@ -8,6 +8,7 @@
>>>>    #include <drm/drm_managed.h>
>>>>      #include "xe_bo.h"
>>>> +#include "xe_exec_queue_types.h"
>>>>    #include "xe_gt.h"
>>>>    #include "xe_gt_sriov_pf_helpers.h"
>>>>    #include "xe_gt_sriov_pf_policy.h"
>>>> @@ -527,6 +528,24 @@ static int __pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>>>>                          masks, num_masks);
>>>>    }
>>>>    +static bool guc_has_mlrc_queue(struct xe_guc *guc)
>>> this is all GuC stuff, so export it from xe_guc_submission.c
>> ok
>>
>>>> +{
>>>> +    struct xe_exec_queue *q;
>>>> +    unsigned long index;
>>>> +    bool found = false;
>>>> +
>>>> +    mutex_lock(&guc->submission_state.lock);
>>> guard(mutex) ?
>>>
>>>> +    xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
>>>> +        if (q->width > 1) {
>>>> +            found = true;
>>>> +            break;
>>>> +        }
>>>> +    }
>>>> +    mutex_unlock(&guc->submission_state.lock);
>>>> +
>>>> +    return found;
>>> what if new MLRC is created right now?
>>>
>>> maybe we should use xe_guard to lockdown one feature or the other?
>> The idea is that the admin is responsible for enabling EGS when the system is in the correct state, which is why the GuC doesn't return an error and just ignore the KLV if the system is not in the correct state. This check is there to catch the case where the admin has closed all apps in preparation to enabling EGS but the driver still hasn't processed all the context de-registrations. Therefore, I don't really want to over-complicate it with extra locking. I'll add a comment to better explain.
> so it doesn't have to be bullet-proof ?

Yup. If we had stricter requirements then the GuC would enforce them.

Daniele

>
>>>> +}
>>>> +
>>>>    static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>>>>    {
>>>>        int err;
>>>> @@ -548,6 +567,12 @@ static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>>>>        if (xe_sriov_pf_num_vfs(gt_to_xe(gt)))
>>>>            return -EPERM;
>>>>    +    /* The GuC silently ignores the setting if any mlrc contexts are registered */
>>>> +    if ((mode != XE_SRIOV_SCHED_GROUPS_NONE) && guc_has_mlrc_queue(&gt->uc.guc)) {
>>>> +        xe_gt_sriov_notice(gt, "can't enable sched groups with active mlrc queues\n");
>>>> +        return -EPERM;
>>>> +    }
>>>> +
>>>>        err = __pf_provision_sched_groups(gt, mode);
>>>>        if (err)
>>>>            return err;
>>>> @@ -600,6 +625,11 @@ int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value)
>>>>        return err;
>>>>    }
>>>>    
>>> every public function needs to have kernel-doc
>> ok
>>
>>>> +bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt)
>>>> +{
>>>> +    return gt->sriov.pf.policy.guc.sched_groups.current_mode != XE_SRIOV_SCHED_GROUPS_NONE;
>>>> +}
>>>> +
>>>>    static void pf_sanitize_guc_policies(struct xe_gt *gt)
>>>>    {
>>>>        pf_sanitize_sched_if_idle(gt);
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>>>> index 36680996f2bd..89aa3af6cc7d 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>>>> @@ -18,6 +18,7 @@ bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
>>>>    int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
>>>>    u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
>>>>    int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value);
>>>> +bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt);
>>>>      int xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
>>>>    void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>> index 4c73a077d314..7a180c947032 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>> @@ -438,6 +438,30 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>>>>        return value;
>>>>    }
>>>>    +static int query_vf_sched_groups(struct xe_gt *gt)
>>>> +{
>>>> +    struct xe_guc *guc = &gt->uc.guc;
>>>> +    u32 value = 0;
>>>> +    int err;
>>>> +
>>>> +    xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>> +
>>>> +    if (MAKE_GUC_VER_STRUCT(gt->sriov.vf.guc_version) < MAKE_GUC_VER(1, 26, 0))
>>>> +        return 0;
>>>> +
>>>> +    err = guc_action_query_single_klv32(guc,
>>>> +                        GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY,
>>>> +                        &value);
>>>> +    if (unlikely(err)) {
>>>> +        xe_gt_sriov_err(gt, "Failed to obtain sched groups status (%pe)\n",
>>>> +                ERR_PTR(err));
>>>> +        return err;
>>>> +    }
>>>> +
>>>> +    xe_gt_sriov_dbg(gt, "sched groups %s\n", value ? "enabled" : "disabled");
>>> str_enabled_disabled(value)
>>>
>>>> +    return value;
>>>> +}
>>>> +
>>>>    static int vf_get_ggtt_info(struct xe_gt *gt)
>>>>    {
>>>>        struct xe_tile *tile = gt_to_tile(gt);
>>>> @@ -564,6 +588,21 @@ static void vf_cache_gmdid(struct xe_gt *gt)
>>>>        gt->sriov.vf.runtime.gmdid = xe_gt_sriov_vf_gmdid(gt);
>>>>    }
>>>>    +static int vf_cache_sched_groups_status(struct xe_gt *gt)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +    xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>> +
>>>> +    ret = query_vf_sched_groups(gt);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    gt->sriov.vf.runtime.uses_sched_groups = ret;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>    /**
>>>>     * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
>>>>     * @gt: the &xe_gt
>>>> @@ -593,12 +632,32 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>>>>        if (unlikely(err))
>>>>            return err;
>>>>    +    err = vf_cache_sched_groups_status(gt);
>>>> +    if (unlikely(err))
>>>> +        return err;
>>>> +
>>>>        if (has_gmdid(xe))
>>>>            vf_cache_gmdid(gt);
>>>>          return 0;
>>>>    }
>>>>    +/**
>>>> + * xe_gt_sriov_vf_sched_groups_enabled - Check if PF has enabled sched groups
>>>       * xe_gt_sriov_vf_sched_groups_enabled() - Check ...
>>>
>>>
>>>> + * @gt: the &xe_gt
>>>> + *
>>>> + * This function is for VF use only.
>>>> + *
>>>> + * Return: true if shed groups were enabled, false otherwise.
>>> typo: s/shed/scheduler
>>>
>>>> + */
>>>> +bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt)
>>>> +{
>>>> +    xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>> +    xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>>>> +
>>>> +    return gt->sriov.vf.runtime.uses_sched_groups;
>>>> +}
>>>> +
>>>>    /**
>>>>     * xe_gt_sriov_vf_guc_ids - VF GuC context IDs configuration.
>>>>     * @gt: the &xe_gt
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>> index af40276790fa..2e1d34c0397f 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>> @@ -23,11 +23,14 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>>>>    int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>>>>    void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>>>>    +bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt);
>>> move it there [1]
>>>
>>>> +
>>>>    int xe_gt_sriov_vf_init_early(struct xe_gt *gt);
>>>>    int xe_gt_sriov_vf_init(struct xe_gt *gt);
>>>>    bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
>>>>      u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>>>> +u32 xe_gt_sriov_vf_sched_groups(struct xe_gt *gt);
>>> unused ?
>> oops, old function name that I forgot to remove.
>>
>>>>    u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>>>>    u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>>> [1] here
>>>
>>>>    diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>> index 420b0e6089de..5267c097ecd0 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>> @@ -27,6 +27,8 @@ struct xe_gt_sriov_vf_selfconfig {
>>>>    struct xe_gt_sriov_vf_runtime {
>>>>        /** @gmdid: cached value of the GDMID register. */
>>>>        u32 gmdid;
>>>> +    /** @uses_sched_groups: whether PF enabled sched groups or not. */
>>>> +    bool uses_sched_groups;
>>>>        /** @regs_size: size of runtime register array. */
>>>>        u32 regs_size;
>>>>        /** @num_regs: number of runtime registers in the array. */
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>>>> index 0a028c94756d..3e55d9302855 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>>>> @@ -32,6 +32,7 @@
>>>>        define(H2G_STORM, guc_time_us)            \
>>>>        define(IRQ_STORM, irq_time_us)            \
>>>>        define(DOORBELL_STORM, doorbell_time_us)    \
>>>> +    define(MULTI_LRC_COUNT, multi_lrc_count)    \
>>> this needs to be defined with some version info, maybe:
>>>
>>>      define(MULTI_LRC_COUNT, multi_lrc_count, (70, 53, 0))    \
>>>
>>> and then in encode_config() have two variants of code generators:
>>>
>>> #define encode_threshold_config2(TAG, ...) ({                    \
>>>      cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);            \
>>>      cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];    \
>>> });
>>> #define encode_threshold_config3(TAG, NAME, VERSION) ({                \
>>>      if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER VERSION) {        \
>>>          encode_threshold_config2(TAG, NAME);                \
>>>      }                                    \
>>> });
>>> #define encode_threshold_config(ARGS...) \
>>>      CALL_ARGS(CONCATENATE(encode_threshold_config, COUNT_ARGS(ARGS)), ARGS)
>>>
>>> this should fix the issues already spotted by the CI on ADLP:
>>>
>>> <6> [133.603624] xe 0000:00:02.0: [drm] Tile0: GT0: { key 0x8a0d : 32b value 0 } # multi_lrc_count
>>> <6> [133.603625] xe 0000:00:02.0: [drm] Tile0: GT0: { key 0x0001 : 64b value 0x200000 } # ggtt_start
>>> <6> [133.603626] xe 0000:00:02.0: [drm] Tile0: GT0: { key 0x0002 : 64b value 0xfec00000 } # ggtt_size
>>> <3> [133.603653] xe 0000:00:02.0: [drm] *ERROR* PF: Tile0: GT0: Failed to push self configuration (-ENOKEY)
>> I think it works better if we add the version for all thresholds, so we don't have to define multiple macros every time we need to check the GuC version (which I believe needs to also be done at least in register_threshold_attribute() and define_threshold_key_to_provision_case().
>> I can just use 70.29.2 (which is the minimum supported version for the Xe driver) for all the older defines.
> but then the code for version check will be generated for all thresholds, even those that we are sure are supported
>
> I will try to find something simpler, or more reusable, but no promise
>
>> Daniele
>>
>>>
>>>>        /* end */
>>>>      /**

