Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3469CCAC59A
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 19:53:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E976B10E58A;
	Wed, 17 Sep 2025 19:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UmXuXC0s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4CD10E58A
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 19:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758138833; x=1789674833;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9UBW9rPLhDDFKGXaKqMhVhr+T+YBatqj5a4UGDUjZ/k=;
 b=UmXuXC0s/k/qRJISi67H5OF90bOKj52lDf4wYhy8a5CgfsWvdJD0Oo0O
 5BByKkWQ/RYsnKbgE9mHbmbxMeBvqvjwT5KRJCfAKoFliML5JSEHdb4Ef
 HeP6pa2NluNUR4KFdO2L/4wMbK1ANdWlpT/xgXm6VEqaQMrBDDbV/F4lX
 gsIxRpRVV5t6tdfrUKJ0l0zSA2HYE61rdqcG/QpAqtyX9kERL4CCmW9Wa
 WzGAYMrmp++mNBqftbAXBySbk2QXQyf47HLmV5T/f+O09bgJNYWaZv6lR
 5zukh+hr18nHLOPv39M9wHnKlINehMzLOQ/XadlwWAldjH4lAcHLJs73o A==;
X-CSE-ConnectionGUID: 6LB4QDDGTXOxYR8SoekA5w==
X-CSE-MsgGUID: weJ4xXiwQ9SIbZzdX6x38Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="70710221"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="70710221"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 12:53:52 -0700
X-CSE-ConnectionGUID: msOGPCFkTX2boBGPuSDpCw==
X-CSE-MsgGUID: PFJOlGBoSlKXCjNOt3zi9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="175746445"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 12:53:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 12:53:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 12:53:51 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.60) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 12:53:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IT4Dwmg+D9hRq14d8OfWPZO+st2K0Mh7891kBE3JRLwd5+l5qvOeqXwpFtu9HP+EXs2bEQSI20geEU4bQZp1qNZYMfwPT44ZRxQIN4XbSp59jdE0upWDl2QEkeEzaJOP1NmEq0Xrp7l38YlWyB+iOmCZ+wXCvs/rIopSLC3PW7JIEUNpyeYsr2IrdkvksapVZAx4pgrPzwQiXGJOpFp+LiUE/NMtzkA55DnqXlqbAtCFJ77ngwzKBFBPOMm1Ek8AYRfQs10z21BWbHXXFZ9op2ATlLeX8rDIJDilCIGZteFgSx+gsqtNtKzsMAP55jineQtr3FmwpQEUhLnbVE5DIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9oqhZWpmqEEgpvVglYQywpyDR1J5XklmtcaqxS3eYM=;
 b=lK4VGYla+EtsQSV4CKDD8WhA1mmdjJwcXwqEjyI9XPs3Go1eMUDBIdhPdPLz2smz4cTB9IPeswMgof82KMHtLwIqZYKh0MIZ1eGCECByiADmNBelU8278CRhGbWtzP1xSPNAx2LQhug6B3Ny9JIMjiSRGDnQDrZfj1E9L3dePFSMHKoBFtM5HqaOjwkt3Cg6xlwY6Bj18J1bFcmshhvFBwhpaBFllhxKILWVcEqfLpW5Pnhzim9U+CFyyouZIHzcmEei6rc7cfnpb/YjRAAxY5lD1fys16wdpLbhDmyTjLlqt7QA3AJmQjjcq/+OyZI4BdPekCyBBSOUV2ef6at0ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH0PR11MB8166.namprd11.prod.outlook.com (2603:10b6:610:182::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Wed, 17 Sep
 2025 19:53:49 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 19:53:49 +0000
Date: Wed, 17 Sep 2025 15:53:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers
 <stuart.summers@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Riana
 Tauro" <riana.tauro@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v5 7/7] drm/xe/configfs: Add mid context restore bb
Message-ID: <aMsRyLSumWeO69mN@intel.com>
References: <20250916-wa-bb-cmds-v5-0-306bddbc15da@intel.com>
 <20250916-wa-bb-cmds-v5-7-306bddbc15da@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250916-wa-bb-cmds-v5-7-306bddbc15da@intel.com>
X-ClientProxiedBy: BYAPR01CA0056.prod.exchangelabs.com (2603:10b6:a03:94::33)
 To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH0PR11MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: 99e48306-9bbe-4dad-4dfa-08ddf623eb35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N+zqWJ/z2+2riwiHngfwc1b4gkCj36HUOmeL2taCugJ3fgwBqTHizFcV68eI?=
 =?us-ascii?Q?48H/zDn0KYf/lIQyl8m1MN8eRPT9Jdc/V4Jrj2156Xre8fG4CeSRoWGNC45v?=
 =?us-ascii?Q?gwsHH8jTkDinBtxYaR+OUhwHL6fgoyDO1cCl0rBz1FloG37nAnwkhHOhlRK0?=
 =?us-ascii?Q?LftNHxSpUfxid2xhIu9rLnVbFP+bZVOAw/2cgsHDyvyja5ACwt7fEtZY6186?=
 =?us-ascii?Q?YrqqXUbjyyKtOVfTWb0HZEoTzrUqAUOBVR3ne8w1K0V1kBY7kW5ZzdKhlbrM?=
 =?us-ascii?Q?/J9Q5gXKEdwFoGGb5fTay4Qigti0TI407UgvXh8XsCcqvvM+bbIW9CViLRwT?=
 =?us-ascii?Q?KVFXIcKtMmJPJxWD9gyfQl+rFSku7rdfrjHU6a9aOF7tM5WOF8IsCsvpMW1a?=
 =?us-ascii?Q?Bq9c6EmN5WyL9ezOBv1KzI1SK4ayRcL0TevuqgoYDsdjD1AjmoQQkNxMgK+c?=
 =?us-ascii?Q?wNZCDwktESyOSwn//UrLwwaUqLCjSnm531ZB8WHehn49Bjt8WVtXKvTO0ycm?=
 =?us-ascii?Q?weWgMmoy/Hfpmcvwo5qdkhyiLRFeJ6aI+x92GnzUAo4Rwcl/fS/660XSPTrb?=
 =?us-ascii?Q?rkMkUoub1dcv/eRsT2OQUxgB1+FCSVlDJcj6gJTeWZ4akPbPHlRr/SEG4Xgb?=
 =?us-ascii?Q?bm2PZNbyQkuDHdcNH0p62QAjsu7Kexs7fR57jy/FMv2Fp+DEBYgokiOzV2Yf?=
 =?us-ascii?Q?EqwV90gSg/cj+QAxm5l8nFvCdZhMt0tjvaUjrXOUeGnr5GyLU0st5jtG2Rxa?=
 =?us-ascii?Q?07RyOfaSCNAZdjK7rPvuczrG/XKBcJUGlR5/4PV7wBPqrrpQRZPY/6QPHEpC?=
 =?us-ascii?Q?m0+xNwMWGpIp5FfGRlFQx8+kW2FWhS8VuKBoP8iON0nXatxXHYGWjjjMFQAQ?=
 =?us-ascii?Q?R088mHbB1vT6NlSNWsxa40R4lLymOKuiKAdnnrZwD0hxNR1eBFtSXXkXPH3E?=
 =?us-ascii?Q?+UqM0hQYKczmpRAqJGCzL5ymUSMcbuS1GIJGyDi2V2emSUbPwjROMuNMdR5q?=
 =?us-ascii?Q?poEcymcDY4kidwsjl2CqbgL6QmXWPYBDaJ8PuF7XfSM/hw+losZv0F2ZelRy?=
 =?us-ascii?Q?duM8/+bHnIU94kbGKmO81mh+r/xhcuss00PXG4+klj5qNycYTpN6uGlB9Rl7?=
 =?us-ascii?Q?v5QHnjMhV+MoqB7uIAt+gbKxRuInTEfgUTa/hf1YETifKmDvIeU4i1n3hL+x?=
 =?us-ascii?Q?0NDl9VUx4zcJkX7kG5qzWFVK5S6KBNfxjo65sPwFRITNwJo380qVephzlebX?=
 =?us-ascii?Q?VM0HXBaSY1infpEAI6Y4G2DFPssNwG37EVtT3kCuZos24Vn0++iVcu0yozXE?=
 =?us-ascii?Q?L6Mozo3+6zebUD4zDsJA0sZaLsc5nWlAsLqwgqwECMpZ5z7vRc6vrTbZAAkP?=
 =?us-ascii?Q?/zLQyKtcS6Npc3Siw5J3eEQkUU5dSTmplWGwelEW9I06A3mZHtk0PtXkfrJS?=
 =?us-ascii?Q?BBEGYYqCxvw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i2di/YnbZz3Tqxr7cS0JJiJcOahb4ax7NL6GP+wA7Su5+r92207U5iNjv7UC?=
 =?us-ascii?Q?+MZlUX5RLRYI2Bf7MoDBJCGyUEvQXWo+wNQ9+CD7Yw+2pDKsx/djElDn0X/p?=
 =?us-ascii?Q?2K/esMMkXNz/nyv2NLBV22QNIAu6xpQdvPmMYS4muyE4A6NTP9PBAjHeBLbI?=
 =?us-ascii?Q?v5Ily9ZTgUtPLneXq3/6wWRD5PWFAQWDeeVLFr4u4Y0sM5gKqDzTT1EgFxBZ?=
 =?us-ascii?Q?rzt7ZSoX8xW+DhBJoWSa3R2CD3qd2G5AsiFyI5K31E1QxlOe+Wjyg0aO4bqw?=
 =?us-ascii?Q?ZC/Zfwy0O/BUOdZKpOktBnWdxDBSqDKkXiNODq9QqepfJfjZLaVOQ5hxYz1/?=
 =?us-ascii?Q?H3NNp8BgBj8sOcw3N8hU9iGz3eAHwsiEbso/z4AeAaiH6DubiYOWAmZdSnEJ?=
 =?us-ascii?Q?2o5mXJrtyv7RkTScELfLMteNjiLHFoUinu1LHnAyogjEpoqyfAL5ahwjj6st?=
 =?us-ascii?Q?GlKYczx8QdjcbfHng3D3lP2cZWb3NcVZKxNnTUQJukH3zFaOAc2TKyjYXqLm?=
 =?us-ascii?Q?Vg+UgHqKBJNMeieU0+2nHnSEQFtaQ6wpUinenxmr9fJB7HTHBd7QRV9eIar2?=
 =?us-ascii?Q?3zBM4M7ZsL0Yaip5X9BZS0T8+HMUY4o3DE+CfjEj1PtVLE2HvUBvlg2HPG7S?=
 =?us-ascii?Q?Spm2w9aSQxcJqjsBEwhHhtUpwxwUtJBaEOFrNABXKm65NaMhveHu/xvHEUX3?=
 =?us-ascii?Q?10PztkU5yjJ4D9wmiy6W+UzPA6xyAdqjcXQqI7TRKfaljDSwZrFm+2DZmUa2?=
 =?us-ascii?Q?2UdocSDUN18uRJmwdeyJvajV5ijeT40ZBd7dsFNdPfbRWOkGRMFmS2xuaqH7?=
 =?us-ascii?Q?Cjj+HoMDSXQbG4cPaaymWSQCtlXPHOZSo4RyO9oMoGOhpDygyKpd06gh2ef7?=
 =?us-ascii?Q?IIXBLWNCgQWfgeMvrqdV4ABvr33VYoRcV8K4uN60SH56W6+bKEYIGO0PeJ53?=
 =?us-ascii?Q?R4l6Gt+qKc5yrGJ7rtgKfyXfRALj6egAPUK2MYlyP7vanqcAux16++P2hZRP?=
 =?us-ascii?Q?6v6cEkaMsMXeUaudDlIbLhz08+DM0R4BJC4vuYc2TmGzb3CChS8F4nO+9lKq?=
 =?us-ascii?Q?AY48o9QEfeOd2r6Wz/1jjAKjiWgN6ksGCzjy7eWKrkNNnNGWQZZ8GR3MTmdt?=
 =?us-ascii?Q?QYMD9rsNv/BiAJVhjkf7TgPwhGOE9XICxOQ/3xPZ1Um4ab/mrrGPtp/vRuu5?=
 =?us-ascii?Q?lBymOL7gCcLKXBwdjiN66rie33w1drAXG1bSwTAS4NpIZXsHi5G31SLprRiK?=
 =?us-ascii?Q?b7XEfCT0rXAJ6gn7CdjNCir1c+CDse5va9En6Y6YzhFsBuoVdpSmD2uH54Zo?=
 =?us-ascii?Q?d3MJlbN8IF+ePiYswZwE/UbCkJ79F5VV6Q6QreoOKHFu221WIjBsHEGc7mHj?=
 =?us-ascii?Q?svN4nZDBLWzeHPwlnff2DgI5b4Clju/peFGVV/NWwdKIaYulHRcaBbMZVMQ4?=
 =?us-ascii?Q?IQKeqjZ0/I4Vx5fXiQbV5a6gTocjFHFJPmBKlT6XJfNUdXJEjXqhcVXXLeTr?=
 =?us-ascii?Q?XUGRJoFmwIaygvGy2P77nDKcUZsLk31wt6KLOLmtmTb0cQnrnODOjBvLsXWg?=
 =?us-ascii?Q?c2LsP+Ch/gCAbuoOc+hd3t7Bncgv8SDfgkZ1NKZnG0p42/9a/GcNhOmtfsv3?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e48306-9bbe-4dad-4dfa-08ddf623eb35
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 19:53:49.0367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R5ofB4W78cmFQb+Yu2ho+reeFOExm3S7u5UZQmAgT/RmRkMEMrmP80gLTNQu0QWZjn3BJZEZvVZCNeqEGJvg2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8166
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

On Tue, Sep 16, 2025 at 02:15:44PM -0700, Lucas De Marchi wrote:
> Like done for post context restore, allow the user to add commands to
> the middle of context restore, at the beginning of engine restore
> commands.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 46 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 42 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 90bc5a4b5da71..640df5bee4579 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -126,13 +126,21 @@
>   * not intended for normal execution and will taint the kernel with TAINT_TEST
>   * when used.
>   *
> - * Currently this is implemented only for post context restore. Examples:
> + * Currently this is implemented only for post and mid context restore.
> + * Examples:
>   *
> - * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10::
> + * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 after the
> + *    normal context restore::
>   *
>   *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
>   *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb
>   *
> + * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 at the
> + *    beginning of the context restore::
> + *
> + *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
> + *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_mid_bb
> +
>   * #. Load certain values in a couple of registers (it can be used as a simpler
>   *    alternative to the `cmd`) action::
>   *
> @@ -146,7 +154,7 @@
>   *       When using multiple lines, make sure to use a command that is
>   *       implemented with a single write syscall, like HEREDOC.
>   *
> - * This attribute can only be set before binding to the device.
> + * These attributes can only be set before binding to the device.
>   *
>   * Remove devices
>   * ==============
> @@ -168,6 +176,7 @@ struct xe_config_group_device {
>  	struct xe_config_device {
>  		u64 engines_allowed;
>  		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
> +		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
>  		bool survivability_mode;
>  		bool enable_psmi;
>  	} config;
> @@ -467,6 +476,13 @@ static ssize_t wa_bb_show(struct xe_config_group_device *dev,
>  	return p - data;
>  }
>  
> +static ssize_t ctx_restore_mid_bb_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +
> +	return wa_bb_show(dev, dev->config.ctx_restore_mid_bb, page, SZ_4K);
> +}
> +
>  static ssize_t ctx_restore_post_bb_show(struct config_item *item, char *page)
>  {
>  	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> @@ -623,6 +639,14 @@ static ssize_t wa_bb_store(struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
>  	return len;
>  }
>  
> +static ssize_t ctx_restore_mid_bb_store(struct config_item *item,
> +					const char *data, size_t sz)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +
> +	return wa_bb_store(dev->config.ctx_restore_mid_bb, dev, data, sz);
> +}
> +
>  static ssize_t ctx_restore_post_bb_store(struct config_item *item,
>  					 const char *data, size_t sz)
>  {
> @@ -631,12 +655,14 @@ static ssize_t ctx_restore_post_bb_store(struct config_item *item,
>  	return wa_bb_store(dev->config.ctx_restore_post_bb, dev, data, sz);
>  }
>  
> +CONFIGFS_ATTR(, ctx_restore_mid_bb);
>  CONFIGFS_ATTR(, ctx_restore_post_bb);
>  CONFIGFS_ATTR(, enable_psmi);
>  CONFIGFS_ATTR(, engines_allowed);
>  CONFIGFS_ATTR(, survivability_mode);
>  
>  static struct configfs_attribute *xe_config_device_attrs[] = {
> +	&attr_ctx_restore_mid_bb,
>  	&attr_ctx_restore_post_bb,
>  	&attr_enable_psmi,
>  	&attr_engines_allowed,
> @@ -909,7 +935,19 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>  				       enum xe_engine_class class,
>  				       const u32 **cs)
>  {
> -	return 0;
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	u32 len;
> +
> +	if (!dev)
> +		return 0;
> +
> +	if (cs)
> +		*cs = dev->config.ctx_restore_mid_bb[class].cs;
> +
> +	len = dev->config.ctx_restore_mid_bb[class].len;
> +	config_group_put(&dev->group);
> +
> +	return len;
>  }
>  
>  /**
> 
> -- 
> 2.50.1
> 
