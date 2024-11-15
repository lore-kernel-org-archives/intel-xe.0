Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C56CD6DDDB
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 07:18:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D160C10E06D;
	Fri, 15 Nov 2024 07:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jqy1Cs1H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490B110E06D
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 07:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731655102; x=1763191102;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mFd/3luDmTXUWJYwIQBp26z+sB7KziTxp+VpaQiYo3E=;
 b=jqy1Cs1HzkgNfsgFS0k1MzOT96/uskTcG7it2Panrn0VZjBiQkK8iuYx
 2zkLaOjcNPgVHhWIZJBTWGBgW60dfBPG8pMYhGku7HMGp5npq9BpulA+D
 BsNRr1cq9BuJ5sKTnlGqNtg6UjanP5OODZrCmZGjxq/RMveJZOFZlgfrL
 VO8DEIPnuY5PH6UzqH087m7LkreKcOqAw/jK4jJGZB7CLf9W/7uVabBrX
 62o04fVnoJzrWh66nkTlHHNOe09MKX890TmKdmKSqM8kIB6Jyx738BYWO
 i0AnZ5OPRoDxyX3T+Q3pqXaEctyLemSfSYoRvIdxPCjYWT6yGnJsQF7BU g==;
X-CSE-ConnectionGUID: bAglAFKPSkmIkkKcSzUqrg==
X-CSE-MsgGUID: +KU+/mbpSOKXCRRLjn4vvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31569080"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="31569080"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 23:18:22 -0800
X-CSE-ConnectionGUID: 8S8mbM88R72mzkWDRxz+iw==
X-CSE-MsgGUID: Xhzm3Y/ZS0eTp8lNnTDIKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="119288635"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 23:18:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 23:18:21 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 23:18:21 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 23:18:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLMMSc6f5F6cnUqn+zmAz9+c/xoutLRYTQH4of+w1gYErirqH4NvOD1rJs0NIE2f472zLyM0l8Nuk/OkjpvxHwqCc031fRvoBuaL9Mwdm1u3aoMVuCZ3Oa8nusI/Uue9TM6MJipIX3MmS9Hu8TOtsuoaaGOdD7Jbx7gYFAwxU2CdDKXPDPs263oqCrtsY6fC58B6VzlJnwAtkBrPmk7uK+wcj/OsKAQchhx2BdUOM4d4RcWYHLfwqwhWl6iQNFVzx7IXwqIi4lJ+u3cZruIB7g5aALrvQcSfRf8ikhblPURalOYwKcCg97g1ycGHK7Ok1aM/XFwMSem33KcjYMVI3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pB/B/M5FCLYf8T8gSqywrBzQgzaXc+qfD/W+tFbkQlo=;
 b=ii8HXH/g9hj6nGhTLMVjsT+hg/XoRt01UE6p9nyN9GEVfxVqPHKi2xIqKM7jTcPhoGOOmLCZJ87kCsPcG70y8P7d44MtL/67pr2NCMOMWv2RnZGcoXDjkBTSknFzPuaNG248FL2dpE4pz5DrIKIhihct/Ywg7e3JA2rBJvevnJjpwBmZ9ffHxgwbjTBZegz2d1im8RDl6gIfQhQMWKSJBPFho1+waSSPDd4A5xFqPcdh3+wDc5A16g2afLl2L+RYXcrUfEdrHc822SjO/Ajf18Sbi+FVN5kQ5nb52VUbk0qkSKRTJme1Tku0BRay+VeuqPshk7rDLj993zm1uzATzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ0PR11MB5150.namprd11.prod.outlook.com (2603:10b6:a03:2d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 07:18:10 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.8158.013; Fri, 15 Nov 2024
 07:18:10 +0000
Message-ID: <d8e4e54c-480b-46f4-9a07-a3f8b83ebc3f@intel.com>
Date: Fri, 15 Nov 2024 12:48:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/xe: add function to convert xe hw engine class to
 user class
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <vinay.belgaumkar@intel.com>,
 <aravind.iddamsetty@intel.com>, <john.c.harrison@intel.com>,
 <ashutosh.dixit@intel.com>, <soham.purkait@intel.com>
References: <20241113045549.2390980-1-riana.tauro@intel.com>
 <20241113045549.2390980-5-riana.tauro@intel.com>
 <ZzYh+SH3WFpQ8yd1@orsosgc001>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZzYh+SH3WFpQ8yd1@orsosgc001>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::18) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ0PR11MB5150:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d7fd339-b9bc-4ec7-7b56-08dd0545a905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3BnR3RyWnQ5eDY4RXc3QVkvMmpQemtZaXRPdDJXTmxiR3JKZWtwNTZvblRZ?=
 =?utf-8?B?UzZCclpTMEg4WWJudXIzditOZEw1ZXNEUnFYUnhKNGJLV2NEcWhHYVB5ekhO?=
 =?utf-8?B?QmRMYXdOTGtkcXYyYzB6eUp2S3RMWGlWTDRSSWo5YmZqSlhQVWRFMGdhOE4w?=
 =?utf-8?B?b2hQY3Q1bXFzQ0xOSUpuNzhhYWlCdWd1K2V5a1NNaGhmaGdwaWJSTnNHYmZL?=
 =?utf-8?B?MnRtcDZQQy9vKzZKOEhvVjdTSnVKOGovSjY4cVM1bndNZzU2N29HOUR5eXNy?=
 =?utf-8?B?MU1RUkJ6WkhvL3NJajdkVnJDMk1uR2NwVlZnYXZDUlhqUS92S1Bjd3M4cmoz?=
 =?utf-8?B?NGMyUVNrMWw3TEhPYlB2ZWsvSEVIUzdOVStpcldXTWdFaWpEZGplUGJoOFNS?=
 =?utf-8?B?TWRmT1kyNWFXcEVxbFRTY0grczlIYlkyZ01qMkJTc0Y0cGpuZWlIMUk5ZkJD?=
 =?utf-8?B?VDRMajA2OEtlUmJFQS9JUUtocFZIZjNGVy94M1VsYkV5cFJ1bkNFYzZzUUtx?=
 =?utf-8?B?bEN3OGZmeVJSVmcwaUx6SDFHZ1pWZkJWRDVUczhPbXlhcEZBZlErRmxQNFlu?=
 =?utf-8?B?S1F4VFJkZDhhb2lQVWttUHcxM29OL01yMWJvQmcyb2RKZVVWS0F5Y0U0Zm40?=
 =?utf-8?B?bUxiY1lnK25EWGQ4dzBES0w1M2lnUFk1WGZSeUI2WCtzZEZkTXAySGhtelVX?=
 =?utf-8?B?UDBKSXl3SDA4S2ZXOWVNanRIRHZUdFJ5UHUwZjRvOEJmZDU2NGZOS3NrT1Fq?=
 =?utf-8?B?UkNRNGthZ1JsTTRTcUpISk5UQ01QVkJNUWM5L2l0UjRLVlBEemZ1elRna3NO?=
 =?utf-8?B?SVJNajBIQXpJRHhYU0xzR01KcEMxNnA5a3BrNkI3QTVNUkl3SjZCWTFPaWZF?=
 =?utf-8?B?R0VDRlhlYXMrTzdKWlBKa21DaGFMWDVQNnljNzJIUi9IcDVYbW55RTJOVUVB?=
 =?utf-8?B?T04xcU5nQWhIY2V1OEVidUNzMG9EY1R6MDJVRGFFZHVONnV4cjFsS3dBeW1w?=
 =?utf-8?B?NjYwVFFOeDBVbm1IQVJQd2lSR1hmV2pJeVhEVS9WTTh0WG9LYmhuMDVPZkh0?=
 =?utf-8?B?Z2Y3YTZWSW15ZEJIMXlMRXBuL3p1TEs2NkFuZjFXd1BYSmx0c2xmc281bkw2?=
 =?utf-8?B?V2RJN1UxTVBsb2wrMmVrVkNVNmh6MXl1ZG54enhHclg4Tk95WEhrR2liZHJN?=
 =?utf-8?B?cE0vYU9CK2F3a0R5Uys4N1ozZmNJYUpPdGJQSjNMMTN6c1J2d0drS0ZsbEU5?=
 =?utf-8?B?VzM0VHFLL2p4dXJkVC9MSGZYc2loMTFaWFNXNDcyNGdmUDh5YXFvVlgrc3Bl?=
 =?utf-8?B?MHZlQ00wR21lWWRnSC8wbWdOK1hhQjN0bHM3aElVS0EvVXM1UGRvMnQ4b3I5?=
 =?utf-8?B?QVIxSGN1RENmbGlCbEhWK0trL0QrRGR5NTUrOW9Jckh5U2tHVUhyZEJmQXpz?=
 =?utf-8?B?VEYzUmRWekhZNWpOdi95YUNRVGxzYmZqK0RqcjF0bE5rUVZHQjFNVU5WdDF4?=
 =?utf-8?B?UyszSy9ObStvNkJBWHJBR1B1d1JNOEk1cGtlZjVzOWRQbUFZaUYyNlpoVFZC?=
 =?utf-8?B?M0U4YzI1Mmg2RFdPSzhOaDJyVEdHUTRoU1pGaU8rV3V2T3BuTmU3UnI2Zk5m?=
 =?utf-8?B?Z1Fnc2ZPcG5MKzZQZWtOWndOWVI3YmtWdmtWaHpsVWRnOHU5c1FQa3VpV0dC?=
 =?utf-8?B?L0pqMGkxRUc5bXlGZTV2OGNZcGpxRUpBSFFXeEhqTHBubWtWWjdmNFNTclpR?=
 =?utf-8?Q?zdytCH4ytB2sMG15SCRqE43RekF460K55jcGJ6d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2NXQ0hkMGtrb0NBd1lMNk9WSGh6c3p1SVpCdDZ3RkU1bGMzb2RMZTZJeHV0?=
 =?utf-8?B?REt0ZmErSEt2dlU5dzd0VzFiQmw0MTlkZytFRm8rS2NmNEwxVWZNeEpORC9B?=
 =?utf-8?B?UXoxZVAzMlhZUGFaZjNkUDVEeCtXMTVNWFpmMEF5VkszWm5haVVDcTZtMHFi?=
 =?utf-8?B?eTE1T3p2L1FuZ01OOWdOakUxRC9zSFZJTlJQcmhUM3M0SSt3YU50ZTZRRTgr?=
 =?utf-8?B?WUV3NFdsSmFsTnRKY2h4VFh4d1d1bGpiQVhqaW9oYXAzR2ZrTzVJSDByOG5O?=
 =?utf-8?B?TzFWM2RYT2hXMy90NTZZWFRadFNQaVJEN3FXMHc3OEd4MVpYcUtueEdTb1l6?=
 =?utf-8?B?blZMdUFRU05DUE81QUU0Sk10bGFVOTFzbXVqRDAySkdvWGlGSFVEanVpUm1p?=
 =?utf-8?B?YTdYOE92TmtmMGlCeWFLVjVSM1lVUVcrbUo0eW8zNjZCVVoraUxxcW9xVFY4?=
 =?utf-8?B?MnRxRGhzb3BWdlVtT3RrVzlrU0lINjFVcG1NZWtLOEVpQ3RUYW9GeWQ2QTRV?=
 =?utf-8?B?ODRLaU9tSXN1NWZJZHh5cFBzYnFaemVOUXdkYnpsWitHOUx4ajNubzZONmpa?=
 =?utf-8?B?cm5hTTFPaGZaNG5SQ3NTVXRMMEZUSVQxTC9JdW9URUloSm5hblhoTndTeFJv?=
 =?utf-8?B?YW1QMjcvMDRrL0N0eit5dUFzQ1JsWFN5N3dGdUxXeUxVRGxyRS81NmE2eVpj?=
 =?utf-8?B?dXNNSkZyQ1NwcG5oekw3eFRzVFI4YlZnMWFTOTdzcE4yTzFzUTA4eXZ2QTZ2?=
 =?utf-8?B?WHM1d2twQ0FEc0hVYmJabHp3Q0puekV4NjVwamlkVXQ1cVFwbnRRLzhHWm15?=
 =?utf-8?B?dTAzZTk2d0hKWnIrTFhzSXprYnFsd0NCaHI0TVN4a2drWEVGWHlNQU5Tb3lx?=
 =?utf-8?B?S0ZxWGlWTU1ENjQ5QklFYm0rWTFHSmNVcUlIa0RmNnNNd0M3L1UxcnJkYkp3?=
 =?utf-8?B?RUVid1hmcFovU0JnRVpXbUJsbzRqKzh4NEhQS1V1RVI5OVdSUGtSQ2pCM1pr?=
 =?utf-8?B?ck9qdXBtc3VPSVY5ZTNBakVKcHpVMEYwSDNNelFsNnB6R3J5eDhrU0JzbzZZ?=
 =?utf-8?B?UTBhU2paUzBhRndka0t5c0JvSDF0L05zNGFhUjZtVE9tdURoQXBXRm1nWTFN?=
 =?utf-8?B?R25vNVJnRHpsNytQVytxYitPcjNnbXYwVnVuOEl1ZVp5TmtGOTYvbml0T3hu?=
 =?utf-8?B?bHhib01zVTNnOFVDMy9FaTZGb1RuRkQ5VmcwNjdZUzRhVVNpb0xLNGlYY1Zi?=
 =?utf-8?B?V0JJZWZtUTdXR3dJYmxLcEx2ZnRqNW1oclVXSTh3ZFl3bTRnV1RGOHQ5NjVt?=
 =?utf-8?B?UGo5K3lKbzlBeUh4Q0dDbi96MCtxSzdjTGlITmtDdU5CeG9PbUVpSGtwTlhr?=
 =?utf-8?B?QmRhVENrNW9ubG9JNmg2SnB0SW9Td01jSFdkSlQrcXdBQ1hwVFdJMHBzMGlI?=
 =?utf-8?B?RkRsSjcvTFVLZk1xN3hjSTlIQVdpQlZzVW8xOCtiK0tmMmtCS3V6TDVwOXBQ?=
 =?utf-8?B?TzVMT25tazJwY2o3eWdzZjQ4eHVCVDJDS1NHYTZVdmtpbXhZR0F2VVBrcmRt?=
 =?utf-8?B?byt3bDVBQkJXMjBiMDBsbDZ6SVplU3JBM2hqd21CVVl3TW1hdXpSZnpiWnBa?=
 =?utf-8?B?eG1vZ2xLM2Vlbms2WGdwU2d0TWszREtwVmxHdHdmUEdFVEFjaVZqYmdOWXp2?=
 =?utf-8?B?NVRza3JiSS90Y3QxYkVCMVNPZFVRZGpINDNPVVR5Y3JoaElCc3ppNkgxYnRo?=
 =?utf-8?B?VWwrUkRmUGViV1Bnb0JxT05TV1lKRXVOdURJWUozRnVVNXo5bWNzWit0R3U4?=
 =?utf-8?B?eFY0ckZjbDZ1anNGcFdyeVNEczhVL1NHeVFkc1cvbDlDOGZxcU5BSUVONlF6?=
 =?utf-8?B?SEtFdXE3cVAvVmxhNklRNk9ZbHRwdmpwZE9hbFh4M2w2U3Z1UzlhMGwweUpN?=
 =?utf-8?B?NjlZeFZKUG9yUjNid0xxY0NJQ0RpanhtZjhGcG02alhUUWdOVW1sbXNkRDdh?=
 =?utf-8?B?OGIwOGhFZWtBTjk1UFBOcyt3d1l6c05TNlhxd3pkaVpxQno1aU9rYUp6RlE1?=
 =?utf-8?B?RHRhMzFuT3RtVDcrNTMraWNxZGNGNUlUanFTRExUNmRRcm1qcjR3V3ZFMngw?=
 =?utf-8?Q?3ZjG1hB/tfCWefKdef1AhxNcU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d7fd339-b9bc-4ec7-7b56-08dd0545a905
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 07:18:10.7128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yS3YXSsZV8peh+uzcK7Os5nOQPnH+HVKExzBcEIYpn0sAPNEl8VKjlYWiMJiUWTxkefrpWSP6kIFPpr+triTRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5150
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

Hi Umesh

Thank you for the review comments

On 11/14/2024 9:44 PM, Umesh Nerlige Ramappa wrote:
> On Wed, Nov 13, 2024 at 10:25:46AM +0530, Riana Tauro wrote:
>> add a function to convert xe hw engine class to
>> user engine class
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_hw_engine.c | 25 +++++++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_hw_engine.h |  1 +
>> drivers/gpu/drm/xe/xe_query.c     | 12 ++----------
>> 3 files changed, 28 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/ 
>> xe_hw_engine.c
>> index 1557acee3523..ba40f2692f34 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -981,6 +981,31 @@ const char *xe_hw_engine_class_to_str(enum 
>> xe_engine_class class)
>>     return NULL;
>> }
>>
>> +/**
>> + * xe_hw_engine_to_user_class - converts xe hw engine to user engine 
>> class
>> + * @engine_class: hw engine class
>> + *
>> + * Returns: user engine class on success, -1 on error
>> + */
>> +u16 xe_hw_engine_to_user_class(enum xe_engine_class engine_class)
>> +{
>> +    switch (engine_class) {
>> +    case XE_ENGINE_CLASS_RENDER:
>> +        return DRM_XE_ENGINE_CLASS_RENDER;
>> +    case XE_ENGINE_CLASS_COPY:
>> +        return DRM_XE_ENGINE_CLASS_COPY;
>> +    case XE_ENGINE_CLASS_VIDEO_DECODE:
>> +        return DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
>> +    case XE_ENGINE_CLASS_VIDEO_ENHANCE:
>> +        return DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
>> +    case XE_ENGINE_CLASS_COMPUTE:
>> +        return DRM_XE_ENGINE_CLASS_COMPUTE;
>> +    default:
>> +        XE_WARN_ON(engine_class);
>> +        return -1;
> 
> This can be something like:
> 
> const u16 xe_to_user_engine_class[] = {
>      [XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
>      [XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
>      [XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
>      [XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
>      [XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
> 
> WARN_ON(engine_class >= ARRAY_SIZE(xe_to_user_engine_class));
> 
> return xe_to_user_engine_class[engine_class];
> };
> 
Okay. will add this.

Thanks,
Riana
> Regards,
> Umesh
> 
>> +    }
>> +}
>> +
>> u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
>> {
>>     return xe_mmio_read64_2x32(&hwe->gt->mmio, RING_TIMESTAMP(hwe- 
>> >mmio_base));
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/ 
>> xe_hw_engine.h
>> index da0a6922a26f..3aca7751a482 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>> @@ -74,6 +74,7 @@ static inline bool xe_hw_engine_is_valid(struct 
>> xe_hw_engine *hwe)
>>
>> const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
>> u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
>> +u16 xe_hw_engine_to_user_class(enum xe_engine_class engine_class);
>> enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct 
>> xe_hw_engine *hwe);
>>
>> void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg 
>> reg, u32 val);
>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/ 
>> xe_query.c
>> index 170ae72d1a7b..98b036678eee 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -26,14 +26,6 @@
>> #include "xe_ttm_vram_mgr.h"
>> #include "xe_wa.h"
>>
>> -static const u16 xe_to_user_engine_class[] = {
>> -    [XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
>> -    [XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
>> -    [XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
>> -    [XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
>> -    [XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
>> -};
>> -
>> static const enum xe_engine_class user_to_xe_engine_class[] = {
>>     [DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
>>     [DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
>> @@ -206,7 +198,7 @@ static int query_engines(struct xe_device *xe,
>>                 continue;
>>
>>             engines->engines[i].instance.engine_class =
>> -                xe_to_user_engine_class[hwe->class];
>> +                xe_hw_engine_to_user_class(hwe->class);
>>             engines->engines[i].instance.engine_instance =
>>                 hwe->logical_instance;
>>             engines->engines[i].instance.gt_id = gt->info.id;
>> @@ -677,7 +669,7 @@ static int query_oa_units(struct xe_device *xe,
>>                 if (!xe_hw_engine_is_reserved(hwe) &&
>>                     xe_oa_unit_id(hwe) == u->oa_unit_id) {
>>                     du->eci[j].engine_class =
>> -                        xe_to_user_engine_class[hwe->class];
>> +                        xe_hw_engine_to_user_class(hwe->class);
>>                     du->eci[j].engine_instance = hwe->logical_instance;
>>                     du->eci[j].gt_id = gt->info.id;
>>                     j++;
>> -- 
>> 2.40.0
>>

