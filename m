Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24E8C3ABBF
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 20:36:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB1010E89D;
	Wed,  7 May 2025 20:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a9Sq0wzy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB0D10E895
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 20:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746650202; x=1778186202;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9Mjm4eYkErfPob1puwho0L7qy45My/J7iIDc3O1bw4M=;
 b=a9Sq0wzydWl9MnbFzAcHSA8AVssOMonMCVixCXBCXY1p/0Y4Aa0z3F/o
 boxDEkng8OshKqGJaHqRQZUIC5fd10HFL0GAzrKsNpUq44mN5QvZF4HPZ
 8nkU6sg41dJ9/+2HOygvyPxM+H7VP752VsanFogew8OJYj+2a/T2ofvOK
 yqr/crDvN17th66oaxzipNSnkqhK2zbDzqKncH0TfNMZiwFLg4VnioTQv
 YMQDx8z8m+qw3DXt/QRT3O2s2VSY6SSu6B8cCZ80bXu+G4fWGKsxu3Ud/
 98v6qPNEchNPjcBSImjIV5o13QQh8oN4qhXO1J9EdBgS2gpT3kYgUXkg2 Q==;
X-CSE-ConnectionGUID: j3a4KlH4QSyvdAlPhSB/jA==
X-CSE-MsgGUID: 5qMxEeBTQOeURJLfjkTObQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59396511"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="59396511"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:36:42 -0700
X-CSE-ConnectionGUID: ohb8tejZT32GuOLlerNW1g==
X-CSE-MsgGUID: H8x21PgWQiWEVY7oBTliCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="141038348"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:36:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 13:36:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 13:36:41 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 13:36:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hRAj/mdfxIgAYsz40I1v5JVGo3rrpIW6WpXffdEwlxAjfVOdUQyJYPQEcbUyWaKcna06bYYGzRF20xfpevvnhwlCcuG73XPRHgpnf8tRRG/yITqteE5UWEyqT8ZHQS0Xxnwl98QQbBQtOTLh8vkB0UpOBz8Q7Xn2PFG7j75WeIzoHoeOqD98fa2TDiEwOfakddUcYAgMRzwN3RezoLakJ9pYlMPUWaW0vONJUdJKceHAzLs9fgsGIkYVcFjQmPbOxfS4krxk+1HuhYvUvIThVn8WLc0hGVZJep+OfrYifO/gOW7KcbKr42sJQsS1JH2YfvX9PG3ydISKHe1LiVFqHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24fLQ9595c3aIfDJDyBGQkc29CodlPo89BgGYtr3KWU=;
 b=XvttRzXeVTiNPj7Q8GAUTPWOftu1tDZC/8N8FbwhUvW7xmN4303sKbNy0RJFj62z3rhpCKbimDwIdjjwYkWdkt1aXH1lML10EUsDZvuvQD5WLIAafluDpXwl+nlqH9NtrPV+lM4qGSuoPB32EyvD+OBG+mxfwxw7snHk6DI5QoXoklp1MDm0qOHEQ6RzvZhuy1+KqWJU8SWASHhAGzqmhnYEZUoQgqbtuAcBusL1o3B82eviD3iwaTNCXJKbl5tM7rRL/j9Z/MWK313rbskGKGjEH3mr5GsS2q2sE9aL9byjp+9wgYEAL8VEfqqGugqZvPybjWpGmsH2UW3HoK/S1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7009.namprd11.prod.outlook.com (2603:10b6:930:57::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.35; Wed, 7 May
 2025 20:36:37 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8722.018; Wed, 7 May 2025
 20:36:37 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Souza, Jose" <jose.souza@intel.com>, "Santa, Carlos"
 <carlos.santa@intel.com>, "Venkatesh Reddy, Sushma"
 <sushma.venkatesh.reddy@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4 5/9] drm/xe: Add cpu_caching to properties line in VM
 snapshot capture
Thread-Topic: [PATCH v4 5/9] drm/xe: Add cpu_caching to properties line in VM
 snapshot capture
Thread-Index: AQHbv4ypSAAsD1DDhkW8OFEhCtzjYbPHnbXw
Date: Wed, 7 May 2025 20:36:37 +0000
Message-ID: <CH0PR11MB5444BA9F4BE57BD993EBF81BE588A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250507201539.1316770-1-matthew.brost@intel.com>
 <20250507201539.1316770-6-matthew.brost@intel.com>
In-Reply-To: <20250507201539.1316770-6-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7009:EE_
x-ms-office365-filtering-correlation-id: 6d2e997a-47d1-45fb-cb4e-08dd8da6dd3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?JuAr7EYe2COeB/jldrrJtUOf934rB0Ug0DRk4wFIg+9wE1OENv6l025n3m?=
 =?iso-8859-1?Q?rrv7o3WklAKchj8G2xZIY4ro48vynt3Z75yR3yTX7+JBhOTTmsaYMVbwJe?=
 =?iso-8859-1?Q?dtlQgFu27vy0uXsM6CYFUbnseK7kJgWYkVVnP46823etZRCMaQj2yMm2m6?=
 =?iso-8859-1?Q?Np2SCB2EWuMFhm1avCK+j4QSR5Vc/gGFTuv0dZubZx5DEqHZ2piK2u991s?=
 =?iso-8859-1?Q?71ylfjhxGzgIz14RDWQI9yM+eYgzq5xWO2VkeSzvNbklGCN6TeAX5DAWiU?=
 =?iso-8859-1?Q?Z2pBdAT1F125vXgmWImqxF4b8AsGo0yjhk8ZO/l4GvVN8Mgk6o5AortmEp?=
 =?iso-8859-1?Q?gzwiuJXZlfme/cjEGYDxsEeVzoolC8zNH1mbVkR0RQQP0zJZ0xtC23awIB?=
 =?iso-8859-1?Q?bH5xzHNzcbAfcLuV39JBITInahcBIDsPPG9guy3B5t2mrp38nGzYx5BBnV?=
 =?iso-8859-1?Q?ZkcL8ZvmWzzpAS8gkY0/QJNHtMefSmO7MFtCyU1Zdg3Cq7eEfuNcQghrUh?=
 =?iso-8859-1?Q?y823E2q0Ftso24KgZYt/Lhvv9dpkQYGXy+Kwx06pCBFAJcPtQU/VE12ep5?=
 =?iso-8859-1?Q?lRMJT83dO2fSvPs2FZ3cdcKyJKCVkhRqsmrJytCkyFuUgGqbWy/9LjFQp9?=
 =?iso-8859-1?Q?Ltx6W++6xOlTl07Ym7U7X5Ak0Is9Lt3sUHK//HOizCJ/P/GmxRP/UxOGcj?=
 =?iso-8859-1?Q?WPBkW2ZoF5ZHSFhize5POiDop+vgePgCoDkOFIOLcXtGp8sJEo5R0KQJNl?=
 =?iso-8859-1?Q?kbfJuoc9Z4o8D9xLfLC5Aih4tJi33obkkZR4Wp+5/07dwYAN5tpUKhKWNv?=
 =?iso-8859-1?Q?oLBGZP+4pbppKek9ZjxF5dDrPDODsWSk30BGv0fQ7FoD1dL9YYGcHu/T0H?=
 =?iso-8859-1?Q?R4jwm5qVTHlmDnxJHqBjWWz3wT3o8q4wkrErb49q5dqAvg4E0X947ImvWJ?=
 =?iso-8859-1?Q?xuEu6iuW29nGs8Yf4X2Qzi3KBUHAxI6S+IqdOxkfGs5TFN8LH3Dd++JYzn?=
 =?iso-8859-1?Q?CAOj/9+sfRQ88LkKzPmdv83jB5XWixXXPM7CEBgAc0ORIS4V/9+V8ZWmMM?=
 =?iso-8859-1?Q?4XUR82L5YHNI+sqj/nUjCnb79Ncdog1YFE+p4+dg5oyp0O4qvlfo+7iSCY?=
 =?iso-8859-1?Q?UzWCFMFMhNRCtgBpfO1xGGc9xoxtvww6soMh9cVrSfhA1HmsblnCrfmi/K?=
 =?iso-8859-1?Q?1ev7AbQ5j6DfdEgRgWjkb1/tf78J3cdic9Fbgir35vDlGuX9o+uYEPu6m1?=
 =?iso-8859-1?Q?TYS6IdJLRN/rilOxxjrKR/GM1CrW+EylYrURtBLzifPFMEbsfjuIqcp4YD?=
 =?iso-8859-1?Q?L0jxBlQb5JvT2E9/aWYmREluKlOWTFjv+v7A7fRh3CkKHgDaIOBnpjaAip?=
 =?iso-8859-1?Q?HrhJcFtEtLpmhUHeQkFcNlExPN6yh/sPvIGLqrUFTjKIDVO2HNOjXGJUmA?=
 =?iso-8859-1?Q?OV5iGQ6yF0FszT40WC7cyu2R3IK/8TotZdbCn6eFDMN8FDtp/f4YAMRkuG?=
 =?iso-8859-1?Q?yjSThggV33CUIoYG+oja0gmxgGeF8uxGODAfFhRrVvYf9bUx8Uquj4pPq9?=
 =?iso-8859-1?Q?Hk76DPU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?aodRawMtk4uet46RiJIKrkgH3/SneghPqJmJeblKs+wwxczKCiJz2Gc/qL?=
 =?iso-8859-1?Q?oP7QU8UZahnlqXwNZ3/HULQD7iiguAcKXE+kTJvGCpm55rHKDyitWK4Gw7?=
 =?iso-8859-1?Q?0xKSOKere+7FqVvVAxpAEj1FaXLxr15lEz+ecv1aoBomAzBTyaV1vzYRjj?=
 =?iso-8859-1?Q?KkQjDYDTbr2HezUPYGh/5uoyiIVqGMc3G1HTUbIv7puoz/YLUjPY6L1mIc?=
 =?iso-8859-1?Q?88IOS67jD1XlLIosqPu7FDGhi1SsDNqFd7iRzcGF/P+vATGv/vdgVaQ/W9?=
 =?iso-8859-1?Q?RRJP7T4RYJlndXr4OXyW7JqqfQzHCsyfraAkniIBfRI5k5De24YgVqULHr?=
 =?iso-8859-1?Q?waLGMVfP08jytAkoeX4qy51MEVc9Y3O3VgRYKtwSBfBuKTvASNPfNwjzqK?=
 =?iso-8859-1?Q?Oocl5JDvWdlyuUDQ4+qPa6anblALWIy9rQoiwNMle01+BQsQSCKh1PHHdR?=
 =?iso-8859-1?Q?BxDF7zgJxWjbER/uwL90RXxgvdfXwDQHUodNi2G5NKPAjOeDyGmY9xmO/U?=
 =?iso-8859-1?Q?o0EF/UpKXQMBL/mZ85MdZra+f5SYUrsmeGgMzNRS6XlmSFMq5ZqFE80QTX?=
 =?iso-8859-1?Q?MEFoaxC/WSEFZG9uVvyxjShK5UqjhkD8odMO/OglJadcI2EYTzByhTwIWw?=
 =?iso-8859-1?Q?wjiOSL22IuaAMz5qr8Hb7no28lKbjOc7iXXYeulp5KpVpVjkkXHF2pElwj?=
 =?iso-8859-1?Q?pYKCeBduE7oeyo5h9FiscNwn8Q95D6UFN/pLlhgaZPOb4Ah7mtsBBLoKQ3?=
 =?iso-8859-1?Q?aOyaB2e6qBBDLnsZw28ISZspXrV3/Wl7xxOlWlfDkkc+avchRTCPxILYEz?=
 =?iso-8859-1?Q?WqQgmKk2YWxjY19jx8EG7T/TLzhrqJlqtvO6tmdFtBS6kJuoqSOZsGD3HY?=
 =?iso-8859-1?Q?Zq8zkdSrblEGiN/Lb7fv0yOPjaWOYzkat/4TOKAeRbRkqnyJptvBkpV7I/?=
 =?iso-8859-1?Q?RXUUSkozLDLS+70kSGdQzdP8RuqowdZZ7D7cf+M3MeFaZKRoPtoczCMpRG?=
 =?iso-8859-1?Q?KXxrD1wNO22jmBIYwo+fq8CEkYaPj1XhADfkWiBOb5qPQG3QgTbCex4FUa?=
 =?iso-8859-1?Q?6FwHAFQR9oW+kXh0O8Ku0J6eBs4sk3XTsJBIUS/Ia3doW40FoLmk813DKH?=
 =?iso-8859-1?Q?KyTXOCE9ulpVTUQzRkUiDVNW1VOJupH8lqpLJ/GgASwv2xwUC+LqQ0asAb?=
 =?iso-8859-1?Q?EgQ0ShTEfBaifA45PQ9O8qupBXrfHlvHtzVEq2uP+dsgHooaJI7ETFRkwg?=
 =?iso-8859-1?Q?tnVqGPNIx1pqFWRL9L78Ea9BKafE43W7rVrEGJxnBPWISd+v+OmOEhd0tv?=
 =?iso-8859-1?Q?l051RV4q4dSiCylwBBtk6TCx6BhAxRPVXQRjIBSNpd8P7/6Zdo8LA4nxgX?=
 =?iso-8859-1?Q?HDktEjyL0BHzDxAZtPLhnkXjLT8yAAjiFpKUsu8FQWnK2spgs/2RW6d478?=
 =?iso-8859-1?Q?O8Gg7d2Z2Ehu6ZvqUjKNVaMTCE61L5Rd3dRGwocxQYn1O9gjWo+OcdEM0G?=
 =?iso-8859-1?Q?uVIU/hGS6EiJmWJegXqFD2KUF9f4UGSTt6qW+hiqdwxUm0SZ/rrXuub/qO?=
 =?iso-8859-1?Q?WDvyCQ+SKm1lHP5SKCI+peSPR3H15QMHvtGSiM80rrN4wkDmeSt3GaV87l?=
 =?iso-8859-1?Q?KDPuPxeEWEBXyUsb2owfbtV8h1lBU6J/Jo?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2e997a-47d1-45fb-cb4e-08dd8da6dd3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 20:36:37.1993 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S23l7PqpZ5UAEepKn6t3Ih/kGjfZIN0+EIPia35HsHwkGfcjX6ovevzqlWQJohzDtPnryKcjvaXQGnVq/kKJnH49lWXkbNtI1khjlAEVnHM=
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
Subject: [PATCH v4 5/9] drm/xe: Add cpu_caching to properties line in VM sn=
apshot capture
>=20
> Add CPU caching to properties line in VM snapshot capture indicating
> the BO caching properites. This is useful information for debug and
> will help build a robust GPU hang replay tool.
>=20
> The current format is:
>=20
> [<vma address>]: <permissions>|<type>|mem_region=3D0x%x|pat_index=3D%d|cp=
u_caching=3D%d
>=20
> Permissions has two options, either "read_only" or "read_write".
>=20
> Type has three options, either "userptr", "null_sparse", or "bo".
>=20
> Memory region is a bit mask of where the memory is located.
>=20
> Pat index corresponds to the value setup upon VM bind.
>=20
> CPU caching corresponds to the value of BO setup upon creation.
>=20
> v2:
>  - Save off cpu_caching value rather than looking at BO (Carlos)
> v4:
>  - Fix NULL ptr dereference (Carlos)
>=20
> Cc: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 0675c46b7c63..5af2e79ae34e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3733,6 +3733,7 @@ struct xe_vm_snapshot {
>  		unsigned long flags;
>  		int uapi_mem_region;
>  		int pat_index;
> +		int cpu_caching;
>  		struct xe_bo *bo;
>  		void *data;
>  		struct mm_struct *mm;
> @@ -3777,6 +3778,7 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struc=
t xe_vm *vm)
>  			XE_VM_SNAP_FLAG_READ_ONLY : 0;
>  		snap->snap[i].pat_index =3D vma->pat_index;
>  		if (bo) {
> +			snap->snap[i].cpu_caching =3D bo->cpu_caching;
>  			snap->snap[i].bo =3D xe_bo_get(bo);
>  			snap->snap[i].bo_ofs =3D xe_vma_bo_offset(vma);
>  			switch (bo->ttm.resource->mem_type) {
> @@ -3877,7 +3879,7 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *sn=
ap, struct drm_printer *p)
>  	for (i =3D 0; i < snap->num_snaps; i++) {
>  		drm_printf(p, "[%llx].length: 0x%lx\n", snap->snap[i].ofs, snap->snap[=
i].len);
> =20
> -		drm_printf(p, "[%llx].properties: %s|%s|mem_region=3D0x%lx|pat_index=
=3D%d\n",
> +		drm_printf(p, "[%llx].properties: %s|%s|mem_region=3D0x%lx|pat_index=
=3D%d|cpu_caching=3D%d\n",
>  			   snap->snap[i].ofs,
>  			   snap->snap[i].flags & XE_VM_SNAP_FLAG_READ_ONLY ?
>  			   "read_only" : "read_write",
> @@ -3887,7 +3889,8 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *sn=
ap, struct drm_printer *p)
>  			   "userptr" : "bo",
>  			   snap->snap[i].uapi_mem_region =3D=3D -1 ? 0 :
>  			   BIT(snap->snap[i].uapi_mem_region),
> -			   snap->snap[i].pat_index);
> +			   snap->snap[i].pat_index,
> +			   snap->snap[i].cpu_caching);
> =20
>  		if (IS_ERR(snap->snap[i].data)) {
>  			drm_printf(p, "[%llx].error: %li\n", snap->snap[i].ofs,
> --=20
> 2.34.1
>=20
>=20
