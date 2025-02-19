Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B382EC021AA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 22:11:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7631710E077;
	Wed, 19 Feb 2025 22:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VqPfbVTq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA3210E077
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Feb 2025 22:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740003107; x=1771539107;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QfO6SB3VuHNMeKoY0XioBR0S3sw/TpbjX4oiqwgHZok=;
 b=VqPfbVTqoVfo7t+bipqTG/CwTrvS5GJy62eWV2+s9A5JEo7G7RPW4st0
 9vVJnpz+Y8U59/+RQvatNDuHDnhp3asiILmJroSPFSnpvzG429DfeIf26
 zzZFJKYIId1F2wrNEA1uCakIfGI/AiFIRMxPBj6wMd4SPRK5QsVxgQycR
 qfpbuSWMxKBpCsNtSU+4tgIiwjNkFowxji0jKTEDlyAwHgW5zyx4MWLTd
 Cndgu4OeXtm5U+tXxHwszYLr8cLltwpkP3F1PltMtrAPuTWdheeOlLhPn
 cob8pQee+i8udARZiNR23ofBujsoCaj2PDuU0k5D76sovie9V4XZ8MdNC Q==;
X-CSE-ConnectionGUID: wcNHmWRXTN2e06TQaCJgZg==
X-CSE-MsgGUID: 88c9CHRJQhS1sq16Wv53Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="28356886"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="28356886"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 14:11:47 -0800
X-CSE-ConnectionGUID: j5ZpB+wgThC6K14uDH3/yA==
X-CSE-MsgGUID: OypG9PxMTGiL/IeQYUCMmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="152047817"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 14:11:46 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 19 Feb 2025 14:11:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 19 Feb 2025 14:11:45 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Feb 2025 14:11:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MEbXqOG/HiVDa4Zrj/tD5aUdUvY8wG3cwwqiTgDQtVZuKHVit6GxVuFGHUfDLZsx+LaFw77tMfNW2Te6n1druWTJsLkyGggUbD6F+uM1v6CenRSIqTOaofKLM7DUWqiXI4Sr1K4t/F8N0Xkrd5Kj1rUfcKH1a2cxNR3H6CiVCLYKIGZQYzxkBpgv2fUyVMcFTgu/7Tv5HCKSOJAIZc7VMhsN0Mcs5p/Zl06YMJ8u3D+zqdO7+7mjflWRfrj5QyKrHMaBdbMbO8X1yOXhNT0Dmh4JLcC1FKKOQMorh1WIhPT/dtP9RBt0NG53MchKzrc/p2ubQF4GJPeZ5709Eyk6hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAAhBji83vg47GmZvnCvY29rrJ1/htikLDdtLnBjaTY=;
 b=oX/KRG7EoTPqhCbOKk/xuUi9NOuKoM/Fv17MbFmO/jbLJMsViLN00FfETKGdKcGl6FLJyuEQhymBcvI7T15cKuD78QYf4A3RjVPh1ZTnbmzshg+B9SblZOkkSsQBrBfMIQuI4+XWecTQ5tdrSdSSTLiGLcBeza1i8p5Tpkd8VwqrlpnQakTHQlu8Cuy2Ee56HWt7e8/puLtv6feNTIyXAYoyN7t3hxQCuU3sKlWnJIFPrjTP1I9Y4IU0Q5XDpPYLuPz2elDEeH5njcigtzlb7ipXCdPbxNRBJX43Sj+Ep5p/KVt0z7w83+b3YrpYjOhydZTrotLWD3hHRaiMvE+qUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7241.namprd11.prod.outlook.com (2603:10b6:930:94::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 22:10:26 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 22:10:26 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, "Brost, Matthew" <matthew.brost@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/guc: Check response data of CLIENT_SOFT_RESET
 action
Thread-Topic: [PATCH] drm/xe/guc: Check response data of CLIENT_SOFT_RESET
 action
Thread-Index: AQHbgwnEIcVjYqYueUSSRAUnTbsefLNPHw/Q
Date: Wed, 19 Feb 2025 22:10:26 +0000
Message-ID: <CH0PR11MB5444B00440112FF389883EE1E5C52@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250219192710.281-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250219192710.281-1-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7241:EE_
x-ms-office365-filtering-correlation-id: d22ff48a-2b52-4c9b-bd38-08dd513236e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?3ED2tLi5Iq9np6VTe0CbpC/ZWR0i2AwxWFFS2Fx7zDqcJ1DTvJ/dOqyuUbBG?=
 =?us-ascii?Q?7biL5FcZ1MMq66EgxDjQwpVr7dfDoO7T/exKvjbCPGvE8wjGJc73/QVCWE/D?=
 =?us-ascii?Q?M+cqBtZYRDEg+F6r3V19eNaPHkVthbmZUFf2Yjax7RCvUacLevWHQbxqbWbN?=
 =?us-ascii?Q?RpgtsChBqXjcZpdIW+5L/D4NYgxRhJwTcRrtbtRxbLsZzF27uDA4JJ7Ehz7x?=
 =?us-ascii?Q?J9KRuRfOhaZMz9a+dbWQcGy9qXRiveqEz8BQtHhcVsvOM0Y566Y9NwhxPJhf?=
 =?us-ascii?Q?aAHMolm4jDZkffWmurUH0WA5YOIBjHmvhSh5aUDxqBlSNruA6cO+zmMUJlAK?=
 =?us-ascii?Q?VoGxGydURjeBReh8CgzH6CtePDshKihkHQbWS4WbjnjRSRwrnDURh7Z8eVRf?=
 =?us-ascii?Q?b9FRoQsVUs6p+TFDOgZN9UWBa9p9xXMxAccxGmov5rCpbsqrjtqwU6cD2/KL?=
 =?us-ascii?Q?as50BQZWwO4KVE7JkcIWjhThqVR/vKWbEd/MuU1D+PJCnu+9UvSeFGYdVXJ0?=
 =?us-ascii?Q?L3kpRQkp+72V1WMtWGtRUAE1ca3asKCa2ozQrJSACjvRTfr364dVY6onWmPR?=
 =?us-ascii?Q?2OOA7+cBrmhtqpOcNvJCbjRETPJJBYlsbl27nqKlMa2N4u/tz3Hm67vhKv/o?=
 =?us-ascii?Q?BpPMZzlgB7pDHI9uok47hopu+kf0/eZlrgcg6RHD8AnuCjZr3lxmnAiPEpBQ?=
 =?us-ascii?Q?YhVn+Vp8JlCfNtYHlfV2AivVn3TNUKQkJJAI++lCvaI/+3YY0EdIs8tzzY4u?=
 =?us-ascii?Q?bHyKCTjOGCUzpnyMzUsu/LfdiTBZ9zEwQWb1zyH+wqV+moB1nPYFZIE9i13r?=
 =?us-ascii?Q?BsYSe/FRZZGuo/rttq/NbB6xCeea2zcf6O35q6ou9+MJqRNd4zuEphmfvOFt?=
 =?us-ascii?Q?Les/SxDT/e3O2YDXNFy97UzuR/cgfQK65nxefIYXRuXiQeo/I6jvNYKTPwLO?=
 =?us-ascii?Q?jlgNYTuQv6TjSMcHKnnVpIN2YH3utd2YwHvQ6RVp8vyLfCrQdmox4/X/lkR7?=
 =?us-ascii?Q?qtr51pTIKFWLjhjDUiDg3SdfO14ilwfUnEUi1W9u2QkoLRBa5QTgtdJwpGhy?=
 =?us-ascii?Q?QfU8V/TWwI9KCadMmhk6h7Aq0VXPU52uxRDey6TGuxkuOScaL4eZIZ8N1q2m?=
 =?us-ascii?Q?WGUnR1rgWx6JSBB45UKcl4mDD3b81aj46O33JfeL2u5mlEQlyq1031Jn0Aty?=
 =?us-ascii?Q?uoWza2DcEuTpTNkiJwjjO6Za9zxHlYwfwH/dZbATgiST69KbEkHmoQNgZQVW?=
 =?us-ascii?Q?wzwHQBnuUVuIr3Yh5qACPHWPk5gQmy6uFTJqbujeOsy1GCRlfmoNXhpFfpEG?=
 =?us-ascii?Q?3YgLOAOYYfBfI2bdKUSWzFY39dGBD92Z9QrZENtsuyT3mQ9RK+EnC1RZggPx?=
 =?us-ascii?Q?Z9Fkc8n+gdZ8iWe4PaW7Y1YfoY23mzlD0GCl3A8piM5wQ++1yzX9BnlwngmW?=
 =?us-ascii?Q?aNgN8bS7dDhLy617QUFssQMOPtlcbNZX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zroQTO0574EuOsW8xMmt4ysiZmbzrHPEurG4t52Kxc2mBaEcs3y+HSqALil2?=
 =?us-ascii?Q?gda72spvY147xR4JKkIXdLNnwWhGYYvUKWjZV0TsPA//qUuiZbwcW1yZz48v?=
 =?us-ascii?Q?XGL1+5LM992bnsFwFHVMuVW+/+s0sZfg9E/GC3y3W2yrHAVTuoA6ysMSR+wY?=
 =?us-ascii?Q?CfGzzkCxxmrJxxZ6gY661RoWIi2YlAHYL4hLmcESRQAuEI5/QonBfx83835D?=
 =?us-ascii?Q?9VQW1PKcr51fo9HR71Dw7i6PZYJyD/3tK44Fo7Eez9dz2gNOjB75q4QQ8UdF?=
 =?us-ascii?Q?1QdG487+wEvEVqdF4y5DYUL0oVpfgFYN0ERgEESeIQljK+c7kk87/OseAZY4?=
 =?us-ascii?Q?jyNmKdBZu3ksvhrMw1rQi413i8HwDkjTqcRtVDggoRFqq0uas81oa4DE6aRy?=
 =?us-ascii?Q?t6uOg1oEmSvRUC9UvLafs3ZEIiXhSDxZ21yxOhyyjwpqKmgI3jMxyZsz9qHc?=
 =?us-ascii?Q?gZ6b9SX8z7hvTnaQuQr5cpmDDrxQW1gbbaCATJRVrOSjVtXpkpPjeM4b6dup?=
 =?us-ascii?Q?ZyEp1OockdfczgnL2csrzSK0x8seNlKynucz6lNnqiGRnB+bA4gcAQpGPNjI?=
 =?us-ascii?Q?gGtg81jCFYj3ZnDQJkZYn++oYIJ/UyE/pujEcKs9UTLTrjWeHcrDcH8t8Nw6?=
 =?us-ascii?Q?qUkD/F3NHWuPdanjv/aZlNWnsPXYnSffel9DIF+TxK9t/7WK5jSxWtrBn2y9?=
 =?us-ascii?Q?Zg9dpX6uflvO+eGDtjjDRVQ7Yg3787Zb1S+e5CzFaZtROuuTeO2JmpG5gv2n?=
 =?us-ascii?Q?ISnLmZAiWEbdW1ypdxKJAYvguSPUWA+swKFY1xWej8iy0czYrEN2vbhPwBzE?=
 =?us-ascii?Q?6bzjBYvxq2PIHFEu20KO1VSdBZJhzan2RI/IQ0r7fMci4LmvP+dVvWsHoIfc?=
 =?us-ascii?Q?LMoaCohUlAhGl1n03hFqhRDkVqh1kKhuZGAGtswlajinZn2Fa0F+9V0llAHC?=
 =?us-ascii?Q?Kes5Wyiws6obUgwqDUHtogUortP0ivofdx9s27OCnZblV9sn6CpmT4GyL/eo?=
 =?us-ascii?Q?8wkzY3ka7z78dFIzp3DekNz6KeMA9dmdPMww2+qO0MNcY+cz2OwDrr9KalIk?=
 =?us-ascii?Q?7yrFYTS9movsvu7QLBz9t2Fn6FuL9yTvcVL2VZV43L+0S7UBFBtvmbZIV212?=
 =?us-ascii?Q?Z/XNAo8+NqL1qMRh6dmrLbT/vDXEmBcxsMi8QZIUuIqf7Ogn5T6BjovttHyk?=
 =?us-ascii?Q?yzDoaDZPpXQdVBZXn9K7cnn+/HiySG2+YBTvj8noYUXzDvhwHrzC/qnX6oQk?=
 =?us-ascii?Q?4UUBnzqwud1Bk1kx1fddO+nVKF9gMsci/CFh/Z4ufbtrsWTxq6bW9gnNISo5?=
 =?us-ascii?Q?q4Eid56f43bor081EYHS+04RetaEb/qEhFpycodAQqKpk3C2hYV1+lr0s6H2?=
 =?us-ascii?Q?8vChW/fX9Vsh7rRv8x7MFaCz79V20VZA1KjPM6lADfj3eEYYs7jPZsHTuSjz?=
 =?us-ascii?Q?9WlkXoksj8+fbY6YFyVMOVKe079dP02AwqatdjgflyrmAMtZGOerTwa9tL1Y?=
 =?us-ascii?Q?HWULLOb4TxeSdMf1lyC/MMiKYWG21Fk9ZcK6AdLiQbeznpm8o8rI27Da1jiM?=
 =?us-ascii?Q?VO+zUylRxvPXmFqKOLU8x1TKr2PB28XuGDkjdQK2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d22ff48a-2b52-4c9b-bd38-08dd513236e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 22:10:26.6970 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gqR7NZKtUKmUVa8MYWV0QQAyk5IFmA16mJoIF8em5PtJw6O2nMmVsZXAENFCVz15Nk01c89rSfSMx+tVS7fDsuEAPLaNf6Hl0GcHLSz9hao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7241
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal=
 Wajdeczko
Sent: Wednesday, February 19, 2025 11:27 AM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Dan Carpenter <dan.carp=
enter@linaro.org>; Brost, Matthew <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/guc: Check response data of CLIENT_SOFT_RESET actio=
n
>=20
> Treat unexpected non-zero response data from GuC as -EPROTO error.
> This will also prevent passing positive value to ERR_PTR().
>=20
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/intel-xe/5fd5a4b9-88ee-47f1-ac3e-32a20960=
c5b0@stanley.mountain/
> Fixes: 12f95f9900c0 ("drm/xe/guc: Prefer GT oriented logs for GuC message=
s")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 1619c0a52db9..bb03db361512 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1238,6 +1238,8 @@ int xe_guc_suspend(struct xe_guc *guc)
> =20
>  	ret =3D xe_guc_mmio_send(guc, action, ARRAY_SIZE(action));
>  	if (ret) {
> +		if (ret > 0)
> +			ret =3D -EPROTO;

I don't see anything wrong with this current implementation, though it's pe=
rhaps
a bit unnecessary to nest this if statement in the "if (ret)" check.
Maybe:
"""
	ret =3D xe_guc_mmio_send(guc, action, ARRAY_SIZE(action));
	if (ret > 0)
		ret =3D -EPROTO;
	if (ret) {
	...
"""
Or, if you don't mind ternary operations:
"""
	ret =3D xe_guc_mmio_send(guc, action, ARRAY_SIZE(action));
	ret =3D ret > 0 ? -EPROTO : ret;
	if (ret) {
	...
"""

Alternatively, given we do something similar everywhere we call
xe_guc_mmio_send (except for in xe_guc_hwconfig.c), we might
want to consider modifying the function to perform this -EPROTO
step automatically:
"""
int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len)
{
        int ret =3D xe_guc_mmio_send_recv(guc, request, len, NULL);
        return ret > 0 ? -EPROTO : ret;
}
...
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
static int send_get_hwconfig(struct xe_guc *guc, u64 ggtt_addr, u32 size)
{
        u32 action[] =3D {
                XE_GUC_ACTION_GET_HWCONFIG,
                lower_32_bits(ggtt_addr),
                upper_32_bits(ggtt_addr),
                size,
        };
       =20
        return xe_guc_mmio_send_recv(guc, action, ARRAY_SIZE(action), NULL)=
;
}
"""
These aren't necessary changes, by the way.  They're perhaps nice-to-haves,
but I won't block on it:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>  		xe_gt_err(gt, "GuC suspend failed: %pe\n", ERR_PTR(ret));
>  		return ret;
>  	}
> --=20
> 2.47.1
>=20
>=20
