Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E59DC5AC82
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 06:04:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003EF10E156;
	Mon, 10 Aug 2026 06:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EnGc4EKE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF24C10E156
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Aug 2026 06:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786341848; x=1817877848;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=gKUV+MtRoOftm903vmyygvMyKJB6QARB4h2vQAigesg=;
 b=EnGc4EKERXlOu0JfOR+XlH858IcLc2YB3q8LQK7ac+avED4vKofNY9XV
 998HAWc5+RFA81lKDcNQGKZJRB/hkyJ/ymuhRa7DMCGGju586fU4YyP8h
 +TPGi07R8FOjddsf+P020VyHwn3//tgby0avGqwd4cBfIQNv24uHA13C1
 Bfy3TJSYEJoooOsf1zs02lpHG7hMxVOxj5oAk2HU5MIpMNYvGLSjsndUs
 Rtc4aef0TEaFmzECkbDcezfH165G8r3BhlybO0QuALyKZnu0SmmL1Kv0l
 mUJrFvxpjMDrCDUlaxEHtUNSy7Q/7p2/sGNG9rJa3Tg4X8cHrEeQtXYLp g==;
X-CSE-ConnectionGUID: qGJK4JIoQKag89C+LZaLPA==
X-CSE-MsgGUID: LbP69OxnQlmyeFSJF8dikg==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="104240846"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
 d="scan'208,217";a="104240846"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2026 23:04:02 -0700
X-CSE-ConnectionGUID: 8lX8y3lkTmOj2Qn8vDf9Kg==
X-CSE-MsgGUID: EAQa9G9LSwmEof27ja4WzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
 d="scan'208,217";a="261206535"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2026 23:03:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 9 Aug 2026 23:03:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 9 Aug 2026 23:03:55 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 9 Aug 2026 23:03:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IvEYzevroC+p8fpR4kb4mUeMYLf1m6YZeGdFRvd1/HHueWI0XeHilTC8FBUzK1EdXQA5w0E5onrOySrNvukUsc6xq082Lyioz2hQ95YlBS/UpCgB53n1n0oCqoxZrIens0ugiB33K7VBT6zd+So/00gBpXnXeS8oyz5da+qE70c5bkfA3cw8VUKHjZ4ILVF/Z1yF7ZC89KEkXLDZyPK1beDA1SI5ClWtjaV8DOY/XB7kRiDQouKNWodypAfiZ4ZCJtIuC0sQ7yfhsYzCbona3PW82Z6V1ZRoQrDpRY8DYC1COHZgotZzrJM+jaRhW+qbFTSZL1yRMMqVqUdV71UZ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAvrMduKp8RKYRP/KGE40fHNvWZMqO1gHHO+yeb/Pls=;
 b=MXVcIp+o2D0iaNx1gJNeZ7ev3pm4/6w+pFFdhQLlx4eTPhtyouHsvlZEKc5nAFbc6tG0u7RRf6gofx5q0t2NWJK1Id0JWcUCooWhSjQ42nUAcAeqtHRaJvvoncedrSaX/dUjhBYwp+0i7Erl8y3UAEQAeI/peULMdCrI2snTbJq/dUn90wsn5C2m9QhBA7T1dftXyxJtupJygjY0GColbwalLQbLW9HNg5679f/BKA/qw7mRsnGJ9zXwFrjCUFSmxelVmfBmi4W+dHj1QnR61erB2XTDuod2GIVrZc+IgaOOWz0gpibM9uGEQWiVIeHHzeTVJhYY0miW/kQtOHm+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by CH3PR11MB8495.namprd11.prod.outlook.com (2603:10b6:610:1bd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 06:03:51 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 06:03:51 +0000
Content-Type: multipart/alternative;
 boundary="------------Xqk50FMhAW2gFetXVsQJFORv"
Message-ID: <9277b78f-94a9-4b88-aa27-13b7d42fc223@intel.com>
Date: Mon, 10 Aug 2026 11:33:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] drm/xe/hwmon: initialize fan-control backend and
 table cache
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>, <sk.anirban@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
 <20260717041757.2759084-3-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260717041757.2759084-3-karthik.poosa@intel.com>
X-ClientProxiedBy: MA5P287CA0179.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::11) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|CH3PR11MB8495:EE_
X-MS-Office365-Filtering-Correlation-Id: d26cde56-a972-4e11-4bfc-08def6a526f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|8096899003|4143699003|11063799006|56012099006|10067099003|3023799007|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: /QphobdfDmNtcpo8QjRH/pJt87cbMF4od3qHUpOFPTRkEW0xi19ktvlGEARCREd7+c03wzSgu2AL0n4RvQmRaiYHXqWUdqeaRZyb3Np/fB051pNiI2vS3m3QYOBLLjXov5eUGkBQnNLsd2SdYefmK2ZGACzdisM8R8ozzJcSdmK2HXgulS4iHAprHxxeLsPSztPDCgAt8yT4kk2hgydov3h3VseTXbi17tNLHhnjXJ+kLWBEmxzNTQ1Z6ty/vX7UYZxy0ypcx0tG3Rb4w4X6+VbDS8q0/w/ucY3rOBNPDWr93ysgY5uN/8hKeEVSP8UqfyG66iHoccDqZovyVG2vC5zzPiCuM+92Raf+DFHyqD3g2mOWSQMeUU4rsRPWK1if50Cia/Svq8RSWHoDkbSiO08iLkIkI5bzTRHCRR586UuELHgfBVC+gZX68EXB0bwFEliLRKEl2K37bMu/AE8+lhYnYIL64YGkaLZzKsBaf1amKraUPnc/tAmeNf2VLnJX/PPJvMNrUjDac+T2GCG2fDE/dglgm6OEm45iqyJ55l14/BD1qdVSo72ewTRT1XM2Arp4WczF5MB8cqxDzz2KXwwq3vbCajNTKYBBXO68PpMzDOHQyMBjWOHvzbqxkNiC/kjg44xzuK6swozxMSVqm+UBLec3jnG/LFzGH8DkoNA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(8096899003)(4143699003)(11063799006)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlVhUVlHamFtcU5YOWw3ejhpVndFVGs4KzlwS29sendueTNicmYwd3Q0M3VY?=
 =?utf-8?B?dWkrd2xVL2trbFk3S0lNdnZRMDhxaS9FQVRZMkRFaUxhVkpGRjlwUWlUM3Mr?=
 =?utf-8?B?cTFDb3RGWDl0aDlTVHUxUmRBMTNMRHAyZ212WkNaS2R0ajZFbEFaMkJEWWV3?=
 =?utf-8?B?ZW4zODZjMFpQaXZaMm1rSVFRU1hDdWZldC8wQldKSHkvUVVVMUgyb3ZzVXo0?=
 =?utf-8?B?QitkY0RDZENxL2R4NDhmZkZYcHlhV29xbzdldHhHQmRLUEJ1YXh2TEtNempy?=
 =?utf-8?B?VEZhb0F4VGc5NVVENnB5b0g5YTVEbE1LUWUwWm5MS1ZCVWtWSVJWYm5vVUVL?=
 =?utf-8?B?aGErdHlOaGtSNDhSQkJGaUVYTUwzbEkwZnFKL2V5VzNoV0hJVFhSTXUrMmpQ?=
 =?utf-8?B?dFdrVjJzUFNSVll3SEpuR2puZWV6NkRxSTRzZzZNcmltNXIyMUZ6S3Y3b0xF?=
 =?utf-8?B?LytweUJPRkc4bytIeG1aZEFYSzltb0Y0VjE1NWxqTzQ0cUMzSHNrRjhvWHVJ?=
 =?utf-8?B?K0s0dHh5ak8vRnFmRlIxRWpsUENGTXFuVVBwaVhpZEw0WVdFejVQeGdkNXNi?=
 =?utf-8?B?Ry9ybW93M2EvYXNJSkJSdkdGS0pEcVZDTjBxQWZuMEF5blhOWkE3dGk4WjU2?=
 =?utf-8?B?dXkrc01LK0ppTlRnbTFVd05xZVhvOXZXeDhqS2VIVFE1aGdaSjQ5NW1LSlg2?=
 =?utf-8?B?eFR4TmFiVXdQejVQNnZhcldaS25TVWRhTDZBb2J2YWMyWG9ZWXVXaVNlaGp2?=
 =?utf-8?B?SVJ2MkI2MUJjemVXbXFZekU4TmJkK1NRMU9wUjl1RjRNRGJ6RVVMczduL2ZC?=
 =?utf-8?B?MkIzQVlxWGtHY1hSTzZIU3BwY2xHTjhESHNIQlpKdW12OFJJOUxZTUd1Q0hD?=
 =?utf-8?B?L0NzcUtVcnVtMmo2SEYreXBpZFhnVVIxcjlmYm5hQzN4K3dWOGRFUFdTS2tW?=
 =?utf-8?B?YUlXYUVUaktyRUVKREFTRDJSbExuN3B0Sk03YkF5TXJ2eFM1UTJrQWd3dWtm?=
 =?utf-8?B?Q1AxSXJJa0J2RHgxbS9lSGorUHhNVDVTbmV2MldTSUxOdW5xS0ZCY3h6Q1Yy?=
 =?utf-8?B?NlNLKzBOYlJPcFhJZWhQQS91N2dzTXZqbnpWM3dVMThEM203R3hVdmpOWDd6?=
 =?utf-8?B?bFdaZGdTYTRwTWxLSFFwbmhsZCtpaXhuS0J5NFl1MFhrOEp2Q29hSW5WZjBy?=
 =?utf-8?B?aUM1REV2clkrQVJzZ0ViUXJ5a0NMWlcvRjRDRmVYbEVBa2FxcGVOazlhY0Nm?=
 =?utf-8?B?THBSZC9ZQ2V3VTQyYldRM1NNZnNZNzlpUVdGWjZWN2gyMzlYMlFqNFd5NW1Y?=
 =?utf-8?B?aFJVMjhLQ2tNV3hmcUVETk9aS2FCSCtBejBaRms4bTFKVlFIdG5PenVianVh?=
 =?utf-8?B?cVdTRDZPWHJkY2VTYXJPYXdhclZKU1QwelBYMnZnZEpKL1hTZHdaSDF2c0c4?=
 =?utf-8?B?eDRDLzNHL0IxN2lsVkw0Q2FFenpzVDJCU21DbzBRUzZZQlNaM3VzUEhnb2pu?=
 =?utf-8?B?ZkFsMUJ5ejB4R2pYcU5NN1F0UU0yZ3R2NWQ5aEVpV0U3QVJWcURia2xVYmFl?=
 =?utf-8?B?cDY0N0REYmZCWDR1TzhWSDZmQkFmRzN4ZTI2ZlRrM3FIY1N6TlF4cVdSMjdw?=
 =?utf-8?B?K0ZPVm1saEVzMFVmWXB4WDlRQ2NFNWxTVkNMa0h1YWNnbXFjdCtyQkNXMFN5?=
 =?utf-8?B?bjZQMFFpVUpnck95ejhqWGlmalVYcGV3VVdhUmtqUXByRnBxbWNTSG9oYkRV?=
 =?utf-8?B?ZTBnbVIycjZ2Rk5BWUNkaXZzbnlGUWh0dzV0NUNtREhvaThmekpvdFN0MzNJ?=
 =?utf-8?B?M005eVgwamtIbWlac2JvZms5Wi9qSUJzaW5NcFI5Wk5lNW43ZC9TZmVFR1cv?=
 =?utf-8?B?cUFGQTRuelJZSlVFVUs2K3drdVZPVWk0S3U1UG80TlNlWXVtUnRxelRSMXVi?=
 =?utf-8?B?UEVMRkNxUkJlaFdpMTY4aVNxMmN6Y1RQZ2EyOFRoQ1I1VWhuUjZldnJnbWVT?=
 =?utf-8?B?ZGtCaG9sMERFalhHT05rV0xQMXFpcERTK2VVVGY2a25uMVBIa3pOSE1JeFRv?=
 =?utf-8?B?TFprWjZMRzA2bnFsTlF3a2gxQnlxa2h4b0VNTzBWODFNUGpEMDhvR0xDc3B3?=
 =?utf-8?B?endRaXdxNjlzUU9hN05KZnc4dEpDM0poc1k1RzVSY1ZkYTlRaDZLa21FK0Vx?=
 =?utf-8?B?WGVsNTZNc21ueEZZOS9WQUZMTjB4QzZ3dnNtaGJEVS85NFNEOGFWSHFOTlJE?=
 =?utf-8?B?SGZSUDFIVExOYkUzVG9KN1Fud1hxWDkvMTNHcGJiQkF5eE5wQXJzQ1JRdmhF?=
 =?utf-8?B?RGMxUno3c3ZEUjhxaktJSVhpY21UcWVlVlQ1S05BTy9lZmM2cWI3UT09?=
X-Exchange-RoutingPolicyChecked: eb43TVv1gINKAln/6AityFuOy7O5IHQ9VrAStf1mUiKDgqwXPQ3DZBjREPNzzyIpr7JHZvh6fJZ2A98vI/COPKU/2znc1pq/c4UbvzAY0MuN0V9ZyQcMRefgcWIli9AsGa10R16OFY1VUU7uYbCM+GVVxOxNJMOTKSiq4vIM1nXhkYEFg8yhOPyceJHz/CBDiJqv1EltT3c6O7In/IzVSgojMLQKiVuigs2u8QnYZCWLB6vvXocUvs2ArE2xk0wGnHXh1QgHFbI+2kyPAfPwiseeA4+xwBxBiVoy4JX6naiFdroOSSq63DQtGGKRSQ0TcM8YF/2ghmL+c2qXbSFPzg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d26cde56-a972-4e11-4bfc-08def6a526f9
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 06:03:51.7792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qc/qCsCLHeuZ6PPZUs1BiufoJPyqrCA9yOY8YmFSUoPXr0ObL9YrMGctimiv4byQF+GI/+AgdoZoe/TSHW0jEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8495
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

--------------Xqk50FMhAW2gFetXVsQJFORv
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 17-07-2026 09:47, Karthik Poosa wrote:
> Initialize Xe hwmon fan-control support by detecting fan count,
> reading stock fan control points and min PWM.
>
> v2:
>   - Avoid user table initialization during probe. (Badal)
>   - Move unused code to appropriate patches.
>   - Use xe helpers for dmesg logs.
>
> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
> Assisted-by: Codex:gpt-5-4
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c     | 159 +++++++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_pcode_api.h |   5 +
>   2 files changed, 149 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index de3f2aeffc3f..0a416e3e7b8c 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -20,6 +20,7 @@
>   #include "xe_pcode_api.h"
>   #include "xe_sriov.h"
>   #include "xe_pm.h"
> +#include "xe_printk.h"
>   #include "xe_vsec.h"
>   #include "regs/xe_pmt.h"
>   
> @@ -122,14 +123,50 @@ struct xe_hwmon_energy_info {
>   	long accum_energy;
>   };
>   
> +enum fan_table_type {
> +	/** @STOCK_FAN_TABLE: firmware-provided fan table */
> +	STOCK_FAN_TABLE,
> +	/** @USER_FAN_TABLE: user fan table written through sysfs */
> +	USER_FAN_TABLE,
> +	/** @FAN_TABLE_MAX: number of fan table slots tracked per fan */
> +	FAN_TABLE_MAX,
> +};
> +
> +/* Maximum number of fan control points supported by each fan */
> +#define MAX_FAN_CONTROL_POINTS	(10)
> +
> +/* Fan control point index: bit31 selects fan table type; bits30:0 control point index */
> +#define FCP_INDEX(FAN_TABLE_TYPE, POINT_NUM) (((FAN_TABLE_TYPE) << 31) | \
> +						((POINT_NUM) & REG_GENMASK(30, 0)))
> +
> +/* PCODE operations timeout for fan control commands */
> +#define XE_PCODE_FAN_CONTROL_TIMEOUT_MS	(10)
> +
>   /**
> - * struct xe_hwmon_fan_info - to cache previous fan reading
> + * struct xe_hwmon_fan_info - cached fan telemetry and control state
> + *
> + * Each fan keeps the latest tachometer sampling state along with two fan
> + * tables: the stock table discovered from firmware and the user table managed
> + * by hwmon sysfs writes.
>    */
>   struct xe_hwmon_fan_info {
>   	/** @reg_val_prev: previous fan reg val */
>   	u32 reg_val_prev;
>   	/** @time_prev: previous timestamp */
>   	u64 time_prev;
> +	/** @fan_table: fan control tables */
> +	struct fan_table {
> +		/** @fan_control_point_count: number of supported fan control points */
> +		u8 fan_control_point_count;
> +		struct fan_control_point {
> +			/** @temp: temperature in degree celsius */
> +			u8 temp;
> +			/** @speed: fan speed in percentage */
> +			u8 speed;
> +		} fcp[MAX_FAN_CONTROL_POINTS];
> +	} fan_table[FAN_TABLE_MAX];
> +	/** @min_pwm: minimum fan PWM */
> +	u32 min_pwm;
>   };
>   
>   /**
> @@ -168,6 +205,8 @@ struct xe_hwmon {
>   	int scl_shift_time;
>   	/** @ei: Energy info for energyN_input */
>   	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
> +	/** @num_fans: number of fans available */
> +	u8 num_fans;
>   	/** @fi: Fan info for fanN_input */
>   	struct xe_hwmon_fan_info fi[FAN_MAX];
>   	/** @boot_power_limit_read: is boot power limits read */
> @@ -856,17 +895,100 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
>   			      (uval & POWER_SETUP_I1_DATA_MASK));
>   }
>   
> -static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u32 *uval)
> +static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u8 fan_num,
> +					   u32 *uval)
>   {
>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	return xe_pcode_read_timeout(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, fan_num),
> +				     uval, NULL, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
> +}
> +
> +static int xe_hwmon_get_num_fans(const struct xe_hwmon *hwmon, u32 *num_fans)
> +{
> +	u32 fan_mask = 0;
> +	int ret;
>   
>   	/* Platforms that don't return correct value */
> -	if (hwmon->xe->info.platform == XE_DG2 && subcmd == FSC_READ_NUM_FANS) {
> -		*uval = 2;
> +	if (hwmon->xe->info.platform == XE_DG2) {
> +		*num_fans = 2;
>   		return 0;
>   	}
>   
> -	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0), uval, NULL);
> +	ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, 0, &fan_mask);
> +	if (ret) {
> +		xe_warn(hwmon->xe, "failed to read number of fans, ret=%d\n", ret);
> +		return ret;
> +	}
> +
> +	*num_fans = min_t(u32, hweight32(fan_mask), FAN_MAX);
> +
> +	return 0;
> +}
> +
> +static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	int point;
> +	int fan;
> +	int ret;
> +
> +	for (fan = 0; fan < hwmon->num_fans; fan++) {
> +		u32 stock_fcp_count = 0;
> +
> +		struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
> +
> +		ret = xe_hwmon_pcode_read_fan_control(hwmon,
> +						      FSC_READ_STOCK_FAN_CONTROL_POINTS,
> +						      fan, &stock_fcp_count);
> +		if (ret) {
> +			xe_err(hwmon->xe,
> +			       "failed to read fan %d stock control point count, ret=%d\n",
> +			       fan, ret);
> +			return ret;
> +		}
> +		fi->fan_table[STOCK_FAN_TABLE].fan_control_point_count =
> +				min_t(u8, stock_fcp_count, MAX_FAN_CONTROL_POINTS);
> +
> +		xe_dbg(hwmon->xe, "fan %d stock points %u\n", fan,
> +		       fi->fan_table[STOCK_FAN_TABLE].fan_control_point_count);
> +
> +		/* Dump the stock fan control points for debugging purposes. */
> +		for (point = 0; point < fi->fan_table[STOCK_FAN_TABLE].fan_control_point_count;
> +		     point++) {
> +			u32 fcp = 0;
> +
> +			fcp = FCP_INDEX(STOCK_FAN_TABLE, point);
> +			ret = xe_pcode_read_timeout(root_tile,
> +						    PCODE_MBOX(FAN_SPEED_CONTROL,
> +							       FSC_READ_FAN_TABLE, fan),
> +						    &fcp, NULL, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
> +			if (ret) {
> +				xe_err(hwmon->xe, "failed to read fan %d stock point %d, ret=%d\n",
> +				       fan, point, ret);
> +				continue;
> +			}
> +
> +			/* Cache the stock fan control points in local structure for later use. */
> +			fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp =
> +						REG_FIELD_GET(FAN_CONTROL_POINT_TEMP_MASK, fcp);
> +			fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed =
> +						REG_FIELD_GET(FAN_CONTROL_POINT_SPEED_MASK, fcp);
> +			xe_dbg(hwmon->xe, "fan %d stock point %d: temp %u C, speed %u %%\n",
> +			       fan, point, fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp,
> +			       fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed);
> +		}
> +
> +		/* Read minimum fan PWM */
> +		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_MIN_PWM, fan,
> +						      &fi->min_pwm);
> +		if (ret) {
> +			xe_err(hwmon->xe, "failed to read fan %d min PWM, ret=%d\n", fan, ret);
> +			continue;
> +		}
> +
> +		xe_dbg(hwmon->xe, "fan %d min PWM %u\n", fan, fi->min_pwm);
> +	}
> +	return 0;
>   }
>   
>   static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
> @@ -1279,17 +1401,12 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   static umode_t
>   xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   {
> -	u32 uval = 0;
> -
>   	if (!hwmon->xe->info.has_fan_control)
>   		return 0;
>   
>   	switch (attr) {
>   	case hwmon_fan_input:
> -		if (xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, &uval))
> -			return 0;
> -
> -		return channel < uval ? 0444 : 0;
> +		return channel < hwmon->num_fans ? 0444 : 0;
>   	default:
>   		return 0;
>   	}
> @@ -1476,6 +1593,7 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>   	u64 val_sku_unit = 0;
>   	int channel;
>   	struct xe_reg pkg_power_sku_unit;
> +	u32 num_fans = 0;
>   
>   	if (hwmon->xe->info.has_mbx_power_limits) {
>   		/* Check if GPU firmware support mailbox power limits commands. */
> @@ -1531,10 +1649,21 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>   		if (xe_hwmon_is_visible(hwmon, hwmon_energy, hwmon_energy_input, channel))
>   			xe_hwmon_energy_get(hwmon, channel, &energy);
>   
> -	/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
> -	for (channel = 0; channel < FAN_MAX; channel++)
> -		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
> -			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
> +	if (hwmon->xe->info.has_fan_control) {
> +		xe_hwmon_get_num_fans(hwmon, &num_fans);
> +
> +		xe_info(hwmon->xe, "Number of fans detected: %u\n", num_fans);
> +		hwmon->num_fans = num_fans;
> +
> +		/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
> +		for (channel = 0; channel < hwmon->num_fans; channel++)
> +			if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
> +				xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
> +
> +		/* Fan control tables initialization */
> +		if (xe_hwmon_read_fan_control_info(hwmon))
> +			xe_warn(hwmon->xe, "Fan control tables are not available\n");

The table appears to be captured before late binding. Do we need 
separate pre-/post-LB tables, or should the table be updated again after 
late binding done?

Thanks,
Badal

> +	}
>   
>   	if (hwmon->xe->info.has_mbx_thermal_info && xe_hwmon_pcode_read_thermal_info(hwmon))
>   		drm_warn(&hwmon->xe->drm, "Thermal mailbox not supported by card firmware\n");
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 94575c476e3d..669010f1e2d0 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -85,6 +85,11 @@
>   
>   #define   FAN_SPEED_CONTROL			0x7D
>   #define     FSC_READ_NUM_FANS			0x4
> +#define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
> +#define     FSC_READ_FAN_TABLE			0x7
> +#define     FAN_CONTROL_POINT_TEMP_MASK		REG_GENMASK(7, 0)
> +#define     FAN_CONTROL_POINT_SPEED_MASK	REG_GENMASK(15, 8)
> +#define     FSC_READ_FAN_MIN_PWM		0x8
>   
>   #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
>   /* PCODE_SCRATCH0 */
--------------Xqk50FMhAW2gFetXVsQJFORv
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 17-07-2026 09:47, Karthik Poosa
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260717041757.2759084-3-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">Initialize Xe hwmon fan-control support by detecting fan count,
reading stock fan control points and min PWM.

v2:
 - Avoid user table initialization during probe. (Badal)
 - Move unused code to appropriate patches.
 - Use xe helpers for dmesg logs.

Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
Assisted-by: Codex:gpt-5-4
---
 drivers/gpu/drm/xe/xe_hwmon.c     | 159 +++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_pcode_api.h |   5 +
 2 files changed, 149 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index de3f2aeffc3f..0a416e3e7b8c 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -20,6 +20,7 @@
 #include &quot;xe_pcode_api.h&quot;
 #include &quot;xe_sriov.h&quot;
 #include &quot;xe_pm.h&quot;
+#include &quot;xe_printk.h&quot;
 #include &quot;xe_vsec.h&quot;
 #include &quot;regs/xe_pmt.h&quot;
 
@@ -122,14 +123,50 @@ struct xe_hwmon_energy_info {
 	long accum_energy;
 };
 
+enum fan_table_type {
+	/** @STOCK_FAN_TABLE: firmware-provided fan table */
+	STOCK_FAN_TABLE,
+	/** @USER_FAN_TABLE: user fan table written through sysfs */
+	USER_FAN_TABLE,
+	/** @FAN_TABLE_MAX: number of fan table slots tracked per fan */
+	FAN_TABLE_MAX,
+};
+
+/* Maximum number of fan control points supported by each fan */
+#define MAX_FAN_CONTROL_POINTS	(10)
+
+/* Fan control point index: bit31 selects fan table type; bits30:0 control point index */
+#define FCP_INDEX(FAN_TABLE_TYPE, POINT_NUM) (((FAN_TABLE_TYPE) &lt;&lt; 31) | \
+						((POINT_NUM) &amp; REG_GENMASK(30, 0)))
+
+/* PCODE operations timeout for fan control commands */
+#define XE_PCODE_FAN_CONTROL_TIMEOUT_MS	(10)
+
 /**
- * struct xe_hwmon_fan_info - to cache previous fan reading
+ * struct xe_hwmon_fan_info - cached fan telemetry and control state
+ *
+ * Each fan keeps the latest tachometer sampling state along with two fan
+ * tables: the stock table discovered from firmware and the user table managed
+ * by hwmon sysfs writes.
  */
 struct xe_hwmon_fan_info {
 	/** @reg_val_prev: previous fan reg val */
 	u32 reg_val_prev;
 	/** @time_prev: previous timestamp */
 	u64 time_prev;
+	/** @fan_table: fan control tables */
+	struct fan_table {
+		/** @fan_control_point_count: number of supported fan control points */
+		u8 fan_control_point_count;
+		struct fan_control_point {
+			/** @temp: temperature in degree celsius */
+			u8 temp;
+			/** @speed: fan speed in percentage */
+			u8 speed;
+		} fcp[MAX_FAN_CONTROL_POINTS];
+	} fan_table[FAN_TABLE_MAX];
+	/** @min_pwm: minimum fan PWM */
+	u32 min_pwm;
 };
 
 /**
@@ -168,6 +205,8 @@ struct xe_hwmon {
 	int scl_shift_time;
 	/** @ei: Energy info for energyN_input */
 	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
+	/** @num_fans: number of fans available */
+	u8 num_fans;
 	/** @fi: Fan info for fanN_input */
 	struct xe_hwmon_fan_info fi[FAN_MAX];
 	/** @boot_power_limit_read: is boot power limits read */
@@ -856,17 +895,100 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
 			      (uval &amp; POWER_SETUP_I1_DATA_MASK));
 }
 
-static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u32 *uval)
+static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u8 fan_num,
+					   u32 *uval)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon-&gt;xe);
+	return xe_pcode_read_timeout(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, fan_num),
+				     uval, NULL, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
+}
+
+static int xe_hwmon_get_num_fans(const struct xe_hwmon *hwmon, u32 *num_fans)
+{
+	u32 fan_mask = 0;
+	int ret;
 
 	/* Platforms that don't return correct value */
-	if (hwmon-&gt;xe-&gt;info.platform == XE_DG2 &amp;&amp; subcmd == FSC_READ_NUM_FANS) {
-		*uval = 2;
+	if (hwmon-&gt;xe-&gt;info.platform == XE_DG2) {
+		*num_fans = 2;
 		return 0;
 	}
 
-	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0), uval, NULL);
+	ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, 0, &amp;fan_mask);
+	if (ret) {
+		xe_warn(hwmon-&gt;xe, &quot;failed to read number of fans, ret=%d\n&quot;, ret);
+		return ret;
+	}
+
+	*num_fans = min_t(u32, hweight32(fan_mask), FAN_MAX);
+
+	return 0;
+}
+
+static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon-&gt;xe);
+	int point;
+	int fan;
+	int ret;
+
+	for (fan = 0; fan &lt; hwmon-&gt;num_fans; fan++) {
+		u32 stock_fcp_count = 0;
+
+		struct xe_hwmon_fan_info *fi = &amp;hwmon-&gt;fi[fan];
+
+		ret = xe_hwmon_pcode_read_fan_control(hwmon,
+						      FSC_READ_STOCK_FAN_CONTROL_POINTS,
+						      fan, &amp;stock_fcp_count);
+		if (ret) {
+			xe_err(hwmon-&gt;xe,
+			       &quot;failed to read fan %d stock control point count, ret=%d\n&quot;,
+			       fan, ret);
+			return ret;
+		}
+		fi-&gt;fan_table[STOCK_FAN_TABLE].fan_control_point_count =
+				min_t(u8, stock_fcp_count, MAX_FAN_CONTROL_POINTS);
+
+		xe_dbg(hwmon-&gt;xe, &quot;fan %d stock points %u\n&quot;, fan,
+		       fi-&gt;fan_table[STOCK_FAN_TABLE].fan_control_point_count);
+
+		/* Dump the stock fan control points for debugging purposes. */
+		for (point = 0; point &lt; fi-&gt;fan_table[STOCK_FAN_TABLE].fan_control_point_count;
+		     point++) {
+			u32 fcp = 0;
+
+			fcp = FCP_INDEX(STOCK_FAN_TABLE, point);
+			ret = xe_pcode_read_timeout(root_tile,
+						    PCODE_MBOX(FAN_SPEED_CONTROL,
+							       FSC_READ_FAN_TABLE, fan),
+						    &amp;fcp, NULL, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
+			if (ret) {
+				xe_err(hwmon-&gt;xe, &quot;failed to read fan %d stock point %d, ret=%d\n&quot;,
+				       fan, point, ret);
+				continue;
+			}
+
+			/* Cache the stock fan control points in local structure for later use. */
+			fi-&gt;fan_table[STOCK_FAN_TABLE].fcp[point].temp =
+						REG_FIELD_GET(FAN_CONTROL_POINT_TEMP_MASK, fcp);
+			fi-&gt;fan_table[STOCK_FAN_TABLE].fcp[point].speed =
+						REG_FIELD_GET(FAN_CONTROL_POINT_SPEED_MASK, fcp);
+			xe_dbg(hwmon-&gt;xe, &quot;fan %d stock point %d: temp %u C, speed %u %%\n&quot;,
+			       fan, point, fi-&gt;fan_table[STOCK_FAN_TABLE].fcp[point].temp,
+			       fi-&gt;fan_table[STOCK_FAN_TABLE].fcp[point].speed);
+		}
+
+		/* Read minimum fan PWM */
+		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_MIN_PWM, fan,
+						      &amp;fi-&gt;min_pwm);
+		if (ret) {
+			xe_err(hwmon-&gt;xe, &quot;failed to read fan %d min PWM, ret=%d\n&quot;, fan, ret);
+			continue;
+		}
+
+		xe_dbg(hwmon-&gt;xe, &quot;fan %d min PWM %u\n&quot;, fan, fi-&gt;min_pwm);
+	}
+	return 0;
 }
 
 static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
@@ -1279,17 +1401,12 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 static umode_t
 xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
-	u32 uval = 0;
-
 	if (!hwmon-&gt;xe-&gt;info.has_fan_control)
 		return 0;
 
 	switch (attr) {
 	case hwmon_fan_input:
-		if (xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, &amp;uval))
-			return 0;
-
-		return channel &lt; uval ? 0444 : 0;
+		return channel &lt; hwmon-&gt;num_fans ? 0444 : 0;
 	default:
 		return 0;
 	}
@@ -1476,6 +1593,7 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 	u64 val_sku_unit = 0;
 	int channel;
 	struct xe_reg pkg_power_sku_unit;
+	u32 num_fans = 0;
 
 	if (hwmon-&gt;xe-&gt;info.has_mbx_power_limits) {
 		/* Check if GPU firmware support mailbox power limits commands. */
@@ -1531,10 +1649,21 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 		if (xe_hwmon_is_visible(hwmon, hwmon_energy, hwmon_energy_input, channel))
 			xe_hwmon_energy_get(hwmon, channel, &amp;energy);
 
-	/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
-	for (channel = 0; channel &lt; FAN_MAX; channel++)
-		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
-			xe_hwmon_fan_input_read(hwmon, channel, &amp;fan_speed);
+	if (hwmon-&gt;xe-&gt;info.has_fan_control) {
+		xe_hwmon_get_num_fans(hwmon, &amp;num_fans);
+
+		xe_info(hwmon-&gt;xe, &quot;Number of fans detected: %u\n&quot;, num_fans);
+		hwmon-&gt;num_fans = num_fans;
+
+		/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
+		for (channel = 0; channel &lt; hwmon-&gt;num_fans; channel++)
+			if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
+				xe_hwmon_fan_input_read(hwmon, channel, &amp;fan_speed);
+
+		/* Fan control tables initialization */
+		if (xe_hwmon_read_fan_control_info(hwmon))
+			xe_warn(hwmon-&gt;xe, &quot;Fan control tables are not available\n&quot;);</pre>
    </blockquote>
    <p>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style></p>
    <p><font face="monospace">The table appears to be captured before
        late binding. Do we need separate pre-/post-LB tables, or should
        the table be updated again after late binding done?</font></p>
    <p><font face="monospace">Thanks,<br>
        Badal</font></p>
    <blockquote type="cite" cite="mid:20260717041757.2759084-3-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	}
 
 	if (hwmon-&gt;xe-&gt;info.has_mbx_thermal_info &amp;&amp; xe_hwmon_pcode_read_thermal_info(hwmon))
 		drm_warn(&amp;hwmon-&gt;xe-&gt;drm, &quot;Thermal mailbox not supported by card firmware\n&quot;);
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 94575c476e3d..669010f1e2d0 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -85,6 +85,11 @@
 
 #define   FAN_SPEED_CONTROL			0x7D
 #define     FSC_READ_NUM_FANS			0x4
+#define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
+#define     FSC_READ_FAN_TABLE			0x7
+#define     FAN_CONTROL_POINT_TEMP_MASK		REG_GENMASK(7, 0)
+#define     FAN_CONTROL_POINT_SPEED_MASK	REG_GENMASK(15, 8)
+#define     FSC_READ_FAN_MIN_PWM		0x8
 
 #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
 /* PCODE_SCRATCH0 */
</pre>
    </blockquote>
  </body>
</html>

--------------Xqk50FMhAW2gFetXVsQJFORv--
