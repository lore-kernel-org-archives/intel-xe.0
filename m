Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BA3C5DF9D
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 06:33:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E329D10EE29;
	Thu, 27 Aug 2026 06:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LM15eIkD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF5910EE29
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 06:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787812424; x=1819348424;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PtFP44zSlg8HRtF+XhYfjuLb0a8XyMolmlgNgUVUKxw=;
 b=LM15eIkD6jl/0HjugfJjc8JefhmuFSoeDR5KeoXigDPNTw04yFbJSK6q
 +szZbPK5s39IJ8rgCLSsJX6PmJKLLHi6HfDKARQ4Qf0y52xj8GTTwgSpu
 zizc6aZJ/nyFWEJsgk/JG74Ku5sYYMzx9nEWuQx5RWFQE/UMp4IS+tBfq
 r0Z4wj1Hvc1AgNgli4j4fuVf4tCI5ro92UkdKaNMxEuHcCHbfClKhorkD
 +MteX7fPhznQGzk6teX0YBFrGS+H8h8OO0QKEWXbs65NWmsBRo3iAV6ba
 4dJPgpx4yXwt1heIFFP2V8FOR1Vifu6faRAkgSeqlFPd6Cp1KQjGCSil8 w==;
X-CSE-ConnectionGUID: E7CPXleQR7CHEaMBRbQmgQ==
X-CSE-MsgGUID: l76jMlVJQNiAC1wroIZapw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="91991308"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="91991308"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 23:33:44 -0700
X-CSE-ConnectionGUID: Qc3LxE1ZSbeGW+vyB+3qPA==
X-CSE-MsgGUID: cGrZbDiZS7agiCTWnTXVEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="265190187"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 23:33:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 23:33:43 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 23:33:43 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 23:33:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0bg91na4TbahY4nTZ9s1ENA1yspN3KEOG4gqVNx7cHTvFHbud7cjpt0axoWx/9Te0i2q1gmx6Xe9+SoEkjs2wWREdiPC9qc2u5/05Dn4rb+Bs//XdEHZ8PrY3PPW+BmRxgD57VJxY/tpo+uzcuerOyfB+Y2ammwferMKugoidvB3RYFdqBEyPxWuoArzUWSA2QZfiDdjlPtqyeKIAFHPTu/7lEjKn/nDbYzvk0RC3eusd4LFLpMlWJZV622pV671wTm8FdJ+jRJkTHHBJWW7wwaBvY3qcwDd9g+KPZOptDSWntZpK+H6yhQJDt+J046dJRpj4CQ4klEG8/ap3EmIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5K8xaL0nluZPc/xy/KzzYAVJZ8wirP2hD+/6vet0y6s=;
 b=AiFRLko0DPpsYiEUc8It3Pi72Zmh79vdaR0dZFYx7/7O3EaJqXIcW8kJnuHoPXKol0/xR9k61mCJwS3pPE6CmqYMibtGPcUhf78eE+CFyKagYx2erOeNOB1b9vTkAbUwrsXANDQ1nirottRh8IyJjA7D0DVyJKIAG4H13pdsPPzHobsAxlKh5HhvSZv6v6Wp/XXerLvoNP5lAw8dlCz+WQsIAo34qtdtGdfWhugVVYIzIdD/ZXMjzrLTsTYsvwHEZIWK9vWgj1wOLERbQ3GH8Z/AIdM2NSdroFmlOJSc0tl+c9zhYWepUgZ0ZSJF7bK8L7z5L5SOWISH8WgEwF6MWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by IA1PR11MB8803.namprd11.prod.outlook.com (2603:10b6:208:59a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Thu, 27 Aug
 2026 06:33:34 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 06:33:34 +0000
Message-ID: <bc375ac6-35c7-4660-9c59-2b310d45ada3@intel.com>
Date: Thu, 27 Aug 2026 08:33:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe: Introduce xe_wedge
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.brost@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20260825114450.1371821-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260825114450.1371821-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0029.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::19) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|IA1PR11MB8803:EE_
X-MS-Office365-Filtering-Correlation-Id: b9d251ee-a614-449c-1727-08df04051e39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|13003099007|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: tWUEYRHN0CjYm1cjDHxyjQH8Qahur5CVH7QgF5DZWVNDJNSzHf4GiqGZQwd4Eu2scAojW1SvtWTddkC6yFhfVfEeBQLWoffJmUEEnh6QWC7+Q0cCah43YMZ+ESniNwJ8ZbYh/E6SK9nTWdHprCOLk3uNp+zuVTh2qhsNW8bqCLnHybkpqOmIO9hciWHTa8cr1hWliyNVYaxU+MP1keoyOlUM0BEisvN8YU2a6KSMhuOFL96OCEiTOuRopZb9EckJWurgPwf3xUxQLOutUU3Jh/mCq6IQNaKddYVVuKEeXro1pIgYd3pjyP71ik242XIu8Ap6qeKY4zIPgKxL3PgZeBZfivvdVLvWyNYWC08ItfT+vbCb/Uh5PzGgiEo4jq88Q1Rr0mxeV4agk1q78n4EfvgR6BtePqDSnD2MVgwxPZ0bREM1DvEq8iFcdWhjZhoi+6htC6tur/69LE+SYTMtvaQN0m8FxN1z43Z4aqGWS8TeU/kKYiYR6Nd5BKLU8VXJGtqWtf4MmcrVuSVqTyLypRTp65YSS6smNG4heg+LvIChgqdngdbIbyMQgsgZSca8feUKTu77j1s6lkZBdesJ4VAdNVT+GdAe13LxxG+wa/f6fUpfJi1WjOg2zaxjyTEQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(13003099007)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUhVWmFyNEE1eG9yL1ZvUnFFUFc3alNzOVhKUmNqd3M4YUhkWnQ1QkEyT1Y1?=
 =?utf-8?B?eEhvMkd5clR3MjRvZEhBRk9HQUs1KzBKUzd0SWNnNHd4Y09OOFpKZzhRWEdi?=
 =?utf-8?B?SjU1ck9yK29MV2JLdk8zN0plOFdkOGZ2NitrOEtMODd0Q3pRRzY3M2JndWZi?=
 =?utf-8?B?biswcUFpM3pUck0zSUdTckhpWkJVdHZMNzJOVS95QkdUTGlhaXpkMHBZWXJ3?=
 =?utf-8?B?UE5XYXVwU2hiMUhPY2RrQVpJMWpoUlh1UG5FRXVEQ0VmWGdsUjdXMjNPa0ww?=
 =?utf-8?B?NHMwMGpDUzA2UW1ZTWtxVHI5VUZmZ2tqTEVqd0NFTUY5Nmw0ZlorQjBGcXBX?=
 =?utf-8?B?dmJiWUtPWWdQUHJ1anJhUUJMSkd2eGQyRlJVd1A0MFNmamZudmh6Ly9KQ2tm?=
 =?utf-8?B?dCtqNnNqaGFGM0Y2S1ZzTnJPVFdyQ1FXOFdNZUdsc29BZUtBcUp0WFhSYmRE?=
 =?utf-8?B?VGpncXBEWDlCV2JFM29DY3dBL1B3TU41eHlKbWNiaHBGSDJ2VFhSc0cyb1RQ?=
 =?utf-8?B?dHJEVUsvWDRTTmV5S0x3T3BtTDR6M2hwaWxNZHp3b2V1TFlmbHJiQlg2NWlW?=
 =?utf-8?B?SnNrM3A5czRYUy8zeXdXaS9BZ2I0S1krQ1JyT0R0dXA0UTNoUzNUM1V3d3B3?=
 =?utf-8?B?YkJ6eXlidGpYS1FxS29UcXRqT1VGYldxK21tY1IwbzE4eENjNFJudXBIUmZ4?=
 =?utf-8?B?YVdNWmUrUDcwVHZ3SHozUGIrVW9GVHJ6UHBMcm5qd2c2ejgwZzNqaGx6ZFFt?=
 =?utf-8?B?N29EcHdHUE0rNDZtVDdDN2tVTjRRdG9xT0F6amlENGNEdTF4OUM4ZlhXZ3F4?=
 =?utf-8?B?b2xKWXpuU0ZsekF4MlVGNXlsc3J5RnFOcmVYQmpiRk51Qm1hNjgrVVJkOU1h?=
 =?utf-8?B?NFJjYVJNTjlEY3NReTNMbmtJcmtQZmxiNUI1eC9JRERwd3hEZFY4eTVlY21x?=
 =?utf-8?B?V1dRTHpBd3NwUGk5S2FTVUZPb0VjSTBrV1B2RmwvK1JhYnNJaTg4OU56UTlj?=
 =?utf-8?B?bHllRllZTkhJTng4SFhsYnhWQjNJazM4MVZjc0g2bVhjY2w2T09hMm1KaXdk?=
 =?utf-8?B?WEZ6UWNxaGhOeVkrVE1FZDA2VG1OK3RSSWVuazJoNXBwNDdBeWQ3YjdGZkJt?=
 =?utf-8?B?emh5cEpQTmlnenhNZDhVdjg2dU5aUk9BdDFXc0RNZzF5RVcyVXFJdW84YTFK?=
 =?utf-8?B?c0lCZGNuMnloS3d4Y3ZXS24vSTBXS1NiYTN3bXdzdnMxL1RqRWxmSXBPbTQ1?=
 =?utf-8?B?cDVQTHduKzAwSDZOanZhNW9aUGhJMHlTZ1AveVVFRjFYbjRJazJtcnFmYWo3?=
 =?utf-8?B?ekFkV1ZkbDUzdjlHZjJnbkdhUlQxeFpIVm1IS3o2OUFJTjRRUldOajhaNFhJ?=
 =?utf-8?B?WkE0WVVBTFZwMUdURCttVDZ5bEswaFhxNTFkNzJpeHpVUzUvNWFlOFhocTFa?=
 =?utf-8?B?UjRDOVpOK0EzMWJ3a3YrSHpENXlhNmg5SkpoRkk1ejRLUjdyWHpOdnpET2xl?=
 =?utf-8?B?ZlprdndVQlh5ZmNYMHlFdTNVY3ZGcXNYdU05TEt2Zzd4Znc2SW9tQXQzY3Ex?=
 =?utf-8?B?SXNnaTQvK1RZZmV3NkZxaFFKdDlKa0VPa1BXWklKTGtwdzNCU2lCVzA4RHFh?=
 =?utf-8?B?QzNSM0ZXYVNUcjAvNVZEN0ozb1lJQUEyUi9vOHdzYVRwd0xUUmlZT2U4N3ZD?=
 =?utf-8?B?TzJqYmVDcXpwVTN3ZWs3WjREUmVuZjZOY0pBVkFmdk5CcVVxdEg4T3JEZ25k?=
 =?utf-8?B?WlhtR0I0UVRuYld0UTIwOWFFaDNNb3lPSEsxNndYTGZ4V2didXIwcm5HUmh3?=
 =?utf-8?B?RmJNSXROMndEWFphSVZ1eXUvZnBqWmtXUzBpdVlQcXNPSTlnTjVVTTRHZGZm?=
 =?utf-8?B?T1VmZit3VjZKQXduS1Q4QzlUZHR6MmRlNHpJSkd0WVNZU054Uitzc2haRnRC?=
 =?utf-8?B?UUlBYW94N1R4R0Vtdyt6TnMySDRaM0JkemRqUm9rNWN4bGVVZ1BJNGZkak42?=
 =?utf-8?B?ZkEybnZrK3pnQkFBOStML1h3c1p5WkhrUnZCTjJrL0NwVnRGdzlra212Wjl6?=
 =?utf-8?B?MndsRDNYOXhtKzlGWmgzeUdwVjlNd3VOSWNmdGtuQ3hIM1BTS2pMeU5HVmlt?=
 =?utf-8?B?MlQ0MnNuMUUxSktiZ0ZRVlR3NWpRQmRDTzFyZ1EyZzl5YlBxbWY3WkRTdnFW?=
 =?utf-8?B?dUxnV1RTWFMxUTB1eUpKWXo2WFNkWDQwazcwN291ak5ldlRlZFdtVVFMaUJr?=
 =?utf-8?B?WTNsRGRURmhoTTZOZ2hyOFBsbTN4NHNaZnZXVmpIV1pnRmg5aXF4YlR4VnYv?=
 =?utf-8?B?MUI4MW9rdzJnL1U1bmUxdFNXWTNodDMxTXB0aFd6NktFSE9jTE9vQT09?=
X-Exchange-RoutingPolicyChecked: wkMGtu4qmr2TkOvrEFdOgHV4FKm4C/gmBdLxJUmbungOt6tnA2a2l+gDbd780CTD61pt4JWqrLMxLuDcN3cCTQhEwqms04SBOE/u4qdowi3BNzIxgXDFkglmrKVCTjkNemYLXTF3Rlguo1vMwE7l46CvuoUZ0agQ6nrdxafTG7F78Q/Tnp5CT1LGXenlxL+M3RNbOv9BildWH5+/Ys9Bm7KtxeqIG9duu+2B7AWRQSlrD7FCqRvGOdtKxcG22/nwDmj6USU/jfy3qHKprl7IKbCNfJ5RDwYdHWXeSWcc3skIWsVUAYhpd4I8uJj3bzJbo5/wyA0H/26C5txSFEeojQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d251ee-a614-449c-1727-08df04051e39
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 06:33:33.9943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vma/pwCGLEuCABnCkCXj4GiS7oMibjdwQjQnTpoiwXYHI62dKQEYwgS15QQ3bh4ACIJCJz/LlVCBb0XN0zrizw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8803
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


On 8/25/2026 13:42, Raag Jadav wrote:
> Consolidates all wedging implementation into a dedicated xe_wedge
> component. While at it, add a worker to schedule the wedge handling to
> be done async making xe_device_declare_wedged() safe for atomic callers.

Fixes:  drm/xe/mert: Improve handling of MERT CAT errors ?

> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> PS: The original intent was a bug fix, but that's just a matter of opinion.
>
>   Documentation/gpu/xe/xe_device.rst   |   2 +-
>   drivers/gpu/drm/xe/Makefile          |   1 +
>   drivers/gpu/drm/xe/xe_device.c       | 172 +--------------------
>   drivers/gpu/drm/xe/xe_device.h       |  11 +-
>   drivers/gpu/drm/xe/xe_device_types.h |  19 +--
>   drivers/gpu/drm/xe/xe_wedge.c        | 214 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_wedge.h        |  24 +++
>   drivers/gpu/drm/xe/xe_wedge_types.h  |  25 ++++
>   8 files changed, 271 insertions(+), 197 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_wedge.c
>   create mode 100644 drivers/gpu/drm/xe/xe_wedge.h
>   create mode 100644 drivers/gpu/drm/xe/xe_wedge_types.h
>
> diff --git a/Documentation/gpu/xe/xe_device.rst b/Documentation/gpu/xe/xe_device.rst
> index d3a022362ade..8baed81580c9 100644
> --- a/Documentation/gpu/xe/xe_device.rst
> +++ b/Documentation/gpu/xe/xe_device.rst
> @@ -6,7 +6,7 @@
>   Xe Device Wedging
>   ==================
>   
> -.. kernel-doc:: drivers/gpu/drm/xe/xe_device.c
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_wedge.c
>      :doc: Xe Device Wedging
>   
>   ====================
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index adc2de37e768..c739a50b6896 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -152,6 +152,7 @@ xe-y += xe_bb.o \
>   	xe_vsec.o \
>   	xe_wa.o \
>   	xe_wait_user_fence.o \
> +	xe_wedge.o \
>   	xe_wopcm.o
>   
>   xe-$(CONFIG_I2C)	+= xe_i2c.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 74d566693dfd..d3a7034fac01 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -829,10 +829,7 @@ int xe_device_probe_early(struct xe_device *xe)
>   	 */
>   	assert_lmem_ready(xe);
>   
> -	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
> -			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
> -	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u) %s\n",
> -		xe->wedged.mode, xe_wedged_mode_to_string(xe->wedged.mode));
> +	xe_device_wedged_init_early(xe);
>   
>   	err = xe_device_vram_alloc(xe);
>   	if (err)
> @@ -924,14 +921,6 @@ static void detect_preproduction_hw(struct xe_device *xe)
>   	}
>   }
>   
> -static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
> -{
> -	struct xe_device *xe = arg;
> -
> -	if (atomic_read(&xe->wedged.flag))
> -		xe_pm_runtime_put(xe);
> -}
> -
>   #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
>   static int xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
>   {
> @@ -1148,7 +1137,7 @@ int xe_device_probe(struct xe_device *xe)
>   
>   	detect_preproduction_hw(xe);
>   
> -	err = drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
> +	err = xe_device_wedged_init(xe);
>   	if (err)
>   		goto err_unregister_display;
>   
> @@ -1394,163 +1383,6 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
>   	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
>   }
>   
> -/**
> - * DOC: Xe Device Wedging
> - *
> - * Xe driver uses drm device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
> - * When device is in wedged state, every IOCTL will be blocked and GT cannot
> - * be used. The conditions under which the driver declares the device wedged
> - * depend on the wedged mode configuration (see &enum xe_wedged_mode). The
> - * default recovery method for a wedged state is rebind/bus-reset.
> - *
> - * Another recovery method is vendor-specific. Below are the cases that send
> - * ``WEDGED=vendor-specific`` recovery method in drm device wedged uevent.
> - *
> - * Case: Firmware Flash
> - * --------------------
> - *
> - * Identification Hint
> - * +++++++++++++++++++
> - *
> - * ``WEDGED=vendor-specific`` drm device wedged uevent with
> - * :ref:`Runtime Survivability mode <xe-survivability-mode>` is used to notify
> - * admin/userspace consumer about the need for a firmware flash.
> - *
> - * Recovery Procedure
> - * ++++++++++++++++++
> - *
> - * Once ``WEDGED=vendor-specific`` drm device wedged uevent is received, follow
> - * the below steps
> - *
> - * - Check Runtime Survivability mode sysfs.
> - *   If enabled, firmware flash is required to recover the device.
> - *
> - *   /sys/bus/pci/devices/<device>/survivability_mode
> - *
> - * - Admin/userspace consumer can use firmware flashing tools like fwupd to flash
> - *   firmware and restore device to normal operation.
> - */
> -
> -/**
> - * xe_device_set_wedged_method - Set wedged recovery method
> - * @xe: xe device instance
> - * @method: recovery method to set
> - *
> - * Set wedged recovery method to be sent in drm wedged uevent.
> - */
> -void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
> -{
> -	xe->wedged.method = method;
> -}
> -
> -#define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
> -#define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
> -
> -/**
> - * xe_device_declare_wedged - Declare device wedged
> - * @xe: xe device instance
> - *
> - * This is a final state that can only be cleared with the recovery method
> - * specified in the drm wedged uevent. The method can be set using
> - * xe_device_set_wedged_method before declaring the device as wedged. If no method
> - * is set, reprobe (unbind/re-bind) will be sent by default.
> - *
> - * In this state every IOCTL will be blocked so the GT cannot be used.
> - * In general it will be called upon any critical error such as gt reset
> - * failure or guc loading failure. Userspace will be notified of this state
> - * through device wedged uevent.
> - * If xe.wedged module parameter is set to 2, this function will be called
> - * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> - * snapshot capture. In this mode, GT reset won't be attempted so the state of
> - * the issue is preserved for further debugging.
> - */
> -void xe_device_declare_wedged(struct xe_device *xe)
> -{
> -	struct xe_gt *gt;
> -	u8 id;
> -
> -	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
> -		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
> -		return;
> -	}
> -
> -	if (!atomic_xchg(&xe->wedged.flag, 1)) {
> -		xe->needs_flr_on_fini = true;
> -		xe_pm_runtime_get_noresume(xe);
> -
> -		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
> -		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
> -			    "For recovery procedure, refer to %s\n"
> -			    "Please file a _new_ bug report at %s\n",
> -			    WEDGED_URL, XE_BUG_URL);
> -	}
> -
> -	for_each_gt(gt, xe, id)
> -		xe_gt_declare_wedged(gt);
> -
> -	if (xe_device_wedged(xe)) {
> -		/*
> -		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> -		 * hangs, so wedge the device with 'none' recovery method and have
> -		 * it available to the user for debugging.
> -		 */
> -		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> -			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
> -		/* If no wedge recovery method is set, use default */
> -		else if (!xe->wedged.method)
> -			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> -						    DRM_WEDGE_RECOVERY_BUS_RESET);
> -
> -		/* Notify userspace of wedged device */
> -		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> -	}
> -}
> -
> -/**
> - * xe_device_validate_wedged_mode - Check if given mode is supported
> - * @xe: the &xe_device
> - * @mode: requested mode to validate
> - *
> - * Check whether the provided wedged mode is supported.
> - *
> - * Return: 0 if mode is supported, error code otherwise.
> - */
> -int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
> -{
> -	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> -		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
> -		return -EINVAL;
> -	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET && (IS_SRIOV_VF(xe) ||
> -		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
> -		drm_dbg(&xe->drm, "wedged_mode: (%u) %s mode is not supported for %s\n",
> -			mode, xe_wedged_mode_to_string(mode),
> -			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> -		return -EPERM;
> -	}
> -
> -	return 0;
> -}
> -
> -/**
> - * xe_wedged_mode_to_string - Convert enum value to string.
> - * @mode: the &xe_wedged_mode to convert
> - *
> - * Returns: wedged mode as a user friendly string.
> - */
> -const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode)
> -{
> -	switch (mode) {
> -	case XE_WEDGED_MODE_NEVER:
> -		return "never";
> -	case XE_WEDGED_MODE_UPON_CRITICAL_ERROR:
> -		return "upon-critical-error";
> -	case XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET:
> -		return "upon-any-hang-no-reset";
> -	default:
> -		return "<invalid>";
> -	}
> -}
> -
>   /**
>    * xe_device_asid_to_vm() - Find VM from ASID
>    * @xe: the &xe_device
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 6c4cfaebc44a..c984972bd0f8 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -11,6 +11,7 @@
>   #include "xe_device_types.h"
>   #include "xe_gt_types.h"
>   #include "xe_sriov.h"
> +#include "xe_wedge.h"
>   
>   struct xe_vm;
>   
> @@ -207,11 +208,6 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
>   void xe_device_td_flush(struct xe_device *xe);
>   void xe_device_l2_flush(struct xe_device *xe);
>   
> -static inline bool xe_device_wedged(struct xe_device *xe)
> -{
> -	return atomic_read(&xe->wedged.flag);
> -}
> -
>   #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
>   static inline bool xe_debug_page_size_supported(struct xe_device *xe)
>   {
> @@ -260,11 +256,6 @@ static inline bool xe_debug_page_size_mode_is_mixed(struct xe_device *xe)
>   }
>   #endif
>   
> -void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
> -void xe_device_declare_wedged(struct xe_device *xe);
> -int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
> -const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode);
> -
>   struct xe_file *xe_file_get(struct xe_file *xef);
>   void xe_file_put(struct xe_file *xef);
>   
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 180d450a6deb..f307d7e5e6b6 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -30,6 +30,7 @@
>   #include "xe_sysctrl_types.h"
>   #include "xe_tile_types.h"
>   #include "xe_validation.h"
> +#include "xe_wedge_types.h"
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>   #define TEST_VM_OPS_ERROR
> @@ -45,22 +46,6 @@ struct xe_pxp;
>   struct xe_ttm_stolen_mgr;
>   struct xe_vram_region;
>   
> -/**
> - * enum xe_wedged_mode - possible wedged modes
> - * @XE_WEDGED_MODE_NEVER: Device will never be declared wedged.
> - * @XE_WEDGED_MODE_UPON_CRITICAL_ERROR: Device will be declared wedged only
> - *	when critical error occurs like GT reset failure or firmware failure.
> - *	This is the default mode.
> - * @XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET: Device will be declared wedged on
> - *	any hang. In this mode, engine resets are disabled to avoid automatic
> - *	recovery attempts. This mode is primarily intended for debugging hangs.
> - */
> -enum xe_wedged_mode {
> -	XE_WEDGED_MODE_NEVER = 0,
> -	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
> -	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
> -};
> -
>   #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
>   /**
>    * enum xe_page_size_alloc_ctrl_mode - User BO page-size allocation control modes
> @@ -534,6 +519,8 @@ struct xe_device {
>   		unsigned long method;
>   		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
>   		bool inconsistent_reset;
> +		/** @wedged.work: Worker for wedge handling to be done async */

nit: "Worker for wedge handling" seems sufficient

> +		struct work_struct work;
>   	} wedged;
>   
>   	/** @devres_group: devres group */
> diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
> new file mode 100644
> index 000000000000..52d4661a2dee
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_wedge.c
> @@ -0,0 +1,214 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
> +
> +#include "xe_defaults.h"
> +#include "xe_device_types.h"
> +#include "xe_gt.h"
> +#include "xe_log.h"
> +#include "xe_module.h"
> +#include "xe_pm.h"
> +#include "xe_printk.h"
> +#include "xe_wedge.h"
> +
> +/**
> + * DOC: Xe Device Wedging
> + *
> + * Xe driver uses drm device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
> + * When device is in wedged state, every IOCTL will be blocked and GT cannot
> + * be used. The conditions under which the driver declares the device wedged
> + * depend on the wedged mode configuration (see &enum xe_wedged_mode). The
> + * default recovery method for a wedged state is rebind/bus-reset.
> + *
> + * Another recovery method is vendor-specific. Below are the cases that send
> + * ``WEDGED=vendor-specific`` recovery method in drm device wedged uevent.
> + *
> + * Case: Firmware Flash
> + * --------------------
> + *
> + * Identification Hint
> + * +++++++++++++++++++
> + *
> + * ``WEDGED=vendor-specific`` drm device wedged uevent with
> + * :ref:`Runtime Survivability mode <xe-survivability-mode>` is used to notify
> + * admin/userspace consumer about the need for a firmware flash.
> + *
> + * Recovery Procedure
> + * ++++++++++++++++++
> + *
> + * Once ``WEDGED=vendor-specific`` drm device wedged uevent is received, follow
> + * the below steps
> + *
> + * - Check Runtime Survivability mode sysfs.
> + *   If enabled, firmware flash is required to recover the device.
> + *
> + *   /sys/bus/pci/devices/<device>/survivability_mode
> + *
> + * - Admin/userspace consumer can use firmware flashing tools like fwupd to flash
> + *   firmware and restore device to normal operation.
> + */
> +
> +/**
> + * xe_device_set_wedged_method() - Set wedged recovery method
> + * @xe: xe device instance
> + * @method: recovery method to set
> + *
> + * Set wedged recovery method to be sent in drm wedged uevent.
> + */
> +void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
> +{
> +	xe->wedged.method = method;
> +}
> +
> +/**
> + * xe_device_wedged() - Check for wedged device
> + * @xe: xe device instance
> + *
> + * Returns: %true if device is wedged, %false otherwise.
> + */
> +bool xe_device_wedged(struct xe_device *xe)
> +{
> +	return atomic_read(&xe->wedged.flag);
> +}
> +
> +#define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
> +#define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
> +
> +static void wedged_work(struct work_struct *work)
> +{
> +	struct xe_device *xe = container_of(work, struct xe_device, wedged.work);
> +	struct xe_gt *gt;
> +	u8 id;
> +
> +	for_each_gt(gt, xe, id)
> +		xe_gt_declare_wedged(gt);
> +
> +	/*
> +	 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> +	 * hangs, so wedge the device with 'none' recovery method and have
> +	 * it available to the user for debugging.
> +	 */
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
> +	/* If no wedge recovery method is set, use default */
> +	else if (!xe->wedged.method)
> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> +					    DRM_WEDGE_RECOVERY_BUS_RESET);
> +
> +	/* Notify userspace of wedged device */
> +	drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> +}
> +
> +/**
> + * xe_device_declare_wedged - Declare device wedged

xe_device_declare_wedged()

> + * @xe: xe device instance
> + *
> + * This is a final state that can only be cleared with the recovery method
> + * specified in the drm wedged uevent. The method can be set using
> + * xe_device_set_wedged_method before declaring the device as wedged. If no method
> + * is set, reprobe (unbind/re-bind) will be sent by default.
> + *
> + * In this state every IOCTL will be blocked so the GT cannot be used.
> + * In general it will be called upon any critical error such as gt reset
> + * failure or guc loading failure. Userspace will be notified of this state
> + * through device wedged uevent.
> + * If xe.wedged module parameter is set to 2, this function will be called
> + * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> + * snapshot capture. In this mode, GT reset won't be attempted so the state of
> + * the issue is preserved for further debugging.
> + */
> +void xe_device_declare_wedged(struct xe_device *xe)
> +{
> +	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
> +		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
> +		return;
> +	}
> +
> +	if (!atomic_xchg(&xe->wedged.flag, 1)) {
> +		xe->needs_flr_on_fini = true;
> +		xe_pm_runtime_get_noresume(xe);
> +
> +		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
> +		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
> +			    "For recovery procedure, refer to %s\n"
> +			    "Please file a _new_ bug report at %s\n",
> +			    WEDGED_URL, XE_BUG_URL);
> +
> +		schedule_work(&xe->wedged.work);
> +	}
> +}
> +
> +/**
> + * xe_device_validate_wedged_mode - Check if given mode is supported
> + * @xe: the &xe_device
> + * @mode: requested mode to validate
> + *
> + * Check whether the provided wedged mode is supported.
> + *
> + * Return: 0 if mode is supported, error code otherwise.
> + */
> +int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
> +{
> +	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> +		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
> +		return -EINVAL;
> +	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET && (IS_SRIOV_VF(xe) ||
> +		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
> +		drm_dbg(&xe->drm, "wedged_mode: (%u) %s mode is not supported for %s\n",
> +			mode, xe_wedged_mode_to_string(mode),
> +			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> +		return -EPERM;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_wedged_mode_to_string - Convert enum value to string.
> + * @mode: the &xe_wedged_mode to convert
> + *
> + * Returns: wedged mode as a user friendly string.
> + */
> +const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode)
> +{
> +	switch (mode) {
> +	case XE_WEDGED_MODE_NEVER:
> +		return "never";
> +	case XE_WEDGED_MODE_UPON_CRITICAL_ERROR:
> +		return "upon-critical-error";
> +	case XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET:
> +		return "upon-any-hang-no-reset";
> +	default:
> +		return "<invalid>";
> +	}
> +}
> +
> +void xe_device_wedged_init_early(struct xe_device *xe)
> +{
> +	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
> +			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
> +	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u) %s\n",
> +		xe->wedged.mode, xe_wedged_mode_to_string(xe->wedged.mode));
> +}
> +
> +static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	disable_work_sync(&xe->wedged.work);
> +
> +	if (atomic_read(&xe->wedged.flag))
> +		xe_pm_runtime_put(xe);
> +}
> +
> +int xe_device_wedged_init(struct xe_device *xe)
> +{
> +	INIT_WORK(&xe->wedged.work, wedged_work);
> +
> +	return drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_wedge.h b/drivers/gpu/drm/xe/xe_wedge.h
> new file mode 100644
> index 000000000000..fedb30c99398
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_wedge.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_WEDGE_H_
> +#define _XE_WEDGE_H_
> +
> +#include <linux/atomic.h>

not needed

> +#include <linux/types.h>
> +
> +#include "xe_wedge_types.h"
> +
> +struct xe_device;
> +
> +void xe_device_wedged_init_early(struct xe_device *xe);
> +int xe_device_wedged_init(struct xe_device *xe);
> +void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
> +void xe_device_declare_wedged(struct xe_device *xe);
> +bool xe_device_wedged(struct xe_device *xe);
> +int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
> +const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode);

I agree about naming convention. I was already thinking about something 
like this:
xe_wedge_init_early()
xe_wedge_init()
xe_wedge_set_recovery_method()
xe_device_declare_wedged() / xe_device_wedge()
xe_device_wedged() / xe_device_is_wedged()
xe_wedge_validate_mode()
xe_wedge_mode_to_string


Also, wedged_mode_set logic from xe_debugfs.c could be wrapped into 
xe_wedge_set_mode() in xe_wedge.c.

> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_wedge_types.h b/drivers/gpu/drm/xe/xe_wedge_types.h
> new file mode 100644
> index 000000000000..ffe7f9c64166
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_wedge_types.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_WEDGE_TYPES_H_
> +#define _XE_WEDGE_TYPES_H_
> +
> +/**
> + * enum xe_wedged_mode - possible wedged modes
> + * @XE_WEDGED_MODE_NEVER: Device will never be declared wedged.
> + * @XE_WEDGED_MODE_UPON_CRITICAL_ERROR: Device will be declared wedged only
> + *	when critical error occurs like GT reset failure or firmware failure.
> + *	This is the default mode.
> + * @XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET: Device will be declared wedged on
> + *	any hang. In this mode, engine resets are disabled to avoid automatic
> + *	recovery attempts. This mode is primarily intended for debugging hangs.
> + */
> +enum xe_wedged_mode {
> +	XE_WEDGED_MODE_NEVER = 0,
> +	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
> +	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
> +};
> +

Let's move the wedge struct here: struct xe_wedge {}.

Lukasz


> +#endif
