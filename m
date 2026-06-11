Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D725ECD8C9D
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 04:55:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8956110E567;
	Thu, 11 Jun 2026 04:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i1thg1+W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20BB510E567
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 04:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781153741; x=1812689741;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SWu48cSTasPPOoYbiLxyHat9gUs4RP52NC1XhCz8vK4=;
 b=i1thg1+W+bREBnIjAf/+NUTzl0Rt/vM2j5bLau4J4tPH9Cx7hUKFqSzc
 mHMwdf9X15QBxZnFCuXyDVmroCtmDjcQiwZcuALHEA+wb0rCxH2pcl+wk
 ae+oIjY2YXlrg01iLFLlTnsJl/PDxgO/f0wrF97RXXdcFlB7JetLYrfBt
 QJOeAejkpoK6CQ9xQnQAeaQZoXdWm8C+5clLav3BWEd0aiZMPCQYBu/pY
 vj7X6toFrL00MX1ILWFzgL1nrd/OECEcEBgitg96yhdeGonSa4FGqhZ+8
 MgfXksFAJmH6MUd2YUSdQKPZNazuHcOuBVkOwjXfQgDk4Hh9JrEFDpno/ g==;
X-CSE-ConnectionGUID: WvzNULFhRdCRYXHK+6ArMQ==
X-CSE-MsgGUID: 4E6WCnFfRKScQqSdKoHRYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85588042"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="85588042"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 21:55:38 -0700
X-CSE-ConnectionGUID: tYoTE3zrQ6iwD7xqHJKAnA==
X-CSE-MsgGUID: XI9VM8bOT/me1c5LKJyJfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="242226347"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 21:55:37 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 21:55:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 21:55:36 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 21:55:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALczRrjecsny3E2Kr/jcuww0rsRn8UQmSHOAk1jE/WaclOTqKJ9ONCwdahVx5yJUYXvYCYO9kVIUjtLJvpC9UAbH9b7UeV6LE4ald5cZUUohUHICkhh75PCoFQAuXSRMCnYFGfhwP7R91zZOo0FmOvLOGvdUSvr8fRtsYi4vCk2BYIgDoR+W2bR7LPNRDIU6KLphgtUPnL8fHi3bf0TmgSgAGqwBz+Z0M/EnZIedaYCGWe/Co04cOp5ZYGPD0sBv6zF8SUzb5usIHsm6Iy9roN7X2DxbEZCHmiQqzoVsIB1i4X9H8Jya1/es93Bztdl+u5DXT6noezCAZRGZJ5zMVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kJJn8OqFDHyFkzMFvuQf0BQIXBIBplfBCL0bjTv3MU=;
 b=cOUYcyZnU0Rc9duwrWvJafRBQqN4UgyKxh1HN88/jCfqUp/vB80cJ8RdAn/RcBOYAwirNhrQAZ34HLpbX/gg2ZknQp0foOTNm9X9QETtQvEokUigXkFlNw+27vSqdxl58IEQRcM+HFOcdSk3s3JyqrQ1R0ScPqHm7C44RP9h401D6KLb2yB4bKhi+sMUuDx1dt3gief/++ci2AYq57h3/hnaTvdZz7HlzKXh3MEDSjMYYUoZx7Wwesg/s6+lJrxCoWGxRtqJaMJ5RcJ6sIxy8Hv9U6ENvfTZPndtWOE0q6hiUaUBEi+wy9/O7oBG6FROeKSXkI6wFzg4JomNlOEmMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by PH3PPFFA27DACA6.namprd11.prod.outlook.com (2603:10b6:518:1::d63) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Thu, 11 Jun
 2026 04:55:34 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c%6]) with mapi id 15.21.0113.011; Thu, 11 Jun 2026
 04:55:34 +0000
Message-ID: <205ed8f1-3ad1-4620-a137-a9022023ce1d@intel.com>
Date: Thu, 11 Jun 2026 10:25:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: fix job timeout recovery for unstarted jobs
 and kernel queues
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
References: <20260610152548.404575-3-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
In-Reply-To: <20260610152548.404575-3-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0163.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::11) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|PH3PPFFA27DACA6:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f191a76-7d31-450e-9208-08dec775abad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: s6D7I+OZ2Oab+MNUM5G6l97/G9DCX9Dnn278obftj0rULTid6Nk571wpqX1zDLvrbmM/Hn+jkPav82sQftK9E7rGjhh7J0zBTpheYj+eKnlDBYiKubQjd2BBYduXTjlurg4sBYQXgeFDg9yR0+0juC5BWQbOln4sP3v20cd/DfW3/2Y8xtmB+WQi55Exawrk/aNur84/aoxipwhp2GtsexDVe8kIVPT4p6fj3W2Kp1MALiJ3PsQMV4MG5BCLlEJO/GH1MrHDxMrbP+s0vPO3WvPGuQC6IKk16FviWriMs55hZRYsY04wCkFJzdcvUtdt/AkTalMbtuv622+FJ6qkbyZOpw5QN9R3XkQqRVTdyo4vceoV3Oww6zkS7rV9Z4PMK//gtSBjONzjnUG1biOqfGAq/nYlOHG4sLn3AeU+Z4Y8yYISSedlWSgJCSR/AajyUdVVbBWgeCvr+aIr8IMh/cfOX2DsqPNw2LYe7S4Dpn201kEck0FqMafTe4HLoe9RPx4eXdVxxL83bCWplAQwwgXR5xUKjaD5fwHasv97Ae5DHlYukOlxXC0RvYZ2zFMccfZuEDVPPHiYp1SCoyDi5l93Xum3y/hH/Co+jUXIahefHj1hIJ3L+HGHzuo/qbWhRtmPdjX9qKcVBStBB7q8iHm4NQGZjWFeoXUrxJTDfFpG+sfY0MgnhYmrXEHPbOTE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmY4L0k3SWhlZ1pzY2U3WklrRFFLeTRJZWFRVkJteUlSSUNTOTdyTDZHQlBT?=
 =?utf-8?B?UjRlM1dGOFpKclJNMkZzWGlZbk5IVkU5YlBkM21nWktXdU83RHFYZ2o4ZVJw?=
 =?utf-8?B?RGQyQ2hlWnZlVG5Cc0dWOUxkUzlXUGdNSzkyYUsrK3krQ2VJU0pUWHdrT3Q5?=
 =?utf-8?B?cERXWTQ5NExHd2NFay9RaXlVSm1DckE1STZoQU1TMEJMeUY2eWQ1QWtuT0Uz?=
 =?utf-8?B?b1NjR3c0Z3dsd3dzVS94RVI2RUt3NVFEOElmL1dERlM0aW84VkwrTm5SQmhl?=
 =?utf-8?B?NUhZVUorYUt4K2xYVERueEdTLzdZbUkxSG1GSFdTLytVUmRwcnVvZVdSbWdE?=
 =?utf-8?B?TXZORGNTdmV2aWEvTUdkZDMrbldHYlh6KzhVOVBpWkxXS0VlYUZ1TTZwV1Fq?=
 =?utf-8?B?UzI0QW9iNkxlYVBPTlBBTzZ1WjRnT2FTZEVVVEN0cmJXbFRMNUpLY0FvNDM2?=
 =?utf-8?B?RUFBQ2lwNWxsTjNpMDBNSTJjVkpCMU1PYVl3d3h2T0xJMTE5TjZacTErNXVp?=
 =?utf-8?B?NDN5cU1RTmc4YUtVZkdOQ1FMUlFVUkwrNnhyVWhLY1VoV0tuY2FSQngrWUtq?=
 =?utf-8?B?cWJ0SjhCTHhMMkRQTXlsRndCTmlnL1UvVFdKdEdiR2hwMWJhNGdQWWM3a3pM?=
 =?utf-8?B?aXZYejE0dGI4cFdFU1JpMUNWdVVuaVNiM09BcGhmNHpyRmw1eGZGNTRaeDU3?=
 =?utf-8?B?aGFoY2x0aUw2MDJSK2QrT2VPazVrc1JYSk5BRDVWSVg0TlhTWTZmNUFyZXB0?=
 =?utf-8?B?L3FBcnpKNU9QZXJLZVpLK05kMy9zWjg0eHRmcU9xUkZCNkFsL0RUY25LUUN3?=
 =?utf-8?B?bGI1dU5mQWt1R29rWHZJTUFZQS9BZUptSDZzQy94dTNjVTZabHQ3bVVJeVF2?=
 =?utf-8?B?RU5kVE9PNzA5VFFLbE94Yklwa3RvOEQwM0U2eDdlenRVWG4wMFhMWnBQNVVL?=
 =?utf-8?B?ZjlOU1U2UHc2K1dQSU1TcjhvZUpLT05rOEUrMm9ldkszZG15SXIxOFZGdkJX?=
 =?utf-8?B?dnZGOXN1MWFtb0QxSDdsSUhKc2p2UnNkOVY3anQ2S0RKMUNLMi9rcVQ5WEZI?=
 =?utf-8?B?ZVhBLzA1dGx1SE1GN3FuKzF3dXVCV3N2NENBREwyNXFpZ0VUbWNXV0FtRllL?=
 =?utf-8?B?aFZGMGJxM0p6VGRHVE02dVVNK01wTEQ4eHljQkQrckxvM08zV3ZwTHZiZUhj?=
 =?utf-8?B?TVBWY3YrNmdZRlVvVmU5R0FzQ0FvM2JlRjAvM1NIS1FVVzB5VGtwM2NzRlVT?=
 =?utf-8?B?a01VTHRsSDhtL1RxRGZJNU5SWERtQUYvTXlhenJBWEZDak1LWEZ6NWJvQ0dI?=
 =?utf-8?B?ak1WL1QwVGpzOHlpREtOV2hpN2UyWUsvNWdQTFVSUTU5YjVxeEc5ek5SMDNx?=
 =?utf-8?B?QU9oOXBoMktGQ0NpMEQyVjRDc3RnVEZCTldRdzlXSkRZTE13eDV1WTFualJU?=
 =?utf-8?B?Uk5QSmJMaFhKZnJuZnVjVWplNWlWdDIwZVgxeGZCQ1R6V1NRWTdUK1lCdGVR?=
 =?utf-8?B?QmpiTUEzU0J0K2ZlVXJmQTd4RHVFV3c4dzJjckt3SWRyYzNQZmFNNTdCWVI5?=
 =?utf-8?B?VStpNlJxcWsydzY1c1cwQ256VFVOMkhIMmcrYlA4a0dZMUhPZ2VoY0srVWl2?=
 =?utf-8?B?TndQV293aW1OWUt3MUxkckRMWnpITDgvc0tiUWxTdkhMaytNYXQybzlTYXpy?=
 =?utf-8?B?TW5jS1hwV2tybHQ3UlhoazhwcDRsTmN3bk83dndRUEdCRFVWMytuMlJVT1h6?=
 =?utf-8?B?L3NqRlRTeGljc1ZVY1BVdXgyRHJhVHJZZWovRDgrNWRQOXRONnpvdjhEcUtI?=
 =?utf-8?B?UWg1N1JxYTQyd3NHdnJ3YnErYlJKOVZDTWlTWldYdHQ3TDlPSW5mKzVtZzdR?=
 =?utf-8?B?bFhFL1lyVTBzK1dQNzVTOGJiMUtTR21IcEJPZU01QWg1S1Q4Vkp6WHdoYXFG?=
 =?utf-8?B?NWg0YUh5amo4OUt2K25KMHdnN01hZDBySWpSQzVYYjZTOFdzUXpxN3phQjVr?=
 =?utf-8?B?VmRUbm5TcnpnWnphY2pUVVpKK0RxZ3o5dUVFbU93MmpCRzlacFVRdjB1c0FW?=
 =?utf-8?B?bTFvd1NTRVdmeDdOR0V2UlNzVkFLTHJKZ3FWdGlRbjNIUU9Pcy9KOEl6Vzhp?=
 =?utf-8?B?U3RsWlZuWWZKLy9JMVovcDRrdXIvbDlXcEw4Y0QwaXo3RDRIL3NRa0Z3ZWJ4?=
 =?utf-8?B?ak1MYy92TlVvV3lybGNia1k5SkdXTkh5UmZZK3pwRmt0S2F5U0ozL1hNQWxU?=
 =?utf-8?B?czluemtiSTEzeWd6MEJ1OUhUQUg3K2J1SWNVRE4yS3RlbkMwdUtDMk9QSjl1?=
 =?utf-8?B?TVhJdU1vcldTNG0vTmN0VDlpaU01RjNnRU81MWZQcWJmVXAvZFZRajRyNjR4?=
 =?utf-8?Q?CTmGg2gftf1zqkl0=3D?=
X-Exchange-RoutingPolicyChecked: URyhj+g2Tj0zKXtHz+AYmGnm1ttcRmepcgIXyDqL65pJENbt/A0huiPoAoA5oKwGj85tZ654/T0gs+bhyIGFz+xjwxX70UXKQkd40pFnXkBqy6UIWNrPx5fmeJP4MVgEXr+5cxrszDBsHtFvGI4/bWlb2hflttoRZ91l8UNu8DTbh6nWw+pb/CTlsXlC4E9WTU22TlIQLwwrxwy7Xqw6UfcksPsXg5E7BUNwjAZ6++cUmEsJQR8klEe+mlduuzf0jHAjVMkIElSSYEwjol0n44w3lksRpuSkXG9hsdgg1xPH+sOukZTp5tCKu35hOhrsdr9bhCUo4Ypxd4hJaqkjEA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f191a76-7d31-450e-9208-08dec775abad
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 04:55:34.1975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hD1MkoG1oqgtoOSarWhg9NO9VBKA+avRIyh7QZkmpsDdcP0q2srxv2ZseITo9BgvZBC+ducyciiYHFSVGG3vsA4sA8i98YJyVegEJHgEOQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFFA27DACA6
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


On 10-06-2026 20:55, Rodrigo Vivi wrote:
> A job that GuC never scheduled (never started) indicates a GuC
> scheduling failure; previously such jobs were silently errored out
> instead of triggering a GT reset to recover. Trigger a GT reset and
> resubmit them, but only when the queue was not already killed or banned:
> an unstarted job on an already banned queue is the ban working as
> intended and must neither clear the ban nor kick off a reset, otherwise
> a banned userspace queue could be resurrected and spam GT resets.
>
> Kernel queues are always recovered this way and wedge the device once
> recovery attempts are exhausted, since kernel work must not silently
> fail. A started job that times out on a userspace VM bind queue stays
> banned rather than being reset and retried.
>
> The queue is banned early in the timeout handler to signal the G2H
> scheduling-done handler so it wakes the disable-scheduling waiter;
> without it the waiter sleeps the full 5s timeout. When a reset is
> warranted the ban is cleared before rearming so that
> guc_exec_queue_start() can resubmit jobs after the GT reset - a
> still-banned queue would block resubmission and cause an infinite TDR
> loop. The already-banned case is gated out before this point via
> skip_timeout_check, so it is unaffected.
>
> v2: (Himal) Do it for any queue type, not just kernel/migration
> v3: - (Sashiko and Sanjay): don't clear the ban / GT reset for already
>        killed/banned queues on unstarted-job timeout
>      - Update commit message
>      - (Matt) Add Fixes tag
>
> Fixes: fe05cee4d953 ("drm/xe: Don't short circuit TDR on jobs not started")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> Assisted-by: GitHub-Copilot:claude-opus-4.8
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Tested-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Reviewed-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Looks good to me.
Tested with the reproducer IGT, followed by xe_evict. Recovery behaves 
as expected, and all migration subtests pass.

Thanks,
Sanjay
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 49 +++++++++++++++++++++---------
>   1 file changed, 35 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index b29cc08e6291..e82018445b7c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -157,6 +157,11 @@ static void set_exec_queue_banned(struct xe_exec_queue *q)
>   	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
>   }
>   
> +static void clear_exec_queue_banned(struct xe_exec_queue *q)
> +{
> +	atomic_andnot(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
> +}
> +
>   static bool exec_queue_suspended(struct xe_exec_queue *q)
>   {
>   	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_SUSPENDED;
> @@ -1363,7 +1368,8 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>   			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>   			   q->guc->id);
>   
> -		return xe_sched_invalidate_job(job, 2);
> +		/* GuC never scheduled this job - let the caller trigger a GT reset. */
> +		return true;
>   	}
>   
>   	ctx_timestamp = lower_32_bits(xe_lrc_timestamp(q->lrc[0]));
> @@ -1460,6 +1466,21 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
>   			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>   }
>   
> +/*
> + * Recover via GT reset for a kernel queue, or for a GuC scheduling failure (job
> + * never started) on a queue that was not already killed or banned. An already
> + * banned queue must stay banned, so its unstarted jobs do not clear the ban or
> + * trigger a reset.
> + */
> +static bool timeout_needs_gt_reset(struct xe_exec_queue *q, struct xe_sched_job *job,
> +				   bool skip_timeout_check)
> +{
> +	if (q->flags & EXEC_QUEUE_FLAG_KERNEL)
> +		return true;
> +
> +	return !skip_timeout_check && !xe_sched_job_started(job);
> +}
> +
>   static enum drm_gpu_sched_stat
>   guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   {
> @@ -1608,19 +1629,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>   			       q->guc->id, q->flags);
>   
> -	/*
> -	 * Kernel jobs should never fail, nor should VM jobs if they do
> -	 * somethings has gone wrong and the GT needs a reset
> -	 */
> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> -		   "Kernel-submitted job timed out\n");
> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> -		   "VM job timed out on non-killed execqueue\n");
> -	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> -			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> -		if (!xe_sched_invalidate_job(job, 2)) {
> -			xe_gt_reset_async(q->gt);
> -			goto rearm;
> +	if (!wedged) {
> +		if (timeout_needs_gt_reset(q, job, skip_timeout_check)) {
> +			if (!xe_sched_invalidate_job(job, 2)) {
> +				clear_exec_queue_banned(q);
> +				xe_gt_reset_async(q->gt);
> +				goto rearm;
> +			}
> +			if (q->flags & EXEC_QUEUE_FLAG_KERNEL) {
> +				xe_gt_WARN(q->gt, true, "Kernel-submitted job timed out\n");
> +				xe_device_declare_wedged(gt_to_xe(q->gt));
> +			}
> +		} else if (q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)) {
> +			xe_gt_WARN(q->gt, true, "VM job timed out on non-killed execqueue\n");
>   		}
>   	}
>   
