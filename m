Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7211BCD4851
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 13:15:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63A910E3BA;
	Thu, 14 May 2026 13:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2h24S8o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FD110E3BA
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 13:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778764550; x=1810300550;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JCcS3eQIgAlcd78dfzqx1Lydkz4sMtrLB/bUezB+6gQ=;
 b=M2h24S8om1nd0c9MDzUCEXrXHaMWBKJ6s2wKmKvLUrEz9CYCmSUg1wFm
 aLbnSDHRpa4L7Fjr2kPweqNK+BLWu0ViMxoMaeWQn3c1RTOjxnLgS0h5f
 viQzG9zpbXL8IcBJhyIl0zNI8D/wTCMxrT530khpf1LpM7Q9myLppsUh6
 HIYVWKraGjCIRqOQtOTBDLmhfQomPnpdRl6qolMC6Lg3AuNm5ckDp1IgY
 v1pbMw4hW9j8bsKROW24HBgxRqnh7bZGdgUioWIU3VnTnCzHk5nNk+CRB
 1xZw80LG3sSjG/HbfSK3CghPhbOXZcHXsjse3keHjfuJzQkpjdH+ebpX1 w==;
X-CSE-ConnectionGUID: 7iJTGBvsSLWJUovd1VvtMQ==
X-CSE-MsgGUID: u1u2wBIRQkWU4xjvo3LLjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79686063"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="79686063"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 06:15:49 -0700
X-CSE-ConnectionGUID: PJQ11mKLRz6CwkqNGf8NcA==
X-CSE-MsgGUID: lOXcDsozSbOM1fP5WFeyDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="233950656"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 06:15:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 06:15:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 06:15:48 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 06:15:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DN41WyqBD+pN+Osb3OYiaZ9hX7tPkL2ah9cF2Bc/dczKlzVoJdt+KWGEd/dk6/PouMtCTP/VczZC90f8UDd4c/3u0H1queo7l8/8okRrUd/J4oGul26CdPUx9oKlq1s3s2Tin5JDKC2qx2lOCW2nA/jydDIbAq5237yD4zhQf4haqe8UnNfPiRGkP7WL0v4CWxnhDvwawAovAS+0OkmAfweqN/cOSeryZtuYH3xA8Ui9JBmaN9HT5c3704WXKG/7TCl2rpphJKrexrEcxSzd0v9S6+Kz+WpIyfjabkI/H1fpphzPiUvCmWOHiO7yszQ6HKv6DSG5nhB8iZEKmgnvIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADeyeCki1n5rZDgD86S4eQYH9EHZoVA7/OjtOL4tL3g=;
 b=F934Z/7g6Lkz+UqxS15HindugKlDtoDQKa5KxEAe40PC7AA+49ocMI7HrFlotZ5pR9iCSyDTcZTRW3wOMm4x+x1BD0bmdw1sGFW8ghAtJQ1keYY4amfTyAix7igLY6uxVPuA8Fh4oOHo5gA1X2ICcfhlXJK9yU10RqPapRX+jFoWQGDZ1nU5thUHpUawk5ck8AUXfHzXsqopmlfoz3zsoPgZTZQucxUFlR+GeKnU4NCzjgaxoeXT+jzadeGZq2jZQuXBCI8pCH81L6nVp53/Ba9uX8S0w7PU+Z1iMXuzppT2FHorG6hr1RRc4m9xyOHG2R8uvZdOzS7m5WSuUi6lHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by MN2PR11MB4599.namprd11.prod.outlook.com (2603:10b6:208:26d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 13:15:41 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 13:15:41 +0000
Message-ID: <77411bf1-83a6-4270-ad37-dfacdb3d6b3a@intel.com>
Date: Thu, 14 May 2026 18:45:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/14] drm/xe/xe_pci_error: Implement PCI error
 recovery callbacks
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
 <20260511172908.1122252-19-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260511172908.1122252-19-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::17) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|MN2PR11MB4599:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aff784d-2bc4-4be3-52fb-08deb1bae5bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|4143699003|11063799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: lAwFvRniLgMua0hgpS99dme5npGJzANZTTr3nXt8lhtOiyDXfcMqrvco6ie0YUqAsI/SPCUTyI8ushZCpV0x50sG4HPe5lIY7KqYGul0QJds4tRYgNqr+3OPsXn5ABqNc4eCtmRmNnGOB+e0mlUx1mITgKvr4h3V6oLcZUqJ8agIS9mHyPbzXm10TTW7bKPyGn8uu4sOq3RR5BJDhNhW5hn+0WvHVxn+lM+sl0tksEIpkRJ1vklSiSb//YKJCl4vygGlPEuMsArgUcHbgCSd0tvphsKo8U8PbkH8QFYL5/Buk591t7st1R3B6k4Q4yxWqnbvV0uWfH/BtQbGyrl0Q46FXvx3JxkIR8YQZM6AknPcz6NXjOnKZgtqEILbGmZjv7zNVaJpbImGn1EFz8Yfhfuy4/iExN6NVKTJur5up5nJAQb0pJzpDSK3ysAVhXTJSqRtpJtJMt8bM8Sk/zeYJG3+BROUX2gvbt6d4Ec/TP/7EKtUR49KEcBGNxDe1Xsd6mhY1GOdX2w1edeTwRsbnLTmS1gRgbaH7h1lEkaozThOsAwBjFgNtK2PRywFzf6pFw91wNXL5swBqfSGPI/XconJ2H1W7NpUZEPESQBXKBtHjw/TqAayZtenOSnNwE7nF8QVYxwQHhuTn4a4BHyNeoBruUQVp6NTv3Xvh4HVExc2m1EVszT7v0Vh5ck10+meVyWctxOZqz7QkGBOBOG8jQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(4143699003)(11063799003)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVNIZ29PQ1NoNDN6N1k5Nm1VZ0lMUHF2am4vVy9UcnJ5WFZLZ1RJbEd1MDFT?=
 =?utf-8?B?dmh2UWpSQkd5YUVHbENxMmhJcitpZldENW9XYTkreXR1RjNodWVxMmpxT2Zr?=
 =?utf-8?B?TFFDcEE4N1ZNZjNnd3VqY0hlM3dvQTBCb2xQNGVoM2hzQmsxNjFLWmlwd0cz?=
 =?utf-8?B?dSsrRm1CTUlJWkxCYXkxeUsvOHRyUzMxQjRiZFM4K1U1R01qZE5kalpBaklm?=
 =?utf-8?B?MlNKdTZ3TTk2Qmw0YUxwZ0hZOG83cWN1dURRL0hnN3h4WkZKZlhjTzRudHRo?=
 =?utf-8?B?enoxbU8vb01QcHRwRlhKT3VFUmhIbFpMRmR2bFNKZEhVTTRZYWIzYlpYNVgw?=
 =?utf-8?B?ZVRkT2tBVm0xM09JTFIwNldDU3pSS0hlMTNZM2NVUUxnWTZaUjRiOGZuN3RZ?=
 =?utf-8?B?OXh0ZVp3OWpQV0p2Y2l1NVRJZk1lSW0yODk3b2tlUHdNSTVFYVFNNERKR3I1?=
 =?utf-8?B?YjlRUzhZT0p5UWdpeTBUK1ZBTEZuVUludDRqdFJ4enV3UjhvTytraGFzMzFm?=
 =?utf-8?B?OWlxTmRDNmhqMkVLamJ5RlFNaGl0UWNySXJCOGd4RWNSV0NIUktSQ3dzYW5m?=
 =?utf-8?B?dFlWVUtYUVpnUllHeHJVSnZ3NWI1UmFWaVEvV0lzWXpOZmxSZjZxOFBkakZr?=
 =?utf-8?B?OTNYLzV4dm1JeTlicmc4d2FwY1A2SVhxYnlMdFY4UnQzV3IvNk5iZjN2c0Fi?=
 =?utf-8?B?MytUcWlQNi8reXFpdjdQVStOc0JQVUlSdTVnNk84bm55OG0zLzNzY0VYVERv?=
 =?utf-8?B?aTFBUGRpL1pOb1BVaU9RL01FOGVGVWo4d0dramQ2ajhKbndsWXZYazVEZ29K?=
 =?utf-8?B?TVkvdkpVamZLVHk1V2dXRmVZZVgzV1dMOGNyczgrN2VtcVpkc3I5aWREQm4x?=
 =?utf-8?B?N2swMkZETi9vYUVQejh6R0sxVkdqZm9hWGpOWmlUQUQwdkp5NXM1SXQ1dmY1?=
 =?utf-8?B?WS8rVm1TRkJYeEQ4b1BXZFB2WW9tdUZNMHdpbXRMQ0ZZN0tSRjdma3pVRmlh?=
 =?utf-8?B?K0ZkNzhIR1FCdFYza00yUjhhMFJXTkliRW1wN2ZLT2JmT1pnUU85cWhWMEpS?=
 =?utf-8?B?ZHFLU0xObDJjNmR1UmJjSzlSM2FKQzJ1S2lLMnZNUm9tTXZSNXQvcmZXY0Qy?=
 =?utf-8?B?MzJIU0dqZFAwcG0zUXhETnkxWFUvdUVvR2tiVWFLUkVHTXY3dHFKYURFeGpP?=
 =?utf-8?B?UzhBclN3SEd4c0tIekJvVDQxYzNlL1lVdU8xV3F0NUxzZ1c2bUlyelNjY0VL?=
 =?utf-8?B?WnJyRmR3a2xFUUNWTWRPUmtJNUd0RW9BVjh3bUl6ZlgzQkpra29BcDJUY1pu?=
 =?utf-8?B?SFV1UjJZM2p3cGJoRXRFd0s4SEZ3NXczS2h4VHdxWjFYeWFPM2lTN0wxSUdT?=
 =?utf-8?B?bktjSHUvNTllRlpmUmZFMVRreDRNT1lzMmFLcllmbTRmcjR4czlGN3dCN2hm?=
 =?utf-8?B?c285dGJ4YTRUYmd3T3R6a0FDMmVxNEo3UC83Q0t3MGppYXVxVGUxby9aeEJW?=
 =?utf-8?B?ZUtHT3FBRnFlL1U5Mk5mQ1lnTUxGTmgxZUhqZDR1RTRJSGdLT2x1MU9Xc0o2?=
 =?utf-8?B?WDNhM0IvQ0VmekNNVGphbHYyVm9MbVJudVlXR3E2eHFvcUVvWDZvTTY5UHpH?=
 =?utf-8?B?d21MYy9aSlJhTm5TNG9WMXVQNXp5YnQvNWhNVXlBOW5qVHVJWFlFa2VjUFZH?=
 =?utf-8?B?TTZDdEo1N1o1ZjMxUkxmbzdnK1lVTUdtZVZQc1dDZkgwQUNtUG1pMTF1LzZL?=
 =?utf-8?B?bDhkUGx4UEZCNWlHdjFxeGVIV2srOWlweUNRZFJPVmVRNUxoUm16ekdnSDE4?=
 =?utf-8?B?bk9GdUZHM25sWmFFa21wbndpRVBrM2RLT0hvOHMzMnVVdDdNRHNSYm1oQ2Ri?=
 =?utf-8?B?ZkFvK3Z2SVhNNmt0UVFvT2Jsa0NqVEt0eTdkeU9CcnNpRGR6b0l4Wlp4ajZU?=
 =?utf-8?B?eTBHU1pGbzNHK2EyWmM4c0Z0QVo5QW0rK09NRHBaVWdNN1RuS1ZlaXBOQjM3?=
 =?utf-8?B?MWI0UnlEdkJCc0tvZC9hWDQwT0R6SXRhZFJVOFdPMXJaT0hSSjhBNzN4OEZG?=
 =?utf-8?B?T0tZMlJNWGJSZ0VQOTdSQnRaUmp3RGdvMzNyS2xsQ0MzRFhMelAySHZKN0h0?=
 =?utf-8?B?bE51elNYdWVBK3M0aHlhWkR5b00wM3E2OHpqUjgzSnF3Tlo3dWpsUk5Od3B0?=
 =?utf-8?B?SXNWZXBaNUgwbWRKbk9CZVhLQ25HSTVubFE5S2NoNnozeXhyajJha2F1UGF0?=
 =?utf-8?B?TC9xYUJoV2MxRGdORUFxWFJLR09NMkt0alp1dXdCVUVHNEUxUFk4TXZYVjBT?=
 =?utf-8?B?bU92OTdKM2ZCaUExUUhsL0dMT3JHdjU2ZmgrTkdvdWxBTmFoc0QvVXVYbEpi?=
 =?utf-8?Q?wnH5yawdcf+1bW9Q=3D?=
X-Exchange-RoutingPolicyChecked: BKI9KJVTburKuPhauxPmO8AjI9KC3MACrUHeZfmvPh4rihAuU2/S9uYLMgNRaSHqFp2W82QTP6yLRslMSf8fU8lj0JcD56CAGYRvP36wvsm55Wvxwz+kSx7iOxjJakA9DjXFnNgVjieR1GVutqCmrDZO4WXgIU2pk4jEMm8ELyhSfKQIvwc4wJLz/VOJaPLKZabrRQtfXuv9W5/NPIFHBS+VbRVdcIfKc1lEG1wm0Px8GbJpN0dMjFpKBh/20I1L8LoTYOIcoilPO7qCv3p2zhHarTjjUXhEFjeE1XdpKDmt5PcVAr0v8GD/5FgyGnT/a3Bfmib0a4RV2AAlQbdXfg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aff784d-2bc4-4be3-52fb-08deb1bae5bb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 13:15:41.2112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YnRjnlYMypxPkEyz1YlhI/L5lHnPWfkKZkaRmmCPw2GtUR0ZQTbF8tdPykAOE1wIrdhpOVNPQZjnd/FjPA3mMV0izgESs/I8ccDmFclOuas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4599
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


On 11-05-2026 10:59 pm, Riana Tauro wrote:
> Add error_detected, mmio_enabled, slot_reset and resume recovery callbacks
> to handle PCIe Advanced Error Reporting (AER) errors.
>
> For fatal errors, the device is wedged and becomes inaccessible. Return
> PCI_ERS_RESULT_SLOT_RESET from error_detected to request a Secondary
> Bus Reset (SBR).
>
> For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
> error_detected to trigger the mmio_enabled callback. In this callback, the
> device is queried to determine the error cause and attempt recovery based
> on the error type.
>
> Once the secondary bus reset(SBR) is completed the slot_reset callback
> cleanly removes and reprobe the device to restore functionality.
>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: re-order linux headers
>      reword error messages
>      do not clear in_recovery after remove
>      return PCI_ERS_RESULT_DISCONNECT if probe fails (Michal)
>      only wedge device do not send uevent (Raag)
>      set recovery flag in error_detected and clear on resume
>      add default switch case (Mallesh)
>
> v3: do not set in_recovery for disconnect (Mallesh)
>      return if already wedged or in survivability mode
>
> v4: Add comment (Matthew)
>      Fix tab (Mallesh)
>
> v5: remove in_reset
>      disconnect if already in survivability mode or wedged
>      block I/O operations in slot reset (Raag)
>
> Note: The re-probe in this patch will be replaced by
> minimal re-initalization once below patch is merged
>   https://lore.kernel.org/intel-xe/f642453c-f657-41c7-a01b-5a0baf886cd3@intel.com/
>
> ---
>   drivers/gpu/drm/xe/Makefile       |   1 +
>   drivers/gpu/drm/xe/xe_pci.c       |   3 +
>   drivers/gpu/drm/xe/xe_pci_error.c | 115 ++++++++++++++++++++++++++++++
>   3 files changed, 119 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 09661f079d03..091872771e98 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -101,6 +101,7 @@ xe-y += xe_bb.o \
>   	xe_page_reclaim.o \
>   	xe_pat.o \
>   	xe_pci.o \
> +	xe_pci_error.o \
>   	xe_pci_rebar.o \
>   	xe_pcode.o \
>   	xe_pm.o \
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index d55e5af4f4b7..d970c27f5570 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1320,6 +1320,8 @@ static const struct dev_pm_ops xe_pm_ops = {
>   };
>   #endif
>   
> +extern const struct pci_error_handlers xe_pci_error_handlers;
> +
>   static struct pci_driver xe_pci_driver = {
>   	.name = DRIVER_NAME,
>   	.id_table = pciidlist,
> @@ -1327,6 +1329,7 @@ static struct pci_driver xe_pci_driver = {
>   	.remove = xe_pci_remove,
>   	.shutdown = xe_pci_shutdown,
>   	.sriov_configure = xe_pci_sriov_configure,
> +	.err_handler = &xe_pci_error_handlers,
>   #ifdef CONFIG_PM_SLEEP
>   	.driver.pm = &xe_pm_ops,
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> new file mode 100644
> index 000000000000..42a821ca1a04
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +#include <linux/pci.h>
> +
> +#include <drm/drm_drv.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_pci.h"
> +#include "xe_survivability_mode.h"
> +#include "xe_uc.h"
> +
> +static void xe_pci_error_handling(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	struct xe_gt *gt;
> +	u8 id;
> +
> +	/*
> +	 * Wedge the device to prevent userspace access but don't send the event yet.
> +	 * Runtime PM ref is taken by PCI core for the duration of error handling.
> +	 */
> +	atomic_set(&xe->wedged.flag, 1);
> +
> +	for_each_gt(gt, xe, id)
> +		xe_gt_declare_wedged(gt);
> +
> +	pci_disable_device(pdev);
> +}
> +
> +static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	dev_err(&pdev->dev, "Xe Pci error recovery: error detected state %d\n", state);
> +
> +	if (state == pci_channel_io_perm_failure)
> +		return PCI_ERS_RESULT_DISCONNECT;
> +
> +	/* If the device is already wedged or in survivability mode, do not attempt recovery */
> +	if (xe_survivability_mode_is_boot_enabled(xe) || xe_device_wedged(xe))
> +		return PCI_ERS_RESULT_DISCONNECT;
> +
> +	switch (state) {
> +	case pci_channel_io_normal:
> +		return PCI_ERS_RESULT_CAN_RECOVER;
> +	case pci_channel_io_frozen:
> +		xe_pci_error_handling(pdev);
> +		return PCI_ERS_RESULT_NEED_RESET;
> +	default:
> +		dev_err(&pdev->dev, "Unknown state %d\n", state);
> +		return PCI_ERS_RESULT_NEED_RESET;
> +	}
> +}
> +
> +static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
> +{
> +	dev_err(&pdev->dev, "Xe Pci error recovery: MMIO enabled\n");
> +
> +	return PCI_ERS_RESULT_NEED_RESET;
> +}
> +
> +static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
> +{
> +	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
> +	struct xe_device *xe;
> +
> +	dev_err(&pdev->dev, "Xe Pci error recovery: Slot reset\n");
> +
> +	pci_restore_state(pdev);
> +
> +	if (pci_enable_device(pdev)) {
> +		dev_err(&pdev->dev,
> +			"Cannot re-enable PCI device after reset\n");
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	}
> +
> +	/*
> +	 * Secondary Bus Reset causes all VRAM state to be lost along with
> +	 * hardware state. As an initial step, re-probe the device to
> +	 * re-initialize the driver and hardware.
> +	 * TODO: optimize by re-initializing only the hardware state and re-creating
> +	 * kernel BOs.
> +	 */
> +	pdev->driver->remove(pdev);
> +
> +	if (pdev->driver->probe(pdev, ent))
> +		return PCI_ERS_RESULT_DISCONNECT;
> +
> +	xe = pdev_to_xe_device(pdev);
> +
> +	/* Wedge the device to prevent I/O operations till the resume callback */
> +	atomic_set(&xe->wedged.flag, 1);
> +
> +	return PCI_ERS_RESULT_RECOVERED;
> +}
> +
> +static void xe_pci_error_resume(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	dev_info(&pdev->dev, "Xe Pci error recovery: Recovered\n");
> +
> +	/* Resume I/O operations */
> +	atomic_set(&xe->wedged.flag, 0);
> +}
> +
> +const struct pci_error_handlers xe_pci_error_handlers = {
> +	.error_detected	= xe_pci_error_detected,
> +	.mmio_enabled	= xe_pci_error_mmio_enabled,
> +	.slot_reset	= xe_pci_error_slot_reset,
> +	.resume		= xe_pci_error_resume,
> +};
