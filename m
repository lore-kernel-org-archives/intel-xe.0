Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D586ACEACE7
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 16:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C0910E04B;
	Tue,  1 Oct 2024 16:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YySmzrP/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6078E10E04B
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 16:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727800511; x=1759336511;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5DcJyycSa861z7SyWyfWFIBHNDG2INC4UGYyVIFXiXw=;
 b=YySmzrP/a/KlXvcebMRCh2ugwLX9IZr5z6v9ipI+tEuSLEaQPL8ounB6
 DO2MZVO+uCF6U4ldv66h6RZHPoa9Y37iHtH0twawAbgQ9YTO74hqQVXRR
 PzLmnzyf03iVzVI2d1X2X0S/Ql1a/eMJJZFFzJjH5bkOWj0hWmpL9X+oy
 /egYDNvaPCxb0/d1or+rsYeWYYtnbQdaG64TYYWKWthGeSswA6wVRTngn
 AD61krw4qx9hbCyIZiOnxNNfRMREzI6UrOqqRCA7rHKCEt2WvNbKT4nZQ
 bxMRHtDIySi2S3lWPOnk7asmZqRAhrK4OVfSD0kuU7s3XeQsXDaxDDin/ A==;
X-CSE-ConnectionGUID: 6yrgMsNXTF2yud75Bfql0Q==
X-CSE-MsgGUID: 9IEo7+yNTOqPmlrHfB6hOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="44407955"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; d="scan'208";a="44407955"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 09:35:09 -0700
X-CSE-ConnectionGUID: sPjLZ8DpQIWYYqZjtklLBQ==
X-CSE-MsgGUID: zhdawO7fT5u/sM4S6oJ7vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; d="scan'208";a="78689841"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Oct 2024 09:35:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 09:35:09 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 09:35:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 1 Oct 2024 09:35:08 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 1 Oct 2024 09:35:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxJrz4m32aK8noQxwz1jM8HJCrV/8TUhpgHHPRV34dpYImVZWXyaacmEBUJc0VLdhQQPAScAfcxoYlZZzW04v3HLo88m9koz/LNBqD8x99PDo+kyCPna32pEc3aA2uHgaJ/RM/Zkrkn6x7q0VCeIjgzxzy9LsHgUNAs/7u9KHlfIYQJwkczTj1agyHC1uGHaGL3uSDeOBtjp2q6CxBfy3R9HDNHLUbWm4jnL/COJzv4/9v2wrx3Yg1PPxZlfzuR7mgF9C5pe8+W/tVc5s8CgjHwBzc6+t7RfLrBYdtusLceIaJLWtFFvIzHe7S4Ic71Ov7CkaZCK8qxoruy6785x3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3Ly1qyEU7UyeXAQS1hu7ac9Vw5jHOZLG/uD8IIesmg=;
 b=youhrQ7NrUi4io3XPYl0okp2y3lj+maKHk1yX25g62mocWfnqAt6e1HjixWUFc0n51f8o70KpcA/8mMNqIt6a6MLlGToTomrtI+Y9pfK3mDz+gSwBBUn3UkNnE50OkShub2+H2kxsbyINVOuykmnuVBlsb/gITtEmCMEvP5+bkQQAoGRzhSxMbCxLRFcSCqsHNhXKi6Fvwu2WZ/LYp59AsCiJhE8OobWP2fna1IXuTLop6QS/KR4gcVBWOdn5i8TbcnDtJNRRIEESavTzVKaGIlTRVTIS2ZWTUvUx625RKAOxP+nGzJpCiRuZJyjvuO9TdfFZ+j28Z2c2q3s+Vw/vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB6858.namprd11.prod.outlook.com (2603:10b6:510:1ee::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 1 Oct
 2024 16:35:02 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 16:35:02 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Singh, Apoorva" <apoorva.singh@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Zeng, Oak" <oak.zeng@intel.com>, Brian Welty <brian.welty@intel.com>,
 "Singh, Apoorva" <apoorva.singh@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/uapi: Restore uapi for access counting
Thread-Topic: [PATCH 2/2] drm/xe/uapi: Restore uapi for access counting
Thread-Index: AQHbFAfwil2Fr/HFeUyTU5rvqhOxh7JyFTUw
Date: Tue, 1 Oct 2024 16:35:02 +0000
Message-ID: <CH0PR11MB5444B2DD3383189ADB32D0D4E5772@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241001135432.447074-1-apoorva.singh@intel.com>
 <20241001135432.447074-3-apoorva.singh@intel.com>
In-Reply-To: <20241001135432.447074-3-apoorva.singh@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB6858:EE_
x-ms-office365-filtering-correlation-id: 026db6a9-2b6e-41e8-9acc-08dce236ff74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?QT/mjQ77YqAzjdgvYiCpPy6L7yZa22I2EgzmTwy3O39rukIU+joFeULAjHzz?=
 =?us-ascii?Q?UfPu6ctI+AJnFnBH7EjyHDgt4EEoBcdVCSwKcstObLsWRKvGf7MrTAHViXKj?=
 =?us-ascii?Q?HAIqOh5yARk7pOWta8ZeG0qHn8iajcH8e9njj9FSID/xZNKwbbWm6o7FIoVI?=
 =?us-ascii?Q?SeGD2eOiISkUaeL5LdHgyH5wy2BPFdbbOndhq85SBOCuxWkfFSjlGWFsY/13?=
 =?us-ascii?Q?5EjG8K9IQZddZF7dRqTTdkmGw25ru1LUbcq3MKJGfkqBt+2q4pW5YzMnBfLc?=
 =?us-ascii?Q?eG+6bsr/8aeDYO2zMqfMUDmelCcKeHejLwz3aClQgbL5HYN/8WRsCO8LWWh7?=
 =?us-ascii?Q?nXPemfAQirb2zAsbzKjhf7N72ZwnchM1Zv3D0VNC8aIk3jeL+mCVaFDA3ztm?=
 =?us-ascii?Q?OfP973XJWLLPacHRaM4CxYdsqr21151WIiu/6tacyLbjLL6tx3Jtssd6E4LI?=
 =?us-ascii?Q?MI6eceKl7guU8Hp/LQNfJ9Kbn9ec5Ef1unLEGdPx1Os1fPEmccMqleMb6AFX?=
 =?us-ascii?Q?Es4aQz12fGnURkjaDTbrvgZQbHHUMe8SQqYL4s+TwVyk9PLti6LJPYqbhKZm?=
 =?us-ascii?Q?LdoPGeEMl9bENE0TMBCtK/gYvOxh0j+msPsvpHSvL7D3mCA0eLN6X6xpxHJk?=
 =?us-ascii?Q?qf1jys4RVht2xqykx+FnT6SAZrzESpA/bw26hWXFIv+O4zgcKZcJnrhzEnUT?=
 =?us-ascii?Q?XNO2u5PjRdy92m1CLFrvy8IKtrBonXkF6V/aLqUxG17g/0h0iltrcSEoLvlf?=
 =?us-ascii?Q?pH36eOq8lJv4PK7pQQtb+AwvuOUaD4R0rqbdwUMVdJ/eUQkl8ol0C9ZCoGbq?=
 =?us-ascii?Q?ZfgtnxsWo7oT6eNI4COVyUc7e6rXd4FQS5/tkqZQIT+4kdkF6n+GsKftA4B9?=
 =?us-ascii?Q?TYgmZ5m+R2vwfM8+cZySBfc0waTEGhk4K1W/L+rcloQLVvHiA4InlZd31brg?=
 =?us-ascii?Q?eCKeSFIbUwOOac6IyRa0EVGl1iaimpySTO6I6rmIygmdjhbhVH18LHKapgCO?=
 =?us-ascii?Q?Cx7XLIF182ol7VANKZklLIjHRnEkHvCX+8eKqYZLDGR8uQ2gj+2erOAMoB6R?=
 =?us-ascii?Q?ZNhpxhl0da6biRSbx6yVJtaA6bFxNrVA38FDtoB57Eu/3dHzHil+2vKl58VC?=
 =?us-ascii?Q?kjZY9TrXNDdADH0dPl9sve06py/fXockS0ot5FJxd4PoZRmaMkI88N3G81vz?=
 =?us-ascii?Q?5C1CQM9Vl1CNvSWkqEGq0nRo8PxrOo6lqRtTQXyUXdmtPBgNvJjmR3nIyn9y?=
 =?us-ascii?Q?yS4JRlx0oD9l8TyegopYJDyOnwjdWV534Z9CJlpCqI3eO0K4FenBzlDcx51C?=
 =?us-ascii?Q?4Im5ZZ3kkNB+feAzL/YPI+qkJxQvxcE4r8WTGuohny5Hqw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OUYro8YjYSzCrXwkoTVRODxT3CS0jWqaIT28HbHshcNI6Vmb2w0I+fFgyuOj?=
 =?us-ascii?Q?va6UpRtGr5c/c0L7cEM3/4IdL8BTWy/r1hOGzIwk/k1KUO+SHZQH5pa/RcCX?=
 =?us-ascii?Q?0b6Ly+ZyE9d11Y423rXcY5aV1tooUFUXiE6lVlBZPzoLO4ugzL79cKthxqBy?=
 =?us-ascii?Q?hpJnHrsgnN+MW2oT+KV1ct1QYE4zxVGbJHAP3s4maziEmvtJMGOiYNAlUtzN?=
 =?us-ascii?Q?CP6dQw3u2HdgrbCY7iNA12+ygD5aUpxOFQ9yGx8G1xyXoP2fgOIgU80w5bhK?=
 =?us-ascii?Q?w6LsaVWkuOhqmCDk71qYHkDG4xoAMJSzGOTFte7PVuEyCNuLK9UrTpbG+eaF?=
 =?us-ascii?Q?Gz0mH8pWW1TOSoc4juBYbYBoqBMr5ST5L36reFRV3JWuY0CZ+pXcNUHgdj0n?=
 =?us-ascii?Q?9ETVup0woroJdBUhnrRcBDk9y4/qA8Xi7NvohcVbKbcZ8fUTd1/gdQkS4Gcx?=
 =?us-ascii?Q?T0NNryb9xmE/gnaptux1Vq0LLzxlUA1EM9SY9bgqKlasU+m3OpU453Q1UYLb?=
 =?us-ascii?Q?WtvVog6okOvGDUbYBHy8o6GsrJ0cBECQrGBL8VhcF6xMerbS03tSE5QcwhW0?=
 =?us-ascii?Q?mQ5mczwwwK9saqb4RVhjuwFaZgpb50FotTeQifJDTyXoikbL35iGAIsynKk2?=
 =?us-ascii?Q?DaS6ryeXpLco0EGsEBjGJp8QO6lf2Ulq7QYjRUm5f0Fit2FoCiPDl0XP38K9?=
 =?us-ascii?Q?6++722KNlpkAdKqJbElWrW1sVqR/rGpGfqeMjicv3ymmu+nEM+SVWhiSIHo+?=
 =?us-ascii?Q?li3Lx9Rp9XN+Ey6yB1kad6z3pmI7TRlQm84vEt8MAzqgjWDfw0p1rrgyp3En?=
 =?us-ascii?Q?XhMjePt8LReqrGbiGTodcA4psC9YaXNBCCUsLomN57G9VsE5SETLA5uEyaU3?=
 =?us-ascii?Q?Jo/e11xExdiUnE8Z3JbRs3ouSZwi1PJ8hDnLylhrkR7CFxTupTQ52GQQ5BFN?=
 =?us-ascii?Q?Q+LICaB7JBGYqpmrmkg4id+LtKw4gdvhhocLP3D2VoiieSV9FWD/rBwBHcwF?=
 =?us-ascii?Q?AbhXDnyf6sOdlRhuIkitUJ0RW4jOt9UiM0iKbTUCADJJmh/VvNxXYBEfvaZu?=
 =?us-ascii?Q?GBXkLDZlkes6PQGOT5/30LwyWfLhA3XqxR63+9px3+qadbXWXAazRhZyjS2m?=
 =?us-ascii?Q?WaJUhSnK/UUYix0U9/22SlwDMz/X1DlBD8smyEzMwnUIynjlhjdq3oEJAqXW?=
 =?us-ascii?Q?U1R29TQO1SlLiKBNeDmlIL/yTEPW30s10y65mKkBe0tWElXC7ao/efkImj7P?=
 =?us-ascii?Q?SETNBnw5jFrg8uz13+uWWpBv9qrKqMDiAH9J0DPyadfID8wrscASXvFTpsyv?=
 =?us-ascii?Q?NQ9Mk9vtWANq/5Mo+9u6s9jjSnlV0du9yEnNhqwlEOtfBQyLKJ+YWQWBzEuS?=
 =?us-ascii?Q?tx6+NnVxSs6IrqclgK8UA04rZtIsI98QIEmMDb0F4IhgeLeidz+RmrqQsP0Z?=
 =?us-ascii?Q?8yyQvZgUkG9n+QBOC1h4AoWGb/9AluAFsXAYgDtOTc8076q+sAMJZew+tMS9?=
 =?us-ascii?Q?3I6dV6OT5PKOHJDaCQZSccricwGjV4s7ViFB+v31PU62zM0jPNdMZZoBsVsN?=
 =?us-ascii?Q?2kdqAzsT1w/xzAb0XEUL04VefVYrLeYWGKkVxB2g?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 026db6a9-2b6e-41e8-9acc-08dce236ff74
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2024 16:35:02.1361 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j1EBoePeN3Ph2hnwRuQlQWVRY+ZiLCFZs/DokiNcahfodhH1JqfFIWqBVcxuqW4atONzgDgqJkTzVnVCRC3C+uc/VAnL3phTsJNyaFTuDhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6858
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of apoorv=
a.singh@intel.com
Sent: Tuesday, October 1, 2024 6:55 AM
To: intel-xe@lists.freedesktop.org
Cc: Zeng, Oak <oak.zeng@intel.com>; Brian Welty <brian.welty@intel.com>; Si=
ngh, Apoorva <apoorva.singh@intel.com>
Subject: [PATCH 2/2] drm/xe/uapi: Restore uapi for access counting
>=20
> From: Brian Welty <brian.welty@intel.com>
>=20
> In order to enable access counters, this must be enabled in LRC for
> the exec_queue. Add basic uAPI to set configuration of access counter
> trigger threshold and granularity.
>=20
> When access counters are enabled and threshold is hit, the access
> counter handler in xe_gt_pagefault.c will migrate the buffer to that
> to that GT's local VRAM.
>=20
> Signed-off-by: Brian Welty <brian.welty@intel.com>
> Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Though, of course, any UAPI changes need to be additionally validated by th=
e
UAPI team.
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 46 ++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 10 ++++++
>  drivers/gpu/drm/xe/xe_execlist.c         |  2 +-
>  drivers/gpu/drm/xe/xe_lrc.c              | 16 ++++++---
>  drivers/gpu/drm/xe/xe_lrc.h              |  2 +-
>  include/uapi/drm/xe_drm.h                | 11 ++++++
>  6 files changed, 79 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_e=
xec_queue.c
> index d098d2dd1b2d..4114a5ca04cc 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -117,7 +117,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue =
*q)
>  	}
> =20
>  	for (i =3D 0; i < q->width; ++i) {
> -		q->lrc[i] =3D xe_lrc_create(q->hwe, q->vm, SZ_16K);
> +		q->lrc[i] =3D xe_lrc_create(q->hwe, q->vm, q, SZ_16K);
>  		if (IS_ERR(q->lrc[i])) {
>  			err =3D PTR_ERR(q->lrc[i]);
>  			goto err_unlock;
> @@ -392,6 +392,42 @@ static int exec_queue_set_timeslice(struct xe_device=
 *xe, struct xe_exec_queue *
>  	return 0;
>  }
> =20
> +static int exec_queue_set_acc_trigger(struct xe_device *xe, struct xe_ex=
ec_queue *q,
> +				      u64 value)
> +{
> +	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
> +		return -EINVAL;
> +
> +	q->usm.acc_trigger =3D value;
> +
> +	return 0;
> +}
> +
> +static int exec_queue_set_acc_notify(struct xe_device *xe, struct xe_exe=
c_queue *q,
> +				     u64 value)
> +{
> +	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
> +		return -EINVAL;
> +
> +	q->usm.acc_notify =3D value;
> +
> +	return 0;
> +}
> +
> +static int exec_queue_set_acc_granularity(struct xe_device *xe, struct x=
e_exec_queue *q,
> +					  u64 value)
> +{
> +	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
> +		return -EINVAL;
> +
> +	if (value > DRM_XE_ACC_GRANULARITY_64M)
> +		return -EINVAL;
> +
> +	q->usm.acc_granularity =3D value;
> +
> +	return 0;
> +}
> +
>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>  					     struct xe_exec_queue *q,
>  					     u64 value);
> @@ -399,6 +435,9 @@ typedef int (*xe_exec_queue_set_property_fn)(struct x=
e_device *xe,
>  static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs=
[] =3D {
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] =3D exec_queue_set_priority,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] =3D exec_queue_set_timeslice=
,
> +	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER] =3D exec_queue_set_acc_tri=
gger,
> +	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY] =3D exec_queue_set_acc_noti=
fy,
> +	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY] =3D exec_queue_set_acc=
_granularity,
>  };
> =20
>  static int exec_queue_user_ext_set_property(struct xe_device *xe,
> @@ -418,7 +457,10 @@ static int exec_queue_user_ext_set_property(struct x=
e_device *xe,
>  			 ARRAY_SIZE(exec_queue_set_property_funcs)) ||
>  	    XE_IOCTL_DBG(xe, ext.pad) ||
>  	    XE_IOCTL_DBG(xe, ext.property !=3D DRM_XE_EXEC_QUEUE_SET_PROPERTY_P=
RIORITY &&
> -			 ext.property !=3D DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE))
> +			 ext.property !=3D DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
> +			 ext.property !=3D DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER &&
> +			 ext.property !=3D DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY &&
> +			 ext.property !=3D DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY))
>  		return -EINVAL;
> =20
>  	idx =3D array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_prop=
erty_funcs));
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/x=
e/xe_exec_queue_types.h
> index 7deb480e26af..cf4ec4bfdbfd 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -128,6 +128,16 @@ struct xe_exec_queue {
>  		struct list_head link;
>  	} lr;
> =20
> +	/** @usm: unified shared memory state */
> +	struct {
> +		/** @usm.acc_trigger: access counter trigger */
> +		u32 acc_trigger;
> +		/** @usm.acc_notify: access counter notify */
> +		u32 acc_notify;
> +		/** @usm.acc_granularity: access counter granularity */
> +		u32 acc_granularity;
> +	} usm;
> +
>  	/** @ops: submission backend exec queue operations */
>  	const struct xe_exec_queue_ops *ops;
> =20
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_exe=
clist.c
> index f3b71fe7a96d..33f5b31ea0cb 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -265,7 +265,7 @@ struct xe_execlist_port *xe_execlist_port_create(stru=
ct xe_device *xe,
> =20
>  	port->hwe =3D hwe;
> =20
> -	port->lrc =3D xe_lrc_create(hwe, NULL, SZ_16K);
> +	port->lrc =3D xe_lrc_create(hwe, NULL, NULL, SZ_16K);
>  	if (IS_ERR(port->lrc)) {
>  		err =3D PTR_ERR(port->lrc);
>  		goto err;
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index f0976230012a..3be668caf700 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -891,9 +891,11 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
> =20
>  #define PVC_CTX_ASID		(0x2e + 1)
>  #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
> +#define ACC_GRANULARITY_S	20
> +#define ACC_NOTIFY_S		16
> =20
>  static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> -		       struct xe_vm *vm, u32 ring_size)
> +		       struct xe_exec_queue *q, struct xe_vm *vm, u32 ring_size)
>  {
>  	struct xe_gt *gt =3D hwe->gt;
>  	struct xe_tile *tile =3D gt_to_tile(gt);
> @@ -984,7 +986,13 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe=
_hw_engine *hwe,
>  	xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP, 0);
> =20
>  	if (xe->info.has_asid && vm)
> -		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID, vm->usm.asid);
> +		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID,
> +				     (q->usm.acc_granularity <<
> +				      ACC_GRANULARITY_S) | vm->usm.asid);
> +	if (xe->info.has_usm && vm)
> +		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ACC_CTR_THOLD,
> +				     (q->usm.acc_notify <<
> +				      ACC_NOTIFY_S) | q->usm.acc_trigger);
> =20
>  	lrc->desc =3D LRC_VALID;
>  	lrc->desc |=3D FIELD_PREP(LRC_ADDRESSING_MODE, LRC_LEGACY_64B_CONTEXT);
> @@ -1029,7 +1037,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct x=
e_hw_engine *hwe,
>   * upon failure.
>   */
>  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> -			     u32 ring_size)
> +			     struct xe_exec_queue *q, u32 ring_size)
>  {
>  	struct xe_lrc *lrc;
>  	int err;
> @@ -1038,7 +1046,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *h=
we, struct xe_vm *vm,
>  	if (!lrc)
>  		return ERR_PTR(-ENOMEM);
> =20
> -	err =3D xe_lrc_init(lrc, hwe, vm, ring_size);
> +	err =3D xe_lrc_init(lrc, hwe, q, vm, ring_size);
>  	if (err) {
>  		kfree(lrc);
>  		return ERR_PTR(err);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index c24542e89318..3806f977cad0 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -23,7 +23,7 @@ struct xe_vm;
>  #define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
> =20
>  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> -			     u32 ring_size);
> +			     struct xe_exec_queue *q, u32 ring_size);
>  void xe_lrc_destroy(struct kref *ref);
> =20
>  /**
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b6fbe4988f2e..e2326bbedc81 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1108,6 +1108,17 @@ struct drm_xe_exec_queue_create {
>  #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		2
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		3
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	4
> +/* Monitor 128KB contiguous region with 4K sub-granularity */
> +#define     DRM_XE_ACC_GRANULARITY_128K			0
> +/* Monitor 2MB contiguous region with 64KB sub-granularity */
> +#define     DRM_XE_ACC_GRANULARITY_2M				1
> +/* Monitor 16MB contiguous region with 512KB sub-granularity */
> +#define     DRM_XE_ACC_GRANULARITY_16M				2
> +/* Monitor 64MB contiguous region with 2M sub-granularity */
> +#define     DRM_XE_ACC_GRANULARITY_64M				3
> =20
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
> --=20
> 2.34.1
>=20
>=20
