Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7A8CA6007
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 12:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C689510E832;
	Thu,  8 Oct 2026 12:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bpNRpkTe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D999A10E832
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 12:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791464265; x=1823000265;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TH07m7yfndFuwA25SF/l0LX2WKXgDXKdm+liockLfzo=;
 b=bpNRpkTe27DfRMbiGpIda8SHWZTgO4i92k12Le0vHB5OJjs31Hm7kXRP
 6vLYlzgSxe9uqKf4b8BIciCz6KVLushR3FC1U0fDBSgKWrK63c332ysMS
 b0yNNUk/fSYLLHNkOC6pi61kUFUEJZQHUqNjcR8l6inWbbdhMZOEcRZEB
 xjxg/R6L4AqTCHa6z+2RHm8p6/ZUuAwVQac1pPQjB8C8Kxr1+ehF8+5G5
 h2lui2ik6fMKmTOweSvdRrhe+lxb6GaTBAVl5dB7ULSpPAC19Gq8qRg0C
 rNdCQp4F3LQSMjUd7Ayj+06h6WqHrBHqalimi//lexAdgB9nkiSZt/JGK w==;
X-CSE-ConnectionGUID: yl4f5xMbR/u9OkdSqA2KTA==
X-CSE-MsgGUID: 60fH9qUBROqvHpQVjqEqdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="243642"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="243642"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 05:57:44 -0700
X-CSE-ConnectionGUID: Aca898/+Ql+mecWcMd75QQ==
X-CSE-MsgGUID: LZcuV2NXTGWP9tuK+SevXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="482016"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 05:57:45 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 05:57:43 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 05:57:43 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 05:57:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4JQ+1XR6RVoIxJfdAvpUDgQxO3UfNQRzR8rzTXiXxReSfJ4QZgCHP4jzscwOzkcwKI8qiMRxl50G20kFKjWJzRKN+3RI3L+tcNVZQi9MYuN+LAJtpNbirwFY6MlgVOZKDf7sYWeY5WzVSacmyzfqMW3JIxs9WzKHvvjs4y7/WrsDVfpo6U9uLj2g+CZUmXw3CWf1RE5BHjH1kwkz6WmF0Y97C4jaUzwb8hn8D3IWufqbT2vucZ3uetWxkTvykQbvK8DdQcZ9BA2g97cCQ9S7Z0fK40TqNOAvxBUls0SMKo61xacHhW0A1FspRfc0TJQ0IqLZkoewOPt4tZK8wFyXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7b//qKJhwzvWvvvgFh+9mmVFLPIof5awGDVBaRpS8+4=;
 b=tp3UEWpRiPHYQp+kAnz93T2i24ePqfS31W1dJrDrtGGxgSuobt/S8zEQCYJJbPpbx+tGuwS/g+omWHIxAG58eQpdXZzaJsR3Zvh2LroDKe2T3UXTxBd9KfBbXHj9D+jOzWj1AR5iSxlFZl3UqZhQl2uv/9r9rwFGdGapN/EMefu9ETXXzFMecfNg3CsRAzy736QF9TaodERQHW/rizFSEkLgF7t5TtxtpFXTrsZr+7TJM/F8pOsqYpuG5V4rNgOhGtGv5gZ3rBmdklwx+cyUEFDeDQbk9sIgCduOSHVnkFfhleqhZjGUcX8c/NhYECuvrKK5CbuVyc7/PJfxjW80WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by IA4PR11MB9444.namprd11.prod.outlook.com (2603:10b6:208:563::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:57:35 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Thu, 8 Oct 2026
 12:57:35 +0000
Date: Thu, 8 Oct 2026 14:57:31 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 1/1] drm/xe: Prevent VF memory IRQ from accessing a
 torn-down engine
Message-ID: <20261008125731.7n5pndajymknjjfk@intel.com>
References: <20261008122543.390356-3-satyanarayana.k.v.p@intel.com>
 <20261008122543.390356-4-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261008122543.390356-4-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: VI6PEPF00000227.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::8ec) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|IA4PR11MB9444:EE_
X-MS-Office365-Filtering-Correlation-Id: a8b6e846-5a7e-41e8-4ad5-08df253bb977
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: XZpdoZr+gahVp1vUBauUxdR7ObESuI+GOheSJ0t1+ihEK6oxaaVJL9tnnXdVkCIvREr9ILQQWpw2LjI/BQTkjiltAXTCyZo3ZTll7AYbUUGlefKkP1i1UiPQLRFP9TPjY8JhapRhq0zcjVpTRggC66tCWncqRZ3m/9PFI6DMazLzoC49MxipGHTEAn3W2oTHW7wW/PX1nM0FQRDCU1OV8ytunWOooyxshsHHfjQHlq4k2CP9ft1HEnVCOw9455H0n4kEM0MeYdyynfOqXxAYyHWAUTl0sGxlkjf0XWqVU3K7J0q6uNqtQyEyEfYzShOuOYGzMlyOro0ekbxIjGjVZ3dXWGQNyvOUkbwtTO/7Eu8OZMNa7aURF5U26uKba7Lzd7kIZ63oZSq3ql/nOv43JmES+zhKKkW6xuhKJ2fvzdeieOT9EQRt2IlFAUscPjZDp8ctQTR4YyZwg0MQ6kapdZA9i97QQ08KjdE9GRKiRNlbUd0Lg6Pc++t3wZmKmOuxxEuvYwDniSU2A9YpGMsbJ67nkmONMr742z6a98NyOBlVmddaXBPSqPDB3Jb6QLZ+IvNFP6w114fip8r1WTr7OwYrAKbNleQpoeJuqxkE5NBorVaBCW6TDnBsO+BUJcWwEhQpIr1DX+uBsmhU4HPGiDDj/nRcf3gDwwx6SUYvs4s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1pYcUJWdzNWbXBGQ241d0hNV1BCb1c4UnMzUG9kaCs0WUZTakFaY1MrUzhD?=
 =?utf-8?B?bWNIOEd1K2pZS0R1Y3hYUStxcXpscTExTlUyRWgwb05FWldWaERwN1dJYkow?=
 =?utf-8?B?dys5MWVzTG9lOURRNzlKZkV6RkZEclhTVjFyQ1ZBUCtTTjVFMXk1U29jUXFG?=
 =?utf-8?B?eHZhQlVwUDRFTkdSUjZVWEdjY2V6bkJsSjVTc2xkWG1qdVpjV1p5VEIwK1ow?=
 =?utf-8?B?Z3g5eTAxaHpSam5uUU54TkRaQzRpb25SaDA2UUI4enFSbStFYWpSVlJsMVlB?=
 =?utf-8?B?cWNhSGZ0UUN0RXdlZ1M0TU84ZGwrTkNUOXRDdk03RXg3dWZtbisyWWdBSnZn?=
 =?utf-8?B?bWNVRVJGODNtK0JkZUdLdTdSZ0NkSWhPcFhxZFJZbDluanpSVDN6ZXpQeWhx?=
 =?utf-8?B?b2YzdTFrcUUyeGFUaFF6dkpVRTRFRXdMaGJlYlZaM3pOeG5LSlZLRkt1djF2?=
 =?utf-8?B?OXFLV1dBcUlVNHRaeW1Xc2pRWVJCV1pabTR5a3lUVTljMktQdHZCMGtZQUNl?=
 =?utf-8?B?Sk5YQVl5cmxXd3JNamdlK3RxRGEwYlQwOFE5bUI4VUlWTHpMMS9wQnhtL0ll?=
 =?utf-8?B?RmFjK3JUcXc1YXVIQnFOcVVWY0JKQ1BxdnJKZ0M3VWlSNWV1cGk5QjJMWURL?=
 =?utf-8?B?akRhdVp6b0ZCQTMzQmdDc0xiMEFid0JTVHlHNVB2MVArVktFdkNwc1ZTRkw2?=
 =?utf-8?B?NlZjVVFVMU44dGhVa1UzQWc5bkxxWlVJd2R0SWVnMTA5R3RobTRBakRScitV?=
 =?utf-8?B?Z2w1b1BIOFBpNmZrWVdaK1lWM09nUktGQ0FjaytHREVMQWJQVTZGaHUwWkR2?=
 =?utf-8?B?VEJneFc2U1JEWHMwcFFYbDBBbjdsU1pHMFJBU3dCR1IwRzlwV1lOMFpDcEJl?=
 =?utf-8?B?MG50cWNuNTlUVGVJNThUWXM3RTI0bEYvdDdJZEZNSHdXZHNLNVlJV0tqaGky?=
 =?utf-8?B?TGs5bU5OVHlZZ3dqa1JtRzd1a1FjSUp5U0pjc1hzamM4alUwUXZISzJpSGkw?=
 =?utf-8?B?RU5GMVhLK1pYTEJGUEdBYnIza0E3aWxuUzBJTnEzY0VFejZkRXcxdnFyT1NL?=
 =?utf-8?B?dTVoRjFyRC9HRDRVL1ZCemsybWZsUlJCb0RkUlRJSTZiYTdUSWd1QWhPcHlT?=
 =?utf-8?B?NmJuTzZ1UnVEQTFzcFcvd2E2MjdNaXZWUjg4UFhINGdJT3kvalZPQWk4eHVz?=
 =?utf-8?B?RGdqanF3TzFrOFpEeUdMSFQyK1UzQW9RRDJkbkQwU1M5WGlacFdtbGVUM2VW?=
 =?utf-8?B?NFdoVG1PdmkvVlV4L2J3WTRiNW1wZm1OYy9JQitnZS9qb21LeHY5ZXhZRDJu?=
 =?utf-8?B?ZUFueW9KUUIwMEl0eEhwaHU4Nm5PNTE4S0NPVGlWTnlKYVo0WitYUXpPYmo2?=
 =?utf-8?B?bGUvVDZUYzhjYjBKeHQ4TlZxUVNpQ3hRbmpadXgvWVFiZGJjVkIxQnFtdFJr?=
 =?utf-8?B?NWtxMGpMSFNjZC9hckFFb1lXVkVSSzRNbmhGWHVWVGd3K0dHK21zMXVlWnNn?=
 =?utf-8?B?eVlMdnMxTjlTSDlGcDU4dFRqT2xyOTJHMmxXc3JEZU9EcUJPUU5wUk5aQ0FO?=
 =?utf-8?B?SGVnaGh5d294NURONnNBOFJPcy9hOEdkSWVLb01NOGdzK2lENEpEdVNZL2RB?=
 =?utf-8?B?TmNlbHRsU1hWb0UrRGlVdm1VWDF6a2ptbURSNkE1QUJXaTVVMXJVbXNEQ0p3?=
 =?utf-8?B?ZGZUZnlkTzdoNHJwM1pmT3BranJkK2FENU9ic2RZTjlPeUcrUzJzVTBraU01?=
 =?utf-8?B?ZEtWSXZSbTBTYVE2Tmo4WlVSRFNzL0xSSE5SY1ZOZkhWRmpPS1p4eThYY1d1?=
 =?utf-8?B?MXFEU2pPdExxWSsrOFJsYTQwaW1qbHpkY1BsdVhGR1VnNEdwYzZsa0ZaTmFh?=
 =?utf-8?B?cHBNcXpra05qRmVnRlRqTUJPUjZBK0lLcGRyR3VwTGdPRFJQd0V2cWpVbzJ2?=
 =?utf-8?B?U2FyN2tCNzM0L0dGZmF0YWo2NFFJMmNsbWs0ZTAwU2pSVGVlMnNhbngvdXRa?=
 =?utf-8?B?Sk1YNUsxZndXbFRWdThYRGlySzhPYUoxVkRFMmFOR3lhK01RZHNSc3pQanls?=
 =?utf-8?B?c3hQTHVCQ0hUaUxBS3RBZzV3WWNYZ3dEZzlsdnJWSzJJc2ZYS3B2dmhYRTRP?=
 =?utf-8?B?VjF3Z0dGS3dDZFJ5Q1ZUeUZydVI2Q0pPcWswZDJDVVBoSGpRKzBGTHIzQ2t1?=
 =?utf-8?B?UnVoU1BlOS81OHBHenpNaFN2eWJ6c0VXU045REZjM2FwcXgwaGRuNXBRS0Yr?=
 =?utf-8?B?TnJZNE11WmtzNTB6blIrN0loVGF2eDVIR0QwRlRVOGdkNkpabWFGRnhDSmZz?=
 =?utf-8?B?RmxwVWY0VktPMHRJL3d0dFpTSURTZHAzc0ptVDhmSGRqbnlabUZ3bytOWTgr?=
 =?utf-8?Q?UbQ30YmvHODZghJo=3D?=
X-Exchange-RoutingPolicyChecked: yG9ANSFzTmIk6rzS5/jsLYmOMpYuhAN4ArdTJQhdnggay7YFe+cnTYm3f0OTcIuiT/CWuW/aarF95mbGf0A4uJrI+mqC2cBJlXLQR/f3CtRk9p0gW6CJdGGKBvjO24gFqVHQpItuWJHMcxmBzOvmX8xDYy0IZXwOIIg8FTYGtVwmMAw8iSQ0pkmOfzk4fuxChqIE1JthWBpXJjlbyR/+PKZPvE2zw5YnYPNAAsufIwqtNDla3/ss6XBhPSgaRtXjgVCWXSn/vkHzp8fSWQ0LWuzJCWGju6MBM0HMBbb98PgvxIwy2HaEyZ5KDiQ9SSN1VIJF2ROlFFpeUyHzC8KjgA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b6e846-5a7e-41e8-4ad5-08df253bb977
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:57:35.6158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vh9uQbvCWXtKEeHfsejFoNy/tJilDWEIul9WcbhyAwkSXwJvA+oZsbr4+u9Eb2+M8TahiQjy3+2Zm1n/yo0zhriapwmvPDwX2hAgzPzyp+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9444
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

Satyanarayana K V P <satyanarayana.k.v.p@intel.com> wrote on czw [2026-paź-08 12:25:45 +0000]:
> The VF memory IRQ handler iterates over HW engines whose names are set.
> Engine teardown clears hwe->gt but leaves hwe->name set, so the handler
> can select an engine whose GT has already been invalidated. This can
> cause a NULL pointer dereference in xe_hw_engine_handle_irq().
> 
> Invalidate the engine name during teardown so subsequent engine scans
> skip it.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 265f95c0c899..fb1492c86bde 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -279,6 +279,7 @@ static void hw_engine_fini(void *arg)
>  	if (hwe->exl_port)
>  		xe_execlist_port_destroy(hwe->exl_port);
>  
> +	hwe->name = NULL;
>  	hwe->gt = NULL;
>  }

Your patch minimizes the race window, but it doesn't eliminate it.
An IRQ handler on another CPU can check the engine name just before hw_engine_fini()
clears it. Then it still uses hwe->gt after it is set to NULL. To fix this, we need to
clear the name, then call synchronize_irq() to wait for running handlers,
and only then tear down the engine.

Also, please add a Fixes tag:

Fixes: 6eb2aad402cc ("drm/xe: Move hw_engine_fini to devm managed")


Thanks,
Piotr
>  
> -- 
> 2.43.0
> 

-- 
