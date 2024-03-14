Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F3FC54E67
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 13:53:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275DC10FB5D;
	Thu, 14 Mar 2024 13:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iLczeO58";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F01D10FB60
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 13:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710424428; x=1741960428;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=IawC9Ka8Atr9gjoNusKKYotljy9HQiousSekdbsTjY0=;
 b=iLczeO58If1QPj+WC1kUjkHoLBeZhPy4ifA9SpaL1RleCnA+ac0/ptI/
 w+ye1xfSEC1NWYfTJJWFQHHhfGo89R6fPzFeQyuxE0DUKPMmeossfGP3/
 ZF26TdQn/daERWM7fUlaJzl5TdS/Hc5YtLkSxbOfY7pEl+ySwpodNoKNy
 b4YpTEQKZG3Q7J2eN07BSPvavMeW55BeK8fCLItVvkI+/pAFI7SYt6WVL
 U3mAxXjpJUFLHTFsuvZ3W5aSmqbdvCPSX05bsTcpb0YG+jMsBaS7AmQuB
 Cush77zgnsg2hlo/6PALuHPkkJnfcL1Xe0vlPOZEYSOBDbsSaBlUyk70a Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="16637447"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="16637447"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 06:53:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="43217917"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 06:53:46 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 06:53:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 06:53:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 06:53:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Va4Vf6xk/iuv6g6TKFs+EsmrKmCoxyNkU8rsMT+nZKmdG955Vbz3ay7i1R0p6E19riC2cS5nY6c0WZdgKhjhOXjp5UHhkGpE2PPMTCDmuoJa2UX2GU/qT8YRXHrB80bDKtR7JBOe2P6wxUV/F91nB4c7mlMJiRnXVnFbuISPOV4uJzQWA76zuO8mOyBhq7xrGVaKz8ZqX3miJ9YgRcTZjmU6WuJRPiMlrMLG1zwx9YchElXm9Z61YRL7HC18xV2hSXHl8wfOR4EtSbFNArATI59K9434SCABeHEHsi7sVnEJbKY14HcWOxEXQ4bYAhMVTSrCsADgK2YZRbY3e6Q1jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0O5icyjP9HaDQ7gLk/FdL8dGVmFGhlI1gcrD5xXMJbA=;
 b=kyFtu/l1dLOiqN2kTWxFE0d1lUlR9zz8wZ0YpwVsSgMc4wYA6/85AYYt4WxdTIypLChlIceFaZdsdllwVtEJif4PX08Ih/OmDZw+ecJnRhAHM/zygF+TouqavV0KNQ8wEDlKoYcFqPa5agp88FQZ4YGXXyEhm8DzFuBzcy1JZXVxTNkeTJE076PKhwRYmOhCfkYhZzXzT/oQLt8emUA8wj/W66qm3T/5S92XDMbdsdGK5gIfdypCqzQ83W0yWh0EupPzQA180UrT/emmtRuEJ4CiOUskVbfSGw9Owry7h0twGCQ9bXZ0bZ0X2cDG+97m5lNl5CHAXyRurxKRBfjwYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CO1PR11MB5171.namprd11.prod.outlook.com (2603:10b6:303:94::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Thu, 14 Mar
 2024 13:53:43 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::5144:aca9:5cd9:42bf]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::5144:aca9:5cd9:42bf%3]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 13:53:43 +0000
Message-ID: <10c117bd-3a02-4049-b6a2-35227f7edb6b@intel.com>
Date: Thu, 14 Mar 2024 06:53:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Always check force_wake_get return code
Content-Language: en-US
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240312194256.965685-1-daniele.ceraolospurio@intel.com>
 <SJ1PR11MB62042FB7B7B7570831A8D36B81292@SJ1PR11MB6204.namprd11.prod.outlook.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <SJ1PR11MB62042FB7B7B7570831A8D36B81292@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0079.namprd03.prod.outlook.com
 (2603:10b6:303:b6::24) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CO1PR11MB5171:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da14d36-1ccf-49b2-fe67-08dc442e298d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l9+KjUc8RfOSD1wJ7WFYk+YYDs+KbH4ekXniUrvaqINj27nx6iezaJ4ibnnxqmRJS9tKsNulKFiAtdrK4L+nLOcH6Lb8/HBy6micXopDZDUh7GPEitHMTp2S6rD/Cy3tRrY4qObBAxPWSae3IMJiQWrGmFO1ye4Amlm7KY2RqPhK2Q7O2kow27SJD6r5yCUUsJYOAbqneQVnnZBH+5sn1FqLR/Oef1xtNaG0rVzQgxT/L97pwz88IZPY80nsGAXLgH2IxcHhznuKB4ukietmENja0COltpFtQ4JUV+PkH1hBAQXEx/JlvMmstuMI0hE0oNYK4t9to3ELFbR/WdHRWjaLyPW07Qru4wmgyrV3/W/9VdCZmCE3/a03fTTjX3erhFKQzPqj9SgarhIZr9HXu7nGiXD4pEWrGlQk3XFUz5VwHzJQnbipKrEUn8nldB83808xnsxxzRS8mEygK5gTY+MXNKFubz5f0Xu6FQ1xu27vCF0oMaAn+SfpuaWpeCc0rCGNSz5Y8B5cnvpUGTdu/7SIyt9yxPPZSQZe7GHzxD6lRAlUh1sfSp0b92tYkXSzDQAD1KQ0+rYNHE2B0JD/7RIsfs9JY24x6+5yU8rJuHrms1lVG7S//TjLpr4AA2Y+PB576cWkj/sBXqvfDL11CeoEn3mPN45SUBjY2hFsXvg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjNFOTZBYzFoN1JEQzkzRVluMnNkUXZOSDZRRThySkxualBHVjlONUwvbmJH?=
 =?utf-8?B?SGplVVVsRUxUZkF2VnduZGVTUzh0dXpRNEgzd3g5cm82UytiTXRkdWEyMFA3?=
 =?utf-8?B?Y3g1WGVJd1NPT3drOVFDbWRIMUJuQkJKOE50aHJLbkpEUFZ3aWhDZlUyRkpk?=
 =?utf-8?B?c2Vhb1lxbGNIVHZqZHpYUEtVZmZFc3NSRWZ3ZGFVZXpNVXhWWSsySmJaWkdC?=
 =?utf-8?B?dlB1UkI0N25XRTJLNHMyeHF2Vm1hQmlRQTZ5SndNUGh2R0hHak9BajRrSG12?=
 =?utf-8?B?djFTejZoWjZDNlRzSFhvSlovd3pyTERwNCswZ3FjM08zekVzdFlUNG93RENF?=
 =?utf-8?B?K1BqMitSb2RkYlAxUFlneE1oZWtNOE5lUjhWaWcrcnF0MDg3UHd2Q2dUdWxz?=
 =?utf-8?B?YWVONXFFM0FJb2s5STBESXJJMTdnYTRTay9yMlZhckpEa1J4NytEMW1aK1Bq?=
 =?utf-8?B?M3BOb2w4bWlpME4rWnFUaURtZVRlU28wNnVNL2tySjRFYUc0VjNGVDRRTlR6?=
 =?utf-8?B?UHFqL2RFZllGbXJ4Z1huS1dRajI1R2h3aFQ5bSt4Y0VVbVZoUVY3b0tpdy9r?=
 =?utf-8?B?L3ZOc3hTQWpjN3NtRTBMQ2g5VjBBMy93Mkl4ejArRXlOYmhieXNZNG9pVlJ4?=
 =?utf-8?B?Y1dpY01mWGNPaDU0VDEwVXNIM2hIME1EUVUwYmd3VU9iaHVQM2NRV2VIbnlH?=
 =?utf-8?B?UWRtMTkrUGR0SGtUQTBaWldLMkZqUVRmVGpMM3c3UmpsTTlFdjV0MTUzM3Er?=
 =?utf-8?B?djRrU2NZTHYvZWZWSmRXVTVZQWViSGErSTZsZHlQNFc2OWhlTjZlQjcwdGha?=
 =?utf-8?B?NEJQY1VCTWdJNnhLZGg3MkxEaE51dXhicHFuYjUzUXFKaXVNYjNZS29hbVgv?=
 =?utf-8?B?OHdJSXdScFMrT05DWlhxTkhPUGFNajEwb2E3b01LbGVwYWFIajM3ak96bUZ4?=
 =?utf-8?B?M0hQbmtNbVBoRDhqbjdDUjE0aXZBNVpqN1BuVkZkcTB2Yk5RQ1VEVjR6STAr?=
 =?utf-8?B?ckFwREFzUFRKOVdhRU1kdnB6UkQ3ZkpQdU9IL1RmRVYycGU5b0MwYzBVbzJN?=
 =?utf-8?B?Ti9paHhkWG40eEd3b1hkT0g4Rk83bjF1bnVrdWJpYk1zd3htemEwa1Frd2Vk?=
 =?utf-8?B?SktDZ3VHOVQ4YVl2N1AzNlBlRDZGVmlzS3BHUlJtZTZpWW95L3pWQVVLUFVU?=
 =?utf-8?B?djJacFdoLzIxdHhmYnVjVzlUOXZNWjZZQWY5aFpjeUw3ZDR3aExhbW5tSnJs?=
 =?utf-8?B?U3RMV05PdEhEZ0pYWlI3aytaY0VCUUZvNTZKQ0lNdCtEdnJ3LzRZL25mdnJJ?=
 =?utf-8?B?NTVlbTBTS0xoUWx2TFl5eE44M2VLQnZmM2dQN2E2bU5lQTZvNk5xblBaejJK?=
 =?utf-8?B?Qk1yMlBpNmdlMGVGTUVteVNTbnNlS0M4dXorc2FEbVRYOVVKb3ZWQjZmdDU5?=
 =?utf-8?B?Q0JWbGlRQnorQkpqT2ZkeHljVHVBQnVRcVg0U2IrcXpIdW4wa2E2WjZTUm80?=
 =?utf-8?B?eGpCdHNCZ0dtMnpLM1h3L1R2RWxXRVNLa3BlY3dOdDVIbGljT1k4eVQ1U0xE?=
 =?utf-8?B?L1hqaG1vSjc0NFAvY1JBVENGUGl6ZktoS1g4UjRQbkZCRjhBc3B5aGtYbENx?=
 =?utf-8?B?OHR2SEQxcTFja2dQWWJGTjVUMk9aQ2ZmY3EwREpMUzZ2T1R6bVRRVWpYSTRL?=
 =?utf-8?B?eGVTbVRKSEdKbHkxck8rSVlQa2pQemxNNnhsNU5qWnhuTmtqUWI4WXREYjZB?=
 =?utf-8?B?enBvd3Q1ZDUwZ3RFUElmQVhTbHFZY0ZjbExDMlVEa0FnbmFDb28xckRPa0F2?=
 =?utf-8?B?QUFSMjBvbCtqSnhrZ3dURlRKbDNDNVIwQVpXSmo2MkViaDZIemROVGgxWkxi?=
 =?utf-8?B?WVppMFVLS2RMUk91RHJNcStYSTF6SG5md2tlL3FWYTBIY3ZtOVlzM0s0dERr?=
 =?utf-8?B?OTRXWUdONnYxdmNOT1hCOEVwL2NKb00zTy9FRytHaTRnbzc0REd6aFk2RzZk?=
 =?utf-8?B?dURXWWJ3TFpDS1g5S1UwZlJPNVBVOVlIYWFvNy90b295NU4vUDVDcXdyb1Ns?=
 =?utf-8?B?cXZvOGVpQno0Z0Z0VllKSnV1cmlpditJbEZOVERMbDEveXNwR2ExWWxwMnZT?=
 =?utf-8?B?eWhEYTNoMVQvTHAweVQ1V2grWDR5b0NsNzdPNzhEa0llcS9WbUxqb3R5dHBs?=
 =?utf-8?Q?NfIz9WxxDlsh22tX1YyoJko=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da14d36-1ccf-49b2-fe67-08dc442e298d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 13:53:43.7532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OIdbVJLemnFhfazknxwiaYbDgsk/NAnv6wjgkcvTmCxzAdOSdrJko+h2JCB9UpbeU6OosDb5S5e/RKYmz5QeENbw8PKH9NicQfhx0TebO90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5171
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



On 3/14/2024 3:58 AM, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>
>> Sent: Wednesday, March 13, 2024 1:13 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; Upadhyay,
>> Tejas <tejas.upadhyay@intel.com>
>> Subject: [PATCH] drm/xe: Always check force_wake_get return code
>>
>> A force_wake_get failure means that the HW might not be awake for the
>> access we're doing; this can lead to an immediate error or it can be a more
>> subtle problem (e.g. a register read might return an incorrect value that is still
>> valid, leading the driver to make a wrong choice instead of flagging an error).
>> We avoid an error from the force_wake function because callers might handle
>> or tolerate the error, but this only works if all callers are checking the error
>> code. The majority already do, but a few are not.
>> These are mainly falling into 3 categories, which are each handled
>> differently:
>>
>> 1) error capture: in this case we want to continue the capture, but we
>>     log an info message in dmesg to notify the user that the capture
>>     might have incorrect data.
>>
>> 2) ioctl: in this case we return a -EIO error to userspace
>>
>> 3) unabortable actions: these are scenarios where we can't simply abort
>>     and retry and so it's better to just try it anyway because there is a
>>     chance the HW is awake even with the failure. In this case we throw a
>>     warning so we know there was a forcewake problem if something fails
>>     down the line.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_devcoredump.c         | 9 +++++++--
>>   drivers/gpu/drm/xe/xe_gsc.c                 | 2 +-
>>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 +-
>>   drivers/gpu/drm/xe/xe_guc.c                 | 2 +-
>>   drivers/gpu/drm/xe/xe_guc_pc.c              | 2 +-
>>   drivers/gpu/drm/xe/xe_guc_submit.c          | 4 +++-
>>   drivers/gpu/drm/xe/xe_query.c               | 3 ++-
>>   7 files changed, 16 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c
>> b/drivers/gpu/drm/xe/xe_devcoredump.c
>> index 0fcd30680323..7d3aa6bd3524 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -13,6 +13,7 @@
>>   #include "xe_exec_queue.h"
>>   #include "xe_force_wake.h"
>>   #include "xe_gt.h"
>> +#include "xe_gt_printk.h"
>>   #include "xe_guc_ct.h"
>>   #include "xe_guc_submit.h"
>>   #include "xe_hw_engine.h"
>> @@ -64,7 +65,9 @@ static void xe_devcoredump_deferred_snap_work(struct
>> work_struct *work)  {
>>   	struct xe_devcoredump_snapshot *ss = container_of(work,
>> typeof(*ss), work);
>>
>> -	xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
>> +	/* keep going if fw fails as we still want to save the memory and SW
>> data */
>> +	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
>> +		xe_gt_info(ss->gt, "failed to get forcewake for coredump
>> capture\n");
>>   	xe_vm_snapshot_capture_delayed(ss->vm);
>>   	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
>>   	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL); @@ -
>> 180,7 +183,9 @@ static void devcoredump_snapshot(struct xe_devcoredump
>> *coredump,
>>   		}
>>   	}
>>
>> -	xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
>> +	/* keep going if fw fails as we still want to save the memory and SW
>> data */
>> +	if (xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL))
>> +		xe_gt_info(ss->gt, "failed to get forcewake for coredump
>> capture\n");
>>
>>   	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct,
>> true);
>>   	coredump->snapshot.ge =
>> xe_guc_exec_queue_snapshot_capture(job);
>> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c index
>> d9aa815a5bc2..902c52d95a8a 100644
>> --- a/drivers/gpu/drm/xe/xe_gsc.c
>> +++ b/drivers/gpu/drm/xe/xe_gsc.c
>> @@ -287,7 +287,7 @@ static void gsc_work(struct work_struct *work)
>>   	spin_unlock_irq(&gsc->lock);
>>
>>   	xe_pm_runtime_get(xe);
>> -	xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
>> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC));
>>
>>   	if (actions & GSC_ACTION_FW_LOAD) {
>>   		ret = gsc_upload_and_init(gsc);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> index a3c4ffba679d..7f1ac02b96c6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> @@ -247,7 +247,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>>
>>   		xe_gt_tlb_invalidation_wait(gt, seqno);
>>   	} else if (xe_device_uc_enabled(xe)) {
>> -		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>>   		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
>>   			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
>>
>> 	PVC_GUC_TLB_INV_DESC1_INVALIDATE);
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c index
>> caa86ccbe9e7..32b6da891f72 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -251,7 +251,7 @@ static void guc_fini(struct drm_device *drm, void
>> *arg)  {
>>   	struct xe_guc *guc = arg;
>>
>> -	xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
>> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(guc_to_gt(guc)),
>> +XE_FORCEWAKE_ALL));
>>   	xe_uc_fini_hw(&guc_to_gt(guc)->uc);
>>   	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
>> } diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>> b/drivers/gpu/drm/xe/xe_guc_pc.c index f4b031b8d9de..b4b39bfcb5d5
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -927,7 +927,7 @@ static void xe_guc_pc_fini(struct drm_device *drm,
>> void *arg)
>>   		return;
>>   	}
>>
>> -	xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
>> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)),
>> +XE_FORCEWAKE_ALL));
>>   	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>>   	XE_WARN_ON(xe_guc_pc_stop(pc));
>>   	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
>> b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 19efdb2f881f..d7462969af1e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -833,7 +833,9 @@ static void simple_error_capture(struct
>> xe_exec_queue *q)
>>   			}
>>   		}
>>
>> -		xe_force_wake_get(gt_to_fw(guc_to_gt(guc)),
>> XE_FORCEWAKE_ALL);
>> +		if (xe_force_wake_get(gt_to_fw(guc_to_gt(guc)),
>> XE_FORCEWAKE_ALL))
>> +			xe_gt_info(guc_to_gt(guc),
>> +				   "failed to get forcewake for error capture");
>>   		xe_guc_ct_print(&guc->ct, &p, true);
>>   		guc_exec_queue_print(q, &p);
>>   		for_each_hw_engine(hwe, guc_to_gt(guc), id) { diff --git
>> a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c index
>> a6a20a6dd360..3975f99fdca5 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -147,7 +147,8 @@ query_engine_cycles(struct xe_device *xe,
>>   	if (!hwe)
>>   		return -EINVAL;
>>
>> -	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> +	if (xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL))
>> +		return -EIO;
> There are many more such unhandled forcewake returns, but I guess each file and functionality will have different impact of forcewake failure like you explained here, so for gsc,

Are there? I locally added a __must_check to xe_force_wake_get() and 
didn't get any errors apart from the ones I'm addressing in this patch 
(which are not just the GSC-related calls). I haven't re-checked if any 
new call was merged after I posted this patch, but there shouldn't be 
many (if any). Can you point me to what I missed?

Thanks,
Daniele

>
> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>
>>   	__read_timestamps(gt,
>>   			  RING_TIMESTAMP(hwe->mmio_base),
>> --
>> 2.43.0

