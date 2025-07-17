Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555A6C83F34
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 21:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9EF10E321;
	Thu, 17 Jul 2025 21:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XwIh74ff";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812DF10E8A0
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 21:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752786975; x=1784322975;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Bj3NMWwklwDdNWaebIFvwpWaDs7BE1gRbmR8pvX8nJk=;
 b=XwIh74ff/MSRmlcQXFBk1bJ50kL0NP+YRLelSBNjo29kY9vDO2pZmKr3
 MIplZglcAvG4X6AvGaej1lr8fL/jQDAOi3TdDgN2Zt8esswS9+sU3+mAf
 VDg7664QQrCE7OT/2qqlneMwUQN4eaT2Jv4DJOeHBqHx5rhgYJwZEBlzs
 oG2lDLM5J2mI9x98ix9H2XjM+l1sNiTT1V+KBUw2or3GnNd0DrO25uQ9p
 u34N+KgUIwECs4am7quxPyFMjkOZbKECMRgKMksbraWPYj6lkjnwaIUHB
 ERuzWaTmzSB3Yskoye98RiJwV+QX33+EwWDqY8D6yrrW6m+aNQ0CA2g6t g==;
X-CSE-ConnectionGUID: 2vnGk8yNRxqHVo5yxCb/6w==
X-CSE-MsgGUID: ljNViVqETQymE4OLsU5IsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="65650363"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="65650363"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 14:16:09 -0700
X-CSE-ConnectionGUID: IJXct035QRimlmvkF5IVDg==
X-CSE-MsgGUID: /GLpW5CjRBigxHtEeTUCVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="158463022"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 14:16:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 14:16:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 14:16:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.56)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 14:16:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vg72EXTxmlaM6y8H4EXCS0Y2NNbvbNbZ5LJDW4pdap957OSvSTMgC+ziZfFdXAxgWDhYb1cqdLVexu06PvFcSWqPeFuoBJi6PymW18l2No8dal1A+yIAlV4ElQWlDmNJe0dECIeE/BQjRvMJpu9zdrWluf3Lwwe7juPbmLRIEa/L+lhEKk6FMHszvXKs5d/XDIeu/rgoKzFSaTpqm88aYF/qJgQbyeAkhfizKrb46hNlDDiezrrOf/JSI1RykwCjMtbZNDSgFwocLcetRA94XkvIjP62rDkTrwe4kR7ar3eveNxYB+qgaYV7Jxz7NNpUD9XnCUS0ddL1r7jU+C6q5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h61j/AnilyX4kkLn6jii5pjfAT9hODM/QwxgABNAeuU=;
 b=ZnnSu9CkjT/1cl8n32PE7EW68iw8ubBbPwvgz2tnwd/PioeBnULAdnBYiDffikufpuxgeHqKdwdC9Fre7HIvByvNTA2y/FcjD425eMdhBnaXcv8TyoM4QAwB781ZG3urZTiriNVa4dzRCWTx164hWxcX003tkqhOoYB+50IUr7viM7JQzGdhv7R1UaVnIUEaq86Z9OEdfIBajgEYB0WNUyDK3N5txeNuQBOmIsMNKTBFam3m53ZfxAB93dHf6I5P3b/ZXfRrrsurXf2Ox1++YPpOjIIby/0UyZ+1VM9SQixXsgRdMIqHsarBQOxr8Iyi4oiellHCJDDVNt2mlwgJew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA1PR11MB8446.namprd11.prod.outlook.com (2603:10b6:806:3a7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Thu, 17 Jul
 2025 21:16:06 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 21:16:06 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/5] drm/xe/configfs: Fix pci_dev reference leak
Thread-Topic: [PATCH 1/5] drm/xe/configfs: Fix pci_dev reference leak
Thread-Index: AQHb90t1CPYrXAUMak6VmMD+4IqP27Q2v01g
Date: Thu, 17 Jul 2025 21:16:05 +0000
Message-ID: <CH0PR11MB5444593FFB130CD1644E3244E551A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250717184825.851-1-michal.wajdeczko@intel.com>
 <20250717184825.851-2-michal.wajdeczko@intel.com>
In-Reply-To: <20250717184825.851-2-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA1PR11MB8446:EE_
x-ms-office365-filtering-correlation-id: 2c3f4e69-7f64-47ee-fa59-08ddc5772470
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?TZ3/1hEafH+8vdALXZBaPFpTyLIPnxS5QsWFBnYx+g+VM4E0XSYIpAlScCD2?=
 =?us-ascii?Q?6c8eUkOl7NHmF7SwbFxYBxiItiTPxxSOIw4Eyrcz6LiB3lEygAIfNOCQZ7o8?=
 =?us-ascii?Q?+Ot5xe/IBn6R20eT+74qQPBZKNWiWU6xXJinUOoc95UjZFZcXedUYA52jarC?=
 =?us-ascii?Q?eB/UvSX/B8PpJJqpE5TO2/3xTQNYTIG5tdUqtfqrRlNBiRpc4dGHxMSU6Muo?=
 =?us-ascii?Q?uWt2zCaL5Yb/oh+f8d0bgvJUAdy/UEM0AEFSjfN7Auiy/z56YlspzMXB4Dhr?=
 =?us-ascii?Q?FgmSWfE75xdcZx6tZnJRhMy5/8vDWWvF1ef/YrFax5A4PuA5GuA4Dg0M1yE6?=
 =?us-ascii?Q?anL7QqJuct9Hee+BSvRzJOqNMveXdccAzumMhtXruO5dSF82x4qYWE5EXWgt?=
 =?us-ascii?Q?dlB5OiT4s8Wk1mKqKKXeb9zjvn37Lr3o3Fjg4rHy9srWOnyIi1ovN6RMaw6o?=
 =?us-ascii?Q?iZt6E8W4O/rl9U+FG/LoKnTeMLq2ccNYob8VCoJFTNHDLzojsVCIscaDkbG5?=
 =?us-ascii?Q?NW7EyZyrDVQOg6ynDoG1oiHneXFmVdATdYskkGLCC4mkBwu5MgecuqsIqKVZ?=
 =?us-ascii?Q?K6IBvPJlGkENx7VlJJ+gIGU5ACdZ/fIwLGf3JWJKHG4jx+gyBu25De4A+HmF?=
 =?us-ascii?Q?1sa8uQayPmnyvh+KDDHsT8OWNlXneVXOP29lAUG/dg1IkKEkOowUuCvD+2SY?=
 =?us-ascii?Q?bHoOncgLAzurhihZ2gz2DXxpHk4exAQJoVAJFohJMQd5eQwvgWuoDvZivuxI?=
 =?us-ascii?Q?FwFk6mZcU/pHpvgxtqgXRgl/Ozta2GNW+9XKouAMLAIO8hnoyKNX96oiNzE2?=
 =?us-ascii?Q?mANaTkg56Hym8JDBcNiaYbqas+OTNR9JdpCVAzuhooIG6T3bx7PgZrX0IqI0?=
 =?us-ascii?Q?0EaMnku+27bjwm/t0/pnt9Dhfj4ak5Mb9FuY7ygvPGpPHSInYnwR42O/s4PE?=
 =?us-ascii?Q?4TAzTIE5qbkXX82FlZUsnPPP/R48fiZZkfr/ykrnA6e5H9+BkN+30HjXBXTY?=
 =?us-ascii?Q?whtgRj2Csw1GUyxJNtCKC4FfjUy7Xi2fxswLlAtWtksUWE9ZZ05nLrxNPNr8?=
 =?us-ascii?Q?waArXXugufHZFlyRqyZ9OZqCxrnd7JOokiv6ryZSLu803X6svPpF9O4kcHjQ?=
 =?us-ascii?Q?xohoPlujPghubsoQm9zekkIJXiyAIzPakeBthblpqBDDWQh+X37VRfqJR/K/?=
 =?us-ascii?Q?2Zn8Gzn1QS0g5u0y15SYJPwo/+jNq+2OsiR0ZPDJL/zsaBgdKCzf5eFyyVM1?=
 =?us-ascii?Q?Ea71W8EKyVYnmrzGqIwCMzYwaKGXnC1nApMGuvhq3LpFkFCfGtpt0nRm+9RC?=
 =?us-ascii?Q?jNzOwl1ukrI8T4SuvnxA4wndc2sJEJUnyW+zmmuv/Xjm4NWtisPxwfnrxqEx?=
 =?us-ascii?Q?yCt+xXDMEN+6IOzEmuSZHnwkH1KerRqLAxrNpOJfhmUUhFMjScYAou0E7OSk?=
 =?us-ascii?Q?kXguKBbHu6IVA6Eup79j84tu8d1lmYeyTB6vlV/sZ4Ue28sGuEezVw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?j4TkLH/VmaTNeq6buji9wYjjFXWxDwDjwDX27Fo0n/WQenPEihIkuEL0PyKE?=
 =?us-ascii?Q?oIAtDvya2UDxzLaFGhdL+oo8qVavZRwZ6I5uoOgAIok6FiuT5Iubf3CJNchU?=
 =?us-ascii?Q?nthY6HUp2AgQ3eU7l6zUOrNf4ybpshtAfR3sNeX6gzxmx/HcQmG+uAQXwy4Y?=
 =?us-ascii?Q?TN+X5zFWmwqRCAyx+1cQSErYnrJxJ95v9MkKGuModaw22YhPpyngLuFlKnwc?=
 =?us-ascii?Q?CXlor2hTsnTEuFVPkNAv9jjBHPSyXL+F33i0mZDY6bkhVdj56f9ILCoznAJF?=
 =?us-ascii?Q?S15ayhRMseQx1dgV8hdcdE/+HN0FIatIO3CK94YDkBlUgX/OJGXUmsBIL6FN?=
 =?us-ascii?Q?JRiiYL0wlagnXpTsvOkebBc6tkiWNbeEaI1Yq3lcy7MFzq6qW27oKwhUaCZ0?=
 =?us-ascii?Q?+ov/b13VL+Wuc4bm7E1H1UighLvmllHDbzMNVsO1xmKyoJwwhmwemsxwFz5z?=
 =?us-ascii?Q?o6YB2pftg1zw+R4Jajy3HqYRE4Xo5eTXMKctx1rMAq++d/Jba/jLvBuuY9ZL?=
 =?us-ascii?Q?fE29T4VOnrOpqn4QaBqBgQEMK65dJGgamqOEsqJ4sqrI+gWdIkyqD0IKO5C6?=
 =?us-ascii?Q?2eHJt3irQPnSiKZNe8PWRm+HfMBUpAp3Eo9DqmDEV3hsiWwA3xvF+DHSvR7q?=
 =?us-ascii?Q?vTLKtCoW8dyhGQj7iOPnaSPdy+VyRXH/DBb69uVYuK7UyFzvQrwP9jIVdJ2V?=
 =?us-ascii?Q?RzYzNjgLA+mT3bQXFochGYZbdhpq6Air4Wv08lTNGi7/ge4YnfuzXWlUEXTC?=
 =?us-ascii?Q?CizIU+BGyUcx+6vHOHmisrfhmo6270QS/WtS7rPq0HZSKYCmr6xuw+s/ZEmQ?=
 =?us-ascii?Q?75DXP5AEOUHJ2+L/tyLwmugfkU5o3FoMel6vU7tSmNPBnkjbJtSxUhOWIKzY?=
 =?us-ascii?Q?wCRXJNjD5ltjC7WsnTRhHjFBVIIID8wHB1/WHK6VzQnNKgWrPFtPM0Xo4LgW?=
 =?us-ascii?Q?cJpy2hC5ZHOp2t+1d9HB5p0csyuIQg0Xh4DbDdFTgiG3cPt4+bKjUTXMEXxH?=
 =?us-ascii?Q?hCc9Reu11WtoID0XBveowuN5HKhrfEX9i4ghyn7atuZ37HjnQvr7THw6YUKO?=
 =?us-ascii?Q?YDcZX7LGkvWwBJ5S5FPgR45keCP4B5meIlAkOdR7JkHU7CKiGjp8/w6lAa+f?=
 =?us-ascii?Q?KalHDQ58MoLFcIs0BHIzC15dwHh+srzIb6l7GXFEb+O2lvkKNGZr4+UrPCQ8?=
 =?us-ascii?Q?JODIZiBCCzIdaiXch3FYgVGXLqV3M1XHkpP8vtScGfsaC9xR+u9kCyGuYZX9?=
 =?us-ascii?Q?pgIvqED/NPXVmJGbwOFJECP/VJNAa2gedaQ/BQaLV1ODwJXpfE7MbTBXAqvS?=
 =?us-ascii?Q?uqsyhfAYxSVO+6jYY3Ay1+/h/O7LLyjZrJmZEb33PXMl86QkwinVymkv7G33?=
 =?us-ascii?Q?bG8nKwSwjIZ+cGCqjlIk2ccN5PBCAfzM26hxwn7JQOs4YsjVci9xF/KPxlkG?=
 =?us-ascii?Q?5LkDjuws1Htl72Gg4ya/rT3gfHI+A61JPDoGQOY65zj5wrNuCvQ8fSwP9OUt?=
 =?us-ascii?Q?IXceOArc92mPWdr4OoH9IhxXe/cU7YW3zACPOD6ZRqUxNMBbJCpKsmY4L7SD?=
 =?us-ascii?Q?VCiU7QbKqjNzn6oCLLvYYGh5ca1vxHmeGr30CevZteNNDk7dP+aw17rzH5aR?=
 =?us-ascii?Q?5S+YwyiCY4YsJbN4Tv2cXlxQD5Zb6wabTAVmum8Y9/y2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3f4e69-7f64-47ee-fa59-08ddc5772470
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 21:16:05.9235 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p/V0fAMfLl+ipa8YVXcpLPxj3+hG1a9cPrkP62uvCUKgfo4vm+wdrgLqszWtEIPc2D/+s4Bd6wZFoPOO7SkYsbyzBvukrM2oRfA6c+iDbIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8446
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
Sent: Thursday, July 17, 2025 11:48 AM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; De Marchi, Lucas <lucas=
.demarchi@intel.com>
Subject: [PATCH 1/5] drm/xe/configfs: Fix pci_dev reference leak
>=20
> We are using pci_get_domain_bus_and_slot() function to verify if
> the given config directory name matches any existing PCI device,
> but we missed to call matching pci_dev_put() to release reference.
>=20
> While around, also change error code in case of no device match,
> to make it more specific than generic formatting error.
>=20
> Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Since we're already being fairly granular with the changes in this patch se=
ries,
it probably would've been okay for us to separate the pci_dev_put addition
from the errno change here.  But I won't make it a requirement.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_con=
figfs.c
> index 8ec1ff1e4e80..e9b46a2d0019 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -267,7 +267,8 @@ static struct config_group *xe_config_make_device_gro=
up(struct config_group *gro
> =20
>  	pdev =3D pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, funct=
ion));
>  	if (!pdev)
> -		return ERR_PTR(-EINVAL);
> +		return ERR_PTR(-ENODEV);
> +	pci_dev_put(pdev);
> =20
>  	dev =3D kzalloc(sizeof(*dev), GFP_KERNEL);
>  	if (!dev)
> --=20
> 2.47.1
>=20
>=20
