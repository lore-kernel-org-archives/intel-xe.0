Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A580DCE8D49
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 06:24:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2A810E22B;
	Thu, 19 Sep 2024 06:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gvp5dJ+W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57DBD10E22B
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 06:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726727050; x=1758263050;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8Bqzuy5136kfnU7L6u3XRGm4hh3U8coRvxIr3HmnIHU=;
 b=gvp5dJ+WplH6D65KoH2aYbvsVCVzjsq8GMCmWjcc8JU070R4gsCGmuv4
 75aDvuFIpEM2+iNyeY92WWhcot07XkJP+gSuLAn3hpu5+Y7S9OlVmD47k
 vF+lOls0JrcKE/+Q0zDgtPX8ofYPHM0R2LljT+HgJ2ovNJTZGf5eHHVsq
 BaXEDZW+3CKLqwYXZEOYCbmk/Q7UPtGl9PHYt8CcCing+qISiMaGMcudj
 s3uxw6zDrkeR18X8JcmN6eGWhJBYB6NqBFnLpgnZR6EDR6ED+4txfM4in
 NqwAP9ZDoKyr12Z+ueTAZgIo7c6/eNjRpN4KOTXfiiAk5UPImYKB2W6Uz g==;
X-CSE-ConnectionGUID: eDyK3ODUQkaX2ugARWW53Q==
X-CSE-MsgGUID: yF2APSPGSRKUMSmreYlf+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="29412008"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="29412008"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 23:24:06 -0700
X-CSE-ConnectionGUID: 0z86k6fxQo6v+4y8GXAydA==
X-CSE-MsgGUID: fQbQ2tIJRrmv1rLuPfDt7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="70124712"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 23:24:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 23:24:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 23:24:05 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 23:24:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bueUE5mnVILfFHD49AMYckKcY9fzcnVWe7JI+nl/m3V2Nd8yIzIOZqGqN1/7jMMahIXmQK4SjBsnM2IpQtMY6g/HcrmdLoQLCHiFp1BVZ87FY7/5HCqk0/cepiLPniau/P3TWo8t9OVvZS1UlSE77MNLwghnOFy0UQbOMPT5utAc8wSGjmBG5WBSExH0qDMaWxtE0Da18Q1TvMSZqXYMOL5BTuEaQi11XbyR/XW1rbw1GSbyhZlJ3yKtKyncyr/AYFFxkVFcRQ6v5sWjcuMlv4+wu5dEEtYOQ6vDIph/1GR+7Q1YeJQ9Q07i+6zlOYC1iqCwymrJE6pum6WY9N4lgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czBAHeB0o/nCUvMlB1sFmG8JD3e0s1EFkb3nMQoEoDM=;
 b=i3/TbPVzK5cS2HmtNTFdA3+y2bATToCEcEgW/wJej48Ds2MyO9ACAj215cOOkOB6LciUgc7DDVTEHs/CR44+mWcpZg/DB7ygu/YV//PcSHnDMRS/oIgdkD9KcFhmA5ugE6Y5/G0OuYIKu34lxYrQEOtVaAa/jtvaG6qgUCA6n5qsf/i/DOLahwJ6VeBZ/5asMadeL66Wkh4tH7bVeu+1If0gYS8Sj524lmIHf3yQFIcsgfYKmnQryFxZvVHQLz+upBJw+ZtS9+PnKQETNtomPNpj7zfZx5RAhSRTGDqGqeVWWZoMhcLq9o3+0/jItMj788/+E+ifZKrCP/u1AN37qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by MW4PR11MB6888.namprd11.prod.outlook.com (2603:10b6:303:22d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Thu, 19 Sep
 2024 06:24:02 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 06:24:02 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
Subject: RE: [v2] drm/xe/pciid: Add new PCI id for ARL
Thread-Topic: [v2] drm/xe/pciid: Add new PCI id for ARL
Thread-Index: AQHbBQsAOKvPTvKSS0WXwelxXfuu4rJers2A
Date: Thu, 19 Sep 2024 06:24:02 +0000
Message-ID: <SJ1PR11MB62041207656BBBAE3B142A2B81632@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240912115906.2730577-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20240912115906.2730577-1-dnyaneshwar.bhadane@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|MW4PR11MB6888:EE_
x-ms-office365-filtering-correlation-id: 147db3a3-16aa-4b81-e622-08dcd873a7c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?sAN0mO3wNaDilsp7RHnGMctjFWnbLmdnLr02EB69UB7j+fSch8PefdlKtQIO?=
 =?us-ascii?Q?/qR9HCjhWHR6D9W8lH1DlLiXeI3wmh96JYqnY5yFf/aT1uvo6Th6RusjtU0g?=
 =?us-ascii?Q?3RCsYTp8C8mynOKYEyA9orpdNXLp4ZTRhbI2DrShPYFBRAi0W+Y7WyT2zgT7?=
 =?us-ascii?Q?R5zUKIfFc0pFjMrSjkLfz64lEEiFZh4r3Psrmu5fMqiZj/oyaxIVYfHkZvuy?=
 =?us-ascii?Q?J78yK9cBd4/QYrI3JjGO/aOpU8HawewLQEQ1Wp+DCP9v8rlR/HXc0CnPn71r?=
 =?us-ascii?Q?OW6fPskNINyS9ryr+kPlKKipqSMtufKgPaWZPC48SZL0hxtIKIwpT8rwcZcm?=
 =?us-ascii?Q?iH24ERJVrkSmKSgyaKu/5rgrIRQJeHGwjr8Bo4a6W9EZeE1rEUobdi8fUczf?=
 =?us-ascii?Q?Cz9SFg1HQLA8AvD8xNCpwIVRSIsddp8H1eXvkGNuHs1m3BNAw+U0Cv4JKLRc?=
 =?us-ascii?Q?ICSIAT+XrKJgzVqZvFypKpMfiPqgBaXC5n7U4OkTFo4bjT2eI1RLpsgepQpk?=
 =?us-ascii?Q?ER3Edfh1w+jsGEgIdKB+2XPuebJE1kM0fA76Lq+s3CaM/ZRVxERARKpB7p6w?=
 =?us-ascii?Q?imnXs8vr+hW1Ju6FYrxhO/xesT9Cibmqxa3DkFdYK2WD/haY3zZssjV0IOVw?=
 =?us-ascii?Q?7pYvjDvSqPzC4ymtArPY6LyLJ/f+5YNDNK7ULs5k+9E5kxyYEMdghl3n1ZID?=
 =?us-ascii?Q?GsRMK143pMAjwmChpibKDnKXIRksCTwdAebxPyi8GZxJ/xNDKNK8VqkKjvVy?=
 =?us-ascii?Q?YmMxJGHyIA8/2rC7O9Zen1bdbdxs3OAvPkdHV7QB7LuGCVz1jfQhj26oyKVn?=
 =?us-ascii?Q?2Y/oXOeORZbdA+0HTX6AJxM9WQLmCu7kh8v90hItEmRrnO6urz5ci9kg7P69?=
 =?us-ascii?Q?sestQ+lt2mxpG8vZ3wLGgYtHHH4xiTGhz05GygGLsmbV6LQzSclCufW+qgdf?=
 =?us-ascii?Q?tlmVDK5I6tOyrZQYrQf/FaqKYJdRBd9wjyqujXZBZZqe1NQUUEt7eJ36KtqA?=
 =?us-ascii?Q?F8Glr3wlBIneYS1gkgyx5mATtqP6giH6kX3zaSJ1bZR4A3qZPWirQFA40YTD?=
 =?us-ascii?Q?WEzjOINNZueMSkWl5yi+uNrhWLKy9VdBuFu4y0Epa3qOt+fQiconIfsc4zva?=
 =?us-ascii?Q?948mIzxQ7cS+Ez7ryjsF1StZZ8k7bIr/W4eNJiQJih0BJlkzZXnJ/VcRl+sp?=
 =?us-ascii?Q?lUTm14vCOLYQ262ojrHunR/RrStzT5QdsdwxeqqhLYl2ioEjnYaRq4J93iC6?=
 =?us-ascii?Q?UfT5zWheHaMHqq2BVzWCSkmKCccCySmoyu/70gg57xedOVA4YVp0HLA/a63/?=
 =?us-ascii?Q?NSVX9Vn3pZ0th4atbP3RoQ4Mie4CTiQTYvxzhBHphlDSPvhBHDzwz3UrPKzJ?=
 =?us-ascii?Q?XWmQP/AzNX8xXRDmwkTN1OV48KlNn66somfV2oV5NZuVwxAKQw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YeJI3kaX9wGMiVVOqMX5qfB4XyEShWo8MGHFz1UoVfI/FFBYtu+YpQqc6KCr?=
 =?us-ascii?Q?pyJl7cmyiauX7PFJiIYARGy4ZkQd/fLheb9QIHJf0tcnItbdbSK03C0LSlrM?=
 =?us-ascii?Q?k2snrSfubfGwICCEjrtDhpmkee2YyfyBytlfWCjOIkYYNZyxnArvmn3Owjak?=
 =?us-ascii?Q?b+ZBOR05JODoF1P5O3mELv8S64zJcd7Ett1q/7BmathemtZaZ/EJ1ukh7aVq?=
 =?us-ascii?Q?yB0ffIzJMWEUnGhl5i2kaLP8pKQFFdyxQhFMyej0r+gs1/PvhIDU+G59DFto?=
 =?us-ascii?Q?ihYozTqco0mGdsgM4LqiKoWvcqNaVF1or4o7A4Skay49nBk8NTNdt/HdocUW?=
 =?us-ascii?Q?FbyC8jhL41C0Ix/8VCGyRhrxzE6gG/q82rIKAf+Nt6F+oJW7FUJ9PXpqa+N4?=
 =?us-ascii?Q?WTOK4liqmLC/RjvvopG+4YaupVBi+ePuLtGF6kNDYpDMJVgs1rudGQ9qgr5r?=
 =?us-ascii?Q?/4VE8fpBkhAY8Mp3N2UPIIS3mpiwOG9R4S7SVhIQR/EZ1eXX/LKVjYk4KU1n?=
 =?us-ascii?Q?KkPXNk1F8noqC2ERKhQga8qTpONo0X4iC5dURCWn/Pg+M8cLmDa/arWAtOFF?=
 =?us-ascii?Q?vZs43nzG+dPDx1utT07KPs6ci9g/n7clOhVKef4BYMXHq2B7brQ4abSE81Hg?=
 =?us-ascii?Q?ecFFREvxm0gGPXxI6Q3SEonLY5+YGogd2INxDX1psL0wvgUUrRSRDf4h5Zse?=
 =?us-ascii?Q?sR4SIyUD4xr78bS74AB6R8hAN83oA1mleugRUKKQdVdakxtQT5chrLMcj9Jk?=
 =?us-ascii?Q?vaK3Iql58l30MQx5TIdE5xsaOu81Y5bpy6jOe+LwLvEN2DlF/kQIrBC9F5q5?=
 =?us-ascii?Q?PUsD8gITOiMbqdQoXCP6wx9kIIRtP0B4UMo32+9bhjW0VbC8JrFR5ZYMHaQs?=
 =?us-ascii?Q?QEKHzcWX7mv9ni0Qel6S+WwX44WzGpfmRpXzKPTUreFV7hnHE0ozO15+hcnp?=
 =?us-ascii?Q?KU4crY2ysUBQlRdzzPsey+3zAZ/d3piGCTdTXwyhsI0GpZbU1+yaNAv0YF7Y?=
 =?us-ascii?Q?5TxUmKeGwo5ZrEVe7tSTk27QkyMJNxz+aMJyizdBKwntzffGXr3B4kwwVint?=
 =?us-ascii?Q?Xf04L7HWnC+4E5nNgmNnWBHvqSSDtbTcpAmX6yAMJh3+camO70UDrCoi9w8s?=
 =?us-ascii?Q?RMlEsbdT4sJHo1o2vxKTtNKZSbhhECz38sKLxv1VtS0jr3mCn64gOy0rWIJc?=
 =?us-ascii?Q?PdHLJivLc8hmPR3eJwT9SIRW3qIyKc6bajlIom4o419wyJKzDXqvrZ4uNZi0?=
 =?us-ascii?Q?bM0qFvdy4mPlPdYdXGVDL12kcAag1wfxcGJ0NbjlA5hohRRCrukRN16bSyH0?=
 =?us-ascii?Q?+Gw8l+4EGDik8XEqgUMsis4HeAKGJPw+8qxrmSmU1x8OnGa/aTi/P6y7R2Vr?=
 =?us-ascii?Q?2Vw6jZ1+Fha2WKUV6Vn0haWvpLwiVACpy9sHbUgQMJmQ+YUizPt7hpYCaRiD?=
 =?us-ascii?Q?BVs3DQA820a1BhG8BnueO0yfSY1Z8Octpzfkqsw5CmMSNQ/lRJYVHwsIpxoa?=
 =?us-ascii?Q?6ZRoZYq8d4S1KlY8OtMoC9bDz6tNtlzOd3iCr9ZAbDoiWfCUadCEbNVq2ToJ?=
 =?us-ascii?Q?4wW4IJYMdzMGtjb3tClL1Py7KwJV9cE7f9a67dRR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 147db3a3-16aa-4b81-e622-08dcd873a7c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2024 06:24:02.6913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H+OhqbPhC/yveiA/ot7ZOEk9GcDoM+ZzIqOdKKfdfMwGu+94MUR1lR5cRm6UoXLbG/8HHedtrCiR0U6BCY5I76eY9eU3N/IC9nxgDsBrc8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6888
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Dnyaneshwar Bhadane
> Sent: Thursday, September 12, 2024 5:29 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Bhadane, Dnyaneshwar <dnyaneshwar.bhadane@intel.com>
> Subject: [v2] drm/xe/pciid: Add new PCI id for ARL
>=20
> Add new PCI id for ARL platform.
>=20
> v2: Fix typo in PCI id (SaiTeja)
>=20
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>  include/drm/intel/xe_pciids.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.=
h
> index 79001afa7d27d..b733555258b13 100644
> --- a/include/drm/intel/xe_pciids.h
> +++ b/include/drm/intel/xe_pciids.h
> @@ -181,7 +181,8 @@
>  	MACRO__(0x7D41, ## __VA_ARGS__),	\
>  	MACRO__(0x7D51, ## __VA_ARGS__),        \
>  	MACRO__(0x7D67, ## __VA_ARGS__),	\
> -	MACRO__(0x7DD1, ## __VA_ARGS__)
> +	MACRO__(0x7DD1, ## __VA_ARGS__),	\
> +	MACRO__(0xB640, ## __VA_ARGS__)

Pciiids matches the doc,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>=20
>  /* MTL */
>  #define XE_MTL_IDS(MACRO__, ...)		\
> --
> 2.34.1

