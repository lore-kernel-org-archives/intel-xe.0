Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2B4C7115B
	for <intel-xe@archiver.kernel.org>; Fri, 20 Jun 2025 16:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CF510EB7F;
	Fri, 20 Jun 2025 16:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gx6KHzK8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCEF10EB7F
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Jun 2025 16:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750435823; x=1781971823;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oqbU7v+Wcy0vWhRIyw+3FUc79EqRz1zDqjceMfVKSyY=;
 b=gx6KHzK8gKYuby9Xyb3Gl0kTzhA3aIfJsZmMi3TVMX+SB0YZ3Mtmk06P
 un48MR3Ao9NRAPeqGsySUPPvgYLCC6T4HGPZlt8P7pcLhmMBw03uQB3PY
 fBJ+rqMYEpdiwwX0lL7EVLxukhI9ifXB51iHpNlg8W7HXmUxucdZYVGr5
 +bW19fJJTitNPD+NxXL6JrbMj9KltAsDbrQAjekjqe7OYcrkW5b7CfL1R
 eYHTSudO5zSEzmabhSip+yieGX9sQ0A9J4wGx0XW9RtV8CKGOD9fY/xsi
 Nc5R05VT174qXvNEZT2wCFZP6IvlE4/As0VxsLqlfF3E7nFBy85VAEHpS A==;
X-CSE-ConnectionGUID: bWsSjPW3Rliu1+j83y5cvQ==
X-CSE-MsgGUID: L5rejonzQ+SsCnNQC0PC4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52845177"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="52845177"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 09:10:21 -0700
X-CSE-ConnectionGUID: zhXPFpMBSCyUqpYNKlbsTw==
X-CSE-MsgGUID: KEa1Vi9eRzOF2FO4C+ChrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="174563670"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 09:10:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 09:10:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 20 Jun 2025 09:10:19 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 09:10:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvPKr+UmmBaDOAHAuxKNU+2FVVaiIEmTanNplidOmaVk3C8odI0liDMMMY1QnYX4ooxgWkaoJ9D13wxSK7u1hYF9PIVaW+roymp8RTHoCJTy3CaHqJxtXIhrvT91vjO0JPh4AwZuTXIIwCJMtUeZcqY7w9AiJxmLxSRjHvrK1PITNHPCZIC/81fmJevIbs5yrEROlK/7NR5pHy9ifsYN3qjBboGDnbzJhPhCIu3H9BRB9FlvTU42knhc0m5TDkbjvvnbOhjNdlJwLCrDBFfNJANky8GSBzhIcLrceB7VP7mbBTrBWEBaWN21T3L5/CVpy/WOrv6zZ2HvmUxlvLc8pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJ2eTnRfGwM4a8iOUJS0JaNAjlL9Caw3KbQMbNWa8Ik=;
 b=ZkfqTtCjBYsAhlwZHd61/7wHsvhrc5GDvKcOfNnVVBUCcSD5kGg6w74abq1lovIF//NEjcwpTH9tLbKauoGWC4d94jF7OvkAIv4fMopcNzjrL82gq9BLKEz1vXWDuY0Je0Y4TozmGMrHuZeul6+Woj+ZxKPQLEukbIswWYsYz2kuQXHcVG9x5Uga/WZ9XZkA35Uy3nP7zxidXGFlae3gJpNKswC/aZPhK4IQKdnZUEdbLIT7OxWhLiQ0xnGkkFOz/USmyV+6fHU56cr3E98h749hErCD9QpoZfNcUIsD2YJYJcprlD3/rjLZPrtmdDnxBECrigmp9hh47O2Px1fJ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6946.namprd11.prod.outlook.com (2603:10b6:806:2a9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Fri, 20 Jun
 2025 16:10:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Fri, 20 Jun 2025
 16:10:17 +0000
Date: Fri, 20 Jun 2025 09:11:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/migrate: make MI_TLB_INVALIDATE conditional
Message-ID: <aFWIS3/rlAWSlF6K@lstrano-desk.jf.intel.com>
References: <20250620152446.239699-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250620152446.239699-2-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0326.namprd04.prod.outlook.com
 (2603:10b6:303:82::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6946:EE_
X-MS-Office365-Filtering-Correlation-Id: 04392536-b799-4b11-69b8-08ddb014f257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ZSgXKl5i5f4O+lVmLD0iSjxbXH86HVxs2gv9D9GY8mS/hizkuHHl/KUqqN?=
 =?iso-8859-1?Q?/PEvv4vDKLAJEpAFqB3n/j0QO9ApeCe+d8cliAkX0181Z/IiTTf5khxloK?=
 =?iso-8859-1?Q?VhFzb7FUrXSKxkPTG0RVX9tAtxdrNmqv8YomiV7HZnHwLHU9AIajZwi7px?=
 =?iso-8859-1?Q?RFkzzaCWVzEURAqVcaOmIVKPfN7RHjHbB9V3+leu2ZUjss/Qq6m29i1m93?=
 =?iso-8859-1?Q?xy4AmXkkJU1SDk9Ty1Eh1RQvKV7Y6eS8JX0JNL+UVwpptvNQEGTmVxKSgE?=
 =?iso-8859-1?Q?PDVslyjAxudo8IUrlUZ1x/a3aOO/uPzxJ7Xcf57TQrk7p067nJKlN9P2sF?=
 =?iso-8859-1?Q?TJX9TeHNu0p5PMstlx+Sj1rV5z/okT2brlT8+rnMFlpkJgbxy6bgdSOdKM?=
 =?iso-8859-1?Q?xAvAfkqFxw8yU+sThx8tGjEDI1BzdDPgFiwA0EScM9u9iT/F56qHVazn8K?=
 =?iso-8859-1?Q?55urGKSVnW+ryR2ojoeekr+7RMWxW7stWPT2oNOLKE4NvgIyEWKyn8wuVO?=
 =?iso-8859-1?Q?y2TbEhExV5XYwE6gFI9JC/GQgjsu6scG09/AfEEAjwnIKSb0hSZTnmJFdR?=
 =?iso-8859-1?Q?EjHyvbe5QzcGDoezmTUT9BflD84c90fBSHQSExxV3rC7LQ/jyaHxKVyz3M?=
 =?iso-8859-1?Q?1SDoVG8oR5yy65aa4QV/aWPpUtaOMkECgcO61n+LgKavGnj8J7BHtqhOQh?=
 =?iso-8859-1?Q?HS/zyJT5sQPmZaNBK0Lv8C5zORCOGhxShMoQTDCMDBJQMPjGe7XWOyHKj7?=
 =?iso-8859-1?Q?lcSBOmcIQYjmEmOLxyBzd0Kxsq9YgZc2Bj34xVWhjukDzmDcksUqZrmGMV?=
 =?iso-8859-1?Q?UpWG67nW7zp9Anv8DDuZq7ddkCqGnGl+/wCwf++bPEC9r+/9gYqg2BPFOp?=
 =?iso-8859-1?Q?qWLkh39BvNXBwexS78dcyoayROF8AetYlgXvgg+DJAAN/pzwQW5StBxAqx?=
 =?iso-8859-1?Q?IpG2hmI9tBFYkV8pVj5stiW72EJOTJUEluFkHUqyj+HMqVdDyTq1tyScxg?=
 =?iso-8859-1?Q?o4a0XcA1Qj3qi2UjrJVoiGVt/EHjTHTWan5Wg2dKUtLG3ohkIgpbk1WaEr?=
 =?iso-8859-1?Q?qj5s+it+FQdoYUFehbZA+cOfnaG6+TevWzVtO6L7Golbq6+k3UZkfZsx7D?=
 =?iso-8859-1?Q?lVpTVCd3qaZa9loFYJ8rIe81wppXoD9eUhpuEI6pWxHyI3m/bRgQYoGbJH?=
 =?iso-8859-1?Q?7yzWmpuebuZUGP1wTSdRy3I6e7iy9liTN1j5TYc0eKyUWQHBCoRB08ORBZ?=
 =?iso-8859-1?Q?pLpxkJPde9DYT+pzIWaLTj6yBeMvEZv15F9WRjddJafA/YF74ob/ptcFWI?=
 =?iso-8859-1?Q?c/HU+Ob04SHdMsflf312xlWzMnxrs8sxGeah06zzfIjcYMYug3wlmOWmU2?=
 =?iso-8859-1?Q?TedOyz/IUcYyW+rpPcRTDePE5ota3WW/VKkqtyT2fQqgSTnnsMeuGHv3qv?=
 =?iso-8859-1?Q?3ZYj0qZ1NnzWWqwd1wc5f5yP/2BFF4y6V8PQRKSSOda+IIwpYM6pj2FBP4?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9b7d1YT0fqvQIsAkzhG1EkvNOlwkEmpkdqQejXVYl6fAMruYv/suTMnqJh?=
 =?iso-8859-1?Q?QAREl9LSNmptvNYZUD+Ups7M64zInAnhzY2pDwu0XQJK2OvEM73PaRhVaK?=
 =?iso-8859-1?Q?iXolYwIetPQVOXinqFW/7ToXC6g8W6NPOvxFi9f5SAVwtiA1AkY/QE/dPn?=
 =?iso-8859-1?Q?XRqhVekjDCspxB6xaausN6jaGPizMRWZDy+5I/kBxvzgFIMbpR/05foxRP?=
 =?iso-8859-1?Q?gcY8Tp88vkABgv6XtF+3Lk2LBc3dSYJnKqAoP3TFXLjjpQxS1O0bwiLVjx?=
 =?iso-8859-1?Q?nlphFr3cX6cSgv+B61mx39JpCT9Pzan0yq4ovVQYexeZKFPcSyln3rHcdr?=
 =?iso-8859-1?Q?kKLN2DnF9MRaFhmQqozeUw6L1Qv0oTpR/QriSGIPidZOKRu+9vY7yaqaP+?=
 =?iso-8859-1?Q?sb6uTkTFAm4rQTici6NAjXqTxNxRXCRz/3xar4PghRBCw5GbqpXqs0qJ83?=
 =?iso-8859-1?Q?ZcvSBvtSASni4qY4i4PdRyUF0qm9Hkl7uxEUwvA9StXes38cT1Y7V3iIjC?=
 =?iso-8859-1?Q?ap/CDEfA9aFW+f85tnzaT9mAU5Ooh3aw1i1ijkx9kJk7hf9C1gBkjIoXeF?=
 =?iso-8859-1?Q?uxY0a/iZmGOlu33e1sWPFikUTgxIwXoDEg9B/7frLoUvZ5zgkqfv9tA38f?=
 =?iso-8859-1?Q?+LQuixDut4X9HNN72wjPooAwX0JvPDZPY88sWtsijTkzDEHtNkn9LXiY3K?=
 =?iso-8859-1?Q?o7Qz9fENeGvSmM0+DpvwLA9G0OHWxVFVY/1JvCB+jS36cDm3ZpBxH6ftjV?=
 =?iso-8859-1?Q?GmcCNGrstqXVZ9F2LaE2jN6fda2VKasXXU61B6sW6zpKxBcm3Wr5kwN890?=
 =?iso-8859-1?Q?k1uVpV09j3kuZ6PZQ0V2sCjjO0sn3HhSkkwjPf1TDf3WyWiYdbZps5571+?=
 =?iso-8859-1?Q?wve/WG3aVv0gCg+oU7GZoa+fuyUC/mEvJUm/GQE+s0rL5+vUtGjizjxQZn?=
 =?iso-8859-1?Q?Peyv7An0a68G5QGO9ybAK2cZO+1b6iLB39O50IWiG7d/p1MW61MR9TOmap?=
 =?iso-8859-1?Q?C51G6f85XkPhZhP2BvYQHpar5+Lwd8RUekODZtmcp7Et56KcfF+TZ/rm1q?=
 =?iso-8859-1?Q?BNlTP3k+pUC8fHmBhnEu/Plq/JtfshVo1FBVSzHf33smk3dSuXA//94RLt?=
 =?iso-8859-1?Q?aS5I9vQ/ycqj+D/r09iYa2r/qR7n2QRAqQcSLEYFk5fU0hsdb4nlP4vch6?=
 =?iso-8859-1?Q?RlqCf6IEKsPMgJPcJz+0qFxKwVO2VO+rm7oBKevGH80aiZqDqmmEG+GLab?=
 =?iso-8859-1?Q?vFG9W6LdsBzO5qqNPiK+zCKCEOit5WHbrMGt0Y6VSEDUisqKCGlbdzVVfH?=
 =?iso-8859-1?Q?bnSeEIV/LAV3Af+Zl8y2tXAxoybmdKa1FKNZmAPnSltTr9tOYcZ8xKG1QH?=
 =?iso-8859-1?Q?3/YkU7J2FHwSxeZAX5J6NYjRhvPBcuhQGhVKxGSg5EGHxxfhFFhmQp8KJf?=
 =?iso-8859-1?Q?oAFGmKxP9NQfP6Oh0IltD/+pkp0KwEDLU/e5hO116CiNhbmT2sb8ePJS52?=
 =?iso-8859-1?Q?nKnuSJOipE3DwFJz6DrxBvBpKTTvm8PO/V2cYUjov5XlM9sXnwUIEtMMIi?=
 =?iso-8859-1?Q?L7bC6GAOKV7MIrz48s0RUSuIOJybrQldXwWi/SwdSAUOIvOJFMBJDNCsdg?=
 =?iso-8859-1?Q?Q4mwfbz+g7WRteu94CoQB7BYVl3UEoIZ9Qk16u6LRJw+UNXgl6sN8OSg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04392536-b799-4b11-69b8-08ddb014f257
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 16:10:17.0948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrX7pD+7fZk8/+H5DEuk3rHcwCzLzSAvk5NfJucU9AfzJnnq7HaSpmRb/y2jkaAOQeS4tN9EVJTKqJSEIuV6iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6946
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

On Fri, Jun 20, 2025 at 04:24:47PM +0100, Matthew Auld wrote:
> When clearing VRAM we should be able to skip invalidating the TLBs if we

For copies, we always program SRAM PTEs, and need a invalidate?
Maybe mention this in the commit message.

> are only using the identity map to access VRAM (which is the common
> case), since no modifications are made to PTEs on the fly. Also since we
> use huge 1G entries within the identity map, there should be a pretty
> decent chance that the next packet(s) (if also clears) can avoid a tree
> walk if we don't shoot down the TLBs, like if we have to process a long
> stream of clears.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c  | 18 +++++++++++-------
>  drivers/gpu/drm/xe/xe_ring_ops.c | 10 +++++-----
>  2 files changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 8f8e9fdfb2a8..a76363740a12 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -896,7 +896,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  			goto err;
>  		}
>  
> -		xe_sched_job_add_migrate_flush(job, flush_flags);
> +		xe_sched_job_add_migrate_flush(job, flush_flags | MI_INVALIDATE_TLB);
>  		if (!fence) {
>  			err = xe_sched_job_add_deps(job, src_bo->ttm.base.resv,
>  						    DMA_RESV_USAGE_BOOKKEEP);
> @@ -1119,11 +1119,13 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  
>  		size -= clear_L0;
>  		/* Preemption is enabled again by the ring ops. */
> -		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it))
> +		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it)) {
>  			xe_res_next(&src_it, clear_L0);
> -		else
> -			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_only_system_ccs,
> -				 &src_it, clear_L0, dst);
> +		} else {
> +			emit_pte(m, bb, clear_L0_pt, clear_vram,
> +				 clear_only_system_ccs, &src_it, clear_L0, dst);
> +			flush_flags |= MI_INVALIDATE_TLB;
> +		}

What about the if statements for dst_it / copy_system_ccs? Do we not
need to set MI_INVALIDATE_TLB there?

Matt

>  
>  		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>  		update_idx = bb->len;
> @@ -1134,7 +1136,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  		if (xe_migrate_needs_ccs_emit(xe)) {
>  			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
>  				      m->cleared_mem_ofs, false, clear_L0);
> -			flush_flags = MI_FLUSH_DW_CCS;
> +			flush_flags |= MI_FLUSH_DW_CCS;
>  		}
>  
>  		job = xe_bb_create_migration_job(m->q, bb,
> @@ -1469,6 +1471,8 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
>  		goto err_sa;
>  	}
>  
> +	xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
> +
>  	if (ops->pre_commit) {
>  		pt_update->job = job;
>  		err = ops->pre_commit(pt_update);
> @@ -1667,7 +1671,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>  		goto err;
>  	}
>  
> -	xe_sched_job_add_migrate_flush(job, 0);
> +	xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
>  
>  	mutex_lock(&m->job_mutex);
>  	xe_sched_job_arm(job);
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index bc1689db4cd7..b5548e0769f4 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -110,10 +110,10 @@ static int emit_bb_start(u64 batch_addr, u32 ppgtt_flag, u32 *dw, int i)
>  	return i;
>  }
>  
> -static int emit_flush_invalidate(u32 *dw, int i)
> +static int emit_flush_invalidate(u32 *dw, int i, u32 flush_flags)
>  {
> -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> -		  MI_FLUSH_IMM_DW | MI_FLUSH_DW_STORE_INDEX;
> +	dw[i++] = MI_FLUSH_DW |  MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW |
> +		MI_FLUSH_DW_STORE_INDEX | (flush_flags & MI_INVALIDATE_TLB) ?: 0;
>  	dw[i++] = LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR;
>  	dw[i++] = 0;
>  	dw[i++] = 0;
> @@ -411,13 +411,13 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
>  	if (!IS_SRIOV_VF(gt_to_xe(job->q->gt))) {
>  		/* XXX: Do we need this? Leaving for now. */
>  		dw[i++] = preparser_disable(true);
> -		i = emit_flush_invalidate(dw, i);
> +		i = emit_flush_invalidate(dw, i, job->migrate_flush_flags);
>  		dw[i++] = preparser_disable(false);
>  	}
>  
>  	i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
>  
> -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | job->migrate_flush_flags |
> +	dw[i++] = MI_FLUSH_DW | job->migrate_flush_flags |
>  		MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW;
>  	dw[i++] = xe_lrc_seqno_ggtt_addr(lrc) | MI_FLUSH_DW_USE_GTT;
>  	dw[i++] = 0;
> -- 
> 2.49.0
> 
