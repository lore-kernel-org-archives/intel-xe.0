Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B77C982EB
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 18:44:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F13610E135;
	Fri, 16 Jan 2026 18:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jfy/+Kl3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370B810E135
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 18:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768589059; x=1800125059;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YJKRsyFbEmR7xtOVs5LROnmm9aAevd0QIYlemlgiyTA=;
 b=jfy/+Kl3uCYMyISQAJPRgS5MAj//F0Jb4eLj4battDmC2gemFRmAyJep
 YCl89/8wEPy/m7PLnfF2CTu0ZeNKmzqvRjq1uO83p2pMykC5RSaQ5ZPX3
 QgB9B3PXdw3dHuLja5uD0/jF6wvRXZHDE+SmRugLA4EOaoSex+atT3589
 tMAgY8sn/Oa7S3sviE4FUfeRJpcil72vo/DvH1Jtlji1okRv71roYNMna
 i2kNmg6k4TvhDJTH8LAfUzGJzwRAykMQjqF2tObNwgVy+c6Znd/2S6WP2
 UAlNqjgx0Td4oft7x+isj3c4st2vl++/1PiFYT3TkULUgcl0ThlAEYCA7 g==;
X-CSE-ConnectionGUID: e4bHgCzCRBe6p+LmWJvL+A==
X-CSE-MsgGUID: bU6CHPBbR8aa9yTivBRkSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69810290"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="69810290"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 10:44:19 -0800
X-CSE-ConnectionGUID: ElJyhSJZSbm1Q61Oo0MrkQ==
X-CSE-MsgGUID: b8NLnDnGTVOQAFn0aXXa5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="205743979"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 10:44:19 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 10:44:18 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 10:44:18 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 10:44:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hTdj88BZ7GJn3M9pIzkfah2uEChTw5pksVKf5g+EYYo+66eqL86/HDKgTC1uUGBndWqhqq4x1kAq0v4FmEK41RXjcROJRDpzDQOi6xJrmnmT68pVS5N/LYKAmkJ0Vbd7aO+ms0Yehpwn0a8yvJyrAjbUgmpD1lj+QvaPlS+O6eqwL+Lnqf76Wht1Ohwqkw7NBEspAXAJMS4njxo/dgGmkaF/tSRgFDHACCHGuqK0QSYIWERUA3DacVTjs3XEsOXGZn/nSbZ2kW/xpfhE+a2yCYneGUEG37SJyL8AKAm4Bp9kqPBWJmwhfRUp0Cr4tnfeP3CcR+FzL2XvnxTs0h3Ryw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnie9Onpx8PEdP0ThgPYrEg+cEUu1/3dgZmx4mqvqr0=;
 b=xifGOn/QTPhTyNLKf7SvpZHUheBxbFpS+4NhgYTMZYAxZ2yFARCcH4OqFkcdOjrIExaQAJwvn6iHtnkaiRzmtm+NlJ27Yr/P7MsHaN3eMIoCdvbmWQTNG44Gd++/iBu/NfUqaulwv7rvAyNs21xkKAJHesmG3rLbWTnlsH0c9Htsob30oyFnI5oZhoeWAQwXpRBHN9roJMX7PbjMQKzb3B+5Mi5cQBz/ElHxT4LFilZlzzpadO8p19MtBkaBr+6x4DC3hC2Bg2GYkzslkJCj3iapcpcgfrhVBVLy3PL8kzLYPm7hL+sLGgUS+Ta2GitdrHLna2tHSwylllotw74klw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by BL1PR11MB5953.namprd11.prod.outlook.com (2603:10b6:208:384::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 18:44:15 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 18:44:14 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Usyskin, Alexander" <alexander.usyskin@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>
Subject: RE: [PATCH] drm/xe: Manage nvm aux cleanup with devres
Thread-Topic: [PATCH] drm/xe: Manage nvm aux cleanup with devres
Thread-Index: AQHcgbPHTLVVqytVb0SAHgSRwWyEKLVVIfcAgAAJQuA=
Date: Fri, 16 Jan 2026 18:44:14 +0000
Message-ID: <DM4PR11MB5456E118D59E7C04C5601DCCEA8DA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260109220026.2468067-2-shuicheng.lin@intel.com>
 <SA1PR11MB8839DA5521EE46BF29CC2D64AA8DA@SA1PR11MB8839.namprd11.prod.outlook.com>
In-Reply-To: <SA1PR11MB8839DA5521EE46BF29CC2D64AA8DA@SA1PR11MB8839.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|BL1PR11MB5953:EE_
x-ms-office365-filtering-correlation-id: 6adca8e9-4460-4ae1-4ab5-08de552f3f6f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?x41o1AdaZiAcSqcidGb6MdhUAYhkQkGICx+JzkuLa0c6gUXPE2HsSa+OvBvd?=
 =?us-ascii?Q?Q2mwlDpUqXTYsrtzwrjSCPiO3nUQ/Q0MGpIhBWlqCUlxU/dVH0K7jQizxtk2?=
 =?us-ascii?Q?nQV9kPogHw+ez2SVfJI28zkTPTeQki9bvLgSX48i+4OdZxKtOGZgX4QYKoBy?=
 =?us-ascii?Q?NBU09J6WyAUpAUxAyvzrJRIKddpJ6/Hd+ksW7EN2aHIQL5EZqy+97NrcGsUm?=
 =?us-ascii?Q?fR+rps5ikJaJ2qDS8Y/yHmtnDdChx0bfdCO5VNSEakZbChUQeZK6W4fO0G2L?=
 =?us-ascii?Q?yGbhj2886b+ebmRmsffixlMw4CMPtYAD1o1kjZQmZrkLM2r71gN8gNEXZ9Td?=
 =?us-ascii?Q?bLjwdC+PsTPW7152jVzAK8vuphXNG4DUpnu/tFxEn/jsZA6TsspFM3WaIoAR?=
 =?us-ascii?Q?5jKZK+DdKBaEdoYe593V918L+5E/VKaW2x9HZI3qGxKRywpML1o9opK1nSuC?=
 =?us-ascii?Q?AQhywSKb6y/rrP3VDsovkjadtnDv5XTA5UHBby3HlOAECH9+AxmYHeyhCats?=
 =?us-ascii?Q?BNHcA6ibU+7Qw0C41Mgohks8L89cSApEk1I5MLX7B9dXY41n33Xkca+583Yt?=
 =?us-ascii?Q?P8oBsDhnj6/lTXi3YEtPe3pquvp2h5fBWELMVm/RX6229K5WwOMtwlhO67UB?=
 =?us-ascii?Q?kRmGX0vTAIqGMJO9hXV16KEb0Wi+F0PNj2sn/yh4yz1zCvLwp/7q4CfZbzTE?=
 =?us-ascii?Q?WGFjUtaPSTONRi7Zw72ZhYyCSzRVRgBpXM0axXZwqQLgw7bFv8kYeIv6pKXE?=
 =?us-ascii?Q?PBao4tq7uK+pWmKKhhriF1THTU4+JdfhNe+DPoiUdGe6rCO0gAVMUgAel/tg?=
 =?us-ascii?Q?cYhtD1mbKOC0dB95RTiVc4Obev9+XuKIpEyHab+JjwT/+ePPRtIsghwrnpur?=
 =?us-ascii?Q?npDfafLZuzxF5dRXM7DyqQGj6H7f0KosL0JrZDImn9M1HOg0sq81oXPRFB0z?=
 =?us-ascii?Q?lq1P4e/z49N1PjvMw4f7CGG95/3aINqOzmLp8ysa4B054DaFXSRGLP0QXD8t?=
 =?us-ascii?Q?U9vh3OBVYY96B+l+0ooOKdDVWFQOjtKeszhEN7lVzR0oQ8UKpacttuxNbc63?=
 =?us-ascii?Q?3/54vmP2ce5Ebri8gyxlvZay24UmDLqd/FEM1xyrOWz+kcgaS4WjLJeq5EXD?=
 =?us-ascii?Q?+/puhX9skfmxjzAp75opfoMiozquIF+e6V4/4dxadUvakavJBmBpza9vFkZ7?=
 =?us-ascii?Q?jYMI9JWDTvgEBCMY9QgJYbo7skDC08E1g1yG+otKSWCFXyGEMfIt/feI4Izw?=
 =?us-ascii?Q?eO71Lc9J7REMte3EMGM9NAoWoyxw4wrxwTio4BY5bjbJoIlEy6AcIC0KWutN?=
 =?us-ascii?Q?oBThLUdPi7DR68k5V7uopqdXVQe0VPY6UFz4EBM6GCgLvk1tenjFMHelnAIu?=
 =?us-ascii?Q?WTCiFgkoFQnX5ly0/QGsxUobWJlyP89m1r/YqLlD+euHjan18lK4r7/kIvnK?=
 =?us-ascii?Q?VZoKFWgkTGrlXWaEwuQLFBnpVbldxiPQiafKqssjH3MgPn/lZ/cjJ8m3HxL0?=
 =?us-ascii?Q?lEKrZIj+xwBbqk6gQZM0VNE/HzaVJUH2ZWSoIhoy8+UdS21pXUrMk34fXAIS?=
 =?us-ascii?Q?1Z4B4Ac/E2NGCWjKUh9IP3wUDyRPCX3+7IBNwa05nG+17eAshsEPNPE3ESzY?=
 =?us-ascii?Q?7XqbIEuu85wl9zAw3A8fspU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UWPaon6HAU13LYdLPUN8I2/NaMHWQ9ZByP9yGrlDKFiEy65XvdIx3Zcw4VVF?=
 =?us-ascii?Q?82FsPknrcG1+T3m/h8d20NFiLYpQW+TjAH23F97AbLYpvln0sclbxiDDaiZn?=
 =?us-ascii?Q?l5nJ5u790i4oSOCseLFSZjdMTEFpCyrmXAM3PfJKpxnsmXVsul9Y1hi6irSW?=
 =?us-ascii?Q?HJJtdD8qtTiRLHzqfkNnGazVcVHFpH5ojq6qafKykP0xI2o8EO7bGKKQ3l21?=
 =?us-ascii?Q?0Xrhz5t0onefwl9xAjHnPtr34y2O7XmdqCYtuFnMz0HnxqfRIZOrq8ztJ6RV?=
 =?us-ascii?Q?xxnOX8URnJTM4LWgbo25EPkq2AmzrNvLH3i8TIsXNq6pKShZQyfkuCLrxIT0?=
 =?us-ascii?Q?tMGK8zctA+9VamQIcxC2T78Rp1IWeBAKWD4T4XdxzhikcVgJ4vCvgurMoN3A?=
 =?us-ascii?Q?eo3KeXlU7wJzf3Fglu26ITJEq60+Mc8Xu4HkuYeY9OX6P80tORZFRRFHSMJG?=
 =?us-ascii?Q?UA+wnuLYQLShRX4vjAnXEiJvPaqR0mZISBG4Bu+/8LUjqSG4t4BxhwybR95t?=
 =?us-ascii?Q?baghsqFshbnA+niE5H6EWi/TgybvK1a3+7V+Wf1GemW9lTkWHMpBGOqK4MwT?=
 =?us-ascii?Q?4VLGj7WKnq6vsc+aB/1CTdADUaF4xRe7BQlr4WTdolYVqwLiLOQhZUerZaRv?=
 =?us-ascii?Q?ckqvlCPDQHgfv+Ivz6NBSWDOXUFob0SAqhw3HL7bQ4AmJVg12Olj8enSGRZm?=
 =?us-ascii?Q?CmMoUeZuV3D6FP6nu87mbVDG2hEvQFtD6KRutbKBEQhr8tTKsElyqwMzIMoS?=
 =?us-ascii?Q?HCbT1F0O4rP1JUDKVtjBl4SbQdsQcVTdfvRWi0cBEeSptUSFTHbrRYQwDsLG?=
 =?us-ascii?Q?FFPTXYUcUNyXSTUyjK+9PxIHPjwma8W9TRkRO9bzr01udiiDMH8o9324RjRm?=
 =?us-ascii?Q?ZwXUiBIFp5Kp6NqJvpYpSRXmfCmgIeVQjQiGLOnLpzZLvd/er1NR+RH13kQg?=
 =?us-ascii?Q?KyoOpLMsO1Depwuow0GMfR/iOylZWnhgrJy3OPCDnZv1pRlluom/Q9Ul6BYt?=
 =?us-ascii?Q?FNaeAJcmrn/0LzMXE9Y85pRTBHHKTsrbQAO2Kw+oQtxYEAev6yIvpP6AYT7d?=
 =?us-ascii?Q?OznFyNjj8SPE+AFO6xz+qw3GrR1Z2Zj8ENPcE4JhKCcVlHkRubImPW6gCRM3?=
 =?us-ascii?Q?FONKfRZI3VqZt/03RUmOwDbR0F+DcahZFHPQOFdHRk9Jy+ndEWAi150hfis7?=
 =?us-ascii?Q?bph2VjP85NgZ9vneC3JVTSZcLJRzlN7o/nZ6o7hhuvoCXnLvG7UK2tgnmZGB?=
 =?us-ascii?Q?yzd1DXDKdFJ4mRXfGWv5SORj09ENluFWDMdYWRZK8YTL7gR7wBd0AOY7sIBD?=
 =?us-ascii?Q?Be9fRTqroFHjqkYzqJqQg6GvotO0s6UgslG/3Mq2ih7YoXq46yUAOoKDXs+p?=
 =?us-ascii?Q?18Vr9ElsIXvWSxwG9ly3s9dr3eVSTBpjv18PLVVKLLRVTFXNhs1hw7E+fV0m?=
 =?us-ascii?Q?tkBdcIgU3W2lDpdJwoxl3uMN6k0DNkfcpZCpGcpJWmPHbT+TkGb04YEJ1BF9?=
 =?us-ascii?Q?1PNhzk6npuIrhLJ3J+q8JJHgHwKT4Tvy8ashUgoJX6kjqH1pM7T+aGjhMNFx?=
 =?us-ascii?Q?qjp3ZYH2z7kBHE3+/DEgvYYBEMUJ+mROOeIFQSq7OvF9KnvMFiZxsA/o8IL4?=
 =?us-ascii?Q?zjxPXGa/0mOCQ9iFaWUofTLi3w5p6c6VBGVh8jRSvHmIXvFYnivvAyHy7sHf?=
 =?us-ascii?Q?DHRO9YSjoaHI2/6OBTssk6YNS9C3sbCOPmiVg2gpj65FXPFi+TDziKW/aTjV?=
 =?us-ascii?Q?LmUODcGNJCuwyX3O12wTDaBL/limNnLDlElRV+K4HxGPAEIiBCLFk/tzgqPZ?=
x-ms-exchange-antispam-messagedata-1: auazGyXonXQQUQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6adca8e9-4460-4ae1-4ab5-08de552f3f6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 18:44:14.8926 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MANkZeknm1UAWc1Rakj+5z+DJVztwLhYzqx16zGK+iYxnfczZRxlDLEpIm+FAyIhNInjPpJIBTzxdmVMF7ShqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5953
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

On Fri, Jan 16, 2026 10:05 AM Brian3 Nguyen wrote:
> On Friday, January 9, 2026 2:00 PM, Shuicheng Lin wrote:
> > Move nvm teardown to a devm-managed action registered from xe_nvm_init(=
).
> > This ensures the auxiliary NVM device is deleted on probe failure and d=
evice
> detach without requiring explicit calls from remove paths.
> >
> > As part of this, drop xe_nvm_fini() from xe_device_remove() and from
> > the survivability sysfs teardown, and remove the public
> > xe_nvm_fini() API from the header.
> >
> > This is to fix below warn message when there is probe failure after
> xe_nvm_init(), then xe_device_probe() is called again:
> > "
> > [  207.318152] sysfs: cannot create duplicate filename
> >
> '/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/=
xe
> .nvm.768'
> > [  207.318157] CPU: 5 UID: 0 PID: 10261 Comm: modprobe Tainted: G    B =
  W
> 6.19.0-rc2-lgci-xe-kernel+ #223 PREEMPT(voluntary)
> > [  207.318160] Tainted: [B]=3DBAD_PAGE, [W]=3DWARN [  207.318161] Hardw=
are
> > name: ASUS System Product Name/PRIME Z790-P WIFI, BIOS 0812 02/24/2023
> [  207.318163] Call Trace:
> > [  207.318163]  <TASK>
> > [  207.318165]  dump_stack_lvl+0xa0/0xc0 [  207.318170]
> > dump_stack+0x10/0x20 [  207.318171]  sysfs_warn_dup+0xd5/0x110 [
> > 207.318175]  sysfs_create_dir_ns+0x1f6/0x280 [  207.318177]  ?
> > __pfx_sysfs_create_dir_ns+0x10/0x10
> > [  207.318179]  ? lock_acquire+0x1a4/0x2e0 [  207.318182]  ?
> __kasan_check_read+0x11/0x20 [  207.318185]  ?
> > do_raw_spin_unlock+0x5c/0x240 [  207.318187]
> > kobject_add_internal+0x28d/0x8e0 [  207.318189]  kobject_add+0x11f/0x1f=
0
> [ 207.318191]  ? __pfx_kobject_add+0x10/0x10 [  207.318193]  ?
> lockdep_init_map_type+0x4b/0x230 [  207.318195]  ?
> > get_device_parent.isra.0+0x43/0x4c0
> > [  207.318197]  ? kobject_get+0x55/0xf0 [  207.318199]
> > device_add+0x2d7/0x1500 [  207.318201]  ? __pfx_device_add+0x10/0x10 [
> > 207.318203]  ? lockdep_init_map_type+0x4b/0x230 [  207.318205]
> > __auxiliary_device_add+0x99/0x140 [  207.318208]
> > xe_nvm_init+0x7a2/0xef0 [xe] [  207.318333]  ?
> > xe_devcoredump_init+0x80/0x110 [xe] [  207.318452]  ?
> > __devm_add_action+0x82/0xc0 [  207.318454]  ?
> > fs_reclaim_release+0xc0/0x110 [  207.318457]
> > xe_device_probe+0x17dd/0x2c40 [xe] [  207.318574]  ?
> > __pfx___drm_dev_dbg+0x10/0x10 [  207.318576]  ? add_dr+0x180/0x220 [
> > 207.318579]  ? __pfx___drmm_mutex_release+0x10/0x10
> > [  207.318582]  ? __pfx_xe_device_probe+0x10/0x10 [xe] [  207.318697]
> > ? xe_pm_init_early+0x33a/0x410 [xe] [  207.318850]
> > xe_pci_probe+0x936/0x1250 [xe] [  207.318999]  ?
> > lock_acquire+0x1a4/0x2e0 [  207.319003]  ? __pfx_xe_pci_probe+0x10/0x10
> [xe] [ 207.319151]  local_pci_probe+0xe6/0x1a0 [  207.319154]
> pci_device_probe+0x523/0x840 [  207.319157]  ?
> > __pfx_pci_device_probe+0x10/0x10 [  207.319159]  ?
> > sysfs_do_create_link_sd.isra.0+0x8c/0x110
> > [  207.319162]  ? sysfs_create_link+0x48/0xc0 ...
> > "
> >
> > Fixes: c28bfb107dac ("drm/xe/nvm: add on-die non-volatile memory
> > device")
> > Cc: Alexander Usyskin <alexander.usyskin@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Riana Tauro <riana.tauro@intel.com>
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>=20
> QQ unrelated to this particular patch below, so RB
>=20
> Reviewed-by: Brian Nguyen <brian3.nguyen@intel.com>
>=20
> > ---
> >  drivers/gpu/drm/xe/xe_device.c             |  2 -
> >  drivers/gpu/drm/xe/xe_nvm.c                | 43 +++++++++++-----------
> >  drivers/gpu/drm/xe/xe_nvm.h                |  2 -
> >  drivers/gpu/drm/xe/xe_survivability_mode.c |  4 --
> >  4 files changed, 22 insertions(+), 29 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > b/drivers/gpu/drm/xe/xe_device.c index 329d17fd6100..e08d95554f2a
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -1068,8 +1068,6 @@ void xe_device_remove(struct xe_device *xe)  {
> >  	xe_display_unregister(xe);
> >
> > -	xe_nvm_fini(xe);
> > -
> >  	drm_dev_unplug(&xe->drm);
> >
> >  	xe_bo_pci_dev_remove_all(xe);
> > diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
> > index 01510061d4d4..1202a7abc46f 100644
> > --- a/drivers/gpu/drm/xe/xe_nvm.c
> > +++ b/drivers/gpu/drm/xe/xe_nvm.c
> > @@ -95,6 +95,27 @@ static bool xe_nvm_writable_override(struct xe_devic=
e
> *xe)
> >  	return writable_override;
> >  }
> >
> > +static void xe_nvm_fini(void *arg)
> > +{
> > +	struct xe_device *xe =3D arg;
> > +	struct intel_dg_nvm_dev *nvm =3D xe->nvm;
> > +
> > +	if (!xe->info.has_gsc_nvm)
> > +		return;
> > +
> > +	/* No access to internal NVM from VFs */
> > +	if (IS_SRIOV_VF(xe))
> > +		return;
> > +
> > +	/* Nvm pointer should not be NULL here */
> > +	if (WARN_ON(!nvm))
> > +		return;
> > +
> > +	auxiliary_device_delete(&nvm->aux_dev);
> > +	auxiliary_device_uninit(&nvm->aux_dev);
> > +	xe->nvm =3D NULL;
> > +}
> > +
> >  int xe_nvm_init(struct xe_device *xe)  {
> >  	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev); @@ -153,30 +174,10
> @@ int xe_nvm_init(struct xe_device *xe)
> >  		auxiliary_device_uninit(aux_dev);
>=20
> Performing uninit here would kfree xe->nvm already, so having the additio=
nal
> kfree seems wrong? Unless this uninit doesn't properly call the release d=
ev
> function until auxiliary_device_add has finished executing but quick look=
 doesn't
> show that to be the case. Am I missing something here?

Good catch. I think you are right. After auxiliary_device_init(), aux_dev->=
dev.release will handle the kfree(), so driver should not call kfree() agai=
n to avoid double free.
Let me fix it with a new patch.
Thanks.

Shuicheng

>=20
> Thanks,
> Brian
>=20
> >  		goto err;
> >  	}
> > -	return 0;
> > +	return devm_add_action_or_reset(xe->drm.dev, xe_nvm_fini, xe);
> >
> >  err:
> >  	kfree(nvm);
> >  	xe->nvm =3D NULL;
> >  	return ret;
> >  }
> > -
> > -void xe_nvm_fini(struct xe_device *xe) -{
> > -	struct intel_dg_nvm_dev *nvm =3D xe->nvm;
> > -
> > -	if (!xe->info.has_gsc_nvm)
> > -		return;
> > -
> > -	/* No access to internal NVM from VFs */
> > -	if (IS_SRIOV_VF(xe))
> > -		return;
> > -
> > -	/* Nvm pointer should not be NULL here */
> > -	if (WARN_ON(!nvm))
> > -		return;
> > -
> > -	auxiliary_device_delete(&nvm->aux_dev);
> > -	auxiliary_device_uninit(&nvm->aux_dev);
> > -	xe->nvm =3D NULL;
> > -}
> > diff --git a/drivers/gpu/drm/xe/xe_nvm.h b/drivers/gpu/drm/xe/xe_nvm.h
> > index 7f3d5f57bed0..fd3467ad35a4 100644
> > --- a/drivers/gpu/drm/xe/xe_nvm.h
> > +++ b/drivers/gpu/drm/xe/xe_nvm.h
> > @@ -10,6 +10,4 @@ struct xe_device;
> >
> >  int xe_nvm_init(struct xe_device *xe);
> >
> > -void xe_nvm_fini(struct xe_device *xe);
> > -
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c
> > b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > index 31456f432fc8..ff406e9a82cb 100644
> > --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> > +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > @@ -234,13 +234,9 @@ static SURVIVABILITY_ATTR_RO(fdo_mode,
> FDO_INFO);  static void xe_survivability_mode_fini(void *arg)  {
> >  	struct xe_device *xe =3D arg;
> > -	struct xe_survivability *survivability =3D &xe->survivability;
> >  	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
> >  	struct device *dev =3D &pdev->dev;
> >
> > -	if (survivability->fdo_mode)
> > -		xe_nvm_fini(xe);
> > -
> >  	device_remove_file(dev, &dev_attr_survivability_mode);  }
> >
> > --
> > 2.50.1

