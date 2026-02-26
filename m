Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8294FD8FE4
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 17:26:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C19110E9DA;
	Thu, 26 Feb 2026 17:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ez5323Ge";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F8B10E9DA
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 17:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772126797; x=1803662797;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MhF7VqgpvqoQ+ixGbth7vjp5YhMWjn4sBiwokAHAfBw=;
 b=ez5323GeAntVhw0c2LmJ169WEFlHo+PXCk20DUC5UOAApDQLXzl+bpM8
 kblSGYLZjXPUHS9Ifo2mgBvJWocbuBGV6ABDy8rawAlEj4igAyHeb1Fd+
 qv82bd4swn29nI1ukwN/25Cjy7wkuVdDvkbhn5JJNXPPY5owim7ibh/RE
 f6SX9NxouYmY6wm6tVqDcMyckiStCqRSgX4Fn0PVg71WxfL3P1+QIcZhR
 CiWZgk0xWxoJrzXpmkx5Fu8QUg74EEzpaBmtydnd6nudtUOd+P7BCkdU1
 Uk01O0MQaDj2XgOONXy8bW4Sr5I57u0m1dPQGIz8a+cSdOzdQsXrXFBcd A==;
X-CSE-ConnectionGUID: mKH+3EKPTp2h0s0O84BaCQ==
X-CSE-MsgGUID: ay3Jng4tSFm9wNXCyUcMEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="75798079"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="75798079"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 09:26:36 -0800
X-CSE-ConnectionGUID: jAjrj1jISHW760BlWOaPYA==
X-CSE-MsgGUID: 9K6lgafFSS6xdFBTFCsYdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="239620202"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 09:26:36 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 09:26:35 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 09:26:35 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 09:26:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COSnWcbNol84KZJlW3OxPEJZJuAYLzFQ4TwS2XYsUEHcSTTdms9PZoL5y3oRt2UIQq0dpHlSsyEx6FuAJS3C0m6JPYPSNm0Ae9kOstuAknGqKnG+9nunDY8ngM2YsL4vdl/JH1ULCuQFqParXdw5nY4X7f6Bk74+gp0n+G4FVCqFY1SJBtHT2R2Wu8Jd5VRU2H6Hq6tFQQrB8vqDYgUsB/Jqo7C+Q8nstVwCvTB+2bWWPlzQneJD/RLAnXbSq31M4wgHf1+KJf6IBAcmLwLJyfhpz67Inlw/lNTdQDZdg7oD0DY8x8gmp2/ofH55kO5lqkYGAg1+voRAf95WlTlzRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KM6me/8VpItfjLRYqsjznErAZAZRexfFbia3QwUpqRA=;
 b=lS/ApWD25S38IyHaa4uusAj2mdrmR6dMw+RIDOhbFC+SwCz3Zeo9j4CEBU+exxI4fp8hwqAFyxfwvnrvdMA2DP9UHQFzyaUenrQeHeEYardERWGctN8pdxTyedrPwwsLtx7yO3nyR2jADlukmqd+My9vEiWJBgsfCjmsEBunpV84MOYnrgAc2VzkLwM5YL9PJK2H73Set3j9xynpy9Tc5Q/RPFJ3Fnc6WnD2SQqHdm5sk9Tg42nZon+BRF5WeD1gxlMeK+vsvzbcrawx9aspHFLYaNNOQwJ2D/YTjBsuhfbZJ8ux1y1pKgO9dx1mKMD4aw68sGKIBP2bimxKSSWgGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by CH3PR11MB8750.namprd11.prod.outlook.com (2603:10b6:610:1c7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 17:26:33 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 17:26:33 +0000
Message-ID: <906b9ee5-2bc8-4b38-a9ec-3e8993a6f015@intel.com>
Date: Thu, 26 Feb 2026 18:26:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/xe/queue: Wrappers for setting and getting LRC
 references
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>
References: <20260225235447.2772383-1-tomasz.lis@intel.com>
 <20260225235447.2772383-3-tomasz.lis@intel.com>
 <aZ+k/Fd6wZ48czIy@lstrano-desk.jf.intel.com>
 <aZ+ocKctwftPBcbn@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <aZ+ocKctwftPBcbn@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P195CA0078.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::31) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|CH3PR11MB8750:EE_
X-MS-Office365-Filtering-Correlation-Id: 487159e5-729c-45af-6aa3-08de755c2fd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: ioy/G1/Ae8NU01Kcylh2b3uJ1lNEVN9c7ZgC9MVW6t85G1C0r+1XHl69FzimG4BZV/tCL0noHx5dAOKMhQj1ax/MWNShnXszefJszadtj05+IbYP0B3M83H2OUiKUSVb1S2e5k3g4ctX1apAJNeWC0NV/qsqdIw1a/wbjo3pQkKUp/0DnYJKje3Ljn88RP3fHjOVjuL2JQeDxQ+cyq2NDVQc0XFwM+GfmRVlOiJZ6l1XXh+JcSd2bMd5mCwzuLdNzyD8AusIHNhraMB4JQYiqDL5t3T4ZnRaoaxZJyziuZCUcJWjfJyHAM3Vs/eBG7iNJVvpnHKNLVE33LI83i4zNrtM+Co5AeSdMQoiaLoAYGYuJncMu+frOhvZ0/5vEIah+KD6aWJkBXvO3HtnLXfzr05M7cuNSHDpfk8Avt9bwxITM1r1jzTbRF9buRK4lnrvcqYd044bGc2/TYaT3piTYVqlQh6HWjw+X+u5W4nQoBaJ3olblrgwILrcGayglZ2NJbSYk50bc2nQo0WyM/aAuGKmShoE+AKvuwPFQ0xn9lIvW3VvCA24iFJC4s9fYmjAOYEmhBTcQaoVa/kgWmBMsjalI1F8oFrOIxXD30hn6pvZIXmGKvWyRMJU+ql8G/8pRYXuJPm/UKxEGuYAJCSrCZVCSwkPt+XSDGpxyJJ8hD0djBm7doazuY8PCZWLwM9KAMqmx1zthrJtcWmyZdyvrFuWEnHXbDVdK3QR5xy3kQY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVVMcThoM2lTc2dSVmZNZy9VRC83aStsMU5FaG5rZHZweVlzcVlMVlpyVkNN?=
 =?utf-8?B?eXpXaWFvNzBWSnVKaG92UnBrU0FhbHcyMndQNUhPK0tJMUhxa05WY2RtbkVp?=
 =?utf-8?B?bW8zdEpmUUtmdzRiTFVoRytRSnBPc1VVRFFqdGdBQ21XM1cvVFdLMnd1U0Zr?=
 =?utf-8?B?blQ3UmdSWmhueVI3M3puME02MjBQeVIzYURIZjRFakZYekVSQ2RUbW1nY1RQ?=
 =?utf-8?B?TWh2Y2tCUFFBb000NFhQb21TUUJoUDdOeEpZcEMwYnZBYmR2QXdRbzR1Tldh?=
 =?utf-8?B?Mm9CTUxUVXZDV0pLTVBoWlJ0dVhocExjVCtab29zdlp5Mys1bURmMWFvZEZ1?=
 =?utf-8?B?NHNISzZRNW02MEZRYWNLbzhINCtGR3ducis0NkdFNkVzeE9sMm5LZWdIS2FJ?=
 =?utf-8?B?ZzR6NnQ4Q0tiR2c3QjVTS0IxZFRBbFI0UC83WU95Q3VMZmJpWi9rV2pMOVkw?=
 =?utf-8?B?V3QzZnVEMHFzRGxkR2hqUnRJUWl6VG1GL3ppRXh0TmlhWE9pTXl3WndPUkxj?=
 =?utf-8?B?VkYxSUxpRFFSUVRTY0RWSTA3akpLVXpVazUyMnBjQWFManlFTVEySnJYVnR2?=
 =?utf-8?B?MVJGb0RRM3RUZkxNNm0yczM0VlF2eU82OVA2RHY0NnlpWVVJRGVGbFk0d3JU?=
 =?utf-8?B?VHJQZUJEOGFlUStJd0dyRnJuVTJJbWF1TFUveHlCMFptbjhYYmhST3N4Zmcv?=
 =?utf-8?B?cjJzOGJSS1VmSFV2bUxxQTBSK3JTanN3V1RNY0NlVkp5YzFyODRQcEtVWlVu?=
 =?utf-8?B?b0t1RG5xTVc1Q0c1clpYWGlxbTZIRXFIaFp4RDlwc1R3YWJjdWhiS1BjOXc5?=
 =?utf-8?B?OUEyU2ZlUzhwbWZUdzJuUkpYaHcxZ1pZZUllY2pyWG1LTDB4YzdSYlVmb0Jy?=
 =?utf-8?B?K3k2ejJrd3dnOXVHQkNMdVNSa1VHSHFjRnBWK0kzVWd4VXd0eS9RbUZaejdI?=
 =?utf-8?B?S2FBT2Rhb2tZVlhKRjZReFIzL1hPVkdoVjA0NmhORnQ0OS9TaTREVWZ1U1Ev?=
 =?utf-8?B?UnhzKzJpWlBrOUxwUzIwR0oxVjBjNE5IdEFkV2dLZWpaYVNpVEx0TXI1WmZC?=
 =?utf-8?B?OHprL0lBMlpKdFZUbTNkV2d6MnY0NFJoZExUcGlqYUJ2S0ovNW50aVMxdzM1?=
 =?utf-8?B?N3lZM0lZblA5YUYzRWRwQVNmYVdGMnljc3VQcXRydG40ZVlSYWYyMHVZS0VL?=
 =?utf-8?B?N2hpSDkvbmNwM1hqcVR4MDVFWURrOExtVXFDVW9RaFIveVFnVzNnbWtUdk5Q?=
 =?utf-8?B?TjVCOGlLcGtwaUFmWmk1Z0UzTUtWYUp5VG54djhZUGhwQ25iNzlNZ0QxaDA5?=
 =?utf-8?B?WW5VcHdSbTBnQWZNKy82WlMyWEFsNXFqdHYwOXRmL05WZnN5WGZkNFYzYXd5?=
 =?utf-8?B?aEVYNGxRUkpveVlud3o1SGJzSWFhenQ3V0FRYmpwTW1XYy9SNW9SWFdPMmZJ?=
 =?utf-8?B?K2RtNW1OdklaODNPaktSbHd2MHlYZkY3c0dEU0hPdmNSY1d1ZVFQVXZlSlRo?=
 =?utf-8?B?ZDF5OEVESWJadU8xR09nYWNZQVVDa014d2dqVWhOWFViUDBua25yakZDYmJK?=
 =?utf-8?B?bWJhK0M2aFNqZzFPalFwK2hzZnZhcGJNVEk3NTB6bFNYUTVyeFhETzNMc05C?=
 =?utf-8?B?bWhsWXZkdTFNeUhMYmROZWVBbkNFZjNMTXdjZDFkOXk2VzZLQm5rNG9KV0NM?=
 =?utf-8?B?d1dhMDRHejYydWQ2YURzbzl5ei82SHJaam1ML1UvWnU2K01ydUNNWnc0TVhM?=
 =?utf-8?B?VThGMCs4QVNvYkJWR0R3MlB6dmlVR0tkQ0NKRnluWDBodFE4QlUycy9BOVFS?=
 =?utf-8?B?b0lIbWNvRGQvanJnRXpQUTA3ZUg4K2JqSnNTbUM1VU0yRkg3dzFYbzFMUVZq?=
 =?utf-8?B?T3IzTEU5TVVQZ2JtSHRoQjROYjNyQ2UvQnRVdGhOZkhYRFBqcWNWN1RBeE5Q?=
 =?utf-8?B?SWYwWG9jM0Jzc0NxZDR6dWZ5a0x0MFIydWlpVnY4T003SE5naExtMUJYWTN0?=
 =?utf-8?B?ell2VVF0bzBlVjF0TDBQYTB1UjIzNFlyT09iMkE0MVQ2L0t3S2w4eUNmUTJX?=
 =?utf-8?B?L3BuQSthN2NkYkUvdmp4elpERGovNjAzWGZHWFZnampiRUdCdURkeFVHd3l4?=
 =?utf-8?B?WlZweG90OERUUTBFanZQZy9ZbWhjVE9VUkxqc2JoVzNiMUpYZ1lkcXZwanR2?=
 =?utf-8?B?M3Z6THRvRUo5UFN5Nk9CTHFQSFZTVlVLZFRkem8xT1Q5bUVXNFFjN2pDUU4w?=
 =?utf-8?B?Mk5rNmNJdWY4RklMT0h4dlQ2TitRRWhiN3dWUjVCeWM3dXVzM3hlcFlCTXhz?=
 =?utf-8?B?MGV3K3JhVDEzU1phKzRpaENhVjgveXJHZUF5MVdhSERXdUtFZnk3Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 487159e5-729c-45af-6aa3-08de755c2fd1
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 17:26:33.5273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mEzVcbRQ84WBLbwlL5WfMjUxU9TlinJKuPDC4+JVLJH2N0M5vu+RXQKwbeRjSKqi/JdiHn3h3FcBKN7vsb5uzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8750
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

ack to almost all requests, but comment to one remaining below.

On 2/26/2026 2:57 AM, Matthew Brost wrote:
> On Wed, Feb 25, 2026 at 05:42:20PM -0800, Matthew Brost wrote:
>
> Opps, one mistake in my review, corrected below.
>
>> On Thu, Feb 26, 2026 at 12:54:45AM +0100, Tomasz Lis wrote:
>>
>> s/'drm/xe/queue'/'drm/xe' in the patch prefix I think.
>>
>>> There is a small but non-zero chance that VF post migration fixups
>>> are running on an exec queue during teardown. The chances are
>>> decreased by starting the teardown by releasing guc_id, but remain
>>> non-zero. On the other hand the sync between fixups and EQ creation
>>> (wait_valid_ggtt) drastically increases the chance for such parallel
>>> teardown if queue creation error path is entered (err_lrc label).
>>>
>>> The exec queue itself is not going to cause an issue, but LRCs have
>>> a small chance of getting freed during the fixups.
>>>
>>> Creating a setter and a getter makes it easier to protect the fixup
>>> operations with a lock. For other driver activities, the original
>>> access method (without any protection) can still be used.
>>>
>>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_exec_queue.c | 71 +++++++++++++++++++++---------
>>>   drivers/gpu/drm/xe/xe_exec_queue.h |  1 +
>>>   2 files changed, 52 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> index b4ef725a682d..2cb37af42021 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> @@ -270,6 +270,54 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>>>   	return q;
>>>   }
>>>   
>>> +static void xe_exec_queue_set_lrc(struct xe_exec_queue *q, struct xe_lrc *lrc, u16 idx)
>>> +{
>>> +	xe_assert(gt_to_xe(q->gt), idx < q->width);
>>> +
>>> +	scoped_guard(spinlock, &q->multi_queue.lock)
>>> +		q->lrc[idx] = lrc;
>>> +}
>>> +
>>> +/**
>>> + * xe_exec_queue_get_lrc() - Get the LRC from exec queue.
>>> + * @q: The exec_queue.
>>> + * @idx: Index within multi-LRC array.
>>> + *
>>> + * Retrieves LRC of given index for the exec queue
>> under lock and takes reference.
>>
>>
>>> + *
>>> + * Return: Pointer to LRC on success, error on failure
>> NULL on lookup failure.
>>
>>> + */
>>> +struct xe_lrc *xe_exec_queue_get_lrc(struct xe_exec_queue *q, u16 idx)
>>> +{
>>> +	struct xe_lrc *lrc;
>> struct xe_lrc *lrc = NULL;
>>
> Actually not needed as lrc is always assigned and will either be present
> and valid or NULL.
>
> Matt
>
>>> +
>>> +	xe_assert(gt_to_xe(q->gt), idx < q->width);
>>> +
>>> +	scoped_guard(spinlock, &q->multi_queue.lock) {
>> Hmm, this isn't what 'q->multi_queue.lock' was designed for.
>>
>> Can we get a dedicated spinlock? Maybe 'q->lrc_lookup_lock'?
>>
>> Open to better naming.
>>
>>> +		lrc = q->lrc[idx];
>>> +		if (lrc)
>>> +			xe_lrc_get(lrc);
>>> +	}
>>> +
>>> +	return lrc;
>>> +}
>>> +
>>> +/**
>>> + * xe_exec_queue_lrc() - Get the LRC from exec queue.
>>> + * @q: The exec_queue.
>>> + *
>>> + * Retrieves the primary LRC for the exec queue. Note that this function
>>> + * returns only the first LRC instance, even when multiple parallel LRCs
>>> + * are configured. This function does not increment reference count,
>>> + * so the reference can be just forgotten after use.
>>> + *
>>> + * Return: Pointer to LRC on success, error on failure
>>> + */
>>> +struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q)
>>> +{
>>> +	return q->lrc[0];
>>> +}
>> Why move this code?

We've added another getter and setter. It would be very un-structured if 
we had one getter, then a lot of different code, and then the 2nd getter.

Where no other restrictions apply, we should keep functions of similar 
level in one place within source files.

When someone looks at a code which contains a setter and a getter, I 
believe they should find any other getters nearby. They definitely 
should not expect there may be another getter of the same resource much 
further within the file.

For why move up instead of inserting new ones down - it is to avoid 
unnecessary prototype (I believe checkpatch would otherwise complain).

-Tomasz

>>
>>> +
>>>   static void __xe_exec_queue_fini(struct xe_exec_queue *q)
>>>   {
>>>   	int i;
>>> @@ -327,8 +375,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>>>   			goto err_lrc;
>>>   		}
>>>   
>>> -		/* Pairs with READ_ONCE to xe_exec_queue_contexts_hwsp_rebase */
>>> -		WRITE_ONCE(q->lrc[i], lrc);
>>> +		xe_exec_queue_set_lrc(q, lrc, i);
>>>   	}
>>>   
>>>   	return 0;
>>> @@ -1288,21 +1335,6 @@ int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
>>>   	return ret;
>>>   }
>>>   
>>> -/**
>>> - * xe_exec_queue_lrc() - Get the LRC from exec queue.
>>> - * @q: The exec_queue.
>>> - *
>>> - * Retrieves the primary LRC for the exec queue. Note that this function
>>> - * returns only the first LRC instance, even when multiple parallel LRCs
>>> - * are configured.
>>> - *
>>> - * Return: Pointer to LRC on success, error on failure
>>> - */
>>> -struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q)
>>> -{
>>> -	return q->lrc[0];
>>> -}
>>> -
>>>   /**
>>>    * xe_exec_queue_is_lr() - Whether an exec_queue is long-running
>>>    * @q: The exec_queue
>>> @@ -1662,14 +1694,13 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
>>>   	for (i = 0; i < q->width; ++i) {
>>>   		struct xe_lrc *lrc;
>>>   
>>> -		/* Pairs with WRITE_ONCE in __xe_exec_queue_init  */
>>> -		lrc = READ_ONCE(q->lrc[i]);
>>> +		lrc = xe_exec_queue_get_lrc(q, i);
>>>   		if (!lrc)
>>>   			continue;
>>> -
>> Unrelated.
>>
>> Matt
>>
>>>   		xe_lrc_update_memirq_regs_with_address(lrc, q->hwe, scratch);
>>>   		xe_lrc_update_hwctx_regs_with_address(lrc);
>>>   		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q->hwe, scratch);
>>> +		xe_lrc_put(lrc);
>>>   		if (err)
>>>   			break;
>>>   	}
>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>>> index c9e3a7c2d249..a82d99bd77bc 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>>> @@ -160,6 +160,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
>>>   int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
>>>   
>>>   struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q);
>>> +struct xe_lrc *xe_exec_queue_get_lrc(struct xe_exec_queue *q, u16 idx);
>>>   
>>>   /**
>>>    * xe_exec_queue_idle_skip_suspend() - Can exec queue skip suspend
>>> -- 
>>> 2.25.1
>>>
