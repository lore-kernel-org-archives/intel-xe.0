Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D3DC25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 20:09:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2243310E2D9;
	Fri, 31 May 2024 20:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jCKHCeQ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9867B10E4B1
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 20:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717186143; x=1748722143;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=rdjhCcgR5w8qFeS9v136N4cp50+EVVkLL1c36Ly95KA=;
 b=jCKHCeQ3RKHl1BWChJxznaPHgMZrDrOKGH90cjnjj4lyMECc1BanAVbb
 RE5ldlA3jfJPM9s29CZxx8LVRSP/1iiRAP64KoWu6PERUM1RTOWyQR4QJ
 n+dqlpGAutgoh8YXDS2k3j+AqJTJPXiWnBJ3+ff0f6rBFOrKXhLhMi30C
 EVQLcFIWAHBeqvCLzF+uNSi1YXxetv/81eSg5p3kMdHHXhTO/VacZfTev
 +vMzbPaGpDD4GMnfTQCQjSmJT64MrqmZLHYmPJ7FFKU5Q72HQOh+uBnL4
 /wl7CWs1nhqykjH+YFZH4OBPdDfxvti4B3+6nI7z20dKemHBNclJxs9yI w==;
X-CSE-ConnectionGUID: irzZJ2lNS0iO0h+lCQQXaQ==
X-CSE-MsgGUID: Vh7uLzadS3auPKAZh/+KWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="13588715"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="13588715"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 13:08:59 -0700
X-CSE-ConnectionGUID: YGWwNEg1SVGAMG28K6XDOg==
X-CSE-MsgGUID: teln/8ZGTWakGGCXsQuFNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="36185549"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 13:08:59 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 13:08:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 13:08:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 13:08:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4dh7ejOIQ9bfIy7EwT0KoznH57pdlZU2CdaXnqG5LChsVmqmQB+CGeE8k07cIxaF2lh2aspCcHXbK/SgWZEF2i//lRqpI5briEbTwENA4aAO4iZF5LB2SX3VvvlggDIv5pB4lbkjbCCRt2erQ/+yi8qhJPFNtCc1Ffdktb1MDiLdcNcCpAnAkuqV+5T8rQNJqcPv9Fvu3pbV5lNL7TTo+K8lT0uxFIkVOoglDB4Zqd6tXLZuU65f8fb+fblgrHKDIW5uScsoQuCyBRGsXC3PagkPGEiTx+u4L+pIGPSFB5IxqvXKZb1AMFhjUmAFZOpqaDeItot/Q+6b4cbhYyOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fa71zkNlj68i5zuEfZnlG8BHzZ8gL6LnLk9NY0LFBfA=;
 b=Z2ZPy17O4O39yD+WwsVIT14ewB8dsEccb4OV8PruvAVIxykkEWe++Vw38fJzmeRdHzD+hXja8D9aSLZ3a3PRhUjC0ueOMnqWJDBj4TZF1e9ZiTMYSZYH1yYNOkm7b/1HnnTzdjWNosGSRMC5vFVgYE5UwLRZhSOIGf+CCMdQ8wXaGREQLKefktFQjvrv41Rfuf2MocI6/xWppPpgGYOESVxjI+9vqBkTUgBKw4TIG8pIxjHDhvJ36GoAOpU4uBclICnc0AQmjGbMXtMZ33bMznmJ4OsVAZjGQ9DG8h/9c72521D4Q9/JJvDIigGqoJPMUG+GIRDLzQVe/HmNecjq0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS7PR11MB7932.namprd11.prod.outlook.com (2603:10b6:8:e5::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.24; Fri, 31 May 2024 20:08:55 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%4]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 20:08:55 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Paulo Zanoni
 <paulo.r.zanoni@intel.com>, Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Fix missing runtime outer protection for
 ggtt_remove_node
Date: Fri, 31 May 2024 16:08:51 -0400
Message-ID: <20240531200851.223236-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS7PR11MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: 22a4fbaf-0a70-4498-8098-08dc81ad7fa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEIzdFZzR2xjUExxYjR4ZnVvaW1kaXUzc0xiaVdPY2FmL3BPMzU5Rk5tK1pZ?=
 =?utf-8?B?QjNUaENnRmZKUDQyVUdrOFk3ejEzQ3hQUXZyUkttang0UW0xZFpxbU1YeCtK?=
 =?utf-8?B?TkxoMGtBVFRYL0pXdE1GOVh1TTU4UHdId29sWXdIMFVRbURwdnVlK09NcXRH?=
 =?utf-8?B?RUhuRENZNUJiMmlpM3BNNTNQK2FKQzJGSTlsQVU2cC9GUmcvdEVvMVZjL2FU?=
 =?utf-8?B?RzYxUWtGdFZlNlMvWGU0SnNxTFJ2QkJFcmRMTFZldjFmU2NBQkhnWVVYMkNt?=
 =?utf-8?B?R1BtNXdQejYvOWViMFZFbGQwbjdGZG1oaVBiZlB1RlB3a002VXhPK1dBamNr?=
 =?utf-8?B?U2hBMUxQRnhwZFcwY1pTdjh5ZEt6ZENBRXlrYlFSUWF2M01EK1B4QVlMZmYx?=
 =?utf-8?B?b3BHcmU4S1pPUFhRNjBzcE0yRHRpS01DcS9ub1QwZjFleU1HbFIzbVJvMW1M?=
 =?utf-8?B?RUo0NEZoM1ZGQ1BaQUdVbFBqQncwWENPM0ljZUdhSWZWRVZWbjFvWFpRRHlF?=
 =?utf-8?B?ZTRpamd3cTFKck5MYmVBOE1LSGU0YUdaU1k0a2pmSU9ydVRMQW1MeVV1eWE0?=
 =?utf-8?B?ZUIvVklCcjc1dU4veVJlR24yV3lBOVprZFZVVzF6L0F4QUdKN3RUYVhKaUNL?=
 =?utf-8?B?WnpmZ2lpZGFuM1huNXFXZnp6VjEyYkw5UGplS2F4RjlKTXovOFlZS2FnUEg1?=
 =?utf-8?B?M3RuaHRjejBvOEVEZllqb0dpcEZhai9LeENsUVBYTEZ1MEphVlY5OUhqNk5S?=
 =?utf-8?B?enI3UWM2L3ZpcFg2eUhXUnhmMGRQVVorYlpVM003M3p6N3VSaUlYYU5LT3Vt?=
 =?utf-8?B?VnhNaHpnTVZ6SHE3YXBUOWo3S1VNK282bHpoSEZYdXZ2ODF5K0xTNlpYK2Jw?=
 =?utf-8?B?RlpGcmZoRXNjOVRTS0p5YlZyd0FwMmp6OUJmMVE2OGFLUURtM2VIdG1TK1JB?=
 =?utf-8?B?VkdyWEpDSGpselRRdUFRelBqaVZkK0Vkc3hpRzlLYVE5WEhKcHNMT1FBMnlv?=
 =?utf-8?B?a0Mra2xCdC9OTVo2SjBxL3R0U2dyZ2JScmtLQmNiZHFvd0hKVFdoT0tzMHZv?=
 =?utf-8?B?cUpwNHVJRFNmV1hMYW50TGdaV0t5ODBBdGUvZ050SENlUEJqV3N6d1V3dVlr?=
 =?utf-8?B?bkxsaG1uTFdocDBHV1ZRTUUwUFIzcDZMa09FNzZxd0tOSW1qTVVpMHlIS0oz?=
 =?utf-8?B?MitYVHJSUnpTeWpOSjlScDc4WXBHbnFlc2lCRWxMM0t2dE56d1JXMUZpVXll?=
 =?utf-8?B?azNqZXJRZ0hsVnNpMk9QbjdQcHNYWnhuRCsrWkMvdjhVU2liYlBtamxOR0F3?=
 =?utf-8?B?RmFnZGJxWmJEVC84NXNONkc4RHJTSTJsclAvck4xWWlUQlYwRkFQMUJTb2oz?=
 =?utf-8?B?YzNvdkpEREJDckRDWG5ZRFpUNUVWL2w5Rlp2WVBZZHBCeVRVQVJ3SktNbUZC?=
 =?utf-8?B?dm5kOG5ZMzlId04wV0w5QzJ5ejlFdHZGZGgyZjVjbTkvOS9zamsxeVBVajcz?=
 =?utf-8?B?Q25pYlJ1TkJNeTJFY2w2dUx6L0FTSmRGK2VpenpjUjBhU3NqVmVwazhUK01U?=
 =?utf-8?B?Z3RteExSV09FL2JJVVV0SE9DMVRyWHdiTkxIeEJXK092TVozdXNVRms4NW9w?=
 =?utf-8?B?VTBiM2h3QUtTcDUwVGhoMjB6eTVZTzA1SExyWXZUVm1PRk1tUHpRdFl4d3Q0?=
 =?utf-8?B?cTlzcC81d09LZXVHblFTZDFvN2R5Vyt4TGJ6SUwySkRDeDdrK1RNelR3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0loM2owcTBsQmt5eGNLUjBrcVhRVDNIcE1sZ3hMK1B5RnZueHRZVDV1YjFB?=
 =?utf-8?B?WktmQzFyWnkxYlFWalFZaStCeCtUTXhma3VNanFQR1cyRkV5bFdET09LWlJB?=
 =?utf-8?B?aFFteklXYXlsWC8xWFY0Zkt6RFVnRkNaN3FzaGZwa1kvRXpBMFoxZ2dUR3Vs?=
 =?utf-8?B?ZU5IangySkFCZGk1NUV0REJpZHZycnowcXdnakNHSGhwUkNCK0RTOXBpbVFJ?=
 =?utf-8?B?a0szN0dyNVlKNmV0VlZtOXhpT3Q4eFNXK1RmQTYrM2xvSmJjQlY1NHFEMTdR?=
 =?utf-8?B?UGs5aHBxUTh3dW1uak5wdmJYdzR1aVQrZVhEZzh2MmJjVzY2cWFRODVFMWJu?=
 =?utf-8?B?TXhwcFNkV2hCWmZsQzhqSklkTW1xUFM0SDltK3JtckVCQjN0MXZTdDVJTVlQ?=
 =?utf-8?B?eUx2cGwzVzlCVUlJTHJCNE5mOGRZQTN2N3pUMGxWSzJadEVOc1o4UHNPOERv?=
 =?utf-8?B?Rm84M2J1RElLWlpQeHM5K1UwVG9rYzJNcjZGRjdvMm1SNXd6UXBJMjhzaFhJ?=
 =?utf-8?B?Q3RrQStIYklrU2YralBwY1pLODMvSmdDalA0VzEwam9aU0xEeklDS210UHN0?=
 =?utf-8?B?blk0YXRySVRUem1rZkNEYThjd1owck12dFZzcEozeFA2SVVSRGNqNnM0cFRO?=
 =?utf-8?B?Tkl1QW14S1M4MTNkdUV2Nk9uWXhJODlndXhVV2F5Q3NzRGN6VlkzM29UNVFD?=
 =?utf-8?B?azdkVUdvSVh6eUpzY3JjTENiTWZvOXl6ZHBxUEl1MHRSWTVkOUZmNWY1VEw5?=
 =?utf-8?B?NlJCR1hFZ1dPRGJqMVU2dy9ReEhKT1NTQXYrWTBwTlFubkQxaTUyNm5xK1Y4?=
 =?utf-8?B?UWNNVkFsTGNxL1NDclJYTktoWWhad0UvaWhCMTVNV1BXSGJaVVd6WHNGd1B5?=
 =?utf-8?B?OVZJTU1SalJBYlNRTUZvWU40bjNIam1jb2VucWdmdmx0aWpxQVd1TDAvNHh0?=
 =?utf-8?B?MU1aQ0dsNzRDcndmMlRwSlVvT09iazhtY1JNblBEdy9HSHpJZHFFNU52RG5Z?=
 =?utf-8?B?TTB3ZEVSNDI2VTFyOS9ESTZFVmgzVFBiN1ZaVm5OL3FIdjE4cldNNktGK0k2?=
 =?utf-8?B?ckxYVHEycDFabWw1UWxGRFVlVnRVSkZmaXptdllnNTJ3cUFPcmFKS3Z2ZEZX?=
 =?utf-8?B?YmlWSHRqWTRRVEdSbDZJVjhURUt6N0huY1BsaUlkdmpYK1REcmJkSjkvK0xl?=
 =?utf-8?B?UnVtK2xtVWlGMm1hZFh1Ni8rREM5eEo1dkdNbE1NYzBMVzhOR1NBNjg2Sk9q?=
 =?utf-8?B?S2tjWVphczBkV2podFh6c2JXYThldVU0RGEvdDcyTFB2RDRWNmFPVVhtMFBB?=
 =?utf-8?B?Vk85aHdOZ09EU0cxK3lhTnZiY3pUbHBZRHFueUs5eStpeVdjbzIvWWhQTlND?=
 =?utf-8?B?dW90dks2aGZvVjJCVk5GeTZXTjlLMlVKNDZGWnBDSVpwZEFTL05WUWw5RldO?=
 =?utf-8?B?d0FpMlErZlpQM2ZjRnZVM2o3bnpoYldwaFEvNFV4VThTekI5VERwMkl2QWFW?=
 =?utf-8?B?MlRqaXUvK1RmQWdvZlMyeTd0UU1NYUNtdzA0TDNNUk5scldkSkxWSkpWNE1w?=
 =?utf-8?B?K0tFdHdzQ3V5clZJbUxuZUZ3NEdWcXpHT05BeFBUaHExdytOeEIxKzk2NVRw?=
 =?utf-8?B?SVNWSkFLZFJKcHhnVDU0T0FmMGJDYVdsS09zWDg1SFpkNVgwS050Rys3TUds?=
 =?utf-8?B?ejZ5NW9rbjVEVS9PR0FGWUwzZ3RlWTMra2FRaHAyVkppWTdGYjl6MzF1UFNa?=
 =?utf-8?B?ckdSdVhjcEtGN0RqOWo1SGE1VDJFYTQrZEVNV2c0UjQrUGlOU0tYVjQ2dUtN?=
 =?utf-8?B?UW1LUlRZZDJndkdyVXE2MEl2dURBdGhuWjdzbXgya0RBK0R3WFlmNzZjczV0?=
 =?utf-8?B?c0E1ZjJ3ZWFFc205UkxLdUowMFJYOThnWTdKNWlBc0QwcFplWFNqbWpDY0k3?=
 =?utf-8?B?TmRrZlJiaTZ0dHhCcjMwR2lVQnJ4ZTJWdExoOVRldFlhbVVoV1V4c2NjbjF1?=
 =?utf-8?B?WkJrdElkOUZsU0o1anFLYjFKc1RDc29MTURHLzc4VzV2ZitCMEc1dGxKek5x?=
 =?utf-8?B?aytVamM4bHc4bm9oU3MyWXY0SnRFWTZDSVlsaFRBQ3VoVUkxS2gwQUdNSmgr?=
 =?utf-8?Q?6kGaGlhXIIdip3lORr4pthBfh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a4fbaf-0a70-4498-8098-08dc81ad7fa8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 20:08:55.2434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21k9pgGh0VaxpM3LNX+NwdlvcONpL1TCwlDuk4LXob7yXlBuQKlG/hN1Y8crw4Gki0cAq9vgldko8WFTpMqUJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7932
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

Defer the ggtt node removal to a thread if runtime_pm is not active.

The ggtt node removal can be called from multiple places, including
places where we cannot protect with outer callers and places we are
within other locks. So, try to grab the runtime reference if the
device is already active, otherwise defer the removal to a separate
thread from where we are sure we can wake the device up.

v2: - use xe wq instead of system wq (Matt and CI)
    - Avoid GFP_KERNEL to be future proof since this removal can
    be called from outside our drivers and we don't want to block
    if atomic is needed. (Matt)
v3: amend forgot chunk declaring xe_device.

Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 57 ++++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index b01a670fecb8..ab086737f910 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -443,16 +443,14 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
 }
 
-void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
-			 bool invalidate)
+static void ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+			     bool invalidate)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
 	bool bound;
 	int idx;
 
 	bound = drm_dev_enter(&xe->drm, &idx);
-	if (bound)
-		xe_pm_runtime_get_noresume(xe);
 
 	mutex_lock(&ggtt->lock);
 	if (bound)
@@ -467,10 +465,59 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 	if (invalidate)
 		xe_ggtt_invalidate(ggtt);
 
-	xe_pm_runtime_put(xe);
 	drm_dev_exit(idx);
 }
 
+struct remove_node_work {
+	struct work_struct work;
+	struct xe_ggtt *ggtt;
+	struct drm_mm_node *node;
+	bool invalidate;
+};
+
+static void ggtt_remove_node_work_func(struct work_struct *work)
+{
+	struct remove_node_work *remove_node = container_of(work, struct remove_node_work, work);
+	struct xe_device *xe = tile_to_xe(remove_node->ggtt->tile);
+
+	xe_pm_runtime_get(xe);
+	ggtt_remove_node(remove_node->ggtt, remove_node->node, remove_node->invalidate);
+	xe_pm_runtime_put(xe);
+
+	kfree(remove_node);
+}
+
+static void ggtt_queue_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+				   bool invalidate)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	struct remove_node_work *remove_node;
+
+	remove_node = kmalloc(sizeof(*remove_node), GFP_ATOMIC);
+	if (!remove_node)
+		return;
+
+	INIT_WORK(&remove_node->work, ggtt_remove_node_work_func);
+	remove_node->ggtt = ggtt;
+	remove_node->node = node;
+	remove_node->invalidate = invalidate;
+
+	queue_work(xe->unordered_wq, &remove_node->work);
+}
+
+void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+			 bool invalidate)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+
+	if (xe_pm_runtime_get_if_active(xe)) {
+		ggtt_remove_node(ggtt, node, invalidate);
+		xe_pm_runtime_put(xe);
+	} else {
+		ggtt_queue_remove_node(ggtt, node, invalidate);
+	}
+}
+
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	if (XE_WARN_ON(!bo->ggtt_node.size))
-- 
2.45.1

