Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25141C88E53
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 04:00:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C241B10F905;
	Tue, 15 Sep 2026 04:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cSSFYRDm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A5210F904;
 Tue, 15 Sep 2026 04:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789444831; x=1820980831;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kM9OcucZJH3+hiBAdf+dwCghyINc6oPb/JAMN6KN0dM=;
 b=cSSFYRDmYVw9rHba112lNHGipDCc+K9Ww1wwttq06tvJtEVYjj5zmORr
 SXRlQDh3WITzc/84JYXnrkeDmayRNAIFRUxfFdqCGZ8bI+2tsWo4igPlp
 4cfQY4LsvcTjx3egNk+mBs4ueHEG9aGnDEtfIcK0VVLQqpwYQBmiTLusJ
 EVZ75seKGdViRUnZgCZBu/rn73qWD/pOQ+RwxfUZh1UTeTaxryvHSRQI4
 jB3KWJfL2JVwrEhEpuIAFd/On4EhAqJBxmQzKrLe1rTu0j70cQlvXgOJy
 Oh3gKnhc701Q272mEx/ic59nP4BA5+W/LzhZDAIA+BbnU5IRQATLQszAW A==;
X-CSE-ConnectionGUID: GNuoSm2JRS+VB8DRq1zDog==
X-CSE-MsgGUID: ftrOrJpdSc60D1hi3f9GKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89930557"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89930557"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 21:00:31 -0700
X-CSE-ConnectionGUID: 5BgT81N0QOGYZSIGjRpfMw==
X-CSE-MsgGUID: bXG3u5jPSEW8Xy3rHfitzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="269147010"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 21:00:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 21:00:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 21:00:30 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 21:00:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKPRY44KafCLna6/9fgsq0mRCdjSJLHCuV1hfJHJYk2lSG9E2pdHj0zbyAVfmLpVbXaNOZxbfKMm5MceRbwBRfS0ooM/uexE+NLo6vm2ItBeHMdRWP0fq6aJ0RaUQxWD8czNCmpAbonW60tOrJBQSq9U5l4/vQS7lIeySFXTq6PEgV/k/OPRPJe+5QfJ01TwPo2XDcLihuqfAuq+nq/qtCyFKHLVCUKTJewtJWnmEz2y8IVmBJDR4rUXAk4xdALHqTIEYPv2YRVJ9ukeSmMeQjbRydXjvthUT58gZGyaWX6Yho+IigzY7CB+DS1dAJ18JHErRgmm2W4Vfo+ggrjgXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8O6amfiFfuhrflWOBw0zqxTTrqejoNRp/X5NDKl3YA0=;
 b=uByZbguPAXJR4BLcPX/hhwvLFf6cp8XJeY18T8KEHTT6TdhJ4nqysZbsQn90QXVZj1/UHqEFq8MEEOJK8vCwLweFrD04OQpxQldYgrA0HE4dsRWUp6ZGfF3F+mPsglacFN/xCmloh/HAHmJn+BQ4mrZsDQI9Y5qYwwTEAcIEdJEtURRyzkxE1G9vWAlHy/yJbnZBlc1Estu14Fp3gtMpsjTk4E9HNscgQXaD29aEmfGstUhfzQ3/MXHml7DvgMt5QABIx2DWX6D7UxXjqnK7dPNof4KkXesaHCvHjzOomo9+iXSXcqJigtgLyWyUQ8TNOvamZxLFfnLk5VlvYlGEBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by DS0PR11MB8687.namprd11.prod.outlook.com
 (2603:10b6:8:1be::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 04:00:23 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 04:00:23 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>
Subject: RE: [PATCH v6 05/13] drm/i915/display: Add crtc state for DIP
 transmission lines
Thread-Topic: [PATCH v6 05/13] drm/i915/display: Add crtc state for DIP
 transmission lines
Thread-Index: AQHdQ5J384V2DE+7n06VcwYmMd8Hy7bPBjbw
Date: Tue, 15 Sep 2026 04:00:23 +0000
Message-ID: <DS4PPFE901A304F993BE154544C2F34991AE3BA2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
 <20260913145649.3240904-6-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260913145649.3240904-6-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|DS0PR11MB8687:EE_
x-ms-office365-filtering-correlation-id: d7f16d10-aa3a-4bf0-0f24-08df12ddde21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|38070700021|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: 1k/7GYXx46GWDQ0mb0ZDu+DJn82dXOTXmMYw+c0JgNtT0PmfXDBRPFisvnf+TJ4JBPHYI1AaZxeKZcUGT4v7DRVu4bXXZzLoP4xoanTebg5CS+hVFtZlzbsYTd5GxEdEvOzbJSwEofwYJyqK99vYU5JJChkfIPM/OyDEHfcL2Pe0j5oWMp1DFyhvMHWYqW2pbi59HWJktqQsTlA7iPSYBYPnjMUmz2b51SbkwXEGdJQ7Fu8maHdAvb9pyfoZlfJzrfsPoYzlHli3o+vTpnL3KxjAbLans7zwi588Ts297jaRY9spGMKEujESLeqFwHHM/qG1uF8PiCw12ocB1hh69ZYkRZBfYpc1FHcu0OmN2cF+fa3lSjwuUCFDQQIR5xNTSzDU3C5dvzZt8rNd9Qi8juyZk6huaEAofVmrZT66bkAb36Ak8Vsnybg9c7JH2zudVPfkTVuNoevX5LMijT2uMOOQdlejCgjYOIyG0VuRznT5W+Sdy/chU6S3vw7kIShVCTQ7EDfGDTsMEVFYhIkG7wIMfCOhV2FvYDmgVA5cO3ilVarP1SMZ5UAm8OaYLkWtpJVuY4feENY+TYLY5ROcM4jqapgPK1FCuB8oaXyjS1LWoHSDex7S7Y9W0Vo1uL5EwlGEubjQbcQ3eVJJy3qwfzGl+O0afKPN75isoBXpSVy5toX02z7t4UtrtqOCddkRjqtyT20BAG7s/hQbH49rMpeZOkFNE+poqNkf7+9fQsA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DV4GoVbAC0bDSMGiRPGq9cMKqNks33sOHDF28gaA6UODf8dyuZi6D8lQLl7n?=
 =?us-ascii?Q?ems0AW8cDjb/sV0huPTVbe0rKtrCpM5kGCJsguD5IlY+O+jTVP0gzESh3XqF?=
 =?us-ascii?Q?QawmdnN/fCaXrtlBnuU/k9Dmf9+BzU1xav/05ZwERYsXqbcAfC27UfPBk4hg?=
 =?us-ascii?Q?hRq71Yx7Xvyagj8VE1KBq5SUjegzH8LwBNviqC8nlPWk6e83aryijB9K/VXI?=
 =?us-ascii?Q?SCs+11NjYdPVDEYM1TPyBoZOvZY7c0nPjAH2WMJl2TkDoTL29W51v9nabBh7?=
 =?us-ascii?Q?rq+jnm06O6Be7DFse/6DZzCm9gAZ6q4YcrbhC1G8De9J2Xnh38D8uurFqanS?=
 =?us-ascii?Q?UV0t6aM5q/xpCHj/BQMZrdNv0RseH2mXEhPG9TiYyTwiNz8hzBf7HM7HW/87?=
 =?us-ascii?Q?HSdyb82CIn7anXNWD8e2GwlbLoulanrnQOysDsRMCDBZJMvFhiUEKQnV3mlk?=
 =?us-ascii?Q?MTTb3NGbr1FjvMjkmN9iYf/5JBNeeVdcbKOkapY031E/6KaXnuzi2BkmMmeI?=
 =?us-ascii?Q?uXUleij+yxZktdATsXOfkqimSvUe8cjdT3+/oOrCzvOVjn9nEZCb3gwCan9D?=
 =?us-ascii?Q?Rn1d/jdq9iXqubq/l26+1Ad6R+NVuhErJ8E10kbRUqVpWrT5TUHXhGbC+z80?=
 =?us-ascii?Q?DtVedeGimLYKA59KntQgJwtnv905NMwh4lEa5Cr0xj5qtqxHSUogOY6fF7ty?=
 =?us-ascii?Q?fgEqBRNAVkLxyiTWiFutHvVqne1+yAZsbbjuiPWgeZKSvUhhLAidVZNRffJ0?=
 =?us-ascii?Q?h1mJeHT1vUzEMgfr90aeIcHUXXMjyDGTQt7ztp4BSY2fNSjYC1B37rf8nRP2?=
 =?us-ascii?Q?mm6ppxNDrDW7fNSU18QUUPiz0RXhPIgyAgYdRkLGlTcSjzwxCjHcvD6AILW6?=
 =?us-ascii?Q?ndiN/zhcVHzdkIfYzUn/w2cbJ7HKjnFO5ur0wQzUw2oG+6ZaW36oACelrrRi?=
 =?us-ascii?Q?KarE/8g/3BgtduBuNs+jTnqeYfdchPO8+Muc0EL3q71eWzNlHM6QNfJwQzMy?=
 =?us-ascii?Q?7/poxCbg5ANWfQ81gHxIEgZNnHA4tgKNDrMkkFSxiy1bL88jaEvtWqE/oJYA?=
 =?us-ascii?Q?hJJCzUW8439Z1CADw+8ouSvlvPngh1BkrrgEpSkUaDmQgR6j0lwssCMkxO9M?=
 =?us-ascii?Q?SNRFaQSJ+up7J8rn90yHll5IJJoyfNEXa3KLeZRyJbS9KStPsFLrT/mIqHiR?=
 =?us-ascii?Q?ypkm5hjm/tynbXIH7UmH4gueu2yxOkl44inP+6CTZ61eUXQ3AHkjc+RkKh02?=
 =?us-ascii?Q?5XuiYXiZYOH4FELGIdXHe7xBXOpU+705ivKI05vY4ySXS5+M29+qhz07UN94?=
 =?us-ascii?Q?E/GEQ19VlEQ6HmC7pUMzpj7/qNTy+EjydOQZ7QJOgR9cPORKnP2nsB1lXDcs?=
 =?us-ascii?Q?iH5cc25C6adwVjysUoEfimgl6oeV17lU55W9StKIf7joKe6EKL91rOjS61dl?=
 =?us-ascii?Q?L57Kg9mI0k6dshG1YYBO9mnhMkniWye9mhRqh1RdfLJvjduXt7iU9yAzCo57?=
 =?us-ascii?Q?anvf4nghDkupm8igTTJIYTslaRflqXvmU6vhshnUEQZlPKLzD6DtNSbjrD4D?=
 =?us-ascii?Q?rGsg46WMcwv47Z75Yo8jVs5qpE4CXekWWQVDAGSeuWIkT3myhnKhOxaWElXg?=
 =?us-ascii?Q?PnFz0j/0Z33a08DAVJi+cVSJGm8sYRhy2WuhFa4BJV++Y6pCwUaJHD2rT4h+?=
 =?us-ascii?Q?AmryVoaV3xJrIgmtIPDRLfsFrtTRi7Tb6r+unenmU9k/nKFJY3V7vZQqF1il?=
 =?us-ascii?Q?wyZC32ROdw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: zkwuG4Vh6AveHwTdbkHIUZt7QcR7r7YUnBBPfIbHkYM+SahV3eB5asjS5XCj3IllulviggnJynmoGRF4Xmb3XEGjTyUyjxV25gH/SLW+QUM+UIdeVE0t0BBa8GdMqERh5D0MMICyjIvbaqBKCtWdfxdHQpbu3akzmBEdCnJ5gyX9KRRkfdzr7fIscyAYN6eW/yxhh7XQhHCzA5+jTZvfrZ+oGG9Z0fUlSpct6Jt0mRD4mLpecTWIpN/roGkYpK2oleks6L++bdJQZQW7ECd37Koa5GFExA/M4fUdJ7vxrNkaquqVjspiSEDeS0hjjcuqnZXlp0iPMVMXqmfKQ/oBpA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7f16d10-aa3a-4bf0-0f24-08df12ddde21
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 04:00:23.3205 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YsiGWp4hCxPTWOiqcxhD5yp/xNiW62MIWaSAddp0xuZjdjN89BZv8yNIFnYnFZXIhx1mAijIAy/aHgCUx4Qofw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8687
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

> Subject: [PATCH v6 05/13] drm/i915/display: Add crtc state for DIP transm=
ission
> lines
>=20
> The Adaptive Sync SDP is currently the only packet with a programmable
> transmission line.
>=20
> Make a structure struct intel_dip for Data Island Packets. Add a member t=
o
> track Adaptive-Sync SDP transmission line. Include the new member in the =
pipe
> configuration comparison.
>=20
> This will pave the way for supporting more packets' programmable
> transmission lines, including the common base SDP transmission line
> introduced with Xe3p_lpd.
>=20
> v2:
>  - Move struct intel_dip from intel_dip.h to intel_display_types.h (Jani)
>  - Move PIPE_CONF_CHECK for emp_as_sdp_tl in !fastset block. (Sashiko)
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com> (#v1)

Still stands

Regards,
Suraj Kandpal

> ---
>  drivers/gpu/drm/i915/display/intel_display.c       |  1 +
>  drivers/gpu/drm/i915/display/intel_display_types.h | 10 ++++++++++
>  2 files changed, 11 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index 9151ea6c15ab..5e8f2e48e95b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -5602,6 +5602,7 @@ intel_pipe_config_compare(const struct
> intel_crtc_state *current_config,
>  		PIPE_CONF_CHECK_I(vrr.dc_balance.max_increase);
>  		PIPE_CONF_CHECK_I(vrr.dc_balance.max_decrease);
>  		PIPE_CONF_CHECK_I(vrr.dc_balance.vblank_target);
> +		PIPE_CONF_CHECK_I(dip.emp_as_sdp_tl);
>  	}
>=20
>  	if (!fastset || intel_vrr_always_use_vrr_tg(display)) { diff --git
> a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 9016be52c7ea..bcaf42cefa17 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1006,6 +1006,14 @@ struct intel_casf {
>  	bool enable;
>  };
>=20
> +struct intel_dip {
> +	/*
> +	 * DIP Transmission line, relative to the Vtotal.
> +	 * The programmed transmit line is (Vtotal - value)
> +	 */
> +	u16 emp_as_sdp_tl;
> +};
> +
>  struct intel_crtc_state {
>  	/*
>  	 * uapi (drm) state. This is the software state shown to userspace.
> @@ -1312,6 +1320,8 @@ struct intel_crtc_state {
>  		struct drm_dp_as_sdp as_sdp;
>  	} infoframes;
>=20
> +	struct intel_dip dip;
> +
>  	u8 eld[MAX_ELD_BYTES];
>=20
>  	/* HDMI scrambling status */
> --
> 2.50.1

