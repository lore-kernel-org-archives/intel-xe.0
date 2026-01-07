Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15E3D0D150
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 17:49:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854BB10E13A;
	Wed,  7 Jan 2026 17:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvO4o01c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D9010E13A
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 17:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767808153; x=1799344153;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=za0fzBEpAoixfFiVLCqJzr9gaKFB2mod3InZ7zCFFpI=;
 b=bvO4o01cLGql0RPXbeTuR2UFTlFr+fKJGGvsNSDrq/FcOGzIJ5dTYobG
 ahIX9y/+Od19ay+xPXwpPZLNmQQJZs0hiM9UR208+8D2N7LdqJyw0OMgB
 c8M3AWaKpBpirHFrGb5D+cT4UtysIIhvdg9vHBwjPymJ2/4TamoDZTseU
 XXj1BdzcoSPZGahjhlpyOMHzQdyT2xYBm0rnaEIVCmCL8LOMHdqF6q994
 PKMHZu1DuPEWjGkMfHztROzD7ZDHPdIIuhSbIfB5H8rlQCayrAmoZXEJT
 SK/B+KcoykA3Xmj50x+Q0VMhWzQhe+k71zKwObs6xPLDj0HKYs99pyAAu g==;
X-CSE-ConnectionGUID: fLmLwQv/QjqM1/Thy7gDJg==
X-CSE-MsgGUID: GkNQPJyYS4+qT7oYAHAZGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="86600466"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="86600466"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 09:49:13 -0800
X-CSE-ConnectionGUID: 38E5nJlsRZimXxDQuTTC3Q==
X-CSE-MsgGUID: bDALHP/GTyWUCAH74Qs28w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="203005234"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 09:49:13 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 09:49:12 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 09:49:12 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 09:49:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8gVtXx3l6Mxy/xaCzyueHx0b/OZl1Wq/WB2m1THdK+7ry3BR1iWuhELLKBcL4/QF1M+vU/Li3wvOa1bbptamQSl6hKK26eUmqSbyuKynkUiBhyuhXGukGpVboeXt1Z8yLZzK/g1HVri7rN5z/3QfYdtfXN9QHlx0yuMjGlS5FRw97EL1DWgopUePVBraGsuYv5wUCW21YdupUAFYLk9MllRul0rG6sfKtN8/ovZvKSLmJ8Rjf1GwEtNEDtUBV9VwSjfucNNTk7juTBtSimzE0PCJ33zl2TchOnpW/Kq0e990Y+2EYZWM8E1g7O6vCtQ+TxuwEHla88JXBPdM8GYkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHdstmlCbNahV2zIN9BECHXS7eDwGDFsS5SF7/kDn6I=;
 b=ZcfPCOU/0v20qtkMWpyl/VmFB67aVMzRmOZ3xIhC4/HLLwViudmkVIurLDOr/tIKYj0YtHev7iY6qqcvz6yqxDQIq6csOnc+05Wb4tmtF5zwIYaWKO3mNv7QdVkTJQG7P3CDTCvXrWFmH867d3cxtB9pUGYlIlA50kYm/l1Ji/81FEgCG0IAm/gOor6IrK/m8Aude5TTQ4zbx4F5gQG7C9YM2DF0PYkguaLFNW/6ceOej6otCIcdP96dwsIaf9PJJxyRWOl/B0I1l2WUwQgEy1WOkEWqy9DweLVhKJvjkEYKLHRvb/QisyCsXqOPXRb4HI3tjB5mkuIMUYY2TbphGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS7PR11MB7692.namprd11.prod.outlook.com (2603:10b6:8:ef::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 17:49:04 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 17:49:04 +0000
Date: Wed, 7 Jan 2026 09:49:02 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 4/5] drm/xe/vm: fix xe_vm_validation_exec() kernel-doc
Message-ID: <20260107174902.GS1180203@mdroper-desk1.amr.corp.intel.com>
References: <20260107155401.2379127-1-jani.nikula@intel.com>
 <20260107155401.2379127-4-jani.nikula@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260107155401.2379127-4-jani.nikula@intel.com>
X-ClientProxiedBy: SJ0PR05CA0103.namprd05.prod.outlook.com
 (2603:10b6:a03:334::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS7PR11MB7692:EE_
X-MS-Office365-Filtering-Correlation-Id: 333d60e3-9c0f-4844-4189-08de4e150c70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?umrUqGLrR791VggFFL5B/AQOULNxDTKkLT6v0yPE3r06y2Ivj0bQgOwpn5?=
 =?iso-8859-1?Q?JF1eog2wklN//uNLbz0gxsOU7hU1T1FlD+NJp404EsXHyWHthbdWQ4yZN/?=
 =?iso-8859-1?Q?AV6r1U5IqOwfizdxtQ9FURyLgzQPBFK2Dko7MhW66enkZ01rYnfvOR/S2N?=
 =?iso-8859-1?Q?W9rfT/j8VwP5OX759UFTK6EYRVka/5VvXs3bzvfSuljZjgjSzMrk4ZfPoj?=
 =?iso-8859-1?Q?kyc1Z0mF1rHI2ebx20gPZTH9z+1AGPAuYzOls1b2cIMnEG/MnU1GKzHUjA?=
 =?iso-8859-1?Q?o0pDMhoIESTjyzBI/D/PoGzrWJsVhAT5EUBhvWj+NcemjJHuVPDf5+2G3n?=
 =?iso-8859-1?Q?iF46NuefXl3r3BbgnfzctE9pdiFGbTWxtQt8lcLMlmLyAaMPr+uA8BZsgI?=
 =?iso-8859-1?Q?5f+6tPaT9wEw0pRL1uq3BapJkI3t9cm74rBCHJmanoGr34s7ofmrqlo1ND?=
 =?iso-8859-1?Q?Xj6M/xTrKJxrzgaxQrrXfXXGj7XCnBDpZdxcDW0AOv3dCm3OHoSlh2Olcx?=
 =?iso-8859-1?Q?sJEz7HQjxSsx0qkhIoWsBm7OUKOhpBhY3+86R5uCQeNNDxA45D/p20+/DN?=
 =?iso-8859-1?Q?4P9G609LAZ/0O7KnvmhikyndxW+lg9AqAx6EfVwci1nW2mdzB/NMzkZPzV?=
 =?iso-8859-1?Q?YQRcMqg6k5938lfhzsV2CDdlpQ+l8yVwO1UO58CkCFPQ3zpO1E3YEkpoSg?=
 =?iso-8859-1?Q?/y2cvMtiWpCDfviijG94hvzbyBrasckdefrK2OrSvYAeuNV6At5cDKP4kP?=
 =?iso-8859-1?Q?vCDPPORrI+u/80hCfQV1xt+YI6lKzySMMxgtBkB/8PD95YXd3MKG6Puhu8?=
 =?iso-8859-1?Q?9za8qvwkxG7B0dWFV5DetYGpykt/U31/2HaOO4WpcBd7sKE1HpMypywEg7?=
 =?iso-8859-1?Q?EmeQ4Ow7qOMOnQPBTYl5cB7ZbZtiZK8eP87Cf4HQ2VM+y0G9iQ7+nS2emZ?=
 =?iso-8859-1?Q?mP9vXR9Aun4xPvagF/+d046FGGW8QFC7b0ciu5EXL3FU9gwQQ7brSTPFyG?=
 =?iso-8859-1?Q?FXr2lG8Zzpb3R8nlXzXT+GuAsJyW+BeZGeHxH2BZMudhjoo+4+M9AMBM0o?=
 =?iso-8859-1?Q?ABeW5uJ/xaubTxykLhN86yIMnjVqqYFM6g1YdZrP6NzrFanbFgtmwLVvmC?=
 =?iso-8859-1?Q?HnyEqK5VCOIf7sba6Zg3y4m0enEsttzydvbX3CIIn0/MlpIDPk+T9qJQf+?=
 =?iso-8859-1?Q?j2a5R7cxsdHaDLdVAmgFLiPW8WHAPGWeVecbGkcb6RdKszf0Hht2yOhNAP?=
 =?iso-8859-1?Q?5Hs9XxjNxvMk2Rkb4gZD2lRXMAFioDezS2DIt6+Zxyh/qy8Ezi5GoQtcSa?=
 =?iso-8859-1?Q?uFSdJnj8sOTuwVHZxGxg48qQj2sjOBW/0uevALCF0KEncezeFBoTvklI6Z?=
 =?iso-8859-1?Q?fZXPWaEjHGIHRTnYA6sOfwPmHJbvhOUYtDusK+JQchOEkUI6DuNM1vt5lw?=
 =?iso-8859-1?Q?uOcXaly5LrdnA9sa8N2eyX6RISahLruu1yUadS4Xbb2qdd8/DoyW7ciUE6?=
 =?iso-8859-1?Q?DY8fewEfERZzZzMuzvPJRQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WAS9jpa8Vdl8fczsYHuDkQGzcoJ8SChg278TZD4HB5ZprUSPdGel+jTfK+?=
 =?iso-8859-1?Q?6IheeZAIjD+K7Deuld+OyuxXMEa0Ptg2rNRly010eg9RE79PSKjtTHqTP2?=
 =?iso-8859-1?Q?P4VaENdEOO85BMLMwSJ6MdEyfSELyoP8DDqF8hc+Z+E26e9f2413AkFHXY?=
 =?iso-8859-1?Q?iIsmn5ylFlrlDjhj5RK1m4/y763wKMirC7zHDK5o5xT73A8FBd0L3w+S//?=
 =?iso-8859-1?Q?9jbsPJSU1iFKm5qJ+MTO7EmxaMQucQGQ+O2bLsVcFFezMvNCu+qdbHT7Jy?=
 =?iso-8859-1?Q?GBX2vXcNoYuFlzgB85l6b/9EoASjB2WxfBhTHOzT3jnDxbkyWuikFFQ46O?=
 =?iso-8859-1?Q?6CElyMU9aROAkma11a0x7kg4qFdxh62/9gERUX1wKNukWmJSgvSF2ynh1k?=
 =?iso-8859-1?Q?u4gLjS9JWpIg1xw/s+TopofCd7tPwEl9AIkGF6QpAH3wexgWQWb+15D7Ux?=
 =?iso-8859-1?Q?u2MiwJgOJghkGT90TOBLmWpHb/XnaEksbu7wOjb+DeGLKxBO7olNrL3lk+?=
 =?iso-8859-1?Q?AU6Nop2EJjXn61ad/K3gAKvHj1fQ4FT6rB5rhGmKfrX7VncXVREfClvnS5?=
 =?iso-8859-1?Q?rSrecQ+MM6BLyVzllie7E6C6FPT8bqIL3wQieOLYEaulQL0DWEDr3uypKO?=
 =?iso-8859-1?Q?IXH7/iULhHzH5FpVcroaXS47JZCoWPZ/dRiXn19kKKji1nSEa/h8M9nEXH?=
 =?iso-8859-1?Q?QWNVOMHA/NhOR0o/2fNKmwfiq+xp6CjfBrKk2cqP90MVamZvvXWyBW0yNy?=
 =?iso-8859-1?Q?3Rfiz8uCNf/agTdN84R99/6XAPBD5cxBcusdntIbeyV/BnXs2eGzSuwwIX?=
 =?iso-8859-1?Q?WWQP+RbQyBiyv88s5FXO4FulaKehGZSrIxljb25pkvwGY+8EAeTgablfPC?=
 =?iso-8859-1?Q?sVJIc+g/lqLqMwaqVGd+Zf8uV8B+9LTP8TmxIVHBFn/mVGhWzqH3aX0V9e?=
 =?iso-8859-1?Q?S4GjSkq7rYO6RD3hcMpkEWZEFEn5qEQh9PSOvFx6JtPq4A3RKCESJSa2Kz?=
 =?iso-8859-1?Q?uNrRN/oNMCWto12sCeEq6pX2OT07mDQrAQb+MNbj6cfDI0XqS1t8Vm7bnK?=
 =?iso-8859-1?Q?XKsa4h7sOTnyRW/YcCzBnuZ/N5lW0oAw3IHcwgPmqAT+nsM6O9w1aTH4fO?=
 =?iso-8859-1?Q?FJjssGSruRcbnqGQ+TROutSuJuStIubQWcGLhOltjWHg4cI7+1StbXEeyZ?=
 =?iso-8859-1?Q?2OaPQsbqmcqFGc4Usy07NpnPorVcHbIjtAUpWBzu7Alp9IY5DbPwBzLB9t?=
 =?iso-8859-1?Q?/S43kTygO1pbe+cber9jJIxfaxEd9pTUZ7A3weHoWVRDGtmRIRzg6visml?=
 =?iso-8859-1?Q?tZQLEhs3HyyKuZjJRXnT/EKKnpuhDFBwp2UdtKU/vGZg/5bhrZb3P/IYGr?=
 =?iso-8859-1?Q?EG4OaCzoht7zW+HhUWO23c477ssDHDzAr52LzC5GWz4+ui/g4VIvj3uQJo?=
 =?iso-8859-1?Q?XmQhyDxMYHZ2FaSXYFl4aDnSpkdbVP9PvlPUPokzdNrXDMUnffo8mNm+1W?=
 =?iso-8859-1?Q?nbGQ8FaYAJMma0kZo7QmqKhNOkmzJzFm3luUNl/2ph5Y4LH9d4Xz5YPU4B?=
 =?iso-8859-1?Q?UD2Jo6+a/XuA30kaUYU/L04UUJxIgOfSs0edJ6i0LzrsE+xOwfw4BxS/n3?=
 =?iso-8859-1?Q?CjSDV7GqNnT2xEEjLtPnfQWLpwuglKRPu81XJ8kI6YAEhkWgC4kxVaP5hD?=
 =?iso-8859-1?Q?V50xnIHcUx+WO2LoMaCdvgZVezWNdUfHox4GEqbu8cu2AM+FzLorcmYlld?=
 =?iso-8859-1?Q?+fgowbZt3I8QHqQW27fiisk3AMCC8LU3ZJTDj+/bYkaMvKqyBbEUAzmTcF?=
 =?iso-8859-1?Q?/Oydgvm+257w2IIU7pVOtCJI2mBLwsA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 333d60e3-9c0f-4844-4189-08de4e150c70
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 17:49:04.4861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /faPGT1dmq55ty6Qez03Sgw7zSha/IKb6bGMfC1A8Gk/YkGi3VG4lsWyCCg2V5FozHCAGMORpYYo69brvqN3lALvfTnrafPHYCpHZ2bbbIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7692
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

On Wed, Jan 07, 2026 at 05:54:00PM +0200, Jani Nikula wrote:
> Fix kernel-doc warnings on xe_vm_validation_exec():
> 
> Warning: ../drivers/gpu/drm/xe/xe_vm.h:392 expecting prototype for
>   xe_vm_set_validation_exec(). Prototype was for xe_vm_validation_exec()
>   instead
> 
> Fixes: 0131514f9789 ("drm/xe: Pass down drm_exec context to validation")
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 7d11ca47d73e..6cc98df47291 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -382,7 +382,7 @@ static inline void xe_vm_set_validation_exec(struct xe_vm *vm, struct drm_exec *
>  }
>  
>  /**
> - * xe_vm_set_validation_exec() - Accessor to read the drm_exec object
> + * xe_vm_validation_exec() - Accessor to read the drm_exec object
>   * @vm: The vm we want to register a drm_exec object with.
>   *
>   * Return: The drm_exec object used to lock the vm's resv. The value
> -- 
> 2.47.3
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
