Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDD2FF885A
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 15:42:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009EE10E3C5;
	Mon,  4 May 2026 15:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bZ0tgaDI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D3B10E3C5
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 15:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777909348; x=1809445348;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=hrLsXtgF+mwMlQSwpNVrLzvxnBGrisvghxnYlzh/aQw=;
 b=bZ0tgaDIsKVp6r6aCUlDxaBvOflYnpudRZGUBCqYD5EFJI5yvNBk4gBs
 MwDcHjo9AIIbyQcK4fUyAzKYVWKrksCEJ/kxelPyslgtiROeSBMk+K6Db
 X+7ZzTKX2YekukeCYoTmXYaywVdp+v3unmpKo6dDT+BdSwp0QMGtTC7XQ
 JhsMHo31HlBRjQneEK0HYwPuhaTiz1DTXiKORPk7if+U3f0k9iQv7VvVd
 1YmxN+txC9dtDZHisE6zMlwNFTRKeCtrPQdIVW6TPpz1ay0EfHpcy6WyQ
 1VcnRxHuNpqKOr7iuHRKpoBG891UBqlvUPSMzvm/puuuxvxI0ocPHFJKm A==;
X-CSE-ConnectionGUID: uuVG8Ow/R0G1Vp2nIsjMBA==
X-CSE-MsgGUID: Zf8dsPjqQcS3l+Ye7MogmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78816904"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="78816904"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 08:42:27 -0700
X-CSE-ConnectionGUID: huNzIMQURBaCQ2yymXCnww==
X-CSE-MsgGUID: FrZ9XC/DQq6PKs6oOO78pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="229061172"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 08:42:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 08:42:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 08:42:26 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 08:42:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/8vHbiERQ+6UnHWZPCfuXKpSjRfZHh9pfMsDknVPLphtCm8EGz278noA4XkPWeMn2SXjo2fBPrNQ82+IA98l2JYXMl9pc4hm1/XclKeutTFPICbp5LI9xX0KyzOt9lsJXSdh8AcywCi631/5M522NROkCZgoOOFS26a27gy6StRQmqiF4imbQsGir6l2dgjlmqmy0/qDrw48BzRmta7jqKv7WxaCi62M+jPrZwKS/MlQvuMoyG2q0hwYdIA8/JEiKDvf7Fsk7vBp9PpPqm3w6ia8tG9FocUyBH45wUiOjHmUeey5oke5DLMgMpwIfQ2Y0XStGY3gdCMHNDGtG1NQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4V8xc9x+YlQ0S6Mw6dZEmRwpw+hmmoRxazokj/5l+2Y=;
 b=jmW4zPL8ItV2WToFNvbcuDk9UmAMtpX3RO6J5BPWXHb84bgyUxRKjKcY5NYU6dtpjn9K/eZT8lPIAJJwwcvQDdJ1MaFuyj+wn8E9gz7lbbO7bn71edupTxhY+z8nymIDMed5ROSfZGUVUFY2QHWfXahzEIsUJCI11yFHky0Jektx2D+5rKQ3Xzjw0t1a2CPfmtBsiSt4OxXmM/AdXo5Tcc3EKX+R2et5TLKwZ5v6kbNHh8hfWPa3QK0ikzlalNu8VAcQYBXZG7mOy+NmRDH3OFgHtSD2V/mJGLyqPaPgQ2S4RNCK+klJBk6WBgpx7DeK1B77L0T1VhOvahUQNG4BxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA1PR11MB9658.namprd11.prod.outlook.com (2603:10b6:806:4dd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 15:42:24 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 15:42:23 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <Michal.Wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <daniele.ceraolospurio@intel.com>, <shuicheng.lin@intel.com>, Stuart Summers
 <stuart.summers@intel.com>
Subject: Re: [PATCH 4/9] drm/xe: Add a new debug focused configfs group
In-Reply-To: <20260504044348.209625-5-stuart.summers@intel.com>
References: <20260504044348.209625-1-stuart.summers@intel.com>
 <20260504044348.209625-5-stuart.summers@intel.com>
Date: Mon, 4 May 2026 12:42:19 -0300
Message-ID: <875x53dvvo.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR05CA0165.namprd05.prod.outlook.com
 (2603:10b6:a03:339::20) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA1PR11MB9658:EE_
X-MS-Office365-Filtering-Correlation-Id: 4afc272d-1210-4ea9-51d8-08dea9f3bc5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: FTIMn7ZM/Q8nve2evQbFKOHtL9J4vEjWLLBZ4r50cFCMJ6/XkBRXhek+sEpgUU9QnT1j2KPOpnXSbJd8emKuwXePYdC7kgfTIkS8DQc4KGeeQ4M9VTGu7LXrbQgFbJKbgZbw6eC/u6z7XDCKAjp1p9kHiHXhORsyZ6Y/eKMz0SN2+mkia4waJ4Dc3hT9MUHEeWn32+vHDHj5q7Jk7KB4R1w2vdZT68kVvY+5jG1JOQwVHq2UuG0QpQZKEEQ8qSSPSbclK9mvufe5mYfBaQ8VVumLVKOyeSQsc9+K54Cx5BHh+7B9hR88AWdsuaix8avXnFCYdPvVdDVOcIltGNMaCi3MBoq8klg1oOWUGcYoAtv746ff9LCZQgh2ODMp8MdQonOjUhNBBMFPxpOam0I0T2cXgKYG1SzlxstaV/dYgohr678pIXI+hW4XDuN4eeGR/AIfFlu6bpgcdAwsQ1ELpo3uEz5S6DbM7Bo2VmKdFp5jLN4ZktdTosAWaTI/MbpLH2kR8zxRSQPFkALwUgY+0/tKbLSbpFsQPkNyUTVQCHlXFKn/Uc98PY21PC235Mh07hjaHTOG2q+jv9qV4ixa4Cmsq4PUmB8HrK2VI2AlccOYudTHk/40wLVHcZw3kd8OrUjOvupNnemcywlcH79xZ9Fi1cKDw9uto+V2CA7aJ6z2MAONVQLkU2oUQdiEsLgL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXk4MXM4SUIyVE12amZtQWJsWklST1BxTURNYzJiMzY5T3Mva1JJaVkyUDBy?=
 =?utf-8?B?YStZWENvclJDRTVCK3ZnZ2RTTEZtV1JkaGNkRkNlemgxYlZacVBXS0ltbDBQ?=
 =?utf-8?B?RHcza0t1NFdOeVA0eVFPbjJkTGFxc0ovOHFKYjB3cWpDa09BRk5sZUlYc0I2?=
 =?utf-8?B?dDQ3dDZWeEJEOFB2cVN1QUVGM0ZTY2VuNm4xUTZKc3BDclJGcXpXWmREQTQ4?=
 =?utf-8?B?VWdxdCs3Zm5tZ2dCQ1l6OXZRb3YwQkVsY2puOU1aSXhZZnp0TTBWOUtCTVpk?=
 =?utf-8?B?RW9SN250a3U2UWNNM01FTnE4Zi9WaXp3cEQ2STdZR3hoMDF4aHltZC9aS09k?=
 =?utf-8?B?OVk0T3FOOHQ5QUhwek5xZ2o4bUJOSUJnclEzZUQ5elE5cFpsZkdBZ1lhdDFI?=
 =?utf-8?B?M3pWc2VvdGJTSTd5eUJZVEJuK0U4TXVndHowdG96TnRSZnpXdjJZUmlRNkRw?=
 =?utf-8?B?TUNBWlQ5N0gwcER3dERtSWVYbXRDWWJQODlCYW1WbDgrUzhMbDRiTWQxQ2M3?=
 =?utf-8?B?ZXhkakRLZ1RPS1VLQng0cVpwV0tiMm5maUdXdDlabGpIbkFtQW9XaHdTWnEy?=
 =?utf-8?B?aUh2TmUyaE9qK3BWbEM2YTRUSmhOckh1OGx0bURlclEveGM0MUF2R1RlR0g4?=
 =?utf-8?B?VitKbUJkNjdFMTgzUm9sRS95cmhRek1idkNjZzRSZEIvN2JCNGRkMWhES0RJ?=
 =?utf-8?B?K3ZQRWhKV0o1RHBKemFVbHF3cUJLeFBpeW9WWDMxSjlOMWJ3UGhQc3hscmUv?=
 =?utf-8?B?bjMyeWVUYVZtZUNqNFgrOHl2N3ExSUFSc0FneVQybmkyUG1hUW9uUEdnd0ZN?=
 =?utf-8?B?T28ySXQ5L1JhUzlKQzkrclBscEQvWDB5cENGeWlsV3E3QkdPWjZKdGF5bHVR?=
 =?utf-8?B?UnMzUGNTK1UvYWxQdXptRlhHK095L0hnWnIrd2NrMUN0ZnNJalZkQTFvYUJD?=
 =?utf-8?B?T3lzR3ZOY3plMi9TVnBoTlRtc3NPMWt5R3RDREY0ZWpuWlJrbVVBTWJHb0N5?=
 =?utf-8?B?VDhUbVhqTUlSV3hSYWR3VEo2QkxnbEFBNGhRckRoNzVGYVNaZGdRWmxWK2Fr?=
 =?utf-8?B?UVJqYUJaWlNpYTJyNTBlV2JzRGVFNnZqc0x6OHpNM1FsNHFuMU80aVF2L0JL?=
 =?utf-8?B?eWR5MlZta0RPSGFXVHBUaEo1WEw4dGxCemRlUnoxZFY1cFFXQmVaVkZnYTZs?=
 =?utf-8?B?UHFBckNrdW51MkVCMXBDKzR1VUY1MENuTSs1NlI5U2w0OXNGcVM1UWN0TVM1?=
 =?utf-8?B?QkczN1pWaUhIalFTbm9hYytYTEpsSG5Da3VwVU9kemNJdnlJNXJlTGg4Z3F4?=
 =?utf-8?B?N0lyVzZiWXd6S1lXMlp4VlFubFhyREk2eVlXYVhKTHhHY1BWQWV5MkdUUWJn?=
 =?utf-8?B?RldERUV0UHBhdUtSdGNZZmRXMHd5aktmTGJkRGVBcDNjMXNWZ0E1N3NQZDUx?=
 =?utf-8?B?STNDRjVyM1ZkNFdXbW0xc01ZR2NudkxlQUNqV0VIV0hBbVNQTjVkMEkwN25q?=
 =?utf-8?B?U2piOGYvRGZhSDMybmdmQjNyQnJDZGZMQjByNmJsa1ZYQXQybFoyMlhDdk1X?=
 =?utf-8?B?enVOTWJYUm1ZS0JNOFZOMUZIc3NFbHRsNFNjMU1UM2ZwODJ6ak9vTUMrRGFN?=
 =?utf-8?B?U3FlSXFFVVhldFBJM2VKWFJvakE2b0RLb2hEQ09jbjladE5JaDhQSmt2NGt3?=
 =?utf-8?B?U0xhc0ZkeTR0bkxaYncwckc1N0tkY0xkaTFJdXV3YkdYZnhHOUEzMmtKUnJW?=
 =?utf-8?B?ZDhWNzk3SmViU09GSE9rMzNxNUFLTDNOYVJRc0swdnYxVENMMHVLSVVKcHZt?=
 =?utf-8?B?bzVnN1Z4dTd4NzhmSFYzL1I5dlBPZXY0MGJXUlRER044WGsxVlNuUUJWYUd5?=
 =?utf-8?B?OFZjMEJhY0JyeG9KY2JSb3ZLQ3A5cFo0bVl2cFZDaG56cUhaTGhLS2VKcnl1?=
 =?utf-8?B?RUJPaVRvek9XNHF1WE9HU2JVeTZ3SUkwVW1HMUl5eWFVdjR4QWM1MGlYMkpo?=
 =?utf-8?B?RFZRSG1lQXNNREZOOHNKd0krdVlEWjUwcWQycVBQejVKV0w3V3duNFd6bk1V?=
 =?utf-8?B?UVZkdnBvNXJLRVlQam16c1N0WEIzU3VubXEvNTJBN2dPRUF3cGQvSE92Q3Fi?=
 =?utf-8?B?WHAwWUkxN205Q0dUMVNDQ2VLeUZTMkI2NGFvcittUnJPVis3bkZiekFnMXEw?=
 =?utf-8?B?QnpoeGk1dUFQdlp3NVdlSGc3VjVpQjlSVjlHZkcxbVFTOXQ3YXNRR2p2dnha?=
 =?utf-8?B?ZkJFeVJRcERhUmN6Nko5S0s5TFU2L1Vic0Q1N3BESElyWWN1d0tXUHp4NXYz?=
 =?utf-8?B?dklvQ00rcXpua2tYNW5KWERvUGE4M3lxOUU3Q1h3dG1ISzF0eFN2UT09?=
X-Exchange-RoutingPolicyChecked: CRJe5zqVK35TZ2He44sj3JV6sZ+Vy3lQE04csMmJqExWYo9alMmJBUFXWRYfZapi5/u2dvry8eBaqU098uxsB1QpLKoYPRQwwGZYVaSwUtCQn5o1Bt+EY6WNVgiJ/8NeTMMI3+6T/LMdy26mnCU0XXTFvhZ3U6cEIYD2ucLcb7+Livm+ia3u+6cvGFw5XljaOP8wtlqHbzhpE5oGjs8MUvRe2fZA1IVMBC8HLAIQBJWgAKYLRK6tXkU7kU1iLhQHOrcC21ndqdmSnxiAmL+WBNKfcW2LaJNTnGUUYllMhN9r3StO8mOFyxHDlbfxdD8396sKhMfghvfRqDZKMwARUg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4afc272d-1210-4ea9-51d8-08dea9f3bc5c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 15:42:23.7719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XE0dVYu+63HzFo0kibvtKdDhuanKM6mhis+fWoun6P/wAPZ5sS6VIdUUm8at2oScfN1qonvqysi5h8hOxdsPDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9658
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

Stuart Summers <stuart.summers@intel.com> writes:

> Add the skeleton code for a new debug specific configfs group.
>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Assisted-by: Copilot:claude-opus-4.7
> ---
>  drivers/gpu/drm/xe/Makefile            |  2 ++
>  drivers/gpu/drm/xe/xe_configfs.c       |  4 ++++
>  drivers/gpu/drm/xe/xe_configfs_debug.c | 14 ++++++++++++++
>  drivers/gpu/drm/xe/xe_configfs_debug.h |  8 ++++++++
>  drivers/gpu/drm/xe/xe_configfs_types.h |  7 +++++++
>  5 files changed, 35 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.c
>  create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 09661f079d03..b58667b0b18e 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -161,6 +161,8 @@ xe-$(CONFIG_HWMON) +=3D xe_hwmon.o
> =20
>  xe-$(CONFIG_PERF_EVENTS) +=3D xe_pmu.o
>  xe-$(CONFIG_CONFIGFS_FS) +=3D xe_configfs.o
> +xe_debug_configfs_obj-$(CONFIG_DRM_XE_DEBUG) :=3D xe_configfs_debug.o
> +xe-$(CONFIG_CONFIGFS_FS) +=3D $(xe_debug_configfs_obj-y)

What are the downsides of keeping this available for non-debug builds?

I imagine that the debug configfs could be useful for someone not
involved in kernel development working together with the developers to
debug issues without needing to rebuild their kernel.

> =20
>  # graphics virtualization (SR-IOV) support
>  xe-y +=3D \
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_con=
figfs.c
> index 12b7fe65446d..85df8ce5cf2a 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -1006,6 +1006,10 @@ static struct config_group *xe_config_make_device_=
group(struct config_group *gro
>  		config_group_init_type_name(&dev->sriov, "sriov", &xe_config_sriov_typ=
e);
>  		configfs_add_default_group(&dev->sriov, &dev->group);
>  	}
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +	config_group_init_type_name(&dev->debug, "debug", &xe_configfs_debug_ty=
pe);
> +	configfs_add_default_group(&dev->debug, &dev->group);
> +#endif

I guess there isn't much we can do about it today, but, based on what I
read in configfs documentation a while ago, I suspect it wasn't really
designed with arbitrary hierarchies of config items in mind.  It would
be nice if there was an API for that though.

Basically, a config group is expected to be a directory to contain a set
of config items of the same type, which is not the case on our current
usage (i.e. the "sriov" and now the "debug" group).

I guess we are able to get our desired behavior (basically just a
subdirectory behaving as a config item) by not implementing the
"make_item" hook.  Not sure if that's an expected use of the API or if
that's more of a hack on our side and could come back to bite us in the
future.

--
Gustavo Sousa

> =20
>  	mutex_init(&dev->lock);
> =20
> diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c b/drivers/gpu/drm/xe/=
xe_configfs_debug.c
> new file mode 100644
> index 000000000000..45617282cec5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_configfs_debug.c
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +#include <linux/configfs.h>
> +#include <linux/module.h>
> +
> +#include "xe_configfs_debug.h"
> +#include "xe_configfs_types.h"
> +
> +const struct config_item_type xe_configfs_debug_type =3D {
> +	.ct_owner	=3D THIS_MODULE,
> +};
> diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.h b/drivers/gpu/drm/xe/=
xe_configfs_debug.h
> new file mode 100644
> index 000000000000..01170dc2f97e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_configfs_debug.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +#ifndef _XE_CONFIGFS_DEBUG_H_
> +#define _XE_CONFIGFS_DEBUG_H_
> +
> +#endif /* _XE_CONFIGFS_DEBUG_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h b/drivers/gpu/drm/xe/=
xe_configfs_types.h
> index 935097aafa96..c9d94a3c26a7 100644
> --- a/drivers/gpu/drm/xe/xe_configfs_types.h
> +++ b/drivers/gpu/drm/xe/xe_configfs_types.h
> @@ -24,6 +24,9 @@ struct wa_bb {
>  struct xe_config_group_device {
>  	struct config_group group;
>  	struct config_group sriov;
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +	struct config_group debug;
> +#endif
> =20
>  	struct xe_config_device {
>  		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
> @@ -56,4 +59,8 @@ static inline struct xe_config_device *xe_configfs_to_d=
evice(struct config_item
>  	return &xe_configfs_to_group_device(item)->config;
>  }
> =20
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +extern const struct config_item_type xe_configfs_debug_type;
> +#endif
> +
>  #endif /* _XE_CONFIGFS_TYPES_H_ */
> --=20
> 2.43.0
