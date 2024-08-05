Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C6BC3DA4A
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 20:55:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F96310E2B4;
	Mon,  5 Aug 2024 20:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BJjDiYID";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEDC10E2B4
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Aug 2024 20:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722891312; x=1754427312;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cejOUla1Q/DuzVGR+3ofpGeTrdiWOqbMAoNRgb76YWk=;
 b=BJjDiYIDztm6VePy9B9J6RAiU7bKWMYMAnbXN9z7fbaAkMhVfGeAeUny
 J1+ygliB5v/2YPtg7y93oq7Nfz48v/qDDkplCd0SzO1SyphZv9KR5FBnC
 UjOM9ZbHnQZ8pzcSG73x4/5IlAYPiryAqao6N0OPa2DNeQbFIPUL+k/GD
 ieT1DHbFBm/4linxM0l5E+qpmpHiGli/G5U7XjIhe/DZScwyuQfA/5qWU
 2bhW9+pkDl27DwMM/orPLG554PxL/tSX3LytPYGTVfoselKArcKsAwqm1
 xnHT5kL3EBkJnJGs7yfILEucgrdWv0teJnohJAvh51il12uJR9yN1WmS7 w==;
X-CSE-ConnectionGUID: tRVYvaGiSMapYoqVNyLmFQ==
X-CSE-MsgGUID: +aRxgfc3T7WFDcjJFHZEJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="24667983"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="24667983"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 13:55:11 -0700
X-CSE-ConnectionGUID: oKlQyq2QReaHsmCXuu1crg==
X-CSE-MsgGUID: /a8sjsYNT1S1Fb/E5CPbDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="61100186"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Aug 2024 13:55:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 13:55:10 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 13:55:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 13:55:10 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 13:55:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zWWk+zgkLGBS3at3MXuuE4SxkbLZe+GDshiQDBqsjlAFr4sr2p81ib66bH/Nh/hFQ1toc2+1KkVb9kMy8ZKAj2KSD+/pp9Tv+h2o+IITfSbc0+3mBGsLEMN3oNcVojXVI9hk1g+zdEa49Sa88LJf6+7fiYuau+tPDs5qG6C7uJtYbxbZKFDQvAb35dcNIad1tvIVHRj4Ipa71ikcWZv2q2yD6sCBCTTpX5JKTdL2lySonv77kgApPsvh1aKYJAKQR/ZpI+e6z/SKRIFbdnBfIN5zwoycyoW6HM7ucZdoxc9d2MrBloLksWYgLIR0v6U/BviP1vSL4coTerGDmqEhzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Q0qxTHetN5HrF3XDwg8ZIzpoJ3njrqDZnml/IY3j3Q=;
 b=OoFh8A1PD9gzKoUNsBdvkCGc5Yl8+4DmNyUtet5+mzHqF+tbOUvKSnP0dQt0RBOTF/3S/HsLDbwECxQEggIkUmY1+V1XYELbEMzG3BjD69ZKaFrmBa3TUYomVBGjcLD+4Haa34s5KNOJUk138VLRNsr3MGooc5B7fnOXGBtBkpYMvaMkC0tpVfod3SM5sYmXWNmR+zyu85xHFHGy7cPCP4u20mxgwpp18XSi+e6nWcmcIkbA2igwydPIGufRupwfmQfl+54Y0lSynKy8Ck5jPFDcQqGXgGoz/LxM/kSPSEjuVtqK1BNcAFLFM535zHQR3oIDTtoIefxdNB6T+02DIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB4886.namprd11.prod.outlook.com (2603:10b6:510:33::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Mon, 5 Aug
 2024 20:55:07 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 20:55:07 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Dugast, Francois" <francois.dugast@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Only check last fence on user binds
Thread-Topic: [PATCH] drm/xe: Only check last fence on user binds
Thread-Index: AQHa53JqEjjeiZYbDk6v/J/VcS2jibIZIMcQ
Date: Mon, 5 Aug 2024 20:55:07 +0000
Message-ID: <CH0PR11MB544452FD5E7A46CE45DE563CE5BE2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240805200233.3050325-1-matthew.brost@intel.com>
In-Reply-To: <20240805200233.3050325-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB4886:EE_
x-ms-office365-filtering-correlation-id: 6cad891d-ec0c-45c2-aa4f-08dcb590e370
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?xn4p38AinE983H6me2TvOh7mqGh06aOnvqYF5Kk4bCgOUxNL7Gvjf23bXHEN?=
 =?us-ascii?Q?Fwh7UD8eitXsGryGL21fnv+VNgI2UCpM8s6SR1BHKt1a+WReurYoi+BDL3mO?=
 =?us-ascii?Q?ha4Lf/GD+xNnqGygMtxtIaDR9OUR46WhKwvgux/aokuMLswdib8Wz+RvqYGS?=
 =?us-ascii?Q?5LzAiu9gaB9oJyf7C0Cu28SYtHb1BmmlM6B7MTiPhGS4RUpmFCcsOk9s3LsC?=
 =?us-ascii?Q?1U1gULSSg+6qoCnkianEg94mfWMwbGk7rGVrTESE3HylWE3x4Hz4uH2joVrY?=
 =?us-ascii?Q?0VPY0mvh3j+WLckLY1c13txexATY7EgiurlK3iDSvbU6ce1OimZfnWcQ/daA?=
 =?us-ascii?Q?5anuZWnzt3xIkFEV8ZxoQuQzaZ+YEEq6WtX9JS9COkpEbvKZcN+OFLpNE03U?=
 =?us-ascii?Q?RvDZ3lpfA3sN2Mz8wf5oSh9Wdn8njntHDtVAdFTkY/oBKrD96k+ts5LNI3pO?=
 =?us-ascii?Q?dnSeofEUs39dNs8CQHHPiQvnkcwcxlt7Zvvq0xFpGzUL/q2dhb375WYbZfoD?=
 =?us-ascii?Q?nRfkCHHOGjra0A3hou788QCLgEXZWbu19qR9/ESw3YbX0adFx7w/udya9MG+?=
 =?us-ascii?Q?GiNRzgB3BvxHZiwT6xJuoMGFAuLTomgMreuch+18qw9cmonRQZT4VVdYF4X2?=
 =?us-ascii?Q?op0DGSvpbVRpUg7/6wrJutbFigBdXEeD80Xxswb74pLZIutdckZOeVE7Ysi2?=
 =?us-ascii?Q?ChdOPMqjfrxmP2Pz0deOkw5ayVzN6RyW/AivkyKWDa/8yXsXdR7MNuXD2Tma?=
 =?us-ascii?Q?LaUFtPi6P0OVR42MLkJsiKfTW0q3+jPrPqy8z4PbLT2FYD/FnK4+e8Ek9yhQ?=
 =?us-ascii?Q?msZTviQvi14d1KFS/VScgSCNOlMBFRkss5uVejkt+XmqQLsafBkn1+KHws/8?=
 =?us-ascii?Q?eCk874gHi3O0bzYvAM7xPSfb7nS4PSwk+Qq9pTwrjnb6u3gUoC2PznthBvLC?=
 =?us-ascii?Q?vmpH/vj7MRtEJe2qtX97rLSGACSFWJZdPFXEur1kZ79DAQ5KwfjHK8AwA/2Y?=
 =?us-ascii?Q?8rq+2yK1Zn1flkPK4t5f4MaH2VvAMDTmypJcTCMtULaPxoIWu+HXcridK1YZ?=
 =?us-ascii?Q?N4aXy2rn9+El1aIY5hdoY6B8/e7yGyqelSJHIU3uS/kOaeV6UOa/PaIJDPEm?=
 =?us-ascii?Q?8NAUDYJhRXUt+1qO45EDGQOYyNCg7xZn8OQkwY0ppfcmO652iCT5qpkTA/5K?=
 =?us-ascii?Q?0jtNdshPBdt+N0i7WiYp2fTjbJgB+eCL31aIgzhbt6Jiwmf9EoGjihIgm5Gq?=
 =?us-ascii?Q?W5hKgmKRaP/6lt2j/z6T9PR6eorLkR1T0p/jwi+fX2VySUApXN2bn8pUcqNj?=
 =?us-ascii?Q?u2M3v/fdQLvkZ/FDAFectph84tEHAQCj9aBbK4SdkPMa+vFsyc510xBPrMgq?=
 =?us-ascii?Q?A6a+42b3DsxKnUVpREaXCRYhIz0oQhRyzj9dd3BfDf5TKPelUQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pBhIGv6FyVvi09G7QhJVlV/U26KVvGTJkPVCN0bsDlZZFaHQyslnfXs5LcCg?=
 =?us-ascii?Q?VmWbwm26fdF8ZLduWvEmIBgJxjCuz1cOcEMByUElHE1bUwnBvCMIa4S+aP2W?=
 =?us-ascii?Q?mwujynnvKn1p9XQOUgUdGUOdfUUMl0mKvtQw2Yl+CaSolhMHmpsnaj2OrF0B?=
 =?us-ascii?Q?R9Oirqy2nDdwwVFPk7urWMJelldtu0vKSKPrSjsYQWwP2vPkM6sghHkkH8Og?=
 =?us-ascii?Q?q+c11WU1BgUNuMvhJ1NKUGh+ZK/4DD0eIZagoz0AM6mPdBUWCLGkneAhdx57?=
 =?us-ascii?Q?Ao/R/ijezZJ4kRZieI8i73r5AfSPbGsL2VtGlpIEfQic7gzlj8/m74ZshDaP?=
 =?us-ascii?Q?ej4cvctZX5PUZr7GrbHECTXP7jLtbj//zN9bjBvoWKbgdrGEBvlOQUAjgFzJ?=
 =?us-ascii?Q?iB+3tr6S8ltFXJb8sq1VOLutqgWAWk4/LsD5uXisAGZYADav8MkzBGXXLztK?=
 =?us-ascii?Q?1cqxkRECOuIdvAMHpQGy1tN6R4KYLvc1FmtgHEhcLNIV3koCnJm2/UVg+mfJ?=
 =?us-ascii?Q?c0xyK4AWpjHeY0eCOugu13viJ8PPhVC93nfbYJImcATL4xTLVRg81fpKc+S5?=
 =?us-ascii?Q?O4BpBaMNNeB6Lu0K3tjlS/6Pa+MMxSLjxH1d/VqfE6BcMaliMVUJNsob/+gD?=
 =?us-ascii?Q?tKhoafEYXF6fiTgXsv+eQGEWU+kMh8EF6Qndfs8J9LhlqM3e3xGEeukZyp4t?=
 =?us-ascii?Q?f06qJkNPhJm2IzF90fuYaCg5cILgUb907Tcv1pG6FS0JXxnViNzbHSZayD7/?=
 =?us-ascii?Q?CrYPt0IWGpgV49U5bVZogsxAF7xTAwZtnBHC08gJe4TYx+2YEgjfVMiKgz57?=
 =?us-ascii?Q?T21j9Q+Lj+ZqSrvLchrYNV+pb+t9ahI4vrA6T80hUa386x0lTisjfVj58FxS?=
 =?us-ascii?Q?p8lHcwy+It2Ty/gboJOLjXp+LLmo/IUGiKShEsyXzpiP1Kc+ES3Jmb1dsY8O?=
 =?us-ascii?Q?4LCHNYv6I94FCtBN8DWa+7nGCeZCFMhxE1HcX9qyp5QMt1SmMCJ2P8FyCha0?=
 =?us-ascii?Q?omi6ZL9+spin9oRTF045pDXP8h1RFFaM8xwuPiAGU86FsMQq/bnyJuvy9851?=
 =?us-ascii?Q?VsNeRFsvKawC80XDucUwZDHVvWx954FkLup/1yw7zRpkjIxHiCJ5B3bPuvjo?=
 =?us-ascii?Q?PLEg+iJXO4D78U3Vn5ks79qXR6qaYHp9vNeUL0Gx6Wkc1GvAjj8lrzdY1Yyt?=
 =?us-ascii?Q?oNYNfM8pcSxd+ekTfV9ZXDSNbFr/6k5nwQoRxDOUSSKonpSBv/v2GqojMeAo?=
 =?us-ascii?Q?6vWHA5M1elAwsmydnyUdltpbbGqMLGgpwSl1kMfqbkV20qea42RlX4dhox4a?=
 =?us-ascii?Q?TPN5iCAbKYiYGp6XcJlQUjE1awx9MdG/w0YA9BBIPFXg3XVjGH8OB///+Fa/?=
 =?us-ascii?Q?5O7BxQDkm6MNVVWl3LXJaFSxOXXutuvoThP9wG57DrYAPiVIEzYdvqqaoblD?=
 =?us-ascii?Q?6c3XKibbTq7sANLzOxTEXuZh+SjPsrqSy7p5rOsOgg2efpc+wE+B3CmBDyTk?=
 =?us-ascii?Q?214a7WWDdlMa1WuniZqP5G0FFzxrDkK3vi6zHBScIqs03+Yu0DekkpI7pd44?=
 =?us-ascii?Q?ymaJzBWxr55pfcPgWErRQYFqBLyPoIaoj4m5Z8uD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cad891d-ec0c-45c2-aa4f-08dcb590e370
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 20:55:07.5049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BXGS3Eztdu2TcrmgUEMU94WOAIXstr9BOBRjveDMfuDG+X2OFJud1jDTJlMu5li7Srre1oCUDFWHVVvQVE1uDkRi+ow4ZZozE+TKGa2Zhp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4886
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
Sent: Monday, August 5, 2024 1:03 PM
To: intel-xe@lists.freedesktop.org
Cc: Dugast, Francois <francois.dugast@intel.com>
Subject: [PATCH] drm/xe: Only check last fence on user binds
>=20
> We only set the last fence on user binds, so no need to check last fence
> kernel issued binds. Will avoid blowing up last fence lockdep asserts.
>=20
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 97a6a0b0b8ba..579ed31b46db 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1149,10 +1149,12 @@ static int xe_pt_vm_dependencies(struct xe_sched_=
job *job,
>  			return err;
>  	}
> =20
> -	if (job)
> -		err =3D xe_sched_job_last_fence_add_dep(job, vm);
> -	else
> -		err =3D xe_exec_queue_last_fence_test_dep(pt_update_ops->q, vm);
> +	if (!(pt_update_ops->q->flags & EXEC_QUEUE_FLAG_KERNEL)) {
> +		if (job)
> +			err =3D xe_sched_job_last_fence_add_dep(job, vm);
> +		else
> +			err =3D xe_exec_queue_last_fence_test_dep(pt_update_ops->q, vm);
> +	}

Non-blocking suggestion: this looks like it can be inlined as such:

        if (!(pt_update_ops->q->flags & EXEC_QUEUE_FLAG_KERNEL))
                err =3D job ? xe_sched_job_last_fence_add_dep(job, vm) :
                         xe_exec_queue_last_fence_test_dep(pt_update_ops->q=
, vm);

I think this is just a matter of preference, though.  The explicit if-else
block is definitely clearer.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> =20
>  	for (i =3D 0; job && !err && i < vops->num_syncs; i++)
>  		err =3D xe_sync_entry_add_deps(&vops->syncs[i], job);
> --=20
> 2.34.1
>=20
>=20
