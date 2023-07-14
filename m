Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B703EB64DA
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 05:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DCD10E118;
	Fri, 14 Jul 2023 05:28:14 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9224510E118
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 05:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689312492; x=1720848492;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=67j1+0Q9jRgDMLfy7HpMF51j3eDpzFvaN1MA+86YVlc=;
 b=GmSngoSIZYwPFd48qMP9NWrhwAZr9PQh8gt728yB9BbC2U+RDN118eSX
 cEOQ+q91W33zpDMHlm/w1/o+ua9VfxF+RqEZRua6JgW+WEEh9L0Xkv2Fg
 REusRNhRsvOlUIeK25iIixIo/c4+LJ4ZvKR1dSKWsvOLbVrmy2hmATLnB
 2GuXx7vWBRcHKxVUSjuYIfm7GSuGJfY+2HAcJsN4T8Xc+H5AH7H1n7x4p
 KUhNGeqeGMgCUJURWzM2Da2EgNRcCqxl3hR6LxSk8eQAjMbKIwJbu7RbH
 AdAbnfd4acijXYLQ0BQAIXDhlG8muBrewq8kRdGRNxpgPIhxejXofnabv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="451759120"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="451759120"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 22:28:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="722266321"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="722266321"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 13 Jul 2023 22:28:04 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 22:28:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 22:28:04 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 13 Jul 2023 22:28:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRlpjX8ICuHHRdMWuq/mM9mqbmgBRoaE066J/BeGtaeC1SZHLVnLajU3p1S3WuIQOOfdlRRyB06G/CjkRqAp1Eh6qY31Zk51LDuoMtHES8Wk/g06RSlMyrUecyZj0KT/lyd1oVFAH7Z7jHGlr3clcH0k05kEm6sIHJdQL8fuFg2JFoZY7TE/W5WxX3tx36c6nebqFgFbar0Jsir/RZxZCr6WjbigjN48dw04jYxPEKuAVs5CQYbnAtsT36p1zQpFJHCMa5fmQ5mwoM5jO82rwxiRIlUlPfGmeo8/LPhmS2OJAU6OymGbIji1rkbV8lqt603wHDSjTqfWtWtZ5Lu6ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7krHQWhxqx+a+rBmAz6T3uVHIFAs84afE6YL31hRCKg=;
 b=FA4OQsh9FyayrXO5W9psXBo9edsTkqVCxSaTmmVkTcz+gNKm45F/tImtWc4w3xDuZtSl4q6AZL/j3cTLZAlO6NzzqKzEBK10NzbxHW1ggNdUL7ZUgQQS4xPM3UlkrkO1dN3n7Sa3LtWzkx9/WNVwzb88IqIkU8ITeuFqwpcdKAJOsARM8qbI707Flf2D4O8A8xszKXZCzHrtrluxw3lSmohyFyYKep1kJNHtbiwclX+0tzEKKWnylZmG5vL0BBRElDaPEfjvGVT1g0ER32sXLnjQgMyMpUbau5YPoORFBaYbtuiD4cDJWexge01Mu8bsWOdMDVKqL3Pm7qJ9zWRbQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SN7PR11MB6679.namprd11.prod.outlook.com (2603:10b6:806:269::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 05:28:01 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4%5]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 05:28:01 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH V3 6/6] drm/xe: Add min/max cap for engine scheduler
 properties
Thread-Index: AQHZqbWB4dmXTEEAV0KOs61wPsVEyq+40q6Q
Date: Fri, 14 Jul 2023 05:28:01 +0000
Message-ID: <SJ1PR11MB62043122313DE1F76A9A44738134A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230628114732.3598169-1-tejas.upadhyay@intel.com>
 <20230628114732.3598169-7-tejas.upadhyay@intel.com>
In-Reply-To: <20230628114732.3598169-7-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SN7PR11MB6679:EE_
x-ms-office365-filtering-correlation-id: 9d5918f4-e09e-4cb1-82a2-08db842b175c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tqy643DPtj+g9QVbkoZrUi6XtXexgYtjS9H8QzdJcakkya1/boDyS/EXhnHSMf3/oOeWdIP3+b2pPI/zhGvhsjDFk+ZLlPsBjiuA/EONgPzQwL5jbB6IztM7Xa3keCmmA7aDDjdD+krxn6Ank7ad6Q5HX5gpxPB9VAY9ET6ahac+7rR9ui/pb9pFoE7upIBAG6+DZ4t1M1bPoZesP9cMhJjng47CDGlx4JgT5Pus5CiERTa1PNrMQJzCkNsJsAJCwH7BHiiZyDYQ06+3a9V/OUbh1klRpr3kt6PQCohRFWGRUyg1TkavDx5hurH+V01d5E47Ox9+1Hai0LPtyXRnqF/J+hsERRDmpCpb2EYV7/1VMu/RUmkiYK2MWd8YRpu/9V6fB4687PHdUNsPBMVBeHyK9hIXEGN/tZwLz1s41Hcz5PGkpPPJDedECN16okA9V4N64UKoT4OMN+Do5JzlTa1f8lzodcb8mg6vMglEVIsZQaWzx2vtf10XK4EU6G62b05A6g4ki5XZgaMafUVDiQcfBczUnLVCnvEpocsaIXGzerMvuFeg0adUWJnTcw1vsFO3MvjOxklwFwEFQkhpNlj6Vq6pk67PIg6WNyHOoCp6COir/+VLw8aUe1EzKWpx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199021)(54906003)(41300700001)(107886003)(55016003)(66446008)(64756008)(66476007)(4326008)(76116006)(66946007)(66556008)(6916009)(478600001)(30864003)(5660300002)(52536014)(2906002)(8936002)(8676002)(316002)(71200400001)(7696005)(82960400001)(86362001)(9686003)(6506007)(53546011)(186003)(33656002)(83380400001)(38070700005)(38100700002)(122000001)(579004)(559001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eqIABIp4b2XTuTAQHaq//c39vBMHKJV/OX8+8GdrXVvelTOsExlBzOmlsVj6?=
 =?us-ascii?Q?KcnIA2FvmXIMdSBheHvD0aRUNLWukMDhcA8ls+bguSXTTuu26hC+6UhZnVnq?=
 =?us-ascii?Q?hV2+ZXzsnCrZKyUOkDnwasAlTjX5rDXcyrWPFq8gci/7KDNXyhU9D6MTPSQa?=
 =?us-ascii?Q?KIX7UVa9ozAUyeJXLHX4BGgeSts0xhVbnwXci8x0cIIx+79IcG8pPISAIbiX?=
 =?us-ascii?Q?mWUdQY9Cw1GrTccID54LMpxKCV/ozLJ41OFkiGUdPThHO+Mt09N8Hf22xM6M?=
 =?us-ascii?Q?3F8n3jB89p2HZXz2CvNQ9dNDuq4LEYQV1oUgl3+7HMo+bk5tRrg9wqy1UlS6?=
 =?us-ascii?Q?8xXYAhf4NLXu43wmTgbOWgS1dnQDBSbdjQLgStQyea2+sTZQs0Cn8ZuJSX6q?=
 =?us-ascii?Q?AU3CBHqTJYa6BJA52WUpsdr97QFiqHzk6dvLIvsUzC64lxJr9O4UhQIzJsWI?=
 =?us-ascii?Q?825bC55mOKb5q7NqUySGBGqwWATUYTwHOQRZjzMNVkvUhSbDoeyZ5lcaN9v1?=
 =?us-ascii?Q?Rl8myFCAo4HEHDWWHqcJOC11OCqXBW4TaGO07NkLzVjKsk//CQ/k1ca26lLu?=
 =?us-ascii?Q?ZISqCPjpfZ4z8e1fxyDcUPVKEl2Y5agEPfeWYjjjwTA1v4O3lOGuyI/huQjI?=
 =?us-ascii?Q?amFSzYa1VIGMqQ1UrjqA1Z+rpdioAmBm2otq2O9eGmWiRAnNMb9AdytRk+wD?=
 =?us-ascii?Q?yrBgXNNsm4NAdG+Ht8naESOPYjz0Ouz3ysmlzCZmrLvaOKMMSiCRe6UuBwju?=
 =?us-ascii?Q?DFBU/eIk5ZTkHngi20ptZEXECxdMJBDS5pVoTStopA/LitfN7yAYCnZ1DeNw?=
 =?us-ascii?Q?cI0gSiHB76OeXVtL0wheydvHm1MTAN+SHrUqT10epQqKGyY8MFJjXGLHz8kt?=
 =?us-ascii?Q?cZgEj2Th9+f6YWNdk2GeRxmODYM/IzMFohlA1ujfYMdze7hVMKrhA/+OYZwX?=
 =?us-ascii?Q?K3qtzA0KyPfKC1fKYXhz7j93ic1DGjGSH9VajWlssvlw5AsfJbW5+W70fm5Q?=
 =?us-ascii?Q?hR+YnrkYj5lSGkkDRKXuBVEqf0V3GhLEwzyonf1+aLjuxylW4oB5QBYXMRSJ?=
 =?us-ascii?Q?4LuSWMtCr4hXqMIQiJ9fymyI4FIhzP32WU648eamwAUNyJa+xYcCxG73Q11g?=
 =?us-ascii?Q?ZGmoUY2FheJcs5kYJqL3zRTDEqlQnEbMqEJ3N6wLYAx3QHPH9rR/sfgNhIMJ?=
 =?us-ascii?Q?FecE8YmB635AfKqlFD3sf6odHsx/03oXnjoR81FGJss5+/ZM6XKrFxMg2crT?=
 =?us-ascii?Q?dE29qGGqN8MDOQwFln5NVUSZoPm3iBKHbIkC19kgrnzGRMKN4PqTWnoUhwTJ?=
 =?us-ascii?Q?cKvplxf7/r6E9sUiN+NKYJEmIRLQqO5HeyLvqgMTwqrwIXopv5UHpwPhUXTQ?=
 =?us-ascii?Q?I+HksqWRXHVwAUzw2kwb24gCqdtmgt07m4n9YN/HtrmXmCQLBBL/sXMvfxiU?=
 =?us-ascii?Q?9jRJmM1E6Z/HgQheDnFWHk32lV9d+3tTBOiqhxhkEnv1fgvknjiX637wduMH?=
 =?us-ascii?Q?jltc/vXESlFpWe001YgpKtxwGS5xzctnwVsHCqQS1OerSHthlOe8vX9D21D4?=
 =?us-ascii?Q?bejbfqy/UgFy1VOhU2f1IVJ5Hy2fEYTzGBABoVc1C072FEUrPsHdy+qlragZ?=
 =?us-ascii?Q?pbI7FI4F5yrD7NuYxiAp9HeZUtwMt8uu9mL/z+Mz8uWw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5918f4-e09e-4cb1-82a2-08db842b175c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 05:28:01.3420 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IUmVbj6MgohZGBFLmFiGYE/zC81zVdiF8cuBx+/nnWHsIy1hzWa/KL8e2bzbCo/M606x3BVpDumX7ig56tKQf5TVJRHb6nz6+pIuVoKWeYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6679
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3 6/6] drm/xe: Add min/max cap for engine
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
Cc: "Lahtinen, Joonas" <joonas.lahtinen@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Matt/Joonas,

Looking for more insight on our discussion regarding min/max behaviour for =
elevated/non-elevated user. As discussed with Matt last :

1. Elevated user can set anything. Even can go beyond compile time min max =
limits
2. Non-elevated user can set values in limit of configured sysfs min/max

Are we inline or we need some discussion here, I can make changes according=
ly. Please let me know.

Thanks,
Tejas

> -----Original Message-----
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: Wednesday, June 28, 2023 5:18 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Subject: [PATCH V3 6/6] drm/xe: Add min/max cap for engine scheduler
> properties
>=20
> Add sysfs entries for the min, max, and defaults for each of engine sched=
uler
> controls for every hardware engine class.
>=20
> Non-elevated user IOCTLs to set these controls must be within the min-max
> ranges of the sysfs entries, elevated user can set these controls to any =
value.
> However, introduced compile time CONFIG min-max values which restricts
> elevated user to be in compile time min-max range if at all sysfs min/max=
 are
> violated.
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
> V3 :
>    - Resolve CI hooks warning for kernel-doc
> V2 :
>    - Restric min/max setting to #define default min/max for
>      elevated user - Himal
>    - Remove unrelated changes from patch - Niranjana
>=20
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig              |   7 +
>  drivers/gpu/drm/xe/Kconfig.profile      |  38 +++
>  drivers/gpu/drm/xe/xe_engine.c          |  58 +++-
>  drivers/gpu/drm/xe/xe_gt_sysfs.c        | 407 +++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_sysfs.h        |   1 +
>  drivers/gpu/drm/xe/xe_hw_engine.c       |   6 +
>  drivers/gpu/drm/xe/xe_hw_engine.h       |  31 ++
>  drivers/gpu/drm/xe/xe_hw_engine_types.h |  16 +-
>  8 files changed, 550 insertions(+), 14 deletions(-)  create mode 100644
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
> index 000000000000..bc65326d52b4
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/Kconfig.profile
> @@ -0,0 +1,38 @@
> +config DRM_XE_JOB_TIMEOUT_MAX
> +       int "Default max job timeout (ms)"
> +       default 10000 # milliseconds
> +       help
> +         Configures the default max job timeout after which job will
> +         be forcefully taken away from scheduler.
> +config DRM_XE_JOB_TIMEOUT_MIN
> +       int "Default max job timeout (ms)"
> +       default 1 # milliseconds
> +       help
> +         Configures the default min job timeout after which job will
> +         be forcefully taken away from scheduler.
> +config DRM_XE_TIMESLICE_MAX
> +       int "Default max timeslice duration (us)"
> +       default 10000000 # microseconds
> +       help
> +         Configures the default max timeslice duration between multiple
> +         contexts by guc scheduling.
> +config DRM_XE_TIMESLICE_MIN
> +       int "Default min timeslice duration (us)"
> +       default 1 # microseconds
> +       help
> +         Configures the default min timeslice duration between multiple
> +         contexts by guc scheduling.
> +config DRM_XE_PREEMPT_TIMEOUT_MAX
> +       int "Default max  preempt timeout (us)"
> +       default 10000000 # microseconds
> +       help
> +         Configures the default max preempt timeout after which context
> +         will be forcefully taken away and higher priority context will
> +         run.
> +config DRM_XE_PREEMPT_TIMEOUT_MIN
> +       int "Default min  preempt timeout (us)"
> +       default 1 # microseconds
> +       help
> +         Configures the default min preempt timeout after which context
> +         will be forcefully taken away and higher priority context will
> +         run.
> diff --git a/drivers/gpu/drm/xe/xe_engine.c
> b/drivers/gpu/drm/xe/xe_engine.c index 33d1fbae560d..37c33a231f00
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
> @@ -191,9 +192,26 @@ static int engine_set_priority(struct xe_device *xe,
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
> +#else
> +	if (capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(value,
> +				     XE_HW_ENGINE_TIMESLICE_MIN,
> +				     XE_HW_ENGINE_TIMESLICE_MAX))
> +		return -EPERM;
> +#endif
> +
>  	return e->ops->set_timeslice(e, value);  }
>=20
> @@ -201,9 +219,26 @@ static int engine_set_preemption_timeout(struct
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
>  		return -EPERM;
>=20
> +#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) &&
> defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
> +	if (capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(value,
> +
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
> +
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
> +		return -EPERM;
> +#else
> +	if (capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(value,
> +
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> +
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> +		return -EPERM;
> +#endif
> +
>  	return e->ops->set_preempt_timeout(e, value);  }
>=20
> @@ -269,8 +304,25 @@ static int engine_set_job_timeout(struct xe_device
> *xe, struct xe_engine *e,
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
> +		return -EPERM;
> +#else
> +	if (capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(value,
> +				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> +				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
>  		return -EPERM;
> +#endif
>=20
>  	return e->ops->set_job_timeout(e, value);  } diff --git
> a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> index 4c8f589870ba..743ef9f105d0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> @@ -34,6 +34,11 @@ static const struct kobj_type kobj_xe_engine_type =3D =
{
>  	.sysfs_ops =3D &kobj_sysfs_ops
>  };
>=20
> +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max) {
> +	return timeout >=3D min && timeout <=3D max; }
> +
>  static ssize_t preempt_timeout_store(struct kobject *kobj,
>  				     struct kobj_attribute *attr,
>  				     const char *buf, size_t count) @@ -46,9
> +51,26 @@ static ssize_t preempt_timeout_store(struct kobject *kobj,
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
> +#else
> +	if (capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(timeout,
> +
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> +
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> +		return -EINVAL;
> +#endif
> +
>  	WRITE_ONCE(hwe->sched_props.preempt_timeout_us, timeout);
>=20
>  	return count;
> @@ -65,6 +87,90 @@ static ssize_t preempt_timeout_show(struct kobject
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
> +#else
> +	if (capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(timeout,
> +
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> +
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
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
> +#else
> +	if (capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(timeout,
> +
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> +
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
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
>  					struct kobj_attribute *attr,
>  					const char *buf, size_t count)
> @@ -77,14 +183,116 @@ static ssize_t timeslice_duration_store(struct
> kobject *kobj,
>  	if (err)
>  		return err;
>=20
> -	if (duration > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
> +	if (!capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(duration,
> +				     hwe->sched_props.timeslice_min,
> +				     hwe->sched_props.timeslice_max))
>  		return -EINVAL;
>=20
> +#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) &&
> defined(CONFIG_DRM_XE_TIMESLICE_MAX)
> +	if (capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(duration,
> +				     CONFIG_DRM_XE_TIMESLICE_MIN,
> +				     CONFIG_DRM_XE_TIMESLICE_MAX))
> +		return -EINVAL;
> +#else
> +	if (capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(duration,
> +				     XE_HW_ENGINE_TIMESLICE_MIN,
> +				     XE_HW_ENGINE_TIMESLICE_MAX))
> +		return -EINVAL;
> +#endif
> +
>  	WRITE_ONCE(hwe->sched_props.timeslice_us, duration);
>=20
>  	return count;
>  }
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
> +#else
> +	if (capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(duration,
> +				     XE_HW_ENGINE_TIMESLICE_MIN,
> +				     XE_HW_ENGINE_TIMESLICE_MAX))
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
> +#else
> +	if (capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(duration,
> +				     XE_HW_ENGINE_TIMESLICE_MIN,
> +				     XE_HW_ENGINE_TIMESLICE_MAX))
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
>  static ssize_t timeslice_duration_show(struct kobject *kobj,
>  				       struct kobj_attribute *attr, char *buf)  {
> @@ -109,8 +317,25 @@ static ssize_t job_timeout_store(struct kobject
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
> +		return -EINVAL;
> +#else
> +	if (capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(timeout,
> +				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> +				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
>  		return -EINVAL;
> +#endif
>=20
>  	WRITE_ONCE(hwe->sched_props.job_timeout_ms, timeout);
>=20
> @@ -128,13 +353,6 @@ static ssize_t job_timeout_show(struct kobject
> *kobj,  static struct kobj_attribute job_timeout_attr =3D
> __ATTR(job_timeout_ms, 0644, job_timeout_show, job_timeout_store);
>=20
> -static const struct attribute *files[] =3D {
> -	&job_timeout_attr.attr,
> -	&timeslice_duration_attr.attr,
> -	&preempt_timeout_attr.attr,
> -	NULL
> -};
> -
>  static ssize_t job_timeout_default(struct kobject *kobj,
>  				   struct kobj_attribute *attr, char *buf)  {
> @@ -143,6 +361,28 @@ static ssize_t job_timeout_default(struct kobject
> *kobj,
>  	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_ms);  }
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
>  static struct kobj_attribute job_timeout_def =3D  __ATTR(job_timeout_ms,
> 0444, job_timeout_default, NULL);
>=20
> @@ -157,6 +397,123 @@ static ssize_t timeslice_default(struct kobject
> *kobj,  static struct kobj_attribute timeslice_duration_def =3D
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
> +#else
> +	if (capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(timeout,
> +				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> +				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
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
> +#else
> +	if (capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(timeout,
> +				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> +				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
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
>  static ssize_t preempt_timeout_default(struct kobject *kobj,
>  				       struct kobj_attribute *attr,
>  				       char *buf)
> @@ -169,10 +526,40 @@ static ssize_t preempt_timeout_default(struct
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
>  static const struct attribute *defaults[] =3D {
>  	&job_timeout_def.attr,
> +	&job_timeout_min_def.attr,
> +	&job_timeout_max_def.attr,
>  	&timeslice_duration_def.attr,
> +	&timeslice_duration_min_def.attr,
> +	&timeslice_duration_max_def.attr,
>  	&preempt_timeout_def.attr,
> +	&preempt_timeout_min_def.attr,
> +	&preempt_timeout_max_def.attr,
>  	NULL
>  };
>=20
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
> index bd94155a28b3..2b053ee0af80 100644
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
> index 7a8d275df6db..d47e34e32a6c 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -107,14 +107,28 @@ struct xe_hw_engine {
>  	void (*irq_handler)(struct xe_hw_engine *, u16);
>  	/** @engine_id: id  for this hw engine */
>  	enum xe_hw_engine_id engine_id;
> -	/** @sched_props: scheduling properties */
> +	/** @sched_props: scheduling properties
> +	 *  @defaults: Default scheduling properties
> +	 */
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
>  };
>=20
> --
> 2.25.1

