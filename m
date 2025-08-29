Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FCBCA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 14:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2479110EBEA;
	Fri, 29 Aug 2025 14:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MpI9jQj4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED8210EBEA
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 14:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756479366; x=1788015366;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EKNn68GX1p7nv1zkIiw2JUh3Kzzut6xAK/u1nbj+YBI=;
 b=MpI9jQj4Hch3Fqa7B6vfZrY8MeqvAFTD3rypbdeoqb6GjsGy4feDn0wv
 m3c9bqh9OiqkDqENn9AilHhJFzn64p0yG1XDtQZtvq8jWlmWcREYlYwJ/
 DgFTVGhXoJoPzObvkv9Q2GHpi9oDUfk7nSvUujPAY4Kz6lRljv1UDTXX8
 4aXJWuLvPwIiq/cO7brZD1jtERDBNtda6QqyPWXahQXQKxAVO5js2iu7p
 J3h8VGSPtZJAqEBTQdRVI5p/dHkGGujFUk2R5uNPFY9eIOpdt0x/nz7j2
 EI1VgM5y7T9rDjK6d45X+4IVsTvEiU+mg9AH6ZBZyXgvBi1ugGuT9felO w==;
X-CSE-ConnectionGUID: nfHruUePQbS2YsRVZfOd4w==
X-CSE-MsgGUID: yIzU0XDMSzyenatPOj12Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="57959070"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="57959070"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 07:56:06 -0700
X-CSE-ConnectionGUID: UwY3OOQOSJeSXbCJUeBxeQ==
X-CSE-MsgGUID: TIw6u+WFRM64aM5Zer4rbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="174569858"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 07:56:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 07:56:04 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 07:56:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.68)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 07:56:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Si/Nx7k12NFLgKzJROTAHWX326xNf8al8cAFVpufUtb6K6kTX8C8jKCJpFjev1NwLFKtLQ2aaYrq9j+17l2BY5OwXznbSXgqcBRPss92EiBhUoJdyHlKh3uEsU875Bj9XgBN1ShutNfVMWq39gACHalDFYTAAup1mvPsP6qcYLCetgdu+4DmpOLiyi1Fqu4+5y8w6I6M2xS/SyLi45C7zailcrFG3Bt/izMcqO8rWk7hMVvs1olM0fSOTfJDJqLQz0NuGguGbVP17LvQhxjEK9/mqk3qh38Rg/3+2SbU7OtINZIP/DIsbhLJZ3fBWreJW/5bHO+eKQyRyDkl3ddgZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKw3viBVc+uYt4mvhrYxCqiJqyOnTYVugh94QlTBP2o=;
 b=sdrUgvYuypALUY89BORyt2ljGVkqBhg1AKmJv3wpzlp6i9271FS8HssUTPYudMUkse3hUj0yI5Q/v1N868MgdkWOvxwJp8UAsjFngX3tzFEB7i3D7tvcVLb5mxB+2ekIBPRsjG+0SbyC4SNlaDqLqv38qUWyl9mBOeXZq0S4b6O4SLZTDipnuJjd+gqM0ryC+k2GIJCzEgf4ZjzdE+mg5Zwsv2cZxva7+GEG66wKyYHbuFdwYNqSz9INzBcNqyMfm4SRRccLVmy5aemdvrDIS/lrVZkBK0TrlIWUnvV35XJJg6uVxZIMQ7vr17SQCF8+eHLLENcYWzWW/jm04GrqBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SN7PR11MB6601.namprd11.prod.outlook.com (2603:10b6:806:273::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Fri, 29 Aug
 2025 14:55:58 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9073.017; Fri, 29 Aug 2025
 14:55:58 +0000
Message-ID: <b488a289-9498-4f68-8fc3-632b7384d3f1@intel.com>
Date: Fri, 29 Aug 2025 16:55:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/xe: Save off position in ring in which a job
 was programmed
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250827211010.308372-1-matthew.brost@intel.com>
 <20250827211010.308372-2-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250827211010.308372-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::18) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SN7PR11MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: db8f8166-76ad-4622-00e4-08dde70c2963
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUdHL0pYVndJNkVFL0pjaDY3VEJueitFMGJkSHVqejVmWmVlZmtFNkdXWFdv?=
 =?utf-8?B?eE4rMmxFTTB0aDhHdWtBN3ZKUHFrYk12SGN0YU5qeDhjQ0F3d3FCSFVhamlH?=
 =?utf-8?B?RExGM1hQeXBBZU5NZjYwNUFpL3NqcC91Z3R0V0JQRitadEdYTVZBbi9XVlFv?=
 =?utf-8?B?MkNHOWdOZ0hrMHBXNEVXZzZRT2ZoeSs0dENFUjU3SHBlZW5aaVg1cUluQXV5?=
 =?utf-8?B?OEFHekVTdlhJQjBKL3N1S3JkbkJaVXQvczVZNTltVVo5dTN5eS9WYmozUHNN?=
 =?utf-8?B?dE9OVWR6NzloUVhVOFpWR0NHSXlNMWFZeXFKZURYeWlCNS9vNDZmVmh2ZE5R?=
 =?utf-8?B?L0FXYUZCY1A1cGN4Uk9jWE1OaDhScXU5dGg3TXpKYXJZNDBQRWRxalQ0alNJ?=
 =?utf-8?B?cUFFTitaMWxidnRKeVN3cWttQzFhNmM0N2dvaUp0QzY2TlMxcWJCeUxSUnBl?=
 =?utf-8?B?cGdaQ0FUcW5JUXlHYXlBRm54QytlSTE1UUxSbGJmazQ1a3k4enBBZVNrVERo?=
 =?utf-8?B?U2VMTGNmaitBN1VoUjJ6YjFpa2s0YUwrUlNPTmRuVnluNENRem1BaW9IYmhw?=
 =?utf-8?B?WExnQ1hKYXV2OE9qNmdmdkovR3ltdm1wckN3NnBFR3NIRjNxUndUU0hzMGNU?=
 =?utf-8?B?MTdOY3ZxOWpWSi81WUl5U2ozWDZqTW1ray95dXRRMk84cjE1djMyL20xYjVH?=
 =?utf-8?B?QnVtdWwyWHJYR1hvR205TE9yMWZCbGhkYTVwM1l6Wmw2ZW42bXpwc3gxcVNw?=
 =?utf-8?B?SDcwaGhkazIya25STSt0TW91VFFub1F0bTZqL3pBNWp3LzZjQ1hVeVJFSDM4?=
 =?utf-8?B?UTYwQkVxcldFOVJ1ZURPQStyL1ZhQlV1QU05MzFGZ2hEOEJIL2NWYkhkMFFx?=
 =?utf-8?B?RVZPZnJCRGVzR1kwOFhFN0Q1ZU9obklRdjFvTnJHR3VnV0dMZDUrb0QySzY0?=
 =?utf-8?B?RHNGSHhrbEI3ME1zanRkRmxHWXlsZ0MzWnhIczBJR2dad2hRVWtVZGJQakpx?=
 =?utf-8?B?aU5TZGpvU2Q0MThNRGtTbTZyNndndm1TYzd3SmVpVjBjQkw2YXorRFk1aFor?=
 =?utf-8?B?Q0ZRTkE2enR4WWxXRWp6MU5aVGY5Z2J2Vmk4T2lhZkJyTFc4STV3YnlTZjJ1?=
 =?utf-8?B?MEpDQkdnSitXYmszZzJPWW9peGpnV09PbFlMalhtQmt3NU5mbFk3YUgvNjlD?=
 =?utf-8?B?bHoxekRWWHB5SktaVE9UWEdXVVBjM0VPNHNHYlBwWTlPeUc3SklseHI2bVpV?=
 =?utf-8?B?OTdQd3IvODhkZzdUVEFSQXk4TUpJdkVTTndPWldpcW9kZ2tHcy8wUmpsbkMy?=
 =?utf-8?B?ZGpmeDBKM0NMT25WSWVRN0hkWk1NZkpZeWI3blhPZzd3NWNtOWNNRHVxcUZU?=
 =?utf-8?B?UWMyVElGNjN5VmJNTGVWNnFsTkpHdDRTQmV2dHQ4TWs0VW5JN3M2TWdXcFlp?=
 =?utf-8?B?Y3RPWkUzZkVHTk13dnk1OXJvQW9SWWM0b2tPTUU5dVJJbUkvZVpnWmlQOEdV?=
 =?utf-8?B?VUc2ajdyd0RCNEMvRkdBQTZNL3BRQzBMK2ZtMUt3N0NmS09tUzNpeGNhUEdl?=
 =?utf-8?B?NjFkNlB5Z2tMZWV1K0E0cDJYVGVvem0vaXJiWEE2eHhTT3ljYjN5RWtucENp?=
 =?utf-8?B?cC9BbWN3eVJHQzBCOTNUOHIraUJLRGd6UFRrb2xwekwyRDFlOVBLODY5dW5J?=
 =?utf-8?B?UVNzWUhiOGZXcVphUG1lQkVMelRqemtkakJRL1VUdHgxdUdOQnpmcm5xakxX?=
 =?utf-8?B?TW1ETWVTVkRsMHhVVnpnZjlwZXNwVmtzTlN4VEdWVmQ4UVEySnZQdGY3Z1NO?=
 =?utf-8?B?anpqdjNTMXNxcU9mQitKZ2JyMTRkcTIxOUd3eXdJZmZUTHBaanpucUEzZzBX?=
 =?utf-8?B?a0I3RFZNNFFmbGswRnNyTmNtYVZyYmpXK0xpZnJ0V0l2ZE5EZVAxd3pvZk5P?=
 =?utf-8?Q?RHE/yv538Og=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzZaa21lT2FYcHNXYmZtRGo3VHVHR3ZXZHlvL2NpSEwvazVaMFNZUjZ5eS9S?=
 =?utf-8?B?WnJETFNUOGJhcitnR3lSeW5SMlhnbXZUbkdXQ2puQkJ3YjdubFl2ZVNzOEtx?=
 =?utf-8?B?dXBPRHVBNGNXdThpdWlkb1RQMjBFeEhXZ29kQ3cwU2RBQ1VObXl5NUtsazhs?=
 =?utf-8?B?bkVuOTg4d00ybEZVaExKenMrcFZkbnNnWDdaNmxnYVZtZS8yY1R4K1VBcHVV?=
 =?utf-8?B?SHZuOVQrOXFuMytKTkx6WWg1VmNpbnpiWmpEL290QlJ3U2U2bCs2UGJmdnJw?=
 =?utf-8?B?V3ZCQ3RmdWUxdkhDWTdlYmk2QjRKdFVWWXM3cE5VZ3ZEb0ZxSHlIaDJCMlBq?=
 =?utf-8?B?YlFVOGVEUnZnMk5GcnBBakoxemsyV1AwZ2d1cmdNaUhqazRNV2VIeCs1WWJj?=
 =?utf-8?B?b2JkbWFXY01GUm83QkRlQ0FSVGlpU3NSTTlYdHo1RGhLUEpRTHpHeVkzRDRh?=
 =?utf-8?B?aHhYTGFaOUJPeWtId2ZybUZndVNWOStXRm9zMndMNXlCbkNjS0Q4d1dyN3FD?=
 =?utf-8?B?YzRYWFNVOUhPZWJEMFVKQWJmSjJmSjk0Smh2ZTJueUxkV1pyUlJJemFqT3ov?=
 =?utf-8?B?bVRJTHBQaGE3b0VteElDeDFwMHZJcGxNeHQxUXJESXc1R3k5NVd5aGxVeWti?=
 =?utf-8?B?cVhxM1FzRXVqNEJlYU5QZWJoZ1dmb1ZrRitjV1ZBdnBDY2xEa3YyNCtJeU44?=
 =?utf-8?B?WGI4VHNlODdENVVpSEo5TzducU9qVytUY0gxL2VHRFEwcldvR0xoc0E2bVRK?=
 =?utf-8?B?dzVIZWpXM3ZwWTR4RktmbDBRbmFOVE5JQ2xMNkdKWU5Pb3M3bjVrbzRLZUhv?=
 =?utf-8?B?ZytlVndRMW1VeW10TnhIaU0xMFg1dThITzdHR1FGbW1FZUQzenpzcDZTTkoy?=
 =?utf-8?B?MlRPSStLWDNDQ3E2TnQ2cStQTTNCZm5iTWdOSWF4Z0czWTVkQS9GRWxQYnhH?=
 =?utf-8?B?TGN2aDNETDQ0Y0czWmdBUm1YbFBzZ2N4Rm4vblRheVc4T0xjN2JDVHdmV3lR?=
 =?utf-8?B?cGNtU1NMQUZBRHBvTGdPcnN1Z1NlcUVNclNjV291YjNZMHdVa0pKOENLY25C?=
 =?utf-8?B?M29pSXhnQXduSXp6OGlxR2MrZDE5cXpaVnRBZERZbkUrOElldDY1UkQrR0Vu?=
 =?utf-8?B?dlAwOHZFRVg3Nnh2c3ZqLzF3Y2xlcTJxRlpmNW5LaERiTmpEbENIZCtKNmdu?=
 =?utf-8?B?QXVlWDQ5SmZGZkNEcm9YTGNKa0N1a2V1S2VjTWlhQllwRXcvK0JWQk9PcnR4?=
 =?utf-8?B?VnVyd3hEN2pPRjdSbW1HNUl6M0VFRlFHVE9ocW5Pb0NGc3dQaGxYWHhZQVYy?=
 =?utf-8?B?eStCL0JURjFJZDdEZ0NaM2ZaUTN0VDhKTzlJRnhvcXJYV3lLWGVmeURUWE9S?=
 =?utf-8?B?bW80by9jK3JZcTZrcWNKb0IyZGh3SjA4OGxBRm5yUmNrdjRDY1JIWk4vTVBQ?=
 =?utf-8?B?T2RFN2JxbHV0TzQ5by8wdlVsVGt2MG16Y1ZVWXNvRklUVkJkNlcvNVJLTWxP?=
 =?utf-8?B?TUU2ZXN5UEsrUUFzSWViaC9qKytvWmZXM0g1WE5ZNnI5b1pXMUdRQVdVY3Ft?=
 =?utf-8?B?bXJNSThmRmtBQ0R2Ym9ja1BWbTRSSHBnYXhubml0UWU1azFFMEV1U21RbkVI?=
 =?utf-8?B?M05CYWJxMTFKYnNlOWJ6SGx5c2UzY2dqWVpBeFRSM3VEU0ZMZ3ZlNXVhdU1C?=
 =?utf-8?B?emZmNC9IaitXYUtwdHVyL3JIb01TN2tVdEx6c3p4Nm1pRlNOWjVNaGJNVy8v?=
 =?utf-8?B?QXZ1YjM3ZWx6SzJLY2o0elVrajVNcU5ZaEl6L05rMTdhQittUERuQ0JHektX?=
 =?utf-8?B?R2lUVlBqSENkdjd0YWdUV2d4bkl2TytFd2xnQXpLWXZJZ1gwR01tVjBZZTM3?=
 =?utf-8?B?TnhiZTloRGZSb0dRVkJ5ZjhlaENZWndNaWxJQmNCdWFqNys0TFdJWjQxSjI0?=
 =?utf-8?B?OHUyK3lXRFBMdmx4VHh1cndqa0R5U3g4YXJuTHM2bkJoTHFoOVhxcmwvZFlB?=
 =?utf-8?B?dmtDWW1vQjhVeW1zNXprT1duYjNOZWgyNHlrcmJBWWV6aTE0dU5POUFnSWd3?=
 =?utf-8?B?SGdpd0Q2enpEMVBmQklacFNWejU5VkkwWWJmVmcvNGkyWnRwNG1pM2x3elZp?=
 =?utf-8?Q?BrFm9qR1r3b4+6UyjZTIy2NHK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db8f8166-76ad-4622-00e4-08dde70c2963
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 14:55:58.0380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +zlmXVGGmpAt47x1ILxSmz8GsqGqKhxmQIHU1YAkSeoD+UPfphZ+8nwOIKs9BUpZbuScuNl1k7iVyHYzSRoM5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6601
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


On 8/27/2025 11:10 PM, Matthew Brost wrote:
> VF post-migration recovery needs to modify the ring with updated GGTT
> addresses for pending jobs. Save off position in ring in which a job was
> programmed to facilitate.
>
> v4:
>   - s/VF resume/VF post-migration recovery (Tomasz)
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

-Tomasz

> ---
>   drivers/gpu/drm/xe/xe_ring_ops.c        | 23 +++++++++++++++++++----
>   drivers/gpu/drm/xe/xe_sched_job_types.h |  5 +++++
>   2 files changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 5f15360d14bf..4dad28f0614d 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -245,12 +245,14 @@ static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
>   
>   /* for engines that don't require any special HW handling (no EUs, no aux inval, etc) */
>   static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc,
> -				    u64 batch_addr, u32 seqno)
> +				    u64 batch_addr, u32 *head, u32 seqno)
>   {
>   	u32 dw[MAX_JOB_SIZE_DW], i = 0;
>   	u32 ppgtt_flag = get_ppgtt_flag(job);
>   	struct xe_gt *gt = job->q->gt;
>   
> +	*head = lrc->ring.tail;
> +
>   	i = emit_copy_timestamp(lrc, dw, i);
>   
>   	if (job->ring_ops_flush_tlb) {
> @@ -296,7 +298,7 @@ static bool has_aux_ccs(struct xe_device *xe)
>   }
>   
>   static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
> -				   u64 batch_addr, u32 seqno)
> +				   u64 batch_addr, u32 *head, u32 seqno)
>   {
>   	u32 dw[MAX_JOB_SIZE_DW], i = 0;
>   	u32 ppgtt_flag = get_ppgtt_flag(job);
> @@ -304,6 +306,8 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>   	struct xe_device *xe = gt_to_xe(gt);
>   	bool decode = job->q->class == XE_ENGINE_CLASS_VIDEO_DECODE;
>   
> +	*head = lrc->ring.tail;
> +
>   	i = emit_copy_timestamp(lrc, dw, i);
>   
>   	dw[i++] = preparser_disable(true);
> @@ -346,7 +350,8 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>   
>   static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>   					    struct xe_lrc *lrc,
> -					    u64 batch_addr, u32 seqno)
> +					    u64 batch_addr, u32 *head,
> +					    u32 seqno)
>   {
>   	u32 dw[MAX_JOB_SIZE_DW], i = 0;
>   	u32 ppgtt_flag = get_ppgtt_flag(job);
> @@ -355,6 +360,8 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>   	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
>   	u32 mask_flags = 0;
>   
> +	*head = lrc->ring.tail;
> +
>   	i = emit_copy_timestamp(lrc, dw, i);
>   
>   	dw[i++] = preparser_disable(true);
> @@ -396,11 +403,14 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>   }
>   
>   static void emit_migration_job_gen12(struct xe_sched_job *job,
> -				     struct xe_lrc *lrc, u32 seqno)
> +				     struct xe_lrc *lrc, u32 *head,
> +				     u32 seqno)
>   {
>   	u32 saddr = xe_lrc_start_seqno_ggtt_addr(lrc);
>   	u32 dw[MAX_JOB_SIZE_DW], i = 0;
>   
> +	*head = lrc->ring.tail;
> +
>   	i = emit_copy_timestamp(lrc, dw, i);
>   
>   	i = emit_store_imm_ggtt(saddr, seqno, dw, i);
> @@ -434,6 +444,7 @@ static void emit_job_gen12_gsc(struct xe_sched_job *job)
>   
>   	__emit_job_gen12_simple(job, job->q->lrc[0],
>   				job->ptrs[0].batch_addr,
> +				&job->ptrs[0].head,
>   				xe_sched_job_lrc_seqno(job));
>   }
>   
> @@ -443,6 +454,7 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
>   
>   	if (xe_sched_job_is_migration(job->q)) {
>   		emit_migration_job_gen12(job, job->q->lrc[0],
> +					 &job->ptrs[0].head,
>   					 xe_sched_job_lrc_seqno(job));
>   		return;
>   	}
> @@ -450,6 +462,7 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
>   	for (i = 0; i < job->q->width; ++i)
>   		__emit_job_gen12_simple(job, job->q->lrc[i],
>   					job->ptrs[i].batch_addr,
> +					&job->ptrs[i].head,
>   					xe_sched_job_lrc_seqno(job));
>   }
>   
> @@ -461,6 +474,7 @@ static void emit_job_gen12_video(struct xe_sched_job *job)
>   	for (i = 0; i < job->q->width; ++i)
>   		__emit_job_gen12_video(job, job->q->lrc[i],
>   				       job->ptrs[i].batch_addr,
> +				       &job->ptrs[i].head,
>   				       xe_sched_job_lrc_seqno(job));
>   }
>   
> @@ -471,6 +485,7 @@ static void emit_job_gen12_render_compute(struct xe_sched_job *job)
>   	for (i = 0; i < job->q->width; ++i)
>   		__emit_job_gen12_render_compute(job, job->q->lrc[i],
>   						job->ptrs[i].batch_addr,
> +						&job->ptrs[i].head,
>   						xe_sched_job_lrc_seqno(job));
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> index dbf260dded8d..7ce58765a34a 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> @@ -24,6 +24,11 @@ struct xe_job_ptrs {
>   	struct dma_fence_chain *chain_fence;
>   	/** @batch_addr: Batch buffer address. */
>   	u64 batch_addr;
> +	/**
> +	 * @head: The tail pointer of the LRC (so head pointer of job) when the
> +	 * job was submitted
> +	 */
> +	u32 head;
>   };
>   
>   /**
