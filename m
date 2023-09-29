Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F8FE728F3
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 20:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457B610E143;
	Fri, 29 Sep 2023 20:32:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6228410E13D
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 20:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696019572; x=1727555572;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Cd0g/VV3NZBqTb1u0vVyPf0/ETMxTYzJRkj/urXyNUI=;
 b=SCWMVv4/yxqLlGzAT6oIovbSka50Qn6mwtJoWW7M8L5PFCFa8u7kbVu3
 CJT4MA0WYmZZ67g05/TEIb+2Ss9Juxl5qvwhoFIDojGk0cUJbmgYIQL/g
 YZnHOvV0Xp5hgw9ySoDHa2tvfbHGXu+ivnsDuSMHGS6WhJCv0NgOVW1DK
 WivOOWYI4PIRykWUzAgwW2z/Q/O0rAILAAG27PrTRaZ0BAy7XQ9mDYoW6
 jhlD3ZOXekyk3VVxedtDFMIl69eV1Bbm+i9G2opgt0XqLZ7OKSnYYpuXZ
 NBv4eKUuWZ00DK3Tjq4ZIvzv8yo/bELJLiKuCoXD2Cr2PdWFtcFQIJe6B Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="3933084"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="3933084"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 12:07:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="893506401"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="893506401"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 12:06:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 12:07:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 12:07:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 12:07:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dusWQ/BFPQeH91uL3goe3UVfmsWktfZRITsWf37LoFZCizKv6vkWWaxTFLjC2SUvr9W8jJ3kGeqzBWe2JFTh4P4lHEAhk+z8u/R9yrvtNtku3v5Y3I93xDQzaayZScCBBLP1vx7zkxsQbO+DzzhaadtnyrMMcK8ayNvUYMoheS5sszuEGGA/ixYRmsecndFizRYr8TNzBEqn4FnsR3gj8vdIU/9jwggBD7KvUVwkxnQVj5hCenEbzev72sKdDIZmBvrGd1VhTxpmCwU418TxE5YnjpgzTfQ4kyu7eF2kVnciW65s6OPIYX5REOZjEI+UqNqKQWYeucbJghkBvcL7DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Pp01lKU6N51uOTQuA339EkiuZXwBq8y28n4MgEf3D4=;
 b=CQoA4Uk4QhC3+OqPM94UboI0uDG19IVeAO2rLw9oAWHJ7Mn2N7uNghTP8KF2JH++R0uX8aW+fUbeAO8dD9gp3cJaHxGwNZo9R4g9wHVUIV9b56A9nMReZdnDdYn8VvbZtbQEzcHuHbpAnOXdNbYE4rrQICfYClkC98UfSalIz9cAdmSwrphFf2CQpiUTrje4PViToTniLsy0CSgj+fnv5SyNneUgSh1FqxPUh+DNGaXNWDzo3JmfaYj51dqzbz35Q5FnZl7SlUVkabxfjdx3CqbC+J15ijcRHNQtfd6tNV/W6BBm/twm6PhDSltD12lDmA9kWwarTuQbe7fWHhWN+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 by SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Fri, 29 Sep
 2023 19:07:30 +0000
Received: from PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::fc2f:c7e1:8163:6c24]) by PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::fc2f:c7e1:8163:6c24%4]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 19:07:29 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 4/7] drm/xe/xe2: Add one more bit to encode
 PAT to ppgtt entries
Thread-Index: AQHZ8pJ2OhMko11Jw0aK0te13xxAbrAyKtTw
Date: Fri, 29 Sep 2023 19:07:29 +0000
Message-ID: <PH0PR11MB5782DB1414AA5ECE02023FF682C0A@PH0PR11MB5782.namprd11.prod.outlook.com>
References: <20230929050253.3153804-1-lucas.demarchi@intel.com>
 <20230929050253.3153804-5-lucas.demarchi@intel.com>
In-Reply-To: <20230929050253.3153804-5-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5782:EE_|SJ2PR11MB7573:EE_
x-ms-office365-filtering-correlation-id: 029d6c43-5a11-46db-9c55-08dbc11f53ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IcwIWoQlLF6/GaoKHC5Vm2hPEzNeWcJtMCRMZIXrzB01bKHLMYWyhqrj+uMxqiCIa//V/JlAB5yxzvfuBxzdnhTJTtk29/l1dQJ4pXHr8XDIiXsvnpvqVxX1wpwGIB9Qze6ULoHqEL92m1sAY3v7geVLkzMiRMPmgWVyh/AOMi+3M3YKeVs5G/0Qlyuj9qfHzimIFyyRx8xuZTJfbSZRNen52xN2YM6X3I/8ovOrHg0QPwsqFFqB4yMnjuzhv0JRNw3HxDSJm/s2l+PHbZEJtECjzFenIzzwawlOvI/If/7csIihmNIITg+ZNMV3vxlailkcXq1aMzkGQY1bobbPS8mM4Ri9ywmSYWMMky/A/EP32Qtku/sTozsnqMvPvORA+Sb5Z7xp1k7P07tOYga/a7+lZSymAGfdMaEzYM9OlCiYtGUUOt+A55ZdXcGP027buO6WVTKmu804MFRRiIGdngi5FjpGOBpL/C4ThDtwLyTp56RQu0ltkmu7IsjXVbtRLt9a90ogZ2CJVmL2pBJx0CE6epRGn8BfHlSNWEKX+8zj7MntnzQWQK+W1+FfOLzY/epxL7Zf5KDUwHXLls1TvKFUAzdNLtnjrr5lICAwCd6G/Gacgy4+4iDxqp690Ncs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5782.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(376002)(136003)(396003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(7696005)(6506007)(53546011)(9686003)(83380400001)(478600001)(107886003)(8676002)(4326008)(71200400001)(2906002)(316002)(110136005)(66446008)(5660300002)(64756008)(76116006)(66946007)(52536014)(8936002)(66476007)(41300700001)(66556008)(26005)(33656002)(86362001)(55016003)(122000001)(82960400001)(38100700002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?esTtE07K3p3h17D3r+ElMyRvmhgW1MzDiPiRiRJxV11ZndTAK1IFQelmslN8?=
 =?us-ascii?Q?nIeE7zOYt4cNfF/An09cs4Lfs/3U/tu1gGqwqUb4Tkzcdw74q0m2drxHqx9W?=
 =?us-ascii?Q?4xmbaiJl9mYG9iqOLHl0hA4y7bxC/gi8fbKCQdzXf0O/e19QZWqdSUgD/O88?=
 =?us-ascii?Q?Ftz6jr2F6pZq7aNDy/Ffg8oi9OODu3JfaTba8QxW3+NLe4NY9yhaif+Y1dHK?=
 =?us-ascii?Q?ngW5NtlTONJv15LO2Iu/NddYlNAUYdCs8vdlxwhrYM0NM1gQBdfOGsXk7m/v?=
 =?us-ascii?Q?01l4e3O9/c84dCDhOrNmk3eAAFppjvQUdmaKmYpe0HpK0tm2GIWY1niTCuSJ?=
 =?us-ascii?Q?8hUdUaQ21GiFcupXAqqUPk5iNPjwfK/w6cHXpmFTGKgzSLXV2d09aZyFkz7C?=
 =?us-ascii?Q?bPfWr5ffhiXU/Ywai2Kf6jsP0HWB1rmbuaV5rgmITnxeRP0GlQ7pb6FkAelk?=
 =?us-ascii?Q?YtVHQXB7f+1O7WWVyDHt/Bq1zHIG1VvaqXqmms4YvzZn/UyvHH4Hj56nt94v?=
 =?us-ascii?Q?MPt1e6iY5qXqGfVrXVQMbu/8LaVGTRBrfBzF9/gIjYgerP/4S12zZPBQ8Urf?=
 =?us-ascii?Q?cgeMnxg5HenU5mnZ3i1vUjUItXv9lfGX4IZGpCESuTssLfjrQc71JB/yb4tv?=
 =?us-ascii?Q?JQTm697m2M7tcViYKTmMMtMWyAOgoAWi4FsvpwiGyVFR4a8oKGWFXHiSC0zv?=
 =?us-ascii?Q?OYdBHkH6FDSYhwC6zTFFGcsBgkw6RLeiU5SCGzF5qjyWAK0NoQsyX887KDnw?=
 =?us-ascii?Q?csb2MzTiFpcUKCvo8NgMGoj1E3gmSOfrFaLL7LuPagTjUyiAdpQQwmdVl7NC?=
 =?us-ascii?Q?jan6P6g7GN8Hef0D9Bvs2ENsAikFuMWXqLeBDb/AayPagMjH1z4auh2QDZUY?=
 =?us-ascii?Q?7PM0Ys+mfew0+ysOW0u2bH4GKVM6tnixX0hi1+IX9Cd8WWlMlQSvsxK+jgP0?=
 =?us-ascii?Q?Nb+pyheyyUQYCBohkDgDmahOgXJQla8ig3vhPIYpaOG/lRFq1C/GQRWUkr4g?=
 =?us-ascii?Q?hzvGMlx8woeOSKBxdJ2H8bF6Jm45Uyx5KJDgTmdzfT/f47mrReVPTNyVfdwJ?=
 =?us-ascii?Q?74ZmjPh8GEmKCr+1ZhvOnH0vENX7rtqWa9ThvNSVhjw9awEBJ9JF1iw2/PRs?=
 =?us-ascii?Q?5bd5y8UAgc3r5+dQk8Q8vM0X8uLHnjDDnB39EkMBp+L3NMDn6ZlsqiLQAADl?=
 =?us-ascii?Q?EWT5ps3wfeYWOg+pSSsnp+5UnvMicEu/1/JDX/dmHItea+2cHPsbu42BX5+g?=
 =?us-ascii?Q?EfIll1iZexTe2XshAtN1BpN0inpTnfZLTJudlZ1Wxo4HOjGMP9pNcIV/B1p5?=
 =?us-ascii?Q?NgkRBXbHt1vYfFDsgvAfIFkkKog1Q+NdSxIQ8FUSaO3I1a3JOow5jhLRrjDT?=
 =?us-ascii?Q?YgJ8adWFXwyvkDz/Z/DMJAWm5KY5hGbQ97hct2ZhmyHJWsyEtKAZz3xEJueV?=
 =?us-ascii?Q?yndvLSkk827eKgXbElnbPORtVdZTNJqetRUJ0Ia2xvyOyBih5tREhmXYHkUw?=
 =?us-ascii?Q?fibektT5s3pNIMhVyREnE0Wy1jn/8A7SA9icT75eogzVf0JzZI5FnsH5OF7n?=
 =?us-ascii?Q?uI8bNol7T3FTdPiSqZqnyj0+rOC5FNMEPwRlNWja?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5782.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 029d6c43-5a11-46db-9c55-08dbc11f53ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2023 19:07:29.4819 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q0ktKZI3yn0IqLbuEnZpkRTjhZCxwpEdLFuCzN0KIeHw0wPPKBAC52gOYLSfRfqPJrSHWrvD90exwnCS7vHxijdUWBS4aYEdaQ1rRu39bAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7573
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/7] drm/xe/xe2: Add one more bit to encode
 PAT to ppgtt entries
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Luca=
s
> De Marchi
> Sent: Thursday, September 28, 2023 10:03 PM
> To: intel-xe@lists.freedesktop.org
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>
> Subject: [Intel-xe] [PATCH 4/7] drm/xe/xe2: Add one more bit to encode PA=
T
> to ppgtt entries
>=20
> Xe2 adds one more bit to cover all the possible 32 entries. Although thos=
e
> entries are not used by internal kernel code paths, it's expected that us=
erspace
> will make use of it.
>=20
> Bspec: 59510
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.h | 1 +
>  drivers/gpu/drm/xe/xe_vm.c | 3 +++
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h inde=
x
> 5090bdd1e462..7ffc26446d2e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -40,6 +40,7 @@
>  #define XE_BO_INTERNAL_64K		BIT(31)
>=20
>  #define XELPG_PPGTT_PTE_PAT3		BIT_ULL(62)
> +#define XE2_PPGTT_PTE_PAT4		BIT_ULL(61)
>  #define XE_PPGTT_PTE_PAT2		BIT_ULL(7)
>  #define XE_PPGTT_PTE_PAT1		BIT_ULL(4)
>  #define XE_PPGTT_PTE_PAT0		BIT_ULL(3)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c inde=
x
> 140a70d91d76..7e5f4bbea451 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1223,6 +1223,9 @@ static u64 pte_encode_cache(struct xe_device *xe,
> enum xe_cache_level cache)
>  	if (pat_index & BIT(3))
>  		pte |=3D XELPG_PPGTT_PTE_PAT3;
>=20
> +	if (pat_index & (BIT(4)))
> +		pte |=3D XE2_PPGTT_PTE_PAT4;
> +
>  	return pte;
>  }
>=20
Reviewed-by: Pallavi Mishra <pallavi.mishra@intel.com>

> --
> 2.40.1

