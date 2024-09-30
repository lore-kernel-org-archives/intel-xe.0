Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F8ACE8345
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 13:31:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B8210E4E0;
	Mon, 30 Sep 2024 13:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ffFnc3Wl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9744110E4E0
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 13:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727703106; x=1759239106;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=UkAUH6CG9qAZHLByjbbbkte1NoV5QM9xYAmajPQRFZc=;
 b=ffFnc3WlBIkqBt8HGKzt68sCbgg+cjtSmhqCLk5Ub8kIlLRgQTOw3MH6
 hi8yJeqdBWrk4x+JzpPsX1Iw0LIEMNIMueCB/vBcySSaWfXGBfjL+LSve
 CMC8DRzVT7zAwvOVsGQuvwYRVgluoZcRpoccYyvMLzjze0ErR0FF4PmHf
 qyLydNqz1zWU1CiATaxbCyygqIURSLJc0qfvm9UWE+SmubzIaL9ek63t4
 LqEhrbJtnK9OJtX5LO/CS4j6R3E9K6Rs9uS3P9GHKS+g5nYZ6v30gyK5j
 RSGjBpJAbk8WUKbTIZn+/WjCB5xqLaFRri78ApjNaJekiKY1rkgDx0Lu1 Q==;
X-CSE-ConnectionGUID: 9G6bHoGYRNC/LW7ocSVQDg==
X-CSE-MsgGUID: XF+5rslqRB+PeIKRchmdMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="30673558"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="30673558"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 06:31:45 -0700
X-CSE-ConnectionGUID: w6hGWfj0QbqmKCSJwV1ngg==
X-CSE-MsgGUID: EfQSd5WERMSc3yoEHEBcxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="77684174"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 06:31:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 06:31:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 06:31:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 06:31:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cg/cXhB8beO/qSEpHs9tkQAFfh3j5rk5WD3yxQA0MGFCicZp1eyJy5CiEWwN0jxYJ2Z8G5nXgkFyCdYvB/qtMCIkgO9HEIM08ku3/57d4mx76KUB18Jm/lRCOeUcqkg/dJ39czsrE6jKQjaHkUxoqgKMLyscSdYAQqu3H+yVUibB8l0LnIMeRlHAmtX654fyaeyBG5rzunB3DJYA3ypt/BBFLKmc+CUNESNxU7vcH70yTZeOdo7KQ7rmLnrKxU0ffmDMZec2nD31J8VSgTfhB3JPvI6ykH+JhXh6FedFTQ44VW04r2CgZ9QR0eOHYWGJp9N6Qzu90Z0dbWMCp5v9Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTJGNNsBRxxHVqOvDnfbEKicqULJd7s11sddE7aSIDc=;
 b=YlZtaBtzvfgJOkNLE4u5Lh4tfopSliAlbQaYlS3YbEe11eG8LMbuvo6w2153WbRuQ5X/GRy7rA0aH1L5JOknti3FqmKMozCbmFlsWfiTvpNC2PWaCz7NzN+wolUD1Vn1mAEq1g/VpVSwGyh52b1FjrdssyuEhGUnt7LBDtDGX3YMcnMllNOxY+2ESVtdwYdd409CsM5g0ihaHGFSnBTEfyjiDrzX2g7t+4kYQhfU+A9zXHihMIIvdRSQNzYHnaqnFshFT9e2jtARdBBQUmKuOjnDUxO1FuQsNgnoIoBXxMAEZ2gwLP/1XveQOox19DUIxqmBhEgI8K5zQykYdanZ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MW3PR11MB4698.namprd11.prod.outlook.com (2603:10b6:303:5a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Mon, 30 Sep
 2024 13:31:37 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 13:31:37 +0000
Message-ID: <556d4120-3c3d-4ec7-8632-19334268341e@intel.com>
Date: Mon, 30 Sep 2024 09:31:34 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] drm/xe: Prevent null pointer access in
 xe_migrate_copy
To: Matthew Auld <matthew.auld@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240927161308.862323-1-zhanjun.dong@intel.com>
 <20240927161308.862323-2-zhanjun.dong@intel.com>
 <80cc7152-4aa1-4618-a9b9-80687e74b301@intel.com>
 <11dd509281e5278eb27f1ad7be2adc3db92058bb.camel@linux.intel.com>
 <b701e011-16a5-4cd3-88e3-5cf3bf119f73@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <b701e011-16a5-4cd3-88e3-5cf3bf119f73@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:a03:180::33) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MW3PR11MB4698:EE_
X-MS-Office365-Filtering-Correlation-Id: 353741c8-4d97-40e4-b8f0-08dce15435db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dm5DOXRpVENlMC8xTExFT1JpODRPdjR6bDU2SzZ3U3AvTFZZbHVkYXFHSGdU?=
 =?utf-8?B?NXMrUzJ5cThlU3N0MksrYXc0YlJKVXZrbHBVRGpDdjZSdWxVWGVpOTRjMjZl?=
 =?utf-8?B?QTNjTFZNSjAwdWxFRDNkcS9vcWhMUTk5S2tLOXhBN05hQjVYUDM2amZyV3Ni?=
 =?utf-8?B?aW1vZzdoTytUQkdac29zbE5xUXNaMVl3UlMwUll4a09QdnJUS1ZXVkV6ODNG?=
 =?utf-8?B?dThya2JvRGs1K1dGMGVHUEFJQjR6dlFtbzdub3JpTHZOdWhvbXhyMEhMZGt5?=
 =?utf-8?B?bVY2OHBqeEtqTldOekRUcitkS1hldDRua2FuRjdCQlpETm0xemtEaUlubGFr?=
 =?utf-8?B?a0ZaY3BXeDZLOW9LL3ZTbUdhM0k4QjV1bW5mNzIwdjBCdHk3eVBTMFBMSFJK?=
 =?utf-8?B?eUZ2ZmFPaUM3dlBCTHhVSmQ5Y3VwY3RjY0FDUmFQdkpSTjFZNnIxVS8yZC9N?=
 =?utf-8?B?ell4dy8yemVGZHJSNjlMM28rT3UwMUw0MExmVUw4L2JraC8rOHFhKzk0L2N5?=
 =?utf-8?B?S2ZLSnI4em5sVVI4N2NpeXlKOTJ3ME1jblk0Q1gyYUx5MjU4c05rMVoydmxk?=
 =?utf-8?B?L0RIUS9XMlJ4d3JpVzhRNURGVG5qUC9YaGY4dzZudFErVkpwelNkM0xwOC9i?=
 =?utf-8?B?NEl2ejJCTXhCQ1B3TE9zaVZSb01PWTZRR2JlNWd5SXYydndRelNLQlFHSlpK?=
 =?utf-8?B?bE9xSWVERXdLbE51MFI0MEdNdjBNb0FCNzRCT0hNaGRtUUFWYWJDdS9vZTE4?=
 =?utf-8?B?cGc2Ty9IQ3gwN21UNkZ6am80WWpDamEwZDI5QnVZZ1RhNjRqenFkL25MNDRx?=
 =?utf-8?B?ZzdScG5FVVNaUnRDMmRtd3ZpbVBhTmpFN0N6OWZMV1loakhkK0pSTThnRWx3?=
 =?utf-8?B?S2F4bHE4UUhqWTBZLzNqcENSWlhIRE1kd0h0ZmlNMGNLaW8xcWlHNVdPVmkx?=
 =?utf-8?B?MnBneHFQN2tzcFpFL2VDdi8vS21nMVdHTjBuYklYV2NIVVpZbmxsVDJ4L01H?=
 =?utf-8?B?ZVM5bXVIMUlIMHMyblBkaGwrZ2xBUG5xdDE1enhqVWw2QzN0ODFEdUk0cGkw?=
 =?utf-8?B?b1pNWkp6Nm1MdEpaZzRWNkRZU00vc09ZOEtUUGJGeDFuaWVMN3p5U3JON0Uy?=
 =?utf-8?B?SXR2NlBKbVJ5SFIyTytucnFEOWFvVStNZ3hpNTVlNGNvSnJqRHZXZExZbklB?=
 =?utf-8?B?RVB6WWlTZmN3MUNaVnZPUytKZ2FZY09ZTjVMTHV3dlptdlh6VXA2YUpnandT?=
 =?utf-8?B?Q3B1UWM4ZlBnRnZKUmpPVms4T3ZkK2RsT1p2dnVVUUg0eTNpa0gzNkVkZTRM?=
 =?utf-8?B?SHRsalZTaWZsV1hnMkcyNTIxOUx4cjRvamJZSTQrSVFDMFpOOGlXdm5laTBr?=
 =?utf-8?B?V0hRMlc5bkFhOFU4b2F5TW5uSW5iV0NPOUI0QUJaVkJsRzlXQWg4dEZnb3Vr?=
 =?utf-8?B?Y3N4Y1pSd3J3MEdjVytDMnBLenlQV1BHOE9zUk9tbUlKZ1JWTGx0S2I2RGtr?=
 =?utf-8?B?NWFKQWdtYTdodlVLc0ovNEdKQmlmV0FIM3hWcnE0L05mUENzb25Cckxsa1hS?=
 =?utf-8?B?a3BZU05qR3RTRWx3U1NpNEJkb3U3UTF3ZXlGdytsMlNlMC93SElqckpCWEM3?=
 =?utf-8?B?VzFKM0xEaTRWTDhiWVQ4bXlVYXZ4eFg5T3BVM2p0RVFtOGZqMXJNenNzV01C?=
 =?utf-8?B?cEs2ZC92Y0k3eC9qL2Z1SjlmL2VOM2NIOFBUTW5rdTgrVG9UV3dTMUVnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkxBTFdtWHg4aENDWndBRmZsOGpMUHUwUmhZbktGUXRxakFyMnRidnRQRVFW?=
 =?utf-8?B?QVgreElkMU5UMGM4bzJjUjRKVEtQM05zUVZwRzlTY3M1SlBKUWFEWUlnMmxu?=
 =?utf-8?B?bXdtbHpwUkdEMnVZZ1czUlcvMjhwVW1oRmVhUmE5L0x6bzdjRU9BQ3VqdWFL?=
 =?utf-8?B?eUp2R0ZBY3EvMnBDMXhlNS9xMVEveS9kUldHYTFObGtoS2s1NUVCNFlmajJW?=
 =?utf-8?B?VCtSQWZyV21aMkVsMHMyK1RsbUYxdlRLWWpOZEVid2VUdnlXOXQzT0pFTStN?=
 =?utf-8?B?b1YxRE1uTWdlaGtjL3lTM0RxbkloVlpkek1QMVowRjg3V25hVER2YVdvYlR4?=
 =?utf-8?B?bmdHckhhWDNlYTlDc0JTVlFualpCTXYyMVJvdEo3NTdHWi9RYnh1TTU3VEpC?=
 =?utf-8?B?OEp3b1BZWkpLRnBxVThwK0ZuZU51Z25hM3JFTzVEYUlRVGViRmx5ZEszSEJo?=
 =?utf-8?B?U21iTWN0Mk1qZElmK05ITFJ5ZmYxMEh4K2w1cUxKRC9INHZrSXdWZUl6VWJS?=
 =?utf-8?B?czZpZjd3ckRnRG5JWU13NUF6ekh5V2FOSEpCdmdqV0lwM0RKOGVoUmRJek53?=
 =?utf-8?B?NXhtL1pydVBlYmFJSUJWaXM1Q0prak1LL21wcUlHbXM3d29jdDhIU3cveFkx?=
 =?utf-8?B?ZVpNQXhWeHZvWmdpdmVLWHFUTnVxUXpXR0JYdGhWVXQxVExVdnA3TDcrTGI2?=
 =?utf-8?B?b3ZLV2szTWt2eWM1QWFhTEd1N0N2L1U2MVFwUDdhNXB6RHpzalZYODRFSmgw?=
 =?utf-8?B?aVpsT3N1RnRXc1JxeHFWcHNEbWFhaHNIOTJIY05aMUpjSm55VmFRNFhlL3k1?=
 =?utf-8?B?aHlNVTNUZURxQUFiWmdDbXBTems5blF4VnZROXpoc0dDbHIyODc1U01PUFJi?=
 =?utf-8?B?ZGVTUVF0YTE1VXVyQmdZS0RvbnF4TGJXU1hySUdYSDczanNacDhuMlR5RFpt?=
 =?utf-8?B?ZmZzczRvaElaVnRjRDJuN1pzTC9CR3Z0Zm9OWkZHazhkZkI0T2FTekVrU05B?=
 =?utf-8?B?Vm9COEVKRWpHRTg5ZFJnY2RabWloSmp4Zk1PaktnVC9iQmt3TDVWV2FDQkZa?=
 =?utf-8?B?dFFuVjRyNG5tVXVSN1dIbndYTE1NUUVVaEFxV2FCMjA3TTBKcnlJWVJHYkla?=
 =?utf-8?B?M2lGU1VaNmJmNk1xcjJLd1pOdUU5MldJYW5icVpvb2F5TFJUcnFqZUtLTEZv?=
 =?utf-8?B?Q1N4cUhTdHNYOGUxb3p3aVM1Yi9ncmlwR3VQRTNGdWYwNzZrTmpTSjNJRkUw?=
 =?utf-8?B?RTJkcS9MT1FZM1N4RXA4Z2RwdWh5T1VETXFpMU4yM2o3Q2NHbXZSZkZHMVlP?=
 =?utf-8?B?ZHg0cGxtZDkxYUVVUEVKT0E3TTlBdGZheVhDcWZRWFVoWWtQa3RoWE9wM1Nm?=
 =?utf-8?B?a0ZxTm00UGxlNmIwU2NXVTFNM0ZvOTZ6NmdJWlRET2JBSGxSZy9CM3QxY2RO?=
 =?utf-8?B?Snk0ZmYwcHJwTENwZXI0Uys3ZzVEMnZPT2RQaURPOXcvRGdvZVp1QUlVTXdH?=
 =?utf-8?B?WVRsMElaQ0tzUlIxT2czcThmZkpHa1dOTU1aK3lGaEZtNGlKb2crUmVyOEZl?=
 =?utf-8?B?R25GbWttSVFvS3R5VGZ2RTBTYXNDN0ozckk4QytSeHE3dUg1emxzU2JCVHY4?=
 =?utf-8?B?Z0hLQ0lUZW13aHZXcHhwc2xqVXVZTlVRcjg1c1Nha3QyNVJxVCtJQnR4Yml1?=
 =?utf-8?B?aHZQUGk4VzJhaVIwUk56cGNKdGtQS3h4a2tZZ3BYMTBXNUZWcm9GdE0vZmoz?=
 =?utf-8?B?eU9jVkdDVmFWeGJPeEhSVVhuMEt5RnNBdkRkNEFSMTR4a0JzSlB3M3BSOEdt?=
 =?utf-8?B?NW5pdExEWDNwM2lSbUpuVkFNcG1HWkRXM0Y3MjNZanpwOEw0aFRzcStVMnhZ?=
 =?utf-8?B?RlB4S2o1a1dYYUpDVVlnKzZFY3pLUllucmJnRjl5ODgwb0w3NjllSGpXQ1dB?=
 =?utf-8?B?SnJOQ0lzSGg2VUxBWnJ5cUFVb3pKL095R0Era0JKU2hLZkZ2bVdHQkZOaWxD?=
 =?utf-8?B?amp4d0EzWG51TE9NU1g5ekFUZDNURDBFckdlRVFiZHNrNVc0NkkxTUNUUUo5?=
 =?utf-8?B?VHNpQ3d6TWtOYUsrMnZSU3l1OG0xbG1XcjJJeTVSWFI1WkEyT1dCOWg2ZUJJ?=
 =?utf-8?Q?kGoeK9HR/jfulwbA1yJYtxgU9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 353741c8-4d97-40e4-b8f0-08dce15435db
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 13:31:37.8665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJNhEkWuxsIPF4d9R3+htcNU4w6uQrfyxo597E0w9DjxYW7zcT7wLiF7WyDDmdqsO5YLx/8u2oD+5ljg8lf6/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4698
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

If no more concerns, may I start the process to merge this patch?

Regards,
Zhanjun Dong

On 2024-09-30 3:46 a.m., Matthew Auld wrote:
> On 27/09/2024 17:43, Thomas Hellström wrote:
>> On Fri, 2024-09-27 at 17:34 +0100, Matthew Auld wrote:
>>> On 27/09/2024 17:13, Zhanjun Dong wrote:
>>>> xe_migrate_copy designed to copy content of TTM resources. When
>>>> source
>>>> resource is null, it will trigger a NULL pointer dereference in
>>>> xe_migrate_copy. To avoid this situation, update lacks source flag
>>>> to
>>>> true for this case, the flag will trigger xe_migrate_clear rather
>>>> than
>>>> xe_migrate_copy.
>>>>
>>>> Issue trace:
>>>> <7> [317.089847] xe 0000:00:02.0: [drm:xe_migrate_copy [xe]] Pass
>>>> 14,
>>>>    sizes: 4194304 & 4194304
>>>> <7> [317.089945] xe 0000:00:02.0: [drm:xe_migrate_copy [xe]] Pass
>>>> 15,
>>>>    sizes: 4194304 & 4194304
>>>> <1> [317.128055] BUG: kernel NULL pointer dereference, address:
>>>>    0000000000000010
>>>> <1> [317.128064] #PF: supervisor read access in kernel mode
>>>> <1> [317.128066] #PF: error_code(0x0000) - not-present page
>>>> <6> [317.128069] PGD 0 P4D 0
>>>> <4> [317.128071] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
>>>> <4> [317.128074] CPU: 1 UID: 0 PID: 1440 Comm: kunit_try_catch
>>>> Tainted:
>>>>    G     U           N 6.11.0-rc7-xe #1
>>>> <4> [317.128078] Tainted: [U]=USER, [N]=TEST
>>>> <4> [317.128080] Hardware name: Intel Corporation Lunar Lake Client
>>>>    Platform/LNL-M LP5 RVP1, BIOS LNLMFWI1.R00.3221.D80.2407291239
>>>> 07/29/2024
>>>> <4> [317.128082] RIP: 0010:xe_migrate_copy+0x66/0x13e0 [xe]
>>>> <4> [317.128158] Code: 00 00 48 89 8d e0 fe ff ff 48 8b 40 10 4c 89
>>>> 85 c8
>>>>    fe ff ff 44 88 8d bd fe ff ff 65 48 8b 3c 25 28 00 00 00 48 89 7d
>>>> d0 31
>>>>    ff <8b> 79 10 48 89 85 a0 fe ff ff 48 8b 00 48 89 b5 d8 fe ff ff
>>>> 83 ff
>>>> <4> [317.128162] RSP: 0018:ffffc9000167f9f0 EFLAGS: 00010246
>>>> <4> [317.128164] RAX: ffff8881120d8028 RBX: ffff88814d070428 RCX:
>>>>    0000000000000000
>>>> <4> [317.128166] RDX: ffff88813cb99c00 RSI: 0000000004000000 RDI:
>>>>    0000000000000000
>>>> <4> [317.128168] RBP: ffffc9000167fbb8 R08: ffff88814e7b1f08 R09:
>>>>    0000000000000001
>>>> <4> [317.128170] R10: 0000000000000001 R11: 0000000000000001 R12:
>>>>    ffff88814e7b1f08
>>>> <4> [317.128172] R13: ffff88814e7b1f08 R14: ffff88813cb99c00 R15:
>>>>    0000000000000001
>>>> <4> [317.128174] FS:  0000000000000000(0000)
>>>> GS:ffff88846f280000(0000)
>>>>    knlGS:0000000000000000
>>>> <4> [317.128176] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>> <4> [317.128178] CR2: 0000000000000010 CR3: 000000011f676004 CR4:
>>>>    0000000000770ef0
>>>> <4> [317.128180] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
>>>>    0000000000000000
>>>> <4> [317.128182] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7:
>>>>    0000000000000400
>>>> <4> [317.128184] PKRU: 55555554
>>>> <4> [317.128185] Call Trace:
>>>> <4> [317.128187]  <TASK>
>>>> <4> [317.128189]  ? show_regs+0x67/0x70
>>>> <4> [317.128194]  ? __die_body+0x20/0x70
>>>> <4> [317.128196]  ? __die+0x2b/0x40
>>>> <4> [317.128198]  ? page_fault_oops+0x15f/0x4e0
>>>> <4> [317.128203]  ? do_user_addr_fault+0x3fb/0x970
>>>> <4> [317.128205]  ? lock_acquire+0xc7/0x2e0
>>>> <4> [317.128209]  ? exc_page_fault+0x87/0x2b0
>>>> <4> [317.128212]  ? asm_exc_page_fault+0x27/0x30
>>>> <4> [317.128216]  ? xe_migrate_copy+0x66/0x13e0 [xe]
>>>> <4> [317.128263]  ? __lock_acquire+0xb9d/0x26f0
>>>> <4> [317.128265]  ? __lock_acquire+0xb9d/0x26f0
>>>> <4> [317.128267]  ? sg_free_append_table+0x20/0x80
>>>> <4> [317.128271]  ? lock_acquire+0xc7/0x2e0
>>>> <4> [317.128273]  ? mark_held_locks+0x4d/0x80
>>>> <4> [317.128275]  ? trace_hardirqs_on+0x1e/0xd0
>>>> <4> [317.128278]  ? _raw_spin_unlock_irqrestore+0x31/0x60
>>>> <4> [317.128281]  ? __pm_runtime_resume+0x60/0xa0
>>>> <4> [317.128284]  xe_bo_move+0x682/0xc50 [xe]
>>>> <4> [317.128315]  ? lock_is_held_type+0xaa/0x120
>>>> <4> [317.128318]  ttm_bo_handle_move_mem+0xe5/0x1a0 [ttm]
>>>> <4> [317.128324]  ttm_bo_validate+0xd1/0x1a0 [ttm]
>>>> <4> [317.128328]  shrink_test_run_device+0x721/0xc10 [xe]
>>>> <4> [317.128360]  ? find_held_lock+0x31/0x90
>>>> <4> [317.128363]  ? lock_release+0xd1/0x2a0
>>>> <4> [317.128365]  ?
>>>> __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
>>>>    [kunit]
>>>> <4> [317.128370]  xe_bo_shrink_kunit+0x11/0x20 [xe]
>>>> <4> [317.128397]  kunit_try_run_case+0x6e/0x150 [kunit]
>>>> <4> [317.128400]  ? trace_hardirqs_on+0x1e/0xd0
>>>> <4> [317.128402]  ? _raw_spin_unlock_irqrestore+0x31/0x60
>>>> <4> [317.128404]  kunit_generic_run_threadfn_adapter+0x1e/0x40
>>>> [kunit]
>>>> <4> [317.128407]  kthread+0xf5/0x130
>>>> <4> [317.128410]  ? __pfx_kthread+0x10/0x10
>>>> <4> [317.128412]  ret_from_fork+0x39/0x60
>>>> <4> [317.128415]  ? __pfx_kthread+0x10/0x10
>>>> <4> [317.128416]  ret_from_fork_asm+0x1a/0x30
>>>> <4> [317.128420]  </TASK>
>>>>
>>>> Fixes: 266c85885263 ("drm/xe/xe2: Handle flat ccs move for igfx.")
>>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>>> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_bo.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c
>>>> b/drivers/gpu/drm/xe/xe_bo.c
>>>> index 5f2f1ec46b57..5e8f60a8d431 100644
>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>>> @@ -682,8 +682,8 @@ static int xe_bo_move(struct ttm_buffer_object
>>>> *ttm_bo, bool evict,
>>>>        tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
>>>>                      (ttm->page_flags &
>>>> TTM_TT_FLAG_SWAPPED));
>>>> -    move_lacks_source = handle_system_ccs ? (!bo-
>>>>> ccs_cleared)  :
>>>> -
>>>>                         (!mem_type_is_vram(old_mem_type) && 
>>>> !tt_has_data);
>>>> +    move_lacks_source = !old_mem || (handle_system_ccs ? (!bo-
>>>>> ccs_cleared) :
>>>> +
>>>> (!mem_type_is_vram(old_mem_type) && !tt_has_data));
>>>
>>> So is the issue us leaving bo->ccs_cleared set, even after purging
>>> the
>>> object? Seems like when purging the object the bo->ccs_cleared should
>>> be
>>> reset since backing storage is now gone? If we ever have purging for
>>> real userspace stuff we probably need that anyway.
>>
>> Hmm, good point. But is purging removing the bo->resource. I guess it
>> does....
> 
> Yeah, AFAICT the bo->resource gets set back to NULL. So seems like we 
> can get NULL resource from initial creation and now also after pipeline 
> gutting.
> 
>>
>> /Thomas
>>
>>
>>>
>>>>        needs_clear = (ttm && ttm->page_flags &
>>>> TTM_TT_FLAG_ZERO_ALLOC) ||
>>>>            (!ttm && ttm_bo->type == ttm_bo_type_device);
>>
