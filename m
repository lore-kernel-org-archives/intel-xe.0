Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C40C48BC3
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 16:46:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566CA10E4F6;
	Tue, 20 Feb 2024 16:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c2nBFP/C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1632010E4F6
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 16:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708447616; x=1739983616;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:cc:date:message-id:mime-version;
 bh=e/dWHSLDfRch9Je8YD7qB5h+5aYNYT7GUlD8xw+52es=;
 b=c2nBFP/Cx7dg7wvgYubHXevMXDDCJpX3/IXCMR5nyD7ktfAkjst8PqgJ
 +vDrW4+tMrEM9T+EQ9w2i4Ou+7vqqXb7KYeYptEpOS1NO21XzGd8wvnGo
 Paf2tCZUBVUa+HnJUUwsQ7QrPf8b7XiwKxD+Ddn9/I6Omf9GhxGB1s/FL
 ksmvI0GlDDf5H09nISnXfkZD5ldPbDbSV8IIPNYIYEZEz1o0VBTBaj623
 zVIE85P7AhNjftZictGRmhqVlHLNYgs9dakUfuGNovrWwdCPkUGUgQN8Z
 gT0cXN6JUxk6YJxebIIRK+uJ7p/JP7S90AjFZThftd9MdlRedBkHKNUXG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="13974296"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="13974296"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 08:46:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="4793484"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 08:46:56 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 08:46:55 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 08:46:55 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 08:46:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adzhiHia3eNZnxn90qn2F1kxKHOPJEmN9JzdX4nq4hmoKIVKCDOvM5WeTrJ5PTLKB2/mlsPt2QPsTztVSl0j3kzU7NheyQTqnrTa4O/hVlENS9Yf08bMKkzpVSyAO2Z2DQ9G+MmEyhUItPonIg4tlt+gxAqWzlJMi6AyRCF0iRpnO/koPkB9nSTW3MRtgDSiVtGAXJlEecLnhDe5t44dsnecqVRgB8wWk0a6DtOoRjD0blMTF6Jua4Rf9zbSk5ourjXGQ9E2DqYn9UctSDZ9zZgWtvWMNHgpfb9JAoKd38tIbUsk7BUu8Qz0cDMs15KuZhWCSD1616+G/2GBNMpNwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ilHt9QGrCB20eW9V97Bsie5iR7tsMTkYhLs4buWWAY=;
 b=HKPPHdX4/5TfMqPJmDEuwRnxs+lAyBBFv6iZVCAz1QigS3zGJBdky9VacEHEoYTYQQ22G+/X1fevoZVOa/Tm+coWCsHWWJ4Qyjn0Mdp0xUs/BJBceUscWqFtY9xEq2aq2I31XTuvjriqFK7yvEyygfjiBFwDOXaYGXZaEp7yX7E4VB0i6iRIVPvbVZi3O2Kb9CkrbQdv9oVIu0dSUOcuMmV4AL6GFJlbK6LBgsqlsjeAFmW9a3E760oXesTbPw5U1IDWBBuKq1jVagjV5WMfaAWkQxLa5h25UrwXwSAI172TeRmM0UD11cRakXfQbg77DrkH6sC5U81SXLZse1kaAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SN7PR11MB7640.namprd11.prod.outlook.com (2603:10b6:806:341::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Tue, 20 Feb
 2024 16:46:53 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::64e6:ee24:79f8:efa]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::64e6:ee24:79f8:efa%4]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 16:46:53 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240207103007.665367-6-luciano.coelho@intel.com>
References: <20240207103007.665367-1-luciano.coelho@intel.com>
 <20240207103007.665367-6-luciano.coelho@intel.com>
Subject: Re: [PATCH 5/6] drm/i915/display: add module parameter to enable DMC
 wakelock
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Luca Coelho <luciano.coelho@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <uma.shankar@intel.com>, <ville.syrjala@linux.intel.com>,
 <jani.nikula@intel.com>
Date: Tue, 20 Feb 2024 13:46:48 -0300
Message-ID: <170844760861.44184.10196635667916849405@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:303:b7::31) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SN7PR11MB7640:EE_
X-MS-Office365-Filtering-Correlation-Id: 93c4ccd8-96e4-44c4-66df-08dc32338a5e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pptqg5Kj4cmm2rYUGdJzP5wTWoGj1NlXRNncdplQzyeSgIjfkSm6XG0moRHwRjQjg6lZy1HcJu42aipGJZBdd9U/v8NESN4Bbg5zMSTzpRnybalYMfq2u/y6sVFS5qD0pMTgr5Lohccvi2iyXGzaKbVHFb0ntiiLyuCe9TJX7bJeU+hkKNpHrrvp4fcxSDgOZIJfHoJvZzXpRBBiLHS2EsHyBZlW+qDc4KsBAPRBWRcX/0IDlBcLqCDvrKuWKU5BbTn1BxclVMxjXBHz+Tf8n1ZyoxyyWwHMi/pnTyLbRkZtaa06lZhkdbQ878T68O5ksgLREBQG59ZyxlOOfwdMG9AkVpkY2CikoO72fYpIhJlEaZ/KvkctFszmB30GzB1c8d6pEc2uadLKs5sx5T8PR3dBc7/jTVv4nWdwU8VGg4Rqw4S9s5Z21k/ArV4sq8MNuzxVCRxOdCyghFW8Rp7UDcB9AgRqt3nwqsY7DaTm+wHEVU89MO4FdGqkPzavlG+o7T5Sifx+RV88kPHS/3kzVbu/dXt4iGhJ0cJgYBzDKYw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTUrQ25teTFzTFVVVWZlNDVXV2krQWdnTXF4RU1IZGNoclRmWTlSeW9wcThE?=
 =?utf-8?B?NnozVWQ1OGk5ak0vVUc3NlBIRlkxTnhHdHY3YVI5OVA3K0J1TmtreWFmN1hV?=
 =?utf-8?B?d0NVMXV2dnV3NExwVDNoM2plQjIvQStLUzFqdnY0aFNaUXl0Q09sSTBJZk5k?=
 =?utf-8?B?dW1rVUdZOElZRTBESW5VSGEvZy9ndkxReFRoamY3MCtHZUtuZWs2U2crTjlF?=
 =?utf-8?B?aWgrLytSSTJycVVJRlNaTzRlZkhUdHVHZEFrSW44UVdHdlRMdVlxUkEzOHZK?=
 =?utf-8?B?WWNwWU1Sb2wycVhyM2FpSHV4eVFlU2dTREVKYmQ3Nit0NjlvbWpmbjRLL1Fs?=
 =?utf-8?B?K2MzZlZ5akxvYk5jQnhSNmdDSnpHUy9TVFlqTmhYU3ZvV0FnRkxtcnRWVmZs?=
 =?utf-8?B?VFZkeFkvL0FNUXVBa3h3UHhkUTl2REMrMW9iVFMvcVZkbEZiN0NKWWFkazdP?=
 =?utf-8?B?UWRYKzJHZEZ5aVJiZFBwbkNXUWtmZHAwWVNrUnJHWkR3OHNzUld5MUFqNUwv?=
 =?utf-8?B?Nk92RHdMdHNVMURFY2g5ZjZyN1k0SkszOHVsQUhSVDh4Y3pESDF2Uk9mUXB3?=
 =?utf-8?B?UGlsM1JGb3ZGYkFwNGZlMExrekUyQXZqOEVtRlN4VHJ4U1BiQjZocUJrNGN2?=
 =?utf-8?B?Nmt5amg1RGoxZUtka29pbFZGQ1h6VThJZHdWM3hSM2xYbkR6QzJ0VWtUcXVz?=
 =?utf-8?B?aTVNOXhxMS9VQ3FieHhEUGZlZjM2Sm1UYmNVbzVibVlBaE9ra2hXZ29LMGtD?=
 =?utf-8?B?ajZMOEZ0dkJTaCtSbEhHUUZhckpBUmo1SDhDTXkzK044S3RYVExYeVVuUjE4?=
 =?utf-8?B?VGI1L2dEZGcvK2ErSXlWVTRRMEVBdnZZcVJCeU5RWDR1U2JpZWFLSVFDenQw?=
 =?utf-8?B?RGF6dW8yS3FYNGxqUjdGN1BqKzZ5MzBTZWNhOG94SVpKYm5xUmdPeGUyZGNi?=
 =?utf-8?B?bmJWNzlxKzlIRndpeCthK3RQa2J6U0MrRzNJaWxxWG5BSnBQanUwbVpnNktG?=
 =?utf-8?B?WkFjbHhQYXMwejNvd2dRalp6eksrdzRkb241QXFjN1M5MC96ekpwZHRDWmJJ?=
 =?utf-8?B?YUpUbThpOGZJNGtkb2pqeUtCMER1aTFoUWk4ci9DOEczbTRHbzgyM2dNeE91?=
 =?utf-8?B?c0V2blRMTTRrRllwMjlBUkNmMGFESGZWNUdFWUIwZHBidDhGNFZGT0tIZHhp?=
 =?utf-8?B?V09iSytDU29YSTUxUTBOV1dkV3dQVDk4YVdLeitWTUQ3QzVNNnRFUktmYzYr?=
 =?utf-8?B?eGRudXl6eXFhQzVEZWY1NlVORmZxVElLS3I4a2RieWNrR2lNSUZ3RkZ2cjBz?=
 =?utf-8?B?QWdQdFRwejZzaG53aWF5RWpLMVVla1ZLZzBoUUNZNjUzSW14WVBJOUt3SkRj?=
 =?utf-8?B?MUt4ekpNeitXVnYvYUJxeVhKQy9pZDJKaGFwTHZZSVF3K3FMWWNsVXg0d2RN?=
 =?utf-8?B?WStSVlcwNU1ORFVSRHhEanhrbW51bEtISDY4VVkybDZESUFheG1RSEM0YW5u?=
 =?utf-8?B?dzB1SWlUZFYvUGl6azA2bmxoYTRpWXZyTnpKTXBMU0pnZC9UajV3NEdaOGln?=
 =?utf-8?B?c2tTRnd2QXNZSWFHUVd1MThmOXBZUUlPVHdlUlVTcWY4eGRZdlhPY1B6VlUr?=
 =?utf-8?B?ek1GeXFOcXVYUlNIRnV0Z3pRR2kvTGs3NkU1WDFhT0dtUkZ3UWZiNDJKZmZT?=
 =?utf-8?B?NURFL1g0UlFqbG1yczE2ZEFOMFJCRVk2ZVp4K0ZDb0dHczV0cTlkdEpFT2k0?=
 =?utf-8?B?R01zWHBkdHBHQXJybTY5L0pRak9iRE1wUkRuNGNUWXhPdlM3MTNvSjNnTE1q?=
 =?utf-8?B?V3ZsQS9rblFvbkhMNHVYeTRJUEEwaWlWUXBVQndKZUVvUHltZDJXRXlDTkdz?=
 =?utf-8?B?YVk2amw2RDZHblM2RCtBZ3EvSi9DSFZjNDFrUnowSWRtbm40cVVsSWMyUWtI?=
 =?utf-8?B?LytNN2Y4RTZZbE5TSGpoQ2VMQVFFZVlTQmxraWR6STFtY2w0YW1ZNzZzS1A3?=
 =?utf-8?B?SHptall3eCtEVHpNWHlVMTdhSGU0Z2wrMkdObGlEbTZQWmRkN1ArNEI3OVhv?=
 =?utf-8?B?b0sxNUxOcnZjMzBlMy8rV2JSRnlUR3dxZk93K3pYRGt6Zmc1SG5JUFJEQUFh?=
 =?utf-8?B?QWxUeWh1S0xkRHlnOWVJdk9CRlBiSWFmYTZFUFJhYVdxanJYVlI4OGtiNTZZ?=
 =?utf-8?B?T1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c4ccd8-96e4-44c4-66df-08dc32338a5e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 16:46:52.8988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8FCMYQDG7lKvLF+Lvkg7SqlJmcSURf4Zoj9wDABwZRsMvS96WwnPkWgXOnY1A3CAX+4SqIT5slPlPQpoykFwCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7640
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

Quoting Luca Coelho (2024-02-07 07:30:06-03:00)
>This feature should be disabled by default until properly tested and
>mature.  Add a module parameter to enable the feature for testing,
>while keeping it disabled by default for now.
>
>Additionally, only allow enabling via module parameter if the display
>version is greater than 20.

I would have two separate patches here, one for the display version
check and another for the module parameter, since we are dealing with
two different concepts.

>
>Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
>---
> .../gpu/drm/i915/display/intel_display_params.c  |  5 +++++
> .../gpu/drm/i915/display/intel_display_params.h  |  1 +
> drivers/gpu/drm/i915/display/intel_dmc_wl.c      | 16 ++++++++++++++--
> 3 files changed, 20 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/drivers=
/gpu/drm/i915/display/intel_display_params.c
>index 11e03cfb774d..f40b223cc8a1 100644
>--- a/drivers/gpu/drm/i915/display/intel_display_params.c
>+++ b/drivers/gpu/drm/i915/display/intel_display_params.c
>@@ -116,6 +116,11 @@ intel_display_param_named_unsafe(enable_psr2_sel_fetc=
h, bool, 0400,
>         "(0=3Ddisabled, 1=3Denabled) "
>         "Default: 1");
>=20
>+intel_display_param_named_unsafe(enable_dmc_wl, bool, 0400,
>+        "Enable DMC wakelock "
>+        "(0=3Ddisabled, 1=3Denabled) "
>+        "Default: 0");
>+
> __maybe_unused
> static void _param_print_bool(struct drm_printer *p, const char *driver_n=
ame,
>                               const char *name, bool val)
>diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers=
/gpu/drm/i915/display/intel_display_params.h
>index 6206cc51df04..bf8dbbdb20a1 100644
>--- a/drivers/gpu/drm/i915/display/intel_display_params.h
>+++ b/drivers/gpu/drm/i915/display/intel_display_params.h
>@@ -46,6 +46,7 @@ struct drm_i915_private;
>         param(int, enable_psr, -1, 0600) \
>         param(bool, psr_safest_params, false, 0400) \
>         param(bool, enable_psr2_sel_fetch, true, 0400) \
>+        param(bool, enable_dmc_wl, false, 0400) \
>=20
> #define MEMBER(T, member, ...) T member;
> struct intel_display_params {
>diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl.c b/drivers/gpu/drm=
/i915/display/intel_dmc_wl.c
>index abe1ea92cf65..21ab67805ff1 100644
>--- a/drivers/gpu/drm/i915/display/intel_dmc_wl.c
>+++ b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
>@@ -79,6 +79,10 @@ void intel_dmc_wl_enable(struct drm_i915_private *i915)
>         struct intel_dmc_wl *wl =3D &i915->display.wl;
>         unsigned long flags;
>=20
>+        if (!i915->display.params.enable_dmc_wl ||
>+            DISPLAY_VER(i915) <=3D 20)

s/<=3D 20/< 20/ ?

>+                return;
>+
>         spin_lock_irqsave(&wl->lock, flags);
>=20
>         if (wl->enabled)
>@@ -105,6 +109,10 @@ void intel_dmc_wl_disable(struct drm_i915_private *i9=
15)
>         struct intel_dmc_wl *wl =3D &i915->display.wl;
>         unsigned long flags;
>=20
>+        if (!i915->display.params.enable_dmc_wl ||
>+            DISPLAY_VER(i915) <=3D 20)

s/<=3D 20/< 20/ ?

>+                return;
>+
>         spin_lock_irqsave(&wl->lock, flags);
>=20
>         /* FIXME: should we cancel the work? */
>@@ -135,7 +143,9 @@ void intel_dmc_wl_get(struct drm_i915_private *i915, i=
915_reg_t reg)
>         unsigned long flags;
>         u32 ctl_value;
>=20
>-        if (!intel_dmc_wl_check_range(reg.reg))
>+        if (!i915->display.params.enable_dmc_wl ||
>+            DISPLAY_VER(i915) <=3D 20 ||

s/<=3D 20/< 20/ ?

>+            !intel_dmc_wl_check_range(reg.reg))

I would keep this condition line into its own "if" statement, just
because the first two conditions are like "is this thing enabled?" and
this last one is like "do we need the lock for this reg?".

>                 return;
>=20
>         spin_lock_irqsave(&wl->lock, flags);
>@@ -166,7 +176,9 @@ void intel_dmc_wl_put(struct drm_i915_private *i915, i=
915_reg_t reg)
>         struct intel_dmc_wl *wl =3D &i915->display.wl;
>         unsigned long flags;
>=20
>-        if (!intel_dmc_wl_check_range(reg.reg))
>+        if (!i915->display.params.enable_dmc_wl ||
>+            DISPLAY_VER(i915) <=3D 20 ||
>+            !intel_dmc_wl_check_range(reg.reg))

Ditto.

--
Gustavo Sousa

>                 return;
>=20
>         spin_lock_irqsave(&wl->lock, flags);
>--=20
>2.39.2
>
