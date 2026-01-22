Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D461D3EE66
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 14:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CAF10E9BA;
	Thu, 22 Jan 2026 14:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vf0I7NJl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D2310E9BD
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 14:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769090969; x=1800626969;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7Ul/ygynPKN7xsBqazmx77ZsJDmTsVtqQ4SVZyxA5Gw=;
 b=Vf0I7NJlAndDOC5H/IKg7HQYGQa59RXXhrXmaA53hXHc3C5p+C/vXBM8
 LZsizcgi0/5+yoOdXTTzDJwsm+hnIA/ApZkkwFp+mC1lYCpExNy6whJGz
 YpAGJtJ18xEx7XFWVWKoaEo+q2ImkcXYNONcpD7GdfMr7FkClcN2BQssU
 lXK94PyCnfMO9csblbfcBTzBuTPQG/eIXbpWyO4aTlh9m91wxahpdEpkU
 oaXkzCsYfa3bI8eOoQ6tqsLq1lxnAOCWeV300ITl/6pMPao6ewPOvYVEl
 59I7Ea/ybOZnhVthfIngtUAddcHc/ZZBxhPscXSv+A636Gc7mUSXazW7s g==;
X-CSE-ConnectionGUID: ZjfK9mg/SDSk5fo30zf85g==
X-CSE-MsgGUID: 68DaVpwQQXqpK3Wha72HYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81444368"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="81444368"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 06:09:29 -0800
X-CSE-ConnectionGUID: aB5kHOg6S+u+9aBJaDZMPA==
X-CSE-MsgGUID: dmHkIQiTRoCtWelsBRsMGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="206644766"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 06:09:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 06:09:28 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 06:09:28 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 06:09:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUANC6m75cm6Jq6JN1f46gU9i2edKlUWBank1VxvL3ZBCfL1lLfMtMDCAxlzQyDC2ePs5WVG5l+52MjNOs4xQO3s6dP4YWMTdWMnd9zVNjqDVbJsZJZQdpv3rKYwqLj/6Q4YEcwSjg87ng2+OwMH/12uU7rdZ1kjzMNeTJbBqiKtSTQheSPKwb9TWrx4PCZZnJO30NpwSV7+UHCn12icUvwE7cHm0d9ZUnzAwd7AgAoHATIcwD8Y+EhrlRfoxy42dHk+JAQkTn9rdGwlNTp9ZAo8u5L6AcctsZONqpmX32rDTNfyLkBUwcRwl96ugVwUtRrx7Gmf9XV15TKS5QtSlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIBf5mLqyWXQyfdikRg8thQfN8wEwX1UTnlOAbHLgf8=;
 b=JmXzc/5UAUCiunLEX6HePOklBwgxPPNOr6AkQwxkL4YA9Gq5B52/0GODaPR64izj4QngQ+kd6gSSetmVS8PbzLjExsumF7dTwZdBTcTsS2cnnzH4/a6rlSoAu+yZJU1YUYSLCKEQlsBPYL8DQDNkvEBcdFGeu+1ZgVKVJhg2kj+oMavi8KsoCcbn6asgpGBi1B/9FOglin454LeoiGToS9c1BYkoGHKTrGNopazjRpYKCaBDp8vQAQAz3ZYyCUiqZQAmIFLfv3HSZfIwtZlytFu/N66TftYo2DFE5AxAfuxFdJ300p5XScF0Z6r8AI1w3UOUl9DLn/JHBspW2lNuqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MN2PR11MB4518.namprd11.prod.outlook.com (2603:10b6:208:24f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 14:09:26 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 14:09:26 +0000
Message-ID: <e943863e-ddf2-4fc1-bfd5-008219a73356@intel.com>
Date: Thu, 22 Jan 2026 15:09:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Log module init failure as error
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260121235618.3138251-4-shuicheng.lin@intel.com>
 <20260121235618.3138251-6-shuicheng.lin@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260121235618.3138251-6-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0064.eurprd04.prod.outlook.com
 (2603:10a6:802:2::35) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MN2PR11MB4518:EE_
X-MS-Office365-Filtering-Correlation-Id: b2460446-4e1e-4374-dcf7-08de59bfd9a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bE1LUzVXRVh2Vml5c0FFUkFEbGU0eHc2VWp0THJYakQ1aVBlcU5UaHN6eWhO?=
 =?utf-8?B?MmoxZHFUbHUxQ2REdTlUR0d1VHpnU3AvdWxRTWRkWFQzUTcrb3Vzb1BmRXU4?=
 =?utf-8?B?N0hMeHJxNEd2T25CaVlmQnBHWDY5dEVKMTVHKy9Tdi84VTBYM3cvMzFxT1NT?=
 =?utf-8?B?bDJnbGgzZWhFQm9NcTgxRVUwdXc5ejVzUlo1QldKcURPcWFyQ3gydlBQODRv?=
 =?utf-8?B?V3VwcDVPU2FLaXBMNHI3WVJXa1BhVVE5RWp0V3d0UksyNW11NzF1RFhPcDdI?=
 =?utf-8?B?UzA0aDU2K056REY4YzN4MmNhbmVvVlpRUTBadFhWcTR0Z1hPdXJWOTBLbVNy?=
 =?utf-8?B?OHY1aFU5Qnh5UlBqWUNYZXlIRHV3akhtQWR1N1dwSk5GalZHT1AxcFdwM0xH?=
 =?utf-8?B?SWpTSGJPeStoVy9WOTAvRDFjZXhSV3lhNFdCdjg1OVg0T1NsRmNITE1SNE9h?=
 =?utf-8?B?ZHRteGJHc3Y2WU40S20wQjR6bklOSU9RZlB6cy9kay85eVR4Y1pINU9xZWlu?=
 =?utf-8?B?ZHJmWS9LbWRPaHBKK1lTa1FvcU9rbEhlSmMwS2dGTUlXN1hIZjlNL3Q4SUZZ?=
 =?utf-8?B?b29BVmJtTWNVam9xaDN5VmYzQ0NyQWU2ZFd5Vm1pK2hnSVZJVnJxOVFDRXBW?=
 =?utf-8?B?QUt5TkZkbXh1WXN0dlRLSTRuYzhoZ3VsOXhYZjhTOVRybVdqU0FuVngzVDdM?=
 =?utf-8?B?NUs0QWcxOWZ5QXhkanJqL0NRSXZEN0lISE1PSWQ1TUJpMmwvekZkM1Y0MjV1?=
 =?utf-8?B?d0hsbk83bTZDMjBXby80MmN1ZWZFMTRmbCtPMTMwYnpXUCtsTy9oc2F1TWpp?=
 =?utf-8?B?S2lOY1FId0pBQjdxd1R1NU9zWGxaSFBJMElvcnZ0WEExZUhndnB6Z0k2Y1NJ?=
 =?utf-8?B?TWUwWnowWVlpZnBweUhBazZxQmp3NXZ5VythUk5mbVczaHlacExUQWhCR1Fn?=
 =?utf-8?B?UVRKcGhhRk5LU3Y2T0ZJYjBXOXQ5SVBOWXYxcVZPMmhRMzh6TzlDdmp5SzBZ?=
 =?utf-8?B?TjBxaS9JR2p6blJjNHNQbTQvVjBqRUNzWlBNNk9ySmVGUWd4MkQ4M3QveGRZ?=
 =?utf-8?B?N214dnZ6Q0ZnTzhsaFFIWE43WjhCN1VpTVY1enk4aCt3aWUrUllhTmttcUMz?=
 =?utf-8?B?Y096UDZETDY2VWIxbW9OVnZGQlR3b0s5dzJJdDlXMlY2QUVQdjBYdHVUVE11?=
 =?utf-8?B?aVBPdkJpdW40NEplRis0YlZtRHVCRFpUNTNSeUhaQ2Z2aUpKbHlvcVpTYkM4?=
 =?utf-8?B?bDEvd3dhZDBhLzEzbC9tRWNiRmNacjJ3d3FQK2JWV2E2QVhQbTh5enQ1RExy?=
 =?utf-8?B?cFVCQ21KY3lCWXJONlpvbHFxeGFqK3ZKUXhFS0swMjVaRDJ2eTB5cUg1MGxm?=
 =?utf-8?B?L0Q3aklUQXJudTZHM0I1Z3VkeUtsQ2R5eTJlSFNQdkc2VFYzUUp1VVlIRmJw?=
 =?utf-8?B?VGEwaDUwYyt5blN2MlpveUt6d3dzQldmMWpISkhrUHdheStEdG5mejM3QnhF?=
 =?utf-8?B?TEhSVUhQSHZuTEI5Sk1WRDlFNTFXNEp1eHlDWXVsR1VDc20zeXB4ZjJIU2JW?=
 =?utf-8?B?WGZHR3JhOFBBRTFWYWdoTlYzWThxeFRHZUx2ZnFrM2xsUC9DbEhWaGx3ejJD?=
 =?utf-8?B?SjVPL2JJL0RFbFNsTU1lRVc3ZHhEdGVaQy9yeGswUDcyR21ESWJ4ZDhiay9u?=
 =?utf-8?B?MTJMdCttN0t0ZGpQMk5RamxaSEZ6OXdFcGNjbGw2QVNwc2VhSkMxWnEvck81?=
 =?utf-8?B?M3JYTGNpOHpteG8vZi82b0FBd1VDRjdIVGthZTR4TTNTVjkyYWRueWRZUy90?=
 =?utf-8?B?cWJGSDhNUnFxYUdQd2NYMGtPK3VONWRpME9GVzJpcTF1Y0xtM2dXdEorUzVx?=
 =?utf-8?B?YTYxZkVxMUhmM1RoaXRLWkdXNzkrSUpiaktSUXpJdHNpVWE2ZXhCemlpdWtZ?=
 =?utf-8?B?WEhObEJ5VWZMVFFEV3lLWllyL3ZBeVJrbzdjTW96c0xScnBMNElDakdhUzBG?=
 =?utf-8?B?MWJpSFE0Y2tTRkZLSlVFRUdjL3VvQml6ektIVjBaN0VMTUFXNXpCN2dvald5?=
 =?utf-8?Q?WUnQbq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2kxYnNXbjYvZkNOcitxZnFPeTRIREhpQ3pwVXZyejBjb0RYVis3MmFvbURY?=
 =?utf-8?B?Z0prck5KaTVEWjZWb2xUZ1ltWktWWVVpSVExU3RWOVNuTU1LTzFaSFR1bzQ2?=
 =?utf-8?B?UnZWWHN1U25WMkRhMDk5MmJTdjVXeGthekI0SjlGUDNiNDZ5OWEvMWtyc2dN?=
 =?utf-8?B?Y2VrUGsrcFdlZmk3ekkySHh5ZWNOZzI3di9RL3hFMmRUbWlMZ2VJNG5RNUV1?=
 =?utf-8?B?ZHpsZFpXR0IvakhTbEJXR3ZxR05lZktYZFFWbC9QMERTY1ZtejNXTzQ2bkxV?=
 =?utf-8?B?VWpjVnZXVHdBRTYzVWczN2JBSWFXdEFpODYzN2IxWXFmWXFzRXROczhIUm5r?=
 =?utf-8?B?MnVzNk1ZZUs5aVIvcFh1bFFCZ2R3LzFBSVU5OHFyZWJuNy9GYndnUW1RbnJW?=
 =?utf-8?B?OVhPUjBKZi9OaE42dDF1R1VNK3VibEZuTkc0T290VEFreFhrNFg5T0xxRkFV?=
 =?utf-8?B?cEtqRUtOMEdnWlZYZUsvcmxyZVlXMjB6TVk2RlBaRHo3K1BuNUNmYm5oRE9O?=
 =?utf-8?B?NWNzTlYwY2pTekYweDc1dDdEZFhMaWhsS0grb254WTN2TUlJalYvSGtpeWVS?=
 =?utf-8?B?TzRqamtYWFZDSXFLWU5Sa3V4Vms1Z20zekpoVCtOaG1BQndETDA5Mkw0NXY5?=
 =?utf-8?B?K1FwRVA3dE9HS0ZFYzlCemVSREtRd21ueU9lNWpWWFpyRjRVM01WdHBTMmpz?=
 =?utf-8?B?bmlXcEM2dGFZY05WYmk2ZlhmaTNUbnNNQk1tTzZUckFYNk1YY0JPcG5BbHp6?=
 =?utf-8?B?bElOYmx4WXg2dXB5dmZ0UWFkbFhJblpMSGhBcjdWZmhRZjRTZ3o4bkxicmth?=
 =?utf-8?B?NnhNU21WczFqQ1NZVHJWZ3BNQ2xGUkl2bWU3SGJWMXpNQmdpdWtiWWNZRnZR?=
 =?utf-8?B?QWRiMUhLeTRDRWRDWUFocmd6RVh1NUhzQVk3RHFqc2x2dUZVK2FIOEpOZGFw?=
 =?utf-8?B?cGRwK3hyKzEwL1hnRnE5M25GMno0bHFPQlBIODlJaHdnV3EwWjFFWHNydExz?=
 =?utf-8?B?UWlJVHkra3ZYMnRoZGpQOXZrWC9yMDJPWXpaV1M4WG9mSnlVdTZnWlhGRFFk?=
 =?utf-8?B?M0VlMXYrci93dmRDK3NLeUZsQ2RIcWhsSC9pdDNPYldVdlFJeHNHTW1MSE5Z?=
 =?utf-8?B?NzB3ckFCbVdlenkwdUtaekF0SW5uWjhNeGJJakVNWW05UlFNbFBjZVdNMXVG?=
 =?utf-8?B?eHRTZ2pEUENNYnJwVXhUK1VnTmwvbk55SFBuKzM0WjgxWnNSUUVReXhEOW1q?=
 =?utf-8?B?TnNmbFBYc1hxK21lMlV5aHdKOXJ6NW5oWHk5SkdSY2p0dkQ2OG9RQWFZVVFD?=
 =?utf-8?B?K250azE3L1BvRHlaMllxYmNKVk13REZYMGx4b2w4N3ZTdFVNdWMyL1BmbERk?=
 =?utf-8?B?ZEtvOGxSeXpVQ2ZFbG1mbFVtWDBjTnYzdnpnM2VndGJpZkV2VCt4VDAxaEg2?=
 =?utf-8?B?RzhOWlZ1c1FmUDRSMkhoakVIOWlCeTliUVBnS2liL3I1MGdCbzAwOUM2V3hP?=
 =?utf-8?B?ZTFGYVpOQUdyczE4Y0JsdXljbi9mQ1lZdXNnT05LYWRSd1dLMzk1aGZhOC9x?=
 =?utf-8?B?QXJOVW5NWUlCcTVCSTd3VmVNWmVzUHJadlNxaFZTd3pRWis5YkhEWXlhMiti?=
 =?utf-8?B?Q3FDZzhGTmtkZ2tyY29zbzBqRVB1YTcwNkhPc0tKQTh2UG8yc1B4Y2x1Rk5y?=
 =?utf-8?B?YkpSd0F5Q09QQ0U0eW1xTDNhNlczdGo0Zi9GRlNpS0JIRDZaRmg3U2gxVkhO?=
 =?utf-8?B?bmpMRmlFSTQ2blZUOXBueHZXa3pSajQxblRGODB2QkhlUkpUNzkrVEZGYnJE?=
 =?utf-8?B?Y2JmRWhvUFJkNzIvRkorZ1UrSEcrZk81SjJOUEtWUFRDTEFPKzhJOFVJQzYy?=
 =?utf-8?B?blg4V0J4Y25pMVFaMFNJeTVpWUpNb1lPMlJ6SmJNNnZTVUFRY3ZZZE9wZzdj?=
 =?utf-8?B?YXlXUDBkRUxWczlLQ1ptN3FRK0w2cVp5M3RSN2JGMDFBTkdJNUp3SkxGMndj?=
 =?utf-8?B?eFdGKzR6R2hudTR0UlRualE0WWlsZDRIWFRqT2hiNWIvdE95eEN0MVVINXI5?=
 =?utf-8?B?OHQ0ektwRFZjN2NxY2VvZ21LamVuMzNSUEVWTng5YXM4bk9TZmNPYlYxSjQr?=
 =?utf-8?B?U2paSXFYd2I4QzNXSStTdDkwV0pGR2dUZ3VvWEM2UUpNUGxaOXpKWG9ZT2VS?=
 =?utf-8?B?K1lHbDY1aGJVczRYT29oemh0YVUvVGRKOG80M3IyaVRSSFRPY3dxQnJuajBQ?=
 =?utf-8?B?NlVRRitid1lLa3hiZHl0NStVaDBJako0UEpJQWRxOWhkVXY4VzBWQ0Jyb1I5?=
 =?utf-8?B?NzNYbndjdXJJd014M3VXdVNUYmZuZDFzcjJITmw1UmRpQjdaaVdVS1dxbzVh?=
 =?utf-8?Q?TVFQZ0kxZf+0lSkE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2460446-4e1e-4374-dcf7-08de59bfd9a0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 14:09:26.0920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unqDnnFJDdU4XVpXlxYm38EBIlZLKyosxoA/QtV8Fd3Js98N25fjxrZRVCP5Klmg9Rmv6JPuuT0VEogUYidMWWq361RStuz5Zm/AQwaAee8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4518
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



On 1/22/2026 12:56 AM, Shuicheng Lin wrote:
> Module init abort is fatal, so log it with pr_err() instead of pr_info()
> to make the failure visible in typical log-level configurations.

we had discussion about pr_err vs pr_info in the past [1] @Rodrigo

[1] https://patchwork.freedesktop.org/patch/665883/?series=151773&rev=5

> 
> Also reorder internal includes to be alphabetically sorted.

shouldn't this be done in a separate commit as it is completely unrelated?

> 
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_module.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index a0048f64ed12..3344811585ff 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -10,13 +10,13 @@
>  
>  #include <drm/drm_module.h>
>  
> +#include "xe_configfs.h"
>  #include "xe_device_types.h"
>  #include "xe_drv.h"
> -#include "xe_configfs.h"
>  #include "xe_hw_fence.h"
> +#include "xe_observation.h"
>  #include "xe_pci.h"
>  #include "xe_pm.h"
> -#include "xe_observation.h"
>  #include "xe_sched_job.h"
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> @@ -157,7 +157,7 @@ static int __init xe_init(void)
>  	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
>  		err = xe_call_init_func(init_funcs + i);
>  		if (err) {
> -			pr_info("%s: module_init aborted at %ps %pe\n",
> +			pr_err("%s: module_init aborted at %ps %pe\n",
>  				DRIVER_NAME, init_funcs[i].init, ERR_PTR(err));
>  			while (i--)
>  				xe_call_exit_func(init_funcs + i);

