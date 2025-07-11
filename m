Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65436C83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 21:56:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26DEB10EAD2;
	Fri, 11 Jul 2025 21:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BqN2ZaSH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7582510EACE
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 21:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752270972; x=1783806972;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cfTqYS+LoXvMaBq8Usw7kT4iivZhywyBcc7Arnf3GZw=;
 b=BqN2ZaSHsduVdHBItgyjpcay2kWI+Pr7i1DD1cXaXznvuuamV8tbu2KN
 FrzOLEwxItDy3uYgwm9law03RJeKNrQcS5cktxE4lLnrFt5EnvmNfrufr
 DYJoMdskAcZB08yAL27qu2NUZX5IyWb+3DB/9g5mdp53C8XdrL3JogQCV
 wptR+jaa2fH6KRY3ktnTGflxqU4s6fj7azlvnpkx+HjUiKGuI0Z9PeqYv
 gKFSdpx8gwqS9x9U7Nbxu+p8eREqG4IyuECLPWxLyKPS56CKfnbMfj3D4
 3hEbWm7+/pXlXxpDnqdxOX25H3wdH/j88ZzciGmk2Y8rDlX+lk+oKjP4c A==;
X-CSE-ConnectionGUID: er+kuC0RRLulpgrHpndPFw==
X-CSE-MsgGUID: hdme9giBSaCqIuuUeLFOJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54701836"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="54701836"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 14:56:12 -0700
X-CSE-ConnectionGUID: jjvb53n2RbSyLxnkIpIGMw==
X-CSE-MsgGUID: yP1/3pIBRBu6txpwmsYZAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="156248797"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 14:56:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 14:56:11 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 14:56:11 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 14:56:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J8NFJ4lpXe/LTJVHh/TOezRfLghIF1wqo6QyFKYbxpYmJ6U/EUeWZzzHNBqSQoiSOoUF38EIJqeBDy3XB/V6x45MTVeAZGnqgqv7lOqWKCgH2qdg06AQDAEQsElTzzpSaJ0BmgLRJbqqHrrUXYL3zx/eoWSs6jwmLbULY0DZIc9PYK9EDxSivz48Xi2EOGuT077eWO7ThaAtHVetGp/g9YTkfOCQO8Z+kc2BSItBDLGEUezSWyxIcueO+G8RnG2V5Q1AE8+Agc1j4WFGfNi73jghJDf35T+sjm53CR/SR6eSZQF+j3BBTN66weFtTfWU33EGEV/bcFM3FlhUwWOhGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXHdEGnGQTkUF6FT+WyHYFJWhgGAqpq7sEciJjZnD/M=;
 b=DWI9/s+YikOaV9usetj6gdWVG32Kv6bIUCFHT74Budel7aZK3MvtxpLaHssowEAxKTs7ct7YBX6Twq+jmduLT6zT+mVFllPKz2fuq48q/58F21nAXpHb+fil5YfPbUJ/222NPK2+Mz/WinRFSY0Nj3g1/ZxmsmyCp38Fys51FdjR4yxcSEMtdClUpwhMmA5cfvgBALin5Du5F+9GdEsI2wBHKSEiEk4OKl2Wb9Cn2ip+mBlQiR0uu4+9VkjM71B4m+HI7iHDqyXsCel6DBVObqPlT7H0CAzN1j5fhRMogRAhNq06Qd7b+si/29/KiDsE3Pf1A3gdw8aKq+xSE0Hr8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH8PR11MB6855.namprd11.prod.outlook.com (2603:10b6:510:22c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Fri, 11 Jul
 2025 21:56:08 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 21:56:08 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Atwood, Matthew S"
 <matthew.s.atwood@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Fix missing kernel-doc
Thread-Topic: [PATCH] drm/xe: Fix missing kernel-doc
Thread-Index: AQHb8q21xu+dh+ZrTki4aCL3tMc1irQtdoMw
Date: Fri, 11 Jul 2025 21:56:08 +0000
Message-ID: <CH0PR11MB5444576BBA4AB83532308C8DE54BA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250711214911.2009714-2-lucas.demarchi@intel.com>
In-Reply-To: <20250711214911.2009714-2-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH8PR11MB6855:EE_
x-ms-office365-filtering-correlation-id: 1f2257b0-559b-45c7-8f5a-08ddc0c5bdcc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?zawzpYdvp5OKHbpixpG0znp66Bwo4ac5BBRHH3+b7k3wlI5VjoE/wAB2F0o0?=
 =?us-ascii?Q?n+H2JZPuBJGZ7c45lCpRE3KZYaPHwn5ka7vJyejLcATLklCCst1cce3eXG0O?=
 =?us-ascii?Q?1DWrypGZTR+xNnij/zkJ6JZ222Yqoln3WBT+KVOsELgpVOHdF2xJM8BJjdeo?=
 =?us-ascii?Q?/MPmxjJFpQPF+G1FJqTK1FbUEkVtSiATBj4sYkWwDTPRspmwXZF3ICJZxX0S?=
 =?us-ascii?Q?47d0AKC7dTaTsgGGWhwVqk1QtWeZlCpYQsRjHvK1AZM03EIY8vQ05TKMw1hQ?=
 =?us-ascii?Q?vw6M0fZjxs9z29BamZy1wHQhcpwK4IVG5rmgFSd/o6jmLCiqFsyUbWFzr3lR?=
 =?us-ascii?Q?jMj3tDv4o8+33rkB3NJpmG4/g4ja1MExt+8/WwyrGfiiZ4khjrxUvGGan19k?=
 =?us-ascii?Q?lYiKTXvOgdkm1zYZvdNYoHSV4R7d9on3Fm2aDn1dcJ3mbOWEH9u5JqzN+plA?=
 =?us-ascii?Q?F20z3kWmpHp+3YlebiLr0J34JcIODUaahvjfKQXAnQ/S0KyCAKhfsKq+4AUB?=
 =?us-ascii?Q?2CFa07SKUkVBVHYQKgI6063fGS1AYHcmryR6rg7c2XHQwa34adq+2WmPCDrM?=
 =?us-ascii?Q?YQ9/TgrLjLUFAt/thJN/aRxdhAP3ZsWzorD5JjQdVcn/YKj4EpXJzsyWk5n/?=
 =?us-ascii?Q?FXz/OlB5pgNL0AfsOEhQfzAzGVLVMgT7L9/Zeka8O8lmi7FdlXiuGZ8v36se?=
 =?us-ascii?Q?rauJzD5jOac4xuuPxOGzulkDBdQ6AcZryr+PHNcLYhm5ja2h5SAXQmogBnUD?=
 =?us-ascii?Q?7CjsaQvNMtTzBtcHebzKO/JNTmhr7JJuGuD6HPfDQbt/H9qxXtVDvv2+1m+L?=
 =?us-ascii?Q?S12YJsrNQHGYmuar3o5Ebm0lXTURW7cWQv6A+3BVhWfzlMRF6RhivcriSraQ?=
 =?us-ascii?Q?U9l8kLEfipSPdomRw3x9CQwj4MJhoJPw1dLToUNMndFYp9vbPqefKAolH5y9?=
 =?us-ascii?Q?jz3WN/zxOuyEL49lsKK59jCMfBQdeSVOOSKzMl5hMZSY8lvS8GaoVHpfqDxA?=
 =?us-ascii?Q?nrnIEfOAEx4kfqilm9XjJ0Y5lJTZrHmzzgPVnKhG7RxHAL29hE8GLkYlpQUU?=
 =?us-ascii?Q?tk62zspStcTLXApEg+DoQe+AbD9xAbEuZJ+Ajdl2eon3ajlerGbKIfxSCilF?=
 =?us-ascii?Q?m24GNnz1zX0X7Lzjn1Gx/p3sUctA6lcmKVyY28VIhtBYZuQt/UKKiCWqt0AW?=
 =?us-ascii?Q?2dJasbJsmOX7aD6ok7AykvaB3UcZ5MUXS1BMKMg+FaWH+COwb4qnpsr0cKBH?=
 =?us-ascii?Q?c8LXPlOFBhLAN1E2V566cDpkpYTjDd8CgXMIKs1+cpBsFDXJApcrzcsAH9dj?=
 =?us-ascii?Q?rMqMgVGFbXZHjFY4rK/shcZY6BkWGVdLLDFZco7ofvWwpPuUB7aJSefUtWpQ?=
 =?us-ascii?Q?qson+fJutMevJF13sWQc6sEyD/8tz3nVchL7w0ltSXLjtHD9AXfzXAXxIwvJ?=
 =?us-ascii?Q?za1si8EUq844JcR+Y/jVp/DXC5zvIeNdjrjvt93YSF4Ph8HaylMPWw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TnG0j2xQ1jP0/OCfxuEvkcRuZj7C6YhWKfCB3AZxtSOOfhJlbdWmjzj8qK4B?=
 =?us-ascii?Q?r5GU5OlzywwCHW0vzkMm3YW/VcHtmXm3W7M9AUlFUTqm2P/gPDj+BOMvJ05y?=
 =?us-ascii?Q?LSalcZX2uk8W8hPZ7et2E75nqdcYGRrFZCC+IxWXFKh601/JBHKsnhR+Zc3W?=
 =?us-ascii?Q?kAslvGFi+ydJu+hvEUDgCvDms9+uhJfC9K3XjezpzrFfhmFSaf0vHeKzzXNS?=
 =?us-ascii?Q?CkvfLzUEZr75WXSdyNscJkWahMBrtQcL7N8+Jxh3pBa5zKybDc75/gvCLLBC?=
 =?us-ascii?Q?sDWYv36K2CYWPW66Ivjmr1Z92AE6jo8KCLVzRjCTYR5iAgF5fpudzzL8aMR8?=
 =?us-ascii?Q?e/DSwmC9FDWmByeJ6pWnrKq553vNIfBbQDqj4T3eGu3KPDy1a98IUir/BylL?=
 =?us-ascii?Q?SxvfrktVzRnZp01JyeHFJewNV99my+ykapTR1u+PMXCcntokpiIL8odpBoRy?=
 =?us-ascii?Q?yhLKdDAlHdEdcg99au8xcftJgVzSDrc4f/YuSqUkIidFzbDVtNm9UUDMms8V?=
 =?us-ascii?Q?WcKcQaObbJ8kCYVMjlwfc2+7qYXamZm6M7OsdYQTGifdhrjJXXhvxcj0emxa?=
 =?us-ascii?Q?bWLb+cxQ5DeUSSGOQ+2Obh+3CAJp/Yhz/TNrD1siJRv/dHZjY+4GniNex4ga?=
 =?us-ascii?Q?UUwH9J6pp6b1P7jWS+cC59yhFvGFNMfgs51aPkv6eGHuKqukMqo7OVKZGe+w?=
 =?us-ascii?Q?AVVQ1pJbH0HiG4VMKfZJrr9VaAYJ1U0RylN7H8YdtY00wCQ1ypBtlr40JY1Q?=
 =?us-ascii?Q?Bqr7OyUG0JtAJpquTfk9pyrIi3L5s/X6EKQq70nQfSzy1M5Sce9KTkSExXFy?=
 =?us-ascii?Q?KR7lDYhjS3ikFAdJ+IeYgdgRMQ68xP4a9KtjBVXB5vR2MAo1uyaty5DJXbUW?=
 =?us-ascii?Q?ktNLdPnpN6+RYWVYrXhFpXWhMdUIk+2v6rlzFVn2FrlzeD9kCOEO+jZ6lgoo?=
 =?us-ascii?Q?l02EpXCmsHFdeg0Qix6zi3YHH81KhAHddP6ADZ07djW8FjIkZHoWpGNeacDA?=
 =?us-ascii?Q?6T8hqNSlrhWz/3/x1MPfTkYnMibKRA3Bji0cN5mz6q5Uhtx2KfRc7jpAJ9Xg?=
 =?us-ascii?Q?mXBdSQoQDP57ovsWLU5HNQuuy+VKEfeqkeLqxCvIMMeqsMdJhUoVzx/bicor?=
 =?us-ascii?Q?2qmA28pWmDwLFWazBORQXiWjqxXGjfv9KlsLOvB87GUTJJW5sqX9je0AFLYP?=
 =?us-ascii?Q?Ey/z4srXHAgKUmTBoSQ7K14axgkkUi84RUDgRuF9/QCm1UueeFc6VuXCLXjI?=
 =?us-ascii?Q?5pzXXIpA4XI9juvNaNFGz3rhOKp4PTt3Tp62mCbspp7k4I02OS/mvBHXEtNH?=
 =?us-ascii?Q?iKiiy9v6k0NpFKk89GI4q5ekV0Q9sq0mKwhK/SIscNBBEo04V1M0hfuDcBin?=
 =?us-ascii?Q?D5WLQO/2Gl4s3DKj0X23HyqGe8/tZNFOAvP8VJxyXiU/Y2Ne9x9veLuX9++/?=
 =?us-ascii?Q?knJhUxAdx0HRf0D6uxvZmbr7v4i/Dj/pNXSKGuB8DkeFCzdt3dzqk7izLAIk?=
 =?us-ascii?Q?XT7PqPq+ksSyBs559Y5PV6XmJd5s+upB1x2bH0DYl8z0TyQEe+eWPV80o3EE?=
 =?us-ascii?Q?oJmzOfdtYQERYd/1AVw7g5dirVtyw6qkF0EU/DNe346M/vF71UulIxIX/MyK?=
 =?us-ascii?Q?TElowtRTvCnKl1fP/N6QpONrWAHWRonLyfE3JvNtDnNw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f2257b0-559b-45c7-8f5a-08ddc0c5bdcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2025 21:56:08.1786 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: poM4q2ti2qvTsp323Q4JtC61QXBwF0N1mF63jKcbFhB0beRM8m1LdB7mMpKnpZlw5XXP1hTGji4Xc5ZY+eZK+xs3K0G/4Y/5xV+lzol6oCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6855
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Lucas =
De Marchi
Sent: Friday, July 11, 2025 2:49 PM
To: intel-xe@lists.freedesktop.org
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Atwood, Matthew S <matthew=
.s.atwood@intel.com>
Subject: [PATCH] drm/xe: Fix missing kernel-doc
>=20
> Fix warning:
>=20
> 	Warning: drivers/gpu/drm/xe/xe_device_types.h:658 struct member 'wa_acti=
ve' not described in 'xe_device'
>=20
> Fixes: 661a6950e061 ("drm/xe: Add infrastructure for Device OOB workaroun=
ds")
> Cc: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Jonathan Cavitt <joanthan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe=
_device_types.h
> index 61d3f473a7a61..1e6ecf1e6979f 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -363,6 +363,7 @@ struct xe_device {
>  		u8 skip_pcode:1;
>  	} info;
> =20
> +	/** @wa_active: keep track of active workarounds */
>  	struct {
>  		/** @wa_active.oob: bitmap with active OOB workarounds */
>  		unsigned long *oob;
> --=20
> 2.49.0
>=20
>=20
