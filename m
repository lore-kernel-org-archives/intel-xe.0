Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EFDC83F1B
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 15:53:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB60510E22A;
	Thu, 10 Jul 2025 15:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dl3+wmhb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A37510E22A
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 15:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752162799; x=1783698799;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Lxe8VXYGf900Ni9T/MANZijwWqS4KqwjOuFs3jRKbc8=;
 b=Dl3+wmhbA5msnYZ8g8omv3mSu8pAx94cwGz85nN9Ro0kQb9MLmMmItIi
 1oWi55tzbSeMx0PAbUM6QltnOU3a/lrHqS7ytOx5gOHP7fKRBG+M+CO+q
 1Tfq+ZC4RUFy/5EjCBvkAHqklB1M6MYxhfR1fWvseZEowXRFxZ6VzvQv8
 JhEYxcZK4TwBF7YY1d+yXq+MY4Eu6aq+iYwEEZuhFMoWT8gbGt9HW9ttN
 TdHR6rA5KHBQYmTsE4u6OILgB2v5jWNk+0SUrG0D0/fLZj6NY7iXVUBLb
 GMcZvtL+6b4UHCESUIsxP7xmOYO6wsXI7ZbDjoYclEXH7Z/E09LpDBec5 g==;
X-CSE-ConnectionGUID: dl8INsNAQkS/kdPLKcP3QQ==
X-CSE-MsgGUID: ScaMU6+bREqSMgRUvenTug==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="71898899"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="71898899"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 08:53:18 -0700
X-CSE-ConnectionGUID: E9BXuKqhRAGjEaKzk3HW/w==
X-CSE-MsgGUID: bMBdpvgvQ5KCVBHrbOUd1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="160686008"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 08:53:18 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 08:53:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 08:53:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.73)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 08:53:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MXdKqe0R++dk5M/rk8RbtLH5f2jTZKWS3KpFWMHdRrkfYeJJwRF58N8OFOUNWzMqfbc7OEdFCAlKVn2yJ/OXDdVfnpZsULtpG5KM3uAh4cFHOdl3tBt6lngqWXZ+CKpFOVQhhSaTwPSNqxFJM8Ak9pfMBsedCIrLj1pGNO7HWBxVXbVpj8tEWTT7N8G8VfQaV75rcQZdapNapSHoYbliTxVXsHA3LlCtLcqTuZMcQTKR2nVlyoXVRDPs5NNMgTMmas0pIg+IAOwvQRG8BlcgclBoPkgNZZtUP/Bhd7UTkNGGwJDX3cY10oIwsHvO291X19+IorOhC/B9Mz3Km3Lt+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSfRQwjGtLns0xt4/EZcD1aCgud3XQ+AyjU+Bqb2LyM=;
 b=zDThVYJoqMjPdko8+0IpP30IB5IAY2Du6BEJShrbRrvjX5Q0m1DopwOO0dW+i2/Qk1717zSS/D0E3/XuoBBSDiEr63dGosF8q3ZU0fcttkDymdYBaIbo17KFkCGTBGpy67mVfK6ylO7Mr67KMgrXAfOg881Rvy+/iBzXvDNlBMp5bj1TN8NbCx36hP5I8JCns+iPO59vG1YHdzphrhB/JhdZoWv6IXRMie2gSbKOlI2Ww97nmfHnhI3F6rgNAHQz7Trv0nlL3FF6FSkGOvJq+0vj24nXmikXnnWh0sb8/kFIj6Q5xjKYKLSYE3r4/Nc8Jp4TLyKJZuI0itnyNPoPLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9304.namprd11.prod.outlook.com (2603:10b6:208:57d::5)
 by SJ2PR11MB7476.namprd11.prod.outlook.com (2603:10b6:a03:4c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 10 Jul
 2025 15:52:31 +0000
Received: from IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::3184:459:b760:70b6]) by IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::3184:459:b760:70b6%2]) with mapi id 15.20.8901.023; Thu, 10 Jul 2025
 15:52:31 +0000
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH v2 2/2] drm/xe/sriov: Mark BMG as SR-IOV capable
Thread-Topic: [PATCH v2 2/2] drm/xe/sriov: Mark BMG as SR-IOV capable
Thread-Index: AQHb8Yc0IX1Y5Oo2xky2GEtKdLp9nLQrgBpA
Date: Thu, 10 Jul 2025 15:52:31 +0000
Message-ID: <IA3PR11MB93048A26541D42075C6B2D37AC48A@IA3PR11MB9304.namprd11.prod.outlook.com>
References: <20250710103040.375610-1-jakub1.kolakowski@intel.com>
 <20250710103040.375610-3-jakub1.kolakowski@intel.com>
In-Reply-To: <20250710103040.375610-3-jakub1.kolakowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9304:EE_|SJ2PR11MB7476:EE_
x-ms-office365-filtering-correlation-id: 96f92654-5595-414f-717b-08ddbfc9c7cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?uHAg7FuvlGUiTxcY2vf/tIo9TGT7jjx7EP+AY19WKWJLdu95RmidAuYU062+?=
 =?us-ascii?Q?HVp8LF41S+DEXz5XYihz2gdvi7YYTZSEAEjSsN78DdpMVL/2eLnQnOB1qmjM?=
 =?us-ascii?Q?NcQ71Q/Cz8h7WrfVybpEMbvlb+9zEZQzy8qwfaIBl1FcDF8xYw5nkvS5EE3X?=
 =?us-ascii?Q?LPxbrtjNqZ3IHHQk0YMtPW2+LoGGz0Y8V1VTSYc9p1QAqI3hSesqdA3X6OY4?=
 =?us-ascii?Q?p71TxPvC62bDAEq/jL0LRCy5orcxLAz7BW6CWzrsaOJpjeuK+22vLAeH2ksv?=
 =?us-ascii?Q?MVDv+ZzE6UBwwA19UmouYvoKNFjBZFWRkCDLnD0l+Y3340zXHb5g/peYG06B?=
 =?us-ascii?Q?IQhUt4ZDafcxhP/quATgXtV7Tk2cZhka+2o4MisFsuJZLKvn47GS2x0B03MM?=
 =?us-ascii?Q?kCRlEJV5EQNM5IFlUNcyQrKWO9Oaeo1D9lsUZG7hEQdxyXtp2HucytvIxKOD?=
 =?us-ascii?Q?Z12tOvg0ERh7iORZqWYFrIxuMuSntiyUagVEFV/L8NA37jca+7qKIy8i0rvW?=
 =?us-ascii?Q?f8PKQg4FeTB9r2sICoFizhX6jW2cTPl+/Nc9oOSADhsh/IY9OvnTQt4RaEnK?=
 =?us-ascii?Q?vzQobH9VgLqy6i0Vye9wXIqN+EDXPFSNGfgoGdHvsRcixUutrjuN19ZzeLpX?=
 =?us-ascii?Q?2OJfdnJgbmRz/csi27q+uvCKe1ZGXkpQ4YNOiVqSQywfqeOlfQuB5KThQJe7?=
 =?us-ascii?Q?YFnZii+AkfwO+qcpMWBTtCwoWrFKE24BHmhcBe85Qto7nIBQi156hc5EeWOv?=
 =?us-ascii?Q?dLVsOxBo98ppVT29BPnqRvY2GhUzMtfoXr5s8wH+7xvA81cmnyKV2Fx/76gj?=
 =?us-ascii?Q?lNFb1VPkWROHO4YgplpnXNOFSyA5e/tB6aOJ37CrhdUzPGSfWZysNSQUrBZ8?=
 =?us-ascii?Q?m16+pji/obIc+SbXgswlbrAS52VzN+9iBYYfhAHk4I2nOzjBN8AUmLYNG3A2?=
 =?us-ascii?Q?uq8y0CAsCMeTaMnJknJJzZIavInojIyq6HD8nXoiu5NMANMdk4qBgXApAe4e?=
 =?us-ascii?Q?uJ/j6DfFaPbAFqIIfwb59BTMzLv87xgAMGvIIQwSA059/+qipoxV8dPbFarz?=
 =?us-ascii?Q?eXxKi66k39em4KuSL9xBIIZXTSS2m9FR9nuiDZsAI6ivvYkxu3C9HZAsCGk3?=
 =?us-ascii?Q?+sRoHRjRo1xjMZ8gVSRcHiAnLTytKAUKeIhH6wHwXcsaQgeQ8Ar6U7ol5uOI?=
 =?us-ascii?Q?iaUErD5VTu2lCHbHGjgFAucScwADxi5/GRlBOVYzjmWHcATid/uL8sjCerD2?=
 =?us-ascii?Q?AvRChCsnAQM8kqlSaFCEyTR6eAFZKCxLe0jpamQFS4j0XJECz2om83lrSmg1?=
 =?us-ascii?Q?j8LdPwmVLt5rpTICtvdU549jo8TqE9QlL07gIZjffQAbbsHFPv9is6/3dm4r?=
 =?us-ascii?Q?3edweJXdMHqgUx8gj1GQOlbh4tWMjBHv/njvwYk8yNcu/v7mm7vTziYno6KI?=
 =?us-ascii?Q?ea7hy/UsgTBjNrNLSlWEcPdXyb9ckGyjqbzvAb/KvsU7r2Hpkj1RcQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9304.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wTxDYb+Op9h9U38srqtIudzn+P1bRaEpOk9Ma8AIhuiH8jotcVBRH8nMSvWP?=
 =?us-ascii?Q?Cv+jTtN3gFQuENQTDHDjSt+e5/8BEtih4AoFHenuu+QdesvK5X60MEU5tHMo?=
 =?us-ascii?Q?jDPmVA7PZA7ixNpFKJHEI1c9X6hDdC9HWT0KU+nVWvD85ntGoe6GZd/C0Iap?=
 =?us-ascii?Q?9oEteHAIhIG3Wg4Gj635gk0iIhh4lUBNMT6gFnjNOzt3Z1HI940gChkd+FQZ?=
 =?us-ascii?Q?0cgwGt0PLeGvZlNJHu74/V6S2aK/d943s8FFL3QSweLh/L6E5Z8P8g50LHIy?=
 =?us-ascii?Q?ePolK6EoG9eZg7vj8seY88KquBhnsUxB9Kqxi5+OuFa3P5keH/qTHoE3IUg2?=
 =?us-ascii?Q?7n7XScI9YHHuWG57irPpWyyMPknfsg+V6FbW8BMZxhVMEiOINiRLRHPmjbC7?=
 =?us-ascii?Q?bKlYrNmVo5BdJhMc1Bej96xVPe6UzkY76ZoGx+0ll1SshOGbdUywerZq1Toq?=
 =?us-ascii?Q?sO1h8BuBRq5n4+CmKcnP7AAwxYRLHVFYePLyoGP0XA+8+dhuVTd2hsB4RLMZ?=
 =?us-ascii?Q?Ouaj8UoieXs2uCdOw/F3x5NX90HzH8FSsplMGolLAtMSq5HfaS2SQCgNKz2D?=
 =?us-ascii?Q?zZramXQw0Iylxec52CwH1CSK6Nm/w9VpuMJ0WPErM3vesKzwk0t+HyDfegee?=
 =?us-ascii?Q?sxl4EXJA1WgSSPNMCtchGA2YT3j/yVz6zkXyb1OoPfBgFixZ+FmunQaHM2Y0?=
 =?us-ascii?Q?v0tc+mMqBon5v7bz8XyWtHeo25KfG6WECCp4FurzswVEJHXypFZL0GhOQwFO?=
 =?us-ascii?Q?FeAcAT+nolaExUsLAm5dq3dfo/pauC3cZsE8EDFfGsUkeQhVAovksZffo4ny?=
 =?us-ascii?Q?QLQpGhNEy5E9W3C8QEwnRHdt/Veo8cOqMjl9m9icnguUm1srElBlS8+zPqN3?=
 =?us-ascii?Q?nLgJRh47sG19ad6n9vX1LSuFLs4JNKM2myajfFn2ljP3yWOZnj0c5uNBtRMR?=
 =?us-ascii?Q?dPgyRlkQeesgNiWcY79jPuFsny6iAM0qSW3ynh4EK4mP2YHeJQ7EB+0I/7Hh?=
 =?us-ascii?Q?Q0Q7plqpvFnoVf+O7kPpfFS7wGESC2cMrfC5TRcfOqnpDrA2Jt7DbE/JIDUo?=
 =?us-ascii?Q?NRNNwHHYB8OnsepLqSrsZexoIaWKYkHZM1BOfDjPblOsSLuvcCBm0OH4BSm7?=
 =?us-ascii?Q?u+Bae+pvBw5eUFivyteRC/c6cEv+GV31TBW/X3AvCumywqfRAiYphV9JDAnP?=
 =?us-ascii?Q?gWYNrsMb/0Gfd59TiIUvo6BU5bdy7ntR1u8h4hPe45GLVl6oyxYVm/oCcYWn?=
 =?us-ascii?Q?ctIHHpPN8gce1ZB89sQz2/J3nWdsdEqux1RDmlPQIYkn6/FaDSHfP+TvQME9?=
 =?us-ascii?Q?0456HKGludb6E+iiE0czny2+QkOyoDP2T7AvahoxDRVwT58ZlwaR7OQVJWzp?=
 =?us-ascii?Q?od4Rkm9l/4kHJNnI+RdXwitRZJotBanQqJnBR1JjPSv7RWILkVs8Z6XiuFYA?=
 =?us-ascii?Q?GcBFtxj7O7mySqlMtU4fmjnBUojdfwkQXQzYc67UfWB/66ppACNDGajEURFw?=
 =?us-ascii?Q?4Cw0vckSBEBqk3HdvbQK5uV3BRl66ocPoRz2EKGBBlf1Toz7vstaDcfrA2DL?=
 =?us-ascii?Q?e8W6iFSrRKKHV5qmOi55yOtALhxczTIkF26qCXMRfN1cmHCrPGebCqteQ3cn?=
 =?us-ascii?Q?HIDwZIBZbUCWn/GeJ5MovCDSED3rO7F0Q0AO5bNAGoA1sQ/YpMiBMBS3z8wY?=
 =?us-ascii?Q?L0M21A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f92654-5595-414f-717b-08ddbfc9c7cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 15:52:31.7465 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PXZyMu/Gv5K8cVbkni68SQ7MmmWyb4N+ATrnWY2VqaBHXXjeL/3XpxDMsdEZ+PkVwSSzmEjE5Pfzj3XeYgGw8OrE2aXLkkESeNFvmN0g3Sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7476
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

Adding my 'signed off by' tag and additional two lines to commit message

-----Original Message-----
From: Kolakowski, Jakub1 <jakub1.kolakowski@intel.com>=20
Sent: Thursday, July 10, 2025 12:31 PM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Kolakowski, Jakub1 <jak=
ub1.kolakowski@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; K V=
 P, Satyanarayana <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v2 2/2] drm/xe/sriov: Mark BMG as SR-IOV capable

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

Enable SRIOV support for BMG platforms.
For SRIOV to work on BMG also correct, SRIOV-enabled IFWI must be
flashed on the BMG card.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Tested-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
V1 -> V2:
- updated commit message (Satyanarayana K V P)
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c inde=
x e9c5d3150efc..0f5147e26ee4 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -331,6 +331,7 @@ static const struct xe_device_desc bmg_desc =3D {
 	.has_mbx_power_limits =3D true,
 	.has_gsc_nvm =3D 1,
 	.has_heci_cscfi =3D 1,
+	.has_sriov =3D true,
 	.max_gt_per_tile =3D 2,
 	.needs_scratch =3D true,
 };
--
2.34.1

