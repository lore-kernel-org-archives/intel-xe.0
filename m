Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58506D3A697
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 20:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A0210E046;
	Tue, 29 Oct 2024 20:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JDEBWd0J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D169010E046
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 20:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730232704; x=1761768704;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7BVQYJr7Ch2ZjinRdmjAZqYDf7J+LwcJktMMQkXT2aA=;
 b=JDEBWd0JDdf12eL4GqebRqWO9CVg29KrSazVAVn/GC4Rh6pNTgWtr8Ip
 MDW3maruWrHpCOU5bYr04Oq8yBasTJoLanlyMiP8kqSDNnvCsNTpjq2Xc
 NtDD1qEw4ZVNRAx+B6HLD125CZNiSGPAQr2rVOiNCP74jvjmZCLbhfgHQ
 KhnMtHec1Ywmt8Iiinz9HMv2kPRsgQc5X9D1lP0ExIqxJOzVXRwUyOxfl
 Hhd814qbS+0DpnqMx1Ap9t66nAzViPZwTb68Z02pEaN0u60iaD4ecZajI
 sb7mBQhBc8DN+sqwH2sgPLsgRR9b6Bi2p8EqlEkpE0M0SjJua+SjSxjsK A==;
X-CSE-ConnectionGUID: /OvytLOOSMyuRtRasSi9bQ==
X-CSE-MsgGUID: hEJbS5kZSaSZbRF9EJC6CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="30112318"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="30112318"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 13:11:44 -0700
X-CSE-ConnectionGUID: S8iIkQ3ATKCzCLVrUy7oIw==
X-CSE-MsgGUID: /qNIFc2WRhqkoTSee+0r/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="112882780"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Oct 2024 13:11:39 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 13:11:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 13:11:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 13:11:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MGsfXuUnNCMgvyvkGZ8cmgflev691J0lRzim1SNfguEWTkwNWs8CtmQpCx/jk05uDx2xTAvt4rYBvujERINXhhnIAByxpGcNC77gMO1urRUVmfjClM7vTYQZ4J7bysIM2u6RP5R31w3W6gNgNGRzTtUsBIWH2t1v4VWcAkEku6yj7UfEfCiYeygrc9+LYf3Qjc7StSIZFoqeR7buzPXWoOf4sOPFZm5xI/40z7uvZnVGNeR9LLVkbf+5vx0ib4D2cZvqNBkkoos2uSIqciRip3so7opEo4lRcVMkezoQlcqDFxc+PBFT+oQDgBlwG/b9m56x3nFKUAcao1dqE7keWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kWoURjcZcMgWsv/SUIM2nZvANAB3byox3hKSZSNwRLg=;
 b=ZBK1XlB3tKN8wLm0dYcAd/vHuBm9mJK5d6z8eGxea2h2ciiQTXKWhGYbyqz22y84VcNSvePLKsc6j7bPTEodDWZb1zJLuFkqlD7VYZH98kEhQDLQZdQt/OFPQikPql0kZIwpQqEUa6niLt0EaxBUqS+Oj4jGf1LgWVhBsu4lTOUmxS8eDRhPXUZQqgWP6dX511zl25Be8fX7Ma0C7qwxMmZ/gocTe/YtIV1lfE1AQQtHcRGol58TgVMVER1nTAvT1Vd0iOcAwenKbHvJZSNuAt4bIPKi2ZMqT5j4nZ2lYrYE7Dcw/8GWqfJVrIY5xSBT4QB+VdnxaQ2IPz32bG+A/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA3PR11MB8004.namprd11.prod.outlook.com (2603:10b6:806:2f8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 20:11:34 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8093.027; Tue, 29 Oct 2024
 20:11:34 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] Revert "drm/xe/xe_guc_ads: save/restore OA registers and
 allowlist regs"
Thread-Topic: [PATCH] Revert "drm/xe/xe_guc_ads: save/restore OA registers and
 allowlist regs"
Thread-Index: AQHbKj2ESnixM5i1IEm6SApk+UtVSLKeKOHg
Date: Tue, 29 Oct 2024 20:11:34 +0000
Message-ID: <CH0PR11MB5444C31FF869F6E8E9F6D712E54B2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241029200147.1476513-1-ashutosh.dixit@intel.com>
In-Reply-To: <20241029200147.1476513-1-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA3PR11MB8004:EE_
x-ms-office365-filtering-correlation-id: 1aac7d09-a4a4-4532-6ae6-08dcf855e304
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?30uKanDg4eg305q7MPCSXIqjoxlc66XQm2IbEr7xY88Ln6UFiO7daUaPN7iH?=
 =?us-ascii?Q?oxAeo5TV7v0g8JKn9/EFV8KKDh/Lmfw4NHFuYdtDwIcwBwJf9RVH/9J1VumZ?=
 =?us-ascii?Q?rhCzUfuurUuU1HYe+IazRPHkV0mF3uMNeDuNRrwWgnpd10YxM8xgRm/m8CEk?=
 =?us-ascii?Q?BQ9Vrxl6dp4S2Y+NIid40jabbcO2tCfEqMQU+O25KBa5Cq2UV/+ZNbWVBmYU?=
 =?us-ascii?Q?5mpW4z/6jpI9Jl7nwCk869zjn/m14oTkjX4w8CvgKQcNLbDLLalYX+Zne8jk?=
 =?us-ascii?Q?Mh4n1AqPsVfr7UQXzVV6yDlkby0n0bvfsxC3pcJsuqn3A8f5+h1ZQajj6htd?=
 =?us-ascii?Q?bmbvd1ngiYt044mUZmPC7LqRoQpTclbU6wPMV+RDKwGMg8W3My86wNb58/z+?=
 =?us-ascii?Q?9QjAAUECbu/YNLAmBoq40BksLiMebTtPhAMFRm+tHpKatfj1Zt4H1CYoE1m3?=
 =?us-ascii?Q?hnSFQVcTNc2lmfNg/N3+xTxTz6O0aYLIsYmlIe+Pukf5WSWQ2PQyW0Uou282?=
 =?us-ascii?Q?9yqYKgUO3sAt1fk0hO3oqZ0zoc+9vAFwjCkZ4+Sx23LLE90T4zrpHBSHdJp7?=
 =?us-ascii?Q?tGtDCTyScKdWQ7+E5K/RzDI/eSHfCp2dBSEKh924gK9/vxjrGRrVti8WHrz1?=
 =?us-ascii?Q?biBa2JcNlYIE+aVfp3PGrocBOy2obM6hX1RAm+jTV8uc6nQqiaIOQ/9keAY3?=
 =?us-ascii?Q?3/i6dG3hP7DtCDv+9kEyfnWrpquM3Gnzo4OB5IEGdKpxrYQFYEXlnw0d+p6O?=
 =?us-ascii?Q?Y0EaH/IzlYZUhcAksnoxmuoz1izDZegxg8ZJvzNBgMIu9sj90rQHFBvLUigk?=
 =?us-ascii?Q?KoT1Rd2a/vfNrXztD0VarxF/fedwCv+vEW5/Tm7aCfsKs9uVjora9lSWt0F6?=
 =?us-ascii?Q?DNWwCXsZ68VYrx9MAIMDD5DTKvUIyYjFyl05H96m5ZlVT49XvM5/tLoQsvKe?=
 =?us-ascii?Q?CKIMSewkSBKK4ZKKgyTg4oXIbJVv4sAA9iKW6uMH+DO6Y1bsoM+TXPk/aSfv?=
 =?us-ascii?Q?81hAXQUjAXQiW+w9YA9loXkcZAIQkbj881brJ89jYPfXp76xkJCaHY/YpLEH?=
 =?us-ascii?Q?B7FtVCLnEvAgMUmumY7jkdZ3xmz/wlVadv5JWJj9gYJP69XVX+rnLNA7ncZb?=
 =?us-ascii?Q?d8FRrtF7ILOtuiMM6m/8axZDWEfqXYX5Orv43uiU7t0ckkvFLNrF0wBeKJLj?=
 =?us-ascii?Q?leimcn3Te3Du+bogwBkP5TbmGfV+qbxT2WupeE1SYFWexjhrx7Dxa58HR68F?=
 =?us-ascii?Q?dxJzr6r6lf0HGX9ZWT6hLJI3zf/W9w18Mba2aPRDyp2ZPnRdfQbZRltcpfSL?=
 =?us-ascii?Q?2ODNr1qgiFCmmmyi7nbznsjF?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xMB7jxD80ivnwr9ll3c0XW+c4D8tMlOJjia1FzajG3ZCzZF9bdPQsXNn5rxZ?=
 =?us-ascii?Q?8EwZHS0DzsoraJmRQigE9LQILVBoEE9+KOSu7oQOTlZ3L0W7OPp1XPWZLFUr?=
 =?us-ascii?Q?szc57kPkAYpSDhNKj4RN+m3Skd5GFRXLALEVwEHeRfognMNcNqxRcqVE0FBX?=
 =?us-ascii?Q?p9W2Vxw7X+Uqh7CSj8E8CDQbyxkt8+TI72WUsuwlwbk87xbRP8M0plk57mgE?=
 =?us-ascii?Q?Hk3ANF772v6tMbNA61NteZMpHwm5xB9+7ijFm76hz0EJ7weUN6oRPDiZRX88?=
 =?us-ascii?Q?hGLoYhdmwtmfxGf9KwZuVaci2GkjqKsPDLS/GD/oZpbE8joYUcGalscheVXx?=
 =?us-ascii?Q?/oFL22k3EEeftDRaEP+i7QRxQZMFBk5DNvX1dis7EbDSqwy/XW6H2INwKCwN?=
 =?us-ascii?Q?6odYFL03QKgf/LSCmTAUvjfNBPi3czvErzMMSsgbxAfh/vDYL5ngFqZbtlUn?=
 =?us-ascii?Q?zNmAIJXUaYVMY3OGAmWIRcWgWltDojbL7znwFkq54ydpgvWACOR/lALKdgpr?=
 =?us-ascii?Q?PXqfS10AW3hFp2SIzy6FeoCXZlaG5fc1UGQSXTG1vKJkRD0n6vA6OCENL3HV?=
 =?us-ascii?Q?EVsKFTsCjqQWpeXcDOyi1fCFlVzbitf4TJ3VBd1gHofnLZ3KS8/TLiYQqszh?=
 =?us-ascii?Q?DmNnKKJHGkMYsEFTLceV4D2TSVYaPxGflGZZUiTzyGFiCRQyQR1vBzAs+I0x?=
 =?us-ascii?Q?gXr8Jh76rLwvtiGiH98EEdbmN5/NTahYh0zZ2i8EmpORJDHbnJna1PVqE6g0?=
 =?us-ascii?Q?lhxngihfQWfxwAGXbPBvSwVfhIf/3jrTPI1GkxqkXnCUtM4Gio6daG4fJRKG?=
 =?us-ascii?Q?viY32gK4tx/TqyvF/cJcXGhNRqNAAxjSD9jOKULbhBphXOzvAOEMnxmk3byQ?=
 =?us-ascii?Q?wOR6U6iY75bSlHUFJF3TDuLZJ7ZBa4Qkegjs5OswbbOSVYLPWO8tjz3Gd9qM?=
 =?us-ascii?Q?EqsoiTlDaRS5Xsy17wzcIf2d4+/GxgCgJxBl8Esnk6F0ng0IJbx/GDDa5IkA?=
 =?us-ascii?Q?wjGu4T/Lyru0V4Dduyw+oGJkbvQ/WkcI79NeWAy2Ynn30GkamtgJ9EPZYFb2?=
 =?us-ascii?Q?tG735ELFaynfe0OcTlwSQDbcHaqqLg88KTZJ6F3PiNPmV1KS5CTa7jR4PYeX?=
 =?us-ascii?Q?AnDs0twnyf0ryZURT7BMHZkYqHN6z/S9m8gGBZlZGmqnDjL0ejdRhcOoPDYy?=
 =?us-ascii?Q?ZZnT0KDPxPU6rw+m8iv8H0KuAHAK6WZwvSspiMZskLElfApKHyuFJDBjWLrv?=
 =?us-ascii?Q?GuI9ygrfdKHJUcLtDzEf04vzTW22DlMFv/kjvRCqPB101a1ta1/I3o+xn7Pf?=
 =?us-ascii?Q?0KAVfMUnCUSDkkWL8zc/GIgk254/17bLUZEDYYCylW+8jLXstw9sIYM6BB1f?=
 =?us-ascii?Q?gxzeKDvCKi+kpQMjxSRv0ueZJg+gABAN3jIP23A0DhC0ifGuEDGvfmluxeV2?=
 =?us-ascii?Q?E+RrX1lUaZ9lZ/MbMvqNNY9oG104m2x462j/B7yuEJ3/qg+Ni7p3DcYvsril?=
 =?us-ascii?Q?1xwvZD/QSiNonflU93euyuICEBME6JtTxNjjsSFbpqcp/g1+liVzEkYQocUB?=
 =?us-ascii?Q?bWv53DqbaPZ5BnPwH2+h1XTEh+BP0OHNVMob+mXw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aac7d09-a4a4-4532-6ae6-08dcf855e304
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 20:11:34.4305 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brZ9ikYTBuCNtU19F7Ni72eZEgPLYvifktAs0LwaFAMirdhL+lo+pyzwCZBLjNQ4fp8sB+nV+ZeEh3pE1vGlC3x8b68KrUoZFKrcYEtm7ro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8004
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
From: Dixit, Ashutosh <ashutosh.dixit@intel.com>=20
Sent: Tuesday, October 29, 2024 1:02 PM
To: intel-xe@lists.freedesktop.org
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Cavitt, Jonathan <jonathan=
.cavitt@intel.com>; Harrison, John C <john.c.harrison@intel.com>; Nerlige R=
amappa, Umesh <umesh.nerlige.ramappa@intel.com>; Roper, Matthew D <matthew.=
d.roper@intel.com>
Subject: [PATCH] Revert "drm/xe/xe_guc_ads: save/restore OA registers and a=
llowlist regs"
>=20
> This reverts commit 55858fa7eb2f163f7aa34339fd3399ba4ff564c6.
>=20
> '55858fa7eb2f ("drm/xe/xe_guc_ads: save/restore OA registers and allowlis=
t
> regs")' was not properly reviewed and also causes dmesg asserts in
> CI. Revert it.
>=20
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3295
> Fixes: 55858fa7eb2f ("drm/xe/xe_guc_ads: save/restore OA registers and al=
lowlist regs")
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_guc_ads.c | 14 --------------
>  1 file changed, 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_=
ads.c
> index a196c4fb90fc9..4e746ae98888f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -15,7 +15,6 @@
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_guc_regs.h"
> -#include "regs/xe_oa_regs.h"
>  #include "xe_bo.h"
>  #include "xe_gt.h"
>  #include "xe_gt_ccs_mode.h"
> @@ -741,11 +740,6 @@ static unsigned int guc_mmio_regset_write(struct xe_=
guc_ads *ads,
>  		guc_mmio_regset_write_one(ads, regset_map, e->reg, count++);
>  	}
> =20
> -	for (i =3D 0; i < RING_MAX_NONPRIV_SLOTS; i++)
> -		guc_mmio_regset_write_one(ads, regset_map,
> -					  RING_FORCE_TO_NONPRIV(hwe->mmio_base, i),
> -					  count++);
> -
>  	/* Wa_1607983814 */
>  	if (needs_wa_1607983814(xe) && hwe->class =3D=3D XE_ENGINE_CLASS_RENDER=
) {
>  		for (i =3D 0; i < LNCFCMOCS_REG_COUNT; i++) {
> @@ -754,14 +748,6 @@ static unsigned int guc_mmio_regset_write(struct xe_=
guc_ads *ads,
>  		}
>  	}
> =20
> -	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL0, count++);
> -	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL1, count++);
> -	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL2, count++);
> -	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL3, count++);
> -	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL4, count++);
> -	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL5, count++);
> -	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL6, count++);
> -
>  	return count;
>  }
> =20
> --=20
> 2.41.0
>=20
>=20
