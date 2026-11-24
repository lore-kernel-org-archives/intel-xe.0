Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57A6606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 23:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gl+vOSVq;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=LcCNGR0L
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D25C10F8DF;
	Tue, 24 Nov 2026 23:11:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E2410F8CB;
 Tue, 24 Nov 2026 23:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795561876; x=1827097876;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=OTLSX31+azdhE3ATmNlpSxyD0JtdKmX93g2EX/z0pVc=;
 b=gl+vOSVqwTDvZ20W5yf2AvrNR/7kVCj8UoVQvYK+PuVA/OwT9UnEu2FF
 sezli1tp43bkEe8odBRGtgVAhBziXSWVy2yDUgQDoaLIa9fug2A2UvloH
 ieImtFi4PZ6op+V8AYfWejXvKzOCYKyv/v6o2zgIc5AaEjzYCkSJwD5S+
 Q6a90u/Qstxs0cXoCfgwxDhfRmopCzQXHiTBO2+fVYUHxj3Sqvvp2+eCJ
 +Xshf+C0X5Xk8//6VG/k1HNQWBHakSKdDilDo0o+z67hX7b2JE+iFnBCx
 +WP9OWHYbruHiOZlWlNJ8BoDjB/RN3xc1NM9pHn/rXE0kmTOi2lGXIE9z Q==;
X-CSE-ConnectionGUID: nQdxVQABQt+K+0cAaTbQ2g==
X-CSE-MsgGUID: OIFHhUnuRo+M/f11Lm05Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4441481"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4441481"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 15:09:38 -0800
X-CSE-ConnectionGUID: I5U4ou6xTkG/z3OZa8CR6Q==
X-CSE-MsgGUID: O222NRWWS5WrE7Q2e/xAaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11487515"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 15:08:05 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 15:08:04 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 15:08:04 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.16) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 15:08:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YCH8OowBwL2aX8RaWV1zQiQFUXQ32J0nhu5jcp21xdv7Pf25bvCsaroWt1X0Y7IzLPCdMwWBHc7eshisL7tfsCP3DTrQvql3lFYLbueNGMOb0WnO/nXvlQSaE0emlk7t2QAXTi27w9LeOB3XY8gGfxKzZvzy6F7BkstlU9oIbdyUWBPWonJ/pwKxAsO7Myv0l8ptPKl/XJqduIDoU6rcX19kNn8zfIEIBY7Rhxm5HDgb1RQHOtqc/f/aM6DKwUrWv2cWPoYXW64IUfBRtK4vMBDjU79Qd2ZGQmhqd/jW2ST27ACQUPqQwS55novYQ5F5ifJvyJsI3FGqDBlH+MEI/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvwcDyVuMsol9UdRyEY13Pj/Ecm91G1juuW5t+GBsv8=;
 b=c7ZHa1Tg6t0vPXPnVlhqWRlixP3uGC4hXrQuSh84Bh7DSq053AgiTLHPIgsF1yJQd+NZBo0nymfwSkbX1qvAs7mj/v3ypsOxaJGEARQqgenJCOiLTcgUa43o6gxbID6zadnnCjuvoJByVVNaL8OOmouuiangApGiZVWtSyOQ15ZRAwan4uRFbSvWNtl5efb1fkQTZ+C4m0r3pHgrKja3yP7LG/pLIk80BC8B/LWwV13hscKJfVgcRU+nh6T4WjjizbKe5CEOH+KvCepZoeaGi1NXGWQ1JQb5O077tDoWGNC1m379eaFwFm6IAC5+rqeDGxe53m4mqUvdQhxUH63BQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvwcDyVuMsol9UdRyEY13Pj/Ecm91G1juuW5t+GBsv8=;
 b=LcCNGR0LFFQrSWp2RZNOgTK1EkSbcDZMYKjHuI2u9l/SftIBk42vg2twepEt8Oa4XGRKtTsik5A6g6d5goXSmxvvbmsrr7wx14JmwKUYPmuHgB15rYByvVZYcZpjNqWyQfFFXqRtCjyz0l/oMrC6vn6eVfpHo/p8ldJhHHS7zPs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by MW4PR11MB7078.namprd11.prod.outlook.com (2603:10b6:303:219::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 23:07:57 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0662.001; Tue, 24 Nov 2026
 23:07:57 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <I915-ci-infra@lists.freedesktop.org>, Jesus Narvaez
 <jesus.narvaez@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97?= Xe.CI.FULL: failure for drm/xe: Handle
 GuC semaphore instruction field check error (rev2)
In-Reply-To: <179535232656.65842.17424370504613921080@9ac1b63fe3ea>
References: <20261120191111.4097737-4-jesus.narvaez@intel.com>
 <179535232656.65842.17424370504613921080@9ac1b63fe3ea>
Date: Tue, 24 Nov 2026 20:07:52 -0300
Message-ID: <87a4mx96bb.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0113.namprd05.prod.outlook.com
 (2603:10b6:a03:334::28) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|MW4PR11MB7078:EE_
X-MS-Office365-Filtering-Correlation-Id: cc551f1a-7e09-4100-2e48-08df4a7fc70c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|261009223027099003|18002099003|22082099003|3023799007|56012099006|4143699003|5023799004|11063799006|261028144727099003|261102123227099003|261026140227099003|261021133027099003|261026135527099003|261026121527099003|261026130827099003|261021135927099003|261021123027099003|261021121427099003|261022115727099003|261021130227099003|261022075727099003|261022113327099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info: 7YnFnoW/yyDF3wf+8STfA4EmqOe1usB5JbuAX8UbtVTvr7TsimuuROR3WjbwHvSrnQtt+FeIiC8c4USCd9KmqLak0N+/+4Q212OJMkLoo9EZV6BibHzIvF0CD0V48IBfOolqubbugpJ2leXv1ZRDpxkOgx2MQTpZ2Bb+N+wky3qPe5Cb3XjQVz+rG+4gcLAf3P7sMHZmEO6wGnwFrytN3L5shLxKGPMt5qG46f6b8q7XQZXaAfGYG0u7kVmy6HwAewQ6eQMmdp4zqAJ7U4XASv49tj5Xmg3jZ4NnHIrGi8IyFkk5RJ3nXieIFh32s+njIfNwzAd4brFXIdN5amaNF7fmQyjWSiUae9w4SueK/ihLHRuZgg9x2BQKqShrkKSgmp0wUKdVDEhHgLrIbghGIAZv1fMKMV0cFITEBSEVJjclZiKYsk50nIAvHKVKHrBmj755EJLmjcRCZuhLSYQLIlb9m/5lin1EjLE6E5CTbLO9JBXrVRJyK+aXTYbbC7GEMXptOn5aIFCrPXoY0p9VzXAovqhfbHil5dO2LJPh9eA25Z41LloIX8/CeWZMzOH2VXrQfEfJVOgVXWpgJZ4wZRxGI2DWAu/+0enh3F5OLQk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(261009223027099003)(18002099003)(22082099003)(3023799007)(56012099006)(4143699003)(5023799004)(11063799006)(261028144727099003)(261102123227099003)(261026140227099003)(261021133027099003)(261026135527099003)(261026121527099003)(261026130827099003)(261021135927099003)(261021123027099003)(261021121427099003)(261022115727099003)(261021130227099003)(261022075727099003)(261022113327099003)(261022105027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IdB/57ePrRMVWflBfmV1Xe09XCpbn4bRz57VO6sIfpWV0ImiCJ4beiVZoceg?=
 =?us-ascii?Q?V3Ac8uzcD7tkcEPxCmQoBzRBTsC2Ctue0JEjbSpp3aABPLQRs0iSEX23NWmm?=
 =?us-ascii?Q?CsfX7u47P9EDbxt15gjEWzMds/DAXNtXDWm29KleVOHCGJQj4AGjNNUU0CDN?=
 =?us-ascii?Q?IQAimRZjzJetQpsx+vgONNIMXHYGObViD7gSUPdDKOQ5FU73U7V0mKMh0ocJ?=
 =?us-ascii?Q?PIX05U4X/6w2jrKH2Ec3tFLGeQl7jpXDUS6nyDlJMbRRPb0fr/bcDiI/5MsP?=
 =?us-ascii?Q?T/bWvzxMytU4m+ME71ZcFZsfXao2RL2IlzdbrZCiA0jkfY9R4QcmOywtHZ5E?=
 =?us-ascii?Q?iGpe+C6xn5xf/PN0JR9lEGSx0rNs9OAcyq4BUGPCOYVpEJ/6rmc/pLrc0PX4?=
 =?us-ascii?Q?xhrEyeC4j5uzSZdQgkCBGcbSYuMefO4GENtDZhVlDZkZCXdkyKDPJ36X5g0S?=
 =?us-ascii?Q?ckxwOzsibNUH0Gtwo7NcG+6KC3nHIg33UG9K2WP7tSO7N6++koAy56m9NtBT?=
 =?us-ascii?Q?htbNIxEAujLUS0lhwvabjRLZnsyi3DpEjrYUhUy0pEk98i+ojD20PTqBqp9Z?=
 =?us-ascii?Q?mQNafZBNczlGQ9aVGTNKEu1pDhfSauRilv+DD0xiyDD4eEYsDCyR4XM132PQ?=
 =?us-ascii?Q?0w7zCzMOCu3QIsZ2KMuDMKEi8ZLRIPsBr5BTeSCxSO8aTEqYYPxJOT+zM8Ee?=
 =?us-ascii?Q?oTXyTNiJ9+/8tZvfcA6ckdJUf76SKd26ev5K78DQ3gXJtjdZKonUVmVsuwX3?=
 =?us-ascii?Q?Duy90M/ayfEwlpl6708kgd5ptgbRjvj/bEymm8ioFRE3GhmRbqVjS3meeGhC?=
 =?us-ascii?Q?jtK6EYQkIXbLHS5KRi2R533TK/gPlNR4VEiAIFJN1KO2K1rzfWPHEPoW0jsw?=
 =?us-ascii?Q?e5leryP5l197MKwdqKQY87wzTbsk5KfK9hp15E69VxP1/YLUAQrpzYvDkGQP?=
 =?us-ascii?Q?rv/AhSke9bSA9aD0f3Jv+a9B8K4kE75z5bNKItuPPSfXGkZwoT1gQUdV9Rhg?=
 =?us-ascii?Q?YaATp4j0FZ2LHhVT3gnGahfR0o4Zzfc9MT3TTovsccQ+Kp5XpbAv4vW8nuoy?=
 =?us-ascii?Q?03O5GP0wB2FUt4OPgtaTJelSjVi+r8ixgXQtf8ixVBD/sDzoLtCqyoJAHm4f?=
 =?us-ascii?Q?q8GNNd2IEiqMQ5wostvlbvY7MV0unY5Fcy4DjBd0MtkpV125qsov9Q3BcjRF?=
 =?us-ascii?Q?MO/byW13EbsNUPmcBkJoRa0MXw0nnlog5QNXJNB5cre6+ZFI8Q1IsHvZk2Os?=
 =?us-ascii?Q?rq1NwH8WN6ct/wcm5gjXhYVEPC7sLSB8jlNsVYXmXXulzhrHVOccBfF2WcNx?=
 =?us-ascii?Q?PEr6oCxD590GQx2O2XZn/PxG7vsacJvRKjy8zu1Tx1mLFxz3BmcFQst3enI4?=
 =?us-ascii?Q?ZdiPaQcUZQ0tmIrtbNkmzTDxjWxUgWQig9j3laSffQVwJsJit8Aaj0mcnzxG?=
 =?us-ascii?Q?PEroZDkC990uAuCXsKFfQ471yyFyvJwyJC3zqPpCkTSgWudsD/Z/pzSumV75?=
 =?us-ascii?Q?OrA4cOcQR6RhmowadWKrz3NPiSGMpX90IhS43igJgzoOddmBS76EjIUr8sDQ?=
 =?us-ascii?Q?Ar9vBrHY1O4nMvFGr7eu5IL05FzgOvblm7+aAp98YFomrrWyudGBFe+03XXb?=
 =?us-ascii?Q?CzNnXbknbyrjYcUDE3DkpZPH7IgcHXOffDYl8ygMfMq0aAA80DcsiEnMSBW4?=
 =?us-ascii?Q?9Ln6NjYXrlCtSM5tezLOEgWxvThWfxYL/YexTIVCqe33IITtlYnsvuhfZvw+?=
 =?us-ascii?Q?b+MVHse+0g=3D=3D?=
X-Exchange-RoutingPolicyChecked: DDB+cxgI9UnpVrErgznR1uSWJnIdPNHlsbZ/UZmeR0JQUVXSWqNq2c95B3/j0XNNJyZKFwzXuz3akQZC/c57VPtvlJojl7+iwQF+eDLDUHXV+SfCHFvpnHev2bCDGeNsDZ5Zq28MLSGiBTKKurnxvOTJzbzWjQWrxyKKPHp+wr2TcK1AAHBW0na9ShqFhojLRl/WSVMkN9o7mOvUc9c72HcZ+ikmh6JHRei48PIJwZrB4efEeAXczviANh1io7xvQHkHjOOW3uPl9y/KDaaMa4p9zFZwytetOfHKkG+SIi8Ve8Tui2TDAWOUhJU9pcosBKX44ONESOJNReLC5ugIwA==
X-MS-Exchange-CrossTenant-Network-Message-Id: cc551f1a-7e09-4100-2e48-08df4a7fc70c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 23:07:57.2406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4tdK6HhPPGnfFhDishryS3XpkmbAsyZ5K1JcaJpvFZN+9wECYbixR38QUivzoIxa8rumGEc4bH0iqr7DSbpEVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7078
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Patchwork <patchwork@emeril.freedesktop.org> writes:

> == Series Details ==
>
> Series: drm/xe: Handle GuC semaphore instruction field check error (rev2)
> URL   : https://patchwork.freedesktop.org/series/178748/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from xe-6197-90b50d97b3af2f55a75116f1ec76e0cf62914418_FULL -> xe-pw-178748v2_FULL
> ====================================================
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with xe-pw-178748v2_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-178748v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
>
>   
>
> Participating hosts (3 -> 3)
> ------------------------------
>
>   No changes in participating hosts
>
> Possible new issues
> -------------------
>
>   Here are the unknown changes that may have been introduced in xe-pw-178748v2_FULL:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@xe_exec_system_allocator@twice-large-new-bo-map-nomemset:
>     - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6197-90b50d97b3af2f55a75116f1ec76e0cf62914418/shard-bmg-10/igt@xe_exec_system_allocator@twice-large-new-bo-map-nomemset.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178748v2/shard-bmg-5/igt@xe_exec_system_allocator@twice-large-new-bo-map-nomemset.html

This is likely unrelated to this series, which targets platforms that
have the new 64-bit semaphore token features, and that is not the case
for BMG.

This pre-existing issue might be related:
https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9828

--
Gustavo Sousa
