Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DDCC02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 07:45:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7E810E780;
	Thu, 23 Jan 2025 07:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LwmxgFdh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688D510E780
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 07:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737618332; x=1769154332;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9Jt8vYuTGJy9R0F+bAy0He+sZoUbPQielCPB/UhQ6/o=;
 b=LwmxgFdhiG9XD/QqHRMUTQ2Fi+f0KRgkfr+DEdvY4KmveZOljeUItS0r
 9M8WXQ4komrjBn1cp7Hrf5EtQUT8Vnoe41HduQTybr7/dDh+wH5AI/uDF
 KI6e8I+M64TpuwQgrAGppfj3pC9KBast1UovwRpLfs0YxWKiV9w6GVi3p
 sTMZgSeNGYW86J0bMBTTG9s1H8pQdG0bu0TqlWYjHUQ8eOJ3rev4cq9WN
 DauAzwRDWVzRlM23/dbgH/RoY1P3dIEitihjPNdHo6fpbzxOy8yjODTmY
 dlQJSrp/fBm5lXi6hCwR2XtPLhkB8acc/iuwszHa9QMFA9h9wcmKBC+g8 w==;
X-CSE-ConnectionGUID: MBBua/BsQD28dEeFXRsmDA==
X-CSE-MsgGUID: +ySydXXASfmmmraZ5PBQMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="60575777"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="60575777"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 23:45:17 -0800
X-CSE-ConnectionGUID: SRTG09/2R0+3Q0qNYHCR3w==
X-CSE-MsgGUID: F0rmapRuRf6zfLUfLEo1kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="112351519"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 23:45:17 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 23:45:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 23:45:17 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 23:45:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6ufaiELsw9KP4cgeWrtS7+XunCG5+1grj6fqUFjYgHi2TnwtY+eHLABcobtY9xRPiIbdx/IDVRqWlbTs5GHqQ74B24aoiMZIY/5dpRm3Wx1aiW3sQSOHCcErDumovG8TikUE+pN+Pcz82mP12lTyobzwwBSlPFSG2X+XWiQnmM4xecKQ6ZLbOa1J0mfsWibA3my+e6w9ca8qTArFxjPGU7SI5poNsQGyvCNcXPI/Jx7vyKCfq5vP0ckDra3ngXywdwsxZhWyUWyDtzNaTjGQ84qywoeHr9Y522CjMKnNxDS+RIWD8T+ZC3Z/lbfQWSYoxzrGK4rbkj3jdjfn3fg+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkAar9mq3r1tFDY9cMldAvuHKlZdu2zz1WktSjpt/Zw=;
 b=XBXkpitLqN7O6ncR7B2YOBaoY/Itfs9iYEmL/10SwXC4Bl37MEZONzgKc/1p0kfjN3R1uHyniNDE/arnjH0F9UrzrR1H0VMgtFn3NvXJZxPIDR2PpyqScAjnOEbKMKhz7aWl3W/wLzmf9rhufFTQxeqvcIjbAbIQfjg4URBMVe+8H5cavcwfloD1NKhPhtDbwDKYH9ZRzulJsIbJgKXhSUaaHIcTCmeBjsFJ+2/faPS+Oavtlbex5tcHCJ5i2hKiEd1IWdqxD+ChJl0JgDzSLdVgDsvMvofRbrV7B9CfTeZ8rU6AJq7cioCoewLThRqrSKt6D5J9JNgXBm33+6v0jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by PH7PR11MB6032.namprd11.prod.outlook.com (2603:10b6:510:1d3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Thu, 23 Jan
 2025 07:45:01 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%7]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 07:45:00 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Wysocki, Rafael J"
 <rafael.j.wysocki@intel.com>
CC: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
Subject: RE: [PATCH v4 2/3] drm/xe: Enable Boot Survivability mode
Thread-Topic: [PATCH v4 2/3] drm/xe: Enable Boot Survivability mode
Thread-Index: AQHbbWTz6AXkthpqmE2qFWeLRwMyorMj+YQw
Date: Thu, 23 Jan 2025 07:45:00 +0000
Message-ID: <CY5PR11MB62113B65DF983BA3AFBBF8C595E02@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20250123072343.326919-1-riana.tauro@intel.com>
 <20250123072343.326919-3-riana.tauro@intel.com>
In-Reply-To: <20250123072343.326919-3-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: rodrigo.vivi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|PH7PR11MB6032:EE_
x-ms-office365-filtering-correlation-id: 72018c57-45aa-40cd-bef0-08dd3b81d789
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?63D2WDliQwlJNt/odEsksElLtwNU+yraJ4sai5BpcCdJhDj1CMvVila92KlF?=
 =?us-ascii?Q?P72W4oCew3SjdPwesdlg9q9rqDPN+i77P6m6dqJXk0uc/SoN0BnTOdQbgj/1?=
 =?us-ascii?Q?CXPcWVw1noJLH48KrKwyfLlhW7B9poQwoRuf1NHl2akH52qKgs8BFzQmvRSq?=
 =?us-ascii?Q?413n8zydLUN6ekHEOzLvgsO9EyUC0yYtLOsJJe7C3gNUySB7e2Dsfpb9ZnFR?=
 =?us-ascii?Q?yHHAKZW7N30Lwt3lCnTRg32K3NlluY99tfR0fiAWO2WdvyrAwf/yWdY7kheC?=
 =?us-ascii?Q?Cpe/6KnSGvSJKaeEUcJcTuE5RtDltcZ0jfGSew8sdZcE4mYIJDkbXdYR5Mdr?=
 =?us-ascii?Q?n7ZnIagwmEkZ6+64Nggk0BaAkmIkLm7DxCH9N73Qj/3A8LXBruuKX6fLivis?=
 =?us-ascii?Q?I8TeaM541dDEBz5Wuyy+ycAjyuV3fhhgYrS39ViRyf6lVVLJrfjsSyoy+KgY?=
 =?us-ascii?Q?cg4C2kdlkVAAw9GG9yIlftqmqzW7rzjZT6rXl/AcUtn2I8/eDYeZZShxVCa5?=
 =?us-ascii?Q?URZOUCQaUnQ8NMX2ZTMAhGIOrhBBFEKsPBxy7ghvcvU02EEUBxUujuI19kmv?=
 =?us-ascii?Q?hqYbHuuMe3ipufMpC/3ohUy++XaqwSqwyl9h1XOydNKdA2z8RpproixnSO6E?=
 =?us-ascii?Q?f01Gmkf9dgGbJ9owO3Y+CIjmtviuDixv4aSdXf0Dehig3ou4oVRed6KbsAEw?=
 =?us-ascii?Q?5xl8i6VV7VUpUI8Wzb+yNLDDNUSq7eB4o4SQB3EFBHMXyvRmzutdlsuuAYmW?=
 =?us-ascii?Q?Wjb9lmnR2Sp9bR+XN9Pypu2y96MtRdHWUigQbgSAkzAkv6QXaG/LHVKXiJmi?=
 =?us-ascii?Q?3UK4QDGK1WWGT4WtHABkxI2etIDGVG4OI73vQmlOzb7N159X04T5mjJqe1Eq?=
 =?us-ascii?Q?GE8kyu2b4HUc5suUhBBms8OmQrChaugBn4joLwWdn6Mvx0VE8eSB86F3DV+A?=
 =?us-ascii?Q?wbkG0m3tr7D36WzE1BdMu66f0mk6VKG46OqRsiRBjyFDvhIU4fvrY7DSi/fX?=
 =?us-ascii?Q?NWQW35zuXmJh+QKxo46L5Hh3AT39NUDzMmcf7H2KkNygqN6v33Cw0Ef+pa1W?=
 =?us-ascii?Q?3Ce7tjTrO5Kp8BCaDs5K2Gyj2Gkla6Af8PSXb/1GHnYHT5tMBTjUIpmMLMaD?=
 =?us-ascii?Q?vSe8+sZ0MWuuZmdHjdJSwn/YnUEAtXPJK56BqdLDzcdFotq5f9JZMinivzcp?=
 =?us-ascii?Q?GfNivi2hNABPTaSy0FKqm+65p6r9I62gTq6RRzR8fnEHYyEmpQMsFowmZ+Mb?=
 =?us-ascii?Q?AW1yusF9mntw7MYhHr04WT/J9bjX7vrwWddZu2fBRfQk5usZXYUECI1FC4CF?=
 =?us-ascii?Q?0/Jlvfl3kZygoeEd/EeOcrQZ0eij8/6Cp7nQ3enX20hQcbCKX/YbvpQkHCwp?=
 =?us-ascii?Q?/7VVdgVvdZ/M+06kUBCRWlog+0N2NRAPA1sTWkeq9Rotfalx6jXaFp1JKN4k?=
 =?us-ascii?Q?A1BY5CuElXcGk/vTvy5KXVuFpkjw7t59?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/hv1Cixe8C6lWmai/A4y3nhi1gFuU8wxp6nw2hjXJzdVx7TVZswZbWpbMWZm?=
 =?us-ascii?Q?C6WcSPuAUOj9GTb5/Dy9A6grn/6EWcVTNbqHC+5v2eKxiEnOL5WCJQ6mlKdS?=
 =?us-ascii?Q?qCksIVxqSHrq7ODYnq/SLOuX7+qrp3QlVug/u5S43rjuvYFnaclBq5uoIEBV?=
 =?us-ascii?Q?9/YHN1wtOFV7MNTH0tFvRAKnrb0eFnBmkxC4V7jio7+I/PxAZLZ9UFLcElJr?=
 =?us-ascii?Q?IDe6hk/qY1lnL0F2lfYTo9zc9GXYT/uUym6x9P6jBLGYdAtOF8TOk0QmKWpR?=
 =?us-ascii?Q?gtPBKp/C0lqMpFYvfINZirvdzj3ZkU9DfR41TSsjXA5eIDYB9aVCdQ9gBbBW?=
 =?us-ascii?Q?7mexy+QrwehdHrfSXuBP12ndujfR6z8nQuuYQYUkNez7VdTECePlYOj3NeBa?=
 =?us-ascii?Q?yy7oDkWOuzvQFBcSRYfTbpE1J2gIPiLgQpvJ0oiCxKDXvnwX4kEyoJRf6FR8?=
 =?us-ascii?Q?LrRvDo/n2/SigeZwOIB2nyzQJTUhoMhh3KpveW40580ljoRKR7Dq+nQ0Tdyh?=
 =?us-ascii?Q?sGea1+pxGoT/apMBcIQxDlxlGbrEKJVafL2JuAM+6ub6dZOMseE343cyOn0s?=
 =?us-ascii?Q?zkdhuc9pq+PTMEwOWhogky/Be/r/fyVKNGroLZ1miBaOCDXLnCq8mnJWpNGw?=
 =?us-ascii?Q?CT6qbN2OJcNgaoLMJPBhKSC//vjJUO/x0tDALL4AHZdU37lT71hBXu5eCYRr?=
 =?us-ascii?Q?IhcsKG56QY/zyvf8vKaUgGBu0Wi5vNYOPYy+2UojAuE5PzsK+EH6RDCxs6uG?=
 =?us-ascii?Q?EU+pzyeQNSZYz0ZT1jHuhcMeVJ5kZHzjdwZyF//HZNq2ZEEnG2dS+txTKWSp?=
 =?us-ascii?Q?XzgXu3dSJ3W5UEcimO/NRGggnI8GC0Z7E67w60V7Ulst38EtXRtE3ESl63mM?=
 =?us-ascii?Q?gfEXQtZ88gh6hSJh7lbGaDrlaZKB2L5ROytLmdFg6G6chsMpRBgEL1lCFqz9?=
 =?us-ascii?Q?hdWbOPWin5KuarZFudg/4dSYOrlYd7dzJ32imm0PN7cos6Te+QrOAHarogQK?=
 =?us-ascii?Q?vA14eLSW7tx3DiGiFAwIVmsnP1FYNpwbZhymD3Vfy/BLstHdy5QWBVz9PL1h?=
 =?us-ascii?Q?NGhooXDZEX8BVAZfl53Vtlf2gFfZFuFpKEi2FY9IrhemIghYjyeDe/TleBB6?=
 =?us-ascii?Q?gHYgEQ1D2Fh8rhV+nxAHedw9kLWePBoXZkrStPdJHjgRsmMKZ2NA37PlFdvZ?=
 =?us-ascii?Q?k0lGnHFBkGiBOCH818hkLhG498XLmOox/DdaVLzb+PqvSW9brm2SXOyFge6g?=
 =?us-ascii?Q?uzOx0YjzdIwgukU2GZAf8Tm3vQ0zbdnYGuEdem6l1lWcwM819HAMsklljOBf?=
 =?us-ascii?Q?UVxaCeh91deifGgzDZIHgV2zOd4nqO4YytKqNvkidz7kA2DqPw90PmAqwBw1?=
 =?us-ascii?Q?nWg009v3xnm+8AiEZjVQ7sDp9IXC1mBnCbPj+zaT4tvjKCI7ZGueiBn8kQ+n?=
 =?us-ascii?Q?D/3owyFqCR4sp1WImp6qkBVWNNXZZeVMaQZUFF36V8oX5vxNn3uqG5ykx/1g?=
 =?us-ascii?Q?dqOmyVwAbjHxxlK1hWmZvcTCjJx87xda5PH1IkE2i0g8cd3VMheu9Ti6S5N+?=
 =?us-ascii?Q?UIxKP08RqvA5NQY2w66hWe8m53hdwduwXic0d227?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72018c57-45aa-40cd-bef0-08dd3b81d789
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 07:45:00.8905 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dmRpS2ysIcoStWPcmz4WDhpMVlfOE3PNA1wFLmfimB5GucWVdDyhQoeTdD77cW0LpP+u1Als7Lnbsv7RVJu98Fp141X8cJBSmYqPVNWLrfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6032
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
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Thursday, January 23, 2025 12:54 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> Iddamsetty, Aravind <aravind.iddamsetty@intel.com>
> Subject: [PATCH v4 2/3] drm/xe: Enable Boot Survivability mode
>=20
> Enable boot survivability mode if pcode initialization fails and if boot =
status
> indicates a failure. In this mode, drm card is not exposed and driver pro=
be
> returns success after loading the bare minimum to allow firmware to be
> flashed via mei.
>=20
> v2: abstract survivability mode variable
>     add BMG check inside function (Jani, Rodrigo)
>=20
> v3: return -EBUSY during system suspend (Anshuman)
>     check survivability mode in pci probe only
>     on error
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c             |  7 ++++++-
>  drivers/gpu/drm/xe/xe_pci.c                | 23 ++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_survivability_mode.c | 16 +++++++++++++++
> drivers/gpu/drm/xe/xe_survivability_mode.h |  1 +
>  4 files changed, 44 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index bd6191e1ed3e..0a938bd0e34d 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -51,6 +51,7 @@
>  #include "xe_pm.h"
>  #include "xe_query.h"
>  #include "xe_sriov.h"
> +#include "xe_survivability_mode.h"
>  #include "xe_tile.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_ttm_sys_mgr.h"
> @@ -692,8 +693,12 @@ int xe_device_probe_early(struct xe_device *xe)
>  	update_device_info(xe);
>=20
>  	err =3D xe_pcode_probe_early(xe);
> -	if (err)
> +	if (err) {
> +		if (xe_survivability_mode_required(xe))
> +			xe_survivability_mode_init(xe);
> +
>  		return err;
> +	}
>=20
>  	err =3D wait_for_lmem_ready(xe);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c in=
dex
> e6ad189294c1..b483c5c90132 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -30,6 +30,7 @@
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
>  #include "xe_step.h"
> +#include "xe_survivability_mode.h"
>  #include "xe_tile.h"
>=20
>  enum toggle_d3cold {
> @@ -766,6 +767,9 @@ static void xe_pci_remove(struct pci_dev *pdev)
>  	if (IS_SRIOV_PF(xe))
>  		xe_pci_sriov_configure(pdev, 0);
>=20
> +	if (xe_survivability_mode_enabled(xe))
> +		return xe_survivability_mode_remove(xe);
> +
>  	xe_device_remove(xe);
>  	xe_pm_runtime_fini(xe);
>  	pci_set_drvdata(pdev, NULL);
> @@ -838,8 +842,19 @@ static int xe_pci_probe(struct pci_dev *pdev, const
> struct pci_device_id *ent)
>  		return err;
>=20
>  	err =3D xe_device_probe_early(xe);
> -	if (err)
> +
> +	/*
> +	 * In Boot Survivability mode, no drm card is exposed
> +	 * and driver is loaded with bare minimum to allow
> +	 * for firmware to be flashed through mei. Return
> +	 * success if survivability mode is enabled.
> +	 */
> +	if (err) {
> +		if (xe_survivability_mode_enabled(xe))
> +			return 0;
> +
>  		return err;
> +	}
>=20
>  	err =3D xe_info_init(xe, desc->graphics, desc->media);
>  	if (err)
> @@ -926,9 +941,13 @@ static void d3cold_toggle(struct pci_dev *pdev,
> enum toggle_d3cold toggle)  static int xe_pci_suspend(struct device *dev)=
  {
>  	struct pci_dev *pdev =3D to_pci_dev(dev);
> +	struct xe_device *xe =3D pdev_to_xe_device(pdev);
>  	int err;
>=20
> -	err =3D xe_pm_suspend(pdev_to_xe_device(pdev));
> +	if (xe_survivability_mode_enabled(xe))
> +		return -EBUSY;
@Vivi, Rodrigo how about using pm_stay_awake() to avoid the suspend instead=
 of returning -EBUSY from driver, Let PM Core abort the suspend ?
and pm_relax() in module unload path.
CC: Rafael to provide if above can be used here.
Thanks,
Anshuman
> +
> +	err =3D xe_pm_suspend(xe);
>  	if (err)
>  		return err;
>=20
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c
> b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 8b7bd6e79eca..14d0ab7b75e5 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -144,6 +144,19 @@ static void enable_survivability_mode(struct pci_dev
> *pdev)
>  	}
>  }
>=20
> +/**
> + * xe_survivability_mode_enabled - check if survivability mode is
> +enabled
> + * @xe: xe device instance
> + *
> + * Returns true if in survivability mode, false otherwise  */ bool
> +xe_survivability_mode_enabled(struct xe_device *xe) {
> +	struct xe_survivability *survivability =3D &xe->survivability;
> +
> +	return survivability->mode;
> +}
> +
>  /**
>   * xe_survivability_mode_required - checks if survivability mode is requ=
ired
>   * @xe: xe device instance
> @@ -158,6 +171,9 @@ bool xe_survivability_mode_required(struct
> xe_device *xe)
>  	struct xe_mmio *mmio =3D xe_root_tile_mmio(xe);
>  	u32 data;
>=20
> +	if (!IS_DGFX(xe) || xe->info.platform < XE_BATTLEMAGE)
> +		return false;
> +
>  	data =3D xe_mmio_read32(mmio, PCODE_SCRATCH(0));
>  	survivability->boot_status =3D REG_FIELD_GET(BOOT_STATUS, data);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h
> b/drivers/gpu/drm/xe/xe_survivability_mode.h
> index 410e3ee5f5d1..f530507a22c6 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.h
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
> @@ -12,6 +12,7 @@ struct xe_device;
>=20
>  void xe_survivability_mode_init(struct xe_device *xe);  void
> xe_survivability_mode_remove(struct xe_device *xe);
> +bool xe_survivability_mode_enabled(struct xe_device *xe);
>  bool xe_survivability_mode_required(struct xe_device *xe);
>=20
>  #endif /* _XE_SURVIVABILITY_MODE_H_ */
> --
> 2.47.1

