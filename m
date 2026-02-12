Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37261EDF02F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 04:49:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C647810E190;
	Thu, 12 Feb 2026 04:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HEw8cSMX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9948E10E190
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 04:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770871748; x=1802407748;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XIYJWe+FBOfuVXmUBacaxTjcME1CMIwU4043zXLwLcg=;
 b=HEw8cSMXHnZckt2D07PeGwVCqJ2f9tUoUWTSBIwvYtFSF4WXLLHD+HWf
 Vufy7n6sNlNapvPuGpO7UNdwKVQ99qKjyTlMTeGK3ie4x4rhYFW1THORa
 tdIgLiPchkxOosU6TCKXA/D65Y6YXkkeYGvjXylnOFJM7kGicU+kLu0K7
 G+cP5WVh2VmGMZO5haC3NRc9sHoloFbjFwPXpfcizohwCEdtX7FLQJic4
 UWj4ht6unTfnHdTGykbH7DxvVKuOvxOJMXhqg/p2N0FzllBIz/DAKCbp2
 IAeJDurDQf0WtmmEf5Hu45v6ODwdL1kEDT2mspwINIOBok4HMEBW6/nmc A==;
X-CSE-ConnectionGUID: NQZ6bO2RTK6H+uvKxYBG1A==
X-CSE-MsgGUID: CJBmkekkRJaAq0U/UDf9rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71241016"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="71241016"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 20:49:08 -0800
X-CSE-ConnectionGUID: cZMAQXveSB+uU+IZttkk5A==
X-CSE-MsgGUID: 9s6ftUcURPKuoVimrINQPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="212011813"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 20:49:08 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 20:49:07 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 20:49:07 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 20:49:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aLOMPbJC1VjdUS/hPPx0/juKC5QxoCxoG4aAjNJUoOCa+iIcCSOdHZCefCGvkQS1fsrf9CZsLxBZNGvjWBbM/Tqt2ms2gjTcbAc3UQGQ16BIT5hLeDrrSLVgNH3vcyf1HKGayi/Gx6myhj0U3D0w2fp4Crp+faTKlrDrc5Keezg6HCma2YDBDFB2fHPJ0Qeu/DNTTAD3pp2dGob3osStYwKJKTi7S49yZLxuhI/LwKhw/CARVHtZk1VgOWT99n2AK4WVip0HZmy3NkXbg6J8jUevphr9EAxyTcHH/gTMt/4XNV/TaK0fuRvyGVInw6dsDeA6jX0vBxrcp9usfML4HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FL9jkK6aE02ZgPOJGsWzYYdbsPkqcd8Go3DBVa1VItQ=;
 b=bw3roqoTJm5+X1D8OkS5US3IuwY//l+34lFhVt3kE6L4braQdzDs3f3PdsiNKYh6LPWHz7kK4xg3Y4so+LE8IvjInEPEQE2ZuKDhZmo5B8Ij5AABSnzaVpREHA4pYypBRwcKaOCd8RasRLNBn2LUPNW8wLePpK5YKvtX+xM+KVlgw+toO8Z6pypTihoA4pP0TsLtQn8DpulntjGY7Viofir/ePL9DaTX7j3qnbSsMXP2iLUY2ONM6cVfLoRQU6Wp9B5A5g1ukphl6g7c1kxanRJJwtrsD/o53C7/cOw0iLbAxzNqyb+tFVUVGJ5bpq7rFFORpCvrCDDg0p/JIVSuGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DM4PR11MB8129.namprd11.prod.outlook.com (2603:10b6:8:183::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 04:49:03 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437%6]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 04:49:03 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [RFC PATCH 1/5] drm/xe: Implement VRAM object tracking ability
 using physical address
Thread-Topic: [RFC PATCH 1/5] drm/xe: Implement VRAM object tracking ability
 using physical address
Thread-Index: AQHcmxOwxRPlqXEdyU+MDXivNAHm8rV9CJiAgAF20qA=
Date: Thu, 12 Feb 2026 04:49:03 +0000
Message-ID: <SJ1PR11MB6204AA2031806C6D2471FB3C8160A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20260211050132.1332599-7-tejas.upadhyay@intel.com>
 <20260211050132.1332599-8-tejas.upadhyay@intel.com>
 <aYwhHQIhkm4Fag+d@lstrano-desk.jf.intel.com>
In-Reply-To: <aYwhHQIhkm4Fag+d@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DM4PR11MB8129:EE_
x-ms-office365-filtering-correlation-id: 892d891f-c79c-4111-0f6b-08de69f20bc5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ndWxUEGnaIscjdJbgnA8C3ficMA89YqEPZnkBP9WB3ysO/Bnqiczo2PfRqyp?=
 =?us-ascii?Q?HuBqtueBqxipnvMera+MtYeQR9+5XMcoNI6Ei72mF0iJxwzGJgC8gG4So7qj?=
 =?us-ascii?Q?m1hLqWTv3vVLYkR149IrgO/HSnM27MIEJWA5GgXjXbf1Lw7aDi8KPGHSFG/J?=
 =?us-ascii?Q?A6EnVrV2TAMBIkskk9MFfD4se9BLjcBXec5pkMDG5j9n8uSdBevpnrA9rBpk?=
 =?us-ascii?Q?Zo+qZXhRxXRHZIyxQgRKAQWF3+d3Y4ACJClFJ5/lKgpNA65gTT/2lvIQ7Vud?=
 =?us-ascii?Q?crRWSL+A831tfDcr8wr0ia9DWhohmC5YgJIaE41L+/BI4Q/y0HXC4Q8wayEG?=
 =?us-ascii?Q?HjEJ147um8jvLQfKoQlGUX+DpaEKMejyTWFFkLqtCC7bt1KONv9gqukCn6Gh?=
 =?us-ascii?Q?rveHGjZyc+HcJP2vpRhgz7MMILx+oNVSfhmef5spIIeUIfsQNbpXkWec9AK0?=
 =?us-ascii?Q?CwwSfpyVIdqyJW2yIVAbMEKx8fxI5hV0z+JOI1OIPufpdnFlXHFVBOUsgpZ5?=
 =?us-ascii?Q?FR7KOGLy3MdnvnRqpdyukzpw1VQH9FjjwkF6Lx4DpMBF4XpIN3KLNh3eNHZY?=
 =?us-ascii?Q?hfXq/1Op2fT1ITsPT/WQ+IcAzLivii9LhMeXS+R8s0hyEw/2h6e8upirx5KS?=
 =?us-ascii?Q?oTvIVh/xj7ND/QnZ392wCX24q4FcFtlcqnSkFRboZoppG8IvgWMTD6DUgefS?=
 =?us-ascii?Q?N9yCQR8u5po+6HqTN7Pawka0mArIogqnsLfzclA8mwkyup5P+0D57CfK1gfG?=
 =?us-ascii?Q?iPPqtM0gM4X0Z4ET1Jgp0JpVNQRcWxwZChNEOwwCYw28G5N500GdJWop9Xq9?=
 =?us-ascii?Q?29wAGCPrTt3AwDHUesW6naLNFOGqEGpIAkeKYi8zv4AWhmxrR+JPsBv06r5H?=
 =?us-ascii?Q?C6YE+7eb33ZB21TnODVFbwKQET+gIkErqRZ1ysw2vdZ5vkLJ9qO0FNqfQpVy?=
 =?us-ascii?Q?MU8tYXd0JvMKjKjEZsYnd6v4jChpBPJ8kOYLduTqlxcVN2PWXgYwmQzsSzyV?=
 =?us-ascii?Q?IC2RdcSVqFZKbNpAJl2ifKIDvqPppj13zxqdiItV47gXjo98SBbbnRq/1LWK?=
 =?us-ascii?Q?G+KRrYIDGh8DQCmmUTxDrO7cCvI/C4VKLf81199w9z5U/QhDz6ovR9OGBeQW?=
 =?us-ascii?Q?MGWMXaPjnzNqoltfdhBU0Jv9xhWILA3v5a11VVIhiyPtGDeFR6xlYh/OemE0?=
 =?us-ascii?Q?L87MYcMGHaH4r/zvoYAfWi4Ucrss/JDSwczSwyi3uCibOj0CQ4LrzFxw+w/d?=
 =?us-ascii?Q?OXiB46LI4ySY3vnU6gCvicOjxF5J/2wjzeALnI62r38Xprwt8D/1gdZcH81V?=
 =?us-ascii?Q?rJsW31yF8kVPV5Ne4bBRFp2QevJJxBgq6HJ10DyjSwm8JFcpeabSLh3rRjrh?=
 =?us-ascii?Q?BHMYL/D8uClZ+Tl89AgFN30/ks2DNf0D+wxGSMRjlhsg5FvS4bROBXupHdqP?=
 =?us-ascii?Q?yxC/zqbNh03XjKYRsCw1uv/Yc5xolr31sxixhhXzA/EPaQQPInxXcIPKNd2a?=
 =?us-ascii?Q?Bd8uOX1h8pew3EKGOladqmg4/gisDFHr4R4Ofb6K1gg5IkXZNAgsoOaJhHSI?=
 =?us-ascii?Q?wXArtVFaSR8L/t5lo5TBja9nvHjZbvWq4thTpy57uq9JJYQgq4CSl/0weYLf?=
 =?us-ascii?Q?GDLzY9SOfok3ZKwvTT0yH0o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iKJKlWasuTV8NUA1T1j/wW70XduP2bBhLba2ABGBOPCjobF7q5cd3DMfbYYP?=
 =?us-ascii?Q?G0mJpogM0hPP4tbdF40/4EqegH8ox2D5VPyPzKWCQOQpyfsWifRyhRGNV8QB?=
 =?us-ascii?Q?L1752o00xKsQaDanzPtLSYG6wQ6stfoyJTS73HxxSyjHDv6QXahN66VweUdd?=
 =?us-ascii?Q?U9g/r4ExmD0a1kYP17ivx2GiDTRO0yoXuaKuc+z8/Fh7Sms9CDO+qwzBK0Mu?=
 =?us-ascii?Q?oxMJNyk5qBBnrt061UqNOgQ/fPMva31/ju4MKFV+lgr6L1qLFyXKySwteWGi?=
 =?us-ascii?Q?oZ9auudUhwpl9kh5suFIPALwzoICr9KUiB6G0Wgiv9r+WnD2PnPBY7n3cCDf?=
 =?us-ascii?Q?3aCYPPigkBXzPcq0YGTag4DF+lHKb3n48bAHvr0bAtQGPvluJlj2oZ2TugjQ?=
 =?us-ascii?Q?GWRRRNeR8kOLrc8xbl5DyVpPF18pWfVjlFRD3305Z0xlnyEp4mmAur2tf/OE?=
 =?us-ascii?Q?lOeIofmCwKLjKlwDCvBWzN5w7L120Pm7KS/4Ve05b1J8zNzxfJiGoKOo4XOY?=
 =?us-ascii?Q?38adzZOTINbxl5Dj96+rCScH4qtST8Hi42bgUyi4H4WRf3TVlrdEVwaXCHxs?=
 =?us-ascii?Q?F4Icz30IO0gihLps/iVBSjl7EE1B8BqyOJ0BlcqHfdhcke+/BAOxLZUfKrDQ?=
 =?us-ascii?Q?j2QXipFDLDov3bNscPA6xMPuxIka8N2Nys/sNtIJ/QMlt1vNLxafbvKY213a?=
 =?us-ascii?Q?82M2XP8uF8NMPcsGTFO0WY9H1uuyYyvqcyt1+vTFuqSQLcEtbRT7rykbaF36?=
 =?us-ascii?Q?m5ObStx9pg9BpzZ34/SI/8JTc1Eu6nYiHAO6WsY16w+yDg5gdlGJcCu/GO+a?=
 =?us-ascii?Q?ZFuvZn7c0geA9S6MW+OZ228C4frgUrHd7B5SlR6LIcD71GYLcGJH/aV1RFZf?=
 =?us-ascii?Q?6zJKKV6EQqVGvuUpEoSIoPHWnqeuLY9wUwJnz6xs/flvaBsbfHP/UXnE20XZ?=
 =?us-ascii?Q?8MUnTm7V9p/kgTjNKthh8e26elKzZYhjJmF1xdG1S5VWybgolmB/EFFxJRSp?=
 =?us-ascii?Q?OnW+aWus161I0yw1+6H/nh7dSSvTGl087J60C/9SoMkhIp8gwjTe3aG042LC?=
 =?us-ascii?Q?Nqs45sA55HwdWVA0hycpF8NvNDjg9D2WF5vwt2tF0XbkbZ5z/EPM3CGrL4/C?=
 =?us-ascii?Q?UAPjrJbIdbeyh9pyHovo7CDQAXJ90FU5sFHEai0GlOnqdaCRApSJZ5LLnA2L?=
 =?us-ascii?Q?rrjKrKsPw39duL0sUPOpGQtVd8ymupdcGyeUJ0c9U1ML2dZqOxcO51zsxKOv?=
 =?us-ascii?Q?gP8hh8plBElRdIUlkVIX+83vf7aagaL2rKn0uWmLLhpRnj74EPWibjACiUrt?=
 =?us-ascii?Q?a2lM5KtCjd2d1KMjMmlxEzupCm6sF4oLE0MA8wBmj5rzQjpWq00Yu4ifWnLR?=
 =?us-ascii?Q?UHt2rSNTh1rfRvRET/KyuCScqdQhVqF5xK28gpzSGHRv2RI7AC9xAozh2ryo?=
 =?us-ascii?Q?ICKCDzK7C08d1sAkiXnnAWxtQLYx9TJiF3mJLdsI8vVzJbEd9qV9odIUFXOx?=
 =?us-ascii?Q?1NKi+7jk9Zv95LB9qcUMhR4NMnUr7iFgdPsvzCi5uGVs5tPgdonU02jMtCqC?=
 =?us-ascii?Q?0JDE9kC3ib0Pr+RAo3LeB2wKwEnqxSuIEFWwKmKWv4b2tx1/dSaq2TBLJ5AN?=
 =?us-ascii?Q?3UouVs/kgR76q+d23n9mSQCvGDPqyKshQS+AvZ7m9xgyYR1C7uH+Y7dLg/Gw?=
 =?us-ascii?Q?aRtg+8/Jh0i//951CUCysyjLLXZhhQ1eFNkd6WcAw/MENSkKCDVukzsRDbVl?=
 =?us-ascii?Q?34iaT9yV0w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 892d891f-c79c-4111-0f6b-08de69f20bc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2026 04:49:03.3063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l1D+QeIvYtFPBNcGe8nzo0K5SnyJD5C9/4/4eeRMuiIU3Bxmx0CBHutzyDXaUeweiPk3Wp7FS9xurdw9uSfOpYac+26SZ+B5hn5wdchgHjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8129
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
> Sent: 11 February 2026 11:57
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Auld, Matthew
> <matthew.auld@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: Re: [RFC PATCH 1/5] drm/xe: Implement VRAM object tracking abili=
ty
> using physical address
>=20
> On Wed, Feb 11, 2026 at 10:31:34AM +0530, Tejas Upadhyay wrote:
>=20
> It will take a bit of time to get through this but spotted an issue.
>=20
> > Implement the capability to track and identify TTM buffer objects
> > using a specific faulty memory address in VRAM. This functionality is
> > critical for supporting the memory page offline feature on CRI, where
> > identified faulty pages must be traced back to their originating
> > buffer for safe removal.
> >
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 75
> > ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |
> > 2 +-
> >  2 files changed, 76 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > index d6aa61e55f4d..4e852eed5170 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > @@ -56,6 +56,7 @@ static int xe_ttm_vram_mgr_new(struct
> ttm_resource_manager *man,
> >  	u64 size, min_page_size;
> >  	unsigned long lpfn;
> >  	int err;
> > +	struct drm_buddy_block *block;
> >
> >  	lpfn =3D place->lpfn;
> >  	if (!lpfn || lpfn > man->size >> PAGE_SHIFT) @@ -137,6 +138,8 @@
> > static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
> >  	}
> >
> >  	mgr->visible_avail -=3D vres->used_visible_size;
> > +	list_for_each_entry(block, &vres->blocks, link)
> > +		block->private =3D tbo;
> >  	mutex_unlock(&mgr->lock);
> >
> >  	if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) && @@ -
> 467,3
> > +470,75 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manager
> *man)
> >
> >  	return avail;
> >  }
> > +
> > +static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2) {
> > +	return s1 <=3D e2 && e1 >=3D s2;
> > +}
> > +
> > +static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2) {
> > +	return s1 <=3D s2 && e1 <=3D e2;
> > +}
> > +
> > +static struct ttm_buffer_object *xe_ttm_vram_addr_to_tbo(struct
> > +drm_buddy *mm, u64 start) {
> > +	struct drm_buddy_block *block;
> > +	u64 end;
> > +	LIST_HEAD(dfs);
> > +	int i;
> > +
> > +	end =3D start + SZ_4K - 1;
> > +	for (i =3D 0; i < mm->n_roots; ++i)
> > +		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
> > +
> > +	do {
> > +		u64 block_start;
> > +		u64 block_end;
> > +
> > +		block =3D list_first_entry_or_null(&dfs,
> > +						 struct drm_buddy_block,
> > +						 tmp_link);
> > +		if (!block)
> > +			break;
> > +
> > +		list_del(&block->tmp_link);
> > +
> > +		block_start =3D drm_buddy_block_offset(block);
> > +		block_end =3D block_start + drm_buddy_block_size(mm, block)
> - 1;
> > +
> > +		if (!overlaps(start, end, block_start, block_end))
> > +			continue;
> > +
> > +		if (contains(start, end, block_start, block_end) &&
> > +		    !drm_buddy_block_is_split(block)) {
> > +			if (drm_buddy_block_is_free(block)) {
> > +				return NULL;
> > +			} else if (drm_buddy_block_is_allocated(block) &&
> !mm->clear_avail) {
> > +				struct ttm_buffer_object *tbo =3D block-
> >private;
>=20
> The SVM code sets block->private to 'struct xe_vram_region' but we defini=
tely
> don't need too as there are other ways to look this up. Want to fixup xe_=
svm.c
> in an independent patch to setting or looking at
> block->private?

Sure, will have a look.

Tejas
>=20
> Matt
>=20
> > +
> > +				WARN_ON(!tbo);
> > +				return tbo;
> > +			}
> > +		}
> > +
> > +		if (drm_buddy_block_is_split(block)) {
> > +			list_add(&block->right->tmp_link, &dfs);
> > +			list_add(&block->left->tmp_link, &dfs);
> > +		}
> > +	} while (1);
> > +
> > +	return NULL;
> > +}
> > +
> > +int xe_ttm_tbo_handle_addr_fault(struct xe_tile *tile, unsigned long
> > +addr) {
> > +	struct xe_ttm_vram_mgr *vram_mgr =3D &tile->mem.vram->ttm;
> > +	struct drm_buddy mm =3D vram_mgr->mm;
> > +	struct ttm_buffer_object *tbo;
> > +
> > +	tbo =3D xe_ttm_vram_addr_to_tbo(&mm, addr);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(xe_ttm_tbo_handle_addr_fault);
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > index 87b7fae5edba..1d6075411ebf 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > @@ -30,7 +30,7 @@ u64 xe_ttm_vram_get_avail(struct
> > ttm_resource_manager *man);
> >  u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager
> > *man);  void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
> >  			  u64 *used, u64 *used_visible);
> > -
> > +int xe_ttm_tbo_handle_addr_fault(struct xe_tile *tile, unsigned long
> > +addr);
> >  static inline struct xe_ttm_vram_mgr_resource *
> > to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)  {
> > --
> > 2.52.0
> >
