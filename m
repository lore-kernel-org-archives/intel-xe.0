Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFE4C7EE29
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 08:42:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24E810E05D;
	Mon, 29 May 2023 08:42:54 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0359110E05D
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 08:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685349772; x=1716885772;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=knjFlpFfYo9u6xKPtVdQm07paWr1NN+OkYJkfe02cLE=;
 b=NbdLclX7ma6YGkRkdadywq/tnKk7/u4mL5s8I48C92MZ5PD0Z+QFFu8q
 zagV988svaJwfljhaL0bC6SZtBqUyJjhHPgHu+xfQOcPIcBCTVKN4+7xV
 ku9CiKzRytYZXAUdNIarHivYD+JXmZQxNVeSX5/U+TNFYQg4ux3pz9EC9
 tqjjD2qK/J1f/uNgQrlMoCdfj28fpuoRxiud2Z1GSunh+yvFWGBuT9Td4
 GHXaUY132NutnzEBSG0W8nnnV3n26A6unyBUMGJVuYEtje82xpMZoMt7/
 VbU8Y1iVAnMMDo9m4LmrpQxlg00f8X1PBzYYnzykzdKJcZot1vXrel4G+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="353500919"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="353500919"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 01:39:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="830316992"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="830316992"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 29 May 2023 01:39:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 01:39:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 29 May 2023 01:39:58 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 29 May 2023 01:39:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikfqbvxChQyN7VaSMIYpyFCr45/nWpwXA7S+c1LxAOaj8k6coBzVaTKrswI1oR/Y6TsVgOCBAuNfnJgVUoqrdDlmes/G600yYkA6iS471GQdoF+a3EkQrch7dfKwliv5+qgXosGv8G3s8Ela/bs0hPQBwL1xqugTY7Bitiorf41NlD4aUtlCJQU1WIYtH7772vZErXgEFnXIzOp+z4lbunZq+wYSGMfzPsXNe1Rgn+CGA19GAUGjI8OzUyOaq0mknk9cAOanywaLcnsZSbluhZ68ZnJDO1g2+HfckQmu7XcupsIOORUiyun+XS2KguYD9hWuPwTIgDymOTV9vjvFEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOXzOAdU5iGXzgp0fKOtjn2egsNacLi6L/fq2hAV5Wg=;
 b=Zwbp+uQiOPNDm5/oacyy8pY2u14Xs9I0eP8w9/kcPJR3U83yfzc25EWTIXLRFYZMXuyQM5vTYZ7j3ha1M3P+gE/owLD+FTPX89uvzliy3RQUGg3+ADGI79z6RsjFoSdbYNCtKFeG1z36Tz5PDK8I3Zny5MUu5PEG8MgP3AM16FK6ZG5CxNNePb5geaIA5mEwd8N0hUg0f3PvkBX/dOO81mP+pCUm5Qv62sceT1bwWphy2KjgzTw7pZz203CwWTRAJe5GYEBsMn0dV9JGT7Qy7RYWmsg7a665d6ihanFgfT8cffOFrQvKx1xs/MMOMHsN+4cpbNC+QKppwqXsLL/ipw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by BL1PR11MB5556.namprd11.prod.outlook.com (2603:10b6:208:314::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Mon, 29 May
 2023 08:39:55 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::f6ff:ca66:f20b:bd43]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::f6ff:ca66:f20b:bd43%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 08:39:55 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt memory size
Thread-Index: AQHZfnnAmtsopt9dbk62RKm6nfbCWq9xE4SA
Date: Mon, 29 May 2023 08:39:55 +0000
Message-ID: <SJ1PR11MB6204AD929734B440C251F235814A9@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230504112020.300498-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230504112020.300498-1-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|BL1PR11MB5556:EE_
x-ms-office365-filtering-correlation-id: c17e7691-b00f-44c2-4b72-08db6020474f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c1DbXTR7gXLHgZ3vrvtdkKYSa63Gp8pX3VrW23kiA3U7XmMFOE1WYioufQBD9NZ6jtIcWhLs3Z2f0Y7nwrvOuxUyWDDmxhqXQ1nPo5iGN3zLZ/lpeHzEcFy7P2d6kuOJTUmPaz4ky+VUJKCh/aIuz9+GE7jAikkxumOIaGXWJYcj7X7XNPU/xVxrnJjuuZg9EAKLIR4cKugTanC8mqvWIAKveuPN7K7Zfu47W2FUkI/3TVWcVeAB+1wjzm33SAqZYukALcpgcdf8GbOYxIi9kdPot1NHRkTU8ilS5AdsuXNWZ87Du+/IRFYeWFgJViAnFSp3snLeTjalDD4LKSw0KbQNnVDcDuV1eNxtRNvYqMR3dpNV0aU8eogyL0U1pYKXWopWoG5agBTMnilP0QxI7Zs6Ez1poouC/g4nnHLdPdd0lbV0jCciID0L/419ZCtClmSxDSeYLMawOmTDbyLfJKgn7qqJzZXOZGxiK0OEzfrlHwNE6E1S13a61e0BvcYy5b4i8rEFRdNvDdDRNrcnwBEYrp0UdyhfKqHu4P8cjUtwiDFzfvZbtdMqT8lQpLmS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199021)(33656002)(186003)(53546011)(9686003)(6506007)(7696005)(316002)(71200400001)(2906002)(55016003)(52536014)(5660300002)(107886003)(41300700001)(8676002)(8936002)(966005)(478600001)(82960400001)(122000001)(38100700002)(54906003)(6916009)(4326008)(86362001)(76116006)(66946007)(38070700005)(83380400001)(66556008)(66446008)(64756008)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5aWKcOZoSO0RpVnconX6zyGLOs1F2EUGN3duIkLBZGxrngG0dNyPsQeGElNO?=
 =?us-ascii?Q?fB3VUHDl8kRUDF+LKNzXT4tKclNpnr4CzxB8QoGhhxTiOi95GJtIhq4POzCI?=
 =?us-ascii?Q?vIb8YzU245baF/hCwvHFhJMg90xEYbtRNpgsGw0ERIM3ORGeXUTOUrVyhb8h?=
 =?us-ascii?Q?J8AtKE9mbmeBB55igOF6px5GaOjxGBlb1SXnBTLg8B4N2L8KxuUWZ4gOKmvG?=
 =?us-ascii?Q?n7rUfmIosb0pY9tUYcaiHO19d3t88nyaxw0YUzrDtFIay7WEPzSxBCG1M/H6?=
 =?us-ascii?Q?ZwrEj/aoKHtUOjyr6ijladVmCL8RDijMqokazh+c1i2GBYl2Kn2zNKCgufbw?=
 =?us-ascii?Q?PFHoUPKH4xYellENjb9+s+15c1yWNe70HoNtJ2+zsuCBKRhH5rKm4JVllHMU?=
 =?us-ascii?Q?BMZJZCqUKJuWzVuKg7Q3pkN5WwAJjYlUv2rsQ4ImDTEVT/NePl36AMdZD/I9?=
 =?us-ascii?Q?WVdIRR3UOr3iC8FUgXmxJj9BISMJXZmyoUBGV0oFNKrnZvga97r+/VaHsMDt?=
 =?us-ascii?Q?uPvtrlEkyqAeDYFDKTwPkIycarDR3mzbGbaTyvtUpFppZ/HMbM8vyKZDGacD?=
 =?us-ascii?Q?fqMLHIhNmSNw2TU0Q5nwo34YRHgNrirhy4wylkq6Gmo2xOwG299TUhgkBpdJ?=
 =?us-ascii?Q?x5edDwRVD92lS0WZWxCjTsnBNra4lGckHkHJYm7XwfHbg1qVPXOboglhvMB5?=
 =?us-ascii?Q?1H+l/+4l4JsJm6F+9uHIvEB5JRRcgo/esQFcZWoDT/wRRwuOtWWb1riL7la2?=
 =?us-ascii?Q?4voyc9z1JDxcK04B4x1ujMvRg7R+/DCbBPTNcFo3GxBER+tsbb3/a6l43eyt?=
 =?us-ascii?Q?PGM70s8ad1tTtk7Z1So4XeAsLoRQzL/KeoqGE2LgdvwM63+ZKYp6n7UOGA8E?=
 =?us-ascii?Q?VhdtctvNBDjfVa13jvn03V4fUNzD+UGhICfrgsHtcSdhvYEXWUxS1brrmAd1?=
 =?us-ascii?Q?hvKyVpLRUmpSj8ti8+8VwRzep/kzAYWIfVAHYcVYCVGUtDJGqm5h/qXVgwgt?=
 =?us-ascii?Q?qzI/eaLwgmIrZzF7GPVPKMU5xFhyx4aray2aabUfEXAXK70nukFRPFtWt4Iv?=
 =?us-ascii?Q?8mI3rgsr6dT5hBkgs7rL0uaQBGCQblFaQZi/Q+BI+qjgsAbNsSQQ4I/lYAul?=
 =?us-ascii?Q?L/kG5RnwRUBpl6rdWd1ehBnl35o1oPe6r6llt+hf/w/94lGksmY0QUPmsxAY?=
 =?us-ascii?Q?QZBMx51pjplHFRW03i5/yniDL4Ey6zq4Ze9FG8oBVG4grrGD55HHr7y6KHl1?=
 =?us-ascii?Q?1Al7Z2JhWZNs0dZ+oMi8OASbkCbDaZnm0EQDBcaaH4gcfSvJZQmRn09Cx6GK?=
 =?us-ascii?Q?QGMe4P0PKZiQBiEm28I3n8oFiXZHPJXSH+6lNLLO92TJAg8NYq52Qxs/wmUS?=
 =?us-ascii?Q?0xHo7DX5ZcIPPxBEJLKL51THCQi00Bdoh4TKm1rUlEn6j6B0+JCdw96nWoV4?=
 =?us-ascii?Q?JnBilPr9VULzT/VCt9NN+7HsA27rmNubVTZ+fSh6jJZ65V/xh1ID+oSRV3ei?=
 =?us-ascii?Q?A5qiHq6AOQ3ZHzI4ndKhtfesJmtprG0u5BxsB6EpuqlKlTAuFIPyDrTt1cTD?=
 =?us-ascii?Q?gbqe62IJarLqyxBaQEub/+NgoK7F9jdR/AJQ7Rj0W12jZQCy1jl0FnNopU1W?=
 =?us-ascii?Q?HmGvrEq0y9gX+GjUKhc5Lxs9qiVC7AAivwWMjavyL3F8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c17e7691-b00f-44c2-4b72-08db6020474f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2023 08:39:55.4382 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lFwWbGxMdJ6xcvIFBH73xbCMzAJnsDfb2PA+HSZit72PcDpmHgTh6NHU/86Tr/+PVpjO41lW5u3QraSAamiAgpPHOc7P1gwPQX1Nylethd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5556
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/3] drm/xe: Add sysfs entry to report per gt
 memory size
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Initiating discussion on sysfs path for this inline below :

> -----Original Message-----
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: Thursday, May 4, 2023 4:50 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Iddamsetty, Aravind
> <aravind.iddamsetty@intel.com>
> Subject: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt memory size
>=20
> Add sysfs entry to read per gt physical memory in total including stolen
> memory.
>=20
> The sysfs entry added can be read using:
> cat /sys/class/drm/card1/gt/gt0/addr_range
> cat /sys/class/drm/card1/gt/gt1/addr_range

We already have gt#num directory created under device folder, should we cre=
ate addr_range under that only. I think that would be straight forward to s=
tart with.  For example,

/devices/pci0000:a7/0000:a7:01.0/0000:a8:00.0/0000:a9:01.0/0000:aa:00.0/drm=
/card1/gt0/addr_range

Initiating discussion there to conclude on path on this sysfs entry as well=
 as scheduler interface entries as well as under "engine" folder under card=
1.

Please provide your inputs.

Thanks,
Tejas
>=20
> As it involves drm_class, it required movement in xe_device init flow, pa=
tch
> for same is part of this series.
>=20
> Actual physical memory per GT was dependent on infra patch from Ruhl,
> Michael J, so I have added it as part of this series to pass through pre-=
merge.
> Patchwork: https://patchwork.freedesktop.org/series/117126/#rev3
>=20
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>=20
> Tejas Upadhyay (3):
>   drm/xe: Rework multi tile device memory initialization
>   drm/xe: Register drm device prior to gt init
>   drm/xe: Add sysfs entry to report per gt memory size
>=20
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h   |   2 +-
>  drivers/gpu/drm/xe/xe_bo.c             |   8 +-
>  drivers/gpu/drm/xe/xe_bo.h             |   2 +-
>  drivers/gpu/drm/xe/xe_device.c         |   8 +-
>  drivers/gpu/drm/xe/xe_device_types.h   |  20 +-
>  drivers/gpu/drm/xe/xe_gt_sysfs.c       |  74 ++++++-
>  drivers/gpu/drm/xe/xe_gt_sysfs.h       |   1 -
>  drivers/gpu/drm/xe/xe_gt_types.h       |  21 +-
>  drivers/gpu/drm/xe/xe_migrate.c        |   6 +-
>  drivers/gpu/drm/xe/xe_mmio.c           | 279 ++++++++++++++-----------
>  drivers/gpu/drm/xe/xe_mmio.h           |   4 +-
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  30 +--
>  12 files changed, 291 insertions(+), 164 deletions(-)
>=20
> --
> 2.25.1

