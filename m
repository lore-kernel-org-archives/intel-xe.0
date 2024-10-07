Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCFDCFB43C
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 03:43:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED21610E00B;
	Mon,  7 Oct 2024 03:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A1NrnYP5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 385BD10E00B
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 03:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728272624; x=1759808624;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CNOVcNLEySiaeaVA8pHx8hya44ZravQNp8y8MibNN44=;
 b=A1NrnYP5dVIlWjKBfCewLTe5Dld9PuuEzWcgIUsbG+1yqS3RAraYghdM
 XiV3B0xaaUCVdOqJe4vaG8e2sB6DNd8X5VwLEEA+xOedCMkv+yy6umpAR
 LK4pltHdd+0cFHyVc5m6M5ac/nvoe0hYqsFSez8TlVherVWhrNhImNV3g
 bLQbUGHOqwNlthHyQkw6/A9oj1HywDCIeYPdhtVWcO9Zoiijzwpzj0kNd
 wztjqLXv0Y6UXEAWCD6lDT6eAQXB/YSlmtDQsX75Xil6thnFxVTr0hsNY
 Y0uJx9oyquZ63zIQW3SWRUVpJLRxgjARdfOiwPGDdevAEuCEFN4qK4KzT w==;
X-CSE-ConnectionGUID: xbP/QIUDRBC7OWaFYjzd8g==
X-CSE-MsgGUID: UDBhWYDoT32h7NI63hVLIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="38014321"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="38014321"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2024 20:40:28 -0700
X-CSE-ConnectionGUID: vIGmGI2nQGaQ7oEUFHiEvw==
X-CSE-MsgGUID: s6eNj79rRjuCJVvaWHAfGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="80170043"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Oct 2024 20:40:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 6 Oct 2024 20:40:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 6 Oct 2024 20:40:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 6 Oct 2024 20:40:26 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 6 Oct 2024 20:40:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mY35n7aZhobIIOpIKucVmdMrgzCUwSuRR2q7hD0DrSVsT2cS+6qwQ42Obaw2XZ3K4IC2v3jQe/+C1u5VePhfbo+/kshpIEw2RLKdnzoYOi4bkataJ6C2scNPw0TbEB6bO+zwgDtRsLtWNrW8Dw5L9NipWRfXrphbUh32TJBsbGVMBVXV7us9CVJRUoVv2CzkLGlTWhQLDShmXwJYgtPe4t2sSo7UuU+pUGm0eQPjAGDULZBOUFq5HtqWAPGaPLwVM7JgcqY7Fd4Uu1Jd4YkM6YrexWFSrDdNx2hB3y9AvDjaQtL3w/4KgiHfd6YfSXnBZXwuGYK2hgmFLkkEuOSKcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5miMt81Mue09wCu25YSxc2ubBCLRP5N484F3FPX404=;
 b=AS3uBvHqGiUARzAdw5shpSRSwAORDlB6CCXKjcZONieTB0rk5g9E86YvkrKsMTVN4bT98nOPh2PXPFdWCjPdc++GL8rrHVEQ6us2ixmxYGIYZB6A74DWXewpWCYPnvf9UP5T6XxufgUiBAeGDmA5ohl7FFWT0wnuYedmQiP44xojKttB07+nyeNLZUgGpYk0Yu2x0OvPS+B5K53q9k3zCyusIj9+iX4FNkd+1/BYuuZZq9R2SMfGtRHeQc78YP1ic5eOvwbA46OmAvTpvpOh73a+KO2MUam4QOFeKuTY7I9HFXLLpFKUoXuVq1AIxm1CzfcVXGcn9q6acq6VmlVV3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MW6PR11MB8368.namprd11.prod.outlook.com (2603:10b6:303:246::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.20; Mon, 7 Oct
 2024 03:40:24 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 03:40:24 +0000
Message-ID: <4a69e4b3-fcac-4556-a9b1-f789e4efa627@intel.com>
Date: Mon, 7 Oct 2024 09:10:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/25] drm/xe/device: Update handling of
 xe_force_wake_get return
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
 <20240930053149.1246339-6-himal.prasad.ghimiray@intel.com>
 <ed935723-8128-42ff-a01e-52f22fa2cbbe@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ed935723-8128-42ff-a01e-52f22fa2cbbe@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::6) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MW6PR11MB8368:EE_
X-MS-Office365-Filtering-Correlation-Id: b5a281a8-6dab-4bcb-e1cc-08dce681c69d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjcrNWV2ZmxJMTM3emh2M2RhMi83czI3bFJXcVh2Y0szNXVaM0ZjeVU1NXQ3?=
 =?utf-8?B?WjVZR2l4Y1EzdlN5c0FNSkFUZXo4YjRoTzc5RThDekhIWTlIbXViRHF0NFVp?=
 =?utf-8?B?L0tJVzFrTXBhNWszaXNJWGVUdUZQbkdiZTdtSkJJUitTNFBsOFZmeWNuVG1x?=
 =?utf-8?B?S21icGovWnZaK1JPL1FSMWtSMlc2aHR3Snp4a3VKamVUNm5KeStSUGhXVVVH?=
 =?utf-8?B?WTIxSmlJNTNpdk9wSGxlSlhFZjkyTjlwL05rNlRmV0FsREY2YWNxMkdvckcx?=
 =?utf-8?B?ZHlnVU9jMTJodURHUzJER2VwbW5mUnBhQXF6OHJYUnFib1dWN0dTa01NK1hX?=
 =?utf-8?B?amlhQnFTWENNWnBZenJiTjhOaC9Da3luSDlsNk5xZEJ4QlY5dlN3NFRrREhr?=
 =?utf-8?B?WGZZRnVIRHVqWElLSGxxV3I3ZXI0UE50Z2ErcE9pL2Z2K3lnbG5oY21hMm9E?=
 =?utf-8?B?K3kxeUh6eG8xZy80WkY1U0t5VkJCbkRzWFI4SjZpdzA2eFgwdVdQL1VMVzdX?=
 =?utf-8?B?dnEvZFNVYzN4WkcrSnpuNVlNU012NE12L1ZON1hlaTljYy9JdWg1SVluS29J?=
 =?utf-8?B?V1k0SUhZL01ETWZTRS9MU05vNXlVa0x4MmxzZ0JPVDVWU3JlVTd3WHNGSnVy?=
 =?utf-8?B?QVJSYjFvTmkxRDVUL3haRHZ5TzBDV3ZzS0NaTGEwbFpvNnJCSFFmZVZsOTh0?=
 =?utf-8?B?dVQ1TE10UWt1TjVnZkx4MjdLVE9tdHNCa2hzeGk3MGhhUVNDZGtndWJMcmpZ?=
 =?utf-8?B?eGtHSjJNUnhVVk40UVVoV0tneU44R0QzRnFva1ltanZQOU9CTUZEWWZ6cnJr?=
 =?utf-8?B?dmFwd285VTRLZjlibm8wMkt1QUFzaWtCemlVNUE2QWJwaTVPcklxYUNlL0Z4?=
 =?utf-8?B?Sk1RYXZrUnNJTWozKzI2bWVraGlVOHJ0VG1Eb2tKM2VkOURlc2xvUHQzbWgv?=
 =?utf-8?B?WXVNRDczeXNvb1M2YUN4TnNiRk12dWxhVEpEc09JMUpBL3c1WjIrYytZYXk4?=
 =?utf-8?B?K3g3ckg4UzE5cHpXRkdQaEtvY0k2eVR0TkpTOTRWYkhTYy9PRVlXNTJuUUR1?=
 =?utf-8?B?OGtQYUN0M284RTF4bjBZV3lzamhkMjdGbDJ2NS9uaDJyUzZFNWpZaEU1U1J1?=
 =?utf-8?B?M1ZjVDlBYWxlODNiMTdLUEJQek1CVW9zYTJrOUdXbTFsYnorUVJYYkFITFN0?=
 =?utf-8?B?SHVpOTZFazdtS1BickFpdnZsNjdmWVZOeDFlT2FsVFRla0pqN1RPQ25vN1FV?=
 =?utf-8?B?WmpHSkdpVFVGa3p2RDZUTUFLMzFvV1k2L3lvemw5aUtEQzNDYzNHRmpqQmhR?=
 =?utf-8?B?azZHY2Jvd0RBK0F2ZW4raW03cHZTK0tUSXgrY2Ywdi9qa3NybDhwN1Nsdmly?=
 =?utf-8?B?ZUVnbCs2S1hraWNRTHUrbUZybm55ODNsek9JR3Y2aWUxNU45LzFjMDZINnZ3?=
 =?utf-8?B?ZXRjcUczZzAyV3hETHhTNnF2cllLR3NJNVFjdFFaMk5BVjJoczZoem9JQlZu?=
 =?utf-8?B?NS81NDZmc2JXVUcwWjBnUUNybnJDc1ozTmFJTmJWV2gzVjhuTGpxSE11SXNv?=
 =?utf-8?B?TGFIb0xxVnR1SkN6emhZMUYybGVaV1I4MkRIWVl0ZEZoR0hEY0xLeEdxc0xa?=
 =?utf-8?B?UkpjK1RQOElmVWFTWk02MGFHOEw4NkdsU21oMW90aWp5WEtkRC9HM3ZJWXNk?=
 =?utf-8?B?SWc3K0REQmE1LzFUVkl4THFkY2lkaGFaQjdWbDFUL3c3V2s3SG9VYjhBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDNhYXFndTUwWjlXbzRhejNnZGVyQmExc0VTak9xd2Q1djV2YjlXaVFiMUNw?=
 =?utf-8?B?U2F4ZW9PVXUyWE1lcEsycThyaHRmbjNzT0l4cm0rbU1TdnM3N3FSZVdmRmJW?=
 =?utf-8?B?REttRFpGZ1ZXaThpQlp1TFpZMDQwUzFkTEh6NzJkamdieHZ2WXVZUC9SQkVS?=
 =?utf-8?B?SVJiNmtpOTBEMWhXMnNBcDBrb0FoZElqK3JLbmVPcUJ1QUNxVkdGblRaVmJN?=
 =?utf-8?B?T0Joc3g5Z0hmR0dxcStYWktpV3FldDJRdnZtM3p3T0lOR2JOMXRwYlRtTWlZ?=
 =?utf-8?B?bklWTlVjY0R2eEpKUzN1bEJyb1IvcndRQm0xRnZLQklFYzQzUWlPWFFlWlZl?=
 =?utf-8?B?NytTaGsxT3B6cmNwNlM5T0xxcUNqc202SUJDdm5GL1BwMGU0eGVVWWt4Qjd2?=
 =?utf-8?B?LzMwRWRvZFBYUVRRejZtMHhxcFU1Y2lERmpoTE5hclBpS2ZOVjdIbnUrSzNF?=
 =?utf-8?B?eXFaTEVFNU5JOE5vMUV1SjdrbUdpV2UvTmJ5QlY1M29aYUdqc05Wa2R1T29z?=
 =?utf-8?B?SkVmQkdQZ2IvbjlFTGx4bkZRNFJSdTNzd0lqYzYzcFkyZXA4b2NGSXF1SUhu?=
 =?utf-8?B?L1pkWFVVQ21oQitUVDJGaEsyeEZjTEFQeHBHTW5iaWRYUnpHaXdvTWpGWVVL?=
 =?utf-8?B?UEc0OGdYZ21ieDgzdGlWY0RjcUM3bVQ1YTZvRTc5c3d4YWRpNlJBZjI0eTVM?=
 =?utf-8?B?bkZHQTQwMjk4ditIYWRrNFFxVTNFWEx5ZkpCRHc3SXZLLzA5QlBzcTMxcm9G?=
 =?utf-8?B?d0lBcENqdkpXQmpVR21ZSUJsakxLOER6dXhROU5WNDY4dlBYSFdoaE5HQzRV?=
 =?utf-8?B?N2RNMVF0U2Y2bDdjak45emJrNVRIMGYxYlBRMVViTVlpQ2s5WVJMZ01KUWEy?=
 =?utf-8?B?Wk05NmRzek9wRVRETThIYjk0S1NKMVQ2Q1ZVYk1YVmpXVThQKzlDcFR3dEY3?=
 =?utf-8?B?VExqZGFjcVB5Tmx6ajdhYlNZQmtTZzRudnhxbEhiZXVlZTdyRGsxOGpPU0Js?=
 =?utf-8?B?UDlVOVB6NmwzWHExYzFGYkFPWVZhNmRHVEhSdFdVM2ZHRklXczZBcFpMOHZ0?=
 =?utf-8?B?SDVPUWRFNk11by9kUzVkUWNHTnlqVEpTVXpoUmthOEhaTTE2emZBSFhZSjFx?=
 =?utf-8?B?VUZqN1I1WTM1REFSWTMxbHlrT1NjTVR3QTZrNE5MV3BMQzNhalJWR2dFNGhm?=
 =?utf-8?B?SU4xUXh4bmV6SG1ZUi8xZjJrWHlsZVI5VXFLRE1UN1kzUCtyeFNxL3A1ZkNt?=
 =?utf-8?B?R3lEYWhScERDZnJiRUNGRlA3bHd5dFJtRlR1RldJTHhybWJyN1lpdit0VU1N?=
 =?utf-8?B?ZmNKRmpjc1hiYVpwbmdiVHN2UVNZSDBzYmVDWVNyeEltMjBDclQ1VTlxMDdY?=
 =?utf-8?B?WGUvUGp4TGV3Z1VFNDRQdGIxeG8rTkJ4WnFDZDYvS2tRWkVBNUtlOHV3MDEx?=
 =?utf-8?B?d1pyQmFoN3dlZkJTWUJ3ZGkyVHVJdjROcHFtcHBDeTU0UERTQ1psN2dGSDNL?=
 =?utf-8?B?V1ZNbjFXZFdDanlnOU1XMWVBQ1FyV0ovT0N1SGRFNEFvVUwxZmpJNXV1eWwz?=
 =?utf-8?B?dHNOMXAyU0FoWTRQNnBpMDB0WFR3SkRPLzI0ZnpSNHgvTTBqWm1UWVViU0Ns?=
 =?utf-8?B?bDRmWkVRbVZMVDZFcXdlVDR1ODR2WThRYVlwUGM5NFJxelpTZnFjWHJ4N053?=
 =?utf-8?B?RlFRWG9KU3lhOGY3TlNsRFhaNHNNSGwvOC96UFVJNnJ3cXhHbnBkU3hJNEx2?=
 =?utf-8?B?Ni9aNGwxWUdrcEc0VEZ2YXZtbGNESElvZ0pCL3k1VUdmVWNEejFubzJIeXJB?=
 =?utf-8?B?ZkpRNGFObTVMZ2lFTVZQakhsMFdWRWwvMHpqNEdyYlJMNGZnS1dIL1ZlSUlX?=
 =?utf-8?B?MFBsNmhJOGxCTG14OTVYU2k1S3pYSlk3NStNR25BSEJiSkR4R3VnZm9hajFK?=
 =?utf-8?B?azRBL1hqK2xLdGgzR1BkeFYxVk8xeE9XRDFjdmdySmNUdjNxQzQ4ckk1RG9G?=
 =?utf-8?B?bzMrdG9UNmNWVDVTVE1kdExiY3dob2FNZllQM25LRFdtUGx3TVZPTDlTdzZr?=
 =?utf-8?B?UkJLTysvUzNuaEJIUjZWa0JEQU1VL0ZzYkJ4cjlRVGZMNjFPREJHVGJ3VitV?=
 =?utf-8?B?VWgwNVlSTzBnSlNaREpTVmN0QXdKaTJFaUFtYmVBeXp6R0V5Tm94UStYQ2Er?=
 =?utf-8?Q?zy0RQN6rH+LDHaMja84q38k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a281a8-6dab-4bcb-e1cc-08dce681c69d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 03:40:23.9879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Lzi+yu8TDkRmhShn8rviJ2Sms9dKjdqT45aY13mDr1rKX1W9CayTQ4sMw7I2WubXMPQiyv1eZgcMZRlpeQnyqq9HU/VJgB3AizIulRF714=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8368
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



On 04-10-2024 12:48, Nilawar, Badal wrote:
> 
> 
> On 30-09-2024 11:01, Himal Prasad Ghimiray wrote:
>> With xe_force_wake_get() now returning the refcount-incremented domain
>> mask, the return value will be 0 for single domains (excluding
>> XE_FORCEWAKE_ALL) in the event of a failure. Modify the return handling
>> of xe_force_wake_get() accordingly and pass the return value as input to
>> xe_force_wake_put().
> 
> Now with changes in patch 3, return value 0 indicates failure for 
> XE_FORCEWAKE_ALL, i.e. no domains awake, as well. Please rephrase the 
> commit message accordingly.


Sure. Will update this.

> 
> Regards,
> Badal
> 
>>
>> v3
>> - return xe_wakeref_t instead of int in xe_force_wake_get()
>> - xe_force_wake_put() error doesn't need to be escalated/considered as
>> probing error. It internally WARNS on domain ack failure.
>>
>> v5
>> - return unsigned int xe_force_wake_get()
>>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c | 25 ++++++++++++++-----------
>>   1 file changed, 14 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/ 
>> xe_device.c
>> index 8e9b551c7033..e885edacf39f 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -600,8 +600,8 @@ int xe_device_probe_early(struct xe_device *xe)
>>   static int probe_has_flat_ccs(struct xe_device *xe)
>>   {
>>       struct xe_gt *gt;
>> +    unsigned int fw_ref;
>>       u32 reg;
>> -    int err;
>>       /* Always enabled/disabled, no runtime check to do */
>>       if (GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs)
>> @@ -609,9 +609,9 @@ static int probe_has_flat_ccs(struct xe_device *xe)
>>       gt = xe_root_mmio_gt(xe);
>> -    err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> -    if (err)
>> -        return err;
>> +    fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +    if (!fw_ref)
>> +        return -ETIMEDOUT;
>>       reg = xe_gt_mcr_unicast_read_any(gt, 
>> XE2_FLAT_CCS_BASE_RANGE_LOWER);
>>       xe->info.has_flat_ccs = (reg & XE2_FLAT_CCS_ENABLE);
>> @@ -620,7 +620,8 @@ static int probe_has_flat_ccs(struct xe_device *xe)
>>           drm_dbg(&xe->drm,
>>               "Flat CCS has been disabled in bios, May lead to 
>> performance impact");
>> -    return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +    return 0;
>>   }
>>   int xe_device_probe(struct xe_device *xe)
>> @@ -871,6 +872,7 @@ void xe_device_wmb(struct xe_device *xe)
>>   void xe_device_td_flush(struct xe_device *xe)
>>   {
>>       struct xe_gt *gt;
>> +    unsigned int fw_ref;
>>       u8 id;
>>       if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
>> @@ -885,7 +887,8 @@ void xe_device_td_flush(struct xe_device *xe)
>>           if (xe_gt_is_media_type(gt))
>>               continue;
>> -        if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
>> +        fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +        if (!fw_ref)
>>               return;
>>           xe_mmio_write32(&gt->mmio, XE2_TDF_CTRL, 
>> TRANSIENT_FLUSH_REQUEST);
>> @@ -900,22 +903,22 @@ void xe_device_td_flush(struct xe_device *xe)
>>                      150, NULL, false))
>>               xe_gt_err_once(gt, "TD flush timeout\n");
>> -        xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>       }
>>   }
>>   void xe_device_l2_flush(struct xe_device *xe)
>>   {
>>       struct xe_gt *gt;
>> -    int err;
>> +    uint fw_ref;
>>       gt = xe_root_mmio_gt(xe);
>>       if (!XE_WA(gt, 16023588340))
>>           return;
>> -    err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> -    if (err)
>> +    fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +    if (!fw_ref)
>>           return;
>>       spin_lock(&gt->global_invl_lock);
>> @@ -925,7 +928,7 @@ void xe_device_l2_flush(struct xe_device *xe)
>>           xe_gt_err_once(gt, "Global invalidation timeout\n");
>>       spin_unlock(&gt->global_invl_lock);
>> -    xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   }
>>   u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
> 

