Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F86D46C15
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 23:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9AD10E23F;
	Wed, 28 Jan 2026 23:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YDsVDGI7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B10410E23F
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 23:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769641377; x=1801177377;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3izWb0P2KhrkhWWPJuLSgp3oI13FVwQG18WnpYI+DzA=;
 b=YDsVDGI7inLQRM5jCs5IZJNvRcqmhQEMckJvaOkX6pDf84zfLCyfTmPX
 JhUQHQ+WSlNANufN5nQdpmScbhC/Y789Ohu0eyCvZwqIbHtSf18PMnfZ7
 oHImwi4NniCrMCRJ5FaVgy59FfvwkfTRqMQnS61ZzfaR34g7FXHys1A+i
 SegVGh0qRVUdEBqKjwTNaSWFDdrv9r5GpfdKaVyBr0lIyz+5X1t5+rd6b
 kTPx0TqEa7tPMJsOrjLbb+oslzBL6tXjmY3P+v+J7dxzv6aXMvL/yNO4Q
 EPWoUn95tTjJ2VVGhQe2fwH6orw4FczGFeKNxTsGF9zgoKb4k/hPjaSkX g==;
X-CSE-ConnectionGUID: St8XkssNT8metgQwPnyo3g==
X-CSE-MsgGUID: dHpFfMHTQrKkOuQm/HIkuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81504493"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="81504493"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 15:02:57 -0800
X-CSE-ConnectionGUID: lQeF1RyTRAWc7jRY7SSIYQ==
X-CSE-MsgGUID: nysfEbeLQaCIf+68i4QdTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="212901093"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 15:02:56 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 15:02:56 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 15:02:56 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 15:02:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GVRvnWeNLaDlXaAPT6ohzHum/rlSODHqSlTwj6YTBVBD5qc0KZ01fKbUI/HkgSjn2bxcpFSLRO+87j2Geyuozq6LJa5Ul1yG4sYa79XEhvGCe+TmQH8T7Lsow/q8AP8e4BCc7rzQQwOizrujpB2PVTwL84G/MMKmOleqonQEyLJEfInsZO8IjN/hNCTPq6rIRW2eRLNWEfFVz6J/qHhd1ZDUnlKY+zmMfWn3+ef0RM4rS2CHU2pCDP9k0TU69bcVbaK2Irj9+LoRnffjVrtq4k9LhXjVxX99EzNsuIXK2+SAIAaPTrwyWIdY+M3/EHT0ucq2vYdEiWpvvpD3Q6ntHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nChXLxGBBpn1fyyAhbWLSnbYos7/yiexo1Lsc08i6qM=;
 b=UgMhsd3FPYvU8sWuUm9H7soUsDbHX93Dm2lYFO0ifv5FAQSoOdhwE38f2bT6crpIYkMluWmVzDXGeZwZpWcbZfhiu1uk+xshXbckKa3xpQbShOk6nv8grgwqCsqVzZPeZB2Z48aBoWxZg+OdgcISmzCnYgL62WwX1689hVfb9t649NZN259A0x6u8gzJAzAevdNsfaDHbLYGxrY798IEN1AAg3T6eUD+Q18NymD3uCippvQtyiThhRMbi8+r1V/ThgPYfUTm02mSRVHS8XIi8ony8CmDt1PIu2LmeVXiXPHliajBlafv5rZ/t82UTumdWdA4f4lgXEpppVqFfvMJUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CO1PR11MB5156.namprd11.prod.outlook.com (2603:10b6:303:94::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 23:02:52 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 23:02:52 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH] drm/xe/pf: Simplify IS_SRIOV_PF macro
Thread-Topic: [PATCH] drm/xe/pf: Simplify IS_SRIOV_PF macro
Thread-Index: AQHckKVV0WaEMj0+yEmvvaeSOHbw2bVoMjdw
Date: Wed, 28 Jan 2026 23:02:52 +0000
Message-ID: <DM4PR11MB5456157D32388A4B59C94A3BEA91A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260128222714.3056-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260128222714.3056-1-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CO1PR11MB5156:EE_
x-ms-office365-filtering-correlation-id: 1d7d91fa-99f2-4546-3744-08de5ec15d5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?1lEmCPyW3abSl0FETNRTaY1bWc95o+RqOLfSCqsnGTKhfn+KngTpIJtEYRcz?=
 =?us-ascii?Q?VnRjU3S1je3B0JGWI4YRhBbSlK3gRAbViTYzy2v3Pi/QftxYQv0zooxPrXtH?=
 =?us-ascii?Q?VRx4y4BuPw6xJp/7z52eRUj0BVufrwRxSd40GFu1W6w38A3TCpKWJQwVaFyL?=
 =?us-ascii?Q?qU4gySut45+UVjA8yfFfjt9fWN9u8Dm76/JuIwEdUo/5hlPkfvNZdC1nafuM?=
 =?us-ascii?Q?nPlCdqXr6O3NKqJvVxvolR9e5egXHDky81PPNGfMeKD3U6eOdICibwPU36XQ?=
 =?us-ascii?Q?cPRnFHaRwMYIaLHpuAXh0ILj7ZvIMFJsQPULw9WBY0EhUwIGEcHkuZD5eoDa?=
 =?us-ascii?Q?OVh2Q4GUadCKYlVKn6GkZ70O4UfylD6mnAI6qAKNRXXH5VaMr1Vm33tJ68Ch?=
 =?us-ascii?Q?9J0rvOKcF6GhEwWZ/iDr7byFZi1sHBojF+YOOYuPdBVhfIMEX0VkbPA8bxhg?=
 =?us-ascii?Q?vhkQ7EWKoW9CWguHKPieD4Ifem9h2fzGNDHKTQt3s8Pa6v7Hfro14PwmPqvi?=
 =?us-ascii?Q?obMDRNFy8kfMNI9YrZgcduWzioD15y5sepKOH/BEMedyZ8iqDAyHNyZMJGph?=
 =?us-ascii?Q?caCPJSPTO9r4CUEIDZSbLsVpFnG2MHPlVWxshHymXKtpP2PqhFj16DPZV87Z?=
 =?us-ascii?Q?kFY7ZgADk03Dme4uEL89LosB4G/wEo+cT6xPx5v1ilxkKRc4VjVM+SQ0YVSA?=
 =?us-ascii?Q?a2MrOFdZ/ElymCfX0V3vRRqRtSt4J63rmRLvPs1S4CDo/mbYopJ7a/Dqh34Z?=
 =?us-ascii?Q?sA6/gfO27WTNGwg6x/jkZ8AsbZ+adRjJq2uJO7cXoxsu+LE9nxtwWWGcnD+1?=
 =?us-ascii?Q?c6QLaImYfKUhabd/lwU3FmS2jd7pfK8wJn0OTnsqWmgcV5QRcmJoupH53tTR?=
 =?us-ascii?Q?JA3KAhiYj3Rt9jXCDLxymX3C2gWJgst/xYSINU5H1Le1gcX+1Dl3eL3XDYeS?=
 =?us-ascii?Q?1w+FiW84NKj00tHzUaWS4C/GXVawdLnF4dzKCrV//owPkgOhsq1gWNmgSzua?=
 =?us-ascii?Q?YvKHhfN7Xp14tB28LZgYO2FXeOvCHv5FIp/u0wBQZ/EaY09kVAdxy++FiiiD?=
 =?us-ascii?Q?IpgwZ51Cf0TVtmfsy6ugiFxSob6iOj59SbR08zQ6OOKt5r3/zWcoXZN4r68q?=
 =?us-ascii?Q?4EYzFGkEHzw5e5448VPtPVpTxCnKA4Ytvw9pl5dA7G3V56tg1/gueI/+Ki3r?=
 =?us-ascii?Q?pxiyu4XRdS1y51nutswZa1v8427Nme2ufMY2lebxLNNd1MfIYsTIuglrb1ki?=
 =?us-ascii?Q?mCIhx/+Uuf/kNevcz27IuNYWg9zw+TRsN170WDnoNBbo9fqU4/kcVrBVF2P+?=
 =?us-ascii?Q?Vr0p8kIXGwdjR0pX3xXymxsvtn1ezjTcs8CpRQxkc6+gox4jHTAT0MS0DpBs?=
 =?us-ascii?Q?GX9Ev7rVIw18OXe1G7zNmOSU3afAV56E5gC0Ir7WzGGxJX/kyPnue1adQcVG?=
 =?us-ascii?Q?nCGVVQh/gmK6a7+x6KSNGAOPZFN3WGvgWSYOufi9HguZkfSJM70jl33aXgc0?=
 =?us-ascii?Q?mMX3AWeFs3XEBmAEnClk5xKRch0ZbW1NQLruTa00fckYigeSgBYrRv7aL4PM?=
 =?us-ascii?Q?MecufvQOwZsRthUVpgZw63NIifI/635RqvlecYog24h47UM61F9N/AEfyWuj?=
 =?us-ascii?Q?eJWekdkpMRrxWe46FWCh3fI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DL1QTB+qyBh8bb37zE9gONcJnDKJkIugMgvm5L6MzHP46lBqi0XfJu/Fxtrf?=
 =?us-ascii?Q?tewFutiEQI+SHxe8+YaJ8730cnVm0wMNxOGMx+Y/uuuYuVg6jtZ5VCTGrk/L?=
 =?us-ascii?Q?lGcF3dKdLn8rkivYS2h8bvut2p0ikteI76wTYqVwXDlQ+M3LP3BQbdqAPwwK?=
 =?us-ascii?Q?AvkEOO3o+q1WBTUP4+BjuC+b2hFw2XvMeAs0DXCeX12iQMhrEuZqVbeMm7lu?=
 =?us-ascii?Q?FD7Yr72oNLpVMLnmMokOgqr+dMXZuvKIuauwrDCn6L9M7Fd2A4h1aGtoXVNu?=
 =?us-ascii?Q?T2lgRJupLBQzyqrebJmFWd9K62MpW6QTRZBAB7DycDNGlEsyepAezVdD0XsE?=
 =?us-ascii?Q?XQqo1+IuLqsLkXE+gwfd3aSqneQepu8hw6UNr8/GDr537WWwlaeQ/iG+x71T?=
 =?us-ascii?Q?R9BEDaVFm6mrIgzU1psF9AaLlouvJpjH1NK+Be+1isdpfpcNkc5LR3DvRohj?=
 =?us-ascii?Q?vCJkRBt9Tn8Wp78UZRacNgag2ps3AevboTBO+XUiGsglEQ6JiPpU7Gsd6xtn?=
 =?us-ascii?Q?Ah/opwPHo71gdVfPq//nhjE8DdG70lA8BN2t911F0ABEiLWxCTH0ipUAA2sD?=
 =?us-ascii?Q?ft1YcSNDAV+aChfpq95Cfo/O4DflVTYguyURZNWjLjkn2AkUcZ7M10XCV3Jx?=
 =?us-ascii?Q?iAns4W4SMT69DOT6FI68bdUtLUqsDkSSZEdCJuSPWbmG3Wfw3nPBdZFQKW79?=
 =?us-ascii?Q?zc4rNQuGBgWnwcqtX8K6JMX6BGXt0LsF6us4QfAAqSx96A8BCdOsXxUrzRKl?=
 =?us-ascii?Q?/5LZx2GR8WMexTkYYsYC84BDwkIUQiWZUF3NWQhRgj2O0F0vw98UYmypEq0F?=
 =?us-ascii?Q?omkkEXuqBPV0xhj1O+xFF+6jS4uUtG9bL2ANkXaqchGn5lOpcylu1f3aw9Ov?=
 =?us-ascii?Q?FKeJESHztHlujKMUKiaXYOWJJD1YNKsPlaJuBZZUTt1NyMwi1LOjA3Rm1VOR?=
 =?us-ascii?Q?rECzJrqEhnUfS4pDA7IBGOkFmgzjuIBX2QdjYxUac9ORWIcHNCZAUfn6kNik?=
 =?us-ascii?Q?O869h4Cu00saQcR9/Qjo3pHORh0YFI/PMuP0lsPgHFRPl5eVXs+7UmQmkvFP?=
 =?us-ascii?Q?p+Inc2EyyhMvcpH9b9mo7Gtng+077kGEMEQCXpHcjIqEjM873xvKjy5sZlrQ?=
 =?us-ascii?Q?mF2x0EDGvtycF1/ddPxJ6negPT888t178XGDVHmwuU5FteejzyqcvMJJQVdN?=
 =?us-ascii?Q?ytUcl7AVt+Tfv3g7tqh6bG7OxJC980RQINaqrdTUJJDF9jCrQl3/tW8HZz0d?=
 =?us-ascii?Q?mVhI5d3sAiZqnyPZhungSY0M9LF3sSXE67hcxuEncUfd9nnGtfE8kUi5b0Fl?=
 =?us-ascii?Q?cKmo+n3Z815LTV4s/rosfgiBx5P7R3b50sDwKumr45dkLJZxXmPWTZ05h4t7?=
 =?us-ascii?Q?z8joeLoJ7ZASNYgi2RBzM4NtPVW84iikcc6eQ3JARR+mJ1SaXDvr4+Z3a3GW?=
 =?us-ascii?Q?sFrb8pAfHWz4CfTllusttaBnnoC4fDJuA2JZM3oyDUqsdzAiR6tFdlLWNoqo?=
 =?us-ascii?Q?80RJCnEsvDayvaFIz+zznnWBUeEOVebG2OZRC5yTlOL8RJvfrsk3KsAaaGDB?=
 =?us-ascii?Q?1gDQn/WjYhfsHS0oRee0Rqo14CtYY4eVmRd62DCbOhR/2Q1+OY+LIqtJkJqr?=
 =?us-ascii?Q?IXZjTgjjBaY9tKFX8RVvEkHlgbsRg8rQyTjKoxDu9YnEy1wjP2oWGFKtuV4m?=
 =?us-ascii?Q?VyMsW8rLEJCOQBzP/31dd/ixY79eG3WAReij+0cJ/4qRR05dHmDyY69J0hkD?=
 =?us-ascii?Q?tHsZixXA8g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d7d91fa-99f2-4546-3744-08de5ec15d5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 23:02:52.1056 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GOYnX6LLRp+wgRfJ+pv31GtmCFyqDuuONkxLw6MYROY2n3oBiR/E2XMi4fXOuVmoQwJ4FbvSEHRFTcFfHDVyyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5156
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

On Wed, Jan 28, 2026 2:27 PM Michal Wajdeczko wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of=20
>=20
> Sent: Wednesday, January 28, 2026 2:27 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> Subject: [PATCH] drm/xe/pf: Simplify IS_SRIOV_PF macro
>=20
> Instead of two having variants of the IS_SRIOV_PF macro, move the

Nit: Should be " two variants " instead of " two having variants "?

> CONFIG_PCI_IOV check to the xe_device_is_sriov_pf() function and let the
> compiler optimize that. This will help us drop poor man's type check of t=
he
> macro parameter that fails on const xe pointer.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com

LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

>
> ---
>  drivers/gpu/drm/xe/xe_sriov.h | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.=
h
> index 6db45df55615..72e55543c30e 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_sriov.h
> @@ -28,7 +28,8 @@ static inline enum xe_sriov_mode
> xe_device_sriov_mode(const struct xe_device *xe
>=20
>  static inline bool xe_device_is_sriov_pf(const struct xe_device *xe)  {
> -	return xe_device_sriov_mode(xe) =3D=3D XE_SRIOV_MODE_PF;
> +	return IS_ENABLED(CONFIG_PCI_IOV) &&
> +		xe_device_sriov_mode(xe) =3D=3D XE_SRIOV_MODE_PF;
>  }
>=20
>  static inline bool xe_device_is_sriov_vf(const struct xe_device *xe) @@ =
-36,11
> +37,7 @@ static inline bool xe_device_is_sriov_vf(const struct xe_device =
*xe)
>  	return xe_device_sriov_mode(xe) =3D=3D XE_SRIOV_MODE_VF;  }
>=20
> -#ifdef CONFIG_PCI_IOV
>  #define IS_SRIOV_PF(xe) xe_device_is_sriov_pf(xe) -#else -#define
> IS_SRIOV_PF(xe) (typecheck(struct xe_device *, (xe)) && false) -#endif
> #define IS_SRIOV_VF(xe) xe_device_is_sriov_vf(xe)
>=20
>  #define IS_SRIOV(xe) (IS_SRIOV_PF(xe) || IS_SRIOV_VF(xe))
> --
> 2.47.1

