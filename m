Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64437C369DC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 12:23:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC6310E754;
	Wed, 30 Apr 2025 12:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mpQeSX6H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F085010E75E
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 12:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746015819; x=1777551819;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6ocucCk7x8bRIBXeIXj071F9G5OC5ih4pP5oDK6F97w=;
 b=mpQeSX6HMkB1YsaP5UPVMb0q2iuaS52Jf1TzwBqL1use8vL0YSXBXmm/
 iRq9nFm4Y0tC+T7HrFogozhdYozg9qTEy1KvWBqC/G1bRkqDbAeZBisC5
 MU6DG4L7UgoovpOUtDeeA4/Szhx7Uc942TruZSRPDF83YhLRIDpDsYYcL
 3h2vXiU+i6WhUBngNqzO/iSyoT1Ivvt3dlYObOX/widAZPmRsQ7gsqoji
 F3tO80E1spH16H4yHfMxvCh6AR1Dk9NfX3/d3HFHXNeTpI5vkxHsC25iX
 WZFYeuypsv9aBNCl+NAkND34OnDOXMQaqh4NyIVeyCARxp0Q8649gdB26 g==;
X-CSE-ConnectionGUID: 6p7KfTpqS2qF7IsWJOHfDg==
X-CSE-MsgGUID: Imtc6tgHRvSLzjwWFltX4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47553519"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="47553519"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 05:23:38 -0700
X-CSE-ConnectionGUID: nnWmW9CFRNyHU8WTV2186Q==
X-CSE-MsgGUID: n+/8MvIYTDu5BDkookY25A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="134411687"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 05:23:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 30 Apr 2025 05:23:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 30 Apr 2025 05:23:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 30 Apr 2025 05:23:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ot9InbWE4uhDsm+ytv0am+hNxJ1h2o2yuKvSoUwsFo/ni33MvlUdY+ZnmAqPfMigZ+DeeEyg8Yh6C86cFx0wFjdFvthL1MTSi5/0Fy9IUj+2lhJ5vomzgDXp47hTT5IMSetu7z9DGlMNhHOzpneKooCLO3uOOurt9rVlcW0Wj07aMXze7qghaoCAmk1yUgy0D8rWXVTVuu2D8K/w6cItguDUQHLKXWTWHrGu4xhF2h8KVave4ZJgJzUpiKYQ2Xq1N4GmNEJvalnhGNZmgK5WHdfK6/2dnHAAInmn0EsdIWATYWbFZ0ZP70Vj6yo5p3KdMJHhEMds169Zijr/PIReCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVhlAnciNeg7eWQWzIBWmyhnqkhMrFJPcJ+VvWbHoSs=;
 b=vEbUhESIkgc7w208iBZEQBcy8QDoAfvbOIkG6vHHfDGd2+6vgMK7GKYYDSwl7HK+L+xNeCi0GYMTDxjwljI8R7LSthLHn3m/mM58qPQwSSvzgEXrQ1QoT5PnkVi3Yv1oI5Ld+/JGrQ30f2wQaALwGtrXafNmrwu60UYZtJZcM3693Mv83ZwywNgSb9oaCvqjkXqeitr5FQDLJRzKy1idkN4B9t8D+N7GpegZ7h84b751rW5L9LzUL1g8nRGC9v/QgoW/dYRbKDwr6a8qyCZF2RH5jIi1Rh+rt92Ar1QBn1VSBjK8z4TH0SYe+6zr7sZDyJDcReGQ+HbKAvit1tDNew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA1PR11MB7061.namprd11.prod.outlook.com (2603:10b6:806:2ba::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 12:23:32 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 12:23:32 +0000
Message-ID: <c1d8312c-f31a-4081-8bc4-571714ca1c45@intel.com>
Date: Wed, 30 Apr 2025 17:53:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/9] mei: late_bind: add late binding component driver
To: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>
References: <20250429073804.972137-1-badal.nilawar@intel.com>
 <20250429073804.972137-2-badal.nilawar@intel.com> <87v7qnwdm3.fsf@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <87v7qnwdm3.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::16) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA1PR11MB7061:EE_
X-MS-Office365-Filtering-Correlation-Id: b517667e-37e4-4582-a395-08dd87e1d231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cksrRUNkanlLa2VMK3hCOGVVZmNYeHR0ajRRemlSSUlLeTNuOXZsSENobzZ4?=
 =?utf-8?B?dVRPeWZTSThxdFpSSTQ4M01NZnJqaHdHbE5Hb0UxcDVsTSszZUU1ZDV5bVh2?=
 =?utf-8?B?RWVJaUNmSW9UV0s5WTArU2NDbVEvMGdDRURlOE45YS9keU10WGdIbnJLUzhT?=
 =?utf-8?B?N0pRNHhEdzJxcHY4U0VNYUhUNk1teXRYV3RmY2drTmhyZnY2K2daRVBweElT?=
 =?utf-8?B?bVdySEtiWlZUTElnSERkZHUyTnUxalNCcEppaUF0MStSNjR6ZDJxYndvUXZH?=
 =?utf-8?B?RTc5SXdkMGJSa01PNTdKRmJ1YVNyaFROQldCTHd5WnRGY0lFNTRQMUlWbUtO?=
 =?utf-8?B?YkllMlBoNnY2NEthaVVlVEQxS3VaVmhGZ3c2cmpjOGtTQ2diY1pVR3dIa09h?=
 =?utf-8?B?eStJUnptNXdTZk9GQzRnOVVhL2tOWERRaVRYNTc3MVdpYXhGaTEwd1NSdTVp?=
 =?utf-8?B?d1NkanlZSTJCQjJJZGdwYWx2OVQvc1pFWEp4RVZwMXUvVnc3UHg3bk8zcVRr?=
 =?utf-8?B?Smtud0tWaUMwckVUM1JHT1lyWm9HNlpHbnU3TStoSG5qMnNBRWRUYi9DNmM3?=
 =?utf-8?B?YjNsN0M1N2RqRzhwVkZXMGcwZ2hBR2ZlY3B2QjROL0lQNU9YMXV2QXVic1p6?=
 =?utf-8?B?T2N1cnh0MkppcFMwTnhzM1hDMnlKR3VXYjVTbHhIZVZpQm5WRE5lTDZuV3R5?=
 =?utf-8?B?U3ZYUHVybHVXZSt5U3Q1RWl1RkdqcjFKVFJuTjVtSFJaSGRWTXhacnNjYkJh?=
 =?utf-8?B?NTA3R29RM2xuMWh3MXpHRVk3Z1pGK0NJakVDT2FOb3JsR1dSejV6dWZpYUJj?=
 =?utf-8?B?OFlqS1FEamFsR0RYN2VTTHEyQzBoSmRVZ0NFNUhTUDlhSGRIM1l2bEhVSTVK?=
 =?utf-8?B?SFJpSGZSOUNpZmNCdlNFdWQ4SGJhdGMyMDVxMWVUV3k3eGUzdExFeFlHLzdj?=
 =?utf-8?B?KzdDQmgvbjREalpGZkhFK0NEWU8xTGVzam03UkV6YWhmN0JITFJjUHpoYVVw?=
 =?utf-8?B?WmlkSUZlaHROQ28vUUlxdHgyR0p6TGJKWHNCUDhvRVVFS2dxbzNiZXFVUmJE?=
 =?utf-8?B?U2Jqa1BMNGVjRnIvd1pYNi84WDBZNU4wTTIrZXFiQnVRWlNUdGJ0SG82Ums1?=
 =?utf-8?B?OFp5NnhBWXN2SVN5bDM4bjljbUZHbkhQSlI5VEZ1M29yVTYvV01yanRtWFpO?=
 =?utf-8?B?aFUwMXc2OHZqeFM1TWtnVEVpY1hWL3lYN3Q4VE1hOXUramp4RWJ3RUFHeWJ1?=
 =?utf-8?B?Zi9HL25TaWRYYUg1OGpQckdWZnBnVitzNGp4bnAzMGFuMWd5d1l5RGZqdnV3?=
 =?utf-8?B?Z3NsY0ZjMGVHZTBhSWVrdTdCSGxRZlN6TlcralBqUGJBOVNXQXZGVnYzZ2U3?=
 =?utf-8?B?QmpoQ3pHWG1Hc3VVd0tiNncxQmhvVGVXL0txM0pwZWpMV3ZpVDgvV1g0Q00r?=
 =?utf-8?B?dmIxWHlnY0EraXJGU2ZxTGVzZVdrekFCTWs5NFluUkMydkxNckxkUDg5Q0g2?=
 =?utf-8?B?cFg0TDBJbDVtZkZBakc3NjB5OVp4VHRqTHlWbk5OZUY0ZzVBaTd5RlFiZU1a?=
 =?utf-8?B?Yk5OeTl6TEgrYkd6N0wrOXd2azhwNVZMZWxDbDhjeUx0Vkh2a0R2eU5wUnB0?=
 =?utf-8?B?dG5WbFozcE01NXpsNk8xY0hXTTNwaDFkK29Pa0g2MzBuQnNiaGlhYWFFSjFt?=
 =?utf-8?B?KzFWSGUxK3lQUENtTXpvOERyL1dWUHUvNmlkc3lJcnhCMWhoRzQ5cHo4Zm5u?=
 =?utf-8?B?RjJuMHNBZmhycnU2Z1M1R2d1V2l3dnoveEQ3cjRGTTBZNG05bkZyVlBvd3ZJ?=
 =?utf-8?B?SnhzVTBQVTlESm1CYTdrc3Z3eEs5N2RoOGhHSWlsVHF4SHNjL216SzBjKzlu?=
 =?utf-8?B?b2ZVYjh5blFPQy9IbjBOQzJyRHdPQ2ZYdXduSmsrdEdLdXRHNFhGNWJFRHdW?=
 =?utf-8?Q?HsjpwCfEl/g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlN1OWlCbTB0dVd0dmhwMit1YTFPemw1QmZlZlJXUnNLT0o0SFpmT0JlOWpv?=
 =?utf-8?B?M3ZjNllrWDhtRStVTlJsdzUxc0RzMmNqVW56b1NrRXFXNkpKY2dXcUFWSUJs?=
 =?utf-8?B?ZWFEcHZFTDlGUndkazd2SmVaOUVqWnNlSWlMTjNBc2RWamcyeVk5eGNqR3Ba?=
 =?utf-8?B?R3VobS9ZM2lLME1Tby9XM2huRkkvRmRmT3YxWk9KZmFURXZIY3hLeVB1ME9y?=
 =?utf-8?B?dkxwa1hId1hWN0orT096eTBveko1dDNRbm1OaGVhT3Z0R0ZUeGh1VFJ6UXND?=
 =?utf-8?B?THBDVDU1WTczQ2tqeFZiR0hZVE1hUGhyZy9yaDlBZGtCN1NzcURlbVIrV3VX?=
 =?utf-8?B?MW1abXVXVlNHck5sZXZxZjFOc1QwbTVMQ0N0TFJQZW02Q3hKSUwxRlBwcVFV?=
 =?utf-8?B?OHRzYy9EMG4ydHpwd2NHaXd2cjd1M0lJbitYSUc4dDhWbC9MTks4TG9xMlgv?=
 =?utf-8?B?L1NtUmZJNjFWRm9HZm5tK3pjTnN2ajlwYytyUllXSWhjaVRwY3VGeGtWSFhN?=
 =?utf-8?B?emtSSkNSdkJ3QXRTN2wyeHF6ZnArbkJVYzF2eU51Tmc3ck9yWjlDSlM1UjBx?=
 =?utf-8?B?c3RPMHF1eUpBWUR1T2ZuSWhKamVOdVF3d0JwWGhjazY4bVlkSWNicnUyQ3Rw?=
 =?utf-8?B?bWYzcGUzTEJOUkNhQnBkVDViLzU3eDJmZ1RYbW9Tb2xLV0h4ODFSYnFBRHo2?=
 =?utf-8?B?MXlFU3RFMncwU1Q0anRyOHloVUw5bm80enZ1NXZObU0ycmZwQlZjUUpwTUsx?=
 =?utf-8?B?MUN1SHE1VTJ1RDZPNXFGcUJFMHNpYkVzMnR6U2hocWFMbG1Ja1BIN0hmeHJO?=
 =?utf-8?B?dHBGZ2N0MVd5dUhsbUppeTRrWGJpWHhuRE5Ma1VPbXZQQ2NGS2t1SDhKVVV2?=
 =?utf-8?B?NDVSaFJKeG1Rams5SFFSVVh6WWF5S2FLS0JZUEVuUmpPYVlDelVsRnBKSTNx?=
 =?utf-8?B?dXlIYmI1U3RpRi9xYXZQN3AxSDBiRTFvMVVUd2E3amNuMGljVy9OTnJLQ3Ax?=
 =?utf-8?B?VkxpOXUvY2QzaHdZSTkvUi9yaGMyOXFVUzVDSmV2WGgvL1V5SUZiSlpwaSt2?=
 =?utf-8?B?ZGltayt5ZjduSUQrUFVwNFVKaFRGazF1b0p5QnBVTjZ3Ulo3MnZyQjFWT3dy?=
 =?utf-8?B?Q1dPT0s5VVplRnp0ekV3TkFvYUVwczlTZWlXYkpYWEtRTFB3ZzFvOTV5SW1N?=
 =?utf-8?B?TE5TT0NyRXl1OU5RZ0Y3ZWNFY3p5Q0pKSjBCMXVnZTVkM1FXTlAzcWVRb2JO?=
 =?utf-8?B?amxGMmVlWlFjRDdHSUR5WXRyM0l1NU1GZG1ENnVqM1hqdFB4V0RsYjBRRkda?=
 =?utf-8?B?OHZjSGx0Y2hseGIxSVFIV1JQd0RoMDV1VXoyR0VjTEk5N3NtbTFHWTY2QnVm?=
 =?utf-8?B?a2RDNVBYMi9BdHBkWllQaVRJNVFwdnFNVGRYejBsRzU4cUtxVFFpNmRNTFNL?=
 =?utf-8?B?dkR2Nnp4cTJ3SERrYnMydkd3YlN2dTlxaHEzb29WOFUzdURzU3FNMWZyYTFq?=
 =?utf-8?B?UG05bWhEY0dtRkJ6czRMZ1VOdmUvMUFTSkIzb2pEVjNybXJwbEJKSUd4d3Qv?=
 =?utf-8?B?RmJRU1d1eStUTlQ3RWZaMU0zMjJuK1JSdnROZ0dMY2hidkdOUzFMWmc2Wm5o?=
 =?utf-8?B?OVM0dHcrS28vdXJTSjFBTDMreUJYRFplbGw5WXhLUVhFUTZVNVhCSXhJR3ND?=
 =?utf-8?B?Z0FNYnBaOHB6SmYyUExsMGJOOE82WjB2UTkxVEVsTmthZlJiQ012UThZbEhF?=
 =?utf-8?B?Z0dyVkhiV3lUV3A3VndDVHVkQ3U4VW1qQU04YTBjQmZwaTNENU05eVNyZHJ1?=
 =?utf-8?B?RGZ0SHFqYTgxbkJlSWcxVmJRM1BxOGFmUEVVTjBxdnpmUlM2c3ptTzNQcklr?=
 =?utf-8?B?bTBKVU9meVJNZTZiazJCcEFpOFB5c09zOE9NMWJONTFZS055MDRxRSs4MUtC?=
 =?utf-8?B?SFlRbjd4cTl4NTYvL2c2Z3gyay9HWS9ReHBoN0FVYThoczVvbXlPc2lhd2dC?=
 =?utf-8?B?cHlQN0NHUTJTdmZ0Ny9PSU1jNzlHeEVacGZRMlk1eFBSZkFrMFlQVFgzT1JV?=
 =?utf-8?B?TWlJQ2txajQ3RFc3MWw0ODZoaElDU1pGUDFMN2R5bUJiZVZ3QTlpODZvTm5P?=
 =?utf-8?B?dFE1RWdSd1M0WlhBUU9aVThzbG81V1Y1M2JTVE5OcEI4VmR1UVJ4S1hKNnA3?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b517667e-37e4-4582-a395-08dd87e1d231
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 12:23:32.2015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: clK1/wo35WBSnvXVorjVtWPmPr3Uwh75cyK75rT4caGGAGcyFZn+jv2k5XvLyXSBynKEvJWru6351EkQxPIymA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7061
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


On 29-04-2025 14:25, Jani Nikula wrote:
> On Tue, 29 Apr 2025, Badal Nilawar <badal.nilawar@intel.com> wrote:
>> diff --git a/include/drm/intel/xe_late_bind_mei_interface.h b/include/drm/intel/xe_late_bind_mei_interface.h
>> new file mode 100644
>> index 000000000000..4005c4c6184f
>> --- /dev/null
>> +++ b/include/drm/intel/xe_late_bind_mei_interface.h
>> @@ -0,0 +1,49 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright (c) 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_LATE_BIND_MEI_INTERFACE_H_
>> +#define _XE_LATE_BIND_MEI_INTERFACE_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct device;
>> +struct module;
>> +
>> +/**
>> + * struct xe_late_bind_component_ops - ops for Late Binding services.
>> + * @owner: Module providing the ops
>> + * @push_config: Sends a config to FW.
>> + */
>> +struct xe_late_bind_component_ops {
> Please don't name the file after xe, please don't name the structs after
> xe. The whole directory include/drm/intel/ is supposed to be agnostic to
> i915 or xe, even if the current naming has i915 for historical
> reasons.
>
> Aim for generic interfaces and solutions and naming instead of doing
> something specific for xe, even if the first user is xe.

Thanks for review comment, I will address this in v3.

Regards,
Badal

> BR,
> Jani.
>
>
>> +	struct module *owner;
>> +
>> +	/**
>> +	 * @push_config: Sends a config to FW.
>> +	 * @dev: device struct corresponding to the mei device
>> +	 * @type: payload type
>> +	 * @flags: payload flags
>> +	 * @payload: payload buffer
>> +	 * @payload_size: payload buffer size
>> +	 *
>> +	 * Return: 0 success, negative errno value on transport failure,
>> +	 *         positive status returned by FW
>> +	 */
>> +	int (*push_config)(struct device *dev, u32 type, u32 flags,
>> +			   const void *payload, size_t payload_size);
>> +};
>> +
>> +/**
>> + * struct xe_late_bind_component - Late Binding services component
>> + * @mei_dev: device that provide Late Binding service.
>> + * @ops: Ops implemented by Late Binding driver, used by Xe driver.
>> + *
>> + * Communication between Xe and MEI drivers for Late Binding services
>> + */
>> +struct xe_late_bind_component {
>> +	struct device *mei_dev;
>> +	const struct xe_late_bind_component_ops *ops;
>> +};
>> +
>> +#endif /* _XE_LATE_BIND_MEI_INTERFACE_H_ */
