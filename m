Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B304BCD3439
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 15:10:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2330110E599;
	Thu,  7 May 2026 15:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MnN9cs2q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF9C10E599
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 15:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778166646; x=1809702646;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=NhIruxMVl+BkA4MIGed/XbvRZ5mSP8rG8jWO8wJ86GM=;
 b=MnN9cs2qWSbPP3fonXEbku3m5H3yaPpgZCY/B/OnhCXB1i0hnmtC2UR5
 DMubUa2xskp+v2WJLo8HvbBmErIDDZlAzbEoILFu0ZgpkxJybyOBIBMDP
 QAhXN8XR6OMOTnJ2aBjLuebQ39W+skNnMgK04v83a7uzYae/99XxSSv7/
 KlpZVB0sT6rfV/OYu8z2E9spzKIF9L0V5prxKy2IK8H4NaViINixqAhSl
 sROeNtMvs7ZTT6/au0uTP361rZaku44SKWLOzhmH8qsa0n+4HCZYmCkZe
 o14AER7eYo0Wk0wzCcA4VWnAmWer1x0zf6UI+w+aUp8NCOVtVzyJBmZpc g==;
X-CSE-ConnectionGUID: WXrDu60MSY+B/UIm2ZQusQ==
X-CSE-MsgGUID: Ahct2Mu9S8uAEAvOEV4y0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="104578849"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="104578849"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 08:10:41 -0700
X-CSE-ConnectionGUID: bw2WaII8QP67iTLbts0Qnw==
X-CSE-MsgGUID: dZ7bpNRHSFCIuV0n3TSQEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="235490682"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 08:10:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 08:10:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 08:10:40 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 08:10:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BP6HPqcRfP7QFpqMuQgkf16DiIMtXLm2S7ch1CRpGEDnCCxJ1lZVpAubD39U4bdgD6nkp8Sfgl/4GZY6syMigoeEvJTOxhLWMJ4nd8RJneIobcmS+gYwHGmHVcPj4yLBC71ccAPLKBWw9hwU33P6lM/f+dRHBmkY11d4pZ+Wc8zxrAUQy+eB98CubwIi/1I92ZSsd0izZuqR1F3+ZA9+jeLOtUGtyXKMFQwV4yPnFg1sVSABQB6/C7/3UXHeCviVga0azzHiClpmDphpSOssfGHY2UeJsBdcuClSLKok5ZLGeu4EL8PKVH8qVE3kbgk74/zg7hNBkf6OwNeiSImmRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpGblhBqMxV/ttU9KyCosuDOxWLbzyLBO4GdyWyoy2Y=;
 b=McD8EqCRKsWUdZPjyJH9UJsrdAvHYkUL94KLspyHJCmmKdO1TSKxjpVgRP87Bg9Y9EYzJfpovee2G+Hr7YpKKQE7UFWvrg7U9T+HbyVvW3xVhawDiFNR0hvkx/nXx75RVQDV7dide9WcwWwUoDelL0++tvMEn0IHAG96o7Fzc/mAJKhHFtf2c9XuQCi50rMcpInSucEhx3JKxGFYfwbrEYvglYM4uigq5OSODSffEYKRkBT6X7oj5qoXhNC+PG9OeEEFHkYyrq3LL/2406eRx8Mbg1dzLRNJ9TiRyuqZNhziJFiNPk33ocZKmHmGS9tXbFQc4B5VmqdodJyvf55A1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CY8PR11MB7314.namprd11.prod.outlook.com (2603:10b6:930:9d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 15:10:38 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9891.015; Thu, 7 May 2026
 15:10:38 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: "Saarinen, Jani" <jani.saarinen@intel.com>, "Xiong, James"
 <james.xiong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Xiong, James" <james.xiong@intel.com>
Subject: RE: [PATCH 1/1] drm/i915/dmc: fix assert_dmc_loaded WARN during
 async firmware load
In-Reply-To: <PH3PPFAB4263235366FD006E5F293C5B9F0E03C2@PH3PPFAB4263235.namprd11.prod.outlook.com>
References: <20260507004631.574300-1-james.xiong@intel.com>
 <878q9v8eqt.fsf@intel.com>
 <PH3PPFAB4263235366FD006E5F293C5B9F0E03C2@PH3PPFAB4263235.namprd11.prod.outlook.com>
Date: Thu, 7 May 2026 12:10:34 -0300
Message-ID: <875x4z8dcl.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0103.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::44) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CY8PR11MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: da83d983-cf2e-4beb-366c-08deac4acbf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: jmufaon0/NyUD68kI7UyW5+//Z0y8NxJ/ZIYX+W/jIOYYJqW/+yXz23SaqIT5SFpC2//iUI+Groy+0R0DcFcvYEygYUPpRax/54d3cZliNb/MzoM4flyhMxizAJUl+ksd2sJJxsTeExN+0bm1wwwZaaO9K/yvbbjvfEFeMGY7Eb6h+wO+TAMtZoDxyHXhyfHwkS0wfH1oGRhxKwyga6v4eu16sBzRlWu0DfkLTYtyOi24V9446YSL7Ve3i2OOj/ugh3/S5niCafIHDaeoEq84iNCKkHAno0n8H4iz0r/JDXcoPjHuphp0CPr1SOz6E/zPEUCy1OdoVoqx84tzpiu624rCYKJJ9lIKttXS+au18PT5J7dSButX2xTJpG/6Iu7bdmq00OBRansjII2pKd8B0P0Qc2vYKnFEkLde1zlRQhaA3AKS7VTfDlKwiPZaTO051JpHlVUBFZDBffo2u4OXMwGo3guNwZQaIGl3lXdYSkBxiMyB+J099h6WhssfLgI6iQVzZYiDKfPIyfm3SMHFNI6j+y8LhA3lPvvr8Y+hNd6rh8I98KFmKK7fsv+HsxM1YTt+UkjhmAxIND5tKkmhru6JGKSaHCjPNHoLRrA+9nXzr7BgdmT+EWvedbWadzNxDjY8hSeXMlQ5xD9W+zO3Ths3pQDiXRYEvmsOSLnF6LKqjhMF+oKD8I2EFFDCUwc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ouwIdy/YaNskdsp/HN4LIF3m7uizwhrpiomfsbXutPXRu97HNSwXBHMceH0B?=
 =?us-ascii?Q?wZLrOLNYYfXY4wLBkhMykCfpB9MI4R96hG0ZfDoE28N8tscRbw5JBPycSQlg?=
 =?us-ascii?Q?EQB/7V+knVRPJvLjh4eQPib9dIEiq4SLqyXcCILWyxiKl/9ATq1IcTGSF9w5?=
 =?us-ascii?Q?XzwE/DFSsssRQUFbry4mKjGArTmNpNif3iUHm+2yebqKlioYe0Dg1wLpgfW+?=
 =?us-ascii?Q?03QtBusyQq/0eOHCORNa6gOvfNSFbraq/e0fJnOxm0oCGB5DUaSeBEmWkIuD?=
 =?us-ascii?Q?dKeCqtt9paKgYQp9joXlJrmfJEvFBcspfWFFIZfQYDZoj+KAQIS1ZE9B4qyZ?=
 =?us-ascii?Q?5lC0Zee/NzwAiaNtnsvY+0U2OuFJd4Lvo7nGDm5X43kCHB8harNt+d5fJmoK?=
 =?us-ascii?Q?E0Xw8FqasDzgcAxR6hvUWjg9ho1CivMkyTNyFCq9Kuh0Ny5UasRlCa8xv5zB?=
 =?us-ascii?Q?veyYwk3jHy9txbE4KkpNOShpWDfTw68OBOy62E8ZuNWS94H5TUjeJHlWnHda?=
 =?us-ascii?Q?UgXyoAlBUDKcNubn7TqvyCnr4KlVL6QBigjca11PueaEqkkSHJs+HvPCOjj6?=
 =?us-ascii?Q?K4KvBMr3fHlZ6Jd5vscedjC3XPJWDytU+MlZtRl2DrPlPI/S4zuIknloMN2+?=
 =?us-ascii?Q?rIoHB8ZBvY4KwC/jVwPuiK9Upd6hw5HkgPAPPq/KKrzNd9yC9vo+gdfX0UsA?=
 =?us-ascii?Q?Dc9o6cxh1FZd9m7pWY+Ylgyis3YmOK69wrKEp1ONQ+SqOTxU0Iwm5oAUD3HJ?=
 =?us-ascii?Q?2Y7wsh8rz2EJBjOWC3+T0pUBhfBkOJnD1VbD6xynPUs/SpDkwtPwxXLRKNcx?=
 =?us-ascii?Q?lCKR4g/hoe8114VhfM09azPshEtUDwC7JsLthwj5fxxdp+t70/4IL6hT61bv?=
 =?us-ascii?Q?Js4ZS7BuHveZYvaDwGUhg3DLBwyV83LwukU1QCFt41mEAXJAjsHlWDLFOjvY?=
 =?us-ascii?Q?PTufZ7FJh4bmDf5RmSJyWp6tWfJuGCPvIHeGqWTi0YD43EJSWEQS4a37UJJJ?=
 =?us-ascii?Q?VBqbcLUB37AFBCgPCZ5UYJ1RnOUgnmOEz6e7PaCdT3orfpuFXN7N9jiEdqXa?=
 =?us-ascii?Q?4zD4n2nHEK+k2G+/e3EJgOZ+m6yDGRv3FcQOq1YT42YkQlg9LEinwS9BjkLK?=
 =?us-ascii?Q?ATMAAm1ShDE2iqT9Np3wlu2s7+qXSnPontXzR9pJuOY2/EAPqgdSFXx+OAyI?=
 =?us-ascii?Q?H/2tcKwwZvL5XR7C2WMgnj+A87IuiBHaLgIIyhnoaBgJKYk4/+gPNf35Oj0l?=
 =?us-ascii?Q?GzLNZufDniMkufArNLiX5ClXiQ9SnnrxnmLBR+7SufeHxviixBZdtkTIUvU1?=
 =?us-ascii?Q?iUAt4Czt0cqR4fuBW++MzTPj+1TZQYvd6nZlYT52sUM23/Gc5kD5+gSN9o79?=
 =?us-ascii?Q?7AwP1irTrllTSzUzOXpaql7vSArb1d0XakeVPUoxNdJMT9rb4qz5PrTMVOxj?=
 =?us-ascii?Q?h97G/GklqngzPPa7Gg4y9c+myCsQBhMlajtuquoogUVomVeez9ncZ2tg0mwW?=
 =?us-ascii?Q?j+hDwpsLXjzOfelDhHYmtuVznfmAu7WWKsGLVlMqTkAnN0MEoN786sKfK96b?=
 =?us-ascii?Q?0KIl8M/IfngCjFskpqfNbcVjzSIkiGjhayUuiDg988utBWUEmIdbSBWlg54w?=
 =?us-ascii?Q?i7Y4ybJK2ncrfG3XxzWA0hoaiKvlDV8mINXn0kdPbUaHVAzLqd9JTfiYRtA6?=
 =?us-ascii?Q?wS151+EoBsuqQQJk3uGclOdCi6qJYtOatdjysajEfktppk9xyhIe4n5JxSRW?=
 =?us-ascii?Q?ODwM6vsKEg=3D=3D?=
X-Exchange-RoutingPolicyChecked: mhvNP5nf4S6pi035blkHlzkAoUCfI5vTMc8H5mxxMTPYP8yxVgR5cXSjn2MvF+CqM0gb4jmJ+THIGwb/9XB6UKcIhY5MKZZbMht+UhaC7fsHhkHs+8D93KCepTJcugoWyXmyBCyai9gzvGuB3hRkfw5bbs9uQ8iMJhkwTQK1133xDyea++G4HeADJHtZRBO1jBP90n7/vCgIrujx+jDZuCOlGSX21S2xNgbXU6XGWdLT6Q0z4odSK2tlO2xChpbYaYOBnKzvVZcLo4P6Iwoi+RM1kZsXMcywRwnpAd3t2osmZfFmAKGKTxbP9jzscW060m9yxRaZrIb+jgAT2t1hCw==
X-MS-Exchange-CrossTenant-Network-Message-Id: da83d983-cf2e-4beb-366c-08deac4acbf4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 15:10:38.4129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kv8q7SSYe/HWhZtA/1+xcotse7xAYho0/7zWmk+VJalf4bhJrwFmV+vHxVatjXH8InYcrbY1sWhy3sDOvu9ncw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7314
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

"Saarinen, Jani" <jani.saarinen@intel.com> writes:

> Hi, 
>
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Gustavo
>> Sousa
>> Sent: Thursday, 7 May 2026 17.40
>> To: Xiong, James <james.xiong@intel.com>; intel-xe@lists.freedesktop.org
>> Cc: Xiong, James <james.xiong@intel.com>
>> Subject: Re: [PATCH 1/1] drm/i915/dmc: fix assert_dmc_loaded WARN during
>> async firmware load
>> 
>> James Xiong <james.xiong@intel.com> writes:
>> 
>> > During driver probe, DMC firmware is loaded asynchronously via a
>> > workqueue. There is a race between parse_dmc_fw() setting the payload
>> > pointer (making has_dmc_id_fw() return true) and
>> > intel_dmc_load_program() writing the firmware to hardware registers.
>> > If the probe thread calls
>> > intel_dmc_enable_pipe() -> assert_dmc_loaded() in this window, it sees
>> > parsed payload but stale HW registers, triggering a ~20% intermittent
>> > WARNING on ADL-N warm boot.
>> >
>> > Fix this by adding a 'loaded' flag to struct intel_dmc, set with
>> > WRITE_ONCE() after intel_dmc_load_program() completes. Check it with
>> > READ_ONCE() in intel_dmc_enable_pipe() and intel_dmc_disable_pipe() as
>> > an additional guard before has_dmc_id_fw().
>> 
>> Making intel_dmc_enable_pipe() bail if the DMC is not yet loaded doesn't
>> look like the correct solution here.
>
> Should this be also sent to intel-gfx to get tested on i915 systems?

Agreed. ADL is supported on i915.

--
Gustavo Sousa

>> 
>> Does the warning come from intel_modeset_setup_hw_state()'s call stack?
>> If so, I wonder if adding a call to intel_dmc_wait_fw_load() before iterating
>> the crtcs would be a saner approach.
>> 
>> --
>> Gustavo Sousa
>> 
>> >
>> > Signed-off-by: James Xiong <james.xiong@intel.com>
>> > ---
>> >  drivers/gpu/drm/i915/display/intel_dmc.c | 16 ++++++++++++++--
>> >  1 file changed, 14 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c
>> > b/drivers/gpu/drm/i915/display/intel_dmc.c
>> > index 0df4f42ba3e3..c51103515820 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_dmc.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
>> > @@ -79,6 +79,7 @@ struct intel_dmc {
>> >  		u32 *payload;
>> >  		bool present;
>> >  	} dmc_info[DMC_FW_MAX];
>> > +	bool loaded;
>> >  };
>> >
>> >  /* Note: This may be NULL. */
>> > @@ -417,6 +418,13 @@ bool intel_dmc_has_payload(struct intel_display
>> *display)
>> >  	return has_dmc_id_fw(display, DMC_FW_MAIN);  }
>> >
>> > +static bool intel_dmc_loaded(struct intel_display *display) {
>> > +	struct intel_dmc *dmc = display_to_dmc(display);
>> > +
>> > +	return dmc && READ_ONCE(dmc->loaded); }
>> > +
>> >  static void initialize_stepping_info(struct intel_display *display,
>> > struct stepping_info *si)  {
>> >  	const char *step_name = DISPLAY_RUNTIME_INFO(display)-
>> >step_name;
>> > @@ -786,7 +794,8 @@ void intel_dmc_enable_pipe(const struct
>> intel_crtc_state *crtc_state)
>> >  	enum pipe pipe = crtc->pipe;
>> >  	enum intel_dmc_id dmc_id = PIPE_TO_DMC_ID(pipe);
>> >
>> > -	if (!is_valid_dmc_id(dmc_id) || !has_dmc_id_fw(display, dmc_id))
>> > +	if (!is_valid_dmc_id(dmc_id) || !intel_dmc_loaded(display) ||
>> > +	    !has_dmc_id_fw(display, dmc_id))
>> >  		return;
>> >
>> >  	if (!can_enable_pipedmc(crtc_state)) { @@ -821,7 +830,8 @@ void
>> > intel_dmc_disable_pipe(const struct intel_crtc_state *crtc_state)
>> >  	enum pipe pipe = crtc->pipe;
>> >  	enum intel_dmc_id dmc_id = PIPE_TO_DMC_ID(pipe);
>> >
>> > -	if (!is_valid_dmc_id(dmc_id) || !has_dmc_id_fw(display, dmc_id))
>> > +	if (!is_valid_dmc_id(dmc_id) || !intel_dmc_loaded(display) ||
>> > +	    !has_dmc_id_fw(display, dmc_id))
>> >  		return;
>> >
>> >  	if (DISPLAY_VER(display) >= 14)
>> > @@ -942,6 +952,8 @@ void intel_dmc_load_program(struct intel_display
>> *display)
>> >  	gen9_set_dc_state_debugmask(display);
>> >
>> >  	pipedmc_clock_gating_wa(display, false);
>> > +
>> > +	WRITE_ONCE(display_to_dmc(display)->loaded, true);
>> >  }
>> >
>> >  /**
>> > --
>> > 2.34.1
