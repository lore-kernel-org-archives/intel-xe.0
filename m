Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B26CD343F
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 20:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A9210E9AF;
	Mon, 18 May 2026 20:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cS/nN9yf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6394B10E344
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 20:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779135636; x=1810671636;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=0YWBtVfaoyk+dIQwU/p1wqXc1DaNY8Wjd6iinpB0Fgw=;
 b=cS/nN9yfc7ny+ilaGETY4QoD01yYdrKPu5mGSdwrNpBtVM1SYPXgDxR6
 CVTw4n+E0uA3YRDKfgqYMHWpcQeOFSB3TxbpCGUSZN1ttC/U5mkHmihae
 u2aN9kOUAOEHVxpvK2Z87sDK2ojKfWMIHygg984EXJq/eGucAwEAm/SAH
 E2Aa+VX+BYany1CBopMsmgc6hXE2j5nUUWHvfAkS3IwwLxdD7t6GZXkuP
 Dfopw0Prcc+LQM1IDj17vSxyiLHZ2+cv+QpY1dcKlIw/wnTr3zKMO9Tgf
 nEEL6YxqSyiy3E1PLEfZApEVh4D0HIz33CZnpS2I2e85hPvRXPwXdyQ8v Q==;
X-CSE-ConnectionGUID: dLh/brrZQHiGfQ5PyHmYAw==
X-CSE-MsgGUID: roCViOHnT0qgqI88NmGyUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79902981"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="79902981"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 13:20:35 -0700
X-CSE-ConnectionGUID: WMnp8DVoQneXolLKCnFsJA==
X-CSE-MsgGUID: ek9pRorITKiABCobDXZkgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="263055495"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 13:20:35 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 13:20:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 13:20:34 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.4) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 13:20:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cg6M3hjBVIy1CXr8xFmcPTNqAH2eX9kF9sKmFKZgGYZMcpAfDybi5MoklTdqduhD6wx1dArDDdS+8ZW+6FyDDmOwzME+0JuOYbuYxQIefic8M+Xdw0Vb9dJdnE0UkkAvyXgqebr/wAmbwcB5fVC2O++NyHCOTJ4KAUUtPgyE0gXfi709BvVRgY78/XW8mSXf11Gnisc+bRmeaWdNUK4E6wxf5JbjfvO80L5NKmNTiGEd6Lorm2YZsWGiBx2VFXVbQDaIHhZK04AOed9mbQkepj7K0i1WeT4yYhEirrZaVdJkd+5v8JXYxw7CDOj6YOEKJ28kwrw/n3TBVFIrA+IrVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F64RKrrZR8q6ZZzN2cGaOlW2/W+32gQr0F7udvjefBc=;
 b=EXCAmXlZIVhnSZbnU6bkIlROvoZMi+eoP6noEWdWPL4jwDPZSuA88dF2Rwx9LtaviGH1BlBevd1TKnQ2doQkBm8RIRAFV5sRl4D/72dq/S0UlY3r+y1k+YEqeE1X+QGcWP93GvHnImkuav7+NC9zdk8D7gBJ2uMwGfJHl6iZS4ALWxKkB/PYr2YxPCU1VxASOUa3UigH7OIxxRVNSLHSYu9i9JWGAhLBFmQMUXJhWkjs3jZFnBF5UnhWilRKOiql2CT5+u3kfqoIpwambo6zm4HEzjahjXYZ91+MlHLUNpKXF2gSZAiP+i+xvxxskbHk2bT8i83+8fnmDlbJ2hHTlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CO1PR11MB5171.namprd11.prod.outlook.com (2603:10b6:303:94::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Mon, 18 May
 2026 20:20:31 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 20:20:30 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Violet Monti <violet.monti@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Violet Monti <violet.monti@intel.com>
Subject: Re: [PATCH 2/4] drm/xe/rtp: Add GT WAs rule checking
In-Reply-To: <20260513212129.691628-8-violet.monti@intel.com>
References: <20260513212129.691628-6-violet.monti@intel.com>
 <20260513212129.691628-8-violet.monti@intel.com>
Date: Mon, 18 May 2026 17:20:26 -0300
Message-ID: <8733zoh3lh.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY3PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::21) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CO1PR11MB5171:EE_
X-MS-Office365-Filtering-Correlation-Id: b5858e57-4699-49d9-3ee2-08deb51ae808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|3023799003|11063799003|4143699003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: lb3mlgG1/lGcdrx7TEA5L4lu3xlZLBqU2qoSMpCmEZTz8E3JsiFnaQR1pWPDrf5rpv8R4fLk8wkhwNFuKXWIogxeP0Af0UjHI2/TKGJ8HJmJ/9xVpwfdnbaL1ForiKNh2T57+aDb3j5ZySqlEvGF2vmj0QfMOEkMx0FGjpaGsq/UzP4nUWLv+sUsjunHzNY1bGAE2x0wmKTgHYsmo2/sSZ4oZfOslEXVCF8pri8juFH0FnjnTA+WN/sVN4IUFdZ6V+BnM92GZRYumkFlWuIdkyGJchj7eVhvF59szOE57hydjb4Mc5fLWedlfupkCUNZRlwdfkpVfl/4XTi/YwRCgSIsFgNWtJYTLY5qsidVGggrRa51SALX5XCgVJILo3RAP4HW2oUoUqw4FXdqMjx78mw5KbMhD3nZG4EmIjONwT5ibkDb6g0kR66Ps8j9Ia/49A0DLwfKoQmY7ELZ69sTY9QnYeLv0/czCzEG2ortkvY6Efi7LLvV4+LI6rF1j6Ow4VZ4iREGvPz9LCRqcLumE/eLR916WUaEfa7aK2xX8Ex1gHU2dDQCz8Bci3n4cOF1q4Nkf4SwKGCfpu2sGf1mkrDc2Esfu1oRwXS9w4UJd4OKaAYCn51e29hxylOfT3mUUYWknGQqG8yw13BhW0miniQpB/Am6Urj1bdQJZFC7hAlTPeNPO8RKBV4Y+4PynPu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(3023799003)(11063799003)(4143699003)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHN1Yko0U1JuUG91RE9Bb3JHOTNqTExiSWViNHc3TE9KU3R5M2laZzM4ZmhW?=
 =?utf-8?B?aWRtY2IyRVQzSG9KMysvQ2dac2c1ZUJPNUgrekxIcEttaStiWHlzVzMvRW9T?=
 =?utf-8?B?WVJNZ0NMblp1MThLTkN1N3ZlVWdBcnNLRkM1WnBXSVBsWFlKUVhNc09CbjlM?=
 =?utf-8?B?eGxPME54N29od0lqWWV2YmppY2lVSzNNeXRrS1BTUjJWSG5CZEJoY1krRHRu?=
 =?utf-8?B?Qld2VVF1WDJ2TGtsNXJpOWNqbEhyRDhpS0l2aEtKb0RYMURBV1dCWEplRkgz?=
 =?utf-8?B?Tm15MnJNOU96QVpIVnI5c0p6bGJ6QUxJUUdQMjJrTko4K053TEpyaXhkUkcz?=
 =?utf-8?B?OUMrOHRKTmNMQVIyYjdDaFJ5aU5WZ2VFUkh5RndGMVdBaTMrSjFobjlvNjBJ?=
 =?utf-8?B?bWtQUHI1WmJPYkpyRytpa1dWdmN5djVKQzdiWmMvS1c3N00zd1NRNTAzcDVv?=
 =?utf-8?B?WEJoQ0hpNld1WmVMTnVwWjFpRjRRN0JqbTFMeTZVditmSGJRMDNyc2FUZ1ZT?=
 =?utf-8?B?QUU5VzFzV0p1SXptbll2UThmamxQRkZaM2dPM2Q4YkJyL1VaRk5zR0svUnd3?=
 =?utf-8?B?NDlYVnF3WFpwekVCUWVBQTNOQlpoNllzK2RNZEhZVUJybjJMK3huR1VWVURm?=
 =?utf-8?B?LzZ0b0FPM1Q4T3ZyQks5eVhmR2NVdktzcUZtNFdhNTBzUTFtOW1tekdZaGRC?=
 =?utf-8?B?NFlUNlFOWmNmUytjNEJ1d1F0MzNrMUtvSGRsRzlPNGZUakYwcjFLSmsvUzFn?=
 =?utf-8?B?OFQyMmt6MnVKU3drdG9Pb0UwSGJUZGVwRnJtN1hORTBJTnMxYWlUVGtaVG1F?=
 =?utf-8?B?TDdYbThVUmoxSjhHRE9qRWFQbytkNzRlQ2cwb3BGeXJEbE5yZGZZYnRaUzRQ?=
 =?utf-8?B?NlFJa0lKd3lpRlQwMURRTXJVYlZsTkM1QXk5eHNZbHpILytXVHNsMURvRDM5?=
 =?utf-8?B?b0tZT0dJc1JnRldFZ2FobTgxUWt2NTZCemFQVTJKZGg4aytQc0lvN1ROeGdU?=
 =?utf-8?B?Q1dqTTJGaEpJcmpXcGtkYXFVcjUvVENaSElYMzEyamNLMHdhVnFjU0xMQUp3?=
 =?utf-8?B?eW5lTDZUWnBhek9xc3Vvcjl4RTRrSE9ML2VVMndNT3ZxVFJyQTNwdDQxYlpK?=
 =?utf-8?B?YlVEOXYwV0xML2ppVkV1MjNXeWRSV1JJVmhOQ0sxSzBBajVRY0lBaFV6RmRu?=
 =?utf-8?B?dFROQlZaY2xBSS9pb2p1d2RPUGlXMXNzK2JqYjlFMWczSlZUNWIzSGJLTVpD?=
 =?utf-8?B?cjZPZFo2bXhKM3pjdjZvZTFLZ3BIZFYrd0MwMDh6a0l5Tno2WGVZTVVpeU4w?=
 =?utf-8?B?MEgrK2c4S3VHTCt4L2hIa0xLQTN0L3RJYmZmdGMvVnBmV2NNT2RQVEtLUnhU?=
 =?utf-8?B?RnhwWU9hU2wxeTVDRWlEYmVCMnFDc1V5Umc5YWNmbXZSaGtjVG9HQzZId2t4?=
 =?utf-8?B?WHVqVHZiWUVMcStVblBmN3F2RnZCclF2WW0rZFBteGY4ZEVLTmFkbUxCeXNS?=
 =?utf-8?B?U3M4SFVaY3R5THUwVHFEb29GNWEzdnp0bS92WERUZ3pRNU9IVDZ0WFdCamJW?=
 =?utf-8?B?R1dRS0MxWkttM3R2R3p6ekVIWHhqUmZOVFNySVBFRk1QUHFkdlJYNUtCaDNV?=
 =?utf-8?B?bTVmL011dFE1VHovR0V4NGd0UnErR1ZBcWlaREh1Z0Q0dzJZVlZUcUJ1eVF0?=
 =?utf-8?B?VlgwaERpTnBYajJBWFZEcjNXZ1N3NkQ5RHZzUHZ2SCtWeDd2WUIzYitFSGtK?=
 =?utf-8?B?WmZjeFNYVVppZGJyVklKWDdZK3FXVURYNVRuOUV3RkN1Nk1RS2d3RmtscEZO?=
 =?utf-8?B?UTlDcnAva01jZ3hOcWRXYitpMlF6bVZSNVErZ2EyRkVEMXpFMW1jY2NsaUt2?=
 =?utf-8?B?Q0JaNGpUNHZTRERVWmdXcmxsVFBNM0ZpZTNpRzBiYXgweFJkOVpaMnA1d3RH?=
 =?utf-8?B?ZUdwVDlyeG1DOS9OQnZKZDJhQWtyb1Q3U2pYVFpzUEFYN3JqN0hIRjh1dXhD?=
 =?utf-8?B?N1J6NlNpem93a215RUFyUHJndzZiaG9kb2p4a2UxemYvc0RzOUszcGRlOGxv?=
 =?utf-8?B?b25wMHhYYnd6YmVFT0dMbEl6YmlmSmJSNUluS0htamJXd2k0QkxBZ2hzUmJP?=
 =?utf-8?B?OVJaR0FOeXhkNUZOaExJKzI2c1RYNTBMUU5xODBXZGFsVTdJQ3FLNlZQYTk5?=
 =?utf-8?B?QXRPSCtSdU0reWNmT0hpdE5LUVovelJvWDlBNDJEcENYSnJWSEFySXNxRnZB?=
 =?utf-8?B?VkN6eGJrdWVZZEJnRkRTYWRHcWtCdWtrazNTWEhwL3VnYWJuaFphN2UrSVRJ?=
 =?utf-8?B?ZTlYTWpMRWxEcFRJd2EzMlZBa1FlNnZVZzZOMnRkRzRuc3dpZ2NpUT09?=
X-Exchange-RoutingPolicyChecked: W4fc0n1If9HcFr3lGKSuZDEpZDzCHQe1qLl903VdJUZdfnEgZwa2Ms7kSc3M1JBZxL4liPEFFhbcKdLUfgii49Fr7kLtuyoLjTwm0XLBjvs7wePCUh/nhAWEuvNe5ACj6AgNDZjbcXLrnOw75ZvYpSv/PsSGS+5u3/jhASkKQYweRIq/Fodi8/nUfQ569XtGQxKBrXNLl80slu0mwyX6Q2gOfTusDrjNPvGSRGVLW8FBKdpF6hHNt9m6PZNqfeQ0L/AxvhERHjwqBqP7Qzhe5ZHmckjRubta8+YePwAvSp7mQTm8VH7kmfGuhYP9A7Aup3U+zShJerb/gscZUXQ9Ow==
X-MS-Exchange-CrossTenant-Network-Message-Id: b5858e57-4699-49d9-3ee2-08deb51ae808
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 20:20:30.2622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jf4aLNw/fWc0yUyali3bGfY8TpTg5gxPDMSw2FOVC9/bcEkridSMyLkkVqcp8G8zXBuJCIZlNvR3Rp6w5LpwZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5171
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

Violet Monti <violet.monti@intel.com> writes:

> It is currently possible for a RTP rule, and subsequently a workaround,
> to expect contexts that may not be present when the workaround is
> applied. For example, the workarounds in the engine_was[] in drm/xe/xe_wa=
.c
> expect an engine entity to be active. Conversely, the gt_was[] is not
> depending on an engine entity to implement its workarounds. This kunit
> test addition checks the gt_was[] workaround list for any workarounds
> with specifically an engine_class rule. If a workaround does have an

I think "an engine_class rule" can be a bit vague. I would spell out
ENGINE_CLASS() or XE_RTP_ENGINE_CLASS().

> engine_class rule, the workaround is then checked for the
> "FOREACH_ENGINE" flag, which ensures the workaround is not implemented
> in an improper context.
>
> The result of this test is an expectation failure if a workaround has an
> improper engine_class rule, and aims to prevent future issues of
> gt_was being applied without proper contexts.
>
> Signed-off-by: Violet Monti <violet.monti@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/Makefile             |  1 +
>  drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c | 76 +++++++++++++++++++
>  drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h | 24 ++++++
>  drivers/gpu/drm/xe/xe_wa.c                    |  2 +-
>  drivers/gpu/drm/xe/xe_wa.h                    |  5 ++
>  5 files changed, 107 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h
>
> diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests=
/Makefile
> index 0e3408f4952c..f7aa47f11a36 100644
> --- a/drivers/gpu/drm/xe/tests/Makefile
> +++ b/drivers/gpu/drm/xe/tests/Makefile
> @@ -9,5 +9,6 @@ obj-$(CONFIG_DRM_XE_KUNIT_TEST) +=3D xe_test.o
>  xe_test-y =3D xe_test_mod.o \
>  	xe_args_test.o \
>  	xe_pci_test.o \
> +	xe_rtp_tables_test.o \
>  	xe_rtp_test.o \
>  	xe_wa_test.o
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c b/drivers/gpu/=
drm/xe/tests/xe_rtp_tables_test.c
> new file mode 100644
> index 000000000000..100cac379b08
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +#include <drm/drm_kunit_helpers.h>
> +
> +#include "xe_kunit_helpers.h"
> +#include "xe_pci_test.h"
> +#include "xe_rtp.h"
> +#include "xe_rtp_tables_test.h"
> +#include "xe_wa.h"
> +
> +static void xe_rtp_table_gt_test(struct kunit *test)
> +{
> +	const struct xe_rtp_entry_sr *param =3D test->param_value;

I think it makes sense to call the variable "entry" here, like done in
other places for instances of xe_rtp_entry_sr.

> +
> +	for (int i =3D 0; i < param->n_rules; i++) {
> +		if (param->rules[i].match_type =3D=3D XE_RTP_MATCH_ENGINE_CLASS)

We would need to check XE_RTP_MATCH_NOT_ENGINE_CLASS as well.

> +			KUNIT_EXPECT_EQ_MSG(test, param->flags,
> +					    XE_RTP_ENTRY_FLAG_FOREACH_ENGINE,

If the entry has other flags set along with
XE_RTP_ENTRY_FLAG_FOREACH_ENGINE, this check would fail.

> +					    "GT WA %s has an invalid engine class rule setup",
> +					    param->name);

I think it would be simpler to replace this with something like

  KUNIT_EXPECT_TRUE(param->rules[i].match_type !=3D XE_RTP_MATCH_ENGINE_CLA=
SS ||
                    param->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE)

And another one like that for XE_RTP_MATCH_NOT_ENGINE_CLASS.

Since we are using entries as parameters of the test, the RTP entry name
will be displayed in the kunit output, so I think we can skip the
explanatory string.

> +	}
> +}
> +
> +static int xe_rtp_table_test_init(struct kunit *test)
> +{
> +	struct xe_device *xe;
> +	struct device *dev;
> +	int ret;
> +
> +	dev =3D drm_kunit_helper_alloc_device(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
> +
> +	xe =3D xe_kunit_helper_alloc_xe_device(test, dev);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
> +
> +	/* Initialize an empty device */
> +	test->priv =3D NULL;
> +
> +	ret =3D xe_pci_fake_device_init(xe);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	xe->drm.dev =3D dev;
> +	test->priv =3D xe;
> +
> +	return 0;
> +}
> +
> +static void xe_rtp_table_test_exit(struct kunit *test)
> +{
> +	struct xe_device *xe =3D test->priv;
> +
> +	drm_kunit_helper_free_device(test, xe->drm.dev);
> +}
> +
> +static void rtp_table_gt_test_desc(const struct xe_rtp_entry_sr *t, char=
 *desc)
> +{
> +	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +RTP_KUNIT_ARRAY_PARAM(rtp_table_gt, gt_was, rtp_table_gt_test_desc);
> +
> +static struct kunit_case xe_rtp_table_tests[] =3D {
> +	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, rtp_table_gt_gen_params),
> +	{}
> +};
> +
> +static struct kunit_suite xe_rtp_tables_test_suite =3D {
> +	.name =3D "xe_rtp_tables_test",
> +	.init =3D xe_rtp_table_test_init,
> +	.exit =3D xe_rtp_table_test_exit,

We do not need fake device initialization for the current test being
done here.  We can simply drop those functions and the .init and .exit
initializations here.

> +	.test_cases =3D xe_rtp_table_tests,
> +};
> +
> +kunit_test_suite(xe_rtp_tables_test_suite);
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h b/drivers/gpu/=
drm/xe/tests/xe_rtp_tables_test.h
> new file mode 100644
> index 000000000000..3e91dd08f854
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0 AND MIT */
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +// The "gen_params" function functionality does not work to dynamically =
collect the size
> +// of the WA array, even with the new n_entries pointer. This addition b=
uilds on that framework
> +// to allow dynamic sizing
> +#define RTP_KUNIT_ARRAY_PARAM(name, array, get_desc)						\

The only user of this macro is xe_rtp_tables_test.c, I don't think we
need to expose it via a header.

I also think RTP_TABLE_PARAM() would be a good name for the macro.

> +	static const void *name##_gen_params(struct kunit *test,				\
> +					     const void *prev, char *desc)			\
> +	{											\
> +		typeof((array.entries)[0]) *__next =3D prev ?					\
> +			((typeof(__next))prev) + 1 : (array.entries);				\
> +		if (!prev)									\
> +			kunit_register_params_array(test, array.entries, array.n_entries, NUL=
L);\

Do we really need to call kunit_register_params_array()?  Looking at the
implementation of kunit, it appears kunit_register_params_array() is
meant to be used together with kunit_array_gen_params() as the parameter
generator.  Here we are using our own custom generator.

By the way, I wonder why kunit itself is doing that for
KUNIT_ARRAY_PARAM() and KUNIT_ARRAY_PARAM_DESC().  Commit b820b9077b7f
("kunit: Enable direct registration of parameter arrays to a KUnit
test") is the one that added kunit_register_params_array() and says the
following:

    "The arrays passed to KUNIT_ARRAY_PARAM(,DESC) will also be registered =
to
    the parameterized test context for consistency as well as for higher
    availability of the parameter count that will be used for outputting a =
KTAP
    test plan for a parameterized test."

, however, the registered data is only used if the generator is
kunit_array_gen_params() anyway, so the registration in those macros
seems useless.

Bottom line: I think we can simply drop this call.

> +		if (__next - array.entries < array.n_entries) {					\
> +			void (*__get_desc)(typeof(__next), char *) =3D get_desc;			\
> +			if (__get_desc)								\
> +				__get_desc(__next, desc);					\

Since we are writing this macro specifically for RTP entries, I don't
think we need a "get description" function: we can use __next->name
directly here.

Also, for the description, I think we could also include the name of the
variable, for completeness.  Today we are only adding gt_was, but in the
future we could add others.  Using the variable name in the parameter
name here should make it easy to correctly spot the offending RTP entry
in a expectation failure.

Hence, here is what I would suggest for such a macro (tested locally):

    #define RTP_TABLE_PARAM(array)								\
    	static const void *array##_gen_params(struct kunit *test,				\
    					     const void *prev, char *desc)			\
    	{											\
    		typeof((array.entries)[0]) *__next =3D prev ?					\
    			((typeof(__next))prev) + 1 : (array.entries);				\
    		if (__next - array.entries < array.n_entries) {					\
    			scnprintf(desc, KUNIT_PARAM_DESC_SIZE, #array "/%s", __next->name);	=
\
    			return __next;								\
    		}										\
    		return NULL;									\
    	}
   =20


--
Gustavo Sousa

> +			return __next;								\
> +		}										\
> +		return NULL;									\
> +	}
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 39c507edb8ce..285072fe0a47 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -130,7 +130,7 @@
>  __diag_push();
>  __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
> =20
> -static const struct xe_rtp_table_sr gt_was =3D XE_RTP_TABLE_SR(
> +VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was =3D XE_RTP_TABLE_SR=
(
>  	/* Workarounds applying over a range of IPs */
> =20
>  	{ XE_RTP_NAME("14011060649"),
> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> index a5f7d33c1b32..17dff615e507 100644
> --- a/drivers/gpu/drm/xe/xe_wa.h
> +++ b/drivers/gpu/drm/xe/xe_wa.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_WA_H_
>  #define _XE_WA_H_
> =20
> +#include <kunit/visibility.h>
>  #include "xe_assert.h"
> =20
>  struct drm_printer;
> @@ -24,6 +25,10 @@ void xe_wa_apply_tile_workarounds(struct xe_tile *tile=
);
>  void xe_wa_device_dump(struct xe_device *xe, struct drm_printer *p);
>  int xe_wa_gt_dump(struct xe_gt *gt, struct drm_printer *p);
> =20
> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> +extern VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was;
> +#endif
> +
>  /**
>   * XE_GT_WA - Out-of-band GT workarounds, to be queried and called as ne=
eded.
>   * @gt__: gt instance
> --=20
> 2.43.0
