Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FB7C10F1A
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 19:12:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD2910E0B0;
	Thu,  9 May 2024 19:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VIJC5Uk2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947DE10E0B0
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 19:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715281976; x=1746817976;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DFENBgR5C19khCQobCxMdC8V0O848y3ww6wKaG5r8OM=;
 b=VIJC5Uk25XooSfWXg76mLhfnqwf0jZqwEez3/MLCMvxce/shJCtkQ4xI
 iE2NJnhBvHOxU1Pc7VqtULZlcAggfU3p+HZgbccbL2c+kOG6hZ68hWAyv
 IM6dnmdW2elZiUF3RrfWZP9ETBN9kz05zfrWDHfP6Rhc1MBHuXQ2VzJwK
 8qocEvvtPEXDhLfB45QB9vlXyPCNohgplI9iSrilYH6+zPAVoa5CiXTeL
 fXczasB8SZAUtN41bl1pCNRHFOlT62BC0sMKuOR79t6KUOlxN4U9isrJr
 3t4f//sijdW2VfT6UspRLe9uQhY1bSRnBh1SR8G4Azy56OcCEyI/8rsNr w==;
X-CSE-ConnectionGUID: Xb7pW1uiRgWsog8YapY4Pw==
X-CSE-MsgGUID: rBkrRqPhRl2FOKUM282ASA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15037978"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="15037978"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:12:56 -0700
X-CSE-ConnectionGUID: FbvTbtDtQ2yrUbfbxojrFg==
X-CSE-MsgGUID: 9DuHin6lQCuXkQrGuOwa3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="34202567"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 12:12:56 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 12:12:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 12:12:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 12:12:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 12:12:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ib7r3z06OpMwD3skZ9yCU2ybhzMzgWiNOTckOUfH5bCjOU0d87xYAOz84KHwbB52ne52BMNlvCBX1gdZtStZxBLLtAWADBGuk1NbRpJLn3g0vBVHcUjvJEGx+f849IwYyB3LD4esPRMRJLKcqho6+SgL3yYVfUPhI2HBHyMGhq+zc0EcO1trrpOxyYXVlE+VSEkqkLL02zKfiG39qPdHNo2Ny5U5lrjohY0BNRVkRDZSTNmlU4cWufJ47hE3wWXejo3vM4ML3OopE6mbFUKUDQrigCr2Djbhwf3BugT3zm8PCJuruqXLvda4a2Vziids3/q4sC1PlGJ8dWVZzj0EWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qYYmkXi2dq29bf/m4s8gN4Cf3hyKh7iMklP38mmH2w=;
 b=Ilwzy+jE2tIikTkaOMaRvtsBKZOOt/xmZ3O8IoHzg5Ma69Mw3TZQwsgkv4d0QaH2BisiPBsi1ouFaGHpX4x1lk6V6JvY7IzncbJJP8Xy58y4pbDPSiwFdhRSZ64rGsIzDCM+ElX/WEmFh96KvoflczFq+nVxu4310D3CWRZEmJ7vLB6KQCUZ8LUCHxvGPNkhrU+N8GyucFhKUd40eLwzSidtfW3vuAOwn7kpT7RDJUKItxvMHiQ8gn4L/Aslprjftnujkd8tPX6EM4gHKbrqrFbatrod6/DyOwr9yHQoO+SHcEluxAERjmbwkvcpYpCwMrJFrXp5r8RmgFN8Qqqsfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA0PR11MB4542.namprd11.prod.outlook.com (2603:10b6:806:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Thu, 9 May
 2024 19:12:53 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c%4]) with mapi id 15.20.7544.046; Thu, 9 May 2024
 19:12:53 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, "Welty, Brian"
 <brian.welty@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH v6 4/4] drm/xe/xe_guc_submit: Declare reset if banned or
 killed
Thread-Topic: [PATCH v6 4/4] drm/xe/xe_guc_submit: Declare reset if banned or
 killed
Thread-Index: AQHaj4ElHJRUirJXAUKDCpWt3jyz4bGPaoag
Date: Thu, 9 May 2024 19:12:53 +0000
Message-ID: <CH0PR11MB5444B69A12C884D09DAE5E9BE5E62@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240415215012.2978778-1-jonathan.cavitt@intel.com>
 <20240415215012.2978778-4-jonathan.cavitt@intel.com>
In-Reply-To: <20240415215012.2978778-4-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA0PR11MB4542:EE_
x-ms-office365-filtering-correlation-id: 554e5f33-9f25-4828-fd91-08dc705c06a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?mTpPUgHyYZICoA1LjY98SWWJwOz7/NEPQPbXp9kL0BHMYFvn33U1ABjhWGhQ?=
 =?us-ascii?Q?owB8HlL1g2aRBg2MLQuRUlaFQLYOBeMIS/3wDIliVa90oqVN/autksPu9czf?=
 =?us-ascii?Q?RXVBCzNXP3PnN4+uOQokD9/JRM9C6kn2g87lVDErXl3ULIsWFcnKc34ibIQz?=
 =?us-ascii?Q?oGySlHimPMGJgbHdW/6H5BktANtWfK/IuOnkZ7bV9hwUxbvcoi3e+vTIFzLf?=
 =?us-ascii?Q?no+jARCXQTQ5xoyVZdi682w1Kinycoo4bV6fX0X7rhKywyVAYzGr2vMMTL33?=
 =?us-ascii?Q?1JjkSrKcrUOse2YYLr4OVqbxyxO0pJHqQCSyVaMwDPTwp2b/FTPoeU6pn/3d?=
 =?us-ascii?Q?dhsF5tMc5fcgCkhDCwAR2EiohGvWD+OFgIp5EKcjaRborbrRuXUEdgXe7X2Z?=
 =?us-ascii?Q?IdF02iQPU23jo+Kv5YviQld/NsfAaAVcXa/00OtbNiIlwfDcvrM/6EqUx1xG?=
 =?us-ascii?Q?w7z6BJMFPDbN8Misb/2XI75L2h3ej0T50wo8gpV4nbED5lJFhN9/SMX+PAHZ?=
 =?us-ascii?Q?lmBoeJqu+rXKiEPn115hBDBWf9Vzbt1+bBYb5+8u44Hzkfs7VaoorGmm/Gc7?=
 =?us-ascii?Q?vClgB8aB4WnOe46CMQSdB6qYgs6RjeZMIlqxhDj2Gho2JzhJ5oageDh/8sVS?=
 =?us-ascii?Q?8bbXh/4fagRdQELJXyZT3J1vND3/7KIYW5HME2LvfOGam81KFT/7bDDkPos8?=
 =?us-ascii?Q?ao5Q9iVGvegLbx/Rx94U33JINalDy7YG1PrkLCZvEHVy7v2qBs1/5OuSAPEr?=
 =?us-ascii?Q?l34L9YTaNlK63EaDqzMKDukIZvTaeITDyv4HafREjcdROBgZ2iQznfSwOoU+?=
 =?us-ascii?Q?VNUCRcL8B85CynrYs1AI8/Jl4heG/pGzxvhtVYQiLMWOKNpRTS0wWPL3F5X3?=
 =?us-ascii?Q?LQvmfXK8q0KcdaMoymQ7L+MPF3pY/P0v/TcSC6snln7/J6xy8xWHVCv2MVdD?=
 =?us-ascii?Q?T7YpBFcWUc5bA1fUVYPcfpOyDFisM+solB+lRtBONN0jWF3JKqaKxdrbpBqG?=
 =?us-ascii?Q?udkMzY2LhZ6xLL++tIM6kuF7glhcUxLm8Y7a+vxtd23YcU7LOJQBdASyXw4m?=
 =?us-ascii?Q?BTyfxt7EoQsvmmLkjGB0X8i/hSK5TRd5AxPpK7zL2KgmDKobKhK27PGZkM2S?=
 =?us-ascii?Q?ODiWr+JLnoi1L3kfzKy3DGqAm4GgEAuL/aqmxqjtXnLGa3EMd5UV771gRBW9?=
 =?us-ascii?Q?lm2qtMWI3Fp6sAWHEWqz4Efv7dZ6pyrCaX8vdo2YMM7ZHQvXtAl8CXTLsZ/w?=
 =?us-ascii?Q?Hj47Mf33/T4UE92LRs+TKHCUJE0QUNSU4a0XdCKDsG1HvY9I+Z1nXmUszDUZ?=
 =?us-ascii?Q?9UlbxdO+UOjm0W47s3dVtCxdx0/hg7XO0x4uB/XmhfWkBw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OH6s/bHBhyKTtqbvSfLuolL16+xrzLiiUgA8k7YFDuocY9RqcJ5m9BKbKnHO?=
 =?us-ascii?Q?yqlgkHHoy6wS7KH6pd/h9ert4refFYMahrD3OmXlqPJBbDECJL6xWFPfm9rL?=
 =?us-ascii?Q?KF91RYF3EcKnHxO2FAmBp4tWuAdE+CsRxf/uFkmnzYOhqp2fabiq56yqtvQV?=
 =?us-ascii?Q?g60oovg9lPU1LdY19nkZk6sKE2CuSDkctvUl2MqDDx1n8c9HEFk3FPAKDiPW?=
 =?us-ascii?Q?gjasYACVAQsAXE/lpM0VCzWtjNMvJnCSvoCz1Q0p9mX7/BiShSNmAhHYe+Mc?=
 =?us-ascii?Q?3fvbRVMDIZKWFuQrw9fe5YGBSljENwELd+etrJtj1RMmVTJan3/1bAo8ylpD?=
 =?us-ascii?Q?eyvhUVs9InIVzYscLhdHH3UjiJw7JVYdmWRbPSVWXF4wcQoST28jq8LqsA/h?=
 =?us-ascii?Q?BxdWd5yn1f0eLYacqdKoH5USuOHtXtNj0DZrnD+ibxt/9TTnCpHz9HF9KyaX?=
 =?us-ascii?Q?5eBSZpTGX+LKdg617Z3R9cBBFiDcV+hdReBfMiRwcOfhyXxixNdyK3d/2QfA?=
 =?us-ascii?Q?kOA7WOv89/07fiVYVLFSBYAxt2TSDzoEKec8aP2A0uWo/1igYMgeFklq2ag0?=
 =?us-ascii?Q?GkWQ4gDHqm9BZNVtnwAqC89cnjrG2VHYPD0dHlMgZcjGrMpjVGfx2BTd8g/n?=
 =?us-ascii?Q?B5UA7Lshexj2vVCbUT+bbAcxqtyK4e0i4Enfu0+14BI222cGlL4N+VLbXZCl?=
 =?us-ascii?Q?3bIvW+v8WAEt7j94c/sMiwAV6ZbPWNd8ZCnNPM3CMEbIxn/r6c/GTN8nYXCx?=
 =?us-ascii?Q?4TzECUH42R40sFYXsxOwp2lj0PXEko2WCDEes8ql6kQ/KCodHVBIcGXSQpNX?=
 =?us-ascii?Q?bdab+kXEhC/TKVRoRcAswwwwfwR9QbFzSfCqLjcL1rF9yQ+T5JEOTOkLFQit?=
 =?us-ascii?Q?te7znXcBITcV/N4+T99wwMA6CGfr2SLQ12kfgV2hDRNr7hnP0sSIK04CfYp/?=
 =?us-ascii?Q?WfBCUP1tNZ/T4zYqCI2OUgG9XlMv9rUkGZ/XNlVxKA7iIlAsBUJ84J9ITr5e?=
 =?us-ascii?Q?1TpNqMMlO4Z75Rut6lrHzNBE5IekCf46+deswror4eEixykAADymLm9+ZRem?=
 =?us-ascii?Q?uIo/M9n5Cwo3I8g7KZ6cG2jDm6Juyhx2aO7oQFB+FZiPy/333VMD4kpdFo7P?=
 =?us-ascii?Q?muTL7CfrQcPakgD2okOP2RUeMomzmSYFQMDD43yqP2IDcxW0FYPvQz5y6Rju?=
 =?us-ascii?Q?tqTBPiNvWo23UmtvS58be0P3oAlXsav/rmYTBwVpb0boIGM1ha3oUThHwoRN?=
 =?us-ascii?Q?ZuanfsCBYm6oO/xVoPKnT2ezAfOjpni79vKM6aNytAm1LsGreh1PXJWaroWe?=
 =?us-ascii?Q?2+UKqB7gU7sbTdZ6JfwBoZE/d4JA72J/06bD4JONA0RVuoO7B1PJYB/xta0Z?=
 =?us-ascii?Q?X5tmxp3Qjc8wvJ21SLePwoBEJUWTUoXzSNgoBdAxy6GS4GtYULRatat2NzJh?=
 =?us-ascii?Q?UxivNljLn4yujskAKUMdU1Jv6+Vm4cFojaWhtKC64IkQeCB3UgYmk+M+rt0q?=
 =?us-ascii?Q?Tgs8QCokRnuu4sNXSzmYhUe+fkegrA3XuLlUSZHEU4j+5S466Vwqj4zY7+Oh?=
 =?us-ascii?Q?V/zDf3HAaCy9fNMPjJX5W3gt1KnuDzAgcmRmcRgiJ2PUevwzsKXG5crMHDXS?=
 =?us-ascii?Q?sA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 554e5f33-9f25-4828-fd91-08dc705c06a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2024 19:12:53.0450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9evE7CmoSk0zQOag9Pecl395SkIxeTeOzJYVBrPAlJXxPqP0M4nq3QCVS3L0EyjGjX3KE3iYxriaYAn6ciesroW4Y/KAsWxV+KSci6OoGE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4542
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
From: Cavitt, Jonathan <jonathan.cavitt@intel.com>=20
Sent: Monday, April 15, 2024 2:50 PM
To: intel-xe@lists.freedesktop.org
Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Gupta, saurabhg <saurabhg=
.gupta@intel.com>; Vishwanathapura, Niranjana <niranjana.vishwanathapura@in=
tel.com>; Welty, Brian <brian.welty@intel.com>; Roper, Matthew D <matthew.d=
.roper@intel.com>; Brost, Matthew <matthew.brost@intel.com>; Harrison, John=
 C <john.c.harrison@intel.com>
Subject: [PATCH v6 4/4] drm/xe/xe_guc_submit: Declare reset if banned or ki=
lled
>=20
> Add an additional condition to the reset_status guc_exec_queue_op that
> returns true if the exec queue has been banned or killed.  The
> reset_status op is only used for exiting any xe_wait_user_fence_ioctl
> that waits on an exec queue without timing out, so doing this will exit
> the ioctl early in cases where the exec queue can no longer function,
> such as after a GuC stop during a reset.
>=20
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 89cf84a5f888d..f964c0f118323 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1369,7 +1369,7 @@ static void guc_exec_queue_resume(struct xe_exec_qu=
eue *q)
> =20
>  static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
>  {
> -	return exec_queue_reset(q);
> +	return exec_queue_reset(q) || exec_queue_killed_or_banned(q);

Rebased recently.  exec_queue_killed_or_banned is now exec_queue_killed_or_=
banned_or_wedged.
-Jonathan Cavitt

>  }
> =20
>  /*
> --=20
> 2.25.1
>=20
>=20
