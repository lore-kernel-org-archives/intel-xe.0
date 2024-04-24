Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD6EC07E8E
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 09:51:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DD31139AD;
	Wed, 24 Apr 2024 09:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cPdAwl3K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18C51139AD
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 09:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713952317; x=1745488317;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VA9HXK59h6h15htdXEL+hJyQnDBHujvHxA2+XxDGH8s=;
 b=cPdAwl3KvnlquBbRICI+s8gS3exd0NmaJdO6tORTWg2E6lSn3fOzk4T8
 +VZfvZePG1kgXAfO4L2ehKx4sN8uDfpIwnQgraBbldlhuBkVh4Dt+Dpep
 U8VqFPryb0mdkyFyvuBqbqIiWQgf0TR2WyGNJd8+1BipfZs8/qSCBAz39
 E+1KEvtZrv6c0+JHCgOynqeHdUN26qI0obs1NlrRDDE+qHby8Bgikn1+A
 MBGa44SCl1cX63ePVYiLf4TodDNIv7jaDzL+mJtMDUcHASOVyyTC4miLm
 Iy858Uw/59kuepVZe+EV+mcFkYWL8T/g+WnzCA7jO/gvW8o6yKt4Uh4rO g==;
X-CSE-ConnectionGUID: 80n3/dJ+TfC8A0Ra9ivaYg==
X-CSE-MsgGUID: cTnDFooIRg2GlLMoCOIB2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9794121"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9794121"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 02:51:27 -0700
X-CSE-ConnectionGUID: /8SfBLKmRaWpDJdirDFhxw==
X-CSE-MsgGUID: 21cq0csvRhq3FPzuu2ELJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="29119623"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 02:51:23 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 02:51:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 02:51:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 02:51:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 02:51:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQY0y5Kel52CO1mlcOSpVr/2VQfxonaYHMf4df6EaExgEHYRTqv5XYVBcLZdMjTmVVtZcb2+Dr+P0xLGDabF4F4Hk4CFIzAmYw+h38oDn8w4Vq4pTc5hp17OisE1vKRbXCudRfrdPWYPryAS4MgOclNmmHF79O/4hvCeyV982XlNT/HES5i7+dbdI3bGA6yfY1wB5AFu3p2SljfpPEEZ7IZVq3BKmA8iuIADALwo35YYQVYm2+KvFkJ2ygkwKWErpSrKqmiOFh1fPYcgWnPDWrqY50wfKTTJwlKG6FRc/RFOl/3SaePMX694zEzJ/H5QRtux/pqITjRijw3BW3rUiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcXZehMDLSfBppl1V2q2IZ1kQ9D5zC1vZfLrEswE9m8=;
 b=f6qBC3AeZYcOXjWhLlMWa2n1FbJ9nNcvJ2QWHDPXKFMAPVOxhckml+bNpR/KO1Do2JKqGNkQSU9IJ+E1EuJ75cg3gtKWakUk+iYcZLea4V6fzEXtDmLZrzht4S3S93qBOYKw0vyNhebh9HGrhF+a5rZ/8s3iUpo+/nJq91jpV/9FkOCs70nLtlhSB/f4L0Z7lTRX9e7hztM240uMGiR8PB1CDpSO9xEV0qRWYP1zL6doIWVb0f9N0H09TqdqEiTCVXrApiwjqvcaAcr7gvFc50S7De49DX4x7VOJr/U6OPnK3q1I/RUXBpmpfxy2oO3nqqFl7wY7LOzpUTzm2zouNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CO1PR11MB4915.namprd11.prod.outlook.com (2603:10b6:303:93::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 09:51:20 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729%7]) with mapi id 15.20.7472.027; Wed, 24 Apr 2024
 09:51:20 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Lahtinen, Joonas" <joonas.lahtinen@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH v2] drm/xe: Modify minimum of various scheduler timeout to
 0.
Thread-Topic: [PATCH v2] drm/xe: Modify minimum of various scheduler timeout
 to 0.
Thread-Index: AQHajMVlA5PGJXBI3EqqlvXOokCETrF3P1cg
Date: Wed, 24 Apr 2024 09:51:20 +0000
Message-ID: <SJ1PR11MB6204AC0275B169A9C72BE4CF81102@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240412105053.1050268-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240412105053.1050268-1-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CO1PR11MB4915:EE_
x-ms-office365-filtering-correlation-id: bdf092e3-32b6-44ac-f68c-08dc6444181f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?OWbLa5ITH/HDymVqGi2wHSK98+mqGeazSCuYiFWSnO5SimfNf8FO4xMTljFR?=
 =?us-ascii?Q?7/vS6GTFZAWL6+C1jKisLD59LkkX2L7TDHKOb0vjlxpP77efA3nIvpkc6u2e?=
 =?us-ascii?Q?Lxg2OfttvmJYTSGmp7t/6jqC03G1UnqTz3522N/K5jl5yE4LegViFky7BTHL?=
 =?us-ascii?Q?LPnALWDMmDr2Z9gTjASubU7GfeYdaLSJlrmfvOllImjkxBo7le2cNC7ItcRX?=
 =?us-ascii?Q?QjJ5si7fvdaMSi70wq02p+GBoqbva2HYeqigxZ8zISgnaPYOvP6rEDHHMSJg?=
 =?us-ascii?Q?hlpKtg/SPBfUAO9+Z/q7VqiZJtL8iSPGNlZo02/ScJvSPpwVsJfrqr2rOQ4L?=
 =?us-ascii?Q?i/qrq9ACAbdM8LhkJzwSuL/glkr2JsgaYAQ24t8Qn79MH/xBFJiU3ikH0R29?=
 =?us-ascii?Q?slT1jHeHhAh1oLYpZWyfc8NeNndQQINtMWaZiJkMTmRRkIJWro3mnrNYJuEK?=
 =?us-ascii?Q?fOszBqiwlVvXqkMaeJWHFaErdvqTaDTkadoFI3KrmofjOW+mePDJOzKwUMtL?=
 =?us-ascii?Q?4/smwFIvSwsGhNMWxHvW1ZXiONJcT0VfnOe9V3znMHXhIMm6U6MuBB+3AAjL?=
 =?us-ascii?Q?gcvmB4aQC79nEt+TdyY/gIpRrxYQaBMJBy0iTG8P2E4Mi4VdYaGFZ/oNsVpc?=
 =?us-ascii?Q?RfEaUi2rg4E8n9BvotaeyxuBOoBCIjhgxDXQ3TlHFvuKrSHTd8TZXSo0TbMx?=
 =?us-ascii?Q?UGNPSI35dFltlJbQVjSj+wQMHcb5mS3i2C7M77rX/TREV64m9Qs7hRi6ObID?=
 =?us-ascii?Q?kWh3nym+Wn6SnhqY9qUCMSo8QAhPttMNpEEuc1RH6EZGQOEFT+CqgycuYK7F?=
 =?us-ascii?Q?Q0XTpgmrilghmYa2ExxRyrPjlATfKxYQT8B35iGD5G202YkhGUVKlK6VhOjV?=
 =?us-ascii?Q?X3HX2INeMCQR532crB5qCWuqQ91qisqSNiKt5bID2FrkLSDSeQOa7HD4PlcA?=
 =?us-ascii?Q?/Ft6nUwCGTL/fQFoQ6hpzqhLhm5gzRnUpBxcg0NelsLnJLVWfLAVG/wsVf3Q?=
 =?us-ascii?Q?AS2uD7PPjG3yjYX3Xs/NJIZJQ1tCf9h0evBhWMZC/gaaOyRsoFkTWoRMRofJ?=
 =?us-ascii?Q?zEw7UMShK3S1vrO1aLwhF9f/AkmKJ+CBLbigddxPbIcoCH/8vZBHO3yF9sq4?=
 =?us-ascii?Q?FKIBgn+KXZRlgbuizi0b3dGANAtkDFXnhhO7Jdu0f3/Oo3TYkZZpHfSjP5AX?=
 =?us-ascii?Q?xj5Y4bfMsMoUSgCsrpXWJqa4U1ny4DNocEVwzvucENzOejKSIXDiNXS5HlSs?=
 =?us-ascii?Q?l6iiT+nhYC1d0wzC5SZVym9vy3JQHL1McwTOM1CUhu5RapemMKjgdoYm9Wyt?=
 =?us-ascii?Q?53A26aytkkJMwYEj1mIvv5mOm5iV9V9/5Z8CmMJiKBLorQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?k/iVAkxv3QVmXnSxxV2/3M9Ty/eipFVp09TrPedY6cBt2e3LVzogUl3n2r18?=
 =?us-ascii?Q?KAcPwFFQSLJYASYdEMy3pb8TuQrfTj8ru0tzyxpzWpHAUMaNm51GwzStdSYF?=
 =?us-ascii?Q?4Jiw5bmUFsFywgt4wyjbl8PnNqB9loVWUVDB8TrcDT12hBguk2KaZVP6zD5E?=
 =?us-ascii?Q?BiO0b4A69lMkjfdQPgpoHbn93sk7yCfFYkc1Nb/Xd/VzsueQDg1ntfFEuS3c?=
 =?us-ascii?Q?E5COzwc7egEHCXircuHOiJl656EcnSFR9JDpy+bR9VswXvYDIUTpEtmAy/Nx?=
 =?us-ascii?Q?XvLsiyZCa3Es+ratYFR5TgPRsp83wuAjmmsj3RwQMIB9+CQl+BKEesNM7GIM?=
 =?us-ascii?Q?KWUqEHMvHHXXcnjEah9BheY9lJDvFWiRmojdwd0z3D+stNtGLBl2FkD3fAC9?=
 =?us-ascii?Q?UFay0GLfeBpN+UQgtKzOUCGj6bPPduC0ZjTAMpvFYK2XGC48OGw5vhp5wGj9?=
 =?us-ascii?Q?01SCft19EjgBo3Zi7/eWCBU38uAqB6keNDCyDwq5JEFIhbRI/AFkassrcagJ?=
 =?us-ascii?Q?2pZqfuaC0+bVsJwXbiQ2wB7HVWxMHCFB3HYP309LjLah+e/7VMCjo0O6goaJ?=
 =?us-ascii?Q?Ed1FQ6XOzHuXWNsss09r8k6IV451yEPt4UgRlILLCjfpeiesXBiTMRxGZl+5?=
 =?us-ascii?Q?poWRVMwqqopDk2mvhcoelfdWsQwXFbsKJqyPE0cx8RbvD42YGX48tNUG1QA1?=
 =?us-ascii?Q?5Dqt6+f5EhaxXzByzIlzPvULjdPeiawU3ctUoEZuxOEmQeYIXRlI0Brj6z5q?=
 =?us-ascii?Q?cal31VTMyLKmY2zErTf8RA+91M9YPawDeUWRsDAjISupJVAHRde24DS6qAAh?=
 =?us-ascii?Q?3QegGc00Nv8FzdN4JD0eMN0+epxUgCN/jdpZtkFRgWbU+96bCtE6cI4Qld0G?=
 =?us-ascii?Q?m6J/c6nFU2CjNUVjjgHu9cc/6eIOAl5tEki3d4Y7a3n2XzkfGIe494sNrq3R?=
 =?us-ascii?Q?XoPc77myyevjIEfNM26z79UCT8O9/nszgPxO9dE9BhtkVyWuTiYJK+zuH5Yh?=
 =?us-ascii?Q?WMT9Um/eCC71VKfTmOFmo6IDw7Ku7arkup2ze7PhW0V02Elcl6ctWPbXtYjW?=
 =?us-ascii?Q?Ctgv25Lt1mv5QBq/r3J+bWawWyfAOfn7zIrHnLbRZ0og6ncyidH0SBI1pREj?=
 =?us-ascii?Q?ShXR2S1t4QMMxRUAmSNeaC8WxK+cJaF60tc70yTpKz+cgmB2oBgiMcB0SVC6?=
 =?us-ascii?Q?isqXBxryhOk4KmldHWY5q0V7mhYVq71NhlAEhCcq18ANoRxJk54QnXup0u6+?=
 =?us-ascii?Q?1i/IaGBYFXL1pmvNdZZZQBoBJ1ogz6Otz7aili5bCfzpSAz5yA9zIFPTrX+e?=
 =?us-ascii?Q?qRE56AULB521HPsW58bvOyzXtZ4MMBrxUeLG5deHE7h2FjKF5mJ3K6G+jtjf?=
 =?us-ascii?Q?3hYkDRCsBl7raP9/9bFSdXyksdcJ7KYFEb3SJSxckvAeJSMtjN2tK2loOmyA?=
 =?us-ascii?Q?Vw+7Dktri1RQYQlLAf5qKL8uqTxzhvSQYpQCmkdITSkXNia926LK0QbyWVxo?=
 =?us-ascii?Q?0HGtavagLeCfmthV8louE9ca4pArXul6nfsHfTJ/TZiT/3dupZx9q3xdLcTi?=
 =?us-ascii?Q?iywJW0WEcCbpFoVla0HRDqSdKX5SVCibl5VLSKui?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf092e3-32b6-44ac-f68c-08dc6444181f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2024 09:51:20.4928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ViSORDbQzJtsip9sW8sJZuL6SbiPKKpDkIB55c07yB4iD4t5LGPIXSgN+rc6oWjFxyPhrRyPfeCX/zZ2W3l5SwJNtTXf+sHuLB7RFvHSrRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4915
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
> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Sent: Friday, April 12, 2024 4:21 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost,
> Matthew <matthew.brost@intel.com>; Vishwanathapura, Niranjana
> <niranjana.vishwanathapura@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH v2] drm/xe: Modify minimum of various scheduler timeout t=
o
> 0.
>=20
> The sysman teams needs to disable preemption and timeslice to test
> exclusivity mode and are relying on setting 'timeslice_duration_us'
> and 'preempt_timeout_us' to 0 for the same. Hence set the min configs to =
0.
>=20
> -v2
> Modify values in drivers/gpu/drm/xe/xe_hw_engine.h
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig.profile | 4 ++--
> drivers/gpu/drm/xe/xe_hw_engine.h  | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/Kconfig.profile
> b/drivers/gpu/drm/xe/Kconfig.profile
> index ba17a25e8db3..80e80b55467f 100644
> --- a/drivers/gpu/drm/xe/Kconfig.profile
> +++ b/drivers/gpu/drm/xe/Kconfig.profile
> @@ -18,7 +18,7 @@ config DRM_XE_TIMESLICE_MAX
>  	  contexts by guc scheduling.
>  config DRM_XE_TIMESLICE_MIN
>  	int "Default min timeslice duration (us)"
> -	default 1 # microseconds
> +	default 0 # microseconds
>  	help
>  	  Configures the default min timeslice duration between multiple
>  	  contexts by guc scheduling.
> @@ -39,7 +39,7 @@ config DRM_XE_PREEMPT_TIMEOUT_MAX
>  	  run.
>  config DRM_XE_PREEMPT_TIMEOUT_MIN

Hi Joonas,

I remember we discussed and planned to add this min/max config but now sinc=
e we are allowing to have min value 0 (as per Sysman requirement this patch=
 is addressing), should we remove this config itself and have #defines in c=
ode for min/max vals. Matthew Brost had opinion we should remove config, wh=
ats your view on this?

Thanks,
Tejas
>  	int "Default min preempt timeout (us)"
> -	default 1 # microseconds
> +	default 0 # microseconds
>  	help
>  	  Configures the default min preempt timeout after which context
>  	  will be forcefully taken away and higher priority context will diff -=
-git
> a/drivers/gpu/drm/xe/xe_hw_engine.h
> b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 71968ee2f600..5be0783a8865 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -23,7 +23,7 @@ struct drm_printer;
>  #ifdef CONFIG_DRM_XE_TIMESLICE_MIN
>  #define XE_HW_ENGINE_TIMESLICE_MIN CONFIG_DRM_XE_TIMESLICE_MIN
> #else -#define XE_HW_ENGINE_TIMESLICE_MIN 1
> +#define XE_HW_ENGINE_TIMESLICE_MIN 0
>  #endif
>  #ifdef CONFIG_DRM_XE_TIMESLICE_MAX
>  #define XE_HW_ENGINE_TIMESLICE_MAX
> CONFIG_DRM_XE_TIMESLICE_MAX @@ -38,7 +38,7 @@ struct drm_printer;
> #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN  #define
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN  #else -#define
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1
> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 0
>  #endif
>  #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX  #define
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
> --
> 2.25.1

