Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0EBD30CF5
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 00:36:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5C210E56A;
	Wed, 14 Jan 2026 00:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QJ4x/5/f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49B110E56A
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 00:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768350975; x=1799886975;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=I5RPRK2qIwgVwrNY1JycMm7cJTIbGMW/DmTF0q33PNQ=;
 b=QJ4x/5/fN7gYPUvpOgPgU2YxKHKzYk5xsIk1re5HxbQxxLNKvB3iXzec
 cfRxbnhISHQqIxQSSmR73+BFFGSQpqIjQtJsMfYXbF9hUqzrAqYS4w79j
 jKf7g7uK6+6/3WQDBoLuDPHXwM5nGzDv8Wv4Fxux19mhQu0YP+7EQG0Yo
 e+7oLfMW2ccp1U6568YrWclkS8PlrEXObGvpmDKHCbHCCo8fXdQMyNiAZ
 g4+wr4AYBTibRLqDDMl619qjK1hxLDy07erPedqRkOXIUSq8eMHyc2D4E
 OJmLxqHduifaSsPNdDrq+shEKoV6OoaNkevVXQ6wtZFo1vfGmcId/e/Tf g==;
X-CSE-ConnectionGUID: Op9ErIWPQCm/HH1f44iz8w==
X-CSE-MsgGUID: lNM62eOuS6aaQI8P0nIDEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73504106"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="73504106"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 16:36:15 -0800
X-CSE-ConnectionGUID: sILy5kBpQMiOGbL8Mq7Ubg==
X-CSE-MsgGUID: yosPP6bJTpOjqVihg2oBtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204552996"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 16:36:14 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 16:36:13 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 16:36:13 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 16:36:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Auo4k9ibFX4sb8gfMT/PuvJ+5YTb62ee9SPe1lPtoCP5i1q8WfX6tWncgPxeiBTd3KElzD7UWM5OM3H61qzZy93hWSwe07y5l9wQl87wJeme3r7YWTNQxEvBgjWf9baeAJ/Hfv12mlKNXkJhmQqNPcGUViEmFVaKQG5fs2z9ile5j533BcFtDbqoEjSiQGsRhHSzssJNnL0nNQOJ8iFqAKY8A1dNnrQjBQL2oNMqgbL5RZJJOaQPP+Fis+3wHQUJFFtRTwhc6eUa3wR+L/HdfmsTcZtXUtme6CR2RNPuekFQCcbMbwk9zB8kURoW+/1IdPLICr+vBwkxbJ1+Q/fQ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f01P7C9oY9wYb9rsrfiOwxFZjBLgH1ZJAWLDPN867JU=;
 b=YtOp1osYpKNzykRwVdhe8Q3dUgw+M54RpWfjHBQhDyzXgEHPeEyx+dwd8vMzEWj4mkaCULPIxgBnVVkkwxk61cLcvlK1Fy8zQCmuuV7ciifcMWjED1cGg9Cw5wRjfNcWejAToAjxrax4OazalZeGLBu1iWRKAUAatxGMPJNhVna2kmo9G8zCbi6LLjuaaCEIoayiFVacVe3GBUosZLl31K8Nd2K0X+yfHMxCu8vScf5UEOqB4vyO9OCGIwdjjyqmY24yqhMlBlO+jTQrkaguJlZ9jxuaNt20T2R8ylR8TSIEOGh9vayW1kvcYCKHMgkxOG/lfyH2p1MkJm82EPinpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM3PPFAB693A2AC.namprd11.prod.outlook.com (2603:10b6:f:fc00::f43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 00:36:11 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9520.003; Wed, 14 Jan 2026
 00:36:11 +0000
Date: Tue, 13 Jan 2026 16:36:08 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 00/79] Cleanup unused headers reported by clangd
Message-ID: <20260114003608.GF458797@mdroper-desk1.amr.corp.intel.com>
References: <20260113230315.3081153-81-matthew.d.roper@intel.com>
 <aWbe/6D9Fvmg9rzi@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aWbe/6D9Fvmg9rzi@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BY5PR17CA0049.namprd17.prod.outlook.com
 (2603:10b6:a03:167::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM3PPFAB693A2AC:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e17b01b-21b3-41b8-79aa-08de5304ea30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pPj51spbLfeWK3wWePMwXfBZzojfDkb8k2gQfX/yE+ux6xjdhdQOK+eGojXt?=
 =?us-ascii?Q?VT5+M3RGYmyKLyRHeT42FHUMPN9mgEsbjEhOlvQXVKsvqr/hzQS3cMJV8DkG?=
 =?us-ascii?Q?xFebMimona9UX5iFW+eXU2aq+N3rQ3jXP6ifCjfHUjsl8pntzRxspsJ3bEPN?=
 =?us-ascii?Q?hPLd3zGESIyGkEQHUxq2sOfelIFKAAcvXCtWFKP0ZqVeEC1IeNQkFht97Fr8?=
 =?us-ascii?Q?DZD8/OembH223rYccR0zPrTiwRlAkolS+DWqg49gijxJhnP2JIfViiLp4hG3?=
 =?us-ascii?Q?8fmFSLLSCE3bUoif571AC81Rmrs3p3Br36tOrS8Qvt9J2j3KutKSaIRJ44js?=
 =?us-ascii?Q?tJJPfnh3k76T/RCxBaY0tnBwI2uuDXLg9r+faePBit080Wcydjeiq7oiX0J8?=
 =?us-ascii?Q?Zw9pfN8B5gjMqaTA0WFqW6LepodOlgTsbQilk2YnM8BFuE+dcooW81JAnJoF?=
 =?us-ascii?Q?7yOaXL3+2ELOnfZuJ6To6KfRstxmts9Y4l8B0E2FpvkVDDIijcvP/RDy+3cb?=
 =?us-ascii?Q?jTWOOs09nOw27ZSP5PYkiC6rJcfMfH0prxAsrfFzkgeuTNrkA+OFZaOUprET?=
 =?us-ascii?Q?sjTB12gBfOt/hVp9RssYp94JFDBLKYq/GpdCU+RZBPqVLSWlQ03Io/aPMpY/?=
 =?us-ascii?Q?qmjXR5X0Upt20HNTPy6Wii07D1zwZSsM9CBs5dakW7Uyy8F4fpzJsOQHKapX?=
 =?us-ascii?Q?FQCPaclgAuh1vM7dSfrmbx8iTbO5dwohF1wv9RxpwBTlwJd67S4RYGQe2G/K?=
 =?us-ascii?Q?tokKk4sWAGDeV3UAfRU0o18BPLrVin6EsjqNhEbaouuBeECB3woGfhCca688?=
 =?us-ascii?Q?O7Faf4zu/RyjkUF5IyLQl8kcaQ+2yHF6q6mq1REYmgzBZRkAYkYV/kr12m4s?=
 =?us-ascii?Q?/IGJO3La+6hIGSxQmYaUiRo8/k+UP6VjZ8av8zTJxm2Z4q63hxcRVD532ymk?=
 =?us-ascii?Q?PfYafwnjVDGEl+1S3lTZXgzkKMMznAgUaWwN3LiHnNhYqRtS0XusEmmakd9c?=
 =?us-ascii?Q?dnQMTtVaqvpg+IPdmzkNlrsYMSPkCUNEWYVktmBxeRNq4iXnzgPWilPGJJ2o?=
 =?us-ascii?Q?WIvmCjSbUwyF3IvK4l7CpvLre4zR+xYOKNgxMZqKeNT53sdZO5lEfhm3EGhd?=
 =?us-ascii?Q?sXXKbtRhrfZFRgifFMcJRaQgtJ9MLGNSKogw1XFF5ywejZRfcd8wv30aHQ/e?=
 =?us-ascii?Q?mi3n/RW8Il3k4sRdJnfG8ua683ei1xDksihS1TDv2p4Kt5tO/o8w7aAMsc2I?=
 =?us-ascii?Q?BOUxms24Cu6QLuhA3IUtwJSnG0GAcwAVpaJhQfXASY59gFsftA2e6tdLP2fO?=
 =?us-ascii?Q?uaSl2y1I7aVyM/kHh8n7ijYE3fDq+jNvv99beORP4krqIf5om5Nyt0t4Hkf3?=
 =?us-ascii?Q?FQPMuHYBPlGv6xuM3RG2uZFq1R2hC8UWnadB6F0VEjMJspLycQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4QlyHTDTBbh2qctAQLVyqg1luH/9MaFY8a+9QogbdfUnq+v96UrvdLRBkY7C?=
 =?us-ascii?Q?RzRKkfeauSt8PdQYZKqdPHaGjTllGB2rYwCyDmewY09NFytbpMivQIj98eK/?=
 =?us-ascii?Q?Gq/dgl6Pyn4h1uy8U55lU9GJWaFf/9JSpOB9ZF1P1SeSycoHmSAOcnMofmDM?=
 =?us-ascii?Q?KVWanpCbqvqZGf3k4GU62RIz790CtOilFxjtzuJCQrLEf/skM2C+Ab8ZEcnm?=
 =?us-ascii?Q?/BzBurQLpQztrzD0DQX3LDKac4CamssaDHoTzxf6BrBLENSrgqXzG7LyERYW?=
 =?us-ascii?Q?OFKIUzhPn1BvTMYils6oiNJtpFMUlmwpzT/WWl30GqUdSmyXaWmYnniyJ7TN?=
 =?us-ascii?Q?VQs6KcEo0RBB3Ebancf9t3kx0eUXCevBO4MeU9LO9291XfJ0Ac0gexyfOvO6?=
 =?us-ascii?Q?Y2Voy3kdW0AxkeoIg78LKegsP2qQEFZNwNxU5RmxzrMJgZA5KeXZNgwwaeC0?=
 =?us-ascii?Q?v1Q3a80dziDrV4dNx9+DKj+vxSgD4ISP8Fu5NDRUI3tjTxB0BMrThqZQB/Oh?=
 =?us-ascii?Q?T3I3Cf+v3v6MDi7enIh6fvNl9grVkSA9WlBt8yrIunDXXgGWRZxo17ez9wke?=
 =?us-ascii?Q?kTvDPBSiQpGe1lSQ2Af2wBeOAYdd0/vjpLaUAV8tmN9cikfsnqByyqNHTXBc?=
 =?us-ascii?Q?tA3ZGneINvVIqhI9YuBpVZa5Z+MjHVl4luozv9JN5rAEbEkSto4NcyZ+VzmR?=
 =?us-ascii?Q?RlyeTcnYHv8P7ur6stsdAm/7rtg7y/nEjQ/yhX7sUVNJNpP4kGyXoNSvfrun?=
 =?us-ascii?Q?6prGncbFaxQjYRbJL1lG3zWNvZnGjhASB4jkEstPgPF6qHZTfDZop3qlEO9U?=
 =?us-ascii?Q?Bc40DqDcu+aS5nLvCjseLH8g+4kKtWU4Ro6LGebpjszDCXs+AJT88rHa/9EQ?=
 =?us-ascii?Q?CsGdHrHlyF74kEUQG19GqmI3ZbwYemKx56C11PDwXo6PiCauEj8+walda2Wm?=
 =?us-ascii?Q?4yP8wjrkSZNeZTwa1aNWO8yKSkCqTtlD4AvHYwyEVzk0DjcKvSh6nhZzlvQ4?=
 =?us-ascii?Q?FfwQXM/ZICqFpMinVoxfoaCZBKzwFtQzhvHTEtXlDO6EiPlgwZqAO702uWei?=
 =?us-ascii?Q?9S7q47QY0Zos6EjKo2GQ12u9TQCwcxWtoUXXJOYY/ZMbquvSDxqkQhsvh8jh?=
 =?us-ascii?Q?RsvKYxzxyhyB2DF/MudCGimOsQ/SeaCWIob0ajMxeQkdcd0iyPRuRHbtHs+8?=
 =?us-ascii?Q?7EBjzNCLSVODznqbWkqXOb139GQpeIuokSQh2Rz4G03/EPQodl+qj2UjrfEi?=
 =?us-ascii?Q?lYXsnuH581JdbFzVuEgei9Klnh47Ws+5dDF5GTCvQnGhgrO7k0YdT1ZS3/ic?=
 =?us-ascii?Q?3uMqc9B2E25erV4SYMhIicMR5xGfU25bgpvsS1VzBJS/oxGzo+VRPTjbeVDn?=
 =?us-ascii?Q?S0BJzlwOmiAf1sTV2fG3MOQbB5jNxaQs6DKr+ad8jmBS4hjagM8QFAsgjnR0?=
 =?us-ascii?Q?EBxDVBrfXr96ju9pWIo2+O0SISilv4TxNYX2TmvGVsGOj4qYfEXE47FTIwZs?=
 =?us-ascii?Q?rRHixYOssWUUfdk6JXZrM+lsKdTNxLgmHDBLDmO6ZYB2WauP5a3s4+ajVSSc?=
 =?us-ascii?Q?m2N2vzN6KM15C32GwO84Nt7NYb7OI5eo+UPY/MPugF+UT45iIll81MShwwdH?=
 =?us-ascii?Q?jG6f26u/jTefKahkCdMC+YyQgr5iIuL7txzUZaFc02IyrTnAU450CgKjqKzW?=
 =?us-ascii?Q?EbkGmqo/aWBP/f4OvO0c/LtOA+jQjkbx0IdYCgK2efgtDQZwh5ze4nYgxBM0?=
 =?us-ascii?Q?2EX5OxauF5DxJnGWyrL2VU9eFUeoqTc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e17b01b-21b3-41b8-79aa-08de5304ea30
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 00:36:10.9411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFNPhpwbBFE2QFNh2SbYCpWdJrC5aFw2W354+DPQ8V0JDYmHl5vMgl8ggeLv0D4RN1pjaoLbzs3BoDjzU/iSujTSVtsh6CoHFxjlkp6G278=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFAB693A2AC
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

On Tue, Jan 13, 2026 at 04:10:39PM -0800, Matthew Brost wrote:
> On Tue, Jan 13, 2026 at 03:03:05PM -0800, Matt Roper wrote:
> > clangd[1] helpfully flags #include's of headers that aren't being
> > directly used by the file including them.  In most cases we can either
> > drop those #include statements or replace them with a more targeted
> > include (such as xe_gt.h to xe_gt_types.h).  Let's drop/simplify a bunch
> > of the unnecessary includes in our driver's .c files; this may help
> > speed up partial rebuilds for developers since the build system won't
> > see as many false dependencies.
> > 
> 
> Yes, header situation isn't great.
> 
> > There's more header-related cleanup that could be done (e.g., some of
> > our headers incorrectly include other headers they don't need), but that
> > can wait for a follow-up series; this one is already long enough.
> > 
> > 
> > [1] https://clangd.llvm.org/
> > 
> 
> Once we get the headers into better shape can we get clangd in CI?
> Without that a year from we will need another huge series of fixes to
> undo all the mistakes we've made in the last year.

clangd is a language server intended to talk to plugins in editors
(e.g., I just set it up in neovim); I don't think clangd specifically
can be used in a CI-like setup.  However clang-tidy is a standalone lint
tool that I think could be configured to print out the same kinds of
warnings (the "misc-include-cleaner" check seems to be the one for this
case), although I haven't tried it myself.


Matt

> 
> Matt 
> 
> > Matt Roper (79):
> >   drm/xe: Cleanup headers in xe_bb.c
> >   drm/xe: Drop unused header in xe_bo.c
> >   drm/xe: Cleanup headers in xe_devcoredump.c
> >   drm/xe: Drop unused header in xe_device.c
> >   drm/xe: Drop unused header in xe_exec.c
> >   drm/xe: Cleanup headers in xe_execlist.c
> >   drm/xe: Drop unused headers in xe_exec_queue.c
> >   drm/xe: Simplify headers in xe_ggtt.c
> >   drm/xe: Cleanup headers in xe_gsc_debugfs.c
> >   drm/xe: Simplify header in xe_gsc_proxy.c
> >   drm/xe: Drop unused headers in xe_gsc_submit.c
> >   drm/xe: Drop unused headers in xe_gt.c
> >   drm/xe: Cleanup headers in xe_gt_clock.c
> >   drm/xe: Drop unused header in xe_gt_debugfs.c
> >   drm/xe: Drop unused header in xe_gt_idle.c
> >   drm/xe: Drop unused header in xe_gt_mcr.c
> >   drm/xe: Drop unused headers in xe_gt_sriov_pf_config.c
> >   drm/xe: Drop unused header in xe_gt_sriov_pf_debugfs.c
> >   drm/xe: Simplify header in xe_gt_sriov_pf_migration.c
> >   drm/xe: Drop unused header in xe_gt_sriov_pf_policy.c
> >   drm/xe: Cleanup headers in xe_gt_sriov_pf_service.c
> >   drm/xe: Drop unused header in xe_gt_sriov_vf.c
> >   drm/xe: Simplify header in xe_gt_stats.c
> >   drm/xe: Simplify header in xe_gt_sysfs.c
> >   drm/xe: Simplify header in xe_gt_throttle.c
> >   drm/xe: Drop unused headers in xe_guc_ads.c
> >   drm/xe: Drop unused header in xe_guc_buf.c
> >   drm/xe: Cleanup headers in xe_guc_capture.c
> >   drm/xe: Cleanup headers in xe_guc_debugfs.c
> >   drm/xe: Simplify headers in xe_guc_hwconfig.c
> >   drm/xe: Simplify header in xe_guc_log.c
> >   drm/xe: Cleanup headers in xe_guc_relay.c
> >   drm/xe: Drop unused headers in xe_guc_submit.c
> >   drm/xe: Drop unused header in xe_heci_gsc.c
> >   drm/xe: Drop unused header in xe_huc.c
> >   drm/xe: Clean up headers in xe_huc_debugfs.c
> >   drm/xe: Drop unused header in xe_hw_engine.c
> >   drm/xe: Simplify include in xe_hw_engine_class_sysfs.c
> >   drm/xe: Simplify include in xe_hw_engine_group.c
> >   drm/xe: Cleanup headers in xe_hw_fence.c
> >   drm/xe: Cleanup headers in xe_i2c.c
> >   drm/xe: Drop unused header in xe_irq.c
> >   drm/xe: Drop unused headers in xe_memirq.c
> >   drm/xe: Drop unused headers in xe_mmio.c
> >   drm/xe: Drop unused headers in xe_mocs.c
> >   drm/xe: Simplify include in xe_module.c
> >   drm/xe: Drop unused header in xe_nvm.c
> >   drm/xe: Drop unused headers in xe_page_reclaim.c
> >   drm/xe: Drop unused header in xe_pci.c
> >   drm/xe: Simplify include in xe_psmi.c
> >   drm/xe: Drop unused header in xe_pxp.c
> >   drm/xe: Simplify header in xe_pxp_debugfs.c
> >   drm/xe: Cleanup headers in xe_reg_sr.c
> >   drm/xe: Drop unused headers in xe_reg_whitelist.c
> >   drm/xe: Cleanup headers in xe_ring_ops.c
> >   drm/xe: Drop unused header in xe_rtp.c
> >   drm/xe: Simplify header in xe_sa.c
> >   drm/xe: Simplify header in xe_sched_job.c
> >   drm/xe: Drop unused header in xe_sriov_packet.c
> >   drm/xe: Drop unused header in xe_sriov_pf_debugfs.c
> >   drm/xe: Drop unused header in xe_sriov_vf.c
> >   drm/xe: Cleanup headers in xe_step.c
> >   drm/xe: Drop unused header in xe_survivability_mode.c
> >   drm/xe: Cleanup headers in xe_tile.c
> >   drm/xe: Cleanup headers in xe_tlb_inval.c
> >   drm/xe: Drop unused header in xe_ttm_stolen_mgr.c
> >   drm/xe: Drop unused header in xe_ttm_sys_mgr.c
> >   drm/xe: Drop unused header in xe_ttm_vram_mgr.c
> >   drm/xe: Drop unused headers in xe_uc.c
> >   drm/xe: Cleanup headers in xe_uc_debugfs.c
> >   drm/xe: Simplify header in xe_uc_fw.c
> >   drm/xe: Drop unused header in xe_validation.c
> >   drm/xe: Drop unused header in xe_vm.c
> >   drm/xe: Drop unused headers in xe_vram.c
> >   drm/xe: Drop unused header in xe_vram_freq.c
> >   drm/xe: Drop unused header in xe_vsec.c
> >   drm/xe: Simplify header in xe_wa.c
> >   drm/xe: Drop unused header in xe_wait_user_fence.c
> >   drm/xe: Simplify header in xe_wopcm.c
> > 
> >  drivers/gpu/drm/xe/tests/xe_bo.c              | 1 +
> >  drivers/gpu/drm/xe/xe_bb.c                    | 3 +--
> >  drivers/gpu/drm/xe/xe_bo.c                    | 1 -
> >  drivers/gpu/drm/xe/xe_devcoredump.c           | 3 +--
> >  drivers/gpu/drm/xe/xe_device.c                | 1 -
> >  drivers/gpu/drm/xe/xe_exec.c                  | 1 -
> >  drivers/gpu/drm/xe/xe_exec_queue.c            | 2 --
> >  drivers/gpu/drm/xe/xe_execlist.c              | 3 +--
> >  drivers/gpu/drm/xe/xe_ggtt.c                  | 3 +--
> >  drivers/gpu/drm/xe/xe_gsc_debugfs.c           | 5 ++---
> >  drivers/gpu/drm/xe/xe_gsc_proxy.c             | 2 +-
> >  drivers/gpu/drm/xe/xe_gsc_submit.c            | 2 --
> >  drivers/gpu/drm/xe/xe_gt.c                    | 2 --
> >  drivers/gpu/drm/xe/xe_gt_clock.c              | 6 +-----
> >  drivers/gpu/drm/xe/xe_gt_debugfs.c            | 1 -
> >  drivers/gpu/drm/xe/xe_gt_idle.c               | 1 -
> >  drivers/gpu/drm/xe/xe_gt_mcr.c                | 1 -
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 2 --
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   | 1 -
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 2 +-
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 1 -
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c   | 5 ++---
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 1 -
> >  drivers/gpu/drm/xe/xe_gt_stats.c              | 2 +-
> >  drivers/gpu/drm/xe/xe_gt_sysfs.c              | 2 +-
> >  drivers/gpu/drm/xe/xe_gt_throttle.c           | 2 +-
> >  drivers/gpu/drm/xe/xe_guc_ads.c               | 2 --
> >  drivers/gpu/drm/xe/xe_guc_buf.c               | 1 -
> >  drivers/gpu/drm/xe/xe_guc_capture.c           | 5 +----
> >  drivers/gpu/drm/xe/xe_guc_debugfs.c           | 5 ++---
> >  drivers/gpu/drm/xe/xe_guc_hwconfig.c          | 4 ++--
> >  drivers/gpu/drm/xe/xe_guc_log.c               | 2 +-
> >  drivers/gpu/drm/xe/xe_guc_relay.c             | 3 +--
> >  drivers/gpu/drm/xe/xe_guc_submit.c            | 2 --
> >  drivers/gpu/drm/xe/xe_heci_gsc.c              | 1 -
> >  drivers/gpu/drm/xe/xe_huc.c                   | 1 -
> >  drivers/gpu/drm/xe/xe_huc_debugfs.c           | 5 ++---
> >  drivers/gpu/drm/xe/xe_hw_engine.c             | 1 -
> >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 2 +-
> >  drivers/gpu/drm/xe/xe_hw_engine_group.c       | 2 +-
> >  drivers/gpu/drm/xe/xe_hw_fence.c              | 4 +---
> >  drivers/gpu/drm/xe/xe_i2c.c                   | 4 ++--
> >  drivers/gpu/drm/xe/xe_irq.c                   | 1 -
> >  drivers/gpu/drm/xe/xe_memirq.c                | 2 --
> >  drivers/gpu/drm/xe/xe_mmio.c                  | 4 ----
> >  drivers/gpu/drm/xe/xe_mocs.c                  | 2 --
> >  drivers/gpu/drm/xe/xe_module.c                | 2 +-
> >  drivers/gpu/drm/xe/xe_nvm.c                   | 1 -
> >  drivers/gpu/drm/xe/xe_page_reclaim.c          | 4 ----
> >  drivers/gpu/drm/xe/xe_pci.c                   | 1 -
> >  drivers/gpu/drm/xe/xe_psmi.c                  | 2 +-
> >  drivers/gpu/drm/xe/xe_pxp.c                   | 1 -
> >  drivers/gpu/drm/xe/xe_pxp_debugfs.c           | 2 +-
> >  drivers/gpu/drm/xe/xe_reg_sr.c                | 5 +----
> >  drivers/gpu/drm/xe/xe_reg_whitelist.c         | 1 -
> >  drivers/gpu/drm/xe/xe_ring_ops.c              | 4 +---
> >  drivers/gpu/drm/xe/xe_rtp.c                   | 1 -
> >  drivers/gpu/drm/xe/xe_sa.c                    | 2 +-
> >  drivers/gpu/drm/xe/xe_sched_job.c             | 2 +-
> >  drivers/gpu/drm/xe/xe_sriov_packet.c          | 1 -
> >  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 1 -
> >  drivers/gpu/drm/xe/xe_sriov_vf.c              | 1 -
> >  drivers/gpu/drm/xe/xe_step.c                  | 3 ++-
> >  drivers/gpu/drm/xe/xe_survivability_mode.c    | 1 -
> >  drivers/gpu/drm/xe/xe_tile.c                  | 3 +--
> >  drivers/gpu/drm/xe/xe_tlb_inval.c             | 7 ++-----
> >  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        | 1 -
> >  drivers/gpu/drm/xe/xe_ttm_sys_mgr.c           | 1 -
> >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          | 1 -
> >  drivers/gpu/drm/xe/xe_uc.c                    | 2 --
> >  drivers/gpu/drm/xe/xe_uc_debugfs.c            | 2 +-
> >  drivers/gpu/drm/xe/xe_uc_fw.c                 | 2 +-
> >  drivers/gpu/drm/xe/xe_validation.c            | 1 -
> >  drivers/gpu/drm/xe/xe_vm.c                    | 1 -
> >  drivers/gpu/drm/xe/xe_vram.c                  | 2 --
> >  drivers/gpu/drm/xe/xe_vram_freq.c             | 1 -
> >  drivers/gpu/drm/xe/xe_vsec.c                  | 1 -
> >  drivers/gpu/drm/xe/xe_wa.c                    | 2 +-
> >  drivers/gpu/drm/xe/xe_wait_user_fence.c       | 1 -
> >  drivers/gpu/drm/xe/xe_wopcm.c                 | 2 +-
> >  80 files changed, 45 insertions(+), 129 deletions(-)
> > 
> > -- 
> > 2.52.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
