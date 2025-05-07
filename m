Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4518FC3ABC0
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 20:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE7010E8A6;
	Wed,  7 May 2025 20:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fulkRieM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BF610E895
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 20:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746650210; x=1778186210;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VQAEvylwwZBsJZIwohvguWR5O9VkE1hDPV2wKG63xF0=;
 b=fulkRieMmd5JjCglT/GsQDE59U6r3/wwNIrrszlwj/itaCQpEeX1OWrj
 sdrat34MatnDU65501x1xy1wgnIwLk8E4mRvSBQHS6pGD2L6aGQiUJa98
 v7haergRb2bUsewsfF+mXpe48FhbtUjPAabLu7OPCXzDz1MhOAMwvee0V
 j9SVqjonpWqLmCqqMNI9AofmWZpNaVvYYE8WkFgJhoPoF8TOFBLEEWV3W
 4QpTUU6Usyqch6sZh2LRzD9XudGnIY5OpTLX5EnPMb1nbme5yeqeD3G0P
 +mr0kfmHqFuTPnRLrlTtI9nDSHWM9lU9Zg/pnOyRhVOyAumPAKpmBKDnv Q==;
X-CSE-ConnectionGUID: P4JlrBW6S5W7nTQvr8CIVA==
X-CSE-MsgGUID: zGUKFM1+RfCiS/bUVeQFhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59396563"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="59396563"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:36:50 -0700
X-CSE-ConnectionGUID: H37WQ8VnTsS2AHR88s2vEA==
X-CSE-MsgGUID: ITw26gi6TAeHflcV5KmyNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="141038369"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:36:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 13:36:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 13:36:49 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 13:36:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WD9BStTCd1hOfjki/RGPZrb2CPReaU3M8gkoi0uMJ7Et3PlPiJdoBFh2ICGRefmLrHorRcb26YTpkdBfGk8lcIOfOpXIOSFVPrDzToogH076fYrHFbpgvIpxwHbYctvpcUiAeJX1Zi6rAhBUPHvLM8c0t1kzESdxAXdLvWDpECwtXpscqHBmMD1t+PO/7OBzTEn60XWtkPpCDoI1elqhx6aB0+DawNVwd3yCKLwDf6LSeMmGQ5vr/llNjN0BpmCNyErcezcVe/ri1U0vSuetFV+hWPKaTW7IbAUR0aPxkn+5VFPS5Asm7S05kTZz8K8RVKEFsqa3ZReBGls+eFZM6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZwinog8ib1oqyoVg6BuCB079QbxQL+k0UtbAmRCc+w=;
 b=hvM0gr3JiJbqpfujQqDQPeOUULDJEog3GSD+looY0KJhd9/4eFx3rstYchmhzn0E6rN/wjTeCIeq+Xvk3cLkuL89DMQqDvW+ip3WOLzQjxe/5ZcsCXmu3IcGB23KGDkNte/Aa37kzTOwiP80O4gR+kGl2EGcWOrJ6/iLkh3keN1HL54gfu4oS4AvzSxMxApGfMP5HhYNIyYVBxK3iskripsR1WgpgnpqPICg9MHAgbYzIH590EQWp4X0fgpvwfVDihlY2vIPTdQ5iewbqh5gjmqiVb4Zk/+Zdv5Jk6K8aq2Rm5v0fAbAvrtyJmJrL1Lxecut9X+jJ1U0voooSgVOIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7009.namprd11.prod.outlook.com (2603:10b6:930:57::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.35; Wed, 7 May
 2025 20:36:43 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8722.018; Wed, 7 May 2025
 20:36:43 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Souza, Jose" <jose.souza@intel.com>, "Santa, Carlos"
 <carlos.santa@intel.com>, "Venkatesh Reddy, Sushma"
 <sushma.venkatesh.reddy@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4 7/9] drm/xe/uapi: Add
 DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
Thread-Topic: [PATCH v4 7/9] drm/xe/uapi: Add
 DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
Thread-Index: AQHbv43pLKab7bU7FkSOGmex/hg/NLPHnf8w
Date: Wed, 7 May 2025 20:36:43 +0000
Message-ID: <CH0PR11MB5444F86517F7FD430F5939FBE588A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250507201539.1316770-1-matthew.brost@intel.com>
 <20250507201539.1316770-8-matthew.brost@intel.com>
In-Reply-To: <20250507201539.1316770-8-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7009:EE_
x-ms-office365-filtering-correlation-id: d8f30a53-3ebf-4eaf-8a41-08dd8da6e12b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?1dcRIeIlCqaCUDIsvte+uOFXoV9hwu/O+91MESJqsVyAzj4Ag66TtKIMGT?=
 =?iso-8859-1?Q?jZgug+HEM3oK74oHAb2Z98Xc9ynol6+PdJU3XT9UN5Ua43DP0AOuYtKxdg?=
 =?iso-8859-1?Q?En/LNO6xxh+/ACKK7TNeypczC7b6wEcpWFL6nT8lGGmtTYdTbqqsZw3ESR?=
 =?iso-8859-1?Q?TlIzDq1xnn7CNyjYXGqimCq3x3uOlm+MvzET//WbTValRqpGeY+qDtRfoh?=
 =?iso-8859-1?Q?3Q1HSdRsYG0kQdEsHzIf81QSgqdLOXMjhAnEyCsZRajCLtzYqn3DCepxXP?=
 =?iso-8859-1?Q?id8iFnCauZxKWbm9VIg66eqtVbtrtt0cRxfBZ521y4UZ27Zjc6uJETU9i3?=
 =?iso-8859-1?Q?mGfwyIF+FtHUYQFzYQJMxsdY8ZNz1UeqUzvcJxO3oBuTysiyNsAdllyE2u?=
 =?iso-8859-1?Q?YXIcn4qpOlJb1PnlsyMjndRAAacru+bWG5MKQUdNpLpHC83GJZ5tq79j8/?=
 =?iso-8859-1?Q?BOZwjAoOgVLnhuaNxFNQYMK0MOwWJUAxRKbtEgMmRidnfXGwA5Pfvp+xA2?=
 =?iso-8859-1?Q?mJizY/XBSLmfiw3TCvXGqDii6ugqra4IccM0+8nKgB6nhHblJX3fEYUCIE?=
 =?iso-8859-1?Q?RpYTYVuJ9ISraMVG19cVMD16zdVm0AoHGpqRA2R2dUBkEkXi6v3ab7mOuT?=
 =?iso-8859-1?Q?yrEMlfA5GBm2117SWi2GBtUi4hyGyauu4GSCNjNREBAirnuAHY8OucoYrs?=
 =?iso-8859-1?Q?Murx5wP1Fy9VAxgVTDyl9bgGQwwIlyuQz4iK2tXc3XEttIBMldhdxy/I2T?=
 =?iso-8859-1?Q?qjRpsAtOLJHHefLzVUUwG6qMCtTWXmMAxMH23ky2/figVUzgtbsryRrdvB?=
 =?iso-8859-1?Q?vyuWz+wYeIAxfWnvbiLEpZU2EEYrQVTIK0dd0K7r8BjAnvuhbZPdMmDLlP?=
 =?iso-8859-1?Q?Ct4zI2S/JCfTbCphNzZjC56jL4cUA3L+xGipWg5Y7f4T9ZTLY9UFPFIMbd?=
 =?iso-8859-1?Q?hsstTKNyO245yttVhbIE1WCVv+z4gao52vGjtFOKwPNR7KvVRzv/vFMLYk?=
 =?iso-8859-1?Q?jGlw97DqnlFWVg4zecYPKKJDsTSHeDQW6Fb8LFjXywuCeVa18LFX6+5cDO?=
 =?iso-8859-1?Q?fkTU0G9mHY407MJLNykRBP4Z3x4u157jBp3UbyfTXdMUspayE641mYWLVy?=
 =?iso-8859-1?Q?5ldnqt9RZjCTZMJzAMdhabBivkaA7YFGDCeSFAhEi6k6Fd9CVos2LPK9RR?=
 =?iso-8859-1?Q?yujxoJEgvsO4tBDMa/25/yOJUq8ARqxyvWE0tHFIqJnbsWIIK8gVTjBegy?=
 =?iso-8859-1?Q?m60OTqhxkou+QPMWJFiTnaruoJiplLXI7tHXpk83+BGbbIdU9zEi+238My?=
 =?iso-8859-1?Q?3PwZi1P54CGH/kdQ9w3eoqG45/ZvlaUbwYLbudCgSUCYizGlq/5Rzjh7kV?=
 =?iso-8859-1?Q?NkwhVaygqwSLMigha+XKcG7cxc94W2uaaT/wSZhXHLLKdgJCdCBB6rIT6X?=
 =?iso-8859-1?Q?xoNOJuwoIFg6z+0ZoGv8lorz17qamkNSsJByBskuSwTX7Ptt/31DW2EtMM?=
 =?iso-8859-1?Q?KHeFGFwhOXxeKgxWieFxxznN9U7K9x3Mx2fYgXB7hKHrxsIhxIHWZRASh/?=
 =?iso-8859-1?Q?yzFRrwE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ABvkmfbVFs/0DuwyleUL1S2QolU6AC+SnIW5rIlq9bQWCgXuVN2e41DJeS?=
 =?iso-8859-1?Q?izKWZ18Ip3UiM4MMJGoQi44d3Uip3FxERqEvtoPNqN36L17eawgFnhSm5s?=
 =?iso-8859-1?Q?XmHbbgdr3oY1fohex/d7ma5SbdBqsoH9DIlmDwD88fsdruxtYoqvse1nNo?=
 =?iso-8859-1?Q?1r5Gn3m77UmFb3JbNdZsCvt7cVnK5yV1Io3RRFaXg9hLZbTyBLTjSCRxp4?=
 =?iso-8859-1?Q?yWZGjR5SmeiLySM/7lgMrQh6Dyv1y0yBbVj6YmVsfznaFpY3ix50KG2lun?=
 =?iso-8859-1?Q?JBxY8ZWrtpiLndiVLxGKQOobkokt4QFc7hwJ/jCWuZ+lLqjlc4m5j5UMl9?=
 =?iso-8859-1?Q?4b78CzmLk2y/1oBhCAXn6HMUPqOFPz0laBR6y0Aj+n+8gwaQ+YsTUYLThj?=
 =?iso-8859-1?Q?K00U7lwIzgemj8qzZlUb6HVlQm+CvFrpSWA+o9Naug0HHkner53y5nZaNd?=
 =?iso-8859-1?Q?s/OpmuiFxZMjH0WwxUmuGhJ+1iHJrZZ/wsCFkF/NNjVDLEDX0JldSen5tW?=
 =?iso-8859-1?Q?UMncxQ5+XmJdhkjNQFe1S2X+ytGP+4OnQ91jzdI0VX1QlZKhlDM9psgl86?=
 =?iso-8859-1?Q?ViS7+7sjICbMj/wCjzOcM+0A6EJNNIIslVeuDXLtxO69jP/dwGEUbi1CDQ?=
 =?iso-8859-1?Q?gwOUic3bc14fObqaK5FqSf6mrIXX/b2yKnD6gw7aYx8mSHp+0W/MNbolB/?=
 =?iso-8859-1?Q?z3yktv/Mm7K6f631y3Mg8bHalGs/YStolX/nNZNVTNPMuz6B1PMLzj9AEK?=
 =?iso-8859-1?Q?BPu1ojNjNdtfMF3UWrcvkiLkBqreQsI71925eBwM2zZ40CjegZJMI/ScTs?=
 =?iso-8859-1?Q?3fn+DeBLSQo0NwCnKueQpadZTBIPRRSvutGvIaWmPqE4qtmXz8dfMOVwVJ?=
 =?iso-8859-1?Q?9k0UUhA0UFk6y9QxvAL9PToE+nCdoqKL5Z4QEz56Kyi/sdNHyYsX1Sv0Yp?=
 =?iso-8859-1?Q?5wGGUTmGWrgsqlHQwoxOkOHHiS7y7O7mW+A8GqzwQLQKXdH5qs4VIuShLJ?=
 =?iso-8859-1?Q?6iD9/QSHC18M6rc/Dz6J2OI1QRJKjOGrI2cvWkm8o8/gQiZrthe0+z9zvt?=
 =?iso-8859-1?Q?JEgv+2vGANkfScAszApSbq7XHRi798rF0Fm6L/OE34abZzmXDgJhq5wvT1?=
 =?iso-8859-1?Q?2L+dSs69uniZt+trHmeEvbQ6C7ZA3VpEE3GBfMRC0G9/cESDO+xB80ctyn?=
 =?iso-8859-1?Q?NnylRbisXTbtTcFX3sOf+5U9ZhH+BjvYNIANnqPIuU8qLjvb/KQyzwkVHj?=
 =?iso-8859-1?Q?qj+NHIzfo1Qe3+QFxmzHvM6j3j3AGQJzp5DKcN7az+Twgg6errgE9fZUI5?=
 =?iso-8859-1?Q?LxGOYbardd/gyXggyoTDWSztQJzXxkpWOSoQuLtbVnr9wT//DOGFE5Dz4M?=
 =?iso-8859-1?Q?wv1+KWGEcJZ4DswXwu0seEVQsh+LiqvOUPE2LeMgyhI8+8VhW3f185R5C2?=
 =?iso-8859-1?Q?IhRuVEozqIW0Kqyw4kncAlqyUhPK+l8sLC+7zmrE0ycjWqZ9UUwBuFDAb2?=
 =?iso-8859-1?Q?MadEeyaMz1Tl8HzNUnLPNeQnwN2pnDWKTByvvAaUgHpwXZriDleyCAEZ0J?=
 =?iso-8859-1?Q?vexiHyyTqoS05zApA5mnJFgxBAllHJ0/QAkeVS0dICm1FGoa8/765PDm9y?=
 =?iso-8859-1?Q?Y28hBHVLGTR3ZSrArew33uV3lHGI0qDFMlojd/ZXjA4QoToHLPf5T8LA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f30a53-3ebf-4eaf-8a41-08dd8da6e12b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 20:36:43.8172 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G3WdfinKKPkR2MCKsR+vc86NXv3ywq/0M+FK/Altj6iSuqdL1bRNW5JnbGGxDZkN1ZdLpglR6XEpgfAW0PSScblP2EwZoqTCHQPCcB5SQq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7009
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
Sent: Wednesday, May 7, 2025 1:16 PM
To: intel-xe@lists.freedesktop.org
Cc: Souza, Jose <jose.souza@intel.com>; Santa, Carlos <carlos.santa@intel.c=
om>; Venkatesh Reddy, Sushma <sushma.venkatesh.reddy@intel.com>
Subject: [PATCH v4 7/9] drm/xe/uapi: Add DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_=
STATE
>=20
> Add DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE which accepts a user pointer
> to populate the exec queue state so that a GPU hang can be replayed via
> a Mesa tool.
>=20
> v2: Update the value for HANG_REPLAY_STATE flag
>=20
> Cc: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Carlos Santa <carlos.santa@intel-corp-partner.google.com>

LGTM.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  include/uapi/drm/xe_drm.h | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 9c08738c3b91..a44a82e03ecc 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -204,8 +204,12 @@ struct drm_xe_ext_set_property {
>  	/** @pad: MBZ */
>  	__u32 pad;
> =20
> -	/** @value: property value */
> -	__u64 value;
> +	union {
> +		/** @value: property value */
> +		__u64 value;
> +		/** @ptr: pointer to user value */
> +		__u64 ptr;
> +	};
> =20
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
> @@ -1253,6 +1257,7 @@ struct drm_xe_exec_queue_create {
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
> +#define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		3
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
> =20
> --=20
> 2.34.1
>=20
>=20
