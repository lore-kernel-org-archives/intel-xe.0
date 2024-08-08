Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F535C52D71
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 20:58:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E963610E810;
	Thu,  8 Aug 2024 20:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dC+GESQo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD40010E810
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 20:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723150737; x=1754686737;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tBlMjQHqjJr4+AULuoFwfKow54ZfPnnQmw/U1HcJXgE=;
 b=dC+GESQoH8hNzrE3JSSrrwNSWPSciei4pH6ISzJKaUlZpcXTbosSMcQr
 6WDSiRfbPcUyTQGiy9LjHNEqSlvNdcACvZhbvlDXQxFDZqBtImMB+Dn+l
 FhwoXgye7tn17cl+6KrGDeQAbTEZDCRJA+l4ktoXeZi248JkxgN6PSuQM
 DqXsE4+GfmPPKiUzidwCGDbwZ3Qop7WZwEEzqnFTfe9D90jhesRmBHgPP
 ldnkpg0Uucc0hpzy+aLs4VjE04n+LtIeBnjIQ1lewZzfUmmnJiWRnf2a7
 Sinw2T2UPCyNArflcCrSzFThiOkAP9+vVrTytHfeZTppXECyDrjrrqBzx w==;
X-CSE-ConnectionGUID: AwjPgpVMTJ+kZFq9R5s7wA==
X-CSE-MsgGUID: 4UFtnOPETIa7oD9/zGA02w==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21114140"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="21114140"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 13:58:57 -0700
X-CSE-ConnectionGUID: G4qxbMIrQ0Sh3Ql3z8CdLA==
X-CSE-MsgGUID: Foa7iR82QuOJ+K+Tu1XDSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="57258070"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 13:58:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 13:58:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 13:58:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 13:58:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcmR1CfA5VObISfjG90gMZB7yGrY1UKOgzBUNVmFqK4jXQ1oHDPZtwkz5RziZKt8F2uaj9kcUGRIKIHG/BLi0qbGJsNnjWRNHFcdC3wgGkt5vVHeBKqSJlbs2pjKMc8UVfcyPKvYJ3INnu4Nw8pMa30a9Vqe1B2jDSuKmaPe7b5ChvfvGDva0fVoaWv4WgF6K3mAwtC2X1CjP+jmeQML/DjT4zmweiXkK0xXkULUm1xHaG1uJg8UuetK5z3sX4cW4gW1NEq5hO/TXDt3UkupX3MjX8R8ZmEUZOnj1J0fPMEVR9JYqoo3a3ygd0wiZyMxWA41EUWqqbSfuqCnFVALHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22TEIlu+UAZ92q19EDGlT9n1GYNUUKeqLpN+SsZEu7g=;
 b=EB/pD6/2SXmVc2LUDr6VxqhZkosBUCORZ35uMkW3Uq38YlfIEdDDkcx5G4ThgCTJ3/CqF3Lxes4MEqETDmtrYduMZ/UEzIer1Jq6oK+J33k/Azvf2WeFpZm+lQHkGrNhX0eROKzmXo+pIroazqI+aKMnfZB6iXVLMRXGnY2IyG9YtuuznFtuIzk3TkfdfNvG+BhJUm6qYWir5FxdT9ZgjXGJCVqOC+r8wF8+mIEIS2NETrH7cVPeFdtLBRZujarWzSksWUWcl+PEtxOJCaJ/ZvLzOUMP/B8o5QgU1zc+yWMwjO/n57pl+JLWSlX+/SvRvhI5SpH8c9jhyfYSraj57g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB6241.namprd11.prod.outlook.com (2603:10b6:208:3e9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Thu, 8 Aug
 2024 20:58:52 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 20:58:52 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/8] drm/xe/oa: Introduce 'struct xe_oa_fence'
Thread-Topic: [PATCH 2/8] drm/xe/oa: Introduce 'struct xe_oa_fence'
Thread-Index: AQHa6bpOUzEiGOxEFk2nfds9f1000rIdzMpw
Date: Thu, 8 Aug 2024 20:58:52 +0000
Message-ID: <CH0PR11MB544473F81952DC9812D05CABE5B92@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
 <20240808174139.4027534-3-ashutosh.dixit@intel.com>
In-Reply-To: <20240808174139.4027534-3-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB6241:EE_
x-ms-office365-filtering-correlation-id: cd811f25-4115-4bb1-0eb5-08dcb7ece8c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?mlPLAu63KK3iN5U/UfP/oza8i7AK5uSEJ3U3P9FK8tLLDTjJTn58BXBJVnL/?=
 =?us-ascii?Q?P7weeuX5pkGYiWcep5ByH+7j9NUdevHAAfXxm4D3KAtJug8OadLqcoKUoqgQ?=
 =?us-ascii?Q?0MZMmrkfxrrxKXfBnf6h87fUr6BNz+iULvikCOhwiP5RB2GQVizSuvtPnTqD?=
 =?us-ascii?Q?edoSbr+hMBp+Y8IWeJimFyAvGrrRaIOGxA7LImiN5p7Akqlt+Dr1h/v95XSk?=
 =?us-ascii?Q?K+p3+UCzZN6k72GoMLWg+BCreS13a0fIk6VjkLN6oRDsj723FpLgwhW+v6e9?=
 =?us-ascii?Q?Z60NjeqD666q4Eg+61bgEbEUsZp/nmTHKot0K907FvHj8rsu+3hH3E7yNTpZ?=
 =?us-ascii?Q?5hG6SV30iuDLPZn/IYg6X9bVpnkYqn+qBem06dmJYWaRc16t4eLl5s2QPqvX?=
 =?us-ascii?Q?lCa/kgDKOdx394tvWfvaxxo27j0nLFjl13zHRp25D0zeTg1sgr9wWhxqAubH?=
 =?us-ascii?Q?uca3hCAugDI5A6ymZTSk/pdfxhn7yTyXuXtpmajMVgUWNZ8vuiAOydedRcZu?=
 =?us-ascii?Q?wjNge3fmbDxCbnFB/uc2oGqptw5BPbr44DWlqbFwSe3PbwiFkjLcI0Osn7ZP?=
 =?us-ascii?Q?8aoANRfzBdlJ0yVcVhOitLq7JIu44qak7uNVHPN2qElX9rSAVr7o8iYDqeT1?=
 =?us-ascii?Q?4VajU2fKvEq0nVTF5eJodRpjSqMJc85EZQpGxdB/y51qxenzvOeuMrqiEW0C?=
 =?us-ascii?Q?OrRu3wJtUjhsoDAERZXP9IC6j3qGAqmG5WNLjRyuk+I2fXyatEnAVKQBMSVZ?=
 =?us-ascii?Q?BULopgEzgT5jbEGJ1aDrab0HERhrZDYBGuHliuJEWP2VaRQDc9AJiNndHR8+?=
 =?us-ascii?Q?a4jwBzGifK7rDacOp+m7cMDE76fFgKqaGt4sWvhwpDtKzx3T+ORIzbZr+m/m?=
 =?us-ascii?Q?ySzMkmXu4OthkHBsddf3r1kEG2J28KNuOejGVLfTYTMRpukRl5QuIDlV5h7n?=
 =?us-ascii?Q?SRY+qxtMWhAggLtIOFQWwCllhzSoe71OaPt8wh7lLOcYr1deljcRRwgzzkYW?=
 =?us-ascii?Q?7xnw13vLR8WYnjDrqALjP8ZAc55LLWtAirtO61LzbSa/8lflCIlpc4qZh5p/?=
 =?us-ascii?Q?10H6AbLUs/A7Oy0guMQ+Vyo8jmkMW/2RL1yM7HxKhjXHA0MVzXax6X500Tg5?=
 =?us-ascii?Q?feEtltKJ+N/JIrKne0lpi2N3qpCwNPgiesdunCzNqniOJ5dXr11G0aaNksUY?=
 =?us-ascii?Q?wyE+476izxUo5efCu/DuXs6nJ7xfK7aVzb5SyN/RPVwHvTJGa0CWbu3H+6WN?=
 =?us-ascii?Q?cG8Rh/0w1LyWTHW7TcqgaOjBBuxxLDY6HCsEvxzqc6YFnbHcDyPu5nnzk8jv?=
 =?us-ascii?Q?ujS1Ue5T6YR6QE5M5Ni5S/pc77SfzSh5eauWMaIBjl35aP69qw3oumJc+r7B?=
 =?us-ascii?Q?fPhmhquwE+/TpBgD0VBztTbGxCuyb/NkDo6QgEk2DL819pteew=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4wSVeY9PxAcpyeLnLdu2Qb0AWcToGJu5WgXm8VhdtmNGwGonAwKCZVTieiwY?=
 =?us-ascii?Q?X9kzWnokVR37DgAy9PJCoPWT9011t3u6YdvuaZ0PFSll9k2E3VH4zI/ARJX/?=
 =?us-ascii?Q?2OCucF/vpqo8Nffa56HttULlCu+9u3b2HdVd3WdvQT5UBzeBI3IVjJ++/epC?=
 =?us-ascii?Q?Rh0IPzgiRv2MDJyjojrUvHH7U/3TkdS9HIv9Zjvm3IDeEsQddWuTuMRxvHhe?=
 =?us-ascii?Q?3Zh8LmR4BS14k3uCyEhQWxSd+1+/y30oRHNPiJAu8jjLt22NSJTJVwcfHLBn?=
 =?us-ascii?Q?mA7cmLQ2G0mv3+d7RgSBJCLtZi1o+mFlMsWTfn64uo7pS0vj1gj6+IXf503g?=
 =?us-ascii?Q?BFNH4tP7vr6ZwB1hEIUxyyR/9YfqWODktX2ePLw7rAFOeSerOJ/nynNSrhW5?=
 =?us-ascii?Q?L7CSULno0Jlq9+24xj0Tcl3rkJoYxO+VeretNt+drgM8XLdO7Ag6xOeq2m65?=
 =?us-ascii?Q?Nleanodu2SqzMQmYLNK1RdGZl9LQoPrfDUn/C4+pKlWKmN44Kt5jJ2PVGJ1D?=
 =?us-ascii?Q?5SM/nenu8XHDo0maSbgwgOv8Z8Ab+AHnLI0rTwhX6NCBFQQ/Aik0Sa7Pyk/S?=
 =?us-ascii?Q?7kD4pJceH35po8ol0gkxGdvcoIwq0yM399GzoyMBgEzaem1LMMHWvrqUY+yx?=
 =?us-ascii?Q?9Qbx0YcPaWFZ0DIqJX9r7EcwzXgdVDyZ6lOxVZBMj7GKP+1Z2BWneQ1GKlGl?=
 =?us-ascii?Q?ScizwrqlIEmtEgFXeh21cDzDShafVh8hbEJNkgRjE8eKHLiy43wx2crH38aY?=
 =?us-ascii?Q?BCO/1klKlEazXgFwRmHn5zfQQQGPj3ty/wQbH1p/Gqx2yRoJaigvZm3PLLUE?=
 =?us-ascii?Q?Pei022wIDCPPlpFJMtCt2kBhZf9mmOpLGoDFBqOSjQtg8VtXIFTUCFVJFnBB?=
 =?us-ascii?Q?AuFjPcbb+jrj6aQ6LsyUOszaMjlbCkL6Scdc4JTGeymQXL7VWkVCmvuJ0rTJ?=
 =?us-ascii?Q?aTyvxVa5xAzeY2lAdFq6jVy2s/e62Iv3kwnmLwF57wxmMs3EiUwaUtU8u0Yp?=
 =?us-ascii?Q?eXnodL9Vh1xiwvb7Vf9M+LR/326W0hk18XxJbakRoMOrTqwpKRtX68SS9J3i?=
 =?us-ascii?Q?aYy2eSmeyxj2QGnDGRNTyMUMVnTNlswZ3A5QskCEnwgKxsKzfNH13TUnoI3c?=
 =?us-ascii?Q?kJ9kJ8J9CjyzYF3ud8RpkaWSSBdPxTXcWXtKaRGPiThjKpQbfw8JiJL8MjVN?=
 =?us-ascii?Q?DDMHEcMCo6ZjfRm+mh9E29kJ+vEEfNW1QFR3Hpe7Rfi+kFyWghi+pUmC+RNC?=
 =?us-ascii?Q?c6f3Yd6X5Mb7CTg7gRedWJxPKipLdHYeeSzhlze/1XV3+4XhJfv368/7tvs/?=
 =?us-ascii?Q?rtcCRhCkJFaHzeyVyJ0cgAJKpXgXZbTD8LF4BFhmXFNA9vaUv9xynk15SVpz?=
 =?us-ascii?Q?jb3+VzMpb1GaimM9t5e+HLR2WURClxXoOnwfQfk5vHUasRTIprbwnvBYL8pX?=
 =?us-ascii?Q?jswBopioZkk6x220zNJz4Yf+MjpIvaZ+TX1Ok59V7XrFP4dH1SN2Djy4gjQG?=
 =?us-ascii?Q?JSK1stjmQBIjjq/5R22eL0lBwLcGb/MUImC1t0sI2q/RTpgl13F/fjcla7ok?=
 =?us-ascii?Q?KmMLHQbjyerMyL2U+0Nt+n/p2WYVqu1TNjcE8Fka?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd811f25-4115-4bb1-0eb5-08dcb7ece8c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 20:58:52.4425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6epqjkpFswjekkbeqH+eTc2zT2YnW3IrVSpojOGxnk7PRwb4DFxI/L+f4mMAiggCnNg1fEV6V8/M26qBwvKo4kfZIYV2K2NeqWK1RbVjMeU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6241
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Ashuto=
sh Dixit
Sent: Thursday, August 8, 2024 10:42 AM
To: intel-xe@lists.freedesktop.org
Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Souza, Jose <=
jose.souza@intel.com>; Landwerlin, Lionel G <lionel.g.landwerlin@intel.com>
Subject: [PATCH 2/8] drm/xe/oa: Introduce 'struct xe_oa_fence'
>=20
> Here we introduce 'struct xe_oa_fence' which will contain the fence used
> for signalling xe_syncs (in a later patch). The struct also contains the
> work struct used for signalling the fences. Otherwise, this patch is a
> simple refactor of the previous patch. In this patch the work function is
> executed synchronously.
>=20
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

If I understand correctly, it seems this is moving the fence
wait and put section to part of a work fini function that
executes when the xe_oa_fence is closed?
LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_oa.c | 73 ++++++++++++++++++++++++++++++--------
>  1 file changed, 59 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index d842c801fb9f1..f97d64ffb460f 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -90,6 +90,15 @@ struct xe_oa_config_bo {
>  	struct xe_bb *bb;
>  };
> =20
> +struct xe_oa_fence {
> +	/* @xe: pointer to xe device */
> +	struct xe_device *xe;
> +	/* @work: work to signal that OA configuration is applied */
> +	struct work_struct work;
> +	/* @config_fence: dma fence for OA config to be applied */
> +	struct dma_fence *config_fence;
> +};
> +
>  #define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
> =20
>  static const struct xe_oa_format oa_formats[] =3D {
> @@ -905,14 +914,51 @@ xe_oa_alloc_config_buffer(struct xe_oa_stream *stre=
am, struct xe_oa_config *oa_c
>  	return oa_bo;
>  }
> =20
> -static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_o=
a_config *config)
> +static void xe_oa_fence_work_fn(struct work_struct *w)
>  {
>  #define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
> -	struct xe_oa_config_bo *oa_bo;
> +	struct xe_oa_fence *ofence =3D container_of(w, typeof(*ofence), work);
>  	int err =3D 0, us =3D NOA_PROGRAM_ADDITIONAL_DELAY_US;
> -	struct dma_fence *fence;
>  	long timeout;
> =20
> +	/* Wait till all previous batches have executed */
> +	timeout =3D dma_fence_wait_timeout(ofence->config_fence, false, 5 * HZ)=
;
> +	dma_fence_put(ofence->config_fence);
> +	if (timeout < 0)
> +		err =3D timeout;
> +	else if (!timeout)
> +		err =3D -ETIME;
> +	if (err)
> +		drm_dbg(&ofence->xe->drm, "dma_fence_wait_timeout err %d\n", err);
> +
> +	/* Additional empirical delay needed for NOA programming after register=
s are written */
> +	usleep_range(us, 2 * us);
> +
> +	kfree(ofence);
> +}
> +
> +static struct xe_oa_fence *xe_oa_fence_init(struct xe_device *xe, struct=
 dma_fence *config_fence)
> +{
> +	struct xe_oa_fence *ofence;
> +
> +	ofence =3D kzalloc(sizeof(*ofence), GFP_KERNEL);
> +	if (!ofence)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ofence->xe =3D xe;
> +	INIT_WORK(&ofence->work, xe_oa_fence_work_fn);
> +	ofence->config_fence =3D config_fence;
> +
> +	return ofence;
> +}
> +
> +static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_o=
a_config *config)
> +{
> +	struct xe_oa_config_bo *oa_bo;
> +	struct xe_oa_fence *ofence;
> +	struct dma_fence *fence;
> +	int err;
> +
>  	/* Emit OA configuration batch */
>  	oa_bo =3D xe_oa_alloc_config_buffer(stream, config);
>  	if (IS_ERR(oa_bo)) {
> @@ -924,18 +970,17 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream=
 *stream, struct xe_oa_config
>  	if (err)
>  		goto exit;
> =20
> -	/* Wait till all previous batches have executed */
> -	timeout =3D dma_fence_wait_timeout(fence, false, 5 * HZ);
> -	dma_fence_put(fence);
> -	if (timeout < 0)
> -		err =3D timeout;
> -	else if (!timeout)
> -		err =3D -ETIME;
> -	if (err)
> -		drm_dbg(&stream->oa->xe->drm, "dma_fence_wait_timeout err %d\n", err);
> +	ofence =3D xe_oa_fence_init(stream->oa->xe, fence);
> +	if (IS_ERR(ofence)) {
> +		err =3D PTR_ERR(ofence);
> +		goto put_fence;
> +	}
> =20
> -	/* Additional empirical delay needed for NOA programming after register=
s are written */
> -	usleep_range(us, 2 * us);
> +	xe_oa_fence_work_fn(&ofence->work);
> +
> +	return 0;
> +put_fence:
> +	dma_fence_put(fence);
>  exit:
>  	return err;
>  }
> --=20
> 2.41.0
>=20
>=20
