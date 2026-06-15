Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73883CD98DA
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 16:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3650010E545;
	Mon, 15 Jun 2026 16:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b4JXw3ud";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD1310E549
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jun 2026 16:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781540279; x=1813076279;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dt71POGoGIvT4+J1C2SfI9lgrl5ZjhX2rtS8tJDBgek=;
 b=b4JXw3udLNN2+F3Z6BEj/VbmrUIWcSFQ3KJ24SkZZMeFglK8HnKRB7tk
 g3b7mQjNW5izKLUEq6L2WSlu1OAIlANXnrRPCHJ9eNTMDiVBdds4Yfkcb
 fDafP++vUo/eO7CA6iq/dMMfpzQavKFsIkJzYOKHCSNkMGt9mXKNkO86N
 loCkyTvtMerZQGuLZEKHGEMmBxzRvj+JfbV3TogvmXxiaeoUYNi3BggcU
 6osxWftAU20ylNwzvMf913zzxG5zygqto1hz6b15YR6WQDS919uqh13u+
 u6vDRkvpYPrQ5DPPT+qTQmGmQUw/cdJKIlI5g4iwHEfF6g0ePZLsiBT2S w==;
X-CSE-ConnectionGUID: 84vm66+iRWufQ+ed9g4pNw==
X-CSE-MsgGUID: e+Bl/vXVTvS+P6g/xWngQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="86128441"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="86128441"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 09:17:59 -0700
X-CSE-ConnectionGUID: ByKrIz7yTJOAxrMXJMHkXw==
X-CSE-MsgGUID: GyHE45k1RCyW8QHW4Qg5bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="251433196"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 09:17:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 09:17:58 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 15 Jun 2026 09:17:58 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 09:17:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNC4xrihQq4QEOVR5zhCZB2mSGwnXX28jF6io14m6Rdcz5H34cfe26UlG+mHVpoLd4duRNzmPwdD1amKxcaJechJCqTry4DtACnni5OAJaJsX13ANCACQs42FjStEsIwU+kVbNQqzP6qvN0tKXa+FqJBYQuLKj8482+UC1Ro75dA38pLMt19Fu/swISMYhWrxthmL3yCUP5+nNBzBmyiJcxcbPAHOqWN0n0+IUlq84DKxQCVQFKHCQesFh2T71p1TL3FVh/PWbS71u1NeDdTyjUfWpt9c939KdlXxmcY2noeEykNyNOan/4QkVw37RAowyaXsQZcwElh7HHtneF0UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/2Vd0aBC8HG7EI+jMQKEYJpepnOhsOIphMp2K8FTdg=;
 b=Eg2FX/OyePt1gyUODeU7CNKHE9I//THTgWeDxglvL+dV92fqQwgnwGuc8HHT5dWYxClDUo5fIuIti9dZ7M5x3SYrcEqdvDy1sonwv/ARqAEP9mEizD/1JDTZuzvUj+nfbZq20Lc/EDTep256REcHg6ODHSAnbhHqnLj8IGVbSG+2zBku+a/5Xe2Nz0Dx3S71KHNRooeg2C1N2f9z8xWJ2apDlLmH1zCbYG5l1AzRowYi8l1/7HWG6YQtfHCKPqBmtGj1cFipzWfSuEiVFI/OwpwR8k5m7m+U+ZCuRkAcfyULXPA4YavJW5FtezqsbWrDC5rKerD9wU3SWZzmID6gWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2717.namprd11.prod.outlook.com (2603:10b6:805:60::32)
 by IA1PR11MB8248.namprd11.prod.outlook.com (2603:10b6:208:447::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 16:17:55 +0000
Received: from SN6PR11MB2717.namprd11.prod.outlook.com
 ([fe80::5d50:a82:a1d8:7b90]) by SN6PR11MB2717.namprd11.prod.outlook.com
 ([fe80::5d50:a82:a1d8:7b90%5]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 16:17:54 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4] drm/xe: Disable scheduling early on FD close to avoid
 CAT error cascade
Thread-Topic: [PATCH v4] drm/xe: Disable scheduling early on FD close to avoid
 CAT error cascade
Thread-Index: AQHc+tWEcHr6JWFy3Uye+tiokUFHFrY/rTzw
Date: Mon, 15 Jun 2026 16:17:54 +0000
Message-ID: <SN6PR11MB2717BFED11DC3E42E4450A00E5E62@SN6PR11MB2717.namprd11.prod.outlook.com>
References: <20260613013859.3886196-1-matthew.brost@intel.com>
In-Reply-To: <20260613013859.3886196-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2717:EE_|IA1PR11MB8248:EE_
x-ms-office365-filtering-correlation-id: 8a1859f5-4bbd-4dc7-dad0-08decaf9a81d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|23010399003|376014|38070700021|6133799003|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: GRgyBAE58fM/1OsWiSWXXDJjWlOtgOHKxiHxdU+Y7E2igy7mz3jQtFPzT0wCz5Te/w3HCgd6quRfToICEiRgfqu1U9N7DS9tcULoOMVnR2C2lB8YaSSFbl/G6kSy0Wv4SbdLjHJFAhoEhh7MToGTHpuE8C7ZrXwzQDzO+I+xhP647u1jKQnDKGdMhlCLqRL1QqHrPlRM4kDHtBY2MOfpgxiVBQG6iIVkCBAjoj/dqhB4A5F77Y8USMG2bQ39Nwa13yMNVGWWom6HxYGVXg5WxBN1jDpVuoXuYHql4/1fGrEiYNpIIPCsWYrUXvmgJhcc/NV4nKEypvNF/QBfMWjQiT/Uqc/2gdW94BPdOZlktA6xNhxKHybQcneO3Gi5QdlpqS3xMjZyb46WFSamSAwHX9iVLonwEgt/BxYjQTRc4kaqOmyFBDh/luL/1XWX8F2bbHtHjBSKrcBPx4qLKZ5usPDGEQDoVnOx0ecBpyWH6U2hgEAsVNSdLEV/Dp2YVgm+R/6MAse8qDOOnGedelE2BAiLisT0qtRpMO0koJwl2SSPB4F3kQD4gxHArlPUpD46VI3/pV0Y3li+UeVLVn7/c7iA/FbXg3hJ/hu3dNJRiri1f1kKx11bSeCt/CzpSVQeGSPwIvgWEoroxA8d1VPE0G6Ev5bBKN495YKoI52OXvqv5wAUJJVNHoOWLIlVX1VAuCAzvlqENdvlIW+JAyVh0jU9jvB4CEnN6QXGbr4RsWpXhqK+rdLBhLbJAkpzIMRv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(23010399003)(376014)(38070700021)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q1OxYLP5xOp2O1dkPmnFPmvwxwOixSEX2chdXysWBBqfbfy4W46RsJF7pI9v?=
 =?us-ascii?Q?XHVSGMtm7EOfrIVwZInFlT+i+p9E+a+jJlFcyJFPflwebLZyYPjyTIeHmHTW?=
 =?us-ascii?Q?Es+RPWn/ZCuTYzOSMRC+oxDZZhC7ozZM/Uonq65GxNLCgHBq1PFwfX/feV9v?=
 =?us-ascii?Q?z6cZmVISn0ZAmPs/2XlwByeQ846KnEar23aNtOYWYSCwED85ugS1QSjHgJun?=
 =?us-ascii?Q?ChcHKwo/JWF5uPgd7RG1i3lIUQXh7g3zRIRGpPln+jKHKtJMb/0U0NTxeI70?=
 =?us-ascii?Q?YjKgrDITPiiDlMIB7RRwlqHXhNoDZFxQt7v7p5MvMYWx4yNF+sF6lH0RyotU?=
 =?us-ascii?Q?CMTaZogOFOqpg1GAqefBFZEyREt2o3vDkMpo+gZxqilawO2si/e5RInzQh9Y?=
 =?us-ascii?Q?V/TpVUYjrk2V7zLjJG9/29OlW8Vd0+zq+TUzMITAaOsUOOU18yaTcYeqcWBG?=
 =?us-ascii?Q?hB7sugHiGgpBi4qaw9j9Gf7D0mbaJFGozriJ5CQd6v3maB5NiP6VOUyWFceK?=
 =?us-ascii?Q?HBzSwiKd6KUUZi6nmhKJH/F5RgOMCouHKPvFz/VQEKC0YcngH0fgU/Zd9xEY?=
 =?us-ascii?Q?wjwQGFfZJvMc356WR3RmgcHJnClQ+DpUPalwP/+6kRDBKc5q4RJryPFKncbc?=
 =?us-ascii?Q?HN9Rnk4GOTqDRSP1d/YY4pkdYOkO+YdDzaTXYcOAP+rOsUZjs/KyBd34zzfo?=
 =?us-ascii?Q?tmDzatK6/k2So+eLIrKwhuv0aN8RcZ80uJ1ZUR+XPCRQvSG4kGlO6qieAb7P?=
 =?us-ascii?Q?1pQqxJbfFF9qoJIsM/FwoC/PbPd0/O0gAI7OvkR8SA9RgzBtjWAUtDE0I+8h?=
 =?us-ascii?Q?GW/T1UQ+VS/qokjCVaWo//jAhfdPpBcJJpvvL2ToyldDFYEbY5DzDdy79h6g?=
 =?us-ascii?Q?ZkzDduyG8zoysPC8itk0b6yPdiGIYq4NpgOGlMlQoYNVeynDKV3gcjMpto+0?=
 =?us-ascii?Q?5fbzEsH6boUVzzKK3OJgKg71DCaRxbD5INEYyWEdJBYT6rmi3WLmKfOd7mD2?=
 =?us-ascii?Q?0w/A2PW6A9BghNmRQ9oIgv+YvPbqMGgm8gUo2T1NE+xXgk1tvcqEb1d7kZ0Z?=
 =?us-ascii?Q?m8cxps7iW0GL1CZpKR873OWCHgYAkVSstCCOBh8FuHNpTGTCNBVpTh2wfM9f?=
 =?us-ascii?Q?TDJWqjGer4V2e81zEF1tXMbkHZQDp+PDE3MtRq4pOfLfE81gs4OEwd+rIHFo?=
 =?us-ascii?Q?rEpCc7KmH7krZHN+FxNxx2Trh53Gkv4UjwC68NscjYhB0ypTigUidM0AFBk1?=
 =?us-ascii?Q?wBWR/esTwM1fqmS9fUlFfrFGqokHUG/NQBYQaG/9I0tXpBqwWUorN1PEC6nb?=
 =?us-ascii?Q?TknTsvoTKO42tSGc+/KGpvDFkgRC2p0HSpHCKThQ+qxBUylF6ypyjqNYHEhI?=
 =?us-ascii?Q?WEycGcd44ACHzHvPm9/T+hadhNA4ETpY6qJFo9WIpuzgFVmJ+xsk/SB5CaDE?=
 =?us-ascii?Q?/klpLzJ08dpc+cGKiH9jp8uJ9QSeiwpL2GMwPQYctLAAeTG/hvFYi5Oim5F7?=
 =?us-ascii?Q?ZAoTQgD3r+vT/z+1oEXYvjCOKKJdJsxLN2f1jWvm473XT4uIqOwSC2WpV44/?=
 =?us-ascii?Q?4gXWw5OVkXAzE0hd3HMx0CAmYJ3n38sEic/MQ8fGViZhcA+1l6ZnTV1FI7dF?=
 =?us-ascii?Q?JA5jUTgTty3RrUjHd+up5mw/w4nTedLFgvzIKxVGmsGZIsXm0wRKH2bhdLph?=
 =?us-ascii?Q?8L9evMYXmylg3ok0JMkl1SI1a/SHQniUFFu9FaH/zE1g44FnWDLryTkj9Ya3?=
 =?us-ascii?Q?SrrVHVLlgW/Bgm635wGt3DWSiOTyPau7GCsHa5xVdBHoRjtl08eHMM8nrOrD?=
x-ms-exchange-antispam-messagedata-1: 64fUvhMjnNFP8w==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: AllGtzUSeK4uk3jiuL0Q8v2IsNF70q1hlFBZxTkJRrNsGDhu93ywtU8NmJMVnA6QpNLnrdGc6wGRG4Ni7i+FcdkAOOlFzxXzl7Vjd308PyR1SLw1mqcFJq8PZKWFzZ5HDpvySDmrPBrKioi9QYKiQbVRZrtyW3tuP9RU75HOgUc9AGyVNMxbbmJVUX7GENbzyQQglbZOYjTQCl3DYuOPshPOHyQqFevHK2XcelVAnVUWI8f6lXaTRdkGDMmmS55XgW732hQeH5yKelyQxp6AYyF43C+80Y0p6/QFXph5phUSjpkDrS7HHCT2mWSJTpILFzFeyAaSIJlBveW2bZirbw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a1859f5-4bbd-4dc7-dad0-08decaf9a81d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 16:17:54.8843 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ptj7HkPXOKqFagy6iw5ye0FMiw2wmUfEkwcCtjMD1KclRpslXVRLs+dOqudz7UrqvdBhWeQJQIcsAMkV+bQdcNaT0n6sm60g09sX1o6+lvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8248
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
Sent: Friday, June 12, 2026 6:39 PM
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4] drm/xe: Disable scheduling early on FD close to avoid C=
AT error cascade
>=20
> When an FD is closed with many exec queues, teardown relies on the TDR
> path to clean up scheduling. However, the TDR handling is serialized
> (i.e., only one exec queue is processed at a time), which can make it
> too slow compared to GuC scheduling activity.
>=20
> In this window, GuC may continue to schedule contexts backed by
> invalid page tables, leading to a cascade of CAT errors and repeated
> engine resets. This significantly increases recovery time and can
> degrade system stability.
>=20
> To mitigate this, eagerly disable scheduling by sending a self-message
> outside of the TDR path. This prevents further scheduling of invalid
> contexts and avoids the CAT error/reset cascade.
>=20
> This change improves robustness and reduces recovery latency in
> multiple queue teardown scenarios.
>=20
> Cc: Wang Xin <x.wang@intel.com>
> Cc: Jia Yao <jia.yao@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Tested-by: Jia Yao <jia.yao@intel.com>
>=20
> ---
> v3:
>  - Make kill message static tomake reclaim safe (CI)
>  - Do not issue kill messages for queue which bypass cleanup messages
>    (sashiko)
> v4:
>  - Add missing message lock
> ---
>  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c           | 44 ++++++++++++++++++--
>  2 files changed, 42 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/d=
rm/xe/xe_guc_exec_queue_types.h
> index e5e53b421f29..247947fd357f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> @@ -31,7 +31,7 @@ struct xe_guc_exec_queue {
>  	 * a message needs to sent through the GPU scheduler but memory
>  	 * allocations are not allowed.
>  	 */
> -#define MAX_STATIC_MSG_TYPE	3
> +#define MAX_STATIC_MSG_TYPE	4
>  	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
>  	/** @destroy_async: do final destroy async from this worker */
>  	struct work_struct destroy_async;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index afe5d99cdd8b..5ec1dca0324c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1875,11 +1875,21 @@ static void __guc_exec_queue_process_msg_set_mult=
i_queue_priority(struct xe_sche
>  	kfree(msg);
>  }
> =20
> +static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg)
> +{
> +	struct xe_exec_queue *q =3D msg->private_data;
> +	struct xe_exec_queue *primary =3D xe_exec_queue_multi_queue_primary(q);
> +
> +	if (exec_queue_enabled(primary))
> +		disable_scheduling(primary, true);
> +}
> +
>  #define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
>  #define SET_SCHED_PROPS			2
>  #define SUSPEND				3
>  #define RESUME				4
>  #define SET_MULTI_QUEUE_PRIORITY	5
> +#define KILL				6
>  #define OPCODE_MASK	0xf
>  #define MSG_LOCKED	BIT(8)
>  #define MSG_HEAD	BIT(9)
> @@ -1906,6 +1916,9 @@ static void guc_exec_queue_process_msg(struct xe_sc=
hed_msg *msg)
>  	case SET_MULTI_QUEUE_PRIORITY:
>  		__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
>  		break;
> +	case KILL:
> +		__guc_exec_queue_process_msg_kill(msg);
> +		break;
>  	default:
>  		XE_WARN_ON("Unknown message type");
>  	}
> @@ -2018,11 +2031,39 @@ static int guc_exec_queue_init(struct xe_exec_que=
ue *q)
>  	return err;
>  }
> =20
> +static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
> +				       struct xe_sched_msg *msg,
> +				       u32 opcode);
> +
> +#define STATIC_MSG_CLEANUP	0
> +#define STATIC_MSG_SUSPEND	1
> +#define STATIC_MSG_RESUME	2
> +#define STATIC_MSG_KILL		3
>  static void guc_exec_queue_kill(struct xe_exec_queue *q)
>  {
> +	struct xe_sched_msg *msg =3D q->guc->static_msgs + STATIC_MSG_KILL;
> +
>  	trace_xe_exec_queue_kill(q);
>  	set_exec_queue_killed(q);
>  	__suspend_fence_signal(q);
> +
> +	/*
> +	 * We eagerly send a message to ourselves to disable scheduling, as the
> +	 * TDR is serialized (i.e., only one exec queue is processed at a time)=
.
> +	 * If an FD is closed with many exec queues, the TDR can be slower than
> +	 * the GuC scheduling contexts with invalid page tables, creating a
> +	 * cascade of CAT errors and engine resets, which is quite slow. Avoid
> +	 * this by immediately disabling scheduling outside of the TDR.
> +	 */
> +	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) &&
> +	    kref_read(&q->refcount) && !exec_queue_wedged(q)) {
> +		struct xe_gpu_scheduler *sched =3D &q->guc->sched;
> +
> +		xe_sched_msg_lock(sched);
> +		guc_exec_queue_try_add_msg(q, msg, KILL);
> +		xe_sched_msg_unlock(sched);

If the issue is that there's a race between TDR and GuC, and the solution
is to 'immediately' disable scheduling outside of the TDR, then why aren't
we issuing the call to disable_scheduling here directly?  Adding the reques=
t
to the GuC scheduler still leaves us at the whims of the GuC scheduler, and
if it decides to schedule contexts with invalid page tables before the disa=
ble
scheduling message, then we'll still hit the CAT error cascade here.

I decided to test this modification and saw some positive results: After 50
iterations of the reproducing test, there were no CAT errors.  By compariso=
n,
this patch as it is had a roughly 5% CAT error rate, which is significantly=
 better
than the current state of things but still has room for improvement.  Grant=
ed,
the reproduction rate is low enough with this patch as it is that the reduc=
tion
in repro rate may have been up to chance, but I think the experiment
suggests the primary exec queue should have scheduling disabled directly.

-Jonathan Cavitt

> +	}
> +
>  	xe_guc_exec_queue_trigger_cleanup(q);
>  }
> =20
> @@ -2066,9 +2107,6 @@ static bool guc_exec_queue_try_add_msg(struct xe_ex=
ec_queue *q,
>  	return true;
>  }
> =20
> -#define STATIC_MSG_CLEANUP	0
> -#define STATIC_MSG_SUSPEND	1
> -#define STATIC_MSG_RESUME	2
>  static void guc_exec_queue_destroy(struct xe_exec_queue *q)
>  {
>  	struct xe_sched_msg *msg =3D q->guc->static_msgs + STATIC_MSG_CLEANUP;
> --=20
> 2.34.1
>=20
>=20
