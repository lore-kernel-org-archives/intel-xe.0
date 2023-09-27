Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF4EE80A8B
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 05:36:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F321E10E46A;
	Wed, 27 Sep 2023 05:36:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85ADC10E46A
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 05:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695792972; x=1727328972;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=puNUx3m9RHAh9M/Mx2RIcgy25CeN8dMytNkMgbchoRU=;
 b=KF63tJE4LePMPAagFhIKyL8AaPv4QjsenElHlycsWh9rFGnm0rVt3xJO
 sCMK6ncAoDh07ZQcFCWpfKJ8yOgWBZJs9mdpOwxTVMNPTjlZUgR75PO1d
 lNTzVJHAPpf8Vnk7yIVb6xh/2ApygroBnDj1xfEgbY7OieqoAWfgtu6Ge
 k8VQqbFpVmINFNo1wB0nlwRvrAMSeA7HmOJe3UZs5XZKk6kLkb312yqxb
 Wz4M6hcnppfKf5cV20IgF9yxNC5Yfazib1aBfOQdwwLPzXVhJ1ZlgqvWA
 8U80oSY+XT39lCRh5fUT9rv/E4KDMi5KAW/2Mopx9Ib8gGWRpeSvwwhjc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="445869070"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="445869070"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 22:36:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="814730339"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="814730339"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 22:36:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 22:36:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 22:36:10 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 22:36:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qp2Fjmub6HZIVu3/B/HgUehwbeSFOOk+Vxg64WHkWVjJd8be3Wmz1JzCoWUCOGgwXAcpVJJjHeTo9RujxycLs98FZeHIP2j6z7boLO++DkKMz6jemsHsel6xMemHnQEfihgRCqCQm6/jdlOYVo7iOiy+vTb2efBvBbOB1hDD0vnfOiv+1Gnh319TX2V4m29oSraLAO8It7CK6liJxh7vczSrMuno8EjM5pOTrJq7jXDvsBFI9IDYfEUA4fQAU/FEo9CJhWTc2R5yC9KuMlX9mSQYRobpK6oiiAYC3cgPx/0KJH9gWorv1lzEVtwSTp4PXHny9Ino2Mv2zdAUtM7DWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDCtbsDXoeKHT6N+jJQrFSRTt2RqABWIXpv2ZMeq4Xg=;
 b=Stji6ZYtV+0vu8dDZGVvaz2lCjjIxMtMQQiNTw8tn//ax3AHhtr7oeR+BI6yEIk3NEFgkfwoFvVjB6MHVtziJAmitqLIeuEzWVHjdtY5SqLobS11+RYT7j7VRJR/sFVIq+Fk3cOrYUuSJPKHYbTsf3zyipwD/yKZWWJH1kX2ozbG8YBMX9Qu9Di5eTrwI0E5l3A3Sa9qfB+unOLVI3vWNEmpp2xooe9vYAUZ82wc61s5dA895HIsTluWUYdk68gYDwN80+qFD2M1EKMPlAQPunj/NNS80qUN2GUPFaDazT8sw5IjUmpqNTDs5wsqaa8HUCwuVGjsOGKUJ6DpPD6+TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 PH7PR11MB7003.namprd11.prod.outlook.com (2603:10b6:510:20a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 05:36:03 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4%3]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 05:36:02 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH] Revert "FIXME: drm/i915/ips: apparently silence warnings"
Thread-Index: AQHZ6gA9RkzQgn/0k0myOnxehjo1j7AuM+mg
Date: Wed, 27 Sep 2023 05:36:02 +0000
Message-ID: <DM4PR11MB6360B7F6C270EC1BA6E35EA1F4C2A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230918071231.288885-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20230918071231.288885-1-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|PH7PR11MB7003:EE_
x-ms-office365-filtering-correlation-id: 0f8f320b-642b-4096-8eee-08dbbf1ba32e
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H9axtM+YGqHqQXwOKuSGT3/kU2o4ucN9UkSc5JD2+lYKPbhNRPWnXQV1x6H5TJYH5ROjxsEQfZeAZhv2LF5lD1oaFjP/AUILfG6mOYGnj9JaSaxTqlah0K0tBbydUqLGzpNwn57vl6bf1x9s04865R5y43e4WLOdtb3nFMlYz4x01QNdNj2XMt/GuZg21PSKn3JTqLVrxVBSJGKSetnKsf7yl4C5l62m3JL5GY8B1qiLVDW86NQgsSfz8Y3yDoCmAGh1nvLswrykDU74e1GAI1kyFtD5KG4f1PbCkEG7saikzwloSOMqeWa5t800C4Xezl8W2V94l5+JkFE/fyTtSwEO3CIV9H40r3kbkKQVT4mvEJwhEDMhx7ANKUJxSmetYBdr2hij9dU2C8ezIS6k6pUZlVZaB9tBOkjafbapK8XPpj7UHk04wTp92zWFQ4EgxQD3M4wkmHW8RYOFVAnbpXaMB2GEUQJvqYYhjEsnl47LWTjcpNhP9XLgqOIcDc8WIh1I8plPZ8q4UQqW1ghlv8D8aoJdvDF0SnetgswVER0Fx3JhDzgRNxcyDhnbZdtQSZSV/BxHzwRqFQbEUA1LW4yw3M0qUFoo10U/qrHkLDsotlTXXPGq8LqgUr4w20QU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(33656002)(76116006)(66946007)(2906002)(66556008)(66446008)(66476007)(64756008)(316002)(4326008)(8936002)(8676002)(478600001)(7696005)(71200400001)(6506007)(53546011)(110136005)(5660300002)(52536014)(9686003)(41300700001)(26005)(83380400001)(55016003)(82960400001)(86362001)(107886003)(122000001)(38070700005)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?T521D0JWYnk9E9obMFlEDNPnQMn89fPy/sQt+zLPcHetlZN0gwAuPcrWXzs+?=
 =?us-ascii?Q?JZro09D1HkeeER8IkoTZRHavy07tLHqE7wH6cBpWXSnj3aahAPc2gpwvt5Ev?=
 =?us-ascii?Q?8zpAEgRHkMwzSnzeJk2wvduUD9AzvhiE9MLnynwXN6ooZaQhEcsAlvQAcn4n?=
 =?us-ascii?Q?hAzEit0WOAC990u3JUL9LtB5Ha1jVxn0OdcUINJx8+A3Dpuen5wvJfxRbJmi?=
 =?us-ascii?Q?98nOvAjzuO7qA1BQKZ/6x/nvxtpSOzm4j3TYb/pp1rnxzy5eUSuvDIfqHh7S?=
 =?us-ascii?Q?dWlBF4SV6Pl2JJ0MtEQnmy4jlQbJBQZKeoPyTo/QN9iFk6QaiRpg4FxL2j+l?=
 =?us-ascii?Q?6qPka8h0luqG/uvAY9vkiv9ms5QgvxvavWcFVYdwe0c2rdfuJEuMbHM6ti0T?=
 =?us-ascii?Q?Q5kkZ9lyjeIwIBa8OK8AtC93R+8wyrO91FICK1C9PQyTz0mFB0iO4liKW7tq?=
 =?us-ascii?Q?g0KvFR7qoWCtarU5jzZrl0X7iHQxgx8X0nbu5KyiIoxgGon1g2Ih8Y40jFyh?=
 =?us-ascii?Q?KkZ9V/43YFT/N8Bv5KzcO3MoMRDQzPbi0z9KVfyFW4Me6Auoe80+hBytw/QJ?=
 =?us-ascii?Q?mZrTlcCrwieaN/ze6qCNKGkbT2nmGJNWvFKT3x2jaxIHFdHQhX2nL/lCNxDX?=
 =?us-ascii?Q?dc2VaU2pFLEibPqgnzzIgLcqRrcLfFi9bwJj61TYxRjRb3f+BB4aRc76uzhE?=
 =?us-ascii?Q?jljf3qXRDtWttD8qkJtNAWWrtf+5nx+BsyTUXzHKRBq8JlIXoqCh867LVX7w?=
 =?us-ascii?Q?Fj+ieVaYme4UTJLCUZA1BLqUEwnKS1iqLpNGdC2NwDdT9Vjszden2gEFFgu6?=
 =?us-ascii?Q?iQN6FTijQUHIuLGzSZqfbgKL1VfngW2J7qUUiXMfsi6TK69c34wcI5fbIE+n?=
 =?us-ascii?Q?bulXjuMu2rPOHeeer2ttUHovzkGR1D9xYsFKmz9oIdm4SMAGL0+WHB5cq70O?=
 =?us-ascii?Q?v8whUFtLpLr9btYvoz2UeXrKJLUzT9RrKzcNyg+bfc+7OlqIdVamXlrxodOa?=
 =?us-ascii?Q?cCwTA8Tj0+3GDNHf8AtC80yW6VzN8xqmXgf6MUPIAFqkjX6EYEJD+2Xxi0e2?=
 =?us-ascii?Q?/eZjUtdP26ia1gEJTKVbi4MHPUEkinTa2q67Uv66nm78n5rr/7dsvNmSpQkZ?=
 =?us-ascii?Q?3i6Df5Fqfed66TsigbbuJHnx7r4DjJ4c8n1G8GnSR/0FVG1bEYN6CFSOxpkR?=
 =?us-ascii?Q?asc+jRD+/AzgY72HeN7pldeRdmSBlOGIM5wEGL9f7HN/7L8rEO2B+TZQPsp5?=
 =?us-ascii?Q?g5LjK+Wn5luqswrirPHZWdfq5Um2nauZkfqoYVD/dU9x3ZoPdAWEGoRrAzfe?=
 =?us-ascii?Q?qknwLRtb88GChTCvEaTwXu0fi8gciLz2gBJEVrT9lHcN0/BdjY6qXZV4FyEM?=
 =?us-ascii?Q?0ws0usiye8hmlgxu3a+8HOKV1ajofvJESIxgKrXZktVJ0OsmEOpf7PD6yVsL?=
 =?us-ascii?Q?X8iNeNdpgSQnMzSJpXpcIev0hFSKBKLIj1nrvzgUJzLYadG1M9Ia+qRdrcKC?=
 =?us-ascii?Q?aLSdFjhaIcVSLh5iLzfEOllpeLTezePBJ63rtWKnvT9Xgvd4kds3Lozq1Wxh?=
 =?us-ascii?Q?Csuc6UYrazdx5o6IsFtY+kBDGBQO8E5thZU/DAnw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8f320b-642b-4096-8eee-08dbbf1ba32e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 05:36:02.5668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: odgccREiiZeZxjou6YQMTVY412BXlK5WcRoZYSi5rd7/0qm5JGk6HJT1poZcZhv4WPsCOZiB6EdVqawT/ax0PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7003
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] Revert "FIXME: drm/i915/ips: apparently
 silence warnings"
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Sent: Monday, September 18, 2023 12:43 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Nikula, Jan=
i
> <jani.nikula@intel.com>; Shankar, Uma <uma.shankar@intel.com>
> Subject: [PATCH] Revert "FIXME: drm/i915/ips: apparently silence warnings=
"
>=20
> This reverts commit 004360063d3b8a29cdf599ed18dc6a23c6e61513.
>=20
> There seems to be no effect of this patch i.e. removing this patch yields=
 no
> compiler warnings. Hence, revert.

Hi Jani,
Reverting the change is not resulting in any warnings. Do we really need it=
 or
are we missing something.

Regards,
Uma Shankar

> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>=20
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index 9df8081f78d9..d0ec09621fe4 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -4195,8 +4195,8 @@ static u16 hsw_linetime_wm(const struct
> intel_crtc_state *crtc_state)
>  	return min(linetime_wm, 0x1ff);
>  }
>=20
> -static inline u16 hsw_ips_linetime_wm(const struct intel_crtc_state *crt=
c_state,
> -				      const struct intel_cdclk_state *cdclk_state)
> +static u16 hsw_ips_linetime_wm(const struct intel_crtc_state *crtc_state=
,
> +			       const struct intel_cdclk_state *cdclk_state)
>  {
>  	const struct drm_display_mode *pipe_mode =3D
>  		&crtc_state->hw.pipe_mode;
> @@ -4239,7 +4239,7 @@ static int hsw_compute_linetime_wm(struct
> intel_atomic_state *state,
>  	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
>  	struct intel_crtc_state *crtc_state =3D
>  		intel_atomic_get_new_crtc_state(state, crtc);
> -	__maybe_unused const struct intel_cdclk_state *cdclk_state;
> +	const struct intel_cdclk_state *cdclk_state;
>=20
>  	if (DISPLAY_VER(dev_priv) >=3D 9)
>  		crtc_state->linetime =3D skl_linetime_wm(crtc_state);
> --
> 2.25.1

