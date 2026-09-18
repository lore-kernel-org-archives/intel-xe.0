Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119ACC982D8
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 18:31:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D4410F4BB;
	Fri, 18 Sep 2026 18:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ThLsftkp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B8210F4BB
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 18:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789756298; x=1821292298;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RK8D0fp+6XixBN86Ynv4wtNIeF7pn/SJUYg5RlfG2Bk=;
 b=ThLsftkpTiKCklnoIA4esN1CBYbpsk3dPuB320MtXAOIsa3xtX2bEqDg
 dL3ItQepGJ2uQW1Lugu7V+ALMSgYhKXUxDlkpYTlJcIAVr8OruB+jFmaE
 10mQa8MVEuD6Pn3P9dqyy00KMe2fxermpXyPYs8IUVP7nROX6blKn5BHN
 El21TE5g0xxtwlCCxOHjGOAmICIPpzDlVid2M/f8GTgvLhMXAcgBlSJrx
 qTy2fW5jUBE0U62zLZWARda64DZMdbkaWqaw6IMqjpU9b1m32rJ4UvMbc
 tB/NFO8XiaFZPw+j9aDxZuR8XReN8E9drMyVMJW42Hr8OLsj61kVvvcRF Q==;
X-CSE-ConnectionGUID: NPwR72NOSoefpZuzdIINQA==
X-CSE-MsgGUID: Fyj+GbhIS72Lk7NbV1oY8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="107785956"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="107785956"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 11:31:37 -0700
X-CSE-ConnectionGUID: LK4CPEJNTcG8Sd3wkLR8IQ==
X-CSE-MsgGUID: 0uGPTqYeShGDK5rPqEHgmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="271194014"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 11:31:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 11:31:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 11:31:36 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 11:31:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrBHSwX3JEFTryvbZvK3JhFYyb4S5of+FpPg0WWF9fD1bO5fXco/skUgfBcdlNNuHF+3+i8V6HgNmMoXW0XWM0Mf2zmk1qxHmfOsLnwPfMwjDimsIHFE9eP5tvq8A1YNrll+rpQtLQ38FuXS+ucP04B+VMm9V9lklGknKJ8u9ohHURgIJQJhodXD/60jeZ/8sBHQkmWmUEHWMoovvEzz4pQeOERd/n7gbqemTWZlnFCPLZgNL/1BoxTp8i2YH+q3R5PoFjjD4O6b1MtG/cwiVPdnUtsVNSn0RoXhHxhr8mIySOiz5DutGZF9rxIh+Oxf38BKcUr0NxTaQWmLavqgAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLwotm7vjc0bSgwVpa19FUsBgwbC+UYyykwmOxNpBTo=;
 b=soKoUWnafubfFUK62B8fs9p/xI6mp3tOb/oPNtWECBM9X+spJeJ5pEDq8jbuDehfxrdXBan2aVcAV+SkgKSFFTW2urRH+9kze5QCyJWjuVqGLHi88eyUOwS/IP6RQmD9eFtSqqDxtA+Umjp7yIbXW4pDIS7boyPnChWQIT+fT0hnsIfXGsHDKNg93uUCDKWyFPO7oHOhryVfB4RBeBl283cELUmfSM/FQmNNgPPkfw5jJsTS6uXiphitqLiQ4rubaR55spYA+l+Oi60p3eeZ1ZS5iDJ+n703fKtJVBnesFBkhF0IYfB5Fd9voPKNu9m+jDEwzk4GN6h9PAP3KRtFnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by CY8PR11MB7170.namprd11.prod.outlook.com (2603:10b6:930:91::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 18:31:33 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962%5]) with mapi id 15.21.0406.014; Fri, 18 Sep 2026
 18:31:33 +0000
Message-ID: <2a7e8701-f03d-4ce6-b2fa-8b77c57d844b@intel.com>
Date: Fri, 18 Sep 2026 11:31:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Skip schedule disable for an already reset exec
 queue
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260917193838.564857-2-jagmeet.randhawa@intel.com>
 <aqxJHcGb0Krg2ccC@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <aqxJHcGb0Krg2ccC@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0300.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::35) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|CY8PR11MB7170:EE_
X-MS-Office365-Filtering-Correlation-Id: a23bd14e-f587-4fba-92b7-08df15b310d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|56012099006|11063799006|4143699003|5023799004|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: PyXTBHsa0UfQScu1Q9noz3Ty3TxzvZ+P7o55WAuMaeQC4TVH2YUZDd4hiOe2yvK+t2qyHcB1bWBZLWcLPZ+y36fJI1OdfW1qAlU7RKZp/WQtrt4HGFVow9ktjns3iMQlEowd9rKyOhnMCUA+p+tZVo/6+uprguWc14ofP1BHjZGZZ5ppVN7BvkGUno1h+muxmon6YVN22kCVYBVrUrXHI2EbgMawQQzWdXrkjZEs/wh531dl4DrnXzjgB/UpzQbj5SPUlM1TijKoPjwpFAvfINAkaIeLxwNj1+KY9XychDPcW210a1FwHqfrangZqzH+FbIyn7DaM84uFKosHO7b7tZJ6bg088H+W11AmI5Blr98b1KBXlGMsdEC+AFwAs3dWknQ9U9uel8TijQFqUJ8K7k39KxnMkhmq7NlkkGQNtv6szgTkjqbPVN0V7HhqDYB/gs7NNppKsslC6WB5jlXMTj8OrwwJArA3dc5XkdG/mv4ArxaD2kTs7qL0ct1phhdlqXjknzrfgenE/RTOGZU47XINgwSIx52tj/kpr3OeXMUYtvHlhLcVZ4zuKGjPpRjX8sIBGViTkKPKpMj2oHkGmeyNxuI1aVBCMg9qkG5gPZ42CocRCyCxCW5O8MxI0BsxQM22l4cusgo01O4oQ2L3/namnWC+9rtBiDRi0cH7z8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(4143699003)(5023799004)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OC9xZjVFQUZJMm40UTZ6alZ2cnRpTnl5SjFyVWpoV1htbXlGV3U4RjRSM2M4?=
 =?utf-8?B?cG4yaHJwMHhXUEpJMjJrQUhuZ21LM3ZsLzBzWVMyUi9PR2RlWThEY0JhNXRB?=
 =?utf-8?B?anRhUUxNZ1pHaDhjVXM5RjA2T0hVTDBmajQ0WVlEMFpEcnQxaEdldDg5NEFq?=
 =?utf-8?B?RXRjaUFKNnFkVVJoL2o3dVBKTDd4M01Ba0ZvVmRlNjRQVmVxdlFiaVZVZDEy?=
 =?utf-8?B?dEErY2hJam9yL1Uwdm8wQTdpL1UzcGMzQ1JpdzhJUTNIQTJwYWwvVk12c3ds?=
 =?utf-8?B?MnkxYk1hZUx5Uk5tZHhYSVp1bncwdXJ4ZHRqNU5FVllXWmFhK0FtUGMzSUlF?=
 =?utf-8?B?Q05wczNmV0xKcGhVY1V6bktIdE1rZVphQ0YwSTQyckR3dTAvNkZERnNOcVRi?=
 =?utf-8?B?TXg0MnFrNEE2WEJ3dHRBZG1tdFV1TnY1SUwyd3RwY1JtdXhwWFcxeFVLYUVl?=
 =?utf-8?B?QWlVeDJ4RWc2YUNua0JZaXZBN01XSEV6OHF0R3RCNVNMRzA0dXFvKzFlK0hN?=
 =?utf-8?B?azFYd0VxeTVMbEhOL1oxQm1FN1NWTVV4Z1hPYjkwa1VEVi9sQlROdFAwd0sx?=
 =?utf-8?B?RnBxeURtRnFPclpBckZRK2FHTSt1dnJPSmVRNE1BSlZjcmZYSC9qUXc4SHp0?=
 =?utf-8?B?aTBnejFid2JnMzN4R2Z1VWVNbkhUbldrZXJ2QnZnZ1BzTWJGMm9RWVFLV2lF?=
 =?utf-8?B?NFFITE1tbEV0RUR1bFBuNFhDVyticUNMakNreTEwNU1ueThSY2sySGhEN0ZY?=
 =?utf-8?B?VmNlZ3dVbTd5bHdFL0I3QU9MaWNuejU2TVRKSGtGdGIrMUJraSszUFg5Myts?=
 =?utf-8?B?eXpaOENGVnp2QldVZnNoVVNTWDdtYnBGc0k2bjE0UXNRZU05YnRGdTBjaFBZ?=
 =?utf-8?B?bFc3Qnp1U1N4NHlERGNXa3V2SVRCMFFSSXh0VTlQRUtRVWVVejlUelVHVEFM?=
 =?utf-8?B?OVR0cmxNV1k1M2lSa1BrNG5QVEU2N3dmcW1vSTRDcFE2bS9wRmFjakM3WUtX?=
 =?utf-8?B?cWJuQUc0V0Y2OXJ5c3N6K2RQVlp0RVkwRExDeHR1RHdESHVjc09vdFU3c1F0?=
 =?utf-8?B?NFFlajB3c2dYcjU2K0lubHFjdUlqZ2ZIaWg2T1NiczRkY2RUNXJrdkpkMk03?=
 =?utf-8?B?MC9sUTZkZjMrSWhvTlZ1YVVYWVcwOVl1ZmFRc0RVK2lZN3FVOXhFK0ZaUUc3?=
 =?utf-8?B?ZTgvUVNKRTBkWTFvTnM4cFpIbnNZaTRoVkc5MVJuT3c3RDVKMGptTkw4Y1k4?=
 =?utf-8?B?MXlXU1FpYkVrSHZqS050a3FmN1BWR044Z1BoeWdDMmo4VXRLV05BSWdqVlNS?=
 =?utf-8?B?OTRuRTBCaXBQbmJQMFhPdWZxTVNVd2VUbDBnckFjUzlYTUFueUdrZWwvZnNt?=
 =?utf-8?B?YllaeTJRTDBBcjdmWi95YnNUUmJScGlCK3dObEVPLzRkaVRTaUV1RHlMR1NV?=
 =?utf-8?B?NVNsTjhVUHlHdmM2M0c2S3JMVk9ka20xYVFXUXZHT2pLRTdJNzV2TmFneEdW?=
 =?utf-8?B?VDYxTlpaSUlWL2FWR2hZWEJrUnhzaXk0YlV5bkplRVY1SGorVUwzS3dUbktY?=
 =?utf-8?B?NytEY0VFZzdFSEliQjMyZjZGZUJZQ0gyWVZ6TEVQSFdFK0FKMEROakN0TUhT?=
 =?utf-8?B?UW1DWVpFYW96VFVUZ0k4WGhhc2lFdWdQcmZhRnNaWm1oalhTWnR0RmJMWUR3?=
 =?utf-8?B?cWllTE1icVhBZjNHcEhVc1ZyM0h3Z0FKZ1owdzlGRi9QQ0lUd2RXZkM5NEhB?=
 =?utf-8?B?M2NXTngxU0FQelhZUlMzZGR2RmxHZ1lsaWR3SUZ4UUNkV3F6RDk0YS91QnhV?=
 =?utf-8?B?Smx6VFFRVWxPVjZWaVlnclNVaWRLTHUyNDBHc3hzeG4zUDRLSmJ1b0lXVkt0?=
 =?utf-8?B?QXREalNZM3VkWXhHamlCTm1qNXg1aGVHd0hlUU12UWdlK0NnSXdqRXRsYk1W?=
 =?utf-8?B?a3Q5WUZTOFhoK3NVVGxqOFNMUno5OGcyTVU4aExkbkNua0N2d1dibDd5T29N?=
 =?utf-8?B?YndYaENTYlBYS0JJcXBxL1I1MFlLdFJYNTFBOHFybHRiZms5b1dSZCtWOHpr?=
 =?utf-8?B?bG9EeU1wcjNUZ1g1cUVZNjF1UTBxc0tlY2orZHFCek9hVlpGRzNVS0NuZ05x?=
 =?utf-8?B?SnZUWDhZOStDeTlWZkRSdzhoU3RUeE5XNTQvN3VrYlNFUGFWc2NiNVBNZjhi?=
 =?utf-8?B?WFdieXMwSUtNeXRzN0I0SlBsbS91cmxibWtXQmt2RVZSUS9oMWVQRXdMUXFr?=
 =?utf-8?B?Wll5ZVRGWi93TGlTdXhCMlFXZG4relUrSWhqR3ZhbVFxOVJvUTBRZWt3eEpD?=
 =?utf-8?B?YmpPQjhCd2tuVWNSS1VMcjhYRmUyVDl0NTAxRGlZSTlXWnA1bGNyNXdtYTJR?=
 =?utf-8?Q?kVkM3EbanBlRTq1o=3D?=
X-Exchange-RoutingPolicyChecked: trFW5cPADyow4kvO+O9CiTfHyHuHhz5VElYqug+QisZcNNAcyAOrQbf9NPfsgRllsjGVX5WFx4aqPzwW/5vqKDOl7CnM0w9RDbek9PMRf9hl69Jaah/AHLct6TY0TW4/tSQRD84lyWbAzjKXD6HzC+nx+LSz48xM8+L4ig5Ix4vfDwdNdwmSCwQGAlYDB1Cjymtc7VZ3L6zWCZJpq+pTwh8Qd01nyoQcMc3/yk0Xa4yUk2RS7j8Z9YeQHXM8OU4kvZECh8JzQZkDcqQoxhtUuCbbtEIXNprnswyZbuUsGH7JkcCwRvcbAuXXu+KfGA3lu/lQZGgCZ3iWa2sbovcrmQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a23bd14e-f587-4fba-92b7-08df15b310d3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 18:31:33.7021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xel3LgtdIu+VCGu4VMvToSGpcYUxJCFttcnvmy36OJ2ZpnSGGfF+mYu9w4LNcicPeFKtzdPvVlz/R0yBxpKrbZxwyqiM7QpU/YWTxBX7KxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7170
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


On 9/17/2026 1:10 PM, Matthew Brost wrote:
> On Fri, Sep 18, 2026 at 03:38:39AM +0800, Jagmeet Randhawa wrote:
>> A memory CAT error causes GuC to reset the offending context and notify
>> the driver. xe_guc_exec_queue_memory_cat_error_handler() treats this the
>> same as an engine reset and calls xe_guc_exec_queue_reset_trigger_cleanup(),
>> which sets EXEC_QUEUE_STATE_RESET.
>>
>> Roughly 200us later the TDR runs for the same queue. It reads
>> exec_queue_reset(), uses the result only to set err = -EIO, and then sends
>> a schedule disable (H2G SCHED_CONTEXT_MODE_SET) anyway. GuC has already
>> destroyed the context, so no SCHED_DONE is ever returned. The TDR then
>> waits out its HZ*5 timeout, reports "Schedule disable failed to respond"
>> and calls xe_gt_reset_async(), escalating a per-context failure into a
>> full GT reset that kills every context on the tile and reloads GuC.
>>
> There is a mode where a CAT error or GuC queue reset disables scheduling
> or tears down the context, but we do not enable that mode.
>
> I see there is a multi-queue related issue mentioned below, and it is
> certainly possible that we have a bug there. However, I'm fairly
> confident that this patch will break non-multi-queue flows.
>
> On my BMG system running drm-tip:
>
> On my BMG + drm-tip:
>
> cd /sys/kernel/debug/tracing/events/xe
> for f in xe_exec_queue*/enable; do
>      echo 1 > "$f"
> done
> cd -
> cd /sys/kernel/debug/tracing/events/xe
> for f in xe_sched_job_*/enable; do
>      echo 1 > "$f"
> done
> cd -
>
> root@DUT6235BMGFRD:mbrost# xe_exec_reset --r cat-error
> IGT-Version: 2.5-gaccf33cc6 (x86_64) (Linux: 7.3.0-rc3-xe+ x86_64)
> Using IGT_SRANDOM=1789675008 for randomisation
> Opened device: /dev/dri/card0
> Starting subtest: cat-error
> Subtest cat-error: SUCCESS (0.027s)
>
> The in ftrace:
>
>   38    kworker/u64:2-130     [012] .....   265.216703: xe_exec_queue_memory_cat_error: dev=0000:03:00.0, 0:0x1, gt=0, width=1, guc_id=2, guc_state=0x3, flags=0x0
>   39    kworker/u64:2-130     [012] .....   265.217326: xe_exec_queue_scheduling_disable: dev=0000:03:00.0, 0:0x1, gt=0, width=1, guc_id=2, guc_state=0x249, flags=0x0
>   40    kworker/u64:6-154     [011] .....   265.218858: xe_sched_job_free: dev=0000:03:00.0, fence=00000000ba06a299, seqno=4294967169, lrc_seqno=4294967169, gt=0, guc_id=3, batch_addr=0x0    000001a04a0, guc_state=0x3, flags=0x0, error=0
>   41    kworker/u64:4-134     [000] .....   265.219506: xe_exec_queue_reset: dev=0000:03:00.0, 0:0x1, gt=0, width=1, guc_id=2, guc_state=0x249, flags=0x0
>   42    kworker/u64:4-134     [000] .....   265.219507: xe_exec_queue_scheduling_done: dev=0000:03:00.0, 0:0x1, gt=0, width=1, guc_id=2, guc_state=0x249, flags=0x0
>   43    kworker/u64:2-130     [012] .....   265.219518: xe_sched_job_timedout: dev=0000:03:00.0, fence=00000000f8118031, seqno=4294967169, lrc_seqno=4294967169, gt=0, guc_id=2, batch_addr    =0x0000002a0000, guc_state=0x241, flags=0x0, error=0
>   44    kworker/u64:2-130     [012] .....   265.242149: xe_sched_job_set_error: dev=0000:03:00.0, fence=00000000f8118031, seqno=4294967169, lrc_seqno=4294967169, gt=0, guc_id=2, batch_add    r=0x0000002a0000, guc_state=0x241, flags=0x0, error=-5
>   45    kworker/u64:2-130     [012] .....   265.242154: xe_sched_job_free: dev=0000:03:00.0, fence=00000000f8118031, seqno=4294967169, lrc_seqno=4294967169, gt=0, guc_id=2, batch_addr=0x0    000002a0000, guc_state=0x241, flags=0x0, error=-5
>
> Lines 39, 43, 44, 45 are the TDR.
> Lines 38, 41, 42 are the G2H handlers.
>
> It isn't safe to signal a job's fences until scheduling has been
> disabled, as that is the point at which we know the queue is no longer
> accessing memory. A job's fence is what prevents the associated memory
> from being moved while the job may still be touching it.
>
> After you change, the above test takes ~4 to complete too.
>
> Please rethink this patch.
>
> Matt
  Thanks for the detailed review and for the BMG trace, let me revisit 
the logic. Please ignore this patch for now.

Thanks,
  Jagmeet
>
>> The failure is intermittent because the enclosing guard is
>> (exec_queue_enabled || exec_queue_pending_disable): it is a race between
>> the CAT error cleanup and the TDR. When cleanup wins the block is skipped
>> and recovery is clean; when the TDR wins the disable is sent and the
>> timeout fires.
>>
>> Skip the handshake entirely when the context has already been reset. The
>> send, the HZ*5 wait and the GT reset escalation all live in the same block,
>> so a single condition removes all three. err = -EIO is preserved so
>> userspace still receives the correct error, and execution falls through to
>> the normal cleanup path, which performs the deregistration.
>>
>> This matches existing behaviour elsewhere in the driver:
>> xe_guc_exec_queue_reset_handler() calls the same
>> xe_guc_exec_queue_reset_trigger_cleanup() and performs no disable
>> handshake at all. The TDR path was simply inconsistent with it.
>>
>> Evidence, captured with existing ftrace events only (no instrumentation):
>>
>>    Healthy acknowledgements take ~350us:
>>      4806.244755 xe_exec_queue_scheduling_enable  guc_id=2 guc_state=0x7
>>      4806.245126 xe_exec_queue_scheduling_done    guc_id=2 guc_state=0x7
>>
>>    The failure:
>>      4806.245395 xe_exec_queue_memory_cat_error   guc_id=2 guc_state=0x3
>>      4806.245592 xe_exec_queue_scheduling_disable guc_id=2 guc_state=0x249
>>                  <5.18s, no scheduling_done for any guc_id>
>>      4811.425872 xe_sched_job_timedout            guc_id=2 guc_state=0x200
>>
>>    guc_state=0x249 is REGISTERED|PENDING_DISABLE|RESET|BANNED. The RESET bit
>>    confirms the exec_queue_reset() branch was taken and the disable was sent
>>    regardless. scheduling_done never fires, so handle_sched_done() never runs
>>    and the acknowledgement genuinely never arrives.
>>
>>    With the fix, scheduling_disable is traced at guc_state=0x2d9
>>    (adds DESTROYED|KILLED), i.e. it now originates from
>>    disable_scheduling_deregister() on the normal cleanup path, and GuC
>>    acknowledges it every time.
>>
>> Testing:
>>    igt@xe_exec_reset@multi-queue-cancel               0/10 failures
>>                                                       (baseline 10/10 failures)
>>    igt@xe_exec_reset@multi-queue-cancel-on-secondary  passing
>>    Subtest runtime drops from ~5.2s to ~85ms.
>>
>> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index f3ba8abfc228..03450590042a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1609,14 +1609,20 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>   		atomic_or(DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG, &q->ban_reason);
>>   	set_exec_queue_banned(q);
>>   
>> +	/*
>> +	 * GuC already reset this context (the CAT error handler treats a CAT
>> +	 * error as an engine reset), so there is nothing left to disable and
>> +	 * SCHED_DONE will never arrive. Skip the handshake rather than waiting
>> +	 * HZ*5 and escalating to a full GT reset.
>> +	 */
>> +	if (exec_queue_reset(primary))
>> +		err = -EIO;
>> +
>>   	/* Kick job / queue off hardware */
>> -	if (!xe_device_is_in_reset(xe) && !wedged &&
>> +	if (!xe_device_is_in_reset(xe) && !wedged && !exec_queue_reset(primary) &&
>>   	    (exec_queue_enabled(primary) || exec_queue_pending_disable(primary))) {
>>   		int ret;
>>   
>> -		if (exec_queue_reset(primary))
>> -			err = -EIO;
>> -
>>   		if (xe_uc_fw_is_running(&guc->fw)) {
>>   			/*
>>   			 * Wait for any pending G2H to flush out before
>> -- 
>> 2.53.0
>>
