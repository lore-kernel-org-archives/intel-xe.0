Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EDCC54E5D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 16:41:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84DD610FC06;
	Thu, 14 Mar 2024 16:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pdc7Zbkz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9995110FC06
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 16:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710434503; x=1741970503;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Gyt11c1UP5yv3ASt1ec1NUdbkvTgsYsykmrbo3bjMps=;
 b=Pdc7Zbkzoz/hjHRro9a8i9dQ0dCIEb6ZDEuGz09PUeuR2+QKYhjoTC2R
 F1bMqJOXcNSwnX6Bbo6uVkVsW+4ZaiebGMY7Po4Z54BRDhqWn2+plilYX
 R8RN8RNH3T9f12HXz0w4X6zRKAnuwLIWBUiXIh2AYjgM0fa/OWpe4tto3
 mU7ZGS+dfVX3N7ktMmmmXpTq/++dXLsS2QeX3MyQ9zl/qxYdlW7aOrKhm
 TpRfJ5KwKdZgwyaR4XMD6TItL7eKA7We+2d5uNzLZO5YQhWJYEUqhJs4g
 rW1Ys3YKe6EKWZwn70An3grd8v6KZbFzsrUO9Ydb834fsbUTBOZ2/TYxN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16422059"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="16422059"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 09:41:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="16944233"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 09:41:38 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 09:41:38 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 09:41:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 09:41:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 09:41:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDWqQjhXhq0dRgeCZ/tAx3quR79j977bvIYjx6pArAbASZxmFkOZ/xfXAXW4Oc7+4SLzXGaroUCtlw2/G1lSYwR2nSwvKSfWZY3ZfRKNwYPthBGMCrvxjwW0QI2bhrrTv/RnGrIUlQ4iudVzh1twec/DHDlQsXox8SPy2VwPYzpRrZSlQw7h9cJE1ER+oQ1FE0wjr0CXKG7xS+cUIaBZ4tq1oxUd2pm7/T3SrcKp0R3Ci6ZCqee+0cct+mQjeaCBCtg8SrjF8idXRAfvVGyZUD4hYcc44cnLBIqHoGtJXT4/LqtetrCGkujveE5IF5HT2wv4tT1yy+AocdzlIUO2dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gq/fN9FnknKJJXkGM1bQyjaDabNpyrG9y+B0rYE2jk0=;
 b=Q5RM3lIDimkK160JG8SU8Zg3gb0YV9nzNsH7Gi8RhrnmSHKLdDlHXmJUQv5gOFEL+ZGbhsiJFwbWYbAFzVVLTPMwSZuXrTPrTDO9A4tsP8C/zzaVmqmACUApyswooa2CZixgCwK1NgMaHRcfAkLvvLXrRd93+zH+vyKKv2x01MP18of6hIn8WUkGHF5UBmjOLWSBuivVaBFBZ9XIAue29ux02vJBnwUB2tAVBF3NTGekNKyOadvNeDNJe7PWPB0jOcnZF5XHDHgmSP8bR6VtBvlIOuOuTToRWLaJlx5BkY4ncTS0TuWbwrc0HAf7KWKnuMk5LnpCuxUInIXpLJYg+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8364.namprd11.prod.outlook.com (2603:10b6:610:174::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Thu, 14 Mar
 2024 16:41:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 16:41:35 +0000
Date: Thu, 14 Mar 2024 11:41:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <ewelina.musial@intel.com>
Subject: Re: =?utf-8?B?4pyX?= CI.BAT: failure for drm/xe: Refactor BO flags
Message-ID: <lvcwvxxew4wcylvs6e2hs7jcjuiyx222ufhuk64heypauvqs5r@3vav2uii3cn6>
References: <20240314052619.2628396-1-lucas.demarchi@intel.com>
 <171039791262.753907.1073892033267196048@8e613ede5ea5>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <171039791262.753907.1073892033267196048@8e613ede5ea5>
X-ClientProxiedBy: BYAPR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::40) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: 373b7e35-cd15-48e2-d238-08dc44459cbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OWE7UB2IHL3XpZuSB9VDOr9wiKUWUqF8mziSd1KUkxKEq1lHqE6IvgWquugkqeWCEUbQnrr+W9HSU8Gm/eIP36T7rxIG6SaUitTnQ9kMZUn/LaIMiIQcVzYB0n6Rj2RyDELDnSNODXHZBZGOXGrLP+U7vgnx9ldK8RzNF16NjFyAxSxig4jDwW1wnyRP4VO9o5jKub2YqvyOiZtxdbdBTZiJeNGYNE/SLsRj+0QyXJ14vBWiZMP4/Wrykt7lfHoJH5xksyfLkqRsmmJfu4NLYJQsgv4NUwNW5tzCqHcbzlB9mJFRLnVM1gKKAWcI4frWNfUQy7i0/ykWfV2L0YfJu4Iy5RaF3hEdF6RLxUIrGGpPuSi/c3T8D5uZAU/SNTXH9ZD6KpWXEokLf1SSppRdDSl7jaqZJLUj3fAoUQXB5c/180bDOBAWrR8E+Xq1POCyh4pKF400vnKw6YbG8W463ScsVE1/o+nzKTFSgn0ALPHezpj8nxu3aP8oT2FYeJ+On1PeQ3fA+eelzBL9DrR9ErQPOsRa1H3Cd7M2i1l2aVjmr3Jy4CwWYyen4xKdxy53bmzUVUTcIM9zn9wS52sx7jP/F3x/M9qeZwbZU+0tXpA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XhbFPhB9MyFwLPNBkG9HWamZMWmsQBRwpOtKpgAHc530oFc+VNBEpNZxTH4v?=
 =?us-ascii?Q?5OS7Xx1AWQxLcJRv7OkzcZ/+KdHv1L1GdrgQrCMrfaJxUE7oLZB9uzN8KRRl?=
 =?us-ascii?Q?Vs7MjlFiBuBaEbZTKdxwBCjCt3Ap54aaHEOPl3dL7PvyNMSw1rFvD0SjhOTA?=
 =?us-ascii?Q?C8ys8oLjjzPxfI6QbPyqLbii9m2Q2XD+9SVq57ngaibO7Lz/Bbpw3p5UScDI?=
 =?us-ascii?Q?OgJ7rLtDOsKRLSeRk9EN1WzDAL4dbn4tgYJaULKV0nXCBYs8nH9oiCEmALAI?=
 =?us-ascii?Q?8Ds6Zdjz6vzDtqX9sgtU3m59Os/PHxr2TEqUMuJUZGHEaxvIC54yeL6Dg6k6?=
 =?us-ascii?Q?r/9Ou3PqAqX9alx/OefSVUwpOi3vqWDzgipWxRvnG1RyvVKzkbNY8H15wqya?=
 =?us-ascii?Q?I3IjO7EMsJIN9TAB2AyQ8676jO6nYmOrFnDypaD2p1dQB33V1ytTC/px6IJX?=
 =?us-ascii?Q?IjjuRsL0EUXcyFcOm8ccfMSAyT+SJuB8lP6MLPRGk5NDXRkAsofsdaGCRswN?=
 =?us-ascii?Q?ckJoh63728ax46DPnkyRx96dAZ7b9XjEELCikqetjCYdmmcL/BYfuq6hAYse?=
 =?us-ascii?Q?rFNNfLJohWE+08WA14yKsZIhsXmWd5vxjK2iDk9u8/QnYo/t42YJ85X9EuVh?=
 =?us-ascii?Q?KaLT7Vit9hywDAG2HsAjR7ZxWSVmlIT937lOoBgLK28bmoBIYmQKun19V2G8?=
 =?us-ascii?Q?9l3njzQMPiLDOEgq/wuVgKtKllKGdkM6+hFRRJz1bTaM5wp9yfX6eHMngO5m?=
 =?us-ascii?Q?SaCGw+1LVwYd7E0P8AkzV36wMG5CQLfmIFVzVrYzbuqPd/Nm8I/NgswKgr92?=
 =?us-ascii?Q?ZmauxdWb4PPtBC346DxKlUZ9r8aRgs4s6si9yV8F/AgG3KqtxorEfDxnNNV/?=
 =?us-ascii?Q?LpDsReVXIQKZCQ2DLrTqVxWWHcboFr7YcHMB3PtfkoAuas6O0A6nODiatgVn?=
 =?us-ascii?Q?y1WJsQCZZD+iSplc8h58R3dlewY7ufyqhfYODu26mMEnNNaNtL9ITXbA8tcf?=
 =?us-ascii?Q?i/wNss1iK8fhBiw/uEOD/+Iu0dd82QRC45vxE0Y72rJtTXtFDuBxjgwJfE4I?=
 =?us-ascii?Q?Kv8OUtIu7q+sRRzmgzXPSkC80J6OSgiNb51AaAMLXOfVmKDBL6R7yWDSztfX?=
 =?us-ascii?Q?guUxX9JeKQKGLit+5mQgCZHpKx9tociYeUG30vnQ6BzGvQnneC/0zC4zYaQe?=
 =?us-ascii?Q?/J7ogJwOczJQ7/pp+DqeFSbgomEhLPX09GEuuZi8ikLsCCZzQjnytX89Rhff?=
 =?us-ascii?Q?CEjTQJ1ztdjHuihpRL53JT1DHknybJF9C0XvkUpbHBfXOufQQQu3SgeJvuWZ?=
 =?us-ascii?Q?MsVsF4ZVeMzhN8qX6ZjahSSV6Bkvbd26UUODmy0UrwLlw6F52otY349F+csj?=
 =?us-ascii?Q?wBj3wPGbRbPO8CuEO1UVlNQditnDPHKdhDgSjdcKIdaV8aPjMtp80t0ui5NK?=
 =?us-ascii?Q?Rhjw8hBiCNjP2DUDNjKdZHQd5vOIgAzC2jDv/AepV19ac8yjEJ4RTifTOtO+?=
 =?us-ascii?Q?S4QzAsZgZqNsNugF7SEpQJYMqG7005GDOViF1okSe946iT+2ZNmm5zU5yg1l?=
 =?us-ascii?Q?HaAuwWUpR/0IN7AkQY2gF7YN3JseNbZFe3y+NPsLVTT25MkcxfD7GIctoBvA?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 373b7e35-cd15-48e2-d238-08dc44459cbd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 16:41:35.4206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXfosO0ieesdCZqr6IXyK6euLM46iC1ud6Y7H7RcjFfmzc1Q7PeCucQDKJCIGDI7d76YC19cBLJojbnkkn8lgPFshrUHif5YQnXtciUqXNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8364
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

On Thu, Mar 14, 2024 at 06:31:52AM -0000, Patchwork wrote:
>== Series Details ==
>
>Series: drm/xe: Refactor BO flags
>URL   : https://patchwork.freedesktop.org/series/131120/
>State : failure
>
>== Summary ==
>
>CI Bug Log - changes from xe-938-96e47e3f3a5952e104d56352872becdc0048d26e_BAT -> xe-pw-131120v1_BAT
>====================================================
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-131120v1_BAT absolutely need to be
>  verified manually.
>
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-131120v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in CI.
>
>
>
>Participating hosts (4 -> 0)
>------------------------------
>
>  ERROR: It appears as if the changes made in xe-pw-131120v1_BAT prevented too many machines from booting.
>
>  Missing    (4): bat-pvc-2 bat-dg2-oem2 bat-adlp-7 bat-atsm-2


Nowadays don't we boot the machine  and *then* try to load the module?
How can a change to the module prevent a machine from booting?

Lucas De Marchi
