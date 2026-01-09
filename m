Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958DED26D71
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 16:21:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4607D10E05F;
	Fri,  9 Jan 2026 16:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="faKM2C5w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6DD10E05F
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 16:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767975682; x=1799511682;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BldP5HV6zC56QIDQ1WU3/FI7HL/ykx1T4uDM4EbQ5K0=;
 b=faKM2C5wxtd6CSo6Q1wa+FZL67/Q3q7ql7lQf+D3fZPEmOlAA1pp1w4k
 0CThuSgyeKKnP7uD2YUThvOn2NkiZ16HlJMpN6QgQshNbg377C14Le9Rw
 QpvTZhx4YllsqyEDZZsbqhHQhkgeBNeb4WwZHtKXhogut4zRUzXdEs1eO
 ZWxVYU8Jr1qmUCY3dxdIlymuRXBma0KNKQA2SK+bg5meTuvDxYlXtv6fN
 4ZlPUKdFmtfVXNtFvEKoNJxD/j0JMM2iIEzw2FcCDNZ0/lCHmoe20CKJV
 Tey7i5cQllx51VzvTTrC2qIhsaN8wYm6+FJ/P+WsEm1fwPJmeOJUujB8z g==;
X-CSE-ConnectionGUID: L5o8R4PhTpOzLn8KzGyGLw==
X-CSE-MsgGUID: Kd9VS2r1Qp6G5l3DOKXcvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="68558086"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="68558086"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 08:21:21 -0800
X-CSE-ConnectionGUID: Jgvo81U9S/W6cEo/5491eQ==
X-CSE-MsgGUID: ZXDFbjT6RTCqCWpH4NDhfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="203129010"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 08:21:21 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 08:21:21 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 08:21:21 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 08:21:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fH4Z1uHhDd31sLWw7ER/3Oi2ulX7Kz6wGgFUWY8ZyDLsNb/qAgWmTfsVItdAyNwx8aYH2kebN7GrEShpQPGzIBjs8cQJvlhT+ImvT7TGI6drS727Z0+9u7IiIwucvaK2MOiStEWzJjMmUK98qHc/o6gGG8cZEbET8tsgjLmq+CEnB8ZLkhzpwcRbalfRpsNEp90Ny+f2wpNKV2v8o0CNau8WLXxlCKRy2zWBi9HWhk7dx/kQtappPeZDCBgj1Bse6363oCqC/XleXytT2o2jz1gVyXeoeQJubwTagc9LjBMdlKOkjalj22iMBRhoxyf3YYlEAVwdTMugolkyll8PDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAEeH9IsWhNrsEwubk6A94Se18tvzxn+2Jv7hSd7S8I=;
 b=qGWP5jjTdcPv5rz4cYJgyXM7JeccMx+4f3mANlgcRBdCg2wVir3j+K/H1j+IOWzRBBnYYcbgiUwPNVPayGaT/ZvR+Q56fxlMuxjXWWsXP9aZCUSgxBc+7XQAptJFPkqmg3BURBu3WfA6oqPkVlQltfHlvR3/B4ZfyIpSLeN1yCwI8gOY6Xfn43d/XkNa4cc0t58lLQKbBf3kJ8ymQSimNw4Tb99zlxFTS+Lc+lD2Pp3UE+TBn9adMnF7sbXybHStbzIE6Ro7a9RvSmCLGcnXiPFScqtHFHBIvZ4f/OwE3nGA/fSXRXXL6XDhhiamajD38q3jAFrE6TcwfulF2zYJZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DS0PR11MB7577.namprd11.prod.outlook.com (2603:10b6:8:142::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 16:21:18 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 16:21:17 +0000
Message-ID: <1c7655c9-2fc3-4110-aa82-727c17056fdd@intel.com>
Date: Fri, 9 Jan 2026 17:21:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/xe/mert: Use local mert variable to simplify the
 code
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260109151219.26206-1-michal.wajdeczko@intel.com>
 <20260109151219.26206-5-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260109151219.26206-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0022.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::34) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DS0PR11MB7577:EE_
X-MS-Office365-Filtering-Correlation-Id: c00b8dd8-bcde-4d84-fcda-08de4f9b1df6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjNCUjJjamxMNjEzV2U3Z2s0djIxdEpBNURXeUQxWWhYZ2RjU1hzSWhyaVVV?=
 =?utf-8?B?cGU1cE5ERS9uY0hZQ29zTENia1dBTmtFbDFwRExYeVZ3U1dkUVNOeHVvZ2FH?=
 =?utf-8?B?cDBobEZ3UG5kWDVqVDZQVEUyUkhZVmlBV3l4Um4wWkdmTmpZS2J5VThkOSt1?=
 =?utf-8?B?aVN1L3ZxU2MxcEdyaG1pT3dPMHF1ekJXTWFiK0NQKzFYUGwzVXBnZEduVklM?=
 =?utf-8?B?a3FkZVpzUEZ6OWZHZ202dzdMWDZJU2tMSzdNd3VJU3p4NWtrZ1R5M3BwbWxr?=
 =?utf-8?B?c3hrQjBmTHBISGxSdjhUMENPWXRjclVkcGgybm9lczVDb0VYbHIydTZ1dTVQ?=
 =?utf-8?B?SVVCeWNFVzlOQldjYVBZTGVNVjdWNk1ZKzg1b2lCM2h3QnFyak14UlRRMjBK?=
 =?utf-8?B?K0xPN3M2R0lBb01DOGRwNUQwTHAxenpDMmVoS1VIcDZHWm0yZks3YVlkYUdG?=
 =?utf-8?B?Q3YrV3pKWVJCNFJXaW9jNHlRQytzeHpsemhGRUNqSGY4TkxKcUlNTnc3d3cr?=
 =?utf-8?B?azdtZWxHaGJYK2lzenhXSjdIM2dWREhwTE9mMkV0NlRzVFhHa2V1RnAxdE9a?=
 =?utf-8?B?WUhTUFM2NUgrbEd2Vnp2eHoyU0ptVGpoUXB5RkNXYVk2aTJ6ek9ZQWJPSnJH?=
 =?utf-8?B?QTVienVHWXByUm8rUmxOQVVhanN3dmhkY2dUSDgyNGVmQXVpKzY2NnVzYnNZ?=
 =?utf-8?B?ZC9NdHRNNE54RjZIQ0ZEbTZKVVF5bDBmWjFhcWVHYURqaWZlZkN0dElheldk?=
 =?utf-8?B?QkxmYTdEQlNkMTQrYkpiSGJMOWpUay9DVzZSa0twcFdJalcwaHFXRlF6RWFI?=
 =?utf-8?B?YUI3aHZ1Nm5OUmp6cFRwRmNEQVhlRTU2OGtTckNweC9ycW1mMEJhMlhaZnJy?=
 =?utf-8?B?WlZTSXlVOUFLbjZhaFZ4cngxMTVCbTlyMWRmOVRSVjVoclFmd2ZocEVqU2pp?=
 =?utf-8?B?ZVlCcXcyNEtqYUVXZG1udUhLY1dBRC9GaFFTTGVPbFZMQmlHWjFoWXRvKzF0?=
 =?utf-8?B?UWd1YnFBWmhqcnVYWFh0Q1h5dDhKNFdpczExNG9tdWxoTDdPVk1GNStCQUQy?=
 =?utf-8?B?eHNuUVcrNFQyVTdZc3E4U0xFTUlJTi9BTjRoZFVSTTVWS29jcE9YT2J5SU8r?=
 =?utf-8?B?SkI5NUtrQ0NId2twRHpxdG1GemJzRHdGSlVFQ2xmam9Vb203ME5YWXhycHlP?=
 =?utf-8?B?RkdkOStWT1NweG45Z2I2WlgrM2ZZN0xWT1JXMG0zbEZvUXk0VTRpQ0JIUVNk?=
 =?utf-8?B?c1p5YThwWlByV3F1Vmo4QUkvNE95MEtCQTYzdzVPMklFcm9hMlo1Wlo0VTFu?=
 =?utf-8?B?ZWYxSDg0M1poWFdNY0FsRHdBVE1rNElGdWJwKysyR1EzUVRWOXlQc2daOUxU?=
 =?utf-8?B?aW1jR2haM1UyUE1tNmRNRFRROWJuYk9SVkUxdGRjVVRwdVFWU0dUKys5aGw0?=
 =?utf-8?B?SFdMSENsUU5WUGdwMkJmc21yYTRFTE5hQUZjUngyak80RHhWU3gzWHAveGhY?=
 =?utf-8?B?L3BVaWJVRUh3dHNob3hEbjlzYjBQTCs3QVF1Qy9QMDUyYkViWnhXbEJHUXlm?=
 =?utf-8?B?cmhPRDB2S3p2Z2FWeEZzQUlZLzhMSUJjTm8zZW1FcnBvNEJPRkpEVGZzcFU3?=
 =?utf-8?B?elRYNXpDWExBRlhtOGdKUXoyS1JXVnFkS1VMeTdzdkkvSFkvVEMzQUc1R0hi?=
 =?utf-8?B?RUQ4b3BWVUxNTll0TVczZm9mUWpJSHY2d1B0Z2lrYXpaSlYvTWJKd2hMMGRR?=
 =?utf-8?B?M0hjZWQyS0VWTUw4NXpEdUdpWU1OWmt3UmREa1pNdzZDR3o5clE2K2gyZU9k?=
 =?utf-8?B?cUN3ck5PSVBzYXlieXVOS2U5SjNRZ3NVR2g2cmRsdC9BdFVjQzBETEJ6S2NW?=
 =?utf-8?B?dnFEblhDSGNXVENVUmdxZFgySUZ1UHpRRThBcnh2bDQ3M3M4ZDk0cTNUajJD?=
 =?utf-8?Q?JyqcGR7vbkFPV4xdfAtNtrfrFTtSO7RR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3FweW5yc2VhdDBsOSs5bXB2aDZLS0tPQVhEeXYzdldEMkc1SzNYM2JOSnMw?=
 =?utf-8?B?M1cwUWNhaGVLME9uSTVaRHlZbVNTK0c1ZnVtd0dubnNsMUlEVVpZVnlLVTRk?=
 =?utf-8?B?SlFXTjFWenZDZ3NmWmhyV2IvamJ6YzQ0WlRwZTU2aGJ0MFFHWUU5Wlo2d21P?=
 =?utf-8?B?YjNqazQyMDAzUktweUZtcHJrSzVHOUFWcDQ5MnBSMTBQbzBMVExKUUV6WmNp?=
 =?utf-8?B?c2N1V0JKYzM4UWZzZ0xMTGVMY0U5YXB6L2ord29OYnpxK1RXN2l0dUQxc1Iz?=
 =?utf-8?B?aENDZ3NoTDZkUmQ2cUNLVFdCZkJaMVl5dFBvOUsxazVGb21TbHlZRnpFaHhw?=
 =?utf-8?B?Tm9MSGdTQ0FZVFl2TTdCekZUTytsMFVGK2FKYzh3dDRSS0l4ZVRZQ1E4c1FU?=
 =?utf-8?B?VHRneFIzMHpvUGpBbnFQV0lDcjhIeXdLQWhxeWgvTnFRYnU0OFp2U3dlTGJk?=
 =?utf-8?B?eU5UbkZKK2lORWJIbXpDVTNLeFVWcW1NMWFvVEpLUHVNK2V0Q0QxcnM0RmdC?=
 =?utf-8?B?SWhJUEdzd3g1M2RqQ3owOU92ZTlPMFYvbEMxcmdoZVd2cjhYWnJCOG93bjNM?=
 =?utf-8?B?N01DWnJ1bGFXV0JFUTNyZ0FtcE1xaXZRZ05rT0RxUFFOOHlTa0FLd0VrdGh1?=
 =?utf-8?B?dWUrSktlU0ljVjk3MjVKWmlMWFRUb2VveDQreFA3ZVBwM0JPWlJxby9rSFYr?=
 =?utf-8?B?RmxiSDBaeWFvb0tJTEZaeDcyaUNWQitLR3A2RDVRbmtSaEIwQXphTUdjSlFv?=
 =?utf-8?B?NVk5dG5RZU5mTGZnSWI0NzJzcjFRTjh5M01OZjBodUdPVlAyNUNBV3dmcE1s?=
 =?utf-8?B?MVE0bVEwRHZ0R3l6Wm5ybFJ2dnFGYTYxdkZKbzZRZTdOUFRBeXMweUZiYkt0?=
 =?utf-8?B?VVI4d0ZKSjBQbUo3dlI1TGdnOGdydkUyWjlpOXpQcnR6R29xU01hVStMcXRy?=
 =?utf-8?B?QlJQNFFSWlJDYi9pbWVMSG9IWVhMblBUVlF0dGVrcHkrQ2kybXR5Q2IxelAr?=
 =?utf-8?B?QzRCZWxDcVlndkVKajZmb3E2UHFMY1hlSm9EU2h1M1FSZzkxZ0JqeWh0eHpw?=
 =?utf-8?B?NDJFYW42TDBFWGJSRXh0amNZUmtRcUxKQS81d3h3VVA2Y2hndk1VQ0FQb1Vh?=
 =?utf-8?B?cmZ0dE5hVUhlNzJIVFNFVjJjc0dodVNodEF4bnJLNHZPU0huYWVWY0VtZUpl?=
 =?utf-8?B?K0w2NElERzZSVWRCYjd2R0kvNU5MNHlNZlArNVZYYUdmTkxnbkU4cVVmU0Mx?=
 =?utf-8?B?aGRyKzRwOThmVDEzMDNrd2J3aWttZTYwd2RFSkFYSzJkWnVxYWVHbklLcDBJ?=
 =?utf-8?B?Y2ZBZ0dqdG1VckN5bGx6VHdTVW55YnA2SjgrT3VDd1BKeTVhM0E4TjE2bzI0?=
 =?utf-8?B?ZEozUnJwMHgzM3J0VUl3ZlhtVWwzcms0cEY0aTU1NGVBWXhFY2UwVytSOGUx?=
 =?utf-8?B?VTI2dWMwTkdFNWUzZ1hLZ3hEWnZTVEw5K0pnZ244aDdHUjQybVZsaHpJTGt3?=
 =?utf-8?B?R25nWkp5RHpuUHR5UzlISXRmT1RoRlB5TlVaNERHY203UkxiUHhDRExBNmdx?=
 =?utf-8?B?Ujk0cnFsRUVWdFJuRnJWYktWZzBxUlUyaXVqUWc0VVYxNkEyak1GTEFCdDVz?=
 =?utf-8?B?N3ZjU3NleHZobXIyVThmSlVWUkFYUGJqVkprc2RKOTRCNGZIZW8reHpPeXY5?=
 =?utf-8?B?eUY1cGFIbVF6WU0zN3BLcW9YNkFzU1B4am5UWDFkeUxkU3hHbWRveHpoVUpw?=
 =?utf-8?B?bG1HNnBSZk1WQ1dESGpBdVZFYUs3djF5NEVsTzFJVFZYL1A2WmY0S0dVbndy?=
 =?utf-8?B?M095YkhxYkQ3clU5eEJjajJYR0VQcVBwNGxDMEt6ZFE4WEc4YnZ2dTV3eUhx?=
 =?utf-8?B?ckpqaFRnMDlyY0wxNDRGNWRCbldWdC8vQU9Mb3N6UC9qYlVEM0VCTHF4bXhK?=
 =?utf-8?B?NkNvZU9HQzA0ZlAxVkZjRUxqK2pEbFVmYVBFNExYQks2NUt4OTh4NHEyUVJG?=
 =?utf-8?B?UGdMeXpGUkMzUU9ST0t5UnoyWWd3VnZJVVQ2NXl1WTFKelhZMmU2RWFyV3JH?=
 =?utf-8?B?TTU1TWx4cUJ4N0YxcHJVNU5sVzdIUklGRFF2SmQ1eVZWc3cwRnYxUHJUbWV2?=
 =?utf-8?B?MTZmOVIyZzBtaWxCL3NjazNUUXBQMmFIQmVwZllPMEpjT2tYRHh1clFoTVFo?=
 =?utf-8?B?YWQvOFpsY0YyU2QyV2ZleGxEZit0b0VtZjJWNytuaWkzRWFkdW5Pa2pqd25o?=
 =?utf-8?B?Vm8yYTY5eXJFb09MNWUrcXp5em0wNXpCcmVYaVJlMTNna3VENnhMMVNncDlU?=
 =?utf-8?B?d3ZZZktmVjQ0TCs1S1NRUlFvYVUwd2xRUnZaTCtsVW9HQjY1NGk4Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c00b8dd8-bcde-4d84-fcda-08de4f9b1df6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 16:21:17.6514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTqZtZySFsjXlr7Zdu8kYCtJ2ofa2IwBG2ioS3DGGetatprlUeyiXZpxxxyzVWmHEcgXgcnmZ8DkLpSncgGGjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7577
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


On 1/9/2026 16:12, Michal Wajdeczko wrote:
> There is no need to always refer to MERT data using tile pointer.
> Use of local mert pointer will simplify the code and make it look
> like other existing MERT function.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_mert.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_mert.c b/drivers/gpu/drm/xe/xe_mert.c
> index 5aea6f082bc0..d139663c45ce 100644
> --- a/drivers/gpu/drm/xe/xe_mert.c
> +++ b/drivers/gpu/drm/xe/xe_mert.c
> @@ -53,6 +53,7 @@ int xe_mert_invalidate_lmtt(struct xe_device *xe)
>   void xe_mert_irq_handler(struct xe_device *xe, u32 master_ctl)
>   {
>   	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_mert *mert = &tile->mert;
>   	unsigned long flags;
>   	u32 reg_val;
>   	u8 err;
> @@ -70,13 +71,13 @@ void xe_mert_irq_handler(struct xe_device *xe, u32 master_ctl)
>   	else if (err)
>   		drm_dbg(&xe->drm, "MERT catastrophic error: Unexpected fault (0x%x)\n", err);
>   
> -	spin_lock_irqsave(&tile->mert.lock, flags);
> -	if (tile->mert.tlb_inv_triggered) {
> +	spin_lock_irqsave(&mert->lock, flags);
> +	if (mert->tlb_inv_triggered) {
>   		reg_val = xe_mmio_read32(&tile->mmio, MERT_TLB_INV_DESC_A);
>   		if (!(reg_val & MERT_TLB_INV_DESC_A_VALID)) {
> -			tile->mert.tlb_inv_triggered = false;
> -			complete_all(&tile->mert.tlb_inv_done);
> +			mert->tlb_inv_triggered = false;
> +			complete_all(&mert->tlb_inv_done);
>   		}
>   	}
> -	spin_unlock_irqrestore(&tile->mert.lock, flags);
> +	spin_unlock_irqrestore(&mert->lock, flags);
>   }
