Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2747FC021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 13:53:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E511210EA6B;
	Fri, 21 Feb 2025 13:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBpTBpzT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA0110EA6B
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 13:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740146026; x=1771682026;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OxbJCH/5oPKAiFUyMJdTZ9UV/+6+6Tha2YX8Elbns5s=;
 b=GBpTBpzTMbA29sP8RejaOe+oahpTSW11KsCoDeKe4oCyHiCcprsxXh1D
 syP+ujLR/9EK99DyCC70ltnCAKcyH9AFaLO/Xo2Shorw5JxNi9RZlOuBt
 BKe+cLQsj+ljnZgdP73YN5/coVo8bOngC7BQ7nI5t412+NcsUbkIU6w4b
 wJCfidk112kG8myWupgSoJBAlb2NqJARkcaXwnK8+Iijf7JW33jb/u58G
 X5f+JqFNtfbHRICRZgqOnyeZPItIwIByq9onYcC47G01HhUY6duC0pU8m
 O1+S+I8JMGjhyFrlOaaII5u7VdZ3VqkgsYW6aPSWRfZjhPdDHgUC1xIpf A==;
X-CSE-ConnectionGUID: k/BGvNVnQpKmvJkclcIdsg==
X-CSE-MsgGUID: 04u3hT4MTpym/rb8GgATGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="51606588"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="51606588"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 05:53:33 -0800
X-CSE-ConnectionGUID: pD1YBgHAQ9q8jb7h4/NfaQ==
X-CSE-MsgGUID: qLCCen0CSuCtQbyVVT723Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="120306851"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 05:53:33 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Feb 2025 05:53:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 05:53:32 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 05:53:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mOj5k+OsnZduCCLbMk9rCCSGkscytlqJuTT9I5/f0FBd+9feYQARCa0lEk66yXF4k7Z6MiA/pzF537bc1ta7q+JX+aXIieqfh5JAIpzKszx7L1Nicqc0GkspoMPPW8TxR4+ZEgAgTkbZfRlCu1IaYChNAPg58HMJaryOhA5ieNNQg72y2pEkDZ8Bv3k+brqJOKP6TaM74NwurVfcpS7J+w4rIafrGmXXO1/B3AitkTIVzjg3CkHv1abr0ZCq54kqc7kzrdJgZC0Ds0ScwlY0+pO2J71L6Z3Zvi83P/efNsGEP1UWlfbj1G2OVGyYsTZCFs0wz0xKIG/CvJwd2+OGoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUISGYI0L/WYhrLCS1AHIiyQk3sjJsX+QRBN98OtohY=;
 b=k3IYxyu4ButWTRxK05X7rAg1jFquFE5jH/d9JneM2CXcSONcEU4PE8s4zFps6qvnIpBGbiyXkRITPEQDQW0gGqwkEcOXJplRzo2m5Y/xUZzD+WOdsa2oBC4mXs7zJjRp6lV/ty4ap0XuQ/s86FCNgJU7TZVUErKngRkLb1vPmthF9hjO1/0v7R+Znj5vlI1AeUcSECfsqfAuUIwtslzbXeKnChU75YY0gojXNH88Re08w0gvAvwNrlbkY6iIpUHH5p2bqdxTaScvn1vN7zWR70jaBIg617siPM1BA7hPsyCOYwM+dMxEsh5wbx+yzUfy22HQ+won3fdH9Y5LRzMZYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CY8PR11MB7945.namprd11.prod.outlook.com (2603:10b6:930:7b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Fri, 21 Feb
 2025 13:53:29 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 13:53:29 +0000
Message-ID: <72c23c2a-cb2d-490c-88e3-0cea2799d219@intel.com>
Date: Fri, 21 Feb 2025 19:23:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/wa: Limit char per line to 100
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250221115344.389975-1-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250221115344.389975-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0021.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::29) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CY8PR11MB7945:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a20c17b-8620-4c22-a0ff-08dd527f1f4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S25QZkovTTIrakI2WGpNbDhsNVlmcXprUWZKRjNiU0U2N1k4eXVJTTVrZDdK?=
 =?utf-8?B?VVJ1cUVOdVkyaXJnZGQ0SUdrSytwTEUyUU9pNzI0ZzJBZjFZMUJ0VVB6cFIy?=
 =?utf-8?B?WFI1d2xQUi9uaDVpa2MyR1VwcWRnSkF4Tnd4NkxoK0FNdXY4bUgvQWYzRFh3?=
 =?utf-8?B?dEFXVjRUUlp1dkMwU2ZzZi9FYWtoN0NmUkl1UUpNZlZvWThjem8yclFRcTE5?=
 =?utf-8?B?VGhvQmJQREdrc1kyQi9wL0I0WGVpMU5JUWVtQjluZ0lYTFVPZ3FLSjBEb2JL?=
 =?utf-8?B?VEFIcTZRQW54d3RZU3lhQ2VIR2c0OEdMeGlvUUlFNmR2TzRySnVRUVlNek5Q?=
 =?utf-8?B?UUVTeXVDSjd1OWtPdTJSSG85Z2MyeGs0ZS9TakFybkhjeE1BeXV5Rm42S3pq?=
 =?utf-8?B?aHhvS1haSHNUWUdnb1BiYTZxZWJoWks1c2ZVOFVmQStTY1lGSE4wa3d1Zkg3?=
 =?utf-8?B?by9DQTVENEhaVE5BWUNpU3U3RkxldDgyS2ZEREJKWEpLeGEzS0VpMGI0b3JF?=
 =?utf-8?B?MjM4YThqc3RweWwvWmV2MVhkT0JyZjUzSFpwZFYxaXFvT1dKNm5GcW1VUWZk?=
 =?utf-8?B?SVpuOXZlbVFIUTVyVHBqZWFQWCsrczhOQms1R2ZLQ1B4cDIvVUwzaC83ODR2?=
 =?utf-8?B?OFBCNXpnZFVJWXBUZ3pvWnVLR0R2WHZubkZwY1BNR3UwNmNmN3J2RStTTHVI?=
 =?utf-8?B?VVdOdDVreVBkbGVmbzdtQ3kwVXlGb0V1aWx6LzQzQlN6V3J6ZWlKVEw0WGpZ?=
 =?utf-8?B?cVFHWUlJMVdwb0todUVhVEFGMDlUWVpBbFhBREgvSjUzL0NmWmtDVCs3NzIv?=
 =?utf-8?B?K05INDdTc3FUMVVIWE11dnY5dVJHZ0lNRHdPWE4xQkM3RzJaMjExdjNWY2N0?=
 =?utf-8?B?TTFQbldlMU14T2hLNThxUHREc3BoOHJBUm11a3pVNmZUb3lNRExRcCt4aFhF?=
 =?utf-8?B?N1hyV3JVb3M5RE1VN0FBVmZOWjU1UDVrQVB5NmRhb2xiUUxRVFBWZ1R2YUtM?=
 =?utf-8?B?UHdsUWpOK2FPYUlJdk4ycDV2UnAwUWtyNTR4TlpEcm1KMDdHTURTaDYyaGhx?=
 =?utf-8?B?VUNqYnBCakNkZ2o5TnpuY3BoU1dqT0pVNXdnQTRaL0xyM1NHMkJUSFhlUTFa?=
 =?utf-8?B?aFZPeE1hcFNPWWRmOEduN2xCbEdOZk9qNCtFek1lVFJjMlZiZ3lkTDdxWjds?=
 =?utf-8?B?TFdDcENQYlkrM3BEOVJIY3dzMHFDaWhvMGpWK3FhN3B3NlZzWnFHNjZjT01o?=
 =?utf-8?B?bmtQdS9tQnFxY2VlODZzSDVVUW1MQ2thVTZ6L3R6VTRLcFc4WkhPT3JxeHRo?=
 =?utf-8?B?bktYbW1OSE5zR2pnc1VrZ25MZC85Sm9PZzVjdTA2TGNBYTRhQldUQ3JTcENB?=
 =?utf-8?B?djRhbUZKWE95dG1YOHZxbzBvekJJcFVRK1JBY1lvVFNqVnlPQWR2UjlhMXlT?=
 =?utf-8?B?QmZhSXo1aWpNR2w0dWh6Nk12SGgzMzkxS3RNQjlaZVdMcXlDQlhtMkV5QTlU?=
 =?utf-8?B?ejhYZ2JtVHd2ZE9MVlNEb1RlRStZRUVCSlNGbzU1amRyMXlieU8yVDNCQjZC?=
 =?utf-8?B?QjJqT0Y2cUVpRzh3WExqTlpnQ01rOWs0Q3RVVld2cmVZYzNUQ3RFMTJwRks5?=
 =?utf-8?B?KzhqT2g1cFlWbEI1bXpRWkJqRmt0bkV1bW1WRjNOcGlGRkYxdUdFT2NPejVs?=
 =?utf-8?B?eW94QWVTT2Y4cTZUcG9ka2NtWStsWnBNczlDVE1NaytYM1dVZFZHL2VLbXRn?=
 =?utf-8?B?cXlDVFBtdU5BRlZkVGU5N0duOHRPMWNya01JQjI3dzcxQlNZenowWWk5YTJW?=
 =?utf-8?B?WGFYS3F2VThDYndPd1B4SmVYT1ZQOFNQa3k1VVIwdHV0T0ZSclRNSFZOYXdC?=
 =?utf-8?Q?06q8O6tfgrF1s?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eG9aZnFQK2psaXBHUVh6S0hDNENDekN0N2hCNGRRSkljd0JEbk43UmU3RjFF?=
 =?utf-8?B?RGJSTTltbUNiKzRuQ1g4SGZra1pvOEpsdnl0VitLa2EzNEQyRmlEZlByemtU?=
 =?utf-8?B?TlVGWitDWXM1Y1ZqcnhkS3M0Yno2SVM1MW8rZktKSWQyZFdRZ2VNdEVJMlZa?=
 =?utf-8?B?bEtsTVlnb3RDV3hjVVVSTnFNYWc2WnRNeWpzWmxNa0NYTHlBSTlhek90elBr?=
 =?utf-8?B?Qmp3a2hHZk52bXpoSlh4MDdiVkpaRlBYbS94SmRqWVZLUDhPU0NPeFY1ZHoy?=
 =?utf-8?B?QU9Ub1NEZWFZMG5HY2wrQTR1NVROTnBxLzR1VzQ5TWwyTUkxb2NzcENmVnBj?=
 =?utf-8?B?SXduVlVORXdQN3ZmYTIzYkVmcXdYMDJ5bG4xaXZ2ZGkzWWx1L1JOQ3hZRDYr?=
 =?utf-8?B?elFJODR5Y1FubWw2MXBPSVd5VUdmSWFQRXg3UklkTVhQbUkvMU1QNnVGZEdz?=
 =?utf-8?B?UFBlamhzMTFzQzhQdHRSSEF2bUY3dldKYUNtVDd1TzZra1E1T1ZINnBMNjBV?=
 =?utf-8?B?bGlubXJaSkdNeDhlWHdOaG5FM0RWTlloUGIvbEVzcXZvRDNES25lZFhobURI?=
 =?utf-8?B?WXZETVNzeWJQS0k5ZmlESGprM0w3UnBPSmhrMWlYTkxCcTBTcFI2cDVlMGww?=
 =?utf-8?B?MThuZFlnT1d3SGpURG4vdThrMlQ1bmlQVzFoalM1dnk1N29QVjVWZkpPTVov?=
 =?utf-8?B?VHB4d2FiQ1RnWjBVTk5BeVFVM2t5TDU4RTdnYi91VVdic245ZmtieHVQMVVo?=
 =?utf-8?B?SDgzeHZNM1VFNms0cStlcjBCRlFKT2JhaDNPZXVydzhlN00vYk1ERkxKNi9s?=
 =?utf-8?B?TUhVZzNSN2liUWxvZnhsVEtkY2F1alY2MGRLZmhmc2JMZ1NXNzZNbnAveFVM?=
 =?utf-8?B?OUJGNTN6Nm1hRDNHM2J6dndzMDZyLzZJb0N6QjlFMXZZY0lGTStyRzFBMmFx?=
 =?utf-8?B?VmxkSTVVNTluamV3OXFVREtzeTlUY2VtblF5OWpwamRzYjdkUGQxMTFBT1FO?=
 =?utf-8?B?c2NCb3hSYVFMb2p6ZHEvLzlQY2U4MVQ5YjdkNVJDdDhsNEw2RmFyMFptVG5S?=
 =?utf-8?B?TWlzcTIxWmNxZmt4OVZCZDJvdkRXMlN0c1dGbGRBd0VoMmdITEVpdFBaV2ZV?=
 =?utf-8?B?VUNUVjNRcVRQa283YUlMR2xtMXhNR0g2TGh2bFFvWmVFQXNCeHdja1lzNm13?=
 =?utf-8?B?M2Zsb2lzQ09zaHBoWnNTNCt6VmFuZ3Jyb1M2WVVNdVJmaUI4eDZ5Yk8xS25s?=
 =?utf-8?B?ckZHWEpDKzVMK0VVVURMbCtLKzFybWN4Y0NOSjB2OWliSDE2TUJ2KzE0Vndu?=
 =?utf-8?B?M2M0Y2RqTlF6bEw2cGpSbXNqL1U0b29EV0lFYjJsZzhRcUpYUGhLVHlLbnBr?=
 =?utf-8?B?MHB3SzRSSUtPT0xVSDl1aHpuWWU0NUYxL2t4R1lNcisvdVN5WTY2enlsWkkz?=
 =?utf-8?B?QURFVm5rejZpelNlRTZtRmFWeCtsNm9BN0p4VlF6b3lxN2xJVUxwMmdGV2hv?=
 =?utf-8?B?d2w2NlNwRjBjc25zT0kxbGRnNmxqcE1lNFJOQ2xJWDVuVUNob25EOE9heHRu?=
 =?utf-8?B?dlRJY0xrV2luVWE5eThMNUpabDZKMzBNMzNPNVI2ekxIbDArdXF5azl4bm0r?=
 =?utf-8?B?cFMrcnU4UmRtNmxRVzRDdU4zV0g3OTFuWC9pV3Bub0h1V3NyYlpYSmlzVEp5?=
 =?utf-8?B?M29kQjJUS2theE5sNVIyTWFJRmxydXc1M2sySzdrQzFmdkpXbmJxZXA5Mys1?=
 =?utf-8?B?N2JVVVlyVXNqUXQxTnp6TFc5SmxiNHYybWpnMnJseFFBT2d1ckQ3dHpDTjIy?=
 =?utf-8?B?SmRZMFdzRlEwQjNka0cxbVBVNmxici9mZHY3YUJyNTNoNHRWYkwya2k1cVhF?=
 =?utf-8?B?bWR3b2tZNzFpaGZwQnYveFdZS0ZpZjhVZjZ3YjY5Si9tTWc0M1lGOW1rK2xk?=
 =?utf-8?B?bUFtYmRBclZLc0ZEN2JGTk5rUStjVWtjKzU2YmlmRGhrcW9XSldIVmhWZWs5?=
 =?utf-8?B?a0R4TFY0UnJ2Y3ptWEJjUTlkMXVYYUZKWFNYcHJIWXM4aGZ0YU5UUU15MFVE?=
 =?utf-8?B?eGM4VXZIblVKVzBwajQxc3AvSktsV1ZLSW1hUG9WMjJuWkFMYnc0MVR4VmU4?=
 =?utf-8?Q?Tj5klXfYGMvz3Zw0JW0thQlnc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a20c17b-8620-4c22-a0ff-08dd527f1f4b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 13:53:29.7508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /52dK8QQ7/fwFwV81OA2Vk71PpNZWOM061RpRZ0Hl5I7yDAaXoImZkWVo4cy7m4+AQY5ILZpjnLgXFlVe2D/aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7945
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


On 21-02-2025 17:23, Tejas Upadhyay wrote:
> Above 100 char per line checkpatch would complain. Fixing it.
>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_wa.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 744dba4fdb58..d4982799383c 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -599,7 +599,8 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>   	/* Xe3_LPG */
>   
>   	{ XE_RTP_NAME("14021402888"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>   	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
>   	},
>   	{ XE_RTP_NAME("18034896535"),

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

