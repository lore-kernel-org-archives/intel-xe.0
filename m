Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D31C19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 04:04:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CF610E08B;
	Fri,  7 Mar 2025 04:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VsimPr/J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB2410E08B
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 04:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741320295; x=1772856295;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=biWerL/RO9Diop5qLFc2CYSPZXrOAIc5omTg2EgNBwA=;
 b=VsimPr/Jk1rYhSLCwdgxqYd+7s/xodMNRAD/FEeMspsQzroOQVN+Dzg0
 YsgPrWfmeYWHjszs7swEr5gXLV54ugakD63UZ2iKrEbqxR6N3iALMgbyJ
 qVGdeouj/c4ZP8ra2tnLXhP0PfE2h8cwz3mkbrM3QbORHgoNcpn26qP4d
 Odl9aKJs+GK8aySXHuM48Uf0kfB4xzNNxc7sp/ExZAzj4YVBRaMn4Ixxl
 w91ItIjSBY5llqpwJp4dff9oqMIinuhwat5aSlf+qbHloVQPIQjaql0S3
 5vcvOlqImSJWZum4N8TRtWjf2d6HsTUCGGmAZSGujPc+zf4eQOBMqMwET A==;
X-CSE-ConnectionGUID: Ms1g16DgSbabVUiU3zd4tA==
X-CSE-MsgGUID: vVueTwQ9Tnqk/clXcQ+O1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42492292"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; d="scan'208";a="42492292"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 20:04:53 -0800
X-CSE-ConnectionGUID: kdUjQ63tQLu/kObtObNaEQ==
X-CSE-MsgGUID: cMPtYdtYQL+hp3R29uRCCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="156423692"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 20:04:53 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 6 Mar 2025 20:04:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 20:04:52 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 20:04:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNwt/g4QP98IOZgzizqq/zW9/5sV1qCIUGfTGmkHzJly5FayRT9ve7JyAtNpJiVj4aaoVfW+al9uOThvvK+vP6o/RcYZEyRMu5b94m6WFKYxvSK9PWpkhVlEPLoYXCO5bNeYEkTTVbHxvNgr5/eTZpkPjozxELmZCsn+/jgB48QXlF9iyjPREs21Fw5Qr6Y5Dc1BmPV8OsjFmoyzgO9pGBCqLZTf7khoTAEuHQeHSSST+X0r8ACvjQw6WHZnsX78q/Qmbc051avxuPSdImhSFbZrBRoaAzeZH7tBVVY9JAv9CkZ2dHoi1Yz1gSKFDytDdwOg677Lmt6hrcZC9wn4Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTSUAFy9cAdsyftuHUzOnW1K5eWJzsPcN31ykktaZiQ=;
 b=ud3SOBILoMWSeNrYX3x5iqTCHQIXG+9Ukr3j138WK4pr3dXHono3voPgpVHiJhc2i9+DNpJRLh705cLfb85hSBDGBxywezCAwzZ7DygufEeb2iOEVHL5oEP0SABWz6KU7c9fumS0H6SCbK45uuhSnlgm1qfGDpAsrWuIq7k9vTpzH4rNw7A9r2Dm2FTBRfCf8dh76hfeAH0VJKorjlr+PTab8PXTP+oviHjVshmesgmHf8jDRYXQuxevdAA4YGoKlkEXDOumbk5kLA1pCi/n7hs8gIuDLCPRpjMpC5O5j+2Wl3dZjKqXj9mXr3WfxdBkdxTjXXJqGTQX5UmWfJ3yUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB8568.namprd11.prod.outlook.com (2603:10b6:a03:56c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Fri, 7 Mar
 2025 04:04:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 04:04:29 +0000
Date: Thu, 6 Mar 2025 22:04:26 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: kernel test robot <lkp@intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH] drm/xe/rtp: Drop sentinel from xe_rtp_process_to_sr()
Message-ID: <twgurijqsi3q22brqorec5ecagzbh3n7ogqueabdxyvrdakaxb@cy24xnyehdb4>
References: <20250306-fix-print-warning-v1-1-7bd961d2cfef@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250306-fix-print-warning-v1-1-7bd961d2cfef@intel.com>
X-ClientProxiedBy: MW4PR03CA0295.namprd03.prod.outlook.com
 (2603:10b6:303:b5::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB8568:EE_
X-MS-Office365-Filtering-Correlation-Id: 0295e6df-49e0-4318-c240-08dd5d2d28c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JCpQVbqdv2S+gjoYkgkDQc1E2QL+PTdzihFKPJ2MPZ0FHE53mFJLpE7pp11/?=
 =?us-ascii?Q?TL89NtMtwB6+XVcPHckiErLDc4gqcXT/tmmoUGztq55vVquhi/ibNisnPUFq?=
 =?us-ascii?Q?sWIoWT9OY3V/X/Z1U/Ter9OgRnqpp5Ns/ompMa+TEoPAK+SCUEgL73Ioi0f+?=
 =?us-ascii?Q?UoyAFbteUZ5V6KXtu6oqiGeJoDp/MN3SPMGAr47i9hrX6kwSOUxG6hZb77An?=
 =?us-ascii?Q?uEfhP89O2RJFmtdPWQLGZh15ofz6Pil+zpfhtGqameJpPnvsRJAx1HqeprNW?=
 =?us-ascii?Q?mcA6phtHflTD7D9EZ/NQ8HyaBDtHVczwefrEm9NCWZeZyzUxzioNbEcrzXWL?=
 =?us-ascii?Q?O1hFGgF8Z4Wcg1vSx1WsUxXuVXXgrMnlaTfuCHSlg2ehjS/ZwzlDWnwuVnj5?=
 =?us-ascii?Q?MSI6OLsCse59tutbq/mjvNZgMwrSJsHhOCwRYoK37cujH+eumWkzeVZ3YYVr?=
 =?us-ascii?Q?MY2zWCknbjakxz31Mjr8U2N/qyTKsZQH7rSfF1JkMU0X8EXcJ+mPbN1mzT3h?=
 =?us-ascii?Q?BtjzssrAMjUsc9k+C9KVrDEfOy9ZMm0Op97zwgv5aw7cj8dTj2dZjbdM8EF+?=
 =?us-ascii?Q?dFbOugjFHt6yHLGqPeDh1mNjMg5KACvTD6uO5T91edILOG5GkG3g8zrLx1Mm?=
 =?us-ascii?Q?/gE23mNv2AigIoUzrBt0a8V8XjopldMlx52OFPYo2Pz5Wr0qCq+j3Ld2jCEZ?=
 =?us-ascii?Q?o6Zxgeuyqp1xQ9TmFvHtzmMZEbsWRU4RAWcjBHwIZ3anG9svGulWKzcSN/G6?=
 =?us-ascii?Q?RKd8FEezC7nUfHyEl7ZY5vxU18bCqB/DqvOApmCmNO32KOAamXdfJRrxUMIY?=
 =?us-ascii?Q?J8O2ZVqz8C99+zERg0b5uhAiHuyLG8heyQTqqPjgo6+Q+H+2++QRKXHZPcI2?=
 =?us-ascii?Q?XnxtZNUbaf2txhVHb7H7/io4lVuqsT0dEZMVQYNzUL7L3TzrW0/++zizJsrJ?=
 =?us-ascii?Q?MetPA+YjXA+qnIEFbzRidx1o6c6Yr18tB0racAgKuZBp0RiiKUYUzA3qfXtW?=
 =?us-ascii?Q?ZGD5/exeDdKskqXTvNoFEo72b0jGxy+5N5DlVnn7j0RVUWCD2ZD3U30jxRyB?=
 =?us-ascii?Q?bfPIUrf1yxrHGmNlThoWxHQxH0QOMneWMc9zIyNiOJ1v7mgcUQY/LCOqZt5A?=
 =?us-ascii?Q?vvYtUBrZ0oDFIrY1NX9Eb9eBmO6CDwksMRfuZUeJoEfYEz94U1Ztvl5hzSSh?=
 =?us-ascii?Q?rxeWa0u0OIwFxB9nh2csm5rf1SiCeClPROgxABRhFQSoiD9NW2FruGtZM7f+?=
 =?us-ascii?Q?AxjF0M6X4cAmSLxwcJBQLZwo/1f5BGsNf7LIbKLQIZPErGMqUhObjkEz6EEw?=
 =?us-ascii?Q?QaQNiJryKBFTNkxyXr9b9F/h4jnXhz2Rk5sa+d+z3uu4y65uShf/QHyrih7s?=
 =?us-ascii?Q?RoDEEz7qV4sQAWAI35MjvbcECYGm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GEDaIeyxZIqEzp4+nUpddp/HASQFN6r4jYGIZQMmG0dgxnTMrlNoz9smS1vn?=
 =?us-ascii?Q?wCSATIu9CJIO93fICm4bOGCGdv45EjUb8SuEbzt9AkNkf9cOMqtpJBLsNPBE?=
 =?us-ascii?Q?U5TNTAnvNtl2YcpzfPkF4ey+zznl2ajdZjY1PQn/UMwutym9QpP2waOip1hn?=
 =?us-ascii?Q?U2nKL6tama3l7bfcxOMqIGcz+hRmBx8ES06XGiaW0dpnXVe6fr3bXMGaBDqu?=
 =?us-ascii?Q?eY48OWq33lvHQ/MBDaYi9wFr0gsDBuIXH0m+oAqGxOL4b8EAw2q6rAsaLqEM?=
 =?us-ascii?Q?h1JEmDO4jKXP9uJkR0GPjdMvfIFiUL6aGHu6M2qITfI/nKTc60czZQ+fb5KE?=
 =?us-ascii?Q?0Jh1fbOIBc2OuBDpcafnrS8LwLzVkM4aPINcT9AMH3hDxHWQDKq9AVzkf4NJ?=
 =?us-ascii?Q?Rkipb/N9YZ7QY0zKPH+0do45RA1dWuIQeNs57Q/oCSUrNXPYXc4F7kqLtUcQ?=
 =?us-ascii?Q?ljgGEJo3JrgftGWeCSL6Gmz+7pggPhmFnr+o1K4sFBCruB3BT1AlQjGCHL+e?=
 =?us-ascii?Q?+Ium6Q1KQC3P5QVsagcJ/Xg172tA+v0PvlKDv9eJOwTkiKi7fs2f4ciD2YXY?=
 =?us-ascii?Q?kud0rwCet23S4Y/kdC3j99IBoONXUKzju/MXkGwHz5qPBELv/rSUamWpDY9u?=
 =?us-ascii?Q?F2wj77NPVbHJUcjZ7+jWeLRnpIcz0z/Bq5a0gsOTroaXvn85sJehqootKzxP?=
 =?us-ascii?Q?mTcPYI8FsOtoUnsFOrEjk0vVqNED/13xi6h1GaOGceQ915llUDA+w7dov59F?=
 =?us-ascii?Q?f8Rff9/J1pJfBlk+Rom4h6tq2gfGR9HOLTCYYFpwWcWguQH1+ZhcQ/TAp9rk?=
 =?us-ascii?Q?+eSs/WR747e+by57haMIIuIKSTrS/d8YlZROOAxAQgxjCRbiF5r4H8tGq4tR?=
 =?us-ascii?Q?XaaO5vxl7uzY40+DDMrFXtT63HjVxeXa9rlzX3jhfBoxw1ivn4fT2xKnmzNU?=
 =?us-ascii?Q?+qZSQb02hfctyXMgshkEoKMxq8OOS9nU1KoKwTnhXESlYn04o+ZnF24o84LE?=
 =?us-ascii?Q?4WDolZe07HKd3ICbLiS4CIv/sX3nnkRNVPEWOVgHpLEW2NQ1kEv6TNxrqaHF?=
 =?us-ascii?Q?IwB3Upm/Agr9gidJ+m4qP4u5z5WnlL5oWW4wZj26SiCrzEOTr8R30dmFbLDT?=
 =?us-ascii?Q?HassN2RotnZvnsr5CQhzm/nh8CIi1JJNUEOuozlxIzPTnt6TB9NRvV9WKE1C?=
 =?us-ascii?Q?i3EC6+9gddhm24K7YWAG90vS0oqNt1f47Jtv025ChaW3AuIa2kHnLcOMHt9y?=
 =?us-ascii?Q?5KriD1lE9vNOCL5oDaiYZqON982mqdpJ5O5IBYUp8I2yxNasnLOQoyymkDm4?=
 =?us-ascii?Q?UjEWNmSaIq8fwKL93Ha4Tlq85ASMOPwiTEcMpSIok/6MIx9PjLKgNqzVX04g?=
 =?us-ascii?Q?AdyezCdfoH/iQ/af+ZXWsZqEf2PIHTfUrltlxTeVF5Og/MwvjIlpD2Hjn6ne?=
 =?us-ascii?Q?zXMlSWnYfv5lgo1sHZM8QcI27LNA4ICRwwpYppE7iojihP+9yTN0ZlMwZflF?=
 =?us-ascii?Q?Sm2hP9T1BUb/x6VZvkC58aaPbi6iuCxc9CLywU4HZvIdheFaDVHBuFPgvT05?=
 =?us-ascii?Q?/PQdennTaumDXnKP7cP3F4dbSl8Kpj6pvyFQ3SKJ7E1OC4B48To3rM4eTPRU?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0295e6df-49e0-4318-c240-08dd5d2d28c7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 04:04:29.7223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1uOA1EXpn7LvWutmdd96DIu84epDRJvMLqT2ZSGiXed8gWLO5YWdQ+Mon/lOGnc0YZpDZwdwXecJHbD2tkEJE3wY7WQViz7OzRfTLJMnNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8568
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

My experiment with `b4 prep` is semi-succesful. Hopefully CI will ignore
one of the patches and test. Otherwise I will send again later... but
the content is the same to be reviewed.

Lucas De Marchi

On Thu, Mar 06, 2025 at 08:00:04PM -0800, Lucas De Marchi wrote:
>There's a mismatch on API: while xe_rtp_process_to_sr() processes
>entries until an entry without name, the active tracking with
>xe_rtp_process_ctx_enable_active_tracking() needs to use the number of
>elements. The number of elements is taken everywhere using ARRAY_SIZE(),
>but that will have one entry too many. This leads to the following
>warning, as reported by lkp:
>
>   drivers/gpu/drm/xe/xe_tuning.c: In function 'xe_tuning_dump':
>>> include/drm/drm_print.h:228:31: warning: '%s' directive argument is null [-Wformat-overflow=]
>     228 |         drm_printf((printer), "%.*s" fmt, (indent), "\t\t\t\t\tX", ##__VA_ARGS__)
>         |                               ^~~~~~
>   drivers/gpu/drm/xe/xe_tuning.c:226:17: note: in expansion of macro 'drm_printf_indent'
>     226 |                 drm_printf_indent(p, 1, "%s\n", engine_tunings[idx].name);
>         |                 ^~~~~~~~~~~~~~~~~
>
>That's because it will still process the last entry when tracking the
>active tunings. The same issue exists in the WAs. Change
>xe_rtp_process_to_sr() to also take the number of elements so the empty
>entry can be removed and the warning should go away. Fixing on the
>active-tracking side would more fragile as the it would need a `- 1`
>everywhere and continue to use a different approach for number of
>elements.
>
>Aside from the warning, it's a non-issue as there would always be enough
>bits allocated and the last entry would never be active since
>xe_rtp_process_to_sr() stops on the sentinel.
>
>Reported-by: kernel test robot <lkp@intel.com>
>Closes: https://lore.kernel.org/oe-kbuild-all/202503021906.P2MwAvyK-lkp@intel.com/
>Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_rtp_test.c |  2 +-
> drivers/gpu/drm/xe/xe_hw_engine.c      |  6 ++----
> drivers/gpu/drm/xe/xe_reg_whitelist.c  |  4 ++--
> drivers/gpu/drm/xe/xe_rtp.c            |  6 +++++-
> drivers/gpu/drm/xe/xe_rtp.h            |  2 +-
> drivers/gpu/drm/xe/xe_tuning.c         | 12 ++++--------
> drivers/gpu/drm/xe/xe_wa.c             | 12 +++---------
> 7 files changed, 18 insertions(+), 26 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>index 36a3b5420fef6a1977a04d169d4946f75ee523c4..b0254b014fe45013aa0c5b3fbbe7a58fe8584a31 100644
>--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>@@ -320,7 +320,7 @@ static void xe_rtp_process_to_sr_tests(struct kunit *test)
> 		count_rtp_entries++;
>
> 	xe_rtp_process_ctx_enable_active_tracking(&ctx, &active, count_rtp_entries);
>-	xe_rtp_process_to_sr(&ctx, param->entries, reg_sr);
>+	xe_rtp_process_to_sr(&ctx, param->entries, count_rtp_entries, reg_sr);
>
> 	xa_for_each(&reg_sr->xa, idx, sre) {
> 		if (idx == param->expected_reg.addr)
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index fc447751fe786c0035d888047a856780a572e526..223b95de388cb8919a7d1ab52e1305be990672ad 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -400,10 +400,9 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
> 					   PREEMPT_GPGPU_THREAD_GROUP_LEVEL)),
> 		  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE)
> 		},
>-		{}
> 	};
>
>-	xe_rtp_process_to_sr(&ctx, lrc_setup, &hwe->reg_lrc);
>+	xe_rtp_process_to_sr(&ctx, lrc_setup, ARRAY_SIZE(lrc_setup), &hwe->reg_lrc);
> }
>
> static void
>@@ -459,10 +458,9 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
> 		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
> 				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> 		},
>-		{}
> 	};
>
>-	xe_rtp_process_to_sr(&ctx, engine_entries, &hwe->reg_sr);
>+	xe_rtp_process_to_sr(&ctx, engine_entries, ARRAY_SIZE(engine_entries), &hwe->reg_sr);
> }
>
> static const struct engine_info *find_engine_info(enum xe_engine_class class, int instance)
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>index edab5d4e3ba5e7708565f8bc51df50c0b4a46f39..23f6c81d99946f97413e411289116aaa10365f3f 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -88,7 +88,6 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
> 				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
> 				   RING_FORCE_TO_NONPRIV_RANGE_4))
> 	},
>-	{}
> };
>
> static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>@@ -137,7 +136,8 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
> {
> 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>
>-	xe_rtp_process_to_sr(&ctx, register_whitelist, &hwe->reg_whitelist);
>+	xe_rtp_process_to_sr(&ctx, register_whitelist, ARRAY_SIZE(register_whitelist),
>+			     &hwe->reg_whitelist);
> 	whitelist_apply_to_hwe(hwe);
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>index 7a1c78fdfc92ee9a7e8862c2a65ce99b1f2a5ff1..13bb62d3e615e89d1e996692732b1859561ac55e 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.c
>+++ b/drivers/gpu/drm/xe/xe_rtp.c
>@@ -237,6 +237,7 @@ static void rtp_mark_active(struct xe_device *xe,
>  *                        the save-restore argument.
>  * @ctx: The context for processing the table, with one of device, gt or hwe
>  * @entries: Table with RTP definitions
>+ * @n_entries: Number of entries to process, usually ARRAY_SIZE(entries)
>  * @sr: Save-restore struct where matching rules execute the action. This can be
>  *      viewed as the "coalesced view" of multiple the tables. The bits for each
>  *      register set are expected not to collide with previously added entries
>@@ -247,6 +248,7 @@ static void rtp_mark_active(struct xe_device *xe,
>  */
> void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
> 			  const struct xe_rtp_entry_sr *entries,
>+			  size_t n_entries,
> 			  struct xe_reg_sr *sr)
> {
> 	const struct xe_rtp_entry_sr *entry;
>@@ -259,7 +261,9 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
> 	if (IS_SRIOV_VF(xe))
> 		return;
>
>-	for (entry = entries; entry && entry->name; entry++) {
>+	xe_assert(xe, entries);
>+
>+	for (entry = entries; entry - entries < n_entries; entry++) {
> 		bool match = false;
>
> 		if (entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE) {
>diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>index 38b9f13bba5e54f9c6e863bb578c00fce7a8c452..4fe736a11c42b954c2256fa21a49b0c2e39901e2 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.h
>+++ b/drivers/gpu/drm/xe/xe_rtp.h
>@@ -430,7 +430,7 @@ void xe_rtp_process_ctx_enable_active_tracking(struct xe_rtp_process_ctx *ctx,
>
> void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
> 			  const struct xe_rtp_entry_sr *entries,
>-			  struct xe_reg_sr *sr);
>+			  size_t n_entries, struct xe_reg_sr *sr);
>
> void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
> 		    const struct xe_rtp_entry *entries);
>diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
>index 77bc958f5a42cd017d3c363825dfd05cd73f872e..49ddbda7cdef66da49469b687b2296cc2d00b283 100644
>--- a/drivers/gpu/drm/xe/xe_tuning.c
>+++ b/drivers/gpu/drm/xe/xe_tuning.c
>@@ -85,8 +85,6 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
> 	  XE_RTP_RULES(MEDIA_VERSION(2000)),
> 	  XE_RTP_ACTIONS(SET(XE2LPM_SCRATCH3_LBCF, RWFLUSHALLEN))
> 	},
>-
>-	{}
> };
>
> static const struct xe_rtp_entry_sr engine_tunings[] = {
>@@ -100,7 +98,6 @@ static const struct xe_rtp_entry_sr engine_tunings[] = {
> 		       ENGINE_CLASS(RENDER)),
> 	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERRIDE))
> 	},
>-	{}
> };
>
> static const struct xe_rtp_entry_sr lrc_tunings[] = {
>@@ -138,8 +135,6 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
> 	  XE_RTP_ACTIONS(FIELD_SET(FF_MODE, VS_HIT_MAX_VALUE_MASK,
> 				   REG_FIELD_PREP(VS_HIT_MAX_VALUE_MASK, 0x3f)))
> 	},
>-
>-	{}
> };
>
> /**
>@@ -180,7 +175,7 @@ void xe_tuning_process_gt(struct xe_gt *gt)
> 	xe_rtp_process_ctx_enable_active_tracking(&ctx,
> 						  gt->tuning_active.gt,
> 						  ARRAY_SIZE(gt_tunings));
>-	xe_rtp_process_to_sr(&ctx, gt_tunings, &gt->reg_sr);
>+	xe_rtp_process_to_sr(&ctx, gt_tunings, ARRAY_SIZE(gt_tunings), &gt->reg_sr);
> }
> EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_gt);
>
>@@ -191,7 +186,8 @@ void xe_tuning_process_engine(struct xe_hw_engine *hwe)
> 	xe_rtp_process_ctx_enable_active_tracking(&ctx,
> 						  hwe->gt->tuning_active.engine,
> 						  ARRAY_SIZE(engine_tunings));
>-	xe_rtp_process_to_sr(&ctx, engine_tunings, &hwe->reg_sr);
>+	xe_rtp_process_to_sr(&ctx, engine_tunings, ARRAY_SIZE(engine_tunings),
>+			     &hwe->reg_sr);
> }
> EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_engine);
>
>@@ -210,7 +206,7 @@ void xe_tuning_process_lrc(struct xe_hw_engine *hwe)
> 	xe_rtp_process_ctx_enable_active_tracking(&ctx,
> 						  hwe->gt->tuning_active.lrc,
> 						  ARRAY_SIZE(lrc_tunings));
>-	xe_rtp_process_to_sr(&ctx, lrc_tunings, &hwe->reg_lrc);
>+	xe_rtp_process_to_sr(&ctx, lrc_tunings, ARRAY_SIZE(lrc_tunings), &hwe->reg_lrc);
> }
>
> void xe_tuning_dump(struct xe_gt *gt, struct drm_printer *p)
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index 55eb453f4b1fb39d4127609a28e4a5ebe9b5a051..a25afb757f7088c7f831867717b42982e9ea754c 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -279,8 +279,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
> 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), RAMDFTUNIT_CLKGATE_DIS)),
> 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> 	},
>-
>-	{}
> };
>
> static const struct xe_rtp_entry_sr engine_was[] = {
>@@ -624,8 +622,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> 		       FUNC(xe_rtp_match_first_render_or_compute)),
> 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
> 	},
>-
>-	{}
> };
>
> static const struct xe_rtp_entry_sr lrc_was[] = {
>@@ -825,8 +821,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
> 			     DIS_PARTIAL_AUTOSTRIP |
> 			     DIS_AUTOSTRIP))
> 	},
>-
>-	{}
> };
>
> static __maybe_unused const struct xe_rtp_entry oob_was[] = {
>@@ -868,7 +862,7 @@ void xe_wa_process_gt(struct xe_gt *gt)
>
> 	xe_rtp_process_ctx_enable_active_tracking(&ctx, gt->wa_active.gt,
> 						  ARRAY_SIZE(gt_was));
>-	xe_rtp_process_to_sr(&ctx, gt_was, &gt->reg_sr);
>+	xe_rtp_process_to_sr(&ctx, gt_was, ARRAY_SIZE(gt_was), &gt->reg_sr);
> }
> EXPORT_SYMBOL_IF_KUNIT(xe_wa_process_gt);
>
>@@ -886,7 +880,7 @@ void xe_wa_process_engine(struct xe_hw_engine *hwe)
>
> 	xe_rtp_process_ctx_enable_active_tracking(&ctx, hwe->gt->wa_active.engine,
> 						  ARRAY_SIZE(engine_was));
>-	xe_rtp_process_to_sr(&ctx, engine_was, &hwe->reg_sr);
>+	xe_rtp_process_to_sr(&ctx, engine_was, ARRAY_SIZE(engine_was), &hwe->reg_sr);
> }
>
> /**
>@@ -903,7 +897,7 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
>
> 	xe_rtp_process_ctx_enable_active_tracking(&ctx, hwe->gt->wa_active.lrc,
> 						  ARRAY_SIZE(lrc_was));
>-	xe_rtp_process_to_sr(&ctx, lrc_was, &hwe->reg_lrc);
>+	xe_rtp_process_to_sr(&ctx, lrc_was, ARRAY_SIZE(lrc_was), &hwe->reg_lrc);
> }
>
> /**
>
>---
>base-commit: 6f2e5afc45e3ca8bf46427ae21a9c1029ea6cdb3
>change-id: 20250306-fix-print-warning-43d20fc31309
>
>Best regards,
>-- 
>Lucas De Marchi <lucas.demarchi@intel.com>
