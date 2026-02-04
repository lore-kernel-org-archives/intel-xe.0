Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BDEE9D419
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 17:17:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5C310E70C;
	Wed,  4 Feb 2026 17:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R+pQOtrc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6846410E36D
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 17:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770225430; x=1801761430;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M/JLGBM2A4Fr1YUrUkBC20B2Plqfw717PCn3vDIo1EM=;
 b=R+pQOtrcEociY4bBHEuGrt3mGbx/lbYdv1xHvj82UMO7hO5HqO2TtD//
 xMeIG0shK9kgiZ79Vp69jDxEpRJfAISPHjAwyFhbcgrAKLKTpvJqce9Or
 rrVvR8nDDql9ByBnXun4BaO4AAnWBLNPt+7cZO+uiJMLgNUYZAli+KZLT
 yZ8ravYze0319FPLaN39pLFPLL+JS/vVwUexcGjwedMgokaegH+4qVRzP
 BChARi7JDvnWJ6ve4PuSdtbv0XnojPT3XVqJCOMlBAG/mH62YPWYZRl3t
 aSH1XHwZ/Swg2ML3hEwlufWr6up3wqSOOg6I8CxHvLeEacmXZ5ljWwY1P A==;
X-CSE-ConnectionGUID: 3dFYXbi7QjaVur8wsti3yA==
X-CSE-MsgGUID: QzjgIN+5QG+5QeirOFE9Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71452573"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="71452573"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 09:17:09 -0800
X-CSE-ConnectionGUID: ckwJjp0mSDWwvvx3ME0YGg==
X-CSE-MsgGUID: 7JAZj6MTStCfT37wMg1v7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="209514863"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 09:17:09 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 09:17:08 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 09:17:08 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 09:17:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pfNIBvdKdWbWTQ9qqyh4bNNfYn79QD1GjOu4/9ZFHgGqjtsB5TRo2u4tEKswUhyl1IYKyrMdDeoHjvWAuShCxRu3ZLEnHvSDCquwWyncPp1t/NcgUpIcthCpn3VZhUhjG0ZLI0wXO+OPGJgWLazUX+WMJbw1v50NvkEA8XNsMrGxh4bikHp5GJw43vIC3ANM3QvPi+puAwqVTmuYloQ82x5YPEkyd79jECkiQyNTlOlAwqn3Gqn1yhiRPGDPSlAn7iUZF7n1i+lHB6+4Aear4gnVmqBhcuXDx4/I3u19brRVYNsaGKtv8xdxAfF5nrLvnKoPDGYMxTUxwXybSyK0HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORrLsDa8JdzAsnswg7gjZ38y4qfEgE8991WODWfALs8=;
 b=bzc/BB3LEUJ1ra3r4QvmgKlFIOBHSthV0Tqt4bHOWJjosZoHHu3epvroWdm8kH16aLImvAnWO2dT+Sv8zjWnpq+LkGmz714aJd/p1OSEeR7sFjGAm9Dt5WE2ANfOwv8MYj/dUyGkW0qx4Q8bIbxfSK01kn4ZYwCIL47cRVNsMrFf9+sAUasnjbjbesyain227h9Ng6MfCWht8mESxMo5mLER/SlJSjnaMiPvpilYrpmwxh6f3+HRIznDQ3gJEUdqu112wXXyW3464OLQ44L+gMc16CAYnTENxDwZVZTlQlZbsHB81PwMry8MPSMHO7NHFSxYgLraDX0GjYr458PFOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by MN2PR11MB4614.namprd11.prod.outlook.com (2603:10b6:208:268::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Wed, 4 Feb
 2026 17:17:06 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 17:17:06 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: RE: [PATCH] drm/xe/pf: Fix sysfs initialization
Thread-Topic: [PATCH] drm/xe/pf: Fix sysfs initialization
Thread-Index: AQHclWhnavGxR2mSzkWAvF5kz9wVWrVyxyPw
Date: Wed, 4 Feb 2026 17:17:06 +0000
Message-ID: <DM4PR11MB54561A4C4FA225514935B00EEA98A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260203235332.1350-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260203235332.1350-1-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|MN2PR11MB4614:EE_
x-ms-office365-filtering-correlation-id: f09b93ad-76f1-4d20-35ec-08de641138c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?fS3paIQWcABkOPq5zAyozQZr11fSWiXrpvQIdGeo1kJAbstm+GuyP+ZYdeKY?=
 =?us-ascii?Q?bbmIG7xYhyAKrKCHEKipNFcassKyjINNef0T7+K2rxSMVLcvGKCg8EacDbCY?=
 =?us-ascii?Q?wMpu352NWzxSkanqeyqOg0OY4yeJKbh1HX6Z/u8EAsYRdIXUowFOXcB9791N?=
 =?us-ascii?Q?FxKAmPsiaOieJKSXQFM3lLpOaIL29Vy4WN6105tMcC82eBweFgJC99c4ThOw?=
 =?us-ascii?Q?dT8A4LoJV3lCYiD9JugL/HnNSoUoAf8b9jBr5iTXW95CwdL2OEqmMt8i0oeh?=
 =?us-ascii?Q?kWnj7PTPxwcvigtArilASkTerohC6coGFRPjrKNDwdU/0p7hBWOAPYYUfHWv?=
 =?us-ascii?Q?eOrx7eioi20hfJ2kISKsgx60dZapWYr1kqkBnRAPKwa4FFdZdzngs7KV0qwu?=
 =?us-ascii?Q?YiB/W57loik9QOz6MTibpe2C7Dy3ps36IT+3BBPVkgvJiiDbQWnhcv1dLr/T?=
 =?us-ascii?Q?t61lL4jZV27haEyyA0UhZHZUGdZY4Kua2UYqRnUwMwfJ6gCrdix/ZLsKg3pS?=
 =?us-ascii?Q?MfvBI7/tcvvCLZmmPXDCMtMh04UIF7a8a3TdWh5VWUDNiKFYd2HW6WshZrPE?=
 =?us-ascii?Q?q3aALvADOn+T7zWGmBui7A2Y2dwaOraFdyJKiI1X1HDDCNArUsqn8VGBfKal?=
 =?us-ascii?Q?F3RaIntgRGwTGQFSsKOTdKVfRaz2JeLgqFEkZ/jKM/W6j9wQnSrxU/ku4ZPl?=
 =?us-ascii?Q?QjB+xoaiZy/q4Hh42VTGFfxu3hQ2fZdVOZwkb/TbKRaWN779DR/jP5egqc+i?=
 =?us-ascii?Q?GdDe9/HSoX7Amdsc1zn6tbUHISLb8nfw1p0Ci04dUcT087AgTSGGKbg5mBUq?=
 =?us-ascii?Q?FSu9DJGGmlcUxtiK7n9Tjm+EgyTgRMuO4Pu4UiqiY62dS3D34/St1B7C5Apz?=
 =?us-ascii?Q?hfrsbDMLa0WiZzT9DisLvCohnK4HluwMJGeJPpPWzwNi9dl/LLlOnVW6FexE?=
 =?us-ascii?Q?GteKFZR+MGIA3NlWBLn+6j6+JVzXwvRHaJ/3mGuXf63+mxVVQ5F5zz1u+m8K?=
 =?us-ascii?Q?lGb2+P3FyrKbZopNeZEye6Ob31cB8vSofzZTRYrt1sLkkmNxEHBYw9dRroHC?=
 =?us-ascii?Q?g0zFK/ZsnDRFzeOY8673M8C8g+2YYKHp9UIWDBO1p96kn2BQFM43xwpDz5UG?=
 =?us-ascii?Q?l82Gr8d65ngQwZ+DLz15A0PE6Sj1WUiDF8eqoeAxAeh4cje1Qy4eXAOdsdYD?=
 =?us-ascii?Q?rfwJzKB4/qSAiJbh8r3zeo+QV7ef38Sk/DGcIjYuNmjOTZv6nT7ieHwWyVll?=
 =?us-ascii?Q?Lb2dfEsUDvhNw2LbgBOPcXodb2nwzdLJHtS3Gv9HTZmF9uej/ZDm825mSYe2?=
 =?us-ascii?Q?LIKB5YF9hhgtUHUAwm4GSG6fF0x0x1BvKfu8Cy8OJkjCiOI9iReg3VN2L58Q?=
 =?us-ascii?Q?YOLKFDs1DfUV09oKUfbhmLteI5Q+FANWhimju3ACRLyN8vKNvzRYZTN5ut3G?=
 =?us-ascii?Q?peS7HswxhTJRDsTIUhu6BpNUVraeD+QhRUxFBo7cbItQsMgUYWXiQ3jNKXnj?=
 =?us-ascii?Q?hiXBTTmxKo3EmZA0mS5DYaSb1DcDuyGMPGOKtN5tPxtF7Vn8xMPraO9bmXE0?=
 =?us-ascii?Q?ewdQNta6LBdi2e3qHasWIVI9vyCc1E7Fg9IPIqm5/Osp6nEv6z7iV3t+xPut?=
 =?us-ascii?Q?jvN8hDlR5l0ouzjf9X6V8gc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TmfEeFPn53pOVlW1Jh/RvyIljlTbXi9AIftWD4OKFnKrTl1hdH+2UvToap/D?=
 =?us-ascii?Q?0n8mzLVHGYNYDflLmw87bJLpOkjtR167xG0FuDJ+S2ZlnsKCY7Oa15nPNkDM?=
 =?us-ascii?Q?W+yYY8FUxgn/QvICCWSZ/s68whT41487w8ylEl5BkkVCOgNtn2jh4qTDMoZl?=
 =?us-ascii?Q?bAijA8o0mz0PPfV3Zp6UEn/NhaGirs8UOrMYzjgbn2PFJ6LhQgU3Rhu0NjfJ?=
 =?us-ascii?Q?3yEjUqLO6A7oYopAP5C1K18SwVoMsQC9Rtm9UV/X33W9CC6817QZ47nwywIQ?=
 =?us-ascii?Q?Dhmz1nnboYd6DzX4qOzhSQgyiUDEfl8pfycU1oGhBEM5MsrHjHmHpbsOzucW?=
 =?us-ascii?Q?iI+6EYDKEtIfWK9UafELUnwm/zOAaJoFNr5mod2YXNTfU+5UzlQ9wjvrwFVa?=
 =?us-ascii?Q?xC6tC8c5VYeaNp7R2V31x2PhPJF5+y22kvc5mN+FIq+4jh9buNxylTZ474HA?=
 =?us-ascii?Q?QWgI0dRkutYDGajgwQg/mJrWesb3z9Bf9YRfHCKkcf1/UqFwYinzCYSc/oG7?=
 =?us-ascii?Q?J3Af4pXANvIzorGA8Oxx7L4vLrBdNAaTvKNyuv26oWsWUG9iq6G8EkvvOqge?=
 =?us-ascii?Q?TkhwXARBzXD2CR1CDBV+gjL0Fw5fPOKoJ6C3sjPlvpF3xJR8rfJHJJ8R4HwQ?=
 =?us-ascii?Q?nltWN28MUlgqcBRl8v2dXl2mHSyTOtJbzp/plpvG2ctr0DYWe/xnKAitOAP/?=
 =?us-ascii?Q?tfte2/bhqzSQnOvEH80vF8+oiaqMYPtqt2zP+Pp5meN/v5Z9EptVll57UIJa?=
 =?us-ascii?Q?yS6U4eRTNSOehpLqR2a/28Kyf9pEtxmLIAMtmWbIy63sKHvyei2PilaBpouI?=
 =?us-ascii?Q?fUUQr3llVI0iXqn+0PtSn5iWQ10wrxCZv/Xewtj1NqhQJPWpPo5jptz+OFpt?=
 =?us-ascii?Q?V2tYfxKp+Xq93RsqPGa/9PkYTJ04w1y80cGGqlV/Z8/IKpA1/pgquMotN88Y?=
 =?us-ascii?Q?GbYlf7E005I7/1g/MUBFhK/gDHBP/tP6eUMKeYjGjIzfOhwvHok0J8zLSzTJ?=
 =?us-ascii?Q?Z8tNnMrr+z6x7dpPdhM7TvPX6AVgL2AsImScERszU3Kh1xBHDWeQSw7f6A+v?=
 =?us-ascii?Q?z0bkP3lMa0Aflh54tX+KpI/HEO/HesWxovf1xZSUl0nznRtautToGJ2LsWmw?=
 =?us-ascii?Q?qiKufPcrAgoqpi9+uQkpeLCGJdsUJ3x9QmSX+iacOiNOhxNHrGLB110fy18W?=
 =?us-ascii?Q?Xt6L76P4xfYkFmHz11AIrfeUd5cHCx9G2LR7HVY0Ku/Xvv/KQUg4bQ0C3CNf?=
 =?us-ascii?Q?04xcSFfBCs/G7zLN+tushuLAK2I4EA2bmjRBkKNliviZ3HyCTDR2TsWozZa2?=
 =?us-ascii?Q?Z0ZHYosrlDnSIc3xH4qytyW+LOiWBZHnm9ejEaASCPgL9d5LmmZsH1pYqDWw?=
 =?us-ascii?Q?waGNz+2WHsD7PCLLEynrNSs1jJs6IAh8ql+8cqLnQkICSR73nAReu8Z41GQn?=
 =?us-ascii?Q?wlRVg0EaE6t2sZMxDw9cawCXZFExv0oLix3h2EkpB9Yjw5yfxxJDO9tCAOrX?=
 =?us-ascii?Q?87c9Ue4yeuSPnVJyiq6MuDLS6beGDPBbaAxJTHNtgBMZ9RqdgK4ZDH5Hxuvy?=
 =?us-ascii?Q?eW1RxB1dnz3nkdTbpfZK+RhOJfuoZCBaSviLll99u30vrXiP81qHg/acTDLK?=
 =?us-ascii?Q?c9Uqx3BZ75kiMhT+KKDPTFfD6D5tTeWGsXepXT9vTu7H/CoqiK5b19J0AmyH?=
 =?us-ascii?Q?5tTWJ7n+mx697LZYMATPBqTJdN9hZ3ho5bClhYj7ia2Rg7rxTU5nQzJZjLHW?=
 =?us-ascii?Q?teb0htwInw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f09b93ad-76f1-4d20-35ec-08de641138c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 17:17:06.2801 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K/8nanslq0Ke0UBRW9tTlw3ilY+KGgGdWdMiU0VAV1LbijmDi41WDz+2aBxIZLWZnSm5t9rbGWs6uCiFL6v7LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4614
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

On Tue, Feb 3, 2026 3:54 PM Michal Wajdeczko wrote:
> In case of devm_add_action_or_reset() failure the provided cleanup action=
 will
> be run immediately on the not yet initialized kobject.
> This may lead to errors like:
>=20
>  [ ] kobject: '(null)' (ff110001393608e0): is not initialized, yet kobjec=
t_put() is
> being called.
>  [ ] WARNING: lib/kobject.c:734 at kobject_put+0xd9/0x250, CPU#0:
> kworker/0:0/9  [ ] RIP: 0010:kobject_put+0xdf/0x250  [ ] Call Trace:
>  [ ]  xe_sriov_pf_sysfs_init+0x21/0x100 [xe]  [ ]
> xe_sriov_pf_init_late+0x87/0x2b0 [xe]  [ ]  xe_sriov_init_late+0x5f/0x2c0=
 [xe]
> [ ]  xe_device_probe+0x5f2/0xc20 [xe]  [ ]  xe_pci_probe+0x396/0x610 [xe]=
  [ ]
> local_pci_probe+0x47/0xb0
>=20
>  [ ] refcount_t: underflow; use-after-free.
>  [ ] WARNING: lib/refcount.c:28 at refcount_warn_saturate+0x68/0xb0,
> CPU#0: kworker/0:0/9  [ ] RIP: 0010:refcount_warn_saturate+0x68/0xb0
>  [ ] Call Trace:
>  [ ]  kobject_put+0x174/0x250
>  [ ]  xe_sriov_pf_sysfs_init+0x21/0x100 [xe]  [ ]
> xe_sriov_pf_init_late+0x87/0x2b0 [xe]  [ ]  xe_sriov_init_late+0x5f/0x2c0=
 [xe]
> [ ]  xe_device_probe+0x5f2/0xc20 [xe]  [ ]  xe_pci_probe+0x396/0x610 [xe]=
  [ ]
> local_pci_probe+0x47/0xb0
>=20
> Fix that by calling kobject_init() and kobject_add() separately and regis=
ter
> cleanup action after the kobject is initialized.
>=20
> Also make this cleanup registration a part of the create helper to fix an=
other
> mistake, as in the loop we were wronly passing parent kobject while

Nit. s/wronly/wrongly

> registering cleanup action, and this resulted in some undetected leaks.
>=20
> Fixes: 5c170a4d9c53 ("drm/xe/pf: Prepare sysfs for SR-IOV admin attribute=
s")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 54 +++++++++++++-------------
>  1 file changed, 26 insertions(+), 28 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> index 3d140506ba36..82a1055985ba 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> @@ -349,18 +349,33 @@ static const struct attribute_group
> *xe_sriov_vf_attr_groups[] =3D {
>=20
>  /* no user serviceable parts below */
>=20
> -static struct kobject *create_xe_sriov_kobj(struct xe_device *xe, unsign=
ed int
> vfid)
> +static void action_put_kobject(void *arg) {
> +	struct kobject *kobj =3D arg;
> +
> +	kobject_put(kobj);
> +}
> +
> +static struct kobject *create_xe_sriov_kobj(struct xe_device *xe, unsign=
ed int
> vfid,
> +					    const struct kobj_type *ktype)
>  {
>  	struct xe_sriov_kobj *vkobj;
> +	int err;
>=20
>  	xe_sriov_pf_assert_vfid(xe, vfid);
>=20
>  	vkobj =3D kzalloc(sizeof(*vkobj), GFP_KERNEL);
>  	if (!vkobj)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>=20
>  	vkobj->xe =3D xe;
>  	vkobj->vfid =3D vfid;
> +	kobject_init(&vkobj->base, ktype);
> +
> +	err =3D devm_add_action_or_reset(xe->drm.dev, action_put_kobject,
> &vkobj->base);
> +	if (err)
> +		return ERR_PTR(err);
> +
>  	return &vkobj->base;
>  }
>=20
> @@ -463,28 +478,17 @@ static void pf_sysfs_note(struct xe_device *xe, int
> err, const char *what)
>  	xe_sriov_dbg(xe, "Failed to setup sysfs %s (%pe)\n", what,
> ERR_PTR(err));  }
>=20
> -static void action_put_kobject(void *arg) -{
> -	struct kobject *kobj =3D arg;
> -
> -	kobject_put(kobj);
> -}
> -
>  static int pf_setup_root(struct xe_device *xe)  {
>  	struct kobject *parent =3D &xe->drm.dev->kobj;
>  	struct kobject *root;
>  	int err;
>=20
> -	root =3D create_xe_sriov_kobj(xe, PFID);
> -	if (!root)
> -		return pf_sysfs_error(xe, -ENOMEM, "root obj");
> +	root =3D create_xe_sriov_kobj(xe, PFID, &xe_sriov_dev_ktype);
> +	if (IS_ERR(root))
> +		return pf_sysfs_error(xe, PTR_ERR(root), "root obj");
>=20
> -	err =3D devm_add_action_or_reset(xe->drm.dev, action_put_kobject,
> root);
> -	if (err)
> -		return pf_sysfs_error(xe, err, "root action");
> -
> -	err =3D kobject_init_and_add(root, &xe_sriov_dev_ktype, parent,
> "sriov_admin");
> +	err =3D kobject_add(root, parent, "sriov_admin");
>  	if (err)
>  		return pf_sysfs_error(xe, err, "root init");
>=20
> @@ -505,20 +509,14 @@ static int pf_setup_tree(struct xe_device *xe)
>  	root =3D xe->sriov.pf.sysfs.root;
>=20
>  	for (n =3D 0; n <=3D totalvfs; n++) {
> -		kobj =3D create_xe_sriov_kobj(xe, VFID(n));
> -		if (!kobj)
> -			return pf_sysfs_error(xe, -ENOMEM, "tree obj");
> -
> -		err =3D devm_add_action_or_reset(xe->drm.dev,
> action_put_kobject, root);
> -		if (err)
> -			return pf_sysfs_error(xe, err, "tree action");
> +		kobj =3D create_xe_sriov_kobj(xe, VFID(n), &xe_sriov_vf_ktype);
> +		if (IS_ERR(kobj))
> +			return pf_sysfs_error(xe, PTR_ERR(kobj), "tree obj");
>=20
>  		if (n)
> -			err =3D kobject_init_and_add(kobj, &xe_sriov_vf_ktype,
> -						   root, "vf%u", n);
> +			err =3D kobject_add(kobj, root, "vf%u", n);
>  		else
> -			err =3D kobject_init_and_add(kobj, &xe_sriov_vf_ktype,
> -						   root, "pf");
> +			err =3D kobject_add(kobj, root, "pf");
>  		if (err)
>  			return pf_sysfs_error(xe, err, "tree init");
>=20
> --
> 2.47.1

