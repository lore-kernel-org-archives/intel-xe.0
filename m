Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AD2C5475B
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 16:45:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA7910E3D7;
	Tue, 20 Feb 2024 16:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XTN+82Hv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4545D10E4F6
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 16:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708447551; x=1739983551;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:cc:date:message-id:mime-version;
 bh=JZs4uqQDB3FIa5GGAZDhrbm+fC7qUSSHU9Y4DDz/S2A=;
 b=XTN+82HvhkQIxyCChYS1PFZnMXutDsag1OiRFwnLPYy2XUjAPV83RZa0
 d4On12PY6frHCpa/0jqbocdznGHLnu7HcY1mxLMEz80+GA5eMAlhlzekF
 ShH0HWHbHNM1ARQPbaEerCBscHZ3/n9DI+Cm33Z4V3UnKLbZMJn3WbAlw
 fFX5j/xNg7EntD1QTp74ZvUH5KAdUICpnv22OnuzobjrZV8qZvrHBgSp+
 eZ9GqZUXQALMGuQOSAUSIKIbWcOSXedfm/hPKPtS3lby0yU6Vl5f5MmvN
 1pley10DDADfYcpQbQcne00tJxJF7XyL1X8tuRaRFdZL7RIMxPkDTTrzH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2468675"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2468675"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 08:45:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="9405880"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 08:45:47 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 08:45:46 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 08:45:46 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 08:45:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gum1ceayesg+S2brdmvjkv2eM+zQgOs1jltVAC6wcd2lerFg/P87RM6tb/Ql/nlG6MAN8uQY52mgcKLC97Cz/gj38RJzptT4O02h3ZtSSlqhti5UdfE6orTrXJEKjeYdTJqngLhzgelS5WlBNFzYbjZF0+BOQzCEc9m3cxtwHcZChpqFMYae9w/3uXV6/g8VJ2zpBvEsR5pLwfcxVQSYKuU9Yhh23JI1c3+3oKpv0Ewex0s5nauayknP1cyWrPLHqwziI1FhdkXQep3XVs1dS96KPS82bHRe/JX/A636lmX5BEPimi3adi7rYwnkR6o5JL8Ub0VxtASMwsxJqKU6TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcZturxAwft4jSCkPe5TxCKZNYr6icnNvODORAgns8s=;
 b=L+eUGt9fbholMrJ9y/hKkwWiUefHLHZpo9W4b3JhNJZtAqawYXj0MeMIBeaDp64HLc4MQr+/X8GVVaQyrX4C6yTwmftwKdBUgiFM+8/PkfxirIv0uCReHkIKRAAPIUcEw8W0rNbKkXCw470giDu3O5Vi2HlBdvGB+GMtRiveiasU3xYYSRrct+UskihFeCjMAPHpw7WxCmqDNdKka9K74xBxIzQxGsKF8qDYPoF8Yjvh/ybziQNTlQL8QYlIJlkrR+Jq5h7DubC2SRrNbmqMcllBAyGTIXBmdXvchpyJ6uk3mDLIQMakU1R8PVFF1FQnI4TB4Zz296NC9NS3KXmtkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM6PR11MB4628.namprd11.prod.outlook.com (2603:10b6:5:28f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 16:45:43 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::64e6:ee24:79f8:efa]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::64e6:ee24:79f8:efa%4]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 16:45:43 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240207103007.665367-3-luciano.coelho@intel.com>
References: <20240207103007.665367-1-luciano.coelho@intel.com>
 <20240207103007.665367-3-luciano.coelho@intel.com>
Subject: Re: [PATCH 2/6] drm/i915/display: use wakelock in the remaining read
 operations
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Luca Coelho <luciano.coelho@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <uma.shankar@intel.com>, <ville.syrjala@linux.intel.com>,
 <jani.nikula@intel.com>
Date: Tue, 20 Feb 2024 13:45:39 -0300
Message-ID: <170844753905.44184.14573630659444462264@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4P221CA0021.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::26) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM6PR11MB4628:EE_
X-MS-Office365-Filtering-Correlation-Id: 21209fa1-c8ea-4033-1ff4-08dc323360fe
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 535WUmlTVVLo8HYlx0eJpDG8CjEyodPWsKJiApjGww8eV8DtgkQWxehw5sq3xmHrnc4qAz6vP7fSig87fljXwcoEs5BgqykQfVw/0SFfeOmK8flrrtaLYLMdBE5oSyUfSjUfaVyZ50fUwKnDUZw9tMRIM/FYkHPqWI9n5WmZdgfNEypZhebJYZF+9ZZ86EIYoYDMI0wFUcd5cecvaz8wILs3E36N4apjkbmr4/xuTkcLc9qGYFw5GhCHcXPGz9D7X7V5g9lzc0KyC5ZGME7s+tZEdvBmAPgULjGhgewa0Yb5ZnhVghW8yJeh6F66ux1EnQHjKcEjSLbP8yfX6tY4UwjZ940dfWmW8c5Vd3JFmu4EYO8Mipy0dcaK68ZI11QcDaRbhyM8HTOpoBHxOm4OCWVMdX6Wqvn0V8NPDJeO+1bXc6uxO3SMfsYh5bE4nxk7zQesdpz7vXcX6NNvfhucZ8Y1+dERqR8YW2lg5n6UBFNpzIQa4mO9Hnt0AckC/YHmUnpwojfzFLKORRnLFfOfI5bPWUlwcok5dl5C+UMFpKE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emF2U1RGdTQyalBOOHFidC9pREF1YlF3RDBndzlXMlh5ckh2b0RudEVyOHlV?=
 =?utf-8?B?SnhIUFFUNHhnWms2Y0IreFlJQ1JlSVY4OEpsdURsQlhWbXJJNC94S0NqeHpJ?=
 =?utf-8?B?RmdIUHZrK2xVTXRzUkhPd0d5eTFRR25ORHVRZjNMM0M4SlZ5d2xnN2RsSDVk?=
 =?utf-8?B?UWhsdjJXT1U0WXZ0VVljWFdLVzY5WVBYUlo1UW5HdC9TM3JWcWNNTU1CMGJK?=
 =?utf-8?B?NW1iK0pnaG1IeUZOTTB5QzNBK216KzBRcU9wYXQybndWUHdOV1Q1MmxxWS94?=
 =?utf-8?B?QkVTSWpYNjQvNHpvWHhIVk0wcGdYMXphVEx4eDljYm8wcnFqS1lzMmYzUHlY?=
 =?utf-8?B?WTlXbjFCcVdWai9IUDZ1OWhVZzY4TGNMQkFOeXErWko1UmJkYlVYUkpUclBW?=
 =?utf-8?B?Rm8xVkMzS25IZlVlQ1kxTkY0czNhOXB2MXdMRUYvSkczNjBGcDYzLyswcGRM?=
 =?utf-8?B?ZHU0LzU0VEV4RjJNU3dGb2R0R0ZTS3ROWi9wM0R3ZldwUnJlcGhQaTdVSE5X?=
 =?utf-8?B?Mml0WXhzRVFZeDM0WnFaaUpHcHU5azZaekZrTUhlTnpuSkRaaUhRYWVsNWVt?=
 =?utf-8?B?M29sMnZUODhaYzRZZlF3dWJHM1FLMG5NUGtuTStmYWJsOEs3d1ZXNnBEM0JN?=
 =?utf-8?B?K1BXa0ZlVlc3MkJESVpiSmFSYk14NHc4dTlHQWhCTnVLZ21URzNURm9reERB?=
 =?utf-8?B?MUNvckZKSU1LdVQzR214TmZwakFvanZoTzBvQTZoUmlRang3L0Z1a1JENE50?=
 =?utf-8?B?andQZkxqTEpUM0dJMTRVUWhldjZwWXBlRjB1RmNWelU4RUxoUVV4eG9PZjdt?=
 =?utf-8?B?NWZKSVZwaUF5bTRYelQ5Rk40S3VDaUo4RHRIc0RyQkpIRnZIeFdPODFSQnFj?=
 =?utf-8?B?cEpoaWZPZXk1MStEaWs2MFRPSXpzWjBVaGk0MXdYR0d4bzI5YU44c2s0RVBE?=
 =?utf-8?B?cmRTN0FFMXFRSFcrQTVacDJxL2JmYTRaMmR4K0R6dDRUTitsM0tDMk9vOWpW?=
 =?utf-8?B?Um5TemRLOUpOWEdrUElCbURsT2twK04wVU0xdGptMURiRUt4cXJZQnpoejFj?=
 =?utf-8?B?SEhHMjMrUVhpSy9hK2NzTGlMcEdnRExRMVFWUUp4dEhNVTF0b0Zhb05GNklz?=
 =?utf-8?B?TExEaUg2V0RtQ2I0NG5EM0MwUFJTdnJqcDRWR1RlRTY1b2pMaFJ5ZTI2OWxT?=
 =?utf-8?B?Skc0TE9DQk1kTklYVGk4OEVISU1zL0tXQm0wMzV3UjJKZUVTNmRMWjJXQnNG?=
 =?utf-8?B?Y3ZOenlpZFpFVGlYdVR0N2N2UGV6WTh6RTJGU0FJRHA5ckhHQjd5QkU1L3hz?=
 =?utf-8?B?U013VE5iSlo5RnNDdU0vajJxZ3I1SC9ZMitSUnIwVk1KUmd2WlJSRDdpampj?=
 =?utf-8?B?cTFuRWtTZVpZQ2FwQTMvRE9pMkVEK1p1a0RjQXZoSXQwRi8za1NadWVxSDdN?=
 =?utf-8?B?S24rS3Qxd0ZFY0hMZFM5ZFNGVEhST2xhcGl5c0tkNHp4ZFJEZnVvems0cXFp?=
 =?utf-8?B?UUlDVEU3N01VVTZSdVc4QXVVZUVYcnlXblhtWlowVTBLNzRlUDFmODJ0bHFD?=
 =?utf-8?B?TWkzWGduYWpTK3ZobmhhTVJOcmdHQ0tNTllHTkJ2aGg4RWV4QWVpZGJsd2Y0?=
 =?utf-8?B?dG1mQUlteGpqZnFpb1VzaGdsM2ZoTnhlOVZBNnQzT0g5TlNiNjhCU2N2TDlz?=
 =?utf-8?B?MWo1QU4yS2hqT3JWbHZBSkd0YlhuZ2ROU1NJdEZEc0Q1R0prclNXQjQyMnkw?=
 =?utf-8?B?eGFxczV5ajhORzZKZHVyK3JSSkJSajgvbTJlMElSRWt1ZU5qTDdCWUFqNW9m?=
 =?utf-8?B?NEdxbDlTeW5EZHZQZk1WMVkxYnBKSEwxL3dONVlKYzc0bXY1YjIrMmVaN1Mw?=
 =?utf-8?B?K2M2NEFMUDVWYnI1STFrR2x6WmR5MDZ1MXlLZlBLL29pOWJKamdJK3lJa2lm?=
 =?utf-8?B?alpKc0taeHVrajVZblVnSUZJWm5sTVdyMVJHZys4REJpMko0V0xDVmNUckY4?=
 =?utf-8?B?bEIvTVZqR1hvbnZGUWhxc3Frb2pJdGJXLys4bXlpZU85WTY5SHQ1NFhhbk9x?=
 =?utf-8?B?Q3RUMjF2RGFpUmxMZDhRazlzMnVaMFlLb0p5dW1jcVRTYkM1ODJsanBKVXdZ?=
 =?utf-8?B?bi90TVFIRW4vRHFOS2pOVUd2M21YbVhWTEpPV053ZUl3SGFrMm9MNXBPaTB0?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21209fa1-c8ea-4033-1ff4-08dc323360fe
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 16:45:43.4672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FTetYiSbLhj6s/3hVsYzCoZKelu1CpAWg7xBWFu9HS6dlJxPjvKHNn8Ls8ZDLhCLSbQexl390cl9CfQl/BGvYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4628
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

Quoting Luca Coelho (2024-02-07 07:30:03-03:00)
>In the patch where the framework is implemented, we only add the
>wakelock usage in the read-modify-write operations.  This patch brings
>in the wakelock implementation to the remaining read operations.  The
>idea is to keep these in separate blocks to ease bisections in case
>there are any issues.

Hm, while I understand the motivation, I can't help but think that we
are making the first patch somewhat incomplete. For example, if we were
to pick up the first patch and then have a new one on top enabling the
DMC Wakelock, we would have code paths in the display code that would
not grab the wakelock.

Furthermore, not sure if we would have bisection really working here
(without further instrumentation), because the wakelock feature is only
enabled later on the series.

>
>Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
>---
> drivers/gpu/drm/i915/display/intel_de.h | 38 +++++++++++++++++++++++--
> 1 file changed, 35 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i91=
5/display/intel_de.h
>index ef24748d522d..0bf73b1e1cfe 100644
>--- a/drivers/gpu/drm/i915/display/intel_de.h
>+++ b/drivers/gpu/drm/i915/display/intel_de.h
>@@ -13,26 +13,58 @@
> static inline u32
> intel_de_read(struct drm_i915_private *i915, i915_reg_t reg)
> {
>-        return intel_uncore_read(&i915->uncore, reg);
>+        u32 val;
>+
>+        intel_dmc_wl_get(i915, reg);
>+
>+        val =3D intel_uncore_read(&i915->uncore, reg);
>+
>+        intel_dmc_wl_put(i915, reg);
>+
>+        return val;
> }
>=20
> static inline u8
> intel_de_read8(struct drm_i915_private *i915, i915_reg_t reg)
> {
>-        return intel_uncore_read8(&i915->uncore, reg);
>+        u8 val;
>+
>+        intel_dmc_wl_get(i915, reg);
>+
>+        val =3D intel_uncore_read8(&i915->uncore, reg);
>+
>+        intel_dmc_wl_put(i915, reg);
>+
>+        return val;
> }
>=20
> static inline u64
> intel_de_read64_2x32(struct drm_i915_private *i915,
>                      i915_reg_t lower_reg, i915_reg_t upper_reg)
> {
>-        return intel_uncore_read64_2x32(&i915->uncore, lower_reg, upper_r=
eg);
>+        u64 val;
>+
>+        /* Both lower and upper registers will almost certainly be in
>+         * the same range (and very likely one immediately after the
>+         * other), so we can check only the lower one.
>+         */

The words "almost certainly" and "very likely" concern me :-)

I think it doesn't really hurt to also intel_dmc_wl_get(i915, upper_reg)
here, since it would actually just bump the refcount, no?

--
Gustavo Sousa

>+        intel_dmc_wl_get(i915, lower_reg);
>+
>+        val =3D intel_uncore_read64_2x32(&i915->uncore, lower_reg, upper_=
reg);
>+
>+        intel_dmc_wl_put(i915, lower_reg);
>+
>+        return val;
> }
>=20
> static inline void
> intel_de_posting_read(struct drm_i915_private *i915, i915_reg_t reg)
> {
>+        intel_dmc_wl_get(i915, reg);
>+
>         intel_uncore_posting_read(&i915->uncore, reg);
>+
>+        intel_dmc_wl_put(i915, reg);
> }
>=20
> static inline void
>--=20
>2.39.2
>
