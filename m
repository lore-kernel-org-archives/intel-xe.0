Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CFBD0E6C5
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 11:02:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F3010E3B4;
	Tue, 25 Nov 2025 11:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cdRFvhSZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53D410E3B4
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 11:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764068524; x=1795604524;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kYlvgkCUzSwR3zXwablb9kCHLp2A6c6+ukdXNaJSUkE=;
 b=cdRFvhSZ9ACXKVibrYYUNgY/7mYL92c2fXJ0kDFHmb+DYFkYz6ptVQ/N
 9cU4xZu6PODSbEmzTorKvb8A6+XJItUqqa+4fNmbNcLV7jcj6Tk65Y9bO
 sshARX7paYvb44PvEElvQI8coV68FqyymZahiivuHS/zwrS8lj6NWdTxe
 qXzkyMq2htTeCpyAmw3iU8Tah9arCXiG4bh/baeBZtxoxxr7LQAvzZkx4
 LkB0rv9QRJZzOXpGc/eaNFAc/PygyWPrVL+Eoma8wmGpfAV1jboUpvwfs
 lEwwBqLyk2/FwU6n6dtkCgclPZg8sZ/ReonyXB/LOzdZctCaUM3Hz2tnL A==;
X-CSE-ConnectionGUID: xDGGuSNARGCJ/K4YiLP15Q==
X-CSE-MsgGUID: uHwRGfyvSvKenFbcCXqckw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66243443"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="66243443"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 03:02:03 -0800
X-CSE-ConnectionGUID: 9rSBhBiPTIiEJsKAVvpwDw==
X-CSE-MsgGUID: FMlrIubmTbiI9u8g5jwEyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="191867976"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 03:02:03 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 03:02:02 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 03:02:02 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 03:02:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=csqDxgs5WrKawcLt5yh+GbcgunlqUE2VJAFX+/cX/jXKeAYCOLVsmrpg+uvDpFxgjQvIwW2UAdLgbswL2/qfUl47h6mXHcy8sb2LWQQ4LcRsaoCxvba49a9pt0W8vQEQqtg7l7jA1yocSqbpSoLyEB2Ilh+ONi421GHvXx0yP0eWzXHuuEGB1f3UgeEng3c5CY2YTuYnsel7ABknQAkRuNQrJzi/PTZ82r9u8VeMDfuD8jHxUeNMMwyDIvG3Q0u+TaEvcywbPKehtrtfx0c1pWT6s6pgreRaggOTZX9bxkxDhNzekfiwinPO3H2pB11PoZWdg+MI3IKZV+8ex18VJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q48B6UjKrwHucYeKvCdO5iNR1OX0s/OvXf/hYeaOcak=;
 b=Exsvi42qrbugLcaiC0zHTvb89BZI5AHh/weX2G6zBssZN3nycaoVVUPtg+6UokHzQgd/lFzT8Pj6nRy0o/QIqlff1gnYSw4UfXBmMnLtSoV5U8LU0s5s8r5fzZ/Tg13pcTKZSStHeDsKPRbgRr+Xrn6eyuxaPcvVzn5/I47BJzDXg8rB9nh5MESnuBXsVNYYL7929oOwT3RLgX5eazpLgZFvCJacmLvIpbjxoiQs/35pU8mpIIHiBS/IL3TJQVlbb6RysUWxFpdBYHRW0bt7PNNZ7aFSmIEm3GZvGxEVAx+KKpbMlEgh2ue+gW/gLyK4n+qY9cUX2j3/yCU5G5vTeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 11:01:59 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 11:01:59 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH 02/11] drm/xe: Reset tlb fence timeout on invalid seqno
 received
Thread-Topic: [PATCH 02/11] drm/xe: Reset tlb fence timeout on invalid seqno
 received
Thread-Index: AQHcWGqSOYUmEJIdUU6XDqgaSmxvObT/CdYAgAMjrEA=
Date: Tue, 25 Nov 2025 11:01:59 +0000
Message-ID: <SA1PR11MB8839DACE6D019FC77849D32CAAD1A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-3-brian3.nguyen@intel.com>
 <aSIABv+iT+ZJX6sk@lstrano-desk.jf.intel.com>
In-Reply-To: <aSIABv+iT+ZJX6sk@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|CY5PR11MB6211:EE_
x-ms-office365-filtering-correlation-id: 4d7352ce-e824-493e-9e13-08de2c120e87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?/YCSOihiJMkyPjPmrww0d1IiC5FHhLa0o8XIiqGCUNcWTG82YJa37XzfnyeS?=
 =?us-ascii?Q?5buUgsHHmSFvRtrlWYNaa6cNuVzi6eDxtbgRf8k9n7ziZu/SXf45M9KhgOet?=
 =?us-ascii?Q?jEx6J4djSkZBU8hWY1wKGjVKdRWWcYAb7dm+uA8CSa/RX7Jd+eH8suymTcJh?=
 =?us-ascii?Q?X+f4Xc6Rfs0XFY/RhXntA2gLzkW+Xpybf4kV/wbWh6vGf4RnhgeMwyvugMBz?=
 =?us-ascii?Q?oUcfxb+SqTjcR5nGL+WSR3pGgYxKxAYCSjLbemjczt4XfB0tO3Sru1RkKlhx?=
 =?us-ascii?Q?BzkI3TZ/hy1dtnQZ/j1bVT8jewtkgZD3mG5npRN+S9Nap3m1FFsGkPRU8J12?=
 =?us-ascii?Q?Js24U1zIyOlyXxd2uJth9tXvLxEwvjFGsL3y+qE/DnVCdb+78B2/Bdw8Out/?=
 =?us-ascii?Q?oKnMr0x6txQJXIutqfUHRGVZFMXSrMZzl8EIJnnmFqEkZRk/XK25VXW8ovkh?=
 =?us-ascii?Q?vN2nCNIi8xn4W6SwzqxgpFe0OvgBvZ7R3BV96WvhyIh/Wo+QBjLA6ivHKTY7?=
 =?us-ascii?Q?Lgad58UnnoWbv0VFnfHJP1PxuIc5PUCEQ3WtvIlJOqhnx2nGw2Zzh20eL8zp?=
 =?us-ascii?Q?qEUa4SVcai309P81DPQ6atvvxh9GZKItq7FmojPVQ1Hmzu+JpAGjQVZcLMc+?=
 =?us-ascii?Q?7bcQU5CMhtl7WtfHaTr4cV+N75azqm9SzVf0AbNUDQw2aEWhCaAR+QOZlxDP?=
 =?us-ascii?Q?kp6DwMN+AYOJXG/SjzBIGqrqqpbwg/tQtqGPjQFdAJWw9xBGX73cy5wwD0f8?=
 =?us-ascii?Q?Mrbx7iWQuqjOL+VczhkgmjfX8PykHhMFGv6hxgSAV67apASwvCNTs4UAPLA8?=
 =?us-ascii?Q?Ty3e9gPiEBbULOKNbQJKAxuy3kDctBK2c5i1o3PcSdsloG520vAJr1tj5j/R?=
 =?us-ascii?Q?mmRGaC+QubZPi5TgWi6sDyuoqIFDbPDfhiorNEupbzrUSdtuLE5mIY1Zuko4?=
 =?us-ascii?Q?q2ffV9U7UgriTSzPmvooOHQ43PeFQ1yOUHDOlS9B2akBqcMev815/wCS/sO2?=
 =?us-ascii?Q?9qwt5lJkOKLdooWN8F0Je9SEssPko1+SohhX3IwG+Xb96QZ+GoLU0Q3BV+iW?=
 =?us-ascii?Q?MrBoDBDXpYqI0t9RMGJHOKlna+77N+8/nOTHTKi3FEK1vGTAQvveQsvW5G9c?=
 =?us-ascii?Q?0pHSjGB9W+isokE8qstFBqVkixb0V7Evxp3ICoLRA3wk4GPJh8BKL6l5am/S?=
 =?us-ascii?Q?GnL2EIcB4XITmb2si4zxSrJnQy0rJ6d1IQqzvRcVC31cS2aJ4OMiE+N9w/9e?=
 =?us-ascii?Q?o1rHAQVNrPX5oxCIZgIUq7ds0wlTTdXFn7idrRTQV1EOZUHnJMgT0uciAnc6?=
 =?us-ascii?Q?J3U7anO+IjAowtRi8upimr1HJ6eg0X3rqm7J4DFmhGwd4NRy6BRE1Okv8FmJ?=
 =?us-ascii?Q?BXQbMVResXfMNSyWQdtDYZt8raMIyu02HWSwT7pfB6YfatW8F9FDMQcZdC9m?=
 =?us-ascii?Q?PeGfCXEj4wyhEgrcT9RwfoapWHYcpc5MGxB8TIlhMbd00nSm5gE+tTBZ69dE?=
 =?us-ascii?Q?kNpnWasyoaoO1cIc+iz24+bIztOapGA0muDP?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fLraULFF8CHvlOjKzTw/+rqCuTBLLq8JfoDgQvxyfGzDhCJTM0BYmjIPBIFD?=
 =?us-ascii?Q?3Rk2+/E2z5KUdeZsgCRnf5wlEXY10ZZetWJapPVB5HygFJsTenf084/c9BG3?=
 =?us-ascii?Q?OfwFLO4jF5xXHpgH88Rt3lHo6eBZsU+8UrYqrBUlPnzt5Cm9Ji5ok8K70MkL?=
 =?us-ascii?Q?v1uLfl6ha/IJvkx2GtHDwtkWZ5C5kHFNvbsdFBHTloTO++c73yVsWfxiIuli?=
 =?us-ascii?Q?UrwKRy7WsWci3DQ0YeXymhQ1r3bakFNed5EMnbVSB9ih6hZUcNMkW3k3W/U9?=
 =?us-ascii?Q?uO9Cla668t1qJHQkMNvuKYTaarkxCNzPdzj4inH0bYKy2232fjgu+ff6KHI6?=
 =?us-ascii?Q?wfBS4kGvTZYvedue/IoQEcQFuvH3zCZ110cFdmCy1p0uI5FO6Kq45kzeH4Oo?=
 =?us-ascii?Q?RjOLU/ZkxXbA+xVef2+3qXa7uvcBBdYJ+/RVAiQXFhSavoJWTG94AZMjCJy+?=
 =?us-ascii?Q?XHQUgyK+uutw+ZfaiAl3uDMqjOD7YJzAHyVYtP+keIPq6uaL62tUufeRBU+g?=
 =?us-ascii?Q?s5vv8ghbgfLix+Lv7w+gNhr9RjFKibXdUq6zcdeETkg+bBEahqXbFaec2t6H?=
 =?us-ascii?Q?8vBcni6AzuHXQYKsNVkBdu36mKom1p9oQQLyjK2mVHw1uIPUB+eekmp5ynbZ?=
 =?us-ascii?Q?/ebpsD5+pR9Is8rw1aY/v4DoxsuKtrkM0wvlBCmkOfZDY6KjOK0MNwbIbxhG?=
 =?us-ascii?Q?4dXXzLvKf9iMTyog4yflWdRU42/rKyc1uBFaU3RAXs6eeINZh6U40f1zlCIQ?=
 =?us-ascii?Q?5pB2O9qJbOHOBM48AtVefMdDKzpaAxnC1NmSJOMxmPN5+LIC/N5G8MeHvhBx?=
 =?us-ascii?Q?7frI5r2yZtmfrfJ2eZdfw7kMu9by38SqSwjsD0Q2Dzhl6nChggG8U3JczOdy?=
 =?us-ascii?Q?gUlNUDVvX8HcLj3z23Rcjhz4FJ6vyhOp3aBuwrsQB0PKTWueva7OAxaSVZPG?=
 =?us-ascii?Q?SRDBd/d7wfSA8eMWszrQCtv8cx3PnXlLfV3zwda7XCtQYqp+cP98BoVcfKhm?=
 =?us-ascii?Q?xtVIcuYTGJ/Dg7ok+n2lUK4kKBEm8IGp5kJaL6wN9cMRb4nH6l2IAYeR3K9o?=
 =?us-ascii?Q?WcdskWu8VqeN9/ac9A5ZUxSAxh/NJ1XH30JxozTFMQ+L9Bxsqlxk9JxqP/6c?=
 =?us-ascii?Q?SE/V9VM1PZU8oY/Q+r+qnfgXNZHza2zxAyH0acz5WUrCGyCW3cvCYFMPcPom?=
 =?us-ascii?Q?J0oVSgMzPRpymNwdB/YGfEgdkw61Z7Il6ojKPDOohBW7VlpEdWiDKs1ODYSt?=
 =?us-ascii?Q?lsvkp7r3j/zNGK/F2NuSfXgPvJ0uwvvf6jeWDzsggxeIzuhi+tGbXAKWF3Nd?=
 =?us-ascii?Q?n3TEVSGD40xfISTtfxT1HReIaZY/FV4ieRBDqnMKGdGCafgDhuHgBkUJ64vI?=
 =?us-ascii?Q?NWtSqlO7k0ZauPyQrrVHCwRQjFvJLQ2tt6UPU6fgisUKjEZBJNEQ3TFY/V0h?=
 =?us-ascii?Q?AZxKQr0SDJkzL+3/nvwUpZDvcyFSQaan22rkLjIz5C2/Rdm5alVYiosdl4KT?=
 =?us-ascii?Q?RBKBX02aVviMlj/rUoY2ash5UJ/X99kxHCb2jDEMTTIZas7CUfwk2wUY4oLH?=
 =?us-ascii?Q?pa7khYFx7ADrQMEi8JM+y+CrgWKbvb8P3ZtqU1grEXNpn3RVibj3BbvkmJx+?=
 =?us-ascii?Q?vELCwORSTyzb/fhGSYq/frKXCp1SthWuxN2h4SYL8HjP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7352ce-e824-493e-9e13-08de2c120e87
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 11:01:59.7384 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RnO+AqLiSroVJkzVpbAq7vYW6Cm1UpntVyGLyl+Qmjj7av/xI/XQRUDakO0hmduDNWEXznPcQKacuqlq8q9fZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6211
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

On Saturday, November 22, 2025 10:25 AM, Matthew Brost wrote:
> On Tue, Nov 18, 2025 at 05:05:43PM +0800, Brian Nguyen wrote:
> > TLB_INVALIDATION_SEQNO_INVALID are now used to indicate in progress
> > multi-step TLB invalidations, so reset tdr to ensure that action won't
> > prematurely trigger when G2H actions are still ongoing.
> >
>=20
> I think thid patch makes sense but comments below.
>=20
> > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c |  2 ++
> >  drivers/gpu/drm/xe/xe_tlb_inval.c     | 16 ++++++++++++++++
> >  drivers/gpu/drm/xe/xe_tlb_inval.h     |  1 +
> >  3 files changed, 19 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > index f1fd2dd90742..cd126c53faab 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > @@ -238,6 +238,8 @@ int xe_guc_tlb_inval_done_handler(struct xe_guc
> > *guc, u32 *msg, u32 len)
> >
> >  	if (msg[0] !=3D TLB_INVALIDATION_SEQNO_INVALID)
> >  		xe_tlb_inval_done_handler(&gt->tlb_inval, msg[0]);
> > +	else
> > +		xe_tlb_inval_reset_timeout(&gt->tlb_inval);
> >
> >  	return 0;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > index 918a59e686ea..50f05d6b5672 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > @@ -199,6 +199,22 @@ void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_i=
nval)
> >  	mutex_unlock(&tlb_inval->seqno_lock);
> >  }
> >
> > +/**
> > + * xe_tlb_inval_reset_timeout() - Reset TLB inval fence timeout
> > + * @tlb_inval: TLB invalidation client
> > + *
> > + * Reset the TLB invalidation timeout timer.
> > + */
> > +void xe_tlb_inval_reset_timeout(struct xe_tlb_inval *tlb_inval) {
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&tlb_inval->pending_lock, flags);
> > +	mod_delayed_work(system_wq, &tlb_inval->fence_tdr,
> > +			 tlb_inval->ops->timeout_delay(tlb_inval));
>=20
> You don't need a lock for this. It is done in xe_tlb_inval_done_handler u=
nder this
> lock as the pending list of TLB invalidations, which pending_lock protect=
s, is tied to
> whether we want to reschedule the timeout or cancel it. So please drop th=
e lock
> here and then also update xe_tlb_inval_done_handler to call this new help=
er.
>=20
> Matt
>=20

I have moved xe_tlb_inval_reset_timeout into xe_tlb_inval_done_handler
and converted it to a static func. This also implies that the
xe_guc_tlb_inval_done_handler has been reverted to its original
changes and the SEQNO_INVALID skip are done in the done_handler now.

Brian

> > +	spin_unlock_irqrestore(&tlb_inval->pending_lock, flags); }
> > +
> >  static bool xe_tlb_inval_seqno_past(struct xe_tlb_inval *tlb_inval,
> > int seqno)  {
> >  	int seqno_recv =3D READ_ONCE(tlb_inval->seqno_recv); diff --git
> > a/drivers/gpu/drm/xe/xe_tlb_inval.h
> > b/drivers/gpu/drm/xe/xe_tlb_inval.h
> > index 05614915463a..9dbddc310eb9 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval.h
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
> > @@ -17,6 +17,7 @@ struct xe_vm;
> >  int xe_gt_tlb_inval_init_early(struct xe_gt *gt);
> >
> >  void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval);
> > +void xe_tlb_inval_reset_timeout(struct xe_tlb_inval *tlb_inval);
> >  int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
> >  		     struct xe_tlb_inval_fence *fence);  int
> > xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
> > --
> > 2.51.2
> >
