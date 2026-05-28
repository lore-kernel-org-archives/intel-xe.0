Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519ABCD4F54
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 16:17:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9ED110F401;
	Thu, 28 May 2026 16:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZwZFkaZh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D972210F401
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 16:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779985025; x=1811521025;
 h=message-id:date:subject:to:references:from:cc:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mxlZurBstaIJJpXePTrTCXNyjGXJhYPIpIB5IjQKHH4=;
 b=ZwZFkaZh3MrQLCrykOVcPWyJwX9CmhH96ipVBm1J7HqRrmfPjABavs2X
 9Dr9pWhDI8DYPJVh8N3OsuTvR4MWAeSNCWc9QrjxiBESPMiW1wGQlRe9w
 dCrbvZwGvU4dm0H3/rm4GIp1P071osTznn43jL0WqqRDgsqRStuFpvind
 ihndKNcoO65i1R4Y50a/2NS3yU4pk6V94ezIOaJpuW2jQspl9hah4M4kA
 Y0BnYzb7oNotUmmv/pVUenYilinKn9xOQqQ3XxX5CqZz+fH9ym9bKuscf
 8T8AsumFEcLI2VmjcLXFfqNpPlMZtVe2604jv6OgPvcfkkdSOZrE7VZPv A==;
X-CSE-ConnectionGUID: B+7KtoJ8RnmoHB1LEUJQHA==
X-CSE-MsgGUID: 8iYTupJ7RLOkXJU/IeUihg==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80803052"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="80803052"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 09:17:04 -0700
X-CSE-ConnectionGUID: 5afi3Hg3TTON6fv+ksZDYA==
X-CSE-MsgGUID: asazAjFKSRCdXsLQToyNjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="247540744"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 09:17:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 09:17:03 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 28 May 2026 09:17:03 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.18) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 09:17:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQ2b4gM36JCFtUw/XVhtM3Zz6DcD29b440kxKMKEEGhVQEow2sw0Csr2FNkLMotDl25SRmB6TonlNkFhr4ooZgpYyGVQXP7bxmcj3wnf27acIUMEpUJB8/901u2PtREvAh2Rz3E4k4WLuTneo/D+iM8F4B2ceKSnip00Ea1Q02xczBmF3nno4PzzjIUlS+u39poI90yuznx5XCJhI+w5t7Lqcq8LbKm+sVHHK/GewdGPUyvVsi4fCK9amap2krBkw/ryPGaJNYdQA2zMvFRJso3AyEaTG3+JA0ELcklaFxLyKhU8AqoK7nGszyg1YgfVRSuU8kezPlinGKg4rg5C4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iu9GkAEizW7B/NLIBzSr1cFEJKJg5i8Scvoi4rcIJM=;
 b=kG8m1+oC022b1Bd/fbM6ROTLoeBIyFx40tN5CvmvZhxUwimsjGHSDp0LIj42pOt/DxMOkJnOlqajJMN+VjeizyHXvjO55G/lgNBrUeNfSMEgrmv3mTwwJQSFuKu4Uy0+jUvLAN2Mt60ftSvCSfcmk1941z7VeEGnYo75mu+TLsmruXcQ2gsAYxJI5Kr/DLzdof+e6UTtHaTxd9GAXyJRJwh8AqeSPpN6NHGc7GBOkybJF5yrnuNLxsuRdEGdBpJAlUbRImyFpTyIiX/fn3ABT7y6ImCo1Wz8IDPvr/Wd5LMnPHrmyT9dJWMWzPgbflw2OrN2huz+FRh1g/s036mb6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB7595.namprd11.prod.outlook.com (2603:10b6:510:27a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 16:16:55 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 16:16:55 +0000
Message-ID: <d7fd718c-413a-4a7e-83d4-cfb0401194fc@intel.com>
Date: Thu, 28 May 2026 18:16:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/mmio: Assert MMIO is available
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260527175437.22585-1-michal.wajdeczko@intel.com>
 <754ed1a5-ed12-4e0e-bafc-5775106d8e14@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
In-Reply-To: <754ed1a5-ed12-4e0e-bafc-5775106d8e14@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0048.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::19) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: d8349030-fa18-42ce-561e-08debcd48907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: hmCsDeacjgI2sQNIvECZw4rvLvEbnNHAonKyHc4xXzvxR38hLAfKh/c0tR2RhhB0ZNbZR3/827SrSENMPaNT4ecHGmRSaJiWSN5WM9fpo4FAPqd2xMLPCnTvvTcaLbpdetFhYJAviTlG7Nf+J7kkoKjrWpxmNMwiZmCx0Hr6gnJWoQ0178lqN+0loF1f9DC7TqPxUIMRZXYvrXtM2WOFW4DCber6SyVyDNeqoYiIsybVLw2Rz+qy+l4+tO8A80KXV0GVTeObPWtj5bTroWHFwaZBxALcpqAx4C2r+sENjda25jHDBi8Wm/Z2RX2iVwnYQFj7w24xVUV6KGsH1ldscidxAf3gaQY8rwZcba0mdWHMHaHNzsaaB86yxlab6rrxtaBSpEPgSBEqfSSwZGyKoOxxFzO4PHEVYVEW+EvLYUqkvQ/YCW27wPp7nAehTcLaYksRT4XwK/cQVTtN709O1O0Xe18+kkRItS/47h9cCS6Bu3YH/OgxcaCMsLiAQ7srcpMAtzG8RPa01EiB6rnS25Sc7ZOctYRWVX91zIElUKvlGzit5zv/Skoom2JkPIv5ozNZXo7iAQgRT89jOOuCs+BUrNN00CDXgUqO9fBX7xtklTx3JuEqRBhOWW6ppkMnIT1frAIO7rqtHunSiR2p1mvldTV52rUs8EvJVoMIsqw/37JAMLYeNAl9TwammBh2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlFpdE15UDUvcUpUd29ka3RXU3dpQTNFN242S2U3NC9UUXdhSVpaeHhwRmVI?=
 =?utf-8?B?bVd4YlExNW5uSHRQK2RzRVA2MzhFRWExZDVXNnRzWndaZHQyOFNHZ1p2cGsy?=
 =?utf-8?B?dDI4WVZHOU1uTDVlcENKZHI3QVcrM29rbTJCQUV0ZGdMVXY3cTYzVXpXd3hR?=
 =?utf-8?B?R1FneFlDbHJtSWNxSitaMXhqVmdXNmtCdk1SL2tpV3c5YmtLRmZBemtwLzA0?=
 =?utf-8?B?VVRZSW9lOFMzZkUwVlVSMnNYZ0Q1WGhGamExN0tGUEtJeG1xK1N3cmx0UzZ6?=
 =?utf-8?B?eldDRkZJR3BqaWxqN0tNaVVTa0xjYWVLUGNHR00zamFLQmdEMG91SlBYTEtQ?=
 =?utf-8?B?ZjhyNW5aSnFjdTlwalcxNW9MNEZZSWZXdHhnSCtaRXE5UlN6YUh3MDFuR0d3?=
 =?utf-8?B?Ky9QZjg3K3BKWC9kOXFJSFNNNUE4SDVZMTErcFY5bjd0RGlrYkpGRERwTkJ3?=
 =?utf-8?B?M2RJSm5PNjlJV3NMVzhibTJqS1ZWUzZKSFdCTWlzY3dVUEFNQmVhODhRTHFI?=
 =?utf-8?B?WU5IN09IZkRwcmo2QURFMGpEOG92aDNrUjBRTHVrUFdRMlY4N0szUDlRZ3Az?=
 =?utf-8?B?aGlxMFhrcDNMV2hkMGdPOG1id2xZZ3ZuenJ1MWxhT0NWaUhaUmhLN3N0OXEx?=
 =?utf-8?B?WUVrdUExVnhDUDUyeVMrRmIralNQV3g5RDhLWVJBSmUxU05ramovM3RaVWRQ?=
 =?utf-8?B?K2ZYeUNwZThnZnRnbTlWVUdMSWVVRnh0ay9weCt6cm5EYklEb1ZHcS9Bc2dC?=
 =?utf-8?B?dEFMdjAvK3A3UFFXTmtGVndnOFpvWmVzL1cyTk1rdDhhZTN6SE8vRE01MUxi?=
 =?utf-8?B?emZiT2F3cEhMSEtLMU1aUnZpZzhmRVdhOWlFTUFZR01TYWtUMm9BTW9DQkNW?=
 =?utf-8?B?d0U1aG5xajNhQjhLMmlxMG5ObmJReHBWSUFxK2xOL0xDcjZ0Zkorak96MFZ4?=
 =?utf-8?B?cXFCM1FNaENoSU5TODMrS2xvVkhvbmZvckJRTmYvNkdzNitGNVNKL0ljK2M5?=
 =?utf-8?B?ME1ZenV4eExtRFhNUUxVREVzOUF6aGV4dmtrL3h0enh2OUhXaWVHSGNrUlJi?=
 =?utf-8?B?cEIyT2luVDdDUWU5cExBcVFVdDJEck94SE9jOUsydkljMXYvb3laRUQvMDB0?=
 =?utf-8?B?ck5zUmVqeWVLUjJ3OGZkMHpkaitWMjMrdkVhU3FIM080bzREeGhYYlMrSk9E?=
 =?utf-8?B?MkJNUHlwSktnSkl0VXIzcERFSk9UTzNWRVZQMHhNa1E4c0VVR3kyRzUvRllx?=
 =?utf-8?B?NkVyUk1MK3BkaFErRXM5QnFKNStDRk96RDUrZWd2REhYVldLcjVYNDVSZzRW?=
 =?utf-8?B?ZVQ5V2p5Z1NIUzJhMzhqZ1Y5SXFvT2wxWElvYzZiUmJrblREUXFTek5FL3E0?=
 =?utf-8?B?M2RTTm9EUDB6c0NIbzhNQU83c0RzWHhRTmlvbTN5YUZZelZPRm00dm43TXhP?=
 =?utf-8?B?Y1BzZGdkNU5LS0xIVFZpVVJlVGFYMC9NOHFNZUZVVlkvQndrNmVjQXM5MFN2?=
 =?utf-8?B?UG1XMnZLaWIxQzZOamV4R05ucENKYkhDQmxOZTI5SVoyeDVMNDJPZWJJcDJn?=
 =?utf-8?B?eDRJSk1YbTdnWjZXUW9LUVhvRkFNdVVWZW1pMit3dGtxWEpsMjREamZVK0xm?=
 =?utf-8?B?cURkbmduWFUzc05sUkh3Qkp5Ym8waG1VdE11bUVjZElIK2x2UGUvQ252VHJ3?=
 =?utf-8?B?MGV0WW00WGQzQVRPdFQrNTJFcVdHQU1nOVpsQ0Z6TFB4NzYwN01qQ2kzbjBM?=
 =?utf-8?B?N2NhUk1lUVdjU3Q1U0o0b0twbHFNWWdtU040YXh3MVo3TlhSbDMxcHJqTXdn?=
 =?utf-8?B?T215bzI0NnpRMmlXWC8yZ2ppY0t1ckQzTnZhWG1IK0xxRnBRT0RnakJRbHFI?=
 =?utf-8?B?R2NBejRMSGhJMHRHYnBqRllxMFNhS2dMbnV5UjhEYktNYnNJZ2lGTkF0Y1RN?=
 =?utf-8?B?Zi9JYmNlNlVtampnd095Tzg5ZmtLSEt0YXFpNHdOTEFEQnpSVnRKTjhTbmc5?=
 =?utf-8?B?em1ESlBBamQweFBZczF5RVRGbysvNXp6QU9ydXZlUUFPZTBWMXZIcTFiSVFJ?=
 =?utf-8?B?VVNOZllDZXRvRTU2MWdVZW9HTCswRW50OHF6WENnWktJVDNzWENHM0QrUlo1?=
 =?utf-8?B?NkozQ1YrdlJEL1lLNXRodzRHZEF6Rlk1ZWxncFNKK01PNkNTL3VSczFpcUlV?=
 =?utf-8?B?bUFPcFNDclZYNnRsUEphMXhYZWswV0MzZmtHSFdvRXRBSXFmekZ5Vkc5bTU0?=
 =?utf-8?B?eGV0NHQvR0ZaRWVwSG55OU1Dek80OWpEK1VFcXdEcjZVa2g4WHVObnVsaXlJ?=
 =?utf-8?B?MkZWWUdtVmlqL3hOYnZhRWpQVVhtSmk0cG1zZE1ndWNjVlFwcHlnNzVZb0Ju?=
 =?utf-8?Q?j8HDU3duPl0AZBZE=3D?=
X-Exchange-RoutingPolicyChecked: kCbuwVw6VYZqxZhs2IqfgMH5iTG0k8qBMzHtiSJ0SMmpzSR9JzXK95ExXTN9SLEYOOnfNo8NGRxOYiQ76kVK0lnzrKKvFJurVIMms41f2155M0rdcR0r0MqK+hW18ss4cDYCYJnugiqo3yPGQxuogoBNtvQOfcRPEEE6XjpoYxu2fhU7LOMwhj4cobZS1hwdKNvzNTBKFI6cdpfX4q4ri3ykNrVnwHhoHtsyAv+23g6GbON18s7mavrfqiE75zlfStCSCcpGwHuIiZeXhD6JCAGANrdQmZVNxb1L3Z6lafoxLZnUH0s8Rm3CSUpBwvHR4AURW+xCa8alNq1bY3uwnw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d8349030-fa18-42ce-561e-08debcd48907
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 16:16:55.3915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYGPNM69hDfiIsxJoqe8H8hX8HLTBMaXXOFZA4l4Lo1Nkl1XhPFDz2lhcPT4SV4H7IroGBl0FBcpZe37N+/0yULBPxKz9xQruBqQoLIkTfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7595
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



On 5/28/2026 11:13 AM, Matthew Auld wrote:
> On 27/05/2026 18:54, Michal Wajdeczko wrote:
>> We shouldn't access device registers after the device was unplugged.
>> Instead of relying on the NPD splat due to zeroed xe.mmio.regs, which
>> might be unreliable anyway as not all xe_mmio are using that directly,
>> add an explicit assert during xe_mmio read/write operations to catch
>> invalid accesses to MMIO after device was unplugged.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_mmio.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index 78adb303b663..b77a717f0556 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/minmax.h>
>>   #include <linux/pci.h>
>>   +#include <drm/drm_drv.h>
>>   #include <drm/drm_managed.h>
>>   #include <drm/drm_print.h>
>>   @@ -128,6 +129,11 @@ void xe_mmio_init(struct xe_mmio *mmio, struct xe_tile *tile, void __iomem *ptr,
>>       mmio->tile = tile;
>>   }
>>   +static void mmio_assert_available(struct xe_mmio *mmio)
>> +{
>> +    xe_tile_assert(mmio->tile, !drm_dev_is_unplugged(&mmio->tile->xe->drm));
> 
> Yeah, I was hopeful this would work, but as per CI the unplug=true needs to happen before the devm actions run, 

yup, we mark drm.unplugged = true in our pci.remove hook:

void xe_device_remove(struct xe_device *xe)
{
...	drm_dev_unplug(&xe->drm);

while devm actions are called as part of the kobj.release hook:

static void device_release(struct kobject *kobj)
{
...	devres_release_all(dev);


> so we get a pile of false positives with this. I think the best we can do is NULL, or perhaps mmio.unplugged and check that here?

there is pci_dev_is_disconnected() but that one will likely cover real unplug scenarios, for which we might be completely not prepared ;(

but now I'm wondering if maybe those 'false positives' are actually a good one, as it might be risky to access the HW during final SW unwind, like here:

<4> [45.999577]  xe_mmio_read32+0x38/0x290 [xe]
<4> [46.000710]  ggtt_node_remove+0xbb/0xf0 [xe]
<4> [46.001167]  xe_ggtt_node_remove+0x40/0xa0 [xe]
<4> [46.001618]  xe_ggtt_remove_bo+0x87/0x250 [xe]
<4> [46.002076]  xe_ttm_bo_destroy+0xa2/0x2d0 [xe]
<4> [46.002917]  ttm_bo_release+0x70/0x310 [ttm]
<4> [46.004082]  ttm_bo_fini+0x3c/0x70 [ttm]
<4> [46.004424]  xe_gem_object_free+0x1a/0x30 [xe]
<4> [46.004857]  drm_gem_object_free+0x1d/0x40
<4> [46.005231]  xe_bo_put+0x12a/0x190 [xe]
<4> [46.005618]  __xe_bo_unpin_map_no_vm+0x49/0x70 [xe]
<4> [46.006097]  devm_action_release+0x16/0x30
<4> [46.006449]  release_nodes+0x3d/0x150

and the fact that mmio.regs is still non-NULL and points to the connected HW, is just our luck?

maybe we should kill the HW immediately on pci.remove, if it is still present, and just unwind SW state using devm/drmm actions?

> 
>> +}
>> +
>>   static void mmio_flush_pending_writes(struct xe_mmio *mmio)
>>   {
>>   #define DUMMY_REG_OFFSET    0x130030
>> @@ -146,6 +152,7 @@ u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
>>       u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>>       u8 val;
>>   +    mmio_assert_available(mmio);
>>       mmio_flush_pending_writes(mmio);
>>         val = readb(mmio->regs + addr);
>> @@ -158,6 +165,7 @@ void xe_mmio_write8(struct xe_mmio *mmio, struct xe_reg reg, u8 val)
>>   {
>>       u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>>   +    mmio_assert_available(mmio);
>>       trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
>>         writeb(val, mmio->regs + addr);
>> @@ -168,6 +176,7 @@ u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
>>       u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>>       u16 val;
>>   +    mmio_assert_available(mmio);
>>       mmio_flush_pending_writes(mmio);
>>         val = readw(mmio->regs + addr);
>> @@ -180,6 +189,7 @@ void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
>>   {
>>       u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>>   +    mmio_assert_available(mmio);
>>       trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
>>         if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
>> @@ -194,6 +204,7 @@ u32 xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
>>       u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>>       u32 val;
>>   +    mmio_assert_available(mmio);
>>       mmio_flush_pending_writes(mmio);
>>         if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
> 

