Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00280E909C1
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 15:41:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C06A10E4F3;
	Tue, 17 Feb 2026 15:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GD3yMpkf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B161D10E4F3
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Feb 2026 15:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771342905; x=1802878905;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=cCm9fzaRGfYbpWZUq4UUnAHhCvnhTkg3YIKDDidILR0=;
 b=GD3yMpkfHa+IDVkE8msHM4cRU4E9JIZVbgwDwoy14krZvXaRwJJYv6PV
 1iQ/O7XBOV16QGae3B1UTqkA740iAtExG714/pu2R/VcioADlI81PsZeK
 3UDPS2gznfFOObi+IbyAgwqG3js5fVOmiK7m4z7S0idS01wzlYEvHeFE4
 CGnOeR7uUdcVc0Out0g+lkzc8UXep+/c5g6fTORKHiqYR6fK52CWyAtsh
 G8kwGtSHwzAXZo9a6zSDeUd5ewUeNgBfZGFYpJ7HHwpeUj6PQaETtxzaF
 dzEMRpKhJ8F4bfO+tOA+LEA58JH4g2+dRrzIA3hsJhnWeUxjswAoh5pl9 Q==;
X-CSE-ConnectionGUID: duK70fJkTSyhKzabVXUHAg==
X-CSE-MsgGUID: uB/DYBayT6ePjCTD9krqDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72301239"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="72301239"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 07:41:44 -0800
X-CSE-ConnectionGUID: lFNy3M03RM6aKbt9SKtCLQ==
X-CSE-MsgGUID: oU2hhD2JTHWmpe7SKCNDeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="213150962"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 07:41:45 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 07:41:43 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 07:41:43 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.38)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 07:41:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrK96f4c/utVNKHjxWQ6d1Mm1W3UA0Bf8XWUHUrnIYUDcn48Jgtu5O+ptlZoMrjgojAcbD269gkEV43vv0WB0BtGFkg8rX+Wslop1Mo0AlYjc+qtDtDKmdoHxXP7gGskA41OYExrMOxRGGFT65V+IqDzEdgFMONkawJvyS1euG0f4P0VrTBBTO2E1T1xDknWAvKPjwwKrmlj4+GnzPCDZcRn0pOKgIgyzE10Dg6zdhnNaqYWAjxtuNwTG+tz1/eepLaTV1sNsmrjVWio9GY6+WjQR/Qt81xLY5YU6J91RvFv9gLp37O8F+wXpkYeFJFKYajYd8D7ziy+bG8xBDWbVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBoOseG63Si8EX8NfyK+Mutu92pxBV5DvmHdV2WkZQg=;
 b=FpiFGY11WVVhuj+vBDhslue3IDjo+O0DKh5kuUq62k5avVEzUBoOflFjDMkapIoK3jWqBE50bzu5PgA/HQFIn1u7nTw1WHEEJld8dDYdTdozRk1nOo1LSfamz34yzgaYOwq75jSgD0SetNh8kYCNg+tXKifu+utw6h+icLwOqFPkvDNLubVHNJAOpGtl5yaxR7owFVH/cLYktbZx1ScOO4FjyVEQGMGqQE4gNODdaAORgZymLfnyJmPghw+Wa+RmzTsWM/IdyScK43raejM7zjb6aumaCl8dsCoqYRQILiaPDT1PmBt7JFKjS10/jwPiHJzp4VBtWFBq08qA6s7X0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 15:41:39 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%4]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 15:41:38 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Sebastian=20=C3=96sterlund?= <sebastian.osterlund@intel.com>
Subject: [PATCH] drm/xe/pf: Fix use-after-free in migration restore
Date: Tue, 17 Feb 2026 16:41:18 +0100
Message-ID: <20260217154118.176902-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0074.eurprd04.prod.outlook.com
 (2603:10a6:802:2::45) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|PH7PR11MB7593:EE_
X-MS-Office365-Filtering-Correlation-Id: f8c91f2b-27c9-44cb-89ac-08de6e3b09f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2hBMkxTUFNmVmFnVXdWSlBVYThyYzFiUjlKY2RwUjIvOHJKMTdCeG9uRHlq?=
 =?utf-8?B?aGJhTWo3cUZ0ZWJ6ajRuNVREOVpZTUpXZUcrQ2xiT3RtK1BnL0ZiUkVYM2g3?=
 =?utf-8?B?K2Rzbm1taG5wMHRCZllnb1pJWTEzdy83UktvTTBPV3hvRVVYVFNrOUFIZ2J3?=
 =?utf-8?B?bG9ISzlUSkJwTnpPZ1U0Sk9TWGs1S0VKSVo2c2xsbzJFV2pUZXVZaC9jUDg2?=
 =?utf-8?B?QW5CcVBCMHRYRXBvZWlYMUdaSUh0RW9TS3ZIMkI2UEVxV1FEU0k4VnMxUi9O?=
 =?utf-8?B?RGtySjg1YVhiZUYyT1FsZElKalJRVitIN2pxaHFZT3NRckFkT0xWMjBmMVB1?=
 =?utf-8?B?WDQ3a3FnNVVHVHFxN2llazdkV1BnQ0cva1JpcUowM3Q4UzhGbGdVaUphcEYv?=
 =?utf-8?B?UjU5VXJsbnplWHJWNjVETHY2cW0rTDlQSjgwb3d4WGh6bDRHVEI5ZUxBNGNq?=
 =?utf-8?B?eFJSWGJmVUkvTVFJSktJajVXbkgwZmhucExUVjREMExtQkJqejl5K0ZNRFVI?=
 =?utf-8?B?ek5ZMm9nZDhLQnJoY0FuL1lld1E2a1JBYTdKVm5sMlZzVG5HYjB6TmZmS2FZ?=
 =?utf-8?B?WlN3SmMyaVRweUNrRE5KZi9wOHY0eXFvWnFXS2JTTEtCL1V4cjlaRU41RVYz?=
 =?utf-8?B?L0plcUwyM0hKemxJYlVSN01LRWhtRk84V1U4eEJnUmdKU1Z3cGcwTlBaNUpI?=
 =?utf-8?B?N1RaOGh6YjE0WHNCYTdpN085UG00ak9YdkJNdDRDbXpCeVpvRXExZ2NONzlt?=
 =?utf-8?B?b0l3R2c4cnp2R29IRHk0NFZ4TzRZZ1pPdXVyMkROMDk5WWJDdnZPYWo0Q3Zj?=
 =?utf-8?B?emY1bTlCUVJZa0NNQnB5VGxUQjBhVERaTnIyUTZQQkcvTHZob2tGdDRtejZZ?=
 =?utf-8?B?ZEhYOWpxTVAxTlF1d3ViK1hKdGZXeFRlTnU3Z0JoL0N1L0xNcTUrSGFrNUU3?=
 =?utf-8?B?TlNMTThuN1BsZlNMamlPa0l3SXhWUHNSZEFqT2FZSC9Pb0p0T2NiVmlYbTNF?=
 =?utf-8?B?d1ZqVGVMbGI3bzNaUnNDTXdhSjdrSUFhV1Jtald4NUg0NS94S0xSU2lkQlNO?=
 =?utf-8?B?Nmx3R2Q1U2g5NEJRWnB6YVVmNmg2VTVxc0xZZDJVWE9talZ3UzZ1RlRpZ1Jw?=
 =?utf-8?B?UnI3eG5jK25LNldyN1pHMmVoNk41bXZWY21GVWhRN2ZpOHU3WnRtTm9IVllZ?=
 =?utf-8?B?akVzbTg0Sk42TUo1QkhEN01xMjZQeHZSSFV2QVlwRC9XMkVVL2lnQ0ZRTWcw?=
 =?utf-8?B?VDZ0bGF1dmhEaG82Q0dYQjR4NVR0aTM0blpKUzI1TzN6dEtyYUJxcTRrNmow?=
 =?utf-8?B?YURaWXdyUlYyTnB6NXlQYUhEWXlJUW4zc0NnbTRGN21xZG1UVkF5V3A4K2dI?=
 =?utf-8?B?aExHQXVKcmZ2cFBBQnBEWlQ1ZGV1TzJJdHI0VTJFZExEb29IZzVsSDVJcXg5?=
 =?utf-8?B?ZHROSG9sR3FXRnRBYWh1MVhGYktKNFNkUmFMMmhKUlhObFpYS2pWNFptRmc3?=
 =?utf-8?B?MkFsNGsvenQvU0xzd3VnU3NFRmMrSFVkclZISzc0M2VFTEhyQjRtam82bzl4?=
 =?utf-8?B?a2trVWI2UHVpZklPbGdhQ1NMY2doOUV6eTlFbWFhSnhqWkswOTBOb0FQLzlu?=
 =?utf-8?B?NVFZNE4wSTdPTENHQUkyeXhVczN3MVhCWVhHc1JQcHlLclFWSTdJSTNpYmlt?=
 =?utf-8?B?UVpJSHpBYWFTYm5tQXpSNU83dlgyWGE5YjJFSklvazZ1YW5iQ2tHMnlMeW81?=
 =?utf-8?B?L2NpYVAwRkxLLzBrVFg2cndWS0MzZjljWlVzdW5tcktHUE93a3hDektRQlIw?=
 =?utf-8?B?cURWQmxleE82aHhHaDVqTWpFL2ZyV1YvcEhrU1BMMUFMdGlOZUxKMkhHcWZH?=
 =?utf-8?B?YlZYV1VSQnlVTjMrN1VNRThPT0p1YmhLVDRFQTF2di9RdEVkK0w2cmhrZks0?=
 =?utf-8?B?QkJKamFsOHZHSTYwNVlEYW5kK0gva1hGNVRjMlhVcHdwendnampmcjB2OG4w?=
 =?utf-8?B?U0luZkZjVjExVEZhR1pZcitoSXg0Q2pINUtoeHc1em95S3pWV1E4V2FLNmtO?=
 =?utf-8?Q?aU3sk1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUE1eGFuNTNONUJiUE90LzJlQ2RnaTNaUXNkNXo2RDdPTjdwUU9aRWJBSW03?=
 =?utf-8?B?dm1SK0tkVTVnUXJpck0zSTVndUZKQXJaMWc4MTVtM3RjM0FWcjlYVSt6MTRh?=
 =?utf-8?B?UVBJVU5CdmdrYWcraWkvNHk5RzV3WE1UY2pNdDMxYmh6Y1JOTUpTdFMwVjlt?=
 =?utf-8?B?djNENE9KYlhUU1poMkVHOG5qY3gyaHYvZDVtc3RBWjFFYll4QUQ1M2ZtRTRE?=
 =?utf-8?B?eUxrVE45Y1hydE53QlBHQ3FhdDE0UjNhdFBHWWk5d25JY0pnM0REaFVkK1Bj?=
 =?utf-8?B?Nk1TU0pyK21tOW1aWGY5dHYvSjJnbjFIc096ZjdWa0FSMi9nWEZabEF5Ym1C?=
 =?utf-8?B?YzduOGljYkxsZWtnb3IwQ0kzazJ4Yk5MU25jSmJLQ2l0Y0VnRlBWNHdQdXFs?=
 =?utf-8?B?V2JnckNuSldOaE9vK2JBc0dxc1lvc3NhL2lNVWdoTFVMemFIcGZ6MWVPOFky?=
 =?utf-8?B?T3l3S1h4LzRmbzRNWlgybkg3NXJoTGc0OS8zcUQvNDdIbzk0YnJxa1hIdWo3?=
 =?utf-8?B?Q2RLSFhZUmw4U0UxY3FFTzg5WlA5SUtTM1BkdklUUFBObEpWM0Q4dzJwV0Fs?=
 =?utf-8?B?RnFFOGJmeHQyYkdlRjE1eWV3RXZCREFzcXdjM1pDZnJvVTAzUk5JUlJ6bVhW?=
 =?utf-8?B?NjNWUVhxNXlnMG9jM1dqQ3ZiU25kOGN1SUF3VHk1aE5yakpxeVBFSmlJSXRi?=
 =?utf-8?B?UFJDVDNyK284UEJ3eTRCaS9saUhiYzFBU2RRUnBxU2daRjQ5QXhDOHBucmsx?=
 =?utf-8?B?d1psK0dvZzhyVStVd2hIczRXL3Zqb0RxTXZtZDZPRW54bVBtd2k5QThpb01P?=
 =?utf-8?B?SEhsbE9tOW9XNCtjVlYyaFBMZFM4QUp1Z3VLVWZmTnVCVTQwU053NmlGaVE0?=
 =?utf-8?B?MG12QVY0ZjBRbHh1cmJhZWgwNjVvdkw2Y3ZIYWRXdGR1S3IraXpmeXJJMU5k?=
 =?utf-8?B?czZ4UHJmYW9iNzl4OG12M1hJaDdTRFdrSzBrRXdRdXQreDhPYmd2ZXdGVlZh?=
 =?utf-8?B?SUI5LzdNemdQQmhoMDlXd3RDT2owL0VlcHNIcklTZUhtZVNsdjlKYlpmbmhu?=
 =?utf-8?B?RnY1WU1TTnF5RFR6VGROZjh6RWU1TXMrU09FakhyVVFMRERaM09iMy9KejRy?=
 =?utf-8?B?amJ3WVpPOERzS1JPMS9kMHJxWGxtN240cVFiRVNRK1pZejhNa3dLUHFvNFFI?=
 =?utf-8?B?MXpsOHpkcHBmYzVNUkRSY2VJTVgrYm82UCsxRVhKVVVzZlRZOHRnNGg5Tlla?=
 =?utf-8?B?VmlIUk83enRPS29VR3VYRWtwMzFRanBaL3UxYmhRb2gwamh0cnpGNUlWRkc2?=
 =?utf-8?B?Qi9MRUc3NVhsU3ZVVjRWcjdmRHZWMG9LbXVmWVhZZEhWVWRIcnYvUHBRNXli?=
 =?utf-8?B?N21QYkxoNlVySXdkU3ZBcExoWFJ1NFJuYWFuQlBDRm9JQ21qamRHOTdrdHVX?=
 =?utf-8?B?S25aa3hDcDlhM21BMzNJZVVpektWR1lnUXpqSkVpaVErSFZGQW5FU0dSNjVY?=
 =?utf-8?B?bThUeGFPS0k5Z0lFTFN1RU1HWHhoa1FnS1RjQlhsTU1nNXRiRU5sUDQyRXdF?=
 =?utf-8?B?TjA2OVlFQmpwV0UwQ0hPenlMbTBLZjd3dVVsaDA5OWJqeHN4SWJ4b2JMVUw2?=
 =?utf-8?B?enVYQ3pNRHZ0QXU2NnNLc2s1bW1kek5tM1RUVjVCbXQ1cTREYURLd1Ewb0tF?=
 =?utf-8?B?Z2hVQk9Mb0wwWWRtY3YwbWJEbVJOU1FDZGpxRXNUOTJyYzRVQWxjSXppckc2?=
 =?utf-8?B?WVdjYjMwamxUNHJLQXlXL3JKNlB2YnlLc3IrbG5YemI4K09HcmxMSjkzcVRG?=
 =?utf-8?B?VzBsakdZY0lyNlFONmEvMDhwZkF6VitIQ3ZSVzFWUWlXYVJxQ0tHSkcycEVE?=
 =?utf-8?B?NzB2RlNiN3ZMVkJWMHdSYXB3SndKcHFmRjNPY29kSjFXdzNwOU5Ucmw3SUdG?=
 =?utf-8?B?Q2RpUUpGNE9ZQVlBTTdrUWE3dG9Nd2l4QkhjK0NRWk9QZUpYSWZJZEhxWm11?=
 =?utf-8?B?aVpySUNlZDJoZEZJNEtRSUp2eUJiT0kyV1NlbWJjWmxoQ1FBRldPUXlPUFNp?=
 =?utf-8?B?WjQxSWxmSjdrSU5NZ2gyMlU3Tkg5bFhodVIwditiajJaai9mdS9QSlFLQlMy?=
 =?utf-8?B?bTRxR3o4QXVZcEw2cncra2EzbjZlMWlQekxFSlZjUXplWGt1QlpHZHlWUW9D?=
 =?utf-8?B?ZS9XUnZoWGpoeDA0YVVXc2M5MTc2bFdyNnRFdzZocC9rWStjckJkSlNqaGUy?=
 =?utf-8?B?NjREZzNoZnIxSnNCSmFzRHY3Z1ROOHF0OXJaSG40aWVpOE9aaitva21XeHFZ?=
 =?utf-8?B?aURDQlppbHV2UjR1bU9EQ0RXQm1zU1ovV0NGcUxCUDV5U1pyU0RXbTJPQ0Nu?=
 =?utf-8?Q?nb30tz507AU1Gqjo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c91f2b-27c9-44cb-89ac-08de6e3b09f4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 15:41:38.6388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XbN2tJh7dmYKHAPlga9DadqlNLXAIa0XFRDdz6pAahZn9P29Nt+yN+0kz7jJQehQxdv1b9RdLN3v01V8i3bQhPwWYLedvFMKOWy9t6A/8Uo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7593
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

When an error is returned from xe_sriov_pf_migration_restore_produce(),
the data pointer is not set to NULL, which can trigger use-after-free
in subsequent .write() calls.
Set the pointer to NULL upon error to fix the problem.

Fixes: 1ed30397c0b92 ("drm/xe/pf: Add support for encap/decap of bitstream to/from packet")
Reported-by: Sebastian Österlund <sebastian.osterlund@intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7230
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_packet.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.c b/drivers/gpu/drm/xe/xe_sriov_packet.c
index 7a4c3de662e56..1db5f4370e9e1 100644
--- a/drivers/gpu/drm/xe/xe_sriov_packet.c
+++ b/drivers/gpu/drm/xe/xe_sriov_packet.c
@@ -341,6 +341,8 @@ ssize_t xe_sriov_packet_write_single(struct xe_device *xe, unsigned int vfid,
 		ret = xe_sriov_pf_migration_restore_produce(xe, vfid, *data);
 		if (ret) {
 			xe_sriov_packet_free(*data);
+			*data = NULL;
+
 			return ret;
 		}
 
-- 
2.53.0

