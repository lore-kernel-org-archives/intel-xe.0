Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A85C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 10:28:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4627010E6EF;
	Thu, 30 Nov 2023 10:28:28 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Thu, 30 Nov 2023 10:28:25 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDD110E6EC
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 10:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701340106; x=1732876106;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DLiiLkU/DO8kGPDiX9n+JqXmcCJzcWItKK6ZWzFRVkM=;
 b=ihe3BmU0OBjMNYCkVzDxN47KjWEwlbH+wFNp6lHKUbrWTTBdcyivw4Ln
 gLSMR54oSzCRkgDkqq6g1VlUx8TkGGcUJClEKWyIN5qVjD8XsDxEaotWT
 t8iHysNyRZJzLmmGsD2F04ryizEgxDV7P6GC8N8tlOO3rF5UYHGarNIyb
 Ae2RkzVOT5aHt+/cOgde5NFZ+G8x3uYzZWZAO9AsYg+eI3lmey1mnIqm2
 6UaRT24O5wxeBJyJTvKr8rci5rubv/TgMWvGpUgxC0ZUQCN540YIXRSD2
 RnqJlE2eM8Y39Dl5DzO10XAQhCSd7HdES5ZJseScf+ywIWnvAXh0vr3q3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="202576"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="202576"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 02:21:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="839754963"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="839754963"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 02:21:18 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 02:21:18 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 02:21:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 02:21:17 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 02:21:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1YIKcafgvM10t22aPv538YybU0iy7r9XAPb7yWXaL8S+ZFb3jYb4Lk2XfPjD0FR64OP5JaSVlVrUteUqYN11MD8wdY1ivIWRLAn8GY8OJe23tOtBSkDIahzehqH1igR/EUwGrDarXEBxwgD8tOpeVpHrIDEQ7zeh9UNcGm5WBRF+LsH0EA6by5dIPtKMLvSgAfwqXSkoJ+NXf2DcRBe1zanDcfbqwDMIx25rEkSsi9r3Pcj3wJEJvpHTcew0Gy38hSz+iTqhKROmj9akQH2GQ5Ai0YBe1tY4XBNve0yeqcY6dDmxYlGV8P3iJ8sEsU04a4kmvtyrfb/XQb4qlTF/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0u6LI94NhSW6Zdln3H0fjpROOZeJHtbUlB4xlPusnSk=;
 b=e6FEJXDKt2gqKHPUr6McoklaP1QyahS2huLV4UKB5qZBkCgbUzbbjCNYnGyUNT1YW0/bCzFsGQhXY84WgQWmOKgYFNdlqG4sYRTLwAYD8303YZPRdBv2fWHp+ocO9868GnbgeJESs7OCCW/6ymGIn4CJAF8MLl2GkIkDpZ7JnJNdFstRRW/VxfP2a/yV+clT4zH62bu2vSi2VHDoizJNdbANokUIgqXhypn3Wqn9jScZD7YdXIJo7ov/m8uGu7SQKJQcRCdsQYCEdviKixRJO0PSf0VapBCHmxikmIIiw6hNkKTZWs4VHb65SEJ21W+4tDKqwvnnAaeoEOXgFlM64Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW4PR11MB5774.namprd11.prod.outlook.com (2603:10b6:303:182::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 10:21:09 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 10:21:09 +0000
Message-ID: <320e1e01-2ab6-4675-be2a-fd1f9160b210@intel.com>
Date: Thu, 30 Nov 2023 15:51:02 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20231009062209.4009360-1-riana.tauro@intel.com>
 <7c044a59-be46-4945-961e-1fb42dc28d6a@intel.com>
 <ed0e85f6-5149-1c91-5af8-bb40ee7826de@intel.com>
 <236ff168-372d-f620-7b53-57d9cfcb10ed@intel.com>
 <CY5PR11MB6211880DE6240A91E01CF50F95CDA@CY5PR11MB6211.namprd11.prod.outlook.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <CY5PR11MB6211880DE6240A91E01CF50F95CDA@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0235.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW4PR11MB5774:EE_
X-MS-Office365-Filtering-Correlation-Id: 262400b9-8224-4b96-e5ff-08dbf18e11cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ojuDtyJlQzSaELBI6yhrdMiB1zukKh3QrejQYlIA5qep2rfZQ8XZGaurOG9SeOfjQbQ8gXTle1kEw9ixNRgQfi0oQEOunN423i6ZUifDL8hSg6PbeMh7ScXICyw3si3GlpCuV7X2sIQ+8SptAzDjQWSknBU0988iEz6VpbcS8Ar5k2u+XRXnS+vYlS2YeGkUquLJOpgfN7gYSwIfAgrYscCfn8zU3tT9w7KmWk0SIaeJIu6pwK5egpi798aDLcQsP5ozyWeXrkm2lVMCV20lE3WYHqsj0h6llsA0maS9j09xASDkUrIXYuaUwL9hQ6VKxa4ulB+A3JTfa/0vobar3gNE5kxVTl9cledEu7QitVRDZ+TQXPSZ73jN8ViJnijPODhxu3B8WX1QYauASVEtFpPoCgDPEh7+2uAvhkLZQJZceVm9TSI6M4GcFD2HLJwUOdehbM3ZnXD92VryCObDVFuLR7jYZWY+ecz+RoJcQt+MP1pJ8QlbloGdBIuGa79HYajyrRufzzVlf4zg5c51U6UxZylv4zfuyxCMGI5L9VYe+xxpLn8IAZPj3POl9qv+YxzlHeJ9OMXeC0hrOhHmpBvG1UaKYMPDzKfaCGw42q+7sPoyN3lj59siNJrQdSmYfMi2f0UBYiaTx64AZ2ETg1ABbOaWZlw10rlc25lX6TGL//wDwC4BLFZig9Buct8Z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(8676002)(8936002)(31696002)(36756003)(316002)(66946007)(66476007)(66556008)(110136005)(2906002)(41300700001)(44832011)(86362001)(5660300002)(26005)(83380400001)(82960400001)(31686004)(478600001)(6486002)(202311291699003)(6512007)(38100700002)(2616005)(6666004)(6506007)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajRleWVuT01CNE5ma2ppZGdNeXlybWNQeURRWC9oT1VZSTdmN3VRWHJoeXdk?=
 =?utf-8?B?eEVSaG1oeHZpYlRQNHRwYVNDMHpiYit2WHdKdFoxQU9SZVVBaDREa0NMM0hP?=
 =?utf-8?B?RE80dHdEZ3FCelpHSXdMUW0rajEzNzVmaDN5SHNIOWkxcHdpRytQMStMOVgw?=
 =?utf-8?B?bFlTK1FGV0pCVWJXcnFDTnk2QS96bW9pVEtmT3ZWQ2I5NDR1ZDkwTkIzbzNP?=
 =?utf-8?B?UDRRZnNReDJRUXFpQlRIS2RMcytVelVGVTBWclZEa2djMEZsUTZDL3FKa2tp?=
 =?utf-8?B?c2lVOHpIYS90dVJpOWM5SjNvMC94U1BjRGpBWUhXVmFmdTgyQjV0Y2xQaXQ1?=
 =?utf-8?B?Yk1XWjBqQm0yWW5UaGluSVhZeWp3OHkrTUFvaDloWGhReHM1RFozRm01QUM1?=
 =?utf-8?B?ck5Ca2xtdmoxa1VhaWxxaXZONkM2WFdLMXRKeEVCRVlGZkJqaXR3WDhDb0xI?=
 =?utf-8?B?TTIwQ0RhYXlwY21PVE9jbFo3RCtBelNLRTdMdkNTeE9HOWo2SnRNV05mNjg5?=
 =?utf-8?B?bDl2MUdTaDJWaHFFTmFRM01hd2Z0bC9PNG5pN3VQK1Fqdk81NFcwd3NzTXdB?=
 =?utf-8?B?L0RPMDAxWm5NbmllVDh2VFZxUjdWKzA1WlV4ZmZnM3ZWQk1SdW1QNWZWNytM?=
 =?utf-8?B?OG5mNDNsWS9hazdrS3IwZi9lc2VKZDV1WGhId0RwdlhxbVg5MExkd0FoWWtU?=
 =?utf-8?B?N0NOWHlZMm40b2kvWFF4NHBMb0t5bDRGVDdNWGowdXc4cXhPV0g0WUhUUktB?=
 =?utf-8?B?NlNVQll6UW9SbzBYK3hqeXMrR2F5dUpNaDRaTXlqbVU2WUlDRFVWaTd2WTMr?=
 =?utf-8?B?R0tDbStpLzdOd1RCOTBJUHpLU1NGeVl0Q3BrL3BaMUFpQU1Jd0lyU2VHSTlp?=
 =?utf-8?B?emlnTEllc1N0MFpQYkcvK3ZFUnlPRnpYTWxCM2NVS3JqUXVlbm9aNnRiaW5C?=
 =?utf-8?B?RGQ2WGVHakxNbGdEMk1lQ2hkNFAvdTVvSjBLRFl6Y0ZsM0RwaTdPMXFDV0JJ?=
 =?utf-8?B?S0VKSXNRWUZ0Q2JWQU9ZaWN5TmI1MnRVVmZUSmxHc1hlbFduM1pFSUNVSlY4?=
 =?utf-8?B?OE1mYk03aEwwRGMxQ1VNZHBOeTFzdkRUa2ZhMDVxUk5NdnNoZEcrTmVtMDI5?=
 =?utf-8?B?WkNweld4T291eGJ3VWxDdTVnS25waWxPZzR1MjVZMWRtQ3NTREROWVJhV3Nx?=
 =?utf-8?B?RVNxdEsvak9IeFNBaDU5QjA1OFVyWHpKMW1tS29yZzhmS2pJN0tvdHZQOEQw?=
 =?utf-8?B?MkxDRHBXZW5NQXB4Q0JLRDc3d2lwbWZxSVFGOHhMZWFwcFhveXRYRllRLzd3?=
 =?utf-8?B?UlorY2dzSDUzbThYbjVDb2JUVXd6TGxVV3NxNHcvQ1IrbFg4RHhLeTkvVnE4?=
 =?utf-8?B?bmFuUDRlZFlzS2Y2ZGd3VC9Fb21hcUdrS1V2WXU1aFc1NCtlNEx4NWRrVUJU?=
 =?utf-8?B?a3oya1luMHFMdS9YWVczTUlTeWVlTFlTZFFaeDBOZUt3Y0I1cVNaRnJ1ZEU2?=
 =?utf-8?B?UHNWNWZ4ckVjd0hjNmE5ZlhkcWEySVhqZjRER3JqRWZ3VVRmZkFkQllwV3ZD?=
 =?utf-8?B?dVdHcWJ4VGFEY0RiMDRCZ0RjQ2pPMmFXSm9najA4NHFhcnVUczNPTjJtTk1y?=
 =?utf-8?B?Z1c3VnlIblFQUWpLRkd6N0tUbFNQbEpGaGdxZ3hDRjZzV0YyNEtuaDNDbXFj?=
 =?utf-8?B?UmxIWm5jL0FURHVUcW1lSzgzam9sQXFmZ2p0dFRQVXV3Nm44WnUyc0lTamU3?=
 =?utf-8?B?ZUJFelFlWTg4K0JBSnBxeVM3ZS9QbDhpT21Ic01FUzZWcWhoMzlUR2xGK1ha?=
 =?utf-8?B?c1BkMGpsaFhwY0laZHNIYzFnQjM1aWQ3QU1KcUVwb1A0SjRvajJ2ZGIvZ0hW?=
 =?utf-8?B?VGpNSGlqdkNMSjJqeWZNYXpUaG5ZOTJaMFdIYm1QQWthamJuaDc3dUJDSkEx?=
 =?utf-8?B?ejc4anRrUkRGYllZRHdZSmdJMW9qMkNKM3lrdzFqY1cyY3grYzYxNDNoNmEv?=
 =?utf-8?B?OXhINERLK2swMTdVQll5dkQ4dG5IaitHZUdPZytaNkJpNEk2TC9IVzZkc0V5?=
 =?utf-8?B?UzhnaUsrcmo2cTh6dzVBRStNQ3RoN1pXYUxpQjUxbmNqZUZYNi9wWUozM2tF?=
 =?utf-8?Q?y6OkOSAues2oQ/8xY8kkMdXoU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 262400b9-8224-4b96-e5ff-08dbf18e11cf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 10:21:09.2788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: av+r1dq1SveidfoKkj1VqH0HvImPhOQClqLlIdjpas/d4E1izh8EpZJVgVR6MpRnsb116WRxKiCapM8uy45GeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5774
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] RFC drm/xe: Add mem_access_get in
 gem_create_ioctl
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

Hi Anshuman

Sorry for the late response.

On 10/10/2023 10:19 PM, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Riana
>> Tauro
>> Sent: Tuesday, October 10, 2023 11:13 AM
>> To: Nilawar, Badal <badal.nilawar@intel.com>; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>; intel-xe@lists.freedesktop.org
>> Subject: Re: [Intel-xe] [PATCH] RFC drm/xe: Add mem_access_get in
>> gem_create_ioctl
>>
>>
>>
>> On 10/10/2023 10:47 AM, Nilawar, Badal wrote:
>>>
>>>
>>> On 09-10-2023 14:08, Ghimiray, Himal Prasad wrote:
>>>> Hi Riana,
>>>>
>>>>
>>>> On 09-10-2023 11:52, Riana Tauro wrote:
>>>>> gem_create_ioctl does not have a mem_access_get till it reaches
>>>>> xe_bo_move.
>>>>>
>>>>> When the device is runtime suspended (in D3cold), new bo created as
>>>>> part of gem_create_ioctl steals the buddy block of the kernel
>>>>> objects that are yet to be restored as part of runtime resume
>>>>> (D3cold). The runtime resume triggers only in xe_bo_move. While
>>>>> trying to restore the kernel objects it finds the buddy block is not
>>>>> free.
>>>>> Tries to evict the new bo which is already locked causing a deadlock
>>>>>
>>>>> Prevent deadlock by taking mem_access get early in the ioctl

> We need to take the mem_acess wakeref only for object placed in vram.
> It does not make sense for integrated gfx, which does not supports d3cold.

The suggestion is to first attempt move all the 
xe_device_mem_access_get() further up in the hierarchy (like ioctl 
level). Any other call in the ioctl should be replaced with 
xe_device_mem_access_get_if_ongoing.

For now the changes are in gem_create_ioctl, but there might be other 
similar issues. I think having a dgfx check might be messy as it might 
cause many if/else statements
>>>>>
>>>>>      INFO: task kworker/1:1:44 blocked for more than 61 seconds.
>>>>>      "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
>>>>> message.
>>>>>      task:kworker/1:1     state:D stack:25272 pid:44 ppid:2
>>>>> flags:0x00004000
>>>>>      [  +0.008395] Workqueue: pm pm_runtime_work
>>>>>      [  +0.004068] Call Trace:
>>>>>      [  +0.002486]  <TASK>
>>>>>      [  +0.002161]  __schedule+0x6f5/0x1640
>>>>>      [  +0.003702]  ? __pfx___schedule+0x10/0x10
>>>>>      [  +0.004133]  ? __ww_mutex_lock.constprop.0+0xf4f/0x1e60
>>>>>      [  +0.005330]  schedule+0x92/0x120
>>>>>      ....
>>>>>      [  +0.003922]  ttm_bo_mem_space+0x46d/0x490 [ttm]
>>>>>      [  +0.004586]  xe_bo_restore_pinned+0x200/0x320 [xe]
>>>>>      [  +0.005007]  ? __pfx_xe_bo_restore_pinned+0x10/0x10 [xe]
>>>>>      [  +0.005503]  ? __pfx__printk+0x10/0x10
>>>>>      [  +0.003791]  ? __pfx_do_raw_spin_lock+0x10/0x10
>>>>>      [  +0.004597]  xe_bo_restore_kernel+0x2e4/0x470 [xe]
>>>>>      [  +0.005521]  xe_pm_runtime_resume+0x20a/0x750 [xe]
>>>>>      ....
>>>>>      INFO: task xe_mmap:1836 blocked for more than 61 seconds.
>>>>>      "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
>>>>> message.
>>>>>      task:xe_mmap   state:D stack:23600 pid:1836  ppid:1831
>>>>> flags:0x00004002
>>>>>      [  +0.008395] Call Trace:
>>>>>      [  +0.002486]  <TASK>
>>>>>      [  +0.003271]  rpm_resume+0x341/0xad0
>>>>>      [  +0.005269]  __pm_runtime_resume+0x53/0xc0
>>>>>      [  +0.004152]  xe_device_mem_access_get+0x2b/0x60 [xe]
>>>>>      [  +0.005172]  xe_bo_move+0x2ef/0x9f0 [xe]
>>>>>      [  +0.004131]  ttm_bo_handle_move_mem+0x15a/0x230 [ttm]
>>>>>
>>>>> Link:https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/256
>>>>>
>>>>> Cc: Matthew Auld<matthew.auld@intel.com>
>>>>> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_bo.c | 22 +++++++++++++++++-----
>>>>>    1 file changed, 17 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>>>> index 61789c0e88fb..e453a5264c82 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_bo.cxe_device_mem_access_get @@ -
>> 630,6
>>>>> +630,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo,
>>>>> bool evict,
>>>>>        bool tt_has_data;
>>>>>        bool needs_clear;
>>>>>        int ret = 0;
>>>>> +    bool device_awake;
>>>>>        /* Bo creation path, moving to system or TT. No clearing
>>>>> required. */
>>>>>        if (!old_mem && ttm) {
>>>>> @@ -712,7 +713,8 @@ static int xe_bo_move(struct ttm_buffer_object
>>>>> *ttm_bo, bool evict,
>>>>>        xe_tile_assert(tile, tile->migrate);
>>>>>        trace_xe_bo_move(bo);
>>>>> -    xe_device_mem_access_get(xe);
>>>>> +
>>>>> +    device_awake = xe_device_mem_access_get_if_ongoing(xe);
>>>>
>>>> IIRC xe_bo_move is called in eviction path too. Won't it be safe to
>>>> use xe_device_mem_access_get here too ?
>>>
>>> Agreed, xe_bo_move is being called from ttm_bo_handle_move_mem which
>>> is again called from multiple places. To cover those places its better
>>> to keep xe_device_mem_access_get.
>>>
>>> Regards,
>>> Badal
>> Hi Himal/Badal
>>
>> I spoke to Matt Auld offline and his suggestion was to remove it from
>> bo_move or should be ongoing if mem_access_get is added early in the ioctl
>>
>> Removed it and ran the BAT ,saw an error while running
>> xe_live_ktest@dmabuf.
>>
>> [  +0.007142] Call Trace:
>> [  +0.002465]  <TASK>
>> [  +0.002120]  ? __warn+0xa5/0x200
>> [  +0.003253]  ? xe_device_assert_mem_access+0x17/0x20 [xe]
>> ---
>> [  +0.005573]  xe_bo_move+0x254/0x1480 [xe] [  +0.004184]  ?
>> dma_resv_reserve_fences+0x23e/0x4a0
>> ---
>> [  +0.003764]  xe_bo_create+0x20/0xd0 [xe] [  +0.004109]
>> dma_buf_run_device+0x159/0x610 [xe]
>>
>> So i replaced it with ongoing.
> Probably we need to test the eviction use case and check the device mem_access.ref count to validate any probability  of zero.

Ran eviction tests locally. Didn't see a failure. Will send out a new 
RFC rev to get the CI results

Thanks
Riana
> Thanks,
> Anshuman.
>>
>>
>> I did not see any failures in evict tests from BAT.
> 
>>
>>
>> Thanks
>> Riana
>>
>>>>
>>>> BR
>>>>
>>>> Himal
>>>>
>>>>>        if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
>>>>>            /*
>>>>> @@ -735,7 +737,8 @@ static int xe_bo_move(struct ttm_buffer_object
>>>>> *ttm_bo, bool evict,
>>>>>                    if (XE_WARN_ON(new_mem->start ==
>>>>> XE_BO_INVALID_OFFSET)) {
>>>>>                        ret = -EINVAL;
>>>>> -                    xe_device_mem_access_put(xe);
>>>>> +                    if (device_awake)
>>>>> +                        xe_device_mem_access_put(xe);
>>>>>                        goto out;
>>>>>                    }
>>>>> @@ -753,7 +756,8 @@ static int xe_bo_move(struct ttm_buffer_object
>>>>> *ttm_bo, bool evict,
>>>>>                            bo, bo, old_mem, new_mem);
>>>>>            if (IS_ERR(fence)) {
>>>>>                ret = PTR_ERR(fence);
>>>>> -            xe_device_mem_access_put(xe);
>>>>> +            if (device_awake)
>>>>> +                xe_device_mem_access_put(xe);
>>>>>                goto out;
>>>>>            }
>>>>>            if (!move_lacks_source) {
>>>>> @@ -778,10 +782,12 @@ static int xe_bo_move(struct
>> ttm_buffer_object
>>>>> *ttm_bo, bool evict,
>>>>>            dma_fence_put(fence);
>>>>>        }
>>>>> -    xe_device_mem_access_put(xe);
>>>>> +    if (device_awake)
>>>>> +        xe_device_mem_access_put(xe);
>>>>>        trace_printk("new_mem->mem_type=%d\n", new_mem->mem_type);
>>>>>    out:
>>>>> +
>>>>>        return ret;
>>>>>    }
>>>>> @@ -1810,13 +1816,17 @@ int xe_gem_create_ioctl(struct drm_device
>>>>> *dev, void *data,
>>>>>            bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
>>>>>        }
>>>>> +    xe_device_mem_access_get(xe);
>>>>>        if (args->vm_id) {
>>>>>            vm = xe_vm_lookup(xef, args->vm_id);
>>>>> -        if (XE_IOCTL_DBG(xe, !vm))
>>>>> +        if (XE_IOCTL_DBG(xe, !vm)) {
>>>>> +            xe_device_mem_access_put(xe);
>>>>>                return -ENOENT;
>>>>> +        }
>>>>>            err = xe_vm_lock(vm, true);
>>>>>            if (err) {
>>>>>                xe_vm_put(vm);
>>>>> +            xe_device_mem_access_put(xe);
>>>>>                return err;
>>>>>            }
>>>>>        }
>>>>> @@ -1845,6 +1855,8 @@ int xe_gem_create_ioctl(struct drm_device
>>>>> *dev, void *data,
>>>>>            xe_vm_unlock(vm);
>>>>>            xe_vm_put(vm);
>>>>>        }
>>>>> +
>>>>> +    xe_device_mem_access_put(xe);
>>>>>        return err;
>>>>>    }
