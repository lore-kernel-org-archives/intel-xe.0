Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CBBCCF9E0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 16:20:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C9910E4EE;
	Mon, 27 Oct 2025 16:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RYjSInXs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9C010E4EE
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 16:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761582046; x=1793118046;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zoyqy0SLmImlQsWvkj5LXtxnPLeqOx73X5r4HBSJ7Zg=;
 b=RYjSInXs6y31i3fuP/6R7SDZhhJf2UdNUQ1I/A6ztCUwcLWDpSM5if+T
 PVIyccRGqBzvmqdS1/hbfuWwkBr1q4WfCqp0c4MbUUJKILiUsT8Tbw52p
 1hfX+Ll822syUp4CMlB3hqgh/ZBarAk5peAVLFJESUnlKRSx41o1Ylq9i
 3o1AUOkFpy1G6KxhHMHTlPMXxKROIypBoWTb54XjLzr3tmQMsI/tfBOaN
 zkAOukznBipAuuzERGneAkgzHRTORweuOheswiHWHLNsXLaQ+XRfZ25xD
 vvQ3OJn2YEuVc1HbiNLsdJaQX0uKy66afxRSgmBtsoC01ehy7LwYxMOAT A==;
X-CSE-ConnectionGUID: q8ZuSh2ZRaeGKivEAwib5Q==
X-CSE-MsgGUID: 4h1Zv6X3Q4iggCEEgEPLzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62872683"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="62872683"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 09:20:46 -0700
X-CSE-ConnectionGUID: 9QkTeb8lRNiJ6NBaCZ7yvw==
X-CSE-MsgGUID: 1piWpa3BRqyIxYH3xtjmMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184707858"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 09:20:45 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 09:20:45 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 09:20:45 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 09:20:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DjSBG0Njhq7fh/35ECf24B3himiKAT2evhDV5WGB1gCIt5ptDP2ECtdabznw3mRFtiqkpFcsGLFAAO9Jxp7tWJupYUmEYk1KggW1Xm03AVR4R665rpowUHudvxn8xoDqOFZtC3JZmKa95+wz7dfbS/OeK+9v1qxo8JnpDEPeMhsJcCUg1bb1OtrdVzNyVDFweF1e8rOmeMtwlcWpRtEsbR+XGtnrW8m5SbP2PoLjJzmwl93VMf+0tZH7MDRKXeDQo6YYPdWr/xsvsN/t9slgbHYkkpQnKKbqFrPn7IO7n3k5/STfwqt+2ggfo+Wp+IIxUjXL/0Ibh3lE4YzCKcuRgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNHdrATNEA/Hq9CjcVXbp2jzHu5aR6klfOuGHGyZwH8=;
 b=NyKdS/uQi1MYxZtXpWyStI04l2r6OCEM9Ee1MfNgEy9NtP2jD5JWJs+JCW6S7V0PGOiSyG86npOgqxapwGY+bn1WJ0XvCncjK+E/UbAr63ckRkVQmhzE1S/3hvaSqF16MY3g2r5ki805jBqj2BOReQBLnIWYAK5qai3uXAqxiNTpQy7kevtSQY8RhrZADmjyJl7wzhgFs3OtP3+B3feWcRjr/W/JE2skIo87g5isPjff2bc+HE1rDj+L7rG/wdKUwDvw4u6XY5awN4kmMjTI+o6zlwWVJL3ketmrQlLfr5mkpgejYsN6r5yCLQb08ZYdR2EVF6hO9yRSMAS0EgH9hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 16:20:42 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 16:20:42 +0000
Message-ID: <362dca9f-7505-4a4d-b9d9-46d145003c19@intel.com>
Date: Mon, 27 Oct 2025 17:20:36 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGUvcGY6?=
 =?UTF-8?Q?_Access_VF=27s_register_using_dedicated_MMIO_view?=
To: <intel-xe@lists.freedesktop.org>
References: <20251024205826.4652-1-michal.wajdeczko@intel.com>
 <176138561254.54467.5466084095567880064@97596180aaec>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <176138561254.54467.5466084095567880064@97596180aaec>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0293.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::8) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MN0PR11MB6135:EE_
X-MS-Office365-Filtering-Correlation-Id: 2beef612-3551-4e32-ae10-08de1574c66d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFpxM2hpNmdRQklEbTI3dHRtSEVLZ2MrQ0tWSDhHdzFQR3BibVVHMnJQcE00?=
 =?utf-8?B?ZmFjNm9LRml4aHprL2NNRnc1MWk0dFZQSWtSWW5XWDZldUo2Z00vZHVQRERV?=
 =?utf-8?B?aTNYT0dRZ3VwWHFsMUVIRXYrN1lFRWF6Q3QyK1pmU1JEVFA4YXpkRUFzS040?=
 =?utf-8?B?OHQ5VE92RFA3NjNlVEV5enQvY3FBR2czb2dWMXhPQkFLS0VxYktTLzQ4dVJh?=
 =?utf-8?B?MTlkUUZxUUVoMVRjcGRESnZpSXJ4ZzBTQTBZT2tMMU8rUkNBRE1OUDVLY3Rj?=
 =?utf-8?B?QktqenliMTR5cDBKaFRONjNTWjlhaFNGK2JzakxUWDAxeE5mSElRTWx5M04v?=
 =?utf-8?B?WHJsVGRWT1dJUnJ6U1FZZ1dLOE9mVTVWeWNBbWNERXppK2k4bGlWdTk1MnMw?=
 =?utf-8?B?NGxVWk1vUkJvRHhabEQxMjZqdGRUT0M1alJJcUNFT1hoQURWRXI2SVNmc2xK?=
 =?utf-8?B?MnRTbjJ2aDNxczlqWEw3UWkwdDA5ZndxMmd4a0tuMkwrRlh5dlZSa1JCbjlh?=
 =?utf-8?B?S2JPYk1sUWp4WVRjNE4zVE5HeDBLSzU1NEN5VW9hZFUxNTMrQzdaS2hoZEdr?=
 =?utf-8?B?YnFteHQzajNlRHhpL0c1aHh2Z1lONzJ6VUVQQk1nNytUS0cvWm5iR29aVnJE?=
 =?utf-8?B?MUx5cWg3aXFzWm9CanA2cTVmVHNPZ0pleFF0c3g3Zkp4UEhBNDJsOVdwV1d0?=
 =?utf-8?B?UE9UTGthQTdOaWpRaU9MUTFpTWQ2ZG9CZDdDdzgrcjhwRDR1NUQzQWp2NFVC?=
 =?utf-8?B?UVQvbkNOTCtVRE5hZEVZd1BaN204RGVEMDJSY3ZHY0tDT0l1eGdNZnYySkwz?=
 =?utf-8?B?S0l3N1pYODJuTmhjbUc5clpWLzJMOXFvbnZ3YmxVZ045V01yZkRkSHJNVFAv?=
 =?utf-8?B?STdEdVd1cmFXSTlBT2FZNUZabnYxb0NYY3pJTkl1ajlsUGd0c0F6ai8wMWFI?=
 =?utf-8?B?aUx4N0llTU0xSzFUdE9GcVI5cTkwbmJsNTdORHpsdWlOTSs5bkVuV2lYRVVK?=
 =?utf-8?B?eTM2dUVJS21RblZ6NlV3b1JhUmwvZkwzSzFreDFrZ2pORHhhVEg5YmJmVi9C?=
 =?utf-8?B?QldkKzVJRjZ1S3FqU1dkZlFvTjg3WDN3SnVraXlJR29FMkorRXdKT21GbXo2?=
 =?utf-8?B?VHZiUkJuU2FzaUF4Qzlodmx3ZXNuMHBVSzloY2tpemZsZXFyUWJudlRuWFpq?=
 =?utf-8?B?cHVkR3dhZm1Qc2hCeENnUmVHWEpLOTFUSEdQL0haUGtoazdjZG0yWnBCdVll?=
 =?utf-8?B?T1dsQTh5WTZlQ3JET1A0bW9NS25mYzJPeVhpS1crZFJFVEdsN1lxZWRRZXg4?=
 =?utf-8?B?Rm1RbExUZm12Rjc0ZFoxajFXaEhKaTJNSEUvNE9tQ2J5V0l2Q2RQc1Bka0NJ?=
 =?utf-8?B?clNuOFRhc1M2MUpEd0lQVGI2Rzl2T0t3Lzl6QzB0aCtlSk5wbFFWcmpyU3pM?=
 =?utf-8?B?c1cxNkV6Yk9FTkJ0SDE3WlcwbVVBQjNPL2FqN3g1WkVhT1ZqMERrRDF6elVl?=
 =?utf-8?B?b0xJMjVjdEQyeUovM2xXbUtzT095d2xwb3JqZVhOOEh0SVl0dEJPdkJvN3lv?=
 =?utf-8?B?RzNhOFowVWloRXRJQ1ZPejZtVEhsSnNURTZ5R3BlNHByY2UzRzNDT2V6NU53?=
 =?utf-8?B?WWpnSVg3ZVpYVWJqQ05nbDZvVURpM0lTQ1pLQzUyMzc2a3VOUlFhOEpzYTVk?=
 =?utf-8?B?b0dFU2JMNHFoaUQveUo5YUJwekNJVEpkSUhGQmVKYXZXNloxait2MkNtSnNZ?=
 =?utf-8?B?OENxZ1owMEk3d2hwRVN4UFlrOEhhODdPVENTWEFLUnBGbThzNW9lVC9JSWZu?=
 =?utf-8?B?dWRiTCtqNjlFT2l1OE5PQ2xweGpIMzlhU0lmSWlMT3pzN1FuYSs4UmY2dEdG?=
 =?utf-8?B?SVdmaWJOK2NoWnNBZWdqeTQzZGJYOVRQZ3FaK3FkajFrZ0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWlLYXlBdVgvdHdjM2pURzFUVC9WSnFrcTVWeTBxWXNZWDBPckRCaklNQyta?=
 =?utf-8?B?VFlKMjd2eVdYdmJOY1Y2WWx5UWdyQnFTZmE1a3BEUlVzZjQvdUFuWXJzdnda?=
 =?utf-8?B?Q2RvWWF2MlFwMnRxWlh1RXN0SHpRQnBOTTZjU2JZZzYyMWtlbDRKb3pjNjd4?=
 =?utf-8?B?QVlCY0c0ODdSdi9KbzdjMW5LV0kxbmk1bGE3TDFKaVE3c29sSmZuNjZVeVo4?=
 =?utf-8?B?cUk2UXBpVkhKa0JtVklOZ1oxZ0JRVkpZc3BuUElEVCtIaUdQTGZJMVk4enpY?=
 =?utf-8?B?dmVMaGt4Ym4ydlU3NHZsRE5FMDF5b1I4V1N6RGYxbTlDNituNjNsMTBGZzB6?=
 =?utf-8?B?WUZXSFVwMW9TbVdWRUp3K3ZkK3FrUnBGazQ1b01iK2FrNUlVME91TGJkSk0w?=
 =?utf-8?B?d3lRWFJRNDNpaUFSQ3ZHNDkzTzNXb1VsLzNSNkpsVlVIWTU2UWp1ZmFndHpC?=
 =?utf-8?B?bDlueHVINHFFOVJibVc2cG0rZGxLaWZlYnJCTUdBdmsyVDYwK0V4RSt0V05B?=
 =?utf-8?B?TEpEc21xZkVzaEp4QUMydWdlR2d0cWdMTE9HYkdEc1JRUlpuZkRtR3p6c1VI?=
 =?utf-8?B?eis5bXJrcUkrV3AxVzRxLzF6THUxajJaL3RkWjFWVmNsVy9WK1Zsem5PS1lC?=
 =?utf-8?B?dHkxdktHNkZndFJSdklyWllRQTZsQllvb1JTak1jSHhaOWdxZWhJZjZVbVBp?=
 =?utf-8?B?RHp0K2o0Rmk4UTg3TVhXNzA3RjI1eUhjZTJHSW1pQ2JFa3NBcjNTUGJ3WmRN?=
 =?utf-8?B?Z2pYSzlxdUlzeEIvZFVlNVZzeDlCYWQyaU9JQ1BNRmt6YTU3aWVDa0ZIeUJs?=
 =?utf-8?B?bHNtYlZVWnpzSk1GcDJOQVdJODk1dWpFZHpXUHlaRS9Kek5MRVpIN0YvVS9S?=
 =?utf-8?B?MHdkUFdUaFhxTWxDOTBiZWxuZDFRditSRGtmbityTmVYVDJCaTV6TEFQdXdC?=
 =?utf-8?B?cGlCUDN1TTg0ZGcxU25tbFM1YkVTV20yVVkvN2M0Qys3R1M1WnpTdytsNno0?=
 =?utf-8?B?NWFlSDVyU3RLYVdWNVpzWWtYckgzejc5bGJCaXVBNmZVaHV5ajdFUjBqZmcr?=
 =?utf-8?B?eWI2T1hWVTd2R1p3ZDV6TWd3bXR5RFlaZWsyOTlOUVZvSkp0Rk9YT0dyamRF?=
 =?utf-8?B?VHBpQlZjR082UnQwYzV5QTVJdzBObVh0UEhlZER3c2ZOempVdStCa0xSeHda?=
 =?utf-8?B?aFdKNTZYcjNnbjhwVmExMHZPVXNxck9xRFhvT3VKdDMxL2J6bENMcWpSeDhQ?=
 =?utf-8?B?Ty9Fb2pWV1pEQ2c5V1R1V0h2MSt5ZmFONm51ME95dk12dm9FSVpDRHFjM09R?=
 =?utf-8?B?RTZ6MjV3c0lwVU5XOUs4N0w0R3gzczJMYXY4WFNwNHBmbzNDbTk0RHlUWXRw?=
 =?utf-8?B?YldyWjlpc1pBNkQrWWR6L2JRbWtjN1EyUk5INDhGOHc2aEZvblcxSGdBSE00?=
 =?utf-8?B?MmFxanBvUWFnWjNFYmVjcW1BaXJQaHZTVjZIRnVTUHBSa1lkU3lQK0FSMTlq?=
 =?utf-8?B?WjdJSThmNWlLNW1ZU1BVQm5sdEludkE1ZG1oZ25zZDJybXQ2ZkxpWWJQRDlS?=
 =?utf-8?B?STZhM2xaYjBSYklkUGJpVTdKRmpGbGRQZEdVVXN0UEZqZ3V0aXBPRVJPVVhs?=
 =?utf-8?B?eHJ5c3U4Rkh0SHdsZzV0YjZBU2I0RkJnSTA5MFBrb3ZxamFsZGpaODA4SmFw?=
 =?utf-8?B?bHJSOWl3TFhxSklGY0JmQ04yZjZhRlpYQ0ZBdmdzSUdwY2hKNFFzK0dkQURS?=
 =?utf-8?B?cGFtd1hHVFk4d1BkUER0QzRmYyt5cUp2Wk4rSTMwQlBUTjlZcDhZNnZPM3JM?=
 =?utf-8?B?NnpZd3N5UlVwc2laQjg2VG5LV0txbHhxZzhGV3JzTGVaNEVoaEZ1ejcvbm1u?=
 =?utf-8?B?ZDlPUUV2WU5XejVobCtjNFhyQ2xuU0lHdWRsTEVoYmt5VS8rSjk1a0tobzNs?=
 =?utf-8?B?VEp3WEFhSlkrcHNMNCs2Njhtc0ZUNHl0azkwWnphQndxd3I5UmEzeHFRZURy?=
 =?utf-8?B?aytHL0VYbnN2eGtvczV2NnFmUmxDallHTXdlVGU4VGdnL0dibmczN1BjK0FT?=
 =?utf-8?B?VVZlNkZjWXRNQzJMY1FsSmE2Vy9uWVFJM2hYenlvTHFjaFZwWENWQmpoREtR?=
 =?utf-8?B?c2t6RE1EVyt6NWpQdlRKZFpDNGFjai95eEtDQlBNNjNjdVZFQUtaYUorK1U4?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2beef612-3551-4e32-ae10-08de1574c66d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:20:42.5628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +KSmuqic2Zamn6GLqnF9TyAs9jz7AITMACpiF4B6RTtUszRItoSsqLWCCLzhBNdENv7g8/zmRXWdsTNMPcDJTMUktyiZcUwmF2XquBfsSu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6135
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



On 10/25/2025 11:46 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/pf: Access VF's register using dedicated MMIO view
> *URL:*	https://patchwork.freedesktop.org/series/156516/ <https://patchwork.freedesktop.org/series/156516/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156516v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156516v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-3984-29a7e04b0cce50ab0bcd603c040d35682a643c78_FULL -> xe-pw-156516v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-156516v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-156516v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-156516v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_pmu@engine-activity-most-load@engine-drm_xe_engine_class_video_decode0:
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3984-29a7e04b0cce50ab0bcd603c040d35682a643c78/shard-adlp-8/igt@xe_pmu@engine-activity-most-load@engine-drm_xe_engine_class_video_decode0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156516v1/shard-adlp-4/igt@xe_pmu@engine-activity-most-load@engine-drm_xe_engine_class_video_decode0.html> +5 other tests fail


(xe_pmu:5125) DEBUG: [0] Engine active ticks: after 0, before 0 delta 0
(xe_pmu:5125) DEBUG: [0] Engine total ticks: after 19250333, before 47827 delta 19202506
(xe_pmu:5125) CRITICAL: Test assertion failure function check_all_engines, file ../tests/intel/xe_pmu.c:258:
(xe_pmu:5125) CRITICAL: Failed assertion: (double)(engine_active_ticks) <= (1.0 + (tolerance)) * (double)(engine_total_ticks) && (double)(engine_active_ticks) >= (1.0 - (tolerance)) * (double)(engine_total_ticks)
(xe_pmu:5125) CRITICAL: 'engine_active_ticks' != 'engine_total_ticks' (0.000000 not within +10.0%/-10.0% tolerance of 19202506.000000)

doesn't look like related as change updates only existing small part of the VF FLR code (not related to the later execution of the VF/PF.


