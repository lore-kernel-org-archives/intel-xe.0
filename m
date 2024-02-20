Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5632C5475B
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 16:45:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE4A10E3D7;
	Tue, 20 Feb 2024 16:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jmYUU8ru";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F52710E331
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 16:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708447517; x=1739983517;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:cc:date:message-id:mime-version;
 bh=9mRw+dTXyuj2Twskzs+O5+awu7IbLPfuftv4oqGi5s8=;
 b=jmYUU8rubzTVFxBmqsFYEbfNUBVc9pBs3V9NwepzYmO8WOuJDlAN3EDD
 YHzBjAYmrMTRkmyWyHEBqCy2SFxgkFBY7g7sJZ4mIhZ43pkxJhHCo/Muq
 wtKbKBMMOsUvGdf77i1f/GwYuamJ9qSdvG/pyQg5gXj+/p579iZetjy0r
 ynljpMq0XaP/TZmuzqaZ0emnfDAqXssCstrVatsg24xtPfFNfqdJ3WGbo
 3ZufkHaJSCCZp5Irl+65fnhU14WIsdNFBsTndXmW2CzTohP0U314YOZ3+
 Bdyq4/dkG9ZvFLcNP7jiZvTxSJTXEtg4r9DSqRMqhfs21q0HehEb6AvMj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="13117449"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="13117449"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 08:45:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="4800132"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 08:45:16 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 08:45:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 08:45:15 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 08:45:15 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 08:45:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ud0JWsbzCqDgV4PeczcQKtovMyZWP2epznn1xf3MFaYI4JZ48qCUR0wQuLGE3VmyvV8hREy3gHalCDy+GD3+AtEwJUFqxI9LYKKM8kJFpTWR5DuLqBECQZTM1BlfDBYJRivfgmTxgo0SbDq4aK4990hVvwyXrtUtgzuzGh8TsdOrLhGqQ9d/6Qgertb5wI0Wk9ti0T+s8/766bg7ZVqbjgFeIh/tMHRJ7MjtVSRL82z48FtoAGOwdccif6jmDVFhUmGIpr9Zs9ojLrk44U8W1wZBfwkzVs2vgjna1zZX4JYez6tDFoP45gAx0Fnb3+a5eV0AFedVBpw+NL4Q2CpejA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUJ/ZKFKHdSe3z+vrYZ/K8OogawOcQINq/QbDE3pLqc=;
 b=PxQVGPdHxLFsP1hOcbkYcAYzg5TQyR2LmkT7dz0gnugNFRQQuNprt+uGXmPzLTmF7GnA9xymKffLNcO7SmWzOaqhB0OzmnmvLf17nX8FRSlMl9Q6HbJKlGC+FkxWZMc+8Sq1hnn3VRXJvNOXBAMvt33APw8l+3BIFlTnk22reGSJ/PyScafP1ik7aWSz9+sYw9f98wf7Znh2Z8UBSpU7xovBaZ00QT70VvTloJvcdnaRZMDjmX4tHhWxFRDFtSG4GZJIyT0PnWPZRfDsBysTg3ShhDijKP3Tnugy+Rdne3e7/nk94XxGDj91baMhVlgmmH/5d9K97LFPHKF4mKaqYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM6PR11MB4628.namprd11.prod.outlook.com (2603:10b6:5:28f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 16:45:12 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::64e6:ee24:79f8:efa]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::64e6:ee24:79f8:efa%4]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 16:45:11 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240207103007.665367-2-luciano.coelho@intel.com>
References: <20240207103007.665367-1-luciano.coelho@intel.com>
 <20240207103007.665367-2-luciano.coelho@intel.com>
Subject: Re: [PATCH 1/6] drm/i915/display: add support for DMC wakelocks
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Luca Coelho <luciano.coelho@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <uma.shankar@intel.com>, <ville.syrjala@linux.intel.com>,
 <jani.nikula@intel.com>
Date: Tue, 20 Feb 2024 13:45:06 -0300
Message-ID: <170844750697.44184.3297077069453825970@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW2PR16CA0065.namprd16.prod.outlook.com
 (2603:10b6:907:1::42) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM6PR11MB4628:EE_
X-MS-Office365-Filtering-Correlation-Id: 90b90e54-fdef-440a-1262-08dc32334dee
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pRfhtLHDuimIbX/DRwPAy+lfGYqGK9ReJML6v3uVoMjnUbXN0IQeTRZbIDdrdgCd9MAOGaNViLeFGDhl53PWNxvFmD4WcGfwt3Cyz4gSetX6YR24pWkSvqNpmJ3smF9hAfcEGUIaYdRO3nex0qxiHmB5vUWwuBr5B773d07uNQxh3UyD8HdM4XH5OYxYFlbhzmUcMr+bBjlU7BosBPFrorxSMrOCnarI4C+zphiEsuMbtbTtEEXOV6x9jBRNGScIR/u62ZDbRyjMNB2Z2whK8UMFsL2N1eAClrebFfH1f34OwlViQkVBga2CJeJX8aoM2bmGiSfSytlwe6whviQ04IWsvZWB+WAsMquZg8vlCILtHeJRpPcEcsE98XQyhguqh3znH9AY4CS8fEnJxWBwikNF/YFtAtCdXc80A2nnvt+yaY88Bi8V2P0KybXfK4280nGJD+QuDtzFcg5LlLG0cnbTZQqDmi7j6SiJmYYgGmb6K6f78IEny16zx8qJI5paf6QEjstRF2+PKFtTn46BbBvQBd2Wa6GlQaRUQIzuztmVM6B7BRVdAT1UrnqL6g1pEMyDMtR7oQT83Ql+xqJVqR/aX+0uS1YJmly8mgLgA06+cp0T259iBSM9kQwQ20Zp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003)(16122699003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anM3TmRwczNZWDQvRjJ0MkhNaldNeXhJYXBvaGhmZUNpZWtDRmh0azB2VFZV?=
 =?utf-8?B?NnlTcUlyVGxlWHVpSkgyaWlFc3dJVHgyWVR3am1FUTdjOVFRbUJ5TTlmYTVS?=
 =?utf-8?B?c0ZPRFJZTHp4WTJzQkorekEyMWtZdjVkK3F6QXc0OHNFYnc3c2pCNXdzN082?=
 =?utf-8?B?RldNYUo4S3NEMDJHYUtNUE5jczNPZkt1OU9Ha1dkWDRHbXlpS0hhVzNEalIw?=
 =?utf-8?B?ZjZzQTkxbkhoYmVhR0tFaWoxTTBMN0tZN1BSU3kwMlNXRUYzWE1PcXpmcDJD?=
 =?utf-8?B?bjl5UUVsZjRvRlRyck9BV29hY0ZZVkRCTDBpYXZ2c1FMT2xWdzNYdUFCM0NT?=
 =?utf-8?B?VGVnYTlEeVdVdDVoK2RWTngyamlMRWZFZ3NvS0lyVjQydGQxbTF3akpLbkl4?=
 =?utf-8?B?VmVSZ1BQSFBmR1djTTlDSFIzdFM1ZGFETkp4emNXOEdZTHpNaS8yNXh3dFkv?=
 =?utf-8?B?clpjM3hCSzRMcm9XMXlrMzNsakIzYzMzZ2M0azlDSEkzWTJRaDhmRHJwZjNn?=
 =?utf-8?B?cUozQmFWVWc2U1QrbG9oMVBNUy9MbXovMW40UldTT05hY0FNTE02QXMrd0w2?=
 =?utf-8?B?c2pDQURmZWwvRUoyS3RJdGRkRjN6MjN2V0RuL3ZXMjd5cHlNR1F3U3N0cDNk?=
 =?utf-8?B?NjZXVVduUUFESkw0RzdGL3gxaDBTOG4xUTBrbTZRSVBLdWVVODg4MWlzdEFh?=
 =?utf-8?B?QWdLaVdkUkM1U3NJZDRFZVVlMjNVenp4RkFQbE40RWVpZFBNZitQZkJBamp2?=
 =?utf-8?B?WlZ6WmJEOVRNaEZjVHRjUzF1bTltTU1YZGZ1aGpKT04vSThVQmJpN1dNTkRr?=
 =?utf-8?B?T1ZhbFZ0b0R3YlpGOVRzOHBQNnh4UWZZRmZLRVR3dnp2eGFTMXdIMC9ySlcz?=
 =?utf-8?B?NHM4bm8wWXg1dlpUUytkaXVLU2VXcFhPWHpGdTJKY2hlMVVCQ3ArMzVWN1Na?=
 =?utf-8?B?aVo0ajA3eWZGN3lqTTlodktLSEhWcEFrL1dTcDVrQkxzWDFJK0JpazgrNSsz?=
 =?utf-8?B?cVcwMnJhS1RFR3VzOWRaUkw0QWhyeWt0V3NGa09aVXhNUnpRWXcwOVN6OFBX?=
 =?utf-8?B?WXVyUVdqQ2o0NG1KUzJOY3NmT2tBM0tPV1NDdXU0YWg5SUN6RVN4bXlRU2NC?=
 =?utf-8?B?S0EwZ3M5Yi9UVjRwUS9CdnY2dnpqT2poTFdMS2xvRjQ2K1lldDVSNzlLMFNi?=
 =?utf-8?B?YzFYa2FmckxlaVlyaktpQ25ScnRqMGEvNDExUW42RTFCNlN6Z0p2YStuSmNO?=
 =?utf-8?B?VWRSNjNMa1lUMzFKUm00SGUvTldUWWtmQnI3NlhHUXlrOEpaNGZaWHQ5TURl?=
 =?utf-8?B?UHE1R3NwZ2ZWUjhGZS9OeFhpNzlCZDRybVpyYk4wZU1kb1NqbmVUcEpvaWpp?=
 =?utf-8?B?aUtiWTVoVGVRWHhDTTBseVlFUW5MaXhPK1JSL1B4YkkvRCs0NHI5MHBIWSti?=
 =?utf-8?B?OXZhN3hvS1lsVEZac0lCaC9KRWtMT0lGK3hGeGNFck5qekNzb2k0Qmd1RkdP?=
 =?utf-8?B?YXpVNG1QTnFYa1JSTkFLa1FkM0x1T3VLTk03VXp5MXRrUEtKK2Q4ZC85Ulcy?=
 =?utf-8?B?cnNqNE91UEJDVmdVS3UxWVF5R0U1dEhVSEpYUnNBUWxYdDZEUGlSNVVLSy85?=
 =?utf-8?B?ckltdkRXMGpYSFJ0OENLMmpWOTMxelR0TVR3SEw2NHdKK3B5VXZHMmgxbkY2?=
 =?utf-8?B?ZER5RWJHVGw5bEVGbkJDbTJabDMwZHZaY25mVHdhdTI4MzZKMmtRUWwvMjZQ?=
 =?utf-8?B?VG9JRVgxeWNmNTBCUnFPWFN2Yzh5UXNyWUFQOU1sa1MxSGt6cHN5YXkwR1Fu?=
 =?utf-8?B?aGp0N1FURkVmQjFTY3JnVnZ3MGc2bmxRcVh3NTRKRnRPajZWRjZQSEpxVGl6?=
 =?utf-8?B?U1dLKzBhMlAwaVRjWUdvN2FmdDlxWDZQbGxCdEY2L1pYMXc0eUttQVNtaWRK?=
 =?utf-8?B?QVc4QTZRQXlBZXhkSit2dUlaalNqbVVJN1B5Mm13eW5TVTZrK3REbUdrNWt5?=
 =?utf-8?B?eDgwd3lraDRZWlcxOHgzbjhYRmVKQjJYdnBuK0UvcmZ3TktKSVNVWElpOXNI?=
 =?utf-8?B?dUZlSXROS1IrV1VFRURzY0hDWG1OazJhSnFEbHdhYzQxRElpakd4MERGOGg4?=
 =?utf-8?B?Y2Z4aUlWNGtBZlNkY0d1VFhHVk1DbVN1dWVSR0tOa216c2xxM2hvbmMrSEtQ?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b90e54-fdef-440a-1262-08dc32334dee
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 16:45:11.4923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQrV2WO4sQKVY9pKmTiLf8LmIrgH3Im/gBxv+cjTbppiks09vFcnw3e6b9YJbr/dlj88JY+MDpm52+nnXd3KlQ==
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

Quoting Luca Coelho (2024-02-07 07:30:02-03:00)
>In order to reduce the DC5->DC2 restore time, wakelocks have been
>introduced in DMC so the driver can tell it when registers and other
>memory areas are going to be accessed and keep their respective blocks
>awake.
>
>Implement this in the driver by adding the concept of DMC wakelocks.
>When the driver needs to access memory which lies inside pre-defined
>ranges, it will tell DMC to set the wakelock, access the memory, then
>wait for a while and clear the wakelock.
>
>The wakelock state is protected in the driver with spinlocks to
>prevent concurrency issues.
>

I think it would be good to have a "BSpec: 71583" trailer here.

>Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
>---
> drivers/gpu/drm/i915/Makefile                 |   1 +
> drivers/gpu/drm/i915/display/intel_de.h       |  35 +++-
> drivers/gpu/drm/i915/display/intel_display.c  |   1 +
> .../gpu/drm/i915/display/intel_display_core.h |   4 +
> .../drm/i915/display/intel_display_driver.c   |   1 +
> drivers/gpu/drm/i915/display/intel_dmc_regs.h |  32 +++
> drivers/gpu/drm/i915/display/intel_dmc_wl.c   | 185 ++++++++++++++++++
> drivers/gpu/drm/i915/display/intel_dmc_wl.h   |  35 ++++
> drivers/gpu/drm/xe/Makefile                   |   1 +
> 9 files changed, 293 insertions(+), 2 deletions(-)
> create mode 100644 drivers/gpu/drm/i915/display/intel_dmc_wl.c
> create mode 100644 drivers/gpu/drm/i915/display/intel_dmc_wl.h
>
>diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>index f7d13a7dcd63..05f0f54cc98e 100644
>--- a/drivers/gpu/drm/i915/Makefile
>+++ b/drivers/gpu/drm/i915/Makefile
>@@ -312,6 +312,7 @@ i915-y +=3D \
>         display/intel_tc.o \
>         display/intel_vblank.o \
>         display/intel_vga.o \
>+        display/intel_dmc_wl.o \

This is in the wrong sorting position :-)

>         display/intel_wm.o \
>         display/skl_scaler.o \
>         display/skl_universal_plane.o \
>diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i91=
5/display/intel_de.h
>index 42552d8c151e..ef24748d522d 100644
>--- a/drivers/gpu/drm/i915/display/intel_de.h
>+++ b/drivers/gpu/drm/i915/display/intel_de.h
>@@ -42,16 +42,47 @@ intel_de_write(struct drm_i915_private *i915, i915_reg=
_t reg, u32 val)
> }
>=20
> static inline u32
>-intel_de_rmw(struct drm_i915_private *i915, i915_reg_t reg, u32 clear, u3=
2 set)
>+__intel_de_rmw_nowl(struct drm_i915_private *i915, i915_reg_t reg,
>+                    u32 clear, u32 set)
> {
>         return intel_uncore_rmw(&i915->uncore, reg, clear, set);
> }
>=20
>+static inline u32
>+intel_de_rmw(struct drm_i915_private *i915, i915_reg_t reg, u32 clear, u3=
2 set)
>+{
>+        u32 val;
>+
>+        intel_dmc_wl_get(i915, reg);
>+
>+        val =3D __intel_de_rmw_nowl(i915, reg, clear, set);
>+
>+        intel_dmc_wl_put(i915, reg);
>+
>+        return val;
>+}
>+
>+static inline int
>+__intel_wait_for_register_nowl(struct drm_i915_private *i915, i915_reg_t =
reg,
>+                               u32 mask, u32 value, unsigned int timeout)
>+{
>+        return intel_wait_for_register(&i915->uncore, reg, mask,
>+                                       value, timeout);
>+}
>+
> static inline int
> intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t reg,
>                            u32 mask, u32 value, unsigned int timeout)
> {
>-        return intel_wait_for_register(&i915->uncore, reg, mask, value, t=
imeout);
>+        int ret;
>+
>+        intel_dmc_wl_get(i915, reg);
>+
>+        ret =3D __intel_wait_for_register_nowl(i915, reg, mask, value, ti=
meout);
>+
>+        intel_dmc_wl_put(i915, reg);
>+
>+        return ret;
> }
>=20
> static inline int
>diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/dr=
m/i915/display/intel_display.c
>index c3a46272d3a3..f38146690298 100644
>--- a/drivers/gpu/drm/i915/display/intel_display.c
>+++ b/drivers/gpu/drm/i915/display/intel_display.c
>@@ -115,6 +115,7 @@
> #include "intel_vdsc_regs.h"
> #include "intel_vga.h"
> #include "intel_vrr.h"
>+#include "intel_dmc_wl.h"

Unused include here.

> #include "intel_wm.h"
> #include "skl_scaler.h"
> #include "skl_universal_plane.h"
>diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/g=
pu/drm/i915/display/intel_display_core.h
>index a90f1aa201be..ec2c16744992 100644
>--- a/drivers/gpu/drm/i915/display/intel_display_core.h
>+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
>@@ -26,6 +26,7 @@
> #include "intel_global_state.h"
> #include "intel_gmbus.h"
> #include "intel_opregion.h"
>+#include "intel_dmc_wl.h"
> #include "intel_wm_types.h"
>=20
> struct task_struct;
>@@ -531,7 +532,10 @@ struct intel_display {
>         struct intel_overlay *overlay;
>         struct intel_display_params params;
>         struct intel_vbt_data vbt;
>+        struct intel_dmc_wl wl;
>         struct intel_wm wm;
>+
>+

Spurious blank lines.

> };
>=20
> #endif /* __INTEL_DISPLAY_CORE_H__ */
>diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers=
/gpu/drm/i915/display/intel_display_driver.c
>index ecf9cb74734b..491d1a38a313 100644
>--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
>+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
>@@ -197,6 +197,7 @@ void intel_display_driver_early_probe(struct drm_i915_=
private *i915)
>         intel_dpll_init_clock_hook(i915);
>         intel_init_display_hooks(i915);
>         intel_fdi_init_hook(i915);
>+        intel_dmc_wl_init(i915);
> }
>=20
> /* part #1: call before irq install */
>diff --git a/drivers/gpu/drm/i915/display/intel_dmc_regs.h b/drivers/gpu/d=
rm/i915/display/intel_dmc_regs.h
>index 90d0dbb41cfe..ef8642ced911 100644
>--- a/drivers/gpu/drm/i915/display/intel_dmc_regs.h
>+++ b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
>@@ -97,4 +97,36 @@
> #define TGL_DMC_DEBUG3                _MMIO(0x101090)
> #define DG1_DMC_DEBUG3                _MMIO(0x13415c)
>=20
>+/**
>+ * DOC: DMC wakelock support

I'm not sure if there are documented rules about the placement of
documentation, but I'm used to see documentation text on the *.c file
where the implementation of the feature resides.

>+ *
>+ * The wakelock mechanism in DMC is used to make sure it doesn't enter
>+ * deeper power-saving modes in order to reduce the latency in
>+ * DC5->DC2 restore.

When I read the spec, I get the impression that the main
objective/use-case of DMC Wakelocks is to provide the driver a way of
controlling the exit and re-entry of DC states when programming certain
registers (as opposed to having the hardware do the exit/re-entry for
every register programming). Is that right? Should we make the statement
above more specific then?

By the way, do we have a way of measuring improvements on performance
with this new feature?

>+ *
>+ * The mechanism can be enabled and disabled by writing to the
>+ * DMC_WAKELOCK_CFG register.  There are also 13 control registers
>+ * that can be used to hold and release different wakelocks.  In the
>+ * current implementation, we only need one wakelock, so only
>+ * DMC_WAKELOCK1_CTL is used.  The other definitions are here for
>+ * potential future use.
>+ */
>+#define DMC_WAKELOCK_CFG        _MMIO(0x8F1B0)
>+#define  DMC_WAKELOCK_CFG_ENABLE REG_BIT(31)
>+#define DMC_WAKELOCK1_CTL        _MMIO(0x8F140)

Since we are only using DMC_WAKELOCK1_CTL, I think we can postpone the
definition of extra offsets to when (or if) we need them.

>+#define DMC_WAKELOCK2_CTL        _MMIO(0x8F144)
>+#define DMC_WAKELOCK3_CTL        _MMIO(0x8F148)
>+#define DMC_WAKELOCK4_CTL        _MMIO(0x8F14C)
>+#define DMC_WAKELOCK5_CTL        _MMIO(0x8F150)
>+#define DMC_WAKELOCK6_CTL        _MMIO(0x8F154)
>+#define DMC_WAKELOCK7_CTL        _MMIO(0x8F158)
>+#define DMC_WAKELOCK8_CTL        _MMIO(0x8F15C)
>+#define DMC_WAKELOCK9_CTL        _MMIO(0x8F160)
>+#define DMC_WAKELOCK10_CTL        _MMIO(0x8F164)
>+#define DMC_WAKELOCK11_CTL        _MMIO(0x8F168)
>+#define DMC_WAKELOCK12_CTL        _MMIO(0x8F16C)
>+#define DMC_WAKELOCK13_CTL        _MMIO(0x8F170)
>+#define  DMC_WAKELOCK_CTL_REQ         REG_BIT(31)
>+#define  DMC_WAKELOCK_CTL_ACK         REG_BIT(15)
>+
> #endif /* __INTEL_DMC_REGS_H__ */
>diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl.c b/drivers/gpu/drm=
/i915/display/intel_dmc_wl.c
>new file mode 100644
>index 000000000000..abe1ea92cf65
>--- /dev/null
>+++ b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
>@@ -0,0 +1,185 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright (C) 2023 Intel Corporation
>+ */
>+
>+#include <linux/kernel.h>
>+
>+#include "intel_de.h"
>+#include "intel_dmc_regs.h"
>+#include "intel_dmc_wl.h"
>+
>+#define DMC_WAKELOCK_CTL_TIMEOUT 100

The documented timeout value is 5ms. Have we observed longer time to
ack?

>+
>+static struct intel_dmc_wl_range lnl_wl_range[] =3D {
>+        { .start =3D 0x60000, .end =3D 0x7ffff },
>+};
>+
>+static void __intel_dmc_wl_release(struct drm_i915_private *i915)
>+{
>+        struct intel_dmc_wl *wl =3D &i915->display.wl;
>+
>+        WARN_ON(refcount_read(&wl->refcount));
>+
>+        queue_delayed_work(i915->unordered_wq, &wl->work,
>+                           msecs_to_jiffies(2000));


Is there any rationale behind this number? We are basically holding DC
"off" for about 2 seconds here. That said, I'm not sure what would be a
good number.

>+}
>+
>+static void intel_dmc_wl_work(struct work_struct *work)
>+{
>+        struct intel_dmc_wl *wl =3D
>+                container_of(work, struct intel_dmc_wl, work.work);
>+        struct drm_i915_private *i915 =3D
>+                container_of(wl, struct drm_i915_private, display.wl);
>+        unsigned long flags;
>+        u32 ctl_value;
>+
>+        spin_lock_irqsave(&wl->lock, flags);
>+
>+        ctl_value =3D __intel_de_rmw_nowl(i915, DMC_WAKELOCK1_CTL,
>+                                        DMC_WAKELOCK_CTL_REQ, 0);

Variable ctl_value is set but unused.

>+
>+        __intel_wait_for_register_nowl(i915,  DMC_WAKELOCK1_CTL,
>+                                       DMC_WAKELOCK_CTL_ACK, 0,
>+                                       DMC_WAKELOCK_CTL_TIMEOUT);

We should probably have a rate-limited warn if there is a timeout.

>+
>+        spin_unlock_irqrestore(&wl->lock, flags);
>+}
>+
>+static bool intel_dmc_wl_check_range(u32 address)
>+{
>+        int i;
>+        bool wl_needed =3D false;
>+
>+        for (i =3D 0; i < ARRAY_SIZE(lnl_wl_range); i++) {
>+                if (address >=3D lnl_wl_range[i].start &&
>+                    address <=3D lnl_wl_range[i].end) {
>+                        wl_needed =3D true;
>+                        break;
>+                }
>+        }
>+
>+        return wl_needed;
>+}
>+
>+void intel_dmc_wl_init(struct drm_i915_private *i915)
>+{
>+        struct intel_dmc_wl *wl =3D &i915->display.wl;
>+        unsigned long flags;
>+
>+        spin_lock_init(&wl->lock);
>+
>+        spin_lock_irqsave(&wl->lock, flags);
>+        refcount_set(&wl->refcount, 0);
>+        spin_unlock_irqrestore(&wl->lock, flags);

I think we do not need the lock/unlock here, since this is the
initialization path.

>+}
>+
>+void intel_dmc_wl_enable(struct drm_i915_private *i915)
>+{
>+        struct intel_dmc_wl *wl =3D &i915->display.wl;
>+        unsigned long flags;
>+
>+        spin_lock_irqsave(&wl->lock, flags);
>+
>+        if (wl->enabled)
>+                goto out_unlock;
>+
>+        INIT_DELAYED_WORK(&wl->work, intel_dmc_wl_work);

Why do we need to initialize the work structure late (and possibly
repeatedly)? Is there anything keeping us from doing it in
intel_dmc_wl_init()?

>+
>+        /*
>+         * Enable wakelock in DMC.  We shouldn't try to take the
>+         * wakelock, because we're just enabling it, so call the
>+         * non-locking version directly here.
>+         */
>+        __intel_de_rmw_nowl(i915, DMC_WAKELOCK_CFG, 0, DMC_WAKELOCK_CFG_E=
NABLE);
>+
>+        wl->enabled =3D true;
>+
>+out_unlock:
>+        spin_unlock_irqrestore(&wl->lock, flags);
>+        return;
>+}
>+
>+void intel_dmc_wl_disable(struct drm_i915_private *i915)
>+{
>+        struct intel_dmc_wl *wl =3D &i915->display.wl;
>+        unsigned long flags;
>+
>+        spin_lock_irqsave(&wl->lock, flags);
>+
>+        /* FIXME: should we cancel the work? */

Do we have guarantee that there will be no outstanding wakelock
"refs" when this function is called?

 - If that is a guarantee, then, at this point, we might have that (i)
   the work is pending; or (ii) it has been scheduled an is or will be
   waiting on wl->lock; or (iii) the work is already done. One thing I
   think we could do in this case is to cancel_delayed_work() here and
   also have the work bail out if wl->disabled.

 - Now, if we have no such guarantee, then I believe this is a bit more
   involved. We would need to wait for all refs to be released, but one
   issue is that we are holding wl->lock at this point, meaning that we
   need to think how to properly solve this.

>+
>+        if (!wl->enabled)
>+                goto out_unlock;
>+
>+        drm_info(&i915->drm, "DMC_WAKELOCK_CFG refcount %d\n",
>+                 refcount_read(&wl->refcount));
>+
>+        /* Disable wakelock in DMC */
>+        __intel_de_rmw_nowl(i915, DMC_WAKELOCK_CFG, DMC_WAKELOCK_CFG_ENAB=
LE, 0);

Looks like we are only doing step (3) of the disabling sequence in this
function.

That said, I get the impression that intel_dmc_wl_disable() is in fact
supposed to be part of the "DC off" operation, which means that step (1)
and (2) would already be in place at this point.

Furthermore, considering that we would wait for pending "refs" to
be done like suggested above, I believe step (4) would end up being
unnecessary.

>+
>+        drm_info(&i915->drm, "DMC_WAKELOCK_CFG read 0x%0x\n",
>+                 intel_de_read(i915, DMC_WAKELOCK_CFG));
>+
>+        refcount_set(&wl->refcount, 0);
>+        wl->enabled =3D false;
>+
>+out_unlock:
>+        spin_unlock_irqrestore(&wl->lock, flags);
>+        return;
>+}
>+
>+void intel_dmc_wl_get(struct drm_i915_private *i915, i915_reg_t reg)
>+{
>+        struct intel_dmc_wl *wl =3D &i915->display.wl;
>+        unsigned long flags;
>+        u32 ctl_value;
>+
>+        if (!intel_dmc_wl_check_range(reg.reg))
>+                return;
>+
>+        spin_lock_irqsave(&wl->lock, flags);
>+
>+        if (!wl->enabled)
>+                goto out_unlock;
>+
>+        if (refcount_inc_not_zero(&wl->refcount))
>+                goto out_unlock;
>+

At this point, we will have that refcount is zero, meaning that there
might be a pending "release work", which would cause inconsistency if it
gets executed while there are pending wakelock "refs".

That's why I think we need to do 2 things: (1) cancel the work with
cancel_delayed_work() and (2) make intel_dmc_wl_work() bail out if
refcount is zero, since the worker might have already started and is
waiting on wl->lock while we are here.

>+        refcount_set(&wl->refcount, 1);
>+
>+        ctl_value =3D __intel_de_rmw_nowl(i915, DMC_WAKELOCK1_CTL, 0,
>+                                        DMC_WAKELOCK_CTL_REQ);

Variable ctl_value is set but unused.

>+
>+        __intel_wait_for_register_nowl(i915,  DMC_WAKELOCK1_CTL,
>+                                       DMC_WAKELOCK_CTL_ACK,
>+                                       DMC_WAKELOCK_CTL_ACK,
>+                                       DMC_WAKELOCK_CTL_TIMEOUT);

We should probably raise a rate-limited warning if there is a timeout
here.

>+
>+
>+out_unlock:
>+        spin_unlock_irqrestore(&wl->lock, flags);
>+}
>+
>+void intel_dmc_wl_put(struct drm_i915_private *i915, i915_reg_t reg)
>+{
>+        struct intel_dmc_wl *wl =3D &i915->display.wl;
>+        unsigned long flags;
>+
>+        if (!intel_dmc_wl_check_range(reg.reg))
>+                return;
>+
>+        spin_lock_irqsave(&wl->lock, flags);
>+
>+        if (!wl->enabled || !refcount_read(&wl->refcount))

Shouldn't we treat a zero refcount as a bug? Shouldn't we raise a
rate-limited warning in that case?

>+                goto out_unlock;
>+
>+        if (refcount_dec_and_test(&wl->refcount)) {
>+                __intel_dmc_wl_release(i915);
>+
>+                goto out_unlock;
>+        }
>+
>+out_unlock:
>+        spin_unlock_irqrestore(&wl->lock, flags);
>+}
>diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl.h b/drivers/gpu/drm=
/i915/display/intel_dmc_wl.h
>new file mode 100644
>index 000000000000..3de6c8dc1c19
>--- /dev/null
>+++ b/drivers/gpu/drm/i915/display/intel_dmc_wl.h
>@@ -0,0 +1,35 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright (C) 2023 Intel Corporation
>+ */
>+
>+#ifndef __INTEL_WAKELOCK_H__
>+#define __INTEL_WAKELOCK_H__
>+
>+#include <linux/types.h>
>+#include <linux/workqueue.h>
>+#include <linux/refcount.h>
>+
>+#include "i915_reg_defs.h"
>+
>+struct drm_i915_private;
>+
>+struct intel_dmc_wl {

I have the impression that we could have an intel_dmc_wl_types.h to have
this struct definition, but I'm not sure if I'm being overzealous here.

My rationale here is that we would be separating the struct bits from
the interface. The things that will really need to "know" the internals
of struct intel_dmc_wl are struct intel_display and the implementation
itself (i.e. intel_dmc_wl.c).

>+        spinlock_t lock;
>+        bool enabled;
>+        refcount_t refcount;

Looks like we are protecting both enabled and refcount members with the
spin lock. Do we really need refcount to be a refcount_t? Would a simple
int suffice?

>+        struct delayed_work work;
>+};
>+
>+struct intel_dmc_wl_range {

I believe this struct definition belongs to intel_dmc_wl.c, since it is
not necessary elsewhere.

--
Gustavo Sousa

>+        u32 start;
>+        u32 end;
>+};
>+
>+void intel_dmc_wl_init(struct drm_i915_private *i915);
>+void intel_dmc_wl_enable(struct drm_i915_private *i915);
>+void intel_dmc_wl_disable(struct drm_i915_private *i915);
>+void intel_dmc_wl_get(struct drm_i915_private *i915, i915_reg_t reg);
>+void intel_dmc_wl_put(struct drm_i915_private *i915, i915_reg_t reg);
>+
>+#endif /* __INTEL_WAKELOCK_H__ */
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index a38849acc9fe..474ce58b5e3c 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -281,6 +281,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) +=3D \
>         i915-display/intel_vdsc.o \
>         i915-display/intel_vga.o \
>         i915-display/intel_vrr.o \
>+        i915-display/intel_dmc_wl.o \
>         i915-display/intel_wm.o \
>         i915-display/skl_scaler.o \
>         i915-display/skl_universal_plane.o \
>--=20
>2.39.2
>
