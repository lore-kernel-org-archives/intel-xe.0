Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AF5C43327
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 15:12:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749DE10E9B4;
	Tue, 30 Jun 2026 15:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mD6qgCoq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B906310EA76
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 15:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782832369; x=1814368369;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=wZFkLy3BpTu8itx+vNxw6TmGy7Z4XHrjYqYgQm85MdA=;
 b=mD6qgCoqD/3lpo348jBs/cwjyIovL3ygkhPnPNSmPbiFZm4xVa8Tu58S
 6vFoowtZFUv4dc2c128ylPPgSoP1UfWXf5NV+ayanhCStNPh720GCLeuM
 NIs7gKAfjIyxQDzAWBtkI17/fxNL6v5CzaRVPjwqad88VXqWFRzQEfVjJ
 +Y4W3oe6F9fFncHtfwywmfxgZIkUikvNmeq2804MgUOLR7pLo/wwIfsS+
 K/kDZvnGJv4MuOsf4mjuCAfZA1op2d2/icnAmAG/tTHYa2ubRKP4XSb4+
 M5cY1RlS3d4pjpRI/3s5ydofngMlTaeBs+3lUscCErJaiPyMKf/+UZJHW Q==;
X-CSE-ConnectionGUID: elJlM/PaQ5+5AMuTN6Ygxg==
X-CSE-MsgGUID: oXGwy1cPSVux5xsatC3VUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="94699234"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="94699234"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 08:12:34 -0700
X-CSE-ConnectionGUID: /mo0cwwfTpme8w04SUA9dg==
X-CSE-MsgGUID: 5RytS67mRea1tztYRT5FHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="245947013"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 08:12:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 08:12:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 30 Jun 2026 08:12:32 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 08:12:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTYKxH9tUZgU8SOb9bJrGD0osvjs9v3AMOJwlbX9lrw2PvaC3BmWNkE3VjMD6X2Xn8IYetFUSGaRgrA33SEdCX0CEXy8zncg44GYnCX8N5Z57pMvkHgWYfxg8sCqIECmvJlK5jN/VjUbXp9YCuuVcVksYIQmi0RsoN6WBA6X3P2PxlClTD0+dhR1SkCR7jnA2Io4XHCV+h2rqPJNRhuJV3X5f7+1UuP4Te7/3Di7UXAD4Or0ZSu5uUvxJdIh8TUXF7EziQiivZDLbM606htTBd1NXnN6NGDKHf84dUnWWV+/s5CQCdi61H7NlLSZ8jOU7+k0uC3Bi6PQgQf6V8pzbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bBbqlOzhh6euytnHBR+1giwtrLdGtjPB3l2n6LOb90=;
 b=yQls+DvdJ8ZAhpSguCa0PMBoyJLnnDAxrYi6JsqbRx/c6anuP9sfSWhuzlcc6yW4D+hLQkfG64XMu7EHdBhbKj0Llf534ARAmTpU7gCsMJaeGNJvYaC7AcwnnPtCvXWQB8+rq/1skSFwTTGQqC3qovEnuF2jx0Edkkgxfu2r+JbnC0UGaGLfmT27fZ2aOCUEBhYKft7tJD5ra+xZJopgPzdgazNSioM95eaLFAAa4/nsCzojCtOgJckiQkPsoeo4VJp+s1g7m38VnUtJJ375ICSJxWuBtzj9O71PJZLz8Cfq65CXQNLFgb9f7/JeHsmqF5bjdLOR6O3bpUjAtnGj3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6908.namprd11.prod.outlook.com (2603:10b6:510:204::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Tue, 30 Jun
 2026 15:12:27 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 15:12:27 +0000
Date: Tue, 30 Jun 2026 08:12:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZVTEw6IHN1Y2Nl?=
 =?utf-8?Q?ss_for_drm=2Fxe=2Ftests=2Frtp?= =?utf-8?Q?=3A?= Add kunit test for
 whitelist upper bounds (rev3)
Message-ID: <20260630151224.GS6214@mdroper-desk1.amr.corp.intel.com>
References: <20260626-kunit_whitelist_bounds-v3-1-aedf0b3adab9@intel.com>
 <178277831090.130542.16568433104662864477@6beec6c84f66>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <178277831090.130542.16568433104662864477@6beec6c84f66>
X-ClientProxiedBy: SJ0PR13CA0224.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6908:EE_
X-MS-Office365-Filtering-Correlation-Id: 454aa5e7-a8b3-478a-77a4-08ded6b9ff0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: mIPSbEgdWB4dRLEYjhfivK64pq/emlxSGp8CViU75p8nBjCoUB0xEL2zRB2Do9LON38URi+x1BfF54OSDNcFY7/MGrKbk/hWuYACkqwdIxTtHWhPuQDBcvNI0vVGWGkK2L2d9y7EKIaebTXXmWwo/z1boLPTQLU7RNGE3WVwU3mv0lTipxjPXZQQ5IqNCBfe085MM1BlWzHfGH3BBCstTZzGzW2TlHOsC4rETxNXKnoS0Ys11zWsWxhGyd3rp/jD2iUFW8ruke33OsfLI/xOH1vW/lQR9gS0KyMMeOymzvkvi/Fh4EsnznslogD0LT+ngRsKxO2AqkBmVtf0QocV76K1183smCHbYTu0SgKbi9Av20ljCHfG9sVPfTlmiU1e10LTli9SUBHVcfnjW9ypIYsTF5hEQC36A+4e46RxFKfdwiaBXN20WCSFU1aDpnrynmR7pSy0621Lb6uE74ymH8BMLec8eRUsAKiDVaSrxfAY/0ZKiQvbgRhlWA83AhHiQ6rjNOcQL871yAuc/wn71KUmKPVo6Ty0skDDfraw923JVhqoSXAh0TbipAbELLzz9Kio/oCs7kQNFui/hJCrgUqptOxRjlHRzOO97mDWtHo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HqocDpKGAbLT0Z5zbedj3ltTYH8H2uFjG/CPAuEzm2p8sHgz9jzNQAzzEPiT?=
 =?us-ascii?Q?Vc+kr72THsg2c+fsWfT5BiPyUr5qf9usRAWlCEQMIawVBFk6CTPM+xfCWgfL?=
 =?us-ascii?Q?hTp7YwOBGBPGpR1q7cGSL2jk9srcP02nhGLlej6XBkFojYtd9zYMzPUDhZOc?=
 =?us-ascii?Q?Ac7cW6GplfDWGBPSxbSoX/F191FhyUu6nMU8U1OTjf4GAqg847JMkqcXXSjr?=
 =?us-ascii?Q?DbO+UWIIyXgX9MdMg2EtboJA8oAqeV1I02/jkHCY4goayEjyUm5t177i6CE+?=
 =?us-ascii?Q?nKb6Q4GSXYjmdt7KyqI+17+IOtDuBbyKuGdQx/XbT/SLn7gUjXHt0NOmFrvJ?=
 =?us-ascii?Q?jff1F9tbYpkvOknUSYR9p0JsUSZlfeERvEfHc10o9qyj80Yh/bI1vaAqM8Oh?=
 =?us-ascii?Q?18cCcc3jXbrKVhl3Yo5yKEj17wbYgTrCVjNJkzUJkJYuY1+lkU4IvkACrtXW?=
 =?us-ascii?Q?JJJAJC6oluvsOaqPQBsRe1LKNidX1vA2Lx72Oh8/O9JrHJ0+Rzkb0QeWlaDl?=
 =?us-ascii?Q?bxgU72cpXXqE18zTL/4V9A+YILhp/2EKsqrzMXyF6UshrsHcQIUckNt+LZT7?=
 =?us-ascii?Q?yH1Fqr/5lV5vMj52C7KgYqb/JbLtPkblFFTdzP3gWw9ftVCcrUidjUTPfBWo?=
 =?us-ascii?Q?/SvAMqQkZf96xlFXEpVBFgAjMLP9Av9PgT4z7AAb4NfJLWiRCFfrQJa508Ul?=
 =?us-ascii?Q?5A0L/8S2l8mT3fyzRlw9jJTNNBH5JzxkcdiINCVBtn+TnN7SWPnVogsCJDlL?=
 =?us-ascii?Q?BBCv06OytmRobQE+fUcU95atmEL5UKjjPTKANpBwJ/eKwRxxpajhmHJsNanU?=
 =?us-ascii?Q?3HGHXrZE4Rj77d1vXAv/EomMj708NB0oF20wacrkTpNOkZflPJiCV/tAj+Mw?=
 =?us-ascii?Q?UTxsdmDcXMNeRcgMBFONL/t37ejzlsZH5Ty1+bHFo8oEvE4VfQh/DgsX2Uau?=
 =?us-ascii?Q?fncm8zC6zeRWTyAy5eAnz55kWy6xYnD8rP8HOiZcDQ7iwgCWFSO9thFFmkMn?=
 =?us-ascii?Q?L6DWjWKuGFe5VdJJAtWg+QG+aVMzN2e08dQjtwxE8sFFpNavutF3Uj/T/WEU?=
 =?us-ascii?Q?4sF1fD5ogqhCnE2a9a+FnUI+x4Yb+WJD30Kj0dgANYOlgZUa+75ngK+egf71?=
 =?us-ascii?Q?MsIO4oldnuCgBfGEvILqmLcrWx0YRrzgvwQWtRve/cq6TcbkQW5MH+tWlA+a?=
 =?us-ascii?Q?z4fhpYc55eBadItAwlQD43sJLUBIeuMGka472S1XrRsg7b871KcdiEn6CYA8?=
 =?us-ascii?Q?RsVPQH+Wz1NlrWO2l8ZHSSPrvD6rmfYCvCDOL+K5mJiND1P6DgRLB8hAfkwz?=
 =?us-ascii?Q?FeP+YwNSZl/M69Vuscsdimd8bpOJ8H+7ukgCJooepiwyF6tmWNgdbAKCCFjk?=
 =?us-ascii?Q?b7FAlrkP3wdxMemMBZHIiLH2XVkDxn78k2Wvdj550ZZ3niExAKOD6H1EXT+L?=
 =?us-ascii?Q?6eLeRjLCCVBbGpsyKvzA87SbGhnDCX0TLW1+z+YVNAItShr/NzC61QWiltxT?=
 =?us-ascii?Q?xH8kX5To9zHZ6BnCl76Di6RGkTD9EAAdhQESTF8Ooj/DiacNAFdHsSUblAvw?=
 =?us-ascii?Q?kuQMLllKjWKq117XZ3MjUXChcEfFngNRKeHPKRGM8shhZQ8NEbFvtejEbgtQ?=
 =?us-ascii?Q?OByvWjVMQDzTGvK+gjkZq1v3gZnIZV/p7hD+C9/ILm4NTMr2BtNuTErqGW8z?=
 =?us-ascii?Q?12bNvZk4pGSjb9dPHYmRzwEBIWMXXICpgInOj3xry3Vg0wMdl8Hfv1RRuJO5?=
 =?us-ascii?Q?cE+e65gKlH6zXUFoYohBm8Q4QEQCvc4=3D?=
X-Exchange-RoutingPolicyChecked: N+ObP3wxCX0aEh7IGliZ5DfkQvjXjEZK1P88csiKvW+5ZV8HJjVJivQGYSvkor8Dj2Fi/CMjDrRBP5YI+HZ2uY0DcYfg8+3aC9YCcp3FfVONaWZrpXuk5B8Ddb205gTvhwR4g7WzfUNjG2S1/3y+8ssnE1w1t+Y/LumlfbMp0t2rwXfUljpSNzssAPJR+5LnAvDD0O4dJX282azlee7+Y0tOHetqmAoXdiouGd8fFsksXGOT8qFJ2uk8zA4p2g0ZQ0kbzCM5ShkR07PfX+p9OV7kStiIh8reK8KdBWfZoAvr98PP0hhPOKUXYrPENUtImlg0IM/gXkRAx3CDiXGg3g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 454aa5e7-a8b3-478a-77a4-08ded6b9ff0e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 15:12:27.3566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6LPvT5DgMaxe258BebMBwq5cc3J8lzZvu4rVBal8dk17kmLAP41k6xu3cYlwW6PrZT8dHjk+qga2lQVybF4eT3kxqF+UnbBmeDFRJb1tQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6908
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

On Tue, Jun 30, 2026 at 12:11:50AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/tests/rtp: Add kunit test for whitelist upper bounds (rev3)
> URL   : https://patchwork.freedesktop.org/series/169229/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-5305-78c0a355e0dd70f31dba684bd172813fad9d79d2_FULL -> xe-pw-169229v3_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks Gustavo for the review.



Matt

> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-169229v3_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][1] ([Intel XE#1407])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2327]) +2 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#607] / [Intel XE#7361])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1124]) +4 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#1124]) +2 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:
>     - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#7679])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#8365])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#367]) +1 other test skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-9/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#2887]) +4 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +10 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-9/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#3432])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#4417] / [Intel XE#5447]) +3 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html
> 
>   * igt@kms_chamelium_audio@dp-audio:
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#373]) +2 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_chamelium_audio@dp-audio.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#306] / [Intel XE#7358])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#7358])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-9/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#7358])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_chamelium_color_pipeline@plane-lut1d.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-fast:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2252]) +4 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@kms_chamelium_frames@hdmi-crc-fast.html
> 
>   * igt@kms_content_protection@legacy-hdcp14:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#7642]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_content_protection@legacy-hdcp14.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2321] / [Intel XE#7355])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1424]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-128x42:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2320])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-128x42.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#8265]) +2 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#4422] / [Intel XE#7442])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#703] / [Intel XE#7448])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check:
>     - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1421]) +2 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_flip@2x-plain-flip-ts-check.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-dp2:
>     - shard-bmg:          [PASS][26] -> [FAIL][27] ([Intel XE#3321]) +1 other test fail
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5305-78c0a355e0dd70f31dba684bd172813fad9d79d2/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-10/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          [PASS][28] -> [FAIL][29] ([Intel XE#301] / [Intel XE#3149])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5305-78c0a355e0dd70f31dba684bd172813fad9d79d2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#7178] / [Intel XE#7351]) +3 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#7179])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1397] / [Intel XE#7385])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#7178] / [Intel XE#7351])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#656] / [Intel XE#7905]) +15 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#7061]) +2 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#4141]) +8 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#6312] / [Intel XE#651]) +3 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-move:
>     - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#6312]) +5 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2311]) +27 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#7905]) +14 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2313]) +27 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#7865]) +10 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#7061]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1470] / [Intel XE#2853])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#1503])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5305-78c0a355e0dd70f31dba684bd172813fad9d79d2/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-10/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_joiner@basic-max-non-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#4298] / [Intel XE#5873])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-9/igt@kms_joiner@basic-max-non-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#6911] / [Intel XE#7466])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#8303]) +1 other test skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#7283]) +1 other test skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#7283])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#8076])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html
> 
>   * igt@kms_plane_lowres@tiling-none:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][56] ([Intel XE#8367])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-4/igt@kms_plane_lowres@tiling-none.html
> 
>   * igt@kms_plane_lowres@tiling-none@pipe-a-dp-2:
>     - shard-bmg:          [PASS][57] -> [INCOMPLETE][58] ([Intel XE#8367])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5305-78c0a355e0dd70f31dba684bd172813fad9d79d2/shard-bmg-7/igt@kms_plane_lowres@tiling-none@pipe-a-dp-2.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-4/igt@kms_plane_lowres@tiling-none@pipe-a-dp-2.html
> 
>   * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#599] / [Intel XE#7382]) +3 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:
>     - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#2763] / [Intel XE#6886]) +7 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation@pr:
>     - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#8395]) +1 other test skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_pm_dc@dc3co-vpb-simulation@pr.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation@psr2:
>     - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#8396])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_pm_dc@dc3co-vpb-simulation@psr2.html
> 
>   * igt@kms_pm_rpm@package-g7:
>     - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#6813])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_pm_rpm@package-g7.html
> 
>   * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>     - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#2893] / [Intel XE#7304]) +1 other test skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#1489]) +3 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr@fbc-pr-sprite-render:
>     - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1406]) +1 other test skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_psr@fbc-pr-sprite-render.html
> 
>   * igt@kms_psr@fbc-psr-primary-page-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-6/igt@kms_psr@fbc-psr-primary-page-flip.html
> 
>   * igt@kms_psr@fbc-psr2-no-drrs:
>     - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1406] / [Intel XE#7345])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_psr@fbc-psr2-no-drrs.html
> 
>   * igt@kms_psr@fbc-psr2-no-drrs@edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1406] / [Intel XE#4609])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_psr@fbc-psr2-no-drrs@edp-1.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#3904] / [Intel XE#7342])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_setmode@invalid-clone-exclusive-crtc:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#1435])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html
> 
>   * igt@kms_sharpness_filter@filter-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#6503])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-6/igt@kms_sharpness_filter@filter-basic.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#362] / [Intel XE#5848])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2509] / [Intel XE#7437])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vrr@lobf-dc3co:
>     - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#8397])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@kms_vrr@lobf-dc3co.html
> 
>   * igt@xe_eudebug@discovery-empty:
>     - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#7636]) +3 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@xe_eudebug@discovery-empty.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
>     - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#6540] / [Intel XE#688]) +3 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html
> 
>   * igt@xe_evict@evict-small-external-multi-queue-cm:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#8370])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@xe_evict@evict-small-external-multi-queue-cm.html
> 
>   * igt@xe_exec_balancer@no-exec-parallel-userptr-invalidate-race:
>     - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#7482]) +9 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@xe_exec_balancer@no-exec-parallel-userptr-invalidate-race.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1392]) +4 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2322] / [Intel XE#7372]) +3 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-imm:
>     - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#8374]) +2 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue:
>     - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#8374]) +5 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@xe_exec_fault_mode@twice-multi-queue.html
> 
>   * igt@xe_exec_multi_queue@few-execs-preempt-mode-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#8364]) +11 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@xe_exec_multi_queue@few-execs-preempt-mode-basic.html
> 
>   * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-priority:
>     - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#8364]) +10 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-priority.html
> 
>   * igt@xe_exec_reset@multi-queue-cancel:
>     - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#8369]) +1 other test skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-9/igt@xe_exec_reset@multi-queue-cancel.html
> 
>   * igt@xe_exec_sip_eudebug@breakpoint-writesip:
>     - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#7636]) +8 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#8378]) +4 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-basic.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#8378]) +2 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
>     - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#2229]) +1 other test skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
> 
>   * igt@xe_multigpu_svm@mgpu-atomic-op-conflict:
>     - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#6964]) +1 other test skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html
> 
>   * igt@xe_non_msix@walker-interrupt-notification-non-msix:
>     - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#7622])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@xe_non_msix@walker-interrupt-notification-non-msix.html
> 
>   * igt@xe_page_reclaim@pde-vs-pd:
>     - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#7793]) +1 other test skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-6/igt@xe_page_reclaim@pde-vs-pd.html
> 
>   * igt@xe_pat@pat-sw-hw-reset-compare:
>     - shard-lnl:          NOTRUN -> [FAIL][94] ([Intel XE#7695])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@xe_pat@pat-sw-hw-reset-compare.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1061] / [Intel XE#7326] / [Intel XE#7353])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@xe_peer2peer@write.html
> 
>   * igt@xe_pm@d3cold-mmap-vram:
>     - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@xe_pm@d3cold-mmap-vram.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2284] / [Intel XE#7370])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-6/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-multiple-execs:
>     - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#584] / [Intel XE#7369])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@xe_pm@s3-multiple-execs.html
> 
>   * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
>     - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#4733] / [Intel XE#7417])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
> 
>   * igt@xe_query@multigpu-query-engines:
>     - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#944])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@xe_query@multigpu-query-engines.html
> 
>   * igt@xe_query@multigpu-query-topology-l3-bank-mask:
>     - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#944])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
> 
>   * igt@xe_sriov_admin@sched-priority-write-readback-vfs-disabled:
>     - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#7174])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@xe_sriov_admin@sched-priority-write-readback-vfs-disabled.html
> 
>   * igt@xe_sriov_flr@flr-twice:
>     - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#4273])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@xe_sriov_flr@flr-twice.html
> 
>   * igt@xe_sriov_vram@vf-access-after-resize-down:
>     - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#6376] / [Intel XE#7330] / [Intel XE#7422])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@xe_sriov_vram@vf-access-after-resize-down.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][105] ([Intel XE#5545])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>     - shard-lnl:          [FAIL][106] ([Intel XE#301]) -> [PASS][107] +1 other test pass
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5305-78c0a355e0dd70f31dba684bd172813fad9d79d2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute:
>     - shard-bmg:          [ABORT][108] ([Intel XE#7893] / [Intel XE#8300]) -> [PASS][109] +1 other test pass
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5305-78c0a355e0dd70f31dba684bd172813fad9d79d2/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-9/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [INCOMPLETE][110] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][111]
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5305-78c0a355e0dd70f31dba684bd172813fad9d79d2/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_intel_bb@blit-reloc:
>     - shard-lnl:          [ABORT][112] ([Intel XE#8007]) -> [PASS][113]
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5305-78c0a355e0dd70f31dba684bd172813fad9d79d2/shard-lnl-5/igt@xe_intel_bb@blit-reloc.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-6/igt@xe_intel_bb@blit-reloc.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-bmg:          [ABORT][114] ([Intel XE#8007]) -> [PASS][115] +1 other test pass
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5305-78c0a355e0dd70f31dba684bd172813fad9d79d2/shard-bmg-4/igt@xe_module_load@many-reload.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-1/igt@xe_module_load@many-reload.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_flip@flip-vs-expired-vblank:
>     - shard-lnl:          [FAIL][116] ([Intel XE#301]) -> [FAIL][117] ([Intel XE#301] / [Intel XE#3149])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5305-78c0a355e0dd70f31dba684bd172813fad9d79d2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [SKIP][118] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][119] ([Intel XE#1729] / [Intel XE#7424])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5305-78c0a355e0dd70f31dba684bd172813fad9d79d2/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html
> 
>   
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
>   [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
>   [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#5447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5447
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
>   [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
>   [Intel XE#7330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330
>   [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
>   [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
>   [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
>   [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
>   [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382
>   [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
>   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
>   [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
>   [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
>   [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
>   [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
>   [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
>   [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
>   [Intel XE#7622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7622
>   [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
>   [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
>   [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
>   [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
>   [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
>   [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
>   [Intel XE#7893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893
>   [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
>   [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
>   [Intel XE#8076]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8076
>   [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
>   [Intel XE#8300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8300
>   [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
>   [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
>   [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
>   [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
>   [Intel XE#8367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8367
>   [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
>   [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
>   [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
>   [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
>   [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
>   [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
>   [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-5305-78c0a355e0dd70f31dba684bd172813fad9d79d2 -> xe-pw-169229v3
> 
>   IGT_8988: 8988
>   xe-5305-78c0a355e0dd70f31dba684bd172813fad9d79d2: 78c0a355e0dd70f31dba684bd172813fad9d79d2
>   xe-pw-169229v3: 169229v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169229v3/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
