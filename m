Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E761EEA3F04
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 05:08:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C4510E4B3;
	Tue, 10 Feb 2026 05:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZhDTYGKG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5545410E4B3
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 05:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770700123; x=1802236123;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TEOfXRoh9CtaPCh2yJs1l+Rifzu5Swxn2B3zkLxxImQ=;
 b=ZhDTYGKGBLOBCvoXVp69k7CF3OH0N4TZCEs+fRlGEKa9JAIong8s2lej
 j2UR4nZprpc6+i46I88TiNMnwHX49vpqTsVS9QNp9HpTSHxJNdw7vk1JL
 /xC/Bvt4hc3KRk8YlKdE5T/zVx3+ZiXcCJAGauKBRPHuZsM1CcgsXnLGq
 7wpDLs+t+LLHwNkqqOSZ/S3vivaotuACJD3VygrwO53N6rUvsAKWUTz2H
 1eOwSawiOrnd7ZwDxn8yLxJL4PhYAEQjsV9HxfDtsxcZt34pKKpYPTNyk
 nuNNypts+3KzMnwsA7Rjnq3Ykq0iw2bQYNpy5E1g1grQNdzhLNgnOSgfh A==;
X-CSE-ConnectionGUID: Cjyeq2joTzO9uq+p5/mZxA==
X-CSE-MsgGUID: CDihrrTpQ1u29xMtoxE5Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="59387577"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="59387577"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 21:08:43 -0800
X-CSE-ConnectionGUID: sS0usKB6QBqDgg5h+uNKIA==
X-CSE-MsgGUID: Yb/ognSyRziziqbPB7A8aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="210903435"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 21:08:43 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 21:08:42 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 21:08:42 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 21:08:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bjs7LrcCx1ULMFabj0ZkSRFIqXhSIIrLrLyeDS60/mqRp0tTSIaro4faCAjdHsiHOFetFQR9xRpogXLX4iAmk72JUWimLiRrMTZQMQ9E39nOzwFJAsUNc3f2DriP0i9RRvvoKl7G+a4L448YR2WX5V0//miH5H3Fpp0693tCidtVs7HLzJHjWEggCp0fMBfnVRBJGUfqzBmtwkKN5CKnZMAaez7XlT1ykY5TwtOyH/WZE0uV1/fWw/SitPliL7TjhnWfD3mgt0knnedKb5j9+XFW284tUxfKB+9vOOggEs92X4e6l6Y1CbSTzLI/dx1CWT4q8UeFjPALmC7pXnah4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tba7isVerfDFe+EaQmpO1qv44W0VgX6/Iph9KNBAgE=;
 b=pw47VGGHl2av2P3Xc5KtTlLjwcHQAQPUHKfNFXPHRNWSpDhjTEWRs279JdiyRONZBSPjCgq5Jh/sGw3COsP6bpaPwvOyVRWnD7pAmHoLjHcI2PJjEv2f9+WXIHg+gqYYEWDEhk536jSaZXfCST2SwxHzFF6lEhoH4jb2if/pjN9F/cWvZCEMLk5DDMNKKcvQvIzpl6Iqe6zLVXoA0Hci/MX5nrDPSfYcDAQ98tRVyPwi+gyVS4bYkz8vcC9Hbr8MwH5RFgcTdp7IgVqHmL22F/eoz2BEcUka886zN0DHkRdGGOj6wztMCfHYCB2n2FKXub3WoN7MelGLP+6L0WCLPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by SJ2PR11MB8451.namprd11.prod.outlook.com (2603:10b6:a03:56e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 05:08:39 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 05:08:39 +0000
Message-ID: <55856ba2-6bf9-44b3-aa08-3d48ae38b15f@intel.com>
Date: Tue, 10 Feb 2026 10:38:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe2_hpg: Apply Wa_14024997852
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Nitin Gote <nitin.r.gote@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20260205050818.2180756-1-arvind.yadav@intel.com>
 <20260209202310.GF458797@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <20260209202310.GF458797@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::17) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|SJ2PR11MB8451:EE_
X-MS-Office365-Filtering-Correlation-Id: 25271d9e-2df6-4cd6-e78d-08de686273aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eCt0bUJjQ3FjT0xFcEZzREFHMVpUeUdFVUV3QzE2MmNMQXhKU3V4Um1FRWZx?=
 =?utf-8?B?akJ1VG9DMjBJMU1pMWVxYkhrL0gweFFldy9uVHpFZkJTU0loaVlhZGJ5Vlhw?=
 =?utf-8?B?SWZDWlNnN1gwUWxxK3o1QmswSFJuRVpQYXBiZUlNM1BXVWxkbkRJMkFaUlMw?=
 =?utf-8?B?WGlNV1pQTWp5M3ZPWVNNUlFtOXc4bUM1REljOHI0OFQyUldDeVJpMVZDblAv?=
 =?utf-8?B?NFdJRDN2RVlTSEQ0b0JCclJlQWljcTBYQ0FpeXJOa2RWMGZyakxna0VaSnI5?=
 =?utf-8?B?RHUvMmoxWG42dlpKOFErT1NOSXlZczRNMllIZDVjL0lzQ0dRRE9WOWVpR1hi?=
 =?utf-8?B?dllqay9kcXN2NGtwdlE0Myt1eWNYc2ZMZWN0dHUvV29tVHNKclNNQ01Zai9z?=
 =?utf-8?B?TFVnTW5BakhmbmF5S3pBa3RWZXJTRzNlQjNNN3VQZldSa1hGRm1mZHIyUDlG?=
 =?utf-8?B?eml1OUx4aDYyZkdsZjFkdnNzRFFOVXlEZ3JiZSsvak1NV1BKSXVibjV3MHN6?=
 =?utf-8?B?cVBuOHQ3MDNWTFBJQmZaTEFMUVFMd29sa0RnZ0VqZ1B4ZmVXTm8ybEs4Y1Bv?=
 =?utf-8?B?bzIyOFRzNE1wSzlLNjBjN3lneW83aGNUOWU5MnpTbDd5ZytmTzdRRnYxMHN5?=
 =?utf-8?B?cURxVC9JTUtQUHlRSVd6N0llcVNtMk56UnBaQ0ZuZ2RLSjdyTklLU09rU0Ev?=
 =?utf-8?B?cmJ2YU9hZWhuVjFESVB5U1BTYmVMd0R4dElncnVHRGs0TjduMjhFVEVBWlQ4?=
 =?utf-8?B?MzZVYzBmZWhWYVZwdHZ5d1VVV3MwQnlweTUzb05FYUM4K1BYenpqMDdhNzR0?=
 =?utf-8?B?QkhULzQvY0VMUlZjYmIvUitRS3BjRE5PT29IVmRLWWorVDZ5alBnN0dacDE5?=
 =?utf-8?B?VHBMUm55QjJsellzSThLQUN0Q2pJZ2ZVbzlEQjZoaTVoYklzWklBUUxMRHpF?=
 =?utf-8?B?elUxcXJKVTYzL20zRnB5ditFMUpHbUdWSEs4U1NHNUlwc2Y5UXAwL3ZnQTh4?=
 =?utf-8?B?bms2Q21LM2Y4RUZ2QXl1eVlJMm93WU1ZK3NXM3JKMkxicWRjb3hoL1hqZEta?=
 =?utf-8?B?b1ZMenR5YWNpejZnUU93d1NQb21LaFdxL1RGaEtKOWpuU0c0MDlrYXRGKzBy?=
 =?utf-8?B?RCtNRzJnZWphck9JOWN2RllsL3ZwZWJnM2xER2dpWnB2Y1YrZ09Fd0EyMUJy?=
 =?utf-8?B?ck1YNTBtbmRMcmdRc1VuOTFaUmQ3YzNjMU5TNFZiNVN5NEcrSkI1Qys5TFZB?=
 =?utf-8?B?UFVFZ05peFVGY0h0MGI1NjJHdmhVRm9Ha2ZqRzY0UnRVa1pzSi9RNFNQS0Qv?=
 =?utf-8?B?U2R1VyszcXFTYVJMYU9hK3R6Mk9aQVg2aW93cHZsTWp5dHd3VHRXbDA2Wmw0?=
 =?utf-8?B?VnlFd2ozRXVlQldIbWtieWIwL3N4U28vMFFrUllwMnZVU1pSTEhMajZrN0J1?=
 =?utf-8?B?cENneHZvVE5TemY5ZFRzTHlDcWR6eDkzQWcrMHg0M2d5N2RZdVNGTlQwSVBO?=
 =?utf-8?B?bXlaWGdObDkrbWVmUDZsTlRqWktmMEZ0d1htNXA2akNsT0dGNTczY0NYL0dI?=
 =?utf-8?B?WkNNS2w3VEhzYlNuaEpHYytocU85VEdvcEVlc0NGcmZ2YlhSY0NjZHZmdXpI?=
 =?utf-8?B?RjZ1dHkxUDlyNDh1ekkrczZOWjBvT2c0R0xLT1lacEtjcTZUakNOK0JCTm9I?=
 =?utf-8?B?NzBKendEWEVEaXVIN0JUUnFTSnNaR0d0cjRaVTBUam1VbUpNRmVJbnlSNUZU?=
 =?utf-8?B?Mmd2d0lCbk0wRFdNV21zaVBSZHpncVRUVTdaaXg4UDFraXJuNElIcEc1cG42?=
 =?utf-8?B?U3pINUVhV2JDeXpYbndRaFVUQ3Jra1JGWFFMclhHWkFZSzB1WlEyaUwreXA5?=
 =?utf-8?B?UWEzMUlzdkgvblJpcTNyNkpTN0FueHJ3WUEyMTBMMVBqTk50d1grNit4ZmFM?=
 =?utf-8?B?QWx2Z3BxWE9QcFlhSmlnc255RDA4WHQwa1Nmd0pLSFA2YXF1eTZJaVUzeFAv?=
 =?utf-8?B?clhId0luNzZnRlFrbGY2T2RjcDdiMDZ4Z3pKR05TaG05MFFGNlZHYTdRWnk3?=
 =?utf-8?B?angzVDJ2cFhHNUVPdGgyNFdpdnM3Qm9wbFBtd1dQOVo0R0FTaStTK09oN0M3?=
 =?utf-8?Q?8k/s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THJmcDUxSlJPR1dwa3VPM2JtTGVhek43NWZlRGtJbzVNR0xXcDM5Rm1yZ28z?=
 =?utf-8?B?TU92b0IrSzVEa05WeE5HWmx0WUhnRDRKTmlBSHB0Qm5FYWdpK0J5dlFEait5?=
 =?utf-8?B?dUxYUTNHdTBjRDNLRkcvTFJLRFh6RVRpVXd4K0M5ZGxYT3lISjdwY2Q1L1hi?=
 =?utf-8?B?R2xSYWNUdFNxWTJ5R0VTMVpWRlZyb3NnVkJjYmRvR0VkVUpLZ3ZINkpqY01X?=
 =?utf-8?B?am9IRUl3MFRtelBYM3V1WmVzWnlsL3F5ZUVVVnQyc0pIa3NmWFJGcmJWWWEv?=
 =?utf-8?B?SHYwRlA5QVFvR2xFVCtVaUhNaHo0WTFuNmlWTktyeGhrOVg5YmU3NTZxSVJX?=
 =?utf-8?B?VVJrZnYvMEdHNVRuUGl1Tmg0STk4aEFFQWdSd3VwQ0JNTGM2OHRTQ2hCNjFZ?=
 =?utf-8?B?ZTQ1UmtHdFJZSk5IZHJPazJscEN3WXFMS0o4YjZ0cHhCK3I1NTZwRU5zVkVP?=
 =?utf-8?B?ZDdVdXMrSzk1cld4OEtxUmxjcDdYYlN4ZThmSUREYWNodzlNSG4wUEZVS0RP?=
 =?utf-8?B?QXM5anRWa0kxVGNPRnNrNnhZSU5zc09jeDlPVDA5alhFdGtMMFhhSXluaVUy?=
 =?utf-8?B?aWg2blA5NENBMlFrZVkxYmpBZElrVTBYTyt4S0xxK2tCMWFhYTJaeGMzY2hu?=
 =?utf-8?B?SUJHaS9yaFFJeHhabGQ1T0JtaFAvZWR3K3cxVjIvdFpWRUgxUDIraW5WSGh4?=
 =?utf-8?B?YitiUE1zalRHdGxuYUNkbDZWWGdRdW5MUUdmeEd6UUFWeXBaTWdSTWUxZ1hi?=
 =?utf-8?B?aFAvOGx0U3lUUHBSMHAwUzZ1K21DZW8yeXhoeDF3NmlVQ1JnSm9yVnBaTFFk?=
 =?utf-8?B?K3I4RTJmZ1BDVExnTlUySkF2dUs3L0N2b0M5cHg1UDFXQmR5LzNmU3VveWp2?=
 =?utf-8?B?aDgvSEgvTStpM0txMU80TFY2MGFrdHcxNStNc0NSR0R3OGp2cytZZWtjZE4y?=
 =?utf-8?B?RnVyeU1hUjFBVnVSc21ydllkbERKVzN5TTZXQ0I2UTZRanh3bW9KYmh4YnZn?=
 =?utf-8?B?MUtxL2dJakM0VytMcUU2a1FDS2hKbXM0ZHhqSXRZK2Q4RU0rZWlwN0VNa2RD?=
 =?utf-8?B?ZWRTWTU2UWtsZTFmUTgweVdoaFVNQk1YMkJUSlZVUXVDLzJTMll3Q21Benh6?=
 =?utf-8?B?YVcrcFhPaHhvc2svenhLUTE1RzBKUUcxMHlNWThMYlRSVTN1QzVJWm9EVDN4?=
 =?utf-8?B?U3Q1aVNRZFlaZHBIVFE0TDF2T0QwZUtETDNlNlhEOHVFb3V0L2kvZk5idk5C?=
 =?utf-8?B?VERGbk1INDBrVWFkeEtSR2hVenEybXQyV1A3T2x0UERpL0RNeUtNSXpvaHZD?=
 =?utf-8?B?R0wxZ3lsZk1DVFI1WWp2QzFyQUJFUk9TeVo4ajcvUkY1UnlYWGM0ODNMbVhT?=
 =?utf-8?B?SW1hOGJnemQ1SG81Z3RBampoUkNZUnc3SDJ2eXRmbEROK3pyK3A4K0RkSVFW?=
 =?utf-8?B?T2NlUnBiZ1VJc0RGaU1XUlFmNDBmOUo3R2szdWRlbjE4K1dvcHNKY05hT0ZM?=
 =?utf-8?B?NTZ1RHNoZlZiQnFLcmJla043NTBKazd3djVncDJoSHVtWDU3YURTQjRyckpq?=
 =?utf-8?B?eXBjckFYM3pubW5mUVJha0dGeHFDYVl5aFhUenRydFJ0eUd2UkNicXBOQWJm?=
 =?utf-8?B?Z2lWdXVnTUhsTDY5ZUI1Y005dWJRRUdJbVc4NWs0R1l2eEJUK0NVc3NmTi9s?=
 =?utf-8?B?TERZdFd3MStXamN2clRBSnpSTnhLK0VTeER0Z3RiL1I2c3c2c0NMSm9ldzVv?=
 =?utf-8?B?WUYrN0UybzNFRTRwcW02WG5kM1ViQUZ1Q0FFUkx3TjRURnFYWHYwSzNFL0kv?=
 =?utf-8?B?YksrSGVFeW5CeEpKQjY1YjJScnBqNnBHc1FUMmhnRU5tQ0ZveUZSM3RiS0xM?=
 =?utf-8?B?T0ZRWVB0RU4yVmVZMXc4VTVIMUswVzVjTUF5QzgyeVRmcmdNOFBqakVVbW9M?=
 =?utf-8?B?ZlJmR1oyeC83d2w1QW9mYndqU0w5eE0zZ3ZaUTArcXFTVkFQYUVsa0FMWmxJ?=
 =?utf-8?B?UExINW5HQmJTZ2EyOWZYUk1wUUlXQ0FpSU4rTjZoSVh1amtQejd4TGVyUDNC?=
 =?utf-8?B?N2g3VW5vaTJoNjBFbjBBR3FSOVpkRCsvaVNqaGdsZjhNZzN2cjZRdHJKeWtZ?=
 =?utf-8?B?WW43Wi9QUXBLUXR0YWZnNlhGaWdmZjVoZVFZc211cFNpSW5JUHBQa3VKVlll?=
 =?utf-8?B?SXhIYzU2VS9URlJvKyt4ZHRwTW1OeEhBS2JjZE5kSWxJWFdMK2ptTFZtZWk0?=
 =?utf-8?B?M0c2dENDTUluQXFuWFRxZnVlQkdCTjloTWEyZ2I2OFVUeDRUYitPU2RVb2hP?=
 =?utf-8?B?VXFja2t3S1pTZEJEZUo4L0pNazZGYzhkQmJDMnVaNWJzWWc0Mk9TZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25271d9e-2df6-4cd6-e78d-08de686273aa
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 05:08:39.6908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ENLwBuHicN2NZRDbPL13hwPRNLLaYlUJIIlmDdDTRtXw6EyKW4VUXMtodV9eMzIJHBMTqI7eM53u/D5CB0jIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8451
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


On 10-02-2026 01:53, Matt Roper wrote:
> On Thu, Feb 05, 2026 at 10:38:18AM +0530, Arvind Yadav wrote:
>> Applied Wa_14024997852 to Graphics version 20.02
>>
>> Cc: Nitin Gote <nitin.r.gote@intel.com>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_wa.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 1e8d61ac581b..2f838c99596f 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -874,6 +874,17 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>>   	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
>>   	},
>>   
>> +	{ XE_RTP_NAME("14024997852"),
>> +	  XE_RTP_RULES(GRAPHICS_VERSION(2002), GRAPHICS_STEP(A0, B0),
>> +		       ENGINE_CLASS(RENDER)),
>> +	  XE_RTP_ACTIONS(SET(FF_MODE,
>> +			     DIS_MESH_PARTIAL_AUTOSTRIP |
>> +			     DIS_MESH_AUTOSTRIP),
>> +			 SET(VFLSKPD,
>> +			     DIS_PARTIAL_AUTOSTRIP |
>> +			     DIS_AUTOSTRIP))
> This workaround asks that these settings be programmed only in specific
> cases (primitive ID enabled || cut index enabled).  That's referring to
> 3D state that's controlled by the UMD and may change on a batch-by-batch
> basis.  So we shouldn't be doing this programming directly in the
> kernel, otherwise it will be in effect even at times we don't want it to
> be.  Instead we just need to whitelist these registers to allow the UMD
> to make the necessary changes on the fly.
>
> We already whitelist these for the Xe3 platforms; the necessary change
> is to also extend that whitelisting back to some of the Xe2 IPs.


Noted, sorry I missed the comment. I will send v3 by whitelisting this.

Thanks,
Arvind

>
>
> Matt
>
>> +	},
>> +
>>   	/* Xe3_LPG */
>>   	{ XE_RTP_NAME("14021490052"),
>>   	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
>> -- 
>> 2.43.0
>>
