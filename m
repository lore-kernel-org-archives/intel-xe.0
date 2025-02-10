Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6B1C02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 22:04:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C4D10E19C;
	Mon, 10 Feb 2025 22:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YoP5SF9I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A81410E19C
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 22:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739225070; x=1770761070;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9E8C+CXphL258302Tv4pNhYAM3sCGo14pAuMcoitYh4=;
 b=YoP5SF9Ib31PnSrS3XRJ6mKzyBL9F2TtPDvrRJMHemb1GlHgWEOYwQxG
 GSOmLDxNobfdlYz8YlW74jDH223VS0pTZ7+LPl/Uqgsi7s7WQqvCFvvYY
 uXL0YUlFdtd9ktlloRy2O3IiUXpu8Knf2s82KsXmF+Lu9aBPjnEG00K3f
 SFKg2NaUkeghD2XvnYE/IbhCjObxITKREswbK9xiGe6jY6qz3mhiMI/Dj
 mXFseT67AetzCNuO+htf+K3ZLF/g2x8rlkRoj6OOipUKvX3E6tFJPb62W
 zri9xfaU0RMuuvIy1BdJdjPbXrbxblQlk4JkxZYiLSMhemuDNycYb6oE1 Q==;
X-CSE-ConnectionGUID: ozKdmfNASh+xfO3bdU5RmA==
X-CSE-MsgGUID: SFksnziwSRi4kf2T5U0E7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="43487221"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="43487221"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 14:04:30 -0800
X-CSE-ConnectionGUID: e1YQUOXqRmuRjRw/nj+F9A==
X-CSE-MsgGUID: 5Gl6ZUbPQsSzC5gO0IobJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="143176497"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 14:04:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 14:04:29 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 14:04:29 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 14:04:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D5CmWAC+yf2EmAFXMD2deGj65hF08K52Uzb05gKbMHNDF5xqUHSYawlTMYtiQZQbV4WXMMyzjYuQvNzK2UDt6JguMxiDsTyOOwPonBPXIx3WY91FByJyDXvzjGBQiK6u1Qh+rdnHrzPUpVRvyitTTa6gtbS3RPNM64bsv4EBo8JPzU3ZnnkJpsBg96mOu0QbAvxVd9Hs2z9QUxyfBMnG+PDrnizwR9TpKyFphgTA7BWgCdyljEfSOKdKsPHvaD0wjSLld+8D8418EXqrY8CStJXRZf8L7f3HnvQQuG2f0jpsKrrx6ejaVkr2Y2Hv+hCAcrCKYT/6YFU6YBpwN/f2lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WH2pCnpuSS3WnWul7ym8X6CQKgk34zVBkHHZUnBvfU=;
 b=SJtAc+ETAjCUdppxpIwaC/vsrLBWxapMHqTiNij99OqcmBSQnh6c9CKPyJSuaYCfUkP3BhsBeJ6pcFwOcFOPyyg0/gawT1yY5OnBputjfk78I2lwILtP0L4wFNDzLZ8+jVKERyIK2d0lK2QwB95JzRqsXZ7wX3MYmu2SseQ7x/BgtHmbk5puWjozoVd9yQIPocekaq/25wkZWfx37/pYnM24lMat0IqoCs+BKcTTDpvFHL0o6oU7eZ9CRfvmnnLxxfEILSKI1mkG/kUx6B1wFsuhGijzteZs20G+SkaeTRpLpK4YKylLVE26dIBQS0pLmPYr2CaioUFLSJIezEswsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW4PR11MB8291.namprd11.prod.outlook.com (2603:10b6:303:20d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 22:04:20 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 22:04:20 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/guc_pc: Remove duplicated pc_start call
Thread-Topic: [PATCH 2/2] drm/xe/guc_pc: Remove duplicated pc_start call
Thread-Index: AQHbe//2Ku7OXppI1UikxRey/QQ4zrNBFGFg
Date: Mon, 10 Feb 2025 22:04:20 +0000
Message-ID: <CH0PR11MB544483111222428E6BAA6238E5F22@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250210210719.477386-1-rodrigo.vivi@intel.com>
 <20250210210719.477386-2-rodrigo.vivi@intel.com>
In-Reply-To: <20250210210719.477386-2-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW4PR11MB8291:EE_
x-ms-office365-filtering-correlation-id: 958b457f-53bd-4d2d-349d-08dd4a1edf10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?17WUk/QRT/bABhXxKFYBl2cni+Wc4JzCNLvd90xPyEc4QDTAOdo1vNmm2zCP?=
 =?us-ascii?Q?cS0L+KYoWrsZb8K2Dh8QeAtUczT9Wkuk2uIYFnKJA8Qr8gu8nZD9Y4i116Wz?=
 =?us-ascii?Q?zBYyBaZ6mKpTaTI2gBl46d2/vjAURLVL0tJLE6PjRNhbQKbxWS7GuFxRGwDd?=
 =?us-ascii?Q?smccvK+yC51Ph+nInoMqlxvGSfDfXPJN1eSPWet799ad06DTmZ+2yupKWKTk?=
 =?us-ascii?Q?KChHDdXrvP6Gu+SD13+8VaszkokCF0nqVMWFbGuLqeFquA9nJy+Ahg1raDOS?=
 =?us-ascii?Q?6jHqvuSUin8c9uMH+dF6pPBuayYY8bBmuXDUkMcjbGZiM4H48AmkFZlBjkOc?=
 =?us-ascii?Q?nF0PNNUWRS0nkXMTQpsbAUlTAtSst6KGlGOoQinPjLEcj1xREPqYtlU/4yHI?=
 =?us-ascii?Q?fvyxcyNZ45YCU7GPkiGbodnyBZzHkv/ub/9DkBiuOlqXUqvqLizMB9bbdK4B?=
 =?us-ascii?Q?JyeIPAQzpv5Z56UhQ1NjCYFNJHlvLyu7VpQqELDdkluGejcqi0wFbchuFBvK?=
 =?us-ascii?Q?rQeURAvJWjhWgUS1CZWOgSQ6cpFG9ajV3poMkDriqpMzDuLhB7nwU2lpCq3K?=
 =?us-ascii?Q?irO7ht4KWup8yv1b0y71Ibfvs/Y47SO+BKF4uqmNTNZduzEw93pSYzHgWMmG?=
 =?us-ascii?Q?XVLn19U9mzNp79pgaPbvL5Ehqa5fr6SLrknlC1C9GebKZPssCP/LuaGYDZcj?=
 =?us-ascii?Q?fAn9M9tWeL+ky3j9BH67yay5A3s3thNgfbRQChi8J9QtrlQXGkqW+plypxtj?=
 =?us-ascii?Q?xguGLMteH2dF0Vjcq39XuXshu6W0oTVqGa+gRFB8sywYWU8RXfwvBUZy5xfd?=
 =?us-ascii?Q?TDVELl3uQKWd1LUQX7ap2fz/uRRDIEtE+qotPB9vn7XybWQn26F0u4joq4Ie?=
 =?us-ascii?Q?J7r9gm8UCd/GCvAcnEtBCb9KFE9UcGE++1tVsJLDFNPDvhMjMlzf9T3861xv?=
 =?us-ascii?Q?373FxhpOr3fI1W4ecHOg65va1PnIW5WoxS9quvTf9vNlUWq+SOALHLgJwwJS?=
 =?us-ascii?Q?5lJVMGlvqRTLn2itsxc/yW4KKrjmga6jUMSLe8lMMyPGuBwfhEa+CHXMq/mL?=
 =?us-ascii?Q?2WY1JAy9jvOafaWdGbDiGT1NuU6ybHc5JOLUB2Sn06njvrBmkuOc+AW4du5k?=
 =?us-ascii?Q?HkSGj/NuZyrYEGllXV1iyqIJRFgoSMbpjRbaSk4bNEdGKZaFvKHA3BZWAer9?=
 =?us-ascii?Q?mJ20VtZ6AroxP3Io3LSoyP2TS5Y/z+qcq/tVgjN98IwFncZJxUujQreasxU4?=
 =?us-ascii?Q?sQwpbrz1zI8XKe6VUwKS3OxYbZmJ1I+XjPEfdlqNP4feJK3fUNgmbBmcD4Xz?=
 =?us-ascii?Q?fpSsNdW4K8dgHWZ4nG5BxpCpNjR8FTnF7QY5+ZJ3bshKY26Z5K1IPOdBgEeY?=
 =?us-ascii?Q?xo9tyZFU2XZtUuHOOr1ljuZj+PQfEYhCU5KEx34oDKOQ3ee+nWcn+GkchN4L?=
 =?us-ascii?Q?MTAxs7KlSfWXrdS7xHHrxoazvvSnyGZ2?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tCTkzmdh19MmjGAiyBzE9Ak4qe8T03hcdS99hWGOztMYI+qlHgRU+4ABsNAh?=
 =?us-ascii?Q?Y7DRlsugwgEjHtAcpYmwp1K17Q56zczcqCBJvL6PWMEJQCWqoquMhzbUGsrt?=
 =?us-ascii?Q?QjsLeI/9OtwIz3s6f2tgCxlRAQq5XqU/qEs1Jn0QtaS7rtypEU1erNCAFs86?=
 =?us-ascii?Q?MmOGH8hkc2f6RLe4EexpjqCJQlVvD2tkFVIWqK3x713nYikOfd0EUDf6DGPi?=
 =?us-ascii?Q?4ZHh5MZcZ1tFoAASDU3UK+LkuUi+BVjIfOQBPvw9j3K93rBLxEVUz0oIY3KU?=
 =?us-ascii?Q?NAtEWC6SBFywR8ZTStzAzwfP8/mTRK9/Uyiv0QXrI9+2JxAvWfDz0Kk1LNbC?=
 =?us-ascii?Q?OmxAZ5L9kzRGOaJiz0YCP4CNveMo3wrxWOSYsE6aPEKA5fSIA4U+WK1rm5Ow?=
 =?us-ascii?Q?dWwPHpXNzwFOF/e0/kvrxU5iFRZNTi+0HCUh7A5BH1QXCuexHCuZW2+xjupS?=
 =?us-ascii?Q?WBctRIe9EGA2APJHCFVyibV3svQ9VdvMs/uD6HQldYFQuAI3pTFkjuWMVcmC?=
 =?us-ascii?Q?LENXsXTKESaG1eKCasL9SZRbW6Sook/RVly3G2QqxZtO7Z4EzJhRR2nM9mVC?=
 =?us-ascii?Q?k3eV0+1Kw15t/ezCmwjVxmntIxZ+XRPCGXMuAMnMaSqwnFeS8nkA/yH2uQTN?=
 =?us-ascii?Q?uZc4Qgt/UfCeCmWrZm7GUmg3/GY2iv+jUue9dPz6OaTj7YT0w7wvLF93jgGl?=
 =?us-ascii?Q?hMH5ViAaYhx2AqS+A/fyN7XGg3dB8B5tfE88pw7YwlqJjc/TNLx8jsjafT4q?=
 =?us-ascii?Q?FRHZb2nPSR0a+Yy5b8C8UAebHzi4jDrQdJPw9OHd+Zc6XXHonLtuhh/dGhly?=
 =?us-ascii?Q?SBBJrONXaonHO0y8PME6K2rQWTOAMgw8WN7Czg6c6xk+YBZTOZf+8C2ng5ej?=
 =?us-ascii?Q?C0M22ui5/v8mK2SisWdbQD5bz+FnJ/oVaaBAcGKeYYw8YiHwssZl0PJ/qRJi?=
 =?us-ascii?Q?GreWr6EdHSNR/wwTDpZs6uhNQBuKaKG1bBVO7ziQkncYbyAyFfwWqzmKrI6q?=
 =?us-ascii?Q?ETzT/SyZngND4xEX+j+8b6RGDj9HMw+NDPGRfYfS79s39BrBcZrojVbTPQc5?=
 =?us-ascii?Q?sypMso47WXAwLvnYItFWu4zR0lx9FICccMVO2+rVIJWfCuRrvWW0hPpTpE0K?=
 =?us-ascii?Q?EI6RxjLrV/lrWZRMFFGPAu+krF5muI9su4tD0STvk2AFpldnlSasRysBYwZB?=
 =?us-ascii?Q?SU0b5UzEdJSWP6dS+t5ml1l3fpJMzo+HMgzK9fJJCfw9hlgU4koeiZpvzZLF?=
 =?us-ascii?Q?pmqnnR97DCEbpBsc7dihqAIx2MYnnTRqy34YdzhWQfCNwgm0b/cWhXkZjvLY?=
 =?us-ascii?Q?duqFhcEiOTC+YCYCoe/gIPuHXkesa4yK/WHGp3exQ9ORgxjYAL9sjIya+YOx?=
 =?us-ascii?Q?APTq2xVlwXMXLuop2JXEnOZC8nxGBik44r9FPSpDI93+6cFz1r3TsfRlye8F?=
 =?us-ascii?Q?//S8ZMBYZ8iMYGBJ7SzDJAOTpBrAwjR2j8Kxv66kJIRhoWn3L6hVhl/mNbqE?=
 =?us-ascii?Q?tm0m53Ked0LzyP9VvLZWhtBTnAmyaopK0M5LtNIP1tA/3izuny3EqbfCPfbz?=
 =?us-ascii?Q?5mTnaAqk+RJnuNW968GwH0F2mp9p7CxacKegGG2z?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 958b457f-53bd-4d2d-349d-08dd4a1edf10
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 22:04:20.7813 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KevQcvpMbF7FDwFsjeSVAzLXQCnk/4VEKJKM2RM+TJN4xrcuZx9quPGtHf/LDhrlGaZAm3+JYkUw9HgTB6ywyLwNYVBc/3u8aH2rmAKyTSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8291
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodrig=
o Vivi
Sent: Monday, February 10, 2025 1:07 PM
To: intel-xe@lists.freedesktop.org
Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Belgaumkar, Vinay <vinay.belgau=
mkar@intel.com>
Subject: [PATCH 2/2] drm/xe/guc_pc: Remove duplicated pc_start call
>=20
> xe_guc_pc_start() was getting called from both
> xe_uc_init_hw() and from xe_guc_start().
>=20
> But both are called from do_gt_restart() and only
> xe_uc_init_hw() is called at initialization.
>=20
> So, let's remove the duplication in the regular gt_restart
> path.
>=20
> The only place where xe_guc_pc_start() won't get called now
> is on the gt_reset failure path. However, if gt_reset has
> failed, it is really unlikely that the PC start will work
> or is desired.
>=20
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Can verify.  A mirror of xe_guc_pc_start exists in xe_uc_hw_init.  And indi=
rectly, both only
activate guc pc when SRIOV is not active.
LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_guc.c | 8 --------
>  1 file changed, 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 1619c0a52db9..eaa035b25aa8 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1491,14 +1491,6 @@ void xe_guc_stop(struct xe_guc *guc)
> =20
>  int xe_guc_start(struct xe_guc *guc)
>  {
> -	if (!IS_SRIOV_VF(guc_to_xe(guc))) {
> -		int err;
> -
> -		err =3D xe_guc_pc_start(&guc->pc);
> -		xe_gt_WARN(guc_to_gt(guc), err, "Failed to start GuC PC: %pe\n",
> -			   ERR_PTR(err));
> -	}
> -
>  	return xe_guc_submit_start(guc);
>  }
> =20
> --=20
> 2.48.1
>=20
>=20
