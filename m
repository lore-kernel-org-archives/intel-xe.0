Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2861CA0EEB
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 15:27:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB9610E616;
	Tue, 19 Aug 2025 15:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aHim7x56";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0C410E1E9
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 15:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755617258; x=1787153258;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F+/XM0wQFSuRXdcHwUUoxVUdXY5UFaylDVyc9vtRL3I=;
 b=aHim7x56dsICAknDrrRQYW0YJ39ytsEobzu7AdPz9VeOmZeLHqHoCuYz
 zHJ/RHc6nE5SexE5NIRbohp7h4k0y5r2rId8Rqt/gQmf2RU/2mscpBtxS
 5Jt8XWuXMKqarRNSjXOswuaiK6x6x9t80+3QLAbWEA1PJGVH3HqQx0RSk
 Jgn2x0jriE/vputnJtt1Vj2QDJZ4vfZBrjg9u53j9d1ml/l8GksFhVjlk
 HiDskMXLOX9W5Sog7OPDcjkZLJAMetQ1OrJYFKQAEquAqtRm/ZksRBRLW
 PDtHQAZJhEkjLV7wwn7AbENNBIck0JtRVubS4ns1jVB23gGGkdNJ6uqIT g==;
X-CSE-ConnectionGUID: DR5ier36TIO5WQmRS3iAWQ==
X-CSE-MsgGUID: eJCTcoBmTMO7iYdktUd0TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="75438131"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="75438131"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 08:27:37 -0700
X-CSE-ConnectionGUID: L2CEuyhGSii7RnGl6/UT2g==
X-CSE-MsgGUID: 3RecpHikSnu9imvftaQP5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="172111640"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 08:27:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 08:27:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 19 Aug 2025 08:27:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.78) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 08:27:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mVCuRQ0UfmIj3jpmv0PI/i8sqlmV7rM3Wz7nAf14wk1fHnlGbwTlnhmYJZEY+o3MQ7WMJxFYUZhSg4qjjfqkNgqiLKTwezNZQ14nj+/9LTXgkddXPpMT9SE4vYDknVCkCmqltsz1ncQLpF1JAdImHxdNhSw2IItldiJVKHed9y/NP0jK4ERc3wQ6m5RC4yaQOsKhhZ7QIwKi2k9hwYKMbGQ4QkrJMfyEZWwIWeUj+FF6qG1u8yUIRo0Gl57kIJmCZ8kBtZTwFhHKt3dKbyjbL+4tZAD/COlWMxKPDNp/83/4DwUHRRRb8YGNVbkZIxmV+p9DUK4B0rcf3RwZTUFW9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=secNOO8a/kAUHbME0KAFLPLeIqbuoLNehX96ORs7UIY=;
 b=PwcVDnIWrcQg3Zm6zbz/S/NGo4WGxd5Kyt1o3E+xLfmPQJOjgpDIIuGIkWwPBSPFVZuU708SPvRketd+EJyDKuipeonyJlTDta2Acu4TWTpvjZYqRH5VB1Xt5bFomL5OFZQAIs6f8GP8C2tzyVc8zOFhWaI5CDbYPuMa20GkZ1mEa0gI5SA/gYNhM6EcPMblVHa6CApEujn6sGFV7leKlRhqcBbr5DE0+dZ5PvaU8PqXu84cJSTTEeCLYq4QR+E7lzq96ijRae4vR5wWOwXlUVAgkmctO/hWCP8OKy22Ig88q5Q1/n1uI3lgfkoEvdEDLOv38FNdi0FT9CUKbEGJIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS4PPF890B596B9.namprd11.prod.outlook.com (2603:10b6:f:fc02::38)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 15:27:31 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 15:27:31 +0000
Message-ID: <0c207805-2c32-4c23-8499-a30718086f64@intel.com>
Date: Tue, 19 Aug 2025 17:27:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vf: Enable CCS save/restore only on supported GUC
 versions
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20250818120005.24363-1-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250818120005.24363-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR03CA0051.eurprd03.prod.outlook.com
 (2603:10a6:803:50::22) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS4PPF890B596B9:EE_
X-MS-Office365-Filtering-Correlation-Id: b1c066e2-25ef-4589-d21f-08dddf34ea0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXFFajVzTHpsVUdlVGZyQlhld3FxOXVJVERDL3M0UG1KcXhJS2tLTkQxK3RF?=
 =?utf-8?B?S2xlRzIyWXI5R1FlZW45V01pcWhTVkFqOGJkd2lYTUIrcUxiQmNxMHdEZ0ln?=
 =?utf-8?B?d1NWNy9sbG1Fdk5BZ2phUVo0eUU2LytrdFBBdnEwTkJUSlczeVR1UmtvVHNs?=
 =?utf-8?B?S0cxMlJBU0RpN1h3MW1tWG1Ubi9CTlBDNUFYR1ZYSkxONWh5ZDZYVzY5SUNl?=
 =?utf-8?B?WmtXUGdaSlBXSDlFK05uRlJmM3pmMzRqUG94V01Ba1k1VGl1Mkgyd080NXVi?=
 =?utf-8?B?SGk3UVZ5c0o3Q21xdkQ5NzZiWE5ZbFhuOWgzMjlRREo4VVh1NEUrUm5XaHUr?=
 =?utf-8?B?R1h0Y1lwaUVwSHlrMFJWbjhDUVA2aUEvREV6eFZTODRLdTlrUlhJZW5QdFZ4?=
 =?utf-8?B?SWFJUU5WckNNNVNHWlBrZHNQMHY3N0RvaXUwNXNjdnk5d1l0SjFONnQwcndM?=
 =?utf-8?B?eXRESEhTZXB6UXBzSDhDNU5KKzk5UWNyUi9OOFZDMm1MTXRLeDRaYzl0YU9F?=
 =?utf-8?B?VTBWZ09PUmdRTHpvc3JIYWhrZGZYcHNvSXlTaXRySE1uUkluMU10dk9ENk0y?=
 =?utf-8?B?YmFDUkI3czFNQmFEeUF0Q0grYkNibzY4M2Q5dzd0Sm85dHFlaHhtdXhYV0wx?=
 =?utf-8?B?YnI4SXVoNWlRTU51TEczaU9QSG1EeUxzTXFvV0FTVVk4TzFYRFVFQWJESnpo?=
 =?utf-8?B?ZGlEbXVoTzhLZnp3K2ZkYnpHcWFZc3dOWWxVNW5vNnpXQkt5WVJQaHFOd3Jz?=
 =?utf-8?B?Zlp4aXlWMURvdW1BVWFXL0Z0dkhOcytKRFRVVXNwQUZOZElJcENFS3dYMFVj?=
 =?utf-8?B?c2FaUWZtWDV6YzkvRkE3aDJvcm56NEM2RWJCTDF2ZVcyUCtuM0lWYTBpaXF6?=
 =?utf-8?B?T2tvRWtNZGJnaG8vdXVXZFBoRDUrclB5U1BtRldKcDZCZmRkWFhsK1NGRkw3?=
 =?utf-8?B?Y1FtNmh1UkF0SlVXb2JhTDB1OFU2M2pISXlvTzAwR2RRYjlrNHloVFRDL2NM?=
 =?utf-8?B?dDlTREwvQWdwZkdIYUJlSFV6bFhsZXRBeS93QkRCVzNSWXVvRU1OdzlDUlVL?=
 =?utf-8?B?clI5TFkvajdBU254OE1oQlZra3pTMk8rMnQrQW5Hd296aUJpKzNobmorcVEv?=
 =?utf-8?B?U3RiOTlsbklPN1NFSmp1NS9MTXhsNFFYSjJZdFJCKzFSWE8weEtoSzNJOXVq?=
 =?utf-8?B?eUVja2dXODhOSXFCK2pxVTBEeWU2OXZmUjRUTGhETWZLS2h5RFhoNjNrN3ZU?=
 =?utf-8?B?K0VuVTBGb2ExaXdtRmtYMXZnc2w1d1hxMmZOSTY3MStvcGVnc1FYQ3VSL2ls?=
 =?utf-8?B?STdrL044RDFWLzNTamY2dG5kYldWM29HSG9vMXhheHNpL2JUVWZvZnlKVENU?=
 =?utf-8?B?czdUaXdGdDlJK1N6MG5HU2MxZmYvckVnVFdXU2pEZ2gvWUdDclVmR2J6N2Y3?=
 =?utf-8?B?eTJmdktOcXRRZDRYdTJLWXNnSkpQVzdTWWNnZnFXQ2lJeUVqYzdDTnpoanVu?=
 =?utf-8?B?aXRZbW9qRWF4cmZBY2RiS1RKYnBjRFU4UDdNOVVnWkdRRSttUmliMENmd3NV?=
 =?utf-8?B?MG14L29EdGo1eitTS3Yzd2g1YWZqdjdPYXdnSTg2Y29UN3lkY08wc3B0L3g4?=
 =?utf-8?B?dXJOWlplbDNmRTVZeXRWOEhSVkdSNGMzYWxucWhyYnhUUDNXYTVTNDc2anhk?=
 =?utf-8?B?bHJLblp0WXBLUkZNRmN5b2RZZDJyYXgyRzJBNVpJTkRiUm9qWVZCZkVyRC9F?=
 =?utf-8?B?clRoNjh2NFJCZnQ2ZTRRSTlybW9iM2RXeDZCcm15U2VrVlJkLy9OeEsycHBN?=
 =?utf-8?B?aFYyckdsQThvZzZqNGFHK3lvVEl0RkFJWDN1aGV4RnNwVlNQbzZWTTViQzJI?=
 =?utf-8?B?eFM0VG5YbkhlckU2Y3l0TUNsUzVBdUZHbTdsK01tL1dRakx6aThFRVJXMERx?=
 =?utf-8?Q?GayvvWzCk2U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?am9RZ2hmK2d0RFlHa2NtSEd0SXM2V0orNmxpOWRsdWw2b3pqOXF3QWluOWU2?=
 =?utf-8?B?SVhFd2F1bDc4RmgxQXBnWFdDNGtxYXBVMytiWWVyUzJ3aTdZN1RTVkhkNDgz?=
 =?utf-8?B?NURUdDNleC9SbWkrZlIwdFE4ckJQSVRsejFiNHBGamZGKzlseC8ybmRwOTdL?=
 =?utf-8?B?MkViM3Nhc2VKVmJwRUl2QTlTMjlCYyt6bEd1OWlDMEI5bEFCSW5Zc1JmTDlM?=
 =?utf-8?B?c1hpa080MGY3MmIrVTU1d2NXU1huNEZNS3c1Y2dhbGRSd2tPdXlPcFc2WEF1?=
 =?utf-8?B?Q2tRZXhnY1lCVUZ5Y1g1OFZXMy9sbUFCeGd4OHdPM1ROVG54cDlJSXI1STlT?=
 =?utf-8?B?ejZrQ1FObktpOTVmVGcrOVY0eVpuNzVlaWVVOWlHWEhYWGxWQys5QjBneXhX?=
 =?utf-8?B?cVI0Y3J1Y0tMWEU5OHhoSUNlMW55cDA2aWt6OXp5SS84N2E5SmgxS0hsbEMy?=
 =?utf-8?B?UWYrNEhYeGVsK2M1dWx2eWt2QUppTWNnY1RJcm4ybjMrNVlmaFY2L2pXWFRu?=
 =?utf-8?B?VUpRRUUwWUxkMzRTK0lCeWplVWxKWU0zdWZBM1RxRDdGcFA0UkFuNVNFbFJh?=
 =?utf-8?B?emhib3dQOThUQ0Z3SXlOMmpnV1QxTU9CcXBaazRGRThXSWxSYmx0bWFYL0ph?=
 =?utf-8?B?bXRFNDVqMmJyZEJXdWVuV2J1ZndOYlZSc0hBTDNGc3U3YmMySWpSWEV6MG9F?=
 =?utf-8?B?Y3dxZmVybG90b1dyaVR4Ykd3Qm13TVlscmxvWC9LYmk3T3dONmRPVzZhRFJR?=
 =?utf-8?B?T2xrVDJzMi9JNkRIZ2NUcUU0dVBsZktFaTduOUlwYm1wc2NtdURMS3dBQllh?=
 =?utf-8?B?cm80bmtIU0h3disyaUd2dXQ3bERNbExIQW9FSWhOLzZKbjJXT1Q3WkNtRStD?=
 =?utf-8?B?dGtJeFFoZ093VGcwd1NncTdWeWRDaEJiVU9rODRqVmxRRkhET0ExU25ubmsr?=
 =?utf-8?B?QVBFZXVLdTh1RUN2WXpLblNGNWE2Uzl2Q1Q3c2xlRUdXdG5CUHhlRlZFRzR6?=
 =?utf-8?B?amY1VldKWW02aThtMDk5eVlKc3BHMWtSbENaR3NGWmhmRTRqc1IzanZNTm81?=
 =?utf-8?B?OS9KemZEMndSbXRtYXhqOGRTcFNzL2hBb1pyZG9FMWozVDhab3VXSW1mS2Z3?=
 =?utf-8?B?aVFrUmhmbmpWQ2ZnRGNieGYrdndPWmhrSHlnSWxKQjN3OTV2Tk43bGU0MWl2?=
 =?utf-8?B?VlFtTkNLdmJ3WS90d3dQYUZ3N1VLWFcyOS94c29GbGRmdnFNaWc5TThNQ2Zk?=
 =?utf-8?B?dTMxenhsS1VsMGVQVWNSaWFQTXJ4SytTTWpjWWpxcnhzWUJjUjFISEg0TzNm?=
 =?utf-8?B?MUlkVzFPY1FIVWpRdlFoa2xyVElNcmNJNW9kRmJ4ZDA1TExMazJSY0ZZVGlp?=
 =?utf-8?B?SFFBZ3pRZUFpT1V1ZWNsZkNsa3hNQTNieDNQbkJLcUhHbnBTSU41NnV2c05P?=
 =?utf-8?B?Q21xVlZ3cTlQSytvZHpoa2I1bk8wNElCOG5EbVN6WmtiZ1ZIT3pzTjNFcXdM?=
 =?utf-8?B?WTZFcEFQM241eU15S0R1VFdnUFF6TXpBUEVkSCtvWmJqZ3JKL2E5TVIvMXVq?=
 =?utf-8?B?TmE1eDArNlVkNHJmQWFoY3I2cDRqK1BBS0VxbUhpbytCQWVMK204R3ZYOXJL?=
 =?utf-8?B?M2NDNlNnNXVnNDd5Q25NelZkTyt1b1JDSW5OZ04za09nUG5KL2RlVnNJM293?=
 =?utf-8?B?RDJXa1BLanlGd2pIeHpZR3p2V2lJQWtEenNtZElDdmQ2ZzJoOGJqWTZxOFhm?=
 =?utf-8?B?L3VMY2NQNHVkOWxZS1h6MW5XVVBmS1UrZ01POGl4bU9ZUUxUVWlZMzRKV0Zs?=
 =?utf-8?B?MHJjcWt6blRNbUFhWU5ocHlZeE00VnlQdzhta2tBNFVTcWdzNndEQ3JwSThv?=
 =?utf-8?B?UlI3bkZ5blMrT1ZNdUl3MVpRekZ2N3oxcDcwb01XTDFUckowMTd2YkI3OFVO?=
 =?utf-8?B?d3BuZG16OWRpWUw4T0lGeG8rK1BpWUpaeUZGOHFMV2ZzTnd5NENyWGVJdVNt?=
 =?utf-8?B?NzhvZkdZSjlrMndEQ3NxT0tzOWxxUGxlcTJrOFNBaHl0UTV6RWJacUJzZnY2?=
 =?utf-8?B?REF3WkVpWjlRR2tucFFxRDBycnNHNHoxYUVOdUUzYkV2Z09UZWFxbVJDZTJm?=
 =?utf-8?B?Q2JIclQ4cXoyQmZzVHQ2L1VadVpiZVdOeFRYdVZvZHBBQmxFSVpNVHBtN3Ju?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c066e2-25ef-4589-d21f-08dddf34ea0b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 15:27:31.6742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJul8TH1vmbn37FO959WMiwbGdOwXty96MnRyMTjpn6i811ggrn0TvANAaF9nurP6KExJhQxdi+k+OBwn63+btzeqeDJJcP5U4VIsHpTHH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF890B596B9
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



On 8/18/2025 2:00 PM, Satyanarayana K V P wrote:
> CCS save/restore is supported starting with GuC compatibility version
> 1.23.0. Gate the feature on the GuC firmware version and keep it disabled
> on older or unsupported versions.
> 

you probably want to add 

Fixes: f3009272ff2e ("drm/xe/vf: Create contexts for CCS read write")

> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov.c              | 1 +
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index 87911fb4eea7..27f70b5eb4c0 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -11,6 +11,7 @@
>  
>  #include "xe_assert.h"
>  #include "xe_device.h"
> +#include "xe_guc.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf.h"
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> index 93435a6f4cb6..928266580221 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> @@ -17,8 +17,10 @@
>  
>  #define IS_VF_CCS_INIT_NEEDED(xe) ({\
>  		struct xe_device *___xe = (xe); \
> +		struct xe_guc *___guc = &___xe->tiles[0].primary_gt->uc.guc; \
>  		IS_SRIOV_VF(___xe) && !IS_DGFX(___xe) && \
> -		xe_device_has_flat_ccs(___xe) && GRAPHICS_VER(___xe) >= 20; \
> +		xe_device_has_flat_ccs(___xe) && GRAPHICS_VER(___xe) >= 20 && \
> +		GUC_SUBMIT_VER(___guc) >= MAKE_GUC_VER(1, 23, 0); \
>  		})

hmm, if we include this check here, then we wont be able to
tell the user that potentially required CCS S/R will not work
due to old firmware and there might be some issues with that

maybe we need two checks:
one if this is NEEDED and other, if it is SUPPORTED

btw, those checks should be rather defined as functions in .c
not macro in types.h but that's subject for other cleanup

>  
>  enum xe_sriov_vf_ccs_rw_ctxs {

