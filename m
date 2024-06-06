Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C95C27C54
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 16:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F9B10E212;
	Thu,  6 Jun 2024 16:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V68litKk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE1E10E293
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 16:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717691933; x=1749227933;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V2HXx3eUapZtc3FXP9PDVRN3zgVtu7tcY5V/Jj0BGvQ=;
 b=V68litKkdi5sK8jf0c3f0g8wdlwn2GwS5rICxU6Iem6RVrzCQwgw261W
 T1YNxonneQijzWeOi7V1+hlWZgE5L9kxSIDQveAmcKTg4UTmnsMVAyTQF
 SrQ46vrj3AtmocFREtLHQHFfjFLWv8AjZxSyuWpCD73i16dqdDdaGFgtH
 wf9a0xGsRZNr8aoHIt87IUyltjFEGW10KYX93BUM+QJs5z/JeLIgsGOZp
 iJPhiwv38IS62kJb36hKJBwlhvHZLk5Fv8EJc0E0gIf2zbjNpzXKJYGvr
 YPtlTeV1yvKunYWr/OR9DSYXTm364A0wxVUnBPPcXA8XfFSMGvO+9fwDy A==;
X-CSE-ConnectionGUID: LNqbOHtOS0uV2EU8hI44yA==
X-CSE-MsgGUID: XT5Dy5C3QASOay0OixpD4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="31922103"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="31922103"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 09:38:53 -0700
X-CSE-ConnectionGUID: P4GzRexxTJ+iqIk1yKdYOw==
X-CSE-MsgGUID: +kYK4woaQ+qDTTXU/JNGXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="38147827"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 09:38:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 09:38:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 09:38:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 09:38:52 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 09:38:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvIOhM3Hj2AfW494Qk9HCVZjrexMGhAMg2gA/U3Xxh7d3HVb+5rICVO6/hNsPA/P4NTjTA4ZYwsLO1+ys4/XEj8/nFrpHg/4rH4svZtlSr22aY6duSOH6eoe1bD/Mpk9Qrzpkgr6cWsAY9tdRka7OP1afvUb8Z7eQ7HE9zSWPJIXtIiDz/wN5Y+79rlfZM1QXsrx7gliS2+CeRcusae81A1hiJp7l/4s+9eTszDElaGU3B7WGy8SUgXQ+mtyyMyzCVgjWByYplR6c6d08uBE1klRdcDq7V6Z3CuJHBwkLX7Vme/474BuL0CSTbbHjfIzDhfwxguislpytYibdoBSAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jw+griWPYcw7dGAR8nntivyVe6MInyG4Vd77VSo7xM=;
 b=lQgZLqMj5VO2JBvBpUSnA770S+KNBZgrbaR0mRVATkwz+gKLmp0FzzMlcC2/56GPZjjUr67qVez+HpH/SBiS4O7kMD4bOshko8YPxC4UT+83EfUWPtfPVPz+VEEN9BycBEZlYDBJK/aTRFqpS/A6jqXQWsb2vWi00xZyDy35+DeqlWfauyn73Ssk1ecJoxabr4tN/BnJK+xxookcffQxoiEHR5bXea6DJiN3CpvU1SXv1/doiTAVKwx5sD+Sky4b/KdWaSEbrR9ZhQuJUa/SU+r5700akQ7D29noBRAkg994fyOviIBk70cR9qGeHi4firWGL1N6wjEfY/4/9bR5Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CO1PR11MB4849.namprd11.prod.outlook.com (2603:10b6:303:90::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Thu, 6 Jun
 2024 16:38:49 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 16:38:49 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Harrison, John C" <john.c.harrison@intel.com>,
 "Summers, Stuart" <stuart.summers@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
Thread-Topic: [PATCH] drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
Thread-Index: AQHat1xc98ApSoJSkkCqes8UMcIlE7G5u3GAgAEJZgCAACjCAIAAA2Kg
Date: Thu, 6 Jun 2024 16:38:49 +0000
Message-ID: <CH0PR11MB54446ACC83247A5E623A89EDE5FA2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240605150828.2736396-1-jonathan.cavitt@intel.com>
 <ZmDiLcMGBdCcz2Rx@intel.com>
 <CH0PR11MB54444909E70839CD751A14E6E5FA2@CH0PR11MB5444.namprd11.prod.outlook.com>
 <ZmHjAAFZ0i9Xg2-S@intel.com>
In-Reply-To: <ZmHjAAFZ0i9Xg2-S@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CO1PR11MB4849:EE_
x-ms-office365-filtering-correlation-id: d0332478-49be-494e-e5a8-08dc864724b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?YE4LXAJlivqxtRhqZyxpqCow9LcDTi5Ky/J/fMa4ii/RUXTVegIB5mz0Ofip?=
 =?us-ascii?Q?uH0mTL/pBjIvsVkswQ+I5nmLun6/BNlSEYzmkW4z0/6SGbu0Ibj+mtfhsOO8?=
 =?us-ascii?Q?i4eW8mMmHbOEYM1fR7tUHHlRK0LoVVMnXApMA3FKf6a0afgsBUO6S5oT0c/h?=
 =?us-ascii?Q?+bR1JQ9a7PFCE+Q92cCDper0JZZU3Z9fEaCkwbQX8w1yOFY0DS4agCSuDf1L?=
 =?us-ascii?Q?DOLJLeax9YCW0ti92ejCmkMZk7ZpWJmItznnQatMcIeHhl7vSSnPuSC5GJO3?=
 =?us-ascii?Q?k1j/ZeqwSe1/McJRHIo6Xmnbnn7jN3Lcsqyps/FyE6em5m5WYPFIJ2j9F2tH?=
 =?us-ascii?Q?CxsajlacwhbuuMBLHj0KKvATmRAn+4xq/9FoLu+mMG5rS7vMQIl1LGkcQo7e?=
 =?us-ascii?Q?yi3Ig+2WiztQBbaJHyHhOxwzS1Acv+3TdJc/N3ehQ50ZCXYX6q7bSqulT8d3?=
 =?us-ascii?Q?N3VQHaP3RUIk4KeEyMM55r0yJKTotqCxjO2D67bsupG63gwnBdHs4Hq9FGb+?=
 =?us-ascii?Q?80F6PAoxxiiPLTPpqSjNyZXAxumJ7ukkWyTRMNUDjROJaq9jIy4g3bIBdvLD?=
 =?us-ascii?Q?KanlhIBIE02s0PVL/Nz9rECFRmNBzmLz6Yohxo+gk3oQNZlgNVB7RCLWDI4E?=
 =?us-ascii?Q?RlulIl5DzbGddXwRd4GVcBAmedIvbeGBD3qbcgKUdCuYNAQT9H2QlIwnWxw1?=
 =?us-ascii?Q?SA7hmaobFQR3BOOxdPCD8HC4cnRzsSzlzvn/ONPCLE86ddnhbu5/2FDsmOFp?=
 =?us-ascii?Q?cSRniJsBCDPE5xJNDINk4QJ/DVmiCoZt1+A90J1v1AN6sMEMRamKXvZRIwe0?=
 =?us-ascii?Q?gZZu+wlL6qihauHRtEMCuX1yjXqLgRoODWp2sdJppuxYzDVDmvVlJNjoyesb?=
 =?us-ascii?Q?8SrRu2I3gCUsyDZeaYyxcxlCyIJttgNUfPEQBk+GmEo0Gdo1goFzUedvZ9Ke?=
 =?us-ascii?Q?gnx1+bHZ1grg+0gxkQBDyqDgKFUD233XUIc82cJw6ZSM6cJL5BGADDbvA7yi?=
 =?us-ascii?Q?bLkWBC/ZBSMG9YpEj2qmlgCNe+yYZK4U7xuQPTUownw4SOaZgHWghGP+rbdU?=
 =?us-ascii?Q?ugBbAWLYdaoCf394D4U79sNBmcF8+z/b8QHHINMKHFcMw6q2J7LbTRyljzQa?=
 =?us-ascii?Q?dFJsViycrFufSTO6intKUfGjAo6FNpsQr3chtGx3HEeosOg5akMkS1MA5CW7?=
 =?us-ascii?Q?28y8aCaeCl1LTnEoBmMP8cKyFf2KS1tdUY0ZDIoTGqlbF+0/25KSuwe0TIhL?=
 =?us-ascii?Q?hw1nKXl+UzYHzYxxDQ8G1xc4CXYxkzuae+KReM0zs5LVdyqoHRaBY1Z8Af2g?=
 =?us-ascii?Q?HVA5kkIHTaYrZa/xc3iYa8Jj?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jM69OlCJ9K+qsYldqE4UnP+xMtak0VlcremmwHZYpSw2TV4nDWLVgTJQFpOH?=
 =?us-ascii?Q?rfktMa0DfsdCNp+RmfnYH0pHW5BpYbDZAiPRrqxt9M9iNMeVm1n5IsmrNdZZ?=
 =?us-ascii?Q?phFtYUJsRY3SwUXfzqVa5wKdl4WkkqNF78X/GW7JJkNJ3lzM/iGcd+yKnCY2?=
 =?us-ascii?Q?InI/RjfPtTWoshXqDhxEz3eze7JFPOycdj64UkY2rqpb0ZXbpOhQ8FIKUI/4?=
 =?us-ascii?Q?49QJsOKbrXFufnzb3hYResJoos/m29MuMY9QvC3RctlJMhNahMyy07jj2G3F?=
 =?us-ascii?Q?gUG+p4Qlld44j1MQn4MHO6Ysd1QHZBUpKDK5iUC/wS0OegSoUk80Q77hYnzH?=
 =?us-ascii?Q?dRPFHiaQjBcpfe9Ey7FiAGex7bkCzFnEuH8WiXnqyDmDCsvllttajr7hC5ao?=
 =?us-ascii?Q?mbRjY+l1KSmA07cj+b90p6GQzWo75tIis/swMQH02M+uCjoS1DALVXfYS9Ay?=
 =?us-ascii?Q?Ne5RyGPF27Nu1MlDtEdoCdYwzOfkbwZ2BLoaMa/6Ew6+rRJHbkMx4V60HgXS?=
 =?us-ascii?Q?lJkJwl9UcBoeH1bzeM6ZvGMlo8ckWhwatL8mbUG9JmFPq/81dFKEAYgg5G1B?=
 =?us-ascii?Q?ExTNGg4Bvra8BRIxtfV27NXmXZ8SFk8nhfd2npOuaTyIYhbp0MFUpmsterPG?=
 =?us-ascii?Q?65cmLlC59TLQlADI1qF8wm0yZfwHAg0UGFbfLuFEdEYp+YP8WkYxaqI9gCzK?=
 =?us-ascii?Q?9Y5NZZDtW2/kvQ+8Jzw1/3MKMnVeW8hRoki64AHyA5PGiZIgdTTa5a0Jie2w?=
 =?us-ascii?Q?aFnk2rF4k736pFAPpOW88I/zJn9Wp4zfsZa9HrrJHcIBKUpdBn/AtU31AYIM?=
 =?us-ascii?Q?kpmDO4OZPW/owNmxE0u6fvyNNCS3H0sa3yAYWgG26mkcsFRvVB6TN4dXbVLK?=
 =?us-ascii?Q?axAuaWNH1YemuCMgIXfilKC59il/KyDbzCQmOK54SuEz2CxsBsuwB7I8eo1y?=
 =?us-ascii?Q?UkXXeA/4g4LrMPApLF00Ggwe2qwifC1hSjJ55SHezAoJ0LGu9wEtz9PVQpw2?=
 =?us-ascii?Q?HbOhxwTLXlceBN9ZyV1i7cwsQqItsb6urmS7lwNeaqU4ef1cb70nZPHAB4La?=
 =?us-ascii?Q?Q4CreGBTZBhNkIevHxXapo9Ub5TlmKQ3dwD62blw/TcXIARq8Eg37uh8p01S?=
 =?us-ascii?Q?wakbYKs7P4Z3k0urLfCT+itrrGdA2GKeSfYGCN9Rq9EzjSzjYddt2a4ARC99?=
 =?us-ascii?Q?wbvyl8+b0MwPpxPAdx5PDm8//1YPboC8VWjNGc7D36Cj7Lj+6XF33lUfu7YS?=
 =?us-ascii?Q?vcz/p2UVP9zX0ap2mLSzXwYN6sEYBS4vbkHEw1wTftFcThEZgRz3jWZBovq6?=
 =?us-ascii?Q?ISr+MgL4Dzvh/mXpUoQHVbWdAoM+zutWs8Xx3k6J6ah4iyY96kvUv4yYAMAZ?=
 =?us-ascii?Q?kRWl/sKlawwulUmDnrAzggVXacmZb1yzFa6xNW3bf3TwC8OCh96orgNrT+pf?=
 =?us-ascii?Q?QuBkFxJjy+vWcr7SyHA7sFhmdxEGxBxEllmn1dbIkB+cOhbJjDJSsiNwyrXw?=
 =?us-ascii?Q?XRz6Y3EcUodIUX7M+9c1andYzAiKBjWkynOUdvHlVRtKelMTAKVrtRES8foy?=
 =?us-ascii?Q?XioU3/1E2RkS11B7WjH1cPrbIAY2YnuKFZBReRBCp7QrrG4aHMISfEGvI4p1?=
 =?us-ascii?Q?2A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0332478-49be-494e-e5a8-08dc864724b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2024 16:38:49.5998 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AGYrnnBxg78rdY7dhFHMUokyOInxBtm33SFxRMSyms9in4fmwUmWq7v0tFGQdXFTmgiUWUvw4uJG4KPbYoMNBdqh+t1R1I6F1m8BUE4deJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4849
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
Sent: Thursday, June 6, 2024 9:26 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Brost, Matthew <matthew.brost@intel.com>; Harrison, John C <john.c.har=
rison@intel.com>; Summers, Stuart <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
>=20
> On Thu, Jun 06, 2024 at 02:11:02PM +0000, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>=20
> > Sent: Wednesday, June 5, 2024 3:10 PM
> > To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@int=
el.com>; Brost, Matthew <matthew.brost@intel.com>; Harrison, John C <john.c=
.harrison@intel.com>; Summers, Stuart <stuart.summers@intel.com>
> > Subject: Re: [PATCH] drm/xe/xe_gt_debugfs: Add synchronous gt reset deb=
ugfs
> > >=20
> > > On Wed, Jun 05, 2024 at 08:08:28AM -0700, Jonathan Cavitt wrote:
> > > > We currently have debugfs support that allows the userspace to init=
iate
> > > > an asynchronous gt reset on command.  However, userspace may also w=
ish
> > > > to wait for the completion of the gt reset before performing any
> > > > additional work.  To that end, add a version of the force_reset gt
> > > > debugfs function that operates synchronously.
> > > >=20
> > > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1068
> > >=20
> > > do we already have the igt changes that really closes this?
> >=20
> > The IGT change that closes this issue has not yet landed.  It relies on
> > using the new debugfs, so if it landed first, we'd be attempting to cal=
l
> > a nonexistent debugfs function.
>=20
> Please provide the IGT and the kernel patch at the same time.
> you can copy patchwork or lore links in the one or the other cover letter
> to explain and justify each other.

Here's the related IGT change:
https://patchwork.freedesktop.org/series/134509/
-Jonathan Cavitt

>=20
> In the current way we cannot simply merge this because the 'Closes:' tag
> is a lie.
>=20
> Also, there's always the risk if doing the IGT in a later stage you reali=
ze
> that you need slightly different and cause unnecessary rounds.
>=20
> > -Jonathan Cavitt
> >=20
> > >=20
> > > > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > CC: John Harrison <john.c.harrison@intel.com>
> > > > CC: Stuart Summers <stuart.summers@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_gt_debugfs.c | 12 ++++++++++++
> > > >  1 file changed, 12 insertions(+)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/x=
e/xe_gt_debugfs.c
> > > > index 66f897a9b6ca9..5e7fd937917a1 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > > @@ -116,6 +116,17 @@ static int force_reset(struct xe_gt *gt, struc=
t drm_printer *p)
> > > >  	return 0;
> > > >  }
> > > > =20
> > > > +static int force_reset_sync(struct xe_gt *gt, struct drm_printer *=
p)
> > > > +{
> > > > +	xe_pm_runtime_get(gt_to_xe(gt));
> > > > +	xe_gt_reset_async(gt);
> > > > +	xe_pm_runtime_put(gt_to_xe(gt));
> > > > +
> > > > +	flush_work(&gt->reset.worker);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > >  static int sa_info(struct xe_gt *gt, struct drm_printer *p)
> > > >  {
> > > >  	struct xe_tile *tile =3D gt_to_tile(gt);
> > > > @@ -261,6 +272,7 @@ static int vecs_default_lrc(struct xe_gt *gt, s=
truct drm_printer *p)
> > > >  static const struct drm_info_list debugfs_list[] =3D {
> > > >  	{"hw_engines", .show =3D xe_gt_debugfs_simple_show, .data =3D hw_=
engines},
> > > >  	{"force_reset", .show =3D xe_gt_debugfs_simple_show, .data =3D fo=
rce_reset},
> > > > +	{"force_reset_sync", .show =3D xe_gt_debugfs_simple_show, .data =
=3D force_reset_sync},
> > > >  	{"sa_info", .show =3D xe_gt_debugfs_simple_show, .data =3D sa_inf=
o},
> > > >  	{"topology", .show =3D xe_gt_debugfs_simple_show, .data =3D topol=
ogy},
> > > >  	{"steering", .show =3D xe_gt_debugfs_simple_show, .data =3D steer=
ing},
> > > > --=20
> > > > 2.25.1
> > > >=20
> > >=20
>=20
