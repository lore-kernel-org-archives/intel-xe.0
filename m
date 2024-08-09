Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FDDC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 20:44:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A11E10E9FF;
	Fri,  9 Aug 2024 20:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cLWPtDOM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2BA10E9FF
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 20:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723236254; x=1754772254;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XgE7SSZPUgWNXcJUl9ZX8Rtch/zsspqhPsoLnpioZQI=;
 b=cLWPtDOMW0TjI7ButJcoHBzuTpfQXnAR2I+/RSesiYcFcPQFGNHtIIwd
 /xTRaW0a2lbxyOVrFRj2PUtktb/RZcjNGb5OCeKOWQt1WPez06sPt4Coh
 G1ESiAFCl0pAnHGRFk6mqvskbYnTXA7utCGV9kHrmzlNrUaMYoHr7OKM3
 YM5gvYy5azscKr9dx8NNijuxfVx0ZM4xnuGQemNH/rPQHXqRezyXb7HEZ
 bQpf1f5Gxr+jDXm/kJJEhP9423Y7Obwq9+wG0JF2uSRVof5nMDtzSZBVM
 vG8cQgfd19A1+LqZlfjfccE1PS2YYq+HzqY3cv637MUwY56ya7m7hekpn g==;
X-CSE-ConnectionGUID: pAmrjYuOQ7ea0pE2vM2HKw==
X-CSE-MsgGUID: NSy7hf+1QBiMieWINmqsyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32002023"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="32002023"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 13:44:13 -0700
X-CSE-ConnectionGUID: dTOVl75UTl6mANG4Z04HPA==
X-CSE-MsgGUID: 1rvk/85zSeuMR89tY3nq1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="62619697"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 13:44:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 13:44:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 13:44:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 13:44:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 13:44:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i/ipnq1ri4VjE5pVuFVJab34YpKx+eKxqJLTUKFR/H9BBLhNZ1T+C/hA7lOlv2gsLuos2S0J8w5CJ0h2626HVf8PEVT2xemCTjEZSRM9PIRbQto3K4l6fQJOLmFzxybbVMPe2G/WgIop6nY3AY1Wej+RiwJEBeNj0L/iVCMlvJy7vSDzdEsIDMZuPKWS1W8kRZFIA1RPBALQCyMkD5JTBO6FHWWjpDwxBSGVjuWnkzvK7Dqu/JCcxEDYrerM2tOKfT7SxW6ZszihhlezIxLHog9b6LSNC0P3rK2r3iawZDqdwAizm10kTaIX9L6gkLmnjyJCkGv6wuyEZax7E/NEvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qPbWUyzBvVUFgjVJAshAlQdzzIJ67jIaPH3MflRdHI=;
 b=pLL6VXWTTJO8nMAPv4FnUN6ShURkgHaVdCb5qxuBXIf0Sg7Nq49NER3EIwcg5PIoB+OEr18AYBqCsixSzKvVCcCmYXHapHwxNN2bHxbS25OaP7wB+NH3TDRn3Habu+GdrwO5Y0/EmxopnXsM6CxDtowtNu1pYYN3fin/rjAlbnkAfQToEeSUwqPaTnKhUNKTJ530WjGgbo66d5qxNdNvDcx7x01A13nEr1tpCsAb3aazJJ5TunaGkgN3AKf1ZjPMy/TPNLworFpZh7DHkX78PpO0KoAbH9Pi6UnLqJ7Ac6orBWNuxgZoIfRrw00fMzyTDd72gqooqyVFPhsMYP8zAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB8762.namprd11.prod.outlook.com (2603:10b6:8:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Fri, 9 Aug
 2024 20:44:09 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.031; Fri, 9 Aug 2024
 20:44:09 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Dugast, Francois" <francois.dugast@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/5] drm/xe: Reinit msg link when processing a message
Thread-Topic: [PATCH 2/5] drm/xe: Reinit msg link when processing a message
Thread-Index: AQHa6pEJwO1s2I5CR02fd6uF8kTtyLIfZHUQ
Date: Fri, 9 Aug 2024 20:44:09 +0000
Message-ID: <CH0PR11MB5444EA5EE8615FA3AE869E34E5BA2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240809191929.3138956-1-matthew.brost@intel.com>
 <20240809191929.3138956-3-matthew.brost@intel.com>
In-Reply-To: <20240809191929.3138956-3-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB8762:EE_
x-ms-office365-filtering-correlation-id: f14fbd4a-d4ce-472f-b19e-08dcb8b4051a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?TY2R5Ywgi8M4WeRRQQ3UjuicTW9PNeNlxiZMzQyFyDsxN2APP3CsynzPt9iP?=
 =?us-ascii?Q?s/gODdShQcPaj+qzlkABzG0aAerc1CCdjD85tn9qVVuQqJMxRcWo11Gds0vv?=
 =?us-ascii?Q?uWYwHOjNnDBSNqaX7TAquLjTVReAUK7bDTsZm21ZUutKE1edYrcxcgxJ+wJN?=
 =?us-ascii?Q?+oLQKfqAbyn2AaGPbbu7IM4ws7oR5Bn1TMq1+5pFaxJCi2WUHEed73jIrqTu?=
 =?us-ascii?Q?BKWM2QAhd/fAHQfsCzEJC8+j5s1XjsyJLkqLw0nQl1xTcd1S49xAneLM69Tk?=
 =?us-ascii?Q?HlVGp66gwX5fRpLJutrRmbm70ViGsR22QZ7OVJz72B+48drwUAbRDacJjK3A?=
 =?us-ascii?Q?x6K2i3/fRqlroA6tIvxolT8XgPAbzqFhmSX9KJNf0nVL0x/GPOSnrcXkOqH/?=
 =?us-ascii?Q?ZD2k2c4WEDbhi3WFj+DNjdXggBMGEt3A+R4nId2dawPgMBbP6tjdGgBdwD47?=
 =?us-ascii?Q?PVD0d3iQftID7MzhuBOWTlPS4y1jdIhbcm7x+NqPBHI03fc5No2n4HL3B5pg?=
 =?us-ascii?Q?dgX70RHiedCndq66040pbrfIHh13XyE4yGoac+tojZtu8PE1MB+FeH7/H+ki?=
 =?us-ascii?Q?G6NYwf4lXwGQLPgqLm945pmxenzBKbEtgeyfcif4zvhMTM6imI6usHlpZsE1?=
 =?us-ascii?Q?DoOQi9dLW2jG9BBbKNaduIJ8jXHrTCY9jYWFJ/98fxlquwmwVNpwhtUW2s1e?=
 =?us-ascii?Q?6vww+AGLusSgKrL84CmCqz+JhvE/V4bjz0x0HxAqif4MaAgo5kmBMUq9oV2d?=
 =?us-ascii?Q?iI30bzEKi1wf1zL1yF08+82Nf17n8TmcbVVH7otccV1GX+ZO5r/B0GRgpJMU?=
 =?us-ascii?Q?AyLbaaoPoXUbXOkPpkswDZGJgEUg2ruRmunlTKJqecCQd7OCcwRfMQ1rF3Xi?=
 =?us-ascii?Q?tqjrY3S8RWYXE5/NxtFCZR47zQ5+P3Q1ol1jqNaKfq+UpWQilQb3ICG0QzSd?=
 =?us-ascii?Q?E/UliX/eX2dXZ7P5lnAEs9S9jCPUyt+pnwDnANjEAJfgg6kATwAKWksEk/Fq?=
 =?us-ascii?Q?n+tEcn6Ef9+2JXw9Y08gd2BwxsN0SIcohEpRYfkAK0681hJpAr0rA248s4RV?=
 =?us-ascii?Q?PJmS3GEAaT41jboEVagQkT9csc5jtncPzfaibdcd76FmUKdJFdDi89DTyJI9?=
 =?us-ascii?Q?8MTHWI+XODKR9jo9GI4BCN+udASSxs0pPKu6KMtz9kVjciUmJvDW4MKMhp3A?=
 =?us-ascii?Q?N0GBH4ZLbRUBwTLMlvvaToWmhY+MDISLH/4pcKR5ONJnBQQWaqimFyYRTZP2?=
 =?us-ascii?Q?L8+iPXP7orsGGRVelcpEpsoO4JfkKETK9Z6vRInpd4McVKTAHZNorz60MBOo?=
 =?us-ascii?Q?FBmA/enDUpVvkn4y649Y6y8KvYQsK8gnQ9/gDJXVhPNxma3tXykLKi3pukvp?=
 =?us-ascii?Q?kiZrTJ6sGTuPMbHiYZMvLvZ3y8qcLLyVpUvRc7Q+gX9uwWFtBA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fogeR8lbOpqpUV2AqY8s/iOf74XdN5FgKl6lewx2xgIsrrfavPg2h/GJy8gm?=
 =?us-ascii?Q?fabS2bEaaub5j8v0GwK0mV6iHVibtyJNvlcUgLFndQooamJxiVrlYpS0LqgY?=
 =?us-ascii?Q?QLb0e7ceuxqdJQ3rDP69hueeD+WBmN4yyipV0aleG64/39Q1clM7Zl9nbaFs?=
 =?us-ascii?Q?5qxmxr4lD5SY3dHNLOfNP/+kG3qgpII1nwgoNmXLzcekY8LINbVBVixf2+nz?=
 =?us-ascii?Q?gC7mV6Du+XUki2KvITSthii+KPCNsQEoLEG0pJwUz8ZlMpZpO5ANuTFSNBfu?=
 =?us-ascii?Q?qim0P3JQsslDleIRj6yQ5t1oBSdk3IGse3hq4uPM1+WQubImLYwhDqVSKbAv?=
 =?us-ascii?Q?UdHu6yQB6J7wU27U3Hbj0yA+iqi12lSoDFYKE4ydWpB+NS+p3L2iOvDEGMNI?=
 =?us-ascii?Q?iQ7XVnzStPcRkvS4OEJFDs8Te5j17qCVRJQoN1BE6EsgDhVki3kzpAI39tDY?=
 =?us-ascii?Q?rqqTIGECFot0yDSlFqnJpfocliRJMoi2q1tRDNaS+xEKp1rig8tO8Y1FB7tc?=
 =?us-ascii?Q?vWKOYqc9ATvh7dfgc1gLWL0iLndULd7y0tA1aNFk3fe3/EAzxVnJZ0mTKmwK?=
 =?us-ascii?Q?nVVnFY4sST5u1wF/XKUeEUpXhoeX11FDKSHb7s67QmMRo+J8WqRvOGRInwAD?=
 =?us-ascii?Q?2fa2M1OXu212AcLsbpgz1jWOHJASxhRjPF9FvhGSMLwAdv1yfN1LDsqmjx+2?=
 =?us-ascii?Q?X41XcxuRrrMLI6u056sOvONcefovI9WBTU63war9XPuKC2Cxg5ZgwYgP3jM3?=
 =?us-ascii?Q?4mpdQwiltEWAI0bW/LUn2QsQE0avBRwKkNbG+nDtOONHhef9Su7icaIRfNdq?=
 =?us-ascii?Q?V4oCiPpmXUAufKmzDgs8YaDG9+GxBBr/LJ9sAgwtS075F90er/SecS+7TpWI?=
 =?us-ascii?Q?uS4/amhl57viQLwe8x+a4ReOE1VMnex/RcHm+82KdOsMI0Xxm7gZyp9Qw59C?=
 =?us-ascii?Q?qyMuzm6gSUka+YZ72w296x/dGhHxSQBwV3P6kQYuat7FFHO3U/Nl7Owb9KG5?=
 =?us-ascii?Q?KFjnEkPsaOjiEwcwyWN58xMcP89pshwfIBiqj4hxlIpYDS9hRlzvY5Tq7aSc?=
 =?us-ascii?Q?EPr9jKWqvgLq08whX6ab92gUazOE2TyIRQqHjAF5NyhSJkzp7swoI5fRMC2t?=
 =?us-ascii?Q?UP075tEE0a9sRuNyL4uwnQv2UvxF/CT1INCHO6Vt6RZuB6VGM1FWa8Rn84Mg?=
 =?us-ascii?Q?tm8s52PGo4lWsDi8lV/xEmZ2mt/wrbfMUu8exBBAtlU1fwb3QJA7QMy2cyX1?=
 =?us-ascii?Q?JbE4zIiHBlefEGoKIGEYygEal9r9fas82Y2g/s8L96XllOcPKoqW8udkbfWn?=
 =?us-ascii?Q?r9za8S2TjrcS9Cfnb7Zuihjsk07ZM4com239wThotW13q4+no/3wAe/Yh9pb?=
 =?us-ascii?Q?zo3olSjf/ZQ1v6r89Jm9h5RCb7ixg2J/lsTzyvKRUHX0zRL2kGuCY8gEW7jY?=
 =?us-ascii?Q?ujpmEQm0yckxbSBod2/OnCD0Ah/fao2U/tFC8uGGupdK9csQx3Fp4nh2laPE?=
 =?us-ascii?Q?R0+3bj0JJPJq8o56ElzC+znKbRmNjAJXYKln0q6BY5Yh2w/miA3PsvmXQtjO?=
 =?us-ascii?Q?tWW/5oMC858WdIg8vzxiqhMR125/Sh15ZAIofTjD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f14fbd4a-d4ce-472f-b19e-08dcb8b4051a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2024 20:44:09.8807 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H6XNs+OjLssRQVctYgQJEDrcdST9GqYRaBRy+pfskaD5pVpTL/rMJm3+mQqMt+XVblbseQC2MKV0XIQKLYvBAbcWk9dAlG5LJk/o0nvzdEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8762
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Friday, August 9, 2024 12:19 PM
To: intel-xe@lists.freedesktop.org
Cc: Dugast, Francois <francois.dugast@intel.com>
Subject: [PATCH 2/5] drm/xe: Reinit msg link when processing a message
>=20
> Will help to avoid adding a static message twice.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_gpu_scheduler.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/x=
e_gpu_scheduler.c
> index eea71c67cf2a..1c703e8423de 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> @@ -31,7 +31,7 @@ xe_sched_get_msg(struct xe_gpu_scheduler *sched)
>  	msg =3D list_first_entry_or_null(&sched->msgs,
>  				       struct xe_sched_msg, link);
>  	if (msg)
> -		list_del(&msg->link);
> +		list_del_init(&msg->link);
>  	xe_sched_msg_unlock(sched);
> =20
>  	return msg;
> --=20
> 2.34.1
>=20
>=20
