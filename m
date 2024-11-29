Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA56D70E1A
	for <intel-xe@archiver.kernel.org>; Fri, 29 Nov 2024 04:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D416F10E2A0;
	Fri, 29 Nov 2024 04:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R3L/MWC8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4FE910E2A0
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Nov 2024 04:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732854934; x=1764390934;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=mCEdBrRtpDUvJShiHjhTqztY5UFTDRYLOKg/jvvpc2A=;
 b=R3L/MWC8HlOrPR8HDwBk7SaMIPBgsbAXsRQQ6aLHZtFdEDmHC0/+cO+G
 MCnP9AtTL6qcb9jlbuZ9VNsjrGeyzdSWaAWpmQjA3mMim/yNPTvU17E3z
 rpJ7M5qN+Wh6eywaZBNIfkFMx3xFGJGIQhhEmlpKDvAitWrW5dQ0EEl0x
 hKLC5pVor4p8kq9pceg6rrpciUh4Cn3oXxrZUuhqDTbfcuxTPJhGIXaFj
 UXM9DCOnUNRY8yaRp8r37ZrUalo6LvnOGgIy7JoWIBRXikIEPZiENf7eH
 FWcV/B9zRDj3Nw1zqt2GcdE+6OpZWXONWJcDrGiX3a8Cah14yWmeTI0z2 A==;
X-CSE-ConnectionGUID: 8PDSwPTaSd+mvhIZ2S5YoA==
X-CSE-MsgGUID: Nq4mopjyRp2tCXhcEASZsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33334070"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="33334070"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 20:35:34 -0800
X-CSE-ConnectionGUID: 32DFRoz5QbWO22FtrY2CRA==
X-CSE-MsgGUID: 79md06nZS7Kx9JUyp2L4Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="97363491"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2024 20:35:34 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 28 Nov 2024 20:35:33 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 28 Nov 2024 20:35:33 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 28 Nov 2024 20:35:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+cU5Aiko/CTtXlXyOYj0HwXGPSdo/Isy9iQET9M0oPfERvNJH0sTFIrc3JtJ8ItU/+eCn6X0Y9j/qNsijKgDvUFoixs8+tn1Ms7OESgX3nn7I3+zE9WgFDzvoczQozXswj66GE2aU5s6UXZcb1dfRycKr2zptYhL1wVrb5pT5WFb9z2hkPwpKlAn/hpYjXi7flIJ0v/tyMt0vNoyuz2dqfTihvG6+dNxvEIcETSftHFgdZq16vMfKmAsKqp859dzILSyLV8B9Thy8Qpho4D6XtgTJil0/st5CjBy/TuKUeFLruRhW9GM9SHdByLrQc/2hKD8Li57BJyakxxc1mjKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCEdBrRtpDUvJShiHjhTqztY5UFTDRYLOKg/jvvpc2A=;
 b=Yf+Y7MIeQdOTyg93x2rGFq4nwaUtD5necjPZBBJvAI+Rt4fiGnOGI54r2ntVsJBRaVgJtolZdP0Lwek43xbnWxz1XBZVhTu3JrsQSq3NUxkp//rupjvuQsAUIyekLuKdrk0p6rdx65EvtQZu9qZa673TSILeiEdI7C0JOuXmJTSALQGB90hJcy2JMfT34xEk67aMs0nFazCAF24gHTH21bA9vua76cBNprLTHjcUj4TtvL532KEDXwmkF8ee3kU1iAI3xH2OXZJgquuxwbCEwLA9k33VCXj+0xvGEUkSJ7UEw+Xje+bD9sGkvw2VWTBSe+0H+1VJOpL7BrIW1A2QOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB8105.namprd11.prod.outlook.com (2603:10b6:510:254::22)
 by SA1PR11MB8521.namprd11.prod.outlook.com (2603:10b6:806:3ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Fri, 29 Nov
 2024 04:35:31 +0000
Received: from PH8PR11MB8105.namprd11.prod.outlook.com
 ([fe80::b751:4be6:4838:79ab]) by PH8PR11MB8105.namprd11.prod.outlook.com
 ([fe80::b751:4be6:4838:79ab%7]) with mapi id 15.20.8182.018; Fri, 29 Nov 2024
 04:35:31 +0000
From: "Kumar, Shubham" <shubham.kumar@intel.com>
To: "Chegondi, Harish" <harish.chegondi@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Ausmus,
 James" <james.ausmus@intel.com>, "Degrood, Felix J"
 <felix.j.degrood@intel.com>, "Souza, Jose" <jose.souza@intel.com>, "Cabral,
 Matias A" <matias.a.cabral@intel.com>, "Ranjan, Joshua Santhosh"
 <joshua.santosh.ranjan@intel.com>
Subject: Recall: [PATCH v4 2/5] drm/xe/eustall: Introduce API for EU stall
 sampling
Thread-Topic: [PATCH v4 2/5] drm/xe/eustall: Introduce API for EU stall
 sampling
Thread-Index: AQHbQhgfofRnvGCpXU+5ZSUqXc3pdQ==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Fri, 29 Nov 2024 04:35:31 +0000
Message-ID: <PH8PR11MB8105624340FFBC7AE8E6DCB0E92A2@PH8PR11MB8105.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB8105:EE_|SA1PR11MB8521:EE_
x-ms-office365-filtering-correlation-id: 44d2aed0-b622-4574-4ae1-08dd102f421c
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?NapamX3suywgwkBXzkfp3vs0EAlcq5g4QUOpauOXU/CkJ98JZfQe+68TzJ7l?=
 =?us-ascii?Q?SNRBFij6/nURR0NJinKLwDCNNQSi+B8reAPSeFYU3SFjZEUvQ/4iAj5I70LK?=
 =?us-ascii?Q?YoYyJMQmGf9epmlShti0p502Ws7GfYC09vVetItJ7T74WMgth2mSjYqb4ETW?=
 =?us-ascii?Q?8rDv0LZNKHaA8DX9tDzrC6TCsBXzIAFOFjjHfubkT61gneZBo+BBrTpzUJNS?=
 =?us-ascii?Q?9GfPNpg+W6T6X+LrkDJR8K14jNQHSAxvGytADNOZU2cRGBI6MnHDhDyYo0nm?=
 =?us-ascii?Q?i0ejQ1yk2Y4vnN+q9j1JCEO0xYtcZ1JCxMKAz5NLAXSdpxSskBtfM9fQOuKx?=
 =?us-ascii?Q?aP9FdPrY+4FO7qRtOr+0aD72Jh4wfTNKC5Rnr9dslfEnOUbk485Nt8sT3mo4?=
 =?us-ascii?Q?83FJUFmx87wZ3LnQCM7fLDj3Hod8Jj9EloU7USxZmxX5iJbuiXIytJB+YZ9h?=
 =?us-ascii?Q?Thq3A792zGt9okFefr644N5Wqjm5thgCUZvigvwK55z1ZTdcQvQZ88QZG/bH?=
 =?us-ascii?Q?BrZDULtVQ7shdgjuPb2Fsg8feJWg0LeRCpoIqEDLABdc/tGuE4GlX8CWH1TK?=
 =?us-ascii?Q?M7Lt678bfdiXXjG2EIAxjkaLyvZ6tsKpNPdudp40r6rwTLayZamph392RFoR?=
 =?us-ascii?Q?9gfFfWw404J168bgEc+JO+uhngkNmRXBOYNq2WjwmfLU8zR97DofK/+06eBl?=
 =?us-ascii?Q?223PaWY2IEeK9QpwLoQae6xOUG6fco6KkykugTnURFKaa1bmipNr5F9+rvsT?=
 =?us-ascii?Q?YXxOBNpSzpV+UfDJyO+QfBP/Qs5H0MfNkfnhzDI3mmaUhdLCyVYpBnc3hqRN?=
 =?us-ascii?Q?nE1rIdrprsbnbrzy1++xBm4Vn5zsMflEkIhmmjUccBKGd3fx37uYGyYOPQk/?=
 =?us-ascii?Q?ghyS/XjAErakpjQKGVN8+ow8Ylsrc/AtLk//0X4qsDunOpEyHZRN1qiFSJNM?=
 =?us-ascii?Q?INJEuH/1Q6LUtCnsQWwrBv/IdFK/Xc071tNsUj9UjBrD4yOS7i3W4l/cpsmm?=
 =?us-ascii?Q?Vxp0Qz4M+O+3saH71/tbLoDDgRnJNOsesDfiMYylG+eaTcveo729wsXLDbkw?=
 =?us-ascii?Q?Nz5xeQHAH2vl18taFZbLUIoVuRcu+van1hV15sPhea/cvSsB55sgZKy0t/rY?=
 =?us-ascii?Q?JvMAeTNyNg3aOcxLOtLJ5lwHS8ka7zw0VIgG+5UKtaj1Pp3w3ZgAAxHJ5e18?=
 =?us-ascii?Q?uyIZwd2L31gsom4Jj9OFulxyQFqifhozTLoK8q5D3bIW6jJTeiq/aPjLNNxU?=
 =?us-ascii?Q?uI5WiExRKt2ITmWHAjLXGapOmUsW4Al9gaQ29itvbeKMjcIB8CLkhWLlBkTC?=
 =?us-ascii?Q?h+3AswO4608Nn+jQlG+UZSLV+xmgCjmvSzAQLOzfPOPGCOhfBBPE4D5TAL1U?=
 =?us-ascii?Q?aMFFuUFvQyP2R593nR32nCZUH0qBwRb+grmJJXXAzLzIB5fFUA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8105.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+DlXKSRRUoJ1qt1LSlzijzQcPXf2P+aI+Q9Tyn5NpomLg9ZlqD39liKzF2iD?=
 =?us-ascii?Q?iC11DNVZWRcW25VqYeRlJjDAS4bqpYZuJcq8s0cTV7ZQfPPd5OA8djh7ZPwg?=
 =?us-ascii?Q?72jPs77280DIFaX8YRSgl5dHFyMm0LXvJLgOuk/Od5tFYytkM9FFL2IocV01?=
 =?us-ascii?Q?2kTxObF0x4GBUNa1RBW98O5PVh6K2PxCiiUgDSAi7rlTdAZs9SqCYMMXKc9o?=
 =?us-ascii?Q?EMAEYoZ7OfQYVFe+t9jqAYYIFtK8vbPMK8NIiyeiV/njSRoTHheI4gAmyReL?=
 =?us-ascii?Q?Ftp9gsmBLWlMVQKs4OVelcCd69HaVKmtSp0Q09kpLPoGNknnwWM95MkyboQF?=
 =?us-ascii?Q?2Ysm4/5dGfFJRssQivVEokVHdYqcJKRgwrZb/zlm38DCT2xSaf5OcnwxqhV8?=
 =?us-ascii?Q?XZo+x6FoFPEy9NBCAupPJ/7m+/QrneoWYv41UoOm4dH30Gw+1XkfwLxMaFyj?=
 =?us-ascii?Q?TdClXexPrGp/Q2X8w+raqE9b0K6zBOYWJGMCdE1xceUufzGNPH+p0v/t4asi?=
 =?us-ascii?Q?RAfVgeOi2m5LQ/hjdk1yMhCtU9c0ys3XdlnJqdqVKUfnKuX94jx4V3Wpgv/x?=
 =?us-ascii?Q?3x6zZjdnAQ7RehSPpmTKPEJaDwjyOvhzXWeuC1oWoSW9ImQ9h3yVgHIXHu8K?=
 =?us-ascii?Q?yioFnWcIwKB8wKNEf5KjIG0zt1FJ5gGUACrPQGA7S9iWFlP3DAWWUuTWwGJQ?=
 =?us-ascii?Q?Pap+iaxD4KojwsD8kTrzN3Da9h4n8BUlHErzOf72EN2k2gU2kMVuk8VUYVrS?=
 =?us-ascii?Q?iN1B3mzlhhhHAquJPhV3yIyJXQ5Yu/SSc90qaEaYvssfcAVp99RN5SVhv3Oe?=
 =?us-ascii?Q?Gs3Bagsbivad3HxIjR3z2uNrmu7r9/vOBrvmJ0oDy1ZEMZl1hHiwP/Qtu54E?=
 =?us-ascii?Q?xNuC9Ood++HMn9jIJ6gJSuzSb7JVDW7AvGxvpZEmQ7Cn+LVrwLInQKCUveWq?=
 =?us-ascii?Q?9LVwDPHbEI66PlBtNvtMsJMWYpykiumt+vNjruAV2N17yvSRiLXZBU1KtF35?=
 =?us-ascii?Q?jElFjxyUZ+vOAroKviO8LzbaIbxZte49MUx74VKfHAUVCHYv9DMInz2906RS?=
 =?us-ascii?Q?HuPvtxxCSBOoK47cP5Y8sNvI6rbsMdHzc5/zAhlwIjOsrsrn8lxNBGe7W181?=
 =?us-ascii?Q?POe3X4RgGam3i2njEX9mKjTcEg0dMirZXO5YnPbLd6o21b7FL9+//3sKvONs?=
 =?us-ascii?Q?mv5PdK6/iRZ/T8bo+sX1oWzMcLlMCfTdZZuACdz+B9PjKLI3uGjsNILdp0mx?=
 =?us-ascii?Q?w1Qns/kchpY6of1mlIurJG3KjcF9dDWUCKUZE+Ulls+idHDFVUlgTW7Ksj+g?=
 =?us-ascii?Q?BnQky4IxTLs1HIb6FVikVCH8OVVOxZGOWbAXGUCvWBpoUbW6rZCtQu3lIhAa?=
 =?us-ascii?Q?ruO5F4p3nxtLNy1fpd5lStr7VzsP9fJlHtJ3Wk39hqVwtsyjILf/L/YJjcBV?=
 =?us-ascii?Q?0WEbboA4i1WKH/XaHAeSerFpsg986YWk627ger4QYHogK4JMYPPQtBCypLVQ?=
 =?us-ascii?Q?ajdhp2tlZD0wHI9ErDzqJTy+bLRmvDKjAA7TmNbBB/hm3PAorobZRxp4v2V7?=
 =?us-ascii?Q?BDSHPR6gyEsG2+VTfBUkq+ZZ/JqgzwGx5m2bIXvr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8105.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44d2aed0-b622-4574-4ae1-08dd102f421c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2024 04:35:31.5060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J2UAsfqT4CeeP1IcuEaNP9pRsNDsWKrFhKNlKF37i1BMpH2lJQfp6pgaQO7elj1GY6DvF5Zpv1g3X2kePYuQNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8521
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

Kumar, Shubham would like to recall the message, "[PATCH v4 2/5] drm/xe/eus=
tall: Introduce API for EU stall sampling".=
