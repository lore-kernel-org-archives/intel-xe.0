Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728C6CA5FB9
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 17:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF5E10E63D;
	Tue, 20 Jan 2026 17:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AgSzquYF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BCFB10E63D
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 17:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768931126; x=1800467126;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZPIg9nyb9Wxe9CghRCstHtkRLtvIlgfLigumQ7w3l5Q=;
 b=AgSzquYFsl88VAFYEwuVFuVcTqg3uKAP5MfBp4tCEgfeTY028q4iwNKd
 /fkQx+ekLa8coaUbD/cXVQPHKxnWX46kwQu8rjnbzAcotG3rEB3z8iTQA
 ZJmFcRxF61LycsPgvkrWLpIXGaqXQ7NtK0kdPzpqMirZl+HhKDVsPx8Mt
 CFvazMF8K4iEGUPq1G353PKgRGmbHUA1BhmqhqO8BL1t3lpd94Iw6xjfA
 5CqPnz2l5z2dQPHUNlOOmnozbfz6GYICadJhH8coqgifLUn/s8BtIZFbi
 7J9UKuuHbCbcMqSWnFZFAtNKoLsI8WL0j0aD90PgwPlSR3Y6AGcK6s6L4 A==;
X-CSE-ConnectionGUID: eBVp8HYSSvKd/i77KXpF4Q==
X-CSE-MsgGUID: XLSR9igFSyiGH96fen9FBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70048701"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="70048701"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:45:24 -0800
X-CSE-ConnectionGUID: 3j7skddqRKed5+7VUKf53w==
X-CSE-MsgGUID: rKRXFyNbQd6UinsbOed+aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="210678701"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:45:23 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 09:45:22 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 09:45:22 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 09:45:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aw9AUSOorlTw8to4Aq/wWz6iFb6qBPmpDFgl1E8KOyhlmCBZCEJt2Ln+gB+94n30gZO8q95fYyC28OmyYjeCuFsvXI/2NqT0unAZb5chNMVA0o/iuLaDK9bVxFC1oXWhNkLPymKHU5+Q0fXjTP6+N+sZF3AP5YAJdUiqmejzHfrtJ7vODdT2VIEWYV6pZDByQFfb8yMgKQcCGvmM1c+n7IR+1PwfreBwqSiNUrvhJ9+XQhaoHy3npFCqFuDNIi6QEYNSqTM/0x1ExmPOwe/4cwVQT6PAc6gwVsR3PI0+HuI7zGv1O04zyN/NvxMA6GCO6h9UGQeNjzHgD9HtmrDGIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeLjuFHhd+6jaRPydJMy3VQHWI7hiG7i2QMBWfWR75E=;
 b=zUKUxGvzLlgQlMYhusHAYMujurRsc8rqXWnpd+9pHMY68uTBNk/po04MWXCWADHColf1adaX2EN5NbHXpr4Qf7rdXXTV7LlUSqpVDQ/yae3Fh7sKagvKg36aVW9FVIqxTbtIwrwkVo+E7cavexNxCoABBfhdjiMUA+W7vnJ7rUOWcMnQ6K2avB4XZyG7i2RA13t4SF5rpTa30qkba70vkrv1pYBOD2O4RiCXLTRrggRaz8oIFQsx6CZUMcFoIEEayMHPdkvL8hzup5sjuY4uEdTptJWTLsG2P/SC5TsvaXsr/qXKZdCMG6qamaDh6Rx8JzCRo4GNGecWOVSPW6/fLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPF4AE904FD9.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.13; Tue, 20 Jan
 2026 17:45:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 20 Jan 2026
 17:45:20 +0000
Date: Tue, 20 Jan 2026 09:45:18 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [PATCH v4 2/8] drm/xe/bo: Add purgeable bo state tracking and
 field madv to xe_bo
Message-ID: <aW+/LsX/Od66W8NX@lstrano-desk.jf.intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
 <20260120060900.3137984-3-arvind.yadav@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260120060900.3137984-3-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0228.namprd04.prod.outlook.com
 (2603:10b6:303:87::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPF4AE904FD9:EE_
X-MS-Office365-Filtering-Correlation-Id: c0fbb04c-9566-4046-83b2-08de584bae5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGpsRmdmSFZqNjVaYjNVTGtreHRjSGM5KzJYc09rZysxbWlDa29mODdTbHpD?=
 =?utf-8?B?Z3BFMmpYeWJoNGcxaVRCODJsZUp5RHlNNVpvckFJUlNtN0taTUZraCtGQ21V?=
 =?utf-8?B?NkQva0NDK1p2MkYrMUtJbVF4R2dMM016UW1kZzBVYk1HREVzVkZReVdER05w?=
 =?utf-8?B?Zm52eDdQVURlOVBFbjZhMWk0T2xjZGlPK0dEUUFjaS9qK3gzYlFCaHZiWUdC?=
 =?utf-8?B?K280THpiYTB2OHZnYS9vWDNSMjcvVHArcEcxa3F3cThvK3RKeFFvcXVJSzlM?=
 =?utf-8?B?d3NMV09aVjNxK3UrRFAvT3psc2U1WlBDVUczczh4WmtHSk9ONThrakk3OVFm?=
 =?utf-8?B?U3VzY2JSakswUDg0OEpNbFdTaDFiYlJGNngwVzVGQ3FhWm9RVjg4aXFueGFt?=
 =?utf-8?B?MEwrb3FvcUtoNldpMmZYRHFzb2Q4N2dCM3hHV0tvVFFZbElEZ0NLTVRWcTF3?=
 =?utf-8?B?OEY3QWpycmdtMzB2VE1KVWx6dTM2NEI3Tk5Idzl5by9QNGliN2hGUmxzVUcx?=
 =?utf-8?B?YjJpcTAyZkcyalQydVpOVTZJelhXQTRneGJoZnJYVVhmWWI4QTR0MWJ5THEw?=
 =?utf-8?B?Mytia2NuUy9DVWplU3FoLzIrcVpLeStoNGNRYS9PQzdUZnMxNHZra0RPcEFm?=
 =?utf-8?B?U2w0UkNhdUFMWnorOEc4Ky9jdGtGZExFMjdJYVRBaHV4TlI2S0JDVElBY29Z?=
 =?utf-8?B?RldYR0g3cWF3cjBHVmNPd1Z1MzJTYkxDOUx4aVBGak51V05XcmxEUzl2dG9o?=
 =?utf-8?B?d1N0Vld2NVRQUEZDRmc0Qkl4TGtpdlprc2drbSs3cEFKbnFyVWFYdzl3bXdJ?=
 =?utf-8?B?YzdaOFlzTFNjSGdwR0QxVzNBQk5aZmN5RmhKVitJSzVzeWJHdXdJT2puZmF6?=
 =?utf-8?B?Y1RxY2Noa000NlJHazB3NGdBVXV0dWdtM0Y5QXdKVWsxMGZmRDRnOXJmOHdC?=
 =?utf-8?B?V1pIbk1ueHlnRW5mbFAwWTdoSXpqOVJ4Q0IwdGlSaWwzWXZ1bzJ6MTlpdEJM?=
 =?utf-8?B?U3JZbzMzZ2xzUHBHaDcyL3lpM0J5bjNWa1VabXZGL2lrU1V4OGVuTGJsa2c0?=
 =?utf-8?B?NUdoSDZWVHZHazR6dUxUU3JmUG9OZWZNenEvN3pXRUZ5Q3ZWdk90VU1vRVZY?=
 =?utf-8?B?OGp1M2JVQjEwN2hSa1p2NXNHY0FKekdDUkxtYUxUUllPK3ZmYWVTbFZUcXZ3?=
 =?utf-8?B?eDVaR01CRGlXTFZUNVdHc0FuRm9KN1JqVjlGTTZ6SGtXVGxaLzVmMW9MN0xz?=
 =?utf-8?B?STJHL0MvME5YeVRldEFieVBUdVNRb05tRlZ1eXEzTjF2N2Y2Zi8zOEtrV1Jl?=
 =?utf-8?B?dXg4d21MWWw5NHBqcjIvNHBKSTRLU2s0VFMvU0VUU0hVTVRCZy9nUGxnTzln?=
 =?utf-8?B?M3p1N29mUDV3NXN3eHZpcDdudWU0ZCs5ZjFuMzFaVkd3aXkxOXhuUllwdDVs?=
 =?utf-8?B?ckZrMXdUYVh0Slg3NkhmVER3ZW9TanovQUhDbW51YVdpbTl1QTRzTGVJcFRF?=
 =?utf-8?B?RzhrZVZDOWVSbXI2ZGpybmZacGFtaGY0VTNpTjJWcWtCT0JrU2YzT2hzNWht?=
 =?utf-8?B?SGVGS1F1TGZnc1JJY0xxR05uZm9JNExXYlk4Sk5PSHljaHduTWhNdHZBajdq?=
 =?utf-8?B?TlU4eDJLeGkyTzhoRjdCdUFDL0pZMlFYeTVZVDNuWmcrSWFmR1FXclFrME16?=
 =?utf-8?B?RWxRUzhuMmk0YmpCd2lsZ1RFZUk5UGRJSWgxY2lkZWFQU0o1dmI3a2Z0NjRU?=
 =?utf-8?B?SWNNZ1J0Q0J1cDNySHZBL291SU1ZWlVaL3F2UGVIL1Q5RFF0OWZOWmFtT3FJ?=
 =?utf-8?B?TEFMdWFxQVhCL3FMSFJ5ZWRodEtid3MxZ3FSZXlqQzlKRnFudHp4aUVOMGd3?=
 =?utf-8?B?dUJGYUlxSDI2RmtQZFlNTUpFQUpNWEVSVXBMUXNnWnlQMFFLaHBGN1NwNmxM?=
 =?utf-8?B?YnU4RFNGZk00QTJ5V01hUVREMXlzb3hrU2VEUHZ1Ymo2d1ArN0U4L2ZEODJO?=
 =?utf-8?B?QmtjMDFEeW1tQ1dwRWU2NzNkbzlnUXhSck03RUZlVTVqQzdWemttNUJmZThw?=
 =?utf-8?B?alY4a0s5TjNLT3JKdzFEUGkrSFJxd2dxYlJRbUgwQlNqODJzQkUvRldJWGQv?=
 =?utf-8?Q?s7lA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0ZJVFFIRi9rV1c1bkd1UmZHeGMzdnQrZWNYT0hscEo4UlgzWW8wWDVaUjVZ?=
 =?utf-8?B?a1ZoalJFbk15N2ZUM1FnTnBOeUlHZzZlYk1Nb0k5bVg4VlBjNWZqT3NWWUxj?=
 =?utf-8?B?TE9PT1oxMklJbTZDR05XUTQ3YWhXTnVhZVlVREZzeVV6UDhRQ0Q3cFNCUGx3?=
 =?utf-8?B?RlA3NGhyTGZaY3pQeTFjUThBVlRZVXMwOUp6RCt2T3NqRDhCYWFDUEdnRWE2?=
 =?utf-8?B?aGFka0Iyd2FrNzV0bG4zVzl4SjgxbVRJTTFOZ2l5TWtIbG5wZ0ZEUjN0Z2ZH?=
 =?utf-8?B?TlluR3ZINFhZcTVwaXorTjM2Zjl0cm5zNThKZVB0YjJ0aTUzUTZqdURYK3VS?=
 =?utf-8?B?SXBXdmg5anV6bWN2Z1AvK0pPZXlZS0VYZy82Sjg3Uk1sMmtPNjY5dDJuNzhw?=
 =?utf-8?B?cDk5bys3M0xuQ09HRGNnSjZCanYwUUo0d09QaStxdDcrVmlxYXNXOHJscmt3?=
 =?utf-8?B?L3JxN1Z2d0twUkFZSWdObWpESTVmanNQTmlocXl2V0lRZ0hFZ29ZbzRGR29z?=
 =?utf-8?B?dVlyVkpTVHlNYkc4eDJPRm5NcEszVmdqeXl5YkhLQWFNWFRyVERHbmMvamR0?=
 =?utf-8?B?RXZMMFR2Mkd4SFh4cFZXeDR3Y1o5M1p1N3lvWlNlaHlSY1JsbXZKSGhSdnZi?=
 =?utf-8?B?eWdJMWVXUW4rTUE3WlRNMFZBdStCK3FpVjZTbmZmb2VDN1lCYnZKU083L1lZ?=
 =?utf-8?B?dEQ5SGl6c25UMmhMZ2lWdkpWUjd3SzRDOW1EYk9XMlBSU0NSdmpxMXFqTFlV?=
 =?utf-8?B?eGs3Q25XQnVrZkFsMFNIMXE1bm1NUDErUmRFQ05FK3lNUlM1bzZXZC8yNnlp?=
 =?utf-8?B?NTNjaHZrSm1XN1NvZytCcEJ5Rnc0UTVlUEdGckxJNCsyMmVJTmlHaTZzT2NR?=
 =?utf-8?B?TmlNcGx3SGk0RFMxT3FCc1FPRytmdEE0RzNUblBuVk5QUnF1a21SVHB5NTFD?=
 =?utf-8?B?V2cxQXp0eTJuRU1VRWJOdXd1emdVeWZCNjZxT05KTFNVUFVUZjc1TmhSVXY4?=
 =?utf-8?B?M2crUCs4V3ViWWRxU0FzbmdnTWxiZms0K0VyMVBHMitPcUtaOGc0eVM2UFM4?=
 =?utf-8?B?Q3FIc1p3MU82WkhFMzFvYXBGV3VvQldFdzA1RVUvMktFdEoxSFZncjFNbTBu?=
 =?utf-8?B?Y2N3M2FmMXd4cHY2a1ZHbDZBamh3ZklNeEhXbnErRysrZHFKamsybmRodng5?=
 =?utf-8?B?OXM3Z0M1dnBBc3ZpenM5V3VNdlVOQ0YwSzFzOFZUcmMvZXBJNk1RM0o5QTNo?=
 =?utf-8?B?OUZMV3lGeVAxZE5nWGxyVHhadFRGOURMeEd6SVlDTW5HNGx5S2YvV1Nmek9r?=
 =?utf-8?B?SXJoL0p0SHFaSkJmNTV0S2lQclZiSTdleDIwTitiYUExRklHcU8wRU1UV29n?=
 =?utf-8?B?eTRHbXRrcEJMNEpZbTlLL0FLVmc4WlJMbDhJTXB6Tmd5azF5ZWhSdDVaaXQx?=
 =?utf-8?B?ZEtKbWFOdlZFNnBsTGRlVGpaYXdCU0FBY3dkTTIwdzJzUW5DZWVHd013a1dU?=
 =?utf-8?B?YWlCdVYya1hRNlFNUjg1NUV0dmZhRnZocXJYNGZvYXZRZk4wRExZQXJsL0I3?=
 =?utf-8?B?TjlrZy9WUEE3RW9WT1dEWisvWDUvU1MrcGxxcGRTRDF0R3p2T0FaUFpzU2lZ?=
 =?utf-8?B?azhGM3NDS0lDbHc3cFp2V0JoSTlIQ2pjbUh2bUxVczBTZ2F2V3drVlNlRFlC?=
 =?utf-8?B?VHNxeGpSZGN4d0RJeU9zRGc4dm5yVDE0WjZKNmdkbDB3amNVUzFMaDJRd05K?=
 =?utf-8?B?UnlwOXNPRVhZMDJSUTlhaWhndGdrak1rRG5tSGkzZ25RR0RkSEVBRUpoK2Jk?=
 =?utf-8?B?dmtCYTlHMjNydk9qREQzUktYSmREL2ZsV25oV3JEZDZveHRyNStaUWZ2ZEZv?=
 =?utf-8?B?aE1qTEwyS040aVhXN00yMlB6Z0hidkFHb1NTWHVzV0ZLRVczZ0pNenBOZFJp?=
 =?utf-8?B?eU1yd2VEL3dsVHAxd3VYblhpam94NktaZjBEaDVlZng2bjdkL2ZKbGNUYVdY?=
 =?utf-8?B?dEVzRlFTQndpL3VDNEwyd0RCTXlib3Uya3VDSTNIMzhkOGszeDNhUmdnbVpz?=
 =?utf-8?B?ZlhoSFZTaTJlTllTU0hWNzJuVTR2TW8vVWs4VndhbS9QYlBBOUN3RnFuRFNH?=
 =?utf-8?B?Q09wQ0Exd2pya0VpSE0zRG5vZVNPQmVhRTlCVEhqYzVaYVRLQ1dFMGZ2QjdC?=
 =?utf-8?B?WmMrK3hVcHd4djgreFNlbnZzRk4xZjQ2NVdQYTlPK1JDYVVGUFhiZjBHekVR?=
 =?utf-8?B?SWFrK0k0WWNHdUh0Sk9lRHBxbjZsVDZubStIKzYrc1hLWFFCaXNuc3I0QVB1?=
 =?utf-8?B?RkdBQXpqaVN4blBsMXVwVjJlamtTRWZDY1h1NmkyL3RJamlIVU1LZ05DZEdW?=
 =?utf-8?Q?7c+CsWzkkdz5tjfs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0fbb04c-9566-4046-83b2-08de584bae5b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:45:20.5495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/El6ixNZSer+a7H08mKzDy5h37l7CuZnLxuBlVXOLpmR+KJ7zykkoEnU59tE2Fi5q8+7U3EEoqPa8E47lVPCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF4AE904FD9
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

On Tue, Jan 20, 2026 at 11:38:48AM +0530, Arvind Yadav wrote:
> Add infrastructure for tracking purgeable state of buffer objects.
> This includes:
> 
> Introduce enum xe_madv_purgeable_state with three states:
>    - XE_MADV_PURGEABLE_WILLNEED (0): BO is needed and should not be
>      purged. This is the default state for all BOs.
> 
>    - XE_MADV_PURGEABLE_DONTNEED (1): BO is not currently needed and
>      can be purged by the kernel under memory pressure to reclaim
>      resources. Only non-shared BOs can be marked as DONTNEED.
> 
>    - XE_MADV_PURGEABLE_PURGED (2): BO has been purged by the kernel.
>      Accessing a purged BO results in error. Follows i915 semantics
>      where once purged, the BO remains permanently invalid ("once
>      purged, always purged").
> 
> Add atomic_t madv field to struct xe_bo for state tracking
>   of purgeable state across concurrent access paths
> 
> v2:
>   - Add xe_bo_is_purged() helper, improve state documentation
> 
> v3:
>   - Add the kernel doc(Matthew Brost)
>   - Add the new helpers xe_bo_madv_is_dontneed(Matthew Brost)
> 
> v4:
>   - @madv_purgeable atomic_t → u32 change across all relevant patches. (Matt)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.h       | 56 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_bo_types.h |  3 ++
>  2 files changed, 59 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 8ab4474129c3..00e93b3065c9 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -86,6 +86,28 @@
>  
>  #define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
>  
> +/**
> + * enum xe_madv_purgeable_state - Buffer object purgeable state enumeration
> + *
> + * This enum defines the possible purgeable states for a buffer object,
> + * allowing userspace to provide memory usage hints to the kernel for
> + * better memory management under pressure.
> + *
> + * @XE_MADV_PURGEABLE_WILLNEED: The buffer object is needed and should not be purged.
> + * This is the default state.
> + * @XE_MADV_PURGEABLE_DONTNEED: The buffer object is not currently needed and can be
> + * purged by the kernel under memory pressure.
> + * @XE_MADV_PURGEABLE_PURGED: The buffer object has been purged by the kernel.
> + *
> + * Accessing a purged buffer will result in an error. Per i915 semantics,
> + * once purged, a BO remains permanently invalid and must be destroyed and recreated.
> + */
> +enum xe_madv_purgeable_state {
> +	XE_MADV_PURGEABLE_WILLNEED,
> +	XE_MADV_PURGEABLE_DONTNEED,
> +	XE_MADV_PURGEABLE_PURGED,
> +};
> +
>  struct sg_table;
>  
>  struct xe_bo *xe_bo_alloc(void);
> @@ -214,6 +236,40 @@ static inline bool xe_bo_is_protected(const struct xe_bo *bo)
>  	return bo->pxp_key_instance;
>  }
>  
> +/**
> + * xe_bo_is_purged() - Check if buffer object has been purged
> + * @bo: The buffer object to check
> + *
> + * Checks if the buffer object's backing store has been discarded by the
> + * kernel due to memory pressure after being marked as purgeable (DONTNEED).
> + * Once purged, the BO cannot be restored and any attempt to use it will fail.
> + *
> + * Context: Caller must hold the BO's dma-resv lock
> + * Return: true if the BO has been purged, false otherwise
> + */
> +static inline bool xe_bo_is_purged(struct xe_bo *bo)
> +{
> +	xe_bo_assert_held(bo);
> +	return bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED;
> +}
> +
> +/**
> + * xe_bo_madv_is_dontneed() - Check if BO is marked as DONTNEED
> + * @bo: The buffer object to check
> + *
> + * Checks if userspace has marked this BO as DONTNEED (i.e., its contents
> + * are not currently needed and can be discarded under memory pressure).
> + * This is used internally to decide whether a BO is eligible for purging.
> + *
> + * Context: Caller must hold the BO's dma-resv lock
> + * Return: true if the BO is marked DONTNEED, false otherwise
> + */
> +static inline bool xe_bo_madv_is_dontneed(struct xe_bo *bo)
> +{
> +	xe_bo_assert_held(bo);
> +	return bo->madv_purgeable == XE_MADV_PURGEABLE_DONTNEED;
> +}
> +
>  static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>  {
>  	if (likely(bo)) {
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index d4fe3c8dca5b..6acfed0c0bb4 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -108,6 +108,9 @@ struct xe_bo {
>  	 * from default
>  	 */
>  	u64 min_align;
> +
> +	/** @madv_purgeable: user space advise on BO purgeability */

, protected by BO's dma-resv lock.

Everything else LGTM.

Matt

> +	u32 madv_purgeable;
>  };
>  
>  #endif
> -- 
> 2.43.0
> 
