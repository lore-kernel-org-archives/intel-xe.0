Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1934FC52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 19:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FAD10E2A2;
	Mon, 12 Aug 2024 19:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ch0nXytX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1CB10E2A0
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 19:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723491965; x=1755027965;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NGIjeNSHHhqrxjrHeuFydIsAEn65atH5A4wdr7MUPHw=;
 b=Ch0nXytXs1sPTFDMbS61HGOd4L6qlU9TAVreoD3O4KUAClDqSWyY42D3
 omUXsPaqJD3vI4qki45bHnLBFGr3MSk68e8cAtupwykRQScL6jEDJCyUN
 wcoCM/K6Ug1JK18PoV3VE66A5IiB8KwyfiRy2dLqPZ8kLD/ze9W/ZHtx5
 knGu6dBOvtU7/fN8ZcypZU5wXqkKiTdZQ/S9MbfIz5NvJMlszMv1AFVIS
 bQmls9Xe+6npwtIkH085kupP4fBlk/kK8pYkJqiiYEOht8HIhru0gxPME
 uxOJ77y92w3gt8sqOMuEupkVflOOw0N4jE96u1atV9YTh/ls4rhLGHCzL w==;
X-CSE-ConnectionGUID: 0OcTGLjMR4abwMAD2tNkJw==
X-CSE-MsgGUID: LzTtFlFOS2ePGrRiKQ8myw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="25386207"
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; d="scan'208";a="25386207"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 12:45:58 -0700
X-CSE-ConnectionGUID: 2y+dsMnCR6Sz7hpoiChNug==
X-CSE-MsgGUID: BRhauvmXQ2StwADFFzvsGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; d="scan'208";a="58318754"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Aug 2024 12:45:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 12:45:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 12:45:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 12:45:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 12:45:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=re2dM8/I63OGa2840/CSp4XzpIv2ZD99dOTxkocK3sJWdg87oDUtOkt7lnlmp2BX5HWJXinL7BOPSVmVtni7Q5EKpLfukjHOzE7BGVUn5SyDtVgty6Z43Ng92gjWoONn+kTE5+TaFbLUH8EsbvxNDGgb1Q3nrtuTkt2Ckk9c+A9iKO2GvCyRZNSDbzJ0i108ZgJacdRFFELIYtsF7WvpCcF9VtBFhODhn+qge1TKoBqGyCY6GXEdvtnDhiyKyMRNZ8Tw7/0EnI0T5iU7AIwZuiJmyQMEaU7atrjkAh3AJWdxU4WiXtl+AxVfHK+lvQSBZ93VdrEPAwwETY1IyGYr4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtbYmjb/03BlJHd3cApwymJGeuYJCjJZIl00CwPYTzM=;
 b=S4AnRgbl/GSxBKHRnWgFrcjrtQclXDZfFD8VKp8HzXNtxE9oJ18oQ0/alafP33AjCM8KbW7UWgUF5h81AlcR6kjZ7414Rnyba8fPtlVPfwo0sOyEosU5zrLkDIX+N+EJgS068ypAoEeHKaUQZ1D7LpXY5aFNxQsOv3SEwfC4kvFqB8Kx3C7gu79iDN1sY4iQyZdnSmfrfpnr7v7I8T8lutVeFVbdBcFxarr1g0ss7xVvGHzXM9UakjkR27HKFnhdZfe1e2Y8nBhfZK/sXsGemoH7ZAc8YsgSZMlYbcVasKjrsikNWYEmpW4Z3Oq+Q8OxWmFmeG/1JP9pK33rOwmhfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MN2PR11MB4632.namprd11.prod.outlook.com (2603:10b6:208:24f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Mon, 12 Aug
 2024 19:45:54 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.031; Mon, 12 Aug 2024
 19:45:54 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Name and document Wa_14019789679
Thread-Topic: [PATCH] drm/xe: Name and document Wa_14019789679
Thread-Index: AQHa7OMNPDdNux2eAUyoZmu4bpV12bIkBixg
Date: Mon, 12 Aug 2024 19:45:54 +0000
Message-ID: <CH0PR11MB5444D9646288B7C709006D41E5852@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240812181042.2013508-2-matthew.d.roper@intel.com>
In-Reply-To: <20240812181042.2013508-2-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MN2PR11MB4632:EE_
x-ms-office365-filtering-correlation-id: df87a9e2-fdd4-4820-e25e-08dcbb0760da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Ixz3y3umPWYJNHfVXUW7G1yF7xDIPeQNqkHvH+JBYiZYP0tWXRAM5B4ufjFb?=
 =?us-ascii?Q?5HGhJQf1QZgbb1xu85j8QTDKgzjzy9gGW8DhUMKuvFSp30CAx3h/i4Kf6t4s?=
 =?us-ascii?Q?P1C2mmZNydF98JSge2vyaMyyo1ZkArnW42Zq0pmlI4ppbDHPO92WLG51eicw?=
 =?us-ascii?Q?X0Pe1WTaM0rIQ2fTsTujaEALMjfwfcKCsU39lB6dCpy8W8c5iVoZVok1iH9k?=
 =?us-ascii?Q?ZSsC5+QmeKRTtPEU3AeBKqa1Jd0hQ5IdQdZ61vgPgo8SBQC/vHIpA0gPIuDT?=
 =?us-ascii?Q?qmyn+IhkWUacgvdBLSSkGFqRfRGSZKptSpwUq1xrGbm3pfTffkKpiLw359MD?=
 =?us-ascii?Q?s9t3FA19ZNGxOKYoBUjvAl7N7amxea8mGlap6/6kHcY/LN6p7kJvqbYmRfKs?=
 =?us-ascii?Q?99SfeA/1s8v80EDirh2G4iM8gNaj43qKbLOnpLkVuuWza3lC6o/gJRxIC735?=
 =?us-ascii?Q?I4D13ksRUYXYbKPOiBK2GDEr/Id5om+vHOwOs5NpwSx+3nnq5hIrhs1hi2L/?=
 =?us-ascii?Q?ccDYtaR/bS9fg5WXZXNoxbij8rCBs3SdrQlcj3DRI6XBfTUaFtOWXP6XD1nJ?=
 =?us-ascii?Q?r4hebHOKhu6+vDDfOXaofKHWXLCQqGlUOmteLh11lzxTSl8pJN6JXw1xGASx?=
 =?us-ascii?Q?jjPvpNfB2wSPH1rMOXwmYHPtSco6hbMWAGqcJ1929IwFIrdwETB221m6RPPE?=
 =?us-ascii?Q?gGIi5haYxMKLvVeEUCzSu1LauAbMQ7JjJwIpZKfKUrU8RyynN0leQqWJbyBS?=
 =?us-ascii?Q?cNRqpXwSVhPx8O/94j/WjDez0CJvqF/dDQ3FD/K4OudIf2FO4n+TmyUo6SQk?=
 =?us-ascii?Q?CFvFkOGXhcaeE0ww5R6MnF0Uz4Ih7eryCv7J47TOe7VABwkM7qXGI8xgfnSx?=
 =?us-ascii?Q?NAEbPVP8kP+xhngn9BDvkgQ2De4/WhKj0YzZ9nNXJiqYY93KgioFNhzi/mAh?=
 =?us-ascii?Q?W7ifQiJF2e12btM1iENP2e1K/+bwvIiL4iYrEg5w6pIIXbxgcElXT8N77b0t?=
 =?us-ascii?Q?O1WYZ/BAkegtZkqRXPvFumnjCjHxxB0krEn6avyij+TugJ0uOC3qSk4HPtvc?=
 =?us-ascii?Q?PpdQ4uQfuHRWPEHo+irdBgf/+DH+IYmO80FFYFbzc0Ae4I6uQJ4emaensPZ5?=
 =?us-ascii?Q?vi8MotYypqmFShjvhpS1Rg8lZzbYANUqEFDzeNSItTWjDUY1wXs6JVviv2VU?=
 =?us-ascii?Q?/bqTjwwS9qdxDf07G239DgnD81m5nNr0mSNga/DPBQQ7+lMLSFBdVyI+w/3M?=
 =?us-ascii?Q?C/bydUixsbEA6CzHNxT3ahSUt/x5sX82Phc7JzM51UTS9Gcp1RU3oBzgv7JL?=
 =?us-ascii?Q?lt4zx7aiNAK5fLGi49sKjiojaUpHzS0svWzQD7C4EvYcr9amUWZLe6zwj8vZ?=
 =?us-ascii?Q?JV7NugkEX385dOn/z35iKGUHgGG7tmKEfTVpz5uY7Mxz63vsxQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NmlXEoLEe2358hgNa4J4oGKYAGt6tvEFmr8y1h3ZPtBncT13fEbAkKcW8eR7?=
 =?us-ascii?Q?Z9AaSEtYKds1aBM1/pLllGeZdnjoguFVhUWMhfUkNkGfyOG7pvu2Woqlm1/9?=
 =?us-ascii?Q?8KHKKeVudzqBpHjg9R2WZ0P24s5ysRuCrKAt2taBcp4ekgziW8zyAYeMg7Li?=
 =?us-ascii?Q?jedBneJxUHRxzkalRDnPKXumBkNlkgJNqbbLUCJEzBk1yiP3ecAiykDBOhHF?=
 =?us-ascii?Q?ebvg3iGaWXiN3ByVFbbwTzpBzIAI2djDsFE1jYfaWyq2scMOM/auPqJkwP/A?=
 =?us-ascii?Q?3HvXF9rfehTd+rnId3/mfY0rSTnUZVyrpGUU8+mZpDP3phjWdpoBnVwI/WoP?=
 =?us-ascii?Q?u89m67PC9VFvuqdKwnnAxWeVb67/c+wB1uZYiJXrx/HMDEcwk1uxflgwk3WI?=
 =?us-ascii?Q?2tDW8a5Cti8EqcQq8bBK5kTv4Pf38BgW6sDPV2Z5bVYd63w1gzdx1+WfBJGH?=
 =?us-ascii?Q?ulM6LQgNguRFE3WbkpG0dcFTLsrUae5/9i3drntxo2LnH5GzuLSap99ezT9m?=
 =?us-ascii?Q?EZh+tH8sY07QPYYkoQQt93KRjyryEyo5rcI+tTIdJ7FX0KDVQbQRTOxEN4Gg?=
 =?us-ascii?Q?UEPGga7D73acUW2Zlycgz31zRf08btrK0+c/xNxXJr3EJbZNk4YdPxQsszuY?=
 =?us-ascii?Q?tj/cODvfzGh3wbr/CTN0RJOVguPmAdw00o96iIANJl9lwQlcKq7HtnSwTzx0?=
 =?us-ascii?Q?4fXs4gbfQBrz9SB4rykH2UisBWQ+Qv6hyUmP6QMpXA8diq8/MJc1zn4JSDY9?=
 =?us-ascii?Q?OBWRf+CwlvEqSvzYyn2AojxH0ddj0oH2+R3e2ejsAQj5Xmw0oQmtUZ/imoaM?=
 =?us-ascii?Q?M7fh3vKW+s/OQEiuC03+magiaD2e9V4K3PEJ0xVsMok5QXKRZdr3OdLPr6fa?=
 =?us-ascii?Q?6HxCPKrx9hRCv9hff+8ZA53R5CJ4eAX/3ra0Ps0eQvSRrYXvbKdJ1vQ9buMU?=
 =?us-ascii?Q?OtkBh6N8B5R+lqsF6OhKFa4ph2398p+xL3nI/qz9Ja5zdUpSOz7BC5ntfo4p?=
 =?us-ascii?Q?KvDgXt3ywqxuwohlecCt9o4fEA5Mq3AkFjGxABm0e7dl8OGaNEo3bMitk+5y?=
 =?us-ascii?Q?IwGHaMXfykaVxObR5VUZghFVJ9eKPSmEclzyu2pg3mcyFRgnO1788eghqxna?=
 =?us-ascii?Q?257p9T8TVMvfbrLyWTsET8UViujQoMwNekn0tMdz4cE0jFJ4Pgade9VwqdUr?=
 =?us-ascii?Q?oDjsb494kxZAAk0vYPcbKtBuF1cuK81Lu+0wRGoKhGTUWuALIZgThLeNUpMG?=
 =?us-ascii?Q?mVrhwIz/w1MBVXY1yZy4jrDAgnKm0zSX8t0N3wOGhUPRt2+EU1iq4CeAe3JN?=
 =?us-ascii?Q?u+GSjXwDPYgZCCutTuoqpe850q3jDg+L3P9TqpEpJkHQr/XeGkrfqfbF/pI9?=
 =?us-ascii?Q?sODOjcuejVPtNB2NH1JsXwdKlx4KUNOUhQA2EpZZkcDTd0qm1yp2WxzkiWyp?=
 =?us-ascii?Q?oGHE9nrwYQb12zSsadmx5+Blgtmc9ZR03wG5QZR6ezH+DilXd31BRz3mKL6Z?=
 =?us-ascii?Q?1S71y/0CE5mvMgahr0SR9Mp39PcY6T77E4duO5ouY8nQVKmtFFTvfTPdtoQs?=
 =?us-ascii?Q?ZlvugVlk1DFstptKad8EA/lJDdB6lhl4g773p46h?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df87a9e2-fdd4-4820-e25e-08dcbb0760da
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 19:45:54.3260 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z2HTm549gbwUOdHt30SBPuKvmcvu+F/FL2bTl/Z9/scejDql/j/bDeDn6K2nV1Ll4m0r7HUi45n9fdcbcwSZkWKf0I0xZscwyZVA8SVmknM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4632
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt R=
oper
Sent: Monday, August 12, 2024 11:11 AM
To: intel-xe@lists.freedesktop.org
Cc: Roper, Matthew D <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe: Name and document Wa_14019789679
>=20
> Early in the development of Xe we identified an issue with SVG state
> handling on DG2 and MTL (and later on Xe2 as well).  In
> commit 72ac304769dd ("drm/xe: Emit SVG state on RCS during driver load
> on DG2 and MTL") and commit fb24b858a20d ("drm/xe/xe2: Update SVG state
> handling") we implemented our own workaround to prevent SVG state from
> leaking from context A to context B in cases where context B never
> issues a specific state setting.
>=20
> The hardware teams have now created official workaround Wa_14019789679
> to cover this issue.  The workaround description only requires emitting
> 3DSTATE_MESH_CONTROL, since they believe that's the only SVG instruction
> that would potentially remain unset by a context B, but still cause
> notable issues if unwanted values were inherited from context A.
> However since we already have a more extensive implementation that emits
> the entire SVG state and prevents _any_ SVG state from unintentionally
> leaking, we'll stick with our existing implementation just to be safe.
>=20
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_lrc.c        | 35 +++++++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  2 ++
>  2 files changed, 27 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 58121821f081..974a9cd8c379 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -5,6 +5,8 @@
> =20
>  #include "xe_lrc.h"
> =20
> +#include <generated/xe_wa_oob.h>
> +
>  #include <linux/ascii85.h>
> =20
>  #include "instructions/xe_mi_commands.h"
> @@ -24,6 +26,7 @@
>  #include "xe_memirq.h"
>  #include "xe_sriov.h"
>  #include "xe_vm.h"
> +#include "xe_wa.h"
> =20
>  #define LRC_VALID				BIT_ULL(0)
>  #define LRC_PRIVILEGE				BIT_ULL(8)
> @@ -1581,19 +1584,31 @@ void xe_lrc_emit_hwe_state_instructions(struct xe=
_exec_queue *q, struct xe_bb *b
>  	int state_table_size =3D 0;
> =20
>  	/*
> -	 * At the moment we only need to emit non-register state for the RCS
> -	 * engine.
> +	 * Wa_14019789679
> +	 *
> +	 * If the driver doesn't explicitly emit the SVG instructions while
> +	 * setting up the default LRC, the context switch will write 0's
> +	 * (noops) into the LRC memory rather than the expected instruction
> +	 * headers.  Application contexts start out as a copy of the default
> +	 * LRC, and if they also do not emit specific settings for some SVG
> +	 * state, then on context restore they'll unintentionally inherit
> +	 * whatever state setting the previous context had programmed into the
> +	 * hardware (i.e., the lack of a 3DSTATE_* instruction in the LRC will
> +	 * prevent the hardware from resetting that state back to any specific
> +	 * value).
> +	 *
> +	 * The official workaround only requires emitting 3DSTATE_MESH_CONTROL
> +	 * since that's a specific state setting that can easily cause GPU
> +	 * hangs if unintentionally inherited.  However to be safe we'll
> +	 * continue to emit all of the SVG state since it's best not to leak
> +	 * any of the state between contexts, even if that leakage is harmless.
>  	 */
> -	if (q->hwe->class !=3D XE_ENGINE_CLASS_RENDER)
> -		return;
> -
> -	switch (GRAPHICS_VERx100(xe)) {
> -	case 1255:
> -	case 1270 ... 2004:
> +	if (XE_WA(gt, 14019789679) && q->hwe->class =3D=3D XE_ENGINE_CLASS_REND=
ER) {
>  		state_table =3D xe_hpg_svg_state;
>  		state_table_size =3D ARRAY_SIZE(xe_hpg_svg_state);
> -		break;
> -	default:
> +	}
> +
> +	if (!state_table) {
>  		xe_gt_dbg(gt, "No non-register state to emit on graphics ver %d.%02d\n=
",
>  			  GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
>  		return;
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_w=
a_oob.rules
> index 5cf27ff27ce6..920ca5060146 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -35,3 +35,5 @@
>  		GRAPHICS_VERSION(2001)
>  22019338487_display	PLATFORM(LUNARLAKE)
>  16023588340	GRAPHICS_VERSION(2001)
> +14019789679	GRAPHICS_VERSION(1255)
> +		GRAPHICS_VERSION_RANGE(1270, 2004)
> --=20
> 2.45.2
>=20
>=20
