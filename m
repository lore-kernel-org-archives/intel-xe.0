Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793E7C021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 14:42:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404B810E0B7;
	Fri, 21 Feb 2025 14:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WOKOnwgc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3356510E0B7
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 14:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740148932; x=1771684932;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8IxRbhH/Idhc0ql1qb21I/F0CFG27+nXNSGCgBQWO5c=;
 b=WOKOnwgciee28+O9Fs/mVloNskpSz/X+gZvFmImJj91qMYbkz9kdL0WY
 rf6oCEwNwdbJVwSW9d8vsNqrW1SXjEEUVIZ5bfw4PMxLOYbh8CH0/LiV9
 /GM5xZPPADFGq93gkxb/MHjpveQbhagZ3mOGMr2FiqpmI6DYCuxi+IoGX
 2pXrXE+okqTyrAlg4AGP3GBRnxTOBitMPzgKoltRlw0CPVn6towliewvA
 BXbf/5yAF6UJ8qZPLyms9rbjQ+KwmUEfWIvRIK/04BiHKeAGs1dJZtvnB
 ggSiVHKp8iPW9/cwmhDx5gzEC3UcHWlClrnRT49x+S0qaidiH6Pmonv9s g==;
X-CSE-ConnectionGUID: eYfQVMBkT/KSzuVFVGRkWQ==
X-CSE-MsgGUID: iVnOHIAHQ5i+tzXIO2OEDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40159752"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="40159752"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 06:42:11 -0800
X-CSE-ConnectionGUID: wL6PFnL2Rs+wdEh1RSwkCQ==
X-CSE-MsgGUID: UGtDTmm4SYCwkplpTApHSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="115914526"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2025 06:42:11 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 21 Feb 2025 06:42:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 06:42:10 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 06:42:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVs+MEKtkT4VHRLvOSCW0WdTRGpIVJKGZko5CYvI5cpsX+/M3+lrfV9XVt4GGx4L8/qKn9HnzwjHLXwoqnSe2hfSahgB4DdMrHmLLwYHCQdGNylHYwa2fylV5cbv09fr4cOmbTeeFXXx1yod0nxpTeygIu1+QGe+1EaXk22/JZV2984xuZebXeUe++Tpj4iUg2ZZaIfDpA/4MgronXK9AB0ZCkOisvOgEkedIT2ZOR+sv4eB+uWKsVxWNsbFRPy2hltXza6HStCmRrJD1B3wd/FGOJDv4ck49FJtyz7noZVzAX4rBi4Y8N6WlO+PlLz7ncULAEHInkKdNrYLAIv8GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eol6n3TWVYANmXKk8893FuIaRc/DiUQvD7GKMU0nCl8=;
 b=lzY0iec3GkwdMvfzRw7B7/8uSBIvYbtGS+0zKE3d/2gqGXVlj/lzv/tMWIxQBc43Au/S9CrEs5+B/zSDxgZDRmASjKa7KWRUVKoTI+R062sx+gmxaFp07s9d2xibAlqc2i7qQWSAk6FVVuvZlqZ6eW1nM0YlH0ZDK7xM9nHDOuv6agcW5t9bH/6QIBwbvWUPVb+BSuDAdBONyEY2hq6izBDCBEDpq2jQj85yGkRx5i35vKjeRNKXXnvkGD2kQTYRTe6QqmsuPRu5ISZPdkJQDXmf3PwWsNs3qPFQ+cUGbOyDYcnc8idY9kT+rUVe78iqhtJKLqmQXP9z6YYiu7HaxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4709.namprd11.prod.outlook.com (2603:10b6:208:267::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 14:42:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 14:42:06 +0000
Date: Fri, 21 Feb 2025 06:43:09 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Userptr invalidation race with binds fixes
Message-ID: <Z7iQ/Y2VIo8sjvsh@lstrano-desk.jf.intel.com>
References: <20250220234557.2613010-1-matthew.brost@intel.com>
 <20250220234557.2613010-3-matthew.brost@intel.com>
 <7685842d544a4e9673dc4ec2645044a8ded58848.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7685842d544a4e9673dc4ec2645044a8ded58848.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0247.namprd03.prod.outlook.com
 (2603:10b6:303:b4::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4709:EE_
X-MS-Office365-Filtering-Correlation-Id: 61d3771d-df19-45f9-3122-08dd5285e9ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?IkSqeG8m0Bt6NYOoJJZLbOCUld3BjmpfABOXhmtgPRkcLQ+b8fu+N8nphv?=
 =?iso-8859-1?Q?akxm9S5KGRBCn6ZFLr3Rxz7PPthdn+Ha5swHiv6SMaAf7k+dOrKjBS2d12?=
 =?iso-8859-1?Q?hsfPwWwN+nuQ2jrucNLzPZT6fC8h7egojOC+574grRk78IomJcYHuOHpFL?=
 =?iso-8859-1?Q?krhAB1e8o9QJa2UKOfDgdO/XlKp3aFc7CEhK8TyTrxJMH2pQyUNJKE3sqJ?=
 =?iso-8859-1?Q?0HN7xIw2NPnZmH4giJiVdYWCyg98Na22NBwhXFR13zUPg6CFEJ+1dbhUbc?=
 =?iso-8859-1?Q?n0+j6KSifYvHnBgzavLUPV20iubuUzdZOehHGnz4MUNso/s+Ry3F/6HEu3?=
 =?iso-8859-1?Q?TjL/oHzSvZIlxP4DW9RRhr595xEm3bNx/yCU//P2KG3X6JdxCF7PyK0jOf?=
 =?iso-8859-1?Q?MweZZjf58YS5uV1qTKf6n+HoTAdZuQZBG7j7MV5iYdtzc7DVwQU2eq7hsz?=
 =?iso-8859-1?Q?fUlXkU3/unmZmVvi9Bw7bmwY72hyvKxVRwKWpSsC14mRmRK/YaQWWKL05K?=
 =?iso-8859-1?Q?EXPsFEBRBIZ/XbRvoJ4JKHAt27qf6AhTOMoj1pIVkghVZCIROstcqKo5xd?=
 =?iso-8859-1?Q?bv7DVIawIEkU0woR1MkXxgtCPtX6J1OUMqNb+ZqKBL3fCITDfy5anQbfJJ?=
 =?iso-8859-1?Q?9JXzVy8OXNcyPS/uPPPTbOwCPsjvrkXQz7olPD8swKdv2yD4DPyIwz0Fo+?=
 =?iso-8859-1?Q?u6OFS9pUnnABGelXQvUDhQjNdEbFkMExra0AqheXjIkFaD1mwb5Z8zdmfg?=
 =?iso-8859-1?Q?o9kC/vkzlcAIReGGs027/eQz3t4c+Iov6rSuhQB5JCbYURcGbkA4q/6LhG?=
 =?iso-8859-1?Q?VR2IuDomgSLpRfG9gvNiU61IfsrWtUd+iguWyak7EjNXfFeq315Dw6Ij7q?=
 =?iso-8859-1?Q?BnM1MnYnFBsQNlHKmeyZKO0MEGG9cee2ZyFh/ojRLxkZnwrEMydRfVTOly?=
 =?iso-8859-1?Q?5k3J96EN3HHWVYJ7FUyT2wYMyBHU/F13Qg21XrEsX+DCAWTpL3yxVYd+tb?=
 =?iso-8859-1?Q?6OB6hRyCchgJrbi8FJ0b/nN9LTs+RzlmuOBOb61E2+fTOZ2cv9i8/OUywH?=
 =?iso-8859-1?Q?IgnBw7tSwulRCvSwcXWQQ2TTtzLhh+4XLi4ZoCGkNC6Qs8pjumttBSmaxS?=
 =?iso-8859-1?Q?82yXDNm+ZV/py0PfTqtrzO+PppMjFtzTf3yVviRtH9fJHJZozbNizi5trY?=
 =?iso-8859-1?Q?sqV3yznKPIsmUuzyUvtEB/oqYoWMBjYBHx63ZFpGSPtkq4BTrembgRjE/b?=
 =?iso-8859-1?Q?3uyg7ypsNn2MYcMJfLwLAn6rMaB3lVwyCxBlk7+RCKRDKd+4owm34oYY+K?=
 =?iso-8859-1?Q?UGV2Vkluq4pznqjxOHvDVcuZy4LbvbkFNbwI2KYVoGT4kkmifw1cbQcafQ?=
 =?iso-8859-1?Q?jSHk2SJxVSrPLHaZ0xAN+2GxFHyXiZZNaKwCRDAtpYW/fuwnT4gwc/vp6V?=
 =?iso-8859-1?Q?BeEbYiOsvcEhkALu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?oR6wrbJX7vpnxUxLUPOIAJkvhS6ryxVYOketj1xnTavPs7LgWr749JILeY?=
 =?iso-8859-1?Q?HGGMsXm8A50Iv+l7dXqjQu99sKTLflJCazxtQeXp/bF1gw+NYdWh/MH0+3?=
 =?iso-8859-1?Q?yeybC1EzHgLOeT0jvxykMGAIGsBpUcJQNQEAQgymN9z3OMKejIk0hzlS8E?=
 =?iso-8859-1?Q?BZXlJuQdz0cT1G6K9gZqTPHmkSlkdA0Y0DhFsDE80uLOpZDlrKYoFJ+lLy?=
 =?iso-8859-1?Q?2vPYZF+GUBV0kYpRj4BqmVAt+rb4TpRShvJKr9hFW2DrBnnVRGHB76EZ3T?=
 =?iso-8859-1?Q?3H0xO8k+1HwTlSnhHkwpjZjx+mkleIpC90oPez4gELHBd//n/rcFr6k35B?=
 =?iso-8859-1?Q?RSj+doWIS39KzKC7eSkQmFoktyn1289CfJ1YA4y6/wBPaYt0GsaW3zH4dv?=
 =?iso-8859-1?Q?lVRt/wvypLQD5VgexY4jlUEaBUtD+7w51CsAhEepJ9zWI192i4D4E7CJeq?=
 =?iso-8859-1?Q?pFAI/HhuDFlyftcD35Lh2ebKmCfbv09CQvzvStJgcZEeo1DjARX5Uleyyb?=
 =?iso-8859-1?Q?aKsISghuTS0bFdh1Tp5Pc3hzxujmvXvHW0kATtYQ/K0UkwRgflth0xlTrg?=
 =?iso-8859-1?Q?V6CsJMCqn3SzFPykvOKpddLlBenF4IE0IuVcsmykyEJj/minY18biZ8I2+?=
 =?iso-8859-1?Q?GR8zHDWumIsAK0V/6+L67zTrQ4EsTxQPYMVUsHwLZcT1PIZ2vAcJi+9cDh?=
 =?iso-8859-1?Q?0SXEk9p2kIQU+zIyMh7LnyTf8ZLYM21/ZtJVRjtJ12Q+fRabNfB5tHo9Gf?=
 =?iso-8859-1?Q?cp4EDei9wp+Smm46vLWGmasXmxRoMEflp/pfjSYkXng29RW7pnpqXlhdL7?=
 =?iso-8859-1?Q?POOPDN0r/KrqWQ+ZeUJ6XPuSENleBFkeLiyMESE0FBqNsukHBSMNFdIlIt?=
 =?iso-8859-1?Q?uDG9GSfgrW8m9QNhfhzyqtVvlOT4AJHhh3JoXgb3BK51S/UTYQDyRASUOZ?=
 =?iso-8859-1?Q?bUqDD0jWS0bAwcerRE+h9RvXErjUM1iW0PBP6YxIyY593PscpyFIVLgXsg?=
 =?iso-8859-1?Q?LQwPbJ5s4h/lhuh8DAe6mSmSrR9zBfsvG+IKO341E2j0Yfmjd4BJ11jDq6?=
 =?iso-8859-1?Q?yV/9sfdCKIl8cjzX/noZ9FEZXmzsZxcqPWLI78WFkTpHmeX22XXL+VBwLs?=
 =?iso-8859-1?Q?A/FsZExqGKJDNE8Yai0XeyD9+MbKdEaOjsdbIFgnfw/Sg5ZIJsuoHRyZIs?=
 =?iso-8859-1?Q?RaWCM2AC7+lIhNEOePOLPV2o3l6ecHgB66Dm+EIFHIJ4O0EtxadttDM9Ts?=
 =?iso-8859-1?Q?oxh2nGJcxoyG/r7VazDFcrNunNVulJTU8M8fGt09XXH7ulNeMH8B8fDapn?=
 =?iso-8859-1?Q?2iJ4aEEjNdB2pmBws/xttP7kNtWiR//fMKKzyfJbNGYkgyLRlzIcH2WRLE?=
 =?iso-8859-1?Q?ffkctiU1CZrN5Dho68q4sryAKb0ECLmkCszztiIZfPxOp1VlnDWGw/mcDA?=
 =?iso-8859-1?Q?Pa49V7ojTx3nrJi+TyBKyu5lTm2469+kinUXuhfj8D1O6kqtRvrDiW3ShX?=
 =?iso-8859-1?Q?zU1f8Ozc+sYez0T9fjYy8xRIm/HH6hPnQGy3jyQiUdTuGqGqyR3CJiQfJb?=
 =?iso-8859-1?Q?PEfst/t1Go7FdmYyn3mMqQ9FtYoCFX/QYRlakOV+v97kTxf6tmVX3fWJOq?=
 =?iso-8859-1?Q?+Yzmb95Mdk3jtvLgmofmdH6HFHj9037YVN8iZsci7OuqvHp6M9BTwi6g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d3771d-df19-45f9-3122-08dd5285e9ad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 14:42:06.3952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ksME4Yx5uAb78Zv5+fdykJTnnlvt3+OItXuEH6sY7FL+Jq9W1t+JJoL/FB/YaynD5uf+YntxB+bq/822TJbtNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4709
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

On Fri, Feb 21, 2025 at 12:34:12PM +0100, Thomas Hellström wrote:
> On Thu, 2025-02-20 at 15:45 -0800, Matthew Brost wrote:
> > Squash bind operation after userptr invalidation into a clearing of
> > PTEs. Will prevent valid GPU page tables from pointing to stale CPU
> > pages.
> > 
> > Fixup initial bind handling always add VMAs to invalidation list and
> > clear PTEs.
> > 
> > Remove unused rebind variable in xe_pt.
> > 
> > Always hold notifier across TLB invalidation in notifier to prevent a
> > UAF if an unbind races.
> > 
> > Including all of the above changes for Fixes patch in hopes of an
> > easier
> > backport which fix a single patch.
> > 
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: <stable@vger.kernel.org>
> > Fixes: e8babb280b5e: ("drm/xe: Convert multiple bind ops into single
> > job")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gtt_defs.h |  1 +
> >  drivers/gpu/drm/xe/xe_pt.c            | 86 +++++++++++++++++++------
> > --
> >  drivers/gpu/drm/xe/xe_pt_types.h      |  1 -
> >  drivers/gpu/drm/xe/xe_vm.c            |  4 +-
> >  4 files changed, 64 insertions(+), 28 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > index 4389e5a76f89..ab281e721d94 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > @@ -13,6 +13,7 @@
> >  
> >  #define GUC_GGTT_TOP		0xFEE00000
> >  
> > +#define XE_PPGTT_IS_LEAF		BIT_ULL(63)
> >  #define XELPG_PPGTT_PTE_PAT3		BIT_ULL(62)
> >  #define XE2_PPGTT_PTE_PAT4		BIT_ULL(61)
> >  #define XE_PPGTT_PDE_PDPE_PAT2		BIT_ULL(12)
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 1ddcc7e79a93..26b513a54113 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -389,6 +389,8 @@ xe_pt_insert_entry(struct xe_pt_stage_bind_walk
> > *xe_walk, struct xe_pt *parent,
> >  		idx = offset - entry->ofs;
> >  		entry->pt_entries[idx].pt = xe_child;
> >  		entry->pt_entries[idx].pte = pte;
> > +		if (!xe_child)
> > +			entry->pt_entries[idx].pte |=
> > XE_PPGTT_IS_LEAF;
> 
> I don't think this is needed.
> 

It is. Will explain below.

> >  		entry->qwords++;
> >  	}
> >  
> > @@ -792,6 +794,24 @@ static const struct xe_pt_walk_ops
> > xe_pt_zap_ptes_ops = {
> >  	.pt_entry = xe_pt_zap_ptes_entry,
> >  };
> >  
> > +static bool __xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma
> > *vma)
> > +{
> > +	struct xe_pt_zap_ptes_walk xe_walk = {
> > +		.base = {
> > +			.ops = &xe_pt_zap_ptes_ops,
> > +			.shifts = xe_normal_pt_shifts,
> > +			.max_level = XE_PT_HIGHEST_LEVEL,
> > +		},
> > +		.tile = tile,
> > +	};
> > +	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> > +
> > +	(void)xe_pt_walk_shared(&pt->base, pt->level,
> > xe_vma_start(vma),
> > +				xe_vma_end(vma), &xe_walk.base);
> > +
> > +	return xe_walk.needs_invalidate;
> > +}
> > +
> >  /**
> >   * xe_pt_zap_ptes() - Zap (zero) gpu ptes of an address range
> >   * @tile: The tile we're zapping for.
> > @@ -810,24 +830,12 @@ static const struct xe_pt_walk_ops
> > xe_pt_zap_ptes_ops = {
> >   */
> >  bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
> >  {
> > -	struct xe_pt_zap_ptes_walk xe_walk = {
> > -		.base = {
> > -			.ops = &xe_pt_zap_ptes_ops,
> > -			.shifts = xe_normal_pt_shifts,
> > -			.max_level = XE_PT_HIGHEST_LEVEL,
> > -		},
> > -		.tile = tile,
> > -	};
> > -	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> >  	u8 pt_mask = (vma->tile_present & ~vma->tile_invalidated);
> >  
> >  	if (!(pt_mask & BIT(tile->id)))
> >  		return false;
> >  
> > -	(void)xe_pt_walk_shared(&pt->base, pt->level,
> > xe_vma_start(vma),
> > -				xe_vma_end(vma), &xe_walk.base);
> > -
> > -	return xe_walk.needs_invalidate;
> > +	return __xe_pt_zap_ptes(tile, vma);
> >  }
> >  
> >  static void
> > @@ -843,9 +851,10 @@ xe_vm_populate_pgtable(struct
> > xe_migrate_pt_update *pt_update, struct xe_tile *t
> >  	for (i = 0; i < num_qwords; i++) {
> >  		if (map)
> >  			xe_map_wr(tile_to_xe(tile), map, (qword_ofs
> > + i) *
> > -				  sizeof(u64), u64, ptes[i].pte);
> > +				  sizeof(u64), u64, ptes[i].pte &
> > +				  ~XE_PPGTT_IS_LEAF);
> >  		else
> > -			ptr[i] = ptes[i].pte;
> > +			ptr[i] = ptes[i].pte & ~XE_PPGTT_IS_LEAF;
> >  	}
> >  }
> >  
> > @@ -1201,7 +1210,30 @@ static bool xe_pt_userptr_inject_eagain(struct
> > xe_userptr_vma *uvma)
> >  
> >  #endif
> >  
> > -static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
> > +static void
> > +vma_convert_to_invalidation(struct xe_tile *tile, struct xe_vma
> > *vma,
> > +			    struct xe_vm_pgtable_update_ops
> > *pt_update)
> > +{
> > +	int i, j, k;
> > +
> > +	for (i = 0; i < pt_update->current_op; ++i) {
> > +		struct xe_vm_pgtable_update_op *op = &pt_update-
> > >ops[i];
> > +
> > +		if (vma == op->vma && (op->bind || op->rebind)) {
> > +			for (j = 0; j < op->num_entries; ++j) {
> > +				for (k = 0; k < op-
> > >entries[j].qwords; ++k)
> > +					if (op-
> > >entries[j].pt_entries[k].pte &
> > +					    XE_PPGTT_IS_LEAF)
> 
> IIRC It's a leaf iff op->entries[j].pt->level == 0 ||
> xe_pte_is_huge(pte) (xe_pte_is_huge(pte) needs to be coded)
> 

The 'op->entries[j].pt' here is overidden at this point as part of the
code which handles the unwind on error. See xe_pt_commit_prepare_bind.

We can't reason whether the pte is a leaf without knowing the level,
thus the extra bit here. Ofc this could be coded differently. Open to
ideas but this might not needed if we just return -EAGAIN - see below. 

> > +						op-
> > >entries[j].pt_entries[k].pte = 0;
> 
> This should be a scratch pte unless it's a faulting VM?
>

Yes, if the VM is in scratch mode, this should be set scratch.

> 
> > +			}
> > +		}
> > +	}
> > +
> > +	__xe_pt_zap_ptes(tile, vma);
> 
> Umm, A zap here would race completely with other pipelined updates
> right? Why is it needed?
> 

The PT tree is fully updated at this point. The nature of an array of
binds means each operation must fully updated the PT tree before running
the next operation. Thus is safe to call zap here.

This is needed for invalidating leafs which are part of an unconnected
tree always setup by the CPU.

e.g. A 4k bind on empty does this:

- 1 PT op to prune in a PTE at the highest level
- (Highest level - 1) to 0 are part of an unconnected tree setup by CPU

Here we'd only want to invalidate the level 0 PTE which __xe_pt_zap_ptes
does.

What is missing, as above, the zap would need program a scratch entry in
the VM has scratch enabled.

> > +}
> > +
> > +static int vma_check_userptr(struct xe_tile *tile, struct xe_vm *vm,
> > +			     struct xe_vma *vma,
> >  			     struct xe_vm_pgtable_update_ops
> > *pt_update)
> >  {
> >  	struct xe_userptr_vma *uvma;
> > @@ -1215,9 +1247,6 @@ static int vma_check_userptr(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  	uvma = to_userptr_vma(vma);
> >  	notifier_seq = uvma->userptr.notifier_seq;
> >  
> > -	if (uvma->userptr.initial_bind && !xe_vm_in_fault_mode(vm))
> > -		return 0;
> > -
> >  	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
> >  				     notifier_seq) &&
> >  	    !xe_pt_userptr_inject_eagain(uvma))
> > @@ -1231,6 +1260,8 @@ static int vma_check_userptr(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  			       &vm->userptr.invalidated);
> >  		spin_unlock(&vm->userptr.invalidated_lock);
> >  
> > +		vma_convert_to_invalidation(tile, vma, pt_update);
> > +
> >  		if (xe_vm_in_preempt_fence_mode(vm)) {
> >  			struct dma_resv_iter cursor;
> >  			struct dma_fence *fence;
> 
> And I really think here we should remove the open-coded and
> undocumented invalidation (It took me like 15 minutes to understand
> what the code did, and then I'm already up-to-date with how
> invalidation works).
> 

Yea, this ended up being more complicated that I though it would be and
took me several hours to get this (mostly) right.

> If just returning -EAGAIN doesn't really work here for the preempt-

I think return -EAGAIN should work. A quick hack got what appears to be
livelock on xe_vm.munmap-style-unbind-userptr-one-partial with error
injection enabled. Need to dig in more, but my guess is this test does
user bind which results in enough internal OPs so the error injection is
always hit on every user bind. If this is the case, we could tweak the
injection algorithm to use a counter based on user binds not internal
OPs.

In practice, getting an invalidation between getting the CPU pages and
this step of the bind should be exceedingly rare, so return -EAGAIN
doesn't seem like a huge deal. But this code path could really help for
SVM prefetches where perhaps a single page is touched by the CPU, thus
aborting the entire prefetch. If we could just squash that part of the
prefetch into an invalidation, that could be useful. So weighing the
complexity of an invalidation vs -EAGAIN needs to be considered.

> fence case, Then I suggest that the error injection intstead triggers a
> real invalidation outside of the notifier lock.

If the error injection really kicked the notifier, that would be better.

> Perhaps using mmu_notifier_invalidate_range[start|end]()?
> 

Off the top of my head unsure how this would be implemented or if it is
possible. Generally a bad idea to call low level core MM functions
though and I could see that upsetting the core MM people too if they
make changes to whatever functions we need to call.

> But for now since this is a fix, restrict the -EINVAL inject to cases
> where it works and that we want to test.
> 

Not following this.

Matt

> Thanks,
> 
> /Thomas
> 
> 
> > @@ -1252,7 +1283,8 @@ static int vma_check_userptr(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  	return 0;
> >  }
> >  
> > -static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
> > +static int op_check_userptr(struct xe_tile *tile, struct xe_vm *vm,
> > +			    struct xe_vma_op *op,
> >  			    struct xe_vm_pgtable_update_ops
> > *pt_update)
> >  {
> >  	int err = 0;
> > @@ -1264,18 +1296,21 @@ static int op_check_userptr(struct xe_vm *vm,
> > struct xe_vma_op *op,
> >  		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> >  			break;
> >  
> > -		err = vma_check_userptr(vm, op->map.vma, pt_update);
> > +		err = vma_check_userptr(tile, vm, op->map.vma,
> > pt_update);
> >  		break;
> >  	case DRM_GPUVA_OP_REMAP:
> >  		if (op->remap.prev)
> > -			err = vma_check_userptr(vm, op->remap.prev,
> > pt_update);
> > +			err = vma_check_userptr(tile, vm, op-
> > >remap.prev,
> > +						pt_update);
> >  		if (!err && op->remap.next)
> > -			err = vma_check_userptr(vm, op->remap.next,
> > pt_update);
> > +			err = vma_check_userptr(tile, vm, op-
> > >remap.next,
> > +						pt_update);
> >  		break;
> >  	case DRM_GPUVA_OP_UNMAP:
> >  		break;
> >  	case DRM_GPUVA_OP_PREFETCH:
> > -		err = vma_check_userptr(vm, gpuva_to_vma(op-
> > >base.prefetch.va),
> > +		err = vma_check_userptr(tile, vm,
> > +					gpuva_to_vma(op-
> > >base.prefetch.va),
> >  					pt_update);
> >  		break;
> >  	default:
> > @@ -1301,7 +1336,8 @@ static int xe_pt_userptr_pre_commit(struct
> > xe_migrate_pt_update *pt_update)
> >  	down_read(&vm->userptr.notifier_lock);
> >  
> >  	list_for_each_entry(op, &vops->list, link) {
> > -		err = op_check_userptr(vm, op, pt_update_ops);
> > +		err = op_check_userptr(&vm->xe->tiles[pt_update-
> > >tile_id],
> > +				       vm, op, pt_update_ops);
> >  		if (err) {
> >  			up_read(&vm->userptr.notifier_lock);
> >  			break;
> > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> > b/drivers/gpu/drm/xe/xe_pt_types.h
> > index 384cc04de719..0f9b7650cd6f 100644
> > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > @@ -29,7 +29,6 @@ struct xe_pt {
> >  	struct xe_bo *bo;
> >  	unsigned int level;
> >  	unsigned int num_live;
> > -	bool rebind;
> >  	bool is_compact;
> >  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
> >  	/** addr: Virtual address start address of the PT. */
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index ea2e287e6526..f90e5c92010c 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -623,8 +623,6 @@ static bool vma_userptr_invalidate(struct
> > mmu_interval_notifier *mni,
> >  		spin_unlock(&vm->userptr.invalidated_lock);
> >  	}
> >  
> > -	up_write(&vm->userptr.notifier_lock);
> > -
> >  	/*
> >  	 * Preempt fences turn into schedule disables, pipeline
> > these.
> >  	 * Note that even in fault mode, we need to wait for binds
> > and
> > @@ -647,6 +645,8 @@ static bool vma_userptr_invalidate(struct
> > mmu_interval_notifier *mni,
> >  		XE_WARN_ON(err);
> >  	}
> >  
> > +	up_write(&vm->userptr.notifier_lock);
> > +
> >  	trace_xe_vma_userptr_invalidate_complete(vma);
> >  
> >  	return true;
> 
