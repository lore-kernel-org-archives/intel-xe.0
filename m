Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBD0C79F99
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 18:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF4810E150;
	Tue,  8 Sep 2026 18:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VzoRMCjk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568B910E150
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 18:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788891154; x=1820427154;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GjsoRcUDwkfQur6m6EUHI8VSRqPykI7oWz3vtgJWfnw=;
 b=VzoRMCjk/Vvv84LCUDoHAadVdx64KeuiDyjXF6VP8/rMPfeSSjIImW6b
 M1O2xc12ttXWTjn5sCIBlr0EaYJ0g5xnoHCOPjHRoL4DhwFztkBcxKBmo
 hgJu/yVp31e7hghpEe47uyJzGkTQTLnkr5DpU4/HeY70JWRlTkR6wSuFl
 C3n93GniptCrpN4FTBSsHmh16yqWFaysCfR2f9nX10RGhoVTNIv6KcIfz
 A3r4I7cpAvqu9x6Sj6cFn/Lfy+mOZA+1X+1ys0o/oYuzsHmax7D4VACAk
 KNrAuA8+3svKsTOwtFCR19LIoxrD8/fp3V7GjM+bqn0pTLGszsYfnivCy w==;
X-CSE-ConnectionGUID: sk77+zZHRF6JSjwvyX6rxQ==
X-CSE-MsgGUID: 8GDXYMehRl+uQYcKkNB81Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89062774"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="89062774"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 11:12:33 -0700
X-CSE-ConnectionGUID: c6cvGNiKRd2AY1fNlKWWJw==
X-CSE-MsgGUID: ZDyAuWqeR9WdkoemJTCY9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="271578840"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 11:12:33 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 11:12:32 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 11:12:32 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 11:12:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvDKIHI569hU9HXEmR++276MgjL09aLzbzuOMIYG/ZJzgLNLC3YVqK6DZcHa385FPesn0EZM+ecbPyxkSpNtZwOSZZLOPCjS4Kgy9liFivPDlLPAUpzDBJC7DKAzQX0QcGfBGZBjsARBeoJQdiT2ZGvyQ6os7KwjqpLdgOKSx5w3tzqpJhD0nvzIv8WJ1rH/1dIYKYkRILvKU5tS2X5BSvn6z4aQ+n/JgU/MSB5/tvGYfYxZD9vXQ3JVtdcwdZI8AlDmcqPUhLHWED8eI2vb1IYVyls7DBjvKLW8mMod357w9FGZDnS3Uz9kXjC9lJylKAdsN158nvodoskHLI35qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+nOhaq0ash3uvuqcsa5Ip4+MpeZEQ2XPASTZkNsGzc=;
 b=IPjN4H2WQxXay9atDpRgiXi7DvQWZJIS+FmX7rcrwRTzrGvLn0b/FOHp8ZEbidSj9HAq0qV55bStcdlAC7+o8lU8VJRDevJ6dLuL5znthChZs9KFW+uzoOvTFppdf196/4oSONlM3yHB26ruUzfhLYknQ52mBehAtl5C/nTREg6HfGBgt/10YauqjtIAiMS5d4oP8X1/d33XbqQWwniDVaDFbKCjbjFSzOvjw9HwX7+ozp/lWmwSjkaGjIR7z/tRoeNlNEmDskxgZS8t7FoKnPOWbn5noUGqDVRoFgPet2ILyrvxv1RPdP4enANIn7qyoxlUyOYFjXIpMHbwa0rDlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by CYYPR11MB8329.namprd11.prod.outlook.com (2603:10b6:930:c7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 18:12:29 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 18:12:29 +0000
Message-ID: <cf747ac7-829f-4dd1-a613-378325cf3cf9@intel.com>
Date: Tue, 8 Sep 2026 20:12:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/13] drm/xe/reg_whitelist: Report whitelist overflow
 using structured xe_log API
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260908104550.1283933-1-dnyaneshwar.bhadane@intel.com>
 <20260908104550.1283933-7-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260908104550.1283933-7-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0161.eurprd09.prod.outlook.com
 (2603:10a6:800:120::15) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|CYYPR11MB8329:EE_
X-MS-Office365-Filtering-Correlation-Id: b8322fb7-2c52-4965-8220-08df0dd4be34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|6133799003|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: EVpwDic8Nx1OwzQREgskOH0bc5LUfDLFIAH1Y9eGi/WWdlPaQeL6jsgMovgBa1jbfFjPv9F8kEx1sx9VJ92KACzufRy4xiF7g5dcQmafTgJkS/Eu4hPVQPaC9fZmCy+UIBYERvmTj9i6HhIMxytGJuhpKdblQrjnzA719jnKGdhytm2ZflYz0RrjhcEkY/NTDg7I2oRI43JPnlWMdfdYlQF/UKliIJhx6w/3ca+DMQaVqkZcNEqocwDkZnaxrs5uL8M5vvQ/V0pdDpzza/BGPwreos1xg5JvHXkIczS7TwLz4LzA6Vr/DnouxXbgHL8YVt3GrqA6m6cUea6g7mjRPx2jjW/enZmarXbzfaj+Jo5M07Mc39ob45sOho9yNmgFxDHd9EPldmYolHvsQ4Iau0h0K8w6RhkCy1A68JfqpBOJe0GyHDkHlUIVqrkG9B0viCB3oz0VP3eddGkhmSuu+8vJ7AnmA8WSBTQ6RZwId5Rcg2pJ76ZM/LqHyhAgvjxWbWw42z13EmarVM4ASzykNBTWMmUG+0tPtXhDloRIzW7BoYRLhG3fh9rDJi9fEN2L/9QdSalKGOPdvtGygJub25IGpoP36r1/4gO/gCWi6UEMUunA4IRwVT4JryFq22VYVllec7T/wg0uMNE53uNEZ0TEwMROknZtEJjAtOzf8M4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2hWTXRkbHZ5T2NDRUVoRTFRWlB4anh3aGZWRW5KL3FzQ1JEVHJjVytHeGtk?=
 =?utf-8?B?Ym1NKy9KSTRPc3Qvd1g5TTdWUTg0UVRadzEyWk11N29URFpaZTlzUmQ3aHFr?=
 =?utf-8?B?S2YzMFZRV0lPL002Wkg5akd2eGEzemJpRjBNMm1rN1AvYlRTR2UxYmkyZ2Zo?=
 =?utf-8?B?dnA1YTZ4SEdKQldLRDgyYnZBYUZoL0tHcXl1K1N4a1NMTi91SFVUbk5IK1RR?=
 =?utf-8?B?TDRkK3liTCsyU3h0TFhES0tHL2IvT0o1S1czbVQrTnFMdmVqemJLa0FkcGgr?=
 =?utf-8?B?VHZHVDV2YXVaa3ZHb3VuQ1haMkhDUjlzeUJ4QVpyR0IyS1NXN082MG5ocm1G?=
 =?utf-8?B?b0FUQm9aOGo3ZEV3ai9ZUjlvVEZiUHdGSFNWeHVtZGgyR1B4TFhPMEs0TXh4?=
 =?utf-8?B?RkhmZHZoelkvNlNOa2xsL210ZUh5WklUM3pCUWVaVEhkUllrbm94WGtKazNV?=
 =?utf-8?B?bHZaREFWTk1sY2VMVCtFMXN0SHN0cGJtcjJXY0tFcTkrN01TSWlEeHZIbVpZ?=
 =?utf-8?B?UzVKMXZacHFGM25qdGlOZW1wWlBrdk0xaWZqdFpNMmk3bFZwajk4UUlnUFZR?=
 =?utf-8?B?SCtCUG5EZ0tycWkvaUVyY2JJTnE2c09aRlVhS3VzRGZIZzd3U3NwUGx2TWQ3?=
 =?utf-8?B?ODhhVGM3ZXorR05XU0J5aHNWT1ZQaUR1UDk1elBFQ0EvQjNzdWk2ZUNPa21G?=
 =?utf-8?B?UHpiUW43NXZtNUNkTHdpaXZhdnIzUmtGcHJ5OGZIdGI1WUtyWEZrMG1xbzc4?=
 =?utf-8?B?aEZDTWNFNlIzemxkanRjTlBTYUUrQ25WQ0ZlakVRWXRmQ2dFdnlhejNLZVd4?=
 =?utf-8?B?Y0Zzcmlmekc3dy9uejdsZGVndnBQck00eU0yVWFpU0lMTFZsaDU4KzFYQWlC?=
 =?utf-8?B?Z2V4aVlZMEdhT2ZQMDRoa0hCdnl6VlVYRDJWMmZSYXd1WS9LaEtCSzl3Mlkz?=
 =?utf-8?B?YkJoZWRyN2dMbUwvZWsvVnVMSEJmb3BsR3ZVUjI5QU1HZUYxS3JkSC9FVVBn?=
 =?utf-8?B?WGRzdW1rOHNpR3FwRjAwSXM2eEJXT0VCLzA2dGhyM2F3cXBBYXNvMVZHSG96?=
 =?utf-8?B?bzFwbEJJVko2Q3hJYUZ5WGxUSzBSN2tJVkdVd3NZeVc3R1QzR3JjQ21yK3dy?=
 =?utf-8?B?UUNqS3lQN2E5RDd4eU8xSng3VDR4Q0VncEl3V3NWV0JCejd6ZUZVTUtEUXVP?=
 =?utf-8?B?aHpsTVVXVDlaTVZHVnRRVk90ZnpkYmpsbk9OZlZFcWwzQjdsM3BZdUFiVmtj?=
 =?utf-8?B?MzIvdUpyRG5iUHc4QkM1ZlFkb21xcGs3ZHNxRGNjaTAwRkJuODgrOEtTQmFQ?=
 =?utf-8?B?bXFHYjVHSWhyaHZ6dXY5R0R6WWNLdyttb1Mzck00aE1BazN2ckxCNGFaU1Fw?=
 =?utf-8?B?c2hOS09uQ1NPMGlEbkUvMFpzN1Q3UXdOZ3ZYaVd5VjVwbDFqMEZkUWh1bFAv?=
 =?utf-8?B?dWlZbDQrNldyN2RmV3pwRFZTU0VqWGhHZDY4K0UrQzMwa2lzc2s2SGI3clJL?=
 =?utf-8?B?L1NMaGR6cUlQeUVaNXV3VjA0VmFlamYyMW5IUXpXRWltajdWaThCMkpHRkF6?=
 =?utf-8?B?V0JuUnRJV24vLzZiTW96NUV3bkZtZk5HTmd2OUkvM2ZzczEyUGVSNS9tb3pW?=
 =?utf-8?B?MG0yNXh1N3ZaUUl2QnREUTdQZ1NxN1RMdkxQZXNBR3BKNForWFpvdWVKMHVs?=
 =?utf-8?B?S2VKNDM1YXdwRHNFOFVjMTgyeDJ4amhyWmJGbEdvWWFmQXBUQW1mQm5kQVJp?=
 =?utf-8?B?QmtkWFVRV2ljUnRRdDVISlN0dGQxT0RiUlJiTVZWR1prc0F3KzBBTFBhdVZr?=
 =?utf-8?B?SGZrU0pzMFZhbkg5dllTaWVycjhtUzNIT3lCUFpyRVE1NWxobVZGdW1VVTFh?=
 =?utf-8?B?VHBGSkt5UlZZVEpkaWcvUnV4TmJXc0RNYlpjV0kxK3hDZnB0dk5hK0s0aUdm?=
 =?utf-8?B?WTdXVUxZRi93ZkxUY2dFMlVxNmtFQVp1OGprSUZCcmJXVlVicFc1dUR3MDY4?=
 =?utf-8?B?aVBhamlFWFVBaThWTE44RXhnQzV6UmRqUXdKYVFOVkxGVXJheDZvcnYrMXNm?=
 =?utf-8?B?UHpkQmR2K1BqSVpxWE9BQUM5RHQ4L3JEck1RZXh0b1VxOEI1SWlqRk5jS3pC?=
 =?utf-8?B?Q0NBNGRtQnJ5NndBUmgvTWpxTnFIRzRObkcwUzVFdlIwc3orK1pBMlVEdmNY?=
 =?utf-8?B?K1VGWWU3MGRDT2pBcVU0N0Z4Q21nTElia1g1MW5GYjZnNFI3MlRlOGoxQVpM?=
 =?utf-8?B?Q1FTamVXcnhrK1VhSVVWN1ZsZW92UTlLaS95bXJiUkxhdUJZMHgwT05CS0Ja?=
 =?utf-8?B?ODF4cEFQeHpnM3VNVU52ZVJGbEV4RkpQWXpjVWh0dVVSUEx0dDBkdnpIVllr?=
 =?utf-8?Q?MkmF3yzAR9ZOO3a4=3D?=
X-Exchange-RoutingPolicyChecked: rGjsOfewL4vBZOMBe6ZHiyyNg2yY/zh6iQQ7Kk0GTYuGyjC1B6VzaiaeU1SLBzzwsyZJBb4GL1AyKJsmXh6PTS2TlepcVR7wIBYOmbrCTNG9HQMExKzIBsG833LK5Cg+KxHpG53uWnEBmCq5rZ1kuLXQXQaCNYTWyRi1DWkRT6+XvqRi1UzV1IpLNvXYHGANHBvN3LCiwu9F0oGLfPueZjXkq2GvP5/O/+JPmYnuzjUfqI3ItksIaMbOAyh4uhE/2n7OXMLEaDzKMZc2G5fNeFnS/TFtli8zmpR6CKhgPdHjGrGKFm+sgKZ3WCBBHZJw0iGRWed2nnQlQApLBCoXjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b8322fb7-2c52-4965-8220-08df0dd4be34
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 18:12:28.8364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/HqeEsCpNnj8rtgKWs4n0Dx9k6nmwfXZMgDjFuFQUQecMoaHDQ3o12fvnBs9AVwQfW08nKzrBXnC6NUuuJbsrQ7i7TtSWKuY2jreYsqMgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8329
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



On 9/8/2026 12:45 PM, Dnyaneshwar Bhadane wrote:
> Replace xe_gt_err() with xe_log_err() using the REGS component tag
> when the maximum register whitelist slots are exhausted.
> 
> v2:
> - Use -EOVERFLOW on max limit reached (Mallesh)

nit: keep change log under ---

> 
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_reg_whitelist.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index cab1b578ca0e..b15004fc5761 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -14,6 +14,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_types.h"
>  #include "xe_gt_printk.h"
> +#include "xe_log.h"
>  #include "xe_platform_types.h"
>  #include "xe_reg_sr.h"
>  #include "xe_rtp.h"
> @@ -186,9 +187,9 @@ static int whitelist_apply_to_hwe(struct xe_hw_engine *hwe, struct xe_reg_sr *in
>  		};
>  
>  		if (slot == RING_MAX_NONPRIV_SLOTS) {
> -			xe_gt_err(hwe->gt,
> -				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
> -				  hwe->name, RING_MAX_NONPRIV_SLOTS);
> +			xe_log_err(hwe->gt, REGS, -EOVERFLOW,
> +				   "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
> +				   hwe->name, RING_MAX_NONPRIV_SLOTS);

should this be converted to xe_log?

it looks like our coding/static configuration problem,
maybe xe_gt_assert() will be sufficient?
or just leave it as xe_gt_err

>  			break;
>  		}
>  

