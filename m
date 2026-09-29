Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDB2CA5FA7
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 21:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C4F10F09F;
	Tue, 29 Sep 2026 21:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YbMDTfo2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F88510F09F
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 21:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790716483; x=1822252483;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4NsC8a3jfcAG5BIdS7cOYrL0GsreDF99xHO3j51Mh78=;
 b=YbMDTfo2tMnAkX5r/zb76z8rdwUbg/8+Nqze0DlaHzww0VkJ9VET4f2G
 iKTcjJLP4RpVtxYkYLXYKzXRicQk/YzNE8lm900V/JpHTP25nYDBX1mY0
 e+H9csjkZjjmn9yGXw7G09dy16EXcDf9ykBqSVGsNwBs+8QWLXfAj0Gew
 702DfuWxd4U2NiX0Mto7ent0feg20mo5S6FhN4jAz/3vkxwF8grwq0gS1
 t0/wPmTSWhR7gYynZWfZs4Wxa35WfDsT59dtFqBTfkz8iVXWzZq+DFIm9
 Ny5faTPKU9qOow3p6EA+zpTjY8G0PYqRi+31MoMEyescGfxNo29GXZwC3 A==;
X-CSE-ConnectionGUID: EyUpmo0BS3qCwyRsNkX0aQ==
X-CSE-MsgGUID: Z6vSKOD4R3icHbA2kraExQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91543160"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="91543160"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 14:14:42 -0700
X-CSE-ConnectionGUID: pfU9nYfQRb2VSZ4qjXqdjg==
X-CSE-MsgGUID: X0vjiOgZRmKKVAW/KCd58w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="283573501"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 14:14:42 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 14:14:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 14:14:41 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.20)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 14:14:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1lfS4cyxNWEjnvLLkjCYk+WiLVw8DbcsoTJQk+4BtB3lJsCASirFFyQVXbjH1DJBZe2UKQU2/R7ioj21JDoUgca5qUHZWu0LmmgMV2sxRPjWS/DQUQ0ld7TbZEDl7GZBXDhkGd9zwoBZS066Y/h97GnzXKoO8T29HoZGxhii3EFLr+i826MzXgO85QVdwY5GVtQL3KwOi/5wn8fXXy802xWqq54QBujgYuJzC09GvM5FKPdxCB5SBV3I9ovLoZqMTre/u9xQ33O9zsNlU6R+3ore3JWumOch5wyrVVGxc7GZc/jNTKRuNpuz620VBEcetBoyxAZcgzBRV5+a8szLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ES+wNH5elFBGxK8jamhxKbjQL8f5v5Gi3hEi6zT99d4=;
 b=GWa57AZyXJodos6pHzDQKntDkZDahLJ0RW7M1OpDT0HQ4ntlArPg+j09t3dq6PQzZNtyoI1v3JYmCr/IfKuUey+8UFwg2MRZMqN/8vAXFPiaohDdBhm3VVKV2Tc8FNAjYgLRSxh0nxiOaA9oC1d3zkOtKjUeYLMOuhcNYGjnXmrP6r649MuCKJis6ZSHF4avCvy/LJTJngrWa7DqxP512TOm+O/LeEfpQFxm6pamlImVkXHN2t5igV0tuCUNIwiu/GsG8WClyI36YP8roIsltggzPtNsWXMBBgEhOw67qRcsKyp88IN6D7wRvUP+6CpJF+b0Hqm9gnK/j9d1kHntxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by IA4PR11MB8915.namprd11.prod.outlook.com (2603:10b6:208:560::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 21:14:39 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 21:14:39 +0000
Date: Tue, 29 Sep 2026 14:14:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe: Do not clear SVM device memory allocations
 up front
Message-ID: <arwqPFnLGKf8Im0c@gsse-cloud1.jf.intel.com>
References: <20260929181024.2743854-1-matthew.brost@intel.com>
 <20260929181024.2743854-4-matthew.brost@intel.com>
 <59e6ec889f8615ce424833b3a15ecd94b8dfb8b4.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59e6ec889f8615ce424833b3a15ecd94b8dfb8b4.camel@intel.com>
X-ClientProxiedBy: BY5PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::34) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|IA4PR11MB8915:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ead70b3-e694-41bc-f9a6-08df1e6eabe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|11063799006|56012099006|5023799004|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 52gLJht6hiJ8bQTZCaFVcyeWuLTux0sQUxI8Nch4N0mEiobNPL3FxtVHmSXafHzzXEtE5gDfJupvwoLZ6JDr5K3zjYe+pRvyqFZVghbKkeJrlhmlK7bE7VW6z510n927DCR4nSRgKkl0Mq/KL2JWaqSYencI9+tFTnRjx1jjciIgeu8GFAaPgJjU6UE5JIPlKP6bNW6xpKTdooSS3SRgmvk6GnVcnCRq82cYq8qyZKZxwy++o+pZK8jsAtkCRxOatWxqyGiFgIQyIRgc23qN3+FJfrkWKkIgk3nK8m+V/L5IHx+1dFlDZn6uKLHmW/3EAOaZfNLyLN8dUiVJBpILRRhzRBJ8zqe2XJa5GrYt758f1nc3Kse7LDMd+dVJ0HyyOZZxhM4jg3GY4JNGJ0XpUGa9d6RKjpShrRWiwH6RhTNHol/9lyAFb72HDHZ5j94DWzlh50CVRzU2imJ8QW1nYjwPJe4arlrjKBw4TWFRJiYCXGce65StHcIsmTfHeq/MvjG8HuPItaRsPCJbOete0ZDARNnwLo4myesTTIY+xQI6E6R4hnui7d3G4k83OKA2ygJc/M+vJee6GVDnQMkstOg+TxbVwXlAXkGT8MKLkTlOmqJ+UpT9WbZ8O8Qxc3IDIy5lAC0PzBlrLMsYiaEOAYZUsUD28zdAWfqViJ4q+nQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(11063799006)(56012099006)(5023799004)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RCw0R+9v725haV8WR4GQLFZsH+EkeiRwG0V85/DG9w5JD9Se17D4pWFISL?=
 =?iso-8859-1?Q?CrMZFMDithNMcuupwtlAKE/MUkNUYd++iE1yVNj3uXt0d1zwkBCSO3zLA0?=
 =?iso-8859-1?Q?erZPaYA7sFzUqdGYCJBaPMjQ1NunmMNn3dYmdjgNDiwTq6/lWt3IWuCQCH?=
 =?iso-8859-1?Q?+0whmgABily9UrAsf0EnDpJwvoWOYNjqOQz/xfuaHbi+bk2yfPoBSgol0L?=
 =?iso-8859-1?Q?QUxNrUq5RpDTKveYTT0+cjYoPTjb09UMQ+NNUWsaocFsJDVDdD/6MhvY4X?=
 =?iso-8859-1?Q?m8oCWdkOGy5QOthMciI+DBW6MuqnLCyo2oIRXp++PvS0gImwR5U5h5m8Ag?=
 =?iso-8859-1?Q?9H6zNx0epo4+hTQ6mBkc0LZVv11H6Cy9oUoaslhfUAXEJvkKBn3kuf/d1a?=
 =?iso-8859-1?Q?+b8UrNN+xxqJE6J4A0AFjBdrIXysGa1w/mh4J9wPaowokCbQKmfKb92mFy?=
 =?iso-8859-1?Q?YlcpwGBkmSaNMTP3DP2GObY0sNZHl2tDmSoZ/GNMisZY2wtwgLwSbmI6//?=
 =?iso-8859-1?Q?OqT/uQn9e/gkKn4zlyniylHCj73fOW5t8UflkS/r321kcQRBs5Kb3Tti+i?=
 =?iso-8859-1?Q?ZaRp65nDQFskRU9ZXoQu6qviLoGSn4cwGuW7p5jR6lrzwznFp4d7vtKdlE?=
 =?iso-8859-1?Q?gkW3rxk3nr5kNSYN43S8FvZGeRKDJy2KwO/BbvkgDYas9A/KLeHiN2fQJq?=
 =?iso-8859-1?Q?9F+u/en/crsPw4106qSqJTAc4Ic1Kb4b8sw4mLu5obVxyiJybgzNGp+eNj?=
 =?iso-8859-1?Q?9IWQvO0A+qLyLH8gkZau6uuYy87otHzv3FdHreKiQGB7XY0fCcQ4UsA88n?=
 =?iso-8859-1?Q?ma19hgq9H4HFNSB23i1YS6CYd28e0XAK2cnESGibP0F/DosZIwSuNK4b4s?=
 =?iso-8859-1?Q?yYz0txKnYXM7G7nu1SXjRPP/vOQhl94efHs+xlmLRN89Es3nyBIeavAbIE?=
 =?iso-8859-1?Q?c88+qtfNZ6nX0Trbs52GIEeFJey1vJGh9s0nasrJhrObwLQeTX0C8KTCsg?=
 =?iso-8859-1?Q?oND68RIEQzNMQwAhJ0LneJEK6h7d9EJBxN4Xz0el6dpzf3yn6Vt/BjOyMr?=
 =?iso-8859-1?Q?yeqDzVu1sBA2NAQ4KZxjSvjYAsojOorXoDEM5xF9loqVxEnF2D7sWGezLr?=
 =?iso-8859-1?Q?9uK0UA5Gd2vipiqJkz0ueBB+eMJsWrMutAkKXVAQ3KPLlDX+UaQ/GTql9k?=
 =?iso-8859-1?Q?Att/5aStT4oeYKQqYazYnYYdjpBUwRD5NU/V7nArhJTRLpg+quU47FD/T3?=
 =?iso-8859-1?Q?cAYQX8eMOM/8hvTsTrD4cJeAqhRtLYGJS0YDB6KV8RE52c7Ne8j7sWj/h9?=
 =?iso-8859-1?Q?qHWGh/4u+C159cbNPddIR06Uz0AJ08GNdcYQvITqPUihAG8FDOxgrl3NmS?=
 =?iso-8859-1?Q?SnE/YmK8LuAyW7V5iMXkYPMdG916NDtq6vS1YPn7HlKqYqgWuL+a7UDd2E?=
 =?iso-8859-1?Q?CAst658oM3e0y58veX09K5aDTVJ1gDdJxEVgSH/pgZo45PBMhR96icv4hI?=
 =?iso-8859-1?Q?avp7Fu9XWU611xa1b29tcMuDUcAhKW1a0HntSqsjtpsVDTYHwNAsXyZM+r?=
 =?iso-8859-1?Q?m9FjBswPx/g/A8W/CASNR9l/YQYILuWVmkR8Y5hbMWveB/mY2XYeOgWGJt?=
 =?iso-8859-1?Q?4BySUaKicGkuUDBmBAB5Mp58vNU7dGAX8ZzrYrg/1ugtfwcaKEXxMlNvq3?=
 =?iso-8859-1?Q?mg+NVlrI09ownBVMqR0kImmqm51REpgEilrh7GWPzhBuCPSIIBmFSGAAQr?=
 =?iso-8859-1?Q?QKY64erGzjnjtkkZ3HsCYQ8dk1ld4bKS0MQoibAwNUnS0f8WYq8rvduD7H?=
 =?iso-8859-1?Q?IjEyutiDYA=3D=3D?=
X-Exchange-RoutingPolicyChecked: x7nfOYJZao56H5zsPaDO9a+O70gbJB7wkQ8UuTLmIFYn5x8QSwtUA7C+z8LPnHsD7N0h8NEAQj7FgriGu0jwnj0+XSM4e/bpqydKllhfHNMtHcwvXxst711BlH4X2y5Rp4S2TqXkI3nFX0OnrzpMEhZsFvNxv7bSJBFc+92NWiVY+PN/aHGue0IVRhA+bYptkFFY9Eq/qGbsNTuTBFWg2NIJxpg1EG+MfrIxfY8uEfi14ZQMcjlQdIRiagme9X2gGVNWSNCkqJ9aaZbjuHwdIxO6v4ARN8i7KJPGnPshQqSuDtzFnKJAeR9CF9Kkukv03srWLhKnFXX3enixy5xSFw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ead70b3-e694-41bc-f9a6-08df1e6eabe2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 21:14:39.0893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tktVQ35d/MIFBcAtcPfToeHfQTyOn3Wq/5YQFUzxwqHQH4ptyUYT66R9iyiJqh5CHNpBcK5eRie+tV7J/OuhBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8915
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

On Tue, Sep 29, 2026 at 02:16:18PM -0600, Summers, Stuart wrote:
> On Tue, 2026-09-29 at 11:10 -0700, Matthew Brost wrote:
> > xe_drm_pagemap_populate_mm() allocates a BO to back the range being
> > migrated into device memory, and TTM clears it. That clear is on the
> > GPU
> > page fault and SVM prefetch critical paths, and in the common case it
> > is
> > immediately overwritten in its entirety by the migration itself.
> > 
> > Allocate the BO with XE_BO_FLAG_SKIP_CLEAR and instead deal with the
> > contents in xe_svm_copy(). A migration to VRAM only sources pages
> > which
> > are populated on the CPU side, so if every page has a source DMA
> > address
> > the copy covers the whole allocation and nothing else is needed. Only
> > when the migration is sparse - holes in the CPU VMA from never
> > faulted
> > anonymous memory, for instance - is a clear issued, ahead of the
> > copies,
> > so the uncovered pages still read as zero.
> > 
> > The clear walks the destination device pages, taking the extent of
> > each
> > entry from its folio order since only folio heads are populated, and
> > coalesces physically contiguous entries into chunks of at most 8M. It
> 
> Why 8M?
> 

XE_MIGRATE_CHUNK_SIZE is existing code which has picked 8M for copies,
so using same size for clears. In practice this is limited at 2M as that
is max SVM allocation size but that part is table driven and can be
changed at any time. 

> > runs on the same ordered migrate queue as the copies, so it takes
> > over
> > the pre-migrate fence dependency and the copies are implicitly
> > ordered
> > behind it.
> > 
> > Assisted-by: Github-Copilot:Claude-opus-5
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_svm.c | 150
> > ++++++++++++++++++++++++++++++++++--
> >  1 file changed, 143 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index f39e647512ad..1b4d1222fbb7 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -586,6 +586,124 @@ static void xe_svm_copy_us_stats_incr(struct
> > xe_gt *gt,
> >         }
> >  }
> >  
> > +#define XE_MIGRATE_CHUNK_SIZE  SZ_8M
> > +#define XE_VRAM_ADDR_INVALID   ~0x0ull
> > +
> > +/**
> > + * xe_svm_copy_covers_all() - Does a migration write every page?
> > + * @pagemap_addr: Array of DMA information for the system side of
> > the migration
> > + * @npages: Number of pages covered by @pagemap_addr
> > + *
> > + * A migration to device memory only sources pages which are
> > actually populated
> > + * on the CPU side. Holes in the CPU VMA (never faulted anonymous
> > memory, for
> > + * instance) have no DMA address and leave the corresponding device
> > pages
> > + * untouched by the copy.
> > + *
> > + * Return: true if every page has a source address, false otherwise.
> > + */
> > +static bool xe_svm_copy_covers_all(struct drm_pagemap_addr
> > *pagemap_addr,
> > +                                  unsigned long npages)
> > +{
> > +       unsigned long i;
> > +
> > +       for (i = 0; i < npages;) {
> > +               if (!pagemap_addr[i].addr)
> > +                       return false;
> > +
> > +               i += NR_PAGES(pagemap_addr[i].order);
> > +       }
> > +
> > +       return true;
> > +}
> > +
> > +static int xe_svm_clear_vram_chunk(struct xe_vram_region *vr, u64
> > vram_addr,
> > +                                  unsigned long npages,
> > +                                  struct dma_fence **fence,
> > +                                  struct dma_fence **deps)
> > +{
> > +       struct dma_fence *__fence;
> > +
> > +       vm_dbg(&vr->xe->drm, "CLEAR VRAM - 0x%016llx, NPAGES=%ld",
> > +              vram_addr, npages);
> > +
> > +       __fence = xe_migrate_clear_vram(vr->migrate, npages,
> > vram_addr, *deps);
> > +       if (IS_ERR(__fence))
> > +               return PTR_ERR(__fence);
> > +
> > +       /* Ordered queue - only the first job needs to take the
> > dependency */
> > +       *deps = NULL;
> > +       dma_fence_put(*fence);
> > +       *fence = __fence;
> > +
> > +       return 0;
> > +}
> > +
> > +/**
> > + * xe_svm_clear_vram() - Clear the device memory backing a migration
> > + * @pages: Array of device pages which back the migration
> > destination
> > + * @npages: Number of pages in @pages
> > + * @fence: In/out pointer to the last fence issued on the migrate
> > queue
> > + * @deps: In/out pointer to a dependency to attach to the first job
> > issued
> > + *
> > + * Zero the device memory described by @pages. Entries in @pages are
> > only
> > + * populated at the head of each folio, so the extent of each entry
> > is taken
> > + * from the folio order, and physically contiguous entries are
> > coalesced into a
> > + * single clear of at most XE_MIGRATE_CHUNK_SIZE.
> > + *
> > + * Return: 0 on success, negative error code on failure.
> > + */
> > +static int xe_svm_clear_vram(struct page **pages, unsigned long
> > npages,
> > +                            struct dma_fence **fence,
> > +                            struct dma_fence **deps)
> > +{
> > +       struct xe_vram_region *vr = NULL;
> > +       unsigned long i, count = 0;
> > +       u64 vram_addr = XE_VRAM_ADDR_INVALID;
> > +       int err;
> > +
> > +       for (i = 0; i < npages;) {
> > +               struct page *page = pages[i];
> > +               unsigned long nr;
> > +               u64 addr;
> > +
> > +               if (!page) {
> > +                       ++i;
> > +                       continue;
> > +               }
> > +
> > +               if (!vr)
> > +                       vr = xe_page_to_vr(page);
> > +               XE_WARN_ON(xe_page_to_vr(page) != vr);
> > +
> > +               nr = NR_PAGES(folio_order(page_folio(page)));
> > +               addr = xe_page_to_dpa(page);
> > +
> > +               /* Not contiguous with the pending clear, or chunk is
> > full */
> > +               if (count && (addr != vram_addr + count * PAGE_SIZE
> > ||
> > +                             count + nr > XE_MIGRATE_CHUNK_SIZE /
> > PAGE_SIZE)) {
> > +                       err = xe_svm_clear_vram_chunk(vr, vram_addr,
> > count,
> > +                                                     fence, deps);
> > +                       if (err)
> > +                               return err;
> > +                       count = 0;
> > +               }
> > +
> > +               if (!count)
> > +                       vram_addr = addr;
> > +               count += nr;
> > +               i += nr;
> > +       }
> > +
> > +       if (count) {
> > +               err = xe_svm_clear_vram_chunk(vr, vram_addr, count,
> > fence,
> > +                                             deps);
> > +               if (err)
> > +                       return err;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> >  static int xe_svm_copy(struct page **pages,
> >                        struct drm_pagemap_addr *pagemap_addr,
> >                        unsigned long npages, const enum
> > xe_svm_copy_dir dir,
> > @@ -596,12 +714,23 @@ static int xe_svm_copy(struct page **pages,
> >         struct xe_device *xe;
> >         struct dma_fence *fence = NULL;
> >         unsigned long i;
> > -#define XE_VRAM_ADDR_INVALID   ~0x0ull
> >         u64 vram_addr = XE_VRAM_ADDR_INVALID;
> >         int err = 0, pos = 0;
> >         bool sram = dir == XE_SVM_COPY_TO_SRAM;
> >         ktime_t start = xe_gt_stats_ktime_get();
> >  
> > +       /*
> > +        * Device memory is allocated with XE_BO_FLAG_SKIP_CLEAR, so
> > it still
> 
> Should we check that explicitly somewhere here (or in the wrapper)?
> What if someone changes the code down the road to not skip the clear
> accidentally... I guess we just have a slight performance drop so maybe
> not a functional problem?
> 

We don't have the BO here, only addresses. The why interfaces in GPUSVM
are defined that layer has no idea if driver allocated a BO or not.

> > +        * holds whatever the previous owner left behind. A copy
> > covering every
> > +        * page scrubs it, anything less has to be cleared first.
> > +        */
> > +       if (!sram && !xe_svm_copy_covers_all(pagemap_addr, npages)) {
> > +               err = xe_svm_clear_vram(pages, npages, &fence,
> > +                                       &pre_migrate_fence);
> > +               if (err)
> > +                       goto err_out;
> > +       }
> > +
> >         /*
> >          * This flow is complex: it locates physically contiguous
> > device pages,
> >          * derives the starting physical address, and performs a
> > single GPU copy
> > @@ -617,7 +746,6 @@ static int xe_svm_copy(struct page **pages,
> >                 u64 __vram_addr;
> >                 bool match = false, chunk, last;
> >  
> > -#define XE_MIGRATE_CHUNK_SIZE  SZ_8M
> >                 chunk = (i - pos) == (XE_MIGRATE_CHUNK_SIZE /
> > PAGE_SIZE);
> >                 last = (i + 1) == npages;
> >  
> > @@ -758,8 +886,6 @@ static int xe_svm_copy(struct page **pages,
> >                 xe_svm_copy_us_stats_incr(gt, dir, npages, start);
> >  
> >         return err;
> > -#undef XE_MIGRATE_CHUNK_SIZE
> > -#undef XE_VRAM_ADDR_INVALID
> >  }
> >  
> >  static int xe_svm_copy_to_devmem(struct page **pages,
> > @@ -1121,18 +1247,28 @@ static int xe_drm_pagemap_populate_mm(struct
> > drm_pagemap *dpagemap,
> >         struct xe_validation_ctx vctx;
> >         struct drm_exec exec;
> >         struct xe_bo *bo;
> > +       u32 bo_flags;
> >         int err = 0, idx;
> >  
> >         if (!drm_dev_enter(&xe->drm, &idx))
> >                 return -ENODEV;
> >  
> > +       /*
> > +        * Skip the clear on device memory - xe_svm_copy() either
> > fully
> > +        * overwrites the allocation or clears it explicitly, so
> > clearing here
> > +        * is pure overhead on the page fault and prefetch paths.
> > +        */
> > +       if (IS_DGFX(xe))
> > +               bo_flags = XE_BO_FLAG_VRAM(vr) |
> > XE_BO_FLAG_SKIP_CLEAR;
> 
> This is maybe a comment that should go in the earlier patch that adds
> the flag, but should we have a check that ensures this is a
> kernel/migration BO and not a user BO?

I think the comment here is valid as it explains why setting
XE_BO_FLAG_SKIP_CLEAR is safe as it done later if it is required, but I
should likely add an assert !xe_bo_is_user if XE_BO_FLAG_SKIP_CLEAR is
set. Let me add that.

Matt

> 
> Thanks,
> Stuart
> 
> > +       else
> > +               bo_flags = XE_BO_FLAG_SYSTEM;
> > +       bo_flags |= XE_BO_FLAG_CPU_ADDR_MIRROR;
> > +
> >         xe_pm_runtime_get(xe);
> >  
> >         xe_validation_guard(&vctx, &xe->val, &exec, (struct
> > xe_val_flags) {}, err) {
> >                 bo = xe_bo_create_locked(xe, NULL, NULL, end - start,
> > -                                        ttm_bo_type_device,
> > -                                        (IS_DGFX(xe) ?
> > XE_BO_FLAG_VRAM(vr) : XE_BO_FLAG_SYSTEM) |
> > -                                        XE_BO_FLAG_CPU_ADDR_MIRROR,
> > &exec);
> > +                                        ttm_bo_type_device,
> > bo_flags, &exec);
> >                 drm_exec_retry_on_contention(&exec);
> >                 if (IS_ERR(bo)) {
> >                         err = PTR_ERR(bo);
> 
