Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69476CD5BAF
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 21:01:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2844310F412;
	Thu, 21 May 2026 21:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7cpHLWB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87BF710F400
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 21:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779397270; x=1810933270;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=hO0LgIGZkGJvgGdWrUjRvAtZ50Juriz6uwI3X1d4qdY=;
 b=i7cpHLWBxCcsSm9Is22xU8Zx6rKalejf+qgFgd/LeNDpI27TUNt+14ug
 mEfoYMJdoUi0m3UA3zDl2DGqyqUwR5Xs/56goZtO+srrONgtsZIHVi2R0
 pfRHMy8/5eh7DgLTW8qbhQ0a7JSFecdo1td6BEQtXqU6KnlVZ1MjTOwpQ
 ioZT202G0IH/fLsVamrd0pHue0UZfjaFiAYQxJsw/xir+ZdRuaCCb788u
 RvVai1oPCd2wMVOyNbpzGXhplpJnF4xDu4wX3nxw936UXbYOLRGldOfI0
 PvjyrHR4XKAgRZQP/YXn9i7q0P6FXtiFOLpqIH7QNcbrWVL1wqt9zGxsa Q==;
X-CSE-ConnectionGUID: aIYK6sbtRbWw6NViNg6f+A==
X-CSE-MsgGUID: VOogiHcqSniSki8jQQ/FGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80359081"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; d="scan'208";a="80359081"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 14:01:09 -0700
X-CSE-ConnectionGUID: U2JQQs/fTPOsK95jR7eV1Q==
X-CSE-MsgGUID: Jt/FnUJ7Sb6QTxbvJJ+DlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; d="scan'208";a="237620435"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 14:01:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 14:01:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 21 May 2026 14:01:08 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.10) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 14:01:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYvL2z9farULmFu5X+00S5rZzp7hiZApxc5+6yqNFwxOF0rUh8QB/o8mEjhPxo4z+1LVI9LWdASvUAj2tZiYSrL6Y9qri3OIKmWgfY8MhAvKb7lmmrWyMbGN1DhDHyJ5gHIIgk/3NmMJGCKLXCMqIpZiqCIwb+5IKIPPaRprmIUCCX5xxaKTBVEFQQ8frdZCmVbKFv1INqchm5mhGSc94YRa0Nmo8XAYxwKI0ONfTaV9YR/O1RuRjGs+7snup/ph2cAjYn5Ssnl3hef9lhimvsD2EC5idLorT90Ogjw512mt9xIhZOYkii/BklLclcyLA1H3dq74JiFswvOilByEAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unQvmXW36nP10yU26IZkZP7KLOTKhI6WlDh1yIAicD4=;
 b=jNnEYoKpTc+uTV3mHv67NOndwtzS55KtdQCJxx4aZLouEJUbITDUq6g286LrlvlHoJUOnxhzRRgxoRaDzAjKZj1NqoiEoKoZwiLHHjjrL8r1bXe/s3EvpmLY7I0Fve0UUciV2/92iT9ylQzsR6vaNVk6dqczhNnSUVl71r5Vb2T1tKVggHUS/pRId8v5V61EyoHzUuCZvj1zPtmYnW9cp+/NaxWqZYnWqd4IIJP6IAAgkfO2Qo9a0mOXBWAb6YwCeGKR//mrv7cbkb4ryCr2J9puhsgZu8zWyP+FheeS55FhokE0yWk4B8ApaG+AP0OBeuRm1e7klqTDaweOknpCDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by LVUPR11MB9787.namprd11.prod.outlook.com (2603:10b6:408:39b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 21:00:59 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 21:00:59 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Violet Monti <violet.monti@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Violet Monti <violet.monti@intel.com>
Subject: Re: [PATCH v2 4/4] drm/xe/rtp: Ensure device_oob_was only evaluates
 correct rules
In-Reply-To: <20260519193216.546048-10-violet.monti@intel.com>
References: <20260519193216.546048-6-violet.monti@intel.com>
 <20260519193216.546048-10-violet.monti@intel.com>
Date: Thu, 21 May 2026 18:00:55 -0300
Message-ID: <875x4gscjc.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0129.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::14) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|LVUPR11MB9787:EE_
X-MS-Office365-Filtering-Correlation-Id: 35af59ac-0b73-4e83-ed55-08deb77c0f82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799006|6133799003|4143699003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: nx1/qcsSo/RzimcuEF4ypEjazsftVTtpFdgYEUwtXid+OkODlybV00aoRUU20/OXjSbC1wGWuGJFJfj8wCZbkTR6DHJM7XFpZb/p/ysO1hH4SvituJYLYxz8AxhkaZ7ZP0t8m8N7sjgQUr3seQC8MyNykNYWL3WSJA1i7UkZGL7mwd6oGrDrZv8z4Of3kK3BoyyTWRp4VxEfcl7cGg+2LbFIPF8gZZP1jRWVy649EFZ373KP0iyMxRqo/5rQr5IvNPGlXFkJzmHdtaacZqQ15KoJZd2FFzLNKn3XgFvtamNAYQhYAvbnRDPQPWSDkGV/7MgWXS0wpBiHr3OP3s6tnR+o05J3d2hToQkB+5kGU+nwGjnnV1i43NJLbHRl/eDyujlSIc465tAjYs40MONauaMQo0uchqTgSgCCIJ8yOJiBZCtNAX7vH03H0CU7sYMwXRy4uN1NdXFH84c6PfvuHYPdWBBANAxGYoEgjZ63EFXfZT6D1qauEkQ4wRb9OVoNc0+zbP/9rGSI/eOgKS9xbhZwJiGnp7b5UhJVsJObMjTYYVNaxdgfkw683NX4+l081DO6qV9NyilcRrMDZwisLMs7AD3os/tIm3Yo2LGygvrsdMy5SgNVWxV7b9FuYyuGsdVVhNw9aRA8B6xuNqjiGkVn9KZDI72WxhRZ9QeLLsltSKfduWyPy81mORH5gno1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(6133799003)(4143699003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MthiuX8sNqht5jRLUP1/ELm+2RRejdHOKuX5H8pBwgGmVTlsodFfkVA1wM6T?=
 =?us-ascii?Q?ZTCZb35CrlIjf+q1DLHbC6whheAPthdxhpDBlGGF9OXIMOB90J0zD74+bVpo?=
 =?us-ascii?Q?i89lkUKVAM/DEpXpUmTwxjf7yBZOvs53PdRXCZCLkx1UedMhhTzb3InbGk31?=
 =?us-ascii?Q?w6chUjgY7cWNfrX3B2g0rKxbxx8jIHMVwuVRTiMRRSDaZHPtTZ46SoVyFDbu?=
 =?us-ascii?Q?FDxaLt/D0W6qfu/nRMYrp1vE0BVQSP7rU8v2plgkPVl3FoGXqCc2y6rqQxVL?=
 =?us-ascii?Q?ksSZ+oIiizyTtDuKmZsIkROvY/EUMtnmE/4LKTz6C2VmOaVT3o7HaBN2wZeA?=
 =?us-ascii?Q?rtwcMzE++imIvdDsNSe7uW+Atgb/bWTYfglVJfvl5vhdnZg8pXlexQBA48jA?=
 =?us-ascii?Q?Ai5fWxC2dHJL9Gg7Aq53zt7zbPXJRViAq/6WwtIqKRLstVEquAnC+DecCtn1?=
 =?us-ascii?Q?74uDL3/QISn3cggT7qONcZhf3ciJP6F+GIPgmyfx26UmnLO78+ZMNDwgWe83?=
 =?us-ascii?Q?lV9EByvaaiW5bgEYhF6DSWoYAIqcP5VB3HO0CrxDJIwbdZoXmKyVo5HXK2oK?=
 =?us-ascii?Q?3i2lr0xegajtAi1ZYu4zT8uVPx3WNZxbT58/nuTWHckiq2betJvE2u3HEEVx?=
 =?us-ascii?Q?xTCoWZE8uFbn6DV9+NMMlGjt7GhfLKlOziWxIIohVexWgTbrgcJ6v7tTuY28?=
 =?us-ascii?Q?Kot3LZw19JY4hpMEp0cvdv2m9QffL3Q0e6UH8YKLDcaIdoNaEcNx8VAkVX0q?=
 =?us-ascii?Q?VtPjtGlMDhPkiSPkshnofhFyScM0/HvmHABkvHmgY/5lyO1V9n04XzJRvcN9?=
 =?us-ascii?Q?PWyX4LQDMyoc6nSvz6YaZirJ7qE39FDTJu29e+0P7UgowaQkJl+cD3+u28uL?=
 =?us-ascii?Q?dPhr9Vd9proK8yRvXAjULKWI6+tIPlvzfF5kSU3BebcPYGS9kLiaYmH5pYoO?=
 =?us-ascii?Q?XsHNZIKDbLel6pXa0ZwwQYyK5unhaDFNk6YsJc0m1BS+ajBiIia69c3iVsED?=
 =?us-ascii?Q?y8a6sk0CQ1m8cQBCKNt/K2+WTUGMPlQjQ3PMPsrCRkzsMUqmkaV6oDzEjo5r?=
 =?us-ascii?Q?+5vwHPMzLZTWM+kgxMPnBgXonDb21Kn2IoO8APE4WS36pbgcGAGAOG24Fxm6?=
 =?us-ascii?Q?hjKbHzfpNCbArI+oe3lL39l36M/tIbkQ8qFaWIuoJIlTAehRfLdKKB8vX08x?=
 =?us-ascii?Q?HmWJa6wNQ5i7E3j9FMRdWboi/NljLR9ICF4NirfTpuwVuRBM7EEZ7bmVp75r?=
 =?us-ascii?Q?/FdTyZPvBXid+I06wn/Xe0fH0bX66yM9XmnMJ8p3SxUq4Vt7Y4JL/jmBhPuo?=
 =?us-ascii?Q?LJqXYOJgvwYRO9Uj8fdM9nonUob97o286cfyHQUACF9ij2NU4zF/IuyiTNz8?=
 =?us-ascii?Q?7WJiTkezjcGAXJl1gyLvA4zr/SDiL2YS7fdrC36TqWPxNRU/8dGjqXIo3Yny?=
 =?us-ascii?Q?4C1YrN/AWlCNKv+WqSfBF51VT/eHaTriSUCjPp2KSaSFhwmihsRHKTMjFYrC?=
 =?us-ascii?Q?sZlIUlHY3UHPmmMBMmZY+TkmHh6G9S22+rcxmkghzT57/e+cLFGiiFqrqdAf?=
 =?us-ascii?Q?hYaP5dDnAgktWuirpgOUO/c/sjeQjUBoeDa2O5jSS0eYqLZdjGECDKdXET9X?=
 =?us-ascii?Q?2IjTVIKw2a3c0dKcn4iUcbW2u+lqLp0aT3S6FMv4yeODJ/GFKuh0t2tMZj7d?=
 =?us-ascii?Q?jmM5q0BklCqtPQgykYkQMV0uF3gJDzj9Gck5YSZ++kwMvEqs0GB3XjbwxvEO?=
 =?us-ascii?Q?ECP8SwBzbg=3D=3D?=
X-Exchange-RoutingPolicyChecked: lKwqsVyKgu/BrOoLbbv9wzIiOSGjWZQ/ziz7at15V3+TEQOxRdFtcZHb361jq8K6QBTFzJnES/dnsTlqZwsZlPmaNvyqcTSQB61Rz2k/Fs8RbL4ZZETw5D2zISJSIUd66vR4Vgo1/8MP0TXLmw4OcxjbBzHV7xKNSr3+Tj/HL2z+ksCXQJL8Gh+JTzI4jXgLn74yhBc4pnmAlZklBaSfEQ5gVHYGhq2REtbIJZqa2+okv2R3GbH0lsnUDYyQPkyz+IYJYK6eiJ061bzSLLZ03W4psWz2qLa/BIDYn08XbMOMwQCTMhcm9x3tpPvQ2BCC79aS96qeATNNi7XVHX4Caw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 35af59ac-0b73-4e83-ed55-08deb77c0f82
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 21:00:59.8386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YyE69zM3BOYvOfmSk2FFDg/FjB5vcEEBUOK7OtR4hGBt1sDAOB2nB2oJVSPqxNon24AYq98eVIye1b8T9Svnog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9787
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

Violet Monti <violet.monti@intel.com> writes:

> This commit builds on the implementation of the GT WA testing, increasing
> the scope of testing to include the device OOB workaround list. As well
> as checking for XE_RTP_ENGINE_CLASS(), this test also checks for rules
> involving XE_RTP_GRAPHICS() and XE_RTP_MEDIA(), as well as their
> derivatives.
>
> This test will raise expectation fails for any workarounds in the
> device_oob_was list that has an invalid rule type, preventing evaluation
> or inclusion of rules that could be applied in the wrong context.
>
> v2:
>     - Changed xe_rtp_table_dev_oob_test() to follow format of
>       xe_rtp_table_gt_test
>     - Changed device_oob_was generated params to follow format of
>       gt_was
>
> Signed-off-by: Violet Monti <violet.monti@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c | 21 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wa.c                    |  3 ++-
>  drivers/gpu/drm/xe/xe_wa.h                    |  1 +
>  3 files changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
> index eb1b3ee075c9..669163e52ebd 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
> @@ -54,9 +54,30 @@ static void xe_rtp_table_oob_test(struct kunit *test)
>  
>  RTP_TABLE_PARAM(oob_was);
>  
> +static void xe_rtp_table_dev_oob_test(struct kunit *test)
> +{
> +	const struct xe_rtp_entry *entry = test->param_value;
> +
> +	for (int i = 0; i < entry->n_rules; i++)
> +		KUNIT_EXPECT_TRUE(test,
> +				  entry->rules[i].match_type != XE_RTP_MATCH_ENGINE_CLASS &&
> +				  entry->rules[i].match_type != XE_RTP_MATCH_NOT_ENGINE_CLASS &&
> +				  entry->rules[i].match_type != XE_RTP_MATCH_GRAPHICS_VERSION &&
> +				  entry->rules[i].match_type != XE_RTP_MATCH_GRAPHICS_VERSION_RANGE &&
> +				  entry->rules[i].match_type != XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT &&
> +				  entry->rules[i].match_type != XE_RTP_MATCH_GRAPHICS_STEP &&
> +				  entry->rules[i].match_type != XE_RTP_MATCH_MEDIA_VERSION &&
> +				  entry->rules[i].match_type != XE_RTP_MATCH_MEDIA_VERSION_RANGE &&
> +				  entry->rules[i].match_type != XE_RTP_MATCH_MEDIA_VERSION_ANY_GT &&
> +				  entry->rules[i].match_type != XE_RTP_MATCH_MEDIA_STEP);

Hm... The checks themselves look correct, so, with VISIBLE_IF_KUNIT
dropped from the extern variable declaration,

   Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

That said, here is an optional feedback: I guess it would be easier for
the developer to spot exactly what the offending match type is if we
used one expectation macro for each? I.e.:

  enum xe_rtp_match_type match_type = entry->rules[i].match_type;
  
  KUNIT_EXPECT_NEQ(test, match_type, XE_RTP_MATCH_ENGINE_CLASS);
  KUNIT_EXPECT_NEQ(test, match_type, XE_RTP_MATCH_NOT_ENGINE_CLASS);
  ...
  KUNIT_EXPECT_NEQ(test, match_type, XE_RTP_MATCH_MEDIA_STEP);

This would also apply to the previous patches.

--
Gustavo Sousa

> +}
> +
> +RTP_TABLE_PARAM(device_oob_was);
> +
>  static struct kunit_case xe_rtp_table_tests[] = {
>  	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, gt_was_gen_params),
>  	KUNIT_CASE_PARAM(xe_rtp_table_oob_test, oob_was_gen_params),
> +	KUNIT_CASE_PARAM(xe_rtp_table_dev_oob_test, device_oob_was_gen_params),
>  	{}
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 410099545f4e..635d5461f712 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -815,10 +815,11 @@ static const struct xe_rtp_entry device_oob_was_entries[] = {
>  
>  static_assert(ARRAY_SIZE(device_oob_was_entries) == _XE_DEVICE_WA_OOB_COUNT);
>  
> -static __maybe_unused const struct xe_rtp_table device_oob_was = {
> +VISIBLE_IF_KUNIT __maybe_unused const struct xe_rtp_table device_oob_was = {
>  	.entries = device_oob_was_entries,
>  	.n_entries = ARRAY_SIZE(device_oob_was_entries),
>  };
> +EXPORT_SYMBOL_IF_KUNIT(device_oob_was);
>  
>  __diag_pop();
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> index 7ac6d365b65f..568e05e49bf9 100644
> --- a/drivers/gpu/drm/xe/xe_wa.h
> +++ b/drivers/gpu/drm/xe/xe_wa.h
> @@ -28,6 +28,7 @@ int xe_wa_gt_dump(struct xe_gt *gt, struct drm_printer *p);
>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>  extern VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was;
>  extern VISIBLE_IF_KUNIT __maybe_unused const struct xe_rtp_table oob_was;
> +extern VISIBLE_IF_KUNIT __maybe_unused const struct xe_rtp_table device_oob_was;
>  #endif
>  
>  /**
> -- 
> 2.43.0
