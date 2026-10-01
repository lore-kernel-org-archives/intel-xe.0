Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB678CA5FCB
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 11:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AAAE10E187;
	Thu,  1 Oct 2026 11:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oAw46K0U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524DB10E2A7
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 11:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790854681; x=1822390681;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KawYmVe09xs3I3a77SIYNLvoad0kHErfgcLaqMTHX+U=;
 b=oAw46K0U/pBIEZTJ0lCcLPvUokvSNesWsYKZtTbdo248RBs+egu3DUTa
 dQSqZMakFmFBdiAwfGJwko382Nf9Y4fg0A0xYh2JIEW+52AGBPChyFCYV
 AZ2xTv84XPU2RVesR/d1bbmbcJUD9Vfrus25VX0XJxDTx/e1cfB3vChLF
 ckOBGWRuJ39nOYkKGa9SoG8uK+MLBl5XJzHUBsz4qvxD7A7CHYRoLQoqv
 D4yB4vdTSMSdWPrV6AkO1IDifz+LDzxpVByqsPzEYIGsKZ6sI+mAc7FiQ
 fifET6due1mZARyKB7gmjeOTq1lLuTrVaO83QsJ1TnivAoqxAZt87RdCN g==;
X-CSE-ConnectionGUID: OejNkTozT5q1RQiUtQ7FGQ==
X-CSE-MsgGUID: /mKJbl2fSSK/+ql94ApZ6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="102280872"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="102280872"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:38:01 -0700
X-CSE-ConnectionGUID: o8z2RjtXTVqzuw7Xt9xraA==
X-CSE-MsgGUID: e4Tf+BZ4RGmBn3dlcf48qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="302215805"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:38:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:38:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 04:38:00 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:38:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frDBOcgHMbrVAcxIdeExhGBh2U7WpIpxkoMAZF6l8GiEDgbw4HDCsqKuNr3+Q6uncI2zjuRl2nZKY6d+J3on1nI0P+C/zNNld6/GaLOICnOH7bNYI7ggb/6ZJSXKgp895PgzKFxcKtaMIODHUsHpQRrLHHzwDNURntXybAdRoUyWd2SjXGb+7APU+mPlRNKe9B/M1YxKsS94Isw5oglJxUWRP96zk9/YTboa7mGRqFX8bA3kjM0hicfMFnwDkGFh0ibiWse4AqHv5BsgI4MXP3P0ZUlxRxycLNvxTAzp4f/1J48cVsd2Qylwo1prTfAiBtugHxpIV/OuiUC6IkYZNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CN8M8Pj1vVyC5JNOqhDqTAdth2xuTs0ycxDLIehI7A=;
 b=NPnufptXsx6FVVQjWiEIKfk95TlNM5MaKJp6qPE5xxdg7GMv5VysqCqyuQStFKnY5Fi8BKdudlLcxNNRztOKddi1b9+NxG7nLrz39UGPO4OE7Be1wBjQtgEPXM03kYygWuMFSj9S8pQ0tPp3bsfQHC2nJopLkgLj70kBcCTTWr01nh4YgnyTaGirRde8LFUk9keX5d90/UyDApqwRapVgNhPDZs6p2ts93MA3x2+GiSNQ+BK//6OJfU9DaE8pXPxT7wdIxAo5u9poMz9DeVqvG8oEARRYzczzVrsciZx2mA1bYjGi7oWYo20Exk5miMVKR7JUm8uCQ62VmO7gtwRww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SA2PR11MB4907.namprd11.prod.outlook.com (2603:10b6:806:111::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 11:36:35 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0451.014; Thu, 1 Oct 2026
 11:36:35 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, 
 Mallesh" <mallesh.koujalagi@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH v3 4/6] drm/xe/xe_ras: Add function to get maximum pages
 firmware can store
Thread-Topic: [PATCH v3 4/6] drm/xe/xe_ras: Add function to get maximum pages
 firmware can store
Thread-Index: AQHdTxFHVTdqL1NAHE6U2oldkNiA/Lbok27A
Date: Thu, 1 Oct 2026 11:36:34 +0000
Message-ID: <DS0PR11MB8718AB9D11A1EA84670A835D818A2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260928061830.417395-8-riana.tauro@intel.com>
 <20260928061830.417395-12-riana.tauro@intel.com>
In-Reply-To: <20260928061830.417395-12-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|SA2PR11MB4907:EE_
x-ms-office365-filtering-correlation-id: 07eee221-2cb1-44a4-0751-08df1fb03f80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|18002099003|22082099003|38070700021|4143699003|10067099003|11063799006|56012099006;
x-microsoft-antispam-message-info: Cl6OZ6RTe/5MME9twQw1skPUJAIFTw3C9sKiyUv5a5T1x51Oen4gZkz0AH2IZV9PCyeSsrU8IXiuR/t+RuCuJ/EifN6LvknS360WygG1EF5UKWWCHt69JMjEIie4aLmzBzbDeWKgpiMaVnMTEDw5GV8Zxq88uEejodiPlqJQYQGz1QUYNQgFN0rCwXYAkkTBB9wqOYxdd8pTVvtqr/+c1ir74H93dBZqClxUnIW6vVsivXLeZMTr4biQXJT03vDYUHYwg9SX8CaLK33QkQV5H9ERMr7B9rk4h0bob8zJX2rKaQlIq6Y50CgeVfB3WNxS1kUS/75yuNd5QOXu+zXgBqJmGsdl9jnE4a4EU+Vh3M9pMpffJp0SeGMJzUCF7bF4qo+I6+D7UEpiIJIJchqj5Bg/GFO4Pfw774DBeVfvzctWJeoWFwhQA2DUOrNnkPfJ24rzho/ajeUFTivG3nGbucF+UlODENfwDvTmA4FuTWZY1xIliQIGH91BEDhdBXDSlLB1Mq11eY2kRfoJhmnI75AfjfKsSQbrE7Fz54/+HMQjny+sj6mWvYeP9bz4xSrw9aP5mNzPxvJmWaBObPxesr4hs+/EVAWQBPJgXufHe4vF7585x6Tq8AT4xPB7arsLs9obX+uXAupZk0QDHw0rq8HwQmfnw7+DhfCMihrTjAfHdNnkxrMoQFBBGfhJWNF7Vd7Jnv7Zbn1bIzBhDN89192oepYwuW1fyPM6hRfmgTE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(38070700021)(4143699003)(10067099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pGygrWDy7rR6Rgc1sRjf61zfZgQz2fa6FTkvCg0JyifjLuaEQ75woD+6SPmE?=
 =?us-ascii?Q?p+5zYNy1XV6B2zKFzhr9sDQgVF4xgsKsqBNXeDugsMlWs6cqdNSosBkAqBUM?=
 =?us-ascii?Q?zLhFdl1L20LPrU2rAbnu0cleAQUZk9VNswFKy617WQMKhG6UxmVgSMPMyprN?=
 =?us-ascii?Q?eC+OiG69Q/6jsDsxLd1np/HiN0JqT0gDIYgMalM68uq486sSrh+TiV2X6ozY?=
 =?us-ascii?Q?T2x4yBGeUU/4MD1HDnGdBBlLFpMVaaVah+OQKh+x6R7K06PcTFnR6PNZcNtd?=
 =?us-ascii?Q?sxetUQXCKVLfRI1RmTL7hJb8epzeGxDg8LAPR6Kjm2m7QXbRWwsBA3HlzWgZ?=
 =?us-ascii?Q?HNVvfLJjRjHkIg66YLmeQtt8RwTI+CG4042Tc+s6myOWf1TAVNUdgNRfEX/4?=
 =?us-ascii?Q?eid+rjU3hEoPr/fzaNteLm+EdEXGOECgXhU1fcdEDOcS8hsGnv1mw4v37l1I?=
 =?us-ascii?Q?14DO7HszZOdWCzfsKaY84Dm9KRfkYJPJ8iIYQ8PGlz0vla4I/axTzrBPtygq?=
 =?us-ascii?Q?nlizJCm980y0CQdtEL13qomVtkY2WFtpCmnuTgG2qwOuCxxqbxde61apojt8?=
 =?us-ascii?Q?f914uraxUrTQtA9aLmxKgwB0biY91wwOIgnSvsOzRaNVzSyRU3CFBHmJz5uI?=
 =?us-ascii?Q?HsR2BvumBHO90dX20XhhCnNOia4dcd6XiIWf+A++j7cIBBzWLB71nis7WKvD?=
 =?us-ascii?Q?x3gaR4vNC3xEla8NYoMeD3kBLHEAKylmbO+kMf0cqLgC40CMsdapKcR8xRgo?=
 =?us-ascii?Q?ebAjFVsh/Pc7DBgL720cWX52Dgrl7AmBdA75hW7khQLPlVw2zAMH46R+439t?=
 =?us-ascii?Q?/qHkgz+PnvR792LrDjb3Y9+fLrYGD9sHn/BPM5qUWcgaPOGVcZc7wTJlLvNV?=
 =?us-ascii?Q?PC3QWpVA5/y1qxppdOCRNaNQtWfE1sMqdLMc80GSRhzzASa+hTt8f6wqpzJ2?=
 =?us-ascii?Q?twYKaLb8fNB6FQvNIxdHHBzGVukTwj4QMYxlzzuUj68KdpsaIXPMHWCPE1dx?=
 =?us-ascii?Q?bcwn2GlKaAiqF5rSJyAzmMSDJVdmg3bBb+fSAdwr13bZZFAUB9R8CdMUROKT?=
 =?us-ascii?Q?s7tFIpi+jgH7J9aD82JthDuPymr6cfJMxkM9egjIzhJfmO+m2U+XXigbGLKP?=
 =?us-ascii?Q?pZmeVLYT47U9sKEf0pWN5HvkhKsvi0wVE9/Iq3R9cvHgnEF1hXw7jcgqlEPx?=
 =?us-ascii?Q?pDcgvAai6YNmd4jw7Ewwlxatb7VKXnAUvYE2dHJkk2m9jDDgtbp5rZoOrAda?=
 =?us-ascii?Q?lhLxU7FVWJKvJh8lkQx1shIdsOWU+dek+eYG24jAlIwUouPShrpHn7wYQoIV?=
 =?us-ascii?Q?IhKo1Ba8/MxSObN1TDJkGzb+ltEpZImTMCUUQLRIiZlib81pEcWkLirE7hcp?=
 =?us-ascii?Q?6Kzfb7GiT+pHA7kSY3+mITW5XPtJi1nXyzbLGxWGu+K640lUaSvfww1jFu0e?=
 =?us-ascii?Q?GZ9/BAEjA21v4+WoWU+tBnuBD1aIE26hlHSGOKk/CKCDvNeNPwAuU04ael/E?=
 =?us-ascii?Q?TEcW/ypCuZISOyI9mwhpGDi+e0A7gfBVPLtvPv7GC+Y8Al5EYK8GHCXTomQM?=
 =?us-ascii?Q?IU6P5tSzbxYnRHmkTZxFa+FQq+OA3eysHxzES7W2sPooB+LY2026ijzjGOoA?=
 =?us-ascii?Q?nrWwf5Fbiw+ozU/FomY6NSwjyuCZmhYtmWyxjNBj8ApvqmWihTXDyh6G9iCx?=
 =?us-ascii?Q?WzVM6I60gcTvmerJho2yFc3Q4dq0SyMNrfwbKz1Dl32WIDrrPIDHXd61rSYv?=
 =?us-ascii?Q?y2d8O8bKFA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TgO2pOxKGWqNE8aDNt7VD6QaGKC3B9aobAypf+3wyPJNtMs03jgE5Af5YAhOWE3AQQwIF0zvqajXTnptqwm/cyswlc8knFpY08AxI3nnmcXdURQ5YbV9wVxxslD301LbwchaZendA8PWFMKkvWD2Xl8tUN3Ta7d7FDf4dGA2KPCzCUUkuBfDFiRSSUVQa5F4AGRmnoacjisflcXdNMCAi+9cQBCovOLpysZ4feFBAmu8g4E2QUqvv1d0jOtQ5cv+A5+BTO0jpiEJtK/9YMlsn8Db8UcfRDxpyuXGLdeo0rZG9tMFsKFfRb2Sc6+VgDzH+tFXeQ2jfPwCI/aQWQEodA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07eee221-2cb1-44a4-0751-08df1fb03f80
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2026 11:36:34.9592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tWq0Ygn1dQPtC3DO3IMAzpbm+5BHBzUO5r45+VWGvM6gc/vr6SH6ZVVWaTV4UEreyAxLTA5Hjz/mAM/XXAQ7cWWmOimLxcEwPuSDR8luF3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4907
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
> Sent: 28 September 2026 11:49
> To: intel-xe@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi=
,
> Mallesh <mallesh.koujalagi@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: [PATCH v3 4/6] drm/xe/xe_ras: Add function to get maximum pages
> firmware can store
>=20
> Add function to get maximum number of pages that firmware can store for
> offline tracking. This will be used to report max pages to userspace.
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
> v2: fix commit message (Himal)
> ---
>  drivers/gpu/drm/xe/xe_ras.c       | 15 +++++++++++++++
>  drivers/gpu/drm/xe/xe_ras.h       |  1 +
>  drivers/gpu/drm/xe/xe_ras_types.h |  2 ++
>  3 files changed, 18 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c in=
dex
> 9a1a8190578b..cfc7f07e9ced 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -401,9 +401,13 @@ static void get_offlined_list(struct xe_device *xe) =
 {
>  	struct xe_ras_offline_list_response response =3D {0};
>  	struct xe_ras_offline_list_request request =3D {0};
> +	struct xe_ras_state *state =3D &xe->ras.state;
>=20
>  	get_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_LIST,
> &request, sizeof(request),
>  			  &response, sizeof(response), &response.common,
> false);

Isnt it better to  snapshot max_entries into a local in get_offlined_list()=
 as soon as the first response comes back, not after the whole paginated fe=
tch completes. I mean better to not depend on "whatever's left in resp when=
 the function returns."
=20
Tejas
> +
> +	if (response.max_entries)
> +		state->max_pages =3D response.max_entries;
>  }
>=20
>  static struct pci_dev *find_usp_dev(struct pci_dev *pdev) @@ -1105,6
> +1109,17 @@ bool xe_ras_get_disable_page_offline(struct xe_device *xe)
>  	return xe->ras.state.disable_page_offline;
>  }
>=20
> +/**
> + * xe_ras_get_max_pages - Get the maximum number of pages
> + * @xe: xe device instance
> + *
> + * Return: Maximum number of pages that can be stored in flash  */
> +u32 xe_ras_get_max_pages(struct xe_device *xe) {
> +	return xe->ras.state.max_pages;
> +}
> +
>  /**
>   * xe_ras_init - Initialize Xe RAS
>   * @xe: xe device instance
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h in=
dex
> ac1253d6ead9..561c656e2ad3 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -22,5 +22,6 @@ int xe_ras_set_threshold(struct xe_device *xe, u8
> severity, u8 component, u32 th  void xe_ras_init(struct xe_device *xe);  =
enum
> xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);  bool
> xe_ras_get_disable_page_offline(struct xe_device *xe);
> +u32 xe_ras_get_max_pages(struct xe_device *xe);
>=20
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h
> b/drivers/gpu/drm/xe/xe_ras_types.h
> index 40224db38906..e09b50a6f77b 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -415,5 +415,7 @@ struct xe_ras_set_health_response {  struct
> xe_ras_state {
>  	/** @disable_page_offline: cached configfs policy, immutable after init
> */
>  	bool disable_page_offline;
> +	/** @max_pages: Total number of pages that can be stored by
> firmware */
> +	u32 max_pages;
>  };
>  #endif
> --
> 2.47.1

