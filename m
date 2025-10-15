Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA63CCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 17:07:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0332210E892;
	Wed, 15 Oct 2025 17:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aZuzovMS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC0D10E892
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 17:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760548041; x=1792084041;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vi9Jpfj17f8y4pL4LYCbhbZqpNuYYXLrjtdttehF1RE=;
 b=aZuzovMSpPzXFVi5Q+hnLmNjG/aKFw0KGoQT/wKisw2sj/heAXOEuLqc
 S/cEl/jJpAcDSLbiuU1w2tKCRb8CrhyRRQZJJUgc3orbbuZlgGY5ILT2x
 04wGl70yZ7+brKmmTkrMa35hj/9qysJ/t+oln0kriv0sdcesUn9no1njT
 q91Zd/ieY5y8xbEt3O7vbQ1XzxIbqSicVg1rYkN1Jemi3kpSljkSD7L10
 b0EW5teQU0djC7yM9VLgKtVsgkCRi34DZlr5qKlePBUrRBtuiY0JrAXMG
 RL/MGxDqYV77hPflFJMFsHLpMVbE/u35Yb1lt64zkFX7InV9hyiOZnFLd Q==;
X-CSE-ConnectionGUID: 7BA38CCgRe+cYJL1/F1KTQ==
X-CSE-MsgGUID: +XozCGcCTre96tbmgjrgrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="65349419"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="65349419"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 10:07:20 -0700
X-CSE-ConnectionGUID: 8OwsEftOSuC/VPr6F5grYQ==
X-CSE-MsgGUID: oHsL4tRXQO+fAXJQMxcOGg==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 10:07:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 10:07:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 10:07:20 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 10:07:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOl5JGwpx6IvPhB27kAiTEVgOWsQieCMhmk4kDfsNIvEm4jmDDeWiua6UzKt4KhpbRn9OZd6He+qVuEFil2Q49JXaF7FSGrk97rHRsPvRDHgOyv5UkTGn0R+GqSyEwWeN8l4n8VKyG+wLgjmYOdLhNS6nR3K+r9vxkcf4A8JDyBxNLsmupAAHPA4E559qPxyvImvy5BEeU594WUJ57HXV571/25TWbOeeUwIVBwqjEQsdwLZ91q9fsieho6o1mYquRwbOAD2zWmqNK+F4LmSwfYJUjBGCmLOVZaA1GOIeltzVTrC/T9GJYtyJnPDMPzz8eXoqy2C+1tHRvEtLIkPUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAJfIfX/ZaO55PqHLICxp0zFOPbuqJVNKzUEgHzxO2Y=;
 b=JbZsY4E9kr2HWFMEAotXdLq7ZkHjgYQUaEHe/HrK/5tsfbc3t1rgl+HXCusDHE6kQzp86mDcQA6m8L0nOX6p4ekuKwctFlMrSgbuKgBQG7rb6c1B4273k3LMJTP1Ne1FHm2c3bjDKE3hx3RvmYhvX6TLqpJJlZ/vHe0QfUYk188f59hcKKT34QYCm3WhuJwiNXQckafTC95bHqGegbzzuhTaaRv/NOzPGuj8MSK7CDzZou/pJc5F76nsdgdRnMebQ1HOKXSoz1DNiLtIYneqJB/dFAVsQ2DOWjtLP4bo7zJPO+tfo4sJ45urRrBAFxbmjzb97oEPsBPw25dFbPdNrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DM4PR11MB6215.namprd11.prod.outlook.com (2603:10b6:8:a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 17:07:12 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 17:07:12 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: RE: [PATCH] drm/xe/guc: Destroy LR exec queue directly if GuC is not
 running
Thread-Topic: [PATCH] drm/xe/guc: Destroy LR exec queue directly if GuC is not
 running
Thread-Index: AQHcPLwdKRsd0GwLskWBa7x77cQcnrTDcNpA
Date: Wed, 15 Oct 2025 17:07:12 +0000
Message-ID: <DM4PR11MB5456BE10B3AFD01CA3AC61CBEAE8A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251014033646.1619865-2-shuicheng.lin@intel.com>
In-Reply-To: <20251014033646.1619865-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DM4PR11MB6215:EE_
x-ms-office365-filtering-correlation-id: bb1307ea-aa11-4ebd-c56b-08de0c0d48ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?KiqbwHLJOcYNhb8ztOIMA4NLIuitwGjVf54ekyF1Pb19veb/9B6hrJ3Dlko1?=
 =?us-ascii?Q?i1w9TiucqFJNKzGM70g9ANyUp/daeyrdRWO75G1mbOPFADN/tg8WFYMLrf+9?=
 =?us-ascii?Q?AtYukaVf8Qtb9/9tshwWiRljOcnra03wTKQKL2MXPYn5G/Yyn8mFR97GhYJa?=
 =?us-ascii?Q?XWrL3I0V+42sHkUzrn34yEnjaShxZfB8Ct+/ykBSiKqyzRD4NG2cbTzh+Q9i?=
 =?us-ascii?Q?WkjSAdrcAcOt0CA5zKcqIsjONXSrv+MUxBVdfxBsPk3+goT/j5bZCgMyCokM?=
 =?us-ascii?Q?x0EV7LauhKepyHMNU2BCOoK99/gLsf6B3DzjrShQoqYpV0iEcxAFLmcqyJ1C?=
 =?us-ascii?Q?61kgv2SAurXuswyg1ScF99pvpPmOAJJrqep0FOMQt8ELCP33/qH1KGvMPUQ1?=
 =?us-ascii?Q?AAYmRp+jASHxStsuAYtdSGLwpeendjjcD5ZgGBefPMAPbHBlKfnWX8SIdgxB?=
 =?us-ascii?Q?3UMicr7ZZk98pHB8cuDw3VuGTGLKCVsuyea+Br076DFWs6jH9iWgD2ubKq8r?=
 =?us-ascii?Q?G6mNsmVQjIs/Ihlr+PfuZaXMusWCHfp78+fdF/UymEQ4imFPHkeRDeITDuQw?=
 =?us-ascii?Q?CJ8v4SpHvCToH1PPTbqRR8SnyKibyLVXhX+64gRqvBM0ncVSirBakg+BuCbA?=
 =?us-ascii?Q?/x845lIRCwkLFud9IhoZyjGIQq0IcnFwcGAttW+uvaHc4sxWfUx7eT7RnXDF?=
 =?us-ascii?Q?03xQ+sCHjGalLQ4tPDF/N/NVW+aTQRWAHrZSL0cWLvrapxoRes0mveODqrT2?=
 =?us-ascii?Q?fDIY8BaLPsQZwqXB6sLgYRi/ICfHuz6RoHr1Nv8+r46sZFe2s5Tqa3H77KRC?=
 =?us-ascii?Q?nM92f9GLjnqY877jLoThZae/jpBN7gvy97UVd++zx5AdseaeFpM2OoqrPcjd?=
 =?us-ascii?Q?DA34LmNzhw/pukSnh9aMTQZVTeIBrjDETmU4gnLQcCqdLHAXxUimzjse80KF?=
 =?us-ascii?Q?HypyMGGWpxuOvdOf1PiKcKRZGydl2oenF3lUOQ7SXW8DcOQXIHhhY/PCMw8k?=
 =?us-ascii?Q?Oi3i3yuajnH24UiVqxdDe27xrw6eU6ue+pqzcGOy3DGxyAl1wDY5hu/8OB4r?=
 =?us-ascii?Q?mZDP/aDgjwUXByTG2y/QGUIcYwkCjzhjTDO/kvgLlZPdbo3uYCDb7Y9BljwC?=
 =?us-ascii?Q?s8a7/3+UcIopDZHiRNzuk1oz2E+accqogLkcaa+lVO3zbGOxvDPejh9nyyhi?=
 =?us-ascii?Q?0Sj64KvoqkeKt5tseIpXZt7w8SeU3LrCqwIU1vM2WSuEQe/1cRInZIck5rBz?=
 =?us-ascii?Q?wBmLzSUxUjcPKTmwTcysCwOYMZl74k0z6NdPihfAIBodUHxol0Opw4/ogsA+?=
 =?us-ascii?Q?jTDq93lOqH7JK9LvU4bdYNHFgvt5cnt4+mrmvxwBZpJ8pPV9tppvg6LYqnO5?=
 =?us-ascii?Q?yaRttL5S3Plr2cVjdkvyhoTEvEJqiwcRV1a11aJhI/eRVqxqebMcCZX70PIA?=
 =?us-ascii?Q?m3ijpC84rCWibKXKA1ItyNlidtuOGcQotMboICu5YycLbbHzmSEGuw5Wi9oI?=
 =?us-ascii?Q?gioyFZPCzkqBtUnILDY3603e82k3Wi0zV0Rg?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?olCqkW9a2JKnfcZBfgIr07Mr6IEsLc3bMdqMkydYNX+XHPcq8LGhrgcdOpgZ?=
 =?us-ascii?Q?iTVrQTFUkBcAGXJ/3C1JPj5ZvznhwunWB6ssEF2S9iRX2ef4W1FHAokxJapF?=
 =?us-ascii?Q?62i2V4tzx5M6yXOMGkuHw+utCpTdGZUB3nzKGG80D+nfKy+VD3MkIlpyMpvK?=
 =?us-ascii?Q?BMFjEIAinYh6ZNYUlXQbtZzWy5u7vIHGWRA+YhR0BYLxu7EqYVM/qaa3gC2w?=
 =?us-ascii?Q?Pg79tz4ZNqbkBkDJSvblKNv6g7JhHuRPW6vbnWEfu/PBAZ06hEOwW8qVbp8E?=
 =?us-ascii?Q?8StzaYyTUfdDHlbmqJ6e6cCcNaSnW2O1Cpb/hdgKlJvG4u590Qv6eGNVjbgR?=
 =?us-ascii?Q?AZ7LZZcDMACyyuFqQgew1PC84woaP/EOISR8NstOwS4Fwuum3wV5f9QON8wD?=
 =?us-ascii?Q?Qo4xCDnC0CAe0Zw9UafKeutXqMxrmcllQ0uk8U4X+q4ORpWvx/KU5UjQmiXc?=
 =?us-ascii?Q?m8q1YfBYKAPxQ8mLaBBbHnUxokjmrgT1U709eXYCxnWB6RVKGmsJOWWuk2zD?=
 =?us-ascii?Q?MizUZExA7iIfmyOYm2Ak7Qop9xenzOKmc00hPW3OTxC6ouauK5fadYD83c3e?=
 =?us-ascii?Q?GdAfognBGI3OwhkgjxU84+FKHko1OLo5O5S6CGPpEqO61V9svbAdtuBaHxRS?=
 =?us-ascii?Q?4SrjiOb/qYgohRxThYYy5pIONzRtqEH6hWJl8CwpPSLC9CcAtBHTGIkfJSvL?=
 =?us-ascii?Q?simDHiNscnQ6IZI1wZvbNInAOTMA/Q08HUOeCyuei70zHgIXpG6JhAnZ4gRh?=
 =?us-ascii?Q?4mUD8LW2MCl1sbScfV2wWXPpVhn4v7HfHQU6HxE9PAzFI2gOfdJ2cqQq3rcx?=
 =?us-ascii?Q?4owHCDXQHhGiKSHm9rUDG/qHwKQGGMxlO3Ax9nfhEF/ZFjRIWmNcA8XAesNf?=
 =?us-ascii?Q?SWqpqewC0EIZEsPuzACSPDSWz29EG7ncDQei1SIm1tV+HyYAOIdRawg5a8fY?=
 =?us-ascii?Q?mojAp3NR4ze74MXKHDzaZYh6IBX/TlABUnsAIgxWERYOaAoNDc3JcEYZJkh6?=
 =?us-ascii?Q?3hReHH62Kp1ZVypN66kqxyYpJn/WME6XXgh9vOJjjVFs5wLOwKbDmSEgfba0?=
 =?us-ascii?Q?6WbV6Vy4YMlZJDJXkSzY9giVFpLyX682diphySIxiJxJIRXZ0nLPuYSL1TLO?=
 =?us-ascii?Q?oGZWTRE8xROprixQLTm2sB2fedHV0Y0Ryt2mVmigUGM9c0pd0mj84zzbq1Yn?=
 =?us-ascii?Q?KVxUdAkOwMCjyT7ve01st51cWCHQD0CcqGbSl6xGqCkB43l4HYy6ZBdq1Yzo?=
 =?us-ascii?Q?tL0uhQwzOXkw/0c3CNAqTH18toXpZI8HmKAC6yESAYR0PtPHIYn4BZijHXC8?=
 =?us-ascii?Q?D3T9EMPKaIG/vKiXqbONtRhq8UwLNw24lRUt7GmyUCHBG9VITO6Y2k4eemys?=
 =?us-ascii?Q?155LdMfOpf34NqtZa3kwpqpgjNJuNmP4FjCxBHIp7dvZnhoFA+Lg+d3wQDO9?=
 =?us-ascii?Q?2YQQThHr1S1nntoV3SfGCnMMnacVEmab1V8Xf7mmiB0NWGzkWIB8NsdBAxWu?=
 =?us-ascii?Q?LJfUdyAxXd7yjkJhBQTDHeX7cp+logvEKj7QZYdnXkkWDkeBYIMHj7BBwIyT?=
 =?us-ascii?Q?+SFUQn4YTrlZeW7BeyQDxKGn9/gqH+OyF2q1ItHJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1307ea-aa11-4ebd-c56b-08de0c0d48ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 17:07:12.6085 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SfxJS+zkZWJfmoR5/hq6sWnbFIEP1twDLpJSkJFDYJ1Gxp5oyByuD+yXD13aohLehBEl8lWD5l27cKRdOSR2kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6215
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

Hi all,
Could you please help review the patch?
Thanks in advance for your time and support!

Best Regards
Shuicheng

On Mon, Oct  13, 2025 8:37 PM Shuicheng Lin wrote:
> During LR exec queue cleanup, if the GuC firmware is not running, the dri=
ver
> cannot communicate with the GuC to properly deregister the exec queue. In
> this case, directly destroy the exec queue instead of attempting deregist=
ration.
>=20
> This prevents schedule disable failure and GuC ID resource leaks as below
> dmesg log:
> "
> [   50.242564] pci 0000:03:00.0: [drm] GT0: Schedule disable failed to
> respond, guc_id=3D2
> [   50.242568] ------------[ cut here ]------------
> [   50.242584] pci 0000:03:00.0: [drm] Assertion `ret` failed!
> ...
> [   50.244942] pci 0000:03:00.0: [drm] *ERROR* GT0: GUC ID manager
> unclean (1/65535)
> [   50.244970] pci 0000:03:00.0: [drm] GT0:     total 65535
> [   50.245002] pci 0000:03:00.0: [drm] GT0:     used 1
> [   50.245032] pci 0000:03:00.0: [drm] GT0:     range 2..2 (1)
> "
>=20
> Fixes: 8ae8a2e8dd21 ("drm/xe: Long running job update")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 0ef67d3523a7..d2dfbdc82920 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -47,6 +47,8 @@
>  #include "xe_uc_fw.h"
>  #include "xe_vm.h"
>=20
> +static void __guc_exec_queue_destroy(struct xe_guc *guc, struct
> +xe_exec_queue *q);
> +
>  static struct xe_guc *
>  exec_queue_to_guc(struct xe_exec_queue *q)  { @@ -1060,10 +1062,15 @@
> static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  	 * state.
>  	 */
>  	if (!wedged && exec_queue_registered(q)
> && !exec_queue_destroyed(q)) {
> -		struct xe_guc *guc =3D exec_queue_to_guc(q);
>  		int ret;
>=20
>  		set_exec_queue_banned(q);
> +		/* If GuC is not running, just destroy the exec queue as we
> can't communicate with it */
> +		if (!xe_uc_fw_is_running(&guc->fw)) {
> +			__guc_exec_queue_destroy(guc, q);
> +			goto skip_deregister;
> +		}
> +
>  		disable_scheduling_deregister(guc, q);
>=20
>  		/*
> @@ -1088,6 +1095,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct
> work_struct *w)
>  		}
>  	}
>=20
> +skip_deregister:
>  	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
>  		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=3D%d", q-
> >guc->id);
>=20
> --
> 2.49.0

