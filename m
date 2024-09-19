Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3017CCF3959
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 15:10:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCDB10E040;
	Thu, 19 Sep 2024 15:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L+qMBzQi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5559210E040
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 15:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726758601; x=1758294601;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mJeV1Y2M+Wqyvh+vpsukIK/F+X1C2Q2z/igsy0ush2o=;
 b=L+qMBzQiGhInzKWrYeDg7xuz5FwNKT1rnFbRN2G4O3Z757B3Un0YYncI
 p4buWgZ3rU4RB7afUkADqRiXi56kPtFhBKyyQbRHayPV7blGhN2DD7Fo1
 nmPykRMtufyq4Kww3oDw6Oa8Hkd+C3w+Yktbeapj9/fepNur2RGQlWGET
 y5tqxXHNth/Yz8li2DL3QrrwX6aoHAMTS3of6pUmIgz1XjblQhqNpiy0B
 WEAso/Y6izbdSJ3o5PJd3XMJRXtRGV1qTk/Y54XyoSLGb4LqY8NMsGKcd
 aSvTBuCk2gtaqCPBrqYOfUbX4u0uGQygRNeKRxtLik72hnJAcJ37Qso+D w==;
X-CSE-ConnectionGUID: eGBisHziQ8S3HpDsFLi16w==
X-CSE-MsgGUID: CMt5JJadRQ+O49/zWjLDOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25827521"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="25827521"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 08:10:01 -0700
X-CSE-ConnectionGUID: ip4F1J8STGuWo0fmdE8J2Q==
X-CSE-MsgGUID: kYWKSG3tTFi/McmDcpULiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="70803705"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 08:10:02 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 08:10:00 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 08:10:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 08:10:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPetEZ5YBH3DvBOqoDW2yazz5FemX9nLKS7z+aC54tH0v5qT08Io8tat6Rg5Yjpt1zLlE/w0//6V0mepNKUHxUsf0sSfqSt7QIrXUJieYFqAhkV1H7hNsCqlNWKnsfBVzu5ZG5hdEJvHJYTiZkswhWhUBuicJuDxPccd/gwefAYJb27E3GNvSBcOctIJ0Y1LGoNDpwyQcvbZYb9wRXHQUx5d7LyTzxjkrpoIF5ajl2cVgtybb8HHu78uRQ2pGCual5HFitI5tFGPP8bekkEIBEB3Sk5/zMnRcf5NvCkVNuhQGicxICM3sehjDNDZG/zKQWFAjwEZKiaoB1GXGepTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMa53WE2tSzJ7mEaBPc+zS9vY7AfIb9xl5U86wGjMnE=;
 b=H8YMMux180/F+XsyEiYks5W0AqdLEqYt96pGWO+KaSRB3Uxb5D4sF31XUfNfMNbKgewRyixxMJlNksT3QNRKnHHYVN6aSyNrQTNxzflybvhm4CGAUGgmKJXPiT1x8QKT5ttmq+uSAG0BE5/awA7PuR1OkXDBT9Uo63Rm++F7eBy5jwmCpbxW1k86Phvl35ImhJTNabpNFWrej1kf80mdLfW3HrEbNyYi3Cs0RQ2Rr2/BEI1xkBEL7zQpWWoi93MrWG0oGFL6tV9PAZawri4OoHvW9yx93uZD64uZ7gVbBwSYEuYwvZKYKZxmkTv/g2bB/kNsku+BsYSVq8w3DTW6AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3159.namprd11.prod.outlook.com (2603:10b6:a03:78::31)
 by SA2PR11MB5131.namprd11.prod.outlook.com (2603:10b6:806:116::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Thu, 19 Sep
 2024 15:09:57 +0000
Received: from BYAPR11MB3159.namprd11.prod.outlook.com
 ([fe80::d07b:b67:3584:7476]) by BYAPR11MB3159.namprd11.prod.outlook.com
 ([fe80::d07b:b67:3584:7476%4]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 15:09:57 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dakr@redhat.com" <dakr@redhat.com>
Subject: RE: [PATCH] drm/gpuvm: merge adjacent gpuva range during a map
 operation
Thread-Topic: [PATCH] drm/gpuvm: merge adjacent gpuva range during a map
 operation
Thread-Index: AQHbCeiv/exosdoE+UiE7MOgODL4jrJd3+6AgAFQVKA=
Date: Thu, 19 Sep 2024 15:09:57 +0000
Message-ID: <BYAPR11MB315944FFB3DE254952FE298592632@BYAPR11MB3159.namprd11.prod.outlook.com>
References: <20240918164740.3955915-1-oak.zeng@intel.com>
 <ZuseA6s2nip+PbTC@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZuseA6s2nip+PbTC@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3159:EE_|SA2PR11MB5131:EE_
x-ms-office365-filtering-correlation-id: a9f70fea-dcdb-4e6c-248a-08dcd8bd201d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?qwyzD/plPFZs/w241udIzy8JGS4/lbBZoaeA5mfwsqy+GLUJSyeZfZxyp+xF?=
 =?us-ascii?Q?qSlJZG6VlYGM/vKvVCrjEx6weeqRXtqz4UhBnVbekyJ4pCt50GzFvmHevVAD?=
 =?us-ascii?Q?/gjrDEfiUOfxHZFHsapYAm/xjPU9Gwft0Qqzy4efLn4qftnALeILybPH3GSy?=
 =?us-ascii?Q?VmbGxDMUN55EbVsmh3UNpHf7UnJiwD9H+FhxLO/8/AAqpyCR0b+Jtjs907ko?=
 =?us-ascii?Q?4pB91kNt4d+XMqS4UyE/oILtIazbaEEqTFiFDhejANT/e1sgEwpg3G9lVGOZ?=
 =?us-ascii?Q?lo5QXIkEcMUFQHu0OzRqLObDk8S/txdWyLz0xoI23JXPxvFuhmI6dWNv7mat?=
 =?us-ascii?Q?ztjbzKecmTggu+tvVTlPo1gksaaNDiCcDPkYj3oYM2coDrV6eH95w2IIha2y?=
 =?us-ascii?Q?TIGoKbzmk2Do1rmSrxlLDFn1YOFD9qBuldY/UkiaRjIeeuORIf81g0BaYjRa?=
 =?us-ascii?Q?fnN7lwDYI/bAFvaKPxwIYDS2dCX16QiGe67htjZDeXEJW1doRMzMC5phEw9p?=
 =?us-ascii?Q?G+TrlfQHNDycae3l6pWJslfuajpRjTJPc/EvTCzX5F80GjJ9ZCsJdWxgCqAB?=
 =?us-ascii?Q?6i+CR4p8aRDlCKptJ6NuorlHPSo1lt3E28ol7PuRq7pI0oTHiZ54Oyw/+HSp?=
 =?us-ascii?Q?58T3p7Pi8OrEcHYPZO0y2saOp2T5GFynBJ/c1Cpz3tZfOHCuBquvw5HeCW7W?=
 =?us-ascii?Q?hBuuvSUDzBGlAR6tw8+LsQBIknk5kpT6o9KBMj5ECBns+8QmL48MUXGmHF5+?=
 =?us-ascii?Q?H7l89NReGGotUlJgH1a2xbeftPZbpa+l3zLqna3De3vqwaC+iGXEsT2sWiOG?=
 =?us-ascii?Q?oMj6PHfuz9Zux6Po/2qJ1H1324SswThzz2+hg7C0F/6pCnDqj3Y2SVEhcKGG?=
 =?us-ascii?Q?yTXc2V4XoeekP8Jm1wZ+RvtUNti2z0XXZN+KxLkJ+HjOt36XLI1nmqQniQhl?=
 =?us-ascii?Q?TGl6m+m1bJykgNwtMO1lkTt6C5lom/N2NcMYppWPvEPpm2IdHJ/FjQflEyC5?=
 =?us-ascii?Q?a/VbUqyyGjHjwOR06uo074PIjaKWl8DHndgQFpjlxviD2RRUAZAiBvmZ/kN/?=
 =?us-ascii?Q?u+38CkDfEUR9t5XLdugTD9kHUAgcpSV2UMgiyDZU1e8j9ookY99oqTulitWs?=
 =?us-ascii?Q?TxJ1lN0/VbPLf/+94nbMKNU63j/kkcmU9YeP7ooX3q7vnB00/IpTCmfmRMFi?=
 =?us-ascii?Q?txHSmXMFYF/R1FtwPwH+XIn3COlth3PEgzvBRKoxVcYI2bs/1+qSz3V2zs7B?=
 =?us-ascii?Q?+brLaXiNsREmsDLICoots5vtle0GpahGEmc11s3HPWjEB3fto0258uYTxcqS?=
 =?us-ascii?Q?iws7qQCjIXVFHJLza5Gg6SusKakKnsAfzYrnCbhO0YKxig=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3159.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8LCdIljQNd0GW2zgADW8ZzDbXvfDaR5bXwLriIBtnvdHrEmnluS207QCc8kB?=
 =?us-ascii?Q?SBDJyzttsH5TauQHQ5wZzxOP4n+pDlURDM/1amrVxGyfsXMLzhSxT6oPog9d?=
 =?us-ascii?Q?MqKiZ070tH2t49rngdSpbjuuIw/lc7YvVKv6ICQu3Gjmzz73X8dmylIlV24F?=
 =?us-ascii?Q?Pc/bQ/HQSZaKG1skbhcgQ+6BCHEOnGSFgGM6GU+eivZVJkQxwIW+yudo+cjQ?=
 =?us-ascii?Q?MI9rhG7Rralz63VEMQKd42kshSuqbBt6P0nRi+C/tVeHZ0we9pQz+1o5CZCm?=
 =?us-ascii?Q?+d5BgfOkEJSAgYQFRS+Jwma60TGorIMadhP9vKPt7NBXAmZUhG90YeWGK6kv?=
 =?us-ascii?Q?x3rdzRTvyZ4R7RCXuzh+C+LwDHzybBh7WtPcbWiyGEey/NPh/jUfdXNWN+mO?=
 =?us-ascii?Q?koMf1DJcaEYNwbGeLIy/ivyrZgokybJlHBth8G8YvrbKR52C1Q9zM6DqlXFi?=
 =?us-ascii?Q?ie8B4KwX1uCU2Fzd568gd3P3LmctoZfSE2mnEX2XT9WZ6r8yppzhy7QiX1nS?=
 =?us-ascii?Q?bWDaqtHmiqKSiOxbO4rH1XnpkGf7s16NF+TBSZ2xrjt5l7zeer8ieARbhHD1?=
 =?us-ascii?Q?PxsvSgIzC6Hma6XOWu0qP576zonS9WBgEyacIvwLE+J5WpGzhPFX3IQrFLs5?=
 =?us-ascii?Q?e+o7PjTI9QaopTOYHygcVZHSxc3sJK37NccLXLgWGQ7ZHpLhoVttMKFZWDAF?=
 =?us-ascii?Q?ZPV8CNwfzU4lICcpoHeLc71zomcQc+WGE8vtTydD3BMdbryeHTiXHD5lLra0?=
 =?us-ascii?Q?Qzdf1AQRzCbXmt8Ib0A96Q6kRkJL4smAUoM0Qgk4R+aRZB+5hw9XfqqTQKi4?=
 =?us-ascii?Q?b/9qrkQqT/hGKJlBFDK1UHJjEhT1+jqvib8TcRigPoYq1VFcSLBM880pLJTK?=
 =?us-ascii?Q?3LE0tvSHRmnpNcOeeXWIj6aagUQhHa76bGKqr4ekGNfSNSkS8nBHGiFNbb0S?=
 =?us-ascii?Q?FfJbA3cDjaJy+fgA4ltZ+aRiHK0BCKoBwtTdvWo/8HYOryiHXoLZwPhoYDB+?=
 =?us-ascii?Q?K2ZRnFpuTemw5JYTaik7pEIuxoqXFX1xDA8ADdVzm44O0zIYYWu/4GUlEpDU?=
 =?us-ascii?Q?W9Y7TqrXy8P0ZEa98QPLXh5tnhwnUuuadLrNsggtgOvrE23nFjO9lno4TxBx?=
 =?us-ascii?Q?9nDTrL2e+a09BjrKoZlwBZ06VhCy1gxJ1kTsGnnpRdiACAGE6Pms2FHQTofd?=
 =?us-ascii?Q?XeHvbj0NyPg9DhMgS2g3VpIszOVWLXdHW/JSK5jEA5vB0wgmvgXr1TjSz/LR?=
 =?us-ascii?Q?zGnbVLvDCm4LAhB8sq8XIUWbsF0VPlxGTraMmo+6cQkWqk5NXJJdUPcItcr/?=
 =?us-ascii?Q?L+9+79ebyPoXZZrIJDJ6zSMm1v42ixCdDq/BwSFfXQB29sQqhjj/g6OUxfKa?=
 =?us-ascii?Q?xOK9HezsxfbZOtoqaPO9A8hQp+j8UyqYXw5r9hcd25XVk/77qdLjfJ0GHSFX?=
 =?us-ascii?Q?50hWHsteCEktUQn2/EAFlmFEtnPYP11ySLZR72CFbqPJOUWBL72Pxs/AsI7D?=
 =?us-ascii?Q?aDxa+OdMA0rFgD0y1s8LpFIDeG0XXA9WBRDuOYng0TkTTmFBdw8vNyKPya8B?=
 =?us-ascii?Q?jCAJBtgDm4mGFO1g/gM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3159.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f70fea-dcdb-4e6c-248a-08dcd8bd201d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2024 15:09:57.8871 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r+h3r0en+bMxiTeFu9wKevsbGTj0IDgDV2ro83Y2skNb4i0ijThQdlUpytORKMGYGODJFNExtCnmO6IC/do5og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5131
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
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Wednesday, September 18, 2024 2:38 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; dakr@redhat.com
> Subject: Re: [PATCH] drm/gpuvm: merge adjacent gpuva range during
> a map operation
>=20
> On Wed, Sep 18, 2024 at 12:47:40PM -0400, Oak Zeng wrote:
>=20
> Please sent patches which touch common code to dri-devel.
>=20
> > Considder this example. Before a map operation, the gpuva ranges
> > in a vm looks like below:
> >
> >  VAs | start              | range              | end                | o=
bject             |
> object offset
> > -----------------------------------------------------------------------=
------------
> --------------------------
> >      | 0x0000000000000000 | 0x00007ffff5cd0000 | 0x00007ffff5cd0000
> | 0x0000000000000000 | 0x0000000000000000
> >      | 0x00007ffff5cf0000 | 0x00000000000c7000 | 0x00007ffff5db7000
> | 0x0000000000000000 | 0x0000000000000000
> >
> > Now user want to map range [0x00007ffff5cd0000 -
> 0x00007ffff5cf0000).
> > With existing codes, the range walking in __drm_gpuvm_sm_map
> won't
> > find any range, so we end up a single map operation for range
> > [0x00007ffff5cd0000 - 0x00007ffff5cf0000). This result in:
> >
> >  VAs | start              | range              | end                | o=
bject             |
> object offset
> > -----------------------------------------------------------------------=
------------
> --------------------------
> >      | 0x0000000000000000 | 0x00007ffff5cd0000 | 0x00007ffff5cd0000
> | 0x0000000000000000 | 0x0000000000000000
> >      | 0x00007ffff5cd0000 | 0x0000000000020000 | 0x00007ffff5cf0000
> | 0x0000000000000000 | 0x0000000000000000
> >      | 0x00007ffff5cf0000 | 0x00000000000c7000 | 0x00007ffff5db7000
> | 0x0000000000000000 | 0x0000000000000000
> >
> > The correct behavior is to merge those 3 ranges. So
> __drm_gpuvm_sm_map
>=20
> Danilo - correct me if I'm wrong, but I believe early in gpuvm you had
> similar code to this which could optionally be used. I was of the
> thinking Xe didn't want this behavior and eventually this behavior was
> ripped out prior to merging.
>=20
> > is slightly modified to handle this corner case. The walker is changed
> > to find the range just before or after the mapping request, and
> merge
> > adjacent ranges using unmap and map operations. with this change,
> the
>=20
> This would problematic in Xe for several reasons.
>=20
> 1. This would create a window in which previously valid mappings are
> unmapped by our bind code implementation which could result in a
> fault.
> Remap operations can create a similar window but it is handled by
> either
> only unmapping the required range or using dma-resv slots to close
> this
> window ensuring nothing is running on the GPU while valid mappings
> are
> unmapped. A series of UNMAP, UNMAP, and MAP ops currently
> doesn't detect
> the problematic window. If we wanted to do something like this, we'd
> probably need to a new op like MERGE or something to help detect
> this
> window.
>=20
> 2. Consider this case.
>=20
> 0x0000000000000000-0x00007ffff5cd0000 VMA[A]
> 0x00007ffff5cf0000-0x00000000000c7000 VMA[B]
> 0x00007ffff5cd0000-0x0000000000020000 VMA[C]
>=20
> What is VMA[A], VMA[B], and VMA[C] are all setup with different
> driver
> specific implmentation properties (e.g. pat_index). These VMAs
> cannot be
> merged. GPUVM has no visablity to this. If we wanted to do this I
> think
> we'd need a gpuvm vfunc that calls into the driver to determine if we
> can merge VMAs.

#1, #2 are all reasonable to me. Agree if we want this merge behavior, more=
 work is needed.

>=20
> 3. What is the ROI of this? Slightly reducing the VMA count? Perhaps
> allowing larger GPU is very specific corner cases? Give 1), 2) I'd say
> just leave GPUVM as is rather than add this complexity and then
> make all
> driver use GPUVM absorb this behavior change.

This patch is an old one in my back log. I roughly remember I ran into a si=
tuation where there were two duplicated VMAs covering
Same virtual address range are kept in gpuvm's RB-tree. One VMA was actuall=
y already destroyed. This further caused issues as
The destroyed VMA was found during a GPUVM RB-tree walk. This triggered me =
to look into the gpuvm merge split logic and end
Up with this patch. This patch did fix that issue.

But I don't remember the details now. I need to go back to it to find more =
details.

From design perspective, I think merging adjacent contiguous ranges is a cl=
eaner design. Merging for some use cases (I am not sure
We do merge for some cases, just guess from the function name _sm_) but not=
 merging for other use cases creates a design hole and
Eventually such behavior can potentially mess things up. Maybe xekmd today =
doesn't have such use cases, but people may run into
Situation where they want a merge behavior.

If we decide only merge for some case but not for other cases, we need a cl=
ear documentation of the behavior.

Oak

>=20
> Matt
>=20
> > end result of above example is as below:
> >
> >  VAs | start              | range              | end                | o=
bject             |
> object offset
> > -----------------------------------------------------------------------=
------------
> --------------------------
> >      | 0x0000000000000000 | 0x00007ffff5db7000 |
> 0x00007ffff5db7000 | 0x0000000000000000 | 0x0000000000000000
> >
> > Even though this fixes a real problem, the codes looks a little ugly.
> > So I welcome any better fix or suggestion.
> >
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > ---
> >  drivers/gpu/drm/drm_gpuvm.c | 62
> +++++++++++++++++++++++++------------
> >  1 file changed, 43 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_gpuvm.c
> b/drivers/gpu/drm/drm_gpuvm.c
> > index 4b6fcaea635e..51825c794bdc 100644
> > --- a/drivers/gpu/drm/drm_gpuvm.c
> > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > @@ -2104,28 +2104,30 @@ __drm_gpuvm_sm_map(struct
> drm_gpuvm *gpuvm,
> >  {
> >  	struct drm_gpuva *va, *next;
> >  	u64 req_end =3D req_addr + req_range;
> > +	u64 merged_req_addr =3D req_addr;
> > +	u64 merged_req_end =3D req_end;
> >  	int ret;
> >
> >  	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req_addr,
> req_range)))
> >  		return -EINVAL;
> >
> > -	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm,
> req_addr, req_end) {
> > +	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm,
> req_addr - 1, req_end + 1) {
> >  		struct drm_gem_object *obj =3D va->gem.obj;
> >  		u64 offset =3D va->gem.offset;
> >  		u64 addr =3D va->va.addr;
> >  		u64 range =3D va->va.range;
> >  		u64 end =3D addr + range;
> > -		bool merge =3D !!va->gem.obj;
> > +		bool merge;
> >
> >  		if (addr =3D=3D req_addr) {
> > -			merge &=3D obj =3D=3D req_obj &&
> > +			merge =3D obj =3D=3D req_obj &&
> >  				 offset =3D=3D req_offset;
> >
> >  			if (end =3D=3D req_end) {
> >  				ret =3D op_unmap_cb(ops, priv, va,
> merge);
> >  				if (ret)
> >  					return ret;
> > -				break;
> > +				continue;
> >  			}
> >
> >  			if (end < req_end) {
> > @@ -2162,22 +2164,33 @@ __drm_gpuvm_sm_map(struct
> drm_gpuvm *gpuvm,
> >  			};
> >  			struct drm_gpuva_op_unmap u =3D { .va =3D va };
> >
> > -			merge &=3D obj =3D=3D req_obj &&
> > -				 offset + ls_range =3D=3D req_offset;
> > +			merge =3D (obj && obj =3D=3D req_obj &&
> > +				 offset + ls_range =3D=3D req_offset) ||
> > +				 (!obj && !req_obj);
> >  			u.keep =3D merge;
> >
> >  			if (end =3D=3D req_end) {
> >  				ret =3D op_remap_cb(ops, priv, &p,
> NULL, &u);
> >  				if (ret)
> >  					return ret;
> > -				break;
> > +				continue;
> >  			}
> >
> >  			if (end < req_end) {
> > -				ret =3D op_remap_cb(ops, priv, &p,
> NULL, &u);
> > -				if (ret)
> > -					return ret;
> > -				continue;
> > +				if (end =3D=3D req_addr) {
> > +					if (merge) {
> > +						ret =3D
> op_unmap_cb(ops, priv, va, merge);
> > +						if (ret)
> > +							return ret;
> > +						merged_req_addr =3D
> addr;
> > +						continue;
> > +					}
> > +				} else {
> > +					ret =3D op_remap_cb(ops, priv,
> &p, NULL, &u);
> > +					if (ret)
> > +						return ret;
> > +					continue;
> > +				}
> >  			}
> >
> >  			if (end > req_end) {
> > @@ -2195,15 +2208,16 @@ __drm_gpuvm_sm_map(struct
> drm_gpuvm *gpuvm,
> >  				break;
> >  			}
> >  		} else if (addr > req_addr) {
> > -			merge &=3D obj =3D=3D req_obj &&
> > +			merge =3D (obj && obj =3D=3D req_obj &&
> >  				 offset =3D=3D req_offset +
> > -					   (addr - req_addr);
> > +					   (addr - req_addr)) ||
> > +				 (!obj && !req_obj);
> >
> >  			if (end =3D=3D req_end) {
> >  				ret =3D op_unmap_cb(ops, priv, va,
> merge);
> >  				if (ret)
> >  					return ret;
> > -				break;
> > +				continue;
> >  			}
> >
> >  			if (end < req_end) {
> > @@ -2225,16 +2239,26 @@ __drm_gpuvm_sm_map(struct
> drm_gpuvm *gpuvm,
> >  					.keep =3D merge,
> >  				};
> >
> > -				ret =3D op_remap_cb(ops, priv, NULL,
> &n, &u);
> > -				if (ret)
> > -					return ret;
> > -				break;
> > +				if (addr =3D=3D req_end) {
> > +					if (merge) {
> > +						ret =3D
> op_unmap_cb(ops, priv, va, merge);
> > +						if (ret)
> > +							return ret;
> > +						merged_req_end =3D
> end;
> > +						break;
> > +					}
> > +				} else {
> > +					ret =3D op_remap_cb(ops, priv,
> NULL, &n, &u);
> > +					if (ret)
> > +						return ret;
> > +					break;
> > +				}
> >  			}
> >  		}
> >  	}
> >
> >  	return op_map_cb(ops, priv,
> > -			 req_addr, req_range,
> > +			 merged_req_addr, merged_req_end -
> merged_req_addr,
> >  			 req_obj, req_offset);
> >  }
> >
> > --
> > 2.26.3
> >
