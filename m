Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1749C5DF85
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 18:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184A310E126;
	Wed, 19 Aug 2026 18:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zq/TkTop";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57AFA10E126
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 18:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787162717; x=1818698717;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2JeRhFMFF0gNPsx0LNz8U/ltxhpPsuGnMji8Zeqeqek=;
 b=Zq/TkTopQMD7sB2kO6HX0wWT9aDiVVWQwUZjamLnI6fERUbIyt6M3hJ8
 Zm4Wp6GUvJ77u8nXl8WefgCL27exo8KvDS1l23+TNYMfNbhQsb2Dfy6G2
 8szKEAeICxt6lZKhMy2O5MHjvU6PFOKvkhxkcbQR45h25xfthacYu4l6H
 AYDsLCzm0wgcYgvoF2huAZ+xLDmd6LzZT196/NhiAba6EBdkSLyatie0k
 25l03SUNuf9hNUTXQes0UmGJ4QedPGRLm2Zihubatw1vDQ9ZbTHOufPXA
 OZNtaPnz84vzSAmnCyiBP+u/XBd2LGDV8/w1jCNCmywjnwD3PhOqBV+8q g==;
X-CSE-ConnectionGUID: 42uAlJxFQYeuMkW0XmkSTw==
X-CSE-MsgGUID: iVs75GMCQCafX06h0kXiBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="98282480"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="98282480"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 11:05:16 -0700
X-CSE-ConnectionGUID: jY8tUSbSTCi9FBRioEgYWA==
X-CSE-MsgGUID: cHo+gQvzSRevdcARU5UtPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="262985055"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 11:05:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 11:05:16 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 11:05:16 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 11:05:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKRcVJu7X/PgHI1JwTjWDdAn3z3Ya05Ls/2VfarWPb480DpS1+JpPYumGoTZd9vIqwr/C/avkwdS2Vd1DU6c7oYhjN+JgXEDFml89SJ0lmzftPYDINgq1cHD1C1T6B1CW6P38dv6Kmn2VPHeG1H3Nzpc2RzgyKUTfQZEjQd6lA2PkHTjsEiQZ6FgjhTpvm2W1rKBB5+cz0jq/hDVBof73Bbd88T0wSyVj5JHXQzl0ZcY1zGcDP0xub+d82bayhXm8dkvX7x4RtcL3AeN4MXiRh3mQ7CcvNxLjOp+w83D5PtHji6mggCxCpTwOfh/hmAX1pkqc7zzFUxbCexyrOQFoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8WFL/3VJXy507j/ouOHxM87hFlPWnhcdzyOts7SyXs=;
 b=qmNUCTenSW4kknM2ZKwjgKyD3aNnI/1hFGYiSHQWMR1mPBcdS1apz+t7lXFy1eb4AFEVsInppz+R/lLrOf2mew7e3ncQshcTbyuFcyXb30RP4SvpkWu53PudG9MvVUD8gdo8kBsLIWCIHPrbHXbzt4BFdA5J2vFBbtEn18Itbf2zOca74jUYZ70umTY9xOkDGGv3QQvh17qvYqXRMJaVuHflOGF1rSaanHfC+uS5Moig71LW6qJT38TiTOVVH2lUDMYHwlP0NgmEYWdDhi4H9BiLJq/rfnB7vYPMs6Qkl66BNqzlPjqMNSX8E6ZLfL+0Srb1NMBSwuKvPvJiMFBQdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB8040.namprd11.prod.outlook.com (2603:10b6:510:238::11)
 by DS4PR11MB084795.namprd11.prod.outlook.com (2603:10b6:8:4bf::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 18:05:13 +0000
Received: from PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5]) by PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5%3]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 18:05:13 +0000
From: "Yao, Jia" <jia.yao@intel.com>
To: "Bai, Zongyao" <zongyao.bai@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v5 4/4] drm/xe/forcewake: enable configurable delayed
 forcewake release
Thread-Topic: [PATCH v5 4/4] drm/xe/forcewake: enable configurable delayed
 forcewake release
Thread-Index: AQHdKrexd58xq8t6hUaLnuU7izpoTLaltD9w
Date: Wed, 19 Aug 2026 18:05:13 +0000
Message-ID: <PH8PR11MB80403E3E37A283FF5540668CF4A52@PH8PR11MB8040.namprd11.prod.outlook.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260813000654.2712317-1-zongyao.bai@intel.com>
 <20260813000654.2712317-5-zongyao.bai@intel.com>
In-Reply-To: <20260813000654.2712317-5-zongyao.bai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB8040:EE_|DS4PR11MB084795:EE_
x-ms-office365-filtering-correlation-id: c195ec2d-78fa-42d9-356c-08defe1c6ab5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|42112799006|1800799024|23010399003|376014|56012099006|10067099003|6133799003|18002099003|22082099003|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: e/ckZw3cvgtxdz+pqT7snx9qhbGt/Ku7tWXXvSZLeQkdP87/MGdeHz5dgLz7QoUVQjKz79secJEWfJIL0yNKzAmrx4ImL4MaA1DQSv9qZkMtp9/Y9Rz6tEgMqewexOEjXQJ3Dviv/160zlHqHcyXcWkGwwDz9w2FOzcH08Y9WY3zVGoUFWDh5KT6uxIIUFpPxzqDhIqR5NxOZNbW9+QFDVKqleBRBTDODqWFsiUQsDDWaN1TuwfxhYXnuRTMQxc2FJKuLHbaS734InQISQeuQr/WyKeE9Vy8Vf6NMsQhNIfvQyzpoo5J9d+Pmcky8iiyuZ2mvTi7fPpK4anohqgAexHgWeAxyrDwtMjzT+1E3SoXRiXgDwFF/aWEZhtTab5QQ8LnV+vm3hZ+H66wBX55FkwwRcufn9VW0QC6OyHjK1eTPiqc1n1BdJIpgA6EhrOG7KzL0YcJdKndAAgfvIDWVJdYWTNyTxpBX9kzFJeDSVD1nYGAkHmTrtVfEL6pwNHqSEclAMW/EC80r1N4Tdiuw3Uuw5DEnyVY+/M97rMx+McjdareQK/KVALeXJD23m52FW9lONIT83IsW3c9wGvMx+Rx4e1fzF2AJv7x5khApJSDMa2NggEpNl9SaQzmgHLJQ6Jd/bNquTwD5EDgsucnvtLt+dDD/ijkk5seiFI587S8G06Ydh6JXD3qv1KmsC4z/lRZYyZzySPdOab8VoKGd26yb/P37PMp95PgaN2RfpE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8040.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(1800799024)(23010399003)(376014)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eyfzrcQ+22ybhxE/YKZdrnxKsGbLbQfCmlPVgsovYul1/bm0OlCFtIye8DJM?=
 =?us-ascii?Q?VimJFJ+j14awIkqEFioo4UmEA0XF/5jhdCzuVIaCKPgSK4JcBe8pCPo8W9ke?=
 =?us-ascii?Q?Gox6JgGlX9lirGvMPu5BWZ7FoQ4p8YJz1ccq1EOUXNOyYW03kpILDajKyhm2?=
 =?us-ascii?Q?Xfy0WoDhTaox87ETNqoUu6+o/pbkbRUtLz6LyPfeq0c8J9y4UsJB8jehVFZ+?=
 =?us-ascii?Q?87sL92ZV1PiB36FNfdMNSUIiYNti6hbTJVWRPzeH4syY0QP0fvuLQRAUSRzs?=
 =?us-ascii?Q?2THIwhFGZwc1faR/h3ldSFcAGUmJ2u2EJ/yGIQYp8uKWZJ8wm94Vh0Sb4UlA?=
 =?us-ascii?Q?noRzNmFeGLRjhjHCwfEM8KcNsnggfKPRjk5iZ8a3Dasi9M+X4wCWgzIv/nEP?=
 =?us-ascii?Q?OzB8JK15C63lUynZ1OKwU1VsJwa0sXE4pg3ihAZxY9ha3EHXLZQBjtF6EEkN?=
 =?us-ascii?Q?joZUGfIeXt2XTsaW9SdpiszElh9LYqXYfgaLpoF3AbDqaFkKMnwb2oot27KA?=
 =?us-ascii?Q?yst3awdKsSRSC3k7G5y01o55NTsUpSFufNqV2Z8ng6dujhJY7I1MmUloiepx?=
 =?us-ascii?Q?NNR0d9vnoMC08LIhDoL5QGF74SigCJ2Rmmo92zqZUKEGqv6pO1sPWkDcnCoO?=
 =?us-ascii?Q?w+yMvYo0Q+NbflTEai/RFI1BlRJcNdW+Y0N5yXP3kzayDSE1sm054Jskl5cu?=
 =?us-ascii?Q?vXNAsAP9u1S+atRcWzvNN6CzH4Y7Ys3z/NAtuL7Mbeo2cx4aLA5arILeheKW?=
 =?us-ascii?Q?xyB4P5p0nN74XaOE7RiLwSOtnZuUtReSY75P4iQ2orG53rvv14d6KolQMfQZ?=
 =?us-ascii?Q?DXa2y8/tBydOXzpnq+T4ccsw08KKRvMRanBdlQ69oz2JozvDQJ8XJ5sS4wCN?=
 =?us-ascii?Q?ZOJKR9zUu2GAN45RCHsvWHQ9AC8fcEcQffkIOTdIPxTT+DuVx2J/WZGZxVAx?=
 =?us-ascii?Q?vMMbu8gR8J/fxblN2VuuSrywaneHzZDAPrr6iOxTKp+L58Bkn3YbcSHV/yGQ?=
 =?us-ascii?Q?lgNK08/dg5jy3pLLMWmrizwS0QO28ZJ5YUfHFhFarCq+H8rdt9DfIYK3kDJ5?=
 =?us-ascii?Q?SBdAuvvAyII3tXcGknSUDyNjdb0rQMidcFPnu5p+Xo95FJa62QtEaL+lcMy/?=
 =?us-ascii?Q?NdMRmtxBpe4KReL4JmFR4exb2/HwrBBH7gpCLKQR8KCZGXQAjKNsa7DKN426?=
 =?us-ascii?Q?vmMUgxhdSdRkbQA+e8VApqCAv8ODWwUBQoQgqqnDxgYVtR+9ug6DOcC9/d32?=
 =?us-ascii?Q?Kt+96vH3hyCM+dnJrD3utIN82hmkDZPCus7Dx5oQrjX3B6A4pLu4UysxUlfV?=
 =?us-ascii?Q?0raUzQzOfHF+vcqL1wePgikrfG2UI3ItZuq+6NIE/wL1fwMXVMz25X63Qfby?=
 =?us-ascii?Q?MJ6Xq6aDJnk4eX2QiMC8d2IKVLsrvONsYxeEqpRpAMcpRKD5Fd4irzHgP5qz?=
 =?us-ascii?Q?F89ZExVm2MyUpip8Hn6X/upg839dhmlYCFdXztCfiJ5e2dmR7lcLCLZO3eZ/?=
 =?us-ascii?Q?otMvvRX0kUaLRVmPbaPdJ7E+0YfBeDl4pALSqcfNij2nc+xLyewvGqa86ZpZ?=
 =?us-ascii?Q?uR0HMj8jzvtKZpgaVXIqLWWeLo65kUmc24J1yN/EKZnwGWtA5JgVxGcnuziI?=
 =?us-ascii?Q?dpHyUkqtSpghoiW2edtJ/hruaUuDxoWocgRmAfzP4Hk3OC+NBRHHZeeTryMe?=
 =?us-ascii?Q?SMa6ryw8ckVWWl7RrQbFj/gVFTuDIGx4WBHrUeAzHwIYwcn1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: eBaNcEYwRPzIlFKz8/cRyenQIh49MNfVuLJLas6hVELeezAAZGgUrKhln+hrOBGwTeiJLK/+aNBNDSwq+/wxTgYYWnWUBtDUJeA4uc4Op6C9TA0PrH8rS0jWujglU7zRWnwm0GwbQVZlMFTQdI9pxXpMv0CAzyQv8cyw+jX7u49RNqDyLVzGrWCzvWj00mkGjoqDIKav7S5nmhbvf8uJwo0jJCO+bdCOH+sAp0J3XSMj2zojNpsN4WgKHWE+sIdv/Czl0KmSW4UaYpNlaGC40IPLg/cpRxrUFVtDp5P2esr7FzzAovbG/EB83iWEJMqXRw77wvkKvOD3Z2DqSzAJig==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8040.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c195ec2d-78fa-42d9-356c-08defe1c6ab5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 18:05:13.5407 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WtCPvTjjr0G96nDGVFA84R8/KdLJgBNjACVYp9xpc7Llv5e+rd4AhXH0/HYQtwi0BtfWR1WvCvgafCl3/PDy3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB084795
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

LGTM

Reviewed-by: Jia Yao <jia.yao@intel.com>
> -----Original Message-----
> From: Bai, Zongyao <zongyao.bai@intel.com>
> Sent: Wednesday, August 12, 2026 5:07 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Yao, Jia <jia.yao@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Bai, Zongyao <zongyao.bai@intel.com>
> Subject: [PATCH v5 4/4] drm/xe/forcewake: enable configurable delayed
> forcewake release
>=20
> Enable delayed forcewake release for engine-cycle queries used by tools s=
uch
> as VTune and PTI. Bursts of queries can reuse an already awake domain,
> avoiding another wake request and ACK wait. Only engine-cycle queries
> request delayed release; all other forcewake users continue to request
> immediate release.
>=20
> Add the bind-time configfs forcewake_hold_delay_us attribute to control t=
he
> hold interval. It defaults to 100 us and accepts values from 1 to U32_MAX
> microseconds. Runtime and system suspend cancel and settle outstanding
> delayed releases before power-off. Longer intervals trade higher power us=
e for
> more opportunities to reuse an awake domain.
>=20
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Assisted-by: GitHub-Copilot:gpt-5.6-sol
> Assisted-by: GitHub-Copilot:claude-opus-4.8
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c   | 72
> ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_configfs.h   |  5 +++
>  drivers/gpu/drm/xe/xe_device.c     |  3 +-
>  drivers/gpu/drm/xe/xe_force_wake.c |  2 +-
>  drivers/gpu/drm/xe/xe_query.c      |  2 +-
>  5 files changed, 81 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c
> b/drivers/gpu/drm/xe/xe_configfs.c
> index 052cce962161..3d8cd6fb165e 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -249,6 +249,23 @@
>   *
>   * This attribute can only be set before binding to the device.
>   *
> + * Force wake hold delay
> + * ---------------------
> + *
> + * Delay in microseconds before an idle forcewake domain is put to
> + sleep after
> + * an opt-in delayed release. Currently, only engine-cycle queries use
> + this
> + * interval; normal forcewake puts remain immediate. Keeping the domain
> + awake
> + * for this short window lets rapid back-to-back accesses reuse it
> + without
> + * paying for another wake + ACK cycle. The default is 100
> + microseconds. Valid
> + * values range from 1 through U32_MAX microseconds; zero is rejected
> + with
> + * -EINVAL. Runtime and system suspend cancel outstanding hold
> + intervals before
> + * power-off. Large values may increase power use while the device
> + remains
> + * active. Example::
> + *
> + *	# echo 100 >
> /sys/kernel/config/xe/0000:03:00.0/forcewake_hold_delay_us
> + *
> + * This attribute can only be set before binding to the device.
> + *
>   * Remove devices
>   * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   *
> @@ -275,6 +292,7 @@ struct xe_config_group_device {
>  		bool survivability_mode;
>  		bool enable_psmi;
>  		bool enable_multi_queue;
> +		u32 forcewake_hold_delay_us;
>  		struct {
>  			unsigned int max_vfs;
>  			bool admin_only_pf;
> @@ -295,6 +313,7 @@ static const struct xe_config_device device_defaults =
=3D
> {
>  	.survivability_mode =3D false,
>  	.enable_psmi =3D false,
>  	.enable_multi_queue =3D true,
> +	.forcewake_hold_delay_us =3D
> XE_DEFAULT_FORCE_WAKE_HOLD_DELAY_US,
>  	.sriov =3D {
>  		.max_vfs =3D XE_DEFAULT_MAX_VFS,
>  		.admin_only_pf =3D XE_DEFAULT_ADMIN_ONLY_PF, @@ -616,6
> +635,36 @@ static ssize_t enable_multi_queue_store(struct config_item
> *item, const char *pa
>  	return len;
>  }
>=20
> +static ssize_t forcewake_hold_delay_us_show(struct config_item *item,
> +char *page) {
> +	struct xe_config_device *dev =3D to_xe_config_device(item);
> +
> +	return sprintf(page, "%u\n", dev->forcewake_hold_delay_us); }
> +
> +static ssize_t forcewake_hold_delay_us_store(struct config_item *item,
> +					     const char *page, size_t len) {
> +	struct xe_config_group_device *dev =3D
> to_xe_config_group_device(item);
> +	u32 val;
> +	int ret;
> +
> +	ret =3D kstrtouint(page, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (!val)
> +		return -EINVAL;
> +
> +	guard(mutex)(&dev->lock);
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	dev->config.forcewake_hold_delay_us =3D val;
> +
> +	return len;
> +}
> +
>  static bool wa_bb_read_advance(bool dereference, char **p,
>  			       const char *append, size_t len,
>  			       size_t *max_size)
> @@ -856,6 +905,7 @@ CONFIGFS_ATTR(, ctx_restore_post_bb);
> CONFIGFS_ATTR(, enable_multi_queue);  CONFIGFS_ATTR(, enable_psmi);
> CONFIGFS_ATTR(, engines_allowed);
> +CONFIGFS_ATTR(, forcewake_hold_delay_us);
>  CONFIGFS_ATTR(, gt_types_allowed);
>  CONFIGFS_ATTR(, survivability_mode);
>=20
> @@ -865,6 +915,7 @@ static struct configfs_attribute
> *xe_config_device_attrs[] =3D {
>  	&attr_enable_multi_queue,
>  	&attr_enable_psmi,
>  	&attr_engines_allowed,
> +	&attr_forcewake_hold_delay_us,
>  	&attr_gt_types_allowed,
>  	&attr_survivability_mode,
>  	NULL,
> @@ -1143,6 +1194,7 @@ static void dump_custom_dev_config(struct
> pci_dev *pdev,
>  	PRI_CUSTOM_ATTR("%d", enable_multi_queue);
>  	PRI_CUSTOM_ATTR("%d", enable_psmi);
>  	PRI_CUSTOM_ATTR("%d", survivability_mode);
> +	PRI_CUSTOM_ATTR("%u", forcewake_hold_delay_us);
>  	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
>=20
>  #undef PRI_CUSTOM_ATTR
> @@ -1290,6 +1342,26 @@ bool xe_configfs_get_enable_multi_queue(struct
> pci_dev *pdev)
>  	return ret;
>  }
>=20
> +/**
> + * xe_configfs_get_forcewake_hold_delay_us - get configfs
> +forcewake_hold_delay_us setting
> + * @pdev: pci device
> + *
> + * Return: forcewake_hold_delay_us setting in configfs  */
> +u32 xe_configfs_get_forcewake_hold_delay_us(struct pci_dev *pdev) {
> +	struct xe_config_group_device *dev =3D
> find_xe_config_group_device(pdev);
> +	u32 ret;
> +
> +	if (!dev)
> +		return device_defaults.forcewake_hold_delay_us;
> +
> +	ret =3D dev->config.forcewake_hold_delay_us;
> +	config_group_put(&dev->group);
> +
> +	return ret;
> +}
> +
>  /**
>   * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb
> setting
>   * @pdev: pci device
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h
> b/drivers/gpu/drm/xe/xe_configfs.h
> index 4fbbeafba473..77abc83a6f70 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -24,6 +24,7 @@ bool xe_configfs_media_gt_allowed(struct pci_dev
> *pdev);
>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);  bool
> xe_configfs_get_psmi_enabled(struct pci_dev *pdev);  bool
> xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
> +u32 xe_configfs_get_forcewake_hold_delay_us(struct pci_dev *pdev);
>  u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>  				       enum xe_engine_class class,
>  				       const u32 **cs);
> @@ -44,6 +45,10 @@ static inline bool xe_configfs_media_gt_allowed(struct
> pci_dev *pdev) { return t  static inline u64
> xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
> static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { r=
eturn
> false; }  static inline bool xe_configfs_get_enable_multi_queue(struct pc=
i_dev
> *pdev) { return true; }
> +static inline u32 xe_configfs_get_forcewake_hold_delay_us(struct
> +pci_dev *pdev) {
> +	return XE_DEFAULT_FORCE_WAKE_HOLD_DELAY_US;
> +}
>  static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pde=
v,
>  						     enum xe_engine_class
> class,
>  						     const u32 **cs) { return 0; }
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index d69fd8236b0f..196eaa3973e9 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -552,7 +552,8 @@ int xe_device_init_early(struct xe_device *xe)
>=20
>  	xe_device_parse_modparam(xe);
>=20
> -	xe->forcewake_hold_delay_us =3D
> XE_DEFAULT_FORCE_WAKE_HOLD_DELAY_US;
> +	xe->forcewake_hold_delay_us =3D
> +		xe_configfs_get_forcewake_hold_delay_us(to_pci_dev(xe-
> >drm.dev));
>=20
>  	err =3D xe_irq_init(xe);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c
> b/drivers/gpu/drm/xe/xe_force_wake.c
> index ef43899e1f7d..dc25f77d5f83 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -375,7 +375,7 @@ void xe_force_wake_put(struct xe_force_wake *fw,
> unsigned int fw_ref)  }
>=20
>  /**
> - * xe_force_wake_put_delay - Release forcewake after a delay
> + * xe_force_wake_put_delay - Release forcewake after a configurable
> + delay
>   * @fw: Pointer to the force wake structure
>   * @fw_ref: Result from xe_force_wake_get()
>   *
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.=
c
> index 3c356bc48e2a..628d587e79e1 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -168,7 +168,7 @@ query_engine_cycles(struct xe_device *xe,
>=20
>  	fw_domain =3D xe_hw_engine_to_fw_domain(hwe);
>=20
> -	xe_with_force_wake(fw_ref, gt_to_fw(gt), fw_domain) {
> +	xe_with_force_wake_delay(fw_ref, gt_to_fw(gt), fw_domain) {
>  		if (!xe_force_wake_ref_has_domain(fw_ref.domains,
> fw_domain)) {
>  			err =3D -EIO;
>  			goto out;
> --
> 2.43.0

