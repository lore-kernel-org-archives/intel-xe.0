Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0890AC71148
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 18:05:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B841310E1DC;
	Fri, 13 Jun 2025 18:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mQ2/zHhu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F108B10E1DC
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 18:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749837926; x=1781373926;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=cLONoBXdkIZluCSCtkazoh2zueaC2wTjSatzFaBEm2s=;
 b=mQ2/zHhuBROw+E68vu86V9i8VveFiMzppXdvCTHZStwUbEEcExMWjGa4
 mXGVJ4MhdOivhkU15Oy2TBcolRhmxihChnAbOGHYNIfPfiGjIKuilhGdF
 UifMJIl5fLuSRLqTt78lghzmeN7Uu77IneDW8U9So9Pf0YdWIDIxz57XC
 i7LOW/A0YVd3X8lhzPJczO3EkbNqtNWdvkjjll7MQYS6dRs2jMnLpREOH
 PhrXrzCeNIt/QhOs1+YpYFXUgoZz9nouazEGJ7MuOG1oSXJCE285qa52o
 70XFALMFVq0+jwjVJ//CVtYz9yq+JYGEZqh2yQ5T8eNQkfCN9EP/InTuP A==;
X-CSE-ConnectionGUID: YRUXSx7GQVWuihz+V85SJA==
X-CSE-MsgGUID: +WKLKDfASruejowqSVWK3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="62672650"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="62672650"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 11:05:26 -0700
X-CSE-ConnectionGUID: 96P4tzvMR2KlACQG6nLr+g==
X-CSE-MsgGUID: IrgE3CNeTTOYwHjqiXM9fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="152656925"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 11:05:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 11:05:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 11:05:24 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.49)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 11:05:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWHqar2Xb7+9wX1mwYXY4AZ3PMHlQhMy3jki/M3VNuQNyyq/o05LWApcUY1/CJMvLRH4+5DeVYXogGtS0Q4CfDDG5MiK4bN3mqZtzSVO0QdB9gahUVndVG3rYix+U6FOr0KOC1Gj0Zcp8agi31xXZLk4UF97BAKAXQfFlSIhKZ1dJlmJfMuOggK+TEsQ83XLb4AT62U0mpVUbME/csnMAtczBYv8QyxWVc3j20cJnDSr43iiK8J3NQN2a8LBGwJJh6C5l+vd5b83xWA8uryBZQ2O1HdbH/Eni79Dq0CdApiZVYt4m8b4qiHyO2AzPWITr2qEfhx6dizKDVmvQOQOew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aw9ONwtYl1LO9lZo0JzfanZdpkf36OeaUOSbBUSJ/Yc=;
 b=QjXNv8AcyALfwHF0nf0xs7zlueS1dvLZCg/BE1MW7sVwgh85zK5Cy+8JfXjhz4J3AlInZwRt1YHdwasApiwL7cHvgohXcQLPdTiSOIK3WBL9UtPmvEK52So6PNGC4vFOq/FtHmVAx74IKLREf/Pf4otfnr2g+P5cH4xn9GBZ8fTi2Lx3Kqvn+iaEcFpgPKza/rvNvIC8625N4cvoF7ZDgrNvZEl9uE3YAHr5IEcGdZmNeJNM1HAk1UYseoYIfqyN7N8lh/0TMgpDmgqFJ8qqrhgQBiLHWbKkn5EhiyMbU5E2kkB/MXd1YRuVMHg1h5/ihL9silTqEt1ZxF+16rVeQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SN7PR11MB8111.namprd11.prod.outlook.com (2603:10b6:806:2e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Fri, 13 Jun
 2025 18:05:22 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%5]) with mapi id 15.20.8769.025; Fri, 13 Jun 2025
 18:05:22 +0000
Message-ID: <ca47e8f5-aaf4-44ae-a09e-d938f367848a@intel.com>
Date: Fri, 13 Jun 2025 20:05:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/8] drm/xe/vf: Refresh utilization buffer during
 migration recovery
To: <intel-xe@lists.freedesktop.org>
References: <20250612102449.1412058-1-tomasz.lis@intel.com>
 <20250612102449.1412058-9-tomasz.lis@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250612102449.1412058-9-tomasz.lis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0261.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::28) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SN7PR11MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: c88b1690-322c-46a3-96b7-08ddaaa4dd35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2syT01YS1FxbDRIdDIvTnRqUHpZdFhjVmdPNVl1T01NamlPUEtVRlF3RGJP?=
 =?utf-8?B?azVwOGltYTVxRzZoOUpla0h5Tkh4WFV5RFY0a2pLeFlkNzJYQWJ5dFBTVW9Z?=
 =?utf-8?B?RGVVUTJrVERXWkpRY2VmSFowb2NPbVhoWW4xYkNIcEdTMDJpSlFlTXJGUVJh?=
 =?utf-8?B?R2RDZVV3SUx3bWs5dmVMeTJrRUZqTlErTXlmQlBRQll0VjVGQ29XVWVORGJi?=
 =?utf-8?B?MHd6Rk5lbkV0MEdOalo0TEJFWE0rcC9WVlhOeUJFN09KT0t2VFE1SFdkTHhp?=
 =?utf-8?B?bFR4bGxLVEVqTEpqTE9WWGJnMzJnSDA0Q3RUVVhaU21vNFRNL3A2SkRRdy9E?=
 =?utf-8?B?YUFrbzRDVHhKM21JbkplVWk3dTA5Rmd2b3NKVmxiQ0V4L0dNWVJjOC9rMnlT?=
 =?utf-8?B?WUl0WkpkUVBVdm5TOGFrQytOR1NDUlBoclhTNjBTQldBQVVJQkxlamhwd0VV?=
 =?utf-8?B?aUNuczNUYlBSd01PdGRCVWRsckZYWE5LWWZKS0huYjNTczRuZUhWYUE0VFdX?=
 =?utf-8?B?VHZFUmVXdTUwWitYS2t1M1lKempIMkx5Vk5idG12elkrUysxVGJRT0tqbkcz?=
 =?utf-8?B?LzVwY1lqdjl2a21Sck5HVEp6aU93WktDVUxjdzZKUDEvMzVkc3lwUEJTcVJ2?=
 =?utf-8?B?WExEZ0xDM3oreW96ZzVMSXhjM2VRMTd2M1M4OTNITXBIZWZuc3hkRHRsQ1Z2?=
 =?utf-8?B?NlVMZGtCa25BQkhKNTlocmw5NFhxWitRNkV0aTVzcmRBVEk0SDE1eUttS0ZJ?=
 =?utf-8?B?SzRVRGorWmIwTU9Ma3BvaFRvamVsSDkrZzFpbVhKZ2xUTm1sSi9aZWlLWkVP?=
 =?utf-8?B?Y0ZuekJBajhoTzB5WHgrTmd6Q1RuQncvQ2RtdjZFbXV3eFVuYnRneTFWQVYv?=
 =?utf-8?B?TnlLV0tUMkt6M0pGaS9PbkNnRW53UlNwUitST0pUU0NkMjgzQjNURzIydGR5?=
 =?utf-8?B?ZHBObjFBU0R6OGk3UGhaajVVamdEMEU1WGZIcGE3VnNJRnErbytsOGZIOTRY?=
 =?utf-8?B?TUFEbUpJcXFTVXlQaTZRRE9ZQm01K3dXSUFWcFV0a3RUWVU0enNFRUQwUWhX?=
 =?utf-8?B?eUR4Q3B4ZVBUaHgrSmFyaERoTGlaVFo0NzBJVDhSR3d4YUt4SlV0KzRJRTFK?=
 =?utf-8?B?OEhtMVBhbzMyYUVqQVVhNUR1SjY2TU1lemRIWlZJdzR1MmdxRDhHYTdFWTVD?=
 =?utf-8?B?VVJnZ2ZaT2IrOEZEUHVRSnNwbUYzZ0czQk54MlQrZ0wwZ3ViZ2c0clUyeGV5?=
 =?utf-8?B?SW9RN3AvT0gwRkppZisxcGNXZ3UvZzVUVkZjU2JnOHAzY1oxalViNDZ5Y0k2?=
 =?utf-8?B?SHk3K3lNWWlldjlCVFZPemtaQkI5MHZqM1c5SkRxbmdtVVpPaXp5NWw3Sjgx?=
 =?utf-8?B?QjFBQWpybkc4K1JFQlBCcjJFSUprN00yR2c3Tm9mNGtqa0JLcnlMc0FyQnBj?=
 =?utf-8?B?Z25LaVhraW9aTXdtVytlWjZVL1Y0M01YM0dBQk9qQnY1b0ovNVJESHg4UXhS?=
 =?utf-8?B?VXllVENHcVRkM01wU1dxS1BJVlJ5NU5OS0JpMUhaRkVzTXdFcnBDWlRYZi9D?=
 =?utf-8?B?TTR6b285dExOcitNZmprTkNaaE5nMlIrR1cxdFJGMEkxL21XbkFxRS9pYnBH?=
 =?utf-8?B?cGpiN2lBZ1QvN1piTTA1eU55ZXdtTEZUQzNTVkR2ZzIvVU9IZG56dHk2ajhi?=
 =?utf-8?B?aFpnNE1CMm15eGxrQzhsZTBhL05hakRjSGVXTjBtaEpCVmhiNXVvOUhBa3dQ?=
 =?utf-8?B?RjNZVDd4UWlORVZIVnNOL3pGcmJkdjVXclduVlI1cUZSMDhsS3ZIY1k1VkNj?=
 =?utf-8?B?VkxwZzJ4S2c4aVdNaWhoRVFjVUpFdk41WjloTHBGQUtuYXZFN2Z3OEVlNk5V?=
 =?utf-8?B?VForY0swUXF6ZU5ZMXZSTGFRdG13T0ZmS3djeENhMzBpZGR3U1N5WGRRZDRu?=
 =?utf-8?Q?a6fSzZNsLGw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzVvWEdaakt4NkkwbHpBRlM3akxNZ0x0UmxDZ0lPK2t6djFxRzg0NjczbjlI?=
 =?utf-8?B?cGRRQjZmSXYvdXdNOEtaUndwZWNtc3lhZkZjTGFjVzdON0Vkc09WRk1kWHNL?=
 =?utf-8?B?Q2dTbnJHRXd6ejMxTytRd2srUkJFUm4xaGExT3R0TWU3MEJOaVJtTTU2UTN6?=
 =?utf-8?B?dElCWDd6ejBwUlZxdGl4VUFZT2FtNkN2Zis1TmFENmtuYWJJeldCdjhSSFN1?=
 =?utf-8?B?VmxJd1RXdkxJVWpUYTdnNUtIbXVUUTFLS0t2aWFuUFg2QjI5clZROVhnYVcv?=
 =?utf-8?B?bTY3UWFSSVRhOFFsd29SS2ZqS0JVVWJCZWgyK0tQOWd6cThaQXdGYTNyQUht?=
 =?utf-8?B?MlZOdlp0ZTBjOXJKc3o2YS82QlV1Y2dvK3V4UHVsUUp5OU9jcG5tK2lDNVFz?=
 =?utf-8?B?eCtuR1BvOE5wbXM5K3lOSSszNnQ4bXdEUW9FTnBGVjFZbU42aWtRV05TdFYw?=
 =?utf-8?B?UkZzT2VwRWJJZE5oNFRZS0x0emVON2RYRUFYUC9RWHBLZG0wdjRUT2ZmN3hp?=
 =?utf-8?B?UEV0QXlwaW1JQTlRenZEN05PM1RrcENaNGJnSVd4SUtpT0ZKak5wK0V5TVdp?=
 =?utf-8?B?L0pRNmZTWVVpOUMyNUVHOXFYZzlLOCt4VHNWUk9velY2alJ6cXQ0UC9nSVFE?=
 =?utf-8?B?em1YanVVRXRmSjJGcFZTVlMwZFp2ZUxITHJsVXFEa1NPZ1hlbWZibWo4TTZE?=
 =?utf-8?B?TW9LcVBiZHBQd1hmTWE4eXJUREhmaVkzQnRIYW4xVzc0TXRlUVg3Vmc2Slh4?=
 =?utf-8?B?Um55SEpuR1J1akNBa1RFUkRPQXhaWVBRMjBJc2dZOVhZbHZmVEJHNzhUbFIv?=
 =?utf-8?B?MUdXeC9SdElpYlM5ekFGcDRUTG5BSG1SUnVmNUk1bEdsWVpkY0FQTUxLYzBs?=
 =?utf-8?B?NVNqQlVMcENYMXFOWW5zSUxnQWNmY1BPMWNWWTMxSEUxOTlQQUlMQnJSRGhk?=
 =?utf-8?B?RHlBMWwrRk1DT1VJTXpCb2hUYXczanlTQUorZFpDbmJoeHc2dEZQTlZPaDQ0?=
 =?utf-8?B?ekFKczlJbEd4MUJsM2J5N3BzZ2FtYXRuUUphcnNNMEFtMEpnMG5za0J6RVJ6?=
 =?utf-8?B?MlZ5Vk83STZERHhkZDdPZURWbWtGY0w0a3I3UjhFZmYreW1Tamx4bTFBSFBQ?=
 =?utf-8?B?QXRNMEF1dWlCUlU5OXg5WUxaUTExeU1XMUVxSWVRczFXV3gxendRN21PSjZD?=
 =?utf-8?B?V1lDVEdjcTNGY1dnQ0FGcUtCNFhwbXBnSUw5SVNYTnNJekRoNllXWnpnZENy?=
 =?utf-8?B?OXVReFVFYVhZVGxuSSt3QzBCNHlrSnBqQS9rUkF4NFQ0V29hZVlRcmFIMmJB?=
 =?utf-8?B?NDNkdE1sVnc4TnBIWG5OYTh6S2tOb1M1Y0MvMVZWbDBITFY3WS9NeDJ1YUFI?=
 =?utf-8?B?NG92cFhlWGR3MU5Wd0xER3JmSGo5R2lRYk1Pb0NyYnkxUnpGSDVZY3FlOGRo?=
 =?utf-8?B?MHZibElWNmhBZE93Y0pJTlRkcDNBd01BYXJoZUsvOHJKbnFKMEt2eDZEcFV3?=
 =?utf-8?B?OFB2Qng0aVBDVkk5aXQxbFBPYTIrUmpYQjhubUwydlBXKzdXaDl2YytSQnBV?=
 =?utf-8?B?QXVuUENZWFFONVpCeDFPRVhmd2RwMnViRVRaZ1prb0JuZmdrcGNZOC9YL29R?=
 =?utf-8?B?Yk1PYTdvV2VUVmNZalZ5dHptK1hHSTk4MC8xdldZbzZpam90bzJ4Z1ZCQ2c2?=
 =?utf-8?B?VU1nSFZnc1dkSnh2d2NlRk9LNytzVHpteU5pV2orUVFOZGc1ZHVzM01QUlpH?=
 =?utf-8?B?RW1QZnNJcUh5TlVsbVNCS3RBRHM5cUJVNEV1czQyc3NZVTdwTnZaTWVGSjRn?=
 =?utf-8?B?K0hWc1k5bHRLSXNlWXpNbGVXQjlUZnhSZ0hiK1Z6c0NJYW1xZFpuVzhJM0tH?=
 =?utf-8?B?NUJJZDdDUi9hS0YyNVE2NitkcXpreDdxMlFRV2xmRnByWHZ2eEx6b0tRNFJh?=
 =?utf-8?B?U2NKTDkvTFhqd0VKS0U5aVZDZG1rQms1dWhHK0xFbFFtMmdYQmY3Ti85L0dm?=
 =?utf-8?B?NjBiOGlpZi95OEdDMkVwRTZPenA3N1RPL3UyUG1DWUoxMnpubjJWYUZGdVkz?=
 =?utf-8?B?RGs2NkpzeUFwRjFpa0xqL1cwblZOd0ZRaW43bjJLRzNMVUlhWWhUekQzN1pt?=
 =?utf-8?Q?8jULz/2i+O37vrhvD/X5a1mrj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c88b1690-322c-46a3-96b7-08ddaaa4dd35
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 18:05:22.1888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 676j0VfxhcYIsrferQq2x8vSkWH0J+q646iIfVWC9Ja/MLDs8OSqWtCMXNQr8uQhqEEq850x1K+6kji//IHlsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8111
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

This patch is now invalid as it uses setup_wa_bb() which calls kmalloc().

We try to avoid kmalloc() during post-migration recovery, so will have 
to develop a different way of fixing WA BB.

Currently calling that would lead to a deadlock possibility (and even if 
we've solved that somehow, possibility for fixups apply to fail).

-Tomasz

On 12.06.2025 12:24, Tomasz Lis wrote:
> The WA buffer we use to capture context utilization contains GGTT
> references. This means its instructions have to be either fixed or
> re-emitted during VF post-migration recovery.
>
> This patch adds re-emitting content of the utilization WA BB during
> the recovery.
>
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c |  1 +
>   drivers/gpu/drm/xe/xe_lrc.c        | 10 ++++++++--
>   drivers/gpu/drm/xe/xe_lrc.h        |  1 +
>   3 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index d5ffb550bde7..dc2bcda1d636 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1041,6 +1041,7 @@ void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q)
>   	for (i = 0; i < q->width; ++i) {
>   		xe_lrc_update_memirq_regs_with_address(q->lrc[i], q->hwe);
>   		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
> +		xe_lrc_setup_wa_bb(q->lrc[i], q->hwe);
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 8b08c416ccf0..9f3331779dae 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1011,7 +1011,13 @@ struct wa_bb_setup {
>   			 u32 *batch, size_t max_size);
>   };
>   
> -static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> +/**
> + * xe_lrc_setup_wa_bb - Execute all wa bb setup callbacks.
> + * @lrc: the &xe_lrc struct instance
> + * @hwe: the &xe_hw_engine struct instance
> + * Return: 0 on success, negative error code on failure
> + */
> +int xe_lrc_setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>   {
>   	const size_t max_size = lrc->bb_per_ctx_bo->size;
>   	static const struct wa_bb_setup funcs[] = {
> @@ -1218,7 +1224,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>   	map = __xe_lrc_start_seqno_map(lrc);
>   	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>   
> -	err = setup_wa_bb(lrc, hwe);
> +	err = xe_lrc_setup_wa_bb(lrc, hwe);
>   	if (err)
>   		goto err_lrc_finish;
>   
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 801a6b943f6e..8f05620fc0f0 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -127,6 +127,7 @@ u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc);
>   u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc);
>   u32 xe_lrc_ctx_job_timestamp_ggtt_addr(struct xe_lrc *lrc);
>   u32 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc);
> +int xe_lrc_setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe);
>   
>   /**
>    * xe_lrc_update_timestamp - readout LRC timestamp and update cached value
