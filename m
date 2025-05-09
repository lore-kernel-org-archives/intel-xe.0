Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC68C3ABC5
	for <intel-xe@archiver.kernel.org>; Fri,  9 May 2025 00:38:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7606610E22F;
	Fri,  9 May 2025 00:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JvVH/Bvv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C5F10E22F
 for <intel-xe@lists.freedesktop.org>; Fri,  9 May 2025 00:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746751082; x=1778287082;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0IJ2S1EIAZ2qBj0KWG3BDiPPnoF5GSkoU8eR3epvpY4=;
 b=JvVH/BvvXWwFAKOzqs+iu7azwAt7z40gpVxx3fBHGmSyaTPcuk3M1i83
 JfKoV+EWKZ/5kh3FP4M0Eafuy8jNKXna2uPu680IKtHPzL5mkD/+plNBD
 iwCOD8evr4LLgnKxLp6lRPR3l2e5oM3Z8O2+peW24zXHpekyuPxdaN+F3
 KSKl2uNPxRkDudhgycuONejU9K8kszP63M9VCe/HudoLTN3VGG3iLXeqO
 HfK7dLv0z7xzIvM6zVpMbZpBixTUhwfxr/NDYGH4K9dRPLDt++tZiDviJ
 QFERIk7PgOD8z5Mv7DoVpGUthUlXro3MsJruT1PRIGOatNrJhLb8shhR/ Q==;
X-CSE-ConnectionGUID: 8aPUxYuNScCKf5AoKaUSmw==
X-CSE-MsgGUID: 5h/I6265Swm5X++QYl+49g==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="73943837"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="73943837"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 17:38:00 -0700
X-CSE-ConnectionGUID: Q9qc4Kl9Ty+hrjjNZ09Knw==
X-CSE-MsgGUID: v/n+Gh6rTuecCa/6tU3ZBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="140504796"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 17:38:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 17:37:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 17:37:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 17:37:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3ViHt2tuaGT8aDsZ0F33mgfg5bBoZ3+Or7oBO904FUia6jE2qCeRlCSRvsVlVXwJQKavFpK/Sls0WYLaoZFYolQEG8l1EzH0YXgeF4Zkc0QuPb0Lba5hgOpicCcu7t9ke0sSD8Lj5+h5eur6LxPBpsQ6DHbCdUKLshEpifMyWd2wywo7CuUjGZ4NlqSDQkpyZzSzVPaEXTbaWfI53EDwMye51bWwpKrMZRVXLPfd3ZfA4mmNRGo6uIOdcF5FxkZ6aaQhQyDDx40m9C0Y4ze6b/8tzKMWgcQVDPtrCGYKpSQC9kRD21lkJWTbBykAymxDQYUqzMjiZ4t/+FGfZj1zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WYXu0sR7EwzBrDXgRo5On1tc/nJOZYjSqFdCxYCCok=;
 b=zEcAq5t397QQzZpMV7qZqg1tuMM38ZCsorJ2dw4+6v7UVSlyCQIuG1gYT0NNMS+pQkfU5qIksz9K5nHQTvwEGoLVAsBcYTTnGKVw3TlBrYLZRSMPwcPBctkHAIjqTrz1QOfXQ9I0RTnsjXIpnJBpxdiWmdOhZ8Vf4Z/MKz+jtthTgH1BYDco7iTNsUMugOgrAOhLVc9RoGLKz1Buwj/cQ/5S5ikn0qzyt75D5RMobjACHnNdQqusLlt5UIypZ00Bu3AgPHMSyb3zZR6DoDuvaaSFnbv2XdVlyr1kA953ExpMETd+iMbm7VEOzVp+y6jXyknubN5MYSo4Cc9yY3lNeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by IA3PR11MB9111.namprd11.prod.outlook.com (2603:10b6:208:57d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Fri, 9 May
 2025 00:37:55 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 00:37:55 +0000
Message-ID: <9f201078-866b-440d-8253-fe7cd1d90a87@intel.com>
Date: Thu, 8 May 2025 17:37:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Aditya Chauhan <aditya.chauhan@intel.com>, Jani Nikula
 <jani.nikula@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20250507131558.19572-1-satyanarayana.k.v.p@intel.com>
 <3834b63f-2c0d-4a91-81ea-eb8c57f12b31@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <3834b63f-2c0d-4a91-81ea-eb8c57f12b31@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0036.namprd04.prod.outlook.com
 (2603:10b6:303:6a::11) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|IA3PR11MB9111:EE_
X-MS-Office365-Filtering-Correlation-Id: a2880868-574b-4494-0ea5-08dd8e91bd0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVJXYi9UMy9KQllvRmY2aDJ5ZG44YldjbWVqZ3FBK0FmWTlxRVJKcGh3VjFS?=
 =?utf-8?B?SU5wL1R4UHkvUFVKZ3FacGhxOFFLQkd6RzVPVjk1bzlreS9ENG9uLzEwYUVk?=
 =?utf-8?B?UGVRMzZsT2lkSE04VWI4UXlDSG5kZkJjMUtQemJZSDJ1dFNGYmE0NlROSS9u?=
 =?utf-8?B?aXVNWklNM3NHb1I3OVJJTjJodkdJV1dRM0pWakxFbnJmQ2E3ZFUxTGMyZXpH?=
 =?utf-8?B?ODBRZHhTTWo5MHN4aUhIL3BIem9iQm9ZcnBlM0RaZnFuT0c0MXRmdjB4c0dG?=
 =?utf-8?B?ejFZUE1zZTNZZWRCRkIwOHB1Y241WWJ5V3k5RndlOWRjeWVTelVFa2g1MGxT?=
 =?utf-8?B?MTB0UlBqWEl0d25wbjBtQTdva3hHZUo3UzcwcEtzR2pkc0tBTWlRcThUbFFR?=
 =?utf-8?B?SVZPaFhValVXYURIRXYvVXNEOVRoK1c4eS9ibkxUNWhnbThrWXpENzVwa2E5?=
 =?utf-8?B?L1Q0SjJkTkNpZGdpTkdkRU92OWZlYnFKZDdiYzd2R25uSTQyakF3MFZzTVhi?=
 =?utf-8?B?YllWVzgydy9CV1NieXZUbndsbzNFaEFiVnpvcWdacWdiMVI0UUcxd3MwZUNJ?=
 =?utf-8?B?emF3NDdTK0wzZEd4V2craGgvZXlCUDB4Y3FFMEJ2ZWRMRjV2Tk9MU3B0TGtI?=
 =?utf-8?B?a2FnOW8wdDl4NUt5SGlyMlUveCtaTXpkWlNGYWRQTk44akVQRjFKQW44K2d5?=
 =?utf-8?B?c1NxVXkzcG1vVEJjazZTdGcwMDQ5TUxjUk9wQ1pBcXVRSTBxK1JwUlpmOG5V?=
 =?utf-8?B?NXVPS3VNaEgzVnh3QVBaNGNHZ3lzR3B5VERZNVBodmtYWk1KTjVnQng1MmJV?=
 =?utf-8?B?MzMzWUtabmZqQkFEK0ZHNkpQdVlRNWgxaTIwK3BIYnZjellEWWZHYmRLdXlG?=
 =?utf-8?B?MW93UW5FeHN1aE1CVzMxdHNSRUhlU1ZWTHpXODNYaFgva3NEZG9pSk5pRlcx?=
 =?utf-8?B?cWFnYXZjbW5wck1DSjV5a2hWVS9vSFNYS3lGUk1KaS9RZ0lkbmZjY0JLaFJV?=
 =?utf-8?B?bTV3UWpqMDFsUy93ME9QNGU1TXRiSDZiMVRnYnErZ1F5NklRTS8vSlltcFZI?=
 =?utf-8?B?VWtQbUlDa1F2TFRxc0laSjVKU21RQ0lCN1RzZnpndEFSM2N5aWFPS3ZOSHly?=
 =?utf-8?B?MjA3emJVR2NKRFhPbXpxUitBWURYRkJSY1hNc2tqOTE3Qk1hQzZkTVFWY1Ro?=
 =?utf-8?B?d1o3TGRPOUZnSDlndk5IQy8yNWIwZ2p0N3dSR3Ivc1oxLzhsTUdpZE0zMHdY?=
 =?utf-8?B?R09EdlZpVGJtakFnTU9BNmxzdFlEek5hYjdzazdqN0hNYUJHbjZJdW9UdCtH?=
 =?utf-8?B?MHJFL0lBSXNsSFlpRktWZ3d0dnB0cFFtMUp6UmFkc29WazZhTkJ1Zkp2ZEdP?=
 =?utf-8?B?eUF2TytNS2FzSUNrZmFaUGlCam0vQktLV2pjTDdrNlZZMG5ZMHVmQmJFQ2tm?=
 =?utf-8?B?alF2NXM4TlljNEt5eTlhU1paemFCUXF3TmhrS1FiQlVSTWVNcXRUUHY1UkNr?=
 =?utf-8?B?OXBOcDNnVEo2WTVQY2d6TGJaNEl5QkVZUzIrVzd3a0pBMDNyNzNFQ0NVUHk3?=
 =?utf-8?B?UzdTWWdTSG92OUo1V1lPWDM3Ry9zWElOVXpGSnJhc2FNdFByeEdPN00vMFhN?=
 =?utf-8?B?QWx0QUpjWW5rYVlneFFHbWJNTHd6bVFxbVR5VmZnZjdzb2hRTEovaTBsUWtI?=
 =?utf-8?B?YVVlQ3l4OGxmV0FRZmphNkhXaWhaNTk3TWlBU254dURlRjlMdzdHYUVMT2lx?=
 =?utf-8?B?UUl1eXREdjFLVmRGT2kyVjJPdkpKblBEQythVWc3YTdERjlpQXJPQnd5NElj?=
 =?utf-8?B?OTRsWXBWOE52VXN0dTNOSjdyOEFpSW9SZGtsWnZOeldMcVBKSG9aelYreHVR?=
 =?utf-8?B?K3Foa24vK1VzMXNoVE1RU3pXRmtEN1N1Ni9BQUg1WUlqWm10OVJxTkViSDhv?=
 =?utf-8?Q?AYYMQHXuaj8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3kvODZkeVB1SDJjVDNoS25xd1J2UXNCeHBYN1YzdDhScmFiVmk0TGV1U0tu?=
 =?utf-8?B?bTZXZjFmWGVrcG9sY3cwYzhjVlpxVGUyZ0ZVczFEU3FhMy9xVm53endtdWhT?=
 =?utf-8?B?dHRzaG8rWmFyWFJVbUtmU0ZsUCthdWdSS0NCR2tyaXVub2tIbi90WFBmRzhi?=
 =?utf-8?B?dnhhM1E2MFZwZ1VaNzJmbGl0TW1ZUTRXRzVLYmhkQkhQNnZNMzhqMjZzOEZu?=
 =?utf-8?B?YTRrTlltSW4wVmJ2QzFXWmZZOVVHeFFmellvLzhzNmYwbExWc1FGRU9XQVBp?=
 =?utf-8?B?MFVjSVpVdTM4STNRQXZoWk9sMktvMUtqSHBpTzlhTCt1MVQwbnI3bkJVMDRX?=
 =?utf-8?B?MlVOQ0RWR0xMTTFNV25nbFAybzZMei91ZExFclV4NTFScFJNemw5eUJMZ0Vh?=
 =?utf-8?B?QjkxV1dPaXRrZFpzTVNRR1ZqRkYrVzJrMnNWbk83dk1US2dneWdjVld2T29L?=
 =?utf-8?B?Y2NWekVxclNrMXJURlBhMWxVb3BqZytKV21UOGdtaElJQ2dUMUlRTlA0YVVl?=
 =?utf-8?B?R3BmeDhSZW8vcVZBS1ozbkVmT2pEM1RtcDR1dUFlUVd3bllOMDR3eHVxWGs2?=
 =?utf-8?B?OUlGZzlOOVhnaFMraVBzMjlxWk42YzFlMGNGSTZIY21RdUhJUlo5SnlNSjdS?=
 =?utf-8?B?VkowOTI4WDlzTmw4Tzk1M2dnSjArUU9TSml2aVFORmE1NXk2aU5NR1FKK2J5?=
 =?utf-8?B?NjdnNWdwNVIvQ0lpSVRLSjNNK3RjeDdFZFY5ckFkZXRsN29aZkdLemZHRHl6?=
 =?utf-8?B?UjJkWFZOZ1lOSDd3dlRYcGpUM0FodTNwNHNlaTRjTzMwTG91L2ttOXVVdmtJ?=
 =?utf-8?B?cUtYTmkyc0lUQ2FHRXJmblVUME1EZ1Z0U29UZVV6WEJzZ3Q4MEdsYXB2Z28z?=
 =?utf-8?B?VkRHb2F1UjZKN01Na25ERUQ0OTRDTW1QM2NxeWNaQzdvaDIvY3JVampkZmVG?=
 =?utf-8?B?MVBiQ0k1NmJPME51djVtM0VZSUtKc3VNOUlGMkIzOXAwOW1oR2U0VlFMVktj?=
 =?utf-8?B?MGw0K0tEQitoVXBhcFBQdjBvQmo5UFRtVWVxQjFRVkZmQTdTMTIwOC9La3JE?=
 =?utf-8?B?QkhBRHZtSHAxTEdaTlhwVTZWQ2FQS2tkRzJCSVVLeStCTmE1UFZZZk5xaUg2?=
 =?utf-8?B?NXZUMzVLOUdmTFZMbmEvTG9scEUvUGJRTlpVT1RYc3k3TEx4OXk4aXFjSGdi?=
 =?utf-8?B?K2JTY0JLenMwTjZabGtnTkd5ckZlQlM1L3ovWlY4TnhycTVYWFJFSWVaL0pr?=
 =?utf-8?B?SzYxdVltSFBmeDZlTEJRZHVmZm10SjRoUzEyT2t5TW9kU2MxUk9HY25WUWl3?=
 =?utf-8?B?cDlhTDk1NWZXa3BZcGt2RHEyc01kQVZqaThseUtHVWVNb1FqSndLRW5UY21K?=
 =?utf-8?B?U3pQa0xmVG9kTTZ5Z2hzN0djK3VwRzByUHJkcTI4TU5zQkxWblRFMVl3WW5K?=
 =?utf-8?B?RkF6S0NsQ0dDNUpUUWFlUk5hUG52ZGlST0FhTG5pS1JNQnlaSEFvV3BQeGhV?=
 =?utf-8?B?NEpkQ1lvSG9nZFg4WUtDTm1TYlprL0duVElVRXBZclVXZ2pHN0cxSGhqUkYy?=
 =?utf-8?B?WEdFM0pubXhTaTVzeklaN1hWQU8xdHRUWHFWZDErZ25kTlZwQURIYUdCK3Fh?=
 =?utf-8?B?TGI4NkJ1QWJiYit2cU1XMXlHUm1BdGZRc3Q1NE0xZVk5NUJ1V2RjZHltWDhn?=
 =?utf-8?B?eDNQejg5NUN2a3JURG5TM003MG85enZtZVN6Y3J2RjhzVlJmdGE1b0g5Ryt2?=
 =?utf-8?B?UVhQL1UwSXhOYk1HcVRGT2x6UWh0eEZYL1lTZmNDK3RrcisrVHRiMGE5R0ZB?=
 =?utf-8?B?Mnh5SmJWbi9sRGoxbkhWWTNBQ3ROaDlzWG1VT0VwUGYrWUkxY3JXb3RTNXRk?=
 =?utf-8?B?Zy80VU9idU51Nk5aSUNTNnRycGhaeDlvN29iLzAyeDZISXN1YmdtRVR0bFc0?=
 =?utf-8?B?NkJ1ZGZpLzNpMHlMQm1uVlh2cnBKUjdKUGdBTTZwenRvUmM3S3NTd1dSU0xu?=
 =?utf-8?B?eDd6alR3eDFvemlqOHRWc29TS3NDR2Roa05ac2NuQndWcGZ0NVFVR21RUmV6?=
 =?utf-8?B?YThzVENoRUprRlJWTUhkQlIvb2ZDa2pIRzd5R0ZkbmJZNkNQb1ltVG5TOWZj?=
 =?utf-8?B?OWpGcGQzRDNwTW4zMnFWRlAxcjdJYTdSOVB6UWpNNlpKT1k0ckhZOVNxU21Q?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2880868-574b-4494-0ea5-08dd8e91bd0b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 00:37:55.1615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DzuJZBx9hFfYP2lNBDcwAVH5A4dTAxNx1FQYZzRAph0O7yhRCp7z/RiFUy4zMJHPkhlttwSa/zGv3/E6+gi3d/YVzazezGT/JMDOQ59jDbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9111
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

On 5/7/2025 8:32 AM, Michal Wajdeczko wrote:
> On 07.05.2025 15:15, Satyanarayana K V P wrote:
>> When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv()
>> functions, the CI test systems are going out of space and crashing. To
>> avoid this issue, a new helper function is created and when fault is
>> injected into this xe_should_fail_ct_dead_capture() helper function,
>> ct dead capture is avoided which suppresses ct dumps in the log.
>>
>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Suggested-by: John Harrison <John.C.Harrison@Intel.com>
>> Tested-by: Aditya Chauhan <aditya.chauhan@intel.com>
>>
>> ---
>> Cc: Jani Nikula <jani.nikula@intel.com>
>>
>> V2 -> V3:
>> - Added inline function to avoid compilation error in the absence of
>> CONFIG_FUNCTION_ERROR_INJECTION.
>>
>> V1 -> V2:
>> - Fixed review comments.
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ct.c | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 2447de0ebedf..d959cc2e7b40 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -1770,6 +1770,24 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
>>   }
>>   
>>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +/**
>> + * xe_should_fail_ct_dead_capture - Helper function to inject fault.
> this is a static function, likely we don't want full kernel-doc for it
Meaning just make it a regular comment? We definitely want documentation 
of some sort.

>
>> + *
>> + * This is a helper function to inject fault into ct_dead_capture().
>> + * As fault is injected using this function, need to make sure that
>> + * the compiler does not optimize and make it as a inline function.
>> + * To prevent compile optimization, "noinline" is added.
>> + */
>> +#ifdef CONFIG_FUNCTION_ERROR_INJECTION
>> +static noinline int xe_should_fail_ct_dead_capture(void)
>> +{
>> +	return 0;
>> +}
>> +ALLOW_ERROR_INJECTION(xe_should_fail_ct_dead_capture, ERRNO);
> hmm, but do we really need to abuse the error-injection framework to
> suppress GuC log dump? maybe cleaner option would be to just add module
> parameter (maybe under CONFIG_XE_DEBUG) that we can setup in the test
> and check here?
If we cannot under any circumstances have a module option for doing 
something useful like adjusting the GuC log size then I don't see how 
once can be accepted for something that is purely a hack for reducing CI 
spam.

As per my earlier comments, having a generic 'error injection test in 
progress' function would seem a cleaner way to do this. The CT code (or 
any other similar code) can check that function and early exit as 
appropriate, but the function itself is not specific to any particular 
subsystem.

>
>> +#else
>> +static inline int xe_should_fail_ct_dead_capture(void) { return 0; }
>> +#endif
>> +
>>   static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code)
>>   {
>>   	struct xe_guc_log_snapshot *snapshot_log;
>> @@ -1778,6 +1796,13 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
>>   	unsigned long flags;
>>   	bool have_capture;
>>   
>> +	/*
>> +	 * Huge dump is getting generated when injecting error for guc CT/MMIO
>> +	 * functions. So, let us suppress the dump when fault is injected.
>> +	 */
>> +	if (xe_should_fail_ct_dead_capture())
>> +		return;
> shouldn't we exit *after* the below statement?
>
> we want to skip just a dump, not to skip 'broken' markup
This is true. The 'broken' flag still needs to be set - that even 
happens when not in an XE_DEBUG build, and is a required part of the 
error handling to prevent further cascading of errors.

John.


>
>> +
>>   	if (ctb)
>>   		ctb->info.broken = true;
>>   

