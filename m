Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A6BFD88C5
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 23:10:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB53D10E78F;
	Tue, 10 Mar 2026 23:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aN6wy7BS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3753710E78F
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 23:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773184253; x=1804720253;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=v0e7s2TDQajtubkPtkfESriihomjJUwShWCvOargw/w=;
 b=aN6wy7BS2er6MYCc0XPwJgJCoVs5O7y6i7QKrbOxNaGkhStpzQyS74kZ
 tWM3IME2IvuOI71V47XwUOgbEHVTDe2JXcsC/6hC8klWY6aaqHQ+j4NTt
 +IEkPC3uWV7gOjAuq68W/ePs0+KReXDuCMAVAq0rI5PvlsLG5zCXdYptr
 a4Je2uvTvtKbKDJ1CZkJJ1cioZEqwPzXutHq5RnuZ9BFGAJObWBzykvv7
 V/I19fL7TK30l1sh7/8iDcHba0lVPWwAOEkmTGmp2Ls4fBiKTUHfO2cSQ
 El4z7cRrMM2Zov4hGKKnMrX5TlBh8MKIjXHTl/Y9jmFmf2tnApZsUpDEF w==;
X-CSE-ConnectionGUID: wVVRg9SoTMO/iC0TBB02iA==
X-CSE-MsgGUID: mZewS69QRF2lZ7yAF6L9+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85600244"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="85600244"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 16:10:53 -0700
X-CSE-ConnectionGUID: YjBl7RXmR3aoGrXpDK0ZOg==
X-CSE-MsgGUID: ImooRjgTTzi6nVJvKffJ8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="222835334"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 16:10:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 16:10:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 16:10:51 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.66) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 16:10:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSOJeF3g8fqPV+O+9Iam6ITFxLm9FK1kiZ/jlO6Mv/XOxuPJOICkmSqAU7RpnsQ4s+jUpwKxVFAnyIKQjJO5LzzfvuL3K0ZenOecoCbeC96Isf53thDuB5iWTg5R0Fw2Trsht3zYaHm01Ut2XTxY9WHta+LQhzYfDBJQzRFmOOlXoidZXsUA9CRT7Et4eo8hzvivxfJG0jvXE9aS5Kz8zP3TyBzM/a/9NZH0tm9L5+xb2cx0pqVNK868KP/R8cYzbcMqDQ8i0P7HxW4tL8L3y5xNXJao5jVQTPtjY153rHSQ5IvOONJ26VyqbyJqhfps6+AYTlOn7MTt3X2j8IPgag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PMssiYwU/CbI91IR1whT/KkrTWsE3SU44Orgz541gQ=;
 b=fZCWX7CWPjucgAG0pxAdTpbECME3STPvuzQorG6UHlFm7sWr8wDpU2nu7qUI6xRyVrZ5LHWC9CHILedm3LL+NUVMMU54BMzMemsiwHCmKkAaSVHmoohEjz2jK9iQIwx0TkCb/EeRMOZ3CTxKGs6iS163KxVuaNcnmxdfQbPqgjaUqw8yXg7IurboIPlftX2DyPmrceDoV00HcM3yErFT/QsAe5kM5nxCFNRZOrz40la2dZKAmRgsZ5UEIYIGuO9IzZjvDVCSqpxOopSmrA8uISC5w43GpCN8CzGhCQqcbvp5OsYew1BiDYH4ebb1c/HOrvqz2DhMitZA0+mQtJ2VUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA1PR11MB8788.namprd11.prod.outlook.com (2603:10b6:208:597::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 23:10:46 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 23:10:46 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v5 0/7] Extra enabling patches for NVL-P
In-Reply-To: <20260309-extra-nvl-p-enabling-patches-v5-0-be9c902ee34e@intel.com>
References: <20260309-extra-nvl-p-enabling-patches-v5-0-be9c902ee34e@intel.com>
Date: Tue, 10 Mar 2026 20:10:42 -0300
Message-ID: <87bjgvwaa5.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:a03:180::35) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA1PR11MB8788:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e7e878-72cd-44f7-8891-08de7efa42dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: PM0IK8S0hQOACNAKqG24g4Bx24FwS23GIhWDZR3jX51yhjOjMTyRuDS+b9q3b3gcwBHYy4MZ6sBIQQDJQTI1HLRdHmoIF4wJmiSgAxNqRhsr5N8CFR7V1kkzPT4aldrEox8oYewDBEuopqpjzO8CsJHVfROv0jeKuBpLlsDDVpVP/mhBRvN6Mx6mTrPIWCG2xD6YiMbTEfbRW45nOYxE/E2DbdxsXmX2wT2uK/uy7FgfcXE9W9k+HgB9Ivt5mLbN0iAr1q4fI0HrCPR6cl+YE6PAgjTRPeiDQbpQIZ4JXvkAvM0PrjRPi4G6/R08xkYPsPH1K2QNRTS9QVJPxycf09F7DNST0CRt07hZWs5tljRYLrfnOcK3MhLIZAezswvB8vusE/Otfr5sqnnyLy88jGd2n+7wRdq0gwTgOLFQ+qyNOCg2nJwmqJNRWibh5IsjChS4peJwqevMoADGsc/7GwhUMsd21FNqqPSXDNGSRtzs3ALboazSbZ/adKrEg7YDgmyZnPH3A5a1Y5r8XGrgqLRfcWJpzGSmoxqcnfJv+4IEDu6HVHcQapz5FCzU1ZvFaKTqEQyKmPKfiYeOpSRKCOxQp7H6Otydf8g9oVC5TmGLcqefptqrggDZrR6Y8XzghsWAyoMrMXkJ054bWwdEJ5dW9yHEYn2duoJ+iAjg1VfjtacKX2uRPWB+Jfb6p7jd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0gwXEHkSxwe27u5wu2BeUBPefn0yVfJU5IjE4fNck1rQnFd8WjUTO5GKKvM0?=
 =?us-ascii?Q?u1M5QqO0Oq3RlQApUewcWzp3QpcdI7jWwT+UoWZSE4rzp4ry54tDatHwND8K?=
 =?us-ascii?Q?SZshdAopJqya7uBRo5MNOXsmpzC/Jlf/Sszr7hvFGYJZUsfB/j+CWMkh4kGg?=
 =?us-ascii?Q?0EWu/5gnI0dpH2eTr4VZS5C6qPE6n8kV+xlpihwfwkupWHaAC6O5rwBPKGmf?=
 =?us-ascii?Q?bSi14D/B9IIr2YF4VbmtlrNnCKkSZ8qBtiLQKLu5Tkk+cJmfUik3XjDCui9Z?=
 =?us-ascii?Q?EDJadLxhq348akUaDS8Aw+iw99jMiQm8EKtRu7CpkENOOVMUC/RGm59m9G6d?=
 =?us-ascii?Q?fIqN7Qn2sC237DJYqTC8Ghx9JmaYU2uq1P3LBATjETUzqKmKYCGLwlPN8HHv?=
 =?us-ascii?Q?7nNF1oH8rBhLKUMczQy++3dhz+Qi3Crnc+fMfQGyTYc71F3EollXeLOuK/iz?=
 =?us-ascii?Q?ekhRt0bOL1RSAzJiYV9/0LpVfrArDdJEuFf/kGDVQH3V3fxjQwSYa7zDNEuy?=
 =?us-ascii?Q?JqESEJOcTIhpbCUhIrZeE2YkoN0n9NCrw/ZGiTKbVIqhgswIVUSg+HQzgQzU?=
 =?us-ascii?Q?pmKnJbzCbaHHcUNxh/hR2QsyTKgrNrdcgzoo/dsYct868MtIqzAo0azuUsSO?=
 =?us-ascii?Q?DOxR9qy7GIYQajAOg10Vfy3bZdGlDpPct2hdo0nNr/tUD1Aco5NI0P8dv9oX?=
 =?us-ascii?Q?TSIsHHtkN9RU5mvPY68Td4sQq41sCLe3O1p1xMbwpYizUP+0Xi/eS6oUZI1h?=
 =?us-ascii?Q?AlYB076rW/I22wOA/God8+HPZqILnSzx5cBnStEfUhTCRsfTNL9vERKW47QV?=
 =?us-ascii?Q?AwVkjN52CZFH2WRbYBLFZf8Q0BcRHKGDUFd9M4xpEOtHiUaCU+WCTEbnYeh3?=
 =?us-ascii?Q?xNYwYgQFTQfpwGF9LyW/8DM7/UQjGG/klyTwUJby4Ft43xOEzDl8pG1X7Oaf?=
 =?us-ascii?Q?Dx+8yZmZAzPvVv1lpENqoJftfLfI2uKwclyv58/Df/5mBm0hkTjrNsuUBMdO?=
 =?us-ascii?Q?/5UFBTIHqxKA18LM45k+4sNHvKz4DU5wSPDnOmUzE0aaHbpCjbfNucDW44Sh?=
 =?us-ascii?Q?lQ94POd/YXj0594rA3d5qiUydNjTySiLzXhHc0FG+eMngI65NEnSuaeft7ix?=
 =?us-ascii?Q?I10RVogLbLhdh0hC4kTeHezxksUPdIjVPvNY/VLcQFH5tFj4xJ8OPkES5xn6?=
 =?us-ascii?Q?NQuKdGmFZ1S47Se/SImAMjxot5dIhfeK8g5V6LN3HZgJii1O0AEaGfMwin8f?=
 =?us-ascii?Q?FmYuWQlmu931ecWP3Vwg2lc/zOxziMzVg+VWTrKMqRGFq7SO9DT/Ujc6ljyE?=
 =?us-ascii?Q?+2ZxNWidcR1ao5U3IxtSRDZap8cVZu0bA4NwVDGDyGIxEdTlfkdEzXKV7E1h?=
 =?us-ascii?Q?2C7QcUpxpRK5A6imNALPsgZu/3TiCcAoclXVKfosTQ/DPuTFD9KiiRwudwyd?=
 =?us-ascii?Q?elDbmmhMwkYUFD/Y+D0Hx4hXvbxuaUJykJG6rQ1VHCHxjBDFEXnu+nZg+/1t?=
 =?us-ascii?Q?+pVtdcvraw7KTZIgYCD4K9kMY+DEDBpxCN/En101Rtmpn4XOYTYGbIVMLD0G?=
 =?us-ascii?Q?W2P129H3ExVQaWDvYUBUXipMBHW6zUBS45RtYEvjvx5MVVLaFCBOHx0IE/R8?=
 =?us-ascii?Q?It9J8flsfuBsgvqOdegEjcZRdGCBp+ZvQTYOgu63ub+ChGAgOZAPA4ifFu1X?=
 =?us-ascii?Q?ywgIho3HT78A0LWB3k4o60SPJ6orNn5VoZFGE9B9GAYMohJREGCN54+o6vpq?=
 =?us-ascii?Q?qjp2WO1Aaw=3D=3D?=
X-Exchange-RoutingPolicyChecked: Se2foT9L90KyVKX1JwuRxp3MqcNqOI5/XkhXcJpTTUN8esCA5SFPV3KJakKSehLRZ39vzC7VdFhb5lRF38wontAKpfMcH13SX95no3wDXjJo4MuElUaJQsfmmAyn3CfB/dsmq6xfAOZS+CVDxAa+v061QkcEe5Q8YdorEPdZCXsMygs4mxtrS0yF9iJ7JN0XoTGxIbm30UfLymfkhr7KDyZYzk+AXephMBBtfXUFbP1YY0VsmS+2yQRb6S6Av+aAvL3Yvhc3lMohSce+bGLvvTOGAv+RiGQJQvTkSr8RixMxGBKM2JUobgtd25knwnlHO6JDIfZ9h1Yh0qzdfgzGng==
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e7e878-72cd-44f7-8891-08de7efa42dd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 23:10:46.4737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ezC5Oeq0JBY94ES9odbnCIZB9EAe806bu/EakebUOIKiTbJcICJJIXdD0ZZdomdkhHoCxP/L8LtW1njGM2ZqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8788
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

Gustavo Sousa <gustavo.sousa@intel.com> writes:

> This series contains some extra enabling patches for NVL-P.

Pushed to drm-xe-next. Thanks, Matt, for the reviews!

--
Gustavo Sousa

>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
> Changes in v5:
> - Drop "drm/xe: Call xe_wa_process_device_oob() after
>   xe_sriov_probe_early()".
> - Back to using IS_SRIOV_VF() instead of FUNC(xe_rtp_match_not_sriov_vf)
>   for Wa_14026539277.
> - Link to v4: https://patch.msgid.link/20260309-extra-nvl-p-enabling-patches-v4-0-2e7fcead971a@intel.com
>
> Changes in v4:
> - Minor update to "drm/xe: Call xe_wa_process_device_oob() after
>   xe_sriov_probe_early()" to move the call a bit further down in order
>   to keep SRIOV-related function calls grouped.
> - Link to v3: https://patch.msgid.link/20260309-extra-nvl-p-enabling-patches-v3-0-0416900dd498@intel.com
>
> Changes in v3:
> - Incorportate Matt's feedback regarding Wa_14026539277.
> - Added extra patch, namely "drm/xe: Call xe_wa_process_device_oob()
>   after xe_sriov_probe_early()", to allow
>   FUNC(xe_rtp_match_not_sriov_vf) to be used for device OOB workarounds.
> - Link to v2: https://patch.msgid.link/20260306-extra-nvl-p-enabling-patches-v2-0-53dcfa6b44e4@intel.com
>
> Changes in v2:
> - Minor update in patch "drm/xe/nvlp: Implement Wa_14026539277" to skip
>   the workaround if on a SRIOV VF.
> - Link to v1: https://patch.msgid.link/20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com
>
> ---
> Gustavo Sousa (7):
>       drm/xe: Modify stepping info directly in xe_step_*_get()
>       drm/xe: Drop unused IS_PLATFORM_STEP() and IS_SUBPLATFORM_STEP()
>       drm/xe/nvlp: Read platform-level stepping info
>       drm/xe/rtp: Add support for matching platform-level stepping
>       drm/xe/nvlp: Implement Wa_14026539277
>       drm/xe/xe3p: Drop Wa_16028780921
>       drm/xe: Translate C-state "reset value" into RC6
>
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  8 ++--
>  drivers/gpu/drm/xe/xe_device_types.h      | 10 -----
>  drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
>  drivers/gpu/drm/xe/xe_gt.c                | 39 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_pc.c            |  8 ++++
>  drivers/gpu/drm/xe/xe_pci.c               |  8 ++--
>  drivers/gpu/drm/xe/xe_rtp.c               |  7 +++
>  drivers/gpu/drm/xe/xe_rtp.h               | 20 +++++++++
>  drivers/gpu/drm/xe/xe_rtp_types.h         |  1 +
>  drivers/gpu/drm/xe/xe_step.c              | 74 ++++++++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_step.h              | 10 +++--
>  drivers/gpu/drm/xe/xe_step_types.h        |  1 +
>  drivers/gpu/drm/xe/xe_wa.c                |  4 --
>  13 files changed, 144 insertions(+), 47 deletions(-)
> ---
> base-commit: 50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c
> change-id: 20260304-extra-nvl-p-enabling-patches-49ea48e204f5
>
> Best regards,
> --  
> Gustavo Sousa <gustavo.sousa@intel.com>
