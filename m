Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F03ECAC5A5
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 17:24:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E79110E683;
	Tue, 23 Sep 2025 17:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X4897Frq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DAB710E683
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 17:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758648297; x=1790184297;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lTU46ZMRLSnEyFJoQzGg2Ovv036kSbY2Emp9thNwbGE=;
 b=X4897FrqEwPeCyBOSLZOeAwBOb3UsKnhR3FyVX6DJfABZYi/iinMYhf6
 zq3/iRJP7VNn7peUtYLVPO2SOYbb1WDrtoGfJ4DslIt2G4PA7T+yT5vB6
 0qEoS7S+s3ZubbCsdCenljSZ8H2Tz+gh/uRm8ZBaxB1SNFrpOyOFMQmNJ
 jNiiz0BzFaDw/Fi/jLFTjmSmU1F+GUCINVe1+njUTha8RRgZaBHiYTvKO
 91kUB4ZVoog2EY6auL/z5JKVLKMzmkZTEnmrgkDJzCEUPtMm2FTGzp+Gj
 Z/Tq8+pYxTE94SpL+qq/Ke457xc3xtPecI1DWHPVlsxfSPUyQ2n/AOUwI A==;
X-CSE-ConnectionGUID: YT+FyNz6QquEQpF/GQkhgA==
X-CSE-MsgGUID: 1o4dgtc9Q6S99GogkY62Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="59974613"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="59974613"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 10:24:57 -0700
X-CSE-ConnectionGUID: bNl5FPCwQtyAx12FX7ldLg==
X-CSE-MsgGUID: 15sHCLiJTrCVC7XWrHnGeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="176641979"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 10:24:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 10:24:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 23 Sep 2025 10:24:56 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 10:24:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPFcO7MWsOU3OsvLFvfvi4I7DrpV6edLMLdRR6kNCMQl0XjpNXHpDXiWhtwQt14SgICphlcpdSm6W5GNzjtVe0DEhiExDn9xQ5I7St+zSY6qefRcKOLOIUzuRtSs+bYrzh3K2c+7/SuNz2XMexYqnpT4Nubq8sBW+8rA4hFLIIrXYTPtXmOTt5LVQYHqM2ivMVm+Tg9n8J4DLFcu2N4Jo7QZbjSP+Fa8wTUji4fLeqTEn1e0KzHwJZupwRUo6C0mqU9qH3jCiwZ3tQyD1h/7yMo79yvIvz3LYiH8+QkBGZWtY5NqUYEFwsBXKZNLukcof9pmajOGObf3LuQ3/+2mcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GR+O3CeraDW3Aa0juyLjvCO9ztQ6uaBhSruOA+UwPRc=;
 b=Xe3GnzpuVOTpE3fRn4XzSV3TDbsY3Wgoulvg3BOnSrMJTvuthDla0xGuOEBB1wNkECW/ops8nuHhvNoehSCvw97xeiDv6yaiX5kXe7h5DESqkvJwj+Xc+jYNcMbYGfI7ylrHu9CNRN4LYBwdd0B6EQLEgXj6YcNtJnCzoPl2/Qz+Pmk4rVVrmo9KYp7JNEI4X4QuhphSgbytuFU9cpt4Qd0wsoBJP/Nfuh0Cp6b8SNbqZI7s/w7SgUIy2VS+0Dv9FOM7q1egSj0Dq1AiKOhsVk7f8IR210IjogCbeleruCZesG66zmgoxoJzIV/O7aWQmmzwJd4PfgT8nME88/iqhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ1PR11MB6081.namprd11.prod.outlook.com (2603:10b6:a03:48c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 17:24:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 17:24:52 +0000
Date: Tue, 23 Sep 2025 12:24:50 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] drm/xe/psmi: Do not return NULL
Message-ID: <55ty6hytwovgg2a5vuesxw5jqjqbws5uqoeudeeh5xl5t4g4gz@lnbcr7a445di>
References: <20250922221133.109921-2-lucas.demarchi@intel.com>
 <aNKZVSf0q0NgNPZF@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aNKZVSf0q0NgNPZF@intel.com>
X-ClientProxiedBy: SJ0PR13CA0213.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ1PR11MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: 35d8c193-c781-4461-96a7-08ddfac61b14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g69+5rlYv5WfJOedZz3T6o1imQ7iJa1xGZzUPOPVRJqKOVVmCz53Ph+F/OWB?=
 =?us-ascii?Q?Bh5NAbi1a1dwksMQp7tudofMXVIhPIKi8kQREPMeZ3K4kp1DhgpPHSGMO5nB?=
 =?us-ascii?Q?dFTX+mCoAfP6+XAOoFf0iko8k/S/ERXQqo++qG4tGbWhAonUnhg4jSzILda7?=
 =?us-ascii?Q?71EctDFAhTZuMwZaFaQEKp9Jl93qIfoK1a2IkvnHyCS/mkKBLdGkI66vAfkd?=
 =?us-ascii?Q?cLxtjpwrvy9oiuUM36eMYZldQdy3vSjB6Lt4zPoMS40M5jO8ZERGYIUWWXu1?=
 =?us-ascii?Q?LEjUVuNZRMnmVuNkRJBD7bcxd+64zqzCJyGdtffnbeAiXaoxLfMuzSX+IJn8?=
 =?us-ascii?Q?V27IYo3+GRhXA4yIXmcbCqFU7SWNgAahLHJMKcsaaOs8fei+bPey5vLs3j4H?=
 =?us-ascii?Q?DkURi2zBtrj0vyO/MhNl4lJMzb8kVmBLxqxkJ7Tfja+lrlJyZ2oB8g3PFTzi?=
 =?us-ascii?Q?boTEQlwgrToc5ruT5q9GekLq3njorqkM9bkLMKtCgNYhMRU7kEpx/KINptrT?=
 =?us-ascii?Q?T6jbpJKWj0qeaWAGxvjQmv44/FQ7e0XKFdU37I5C5INZ3cMnp+oDTdR/c+/P?=
 =?us-ascii?Q?L3B76x0xA1J9+khwC+tZ65wH8OhX9ceQWV/Jnim5KA8en6dBcn2bQn+8yCvr?=
 =?us-ascii?Q?VMMgJ0VAfOaiTWDt6ZaZDGDPv2yzkWQYmqyDKN49RnE+SBFpTI+/99ZhWJuh?=
 =?us-ascii?Q?OjdCSkksN6F0XeTSzrGnPDXvtAAP6wT3qLQNkVJG61kAsFSMjTFJVmw6NC5H?=
 =?us-ascii?Q?p/xtUag7fnglU17N1qUt2aijs+nkT2Zjf1aqQuAw1SWe3xvWVfWpFk1uG80I?=
 =?us-ascii?Q?fA9NnXUMaUrP20P2gVlU0BuMpqenD51CudQBIowHgU1FbhjLeTKD9Gm6tUxA?=
 =?us-ascii?Q?MMsnzOXAyziEHaZK+SKgVwyIjHw9ydQkME0S9IEANwjDyIJJELX7Kvc4hbCY?=
 =?us-ascii?Q?cVUAStkwcewP0gYJEMZ/jVXcI5mw5MllxCw2AHVmLsfIpoXVCEja4wDw8Y7E?=
 =?us-ascii?Q?TFeC7aeh8G5jUOF/iXZhUEoUmX3sP8QmTwQgGlCWlbhJv4vVfp5aArlfiGAf?=
 =?us-ascii?Q?M2qhOj9+bphAkB7z0EVlFMFrLsea5hunb4LmhWZrY3KCo+6M2CGn2aQPTs3v?=
 =?us-ascii?Q?XxBzjCqIjJkkASOpKYLxmV6auKKM/2jr2ZojBV5grpRkg1RfK2lJiHEYD1q9?=
 =?us-ascii?Q?S3KZxs5GHMkBGqi4AXpqbsUx5m0KWZtnOVRSfBrpCU4VRQGKcYupSZgzy8IL?=
 =?us-ascii?Q?Gp12txQKx8x9cVr5Fa/Svp3JUnUhxLsSyJOXKYP/IFCpqvpME1Y1TRm546dZ?=
 =?us-ascii?Q?1T5n7Six6OjHsesGiIz1xvEeW3cXzs2OKAwa3EkRmmqFzRLUvjNladjbPqp9?=
 =?us-ascii?Q?n2Aj0h0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PN+vngc6Yq3fNTCogYi6TkXq9JDiDLhcKfhFVK+mMjqDAAbyTKM4b23FWQHg?=
 =?us-ascii?Q?08QXK93ny9/Uko2HMgwEVAe/BiSxxvwbH9Wh/60TC1c/maRvLdrBq6IrMPR3?=
 =?us-ascii?Q?YK8AIIs1fGHToa2H4efGBSkFT/uVRh1WR++xKC/9RHlB3bFDYxACclEwT4Mf?=
 =?us-ascii?Q?jPGUIslCfpMeEyBuUXUqJ5yiqyN1k8o3UFYSbVVK4vyFMJ/zHs9Zhkcsk5nt?=
 =?us-ascii?Q?5Cq6sXMsdb1bkcPaVU+nTN2AwrcTkiGkbl4AcBghHEKAPeGof2uKe2WDZVVJ?=
 =?us-ascii?Q?XChLamPHI0aGKz7t6p+cDfwq0g6iSZd7TWsEcjbryJoev4AyBExVhzta8XMD?=
 =?us-ascii?Q?HP5rI2gy7FcTjBWx1lotvNzuBnl2B1npe42sJCj+anwSXZRCHlMFur68kdSY?=
 =?us-ascii?Q?gEjrQz8EzgBWnk9Xj3DGTdCdXZgIwC5d6rojKy+hGYkdt4TLBDyvYQRAV8cu?=
 =?us-ascii?Q?C3S9X/XHG/n2LZQlMKeUvOv+ua+BDrt7Cpm4cbPjL7Zq6o7CAu9CQd5bzo4E?=
 =?us-ascii?Q?DilW8H4d1sOdlihZKsDqL9/q/FHR48wpx47VtpzPr7Dim0Lfr8yT2cGqJjlp?=
 =?us-ascii?Q?vl7L7I/pIqRJHWGj/XhyCGOhk6f48T70klJva+5sgtBOlYNyZU1H1CbfFhV+?=
 =?us-ascii?Q?h16H9jL/gR82EGlGgfcf6v7PvThTXGf3gPD6+i1Y4RXOK8rPO9QXkxKrLA+W?=
 =?us-ascii?Q?rgq9avlTuVV8ws1PFsJkkwAXUsIEQHJmEtDPaU+pswDHrsfdni4BGqqR0mgD?=
 =?us-ascii?Q?IRQQajDq+bawSTe8fYuFlGdfeHh37zSwrBQqS7PyCorpyVjnJmtlbpTtI+Eb?=
 =?us-ascii?Q?pn+Xmy4sER9et3lshmaPJXvhO8LNsdoYIU3BXMofOeSjysCyHauSd3ktvfWo?=
 =?us-ascii?Q?pOz81qLsgZQ9wAsH8W39+KZkNZC/BjHPk4+mEDqJ4PC9/6Nz1lgQw5ykWKM7?=
 =?us-ascii?Q?HDIjxg6XOJFbZqXeS2kLxkG2qvgAR8ZVMxaBfGgNkBkGXKdiP/NgdDh/HwjF?=
 =?us-ascii?Q?+AKoa22jp2i1kjGNH4f8L2X8fBwWbOcavKGGq3wDRU7sSqVSu5eIARrD3o5A?=
 =?us-ascii?Q?wsAZRYdWKVqgclmbi37qnlTsctR4Gm7wMSOW9IgLHxMHWVS7h/M9FbkA/7hD?=
 =?us-ascii?Q?c5/fTHsG6KOdM2t5xzMvQbgsrFkPjAG/64TlsFiaR8qM/C0TpGu6QZx2fTMF?=
 =?us-ascii?Q?G55SflPRJkgg4d+u20jmVbRh63D+VLGLXfynCJA/jaqxqeZlaor+fEyBZQlQ?=
 =?us-ascii?Q?+0q3Xa1qUHWFMakfImNbYIsgFm697/xkWqmtxPSQZsNk+jD1xjz0jVTzWESa?=
 =?us-ascii?Q?xNBAub6kOpgH7dFMZCUzrCn7q0Faf34HETuCFObpsoPbXkXldRhwkuomW3/I?=
 =?us-ascii?Q?i/h4cTNR69/Qw+M9RDlZwFkzusuYjpzdzAiXT7sLBjwG8K8cuT4Jne7t3cMX?=
 =?us-ascii?Q?4azV4S0gX+Q7qVzaS+McJYuZSTv9izi8bhbLcFDYmMnbh9s/eHvQXMV1/9XL?=
 =?us-ascii?Q?fmy9YTZIKqrbhP//N8O+XcrYh9qjgzpS1wWNewc2sX6nmZvzbmpvtY56FGEZ?=
 =?us-ascii?Q?pMu0+pIb7jsLBsgC5WaGR0JN+L4BN3PfiJwrZi4BKaAPCkRpDWpUug2fiS5S?=
 =?us-ascii?Q?ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d8c193-c781-4461-96a7-08ddfac61b14
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 17:24:52.3979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +NaO7tNlpMjqLa34gBLnqXCbjbp+gXGXWHL2xUoRJmXMaehK1T/012Yt7ep/qfn248+lY9DjjiQrB+d2ZRS382beprOh4m2woSvMc5dreFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6081
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

On Tue, Sep 23, 2025 at 08:57:57AM -0400, Rodrigo Vivi wrote:
>On Mon, Sep 22, 2025 at 03:11:34PM -0700, Lucas De Marchi wrote:
>> The checks for id and bo_size are impossible conditions. If they were
>> possible, then the caller should not be using IS_ERR(). Just replace
>> them with asserts which should be compiled out when not debugging and
>> at the same time prevent other refactors to break this assumption.
>>
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/r/aK1nZjyAF0s7bnHg@stanley.mountain
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Merged to drm-xe-next, thanks!

[1/1] drm/xe/psmi: Do not return NULL
       commit: 2598d9b4208cafa46f6649e679cdba67fcf0436a

--
Lucas De Marchi
