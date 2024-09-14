Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494A1FC6176
	for <intel-xe@archiver.kernel.org>; Sat, 14 Sep 2024 23:06:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F7E10E076;
	Sat, 14 Sep 2024 23:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YADSscU1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5952110E076
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Sep 2024 23:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726355166; x=1757891166;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xnagg1UJvZou8pqnqowGS1Akhscsd/U5sWjttUKZQF4=;
 b=YADSscU1ITEFf4w8TU3Mx7XuBpYACDYPoAAbxsbhAw+FAV9MkLfV3wyq
 RpoMH7m3T27amQv2gyFwVN8UJ18oCybREPx7gsmWW38hny3vE+F0ueIi4
 CYkHRMo95KRRdhjldotZYYeqnOjWxsile0ahYXkX3cmK8ZEZHz7ZFRF1S
 b7k3dha+rMLsHJlx8rJcAU++bjguRgFrMHeaePAvqP2QxiqT+3f9D2H4B
 RlEjAbe+lPQe43emwjJS7l7y/VvPUqlnXke5zg9tgDFBgimiwAX2xVmcd
 bKQ5Q+X51QJ045CP+UMul/nKaVvRJ2XH5smqgjlrE0mtZKM2BUfO9exY5 g==;
X-CSE-ConnectionGUID: F0T7xW9oTbWiWgrHJiLc+A==
X-CSE-MsgGUID: 5QgjYjbBRG6MLzTKgHYWSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="36579230"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; d="scan'208";a="36579230"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2024 16:06:06 -0700
X-CSE-ConnectionGUID: fCzOJtmCQ92KTsnZoy3JKg==
X-CSE-MsgGUID: MFVq75rVS7yC3z+8hHg+Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; d="scan'208";a="105941030"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2024 16:06:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 14 Sep 2024 16:06:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 14 Sep 2024 16:06:05 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 14 Sep 2024 16:06:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xcwLdR6QGgF/g83j8MvSQ4xSKRla3ef30dz0KJGZZKD3HU33IpPKp8fJYdOlpFcYHm1CQtHlGvnaVDuJg8yDzAXIW4IJZwUXd5/HdwclTfFgYCcWlRp0dvmh0VF4KuSlFXq0uIlx+9MMyi7hc76vCcJ7qrmIC864g8YvQ/unoKo7d1My63r3dHqy8KWriQU/s/msbBW7TiblWDHql+Qoxe4CUx4UJ0Bi0wVQP+W2i8ORVQLdnvnvx0pRFCQtoRiClsyPoUm3CblkLb+iGKI0aB0qSWCqvxEsF2ReoHdJFN9OAJ6hhx0yW9lpZT/RhXalRsSHQkD6lPX8t/92W3ekCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAqzarBPpebZ55h92SBYjag3d2pED+ELoia+TFLAVM0=;
 b=bxlV5EE0uXN0iFIv7jBS3Wlki0nywJGTFme0cFCm58jdBTUtqyFdlPR14HvPH32fIABbd6TGUX1tmC2z+rcmYXorXXkCVBR5F+6XCQ68QBnt5uPObkp486oe4v6NbcJWMbz+RHECav13IMOb52NcUv2xt7f5tVpkX9tZU1wQidB9C1LLNZGOdPf6Bu4DoP+rBCSvXpRHNVaQKKiL5P363WtLMVvTuD3o5PTau6rJiL0QxFWhffgOHxS+ZRpWiImcnt3T6gmfFxjtX0xwWrmBLG+d/PnzXxE6u64vdJVBmAos33ZTOxV0QS4/v909M67y+537PmKBky4Bcgj5Geocnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SA3PR11MB8074.namprd11.prod.outlook.com (2603:10b6:806:302::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Sat, 14 Sep
 2024 23:05:59 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%4]) with mapi id 15.20.7962.022; Sat, 14 Sep 2024
 23:05:59 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Jahagirdar,
 Akshata" <akshata.jahagirdar@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH v2] drm/xe/vram: fix ccs offset calculation
Thread-Topic: [PATCH v2] drm/xe/vram: fix ccs offset calculation
Thread-Index: AQHbBdSxv7g8x6wMyU60pnODJ4vvLLJX6PKQ
Date: Sat, 14 Sep 2024 23:05:59 +0000
Message-ID: <DM4PR11MB54565C34141FA293E75209E7EA662@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20240913120023.310565-2-matthew.auld@intel.com>
In-Reply-To: <20240913120023.310565-2-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SA3PR11MB8074:EE_
x-ms-office365-filtering-correlation-id: b3744892-7738-45cf-c99c-08dcd511cc1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?+g8UGUEhF0+kcxy3YJW/EdbGjnHN8inrnm30B+SsbpsHDJF8uLgEiqc5IzHs?=
 =?us-ascii?Q?Fwso9BF+H7+H6OvV74+WRdELMK/JyZSITw8Lw7r3itbNWqK7eQO7egXEtQXM?=
 =?us-ascii?Q?o05L+1m3dbbIiizk2iJC5VwErnZ+fKE2p1NZV6h9j7Ptcun2BtI5XZhRbgSM?=
 =?us-ascii?Q?E8dfh2cZI1EZW75gzsm89U10juBFJiUXVRRZsvwcduNINxjI9xUqbnWgtG1o?=
 =?us-ascii?Q?Rjgqd5tTxHAKupUfH7eI4uhGc1y02nbuoqF6pTeX6vQaSZMwjKC/tlxQ8jlo?=
 =?us-ascii?Q?BuHXl9iVLfHXdjNiJ5RSnwrGmb+MbjY9499l4juFLZkJ+mTnKZrSlbV6WGLo?=
 =?us-ascii?Q?djcKeU/hW1/K2/wlc5NoyUjY8G89QCLrII5i/USy0Dvb+qDZciMxgWhh/iSC?=
 =?us-ascii?Q?2hslLQQTRav7s+GSjL7JtjirzPvD2psRk/Vqc0d14N7WJEnFICa4E0LQhYtG?=
 =?us-ascii?Q?5ldhOpKSj1bIivAnNoEbxMdOA0KLhSDRD0mPeEvSFsZSez10wCabNHi5j0HB?=
 =?us-ascii?Q?IHFmjN+DLv3XXG7crP86HW3NaRwK618qJDdDxjNY3jYsih6MYuzPL0nXZ+tN?=
 =?us-ascii?Q?grYXG0inl1ggPAU/w9SkAFJ4EhgHF6t8mGpki66gEG1KFFEu4AgkpRucaWXF?=
 =?us-ascii?Q?p7SNmf6XVETY+rn4J5QrK2JjZc0SEanahqhVnyCh2yZ3AtBat8dwGc9uL+Is?=
 =?us-ascii?Q?gk+YpDnGCtBt9371M4TT1kvraTbnjuth4rf8W38VArlcwLw47U/uROUbcdKW?=
 =?us-ascii?Q?PchwtqARZs2VURIIR52Whi0FW2WQ5UmlocjflrDjmZyjahPH/jqtaYBiwpZK?=
 =?us-ascii?Q?V9hNxCwEP6DPT6VqXyacBaDcqmB8xOWQVfTp+B22wz7TWV3ARFPwdY1Zme+D?=
 =?us-ascii?Q?sfjIYiJuczY/YNk7aS1iwH0huDs3DEgAq4slSBaFeaa9zJMEeirDOq+0xFXE?=
 =?us-ascii?Q?K6EQJhDAKGZIdgwDnE8WN4dd/lFJeyTAfPZxTXs+oBXx1JH/Nu7pwYfRxXWr?=
 =?us-ascii?Q?1MuB1IkSmqrIszHOhatwbuv4lbJeMjw3TwqpCnwW55dlOi1LFG1xDfYJA3zQ?=
 =?us-ascii?Q?PQ0MObAhwbyIYudoxtwPIXwPyUBJgrHULG0PHbQa9LgDjEkb1/DMmdz81xyr?=
 =?us-ascii?Q?5vS9A9GcwRvabi0zBH1Vh2XymTAlMxq5FnI5CLahZAZWI/uMKOk2lAaI2I3U?=
 =?us-ascii?Q?8cM7snYd2syHckmz6OqF3hoTvHvZ9tFM41Ie6WPgTOAyovFVHalK2RkDqe8w?=
 =?us-ascii?Q?zhkJbcYGSt0GY8xtYSwFd1YbQ2b7yNnvUF0OlhlsMAsq+Ei0ARVrnazw8cph?=
 =?us-ascii?Q?xrMdkULEf029bMo+Ko6YT2L34xvn6/UseT25iO83zF0kW1E6yEEg2Hx1/WmT?=
 =?us-ascii?Q?6ZFlaW4N4eMK9LOCVcraZGq9xLqBVH9hiv4uQe1WpOP5uIT6tg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GDOTbia6ePJknUQTJYO9b7f+nN1UR7Zc2BEbzRZi7s43lRUtrRnmI8qtb//K?=
 =?us-ascii?Q?Vu/PmiDOfWczmFEsT4tG0wSSuqx0UZ3ZJcuDyyaAXmsUAzyKzp0JHOM2sFqG?=
 =?us-ascii?Q?UhsOTU90h5bJj6gbwXpjRJR+nmogHniJ7iwa4UlL1xjJMXjkc0PQrz/OAdAU?=
 =?us-ascii?Q?8fgBpsFjdk+qnRHxPI8t9gu3zfIG64Xd5SfaIaMUYqZIhTiGIREwKX9Kg7Ud?=
 =?us-ascii?Q?ryfqFwZmmlNMdVgo+Fv5k5M10ZgY0xHE5xbt0RvLAIZeTLHiBMmEUlDHWlxF?=
 =?us-ascii?Q?rUcyGT9vEbBvE5t97yczwhDpa91nCCjuQ6hRMiKA5Qx5HPLxSAz2o1jvOPJT?=
 =?us-ascii?Q?9LeRbcF4IDOlYUxGTgyAZ58TsiWXZ8xWUKDgoQv35zV4eST0I9mnaSuJ+51F?=
 =?us-ascii?Q?EcTWifFVLN96zfbabR0Kn3wnCjJYwMU0cI+X3Tdi3LcF0KzEiqhxLABp0D/I?=
 =?us-ascii?Q?zLZTvpur3j8epIyksviAy0xxX3njUgDAcOVobqDoAnETYzmymEPQ2PTfjYKo?=
 =?us-ascii?Q?0ZxDAtDk9XI4E47OaIWK10ZqCemAQCEB5ohi6oGRCHqbgAWYob60IvCRy3Qg?=
 =?us-ascii?Q?7eKTkb7xJNEY3l07YC2sD7DK/4dHMxqNFP4S7M7XW9jiQow36bs2Wipb6nn5?=
 =?us-ascii?Q?/hcwc5rNFDVJIB5wZaNWToY9xCqUh0PXBkJzSGZFazABwnZxitbOA1r2856Z?=
 =?us-ascii?Q?IAr08F3HTEEIklpyZgqxCHVUyGHMfWOUXlSDsChuwvMzGbB82GwSnQbLoRaQ?=
 =?us-ascii?Q?nLBbsaVUHEq6DR5mgtWm3dV5JnxTId8QU6D0T0z2VM4YEW6VEDZAT2iqgXB7?=
 =?us-ascii?Q?29wXwd/coJXyD2J008Tf4XbxKt1MOJQmRx3OS1XeS0iKbjM8GGgoRDFSe7cv?=
 =?us-ascii?Q?5BooJviwwmRS3/BQgf5kNovfU6lmLwMjbVUR2yf75jt/WaEHUvdoJYFJGTYI?=
 =?us-ascii?Q?6du1SccEHiwnbssBZ2I4U93T4xSMSNGF/QofUKxPyI8QEjb18wgMwwgY16e1?=
 =?us-ascii?Q?8fAy/hjxSv6+HkqjPeSS8qt/wHZhVq0B3HdVGU5ApA8mNmr5SrxSBzChalsb?=
 =?us-ascii?Q?V0+8j4XIjG0lYpouFT8rtvrKD87J6Sr6PZiTCjbVI9d6YxO9kex5tSXfvMxL?=
 =?us-ascii?Q?QcvU8g3EkhuapFkJ33ROIvdxAkOowQj0QWOZrgnGhMwG33G93w6DVbKsXDpC?=
 =?us-ascii?Q?Nm1FgNtfJ8+qkVFXvDjrBqg/AiBjsTXcPDZOyGA5CDqxT4ezMCeYP/VRsYLa?=
 =?us-ascii?Q?KW7YTrVCLEDD/DvpLDW9+g42Y9LNOKBTyKo0U8Cl+C/hWkcXPn2KhpmHU/oG?=
 =?us-ascii?Q?G2NwbVu2KOCpDzRg/wzHC2uQURuJpPzIQiIeWuaO+fmziSZdxCBYAK2dzIYJ?=
 =?us-ascii?Q?lZVgEvUf3rstelXYEibmrsHHCMoYZhDTlfeatrTNvnV9NTQh1+sGldS4WEcV?=
 =?us-ascii?Q?9StpX6ky2qqqekpbXIAw4tT3+9KphJc1VCDvt4azltUi/xot6hGvUUvTOwth?=
 =?us-ascii?Q?/7LcNYkpR8qLkFfsT+XMspUY7WnGffq26GVdbe51ZLWxySyx2PK7TOFmwM8I?=
 =?us-ascii?Q?CwG1cRxmedO9B9b18kNR+oYQIfJHwE5VWhXnhwI/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3744892-7738-45cf-c99c-08dcd511cc1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2024 23:05:59.5011 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o4CKfRH+TxzLTIedzWxbpxlrqj/+Sks6bCcc49z0/eS/MJ71IWSh/8qtgEu5/Zq6jQ3+GPSuJsJYmaDvxS/D/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8074
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



> -----Original Message-----
> From: Auld, Matthew <matthew.auld@intel.com>
> Sent: Friday, September 13, 2024 5:00 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Jahagirdar,
> Akshata <akshata.jahagirdar@intel.com>; Lin, Shuicheng
> <shuicheng.lin@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>;
> stable@vger.kernel.org
> Subject: [PATCH v2] drm/xe/vram: fix ccs offset calculation
>=20
> Spec says SW is expected to round up to the nearest 128K, if not already =
aligned
> for the CC unit view of CCS. We are seeing the assert sometimes pop on BM=
G to
> tell us that there is a hole between GSM and CCS, as well as popping othe=
r asserts
> with having a vram size with strange alignment, which is likely caused by
> misaligned offset here.
>=20
> BSpec: 68023
> Fixes: b5c2ca0372dc ("drm/xe/xe2hpg: Determine flat ccs offset for vram")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: <stable@vger.kernel.org> # v6.10+
> ---
>  drivers/gpu/drm/xe/xe_vram.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c =
index
> 7e765b1499b1..8e65cb4cc477 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -181,6 +181,7 @@ static inline u64 get_flat_ccs_offset(struct xe_gt *g=
t, u64
> tile_size)
>=20
>  		offset =3D offset_hi << 32; /* HW view bits 39:32 */
>  		offset |=3D offset_lo << 6; /* HW view bits 31:6 */
> +		offset =3D round_up(offset, SZ_128K); /* SW must round up to
> nearest
> +128K */
>  		offset *=3D num_enabled; /* convert to SW view */
>=20
>  		/* We don't expect any holes */
> --
> 2.46.0

The patch works in my platform.
Tested-by: Shuicheng Lin <shuicheng.lin@intel.com>

