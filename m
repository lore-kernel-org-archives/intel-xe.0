Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D658606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 21:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ApeJusYx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39D010E09A;
	Mon, 26 Oct 2026 21:53:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D874910E09A
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 21:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793051610; x=1824587610;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h+MYnVjUADQbX/g1bh1KOhkxTCLS6+ncH/igsCI1eXU=;
 b=ApeJusYx3HIJ8JOrIde+AdxsyBpDJEyR0QXyX+9mYEyoq+kfNaVMxi17
 3kKbs21/sEdHIfaLR/55LARCm0VqtC1VqXE31tc238zMiUt5PvRbfb/QT
 YKebDWmBc2scHiu4JXez6RZWuPh4ODaukZoLAPkRxtM+JyOjflDAmGdyV
 oNF6e49WlgTDiVGdqX1NnGkuLdh39KNiU1r2TglZddl2mcWKAxRdJ8ahB
 eXlBA0m4LgU3wSrdd2iFsv+c1dxbWSp99QvJq8hEsBkPcFvxSYE0wfyEv
 o9i97po5MFLcuDCLz7hJxUev1EqbrCy0o+3TjIcO/QWGebqsu0qFx1rlz w==;
X-CSE-ConnectionGUID: uopUmlQ9TTqZ4dgsPPolCg==
X-CSE-MsgGUID: 0ndI0fRGSlSPqOKK8yI3Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1632429"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1632429"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 14:53:29 -0700
X-CSE-ConnectionGUID: c3i9T8vhQ5Cn9Y0MytazjQ==
X-CSE-MsgGUID: 97p7Hwf3RuGkRaWo4tS0lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4726003"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 14:53:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 14:53:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 14:53:28 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 14:53:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t93SwcCKBIN5vAMxWauS/DVkX1XFANwrHynVAgWJwEeqPdxdiumxJ1OdG9TgOM+P9f0nZS7TYdCWuxXVojt57SCt79ZUxr+5uqrPh7lkZrHdX4YpuBcLD2NixV8Jc6+CU8UpZEsqZ7Gaj97GJl2CJFcVsAckNWExjZvxVAbDbhT8z9iHeVS6pTiMYlI0X1+KyoIDYNfJc8374oMOrQYCc1tvFTyFS5Py0v9JKQPJJviae39zRLZX2m/Ibak8ejvqJhUbcWgyP+ZeqE+Z7hl4wQFleUSeK+MdlSrVb1bmmRTwwBj5fIwzgx9GSj7EiLZFF0S1FmfQEtsn9BSunjSVMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGB8b0ttkQRBxIt9Hm1KZ30DhmHeEybe1GUZhJu24h0=;
 b=IJ1XVvi+xarsmE0CyOhNfy6MJB7FCIcmOawPfX3IXJLAvA8axa2EBKZk141kUa+v+oVgNMHGUGJC9LI1sj5qBB2UlZ3exuuGgCQ816QQrH1TslP+KZlaylq4gI0J5sFarVhlUh5IUkAmJDVPHsAG3YVOGu5lhGqzYHpprEN+l0Qevlmymc3FxyRQWb0J1bMgTPLC5xuoey2jkzoROpurUb/LHx4xOoL4XEVGsvpF8DKJ+PRXptz6b/zx/BmwqROTwAGOJTKAcjweM33bFtiJ8jLUDav+vLUhEz8o8hivF2fYB8mSLDWZRlr95o6B/nHsAwLzIun773ycpqRNF2s3Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5395.namprd11.prod.outlook.com (2603:10b6:610:ba::6)
 by PH7PR11MB6834.namprd11.prod.outlook.com (2603:10b6:510:1ed::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 21:53:24 +0000
Received: from CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490]) by CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 21:53:24 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Charles, Daniel" <daniel.charles@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wang, X" <x.wang@intel.com>, "Yao, Jia" <jia.yao@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, stable <stable@kernel.org>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4 1/3] drm/xe: Read scheduler message opcode under lock
Thread-Topic: [PATCH v4 1/3] drm/xe: Read scheduler message opcode under lock
Thread-Index: AQHdXalurgqCBqbZXUCQeEVm2DjixLcQbV+w
Date: Mon, 26 Oct 2026 21:53:24 +0000
Message-ID: <CH0PR11MB5395D6814B0252BAAC5CB685E5612@CH0PR11MB5395.namprd11.prod.outlook.com>
References: <20261016195904.1377149-1-daniel.charles@intel.com>
 <20261016195904.1377149-2-daniel.charles@intel.com>
In-Reply-To: <20261016195904.1377149-2-daniel.charles@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5395:EE_|PH7PR11MB6834:EE_
x-ms-office365-filtering-correlation-id: 32f71f22-eb70-41a3-8f15-08df33ab8f2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|261009223027099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|10067099003|56012099006|261026140227099003|22082099003|18002099003|261026121527099003|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: 9zE0iaEWw3AIVfzOgTaucggQfqYCjC5WhHr100uYMgaElCDkpgV26B6ERJ1lBe4QJrkEsTr4Zl0qsrpATttxETx1M2BiEHdldbYL8RmQonAaJDnvb4KCQJKe9CQlTlC/PnWqJkD36x6Ot9UTJ9rpRwM6HqC3bFJzkKDM/0bR213ofNZzPgFbRWBSLvK4L/Evu+/pnqqINlk1GmzgW+WdNLeiKijN7mkMUBJE9DB1PTRDLKce44aJx6Rxh1+bb+S0TXxk7AwFGXUHjqt+XLlbLC7hVevo7Ypwi0F1RO/XdT9O+QWCWnbw92UHBdHVb06q8n5GmDBUdD75StrksgMH1NCYe/9RChbmu7cFt7tWhGZ8ubXDq7B43EPjgH9F9RisGfw2v1/KBkawN3fTSkkwpXqRuKGLc8zFFkCYsOSxNtOkvXfZa/skJhdVCpROM4moywyQNmCAPUfLybiHOjyVa8NwbmEhfUGe/rp/gLbdIRDeUvFMY0/TnF0AebOmhgMPpioJ9Mn4cxFS6dwYxeSe6p8SuvJ5UVrnkK41vDv/vrPSgPl+Jh0B+vm1w4SPeZWHcyASrUl9CCI/W3Ym2Nkl97k7CaqlbZKt7arbIJ0oFbclIsl/OAEDzIHJBRfkC3VETG4eI0/IH6/Qg18CC7Vd9elUbou8zvCXkuLJRcRmdIO8DTepprjTBSwlb4YSCati+wIqAbBfYYz4mXfNa3FqLAvBUX4p34TCsyopaRK0gjI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5395.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(10067099003)(56012099006)(261026140227099003)(22082099003)(18002099003)(261026121527099003)(11063799006)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+BgVAOCDYHUk8P/jGJ+URtdQFeN2nShWTDQqQSNSrfZolJdFa0jJqUPVP46l?=
 =?us-ascii?Q?hnuB1pw2u7SRq3oUlMGLYcGcLvaP9PZcl3TlsCcLqtmdWAYwbA7eokv02BTb?=
 =?us-ascii?Q?YEgbyfUJyOlNdEoD1vRGEyunUYlG0SK/2f3juXP3OluOTX7btfiG2EaDmW/B?=
 =?us-ascii?Q?CRcRWmhA2A0jdM2EF4uO24U70vyKhyIrfNBkhnQo2WJw3sXc4SOHjohkXPsu?=
 =?us-ascii?Q?TQ95M4iVTcPFJKjGSCo/weDKsBPGM7zgVzfHzHfuNI+GJivLmbTWAeoi4HGH?=
 =?us-ascii?Q?/mx/+6iaK8tN4v7qeSiTvEROe88KgKGhUZy+QlsZtfyVbKS0MQZim8KeESCN?=
 =?us-ascii?Q?WqZM76k6rpE3EXoSzyUIKhOFgNafPUovS5hIr3CVmucnk3xFJlpc0bxXKa4K?=
 =?us-ascii?Q?OdOIQA5vuXKMMOxcIO14Wt2nWRMXYi3tbSjNux9eK2fK+ziN03wIz6659gVT?=
 =?us-ascii?Q?SxxGwh6H9ZEQ+GI2FBRuRpsIOCRrYFTb5od0n67I4WM9iNoAZdZ8BPrntqNl?=
 =?us-ascii?Q?wUSxsF0qt7Rul44ipHTZ8vZ9ToTZHl+DxtMZs8zZH6HeXEw4Rnyolg1gLSHr?=
 =?us-ascii?Q?I/F9FLUGcEL64hv1TeaKe46YYOWlB7ZphLFq7tBPBAFrSJOqd1X7EnP8jvLl?=
 =?us-ascii?Q?HZpLsTUSYOWolMsnLWdY0bhu4bZuiECSCZeNqmyr+/GGN+JXD2NMcexZg/9w?=
 =?us-ascii?Q?chi4mtfL4L3tuPp3i94/RReURPeFjut9qkOa6uW0cH+sP93rwglxNTTfRUmy?=
 =?us-ascii?Q?bqTf7eLPTUU2cRqYrbDEXS3Ck7FUkQbAq593cgqCWgKOBR2BeNqogECrls2P?=
 =?us-ascii?Q?X1+k7bfQR3EsQ5mkoSwBzeeSiLTn5B2/kqzEyPLLBHB6V4WLPNqkd21PHzTY?=
 =?us-ascii?Q?7odYfBTbqbNHIpRlRhLFsY3WldlX2LkdHAkE2Rf50+KWuLBPzBWyxfYOEpSr?=
 =?us-ascii?Q?YcpU3sfadkEkFoJxRjwhzP7FhepCv6dmUm7hRayM34Hvysk+Nj/8Ta8V5/iA?=
 =?us-ascii?Q?V0MANWSKyNsXoKHn3bwT4T+CByJKhfJss2nHvy/DJ9GJnYW59zDKAPEl5xPB?=
 =?us-ascii?Q?LTF+k0aO1/05SjME0zilv6CrNCT3ALj0K9IeZaPtlpvaaNGheVMj1sB0rxuv?=
 =?us-ascii?Q?+XPjEwSLQ4I1E+BSm4kU0/6GonEazYQEdLuEN9xfzwnLQg+J6mLRgTh+TK5O?=
 =?us-ascii?Q?gVU8ZxyXM+DI/Jzxrvfm/HiSBL5CiHqEKh4arusjogzP/DfVg1oEUzvPSiQb?=
 =?us-ascii?Q?FKBAx0O0YiqFGBTA8GnWLIjDA34ZSBj9O3NnUzLisCqPFddyuR5/3MhwRoji?=
 =?us-ascii?Q?Iz/ke7B2x9VQdkaiNvc2bb4mAzf5gCXesU12bU2bH5++Df7GHLBdFokNaq7d?=
 =?us-ascii?Q?Xww/epXsOI88w9EhutG6vWkz77v63FhLY37l0YQk+vSj00rtJetmkcFSxr5Q?=
 =?us-ascii?Q?LvRxGHVPZIBejKCOcekjUgQV8Lu6gaTq+G0tQv+Pam07O7bMc5738zLRHyhV?=
 =?us-ascii?Q?XCoW9PkjQgMSNHaz7z35vrjPJXDjpCiDO6C6pp5Tu1Jz7GllgqVV/4noc/6E?=
 =?us-ascii?Q?p1AOPfVpjorHi0eeGtoNl6rkuQMumm0FrOnYapBx7Wkvmp1WqLP/MOkrTR/j?=
 =?us-ascii?Q?F+1UL9Cc05o4G/L5q4dWxTr0oBOJ5uet9b57hO/3n+r8iE7QB/Wxmd6isrw5?=
 =?us-ascii?Q?dpTIYtDyRMnK+TeXkg/lcHZYe7pyIUu2P8uUvMxgC7EvNmyYIomL7C6W+Tlb?=
 =?us-ascii?Q?7eig1fAN1A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YU4RKF4Kno3IseGLQ5IjPX8nvY1ZpsvQ/vzLhCi2RpVSXBbO/sHb+seHfjX9JNsa8Z8OnqYXostJVA67OyOGYpDUXFpsKyVb8XNIjcxgXqEYPyaQjUZFtkNk6z7owiReEaj4oPs1XS2vQqPp3AfZGM6Vv74I7Wn3UR4mXwhBjQLvYWh18mey8qojTebqSASWqqqSZ6vEEYMc1lYFZ/6AAyecKX/St+60e/oS36oBQ3NazG950bu2wqJM9Uvr1sDUFuu+ZrUL095uGOBv+H4qeT5M6MnmcpDYIztJq9pSnSPP4GUI5lPtdCHcnuzMwNdUiKHyTZHaEyVtBfcGpGr9Sw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5395.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f71f22-eb70-41a3-8f15-08df33ab8f2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 21:53:24.3888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dwE0BAvYWq2Ltea9xn+5NvZi94EYWUkcDMYMCwWXlzJAQ9Nye22i4RTpsJktHbG3Q2tWKbCKc2UU4XUizH2sywCb15xqvmJoeATnrmjMbxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6834
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

-----Original Message-----
From: Charles, Daniel <daniel.charles@intel.com>=20
Sent: Friday, October 16, 2026 12:59 PM
To: intel-xe@lists.freedesktop.org
Cc: Wang, X <x.wang@intel.com>; Yao, Jia <jia.yao@intel.com>; Cavitt, Jonat=
han <jonathan.cavitt@intel.com>; Brost, Matthew <matthew.brost@intel.com>; =
stable <stable@kernel.org>
Subject: [PATCH v4 1/3] drm/xe: Read scheduler message opcode under lock
>=20
> From: Matthew Brost <matthew.brost@intel.com>
>=20
> For static scheduler messages, the opcode is only guaranteed to remain
> stable while the message is on the pending message list. Read the opcode
> under the message lock before removing the message from the pending list,
> and pass it through the processing pipeline.
>=20
> Fixes: ff796870f5dd ("drm/xe/guc: rework exec queue teardown PM/unplug ha=
ndling")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_gpu_scheduler.c       | 13 +++++++++----
>  drivers/gpu/drm/xe/xe_gpu_scheduler_types.h |  2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c          |  7 ++++---
>  3 files changed, 14 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/x=
e_gpu_scheduler.c
> index 9c8004d5dd915..d656db758cb3c 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> @@ -23,15 +23,19 @@ static void xe_sched_process_msg_queue_if_ready(struc=
t xe_gpu_scheduler *sched)
>  }
> =20
>  static struct xe_sched_msg *
> -xe_sched_get_msg(struct xe_gpu_scheduler *sched)
> +xe_sched_get_msg(struct xe_gpu_scheduler *sched, unsigned int *opcode)
>  {
>  	struct xe_sched_msg *msg;
> =20
>  	xe_sched_msg_lock(sched);
>  	msg =3D list_first_entry_or_null(&sched->msgs,
>  				       struct xe_sched_msg, link);
> -	if (msg)
> +	if (msg) {
> +		/* The opcode is only stable under lock for static messages */
> +		*opcode =3D msg->opcode;
> +
>  		list_del_init(&msg->link);
> +	}
>  	xe_sched_msg_unlock(sched);
> =20
>  	return msg;
> @@ -42,13 +46,14 @@ static void xe_sched_process_msg_work(struct work_str=
uct *w)
>  	struct xe_gpu_scheduler *sched =3D
>  		container_of(w, struct xe_gpu_scheduler, work_process_msg);
>  	struct xe_sched_msg *msg;
> +	unsigned int opcode;
> =20
>  	if (drm_sched_is_stopped(&sched->base))
>  		return;
> =20
> -	msg =3D xe_sched_get_msg(sched);
> +	msg =3D xe_sched_get_msg(sched, &opcode);
>  	if (msg) {
> -		sched->ops->process_msg(msg);
> +		sched->ops->process_msg(msg, opcode);
> =20
>  		xe_sched_process_msg_queue_if_ready(sched);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/dr=
m/xe/xe_gpu_scheduler_types.h
> index 78ef2e8ded4f3..163a0d85e3cb9 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> @@ -34,7 +34,7 @@ struct xe_sched_backend_ops {
>  	 * @process_msg: Process a message. Allowed to block, it is this
>  	 * function's responsibility to free message if dynamically allocated.
>  	 */
> -	void (*process_msg)(struct xe_sched_msg *msg);
> +	void (*process_msg)(struct xe_sched_msg *msg, unsigned int opcode);
>  };
> =20
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 7ce73489c35fc..c4ef3e9bf7a18 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2056,16 +2056,17 @@ static void __guc_exec_queue_process_msg_cgp_sync=
(struct xe_sched_msg *msg,
>  #define MSG_HEAD	BIT(9)
>  #define MSG_PM_REF	BIT(10)
> =20
> -static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
> +static void guc_exec_queue_process_msg(struct xe_sched_msg *msg,
> +				       unsigned int opcode)
>  {
>  	struct xe_device *xe =3D guc_to_xe(exec_queue_to_guc(msg->private_data)=
);
>  	int idx;
> -	bool pm_ref =3D !!(msg->opcode & MSG_PM_REF);
> +	bool pm_ref =3D !!(opcode & MSG_PM_REF);
>  	bool bound =3D drm_dev_enter(&xe->drm, &idx);
> =20
>  	trace_xe_sched_msg_recv(msg);
> =20
> -	switch (msg->opcode & OPCODE_MASK) {
> +	switch (opcode & OPCODE_MASK) {
>  	case CLEANUP:
>  		__guc_exec_queue_process_msg_cleanup(msg, bound);
>  		break;
> --=20
> 2.43.0
>=20
>=20
