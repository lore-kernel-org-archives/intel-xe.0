Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C03AEB26EA
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 16:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26D510E174;
	Tue, 10 Feb 2026 16:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jIfcDtHZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6700110E174
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 16:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770742795; x=1802278795;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/EdZZziyQZ9wW4qyS7l3TLTWmokt1/Ht3LK+j+YfA2A=;
 b=jIfcDtHZoxbh8Xwpg/RTBAeOIel2VkdHYDH/8iLtHsd1dTSCGtAxdVlW
 o36ELFXM4MO4tzEYSIws7Mu3YaR4mNfjmzpdMjq2mYsP0C7oRs+hx9oh7
 ecI6kbeaqoMy4a7Xc/tbzZoiGx7vQEuiJ55bJjxutnDrWKjcfAj1Ej11Y
 jkn3RonJhP0QfOuwtKcLjfCl+K1Yr6i5oBzoc5TKWYns/xetc/O1warxL
 sm87pzScpcROtxYKJGwF6VS0ohX3bzMyL46I6CqKzMWEhll+gSGRSiFd9
 gkwkx45+LL3D8uGjbc7D4WRcYXcSX/nL/5Ql8H5E0/MoFCTAJBCunzfUy A==;
X-CSE-ConnectionGUID: CoRIqgkoTRq2gIXDzsDYtw==
X-CSE-MsgGUID: FsSDWtRLQnmAU4iiFh32tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71921673"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71921673"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 08:59:54 -0800
X-CSE-ConnectionGUID: Sr5+UNIIQqGLtfTTubThBw==
X-CSE-MsgGUID: uC6891RcRbigPZ7y2o+q/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="212007502"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 08:59:54 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 08:59:53 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 08:59:53 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.29) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 08:59:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J1L7yjY7QgvNM62gXRyGNrcryT4LmHDcicRgksItMdbgBMAp9q4ZFE3K6QtEXm7AR3dmBI/JHTQDG3eqiH9Qx22UJz6mqK6wiETgrZk/8HQ5l0LBaZXn8mL1XDrpssvFsNviGlETG1E2uCtClipGtMxpUWIXatYJekxtwtsLZXRlNCf8al/HlCod4kojvn/iDs1BtpnZ8B8lMgrElKg1iIE+8FkwlUU67rZFxz96HpfF96woDm+3OriHeBmNqUBNjfcOMb1ujd5sG2iLQlB4FeOfsGVMWufLsXowuYIfUaikVI47JIml/naXGoQ/Jub6ywPFazOfspOJFjfEB5JAtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4k8QjAZeg07n3DMeku6dCpbOCmYuP6cRAefXwYVhO4M=;
 b=rRq637F3qlVAh+PcfEJdrX0QuX18rbulLPIMG/E3UpoLqYQrLRIURjm0LBEEpsnDum4G+k+h6NxjoFQXb+SdUH/UsrMQm5bP2yUc4aUTr/YmyEyeUVi9ByCejs3PvJotk4Yt1m8r7oyUf49l1UnYSG6bJ3QGofYh6pWqnEkFBF4wwZfV8mLx8zljdkNjK2bQybttMRigqniNspz8Q7H5mh6FzCtp4f4CxRjPwstV0OQgEVgh0iPvIYrwJ1FUWcJ0AADGoZ8JW+FmAgNI+s7lNcC6a/h5nHwCV79GsIh5HWHOVBFkb+XYCUBdrV/f5ZLpLhiD/pWed4oAU/CIYaIb3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.20; Tue, 10 Feb
 2026 16:59:46 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 16:59:46 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH v2] drm/xe: Make xe_modparam.force_vram_bar_size signed
Thread-Topic: [PATCH v2] drm/xe: Make xe_modparam.force_vram_bar_size signed
Thread-Index: AQHclHDcuxPaB9DkPUCUoNImZigE4rV8M8mg
Date: Tue, 10 Feb 2026 16:59:46 +0000
Message-ID: <DM4PR11MB54563CF9131A7D951605DDDEEA62A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260202181853.1095736-2-shuicheng.lin@intel.com>
In-Reply-To: <20260202181853.1095736-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SN7PR11MB8282:EE_
x-ms-office365-filtering-correlation-id: 69fb1f19-9789-4d56-4fef-08de68c5cb63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?8C5CKCL1l5Z1KmlW/WUzLlTZZ0lLHuXvXu4+rt3O6q0Y6KjDGHa0bRxoVdFh?=
 =?us-ascii?Q?E1iWjecJDw9JnbnCipxmY2oq2CzQsKrRN0yR4RXf3it4ejPI25BOek9l5rc6?=
 =?us-ascii?Q?hvTcfpOdDz6IEO7DNGThMjwx5wOk6YzoB4HgrnKFplVctcHovsZhrRhWdFkU?=
 =?us-ascii?Q?7pWAnP1f2NaHOuh+r1Z6dLzTbHUEy8JA5FoyCAiLy87rZnS2fk0nKLja8big?=
 =?us-ascii?Q?ngnoVIOyy48UV80NFcoPUe2F9IXgTwLUPOEE1z0YPR6JHD32phlFHqtjafPM?=
 =?us-ascii?Q?19uKvON0Hv3bc1HoOtCYVwPFI2RcXUkRgQWNAwmS1k/kklWhZ0LTyCCMZVbE?=
 =?us-ascii?Q?z9iiUWOt4seZJXgkbwuToh6YHejzjT5jiTfWpJZYYiqP5a8F94Fb/M47oc1P?=
 =?us-ascii?Q?ny7SB19/8aInR+aSGBw7yzjC77HX3BlvWrNYGXut8X5q75+LHNc+iP35g1S1?=
 =?us-ascii?Q?I8QCSG89vBYmfZ6GZBJG0EZ+/sVoUWqVpr48duZKPZQOtXT/sO0vLiXNQRiP?=
 =?us-ascii?Q?3CUgtSK6K3S0vSwLYU8Vd22K9es0HdBk11jdS3GMlTB7cpNwvsxrI9k6eFdb?=
 =?us-ascii?Q?qst8kdl/F73luYGkdtNX2k2dMNJLGs8Kj5OmuV/bD7no2Tie/LkOxCV5wqNK?=
 =?us-ascii?Q?v6G3QjIEqqKe9+1yrvtnhmiqsLH8X7I/uipLNJyHLztE5U75eWsYX+GuaLi7?=
 =?us-ascii?Q?BeDj7NT55nvQHtTRAnpunDZX18XXHzTwTU3HNp+d4BKLisbem2pm4lBl6X/t?=
 =?us-ascii?Q?ECmLH0tcxl20W2lf0syHF+qsiCrogzyfAqrdzk26lsdSRxc3sP7R6x+QwOZh?=
 =?us-ascii?Q?jbuIs6/Tu42yVdmeyQ9nLzvDEgLqb49G3DEmUyMi6aKCQX546ky93yxpj8vy?=
 =?us-ascii?Q?uh1z5fVwEu3N7iQSQ9KVTaUzdxZ5WEgrinlmOufcY4/OaF809GgeINkBu2wU?=
 =?us-ascii?Q?7IhSpN/I0lyYIQFMPFqbwH+F1JPZR6zexdf20m4sDKcgqXoce2acp/4KMvrO?=
 =?us-ascii?Q?05ez2WxmwQkIKBgiHvkQV7c0NtPOifLizyNipXUyUsf8b8OvAGcrokbcyhdJ?=
 =?us-ascii?Q?szlGfyDf9pBDwYpIj0JpH7xaf9u6LOnGq3oCYgrY9RK/7Cf/E63NK4XePLQK?=
 =?us-ascii?Q?qa3KIONfgO1f9UahUhiR/+Wnz8MD8QlP/US1yxe/de9wE5afn/CDHQY59Lq4?=
 =?us-ascii?Q?f0cBQKNlbdJ6Xhsc+CP1qQyiuTP3tZLH1QE1aQ5BylvgTuLg2tx51o/ng72r?=
 =?us-ascii?Q?m/FHy5Y3vzLSKmXQju0rX9dNvrB6tFqGDp6ymoP00KOpNMKT9cenSaKV4Q1x?=
 =?us-ascii?Q?kR8JQylup6CIBx7m5AgHL5qGwvztrgT+pRbFnUSBLczCpjqaeOrD9wnO5XGo?=
 =?us-ascii?Q?x0JXuaCo9VdJl3VMG3mZRaKm6n4WnfiFgfVNU9O2K9ijM/ZIPaIIGdxN2Mlu?=
 =?us-ascii?Q?WJGpQdjvXjX7nmCvrVzyxvdktj+yF4fRjbaOF9LISX9qCSlmYt7tXZ/S/aGK?=
 =?us-ascii?Q?XZY0DXLMaYadJYd0vfNESXj7KmwiB/e6VNVYziu3B0CFrhXtr7u/njzyN821?=
 =?us-ascii?Q?A+0RvFktfCFUZkjXFJCd9AORaOdEthnO6DH45prrCgBy7nfVxcjTi3qHp+xI?=
 =?us-ascii?Q?GpoFj9k2GXYUe7xU1nEwXQw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sUfWEqXObKazpYJIWm1jBfjUivCp7zmSdEGykRh5LL3XJMZqfdzgpGHwk9Fm?=
 =?us-ascii?Q?8nFsssYvPP4VNN4rZEeKFxvE3Ut1I97Svt4Vk/kaYVBXB54heOOeBn+062Cq?=
 =?us-ascii?Q?i3K0+WZBQdqC42HrI1pQf/hZNzG2QyJLFngPhMdk0CLG21xnKY0+PUShFijj?=
 =?us-ascii?Q?Mv6gtUjAIvWnEI2ZqnzSOo9UwQZJeWUwv5CphWjb3Tycu4ER8zENMYAxqQu7?=
 =?us-ascii?Q?gchil5p9d9x5RWlHXNIGdtq3+4rMA/eMvkfvoF66LiqtfQ7Lm+Pa7z0d/YEC?=
 =?us-ascii?Q?DDm58jdKPvlO5aHed1+HhL4m+Gaq5Z5D50hvTicyZEI/0Tx/qA19iWhPDmEc?=
 =?us-ascii?Q?TMT4pdbLZ4aB+jYRuU/fK+Ghb/prr6SNJ5PPNsZ4igkXbFOcXbePrfuUoiKe?=
 =?us-ascii?Q?Acr+6Qfat3Uqf/0BsOwbTRk0rmbtkpGEeaqTHq12EIa38P4xo6ChKDxTQ4BO?=
 =?us-ascii?Q?Bziiw9uQK37bOpHmCqOQRD0iwT8e0/op3jqESA55izAFgdvdZbf12lu9n/tl?=
 =?us-ascii?Q?Ue3dsxegm3Nj72Hb7u73O1m8lCCbNSzzZcnWbKjsIwv1t3YV3kOoljhLgvLM?=
 =?us-ascii?Q?GWBk048aD0xYS8yU/d17dsiuwyCTJ2xdO0saTG2mGix+BYJoxzPhqxrZM79z?=
 =?us-ascii?Q?eQaIq3IvQfMEmgnw7b7R2LyH4phTDQMxZ4mUx9VIHgGfB9guNe575qx42FAz?=
 =?us-ascii?Q?4JXuFs+i6QAWs5l55zYs8+cH1XYn79fC8al5sLGoBTl72W0cRnJbfFnvCsQS?=
 =?us-ascii?Q?BUyHdlbFuiDaw6c8/IuvrSkjCfKTlaO2okD0l4stlWg0RMs+py+vFZpJbvIv?=
 =?us-ascii?Q?i7PTyD+IA5wDZAxZGcngfSRzzOAh0eAAJZMucz8Yh44yW8grXJNLKuKAEQVe?=
 =?us-ascii?Q?5/q4wxzd0b1eYUruv+ASZuIto8cHSC8Ln67IQ5TBCcglk4bn0J9iAWQyHMoO?=
 =?us-ascii?Q?uKt3+g0iPtDDrpmASwlO/gDb+cvsHjvBvcITEbF1UfCwjMyvhi1XkNS8L8gi?=
 =?us-ascii?Q?Vr2Fc+wBww9iiM+th490Y1lAS7Zwa7Rwuhcc0XurcFeKttQUXISmNVU5ftpe?=
 =?us-ascii?Q?8Jj+fBlokYhDZHnk9NxZVWdjjhKJwasofak5j4pny2dFFHRsAP5M53Pg/jBq?=
 =?us-ascii?Q?fIkIDo9MzaOGDb+mG8Bis1US3PuMSYCT6NtIZCIcLEBZNI932GXzUGgdWlnf?=
 =?us-ascii?Q?/y1cjsMQN8G6jx093SiBVn6U2V3u+QD1ZSl6sAOXHdrMLZA/ZMhqNhTwMMQC?=
 =?us-ascii?Q?WbjmkCuX/WdiPKAeujLMzbA9n0HxFgagnDhDJG07A2YF7WsynZQPki0okNWA?=
 =?us-ascii?Q?r4+5RMz6UJVRQvQfa9aWztgsxv2ftGoMOZx26vkWz+uiS2e8ojQdN7V15jir?=
 =?us-ascii?Q?bxB04dNGpW1yzOjIVg2bSkn1N3KkoifS3CFMpQjDsqpJ39uoP12FIdj+OyEu?=
 =?us-ascii?Q?MCzGkWjEp6faLx5e/U9cR6RdVYlOOG0iGVOG4YdiYfGr2Walvlapekd2aFf4?=
 =?us-ascii?Q?a5IWJ/BlAZ+FtE4dOwWvDUEO95Wl3hnBdY0y+DtI09aBO16O/OKGiC0ZBZey?=
 =?us-ascii?Q?WmosXw1jPOx76gl5+/exx4SHgPwfXeXn2SOWCKN/aG5R3pg4oYBU3iav0OPV?=
 =?us-ascii?Q?HCgSaYS45Qu3m/hB1LY4IWJR8gjSdKMnF+MZv/PqIrSFgWTaR4ZGQaZxjIr4?=
 =?us-ascii?Q?2W42TQwNaj5r2L7B11Ud/Mn0sbN9ZMxb1jvnHw3hnH2RVWgMjGktinYDVFeq?=
 =?us-ascii?Q?rJQCtnUfPQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69fb1f19-9789-4d56-4fef-08de68c5cb63
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 16:59:46.2195 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SlBdLlxIzEwpYxz8E0zKlE9Q35JYmkR1h9aFmATwj6sJbD9r4vskH9CH4QIktOmkTTLWE0C1hHJ2nlREq/MC2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8282
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

Hi XE committers,
It is an already reviewed patch. Could you please help me review and merge =
this patch?
Thanks.

Best Regards
Shuicheng

On Mon, Feb 2, 2026 10:19 AM Shuicheng Lin wrote:
> vram_bar_size is registered as an int module parameter and is documented =
to
> accept negative values to disable BAR resizing.
> Store it as an int in xe_modparam as well, so negative values work as int=
ended
> and the module_param type matches.
>=20
> Fixes: 80742a1aa26e ("drm/xe: Allow to drop vram resizing")
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_module.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_module.h
> b/drivers/gpu/drm/xe/xe_module.h index 1c75f38ca393..79cb9639c0f3
> 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -12,7 +12,7 @@
>  struct xe_modparam {
>  	bool force_execlist;
>  	bool probe_display;
> -	u32 force_vram_bar_size;
> +	int force_vram_bar_size;
>  	int guc_log_level;
>  	char *guc_firmware_path;
>  	char *huc_firmware_path;
> --
> 2.50.1

