Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC38606A32E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 21:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U01P4hOi;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=HqIdZUoq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E09110ECAC;
	Fri, 13 Nov 2026 21:03:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B661127EF
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 21:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794603804; x=1826139804;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GKfX6OJhE3rJIYGmuHtPG5yGqpbNQCsCUuloSpvkse0=;
 b=U01P4hOiThsrzCKwMDIc+eMPW1Pjulmtj0iwZuFlos94whwh76/XzSyj
 2y08zF8K7avMfLregol/UUhv1gd3943rjYZSPHcgwKZBu7eucQQcoD5YI
 Ufv/G4U+Gfz4B2CBGui18uYzIuxfapxpB7ei1qEwe7CfDdKKNi8xGNQdE
 PPSR5iR4tjpiyWLK5l+T2HX0cRGRwntJws0TMG9Sb3ueMVxwhGGgy016K
 5lvEpg/Bb5m5Of8wyhJiQtLTlgiFiLDI2oiFWQ/mdt5VBvsdbPFej2Aze
 r2bI+CWbeEJztztJPh+OMLLI1Q/GbxJLp3YBI3qtRUJPS0wMRbTj+XYQo w==;
X-CSE-ConnectionGUID: 5ab4RZe1RiimPXgaj0HuYw==
X-CSE-MsgGUID: vVMADC21TdCZ1hV2BowUbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3312953"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3312953"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 13:03:23 -0800
X-CSE-ConnectionGUID: 5i72D7w5TM6E8pyIBRFpCQ==
X-CSE-MsgGUID: j9ZwLRPmQ6qOPTUUMttetg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9099412"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 13:03:23 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 13:03:22 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 13 Nov 2026 13:03:22 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 13:03:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPACzEA5uzjkGa7i3l2y0fE8vSYK5jDAmrrS2jhoAdBrUDYVCMGYVQJ1dxWl7mUeT6Mp9B4Cgrcar9eEbuzH8gw9jTe/3ksPw0Mmyn7ly2V0FSmyJv1HBMOse8iioVLsl2EiPKdFUi2Jh0nXkbTMv2FQVUWogjgRkCaBRNvWawtX1v9sV5K2FCMyCgHSjsodvhWJDStK45M/mU9kAUk8Inkehxxin/LJKT8c/hdFTDS/oDBaBDAB3s5lq/2veKzYsi8o63umg5y8ez3J6+AyFetnjnsHpsEeRuRtzVExAIQ+b7lliFcOM0PW2slxxitdJTXQW4n6bu5z1ufmhFrM5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUhtnliFnohSa98zXSQEKAy6LRYBedxuQq+LaVRCqn8=;
 b=W48TchjGdIZP+6PwfnqGVStmbMwtPNbGmNiWmTuHDEs/JGNcKOzh5kK/+SzaHWbYoK0gpbKpQgSN6pydGlnuaxgHhu470M0pObsxg0oOjXaJL/uorVo+HhoQUeFpIYlmWW8bqbqAnsoHRI2X9xt2wfFlqINRJb2eovfTFMSCFH+qL3h3N0jQYIdQm0ie/FBwOfv/rkGvemSIQs60nty8hrhSZ3Gk9KsOGW4lLqjQCZBcTiOUTUce6/19vahf9Fk+X3CEh0OMXqtCrJEfRdBplvfJyiKJ5Kr/RlNvSYRVK5W8qTyrrx0vMMIHvZd5GUAS5ADPWcWhahLmY9FThNuKrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUhtnliFnohSa98zXSQEKAy6LRYBedxuQq+LaVRCqn8=;
 b=HqIdZUoqB3cwjpm5VdgcVoaEx/Dr/OpqOvv44Fwh1OHxrlkTA1aJ/cSsbbi/Zw3mBtqniuA621V9oRjJ8XP/kKRbe8IMKSTImE8auvNZJ/kL3Re6wH6xtFkLmEO1VnU68r83nyPtn/4TzjDvKkHQ+kTBkfYcAftuGR+i2U463vI=
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by DM4PR11MB5325.namprd11.prod.outlook.com
 (2603:10b6:5:390::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Fri, 13 Nov
 2026 21:03:19 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 21:03:19 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>, "Vijay, Anoop C"
 <anoop.c.vijay@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Ausmus, James"
 <james.ausmus@intel.com>
Subject: RE: [PATCH v15 13/17] drm/xe/vsec: Support late bind fw information
Thread-Topic: [PATCH v15 13/17] drm/xe/vsec: Support late bind fw information
Thread-Index: AQHdc49llU3rf6DjkEmKTNeKSglPIbcsfXsw
Date: Fri, 13 Nov 2026 21:03:19 +0000
Message-ID: <CH3PR11MB046149A37446629CA526C99290C17F2@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20261113165127.1989471-19-michael.j.ruhl@intel.com>
 <20261113165127.1989471-32-michael.j.ruhl@intel.com>
In-Reply-To: <20261113165127.1989471-32-michael.j.ruhl@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|DM4PR11MB5325:EE_
x-ms-office365-filtering-correlation-id: ef74fc65-85d9-45e0-9ade-08df41c98bad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|921020|38070700021|261102123227099003|11063799006|4143699003|261021121427099003|261009223027099003|261022075727099003|10067099003|261022105027099003|261021123027099003|261026121527099003|261022113327099003|56012099006|261026140227099003|261028144727099003|22082099003|18002099003;
x-microsoft-antispam-message-info: pYHXA1VJpEk8Qcpnapc8W3DjmWUfm0Xkkor+66QDKrfh88hMrECryS0gJGI4WxmyA5zr/MgaSNXsqyo0Wfvk9lceHz46dBRaW3hJwrOIWxSKY2tbRmDphKvv4w0p3Yn0iWOF/hOtpurAngqJONN2NPXnfw6D0UxORvUaO8rlKqj3rqZUefEHNuC1Vk2Fkyscy8lu+faVSmXdIPGXeUmj/FgEfxsATrPdY29ZlKxfIQEURefaQ7pbK5Qn5rOAPEW02fVK91d1trStki0NG5PDodgMoOlA9f+56R+07IqkYlnwLBOO0ZEohJG3F4RYJkQzvJxoT1/v1+68ijEfphZE2NFRmOYhuWSLw4XgtbiHs1zAgtGnwWFpzInwV2Gkv1N8dhBWUEYIaKbPwKumEwDpGeDaO3SaNE9jg2di1Lyb/20ZBIFrBUAoTTt1zNqi9mq33vtAcEuDOdhTACOo0PsgKHvt3OVIrzZ+1tOr5/mZvb3VxtsWgkWY7VvRARhjagcGP9ZruQwqF8cHz9huduRghxnWcCp4OXbInpPxBc4wddRiLm+ysABz1QW7x6jft865JnVD5VSC5y0bH8wCShdeUrniTJ2v8EJ1jZ9FnPSGNlkzUclBbKgkgFfy8EfMMW9aY6bbUOH/23jFisbiRibbBEcAa2aQCP47uT1ZFNCIXQu5Ay5yQQmmYrwo+ivZzbQKvq12AHdoKW7Fw8eXgSRH6XF3oiuJaYqhjE2LYstixmN5pXBBUHKouZ4hTyN1UxYL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB046149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(921020)(38070700021)(261102123227099003)(11063799006)(4143699003)(261021121427099003)(261009223027099003)(261022075727099003)(10067099003)(261022105027099003)(261021123027099003)(261026121527099003)(261022113327099003)(56012099006)(261026140227099003)(261028144727099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kj2e67vOuoZxgZl2He6HHgTjV9xqCRGpz78wr6AYj5TFV+iEsbUaAfx7cANb?=
 =?us-ascii?Q?nZtMwSRBOnAxs+8WM7vz0Hfp9wBP8Fo/79MkA+HNG7FTOmCRKXVUj+y+kL6e?=
 =?us-ascii?Q?kbEikeJeqxPTfrH7DOzql278zZ9AhKUXZ5eqEDcZz9p/XwVn8bxKKmD791cK?=
 =?us-ascii?Q?zKVmHdWNxcBiYawC9uUal7LjXuSbctrucsxdq3n7Nsr05u8XiXhVz3pWzO+0?=
 =?us-ascii?Q?/qK5mCUMco/ePuI1ui1bMOZbZ31gTY+CsJI0oAz3kvNUPc3WA7b11NRenzkv?=
 =?us-ascii?Q?9nMUuN+G4DpxKt67+s+b4EQ16DHpIjSBMjOfXPVhwV7ZokUJ//PmnlNpicPY?=
 =?us-ascii?Q?AY6dLfBAb8+OKj5NQeEXOp/mradWDxkxpx8C0ng1/IRdFikKWYZm5rwV6WQU?=
 =?us-ascii?Q?dHVoMekbYvubJmDuPx0d5vubjU+pYvs2TeWNNpMOqTz01SJ0WNlxWR+Hnyez?=
 =?us-ascii?Q?lXxl9XQpUN/O0TbEXtEiQZtqS2ZNSN0xhoHzBGSVh33YjxXzzaDVrLU37GXJ?=
 =?us-ascii?Q?67LpyAYGkm7RlTVOmMoizGn6f03WCic7PA94s11K47DZ38s2HstMvt5bi6uc?=
 =?us-ascii?Q?XLgoV70BRakEKCLuw9zAQvgv3NsddColqW4lgfQdKiEIW3FWhNoTRvV1Om6A?=
 =?us-ascii?Q?UJEYKZ/kO1Na3JaFiHIJ05tmkhC8HCH2KRX/6sC379H73ITs2dYZZUHAEP7l?=
 =?us-ascii?Q?Snx1otIWqFL53EjEOFMYVEjsBISboCG22v+von2XhUAvTZuZgW4B1jfi0Lhs?=
 =?us-ascii?Q?GGSh996sjDhpTiOV09UJ6vhgSYlhe5DTuK57w/pojLJ5i/YzqumPBDYpPV99?=
 =?us-ascii?Q?5ZoVmbWjIRGVln2E6deF2uRog/4JXPL9hGKCzyfLnyJNWRqaItV4KCvyG6VS?=
 =?us-ascii?Q?rL7XClcWsJyfORYT0vVgbMlVR3T7CZwgY3VfBFwEgbSRyQHFTGPZEkmPmuUC?=
 =?us-ascii?Q?rCLaWp67KIeIUFIW+O3xNrLCjGfMB01qTSEcEBJs/PIBcIYSXYXVRYs4zZXX?=
 =?us-ascii?Q?kQbMH4t/RVufQsI063EflQOCvhTPgHqAOEkdOYk4OkaEM0xb8FFmdYn1PpV7?=
 =?us-ascii?Q?tfb179z0t0fiQPjGBlBhYAYq0jayp3rWkuK8nUIDVArxgrJ+aQH1sanGdiAO?=
 =?us-ascii?Q?AS+kbYniR0J9v9FVDD4EMV5VnMVfy0JG+jNsCdrlv9t0BB9n61aA4WNsuyU8?=
 =?us-ascii?Q?FF1rSHdFJjFWelJh5J09DG4iH91iGQS+b7e4XVILY+j1VWhhExjDQ0ZU+whN?=
 =?us-ascii?Q?0+euHSBRgCxDHQy3KVDNkGbUCxROkbM700meGT2co57d+l3SP30yFuCAwPt1?=
 =?us-ascii?Q?wQNx1vjJeBBEBxkl7mZEevnzMxZlZiY+KhHAUAjPvAH9eoVpHQ5WeF8fLVkn?=
 =?us-ascii?Q?5W8oLl0/nLPzDBgo/rKzjbjJE/Ll6xqwiVlU/gHdjhVoKK1PZRq1EdZuPZXl?=
 =?us-ascii?Q?nzuX8gVgdtJjzeGVcO4culZC5X1xVOK6GgNx9HaHx+0PdlaUodrhYG6wvfm2?=
 =?us-ascii?Q?XCxB2XunxHQvGKC8xzMxnXbI94a3W2za/VeDttlsKY7CtovGrnRlSw4KwS38?=
 =?us-ascii?Q?ra8AS8z5nmB8k62TNT7eTdDZdmn0Cz25KCQ+CrQkuoAwWfSHzAfIkd20kL2E?=
 =?us-ascii?Q?de/9n7R45ZR2vb+7sUgnCs0Zqv8V0y4UcBW2vAZVekQEFde+DOQ/7x7omCuB?=
 =?us-ascii?Q?sw+yIGojuTWCAvSCuMS25WjgL7nPxgqQd4kRqvmOmkzl38Bi0+8YmK8hBBKS?=
 =?us-ascii?Q?J1AxJNvmug=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ALBzQc/hbXIuCBXcnFgEpBZZe7dcp0BHPYjRqRQAjWvhHQdXbkedMk5GnqNZQXW1lF4yYehj85OAbg3YSYj8NKUBEJSViN7AcnRDEiN1LyRN1DBIPNQX8R/A6+2VeMHemOmHhUK2as5quLAKk0RLsCsbVvhc4sf7C0WaJKbELS5VgdD3dtRmyx+6laUfHstjMK8vQVxkWZZB+C3azIJO3gwwftLlpGPWTIJhMr2z0BnaL6sESbLl6L9XtaBNG+zalXasB806lUnVBARHLFHJ4Q3ehkYkJuV+MXpSMkqs/e8p2krL3umXHz4GyRsilZqCVY4FmwNya/IFGqQJ8f3sgg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef74fc65-85d9-45e0-9ade-08df41c98bad
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2026 21:03:19.6747 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EkTjLOVRHslbHBGHIONkzCc12TOYT3Dd+2uw1q0VmEnWMQ2CbzVTM5CRjVpOlvlbUzhmyRwgTItonlevBS234Zuh4eybe6EX7VTidIxxVks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5325
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



>-----Original Message-----
>From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Micha=
el
>J. Ruhl
>Sent: Friday, November 13, 2026 11:52 AM
>To: intel-xe@lists.freedesktop.org; Brost, Matthew
><matthew.brost@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>thomas.hellstrom@linux.intel.com; airlied@gmail.com; simona@ffwll.ch;
>david.e.box@linux.intel.com; Vijay, Anoop C <anoop.c.vijay@intel.com>;
>Nilawar, Badal <badal.nilawar@intel.com>; Roper, Matthew D
><matthew.d.roper@intel.com>; Ausmus, James <james.ausmus@intel.com>
>Subject: [PATCH v15 13/17] drm/xe/vsec: Support late bind fw information
>
>CRI FW is loaded on power on.  Because of this, access to the FW cannot
>be done until it is running.
>
>Update the XE PMT probe and access to check for late bind devices,
>verify, and wait for the appropriate FW state before probe or access.
>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c       |   3 +
> drivers/gpu/drm/xe/xe_device_types.h |   5 ++
> drivers/gpu/drm/xe/xe_vsec.c         | 126 ++++++++++++++++++++++++++-
> drivers/gpu/drm/xe/xe_vsec.h         |   1 +
> 4 files changed, 134 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device=
.c
>index c3cd98244d4c..76e401ae5878 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -1111,6 +1111,7 @@ int xe_device_probe(struct xe_device *xe)
> 	return 0;
>
> err_unregister_display:
>+	xe_vsec_remove(xe);
> 	xe_display_unregister(xe);
> 	drm_dev_unregister(&xe->drm);
>
>@@ -1119,6 +1120,8 @@ int xe_device_probe(struct xe_device *xe)
>
> void xe_device_remove(struct xe_device *xe)
> {
>+	xe_vsec_remove(xe);
>+
> 	xe_display_unregister(xe);
>
> 	drm_dev_unplug(&xe->drm);
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>b/drivers/gpu/drm/xe/xe_device_types.h
>index 28b1669a14d8..d1bdd3a872a8 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -7,6 +7,7 @@
> #define _XE_DEVICE_TYPES_H_
>
> #include <linux/pci.h>
>+#include <linux/workqueue.h>
>
> #include <drm/drm_device.h>
> #include <drm/drm_file.h>
>@@ -487,6 +488,10 @@ struct xe_device {
> 		struct mutex lock;
> 		/** @pmt.base_offset: device specific base offset */
> 		u64 base_offset;
>+		/** @pmt.work: support late-bind probe */
>+		struct delayed_work work;
>+		/** @pmt.retry_count: late-bind probe retry */
>+		u32 retry_count;
> 	} pmt;
>
> 	/** @soc_remapper: SoC remapper object */
>diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
>index 4ca41a5ef502..f634bac331d9 100644
>--- a/drivers/gpu/drm/xe/xe_vsec.c
>+++ b/drivers/gpu/drm/xe/xe_vsec.c
>@@ -3,6 +3,7 @@
> #include <linux/bitfield.h>
> #include <linux/bits.h>
> #include <linux/cleanup.h>
>+#include <linux/delay.h>
> #include <linux/errno.h>
> #include <linux/intel_vsec.h>
> #include <linux/module.h>
>@@ -18,6 +19,7 @@
> #include "xe_mmio.h"
> #include "xe_platform_types.h"
> #include "xe_pm.h"
>+#include "xe_sysctrl.h"
> #include "xe_vsec.h"
>
> #include "regs/xe_pmt.h"
>@@ -173,6 +175,14 @@ enum capability {
> 	WATCHER,
> };
>
>+/*
>+ * Late bind will delay 100msec for up to 20 seconds
>+ */
>+#define VSEC_LATE_BIND_DELAY_MSEC	100
>+#define VSEC_LATE_BIND_RETRY		200
>+
>+static void cri_late_bind_probe(struct xe_device *xe);
>+
> static int bmg_guid_decode(u32 guid, int *index, u32 *offset)
> {
> 	u32 record_id =3D FIELD_GET(GUID_RECORD_ID, guid);
>@@ -281,6 +291,53 @@ static int xe_guid_decode(u32 guid, int *index, u32
>*offset)
> 	return -ENODEV;
> }
>
>+static void cri_late_bind_probe_work(struct work_struct *work)
>+{
>+	struct xe_device *xe =3D container_of(work, struct xe_device,
>pmt.work.work);
>+
>+	if (xe_sysctrl_is_oobmsm_fw_ready(xe)) {
>+		cri_late_bind_probe(xe);
>+		xe_pm_runtime_put(xe);
>+		return;
>+	}
>+
>+	xe->pmt.retry_count++;
>+
>+	/* wait up to 20 seconds */
>+	if (xe->pmt.retry_count =3D=3D VSEC_LATE_BIND_RETRY) {
>+		drm_warn(&xe->drm, "PMT probe: Late Binding failed to
>complete\n");
>+		xe_pm_runtime_put(xe);
>+		return;
>+	}
>+
>+	if (!queue_delayed_work(system_freezable_wq, &xe->pmt.work,
>+
>	msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC)))
>+		xe_pm_runtime_put(xe);
>+}
>+
>+static bool wait_for_fw(struct xe_device *xe)
>+{
>+	int retries =3D VSEC_LATE_BIND_RETRY;  /* wait up to 20 secs */
>+
>+	if (xe->info.platform !=3D XE_CRESCENTISLAND)
>+		return true;
>+
>+	while (retries--) {
>+		if (xe_sysctrl_is_oobmsm_fw_ready(xe))
>+			return true;
>+
>+		msleep(VSEC_LATE_BIND_DELAY_MSEC);
>+		if (signal_pending(current)) {
>+			drm_warn(&xe->drm, "Late Binding interrupted\n");
>+			return false;
>+		}
>+	}
>+
>+	drm_warn(&xe->drm, "Late Binding failed to complete\n");
>+
>+	return false;
>+}
>+
> /**
>  * xe_pmt_telem_read - Given a device and a PMT GUID, read data into a bu=
ffer
>  * @dev: valid Xe device
>@@ -343,6 +400,11 @@ int xe_pmt_telem_read(struct device *dev, u32 guid,
>u64 *data, loff_t user_offse
> 		goto dev_exit;
> 	}
>
>+	if (!wait_for_fw(xe)) {
>+		ret =3D -ENODATA;
>+		goto runtime_exit;
>+	}
>+
> 	scoped_guard(mutex, &xe->pmt.lock) {
> 		u32 device_id =3D FIELD_GET(GUID_DEVICE_ID, guid);
>
>@@ -355,6 +417,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid,
>u64 *data, loff_t user_offse
> 			xe->soc_remapper.set_telem_region(xe,
>CRI_IDX_TELEM_DISCOVERY);
> 	}
>
>+runtime_exit:
> 	xe_pm_runtime_put(xe);
>
> dev_exit:
>@@ -400,6 +463,10 @@ static int xe_pmt_read_reg(struct device *dev, u32
>guid, u32 *reg, u32 offset)
> 	disc_addr +=3D inst + offset;
>
> 	xe_pm_runtime_get(xe);
>+	if (!wait_for_fw(xe)) {
>+		ret =3D -ENODATA;
>+		goto runtime_exit;
>+	}
>
> 	scoped_guard(mutex, &xe->pmt.lock) {
> 		xe->soc_remapper.set_telem_region(xe,
>CRI_IDX_TELEM_DISCOVERY);
>@@ -407,6 +474,7 @@ static int xe_pmt_read_reg(struct device *dev, u32
>guid, u32 *reg, u32 offset)
> 		*reg =3D readl(disc_addr);
> 	}
>
>+runtime_exit:
> 	xe_pm_runtime_put(xe);
>
> 	drm_dev_exit(idx);
>@@ -434,6 +502,10 @@ static int xe_pmt_write_reg(struct device *dev, u32
>guid, u32 reg, u32 offset)
> 	disc_addr +=3D inst + offset;
>
> 	xe_pm_runtime_get(xe);
>+	if (!wait_for_fw(xe)) {
>+		ret =3D -ENODATA;
>+		goto runtime_exit;
>+	}
>
> 	scoped_guard(mutex, &xe->pmt.lock) {
> 		xe->soc_remapper.set_telem_region(xe,
>CRI_IDX_TELEM_DISCOVERY);
>@@ -441,6 +513,7 @@ static int xe_pmt_write_reg(struct device *dev, u32
>guid, u32 reg, u32 offset)
> 		writel(reg, disc_addr);
> 	}
>
>+runtime_exit:
> 	xe_pm_runtime_put(xe);
>
> 	drm_dev_exit(idx);
>@@ -476,6 +549,28 @@ static enum xe_vsec get_platform_info(struct
>xe_device *xe)
> 	return vsec_platforms[xe->info.platform];
> }
>
>+static void cri_late_bind_probe(struct xe_device *xe)
>+{
>+	struct intel_vsec_platform_info *info;
>+	struct device *dev =3D xe->drm.dev;
>+	enum xe_vsec platform;
>+
>+	platform =3D get_platform_info(xe);
>+	if (platform !=3D XE_VSEC_CRI)
>+		return;
>+
>+	info =3D &xe_vsec_info[platform];
>+	if (!info->headers)
>+		return;
>+
>+	guard(mutex)(&xe->pmt.lock);
>+
>+	info->priv_data =3D &xe_cri_pmt_cb;
>+	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
>+
>+	intel_vsec_register(dev, info);
>+}
>+
> /**
>  * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
>  * interface
>@@ -503,12 +598,24 @@ void xe_vsec_init(struct xe_device *xe)
>
> 	case XE_VSEC_CRI:
> 		xe->pmt.base_offset =3D CRI_PMT_OFFSET;
>+
>+		xe->pmt.retry_count =3D 0;
>+		INIT_DELAYED_WORK(&xe->pmt.work,
>cri_late_bind_probe_work);
>+
>+		xe_pm_runtime_get_noresume(xe);
>+		if (!xe_sysctrl_is_oobmsm_fw_ready(xe)) {
>+			queue_delayed_work(system_freezable_wq, &xe-
>>pmt.work,
>+
>msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC));
>+			return;
>+		}
>+
> 		info->priv_data =3D &xe_cri_pmt_cb;
> 		xe->soc_remapper.set_telem_region(xe,
>CRI_IDX_TELEM_DISCOVERY);
> 		break;
>
> 	default:
>-		break;
>+		drm_err(&xe->drm, "Unsupported platform: %u\n", platform);
>+		return;
> 	}
>
> 	/*
>@@ -516,5 +623,22 @@ void xe_vsec_init(struct xe_device *xe)
> 	 * resources.
> 	 */
> 	intel_vsec_register(dev, info);
>+
>+	if (platform =3D=3D XE_VSEC_CRI)
>+		xe_pm_runtime_put(xe);
>+}
>+
>+/**
>+ * xe_vsec_remove - cleanup any outstanding resources
>+ * @xe: valid xe instance
>+ */
>+void xe_vsec_remove(struct xe_device *xe)
>+{
>+	/*
>+	 * If the queued work is canceled, the runtime reference needs to be
>+	 * released here.
>+	 */
>+	if (disable_delayed_work_sync(&xe->pmt.work))
>+		xe_pm_runtime_put(xe);

This is not initialized for BMG devices, and should not be cleared for that=
 device...

I will post a fix.

M

> }
> MODULE_IMPORT_NS("INTEL_VSEC");
>diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
>index a25b4e6e681b..e925dba4158b 100644
>--- a/drivers/gpu/drm/xe/xe_vsec.h
>+++ b/drivers/gpu/drm/xe/xe_vsec.h
>@@ -10,6 +10,7 @@ struct device;
> struct xe_device;
>
> void xe_vsec_init(struct xe_device *xe);
>+void xe_vsec_remove(struct xe_device *xe);
> int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t
>user_offset, u32 count);
>
> #endif
>--
>2.43.0

