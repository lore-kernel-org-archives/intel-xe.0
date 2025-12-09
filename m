Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C6FD3B7FB
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 14:23:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392D110E616;
	Tue,  9 Dec 2025 14:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J4KcDgw3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B475C10E5F2
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 14:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765290219; x=1796826219;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MUahgdA/kJ41H3dKiYtQOxxYwgpoSmRrWTDHJFxYm10=;
 b=J4KcDgw3xUDmCwVUyBOebS1MvKzEs0y+IqQ1wvkFhPDNAAFZY1Fzdtjq
 GFNpiWTVoIpd6frI9D65lm2hUBFFZ8gigAI119mVwXHuLirmnlWU3dMPY
 TXPZ7gYDrJLPAtKcifFTeB16t7fqu++lVLcIOfG/uELd07M/Nt3kf52u1
 2c0cor79cRHcnT1oTAEx2jEQVZXMbd0L/z34kGBwaZ1XuxKcuEnomiMXD
 b7S7e0VNKon71h7+rZmdFKgpGfIlowF0Yq9eMpBi6X1G3+B0qd+1goVXl
 +8m6HvWWoVgLOus6gvG+GHfz2SQDqGhKSgchvp1iLqB+FuwtmhO6fiVAO g==;
X-CSE-ConnectionGUID: 0U2VwOctRweqpYPnwEkl+A==
X-CSE-MsgGUID: BfH0XzHCR2CRb70aY3pTsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67140922"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="67140922"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 06:23:39 -0800
X-CSE-ConnectionGUID: 4COxzOWeRFS1UYfiJR5jcg==
X-CSE-MsgGUID: Fh/aR0NRTweIz8gdzKa8kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="201160748"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 06:23:38 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 06:23:38 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 06:23:38 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.69) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 06:23:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aGRD34U3iUvi5OnKd8Cl84/bZUQ+jDNOnJmfj74iy60Gkuwb/w+oDVFuHgaaXLp9U0Q5sVQDJSjB0gTlWs/FlKspg/nPlyXonTp2wuk73h37rSwZNS7TUoSJHc2haICI8CNXTmiosPd6/LUcVisg/ZCjaXT41zoamLNAJgoGXIDLncIz/z5fz0Prc17cZU/y497uh+c5bFc1KrCiQ94+CS3HcDeICUi7cb3iP+ZnI91Jdae7eAkdq4UTtyxkQ2NuWF6pcOo/LE4sInfekXsw27u/k5vhoGKPeoRfzuOWbag+08horZ/70haeR1PTg50NqK4IJo9c6UPMqlCSeH+KOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgXh0q93OwrhtsyAP/K3kezHFRvNfjBx34yD47MaAr4=;
 b=S0T31ji13tOeHaxDN8vRgAWMnWYTWCODncdv2uihBhVng+NWOXPNTKuZiXkDF6YaAQmBBh5Pq4sAIktRlwZrHmB6p9tE/5bnpZD/2JVc3jJPzcId6YVRNJTXiZPy5kpPUHZ4vlc7RonkQvS5UVDSig3k5irk2r+tQhFXW8ASGz4sA2KcjKmQ7uip3kSR7beppIQnz4bIz/4IZyKAn6f7X1HQv97JtEqe+z+JjsDkOXQrwXiLN7vUiP9UFs+e6j0I7f27YH8KMChSb81eZ8/K7SwB02u/S+t3hyu1yCmgnqXw02x9GhGKieQ4JIwmR6LYQjhD40dliTtwFELkETWs8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DM6PR11MB4547.namprd11.prod.outlook.com (2603:10b6:5:2a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Tue, 9 Dec
 2025 14:23:35 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 14:23:35 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH v2 10/11] drm/xe: Optimize flushing of L2$ by skipping
 unnecessary page reclaim
Thread-Topic: [PATCH v2 10/11] drm/xe: Optimize flushing of L2$ by skipping
 unnecessary page reclaim
Thread-Index: AQHcXyjBK8xTXcs+EEeEEQHnWthtnbUZWA6w
Date: Tue, 9 Dec 2025 14:23:34 +0000
Message-ID: <SJ1PR11MB62046EF38071388753F6D6FD81A3A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
 <20251126230201.3782788-23-brian3.nguyen@intel.com>
In-Reply-To: <20251126230201.3782788-23-brian3.nguyen@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DM6PR11MB4547:EE_
x-ms-office365-filtering-correlation-id: eaf0f77a-48f0-4387-35c0-08de372e898d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?2P555sWqPFg3GG/qFNfDP3VXR7Cl7Ig+p4AN5InN1AmRyA/0O5qCxoZFn9kZ?=
 =?us-ascii?Q?AAhUVniGnjj9wAkMlcfGez30I200h8QrVyPukm2p9R6iipRMAqVx2d9IiW8n?=
 =?us-ascii?Q?uVRfjZKw+CYvKexP0mOfDbT+BH7iGTRuxf3UrpPRI62u0AvFiTSrkK+QYupO?=
 =?us-ascii?Q?j+YzSM/XdS1lWvXFI+TxVlh/SjQeicKIL9HCOqU05+3XHQ3D77AqRsEvHi5P?=
 =?us-ascii?Q?QoGwyzOvaBMsgo4BMOZ19QMmB7zZ4Wu0iJEyFr4OeykSy9ExWwAtMs3ZMqoF?=
 =?us-ascii?Q?R3JVl+3q10pVrgtfMhG37wRnqigVREElA7XgamhwNFnAiymPd3JPYPLk2T0F?=
 =?us-ascii?Q?FDQ5Y/L3mlQcmKLg0P2Jg0hpXjK9TNIAbRw7jOacJR2lApMWqC9MXhHYYN2c?=
 =?us-ascii?Q?6Np5Nlo86M96+hv+A76bm6Mh1fEb8tnUcZ3qph6GvO1DJUfgT8QHXYbeR5Rw?=
 =?us-ascii?Q?u2uDP+uWz3nUAe7Uc3U215qpDMue1nG0tgAjP4gHq8Nemc8ewlakf0BLh2zC?=
 =?us-ascii?Q?2KEJ0wtcjizLJshgUjtqbtNRvM19tYG9ZYbcRbKVeyqxmx0qwfkc+lRFrose?=
 =?us-ascii?Q?vftDKlXf7E/NV+IuKC1HSM1kmglTEEknY44eaZ4Iv6fWM275ScZIh8MHIwwp?=
 =?us-ascii?Q?no2RI1J7UScn86TmqowPJUxe07WdVSj5b8FYv2NGsrn0AEGX+o/CG85FE4sx?=
 =?us-ascii?Q?vhRwer+2WVzinGSifRIf8YQ2YunlmY97XuuW7MMSNcrNhsyuuaiUgs8geNi4?=
 =?us-ascii?Q?Xe+AKQRIo4vZnf72fPIVQfpScUWINXl+0Ei9f+TsY9M3d3BfYOOGcBH+9I32?=
 =?us-ascii?Q?ZE6b0Ym35/9j3VDxHhU3WRTExp8r0AE0MfAWoW0KDjoI1UkibqjZ5QDLg+CL?=
 =?us-ascii?Q?NTELZxNN7yJwmtHd0Ocx6ACXMD1bEmuXAo/uBWDTR8zcMH+XRapxYY+6e7+R?=
 =?us-ascii?Q?yV0qUniHSSgNyZ+cxsaDnJSW7RRBnjtsGtC6lSNRsTuFRHpxZHy+bvabFblV?=
 =?us-ascii?Q?nqczvViOxuH1oByaDNGDH4//PbPU6n6fgzrBJzxmmyLySe8Q+bg+ADGE60F/?=
 =?us-ascii?Q?hJ+EaqexFMlvSyjRumnzTzjFomWbfMCGPrRS2mCkx3YzhJZtSlH7UqUOuTch?=
 =?us-ascii?Q?jVxaLQ3jjTh/KdUdyASSTnaVDGurADJ5esLgiCt8VLCRWsteU0h8HyfD2Exb?=
 =?us-ascii?Q?uWRKA+jC9L+EQPqWDcMLFsyQyYTN8RsWvSc9tx/u8iK/MG4CWyiekJDq9eBz?=
 =?us-ascii?Q?+X3HF0vR4c/XIbiySwulh4VveTc8ksXnjZhN/ELiroh195XgbK7ivIRNc+aK?=
 =?us-ascii?Q?joGD8MD/iQPN75nXJqqzP4iwXNHlHOOtJOekUBjAEfVeNPF8kKWrYtC2l9aF?=
 =?us-ascii?Q?qAb5E0WNEdGyO+JoB1Ols9tu0sffWcTcxUYFh4s05fESukEiyTjsnD+CYCmm?=
 =?us-ascii?Q?5ga3JDhPZnFoPpkwNxk7gLHtQ0GAt93qpigoMEUqdEUO7w39tW99Y/pRPyMH?=
 =?us-ascii?Q?wPua0ZwFn+RWlF/zQuQbKZsmxuEGi6o2Tqaa?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?A+r5yLZm43vJPIK+5uYIzJ1kl20TOJiljaq5azZuU/CcxGrzH3DIL+ogTlll?=
 =?us-ascii?Q?pOijSpuDFXyOz+YLaHeMbBCrw5cbV+ynx79/9XaFyYEMQ867aXcXcg1zAkpK?=
 =?us-ascii?Q?gOM1uLe/JLsBRgC1S1A3BSZ5pH+xIDd2w4k6ICByTnNH8uE0V83LP1HcjNsd?=
 =?us-ascii?Q?mDD9B9UhsvPYsUgGZd/Wo6YeE9OCFEakrkj5XMQwROnYqn5Ay6TGpBzbfOxu?=
 =?us-ascii?Q?TJnJbPEMNkiczl8WYZrOxJutwGESXm/csXdi/ue9zwhy23GhWS7u5YX+2leM?=
 =?us-ascii?Q?qnIigpYmzxDDwCnh7fuR1/BWCjyaFwDOWO+RqzQGeQA/HDlPn6quZU7X/+F7?=
 =?us-ascii?Q?845KhBI9SjGpheF/av9PP+NUse8iHBsGDnp7hmgiSaSGeL7zkMo7YYovpqxq?=
 =?us-ascii?Q?2upDNNtyfiKouoRGQL3zpBY8ntUAWyfUQ9fURi6gU6DvowMkEIXPk9tr9xm1?=
 =?us-ascii?Q?8Am+UFr2GjTudUvcMaPY0nxjzICZli9fArcYhZgyjcTggHd6fnjFmZ5zAN4J?=
 =?us-ascii?Q?Ij0jilFLb1+63UvRrmHv0n1KKWRBxnUxU6xOY9j32ez7/1gV0IFFdtk5Ic6z?=
 =?us-ascii?Q?ULRVFx1R3VwuLh37VC3/2TU4GYGgfmc13El+7POVGTp4KgUva95aN7cY0SPS?=
 =?us-ascii?Q?leB2B+ckjzkD3jaDgMllfvRhzdvMg7uD9PaQXdai0lan6dZY2aOt9nyE3iNl?=
 =?us-ascii?Q?vZYBVP8HGgAB9AyCo9IHeLqxNTz/mOYrVZNPe7vuBS8OsbXeUlrr0xQGV5te?=
 =?us-ascii?Q?SdzBNT8knXafCltFXs7iqSNxCXHWC1MEErHaXvQv0OYYmIqf8dIAYFCLOCf8?=
 =?us-ascii?Q?iaHzaqbZvdymZi6VZnqAq8G8kafssXVUxoEvjz34nXIhK/LYytCz9RpORTp3?=
 =?us-ascii?Q?fXiBQ8/MKAaAAqDAI8UCXDWd8MF/H0vyO6vYcY79O+PW5zu+lDIyvEWg4MnF?=
 =?us-ascii?Q?OJL+HKhR6z+JAYc69v01C0k3izTg8MDHmg28lWpgW3d7FcUhZUImLGUDs8H9?=
 =?us-ascii?Q?hPaumpuERI0XLEBWdxqcwvAv73PX8EU5wO6fzxt3Y2L12OHPXKMUr33WARfY?=
 =?us-ascii?Q?bSUetNF+F889knFStLMQNwshHPiJD8zFsghC/NQTeRDDdXI1mZj9eKNUfje1?=
 =?us-ascii?Q?gvBUCscXiKJH9kNRseS0guwpd/gHn/y01bsidGxZt2CEm8VwoH5t+f3fxbYU?=
 =?us-ascii?Q?FJqREKDryvjTq2tv3O5rmle+SwzDtwG6rqKLl+cTN4p3hkdC0wbdg0MhoZsM?=
 =?us-ascii?Q?upaiopH3lEwfDvZ7oijHViGPekeNfnZWUa5dzSG+HnNWap0uPvSlp4J5wclu?=
 =?us-ascii?Q?GTVOTmIOsOY1rbK1gRAO23u+gAWkBIjqXKGCr1ZFlhSYeXb8NWJkLKEdlWOs?=
 =?us-ascii?Q?7zkoYNDhJ9vJ4Cu1KZJzW4kHEMz4G7iWb/+7E+cM6fAcoG7fXYpgqhf7EbEa?=
 =?us-ascii?Q?GBRhJ3EnFyqXGOUfAxX26zDDMoXpedMguDfATnbedTrozglqqD5cyiQWUIPH?=
 =?us-ascii?Q?PWLS/vPV8uleeyEtazIhyfGMPPkHC6zdgihQ86yKvBQTc31ltaLtCoFEqvoQ?=
 =?us-ascii?Q?kgWaywbrVYWDMz0K6WuOOfQJ3dCBzyB6qJsQmVyr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf0f77a-48f0-4387-35c0-08de372e898d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2025 14:23:34.8205 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LBBRySWv9Mt7GMzZZRYWa/hfoyN3lurW/F0Nm1Nc5TLGaRRY2YMhIewIOxbuVzmhpUgCxShY6hTt14zBoaqQfO4bsZ9m4is31SjJvTvEJDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4547
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
> From: Nguyen, Brian3 <brian3.nguyen@intel.com>
> Sent: 27 November 2025 04:32
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.com>;
> Summers, Stuart <stuart.summers@intel.com>; Auld, Matthew
> <matthew.auld@intel.com>
> Subject: [PATCH v2 10/11] drm/xe: Optimize flushing of L2$ by skipping
> unnecessary page reclaim
>=20
> In Xe3p and beyond, there are additional hardware managed L2$ flushing fo=
r
> the deemed transient display and transient app buffers. In those scenario=
s,
> page reclamation is unnecessary resulting in redundant cachline flushes, =
so
> skip over those corresponding ranges.

This does not look like correct statement for current upstreamed platforms.=
 For reason, See below.

>=20
> Add chicken bit to determine media engine status to help facilitate decis=
ion
> making in L2$ flush skipping.
>=20
> v2:
>  - Elaborated on reasoning for page reclamation skip based on
>    Tejas's discussion (Matthew A, Tejas)
>=20
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 11 +++++++
> drivers/gpu/drm/xe/xe_page_reclaim.c | 47
> ++++++++++++++++++++++++++++  drivers/gpu/drm/xe/xe_page_reclaim.h
> |  3 ++
>  drivers/gpu/drm/xe/xe_pat.c          |  9 +-----
>  drivers/gpu/drm/xe/xe_pt.c           |  3 +-
>  5 files changed, 64 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 917a088c28f2..a18a2d59153e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -99,6 +99,14 @@
>  #define VE1_AUX_INV				XE_REG(0x42b8)
>  #define   AUX_INV				REG_BIT(0)
>=20
> +#define _PAT_PTA				0x4820
> +#define   XE2_NO_PROMOTE			REG_BIT(10)
> +#define   XE2_COMP_EN				REG_BIT(9)
> +#define   XE2_L3_CLOS				REG_GENMASK(7, 6)
> +#define   XE2_L3_POLICY				REG_GENMASK(5, 4)
> +#define   XE2_L4_POLICY				REG_GENMASK(3, 2)
> +#define   XE2_COH_MODE				REG_GENMASK(1, 0)
> +
>  #define XE2_LMEM_CFG				XE_REG(0x48b0)
>=20
>  #define XEHP_FLAT_CCS_BASE_ADDR
> 	XE_REG_MCR(0x4910)
> @@ -429,6 +437,9 @@
>=20
>  #define XE2_GLOBAL_INVAL			XE_REG(0xb404)
>=20
> +#define LTISEQCHK				XE_REG(0xb49c)
> +#define   XE3P_MEDIA_IS_ON			REG_BIT(2)
> +
>  #define XE2LPM_L3SQCREG2			XE_REG_MCR(0xb604)
>=20
>  #define XE2LPM_L3SQCREG3			XE_REG_MCR(0xb608)
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c
> b/drivers/gpu/drm/xe/xe_page_reclaim.c
> index 740563277872..a0c803cebf15 100644
> --- a/drivers/gpu/drm/xe/xe_page_reclaim.c
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> @@ -13,8 +13,55 @@
>  #include "regs/xe_gt_regs.h"
>  #include "xe_assert.h"
>  #include "xe_macros.h"
> +#include "xe_mmio.h"
> +#include "xe_pat.h"
>  #include "xe_sa.h"
>  #include "xe_tlb_inval_types.h"
> +#include "xe_vm.h"
> +
> +/**
> + * xe_page_reclaim_skip() - Decide whether PRL should be skipped for a
> +VMA
> + * @tile: Tile owning the VMA
> + * @vma: VMA under consideration
> + *
> + * Xe3p and beyond can handle PPC flushing for specific PAT encodings.
> + * Skip PPC flushing in both scenarios below.
> + * - pat_index is transient display (1)
> + * - pat_index is transient app (2) and Media is off
> + *
> + * Return: true when page reclamation is unnecessary, false otherwise.
> + */
> +bool xe_page_reclaim_skip(struct xe_tile *tile, struct xe_vma *vma) {
> +	struct xe_device *xe =3D xe_vma_vm(vma)->xe;
> +	struct xe_mmio *mmio =3D &tile->primary_gt->mmio;
> +	u16 pat_index =3D vma->attr.pat_index;
> +	u32 pat_value;
> +	u8 l3_policy;
> +	bool is_media_awake;
> +
> +	/* Ensure called only with Xe3p due to associated PAT index */
> +	xe_assert(tile->xe, GRAPHICS_VER(tile->xe) >=3D 35);

That's ok we are skipping based on 35.00 which is media I think. But right =
now I don't think we have HW GT upstreamed which will substitute this skip.

Tejas

> +	xe_assert(tile->xe, pat_index < xe->pat.n_entries);
> +
> +	pat_value =3D xe->pat.table[pat_index].value;
> +	l3_policy =3D REG_FIELD_GET(XE2_L3_POLICY, pat_value);
> +	is_media_awake =3D xe_mmio_read32(mmio, LTISEQCHK) &
> XE3P_MEDIA_IS_ON;
> +
> +	/**
> +	 *   - l3_policy:   0=3DWB, 1=3DXD ("WB - Transient Display"),
> +	 *                  2=3DXA ("WB - Transient App" for Xe3p), 3=3DUC
> +	 * From Xe3p, transient display flush is taken care by HW, l3_policy =
=3D 1.
> +	 *
> +	 * Also with Xe3p, pat_index=3D18/19 corresponds to transient app
> flushing
> +	 * which is handled by HW when media is off.
> +	 *
> +	 * HW will sequence these transient flushes at various sync points so
> +	 * any event of page reclamation will hit these sync points before
> +	 * page reclamation could execute.
> +	 */
> +	return (l3_policy =3D=3D 1 || (!is_media_awake && (pat_index =3D=3D 18 =
||
> +pat_index =3D=3D 19))); }
>=20
>  /**
>   * xe_page_reclaim_create_prl_bo() - Back a PRL with a suballocated GGTT=
 BO
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h
> b/drivers/gpu/drm/xe/xe_page_reclaim.h
> index 4ecea05b1f2e..281d2b1fe0be 100644
> --- a/drivers/gpu/drm/xe/xe_page_reclaim.h
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
> @@ -18,6 +18,8 @@
>=20
>  struct xe_tlb_inval;
>  struct xe_tlb_inval_fence;
> +struct xe_tile;
> +struct xe_vma;
>=20
>  struct xe_guc_page_reclaim_entry {
>  	u32 dw0;
> @@ -45,6 +47,7 @@ struct xe_page_reclaim_list {
>  #define XE_PAGE_RECLAIM_INVALID_LIST	-1
>  };
>=20
> +bool xe_page_reclaim_skip(struct xe_tile *tile, struct xe_vma *vma);
>  struct drm_suballoc *xe_page_reclaim_create_prl_bo(struct xe_tlb_inval
> *tlb_inval,
>  						   struct xe_page_reclaim_list
> *prl,
>  						   struct xe_tlb_inval_fence
> *fence); diff --git a/drivers/gpu/drm/xe/xe_pat.c
> b/drivers/gpu/drm/xe/xe_pat.c index 717425dd0475..9f8b012d2bf3
> 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -9,6 +9,7 @@
>=20
>  #include <generated/xe_wa_oob.h>
>=20
> +#include "regs/xe_gt_regs.h"
>  #include "regs/xe_reg_defs.h"
>  #include "xe_assert.h"
>  #include "xe_device.h"
> @@ -23,14 +24,6 @@
>  #define _PAT_INDEX(index)			_PICK_EVEN_2RANGES(index,
> 8, \
>  								   0x4800,
> 0x4804, \
>  								   0x4848,
> 0x484c)
> -#define _PAT_PTA				0x4820
> -
> -#define XE2_NO_PROMOTE				REG_BIT(10)
> -#define XE2_COMP_EN				REG_BIT(9)
> -#define XE2_L3_CLOS				REG_GENMASK(7, 6)
> -#define XE2_L3_POLICY				REG_GENMASK(5, 4)
> -#define XE2_L4_POLICY				REG_GENMASK(3, 2)
> -#define XE2_COH_MODE				REG_GENMASK(1, 0)
>=20
>  #define XELPG_L4_POLICY_MASK			REG_GENMASK(3, 2)
>  #define XELPG_PAT_3_UC
> 	REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 3)
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c inde=
x
> 833d6762dd8d..5ecf13c51de9 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -2009,7 +2009,8 @@ static int unbind_op_prepare(struct xe_tile *tile,
>  	if (xe->info.has_page_reclaim_hw_assist && !pt_update_ops-
> >prl.entries)
>  		xe_page_reclaim_list_alloc_entries(&pt_update_ops->prl);
>=20
> -	pt_op->prl =3D (pt_update_ops->prl.entries) ? &pt_update_ops->prl :
> NULL;
> +	pt_op->prl =3D (pt_update_ops->prl.entries &&
> +		     !xe_page_reclaim_skip(tile, vma)) ? &pt_update_ops->prl :
> NULL;
>=20
>  	err =3D vma_reserve_fences(tile_to_xe(tile), vma);
>  	if (err)
> --
> 2.52.0

