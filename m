Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B1EC87FC9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 21:50:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0075010E2D6;
	Tue, 29 Jul 2025 21:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FqMChX6D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7F010E2D6
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 21:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753825858; x=1785361858;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6mAWaTy16gT54uxSBjZWc2NIRdie8f9YBRf/7kaT/cU=;
 b=FqMChX6DTNB5G7Gu2evt99eAdS5dWaxHW6tNE1DCL01wC23Zkb+hhUCs
 38SSk/NjBxTow24B6N65lLrDLQlgmKI0dQWnUkpm+FBGsQ3f6/1auEL/n
 zxNWQ6RzcJ+6WNzt0EHt74EyKCjINEQ/k/IRLQ/vVZ61nM6S4Gl8AmvHl
 5Hhmhgs6hq4QKL85D6FsTIvqzo26JkuWmeyYRFLWS6uDuG8Qzy3ohRJlx
 H1uM6l0h0Y7iaff9KYKsgjVGB01RXNXEqg5zPzbMHIVWfQ3C3N5v3tkXL
 17K/WtFqQ/jF1OWtYbrTCF6jwN/yipbWtATEsqRARHhrNjw3psCCRxZ4R g==;
X-CSE-ConnectionGUID: HyYPrtmZQhiq61YswpCXLA==
X-CSE-MsgGUID: 6IZla6zVTQqOFj/AndDJaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="81556609"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="81556609"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 14:50:58 -0700
X-CSE-ConnectionGUID: i9OzU2pDQLadCaQOZzGnBw==
X-CSE-MsgGUID: D/Ey22G6RjKgQ1fa80WGew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="186486308"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 14:50:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 14:50:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 14:50:53 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 29 Jul 2025 14:50:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqEdzgTx+/qVAgl85f5nDhF3x25TwcR188CDyAatj98IJyQ2OMpVqpjUjQKl7/DEFiVOpUsKc2e/tnr622gmcZczFa76TwpXd+0gM5jQMFDxz/b3jVQhgmo8jq2kXavnZ+rLiW0KGK6VbCB57ZHxbsCWS4sPfP7elUCrxQAscMGVAsW94muwzF022gtXC74WyDZf3pramKhAD99mmdo9+buSbXaO3+7k1KxWvBIWpq3yjrdDoPaGcQRhpXT41D7KY5ib9jJ8FaPl4mvOHHWqwbjOtsemAogH6Qzf3jtUW4EvB+poD8qc8K9b1hI25E+ujDuMNanfp/ENWL8jaCId7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahgNfV1EIqH+0F1Bo3LKmLocskbiMwTwOJeuuDOAD/c=;
 b=NSVPmlZaevXB1ipD4WaFphzdlrsr6WRHdUFfPtp0TVl3kzWp0ILPK6Q1TlLMWKUJndMHPu3j8yhb+/uDekY0Tgu6lTp0HW4vXZ5/v5zxg8XW5esEa+26EWFk9m9L+BRXZApUBhM0+9H94Vs1GtjmHlfoU3IxvZ+QRxKfge/KH3nYbqDASyki5eyZdbiJ7p7nlpErQ/kc7KFPvvbpuPadjAKDhm/nzdMVl2BzDPInQrYKq9X2wQK+x4acbUSOBgbwpgjW20VIsgP0IesdppOkzIdMrxuAnVMAZ4WZ+/pl5HOwH11Foy/bWcTI4f4oQc/rGup+9VNfl5DDx0uPkBGbBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SN7PR11MB7509.namprd11.prod.outlook.com (2603:10b6:806:346::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 21:50:51 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 21:50:51 +0000
Date: Tue, 29 Jul 2025 17:50:47 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v5 11/11] drm/xe/configfs: Allow adding configurations
 for future VFs
Message-ID: <aIlCN6BVU4RgS1Up@intel.com>
References: <20250729114215.177586-1-michal.wajdeczko@intel.com>
 <20250729114215.177586-12-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250729114215.177586-12-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::29) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SN7PR11MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: ebb5a65f-2deb-411d-6f71-08ddcee9fc0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WW5MbFZaMks2VWQwam1oWEVYNDFTSm1tUUpvQmpJQzN1a1hMT1pGbmFhcDBW?=
 =?utf-8?B?THdvbHVrNnVLY3ArcStNU0dUWkphWFNLem4rZ1dmMVg3YXYvRHN2UDFGNits?=
 =?utf-8?B?MDN3SWs4U0Q1TjF0WEdqOU9SN2dDQi8wSmRodHhQTGNJaGo3VW1aQVlNTGJD?=
 =?utf-8?B?a00ySHRodmRLRjczc1c2MDIyY0Mzem9BS3FGRzRvQzNHZmkxNUJaK3RNTDV3?=
 =?utf-8?B?Zi91UUkxMzFadUZJV2cvaHE2RWtDTzNtZndvN0ZIQ1dPYnZ2VG1VSHFMWUZZ?=
 =?utf-8?B?SkNsbzlYUW1SbVNVK0Z6eWxvVnBBN01yOGpjRXR2anhmVldCU05MVlUxd0E5?=
 =?utf-8?B?WE9KQ2dMWjE3QkRYQVh1Vzd4Vld4bWNqREFFUVNjQzJ5eVBuaUFHV0tQZEV3?=
 =?utf-8?B?V1p0cTJWM0p0MkVVbUQreVBZRUo0R2RMTVBNbjVMblhlUEU3QTlVcmNQelpZ?=
 =?utf-8?B?VjdmRWZhVHNQK1JEM3FzLzF3VTU0SlpDMkJIb1BFaXdRYVFjMUxrNjQ4Z1BH?=
 =?utf-8?B?OGxhQnFZVEw4dzErYnM2Y1VPVlI4SU5VR08zeUF1N09ydlZmamlsUnhmZEVZ?=
 =?utf-8?B?Y1dFRVBPdFVJWGxLRVE5V2hJK2tOTDRyYXZYaTBWL1NlaXprK2tpOEMxbmJB?=
 =?utf-8?B?S0JrQUVmdlVlVTQ3cHZwTzkwTmx1TFI1aHM4NGtUanNLcGJwTzBDRFlPNHU2?=
 =?utf-8?B?ZnJTR29Lb1JFaEpETWY4NXdkT1p0Vk0yNnNRL3NycTMvK2ZEcjFwaDdFUUJa?=
 =?utf-8?B?VUQ4Mm5ycHpLSUtHcjZmc0h5bTNNWlllZmVnaGgxbTRYa000VmFPRDE0SlRZ?=
 =?utf-8?B?U2IvR1JiM0VUMFZmdkF2VEJ6LzRabUc5NE1neXlzWVBDY2s3Y2xxNjYvRGtH?=
 =?utf-8?B?aHNzd3RyM2ZxSXgyYmlDSW9UZUhmNFpmWFZTb2NDNkxYNU9RNzN2Q2tBWHBF?=
 =?utf-8?B?UGQwTENJUGpGYjNQYWZRSVhmbkcxcHdCRGUxdG8rdEZ1S2UvVzNQUkI4RTM2?=
 =?utf-8?B?K2JKeEhqNFlFOGlGb2FtZUJxL1o3bE9CZUxpc1dGSlAyQ21sVk9ZWDVDWWFS?=
 =?utf-8?B?VVp6ZW9jK2NKeWpnVElHVGgyMlQyV2YrZTc1N0VybDBlRERpZGxqTFZQSE5o?=
 =?utf-8?B?d2dMMk9ZbkR3dHlyTGpsWnI0SVhjbHNpL3FFUlBoY1JKK0g4NlZLRURHT3pV?=
 =?utf-8?B?UWp5T1JtMmNKMWRtVU5aSktES0hsQW1PK3dpK213em9sMlQ0YXU2cEtYem04?=
 =?utf-8?B?cDY5K3IxNEI5c0ppaFM2VFdzRnorVk1RbVR4bGlNTVhaRmhORjgwT2dndy9Z?=
 =?utf-8?B?YzM3ZkplM215VlA4NGlLSXRhaFJWbVBrQ3FQV2VNSHZ1NStHb29ES2hlZ24v?=
 =?utf-8?B?RTVjOHdNYUw2OGdMcnNrM0hLTEhHZUxTOG1ZY1BOZUFRRGJhckw4bUpHNFAr?=
 =?utf-8?B?K2lSYXlOL3NiSmpIdFNabmpsMUhMSDFZb21qb1R4ZnArRC9pSHpWK0hPZGps?=
 =?utf-8?B?YkszV2NwTlBEcnJtWVdYODNsRjJsVFFndm5xaGhWcWF3N0w4d0FHek1tam5L?=
 =?utf-8?B?R1Z3NHR3UFl5L3N6SHNMS2RrLytpSTlRaVRGeWJyenVYVVoyN1ZWa3lnVTN0?=
 =?utf-8?B?eGdhSjdZOGtLYmRvVjRaTzZMVGZwTnhWYzF6czlsZzFHWGNmb3RIYTlpZlhX?=
 =?utf-8?B?MHJkN2t3d09heVh2VG5sRGR6d0NVOG1MVTVLbDJyd1BzcW95dC9PS3IwRE1X?=
 =?utf-8?B?aEhEUlVOZ2tQMTlrZGlnMDJPK25WUUE4QnFYejVuY3MxNm1BZ2k1cThocHpV?=
 =?utf-8?B?RlBUSzZXZUlhRHRkcVNMNWlycHgvazNlVTZDb29mL0IrbExnS08wbW1xTkE5?=
 =?utf-8?B?RkpIVnpLZHpBREl6VDhhL0xGbkdaV2FPbDF6ZUFmMnc0N2E4ckdDQjlCd1Ey?=
 =?utf-8?Q?bj0pwAfOnJA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGRZZzV3NW9EcWd5MTRIZVNwMXRqQUY0UkNqOE5EL0t6RE00dXU5NVlTeG5p?=
 =?utf-8?B?UDhCRFhwbFhxVmtMUnIya2pMMEJWSDRDQmpjQ2NOUTVjZnJzcHBnQk9vOHo5?=
 =?utf-8?B?Sk1ucjNXdGFLSHJCYW5pOHJ6UGdWalI5UHV2NjhlbnA3bVZhYVF1VTZnZCtz?=
 =?utf-8?B?SWNSUE5jK3UxZ3kwSHJnRWVEc0VvQ0JTaFFVOHBwTXFxMk1QTExObkpDOEsr?=
 =?utf-8?B?dDVsdXpDUTlkSGtpWVJSdTNnUFlqWWFnd2xJVHdUUTBTNHoxMkFEd1VTUy9H?=
 =?utf-8?B?Qk1aM2ZGS1hzdnVzK1NWNjZjaEk3WHl6NTArcHQvd1BsOTdjNTNsbE9JdUEw?=
 =?utf-8?B?VHl1Wm56ckFoRXJlOHY3TXNVZFFCUVRTN1JhWUE1dzVXTTBuVVhjV3dVZHZT?=
 =?utf-8?B?SjdUbVZjQkpPQjhKakdrSEpPQWJCei9aOC9SVFIvdjAwWEFNNDJpMnBsaVQv?=
 =?utf-8?B?UWlvU0pFRXB3blM1K2ZnbSt6VHZrYWV5QWYvYUNGRlVTc0FDQWRvRXJLazBs?=
 =?utf-8?B?cVZDSWtzQnFJTzNkajVxbE80NlNBMGxJSllZNVpINHkwUXNtQklta2lsa1ZT?=
 =?utf-8?B?MWR6dGRFS3hZeE96Ym9BWlNzN2h2dHU0SzhpblY0UWx5UEJ3K3JyaFo1MkJW?=
 =?utf-8?B?YmJacUh2KzNhVDhuT3JHdjFxUDJQTy9YK1N5UUNOcWxzV3Rqd1V4VHN5RVVY?=
 =?utf-8?B?UlQxWDkwTG1aeGNIZEdDWTFuNVZKbGVlK29kY2plZHlOd0h3Y3VDK1J3RHhU?=
 =?utf-8?B?cHpyZllQTzlCUlJTUGo1YTduNHlxZUhCNWpyODlzRGZ3SGlIZ1RUOXJEWlF5?=
 =?utf-8?B?R1dIVUt0ODdIdFVJenpWbTI2TXpldGFlVTcwQVhDbE90c2crdTNjc2hmYzg5?=
 =?utf-8?B?aDhROWV3dE8xTEpQT3A5VXZiM2ZMQ0FKT1gxY3lhSmxzL3JLL3QvSHRuVnAx?=
 =?utf-8?B?TE5iT3NtYVMyWmVaejdXbkt2U3g4L29XT3VJb3RlK3BpWnBtM2FucnNPRnVY?=
 =?utf-8?B?MVpCNkdoTjk4dno3SE5JZmczSG8zdnVnbUtoVkhjelBOR2ZVMS9qZ2p4cWtp?=
 =?utf-8?B?ZFhYcVlGOVBnUFp2RmM0UGFGclpPYSt3YW5yalp5bmpCY0hpdkNaUlB3aHVG?=
 =?utf-8?B?MUlKMmJkdEZWdXYwKzNoU01pT3REcHpsUytwMG9LNmVveTh6akRCd2U0cFpa?=
 =?utf-8?B?K1JrajQrd1Fod092c2twdklvMnMzdnMwcFBvVHhJZzFNMUp0YXdUTkMzMTlQ?=
 =?utf-8?B?SGZIQ3F6eHQwMjB5ZFdWYnJRVXcvZDZvUUdVeEJTR0Fxd1JPNWNiUE9vd0Nw?=
 =?utf-8?B?RlI2K0hwMkpoYTNTSFNFeDRVMDFVQnNRMnB2V3ZuaXlaaFdKNTJRcmJ1Sjh3?=
 =?utf-8?B?S0xKUUxTVW9uRlBMT045bzdHQkJuYXg1b0dxT0NIQ1pNOXBTajBJYmpLdGh4?=
 =?utf-8?B?SXdwTFMrN2RMZnV6RStqTGltczZUZDRHQXlyZlVBMGlrakFyL2V4bzlyN0Vt?=
 =?utf-8?B?OEVndkQzQTlxbnpRSnVzbzk3R0l2TFRtaE0zY2tteXhwSmFqNFJVSDQ3VVhZ?=
 =?utf-8?B?bk55VStJditETUs1SlFUK2NjMHBiZHRjRGNkU2hRMW9kbGFnRkFGbWVWQlR6?=
 =?utf-8?B?RjhmYzhoMVBPUGdEUHV6aVc1QjhWa3NjUDRwYzUrd28yQncyUmR0aVFoZ2hE?=
 =?utf-8?B?NWxiUGdpRVFzR2xzejRqK3ZMMGtrYjJzR3ZwS3FkM29oL3BhVmxPMThxckVm?=
 =?utf-8?B?V0JBMWVKRjJGMk9TbUVkWldaTkM3MEI0dm81MHZzeG5aU0RXMUZRbzlYQ3Mx?=
 =?utf-8?B?Q3JxNGZ3VkFkeDQ4L0hqbmd4UUFwc0w3ZEVqN2l3a2RXQmwzUWxYS0c4OHl2?=
 =?utf-8?B?a1BXM3pIci9kMU5vaUwyTndjM2RXRjVMVFFtQ2Uxd2JJRExEZHNBV1RQOGdv?=
 =?utf-8?B?M0tyRzU3Z1AzNmVJOExSUDhzbTZ5SHUwam1tWlJweHVOMWJNc0lESVlkYjk2?=
 =?utf-8?B?L3N5djRGKzVzWlVrSjdJZjRLL21id0t0S2Jsd0RmQjJRdlYyWTIzRktKOG53?=
 =?utf-8?B?TDlsTmU2djZHTGtQRklydm5Wd25rN29DMXAwMFQ0enlNQTJQZGtuRW55eWhY?=
 =?utf-8?B?blBxeUJtREdhNU1MZHBlNCtZL1ZPZldHOU9RUWJpYTd3NHpEMlllRU9sVEhp?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb5a65f-2deb-411d-6f71-08ddcee9fc0f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 21:50:51.0038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Qc0feX5aYVTtr51o1WHv/cEDOiQ2QmwoOuVS6PXGvz4nuhqJLmvP+oXINuh7/FU7GbLYcPk5JLqInfOqb0LvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7509
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

On Tue, Jul 29, 2025 at 01:42:15PM +0200, Michal Wajdeczko wrote:
> Since we are expecting that all configuration directory names
> will match some of the existing devices, we can't provide any
> configuration for the VFs until they are actually enabled.
> 
> But we can relax that restriction by just checking if there
> is a PF device that could create given VF. This is easy since
> all our PF devices are always present at function 0 and we can
> query PF device for number of VFs it could support.
> 
> Then for some system with PF device at 0000:00:02.0 we can add
> configs for all VFs:
> 
>   /sys/kernel/config/xe/
>   ├── 0000:00:02.0
>   │   └── ...
>   ├── 0000:00:02.1
>   │   └── ...
>   ├── 0000:00:02.2
>   │   └── ...
>   :
>   └── 0000:00:02.7
>       └── ...
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> v2: rebase and improve checks, fix include order
> v3: put correct device (Lucas)
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 766775772eef..da9a8e64621f 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -12,9 +12,9 @@
>  #include <linux/string.h>
>  
>  #include "xe_configfs.h"
> -#include "xe_module.h"
> -
>  #include "xe_hw_engine_types.h"
> +#include "xe_module.h"
> +#include "xe_pci_types.h"
>  
>  /**
>   * DOC: Xe Configfs
> @@ -285,6 +285,15 @@ static const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev)
>  	return found ? (const void *)found->driver_data : NULL;
>  }
>  
> +static struct pci_dev *get_physfn_instead(struct pci_dev *virtfn)
> +{
> +	struct pci_dev *physfn = pci_physfn(virtfn);
> +
> +	pci_dev_get(physfn);
> +	pci_dev_put(virtfn);
> +	return physfn;
> +}
> +
>  static struct config_group *xe_config_make_device_group(struct config_group *group,
>  							const char *name)
>  {
> @@ -306,11 +315,22 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>  		return ERR_PTR(-EINVAL);
>  
>  	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
> +	if (!pdev && function)
> +		pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, 0));
> +	if (!pdev && slot)
> +		pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(0, 0));

I confess I got a bit lost here... specially this last case with 00.00.0, why's this
needed?

Perhaps it would be good to add some comments here explaining a bit of the
flow and thought... from the commit message I understand the PCI_DEVFN(slot, 0)....

Oh wait... okay the discrete has another level 03.00.0 hence you check this
case here as well...

Perhaps a comment to explain the different cases here would be really helpful
for the future... but the code is right:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

 
>  	if (!pdev)
>  		return ERR_PTR(-ENODEV);
> +	pdev = get_physfn_instead(pdev);
>  
>  	match = xe_match_desc(pdev);
> +	if (match) {
> +		int vfnumber = PCI_DEVFN(slot, function) - pdev->devfn;
>  
> +		if (vfnumber && (!dev_is_pf(&pdev->dev) || !match->has_sriov ||
> +				 vfnumber > pci_sriov_get_totalvfs(pdev)))
> +			match = NULL;
> +	}
>  	pci_dev_put(pdev);
>  
>  	if (!match)
> -- 
> 2.47.1
> 
