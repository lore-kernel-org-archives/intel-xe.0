Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D04C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 13:01:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD1910E71A;
	Fri, 16 Aug 2024 13:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I7yeXbON";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981E210E6A0
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 13:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723813299; x=1755349299;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/uNYhcNvkkfaai94YrgYQ2h7/BNFbsScJGPj54cEy3U=;
 b=I7yeXbONBc1A9/kigJbqyMXQycJnHE6OnHaNNwRmhZbLoDntoeM6S/XC
 R816R9ZJfTguHU8W7Pi2MJF5qqouh3vuZAskN357e3ToFDM8e1sxhuf2L
 fuR44P3F+0wnPgW7MQsUsaVocGRgsB7hij5DnmddPcbqWYbEj7Sdqz5Ie
 zPTwQwcahEq0ArYN73sDYBQ1KLdilW0pqgEhdFzcBOGzPcSq4V4i18Qfl
 X+DNTHNnf4CcUV6Ovx71llcydGeE4RcOghtETXmlsZk0wwmk/sHlSEPsL
 mdr9l8fpOo63jK6OjXOsbYAQmHVquFBUxFvWmZXiXNroO3UWgjQj8Thbn w==;
X-CSE-ConnectionGUID: X5ZN0+ZpTAOcknArxV21Mg==
X-CSE-MsgGUID: CrNQExDTReW9Mf5yBG0LoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="44626972"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="44626972"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 06:01:38 -0700
X-CSE-ConnectionGUID: 6/GaYw1YS2yQpzjd5tN4SQ==
X-CSE-MsgGUID: TO/RRmWPQgOfQTCGFqqhuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="64063533"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 06:01:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 06:01:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 06:01:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 06:01:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xwgSatOdpP4vmbTiFjOpftfbshkRTmlupkXX7SpWQ/r4Wednjc00DQNYvhFHhRGK9hyA/QybQM7Z6hNQh6TYb0zlFqG4M1RrrYy7T9V9/HhZoPFq93NGtMsqKfuRseHvEl0+IdsfNYXl0ZhqUx3DAFxsGO+tttWHmF3lqekS+Fzy8xGQbQ+ANhHh3eRMfEhael5K9xV0AyqR1fy41hFHAGBLsDDirSRM75u648/XqD88W0fFZSCOn781UhmV+crAzcfvhTKlJx/r7nYH8nB2k8id95DG3kApmWEi9sIHaYydYQKtzEI8GxAkdNAQB79vTSCd6jYrZkFdpVbzc64NIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QeUHEd1Wv+l0Bt52vWJidzGLb5esTY316WgdvA0bmZw=;
 b=jC4szd4/BgT/09SaX4SxJBptJrQ97WNYewIOC83hFx2McP1OU+6qhoQiBDPBHWS0mKucDKnPjweEXS+SCeubES1wffTgckQecg4+vMEB5nNI7BM9lZAhraFmGt7azDyk92Pyl+FR3HxP2SPyfaVnvmaxx6BuKbWTavY4w/NMR5da3sMSq1Vc0SDQveKM/lI2kF6FvJzHs9daQ1Zr9ZnqLKgmuiHe5Ky0MpOZdMO5v5FKn84ZVyzjYBKuNitmLVwlJ8TU+/YhSKS1cz2Ud7kG//DLA6MJJrqODndR2QaB00fWPdjuwA6m5dPeRd939IaGb/CXRm8Bdx7wdIJ5V8tTvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MW4PR11MB7127.namprd11.prod.outlook.com (2603:10b6:303:221::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Fri, 16 Aug
 2024 13:01:34 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%3]) with mapi id 15.20.7875.016; Fri, 16 Aug 2024
 13:01:34 +0000
Date: Fri, 16 Aug 2024 15:01:30 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 03/12] drm/xe/pf: Drop GuC notifications for non-existing
 VF
Message-ID: <20240816130130.xt7qx5x4xi6ltjgn@intel.com>
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
 <20240809165159.662-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240809165159.662-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI1P293CA0008.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::11) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MW4PR11MB7127:EE_
X-MS-Office365-Filtering-Correlation-Id: a508f662-bd92-4428-d4ea-08dcbdf38e2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzFkNkpsSXlOaktOTlhraXlDczlSdUJoVCtmTERuSWJOQlYrV1BvczNpVStX?=
 =?utf-8?B?cXkyK3ZHN08vNXRJVDdlYWIzS2dybEJ0emx5RlJXd0tpQUpoWElIdXNsSWFB?=
 =?utf-8?B?UnUzVnBxWk9UeVNwNi9EbWQzQ3U3N3k5ZVJ0bjJFV3BVRTZqclBWTUxFUUdO?=
 =?utf-8?B?N2ZuQmt4SUFOaFJEVW96dG9MUldGYnZPWDRITHlpYm5ZRG05d2Fjckk1cFNu?=
 =?utf-8?B?cjhnSE9mVXNZK3hXMnhFejF1TjVEOUFwRHFBUWpMYUtMODdOWVNUSDdraStn?=
 =?utf-8?B?aWJnOXNBY1RzVHVESG9kcTF3RzVjOGdCOGtBQkV1akJmZ1pZTVd2eWVIRzYv?=
 =?utf-8?B?OWc1Y25nOThVUlBFYWtFNVB3Q2tCZEtkOTd5NTJzSUtycDdyaEcwVzdoVm10?=
 =?utf-8?B?SThDaHJVVHIzOWtLUG1jMGRYTGcwb3ZjblhCVnBQMm5BRVQ1dm5PTk9UeE44?=
 =?utf-8?B?SHRVSGYxL3hBVVVUZWdqd09ERTBVdHNiSm82VFlFSDZ1N3NHaUtVdlJTZWZ0?=
 =?utf-8?B?N1VrcENSVTBwVWF3VGRORFJFUmJnaU5nQWRSV1dyQkY5TkJrMEZ6N1JQc1lk?=
 =?utf-8?B?YVc0eDN3bUVyZjh5NlcwUlF0TkJtbjhqVXZ1bEtEMmNQZkVMVmZUNjdjTXJM?=
 =?utf-8?B?MWxiS0t6ZExyYkt5TFMrVTl3WkNsVDhqMHVFOUhXcWJJSmlPam5iSHpDeXF3?=
 =?utf-8?B?ME5QbWVhdDFRYzZtSjM2MEFIYjlxOSs1Tm05VHJ4MS80NFZCYzdIMjhPQVlC?=
 =?utf-8?B?RDFvSjNZVWsrT1pVWjdUYWx0bE42bmp1dGc2MVNRMUtVMnVOQVcvVmRRUklF?=
 =?utf-8?B?VzBadXg1U3NIQTFDN3dGWUs4b2tKOWpDUGNYZGVlWnBsZW5FMzNldVRtNVJG?=
 =?utf-8?B?T29JVitwc3F3UWQwbG5vVzJWUWJ1eVJORmVRN2c1WDBVMW55T3IvK1R1MmJF?=
 =?utf-8?B?TCs4TURtd1dkR2sxY2doK0pZY1oxU1Ftanc4WVc2djRxVlA4amtkUnZ5WXhS?=
 =?utf-8?B?a2VwRnBwRWFZYTNWYkpEWmNOZ2lVb0pNdkxKczRoUWhlMVNXRGQ1QVRqb3Vj?=
 =?utf-8?B?U3drNlIwbHdpTlUxbTRBREdKTnVScmVaekJxRmxDNTczQVV6cnhrSmNzSXBW?=
 =?utf-8?B?VzcrVFlRQVczbHBFVlBSckNBSEc3ZXQ2OExLUDkrVmxvL3N2NjBiNkswRVNH?=
 =?utf-8?B?SUxnS3BQQldGcnlnYTRoRGNsRDR1UzQ1ZUd4NnpyNkwxKzZSalBzaDNOenUw?=
 =?utf-8?B?aHZRUmxzdVhHNTNuZlN3N2sxbG56ZkkxK3cweE5XekxGRGFvZ1FFMXhabFFE?=
 =?utf-8?B?d3FLZlExT3ZaNGsvaVhrYUNpNWhNRCtFRlAybWFvd080cFNueDExU2Q1WXpB?=
 =?utf-8?B?di82TXRVVEhXOWRpb3ZUdVdXTldhSEFBb3NLSkNDTWtHZ3RLclVMWHFzMWhE?=
 =?utf-8?B?cExsRmdFcU8vc1AzbElLR3Z2T2VYTlpKTmNMcVQwVzkySENpdll5ZXJxamxU?=
 =?utf-8?B?V05pZ1ZlQnpiNkZJajhndzIzN3l5WmM2UHdYMm15YkY4eXJLOE8rbVpLTmMw?=
 =?utf-8?B?dTg1UFpjSGozVkdpaTRqZktXcDBlV0EzRlEwUCtvVlhtWnIwQzRQR1pOOXVo?=
 =?utf-8?B?blF6NDZ2T1JxQ281VUExRTRjRVJScEdGTEwyQmNWZmxoNDFhb3NsdmZqdkdm?=
 =?utf-8?B?a0w0aHRONGVLZzN5ampzdWlReC9TTk9mQ1V4a2xqSkd0SlNxRWhNWW42SFN4?=
 =?utf-8?B?Qkc1Rkw1aU9zcThxbTQzYVdFS3FLWS82NHpkVmNaODdBQTNtNFJTQW8vSkpj?=
 =?utf-8?B?L040dVF0d0daS3BIbkpyZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aytHLzFSUkxZb0dCeE1tSHB6L29yK1BRNXNTeGVDNk10MVROMmV6VnVIVUhl?=
 =?utf-8?B?ZlRCZzhNOFhsM3lMNjRyTnRWdzQ0ZzZCOWhuV3hCY0JPMXlHamV0OXd6VE4z?=
 =?utf-8?B?R1c5VC8wZG5UUUJlVXZmd2RnOHZFU05uanV4UEl3OHlxcWpNVmNWK2x2RDBj?=
 =?utf-8?B?RlJmOTVEZHluczFtMVVwNGFrWWhZbFBQaFN1NW45VFdOQXU1aFhmem5rcFNz?=
 =?utf-8?B?bFVkdDZKVXEzelZRK1F3NXpkLzQ0WVhWQXI5ZTlNTzlUTmY3WkoxeTMxcnQv?=
 =?utf-8?B?cFBDem51MXZGek9TazkzRlMvakNBMGRkeFIvbmhtTVI1TU01L0dNbENVbGVj?=
 =?utf-8?B?VkRZdTB0bVdPK01BQkV5VWYrbFZOMlh6MlEzYjBNNU54OE91VEVEYzdOaDVT?=
 =?utf-8?B?dWNGVERTb2Z1LzNwenNtYklWT1MvZXFOU2kwTnVFbG41TWRSVXpQOERTTUNy?=
 =?utf-8?B?ZTNZS09aRjJOYTEyTGZZTW94MGtmQ2ozOElXK0M1c2JUS3A0RXV0Z0VGL25m?=
 =?utf-8?B?OWMzSUhSV04rK0pqNXhWT0hOaytyUGJDSFcxUXhUTStWbEhKeCtYLzJjN2lp?=
 =?utf-8?B?eHlySEtTMGtaZGtpVnF2eVlwcUx5RUt4KzJ4aVgzV2RROVBTZXVGNEptdDAz?=
 =?utf-8?B?Z0NaYndiNjFURGdXTzVjd1ZVTkRGOEtEUEhJU0NpcDYzMjdUQVlhUXRZSE1m?=
 =?utf-8?B?Y3NUaG05bDdUUmt6MkdNV1dFb2hEandvUHIvL0hZd3RVdklqbkVyRkRpdG9k?=
 =?utf-8?B?cit6VWNuOVdmYStQNVFSM2JGZ2dTV1UxQ3VLdHJaWFZGckxnN3U5MmtkMFY2?=
 =?utf-8?B?L0hjb0xURjdLTFYzbDZWU2JzeHk4L053elNldjN6SUxhdUk0S3dBR3VoajFr?=
 =?utf-8?B?RFRzSG8yQjN1LzVTL0JlK3p2d1dBb0pFTzM2bmlZeXVRS0R3MXVlaTBpbkUr?=
 =?utf-8?B?TnhPZWV5ZER3cjdDRXNwU1B6TWJoZjZLOVNVUlJxMmNuWVh6TlZyVEdlNmJ3?=
 =?utf-8?B?SlEyNGY0bWtwYU5DUHNxUEg0eUZ1UUswZ2Q0QXpPTHpUKzh6UWUwelJkTmlj?=
 =?utf-8?B?T3dQZWJJK3lIWW5zU2Jwb0gyQWRCT0NUeFYrK0syRzNOWVRlZmxYeGhja0J6?=
 =?utf-8?B?dHdVRFhJL1AwS3RvOG9KdmFVYXJzL1hyam4vdlgvRzI3bTNrSTZqZGlWUGFK?=
 =?utf-8?B?Z2tOcmVRTlE1U1E3d2laOVNzVUNBRjA2QWRYYTJQQ0tyU05pTDNENXRNb2E0?=
 =?utf-8?B?azg2RUtLZFRzcHZwQlBMRGY2T1FaR0dCU3hlc1FOdy9SRVVaWDBrQ0k2VVVZ?=
 =?utf-8?B?QkZqckg2NW9HNE1tamF2QTlMaEl3VnIxalJVbytHOHZJRjl2aUNUNHJGckdz?=
 =?utf-8?B?aHNHbFh5QzgxcndPU3R0bkJuYk9PTURkZ0tpUHVUdzdQOU0yOU9RcG9mMlJs?=
 =?utf-8?B?aVp6RlVFdjJTaFUzRGNzMlk2NXR6a24vNkhSM0hHQmQwZnlrcDd2WEsycm00?=
 =?utf-8?B?OUhUQW53ejYvS0ZReDkvYVNzdTlUeEJCZy85d1BSYnI1UCtVVkJXNkxNM2Vl?=
 =?utf-8?B?Y2VnN0tsZWdxaEhvM2pBcnZKWWVtVFFCUGprSHA5MGx5a1k4dG5YUzhXUGtO?=
 =?utf-8?B?dlRHZW5IeG5zc3lNeXI0NW1RaG5EeTZUMFRGSXRMczBVU3g1YlRYZlZYNm83?=
 =?utf-8?B?Ym9xczdhRytmc1NMd1NQb3NFcTJHMGpoS0lrOHJHbUxlbjdTTE42cHppZytQ?=
 =?utf-8?B?Y1FkSnZMZTEyU2g4QlRLK2Qwam1PMUpXK1JIOWFXbmpZYkwvaDFYUkJMbmNJ?=
 =?utf-8?B?QU9oTFljZnpIZlN3SDc1WW5CVE9QamNkUnVCQVlFQjUyMmZITHV3cVFCVWow?=
 =?utf-8?B?eU56TkNSMnRING9kUURMZS9EUCt1UzI3blBvQzNkQUh2TlpvZlludElXU0Ry?=
 =?utf-8?B?TXRKM1BTSHovQmo0MmpreTcrdFZwa3duUHF2VU8rWVFHNnk0N3pmVEk3bU9v?=
 =?utf-8?B?R2lxc1JzczlqZEh5djZQS1NsYStnTVNENjFHWmxXYXNLWVcya3BydXdwZzMy?=
 =?utf-8?B?VnArdGtUUWVnRTVZMkNCc1A2N2FjL1UzUjVYRUJwbDdxclBDRWR1Nko4M0w3?=
 =?utf-8?B?OW5hL3JoNisweHcrQjlGa01qQ2t1YUtld0l1Y293ZEN6VkhXaGJoOE8zUFJo?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a508f662-bd92-4428-d4ea-08dcbdf38e2b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 13:01:34.1027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UnRz72RBw/iy9pnJMgqeHVdYLgI34imV9KqLRTZ2lwHfqstcUNbdZYXz5A4fYU7gD8+xqsgA75A88XvmYhDZYTFwYkQEInyBtXAd5sh6GsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7127
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2024-sie-09 18:51:50 +0200]:
> It is unlikely that GuC will ever send a G2H notification with an
> invalid VFID and it is currently harmless if that actually happen.
> But in upcoming patches we will start using that VFID as an index
> and we must be sure it is a valid to avoid a crash due to a buggy
> firmware or a currupted G2H message.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index d11839d9e7d4..ad447d867e51 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -8,6 +8,7 @@
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_gt_sriov_pf_control.h"
> +#include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_guc_ct.h"
>  #include "xe_sriov.h"
> @@ -212,6 +213,11 @@ static void pf_handle_vf_flr_done(struct xe_gt *gt, u32 vfid)
>  
>  static int pf_handle_vf_event(struct xe_gt *gt, u32 vfid, u32 eventid)
>  {
> +	xe_gt_sriov_dbg_verbose(gt, "received VF%u event %#x\n", vfid, eventid);
> +
> +	if (vfid > xe_gt_sriov_pf_get_totalvfs(gt))
> +		return -EPROTO;

I would probably add some log here.
I'm afraid that during debug the information about the last event is not enough

Thanks,
Piotr
> +
>  	switch (eventid) {
>  	case GUC_PF_NOTIFY_VF_FLR:
>  		pf_handle_vf_flr(gt, vfid);
> -- 
> 2.43.0
> 

-- 
