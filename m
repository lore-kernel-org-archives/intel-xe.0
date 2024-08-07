Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6F3C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 14:59:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7086610E150;
	Wed,  7 Aug 2024 14:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uiy1QAXX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057E310E150
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 14:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723042778; x=1754578778;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KVRBN4CP9biKuqQLdU4v6nybMQ2qFoh5nkztp1q6VCo=;
 b=Uiy1QAXX7rYvnr9pdbjn/F8oZa6EzBzeL8yMvzInAkq+9YKWBYmBzCqt
 SHkCRVuqTMrZvOJ3B7GD2LLCqXi5kZTEURWW+tno6tU5DlKLnvG01M8un
 W9ElVxOSrG3f+4ghoNaRtiPzu1gEOwX0bTpKR2RUCAsHYyQc+4KtPAhg4
 nraIqi/G5PVIb6ESKhlP3cvw2yUE6RZd9FhmqDVGDWG2ArP7p+7bw5Q7W
 jcMStoJBh257BZtbWevJtg9jdmBpZ5aVJ15BsTkKi4Ts8dqcOIH0JvzrT
 9Q8Nmv21SMXw02HpB058ESUIqx+twgxsyXd+G6lUyHQ6g9uVn2pmCH+Pm Q==;
X-CSE-ConnectionGUID: UcePIGc7QbiUONj+a/Zkuw==
X-CSE-MsgGUID: 4kPVumTQTpSWuyg4cczJrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21237978"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="21237978"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 07:59:38 -0700
X-CSE-ConnectionGUID: NhaoSm9ESM2ef4BQT7O5Jw==
X-CSE-MsgGUID: F9LQd9e+SEiKTLP8PSPvkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="56813907"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 07:59:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 07:59:36 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 07:59:36 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 07:59:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 07:59:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akfWk4zv6GZs70ONgv8SMYj3/xwRP+w3B9k417WFF4VvSRHp1FJ56ebBWgKLc+rDclIrt2eNp7koK7udvZGwcYv8I6I1hyf3pUcbeNc9fSxrKLLBlzf2hnpyhmVc6DKOdn366d7oxon8GTcJ4CYu1WjluMz9KgFNQebkFA9nglsc98rGa+SUDmjov2bEskRNmVz3DLBoB5ZbSaNStuL+4zC4OwZhmav62fcs8FbbwOXvqaasqYSztMF331715BMb1S4W0wNRQia6y2FGYUCCW8g3emcl2lmFuJ24HmeKWZj5ezlIDXSd/4INxlwq2TA/gqka8pKPrUXnSrVAcCOugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPRoHEp2wB0QKcljxnMR+aeBvSRbvKouPSf1UJ3au7s=;
 b=IxEsX2qQ+xDIXrK+GIE66zV0BmG7PYQ2iV5vDExtGSKK60Pdy9SgWrsbg2wq2pNNWEQyGXgsug7nww5S6TM7JloSU663LFtMFRxMSPsiH9iXfL6IL+9CvVCOqZFPURLeI4O0WwQb6vUR97ygkHA22JqAM12Eo6eMdXQHCxBk2f9j82SypSEA17vqKq5WrTTlC7YGBsVghUcBs2NHLgDsUNzEVRjHdORx9zTvsD1EqGO/+HFDEdkBMA2iL/RwB85qpsxy7vnMim1YqNCQ/cNult32+GB3hEIlNYC1cdSdk4GpVIPIojlZbJ2ASWLQ7CwVMItpOedlyNWjwYbNl8+BIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN6PR11MB8196.namprd11.prod.outlook.com (2603:10b6:208:47b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Wed, 7 Aug
 2024 14:59:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 14:59:32 +0000
Date: Wed, 7 Aug 2024 09:59:27 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>,
 <michal.wajdeczko@intel.com>, <karthik.poosa@intel.com>
Subject: Re: [PATCH v6 2/2] drm/xe: remove GuC reload in D3Hot path
Message-ID: <c4hemi6eshos64d6qxfux6wosyktw76thvzbwgvi26rbhbvvgr@3jkem2ozvclg>
References: <20240807134050.2048114-1-riana.tauro@intel.com>
 <20240807134050.2048114-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240807134050.2048114-3-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:303:b7::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN6PR11MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f6b2285-39fc-4beb-0e20-08dcb6f18ba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kJ4pFiT36y7e6WqY+pVOmTgEEh85ABf5U+3dfd6EA3KW37hLjPS7HU/Ulsah?=
 =?us-ascii?Q?DX9YsGROYW77IvKjHH1P3AeCIpEn+WTwRt0F0f9MW4Nyf77zFKfb4Pay05Ob?=
 =?us-ascii?Q?RfyK4KawzsEn6BLhoBYeRb4AqDv40m39cwzQ4CeDYCnBICXKkqbSeBItzDtj?=
 =?us-ascii?Q?EUWd/qKggcVw1vtVNR9+Q+4EWO6IDTU0ouygiZ7q4Ee4jOxHbyg2Um4PxKx/?=
 =?us-ascii?Q?qIkGQyCvgMz1sSxeBcQy7m4SS1ykRAzSqjA/qR2CVtyAroVP5jJ9qgM4r0ek?=
 =?us-ascii?Q?x69JAvgihDPvAnx6AK4iK6KxhtIqa1XnKnLF8raSYoikjcGXDwxG+9Eoe9f0?=
 =?us-ascii?Q?dSgabc2N01qlX3W4rF+SFPNFY+U8PzLh1ajbJOunnTQCaHXvFPJ2Wa1G2oXf?=
 =?us-ascii?Q?qTR3glZeKKXbiPwi1qVIkSrhuQHza75L5Jm7h79YH9pAiLMiDSaQYZOepkvq?=
 =?us-ascii?Q?fwC7fGWMVKLKzs7NMczR7g9wLkBfxao0Lw1xpwzGyVJpKOPzIPRA7CmFwUAl?=
 =?us-ascii?Q?rAm3fFqBDD5BSgz6DHXhDj6URMwUfdSz0jx7WjgWi32dxqCVOHh49SGBqJWc?=
 =?us-ascii?Q?4dTMH0ESHNXRKelKShPUZXtBtmD3XLwujRjOyNolZFcpLTKLptEd2WB3gIZG?=
 =?us-ascii?Q?SZaoAsp4HvbMuvNU8kqbxx9S+awD6iwibOxKRSXeqIIL7mTv8d4Wyv0bgnJx?=
 =?us-ascii?Q?dQXcEqOr+VIcimjJbW/SsxD9Puam04f417vd09s3Je3iz19Oqwnwx3BZz594?=
 =?us-ascii?Q?wLVgSWpF56uOq97Lc9BX4lrSx0Ocu4Yp7GwXK+qyF20xZA9wsn1pLHC7bH7x?=
 =?us-ascii?Q?a59wcCuP+IJSmlhck6o891hXA6LMzIfSieYdK4BMwF1FB+WLRcpUNRTk6d0v?=
 =?us-ascii?Q?pLgB7EKLHoFsKKIy6Zns6zOMFoGVqXHD0b7tkw0qCyDAIa8B7aXqbPIRso9u?=
 =?us-ascii?Q?kBpWmJHFftm4Lw7QNTD3EeXYpJamiXSAcSHvPRtBkF5gIaPKPKBS4q/rtS5F?=
 =?us-ascii?Q?Ucs598ZVDx9UkPmxKJGzEq6calvDG5cal2Y1wjOK9biqrKcm51Q3Y9HNbBb6?=
 =?us-ascii?Q?3udJ/MkdWC10MCuh8SEMa8N7V/1tXsyJuRZmTl7m2DebehIeGd8FHdaidesI?=
 =?us-ascii?Q?xQneGM0eRuqwE/dfgQaedmlpTvP+3NfSSsdK/kpzdwSrwM+qjz06n/DuFH9e?=
 =?us-ascii?Q?OMC5UNjXO2qIox6pybIOp73rlfR87snllj766GvenMNF01mGxASUauT7mSKG?=
 =?us-ascii?Q?oYozYR2O4AJTuVI0U/Wr/S3VHSB77JJGIMtGGvZGAgWhP70ZVAZI3g+4QtO4?=
 =?us-ascii?Q?CfrPunwgD36m9nmZEM/htxPSPwXSVi2mRzQSaGTxZUO0Mw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c6CUD8CA/78ZrrCBLg6mzy+XK5zZtA1k1ZAM9vjCP5OvjZIiI8zDb2Fd4RJV?=
 =?us-ascii?Q?8L8BDVi3O5rviVsv2CDt4QtvMxkpajpSKNqGxbhEYawOtxLIOonxI5typOMB?=
 =?us-ascii?Q?VN6Wusa1yw2nI5RIjybWEU5h1Tfwe2OMgOBQvDOOJEaLlBTiDrq1HEaRdyFg?=
 =?us-ascii?Q?UE1GBk1OyL8lN/cFYL1i/XtVcBg/2cy2HJMhI8kCM7cmFXX9Ao35kzUO5UVA?=
 =?us-ascii?Q?H6VZOvtvQ3P0cKRWFGQJ0bCpYLyOpHMqXnUKZPEvZcW+HaYt1Tsf0S5skYQJ?=
 =?us-ascii?Q?DgmzTsr55/GkKJSMWVtd0jmW8TZQbTmTqvx7J+KZ3xGRC+jj2PQ3Dc7hBNrH?=
 =?us-ascii?Q?kE+/NKDpL+XBMx+FTBIQGHRAhZOhlzkGepqVM3AoyQwPz82MEJXblPVrPoGi?=
 =?us-ascii?Q?lZaCptPnk94hs/iUXpomSQd2F++Cn8OacjLomXn3fAHrYiILHnBdZ4u4IVzs?=
 =?us-ascii?Q?0SpGBYr7jaxFC2MI+HolCvFCNyBSDu8Rz3srxhXZv8FtOU1I3U1xryidiQvJ?=
 =?us-ascii?Q?51NJ+Ay9ZHMdZv5nn0qzqeKQotvYPIqtfJrj5XBInC5D7j2529y4ODc/OaLm?=
 =?us-ascii?Q?fT6JObT4pmgNOD6HdM6lqB4KG39DHc1aJd65R5P1w9hzfxdFVzGqSudvyuZG?=
 =?us-ascii?Q?04ImHL2Jjv/MyTxWBQQ9L14Hs2AAUYud1OKL4yimAoeNrN8wYLk4mQTUFABi?=
 =?us-ascii?Q?FvhSHCQn1Hw+whc5fY9jbWCK9hZ/XtTv/4GA4n5Kazqwczz8CsXXp9XrNv0a?=
 =?us-ascii?Q?TumXh+CchtzBp4hmUlu1MTnB/cwcn1o5POop2XjF2azklwq5lCsuJyZK/ZKY?=
 =?us-ascii?Q?QKLDaLYuIaFvgVvDToY1tvdsL/fQrSustH8EWewlpfPtm/ZcatF01/3J2vnb?=
 =?us-ascii?Q?GUU0h3k3LpaNaZvOAM31lsJY46f+MTBM0xnawazX5czru6L5WKuvhDBO3Bwp?=
 =?us-ascii?Q?Qs2kyUht4Pdgb5sR9ojDehPiw0txHCUJa87az5nlgUhx9qRpf9xCMDLG+qt0?=
 =?us-ascii?Q?cSB09ky0HdgYPIBwPBs+6t9gx0GDswyp2HvBpOD1ZwOfBkbprEd9IlZD/ABD?=
 =?us-ascii?Q?RDaB/oXjbSkdSto1+gPmeWpreZQ3OawtMdLsqSaTzij/dBBnQFo5SnyVgTsJ?=
 =?us-ascii?Q?ZAkmRGUdpeAn+KS6mrFJ95At32QkoN89ZeK2s/Tr+ncXcGQQkRt5iA/1bs31?=
 =?us-ascii?Q?87/YgoA4tFT5v+lF0sF3Wm8Xw7KwnvVMfNaeOFZqufs1YZfr0dlA3qs8FKxO?=
 =?us-ascii?Q?thdZrd6z/UwR+hpcEQzMpY3UGQEUMt6IRk3hpCsd6mQrZgLCuASGmYVVTaea?=
 =?us-ascii?Q?TkAoDUZXKTMH4cjRBKQ12vBD/74gKmpLX6/XW+FjJ4eCm4Fh6o2Un2d/7/+2?=
 =?us-ascii?Q?S74XThzl+IirjQpFi8pKqAx9k2RlGbn69an+2V4LsRLoU5Gphx35KByYTnha?=
 =?us-ascii?Q?kf/gt2L/m29VzV20IJtOyIZ0L61w61XjY1BkKjZyq9dc6FYR7SGH8cLZFRgL?=
 =?us-ascii?Q?8LrfOAouGQiOgbQGEExiw5y+ut44EJe6zSAR9FD1HhMm8RV3n4KrdjaxyHCn?=
 =?us-ascii?Q?h6dBUzh1/+1lrgKWPfBFL0gNirrxUJxDJz+WZtb4OwHdE+0s2ooB9Qugm7wu?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6b2285-39fc-4beb-0e20-08dcb6f18ba5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 14:59:32.7934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LNBIH5j8yYXxa+Bu7E1RsTw4nySR6R16H1GU1kL0vFj+0amBVoxPSp55zvW/+UhNCiV+IXPmK0Jz/O4oaigWXNW4eFwsKzN6wVHjHnKdCgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8196
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

On Wed, Aug 07, 2024 at 07:10:50PM GMT, Riana Tauro wrote:
>Currently GuC is reloaded for both runtime resume and system resume.
>For D3hot <-> D0 transitions no power is lost during suspend so GuC reload
>is not necessary.
>
>Remove GuC reload from D3Hot path and only enable/disable CTB
>communication.
>
>v2: rebase
>
>v3: fix commit message
>    add kernel-doc for gt suspend and resume methods
>    fix comment
>    do not split register and enable calls of CT (Michal)
>
>v4: fix commit message
>    fix comment (Karthik)
>    split patches
>    correct kernel-doc (Rodrigo)
>
>v5: do not expose internal function of CT layer (Michal)
>    remove wait for outstanding g2h as it will be always zero,
>    use assert instead (Matthew Brost)
>    use runtime suspend and runtime resume pair for CT layer
>    (Michal / Matthew Brost)
>
>v6: use xe_gt_WARN_ON instead of xe_gt_assert (Michal)
>    assert and queue handler if g2h head and tail are
>    not equal (Matthew Brost)
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt.c     | 33 +++++++++++++++++++++++++++----
> drivers/gpu/drm/xe/xe_gt.h     |  4 ++--
> drivers/gpu/drm/xe/xe_guc.c    | 30 ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_guc.h    |  2 ++
> drivers/gpu/drm/xe/xe_guc_ct.c | 36 ++++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_guc_ct.h |  3 +++
> drivers/gpu/drm/xe/xe_pm.c     |  8 ++++----
> drivers/gpu/drm/xe/xe_uc.c     | 28 ++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_uc.h     |  2 ++
> 9 files changed, 136 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 58895ed22f6e..e0b13dc7663b 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -831,8 +831,16 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
> 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> }
>
>-int xe_gt_suspend(struct xe_gt *gt)
>+/**
>+ * xe_gt_suspend - GT suspend helper
>+ * @gt: GT object
>+ * @runtime: true if this is from runtime suspend
>+ *
>+ * Return: 0 on success, negative error code otherwise.
>+ */
>+int xe_gt_suspend(struct xe_gt *gt, bool runtime)
> {
>+	struct xe_device *xe = gt_to_xe(gt);
> 	int err;
>
> 	xe_gt_dbg(gt, "suspending\n");
>@@ -842,7 +850,11 @@ int xe_gt_suspend(struct xe_gt *gt)
> 	if (err)
> 		goto err_msg;
>
>-	err = xe_uc_suspend(&gt->uc);
>+	if (runtime && !xe->d3cold.allowed)
>+		err = xe_uc_runtime_suspend(&gt->uc);
>+	else
>+		err = xe_uc_suspend(&gt->uc);
>+
> 	if (err)
> 		goto err_force_wake;
>
>@@ -881,8 +893,16 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
> 	return ret;
> }
>
>-int xe_gt_resume(struct xe_gt *gt)
>+/**
>+ * xe_gt_resume - GT resume helper
>+ * @gt: GT object
>+ * @runtime: true if called on runtime resume

ugh... I find these boolean args way to ugly and error prone. Why can't
the path we are on simply call the 2 functions and we use a composing
style rather than "do this", "and that", "and that other thing", "and
that other too"?  This only leads to dead code in the long run as we
later realize "oh, nobody call this function with false as argument
anymore".  And to hard to use APIs as now the caller ends up with

xe_gt_do_foo(gt, true, false, true, true) without any indication of what
those things are for the caller.

A less ugly alternative (but IMO still not ideal) is to use the
"flags approach", since then at least the caller is passing something
understandable rather than true/false.  But I think we should usually
use 2 separate functions and call them where appropriate.

Lucas De Marchi


>+ *
>+ * Return: 0 on success, negative error code otherwise.
>+ */
>+int xe_gt_resume(struct xe_gt *gt, bool runtime)
> {
>+	struct xe_device *xe = gt_to_xe(gt);
> 	int err;
>
> 	xe_gt_dbg(gt, "resuming\n");
>@@ -890,7 +910,12 @@ int xe_gt_resume(struct xe_gt *gt)
> 	if (err)
> 		goto err_msg;
>
>-	err = do_gt_restart(gt);
>+	/* GuC is still alive at D3hot, no need to reload it */
>+	if (runtime && !xe->d3cold.allowed)
>+		xe_uc_runtime_resume(&gt->uc);
>+	else
>+		err = do_gt_restart(gt);
>+
> 	if (err)
> 		goto err_force_wake;
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>index 8b1a5027dcf2..21f27ca23b67 100644
>--- a/drivers/gpu/drm/xe/xe_gt.h
>+++ b/drivers/gpu/drm/xe/xe_gt.h
>@@ -53,8 +53,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
> void xe_gt_record_user_engines(struct xe_gt *gt);
>
> void xe_gt_suspend_prepare(struct xe_gt *gt);
>-int xe_gt_suspend(struct xe_gt *gt);
>-int xe_gt_resume(struct xe_gt *gt);
>+int xe_gt_suspend(struct xe_gt *gt, bool runtime);
>+int xe_gt_resume(struct xe_gt *gt, bool runtime);
> void xe_gt_reset_async(struct xe_gt *gt);
> void xe_gt_sanitize(struct xe_gt *gt);
> int xe_gt_sanitize_freq(struct xe_gt *gt);
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 85b88532e23f..6758b02dad58 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -883,6 +883,8 @@ int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb)
> 		err = xe_guc_ct_enable(&guc->ct);
> 		if (err)
> 			return err;
>+	} else {
>+		xe_guc_ct_runtime_resume(&guc->ct);
> 	}
>
> 	guc_handle_mmio_msg(guc);
>@@ -1112,6 +1114,34 @@ void xe_guc_sanitize(struct xe_guc *guc)
> 	guc->submission_state.enabled = false;
> }
>
>+/**
>+ * xe_guc_runtime_suspend - GuC runtime suspend
>+ * @guc: GuC object
>+ *
>+ * Return: 0 on success, negative error code otherwise.
>+ */
>+int xe_guc_runtime_suspend(struct xe_guc *guc)
>+{
>+	return xe_guc_ct_runtime_suspend(&guc->ct);
>+}
>+
>+/**
>+ * xe_guc_runtime_resume - GuC runtime resume
>+ * @guc: GuC object
>+ *
>+ * This function enables GuC CTB communication
>+ */
>+void xe_guc_runtime_resume(struct xe_guc *guc)
>+{
>+	/*
>+	 * Power is not lost when in D3Hot state,
>+	 * hence it is not necessary to reload GuC
>+	 * everytime. Only enable interrupts and
>+	 * CTB communication during resume
>+	 */
>+	xe_guc_enable_communication(guc, false);
>+}
>+
> int xe_guc_reset_prepare(struct xe_guc *guc)
> {
> 	return xe_guc_submit_reset_prepare(guc);
>diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>index 5fcf6f6ef964..56359047d185 100644
>--- a/drivers/gpu/drm/xe/xe_guc.h
>+++ b/drivers/gpu/drm/xe/xe_guc.h
>@@ -32,6 +32,8 @@ int xe_guc_upload(struct xe_guc *guc);
> int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
> int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb);
> int xe_guc_suspend(struct xe_guc *guc);
>+int xe_guc_runtime_suspend(struct xe_guc *guc);
>+void xe_guc_runtime_resume(struct xe_guc *guc);
> void xe_guc_notify(struct xe_guc *guc);
> int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>index beeeb120d1fc..41bdb9437634 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ct.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>@@ -419,6 +419,42 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> 	return err;
> }
>
>+/**
>+ * xe_guc_ct_runtime_resume- GuC CT runtime resume
>+ * @ct: the &xe_guc_ct
>+ *
>+ * Mark GuC CT as enabled on runtime resume
>+ */
>+void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct)
>+{
>+	struct guc_ctb *g2h = &ct->ctbs.g2h;
>+
>+	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
>+
>+	/* Assert if g2h head and tail are unequal and queue g2h handler */
>+	if (xe_gt_WARN_ON(ct_to_gt(ct), desc_read(ct_to_xe(ct), g2h, tail) != g2h->info.head))
>+		queue_work(ct->g2h_wq, &ct->g2h_worker);
>+}
>+
>+/**
>+ * xe_guc_ct_runtime_suspend- GuC CT runtime suspend
>+ * @ct: the &xe_guc_ct
>+ *
>+ * Mark GuC CT as disabled on runtime suspend
>+ *
>+ * Return: 0 on success, negative error code otherwise
>+ */
>+int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
>+{
>+	/* Assert if there are any outstanding g2h and abort suspend */
>+	if (xe_gt_WARN_ON(ct_to_gt(ct), ct->g2h_outstanding))
>+		return -EBUSY;
>+
>+	xe_guc_ct_disable(ct);
>+
>+	return 0;
>+}
>+
> static void stop_g2h_handler(struct xe_guc_ct *ct)
> {
> 	cancel_work_sync(&ct->g2h_worker);
>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>index 190202fce2d0..0cf9d77feb35 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ct.h
>+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>@@ -16,6 +16,9 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct);
> void xe_guc_ct_stop(struct xe_guc_ct *ct);
> void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>
>+void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
>+int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
>+
> struct xe_guc_ct_snapshot *
> xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
> void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>index 9f3c14fd9f33..c73a728a7450 100644
>--- a/drivers/gpu/drm/xe/xe_pm.c
>+++ b/drivers/gpu/drm/xe/xe_pm.c
>@@ -101,7 +101,7 @@ int xe_pm_suspend(struct xe_device *xe)
> 	xe_display_pm_suspend(xe, false);
>
> 	for_each_gt(gt, xe, id) {
>-		err = xe_gt_suspend(gt);
>+		err = xe_gt_suspend(gt, false);
> 		if (err) {
> 			xe_display_pm_resume(xe, false);
> 			goto err;
>@@ -157,7 +157,7 @@ int xe_pm_resume(struct xe_device *xe)
> 	xe_display_pm_resume(xe, false);
>
> 	for_each_gt(gt, xe, id)
>-		xe_gt_resume(gt);
>+		xe_gt_resume(gt, false);
>
> 	err = xe_bo_restore_user(xe);
> 	if (err)
>@@ -374,7 +374,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> 	}
>
> 	for_each_gt(gt, xe, id) {
>-		err = xe_gt_suspend(gt);
>+		err = xe_gt_suspend(gt, true);
> 		if (err)
> 			goto out;
> 	}
>@@ -428,7 +428,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> 	xe_irq_resume(xe);
>
> 	for_each_gt(gt, xe, id)
>-		xe_gt_resume(gt);
>+		xe_gt_resume(gt, true);
>
> 	if (xe->d3cold.allowed) {
> 		xe_display_pm_resume(xe, true);
>diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>index fa98e9f22631..8e535153cc62 100644
>--- a/drivers/gpu/drm/xe/xe_uc.c
>+++ b/drivers/gpu/drm/xe/xe_uc.c
>@@ -288,6 +288,34 @@ int xe_uc_suspend(struct xe_uc *uc)
> 	return xe_guc_suspend(&uc->guc);
> }
>
>+/**
>+ * xe_uc_runtime_suspend - uC runtime suspend
>+ * @uc: uC object
>+ *
>+ * Return: 0 on success, negative error code otherwise
>+ */
>+int xe_uc_runtime_suspend(struct xe_uc *uc)
>+{
>+	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>+		return 0;
>+
>+	return xe_guc_runtime_suspend(&uc->guc);
>+}
>+
>+/**
>+ * xe_uc_runtime_resume - uC runtime resume
>+ * @uc: uC object
>+ *
>+ * Called while resuming from D3Hot
>+ */
>+void xe_uc_runtime_resume(struct xe_uc *uc)
>+{
>+	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>+		return;
>+
>+	xe_guc_runtime_resume(&uc->guc);
>+}
>+
> /**
>  * xe_uc_remove() - Clean up the UC structures before driver removal
>  * @uc: the UC object
>diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>index 506517c11333..1e223d67086a 100644
>--- a/drivers/gpu/drm/xe/xe_uc.h
>+++ b/drivers/gpu/drm/xe/xe_uc.h
>@@ -15,6 +15,8 @@ int xe_uc_init_hw(struct xe_uc *uc);
> int xe_uc_fini_hw(struct xe_uc *uc);
> void xe_uc_gucrc_disable(struct xe_uc *uc);
> int xe_uc_reset_prepare(struct xe_uc *uc);
>+int xe_uc_runtime_suspend(struct xe_uc *uc);
>+void xe_uc_runtime_resume(struct xe_uc *uc);
> void xe_uc_stop_prepare(struct xe_uc *uc);
> void xe_uc_stop(struct xe_uc *uc);
> int xe_uc_start(struct xe_uc *uc);
>-- 
>2.40.0
>
