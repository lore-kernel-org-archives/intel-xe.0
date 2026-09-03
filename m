Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AC5C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 23:19:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F43B10EB6C;
	Thu,  3 Sep 2026 23:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J8A10Xe7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296ED10E184
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 23:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788477589; x=1820013589;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LKD+r/mtI/NgX1xFWAEMlgZeRITYnhqNjcuvFdpk/Ng=;
 b=J8A10Xe78z+B72ADY1eOc8gJ6v2YJUN9TyCmBsiUR2yAkbNZue0ZqLPq
 4oRINa6dzHAtY31lVsu2kpyAk/VxGLjpHJ2SeWg7Gwk+LhomUSvgjDEv0
 gzPGEoqLaAy5A7pxNuLDS8Wb1489hr4m7+RaVB8fp5YXDzHxMGoaKJmwz
 WoaB4ectqvWguXq9S0dXd2DCu6vz43KmvexrpmoctN7KoQjz+GR19jRUH
 4lG/G41cmFugXktxPklkMCnr5221HR/bcm0n7KvxbtPdLuu+6zMx6nm0l
 etcNa9imVsPF/0jH7NZB0PHvKwl5XDqaGyNtA0qf66P1KJcKhDdXkQkqF g==;
X-CSE-ConnectionGUID: J/e7df+oRX+0GhI9mtPOng==
X-CSE-MsgGUID: vfz3g40LShyTv8+3d2Wg0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88902529"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="88902529"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:19:49 -0700
X-CSE-ConnectionGUID: krGq6D1LRyi8NwIMfL+KVQ==
X-CSE-MsgGUID: nJYWu02pSNamm0WZDbz88g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="293389091"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:19:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 16:19:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 16:19:50 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 16:19:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rxy5l2jgG/BjHNQd4vzrFVp6wHrT8O3wxKzTgooXJmyVeB0JIeC/NpBDNB34l3hnsgKt6bq8iDVVTyQbaBAUNmBNlZUpoBhiwTnrTNigyhPZ1kfZYEPDZ30T4dgCaoB54gSysKuptx7Lcg6YyjYxYq+fp8N0gWwjKLYCCquQ8RGZ9TPjo1m9KiqxVbPgDAFKyGKmzfPLDhfh0Z7mgnDmcJbTLhbjuCkzrI2muaJCH9qvsdb6hVTcwcJJXtYv45Jvfx1mjy3ocsWArcKWqvRNK1bRHI/N3lXNi2qiyt+OHYYH2nyFUFgXQxefxSBtAA8JYd2uUCXqSctTw93iNmdEMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQ/UeNNqi6EEs9m6jstWabkbTnUb1qlqySx09SYI5+E=;
 b=aWkY2fFP5n5gtpULbK2vBBD6DN5sPdAmjHkza/q0phewAekk35AJ6SjXGJOwl/S5kpzKKOJK+CpnR/Wv3+V+28fYyRNhnlVN2ToRb0TSIbLo9yWDdG0XCDlbaR+BDHXxY1jRdTq1/Ra7MzeunIVCzARfSJRVffqIpHSM1bcH3CB4Bq1NXVWyOA5vINBoAzxFev/nYGtmxHGYdqH1d7QSAOBkzV/I7QFkwwoUHNsn4UVd4YPeryXVbse/O0jjIS45NpyndjtG98p6TzR27boZhXXPgp813gRRtn29Sn01eF79lLiU/hPxCNFvXPHcoF0rq00cmGdlQypB6K4dGnDwtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23) by SA0PR11MB4560.namprd11.prod.outlook.com
 (2603:10b6:806:93::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 23:19:46 +0000
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::fdda:94d1:2f7:b79f]) by DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::fdda:94d1:2f7:b79f%8]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 23:19:46 +0000
Message-ID: <14d20a60-29f1-40f3-83f5-e8b6eaec81db@intel.com>
Date: Thu, 3 Sep 2026 16:19:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] drm/xe/forcewake: add delayed-release optimization
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jia.yao@intel.com>,
 <matthew.brost@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260813000654.2712317-1-zongyao.bai@intel.com>
 <apnDogYw4G6bXNlh@soc-5CG1426VCC.clients.intel.com>
Content-Language: en-US
From: "Bai, Zongyao" <zongyao.bai@intel.com>
In-Reply-To: <apnDogYw4G6bXNlh@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0021.namprd21.prod.outlook.com
 (2603:10b6:a03:114::31) To DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF46B98A11D:EE_|SA0PR11MB4560:EE_
X-MS-Office365-Filtering-Correlation-Id: 43b63bab-2e5c-4093-5ff6-08df0a11d7d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|10067099003|11063799006|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: y3eKA6ubGc43XoWkr779nMA0/Kuq4upc+ukpiozfc0G+ZQZvPLp24OLLK5doTatj5JJcYpdvi/JsoqZniVapU7C1mY+ScslAyOoQrcXYEvF2fHjoTJnum3Eaj6iN/8+kCBx4yMYBDW3xzRW45YtEqTPbCXXnZnaqPh4ZlJuRN8CCHvPL2t2MSJboejB9RdETtuPxTVEMYSoUFbf8oggsplrrXurCaXmq/Nz14r3MXexs5hb9TD+MTcrumBWrq33Jq+Ff4emagoKFU54HFegGiSO96pR46IrjKt8WodD4yqN9tmJtSCbqBtOa4m4SSsEXZ1fCh9T4n6lZc4EqfcJsz7BsJFgkzFQH2DnK2nseyu3CJ+M9Fy2jrbG59KravIdQf9VREAhgNMduaqTsAb8Qi88CZmjifgN/w9lNz1/i4QzFvoRUe4ceCLlNBLwd5uoksPeQZFIhcxnZLcNHdI5bTTXMUjc6hhBqw/rtsxe9uR8PK4uhMB+DdWM2Mrxj+UTtRIPJlF8mU0KC0NSupkCBkRoO8QzCQkcEWDpIw1yxHJ9Fjc2Z1alHgHNWxIJl2WKwRzhiUHZ/SMJnXzCCWvw2hiOcBNhfHPtk8FbVAfihm0R1/jwbbeZfR2vcxX76nc8r1/fv8P1QNJOyAUP8gBYStkhAg5Qww40b7vw/GZvGp4g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF46B98A11D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDhDVm0rNnRqWDhBL1NsdjhZUjRNR1kwaWU5RlhkWGYzK0lIQnZ2QXE0Nkgw?=
 =?utf-8?B?akxra1N1QlArWHIyNlllNFE5Z3hvQkozUDg1RVFWaDlJYVNsc0dQa1JMQWJo?=
 =?utf-8?B?YS8rSk14TTcxSStkNms0WVdxNmxyaHBnNG4ybCs0OTFUbmtKQ0ExNlk4aVJQ?=
 =?utf-8?B?QWFEVUx2V3ZkN200amJDY3JoY3FLeGdlWVdGQ00va2tHMmN0NG43TGx3YkZv?=
 =?utf-8?B?MWdMampFN1lPOENBRVF0ZjFCRG9seXRtUVAyakJ4ZlRsYmY4ZXpjY255VUlH?=
 =?utf-8?B?VmNpSi9zTGtLeTlUdVFLbHFQN3RMdm5GalhFK3RDejdqTlI4Nnl6N29vOEky?=
 =?utf-8?B?NFJJRjRPbHhMRXU0MFE5YXk0QU9NUjhNZXVONnZaWUlPZmVMNVhlcjVYaVJB?=
 =?utf-8?B?RGFVbUxxWjlWTGE0SWFpY3hWbGxMdmQ2N09LdzFpU05jNElaZjgvQTBRWGZS?=
 =?utf-8?B?a1NyNzZqRE5LTnZQVTFoRFd1M2ZTTGhoSTdPMHdFZVFzTDJJNml0QlNHN2Nu?=
 =?utf-8?B?UndTNFgxdXp4MkVkRXcvWFRROEs4WHFzLzdxMW9GM2NVNmZOaEtZYUNXeXF4?=
 =?utf-8?B?RkhWR3pBbTZHaU5ZSzg2cm1KSUhVQkR6VFVPd3dNeG9iK0dKbndvSWEzU0RY?=
 =?utf-8?B?aDlydXBmNTBWaWhUaXlrdnh5VzNEbVROR1c2VEpMWVhiVlRHL2diSDhkM0hY?=
 =?utf-8?B?RDdWRktYZ0FrWFNGckNHRlZsNWhPYk04RStBczYxbCtzRnJFTkR6M2cxMlgr?=
 =?utf-8?B?TlhOWnB1Y2I5NmNSQ3FJMUpQRWIyVWRFQWl6ZTMxUHlJc21xVm1jQVdhMllC?=
 =?utf-8?B?UWRYSG9IQWFKa0RFemFFMC9ZdXJrL3RnN2tWT3JaWDhWNWhWeXdoWnZWeFF4?=
 =?utf-8?B?aVhqYlZqeExyclVwclAvUGFoSHlBbmVlZ1BpOGhOdXBCOFJibWJhMk8rWTVZ?=
 =?utf-8?B?SDFJMWd2QmVVcjd3VW1IVXFoUGM0SWMxSUdvbGE4Tk52cy9TQWIxTmN6WVdk?=
 =?utf-8?B?aDc3K1RMODhBTHd5S21IdzhycWRSYVRORzVNTVBVTVlxamhvdVUxamVYdjVn?=
 =?utf-8?B?NlE1aVFvNXVRdVRLbXU2WnZ1d2l4MDVqZ2lLUE03aVk5cWZ2YWtISEFZb1ZC?=
 =?utf-8?B?aE1USGJlODl4Q2pvWUhxQzRjZmpFeFZtTTZhWk1meWF5UmF3NXYrUFBpanVo?=
 =?utf-8?B?QjBpSzYySG11aUR2VWRvNlZQTEViWVJiT1RzNUlON3IxSEdkeGF6eUhpaVA2?=
 =?utf-8?B?S2tEb1EwYnBEbERoMEh6UXhnQmJzUmtnVm4xZm56S1NhWFY1L2JsWnl2NDZE?=
 =?utf-8?B?OU5IYXpNeW8zalo5MXBpZnU2bEJpdHMzOGNhRCtRMmg0TGtCQkxzM1MyaXR3?=
 =?utf-8?B?cW1GZldlYnl3ek85NHh6YVlvQkkrZFRCZi93eFlGc2t3ZTVvZ1FSbEZRRmJN?=
 =?utf-8?B?MzVzdnpBM090WWxheE9oNEhKMmNaM25YYkkyUDRXL2JjUWlDYUpocGMyWFpG?=
 =?utf-8?B?RlE1MU1ENUg5bExqZDFNMnpkN2pzbW1xMzRaNGZ6eUliekUxdXVmaE1WbkVW?=
 =?utf-8?B?QlFuQXRrb0dSaHNjdE9sUC8zOGxFb0xiS2JlbFg1bVphMG02UmdscjJsN0dv?=
 =?utf-8?B?VWN2R3FCN3lqUjNYY0tCamx0cFZwNjNsV2ZnWnkrMlFXb09mWGZET01aUWFn?=
 =?utf-8?B?WDFkYlMzZytBWDE0aXFFWnFkcytVdzBxU3dZbnlHcjJmZ3JQQ3Q4ZTM2TzJP?=
 =?utf-8?B?cjliQUFsQ1FrRzhpb3VlUFBaeGpxVTdrbEcyNTQxTi9NZnN6ZlFRWnBlRkFs?=
 =?utf-8?B?NVF0dm9Ec2hNbGpac2dFbWZMWVIwa2tjQnRDRWZZY04rbUFxZnYzQS9sOGdm?=
 =?utf-8?B?VHNrWnQ4SDZWUUpQOHZ6L05qR0Q5TmtKY0tRbi8yM3N6ZVhKS1V4YUt0TTlD?=
 =?utf-8?B?OWNRY0Fneit0c20yUG1RVEJNWGphNlM4dkUyc1NGUDZWWlBmdTVtUFlKKzhU?=
 =?utf-8?B?NWZYY2VQUXZ3SHdXcGdVRytleWk5aXpiWGVCTnlPWFFvV2RUbFF3a0RSTyth?=
 =?utf-8?B?RDNrd2JuWlB1TVh3N3F2ZDlUbzlmajk3a3dkYVdVOUxSY004SFk1aklmcUlu?=
 =?utf-8?B?QmE5Sm5MQkNadmUvQ1pZL3NlanIwVUlaVHdZbFY2UXRoc2NnaEo2UUs2b0Zw?=
 =?utf-8?B?OTFLbURRbFFJRFZmS1dWWUJmSkUzSlhSVGlyaEtFUlVSN2x2cE8rc09Fdy9k?=
 =?utf-8?B?ZmE3UkxiY05QWXNXY0V3U1JmQlc1dGRMMkRKclJwcDE0R0pqb044cXNzSE1Y?=
 =?utf-8?B?Q1hGK0IraElBanNXOWxoY044SDJnek9ScmNxOHduQkJqZ0NzRFp2QT09?=
X-Exchange-RoutingPolicyChecked: PgpIUD8Y9enQwEALey0LmjQl52jEc6+ulh4W+70MmKv7rlGdk//a2hJW35aVJl4u4wnzHgeFDuvF1BtKUQneF8ZWGoGLVZEKtlLcFEXW8pdor9qoBExGY4HrvMFN6KlwlxnqiIFdbDkg8S7ZrC7mYNP6BUoXxkUpSu1V914MgmpXEogPyxW43ocLmzYHOLzcXvUq/VyCD0xYLcxRfZeYpLpY24pfZaVQ8v4NxF+Yr4oXfHL9CyXiU+SdnHprA1FsxMLTCFZlTLWVPp8/hiZMTbtNHNTwntqhH7aUOwDUijeO7Arzd5nuJ2gJUmRMQ0o+cvDqerside1W2IxM2g6Kgw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b63bab-2e5c-4093-5ff6-08df0a11d7d9
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF46B98A11D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 23:19:46.3742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IY+H7l63oDr+qZt1fqHPnSt+SZJb7ElfV+UUceS+lzZ1FkJhMCnAwBQ6aZP0sJDIA+mLWDScU/6gOESzdmq40g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4560
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


On 9/3/2026 11:59 AM, Umesh Nerlige Ramappa wrote:
> Hi Zongyao,
>
> On Thu, Aug 13, 2026 at 12:06:50AM +0000, Zongyao Bai wrote:
>> Engine-cycle queries used by tools such as VTune and PTI can arrive in
>> bursts. Releasing forcewake immediately after every query makes the next
>> query issue another wake request and wait for its ACK.
>>
>> Add an opt-in delayed-release path that keeps an idle forcewake domain
>> awake for a configurable interval, allowing a subsequent engine-cycle
>> query to reuse it. Other forcewake users retain the existing immediate
>> release behavior. The default hold interval is 100 us and can be changed
>> through configfs before binding the device.
>>
>> The series also synchronizes engine-cycle queries with unplug and 
>> flushes
>> pending delayed releases before suspend, shutdown, remove, and probe
>> unwind, ensuring timer callbacks cannot access MMIO after power-off or
>> teardown.
>>
>> On BMG, this reduced the Level Zero timestamp median from approximately
>> 48.5 us to 9.4 us.
>
> Can you please add some more info here on what this measurement is and 
> how this is affecting the VTune/PTI use cases? In other words, what 
> breaks if we don't have these changes?
>
> The purpose of engine_cycles query is just to capture CPU and GPU 
> timestamps as close to each other as possible and then the user would 
> use that to map the two timelines in whatever they are trying to 
> correlate, so I am interested in understanding the use case that this 
> is improving.
>
> Thanks,
> Umesh
Hi Umesh,

The main issue without this patch is the latency introduced when the XE 
forcewake domain goes to sleep immediately after a query completes.

In VTune/PTI workloads, APIs such as zeDeviceGetGlobalTimestamps() may 
be called at a very high frequency to correlate CPU and GPU timelines. 
It's not a one time query.
Since the forcewake domain is released right after the MMIO read, the 
next query often arrives after only a very short interval and must go 
through the full forcewake acquisition and MMIO read sequence again.
On bmg, we measured that this additional forcewake overhead can be 
around 48.5 µs, even with RC6 disabled.

This patch introduces a delayed forcewake release for the engine-cycle 
query path:DRM_XE_DEVICE_QUERY_ENGINE_CYCLES;
Instead of immediately releasing the forcewake domain after the read, we 
keep it active for a configurable period.
Currently 100 µs by default, chosen as a reasonable default balancing 
power and reuse; tunable via configfs.

With this change, after a zeDeviceGetGlobalTimestamps() call, the 
forcewake domain remains active for a short period.
If another query arrives within that window, it can access the registers 
directly without repeating the forcewake sequence.
The timer is then re-armed for subsequent accesses.

For the forcewake state transitions, please refer to the diagram in: 
drivers/gpu/drm/xe/xe_force_wake_types.h
And more details can be found in GSD-11225.

Thanks,
Zongyao
>>
>> v5:
>> - Split the original patch into four patches: unplug synchronization,
>>   delayed-release infrastructure, power-boundary flushing, and opt-in
>>   enablement/configuration.
>> - Preserve a newer hold interval when an older timer callback is 
>> running,
>>   and settle an outstanding sleep ACK before waking a domain again.
>>   (Sashiko, Matt)
>> - Synchronously cancel delayed-release timers during forcewake cleanup.
>>   (Sashiko, Matt)
>> - Flush delayed releases during shutdown, device removal, and
>>   post-registration probe unwind in addition to system/runtime suspend.
>>   (Matt)
>>
>> Zongyao Bai (4):
>>  drm/xe/forcewake: synchronize engine-cycle access with unplug
>>  drm/xe/forcewake: add delayed-release state machine
>>  drm/xe/forcewake: flush delayed release at power boundaries
>>  drm/xe/forcewake: enable configurable delayed forcewake release
>>
>> drivers/gpu/drm/xe/xe_configfs.c         |  72 ++++++++
>> drivers/gpu/drm/xe/xe_configfs.h         |   5 +
>> drivers/gpu/drm/xe/xe_defaults.h         |   1 +
>> drivers/gpu/drm/xe/xe_device.c           |  16 +-
>> drivers/gpu/drm/xe/xe_device_types.h     |   3 +
>> drivers/gpu/drm/xe/xe_force_wake.c       | 211 +++++++++++++++++++++--
>> drivers/gpu/drm/xe/xe_force_wake.h       |  46 ++++-
>> drivers/gpu/drm/xe/xe_force_wake_types.h |  68 +++++++-
>> drivers/gpu/drm/xe/xe_gt.c               |  12 +-
>> drivers/gpu/drm/xe/xe_query.c            |  36 +++-
>> 10 files changed, 437 insertions(+), 33 deletions(-)
>>
>> -- 
>> 2.43.0
>>
