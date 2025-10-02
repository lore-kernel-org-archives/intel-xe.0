Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B968CAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 23:34:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F8010E06A;
	Thu,  2 Oct 2025 23:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NZm3g9Ln";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D94410E06A
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 23:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759448073; x=1790984073;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jtcatV2hE0xWvdtMpoi0ZXYO624CDCQ0WEiRbEZABY0=;
 b=NZm3g9LnDva06JS1rtR/MLoKniYlXW7l7y1u9rfNr9EyHV83xgz4VHLy
 8XJMAJSNzOwqq7p4S8M3iE0cQrxpo6Peglz7biDT21y5ZrtiHo2YZMTqs
 tDCTev9UfVBM6LnKLxvIyg3WyoeQ9jk0hlr6oIUZ1LQqV1lfvKme1SMXt
 rQXMbPeisiedQh+jWo2ypCrsvrbDmG9qMdjgia+eW3K3gN68hbFZnYfGv
 pfa7m+Qe1TkHAzpuJ6Jsv6CM+uNoOqq+3WcXw0rtPNo0pLBTSxJVNC2g6
 tjs7/ALRs8FCc3JPvgjoJke5IREjsl7II97+1mMrEZC3tbYXqQD2ZVz8h w==;
X-CSE-ConnectionGUID: Jkg9QQwpTlaz/uY9JNYpmQ==
X-CSE-MsgGUID: 4IaVHuK2QjqNo2srwt19+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61783623"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="61783623"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 16:34:33 -0700
X-CSE-ConnectionGUID: AlMmRnfeTz+GgML9NTByNg==
X-CSE-MsgGUID: NduAKq3hQ6Ka2RswVEHFjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="179105666"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 16:34:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 16:34:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 16:34:31 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.33)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 16:34:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODzMBwxuF7zJpTJJfOz5s8yi6INQLasfKe9xAHSLJKz9JBt73WKhnIQR52CoYodrFepFpqj1FMXH5z3Il3vcj+FGkweOoZOV6pRB72ZAcG3kCeh6xiqXzh9iGS2Leh64aC7DqJ8qDc8VTKVDDlrYOP1dk4a50Wc/VAON5CvYo6v51lFNrKc/gGT79t3WuSO1TNXR39IIt1XmIYS0MxwQVzBD+scwD/VI1GF4qg6WIzHMJ8TokTP1497V9nFfm4LTsn3/ugYMo05Cq51CJdObyKFVgP0/UesmylexE1/+X1CYQ+mMnyidTv+uxG6Q5hgMHODf0cy8Hxuf9ZPOfMLjLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WR866aG1fw1MKlJVn9Rr0+llXWDxzcr9Yrm+xNq+qA4=;
 b=UbHJG5SXrJ15MH5HwVAekJa5xSBiyvZq4vL82m3mbRG3264JQ1yTgKnOO1v4jfzXWbI+rwh4gKkdBm11YeZ4tHkNmBzq4+ndrBGeEocPZWT0xX+TD0CYrDEkOGoWtsjc1Kmff8Jh40uVoD3R7lE5sQsol2enzzwSaxZ+WnoyOF0nbq8V1ZKR0JCky0lUcy7gHPppmxFTjWoevXGiO6IMPABQowtxW1rtRPC+OtpBKmVWCGMmWwhrr/5jPYX1xJD+LHo9N1NuQs+ISE/zSND2dKcQhFXue8amZHKrFm0dwAjyn65ciiXSoP4fOEdDrBz8WA5lotxDtS1Zt1W2cHsPdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SN7PR11MB7601.namprd11.prod.outlook.com (2603:10b6:806:34a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Thu, 2 Oct
 2025 23:34:29 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9160.015; Thu, 2 Oct 2025
 23:34:29 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH 5/7] drm/xe: Handle missing migration VM on VM creation
Thread-Topic: [PATCH 5/7] drm/xe: Handle missing migration VM on VM creation
Thread-Index: AQHcM/EBIxVnuXlY3USlPCAWyMtmNrSvgJXQ
Date: Thu, 2 Oct 2025 23:34:29 +0000
Message-ID: <DM4PR11MB54568D4AD095B963ACD2442BEAE7A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251002230444.313505-1-stuart.summers@intel.com>
 <20251002230444.313505-6-stuart.summers@intel.com>
In-Reply-To: <20251002230444.313505-6-stuart.summers@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SN7PR11MB7601:EE_
x-ms-office365-filtering-correlation-id: ee1f3ab0-20bd-4081-038e-08de020c3b59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?WxpzCCr0NSz64INxtEKihrjrgsC894pmes+EPQQCbYu+NYkFY0s5wNuy34Bz?=
 =?us-ascii?Q?C0286JiZg0dZ3Nh2ps+e5wCSuC0a3ItYtnSbG51cW7iIyF46/LQ6qHybkntV?=
 =?us-ascii?Q?IrtWZE2op1FhkMj0EwZDBVb0AHrB9dIc1micUJFJxBCQ5P305/mNtw+CwVqq?=
 =?us-ascii?Q?koKSlOpzJ8rbPxDG7NvW+vK5nQMpAWCvHO8q9ldpN0uaZgdIA0/kyB7eFh6V?=
 =?us-ascii?Q?3MjFrGfsTmBcGvUmWuTwRiNNN2JQSeO7UnV9lBHQhGJHG44G8IOZhDZCDHvc?=
 =?us-ascii?Q?FQ9dmtbTwzQHHyr4BUw1R3UoNC9eMk9Uq+inZJNpoGBRGMTPeNKVaMRjm6QB?=
 =?us-ascii?Q?2ajR6kHw7C8sVakTiUFuJyCIg/U2adw17RXoXorlSuOM/aXfiHm0zoVWmLvA?=
 =?us-ascii?Q?wjG7CvWUYnU3ZTCfQecy85nlJfO3by3cuovOxT2uQpveje49mUa5etQ/FLWK?=
 =?us-ascii?Q?iZUrT9LG7C9sCuJfEiPCx3OWVgjHQlGlHUsJbbYxRRlmlFN4ifBr3NxXY8Ca?=
 =?us-ascii?Q?s6KfULlG+Ju5hdtFzTHkYF5m7U8D1p+zfc2weVVAZZZlCOXBL4S8ocpY4S9M?=
 =?us-ascii?Q?um2oc3MDI2yNUcFilsqq/vLc1MxVy2YnfDLha++UAozaHua1WSHXx73my+ns?=
 =?us-ascii?Q?z2S/B5E9MD35fvxz9klXncpyt+QDejm5S2utg/NG5n4iPvhCDwZT6aXv42u/?=
 =?us-ascii?Q?fbngOTuMjdrSsOFaoMgCMafv9VUAhJvFjxVj6z93U6DMfCGPR+uzo+sSuXP4?=
 =?us-ascii?Q?nO8WD+VyrUWNrzkIZYGGNY+Td1+mL5eUuRkZH+4IyN5gqWC2FhkxAKGFR8xO?=
 =?us-ascii?Q?o64gfLlwVg2v76wIBjtsF0lU2KEXRR9Qnd9SpANig8zNBNtPUY7hqWS3yuYk?=
 =?us-ascii?Q?/xr/ZNwFVoijATKgQ4T2qYk58Jt/87XryBKNEQYNZu+81UpmeSBDBWTwczZa?=
 =?us-ascii?Q?F7f50m9Qw4tvXW8InC32czRujcYpZew+LTlBDej60psJ71Vi25fnFjXQmHYp?=
 =?us-ascii?Q?ZgKtEMlnmcHy7kTcJ5gRG+gd76/41sjk5IVFsia4c0xevufbq0bbsaJsLsL+?=
 =?us-ascii?Q?4jYFUAYAAGfhxv1DNqQPgbpn88873JKVGwVexRMJQZ341M3P11rh8EnljQi1?=
 =?us-ascii?Q?rDE8uNgd7iIHvhKqTku1gbS/N39+ZXdrx5jVgS1SnSKb5aoKJ1v1Hf8w63fy?=
 =?us-ascii?Q?a7feSQp97NfAGRkI8VAhkQdqiBUkG+ryVrq/RrEQ8/3SsgB7nVwHLO33EZRk?=
 =?us-ascii?Q?u8fXYoxRPqERlM+djr86mEgi7E5xpHC43VEZxvCSUj4ZpWABTr2Cg33TmIJi?=
 =?us-ascii?Q?es0vECYsoEToACvqSCFCXdZPzxHeemwSRSmQ+n9snCzMs66Djpmu2lDeGf97?=
 =?us-ascii?Q?qIdjcJrs+uwwiVKW7YCGmiza+y+TmUILRxevveYERxzL38XswDoRKfz+oYj6?=
 =?us-ascii?Q?v1N1YycpsIDLmpSlX4b2y23n1bS+wb0QhMvhg1NSdRZ+AY2fKy0NFxMuV8ak?=
 =?us-ascii?Q?5ztBa74D96CxMPnGousHGJvo+5ofF+mbxpKr?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BAUpX7Kob2SLcBlBNNv/5g/1fovYn4fub1XzyIPFvBhW2MkW0p8icHJJDLpH?=
 =?us-ascii?Q?ZE/luGqVQDKr/9wz14i5Z41YyRndu2D1qloCd3eUEDCNZUZ1T1wEnmhG1TGF?=
 =?us-ascii?Q?l9TBBV7NzUdig8cdAimb3CLpM5I9PUv4yC6Mj8iP8QJdfgLtF4RImKtZoDAc?=
 =?us-ascii?Q?WN6oGN+Ww6FTM0HCfEcCqLba42ngOkopzm7c72ELvLT3rrtt5nh3nzn33AfZ?=
 =?us-ascii?Q?SAVVy0LvFIKBUozTI9BWOtOLcu5bdLIluBFQHMmx0WsKspsUiYU9sKxCbYGI?=
 =?us-ascii?Q?hjUlv6jH5TkesoUffZX76PwVMoK8ry8Q7JbI8bxh5PBv0Z12qy9Xf7s2kd7t?=
 =?us-ascii?Q?Mu0bgUqp8V48jlIFbnrwY0Wf1ROQ/YA2VWaPdFEqAhmeO/l9G+9UDZ6iJNqg?=
 =?us-ascii?Q?64C1XG8Kret1Rw9uTqwVVXWbswgP0SFM9NvvOIurSUEWkESBrlp1DPz5OwuA?=
 =?us-ascii?Q?KQm3mfxaW/qjHKFtU9u5wjTJ7NEknQKfkdANpdtDkUpaltfPtmJwkp92JTX/?=
 =?us-ascii?Q?nBuXqhHaOjjBBqJqNZs1HWcguFdH4XM0rc0IAqm9ZvEiBDg7lWcAMFWFkWaJ?=
 =?us-ascii?Q?W6VGDH02zuew6cB6hEMcvSYVMnjKQW8LLDVjlkstMOycyliSuEFeZrQwXSwV?=
 =?us-ascii?Q?6aPPI3Iq6mLeiWOUwR/KTgEpWO0B1tgr5yanFkEIQjW1uTSabdlLf6xlKpFe?=
 =?us-ascii?Q?r3m/ST5a/fU3d+IgTGeymSDefGtRj9kodVkLa3f5O6MlO+Rz61MrILX70AxI?=
 =?us-ascii?Q?g/uPqxoh96DNN/XjNCClKBBSi9yB0X1rVwmjf9F7zpdkYH7vTC1dhlK2LbgK?=
 =?us-ascii?Q?fDFdJ5OKDz375tmIsCuWpikMpuVrnsu9Zp3oLlPNm9m7Nn7+LqLpqQ5APigl?=
 =?us-ascii?Q?Lbc6JeE7Amxg3KVN/Y0v09+FVPO/Xm+wxdBwV4k+NmWfQ79+B+EkGpOKwBVB?=
 =?us-ascii?Q?kOhqNsiGWBgGjK/rHVq57RBgz7qvuDoufrvVfYwxsfX2JjWHACmIBMFLOXOU?=
 =?us-ascii?Q?jyv9PITa9311UDX5vJuTACis4QafBrX5rSKAthm92P7TTe+54zqqqbSQlv0h?=
 =?us-ascii?Q?vTlIOTkgcT7YwBPmfupN8+1ZFisvbtZnrY3/69xO2IFs+3agFEtVhCs6Sm0k?=
 =?us-ascii?Q?aZLGcz+z1SsfDOzWewqUqDcMFk6hZxGQjXbmGsvebFa9LOFgvxamSbf2uSJ9?=
 =?us-ascii?Q?SpJ6rNBAY7vgTveMcUWCX2McmIKDGjd7K7M7A3e5qlHaOSKiXlqgXHR9DWEl?=
 =?us-ascii?Q?zXNfFojy1SZO7m3xwueuWoYBxbhsDBm1rK/m4U88j1e5qgsYioQWFhuH4H8h?=
 =?us-ascii?Q?90oDo8o2iPlcquadRw5fmEbkj5cGOUD5ApTRZf4ZbHYyV6LmJ0u0+xwQRj4z?=
 =?us-ascii?Q?gLAI9yMnfISK3z9Gio+ktLo4cgJAccnqgSFzgTZ+thk1BPdR1br/sftN3xdM?=
 =?us-ascii?Q?XSZZMOzL4ukdGU8VE/MMcld0Nw1iIXqIZZMc+8G/vRz4NXbrhPuofboXk0IS?=
 =?us-ascii?Q?0ZChDFegN+wi/4jPbzeZh62WIjVlQsvbGaCZ+WdmozbkZlYXZPE3zjq0CEXL?=
 =?us-ascii?Q?FDuyYkmp9n1yk/EAEl1WwilYxqdSCES7RGHgpAFv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee1f3ab0-20bd-4081-038e-08de020c3b59
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2025 23:34:29.1372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cnXw1PdfgND6Zas5LPW798hPvrRaIIp3v1UjvGehkZgem5gFUmNh/jmuVPQVuGuE+mV3D9kfNI/hMDdfjDmwHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7601
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

On Thurs, Oct 2, 2025 4:05 PM Stuart Summers wrote:
> Theoretically, a user could attempt to create a VM while the migration VM=
 is
> for some reason being destroyed such that the xe_vm_create() routine gets
> called, but when we assign a migration exec queue to that VM, the VM for =
that
> migration exec queue is no longer there. Add an error check here for that=
 case.
>=20
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> b/drivers/gpu/drm/xe/xe_exec_queue.c
> index c31bc8411a71..6baa19b8051c 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -326,6 +326,9 @@ struct xe_exec_queue
> *xe_exec_queue_create_bind(struct xe_device *xe,
>  	struct xe_vm *migrate_vm;
>=20
>  	migrate_vm =3D xe_migrate_get_vm(tile->migrate);

If migrate_vm is NULL, the xe_vm_get() called by xe_migrate_get_vm() should=
 already crash the kernel with NULL pointer.
Should we add the check in xe_migrate_get_vm() or xe_vm_get() also? Thanks.

Shuicheng

> +	if (!migrate_vm)
> +		return ERR_PTR(-ENODEV);
> +
>  	if (xe->info.has_usm) {
>  		struct xe_hw_engine *hwe =3D xe_gt_hw_engine(gt,
>=20
> XE_ENGINE_CLASS_COPY,
> --
> 2.34.1

