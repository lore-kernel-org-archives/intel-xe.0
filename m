Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B424C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 20:18:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4506410E7FC;
	Thu,  8 Aug 2024 20:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="duTtKQ3I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E553010E7FC
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 20:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723148306; x=1754684306;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/uNWPFxV8vY6YABMlnAwe5bfPjsIKrN8NbiHaxRjl7k=;
 b=duTtKQ3IrEKRvRVJ0POf4EDJCUT3SJZQER1qESdKFbaO0Q17Gp8Y6SeV
 obf5tafjDRWVfHwWAXjXmD4G3Oz8F1DnoWmdlejbOMoeWnUsahO49LdWj
 jne1B/SnrDW7lru/uZESyQw2zG10h/ZaR4bgZxp2EqcqEPtXHTKtj1J+w
 1M8vK6jEFhqC9zOismnlch65FxdB2rAjc8P1Fx7CBjGUgkWcKr0nShoQa
 LQdMSeTaXy+avsLQGZPff/G5JnT5U56zu2faXdrh9Sgl7jw9MyOBVtySm
 jZ831CTehbPHoqObwwR4C5ncvqZtVlad1b9m+WseV1cKZ+UioTr+Q51Jm w==;
X-CSE-ConnectionGUID: 6OYu7b0LRu6M4LXKv+yg6g==
X-CSE-MsgGUID: AqYS30V8QCasqqoBJmCGJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21474043"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="21474043"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 13:18:25 -0700
X-CSE-ConnectionGUID: piN90zG+QCiOMd00DcKPew==
X-CSE-MsgGUID: 1sdFWAKwRtG5CZp329aHRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="61726829"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 13:18:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 13:18:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 13:18:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 13:18:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 13:18:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FF3WZUvO0RWXNsGe2TmivpssxZ/P/kwOJNolakWYA5pttKe3V2hbnsLahoIlCT0DEUxQZzvKC6rIukZerllBcXz/jRM0/01InvwPihlszh7wyk5EjpHF24AvqVybw/6HzF3dFS5uzPgKoJQCJvI/MQmU8sydP4bYPLpdp7H4AlxsVNBwdcXOqb/97flYBpyM2IvZrGt/NLo6OtCOvC9pzh9K7JEaYz07/R3m5NtGXRr/4gXnds94KQr5BRiKBRzHqd5ycivijrVGxjOsmNSJW8c5DXH6vRowq8PeBRI1JyGWilZzPnwL/axFeLhJzvOvvnFxhvO5hSafo+X8hM+R/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V89jJL0jm1FeeXnjAkVqtPkYBHTKAvAV3LsLaIwBdPU=;
 b=d9sQHC5ptnekBkswu1IhWIzwlxlQj++VorJiDGcndtaVLNbLgFn/HC43pNOMah81CO1e0imN3ksW6gaQu/1pMpnNa9o5iudUOz81Yo5eDzGB0dv3u8cplInq8Qelcuvj+ehO+u5HQ4Zxi9nz191ti7G41R/qTrx6EwP2JAq7O94nuLETtz8KP8g7XEnqbm3ZBZI+zLRtP9vcwkYly4ZIzv5QQJSwB+F3A9LXaljaLaThHx48U8eyXRIbHpwPxrEgn7GRnGRurMOGOL4HpCC9ND/5C3pMz23RZ4LhgajYBCH5Q3KodgP6ry/cjjwiZq1UJ8sPtRycQVWn4TRziUUhOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB5862.namprd11.prod.outlook.com (2603:10b6:510:134::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.34; Thu, 8 Aug
 2024 20:18:21 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 20:18:21 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/8] drm/xe/oa: Separate batch submission from waiting for
 completion
Thread-Topic: [PATCH 1/8] drm/xe/oa: Separate batch submission from waiting
 for completion
Thread-Index: AQHa6bpLB/evtexxNkCHrvGT4wKYq7Idx37Q
Date: Thu, 8 Aug 2024 20:18:21 +0000
Message-ID: <CH0PR11MB5444526CFCAD32B626B615D1E5B92@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
 <20240808174139.4027534-2-ashutosh.dixit@intel.com>
In-Reply-To: <20240808174139.4027534-2-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB5862:EE_
x-ms-office365-filtering-correlation-id: 73f398de-86b0-4c93-f8d7-08dcb7e73f93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?t96A26jbxCqleCz4cn72Q3d3ySYWiSjhjXPSzGUGV5zFuNb1N/RMvail1nED?=
 =?us-ascii?Q?bNjyf5mGQMZ8QcWmeeLMnOrwxT8nb23vcC/8PT93VL97mVrxUCbJqYHjG9K6?=
 =?us-ascii?Q?kfknvlzxCEmK1J2Sl/FHYxCq3rkqWr4WU/TXXImZEoBKzBtlE12iq+f/WRnt?=
 =?us-ascii?Q?MAWasQK1uRbZSvCnUt793OIvCFI1kl2yjUhYQHeZu22ULJAfQC7fAShfu6kJ?=
 =?us-ascii?Q?ycOoEwZiKCpJC029sfpRmF3Oz97zVILtjBS/FnK2qCfq1YAvUP+ObAZy1UQa?=
 =?us-ascii?Q?yYMIH0QKsv1jNyN9Piqra7eXRO6kD05QYJ1IMFKlD6ZyYUHg+ukMPIxUrmpf?=
 =?us-ascii?Q?XcOXgYRN51S3WEE47xvCro4JRFnSszm1a+vV0ItlForyS9NP/mpuXk0nk2Q+?=
 =?us-ascii?Q?GixegU8fHehm/so1QrpfimfLVfQ7ZRNNkp8LOeRn4fhRboNFx05Pg2QYXh25?=
 =?us-ascii?Q?ZqAiebEMYG/kqNI1k22MfiRN9V2j9vMdSZjeugeychK31fyT8aiD8xMC3GbS?=
 =?us-ascii?Q?Bml5HdLDr364TLk5uOlo4M4aiRIh+TlnzpbsL56xor/G5hWJk5A3zahgwf66?=
 =?us-ascii?Q?2kNLGcLICcSyaeYvCMq+HvrXEWWmX6EjeEDJI6sCNXXTySM+91IyupUiQdHp?=
 =?us-ascii?Q?uh/gH4grmGpAldZXoB/rfP+fxwJYkjQN27D1qb6aG2af9k+v6tpmes0R2OjA?=
 =?us-ascii?Q?i30aZAV+xnyp0uZwu3ZfJfMPRwhE76EfhVG4xv5VcZj+HXMUzFCJT4zvUT1X?=
 =?us-ascii?Q?a145ujVCSpHK9Efe5uI//6ZBewYPuEW1gx7+4+xzIYRIDUGuhx0LXUmcZdhx?=
 =?us-ascii?Q?KsWzjQmVgzEgvSEs7ETXBRJGlXVGneOEV5tvkLOy/U0xxVx/oBNlWQi/ISSN?=
 =?us-ascii?Q?5q1N2U6f9uNaB+FA6AWpeTLn/f8EIgLIqau8wthG6GoavGjhGSRrbTcmuyyX?=
 =?us-ascii?Q?ONQnE1+veY7YdobgXcYTy96dVOnQGk76mqY0OH3bhqxQS0mufZ60MN7f7DLQ?=
 =?us-ascii?Q?yszj8/RecH8ib4L7sWwVpEvSmMYTk20Hz0LhpMlZsPd0pp8v7lrNmccPTMds?=
 =?us-ascii?Q?p1mTfFIMOuokcXINOcvJmVR1/NiW7FVFwajUl/rxYc7TpEmKtd5kfNvqwOSE?=
 =?us-ascii?Q?cVt9msuRmRdDEW8V8nK/j0Hvwt6hO+9mDw7l4hPw077wvK7kDm4wltSQeIkg?=
 =?us-ascii?Q?5Dm9NVYo36CNaItVMrAfULPxCYNtH1lCdWWTivbyZyxOmTCCYuOewwTJfDMu?=
 =?us-ascii?Q?LpSSIFksaKjnGzfG5OhRZF6wzlRNSV+gutkFuHUo49K36Hq90QKd+T0ff5PI?=
 =?us-ascii?Q?w+lPxkrnN2cPV6xzYbGqzteu8DWvq41S52bzuUe6npT6LitLkM1Wgeyy5xI8?=
 =?us-ascii?Q?m1OOSf80P/xXnRYIenXrpIyJopIFG+ks6Lje2UoDFMgMZ3XLFg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GEF5+hVQkU95vRlgtMEfslRHOHH5etSfuCidAJCUIK77CkS/AJ4e00JDTAn0?=
 =?us-ascii?Q?8Tt9INafSu8VhkTfy9Pra3Yz5tT0mPqjZC2uNzC5YnM+siRVlJr/qdyxUVyF?=
 =?us-ascii?Q?UNQLy8OYWhJXpwmIUrBSFi5wmGekMuDYnZQU91NuLzVYA6wJ7Muf9aZW3hN0?=
 =?us-ascii?Q?DnGzn0f50Aaw5FQyEug2UxC9O0lJURPw8Hk9AlEvOAbKhUPT4M0NuU4K/ejy?=
 =?us-ascii?Q?KKAz0A6/P/tOZ00tdAUzzMFA/0k8j6Nc+w6DGrRKGAVoyGiXqfJfv/6JtRS1?=
 =?us-ascii?Q?JHYYI/HkzvlNZPqYuKXzkcl4CVTIDA4RxyT6LKaik+tACUFM86Dnqp8jvVSd?=
 =?us-ascii?Q?AsSAEUXyW8YMmuaGoJ2UU09tnZHA7VWa+DMspUKxH9rB9B8YQ8Gxv8P/ORad?=
 =?us-ascii?Q?jE4oPBND2SdsupVba0+0A7bi5uT077FBVvtS5b+E2y690o9gBckVUsMlV0K0?=
 =?us-ascii?Q?bztHcKK+OkrRAFvTjtWPq64YvGmVuSIo0EW7DRjumJ31O8nSH4CngB0Cp2kV?=
 =?us-ascii?Q?5kRHuCVsfrj03E0E/Ev1WckzYzd1MWMVjBhiPfYzfZOWHgdE8te2KqVdOtF+?=
 =?us-ascii?Q?BINu9zzw6hMgmz9SnKlasBqz6bWS18oTk3VmTbaub93SnNMHXwjw4KSX8AFb?=
 =?us-ascii?Q?evwAazuQpYFrYx40a5+nxI0TbPy3EBhEsDZ2uBi145O+730xaC6lyyW8apSF?=
 =?us-ascii?Q?IxK6pvXWKw5yo2tRpw/B85mYXebjczR1ylKOQrWSdSmYI5s7sHP8aEmibz1I?=
 =?us-ascii?Q?hQZ8cxpRuHWWwCCewTQlDjfiRGi0q4y8FAfI8TqaaV/r95XG8QiK96Jk7hdm?=
 =?us-ascii?Q?qMbNUj+DKDaKnw3U478EDlJze/7FNCzcEk4bmq5pQKnVWAq2DKgri62Tw0l1?=
 =?us-ascii?Q?LgSfCZ0gjeEglWLLjQYHy00wZnZlBdBrXFPHcpr3+IiOA1Wp82N/hSZXLCWi?=
 =?us-ascii?Q?XWcbWOtJQ9GneVnuNXcStx1KWg/XBDju5dkICU3SsROFNKl/5PFUIfrd8/qu?=
 =?us-ascii?Q?ZPeNQVpXmQM6ta8RAyglDbxxWQPF9+zYqhIaHn16gcGpYF931PXUwhgr30wz?=
 =?us-ascii?Q?tJYy+zoxIioFzlpfP3btXBgsbwjqyzIhQDADyp2MI2Z+h2c+beKcO61UdZDO?=
 =?us-ascii?Q?ZQIMpPbZ+WkCLxmpEHjYC/slcEZg6VZ53rhcqn/otXkmfZQBOosyu+8q1rs4?=
 =?us-ascii?Q?kujcRMOBas4BIQqd+ZgKx0TOPodlogaHkVUyVrkQy8cMwCJ1nM3tONGb4nEp?=
 =?us-ascii?Q?art/QQAUTNNhcmjWOTvK4QEbImKDxZMZuEVQC+9WRfdQA+8Tw2fQSKMdPlDD?=
 =?us-ascii?Q?2o213T8qOKFfCSBYkUVEcUIdS7QNPsAbkKFyvZb3aN48db7JQaje6wGc48/S?=
 =?us-ascii?Q?zEMuBv8VsFF95F1TAwTFzUAGusYXyK5aw0e/+npbb2ntJN1FFU5epx9vsUGx?=
 =?us-ascii?Q?Jjeq21jlVjrEAojrtFGzVrjuTuSirKLzs60Yn0ctdLyFYcQFhHryLDdUKS7/?=
 =?us-ascii?Q?FHv5MW0+rlFVI9lxMhdz+CPNsymU2uzbXRoEPbOs/Qku8j+hyeyngA8DQdFc?=
 =?us-ascii?Q?wIIwkpP9KDK8fJTAeMOPFnSfGHr6kWj5i8SA0O1P?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f398de-86b0-4c93-f8d7-08dcb7e73f93
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 20:18:21.1731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OwfghzwLgEZBDvaX24qQHFzq8H+tst35XJz+qarRq4UZAwfAti4Cq23Z1JSHtynZPHZqHQiMIq9V2Jd+j6vA9ZoHmovmbGBrA95/fFyx04E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5862
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Ashuto=
sh Dixit
Sent: Thursday, August 8, 2024 10:42 AM
To: intel-xe@lists.freedesktop.org
Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Souza, Jose <=
jose.souza@intel.com>; Landwerlin, Lionel G <lionel.g.landwerlin@intel.com>
Subject: [PATCH 1/8] drm/xe/oa: Separate batch submission from waiting for =
completion
>=20
> When we introduce xe_syncs, we don't wait for internal OA programming
> batches to complete. That is, xe_syncs are signaled asynchronously. In
> anticipation for this, separate out batch submission from waiting for
> completion of those batches.
>=20
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

The added goto err in xe_oa_emit_oa_config had me briefly
worried due to the fence variable not getting freed, but it
seems the new organization of the series never sets the
fence variable in the case of an error.
So, LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt
> ---
>  drivers/gpu/drm/xe/xe_oa.c | 45 ++++++++++++++++++++++++--------------
>  1 file changed, 28 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 3ef92eb8fbb1e..d842c801fb9f1 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -563,11 +563,10 @@ static __poll_t xe_oa_poll(struct file *file, poll_=
table *wait)
>  	return ret;
>  }
> =20
> -static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb=
)
> +static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb=
,
> +			   struct dma_fence **fence)
>  {
>  	struct xe_sched_job *job;
> -	struct dma_fence *fence;
> -	long timeout;
>  	int err =3D 0;
> =20
>  	/* Kernel configuration is issued on stream->k_exec_q, not stream->exec=
_q */
> @@ -578,15 +577,8 @@ static int xe_oa_submit_bb(struct xe_oa_stream *stre=
am, struct xe_bb *bb)
>  	}
> =20
>  	xe_sched_job_arm(job);
> -	fence =3D dma_fence_get(&job->drm.s_fence->finished);
> +	*fence =3D dma_fence_get(&job->drm.s_fence->finished);
>  	xe_sched_job_push(job);
> -
> -	timeout =3D dma_fence_wait_timeout(fence, false, HZ);
> -	dma_fence_put(fence);
> -	if (timeout < 0)
> -		err =3D timeout;
> -	else if (!timeout)
> -		err =3D -ETIME;
>  exit:
>  	return err;
>  }
> @@ -652,6 +644,7 @@ static void xe_oa_store_flex(struct xe_oa_stream *str=
eam, struct xe_lrc *lrc,
>  static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe=
_lrc *lrc,
>  				  const struct flex *flex, u32 count)
>  {
> +	struct dma_fence *fence;
>  	struct xe_bb *bb;
>  	int err;
> =20
> @@ -663,14 +656,16 @@ static int xe_oa_modify_ctx_image(struct xe_oa_stre=
am *stream, struct xe_lrc *lr
> =20
>  	xe_oa_store_flex(stream, lrc, bb, flex, count);
> =20
> -	err =3D xe_oa_submit_bb(stream, bb);
> -	xe_bb_free(bb, NULL);
> +	err =3D xe_oa_submit_bb(stream, bb, &fence);
> +	xe_bb_free(bb, fence);
> +	dma_fence_put(fence);
>  exit:
>  	return err;
>  }
> =20
>  static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa=
_reg *reg_lri)
>  {
> +	struct dma_fence *fence;
>  	struct xe_bb *bb;
>  	int err;
> =20
> @@ -682,8 +677,9 @@ static int xe_oa_load_with_lri(struct xe_oa_stream *s=
tream, struct xe_oa_reg *re
> =20
>  	write_cs_mi_lri(bb, reg_lri, 1);
> =20
> -	err =3D xe_oa_submit_bb(stream, bb);
> -	xe_bb_free(bb, NULL);
> +	err =3D xe_oa_submit_bb(stream, bb, &fence);
> +	xe_bb_free(bb, fence);
> +	dma_fence_put(fence);
>  exit:
>  	return err;
>  }
> @@ -913,15 +909,30 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream=
 *stream, struct xe_oa_config
>  {
>  #define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
>  	struct xe_oa_config_bo *oa_bo;
> -	int err, us =3D NOA_PROGRAM_ADDITIONAL_DELAY_US;
> +	int err =3D 0, us =3D NOA_PROGRAM_ADDITIONAL_DELAY_US;
> +	struct dma_fence *fence;
> +	long timeout;
> =20
> +	/* Emit OA configuration batch */
>  	oa_bo =3D xe_oa_alloc_config_buffer(stream, config);
>  	if (IS_ERR(oa_bo)) {
>  		err =3D PTR_ERR(oa_bo);
>  		goto exit;
>  	}
> =20
> -	err =3D xe_oa_submit_bb(stream, oa_bo->bb);
> +	err =3D xe_oa_submit_bb(stream, oa_bo->bb, &fence);
> +	if (err)
> +		goto exit;
> +
> +	/* Wait till all previous batches have executed */
> +	timeout =3D dma_fence_wait_timeout(fence, false, 5 * HZ);
> +	dma_fence_put(fence);
> +	if (timeout < 0)
> +		err =3D timeout;
> +	else if (!timeout)
> +		err =3D -ETIME;
> +	if (err)
> +		drm_dbg(&stream->oa->xe->drm, "dma_fence_wait_timeout err %d\n", err);
> =20
>  	/* Additional empirical delay needed for NOA programming after register=
s are written */
>  	usleep_range(us, 2 * us);
> --=20
> 2.41.0
>=20
>=20
