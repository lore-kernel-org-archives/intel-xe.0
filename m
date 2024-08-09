Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFE5C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 21:02:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1489B10EA05;
	Fri,  9 Aug 2024 21:02:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OD5S2tTx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EEAE10EA05
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 21:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723237332; x=1754773332;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TVoIt2pWSNmvu1qsApULeDwkN34rqylLnMwDjgF5N+Q=;
 b=OD5S2tTxRGQmSFiQj6Lv03p272Qjbk+YmZjR2xVBptVMDQoC3WEa5RwU
 5vfka4vxbJkYOAxmPGd2fE7SrAsBTKRZXh8VpKzwy32kCQNeKddo0ZFMJ
 pGlgeEmESO4jnjhu40vw7RvK4AJB9EReh155N/ZdV7tgcjw5YkQrbXpYC
 H37vaBMVu4x/uW8rLclA6rvCpvmXdKUJgKsjD/LUDxQbDY5ysmN5q8taT
 yd0IA5pU8QZhRW7Jr+IwJi6Vyan0oTVvdCGahZ+GadsN2/GRqoRAURe9n
 zmrbKxQnj/mGTNKpCjbpsqp2OLcRqDNAodQeuyVavTBvRueTy+CZ1G6oh g==;
X-CSE-ConnectionGUID: KfejQt/BTZyzC//rlzrY3A==
X-CSE-MsgGUID: 2V1GsvDYSBenQGO/8pR10A==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21578442"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="21578442"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 14:02:11 -0700
X-CSE-ConnectionGUID: HTK8WbbASraX/B5ryHVBpA==
X-CSE-MsgGUID: bWALC3jRRPaUhpV+nNPZkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="57911652"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 14:02:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 14:02:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 14:02:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 14:02:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PSEDvFHssqEAlhbGDpkRAdCLLf8g4NwKS3zcLmJF9W5Mn72FQu8jU1i5UnVKfKJ4vHDE6kF1/WSJJlR/3xsqjRH7zHXJtR0Svk3o9erxHHyuXwCgdbNZstmNDQ6B2luHK5A5ex/COfxbPAXyooTHBuME5NJYkBW+jd0nNPmsWYQ/129MShzKcfjXXF4rY5heFI0pRuTvB7GeVfEGH0T03DjrYDV7VTrJalBjLx5MOqD6xBSmNrgSbLiJDeOkxEpOrQrIEyD/M3S4YYpwgv+bQttNqoPB2p8K0pgu8FscaBCt0diq2TiZDmNazjixtRaVs2eZjzozeyyzlr1Z0WZd+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqYllDFSCSBvLxrEkWLG/OHnITGKfbxHF0sb5gBobD0=;
 b=FUsy5LVxQYP23+dGwlfK9lVTEwHy3T4x12hys13x1ScwFdZDxYtdz1NGL8pAfqPOzcu4pDSP4Zqujp2+SKoYIzLI5VIzDldGLUJRkXVLQSvrbAzRGGSemcCHLFVZ9NjvYCWVZwBwQQSvt5QwQEEB2bTDUrTEvciWCeSOQUJlllJeTNkNgU8OtnuyaRCipC96fqsZCJwi+SA5R8HNUoDeM9ckt5rrprxKIbY0iaZbQRLprFnrYs8oTSB3AxaX/WNay9H/MBaVgZtaqi+FbacjDIlOoyO8pCM92NzoeWT/uXLSDJkUxguPYMZBNmHqi2l3DyX15jCyZbmEWSuMM5zwHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA2PR11MB4892.namprd11.prod.outlook.com (2603:10b6:806:f9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.30; Fri, 9 Aug
 2024 21:02:07 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.031; Fri, 9 Aug 2024
 21:02:06 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Dugast, Francois" <francois.dugast@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 5/5] drm/xe: Allow suspend / resume to be safely called
 multiple times
Thread-Topic: [PATCH 5/5] drm/xe: Allow suspend / resume to be safely called
 multiple times
Thread-Index: AQHa6pEOy/XVJjeJe0GpLl/h14zlxrIfZcPg
Date: Fri, 9 Aug 2024 21:02:06 +0000
Message-ID: <CH0PR11MB54442B9EB7A1549BCD1B6877E5BA2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240809191929.3138956-1-matthew.brost@intel.com>
 <20240809191929.3138956-6-matthew.brost@intel.com>
In-Reply-To: <20240809191929.3138956-6-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA2PR11MB4892:EE_
x-ms-office365-filtering-correlation-id: 09018a60-fe8f-4bca-494c-08dcb8b686e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?F+1N+qNzIiLPcM3Goa8CJm2kpLnx18+8txcjpaUtOn+M2aiceN01VjqrZfB3?=
 =?us-ascii?Q?j4Jnk1r4xnOiFCkoTFtAAWycu6T9GJtR0Y873QB5sCCzP16OA/5Z4xXrS9KO?=
 =?us-ascii?Q?ZTtdQ70XoIns8a98BNCOQOl9vFoFe4QrqVYN0X0xXswMFBmvF09zoBWFN4/+?=
 =?us-ascii?Q?xJ/gwQ/bYHOMDXs/20Va+qGbiTqVEABUxB9EKar9WPrmy4KjZROSVXYARjXN?=
 =?us-ascii?Q?nn9iJCRLzZBYFlovOSbO1BQvNZVdEK/qbcdZaUv7qy9+V8uguZrdHW1NqA0g?=
 =?us-ascii?Q?ntvqdfq/YG5lcGjVz3dyV8w7JFu6Y81ts7RxuYeFua1eaFDtwdBt/EgXyFd0?=
 =?us-ascii?Q?J+wDVifWCRLluNYLUT4ghMQdSGaAoofuNetVVql5RQkww2zWoJQ5LKl3zty3?=
 =?us-ascii?Q?yEJEAac5pOj+q2+LeTHGVXaaBOTu0DWfWhKD7QRBRccgJBDBHwu5KO/OrBfd?=
 =?us-ascii?Q?yrfSmz5TopoPsqy6lgFp6lmZtvQmzA1O2PrKedRJve9YPM+VQizLLoEg2ddn?=
 =?us-ascii?Q?MvfypS7tdYMWNYh6WQrYrdxuIN3F/PPfqfgfiWZ7viNiE/kWTjWo3zUjVa8p?=
 =?us-ascii?Q?w9vrqOccHEQyrWn3GMeomkc1NB2LzAIwL00wZlozuu6F+Dd+G2o9L1U/yVDR?=
 =?us-ascii?Q?yG/y15ubVkE2RQF7rYpGFYdwN1ihxzgXZreZNtx0uATtxMJuyOm8Et2RbO6I?=
 =?us-ascii?Q?H95Zwqbxoh5SAaGq8hjUsul0M3+szhKxI3tAbgr7W5GoqUXsEfXCqYHkuJPG?=
 =?us-ascii?Q?xeowYto8CtdDj+x+FDzMPFv24/Ur+cd/KjsNm6pL0NOfdLvLOR8MQYwFyFZc?=
 =?us-ascii?Q?jYWPojv/NEVp33Bu6YgpNe0x9TiqgkEXaeZNh2j0s8GqF6YcCOD8Il2Igi7l?=
 =?us-ascii?Q?ez0zcnl2g8JNu/RFceNylEUi8FCsyY4Ff0wrXfq+W7P9KpgLQV9Z4mqXI3y+?=
 =?us-ascii?Q?9VNJ7m0vWAwaU/a3jGg/x/3iMNeqfMbOGs1iWd5vZImoMcWkDvP1nAPRPT8l?=
 =?us-ascii?Q?3T4lJHZN8RHJ2rsDIzao6QOM+Zka51WdLoFFk8eR+lxG3Th7QItcS8fHJj1t?=
 =?us-ascii?Q?1sAfuc5hYPqxYZxTLMYAEfvT65ykFnNXZtRDwJ9XEDhX+52RGJH1o8Ot8mAg?=
 =?us-ascii?Q?VZA0M0xL9beHhEUJdDIkZY/SheclHQWe7WS0muFUKvPFqtc0pTQgzT/KqP5T?=
 =?us-ascii?Q?qMMk7dHU84HNgX1QcMGc7tjUVVXqPCwpQRyyoHvhVNd7gl5ndoOPy99NadUx?=
 =?us-ascii?Q?731Ggwgarq0TOl54Mt5rySic5P+YSXk2lkaaPf4ofoOn+AjN0DHRH8EvA+Fc?=
 =?us-ascii?Q?P2KYyIar91RbXeK6l3faVsq0eAWgK+TYuwadCVOBcZbR2C5ZZXeBJ0NMPO9Y?=
 =?us-ascii?Q?78gWLbGisk80S1k5ptiOIWIjD7CQXZBnz4PNI84HIxxSEjbI+Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?y2YlNyfdEyqlcWuoh9gFnhKmVUn6yhAGTQBS7JvtVeCkuNyCiRKusOQ0UwXw?=
 =?us-ascii?Q?QOL1CyL3/tKnTkrg+aNZNb1LYZEiwzFeIyG/YrRViF0eHHugeN1+/RS0YUBl?=
 =?us-ascii?Q?qa0F5cOLGtO6Os95kdu5ezBIHGkPuB7oALPu1UiC2XPZb0TnjJyP+k9EzIh+?=
 =?us-ascii?Q?13M3UHIQbPHxrPd6L3yr6x2aeHyttxkd+2WNtdk3PumHCPIXvq08RYmv1/H/?=
 =?us-ascii?Q?ULI3MixNr6aWw98YAIpri2RvVpEl7M+T0+kkwR7yQUTSI8NHUJSWy1Z5a6IL?=
 =?us-ascii?Q?m13e3eW1wqvMD1cMcxkX0O2MJ0oNxAw1VgNxh8dFrVf3Ppek9N36ytAQ30EV?=
 =?us-ascii?Q?CfcbD6bULPk9az8vRk5/DngKBGs4wNeFOw3v/5QbHDuDWZfrdSqHqJJTvYg0?=
 =?us-ascii?Q?I2btLcBqcsfRay/1ATJ4q7mf8DOxhus0JXMiU2xGzrLnNAA1ujC4jqxKy8oQ?=
 =?us-ascii?Q?tzJ/2tz+fOrGWlOEOUttmBPJvodwj9gICmUKxKiDwoYFANYwNvrWXDckUn5R?=
 =?us-ascii?Q?gAPMy/bC/rzq7uMNlZenbHKfdtA0LpynLZ7RQw7MyC1leLdB97KRL/af7igW?=
 =?us-ascii?Q?rFAIezp5cpVJVxQND0PlA0eirX4Pp4YZlofMEa9dNqMKm6Dehk9lIjjKr5Hh?=
 =?us-ascii?Q?vegiVgcPOVwLlk4fsXzGIiqUJEFh4CmqAQetTrVvKQMSG7jltHgYPPJ2x1lE?=
 =?us-ascii?Q?N4SbUvcj4uk8LFSxmBlycRDJwdGovpmiorYcEI82dduJ/HSmZe2yX4JcpzFY?=
 =?us-ascii?Q?iYh3PQM1J84/UiC9qva0tLIap4qvemgg4NWDXoBZRuWq/n466IiMGS8ktbSc?=
 =?us-ascii?Q?jOqw5u4999SRj0LoJPYsfE89qRQGQmPiPAeT7Iyd5LAYXoBs0KCuf3qUGJDP?=
 =?us-ascii?Q?+87ygUB6UFKxBKDqhMZn9DVTCCqQvAj4O6eSG2utF16FB7nOYqBrEiUVqBhr?=
 =?us-ascii?Q?bRZYCDA/lOJTJ0I8D4OkPP6SAP1Ortlh162uswc8xVCEacYP2MNJtwHZzHQP?=
 =?us-ascii?Q?bQ+yQQp8UtLv48Ky8f4Pi4d9auB1neGXjcJdiiY6zfRU1lsJrCre3wYe1jSX?=
 =?us-ascii?Q?/ipf67+uTUBDgwsUeRcZ6Yvc6IkwHUFr8h62rG6GM9UijYc4O+o7uAcPu8bg?=
 =?us-ascii?Q?Lt7wY3Fz9bn5xgE87+2j8qVBLxfPXZNjhiub4X7KKAbOjpmJsmGyIUHoFMn+?=
 =?us-ascii?Q?XxX9LQhFHMDyVbFdZCJvCVAyH+HbKUSqea6D/C2kWTIi6+3LCvwEyHi85UKQ?=
 =?us-ascii?Q?V/YDo1tKXmCt4YbOqEhakrF0WUkN5fyhzfwdpIOQwxN+eEWXxEEvHg3kTbht?=
 =?us-ascii?Q?RONSniQlT+0al7gwcTYgNWttxmp8nRBLlS77QOwxPffQxmaBi6nGnN8b332p?=
 =?us-ascii?Q?XTaNIP8jf0868WVk0OKTa26/yJiwtm6sKydc+xLkG1zNWcQ7r6Dg0ifOqinG?=
 =?us-ascii?Q?VFkr+B/xsncySMzUxvWQ9XpKb/oAu5Kx4swWDehzxaCFarZd6ohCI8+/xx4D?=
 =?us-ascii?Q?VDp0O0R/Zo5qT04qnXWP0CU18UGRazISaHGSWZTk+6slFp8MWST4QSXr6aE9?=
 =?us-ascii?Q?BarBNQd+gtNcZ2sMPA695mMoa6U91C37nNhK9Cop?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09018a60-fe8f-4bca-494c-08dcb8b686e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2024 21:02:06.5841 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jvS9AUuoqq9umjfoSx32xqn3SOGbrSst+Pi7lyHlrcPcXtCt7F/mZtpU5mZgLvCbPRc59uJFjK1qvKUbTVgSh/fsbpQKILT89V/nF7zY1HE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4892
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
Sent: Friday, August 9, 2024 12:19 PM
To: intel-xe@lists.freedesktop.org
Cc: Dugast, Francois <francois.dugast@intel.com>
Subject: [PATCH 5/5] drm/xe: Allow suspend / resume to be safely called mul=
tiple times
>=20
> Switching modes between LR and dma-fence can result in multiple calls to
> suspend / resume. Make these calls safe while still enforcing call
> order.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 40 ++++++++++++++++++++++++------
>  1 file changed, 33 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index a9af33ff8aa7..c5a824981362 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1388,6 +1388,8 @@ static void __guc_exec_queue_process_msg_resume(str=
uct xe_sched_msg *msg)
>  #define SET_SCHED_PROPS	2
>  #define SUSPEND		3
>  #define RESUME		4
> +#define OPCODE_MASK	0xf
> +#define MSG_LOCKED	(1 << 8)
> =20
>  static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
>  {
> @@ -1432,7 +1434,7 @@ static int guc_exec_queue_init(struct xe_exec_queue=
 *q)
>  	struct xe_device *xe =3D guc_to_xe(guc);
>  	struct xe_guc_exec_queue *ge;
>  	long timeout;
> -	int err;
> +	int err, i;
> =20
>  	xe_assert(xe, xe_device_uc_enabled(guc_to_xe(guc)));
> =20
> @@ -1444,6 +1446,9 @@ static int guc_exec_queue_init(struct xe_exec_queue=
 *q)
>  	ge->q =3D q;
>  	init_waitqueue_head(&ge->suspend_wait);
> =20
> +	for (i =3D 0; i < MAX_STATIC_MSG_TYPE; ++i)
> +		INIT_LIST_HEAD(&ge->static_msgs[i].link);
> +
>  	timeout =3D (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
>  		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
>  	err =3D xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
> @@ -1506,11 +1511,26 @@ static void guc_exec_queue_add_msg(struct xe_exec=
_queue *q, struct xe_sched_msg
>  	xe_pm_runtime_get_noresume(guc_to_xe(exec_queue_to_guc(q)));
> =20
>  	INIT_LIST_HEAD(&msg->link);
> -	msg->opcode =3D opcode;
> +	msg->opcode =3D opcode & OPCODE_MASK;
>  	msg->private_data =3D q;
> =20
>  	trace_xe_sched_msg_add(msg);
> -	xe_sched_add_msg(&q->guc->sched, msg);
> +	if (opcode & MSG_LOCKED)
> +		xe_sched_add_msg_locked(&q->guc->sched, msg);
> +	else
> +		xe_sched_add_msg(&q->guc->sched, msg);
> +}

It seems like we only and always call this guc_exec_queue_add_msg function =
with
the MSG_LOCKED opcode set in the suspend and resume cases.  On paper, that
means we could probably just check if the opcode >=3D 2 and cover all the c=
urrent
cases.  However, using the new MSG_LOCKED flag in the opcode is definitely =
more
scalable, so this is less a suggestion and more an observation.

No changes needed, as far as I can tell.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +
> +static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
> +				       struct xe_sched_msg *msg,
> +				       u32 opcode)
> +{
> +	if (!list_empty(&msg->link))
> +		return false;
> +
> +	guc_exec_queue_add_msg(q, msg, opcode | MSG_LOCKED);
> +
> +	return true;
>  }
> =20
>  #define STATIC_MSG_CLEANUP	0
> @@ -1584,13 +1604,16 @@ static int guc_exec_queue_set_preempt_timeout(str=
uct xe_exec_queue *q,
> =20
>  static int guc_exec_queue_suspend(struct xe_exec_queue *q)
>  {
> +	struct xe_gpu_scheduler *sched =3D &q->guc->sched;
>  	struct xe_sched_msg *msg =3D q->guc->static_msgs + STATIC_MSG_SUSPEND;
> =20
> -	if (exec_queue_killed_or_banned_or_wedged(q) || q->guc->suspend_pending=
)
> +	if (exec_queue_killed_or_banned_or_wedged(q))
>  		return -EINVAL;
> =20
> -	q->guc->suspend_pending =3D true;
> -	guc_exec_queue_add_msg(q, msg, SUSPEND);
> +	xe_sched_msg_lock(sched);
> +	if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
> +		q->guc->suspend_pending =3D true;
> +	xe_sched_msg_unlock(sched);
> =20
>  	return 0;
>  }
> @@ -1624,13 +1647,16 @@ static int guc_exec_queue_suspend_wait(struct xe_=
exec_queue *q)
> =20
>  static void guc_exec_queue_resume(struct xe_exec_queue *q)
>  {
> +	struct xe_gpu_scheduler *sched =3D &q->guc->sched;
>  	struct xe_sched_msg *msg =3D q->guc->static_msgs + STATIC_MSG_RESUME;
>  	struct xe_guc *guc =3D exec_queue_to_guc(q);
>  	struct xe_device *xe =3D guc_to_xe(guc);
> =20
>  	xe_assert(xe, !q->guc->suspend_pending);
> =20
> -	guc_exec_queue_add_msg(q, msg, RESUME);
> +	xe_sched_msg_lock(sched);
> +	guc_exec_queue_try_add_msg(q, msg, RESUME);
> +	xe_sched_msg_unlock(sched);
>  }
> =20
>  static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
> --=20
> 2.34.1
>=20
>=20
