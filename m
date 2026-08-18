Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1131BC5DF81
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 20:54:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBC810E067;
	Tue, 18 Aug 2026 20:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mAu+7PX2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0E110E067
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 20:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787086459; x=1818622459;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=r9jBtIjDK6Lp6mZF5gun0xVRCl2QbwFMGXnzc21ONx4=;
 b=mAu+7PX2K8Ga1WHgTnX8E+kSax2kU65WGgxdOQOBr3yr15QbIQAumruX
 FgipUcoD+FKCDKBs5015Sj85MqE3k2QOw+lfM1A3GgC1+8iu18HkdFd5D
 1DLb2nbVrPJeYZYWzrOhjox/Hn1s+h/8B84nC9FOrUJuU1yd2eoSISBKi
 mPQ/iuiAqQCiL0LJtSClL1CB8z74zUVHMYCwnpehBaWiyL9lL8W7RqXyR
 7SHnOWVIrx725FmrWUOCGstL/TN7C7vC+NUiW8f5PujdujyQlrV4nPSqq
 G3al1CEw3tf4iAj/z9Mrk2RMpOgFnqeeU4bX2DiaKoRtP57xU86DaMIEe w==;
X-CSE-ConnectionGUID: ubUQlT1ZTf2wRee8mJrQVQ==
X-CSE-MsgGUID: feNASz/DSzy6IwJkihFeUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="86707135"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="86707135"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 13:54:19 -0700
X-CSE-ConnectionGUID: CIBdFnucSLyln9IzDQW+rg==
X-CSE-MsgGUID: c96Ry78ERh+QodPEQT6tKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="269624444"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 13:54:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 13:54:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 13:54:17 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.22)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 13:54:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YqL8WYdRj1CUZNntJGVwNyOvbHTBehX/A3D7eU3xVrApW610cU3AUsw10HJzPmoKlcrUIc9J1VSdk2gBRQo1Lj6Y8NpJYCSXha0c1O/ZWcvM5keSmemIjtm5R3qbXdYIYqOxHyCJx0Drh87elDTZVGVOJdBSU9SYdrJXtqTzSPjIxWaVZW+c9MYv/BH4/8M9qxr4k9jPQNY5aZyoVEp+cJSHZ6ZslZtO9iZxhhVCDTmHuXu4CztLuA/VxRZyH3FnrAgOX4D5fxFNNf4glcgZqoozayP8MyVBF1swkUqlrJ4N5SP4QI7mdpO4GX0x1Dp5luwqLXbPiXyqedBJZ1ah5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/TVQsdGLXIoSUHGfXilkEUlAKNRnzI4Wg7mBnLrPsg=;
 b=P58zELhyZxXb2LoxwbF6wHmBRT47xC8K+oBedyY+UFTZPxH1QoPEhuyKs0m3CbfCzaP3tPX3BJspBdqndPXSzZNuPc1RWFXw0I+E/9nL8TfErnYT5VaouSaFcpptNe85q+4DHKcGYdy9hFenSXvjZs//ca+qNBBVuRxII1DnIf9xBq1GI1GFI3UCmEjO/EfsPhfv3gkJaFT80hrv7TUABsUkQoH0P829rj80GLqmBYNZQYqfqYekQLnpKrjnosi59rrmFKFC+b3Mun3V4pBR/vm44Y+YHjTUwIZ6xY/5WW65DFpJ41CP8pKkxJ9n2sxs43FefC97YAS3vrCU9ZsI/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by CY8PR11MB7290.namprd11.prod.outlook.com (2603:10b6:930:9a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 20:54:14 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0315.014; Tue, 18 Aug 2026
 20:54:14 +0000
Date: Tue, 18 Aug 2026 13:54:11 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: Jagmeet Randhawa <jagmeet.randhawa@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/guc: Fix race around q->guc->suspend_pending
 access
Message-ID: <aoTGc0L9ItVs0Uyx@nvishwa1-desk>
References: <20260818183838.273486-2-jagmeet.randhawa@intel.com>
 <20260818185142.BEFE31F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260818185142.BEFE31F000E9@smtp.kernel.org>
X-ClientProxiedBy: BY3PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:217::31) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|CY8PR11MB7290:EE_
X-MS-Office365-Filtering-Correlation-Id: ec146b6b-7fe5-4c43-c8c7-08defd6adca4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|56012099006|10067099003|6133799003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 6lh9QG2gbTmfEy1lbrC2XDHzzMG0ImM+UpaR+NwuVQYNfml3OYLO1OGg/eLbVxu6rbsAZMiR8Jwu22GY603bb0eAeLzzR+EpmQDW45tRAgR/HM49W/RNDVYcuXAdQxjeGqo7Ge9AGBXtm+8P/PJadhGbh0i7K0plTen4n6u02QXgQNJBPVCa7wiOXnytQef711kRb+r8360PiCqcsxhCSf5qA+3RJUsAy1xy6XoUNX30oczclFZhxlG1Xl2Cu/9XYzUp5NFZ6bO216gMBEv5ydxocWRk3dBQCbuMB5mLbrXVcemsE8XVpQ326ezdZA431Ah8loYS1PaOzUE42pdNrFOcwGXuvBY6yi+YbDMmVZ6QFapip45vvjZiV9K2eHtuzz0y4XJYZjqB6eisDKcAsBooYKMN4LDe6LJPPCIRxl5hg2OStF5zi89GBjrJpBbsEujJ6170Pj+GpVHPLh8yeAbssn6doLHUO0O38/c+VlajINGNeouTyCwA/HAyyB5WwXz3zPANSsPMicb+tlreZOZojjIhFME4RjfcJxQMl0eQRcZnmtF/FaZf7E/XlDlHsBht2X0L1D1FntoMkshEdMN1b9bi8QnX5A+yqeA824s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OW+65hh72C0yQWY2Jn+P+AisYo2R4Fe2vjciVcjMjcDzPmIYAETLecFNjA?=
 =?iso-8859-1?Q?zHIWmtZHIZwFRASNb2UmqhclWIoLKxLAfNzAJEWHlFpyfJ2P9vNiIQ5jwS?=
 =?iso-8859-1?Q?vhGrP19GxT/o3dXlv/U5aoXH1A7fhq5j+lkfeulzVUqivRwaIgQNNvJ3ai?=
 =?iso-8859-1?Q?LAMdG3kL2yZRz9L2H88unQiHLYKuziyZbIkC2Eg+wtJ3SJ0rghvXXHQjnJ?=
 =?iso-8859-1?Q?tTXICRwyxJ9PKR3oH7Omsw959UBBFiX7EWOTObHbdfIcDcbhNvL8vpBrOn?=
 =?iso-8859-1?Q?Sta8W+CJbT4M+0fOWMZ8ZW/TxPoPX58ZYBDAQwPce6Ep4eGWPK4e/VlcuM?=
 =?iso-8859-1?Q?+oC3IKjywZ3TOuCEWdgHKnLTJf8gV/ktSS53T9a/l7JHgJWG+5eEeODe9y?=
 =?iso-8859-1?Q?4TVboA6ubhr/hpRay5G8H6gr4xnwPR1T8J05Uej9PBUnbGR2y/bdAhYiPj?=
 =?iso-8859-1?Q?Xn7jdgq5eBvcX/h5L/AtmiEMuEtK7Di56SWFcf5wbcQB/BdOT9CUra4K4v?=
 =?iso-8859-1?Q?Eo2pyD0fYlgyQyDJmtmHb47Ukk93zypjY4mVNNwNNFuzHqEKWx0esAVQWD?=
 =?iso-8859-1?Q?twvUXa+H5LMZFONzMOUymujX7rIv1MGMN7Ar3lqKQBNOad4mBTjsbbbEK/?=
 =?iso-8859-1?Q?Waxk0HrFe94WP22EowSJxPQk/H6HZC57Layxw03pIEsnh0Lkxv0VFXI5CT?=
 =?iso-8859-1?Q?MF2Hitx+xmjEVW8xP5wNBBJAMadHRJEirbygzMTGEjaMX2zstpdUtWwS3D?=
 =?iso-8859-1?Q?FsLqDvMQyo3IXguvH2EkyuR1QqZaGAQnZ8h/L0hTLcw4DzdnenebeUzUhP?=
 =?iso-8859-1?Q?NYt0XQUTAiDsQHB46fib44tFtewRhRNLaKhtcSjFcxrQNnMaGp6J4pGzMs?=
 =?iso-8859-1?Q?mF1EJqEGRQZXh0CglXAcHUl25CSW/6QXoUonZ5xwb4LuhJD2WUA0+luqdL?=
 =?iso-8859-1?Q?gm9plbf7tB8ZoOT6xZb84/+McgrYbfBlqWfBh/FXisUFlxbIbnhoTNS35Y?=
 =?iso-8859-1?Q?f6ozMiM8ntm0f3hCrdGAg0Q2xR83bpTMCivLuuEiLE5Iof3LfmJ4yRTALP?=
 =?iso-8859-1?Q?Rwcxp0ABYgVm0H5XEk6ae0xZPNgD4N1RqiDDmee82iljp51cTKAOfVV8KL?=
 =?iso-8859-1?Q?GrBCCQ2EcMh4yOPrAHmraXp7eA2I7Sl3/Rlg9Tt/QHSAA2vOV9afGG97OY?=
 =?iso-8859-1?Q?JI3eDzvmLpTP6d6890pMf5eBHNK+JV9ySu/zWpi3Ujd+/mGh2c8HloybKQ?=
 =?iso-8859-1?Q?q/vsrBcexudy4jdGtpTG6QgujsFZn/FOMED8TFSg7X+Ra4H3FQ4eWnV5ZA?=
 =?iso-8859-1?Q?RqQxKzjc7J0aFhFcqws2QsYJxFUb2jmTO6ZMI4Q7pbcl+y2eQ17by/UJV6?=
 =?iso-8859-1?Q?NSviyKMqcIwj9UW7nbA43vzqagTpp9/frVD2QuNlnD9tnfhVrQsQCcKUOC?=
 =?iso-8859-1?Q?dOws6TzFQwUKeh1swNZ8/CfQ4P2hSpxThgdJDcKcQHteRQ3pr9bFETFY5p?=
 =?iso-8859-1?Q?LxoJp+78RCX0xsIbZCgVg3j1NAodlz2wy81RGKWMbwKkb8BP0QyP7DUUC4?=
 =?iso-8859-1?Q?DSh9LzVeLDQ1JuZS1dWbUxiZ70XeskyvcPURfSAFX6ruzeg/5DaYHxuKDZ?=
 =?iso-8859-1?Q?N59dv+3VhZmP8c5d7RsCMOMOy4mhqqQ5yHLn4asXFpwqed6csCrL+NC4gr?=
 =?iso-8859-1?Q?BzuWIEizwtiUPNoL3BJ6Suh4RDGE5qvuKQ5bbzGdHTmKhqA6Q+ltiDFkv1?=
 =?iso-8859-1?Q?CmXk9magNjsvBx0FkNR2SSwQwNI7vrxE5g1gWB3Zz+/osGk63fqrWdcCnS?=
 =?iso-8859-1?Q?6cP6yvdrFgESZ5zMFN0vJQ0x5dp37zlYW8/kREqs+CL7hMN45XCQ?=
X-Exchange-RoutingPolicyChecked: PTlWhDVhUUx3hB7DGzckD2l3JbKU0wcTWNALkTCR564VSJOpCo2GicLNp8MWxgSYsOc8GJCikH4XhBt9rgca5lYZ1I1vMRe3CMi6/CS7S4yaBMx1z8sGOxjdYFXziob4jqtnx3wOIMFgT6srtqkRHlk616tykOyesp+1ze0hSMhrL+W/+EMfAlk+j/wlx2rcys/NiOU1NYmhRwPDf8E4OeCXTouZTxZ59F0k5TELcS2l4TkYG/Y1PxSGsVtjx1QX7QQGWuhWZYfzxf4Xw4rW0wQOdJpv7Wka4u08yWnUpnuIN5xSkNvBxgXzkhOwwcDEmr+qdcft+J/5b+IuSuqZxw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ec146b6b-7fe5-4c43-c8c7-08defd6adca4
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 20:54:14.5047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2S9xCwtB3xY4UhyQtVR76YZ0ti8TzTvUO6WkohkebCi2SyHNuYPlXUwNdH68wjvS1LRtoodZXVhw8SrfTSlEjxG3eKhnDiCwxfz3P9vRByPvM7K9mUDTEWlwlTZC8/v4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7290
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

On Tue, Aug 18, 2026 at 06:51:42PM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
>Pre-existing issues:
>- [High] TDR (Timeout Delay Recovery) races with asynchronous queue suspend, leading to misattributed SCHED_DONE messages, an assertion failure, and a TDR hang.
>--
>
>--- Patch [1]: [PATCH v2] drm/xe/guc: Fix race around q->guc->suspend_pending access ---
>commit 256a06cec5d42e79b9711d9f1861b3717e23b08f
>Author: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>
>drm/xe/guc: Fix race around q->guc->suspend_pending access
>
>This commit wraps accesses to q->guc->suspend_pending with xe_sched_msg_lock
>in the suspend, resume, kill, and ban paths. This ensures that checking the
>flag and calling suspend_fence_signal() is atomic with respect to the
>asynchronous clears in the kill and ban paths.
>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 9036f89dff7d9..c565c1d32d3a4 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>[ ... ]
>> @@ -3222,13 +3234,20 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>>  		smp_wmb();
>>  		wake_up_all(&guc->ct.wq);
>>  	} else {
>> +		bool was_pending;
>> +
>>  		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
>>  		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
>>
>> -		if (q->guc->suspend_pending) {
>> +		xe_sched_msg_lock(&q->guc->sched);
>> +		was_pending = q->guc->suspend_pending;
>> +		if (was_pending) {
>>  			clear_exec_queue_pending_disable(q);
>>  			suspend_fence_signal(q);
>> -		} else {
>> +		}
>> +		xe_sched_msg_unlock(&q->guc->sched);
>
>[Severity: High]
>This is a pre-existing issue, but does this logic misattribute a SCHED_DONE
>message if TDR races with an asynchronous queue suspend?
>
>If a queue is being suspended (setting q->guc->suspend_pending = true) and
>concurrently a job times out, the TDR handler stops the DRM scheduler,
>trapping the SUSPEND message before it can execute. TDR then calls
>disable_scheduling(), which directly sends a DISABLE command to the GuC.
>
>When the GuC responds to the DISABLE command with a SCHED_DONE message,
>won't handle_sched_done() incorrectly attribute it to the trapped SUSPEND
>message because was_pending is still true?
>
>It looks like this would call suspend_fence_signal(q) and trigger an
>assertion failure, because the queue was never actually suspended (the
>message was trapped) or killed (TDR only bans it). Additionally, skipping
>the wake_up_all() call in the other branch might cause the TDR thread to
>wait and hang for 5 seconds until it times out.
>

As the report says, it it unrelated, pre-existing issue which should
be addressed separately.

Niranjana

>> +
>> +		if (!was_pending) {
>>  			if (exec_queue_banned(q)) {
>>  				smp_wmb();
>>  				wake_up_all(&guc->ct.wq);
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20260818183838.273486-2-jagmeet.randhawa@intel.com?part=1
