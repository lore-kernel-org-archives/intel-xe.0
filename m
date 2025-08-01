Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE78C87FCA
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 22:55:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D50C10E06F;
	Fri,  1 Aug 2025 22:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i4lECg5n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03A410E06F
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 22:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754088914; x=1785624914;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aQv3TwBxH+gU2ohVDB/g1WbB/tIvpAN6MOjSGQ3gHUU=;
 b=i4lECg5ntH4TqVzCcq6Jtcxw8r+nf3swtdQvASLsigMM7voxPnFX/Tgz
 H4Ua+VrXhByyQ+hHSQBCe+o8sbPmczOqA0bgEpQ2TsrzmfLbZjKhqh9Ia
 sk1esPp9VB4mMVBKyJVvDp6niMFQx8hXIvRrDGV0kF9t2RXkPbniHZnVC
 UeDmo41y9BqvRXIH4RsTwfSaluQWRl6tcvL/vNottUMREXp81qtatRrJK
 +wBGjQkJTBldY6l1MD3WzYCKuqe68+z2cjQ6xl5dS9woi2kSndEJqVmjZ
 MUnAg5xjS0+cg+Tp0GybS7zNVW1XPNod/jR8gFPOMii795j0KFbONjlak w==;
X-CSE-ConnectionGUID: 6PGOsY4nRemOKPulV5U/+g==
X-CSE-MsgGUID: 84FyRTGbQ8mcL+Xc5Vd2KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67893792"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="67893792"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 15:55:13 -0700
X-CSE-ConnectionGUID: E5R0VOPDTzm9yeMjzpNujQ==
X-CSE-MsgGUID: oKMY1zXRTA29jLgwIfKMqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="167884265"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 15:55:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 15:55:11 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 15:55:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.62)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 1 Aug 2025 15:55:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPKZaGviHJb4kbvAqksColHsP4cWWbKZhOpQDQ+S6GIMvqiy8gO+c3kMF3JkbmlaWfaTA8O/PDxAaSL7/cA/wbM6YS6frccTRJPpOxnvBRnw4tYzGBzF3GdJK8vueoJ7ggL2qUXmN+84Vs6Dt0LXv/SL4cDwcE6bsXhWO9xz1DrzKXTzxo6oYgGLETEVu2pg0vP6/i0Piitxtr7ZvXrD2gbFIUPzpxAubHRYzPnhyTFpU7fHjM0zvzDm7NXv3cXkI0zmmr8Zre+BWGUL9z8R678LCf+Nc46i8QJ3g7X2+cXmxhzxf2fRrh2dwoJkt706HGm7QTYe3Wq5stHNDF44WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMHX3IYM8un9VQEl7ZGv+DOYL3DHezxPsP8hPDyqnTI=;
 b=sQu4pIE1CTetuFw5nNRCrj31T6dchh10Y40jG8OkIh7qRsw8g+t7FoGsUir6lW8GvpwtM1qCpxcvgzv0G03fpgcXvH4YZiN7D8H9G9PlkZe1vN7MD5bdbBTq3Le3qCjpIMZhMQDT7KX54eQdJfj+dK+vNWrLnG3Y30g0W+9pCwADdK2FD17DZ9mJhfYfxjyb2snI6AS1V5+L4GI1uh44Cn45LQ2y++4LqflnC1G5xCbyU0Fwzwx2IFXUEVFGlmad4l18Jl9lJ/fSjKq8zbSmhI/Y8ECXcpkjoL3R6Yvc82t02llFfpLXktb1Kpxe/uvTFJEXTwgt9BeoTAssupBviw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB7166.namprd11.prod.outlook.com (2603:10b6:510:1e9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 22:55:09 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8989.010; Fri, 1 Aug 2025
 22:55:09 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 3/3] drm/xe/pf: Don't resume device from restart worker
Thread-Topic: [PATCH 3/3] drm/xe/pf: Don't resume device from restart worker
Thread-Index: AQHcAXpWJmC/YuphWEiamZ/sioJcAbRLHULQgAAXBoCAAxNOgIAAIUFg
Date: Fri, 1 Aug 2025 22:55:08 +0000
Message-ID: <CH0PR11MB5444AF3ED8CD2BA9EF05CE88E526A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250730174913.178434-1-michal.wajdeczko@intel.com>
 <20250730174913.178434-4-michal.wajdeczko@intel.com>
 <CH0PR11MB54447BED0BF0F6D4F435D43FE524A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <e2df3e6b-c377-4c91-b107-518ae7e0c3b6@intel.com> <aI0ngX8onl4C8_3x@intel.com>
In-Reply-To: <aI0ngX8onl4C8_3x@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB7166:EE_
x-ms-office365-filtering-correlation-id: cbd20fbb-0ad9-4dde-f13d-08ddd14e7702
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?JOw5Hk7mPLmCn7fGZViGbJ+SnBnqH4r8Mhi/b6CHut2ieidFMILNoyvhu1VU?=
 =?us-ascii?Q?Si4gfTNAUH5Y+C+4Xo+gA1m55BWu8aCYU/OTdPZEyhwOf89AI3Epyrjy1YC3?=
 =?us-ascii?Q?0iNEpx7xbEXLS7kl2ePNAbX/jIQd+79ZSGnWjAhmFyFQZoiSpX7lj0Ns/jwO?=
 =?us-ascii?Q?2IJIiKg3Zg1BL+mMtIQSmERDUFyFhYVha0+V+4Af8/jKMlQPOO7GbYD0sf4d?=
 =?us-ascii?Q?bWIbDALUoNa5eWga093HzQdAotyCJcb8liuGAf2gBIsEUyaeKZP9Q2UHXd89?=
 =?us-ascii?Q?JtCLi/9IQJ0QA2I9OcPH9fC4inj9GpgQPBB1JOklGq94rXao9/Y9zFkp7et+?=
 =?us-ascii?Q?poD0YJCHL8Fcd6z9dU+ptTD1jjqflMqzjJomSJRtFxXsz5gFZHuCPEBHW2Vb?=
 =?us-ascii?Q?xH+7uyUaFxDyV5mwuIXtBOXny6i9mGlUjg0JpRrbhGUocEFUMk+ZrDsE3rng?=
 =?us-ascii?Q?I6++I59qDNbchOzcZ7lEe+Ag8yroOFSoFg7JRyezKV1Aax+JifpZI/HHF26a?=
 =?us-ascii?Q?pW+dxcl1vr6HoFzOUDZ490tFmos6MyCUq1zOYBueuA2RwTZHBxt7Tv+4NWP7?=
 =?us-ascii?Q?X0EgHtZXR4WRVtmLWucG1OCP9o8+gB7gqs/vKT2Me48E8ToNqiXWL107qY8t?=
 =?us-ascii?Q?g0VLaFNROJsLmfyUUrrNnd8gsA7CSILhPogq7NjL9VZmBJbAXt1zz69VubGG?=
 =?us-ascii?Q?B/+pVaaRBaEIu2LSHpo6fz4PuF8kk5EonZqkjhz5JSfGoa4J4EhWlhJ9r+IL?=
 =?us-ascii?Q?aXXILHr0rwhoRG3OKjZUCYYhcDSyP0dWBZ1zxB25dFrzU21JZ2PfyhKssXPv?=
 =?us-ascii?Q?bNhEzqoo4QBjaS2WA9lS9asbBU29F/cBz/QhKbQyb4J2uaOVRG0yLxawqmjQ?=
 =?us-ascii?Q?wma2kPhnxirZ2nhATAweXqvxGeIpJDwOxTxNAjm7a2kVv8P6gxPYDba6jyLQ?=
 =?us-ascii?Q?SKPJ92qnUtxjTb+5eQkjJZpDZhnqn8R413vO/PKwuH3K+Hk16dxTmYSSGn/A?=
 =?us-ascii?Q?/oy7XQSXdqvgZ7lHGcUZNaEhJCmDfP9w/F1tvgdEFNl4A0HZjQdG6XTy+K6m?=
 =?us-ascii?Q?1LSZ24Ej+rXWES/goFFjAeF0lkV2sdVcf1E8Y4EFYINJmgH+bWvTL1r38irA?=
 =?us-ascii?Q?xQbI4PdO7EJPIXbw2aZmt5jgE79f8abRMnIiFN3P1STubOJgfEDcwjUpusap?=
 =?us-ascii?Q?qPl6UNsBDWzMQPlrXbBWZqPE7Qb8Q28TU+mdI5vY9cB7aU4LjnjR5H0P7TYC?=
 =?us-ascii?Q?kES1sCyAFplIXRSaSfxVIIgwXukS2995+yDxtECmClFVajG2PX9gFTCq+Tbo?=
 =?us-ascii?Q?FlaKCA33ja9L4kZbI+PSsGZS8PZCmjnseCT3QsKW40yc4i9AgwM+Togz7X3z?=
 =?us-ascii?Q?H/x6Nl3HXNQckqrpuGzjO7iVrAZ/XQjU4+3QCEE4gQSmf+U+07BddIvT4j2D?=
 =?us-ascii?Q?ef7V2VqeAoU+fNdM0GOx8Vlq8/gOZlvk5nHTkyw062nTPcHmzuiG9A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9w+h87nEF2BfkCJs1EXiZuIHkRwBu/pz3g03E+XRUkvtpbWZ05oZ6uxyzup2?=
 =?us-ascii?Q?OSpNd3ZJzv8lpU/lrDDvuj5KV7S0Dg3kfa+yjdGl7n9Tdjp911KiQw41gJ5o?=
 =?us-ascii?Q?zA6qf6UVkvuqxFAiDVCOZg2ItHjlh6agxcjveayfCGFOyRyHKH5YFutXsCJJ?=
 =?us-ascii?Q?i7Guo1OdZFF1PQh5tMlDth8A8XheuwW5QQ6EQmyUjLN11PRwtY2JoZ8RVmg2?=
 =?us-ascii?Q?zne+I6595sOnnkEVgpDIK9y8pOENx9tByidsdjtvSFd/zbpktq7/xVzdeKM0?=
 =?us-ascii?Q?EH5mi2tmEZtgcKPvwPwTtw0rnNK+mUNe9qVU4f0mPzUf+n/DM5oK5Ep4j/nn?=
 =?us-ascii?Q?vKg78C8VU4wJq8Pl4T59AJzJtdMOwwdZxpG11EjEwfimJFMpwszg7XDcxHrq?=
 =?us-ascii?Q?lTLH14e6QtxPgqDmDyR1U35pRQRuyfJ6Sdw/PyHum2wdBzoC3+bWCL9pfyDI?=
 =?us-ascii?Q?88GLZ7OGKQQ1G3NocN8k1xvDpyccsKdbUcd0YZ14meWBUtQaVaO48QDgiZbj?=
 =?us-ascii?Q?sp6t9hmEwHEaP5Vkgngcpo/asZg0u6CbTc60n0imXXkpohZQ2ZpbEMnk0hyZ?=
 =?us-ascii?Q?2O94dmJuT7tsR4ZtPGA1MeQ/MKoHvxL+gzavIhKaD8Kx6+9EfPLrHmWo0W9a?=
 =?us-ascii?Q?CgMOCYzgQikUtmeApGOpL+5QFO9ujPr3lmxV515U0RpuwJ9qFXG3T9HlErL/?=
 =?us-ascii?Q?jrUU5UI0Lt468rw81YQ7fxAKosyT+cPYFBkzoGZEQQCYRXIemvreZY0jPvTD?=
 =?us-ascii?Q?q3K7O/mrWYQuWvnWA2rFrHcQ2k+v2uE/8vld7gTP/eipMUd2kp2xqniWvbfs?=
 =?us-ascii?Q?HyX1MQEcz25Q7uLZ4gaW5kG2F8c2XRcft+qwVrRCq3gi4qv1eWMoY8RTkxq9?=
 =?us-ascii?Q?Mb/itERqImhIMAUNWUHv1coD8jPbYmt9oveezd3XwHxAtEwx4LMyyDE8YMo2?=
 =?us-ascii?Q?ITUv8dxE+mZnin+I/5nWcJtpFzDoZokcldSlMZE3dU3QmEw4NbmXZNHvxe0P?=
 =?us-ascii?Q?W72N32miSwRweIpS7sf7eqIKiT7V+/6DfT3+DMf1Rya8dPTNn6L137TpmUq/?=
 =?us-ascii?Q?L60WzPKhjordN4NmKaJ97Fzu9dHDbXiKIxbtOYrtB6VpR99AA+YMtAZLQ+bw?=
 =?us-ascii?Q?4pLa7gwHr7RlPXoTwbZK0qDcktIfqfN99cSRU/op8akQfmi9lNcRHAmN3OZn?=
 =?us-ascii?Q?sJ0XY/RBzR7TEuIr9Q6pGiPoonPKXCQXiL2SFJZtKpe3ogFd7rKQA6yI1k8W?=
 =?us-ascii?Q?M8Qxo4JsxQaF0Dfk8POPksi0Md1WeujYYx8lZglCSq9grgPeNo5kxkeu0x9G?=
 =?us-ascii?Q?oz5Tm7LF2ZVRcYPLyq/WSkmLHeTtBcYv0ayqbJkEAepSIkQB7D/gGhZv9mYk?=
 =?us-ascii?Q?SsATCLVOyejtbCSO6sY7rYOHM9Mz6ubLWEaL+Vu8x7no+r3p5qeTdRbSwUYn?=
 =?us-ascii?Q?HQXsuJqaPFPF6cSJELjRUI8iGcmXvUNbQhuGN+xI2dP0Na+A3DFDzBvZOH+k?=
 =?us-ascii?Q?Ok1h7M55CSy9VA6HCYI0/0kpoDxHjM5QBfbVDrPNcn1WFkuFMcFpbaZXLl4E?=
 =?us-ascii?Q?tsZQf4rnZmA9mFZWrrR2DTu/fyk3NVMQfLXPC0ue?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd20fbb-0ad9-4dde-f13d-08ddd14e7702
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 22:55:09.0349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sv+cHFYwEk5bqPbSv7x8N6kgkjJmZ+QoP9pMD4d15nV5+gmM4AjZGHiWZZrryhs/xIH5kuL8q+/NY1wabTo1TP73tX3nefrmVI4o6upHBE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7166
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
From: Vivi, Rodrigo <rodrigo.vivi@intel.com>=20
Sent: Friday, August 1, 2025 1:46 PM
To: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedeskto=
p.org
Subject: Re: [PATCH 3/3] drm/xe/pf: Don't resume device from restart worker
>=20
> On Wed, Jul 30, 2025 at 11:48:01PM +0200, Michal Wajdeczko wrote:
> >=20
> >=20
> > On 7/30/2025 11:10 PM, Cavitt, Jonathan wrote:
> > > -----Original Message-----
> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of =
Michal Wajdeczko
> > > Sent: Wednesday, July 30, 2025 10:49 AM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> > > Subject: [PATCH 3/3] drm/xe/pf: Don't resume device from restart work=
er
> > >>
> > >> The PF's restart worker shouldn't attempt to resume the device on
> > >> its own, since its goal is to finish PF and VFs reprovisioning on
> > >> the recently reset GuC. Take extra RPM reference while scheduling
> > >> a work and release it from the worker or when we cancel a work.
> > >>
> > >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > >> ---
> > >>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 23 +++++++++++++++++++----
> > >>  1 file changed, 19 insertions(+), 4 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/x=
e/xe_gt_sriov_pf.c
> > >> index 8bc7d7f9f47a..0c9012fb625d 100644
> > >> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> > >> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> > >> @@ -53,7 +53,11 @@ static void pf_init_workers(struct xe_gt *gt)
> > >> =20
> > >>  static void pf_fini_workers(struct xe_gt *gt)
> > >>  {
> > >> -	disable_work_sync(&gt->sriov.pf.workers.restart);
> > >> +	if (disable_work_sync(&gt->sriov.pf.workers.restart)) {
> > >> +		xe_gt_sriov_dbg_verbose(gt, "pending restart disabled!\n");
> > >> +		/* release a rpm reference taken on the worker behalf */
> > >> +		xe_pm_runtime_put(gt_to_xe(gt));
> > >> +	}
> > >>  }
> > >> =20
> > >>  /**
> > >> @@ -205,8 +209,11 @@ static void pf_cancel_restart(struct xe_gt *gt)
> > >>  {
> > >>  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> > >> =20
> > >> -	if (cancel_work_sync(&gt->sriov.pf.workers.restart))
> > >> +	if (cancel_work_sync(&gt->sriov.pf.workers.restart)) {
> > >>  		xe_gt_sriov_dbg_verbose(gt, "pending restart canceled!\n");
> > >> +		/* release a rpm reference taken on the worker behalf */
> > >> +		xe_pm_runtime_put(gt_to_xe(gt));
> > >> +	}
> > >>  }
> > >> =20
> > >>  /**
> > >> @@ -224,9 +231,12 @@ static void pf_restart(struct xe_gt *gt)
> > >>  {
> > >>  	struct xe_device *xe =3D gt_to_xe(gt);
> > >> =20
> > >> -	xe_pm_runtime_get(xe);
> > >> +	xe_gt_assert(gt, !xe_pm_runtime_suspended(xe));
> > >> +
> > >>  	xe_gt_sriov_pf_config_restart(gt);
> > >>  	xe_gt_sriov_pf_control_restart(gt);
> > >> +
> > >> +	/* release a rpm reference taken on our behalf */
> > >=20
> > > NIT:
> > > For consistency with the other two comments, maybe:
> > > s/our/the worker
> > > Or is the pm reference taken in this instance different from the pm r=
eference
> > > taken in pf_cancel_restart and pf_fini_workers?
> >=20
> > this is the worker context, hence 'our'
>=20
> I honestly prefer the non personal statements. But not an issue
>=20
> >=20
> > >=20
> > > There're also some other minor grammar things ("s/a rpm/an rpm" and=20
> > > "s/worker behalf/worker's behalf", for example) that can be applied m=
ore
> > > generally to the whole patch.
> > >=20
> > > I'm not going to block on minor grammatical fixups, though, so:
>=20
> My english is broken so I usually miss things like this. I even just lear=
ned
> that the 'an rpm' is the right one...
>=20
> But anyway, if you notice grammatical issues, please refrain on giving
> your reviewed-by. Otherwise we will need to keep accepting small patches
> later with small grammar fixes :/

This seems like unnecessary ruler-smacking to me, especially given the mult=
i-lingual
nature of the mailing list, but if you're adamant that I should be blocking=
 on grammar
fixes, then I guess I'll apply this recommendation in the future.

-Jonathan Cavitt

>=20
> Please ask the author a new revision and only put your rv-b when you are
> comfortable that we are not leaving things behind.
>=20
> > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > -Jonathan Cavitt
> > >=20
> > >>  	xe_pm_runtime_put(xe);
> > >> =20
> > >>  	xe_gt_sriov_dbg(gt, "restart completed\n");
> > >> @@ -245,8 +255,13 @@ static void pf_queue_restart(struct xe_gt *gt)
> > >> =20
> > >>  	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> > >> =20
> > >> -	if (!queue_work(xe->sriov.wq, &gt->sriov.pf.workers.restart))
> > >> +	/* take a rpm reference on behalf of the worker */
> > >> +	xe_pm_runtime_get_noresume(xe);
> > >> +
> > >> +	if (!queue_work(xe->sriov.wq, &gt->sriov.pf.workers.restart)) {
> > >>  		xe_gt_sriov_dbg(gt, "restart already in queue!\n");
> > >> +		xe_pm_runtime_put(xe);
>=20
> As for the patch itself from the power management perspective, the approa=
ch
> looks good to me. It is the right thing to do if we don't want to let the
> device to suspend and possibly losing power between the scheduling and
> the work is done. However the hard part is to ensure that all the work
> cancellation is taken care properly, what I believe you did right.
>=20
> But it is important that the reviewers checked for other possible missed
> spots here. I hope this is the case.
>=20
> Thanks,
> Rodrigo.
>=20
> > >> +	}
> > >>  }
> > >> =20
> > >>  /**
> > >> --=20
> > >> 2.47.1
> > >>
> > >>
> >=20
>=20
