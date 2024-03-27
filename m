Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B656AC54E67
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 16:48:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD5F10FE3F;
	Wed, 27 Mar 2024 16:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VC1FTg+H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C30510FE40
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 16:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711558132; x=1743094132;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cB6rJwiutV3BFScm9OsYgCncsGWBbtAiD4LZm/BspVk=;
 b=VC1FTg+HO4H2a6mHZj1XRwQs0vRSCohLv4D+sAV/uQrfp38qjL+xsbXo
 gMXipHXNnCXalMJUp4Ju+rRF019IOPT56293ZPayPHNEjchLLF+PrGO+W
 jtD6xmktns/eJmc4Npyv1Gid+QtEMGEYeOY7SsTjRsejCU7i5b4LetoFN
 7SJElaP8yjTDav8JA+Eekz81otYJEcnk/ax6vyaLfh4AqUr5YblNRZQhg
 2eqVTYcZad7uD18OCy19Fw/cJ2seyw44Wr1Bx+YWQTaAqlHvfhkvtVvvr
 TWBemS0FF9YsDMb+6gteXUVvpLBTvWO3IkrEjnusfbfLsAvpPuSH8M2S/ A==;
X-CSE-ConnectionGUID: 63o8ouwsQ+2gj5Pkvkgirg==
X-CSE-MsgGUID: VdtGnhE0TWuVuc8VtAkr8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6567622"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="6567622"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:48:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="16369187"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2024 09:48:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 09:48:50 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 09:48:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 09:48:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 09:48:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fj1uHyQ/utu9qsgsEbuZjRtC/QLqTGavPfnlYHSPZD3KD4YEtHUZiHwM/pnnx3IT/6ml+aAeDWNr+xqeFjXDvCNxr+RfnVpql76/ooVZjVc53C/s4lubMaJ8keN6e0l8pyHmE0B/nu5fGdktBu4YDUuQWVa/vLJWUXp0t8obh6FHO5JAtKoX0K5JNB8sEefXeULkWcCHQUhAICUxCoFTocdiMxzd1IfKHGQKll3UVkCf0p/ki3FiqwjurRDc1OFRMsEOp9RPb/gMv58hl1Jch/KyT551VbbH/fLVxihRn0MDw/r7ZXSMqTQ5tjMPhxPC5/Lz1yfYQUJxDuWD4lF2Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RAoG4269AW7OhjH08SCfywVWrWsQqSPKlTI72ZcXF3M=;
 b=XaeyLqn3OGRqj1J0FTCJU/eRyPhidRwowkcE885C9mCMjEFggkbWYuEkgrTHJcJUod/IvPzMoD7Scf00FrIG8AAlGPm96MjhXbTfQhKTRGRd8Gi9HmoxFuVRbnKreRqOlzzv0eXm1o0IT2+Ve4SWKFGoJvgQsr45XvMzmW4vOllTwYiKIkhRl1le3YK+IKY10mmFMMd0/d78WBeNf5wtC/jquDh+bcVH9ST8m0BpyH952fSpBF/NEYkYG1yB4U6JpQiRo41cFi+jhM/biUD6KMoq7okXE2/zjWfAL/nQK3hAOzqTqk8WnNvWqL3YJK+6uD6GdYLcAlku3hpkJYN/KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 IA1PR11MB6242.namprd11.prod.outlook.com (2603:10b6:208:3e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 16:48:46 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7409.031; Wed, 27 Mar 2024
 16:48:46 +0000
Message-ID: <98ce5b38-e6c9-4a1d-ae3e-80f81669c9b7@intel.com>
Date: Wed, 27 Mar 2024 17:48:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Create a helper function to init job's user
 fence
To: Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das
 <nirmoy.das@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
References: <20240321161142.4954-1-nirmoy.das@intel.com>
 <vgkvzpqwyku2q5lomqvytpeuz7hvybykd4rnetzkgy3siy3c57@jclsubzhsmts>
 <8c521ff9-950f-480e-911b-9c6210ff6416@linux.intel.com>
 <p5orrg525ipnqq4xuj5pymekfcoisfqmmm53hxugtiiiz2g2vv@mrp7nupohvd5>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <p5orrg525ipnqq4xuj5pymekfcoisfqmmm53hxugtiiiz2g2vv@mrp7nupohvd5>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0197.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::22) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|IA1PR11MB6242:EE_
X-MS-Office365-Filtering-Correlation-Id: efa616f8-6d95-4561-f919-08dc4e7dc51d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8NYnHhSO/MC5R7dwDlMSmSE6mi5JisUFetbKkqTVib3UgWDsYNlVfcXlSMnOeP0iJOXXGgd0EUniHH23WTkv5iLwv1MYxbkIJX0cl2K2tLGBfNJ9LKAPdCn4IKSkEPIJGH9uFk40+7By/3LzkrzsDpFzxR16l6p8z/rjkdooLw4s3VsjmY5ERcyrXB0qxAViX833peMT+PsAw5Ajf2+Ra+Z8oKR/vPQTt+i3IdosafGv4NLezs7deMAe8y52rYf+r64Nj+dxnIgA7q0i6Cn5yA4yqvVgIxQ2yjWTgN3w1pVYWgOo8StSMzOYzIXaLLL5EO01EA91BWor0JLjvRq/zhFWnPpVP+wvX0z6ndDPnIlfQ7NWL1DsbHBzXmNd1xBNnRvj/keLEPj2v/UffBXsgACiZXg6WSoFm/Ucu6j45uuirXPzx3mfYEBi3mgZw6M3B0DzJF1eX+VGnTua7MJU4S44C8lFSx6h5yVaYiRYGnYNjKEmKfHtGn3IEDhRAcNs351V6srbQ1+3E73pcNbqAf3DuPXnSyXdywNaDoU1I7HEfrWl6HInInjBbvPSlVaV3cZJ5q/FYGOxGyjF0rDg+eiSUlfsEwnkR41RfyZnxUjdmR8IhDPvT9WliLlF0vVU9SzZcVJgju49fndO3WR2ikOeKSCgRjdqAaqTbcqmbow=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWRXUHlNYjZ4c0JpUTZYbVk0YWQ4eTdVTWZ6T09pTC80NWgxNGNZNUJXK2w1?=
 =?utf-8?B?MkFHQlF3UnZ2TUVhZDVxVlJFL1dnekljQ2s4eGphYUlJUUd6Tjc1eUorTTRl?=
 =?utf-8?B?MUNWc0pTcU5WMnRsTy9pMklnV3ZhMEkyWHZiV2daT0p6OGlTVXA4dlU3a3Fi?=
 =?utf-8?B?YmZobFp0dzdzVzRJcUFXV0I5VFNmM0RoNUJsclZEbVVWTWlmMEM4cUF2SVJq?=
 =?utf-8?B?V2o5bTBzZlk4NHRyU2xKTzdoYmhtcW5zQ2FvYW9xZTNFR0hteXBnQlJ3Rndj?=
 =?utf-8?B?WkI1YksxTk9YR1dIdjNtVWlqU1JFOFQxRVNOYjErdVE2REtyTmpFNk1mZU9B?=
 =?utf-8?B?UkttY09oQnJFNGx4NmFsRVZ6VDdZSUpMckpJYVlycU1jRGVxTW1YQnp3MDQ5?=
 =?utf-8?B?WEZESm1aWlBzMDg1MHJBZS9YVHh1NEVpb1h5L2hDSktlV3QvWVBwRW1LYi9C?=
 =?utf-8?B?ck16Yml3aERVZ2VlYUxnSnZsdkNXT1V6U0tBL1QwL3NTTGFwQnN1bENqMXZv?=
 =?utf-8?B?R2dDUW9mUHdpNEs3M3hCVGoyc1dQRHJEU0s1cWVseld1UnIrZFBNdFZ4bzFZ?=
 =?utf-8?B?QytGSDhpU0JMMEN1OEJIWW0zczBzQmdNY3dHb01YRy9ZUjdFNUQxcVVDT3E1?=
 =?utf-8?B?WEJaeUtNakJZS25hYzRHZEFHVTFwK3dNRmVwWWxDbzljR1pzbXdvN3BkT0U2?=
 =?utf-8?B?ZWJrQTV5Vlk3Rm5QaElOY0xWcDhTL0ZaR2prSDJjRGtYN0Vqbm9WRXlxN3JW?=
 =?utf-8?B?aWp4ak9HbEc0VjMrL1ZNMVZxaVNHMFVFYUhYU3pGSEhmRTdjc2FmQVpHQWhL?=
 =?utf-8?B?SGR0b0NjZllHYnRQbnRZM1dRVmZGYjMrRnJadE9adzQrZEFrSUFPRysyOVY2?=
 =?utf-8?B?VzlDTFZjTVQzUHl1ZDBic3E1OVZHYnZJM2wvNDVUU0p5SmppelpuQWgrU2l0?=
 =?utf-8?B?VmdEelQ3TWl1YUhQQW9DM2NkM3cvOW5yMXAzR1BLVXcyN0RYNTErdlRLVElW?=
 =?utf-8?B?eG1RUDBtV2ZRQkg1c3NET2lPSFF0ZHFzM2pXSlZJV2xJdzQvUVZ0RjkwTERF?=
 =?utf-8?B?SWZsdEdlbHZwdWtYS0FVcG5VcnNuMlBpMk1vY1VJeFc0ekRHY0c1ZURRQkxG?=
 =?utf-8?B?MTNXQ0htQmZRV2Zpcm5WY3BuY2lQUVNMeW9nVnN3eDRRdUhsZnBXRk9WS0RG?=
 =?utf-8?B?Y1RvWlBqNWFxNUpxN1VaL3hhdjJ4V0NjSnNrWkxzZk4rSFAvUzhQRHJFa3M0?=
 =?utf-8?B?ckUvRUd4S1BoeG41V0RsZ3piRmRuNVIyK2JzYmdjWTVnUlMveW5mUFhGb3E3?=
 =?utf-8?B?cFBYN0JkN2VXdnZ2ek5IdTZvSVFidVZDb0xIUjUxTURjQVgrRjM4WDlrWnVK?=
 =?utf-8?B?aHdqZklPdFVPSit5c0FVWUtHOVQ4MmtoeUNIZStndHRNM0hlbk1mRk5zdmtU?=
 =?utf-8?B?d0N6UUlUTitBNlNMdmYyWGFPa0NmQlVPeG1wQlIyLzN2L0VaK2dQemVGTTk2?=
 =?utf-8?B?SnAvZ3VXZFVSTWRWbTAzTmIyMHpKc1BkVW5mSGdsemE5aWZhTGNPWmNTK2E5?=
 =?utf-8?B?d1A4MUt6OFVZT09xek9jSjZYcDFEQWt1WTRBVTlsZi9jUjNJbURDTGhFR0hU?=
 =?utf-8?B?RFdtOW84MXRnT2xrcjhyeGtTWGs1cFB1amVMZmlVL1pablVqUVdsZE1RVmI2?=
 =?utf-8?B?WmJueVBjQUtSNDZTS2ZrU1g0OThoc2NwY2VCeG9MSDVBTGZVMWxTcGtmUHF4?=
 =?utf-8?B?cnI3TkFKRkpCSEVQaHdMVkFSc1ZOdjNTTmxrNHRqMXVkRUxIY0FaTklCVUtU?=
 =?utf-8?B?dHloeXROT21VNHFWdXJtWUkvc0xPUitHQTdLUEVNa2JoSHo2MG1RUkxhcHRk?=
 =?utf-8?B?UExvUnFteEZiYi9vdmEySTh3OE9GTTZCZkxtSWo3ZkI3V1AwUEdlTVJkYjAr?=
 =?utf-8?B?RWpSeTkvRGhvQWJVWHJ2d291cGFsQjZodGQ0dUVYS0lOWDZDOTRiYXd3d3NJ?=
 =?utf-8?B?dDJBYWFmUlZ1N1JHekZoWUtOT2VvU0lOcTZ4Tko5MzJNZFV1SWZqYjh0eWdS?=
 =?utf-8?B?ZUZOTStqZzY1QkV4bGdGTU1YTzBkb3hFZmFUc0xiOUZoaDEvWlJ2bFI3SXZ1?=
 =?utf-8?Q?rwtGPm6ZWCzV50Hn//PRYMgrZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efa616f8-6d95-4561-f919-08dc4e7dc51d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 16:48:46.6763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7pqnIC0khrDsQ7uqpUxRQelYIrmy3TgvU46fl+17s0Oeme+7qdbRioB+VrU3s6icxO4dbBrY0PjyP5qYyNbhgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6242
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


On 3/26/2024 11:56 PM, Lucas De Marchi wrote:
> On Mon, Mar 25, 2024 at 09:54:31PM +0100, Nirmoy Das wrote:
>> Hi Lucas,
>>
>> On 3/22/2024 5:11 PM, Lucas De Marchi wrote:
>>> On Thu, Mar 21, 2024 at 05:11:42PM +0100, Nirmoy Das wrote:
>>>> Refactor xe_sync_entry_signal so it doesn't have to
>>>> modify xe_sched_job struct instead create a new helper function
>>>> to set user fence values for a job.
>>>>
>>>> v2: Move the sync type check to xe_sched_job_init_user_fence(Lucas)
>>>>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/xe_exec.c      |  9 +++++----
>>>> drivers/gpu/drm/xe/xe_sched_job.c | 18 ++++++++++++++++++
>>>> drivers/gpu/drm/xe/xe_sched_job.h |  3 +++
>>>> drivers/gpu/drm/xe/xe_sync.c      |  7 +------
>>>> drivers/gpu/drm/xe/xe_sync.h      |  1 -
>>>> drivers/gpu/drm/xe/xe_vm.c        | 10 +++++-----
>>>> 6 files changed, 32 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_exec.c 
>>>> b/drivers/gpu/drm/xe/xe_exec.c
>>>> index 7692ebfe7d47..9d53ef8c49cc 100644
>>>> --- a/drivers/gpu/drm/xe/xe_exec.c
>>>> +++ b/drivers/gpu/drm/xe/xe_exec.c
>>>> @@ -249,7 +249,7 @@ int xe_exec_ioctl(struct drm_device *dev, void 
>>>> *data, struct drm_file *file)
>>>>                 goto err_unlock_list;
>>>>             }
>>>>             for (i = 0; i < num_syncs; i++)
>>>> -                xe_sync_entry_signal(&syncs[i], NULL, fence);
>>>> +                xe_sync_entry_signal(&syncs[i], fence);
>>>>             xe_exec_queue_last_fence_set(q, vm, fence);
>>>>             dma_fence_put(fence);
>>>>         }
>>>> @@ -359,9 +359,10 @@ int xe_exec_ioctl(struct drm_device *dev, void 
>>>> *data, struct drm_file *file)
>>>>         drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, 
>>>> &job->drm.s_fence->finished,
>>>>                      DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_WRITE);
>>>>
>>>> -    for (i = 0; i < num_syncs; i++)
>>>> -        xe_sync_entry_signal(&syncs[i], job,
>>>> - &job->drm.s_fence->finished);
>>>> +    for (i = 0; i < num_syncs; i++) {
>>>> +        xe_sync_entry_signal(&syncs[i], &job->drm.s_fence->finished);
>>>> +        xe_sched_job_init_user_fence(job, &syncs[i]);
>>>> +    }
>>>>
>>>>     if (xe_exec_queue_is_lr(q))
>>>>         q->ring_ops->emit_job(job);
>>>> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c 
>>>> b/drivers/gpu/drm/xe/xe_sched_job.c
>>>> index 8151ddafb940..bfbce9b69087 100644
>>>> --- a/drivers/gpu/drm/xe/xe_sched_job.c
>>>> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
>>>> @@ -5,6 +5,7 @@
>>>>
>>>> #include "xe_sched_job.h"
>>>>
>>>> +#include <drm/xe_drm.h>
>>>> #include <linux/dma-fence-array.h>
>>>> #include <linux/slab.h>
>>>>
>>>> @@ -17,6 +18,7 @@
>>>> #include "xe_macros.h"
>>>> #include "xe_trace.h"
>>>> #include "xe_vm.h"
>>>> +#include "xe_sync_types.h"
>>>
>>> wrong placement, otherwise lgtm
>>>
>>> Feel free to carry by Reviewed-by: Lucas De Marchi 
>>> <lucas.demarchi@intel.com>
>>> with that fixed.
>>
>> Could you please help me merge this patch.  I am having issue with my 
>> dev machine which I use to merge patches.
>
> Applied to drm-xe-next, thanks!
>
> [1/1] drm/xe: Create a helper function to init job's user fence
>       commit: 5dffaa1bb94a6bc75393476fbe3c8a704ff4fcf8

Thanks a lot!

Nirmoy

>
> Best regards,
