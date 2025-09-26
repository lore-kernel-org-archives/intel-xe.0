Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8207CAC5B5
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 02:33:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B3E10E9D5;
	Fri, 26 Sep 2025 02:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OLhziUOD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E1B10E9D5
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 02:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758854023; x=1790390023;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xg0hetqjf4A5ztxi6M+A9CQ1dsY6I+cpuy0apKkaTcY=;
 b=OLhziUOD5QJCGORQ10pDSnte6/OR6OfoSjzJ9Nhpd3lXWoFmF2yjzcMu
 81MYA0fL+vQ1EStX+N8FjpHxPZEDKqy2xWgIx5dxRNhtBBVSNvKMxQjiz
 0YnBGR9ywvv1A0FmAqcdn7IyhtzcsWXYlnHssb1YmwjlTw8rBaTs6HQ7g
 ahvgjbx+UnJswhc0MEf8T24IiBwPtPD0TfFZ6u/mcpBUOROJkuxHjb724
 MV/OhH7q98E5800CbkF5X/WsafNKddXGmrOuZirHz4HcU4aptfdg5+g9h
 TGxq+KVNAS8ZIgDYvrvqX0XbH7xYa2BtYutlhV3UE+LHIJIcMfaYT1YU7 A==;
X-CSE-ConnectionGUID: v1Gfx36uQ92XhhHyHw7Q6A==
X-CSE-MsgGUID: D9p9crQpRW+OE5o74dhcJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61105090"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="61105090"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 19:33:43 -0700
X-CSE-ConnectionGUID: 7BzakynbRVuie6erL43Kcg==
X-CSE-MsgGUID: EnFjrcIrRQO8IN0vQoZedg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="177328550"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 19:33:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 19:33:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 19:33:42 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 19:33:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vnhhvUXU2C29jffxjkjda5rbAiOoIQewEi+4isUKbr3uOBUckUVOv33DOfs9f7QQHZQ9ZM8Uw8DvMBqPXSIbcMwuiO9BrnbS4URSKr0EP6e/clw1QySh6z5gPz6GAI7OFz59tU+taqXATWBGVPvsz9LVE8xLOYX87/WX9grI0mWYD8mI5mUrRo+NhV2Mv2Sdm+213FY5y1M/RC3EkloWnHTZsxiIx7zA25sM0opNpPt85TDlLfVfidQAjbgYSzTN2oMCaS8iLtriKJu/DJt0E91aUtIAzygtJgkbhGvPIVRWBsJlCQBRLWfEuuWfV/LueMTmwYEek1BujDCVsFAtTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXPhWl8VeDFZr+MKX6kfrTBKkJGnVsgSInr4yN4aPCo=;
 b=tBklqKbTQR5dNhN8foUIikwnDnm9OzDqAYlQonYKq9HyRTFYmNXGy0eTp5QGPeTwTP/yejri9AMte/QzA3CcpRc2Uq70YzUKIn2QWRSyi5Rr0Dy2MBfnDqf/tPzLl4S/s0x2z/BrARyJ0vHYl5fJPIcIYxDdfq0Wj8RnBW5conDmWiAXy8jwP1bEbQX4wGepstdERn+n52jdmq0HbcgVFYLAnqia5VhOz4I1XsTWKeN9liuppAZyZ8+i33RpyMvN4P+k04Tw1ko8xdibLUHDq+wf+Vnp78Um5Grwfug3YuGduaxeUFmgbFtdujZRlgZ67fyIGxDzPqMfnOgnLCcSew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by MN2PR11MB4693.namprd11.prod.outlook.com (2603:10b6:208:261::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 02:33:40 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Fri, 26 Sep 2025
 02:33:40 +0000
Message-ID: <35a54c4b-b824-41c4-b9e2-b57a6aa1280d@intel.com>
Date: Fri, 26 Sep 2025 04:33:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/34] drm/xe/vf: Close multi-GT GGTT shift race
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-16-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250924011601.888293-16-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR10CA0107.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::36) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|MN2PR11MB4693:EE_
X-MS-Office365-Filtering-Correlation-Id: dec6c578-1e04-406a-bc99-08ddfca51a81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGtPMkdaVDV2MVZpMTV0S1hsK1VxdFZmeEVEQmxOaGJqbWdMWmVrMUpNYm5a?=
 =?utf-8?B?eEU0WGp5ZzhEWHNodjNtZ3djTWpZcllvaWJLTnBjaWdySW5Jc0VLZmVyMSto?=
 =?utf-8?B?bnBNL0pPa3BtWkJtL1JRMWFLdFlPRGdrQmxkUXZZS2ZRcnFDVjFpT0YrOGc5?=
 =?utf-8?B?elgyU21USkUwb01mbmRFTFpqQ0w2eG5VUjhGV1dSM1pwRE5VaFFkeXBaNlh6?=
 =?utf-8?B?dnZpOUdLOFFzR2xGbGRyY0pueS9oOGhrUFJuaWMxTHprMkM1ektxdEhUT25G?=
 =?utf-8?B?RUFpTlJsaWEvQ3dUajk1WlR4ZjgvZmExaDNsWktDampwZUN3S001c1NlYTRQ?=
 =?utf-8?B?bWVmVjlCVFBhM1ByamMyQ1FLMXVIOFFraUR0cWtIMUl3VWp5QXRldVJTell6?=
 =?utf-8?B?dTNRU0FvS1VUVVhxR2FtdXpOV3A4L09OYnlWMXI4OHJXakpYUzJTZ2FiRGNU?=
 =?utf-8?B?NGlmSHF2dklLalpySGxsWTIvV2NzUVNXMXBGdFk3ZXNGMU4xV0FScDVzbS9a?=
 =?utf-8?B?V0c0SC9XcG1PQkJiZEtDQVk2RXNPOEUxOWNJWE1sWDhIMk5pY3NVeVZhNlIz?=
 =?utf-8?B?ZmZFSW4xUkJiU3FBOHphRkxMamkwWW1pMXdudmRCRzFnK3dDcjBoWlhPRk03?=
 =?utf-8?B?NGxPV0QwZis4WE5telFIUjYwZlZvWHEzZnVCLzQ3TWlvUmJVRUFiMEZPbkxI?=
 =?utf-8?B?SnpTN1p1QXMra2ZGRzllNHorZTVWUmRaSzFuZzdBWTRreTdtSXlGbWZwWWF3?=
 =?utf-8?B?MU4vZkpMVnRJWWREZHd4ZlJGSDRBZkdwL0FzaUNlNkNDV0NmckZmaXc0cW5h?=
 =?utf-8?B?RjZWdFdqMnpGZmtkQmNPazc0SlplRFIyd3I3QzNHRFB6dE9UZTlmN3VnS2Rt?=
 =?utf-8?B?T3lHM2FwZEE0TXRweUtQMmlXM21sb0o1MEZGd1NRcGN0ZFZDY2hLUzNsMUtT?=
 =?utf-8?B?WjFJdTJodThvSlllbjdyMXc2ZnprU2thM3ZXTGwyc0lqTDdrMG0vM1FscHZ5?=
 =?utf-8?B?WGE4ODFieVFJVDdDa2tPMXNhQ2pEMXVwa2V4MG1sOUhTcmtOTlhXM0tzZjNV?=
 =?utf-8?B?SkFtK2Z5V0U2MjloS0ZidVR6MEoyMjVNQ1U4QWZzdzFhM3E0TmtwWlFhNTZ5?=
 =?utf-8?B?OHEzZkRkdG8xbjdWL05wajcxTVAzdVdKcjJVR3c5NFZRQ0xhaytPZnA3aERq?=
 =?utf-8?B?TjhZcFVvT1FhdjRBa1MvV2wxQzYxbTR2T3FNVXRZd0xHVldta1F0bko4NUVC?=
 =?utf-8?B?WVVBR1ZOUTFGQjdyTkh2ZXpEQVNEc2ttc1d5NFhiTmw5a1VuSU9sd3lzVUZN?=
 =?utf-8?B?SDYralNHWHd2eWNGdTRaRFcybUY4S2lZbFFNN2t5bE9SdEE4dnB2S2dMc3gy?=
 =?utf-8?B?UGpZQUJuakYySzhxZjN4REdtYUlhTVpxelRJUEszUGU5UnFWRXdIN0I4dXJk?=
 =?utf-8?B?alUxUXRTZnRiK0ZhcEZZVFAydjF4NTE4cnVaa3B2ajJQTWw2STVZL09pcXBl?=
 =?utf-8?B?NytsTy8yY1NKNmdIME5QY2RPTWkwMktiYWtldXNaTHM4QlNaRXVzNzkwUUpm?=
 =?utf-8?B?VnJ6bk9jOGlvaUV4Ym5kUGN5b3RjbGJNK3VvVkhBbmphRXBWcHNGTG93NEIv?=
 =?utf-8?B?cmtWaW5MNlNDNUNLYlF3cVNCazZtZ2t6VERPek9ZZ2dqeFJ2bEp1SG9Rd2ZZ?=
 =?utf-8?B?YVQrRWRjc0J0OXM5UDNtNGZPNm9RTCtLWEoyVFJmakdkTXA3dnRaV0puTEd1?=
 =?utf-8?B?cWdVRThiUlJyZXV3WFkwN0JlTm1WWHdodm9nM3JTVFNGZ2hyeUdPamR3K2dt?=
 =?utf-8?B?SVd4aERxNWUzaXJLS0V1ZHdSb3c1ZUhnb3lxaEYwNWRHL1VoTy94ZytRV3Y5?=
 =?utf-8?B?b0FONmh5YkJxMzVWQ3VQOGRpKzJFekVmOCs0S211TXNENVMyQkpyWDJEWVFW?=
 =?utf-8?Q?HMlr9eUozRE2WgbrZycVMkwA8WxhZBR0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnBOOGVVYlVzSi8xRGFtRHc4S2RCTEw0QjFSVXZBR09Tc2t3M0g2ZFpiUkFl?=
 =?utf-8?B?bW56UmxOb3RrQTV5SnBXL09wK2U5YmJoaFFMNTd6SzRad3VSKzZHZXBQSGI2?=
 =?utf-8?B?ZWdCdlc1UEdvN1ZrMytxMFZSZlNDUmNqb3hJbkxKOCtHbzRGVUdrYXAveWV3?=
 =?utf-8?B?T1g2NGJKZ0NJNGdyNElXc01iTEx3OXVQQWRBZXV6ZFl2dnZlb3RzMUhKV242?=
 =?utf-8?B?V25ZNThzZGlUU0tPemprUUVMdk1rRGxXd0ZQbUtPc3hVVnRRYkRKam9pR3Ir?=
 =?utf-8?B?RDFLZVdXM3RzTGxLR1FJMWtrZHFHV2tHekpzaVNEdURNN296UTlaV25vS2Fs?=
 =?utf-8?B?UVZ3VUl2Z2QvaUZDaGNZOG94M0pLMGJUUWEzVDcxMTBTODFSbElhU3VHK1Ax?=
 =?utf-8?B?V21pNDRhNUkya3FOZTBaNEQ3YU4xQ3hkdHFlVmM4b05peitlSGZjVW1acTVO?=
 =?utf-8?B?d1I0a3o1Nit0d1JqMHkwTFFXeGtUQjBscmhMbkZSUTR6TW1XbkMvekdIMzg0?=
 =?utf-8?B?eDhJYnJLK2xIczRFeDJMNzVHWmVxNCtiSzA5akpFMU5ya0RFTjdaQkJKWE00?=
 =?utf-8?B?VFY1R2tjaGY2Q3p5aDFFYjV3L3ppYUtZbGVuL2xZSkk3UWdaQ0M2TFc0aFFM?=
 =?utf-8?B?L09BbVpPQ2xYTkRuRVpvVE1VUmVja2hiZWNzZHdMaW8yS3Zmd2pTdyt6U0J6?=
 =?utf-8?B?bnZJdGdEaWx0bVhZaisvRTVueWltM21lNllySHcrWVdtTm1TcGFDTE1pZDJ2?=
 =?utf-8?B?Tnhhc2tScStvdWh6ZG9YY3pSTGhGd3N2SFdNU1dWb1BiV3lScmFDY0QxcHVy?=
 =?utf-8?B?enRzM2JBd3dMY0ltYW42M013NkxSUFBMNnE2M0lUTFpSZ0Jpa0FPMUVVOFkw?=
 =?utf-8?B?NFZ4cThqYmx2OFUvMFBYZWFLeDYzZ2RtT28vS0RoZWI3ZHBabnpDb0xhVjhF?=
 =?utf-8?B?WHhFSGY4Z3BGbTdmd3NuS3Z2cW43RVg3dFFTdUJZbmMydnBuVUI2R0xqMUo3?=
 =?utf-8?B?bmpSNi81STFickVHbGNVMEQrbDlhckxHTGJJWDg3STBPdy8xbW5USTk3QS9H?=
 =?utf-8?B?UEkxMm1HalZPQzZPNHkrQ0x5ZEprbjVtUThZdjF3eklkUEVrME1OOXB4RVBT?=
 =?utf-8?B?TThtK0cvVzFlU05Id2RXMWI0N2dOMTdqakJ0TXEyWWtXcTdheVlEekc3TXFr?=
 =?utf-8?B?cERLSGIxb3dKTnhHaFN3bENlN3J0NW1KZEtwVzBZTGJiQjFOUkFsZ21UVWVH?=
 =?utf-8?B?dVp2ZVFUaFByVDNWSUlQYk1ySHZld0c5K2dyYmt1SHRteFRKR2VvaTdWclpK?=
 =?utf-8?B?elorS2hTS2dWUjc5RDdESUdCaE5pdzJwNnEzQzV3ZHU2MUYzNCtzdDg5NWIr?=
 =?utf-8?B?WDlCUWFabCt1Z0ppMU1PTTMrdVY4ZGk4V29IejJJTFErb1cyeDBRcHVpblIv?=
 =?utf-8?B?cnlZa295TlVSY2lBQm9aYy9GMkR2elYvK21DZFJNcUEwVmVtTElqZzM1Nzdo?=
 =?utf-8?B?Z2JkVEwrV1FjZTZ6S2pNNUZ2ZDJCNUU4K3VpdVEwYk1DTjZyTm9iU21SQ003?=
 =?utf-8?B?VHpPcDVONEVoQnV2bFVCWGFCT3g5ZDJZT0NhZUI3cTJDTk1EZUphODNiWlJD?=
 =?utf-8?B?a0lEbHEzZmhreXlmYjZ1ZEY0RkU5TUxpWVpHNFRQTzRLZ2J0bjk3cEZXdllG?=
 =?utf-8?B?QURxVHRCZ1Z6b2syMXJqUXd3RnhydldNaThWSHV6YmRrUVcxSU9jOHFmcEl1?=
 =?utf-8?B?WlJoWTNvMDVDdnV6WVVITWxhQzA5OW80Z0h2ZVpxUmRrNlJqUFB2RUlLV01o?=
 =?utf-8?B?QVdGRldjbXpwdjVFdEU3aHZWRmhhMU9FaUF3bU1iaXBZR0xITDh6OFkrZVFj?=
 =?utf-8?B?TWsyb1lzOFVLLzFZN0Q0M2E1TENDWkcyNC9OMmhZNjhTUWhCajF3dUFSdkVV?=
 =?utf-8?B?OG5WVGtUNFlId2tFeGxMSlRaYlBqU3p5MWMybUY1K2orUjdhOGlHVGJ6TU5p?=
 =?utf-8?B?TVlWK0RWdG13cHJQL2hsVG1zakN2cHQyVjliTEJFci85cWJsNi9Vckc0MHZr?=
 =?utf-8?B?cHBMY2p3MnNwemIyTGgvaGNvS3JnaVJTWXY2ODlhTGRqV1NVSDVJbkpIdVNx?=
 =?utf-8?Q?NvYqo/Q4gXLeyg8THHjNccn6+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dec6c578-1e04-406a-bc99-08ddfca51a81
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 02:33:40.3172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oGyMi7e/ed1K9ngzdAwuw1E6cSJF82TpaLD1sPbz8tla/3yzuOaLywU+davb1uelu3CTFNBk15nal/qcfzaxtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4693
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


On 9/24/2025 3:15 AM, Matthew Brost wrote:
> As multi-GT VF post-migration recovery can run in parallel on different
> workqueues,  but both GTs point to the same GGTT, only one GT needs to
> shift the GGTT. However,  both GTs need to know when this step has
> completed. To coordinate this, share the VF  config lock among all GTs
> that share a GGTT, and perform the GGTT shift under this lock.

The description does not mention removal of ggtt_shift variable; this 
removal is not related to the locking change, so should be separately 
mentioned.

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 95 +++++++++--------------
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  3 +-
>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 11 ++-
>   drivers/gpu/drm/xe/xe_guc.c               |  2 +-
>   drivers/gpu/drm/xe/xe_tile_sriov_vf.c     |  6 +-
>   drivers/gpu/drm/xe/xe_tile_sriov_vf.h     |  1 -
>   6 files changed, 51 insertions(+), 67 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 8304c26c076e..807fdced0228 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -436,16 +436,19 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>   	return value;
>   }
>   
> -static int vf_get_ggtt_info(struct xe_gt *gt)
> +static int vf_get_ggtt_info(struct xe_gt *gt, bool recovery)
>   {
>   	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	struct xe_gt_sriov_vf_selfconfig *primary_config =
> +		&gt_to_tile(gt)->primary_gt->sriov.vf.self_config;
>   	struct xe_guc *guc = &gt->uc.guc;
>   	u64 start, size;
> +	s64 shift;
>   	int err;
>   
>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>   
> -	down_write(&config->lock);
> +	down_write(config->lock);
>   
>   	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
>   	if (unlikely(err))
> @@ -465,13 +468,17 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>   	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
>   				start, start + size - 1, size / SZ_1K);
>   
> -	config->ggtt_shift = start - (s64)config->ggtt_base;
> +	shift = start - (s64)primary_config->ggtt_base;
>   	config->ggtt_base = start;
>   	config->ggtt_size = size;
> +	if (recovery)
> +		primary_config->ggtt_base = start;
>   	err = config->ggtt_size ? 0 : -ENODATA;
>   
> +	if (!err && shift && recovery)
> +		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
>   out:
> -	up_write(&config->lock);
> +	up_write(config->lock);
>   	return err;
>   }
>   
> @@ -485,7 +492,7 @@ static int vf_get_lmem_info(struct xe_gt *gt)
>   
>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>   
> -	down_write(&config->lock);
> +	down_write(config->lock);
>   
>   	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_LMEM_SIZE_KEY, &size);
>   	if (unlikely(err))
> @@ -505,7 +512,7 @@ static int vf_get_lmem_info(struct xe_gt *gt)
>   	err = config->lmem_size ? 0 : -ENODATA;
>   
>   out:
> -	up_write(&config->lock);
> +	up_write(config->lock);
>   	return err;
>   }
>   
> @@ -518,7 +525,7 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
>   
>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>   
> -	down_write(&config->lock);
> +	down_write(config->lock);
>   
>   	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY, &num_ctxs);
>   	if (unlikely(err))
> @@ -549,7 +556,7 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
>   	err = config->num_ctxs ? 0 : -ENODATA;
>   
>   out:
> -	up_write(&config->lock);
> +	up_write(config->lock);
>   	return err;
>   }
>   
> @@ -564,17 +571,18 @@ static void vf_cache_gmdid(struct xe_gt *gt)
>   /**
>    * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
>    * @gt: the &xe_gt
> + * @recovery: VF post migration recovery path
>    *
>    * This function is for VF use only.
>    *
>    * Return: 0 on success or a negative error code on failure.
>    */
> -int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
> +int xe_gt_sriov_vf_query_config(struct xe_gt *gt, bool recovery)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
>   	int err;
>   
> -	err = vf_get_ggtt_info(gt);
> +	err = vf_get_ggtt_info(gt, recovery);
>   	if (unlikely(err))
>   		return err;
>   
> @@ -610,10 +618,10 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>   	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>   
> -	down_read(&config->lock);
> +	down_read(config->lock);
>   	xe_gt_assert(gt, config->num_ctxs);
>   	val = config->num_ctxs;
> -	up_read(&config->lock);
> +	up_read(config->lock);
>   
>   	return val;
>   }
> @@ -634,10 +642,10 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>   	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>   
> -	down_read(&config->lock);
> +	down_read(config->lock);
>   	xe_gt_assert(gt, config->lmem_size);
>   	val = config->lmem_size;
> -	up_read(&config->lock);
> +	up_read(config->lock);
>   
>   	return val;
>   }
> @@ -656,11 +664,9 @@ u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
>   	u64 val;
>   
>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> +	lockdep_assert_held(config->lock);
>   
> -	down_read(&config->lock);
>   	val = config->ggtt_size;
> -	up_read(&config->lock);
>   
>   	return val;
>   }
> @@ -680,34 +686,10 @@ u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
>   
>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>   	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -
> -	down_read(&config->lock);
>   	xe_gt_assert(gt, config->ggtt_size);
> -	val = config->ggtt_base;
> -	up_read(&config->lock);
> -
> -	return val;
> -}
> +	lockdep_assert_held(config->lock);
>   
> -/**
> - * xe_gt_sriov_vf_ggtt_shift - Return shift in GGTT range due to VF migration
> - * @gt: the &xe_gt struct instance
> - *
> - * This function is for VF use only.
> - *
> - * Return: The shift value; could be negative
> - */
> -s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
> -{
> -	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> -	s64 val;
> -
> -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, xe_gt_is_main_type(gt));
> -
> -	down_read(&config->lock);
> -	val = config->ggtt_shift;
> -	up_read(&config->lock);
> +	val = config->ggtt_base;
>   
>   	return val;
>   }
> @@ -1115,7 +1097,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>   
>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>   
> -	down_read(&config->lock);
> +	down_read(config->lock);
>   	drm_printf(p, "GGTT range:\t%#llx-%#llx\n",
>   		   config->ggtt_base,
>   		   config->ggtt_base + config->ggtt_size - 1);
> @@ -1123,8 +1105,6 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>   	string_get_size(config->ggtt_size, 1, STRING_UNITS_2, buf, sizeof(buf));
>   	drm_printf(p, "GGTT size:\t%llu (%s)\n", config->ggtt_size, buf);
>   
> -	drm_printf(p, "GGTT shift on last restore:\t%lld\n", config->ggtt_shift);
> -

Right.. so by that we're losing a useful debug value.

I'm not very attached to it as I did not originated the idea to have it 
there.

IMO the GGTT config is printed to dmesg and that's enough, shift can be 
computed from that.


For the main change - the lock and the multi-GT support - looks good, no 
issues.

-Tomasz

>   	if (IS_DGFX(xe) && xe_gt_is_main_type(gt)) {
>   		string_get_size(config->lmem_size, 1, STRING_UNITS_2, buf, sizeof(buf));
>   		drm_printf(p, "LMEM size:\t%llu (%s)\n", config->lmem_size, buf);
> @@ -1132,7 +1112,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>   
>   	drm_printf(p, "GuC contexts:\t%u\n", config->num_ctxs);
>   	drm_printf(p, "GuC doorbells:\t%u\n", config->num_dbs);
> -	up_read(&config->lock);
> +	up_read(config->lock);
>   }
>   
>   /**
> @@ -1215,21 +1195,16 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
>   static int vf_post_migration_fixups(struct xe_gt *gt)
>   {
>   	void *buf = gt->sriov.vf.migration.lrc_wa_bb;
> -	s64 shift;
>   	int err;
>   
> -	err = xe_gt_sriov_vf_query_config(gt);
> +	err = xe_gt_sriov_vf_query_config(gt, true);
>   	if (err)
>   		return err;
>   
> -	shift = xe_gt_sriov_vf_ggtt_shift(gt);
> -	if (shift) {
> -		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> -		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> -		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> -		if (err)
> -			return err;
> -	}
> +	xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> +	err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> +	if (err)
> +		return err;
>   
>   	return 0;
>   }
> @@ -1313,6 +1288,7 @@ static void migration_worker_func(struct work_struct *w)
>    */
>   int xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt)
>   {
> +	struct xe_tile *tile = gt_to_tile(gt);
>   	void *buf;
>   
>   	buf = drmm_kmalloc(&gt_to_xe(gt)->drm,
> @@ -1322,7 +1298,10 @@ int xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt)
>   		return -ENOMEM;
>   
>   	gt->sriov.vf.migration.lrc_wa_bb = buf;
> -	init_rwsem(&gt->sriov.vf.self_config.lock);
> +	if (xe_gt_is_main_type(gt))
> +		init_rwsem(&gt->sriov.vf.self_config.__lock);
> +	gt->sriov.vf.self_config.lock =
> +		&tile->primary_gt->sriov.vf.self_config.__lock;
>   	spin_lock_init(&gt->sriov.vf.migration.lock);
>   	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 195dbebe941e..535237003915 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -18,7 +18,7 @@ int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
>   void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
>   				 struct xe_uc_fw_version *wanted,
>   				 struct xe_uc_fw_version *found);
> -int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
> +int xe_gt_sriov_vf_query_config(struct xe_gt *gt, bool recovery);
>   int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>   int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
> @@ -31,7 +31,6 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>   u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>   u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt);
>   u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt);
> -s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
>   
>   u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>   void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 496b657119de..61484c7c9a36 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -19,16 +19,19 @@ struct xe_gt_sriov_vf_selfconfig {
>   	u64 ggtt_base;
>   	/** @ggtt_size: assigned size of the GGTT region. */
>   	u64 ggtt_size;
> -	/** @ggtt_shift: difference in ggtt_base on last migration */
> -	s64 ggtt_shift;
>   	/** @lmem_size: assigned size of the LMEM. */
>   	u64 lmem_size;
>   	/** @num_ctxs: assigned number of GuC submission context IDs. */
>   	u16 num_ctxs;
>   	/** @num_dbs: assigned number of GuC doorbells IDs. */
>   	u16 num_dbs;
> -	/** @lock: lock for protecting access to all selfconfig fields. */
> -	struct rw_semaphore lock;
> +	/** @__lock: lock for protecting access to all selfconfig fields. */
> +	struct rw_semaphore __lock;
> +	/**
> +	 * @lock: pointer to lock for protecting access to all selfconfig
> +	 * fields, all GTs point to primary GT.
> +	 */
> +	struct rw_semaphore *lock;
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 00789844ea4d..ac60da51da2c 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -712,7 +712,7 @@ static int vf_guc_init_noalloc(struct xe_guc *guc)
>   	if (err)
>   		return err;
>   
> -	err = xe_gt_sriov_vf_query_config(gt);
> +	err = xe_gt_sriov_vf_query_config(gt, false);
>   	if (err)
>   		return err;
>   
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> index f221dbed16f0..dc6221fc0520 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> @@ -40,7 +40,7 @@ static int vf_init_ggtt_balloons(struct xe_tile *tile)
>    *
>    * Return: 0 on success or a negative error code on failure.
>    */
> -int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
> +static int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
>   {
>   	u64 ggtt_base = xe_gt_sriov_vf_ggtt_base(tile->primary_gt);
>   	u64 ggtt_size = xe_gt_sriov_vf_ggtt(tile->primary_gt);
> @@ -100,12 +100,16 @@ int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
>   
>   static int vf_balloon_ggtt(struct xe_tile *tile)
>   {
> +	struct xe_gt_sriov_vf_selfconfig *config =
> +		&tile->primary_gt->sriov.vf.self_config;
>   	struct xe_ggtt *ggtt = tile->mem.ggtt;
>   	int err;
>   
> +	down_read(config->lock);
>   	mutex_lock(&ggtt->lock);
>   	err = xe_tile_sriov_vf_balloon_ggtt_locked(tile);
>   	mutex_unlock(&ggtt->lock);
> +	up_read(config->lock);
>   
>   	return err;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> index 93eb043171e8..4ee68d1fb28e 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> @@ -11,7 +11,6 @@
>   struct xe_tile;
>   
>   int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile);
> -int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile);
>   void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile);
>   void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift);
>   
