Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8543CD5BAF
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 20:57:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D09C10F407;
	Thu, 21 May 2026 20:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ARsvreOX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA83810F407
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 20:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779397018; x=1810933018;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YCL6jRHMtOwz0mRH9rMDu28lS0QpxUoOaBwT7DJoAQA=;
 b=ARsvreOXndM0U/cT1YsyXc7+NvREDiHjiFI6KSgR6Sso8twlik/XaSQC
 nBv1QfFWa2nNpJcZJ4rol0MkIufC6sLxGx3No6IEYR6asnJAjOuluiN5f
 MxOhF+dccctTIxJAht+owQnvqsJdI0oQ6uqeDt4z4t7DlQGz/6hIdGHpx
 AE2kdaJ8+/rznnpnqnuw3hdA2Pj94kRNX8Xx/EdPs/fOZ0Tr14WAAE4fJ
 a68HLRKSELDohiA+/FwBwEtZbvKSMYyVNogFy2t9lzW+GkL4bUgRoNxyK
 jJCAzk523djxHxpoaTIKoPhX+TWF6Jda1jqIwDyN6/10kUVdN53y1RgND g==;
X-CSE-ConnectionGUID: V/+5V5zMR+WCwHxSKTP+qA==
X-CSE-MsgGUID: JVgSJHkGSxS2Zm9r0/yY6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="91720095"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; d="scan'208";a="91720095"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 13:56:58 -0700
X-CSE-ConnectionGUID: FEw5bSVLSK2sSEw5I8pzYQ==
X-CSE-MsgGUID: TPcWI9GiRU6wEmF65+H34A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; d="scan'208";a="236408065"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 13:56:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 13:56:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 21 May 2026 13:56:57 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 13:56:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sr+4SxbMGn0lE1a79DGqyPYiFGPa7Y5PJS1MlBF0wbqOE4LtbNfbJ3XGGP89Hi+aFAdon2Zbl7ZymxejmaJAmI8Thbwk40IPFJj8NuMfWxDIUZlZiQIwNJPqfv72R17Js6WZDl9sU2UZQU3VyX1HHYrkACzeyx0AV7BA3DzC8ydyDzUEq3FYcrZjgSrosmLEQ6DSLky/9Q5JmYzE8yc3r3xFUsS4WzWoxz53ZxUdMgdulLi5/4iKuqP9hpZ+dsCrT2SaEySVmMAyWHM3TOyLkgcXMm0shAQ1N4Hpc9767uYvE25hz+F8UbYI/XZHJE7WVJJKv8Tj4xm9bMA4c5fFJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhcB2SMFbGApp4dbW3posw903waxfXvvYDg7FSDKeZU=;
 b=CkrgW4eC/Zt2ugD1LTXKNfmORF+FZe+JpeoVIjd4ReiQMeuixfdww95qce8NOQvXjV9iG0ENqOm1y4hPIT3zR/X0P7APTDlnENAbeWJf9YmHOfSxVKbbKuP82x8YD+7t22/7CNmYIv1QJ1B5Rq3YUDCGktaOH30W1CNbQV054EG6oB+o21CGDxNs4qaK2fYMJV1Qa0qkSYll9xSM+f3OIKbz/wU5pa7ZHb+aLV+s33lTeBdYbclukK00QvZ0GX5LSQzkGyYmkrqMdboKJSBf5P9mjlGqUbyhGAhnZha4+wwb9ewkemR6RqUlGH38UG8E7w2EaePHJhi94/s3RcBKSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8284.namprd11.prod.outlook.com (2603:10b6:806:268::21)
 by LV0PR11MB9838.namprd11.prod.outlook.com (2603:10b6:408:384::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 20:56:55 +0000
Received: from SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65]) by SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65%6]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 20:56:54 +0000
Date: Thu, 21 May 2026 13:56:46 -0700
From: Violet Monti <violet.monti@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/4] drm/xe/rtp: Ensure gt_was doesn't evaluate rules
 with engine types
Message-ID: <ag9xjhEf6jJzkFy7@vmonti-desk>
References: <20260519193216.546048-6-violet.monti@intel.com>
 <20260519193216.546048-8-violet.monti@intel.com>
 <87bje8sers.fsf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87bje8sers.fsf@intel.com>
X-ClientProxiedBy: MW4PR04CA0147.namprd04.prod.outlook.com
 (2603:10b6:303:84::32) To SN7PR11MB8284.namprd11.prod.outlook.com
 (2603:10b6:806:268::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8284:EE_|LV0PR11MB9838:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e1a4e3b-3575-40e8-ac4e-08deb77b7d04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|3023799007|6133799003|4143699003|11063799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 6v2ygYYkeg9X0ZARYF2IEwKNJrNkBzwC+X6xrtv6aH2ZqinUIrjBp/x3bNWOvBhyMkz+FjYjvZJbRwBF/AnkpZHTJsTChdOK6r6Y452MiPqa+DlfCOElCPSO4ymnD6b/Qok97EtnR+KOtK4NdmE4CWcRYqG+KF7AK/An6bwfQioBi4Uj1xCzK9ZWRunVEG7YAmT4eLSi9uXzQsl9JMnM4qUlytaN7IrH/mz2DaYre1KyiPU1zWWxD0l+OlbJ8ow5VlPmqBdMZ6vSxnQceYGe1PLBTXLuicytfnxNMZB5uFoa1QyEdnVwbgvWi0Cf2kl79Mgbxmx3hAm3vvIL/l8kwwlJXD04SKsOn5tYpTgSrkUx9zPeJew+2dOEX5mEwqTJPrn+7DtM4T8YcoXBiV9wKmvrldV9DponT3bzMdNkDTkuMxIjowNgASD5ff5gtXjrwyW0qbPo2cFTdsbPKq8LARPTYcdjwHreL3f3Ivljnu+eZmlPQQfrpeQXGnaxW/i5N5jxpSHuo49UZvUXUCecMOz3+yU59opPHAFDlcRZGVJ1MjPIeZo6MVgqdlqoYaOc8grZuIoFD36/86BocwCL23+WcEtU3yBbygwHY2Z0q/5kdujPWWwD6px7/rQgaRZQpGkqqanWApzt0Gpy7ESFn1uuDIy8cE9yypAZtykpHWqL7I7TWVeKrHzN5i/sHJLc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8284.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(3023799007)(6133799003)(4143699003)(11063799006)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Qk1f7hB86ADI8RdcEQFtqigFXotRSw7KRcQ3jRXiTvd3T8rowu42mnZ3MX?=
 =?iso-8859-1?Q?WOYBEAnU1PwsFzE6jEJpXSiB2Yyhxtpz0e9c4Wa42LYHKCqnmAU+DNp0cp?=
 =?iso-8859-1?Q?LLbG6SqHT0x5h8TMJo+AFe1ZYdbxCRfAmRMqKeEKaviAk9zRXROSlQbWm4?=
 =?iso-8859-1?Q?8bUPIVWag3s5HkGYFJvfyzO456zCzU4ddNtwQKfYRssJSZEd5GpDMYR2z3?=
 =?iso-8859-1?Q?s2Cd+nhmgz7s/9r5Z/TG71g3ElbwgovzNo7JYPxgnAO3iDajHEZCtDOE2g?=
 =?iso-8859-1?Q?YO//k6U3yOe40Q2kGVScC+qwxtGqWUlxd+pki03e0uxUEgpti1RtDYwzhD?=
 =?iso-8859-1?Q?CEIO5sqTSHcRSffJKd2iUDdy6OrpU+XxAcnbKWMgEJUDwwMYXv5oi+QHav?=
 =?iso-8859-1?Q?y2u5JjbbbVUsGhLp1OxOoftGm1iAN7zrWiIVRK9yo6jVd8QZolKToZHR5a?=
 =?iso-8859-1?Q?v0yaQMTj/3jMRt7Afxr800K+UhI9J34xRAKCHcOjIAcnxgLcfl3bdnPwY8?=
 =?iso-8859-1?Q?ePbWHHbHqzs6lJReWnq6SRlZpZ3JZbcFlbrfwMlP8I3G3AHTjSGMSCwZ78?=
 =?iso-8859-1?Q?GWjxRtgaZd+PnNiXrNf4IHh2w5PlNWW37mndfPZJF4nTnxzVi63ZYMCuct?=
 =?iso-8859-1?Q?2lWnU9I2GKFB6W9tharjGR+vnHg/3Co1Ax0IhgYG0LCj2glrLHxcVfqGxN?=
 =?iso-8859-1?Q?YExBoY5JqbeYyoYHx4jujSxB7uE4TfqH6p53Ya0wF7arH1JV2Pmt+CtAph?=
 =?iso-8859-1?Q?pmYIHYoulzZ7M+aF4hrp8303KvCAgZMe0FY9+1MCn/c9t61Ux8yV8njbTU?=
 =?iso-8859-1?Q?KNASkHfAN/qUe4p5AlLiDsWqkFKTSl00JR0DdCNohP4IT7L5yG6lYYQBa9?=
 =?iso-8859-1?Q?cMYcICuzjbbsRyosEm/MPjWq2oC/DjyViN4ORzY3MG6R/iWV2HbN5nBGru?=
 =?iso-8859-1?Q?ZrOGxmawqoAtJCIFLhOq+KppYZd+9HR6rNV/V8O+SyPjzVtn4QkE+VMlqq?=
 =?iso-8859-1?Q?t7nSRKW6CApwBLqHEaMh30VMUDxS13aYhLq14wWI8tnAFa/iSVNyLshcI8?=
 =?iso-8859-1?Q?YD61/flVbQzlsmggPLPFLLuyyq6gjHSUkr/215TLFL6pSCK7Bl6b1OVOFk?=
 =?iso-8859-1?Q?O/dCblD6iCAMahBA7bZSRrFSemTPUEH1tkQxygyvoQlRO3tSuIqhtJNPJe?=
 =?iso-8859-1?Q?hnZHbkJ4LjYbyglbm2LF9Cvar1pIUKFmvPvc79QcK490NOykKXPh5S3wU6?=
 =?iso-8859-1?Q?JCvDioUvYmgEQYj9fylKN6Z3jd0wQgAERx9Mx9UHVch00GPws0Utf9UMcp?=
 =?iso-8859-1?Q?k81uQXMgK4gyF5zPo5o8c4ppzRgaRwaalL3tMx12m/y0BV1gHP4X3erYSR?=
 =?iso-8859-1?Q?zB+JPvj1A4IUvWaw+G1M/+hZKrCEO50NmZkk5DpfTl52vonolwHZULycIW?=
 =?iso-8859-1?Q?/jo+5/IX26KZZcEOI/GRy9KYPCXxZqCCAFsb9G8me4/Zj/Kldgqpky0Cwz?=
 =?iso-8859-1?Q?cSbbRVZ2h4uF2HY87kyS8pHUburKf0VpxBijkF8OfqZGwaI9RFIy5r1nQc?=
 =?iso-8859-1?Q?Fcwx9+B+v+pLFgUOdnxC9zG0EMQglzP0sCfVZnW+zrP/N3eFBA+6yyDd24?=
 =?iso-8859-1?Q?lN7M3pKK31LUZ9+a9oggJ9QzphPhDAkV77Ukl2/ZYAWU8glxwgIrwm7ULZ?=
 =?iso-8859-1?Q?mo9z+1HXlEqGZoN1EBOGHM//jAqao14UyTXPIafmGkuZTyvFymiIkBXg0x?=
 =?iso-8859-1?Q?T1K8dP/oK6bKzoB9H/OwZ5F4Siw6qsqwBnQDtSXfgAPViTkvBVq4aExYTl?=
 =?iso-8859-1?Q?Cgqnhjur6g=3D=3D?=
X-Exchange-RoutingPolicyChecked: rTvCH3jRgSoUYVRZcrn8h5Qhc8wGRvZ6MQBmiqgBB7OVI378dcf7sQrQvdhf6WAXjRiKv0fFvAbqSaIgdQtd7Dt5O8RHozi+HYHutHbgzqHtwaEhxVEm7Ny84ohD5Tgy4e1PPmTaPYu5dYd/IqTBKbU2OoGyua6OtM4Gcn5NSvAht0OJsj0K4M61aoN1lk3wGYP6ZgrPi3i3kn9Hnrx9iYtRRvnh71j0ncsqCmVPQBeVOSrjkxiE3WKUd9D8fzhqlaTp9nTyot3rW/rXjDaESUpdrD6F4ZTr0f0foHbA65lRSbjBj/H8+QFv5MA39Olk6T4gxrxSaIpAuM9cxNF8Yw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e1a4e3b-3575-40e8-ac4e-08deb77b7d04
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8284.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 20:56:54.6827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: egU1wWTzY9/4YoLowB3XkDgXvk5OHEXTdLJ/HCj0J/ePCqdUer3YbYOwYCr/qJCHbS+WfnPSC/Xu9rXU8tYLtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9838
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

On Thu, May 21, 2026 at 05:12:39PM -0300, Gustavo Sousa wrote:
> Violet Monti <violet.monti@intel.com> writes:
> 
> > It is currently possible for a RTP rule, and subsequently a workaround,
> > to expect contexts that may not be present when the workaround is
> > applied. For example, the workarounds in the engine_was[] in drm/xe/xe_wa.c
> > expect an engine entity to be active. Conversely, the gt_was[] is not
> > depending on an engine entity to implement its workarounds. This kunit
> > test addition checks the gt_was[] workaround list for any workarounds
> > with XEP_RTP_ENGINE_CLASS() rules. If a workaround does have one of
> > these rules, the workaround is then checked for the "FOREACH_ENGINE" flag,
> > which ensures the workaround is implemented properly.
> >
> > The result of this test is an expectation failure if a workaround has an
> > improper XE_RTP_ENGINE_CLASS() rule setup, and aims to prevent future
> > issues of gt_was workarounds being applied without proper contexts.
> >
> > v2:
> >     - Moved contents of xe_rtp_tables_test.h to .c and removed file
> >     - Renamed macro RTP_KUNIT_ARRAY_PARAM to RTP_TABLE_PARAM
> >     - Removed unnecessary functions and iterative components from
> >       generated _gen_params functions and implemented usage of table
> >       name and WA number as entry name
> >     - Condensed xe_rtp_table_gt_test() to use KUNIT_EXPECT_TRUE with no
> >       message statement
> >     - Removed xe_rtp_table_test_init() and xe_rtp_table_test_exit() as
> >       fake device initialization is not necessary
> >
> > Signed-off-by: Violet Monti <violet.monti@intel.com>
> > ---
> >  drivers/gpu/drm/xe/tests/Makefile             |  1 +
> >  drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c | 55 +++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_wa.c                    |  3 +-
> >  drivers/gpu/drm/xe/xe_wa.h                    |  5 ++
> >  4 files changed, 63 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
> >
> > diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
> > index 0e3408f4952c..f7aa47f11a36 100644
> > --- a/drivers/gpu/drm/xe/tests/Makefile
> > +++ b/drivers/gpu/drm/xe/tests/Makefile
> > @@ -9,5 +9,6 @@ obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_test.o
> >  xe_test-y = xe_test_mod.o \
> >  	xe_args_test.o \
> >  	xe_pci_test.o \
> > +	xe_rtp_tables_test.o \
> >  	xe_rtp_test.o \
> >  	xe_wa_test.o
> > diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
> > new file mode 100644
> > index 000000000000..01d2bc6e8aad
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
> > @@ -0,0 +1,55 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#include <drm/drm_kunit_helpers.h>
> > +
> > +#include "xe_kunit_helpers.h"
> > +#include "xe_pci_test.h"
> > +#include "xe_rtp.h"
> > +#include "xe_wa.h"
> > +
> > +/**
> 
> So, the macro is used only internally and simple enough that I
> personally think we don't need the comment.  But, if you think that will
> be useful, I'm fine with it too (but it does not need to be a
> kernel-doc). 
> 
> > + * RTP_TABLE_PARAM() - Define test parameter generator from a RTP table.
> > + * @table: array of test parameters which includes a n_entries value
> 
> The input is the RTP table, no? And then the function will generate the
> test parameters from the table.
> 
> > + *
> > + * Define function @table_gen_params which uses @table to generate parameters.
> 
> If this were to be processed by the kernel documentation generator, it
> would not find @table_gen_params.  Not sure about what would be the
> alternative here.  Maybe just spell out the CPP syntax here? I.e. Define
> function table##_gen_params().
>

With that added complexity and the fact this is a limited macro for this
file alone, I will leave out the comment. If a maintainer or otherwise
decides it should have an entry in the documentation, I can implement
a similar documentation entry as the KUNIT_ARRAY_PARAM(), which uses the
syntax I was basing this on.

> > + */
> > +#define RTP_TABLE_PARAM(table)						\
> > +	static const void *table##_gen_params(struct kunit *test,				\
> > +					     const void *prev, char *desc)			\
> > +	{											\
> > +		typeof((table.entries)[0]) *__next = prev ?					\
> > +			((typeof(__next))prev) + 1 : (table.entries);				\
> > +		if (__next - table.entries < table.n_entries) {					\
> > +			scnprintf(desc, KUNIT_PARAM_DESC_SIZE, #table "/%s", __next->name);	\
> > +			return __next;								\
> > +		}										\
> > +		return NULL;									\
> > +	}
> > +
> > +static void xe_rtp_table_gt_test(struct kunit *test)
> > +{
> > +	const struct xe_rtp_entry_sr *entry = test->param_value;
> > +
> > +	for (int i = 0; i < entry->n_rules; i++)
> > +		KUNIT_EXPECT_TRUE(test,
> > +				  (entry->rules[i].match_type != XE_RTP_MATCH_ENGINE_CLASS &&
> > +				   entry->rules[i].match_type != XE_RTP_MATCH_NOT_ENGINE_CLASS) ||
> > +				  entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE);
> > +}
> > +
> > +RTP_TABLE_PARAM(gt_was);
> > +
> > +static struct kunit_case xe_rtp_table_tests[] = {
> > +	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, gt_was_gen_params),
> > +	{}
> > +};
> > +
> > +static struct kunit_suite xe_rtp_tables_test_suite = {
> > +	.name = "xe_rtp_tables_test",
> > +	.test_cases = xe_rtp_table_tests,
> > +};
> > +
> > +kunit_test_suite(xe_rtp_tables_test_suite);
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index b9d9fe0801aa..1a1e04215f21 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -130,7 +130,7 @@
> >  __diag_push();
> >  __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
> >  
> > -static const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(
> > +VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(
> >  	/* Workarounds applying over a range of IPs */
> >  
> >  	{ XE_RTP_NAME("14011060649"),
> > @@ -307,6 +307,7 @@ static const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(
> >  	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
> >  	},
> >  );
> > +EXPORT_SYMBOL_IF_KUNIT(gt_was);
> >  
> >  static const struct xe_rtp_table_sr engine_was = XE_RTP_TABLE_SR(
> >  	/* Workarounds applying over a range of IPs */
> > diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> > index a5f7d33c1b32..17dff615e507 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.h
> > +++ b/drivers/gpu/drm/xe/xe_wa.h
> > @@ -6,6 +6,7 @@
> >  #ifndef _XE_WA_H_
> >  #define _XE_WA_H_
> >  
> > +#include <kunit/visibility.h>
> >  #include "xe_assert.h"
> >  
> >  struct drm_printer;
> > @@ -24,6 +25,10 @@ void xe_wa_apply_tile_workarounds(struct xe_tile *tile);
> >  void xe_wa_device_dump(struct xe_device *xe, struct drm_printer *p);
> >  int xe_wa_gt_dump(struct xe_gt *gt, struct drm_printer *p);
> >  
> > +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> > +extern VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was;
> 
> The VISIBLE_IF_KUNIT here is unnecessary and doesn't make much sense:
> that macro is about adding or not the "static" keyword in the
> declaration and should only be part of the variable definition in the .c
> file.
>

Understood. 
--
Violet Monti
> 
> --
> Gustavo Sousa
> 
> > +#endif
> > +
> >  /**
> >   * XE_GT_WA - Out-of-band GT workarounds, to be queried and called as needed.
> >   * @gt__: gt instance
> > -- 
> > 2.43.0

-- 
--
Violet Monti
