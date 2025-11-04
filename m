Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B52CCF9F8
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 03:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE44310E232;
	Tue,  4 Nov 2025 03:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="flkjNYoe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1976710E232
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 03:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762227369; x=1793763369;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XLBhklINslw/uAimLcaPNhpTim6pZPAWUAD6k2+AZY8=;
 b=flkjNYoeXeK77VU/6SvrsNKvNFUnE+qd8JibGGbAe3JtV9JV4yJ17YvP
 k+kFgCPzAj7dCtTjLk6sgbI964q5CBFhIG10cyYdMjn7xgxBCmkXro+03
 BiQRY3hDrSkojpjlvcdv6vqVcaGNqzkapN6cvOCRt1VpD9BoZV0JA3lz7
 5xtdUohFafbELQaLMQsl4hi30L+utkNCU9YWx/o/elqhWdpLm3wF3d5TX
 gumpn5A6v/sYKFHUisviFN8WcNloM2t2vgTwYvsIR+88qoqIys72njtaa
 OfWME4qJMTl0oClXaPt0M3X9bm33dJhsF7S9sqiyU9KUMkeVnKy4uxWvW w==;
X-CSE-ConnectionGUID: 3RmELPXNShutFsrsbPh8JA==
X-CSE-MsgGUID: yQlo7fZTQT+GK3hS35BDqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="86940127"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="86940127"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 19:36:08 -0800
X-CSE-ConnectionGUID: XFDpG3RzT7yWA+fp6CQNsQ==
X-CSE-MsgGUID: E80Mt0qWT9OtnlcT1rrGUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="217851142"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 19:36:07 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 19:36:06 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 19:36:06 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 19:36:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJV9CtmMUVx85hFCp6JlCAUrxWaOECrDuDnGazwMdTC/UX1fnglchqJuiXzbIQbKeP/ivg62QnudoEy/uDMU10V1TWp8eu+8SRzQPpBRHj4KhrttSC1dt129i19LQfSIQv3kn70zenW4L37pDicwJ2fbkGhzlmmKB2jBDyM6QM0cd29c61XYDovrVgqvDneUEHYwMYMqqlwPqxNoHN3tDjzqmzQW4uIB4q4mfTyijBAPRG0j4h7VxL5ofzJYrpMjkKCIRklUxKU0Fog2f6mRhi1ML6yuE8Fk/g4EFMk06bSYhjt2NUwrl7ky+TELJn0khga9xaKgCjY7MpzaljGX8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dM0BMaewe8fkGJWLytUFx5u54UlL4gQYM5JUXLO6KPg=;
 b=aVqmm88qpp8OcjtaUaDYIvJHmvz+A6PG2pA5I5TAkQ2o7diwyDz0hhEsFaxv2F7OpqiqyikPmWvbgvv5xLaS7J6lyrgq0fTGUtN3+jz5LXXflhHBOAJATsn6M7XzWvnOhSyve/RV2bjttL/pRi3O5hQsU5YHwdblCyooqwepKBJ0lStp4RvQNKl3lN6oZp3wXneaZxHEJiunJg27hGuEgtAXDCrV/Xpo3o3RroxNee/CLfz8rA/lJ2I1c0/k2cFv16pBPhpZ0Z7AfncABhgzJm5aWMnRZo63G/e5GYO40nO61g72svHUggiB1D0yo9ZirYi//kt3a0rGxs192ABipA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DS0PR11MB7969.namprd11.prod.outlook.com (2603:10b6:8:120::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 03:36:05 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 03:35:59 +0000
Date: Mon, 3 Nov 2025 19:35:55 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 09/16] drm/xe/multi_queue: Handle tearing down of a multi
 queue
Message-ID: <aQl0m6oO_8OqMCkC@nvishwa1-desk>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-10-niranjana.vishwanathapura@intel.com>
 <aQaoLnIMeoKzYtNA@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aQaoLnIMeoKzYtNA@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR13CA0175.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::30) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DS0PR11MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: d701bf27-e4d0-471f-0147-08de1b5344fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WLXeGFpYPVhUdJJGFlv7d5EHWr0w6DSHBRlHI67NWsWUrejYG+0vMkyWAUaD?=
 =?us-ascii?Q?/r3S4PLMq874lPkH/+YMgCvxHqPHRaU954rkY3qxcnSEr9VBkaj+TZhws7Mt?=
 =?us-ascii?Q?v1JEs9CZUgwbqIjOqP0UKKfWbg4FY0vF4CMUlQqG3z+LB1/Pf+7j/2hEa8+M?=
 =?us-ascii?Q?mRj2+Wy0xoUSaV1pOOGMyIjpv+8n1nAzukxQf0gUIP+p514AQiDU2ycoaqeG?=
 =?us-ascii?Q?j6tLGBzTJc9qUP2TAxL/UVnQCpfwXYZb4871r9khRy56XrRCdQ+v5VNdnVsi?=
 =?us-ascii?Q?5P+Kea3ewKKfhwkZiOYQgeHifu0+R8P1vZAJ7AoZjqTC3r8et7xjiNVq0zET?=
 =?us-ascii?Q?0PKywE/ozqjt9gkfNJ/L1CCgdQCcUBRijG1pw+GRGgcWjs9Fxfjwg/z3e4iP?=
 =?us-ascii?Q?62V3DxDmkctbLKiAjjVwTzFT60boi6ChhhvnKV1/S7+FvS+IO9TurhJgC4BD?=
 =?us-ascii?Q?yWm8/+f90OIT4qmuCGME5TCa+uw72Gb0sb3IhZ+0h+zCmu3obO1C58u5zClx?=
 =?us-ascii?Q?VFSgckKCjxkuCMv+9LUABHV6G25ROJBBoFYt9XbqoDW6Tk7ibywk5xHAtktw?=
 =?us-ascii?Q?TARgfJk1BMCQGeb08WTsLd4aRQ2YrXQz3PFVf1NaWEYPta3OI+q3I6FU5q0e?=
 =?us-ascii?Q?IOocZPIhOE8+iI/BFQwKs3HcXnzwyAIYu9ccwUxdfcCHgLeZSZ7KdHpz/bDv?=
 =?us-ascii?Q?zkHhM5vm0cpp89E9gcHr4HddCIaBdIrw+b0JOwV2yhk/VSD/3qJ4GDS+iSdj?=
 =?us-ascii?Q?cEA18GZwZ+4dsbWoSb44llDYG6JN6PeySs6ObZsiALE4KrkshDcZpalfnRSR?=
 =?us-ascii?Q?5XfgX5HZGfUbA8BZhJS5C/RZHmydqaN39ajEtKdDhwwFoPtMhq6OJn0B7DKK?=
 =?us-ascii?Q?+pZWYR3HBHSjAELKCbFWRWcbbm1B2B5pg3z1O019waZ5LKTDGr0wpIn91wXX?=
 =?us-ascii?Q?Ts+qf7KzN0RGjHB39MZl0uaLSCr6KgYoDypcs2bzI5Iv4NjnbegpRKLaKHVU?=
 =?us-ascii?Q?YMI5GA8K0iFM9ezUmAaMN0j8F6REeoJTc40dJ6+CKxCqHd9lnZ5a+jmQFzRl?=
 =?us-ascii?Q?pqIiUjXDlfLzwIPisIkqdrUkwOEv2vz86gtpIuQ3mm3pGq1m7xDbQm1Rjfme?=
 =?us-ascii?Q?/KDEWhFshow8CbEo+EjNtYIK6650zAukF0fq5iteZgVuH1f80HAyNsP54t+B?=
 =?us-ascii?Q?TDFdJ4rMwwaw1BzFuRJWKtWRorOQZdSI+qlDqFgY6sGVPiY5x91BihCM89jI?=
 =?us-ascii?Q?djvbePfljNRY4e306IB+fdjhzcl9wppOVvM6/PNMNsG1VQFpv32AqWDq/kp3?=
 =?us-ascii?Q?rE28Digqu7zAVle5rrux2z3BUAA7EphsKEOJ2yBLS+VOrSw1lBKUq+w5wMPq?=
 =?us-ascii?Q?lwsYjK9FPmjHSuKNgbQd9T8oOonHo2zPgGaH47gS47A+6B8iSuh18OeXlisl?=
 =?us-ascii?Q?z7vlHHZCVGsfIcedXhiYU+zgPDm96stI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xF1teKnINanZUcUQpVyErONt9LDgv+b2zvIn0o2g25v9QjPzBohWin3qmiXH?=
 =?us-ascii?Q?uPlfj2A7yFW89Lqt1cFp9W0HTPNQy3AH56GWmB9prk5b6tmEaPptCKBfGscz?=
 =?us-ascii?Q?W6494db/7gi25CU2BUZuV9GwwGmSgHrOWrPOvKv5ZX6WzYJrrhvThxegEoQ7?=
 =?us-ascii?Q?7XP81kEZj+BVW4k6SUQDT0tcn0rgf8NIffza53JH4+zdC+9iYCteNB7q7tiU?=
 =?us-ascii?Q?g4+ibMAjlc7xnaQf7In0D0qSYj+0MwRm4MJeuBVwwsdaCshPYz3EKSarJoeo?=
 =?us-ascii?Q?LUvlbNy5XsH3ABmzZU41+A1LqRkvJDVKmmPwaxAQL6sfQ/8A1HPY76sCBq0i?=
 =?us-ascii?Q?5YEBqajjnxqWs7HaJRTm0H0QZEckfqpD4k/CkpaJmVuhdCCOsWs38mNmiHtJ?=
 =?us-ascii?Q?JMqKh56nSKUOBk/aOQWmAnDuN24eazQ47uFCsYZa4ay01JxBy+XRFKu/daiH?=
 =?us-ascii?Q?IUR8B2B4ul/iziKNycJhY/VkGPG6MxB3fY3sc4DzpshIismDvYNfzT4ZPZlN?=
 =?us-ascii?Q?xlQ4IkN3qGKnArbgoot1Y9HX4TTPUg4S4MAGV0BKWGZwDWVQhcUBtSP+hA9L?=
 =?us-ascii?Q?bWRgv3Imj+F0TEnGZpHXSyGGe7kg6l+fCP3V18/zMKRN1JxP6ZpG8U766nDx?=
 =?us-ascii?Q?RTiiLB5+15BWOatoD/fW366R+CPcG8xIwoe3y7hLIyONThMiLCBB1fs3PMyr?=
 =?us-ascii?Q?avjf6lBHe36X1acVB4iJFTlkS8qLSaeTCyDhNcH4Yg7068VpprYHDWZtIBq1?=
 =?us-ascii?Q?UTzY6bTaoKVx1+/GD3k8+U2ACHKN/l9j/RzaUGwGnw/tAf6aNo3Tlla+6m8a?=
 =?us-ascii?Q?r62ObntPxxM1Sf1Orh/zEyH22JpoP2+FbZSgIdfWzQPYE4FCRuxxtHTaXmyM?=
 =?us-ascii?Q?LTelF0iI3rlL1BiFC2n+4W7DWLYdkKnaAbrlD+x1kHiuqTCXGStG3/BJifuj?=
 =?us-ascii?Q?9hWNncFhX4PEMzoF+mvCFWOooZUwwJSjynZjrtE2wbAuF1hbX8dF5nC7p/Sh?=
 =?us-ascii?Q?OMI642hnQqEdJetodBuJHlQtfepI4AkN8c4HKR1TqQFkW5O9L3nu41qm0udr?=
 =?us-ascii?Q?uY4UhUHUEcspyHUdk8N+PFcsnzh4TJbHqZ/86SCNuAqFKUS+k2gFFxLtx1T1?=
 =?us-ascii?Q?2NR8rXY8aBth4nzJy0/zFZPpy0tNrxirHxHYV0USVyJB2dOkxaFjWSTy/zF5?=
 =?us-ascii?Q?4ZnthIDSSF9hGIKc+KEkpwmXd340IWuOiIlTiOPl4DdSbXBUExcrCf9+QN9F?=
 =?us-ascii?Q?6n8S9vHffQtGvOiTc7Mo5EAwWwVMI5jnV8vD74EslaYXpFnK54WR9mtr9PTC?=
 =?us-ascii?Q?isb+xvrC/5qWlNPc8HDcezKuezcX9VVNiFa4mkgTHS86zU7VOG1ag2VRXXCE?=
 =?us-ascii?Q?loYIl55rirtAroJvgaC7bQCUkRr68g+i65o2ff26ytsaTiOe6aP2hdEMRpdF?=
 =?us-ascii?Q?2MYQAexUN0QBfVVhRKP5weatzNQsJXynKH/bi8JbxZbvtC0tHJ2dzyqEobwJ?=
 =?us-ascii?Q?6EmBQzPZS6donABuVlm07vA9salC77yyjGeczYqirCDNxGuw3WEaur+wG+CL?=
 =?us-ascii?Q?RblddIPjzADOMhxzl9qoyHY76uKmofRB9giPTeP0Roq1SCVgTz5setro0Sbb?=
 =?us-ascii?Q?zIpkYCklpGP5Pw/EbafNckg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d701bf27-e4d0-471f-0147-08de1b5344fc
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 03:35:58.9416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pi9iSZ0vIMTIRk+DHrfVJxj5e256XsztuulyLH5HOnKXbXXHWVmo2XKwlGMff1e3gj0nzoRe9x1X16ejtWH4uDRSzf3xW5PB1omF4ibH587jdvLNABwTAwt+x8+ohdOV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7969
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

On Sat, Nov 01, 2025 at 05:39:10PM -0700, Matthew Brost wrote:
>On Fri, Oct 31, 2025 at 11:29:29AM -0700, Niranjana Vishwanathapura wrote:
>> As all queues of a multi queue group use the primary queue of the group
>> to interface with GuC. Hence there is a dependency between the queues of
>> the group. So, when primary queue of a multi queue group is cleaned up,
>> also trigger a cleanup of the secondary queues. During cleanup, stop and
>> re-start submission for all queues of a multi queue group to avoid any
>> submission happening in parallel when a queue is being cleaned up.
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_exec_queue.c       |   2 +
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h |   4 +
>>  drivers/gpu/drm/xe/xe_guc_submit.c       | 150 +++++++++++++++++++----
>>  3 files changed, 134 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 98f8f1c7f13b..3c1bb4f10fd5 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -85,6 +85,7 @@ static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
>>
>>  	xa_destroy(&group->xa);
>>  	mutex_destroy(&group->lock);
>> +	mutex_destroy(&group->list_lock);
>
>You init this lock in eariler patch but destroy it in this. Can we get
>the init/destroy/instanaition in a single patch?
>

Ok, will fix.

>>  	xe_bo_unpin_map_no_vm(group->cgp_bo);
>>  	kfree(group);
>>  }
>> @@ -605,6 +606,7 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
>>
>>  	group->primary = q;
>>  	group->cgp_bo = bo;
>> +	INIT_LIST_HEAD(&group->list);
>>  	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
>>  	mutex_init(&group->lock);
>>  	mutex_init(&group->list_lock);
>
>group->list_lock is taken in the submission backend, which is entirely
>in the path reclain. Can we teach lockdep this lock is in the path of
>reclaim?
>
>e.g.,
>
>fs_reclaim_acquire(GFP_KERNEL);
>might_lock(&group->list_lock);
>fs_reclaim_release(GFP_KERNEL);
>

Ok, will add.

>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index dcb55b069ed8..e64b6588923e 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -51,6 +51,8 @@ struct xe_exec_queue_group {
>>  	struct xe_bo *cgp_bo;
>>  	/** @xa: xarray to store LRCs */
>>  	struct xarray xa;
>> +	/** @list: List of all secondary queues in the group */
>> +	struct list_head list;
>>  	/** @list_lock: Secondary queue list lock */
>>  	struct mutex list_lock;
>>  	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
>> @@ -140,6 +142,8 @@ struct xe_exec_queue {
>>  	struct {
>>  		/** @multi_queue.group: Queue group information */
>>  		struct xe_exec_queue_group *group;
>> +		/** @multi_queue.link: Link into group's secondary queues list */
>> +		struct list_head link;
>>  		/** @multi_queue.priority: Queue priority within the multi-queue group */
>>  		enum xe_multi_queue_priority priority;
>>  		/** @multi_queue.pos: Position of queue within the multi-queue group */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index b84a0be2eefe..87c13feb2cef 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -920,6 +920,81 @@ static void wq_item_append(struct xe_exec_queue *q)
>>  	parallel_write(xe, map, wq_desc.tail, q->guc->wqi_tail);
>>  }
>>
>> +static void xe_guc_exec_queue_submission_start(struct xe_exec_queue *q)
>> +{
>> +	/*
>> +	 * If the exec queue is part of a multi queue group, then start submission
>> +	 * on all queues of the multi queue group.
>> +	 */
>> +	if (xe_exec_queue_is_multi_queue(q)) {
>> +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>> +		struct xe_exec_queue_group *group = q->multi_queue.group;
>> +		struct xe_exec_queue *eq;
>> +
>> +		xe_sched_submission_start(&primary->guc->sched);
>> +
>> +		mutex_lock(&group->list_lock);
>> +		list_for_each_entry(eq, &group->list, multi_queue.link)
>> +			xe_sched_submission_start(&eq->guc->sched);
>> +		mutex_unlock(&group->list_lock);
>> +	} else {
>> +		xe_sched_submission_start(&q->guc->sched);
>> +	}
>> +}
>> +
>> +static void xe_guc_exec_queue_submission_stop(struct xe_exec_queue *q)
>> +{
>> +	/*
>> +	 * If the exec queue is part of a multi queue group, then stop submission
>> +	 * on all queues of the multi queue group.
>> +	 */
>> +	if (xe_exec_queue_is_multi_queue(q)) {
>> +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>> +		struct xe_exec_queue_group *group = q->multi_queue.group;
>> +		struct xe_exec_queue *eq;
>> +
>> +		xe_sched_submission_stop(&primary->guc->sched);
>> +
>> +		mutex_lock(&group->list_lock);
>> +		list_for_each_entry(eq, &group->list, multi_queue.link)
>> +			xe_sched_submission_stop(&eq->guc->sched);
>> +		mutex_unlock(&group->list_lock);
>> +	} else {
>> +		xe_sched_submission_stop(&q->guc->sched);
>> +	}
>> +}
>> +
>> +static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>> +{
>> +	struct xe_guc *guc = exec_queue_to_guc(q);
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +
>> +	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
>> +	wake_up_all(&xe->ufence_wq);
>> +
>> +	if (xe_exec_queue_is_lr(q))
>> +		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
>> +	else
>> +		xe_sched_tdr_queue_imm(&q->guc->sched);
>> +}
>> +
>> +static void xe_guc_exec_queue_trigger_secondary_cleanup(struct xe_exec_queue *q)
>> +{
>> +	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>> +	struct xe_exec_queue_group *group = q->multi_queue.group;
>> +	struct xe_exec_queue *eq;
>> +
>> +	mutex_lock(&group->list_lock);
>> +	list_for_each_entry(eq, &group->list, multi_queue.link) {
>> +		if (exec_queue_reset(primary))
>
>Do we need to propagate banned or killed?
>

As the guc interface is only with the primary queue, I am only
propagating the reset here which gets set in the g2h error handlers.
The drm scheduler interface is on all queues. So, I am not propagating
others.

>Also happens if secondary queue is reset or a job times out? Does that
>affect any of the other LRCs in the group?
>

As the guc interface is only with primary, it can only reset the primary.
Timeout on the secondaries should not affect the other queues.

>> +			set_exec_queue_reset(eq);
>> +
>> +		if (!exec_queue_banned(eq))
>> +			xe_guc_exec_queue_trigger_cleanup(eq);
>> +	}
>> +	mutex_unlock(&group->list_lock);
>> +}
>> +
>>  #define RESUME_PENDING	~0x0ull
>>  static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
>>  {
>> @@ -1098,20 +1173,6 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>>  			       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
>>  }
>>
>> -static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>> -{
>> -	struct xe_guc *guc = exec_queue_to_guc(q);
>> -	struct xe_device *xe = guc_to_xe(guc);
>> -
>> -	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
>> -	wake_up_all(&xe->ufence_wq);
>> -
>> -	if (xe_exec_queue_is_lr(q))
>> -		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
>> -	else
>> -		xe_sched_tdr_queue_imm(&q->guc->sched);
>> -}
>> -
>>  /**
>>   * xe_guc_submit_wedge() - Wedge GuC submission
>>   * @guc: the GuC object
>> @@ -1185,8 +1246,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>>  	if (!exec_queue_killed(q))
>>  		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>>
>> -	/* Kill the run_job / process_msg entry points */
>> -	xe_sched_submission_stop(sched);
>> +	/*
>> +	 * Kill the run_job / process_msg entry points.
>> +	 * As this function is serialized across exec queues, it is safe to
>> +	 * stop and restart submission on all queues of a multi queue group.
>> +	 */
>> +	xe_guc_exec_queue_submission_stop(q);
>>
>>  	/*
>>  	 * Engine state now mostly stable, disable scheduling / deregister if
>> @@ -1222,7 +1287,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>>  				   q->guc->id);
>>  			xe_devcoredump(q, NULL, "Schedule disable failed to respond, guc_id=%d\n",
>>  				       q->guc->id);
>> -			xe_sched_submission_start(sched);
>> +			xe_guc_exec_queue_submission_start(q);
>>  			xe_gt_reset_async(q->gt);
>>  			return;
>>  		}
>> @@ -1233,7 +1298,11 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>>
>>  	xe_hw_fence_irq_stop(q->fence_irq);
>>
>> -	xe_sched_submission_start(sched);
>> +	xe_guc_exec_queue_submission_start(q);
>> +
>> +	/* Trigger cleanup of secondary queues of multi queue group */
>> +	if (xe_exec_queue_is_multi_queue_primary(q))
>> +		xe_guc_exec_queue_trigger_secondary_cleanup(q);
>>
>>  	spin_lock(&sched->base.job_list_lock);
>>  	list_for_each_entry(job, &sched->base.pending_list, drm.list)
>> @@ -1392,8 +1461,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>  	    vf_recovery(guc))
>>  		return DRM_GPU_SCHED_STAT_NO_HANG;
>>
>> -	/* Kill the run_job entry point */
>> -	xe_sched_submission_stop(sched);
>> +	/*
>> +	 * Kill the run_job entry point.
>> +	 * As this function is serialized across exec queues, it is safe to
>> +	 * stop and restart submission on all queues of a multi queue group.
>> +	 */
>> +	xe_guc_exec_queue_submission_stop(q);
>>
>
>I'd know where to stick this comment, but disable_scheduling() looks
>like a pure software things for secondary queues. We currently need the
>LRC to not be running to accurately sample the timestamp - I think we
>could fix that part, Umesh would likely know for sure. But until then
>I'm pretty sure we'd need to disable scheduling on primary for an
>accurate sample of the secondaries queue's LRC timestamp.
>

Hmm...not sure about LRC timestamping. Timestamping is done during TDR,
right? Looks like it should be fine for all cases except secondary job
timeouts. It is not trivial to disable scheduling of primary in the
TDR handling of secondary. It would be good if we don't have to do it.
Let me check with Umesh.

>>  	/* Must check all state after stopping scheduler */
>>  	skip_timeout_check = exec_queue_reset(q) ||
>> @@ -1552,7 +1625,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>  	 * fences that are complete
>>  	 */
>>  	xe_sched_add_pending_job(sched, job);
>> -	xe_sched_submission_start(sched);
>> +	xe_guc_exec_queue_submission_start(q);
>>
>>  	xe_guc_exec_queue_trigger_cleanup(q);
>>
>> @@ -1565,6 +1638,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>  	/* Start fence signaling */
>>  	xe_hw_fence_irq_start(q->fence_irq);
>>
>> +	/* Trigger cleanup of secondary queues of multi queue group */
>> +	if (xe_exec_queue_is_multi_queue_primary(q))
>> +		xe_guc_exec_queue_trigger_secondary_cleanup(q);
>> +
>
>I'd stick this part by xe_guc_exec_queue_trigger_cleanup above.
>

I don't think that works. I had tried that before, but ran into issues.
I don't quite remember the issue exactly, but it is some kind of race
where secondary cleanup triggering before or during the primary is
TDR being run. So, it seemed much safer and cleaner to trigger
secondary cleanups after the primary cleanup is done.

>>  	return DRM_GPU_SCHED_STAT_RESET;
>>
>>  sched_enable:
>> @@ -1576,7 +1653,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>  	 * but there is not currently an easy way to do in DRM scheduler. With
>>  	 * some thought, do this in a follow up.
>>  	 */
>> -	xe_sched_submission_start(sched);
>> +	xe_guc_exec_queue_submission_start(q);
>> +
>> +	/* Trigger cleanup of secondary queues of multi queue group */
>> +	if (xe_exec_queue_is_multi_queue_primary(q))
>> +		xe_guc_exec_queue_trigger_secondary_cleanup(q);
>
>I don't think you need to trigger a cleanup here - this is no hang
>situation, rather a false timeout.
>

Ok, will remove.

Niranjana

>Matt
>
>>  handle_vf_resume:
>>  	return DRM_GPU_SCHED_STAT_NO_HANG;
>>  }
>> @@ -1607,6 +1688,14 @@ static void __guc_exec_queue_destroy_async(struct work_struct *w)
>>  	xe_pm_runtime_get(guc_to_xe(guc));
>>  	trace_xe_exec_queue_destroy(q);
>>
>> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
>> +		struct xe_exec_queue_group *group = q->multi_queue.group;
>> +
>> +		mutex_lock(&group->list_lock);
>> +		list_del(&q->multi_queue.link);
>> +		mutex_unlock(&group->list_lock);
>> +	}
>> +
>>  	if (xe_exec_queue_is_lr(q))
>>  		cancel_work_sync(&ge->lr_tdr);
>>  	/* Confirm no work left behind accessing device structures */
>> @@ -1897,6 +1986,19 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>>
>>  	xe_exec_queue_assign_name(q, q->guc->id);
>>
>> +	/*
>> +	 * Maintain secondary queues of the multi queue group in a list
>> +	 * for handling dependencies across the queues in the group.
>> +	 */
>> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
>> +		struct xe_exec_queue_group *group = q->multi_queue.group;
>> +
>> +		INIT_LIST_HEAD(&q->multi_queue.link);
>> +		mutex_lock(&group->list_lock);
>> +		list_add_tail(&q->multi_queue.link, &group->list);
>> +		mutex_unlock(&group->list_lock);
>> +	}
>> +
>>  	trace_xe_exec_queue_create(q);
>>
>>  	return 0;
>> @@ -2125,6 +2227,10 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
>>
>>  static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
>>  {
>> +	if (xe_exec_queue_is_multi_queue_secondary(q) &&
>> +	    guc_exec_queue_reset_status(xe_exec_queue_multi_queue_primary(q)))
>> +		return true;
>> +
>>  	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
>>  }
>>
>> --
>> 2.43.0
>>
