Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16F5C61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 09:47:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842B710E4B0;
	Thu, 12 Jun 2025 09:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XTnHtO8V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B4B10E4B0
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 09:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749721644; x=1781257644;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oHzIWlRs9TMIBsntmaEPPsK0mnJeGyWYtnCAyFjxcUA=;
 b=XTnHtO8VedFTY0egr+qJZXjyiH+DwBto0ejnMLKz1V894SFREfaaIn/U
 L6TlJoVOewVQ7ZObn35M003PPw6JSu60CNzM/Uz5C7ua8MC7ivpoozWI8
 aNwroR0RA0GpGNGlsXgu9Zcu1ZbwPUI/PwlFgRImW1VdQmYyRDzYnAgZK
 Yo1bxEpk1QKzy3PTBinUzXbDBzQpx1Tipf+2amycfzVckcmK6XBxKl886
 R4M6/RPg8hRl7tI2iMwh65WqE5AbwFSqfgeUw8wg4hlepI8pYLucf9oKY
 ZnxfJZs2KoSqR11Jp+gnkyb54cFCXHpyA0Pe08BApydCQe/0wAVflY/ro Q==;
X-CSE-ConnectionGUID: Rxzv2pvvQSeWHO4Nk2HCQQ==
X-CSE-MsgGUID: fkOwhmS7Rb6pv66Exh1lKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51880914"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51880914"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 02:47:24 -0700
X-CSE-ConnectionGUID: 0usRLbh7RMuop0p9ylFIdQ==
X-CSE-MsgGUID: D/5iIn60TEKgH6hX8kPvzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="147453870"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 02:47:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 02:47:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 02:47:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.88)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 02:47:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmlL1uD/hsQ7Wx2SYl1lxbhMC0guIdP1AlsYaMboMPnrkUHyFF7H9UxS2qekwVLYNYBArv8rgf9RC8Qp2w0P2HVVXOBY2dfyZBnjJ+dztAXwWM3mTUHh7+GFOU0ygGcA3LWEPHTpT9hqhykriN01nPoMGcr2ItZ63stqvnC6PtvNN9o7Hf77vz1d/9TH3S9HZ/vC+IkZCEoeXqG+RFefYjZ8dkURfX1j98lJEY/f1TFYG6wUOYdLhSonJ7PMFfyzK27+3010BYo31fxxtl9tt4WOF9lAJBQ2H04SI37UEb29VQM9aXko8+AyxFiZsLo3i/UhbRlGETH81gvX/cxR1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGlMIa+7YJZ9MN+3Zplb6eABKdtFWjPSTwpwx0lGS04=;
 b=TO7s2mUiOKOmlUuCe03lvUrc/XxDowBbPMuIPODLo/Dmf8/0FGjxgVyhQ5MwZxdt+SR0Cix1+Gd8Uc9U8+CXWS57ApeVJxwoEoVptrmwpXhB24UwqjJBFiHhlRWrlJDan7IDXr/CwuqYU2mXaTzApe7OeaCuB8Q4No4Uxd1rm16Z6EzESpfv8ZPXMxjhYPr3pQOrisDUIC8/vBkWTxusTP62ptVvzm0AxeGXB47SH7WsKL1GudD1o4aFBcRVDluGyNG2kZdH+8Tbrmac3lv7FkboFmX5Lse6KUUwyfscP7qunlqVlWgHEMMHOjLUXP2ZCGj8AiN5o7v/o6W6AC/uSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB6073.namprd11.prod.outlook.com (2603:10b6:208:3d7::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.31; Thu, 12 Jun 2025 09:46:54 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 09:46:54 +0000
Message-ID: <d2462fa9-96a5-418b-8030-275f22523cb8@intel.com>
Date: Thu, 12 Jun 2025 15:16:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/hwmon: Fix xe_hwmon_power_max_write
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20250609061345.3084177-1-karthik.poosa@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250609061345.3084177-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0173.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dfe7d82-2e34-49a2-066d-08dda9961084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dW9FdnpRUkUydmNZa1pUK2RZRm1CV2VkK25rWkZnLzhyd1J0cGV4cXRCaUcy?=
 =?utf-8?B?WHRmS1FQMWFZUlpDL0ZwSG1OQVFLNjlsNFg5QjJNeDJtYlRscmxzNW8zMzRh?=
 =?utf-8?B?LzhNMDR1YlRYRnd6emtDWkNRQ2RpWDNHS2lNUFlhYlhZT2JBejBFSURFUXph?=
 =?utf-8?B?SHRHby9yS21TNlRqRTFzdlpxTW9XKzRJUmFJRE5LQzdSRitkUnhqRXZ4ckhF?=
 =?utf-8?B?V2FnNjZsU09vUE9iVUtKRkMyVDBPRjVwN2lxYXZoMTN1OXM4R3BwUjVmZkdL?=
 =?utf-8?B?Qis1Ym9NdCtuR2FjSzFxSkFIZXBBNUFOcTdxYUVtVldWU3k4QlBwdTN3UWNH?=
 =?utf-8?B?WG5YekRWQk5laWk0WE9DZGFlcW0vdnB5ZUJ3bjlrak5ZenBKcWh6U0dtNDBR?=
 =?utf-8?B?dDVEOWZwZGZiZ1BRUjV1dTZ2Z0dEL2dCUkdia2pQbHMvc2FOamJmK29rck1k?=
 =?utf-8?B?TDRnS1FBUXF5R3dVVlhHcTNpVnplZFBqVUZiOVJhSlZtYkdxTEF0MGpVQTd0?=
 =?utf-8?B?ZGh1MXN4N1JvZE9kQW9Ndm5iQ3lqQXpXWkNrQldJdWhMa0VDcCtjMW5sYU45?=
 =?utf-8?B?MGd3eHhOMC83dEpBekJydzhWS1FBaHFrKy9HeHFzVG5lMXlBdldhUDlLSUhq?=
 =?utf-8?B?aFhGVXhMQjN1aHdHS1lQSmRWdVFhMmJjOWF6ZklGMnA3K0tIZjZpS2FFck9F?=
 =?utf-8?B?eWdFR2g5TkFKOWN6MHpOb1piSmxNUjB2TjNEMFRvRDBUNlhDZ1ZydmpaRDll?=
 =?utf-8?B?VW1TczhpTnlxTngwanhGR0xKVWd4aUR6T2g3SllqaDZzYUcvMUFtMFRuOER6?=
 =?utf-8?B?MXlqQW5PUW4ycUt5WUFMWTBTU01lVitWUVJxTVF0dlo4ZllORVlVL1Y5enJX?=
 =?utf-8?B?aEl6UDBKaG9vK3BJVUV1YWFiM1FzcUR3TXc1dGhQdnQ0ZUI4c0diTGoyMFVO?=
 =?utf-8?B?c2Foa3hUSVdaeWVjV0Y5ZVpKN2FOTnFxR09SaGp6NXdScnJZM25sUExMcFhp?=
 =?utf-8?B?VjhBZE5uYURYbk5LcDBGdVhVMG9DSUgvMko3UGgzMEowK3Q4RFpXTFA5cHJi?=
 =?utf-8?B?MmI1MVBGYy9SNGNId2t2eVBuZkNqMEFVa0VtdXJLdDJSRUJBZE9sV0NHUjhX?=
 =?utf-8?B?eXRGcVNDUm9SZ3FnWnE5c3B6bDFnWExiRVR5ekloZXIrdmtFdkFnUHplUEF4?=
 =?utf-8?B?cytwam1RNjVneHhacGJGbFFlUVpjU245UkpadFlhMm1RQnd3RlBJN1BLVDNX?=
 =?utf-8?B?cloxTEtiYVFUejQ1eC9jTUMxYklJTUQ1QVE1ZWZLK3FZV3J4TUhKaG5nNVhu?=
 =?utf-8?B?SDB1YklmelhtWTlCN3NZSnowVGV3RUZrNjdQSE9FOTArZ1dsSXh0RG9FVVBs?=
 =?utf-8?B?UnVTSmZrOFBGcGhGTXdBOEZibzZ2bUljQWtKSVltS1k1U05HUVk1NWFkVUxG?=
 =?utf-8?B?Yk5wTkUyazFuUFFmalA5Q1pocFVpcUVKWU9weWI2UnBwczAzL05DZDVySUEr?=
 =?utf-8?B?RXRZMFdjaXE5N1EvMzNSdE1iT0x5VDZFVUE0MVdMZ1YwM0NOcW5pWXgvL2d6?=
 =?utf-8?B?TjlHU3ArTmNZRi84Vk9SYTdFWGp6MXdUWXo2SEVTMzZuZnhUajdRcjR3c01r?=
 =?utf-8?B?V3VBNXJBSHR4cHArbEx2QkVHeldaN2tvcFBwYnF5bGY0N2lzWmEzUXQyQk5o?=
 =?utf-8?B?SmRSUU1XUmpleGhyb0lEUlpub1E5ekRRUDRoTUo3WjlzK3NzcE9reU43MG9R?=
 =?utf-8?B?dW5rQU5RWDREcjd6aUJFSWxxSWJNUHpidDZmeE1lbFNKZ2lPdkdFYWFYWTZy?=
 =?utf-8?B?U255UmcyZk41dkVNUjFOZzQxTmhaSHBCOXRjUnJaQ2k0bitPV3E2Vjd6c0hK?=
 =?utf-8?B?eW9vczFGTEVvbTMzK2tiUGs5bDlNUVphZVBaQUFPQVBsVXhPWXlYVXBPb2tP?=
 =?utf-8?Q?nsWW8JX+hcU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akJUME1RVEZZWC9RQ3UxM1lsdWlnVFowaVpFOWhOOHVIUzRscndkUy95cE9n?=
 =?utf-8?B?MUlTVGgrcWJtay91S3hKdFdKMWtHR3F1MUNCTHpCclRnWE9GOG5mRUIxNmR0?=
 =?utf-8?B?ZmtubGQ5VkVxNXBhLzBoZWRxZVppWGM4bHRGdkNtUHQzYzZoRmVnT25jRkUv?=
 =?utf-8?B?aTNOaDhHNEh5aWYrK00zeVpTRzBvdTdUQUVETDlBbm9OZE91dk4vNWQ1Nklz?=
 =?utf-8?B?eUZjYXFnZmkrUDByV1pSUytjSXEzanFEK2ZqeWFDVEVjdHl2L2hXbTd6Vk1E?=
 =?utf-8?B?d2V1ME1URlFXTUNpMVByWks1ODlNNDBkK2gxaHM4NVJRV0pWUE1tZEtPcnNB?=
 =?utf-8?B?eXRWaktiYk50Y2RXTjl1RGN6NVZ6YTNzUjNBSkhGSlorZ2RvbjBHVG5sbWlL?=
 =?utf-8?B?bFRIY3VUMXI0NTJXdno1T01ENXoxSU5SOXd4bVJQYWFuem5mRitWY2J3eVNU?=
 =?utf-8?B?R2pUY3laMkd4cVlQUGZGKzRTaGtBNk5tdWtJeElocTcvSVMwZWIzWTJJWWlu?=
 =?utf-8?B?ZnNtYS9ZVy9Ec3kvb2tqSlhhQW1VVmVPQ3kyTFVMZnE3M212dHY5WDBRd1hS?=
 =?utf-8?B?Y1BZa2pvNURGNk9VK0ZWVVFHdmZBd2xMZU9hdE1PT0kwRmIxZGxaWHlvb3lz?=
 =?utf-8?B?NmZyV2J1M01vMGd0ZmRkS2ZaM3pDeXV0STdhMmh6ak5EZ05LeFBwUld0blAw?=
 =?utf-8?B?UGhUYjJJNE9NVDVlRGpHV3BRY1hucmdzSFVZbjBYeE81K0txaE5pc2NEQXNx?=
 =?utf-8?B?amd5ZUR2V3ZNR2ltUGptYWJsZGdJQ2FVV2p0NFRnZTR1dVFFa3RuQkQ3TW9C?=
 =?utf-8?B?WkVScnJadmtiOEdlR2d0bVc2bXFPZm9OcWRvVm4yeTRZYmo5SjREOTk3VHFm?=
 =?utf-8?B?dTNMcmxwRnBBRk5TUW1jYktVbm9hNDNOa01XSkhvS1hLd0dDOXd1a2VqbE53?=
 =?utf-8?B?K3JTdUR2TGJvRHZxT2M3aDQ1b0ZGQ1RIUFFTTGhISjJDd3R1YngvTXNhVlN4?=
 =?utf-8?B?WmV6a2oyZEJWd0tiTW96T1RJMDJzc3Z0YjdMc0h5UUt6MXd6czY4NzNVTFha?=
 =?utf-8?B?eTYrTlRocjY5SFRIQ1dWbG9nUnU3UFl1cENYS3JpQWN6SjFlK25Zam1ZK1hC?=
 =?utf-8?B?bkRrRTM0cXJ5MEVUZGxmaGMzK3U1THpIK1kzVHVEMzVpT2lwMnU0MlArWFBF?=
 =?utf-8?B?OXNVT3hvQ0k1b05rTGhlVWwybXlKd2kxdzg1Yjg2eENCQlY4OXREdW1RUmw5?=
 =?utf-8?B?Mk9HM1ZQMU1sUUtNWVo2aHFjTklybUxTNTFYZ3RGTWJLeFp6ZFNMQzlZUld2?=
 =?utf-8?B?M3FYMEMxL3hNTmxqblJGc29SVHg3L2dsdkd5dk5TVTZnTWVZTTVyaTdGaTZS?=
 =?utf-8?B?aTh5WGdSLzNxZWhrc1lTeGt4NHN3K2ZVbzYxRzhtQTZaRWw1OUppYkkvbGFE?=
 =?utf-8?B?Vlc1dU5nbGVmZkFqbzVLMkMwblM4WHJCRGc3TGhNS1lxMkhKMFNDUkIxTTNl?=
 =?utf-8?B?bGhkVWdoZHpjWlR3eFFKbzc5dXM5QVdCSStGWUUyeFBxTE16amJrcVF5emtG?=
 =?utf-8?B?OGNBdHFvbmdLb2p0UUNXSUYrZ3NyMWhhY084UHcwTy9ja1RzUVk3aE9hckd2?=
 =?utf-8?B?SWQ4TzBnNkZkMDNoNmFhVVpweUttTUt0ZjJvQWNCWjlONTZNZGpsUWpwdnRL?=
 =?utf-8?B?SHpoQlU2ekEzLzAxbEo0M0xlQmxRRmJwSlFOeHVmRmN2bnVKRklFUHgxdFVY?=
 =?utf-8?B?SFlhWitJRGx6a3U2a1NnTm5tTkNneWFWL1YwaGYzNTNNTUFESHdOVUdPYWl0?=
 =?utf-8?B?M2Urck5EUVpqOWd5VjBJZzZDU0F2VitCU20xYTdwVDd1dXJId3BVZlVIU2I0?=
 =?utf-8?B?aERIS0F6eVJmN09wKzFHanlKVkxKajNwUGhydlkxYTRVbGlHR0IveWJtVll4?=
 =?utf-8?B?TnNBcm5xb3FyY00xQ3NabzgycTc4T0p3Zy9wTWhqaU1JamYrQkZNWnlWUFFP?=
 =?utf-8?B?MlZoVmdTZXNOL0ZuMzJBdk1CR2xtd3R2YnZwNytiS2s5OHE0TWFJWTlwTnl3?=
 =?utf-8?B?blA0R1E5bEkvd0hsWkk0dTdGeGd3eWxKZk5HaEhXY3ZPUXZtWndVd05qcStw?=
 =?utf-8?Q?9yoxgmo7GiBQBPXQFxFgODOyt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dfe7d82-2e34-49a2-066d-08dda9961084
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 09:46:54.7433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0bkWC63gSbU6SOACruD4O5qcbGgXUZZZ/5sRVje/6jxNm5EWIcnxsVAw0yJu+6vSyJeA6HJ51SuYf0FtLaapQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6073
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



On 6/9/2025 11:43 AM, Karthik Poosa wrote:
> Prevent the power limit time interval from being overwritten with 0.
> This issue was due to a missing read and modify of current power limit,
> before setting a requested mailbox power limit, which is added in this
> patch.

Maybe prevent other bits from being overwritten or add a rmw version for 
pcode mailbox

Got confused because of power limit interval being mentioned

> 
> v2:
>   - Improve commit message. (Anshuman)
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Fixes: 7596d839f6228 ("drm/xe/hwmon: Add support to manage power limits though mailbox")
> ---
>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h | 1 +
>   drivers/gpu/drm/xe/xe_hwmon.c            | 7 +++++--
>   2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> index 5394a1373a6b..ef2bf984723f 100644
> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> @@ -40,6 +40,7 @@
>   #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>   #define   PWR_LIM_VAL				REG_GENMASK(14, 0)
>   #define   PWR_LIM_EN				REG_BIT(15)
> +#define   PWR_LIM				REG_GENMASK(15, 0)
>   #define   PWR_LIM_TIME				REG_GENMASK(23, 17)
>   #define   PWR_LIM_TIME_X			REG_GENMASK(23, 22)
>   #define   PWR_LIM_TIME_Y			REG_GENMASK(21, 17)
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 0d32e977537c..abb5c3693437 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -377,11 +377,14 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>   
>   	reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
>   
> -	if (hwmon->xe->info.has_mbx_power_limits)
> +	if (hwmon->xe->info.has_mbx_power_limits) {
> +		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &max);
> +		reg_val = (max & ~PWR_LIM) | reg_val;
If you re-use this in the future, maybe add a different helper function.
Looks good for now

Reviewed-by: Riana Tauro <riana.tauro@intel.com>


>   		ret = xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, reg_val);
> -	else
> +	} else {
>   		reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN | PWR_LIM_VAL,
>   					reg_val);
> +	}
>   unlock:
>   	mutex_unlock(&hwmon->hwmon_lock);
>   	return ret;

