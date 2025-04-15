Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598C4C369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 13:58:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F6310E7A0;
	Tue, 15 Apr 2025 13:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XFhK1nZw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB3710E7A0
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 13:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744725522; x=1776261522;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gJcngbUd7Iua0HI8M7DXEfC9ISYAAC1Uwm5uhMmCIRM=;
 b=XFhK1nZwFtKkh8PgBdp5Z/GOrxpitUU8xMFgbyuedqEJLCO5Hn2Dw/Rt
 6aYFYjolNxO+VKsN3yLBQsSzT3Ol0WUWKVOv8KFp5TZfqUo93mgGL4kzS
 De8VdCX3oMcUZlLVjOcjKyXP5MsIhOUBfXjVsQtdmRh0oVabSJoIk9u8F
 ejDhI7Hw/xbnMgj7BQSAciNf3n7XdP9rWpIc2XFPQ2l9TaLmdkcooqecC
 xuc6S7THTkiambDSI5XIkp0jCzBQ/+tJCPIZENhj95eBLV3za5kqSPSL6
 P/NQc8gmvM0gyTByTzpuB+kFPFYLTx2HnagqSsYKIozAFo0o68CunAQVJ A==;
X-CSE-ConnectionGUID: zLpx/nHySHaYwxkxuiYJhA==
X-CSE-MsgGUID: rWubqhmYThWQO9OA9sV7AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46124825"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="46124825"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 06:58:41 -0700
X-CSE-ConnectionGUID: rzbwNSvKTu24gS42qZIJiA==
X-CSE-MsgGUID: vNx6xZkoTkOwQWA1CruFqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="131028707"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 06:58:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 06:58:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 06:58:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 06:58:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2EboblqG6WvuN0c/HjgLXVT2suYgRCUkih+3G+NvEDVZCBuQVcSrrsMPszm58Gv2tWsSCDCLVT17qtzlAnU7WiHScFjwU6nqC7CvyudnwaUdAelrwgwiCULcxsnGbHin62Li64OTqYjkIGK1Vwytm12ZTf2UXtCLBV3hh2kWnCwF8qLajEc98nYi6oT1v4SRvaIj9O7JOclbnfOh+qk1ebedBsds22U7cXq4ifrOQyKYE3INVyoIP2fN1MJH+iuSRiu6Xofd9iwXP7Rr2x4hiTCSn83NQtIWKj71Ta8O4+SpL9PflvqbsMZ5B0yF0LnMEX5YbyzF+n80xbEq0RMQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frv7ktVVpLFnrRCL+sLZRoTnBU0lb8Ut1bVckZNvVOU=;
 b=eFFKpsyXgfK7D/IYdYpc3ArfcN7ltaRmb97Wv5MciDscgDMQsVV78snC5+7t8sl2Ios0Tm7XjgUxawYX27FBsbiX0WVs0Llkqw7xN857RizBJo1cswtnL8DR2tr/oJ4uJLiEMIKY++NUANAve0oqzz1Zjz8go+A3GUZqMjkJQ+yqHApwh85zHebAMMJhwWHbXAqTb9zfaC6kJm4Iu4zo+bwRswbH75jn/UrpfcX3sBUCjprz36mpHI0lcjr9YJ92EAMuAVg+SGx09ha036lWd9tWVoHxnjj8NPnHU7lW6sz2pkEzh2az2iRvBp4A70HAwlUQiA/LX605DLI5/lGs7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA0PR11MB4605.namprd11.prod.outlook.com (2603:10b6:806:95::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 13:58:38 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%7]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 13:58:38 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Dugast, Francois" <francois.dugast@intel.com>
Subject: RE: [PATCH] drm/xe/ring_ops_types: Increase MAX_JOB_SIZE_DW
Thread-Topic: [PATCH] drm/xe/ring_ops_types: Increase MAX_JOB_SIZE_DW
Thread-Index: AQHbrffCT5t1dnDn8kqzKEOI2awgP7Okv6rw
Date: Tue, 15 Apr 2025 13:58:37 +0000
Message-ID: <SJ1PR11MB6204C35BFCBD1420D251A71D81B22@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250415111523.149214-1-francois.dugast@intel.com>
In-Reply-To: <20250415111523.149214-1-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA0PR11MB4605:EE_
x-ms-office365-filtering-correlation-id: f29501ec-ee39-4c6e-405f-08dd7c259f03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|10070799003|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?EMMc/KA96g3QwCMQZZTJMyrkbfcCCdhlQT8cPGSpJ9Zb29igui7gMN9oSRkw?=
 =?us-ascii?Q?JMmr/MJevXkGCLRn2Nc9txHHcNs4H76GVOFBkmdnWMCzIbrsgj5P4nzth3CB?=
 =?us-ascii?Q?9KcqDn6dFVxsLu66EFGQN5k2vQTGU9A5COdr3OOryVEoKklYv8a/xPMhCsOT?=
 =?us-ascii?Q?OxoSaWcXW+jVQg0rCqansyYoMLbNTnIOXjCWL1CeSjen1L9dEDLiPdeOKei+?=
 =?us-ascii?Q?UKD5BLZRoBoaizTQPoi3F7VSIVGEH+ILgzz/DwageU5T/vLF7rtEfuD5gyP1?=
 =?us-ascii?Q?UxhVjlExuLbG5qOFQh0DER0AkoPMnKy53q4BTqLC+glpphLCyRpbuKes94wQ?=
 =?us-ascii?Q?8YrreS4CpAYIH8UaxLQKAXOdDbQfnux6nyGYixEvXajGYJkHwYusXm4lGjpS?=
 =?us-ascii?Q?r76A1jutVTHdiVknODsTF1EuhxyznKDXzRZG9byxlQFEcTiIRFXKtvk8wUse?=
 =?us-ascii?Q?xPS0/2YArXQTKkoPAv6/7z9aTXu7ANl8GQr4Pk96bw7PLayUkFW1Xh4PowZK?=
 =?us-ascii?Q?js0CFUUDZJM9Z2Au2VdDV9mwtd+lG0PuM6uF3vd7SyM49sx40d18Wc+DDPSh?=
 =?us-ascii?Q?F4cGv6QPbM2aTes+zsQx8SdAAsJVM6Hrq2TEFLlsSy1C6lf7098UEUVubdZ2?=
 =?us-ascii?Q?g7KFOpq47K2hNSIOXZC6wsD0X2vlweZthpfutohJsc8nhf5vUdjsi8R9PW2O?=
 =?us-ascii?Q?Qnvx9xeF0UAiWE0At3XPNMQVZTVT19qvArobwJPVrTFMCrINOZYCCcQEir1l?=
 =?us-ascii?Q?uQ/NwuBj/lhJcorhfZKfg2IGqYXnwGme1ieH6SsUg2Nkgo1UHlRPHzhwnPMq?=
 =?us-ascii?Q?ptaGKSJHGoVUtdttZcykpKHlYC/14IN2OXQcQHuCXJNtJaP2Wbd8Q/FSENCN?=
 =?us-ascii?Q?lZ8LdXq6M844J0fqUksRWzepcgjXcUqhffq9QO3+F54a1Z08fgYT2qEk64MG?=
 =?us-ascii?Q?UKFzokcC3SYVdnJ78tTFWVhbm560vbBS8BlBUrvyFIqTbdtientHcYxq8rwm?=
 =?us-ascii?Q?0dX0ODHnoUSdMkplVL6cYVGOWXjMN/NOTvuadpHPmIdYy+YQYExrhtUPyWKJ?=
 =?us-ascii?Q?FIAm9sfUPe4C+QSKte7PBpdmxCR7C2IZdmyiiBSjp7xtv7/32JqGXJvaj2nz?=
 =?us-ascii?Q?2XHcfyv2a5cjC1epbSvuxIm5wd+gog6A8mF3GgzIHwcEVrhq6Big4Jls8gJG?=
 =?us-ascii?Q?x/RHhenQZ6NX3MkLgO1xpTnei7R8errk5wgfn/R0Q5jg048AH7j8wcmehgt6?=
 =?us-ascii?Q?U4EZtsmpzPlCL3ZTjbw0J/ZLDxUCTRxBFnadiv1u70WBSnW9M86OaxklqB06?=
 =?us-ascii?Q?67v6px/iapxKuRDyAp22GRAF9EcU+bf5TrHQ1Ib0eo/pmWbirkLuwG5vIoX3?=
 =?us-ascii?Q?v/5hxSurtna4KE2ZIGQvmgR3091K8dMX55IYU7WXfTZodyuF8i3pyvsvvQeZ?=
 =?us-ascii?Q?DtObjNRD68A2bEldCJTXy9ZmQQvau/EHS7NIlGdaphfvHCeULgiX2i6EB0sW?=
 =?us-ascii?Q?+fw65+xaH17sEx0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?07UYV8nrkhhkYoMJFu6KjVCojlfeosYb+ysRu8e4ZHvTAjkt0E5in4DE/X31?=
 =?us-ascii?Q?RXGwdU1LSZrFVcDtse5S2HPfxF+SeHeBVOqROiYjHNE/J7/Sqfmqmn1eccfu?=
 =?us-ascii?Q?AF35WI2qVQqGUhUpAarIpR4nmExR5Q/Z/immlqJjH7XHC8bc65oLkV29AqNg?=
 =?us-ascii?Q?q39bTLW2IBG2lE5d+/V3+ggsmsgSnBbX8YBscee7wHrvn7ilegEfRTy8+Gb5?=
 =?us-ascii?Q?SljmkKZN+RDMzVueIUZIUdoZmSXIGGLHTLd6swomUZ3kXlTdxaxs5REdlAdr?=
 =?us-ascii?Q?TrJ4hD1z/2J9ub+QQNIugsXtHAWYixVCgxUf8/khHEYRbFsK7E3qPkGZF837?=
 =?us-ascii?Q?ywIjaoe+xRvPGuKZ+pPboHc/gzMLmGLTbizgbKqcxkWEFXN6mN4UiBp1Nv5P?=
 =?us-ascii?Q?Uih18eISQvnZmoUExirZAPBKHwmaGHo6x4NruX8Sii3+Y2NMF72YBCK2x6uW?=
 =?us-ascii?Q?fEqSqyD9c9oLlFeEDNr1cC4MPE93tvDBU6rhe+Fw98EyBiN1fZMeY/n+HpY2?=
 =?us-ascii?Q?mz+m1b84QtIBGIAs5BYewQJ9F5f+FueWDC4EYps5wKM8/BNIzGlLnqSEYMxb?=
 =?us-ascii?Q?GhLcqSyiNiblz8MRt23CKD5OVjBoiv9v9pPUy5O6zuDZAOZgHlB55Iz6IoqZ?=
 =?us-ascii?Q?M5UcZcfZc8eYoCEjxOp601u4xrh7pZk/PNqWHeqGJbJdFlUKSg5ODkKrV3nb?=
 =?us-ascii?Q?37yDoXSQdeT15BRL7ca2Op4RK16l0PIMeKIvSxkgjemLPh/bhfOj39S+VW3H?=
 =?us-ascii?Q?SMRt9n+8Lr3HtyeSjr6kmWcxz7FzMloU89o/W1te9ePHs2t+EYvb44P3MNR2?=
 =?us-ascii?Q?sCmSp+5nzaOEQcRnIy8mrqygPndSOWv23vjRCr5A1bjKXAFafTN7def/40br?=
 =?us-ascii?Q?GbCn18FFHOnl5IScQvXpvY1IbFPgnS157gHKuhfb9jMIHrBYmex+zovFHM9U?=
 =?us-ascii?Q?+uaCllKVkBuAiCIXy8zuQ3jjIBFDWbLeWpBQ5Uvs48S3cMpO2DrNVUZcu16T?=
 =?us-ascii?Q?rFEsaRGcXcT3KSBKTEmNzfg5ZJdy+oQ3ZMkstsSSybwtvr8ZoLc3KvhGS5ba?=
 =?us-ascii?Q?3VZ+pbq8CjFgiFAffF6H432yW1/3XQF7LVEHhYB7Q4t3sGQCLo66fxPBmkOs?=
 =?us-ascii?Q?CMadcHAtsyh7cQbbwDFXA7pAOrJTJtdf1Z1eGNKGYjlVQOLA6U1RfjtWU0o9?=
 =?us-ascii?Q?Qmw7U1zt7Olb1gHTH+IftUGnDr0MSKR4gDXFBmaDmUjJxYqGDJSifju0BodA?=
 =?us-ascii?Q?bGENaJhJ30GEWgbGs2fv4WRAOY+b4GZE47jHthIBKLH0nmMOr81z4RtvX6d5?=
 =?us-ascii?Q?3ZSiakN9pMOkTQJ8W1K1S8Z/QNjJShOhAMRZ8++DPAGcfjYL3rPjkNCGh5mA?=
 =?us-ascii?Q?sGS3ZY4WxwUsOkCVTrU3ieo6ZlnsD1YrJm/v1dHEBck5t2torB4mT+rD81Nr?=
 =?us-ascii?Q?3Q0H+sR/FPyBzUjPt2n2MxhWrp9n6Hb7tiqRSSfKlmWugwzBVHNzLq8b6VYB?=
 =?us-ascii?Q?TrB9WbM9QP8qUJXllyaq1U3X5k1TJaBSOOaJCFcEIW6TiXd1bxR69QagYMnw?=
 =?us-ascii?Q?YAif50jKv0n4sjb5yZGrN0dCqYVkCFTjuNBXIOk7TCc++KugD0nRHCyYf6lh?=
 =?us-ascii?Q?yG/YAzz/cNtfbBSrdBIxDbRG4JrJtzbUTGTP5kpX4ZSd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f29501ec-ee39-4c6e-405f-08dd7c259f03
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 13:58:37.9734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5gb9lZ5r/esWmh/mDUpITh/lQoiRU21BiwwYiEkMovMBZEs0ge/qRTjaFcldil2a3YHcoW+yQst2VVIqIezZWVRKhSSPizV/6U8UyWA0PLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4605
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
> Francois Dugast
> Sent: 15 April 2025 16:45
> To: intel-xe@lists.freedesktop.org
> Cc: Dugast, Francois <francois.dugast@intel.com>
> Subject: [PATCH] drm/xe/ring_ops_types: Increase MAX_JOB_SIZE_DW
>=20
> This limit can be hit, for example when running IGT compute-square on MTL=
:
>=20
>     [   63.582385] xe 0000:00:02.0: [drm] Assertion `i <=3D 48` failed!
>                    platform: METEORLAKE subplatform: 1
>                    graphics: Xe_LPG 12.71 step B0
>                    media: Xe_LPM+ 13.00 step C0
>                    tile: 0 VRAM 0 B
>                    GT: 0 type 1
>     [   63.582408] WARNING: CPU: 0 PID: 2439 at
> drivers/gpu/drm/xe/xe_ring_ops.c:395
> __emit_job_gen12_render_compute+0xa7c/0xc70 [xe]
>=20
> Increase the value to allow this test to pass.
>=20
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ring_ops_types.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h
> b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> index 1ae56e2ee7b4..121279c826eb 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
> +++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> @@ -8,7 +8,7 @@
>=20
>  struct xe_sched_job;
>=20
> -#define MAX_JOB_SIZE_DW 48
> +#define MAX_JOB_SIZE_DW 64

To me it looks like this limit should be handled by KMD itself. Any test sh=
ould not be able to break it. May be your test is triggering some optional =
bracket in driver to add those extra DWs? DWs used by your test is not coun=
ted against above define as far as I know.

Tejas

>  #define MAX_JOB_SIZE_BYTES (MAX_JOB_SIZE_DW * 4)
>=20
>  /**
> --
> 2.43.0

