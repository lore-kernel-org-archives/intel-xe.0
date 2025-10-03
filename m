Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3960CCA471
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 14:31:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF1B10E125;
	Fri,  3 Oct 2025 14:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l/KYx9/B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8653210E125
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 14:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759501865; x=1791037865;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SLxf274vlTcMAT1uc20VjmeV2AswppM5bxxnPsX0Sik=;
 b=l/KYx9/BkuHuHGnh5HE1ZvhsKFJrv9pVWV+xwroYQ2ZAwUikrzme/OX8
 vofvmMOLFj6OdXy5+I9iwuoRrWU8O2qC7Crv7Vb9VqcnbyBGNKlQMC45x
 3jKbsJJk+FgOf4bJe8O4qEgIniWAUPE1/Hxp9r2DHFzpRgkRg3wP8DL2+
 /xJv092aIsvKWuQYvc1uYl/jAvQW4B3360oQAO2ecNXLS5xu0SAM8a1bE
 /1q5UslaYMxOiZcRKjrrBWbhBMhTGpGmfyhJbA1FRGTecKN+o0OLerxJZ
 j0P3rIndHp8nmRW5xI3Z9+AnPT3RK3/tss6IshPRZCttAJFKSLxk+zyuT Q==;
X-CSE-ConnectionGUID: sh9irUinQ5C6L3RUvYFCkg==
X-CSE-MsgGUID: wK9oi1xJQ1aAju5MqTdMeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61701284"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61701284"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 07:31:04 -0700
X-CSE-ConnectionGUID: +duWyEKVQhSoyt7bdU7g/g==
X-CSE-MsgGUID: wh8b+WCKSoOnXpwDbCU8Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="183318462"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 07:31:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 07:30:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 07:30:57 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.14) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 07:30:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YcNW0JnOZuM9OngBMSPTtGCdYmqBp69fICKbV46XUnA2F9WfB7ko7tfuqpC2WQLMeplp9mAizRKXna5SiJotEsHkiQvxkqQOIqArAFALT99D6eY4oIjuiNADufWhi4TJG+iJCFqjZxYxqy0LY7+gDyl60Mc/tAr64lw+rlzznUPo9ZGPt03RDjImWS+FYBdWVPjZjewNJbQO6F3kzBtlyX8sgs/limRb3raWzSry6gDpAwudnKGoxyybT6usAK34TatUCj33+3mWj6lZNoiyHSFA+ZqMGgEmKwrLfHKM1pvGj4DoubHqG4rgKcSgfqKbmfBEOFbIOcqNSMrQd/WuYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0o8VSdtQnURv95xFiQJ7UZ9yp1ONjT5NveK3+u3utk=;
 b=PJ6ZXcaZOzEzkwLBjiLBazs3kcI71um2NKYIoI4g31SCzlxedfByJL+eMrv2DXBdW3e4HN4Fx3meUmnF2asC+DHUAmFB3b7rUNqjp9iOOdCsLfqTxz3gadhDN3OrmdmGaPBd3JQ1RCcIfXOn1HXCtCMSlonXAPAwSftrhBYybxIHV+/NpoHn7OeI6DsCfBIFidw1TKFflEHSIANucDddvKGtF2CkaRbDgDUUdb/50+s6AgFIA9XinEgDUB3zGONG9UbnFH1Wqi7Y3bT8ADJawT5yArrm/uO7jDjgsVhPD5zYTxzi6C6q3S3+/NUuTjL+0Ej0NaaVdg1RTm9RHR5gHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by CY5PR11MB6090.namprd11.prod.outlook.com (2603:10b6:930:2e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 14:30:49 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Fri, 3 Oct 2025
 14:30:49 +0000
Message-ID: <905b12d9-bfc0-496f-a1c0-9f671b64547f@intel.com>
Date: Fri, 3 Oct 2025 16:30:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/34] drm/xe/guc: Document GuC submission backend
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-11-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20251002055402.1865880-11-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::15) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|CY5PR11MB6090:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f6fbe60-8034-4377-40e5-08de028972e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUdzaGZUMEJwY1RKdFF2cWt0aXcwbno4T2ZtemV2a2RYYlRucS9tTWxZVU9O?=
 =?utf-8?B?TVE0RTh4Rk81cWJoUEZCdWZ6RDJtS0F4VHY2SzV5alJQRE5FQTRraTN3MGRz?=
 =?utf-8?B?RXkxdlYyVW5iRG4yK2hja0RKQTN2OERVa0l4bE8zYjN6WE50RUY2VWJZdkZ6?=
 =?utf-8?B?cHg1WTd6eWt3VHd0S28wQ25iRkZSL0RYMXArSmFiM2l5WSt5UHp6QmtacUZM?=
 =?utf-8?B?c0xKS3NGcjZTcXhldERQdllPZko5b1F3YUczV29iVHVpZHh4L2x6Qy9XTGdF?=
 =?utf-8?B?cDVXZURsUHg1aUlkVGtRZlp4MnZOUDlOWW5DRnY2SVZUTjQ4bjNMRTJNNi82?=
 =?utf-8?B?U0thckZwWFJEOTdhaytGVTFtbVdxZUNMQnZrWTlzeFNLNHFEM2JsbVR3VjFV?=
 =?utf-8?B?ZlVpSlNHWHp0TFo2YjBsTzhuTW1TZTRzZGZVcDEvbUVpaWZPeGdpRWk5UG1T?=
 =?utf-8?B?V1ljQzM5YlZMYWdaSkEvdzFJQWl3OUo3TjNRckxFRXFQWCtRUllmTFRoNXM4?=
 =?utf-8?B?OWNHVVUwelhUdW9rcGhGbGhxTjRaTHRXajlXM3c1WUNyc1NlWGtncUxsVHV1?=
 =?utf-8?B?UzZrQ3Z2L1pHbUI1c3JLcTRraWdpQ3NKQ3lrOTZLOVdaelptZEE4aHVLNGUw?=
 =?utf-8?B?KzYwdEJoc3Fkand4aHg2SEp0a1FjbHoxa2hJcjdQcW13TWJ2c1ZSc1pBTStI?=
 =?utf-8?B?K0F4V1o1RjYwemNuTTBWbExqMjVzUGZDc2hOZjdZSWFPeXhTOS95TlVmVExw?=
 =?utf-8?B?dFFncUVBbE82RXdXVGVGMG95aHVZNTUyeEpORmJOU2hPZHAxdXlOekhXU2R3?=
 =?utf-8?B?REUzYnJnRGF3dXFMbG1aNUhLd2I0d2ZsYVJRVXpyVGRvZEJJeFJIQVZXNkZB?=
 =?utf-8?B?T1B5Qk9qaGl6aGpXeUlEc0t2VXJwai9YbmYxbE9aeDBRdnRHMWxmZi9WMFlR?=
 =?utf-8?B?WU1hSlZZSHVYQzhGRkpGaDFkakF4L3RMbVpLWW1hRHkyUDhTMmRxM0s3clJp?=
 =?utf-8?B?WU12VEFjUDA5WTRiL2g0ZXQ5eEhkNXVrQklJRHVtbXNtNFByblpVTC85Ym1r?=
 =?utf-8?B?SlIwTnFtTGxRQUZwSGZkY1orT2pWUVRheVVnYllhdmtSTUY5dG56ZUxwNWFv?=
 =?utf-8?B?QUd1ZVJwMjJGa095dmNvdG16QWdTY1g5SndCT1Z3aHlNWjVUSEoxN3dDcGp1?=
 =?utf-8?B?TXBPZjFrMXM0T3hXd1Q5RVRwOFhLWnowaXB4Ry9jUnVsS2J3aVJ6d2F0TEsx?=
 =?utf-8?B?dmZ5a1lZZVZxY0FCSUtQS2xrZnVFNVpTbE5nSXZCdERFa24zem9VS0p3UTRG?=
 =?utf-8?B?NVVpVjNFWDc3UjNEclREWGhsMGN6aXdkQUVnbDhsR3o4ZDQ3ODBjRDNRVEsw?=
 =?utf-8?B?RHI2aXkyNzFYNjVUUC9VUk9DMlVhOTBmaUhLVkJOVGJJcW1yM1R2TFh2MFhC?=
 =?utf-8?B?VE1PWmJLbzJIWGNxb1hqTXFWdU5pYjk5VkdFdGQwWXpsTHhXNWVzNEVBQkRP?=
 =?utf-8?B?YUtrZVZMZkNEUjBFWkpwL1NuMHBHbnNNL3Zad05zNnBEc2hHQk1SV2NmSU5w?=
 =?utf-8?B?UnVEQXRGb3RaUWNGd3ZBTmF5dno2MHVnTW51SnVPV1dXT09MbG1PQlVkdlht?=
 =?utf-8?B?aGh4SnowUHRjMEFyTmpFTDRZb0RZN3hwMVRocjYwQzFRNnB0OE1jSzk4dmsx?=
 =?utf-8?B?eVZSMFB4QnY1aUtCU1pzN0Uza1hjNG1jeVk5bGdBWi9TMnVLUlZ5Ui81c1Mx?=
 =?utf-8?B?NFJpMXo1NHFPVk5SejVWZmRKTklwRWlNeGk5Z2NQVFNYS0owUDlWU3BnQkJK?=
 =?utf-8?B?MGVEREtXYlBBaDZWWkxjYmczbUhSVlovWnkxVlFndkVNMzdOT0treHJPUzZw?=
 =?utf-8?B?T3BTaUEySnlUWGVnN2htOVpxWjR3bWV0SDRlbUdrTThKQkNNY0d6Zm9Jb2V6?=
 =?utf-8?Q?3tVhxySLVQ5IOyZmxcfTZe+unKJlXz0q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUFzcXRIOUk1MFdLTG1sOWRObnYzdlZBWWNjRzhwRWNOeFNST3RKUEZIaHVR?=
 =?utf-8?B?d3Y5YWRZWWxRNEV1U3A1elF3bnBsd1NZdHZkK2s0Tm1oTnhHakFRTGRONHBk?=
 =?utf-8?B?Ny9VMXdwM2VMRzZzTW8vaEtFbEowbXdwWU4rMXY4aEx3cmFCRks3bms0NTZ0?=
 =?utf-8?B?Yi9NSENmV1VmbTJ5WForTDJVV1p1amNTbmVUZm1BR2x6WlY5STczTnRSSUFm?=
 =?utf-8?B?UmRpcXEzenpDQlFZRVZxR1YybHVUV0NZaTVyQ09KM1NNMkZXdnpmY2szL1ZI?=
 =?utf-8?B?K2JWM1JLMDljOUpGcTJSRmlobFc5Ykw2SHRBbXY4VktZK1FPWU44WlBOZ2p6?=
 =?utf-8?B?c01iYlM2K1ZJUEFEUEYzcDV3bklZSnoxYmVrSDR0MjNXRHNyMHAvejhzVWFD?=
 =?utf-8?B?UlFaM1B4eE82L3pRbU9hZjhJb2hsR2Q4U3ZKeWR6Z25DR21DZGdJZGM4eWpz?=
 =?utf-8?B?WEhPRkhLZkxJVUc1am84TlZxbFNwaXNnRGdueXhWVS9aMll0K3dNYjRDblla?=
 =?utf-8?B?ZlNhOWg0blN6czFiazNyaEFxcDgyUTAyenhxc3ZVV01XZ2k2WGQ5YnpDN09G?=
 =?utf-8?B?VmNlRnZ6ZXNqQ1lLcUNQSlhzRWpjVFhSNUtZNzJUTksrVXJyMnJNRFlqdWxR?=
 =?utf-8?B?ZHNCSFdteXpER1F2ajBRYmpmb0Y4VzNEVG53R2xsMWFlT0JreFdkbE9rMG51?=
 =?utf-8?B?eGViWWZkRmFwUkZ1c05HNm82YUZoTDVneUFhRkpqbW83SUcxM3JDZ2w1cGFU?=
 =?utf-8?B?UEJJME1pVlMwWVJiZVBhMmEvdW54WExCOXRmMDhpSFA5T1J5ejNxcVllVEJL?=
 =?utf-8?B?S0V2RnBTclJIM0Q1ZklFNDBQTHlsSSt3ZkNEclhIK0Nrb0FqREhFTFhHZmN5?=
 =?utf-8?B?N01WZFRsRllRMFh1bVZhL2VoZk0yOElob0pvUkl1RVRuWmQvbHY1LzF0WGw5?=
 =?utf-8?B?cEV1amNxelFUWEdFalVjY2lyTll5WGxtc0lDdjZPdEJHQWd5QS94SVgxMmJY?=
 =?utf-8?B?aW51V1BvTFE3Y1ZDbXBKMyt2bkFZZXFJTzNWcjJsU2xQQTZZOTlGaUZBUDUw?=
 =?utf-8?B?QXJIM0hQOEhPRXpHRUZFZlVURlhMd0RvcTlwTm9GdjB3TVpCWlJmdGhibmZl?=
 =?utf-8?B?R1EydWIyRVBKTGFNVHFXdWdseENWbjZrcDZOeHpKZ0JWejgxRWVvWENQZ0g5?=
 =?utf-8?B?VGtzbnJHWEJYZEJOR0NBaFhIZVpuUlIxUUZtQVMyWXZrVTlTSjJpS1BWb2M3?=
 =?utf-8?B?aDVKZktCRHJCV25lbVNVT282dSs2Mm5Yc3k1enhCNFBjWkphRHptdXZGL1dj?=
 =?utf-8?B?K2w5eGJpa0Q4bDlNWTFWM0c4QVczY21DS0oxbzIvSXBoL3hpS1FvRzZSTnlp?=
 =?utf-8?B?bExzVFdSekZJN3NSWGYxbGViZGVBK2pxSEpnVTk3c1RNWjFHenc3a3JlZ0ZM?=
 =?utf-8?B?WTB2aCtwYUlaNHU3am1iWDBHd0dlTFRVOFFyS0RtcDUvd3llWThGS3dOSFdz?=
 =?utf-8?B?Q2ZBdEUwQ3pTUU1VK21uL3NSaWNzdmp1VWc3aUI5K25QdVA4bTFrVHpEVnhq?=
 =?utf-8?B?YzVGb3BSVDg1SHFBNU5LR0tjUjlGWGRxQlVOR1JRVGhXSjZabUFEMmlRb2lx?=
 =?utf-8?B?Ym4zRGhmclVKcVhGOE82QWZJOHFscktISGtzVEdkUFFKdDN6MUd0dnZTU2hO?=
 =?utf-8?B?S0lYaE1jbjAxVm9RVnNZd3lmM055eTl4SXhhZFVKOExYL1JSQzROM2tJYTVn?=
 =?utf-8?B?Wmc3MmlBa2JnNExKK08xME5Td0hjZTZWbFlFREdydmgvcDMveFJCUkRWbEQx?=
 =?utf-8?B?MFZNeW1RSVI1THJ0RHoveWJkdVZQVDc2U0xSUytDeEV4TzZKdERzT2dLWlFF?=
 =?utf-8?B?NW9EZWZXanp1N3JITWZEZlptTE1iZjExVTRpMUlFbnNidThvRWpmS1pwSnBu?=
 =?utf-8?B?UmRTdWZFcldNdk5neFlZQTIwZEtvNUUrdGYzT0JPSCtnWnRTU3JvQ1J0L3Uy?=
 =?utf-8?B?WHlTM2FNY0dncS9aODFWRGM3bzFzenhkd0dremQyWWNoNnh0SXZOSitJY0pK?=
 =?utf-8?B?cjBlSW95cStzelVxSGVHbDVWT2Yxa0ttMzJXMHp2eWl1Mk9Ud3JpdkYrTFE1?=
 =?utf-8?Q?dz/2vGQkEkQFLqd2zab5R2HME?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6fbe60-8034-4377-40e5-08de028972e3
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 14:30:49.6924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZZeRS/MOyVhkblsXXMSsYadUQtrakhNl0UAZeL7o8SHpp6qsOGPaMVHv4B6oWzkJS7pTYJDDlMqnK4W9bo5yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6090
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

Repeating on request as looks like it got lost in v3:

We've agreed on separating this patch and merging with a different series.

-Tomasz

On 10/2/2025 7:53 AM, Matthew Brost wrote:
> Add kernel-doc to xe_guc_submit.c describing the submission path,
> the per-queue single-threaded model with pause/resume, the driver shadow
> state machine and lost-H2G replay, job timeout handling, recovery flows
> (GT reset, PM resume, VF resume), and reclaim constraints.
>
> v2:
>   - Mirror tweaks for clarity
>   - Add new doc to Xe rst files
> v3:
>   - Clarify global vs per-queue stop / start
>   - Clarify VF resume flow
>   - Add section for 'Waiters during VF resume'
>   - Add section for 'Page-faulting queues during VF migration'
>   - Add section for 'GuC-ID assignment'
>   - Add section for 'Reference counting and final queue destruction'
> v4:
>   - s/VF resume/VF post migration recovery (Tomasz)
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   Documentation/gpu/xe/index.rst     |   1 +
>   drivers/gpu/drm/xe/xe_guc_submit.c | 282 +++++++++++++++++++++++++++++
>   2 files changed, 283 insertions(+)
>
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> index 88b22fad880e..692c544b164c 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -28,3 +28,4 @@ DG2, etc is provided to prototype the driver.
>      xe_device
>      xe-drm-usage-stats.rst
>      xe_configfs
> +   xe_guc_submit
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 70306f902ba5..cd5e506527fe 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -46,6 +46,288 @@
>   #include "xe_trace.h"
>   #include "xe_vm.h"
>   
> +/*
> + * DOC: Overview
> + *
> + * The GuC submission backend is responsible for submitting GPU jobs to the GuC
> + * firmware, assigning per-queue GuC IDs, tracking submission state via a
> + * driver-side state machine, handling GuC-to-host (G2H) messages, tracking
> + * outstanding jobs, managing job timeouts and queue teardown, and providing
> + * recovery when GuC state is lost. It is built on top of the DRM scheduler
> + * (drm_sched).
> + *
> + * GuC ID assignment:
> + * ------------------
> + * Each queue is assigned a unique GuC ID at queue init. The ID is used in all
> + * H2G/G2H to identify the queue and remains reserved until final destruction,
> + * when the GuC is known to hold no references to it.
> + *
> + * The backend maintains a reverse map GuC-ID -> queue to resolve targets for
> + * G2H handlers and to iterate all queues when required (e.g., recovery). This
> + * map is protected by submission_state.lock, a global (per-GT) lock. Lockless
> + * lookups are acceptable in paths where the queue’s lifetime is otherwise
> + * pinned and it cannot disappear underneath the operation (e.g., G2H handlers).
> + *
> + * Basic submission flow
> + * ---------------------
> + * Submission is driven by the DRM scheduler vfunc ->run_job(). The flow is:
> + *
> + * 1) Emit the job's ring instructions.
> + * 2) Advance the LRC ring tail:
> + *    - width == 1: simple memory write,
> + *    - width  > 1: append a GuC workqueue (WQ) item.
> + * 3) If the queue is unregistered, issue a register H2G for the context.
> + * 4) Trigger execution via a scheduler enable or context submit command.
> + * 5) Return the job's hardware fence to the DRM scheduler.
> + *
> + * Registration, scheduler enable, and submit commands are issued as host-to-GuC
> + * (H2G) messages over the Command Transport (CT) layer, like all GuC
> + * interactions.
> + *
> + * Completion path
> + * ---------------
> + * When the job's hardware fence signals, the DRM scheduler vfunc ->free_job()
> + * is called; it drops the job's reference, typically freeing it.
> + *
> + * Control-plane messages:
> + * -----------------------
> + * GuC submission scheduler messages form the control plane for queue cleanup,
> + * toggling runnability, and modifying queue properties (e.g., scheduler
> + * priority, timeslice, preemption timeout). Messages are initiated via queue
> + * vfuncs that append a control message to the queue. They are processed on the
> + * same single-threaded DRM scheduler workqueue that runs ->run_job() and
> + * ->free_job().
> + *
> + * Lockless model:
> + * ---------------
> + * ->run_job(), ->free_job(), and the message handlers execute as work items on
> + * a single-threaded DRM scheduler workqueue. Per queue, this provides built-in
> + * mutual exclusion: only one of these items can run at a time. As a result,
> + * these paths are lockless with respect to per-queue state tracking. (Global
> + * or cross-queue data structures still use their own synchronization.)
> + *
> + * Stopping / starting:
> + * --------------------
> + * The submission backend supports two scopes of quiesce control:
> + *
> + *  - Per-queue stop/start:
> + *    The single-threaded DRM scheduler workqueue for a specific queue can be
> + *    stopped and started dynamically. Stopping synchronously quiesces that
> + *    queue's worker (lets any in-flight item finish and prevents new items from
> + *    starting), yielding a stable snapshot while an external operation (e.g.,
> + *    job timeout handling) inspects/updates state and performs any required
> + *    fixups. While stopped, no submission, message, or ->free_job() work runs
> + *    for that queue. When the operation completes, the queue is started; any
> + *    pending items are then processed in order on the same worker. Other queues
> + *    continue to run unaffected.
> + *
> + *  - Global (per-GT) stop/start:
> + *    Implemented on top of the per-queue stop/start primitive: the driver
> + *    stops (or starts) each queue on the GT to obtain a device-wide stable
> + *    snapshot. This is used by coordinated recovery flows (GT reset, PM resume,
> + *    VF post migration recovery). Queues created while the global stop is in
> + *    effect (i.e., future queues) initialize in the stopped state and remain
> + *    stopped until the global start. After recovery fixups are complete, a
> + *    global start iterates queues to start all eligible ones and resumes normal
> + *    submission.
> + *
> + * State machine:
> + * --------------
> + * The submission state machine is the driver's shadow of the GuC-visible queue
> + * state (e.g., registered, runnable, scheduler properties). It tracks the
> + * transitions we intend to make (issued as H2G commands), marking them pending
> + * until acknowledged via G2H or otherwise observed as applied. It also records
> + * the origin of each transition (->run_job(), timeout handler, explicit control
> + * message, etc.).
> + *
> + * Because H2G commands and/or GuC submission state can be lost across GT reset,
> + * PM resume, or VF post migration recovery, this bookkeeping lets recovery
> + * decide which operations to replay, which to elide, and which need fixups,
> + * restoring a consistent queue state without additional per-queue locks.
> + *
> + * Job timeouts:
> + * -------------
> + * To prevent jobs from running indefinitely and violating dma-fence signaling
> + * rules, the DRM scheduler tracks how long each job has been running. If a
> + * threshold is exceeded, it calls ->timeout_job().
> + *
> + * ->timeout_job() stops the queue, samples the LRC context timestamps to
> + * confirm the job actually started and has exceeded the allowed runtime, and
> + * then, if confirmed, signals all pending jobs' fences and initiates queue
> + * teardown. Finally, the queue is started.
> + *
> + * Job timeout handling runs on a per-GT, single-threaded recovery workqueue
> + * that is shared with other recovery paths (e.g., GT reset handling, VF
> + * resume). This guarantees only one recovery action executes at a time.
> + *
> + * Queue teardown:
> + * ---------------
> + * Teardown can be triggered by: (1) userspace closing the queue; (2) a G2H
> + * queue-reset notification; (3) a G2H memory_cat_error for the queue; or (4)
> + * in-flight jobs detected on the queue during GT reset.
> + *
> + * In all cases teardown is driven via the timeout path by setting the queue's
> + * DRM scheduler timeout to zero, forcing an immediate ->timeout_job() pass.
> + *
> + * Reference counting and final queue destruction:
> + * -----------------------------------------------
> + * Jobs reference-count the queue; queues hold a reference to the VM. When a
> + * queue's reference count reaches zero (e.g., all jobs are freed and the
> + * userspace handle is closed), the queue is not destroyed immediately because
> + * the GuC may still reference its state.
> + *
> + * Instead, a control-plane cleanup message is appended to remove GuC-side
> + * references (e.g., disable runnability, deregister). Once the final G2H
> + * confirming that GuC no longer references the queue is eligible for
> + * destruction.
> + *
> + * To avoid freeing the queue from within its own DRM scheduler workqueue (which
> + * would risk use-after-free), the actual destruction is deferred to a separate
> + * work item queued on a dedicated destruction workqueue.
> + *
> + * GT resets:
> + * ----------
> + * GT resets are triggered by catastrophic errors (e.g., CT channel failure).
> + * The GuC is reset and all GuC-side submission state is lost. Recovery proceeds
> + * as follows:
> + *
> + * 1) Quiesce:
> + *    - Stop all queues (global submission stop). Per-queue workers finish any
> + *      in-flight item and then stop; newly created queues during the window
> + *      initialize in the stopped state.
> + *    - Abort any waits on CT/G2H to avoid deadlock.
> + *
> + * 2) Sanitize driver shadow state:
> + *    - For each queue, clear GuC-derived bits in the submission state machine
> + *      (e.g., registered/enabled) and mark in-flight H2G transitions as lost.
> + *    - Convert/flush any side effects of lost H2G.
> + *
> + * 3) Decide teardown vs. replay:
> + *    - If a queue's LRC seqno indicates that a job started but did not
> + *      complete, initiate teardown for that queue via the timeout path.
> + *    - If no job started, keep the queue for replay.
> + *
> + * 4) Resume:
> + *    - Start remaining queues; resubmit pending jobs.
> + *    - Queues marked for teardown remain stopped/destroyed.
> + *
> + * The entire sequence runs on the per-GT single-threaded recovery worker,
> + * ensuring only one recovery action executes at a time; a runtime PM reference
> + * is held for the duration.
> + *
> + * PM resume:
> + * ----------
> + * PM resume assumes all GuC state is lost (the device may have been powered
> + * down). It reuses the GT reset recovery path, but executes in the context of
> + * the caller that wakes the device (runtime PM or system resume).
> + *
> + * Suspend entry:
> + *  - Control-plane message work is quiesced; state toggles that require an
> + *    active device are not enqueued while suspended.
> + *  - Per-queue scheduler workers are stopped before the device is allowed to
> + *    suspend.
> + *  - Barring driver bugs, no queues should have in-flight jobs at
> + *    suspend/resume..
> + *
> + * On resume, run the GT reset recovery flow and then start eligible queues.
> + *
> + * Runtime PM and state-change ordering:
> + * -------------------------------------
> + * Runtime/system PM transitions must not race with per-queue submission and
> + * state updates.
> + *
> + * Execution contexts and RPM sources:
> + *  - Scheduler callbacks (->run_job(), ->free_job(), ->timeout_job()):
> + *    executed with an active RPM ref held by the in-flight job.
> + *  - Control-plane message work:
> + *    enqueued from IOCTL paths that already hold an RPM ref; the message path
> + *    itself does not get/put RPM. State toggles are only issued while active.
> + *    During suspend entry, message work is quiesced and no new toggles are
> + *    enqueued until after resume.
> + *  - G2H handlers:
> + *    dispatched with an RPM ref guaranteed by the CT layer.
> + *  - Recovery phases (GT reset/VF post migration recovery):
> + *    explicitly get/put an RPM ref for their duration on the per-GT recovery
> + *    worker.
> + *
> + * Consequence:
> + *  - All submission/state mutations run with an RPM reference. The PM core
> + *    cannot enter suspend while these updates are in progress, and resume is
> + *    complete before updates execute. This prevents PM state changes from
> + *    racing with queue state changes.
> + *
> + * VF post migration recovery:
> + * ---------------------------
> + * VF post migration recovery resembles a GT reset, but GuC submission state is
> + * expected to persist across migration; in-flight H2G commands may be lost, and
> + * GGTT base/offsets may change. Recovery proceeds as follows:
> + *
> + * 1) Quiesce:
> + *    - Stop all queues and abort waits (as with GT reset) to obtain a stable
> + *      snapshot.
> + *    - Queues created while VF post migration recovery is in-flight initialize
> + *      in the stopped state.
> + *
> + * 2) Treat H2G as lost and prepare in-place resubmission (GuC/CT down):
> + *    - Treat in-flight H2G (enable/disable, etc.) as dropped; update shadow
> + *      bits to a safe baseline and tag the ops as "needs replay".
> + *    - Quarantine device-visible submission state: set the GuC-visible LRC ring
> + *      tail equal to the head (and, for WQ-based submission, set the WQ
> + *      descriptor head == tail) so that when the GuC comes up it will not process
> + *      any entries that were built with stale GGTT addresses.
> + *    - Reset the software ring tail to the original value captured at the
> + *      submission of the oldest pending job, so the write pointer sits exactly
> + *      where that job was originally emitted.
> + *
> + * 3) Replay and resubmit once GuC/CT is live:
> + *    - VF post migration recovery invokes ->run_job() for pending jobs;
> + *      ->emit_job() overwrites ring instructions in place, fixes GGTT fields,
> + *      then advances the LRC tail (and WQ descriptor for width > 1). Required
> + *      submission H2G(s) are reissued and fresh WQ entries are written.
> + *    - Queue lost control-plane operations (scheduling-state toggles, cleanup)
> + *      in order via the message path.
> + *    - Start the queues to process the queued control-plane operations and run
> + *      the resubmitted jobs.
> + *
> + * The goal is to preserve both job and queue state; no teardown is performed
> + * in this flow. The sequence runs on the per-GT single-threaded recovery
> + * worker with a held runtime PM reference.
> + *
> + * Waiters during VF post migration recovery
> + * -----------------------------------------
> + * The submission backend frequently uses wait_event_timeout() to wait on
> + * GuC-driven conditions. Across VF migration/recovery two issues arise:
> + * 1) The timeout does not account for migration downtime and may expire
> + *    prematurely, triggering undesired actions (e.g., GT reset, prematurely
> + *    signaling a fence).
> + * 2) Some waits target GuC work that cannot complete until VF recovery
> + *    finishes; these typically sit on the queue-stopping path.
> + *
> + * To handle this, all waiters must atomically test the "GuC down / VF-recovery
> + * in progress" condition (e.g., VF_RESFIX_BLOCKED) both before sleeping and
> + * after wakeup. The flag is coherent with VF migration: vCPUs observe it
> + * immediately on unhalt, and it is cleared only after the GuC/CT is live again.
> + * If set, the waiter must either (a) abort the wait without side effects, or
> + * (b) re-arm the wait with a fresh timeout once the GuC/CT is live. Timeouts
> + * that occur while GuC/CT are down are non-fatal—the VF-recovery path will
> + * rebuild state—and must not trigger recovery or teardown.
> + *
> + * Relation to reclaim:
> + * --------------------
> + * Jobs signal dma-fences, and the MM may wait on those fences during reclaim.
> + * As a consequence, the entire GuC submission backend (DRM scheduler callbacks,
> + * message handling, and all recovery paths) lies on the reclaim path and must
> + * be reclaim-safe.
> + *
> + * Practical implications:
> + * - No memory allocations in these paths (avoid any allocation that could
> + *   recurse into reclaim or sleep).
> + * - The global submission-state lock may be taken from reclaim-tainted contexts
> + *   (timeout/recovery). Any path that acquires it (including queue init/destroy)
> + *   must not allocate or take locks that can recurse into reclaim while holding
> + *   it; keep the critical section to state/xarray updates.
> + */
> +
>   static struct xe_guc *
>   exec_queue_to_guc(struct xe_exec_queue *q)
>   {
