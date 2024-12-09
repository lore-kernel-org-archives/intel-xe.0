Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38868E77180
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 19:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED22710E51F;
	Mon,  9 Dec 2024 19:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IZW4aLVi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341A610E51F
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Dec 2024 19:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733770845; x=1765306845;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PtCeax1LB3zpW7fkd8QlNEjCHwGvJNo3MMKRatM7H2g=;
 b=IZW4aLVijMXnvUAM5pdiPnVuTZrzrW9T+ThDBBK5pbKJjpgPbhkfSIKw
 fUPmA4l5MeGGpvEgPoDUZmugA76cpLCfi+exF8rGiLs5OWG6ObRDGByMh
 GVzy58IhpAMuhZwQZHnqVZxCYbaMrfM9naxUQn6efHovmwOO+ppg7kemB
 YIYI8JoVa7e7lEAg1vZtrVi0WV67yLgAHUjv8Lt9GmdvovVRl9Nuiwt8o
 fKtOiuvxqbe/T7qYQAyO+C539VVqPPT6XNiUq3Z1no3pwJWcrcmFlXvL3
 hfkP5aPCvuqnzOVJrDAwY1n2jpabThS22M0kCJFRztpb1BNCq4nlvQpwe g==;
X-CSE-ConnectionGUID: Q6sX/18SQw6POQYc/pPDXw==
X-CSE-MsgGUID: OT24qIN+TI+2EUPByHuiBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="36924620"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="36924620"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 11:00:45 -0800
X-CSE-ConnectionGUID: igkmYfnNQMq2eM1t1eXweQ==
X-CSE-MsgGUID: lopb/r2fTHS6uzcJI7saSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="95611054"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Dec 2024 11:00:45 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Dec 2024 11:00:44 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Dec 2024 11:00:44 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Dec 2024 11:00:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSqkDWdRAm/iUNkYkhcz5tVvb4xFLxl9/7QzfD5hFI/oowZCIvI2IWXvcm1q5gwkoN3urb5wVHVfAH5njWH5uLY1naiGZWQRH2FhZ2eHrWObPIpShyyf1jYC555ke4QSZDcPCAWtsFoIPU10SEkP4acjRRJflqtJZaJifJVXtmfr5pCXQDlILKx1a5ncO3lTFfzPgwv6UdBp81ikGcLv30PxmjK/rGlutXxnhsJccHnhhNyG+plKVDZaDsNHdqBePFrcYuBAybrwutnqVsRvk/V2k5Lc7kUI4fkqirc2hfBNwBMWHi0YF0omqGIJCnS8hmIvv1SZudP8q9Hz4+ZP2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1H58zAsNjLB+whNiwx0DcoEGiCKQaXapoybhGCpHrc=;
 b=amDIx6zZZRzcFl3+GO1QtTGMRjrL7k8NJadD48qNZohKpRtOPP9mEBxNBxMmgkLG17NloKPiUSuJJWtHMK8fGp4yfwEODRtWS9ld+oUgH94PZljW8VY1A2jYOHHf966kahvazRBIiu49hRqakasTmiYScV1v9xPgt9DEyuPtL4csHxYiSDy1FdIDNLzDVgqpeZbPe2OvWgtASx8W934fcNMHvAUwVm2H+w9aZxM+wcWZVlMldcmgjwttwugZBJKA2CvYKZfPFfJuet5bFxnYlkr01bYItorA60grIotAqhoHqq106HQUZcLgvb0VO7DRZlFB+qYcjfmWKiDx1R3nKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MW6PR11MB8391.namprd11.prod.outlook.com (2603:10b6:303:243::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Mon, 9 Dec
 2024 19:00:36 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 19:00:36 +0000
Message-ID: <6076fb0b-44a6-4985-8103-f861ac007a29@intel.com>
Date: Mon, 9 Dec 2024 11:00:33 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] drm/xe/pxp: add a query for PXP status
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
 <20241120234353.1037180-9-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241120234353.1037180-9-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0056.namprd04.prod.outlook.com
 (2603:10b6:303:6a::31) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MW6PR11MB8391:EE_
X-MS-Office365-Filtering-Correlation-Id: 32cde94e-dc2e-441e-d0fb-08dd1883c3fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vmprd3FZRVVIcFVqckRyWGhqR1A3UG1wMzdSdThGaFlrMFNKQ1VwUXBTMEs5?=
 =?utf-8?B?RkpicEF2VVZ5R0k0c29TZ2NuRFg0Y3l1M1FHbzQvS3V3Ulo3RFl1MkRLaTRY?=
 =?utf-8?B?SlpHZkZqSXdqT2tWNkJIOGdlL3JaZWVnTDRraVk2Q2I3UnRBbXMwLzJqQXRl?=
 =?utf-8?B?YUdjd2x2SEx2MVFXZWhrMUR0bkFSMFRLV01wRVVLbmRuNmdOZHpFM0txOFFO?=
 =?utf-8?B?N0R5QkJsMU9JZVpaYXliVXVVeVlOS1lldG44NTUxUjlwTzlqWG1TRmxnaWxF?=
 =?utf-8?B?eVZuMTRNbmVNZTdvcUI1OHEzUmJJcEd0Q2k1aTVqeUxnWFNTSDY5N29zYllm?=
 =?utf-8?B?Ukp4bkFlNkh0UTlocFVSbk5EbEdIU2RScy8raW9PbEZDMkNUQ0FKeDk4d0Fi?=
 =?utf-8?B?NWRLcWVHbUFYdkRGYzRlL29nMnlsUXE4bEJxdTBXK3F5TkJ1UG1uSy9LZ3pZ?=
 =?utf-8?B?NWpTZks5b3piTnFpVUVlQXRhQU5lZEZFYkJTRkJjc1RxYkpBUkpad1lUaUdz?=
 =?utf-8?B?cjllQUpiSlJiL0VHejlRYzc2WFVpYmpLcjB5dnBqbFY4bXQrUU5PY1FyVEQr?=
 =?utf-8?B?VTR0cCtMMkZXSnUrVW0rV0w3ZnhHWTRMQkptMzlsN0pqS3pSYStKWU1pb3hs?=
 =?utf-8?B?a2FUcUdTSXEwTDdDLzF5VjYrT3QyaFBUUzViOEVsbytPQjhjOUpuMEQ5ejh5?=
 =?utf-8?B?dTdzLzNWV2h4V3RYZEdBcStPU1RXcml3V01YVms2clNEZ1lwSlY3WTdPaG1N?=
 =?utf-8?B?dGU4V1NjMWhTYkl4ZDBjbzFPNk81SEZMcUs4ajJJd2ozTHJKK0RNak5HaW9L?=
 =?utf-8?B?WERlSWp4SHZ6b0FTTGx2bStjeFAwSVY3RUd5U1B5STZTMVFNZ1dCV01jZzdy?=
 =?utf-8?B?bzBINXpWd0FmYk51aGhseUJMQ2dETEhHUlA3bE81QVZGbHYwKzlTd1ltL2do?=
 =?utf-8?B?YW1aVGp1SmcrdWtXWnRZcmhIcUZHMFVCNEhtWnBDOHdWL2JtQi9Rcyt2SjlG?=
 =?utf-8?B?WTNEcFd2UE9mOXBBTXA1NkZna01TdXNPM0tJMTFhMU1nYVdiM0VFRWl6am5l?=
 =?utf-8?B?N3l0UXlZakQ0TW0vSmJJbEt2azZWZTFRMVhkU1M4TzFiL09iRjNJbVZic3Rr?=
 =?utf-8?B?TkJvY2ZkK2hQWm50Y1dNenFpSENoeDhST3lFa3RjeG1hN2Z2ZkVWTjdKTUtF?=
 =?utf-8?B?clAxUmZ6YVErOFBRbnhMMjV3N3RWMTFHNWt5Vkx5V0hIRTU5blVMc2lsak9s?=
 =?utf-8?B?dit2V3F5U0s1STRCNlg0UGlzRlY4NUR4bjJNOXIzVXVlaWNZQUt3THU4VFhY?=
 =?utf-8?B?MXVOWU9RUklJZTRaZFhvd2N6dEd3NGhGQTZhcjl6TkV0L2ZWS3JHeFVjR2Zh?=
 =?utf-8?B?aVI3OHZwYkVjdkVndTVmcU9NMENUL0NFN0s3SGlKdEZDVVZwbnBCRkpFc3J2?=
 =?utf-8?B?WktGOHdLdmlDK0JvcjJ6NUF2QzY5ek5zV1g5UDZWYm1JSUluQjZhbFk5TE5F?=
 =?utf-8?B?NkhDWGMxVnNYajZyNjlBMVB6TEthdkZUdEk3OXhvSFhPbFlHbmFncmROSFRs?=
 =?utf-8?B?dnlTNktFMndHQzRSTy9GRC82eDhVVzRmeVBlRE5tSkdOMWwvNWpEcnMxcXVv?=
 =?utf-8?B?NDkrSng0K3YzQVJsOGM2Zjk5Rnp3SzBGL2lzbnhLK2ZpbGR3clFkWHlXZ013?=
 =?utf-8?B?SmN4WGhocGs4ak5RMjBsWUh4N1dlYjVzSmszNC96c3k0d0QzT1ZrK2JrRmF6?=
 =?utf-8?B?TFlmclBuRXFZVGtSUCtRVG85V1I2MngwNDE2a2FvT1VNby9sTU9VT0x4NXhk?=
 =?utf-8?Q?W6yvItd0OJOY99YMFR9H6+IoY1uxXooa/sIy8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N05qbjdXcm9DRk5JcG5Dd1FnRFNPU0JhS0hNUHhjcFBBSDJFamJubXdKY2tp?=
 =?utf-8?B?cFZET1NqQWw4dEppajBYRE40S2t3UGZOQnJEdk1MTFBjM3ordktydEVlUjVz?=
 =?utf-8?B?UnBKNSs3Y2tyTm8xWXJYbWRVczM3YjZzaCtaUGtzNEprTzhmdFF6NCtUZFdP?=
 =?utf-8?B?SUpDNXBjZWZ3cEFnR3RNOWJ5Z3Z1bWZUT1hJbkpvTkExM1ArclpKNmIycHQr?=
 =?utf-8?B?eFArcmQvUEUzay9CSDdvS29veHBNSE42eTdtUGRXaFdvZ0NaMkxvYzJVSDZi?=
 =?utf-8?B?KzdZTmlBRGM3WjJrS3JXU3hrTE9qM3llNHQ4WGI3ZUNJcnJuWm1wOFZpaFkr?=
 =?utf-8?B?blBZdXpHNzNsVjltSUUyRGg5cW83aUZES2FXWTVHWm54MkxrVDFFNVVJdk9x?=
 =?utf-8?B?YmxRWDZFVzlqQk8yNWlwQUtMTG9LSjllWjlsamVOUjdVVWRabHZGeTdzWStK?=
 =?utf-8?B?MkRKZ00zbi9kaUhUQ0UvamgvNFFJcHYyUjMzeCtmc3J3NUNaYlkyazZTSFBO?=
 =?utf-8?B?WXRQdkdKYnFvazg0M1VuNkIxaEdIaFhoV3FaRTNHbnRYUW9xQUtDcnNuY1hP?=
 =?utf-8?B?SnBlQjB6SlM4Z1FOZG4zOVphNmN1bE9Henh6OTVXUkZiUzQzalhIS1RROEhJ?=
 =?utf-8?B?NmRmcTQ0K0xLRStSSjBhUmxkLy8vUUpPOWp4YVpaNDRROStVTHJYOVNZREx3?=
 =?utf-8?B?dlg2WkpGYVBjZHVKUVYyajhhNzg3MDdNcFhMNlQrL0hkTE1TUng3NXhWS2FR?=
 =?utf-8?B?bTYwWkdLMmY3V0pzVUhkeGVCcElPblg0ZUx1Zm9vaTBOaWgrQ1hCRGZRZDdk?=
 =?utf-8?B?dGVTSWZBcGZ5T2dJeVBJVnNiaFVwNVNzYVJSMnJVVkR3WXZlc3VjNm9TTDg2?=
 =?utf-8?B?cUJzcUo2Q0I4Zms4RTNDbmpweFRwRjBxY2M5a2ZLVWxyLzB5SjJMam1aZVVt?=
 =?utf-8?B?anZCMjZsM3ltdHpCUXpCQnR0dDVQMklYUjdxNm9kVUdUYTdBZWttM3NtdEhu?=
 =?utf-8?B?VU1sQzVQOUdxZEtVWXlvRUVsaURybGg0VkxjS2FiNDNkSmUyRWxyNEVYdTRa?=
 =?utf-8?B?aUxVcDlBUlluZmY1aFF2Z3gzTi9EZitCeE9kMUF3UDlVYW16cmM4N2tnNEdt?=
 =?utf-8?B?QXMzdkd4R0FpNkRoMk4zcXlwNEhLdVJhQWV4MXZNeGRzT2N5bmV6SUtoN01k?=
 =?utf-8?B?N3pnWEJaOGRFNW9lSGo3ZGhVZmNqaERBNmFuVkg1UTYvbFl5S2hyUEJ2M3hQ?=
 =?utf-8?B?VkVsbUpZV0dMYXVUa3RHSUdPSTA4OHhiaTFxb0dkTDVBT25vQm5lMktxTEtl?=
 =?utf-8?B?UXVKcDVJK0NXOXl1d0xWV25jNGVOdnNNSWRVK3B2amlCeUYySGJGbklnaXht?=
 =?utf-8?B?QUNiNDJ1WkU1UWNTZEQzbGFtbGxqY2pkNXhGYm9IN3VDbWtVdFhlaWJheGVu?=
 =?utf-8?B?SXluWWhHRzN5WXNobEtKekdaVnVMZzJGZUV2c0w4enN5UEQ1cGZKTTFhMVVr?=
 =?utf-8?B?b2UwYUoxRnNETFFaSXZmZ2VsSitjdUJsYWcyWlZkUnJ6cURiUzNtN3ViandH?=
 =?utf-8?B?QVV2eUxCTzJ0OHExQnVzYkxXSFdmbVcvWkRyd0tTZG5mbCt3eWtLN2czNy9I?=
 =?utf-8?B?QVQ5R1ZOL0RpTXBtUXo4YmhCVDZKTWV5b0pCQUxrL09paGg5blFLYXU0NTg3?=
 =?utf-8?B?clVLc3RNS0NjdmxOQU9hREN2M1lkQWdXRnRhS3R4S05EWW1CNWJKOEF2UytS?=
 =?utf-8?B?K2trME14UGcwYmNtL203OTg3YnB2M1hQWmdMUWluV2FROUhDVHgxMjVLbXhP?=
 =?utf-8?B?ay9wejRJRFRjTkR0VzNqdjRSWHd1OUZqbFFBR3krZEJLOUNIb095bjNPVjN0?=
 =?utf-8?B?bTlhcGJmelhQN3g5ZXE4M2hGMDFBYWR0MHpWQ1FkUUlMbzlrSkdObk5YcWxL?=
 =?utf-8?B?RHVkOVVqSUVrNFlESUxIU0pYSVFHeTB0K0pmb0tCWWlDK3RhM2hYTUxIMWFJ?=
 =?utf-8?B?VnhJVk1rVWxmR2IrajVpbTBjdS8yVWdtT0VLTG1ybUI3ZHAyMWNQWWM3SXRR?=
 =?utf-8?B?VGtXVXBYWmtMQlJlWkNLQVNqTEE5RFBnUlVjbG96Y2tYSmxpNGYzTlFpUDdv?=
 =?utf-8?B?ejladmE5ME5HTWs5N2RQKzlMekRpMXZla2pDZC8rclUzYWdaM2NyRWhXNnNE?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32cde94e-dc2e-441e-d0fb-08dd1883c3fd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 19:00:36.6397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hSsAB9ccPLLfEVILafzkkaQDdtk2vYRv1bDgEEZ0iT+3b3rRRdbySUuXFJE9qZ/vylfFEDE+OUycr8THkKovgL5SkqRiE3fPiXE0lNuC1sM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8391
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

On 11/20/2024 15:43, Daniele Ceraolo Spurio wrote:
> PXP prerequisites (SW proxy and HuC auth via GSC) are completed
> asynchronously from driver load, which means that userspace can start
> submitting before we're ready to start a PXP session. Therefore, we need
> a query that userspace can use to check not only if PXP is supported but
> also to wait until the prerequisites are done.
>
> v2: Improve doc, do not report TYPE_NONE as supported (José)
> v3: Better comments, remove unneeded copy_from_user (John)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_pxp.c   | 32 ++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pxp.h   |  1 +
>   drivers/gpu/drm/xe/xe_query.c | 29 +++++++++++++++++++++++++++++
>   include/uapi/drm/xe_drm.h     | 35 +++++++++++++++++++++++++++++++++++
>   4 files changed, 97 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index ce1d7ab448dc..fe56e3eec5a7 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -71,6 +71,38 @@ static bool pxp_prerequisites_done(const struct xe_pxp *pxp)
>   	return ready;
>   }
>   
> +/**
> + * xe_pxp_get_readiness_status - check whether PXP is ready for userspace use
> + * @pxp: the xe_pxp pointer (can be NULL if PXP is disabled)
> + *
> + * Returns: 0 if PXP is not ready yet, 1 if it is ready, a negative errno value
> + * if PXP is not supported/enabled or if something went wrong in the
> + * initialization of the prerequisites. Note that the return values of this
> + * function follow the uapi (see drm_xe_query_pxp_status), so they can be used
> + * directly in the query ioctl.
> + */
> +int xe_pxp_get_readiness_status(struct xe_pxp *pxp)
> +{
> +	int ret = 0;
> +
> +	if (!xe_pxp_is_enabled(pxp))
> +		return -ENODEV;
> +
> +	/* if the GSC or HuC FW are in an error state, PXP will never work */
> +	if (xe_uc_fw_status_to_error(pxp->gt->uc.huc.fw.status) ||
> +	    xe_uc_fw_status_to_error(pxp->gt->uc.gsc.fw.status))
> +		return -EIO;
> +
> +	xe_pm_runtime_get(pxp->xe);
> +
> +	/* PXP requires both HuC loaded and GSC proxy initialized */
> +	if (pxp_prerequisites_done(pxp))
> +		ret = 1;
> +
> +	xe_pm_runtime_put(pxp->xe);
> +	return ret;
> +}
> +
>   static bool pxp_session_is_in_play(struct xe_pxp *pxp, u32 id)
>   {
>   	struct xe_gt *gt = pxp->gt;
> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
> index 2e0ab186072a..868813cc84b9 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.h
> +++ b/drivers/gpu/drm/xe/xe_pxp.h
> @@ -14,6 +14,7 @@ struct xe_pxp;
>   
>   bool xe_pxp_is_supported(const struct xe_device *xe);
>   bool xe_pxp_is_enabled(const struct xe_pxp *pxp);
> +int xe_pxp_get_readiness_status(struct xe_pxp *pxp);
>   
>   int xe_pxp_init(struct xe_device *xe);
>   void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 3eda616f1502..28d3b98c0fd9 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -24,6 +24,7 @@
>   #include "xe_macros.h"
>   #include "xe_mmio.h"
>   #include "xe_oa.h"
> +#include "xe_pxp.h"
>   #include "xe_ttm_vram_mgr.h"
>   #include "xe_wa.h"
>   
> @@ -696,6 +697,33 @@ static int query_oa_units(struct xe_device *xe,
>   	return ret ? -EFAULT : 0;
>   }
>   
> +static int query_pxp_status(struct xe_device *xe, struct drm_xe_device_query *query)
> +{
> +	struct drm_xe_query_pxp_status __user *query_ptr = u64_to_user_ptr(query->data);
> +	size_t size = sizeof(struct drm_xe_query_pxp_status);
> +	struct drm_xe_query_pxp_status resp = { 0 };
> +	int ret;
> +
> +	if (query->size == 0) {
> +		query->size = size;
> +		return 0;
> +	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> +		return -EINVAL;
> +	}
> +
> +	ret = xe_pxp_get_readiness_status(xe->pxp);
> +	if (ret < 0)
> +		return ret;
> +
> +	resp.status = ret;
> +	resp.supported_session_types = BIT(DRM_XE_PXP_TYPE_HWDRM);
> +
> +	if (copy_to_user(query_ptr, &resp, size))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
>   static int (* const xe_query_funcs[])(struct xe_device *xe,
>   				      struct drm_xe_device_query *query) = {
>   	query_engines,
> @@ -707,6 +735,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
>   	query_engine_cycles,
>   	query_uc_fw_version,
>   	query_oa_units,
> +	query_pxp_status,
>   };
>   
>   int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index ae6313b8438a..8249870a171a 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -629,6 +629,39 @@ struct drm_xe_query_uc_fw_version {
>   	__u64 reserved;
>   };
>   
> +/**
> + * struct drm_xe_query_pxp_status - query if PXP is ready
> + *
> + * If PXP is enabled and no fatal error has occurred, the status will be set to
> + * one of the following values:
> + * 0: PXP init still in progress
> + * 1: PXP init complete
> + *
> + * If PXP is not enabled or something has gone wrong, the query will be failed
> + * with one of the following error codes:
> + * -ENODEV: PXP not supported or disabled;
> + * -EIO: fatal error occurred during init, so PXP will never be enabled;
> + * -EINVAL: incorrect value provided as part of the query;
> + * -EFAULT: error copying the memory between kernel and userspace.
> + *
> + * The status can only be 0 in the first few seconds after driver load. If
> + * everything works as expected, the status will transition to init complete in
> + * less than 1 second, while in case of errors the driver might take longer to
> + * start returning an error code, but it should still take less than 10 seconds.
> + *
> + * The supported session type bitmask is based on the values in
> + * enum drm_xe_pxp_session_type. TYPE_NONE is always supported and therefore
> + * is not reported in the bitmask.
> + *
> + */
> +struct drm_xe_query_pxp_status {
> +	/** @status: current PXP status */
> +	__u32 status;
> +
> +	/** @supported_session_types: bitmask of supported PXP session types */
> +	__u32 supported_session_types;
> +};
> +
>   /**
>    * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
>    * structure to query device information
> @@ -648,6 +681,7 @@ struct drm_xe_query_uc_fw_version {
>    *    attributes.
>    *  - %DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
>    *  - %DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
> + *  - %DRM_XE_DEVICE_QUERY_PXP_STATUS
>    *
>    * If size is set to 0, the driver fills it with the required size for
>    * the requested type of data to query. If size is equal to the required
> @@ -700,6 +734,7 @@ struct drm_xe_device_query {
>   #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
>   #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
>   #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
> +#define DRM_XE_DEVICE_QUERY_PXP_STATUS		9
>   	/** @query: The type of data to query */
>   	__u32 query;
>   

