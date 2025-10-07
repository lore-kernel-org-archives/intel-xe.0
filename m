Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC09CCA476
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 14:59:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E05310E69F;
	Tue,  7 Oct 2025 14:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YIn+Fh/l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B46610E69F
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 14:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759849174; x=1791385174;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c5V+E+WJVIUi4SYTvyi0jbwqjV0P4wWX/Ksc2v9Ii+Q=;
 b=YIn+Fh/laOlEHcL/SF6KHkYE83xHRNs9aIRDaWVufgpdRKjwInYS4Cs7
 2ix25aojZpAgXryGTHZWR8eh8DXzV4c3aA3cYhgSuJThu8WGMsZ7hiR9f
 PFsuHpVm6Z92qMoiv/H5ennouSY37nrrwfg7RRv9HVzWEqDHmQezo0CqL
 oDTAhK6bH44Y21loIV2zEJ7t/Q2TylltVTv9F/Vhyf+ejkre2FaOxDf2e
 YF38cx/vjDMlatPp6JyxvkI8VMtfJrAPSZoJWseY4AbOkQmHoUod1/Uhy
 Vpn3nGLd4SO3jFdqyD8G2Sit3hTDXuPzCRpMrBp2yO80VByPA/gRowCLG Q==;
X-CSE-ConnectionGUID: wk9sBIPQTcGq71QRJn6DJQ==
X-CSE-MsgGUID: 88acvwhoRCCJmrrivEK9uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="49587763"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="49587763"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 07:59:33 -0700
X-CSE-ConnectionGUID: Av9CH+SESTq214pums+0gA==
X-CSE-MsgGUID: FcCZFOKIT7q5HOzNWnKRJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180962596"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 07:59:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 07:59:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 07:59:33 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 07:59:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fmm5I83NLSEMDb4Ts7o+NUXZCURiCyPAjJFs+9syW9VHvr2u7zaVkD1mQPfa7iAzYb/BGNwxGm9wWKBSDvzbR0zJ3YkWwPoRffSgXGSJskR8zeKvbqqdgd1o+HJYAizvlQAOrRBmXedWtQi5XFYaASc1W6qECSLDdFsE0ixK3OkEqZSxGX0u1LFkQNscfCuSwcOsKc8jkVNUstVFfta0zzzt25q5m1x3H+HR7cdRT4QLULrMBu8Bgk1fa4HPca3w5uGPEC3o8UcrhsEfthZcETDBDAkcOitxfVbQbeTk8Pk59bpDz+bnBJYQAtFymypGbbDHXSareA089tlCc5eAeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zq000BjfX180Nj4xxkKehOdMbmTtI0C34af4t6xG+/I=;
 b=xZFfPhGJfvb+d/goyFq+isuQtgWuNU12hGVsW7ymhW/0jdFQqZptnfxg2Ee6/04bYhJZzakHggtEKDxD6XfhlZVro7tC0tkEsVVw4z1dd67OEwiupF2aopWvEaXhjadfZaAreabqgk6/LhzFz/fBhEAb36DLVOC5JENAp+sxcue1mBoifQkOTyX5le2JNQsd3uaTOdmDhtNPSMfbtDDhFbTxqnxP6zna40oTmugknlUz/T+y+6auZhSv8CGWpMLg0WCVTnate1DIq7crVOQH5S2SU/mheFEXow7M1Ye/kENjuPRZeH7leHDNRb9q6e+ecSaTb8mcO6+s5euKXDSjvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SA1PR11MB7016.namprd11.prod.outlook.com (2603:10b6:806:2b6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 14:59:25 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 14:59:25 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: RE: [PATCH] drm/xe/guc: Check CT enable state before deregistering
 exec queue
Thread-Topic: [PATCH] drm/xe/guc: Check CT enable state before deregistering
 exec queue
Thread-Index: AQHcNVUHNYl88hkU00KcGAEuISb0DrS2ynHw
Date: Tue, 7 Oct 2025 14:59:25 +0000
Message-ID: <DM4PR11MB5456A079CF5E4276AE13580EEAE0A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251004173033.2511250-2-shuicheng.lin@intel.com>
In-Reply-To: <20251004173033.2511250-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SA1PR11MB7016:EE_
x-ms-office365-filtering-correlation-id: f988a35f-c4b6-4eb8-fa37-08de05b21b6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?NqAerq/MhUWK/ZhNSSEdnSmFn9xPFSH0kxf5Uka7eLTxzb0kOgNUkV24yOyr?=
 =?us-ascii?Q?BqOQuMld3r0QqCX69ZxDdqIBgc4HnFHmrqi8yfSl5xLFm9wjxVeZLAOXJg33?=
 =?us-ascii?Q?Y/hwKD0IBZRtoVF2hdfgK8QFrUpPGqSbaZ2DMphVIMdNNdmqXjNxprH4mQvv?=
 =?us-ascii?Q?Q5xUFY97fZOsc7AGL584Oxn9QAg/WLjZJUVas2GFKRR51UfDingJKx6scLhN?=
 =?us-ascii?Q?pmVG2NVZC9gxqxwWzLbTmW4n41rG4QBSk5DVIy8AcI+Y/c+dI4rm2oR/VF66?=
 =?us-ascii?Q?G3axTFhjUYvarWPJz75rO46lFeoeymHz+nJq3WB7CRZfLh9ozMqJ1dqbDuGu?=
 =?us-ascii?Q?3rAQhVIPbI6NlPNysQK4oBVdASH5b/aBhp6H80Dxjz7eSOrD+Qz4Xa7610Ye?=
 =?us-ascii?Q?ITyr52yTiZ9Hah3sETBiIClHPGcrzLz1yk/EtE9NltNjXgJ0s2h3L6vR1Yep?=
 =?us-ascii?Q?j8vEn3p4KuhQytHnpBa1cj/vPuj891teuu8I5y/tirE2GB2BVyowZyAekTw1?=
 =?us-ascii?Q?W9PesVLG0LXP7iHhrARclLjBKv6/k7Qi3VbYQuoQwpHVL0Rx15/4zxUKuVf4?=
 =?us-ascii?Q?fCLgUfGXybQuqNJLI3z367+Zn8wbLKYpYt4jgKRg1D8wpBdvWv6/Bo35ntCq?=
 =?us-ascii?Q?lJKIX/atTftSg+VyasWfl1oB0XGDMAQ6bAkn/s7GF5gw7gmMBHDJvYiQpQ5v?=
 =?us-ascii?Q?kkiCEaks1kkRmG9WvPW21S22E55SSlWjQOJM0CATqP5bsYQfssg+p63oMiJb?=
 =?us-ascii?Q?U7Vn74QEd5MGdWZEKUqrKRKKKGssgceDXG4DCqI36fh9Ind3pnRw5Yx1R7Vl?=
 =?us-ascii?Q?LenrIcXUBBSdhkR8DPo3emp786uBeCzwBt0LU9+Pq9hd7c/AXmSFobEUJQGr?=
 =?us-ascii?Q?XRhHvhQCN0o9SzdXffdPLEqMRbcdct0ra1Y+XJUGfcFekDsfzGLG+LGaZBgV?=
 =?us-ascii?Q?7mSVUpixVGnK+ArSANbHDLiwgS72QQeTqkQyXA71EUMeeajt/uzuqrUO3EZZ?=
 =?us-ascii?Q?oqhV2Aqw8j1jnM6V/l+gJKPhqhnGUskDDOr806c6m+9UmPket1YfloA/FUfz?=
 =?us-ascii?Q?WmhiuaVPuPfBP3Xkzy8DS8splbZOVUOHZKzUvVwhPjH+ZePj9X2SrnFKYnJ+?=
 =?us-ascii?Q?iTy/Zhw51ImO/eQy63mYfSENp7WSV2nyy848xJ+lTEDOixgo/wCZfVHTvvm7?=
 =?us-ascii?Q?GyJzq3bXlvf3SGR7OtLbgEUCuCDIY7wSxJklkTjp2NK6CaBG0Veo9avFxLNe?=
 =?us-ascii?Q?YGobw2yHBESNHUW7q3GSolnkynPmZdZNqgZR1aPXyaabT5s09jyM8qs1+n0h?=
 =?us-ascii?Q?zeHYOW5NEcl1YKXdLoLjMD2g4lK9lwBCUXncuxfIdOHneIQXNwHWO/FfIXKX?=
 =?us-ascii?Q?dzYxzfj2ReC2nd5WmOJsdTCu5xBXxZMbpeLQRnmMUH/72nhbC0PvZP2OzPFW?=
 =?us-ascii?Q?N0woKom85QFpL5XPMdmtZ5WK51ANm1SFd5v+jsHFgQyhyWo35vTwjh3aaN/m?=
 =?us-ascii?Q?coYKTvVGwVY1uS5NvglqAXbMyQCM2ln8T0EI?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?02AI9RFm9LlZnUQVD+biKDTs02HDYpD5EieoXqgZTb1ZFRCKvghgX6rYsjPe?=
 =?us-ascii?Q?hdnBjL1MRFiGRS1JXjbuNIMX74872/RStuIowI8OoCppr4ED0ECLm/VyN2eJ?=
 =?us-ascii?Q?LnuT73hCk0+N/0zcGX5krCzEuyjujSmPNSpEbTg0cIXMjq4YYg/1sk577sPI?=
 =?us-ascii?Q?SAEOMOB3A0PryzKvV7na6hPnYeobkTs1FY98DqVQyKpuC62ZY4AIqcU4ZPZ7?=
 =?us-ascii?Q?FkeMKrPo5hqxxxVYCZShWc9RTdc2FopRrxXGn8RaSBnTIwzkEEO07ICtWs4Y?=
 =?us-ascii?Q?7X9QDGu34H3uAFSUXbH5nqSeMUQ5OIyU4uqi+ivZgGlFR93E3d3vkn1pk5zl?=
 =?us-ascii?Q?j2o2vqWeS+0R4DjnYU6rMro4Pu+EBDwuo0nFPvNDj/+Gcsmug7/XhkCjEOXN?=
 =?us-ascii?Q?NMw1fwCD+A2CzQcYZmJIidbkqATzYCPH3zkle/2lDmTA0zjGwJfO23H3+KDH?=
 =?us-ascii?Q?n0NSENIqzJt1vwYMmxb0UvacRdq/ULRNuW4bEVPFpEq+OTH2vW4ZHP9OiuZG?=
 =?us-ascii?Q?qmLc42QmMyin15dLsAUidzoCYJdxjps6uX6v61KKUZQO2/BtUkZFbfo56Pzr?=
 =?us-ascii?Q?DcvqqoUIjCUXQO2Xtl4ru275uBKnUc2z3r2AkeXBDf2DK7Xvs732vyfOLpA9?=
 =?us-ascii?Q?v1MwWgakuXz6IJs9odMnxEBsUUPNo4DNqGC+uczefg+ocQ8khMizHZmtTWSY?=
 =?us-ascii?Q?nu81x66g7zY0crRlQcFzEDNcw6xVoiTLbz46iKByrl6jLFfJ0n++aKPYggdR?=
 =?us-ascii?Q?G8/+8jDQYeyLEzmhXBbdlVdyfhCWYtMQAV4siBV07cNE+TBhPzHQo2hfITNR?=
 =?us-ascii?Q?Jz/s2lewX/6R/2hK3sYYfpD84qOUZTQEv34GYmbnIW73Q5Ycs/WhydCkYh/G?=
 =?us-ascii?Q?7tOUzZlgGKYi8c/D75GmGswkMTwYGmDOTR+oKc/YWCajqTxESK7QSHXbYdAV?=
 =?us-ascii?Q?U15/rkwPgb7AyXysGOWVlyIvKBjHiJb8y/lgTtGpWSczJvaxejvydtVCZVEF?=
 =?us-ascii?Q?2F/idnnb2I0DU2rGD26cMG9oCYXO7jMi+JUuOu3F3JdGZE12/i2QOOCzy5e/?=
 =?us-ascii?Q?a8tFi9YsiwqverZScYeHpWvk2Pn58CQl6NZSgeEINz3FboejwEw2c3iENIgJ?=
 =?us-ascii?Q?7a7IlXKEZnNxFln7wSOXGQICj9R5zXatn47FKUkTqO6dVGnDpmA1eivrLZao?=
 =?us-ascii?Q?gdHGfrQeMwdrms2lmMwuw0oe24kw6DZVBtCl5kRw4kSbVXAGRnazTSb0iDNJ?=
 =?us-ascii?Q?uFV3SV+74eQBluen6qhQZRXZ10qBKNjCTTYO+cqSmfxHazF/7hOqwb4CNRJA?=
 =?us-ascii?Q?6/eIhedb4lNvW/vqdtGwoqJHcx/DSa8REPO5YLpnFoIyXR8TV2ITuhdVV3/t?=
 =?us-ascii?Q?8/4Bm+e8F8SxqKeGIZ1xTG1P4d/znXPNlzf5LEO62xCGWiANhPV2H/PGtlYR?=
 =?us-ascii?Q?TLMsCGFo+Nn/JyVj5akz67bm6ekRrzIMGSebQkdmgTsLXhwluWNHsJcbHss8?=
 =?us-ascii?Q?p9ysVj1c8zQatMDNsHNuQwoPoU64ac01v5YSDZNHMokuCX139unHLmfsIoGX?=
 =?us-ascii?Q?OJumzGefGKv1ni4Xce7hd5u5DT3RaMt7R6YyFlJq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f988a35f-c4b6-4eb8-fa37-08de05b21b6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2025 14:59:25.5139 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WS48YNKE9VK1kCmXlSTlA4XU7TjFhGRPh5FjbVb6RHCWY0iKKzo38ZhzAm1NaumlP+PRJ0+9bGugXmbYr8btwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7016
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

Hi all,
Could you please help me review it? Thanks in advance.

Best Regards
Shuicheng

On Sat, Oct 4, 2025 10:31 AM Shuicheng Lin wrote:
> In normal operation, a registered exec queue is disabled and deregistered
> through the GuC, and freed only after the GuC confirms completion. Howeve=
r,
> if the driver is forced to unbind while the exec queue is still running, =
the user
> may call exec_destroy() after the GuC has already been stopped and CT
> communication disabled.
>=20
> In this case, the driver cannot receive a response from the GuC, preventi=
ng
> proper cleanup of exec queue resources. Fix this by directly releasing th=
e
> resources when CT is disabled.
>=20
> Here is the failure dmesg log:
> "
> [  468.089581] ---[ end trace 0000000000000000 ]--- [  468.089608] pci
> 0000:03:00.0: [drm] *ERROR* GT0: GUC ID manager unclean (1/65535)
> [  468.090558] pci 0000:03:00.0: [drm] GT0:     total 65535
> [  468.090562] pci 0000:03:00.0: [drm] GT0:     used 1
> [  468.090564] pci 0000:03:00.0: [drm] GT0:     range 1..1 (1)
> [  468.092716] ------------[ cut here ]------------ [  468.092719] WARNIN=
G:
> CPU: 14 PID: 4775 at drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:298
> ttm_vram_mgr_fini+0xf8/0x130 [xe] "
>=20
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 53024eb5670b..9d33f63d972b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1489,7 +1489,7 @@ static void
> __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
>  	xe_gt_assert(guc_to_gt(guc), !(q->flags &
> EXEC_QUEUE_FLAG_PERMANENT));
>  	trace_xe_exec_queue_cleanup_entity(q);
>=20
> -	if (exec_queue_registered(q))
> +	if (exec_queue_registered(q) && xe_guc_ct_enabled(&guc->ct))
>  		disable_scheduling_deregister(guc, q);
>  	else
>  		__guc_exec_queue_destroy(guc, q);
> --
> 2.49.0

