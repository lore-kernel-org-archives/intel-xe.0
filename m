Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDFC60A382B
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 21:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zyo+XzH1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087D41129F1;
	Fri, 30 Oct 2026 21:19:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F377710E412
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 21:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793395180; x=1824931180;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aDg5bYrl+7ICr30n1Qg+RkHxs/e2lZbujjSGdkDSKXg=;
 b=Zyo+XzH1V+0uOowTY+hrD/JQ6PcdIrkjMEozPIYICkHcgryT6r1UIBMd
 mdMsOwCPMKTfrIlfLPuy5OPVy+8TTICN/QMtojH0WSOuyTZ52qI9hyTlw
 zq1VS2F6NQJTEmyRkI3uHdgcMbhXm/btkjbPwic5s9XrEdhGHsQMJ6M0x
 RT4ooTr0i70NWD+Cwm4tzo8aJP/fBAehsvADf08AT2u/Xp0wYQw/X5zkN
 VMPylYNldXSdUQx8k9CGkWFxoXsgZ2QQc5xw4UbPW273O1riN4QKW9ECo
 lhcwTvzRSV1NawPpKTvt957r6pvqI59zz7xodtzZ86iGA9kGrN9i5HKnM A==;
X-CSE-ConnectionGUID: pImaMESdReuvGP5+JJss1Q==
X-CSE-MsgGUID: qcPv0MNMRPyfIPrX20gKIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2181489"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2181489"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 14:19:40 -0700
X-CSE-ConnectionGUID: 73pI4hpMTPeWaD1L9WPrBQ==
X-CSE-MsgGUID: zwW6h/RvRAy+fQB3MQNSbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5411152"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 14:19:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 14:19:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 14:19:39 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.43)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 14:19:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZuSOc3OME148c5Ep/QTTkDd2L1gL2fqFhAkgRaDUzpLOD3pLPbPZ80saI8MOwwqphGTylCfojyudiuwpTXNzlL6VKX8HVaMTnfXC+Xsdla29YjWLm3RfUdysDoGhB+gW8rKAJPglPDaguHki+keIBh+4PWWIzuteO4lgZwcrHR/5YBvT+icR9WDJhsQe5gNZlh3/OHA8la0FaQ/f8gWVVztQAy2t3Cs0nLX/2Igb/7UkVdaZm4u5MHc6xxS9kYdmrM4R0WR+KLKCL585jHhJRC3lSDoqKO2QNbLZ4SdQQMW8KEbESK5KFIH2qP1h2A/V3Z5bo63tBB+NHaubI7ruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q064+kSvysPz2JBhV4+IW9CfJy4PjNMyIQ7lFzuILzw=;
 b=KvgQEE3A5AwlbsCusEEzyTNqoPNCchTOu82ZUOd+b7UfotJonv0Rd3nsm93RuL0pUipubekVosWB4Qoru5jZDhtUqjef50AEkQJUINshyAcL7ap++GixO4qt6UrBd1cAdaB2pbPUhcHHiH/f7vEYENncY91r13PYnYN24nt0s1U1gaOAXFAnFGHKMx5QhnW5LkRXfMmxSHfnBsLPyN+bf2A/fGuYvkx81VORTSIcdMqpZlEW+/zfG4lt6D9QVYo6gAIZEUznPovqYOuMbpJyyOPHPHO7cS1fTYTOoH4ra8NDQYw1cHcAuzufljOT8cn+0oGY5R5gVqUuQFMRzdm3HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8199.namprd11.prod.outlook.com (2603:10b6:208:455::16)
 by SA1PR11MB6616.namprd11.prod.outlook.com (2603:10b6:806:257::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 21:19:35 +0000
Received: from IA1PR11MB8199.namprd11.prod.outlook.com
 ([fe80::7d9:47cd:d697:ce3b]) by IA1PR11MB8199.namprd11.prod.outlook.com
 ([fe80::7d9:47cd:d697:ce3b%6]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 21:19:35 +0000
Date: Fri, 30 Oct 2026 14:19:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniel Charles <daniel.charles@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Fei Yang <fei.yang@intel.com>
Subject: Re: [PATCH v5] drm/xe/cri: Implement Wa_14028586678
Message-ID: <20261030211933.GD6078@mdroper-desk1>
References: <20261030201908.297018-1-daniel.charles@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261030201908.297018-1-daniel.charles@intel.com>
X-ClientProxiedBy: SJ0PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::11) To IA1PR11MB8199.namprd11.prod.outlook.com
 (2603:10b6:208:455::16)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8199:EE_|SA1PR11MB6616:EE_
X-MS-Office365-Filtering-Correlation-Id: 417e26c4-57cf-4ec0-fc2c-08df36cb7f8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|260925022911599003|260925021911599003|260925021311599003|11063799006|56012099006|261009223027099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|10067099003|261022113327099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3IIWikXldw3e9K9wBHvGppKwjOPGJdxmVTrGNya2d8Y5WPvvKE6DaNN+RqZqlhgYZXLOCWptBsrpJk8+sPyur+FSEnrM5ADd+jdjwooIZOlI+2vTAtSJ2t3dbOhk9M3n6yNBWDT+rjGWbF7hfq9BttCBt1YJjv1W87/i8ECwfPoKV7lzKFValUnR7jG250m35dj7WjCAWRvfmSJDS//2QiT18YKzivyg4AqvNfXg1WL+cFYGpsvbP3RsdCqKeb0Heg/M6mnZmIpPACCn/ayVYR5uIKUgVJCLTTcY1UhXww0Pp7xryFxee46VxwTb3NppyZ1UQ4Zql3T58p9+iqNXJhWJHJNHW3b3G8C5X1pFVSZqeNOFS2Pyuve6RwzDq29JFZ5LETBSVgWBH8Sdmff+Bnf8uaMf0o/5ofo2Ax3fxfWfEGthbd5B2AWOT9XzEpmXzobT9wWgGKjkTtC94q8fxgYVsZCs1fI44ozGee6rX4Kp/LjMxfoZaSnfo51Ksg80L/L11xYR9xt20pfFaVDZ6gf3uqzi9QnlcfSREJOSpOS+kzaUFCQe4W8acfWAGtP0tobcGr/yiAf+ATkkWd/l/nq8T6KTBky2tWIQHwzxTTVDcmF1VvZBDTPTSFHPMpLMAvEY884I3YiXUR1sejk1XbuUhvqCuhH2BHlpw4oGsmQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8199.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(10067099003)(261022113327099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e8g8ZLcTsZMP3bkntHSFwINSn7MVnoMVl/AOFHdRglWif2uhw+mx4rOZ5sxF?=
 =?us-ascii?Q?1DBT4vLcrt86q6xx6+n5/yHaBJ8mUV0LECef4RC5daXGrhRnmqJc/LR6CnFL?=
 =?us-ascii?Q?SW2hsUN0bk2o+9ydhDyrz5yXMSG+EZxunsAh6rKTGkw1/csw6Au63SaR1XVX?=
 =?us-ascii?Q?RldJGVjq05NvYFqRbIHWf8U9ViCTzS0rA06MVPJEdnWKQAI0YsBCMq44zrut?=
 =?us-ascii?Q?otzu5Tdwq82xrGGOvMXxADPSvtrbsscBlPkabUGb4jAbOF57fX/s/RWsSoEh?=
 =?us-ascii?Q?QMYvx989n9hLbmLFnTvZ6YLJxn6IV7Jr3PHYpnA8ySEUmur9uRwviikHfAR0?=
 =?us-ascii?Q?4vU3L0S/zI2oxqb2jJa+P7ZfGrgIbZpuwSrpkZlKOtm7B9aIO69386lI7phL?=
 =?us-ascii?Q?WIK8FgG11W5JelPzZ0OvS2KyPrWmx6IY5T0fsINTcjIc8HpqoWZtMBLwCAiy?=
 =?us-ascii?Q?D8NHWs4YmrqZ2Rb36tWIE0iLHW6cmgk/Nc4O2WEQvj2mtDIb/paIgKLit7A9?=
 =?us-ascii?Q?gjGDrrGXD3r9yiAs3FeKK/dDY4fnca3e9zzNdNIAn0piSC+UKo8xE10XRca+?=
 =?us-ascii?Q?IsCE3PY4+sIwrTG3xqGR+kijIZu4IX/Q8WcoMjFlZXX52cL3MzawBWWO8fSr?=
 =?us-ascii?Q?wDa/A7F+qdHA+j4KRhF4PgMRIT14O0tMRlh/85cYJmDCxYA3w3hHgIRwELt6?=
 =?us-ascii?Q?LiJqqRCRZh6llt9793TSikXZkLXMlpVx7LrK7pn3J+tlpcsZv7JYifoRfzK9?=
 =?us-ascii?Q?wFul0KbAEa3xRSYw/EPifn+rllYs3khP9z8gOgOsd08vC2xDmOPZQhkxDaV7?=
 =?us-ascii?Q?idRtMv6sgEm4pN0WwVgc7aipz3zbJU26om1/DoQKwaxf/SAlR541q5QHGX3F?=
 =?us-ascii?Q?EwQnKCSr/h6CtofmExBRczMBxn85BkU75g4HggvB+Gz3T6NGo8RbVxWYN3Xo?=
 =?us-ascii?Q?8r11+y9+cXaBUQ5chEuaWIvSNPIIW3l0fEpxFT7cy3HKUqGB0TofZqTee57D?=
 =?us-ascii?Q?x2c2J4UdxwDGN6Kp9/geLSUdXuOoXtYn8jNA428hRhvLkP1B9NYkBraA50vr?=
 =?us-ascii?Q?iQWghl6F0lgKh0CeTWfy+N0XfuNp7ewBOzuYKDp5eI9+cFIo+/Zp+fS/6MjF?=
 =?us-ascii?Q?em7hhK1DOXLxCCvt9PgcadSYgGHgfUuSaP//QpK1MrG7pclSZ9SkTNk0GgsR?=
 =?us-ascii?Q?LsvYgx2r+okeAWP2Pwu7Zxv2BAbLvHR186D0GwLiyAYCmhDvEwXNmRfgwriu?=
 =?us-ascii?Q?ceCYVl7Uk/9CbrYwQ1s8NaS0B0EMZ6Io+dRHjlUegjck4Ezfyss7o+8zUHm6?=
 =?us-ascii?Q?RHfdtn99ec3YKR49XcHnAZl6mg69nzpUD6lKLidvx3m5y5KqYkAd0/RGYKuJ?=
 =?us-ascii?Q?qTYABmPNDBcPgBOw4hHq0W+X/2Nk7BFCe8upp548FHw6qxG7+cyZagQNSRd1?=
 =?us-ascii?Q?A0j6Z3nmsxbmOtjmucXwanA//2wnpQZFBwzYUvnVwpvk8G19veg7W0yoiNzv?=
 =?us-ascii?Q?c+tq9UTXLrqoXW0O8A91mJht1OxEDkruJ6mhlg2DyJuQflw27vkjqBVydwVq?=
 =?us-ascii?Q?0xGq3DzBpld/eWNayBVSQ+Y1vgHnILTTpGvRuRHpz8Bl1N09j1IMHBU55Npt?=
 =?us-ascii?Q?ppAfMLzZLAW8bx3EklyLH7RcAN8eOsKaLn0Q3oPv0aw9rhzBdK9D/D1EYv/V?=
 =?us-ascii?Q?ONUr4/Ewcorb9mFSbIvdSI9/DMWhXxNXezorMfIaTIZQ5ybyDorNcj1u3YVj?=
 =?us-ascii?Q?DCb3cmnVw5W29WFqRjjW92ZGYrtQ4Ww=3D?=
X-Exchange-RoutingPolicyChecked: LjSqXBpjHSFJxP5fk6UQ84d2OacRXIVwtOMv2sWv4D64vPj1W4Rhht4WiwpaBvgVkyUh+/SZIVQvutoNPdFt5T5NsPAiPvWB0Q1YqkmWQBPZBOicGshbpiFL4qPVILKrmGB9F9SU8DYWb8v+YOJK2F5pMz31KP3fNHNXr8JdbW+DAK/DOr65PdRTQf7ECSo0LC6yeOSs3AKOsFDiVR/bngl2Gq5RjHyvbHScQ7VRjIuOdaZm5ToeBzGlXt+TXuCvJUPf4azjBfmsp7oVZ7DAT8v3v6m0BfBDbQ3XfQjGI6V75NkvomkanelUtew61mANnemXT1DlD8wrrQdxjEC7pw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 417e26c4-57cf-4ec0-fc2c-08df36cb7f8f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8199.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 21:19:35.7432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lparp8aCUV10XJqyqxo9fXjM0iHcDl4gVTJqkExgm7hWtMHBzzKSyHHp8QFHredaBt9NF9kqnYfCFp2v9OFgOYimpUNMhbOnGMFmEJqcixc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6616
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 01:19:08PM -0700, Daniel Charles wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> Implement the documented Wa_14028586678 hardware workaround on
> Crescent Island by updating the L3 class-of-service and caching-policy
> fields in DWNSTRM_ACCESS_MODE (0x144154). Change bits [7:4] from 0x3
> to 0xc to select L3 class of service 3 and write-back caching, while
> preserving the other register fields.
> 
> v2:
>   - Move this workaround into a dedicated MERT table instead of
>     placing it in gt_was, since MERT registers are device-level and
>     accessed through root-tile MMIO, outside GT forcewake and GT
>     save/restore bookkeeping.
>   - Add an RTP helper for full-register device MMIO writes and apply
>     the MERT table during probe and after pcode is ready on system or
>     D3cold resume. Match Crescent Island and skip devices without MERT
>     and SR-IOV VFs.
> 
> v3:
>   - Use PLATFORM(CRESCENTISLAND) instead of GRAPHICS_VERSION(3511),
>     because device-level OOB processing has no GT context and the
>     graphics-version matcher requires one.
> 
> v4:
>   - Switching from RTP to OOB removes the need for the MERT-specific
>     table and RTP helper proposed in v2. The v2 and v3 notes are retained
>     as revision history; this version uses the device OOB rule through
>     the existing per-tile workaround helper.
>   - Program the register on every tile, assuming the workaround values
>     are identical across tiles.
>   - Use a masked read-modify-write to set [7:6] to 0x3 and [5:4] to
>     0x0, preserving all other register fields.
> v5:
>   - Apply tile workarounds after PCODE initialization completes on system
>     resume, matching the runtime resume ordering.
> 
> BSpec: 73603
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Signed-off-by: Daniel Charles <daniel.charles@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_mert_regs.h    |  4 ++++
>  drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
>  drivers/gpu/drm/xe/xe_pm.c                | 10 +++++++---
>  drivers/gpu/drm/xe/xe_wa.c                |  9 +++++++++
>  4 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_mert_regs.h b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> index 99e5a26da6572..8139263f2746a 100644
> --- a/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> @@ -8,6 +8,10 @@
>  
>  #include "regs/xe_reg_defs.h"
>  
> +#define DWNSTRM_ACCESS_MODE_GAMREQ_MERTSS	XE_REG(0x144154)
> +#define   DWNSTRM_ACCESS_MODE_L3_COS		REG_GENMASK(7, 6)

This should probably be "CLOS" instead of "COS" to match the name in the
bspec and way "class of service" is abbreviated elsewhere in the driver.

> +#define   DWNSTRM_ACCESS_MODE_L3_POLICY		REG_GENMASK(5, 4)
> +
>  #define MERT_LMEM_CFG				XE_REG(0x1448b0)
>  
>  #define MERT_TLB_CT_INTR_ERR_ID_PORT		XE_REG(0x145190)
> diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> index 356b4707dafea..753b2a4a10067 100644
> --- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> @@ -6,3 +6,4 @@
>  14026633728	PLATFORM(CRESCENTISLAND)
>  14026746987	PLATFORM(CRESCENTISLAND)
>  14026779378	PLATFORM(CRESCENTISLAND)
> +14028586678	PLATFORM(CRESCENTISLAND)
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 89d64aa6577d1..462357844cb48 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -241,13 +241,13 @@ int xe_pm_resume(struct xe_device *xe)
>  	drm_dbg(&xe->drm, "Resuming device\n");
>  	trace_xe_pm_resume(xe, __builtin_return_address(0));
>  
> -	for_each_tile(tile, xe, id)
> -		xe_wa_apply_tile_workarounds(tile);
> -
>  	err = xe_pcode_ready(xe, true);
>  	if (err)
>  		return err;
>  
> +	for_each_tile(tile, xe, id)
> +		xe_wa_apply_tile_workarounds(tile);
> +

The ordering change and extra call in runtime resume below aren't part
of the workaround itself; they're general changes to existing driver
logic so they should be in a separate patch with a dedicated commit
message explaining the reasoning (and that patch should probably be have
Fixes: for the commit that added the tile workaround code originally).

>  	for_each_gt(gt, xe, id)
>  		xe_gt_resume_early(gt);
>  
> @@ -687,6 +687,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   */
>  int xe_pm_runtime_resume(struct xe_device *xe)
>  {
> +	struct xe_tile *tile;
>  	struct xe_gt *gt;
>  	u8 id;
>  	int err = 0;
> @@ -702,6 +703,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  		if (err)
>  			goto out;
>  
> +		for_each_tile(tile, xe, id)
> +			xe_wa_apply_tile_workarounds(tile);
> +
>  		for_each_gt(gt, xe, id)
>  			xe_gt_resume_early(gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index c94fe7753f9a9..539850614902b 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -16,7 +16,9 @@
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_guc_regs.h"
> +#include "regs/xe_mert_regs.h"
>  #include "regs/xe_regs.h"
> +#include "xe_device.h"
>  #include "xe_device_types.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt_types.h"
> @@ -1031,4 +1033,11 @@ void xe_wa_apply_tile_workarounds(struct xe_tile *tile)
>  
>  	if (XE_DEVICE_WA(tile->xe, 22010954014))
>  		xe_mmio_rmw32(mmio, XEHP_CLOCK_GATE_DIS, 0, SGSI_SIDECLK_DIS);
> +
> +	if (xe_device_has_mert(tile->xe) &&

We don't need the 'has_mert' check; this workaround lineage number will
already only be associated with platforms that have MERT.


Matt

> +	    XE_DEVICE_WA(tile->xe, 14028586678))
> +		xe_mmio_rmw32(mmio, DWNSTRM_ACCESS_MODE_GAMREQ_MERTSS,
> +			      DWNSTRM_ACCESS_MODE_L3_COS |
> +			      DWNSTRM_ACCESS_MODE_L3_POLICY,
> +			      REG_FIELD_PREP(DWNSTRM_ACCESS_MODE_L3_COS, 3));
>  }
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
