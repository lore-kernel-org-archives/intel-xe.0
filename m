Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4A6C27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 09:21:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218C910E882;
	Thu, 20 Jun 2024 09:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d7piCZxk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75A610E882
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 09:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718875268; x=1750411268;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GsrCuEqZprBUaqojN3d+wa0yU8T8m7PmN/v1ZqVSZyU=;
 b=d7piCZxkHoKwsxTKcivHC18npiUzClGbA9q980Foio8Qo8PvocYSXsdW
 Bez+QrUqfFcRnJH2IhyB5vKEJxayQNRqU032GyI+fotufUVS63H8ldJ1X
 zrlYlvpzVhH/TReiaeIoNVTJz17w9tApp/XXIKDL8rKotmHybiQr8EeFs
 26XcczBo9bDzPbtqL4bThqMeSCuKdoB3kwXf6NR1cHu7PSASo4aJr/r2/
 Eba0rcUo243LHzNB8lZmOHa44Yq7zr4Vgk9Z4GiGJyvNzQt4TqlhTcW3X
 WnsC27EfUeJyy2LRpxhkHiEU3VWn3rJjDr0MzNEw81/muPYd0gYyC0SHv A==;
X-CSE-ConnectionGUID: fZScDiKQTCO9TmsklBlPGQ==
X-CSE-MsgGUID: 0Iowp+bTSjWdpc2+ey/iIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15549044"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15549044"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 02:21:07 -0700
X-CSE-ConnectionGUID: NPcgzqfISkC6J80ZxDAdJw==
X-CSE-MsgGUID: nMTcrVAdTCCB+nP11ov6Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="46548883"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 02:21:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 02:21:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 02:21:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 02:21:06 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 02:21:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyS0bF++wrq3CTchkhgTGSFDwn93lH74AHu0u/bLxdQKcrfysNk6u7GuZR/24WJ6UymyMv+fbWQX0Pg80/OaNFuY5wNOfPBP6ZiZBNJ8QoXaKPcNM3g53NvtJdpkEcQzDKoRUekm4idOyua4VYLPIeISgYJoImFz7SN30gUvrCH3OM8QqQ2cypIAyKAvkAQASe3nyDS3T4nAtoXH3XGDmnsnbNaeYeSqIW8iOksC5n5pw/uXbG77w6aBeBdMzHYN5/EsAvn06ASFNKNZMEZKwbo2cwzIdnGZoE7zC30TjOpkmWsC1e+BTnHjNUBzpjsduJV2JUTt5CYlG6ja4qbdGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mo3SPjAl5zEHNr2EVDiPJGc8uISjf7VbMU7Aw76FNg8=;
 b=P3tdLbp+N/6oOerJUhbV/bMPjVtqqElAWmIHP0i+HEQQGS0iQ3PMW14n1m01WxzHOfspZQ/h2QDa58ZYx/nJnCq0n/GIqnydTjV8h3XDNiRM0niiMmKGHBDPJeiyCPpbMsFer235b0L4EPS6wOSCJk4aHTsYLMo+c7tcVnIZ3X+D+Qq+PWyFhTGhyxUH3jTYEIvnxkIZE40sj8Ys822dG2eSJ21g7JY+97fYWY+LbQ1x98WOHM1OjPB4POqXc0L42yVgd+3CIZOm6iy+ypJ+gnYeRL8SiwI/48qnRD8aXPYwysdftemmk9JLEqpzLy9EtUo6xHzNwqKYugirbP42MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MW3PR11MB4636.namprd11.prod.outlook.com (2603:10b6:303:5a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Thu, 20 Jun
 2024 09:21:04 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 09:21:04 +0000
Date: Thu, 20 Jun 2024 11:21:00 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/9] drm/xe/vf: Don't apply tile workarounds if VF
Message-ID: <20240620092100.7vescar6m672rvmk@intel.com>
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
 <20240619214557.905-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240619214557.905-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DUZPR01CA0260.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::8) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MW3PR11MB4636:EE_
X-MS-Office365-Filtering-Correlation-Id: 546b7a3d-4fc1-4716-e423-08dc910a4ef2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkJYdGVRKzhVQkRkWFhIbllZMTVBcDZzaUR5eVJZWVJzZ29NWXgrbU0zNVR1?=
 =?utf-8?B?YzU4QTdtSGl5YVp6VnVJNlEyZ1NzdmlXVm85Z29qSHVzc1ZVR0NvM0dkZHd6?=
 =?utf-8?B?NmdKc0U5RVJpdDRza0pBSHFic0NpSzMwNGZQLzYrdDN3bThKaXJKeTNHbyty?=
 =?utf-8?B?R1c3cHFMZmQyV3FpZCtjUHk4MUJUT0pPWjVuWm4veDdReG5xZFBDbXh5VGpu?=
 =?utf-8?B?RUdGbVF3WS80ZHljTFBVRW9lYjliRDlEMVJkUTFJNFI2NkFLQlN2a0JwNXU2?=
 =?utf-8?B?NnozMlVsam1DdFlnRjg0SlhSY3JpVnFjZlFza1dpYVBIbWdhT3NoYkZEZTR0?=
 =?utf-8?B?QXUweXR1Umg2ZHg2akhrTm9xSzc5MXJaUTRRS3doTkZNL3o4SWhrYTJ2ajBB?=
 =?utf-8?B?alNhTDhyRi9JRy93Z2J3NDJaMkUxWUgySVhPRUJhSGZta2pCUjZOaFU4Szhs?=
 =?utf-8?B?Z2xOMmE3ZGVkU2tTRy8rNWtZZ3h4YW9xeWs1ZzJtbUZtY2hrbjlMdXlaV2pK?=
 =?utf-8?B?VXAzcHFBRzZxWGtpUFE4SXZybDdLLzhWK2FYUy83OEJacDA3eUZVb2Qza2dG?=
 =?utf-8?B?WUFXWU5nWVE5b080Qlk5NFRBWmpQR0ZZMjNGbHRSU2gvK0g3T0Z6TldaR3Zk?=
 =?utf-8?B?ZnRlT2l5TU4vUDNNYmRPL2N5bDB6T0dGeklITHI0eGV0Zk1iMG9wdXFBb2xE?=
 =?utf-8?B?Y05SN0V4bFM0STZxbTlEdjJiOE1PdW93SUVxRll2WDZkWG9WaFRBTGN0Q21Q?=
 =?utf-8?B?Zjg3NU44Y1ByUnluWXh3MldlOFI5MlFIZWI2dGpKdnp5cTZSei82c0phNmpS?=
 =?utf-8?B?T3VpeW81b01iRnAveXduR05CTGNPL0xlQlp3NFpPY3Uvb0VtdG9GQnhLTjZv?=
 =?utf-8?B?K2k1SFFDNnU1SjducDFqL0R5VFkwTkpBTVFCdWdkQThzMTE4NC9KeTROdGFC?=
 =?utf-8?B?NzhDVlJQQkxUTTJlL05DeVJnN0dBcVZEOStuUmVhdUs2MHlvc1NOa00wZlFO?=
 =?utf-8?B?M0tZZEFJNXNvUXM3M3A2c2diTno0YkxENk9hOTVaQ2ZVbjNXM2dob0pITzE0?=
 =?utf-8?B?TWNFc0x6TkRad2pJSGVnMTJZeURDbXFtWWRZbTFIb3UyaXdZbzMxbTRFZVBh?=
 =?utf-8?B?azRNMEVuMGozZ0U4SGVSQ3RIYlp5cXMwZ3BGYUNxeDhscDRKdHlTKzluWCtY?=
 =?utf-8?B?UldaYlZ1QnFvclhrUithWkxGc1Z5ZEtXeVVCRUJmOENlRmdxV2xvTUxtOXVD?=
 =?utf-8?B?WW81TGE3UjFJL2p1NEoxVVR3SEFyTmFBa001dE1oeFdhSCtWQUlLNk8vY3VT?=
 =?utf-8?B?L2c5WlRjNnFFYzBwcy8yeTV1L3JpRTdjKzVEOHBha2sxYm1Gb0tXcGlKNU1O?=
 =?utf-8?B?SVd2NUtSQWJzeTJxRUVFYnVjR0RyVHd3RUdoR3ZCL0VHQzY4dEY3VXhGaFps?=
 =?utf-8?B?UlArc0FvTHc4MGphM3NURTdLZWFQeG0zL1BnNWw4TTZGckhnci9mUS8vdy9U?=
 =?utf-8?B?U3JTM3k0Q2xzdWQ2YjRheDcyM2RKR1ZDREV5NUJZWVhJbXpvNlE5U2RnWlh5?=
 =?utf-8?B?aGI0ZjZZYjdBeG5xbWFoemxnbDcrL0puamtzdDJlTVVBanUrZ0NzZ2NwTW0w?=
 =?utf-8?B?STI5Q2ViUG82YTNGSmpCNE5oTHhUQ1BYV2xObVg3eUd4SWpUdEpIMXFIbFpp?=
 =?utf-8?B?K2xMMk5XOGNGTmZKZ2k3RzJiME5TT29HRm1MWFJvN2psQ1F3MDVGVjZLZ3Ux?=
 =?utf-8?Q?6RqbUlQLuPT0vTXLy80UKhdvBVxd3bh3gx5Qzil?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2VTRzNUSlBjdVRFUWo4MUxzcEVPck1ma3JzZmhTSkJEeVViZ1k2TVNuM3dH?=
 =?utf-8?B?R21pSk9McHhDUnFCNkJxSEdzUGZMbUJPSXcwRFUxMXZHQUV6NEVmbDBCeTZC?=
 =?utf-8?B?alN1aHlxSW9sVDkyS0hUcnZXTzAzRzlVWFdWZ3RzVmdpdVRIUTVSN1RpbXd0?=
 =?utf-8?B?bWdGZ2x6R3NUUXZNUGVUM2dQdzQ2Nk9iYWJzZmp0VGZsZ3I1c3Bwc2JqOTNO?=
 =?utf-8?B?VXpjckE0dklhSFNRY1VDR0ZIV3FvR3NvWENGOGhxczI4RlhpTExsWXA1Rk9u?=
 =?utf-8?B?aWxYYXVmMEJNR0V0cENUU29kajBYSVFUdGtKaTZpVVlNNzI3dUY0YVZJcEI3?=
 =?utf-8?B?QU9SV3hJay9xQ3RSaDV6MEZlSzZsNWpLMmhWSzREay9WeW1JQmtad3lWZjIz?=
 =?utf-8?B?bnZaNjkzT1M5NkRNUDZMc2FFYm1mZG1tdWVCRE0wcmdUc3RxOWJRanF6emh6?=
 =?utf-8?B?a3lPNlZnOW9VR1VVRXNOMU0wUW1obUoyZTVhY2Q5Vm13dk5McXhqNkVGbEQy?=
 =?utf-8?B?bk5tOVZMUDBxZWV1TUV6ZWk1K0dWNHJrRzhuWE1qRGRxWEdoRXM5eEJFKzFJ?=
 =?utf-8?B?OHJJYStIS2s3R21wSHZmNnMzUmFwdVRwVThIUUhUOVkweTg1TUNSVER1U0hW?=
 =?utf-8?B?NkJ3YlRIeDUwbnU0TC9JR2xQd2pwK1d2ZHZlSHRQdDFrUGlZaWhnYUhsb2kr?=
 =?utf-8?B?R0l0UGVId2VjYjh2UitKYkhrbXpnaGlocCs0M2JudmUrVmUrTVBtL1lnSGxt?=
 =?utf-8?B?RXE1Nm52ejhZRTBvcU9sdFVXeGRaQ2huTnJvNG52WFlyMkIyc3RrSlhTUnRn?=
 =?utf-8?B?MVFwWEtEU1hlbEdHVnNPMDFiV2ltdXROdjBsRXE0cW45TVN6em5KR0F6L0ZZ?=
 =?utf-8?B?WER5VnNibTFzaUFjZGk2MUN4ckRCU3VaOHUyNERscXRtSjZrNmxyVnhsQTUr?=
 =?utf-8?B?QjJnVWpkWHVGY1UrdHdoWjEwZDYzSGxONG9ZUkpUUHdtN1lMRE5lazNXNUpk?=
 =?utf-8?B?bDNxYW9SamtBakNVL0x3STV4SlVaUk12ZmczNFVPWERZNHQrUzNDMG1ZcFNC?=
 =?utf-8?B?TkFnR01LZEhXNWM0dmczN3g0azFxaEczTkZsZVlDK3R1UDN1Rnh2bk1sQi8r?=
 =?utf-8?B?S1NpQ0YwTGxCWFhWc2p5TDZ3ci9OYlRVOEVXMG9BS2o5N0V2QmdkQTdJZjI0?=
 =?utf-8?B?WVlJeTVYdWhjZklmYnZCekl4SStVWk5NRXliZ3d3aHNpWm93OHBwT3JFZjBa?=
 =?utf-8?B?cWhQMFdmR1lPTEN0MTQzdU9qd2Y5c0RybkpsZjIyQ1RuVGVjRFlpZU5JbUtt?=
 =?utf-8?B?Wk9YVGljbk9zcmNuVWRSczFaVGN0WXkzOHIxek9ja3FraUFHbWRPbjZaQjFz?=
 =?utf-8?B?di8wSWtjQmtRdkZHcENTM01xRDEwM2wvTXA1eG84YlBobTd5OWJqUDFONkxB?=
 =?utf-8?B?eGZteFNzYmJiQnh3R2krcGpGS0VjMUk0VjN2TDBqYTZyUlNrM2s1bEZPaHB3?=
 =?utf-8?B?bmxnSko3eVQ0dXZ5NS9TdWlqWU40L2pCOERGeXFrNWRYTDhJOHhDczRodFJr?=
 =?utf-8?B?VHQ4K3lPSHlGVStmUWlpUU9DVkszSHVJRkpVM2UyYTlFa2dXWHlJSS9QWDZD?=
 =?utf-8?B?M2FBb0k0NTJqREdSWnJRekNhZDg2Tm9yaDRDR21KbkI4OWtqLzEyMFd1SE9G?=
 =?utf-8?B?OG9YZDNaZEV5UW9ZcmtrMk5HOUhnbEZaSnBlakVZcGRmTmNRRnprdVRWMWo1?=
 =?utf-8?B?SXBCZjFBUTZOWUlTY3I3VDluYndWK3ByZHRZUnUzcXpjNTVpNlo5NVVPQVoz?=
 =?utf-8?B?c1hqbXA5NXhES3BYTnE5NVpxcHpnVVlNeTRkV1lDL3VmbEFkVlBTcFZLMDFo?=
 =?utf-8?B?eDdsYWNseUlualZ0UUtMNjlQVk5PK0JLTWZUL3VpK0ZmNm8xakl1VUFqTzQw?=
 =?utf-8?B?QWx4TzliU0h6eUp2S1RuZ1Z0SHBpT1BKLzNSSVZLSHQ2R0U1anVDMDlMc2M2?=
 =?utf-8?B?dFpjS2tPOWUzeFQxTnRKUEd1Y2xpQjczSDVFeVRNRVpiSlh0MEtUcUJHdy9L?=
 =?utf-8?B?ZzN4andxbTBXRXFpMTZkdEQ2VXlpa2hRRmVRSXhLTXFEcnltVDVvWXhPeTBM?=
 =?utf-8?B?WkVYUWtxNFZFZUgySkpkZHg3RmJlOEhPc1FlS3Y5UUppSDNLVFoyNDFuYkti?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 546b7a3d-4fc1-4716-e423-08dc910a4ef2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 09:21:04.1621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i31ZaYm/+0yJM+xLyfwoU/sXUvQSLrI/J/LzWbQJbZleFS6WPpx3g44TIa/bfVwc7r4xxRj+u37sryUQQsYTrDnr1qI21eBTJPPuZAyZWas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4636
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2024-cze-19 23:45:51 +0200]:
> The VF drivers can't apply any workarounds as they don't have
> access to related registers. Since xe_wa_apply_tile_workarounds()
> function is not using RTP yet, we have to add early return.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 0b6fbbebc41e..73dd06ad50f8 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -21,6 +21,7 @@
>  #include "xe_mmio.h"
>  #include "xe_platform_types.h"
>  #include "xe_rtp.h"
> +#include "xe_sriov.h"
>  #include "xe_step.h"
>  
>  /**
> @@ -865,6 +866,9 @@ void xe_wa_apply_tile_workarounds(struct xe_tile *tile)
>  {
>  	struct xe_gt *mmio = tile->primary_gt;
>  
> +	if (IS_SRIOV_VF(tile->xe))
> +		return;
> +
>  	if (XE_WA(mmio, 22010954014))
>  		xe_mmio_rmw32(mmio, XEHP_CLOCK_GATE_DIS, 0, SGSI_SIDECLK_DIS);
>  }

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
