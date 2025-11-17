Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0282CEBF61
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 14:27:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E9310E3BC;
	Mon, 17 Nov 2025 14:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hJ5eml3D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF64B10E3C8
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 14:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763389676; x=1794925676;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rRIPV02TkjGOnQrKgyyurdXOau+y+MsK8R42l+K/Wfc=;
 b=hJ5eml3DcKYsStNWY83OxIXsSD5Rl01m08GlmvaXoB1ROVFXZFcWTUrW
 MZds6ZJ4/lDnVKAINdQ4TxVLfndRC6OatGDyXOFY8BvIvUEV17kYCpGC+
 GuWH9YR7cXDDufwNTFRUHCsRQbJTWNAwbtX5gFrSnFQRXmDQc1svlv3Lm
 TWuYgrduEhOEuxl5/1WFZEHKsM4pqRqZT0c9a6hJQArL1KRH8ZAD/773a
 IfKL2/aXc+0AZfy6F8rN4W1ZVnC0/LGe/lwJv6K5zAh/hatBNPHE15GeC
 +/L/+bBR0NnWqBjU08THlQEX+jgoLOzCXwolGOitUGQWHLZ5TKnNqkdom g==;
X-CSE-ConnectionGUID: p3cQI5HSRe+WKPG3ZcgRaw==
X-CSE-MsgGUID: 26tJcYz5S0a4DyoyO8IN5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="67995774"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="67995774"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 06:27:56 -0800
X-CSE-ConnectionGUID: PChsG/MISHGr3MQ5Rvxa9w==
X-CSE-MsgGUID: TTEuzc5iRBGlH8tW5n0LTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="190480475"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 06:27:57 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 06:27:55 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 06:27:55 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 06:27:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iSKO/ZS+6/dspjoX6wnvoHI+/cMXRJg2HnmqU0aye0Z9ortHGpc9l4UESyWiwDLWrawTgQSyAeiF3nHmydWrjNXdKT+bIJXYUJTDlJoSb4grGuBnpwFSYdmK6iL0KPpbEvjycYfye+sfe3sKHv4248G9XZsiONGA1MAVYSBujuFDgBHUNgVzQgDzYLnekTciOFuhVeZD8MqKl6Zd7O1nS7JsfCr2qowzsfvDdQqsw110UrnupertiK+JFcu7JpqQfMBFYXW6QtxaFPUoxNgonLAm/21Amj3T4TZMIZiEeggtAuDt0KPtfa7Nd6ocMB4rz5D4ZuJgkgQj1MgCnKUb4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2na0YKmK/ixhlQGFjDR6rYsTry8WCoNU4DJzLm1dIOI=;
 b=IE/VzmPT+/SBbQ6HYe4crZvkYs9AAA24kuC3pip8uRvWn4u4xzl7e7bnWD4iSad/lip2HNQ0yifuaZbLXFgW+IgeFqDFFWJEZpnYqm9/5Nb/TL9tUV0/a3kvFnEOaHtmEHtIY75T5bI8z5DWbeBrv8Rj/eoyNCgHs7/+IQbGCOVqPIjDnanXJqeUr1vtp0Wtopo0s46ja0lTdPof4H8kMEVAZfGrI3XoO9fy9s6dao52F7J1ErGghFt0IR0lePy9AxDmlqKV7Ekrq0TZc954UzIoJNFJ37KY4VOh1JrZ96gi9ZPIoka3CxEJGcg2G8eSQV/YCpW9Fpl4lnYcC03Odg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA3PR11MB8023.namprd11.prod.outlook.com (2603:10b6:806:2ff::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 14:27:54 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9320.018; Mon, 17 Nov 2025
 14:27:53 +0000
Date: Mon, 17 Nov 2025 15:27:51 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Use div_u64 when calculating GGTT profile
Message-ID: <20251117142751.oivv7jy4x4rjyntu@intel.com>
References: <20251115151323.10828-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251115151323.10828-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BE1P281CA0201.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:89::7) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA3PR11MB8023:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e46c3e9-029f-4ef7-6fca-08de25e57ebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3lDcjRTeTBVQ2RLdyt3aGdSYVY0VHljQksvZW5pYVpabkx4WVpxKzB2WlF3?=
 =?utf-8?B?YzlEaEVkOFZpL1ZDdGs5TFBZUnZXeFo0ZWgyMS9PSHR3ekRpOG9yVzV3dk81?=
 =?utf-8?B?Tkltd2o4Z3lvZnc1RkhDVVN5TlhBMWRTUG81cXJOU01sK2ltbEEvY3VaMXF2?=
 =?utf-8?B?ZGFhOUVPZitBVHh3Wkp1UUZ4Vzdld2FpZUR2cDh4MTI1UStTWCtsNHRuenlL?=
 =?utf-8?B?ejB6bUVmbVd3VFhpcjRMR3NHQTdNWGNBQVBSeUhBS2NyeEZuNUpuWnZoN3pV?=
 =?utf-8?B?Vk9kdmlDRCt1S3dLcm5vNVVmU3BlSkpBV1ZtVnFObDV2ZkZ4cWRPRnRNcFIv?=
 =?utf-8?B?Z21xSUgzUG1Ya1FwZmtYTllIdXJuR3J6S2dZWVFFYi8vcFZIZEQxa3VaOFZI?=
 =?utf-8?B?ak92S0ZkYWVWUm5SeGhCYitMTzJlRkQzNkpWcnlQL1cwR0VBV3BsYUFkVzQz?=
 =?utf-8?B?QnBZNzJ3UzlkVnlTNXFlandWejI4aUFKZjhmK2lmSStEaW5hdC9KeGhkZjFW?=
 =?utf-8?B?YXR6Vy9zR1FGL1Y1WktVS0RsTzh1VXFWMHRTbkE0dWtJTHQvOFd1UENSK1NF?=
 =?utf-8?B?UndiTWRzOUFrdVhkekllbGZNYjhkV241Q29XOHBRVjBJTmRjeG5PV05sU0xX?=
 =?utf-8?B?Y2xIeXhFREtGQUdyTzV0K0FkSEZWdU1iKzNyQWFhdWJMWjJsSnFucG03WEJ1?=
 =?utf-8?B?QXpibmo5eFNReHBNa1h6bkhOeW9pNENWTFh1cXV3d04xZjgvU0NrV1prUXFh?=
 =?utf-8?B?T1BsUk5GdTVoWTY5aHNreDRFb3AzaXViN3RGMHJRelR6MEdMbmphUTJmeXQv?=
 =?utf-8?B?eFFpNnppQkxLaGpYajBVY0g5RHB5WnVYTUM3a0l6b3F1SUlHVXJnUWJUWE9O?=
 =?utf-8?B?UzBiSldHVXI3Z0RPb3d4aGdpT3RsbUVVM0tVeGIrYXNiRURNczhIeHY4S0Q3?=
 =?utf-8?B?Y3VxcGpHYXBXbFNGbWVnQVFXLzArZksvdWV3TDFYaFhYaGZZOWs5RmVQL2Nw?=
 =?utf-8?B?V2lCWnh1Q1ZoK2FOYUpPT2F6aFpJTnpqVDR6T1FKb0ZnUjNLUXpEd1lia1R3?=
 =?utf-8?B?UC8wS2ZERWxlOW54SDBNZWhWaWFxL1dGODQveEVZQTkyQm41NGR6NldtekRt?=
 =?utf-8?B?NWt3VWRjc0ZoVjZzNVVNWG5Gd29UZTdKd0lXb3VwR3pkNjMrcVFCY3B3cU5Z?=
 =?utf-8?B?YnZzdGZQaUQ0Sllld3VvYkwwTEVtY2RlclpMbVAwaXlIN0Qwd1JCU0dqZzBm?=
 =?utf-8?B?QjZ4UmFLK2orQVZ3MDNaWk4wdnhCMHFMOWh3ZWR4VkZxb1ZMK2VHc3lzNEMv?=
 =?utf-8?B?d3VZRnBuUk1pQ1QrQ0tiV3JXNURkOWpZUytDK01yQlhOdGorM20vcXRuNjVJ?=
 =?utf-8?B?WDhma0Z4SlN6L0U1eGx0amFmNXEvV3RLdDVrRDU0L21Lb2VHV3JiNVY2dWNC?=
 =?utf-8?B?b1ROT3c4L1A5akFGR1duaGZZMnVlUXkvL2ZpdEZsS1VXdjl3MmV5OGdGVDJi?=
 =?utf-8?B?MVh6cmg3eFJTVk9rNjF4TkJJU3lyYWdvY0lOeXFGQVNobXhLWTNwZmVrZEl5?=
 =?utf-8?B?cWRFcWo4Z1hBR0RBY0Z5dnFYSDViM0FRZUVqUzFadm1lTERtUEswWVVpa3FW?=
 =?utf-8?B?Tit2MER4QXRROHN3ZzRLTktlN3RqVG9hY0xVZUJMdS9NQ050aXozV1QxY2lV?=
 =?utf-8?B?RW1MSmdGWFlRbEViZzVyR3NKdVFSL3MwcUJ5RGtJeHQ0WWFWTytOS2orMmxw?=
 =?utf-8?B?djZFSXpVWFdmalVJUVlDeXlqcmNQbG1iREFJSjNqS2Zpb1FqQmg0VzNMelM2?=
 =?utf-8?B?V1Ezcmd4RXlzZk5qOC80bGJuM25GOS9wdkdHb0hjQnpSVDU5ajgyMFZlOGxl?=
 =?utf-8?B?di9vNGNPaHJPcHNMUktKN0dDamRMRVVieW9RWnFyZFVlbTJRMklBR2RQRUwx?=
 =?utf-8?B?bm90cVJLMVd4ektYQ1EzVXl1dURaWU1ud2pWQlpaVWkyMW5oVkdaczRLMGc5?=
 =?utf-8?B?dFBvN0JqQlJBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXgvaytjTjg1WkhHM1FUbnJJMGk1dDV6dTFQSk9XT3AzUFd0RmpDQmE5OWMw?=
 =?utf-8?B?S1Y3bWJLODdsYktxWDV5VGFmcTU1R1BUekIvUW1jN0ZFTXRJbkxyWUgzaW9h?=
 =?utf-8?B?NHdNYUwwVVhxR1dib2lWcEpPT3ZFempPYU1hZDFlcTJVeHI5N1lYOUQ1clRa?=
 =?utf-8?B?QVluQXJiUmhJMC9JUlRuMGV5eUZualN6ME9RUGRTUENjVDNjcGZZRjlnQVN5?=
 =?utf-8?B?RUJOdlpjSkpJQzMvQU9JUC9DMkx5R2JaRElweUFxWnBPMERVMHB3dTByM29Q?=
 =?utf-8?B?N0pENmhIbUJGelVBc1JOb3NBVHZ4cnZra2ZtNXVXMHNBYk91dXhQeG82RmVE?=
 =?utf-8?B?emM3MmIrdG8weThaL2F1YWFuQzlFSW5YeHRUdjJFNVlpUGNxYXpESDJVWmI5?=
 =?utf-8?B?anRKUGdMZ1VGcUNPSXlGLzRTcnVadUV2TUl1Rm1EcDM4cndWa0NpbWNHL1FE?=
 =?utf-8?B?WXZuZTRLZGhSTEVIK0tURlhGbFNiZjZ6em0vSWJkMVZmV20vWEJCQ080cC9p?=
 =?utf-8?B?d2xHYUpnalRHNUN3aHdIZWdpZEtuOUhBYzNid1czNWE5M3VMcHRrY0dSWmZr?=
 =?utf-8?B?a1h4QzNheVdBVzNMT2lqVEJoTnhENGJwUEhNeHdZQTQwd1VLcklyWUN5STlY?=
 =?utf-8?B?Tnh6aGRrWWxiZTJXUkltOHpKcXkydVlZb2RQL0NkZVN3SE5IV1ZnWDhrVVR6?=
 =?utf-8?B?RGVsRXRJSUhLNDNpVDFhMCtZMDg3N044ZnN2U2QwTjZBQ0ttWENPUWJoYmoy?=
 =?utf-8?B?SC9icXlLc3gzTFJJemE1YVhyWkZvVnprNWNlZVBIbDgrMndzbTBzb0ErYzA0?=
 =?utf-8?B?T0RHZHlEaXlJc3NGU3VNa0pmdTR5emx4eU1GSng3dUpFUWFTQ0s1dlFMS1Zu?=
 =?utf-8?B?Uk9CcUxONXZMVjkzUlBMdnM3MlJybHp5ckxMZit4UXRDai9Ea3EwTExLTW1H?=
 =?utf-8?B?SGtJbThvSXowMG9xWTVDbEFzWG4xVXFiL2FHWVl3enAxcSt5NFRFRkYwaVg3?=
 =?utf-8?B?SGlMRVNlbHgvNFh5WUVhMUVWMzlHUXJmK29lWEZFVXVTaHdhUFJ2WS9CRlhH?=
 =?utf-8?B?d1dZWG9vcENzMjFpZUcxRmZUMFlWUG5KemZnMmJTWklicXF6c25ra2llU0VY?=
 =?utf-8?B?ZE9YNDZCZlgwZlY3OWV2KzIyZkNjcnFCWXhoZlM2SjJJdkJIU0FCaXJxL080?=
 =?utf-8?B?TCs3VU9pTHp6cWcrMVhlL0FJYWpLdGlUUS9LNUgxMlYzT2Ntd3QwVExidyt0?=
 =?utf-8?B?cm8wcTMzVS93RUZuamFkaE9Ka2EzSkpCRFVNY21iaFdDQi9iZlBSY3ladUtl?=
 =?utf-8?B?VWk0QUQvVW9PSmFzbWpmdmlKSWp6eVMvN1pRcDFXZFpscUh4U0RBc3ZtcjJH?=
 =?utf-8?B?anF2dlpER28yQVhmUmhocmVYak1CN3FtbzlWOC9kTG15aHJ2dWRJYjljSDMr?=
 =?utf-8?B?Z1Z2cHZ0QXlmMGRubXBpckhmUVIzYVBIbnEzL1BBSVF1UXZZQnNxem9tM3dG?=
 =?utf-8?B?RzJYa2U0V2VGU0piWVBlclQ1TjJTaDdBSjhHeGRWdVRhODNyY0IwWEpCcWRu?=
 =?utf-8?B?YkV1Nzg3K1A4Q2hwa1FBbWdKdHpZQUludnhPeFVaQ2JqOTdFTGNiYzVZWGVw?=
 =?utf-8?B?WWs4UUtyWktpV1J4R3QzemlPSi9Od2RSbHNnTlVkY2cxZUVDNkQ4VjJkdTFZ?=
 =?utf-8?B?a0dBWmlNZGVDaDVoaHpOOXIvcnY0UGEyUFZPdm44VnZjMEdJNGcwbnRmZkcz?=
 =?utf-8?B?ZlJISm1XWHFrczJ4eEYxclYzWUZuQ0RkTFRNekdpYkVmbFBXcVMrNlROSzl4?=
 =?utf-8?B?eXhORTBXaVF3c2lxMGYvV1VsMHEva000ekZOQUxGQXRWTU5pemR3ajdNRlZv?=
 =?utf-8?B?WHhJWlRpSXd2WGgxYkFVUDFndTRJK201bzloZ2lFWENKUHJ2cWZ1QXlYUDRZ?=
 =?utf-8?B?YTNkTXpUOVE4WVVUQWRhRHdFYXlmaVorWGs1YXdscG1rOXBsNmI2Unk1a21T?=
 =?utf-8?B?SlNjWTBSRFpLN04zK0x0VG9LU2k4YTFxK3N0UzgrcHNySFE3Qnd6QWlVL0ZZ?=
 =?utf-8?B?SU9KYWorckhTc2ttRnZSTEdoZTRjYWg0czlFTHgrOWlSd2pCbldwVEw4Mk1k?=
 =?utf-8?B?YmVRUnVDZy9hakE1S1VCOWRqczQ0T09xWDROZUV6d3lKNHhXbVFKSS9uNVl1?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e46c3e9-029f-4ef7-6fca-08de25e57ebd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 14:27:53.8467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RU+RaMjfqm2QsQlF8Ys+kut18wOzNErdjdGRFV53o9X8wCB9GfWraV3+7NhLwHbhfKWTqNfPDNr8K9asuWqdu56dfosaI6ruB2gyfo1qsnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8023
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on sob [2025-lis-15 16:13:22 +0100]:
> This will fix the following error seen on some 32-bit config:
> 
> "ERROR: modpost: "__udivdi3" [drivers/gpu/drm/xe/xe.ko] undefined!"
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202511150929.3vUi6PEJ-lkp@intel.com/
> Fixes: e448372e8a8e ("drm/xe/pf: Use migration-friendly GGTT auto-provisioning")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 62f6cc45a764..59c5c6b4d994 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -711,7 +711,7 @@ static u64 pf_profile_fair_ggtt(struct xe_gt *gt, unsigned int num_vfs)
>  	if (num_vfs > 56)
>  		return SZ_64M - SZ_8M;
>  
> -	return rounddown_pow_of_two(shareable / num_vfs);
> +	return rounddown_pow_of_two(div_u64(shareable, num_vfs));
>  }
>  
>  /**
> -- 
> 2.47.1
> 

-- 
