Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C6FCDB482
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 08:53:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA1310E0BC;
	Fri, 13 Oct 2023 08:53:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8184210E0BC
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 08:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697187183; x=1728723183;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=px/sFvk5zzWUGkqmWMc1dRLCrHOZjHapbHP/IjLJyg4=;
 b=MbEK/AsoGgXmuX6RGM5jcaUPH2beS0A5LhR0MjBNjR4+0CsT4bdQrlvV
 cAixijn3UWIrKd58+3Rhcn6Hu8Wgp8oQc2jLyevvyBIkX2qugyB2rhQk/
 1mlEdWIlTQ5vTkE0ueSy8IUV39Cy6/FTjC6ZfZNwdbMBYKVOujLTySrK6
 g/p34y0lWJVWz8OwPglHfIABmzKnUMLPKr3jr6A07wRI7Fg/MhsU70fnJ
 uYRv6M+v9EKoyD1NOOtTiBwXqOIjT9qLYmyqKv+/4VTDVYa8eIEhn2AhF
 t3lw+DHPlhz0Erk/weYe0wLYKb/5gM1WN17sHbwQH+HErxY4qhKy1uKLX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="3731213"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="3731213"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 01:53:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="824978314"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="824978314"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 01:53:00 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 01:52:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 01:52:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 01:52:59 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 01:52:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCM2frEQTDslxwAawkzLXhJ67qnmlyNNo5KgL5XS/YFnDdAGB+CQlaN18AE8IPSKeoC0sMUGKYRdgn4YKDhVNKsU4rPgaZESxqbLqhtl/ecg+tdfZSz4Q9dxIPRUimkGC5nPQtWkiAG5P2kImSHib7+rgIMrnm3yYWc9gARMqTARFFTZISZQlRG1SjoUAfnvgY4mmHGtjHKrunB8FLcAi61kGLyzTWf/e7JXqNkxJBYxzDUPkXQfKUfeiDmwi+HYKHaj9pbWlUsKFmSI75hN43PmwCP/WGKs1p6/IdDkptPoysDSj9Da0EgE1uBnDbX72fo+fevApKL6S+CCONhFiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CrDOBHCE7YUqG0tP0cVHsR3l6W5cxaEsu2O19/lfEs=;
 b=XNMeFFJIJ5cYBmisbhfRwMlj65cvQPxvoAKmrl7BCknB+mRJpLtakKCzWKlcH+Ns+kVDfzSgJPuKNxepmVSvT2aGxFS3hgQoQ90ew3WIVRTxgJOXDg6gZ6jKWeBYms34aaG+AYyDSGNqkNrXQt2eJZ+rK9iQ4dgXQpY+nMnCgshBAEE2x13CJTVT+aMkzz88QQ6m/F9U6YhIMkrUP3rR4TSm0szOcEuX6hH+zrD1/sYDf0skUaFko1eqOjhVwwniYkfZQbEuPx7HjFdwdiajrxVpTgvUlMmYR8rpgQCbmEnCLqxAIwHq3UywrrBXAY9mprlktTMYzJrqNOtq8doGmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 BL1PR11MB5271.namprd11.prod.outlook.com (2603:10b6:208:31a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Fri, 13 Oct
 2023 08:52:51 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4%3]) with mapi id 15.20.6863.032; Fri, 13 Oct 2023
 08:52:51 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v4 0/6] Fix compatibility issue for intel_dmc
Thread-Index: AQHZ/aKXh0fXIUasrk2EyvCt+5RM4LBHaXuw
Date: Fri, 13 Oct 2023 08:52:51 +0000
Message-ID: <DM4PR11MB6360EE7AAC1311A1A9A0C0FFF4D2A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20231013065323.2233783-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20231013065323.2233783-1-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|BL1PR11MB5271:EE_
x-ms-office365-filtering-correlation-id: 670e97cd-22a2-4216-f180-08dbcbc9c85f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DH6bpR82TsEJU6sDGNJJzZ9ft8JTsAEReokOXflZbmq4pZVEGuxuVcLHg9Vc8ryMNW8wAwA/LmOo9f3X8TT57Q+NXu/7hV+P7pYWInvqnjohXYbY+uVlHUBKoNr4AVzh7nQAAjbZ61VaAjyODzgay3hTzg4akFYnZjZrD3rLO66D8+lgGaHuSWgaN7Xfcukz6ixv+KRhMN5Sgw9XQO1nxWHL/N/wP1Skh7htGNmI/ECouK2c7NAax5YI5jn3WjBZwNYgeyILwhiNYJWwUjqQBWw85dNAHSugii2jNfcXFuwG8xN5r/XndeRSdPIyHLzl+wUXQ7xX/k3/bAl+UkTQd82mHEQYG1ZvP92+a+5i2Xz+9uHjf86738fGMJ2l9ryO/Zja+L1pyA501rAzJJXtqUDhx98aesQSJlX9WoLnFJvQiAEA3H4HDX++J6NOidttWMXezCTfODK5F3o2szjkN6xlCdzqsbSjgLEn+W2odzEUmklJQH46zAC8NmLRzmxp/4vZboqVeiarzkiUC/yD8rFWy4JgHVqb/cgGgYwYjOS6ONK0jDglHBZqVpzEA11yTlYBZNh1ov/YsmTcU21fz6pwEjUAYoYifHWGCBJNuQQWemsi/h4imnnz/B4cYfAX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(366004)(136003)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(7696005)(6506007)(53546011)(83380400001)(26005)(122000001)(55016003)(9686003)(38100700002)(38070700005)(33656002)(2906002)(5660300002)(4326008)(52536014)(86362001)(8676002)(71200400001)(110136005)(316002)(76116006)(66946007)(64756008)(54906003)(66476007)(66556008)(66446008)(41300700001)(82960400001)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?f1i4VXCB9Othe6eSlCHUNNh/rgsDwi8MenvQP8x62+mgH2GgZp2Sn8wUcd9E?=
 =?us-ascii?Q?tq8y66Wg+Q1RfdfvafUIBtRCBcikYFAqMQqVvt5f4+L1Zeq9crUq/EiyXz+j?=
 =?us-ascii?Q?kOsB7zINfvfxdBuJPW4tShJEVnTRtfj6AEkaThhxA+ZRgwb+yidrErybcHmX?=
 =?us-ascii?Q?M3m+Q07gG7PoS0xCcZy64umvI3I0rATcfoliuIys+wiSNS0BBgCfWaPimK3s?=
 =?us-ascii?Q?FJAESR/4KXYsJfrftE1XBaByIBiaYf/hsxOC2iWZ7aQgsBHqFiAsVKABMKPy?=
 =?us-ascii?Q?iRPpgjgq1l4zWrjo7Av3JIdMyrRQ3+jnIwgGzZoqJy3pL/gU3VJn5DSlT2P2?=
 =?us-ascii?Q?wVB4qJHRPKzSU+SFaiOpTGjyjFVdnGy4k3NetzFY7JonG78THRNmrtBIbLNI?=
 =?us-ascii?Q?8oRcCnJGQFM7a1HvqW3Ak/RmkOp2cmIFiCCheTyFy62IBdbZqCRlF0Vhwjdx?=
 =?us-ascii?Q?wKlJlnCM8ZnYXs43oa/VUdaJJwViU99fm8WEHM5MZfNolj38EgBGghppD1ap?=
 =?us-ascii?Q?Ko3kFippSW4WKZG8B2e2hOP66seED6Xocy2v2gLED+DDqZIG8woehoYOBM1R?=
 =?us-ascii?Q?IA5uxZy0KT9WF6AxQ6/Seiipaqftw+8aMdGThJ7MngDdMi6OwR8kWuEw4bJi?=
 =?us-ascii?Q?g3tbnTz8wHaNUWd5tocxsleIJmHGAHVAzVMy3XXj6fFe5orwMuupq3WSnpd3?=
 =?us-ascii?Q?4fZPAw4/0SDmLNncSeaA9sDB7malqkOpQjVleX2rzIWOhdlTBEr+DD679yLa?=
 =?us-ascii?Q?BT7C0nzG+DesdbYdbARZM5iLKMgsDtzjQTcDwiEPqY2RoOFqzRBd8eMV5l3Z?=
 =?us-ascii?Q?nYfJL4iu0xSuZZcqO+HpNe1p1n+agX3JqvO7OpSxlseP2+nCEUiRdMlJ5Uy8?=
 =?us-ascii?Q?22OA1NpisXQ6VFZTlME4dXZOdiKDHTMadj7+4GQM7i1zI2lakzKS9CCGPqRl?=
 =?us-ascii?Q?RPfc/XY4yIt22X3VV3JnqTPyHzyveRlSarZdLd0rRr0cogoS+lk1Dfu6Q919?=
 =?us-ascii?Q?7r9isImpsjNPkFF+fyS0Pg04NPbiLWsgRzdy8NHGA4zrO+6kg9JJ84e3nQcz?=
 =?us-ascii?Q?BamuE1JceCNKaEx3ssRq67D/Wl9xDlwrGqEkL0eLAEexWTIz20ira1wJxmvq?=
 =?us-ascii?Q?n8lT80Mk8zrvge62lr2/0yXKNwP8a1XofquCMGcNmj80Up8Mxx1JE1fDBI1X?=
 =?us-ascii?Q?Es1Pe4zHGheaaox1SxzqD3ueTrV6GuqmWTwb1TzBe88uvXNFXPlr1RuBZ61j?=
 =?us-ascii?Q?8E2YU9ZEpbBZVqHlFp0yUmTMUik3e/XjRI22QynoMCtxYV23HOW7m/eZGhFY?=
 =?us-ascii?Q?q1CwxyOCuAxjeIUe582wy7RZTEiyPjG/bPLN6AM/AvoL5yuo02rgaPPscyDg?=
 =?us-ascii?Q?4ug2WTADZojUBc1QPNQAYfEmRLx6PeuwMK4zsCXxHDnnaebdb/xe/645mjkk?=
 =?us-ascii?Q?UyhnW9a/elPlEOEEOK93NJYVFZgI4grXAiQRMURWtXjNSW7uPK5zDRprwtma?=
 =?us-ascii?Q?wevjWXw5I1H1UPaMTnDfIKJkY2tH21fWchpiQHzbyrEegxHMhGz73inUymFV?=
 =?us-ascii?Q?wOuUD/KIXeLt5Q8zKg8IuEMHqt4K5zSewNyJ+vWB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 670e97cd-22a2-4216-f180-08dbcbc9c85f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2023 08:52:51.3075 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QwK7Nc/jLoirV46NcWJZo0DuTNr0Y3YDY3viXktXDVS/dEngQMJQQmzRyo61XNdU2vdF/KaSAtOIp+A9a/u0oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5271
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 0/6] Fix compatibility issue for intel_dmc
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Sent: Friday, October 13, 2023 12:23 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; jani.nikula@linux.intel.com;
> Manna, Animesh <animesh.manna@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>
> Subject: [PATCH v4 0/6] Fix compatibility issue for intel_dmc
>=20
> This series reverts hacky #ifdefs from intel_dmc
>=20
> v2: Rebase
> v3: Add compat headers as fixup patches to
>     "drm/xe/display: Implement display support"
> v4: Do not specify directory for firmware repository path

Pushed to drm-xe-next. Thanks for the patches and reviews.

Regards,
Uma Shankar

> Chaitanya Kumar Borah (6):
>   Revert "FIXME: drm/i915/dmc: xe way of getting at stepping"
>   drm/i915: Add wrapper for getting display step
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
>=20
>  drivers/gpu/drm/i915/display/intel_dmc.c      | 19 ++----------------
>  drivers/gpu/drm/i915/intel_step.c             |  5 +++++
>  drivers/gpu/drm/i915/intel_step.h             |  1 +
>  .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  4 +++-
>  .../xe/compat-i915-headers/i915_gpu_error.h   | 17 ++++++++++++++++
>  .../drm/xe/compat-i915-headers/intel_step.h   | 20 +++++++++++++++++++
>  .../drm/xe/compat-i915-headers/intel_uc_fw.h  | 11 ++++++++++
>  7 files changed, 59 insertions(+), 18 deletions(-)  create mode 100644
> drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
>=20
> --
> 2.25.1

