Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D371ED232D3
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jan 2026 19:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9346810E030;
	Sat, 10 Jan 2026 19:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vr5dTs3t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC6310E030
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Jan 2026 19:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768072970; x=1799608970;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=e4jChJ2J4cjhkl0x6pI/wLcgYpv3dFASBiNkX1J5sGU=;
 b=Vr5dTs3t5JrW6rBJSrJEE4lNyKD71+pzHXEqPvqv1RuFZn8eHurvkKc8
 HTCgcDUr05FhWa7GfbvR5do6m/1OQ/GMNpnwuy+5Qzrx/MqP7VaPxMXMT
 lcx0PY9TlcZtvsuFMxFPYaPzyCBgNef1ZzAOp/0RRHy9/331rQuUeVvzg
 8YlGIEd7Yj9WbUe3nZsB8/f/iOUNJUxkAlSchhzfIbZKcR3MKYdTc7HKd
 K9VL7xsTjI/FI8oStZzmzkvVVXWHQa8TfUgWycb2n0D8eDLUyAG1jwiBM
 hd7AQr1YIc05ScBkUut8ujKL4o42O/6aITvhKtrA01Frj5csKD6NGDSa6 A==;
X-CSE-ConnectionGUID: F7o/ruvDSO+mMTERFClR1A==
X-CSE-MsgGUID: YnGlpSNDR7Sa4VkYH9yGwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="80868839"
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; d="scan'208,217";a="80868839"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2026 11:22:49 -0800
X-CSE-ConnectionGUID: aGlm0IJaSKW/W2TvJdDLlQ==
X-CSE-MsgGUID: EOrKpQfNTaGI8rC48SOsvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
 d="scan'208,217";a="234432396"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2026 11:22:50 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 10 Jan 2026 11:22:48 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sat, 10 Jan 2026 11:22:48 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.44) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 10 Jan 2026 11:22:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOYxib7kZN8l6Q+yWj1aLTXgIWRXTN00PAvWdZg09g2QIE34TcaEVyXZOyYiSagN7YXUAGi1EMHeDJjwqbwdiQycu9TugJZIH04eCOjoMk65qXwpUj9sxebk4aeKSEhiUBaS6P/d8vuXH8UMH/mzsjqdCabCAseMy75WByfGanLFLvEZjTuGF4U+Gj1KV2Bvxm2huEdnJRWTjE/sB8sZC3NU9ZgVmMIJerEDibMXx6EDWTyz75809TxAQpq+wPq8F2vBKhPRXvpIDe3wicscfWV9RLwk49npq7oRS8Mtv4e0yrHm/Ui5NfSCTiMFc86yMr6pn7M7iTsgHTL6CicTkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5SK+ybCV8FwrnSSANGxD0Axm9JL5ARFn/1dy/XIFn4=;
 b=ZjQzXRBFqq80+7mDaluUWjKh5dYxEumX3S0CKQiK2SrKo7No0XTznP6qmfBYbtjFQDChQ1ueg6oIB41ffDq1u/Vkk5IhPejbyyoVqzw92hzh2wcKlpjWbsJmGXIfBVXJdwXAS35TlfUgDqwtJH/iq5ujJtw027F2OfwAQfsTN+0qzOCmgDzE7qZ+eZgCppNY43i2lgQHQviBSH8XefX488z+VRCdye0DMmdvZxkS37WrE1QowGhUs4YMDN1TLxvobg/9lEVBXOSBLY80RwPf555v8HwKhCFiWWaZxB0xo9K4U70W8xi1H2dMtSmy/iouuXv+KwyxcmGaPQndtuP7BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by PH0PR11MB4824.namprd11.prod.outlook.com (2603:10b6:510:38::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Sat, 10 Jan
 2026 19:22:46 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%4]) with mapi id 15.20.9499.005; Sat, 10 Jan 2026
 19:22:46 +0000
Content-Type: multipart/alternative;
 boundary="------------KyZYybX1xEP01ca7Gyu3LmeS"
Message-ID: <79952244-7068-4d03-b142-aa15c81e2b59@intel.com>
Date: Sun, 11 Jan 2026 00:52:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] drm/xe/hwmon: Expose individual vram channel
 temperature
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>
References: <20260109201644.736483-1-karthik.poosa@intel.com>
 <20260109201644.736483-5-karthik.poosa@intel.com>
 <aWJ9EK0bi7f6WNRH@black.igk.intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <aWJ9EK0bi7f6WNRH@black.igk.intel.com>
X-ClientProxiedBy: MA5P287CA0112.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::15) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|PH0PR11MB4824:EE_
X-MS-Office365-Filtering-Correlation-Id: 844de272-6870-491b-7113-08de507da26e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1JOMjNIbGJzWnlFVmhnZnBQdmcrdWE3eVg4dThZQWhaWms0cU1VUnROdmJq?=
 =?utf-8?B?UTQ0VE94cEtFNGphY3F0WisweHhVWS9pcjFTa1ZHUzdRTTJUWWdvR3ByOHJR?=
 =?utf-8?B?bHhWZ0QzRjVGRXd6TVlhQzVUa0ZXNzRVTFc1MXZRYld2NnJGOXhIclF3TGMw?=
 =?utf-8?B?WnVPSGV5eE9UVmRVNDEvSzlXWUJsb24wZHpndEhtQnczSUxrVlRvaVRGTnE1?=
 =?utf-8?B?WWxDdTVud1Y5cDV3aWY5UHl2OFdqNTRtZGUvWHhQYTdFQ0VmV0FaOWxrRVZi?=
 =?utf-8?B?b0VMRGYzSmJ1dlNFazEvRHZPWHE0SWw5YTZOTUNZczdkbGNVUll4RVZhVzRo?=
 =?utf-8?B?UDFzTXZxc0prZUYxMTd6bHRadTdqZzhuV1lqelo0ZEtUR1NGTTk2bHVsc1lG?=
 =?utf-8?B?SjN3VVhRa1pydUZaUmUzdDlXNmtubVpTL29USStCWlpXNVFnbEVxT2t3OXEr?=
 =?utf-8?B?N2dIYmJYUDZlZjRjY21MQ2lrS1ZUc2psazkvbVAvSFJ1cjBQbFBjZ0VIckEw?=
 =?utf-8?B?NnZBQUUvUFZyU1VQTkZsMjdEVHI2MjRpWHJHYk01a1hnRjNEdzVoaUo4anRo?=
 =?utf-8?B?UFV5UFFWcUdmb3ZrSDQ0alhTUTlIeGZDL2dVNzRnUHUyOGFRQnUwOVpLUldY?=
 =?utf-8?B?ZXVlWUk1dk5scWp1UDhZU0o2dUFZU1B5Ymd5ZUZSUHVqWEUxempFbjBFeEFy?=
 =?utf-8?B?aUVBWGpITlZFdE5YdUJLWWoraW5MZlBibVJHNzk2UDl6K3prbUtKZ0VLTlEr?=
 =?utf-8?B?MEFEQlBIb1duY21SRWlsOFNaUHRUSGJjRWFSRk5ubG9lYnhWUWR5S0JjYXZt?=
 =?utf-8?B?eWZjTlhGM1VtY1IwQ1l0ZVRHTXdzeWdmQlRqc2dlREY5cTlNbWJPcWNDd3Z6?=
 =?utf-8?B?QjVXZEtkQ1hsYVkvajJxNzZKd2VrZG85MXhnTGwxSmVuN2x6bG91Si9pVlgr?=
 =?utf-8?B?V1NJRDd1Z3FiOUFtUVp1S1hzWlRLRllkVVBDRXFEWENlcGc3QUYzQ21wNEpQ?=
 =?utf-8?B?OGZsWXV0cmdkZEo3cU1LdGdtZmZzazcwOVZYRVpVNzhaUDdFMVU1L1BJKzFR?=
 =?utf-8?B?blBTV25tbUJ6ME96a2crdnN4UkhuUlIxZlJxMjNsNEVhZXNhVkRQdzJWc2Jj?=
 =?utf-8?B?RDRLbUpIZmxUM3FwQmo3MWNEY1Q0RGxjM2V3TU5FeXJpZHBoR0JtY1BnVnAz?=
 =?utf-8?B?am5UQXFhdGFoWlFBby9VdVdQdmNZQ0c4SFdxVG9aL1VTN0hnVWpsUFA3ZVU3?=
 =?utf-8?B?QTRmcVNheXBwdEt0b1d2V01md2EwZVFiUXZRWWlNZmFsQ0NJbkdZcTc5cW53?=
 =?utf-8?B?OHQ3NzYrSWxlS25oQ3NySGdJTlRnT2lZaEEzTkpEazFNSGFvZThXbnpEVVRv?=
 =?utf-8?B?MHhDV3FvWWZ4M1pqVDRLV2RYMzBNV0lXSlJLUWVIOUorcGhmZWRudElaRUx4?=
 =?utf-8?B?emh0N250L3cwaWNjMWtRS2Q0Y2x3UTNrSEhGMm5vWWdtWURLZHlIM0FwNTBl?=
 =?utf-8?B?Q1lIUVpRT3RjZTJ2RGFVMklTTXV3V214amx2aTBkYkhtaEdPN3dXTjFrOHdh?=
 =?utf-8?B?TUxFYzhDa1VSTFYyNm5xSjdzbXY2bTVSZ3pBU21ITFBJTnlzbjRBOVYwbWVK?=
 =?utf-8?B?Q2RsOG80cHdyY3hFZUVmWGFiKzFlRXkzbkNrMGQ2RXdEZG02S1MyM2ErZVpy?=
 =?utf-8?B?Smc4Ny9GY0NQREo1d0FuM045N3FERGtMRHNPMmlPdy8vY0dram5JSENSdkZr?=
 =?utf-8?B?Yk1HZlIxVVRLcWpBbkFYRjhIWElTdnkrcy9vSGJPenZ2RzRxQ0FGVlorSFB5?=
 =?utf-8?B?TWJFTG1IbmY4ck9SbU8wQXRzVEFqWHRkWlVkMWUxTTFwVERrM2dyWTg0VnBY?=
 =?utf-8?B?eFpLSzRBZ0xrQmFlRTluZks2M2hkVDlGVmhKcVVTTEFsQVNMSkVDRnNBcXU0?=
 =?utf-8?Q?VSObXqh4Bf+8tldDJHt9oCF8rGb1xyDL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVIvTUtIZFBvV1RnUkltNmtGMDNIVjc0M0FtUlhabXBEendWdlJaMWszTExV?=
 =?utf-8?B?K2QwYVkrWWk3aTVsTis0UU9WdWpXbU10cEc1QjdJdEwxUlBPYmRkWjlTQzhu?=
 =?utf-8?B?UUZvYlorYzJVQWZQekZjWnA2K05TVkVUamd1RDV5U3cvcmtPb0NUU1c1MzlH?=
 =?utf-8?B?VjhzTGxhdk5FeE5IY1VjS3Z3cDZYUEVkenludzlGRW5LQ2UzdGNZTlcyWUZs?=
 =?utf-8?B?b2U5aHVMcHNLeDQzL3NPWTNhSWNoSTFxZlVmbTJ6TkJkTVlzRzc1dlpSSHVo?=
 =?utf-8?B?WFpTcnVnU0U5M2V5aGNyNG9UY25qUjhVK3plVTVQODgxVkNybVhBZk5QNCtk?=
 =?utf-8?B?UE5SR2ZxU2RmVHQzby8zdENwVS9sN2ROM0lHQ0FnNU5Pa243RVA1S1pZL3Uy?=
 =?utf-8?B?T3RPU0h2YlRFWkZ3eENMVkM5SGE4ZGQ0L2U0cndHbmY5cHB5Vk04RzdQZ1BF?=
 =?utf-8?B?RXNuS1FwMGc0NGMrbUtlVTcxajhJSWNlU1dxNFhIZ3M4Qkd4VkFiQllDNzdU?=
 =?utf-8?B?b1dLZnJrZ2lHQ1ZNRUhxay90UUZacTZLWUNmY0FIUWNZMkVtTTJlS2pXcEhp?=
 =?utf-8?B?UGFYQ3lQU2JoKyt1bkFhcGRQWlVpQ2Q5ZzgrQjc4Nm9PV2JhZDBTQzJXTXdP?=
 =?utf-8?B?V1VBK2VPTW4wM01VNG8vTGlWUDFnMnI5ZjlPZUJ1ZHczRTFRNkNmUERrQWNz?=
 =?utf-8?B?TC82VVpoTEJ3bmExVmtFRFVEU05zdWFjV2hlbVdGV3U2WEFVa1BtV2pCNlJM?=
 =?utf-8?B?WUZ4QzlRZ1NqMThWYmd6M0t4VC9ZVG1UaDNEclhDSjhWZStMaG10T2FDdys3?=
 =?utf-8?B?aHVEa0NSQUw4WFFvMlNvNTIwbS9uSUgwTTRlUE9jTE5aeGgxU1k1SkhzMjNS?=
 =?utf-8?B?Z3ZNV3lWUUtQc2NFVEY2alFYQXRDMzZBZGV3U0RUNkZZUjg4MTZDYkMyYkxC?=
 =?utf-8?B?emJJVlljcThUSVhsSUpNRWF0QVM3VjBQYXB1MzdVeDIyWjNla0Y2ZXBwbHBC?=
 =?utf-8?B?bnA0cmZUUVoyK1ZsYnZ5R21rVDM0MHJpaXI5N3NRM0ZBaklUUytxWGN2R20r?=
 =?utf-8?B?d2dNandpYW5LaWphd2RjamFHSVdYNDY3NHU4ZkJuOFhJdlliWVRRTGtVeHg1?=
 =?utf-8?B?b2ZHNHVLN1NheDdWY042N2p3ckxjaUR3dVVzZlNWU21jKzFYd3lzdkoxNjJ2?=
 =?utf-8?B?VlROWDJlRS9EeWF5cHdlQlY5UjE0THF1Mk5sTjRzb2phU2R3NDJxOG1rZkJl?=
 =?utf-8?B?UzU1cldDRmcyQnQvS2QxblVwWktQSU5yRXRDYXp6Z0VPMUxuR3JWMHF1Nml6?=
 =?utf-8?B?NFlreU9mTzR6aGJteTZuYW41dTY3S1FOa0V2aUJNMUE1UXl1OGNvWVNwWTZ2?=
 =?utf-8?B?RE96YkJ0cElzckdOYUFGbU1kUVBNcnhQbUdySFlmQWpWTHR2bE1rc09OSUJH?=
 =?utf-8?B?ajRWZXVhaVA3VjJvMnYwb0pJZ2xoSzE4OFBNWkNncXhTSUFNenluaENiZG83?=
 =?utf-8?B?NkJHMjByYlIwTkp3dHpuekNiT2FYbnJiVExlU0M3em0vWTNyaVJxU1h1akRV?=
 =?utf-8?B?RWNsNmZiSjA2eDBtWVBGcitnQzRhZnc1YStBT05tcjErM29WdEErdFVxK1lu?=
 =?utf-8?B?ZnhTQTM0SG90QzBaM1ZJRTdaSHBqemU1b0xlMUJjcWtpeUFwRURrTHBYUjNu?=
 =?utf-8?B?enJ4UVhibUN1WWdlSENxdE16SVRlNmxxQ0NGbTYvMDJBbHJYUjgraWZqNXNp?=
 =?utf-8?B?L0ZseWVnOXVjZE5xVE53VFAxQ0pHMWhkcGRZOUV0TnBhZVE1OVQrUjhWeVNB?=
 =?utf-8?B?elQySHFEL1JseldKaXNjV2lpSEo3MXJMZHp2TTB5Z1R2ejE3eDJkNnZrd0Rw?=
 =?utf-8?B?ODFONitFQTlQNzc4UE5TZ0x2eDNObHgrZ3R5YUFFb1FXWWZGMG9HeXBRVDhz?=
 =?utf-8?B?RTlLVGxVWGNCcXBJQnc3SWxWQjZsMUpWNFZmTXpoaHpjaTVxM1QzdDVlL3cv?=
 =?utf-8?B?NVV1TTRzK3A5ci9yd0J3NmJnY2srOTRTVjhYdEdBWUdaOWZOMVRxaXlRVFVt?=
 =?utf-8?B?b25pNVpoTzhOblRub3BMelNCNXBXcGxPYjU4bEZCUC9JZ2dMSzRUL0Q2U1pD?=
 =?utf-8?B?eW1LdGgzeklGMW45Tjd0bi9BM3NZOUt1amdUM0ZvUkxQOVBTOFhIbUgwdTBL?=
 =?utf-8?B?L2o5SGZ4dWJuRzcrQ08xeERRd0ludmFKR0VCZHFKRHBQR2RhWGV6aE9DSUVD?=
 =?utf-8?B?ZERWQWczTHFtM1l0L29id0tXT2V3WG9yV2krNzF5dWVsWG9YM3RnUFJwQlU4?=
 =?utf-8?B?eC91UGp2LzNTU21QSW1jcXZwbHhBYTEwdFoxSGMyTTN2S0lQZDFsdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 844de272-6870-491b-7113-08de507da26e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2026 19:22:46.2960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZWXq2MmPgjcvwL784a2FS0sUwInqR1N0KV5R/KlkxnEvFJo8Euz20aQyLwuR+bKGfvg3lmTEGKBEDxqlUGYSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4824
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

--------------KyZYybX1xEP01ca7Gyu3LmeS
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10-01-2026 21:53, Raag Jadav wrote:
> On Sat, Jan 10, 2026 at 01:46:44AM +0530, Karthik Poosa wrote:
>> Expose individual VRAM temperature attributes.
> Please also use 'VRAM' in caps in patch subject.
>
> ...
ok
>
>> @@ -257,6 +264,9 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>>   				return BMG_PACKAGE_TEMPERATURE;
>>   			else if (channel == CHANNEL_VRAM)
>>   				return BMG_VRAM_TEMPERATURE;
>> +			else if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX)
>> +				return BMG_VRAM_TEMPERATURE_N(((channel - CHANNEL_VRAM_N) *
>> +								sizeof(u32)));
> Make (n * sizeof(u32)) as part of BMG_VRAM_TEMPERATURE_N(). With that
> perhaps this'll be a single line.
ok
>
> ...
>
>> @@ -890,6 +916,21 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
>>   	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
>>   }
>>   
>> +static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
>> +{
>> +	struct xe_reg vram_ch_temp;
>> +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>> +
>> +	vram_ch_temp = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
>> +	if (xe_reg_is_valid(vram_ch_temp) && xe_mmio_read32(mmio, vram_ch_temp)) {
>> +		/* Create label only for available vram channel */
>> +		sprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N], "vram_ch_%d",
>> +			(channel - CHANNEL_VRAM_N));
>> +		return 1;
>> +	}
>> +	return 0;
>> +}
> I'd write this as
>
> static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
> {
>          struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>          int vram_id = channel - CHANNEL_VRAM_N;
>          struct xe_reg vram_reg;
>
>          vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
>          if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
>                  return false;
>
>          /* Create label only for available vram channel */
>          sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
>          return true;
> }
I'll agree with vram_id and boolean values, for readability,
other than that I would like to stick to current implementation.
>>   static umode_t
>>   xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   {
>> @@ -903,6 +944,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   		case CHANNEL_MCTRL:
>>   		case CHANNEL_PCIE:
>>   			return hwmon->temp.count ? 0444 : 0;
>> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>> +			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
> Shouldn't we also check hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN]?
that can be secondary check, then this would apply to all channels !
>
>>   		default:
>>   			return 0;
>>   		}
>> @@ -915,6 +958,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   		case CHANNEL_MCTRL:
>>   		case CHANNEL_PCIE:
>>   			return hwmon->temp.count ? 0444 : 0;
>> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>> +			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
> Ditto, hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT]?
>
>>   		default:
>>   			return 0;
>>   		}
>> @@ -935,6 +980,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   		case CHANNEL_MCTRL:
>>   		case CHANNEL_PCIE:
>>   			return hwmon->temp.count ? 0444 : 0;
>> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>> +			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
>>   		default:
>>   			return 0;
>>   		}
>> @@ -963,6 +1010,16 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   			return get_mc_temp(hwmon, val);
>>   		case CHANNEL_PCIE:
>>   			return get_pcie_temp(hwmon, val);
>> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>> +			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
>> +			/*
>> +			 * This temperature format is bit 31 for sign, bits [30:8] for whole number
>> +			 * and bits [7:0] for fraction
> Nit: "Temperature format is 24 bits [31:8] signed integer and
> 8 bits [7:0] fraction."
>
>> +			 */
>> +			*val = (s32)(REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val)) */
>> +				(REG_FIELD_GET(TEMP_SIGN_MASK, reg_val) ? -1 : 1) *
> Since you're already casting it, I'm wondering if you need to check
> for sign?
|REG_FIELD_GET() returns unsigned type, which gets stored |the lower 24 
bits of an |s32|, discarding the sign bit; consequently, negative values 
are interpreted as positive, requiring an explicit sign check.
>
>> +				 MILLIDEGREE_PER_DEGREE;
>> +			return 0;
>>   		default:
>>   			return -EOPNOTSUPP;
>>   		}
>> @@ -974,6 +1031,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>>   			return 0;
>>   		case CHANNEL_VRAM:
>> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>>   			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>>   			return 0;
>>   		default:
>> @@ -987,6 +1045,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] * MILLIDEGREE_PER_DEGREE;
>>   			return 0;
>>   		case CHANNEL_VRAM:
>> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>>   			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT] * MILLIDEGREE_PER_DEGREE;
>>   			return 0;
>>   		default:
>> @@ -1356,16 +1415,20 @@ static int xe_hwmon_read_label(struct device *dev,
>>   			       enum hwmon_sensor_types type,
>>   			       u32 attr, int channel, const char **str)
>>   {
>> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>> +
>>   	switch (type) {
>>   	case hwmon_temp:
>>   		if (channel == CHANNEL_PKG)
>>   			*str = "pkg";
>>   		else if (channel == CHANNEL_VRAM)
>> -			*str = "vram";
>> +			*str = "vram_avg";
> If you look at the readings this is actually not average, so it's a bit
> misleading.
>
> Raag

what is your suggestion for that label here ?

>
>>   		else if (channel == CHANNEL_MCTRL)
>>   			*str = "mctrl";
>>   		else if (channel == CHANNEL_PCIE)
>>   			*str = "pcie";
>> +		else if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX)
>> +			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
>>   		return 0;
>>   	case hwmon_power:
>>   	case hwmon_energy:
>> -- 
>> 2.25.1
>>
--------------KyZYybX1xEP01ca7Gyu3LmeS
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10-01-2026 21:53, Raag Jadav wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aWJ9EK0bi7f6WNRH@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">On Sat, Jan 10, 2026 at 01:46:44AM +0530, Karthik Poosa wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Expose individual VRAM temperature attributes.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Please also use 'VRAM' in caps in patch subject.

...</pre>
    </blockquote>
    ok
    <blockquote type="cite" cite="mid:aWJ9EK0bi7f6WNRH@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -257,6 +264,9 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 				return BMG_PACKAGE_TEMPERATURE;
 			else if (channel == CHANNEL_VRAM)
 				return BMG_VRAM_TEMPERATURE;
+			else if (channel &gt;= CHANNEL_VRAM_N &amp;&amp; channel &lt;= CHANNEL_VRAM_N_MAX)
+				return BMG_VRAM_TEMPERATURE_N(((channel - CHANNEL_VRAM_N) *
+								sizeof(u32)));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Make (n * sizeof(u32)) as part of BMG_VRAM_TEMPERATURE_N(). With that
perhaps this'll be a single line.</pre>
    </blockquote>
    ok
    <blockquote type="cite" cite="mid:aWJ9EK0bi7f6WNRH@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -890,6 +916,21 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
 	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
 }
 
+static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
+{
+	struct xe_reg vram_ch_temp;
+	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon-&gt;xe);
+
+	vram_ch_temp = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
+	if (xe_reg_is_valid(vram_ch_temp) &amp;&amp; xe_mmio_read32(mmio, vram_ch_temp)) {
+		/* Create label only for available vram channel */
+		sprintf(hwmon-&gt;temp.vram_label[channel - CHANNEL_VRAM_N], &quot;vram_ch_%d&quot;,
+			(channel - CHANNEL_VRAM_N));
+		return 1;
+	}
+	return 0;
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'd write this as

static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
{
        struct xe_mmio *mmio = xe_root_tile_mmio(hwmon-&gt;xe);
        int vram_id = channel - CHANNEL_VRAM_N;
        struct xe_reg vram_reg;

        vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
        if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
                return false;

        /* Create label only for available vram channel */
        sprintf(hwmon-&gt;temp.vram_label[vram_id], &quot;vram_ch_%d&quot;, vram_id);
        return true;
}
</pre>
    </blockquote>
    I'll agree with vram_id and boolean values, for readability,<br>
    other than that I would like to stick to current implementation.
    <blockquote type="cite" cite="mid:aWJ9EK0bi7f6WNRH@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> static umode_t
 xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
@@ -903,6 +944,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_MCTRL:
 		case CHANNEL_PCIE:
 			return hwmon-&gt;temp.count ? 0444 : 0;
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
+			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Shouldn't we also check hwmon-&gt;temp.limit[TEMP_LIMIT_MEM_SHUTDOWN]?</pre>
    </blockquote>
    that can be secondary check, then this would apply to all channels !
    <blockquote type="cite" cite="mid:aWJ9EK0bi7f6WNRH@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 		default:
 			return 0;
 		}
@@ -915,6 +958,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_MCTRL:
 		case CHANNEL_PCIE:
 			return hwmon-&gt;temp.count ? 0444 : 0;
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
+			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Ditto, hwmon-&gt;temp.limit[TEMP_LIMIT_MEM_CRIT]?

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 		default:
 			return 0;
 		}
@@ -935,6 +980,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		case CHANNEL_MCTRL:
 		case CHANNEL_PCIE:
 			return hwmon-&gt;temp.count ? 0444 : 0;
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
+			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -963,6 +1010,16 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 			return get_mc_temp(hwmon, val);
 		case CHANNEL_PCIE:
 			return get_pcie_temp(hwmon, val);
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
+			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
+			/*
+			 * This temperature format is bit 31 for sign, bits [30:8] for whole number
+			 * and bits [7:0] for fraction
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Nit: &quot;Temperature format is 24 bits [31:8] signed integer and
8 bits [7:0] fraction.&quot;

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+			 */
+			*val = (s32)(REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val)) */
+				(REG_FIELD_GET(TEMP_SIGN_MASK, reg_val) ? -1 : 1) *
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Since you're already casting it, I'm wondering if you need to check
for sign?</pre>
    </blockquote>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px"><code>REG_FIELD_GET()
        returns unsigned type, which gets stored&nbsp;</code>the lower 24
      bits of an <code>s32</code>, discarding the sign bit;
      consequently, negative values are interpreted as positive,
      requiring an explicit sign check.</div>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5; </style>
    <blockquote type="cite" cite="mid:aWJ9EK0bi7f6WNRH@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+				 MILLIDEGREE_PER_DEGREE;
+			return 0;
 		default:
 			return -EOPNOTSUPP;
 		}
@@ -974,6 +1031,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 			*val = hwmon-&gt;temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
 			return 0;
 		case CHANNEL_VRAM:
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
 			*val = hwmon-&gt;temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
 			return 0;
 		default:
@@ -987,6 +1045,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 			*val = hwmon-&gt;temp.limit[TEMP_LIMIT_PKG_CRIT] * MILLIDEGREE_PER_DEGREE;
 			return 0;
 		case CHANNEL_VRAM:
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
 			*val = hwmon-&gt;temp.limit[TEMP_LIMIT_MEM_CRIT] * MILLIDEGREE_PER_DEGREE;
 			return 0;
 		default:
@@ -1356,16 +1415,20 @@ static int xe_hwmon_read_label(struct device *dev,
 			       enum hwmon_sensor_types type,
 			       u32 attr, int channel, const char **str)
 {
+	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
+
 	switch (type) {
 	case hwmon_temp:
 		if (channel == CHANNEL_PKG)
 			*str = &quot;pkg&quot;;
 		else if (channel == CHANNEL_VRAM)
-			*str = &quot;vram&quot;;
+			*str = &quot;vram_avg&quot;;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
If you look at the readings this is actually not average, so it's a bit
misleading.

Raag</pre>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <p>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>what is your suggestion for that label here ?</p>
    <blockquote type="cite" cite="mid:aWJ9EK0bi7f6WNRH@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 		else if (channel == CHANNEL_MCTRL)
 			*str = &quot;mctrl&quot;;
 		else if (channel == CHANNEL_PCIE)
 			*str = &quot;pcie&quot;;
+		else if (channel &gt;= CHANNEL_VRAM_N &amp;&amp; channel &lt;= CHANNEL_VRAM_N_MAX)
+			*str = hwmon-&gt;temp.vram_label[channel - CHANNEL_VRAM_N];
 		return 0;
 	case hwmon_power:
 	case hwmon_energy:
-- 
2.25.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------KyZYybX1xEP01ca7Gyu3LmeS--
