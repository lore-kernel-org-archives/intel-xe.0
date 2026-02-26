Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC5CFCE066
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 12:49:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D41210E920;
	Thu, 26 Feb 2026 12:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B+K5meRu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 810CC10E920
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 12:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772110172; x=1803646172;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xwq3uJqhUvJawgI1rSLr7uvK/aR+C8h23I8HShrJsJs=;
 b=B+K5meRuk3yY1hEzhY66d267sittt5PsXcJd1O3YkZdq4dil9tG6AX+p
 TrTgdH4gmPjHvASZABjloUw+SPklBe6gy5yJcTzu+SEFVUfG6WLp1OM5W
 FQSpzlxKepZd1TsBs+2AQBme/EdNAEVhQ6wA/Y4qpBzhWr5dj/Z+uQc9S
 q0mkG3aNTFRdXxX4Y1/hZHQ7Lq/LG3Q4VZpu34fQ3jKRNrlMkE9FaNBec
 Ms3ck8zbAif3C7xz/judXE/vNI9BmvJDY9/QczVDnuZ6W0jJP4Aa222WW
 FeUeMI06GJcnoQ6yG4VJI2E2EvwYUmgx+Zqiv4svXC2FGYhBeUKN+I0FO A==;
X-CSE-ConnectionGUID: TL8Oe2fEQUKVYskHHxZByA==
X-CSE-MsgGUID: HSSwGrgVRkqTpVO+2wzR3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73143349"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="73143349"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 04:49:32 -0800
X-CSE-ConnectionGUID: WJdLvHmdQSmICsBLHq733A==
X-CSE-MsgGUID: fgeeEwg+SDWK9jS4pNi0sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="214108849"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 04:49:32 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 04:49:31 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 04:49:31 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 04:49:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgsOr2B9WFdWYn1jeNEI63KxKaJ9My6KFvDIofTzIcc2pj4t75MN1r7lfd3H4NhQwW2DvF1yYR6xPXIVnlGq2pLu/CwWHnmBC+wXgt/aJKlXkmuDWqr3rdhADPAMwFUeBaxb2Uvyf5mbS4e9jSbox1RC/t09+HbrUlo4KMKK+A0pYR1/YgbacwWA8+Vb9YtD21lENdN1yS0helv8LT4BIh3C9hMBbLfycLowuF8H/gIkjObLGYtAzqFjk0iC8CioIZ5Ffz+5Ae1tAkpRBpvTE2ItjyGnYyZWCn66tyvgkRL/ARC+ipaGzVJOd9E9yIUd2cv7euw0bWjaxxSHVNgssA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/H2J+ZPrpoYC5IKXRGfCgRAzs9iOPHyacxKKpHA+0Zc=;
 b=b88RMluxZHlRsNXVHpqhbrgQnrj1qBvZNmuDbGUlXJCl6kVvcuLPcVCFzZFb7A2XAJI0vVPz4mESw68jChnkzAmWI6irfLb6HLscOxQQki+RaDBITVBQYRXHNnz6r2NmsdWGbJw+xSM+sIdbusuGe7NBP7JCCvsnTanlBnf71PVdFviEQF6cWkaN/wsbxV843ilyS4OInoB/bvCTEalbAyjQpD6zSxl0THhXLU3u51Y4LNS+7QSS3nHxlM1w2o08qkYwcid/gSkxPN8zZ3hc27AAtqNbhXeqLchRW9+gOaxAAEo0Ub4Rce5noGBRkxEI+zkIWBioKdCeHAO41u7V5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by DS7PR11MB6079.namprd11.prod.outlook.com (2603:10b6:8:85::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 12:49:24 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5%4]) with mapi id 15.20.9654.013; Thu, 26 Feb 2026
 12:49:23 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Subject: RE: [PATCH] drm/xe/configfs: Free ctx_restore_mid_bb in release
Thread-Topic: [PATCH] drm/xe/configfs: Free ctx_restore_mid_bb in release
Thread-Index: AQHcpfdzVPPl1H9SU0ubKBg5us4nCrWU79Rg
Date: Thu, 26 Feb 2026 12:49:23 +0000
Message-ID: <SA3PR11MB8118F7E9D8877B8F7AD59740D072A@SA3PR11MB8118.namprd11.prod.outlook.com>
References: <20260225013448.3547687-2-shuicheng.lin@intel.com>
In-Reply-To: <20260225013448.3547687-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8118:EE_|DS7PR11MB6079:EE_
x-ms-office365-filtering-correlation-id: 6af73141-5771-43b9-87c9-08de753577f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: Bt5DliSGwc/Cqa8TNRcztH+p5GJt+H4EBHZI9V/ZLZTxY+qqO6LlNovpmiL5L9/ZIIIELDFTvIks7E2AXEKnA4iORgVYNTedjV6kvnDX2PKc86i2/Kt1ldhaT1Fd5qLAoLStMYA+us2SjW3hxBYn9I5vAB6Pqqt662DG8kVxiNNU5XdwphbpjdGarDxRPKPv7JfPVIBPFtsCITIhg2aknnA36U5Cup8mCm3rW4CERVRiKJ+rofJuaqPTke7Q4VKESveR/iB+1r1AxXkcAc5FV8R7ktbbmwGNr9iwsTjIES+mywLC4cfrgCt1ZM+Qhcvp6W0Mte5b8MZFVgJx2w9rXd+JLRZzzODJwZMYA48XG/SrAooscdA/I2Db2LykXN90gPX2g/Fu5HeQyj4pBScZ3AB9C4CHuHTGBZnSW/lJ07l69b6SpDCGvlKR8SB/OLseJhM91U8JgWTz/lp4dr8EpBFX1Nal4Lkr2SGw3O25ELu4nzqx2J+gu659tqB670q5XytzMF29qjrtgZxvou6iB2OYuWleIwpdn1FxPKrVivqnVtQRDqAznsGk82aV2ynwLne3zVGJoBaqMLn8VQJocRuX8EcsT7jU9cFC9Vl5L+M96CI8MoXaym7WGmTl6CSgTNZ6mhAagjL52rZ3aeDFoyePnjs3YbNue/YbcttpzNiRggvJKCy/PdwH3YfqHsmOt3x+TykzZko5hET9rRk88BKoi2qJmiBh7GqOlSza4kenTavN5ociRqv9RC4SDI7hLB8PMZsXzkr//9HFfm0OGO8jX7k0plCyymYFBESo2lc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8118.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4WZYhjmW2OYQLsrkm+nQV6syrJWjjiX7Gwc3tnv5/YNUZzYA2Ped8nZFu3S/?=
 =?us-ascii?Q?kxVHPUse3tBgnXIWCMLSbjUGbke//S2i4gA56XZU6tcvKqqnxhQeox8EZDRe?=
 =?us-ascii?Q?c8RUUihNTFhrxATaqhWJs51Q7EYROwlOtTW6+7NWDWMnZdPQu+O7sraCps+x?=
 =?us-ascii?Q?+aEVyF5M43msau51mfVyYH0aSGvMJh0/REqwF+rIjwrKFl7v1rrIY8R59wCA?=
 =?us-ascii?Q?0vXTcpoVTNlT6gKtY5H1XeTgj8d9Igbek0G1IY8yTEQ1W59ICnvkBbRPMz1i?=
 =?us-ascii?Q?dnP/n1OTP1MZRmCBh8czvByrg3p8kjB+RwXohmgmHxXPPCVIoKP8061w26AK?=
 =?us-ascii?Q?Z4mLvtGvUmJ8c8CL6KDxyUPTNV9RTXUxUHfBQyWA24dbO3K2UHIHLPhRID5Z?=
 =?us-ascii?Q?7u14WgaIf4UVk3FVCAK+n+8S8ovxlpDoYhdzrqFxouSjuW1Wqun7A6VC5CNI?=
 =?us-ascii?Q?2hBgdd/Fjl33c6Fpe8BApIxqeHs77hHfy4uosjPcb206NhKgmrBxxX576Nce?=
 =?us-ascii?Q?cT/qmAOebs+YWXPlu1UxuQDanM8pX3DTy73z42DrIABL9uj75iiiILWgjW8+?=
 =?us-ascii?Q?MrWP7W/ku4aIXYteE1V7A+P0LI5SyLazjg/ejjI72eIZWAtI2X7JuY3b36pi?=
 =?us-ascii?Q?mk9F6um7gB2r6C38KE/NW6QXQ3JUKY7401Qd4zc+zsQiL8Zh8wJzaRrz8qab?=
 =?us-ascii?Q?4JkOy6455gln7ZvGEgAD+9TAT5B10DJc3z389se+ExpBl/OspTe8/mDbnYZ0?=
 =?us-ascii?Q?yIj66T5WJRqXhXXzOr+X4Ugiqr5w5rsvAwgK/dqDpEYN3V9Wbl+t0LQbcBkL?=
 =?us-ascii?Q?BgOb9ZHxzR/Rf1U/JvPsRCZX5JFJh4HykwGWBQO6uj+GZV6OnRupEfe0Bep+?=
 =?us-ascii?Q?KgnDz79kvZJgopQG83OSoZ9Qnc0aHB9e5mcN43+RIqhe2wBAnKzk3+pymVJ0?=
 =?us-ascii?Q?2tWbsUxeU3uHybSfPZ7iU4+eZmvNUEiEb+Y+ZTZnUwTNrkKyv2uNIOsklUu1?=
 =?us-ascii?Q?ed+JWj/rKWfwoaoNcrkbZp3PL3I92EV0+jZQfd5ZrMaBCqsyOr4Kmkyx2PqB?=
 =?us-ascii?Q?LT2bTQLhbRJqok3A/9vgtGupmVlx/JDiELwAPvMygDrycRZanmlo78KiUjcl?=
 =?us-ascii?Q?MGBF1x/nuMDaKyDbU9e/nvBhvCB5ZifOk1xyGV6Qzr9s03mumKjriD1Q61da?=
 =?us-ascii?Q?diE/kdhndr6qnC/eGbW7iTlEcJ+7kmSKGThkoyPvYYCvRbaLVkl8HhcHzuVt?=
 =?us-ascii?Q?44oPzSpGb1BtL5SAL/kMsLJWZgHm6eQGiRSlkC//5NlR77n4v1f+UdmOgg91?=
 =?us-ascii?Q?jLQfpjT6JrLD3RoS9htXKcuTRuE+/tyz3uvP708wJF9LeT5gg7ZsfJ6AXbS1?=
 =?us-ascii?Q?zrkpwWplANlWB1uzxGUKtIzGd/3P+YJJ7V17KCUd/PN958GoduG1ESRFxsIX?=
 =?us-ascii?Q?KsEoFQAjSOH7XLwS6m1ZXqwYd+pICFIXP/dxK7NUXpIrT/fvpg5JNBRN9VSP?=
 =?us-ascii?Q?o5hNb1uqY8EqvGddtw2XAtJ4noTcDhpVv4hbzagqESLlbWAbDI9pcNJK8T9F?=
 =?us-ascii?Q?MT7o3CtvA3sba8E58l808zOhuxO5w/UmDZsxM4OVXWRyQ3Y4genOH+XS3BF8?=
 =?us-ascii?Q?dxkKEnf4wOBAKzOk7dKqTjJ/Zh97XXef6q0I9376sw58g8vRHm9FWwaSU6bw?=
 =?us-ascii?Q?WPbFdR/rezeBXpB+C9cOAI9hnWk1VuX7v4WF5U7Asox0NVa5YP1sq91JH3ng?=
 =?us-ascii?Q?HhouPIK4OA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af73141-5771-43b9-87c9-08de753577f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 12:49:23.9117 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XrgYCK6MahHagupn6yCPm5TNTFNXFIAf0lZAwdq3R/aJYmMCzehrWFCSJ1eVMrsPsqFOKKIFqkMJtNXn08IF2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6079
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Shui=
cheng
> Lin
> Sent: Wednesday, February 25, 2026 7:05 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Lin, Shuicheng <shuicheng.lin@intel.com>
> Subject: [PATCH] drm/xe/configfs: Free ctx_restore_mid_bb in release
>=20
> ctx_restore_mid_bb memory is allocated in wa_bb_store(), but
> xe_config_device_release() only frees ctx_restore_post_bb.
>=20
> Free ctx_restore_mid_bb[0].cs as well to avoid leaking the allocation whe=
n the
> configfs device is removed.
>=20
> Fixes: b30d5de3d40c ("drm/xe/configfs: Add mid context restore bb")
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_con=
figfs.c
> index d8c3fbe81aa6..af1599f21338 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -833,6 +833,7 @@ static void xe_config_device_release(struct config_it=
em
> *item)
>=20
>  	mutex_destroy(&dev->lock);
>=20
> +	kfree(dev->config.ctx_restore_mid_bb[0].cs);

LGTM,
Reviewed-by: Nitin Gote <nitin.r.gote@intel.com>

>  	kfree(dev->config.ctx_restore_post_bb[0].cs);
>  	kfree(dev);
>  }
> --
> 2.50.1

