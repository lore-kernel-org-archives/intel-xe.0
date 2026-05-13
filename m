Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75671CD37AC
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 22:35:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3846210E20A;
	Wed, 13 May 2026 22:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OzqZn/kg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC7110E20A
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 22:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778711718; x=1810247718;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PZmI/j97tcloAhjaB4bXAP2r0kD/UKdUYiZhH/rpxDw=;
 b=OzqZn/kgC3Mx9aA8HbVKuwjUQUjHUt7/W1tytJX0fZI3RGr+WOZlFqXd
 4AOQiORvpxO6NddIiTLjzlAjwyu1JgKGxlGx8n05MRQhwn3eqVVNAQ5Qz
 brEU3MxculGm05R9HPgVLXCAplmULXLrYxseCodpwfWB0gxJ+xk89nKU+
 QtviS4MkYjk4CnWgs2z4AiRQ3GnQ+Z3znihPbkvx5KRpT/a1ZOWCJwv2R
 1PpUywIovtHJIyiQ/JLa8TxAwARPLAShahTzrF/fTa5imaQY9D7sACJ1D
 97hbKCSglGJ2hmOwWcqn8xEjeG5X4U+m+E0wr9YnIrJ8Czy6VE7bq+zcE A==;
X-CSE-ConnectionGUID: mRQ1Ou2vSamv2WSsH5TNSQ==
X-CSE-MsgGUID: 2D+8FgnNRDCjrHYl6gkz+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="78793875"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="78793875"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 15:35:18 -0700
X-CSE-ConnectionGUID: Tzgh85nITTic2mbu8wlAtw==
X-CSE-MsgGUID: C3duPh7PQrOcidoYBD+zGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="242549303"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 15:35:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 15:35:17 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 15:35:17 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.22) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 15:35:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kRjbcEzhkQpkoNDRdHEkU0Jvv+h0RUHwaKJVn1v9DC57ZGbe+3pl5cEfD6hZ+JZevhbIaeG/mga+hHdwF66Qsbk9JrACRBC3+ccHfdi+bhic8c26XtGjsgBw9AvuqsuMd4SUCx/BBXVUZxTTUkD2qyY+/5Xddqzl9M1unY+/SKD84yaRtYIO9cW1OgueUiZ8CGW1go8hwcaUhpFuylrbpWamZNKbzh2Fty4EDA+m2CRk5iB/Vu1mfpDXhbXFls4fLGCKJRDwe44Kgl3XZLUR0y16NtnfcYmnmXub1JPhXIj4j/9ND8dP7ZnVMTtyegHwYxE6QSLxMiW6EAcPVNsSxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ph0uW9BKgkHP/LF7+VDsG0l9mNEKoZdGg977ota7RaM=;
 b=jwQJMZwBHCf/O5avptz5XKmhKSPqeVtg/bwK+gjq6G1y/FXOgM8+4DzEIYcBaR+FVfN7hP5NDOuU9Mc4OCES++B2LCSUd9J4fWrBNtNJl9Ouubnvj9X9OPuwlTKEdoK3EJDEsLoKRWbzODAbld0I1KpdQeyUZIuVBJX3O1pU9PMrEy4CY89EsXRt8f+1Y5j510qMpB/rp50YRH3B7pGcJmazQBFnyWl3/CNwvJPRsVhD+0wvOAFJcWaC4wMXRpTFXPgdwpsi8L9ATRsSmt54XrB6LvkF4R77BWf+jfnYXTQft1Mpj4E0YzlfMXAApSYcQaidGiWhlZ0qcf2HOx/QqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA3PR11MB7628.namprd11.prod.outlook.com (2603:10b6:806:312::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 22:35:15 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 22:35:14 +0000
Date: Wed, 13 May 2026 15:35:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/8] drm/xe: Define and use MCR version of
 COMMON_SLICE_CHICKEN4
Message-ID: <20260513223512.GD2131374@mdroper-desk1.amr.corp.intel.com>
References: <20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com>
 <20260508-rtp-mcr-check-v2-3-9897b147a5d2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260508-rtp-mcr-check-v2-3-9897b147a5d2@intel.com>
X-ClientProxiedBy: SJ0PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA3PR11MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: 3580d7de-6d91-4ec6-2093-08deb13fe6d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|4143699003|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info: cxL39tNj2Jj1cDKauQIEMb7oRaJAWJWQ+n8nT2i42Zw0po2b80+W62sZqwlnXW/X3YHsxJdSJWcuGuNUJzkHvBpA9y32G01AeO0gumtE2bhjNEDv8Qk/WvQPRZnrePfpQKOp7s31CCjgm3Jc94Em4vZdtYJkb8yMl0egVXpELePuS9srFITWw70ttcxvVC+8BPAumF2847/tF2mICdVPfxYdlVzt6Aq2ospEDsf9nnAmxK8MB1JzEouC1vkdGXkexAY7c9Pl05PEpJoiG+WOD65o/aAKXzSiTx7Ab+sN7EwjsLPamQDaS6ipXcDzldwgwGhklgv5awDdsWbrQwhbFAOo/NEHYvHhN7VUP4nFzmhIAe7C00/aK/tLp2NNBKxJG9bsqET88cqRULsISFNmNEFDgnEfhlmOsetm0vPbB0WH1Kg7FVkEob0ofd5UnvtDPoFUZ7Emd6EvNlkyup4YsVBU0SL3ok6Gj9ZyIPycZTDqgj9MlSVmTlcU64+lrA9LqWQlu3r4D+08jqLe+DCSEfGW/vWFkIIpqmbm5wAmyabTCOQIHwO4cN81YT0TQ1O0ZOnpqgpsFBuibIb1aNhIlryp+LX3WAwruKWpvNJz1NIVpIm6t0RptxwCoZ9h+4NPXSi0Ehhw0yL2B6VJ6ZxMctGYlECN9SbZ8NrQpm/txhmsFmGKOCvB9/t/N6lnmjuY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(4143699003)(18002099003)(56012099003)(22082099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AMXrzxkuW7o5HHFJOrxCxR/WhYKG4L6PLiPJlBg01JMq4oNmVdGFbRtMFk3Z?=
 =?us-ascii?Q?zF1HNumit8La/LTmtcB4NbWvGIhaihwbI9/qJqIeYDalwu5PpYEwU5DTM6VQ?=
 =?us-ascii?Q?LL0evfr5bLbQJM3yifKUQPSXUluQxM3YdcNGktSy+NNUPS8lYSt88kxUgels?=
 =?us-ascii?Q?nQ0knK51xnQmzvwykdNhGHKLoVV98B7bKb2a19dUpH16YEkoQEp7tdOZT7D3?=
 =?us-ascii?Q?Ot8hpOAZADcK8Q/3rKGexbwi845ofgUYJv5X64XO9fogOXiuB2Ar7xsew3iE?=
 =?us-ascii?Q?8CVgkz2dQz+8APCJqMdW/2qpbQCevk+11++vb4Ic0bDQyxXpx2qI0CxWbDdy?=
 =?us-ascii?Q?HLR34EjqRBaoCPMCh/X6J1UWkh3mEXP+m/XecwugpLHO9PmsPN+ijDCCDKuK?=
 =?us-ascii?Q?b0gMWzWEhBgQ/Ki5CclwjtUFuJ+0SZ3zpUCUijp3xBKNRTxLr5w4L1JhWPnO?=
 =?us-ascii?Q?5mJvE4GCDyNCTpExqsmFTmwaangVNTR7Wtaet9/f5F9VPmqQGxpcMjpDnzc0?=
 =?us-ascii?Q?xAl16QFG7BzYu+wGWvHiMNvxnkbl6QWkWoHND9ktDeY0a6BWWKSawVUOR2zh?=
 =?us-ascii?Q?nMu4T77yixDXS0JTA8+dB7QFWucqNOt6U7oggWyrdXB/jHGIsGSiP5e+gZ/7?=
 =?us-ascii?Q?Oxld4LcFfXN0/KWAekKjEBCcskXnuT21NBFxz6tNzI2rdrIFH5L26zjlEhN+?=
 =?us-ascii?Q?YTYGy/cdhJb2YQ9EAxUiQtdR9N8QuigSuQ3fyDcI7qqhFrmR+Li3vHgqtEu0?=
 =?us-ascii?Q?FBALkCrCTXL33BNoe9//9/REdZnPuNGlHF3aPX5aCtLGQrv8d7oqXP9HG6WQ?=
 =?us-ascii?Q?BiPHlvD6TWkFhGdLftuLphO1RSqxlbd2Wcn+fdUZ4K/kWrnaL0YNX3Ub1w38?=
 =?us-ascii?Q?TQTRg0OO6HJRAu/uEhI3Jcb++F1cxghDEluXxBmC018/aqis7Uvl6EVeicEE?=
 =?us-ascii?Q?7A9CSCCnncdZSmk5ib2iKE0Jrw+yy0L1lfewU0eEGv0ove/uWhbh+nWgW5O/?=
 =?us-ascii?Q?Pi1HNdSs45dAkd4RmazwKoi8yv7s3A5G5P8SUm3Ziu8LF5q0juJWyI4HJKvX?=
 =?us-ascii?Q?srQ1nq0vujaLyoVzRfDkOWT7G+5LLCBaDS2C13cz50nVT6C8IfeapsMDIII0?=
 =?us-ascii?Q?OSH/tjYnDI4LQsdMcZYW8TadixPDDsHmjY1fXs7Q28SyEilONNx4+a9az0BH?=
 =?us-ascii?Q?qB6JxZRHwpAFc1Zfz5rofQm5OOhMRqt43Q8fgw+3aJW9HmRcfNttm7NfiyJD?=
 =?us-ascii?Q?ea/Uk1qhA7l8l23mw+5AY/4r20C4o0X5aG0AwpTzBqrZCWjb8VDHRoOAMDbg?=
 =?us-ascii?Q?vg1qPky0QC1zC899KBCxJqbThCCvIIKG3YCc2vi6Ujk9uo3BWZJNG7n/h/dH?=
 =?us-ascii?Q?XZ4TO8KVsQvtHPBWe5wNBBVCEl9PGtmMQ59Rw3X0UBOg80DxUSjmmZc6jY4n?=
 =?us-ascii?Q?3zQ2YWTj3iTLf2/E51G4TWFex3Mhq879nrIpiRgW+1mUq23U53EbNYUxG1yu?=
 =?us-ascii?Q?I08FC+n0BNAt2Od7habkkiKcv3HKY6sXOfzu5dZ56fl3yztR2280VhIAI2z7?=
 =?us-ascii?Q?nGR/z3u8s9E7CtotBjnyCz+UfnKKD2zbhpu7w8Jio8OSpZdjuu9lNRE/1Pmc?=
 =?us-ascii?Q?I5HXUVmrYLQvMdMUTGDHJkrXhENMzalJOpQL2dC0utAMkslSdSHhoO0nvbAW?=
 =?us-ascii?Q?D6ydWvHgpR0wLCbJ/LoLzvFP/pwD2mSgIs/g3ITdPltkaWkGyXh/1uBsiwtN?=
 =?us-ascii?Q?Hjl1/XobV3gP6aYT2g2jzqP0uhOqS+c=3D?=
X-Exchange-RoutingPolicyChecked: YfJXfywYnrqLadM02Qkh0FUQCYV3aeIkWaWMFvDcvJZcjea435rLE4l3bKdtas5QAymGnnkGCXxAmz51+YDd5k2PS0HO+Tb2Gm1BjVUg86erwFjdfPEY/VtHt7nzqgAkVAKfoF7Rx5Rv5WrQs08yeKJSKq8vTNvZudCAOk5vUL834/HgVXHAk40Tpe+boHY7EpaCzwLsxAlWymBm/wNoDocdKPKrqOuqTLQRZuHOPQx2aEpYn85wrPTGzRmB26xYcN7nepRB+cQja9r706IOZ6Xn6s1r/A5AG4IEwC2ataTRA6zYWkbiNBv4fRTkhtSk/T8tQ4IZ5vGBe/s/ig4OfA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3580d7de-6d91-4ec6-2093-08deb13fe6d0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 22:35:14.8433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FhLDIv2/H1dQMjZBG/99Gw/Scdz+wjbS9F2/TMVr5jz8uG99cFH4q+quLVO3YrAx8qpXx6t6vNUxw7FzUrN9tbK7CXrRs4lMX1cIwk0z2uc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7628
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

On Fri, May 08, 2026 at 06:42:33PM -0300, Gustavo Sousa wrote:
> The register COMMON_SLICE_CHICKEN4 is a MCR register on both Xe2 and
> Xe3. Let's make sure to define a MCR version of it and use it for the
> relevant IP versions.
> 
> Use XEHP_ as prefix for the register name, since it is MCR as of Xe_HP.
> 
> v2:
>   - Also change for one entry in lrc_tunnings, which was caught by
>     manual testing and add corresponging Fixes tag in commit message.
>     (Gustavo)
> 
> Fixes: 8d6f16f1f082 ("drm/xe: Extend Wa_22021007897 to Xe3 platforms")
> Fixes: e5c13e2c505b ("drm/xe/xe2hpg: Add Wa_22021007897")
> Fixes: 8ccf5f6b2295 ("drm/xe/tuning: Apply windower hardware filtering setting on Xe3 and Xe3p")
> Bspec: 66534, 71185, 74417
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com> # v1

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

for the update in v2 as well.

> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_tuning.c       | 2 +-
>  drivers/gpu/drm/xe/xe_wa.c           | 4 ++--
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index b21c66a1b777..08251c7a1a4b 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -179,6 +179,7 @@
>  #define XEHPG_SC_INSTDONE_EXTRA2		XE_REG_MCR(0x7108)
>  
>  #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
> +#define XEHP_COMMON_SLICE_CHICKEN4		XE_REG_MCR(0x7300, XE_REG_OPTION_MASKED)
>  #define   SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE	REG_BIT(12)
>  #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
>  #define   HW_FILTERING				REG_BIT(5)
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index ce39b77a084a..9a1b3862e192 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -134,7 +134,7 @@ static const struct xe_rtp_entry_sr engine_tunings[] = {
>  static const struct xe_rtp_entry_sr lrc_tunings[] = {
>  	{ XE_RTP_NAME("Tuning: Windower HW Filtering"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3599), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, HW_FILTERING))
> +	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN4, HW_FILTERING))
>  	},
>  
>  	/* DG2 */
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index d6f94486673e..cb811f8a7781 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -767,7 +767,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	},
>  	{ XE_RTP_NAME("22021007897"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
> +	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
>  	},
>  
>  	/* Xe3_LPG */
> @@ -783,7 +783,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	},
>  	{ XE_RTP_NAME("22021007897"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
> +	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
>  	},
>  	{ XE_RTP_NAME("14024681466"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER)),
> 
> -- 
> 2.53.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
