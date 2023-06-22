Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E32EB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 09:40:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25D410E50B;
	Thu, 22 Jun 2023 09:40:21 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7917210E508
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jun 2023 09:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687426819; x=1718962819;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Z9x1Qx4EMgboqnFImDrdepZ8pryEawdaNd2jKc45Gss=;
 b=Eoi/rlbvBpHScvXoAbp9AoDCtMBVZLufi96ZTemu/QX9Z8TuvPq0gsQT
 K1pI3Sn78KfLe+LXhJqxElEVu1Cbwr4/YIIbWKax+boZVZQhkFsA4HVkT
 qVKJSVSKyTw+1S5iOHrWO42aSMdVosmb12NHxFi+gPeoE6wknR6OxT5P6
 4UMPMFGtQe3ZLl7Ekppz+Bm9c0jnBC7YvDpkWrsCNO5rgjJm2sV6gG8rT
 vCyBzF+vgo0fA9gRbgA7AcSAJUviYNzp9YbVnXEzRVIOuDnZiboxHVL0m
 dTxYIWloP1eUwDo8ROMguax1d3ACxvrF27BXl+VTbUj7uE57jTcwmcpsz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="390129287"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="390129287"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 02:40:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="692179205"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="692179205"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 22 Jun 2023 02:40:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 22 Jun 2023 02:40:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 22 Jun 2023 02:40:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 22 Jun 2023 02:40:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NX6NOf9vTO+ZQHj0o1PxhK1CZV+F3zcZhEU7wxnRQfA9TsLpaI/lPwASQMcLkG4zEx/9DRc/4Cs1LgWPxnZrmf4b1+NAimlPsJNAjIOTDkeYDLBcUK/XVtKKLR2cAHoQE71+IHzT9FpREASKVQWh7NefcMvzHrOpt92kRABrM9VX3hoAWT7Q+dmhI5fwb2Jlk5XXzlm7iqJWLz3OoIOl8yZHWtCUbpUtJrOUID5asKgN0IN2LGxEBXRW+L/nT+ebu676NeGtHFBVqc3nepYikChPu25pc/KuSdIV4DaQNg5BDQL0ERWID9UObJBNFu5r1meHwDYvB6g6jvdbQeZkjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6Ch74lD77CDrE5x2Gk6uVdpvgucSYLAPHdgCJl9LuA=;
 b=Yt58YAAaWVxP7KZKLc3iYNj6s7aVohutgeS4oZotb4ufRTyvFkKqNswc4hbPf1W7L6cz/B7cRLpxwUH34v85TbkJsERaIxPVoBHBI02Ia/O/P7rUCnJJ9+ESF+xJYKkS7DDwPEF8OdTuIyAzsnu3lScilHwfRMYL6kyMHiy/0b/2c/mszBNwknpK+0BvHOzLVLc6tKNSiGeJQ8ioLBGdw3xSogMtvdkUrK4xn83aHGZ0okQotSmNT2omuAPuDNYISyZIDYXW1XBTv0fSH9BOIy8I/yJjDhONucaKES39eb+ANSfmXH+qxTRHVGdYOZMdAuPtb4uCPwV8Dm++dAObUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ2PR11MB7672.namprd11.prod.outlook.com (2603:10b6:a03:4cd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 09:40:14 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e%7]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 09:40:14 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 6/6] drm/xe: Add min/max cap for engine scheduler
 properties
Thread-Index: AQHZn5OoV4m8+X1mn0ec0w5kG72QHK+Wmc7Q
Date: Thu, 22 Jun 2023 09:40:14 +0000
Message-ID: <MW4PR11MB7056A594D469F574838332A8B322A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230615141933.2865583-1-tejas.upadhyay@intel.com>
 <20230615141933.2865583-7-tejas.upadhyay@intel.com>
In-Reply-To: <20230615141933.2865583-7-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|SJ2PR11MB7672:EE_
x-ms-office365-filtering-correlation-id: 460da82a-b709-4366-9a91-08db7304ae69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SP6sQ6ietoWJkYZYZzd3i3YYuo7xY8UkAn05bI5SKDubTFqYm5XajeluAdqKTVrn7b4+im4m2+XUya9I6nwaUmACjw8jB5ASuEIBmnPFfBC0LKJ7U3nvwVUHKPeLstvMR53LWe/fYTXHDlnwnOSKWyLlFi0u6/wktM3GC/VSls+eDVkESJ+Td5K7J737lhU5lDt9ZVpe6S20+JdZAYNRUEPUVsCa53yD5N/lRQWiFOvQ5DcAFrIvGQS7ChVnEk9WDeLWm1jWxfjfqmrtc6xTZBwP8STZ8vmGCbbqL8RR6SzLlJF3TIhdxIh3g+Fb9JkJleKRlaT5I8rplHheXw8qJqzxdK4kqdcbYFWSqWinm0YOCcpYnxyNSkMLZgoXn1BEUz8M73KSqNd27kTdCMxVm0kubY+iU7rl5B8/YtJ0Tod9taSC+TGYVEJVHgS2NZpnnLesxXaAjX524p02bijLHAo1F4VC+N9YeWlxbgOY3Jdhtyr5ffkjTYYs2DEOtcQX0k7SHRITCuizmWir17YJTiWQ81jzbBnPKQdsErnZDgdYmLH/e563IcWAsknFcC/jD8M41wxZ/zqSgVObPszi1HMsl++FwzMNQjDdskRJVwJG1/tuJ6MHKvGhSfRZNqB3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199021)(26005)(6506007)(186003)(9686003)(53546011)(2906002)(30864003)(107886003)(8676002)(52536014)(8936002)(71200400001)(83380400001)(55016003)(33656002)(122000001)(5660300002)(41300700001)(7696005)(38070700005)(4326008)(86362001)(316002)(64756008)(66446008)(76116006)(66946007)(66556008)(66476007)(82960400001)(38100700002)(54906003)(478600001)(110136005)(579004)(559001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BJFYXE10RLsqOshayI0OZZMXoC1WlhgnalSqyutB6C8+CGOGyTGFxsvox2uD?=
 =?us-ascii?Q?t1P4+nnZjMoBCwwwnVy2f0/VpMEpzNPX/FChcX6ZGdaPTuk28d7Y9o5NE2xJ?=
 =?us-ascii?Q?Iy5PwAJqYiM7H08nIO07V5YxbUmTWdEz1/7d/U3nkDM69MGnClXA/97Jz+T6?=
 =?us-ascii?Q?CIfZWdVZkGCNJSMhtrXjRfatfUabfRMmaAV8kpihZO51H8NN1mbwz5QaJKBk?=
 =?us-ascii?Q?2C9vU5/9S1K/fepHLQiK74FKUWQiSGkWF+61XL0r7cVA7AmBSPpgocXOTZBI?=
 =?us-ascii?Q?laaZZ5WmS5iR2Jcwb2LXnTUV6qmy32dd97x8LvY82BrweS2VGh7Vcl4VdmaN?=
 =?us-ascii?Q?B/GgBEx01qJc1ybnP9lzIeWqmQfiC30XawSnPO/lAfIjzHgr0Hgwux6vJSpx?=
 =?us-ascii?Q?sppPPuQTYCRNcMnY8X/oWcD28Ka81xJZsiG3LNWw/e7H1vyS1p2qxaihvc+U?=
 =?us-ascii?Q?Y8ZZg8Dx9V3mdOIxl/PbfnuXwMpJPB3ZCf966+lErYrE4OSwP5hELcEzR9Lv?=
 =?us-ascii?Q?T38htHEnUajU2iZcaUE2jCzn7pnSsXyyzTNpSkV2k2XrP9xs1ck5dYIDTeL4?=
 =?us-ascii?Q?xHYVNqihGPJbXIy6V+4wJL2lOXsZ4ojIZJQX9G1J5zTsYn4YOVc7stuOww7Q?=
 =?us-ascii?Q?dGm7R8QrQQTRc4r2nN76u7CM180Pd9ushvD6d4z4M7wFjDHU2i8UjR38zF4M?=
 =?us-ascii?Q?PW7ki0d9bp1lsbig4R5EN83Fg/veSljVzJSglI1puPHIgjUV6w1Z+wLSsRme?=
 =?us-ascii?Q?qHfzqcEOBm/6dUDm4nNPP8qgiW8gxen/5HXoZbkSs3Pw382v2u5m0mxAWsKq?=
 =?us-ascii?Q?1Gg5WIMtiYvF2PCHYuDkdCOxbPcU/TPSKDJ6A2EBdF1DwxA2lmUVX1qlZbs5?=
 =?us-ascii?Q?uCv5XrNORH3wws+pBhKJ3VwGEFP526tayJBg9b1YUy8xMTdjN2rxcWD+/Gc2?=
 =?us-ascii?Q?eFzkUEjBcXl8J2eWmMXLuLkLDbzHKxUHhz1qpn9NqEu5tZjjMJUbYp2YfdjV?=
 =?us-ascii?Q?HT0qVF4r+etYRqaTm6dSYU3o57zt8ue6gfF3QPGDz3jLMSdKLWpwBI46JE6t?=
 =?us-ascii?Q?NXLfnXhmjgj0td0loD6SGwDkYBkTK0dGASH6uoqMO2IveD1pU+JccHqCjJ0Z?=
 =?us-ascii?Q?ffJamVz9x/2QnEDT1FMtm3NzlX5bGxyO6nf5ndxgEyh/mNOSCsN8Lcfz+Xzj?=
 =?us-ascii?Q?S+vT7rfomml+zBORFQu9ZkeOt4+sPE3vUXwe3ntg7a1pqylUZ7ORk9ahKBxZ?=
 =?us-ascii?Q?v4Jy9QrsdPxvOIxDJNVuAtAqnqSd1BsPVkMbJtRtn99sjlyjXOnur7zTdjQy?=
 =?us-ascii?Q?hs6X9jGwS97I+ZSU1ZZVxIGl8m20DdLWk94nf6bcCpJjH99g5y9+2Q0vKNMo?=
 =?us-ascii?Q?/YqnORfo4Dh5M/+LfIL3kpP+gZ6JljvqaY31m75fmtpOfBwwMIjhV76ciP8P?=
 =?us-ascii?Q?KhTeqgZ5NdndCCTeuuxz9Za1XjU6LSdyy0BBMeyvvndvkpJuC4vQxF6s/gz/?=
 =?us-ascii?Q?cVW50svguvvaf5EOqUD1ECbgamZ7AXuBU73LZSSONf6ByIEMrJ7uPykEewmH?=
 =?us-ascii?Q?GUY0iR6oma8m7TMHlFBWERR+SBu1so6tw4XZDxfHUzs1tg+omf1xe0ZY0mhH?=
 =?us-ascii?Q?ig=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 460da82a-b709-4366-9a91-08db7304ae69
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 09:40:14.6138 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EFRsC6IMbcUWZPts8UqdXXWA96v/iOy/OH+AkGPGmB3qKqmSj313Su1zdjOzybEJpBwxQSqOBWlojeNO0YgnioGMhhExmS+1o/EewEwzBwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7672
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/6] drm/xe: Add min/max cap for engine
 scheduler properties
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


Hi Tejas,

> -----Original Message-----
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: 15 June 2023 19:50
> To: intel-xe@lists.freedesktop.org
> Cc: Iddamsetty, Aravind <aravind.iddamsetty@intel.com>; Ghimiray, Himal
> Prasad <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Vishwanathapura, Niranjana
> <niranjana.vishwanathapura@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH 6/6] drm/xe: Add min/max cap for engine scheduler
> properties
>=20
> Add sysfs entries for the min, max, and defaults for each of engine sched=
uler
> controls for every hardware engine class.
>=20
> Non-elevated user IOCTLs to set these controls must be within the min-max
> ranges of the sysfs entries, elevated user can set these controls to any =
value.
>=20
> Introducing compile time CONFIG min-max values which restricts elevated
> user to be in compile time min-max range if at all sysfs min/max are viol=
ated.
>=20
> Sysfs entries examples are,
> DUT# cat /sys/class/drm/cardX/device/gtN/engines/ccs/.defaults/
> job_timeout_max         job_timeout_ms          preempt_timeout_min
> timeslice_duration_max  timeslice_duration_us
> job_timeout_min         preempt_timeout_max     preempt_timeout_us
> timeslice_duration_min
>=20
> DUT# cat /sys/class/drm/card1/device/gt1/engines/ccs/
> .defaults/              job_timeout_min         preempt_timeout_max
> preempt_timeout_us      timeslice_duration_min
> job_timeout_max         job_timeout_ms          preempt_timeout_min
> timeslice_duration_max  timeslice_duration_us
>=20
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig              |   7 +
>  drivers/gpu/drm/xe/Kconfig.profile      |  39 +++
>  drivers/gpu/drm/xe/xe_engine.c          |  40 ++-
>  drivers/gpu/drm/xe/xe_gt_sysfs.c        | 373 ++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_gt_sysfs.h        |   1 +
>  drivers/gpu/drm/xe/xe_hw_engine.c       |   6 +
>  drivers/gpu/drm/xe/xe_hw_engine.h       |  31 ++
>  drivers/gpu/drm/xe/xe_hw_engine_types.h |  12 +
>  8 files changed, 485 insertions(+), 24 deletions(-)  create mode 100644
> drivers/gpu/drm/xe/Kconfig.profile
>=20
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig inde=
x
> d44794f99338..964c440a1135 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -83,3 +83,10 @@ depends on DRM_XE
>  depends on EXPERT
>  source "drivers/gpu/drm/xe/Kconfig.debug"
>  endmenu
> +
> +menu "drm/xe Profile Guided Optimisation"
> +        visible if EXPERT
> +        depends on DRM_XE
> +        source "drivers/gpu/drm/xe/Kconfig.profile"
> +endmenu
> +
> diff --git a/drivers/gpu/drm/xe/Kconfig.profile
> b/drivers/gpu/drm/xe/Kconfig.profile
> new file mode 100644
> index 000000000000..cffd73e44ca9
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/Kconfig.profile
> @@ -0,0 +1,39 @@
> +config DRM_XE_JOB_TIMEOUT_MAX
> +	int "Default max job timeout (ms)"
> +	default 10000 # milliseconds
> +	help
> +	  Configures the default max job timeout after which job will
> +	  be forcefully taken away from scheduler.
> +config DRM_XE_JOB_TIMEOUT_MIN
> +	int "Default max job timeout (ms)"
> +	default 1 # milliseconds
> +	help
> +	  Configures the default min job timeout after which job will
> +	  be forcefully taken away from scheduler.
> +config DRM_XE_TIMESLICE_MAX
> +	int "Default max timeslice duration (us)"
> +	default 10000000 # microseconds
> +	help
> +	  Configures the default max timeslice duration between multiple
> +	  contexts by guc scheduling.
> +config DRM_XE_TIMESLICE_MIN
> +	int "Default min timeslice duration (us)"
> +	default 1 # microseconds
> +	help
> +	  Configures the default min timeslice duration between multiple
> +	  contexts by guc scheduling.
> +config DRM_XE_PREEMPT_TIMEOUT_MAX
> +	int "Default max  preempt timeout (us)"
> +	default 10000000 # microseconds
> +	help
> +	  Configures the default max preempt timeout after which context
> +	  will be forcefully taken away and higher priority context will
> +	  run.
> +config DRM_XE_PREEMPT_TIMEOUT_MIN
> +	int "Default min  preempt timeout (us)"
> +	default 1 # microseconds
> +	help
> +	  Configures the default min preempt timeout after which context
> +	  will be forcefully taken away and higher priority context will
> +	  run.
> +
> diff --git a/drivers/gpu/drm/xe/xe_engine.c
> b/drivers/gpu/drm/xe/xe_engine.c index e72423bc398a..c368ffd5e461
> 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -13,6 +13,7 @@
>=20
>  #include "xe_device.h"
>  #include "xe_gt.h"
> +#include "xe_gt_sysfs.h"
>  #include "xe_hw_fence.h"
>  #include "xe_lrc.h"
>  #include "xe_macros.h"
> @@ -191,9 +192,20 @@ static int engine_set_priority(struct xe_device *xe,
> struct xe_engine *e,  static int engine_set_timeslice(struct xe_device *x=
e,
> struct xe_engine *e,
>  				u64 value, bool create)
>  {
> -	if (!capable(CAP_SYS_NICE))
> +	if (!capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(value,
> +				     e->hwe->sched_props.timeslice_min,
> +				     e->hwe->sched_props.timeslice_max))
>  		return -EPERM;
>=20
> +#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) &&
> defined(CONFIG_DRM_XE_TIMESLICE_MAX)
> +	if (capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(value,
> +				     CONFIG_DRM_XE_TIMESLICE_MIN,
> +				     CONFIG_DRM_XE_TIMESLICE_MAX))
> +		return -EPERM;
> +#endif
> +
Incase of CONFIG being not defined, you are allowing privileged user to set=
 any value which seems wrong.
If CONFIGS are not set,  for privileged user the limit should be same as un=
privileged user.=20
Same applies to other routines too.=20

BR
Himal Ghimiray,=20
>  	return e->ops->set_timeslice(e, value);  }
>=20
> @@ -201,8 +213,19 @@ static int engine_set_preemption_timeout(struct
> xe_device *xe,
>  					 struct xe_engine *e, u64 value,
>  					 bool create)
>  {
> -	if (!capable(CAP_SYS_NICE))
> +	if (!capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(value,
> +				     e->hwe-
> >sched_props.preempt_timeout_min,
> +				     e->hwe-
> >sched_props.preempt_timeout_max))
> +		return -EPERM;
> +
> +#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) &&
> defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
> +	if (capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(value,
> +
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
> +
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
>  		return -EPERM;
> +#endif
>=20
>  	return e->ops->set_preempt_timeout(e, value);  } @@ -269,8
> +292,19 @@ static int engine_set_job_timeout(struct xe_device *xe, struct
> xe_engine *e,
>  	if (XE_IOCTL_ERR(xe, !create))
>  		return -EINVAL;
>=20
> -	if (!capable(CAP_SYS_NICE))
> +	if (!capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(value,
> +				     e->hwe->sched_props.job_timeout_min,
> +				     e->hwe->sched_props.job_timeout_max))
> +		return -EPERM;
> +
> +#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) &&
> defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
> +	if (capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(value,
> +				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
> +				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
>  		return -EPERM;
> +#endif
>=20
>  	return e->ops->set_job_timeout(e, value);  } diff --git
> a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> index f88f8f7dfc7b..415b60845eef 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> @@ -32,6 +32,11 @@ static struct kobj_type kobj_xe_engine_type =3D {
>  	.sysfs_ops =3D &kobj_sysfs_ops
>  };
>=20
> +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max) {
> +	return timeout >=3D min && timeout <=3D max; }
> +
>  static ssize_t preempt_timeout_store(struct kobject *kobj,
>  				     struct kobj_attribute *attr,
>  				     const char *buf, size_t count) @@ -44,9
> +49,20 @@ static ssize_t preempt_timeout_store(struct kobject *kobj,
>  	if (err)
>  		return err;
>=20
> -	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
> +	if (!capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(timeout,
> +				     hwe-
> >sched_props.preempt_timeout_min,
> +				     hwe-
> >sched_props.preempt_timeout_max))
>  		return -EINVAL;
>=20
> +#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) &&
> defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
> +	if (capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(timeout,
> +
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
> +
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
> +		return -EINVAL;
> +#endif
> +
>  	WRITE_ONCE(hwe->sched_props.preempt_timeout_us, timeout);
>=20
>  	return count;
> @@ -63,6 +79,78 @@ static ssize_t preempt_timeout_show(struct kobject
> *kobj,  static struct kobj_attribute preempt_timeout_attr =3D
> __ATTR(preempt_timeout_us, 0644, preempt_timeout_show,
> preempt_timeout_store);
>=20
> +static ssize_t preempt_timeout_max_store(struct kobject *kobj,
> +					 struct kobj_attribute *attr,
> +					 const char *buf, size_t count)
> +{
> +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> +	u32 timeout;
> +	int err;
> +
> +	err =3D kstrtou32(buf, 0, &timeout);
> +	if (err)
> +		return err;
> +
> +#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) &&
> defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
> +	if (!engine_timeout_in_range(timeout,
> +
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
> +
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
> +		return -EINVAL;
> +#endif
> +
> +	WRITE_ONCE(hwe->sched_props.preempt_timeout_max, timeout);
> +
> +	return count;
> +}
> +
> +static ssize_t preempt_timeout_max_show(struct kobject *kobj,
> +					struct kobj_attribute *attr, char *buf)
> {
> +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> +
> +	return sprintf(buf, "%u\n", hwe-
> >sched_props.preempt_timeout_max);
> +}
> +
> +static struct kobj_attribute preempt_timeout_max_attr =3D
> +	__ATTR(preempt_timeout_max, 0644, preempt_timeout_max_show,
> +	       preempt_timeout_max_store);
> +
> +static ssize_t preempt_timeout_min_store(struct kobject *kobj,
> +					 struct kobj_attribute *attr,
> +					 const char *buf, size_t count)
> +{
> +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> +	u32 timeout;
> +	int err;
> +
> +	err =3D kstrtou32(buf, 0, &timeout);
> +	if (err)
> +		return err;
> +
> +#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) &&
> defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
> +	if (!engine_timeout_in_range(timeout,
> +
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
> +
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
> +		return -EINVAL;
> +#endif
> +
> +	WRITE_ONCE(hwe->sched_props.preempt_timeout_min, timeout);
> +
> +	return count;
> +}
> +
> +static ssize_t preempt_timeout_min_show(struct kobject *kobj,
> +					struct kobj_attribute *attr, char *buf)
> {
> +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> +
> +	return sprintf(buf, "%u\n", hwe-
> >sched_props.preempt_timeout_min);
> +}
> +
> +static struct kobj_attribute preempt_timeout_min_attr =3D
> +	__ATTR(preempt_timeout_min, 0644, preempt_timeout_min_show,
> +	       preempt_timeout_min_store);
> +
>  static ssize_t timeslice_duration_store(struct kobject *kobj,
>  		struct kobj_attribute *attr,
>  		const char *buf, size_t count)
> @@ -75,8 +163,19 @@ static ssize_t timeslice_duration_store(struct kobjec=
t
> *kobj,
>  	if (err)
>  		return err;
>=20
> -	if (duration > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
> +	if (!capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(duration,
> +				     hwe->sched_props.timeslice_min,
> +				     hwe->sched_props.timeslice_max))
> +		return -EINVAL;
> +
> +#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) &&
> defined(CONFIG_DRM_XE_TIMESLICE_MAX)
> +	if (capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(duration,
> +				     CONFIG_DRM_XE_TIMESLICE_MIN,
> +				     CONFIG_DRM_XE_TIMESLICE_MAX))
>  		return -EINVAL;
> +#endif
>=20
>  	WRITE_ONCE(hwe->sched_props.timeslice_us, duration);
>=20
> @@ -95,6 +194,79 @@ static struct kobj_attribute timeslice_duration_attr =
=3D
> __ATTR(timeslice_duration_us, 0644, timeslice_duration_show,
> timeslice_duration_store);
>=20
> +static ssize_t timeslice_duration_max_store(struct kobject *kobj,
> +					    struct kobj_attribute *attr,
> +					    const char *buf, size_t count) {
> +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> +	u32 duration;
> +	int err;
> +
> +	err =3D kstrtou32(buf, 0, &duration);
> +	if (err)
> +		return err;
> +
> +#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) &&
> defined(CONFIG_DRM_XE_TIMESLICE_MAX)
> +	if (!engine_timeout_in_range(duration,
> +				     CONFIG_DRM_XE_TIMESLICE_MIN,
> +				     CONFIG_DRM_XE_TIMESLICE_MAX))
> +		return -EINVAL;
> +#endif
> +
> +	WRITE_ONCE(hwe->sched_props.timeslice_max, duration);
> +
> +	return count;
> +}
> +
> +static ssize_t timeslice_duration_max_show(struct kobject *kobj,
> +					   struct kobj_attribute *attr,
> +					   char *buf)
> +{
> +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> +
> +	return sprintf(buf, "%u\n", hwe->sched_props.timeslice_max); }
> +
> +static struct kobj_attribute timeslice_duration_max_attr =3D
> +	__ATTR(timeslice_duration_max, 0644,
> timeslice_duration_max_show,
> +	       timeslice_duration_max_store);
> +
> +static ssize_t timeslice_duration_min_store(struct kobject *kobj,
> +					    struct kobj_attribute *attr,
> +					    const char *buf, size_t count) {
> +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> +	u32 duration;
> +	int err;
> +
> +	err =3D kstrtou32(buf, 0, &duration);
> +	if (err)
> +		return err;
> +
> +#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) &&
> defined(CONFIG_DRM_XE_TIMESLICE_MAX)
> +	if (!engine_timeout_in_range(duration,
> +				     CONFIG_DRM_XE_TIMESLICE_MIN,
> +				     CONFIG_DRM_XE_TIMESLICE_MAX))
> +		return -EINVAL;
> +#endif
> +
> +	WRITE_ONCE(hwe->sched_props.timeslice_min, duration);
> +
> +	return count;
> +}
> +
> +static ssize_t timeslice_duration_min_show(struct kobject *kobj,
> +					   struct kobj_attribute *attr, char
> *buf) {
> +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> +
> +	return sprintf(buf, "%u\n", hwe->sched_props.timeslice_min); }
> +
> +static struct kobj_attribute timeslice_duration_min_attr =3D
> +	__ATTR(timeslice_duration_min, 0644,
> timeslice_duration_min_show,
> +	       timeslice_duration_min_store);
> +
>  static ssize_t job_timeout_store(struct kobject *kobj,
>  		struct kobj_attribute *attr,
>  		const char *buf, size_t count)
> @@ -107,8 +279,19 @@ static ssize_t job_timeout_store(struct kobject
> *kobj,
>  	if (err)
>  		return err;
>=20
> -	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
> +	if (!capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(timeout,
> +				     hwe->sched_props.job_timeout_min,
> +				     hwe->sched_props.job_timeout_max))
> +		return -EINVAL;
> +
> +#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) &&
> defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
> +	if (capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(timeout,
> +				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
> +				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
>  		return -EINVAL;
> +#endif
>=20
>  	WRITE_ONCE(hwe->sched_props.job_timeout_ms, timeout);
>=20
> @@ -126,6 +309,89 @@ static ssize_t job_timeout_show(struct kobject
> *kobj,  static struct kobj_attribute job_timeout_attr =3D
> __ATTR(job_timeout_ms, 0644, job_timeout_show, job_timeout_store);
>=20
> +static ssize_t job_timeout_max_store(struct kobject *kobj,
> +				     struct kobj_attribute *attr,
> +				     const char *buf, size_t count) {
> +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> +	u32 timeout;
> +	int err;
> +
> +	err =3D kstrtou32(buf, 0, &timeout);
> +	if (err)
> +		return err;
> +
> +#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) &&
> defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
> +	if (!engine_timeout_in_range(timeout,
> +				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
> +				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
> +		return -EINVAL;
> +#endif
> +
> +	WRITE_ONCE(hwe->sched_props.job_timeout_max, timeout);
> +
> +	return count;
> +}
> +
> +static ssize_t job_timeout_max_show(struct kobject *kobj,
> +				    struct kobj_attribute *attr, char *buf) {
> +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> +
> +	return sprintf(buf, "%u\n", hwe->sched_props.job_timeout_max);
> +}
> +
> +static struct kobj_attribute job_timeout_max_attr =3D
> +__ATTR(job_timeout_max, 0644, job_timeout_max_show,
> +job_timeout_max_store);
> +
> +static ssize_t job_timeout_min_store(struct kobject *kobj,
> +				     struct kobj_attribute *attr,
> +				     const char *buf, size_t count) {
> +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> +	u32 timeout;
> +	int err;
> +
> +	err =3D kstrtou32(buf, 0, &timeout);
> +	if (err)
> +		return err;
> +
> +#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) &&
> defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
> +	if (!engine_timeout_in_range(timeout,
> +				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
> +				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
> +		return -EINVAL;
> +#endif
> +
> +	WRITE_ONCE(hwe->sched_props.job_timeout_min, timeout);
> +
> +	return count;
> +}
> +
> +static ssize_t job_timeout_min_show(struct kobject *kobj,
> +				    struct kobj_attribute *attr, char *buf) {
> +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> +
> +	return sprintf(buf, "%u\n", hwe->sched_props.job_timeout_min);
> +}
> +
> +static struct kobj_attribute job_timeout_min_attr =3D
> +__ATTR(job_timeout_min, 0644, job_timeout_min_show,
> +job_timeout_min_store);
> +
> +static const struct attribute *files[] =3D {
> +	&job_timeout_attr.attr,
> +	&job_timeout_min_attr.attr,
> +	&job_timeout_max_attr.attr,
> +	&timeslice_duration_attr.attr,
> +	&timeslice_duration_min_attr.attr,
> +	&timeslice_duration_max_attr.attr,
> +	&preempt_timeout_attr.attr,
> +	&preempt_timeout_min_attr.attr,
> +	&preempt_timeout_max_attr.attr,
> +	NULL
> +};
> +
>  static ssize_t job_timeout_default(struct kobject *kobj,
>  				 struct kobj_attribute *attr, char *buf)  { @@
> -137,6 +403,28 @@ static ssize_t job_timeout_default(struct kobject *kobj=
,
> static struct kobj_attribute job_timeout_def =3D  __ATTR(job_timeout_ms,
> 0444, job_timeout_default, NULL);
>=20
> +static ssize_t job_timeout_min_default(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf) {
> +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_min); }
> +
> +static struct kobj_attribute job_timeout_min_def =3D
> +__ATTR(job_timeout_min, 0444, job_timeout_min_default, NULL);
> +
> +static ssize_t job_timeout_max_default(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf) {
> +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_max); }
> +
> +static struct kobj_attribute job_timeout_max_def =3D
> +__ATTR(job_timeout_max, 0444, job_timeout_max_default, NULL);
> +
>  static ssize_t timeslice_default(struct kobject *kobj,
>  				 struct kobj_attribute *attr, char *buf)  { @@
> -148,6 +436,28 @@ static ssize_t timeslice_default(struct kobject *kobj,
> static struct kobj_attribute timeslice_duration_def =3D
> __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
>=20
> +static ssize_t timeslice_min_default(struct kobject *kobj,
> +				     struct kobj_attribute *attr, char *buf) {
> +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", hwe->defaults.timeslice_min); }
> +
> +static struct kobj_attribute timeslice_duration_min_def =3D
> +__ATTR(timeslice_duration_min, 0444, timeslice_min_default, NULL);
> +
> +static ssize_t timeslice_max_default(struct kobject *kobj,
> +				     struct kobj_attribute *attr, char *buf) {
> +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", hwe->defaults.timeslice_max); }
> +
> +static struct kobj_attribute timeslice_duration_max_def =3D
> +__ATTR(timeslice_duration_max, 0444, timeslice_max_default, NULL);
> +
>  static ssize_t preempt_timeout_default(struct kobject *kobj,
>  				       struct kobj_attribute *attr,
>  				       char *buf)
> @@ -160,6 +470,43 @@ static ssize_t preempt_timeout_default(struct
> kobject *kobj,  static struct kobj_attribute preempt_timeout_def =3D
> __ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
>=20
> +static ssize_t preempt_timeout_min_default(struct kobject *kobj,
> +					   struct kobj_attribute *attr,
> +					   char *buf)
> +{
> +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", hwe->defaults.preempt_timeout_min);
> +}
> +
> +static struct kobj_attribute preempt_timeout_min_def =3D
> +__ATTR(preempt_timeout_min, 0444, preempt_timeout_min_default,
> NULL);
> +
> +static ssize_t preempt_timeout_max_default(struct kobject *kobj,
> +					   struct kobj_attribute *attr,
> +					   char *buf)
> +{
> +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", hwe->defaults.preempt_timeout_max);
> +}
> +
> +static struct kobj_attribute preempt_timeout_max_def =3D
> +__ATTR(preempt_timeout_max, 0444, preempt_timeout_max_default,
> NULL);
> +
> +static const struct attribute *defaults[] =3D {
> +	&job_timeout_def.attr,
> +	&job_timeout_min_def.attr,
> +	&job_timeout_max_def.attr,
> +	&timeslice_duration_def.attr,
> +	&timeslice_duration_min_def.attr,
> +	&timeslice_duration_max_def.attr,
> +	&preempt_timeout_def.attr,
> +	&preempt_timeout_min_def.attr,
> +	&preempt_timeout_max_def.attr,
> +	NULL
> +};
> +
>  int xe_add_engine_defaults(struct kobject *parent)  {
>  	struct kobject *kobj;
> @@ -175,15 +522,7 @@ int xe_add_engine_defaults(struct kobject *parent)
>  	if (err)
>  		goto err_object;
>=20
> -	err =3D sysfs_create_file(kobj, &job_timeout_def.attr);
> -	if (err)
> -		goto err_object;
> -
> -	err =3D sysfs_create_file(kobj, &timeslice_duration_def.attr);
> -	if (err)
> -		goto err_object;
> -
> -	err =3D sysfs_create_file(kobj, &preempt_timeout_def.attr);
> +	err =3D sysfs_create_files(kobj, defaults);
>  	if (err)
>  		goto err_object;
>=20
> @@ -286,15 +625,7 @@ int xe_gt_sysfs_engines(struct xe_gt *gt)
>  			return err;
>  		}
>=20
> -		err =3D sysfs_create_file(&khwe->base,
> &job_timeout_attr.attr);
> -		if (err)
> -			goto err_object;
> -
> -		err =3D sysfs_create_file(&khwe->base,
> &timeslice_duration_attr.attr);
> -		if (err)
> -			goto err_object;
> -
> -		err =3D sysfs_create_file(&khwe->base,
> &preempt_timeout_attr.attr);
> +		err =3D sysfs_create_files(&khwe->base, files);
>  		if (err)
>  			goto err_object;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h
> b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> index a539cf031c7d..a7ac7b9a9768 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> @@ -12,6 +12,7 @@
>=20
>  int xe_gt_sysfs_init(struct xe_gt *gt);  int xe_gt_sysfs_engines(struct =
xe_gt
> *gt);
> +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max);
>=20
>  static inline struct xe_gt *
>  kobj_to_gt(struct kobject *kobj)
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 8314429cfa90..e52324eb1efa 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -363,8 +363,14 @@ static void hw_engine_init_early(struct xe_gt *gt,
> struct xe_hw_engine *hwe,
>  	hwe->engine_id =3D id;
>  	/* FIXME: Wire up to configurable default value */
>  	hwe->sched_props.job_timeout_ms =3D HZ * 5;
> +	hwe->sched_props.job_timeout_min =3D
> XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> +	hwe->sched_props.job_timeout_max =3D
> XE_HW_ENGINE_JOB_TIMEOUT_MAX;
>  	hwe->sched_props.timeslice_us =3D 1 * 1000;
> +	hwe->sched_props.timeslice_min =3D
> XE_HW_ENGINE_TIMESLICE_MIN;
> +	hwe->sched_props.timeslice_max =3D
> XE_HW_ENGINE_TIMESLICE_MAX;
>  	hwe->sched_props.preempt_timeout_us =3D 640 * 1000;
> +	hwe->sched_props.preempt_timeout_min =3D
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> +	hwe->sched_props.preempt_timeout_max =3D
> +XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
>  	hwe->defaults =3D hwe->sched_props; /* Record default props */
>=20
>  	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt)); diff --git
> a/drivers/gpu/drm/xe/xe_hw_engine.h
> b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 7eca9d53c7b1..3d37d6d44261 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -10,6 +10,37 @@
>=20
>  struct drm_printer;
>=20
> +#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> +#define XE_HW_ENGINE_JOB_TIMEOUT_MIN
> CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> +#else #define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1 #endif #ifdef
> +CONFIG_DRM_XE_JOB_TIMEOUT_MAX #define
> XE_HW_ENGINE_JOB_TIMEOUT_MAX
> +CONFIG_DRM_XE_JOB_TIMEOUT_MAX #else #define
> +XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000) #endif #ifdef
> +CONFIG_DRM_XE_TIMESLICE_MIN #define
> XE_HW_ENGINE_TIMESLICE_MIN
> +CONFIG_DRM_XE_TIMESLICE_MIN #else #define
> XE_HW_ENGINE_TIMESLICE_MIN 1
> +#endif #ifdef CONFIG_DRM_XE_TIMESLICE_MAX #define
> +XE_HW_ENGINE_TIMESLICE_MAX CONFIG_DRM_XE_TIMESLICE_MAX #else
> #define
> +XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000) #endif #ifdef
> +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN
> +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN #else #define
> +XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1 #endif #ifdef
> +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX
> +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX #else #define
> +XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000) #endif
> +
>  int xe_hw_engines_init_early(struct xe_gt *gt);  int
> xe_hw_engines_init(struct xe_gt *gt);  void xe_hw_engine_handle_irq(struc=
t
> xe_hw_engine *hwe, u16 intr_vec); diff --git
> a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 406a1e33a05e..8582193b4947 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -111,10 +111,22 @@ struct xe_hw_engine {
>  	struct {
>  		/** @set_job_timeout: Set job timeout in ms for engine */
>  		u32 job_timeout_ms;
> +		/** @job_timeout_min: Min job timeout in ms for engine */
> +		u32 job_timeout_min;
> +		/** @job_timeout_max: Max job timeout in ms for engine */
> +		u32 job_timeout_max;
>  		/** @timeslice_us: timeslice period in micro-seconds */
>  		u32 timeslice_us;
> +		/** @timeslice_min: min timeslice period in micro-seconds
> */
> +		u32 timeslice_min;
> +		/** @timeslice_max: max timeslice period in micro-seconds
> */
> +		u32 timeslice_max;
>  		/** @preempt_timeout_us: preemption timeout in micro-
> seconds */
>  		u32 preempt_timeout_us;
> +		/** @preempt_timeout_min: min preemption timeout in
> micro-seconds */
> +		u32 preempt_timeout_min;
> +		/** @preempt_timeout_max: max preemption timeout in
> micro-seconds */
> +		u32 preempt_timeout_max;
>  	} sched_props, defaults;
>  	/** @sysfs: sysfs kobject pointing to this hwe */
>  	struct kobject *sysfs_hwe;
> --
> 2.25.1

