Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21B4C55196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 19:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515AF10E780;
	Mon,  3 Aug 2026 19:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IgdEI0HZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64FA10E783
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 19:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785784767; x=1817320767;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oPBrsqWh7EMJ1zj1WOBzdi0WUl6l3gl3tpTNyEbSD3M=;
 b=IgdEI0HZKI/mI/6k71QE0ymJrJF5b76ZAHgGRMYCWs8+QCQmqgARee7y
 44L6ApDGaTUgqByArGbX3taq7w6mcN5+gUtL9D8a6k0vkwASnzh8VIL9r
 rY3YY0DUrY4z/6tXOqSLdZcZgONtbaWJNmDV6zz39YcMclRK2xBRshMHq
 oRlzZYKNL5HeQXGl6mmxSh7ABY9GPf2lAgcmT1ReupNeTMt6pqpGD9afP
 bmCf9HoqIamCcdIEkIWKVe5zgorm6sEmeyOu5z7HrBWFaK/o/Drm0jBzF
 bsjkrlX6efgIfSvQT1k5PxZddOGsFLrjGdiroF4kp2y2dOrixbB7enVwQ g==;
X-CSE-ConnectionGUID: Hpqz+0+0QWid8rlChLCQ6Q==
X-CSE-MsgGUID: uQ1VLCZQSPK9MVUWUSNGtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="111885825"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="111885825"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 12:19:27 -0700
X-CSE-ConnectionGUID: /qgYYUjeRluZRgVHtjSLgA==
X-CSE-MsgGUID: BSkVrrcHSVyYK+A9CuommQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="259508998"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 12:19:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 12:19:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 12:19:26 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 12:19:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZ0eUZGXaDMaE11GwTM6cmYD5EZLfovrQY1MDYBQ5Vptyx1o1sYOQN2EDnuj5X41mWP+6q2Tpx9dHrsdz+l514z/pZqRiDQd4ueuoxGwGmQUvsPd5RE93EIfoGCx8EPEsN1WJW4K741+hP/OhvVaJFUrl6GNQWF4IOK/Ofv52mj1SNJcSEmWEr/chQ9M6C0FYy2EQt1bJfz9om0NccwVUi7dkNq/miQA32W2b7rd3NG+DSfXJMkv1HybLHI/3LHywahGOGML9Mv57n2tcNVfO612r/XOiEimO0DJDqjrz/GhcjMrUTQ/3PSbXxIsi33t1Zy4TbNWxOZB1y3VexcQAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEPDQQd0dpwO685agpjDdDWoRjE6S9yYjdrTG/Jabf4=;
 b=vAr2h2ZWoADo9RcN0wA8oFIV2lblVrEY3IuRzLldzF1clTo01NaCp/HBL5s68JqkFpyiqWY71U3m+9wFnvnlRKlSKpWi1oLmVF5DGfn3ZOENWxJoxIwz2MBb+6/+uXHNdA8slPzosDF2+fhb/H4yhq049pdJ4Qy9nlV4tSZPYrE02ypX5kC9CQn3S+sHBercg4Jc6Wc6fX2tx4FrY900KDzCOhH3Gpb9pNV+cFdxkYBEwA+uTVc70raqY0vKTqhQInHe7RayJSqYfJD4lVk9a/YQiGe7ZuVfEfkwwzGQKYEhm3Rhbv/D9vys/kKgzrSAnDawD+D7pKWzh/dwAnFnBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5125.namprd11.prod.outlook.com (2603:10b6:510:3e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 19:19:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 19:19:24 +0000
Date: Mon, 3 Aug 2026 12:19:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/4] drm/xe/multi_queue: track and recover lost CGP
 updates across VF migration
Message-ID: <anDpuohdptVIRcAG@gsse-cloud1.jf.intel.com>
References: <20260731232625.3313657-6-niranjana.vishwanathapura@intel.com>
 <20260731232625.3313657-9-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731232625.3313657-9-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR03CA0223.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5125:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bbc5293-4082-4e58-ad21-08def19420dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: kRXt03Kb1x2MVbCAhDt1/nI0g+nQqq0ZzjBiP1v3mk4GAOXGRYNVDhVxFt8bfZ/BJzoLy+ZmYaKGDYs/Px7vXFaWADzF0ouzCLONsVO4iu+x+cCLJIdDmdEIG3ITbJqFRBM5COO/JDBLnZFi6nKXPzVFTJmNqEuHr22FUiL6q0ag3phxLz1C6p0myZkqrzgmP3EH2GYXOpeWr5QOO5D2B50kizRRaFXUXOl3g9OOyD+hVQhG5YAvUynHinnJ1qlxpJUX13n+SYjpBRTvrK9/RGAHVzdDmEIUZJoAvqbkpZxy7ljTR/fvxKxhS/dVv8KgSwuoJvB3e7eBd0F1elOK5+Bp3saSulWNKsJFcD+uMIMtussV/glZ42umtm2TbpY9zaNky9nuoZeCpob/zAnXTb4ybMg9E/38PIrqcrnYHf7zuW3aHwJLYKqD663Nxt1ntmWBUEFtsFOZyHSj4ohhHGLpCW1LNkFGhbZ1ApS8Dpx7GR0ZO7aX7a2h1tLZYXCNbmbachIcdZsKjz2duJ7MPpZQVJQLi3YfE56RFD45fsRWgkmDfn/yYFCKLjmdtxlzqCbTcKK5ap1tykaE29dlMYtzSmMV3sTfVgwTKwg+D0NwVfpGuoWduyV5TKAlv8K+6kTfyTBXMEf8enRAqQGLZpIsU/izS5Q/7mtBjY28PsY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHNKTnJTSlBOUGdIMlFDTlZlVVFCaWZnb29zMG45OWJKMjVQT2dobG9GQS9m?=
 =?utf-8?B?Z0F1dUdVc1RPYzdBYU1nTnFGUER2NHAvRnhkdWVmcnYyWmlpOGtPSFBBWDU4?=
 =?utf-8?B?dkVCN2QvTjB2Z3JpZXNSMUY3M202Y25lc21QWEw3ZWV5eW5ES0JDTXJYQWt2?=
 =?utf-8?B?Y2xCbDN4OVFjYlgxL1d3eFR2TFFjOVdsTDNPTWJhTlRMQlVBRXlDZ281MXdT?=
 =?utf-8?B?cEk4bUpHcTBleEdKdnlrVFJiZmEvVUM5UU15UTdRSkUrSXZQVGFlT25LMnNU?=
 =?utf-8?B?ZHNmMURIVGNkTk5wNjgwenlsSlZUajJDRG4ydVcrNnl0ZlAra3dwU0o4Z3hr?=
 =?utf-8?B?eWpHVzltL2J5cUlHY2RvTHNRMHVWY09ISHhjZ004ZWhjS2tWYzdTemFUMXhq?=
 =?utf-8?B?WThCQkNUUXJQUjV3bGtWK2tSWE8rMWRza2ludGVGL01BemZPWmVGU1pITU5v?=
 =?utf-8?B?WDEvUlZ5azhKUmFuc2dqbmlGeTVLUUJUTVlCNml1WG5mSlB1MXlQYWFxeGVF?=
 =?utf-8?B?by9CVTNDQXFIVHp2MTZ5ZnpWNE9ieGplYWZHZE9aVEtaZ0FOSDloRDVmR0Fj?=
 =?utf-8?B?dDlEY3dzWmViNVFIYnBGRm5FcXQrSklVWG1QcWdRWDFkVXZVajBVMkNMbitD?=
 =?utf-8?B?bzZ0a2RSb3FmU3pBK3YwNkpaYjJxNzNOMFpzQ01OQ2sxZkZzRGxzVFgvcmxN?=
 =?utf-8?B?clA2bnlCaTB1QjZtTGVlSy9KMExkTTJoNktWNk1TMVpYcnloRGFuQzRSVU9o?=
 =?utf-8?B?Wm9DdVpXOWlmMGcvSXVONlUvbGVuR1ZlUTlmY0x3d1orNnoyY1FlbmpTdFBk?=
 =?utf-8?B?eldsbE5zTS9YVlR6YzlKVS9jVk15OFM3MzdESHJjRzc2TWV0NzB0c3E5ODhO?=
 =?utf-8?B?bzZQajhOckJtRmJ6aEl4YWF3RFU2ajFURGNsK1ZOMFp0SERTcjJPTHpyck05?=
 =?utf-8?B?aFovRHhlRzhXVWp6TW4xWTdVckxoMzdVcmlxRld1bkFnb1FsWEZtMHY1RlJ4?=
 =?utf-8?B?TG1tb3ZYeDVENnlmdFFQM2FYSVpYcElndDdrT0xBWTNGcnY3VGJMV2FYeGxh?=
 =?utf-8?B?dytXZUJNZnQvb2pjM3R2NnAydVFKZG1WOVlGTzVTOGJ3VkR4Sk9xcUEwVmY5?=
 =?utf-8?B?L0VQWlVjZlpLeENqQW9nWHFMMlFrU2pKRjR2dnZKSngwZGdLZUtWY3ZKakpH?=
 =?utf-8?B?Z21TV3UxanhQYjk0TnZkZWNBZjJiRnRTaWpOY0NaalBzYW9hSUlhMGZQczBa?=
 =?utf-8?B?V2pmS2prSW8ydUs1ZjZGTERjck9Ob2ZvTWM4SCtibW1EWnU5TnNhVE1uZ3d6?=
 =?utf-8?B?NlFrMklYWUxYY1FtUkV6VTNuK0ZNL0RUeVdpcXgybWVtWkZqbVlYT2g5TlBX?=
 =?utf-8?B?Vis1enIzaWQvcE9aRHpJRkZTaURMdUx0NlhkVHdQdlllcXVwYVhNb1hkSWxl?=
 =?utf-8?B?ZXYxVUF0MGErNGZodmNPenp3SE1ka2JONEEwb1dJTEl6MTVrRGJHbldiV0hI?=
 =?utf-8?B?S0gvVUsyWFBXbTgyMjFvKy9MOEVnTlZmSUFqR1lnRUw4eEFOZmk1d3hpU2Zw?=
 =?utf-8?B?U3YvMCtnOFo0b08zRWliOTNla0JQd3R2TU5takNvUGtLWVh1eWY3NGwyV1NV?=
 =?utf-8?B?YXJFSlg2bEt0Yi9OakRuRmxDYnZUQndrSmZIYVpLeGY3MzBFcWd3dys1NGNv?=
 =?utf-8?B?OUFMS3lMM2ZXVUF6cndkS3R5YUttR1BpMERpNTg1S0I0Y0h1TjUyN2xVMm9P?=
 =?utf-8?B?SVQrSHJNQVQzaGRna21DYTVuK01VZTZzQ1gwalRxN0kzMVlVbjd4WFRINGJl?=
 =?utf-8?B?WWYrTlo5UjZvMElNV1lpck9jY1VRMktaZGpGVlQvZVRPTWFsVU83UVhQZm11?=
 =?utf-8?B?TWsyRVRiZ290eWp0NDVmTk4zYk1zK1UyOFFZR2ZzQVhiUmNpWEdrZVd0Y3Fo?=
 =?utf-8?B?bEtDSlkrWlVGM3dRQndTTk51ZGhRSUJ6bXRoUTZQNXVJbThVbjdCUm04TXNj?=
 =?utf-8?B?eGZDSzdmY056bmV1cG9ETFJaVHZpWUdzT3J3UWhGblpTdGtMK3MwaTIxWUIz?=
 =?utf-8?B?V3ZBdzBLSU9wMDBTK283bGF1QUFFdzNhZTJvQ3JFR2RpVFNiWWtzRU1FZ3l5?=
 =?utf-8?B?alFwUUk4UXNXVW4vN1pCNlllRzZwNDl0ek9QbVhESi8yVGFQVGs4bkVPRmNu?=
 =?utf-8?B?YVFpbHIzUURROGNhaUFqNE1qalRoajN4RVB6UWhpY3pLK090bjVwYnJHR3k0?=
 =?utf-8?B?d245LzZYOXFFNFE1NG9pbThQRUQxNTV5ZGlIdHVZVnNtbUwzVXZZTFFtU2pi?=
 =?utf-8?B?SWVBUHpza3YyZTlhSDVEVFoxNHdmV2pyS0x0ZktjNG10cHZPcDBldz09?=
X-Exchange-RoutingPolicyChecked: MD93TSi4VvYCRXK4iyiHv+qwrapLJKfZCvcjQ8j3bIl1Fy6tLnFJRokJYZD2s8XuDq3RAIRB3x9fBPALispUjyeEzQwVyH4P6gvQDVfARn+aa1oipSttlAEeSYoPSIA/lr7p74CbjW6WoZB8auCb1d0qqy67TF1TSayad8XpPPigylolTxSBVH8sL45SL8Jl0xTArJKkQh7KvxUdcIEz5by4SgwMjks1h5i95He+jsBi7Sc1rGcx4gjNmGdbFdFH1K3Jv6VoHZknGOc3Sac+dWj6fjcOwowQgGoEYEzmR87nNg4IKok0Eq9f3LSBEkE33WCbzVDU451MhBCXN6k9SA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bbc5293-4082-4e58-ad21-08def19420dc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 19:19:24.3852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hUmNwhx1K3TQIMlz12t/K54b7UPt85TfBJxx8yJSb/elvyZajAWgT2JSjzjvjp4xXWpllZfkprDwh2DfZ+0+Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5125
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

On Fri, Jul 31, 2026 at 04:26:26PM -0700, Niranjana Vishwanathapura wrote:
> When a CGP_SYNC (or REGISTER_CONTEXT_MULTI_QUEUE with CGP) is in flight
> during VF migration, GuC loses the message and never sends CGP_SYNC_DONE.
> Two failure modes exist:
> 
> 1. The send was already issued (CGP_SYNC_DONE not received):
>    group->sync_pending stays set and cgp_update_q points to the queue
>    that owns the outstanding sync.
> 
> 2. The wait woke early (send not issued):
>    The queue returned from xe_guc_exec_queue_group_cgp_sync() without
>    sending after vf_recovery() became true.
> 
> Track which kind of sync is outstanding (registering_cgp / updating_cgp)
> and the owning queue (cgp_update_q) so
> guc_exec_queue_revert_pending_state_change()
> can recover both cases:
> - A registration-time CGP bails or is lost  → clear registered flag so
>   run_job re-registers after unpause (re_register / registering_cgp paths).
> - A dynamic CGP update bails or is lost → set needs_cgp_sync so replay
>   re-issues the update after unpause (re_update / updating_cgp paths).
> 
> Tag all registration call sites with CGP_SYNC_REGISTRATION so the bail
> path distinguishes them from dynamic updates.
> 
> Assisted-by: Github-Copilot:Claude-opus-4.8
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h     |   7 ++
>  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  30 +++++
>  drivers/gpu/drm/xe/xe_guc_submit.c           | 112 +++++++++++++++++--
>  3 files changed, 141 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 53b6c0bf4849..b2276559c2f6 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -70,6 +70,13 @@ struct xe_exec_queue_group {
>  	spinlock_t suspend_lock;
>  	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
>  	bool sync_pending;
> +	/**
> +	 * @cgp_update_q: Queue that issued the currently outstanding (sent)
> +	 * CGP_SYNC or REGISTER_CONTEXT_MULTI_QUEUE; NULL when none is
> +	 * outstanding. Used during VF recovery to identify and replay the
> +	 * message whose CGP_SYNC_DONE was not received.
> +	 */
> +	struct xe_exec_queue *cgp_update_q;
>  	/** @banned: Group banned */
>  	bool banned;
>  	/** @stopped: Group is stopped, protected by list_lock */
> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> index acdc24d1a6bd..573b920edb41 100644
> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> @@ -76,6 +76,36 @@ struct xe_guc_exec_queue {
>  	 * recovery.
>  	 */
>  	bool needs_resume;
> +	/** @multi_queue: multi-queue group CGP state for VF post migration recovery */
> +	struct {
> +		/**
> +		 * @multi_queue.needs_cgp_sync: Needs a CGP_SYNC (dynamic CGP
> +		 * update) message replayed during recovery.
> +		 */
> +		u8 needs_cgp_sync:1;
> +		/**
> +		 * @multi_queue.re_register: A registration-time CGP update was
> +		 * interrupted by recovery; the queue must be re-registered.
> +		 */
> +		u8 re_register:1;
> +		/**
> +		 * @multi_queue.re_update: A dynamic CGP update was interrupted
> +		 * by recovery; the CGP update must be replayed.
> +		 */
> +		u8 re_update:1;
> +		/**
> +		 * @multi_queue.registering_cgp: This queue's currently
> +		 * outstanding CGP_SYNC is a registration (matched against
> +		 * group->cgp_update_q in revert).
> +		 */
> +		u8 registering_cgp:1;
> +		/**
> +		 * @multi_queue.updating_cgp: This queue's currently outstanding
> +		 * CGP_SYNC is a dynamic update (matched against
> +		 * group->cgp_update_q in revert).
> +		 */
> +		u8 updating_cgp:1;
> +	} multi_queue;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 13d0ab8052e5..c018bc0d8d6f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -800,9 +800,12 @@ static void xe_guc_exec_queue_group_cgp_update(struct xe_device *xe,
>  	}
>  }
>  
> +#define CGP_SYNC_REGISTRATION			BIT(0)
> +
>  static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
>  					     struct xe_exec_queue *q,
> -					     const u32 *action, u32 len)
> +					     const u32 *action, u32 len,
> +					     unsigned int flags)
>  {
>  	struct xe_exec_queue_group *group = q->multi_queue.group;
>  	struct xe_device *xe = guc_to_xe(guc);
> @@ -829,17 +832,45 @@ static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
>  		return;
>  	}
>  
> +	/*
> +	 * If woken by VF migration recovery, do not touch the CGP or send: the
> +	 * message would be lost and, for a registration, GuC must (re-)register
> +	 * the context before its CGP entry may be read. Flag the queue so revert
> +	 * replays it - a registration by re-registration, a dynamic update by a
> +	 * replayed CGP_SYNC - and bail.
> +	 */
> +	if (vf_recovery(guc)) {
> +		if (flags & CGP_SYNC_REGISTRATION)
> +			q->guc->multi_queue.re_register = true;
> +		else
> +			q->guc->multi_queue.re_update = true;
> +		return;
> +	}
> +
>  	scoped_guard(spinlock, &q->multi_queue.lock)
>  		priority = q->multi_queue.priority;
>  
>  	xe_lrc_set_multi_queue_priority(q->lrc[0], priority);
>  	xe_guc_exec_queue_group_cgp_update(xe, q);
>  
> +	/*
> +	 * Record the nature of this outstanding sync so revert can replay it if
> +	 * its CGP_SYNC_DONE is lost across a migration: a registration is
> +	 * recovered by re-registration, a dynamic update by a replayed CGP_SYNC.
> +	 */
> +	if (flags & CGP_SYNC_REGISTRATION) {
> +		q->guc->multi_queue.registering_cgp = true;
> +		q->guc->multi_queue.updating_cgp = false;
> +	} else {
> +		q->guc->multi_queue.updating_cgp = true;
> +		q->guc->multi_queue.registering_cgp = false;
> +	}
> +	WRITE_ONCE(group->cgp_update_q, q);
>  	WRITE_ONCE(group->sync_pending, true);
>  	xe_guc_ct_send(&guc->ct, action, len, G2H_LEN_DW_MULTI_QUEUE_CONTEXT, 1);
>  }
>  
> -static void guc_exec_queue_send_cgp_sync(struct xe_exec_queue *q)
> +static void guc_exec_queue_send_cgp_sync(struct xe_exec_queue *q, unsigned int flags)
>  {
>  #define MAX_MULTI_QUEUE_CGP_SYNC_SIZE	(2)
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> @@ -853,7 +884,7 @@ static void guc_exec_queue_send_cgp_sync(struct xe_exec_queue *q)
>  	xe_gt_assert(guc_to_gt(guc), len <= MAX_MULTI_QUEUE_CGP_SYNC_SIZE);
>  #undef MAX_MULTI_QUEUE_CGP_SYNC_SIZE
>  
> -	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
> +	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len, flags);
>  }
>  
>  static void __register_exec_queue_group(struct xe_exec_queue *q,
> @@ -881,7 +912,8 @@ static void __register_exec_queue_group(struct xe_exec_queue *q,
>  	 * XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE response
>  	 * from guc.
>  	 */
> -	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
> +	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len,
> +					 CGP_SYNC_REGISTRATION);
>  }
>  
>  static void __register_mlrc_exec_queue(struct xe_guc *guc,
> @@ -1041,7 +1073,7 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>  		init_policies(guc, q);
>  
>  	if (xe_exec_queue_is_multi_queue_secondary(q))
> -		guc_exec_queue_send_cgp_sync(q);
> +		guc_exec_queue_send_cgp_sync(q, CGP_SYNC_REGISTRATION);
>  }
>  
>  static u32 wq_space_until_wrap(struct xe_exec_queue *q)
> @@ -1923,7 +1955,7 @@ static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sche
>  	struct xe_exec_queue *q = msg->private_data;
>  
>  	if (guc_exec_queue_allowed_to_change_state(q))
> -		guc_exec_queue_send_cgp_sync(q);
> +		guc_exec_queue_send_cgp_sync(q, 0);
>  
>  	kfree(msg);
>  }
> @@ -2716,6 +2748,57 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
>  			  q->guc->id);
>  	}
>  
> +	/*
> +	 * A registration time CGP update that bailed when woken by VF recovery.
> +	 * Re-register the queue.
> +	 */
> +	if (q->guc->multi_queue.re_register) {
> +		clear_exec_queue_registered(q);
> +		q->guc->multi_queue.re_register = false;
> +		xe_gt_dbg(guc_to_gt(guc), "Replay REGISTER (cgp) - guc_id=%d",
> +			  q->guc->id);
> +	}
> +
> +	/*
> +	 * If a CGP update gets dropped during migration, CGP_SYNC_DONE will not
> +	 * be received (sync_pending still set and this queue owns it). Recover
> +	 * it the same way and clear the stuck sync_pending.
> +	 */
> +	if (xe_exec_queue_is_multi_queue(q)) {
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +
> +		if (q == READ_ONCE(group->cgp_update_q) &&
> +		    READ_ONCE(group->sync_pending)) {
> +			if (q->guc->multi_queue.registering_cgp) {
> +				clear_exec_queue_registered(q);
> +				xe_gt_dbg(guc_to_gt(guc), "Replay REGISTER (cgp sync) - guc_id=%d",
> +					  q->guc->id);
> +			} else if (q->guc->multi_queue.updating_cgp) {
> +				q->guc->multi_queue.needs_cgp_sync = true;
> +				xe_gt_dbg(guc_to_gt(guc), "Replay CGP_SYNC - guc_id=%d",
> +					  q->guc->id);
> +			}
> +			q->guc->multi_queue.registering_cgp = false;
> +			q->guc->multi_queue.updating_cgp = false;
> +			WRITE_ONCE(group->cgp_update_q, NULL);
> +			WRITE_ONCE(group->sync_pending, false);
> +		}
> +	}
> +
> +	/*
> +	 * A dynamic-time CGP update that bailed when woken by VF recovery.
> +	 * Replay the dynamic CGP update unless the queue is registered or being
> +	 * re-registered, which re-does the CGP anyway.
> +	 */
> +	if (q->guc->multi_queue.re_update) {
> +		q->guc->multi_queue.re_update = false;
> +		if (exec_queue_registered(q)) {
> +			q->guc->multi_queue.needs_cgp_sync = true;
> +			xe_gt_dbg(guc_to_gt(guc), "Replay CGP_SYNC (re-update) - guc_id=%d",
> +				  q->guc->id);
> +		}
> +	}
> +
>  	q->guc->resume_time = 0;
>  }
>  
> @@ -3424,7 +3507,8 @@ int xe_guc_exec_queue_cgp_context_error_handler(struct xe_guc *guc, u32 *msg,
>  int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
> -	struct xe_exec_queue *q;
> +	struct xe_exec_queue_group *group;
> +	struct xe_exec_queue *q, *upd_q;
>  	u32 guc_id = msg[0];
>  
>  	if (unlikely(len < 1)) {
> @@ -3441,8 +3525,20 @@ int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 le
>  		return -EPROTO;
>  	}
>  
> +	/*
> +	 * The outstanding CGP update is now confirmed; clear the owning queue's
> +	 * tracking so a later migration does not needlessly replay it.
> +	 */
> +	group = q->multi_queue.group;
> +	upd_q = READ_ONCE(group->cgp_update_q);
> +	if (upd_q) {
> +		upd_q->guc->multi_queue.registering_cgp = false;
> +		upd_q->guc->multi_queue.updating_cgp = false;
> +		WRITE_ONCE(group->cgp_update_q, NULL);
> +	}
> +
>  	/* Wakeup the serialized cgp update wait */
> -	WRITE_ONCE(q->multi_queue.group->sync_pending, false);
> +	WRITE_ONCE(group->sync_pending, false);
>  	xe_guc_ct_wake_waiters(&guc->ct);
>  
>  	return 0;
> -- 
> 2.43.0
> 
