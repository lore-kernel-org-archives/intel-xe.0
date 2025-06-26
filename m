Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C67FC7EE33
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 20:58:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BEC189023;
	Thu, 26 Jun 2025 20:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PCDtKEws";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEED89023
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 20:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750971504; x=1782507504;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=J4vYuYw+EWRYOXKB2/kG8MtgJgq7t3stwn6ybPh5p0U=;
 b=PCDtKEwsb6IV27lCnPDodG3hAIKZOhiN9boGAFCB6G4lm2IuhJiv6l2/
 3kXCE6NzPzXMvUSB+ssnz1Qp3QRpg0AMCeaFfTHZer1UTeGWc1VoX+J+T
 pNPIrvCDzCO0T2rEO0Oz++HW8t7n5tO/VRXEghWpojyHWJpY8t+ifIaxb
 AXk8bclTH2ZdSF7tfFoO610c+Tn1moj5RLq3qPN8QnjQOzCWuwcfzOIQv
 S8nOaAfpH8DE/vn00GcCKzo8QBldZ2AlZu+FseMK2XmgYfPlsbiRx8ARC
 OniYASxl696NiIdTFoaHiOZZa4SMJKnZ/qUQ7GgoFOiY4NkakOSXfPYux Q==;
X-CSE-ConnectionGUID: oG7zbhOFQACjDUG97XLLjQ==
X-CSE-MsgGUID: ikftyiNRReiftOptXJ9mCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53225020"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="53225020"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 13:58:23 -0700
X-CSE-ConnectionGUID: g8HrxgpPSVWT2VwqEGwMVQ==
X-CSE-MsgGUID: a58BEpXJT8i0mr7Oe6n1lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="153142581"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 13:58:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 13:58:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 13:58:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.74)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 13:58:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DK5OLbGdVvqqGCy71IotuTomPfRQnt8cMlsM+oY9dnJFVvc24YGDGW6c5OavatSZmCitfd2EhSiI9gshMeZzvbiv+giWL584AX65vEfGyOoaGPvm/5SvBiapDCSBfjxZaegQw+tGuxUG44CA/y1gDZXaSUd3eans69M5xMYfPb1dXK/ToG+O6Efp2JJnV6t2aBCTf/R5pwhQvysoiQ7BKPRpXpOTaRVcKT70gQCaks/yr1uNXskE4VwXiV74mz1gjVgySw83IpHdR5TtDXZZcZ+o4d9e7d3ws07lziyaiKhiX94L5XNeHDkKZZZxI/pJfv8z2xB49HDQaaEc7HxWyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jv6iK2Sj6Hk76gXy4fbTHTZvg+cREUpaIUUfQMJb4ZA=;
 b=TuzEY/Hu7p0aSxwkmb/eG7cvZ1ZYMHHdxXT1Elw5EmUqxJJeSia8WNqn+G/kdRBTVNBJUXqwmfNEq0/phZ12jw7rpi26+ezn1BOqXHmsHP9nseo4/tgPhZj6CckkLzyL5fP0UpB+6t98h1ISBhHB3YWtSU0AvSlnTlia+nnP4BQGtY67/xOcaO2bTqCyDhiSkvOMVia0f5CZxCpgeXsNTimehspdhiFxcv7+4orHX5PALsKw89ghKu7qmfHtX5y2yUPMQ9cLedPvqgw0D62cyz990b4QNXnxVvosN6AEMsTcYWfOxK9kRVX2w4BCT+Z79bJcMsmPRyl5swZTc4CVMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6612.namprd11.prod.outlook.com (2603:10b6:510:1cf::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Thu, 26 Jun
 2025 20:58:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Thu, 26 Jun 2025
 20:58:19 +0000
Date: Thu, 26 Jun 2025 15:58:16 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/7] drm/xe/ptl: Add GuC FW definition for PTL
Message-ID: <q3bebaqsclcdtvapcjfcgdq3nhnyuw4zfnv7ufdr5urnqv3amf@swcvl252yc3g>
References: <20250626182805.1701096-9-daniele.ceraolospurio@intel.com>
 <20250626182805.1701096-14-daniele.ceraolospurio@intel.com>
 <ofqsdn5lbok56ekwcucazr6hwud45wzkd4nf7oni23j7fuemma@ogs6yalxcr6h>
 <474b9d57-7d52-4f16-86d1-c61a5fe1f320@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <474b9d57-7d52-4f16-86d1-c61a5fe1f320@intel.com>
X-ClientProxiedBy: BY3PR10CA0011.namprd10.prod.outlook.com
 (2603:10b6:a03:255::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6612:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f022592-999c-4fdc-7fa5-08ddb4f42da1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8K2PWThOACpe0FgytbR5GQ/3vxVfrhbzXpYVvkEEkGPBp4h4/bJZapdjRdK5?=
 =?us-ascii?Q?u6KI5wTc4CbsWA91kPAQTTS373A/in3qqtJbhggAXe9ZDkMFds9gmWO0FiXE?=
 =?us-ascii?Q?jy0K2np5sNCk4QB17BYxh0DlYV7x3DoIY3d3hMte47cBhxRTUkGSOJNoVEJb?=
 =?us-ascii?Q?6CRKVhWJ6MoXSnEE3KXHQhzlZ9rdmCmb45l3DHSNi2vVy6xjpcTomR2gaZlT?=
 =?us-ascii?Q?BTDrD7MKcWedhl8YFKak1p4K30FC5zVU05rgnFrPixTV5d+/ZYIe0WpfGaka?=
 =?us-ascii?Q?8VDL61z3Akj/97ykOrpX+MKzbSuQ6dY7W3ZCEoeZ3NVG514plQemAJs8uMhw?=
 =?us-ascii?Q?OAstvlyIOB6ejOf0pAqk1VcT61PYLo9UFsOOkunjP/Op2OPtAzjmTevqi7SL?=
 =?us-ascii?Q?Rfj0XDKDrv3InALlBr4Q4C+gtnu8NS218eqeSyqT+qXH4LtDYkUFxeTeSIFq?=
 =?us-ascii?Q?D1LXXUXW2i2oMwQFTgQx2k2Rv8ogoHxXZSNbcGo9Cx5C7RpJhK+JO4hb8pZb?=
 =?us-ascii?Q?bRnhaA63bc+jB6T52si9cFT6FMtRfiWkkBcS6MpjMzR3Bd517JLfqZ96e4/D?=
 =?us-ascii?Q?heR1ipAwKshGyXC0Z6eujhvbnvmKoehWVAlomeMsCtTjTiYv8QjyuP9jfeVb?=
 =?us-ascii?Q?YITs4HxCEHoEozn5sDF0XrsVOHDxp9hy27zF98tLQcmwkHbt9sD1qqzdnHXJ?=
 =?us-ascii?Q?YOw3MsCTyhUUbi9ffPRvRx5Ysmwk1vJagJcdVksYiUzEpqvWHg1I57reLxn7?=
 =?us-ascii?Q?eu4pLop0RkJZeCW0PTNKMUod1iBVoUCNwkApSuWETQKlBAULz0RWoKe2k2cs?=
 =?us-ascii?Q?lmfjbKr2hjIzrcUM/u+nDoMeojo3EUJLM3LQsomr9s41dIMC876IqsruLJaD?=
 =?us-ascii?Q?5Ktdm/mNa0W/tmlZ50fTipQ/cLrIabrZYe7B9IHHDfuc3W4P3f37MK9EL+Bq?=
 =?us-ascii?Q?N7kU51pH2oYdAW1aqGGmfPAOVq58iRw3wAoyXNNrRLJ+enmeO6KMvTA5zdsk?=
 =?us-ascii?Q?z5lGX1vznVKzlotakiR3Lf9A7fBTR13JVHFA4CfGcGRUOpvNwtr5Z630b1EE?=
 =?us-ascii?Q?NxdRSIHD5rZo+Wu1zFp2bGvFeegyx1/aL+tGDXZXzWI4qMDrcP+x/RJZ+5uS?=
 =?us-ascii?Q?A+fHWEkjNSDEehwhwFqLTZo9N7yHSqKjKtGO+jwX2rxqc6WSKt62UzAPirch?=
 =?us-ascii?Q?OZrwYZuM27HgK5CG7uQLFqiGlSP2BRLq7Y4vRZ06PWgHz4BIP7BuTQxBXkf/?=
 =?us-ascii?Q?95BzfPTI0VnEBZzw8n0a2h8MVMrHc+pgnQ2e/sT5gmni00HeDb6i/nsb+Scn?=
 =?us-ascii?Q?r2UIQ48eBC8dupzlmOrLYC84GUwp1aPUlC/fxj3tE6FBdZUvXCmtkBaO9cmx?=
 =?us-ascii?Q?WzyOvjN0GYiWJ1XFSzcSO8pcdx7ppMnIufLO/Jl8cLM4d29DymIr34lqCS/x?=
 =?us-ascii?Q?NPWDlIHtthg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1RSsaiXfijPJQ/26xsBFnglaWfScUtxvfVaX98nlGMq0txcApCQ5j0WuUBO2?=
 =?us-ascii?Q?PiwR8OboJbLxJJOuQuqQCeh1ynEQlpx4o51pLJ3IxmHaTbV7wR9o+mBdtqls?=
 =?us-ascii?Q?ipNzl5/8Z3H99vlNOVnzaEzZBeBsxcTXWnIWqS+2HD1rklUqB4+aQs3aKCzr?=
 =?us-ascii?Q?U8pFfGARcTtFOrU58lK2P88oRL52Kgue4wA/bOSkAEDKyGzqvTW60W9xBtI9?=
 =?us-ascii?Q?ZeIhOv7b08yDa4JiOPKUD4tWhHkubFgWEdMlEF+ivVd0rMYPPOzU348t1leK?=
 =?us-ascii?Q?juBp/tATY15lLrS3TykZuKZn7ZsBBZzcdXf2hJafmV6VdjF57Tik9U3EeleH?=
 =?us-ascii?Q?jHpnjbrVlSp1eua9CCTP4nytNNHtRcVp3j+/Bd3vkHHlIRIB9CJeV/pK7Tho?=
 =?us-ascii?Q?iHtZ/z9TqA6sk9Pyp5tt0504ANo+djPfWdfFxlvsShhPWLg72YMJ+V/v8RWp?=
 =?us-ascii?Q?JcwcyXwwavJBcrtqIlnjN0BrqaBJnOEh2QeUBG8sgvRbAqzWcNIMfJ3RqOXC?=
 =?us-ascii?Q?fQcdyFplZ7UOIyfyLqbEmadCzJWdQhBjTmFi8pbJlCHswHzzUGkPF0pygjiI?=
 =?us-ascii?Q?B4dzTuIyaW2mmRG5tOxyQn4LlBpxYqGwf4I3HdYDp2DVvpZINm+7NVDbvmhw?=
 =?us-ascii?Q?x0N+NqYGn+qlt9gp0ccIQ6lBBQ9AUBCiKDK06reEQYkdf2tuVQ+nFDwh0DsK?=
 =?us-ascii?Q?yM9iaVz5fY2DejrO6VZG/XfXiZIiI56kml5KAILolPqxCEeOw5OURleSh3jD?=
 =?us-ascii?Q?/463tEkXqXMYwDiPAXYq7gqoSweSzdkUZrfo5X4VMcFdtLTm9fb4EPIYtu4d?=
 =?us-ascii?Q?VRTRXTxx3+qOcuYR3Cqdb3Gf6hwtnAXXMdFCATvXkUFcp0MDi+m2ZXP8W/Bn?=
 =?us-ascii?Q?5V+B3NwJ1DZGdRuUM++f69sf1XaaInd/kGE7xwV96gvS4PtQlP/FusdRvhVG?=
 =?us-ascii?Q?gUmLtMdd6m7Yp07n06I+kS6JtbupyFaE4Amo4RZ8s2rYrhRinhp+KJQdAI31?=
 =?us-ascii?Q?0yhWGtjhVNzg7Supi2OMoO2W0WuI5pR2EuWLSO6WvzIFe2IjI/VaA/yOy8XN?=
 =?us-ascii?Q?0h46qw/ubt5AVCF+84KRW2YaqlrLeGHd3FFOAdaWETVqArZ2Js+v+D6UnOpp?=
 =?us-ascii?Q?VkqQO96mCDxaAASonzyPsIuDtlH7TX8K9Jn3Bf6wUaqCpdSmr2l5R1uEjNMM?=
 =?us-ascii?Q?Ri9NexpTWmM83wltLnrHNtP9yMVsQHiIWgJ8PZOxN9ITH62A/PvaFVP/vjAx?=
 =?us-ascii?Q?qZBQ8QYzsAEdymp9BqSj10uBTl9ZyOFcSbYahKRaxDy+2BiEiRXfutYgjw/R?=
 =?us-ascii?Q?k4k1IRDxn+9Y4LUwOq+RRR5nGp71GxuoZvMZUJ0W4mYXkQ+2qKSqAWxcSeo4?=
 =?us-ascii?Q?aaGsk5JnGGZOEGWTHyUus6P1o2pbtx6rRbGLcTHPgaBgf2/dFVsS6w3eReEu?=
 =?us-ascii?Q?Z8I+jNuQUJSyvjU1oCMcbVct1r+RIb8gaGF8nYxQfRefW18r89AjQKolZQxt?=
 =?us-ascii?Q?M9h0fSpJ7dR81q1DLDZ8mBU33R4ZEqxRLBAbPDG/FGQfN7zSZGD7erEJ/Svs?=
 =?us-ascii?Q?YlwE3rA+dhvngNveujBYK0MJYwNynf1ZFwpdXldboDDt+0BHEzTFAejDO69s?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f022592-999c-4fdc-7fa5-08ddb4f42da1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 20:58:18.9643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2RkceHpyAYtrzNJW5gOFLtDTV9pj9P9hspCd+Z04Gp/R5lK6/GBNM9xkX65cJ2h3O3IUOJYOv2rdZWIQWG0yXwJzrHxz6I00ge4oHWG5UJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6612
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

On Thu, Jun 26, 2025 at 01:00:22PM -0700, Daniele Ceraolo Spurio wrote:
>
>
>On 6/26/2025 12:03 PM, Lucas De Marchi wrote:
>>On Thu, Jun 26, 2025 at 11:28:11AM -0700, Daniele Ceraolo Spurio wrote:
>>>The first official GuC relase for PTL is 70.47.0, which maps to
>>>API version 1.22.4.
>>>
>>>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>
>>I don't see this version in upstream firmware repo, only in our
>>intel-staging branch. Is this ready or is it just for CI?
>
>This is the final version of the code, so it is ready to be reviewed, 
>but I wanted to wait for it to go through CI before moving the blobs 
>to linux-firmware. The plan is to have the blobs there before I merge 
>this.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
