Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB45C0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 10:09:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AFC10EA59;
	Fri, 31 Jan 2025 10:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XrDLdCET";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85B010E1A3
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 10:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738318191; x=1769854191;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=/x8uYkmlzcadgTdjqNI8YfPm1DitUPa6dFrRAHUV1ec=;
 b=XrDLdCET5vBMuilGOWARuXzyIGhKuWVqOZg9HrkDZOv+DT/DQbuEFpVd
 qg6EA1gW80AU/rgudbfK76wB0Lb7yemcAJuBf56JhSYaWJxLudtBzrrP9
 7l+KR4nrSH/hR8OTu+ObgChxGDJ0IdPuyo24RFRwPd0JTj9Nrt01IILci
 /bPwXIIX9ZR7nnUYRf31WvFFk8FWb3k29z3SzYS8FhfKAZbWGYv0q6dQn
 t1IdNIGMw0C8Y77SyCCzN3f3GxclI5QrenPyii92KXScixVfQ/BkN3yM5
 wsNNTMgpaBolQvXwfu2r8NhoCZJ3e0uCDPF20yXp645Mg3lVTfeCE7k2I Q==;
X-CSE-ConnectionGUID: N7AYFeyZS1CVtj8ZsRXmeg==
X-CSE-MsgGUID: cdF+PbsQRZiwJM2rQc95Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="42806964"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="42806964"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 02:09:50 -0800
X-CSE-ConnectionGUID: qugkY56uSb+2797kHqFiVg==
X-CSE-MsgGUID: HxopmuTQSJyZfcqtJpTJYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="109735683"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 02:09:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 02:09:49 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 02:09:49 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 02:09:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5WAclnXbtzbLt35g1ogdfm+1RHzvslzDXUuXdY6sXZ0u5Mme9F9Rr3hbLvHe+LQbSBamRvzxRKMu2umZG6MEg3YrwTs0otoGHzlFd9O8BluXJfAv7GPtGufNWO/gENru4sYXFOdNjoNwAiVZwrs5xR2rHnSTyNgBfDvIMsZb03Wkp5iOGoFUtWl+sydfpv+g5b4e6voHmJkW1GEuIn53sUVgE+LDN2lY2Ggwr0PpZOtjM2e8ILVkRVCbCQfQwJl0DD1LQyu+OYeNFm4skBUtYMD0ypyeuMAgS2NyZBeqYJ/dq9Q20PLHT5cfVpoLyabv8ACWQON961Fapco3ijm1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DyKDYrs5GjCHW2EdqPfGnxjtVLes6aK85sS5Fzm/+G0=;
 b=ohoht1spixoteFYdmJZHq60Hj2yMzfQWyIaPcYrq2Wk0TXxlbfA0T+TiiCTZFJWCU1sXseUzjTtuTYsAZawkp0T2qR4QH0PJtDWDOi+aC2i/rzeDj2gOB0W6vamwamyDC8e3kdj1LuRsUOK4bBKkCoGwq+kbh/lfFLmblgyD4m5dm7PUp6VDJja21RpXncU1QS0HXOGw5KoR7mr8OvRWdnQVaZeOiq8OTLS1TpGVeg6SV7dI4tXtRtxLBVw6UadEC7ywNoMaAlTPjSbCgn3V8TZf39EanK8CqXQEQm8o3uyPXxFLNaXMsxKVNdrkkxNqlkUzepK9MyO22ZPtojTSsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SN7PR11MB7044.namprd11.prod.outlook.com (2603:10b6:806:29b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Fri, 31 Jan
 2025 10:09:33 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 10:09:33 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Farah Kassabri <farah.kassabri@intel.com>
Subject: [PATCH v1 0/2] Cleaning up code related to VRAM regions and its
 initialization - part 1
Date: Fri, 31 Jan 2025 11:09:11 +0100
Message-ID: <20250131100913.659082-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2P251CA0022.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:230::20) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SN7PR11MB7044:EE_
X-MS-Office365-Filtering-Correlation-Id: 42c5d38b-0125-409f-abc6-08dd41df5bb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajlJYU9GRk56eTlFWHZSNG1XaUp0VDB4YVMxVUxWRFdsUGtmZ1ZhdytYZFRu?=
 =?utf-8?B?VzY0TFZZVUJYN0RhZmh5TUZjdjA2YUFTWHNnOXJQdkJ1Qld0Y3A5ZnlZZ2Jn?=
 =?utf-8?B?NzdlcUxDQmQ0dXcrL2VwVlpCcC9kUWhmbFV5UUpCa0hLMm9YbkxBOXFqNVR3?=
 =?utf-8?B?Q0pBeUpFKzRJeFNYZUVEZ00vZ3hxVC82ajUrTElLSEZxR3JjZjMzeWlBTHVu?=
 =?utf-8?B?SVg1TUJVMW5MbzdGQlAyUXdPZnlEUXRWakhXWlhDT043U2JZVnI1aWpSRFds?=
 =?utf-8?B?Z2RROWJONkMwMFRKOHlRYXdXMVJJRUJLVitiQ1pHUnh3RklGVWVlS0lPSXp4?=
 =?utf-8?B?a0pXNFN1NjJDUm4wZXN4Ukk3OCtGMUUzR1lwTGVWTkVnamdPWmIyM3l2bWhi?=
 =?utf-8?B?dnVXUkhBcUR5MHNOZ09RUXJBWjdlM0w1WWVwcU9ZeEdudGJCV1VEVkY4dFht?=
 =?utf-8?B?KzNZcVdGSHRLdk5JeldkVjdOSWY4dTE3a1VnK1Z2VE14S2hDSEZkVmNBRkFj?=
 =?utf-8?B?djVzRWNqdGt3anJpRWRwU0Z2elYyZzM0OXpsMDF1Y0J0VXg0SUVRcjAvTUR5?=
 =?utf-8?B?eTdYWHg3RDZqQ1drRjJkTUduM3VSV0s1UVNBY1dhVVRuTUptbVRvVzhpa0gy?=
 =?utf-8?B?TmtwZkt6c3dicnlENWk0Sm5sZ0QxYjRvWDlac3RIUTRZQmdseVNZdHFyd2Rs?=
 =?utf-8?B?SmNsenJEbmllcXFvZkcyZ0hYb2RzWFZyMjFQRVRWOXlKWS9XZEhQQXJlQyt3?=
 =?utf-8?B?R0xMTEIzd2t2K1BrS2JvVnRyU2dBQ0tpRjVMTXkzdWQ0c1JVK29SNmhsK0RW?=
 =?utf-8?B?TENmWkNMTkwzcFV1NDdnekpvNDB5QUI1RG1wQXYxdmJnMDhmYWtaM0ZLak1r?=
 =?utf-8?B?RkgralMza3BQci9HYWFIZURUVkN2MW5SaFVEbmpQSHpjS0pGTXcvYnNHVEIz?=
 =?utf-8?B?MnJyTWRaejRqSmdFTlkxcjlDVXRLV0J6NEwrYy9RSjhrcWloc1ltVHF6MEZw?=
 =?utf-8?B?Q095ZUJIWVJXRUpHNThvNmx1emhIZnNQN1k2TERNa3NtcGNWNE5wRjY4VVI3?=
 =?utf-8?B?dlQ0YitiajlITTVGd3ExVWpLVTdLeUJIdHNabXJyelVUeW45OEhZeFB4M1Ft?=
 =?utf-8?B?eXN0aHVZdHFJaXN2byt5Wml4Ylg4N2JIc1hZTEtTMHdHMXJwRGVPdkN5U0s5?=
 =?utf-8?B?OGJJNXJjNjJ2SXZlUTQ3WXlYUjl3cDBMVFRTQmZmRkgvOFlpUFFmaUNCTm03?=
 =?utf-8?B?bm9YQWFDTWE2SEZiaUVzZW1vREFWc2NRUXh4cDdBaDEwOXc1Sm81RFphTGhL?=
 =?utf-8?B?YWdVcGlWdXNReWJVR09nQmc0a29kVG85dzFFL0VqWlFkbUh3TTdnYUtZS3FW?=
 =?utf-8?B?bFlQdEowdUlnNkdMMEE1L3Jvb1J6Q0ZZWTNDWXlwTDhKN1VJTmxYMTV5ZXRq?=
 =?utf-8?B?VW5QeUgwZy9tc1N4MGpZWERKUk8vNEUrSU1yOG90Vy9Zc0dDZkEwZFlVL2tG?=
 =?utf-8?B?VFBXN2szUEU0b3hLSWFuV1RIazlGODFpN3lFL3V4TjY0MGticnQwR0hreEdr?=
 =?utf-8?B?Ny9DTk83U1NpdDFKc3B0T1lpRktHQjhNNGlhTFRZOElkNjZDcnQ4K1RPeStC?=
 =?utf-8?B?QzErT3JqaFBZQncvV1lQUGtIVHY1SDR1RThFUU5CemJBcHp2QVA0SkdEZUR3?=
 =?utf-8?B?U2xtNjVISXVibUFVL3RESlBUNnhCeHFwQkhUQkhVM0l3VWpZQWNNSTg2ckls?=
 =?utf-8?B?cFVRL1c2clo5R1pKa3FvT1dsUU1CSnhqeVAzQSsrTkgvUkdXU2pQMzJrdGtm?=
 =?utf-8?B?RVFZNjRRckZXUW42V1JVWTVVdlZIczh5elJtZzl6ZlY0MVE3SVBMMUJIVHBx?=
 =?utf-8?Q?u/hGeY0jsc/Rn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHRZdDdrdFJ4VThNVGZpa0d2Y0pGNldQb3NneWpnTjNjam9mSDFuUkFEY2dB?=
 =?utf-8?B?eERwYVNwdGw4eStDa0ZrblVNbmlJWFBhUy9BSnBjZXFMU1FYL0VwY1hVa1l6?=
 =?utf-8?B?VXhpcFI4UnN4dmwwZDcyMys3c2doN3U2QWI3dDVNUktrRUVwcnUyQTBMc3Jq?=
 =?utf-8?B?cHBPZk5YU0ZrNXlGbjV4ZE5JS3FUamRRNkxjdFNwSzk3YTMwblFMa2JpYjA3?=
 =?utf-8?B?YXFCTThWQ044V2tna0krR3Y5MCtHTVR3bDZQVjB1Q29tbUc2ZUNjWFprclZH?=
 =?utf-8?B?UDVJNUo3RW45Nnp4Q2FybU1QZk9tdER0RGFVNFBWVlRBQjd2MG1jS1N6ZWNT?=
 =?utf-8?B?OHZXRWh3dHR2d1c4M09HdGkyRVNocmxqS3NPWlRxVzNNWndoVEtWWXZZbjlD?=
 =?utf-8?B?ZDlBbkdpdmphYThDcW82RWVDT3c4NTJ5UUtyUlErVjFKVjBKK2FTZUtDcTN4?=
 =?utf-8?B?Tnh4cXBMK0p4eWMvUVRXVHpHN2syNU9MNGxVbytXRkZJV1pFNnVRbXZETmNE?=
 =?utf-8?B?Um1Oemg0V2U2K2pqaTRwV2pCUHBxQ3VsR1lwUXUwdFJuOU4zZjA4d05hNHNW?=
 =?utf-8?B?YmtDdjdOOFkzTUV4RUVOZC9nUnNpbmk4cnNNeFN6OVBpMVhvNVo1L3hUcWNm?=
 =?utf-8?B?d1ZaRzhpK0pMYjJnWGU4KzBuWmt2NHBQZG8vYS9zMjFWT1JPUmRjTkViTHRa?=
 =?utf-8?B?VXRjVHFMNXE4TVZ0UFUzZmRrQmduVXB0bHFvL2ZaSCtvWkxkaXdTalFnRkd2?=
 =?utf-8?B?SzAyV2JBYUVUREtFVTVQOEJTdWN2d0ZYWGVDdUhGRk5CZm5QaDhJTFVnRjVK?=
 =?utf-8?B?SlMxM1pxUkIxUEp3MFYyQkdVZ0pNWHFncGpSSzdJVllTMjJ3bm9MNnRxMmVm?=
 =?utf-8?B?bkhBUWMvbFNBdGNCYTZqckdUM0FuK2txS21qdXpWQVZ0dDEzR01CSVloRHdY?=
 =?utf-8?B?RHFuNkpucFVkVzJYOGVGdFpRcUhiYlRiUUhvaTNrT2hzVGU2S2p1VnEzdHc0?=
 =?utf-8?B?ZXpZOWh5ZWpmWnc3TzdPTnZLSVFMMGZSM1BieGI4a0N5bWVUVzdtMG1pcWdz?=
 =?utf-8?B?QTdhNUNJZmd2UzBWL2ptc1F2aURIU0lZN244MTBpdThJWUtkaGsrc0piNEhq?=
 =?utf-8?B?cUxzQVBXbmcrK0FVc0dXdVFaOUZRZG4zZ3YxckZzN0hDVXFMZElOR2hENWZr?=
 =?utf-8?B?RWwrNFdmRElRU3A3aTE0VXFSbzBnQ0JBRXRGM1gxZDN5YktGZFNJRXExTlNK?=
 =?utf-8?B?enYzbmN1d0tjQlhtNXhzRzdIS3U2eDVCSVlwSERTNDZFVnFXVUJSL0ZqZW1i?=
 =?utf-8?B?bGJaTGkxVEhiOENaNWVvT2l6NHQ1WkllMXpsbmdiRUtDREZ0bkpLeVovWXJF?=
 =?utf-8?B?SWh0SDdoREpJU3lVc2RCNE4wa3ZxUnoxV3NiQVFYSDZOeW80SzUxc05GTTRl?=
 =?utf-8?B?SGdhMGNEcE9vVXpNekRvRGJwM2dIaytaTm51T05pM0QxY2padG9VVGIzcGNr?=
 =?utf-8?B?WnVBYmJGMTd0WnJSanY4UDlCT1BuYXFmTkU1WStTQTBjM2czbzBmVjhiMndu?=
 =?utf-8?B?dXFMSmNmTzg3Y1RHQ2RWcUQrdmhFVjdPTDVGaERYVnE4S3FoN0ZUTEhqOU5u?=
 =?utf-8?B?NjdVbG5iWnE1L29HMTR1akxobzR5Rlp5ckwrYUxsMjVkemYvbUJLejF5cml0?=
 =?utf-8?B?ZVZtVHpXWXpLQ0lOOElHMWUza2hab3hhK2xYNjJLVDIwU0VGOXBxK1Y0S1Yz?=
 =?utf-8?B?VU5OZ2RSQkgxb056aDRzWTRpYUx3ejM4YWFMZGkyVzlkSHlmVnVUSk5DQXhK?=
 =?utf-8?B?elRGcXJnTTQxMG14NVZCQnlxT0p5b254Yy96bURJNmI0aHZhVXUzd2pwZzZH?=
 =?utf-8?B?bnVTd2ZJaVpza0ZsRldBNEdxY3Y4Y2JnZkF6d0EwQU9SbVZ5bHlETEx3MDlQ?=
 =?utf-8?B?M2FHL3VLcDY2aEkwTENQMTZCbjVlNnV3dTc4T2Nhb1lBNUFxd0x3R0xNNy92?=
 =?utf-8?B?Wm5qNVZUeEpXdXRKOE1wOHpJSGxlTlZoZWZPcnAzSjVMRDd5MmdnMFIyQ0hp?=
 =?utf-8?B?WWxaclRoTGxZVlFmYlJmeHJKS0hkay9KVXFxN1p1OG85bmRiYytBYTFITmsw?=
 =?utf-8?B?SDEyYlUxM0duYU1TRnJTcUxWMTNCdTgxeGVQaHRZSS9yenA2YWRVOWZxcito?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c5d38b-0125-409f-abc6-08dd41df5bb8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 10:09:32.9675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zxYWwktKC1IeX4ay0mRgkw1QO2vMNOBOsmF4kBKT1o3fe2J7Q+Klr2z3o/vMaX5T+FcYJVG/UzZ01fR4Gy4Wg4DvktCdjpEuH78B4dvzkTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7044
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

I would like to reorganize the code in the Xe driver regarding VRAM regions,
in order to allow in the future easier extension with more VRAM regions and
other than per tile ways to manage allocations in VRAM.
I would like to start with such simple changes as renaming the structure
xe_mem_region to xe_vram_region, to stop pretending that we use it for
something other than VRAM regions, and in the next patch move to this
structure, the field responsible for the TTM manager - this will allow us
to keep the things needed to manage allocations in VRAM in one place.

In future patches, I would like to make some changes in the initialization
of VRAM regions, and allow for dynamic allocation of these regions
depending on whether or not we need them in a particular case. Finally,
I would like to introduce the possibility of a separate VRAM region which
would be dedicated only for kernel structures, which may be necessary in
the case of SRIOV for future platforms.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Farah Kassabri <farah.kassabri@intel.com>

Piotr Piórkowski (2):
  drm/xe: Rename struct xe_mem_region to struct xe_vram_region
  drm/xe: Move VRAM manager to struct xe_vram_region

 drivers/gpu/drm/xe/xe_bo.c                 | 12 ++++++------
 drivers/gpu/drm/xe/xe_device_types.h       | 13 ++++++-------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  2 +-
 drivers/gpu/drm/xe/xe_tile.c               |  6 +++---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       |  2 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  4 ++--
 6 files changed, 19 insertions(+), 20 deletions(-)

-- 
2.34.1

