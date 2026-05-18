Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C1ECD4F4A
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 20:54:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA89710E348;
	Mon, 18 May 2026 20:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JFWOuPyj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBFE410E348
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 20:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779137677; x=1810673677;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=zDJfbBtJOfJjNa5GDH8COmfKQg4Z3A7/Z2MJabbTk0M=;
 b=JFWOuPyjoaxOjvr1lwguv+J7/6lm3YLelXmWqGH4QzLAWxSWxeW04+6J
 wnNaSgY+H8XyHfHefeGKkg5Mf9pBuUCifQOgERCsHXIMP+ISue8DcQR7Y
 6J1hQYnphvehYCC40RNpX0M74ud13MZp0f/TKmfcFGgQsiUaESfS+/snt
 aiUzZslep3LlA+NZGLig0M1K0lDhw2Qjp+Sez2Gjprknj0z6dPeVgVWZP
 mVo3qZM7qIkZxx7jDlMT/D5zbhFi2kyY5g41/7muiVAj5+R/ME2O1tuaQ
 Jx4rPiak3Bgn4x4t5jsS4jhtGgl8zjzGYSZaFQLjwacjUR0yBMmBjsQzv A==;
X-CSE-ConnectionGUID: LNKeJcS9Raq0flk9p0jxgw==
X-CSE-MsgGUID: GlRYf+mKRh2v43SpHRtzXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79144758"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="79144758"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 13:54:36 -0700
X-CSE-ConnectionGUID: G3kqNlzmS06BRUQso0O2CQ==
X-CSE-MsgGUID: 19OQrQxwS/mlnMT399eIcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="277655094"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 13:54:36 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 13:54:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 13:54:35 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 13:54:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6o35zDyuGNvQHDGU8BxkFru2MQyJvybp2kw+s4pYCJDxq0oXdt9xU6EE602exO3Mt3ME7YQQzxkDnAkhgFqC5CgmYsjVtO0/vNbZMSBh0cGm3opGiMCPDUU5fzTrPanz/ksQPgz/CJEh4Iaf8RQnwdjvqOHYzPO6HlVm9X3yZ57lLBM97bdpaqskBznfy1BJTEKQHwljahaGzxEmDX5UuAZM8v0HmE1wRzwXxRIiTJEiFFqbvnrZqS5CQukIkqrOif2TJ0dzzrFwxf0veNpwwvii755abbtTZW72vFC3Ezj1HtLXd6UV4fmToA7eDhfEx/x9wI1hnE94OCkvnG/Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DoSpW2+7W08IBkjvDUu/ep+Tg9n+IRn+sNKfB0dv3TM=;
 b=GhvXhxuARYRN29gpfE8Mad/IB0uh0ckFkgkC8CXNDiDsS6pd8Q3by4QTWxvZ/CBxrXOzD3jty8yK1Nr6/IBbCmM1AfAkc8WooSSQMUbNVEI6tdA2pojuOqXZ1M5y0pbLSDEqcskJe1+QFE/h8yHWFwSmFJa1ccTjPTB5Z5QkzqXJ6ojeGOqrdi1RFjY5YuZ8aCtskVJViwcpVhWFOuWwMwD1lLMQ/nch6mZwTQFKjdA6Qm9Gzm+iXWNMF7zrtWhgUqhlp6d/xWl6WMnGTGf6LOaQqlLCUw8yw0GNsiuTC3UPJR1vPv1mxRas9Pv9VIoPYg+gssrf7lLKIZLS9O7PNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH3PPF9E162731D.namprd11.prod.outlook.com (2603:10b6:518:1::d3c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Mon, 18 May
 2026 20:54:30 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 20:54:30 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Violet Monti <violet.monti@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Violet Monti <violet.monti@intel.com>
Subject: Re: [PATCH 3/4] drm/xe/rtp: Add OOB WAs rule checking
In-Reply-To: <20260513212129.691628-9-violet.monti@intel.com>
References: <20260513212129.691628-6-violet.monti@intel.com>
 <20260513212129.691628-9-violet.monti@intel.com>
Date: Mon, 18 May 2026 17:54:26 -0300
Message-ID: <87zf1wqvzx.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::10) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH3PPF9E162731D:EE_
X-MS-Office365-Filtering-Correlation-Id: eec2e2d6-e9a0-4574-1d5f-08deb51fa806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|11063799003|22082099003|18002099003|56012099003|4143699003;
X-Microsoft-Antispam-Message-Info: IUDWNni1dxhLH2rNCTCE4b7vWH/HGhluuNJnBtnB8PctD6Rnj28ARWqWD8HufQfiNH9XwhVbV2W4EXHHTeA3Gm4PYInENMPqfoGMRS7+RmiIrsV40festBGO3w00CnQEDi6ORhpCTbdBtAH83VQv2J4Sk2UPKj9NsMZvoGhu/iGm9QpyECDF+7M7GxusN6fMn/n2iUHgcqtJtMv9iNLv6gT465TC/f6t0cDpOr9kLlJclIEqBGR5j7NbgNqgnp6Sj8Tq5zssKLoZFihFT27x3R2oImNR8H4ONXF2265cEe5/QTQuBY85DwXDjg6stcDLHHJl6P0iD0FoUXW4Mg8ZW8w0Y5mK7GrXgg6BEYGmeEdjxP0TmhNwKsFOP7tqBOit80P6jMklPxTeuFrFjB8CO2hNTxantoJkiE0jl2NUvKMwbZ5paM68Su5GH0jkIp+Ke320qHD06LrdiWRlfarYw1FYTYde9pfHqGCjQpu09C8LBfxAcfXOK92Iyvi8Pk6hrFe237PiiQwgEL33M2UMGeoa6Xzrh0FFlsh0laESO61Q+k1d6xJIKexifJtuBD5I5gACZsuOd/fD+FZqPX4OaODMmUDR80OOqSduO87LKenzJ6qDvrjbeC4/f0eIyJRsQuu0c7CvzYQaolpwG6ZERkzG6sFOLOwqqk4cLVRb5mO7/E5+3riOMcpaz8L6nHv4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(11063799003)(22082099003)(18002099003)(56012099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yK+hQqVmZZRgM6sDzATk6l5Yw73YQinmk5H4btnepz06CvwSAedIgEGXJNls?=
 =?us-ascii?Q?0pkPGsvY3+ceF7VctRyKefCZQQ9ZGDvFN1zf7J9ke2FivAN6zq+YpKA9x0Eg?=
 =?us-ascii?Q?UpqiojadxOytiqsFLfKrUnEXRtTikCzi3KxGXZrpDa9HR50PVMyVTDFmyF/A?=
 =?us-ascii?Q?sC/Lm11rQQMV10uHf5AoyXXjTZ/42lGL8dcKNuH7cPHBShRw4o1/E6vLb0Qq?=
 =?us-ascii?Q?aZmAsrloCnzdZryuUmLCGUrBzZqvKDP7JNgttHNeDe7LIOxz+Ezyz8hOoNXw?=
 =?us-ascii?Q?9rts3cmWlH6kYF9SFRj0L/Jv54PQBkczC3F8Pe0Fw6y9vHiRxM0/wm29WlTz?=
 =?us-ascii?Q?KlPAGzWNDPDiNjgkpxnTkAHkOIskfqcWmNSNRXoZF9/C7swwVT//jfp4FKk9?=
 =?us-ascii?Q?qcIwECBR11IPlDBNskAtM4Ye2AmMwWFf0ZngIXdEBYDh5FMLSIM90qXv6Rsa?=
 =?us-ascii?Q?GFQvPsQDbjphNxn+yTx3UaMd3eQ/tdmcR+5NuimfbGilBhUd71xXe6Nay1Dp?=
 =?us-ascii?Q?VxXk8zXhs/OCHc/TjiNgT+UGhCEasg8rfHE0aFJBeVKeh9AQryV2MpijCyJB?=
 =?us-ascii?Q?fJbRY7xQ7B7mjvrk3/u81/zprWaTvil8hBo5s+h/sNYYXnpK3OgOItv9SmVS?=
 =?us-ascii?Q?d38qD54M2/8N6qvr4sspXkxv4b81QRjyFzXzrTYznricZawlAojVQ/vjhXKV?=
 =?us-ascii?Q?fR9rgZCMAp7nf8geC9ZByuz/cKA5OwTZKvdH6oxixCEZpvRou4H3xSEWJUXE?=
 =?us-ascii?Q?7YLp3nwkLm62orDOFzhE2LPXySviCKoc3XOv0E+n+KYUaKwnP4FrJXzOGTfV?=
 =?us-ascii?Q?znSqOc9yrhaK6aGNcK6yF0cjL6cGh7Xxb021P9LsqRE/0XaljV319KQ5BI/a?=
 =?us-ascii?Q?QsMWrbGgQIt8D0JJ4+HW3De6QqCZTd2x+HbfXHBKFwK2j8Ve8Nx38PNw5dhL?=
 =?us-ascii?Q?KfzJYBNqI4J2QFjPHNjaqtiBML7r4h6M5GRjuyiE7KDBWUXv391NGbrcG87L?=
 =?us-ascii?Q?fIHVQh0/Tp2j71CNsw0arbXu/hWjTTw9reOCnsb0NmlSRGkMtClHKszEZD/6?=
 =?us-ascii?Q?ls6Q8CsUCO1n8ybiXVYu4rSzPDPIeq0A1KWG8M/LPD08yfSnlqvJQ5kyhCUQ?=
 =?us-ascii?Q?3sQo0zBwl+LIjFvuPbHaOv8IcKWQUwosdUzA1QgdWcqJNKV0+arq0VBqJ3jb?=
 =?us-ascii?Q?A+AKLLLlrYQl1ehA1uZpLRs/UGtsPvaPOpVZseuK8dMUT6errDymmYxtZNAa?=
 =?us-ascii?Q?Pc3K+O2jxiB9+L07O+/7PkjRmjFfChAOBXKXTXDE7colTShfK5FgLDgX1V3e?=
 =?us-ascii?Q?U2gY8zrOi7c7Q35eAsRFXf6pvE/gK6gBh6qMI+zlkcRrqVju3Y1Hdfnjj5ag?=
 =?us-ascii?Q?EcP9sWvfwNrOZ7EuzwiuDMv14ha5TzTFVtqncXJkxvmZnKIj2afyJmHxEU21?=
 =?us-ascii?Q?Y0JJE6q/d6n4QoUeKcOiu16niq7nw682SkQzEKEozCGN36aS6WPl8y2zSLmm?=
 =?us-ascii?Q?VuwQDEkWppqzhHkVp0EnBf7A5jz0Zz/GnV/eRFcYCiZ6PsYZ+7p/yRA1ZIeF?=
 =?us-ascii?Q?v8MGkS5JxOvws8VRMLzqnfK6Rjwe+oLb7N1p2AP8bpgSKrwYw3nPypBP9XJB?=
 =?us-ascii?Q?uwmoUqaVOglozPbEosyTTASnTXhdXm6dHm86mvzr21IMlbUIO4JU/1V6QEtc?=
 =?us-ascii?Q?jwwgND42gr17Xm2hp5z2XoKGHhjzAfEnkmX4r+0Tl6y3inH9BTgI8gJiRxGb?=
 =?us-ascii?Q?MsiGIb7Uxg=3D=3D?=
X-Exchange-RoutingPolicyChecked: bL0a788I1AZrE72y4aJSvawFI3HfhVl6XVSlneCtq7YJGA9p20zV0LIa8OuIb/iypKJJhfPING0WjThr3zaN4oNBPiONDuSdYpeHJ3KTr+ZuHD1ihe515kjU3ZKN1ZLtBpWWkED0VrjU3myq7Gvr+ZW1cixDyvcBf8V7dTXDDjaOjGiKj7kIF7GDf6yjoU9NMRK7P4yEieMp0L4Af04H8fXTH7ztJtv0P2JfU5z7QaXAxHp5olbhlOQXJIEmxRZGFIAcH8yElmXTYdVVrP3fnMG5u5+AvhwHvjnSb8s+1jEbAPRzs1xMXC5fAf5ZG6POccyaCq/auh71rMCqI/cOXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: eec2e2d6-e9a0-4574-1d5f-08deb51fa806
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 20:54:30.2018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PFF2t4NuAIvnnLk1VS1dyAkXJyhMrYgVlEJmml+q8/B47/huYrtKGyJ5UFTaabwFrr6BTy4ckRx2wGOydvxUNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF9E162731D
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


Same comments from previous patch about commit title and body applies
here.

Violet Monti <violet.monti@intel.com> writes:

> This commit builds on the implementation of the GT WA testing, increasing
> the scope of testing to include the OOB workaround list. The added test
> checks for workarounds with an engine_class rule, and raises an expectation
> failure if any are found. Unlike the GT workarounds, there are no flags
> within this workaround list, so all engine_class rules will fail.
>
> This test prevents future implementation of rules that would apply an
> engine_class rule without an active engine in context, preventing rule
> errors or mishaps.
>
> Signed-off-by: Violet Monti <violet.monti@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c | 20 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wa.c                    |  2 +-
>  drivers/gpu/drm/xe/xe_wa.h                    |  1 +
>  3 files changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
> index 100cac379b08..eae3262775bb 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
> @@ -24,6 +24,18 @@ static void xe_rtp_table_gt_test(struct kunit *test)
>  	}
>  }
>  
> +static void xe_rtp_table_oob_test(struct kunit *test)
> +{
> +	const struct xe_rtp_entry *param = test->param_value;
> +
> +	for (int i = 0; i < param->n_rules; i++) {
> +		KUNIT_EXPECT_NE_MSG(test, param->rules[i].match_type,
> +				    XE_RTP_MATCH_ENGINE_CLASS,
> +				    "OOB_WA %s has an engine class rule",
> +				    param->name);

Like with the previous patch, I think we could simplify by using
something like

  KUNIT_EXPECT_NE(test, param->rules[i].match_type,
                  XE_RTP_MATCH_ENGINE_CLASS)

> +	}
> +}
> +
>  static int xe_rtp_table_test_init(struct kunit *test)
>  {
>  	struct xe_device *xe;
> @@ -61,8 +73,16 @@ static void rtp_table_gt_test_desc(const struct xe_rtp_entry_sr *t, char *desc)
>  
>  RTP_KUNIT_ARRAY_PARAM(rtp_table_gt, gt_was, rtp_table_gt_test_desc);
>  
> +static void rtp_table_oob_test_desc(const struct xe_rtp_entry *t, char *desc)
> +{
> +	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +RTP_KUNIT_ARRAY_PARAM(rtp_table_oob, oob_was, rtp_table_oob_test_desc);
> +
>  static struct kunit_case xe_rtp_table_tests[] = {
>  	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, rtp_table_gt_gen_params),
> +	KUNIT_CASE_PARAM(xe_rtp_table_oob_test, rtp_table_oob_gen_params),

Yeah.  It is unfortunate that we need 2 different functions here.  I think
in the future we could try to have a single way of expressing RTP entries
instead of having two different struct types (xe_rtp_entry vs
xe_rtp_entry_sr).  That would allow us to unify code specific for
processing rules in those entries.

--
Gustavo Sousa

>  	{}
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 285072fe0a47..5744bd3f8be9 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -802,7 +802,7 @@ static const struct xe_rtp_entry oob_was_entries[] = {
>  
>  static_assert(ARRAY_SIZE(oob_was_entries)  == _XE_WA_OOB_COUNT);
>  
> -static __maybe_unused const struct xe_rtp_table oob_was = {
> +VISIBLE_IF_KUNIT __maybe_unused const struct xe_rtp_table oob_was = {
>  	.entries = oob_was_entries,
>  	.n_entries = ARRAY_SIZE(oob_was_entries),
>  };
> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> index 17dff615e507..7ac6d365b65f 100644
> --- a/drivers/gpu/drm/xe/xe_wa.h
> +++ b/drivers/gpu/drm/xe/xe_wa.h
> @@ -27,6 +27,7 @@ int xe_wa_gt_dump(struct xe_gt *gt, struct drm_printer *p);
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>  extern VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was;
> +extern VISIBLE_IF_KUNIT __maybe_unused const struct xe_rtp_table oob_was;
>  #endif
>  
>  /**
> -- 
> 2.43.0
