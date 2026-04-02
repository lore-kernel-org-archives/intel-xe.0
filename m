Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D364FD6AB10
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 21:37:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE7410F444;
	Thu,  2 Apr 2026 21:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dZdptq3/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EC310F445
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 21:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775165841; x=1806701841;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=v+D0Bkm7pcXWi4f5MfhUvCaRMuB3XmE4XhPrmA/dRWg=;
 b=dZdptq3/4vS8URacxKvjuFHTtMDxERRbz5xIchpODcCXV3AU7wJ3kxj1
 21N8id+ddhGkJ58A1fhCJuk5jFSyOC9dGX5pDCY7eL4F30x2fK6D9qqL3
 u0f4vvSVUyVQYjhQO1Bj7DR5BADjJiIgSzHPVafdUeokT66k1+lAZ3FqD
 U9TmR5q7FGrQ71dxVZLoXHGjYfFiIJhpkFkYL4J1LTqkdUWdAr199m4Bb
 g9I4u9KeiUrh9F79MOPQ4kINgeJNchrUph0VL6jnKFAxkzSB4CDrQw8ly
 PkQxuF0mWGGzzNAe66LkUhMkFOyJvVfb/Jl/oqv4amBHRIsdIfoj52ldh Q==;
X-CSE-ConnectionGUID: uve2J4cpTyaESC2zVxmNXg==
X-CSE-MsgGUID: BshJfQMLQXqqDDAyybwAdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="78829939"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="78829939"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 14:37:21 -0700
X-CSE-ConnectionGUID: lU8y5yv+R0yqU0c4pPZlxg==
X-CSE-MsgGUID: P7n+XS49Q/C7PVPjcxo7aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="250293075"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 14:37:21 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 14:37:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 14:37:20 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 14:37:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Or5o4W3LFjHjkWO92CovSecaTp+16DIEXizFZz0n0lPyqQ00xwpckppIJ3W1dGK4JsP/G0Lb43NDkV+e8ZaoJnRQhIcbBzfXNQKJ1ZZbdR9fZZADQs++QjvZ3eVSQUDapWJQ8QTNItKyrnRtNEoOscWRHbC1Pjss7VffG8KzgSZcbla6qZZ06rfR266RkA/fUo08Evs5rRnH2REnzefIIgRsTWpco5ZOPACMk7ie++GUTggsgDy0A0in3gO/5fjtz+mPxOqzvOCYZuRPTp4oDhpDfKokfTIeBhZoOMhJ/AW0FLFf6kgqa8zkth7svWRt5HOhmDTLaI13pyrtODbTfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwofKy8W7M17GEymvLWzIb12OBiCmfR34bo3G6wLfD0=;
 b=QW9Ut0zfZcPvfmoZjLwRM4ESndME458biurPGcnT2a+a5ZQtNXNSfrRS8Uim6hlIS7jnUxDMuv0FIMZr/90qY48xAhQcVcaXxb1s/iCreVouJmZgn3aCmfVWY1PmEx3frknoMDxgl/H4Jf6SA5pi/OMwYeJWNg+JghXmLxZj1mPZDQwvr4OKwpFSiTUhRgLUfYYaM0uYSSxZgtZiG2hABsngEHaICLOI+0kGHzOPZtlMbGXVKnK/e0oibpm3uWdXa8MmdBa0NV5HJuHsxb5wUf/shWyGtZrX23k6wWAldz6t/RKCZ951f6P38jzuP4PtdmTmYi1+VD4LLLqwN/teOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH8PR11MB7989.namprd11.prod.outlook.com (2603:10b6:510:258::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 2 Apr
 2026 21:37:12 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 21:37:11 +0000
Date: Thu, 2 Apr 2026 14:37:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Suppress reset log for destroyed queues
Message-ID: <ac7hhMY7sZWW3aT7@gsse-cloud1.jf.intel.com>
References: <20260402213029.3970116-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260402213029.3970116-2-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: MW4PR04CA0203.namprd04.prod.outlook.com
 (2603:10b6:303:86::28) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH8PR11MB7989:EE_
X-MS-Office365-Filtering-Correlation-Id: ac19a066-a18b-4ba3-cf77-08de90ffffd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: XdiTA5kuy6RvcgiW+LJQzIE/D2CTLZ9Kf5AIB80Fo2jFuWgXws1j7AFLOQNbTfU90NvwSocgR2otcs7xZL6UdmYgucMkl36U7AQDeR+JClAQr6jRpvvVw7DCxT6eESuYWUw187OCVXXCqEpHIZmZBB383k+2nWOZWwvBKMZVmmLND9kLUrHYpgI5cDBn/XgTn4j9FoYWmTZsnnCmYHaa+YW6piJFawu3SYXJhkeFph7QhbtfYWoPM2+IYXTUMoP/ey2WXcYdVwRquAgKu2gB+Df69mR1ActzX/FDhDEs0po/5MdG/a4S93NLYIoYoMLn/++Rd7afUDq3OEPvohT5FzwLTaMq6vDxxT7YesqbUhvXfkoKunxHzFw7w5dhNMp4qJo9uzwwLHQ/qXzL4lMe1PeaU5jk8HpiJY/Rd03T6orQm9yMJLlMbRIUiZuZaE/pnEPtOsDBerg2x2JNLe+gIewYaemo7phPzP6TZJY6f7PDTmgENy8jRZ86ihGkbK9zOaoZgTqAhWrescwrKNHMlsbhBWFIAGi9DM9RUVXxn58tFZXLjD030SPQEUU/dM/CGVdki9tq1bM5vB/z8fcSAtAp9NfP+GzqdKeGz3A58IY+XvZj9NI++1sjxi2H5TZ3CiFQX8Ud0+hxiJX8yQAtfLoNRQlRUzRLJgAuPH1XAIli/0gL/7q1nEAoDu4U4y7qlXJUj6dD7ljSkaJ6yGKqFXZh4j8WJAh5YIpvI9ravbM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tjd5ZjVOWWJQSnJsdnpwckF6cmZ5bmNLcXZ1T1RySFBzaSsxN0wxSGRRaVFB?=
 =?utf-8?B?T3NhWHcxL3Z0cVRWQTdkdEhIVythTnF4NUhBbEdYMnRwQWZ0eDhXMnZUQ3Nu?=
 =?utf-8?B?NDI0b2hIcVBXTFhVK2FIMVdaWEtCMmVRT2JEZnJQUXVPdTJyQU1jNGdaNmRI?=
 =?utf-8?B?UWtGaEp5dFV1T3lBcnBBc0QwZlU2bTFJcWxaaFN6bkJ6WVRPa2VCNkhvYWVh?=
 =?utf-8?B?amtrcVZiYTBQS0haVzVxRVZBMHFpTGlKYUxIdy90UDhNczNDMDM5aXY1ZVdt?=
 =?utf-8?B?SGxhNWE2SzRkVXRpNTRMWENudzgzdTJnUDZhNlM0R0FmRUtObCs0U3l4NFM4?=
 =?utf-8?B?SVI5MFVndnBENkxZenk5dkxUK1NOOVRoeW1CQWtRNHI0Z3ltNERhT3pxWkIv?=
 =?utf-8?B?ZzhITGJ1K0tiR3NmcVplNFlwUG1hSFRNUTRZeGlOTzZBT1V4RnVDVkVYMzZU?=
 =?utf-8?B?VEx2NXQ5Ykc3dnFRZjV4K3BKaVAvak9Oa1lWRmVVNDFuMDJMT2RiM29QSHV6?=
 =?utf-8?B?WHJLS1V1RXJjVTIvcmhaZm1uSlJ2cTBYUFhWeDdPYUNJSmI2aWZSdzU3VzQ3?=
 =?utf-8?B?N05JSjAxMk51bEJMMXVYM1RyenBhaXpPSWJEMzdLdktRTUM5dFpqdVMyWVQ2?=
 =?utf-8?B?Z1hKREhMcEVVempsbDZYUHk0UVIxd1lsSkF2WDNqUVFoWGNnMlJ0eEc1cHR6?=
 =?utf-8?B?UEQzOHNHRjI0ek50WVhTRGJ2M0l6RlhSYk9JZHRHdDhBRytqQzVXMWh3Qko4?=
 =?utf-8?B?ZVhJU0NOQW9ZMnQ0U0lPZngwaVZOK2NqTWRmQ2JWNjEzODA2NFhiNmdFQktY?=
 =?utf-8?B?ajBKV3NBWk1zRVdNN0pPSkFUdWFLWG8xdmpPZlR1ckdXeUtiU3V3QlhhU3lr?=
 =?utf-8?B?UmkzS1FtSDlZeXJ2ZW1Za25JN3RFL05Uc0VKTlRCejM3TXBybTNHRHVyLy9s?=
 =?utf-8?B?bnU3YXJXR2FmZW1NK1VNUXFGa01vVUduejhYS1pNajFVTnVFeXhVT1VoSnR2?=
 =?utf-8?B?UTdpRTgwWU1ZaTZpNEgxcFZTZjJQRXBBa0srMzRvTDBZWUJjK2pZdDdlVTBr?=
 =?utf-8?B?QTlaT0x4K2hLcy83WjBGVklGWkZWZnpYZFNNdW5rVmI5NXJqRFJsUGNraDdw?=
 =?utf-8?B?TmdEQjlWTExBYnZPQzdwWUxJek5uUHJDa2hSK2RoUEIrVlZuZVkzMTQ4eisz?=
 =?utf-8?B?VEgyci9taEpWdTZaQTBlTGRTbGRDOEZXOGJqSnQzWDBtc3hsVHQzYThocnZ1?=
 =?utf-8?B?V2pvSC9aODg4M1BVUEtrT0ZFcDEzVUp6OUVmcHZnVXdZK2t0dktrelVWcHlW?=
 =?utf-8?B?SlFTQmxNMWtFaFFLakJPZ215c1UyYW5hUlc2Zzl3eDlRZURhcU5JN2E5VVlB?=
 =?utf-8?B?ODZtanhjWkZSMlhUczlrMWFxa1pQczVRSmJKMDQ2ekxwMmp1WmN4RExXLzcy?=
 =?utf-8?B?N3FIL2UxamczMUZzZTBCL2dTMUxMZmtUUXZHdDczMjZNYzBDNHRkNjFyNGJ0?=
 =?utf-8?B?YlJrSVlkUjBTV2JFbFp0SldFOTM1dm16YVdySU5adjROYWxvdytPbWZZbVJu?=
 =?utf-8?B?MXBZNUUwanYrc25MYk55bGtwRjRmMktTQllvQWZuSGtzWDB5MjAvVjQvWnhj?=
 =?utf-8?B?a3gzdmZ0SzRDVGpDSmJRazlna21seEpRUExwSkNHTHVhM01JcVd5NEhYNnlJ?=
 =?utf-8?B?M2ZkN21ob2phUWpuTEUvZzBwczVIWnFka0FFZ2xOdVp6dDNhcllwczFQMWJ1?=
 =?utf-8?B?QllNZ0MrK0ZvWUY2YWNpLytmMWswRDlBS3NySWxOTkNlWUlydkg5ZkdJaHBy?=
 =?utf-8?B?aFFoTkQ0b0RWT0JsVkNQcEMxT1pwajZHQkRIeFYvSmhpb2dORktndzBMRm1w?=
 =?utf-8?B?MCt1ajVZbkx6VDh0dlFaWXV0cW5WNzRPNFY1QjlTM0FIWVJrQldHQituNElz?=
 =?utf-8?B?eXFkbFRIZE92TU9UbzVIR2Y3Uk1xUXgwWnJhU3o4NTFhcTNjbHNMTUpsM2FF?=
 =?utf-8?B?TkpNbytYaEQwcVpRWnMrZi9hYlppUlNzSWcvakgwNDl6dVFVZ1hNNW9QWWE5?=
 =?utf-8?B?R3RFekNRdDJoQTd6MlpBN0xHZUdjVzEyN0REb2ZnMTkxSitOeVk5M1dHblkz?=
 =?utf-8?B?cGJCN1dhaTRldUljakxubHdrT2JTYmJyQVA4MmR4YjVvRXE5aE9kM1o3S1N0?=
 =?utf-8?B?M1lwZXB1dnExdTFuYzBWSWVpbTMyaXAvaDhuR1IxYys2OVJWbUprSE1Ca2Rp?=
 =?utf-8?B?ZExoSVBzYW52ckpmaEM2SFdQWW8rWlQrRGRwcU82YytPUXRlLzgwUlhQV3Mx?=
 =?utf-8?B?Y2Z4R0RMQ3IrSmVMVW5BMXJjVEhSYk85cG9XZmU0ckJ1MU5MR0RnLzZ4RXFT?=
 =?utf-8?Q?v3PXVglaf7tD+3Zw=3D?=
X-Exchange-RoutingPolicyChecked: Uqoodr4n+nXi4ODzKhBKvj2js9Z2RpRqzEHbKFYMhiEGWosi99ErkO5gfS1kGX5nrYbjQsxnvIApznLNFW0E5/1/3/wmiFj00HFX7BG89d6o+ikyS46b4+VoxJKu6rCx2I314++Omex6HDIpPHTO+ffoHeitlN4EsAfT9HZcAMtrgrlcnH0G1SP5uqLryk127dyyXzz84kE9sCJtcB9QSOhutQTntawPUFcMKXwl2tPTQVEdlNORWeFI28z57/20BcCmjTpUw6kQnib7pGd9xhWHGJEInAROHE2wnb1PB3c181nxMkWZVjeTnChk8erhvE+uQOlkyEuHwSLRGyHmJA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ac19a066-a18b-4ba3-cf77-08de90ffffd6
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 21:37:11.8110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G1ihcMA6KD1V0QyqTTiHMKLxtXBw6mx37VJoeVIiPSIl+q1U4GZTH6brW2Z3BoJpruvnft2qUwoFgpywn9t3Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7989
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

On Thu, Apr 02, 2026 at 02:30:30PM -0700, Daniele Ceraolo Spurio wrote:
> When a queue is destroyed while still active on the HW (for example
> because the app owning it is exiting abruptly), the driver tells the GuC
> to preempt it off the HW immediately and to reset it if it doesn't
> preempt. This can cause a reset log to be printed to dmesg, which can
> be confusing to users as resets are commonly tied to errors, while in
> this case the reset is just done to speed up the cleanup.
> Given that a queue is only destroyed once all refs on it have been
> released (i.e., no one cares about it anymore), the log of it being
> reset is not useful and therefore we can simply suppress it to avoid
> confusion.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 10556156eaad..e6702bd99309 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2968,9 +2968,10 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	if (unlikely(!q))
>  		return -EPROTO;
>  
> -	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d, state=0x%0x",
> -		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id,
> -		   atomic_read(&q->guc->state));
> +	if (!exec_queue_destroyed(q))

I think you want killed here—right? Destroyed is tied to the refcount,
whereas killed is tied to either a user closing an exec_queue or the DRM
render FD being closed. There may also be a multi-queue case that needs
slightly different logic. I forget the exact multi-queue teardown flow,
but IIRC it is slightly different. Niranjana would likely know that
offhand; otherwise, I’d have to reverse-engineer those flows again.

Matt

> +		xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d, state=0x%0x",
> +			   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id,
> +			   atomic_read(&q->guc->state));
>  
>  	trace_xe_exec_queue_reset(q);
>  
> -- 
> 2.43.0
> 
