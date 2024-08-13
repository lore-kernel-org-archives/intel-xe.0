Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6279C52D7C
	for <intel-xe@archiver.kernel.org>; Tue, 13 Aug 2024 11:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7607510E2FE;
	Tue, 13 Aug 2024 11:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CzVXpPQu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134F610E2FB
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Aug 2024 11:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723546895; x=1755082895;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d45QCtc5Mms9WVIcaY9PSjSSL3DcC4oFlwh67bDkVBc=;
 b=CzVXpPQuB0PVRCy4X6xsrxKeBNzKD9g2rQcGPEcVuxWYE5JCQkF8DbJT
 mkwQa91SPmyByybnxuZjS1pT6kGd7iCIWRYfcVL+mJ40cgrb6FA1PoEII
 9Yk1atXLUMP/+B9R5O4urb7sISPPn+MdpzNi2tF+DOocXKsBdwKm57TUh
 sJdxxVLSlQVO83Vaz5GNt3OVTBJ5+gdELj/WQMbjT4xqHmyJoIeQJXWZX
 fi15yQkon/ba6MkOSzWa4QpSE8NyoITyq6l5pQaxsUd0eEcqEQBRQLg0u
 dBjXf6x6jLgW3AtXQ76EvgiuLf4YLFohi35LUwm6y/q0HJ8qMO4O5KUg1 A==;
X-CSE-ConnectionGUID: N44WBhZcRym1OPaze9H6BA==
X-CSE-MsgGUID: g9TI24VDRj+f8vsZhOGE+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="25492514"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="25492514"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 04:01:32 -0700
X-CSE-ConnectionGUID: Pu/JPvvUQ2isYS1yIYYmng==
X-CSE-MsgGUID: ch/TAN74SpWkIr2dOCIFjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="63314723"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Aug 2024 04:01:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 04:01:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 04:01:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 04:01:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XaD9Dytr2hN83+Y+S0BlxOZC4EVR1YCB2XAmUuwhUXmAhHPgKM3m03e8f9boo4rMUvmRVZ2xnYt8QGC/vtyF6ljPrf6qyLamNKtoSK/GYeqQzz8LoAhVMp5Uh4fZX+hf1IGcj2GwRhbcgZKAW/G2oBLWhaZccoqcgKDE4OpCIsgDa4y+0PWbBdMKJ+oY5TD9Mesa4QIS/Yq+ER5CuCCaHgtDUYaV6r/3BgFxwR07VjWQiMA9+HGANaukj1EgBmiRoULp2qaMMcGDv6EvRDI4qPuK1O1OJCAfdbbtx6wP0BOr9vz/Qn74U4WSZOHa3R/z1ClCUiba3vXF5+lDH5lxZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPpFc03BqVPVV5sVwPCwW6f2k+FrfTgykmp7zLhR9do=;
 b=Fuj3w4Tz4olcu7K9qwAywlkPcs2vMB253F8HMLKMz6te/Y/L54j32ppPpMhv9jDqe5Jwua6SwNIgP2w1UZXb3f0Ij6BTM/7JFINefAF8vVBf3nOZORjzzwDWSrr0FrrZy2TlrMDobVG+J1P6sb/HE6GKd+mI70qwNF9EGteSwvCw3aPGMrTm6rlcAel1z8n6lhS/5qnXHCP7slmPmY1EJdDBLZabJrQCQ+n/t2dA9agfeQz1Niq4sF5LpqRrciZ7nW1B9tQSsZ562YO2yD4+ix4M3rpTgvzGdyEfOJC112EQcRVZJ9r3e9u9SSWRNBJXsgIIm5ylrvDvRHSI362BAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6208.namprd11.prod.outlook.com (2603:10b6:208:3c4::12)
 by CY5PR11MB6463.namprd11.prod.outlook.com (2603:10b6:930:31::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Tue, 13 Aug
 2024 11:01:27 +0000
Received: from MN0PR11MB6208.namprd11.prod.outlook.com
 ([fe80::7a1b:645a:6e80:3ef5]) by MN0PR11MB6208.namprd11.prod.outlook.com
 ([fe80::7a1b:645a:6e80:3ef5%4]) with mapi id 15.20.7828.023; Tue, 13 Aug 2024
 11:01:27 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH] drm/xe: Remove unused xe parameter
Thread-Topic: [PATCH] drm/xe: Remove unused xe parameter
Thread-Index: AQHa7WtTWQ7Fo4lN0UeaCgBso6TVkLIlBQsg
Date: Tue, 13 Aug 2024 11:01:27 +0000
Message-ID: <MN0PR11MB62086DACC94984869D4DEB8281862@MN0PR11MB6208.namprd11.prod.outlook.com>
References: <20240813104419.2958046-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240813104419.2958046-1-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6208:EE_|CY5PR11MB6463:EE_
x-ms-office365-filtering-correlation-id: 36fbdde4-1228-4130-858e-08dcbb874761
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?HLqOsKURgkl0/KWQfqCU3PK9vEKoxti7u4L4eoeRNXm3x/XU5yDieYnmUnI3?=
 =?us-ascii?Q?yFsP5T60urPYHQdrfq8RF65BkqP85GDlZbIoFkI4FjOobjr646AZeLvJ19Rk?=
 =?us-ascii?Q?vydfv1Q3oKQgr0VFksojzwGa6kJ/uHQITajH2kem5FhVgfvuka/OqPfcLai4?=
 =?us-ascii?Q?eP+B9UDpgnIZb5T6ONsKxkLm/Zqx0rKEac+4l8OHArr7HuMejhH7Q6jdHJHq?=
 =?us-ascii?Q?GsFLokUu3WdrQyz+bMDU4lqDf5qXlKaTEbE/8K3uPfDsnr3S7EhM+nQDQ75P?=
 =?us-ascii?Q?AObEdEBwje2vEpSVEkICid1CrIUOrCUirF95lKupAyiTJcDirDdDK0QAskDH?=
 =?us-ascii?Q?TcvVeoThJgH4kfiZUR4BewIOJ5Gt0grU1J2UcddCY0TEBOxpct+HlZNHmOcz?=
 =?us-ascii?Q?tHbp7P6F4JgJnTGLwHxre+Ozeun2r9I5wK/GxVwqFUPFwGN5l6Z9+kPE361k?=
 =?us-ascii?Q?yWMupshmHlKWSmlI2hAz760lzLvKiNg9Yqdhnn9KJzyYRyWO45Y1O9rMm1Uy?=
 =?us-ascii?Q?aahyqxchdYMn6JHaGjl1Hw6K8gdP6tQ6TbZqeDiQuxBHFKiw7I/YxK36EH5z?=
 =?us-ascii?Q?2y97wdEcxAykrKDoBVjWV9s7LAFsTaRietS95JrWAFZrQ3MmjLoWYFcc+FnJ?=
 =?us-ascii?Q?BmPMS0Sfd1pPlqJu8U88igUtMWqMCkv24QMuyfbDiRvRj4NrkJCS/fqCyyck?=
 =?us-ascii?Q?ecj3K0o7jHEKT71B7wsEMpoYuhzS6QODb8QcXVqGxc0H7VaSye/Lqev+QEIT?=
 =?us-ascii?Q?MmXS/XxDG98enaRFPCrskjg3SD5TlUaOAce2KomgJnCZ0H6RbKl+rLfXN7bb?=
 =?us-ascii?Q?Qk3y+M9+Ay1ZrzlXq8m3IwOQcA7G9smAlXBMYKFdSt4Zh4d7LlG0LdeXw0kB?=
 =?us-ascii?Q?Vgq+HBIDCKIj52fhQip9lZ19K0iG9WNgfX+hi/bc9fqEIsMTdiDawrDQKElm?=
 =?us-ascii?Q?0HWyaXBG8f5MvXsIHAlBqmbfT7NyYUCl1ipmyI0T/IRDxGmTch3HDuR2I54R?=
 =?us-ascii?Q?xTUay43OmZulmb85wjxmyt0b8UT86l/gEMwrDXV6Xcm1zji2axf4t+Xm1G4M?=
 =?us-ascii?Q?HtaJqIi3ycUHKnNArbStlqfADyAz6INF33hRjPwmxi0JfTlQ3FI1uzgKxXph?=
 =?us-ascii?Q?2/X5V3sXIYp1dS2pg51RaZF4cXN9SHtlME/l0yDMPWLht/dS8ncUNt1qs0X1?=
 =?us-ascii?Q?zt1vUU400VV0Gs4d1iIIQ5eFMrGuxkCwA2Z5A+xee93MDEkQxD95oCGgGKPi?=
 =?us-ascii?Q?zAXTInZpIgNox9WPekgNlyZz4d2DnRx+aGOljD590It/02LdmX9vVeRDNCih?=
 =?us-ascii?Q?0hzoDJGWsEm/uhtGcFfU464FozodhsG0Ejq806CEFdgvrC1bGQL9dMx35a2+?=
 =?us-ascii?Q?bB5gxeZvbfMJN52y28PEQzASOLsbxbs0hBKKogh0XH/+uakfyw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+OtVCClFLXkLBcOLs1jFD+VzIq1KRYz8/CTysgL19+PSwFSh9QQz8vUkmu0m?=
 =?us-ascii?Q?7QljPAkqats9AIpxWkaaQs+vW17kYIMxunKfMAXq4j/mGBOv1ThgUjyUWvNp?=
 =?us-ascii?Q?28mWfMrFTVyVb2bqwqVjDzL0ZxgSoqdzAWCqloB4CSmCkxBv50DigZpbvDRy?=
 =?us-ascii?Q?yTmeg42l1XJQr6zHgPfTBpoHQmluxzwcpi9L54VrL/ApfkCvb6NPA5cwLcar?=
 =?us-ascii?Q?vaFtSIR8Gmi/SwtHKgkj4VVAR7AIbUnIKWR/QGS4lgPojokNsqTqB914r73S?=
 =?us-ascii?Q?TycL2IHDmUKgk8SO44A9HBzeZ11V6VucGidZKP7xY6muAnZasBD1+GM7dYBQ?=
 =?us-ascii?Q?3hYTNJkPqdJws+40Tc52Jclc1sGOyWU+p/rg5NELFGgaOnkTUvVcqO+2r8ub?=
 =?us-ascii?Q?cAShBqhOB+q+hW3ZEx/RtDmKlAGPIMW7nxo8B0QMlfmDn6fmoMFkHmfR2CKZ?=
 =?us-ascii?Q?zGhJ3mI5yrfbm9IhKkNn2ytF0QNm4oGbkPrV42qF+JwHg5U4zyFs0XZ1Q4X9?=
 =?us-ascii?Q?kthyBcwYv6STSUmNmHX7NSpRS53QwS4wavbDQCHe01iD9NlBQ5XLSM+9UchV?=
 =?us-ascii?Q?HMy5eaohLkd9R4q6zmbyBzd5/npFQuv3MPkugWLDG7DY61T/2Yn20/+b0/Jb?=
 =?us-ascii?Q?sFsUcYy39GUf6eXGIgW1iRqmmJqVF1O6KJIkGnfi4joARiKAxYBtpNb3dLuV?=
 =?us-ascii?Q?FqI6DkUSvdSN8WMXjvnNjgoodI6fDp186GznIO93T+DcT3h9JBQx+jSslitI?=
 =?us-ascii?Q?+1nwCOVMswXUDLjM2JK53oYWJzoHSJLxwLqYjkVdGFP0+wRxzztEGfdvaF2D?=
 =?us-ascii?Q?Mq9fYleGRtRkECB6PI8vjiSFzRA9FYCsfXcRXHC08xgShO/+Tz4+5l+7teMn?=
 =?us-ascii?Q?GWcO2fGPeLws+TNM5JukAfWhwKv8YCNr7Tkvx5kKzXWfbLwgj4FLsyo44cAM?=
 =?us-ascii?Q?5aY3hPKsAzo6RMbbkXxsNK49qR0pKNRJlQWPdhK3nLLrrkM5SVCG85ng0R0q?=
 =?us-ascii?Q?H9+WNEedh/BQLWfvk/JLNAoI7Yq3sDmsK7Ml6FXBAFtnrPMNZVJlr4iw2lcq?=
 =?us-ascii?Q?+RZq41JEROZTQqp/CfC10C3JyF9U6CN2qP20SVs2aCbfvtb5ndFx0rg18udq?=
 =?us-ascii?Q?oLRBUjqLxpknCSozVwjpkwZUBvFLmvSu5sqShYfyCjaPKNow+OgS6QmQfD4C?=
 =?us-ascii?Q?1yLs1LgCUaKonBQ9bUgRxycTCboNEGm3L/t8Wh+nnJc4URbGQky5xKha+LDG?=
 =?us-ascii?Q?AKeb4E8bjP/P9SwavPIvpS1dwpXZNWdlDyRxhSiG2W1sKIYObNZjbpcIJHQC?=
 =?us-ascii?Q?6+CpITWHXyMS7JCZF2EicHgtWQkL2hheX2dYEoXR7UEqY8Kk0PVeOB5HrqUQ?=
 =?us-ascii?Q?3CIN33CRypK7/u+/J6E+XHGLvAcVzzxmwahWzazg6fxPcBt72B55Oueof5Lb?=
 =?us-ascii?Q?9ZkwObvicQWzoFxMy2SZF3M2aqIGhL0JjptQbZE3DoUGYZn2yNjp0vS52NSm?=
 =?us-ascii?Q?U6Fj7K0kKBan7/ke4DVUF60ScQkY72aAkt07hOZ8MR2KnTYcWCG5aYDVzf9n?=
 =?us-ascii?Q?elA/WLbUsKsLZLzL5CjGAnjLb2pOk5lLuvYqQALc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36fbdde4-1228-4130-858e-08dcbb874761
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 11:01:27.1755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pJe+9ijKVOUd5aU1hiXwEyu0Li252FbC35KpK8bL6h9rEfVgqAc2az19pAQfx4mUZXSWpojjepyjpAQYRii9G80MRqjMqYFDjTcYWHwEfm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6463
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Hima=
l
> Prasad Ghimiray
> Sent: Tuesday, August 13, 2024 4:14 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Subject: [PATCH] drm/xe: Remove unused xe parameter
>=20
> Remove the xe parameter from the pde_encode_pat_index and
> pte_encode_pat_index functions, as it is no longer used.
>=20
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

If CI-green, LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c inde=
x
> f225107bdd65..89d86b7cdb02 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1191,7 +1191,7 @@ static const struct drm_gpuvm_ops gpuvm_ops =3D {
>  	.vm_free =3D xe_vm_free,
>  };
>=20
> -static u64 pde_encode_pat_index(struct xe_device *xe, u16 pat_index)
> +static u64 pde_encode_pat_index(u16 pat_index)
>  {
>  	u64 pte =3D 0;
>=20
> @@ -1204,8 +1204,7 @@ static u64 pde_encode_pat_index(struct xe_device
> *xe, u16 pat_index)
>  	return pte;
>  }
>=20
> -static u64 pte_encode_pat_index(struct xe_device *xe, u16 pat_index,
> -				u32 pt_level)
> +static u64 pte_encode_pat_index(u16 pat_index, u32 pt_level)
>  {
>  	u64 pte =3D 0;
>=20
> @@ -1246,12 +1245,11 @@ static u64 pte_encode_ps(u32 pt_level)  static
> u64 xelp_pde_encode_bo(struct xe_bo *bo, u64 bo_offset,
>  			      const u16 pat_index)
>  {
> -	struct xe_device *xe =3D xe_bo_device(bo);
>  	u64 pde;
>=20
>  	pde =3D xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>  	pde |=3D XE_PAGE_PRESENT | XE_PAGE_RW;
> -	pde |=3D pde_encode_pat_index(xe, pat_index);
> +	pde |=3D pde_encode_pat_index(pat_index);
>=20
>  	return pde;
>  }
> @@ -1259,12 +1257,11 @@ static u64 xelp_pde_encode_bo(struct xe_bo
> *bo, u64 bo_offset,  static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64
> bo_offset,
>  			      u16 pat_index, u32 pt_level)
>  {
> -	struct xe_device *xe =3D xe_bo_device(bo);
>  	u64 pte;
>=20
>  	pte =3D xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>  	pte |=3D XE_PAGE_PRESENT | XE_PAGE_RW;
> -	pte |=3D pte_encode_pat_index(xe, pat_index, pt_level);
> +	pte |=3D pte_encode_pat_index(pat_index, pt_level);
>  	pte |=3D pte_encode_ps(pt_level);
>=20
>  	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo)) @@ -
> 1276,14 +1273,12 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64
> bo_offset,  static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>  			       u16 pat_index, u32 pt_level)
>  {
> -	struct xe_device *xe =3D xe_vma_vm(vma)->xe;
> -
>  	pte |=3D XE_PAGE_PRESENT;
>=20
>  	if (likely(!xe_vma_read_only(vma)))
>  		pte |=3D XE_PAGE_RW;
>=20
> -	pte |=3D pte_encode_pat_index(xe, pat_index, pt_level);
> +	pte |=3D pte_encode_pat_index(pat_index, pt_level);
>  	pte |=3D pte_encode_ps(pt_level);
>=20
>  	if (unlikely(xe_vma_is_null(vma)))
> @@ -1303,7 +1298,7 @@ static u64 xelp_pte_encode_addr(struct xe_device
> *xe, u64 addr,
>=20
>  	pte =3D addr;
>  	pte |=3D XE_PAGE_PRESENT | XE_PAGE_RW;
> -	pte |=3D pte_encode_pat_index(xe, pat_index, pt_level);
> +	pte |=3D pte_encode_pat_index(pat_index, pt_level);
>  	pte |=3D pte_encode_ps(pt_level);
>=20
>  	if (devmem)
> --
> 2.34.1

