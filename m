Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7452C83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 19:20:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B15110E117;
	Thu, 10 Jul 2025 19:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l5NhzxvD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF9610E117
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 19:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752175224; x=1783711224;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HVcz+y84SgAwHlEgD3CVmwlTplP8BmkawZgGUHctRjs=;
 b=l5NhzxvDxG9vxWw3G0bXRg4eCSOwECfz9IQ20xSCSHuzeTKChWNZblMb
 Mi1Rza+W0rFtOz0T6IIrwxnkwLo9wiMUTA8Lw3eWv4407EWT2ML7XvCh6
 OpK8m+w3umlWJLddBMExjFZjWTypIV60638j3hbiEzDBKDHJJeN8knohG
 yid8IOQjlCEoiR91s5fKRKrY4rfOzpEFzkN+4wQAbRmhAI0qSx3n7PaC5
 LBJId1lgHzNQxaqPfd/X0yocsOVpv0ykfSuyiAhghxtU/eAhX17O9smGq
 Erq/pHI/LcqUQkEGKZtc0QBn2imkRmF7M+rHgnFAvJTmk2AczYL1Mxm0O Q==;
X-CSE-ConnectionGUID: ScxNG6n0SKuU/piBMEuAmg==
X-CSE-MsgGUID: Aza76ovqS7SFq/AOxzxO0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="65530100"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="65530100"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 12:20:24 -0700
X-CSE-ConnectionGUID: 71SEedHGRxOFqcZQrTITzw==
X-CSE-MsgGUID: nEYsADDrSZi5f4VgtlzbYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="155596062"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 12:20:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 12:20:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 12:20:23 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.72) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 12:20:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iw9itM5vdq5s/JfCsmoJoou5E04D6AQL94H22tFmRZs9jjK/sN2+ko1oy/tDj1cUdGaUUCy2Xdhk3kggsbmDXc2I9Rcd3kUyADHPxF5X9D/Q9CBLMAfmYsDHsxvkE2ET+EFMbY8FDaFDYY1QUfc078yh5kJe7prUwgOCv4O0dIUuDUabwtWHx3Xs036iUqeh7oLeczGL0aD1zMslSHBp0Y8d4YvAShhrsZPLKdXLJCMvcyUYsATrNCW8BicZ2V9wJcw/vMQXGf9nZytIttYXb9OVDdSSfNFvyP5EP1gJ5AqCbBGYQf8PA+DayLFcb068XOzY0rEFLwGw0u9giK09mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7bhnBs9YFPreJkdK0QuC1RTsOeuFz9bytHqFCIpMy4=;
 b=qGlxDzCXFq8ujCFNcYl6l7UJuubq2I7jljd97ssGvnC6FzU/rFNUL32ZgH9iW/JOuDK2Lqkrjq8bTBJH5WBpLKexwDIJZf+Xfyi0XeucKftDNa6astYgqRhQfBD0FDkUgpBh9eBvGlDp+Pga0LOJUb/o/bVowwRwF5ZUjc4Wb6wlKmMLAFJE/pVozNHFD9Nvf1P6jzyHx2QqQ0CEHZITY2/2ha5uMkh2L2qdOp3HmqaoUX7gRFVuYYxKoKiUC+Zva5SskrVbZxY4+WOaZGyOLDiEhorbeIpqWUHQFzaozbSjBWQ5d55eISp7DLD/jR/QQASkP7uKVIqdbgv+5IzEsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 19:20:18 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8901.023; Thu, 10 Jul 2025
 19:20:18 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Move page fault init after topology init
Thread-Topic: [PATCH] drm/xe: Move page fault init after topology init
Thread-Index: AQHb8c5cmwCmlfvpFkmDnSpishaWtrQru2aw
Date: Thu, 10 Jul 2025 19:20:18 +0000
Message-ID: <CH0PR11MB5444622C6A1215022BB7286BE548A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250710191208.1040215-1-matthew.brost@intel.com>
In-Reply-To: <20250710191208.1040215-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB5995:EE_
x-ms-office365-filtering-correlation-id: 7f55c9b0-1cb2-40c9-245a-08ddbfe6ce84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?TC7ib8Dyd+uZYrw4jbhHwMjqdlSHve15Wi6weC2L4JLx6Q3Yt0eMhrU5SbBv?=
 =?us-ascii?Q?U9tooBs+TDokaNkFhC1W0Vf/Z4xyKyK3M9h4WRonskuZogNV6DAHHAW0ra16?=
 =?us-ascii?Q?b/Cpe3rAtfbOnC4y6fW1EhbaDjn0wbsBhG3rCIttUthqBAE/g5RcWzOLJFZJ?=
 =?us-ascii?Q?qGDFOocO+yqdDoMOsTDqTDUnSgm2Q1bn7UR+ZdPW14km5SVLFzKvgsScrW0D?=
 =?us-ascii?Q?hmRVn5dZrRBFIzt8dzmD4ee5qh6ZM3fVp5fAk8DJFzbiTpCVfIaGPNzgaQW9?=
 =?us-ascii?Q?6KaoK+qWx7BN/vE30ttIh1R3fDSJ1wE235V/0CgUPf8LTX4ETJxcjQOGag4s?=
 =?us-ascii?Q?LNAwEupREX1vNbxoYeSi7MU2fW0qmbv5hnuOPFEFFL9LMvoAcDpmih9dx/wQ?=
 =?us-ascii?Q?+oltnevWtq3knCaNpy35NxRRVJvGZBqw4P7f+MyjVzr6OK37iooDL9/UPe2Y?=
 =?us-ascii?Q?pj84OUFfMpYtUrxrId1+qLZLRl8e5DJmFmS3iAA0LRyLusX+Pl5TFcHFNJJC?=
 =?us-ascii?Q?8dmCyAD+elltRTQAtwntA2h79Jd5NZzcCp/W4wXZTp+ssk4FD10e0aTkWVJ4?=
 =?us-ascii?Q?tLn1UdNi/KdZnHelhzxfw2fSRFPkdsyjDJ1Cdh1hEKbcNie3T66HgXCzb/ia?=
 =?us-ascii?Q?sqLVRNaiwBrQ+sjmxxKO5upxoGjCH7rWIocI5CREdvuqPjnUAAIqAd/2SMxO?=
 =?us-ascii?Q?rARaZcgCLpluMOancMXXxRhEjJxZPVjf31vZY4XpsyJQ5a7DvQTz77HTuA6L?=
 =?us-ascii?Q?GgSez131jIQYMRwtSqM29KIobJvL+IBWMKRBeoGlVsCyUDE2s4ZfmsJMY61r?=
 =?us-ascii?Q?6A7GOOptPjY2td+uuK4yeYCNPIRhc0R8/3Tf29eTyALlbyuxh2Y08QjKYt2P?=
 =?us-ascii?Q?8n5GDZuGw++6CaIf08X5jRm5hA128ecCec+pYGxdIF0ib7ZeVMSrrudOXhTS?=
 =?us-ascii?Q?1UcQ78j0e8ZdtYRBtT/aMhwBFDKyNRTnnCV9m0UsQFX4U1bLn0L0Z6ENpoki?=
 =?us-ascii?Q?wO+A3LZhq+/eBjFNiOQXFFiESFkDZhYYN5MM0zX3tOp5f5tkJVRaA5icLIdF?=
 =?us-ascii?Q?MnPh2yT7D8D5VMdkCWT1IWoedJMOf1yD/0n/PVS+OWbdAIv9LIla4+0QybjL?=
 =?us-ascii?Q?j4quI8YFKvOB/54UISB1z8/noXYyMM7w2pWPj0DP3hZh+/oOcEYE8+dA8Opc?=
 =?us-ascii?Q?T5ddTQwOOMFhzzv0CfeM0azNMt3vRmjVv+Kc9AZyEUUhUxsGIIsy2WLNcuPJ?=
 =?us-ascii?Q?JikRc7SknVscizBwzeahGeMpVOrZmf5G6JsjF/8XvFUUIqQ2X3K52A8s4MyR?=
 =?us-ascii?Q?UfaTILG4ToBqrQX2l0YM/nwahVJ+gsZ4cHAPNEbueyuDUNev2gDr31WxdKjE?=
 =?us-ascii?Q?5f5fQV/xkyQD02PxhLBNIN2GpNgGmRyPgRzUKirtshLvqQiC/VQIy049PYD2?=
 =?us-ascii?Q?GYxJs7PmvcVWSjtseOtVuxcUMuAgz5rsj/lceQEoEB43zrGfsNh7Jw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PYiWUhdAxRHnW9dgEgOKugQsQAXZrskBKBPgw5vma89lbmk1kCg2npWYIfx7?=
 =?us-ascii?Q?rK2sbKzMVYcxEHRL19gHIclzfwbL41a1ePDMIaikNv2wvesgOx7ftEDaYfql?=
 =?us-ascii?Q?A5eocbofNz3cegE+AtxmqwhPeLAUsjKO+t8pNL/OmeehQUYh9vb3HkrLd0as?=
 =?us-ascii?Q?FGnVkc7Hp1L//0vQQaeMFNmVbtjR4GGTRghB2WDC4Ee9AHx8rgGVamg9dk54?=
 =?us-ascii?Q?oX4ll8D0cLDn9d1hFuPzw5E38amh+PiDMed8lhZLKc9hl8SZbGN1no8QFZGi?=
 =?us-ascii?Q?YpvM/r4DJEYavzcNFDcgxgADlrCnHoaNuAI4OVhZgUlVlzBqbt+nipgbsCrV?=
 =?us-ascii?Q?Mx2q9khX3py7+AqxBo2g7RTNeu7sVQkOh4OeoP1oSy6wSyFbbUdoJslL6qb0?=
 =?us-ascii?Q?FBysiYHm6uF8JrI1hXrupF9x8BhJGPApyCn/rm5bOhhpcJX0PBv14wK4qKBi?=
 =?us-ascii?Q?vZrUNn51PjN0eYONwJkI4fgGgrgT8seBbMBYN/+KkrBdwhiJVuk305EDadIC?=
 =?us-ascii?Q?qtZ5gGgUlkjF1fxcvFFHbptHZPv/ZLabcXYXse2k4ItCxWWtsJopKYy/9F4Z?=
 =?us-ascii?Q?hpnhtRiU5iMl816aZcoMvjZchQXf5bqcNDritHPRv700jr70QQREPun05s+3?=
 =?us-ascii?Q?If35opYYo3eOXJdojyvKimPUsewB7Di7lMuE/5vk5UtCQmH0osYbGNkJQhQu?=
 =?us-ascii?Q?O3V5ErODy2bnnCIJmsPnwLlJ1vF6rxOwL9imNFGf34tiD9+kzIavS8SG++gL?=
 =?us-ascii?Q?ocJ8BzYLVGY7ssIYFjVCKtWYnDTJ8UcSJ3MYaU1Ym317eRzleXZ3QPrhhfcT?=
 =?us-ascii?Q?GQVE8go6i0QwwfsAN4sz6142xW94qPOfrxej1NMFAVijfl2ZMXNxlQXgn8Km?=
 =?us-ascii?Q?6k1wI04cPJZqUzYnGqFirBJe6/Sp4IbrG9r3WvDFmczS5TOo927/9mvXF2yN?=
 =?us-ascii?Q?5SAcxk7VgNawNN0LH0ltuK4FB6iJ5PHhRHqXfXxdAWuRthtc4yaVPRqEpVcJ?=
 =?us-ascii?Q?h/J22r5QsmQtBhsNM8RuZyhaRPKVt8u585lX8Ix9dWpfyg5DJdxyTz48Sm8A?=
 =?us-ascii?Q?UEQToB9qrPI0LDkkJ47K4Vknejg1+LRIaXXCFQIqBYi5cTmLf1TsEXhGOKDF?=
 =?us-ascii?Q?memiOkq75Pf/amTkuH2xr9Dur5IaFclQFu72Bq0vcE6CDxDzobCI3OqKC7B7?=
 =?us-ascii?Q?YXEBe5dLnAnb+u0PKTuPyw4nmhLROtvrxTxFSEUeRlxFDwwrN/aYZAHjQR9y?=
 =?us-ascii?Q?NcnKpbVdva6cbRI/w5+ughfhw2FAIpajeZvZ/WAI0PVhgCD3jIvwi8mdaYFb?=
 =?us-ascii?Q?+NgCAduVM/lBbwsGHYs/KQcc4jmm3T16ZmzFQ4rrQv5M6BFUiTVShDyHEVZS?=
 =?us-ascii?Q?hC4/d8oPNi3/1oULAC7XseUJIxXfBW3yu3oNbxOhZ0aFjJNZcvF1p5tmFLoM?=
 =?us-ascii?Q?GJmIPcNL9URgAQMq8YYqjJlXu3UwiHc3/RdANH0RrME1NcrPtLkgbiYss2no?=
 =?us-ascii?Q?77PRflRT4P1QprdvsFbY6yXKYMtdoVXmXhE3QuV59j8tsBhvTM5HeVeKW5IX?=
 =?us-ascii?Q?SneaF0WmRbyQr2gQdo2QBTKJdQEjZgWVAj8LScHrFQXEIU/yabKApT4A9Fq4?=
 =?us-ascii?Q?o+dAHoejppuX7EPFX313vjAR3gn3UxD+udBHsxIuRTPD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f55c9b0-1cb2-40c9-245a-08ddbfe6ce84
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 19:20:18.4011 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ShWA0emcfs3z2S4SUI13FdaAWgPT0am1npHTFfZnRqsgp8ChlsHKQpxzMtUw5KU4b3DsUxyzWIcNa2n0UvFiknGgnp3WpkS/WrC59cIoQCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5995
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
Sent: Thursday, July 10, 2025 12:12 PM
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Move page fault init after topology init
>=20
> We need the topology to determine GT page fault queue size, move page
> fault init after topology init.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page fault queue =
size")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_gt.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index d397df056e4c..af03e19ef9be 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -628,15 +628,15 @@ int xe_gt_init(struct xe_gt *gt)
>  	if (err)
>  		return err;
> =20
> -	err =3D xe_gt_pagefault_init(gt);
> +	err =3D xe_gt_sysfs_init(gt);
>  	if (err)
>  		return err;
> =20
> -	err =3D xe_gt_sysfs_init(gt);
> +	err =3D gt_init_with_gt_forcewake(gt);
>  	if (err)
>  		return err;
> =20
> -	err =3D gt_init_with_gt_forcewake(gt);
> +	err =3D xe_gt_pagefault_init(gt);
>  	if (err)
>  		return err;
> =20
> --=20
> 2.34.1
>=20
>=20
