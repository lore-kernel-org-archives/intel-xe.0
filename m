Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD254C5AD49
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 14:58:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D1910E38D;
	Mon, 26 May 2025 14:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fr1bG6Ob";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BB710E395
 for <intel-xe@lists.freedesktop.org>; Mon, 26 May 2025 14:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748271482; x=1779807482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=obxbR9/aUUe11dTBR+RXUQMcLYu+M4MziCd3ZcZSbsc=;
 b=fr1bG6ObCj60Axtfmr115HD+nwVXMUEaz00/sIwVQG8AxnvUVxd+Y0Fr
 pim48XsvysvFwN/F3G2TxG6pj7fSNaHDqHn9+72BvGFSzFhmZ4rbpl78Y
 aJP70CFV+mXGV5zcbzckyly7RhH/2j6kZPrHhaxIW4FXZsBn7VLmbxwtr
 nh5/mDBZhUdnKGheKigrtcLUjeHNkCBNNovi0sU4K7fqmffTN/E5xOrEH
 zgHKy187JhDjZndbzhel6GhCbaLDBluNzpYjpNRm9i4I1QIfUeuQJKdu7
 dSAVrCGdyE9KP59qICH75cn/kOty1woYc2GoHV1yAxO92z2wGUBr2wWvJ g==;
X-CSE-ConnectionGUID: XSgGIzCfRgeVPhHBEez1uw==
X-CSE-MsgGUID: 1q+2702FSxiNqayTILsp1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60880007"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="60880007"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 07:58:01 -0700
X-CSE-ConnectionGUID: RmcYPM7IRcSSKKqUENgWfg==
X-CSE-MsgGUID: 0KOoeJ/2TPOWXi1DtNM4sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="146305081"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 07:57:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 26 May 2025 07:57:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 26 May 2025 07:57:53 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.44)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 26 May 2025 07:57:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3oNbsds25D1d/ZUMtytvHIf62clkbWlpc96oyvdef/CD58gaK9XWTQ/NtHJWqoY7TaKuHaxHP+kIUEaURGS4OUlWXtgHJ8yuKHBCHmiku1wP8eXcwAPZq35BS1C4VhBaGH4N3UcuZo/dO7F4o/t+3IffcenYhSdivif5ytCw2Z9jDOnasoJvJ2PQH3kNVdbAEypZgHLFnEHJlmIYInIIuJMgCjyKKEOBMt5nNvxKlrLX1FDFMDi3QKuq3/1HErpopRBs9EGC4ABO75AccXfjjI8TgEyActx9AqsIIP1oq+cA+S/rcN7lvnv/cGXA1VySx0GMrYrbzQ1xlcjZsuvuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cREZOBXTQ56IW52DKQkSufNZUC2517qCWzw0je+7M8=;
 b=WqguJK1/iCppoJGxcfRjvl0Kb5FeD2aSi6ue7+Qp+1IwD1mc8IcblUNMccncH8XFw8hpfLXn3Wel6x7Ek4jrLdrcq7eA35IskekSaMx6jlQ1r1e4tw8V8PcFu/Y21/plqIyzRkRvA+FBLmSeKUWqcN/wfRvAtN2Pl0r0Dpxv1i/rBNft59zXoxFl+7h1de2Xn+o4jm4aKnqb27YvELi2jQfJNUuk/CfoVuyB/G5vmONkf4e/jQHsjFgvEydd+9X158NIMZU3CjWXkrF6tBFc59YmyeadDWagfNFOqbh+KUg/M9qn8UEjwD6bTbF579xGxlVDWJWuJFeAdFNHd4+Ldg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA0PR11MB4640.namprd11.prod.outlook.com (2603:10b6:806:9b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 14:57:24 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 14:57:24 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Stuart
 Summers" <stuart.summers@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 1/2] drm/xe: Use dynamic allocation for tile and device VRAM
 region structures
Date: Mon, 26 May 2025 16:56:46 +0200
Message-ID: <20250526145647.1958756-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526145647.1958756-1-piotr.piorkowski@intel.com>
References: <20250526145647.1958756-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0239.eurprd07.prod.outlook.com
 (2603:10a6:802:58::42) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA0PR11MB4640:EE_
X-MS-Office365-Filtering-Correlation-Id: e9462bd0-7213-45db-650f-08dd9c659fb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWJ2VXpUdThpNVJCV0JmZTlyMHMyTHptMWs2RzJ4aWYzTVlvSDJ0MGZPdm9q?=
 =?utf-8?B?VjlMNU5yZWduajQzdm11VERCb3lLaHdnaVc3MEx3UkhKdS9pdGx4bHZKdlk5?=
 =?utf-8?B?L0tXdUNqNEZvVS8yK3RBajh3bjZRYjk1YjJYUWI4Y1FqMWU0OHZ1ZHlsZ1d6?=
 =?utf-8?B?T3hKQzBBVjVCTEhMY1R0amNHdytyK1pFWFUvSzBNQlBuMGpybGhkQjlNQm9y?=
 =?utf-8?B?dktlU01mQWNpVkVxRmgyYU5wODF6WDhrU28waGUxNFVGT1lGWlNxMmhwbSs0?=
 =?utf-8?B?cGE5akI3cUs1WWNIUXJnVm1uYmo5SXN1TGZIUUl2UmxVQVBoVlB6Q0RxU0p0?=
 =?utf-8?B?TGJ2NDVBUEo3aHlJbVhGc3pNQkpxK1BMVWkrOVBROWdnSXRLREtkWEVpY2li?=
 =?utf-8?B?U2VUTjU1L0g1TmRpL1A1anp3ckpoVWRWa1phbE1rMU1IQUNnTXdwZFVLaGVy?=
 =?utf-8?B?cUU2eGxBTzJnWC9CVTBrdzV1ZmtsL0pzUVIyUlB5Z0hWaldVdkE0UUlXTGtE?=
 =?utf-8?B?M3hQUXVRU2pXYkZXTDBlVXBQRHRWY3I5OFdyNVRCbGlmWFUxcFp1c0xnT3VT?=
 =?utf-8?B?ZzR2Nm5RVzZKV3NPeE9aN2c2UkdOcTRwb3hTZkZhaVorV2tEYUtxcmRiMGF0?=
 =?utf-8?B?dHVNSVFYMjZwNU9KMFRkQ285LzlrMWtQWFpQeDlpQnY0T1VIdmZRMFY5SSsz?=
 =?utf-8?B?VDZjMDhha2g2SFVvR000cG43d0xCcHFiRG1Ldks4VHNnRWYwNGk5N2gxNWMz?=
 =?utf-8?B?S0tLZE40cDM4NDg4VGVnQVY3dG5QN0ErczEydi80aXRnZDhSNEVBTER3K0xi?=
 =?utf-8?B?eFcybXRFMGtWY3dFaWpJdlJkVS9EK0RVaDB4K3RmcUROOEdKeitKNEk5bFNP?=
 =?utf-8?B?Vlc4WGR6VytDK1R6YlltVjJJanZrWnZoSjJqVWcyQmxGYnlzMjMxTnB6a0M1?=
 =?utf-8?B?UXd1ZUxiVTZJbkFaZjhDU21mRzR0bGtlV3luMnF2ZmlHdThHcWRWYnl4bTFY?=
 =?utf-8?B?MWEvSWRTc2Y2eEk5RU5obVBYdkZ3ZVBqVTNqdUdqckZqTTA2Wk1jbmkrRzZT?=
 =?utf-8?B?TVl6TkliNTJ2TUJtQkJSeHk2OTMzSjl4dTFWUWpoTzEvZjRXTXQxRWkrcCs0?=
 =?utf-8?B?amRCOC9XcDM3OGlmcTRZWE9JWlVEakphK0NQN0RRaEFtRDdQUnhWOGZ2aEEz?=
 =?utf-8?B?SUxPMlduRThxaHc2UEdKWXNTT3hwVGsrOGlYdnJYQm96T3pBb3pseGVtenND?=
 =?utf-8?B?OS8zbE9TdmxmNkk5cGw0WE5CbDF1QitUcXoxQXlPcStKMVNoSUprTVVMdHJa?=
 =?utf-8?B?dkcrUkE0UjNkRUZKRHRMZkpSUFVmS2ZPTW1rN2k5MVU5dTh2VVAxSFNhemEw?=
 =?utf-8?B?ZHhVL2RSYVR6Szh6TTM1Q1FvbUpXWUdKek4rVjY0aHo2eHNHTlFhdFI0WFk5?=
 =?utf-8?B?elk1Sm1NQXRib1cwQ0ZqMGFQSWVSZWJGaXJVWDNUeTlsbWplM1RERkFmcndB?=
 =?utf-8?B?ZnNKZStndC9TRGY5bFpTRTJ1alNtZXp5Z3hWN1A0dCtTcnM0bGppV2NjVWpX?=
 =?utf-8?B?TXlYbklGVEpvbWdQSCtIR0hEemlMTW1nd2QyZ1NrMjRCMWdBWnVJampCRWkw?=
 =?utf-8?B?WXMvSGN0aExyUWdtZUJ5cm5KQUo5L0ZpMHE5UkJQMFFtNW45QXEvZUNoWHlE?=
 =?utf-8?B?TzB2N1lwS2xBazNGYmtadTBuTDBtWVM5MXJXMXpFNHRJQzNKTkdFelJGYXhF?=
 =?utf-8?B?MjNJNG1YbnFBZW5ONWRheUFucTlhZk40Z2lxcFRGeUZRMVNWTFlIV2ZVUUNj?=
 =?utf-8?B?Rnp0elJzOVNLNE9wdjRjZ2Y4ZmRWVDBCTGp6eW5OS3JLR25yaGVOamhZT1JZ?=
 =?utf-8?B?eU1Ra3FXY0pXOTkvaVd6Q0lFQzhRbHF1T1FjaHBYQjgwY05DVUpJbzZlWlFM?=
 =?utf-8?Q?wmWQTnzfq+k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW5OVWoxTlJnM3ZrZDlGV2xLUDdZWU8wT1pVM1hWcmxqdHJaSVBFeW1va2hD?=
 =?utf-8?B?Nmp4WEJFZWkvekgwUlhuZ3V4NkJIZG1tWkxvbzNWYmp3T2RQVEF4Y1NBdmhG?=
 =?utf-8?B?Sy9oQzhqME5QYVdXREVDc05jazJsSklocDNoRTdId0FQdG9neEJKYWN1SVhJ?=
 =?utf-8?B?VDJnT0hwOStJVXF1S3RPckUvSDJGbEx5NEZiUFpBcXZFMGFzcWxlQUNXREFt?=
 =?utf-8?B?Rytxbk1TaDFyYXdwUlN0N2RQOXR5YkcySXFLblM4a2M4V0hvWWZwT1hLd040?=
 =?utf-8?B?NXhJZlIwVnVVVks2UDEvNjVFNU00clFLN3Vha3E0dFRnNFZMaVprMnVNaDN6?=
 =?utf-8?B?b09rUEVoa2V0ck9HK2pVT0dEK1pHZE1DQlRENzExODY1VGxmWVVLMFZjQjMr?=
 =?utf-8?B?TEhoUjB3cHhWZ2NVdW9sZ0FNSDc1dWEvbndZUUQ0UERSVzR3bFZJODZIOUNz?=
 =?utf-8?B?dEUzcTBRc2tpWnA5WVdNK2F2ZXpxZEx5VlVYK1lIWlFTMVZ4UXRYTk8rZVhM?=
 =?utf-8?B?UXpDSjBNNStGY3lSMndwTWJ3L1IxSHNOb3huWVhYZkVkdkhscG1ISjN0dlEy?=
 =?utf-8?B?VkdUdE16M0Z0VWhhd016UE9UTTVUQTNuaW8zMWk3NHkvZ1BHcmpPWXZCYldE?=
 =?utf-8?B?NzBhVmdzNzgvSmErMzJHTHJIM2g4U3FDQmRZblY2NXJxOEdud2MwYlM0NTVY?=
 =?utf-8?B?d2I5RlYwMUJqYmlmZnZNVHUzUVkvV1JYQlE3SVJkMGV1aC82OGJrTTAvT0wz?=
 =?utf-8?B?dm5mTm1TeWlMdUNWcTVQWHJHcDdIdE5LYXZVek43bFhmMlkvUDM1Tis5MDBX?=
 =?utf-8?B?c1QrTE5vb0NOdUV6elZQWlFhdlRlV0hMRjBUZXFreTh4Wnpra29yUlQ0Nk9s?=
 =?utf-8?B?ZjRXZ21VVlV5UzJQTUJqVEFPMUFHM1ErTkNYQUpDaE9vejdQYVQrVkg2NDNz?=
 =?utf-8?B?UytWOEVtdmRKSTE4Mjg1eVU2QXlVZWsvQ3AybnhJZHNUalJ1bFcvcWIwTXhH?=
 =?utf-8?B?MUhsaGo5Rkt0NytkSmxiZHVxanlldVRtUjNudXhOemRPY3h4cmpSendMMnpM?=
 =?utf-8?B?YnhnbERzY293SnoyTzAxYU53Mk9CVFplNFc1YkVuRjhsYllOcnpXMjNJSnNN?=
 =?utf-8?B?VFowaENhNEo0dTVieUxMRC9HK3lMY3FMQUJ6Yk11RzhKWUhsc3JZZitsTDRC?=
 =?utf-8?B?QTZYSlR6RFUzUXdDaWI3dWRkME9sV2xraXN5UTJtdGZKbnZrZTU0MVEwRFhv?=
 =?utf-8?B?SjEvWExzSzJzdDlYVDNIRC92WUoxYW9lNUplSDh6L2doRWhTUU1lRWJ6YkVB?=
 =?utf-8?B?OFZrbmVUWm5ad0NaZDZkODZCNVVuNHVWeXFSZkh4NTB3WmtxYnZyU0hYUDFr?=
 =?utf-8?B?cnMrMlNhbGk4S3BUSWdDUkZSN0IrNmFOT1RSTVQ2dzRXSjVyZTNFaGZWR2NH?=
 =?utf-8?B?NzN6blFlOW44dDF4OGhPR3hQQ3czajNRY3VHdzNhSFVEN250cnRIVjJyRDZ4?=
 =?utf-8?B?MEI4TWpnUEQ0c0FUekRwTy9tZ1ovZ25LUTdock5HRGNwRDJaVjFOQ3k1Mjcr?=
 =?utf-8?B?ZW12RDRUdGtEUFpqSDRBandjcmM4TnVScGluYVZ2RmhQNzl5N0RBeWM5R2dh?=
 =?utf-8?B?cC85cHB6dnhSZXNmOGNIc0V6UTNFQjZUQjdsQ2VLbGowUUQ4cE9VUy9sbFc3?=
 =?utf-8?B?QVZ3Wk0zOWxpNTV4MWJob2I2dUFNUFRCVmdYTTAvSkdrdHhjRGNkeGlMUmJO?=
 =?utf-8?B?YzBJd3RodHhhdElweVlJV0dwR2E5dnA3MTlGYWsvTWltS2d0amNJRHpEMGFH?=
 =?utf-8?B?bk1hZTZ1N0w0bEpGS3NKMVVoNUo2ZVplL2lzS09IMnlzNjlHWmhjQ2grNDhr?=
 =?utf-8?B?M0NLSW5qck4vdC8xOHk1eWpZZ3F5VUQ4QjBkamtmeXdPQ2dFcVlyZUh5TmRS?=
 =?utf-8?B?ckNSZUVyMVNzVVZmTFZlMTIrMXVpUEd5MnBGWVFyUVgyeDR1dUR2VU04N3NG?=
 =?utf-8?B?U2JnemZTWTF1MUFQZmxRM2t4M05uTTZ2V25FVnltdjdJSTZ1OFUreWtoaTVt?=
 =?utf-8?B?WlI4QmxmS2F4ck9mcmE1Qk54dXNjTTVTdVJYMklPU0ZBWUFhRHY0TEhVZXZ3?=
 =?utf-8?B?WDkrNTFKWTl4dE5ISnlWUk1WSHdTTjRUVEZvZnhORFZnVllGeVcza1pCb0FJ?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9462bd0-7213-45db-650f-08dd9c659fb1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 14:57:24.3595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jtTNGbkZsQIeE5dllKGUSjTHS5siIxvyNnF2OWpflv6lKMQbfe/pNuyutrUvlFci+xG0TZ2B+h0YXFEFWz6F8LdmsCA3F/GBhS8P9Dqd1u0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4640
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

In future platforms, we will need to represent the device and tile
VRAM regions in a more dynamic way, so let's abandon the static
allocation of these structures and start use a dynamic allocation.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  2 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 +-
 drivers/gpu/drm/xe/xe_assert.h                |  2 +-
 drivers/gpu/drm/xe/xe_device.c                | 19 ++++++
 drivers/gpu/drm/xe/xe_device_types.h          |  6 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c               | 18 ++---
 drivers/gpu/drm/xe/xe_pci.c                   |  6 ++
 drivers/gpu/drm/xe/xe_query.c                 |  2 +-
 drivers/gpu/drm/xe/xe_svm.c                   | 17 ++---
 drivers/gpu/drm/xe/xe_tile.c                  | 33 +++++++++-
 drivers/gpu/drm/xe/xe_tile.h                  |  2 +
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |  6 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  4 +-
 drivers/gpu/drm/xe/xe_vram.c                  | 66 ++++++++++---------
 15 files changed, 121 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index c2b4be72f7a0..d8139a0d6e94 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -301,7 +301,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 		 * accessible.  This is important on small-bar systems where
 		 * only some subset of VRAM is CPU accessible.
 		 */
-		if (tile->mem.vram.io_size < tile->mem.vram.usable_size) {
+		if (tile->mem.vram->io_size < tile->mem.vram->usable_size) {
 			ret = -EINVAL;
 			goto err;
 		}
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 6502b8274173..79c8bfca23e9 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -106,7 +106,7 @@ initial_plane_bo(struct xe_device *xe,
 		 * We don't currently expect this to ever be placed in the
 		 * stolen portion.
 		 */
-		if (phys_base >= tile0->mem.vram.usable_size) {
+		if (phys_base >= tile0->mem.vram->usable_size) {
 			drm_err(&xe->drm,
 				"Initial plane programming using invalid range, phys_base=%pa\n",
 				&phys_base);
diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
index 68fe70ce2be3..cd63cdd2dc78 100644
--- a/drivers/gpu/drm/xe/xe_assert.h
+++ b/drivers/gpu/drm/xe/xe_assert.h
@@ -145,7 +145,7 @@
 	const struct xe_tile *__tile = (tile);							\
 	char __buf[10] __maybe_unused;								\
 	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
-		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_size, 1,	\
+		      __tile->id, ({ string_get_size(__tile->mem.vram->actual_physical_size, 1,	\
 				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
 })
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 660b0c5126dc..a80e892d6959 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -684,6 +684,21 @@ static void sriov_update_device_info(struct xe_device *xe)
 	}
 }
 
+static int xe_device_vram_alloc(struct xe_device *xe)
+{
+	struct xe_vram_region *vram;
+
+	if (!IS_DGFX(xe))
+		return 0;
+
+	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return -ENOMEM;
+
+	xe->mem.vram = vram;
+	return 0;
+}
+
 /**
  * xe_device_probe_early: Device early probe
  * @xe: xe device instance
@@ -728,6 +743,10 @@ int xe_device_probe_early(struct xe_device *xe)
 
 	xe->wedged.mode = xe_modparam.wedged_mode;
 
+	err = xe_device_vram_alloc(xe);
+	if (err)
+		return err;
+
 	return 0;
 }
 ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe() */
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 902b2e30b3b9..911afac994bc 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -76,6 +76,8 @@ struct xe_pxp;
  * device, such as HBM memory or CXL extension memory.
  */
 struct xe_vram_region {
+	/** @tile: Backpointer to tile */
+	struct xe_tile *tile;
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -215,7 +217,7 @@ struct xe_tile {
 		 * Although VRAM is associated with a specific tile, it can
 		 * still be accessed by all tiles' GTs.
 		 */
-		struct xe_vram_region vram;
+		struct xe_vram_region *vram;
 
 		/** @mem.ggtt: Global graphics translation table */
 		struct xe_ggtt *ggtt;
@@ -390,7 +392,7 @@ struct xe_device {
 	/** @mem: memory info for device */
 	struct {
 		/** @mem.vram: VRAM info for device */
-		struct xe_vram_region vram;
+		struct xe_vram_region *vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
 		/** @mem.sys_mgr: system memory shrinker. */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 3556c41c041b..a33a6f3a6731 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1574,7 +1574,7 @@ static u64 pf_query_free_lmem(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt->tile;
 
-	return xe_ttm_vram_get_avail(&tile->mem.vram.ttm.manager);
+	return xe_ttm_vram_get_avail(&tile->mem.vram->ttm.manager);
 }
 
 static u64 pf_query_max_lmem(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 8f8e9fdfb2a8..c0bd23aaaa23 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -130,9 +130,9 @@ static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr, bool is_comp_pte)
 	u64 identity_offset = IDENTITY_OFFSET;
 
 	if (GRAPHICS_VER(xe) >= 20 && is_comp_pte)
-		identity_offset += DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
+		identity_offset += DIV_ROUND_UP_ULL(xe->mem.vram->actual_physical_size, SZ_1G);
 
-	addr -= xe->mem.vram.dpa_base;
+	addr -= xe->mem.vram->dpa_base;
 	return addr + (identity_offset << xe_pt_shift(2));
 }
 
@@ -142,22 +142,22 @@ static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm,
 	u64 pos, ofs, flags;
 	u64 entry;
 	/* XXX: Unclear if this should be usable_size? */
-	u64 vram_limit =  xe->mem.vram.actual_physical_size +
-		xe->mem.vram.dpa_base;
+	u64 vram_limit = xe->mem.vram->actual_physical_size +
+		xe->mem.vram->dpa_base;
 	u32 level = 2;
 
 	ofs = map_ofs + XE_PAGE_SIZE * level + vram_offset * 8;
 	flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
 					    true, 0);
 
-	xe_assert(xe, IS_ALIGNED(xe->mem.vram.usable_size, SZ_2M));
+	xe_assert(xe, IS_ALIGNED(xe->mem.vram->usable_size, SZ_2M));
 
 	/*
 	 * Use 1GB pages when possible, last chunk always use 2M
 	 * pages as mixing reserved memory (stolen, WOCPM) with a single
 	 * mapping is not allowed on certain platforms.
 	 */
-	for (pos = xe->mem.vram.dpa_base; pos < vram_limit;
+	for (pos = xe->mem.vram->dpa_base; pos < vram_limit;
 	     pos += SZ_1G, ofs += 8) {
 		if (pos + SZ_1G >= vram_limit) {
 			entry = vm->pt_ops->pde_encode_bo(bo, pt_2m_ofs,
@@ -310,7 +310,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 
 		xe_migrate_program_identity(xe, vm, bo, map_ofs, IDENTITY_OFFSET,
 					    pat_index, pt30_ofs);
-		xe_assert(xe, xe->mem.vram.actual_physical_size <=
+		xe_assert(xe, xe->mem.vram->actual_physical_size <=
 					(MAX_NUM_PTE - IDENTITY_OFFSET) * SZ_1G);
 
 		/*
@@ -320,10 +320,10 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe)) {
 			u16 comp_pat_index = xe->pat.idx[XE_CACHE_NONE_COMPRESSION];
 			u64 vram_offset = IDENTITY_OFFSET +
-				DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
+				DIV_ROUND_UP_ULL(xe->mem.vram->actual_physical_size, SZ_1G);
 			u64 pt31_ofs = bo->size - XE_PAGE_SIZE;
 
-			xe_assert(xe, xe->mem.vram.actual_physical_size <= (MAX_NUM_PTE -
+			xe_assert(xe, xe->mem.vram->actual_physical_size <= (MAX_NUM_PTE -
 						IDENTITY_OFFSET - IDENTITY_OFFSET / 2) * SZ_1G);
 			xe_migrate_program_identity(xe, vm, bo, map_ofs, vram_offset,
 						    comp_pat_index, pt31_ofs);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b68c90910d82..23186d287f49 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -700,12 +700,18 @@ static int xe_info_init(struct xe_device *xe,
 	 * All of these together determine the overall GT count.
 	 */
 	for_each_tile(tile, xe, id) {
+		int err;
+
 		gt = tile->primary_gt;
 		gt->info.id = xe->info.gt_count++;
 		gt->info.type = XE_GT_TYPE_MAIN;
 		gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
 		gt->info.engine_mask = graphics_desc->hw_engine_mask;
 
+		err = xe_tile_alloc_vram(tile);
+		if (err)
+			return err;
+
 		if (MEDIA_VER(xe) < 13 && media_desc)
 			gt->info.engine_mask |= media_desc->hw_engine_mask;
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 2dbf4066d86f..99189d15d4a5 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -337,7 +337,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	config->num_params = num_params;
 	config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
 		xe->info.devid | (xe->info.revid << 16);
-	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
+	if (xe->mem.vram)
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
 	if (xe->info.has_usm && IS_ENABLED(CONFIG_DRM_XE_GPUSVM))
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 4432685936ed..932b68dc5f65 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -336,16 +336,11 @@ static struct xe_vram_region *page_to_vr(struct page *page)
 	return container_of(page_pgmap(page), struct xe_vram_region, pagemap);
 }
 
-static struct xe_tile *vr_to_tile(struct xe_vram_region *vr)
-{
-	return container_of(vr, struct xe_tile, mem.vram);
-}
-
 static u64 xe_vram_region_page_to_dpa(struct xe_vram_region *vr,
 				      struct page *page)
 {
 	u64 dpa;
-	struct xe_tile *tile = vr_to_tile(vr);
+	struct xe_tile *tile = vr->tile;
 	u64 pfn = page_to_pfn(page);
 	u64 offset;
 
@@ -400,7 +395,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 
 		if (!vr && spage) {
 			vr = page_to_vr(spage);
-			tile = vr_to_tile(vr);
+			tile = vr->tile;
 		}
 		XE_WARN_ON(spage && page_to_vr(spage) != vr);
 
@@ -536,7 +531,7 @@ static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64 offset)
 
 static struct drm_buddy *tile_to_buddy(struct xe_tile *tile)
 {
-	return &tile->mem.vram.ttm.mm;
+	return &tile->mem.vram->ttm.mm;
 }
 
 static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocation,
@@ -550,7 +545,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocatio
 
 	list_for_each_entry(block, blocks, link) {
 		struct xe_vram_region *vr = block->private;
-		struct xe_tile *tile = vr_to_tile(vr);
+		struct xe_tile *tile = vr->tile;
 		struct drm_buddy *buddy = tile_to_buddy(tile);
 		u64 block_pfn = block_offset_to_pfn(vr, drm_buddy_block_offset(block));
 		int i;
@@ -717,7 +712,7 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 start, u64 end, struct xe_vma *v
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
 {
-	return &tile->mem.vram;
+	return tile->mem.vram;
 }
 
 /**
@@ -764,7 +759,7 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 	drm_gpusvm_devmem_init(&bo->devmem_allocation,
 			       vm->xe->drm.dev, mm,
 			       &gpusvm_devmem_ops,
-			       &tile->mem.vram.dpagemap,
+			       &tile->mem.vram->dpagemap,
 			       xe_svm_range_size(range));
 
 	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 0771acbbf367..8303ebd90099 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -98,6 +98,33 @@ static int xe_tile_alloc(struct xe_tile *tile)
 	return 0;
 }
 
+/**
+ * xe_tile_alloc_vram - Perform per-tile VRAM structs allocation
+ * @tile: Tile to perform allocations for
+ *
+ * Allocates VRAM per-tile data structures using DRM-managed allocations.
+ * Does not touch the hardware.
+ *
+ * Returns -ENOMEM if allocations fail, otherwise 0.
+ */
+int xe_tile_alloc_vram(struct xe_tile *tile)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_vram_region *vram;
+
+	if (!IS_DGFX(xe))
+		return 0;
+
+	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return -ENOMEM;
+
+	vram->tile = tile;
+	tile->mem.vram = vram;
+
+	return 0;
+}
+
 /**
  * xe_tile_init_early - Initialize the tile and primary GT
  * @tile: Tile to initialize
@@ -135,8 +162,8 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 	struct xe_device *xe = tile_to_xe(tile);
 	int err;
 
-	if (tile->mem.vram.usable_size) {
-		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram.ttm);
+	if (tile->mem.vram->usable_size) {
+		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram->ttm);
 		if (err)
 			return err;
 		xe->info.mem_region_mask |= BIT(tile->id) << 1;
@@ -171,7 +198,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 	xe_wa_apply_tile_workarounds(tile);
 
 	if (xe->info.has_usm && IS_DGFX(xe))
-		xe_devm_add(tile, &tile->mem.vram);
+		xe_devm_add(tile, tile->mem.vram);
 
 	return xe_tile_sysfs_init(tile);
 }
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index eb939316d55b..8dd87ccb2aca 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -14,6 +14,8 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
 int xe_tile_init_noalloc(struct xe_tile *tile);
 int xe_tile_init(struct xe_tile *tile);
 
+int xe_tile_alloc_vram(struct xe_tile *tile);
+
 void xe_tile_migrate_wait(struct xe_tile *tile);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index d9c9d2547aad..19bfc22b9706 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -89,8 +89,8 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 	u64 tile_offset;
 	u64 tile_size;
 
-	tile_offset = tile->mem.vram.io_start - xe->mem.vram.io_start;
-	tile_size = tile->mem.vram.actual_physical_size;
+	tile_offset = tile->mem.vram->io_start - xe->mem.vram->io_start;
+	tile_size = tile->mem.vram->actual_physical_size;
 
 	/* Use DSM base address instead for stolen memory */
 	mgr->stolen_base = (xe_mmio_read64_2x32(mmio, DSMBASE) & BDSM_MASK) - tile_offset;
@@ -107,7 +107,7 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 
 	/* Verify usage fits in the actual resource available */
 	if (mgr->stolen_base + stolen_size <= pci_resource_len(pdev, LMEM_BAR))
-		mgr->io_base = tile->mem.vram.io_start + mgr->stolen_base;
+		mgr->io_base = tile->mem.vram->io_start + mgr->stolen_base;
 
 	/*
 	 * There may be few KB of platform dependent reserved memory at the end
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 9e375a40aee9..d9afe0e22071 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -340,7 +340,7 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_vram_region *vram = &tile->mem.vram;
+	struct xe_vram_region *vram = tile->mem.vram;
 
 	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
 				      vram->usable_size, vram->io_size,
@@ -392,7 +392,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 	 */
 	xe_res_first(res, offset, length, &cursor);
 	for_each_sgtable_sg((*sgt), sg, i) {
-		phys_addr_t phys = cursor.start + tile->mem.vram.io_start;
+		phys_addr_t phys = cursor.start + tile->mem.vram->io_start;
 		size_t size = min_t(u64, cursor.size, SZ_2G);
 		dma_addr_t addr;
 
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index e421a74fb87c..18124a5fb291 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -147,16 +147,16 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 
 	resize_vram_bar(xe);
 
-	xe->mem.vram.io_start = pci_resource_start(pdev, LMEM_BAR);
-	xe->mem.vram.io_size = pci_resource_len(pdev, LMEM_BAR);
-	if (!xe->mem.vram.io_size)
+	xe->mem.vram->io_start = pci_resource_start(pdev, LMEM_BAR);
+	xe->mem.vram->io_size = pci_resource_len(pdev, LMEM_BAR);
+	if (!xe->mem.vram->io_size)
 		return -EIO;
 
 	/* XXX: Need to change when xe link code is ready */
-	xe->mem.vram.dpa_base = 0;
+	xe->mem.vram->dpa_base = 0;
 
 	/* set up a map to the total memory area. */
-	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
+	xe->mem.vram->mapping = ioremap_wc(xe->mem.vram->io_start, xe->mem.vram->io_size);
 
 	return 0;
 }
@@ -278,13 +278,13 @@ static void vram_fini(void *arg)
 	struct xe_tile *tile;
 	int id;
 
-	if (xe->mem.vram.mapping)
-		iounmap(xe->mem.vram.mapping);
+	if (xe->mem.vram->mapping)
+		iounmap(xe->mem.vram->mapping);
 
-	xe->mem.vram.mapping = NULL;
+	xe->mem.vram->mapping = NULL;
 
 	for_each_tile(tile, xe, id)
-		tile->mem.vram.mapping = NULL;
+		tile->mem.vram->mapping = NULL;
 }
 
 /**
@@ -320,10 +320,10 @@ int xe_vram_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
-		 &xe->mem.vram.io_size);
+	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
+		 &xe->mem.vram->io_size);
 
-	io_size = xe->mem.vram.io_size;
+	io_size = xe->mem.vram->io_size;
 
 	/* tile specific ranges */
 	for_each_tile(tile, xe, id) {
@@ -331,44 +331,48 @@ int xe_vram_probe(struct xe_device *xe)
 		if (err)
 			return err;
 
-		tile->mem.vram.actual_physical_size = tile_size;
-		tile->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
-		tile->mem.vram.io_size = min_t(u64, vram_size, io_size);
+		tile->mem.vram->actual_physical_size = tile_size;
+		tile->mem.vram->io_start = xe->mem.vram->io_start + tile_offset;
+		tile->mem.vram->io_size = min_t(u64, vram_size, io_size);
 
-		if (!tile->mem.vram.io_size) {
+		if (!tile->mem.vram->io_size) {
 			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
 			return -ENODEV;
 		}
 
-		tile->mem.vram.dpa_base = xe->mem.vram.dpa_base + tile_offset;
-		tile->mem.vram.usable_size = vram_size;
-		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
+		tile->mem.vram->dpa_base = xe->mem.vram->dpa_base + tile_offset;
+		tile->mem.vram->usable_size = vram_size;
+		tile->mem.vram->mapping = xe->mem.vram->mapping + tile_offset;
 
-		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
+		if (tile->mem.vram->io_size < tile->mem.vram->usable_size)
 			drm_info(&xe->drm, "Small BAR device\n");
-		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,
-			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);
-		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,
-			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + (u64)tile->mem.vram.actual_physical_size,
-			 &tile->mem.vram.io_start, tile->mem.vram.io_start + (u64)tile->mem.vram.io_size);
+		drm_info(&xe->drm,
+			 "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
+			 id, tile->id, &tile->mem.vram->actual_physical_size,
+			 &tile->mem.vram->usable_size, &tile->mem.vram->io_size);
+		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
+			 id, tile->id, &tile->mem.vram->dpa_base,
+			 tile->mem.vram->dpa_base + (u64)tile->mem.vram->actual_physical_size,
+			 &tile->mem.vram->io_start,
+			 tile->mem.vram->io_start + (u64)tile->mem.vram->io_size);
 
 		/* calculate total size using tile size to get the correct HW sizing */
 		total_size += tile_size;
 		available_size += vram_size;
 
-		if (total_size > xe->mem.vram.io_size) {
+		if (total_size > xe->mem.vram->io_size) {
 			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
-				 &total_size, &xe->mem.vram.io_size);
+				 &total_size, &xe->mem.vram->io_size);
 		}
 
 		io_size -= min_t(u64, tile_size, io_size);
 	}
 
-	xe->mem.vram.actual_physical_size = total_size;
+	xe->mem.vram->actual_physical_size = total_size;
 
-	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
-		 &xe->mem.vram.actual_physical_size);
-	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
+	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
+		 &xe->mem.vram->actual_physical_size);
+	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
 		 &available_size);
 
 	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
-- 
2.34.1

