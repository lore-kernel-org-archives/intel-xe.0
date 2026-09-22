Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307BDC982FA
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 08:07:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D270F10E179;
	Tue, 22 Sep 2026 08:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NyDce5uy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56F510E179
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 08:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790064474; x=1821600474;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=p+6T2sW6+DsB67jV+pUfssvg0SOfTISEC7+gJ6190ik=;
 b=NyDce5uyGFslcQzf4R9MT2zCPWPsEOEwE0MY1c8+bgycj/r3i2gy7wJs
 fAfckEYV5CnlGqTH7Y8BNnKbt+RdXf0TrmRI3yMb2AmfKxegjvi9agUUW
 tPbfn3XDv+0y/L5g6npmT19zTu524NFGzYXhp37zT596aXpvcMxpnogNM
 FECLp0HfPMjjB2+toh8oY0ucAau2GzKtKajWEOixPJ7fdXoD9V47x5vpU
 h3AAxSMF6jMB6cUGjmcfsy8M0hBEBVuvJUKoQsc6rleV/XFMQ6emeytGa
 5qUNQYsRbXyCNcDQ1Iio+htV2XadkO+xqd/kK0GTEDlSL+qxJ2fnvVRqt g==;
X-CSE-ConnectionGUID: y1PRqManQRy6HNAkSCx/ag==
X-CSE-MsgGUID: ThCZocQuRDO7zFocRmuF0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="116166176"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="116166176"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 01:07:54 -0700
X-CSE-ConnectionGUID: F5uXBwYXRg2cuxxxqyUnMg==
X-CSE-MsgGUID: hNTcVFdnQDWPvWeCUprc7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="271574409"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 01:07:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 01:07:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 01:07:53 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 01:07:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vCLu+WZYbJJpccJWqDhlNB6Bkn4rezldxXwtlyJQmuLycynqDezQwFL0IIrbYNM5ebQN9sS4plrEmoGl7SlsPdROBqNVHp7jsUGM3ptaCTDzCRIk5pnJ7cHlyxi2XDR/808c2Obo+HCTxw8lArKzkQunm14EBTP/hVWDLqBzq5SpuJYb/8SUR64MeANSUqKiJRG5KMAN/AN5kpaABrNXh3pvgrVEufIbeRae/mfqyXlgKprQsajt2Z35YyKa4Gpg4f5/gGBaho1VU+G5YLiFe/88gXotbl4loivK1YgaKn4spSr/5A4gBuvcKOFQ7NuZA73Meib2tYTePhDcKABeVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hG58c7XP/BxRz5995xY/THarA0PD3J8EYe6GzgZ5A8E=;
 b=obypR3S3CVY25S7VTYUaBwqFRbZ6gcizDIZvmWTm5as0zFDlPD2JLGrpEcRMw/MnjitrQTBC2r86aOAehakJp+FLWmjXKips+onkXUHfAQgpkR6vhMJRB6hczwg0WM8FQNzrar8ucyI5cl2PyFyRXuhDzsXNoi6Hlu0F4vURewgdPJPzaQ5+o6/FdLbvlihlCszVT0HVr/jw71h21ocAn4Hj2NtV3ZiQoCM3d8GFHizMB66p8SpTdy8o6TWBOWwHHZDs1JyRi7FYb1lLyfvnJj05cHWrtUCCK9dRHa9HpUjHUKgLDtPNmvUrAaKAAlG+sYm63e08gDlUijHs3XuM2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by SJ0PR11MB6790.namprd11.prod.outlook.com (2603:10b6:a03:483::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 08:07:46 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 08:07:46 +0000
Date: Tue, 22 Sep 2026 08:07:12 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Jakub Legowski <jakub.legowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <maciej.patelczyk@intel.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH v3 1/1] drm/xe/guc: Fix wake_up race in handle_sched_done
Message-ID: <2wqmigdd42uq6uupdolxnfl67gob2u5rymw7joasbqauaokimf@ynmehd4i5nve>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260910121759.1835037-1-jakub.legowski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260910121759.1835037-1-jakub.legowski@intel.com>
X-ClientProxiedBy: VI1PR06CA0106.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::35) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|SJ0PR11MB6790:EE_
X-MS-Office365-Filtering-Correlation-Id: c277cd07-6812-4966-42e2-08df188095f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|3023799007|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 9YOWx03PEw3QEDXvKs35doDbBLb5+KvSMsR5NFyx1MdhO415ezz/grei1Wbx/4m0feWOqUsjf6ORbLxcT//3vnWOKRT9inlWCY0IvRsmOliSlVoeF8YBi6eZvzALq00y8GfsHXmLdpZNKFMm1VMx9Rg6XCtllFP5njAlD50aMVvPKtNXcPRogpej5lKshZg54VYTv7U7BUXOE/kHXxDiQpi/EPvIrmaVjew8wCqtJK8AcyYwPYFUTXo1qX+ckdabPA9FeUInveLEbbYtvO9w8Xy5OhECGf5t07HwBgyCHrPZrtDSP55Rr5aZGROgrSikQtj1+fIJmabWZayCrs/1M/nbY9xlUjvLA5YuJTDgdBxu8Qfp9ytzOKBmZrFmrfzwZdOFd+kXIjsfSH1OQgjkMW2/syp55cxVmwvApG6qNgjBUPvwVhXVOZOc+PmcCgFcXEbgyBHw2DeQnxsXaugIp97z1T3EaXcVMOJoW5AMaV1BySE/Yup9anZdrC1S+O+topglV9Hu1E939TvjAZXpSjPh+TAhFZDITn8gC/FogWFy6Aldq4VIKVPAK1bXABd1R8x83PAw3PbyqwXOhvyizRwuchBfF4+7hw0WT3Lr1vIe5lrwriFP0pZl4m9Ts9hg6FfB33fvZO8cEvRBhm5O7r/hEksOrLur4DTp1jvPaus=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(3023799007)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0UrcDNsVVkxQTFVWHRVWGNGRzE3a3lwSVZnWFVSUnB5TTNjb1ZVaVpMMUMy?=
 =?utf-8?B?ZE12MDdndUN2eEpUK2VEVXo1ZGhWQTVnc0NERmI0YjdPajRvKzQzemFGd2V0?=
 =?utf-8?B?R0k4VGJOaXU0MklqOE4vQTFXd2ppT3J5T1poZzZnOFA5NzFoZ29WYnNNdHVX?=
 =?utf-8?B?VlNBK2ZRVFYrVm5CcHhSNzNXWTRQeVlMdktQbC96QjVVa0d3Qm1TZkZuQjVr?=
 =?utf-8?B?ZGtzdW1QTms5cU5DeFFEK3Fua2pPL1VRdkFTZXNTdktGWGFoS0ZUZG4xRFgx?=
 =?utf-8?B?Ty9zNm5zLzdublVCRis2a1RwY0Q5NUsvY0tqWFZoYWRmWGZsN0ZBTkhQSWJS?=
 =?utf-8?B?WVJZOTR5OGZ4MzJ1b1JkQUh2TGI0V0dCU3ZjTWpIbjI3Q0dlaG5hTDNNSGZK?=
 =?utf-8?B?WHQ1ZUZrUTFWQTJRanZNN091bVErQy9iWS9TTk5oNWF2b2hCTUR2T29XcnI1?=
 =?utf-8?B?T2RYbGJGQ0RCR2RobXV6Q0FhOHBGUzNtOVFtTkdUaVEzM1lycmVFYktLKzN4?=
 =?utf-8?B?WjVHV3F2akFzWDNJVXEwanhYS29SNWlPRmFSSUZqV3ExcHAxSXhER2tReldm?=
 =?utf-8?B?WTFCU25nQXhoV2xKT3dnRU5TVDFIWEd1eDhqMk1XZHgzV2RjQkhPWEllRnpI?=
 =?utf-8?B?YkpGUkdRN1BuUW5YV1V1d1UrQjN3ZnRjOEJuYUQ3TW5QejNKY1JBK1hvOG93?=
 =?utf-8?B?N3ZmTjlmT3hXKzQ3OVM4WmVka2M5WVV3UWVyUTJ5bUo1RnAyT0x5MDBWYUxS?=
 =?utf-8?B?d1F3djhHOCsraGFGbzAvM1VaQXpJLzcrejQ0OXFLek8wNzFkb3FTeEhISWk0?=
 =?utf-8?B?TEltMi9MQ2pid2VrYkxlZDRVOUptWUJJWFVTd2RHbzNUMHRtMkM3SU9KL2Vm?=
 =?utf-8?B?SUJEeXFURFJNY2gxaUFscnJxYkE1WVZuem5IaHFDb1dUS1NLcFVyUUpvOXZy?=
 =?utf-8?B?dW5DSHZNLzY4VmViNDFrb2pxZlpEd0VENWI4WlNYYm12aE9pV2dscXpKTmcw?=
 =?utf-8?B?L08wcTZnRVRtdUpyekRxckowa3lwdGxJVFZVa01ETUlkL1JQMEdVSXllNCtr?=
 =?utf-8?B?bXFJUXplaDFKUkJuYWNVZXE0T0xoRjVucHUzKytDY3RSWXdKVHUvRURXTml5?=
 =?utf-8?B?ODREazVHTDZpVUlDNmNVMjYzWW5oR0drUVFjeGxheTN6R2FmaDB1V29oR0hv?=
 =?utf-8?B?azhHREY5U0hWeENWVjBIdHo3ZTd4UEVrUHlKbDhpWGlDeHdJMjRGRXN3bmFN?=
 =?utf-8?B?dUZHNlRFaVJReGFKbmRQaklOQzlzaWphSi9NU0x0aXhZSTE3TW9TOVZXRnFn?=
 =?utf-8?B?eXE5cnZuZ0xCWDRmN1dxTk9VMlZoMFlnaDE1OVFYZklCVXpLeFI3TDAxNm9F?=
 =?utf-8?B?UlZYM1dNOFJGcUJKWTdVM1FiNkdzZUZsZ2xBMHFHeVVGZWtMNndqMkx4Q1lu?=
 =?utf-8?B?bkRKYzV6TnRUYUozTEZzMWlPU1FiamVxSVlUZVZKMGdGRG93cDZqSFRkR1NJ?=
 =?utf-8?B?b0Z5b2FnNUJWRzQxMFFab2pHVlcwMWs1R3V1WFBKdXdjdGpVUzFmTG82dHho?=
 =?utf-8?B?a3B0d0xUOEJMaTVEcEdPejIrRytnbzNwb25DMktFR25jb1lJaVFscEtoS0sw?=
 =?utf-8?B?N3gxcFlxNkg4Qm1BWSs5aEh0aVBwajI0d0ZCeFdXa1hJeTlKOGNxZ2hYV3Zy?=
 =?utf-8?B?c3dDK3pVQngwdUdiZkhWWnZqMFV1QW95c28rU0IrYzJSWUppUXNIQ2ZmblVa?=
 =?utf-8?B?WGprcEw2aHlwaTUvcUxGQ2lKWlltR0N4bm0yM1lFV1pHL01DYjhia2ljUWlR?=
 =?utf-8?B?M1o5MThRTWdINXJqbG15UDlaaUJ2T01Za0JXRmFoZEFzMzVNb3lYMHV3SkFW?=
 =?utf-8?B?WHVnWDROZkRxczZYUjN4ZWFkQ0syWlpUQkx0V1N6SlhOT2dTTzY1d09xMWl0?=
 =?utf-8?B?eDE1dFVhalRGTWRyUWFZTkZIU1FWbkIvOUw3TWZNSTdRcjkwTG5WT2l4VFJT?=
 =?utf-8?B?SThuT2tTRlB3MTBUSy9zejZCMkg0QnNtWXdlYWV2Nkx1QmVVVUdIRmtEK2xT?=
 =?utf-8?B?TzVadFYxdkFSdFA1elZYM2JzbFlEMUhqMHlxRGtvOEZaQkZqUzRCRktsZ3Fk?=
 =?utf-8?B?RDJLKzJ1KzZKSDgvallyNisreHVhbVNtNVZrUkNqcjRodFQ0OUtUWm1wNnVy?=
 =?utf-8?B?dVhlNGczR1VERUFEQzF2eDVpL2FzNnVMZytMcSt0akNxSUJHcG11eDBoUTUw?=
 =?utf-8?B?NFRkWG1OdTR2V3A0aUJpcHdmMEMzRDNvcGtZNC9RNXA1QUhYV1BYcDV2N2RN?=
 =?utf-8?B?eStWYXlwWDlsSkFpeTExZHh2WDVsN0ZEaFYxQ05vSkY2cXBmaG00SFNCUWZN?=
 =?utf-8?Q?xxpOnWg5jzm8uez4=3D?=
X-Exchange-RoutingPolicyChecked: Hg1r/W4Za2KiygpOevbXgdwD7ed5rFkJDhw4mBBvAXlyM0+tbYb2/lfQFl4rYjJH8nsDSvG1GumHTHmF1jHNEkWXAsnN8mg46IptRpH0vY2eGdMeZL0ZvrxvSFaPzD193IGH6y4fNDxS0RlDrUGrb9NHaB2hPuyrYBHt88cZcnVhJ0JH2t3bmsUekV7ndodqRnFwCVn88gjaRmndaUDQiQJj4/vVK9kuLqR7fNsrxVm0Uy+4PP2XWI/UZe3qxQaU+dMsMfXiokHbLVZG5o9ulU4St/2bLOkbAqoV/AmfogFAuIcbGgEtaCRJlQDNklEK10Y25/bDtmrPiauNOPejhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c277cd07-6812-4966-42e2-08df188095f7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 08:07:46.2266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W3jG9e0o2b8fMJi/prVEi2JNO22EXX4riU0uNyH4ZPRHfJ1GheiS/uLQSGRo1TSq8kmUqCxrbC5vOoVS0HP0NvTU/mNRcvuADSdyg65MNo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6790
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

Hi Jakub,

I looked at this patch per your off-list request and did not
find anything suspicious, so:

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com> 

On 2026-09-10 at 14:17:59 +0200, Jakub Legowski wrote:
> Move wake_up_all() after clear_exec_queue_pending_disable()
> 
> When a SCHED_DONE G2H arrives for a banned exec queue,
> handle_sched_done() calls wake_up_all() before
> clear_exec_queue_pending_disable(). This creates a race with the
> wait_event_timeout() in guc_exec_queue_timedout_job() that waits
> for pending_disable to be cleared:
> 
>     smp_rmb();
>     ret = wait_event_timeout(guc->ct.wq,
>                  ...
>                  ...);
> 
> This was observed as:
> [drm:guc_exec_queue_timedout_job [xe]] Tile0: GT0: Check job
>  timeout: seqno=4294967169, lrc_seqno=4294967169,
>  guc_id=4, running_time_ms=0, timeout_ms=5000, diff=0x00000001
> 
> Moving the wake_up_all() (along with its smp_wmb())
> after all paths that clear pending_disable, ensuring that waiters
> always observe the updated state when woken.
> 
> Same as for runnable_state == 1 in the beginning of
> handle_sched_done().
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: stable@vger.kernel.org
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Signed-off-by: Jakub Legowski <jakub.legowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 30 ++++++++++++++++--------------
>  1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 99d8c807ff05..a181b5042293 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3239,25 +3239,27 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>  			clear_exec_queue_pending_disable(q);
>  			suspend_fence_signal(q);
>  		} else {
> +			bool destroyed = exec_queue_destroyed(q);
> +
> +			/*
> +			 * Make sure to clear the pending_disable only
> +			 * after sampling the destroyed state. We want
> +			 * to ensure we don't trigger the unregister too
> +			 * early with something intending to only
> +			 * disable scheduling. The caller doing the
> +			 * destroy must wait for an ongoing
> +			 * pending_disable before marking as destroyed.
> +			 */
> +			clear_exec_queue_pending_disable(q);
> +
>  			if (exec_queue_banned(q)) {
> +				/* Pairs with smp_rmb in guc_exec_queue_timedout_job */
>  				smp_wmb();
>  				wake_up_all(&guc->ct.wq);
>  			}
> -			if (exec_queue_destroyed(q)) {
> -				/*
> -				 * Make sure to clear the pending_disable only
> -				 * after sampling the destroyed state. We want
> -				 * to ensure we don't trigger the unregister too
> -				 * early with something intending to only
> -				 * disable scheduling. The caller doing the
> -				 * destroy must wait for an ongoing
> -				 * pending_disable before marking as destroyed.
> -				 */
> -				clear_exec_queue_pending_disable(q);
> +
> +			if (destroyed)
>  				deregister_exec_queue(guc, q);
> -			} else {
> -				clear_exec_queue_pending_disable(q);
> -			}
>  		}
>  	}
>  }
> -- 
> 2.48.1
> 
> ---------------------------------------------------------------------
> Intel Technology Poland sp. z o.o.
> ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-316 | Kapital zakladowy 200.000 PLN.
> Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu ustawy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w transakcjach handlowych.
> 
> Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
> This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.
> 

FYI: this footnote can be disabled. I sent you instructions
off-list if you'd be interested in doing so.

-- 
Best Regards,
Krzysztof
