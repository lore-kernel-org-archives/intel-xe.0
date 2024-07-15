Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF07C3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 20:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D3510E0CA;
	Mon, 15 Jul 2024 20:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ar2LlbjO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD23410E0CA
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jul 2024 20:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721076835; x=1752612835;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TeMk6H9C81zrlXwpY0d0fqTTJwjRKroVuH1esmx+VAI=;
 b=Ar2LlbjOfERBLzV3RhLL35LyAdNRXpwMHrTtL6bvY/lg51EWjLoWmaCu
 ekyB4Dckjz4bB9oRlNH9R55zlNTHHGwhvqxrme2viy7tyKbcN2uC08Tdx
 Kw29JWCPY8yaXagK29aBEoROy6KYG/ZSzYBMtdqLe9WY8J1GNsbiyClPe
 ydKJAA578BfBbrimX1SPfMjIZBO6m7B8OF7gIAYGjAICzuspLGyV3UXkx
 mY5beYggGlVN5sv8xoBcpuH1gS5U006MxTvPukCDYWUP/j7TgPu7f+EdB
 trOucWAOSAUP+UdanaC9GyjoLUJxaPXEphriHLmpykJhlMSpCQUOYa3ZA g==;
X-CSE-ConnectionGUID: AaZlOUHcSTy40DVSRxkcrA==
X-CSE-MsgGUID: mz+GymztR523TGL058CS5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="41009297"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="41009297"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 13:53:54 -0700
X-CSE-ConnectionGUID: UwGCYemZSDakz+9UdVat7g==
X-CSE-MsgGUID: m3KrnHmfRma/Twq7RFyRag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="72986835"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jul 2024 13:53:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 13:53:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 13:53:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 13:53:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhw4ns5V0FZ087DNZYArIG7P8oMae5tz11KKS8WFJzNMirVIvoyMLx3H3lV8IU+t3f462Z6k8OuLEeNvSN65OoJyU23ak6AJjtUT3MAlycNeFuhNdFF2MTeHuY+SduBtOY5Ulr7qRqooSP+PUQreJGZOu8QyByevsViqCLzqMpM+e3YMjdQo0y930v7/zoVKE6Z1btF1WWy255PiPrUO2IOYOYUcxvUGwOeSUH4YGhI/9Nlajw8ofFGlITRVoDmCNHzisysdCiMyB3JiKYDtFv6ob3HVakI8lOG2Rz0elQG1LwbsS9HROW7ryLoYWpv/viYFCiv8fk/0gl2WJg637g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTVYXHKGxLeRVy27u6W1BRxRi6ITaEQSDMxZGvyQdHE=;
 b=BnbARA2qqwClRjt6j7G27v4s7/McG27NQqMismJT2ianJq6oEGNtCO5/hQeTtidSHTVZARbqMoZ1a+eWU0lKOOl23msNuF7hUASm2+fM1ENecfzFnIJ+DcQfuBGOzQWhliMgP8knVPsK3LhyBxD1PAzosu+NPcyPeh4TD1Wcra2oxC6Gp2rgL04xHK0nPsAPnGmW7ZmQe+o3qKUq1aLSvDbWm56Wm3//04G+0St/Ll+88S+eq4MUlcgV1K7XFYMJTba8m9lRtIsZE5aKeBUtPCFGdxNmKMYoKmUx1haSANgfH5pdzXTpXVg00PWWqklR54f877X6eWU1g8cJinaQJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB6292.namprd11.prod.outlook.com (2603:10b6:208:3e4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Mon, 15 Jul
 2024 20:53:48 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 20:53:48 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/2] drm/xe: Normalize NEEDS_64K BO flag
Thread-Topic: [PATCH 1/2] drm/xe: Normalize NEEDS_64K BO flag
Thread-Index: AQHa1uG4hNUxMvfy3Ea5fPNE4GpfPrH4RAyg
Date: Mon, 15 Jul 2024 20:53:48 +0000
Message-ID: <CH0PR11MB5444A42FB3B494DEC308E6F9E5A12@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240715180538.1418-1-michal.wajdeczko@intel.com>
 <20240715180538.1418-2-michal.wajdeczko@intel.com>
In-Reply-To: <20240715180538.1418-2-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB6292:EE_
x-ms-office365-filtering-correlation-id: 073b0d5c-3dbb-4131-029f-08dca5103992
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?JYyJFtvJQ9/d57QdUeif1yokLRaGNDYPlUYgUXqIVvEJdZswMJNnL7tKxALh?=
 =?us-ascii?Q?Ke6s2PwmQsilbOJrAgg22dMxglnsden5aLFHkOfHS6O//wdNlY7yRmjgjX4w?=
 =?us-ascii?Q?pAXdQREzB18Z9GbBXBSRrjY2y3ZpYJr3A3ti1CanEqymlxzVLovSM3VQEiHe?=
 =?us-ascii?Q?4qVnUuMbHnLsAN1Dm+KR6CZJx7HQaYm8nzLWEEGhEsebtsilmqYVyXEHrD49?=
 =?us-ascii?Q?HLGct1UW/TCuxAAXm6/1uuNOdQfbkI91mbpikeU3qHIY5BloA9RpY+DfV/lf?=
 =?us-ascii?Q?DYlFYX9IpmhXpEaZslAI+i0/va+WDbIcQwI0Wj22zqluVB1OyQm1s9bKfCNL?=
 =?us-ascii?Q?i81sbKWKyMSsgrpK4PJceh9igpa3QiaNtpjk3L1IS1+QEJ1H0eyzHluFJ5Y5?=
 =?us-ascii?Q?JPjgBCofPTyzCPpojcZDw2dnpvi4GcMwCE1zhXERWQoWyXMiv5B5Slp6q2sL?=
 =?us-ascii?Q?2kE8nU0dS4qTfu0OiiRxmH/9mVmNH2lM2AoeU06rInEYsi5GeRQYBgxUELny?=
 =?us-ascii?Q?Ji4a2IzLPKUpYxodOQqsgZV1qQp05INY8u0SB+z6puULK0NiQIm7Sp9dGRjT?=
 =?us-ascii?Q?MDZ87PEjuckcy9Si44x3AOw9LFY8pVfKqNH0+cjtchdf3UoivHwdwCYExHWp?=
 =?us-ascii?Q?6g087xx5hLp6+0KBxtjgFTtpvL9Y5wUDLpVloNCm/ZsyZpUVfLLrp62NBfqw?=
 =?us-ascii?Q?XG9oIxrkBCvW4n/016vERXX1ZUyRzOfklSYtYxmlidMrhYAf43h08jY05ZwI?=
 =?us-ascii?Q?cXyj7mjX7baAtYv+eWIL1v4eKNwVsN59d4Gzwdk5qJajEMO5ytxR5klUWtiQ?=
 =?us-ascii?Q?UbD0pUa06ZPdLaVE5DWRoBq5bT3CJW0fVo24WsG1VklhMSeQ+p8sG/jxQkwA?=
 =?us-ascii?Q?UXbI/dGJzy60goPFTpcParxeLHY1HUpLzQQAsKd5uPQwvEWMr9j4InQ7rDQW?=
 =?us-ascii?Q?B1tK15zty6C6o5tpap/G3ZtuPQYn+9fp+GMvEnrZDue/cEViwcBTGMSntdww?=
 =?us-ascii?Q?vA8JK6PfCnGxIQiu0+Isg9f0MlZ5OITKfVmtJNUJtlEh8etDCjNeVcH9mkHn?=
 =?us-ascii?Q?tUDO13VNnLgK0tWlAYYEnzOWxed6vdcNdy5ZzwL7vYs8m/GdnIgrXe0pkc9/?=
 =?us-ascii?Q?uyOAQWKJdcieOFvuRkCLh3dt+ELmcfTNCQdjEBecvVtk3yuBRGDzDH5bvuUp?=
 =?us-ascii?Q?MDyk+s/CIY0gsdynJvhsbdOzLjJUH12PMWnwh3lMOgbjGNDtplUXYcm0YM75?=
 =?us-ascii?Q?SZKmKW497zHqG9kZHJG491bxZvJDC0iN/DVWmSjMLPe00Kd+s91up+bqAqmc?=
 =?us-ascii?Q?DVQIWdXlmJbTohWan8CdHtV3FsFF9GSF6XIe5VH/zYVlz46ToXhMWVZZqohO?=
 =?us-ascii?Q?x1aoMBb+QcpgY8S8abI/BvhVypuJ1gUt0vZbJ/Y5qf9IB/Y9CQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3aJM+6LY0dN3T94KqyGr8dLoDxdMJY/tuyKAIdttdlxnziTktaJBP4jzb4lF?=
 =?us-ascii?Q?+TYVkuLb07kKEBRjEQcNqxfHP0jtK+baFySjI486icjGTwOecPU+TCbpw70M?=
 =?us-ascii?Q?U91I4NkFYxh+karbiD+H0cNeTLke8q2UXBKRebHTKNFEB29bQVmGX/QHaqrU?=
 =?us-ascii?Q?IJ6oiT2/gG07L20XnAFHNgPYY2H3LBYSp7+yA2a80m0NBzMo/daeH9qm2upS?=
 =?us-ascii?Q?cBzZwMzcMzySHQy0rAfrf/FZSIq5e3npCTuAzyiqCMof24E91ALfNE3rZD0H?=
 =?us-ascii?Q?Jm3uoYeVA4RjoIScpsH8vglGb2iPKgbj7DhPXi2rgYUsi7FsS3NfsQkwWMsv?=
 =?us-ascii?Q?mvjiJLabnAowtjRs5NaHG+UmssLsvXLkcZX3CkPDb01Gzws2KJU+TBc/jtm+?=
 =?us-ascii?Q?PSwpujqHVaNSZjHDQKibgldZ9z516F5wJabjjinwjg5WJH10vq8aAfmMVaBr?=
 =?us-ascii?Q?6oFr/kQ7kC/SGUhxuoroicxe/n+ZY2ObFoNbw07ts/9o3UopV4ALEWlzUbgJ?=
 =?us-ascii?Q?h3W+ctWKm/HQms6UjPbYc4+uFsxZguvfrvvrdJOtIk6x2hKcVFi3dm6cdCoK?=
 =?us-ascii?Q?DWZ7Kunc4EwWqzkTFFF58v0X4JFt9rvlnjSnQk5rF+QNeBIK4r4JkAq1bG2u?=
 =?us-ascii?Q?04r6nUVZ6EdRupLKHoaKv+IzyJzEWYrpN9iGHWK/6Ja/1lMn+5VQrr/fl9/j?=
 =?us-ascii?Q?PyZW4mF1wreSS3+0y2zvNIEOFNCMTLZLMpugPYIZBEl1XAGFT2nDHLDmFAN6?=
 =?us-ascii?Q?u8ZxYNvbwU6tFMb/4q467SDCo4eY8KJKxAuVwEXQqgAeoe9XM9FSBZn7zyAt?=
 =?us-ascii?Q?fF7e2m7bYzb/IYto4W22q9rcSiex8nPOzttYad6IdfR7pmTRZSAadG+Oh7or?=
 =?us-ascii?Q?lqbHZWd5EqcopbbAR7AzLdmXM+oQjPWKfK04ziojKMhBymYIIrHcCg9JHcO9?=
 =?us-ascii?Q?i3E7TnOANwL3lUJgwaKlb18+ctl499kuz3Y2pyxRzXn2cTF8xRXoXV3tSF7U?=
 =?us-ascii?Q?errDGFovuExLvz6tzpclBcd0usgFOOkwOe0LQBDH1GplJQnMhk73czToCd6F?=
 =?us-ascii?Q?9DJM9h3c3yGkplmeK5yvpm8xw3th0s4aIPGK/efw5TUwG/FO2LTWJDx/v/tJ?=
 =?us-ascii?Q?HymmddHFVeFps8oMrGsDZ6ZKS2colhPvQmID+TatUx2w25uM4JUPlJgUU6n2?=
 =?us-ascii?Q?550SlV4jwNH/QBuYZidaiQaR0+9HZKAldEUJdsq7ea/TBSm7Ql94UPahA6/T?=
 =?us-ascii?Q?dQyZq/yAWC198uuZpJt8FAswzV+9l9AnEl8q/8q7xlOlil7O+GIaBZISSExD?=
 =?us-ascii?Q?hN5pfirQMwbrI3rvJpjD62ojcThLOyQyRmZJQV3WNjb/UkPOaVQ4UyTU8CPr?=
 =?us-ascii?Q?B+Ww87kTtxG7fmhS0KN7eN6L5dse+GQysfMd9Rbov2M21Kd6vFOsd05kPcAh?=
 =?us-ascii?Q?BdVcmz3ezVIhrBMxZ7AGV0XQ1ZnpNRkbhnfzHZyBB4iE0XnJVOPafHJJqKt1?=
 =?us-ascii?Q?GLs3LKMTTCW1FNjhVQmtVguBgf3R2nyrGF4W2dLWqAkJ9PfVma4wWIuB+EEa?=
 =?us-ascii?Q?PtmUzh7foCVkSI7pf8k5LOh4peKL3+JvVTsuAu1M?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 073b0d5c-3dbb-4131-029f-08dca5103992
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2024 20:53:48.3260 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VI/4IX6CNxLGz21yNWFkFmxoWbQFKE8aIoRjKhllLtGt4E3f3g4vVJ54YSQL5yJU+sXu1zJTCqrrF0VotAEhnxSUMDG76gq4crk0nIB0cA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6292
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal=
 Wajdeczko
Sent: Monday, July 15, 2024 11:06 AM
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe: Normalize NEEDS_64K BO flag
>=20
> In commit 62742d126631 ("drm/xe: Normalize bo flags macros"),
> we normalized all BO flags but XE_BO_NEEDS_64K. Do it now.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

I mean, if it was missed in the initial pass, it's important to realign it:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_bo.c   | 2 +-
>  drivers/gpu/drm/xe/xe_bo.h   | 2 +-
>  drivers/gpu/drm/xe/xe_lmtt.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 31192d983d9e..da35b4a21739 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1264,7 +1264,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_devi=
ce *xe, struct xe_bo *bo,
>  	if (flags & (XE_BO_FLAG_VRAM_MASK | XE_BO_FLAG_STOLEN) &&
>  	    !(flags & XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE) &&
>  	    ((xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) ||
> -	     (flags & XE_BO_NEEDS_64K))) {
> +	     (flags & XE_BO_FLAG_NEEDS_64K))) {
>  		aligned_size =3D ALIGN(size, SZ_64K);
>  		if (type !=3D ttm_bo_type_device)
>  			size =3D ALIGN(size, SZ_64K);
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 6de894c728f5..2afc50132c2b 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -36,7 +36,7 @@
>  #define XE_BO_FLAG_PAGETABLE		BIT(12)
>  #define XE_BO_FLAG_NEEDS_CPU_ACCESS	BIT(13)
>  #define XE_BO_FLAG_NEEDS_UC		BIT(14)
> -#define XE_BO_NEEDS_64K			BIT(15)
> +#define XE_BO_FLAG_NEEDS_64K		BIT(15)
>  #define XE_BO_FLAG_GGTT_INVALIDATE	BIT(16)
>  /* this one is trigger internally only */
>  #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> index c5fdb36b6d33..8999ac511555 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> @@ -71,7 +71,7 @@ static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt =
*lmtt, unsigned int level
>  					     lmtt->ops->lmtt_pte_num(level)),
>  				  ttm_bo_type_kernel,
>  				  XE_BO_FLAG_VRAM_IF_DGFX(lmtt_to_tile(lmtt)) |
> -				  XE_BO_NEEDS_64K | XE_BO_FLAG_PINNED);
> +				  XE_BO_FLAG_NEEDS_64K | XE_BO_FLAG_PINNED);
>  	if (IS_ERR(bo)) {
>  		err =3D PTR_ERR(bo);
>  		goto out_free_pt;
> --=20
> 2.43.0
>=20
>=20
