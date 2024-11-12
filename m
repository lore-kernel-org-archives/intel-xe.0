Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84488D597AF
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 21:47:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5268A10E1D0;
	Tue, 12 Nov 2024 21:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dl2G2CW4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC36810E1D0
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 21:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731448072; x=1762984072;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/YQCN0qPuMNOTyul0Dh375PC6Tuf/WYThIplHdvES3Y=;
 b=Dl2G2CW4YHc49BOG7EIRnoP1WyuJs3ithZP8Ngms4LK/cn6urZVW7pzc
 W1RGgQNMZeD+YKpPxQIsv9TkuB8MeWBE3RcbJrpPCACpup41wCBFTpY5U
 W16VKtdtSA1AVr5vwOjzon+wM5cx8OuHybdfBw+qenqNuiQ2YniejtsYH
 URBO6yhCtX+6KdC/kJ3Q9w5BzYM2+ChELWmFpmIjrNOOCjH9H85Sfz+zp
 fKh/ayzy8t19/rejdeh+corzIMaIJm4z44ziuqepaCxGUJe/qPO2+Xu3T
 rmFF3/eB3BNBWHzYrKx77aZuEnJO5x/CLZV9g7TPDeEgvZORf1P+gohPs Q==;
X-CSE-ConnectionGUID: hWrdUyieSbuKzoFQFzydxQ==
X-CSE-MsgGUID: 89yk/gysQZOS5qbzYD0JNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="41922121"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="41922121"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 13:47:52 -0800
X-CSE-ConnectionGUID: 1q/16rXKQ7yws3um5rp2VQ==
X-CSE-MsgGUID: oa9BOQGTTD+XxSEjl2LTmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="125176277"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 13:47:52 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 13:47:51 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 13:47:51 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 13:47:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/OTPgqAUmG7zldZcy8ZzPryBO4BqmGw76QmmUFQ0s/ARl7TdxM4mTGz9VN21VhRiBOXeUuXpL7DydDYrMTpsSt8CrH04VVOEg/K1P755NhEPKuNWdaMnBVrpLuPTwPNsWFXZ1LI9XbtJDtKnN96TE1FneZD2C5u3YIRsmXTmPOs3GpNA0JAi49nMSsUzjJqXgBRrQwmvYyTiFiWUBqQwqZ6LA5krwy9UlQaHj0Kx+DmXSOFoKnKLSjGMOpNGiX714dnmKm+GhXdmiIF/fFsMlIy4oVyt4MLNrLspQb0MxIRlX240QhmntdGCGXJQLgxOVaXgJtkIDBv85d5gjy1eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4N1X/zi8jIoNKdKIHLq9JMZs3seNpksNWPBWtGnLMk=;
 b=tve3m9TycfYkIo95dSv/kdUBWzdTIaoDpce0Zd9HnQlL6oZNCMa6lD54UMgHaY6UEtWnHHBtSg9R9d2q3285NnWPpl3ZhwuV2xJhTjnzwmj2308vX/GRTDcKxGvQiAKSdNo2WePp74Xll5nT2bBAirGtDlNFipmYqcE0R9ualhMfmM3doxnRUokbhOBSx001J34j8juPeA3A2cMPubZtQMGHC9Zm597MEF6e5SBtcK4epvfcv5GLJxVpCMzXr+BZVjCNZVgA0nomL3PANtWawIjn6YdpHOF/+5u0C+WsKiZ2SKnJ6u57XSSEVh9SbRq7hNdbuFa6uzb/dvgWJyqNJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB7199.namprd11.prod.outlook.com (2603:10b6:208:418::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Tue, 12 Nov
 2024 21:47:39 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8158.013; Tue, 12 Nov 2024
 21:47:39 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Remove redundant rebind from preempt rebind worker
Thread-Topic: [PATCH] drm/xe: Remove redundant rebind from preempt rebind
 worker
Thread-Index: AQHbNUuKlKjFOTIDg0u7fWtJP+IwvrK0LTSA
Date: Tue, 12 Nov 2024 21:47:39 +0000
Message-ID: <CH0PR11MB544438DCEDDCE33CB71C14D4E5592@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241112214104.1341240-1-matthew.brost@intel.com>
In-Reply-To: <20241112214104.1341240-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB7199:EE_
x-ms-office365-filtering-correlation-id: fe428d17-67f6-40a6-738e-08dd0363a0cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?ciXTdgnAwPC8MvT9BBtz8ZoIY6ifLijs2igxAJgT+a++yND7lU1YRwl+P+3j?=
 =?us-ascii?Q?g+JnMEzmhjQR+EiXubMEKgD8ZSrsjMBSre08NXHT+ED0YgeXQaPf7nqihWu1?=
 =?us-ascii?Q?gxss5sGvqHu31qcZrmaj/Q+ZHyaHTtLZSgg6lqNDF+XW5QVG9A54qZChpNJJ?=
 =?us-ascii?Q?Ko/eczr2ORcnFKOEUyi8dURK83wIB/6gGXMsu9hZALkvzV0fnf8jTM1tBZ4c?=
 =?us-ascii?Q?N1cCAkPtgBTK543qcdvJSwkcgITWHWjEjiR0weyUapOo33jAWx7wZ/qYgYQq?=
 =?us-ascii?Q?Grb0xcA7gH0noK7MeIj+HLQWZ/KrOe1Rv4zZFDXzodXlTp2YdBwLUXRwF759?=
 =?us-ascii?Q?3pQf8LgE/vUrHlLYCdm/ncwDaBoDatgeLMWguUKdlKIeUwkzkqbBu9TRtotC?=
 =?us-ascii?Q?f43GqOQ7d2rG5YsuUeoa3IzUK5pGY502QtX/dzRPGRg23M+6kkjVOrx4bksW?=
 =?us-ascii?Q?STPYlCwqh9//ua1q4MU2G0yoFTiNJjFuf5zHhBaKQanmM/3+RPL+Ap01tPpa?=
 =?us-ascii?Q?gkMKwQaava4yCc23U3q1wBHA93PlQSJEkSdswDA12PF6P945tLNb6jwvOBZv?=
 =?us-ascii?Q?YjKzFQUXp80gz/2KiJY21pC+qSNDJfCXkZyGQka21TS0sX5CwZq92Y5yVQD+?=
 =?us-ascii?Q?L5T0zGGTLrwlPprI240JfUH9WmdIc93Fxn4+MSOJdM1XYYFMEikLLhwRXdUb?=
 =?us-ascii?Q?hBjEynkjwLtM9cE0WX5XzpfcOw2Vi5SYcLRry856fJ9aSakM7fUzxCbQRCfF?=
 =?us-ascii?Q?hvlpbljW1ar9vZoDxOpMymr56ZaQD3PFXPNRyS0w4S3FPwNOcXnpmKI+mX37?=
 =?us-ascii?Q?c9G501V98kvxpiegwFQvdmvVjby0BwjAXbMdINXMPZUVUqkuoOFUVE/08AaC?=
 =?us-ascii?Q?+EATByNkCXmZ7WUho6KIBtVehVQ7TF450yFUafjPlS+3pzRSE3k2/v4R58GD?=
 =?us-ascii?Q?ezESyW9/xC6KSHWMEOp7fuPfzJMyDDwwGkIVOI7U6+V2+63zwcoo3DsKSoQF?=
 =?us-ascii?Q?YkPXUB9Su0PNhWYVKriQCE/rqlFVpIPk4ZzeOFGvSi1ds+CpRgbCEFVtusHr?=
 =?us-ascii?Q?XbGCzbVAim9TK2BlOMbOpp1cFrOd0s3+7UgtH9Nevat1GGNP70PEzBSdkyAx?=
 =?us-ascii?Q?ITnS4/ed+o6LW4CXJNKOBG39D3OJOwy3gJOtp9hzqounZxp7sNoFsjnhxRg9?=
 =?us-ascii?Q?FXujZo+aRiSLStT9iPxrlqAe2zJBzuB4F6lGzMrrhhn/7p1YwbSwm1T9bsou?=
 =?us-ascii?Q?RJ3V5cygDmqwv6Z6+5969Fh/w3TTLUWsnCIawAS+0ZmhpQdAywSKcrwvVIyx?=
 =?us-ascii?Q?Sc5Zv/JKHQuGP/2LPqJmJa4j/LaRJtMeP37+tqJByHPHQafosa0fjz87EEay?=
 =?us-ascii?Q?J+Nnfmo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fBRXu2KOZbTFTsG0LwHYUcerqlq1p1s2MSknrfmKvZ3DgGue0pSF4qemqKvC?=
 =?us-ascii?Q?wqpxfC2IhZdRbqv9N7f9Y32s83940pjsIcoLi6X8auKf+iZ2Z2WavLgPcOWv?=
 =?us-ascii?Q?D+tZWm/VgceGD8MoxW5B9GLfLu0GiaRgaqK9kBSb/YvrKS9bnll2m8TOnk1p?=
 =?us-ascii?Q?zuYkBoM5Ie7afsFfUN8QGF7Q7lGNACvLVYidCvAw0QWSLvlm5jFQCEsSvbiA?=
 =?us-ascii?Q?N1E9j6EzSRu9mwCNXT+7LzvzxoAyvff78H18Xv9JK2eEsx1uKa3Q/rKJsFtQ?=
 =?us-ascii?Q?bnNVhlEdNepCQXdgVkpCIZR22zwWtPLjyNiFXyCHNXdQ1WuyrsdpMuAU57Q3?=
 =?us-ascii?Q?BacESp7IP/lkttSVzHPvswr0mtMQqHGv6Puxhk7oP5Nmb3VZDxtVyvfbFUfp?=
 =?us-ascii?Q?52Ars84PGsdXiPYVPbzeZ7p0eFvaSfCrxpbs/Fe+0re6NEx1dVoBa6C/LPW/?=
 =?us-ascii?Q?t7HfsqANySYhG5NhJsVvW5YmKzkyhF5dNE2JIN4lvBwmlbhKNpLaSKaZACRZ?=
 =?us-ascii?Q?6iIIBqkUx/wVxaDx8ocSAYLN2XlCDfbxSxzKRNicnGOHtPzOo1LT5Q00kIDb?=
 =?us-ascii?Q?O2eT5CtiamvJ2WwMJ4cUe8KOWY4rCdBtxKQcs3cXvkfeTmHQGIcsflFFiMRw?=
 =?us-ascii?Q?3dj4GLnmuDkIJQDV+LcbL2byMURBFRCQ/t1QwBfBl7gcv/5tOp4oXwxdiVcT?=
 =?us-ascii?Q?ytiBrxgE7ZLZKXKNCRljY5uUJi9k8PkKU+kbckKZL25zis7jMr/1+0E+7bYB?=
 =?us-ascii?Q?vPEHaPliKs6R/LQweZpY+T9eCo2GvJvCUm4XI1thvbKJfVMYit7xSyh2n6wt?=
 =?us-ascii?Q?dQNfxWXnFLjSc9q2ACiLDUvBiXqTI5bAnY//ypl/59iYYncEg3SGfJwkcs0v?=
 =?us-ascii?Q?TfbpIl62pd6+j4d1YX2v5Ycp0v/G/tTOWjMZMARJnxPlZZsDavurN27I/K45?=
 =?us-ascii?Q?SMTKIag8fuCke3INxDERi1KnmUkHm5UvSHdCwCm+BOTN7yVrPfhSp2Q3ZQSJ?=
 =?us-ascii?Q?4DUn1QpNyIs8cuKetaAqQkSwnvCvmjYLBp10JVRYT3vE8GR0zrOb0rhCcseB?=
 =?us-ascii?Q?Pp9iCex3cxS5h3IcfZa/FsOHGDnjoucL8o1naBVs2YUqmjkdCZ476gWfVImv?=
 =?us-ascii?Q?1XjFUjFQFv9ynsTaucTQJLLGFNWnITy9M0ibpJvDGoFZxmDtx2/Gcx1qpJh9?=
 =?us-ascii?Q?geJRLCAMNXUomTA4vrxLoKQLGdXVuYZvl2Xwq1FpprUHZqy0jXB/Ge/9dQn+?=
 =?us-ascii?Q?ug145wwg0txxcyniErK5bLGgXpkHt6jHL4HC/IT+4RM4EGjAjMbRpRW43kqi?=
 =?us-ascii?Q?rsO3ATKHdSo+bnD0ZPGmg8Aod8eI4WZfWVgpvwk484u0HLt1EXWuRHppDAvf?=
 =?us-ascii?Q?yUg8I7C1jjFit/ghqEbcUkeBphL2JS1RUfP7KTJBxEJTyWGeGXS7rhdm+dv9?=
 =?us-ascii?Q?xY8oTlwU442g64/RciSz/1nxQgynYkAOIQT9Q2CSHPqcKBQFIhtPxFOrpkSc?=
 =?us-ascii?Q?T9S33tQIB0Fm90bUKVZmcYJ/2kUatvR6q4KxUhZqGU6ZZpVcNOZ6ocF/dIkQ?=
 =?us-ascii?Q?TwNO5dCKkH9A0bccAIo236jHPC6svOgLluFO8t8H?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe428d17-67f6-40a6-738e-08dd0363a0cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2024 21:47:39.0419 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mZl9ScyIQor5bAGh4hHX+QbvLPVMIIzVxQrcVaiGGUJwpPDowxgLn8nYreE+mhVUTNeCbcG2O/uzR+FCt1HRudS4rBzACpg45BsIDQy2Jfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7199
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
Sent: Tuesday, November 12, 2024 1:41 PM
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Remove redundant rebind from preempt rebind worker
>=20
> We issue a rebind in xe_preempt_work_begin so no need to call
> xe_vm_rebind again in the preempt rebind worker.

The call to xe_vm_rebind in xe_preempt_work_begin passes a rebind_worker va=
lue of "false",
whereas the call in preempt_rebind_work_func passes a rebind_worker value o=
f "true".
Ergo, I think the execution requirements are different enough to warrant tw=
o separate calls.

I could be wrong, though, so I won't nack.
-Jonathan Cavitt

>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 624133fae5f5..756c72cd6048 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -525,10 +525,6 @@ static void preempt_rebind_work_func(struct work_str=
uct *w)
>  	if (err)
>  		goto out_unlock;
> =20
> -	err =3D xe_vm_rebind(vm, true);
> -	if (err)
> -		goto out_unlock;
> -
>  	/* Wait on rebinds and munmap style VM unbinds */
>  	wait =3D dma_resv_wait_timeout(xe_vm_resv(vm),
>  				     DMA_RESV_USAGE_KERNEL,
> --=20
> 2.34.1
>=20
>=20
