Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8393CC79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 09:14:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D63D10E710;
	Mon,  7 Sep 2026 09:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lz6KY09d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197A510E710
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 09:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788772442; x=1820308442;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j8yHfDc2DNSuJo7wSpTwJggXsiohkmg3RlrRmQAwk8Q=;
 b=lz6KY09dXQUacjhkXjqdtvmG8h/3pyXJQsFa7S2shzI9ILZE1c5oJDjN
 MZXal/+/wfoIVU13+nNgAezg6EX0NzbuOmGDecBQt+9jBEeOtubUNyCYJ
 269myMOoxd8dpwTEDsqNyT3rLsIYkvxJP9Uwe+6vbYURpz3+2iTkaPKlT
 XAbV1834vsGi+JuCCW2LC8jLcyN3RAapSajly/OPunH/6e/o4HYm7hn5v
 PGe8AcYnTR6SkIidhkmhdCTDkGh0AYjtnLygooG4QZwMFQf3+tuWcdAme
 +i/DWABUDtGOJv+dNahDq5MpSrwzxL5nUWbj42+vw6znTv1KTY/+Mi9j1 Q==;
X-CSE-ConnectionGUID: uWAcFObJQ82P88t6a3S4SA==
X-CSE-MsgGUID: kV9xNcouRmyKh9eC/dGnPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="76730396"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="76730396"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:14:01 -0700
X-CSE-ConnectionGUID: bk+7sf+JQweSQueCZVajMQ==
X-CSE-MsgGUID: W/68/NorRZSbUwWjTQucdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="270620543"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:14:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 02:14:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 02:14:01 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 02:14:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vRlB1/war0ccAwLgbo+HmGM4f9CGIKL3uEKRl1n3DfdaA1jSebAe3diIo0cQXcqTsd5smEJpJOQeqpS1WgsIVv88U3VlcyUIB9j1WOfhn1zHV46RJhj90d/g5y81Ovk1/1/3AG94G0GRXMwo+5J4JlIM3yErpsuVu0pfcL3w6pptNEbothLtpTTAjih8UB08Zx6hNkwL40JnUMG117x2R+JTxUQP/8rySpBUIyQZAQwq1swxyiogubsa6VaYSVCJovVMIifYU5uz/scYNc721r76svGd+AyrGXlCiAFfTjehM6/MeVfQPTcTMXhJrvalNeFl4do67J25c9aFfGilfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evmAbmpwY8sLpsrFF6NXrqvO4XFYPhpoVmkC1QndgoE=;
 b=xU7pYyy/msqamwJ0N/qyXF6QawQkKe2j28342GGjnNTC0XP2crphrR8pFjQS+5neMJPfFOe/zM60KEWEWSEYlFcCMUJxTv36GIJsxXIFC0VmcTSg4nNvl6OYWtoG3cnf0N9/9Mwt82owSZ6gJTFNDTxsJWfmDF4WtPjSA7/jGTh1Mp4FiZNl2KXvVQuMbq2Vik2sLBF5qYObFT0Rr9d3SzYdpfDfo/DPXtvdVEa+iT8Tr1XQUNnIZJgI3qlNxFFDZEozUCeaEMOKZzfZLf9OTSjVBPbHUZ+uep912V+LXtSOiEAfVjE0az7J/NJuyx3JK3RBzNXUx7RriPwjrgStbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SJ0PR11MB5149.namprd11.prod.outlook.com (2603:10b6:a03:2d1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 09:13:59 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 09:13:59 +0000
Message-ID: <5ac64235-025a-48c9-ac18-893fcfd6db6a@intel.com>
Date: Mon, 7 Sep 2026 14:43:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/cri: Expose device UUID through sysfs
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <mallesh.koujalagi@intel.com>, <aravind.iddamsetty@intel.com>,
 <heikki.krogerus@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20260904160608.2004174-4-badal.nilawar@intel.com>
 <20260904160608.2004174-6-badal.nilawar@intel.com>
 <65b77b6b-a21f-4631-9cb3-a5c0e07645c5@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <65b77b6b-a21f-4631-9cb3-a5c0e07645c5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::14) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SJ0PR11MB5149:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ecfe4ee-1961-439a-db97-08df0cc059cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|6133799003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: gKX5O8aGr0bk/oOEQmmly0fc6JMcMHXGVJ8gCgZhyL6lCKZ1mAc1LxgT8eoOGSALLZaXn6pSdwo6fLK8pGI8uy0EVNfo3li56DBFJzQ19m++r6CfHMCnnTbYvPaF2Zwx/w7IQybE9KnToqzf8WfglC+oCUMLzsVjUdMvFH/eYEDnTVuVyDLSnFhVtsy7vccboa05mTZ0b9+WPKyUVoVrspP4UXmNZGPEH7HFJgBRkUMBWHubdYieT5qIcb14DukkjEmfmSvR9kq2PAa3JvHSsRHoE84vA3ygVePapwwEsXMoN3bFdHz9K/StfDXCl+7bUUcQmWtEYrER1LPDkXPIW5rvLT8SjJ8g10/8hY6zrJhg2ayx+CX4RIaAENSLib7KeHDV92F6c3eNzgh/Xc/AXnKHV9RCs57lXzT36J/baMwDAWkSduP8+tgnbjXWpYJahA+/4SDNVAApZcCF5rNY+yIdXmF3u5ziMRJo8tqtnCgdHeCLJC3wx+6htZY3NVmVLFwTl49nVzo2q7cpYCukV2dDmil7h2MnH4sG61BIjolgnB0/Ozg6e8JdN8aoHypzrVhRgjOKuY9L5Kqgc9ElwhlNqVw0TyHVfLOvkJHQiZpcbkGyTXhQWD5xI6P2NEYwyza4oRkstbXM6Ql7u4zuifOyp/Snu1rjJPHcyYFyNZE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGpNV0IveTZPa0dXUVhkV3I3K2pXdzJwT2lHRWlwMjF3d3dGeFlNS3YydTNv?=
 =?utf-8?B?RkJqRXh4MkN0MCtoa2RXcjhuYVVhRWNRZWJmTTVhUWFmUFBLUjllK1lxV0V1?=
 =?utf-8?B?b0ZBUnJmaHVRbmFjcXBhb0cxdVQveFFHRS9IeDZmaUVuSFVWalJmdHh5ME5y?=
 =?utf-8?B?OEFUMXFuZnAvMXdZcmVyS0ZSRXlyc2I5ZmZzRCtSVDQvUHZ6RTRmK0NEcWRW?=
 =?utf-8?B?eXo1ODZxSHFwM3prbHZQNUVHZFVQTzZycVFYNzAwZzFkaVBnRzB3a2lORUtD?=
 =?utf-8?B?alFhNmJ0a3ZDWjFKNkZWTFNPNzYwN2tGVTFrM0libVoxeUZWckc4SkR2VllX?=
 =?utf-8?B?UHZNbkNrRXNCd3hkOHJjSzM0V21TME1tMFJidFovMmVJTGlPS0kzQnlHK2Jh?=
 =?utf-8?B?N3d6UkI4N2hDdnVqV2w0VnBWMkppNElrK3cwU0hJVXhZek5sN3QxZnJDM1k3?=
 =?utf-8?B?dHhHL3FuNmwxR2JYTVJjOHpoRjVPeC9TY3NlR295NWtBajAvNnFYWkpld1ZE?=
 =?utf-8?B?QnhISjQvWDhiRFNMQy9CLzFNY0pLZHZJaUkxNTFlWlZRdkE4Q2l3dXhZdjE0?=
 =?utf-8?B?S3lONjdYVmVHRGc2bnR3alU3aTdRWGUydFNiTzZCZXh6V1NpMXUwWmUxcjgy?=
 =?utf-8?B?NjN4MGZjSHcxVUpOVjA0YVd4Uyt3WXhaMkozcDFmMXFoZGlQU1VHdlRXYmVl?=
 =?utf-8?B?TmhNbHVHSzF2bUtTa2Q1QUVTZU5PbThLMDVkeEFZelpKR0pjQXMwMEpvdXE0?=
 =?utf-8?B?VFkwMGdtdVNucnFkWHdhYUt0RUZnTlQ1aXpSYWdVam5Zb1I3SDUyWGI5cDFT?=
 =?utf-8?B?RnVJMk9yb1VSVTZ1ZmQrZnZMQi9OU2FYdU9IZ0RIOGJpMXZRNmJqMXlxZEJC?=
 =?utf-8?B?OUpabmoyS0tFd2dYZEZzUjJVb1ZyNHBVU0dpS0t2L0RzME9jRDRablVuMEUx?=
 =?utf-8?B?eDc5MVBsUE9UTG1mV0RieVE2N2RjNjNoNXVYbVI0SmlVNzZjYXI1aUR6clRJ?=
 =?utf-8?B?cEhnUWlJeWdGQi8yNWVVWm1QSnJJV1BHSUxDR1JPc3RGR1Y4bUtqdFB5L0pV?=
 =?utf-8?B?d1hzOSt0bFU2NjhDTGdIcVBpNEEzeWRVNStqR3p5U2o2eVo1dHJ5ZzZGdlgz?=
 =?utf-8?B?ZjRCWjVYTUFzaytvNXBCTk45aSs1aFpaSlZzVE1RUHNVNGh6bHIveFdUQ2VU?=
 =?utf-8?B?RkxpcE1oUHkyeDkyTU8rVzJ1Z1VFY0k1ZmRFOTVJREtEdmsvYXNOaG1VbW5L?=
 =?utf-8?B?MDdaUjNtQ091T1JldkRaZFNJKzRxZTdhdW1HMXBWRWNWWUhZbm5jTDhVcm1X?=
 =?utf-8?B?WXg3NnlHNXNaNjV0dWMxeG1POXp3ckZxdjRxa080TWRPQkJhRzlncitEeElh?=
 =?utf-8?B?eHN0ZU9VYzJWS3RQTnFJdmRnRXQvR0RTZXJSbGo1UkszU0FjLyt6K1RzK2FJ?=
 =?utf-8?B?NjR6Rm41UU1mQ2pjWTJQeGV1Vit5Rm5SLzdQdTNUM1JwSHk1K2tnL1dERzAw?=
 =?utf-8?B?M3MxNGpBbVozUy9nRVBnQTFlUmRwS0NBU0NpOEd0ZUxUUU1sSHh1Y2U4QjZG?=
 =?utf-8?B?VG1DNFVkdVJ4QmJEYnZ0eFRGeG9oT0lORENzTGhoZjQvQzlBeGZmZ0NlR2sr?=
 =?utf-8?B?M1oybFZIMlBvVUpOV1JxWi9IYlJrcnBWbUlETGtjYU5xZ0w5c0FTa3lTaVlX?=
 =?utf-8?B?bEt1RDA2ZWZKeDRudVREUitWWUU2b0Jub3pjV2djUkVWbHBmNisyWllSTko2?=
 =?utf-8?B?VnlOVVJ5MEZ4WlZBWnhINjFndFVaSjN2cTlSK3ZPcDkzZDcwam14b1NKaW5P?=
 =?utf-8?B?WDNMWEVmYWttUi9uMnQ4UEl0clpDbUM5bmVYdTY3RXo4Ni9BQVJ5b3BQNUhX?=
 =?utf-8?B?bUJQTWdReW5wVllhbHN3Q1JwQjZmU0JvY2xoTnU2YUtGM3JKUUpJNjNWREI0?=
 =?utf-8?B?N0tZUmNPNmZPMGtSR0JPWHdtbnFjNERYOENJTVVJRUFUV0x4dDhVWldZUWNE?=
 =?utf-8?B?YlRISmVPbWZhazlrNXhOQmlFdkhmTVFkNFh2d2M3aHF2ZE12bWRPZEpVUmVu?=
 =?utf-8?B?ZzNQWlA2aEhWNEFNMGE3Rkdkemo2clBLdUpVS1IzaklXQXF1WHdDeXFxd1F1?=
 =?utf-8?B?Y1pQZnBYUGtQQnZWdVN6OFArTmZPK3ZtTkNicWhiZklrem92RzhnTVBYcGNj?=
 =?utf-8?B?TS9FdlRMSUVoQUg0Ylg5UmIyUno4Q1ZNNWRlNUlHNjdGeGJIbHRTTHdCa3hC?=
 =?utf-8?B?Y2s2NFVFTTQ3RXBEaFJGVmswckZpOGxzNXhJWDBvR2NSdTNQaHVLYk5hU09u?=
 =?utf-8?B?ZG5KUjFJSDJuWnM3NllvdGtKaWJ0eTVDOVFWTzhoa3FCaFNKNmlIUT09?=
X-Exchange-RoutingPolicyChecked: ZYe97YXd67K1Nql01QFnnVOSctsF4YaTFepWM+1KiZN5A6XUb2T+eLIjXQtU1isIB9T/So9FEMRvI//c/Qk/IIuLQOHVNdj9S43eK0C57NftZvTkx9sio0DlZ3bTj8Qb+XIMNtAVr1DZvk2qE27ymLLdsKcyAbNlZYmH41c0C45i7LzYU+LySbDEkO0eo5PpTHAGlq7m0GMKuf2FkBNU/Vw3oBOsFSFDK4sdLYGar+ULqtSvIQqV+BJrgN0YVgkoiaFQp3a9Z5coTu+BC3sn0eXafY4lIbIlRHnCNzussCQ6vTM82Di86q0u1w/4F6yLTmPCPNRmBS8j7Xygb5efcg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ecfe4ee-1961-439a-db97-08df0cc059cf
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 09:13:59.0780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8yYl/648og8lqZvoRwLB44k9h6r5Hyh6EyE9TebwsW8PwvdKQy/KNhyq6NsekhKJj7ptvnqCrlUZhXVoecD1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5149
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


On 04-09-2026 22:07, Michal Wajdeczko wrote:
>
> On 9/4/2026 6:06 PM, Badal Nilawar wrote:
>> Expose a read-only sysfs attribute, device_uuid, that reports the
>> GPU's unique hardware identifier.
>>
> Bspec: 53048,53049
Sure
>
>> Assisted-by: Claude:claude-opus-4.8
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-gpu     | 10 ++++++
>>   drivers/gpu/drm/xe/regs/xe_regs.h             |  2 ++
>>   drivers/gpu/drm/xe/xe_device.c                |  3 ++
>>   drivers/gpu/drm/xe/xe_device_sysfs.c          | 36 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_device_types.h          |  3 ++
>>   5 files changed, 54 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
>> new file mode 100644
>> index 000000000000..1a4bdfbad8d7
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
>> @@ -0,0 +1,10 @@
>> +What:		/sys/bus/pci/drivers/xe/.../device_uuid
>> +Date:		September 2026
>> +KernelVersion:	7.4
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. Unique 64-bit identifier of the device instance, read from
>> +		the device's CRI_DEVICE_UUID register and printed as a
> hmm, maybe in the user facing documentation we should refer to this register as
>
> 	DEVICE_UUID(102008)
>
> instead of the meaningless macro name?
I will drop "read from ..." statement.
>
>> +		zero-padded 16-digit hexadecimal string.
> if this is UUID, shouldn't we print it in UUID format? see %pU
I this is not UUID, i will rename the node as device_uid.
>
>> +
>> +		This sysfs file is present only on Intel Xe platforms that
>> +		provide a device UUID. It is available to all users.
>> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
>> index ef4746b7b5d3..68226fe0b659 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>> @@ -30,6 +30,8 @@
>>   #define XEHP_MTCFG_ADDR				XE_REG(0x101800)
>>   #define   TILE_COUNT				REG_GENMASK(15, 8)
>>   
>> +#define CRI_DEVICE_UUID				XE_REG(0x102008)
>> +
>>   #define GGC					XE_REG(0x108040)
>>   #define   GMS_MASK				REG_GENMASK(15, 8)
>>   #define   GGMS_MASK				REG_GENMASK(7, 6)
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 8583b2e9ecf4..e8db8871990b 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -801,6 +801,9 @@ int xe_device_probe_early(struct xe_device *xe)
>>   	if (IS_SRIOV_VF(xe))
>>   		vf_update_device_info(xe);
>>   
>> +	if (xe->info.platform == XE_CRESCENTISLAND)
>> +		xe->device_uuid = xe_mmio_read64_2x32(xe_root_tile_mmio(xe), CRI_DEVICE_UUID);
>> +
>>   	/*
>>   	 * Check for pcode uncore_init status to confirm if the SoC
>>   	 * initialization is complete. Until done, any MMIO or lmem access from
>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> index a73e0e957cb0..a4d326159dce 100644
>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/pci.h>
>>   #include <linux/sysfs.h>
>>   
>> +#include "regs/xe_regs.h"
>>   #include "xe_device.h"
>>   #include "xe_device_sysfs.h"
>>   #include "xe_mmio.h"
>> @@ -264,6 +265,35 @@ static const struct attribute_group auto_link_downgrade_attr_group = {
>>   	.attrs = auto_link_downgrade_attrs,
>>   };
>>   
>> +/**
>> + * DOC: device_uuid
> do we need this?
> you already described that in Documentation/ABI
I think I will drop the Documentation/ABI and keep DOC: section.
>
>> + *
>> + * Each Xe device exposes a 64-bit UUID that uniquely identifies the SoC.
>> + * The value is read from the CRI_DEVICE_UUID register and can be
>> + * read back through the ``device_uuid`` sysfs entry.
>> + *
>> + *    $ cat /sys/bus/pci/devices/<bdf>/device_uuid
>> + */
>> +
>> +static ssize_t
>> +device_uuid_show(struct device *dev, struct device_attribute *attr, char *buf)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(dev);
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +	return sysfs_emit(buf, "%016llx\n", xe->device_uuid);
> %pU ?
Not needed.
>
>> +}
>> +static DEVICE_ATTR_RO(device_uuid);
>> +
>> +static struct attribute *device_uuid_attrs[] = {
>> +	&dev_attr_device_uuid.attr,
>> +	NULL
>> +};
>> +
>> +static const struct attribute_group device_uuid_attr_group = {
>> +	.attrs = device_uuid_attrs,
>> +};
>> +
>>   int xe_device_sysfs_init(struct xe_device *xe)
>>   {
>>   	struct device *dev = xe->drm.dev;
>> @@ -285,5 +315,11 @@ int xe_device_sysfs_init(struct xe_device *xe)
>>   			return ret;
>>   	}
>>   
>> +	if (xe->info.platform == XE_CRESCENTISLAND) {
> use .is_visible instead

Will add has flag.

Thanks,
Badal

>
>> +		ret = devm_device_add_group(dev, &device_uuid_attr_group);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>   	return 0;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 180d450a6deb..6fdd16eac906 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -257,6 +257,9 @@ struct xe_device {
>>   		bool oob_initialized;
>>   	} wa_active;
>>   
>> +	/** @device_uuid: unique 64-bit identifier read from CRI_DEVICE_UUID */
>> +	u64 device_uuid;
>> +
>>   	/** @survivability: survivability information for device */
>>   	struct xe_survivability survivability;
>>   
