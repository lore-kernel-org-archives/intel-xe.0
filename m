Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81ADCCD8CA8
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 04:03:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9E410F203;
	Fri, 12 Jun 2026 04:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eETJqvU1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B59D10F203
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 04:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781236991; x=1812772991;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iSZ4SafpoYdG9Ja1aRVIS9pEOZHc5r9lGV0bmhv6hA4=;
 b=eETJqvU1c8CSyRtXMKa2KSsbUVmckpmZKM0NGb1Rf67bb2m/XIIV1e8/
 XZa9hnjAB2Wjmya+Sk0RJe2omivbWhQkiUoomG7HHcRUcP0G7I7BTeKCr
 7vLb68FbDeOKtsYqtKwuVmhLbGrpP0euaiEMxTCDjlFYphoky4WikNz/i
 FfDT4N6NcrpVQNnAUTNvc/+bejtR0L5S1P9nbkaTwr6Y+rG8IW9SML5vt
 080iyfSTk+zMSj0TZZQ0eR+kTiRbFby6B3Axdgy9itlWKVBmPWtYCdwSc
 3Yx3fidutr9HY78P9i7Tjtw/fRmyGohEq0PuaHrtBE3MgNPnmEl+j22xQ g==;
X-CSE-ConnectionGUID: +03Oaq5ES/u4+d9Q7Ftk0A==
X-CSE-MsgGUID: 22uT6OT2S1OMuJ9zefhYpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82111011"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="82111011"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 21:03:10 -0700
X-CSE-ConnectionGUID: 8OfU+ymARneU6HfqyTkgxA==
X-CSE-MsgGUID: Hyw+MVTzS4Kl0bAhvLR52A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="246739045"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 21:03:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 21:03:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 21:03:09 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 21:03:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfSFhmBL1wjr6aPuTLi3rKQp4adRLhvIloB73PrF4H457wlGSUQisy11xSgLK2ZnmeFXZzMidYjpCQaJHI6Yk4XnTr4rJw11Ly7QIt6hc6N6zehT01DO2fveOMALNHcnR03lnsepBL2RuaZp3lwUub2ajoFgvs8oyVo7zvzPEGTwTVEe5fFOnVb+avyphXfHdWHv4rpUZPpOAXcVMnGKjpjO1x31K/m6VPCoqH6mDyNp+RKNRkUD77oW+EVfN85VEa8d82tPuYfFTlqkxrrjPnXE/vIkO/Iz5KbK/b+LWu2FScRSl+J2e0DxkY/OCtl5m1nGSDew4/iP1IdSlFm4iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vutKenXAv1kL6yNJYNNDZ6nB3i/J0UboAiOlMn2se7E=;
 b=NFI9YgBcfvXS+x/iJSsKbOjl2HxDBfjmLO6T9uM2TWRVtKFeXllzxwfKWjLXajHzARWz/j+17k57yHRUiDpOBfxuqUlIx/wvMqZ4AiGfcj8Q5/cnsprSai5SYdAeXcMoCjQnTnO6EAls4rm09dLwLBU/3BYx1rx1RXqnoQQQxEp4zlzG7C8RSN9bsVsIO3oufL93v/pwljLb7NkUCQv8r3VBLtb3vXfkLCwVAVbydJUzkdOyemR7yMn7PsWuvSuue+Wfppny71Lkpqis2H9kIFbEAS9RPIw4fhJHrThFAVKIB7VivEG1nMtuzz95m8xdExn+9qLohCpmBjiMP2umYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by CH3PR11MB7323.namprd11.prod.outlook.com (2603:10b6:610:152::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Fri, 12 Jun
 2026 04:03:06 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 04:03:06 +0000
Date: Thu, 11 Jun 2026 21:03:03 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Francois Dugast
 <francois.dugast@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v3 3/5] drm/xe/guc: Add suspend refcount to exec queue ops
Message-ID: <aiuE99Kwu7Y3EqNw@nvishwa1-desk>
References: <20260525133051.91636-1-thomas.hellstrom@linux.intel.com>
 <20260525133051.91636-4-thomas.hellstrom@linux.intel.com>
 <ain9HQbDMBOqUt1o@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ain9HQbDMBOqUt1o@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: SJ0PR03CA0098.namprd03.prod.outlook.com
 (2603:10b6:a03:333::13) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|CH3PR11MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: d5c03377-02f4-4225-2f18-08dec83781c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: L1BHz59UfznkA5y1z13xIvf/VDulRVRc5htKmp3fUb7ipLrIOcNqaica3OUoxz5rrIaT7gfccJ2WRJOs5X4X7JJUC9NLAymG5VMGHJE8PFFkh6LdhAclWhL/B6FaWIZOLcbxVI18TlNYnygkUeKCsSP+4hDzWaLMMjJeyGFoe0yVK6gZNQyX/YoBJnGfI3d3+Kon3eY76FGuCAJrvzNFKG788XVU7sZl/bhyh2qFaJuxL+fwb69Ksvxt4kNK9y+1JU+19vC4xt7j/iu5pplUzdP9LNBeHS9b9IS8tOieeBvBpqfFv8AGrwblY3yUjJoL2KNLFQI7yeGji5Ois56WA3W8W2Ck2l3o/qAlBtkokLFANtnBJuQkvEtS4hpAQvCCGsLZKJcUd8tu78xYlQZgCf//M5b2A9wYJ49ibyBCu60kThd8lMxxXuX2bDf4aNGchj4sp5PofWXUi3Qgm25kiAFXNpz5ctMIgJBBu/wjW6QNiMSpETU0lGA92rDeQkkYiETiH0XkUmLrQDDj9FlmkUrBtxlngVyp6Wra4M9JDiYJj8oOME+Eod0lKlWWiBn66FiqiWq4k4QuJzHQBm8m4ZL5llSuyXKydcGwBbwFRWC0aJHEcEU/P5GRtEUnirnMIE6Eq1YTtYeuBBlwAZiP7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0NoSzZVeHhEcDhTV3pzaTBENWtiOUVJT0ZkbURKUVlOQVdsTHUyRW14Qm1x?=
 =?utf-8?B?VmpCMlhtRmpPMlRhLytabzRmZC9qYUphZEFQYkV6bUNTVll2QktXaG44aHo5?=
 =?utf-8?B?bEYvanZheENVUTYyWkpHVWRPWExoc2Fpd2lEQWZzalA0TzRiNFN3QWVmS0JG?=
 =?utf-8?B?cGdvQlJQRkI2bVYzWDJxWmo3dlhDa3BnZno3bDhvVlRWWHo1ZzZaL3ErMTdF?=
 =?utf-8?B?cHNiYldhMlB0MC90TU1SUUdCU1VLK0Q4SnJ2NE5BN0hoWVllRzQ4RjNobmcz?=
 =?utf-8?B?clRxS0YvMFhWdzBWQTlScGlzRFl4YTB3WFUzVjNZZTM2NTkxU0RwbG9TdmR1?=
 =?utf-8?B?UGhyai9SS1oxdkdnUjNiTlIwZlBaTzZvQXB4OTBTRUppY2JVOGE4Q2xDR1Ax?=
 =?utf-8?B?aTBmS25zMUVQVHhtWGp2aEs3ZzUvRk83UnozTlRwdW9WRVVhc3hPT3ZnZ2JV?=
 =?utf-8?B?K0VFS2xkdDAyZklmeFJBcGZSL3E5aCtQeWJSZ3FSdXR2Y0t1YmRsL0JiWllH?=
 =?utf-8?B?TFpzYUhSWmc1L2ljUFRDRTlaT3NGUDlVcEFlOVoyOHVCZ1NldVZsM2JMSDNP?=
 =?utf-8?B?bWM5STRoY3ppZjEzTHZaaGV0d2xMVUlsR1VSNDBNbXBueEJLc2NXQVYzV2Ro?=
 =?utf-8?B?R3FYNEVXUUZGT1BIbTNFbVhpbHljV1RxR3JTNENHdUM3WGhMRy9DVG8yOXpD?=
 =?utf-8?B?dmJxQ3pIQ2MxRjdoSUFFZGliZDlYQkVJL1NvYUNRMlp5RFVoVEdUMWZQdDRv?=
 =?utf-8?B?Z2xsb0ZTMGlPZDRHa0l5ZHovbjlYemdIcjdac0NIVnVlbWZRVHB6MVJZV0Q5?=
 =?utf-8?B?VElQb29nTmhad1cySytEdndMYVE2bFhwYlh6VkdMVGJUWTVwMEw1Vm1MTnpU?=
 =?utf-8?B?Mkk2dmpqUzdiN280VVdSMGZRNXBNd0laUGdBQkdtR24xZGc2eGhpQTZxZDBV?=
 =?utf-8?B?VDM1K3Z1M2ZES001QURIWTh6bitBb1k0MktXai9pL2M4TTZYUG43L0tnTlA5?=
 =?utf-8?B?bm8zMWJOZHZ4RG9PVm9ia1llbXM0Z3NMZHRNNTFFbTJqQ3l1VWNNTHhZMGJS?=
 =?utf-8?B?M1BNVUk2YzBXUFNzWG1BVk9keUdkNlhOQ3NJbDZJZG5SSlJHQ2ora3NYY0d3?=
 =?utf-8?B?alVDcWtWaUJxUzh3NndQQVNBR3c0MWVNMWFsMzNmR09aWHB3WDBxOFMwc0sy?=
 =?utf-8?B?bVJmbEIvUkJmVExUSzhDUmxsTytLZkczWGlmdjlFUHlNRUlGWGFOaHlKUnRR?=
 =?utf-8?B?L3VaVDJtWEcwNXdINENhbkxwZG5OV3lUM1N1VkJIc3lNaWhsbVh4Z0ZjN1kr?=
 =?utf-8?B?WGdzcTZBY0QrSHYvMWt2OXhocGtGU1E0bSt2clN2R09veURBUnRucjQvNXRC?=
 =?utf-8?B?U1ZaNkpuWjkxdnk3WFI2SFJrQzhORnJ1YkptRUtFNGVHYmVvSjc5dGEyZ1Rw?=
 =?utf-8?B?MUU5Y3dIQUgzQlY1NlB6VmJTSkR0L2ZKOGVyTjNHOE9MU3dpaGxnM2pTTlgx?=
 =?utf-8?B?Y0xWWktyMFM2enBQbkFZZzBXRVJ5V0tjdjFJS2VGckYrdndmQ2liUFh6QXpp?=
 =?utf-8?B?NW5rc3hxZ2hoY3BoUW5iUFpEZ3NyNS93cUtxQWFIeWp6cDJjeDlLd2QwSkZ4?=
 =?utf-8?B?SzI3VmlUczR0MjJ4cTBQOU5CbW9Fak1BdzVjdkpzY0p2VWt6ZnRpa3FJdExB?=
 =?utf-8?B?TkNYMGUrV1NhS3RCUDkwQXErM3gxQW9yaGcxckoxNGo2Y1ZVbys1d2JNa0ln?=
 =?utf-8?B?dWxOcmVkTktYc3BKZ2JTRTlmaU95R3YrYjdUMXROS0FTRWVTQUh4TzdWVWpB?=
 =?utf-8?B?dlYybjBBQnk3d2szZDRZR1pkN2RzZkNUUU9TZjgvcTdFSlROa1NvWThtVFhX?=
 =?utf-8?B?SlZIUGVZYUJYMXNoUmRoT21DeGZ5UDcrMm9MdEtVVXdzOXA0YVRSK2NBdzJC?=
 =?utf-8?B?bFlXS29xS3B0U3lrN2xRNVc3dXk1QnhoU2RscHk1UE1EQllQcU9XR1hPUmZD?=
 =?utf-8?B?R0w2Vit3QjlzVzIzTmZQa09MbGlMQTBaTFYrUHgxb256S09Xb2VoK3NxQlhy?=
 =?utf-8?B?VUtydjkvWDhBejBYYmNHcDBVTWFaZitUcWt0V01qeFFLc09ydy93dEEzdkhF?=
 =?utf-8?B?Z2pLYVVFMysxZ05wWWx4UDdUWVFxYXp2UEY0M1o0YkRZOElXWThIeXBCVldq?=
 =?utf-8?B?ZjJZZUE0SW9MaHhMd1Aya2R6L29Dc1JPSlhrVTRyUXBXZ3Y3eWVGZE5qcmxS?=
 =?utf-8?B?R1JLbC9WU1l0WWYyQlhFbklSK3FFVlJXMFdmaW9YK2VCU2RXUzZyVjZOS2RI?=
 =?utf-8?B?LyswSHV4SGEwbStwUnpMRjRJelZDU3VnQnkwMkxYY2k4aFU3SW5wUlVwNmIy?=
 =?utf-8?Q?CL26mIFYxN0Y0EtwV2XTisvH503lsFwnsdZSe?=
X-Exchange-RoutingPolicyChecked: VxqU5QgaKq3foF743pd5mA19sMvX/wdiX2x4/LVRg4Yg71I8HFR/OcRwUkBWElDOsqLiJkIDNhO1QBy3Jm/4lHMqr5d45OUK+nm2CNIrdhwDZrNDpkFCp0zTZImGWznVik/xSIxeeZlQA4lTh0PFvdJsLTl2A76zdBUnTWCuMiU9giVfcaLD4L2VDpP/0EXgU21fxehyz55+hNTzsHcsOUxcXrPu/fxOqYS4q4FH68okqfoRUO7pFAs2OYDb3FdM8c72N5EWPOrHukBzUHFa+QKGSX6SBU8gxiHfaWHIAwZ3uvTYLNlWUxXP5vfpSD5FaIr3i0ejePg/iJmY1SjBPQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c03377-02f4-4225-2f18-08dec83781c1
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 04:03:06.0100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3mUSqe8yeqhnoHNyBzNb8WDftGUkGi6wOgZ/UMgHmtcf7FfbRUeHeVAHTDUk6O7qp/dlCxxaoutOiwPb6QMvlx6EMC9cS0gSpfSFJ2mo80Pyp1ZznldiPCmGJ8xPFzgi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7323
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

On Wed, Jun 10, 2026 at 05:11:09PM -0700, Matthew Brost wrote:
>On Mon, May 25, 2026 at 03:30:49PM +0200, Thomas Hellström wrote:
>> Concurrent call sites that suspend exec queues (PM, mode switching,
>> preempt fences) each need to pair their own suspend/resume without
>> caring about other callers. Without coordination, a resume from one
>> path can prematurely re-enable a queue still suspended by another.
>>
>> Add a reference count to exec queue suspend operations. A queue remains
>> suspended as long as any caller holds a suspend; it resumes only when
>> the last caller releases it. Each caller simply pairs its own suspend
>> with a resume without needing to know about others.
>>
>
>+Niranjana
>
>The patch LGTM; however, this is likely to collide with conceptually
>similar WIP work from Niranjana [1] for multi-q suspend. I wonder if
>your patch and his could combine ideas so that his solution is congruent
>with what this patch is doing. I’ll also reply to [1] suggesting that he
>take a look at this and perhaps rebase on top of it.
>
>Matt
>
>[1] https://patchwork.freedesktop.org/series/168035/
>

Thanks. Yes, it really helps with multi-queue supspend as we can piggy
back on the suspend_count of this patch and no separate counter or
status flag required.

Can we fast track this patch?

I also have couple comments below.

>> Assisted-by: GitHub_Copilot:claude-sonnet-4.6
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  7 ++++++
>>  drivers/gpu/drm/xe/xe_guc_submit.c           | 24 ++++++++++++--------
>>  2 files changed, 22 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>> index e5e53b421f29..1207d51cf770 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>> @@ -49,6 +49,13 @@ struct xe_guc_exec_queue {
>>  	wait_queue_head_t suspend_wait;
>>  	/** @suspend_pending: a suspend of the exec_queue is pending */
>>  	bool suspend_pending;
>> +	/**
>> +	 * @suspend_count: Reference count of active suspend requests. The
>> +	 * exec_queue remains suspended while this is non-zero, allowing
>> +	 * multiple concurrent callers to independently hold a suspend without
>> +	 * prematurely re-enabling the queue. Protected by @sched.msg_lock.
>> +	 */
>> +	int suspend_count;
>>  	/**
>>  	 * @needs_cleanup: Needs a cleanup message during VF post migration
>>  	 * recovery.
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index f1a6f13011b5..7800a9d1d377 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -2131,15 +2131,18 @@ static int guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
>>
>>  static int guc_exec_queue_suspend(struct xe_exec_queue *q)
>>  {
>> -	struct xe_gpu_scheduler *sched = &q->guc->sched;
>> -	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
>> +	struct xe_guc_exec_queue *ge = q->guc;
>> +	struct xe_gpu_scheduler *sched = &ge->sched;
>> +	struct xe_sched_msg *msg = ge->static_msgs + STATIC_MSG_SUSPEND;
>>
>>  	if (exec_queue_killed_or_banned_or_wedged(q))
>>  		return -EINVAL;
>>
>>  	xe_sched_msg_lock(sched);
>> -	if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
>> -		q->guc->suspend_pending = true;
>> +	if (++ge->suspend_count == 1) {
>> +		if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
>> +			ge->suspend_pending = true;
>> +	}

Bit confusing as it appears that the case of guc_exec_queue_try_add_msg()
returning false is not handled properly (though it is). May be add a
comment clarifying it or add an assert that guc_exec_queue_try_add_msg()
always returns true here.

>>  	xe_sched_msg_unlock(sched);
>>
>>  	return 0;
>> @@ -2190,14 +2193,17 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>>
>>  static void guc_exec_queue_resume(struct xe_exec_queue *q)
>>  {
>> -	struct xe_gpu_scheduler *sched = &q->guc->sched;
>> -	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
>> +	struct xe_guc_exec_queue *ge = q->guc;
>> +	struct xe_gpu_scheduler *sched = &ge->sched;
>> +	struct xe_sched_msg *msg = ge->static_msgs + STATIC_MSG_RESUME;
>>  	struct xe_guc *guc = exec_queue_to_guc(q);
>>
>> -	xe_gt_assert(guc_to_gt(guc), !q->guc->suspend_pending);
>> -
>>  	xe_sched_msg_lock(sched);
>> -	guc_exec_queue_try_add_msg(q, msg, RESUME);
>> +	xe_gt_assert(guc_to_gt(guc), ge->suspend_count > 0);
>> +	if (--ge->suspend_count == 0) {
>> +		xe_gt_assert(guc_to_gt(guc), !ge->suspend_pending);

So, if the intended usecase is for user to always wait for suspend_wait()
before calling resume, may be we should have this assert always here
instead of only when suspend_count reaches 0?

Niranjana

>> +		guc_exec_queue_try_add_msg(q, msg, RESUME);
>> +	}
>>  	xe_sched_msg_unlock(sched);
>>  }
>>
>> --
>> 2.54.0
>>
