Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D96C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 14:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF23113D3C;
	Thu, 18 Apr 2024 14:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hxYLFasy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA599113D33
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 14:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713452124; x=1744988124;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=5v63MaBTd1FWpZeQAfzyjExskLTmeyUCQaKJaTAbZ8w=;
 b=hxYLFasy5NV29mdbz5PtvknsvCGrz+gJqqywSLRdqBOpfuozxw9lYrKo
 fdaMlz8ORQOifEa39qIJqz1wVRQgX4UkBxDgV0mNqRGJhFDuPqXyyzzv7
 /hcVm5VpQvN2xvsSWzFe+ZQvZd3+DqwbINiyGBR/ya+nfPC84Tdd8oTXX
 c6KaRD9eQEQOV8dT5BqkWg71qVLZYSkC2+Zw2y3GyU9SnyLwchJV6+yjT
 RXD9IrAM7GUP+TI9KOMYHtrexSEoM3O5Y9ipNygqZ0Rq06MblNR+x1MHO
 0BNaGvi97++AZo/r2c2jp+zasYz4EVT+ZfMEp4YaCXuKHUd0KgQZVMRKN A==;
X-CSE-ConnectionGUID: 7WOCB+yJTxeMdjBg1AQfOg==
X-CSE-MsgGUID: Zvj3Ir/DT/elwv1t858Phw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12840537"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="12840537"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 07:55:24 -0700
X-CSE-ConnectionGUID: nLaeWIxWSqS7J09BjnNcBA==
X-CSE-MsgGUID: y4pgkLdLRICvI3dEysv5oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="27450509"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 07:55:23 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 07:55:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 07:55:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 07:55:22 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 07:55:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vx3jLC61bljDmKxLB/PxDzzzPCTJ2KFBQpQ0CLK2bT4wASYq6B2E3AzYzJeB6Hazqn2ytWpagyM6VNnnthRqapQRaoYiUoJ7VTIAa8xqSCWiyCiG5CUSs/icqZE4PhxQQq2UTuYdQtuiSA3How5PP4poP67VgAwgIN9HOLgBIZrRhaS/OFSsEjoGDqKmXNV/NrunAI/pLh4vdUVij/LpjLojDNHAU0vRCCYvqNV7kM7lpkOmtbzzZB8KB9y5dt8pMKj8LHS06Z1uD/waaD/4vTQEFWCn6hMh7pbjMEd/DZD6HF6zWeNf8wF1PLuJo4oOY1EVNJTAxFtdNkpX4qThug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jN4Ld/UFBU39P+QBgtjQNQ91TNWK9YDdO34k3wmIANY=;
 b=HNbnq6TqK9tELW3nY6ZAwh7lC8UiOdiALVcXBmq6vrytdjyWk8E6HHh1Xt50nbeW34IyOdrZGddkw2T3aiU4HlnEnRtcLWXL/TfsmCXHS1PnYXpp4A6JxbIrmsshH3TNmwAXxVHuUWDpixiLCBbAINjTZOIc5hgkFxDv1j8eEl0i5TEcl32j1IQnI69sbwSMPDbIQOKMgD8dLpbXDwramPkpq9VLT1bMj5uKifX3A+BIPl2dgrXrDl6NuuKeyGmoxFv1NRr369W/EYhlE2T7gox9ZHn0NQPC5Nc/EYPfjLk6FVMEHudBKguye0FpI+as+TCeSqgSBW0uxLm840lpDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH0PR11MB4984.namprd11.prod.outlook.com (2603:10b6:510:34::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Thu, 18 Apr
 2024 14:55:20 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::3191:4863:ad54:bdb1]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::3191:4863:ad54:bdb1%4]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 14:55:18 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240417222747.GN6571@mdroper-desk1.amr.corp.intel.com>
References: <20240417212501.312346-1-gustavo.sousa@intel.com>
 <171339034765.54602.16408540374552896913@gjsousa-mobl2>
 <20240417222747.GN6571@mdroper-desk1.amr.corp.intel.com>
Subject: Re: [PATCH] drm/xe/xe2lpg: Extend Wa_14020338487
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.de.marchi@gmail.com>
To: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 18 Apr 2024 11:55:13 -0300
Message-ID: <171345211325.2007.11832822370391768398@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR13CA0104.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::19) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH0PR11MB4984:EE_
X-MS-Office365-Filtering-Correlation-Id: 30c59c00-d87e-4b79-95b4-08dc5fb79052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gAhtT3bpqYL5DiV8qkiwK3fkxPDAY0pA/jslYSooeOCPqM2SCAZ+Hh+OHR36NWrFhrlA7eU6jjljtfAw3gGTc1t9iRxuQZJ9UnyjaIj/a0W5NFeC+OspL5HnRHMtHZpfvx9wqBKuo7mpwaK58b9Q4S27TgOiJFWHSyjtunuluKWYVWro4eFF9IaC0+8QPykeMP3IU16JjZoT0piy33ZQ+eeEz/iXwG000h04Et43zkb4l7ril+cNZcQPFub69LtcOHl7+VeJSC4Je/EVjNsx+6on77hjo88Mlb6mFyT7J99QBPFrcSb967ipWBH70d2wLxmyHmg9DgndyNe7SENLklTlE+HzidmgsPOFpE9aSh2ZaVIehdfhICAKu+RIHXyVCoNtcCL5C4Lv/nxlFqHNyWNqUOZGlgIHoQmDa1Hp8bPbe/0UJfFC0tUq9f/3TsCoWv4DWBMCYMRHA6lvMBEp/833LsbGf7HVUVT8kTh6+e2oFDmKng0aoGIpoX4yaCYOBX70Pyk0NV75JvwFwe2xo7mo9qGh2R1PI2ThGcJKeyLjLjoiJZ2g3b7w6AI4MZgII1fndYiexnsMg8gXlKIGNPw55NvWjMdSa/vfYTcvnetR+d/x+qd6rKXG8hDCnvy1nDn3DNx69kpV09c/uBntPFxKfoijn/7NKV9YZE12woA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0FTL1cwekxtdWt0eEp5ZU5zaDJscGNEa1A3b2VHMCswbW1BbnlRTEM5c1RW?=
 =?utf-8?B?L3AzZDhsUlpMcGZBdXBoM0pJSGMrZDJDWEZscytuN1ZvNXVFRFZFZjZHMzI0?=
 =?utf-8?B?dEtRcURkSVFCOHZPOHdIc2cxZkh6WDg4TElLMlFIVjdsd2ZjNjVxaHp4Ky8r?=
 =?utf-8?B?WHFZejRuYTdDaTN3VXJBVDNkU0JwNTdpckxURzROMkJvNzVDNmhGUk9Ib0VO?=
 =?utf-8?B?dnh3NzNsamRBbGRyY2RjWExFNWROR012Q09Nam5uWmFIQzlmTHJZV0lkaWcr?=
 =?utf-8?B?UUlXSkFJMjF0bFdXS0gwZEZydEd3NVVXeTBodXpRdURpVWl0UWM0Y3hBTG9G?=
 =?utf-8?B?bnhSb0dCbGRtb2FJQU9oRzRZYnZBc2FkRHlwY2tlcS9jLzd4bmNMQkFOcFVa?=
 =?utf-8?B?ZkRrdGlWWjJWOWpYemY4YU5zZTVLaEhVQ2IzeTF4TFh0cDF1YTRXRmJDSHJF?=
 =?utf-8?B?eWpSMUQ4UXRrTFcvZXNURUhnTnV3cFQ1S0VJQkx2RnRlS1ZURlYrNEtHNGxl?=
 =?utf-8?B?UmNPSWdWWm14MWlNS2VaNXNTZm5jS1piNFhvamd3Qm5wMm5UWUl4OER3K3JC?=
 =?utf-8?B?Mm52R2luUUtnMjZXY25CbUhQWHQ5bFcxRXBiWGlweDc3dndXcVM2S3BaeVZH?=
 =?utf-8?B?QmgzSTNQZXMyU1NUM3VvQW41N2EzTnFrcjYyQXRsbHdja0I0ZXpXbUIrT3dR?=
 =?utf-8?B?dHVxZHByN0tKK2NFY1VPREtsR00zQlArMDV0R3hZN1hibXBkSjQ5VFBBcDYz?=
 =?utf-8?B?VHpsMGZYdWVzM3lya3k2OVI5QXkwTXRaSXdER0JGOEhJL053REdGWjV5Rlk4?=
 =?utf-8?B?V0RDcU5NdDBIQkxhdTA3bW1LRXFkZ0VNMWVydmZiS3lqUlJFLzVka0lEWURz?=
 =?utf-8?B?OFVsUTE0V3p1Um03Vi95cWNpc1M3MHJSSWQ1RXlNMW5pb0RvdGYyUkM2QlRn?=
 =?utf-8?B?c2ttMFdJU1JNL2djKzlxbW5wTktxd050b25Fdk9aS2ZKT3JZYlA0ZzU1aDU4?=
 =?utf-8?B?R21NMmpSVjJHeC9YM3NQSVFIa3VFOStBQUorMVBoNWN2cGRBNEs5alFwTjJQ?=
 =?utf-8?B?NFU3d2g0TVBwd1g1MzNJVEs1V1dhRkFQUlFIMXk2eFdjZTdSVWdSMDBLcHNs?=
 =?utf-8?B?aEZJR0wzTklKYWZlTWdTSm1aTCtYZ2lwc3IxZUFXT3Eyb25FUUtRNmo2TE5r?=
 =?utf-8?B?cVVBMnZqcDJoams1NTlkZUtaUW9DRjVzbW4zS1V3WElwdlpHZ0dZTmh5Wnpz?=
 =?utf-8?B?TytlTk80a25QM1NUd2hINjZZQ2d6VjE0S20wSHE4Y1YvSUZrL1hubkUyRFV3?=
 =?utf-8?B?OHZWcHdIejFRNzczVlJURXY0RVZoWGI2TEJFM0pLYjBjUHhJSUJKOXJNdStE?=
 =?utf-8?B?RkxycHFhY1VmcUZYNVFDTHhsY2JZcC9ENFNudGN4ZFllZjNvMHJjNEN3b1FJ?=
 =?utf-8?B?b3lydEpNS3JZNGJPTTVqVVVXZFdsS3Q3dHBZd3NITEFydUJLelp5Y2JxbXJt?=
 =?utf-8?B?MW5KZjdSNDNCWE9aMUQ0ck8wbXdqSDJRb2grY1QrKzJ5dzRMTlFWc0MvUytx?=
 =?utf-8?B?TWdrNWJ0dndlRFFka1YyNVpjTkdNVzBFQ1R5VWZHL2lqVko4bVlMU1V0U1Zz?=
 =?utf-8?B?OWNyekNGTENoMHRodGtPRFc0Wld1TUFZK1NSelowUy9YNFlwWng0K0tsaGRK?=
 =?utf-8?B?Qnl5aENqekJkRWcxWWYrZHlNdU12aTlnK1RYYkY4dWtRbTl5WWF4bVZHODZz?=
 =?utf-8?B?K0FDYlAwTmNFaHgvaTk4eHVJK3FvOGRPWU12UXhveWtja3JhRmt1ZFExcnVn?=
 =?utf-8?B?UUY2UDBvOW9sMjNLbFhFUmk1Q0UwOHp3NGlLN1dQSHVtL3ZZOVQ3Z2JiUUFM?=
 =?utf-8?B?U2dDWG9vL0JWUnRFb2tCdVZuU05HV3B4UTlEWUhTQTdiS2JmY3duWEdwRm4r?=
 =?utf-8?B?d0lxNjBOZU5QdHZNR3NvSUJJRkxITlR6WUdUUUNuaDBIRmd3eE9ORWlWRWM1?=
 =?utf-8?B?NEQ4dDJ2RHB0Vi9XbkxYc0Z5S0k2TElMQm1yU2NjQUs1SUVjZ1ZnM3Mxbnky?=
 =?utf-8?B?SEZZSGxmbjU5Wmxpa0RZU2ZOZFo1bFl5c0c0VHNTMVZSenJ4Z0FxMi9xVkNL?=
 =?utf-8?B?U2M0Wm1kbVpJRzdKcmJzWWZjUWd1UzFzMDNPTWdTZStlYlBvUDNIUzRNUW4y?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c59c00-d87e-4b79-95b4-08dc5fb79052
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 14:55:18.7382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N1aNJWATm6AWJAFjqPloChzPIHXEq6NXg/eDLmKJmV7dykR1Ulk1Gk1eBjwB7aN2jgM3cZ9gtR7RJMuPcM261A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4984
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

Quoting Matt Roper (2024-04-17 19:27:47-03:00)
>On Wed, Apr 17, 2024 at 06:45:47PM -0300, Gustavo Sousa wrote:
>> Quoting Gustavo Sousa (2024-04-17 18:25:01-03:00)
>> >Wa_14020338487 also applies to Xe2_LPG. Replicate the existing entry to
>> >one specific for Xe2_LPG.
>>=20
>> I would also like to take this as an opportunity to discuss the way we
>> are currently arranging the RTP entries for the workaround. Using this
>> one as example, created a copy of the entry and edited the argument of
>> GRAPHICS_VERSION() to match Xe2_LPG. There are multiple cases already
>> following the same pattern, mainly because we are grouping entries by
>> IP release.
>>=20
>> Do we want to continue following that pattern and keep the code
>> duplication? Or should we think of a way to avoid code duplication here?
>>=20
>> A very simple approach that I think of is having a single entry for each
>> lineage. But I guess that's not really feasible today because I guess we
>> do not have a way of expressing logical disjunction in XE_RTP_RULES().
>
>Yeah, there are basically two options here:
> - Keep them separate for now and combine some of them down the road
>   once we're sure no additional SKUs or refresh platforms are going to
>   show up with versions 20.02 and 20.03
> - Combine them as "general Xe2" workarounds now with a version range of
>   20.01 - 20.04, and then split them back appart in the future if/when
>   some new SKU/platform that doesn't need the workaround shows up to
>   take the currently unused version numbers.
>
>I think we've been going with the first approach because during early
>enablement of the platform it makes it slightly easier to quickly
>compare the driver's workaround list against the workaround database's
>list for a specific platform.  But we can also get a runtime list (i.e.,
>what's _actually_ applied) from debugfs, so maybe that's not very
>important.
>
>As long as we do it consistently and put in a comment warning about
>future changes, I don't see a problem with grouping some of these shared
>workarounds into a new "All Xe2" category with the understanding that
>some of them may need to be separated back out into individual entries
>if/when 20.02 or 20.03 platforms show up in the future.

Thanks for the input, Matt.

Since we are already following the first approach, I think we can keep
doing it for the time being. Unifying the those general to Xe2 once
releases are stabilized sounds reasonable.

Following up on Lucas' idea of splitting rules from actions, we might be
able to change direction in the future...

--
Gustavo Sousa

>
>
>Matt
>
>>=20
>> --
>> Gustavo Sousa
>>=20
>> >
>> >Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> >---
>> > drivers/gpu/drm/xe/xe_wa.c | 4 ++++
>> > 1 file changed, 4 insertions(+)
>> >
>> >diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> >index 632bd9066f8d..dcf7ed51757c 100644
>> >--- a/drivers/gpu/drm/xe/xe_wa.c
>> >+++ b/drivers/gpu/drm/xe/xe_wa.c
>> >@@ -445,6 +445,10 @@ static const struct xe_rtp_entry_sr engine_was[] =
=3D {
>> >                        FUNC(xe_rtp_match_first_render_or_compute)),
>> >           XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN5, DISABLE_SAMPLE_G_PER=
FORMANCE))
>> >         },
>> >+        { XE_RTP_NAME("14020338487"),
>> >+          XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first=
_render_or_compute)),
>> >+          XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
>> >+        },
>> >         { XE_RTP_NAME("16021540221"),
>> >           XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
>> >                        FUNC(xe_rtp_match_first_render_or_compute)),
>> >--=20
>> >2.44.0
>> >
>
>--=20
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
