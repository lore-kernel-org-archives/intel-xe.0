Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F8EC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 14:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0295410EA43;
	Mon, 29 Apr 2024 14:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EdXjhmsX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A771510EA43
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 14:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714400174; x=1745936174;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=u+WFa7MVl5eeNUyxZEzotA4tKoFjJ1Beh3Dlhj7Dmts=;
 b=EdXjhmsXtNaOL/+wDmgM7STfD2Wbv+HHogMAnz02CjaOz49h9xq8Ktd9
 dC/p6x4OlyxqsgrexhPxtl+xEomOq61Tr+QWrj4BIyJg03+eSGSbwU98J
 KcZdwjOqFMp/BYDjNN4rwMIuDDktEB4gn93VMmHw5Yxav2mBOQS+0xSJn
 +cQHxPWbo8nNDDxQ5A6OaoKCX/2yzGOCeMvsxXF3aPmNUzUzzDa4kVjlE
 PCMRZGINdaSII6BI4H1T9yqRCpBVbil41a9EmivDbcjz8au3+jrl8hhV+
 grCnc7w8tFjYfMTeYQb4qPdURW4dKqZ3RNUPjejvgjKNjaddA1PScdKsX g==;
X-CSE-ConnectionGUID: +PgrUWS/Q3a2ySvx9YiPaA==
X-CSE-MsgGUID: RQbuE05DRJm5LBDOVYAdng==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13848273"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="13848273"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 07:16:13 -0700
X-CSE-ConnectionGUID: Cs20oIg0Tg6W7r7DuhHfhQ==
X-CSE-MsgGUID: hVqP+aSuRTGY+BLO3n035Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="30807138"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 07:16:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 07:16:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 07:16:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 07:16:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 07:16:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDpqObq71Oo0OyqIoZm/VUWmZ7XbP7ysNkkDtq3UVw4TY51Jqj//7mkkNV6r/Np0G3/1yk34uOmkeIFFCToaucILUUSiF4Ox3kSGQD9Xu/nbruVXMfpijyJqWFWLBGCB7I4iembe0ZusPL9sQuLqblXRw7zLgeJLyyKWv50nelWUFHzpcssASd3wLcIIE8nl1yLzMr2OU9LrUqotFrG+JKQsnbtz1jOEalv5dthNJL6m5WskgLAPRLBhCEJ+w/HtmpQpksymQYVP7M4jBs1e0TqRKL8ZeNkaLDVgZnrgvu1nsfVaSC3YIK7L8NjFjEGPLCkjxZav10BXe2Qk49JN9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFLgyG5zM4FxnQoZreoHtRc3ZrDdALg6VdS6TA/FnYw=;
 b=YOt99mNFmCrpeoL9oEw04NiBis6h09BHm47MK6iHoA+pqidz/U+bCGCUd7POqt7hQy4GVvGpHb6LNneGmAxCexAX7Qgdhen8XQzFqHKcQZYEuyZ0TnQ13ay9OWC25z1Ppp3+EfVLWbxOnLWi677vkoKRdMGhXflCfRA5ZgghKdCfsLsLolCtDk6zUv5DpniuFlFTjFbTTCaVfM5sG+IGGFKxuNGD5UZzQOC1+hrgbGXZ599kwVKnKO1jjTiR+fW8IoAR9c5AQILI13XhAiNyHZYKl3ktDeXYQxVVALqFVFlPl5Vcx6XjXQoOUaOUHDjv7dhWzh4AGpU8UVCoygm1zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SA0PR11MB4750.namprd11.prod.outlook.com (2603:10b6:806:9d::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.35; Mon, 29 Apr 2024 14:15:57 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724%7]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 14:15:57 +0000
Message-ID: <0a25b038-693a-45d3-9ad6-ba709b7755a6@intel.com>
Date: Mon, 29 Apr 2024 16:15:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] drm/xe: Refactor default device atomic settings
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "nirmoy.das@linux.intel.com"
 <nirmoy.das@linux.intel.com>
References: <20240426105655.23738-1-nirmoy.das@intel.com>
 <20240426105655.23738-6-nirmoy.das@intel.com>
 <ac8e78466a4a33e48f718781e47b15a7c5c73a1f.camel@intel.com>
 <f68727e7-03db-44f8-b5eb-7ceed550eddc@linux.intel.com>
 <9839e7e9932330f9877402782ee411ada2e84df0.camel@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <9839e7e9932330f9877402782ee411ada2e84df0.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZP191CA0048.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::8) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SA0PR11MB4750:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a88b933-a1e1-4eda-0bfd-08dc6856e37f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUM5cGIyd0toTEs2OEdFbWRMVVdrWm1ucDNFckxQdjlNVitUZGNmbGw0RCtt?=
 =?utf-8?B?L0ZTYTF0c0xHd3Uya0NveEFHNHhxdjcxQVdzWTlvUVExYlp1N20rd3Yzd3Bv?=
 =?utf-8?B?ampLNEo0bmRMTnhDZzdmdlU4OTN3Z1hsWHRDQVdRMGE2YWF2QnFrazhLWG5O?=
 =?utf-8?B?UVV3d3d3QlNReEpLMkR5bllTemNRT1cvOUNCNGtZcnpWK0VnaDQvYkJ5T2dm?=
 =?utf-8?B?bCtCdk15ZFc4ZFoweHF6TGxGcE1MaGVhUDl4QitsbjVFc1BWbGFQRm1xK3dO?=
 =?utf-8?B?dGhUd0U4bXdNRzFjQlFuSEc4UUhuSWo4NURhTml5UGprYkF4TUxuZjVjRzgw?=
 =?utf-8?B?WVNNdURPYTRSSW5VbU54azExQ0lob25XSnRabHhQUEpORnQyVlRSUklkejRl?=
 =?utf-8?B?dEtGeFBybCtmMGdPdmNVQ0RCWURsYmZkSTROTzFOcFNJSUp6MFJkNHNxdy94?=
 =?utf-8?B?T0VoWHZKUXFDSS9QSmJ6YnFOUEJlVzRQcm13NTROR1JTaldqaEszVW10eWhi?=
 =?utf-8?B?MUVOMGNyaHlBNk0zamx2VDJrWU9VK0pSZ01kdFU3RGZ1ekJGRWt2UkNQeW55?=
 =?utf-8?B?OW1SUFFvTllPajVkR1p5SzFFZDhxcFIvZFQrWUhzWkhGT1NDTnY3WnhSWVJP?=
 =?utf-8?B?UVp6bXNTZTF1N2FPQUhYRnA3NlJqVmtaSkVzOHV2MU5LRnJQbjdmNGRYaUpQ?=
 =?utf-8?B?UHpGMUtYTVBXWFE0cWdWdHhTbGpHT2xiWGhSQkYvaXBLNlc1anlzY0lvdGlx?=
 =?utf-8?B?dk9iK0pDVThWQzBOV3p2TjRta3RNOXdONGVPMmNxN3NCUlhHNHluL1IzRXhD?=
 =?utf-8?B?Wkprdi9EVXJYVzd1RmhBMEZvN0FjcE81VHlMclJJejgyR2tlYnRQdTF3dStM?=
 =?utf-8?B?aEhiRzRkUUlBL1Zsais4aTlGSUN2a2NpTEkrSnFydmM5UzhSK1A0Y25XKzNN?=
 =?utf-8?B?V09CTVlCS0ZtSXFTSS9SWm9hWlhXdWhWRWs1TURHOHJSWWdnOFc2YnRHK1Fy?=
 =?utf-8?B?U1pDYkhYY0VHd2JXTnU5VjBhOEJ1ODhqSDBUUjlYb3FDbFJSZ3F1NTNxTmNM?=
 =?utf-8?B?Kzg0VVR0bUtwaDB2V3NJNng5ZkxCMzB4Q3RKUDlsWkhzZjNYR2pjSGpCZTFC?=
 =?utf-8?B?Z25kTUdRVUpPTk0xZFlLbEIxSDR2bUU3UGk4WVlFS1IzcmhkdHpVYWIvQ2NQ?=
 =?utf-8?B?VTBIcTJZZTVWSlQxNldndVdJQUp0RG9RQU51elczcStWcUhoZXd0Yk9Zc0lV?=
 =?utf-8?B?Vnp3Q2VnMUxidjRuVnVKSTg2VGszdjhPUHZNUmVyeUlhNzFwS0M5dTRCRThn?=
 =?utf-8?B?NTRvd210NjM0dUdqeEovdlIwUng1ZTJyeFdGUjJPcThtcjJHTU9NeS9DOFpJ?=
 =?utf-8?B?RHBLMEoyUE9FcW9POXhVNEpoMWp3V1Ywak1EN21qNWE5LzJpT3hhampxNER5?=
 =?utf-8?B?SExNamRCQVV0OHBoMjhsMFFYZVBNRnNvZGJMdFpCUkc5MHBodzk3Z2FKZVdD?=
 =?utf-8?B?dHdkUjBBRi94ckorMHppQkc4VXRXSS9xakc2bFQvSEdoSHZ2Qm5NbFdRRFQ2?=
 =?utf-8?B?bS85SHordFpHc2hMRHVoWDg1S3l3NExyaFZ4ZXM5cGdvaVljb2lmMmlLZkp1?=
 =?utf-8?B?MU94UERJeXF4MGVCOUQxUUJKM09FUjJ1cE1RRE5GMGkvdGJQVHlBMTNoWUV3?=
 =?utf-8?B?cVY1QmJhN2Mvd1BjVUlYSU9jMGNaUE9HNTVwdWpiNlRMbHVPV1d0RXJBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjA3cTdaYVJQaVFOQ2FFeFVIN0FtVldzY3N4cncwTzJUZnNWazVDc2NXOVhJ?=
 =?utf-8?B?L1haNjJZOFVTTjIyMW9ucWx5SzJCZ1JiajErSWFpdG9MQ0JBby9sSy9YOWNz?=
 =?utf-8?B?VHhCSlN0N0RRNHVKQXg1cGs0SVhDYUUrZ0tCU2VNbnFlVjR5TVpyWFVLcGY0?=
 =?utf-8?B?SjhUS0dkTWZKM05mUjVJclJ5bnk2ZkoyTnFhbnl1bm9GV1p3T3lLSS9ydTY4?=
 =?utf-8?B?dHJDUXZ5NE9mMnhuNUxURE5CeHRsUGNxS1lRSm9HUWEyMFFDMGFhOUhzTUQy?=
 =?utf-8?B?NGR5OUQ5dlhUVXBSaDFvNkptN0pBMzhmZnFOQlZDbG5pWmtVQXJoU1RkWGli?=
 =?utf-8?B?QnVzSEVpZEVzL1puVXNyOXkrTlE1SDBXNEhZOVJlU29MenFBa1FVODhWejh3?=
 =?utf-8?B?M21md0thM3BGRTc5NFA3K3J6dW45ZnlpY3FLR3VYMWNVdFVpeXFsN3NiWXYy?=
 =?utf-8?B?cU9zOUFIQ1FjSm5KR0FVNVgrRUNsajFwRlZFUkhTTjIzQjEwTzdmeGc2UFRG?=
 =?utf-8?B?SUNjUkc4R3JsUkhpRE85ZUZhaFd5Lzd5OFd0Yk8wK3RHSUYxL0gvbzlCTklr?=
 =?utf-8?B?STZhaWhEaXgvcStwUldnVjBlWFBha0VzMTFGVzBGbVJvT3pVd3hSeFROYWFR?=
 =?utf-8?B?d1pJd000bzZlM1Z3TXhoM1Fqd3hLbm9kRmtyTThCLzM5TkFoNDRWaUZKSjMx?=
 =?utf-8?B?eDNhd3N1d2xxRGUzSUtsZWU3d1ZySzB4VWxOYnRURk5zc3dmU1NpWExQN1Fs?=
 =?utf-8?B?VlVXQ0JIWms0NWtrczJ0dWxMOUpXZnlIMmpFeEl5YjFVRC9UZE1sVGk4bXdN?=
 =?utf-8?B?cUQ2SnpCMHJsNWZmRkgya00rVlUzcU9KQkpnc3ZEMkJwczZZb1dRZ3lVQWRs?=
 =?utf-8?B?eXliZ3kvZkc4cXZab2cyNnRKRnhHT1pmSDJjQ2tYZ1lxMlNGd0R1dTZmTCtV?=
 =?utf-8?B?QUF6Nm5IUnVTTTVqL1AySmtvdThzcW1pUmtncXFBalE5a0dWUlJyTzNRK1N4?=
 =?utf-8?B?bnkzV2N5cWJmeXlzblA1MGRrN1hrNDVjZXBHVEMzZ05OWGVwaVY2S29lOXQ0?=
 =?utf-8?B?VHZvdHJzVzdyQ2Z6NEMvRmd3dmlyQzc0N24rMEYxeEdQWG1mZ1FidUpPbUgy?=
 =?utf-8?B?cjV0WGFGbFM2NWNnTGJRdHpQemxMVW5aS28xZDZRcGxQVktqY1F6MWhQekZ2?=
 =?utf-8?B?L3ZGSXFRaU5oNFdxdzJ1MXU3Z0R3WWZQelF5d1hGN1FWaGw5MlJSdnd3Rjl3?=
 =?utf-8?B?WmdIa3ZuT3RUSS8xSWJBT0ZiWDA5c3oyYXVXdFBsQm1vZlo5YW8xYzRvOHVR?=
 =?utf-8?B?L3pDdGM0dUd1TURHZHg0c0o1d01DNXJydW80MHRDcUF4QkNhTE1PYTYxSklL?=
 =?utf-8?B?amVoVUdmWU5LUUIxYWoycVVoY2pmU1lrNUNLWmE4NzlJRkFHMW5EY21hb2hP?=
 =?utf-8?B?RW9scEtvZ2RDaVJGSWovS3RtZWpsMjNFc0crRWh2MHhTMzRTTnZjcUFOYVBZ?=
 =?utf-8?B?cVNMMyt3alBzMjFPOEEzRHJYSCttVVdsR0JUQzFvekt1Y0tnZ1FlWUtwSzFi?=
 =?utf-8?B?ODFweUpDbmNUQ0FTQmVMaHJHd0w5VU9MbVo5amhtbnNSeVArR09nbktuak9I?=
 =?utf-8?B?eUpvdUY0bW8xaFRUbXorYjl1UExlNnZGNkMxYmprbnE3cHVFTTYyNThvREVs?=
 =?utf-8?B?bGJZNlluYjljdW5sODVIOGpZMGhsWDN0N3NHalpzM3dCV0FzcmlsbjJSZFhr?=
 =?utf-8?B?MTQzYlhFa0tZekhKaHNKZ3lYbVZEU2hEc3FJWWl6c2lxRC9IV2dSS2pBRzdo?=
 =?utf-8?B?cVBCRDUvTTMxTzVUM3E2TEhSanFOK3BDSXpkaUxmcGFXL29TZjlPMFQ1QVk1?=
 =?utf-8?B?Tm9vcU9IU1B3UDNndytwRldJakhtdFFSODlWYUJWcjErM3k5TFBuSGFFNThG?=
 =?utf-8?B?bTNxU3B6aEpOUk40TzNFN01uQmh0UnpBNlJ6NTV0eUxkTTcrSTF1Rll5Nnkx?=
 =?utf-8?B?L1BySnZHeHdsYnNXRlc5UHdPR3crWWIzYkJ4aWQvdnJ6dU9obDJvTXIvVmlw?=
 =?utf-8?B?dkZ0Nm15Vnd0TFdYeS84WTB5ZC9KcVdRYUlmMDJlS1F2dFNxUXVDWjhnVWF1?=
 =?utf-8?Q?seXHXa1FolFi4JShlOlM2cqRx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a88b933-a1e1-4eda-0bfd-08dc6856e37f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 14:15:57.5333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XNmmUyH4BFpknzjZZ49z9J9IW9+aJ4GAYhefV4q+sDqNVF63QWdoHZeqcyi/NndmFIKe0E8oBrTJYJd5/Ef1ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4750
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

Hi Jose,

On 4/29/2024 3:46 PM, Souza, Jose wrote:
> On Mon, 2024-04-29 at 11:05 +0200, Nirmoy Das wrote:
>> Hi Jose,
>>
>> On 4/26/2024 11:04 PM, Souza, Jose wrote:
>>> On Fri, 2024-04-26 at 12:56 +0200, Nirmoy Das wrote:
>>>> The default behavior of device atomics depends on the
>>>> VM type and buffer allocation types. Device atomics are
>>>> expected to function with all types of allocations for
>>>> traditional applications/APIs. Additionally, in compute/SVM
>>>> API scenarios with fault mode or LR mode VMs, device atomics
>>>> must work with single-region allocations. In all other cases
>>>> device atomics should be disabled by default also on platforms
>>>> where we know device atomics doesn't on work on particular
>>>> allocations types.
>>>>
>>>> v2: Fix platform checks to correct atomics behaviour on PVC.
>>>>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_pt.c | 27 ++++++++++++++++++++++++---
>>>>    drivers/gpu/drm/xe/xe_vm.c |  2 +-
>>>>    2 files changed, 25 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>>>> index 5b7930f46cf3..237e4a4985a4 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>>>> @@ -619,9 +619,30 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>>>>    	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>>>>    	int ret;
>>>>    
>>>> -	if ((vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
>>>> -	    (is_devmem || !IS_DGFX(xe)))
>>>> -		xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>>>> +	/**
>>>> +	 * Default atomic expectations for different allocation scenarios are as follows:
>>>> +	 *
>>>> +	 * 1. Traditional API: When the VM is not in fault mode or LR mode:
>>>> +	 *    - Device atomics are expected to function with all allocations.
>>>> +	 *
>>>> +	 * 2. Compute/SVM API: When the VM is either in fault mode or LR mode:
>>>> +	 *    - Device atomics are the default behavior when the bo is placed in a single region.
>>>> +	 *    - In all other cases device atomics will be disabled with AE=0 until an application
>>>> +	 *      request differently using a ioctl like madvise.
>>>> +	 */
>>>> +	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
>>>> +		if (xe_vm_in_fault_mode(xe_vma_vm(vma)) ||
>>>> +		    xe_vm_in_lr_mode(xe_vma_vm(vma))) {
>>> nit: xe_vm_in_fault_mode requires xe_vm_in_lr_mode, so you can just check for the later.
>> Will do that. I think scratch page is also part of non-traditional API,
>> I will confirm that and add that if needed.
> I think Mesa is the only driver that uses scratch patch.

In that case, enabling default atomics will be treated as in the 'else 
case'/traditional-API so will not require any change.


Thanks,

Nirmoy

>
>>
>> Thanks,
>>
>> Nirmoy
>>
>>>> +			if (bo && xe_bo_has_single_placement(bo))
>>>> +				xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>>>> +		} else {
>>>> +			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>>>> +		}
>>>> +
>>>> +		/* Unset AE if the platform(PVC) doesn't support it */
>>>> +		if (!xe->info.has_device_atomics_on_smem && !is_devmem)
>>>> +			xe_walk.default_pte &= ~XE_USM_PPGTT_PTE_AE;
>>>> +	}
>>>>    
>>>>    	if (is_devmem) {
>>>>    		xe_walk.default_pte |= XE_PPGTT_PTE_DM;
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>> index 8fc37c5a0196..f795016a80d5 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>> @@ -805,7 +805,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>>>    	for_each_tile(tile, vm->xe, id)
>>>>    		vma->tile_mask |= 0x1 << id;
>>>>    
>>>> -	if (GRAPHICS_VER(vm->xe) >= 20 || vm->xe->info.platform == XE_PVC)
>>>> +	if (vm->xe->info.has_atomic_enable_pte_bit)
>>>>    		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>>>>    
>>>>    	vma->pat_index = pat_index;
