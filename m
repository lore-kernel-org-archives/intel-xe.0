Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F16D35669
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 03:24:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11A710E103;
	Wed, 28 Jan 2026 03:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n8o5dOh5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CFA310E103
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 03:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769570697; x=1801106697;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OeOgsxTvKpgsAS9cCZR3O0RnETUvJByPgyXGmdWD4og=;
 b=n8o5dOh55r+vuQcbt/tB2dNbq9KBOWVcm7bgOCCTB30uyVB/y1qQQm18
 qRYFHBHAM9mjqQWf/J8HnR1/QzB8pXZHe/SvyCby2pgR4rEoY9t/TIrCH
 luIePluEjZBB0Oax9xvFRyH+IZR/0E6NU6jwHiHjoYsd+BpQxgCdv4YgK
 KNhWUsIMOcB2htITjK8Kok8gqnl4IkeLTLCHZpuSWFzxvPk0HcAddKB/k
 aCgamnLCp9s9cURzdHFX5zOonQP45bn0iKvKYedKZ/rkgJUh5a3gqoyDe
 Bu+aDQM1NLSl3ScTuuJOE2k9Kk4sF+zvJtMZ6ltXMk42S5rdy4wLY/aHF A==;
X-CSE-ConnectionGUID: UGS63p9gS76sITq9OLT2lw==
X-CSE-MsgGUID: vl/5pfN3TZyo4uivc9byYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="82207652"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="82207652"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 19:24:56 -0800
X-CSE-ConnectionGUID: CCK1yVRCQGiyagEskZyalw==
X-CSE-MsgGUID: gGwI7R5fRHSeysrS6pUUaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="245763009"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 19:24:57 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 19:24:56 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 19:24:56 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.3) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 19:24:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKU++9TpkXhr59QBkGcIWxTDdhCq2OrWl+QckHKGP5zX83n8MZ6mzvPU0izuFdtXLt1m9Is442RTEbxk0GsTRE0Dns5x+xttUyTZ332oPNg74Za/68u8+x8WJKxvQfVHEEOywdkJm9Z0nnyVUyMTSB2Yg3LNK7XeNx4hGhn6jeQC5wJ7gcxmhDvZWXEk+f9jgJKrN22rtGNEltJ78MXXVAS/Jhna4NrmdnaDU8PQyqPOJRAOG3p5fxPAzIahTRAPvbqVvEgPQLF5omF3k8G8hB78Kz+96x5JCKz2435bLJ4p0cDaYYooO0jQ0i92/T1xkEzhJTNFPDgyaV6DwWTemQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLOKwAyj6HxlKzG1BkTRvw1PNFqin4CALU1q54tbzD0=;
 b=oXzj6Skm9JMaDWeOWMDXqGEFBIrS+pQPdiQdp5x9qkpGB9YtKXQ7oteIvTMzTtF7Cw6W47+bto6PYw26Iufb8UUQ9wyh9Z1O46EqsPNm0JOi42Q0ms9vumEjBB3wfkefkqxiS08xmR3ODwYtAMfWIdZE8zh5+2Dba77Roo9tDLTEDms/+D6Yn76FKqxGHX37/dVuHwDr0iRrKDn5AO9bm59dcoHmBFHDVT9gqTNBbk/6d4oQ97QiPcBK2ODbemgwgEkP3a3lHKPxf9TyN61W7/y+5oAgg9KxwXWXyU3fxeOKNSdQ0Ck6tBuAI77A8wpVSABo4FknRgwgPEABG7o8gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB8234.namprd11.prod.outlook.com (2603:10b6:610:190::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 03:24:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 03:24:52 +0000
Date: Tue, 27 Jan 2026 19:24:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?= =?utf-8?Q?re?= for
 Attempt to fixup reset, wedge, unload corner cases
Message-ID: <aXmBgW7PwSm1205B@lstrano-desk.jf.intel.com>
References: <20260127170455.618616-1-zhanjun.dong@intel.com>
 <176955280377.197481.11729470755776214799@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176955280377.197481.11729470755776214799@a3b018990fe9>
X-ClientProxiedBy: MW4PR03CA0276.namprd03.prod.outlook.com
 (2603:10b6:303:b5::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB8234:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d7cfd29-ccb6-46b7-292c-08de5e1cccbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s5aH8DZ620NmjjWEnbLk4yOg2ZjHptHOJ9lJyae5JoJcmWj3w5CoOrEzbhKd?=
 =?us-ascii?Q?e0rkizKC+GRswQDrWW1wpHqfc/KOYDko3gsgejeaVUhylyqL4ztEJpfwCuJv?=
 =?us-ascii?Q?m6QZiB4bgZnMq89q0aefQgtJyoXxwJa3PHk8do7/MAw36DMQp6F31xWROoez?=
 =?us-ascii?Q?RRSB4ThrzunnCeS991YZI/cslNPmst/6yIbIjx+1+YR2hXaIxnueOVDcq1y5?=
 =?us-ascii?Q?WIHBQjYtNwzHgRYz/c8IXmEL2h3eTIRDsr5S0xWt9zThitTe5MTpx0kxacz1?=
 =?us-ascii?Q?yMC4wkkHu4QWLT47LPdlfTXHBF0wRCLQOIZk05vj52hTQNGdNKWunlgB7aiY?=
 =?us-ascii?Q?X6LYucqUlpJ9VOLVn1VcE5BnyqdEWVLqFBVU2xFmF7GjAzYNgsLbWpu7G09J?=
 =?us-ascii?Q?y11Vy1CyKxdxi7TUFhN+XuEkbZFUZuvYW0UxudS/zrF89QFfNomxIJWpBA1n?=
 =?us-ascii?Q?FtGzBDy1ApGk6SFe91WdA93aesi64VakCjukhcJkVnWjAHq7gJW0SOSkZQQm?=
 =?us-ascii?Q?JwgtGUlI17TXJIk5v9nAyS5OaKtKj+f27B6BoGBZFOAboUeQ1MFB3GNt72uh?=
 =?us-ascii?Q?9OCtmi/1IP71sib8/I8InUqwMW5YQkMzdFEY+EX2b6xzflDod8wfW5izDbmS?=
 =?us-ascii?Q?WLWPAUgPMwaNoYM7KtpbVfAAPt7qUAldbffkSzbhdzGdmBkReXy6iMOnC9h4?=
 =?us-ascii?Q?x5S7K1goGyy8VIndOILX/fzdPXqw6lhIG5AifcxDbCODtTX9W8kOzS7HnX6Q?=
 =?us-ascii?Q?LnysPoSrrqBreW5pQKqwhHK5/uHMOqipPbab+dkEzubXA90PiSzOBLheIRLo?=
 =?us-ascii?Q?eiOy6+/UgOn2JbWNcRdmBa0APVppHlx6Mtjoa5/8PP2AFI6XVAmMecNOA5KZ?=
 =?us-ascii?Q?cjGTMgyQ6JqbgkbZAhY0R3n9DzMXCy5ACuGbbvinc8uW3EL4Ha68xVX45aTX?=
 =?us-ascii?Q?pdpumaMiluG5hcOuXAdgqSMtG/OH95axqLAQ6nbyBBDkkKIyb7AV/4a2b5x6?=
 =?us-ascii?Q?Bq7z4geJL7kImslYwTxKae29JQwDj8SbRQJ/BZqJmhNxzXRN+QRD8RZwe6YV?=
 =?us-ascii?Q?DC75cFCFd2QUIOKnnebQfb2iUk4d52uUNbYN+m631035UqKJnx+rXWSdFn7I?=
 =?us-ascii?Q?ylNxjyzB7zL6G9MRL3eftZeZke5H6PCFDFWT/23cB9pjutEt+2BIzVNEKlYk?=
 =?us-ascii?Q?1sH64SMVJQbk1WkZqiW1l/CGMNVz9npYaq4vIaaqPnaHeGM4Gehf9foG+KOv?=
 =?us-ascii?Q?UCPH0Zxjm12X6xw/CqWItPU6cZ3RXkBYAz4GgNqMuoZm5QM4TSYjBawsnlMO?=
 =?us-ascii?Q?gMwOTJ6cyKHNUTjv29ZD/HLRkLVE5w2m8UCSKjRLU9OGiuXfXwtN9O53fZ1T?=
 =?us-ascii?Q?LHAY8OygH9qrmwMnmLlF1/q03nPmimSYVO1RBltqGHwmzkDlo+/Zq+8N2YYV?=
 =?us-ascii?Q?nJN56MghiuBOZ/UcZULozqgBNz7KgLa4bQuLhXHySCCowwZaY2D375+Mub5p?=
 =?us-ascii?Q?I5UAJu38vxa18wFYk1lVQkoka4/cU31iRbHq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9/T/zgZwJ/URPOdvDY+Us7rq2sFnRUoUZy5aIjDC4qu+iFrwW7ymcopdwCMl?=
 =?us-ascii?Q?suZ+ZnYIBYSnqqaRCLJYdtzh4iFkNckOGLaDbpL+G6qxmhoKiL7Ao7CT5ZYK?=
 =?us-ascii?Q?hXp9qqMPfOC77rxk4Ya9XLe2ybLveJwHVyFnQsSHPADYILVwXOomKxp0NxLA?=
 =?us-ascii?Q?KHxZaJ1CQxfAx957MduUQIgnYlO66cpUwbnTD8N0PgWcheVhpPmJ6Vt8E5OS?=
 =?us-ascii?Q?/rLU4tHEr/MSz6X3W8C0Owjr8bWGRtFUnRZwGa1inNfY2frD3mezL/p9FB2v?=
 =?us-ascii?Q?5tHiEx9O/wPW7p+kfaswr9OfABAuqbkucLD1O8gguipreAFD/wNOdmZmyuTH?=
 =?us-ascii?Q?Ln2z7ko4niuYreSRg2hoE3rRQPv2Ksx2k4zXIOEoVGq/Iu34bJp22hPvtQou?=
 =?us-ascii?Q?UmHtfP93yTPLHqSSB4kgr+aUQw9X3E3y9+oaXVfvtFtdOxinajhTBAyw5K22?=
 =?us-ascii?Q?JVOJG+JAaMKi8aLFcaUYQT5s8g2I6opthl658zBTAjHmDV1J1HLC9CuXmhUx?=
 =?us-ascii?Q?1jylQf7DtjwQhIF6NfN/zc69RC0N/B1dHNetanym+A65Otsz/ZkM3DfZrabg?=
 =?us-ascii?Q?h3uyVGItVSYFB13kmXCE+RcPxZ/xw2K6Iscpr+1mZ9AMXynTLG1JkyGFnEZe?=
 =?us-ascii?Q?J24hk9yF1bdjgcDJhDA17MRypHjy4enAfSs0EjrH5/ABY6pvM9tN+k80ZPVd?=
 =?us-ascii?Q?8hewxcUwQ2WPizH/fZAoIr3Ezg/Hcuyk0Qc5TyAk/qe0kA+a1nhC+7QtS0RO?=
 =?us-ascii?Q?SSW6skbXi257o4cHwOf+0LcaqMf8Tj9+K7BqXnYz9UL7+5rUkbiOfUDjvrMy?=
 =?us-ascii?Q?1uj7MO4BlWQYccyEB/LcSimHkVnGSXZgbeZngW+QsWA/vcPnG/SboTc187ap?=
 =?us-ascii?Q?xd6fskIIlRQqjttGyPd3S63z+i/PXt/XxPGUSIQgr6PMCeCOgHNhE45eEFhs?=
 =?us-ascii?Q?LQx2ARINuN8oCiYn8rG+8WFvGSAPLC24utnpe9ZIE/jtCxSXDrvEtiFx2oxs?=
 =?us-ascii?Q?kixcz36AKItMTF6QzyaE7P/lCUuRBehXKgQr4dTAgfNEADM7FMYSZSRTQy17?=
 =?us-ascii?Q?wtcODUcOH2UYKgdEpR91HpIriewvwfCF5Yb9HIKlTSYekNvR8gQSadTy1uLC?=
 =?us-ascii?Q?hpCWwp+BVbQ1LI1vJJgztZhDz5lyk8M7R/tImTmZhSTK4foNv6RhEMOxztVu?=
 =?us-ascii?Q?b5uEcuBx6k/yMch58dBhWcal4PYRNGNfz1dmf6wnA4KF7BehD8TvS9QouL59?=
 =?us-ascii?Q?F4oqH70romNgOD7SJd9AT/Qs24yBUjsvI20idnFuPd4ktptk+v1BXOWb656W?=
 =?us-ascii?Q?j59oKKedoaN1lKsKQ91szXR8lxMbh5zY4XJn/l+j9wcnxn9zVIz5KDGvz3eZ?=
 =?us-ascii?Q?VuaHkWi3UHfg8JYzpK4obCqXPxJul0Se8NceVtIBb2crgyoS0j0Hmg+Spxxs?=
 =?us-ascii?Q?CWxsl34o1RgG46KUlJejpfxDn3a4hdgfuoulYpG0YsZO/rCyuYqGi3dgEtlT?=
 =?us-ascii?Q?roHoa0Bodyzg4LgXByKw8vdkAV0GZyxxD7L7PhYDwFabQFyDyss9/K38W2kH?=
 =?us-ascii?Q?Z0EugT8tHfyY6KKR8MLIk579imys7Jsm5fQtX4ocBCwGjsEER+AK/2O6MqSD?=
 =?us-ascii?Q?yi9FyHXNCnyTvD5vKVHN/1I6K/Rm60hRnRuBBl3i17WnEwasQxRn6QibEq+F?=
 =?us-ascii?Q?uPfn31lLod7UgAP3ef3amb82vq3xSJo9jRU/54WMo+B2/F9DNd6Cd8D5SvpD?=
 =?us-ascii?Q?AwnZI7pLSPVOTf1cBHdLEzCG1mUExXo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7cfd29-ccb6-46b7-292c-08de5e1cccbc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 03:24:52.1844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n8Fmac+ydGdQitdKqQpRDG5LWJG9OtP0PcGigakKYsQMBKV+SxbBssu58cor3aa3Bp2xOFuw85ahYGgADH5cSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8234
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

On Tue, Jan 27, 2026 at 10:26:43PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Attempt to fixup reset, wedge, unload corner cases
> URL   : https://patchwork.freedesktop.org/series/160715/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4454-65d734d5fb564177d85062306a4873e14400fab7_FULL -> xe-pw-160715v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-160715v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-160715v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-160715v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html
> 
>   * igt@xe_fault_injection@exec-queue-create-fail-xe_vm_add_compute_exec_queue:
>     - shard-lnl:          NOTRUN -> [ABORT][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-3/igt@xe_fault_injection@exec-queue-create-fail-xe_vm_add_compute_exec_queue.html
> 
>   * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
>     - shard-lnl:          [PASS][4] -> [ABORT][5] +10 other tests abort
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-3/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-3/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
> 
>   * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
>     - shard-bmg:          [PASS][6] -> [ABORT][7] +10 other tests abort
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
> 

It looks like the fault injection texts are somehow preventing queues
from being torn down on driver unload. Nothing obvious is popping out
as a problem in the code. Not sure what is going on.

Matt

>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-160715v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-hang@pipe-a-edp-1:
>     - shard-lnl:          [PASS][8] -> [DMESG-WARN][9] ([Intel XE#7063])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-8/igt@kms_async_flips@async-flip-hang@pipe-a-edp-1.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-4/igt@kms_async_flips@async-flip-hang@pipe-a-edp-1.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1407]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2327]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@kms_big_fb@linear-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
>     - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +4 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-4/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#1124]) +1 other test skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#2887]) +6 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2887])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [PASS][17] -> [INCOMPLETE][18] ([Intel XE#7084])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2325])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#306])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-4/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#373]) +2 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
> 
>   * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [FAIL][22] ([Intel XE#6968]) +3 other tests fail
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-3/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-b-edp-1.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1468])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-4/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#3278])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-5/igt@kms_content_protection@srm.html
> 
>   * igt@kms_content_protection@uevent-hdcp14:
>     - shard-bmg:          NOTRUN -> [FAIL][25] ([Intel XE#6707]) +1 other test fail
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@kms_content_protection@uevent-hdcp14.html
> 
>   * igt@kms_cursor_crc@cursor-random-64x21:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2320])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@kms_cursor_crc@cursor-random-64x21.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1424])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#309])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - shard-bmg:          [PASS][29] -> [FAIL][30] ([Intel XE#6715])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>   * igt@kms_dp_link_training@uhbr-mst:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#4354])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@kms_dp_link_training@uhbr-mst.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#2244])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-5/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2244])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1421]) +1 other test skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@blocking-wf_vblank@a-dp2:
>     - shard-bmg:          [PASS][35] -> [FAIL][36] ([Intel XE#6266]) +1 other test fail
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-bmg-8/igt@kms_flip@blocking-wf_vblank@a-dp2.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-8/igt@kms_flip@blocking-wf_vblank@a-dp2.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1401]) +1 other test skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2293] / [Intel XE#2380])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2293])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#6312])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2311]) +3 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#4141]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#656]) +9 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7061]) +1 other test skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#651]) +2 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2313]) +4 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#7061])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#6911])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-0:
>     - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#7130]) +16 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-0.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#7130] / [Intel XE#7131]) +1 other test skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-5:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#7131]) +3 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-5.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#1439] / [Intel XE#836])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
>     - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1406] / [Intel XE#2893]) +2 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-5/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#1406] / [Intel XE#1489])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-psr-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@kms_psr@fbc-psr-dpms.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-render:
>     - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1406]) +2 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-render.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-render@edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1406] / [Intel XE#4609])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-render@edp-1.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#3414] / [Intel XE#3904])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-3/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2330])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_vrr@seamless-rr-switch-drrs:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#1499])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>   * igt@xe_eudebug@basic-vm-access:
>     - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#4837])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-4/igt@xe_eudebug@basic-vm-access.html
> 
>   * igt@xe_eudebug_online@basic-breakpoint:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@xe_eudebug_online@basic-breakpoint.html
> 
>   * igt@xe_eudebug_online@pagefault-one-of-many:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#6665])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@xe_eudebug_online@pagefault-one-of-many.html
> 
>   * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
>     - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-4/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-bmg:          [PASS][66] -> [INCOMPLETE][67] ([Intel XE#6321])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-large-external-cm:
>     - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#688])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-3/igt@xe_evict@evict-large-external-cm.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2322]) +1 other test skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
> 
>   * igt@xe_exec_basic@multigpu-once-null-defer-bind:
>     - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1392])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-4/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#7136]) +1 other test skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue-invalid-userptr-fault:
>     - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#7136]) +3 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-5/igt@xe_exec_fault_mode@twice-multi-queue-invalid-userptr-fault.html
> 
>   * igt@xe_exec_multi_queue@many-execs-preempt-mode-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#6874]) +9 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-4/igt@xe_exec_multi_queue@many-execs-preempt-mode-basic.html
> 
>   * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-dyn-priority:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#6874]) +4 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-dyn-priority.html
> 
>   * igt@xe_exec_system_allocator@many-large-mmap-new-huge-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#4943]) +7 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-2/igt@xe_exec_system_allocator@many-large-mmap-new-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-many-mmap-huge-nomemset:
>     - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#4943]) +7 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-5/igt@xe_exec_system_allocator@threads-many-mmap-huge-nomemset.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-rebind-err:
>     - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#7138]) +3 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-5/igt@xe_exec_threads@threads-multi-queue-rebind-err.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2459] / [Intel XE#2596])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_module_load@load:
>     - shard-lnl:          ([PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103]) -> ([PASS][104], [PASS][105], [PASS][106], [SKIP][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129]) ([Intel XE#378])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-8/igt@xe_module_load@load.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-1/igt@xe_module_load@load.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-8/igt@xe_module_load@load.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-1/igt@xe_module_load@load.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-8/igt@xe_module_load@load.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-2/igt@xe_module_load@load.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-2/igt@xe_module_load@load.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-4/igt@xe_module_load@load.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-2/igt@xe_module_load@load.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-3/igt@xe_module_load@load.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-4/igt@xe_module_load@load.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-3/igt@xe_module_load@load.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-3/igt@xe_module_load@load.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-8/igt@xe_module_load@load.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-5/igt@xe_module_load@load.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-1/igt@xe_module_load@load.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-1/igt@xe_module_load@load.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-7/igt@xe_module_load@load.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-5/igt@xe_module_load@load.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-5/igt@xe_module_load@load.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-7/igt@xe_module_load@load.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-5/igt@xe_module_load@load.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-7/igt@xe_module_load@load.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-7/igt@xe_module_load@load.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-4/igt@xe_module_load@load.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-7/igt@xe_module_load@load.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-1/igt@xe_module_load@load.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-1/igt@xe_module_load@load.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-4/igt@xe_module_load@load.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-3/igt@xe_module_load@load.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-1/igt@xe_module_load@load.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-5/igt@xe_module_load@load.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-1/igt@xe_module_load@load.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-5/igt@xe_module_load@load.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-5/igt@xe_module_load@load.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-5/igt@xe_module_load@load.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-3/igt@xe_module_load@load.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-2/igt@xe_module_load@load.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-2/igt@xe_module_load@load.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-4/igt@xe_module_load@load.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-4/igt@xe_module_load@load.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-4/igt@xe_module_load@load.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-7/igt@xe_module_load@load.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-7/igt@xe_module_load@load.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-3/igt@xe_module_load@load.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-8/igt@xe_module_load@load.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-8/igt@xe_module_load@load.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-8/igt@xe_module_load@load.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-2/igt@xe_module_load@load.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-2/igt@xe_module_load@load.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-4/igt@xe_module_load@load.html
> 
>   * igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#6964])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html
> 
>   * igt@xe_multigpu_svm@mgpu-coherency-fail-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#6964]) +1 other test skip
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-5/igt@xe_multigpu_svm@mgpu-coherency-fail-basic.html
> 
>   * igt@xe_pm@d3cold-i2c:
>     - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#5694])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-5/igt@xe_pm@d3cold-i2c.html
> 
>   * igt@xe_pmu@fn-engine-activity-sched-if-idle:
>     - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#4650])
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-4/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
>     - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#4733])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-10/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
> 
>   * igt@xe_query@multigpu-query-pxp-status:
>     - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#944]) +1 other test skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-3/igt@xe_query@multigpu-query-pxp-status.html
> 
>   * igt@xe_vm@out-of-memory:
>     - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#5745])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-4/igt@xe_vm@out-of-memory.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-lnl:          [PASS][137] -> [ABORT][138] ([Intel XE#3119])
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-5/igt@xe_wedged@wedged-at-any-timeout.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-4/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [FAIL][139] ([Intel XE#301]) -> [PASS][140] +1 other test pass
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-bmg:          [INCOMPLETE][141] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][142] +1 other test pass
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-bmg-9/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_setmode@basic@pipe-b-edp-1:
>     - shard-lnl:          [FAIL][143] ([Intel XE#6361]) -> [PASS][144] +2 other tests pass
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html
> 
>   * igt@kms_setmode@basic@pipe-b-hdmi-a-3:
>     - shard-bmg:          [FAIL][145] ([Intel XE#6361]) -> [PASS][146] +4 other tests pass
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-bmg-9/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-bmg-2/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>     - shard-lnl:          [ABORT][147] ([Intel XE#5466]) -> [PASS][148]
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_exec_fault_mode@once-userptr-invalidate-imm:
>     - shard-lnl:          [DMESG-WARN][149] ([Intel XE#4537] / [Intel XE#7063]) -> [DMESG-WARN][150] ([Intel XE#7063])
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4454-65d734d5fb564177d85062306a4873e14400fab7/shard-lnl-8/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/shard-lnl-4/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
>   [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3119]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119
>   [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537
>   [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>   [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
>   [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
>   [Intel XE#5745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745
>   [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
>   [Intel XE#6715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6968]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6968
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7063]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063
>   [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
>   [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
>   [Intel XE#7131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4454-65d734d5fb564177d85062306a4873e14400fab7 -> xe-pw-160715v1
> 
>   IGT_8720: b37a4d70080afd7426cb249787545df75f762dc0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4454-65d734d5fb564177d85062306a4873e14400fab7: 65d734d5fb564177d85062306a4873e14400fab7
>   xe-pw-160715v1: 160715v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160715v1/index.html
