Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D391AC4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 15:40:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6EC11277F;
	Fri,  3 May 2024 15:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZXZQE8ls";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB8D11277F
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 15:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714750804; x=1746286804;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bHT0p4mMjv7DOPcHzIG1TtqBcAbfRdr6uRU89x41Xtw=;
 b=ZXZQE8lsYFiEe1jT1N7TDkaXdoxTHlVsLD71TLZZGDxBPYsBNd0cSEVk
 sWk2agDrbqMYNlcMUJaKmaRt1RWmHlGv1i9ArdCPsuK5pTo7Ubwuv4Fjw
 TWcy4rxK/D9lrPO6GAOFOuTZzlTk+RRVLjgiJwZ5Nm/cL308Re7VY4lZo
 DcI+bR29ZaJcrfm64302Om2qzD7BXKV5JJLX1u9sadGBW9/W0s4L6ZeZy
 YPSfAyL1k1zlnuPqc540ZfBuSILx9WBCD1NFMmdi10nLiqLAFDGngGec+
 bjRy0aR9klLyGmtz4xk4DvwL2UenLAfrgDN7RREfGH8hb+xpiY39kzLpr g==;
X-CSE-ConnectionGUID: D/sQrdn+T5yXr7eoqPC5NQ==
X-CSE-MsgGUID: sNGjWA5+T22n2Bha7s430A==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21972842"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="21972842"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 08:40:03 -0700
X-CSE-ConnectionGUID: p7z325mGQuCVCjYpHizktQ==
X-CSE-MsgGUID: yLzo9O9SSFeSOHE+NW1xEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="28071688"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 08:40:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 08:40:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 08:40:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 08:40:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 08:40:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJsNRe/TBO7UlNWsHj9n5VET/koD/Grq2eyxNHH/7BZ8I9+Ao5itbT7NbTsF+c8Gnrxoepc3FUeoppX4pgwN53tWt14/TYYFScitom52w/C9D/rWBO7Q40RPJGTJkioGT941jzjVou361BHTm4CLdPZdNnyl0Hm/GIxHKdKQvfUrg5hjazRYgaWIyf24/rh1UBGK/nMh3/X4WQKbwcJo1nl5U7fFG4Gjy3Tbc+H4WXiDojjA5xYWYT6cbxgSTS3oUUSxR3ZIziCyI5s8Py34YgK2cPrLi04P/FKh7zJil2JfNuUCu1JjDeerF0/sQt6KpS5Nk205ErUXHIzYiOx7Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13IMbFbY8kKowl9goknCbBPb9PlfEECnRgR8bkROuDo=;
 b=Hg2N1065vGU/0dPw/U9WuMUTHg4zC8IHcDcDukKBUHjP2dtbD8BtEQTwpZkm/bPW3rHM/1LAeHMiaLk5gLtJl147Hb4KnMNjpMh4EzcGChvN1myhWKn1NxnSv5+m9lH2ymC33bituerV1UNFPMUdd3lvwVl1EP2JuBqzMwkpelJRYks1fMbeJQUThSjvKcOpJrNAAtJRGjYfpLtvI53LeIXq3P4m4E/Xs9K4EVtDC53Lc+sbvgZhIWw3A7CoWF0+PthczxulRcELkEk9mmU1xpPMxvzZV4gbLKkOXJm/GecJxs/OejXLilyhBPGupGVuBhiV1bRIKHIVkiuA1wu37w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by IA0PR11MB7380.namprd11.prod.outlook.com (2603:10b6:208:430::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Fri, 3 May
 2024 15:39:56 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7519.021; Fri, 3 May 2024
 15:39:56 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Das, Nirmoy" <nirmoy.das@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>
Subject: RE: [PATCH v6 5/5] drm/xe: Refactor default device atomic settings
Thread-Topic: [PATCH v6 5/5] drm/xe: Refactor default device atomic settings
Thread-Index: AQHamx0r/PJ+fkeWPk6os7FjzfsMILGFoiBg
Date: Fri, 3 May 2024 15:39:55 +0000
Message-ID: <SA1PR11MB6991BF7C2848F2FEE0D0F0CE921F2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240430162529.21588-1-nirmoy.das@intel.com>
 <20240430162529.21588-6-nirmoy.das@intel.com>
In-Reply-To: <20240430162529.21588-6-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|IA0PR11MB7380:EE_
x-ms-office365-filtering-correlation-id: 7717e2ef-32fd-4548-8005-08dc6b874872
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?lnxWHosW24WnjcT0r0zEhptlR2R8fjf8w9pO/AwD3HLjuFD42naqSwPXWu5y?=
 =?us-ascii?Q?yyFHwf4Yxn0HJj2wwcz64gfeAfnAq8wSEl0jAFIsDaSXEcrpeFevMx2LMHvf?=
 =?us-ascii?Q?yt8lkp+JNJ5JZcDb/vnewWpa3NmReSS0UfdEBAhdkC826K3MI/CtXYlCznBr?=
 =?us-ascii?Q?qKqrqnTb9avMh4ZQ/a3vAGIyiUy6iqsfU9RbODtyiHaozs+w3e1UP3ygjAxj?=
 =?us-ascii?Q?JGxx4w0tbF/XBtRVlo5AMYRakwF2sQ1qHGSnqPGHLsuV0QpA2/KHjosMYwDE?=
 =?us-ascii?Q?hzNYPBTeQ7gUaJF6e47G46yWNl5EjMpJf+ZOeiG7sAGwNap0VhY+38AjdFmP?=
 =?us-ascii?Q?0FmNUTlvXh/bL6gNLa2M+1PVAew8vuKRD1aC+xyWC8vmjoYVZkKNSThEOMrB?=
 =?us-ascii?Q?3JHKYe3oucjORyUG/Xz7Du5e0OEAb12o+jGbXJMaundD6c4cut3FxHXSISXW?=
 =?us-ascii?Q?Ww10LlCUC92zYmpakl5DocSPG7KBpdlHnbVkk8zRM8H4bI4c5/uVP3PL5j7o?=
 =?us-ascii?Q?e6lMesKGDPgz/SYqrNZAE7QVNVvrSVO/5ZoczDvQ+VLHYXXWUgPUXiLwebdF?=
 =?us-ascii?Q?PRinwU1jhP2bcfdd8hiRIWdKcP9n/QOADnilZJe6pnWoRkic/nSuWgALIwOx?=
 =?us-ascii?Q?Ch5z0IXsCACfXN+5P+7z0tn4KcGhJDjyWsWSWUrl6xBXygjJrDeOt1BXzvEu?=
 =?us-ascii?Q?mVPpm4ukUWEw0q0CegHGBQI2zJuhyKbFPVioxNvaxmX6PjDqkQmgV/1WvT3p?=
 =?us-ascii?Q?g9DNM4PdOM0Dmk0jIdP+klID2et1E1FLc/CtHonABCX+Zvuwa7oPxcmIHcfP?=
 =?us-ascii?Q?ADGlU03+2vI4MIoRCmvr3kgDVVWzKXF9kdtDDRr8cq1OMUFsD0rinOMHavqR?=
 =?us-ascii?Q?n8S6a43rBm2YGOuOhU4Q70KekgubsxWAFqXrO1yQxwcS00xf6a/HNdgQ5ABC?=
 =?us-ascii?Q?jP9FoF/Avyw+ZO3YgWwJTvmOQVWwbF8iy24h3JFbhOs84JaDILlm0ZdAOw31?=
 =?us-ascii?Q?RM+YaGVwuc0OMwOxu2Jt7rhcZgiLI9tP02kCOw8e0M87DQKJ3Woq3cCkxqe2?=
 =?us-ascii?Q?cTsx6NRaBFnEdqJ6JWGlwPkrnOUBCfrSylR0egYsVfDz/bD13K6E51+trMvo?=
 =?us-ascii?Q?xFY96iCwiZvIr+60IBQEW9/2idlhvQxumlJrcVMJRhqIiFYh6Rve55D+FYuq?=
 =?us-ascii?Q?HzN6JULKpt+U8pT4tAK9qjO+UPZMEcTYg4Q7L3hKNW/Tadzy2FX5vU5JGrle?=
 =?us-ascii?Q?Yh49M+zLSDnWZR+Ph0kacJs5+YOmsppg5uQvaydIDqmxAk1Qzi0Z03a6J+LH?=
 =?us-ascii?Q?Cn65Q9RwC6RW91iTjgYBCNzgOyOOFLKAnWmIXQT48dg/KA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rz+z38xIVwTX1b+EMXDCHSsghACAH29hOlyaFOanhaskm5Bcp9xXMP4W0kbP?=
 =?us-ascii?Q?Jrqxrn46jsJUBFyiOvYrRwWFsq45qH5bau6pkyUy+DQvTeWG9usiyXi7/Nt4?=
 =?us-ascii?Q?MuwlUEXacoXYvXOmJVH3k90eKWViFH8h6tx3IOAIivRE5NzRuBnEreIU0LIU?=
 =?us-ascii?Q?kfgpr28i7xv94vaJ6/TdKXN2dcbwWh+I3ncJZHWffZVKetlxNWCjkKISLKbo?=
 =?us-ascii?Q?Z++WoNKet6qdxD2aAXxPrhndhZMeMxCqDfw17jk+HhjAtj7jk2PFa1eu4xfT?=
 =?us-ascii?Q?eTCnxf3aDuwo8SbESn/ZlmOyKSk+Lq3IUZPhnAiaqUY0sU2QOzWr1grcxGgO?=
 =?us-ascii?Q?R9bAtVHtysb4+gOnX7ADO6m0tvF77G0POSQlxH0bsauw3OT0iHsMZWRLy/E6?=
 =?us-ascii?Q?7+kgH8+rIufaBVAXTN35+JQh45MgW2Lnggr/+loi2wNbYKM6EFIyWesscn/w?=
 =?us-ascii?Q?MLrMx+TovejEnLm3fa4u1pV6ePg4SYzaaSQrSOeMngg78sxwfvmx5dy1luh5?=
 =?us-ascii?Q?szgGqhdBOXdzEfw71wzczg91sCyP7iEyjulSIMbeh1CHf4uPnfmZIV2BL3eB?=
 =?us-ascii?Q?nRHO/5nEeHk6auipuoRMBZ0GHXe9FrifM2eHx0/tfCf3jYZisrPsnRTmBdaA?=
 =?us-ascii?Q?S5HM2MX5GUhSGkiw0ixNtllyAyhDITkZqRkogXE3aSAGjJW0eQMwQtAA21Lq?=
 =?us-ascii?Q?76tDm57TwD3DldkBkKvVRWYemJeaATsQX+WjGTN23DkD4I+RkXQwiKTpwwx3?=
 =?us-ascii?Q?oEViKsOIolpAiHLwaQxQEgO1BFstVZr7zztYfZkyrL9mBmzetzYwCSCpgvp5?=
 =?us-ascii?Q?zA5WPUPi96VdkL0Pr86I+tb67xbuMfrbXeVMIc19noZ9Eebklsh5HZQoaH3D?=
 =?us-ascii?Q?tSGcF3QUFZSgegqhNjvPDtnpd2gEIOHoInyZgvhvW1lpYXX5GMDdM4rUHC6h?=
 =?us-ascii?Q?JSn5JUkbjCSK7ExyZrV3wwV0iUXUp7CQ3KWlvrSgXbNrBqzEiRo1Yrxm2xVe?=
 =?us-ascii?Q?Bg+jsvBFUbfzGt1q4CInf78/de1gn7bfa1WLkE1hj11mNlw4AhhlEiYLjncW?=
 =?us-ascii?Q?dzyr+AEvbBLPXddMMy3LQoVFRzAHFuNtwr1XEpqEaAGgNEKen2Yo7RKCgwgD?=
 =?us-ascii?Q?apqpuf9eKKqn0/tah1d+7QQo/hFeZ+idX7KThGu2Gg8cQkF/532cEECVX4Pm?=
 =?us-ascii?Q?pK4JwzZVL7Snzl/UFvnD1DIqfXsEVT0/ApzX5cDhcjhMAwomklzENgv3M8Hq?=
 =?us-ascii?Q?QZBm/mRz7q6v1lQlnn+Dms+MYtzQHz+Gff0YbuXAOdQ/RBToPXCezuDJ9we9?=
 =?us-ascii?Q?BoKyMvKMLPWgIHAAEb5HEpHWY0utIvo/KKRNgrfvk8MtbAKVO7aVgVP8j1DH?=
 =?us-ascii?Q?DalPNNbDZfFleeJY9sSYzo8UhxOLX65L69uopF2djx2mLXmDiEWrsP97yhXL?=
 =?us-ascii?Q?jTUtNB0aDW/2fzjFpZhqlUAWS5EBCAJLQ4Dcl/gxrTn8pZUwK2Ucca1hEQVV?=
 =?us-ascii?Q?a6gGpyHeKFzXV7IcGGFZKY4KN3PxaikSpQ+383vdgXZtmWCC69JQLPp2YBEE?=
 =?us-ascii?Q?rNpRCP7EdZmpyV2C2oQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7717e2ef-32fd-4548-8005-08dc6b874872
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 15:39:55.9874 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CWIcyntkH1O4CIYlcbvS9uB3aLv10d+3xNlivw6grwK1mJdUJUHWiZ5VF4rqOWJ2zw91mhrcFSfiniyWAyRDQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7380
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

Hi, Nirmoy,

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Nirmoy Das
> Sent: Tuesday, April 30, 2024 12:25 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Das, Nirmoy <nirmoy.das@intel.com>; Mrozek, Michal
> <michal.mrozek@intel.com>
> Subject: [PATCH v6 5/5] drm/xe: Refactor default device atomic settings
>=20
> The default behavior of device atomics depends on the
> VM type and buffer allocation types. Device atomics are
> expected to function with all types of allocations for
> traditional applications/APIs. Additionally, in compute/SVM
> API scenarios with fault mode or LR mode VMs, device atomics
> must work with single-region allocations. In all other cases
> device atomics should be disabled by default also on platforms
> where we know device atomics doesn't on work on particular
> allocations types.
>=20
> v3: fault mode requires LR mode so only check for LR mode
>     to determine compute API(Jose).
>     Handle SMEM+LMEM BO's migration to LMEM where device
>     atomics is expected to work. (Brian).
> v2: Fix platform checks to correct atomics behaviour on PVC.
>=20
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Acked-by: Michal Mrozek <michal.mrozek@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 37
> ++++++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_vm.c |  2 +-
>  2 files changed, 35 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 8d3765d3351e..87975e45622a 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -619,9 +619,40 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma
> *vma,
>  	struct xe_pt *pt =3D xe_vma_vm(vma)->pt_root[tile->id];
>  	int ret;
>=20
> -	if ((vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
> -	    (is_devmem || !IS_DGFX(xe)))
> -		xe_walk.default_pte |=3D XE_USM_PPGTT_PTE_AE;

I think below logic can be moved to a separate function? I am also good if =
you leave it as below. But I think a separate function is better


> +	/**
> +	 * Default atomic expectations for different allocation scenarios are
> as follows:
> +	 *
> +	 * 1. Traditional API: When the VM is not in LR mode:
> +	 *    - Device atomics are expected to function with all allocations.
> +	 *
> +	 * 2. Compute/SVM API: When the VM is in LR mode:
> +	 *    - Device atomics are the default behavior when the bo is placed
> in a single region.
> +	 *    - In all other cases device atomics will be disabled with AE=3D0 =
until
> an application
> +	 *      request differently using a ioctl like madvise.
> +	 */
> +	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
> +		if (xe_vm_in_lr_mode(xe_vma_vm(vma))) {
> +			if (bo && xe_bo_has_single_placement(bo))
> +				xe_walk.default_pte |=3D
> XE_USM_PPGTT_PTE_AE;
> +			/**
> +			 * If a SMEM+LMEM allocation is backed by SMEM, a
> device
> +			 * atomics will cause a gpu page fault and which then
> +			 * gets migrated to LMEM, bind such allocations with
> +			 * device atomics enabled.
> +			 */
> +			else if (is_devmem
> && !xe_bo_has_single_placement(bo))


Note bo could be NULL here...

So userptr and system allocator don't have a bo

Userptr can't run into this case because userptr can't be is_devmem

System allocator allocated memory can have devmem backing store... so seems=
 the logic can be:

(Is_devmem && ((bo && !single_placement) || !bo)

But we don't have system allocator for now, so your logic should work for t=
he current code. If you write as above, then it is future proofed. I am oka=
y with your current writing also - I just need to change it a little when s=
ystem allocator come into picture....=20

I do feel the logic here is getting complicated, hard for understanding and=
 maintenance. Let's follow up the other email thread to see whether we can =
simply default all allocation to be NO_ATOMIC, and depends on compiler and =
UMD to set atomics up.

As of now, Patch is:

Reviewed-by: Oak Zeng <oak.zeng@intel.com>

> +				xe_walk.default_pte |=3D
> XE_USM_PPGTT_PTE_AE;
> +		} else {
> +			xe_walk.default_pte |=3D XE_USM_PPGTT_PTE_AE;
> +		}
> +
> +		/**
> +		 * Unset AE if the platform(PVC) doesn't support it on an
> +		 * allocation
> +		 */
> +		if (!xe->info.has_device_atomics_on_smem && !is_devmem)
> +			xe_walk.default_pte &=3D ~XE_USM_PPGTT_PTE_AE;
> +	}
>=20
>  	if (is_devmem) {
>  		xe_walk.default_pte |=3D XE_PPGTT_PTE_DM;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index f1357e2a3b10..d17192c8b7de 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -888,7 +888,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm
> *vm,
>  	for_each_tile(tile, vm->xe, id)
>  		vma->tile_mask |=3D 0x1 << id;
>=20
> -	if (GRAPHICS_VER(vm->xe) >=3D 20 || vm->xe->info.platform =3D=3D
> XE_PVC)
> +	if (vm->xe->info.has_atomic_enable_pte_bit)
>  		vma->gpuva.flags |=3D XE_VMA_ATOMIC_PTE_BIT;
>=20
>  	vma->pat_index =3D pat_index;
> --
> 2.42.0

