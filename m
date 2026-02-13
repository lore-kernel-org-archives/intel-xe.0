Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004EDEDF150
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 11:06:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1FC10E7DA;
	Fri, 13 Feb 2026 11:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dQuW/HlW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054F710E7DA
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 11:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770980771; x=1802516771;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zRfAUaI352iY71oPzMgE1v31IlO02APILxtXTbfSOIQ=;
 b=dQuW/HlWJ97EQE68l4ppZovN2nAKbA4n4JO7WlJepe5Jfei2+k4UiqO0
 L2p5f4iqKfvQ3fC20TFlQ7MFUhkZw+EU98TwxwaQMVLAVpvDIoqc0kZwi
 45g17n6ynbgDdJCGAtrrVOT1ehsL/Lp+MnWaf/rowe05xbFsaKrumAQsY
 WUIKwaCrwo3VHD8jbNLYHHEIG1CRZV2jXvzqxSkOPWErulrXVhOzhdhV8
 raOMH8P2igpp/1e2I3bpEoNAayncbb2T8+xhIX8oWKwJ+86nU+vdv1F0B
 EWAf6xx+6odrjFd9smhgHFD2IHB+Yqj+m/88J3/sWn1p85BzECPPP3FxM g==;
X-CSE-ConnectionGUID: TAY0YzxWTZq/EH/oFXHHmQ==
X-CSE-MsgGUID: eSpX/T6US+uegMa7vrDbNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="76009878"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="76009878"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 03:06:10 -0800
X-CSE-ConnectionGUID: ICZ2KKi+Rd+hmIPUVcKuqA==
X-CSE-MsgGUID: w48opvdkTCOsnA9dJrppnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="211607327"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 03:06:11 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 03:06:10 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 13 Feb 2026 03:06:10 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.8) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 03:06:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJreiYCyRr3i1YGM5xXA/w/V+ny2FYBKohEYHy8ncQ+6nOl7vagR6J/0CMjzotlOpJdQWendQBJmiXDqVUOMFca0EAB7+iVczqlYtXNyPIj8MwdC5N8Ctgm3drhPAypG0AjoCcPDtabYvHkEpWpnkmXE6kyl1aUQWLw3gkYYRrPeajVLEJ3iJ0u4DfKqm9KELOFVMcfMgmRQ9391Q5CKMRSUPHJHUzmC8zPkNE31pu97HI+tHcWbfSUuFFIUIYRhNf5rqyz8rVDl12W37p+CgoMGwyeYplnfMDJ6ucM2DLJj5N0Mzs3UYZpxd0QsaTUhMjrMWpRShdrYyIRy6mLzsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYrYR4BzxKJbjfpHwgGu/1pZhjWOqHTnWHkxqPw3TC8=;
 b=s/W52S7F7Lzz1ZLM1yUL0R/LUjuwJiknzOiOHG3sMpRGOj1xE40PpUue2RV1z6fcQqnxFJQlJu243rdzSdCCrK4WEl1wnmh5cvKPfyIjQ17olGyBuX1tBg9OniKvHdzWwcsmfLOe/N4egDBSR1CkwcSJl3Wryj6d/geh21eIa7igyJ3PB7lCygwbka/EUkfsuH2v9rJUvpEfFZZ7LdpNyaNVN5gcy2WdB7nHqFFdyaHZy8vhla+0/ntibgCUIF03ddx/qS2AOnEYdSyg9mnqgrMhejDuv2vbwZyQLwJgQMBxW2NWwdo7REJ0L9isfIGqT6L0BsIVQkAVKnrtFWPXQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS7PR11MB6077.namprd11.prod.outlook.com (2603:10b6:8:87::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 11:06:07 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437%6]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 11:06:07 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: RE: [PATCH 3/3] drm/xe/xe3p: Skip TD flush
Thread-Topic: [PATCH 3/3] drm/xe/xe3p: Skip TD flush
Thread-Index: AQHcmowtVZEnWQo5zUGE/wjAIZmJ4rV8cZuAgAQKb4A=
Date: Fri, 13 Feb 2026 11:06:07 +0000
Message-ID: <SJ1PR11MB62046DF03833DD4F7684B5E38161A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20260210125120.1329411-5-tejas.upadhyay@intel.com>
 <20260210125120.1329411-8-tejas.upadhyay@intel.com>
 <20260210212225.GD4694@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20260210212225.GD4694@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS7PR11MB6077:EE_
x-ms-office365-filtering-correlation-id: 28b1e809-a7c7-4f28-3fdc-08de6aefe316
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?yjY8TxNdGsUb2CEaCPb7kB8WkyGY7zeFqtCdWuMeBFV4UkjNDEmNTT8oYAvK?=
 =?us-ascii?Q?Zr6woSj7EyU4eLXcFvUzfpMjM5UBU4yOymq8EjyIgKQPV2JcuV27kiYwFHb9?=
 =?us-ascii?Q?USRdx4p+h/8KQScA0RSsC74GdSoznufR9VLVaqidw1TARTQGaGpQrG66JSqB?=
 =?us-ascii?Q?B9EJTgKGWUSRCW0/b9IbE/feZFLEAcMuINu1BId8ERb7bVYpDbdihxyHx5fQ?=
 =?us-ascii?Q?ZgjemyYM+kV/NX3dekuHPdU9ekWVd9BqPqEUIPwEO/mmhhkuSoiZMnyHImrf?=
 =?us-ascii?Q?gzQqcRNCQ0EH4i1fRqScGJ154yu4Whap5364QNknxPYGpm+poWFImojEeDvL?=
 =?us-ascii?Q?iEIdfJKt5e49KEFvHhJBzqMaijnem3PTh2SePTpVs+97WGOZ5jhsCyHd12JJ?=
 =?us-ascii?Q?h1D29boxnJRFnQJJYrNnnUSCbvXt+Wz+oqHdi13gz0W5n+GFF6T4yWN8+HNv?=
 =?us-ascii?Q?kh5tbERSW0nc4duIaXEfMsZdvv7yW7FA+gBvG5nt82HnZeHNNzYv7qaztvux?=
 =?us-ascii?Q?d+C108dsxdWED606cIaPMjNm1ubMarR20kBQsR+rRv5nvBHIOq6LJ50W7PNk?=
 =?us-ascii?Q?oR/qJMIZtVvniAQjJ+2ojDVcsqdhovR2nXwE3ByOkei5mtKjsPgpaW1pYAG7?=
 =?us-ascii?Q?5MGmEutLHQIzzBMYqjzzWVxfJ5IJgf0pcbivdx3tE15D6cuIcoSYRxoTCpFn?=
 =?us-ascii?Q?pZErULfQn5drXOjnIvvCtETvl/33If3ACIZMi0yo7cuESSWCHeTfl3n3dTf0?=
 =?us-ascii?Q?rVm4iCVabrDdijDvvpo4nPW+AvUk98KKP3kt9HSwomfkROAFlTPJ95PnVNp7?=
 =?us-ascii?Q?DSUmEVtZu4vXKXQoRvxgvLdMNIDvMVYnIRs275lbkekifyeZ3ee/Ot6EpZOi?=
 =?us-ascii?Q?gbteA6H1gJb2/tfLTVlYUjAGYSoww+li5xzwKm2a48niXeXTzJmOMce66JrW?=
 =?us-ascii?Q?BoPKQhV+VLLTAgNDHVc17ANfHp/k4v7zeHv0u4hpdONL2G0m7HZW+mNBUcNh?=
 =?us-ascii?Q?zXnTRLoGBD1vwYZG5g0vQgTEtxAHbY5De1EfCwl04h44BmkVm7uc0VVMfjo+?=
 =?us-ascii?Q?mHZeyk6o8rsbGBEBg0ChvzH9vJxNX7w2yftdBVpzD0m/FYid28PXSvGdiRah?=
 =?us-ascii?Q?F8NSC0ZLXt2SVK76RUuUwEOwgGA3nyztAA7nOGP3dqFWcYIi8vd5Qo/attwc?=
 =?us-ascii?Q?fV9nGKF6SS8+qU/BrzaNdpndFrhaVI+vRGD3W4lQGvk/Y+h0SvLZZdvPxjEQ?=
 =?us-ascii?Q?7YkjRNOyUPqJETckdMQQfIvvFz0EvI+ZTKBOoshY/pgQbhuoyR7TKtYHC7Hn?=
 =?us-ascii?Q?KuGQamUe9hlFeYQswsPXWar4Dvszh028vpXghWR/qPCFurvsjCingfCClpN9?=
 =?us-ascii?Q?68mIotlQkI3ZwukgIR4t2S/1pXVWLxJdVKTdFnL/eLiuQCwbPpw23djvjVvr?=
 =?us-ascii?Q?aewoKqB7+a04+MqPNrX4wD4jX/t35CN4t8kPmxD1dcnC0Rmk43k8hTzBG5q/?=
 =?us-ascii?Q?k9bXUOa5mWoGjDPh9cDo02WN1L2Yw20BRdLgw+Ba/fgbO+UBslZMyB67fdcL?=
 =?us-ascii?Q?Svjc+HQegTf/CaKgx4vBo0GGLrUISu8rQpd2de+cbpIGXsOOvwLQVlKYsl89?=
 =?us-ascii?Q?3T6/WAO/let63bMLpHuwX5c=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fUYZkWPNGcq4vfakxMmL6xKBsmIJru0hYGdWbEaA5tBajBYDmjAw0Ip3nblT?=
 =?us-ascii?Q?ENFGqjPr16RhU6ro0aL2dsYiYnXrqZ/VkYfO9CpBBwB+AZYfC2Yr6O3FUTBq?=
 =?us-ascii?Q?3ypXMKEAMXHO5UIM21W8dZM6wno1H1e3UTM7U2Js0ATdp24zX4m/ZCbiX8hu?=
 =?us-ascii?Q?3mmyMkZ7FFTCh9GC/8nwhxq8Web0f51V6QEycDcljHbL/5CXOa9qaQdTRc9P?=
 =?us-ascii?Q?xak+1eW0xESelcsvQasAkhiz1JpGnKBJI7q9/OlX+C+xsPCHPs+LSl6IaJzx?=
 =?us-ascii?Q?TCLJO0zQOY0dlnKNM0k6tQdfad0CppgUp2O3soNwjI/sU8sliL5AoRXhyHsU?=
 =?us-ascii?Q?ldRnO6ggLlb01qA2BJEliC+9NtNuqMjMCFiBhCEglIsePhlIwFShodkQt0hn?=
 =?us-ascii?Q?okv5BnAcNFIQxIzvkjLUH6CSV2LrQdk7IYMMeoLUi/mrH4grSfG9XETbJoib?=
 =?us-ascii?Q?xYK3Kjo0BJ8WO0WngXKxl7dByNpZpAnOYWXfctQQN+QXLGzdybOF/nwLymPC?=
 =?us-ascii?Q?GDl5u1LBqH+kIJrP4BXJOLucuor2tTDjwS4zRzK7iu1OwmxY4fOMGLORtg8w?=
 =?us-ascii?Q?LH8Xqaw126ES4beq323+gddtrJovwjecJPiIQ+TUvq3+IPVrQlyOJXJVrlzm?=
 =?us-ascii?Q?WBPoR6r38NgH3OeWR47wdFCARILYKw+xWaWlojx93qk8J1Np22pPWeQk+EOi?=
 =?us-ascii?Q?FDKlWqDSyaOMFb2biwND4Syq+uthsgNsjBQS+rc8og2CI+D6ByjLGm/6w0e+?=
 =?us-ascii?Q?ofXRCClak3cxvRtSwZI7rYVu7V3VIB5frXnlf1NNlTH3IO+VQt1gLOzdgnbY?=
 =?us-ascii?Q?3ftAohNUF2QKOy1c3yph3aQ+Soa+cWwgh5/XajbinD9GOSOgYNGWOv6Lnu1Y?=
 =?us-ascii?Q?9Uc7yFa2CdD2zcPncCRxWOBhgVWGiW1X1dR5xxafyQOh2D37Xlu/oJpg80Ft?=
 =?us-ascii?Q?UB/3gdob70b6DT8/hX16hrFF29lkCSQweTmpJ3/hDovZQnCyhd7gkljflHxe?=
 =?us-ascii?Q?ZVAwwVtg3Zs5aZBlWcFO+oS2Xze1ks44vLxpNX5AlUfEi0S/P/sMPiKXT9Yb?=
 =?us-ascii?Q?DnsQP+lNgXGtlafZ87+jHc9zXmg5ZrrYW3deiGYKd/BFwMa/d0z67ONf5k47?=
 =?us-ascii?Q?bGeVeS4sP8foiQf2eA2Psz/YgrbNIL50P0qX53F8NTOi5s6ZZoOHEW+ancBE?=
 =?us-ascii?Q?1Cb+gIFWrtwReLK0kuBBWdzS7W3Q+WEuIw0jv2K67DgSEVCLlm2eginTGR/D?=
 =?us-ascii?Q?COKZxSgNkghibgU9k1f/UemAiShSqoiANtj4cEnAesdud7iyANeOPt/Fs+eF?=
 =?us-ascii?Q?SgTh2BV6wcOacWYtaSzTRfRxHDn/4a4bloZ5BGObCpS63ns518vYuTtQc1O4?=
 =?us-ascii?Q?pydC+98sAw9jCOBxCjipmtZn6yOn/wEINcZmrcQBjQsijoTDPFclA3P6jLAc?=
 =?us-ascii?Q?QG5zve1BTWZJE+nlIihGY8WrNW+3z3I3hyotPCWA/P8F+7mzlx0Yymf4+nPT?=
 =?us-ascii?Q?6VdYC98EywRhLHi1HwN7naf9s/0Opyoe2P69ZKcCejKSt63l+qPH2ikuGbZ1?=
 =?us-ascii?Q?bfWWQkdMzdzpbKxUMPh3H9uaA1wp+MslJBg6pR8RXZq5thmyKHOacI6SOB0y?=
 =?us-ascii?Q?U53mtQOJjZ3TsrfxeGP5MM8plxe3OR/E/9dT7/JHEaiiuRkBP2auyG3VjGch?=
 =?us-ascii?Q?BU7NUG7rjokuRHxtBqyHuSGfIBDI0riamPzFyVNZmVuvo3X5G+kgHMU30KcW?=
 =?us-ascii?Q?+NSpGvTGdQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b1e809-a7c7-4f28-3fdc-08de6aefe316
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 11:06:07.2611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zZEuYhuZm9MkJlAHp59FvbJPlLtK9Q7NzE4ASg/2MD7JLUMzf9OfkULEpQi2mlLYU7D23vW5iMIOEIfsxTKKAleIZima7gNT0OOYNrdRYmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6077
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



> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: 11 February 2026 02:52
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Auld, Matthew
> <matthew.auld@intel.com>; thomas.hellstrom@linux.intel.com
> Subject: Re: [PATCH 3/3] drm/xe/xe3p: Skip TD flush
>=20
> On Tue, Feb 10, 2026 at 06:21:24PM +0530, Tejas Upadhyay wrote:
> > Xe3p has HW ability to do transient display flush so the xe driver can
> > enable this HW feature by default and skip the software TD flush.
> >
> > Bspec: 60002
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > b/drivers/gpu/drm/xe/xe_device.c index da2abed94bc0..483813d45474
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -1166,6 +1166,14 @@ void xe_device_td_flush(struct xe_device *xe)
> > {
> >  	struct xe_gt *root_gt;
> >
> > +	/*
> > +	 * From Xe3p onward the HW takes care of flush of TD entries also
> along
> > +	 * with flushing XA entries, which will be at the usual sync points,
> > +	 * like at the end of submission, so no manual flush is needed here.
> > +	 */
> > +	if (GRAPHICS_VER(xe) >=3D 35)
> > +		return;
>=20
> I guess this is just future-proofing?  The Xe3p platforms we have today a=
re
> either igpus (NVL-P) and thus get handled by the next condition, or dgpus=
 that
> don't have display or XD pat indices at all (CRI).

That is true, all coming igpu HWs will have this ability per my conversatio=
n with HW team. And next condition filters out dgpus.

Tejas

>=20
>=20
> Matt
>=20
> > +
> >  	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
> >  		return;
> >
> > --
> > 2.52.0
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
