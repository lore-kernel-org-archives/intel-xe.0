Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718E3C3ABBE
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 21:36:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1100E10E13E;
	Thu,  8 May 2025 21:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D3pm9n0n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B8510E13E
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 21:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746740215; x=1778276215;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I5K0xa+3ImfeGpFtrJPapg8KiQJvlFOTEluayV95ThI=;
 b=D3pm9n0nj9DWFDqzhBh8ahkumD8k/DLjfqNGeN+DPLJJ+oNf2hdZuZr5
 GfR68kyb831WrY06b/IA3NrcheTaBC2yI6qyHG9Ekn5u8EeYDu3T4153R
 W69Cn0xV7YQcvcyf0uG3L3zgY+xsGttP7oAw7QGyOpkkvvZiY5s5ndpZK
 1uoZWE85Nep5FV2tug4pEp7Lx74Rz9KyGDS1T1RE+lJS/kj4HUuUxQuDp
 tf7YtoXuYtuypvx2UcaXOJcTJMvV650bM3Zq+ytCl5H1TiY1CNJjSlbKo
 /aOAS+yHdczKAfc5chfR0Z3KJFhdUxDTtCua5HllcXl6V9jzTNszjXyR5 w==;
X-CSE-ConnectionGUID: dHI4gdd6SQiN8swz85vyyw==
X-CSE-MsgGUID: c3oaFbxvQqCAzlo9Dahirw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59947217"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="59947217"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 14:36:51 -0700
X-CSE-ConnectionGUID: UNDf5UQWSlWW3DDpzdi+lA==
X-CSE-MsgGUID: a9YUruZMQRuh9WKNFbOeOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="136131453"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 14:36:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 14:36:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 14:36:50 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 14:36:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4sZZmIU8atb7dKN9d+fwpATt6L3KLJ2xEfCch+gRrG5aoy9w+hUzLP9/3U6430g98RtdkDMeO3cWO48J7VELuOtkdUhutHZhy/RklutvXbWlKmOpZ1phPvZW+zSMG3aALigOjxZ6qosRZ6U2Om5bQn/uYHblXGlefotxvbmU7SV9AB7vfvHludV3aGl8v8hXAUKsONBmFt6V8W/PV/wJHuLHxCCvtbRKrKwYocqz1o2/5W119nVTvh8yP3YPodSpjlehJk5rsHaPeNuJfa2VP+6fNfBm7jCvySnjky36QC/kbFLbM9O5ROC6XIfY3LMbxpptN2JDwyTzY5VAyJPWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmTkROJVsEn6hFBRhM6o+l7T+hKTaeZu1uWAZJEzyQ8=;
 b=FOC//VjN8osExnU6N545xwobrHLAvagTzmD5R9tUA0s71oZFs0B/cWeZ+oAMbeIpltBxlaXwQAhIqbrRdkRt1fDjZoXC3lehuIa3ITGOKNMi3uktfuQU/65uVuw9aQYA5tXBqe+YOpGCP9pN4dyB6sZAzV1zExLIxww879pzQ6EhtoJQDztTcrvwb9UBEDdzNr7Wy5N1rgoFeuUzi3UR1Xz7Zzoh+0WOBYvwLKNcJuos/Y+NeR50iYR+ysgfy+YWFwrha5bhHZAPX3Eeh4cUkrlCFlbNGkCoxKNAycIs+g4rBvkeonrgm0NSPPoIAIY2xVT6lOSWpeYMYZWL7JIe7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS4PPF990BCE628.namprd11.prod.outlook.com (2603:10b6:f:fc02::3d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Thu, 8 May
 2025 21:36:40 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8722.018; Thu, 8 May 2025
 21:36:40 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Do not print engine reset message on a killed
 queue
Thread-Topic: [PATCH] drm/xe: Do not print engine reset message on a killed
 queue
Thread-Index: AQHbwEyQeNE+NGCigkKNU25Qhxw3Q7PJQAJg
Date: Thu, 8 May 2025 21:36:40 +0000
Message-ID: <CH0PR11MB5444B702AA6676DCAAD5BA49E58BA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250508190920.1343610-1-matthew.brost@intel.com>
In-Reply-To: <20250508190920.1343610-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS4PPF990BCE628:EE_
x-ms-office365-filtering-correlation-id: 2439d965-7959-4858-45fa-08dd8e786b1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?tV/P/6tYoad1jYNzaxBDX3WMN6tnD17AoUGjiJ9HiQ3NyQR0uGPfYMn0R1nK?=
 =?us-ascii?Q?Rvr2SEyMbYSErDqd0BvAJHzeVDJMa7azdBzKesTWjv/57mF3ZFxa4l5D9V9B?=
 =?us-ascii?Q?9W0a2ow7NGGIIoKNAWXTFAgn3Vz1ft3MNfg8nQorKXvUjmQIEr4vWiVXQtSv?=
 =?us-ascii?Q?zR7r5vwNX7EAuXnutELYPSAQyhmynNe2riwZsU9O7vD49/nyjNWlr9YKnjaT?=
 =?us-ascii?Q?NvK6cEx802F5ATgdcNaga7RNQ/zDR0u5qY+k3EeApBgXyCvOCJdiRqS7dlXS?=
 =?us-ascii?Q?FpA8rPlfMKudFAlrsTWQkRRDSrNapfimYc0GQp5M50RNz/lU3r2ARNm5GeSG?=
 =?us-ascii?Q?uLxvoMXtMx0kbmW9alJ1twpQRxjzc5yPp4R+jMblQdGQfTPN9m5Hjyz87VCD?=
 =?us-ascii?Q?B3Qu688goW0POGL9nyCDYr1V10mYr+vBqdGBXcyRSZ9eGwxj4r25ffkAMHSB?=
 =?us-ascii?Q?bXsWMKVd+lRbGVLusgCIa4rkKK1u1zSQWgnQiyykKCAAnhIsWsDIAaakiJHM?=
 =?us-ascii?Q?+tnuDeeusuqe3ws9r1M8q+53T3XJOLwYR3nef1EO7Q1Vmlmy4GUVU6ab3wsz?=
 =?us-ascii?Q?gbCqKAGW/yDPoJmFh0ienY3K/EfrG+X/t937+VNy06dUCm8wHhJdIBaVm56Y?=
 =?us-ascii?Q?+7j5nG5xk7QmwKJfMNdvruVh0czXug1j5xwwpxY0XgM3a2mMgOLf4naNnvJb?=
 =?us-ascii?Q?tFGMCZ5b9ixl/Updxmdwm5xxm13Hb14eqRtq48H85Udls5Dx49KUwvFzt9Eh?=
 =?us-ascii?Q?Zei4lJvZEzfR/mUr0KaiTWkcPSWOYPTRJFs7gQLtM+rEjtRgLXvwnlaOICig?=
 =?us-ascii?Q?JvPqt92BpacpjjEnmay34EbUO/JMQWD10fBjFYlUwNfIOwlEXjENRUb0ip/u?=
 =?us-ascii?Q?RwcDEETMEV2eTJInNxPC/MMw990KTOrKh+JcnPX0vNPeUMulOdcVE8+7oUl3?=
 =?us-ascii?Q?516XYDEy2OrBqovROoCK2q6rB7iUv+CF6BppaU30fibN5AhMuzl3T/2glkN1?=
 =?us-ascii?Q?/wMDnLhlx5q3u2YoKfq9nQ/IXXsskFB9r6sj1Picz7IZA8EjVUpckxG1hxV2?=
 =?us-ascii?Q?bPFBqagganOKrpoBgjolmLutLDdopyOZbtqWv8S1CD+pjlTlHSBSrDcZrdfd?=
 =?us-ascii?Q?XtRc8iEjyV684gfash/a6g5oesT7J26wuhhSTiGkspAYN7TA/90NDXyEf9SY?=
 =?us-ascii?Q?90EKv4OAJqBF5ToET+hf9I+vI7KEni1K29QsxmWeVUyB788HXKXygik7/uHH?=
 =?us-ascii?Q?dNQQ0PYzzJ0mhM1UgU32QDALZstcUHiJd5ik6HeWWrTOUeIO5PXFlhEcWk90?=
 =?us-ascii?Q?xMSPhPfz2w16f2EvvuNdXBv8cUn0kdIjsygU6ibsblfYb+2uVQDm80zg1qc/?=
 =?us-ascii?Q?GdW/aELMfjw7PliWSBXJjhQx6Z2JBkDPvNv+p/cfkuIlp7dSqlIQNatTn6dk?=
 =?us-ascii?Q?uu7lVdBuVlE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?R58ZVYjrmQC0dwTCVDyD6yvwKryZT5LCHFQIobRtqjeI/1I1zjvzgOSexNbp?=
 =?us-ascii?Q?/aXN735PFh5nr1uVYyH/W/gjTjKTN/orr/oTcKj5w0V6GajY/X/x5Zly82JM?=
 =?us-ascii?Q?UTLGvOwSW0zxsbWuIlJCuriox/ATAkWmX1YL7RD4aCxZzL/2CFetfDUzZp8X?=
 =?us-ascii?Q?S/NTdxLFgeYn6I9HHV1LW3bUnrUzR8pzB7LGatzl/aSIPR9V9XZyvLl/sn9J?=
 =?us-ascii?Q?pKztlJ0FFF+npZStBFDOpBTaeSLYLKqqa4xLe++io0YHdGt6bIKpLoxiQyCh?=
 =?us-ascii?Q?pCjUoyjZqMPtQysCA4ODgn7aJjIR01jiIgOdKEkCBL41KGVrxz6yF0QXWvle?=
 =?us-ascii?Q?kTr9c0NBQt+8Xul0IOy9I2or0Xb9a6ydcFLSite+OyFHLd5nIer6gfuuvVPV?=
 =?us-ascii?Q?u78Nizcq8ad055K6nmsRHYo4brEngf6/DKBhPgwypSQeF229PIJmwf8UXSVo?=
 =?us-ascii?Q?46l8B0Uld/J+3XGMXMhnCWIPipVB03t0j/jWhAEXNoipFCL3i0R+HvqMeSff?=
 =?us-ascii?Q?hIkkA6wWQ5CI6qm0lhnJeMVDXv0nfq1GKWOoZHPgmv+U7+jA5lJpE0iDeasy?=
 =?us-ascii?Q?LqNTjL3I6rH1foW6cs/ObDkwy+Bx9Eel67khcHosdwZS1IM4T7/sRG0xrNjj?=
 =?us-ascii?Q?9AkDk3elOc2z912wFIhEED9SHjR1zmP9bO30+xgW/LnY8nO5rvRKg/OXjV8+?=
 =?us-ascii?Q?NTWrcBKmZ6Ow22c5O1W2yJrBvCKuQNJt9dQBNK4xGGP8q+AxWtHPHu4nOJMP?=
 =?us-ascii?Q?B37kvEN9P4iNfZRWtjt79VyuZD2uh776vFReWCQoGKUi/t/saulSw0W0x+57?=
 =?us-ascii?Q?iogLBK60wdRiWuHL8r4pDt8V+geDA/Pvf+kfgOWLBe0hGqEbd6qr+qITlu7L?=
 =?us-ascii?Q?kRn8nYhOPFdzCfHzaXiQjn3aE4zt/MTsX/HhHyvpJq6DARu4eTAbHkA6bsaz?=
 =?us-ascii?Q?n6BAQIEXBIT4R9zHdW6w7Btm7UDmFSzVlnzE5gNl4NsplJnvfcVuMXAwnqNU?=
 =?us-ascii?Q?HaQdwlQUPJg8lg0tlNuJB6UN4jAjDuY27d+OJ5C+dpgtJRlY9hNOzDZaAu/i?=
 =?us-ascii?Q?9W6kXECeU5yy6MdlzSwGxVWY7dFhDeRZwvZmIO8buvKAM4TjM/9rDdSsFItY?=
 =?us-ascii?Q?Z/om5diYp7tvpFeBbm7hP5+by6OwpxDqv+Vyv/+R7KEGX4qF6SMnmopMjxlf?=
 =?us-ascii?Q?ZG6ltnwVkYboMtbirp1sNp4NjuzICvBgXj1qGtIqS3Z0t/9iMr0eK44Z8IAM?=
 =?us-ascii?Q?TqC7gAPqll04KxYsVfaUO8SFEeRnlVVk7tae9Jby3GSCifPFtIBs6J/DA0dh?=
 =?us-ascii?Q?2aALyuE++bpXgs3Rjyqnk2359u+KD/DC6GbqY1Q/W4quxTg2XZ230N4KP3y6?=
 =?us-ascii?Q?7Fpd5/d55bRgipyrGlclpBXux5GSjDN/sNtr/6ISXF98QlWDIfEygrqmJnj3?=
 =?us-ascii?Q?jjB1dnLLveIUUAKRUlE8Z1C+KbH0OQZ+SNCIQmRmIxL1h5V8rP6XiRrYX5aQ?=
 =?us-ascii?Q?hK8tF/gQCsU0If9E74QCXWikJgYXGDxnpbHyKbh95r1FNEpwrkwObnLvDVXZ?=
 =?us-ascii?Q?8LZ4wHZ83ZJ+Wu+9Oi7yK/83ynDyQLHeali5ZaEG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2439d965-7959-4858-45fa-08dd8e786b1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2025 21:36:40.0751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yGaG1eSmKYgjFEzEkksggr92cW9TT0/LdiDDMya5ebLuOq5UqCkIP9xu+WSVtkRKqZ5O9s5ttA1D26A1Zx4CfjvAXkIkaf4xEOQr0ctpb7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF990BCE628
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
Sent: Thursday, May 8, 2025 12:09 PM
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Do not print engine reset message on a killed queu=
e
>=20
> When an app is ctrl-c (killed) any queues running on the GPU have their
> preemption timeout set to the minimum value and scheduling is disabled.
> If the queue has something active on the GPU it is very likely for the
> GuC will trigger an engine reset resulting in the engine reset message
> being printed when this is fully expected. Do not print the engine reset
> message on queues which have been killed.
>=20
> Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4904
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 369be36f7dc5..efff462ddd75 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2005,8 +2005,9 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *=
guc, u32 *msg, u32 len)
>  	if (unlikely(!q))
>  		return -EPROTO;
> =20
> -	xe_gt_info(gt, "Engine reset: engine_class=3D%s, logical_mask: 0x%x, gu=
c_id=3D%d",
> -		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> +	if (!exec_queue_killed(q))
> +		xe_gt_info(gt, "Engine reset: engine_class=3D%s, logical_mask: 0x%x, g=
uc_id=3D%d",
> +			   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> =20
>  	trace_xe_exec_queue_reset(q);

Hmm... what does this trace do, again?  I can't find the declaration of thi=
s function in the code for some reason.
If it's also in charge of printing additional debug data, then we should pr=
obably shove it into the above if statement as well.
If not, or if there's other reasons why it needs to be run every time the e=
xec queue reset handler function is executed, then:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> =20
> --=20
> 2.34.1
>=20
>=20
