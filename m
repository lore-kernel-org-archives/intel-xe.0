Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294FCC369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 23:19:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8BA10E1A1;
	Tue, 15 Apr 2025 23:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bbS2ZBXL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77ADB10E39B
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 23:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744759161; x=1776295161;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OC91Uk7ffzOeEyY0z/MvC+OYTFXSJyqXI0M0gDbKM1Y=;
 b=bbS2ZBXLCDXDVqkr7FOG6EadY95tYPAxuDRYDdQN3Mr3IrRxrRp00gcO
 IwLYzrcsSFVnYhshCkS2Ie7rstBdhR1GHn0lQtSYd0tAX8IxFup6kamiX
 stZsyfaaAhg+KPH58l2LW5R00N6ygl7SMJSWifyCMnsCCYm3I0InpumhG
 gyZfZcf/JHVlHxkzri5y2k31xFe+KT9EfEuzlZGPLHNBbzSviFWSb0KG5
 ssns0xFJsTEZlKv7ATBgCSOYZV0o2PQBvuHZBc4nVPFuauYT2IyvSZeEY
 T1o0UjBhQIHjAAJxBxOPAoawVXSXP3PgviBhP9gydl00gbau7Z/0q+kGQ A==;
X-CSE-ConnectionGUID: S6ydGATcScaWWvz5WPVnlA==
X-CSE-MsgGUID: NncElbzJSV6ZaT9uyhAoZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="63828080"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; d="scan'208";a="63828080"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 16:19:19 -0700
X-CSE-ConnectionGUID: Fy/e4zfiRT+1dwpO5is3aA==
X-CSE-MsgGUID: co/kS4BxTIusOSQMUJxnCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; d="scan'208";a="130276177"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 16:19:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 16:19:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 16:19:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 16:19:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LkNjw2KeDFqLj7Ki/xwSO1Mad4ZtN8wLC066a9MnNyEEi3P/RybO0FupIwgFrfQhPui5f2XFqANltgus3S2ooT4XcK32cny8egQt+tHo249UVIWLSJor9oXzDE5+gZNZlBGH6xo7LGt3BjkJZ+77MUmiBKnKfuNJpWUnQskAwORuU7R5s8ZRCm3YNBGN7KR6Os12ciGw4spzQ0eTLAEWvRG0pDTB+60nzs0qZTbcUN68SKBn+kanJCu0SvES44YWWAVQfHtrhDHudnvsp+aWQq8GfsOZuBKIRdQdpsl+C63SbSp9rtTTFSL6jprkuK39HmSXljKIMkHn9GAgu7RY1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSctQrKwFsPhSUod1Kh+8QEdmE6eUYyJtlm+9McV31I=;
 b=BxSdK4oDlROKJ4bzOsLjhkIOJp/xHOsq2KZSP5RW2SXdSTyRBuN7k8nbRvf3EMBZT7MpesEHPV41kkQfPf8aeH5wA8MyzuTtPRxBhJdlI9mZQvuBTNoKnfFqdhcWe+wTD7IESvecB7OqxP9smn1rtIEJDl1TTPEE0xRgt6XWsSd39l3mUtbUy70a9afh7+LWTpds0mbLybH28XA65uQ5muTTxSVSBPGzGmgihHi7flDfvioD7VVq/JS0PEfRchUcDuI9ngYStQdkNG8xl553NCLFvBB/d3f0CWKwNAi/lvJftcLE+7+WEOTzUi0cFilVKVkAWi42eNtOCMljB9JU6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH7PR11MB8011.namprd11.prod.outlook.com (2603:10b6:510:24a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 15 Apr
 2025 23:18:33 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 23:18:33 +0000
Message-ID: <9aa30608-7a74-42de-be19-1c3c6e0a7e5c@intel.com>
Date: Tue, 15 Apr 2025 16:18:29 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] drm/xe: Add devcoredump chunking
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250415183916.332202-1-matthew.brost@intel.com>
 <20250415183916.332202-2-matthew.brost@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250415183916.332202-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::31) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH7PR11MB8011:EE_
X-MS-Office365-Filtering-Correlation-Id: 9685ed56-2579-4e08-e332-08dd7c73d71f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTYwa3JublBPUDB0NTY2M2dBSjlqbDJnZ3RNb3BMazFrdE8zT2JtbHl0OVdL?=
 =?utf-8?B?bVNSNzdkOGxhUzJPYndNU056NHNXc2xSRVlPWnkyL1RYOStVOW9odG9nRWZF?=
 =?utf-8?B?OGhCLzFuaTV5MERCUUtvdDR5eUgrdHdaWlArekJKUHVuVUllMXMyaUlLMGxp?=
 =?utf-8?B?eXc2TmE1S1BUUndLQUlpL0JLbmZUSUE0akxaQ3J3QVc1V1RQempIbWl2SDNh?=
 =?utf-8?B?UTdwYmYzcXVnS215ajNBMG1DblJRV0hVcjBKd0NpUDROSURuN3o1QTBWenMv?=
 =?utf-8?B?Qnlqak92ZzY4OWoxd0dxV0YzTElLVE9IQzkwVmN6TmlITTFRd0MzWGlzeXFW?=
 =?utf-8?B?ZGpPRUUvcERnV3k4UXEzTlYrNzRTd25OMnBETUZkemVJcmh6QitaRngybkFB?=
 =?utf-8?B?VWY5MDVmWUxDbWRyYSsrSUpFZk15WkZPSUkySDlrLzdsSkQraUwxL3lYYzZC?=
 =?utf-8?B?SzhRUTNHSk9BdUh3ZXlIc0RkVTRDd0tETnh1VTA4WWdFRDJXemQwM2UwOHpL?=
 =?utf-8?B?KzVFY1RQQnZQc0FBQXA4SnozRVU1SEdXWVhzUnVQeFZobHhSWHJoUWhNdUNN?=
 =?utf-8?B?cmFhaXJ2UERlRXQveFNSUmZtdExuYlkyU2VUSFFJS28zWXJvSzlldEZxRXlo?=
 =?utf-8?B?a05YQ3ljdVF1VCtPUStzbkRGN2NHQ3dkT0Vqclk0V0ZsUEd1UWdiNVNpbEtR?=
 =?utf-8?B?NjV4MU5mMXFxT3JvZmVrMVVsdnJTWkphdnE1aDZNZ3ByRFlvcTZ5Y05qRlpW?=
 =?utf-8?B?bEljdmRKb2wxVnQzbEFzdUFiVkxTbzMyNjZaWUNnbnQ3SWZ6eEgzN2ljQ0Na?=
 =?utf-8?B?YkJMd3BORHpxV2phS0MrRkFyQm5OaE1JdkN4QytjWVlQd3B6blJPRGl5SGdP?=
 =?utf-8?B?UEZIMjlnYWNkWjJDMGhVMFZOVU9RQVFKK2ZFQk1Md3U3RzlwUTlIZDRNR2dJ?=
 =?utf-8?B?N0pIL1R5Qk1jSkJFaU5jenpmZE5xSGtpUkZJT3E1YUR1bzVpYlEweHBYTHpw?=
 =?utf-8?B?Z2FURW5tL0pIdzdQZnBYaDBlazRDRGdLdVA2aHdSQ1VvWi9EUDY4QmxySVF5?=
 =?utf-8?B?ek0yK0hsWWQ5VUtuRnQ4N3hvclJndEswSldQeENMSzgyd2YwSTd3TzNTTVN1?=
 =?utf-8?B?UHVKOTVyT1hiSTdxOHlZcE9Vd3FMUkt2NFdoZk9tKzBaTGt0L3UzMzY0OW9Q?=
 =?utf-8?B?UnN1SDBkckMyN0tmVllCNjVCRm5WT1JERWVTRGllT05BMU81d2ZCd3M2ZWxr?=
 =?utf-8?B?U2FXbk9vQURZcW83N3A0Um0vTVJYWU9iU055L1NSU0hGYmhlRWpUc1YwODNn?=
 =?utf-8?B?bmh3a2V6YXJ5aG5BZzNzKzEybVU4aE9qSE1PWDdzaDFyTGNPTkk3UlJKWG5p?=
 =?utf-8?B?dFV1R2NISzIxeHh3THQ3eUVQdWJheU1sS1Z6KzZlNVFCNk1jd1ZjejhoL1or?=
 =?utf-8?B?NXFsZnpCdWZTU1oxMWJQZFVZRW9HM1QvVDRKQktZWUg2SW1BVDJIWmVFelVh?=
 =?utf-8?B?VTJwQ2orak02NU9KbnFRT05VTU84SUdQMFRzVGJWV3ZhZ3pkTTMxQVZUdzVt?=
 =?utf-8?B?UjNqT3lpbit4WXB0S2xFZ2xEaTh6bUhoZlFFV3BGWXE3M0xIYWpnemRZNHJ4?=
 =?utf-8?B?M2pRYk4yUjhQZzlPb2wwelVuQWhmdEh1dTkxVkk1UlU3SzIyY1EwWjFiZm9H?=
 =?utf-8?B?MUQ5QzVQak9CRUdvS1pvbG5CNUFGVDRoZ3NNeEJZdjVNSDduQ1JWVkJIayta?=
 =?utf-8?B?eUVOMEpZTE92S3FERnZscDdWV0p2UkIzL3NRZkxLM1VBcGx2aU82RDRrckJR?=
 =?utf-8?B?NjZzYmd0VkNCcnhtMmZtZ1hKL1htRm95N2cyVUhRQnJrUmFURGdESk1zQ3ZG?=
 =?utf-8?B?KzdxOGQ4aHhJOWdUaFo4WHVxaklYcFQ1aSs1eTQxZkE0bkNWdTJtT3BTZTBF?=
 =?utf-8?Q?uW4zJQz2Dew=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnZ0Y1hvbGlvUU9lRjMrK212UmJYaWYxUGNQNWNiUVN1NnJqc2YvaUNEQmhQ?=
 =?utf-8?B?LzJ4YmFDcFZWUWt1elNRQ3c2Sk9UaStBS3U4cHlsZkFHS1BDcUhvamVKTTl1?=
 =?utf-8?B?YkFHcTAxUnVmZDZLWUZHMEtQWmJGTDR1RUJlbFNvcjU4Y2VqaWRDVlF4N2hO?=
 =?utf-8?B?WC9TYURxWVFSVGVacjk0Wm03UTVJczRyM2R2bGRtc2FtUndzRkhRclhzd2pI?=
 =?utf-8?B?cjRXR0kwTUxoaGtmbXJYclVhcmZld0hsUGQwWDNBRlg1ekxsUU13aHJQMjNB?=
 =?utf-8?B?MWFyQzVLczh4Mm5Kc25NUGg1dWVRcUVKcXVlOHJYeStlYXVvZFZOQnFBd2hm?=
 =?utf-8?B?czZWR2RpTWxuZDJ6SVRybUJOQWZpaEEyMVlDVlNrcHBYVkVRaktVMDRxMEth?=
 =?utf-8?B?SGcyRWUxb3ZMbXZrRitCV2FPbzhlZnI4V2hYRXVZVWNSK3Q0T1c5STlFUzdq?=
 =?utf-8?B?V1pGcktqN2pBYmVDcEpQb3c1NUlPclZ2NkdRazNqQUNTU2JxY2NySFZzZVRN?=
 =?utf-8?B?SG1GaXlVN3A1RHBsVW9kMERkN1hKdjFzNldIWmcxV2VNdXF0UWhIbHhzUFFP?=
 =?utf-8?B?RlUxemFNaDNjTW8wQ0tOWXB2dE8vMXFlM1duQW9CUG96T28ya0wrSURrcTM0?=
 =?utf-8?B?czBmUkJrMHNkSWJhZk0vQVRIUGJZYWJKaUNlbWtyNUNMZ2NIR0YxTEM5Mkx6?=
 =?utf-8?B?N2h0dVJzNFdqM3dOdlpnMlY1c2F3Z0VNN1VLMFNwQXJ6ZTd1S1lodU9nS05a?=
 =?utf-8?B?emcxZExRcnRwSCtRTzVoRVhad2lJUkJpMVRwTExMZjIrS1BvY0tXaStIMWlD?=
 =?utf-8?B?VFMwK3UrbGxxMjRjdlJIM1UxeVhWUGMyZlhCeWtINTdmVzFzNU5oMjNSUWRK?=
 =?utf-8?B?UzVsWnU4dDBGRXdJNGdmQi9uVFROd1hsNDN2TGQ5V25rV0Q4ZFRJZ1AvaXZn?=
 =?utf-8?B?RVlqM3lsWTEvVHFkUENvUmtzTXA2WEx2Y0FRaUdqSEthY1hycXRCRlJpcVZO?=
 =?utf-8?B?aFVOMy9uUVJmaWlGRUlscnU4M2JjQS83WEJuQWlRNEh0Z3lzY1lZaXY3bW5D?=
 =?utf-8?B?SGQ5NGFMbXBCckJHRldYOFVWYmExRkk2Z0tJak11SFdZMDBsTzNFYzdqRmlR?=
 =?utf-8?B?U3BNSE5OTDBkQVFLcnJqV0psSEFsYTE4YUtVUnZkWkp2V2pMNWg0dUF2ejBQ?=
 =?utf-8?B?RElSb0o1dmF1YXhMTVFZRXBEbVVpOTR2cmVXY0x6VzZlWmJaMlVKK3FnL3By?=
 =?utf-8?B?VXk5RkE4S2IyLzc1bWpqNXZTdk5sTFUyVVo5dmw5WVE1ZmNPM1owd0JtOHJV?=
 =?utf-8?B?NlRvZGNQVk5aV1REcHRHNUpZUjhPOFNLcXVDRkU3Uy9pNmxROWh2MjJiSTNi?=
 =?utf-8?B?Ym1GendYOTNnT0d5N2xqK0hYOWpadDRlOE1jeTFXQTFFdmlVRCtHNHV2Q3Jj?=
 =?utf-8?B?eEVDb1BuYTVubldsSXREQnlXc2FzRnhqdE9KT2xYTHl6RGt0WkVSL0ovSnVN?=
 =?utf-8?B?MDBoeEFNU2dVWGJwTjZNUDlJbHFlQXdsSGhOS20vZ240VDN4YTZjbUdYOHBi?=
 =?utf-8?B?SzdoUXhlam9BYU9BTldJeUlkTWYzQjI1MVZKT1lYc0Rra1Avd09SVVBUSUpQ?=
 =?utf-8?B?RWxlZ2pzYUhCYWNZZ3pybDJxT2JQNys1K0ZKUEpLVzZteTFveFBLWE9MR2E1?=
 =?utf-8?B?dmpoSDlXK1Y0KzVjYk1sRkdVN1I2aG5SYXVDMk1CWUZ5enllcGlJN1l0eDRX?=
 =?utf-8?B?TVVidjNJOGFzMjBzVU9XN3VjUWlkRGkybk1JaTNtNFBnMUd2alNTYlNXdXpi?=
 =?utf-8?B?Y0pURlIzRWdHSVJNYUlWeHdwem1KbjgrTGpKV0tmbXdjWkJYd2NoZWgzN1FS?=
 =?utf-8?B?N21MRWRQM3VWSUF5d3NaeGl2VExRQzdmbzZ4eVdYVUxLei9vd08wUG1QSDN0?=
 =?utf-8?B?My9NeWtlR3JtdDdyVTNWZ3A1elVONStXdDduSVJNZnBsU2d0SWRoYnJWVXd3?=
 =?utf-8?B?SllrUlNoYkpkOWdNbGZRZHdaS3JBSjk4dHZxcUVVblhMc215Y2hFaGc2dnhB?=
 =?utf-8?B?cktUN3BQa3Q2QnEvWGIzY2kxb3lMcHZYcU9wMnRGTTdJUFc2aTM1b1VNS2py?=
 =?utf-8?B?UUhMcVNUSkdEdlpSdnlNSnY0ZWlXdTVUVVBJYzh0YlBWUXY4dTNPRDR6YmVM?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9685ed56-2579-4e08-e332-08dd7c73d71f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 23:18:33.0868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7P5SUtF8wfCj/prfQEVdQRJ3nl6xHDCg3VRV5ytRe7bmX/jV/J7VX717GJpNudGedxS1jqQCMqSczmsi21hiZMzvHBwDIWLZeRUxQPVFSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8011
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

On 4/15/2025 11:39 AM, Matthew Brost wrote:
> Chunk devcoredump into 1.5G pieces to avoid hitting the kvmalloc limit
> of 2G. Simple algorithm reads 1.5G at time in xe_devcoredump_read
> callback as needed.
>
> Some memory allocations are changed to GFP_ATOMIC as they done in
> xe_devcoredump_read which holds lock in the path of reclaim. The
> allocations are small, so in practice should never fail.
>
> v2:
>   - Update commit message wrt gfp atomic (John H)
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_devcoredump.c       | 59 ++++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 +
>   drivers/gpu/drm/xe/xe_guc_hwconfig.c      |  2 +-
>   3 files changed, 50 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 81b9d9bb3f57..a9e618abf8ac 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -80,7 +80,8 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
>   	return &q->gt->uc.guc;
>   }
>   
> -static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
> +static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
> +				     ssize_t start,
>   				     struct xe_devcoredump *coredump)
>   {
>   	struct xe_device *xe;
> @@ -94,7 +95,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
>   	ss = &coredump->snapshot;
>   
>   	iter.data = buffer;
> -	iter.start = 0;
> +	iter.start = start;
>   	iter.remain = count;
>   
>   	p = drm_coredump_printer(&iter);
> @@ -168,6 +169,8 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
>   	ss->vm = NULL;
>   }
>   
> +#define XE_DEVCOREDUMP_CHUNK_MAX	(SZ_512M + SZ_1G)
> +
>   static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>   				   size_t count, void *data, size_t datalen)
>   {
> @@ -183,6 +186,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>   	/* Ensure delayed work is captured before continuing */
>   	flush_work(&ss->work);
>   
> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
> +		xe_pm_runtime_get(gt_to_xe(ss->gt));
> +
>   	mutex_lock(&coredump->lock);
>   
>   	if (!ss->read.buffer) {
> @@ -195,12 +201,26 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>   		return 0;
>   	}
>   
> +	if (offset >= ss->read.chunk_position + XE_DEVCOREDUMP_CHUNK_MAX ||
> +	    offset < ss->read.chunk_position) {
> +		ss->read.chunk_position =
> +			ALIGN_DOWN(offset, XE_DEVCOREDUMP_CHUNK_MAX);
> +
> +		__xe_devcoredump_read(ss->read.buffer,
> +				      XE_DEVCOREDUMP_CHUNK_MAX,
> +				      ss->read.chunk_position, coredump);
> +	}
> +
>   	byte_copied = count < ss->read.size - offset ? count :
>   		ss->read.size - offset;
> -	memcpy(buffer, ss->read.buffer + offset, byte_copied);
> +	memcpy(buffer, ss->read.buffer +
> +	       (offset % XE_DEVCOREDUMP_CHUNK_MAX), byte_copied);
>   
>   	mutex_unlock(&coredump->lock);
>   
> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
> +		xe_pm_runtime_put(gt_to_xe(ss->gt));
> +
>   	return byte_copied;
>   }
>   
> @@ -254,17 +274,32 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
>   	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
>   	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
>   
> -	xe_pm_runtime_put(xe);
> +	ss->read.chunk_position = 0;
>   
>   	/* Calculate devcoredump size */
> -	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
> -
> -	ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
> -	if (!ss->read.buffer)
> -		return;
> +	ss->read.size = __xe_devcoredump_read(NULL, LONG_MAX, 0, coredump);
> +
> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX) {
> +		ss->read.buffer = kvmalloc(XE_DEVCOREDUMP_CHUNK_MAX,
> +					   GFP_USER);
> +		if (!ss->read.buffer)
> +			goto put_pm;
> +
> +		__xe_devcoredump_read(ss->read.buffer,
> +				      XE_DEVCOREDUMP_CHUNK_MAX,
> +				      0, coredump);
> +	} else {
> +		ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
> +		if (!ss->read.buffer)
> +			goto put_pm;
> +
> +		__xe_devcoredump_read(ss->read.buffer, ss->read.size, 0,
> +				      coredump);
> +		xe_devcoredump_snapshot_free(ss);
> +	}
>   
> -	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
> -	xe_devcoredump_snapshot_free(ss);
> +put_pm:
> +	xe_pm_runtime_put(xe);
>   }
>   
>   static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> @@ -425,7 +460,7 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, char suffi
>   	if (offset & 3)
>   		drm_printf(p, "Offset not word aligned: %zu", offset);
>   
> -	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
> +	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_ATOMIC);
>   	if (!line_buff) {
>   		drm_printf(p, "Failed to allocate line buffer\n");
>   		return;
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index 1a1d16a96b2d..a174385a6d83 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -66,6 +66,8 @@ struct xe_devcoredump_snapshot {
>   	struct {
>   		/** @read.size: size of devcoredump in human readable format */
>   		ssize_t size;
> +		/** @read.chunk_position: position of devcoredump chunk */
> +		ssize_t chunk_position;
>   		/** @read.buffer: buffer of devcoredump in human readable format */
>   		char *buffer;
>   	} read;
> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> index af2c817d552c..21403a250834 100644
> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> @@ -175,7 +175,7 @@ int xe_guc_hwconfig_lookup_u32(struct xe_guc *guc, u32 attribute, u32 *val)
>   	if (num_dw == 0)
>   		return -EINVAL;
>   
> -	hwconfig = kzalloc(size, GFP_KERNEL);
> +	hwconfig = kzalloc(size, GFP_ATOMIC);
As per earlier comments, this should not be happening while dumping a 
core dump. The only code which uses this is steering related. That 
implies we are reading EU registers while printing out a previously 
saved core dump. That either means we are unnecessarily reading 
registers during the print or we are not capturing state in advance and 
only actually reading it out when printing. Neither of which is good.

Rather than making allocations atomic when they don't need to be, we 
should be fixing why the coredump is not doing a clean separation of 
save versus print.

John.


>   	if (!hwconfig)
>   		return -ENOMEM;
>   

