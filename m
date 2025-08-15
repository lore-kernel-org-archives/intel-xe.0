Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428F7CA0ED1
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 21:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33E910E0A1;
	Fri, 15 Aug 2025 21:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xu2ae0aW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C8410E0A1
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 21:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755293734; x=1786829734;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HNGwIZXyJ2erWx0jR0nqNie/G14yjlqxxRXy6SnRO2o=;
 b=Xu2ae0aWvzGa9f6qLuRuZbRUMgVLHMQS/A2ipITFhLeBfoxNc/nOOsCd
 IVOziVidAeVV4S9BVVHHrbU7D9fm+8/XTl9v5VqvuLiuyoc/j92unkdJ4
 JfpA4HOtl/Q5AVMXfuDObGARMKHD1CnfuztHi8lmA0GxfwbqGt2F8GnHb
 Dupmz2TdJuXsmsMLYoouR2sC1jY7q4Ma8NIIRNp5CpifCHvKRdRNUruuP
 ZnN676wJmwv35v+0Btjg2llIHNB0ZfEFiDelgrvm1F/wlK1JXmf54UTQM
 D3p8ospbfPwdeZx0/jPZQbWjkqRyiDYnTjsP78Hfc5gm2Xj+d+HJHcUWJ Q==;
X-CSE-ConnectionGUID: 1dgJRtc4R+is52nqX/xW5A==
X-CSE-MsgGUID: llLDBuyWQqGyQoi9Kp4grQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="75066805"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="75066805"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 14:35:34 -0700
X-CSE-ConnectionGUID: wnQUmVA7Qdy0jZydhmRXnw==
X-CSE-MsgGUID: ia+OoIJWTdqxJcNYkxTUqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="167352099"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 14:35:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 14:35:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 14:35:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.74)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 14:35:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hpk3Q6+ccLyqw/M3rpNhlr3HQ+lPDzf4mlA18aHDH6fbzdsND0O6JaeE0A00O4jU+0tpd89gXU8oBQhqaSsYmY8Ujx0pMZP937BpqNeq+OX/ysLm+z90+sfxE5P0qGt6uCSU/IOB/FDroyByen8EbRoxq2ShSVr9rDpEChzQnwxPgsvAtSAJteslrh+6yM6Xc3SAoCQdZ+j+aouuLB0ETfnW+7ck3wTei3rAG0iWcJRXSQb8Qxw7lP+s3fYe7fadwFXkZP3BKvtdaXp4LOVfpxsza+R6oDEShPjhDw8PpPvCqduKqM+QXdzA2SNR0TmKbHB5FgKGc3gZQsN1YSKrag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOwHHPloqqosyzNX20Lbjxe9gl5cpI/00xNk+ddcMac=;
 b=mW19C/492kxy0XLhom+4KjPfLAQxOvo9xJLvnaaxrImTZihHK9Itqb4d1hMhY4Ye0fAlwry1BgDiMCNj145e9GlrU3Wh4Xzy7V26KFSuhO9EbeVz92q1KPS7fScdI+dJBZ9R6vnTUX0zyimTdehgmuAr8zptWffQa8DIj8yAsAnGyT2o73pNlz7zTNTMcW61BFZgYNWbgfBajnbZBbxJ4emMfNQPQCmrRN4jFbv+ZhlUJ9CLmBYLGz1LK5SXJuQT8Hw6vB9paxlAUr9Az9oJHnguz4Qwshpu5oUZwlD18knA6BIf+oq8jtqnJdmV2sofgQ8eWxRwmPqypLjLaxeyvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6291.namprd11.prod.outlook.com (2603:10b6:208:3e5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Fri, 15 Aug
 2025 21:35:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9031.018; Fri, 15 Aug 2025
 21:35:30 +0000
Date: Fri, 15 Aug 2025 16:35:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <prashanth.kumar@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>, Brian Welty
 <brian.welty@intel.com>
Subject: Re: [PATCH v3 02/13] drm/xe/psmi: Add debugfs interface for PSMI
Message-ID: <ck5xqmkcaogw2frfrfih6m7rkga6gdemxcwrdrj6pvqqgelomg@622zxnjgepsv>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
 <20250808-psmi-v3-2-a111e9f1e4b7@intel.com>
 <141f2daa-30cd-44bf-9314-69e6af1c771e@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <141f2daa-30cd-44bf-9314-69e6af1c771e@intel.com>
X-ClientProxiedBy: SJ0PR13CA0123.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f4bd3e9-35fc-486b-8923-08dddc43a875
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?7VFeneQMLuC3/7mG8NF7xGVKPwNYl6QdttSeTsciAJYDkIfU4uRMAEVor6?=
 =?iso-8859-1?Q?I36LD8zIYWiBc72OGW+YORb9JNfQ+zu5SH4ITHnNtygEyksJWiG9bYfSU8?=
 =?iso-8859-1?Q?Jcp4xeoEbzVdfmIi+gHbsDx/Qt9yzkWvfpwnQOUmKa73eES86hkXxyFQiG?=
 =?iso-8859-1?Q?PO59yQcJvluCn7kvF1nHCwyzfpMsMq71jNdvOQb04vncZCJXVzHF4nOPbb?=
 =?iso-8859-1?Q?KnX9lfyVwf3lC0+fn51JH7mAgEMPNBe/PMO44CkP1x0QIerkV5lYumTOpC?=
 =?iso-8859-1?Q?HNDONO9X8ZPFiS3L/aEgzFSdL2iWLu/rSphMusW7iK/cMk2uBBFVyVHe13?=
 =?iso-8859-1?Q?4K3OwSc/lA3f+Rgmyb3eavFGdhCZsvrCN523BgAUKJt/fL9/+YWYPLFhnP?=
 =?iso-8859-1?Q?Jfto6h+2vwWHMAB1W3tsKzds1D/q1FeD5t9HPDcF6ieEW4vRmPNmJsdyOJ?=
 =?iso-8859-1?Q?9XatMdcikBg3Q7zzlJXfp/9YHeiJ3bNfLjx1w+YoSJ3nmY4ZwDGHALIMJN?=
 =?iso-8859-1?Q?IzHy1bXZ1mq9M27f7oJ0S9jeHvK+ZXbG76Dh1OVPXZ00g7k/bhPR08Khro?=
 =?iso-8859-1?Q?qa15Oz2NP3oRXLnSOzlwWnY1WmCO5u/mlMVWtfE+PhO6osjWImBfeoEacN?=
 =?iso-8859-1?Q?usrpNkiR2cDalQlb3heytRgn7VSwxI1bYB6607hwHOodbq1TqA0AJhCixQ?=
 =?iso-8859-1?Q?dXUPgKsCcpYz2Q+7/5evl7eXwVG98VjQ4bkeTfWf7eHcUrePJXc8mLOgS6?=
 =?iso-8859-1?Q?quUOfQJ/pJ6q/KR0JFW2BrifGRJ9fNQr5CgSBZ9QP3MHI8eFhspzCbvb7+?=
 =?iso-8859-1?Q?Kjipz/hFIsADkH0VxS2Z5ZdeqaxF5w6b26ZStfqqmqh0D9kgPoConInWyu?=
 =?iso-8859-1?Q?FUkwEa6bSg5/myxQLNeCPw9m1UvD3Sy1inSktxqyfSOAtr9FoH8LDEXzi6?=
 =?iso-8859-1?Q?eSx06+cRZsR+cmm/TPiqcUMA9K/sjXfNmwjcjYx3e4zmdPsuNZjkcQ8MFd?=
 =?iso-8859-1?Q?n+YR2PBxFmJC9CzxGbJ0EKnqe2WMuQoLahtJIrOZhkvnzbeTPjI7MnMNTF?=
 =?iso-8859-1?Q?kC116XZGP4a8dpTlNLzTkL8E0ev2s9nZyt2xRjP+Dy5X0UP+OktYRDqLZ+?=
 =?iso-8859-1?Q?KQF2g+A1nlKULPTdRQX1hRPLQ360cVNH17YibXODPRtmTqOygRFzSk8hs4?=
 =?iso-8859-1?Q?0fwi4NPh2JeXFttsbPycnDZYxYMETdJQ0qmgTMRECPq1aFQEcKYEGfQluW?=
 =?iso-8859-1?Q?FfzDJ8RlW2xm6BQUYWj2Dx2Dqev5C3B+lc3LjdzxRF6R5ukGK3cauTTDTN?=
 =?iso-8859-1?Q?Xb+KqKFTgLVNzFiN6jvlew9NYztCAiv5sRVVAsi8vUibrG+ZYNG/Dbj68X?=
 =?iso-8859-1?Q?ISj0Pq5INFkc5vcbQtUfLtZQedPijOytO1/eDrs8sXV6HLtsdjloNMJw5V?=
 =?iso-8859-1?Q?fdFyRkREjUFKgfmqMG3ys0dLMVTyapvTo4X2gea53xSRxHjkyQtsV5I74U?=
 =?iso-8859-1?Q?Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8p9id+3bYy3YVW6joi+7XoIJ0phz1Mf0/jjMIBApT2F4CXuO66TiEBYQof?=
 =?iso-8859-1?Q?zV5JczbBefRH2RgzJd15MR+V42P8Ub73Qlm1TaFSozOJwYGcevai/9FH7M?=
 =?iso-8859-1?Q?ZkV85jAye1aWvB+OW/6y/l9/Eg6liOXR6EIvDNsLFF5N5s6UNlMavOq14h?=
 =?iso-8859-1?Q?KrBPMkvyb+a/DRTXe5FsRA2X+fKfqaReXrZV0PUV+NdT2vsHjfatWAiWOQ?=
 =?iso-8859-1?Q?T+5BjAHROBu05h/Zlirg6g4GTdvkr4D+eSlbm+3TQzEc7IBy6Kxo1REHBF?=
 =?iso-8859-1?Q?3PUQmbIIipXWEf2F8JBBL0bkMt8NkuCEbpjZH7iB9glV92Nl28ZLc4kyi7?=
 =?iso-8859-1?Q?p2xOqHnzMyU5V1kwge6+akH+R/mUmQz7hjvKAlW2mNPBgXDrsQUUdjNM8A?=
 =?iso-8859-1?Q?b6Fh5UqO+p+RrT8CkV9onn1cRHjGoFuvVCeW/c2RRebTblRV0D6T510/0j?=
 =?iso-8859-1?Q?Gj3BKNEnIy5Ih/rIEhFjtwDJBLt2CUHaS/mXRmNzWT7Sb7KcrJxLFfPR9o?=
 =?iso-8859-1?Q?bVCFzSa7r+/sLf5tFlabewy9gKMt7TwPCd9ppEJorp3rvm9ITkP4tMxAbs?=
 =?iso-8859-1?Q?YKdrDcHxjeaxkoRD26jZRxkcFwmVUlO4+lQvGvhBxsPTI/oleiJRdlgt5d?=
 =?iso-8859-1?Q?U5kyF+JVu7+VZRMUdA9xu3SRod0gQAgT1jHU11OnBsk0dZJ1PUVOIGPZb5?=
 =?iso-8859-1?Q?7Vzp3WgigDHxZrybK1i1VwxzPwNs7rvczl9IgKicpJepbt2wzWK6bb1kUY?=
 =?iso-8859-1?Q?Lz6BvZ9GHNfaF3/krLqssdSbSgq+yfERKR8adVD32voXqrvX8TKfurpvcy?=
 =?iso-8859-1?Q?7B1CEWq0foj5A6cFZzVTV+6msn7fr/Blus1aITUaupqw8cQHG07eFbp716?=
 =?iso-8859-1?Q?RLxz+W4qvyQGmWM879hh4/Snc0wmyPfzqc+wlEiIx3qFJJvsGI+yNgUXvV?=
 =?iso-8859-1?Q?EDYJrSrwthgvw6eCJj6Zd0XXo11zfcHTWyIgHPn5U1NDXxTbJ1hxI6wxKL?=
 =?iso-8859-1?Q?gHmYfpcyGGQNjOiV823VcUr7ViTllESF6HVHc4QR5FNqumaGd4lrpbiptL?=
 =?iso-8859-1?Q?ttC3y24o9tWYs10DCd4rNhkgnGo2o9nS665FM1q8Nm3B7hpS16zw9PCcih?=
 =?iso-8859-1?Q?Hyo+lyE15b6l0mswbqh97o2zn/TJoYIkA1fQDWc7mgkxSuK9qrMby/QRBQ?=
 =?iso-8859-1?Q?JeNYc77/WjSs7lFQ5I20clJjcb2bjWDUSGWkAn6c5QNSkhic1y/g7Qz/TB?=
 =?iso-8859-1?Q?QqKrIPcRIYBg8rulgy7bDQGach2l9Y9H0UAJCuBfCip7FdXOE3MLpZ5CxS?=
 =?iso-8859-1?Q?JrMEcSJfmUzsS00yJKMyaRRvrOXoSfirQDDoeM11eM4PXFm/CGpk209oby?=
 =?iso-8859-1?Q?bDLB8dU5EVvyS8CzhY+Z4Pd8EDajx5KXV7dWclhSDRi1bXRtv5oBZ8Itk8?=
 =?iso-8859-1?Q?8oy81m6Mx47DXzCKz5hCt+R/lp/UuZ/psl7ORZsx8dGW6IieFNJ8bGS3ca?=
 =?iso-8859-1?Q?q3hYd3rwcxuNVczlIV3+gT6Qm49BD4REkLPWxZgxPesjvszEvJVHfieL9t?=
 =?iso-8859-1?Q?i4ACEAmFkc8qafDQhey4PsOr9MKPsWsYafO2lCSUi/jmmWsVyW243De58l?=
 =?iso-8859-1?Q?XGubnZ6XPCykd2TlxisZ5dYC4k5CpHcz4C/mFuKjzCpkFk6jZ3ceFinQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4bd3e9-35fc-486b-8923-08dddc43a875
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 21:35:30.5939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CREzVkFRo2LfHnuSTGJUhx7tctkNoVRzbmlHddTxZw9GMon/N1HMuFHA1S2tKJexIdl4xRrrDtLkIP8BfTpoP308GwMXk4dvXxQtzsBu7Dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6291
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

On Wed, Aug 13, 2025 at 11:42:07AM +0100, Matthew Auld wrote:
>On 08/08/2025 18:29, Lucas De Marchi wrote:
>>Requirement for PSMI capture is to have a physically contiguous buffer.
>>All the needed configuration is done by the userspace tool directly to
>>the GPU via mmio access.
>>
>>This interface only support allocating from VRAM regions. For integrated
>>devices, the PSMI buffer is in SYSTEM memory and should be allocated by
>>userspace using hugetlbfs.
>>
>>Here we add the ability to allocate a region of physically contiguous
>>memory by writing to debugfs file (listed below). For multi-tile devices,
>>the capture tool requires ability to allocate a capture buffer per tile
>>(VRAM region) and so user can specify a region_mask. The tool then
>>can mmap the buffers via direct mmap of the PCIBAR via sysfs.
>>
>>To support the capture tool, 3 new debugfs entries are added:
>>
>>    psmi_capture_addr - physical address per VRAM region's capture buffer
>>    psmi_capture_region_mask - select which region(s) to allocate a buffer
>>    psmi_capture_size - size of current capture buffer
>>
>>Writing psmi_capture_size will allocate new buffer of requested size per
>>region after freeing any current buffers.
>>
>>Cc: Matt Roper <matthew.d.roper@intel.com>
>>Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>Original-author: Brian Welty <brian.welty@intel.com>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>v2:
>>  - Fix kernel-doc
>>  - Do not walk all region_mask on cleanup: it should never be needed
>>  - Replace sysmem checks by asserts as they should never be set
>>  - s/debugfs_create/debugfs_register/ and do not pass the root dir:
>>    this makes it similar to other parts registering debugfs
>>  - Do not export a cleanup function, rather use a init that registers
>>    a devm action if needed
>>  - Drop modparam in favor of configfs whose attribute will be
>>    implemented when everything is ready
>>---
>>  drivers/gpu/drm/xe/Makefile          |   1 +
>>  drivers/gpu/drm/xe/xe_debugfs.c      |   3 +
>>  drivers/gpu/drm/xe/xe_device.c       |   5 +
>>  drivers/gpu/drm/xe/xe_device_types.h |   8 +
>>  drivers/gpu/drm/xe/xe_psmi.c         | 313 +++++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_psmi.h         |  14 ++
>>  6 files changed, 344 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>index 8e0c3412a757c..85b8d3a59ef07 100644
>>--- a/drivers/gpu/drm/xe/Makefile
>>+++ b/drivers/gpu/drm/xe/Makefile
>>@@ -98,6 +98,7 @@ xe-y += xe_bb.o \
>>  	xe_pcode.o \
>>  	xe_pm.o \
>>  	xe_preempt_fence.o \
>>+	xe_psmi.o \
>>  	xe_pt.o \
>>  	xe_pt_walk.o \
>>  	xe_pxp.o \
>>diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>>index 0b4a532f7c45c..bc717519502dd 100644
>>--- a/drivers/gpu/drm/xe/xe_debugfs.c
>>+++ b/drivers/gpu/drm/xe/xe_debugfs.c
>>@@ -20,6 +20,7 @@
>>  #include "xe_guc_ads.h"
>>  #include "xe_mmio.h"
>>  #include "xe_pm.h"
>>+#include "xe_psmi.h"
>>  #include "xe_pxp_debugfs.h"
>>  #include "xe_sriov.h"
>>  #include "xe_sriov_pf.h"
>>@@ -400,6 +401,8 @@ void xe_debugfs_register(struct xe_device *xe)
>>  	xe_pxp_debugfs_register(xe->pxp);
>>+	xe_psmi_debugfs_register(xe);
>>+
>>  	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
>>  	if (IS_SRIOV_PF(xe))
>>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>index 57edbc63da6f4..62edb39b61fb0 100644
>>--- a/drivers/gpu/drm/xe/xe_device.c
>>+++ b/drivers/gpu/drm/xe/xe_device.c
>>@@ -54,6 +54,7 @@
>>  #include "xe_pcode.h"
>>  #include "xe_pm.h"
>>  #include "xe_pmu.h"
>>+#include "xe_psmi.h"
>>  #include "xe_pxp.h"
>>  #include "xe_query.h"
>>  #include "xe_shrinker.h"
>>@@ -908,6 +909,10 @@ int xe_device_probe(struct xe_device *xe)
>>  	if (err)
>>  		return err;
>>+	err = xe_psmi_init(xe);
>>+	if (err)
>>+		return err;
>>+
>>  	err = drm_dev_register(&xe->drm, 0);
>>  	if (err)
>>  		return err;
>>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>index 01e8fa0d2f9f7..bf9af8d0b84ae 100644
>>--- a/drivers/gpu/drm/xe/xe_device_types.h
>>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>>@@ -576,6 +576,14 @@ struct xe_device {
>>  	atomic64_t global_total_pages;
>>  #endif
>>+	/** @psmi: GPU debugging via additional validation HW */
>>+	struct {
>>+		/** @psmi.capture_obj: PSMI buffer for VRAM */
>>+		struct xe_bo *capture_obj[XE_MAX_TILES_PER_DEVICE + 1];
>>+		/** @psmi.region_mask: Mask of valid memory regions */
>>+		u8 region_mask;
>>+	} psmi;
>>+
>>  	/* private: */
>>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>>diff --git a/drivers/gpu/drm/xe/xe_psmi.c b/drivers/gpu/drm/xe/xe_psmi.c
>>new file mode 100644
>>index 0000000000000..e6a67e85e1bb2
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/xe_psmi.c
>>@@ -0,0 +1,313 @@
>>+// SPDX-License-Identifier: MIT
>>+/*
>>+ * Copyright © 2025 Intel Corporation
>>+ */
>>+
>>+#include <linux/debugfs.h>
>>+
>>+#include "xe_bo.h"
>>+#include "xe_device.h"
>>+#include "xe_configfs.h"
>>+#include "xe_psmi.h"
>>+
>>+/*
>>+ * PSMI capture support
>>+ *
>>+ * Requirement for PSMI capture is to have a physically contiguous buffer.  The
>>+ * PSMI tool owns doing all necessary configuration (MMIO register writes are
>>+ * done from user-space). However, KMD needs to provide the PSMI tool with the
>>+ * required physical address of the base of PSMI buffer in case of VRAM.
>>+ *
>>+ * VRAM backed PSMI buffer:
,,>>+ * Buffer is allocated as GEM object and with XE_BO_CREATE_PINNED_BIT flag which
>>+ * creates a contiguous allocation. The physical address is returned from
>>+ * psmi_debugfs_capture_addr_show(). PSMI tool can mmap the buffer via the
>>+ * PCIBAR through sysfs.
>>+ *
>>+ * SYSTEM memory backed PSMI buffer:
>>+ * Interface here does not support allocating from SYSTEM memory region.  The
>>+ * PSMI tool needs to allocate memory themselves using hugetlbfs. In order to
>>+ * get the physical address, user-space can query /proc/[pid]/pagemap. As an
>>+ * alternative, CMA debugfs could also be used to allocate reserved CMA memory.
>>+ */
>>+
>>+static bool psmi_enabled(struct xe_device *xe)
>>+{
>>+	return xe_configfs_get_psmi_enabled(to_pci_dev(xe->drm.dev));
>>+}
>>+
>>+static void psmi_free_object(struct xe_bo *bo)
>>+{
>>+	xe_bo_lock(bo, NULL);
>>+	xe_bo_unpin(bo);
>>+	xe_bo_unlock(bo);
>>+	xe_bo_put(bo);
>>+}
>>+
>>+/*
>>+ * Free PSMI capture buffer objects.
>>+ */
>>+static void psmi_cleanup(struct xe_device *xe)
>>+{
>>+	unsigned long id, region_mask = xe->psmi.region_mask;
>>+	struct xe_bo *bo;
>>+
>>+	for_each_set_bit(id, &region_mask,
>>+			 ARRAY_SIZE(xe->psmi.capture_obj)) {
>>+		/* smem should never be set */
>>+		xe_assert(xe, id);
>>+
>>+		bo = xe->psmi.capture_obj[id];
>>+		if (bo) {
>>+			psmi_free_object(bo);
>>+			xe->psmi.capture_obj[id] = NULL;
>>+		}
>>+	}
>>+}
>>+
>>+static struct xe_bo *psmi_alloc_object(struct xe_device *xe,
>>+				       unsigned int id, size_t bo_size)
>>+{
>>+	struct xe_bo *bo = NULL;
>>+	struct xe_tile *tile;
>>+	int err;
>>+
>>+	if (!id || !bo_size)
>>+		return NULL;
>>+
>>+	tile = &xe->tiles[id - 1];
>>+
>>+	/* VRAM: Allocate GEM object for the capture buffer */
>>+	bo = xe_bo_create_locked(xe, tile, NULL, bo_size,
>>+				 ttm_bo_type_kernel,
>>+				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>>+				 XE_BO_FLAG_PINNED |
>>+				 XE_BO_FLAG_NEEDS_CPU_ACCESS);
>
>It might make sense to add XE_BO_FLAG_PINNED_LATE_RESTORE, assuming 
>this memory needs to be saved and restored for VRAM case. Since it 
>might could be ~large it might benefit from using the blitter instead 
>of CPU?

ok

>
>Also do you want the memory to be pre-cleared here? Currently it just 
>gives you back uncleared memory, also with uncleared CCS. If uncleared 
>is fine, then should that be documented somewhere for the user so that 
>there are no surprises?

I don't think it needs to be cleared - for example for the system memory
case it's coming from hugetlbfs. I will double check that... may not
change anything in next version regarding that though as I want to
resolve other comments.

>
>>+
>>+	if (!IS_ERR(bo)) {
>>+		/* Buffer written by HW, ensure stays resident */
>>+		err = xe_bo_pin(bo);
>>+		if (err)
>>+			bo = ERR_PTR(err);
>>+		xe_bo_unlock(bo);
>>+	}
>>+
>>+	return bo;
>>+}
>>+
>>+/*
>>+ * Allocate PSMI capture buffer objects (via debugfs set function), based on
>>+ * which regions the user has selected in region_mask.  @size: size in bytes
>>+ * (should be power of 2)
>>+ *
>>+ * Always release/free the current buffer objects before attempting to allocate
>>+ * new ones.  Size == 0 will free all current buffers.
>>+ *
>>+ * Note, we don't write any registers as the capture tool is already configuring
>>+ * all PSMI registers itself via mmio space.
>>+ */
>>+static int psmi_resize_object(struct xe_device *xe, size_t size)
>>+{
>>+	unsigned long id, region_mask = xe->psmi.region_mask;
>>+	struct xe_bo *bo = NULL;
>>+	int err = 0;
>>+
>>+	/*
>>+	 * Buddy allocator anyway will roundup to next power of 2,
>>+	 * so rather than waste unused pages, require user to ask for
>>+	 * power of 2 sized PSMI buffers.
>
>It will internally do a trim for you to give back any excess, if not a 
>power-of-two, so might be beneficial to drop this restriction. 
>Probably doesn't matter all that much though.

ok

thanks
Lucas De Marchi

>
>>+	 */
>>+	if (size && !is_power_of_2(size))
>>+		return -EINVAL;
>>+
>>+	/* if resizing, free currently allocated buffers first */
>>+	psmi_cleanup(xe);
>>+
>>+	/* can set size to 0, in which case, now done */
>>+	if (!size)
>>+		return 0;
>>+
>>+	for_each_set_bit(id, &region_mask,
>>+			 ARRAY_SIZE(xe->psmi.capture_obj)) {
>>+		/* smem should never be set */
>>+		xe_assert(xe, id);
>>+
>>+		bo = psmi_alloc_object(xe, id, size);
>>+		if (IS_ERR(bo)) {
>>+			err = PTR_ERR(bo);
>>+			break;
>>+		}
>>+		xe->psmi.capture_obj[id] = bo;
>>+
>>+		drm_info(&xe->drm,
>>+			 "PSMI capture size requested: %zu bytes, allocated: %lu:%zu\n",
>>+			 size, id, bo ? xe_bo_size(bo) : 0);
>>+	}
>>+
>>+	/* on error, reverse what was allocated */
>>+	if (err)
>>+		psmi_cleanup(xe);
>>+
>>+	return err;
>>+}
>>+
>>+/*
>>+ * Returns an address for the capture tool to use to find start of capture
>>+ * buffer. Capture tool requires the capability to have a buffer allocated per
>>+ * each tile (VRAM region), thus we return an address for each region.
>>+ */
>>+static int psmi_debugfs_capture_addr_show(struct seq_file *m, void *data)
>>+{
>>+	struct xe_device *xe = m->private;
>>+	unsigned long id, region_mask;
>>+	struct xe_bo *bo;
>>+	u64 val;
>>+
>>+	region_mask = xe->psmi.region_mask;
>>+	for_each_set_bit(id, &region_mask,
>>+			 ARRAY_SIZE(xe->psmi.capture_obj)) {
>>+		/* smem should never be set */
>>+		xe_assert(xe, id);
>>+
>>+		/* VRAM region */
>>+		bo = xe->psmi.capture_obj[id];
>>+		if (!bo)
>>+			continue;
>>+
>>+		/* pinned, so don't need bo_lock */
>>+		val = __xe_bo_addr(bo, 0, PAGE_SIZE);
>>+		seq_printf(m, "%ld: 0x%llx\n", id, val);
>>+	}
>>+
>>+	return 0;
>>+}
>>+
>>+/*
>>+ * Return capture buffer size, using the size from first allocated object that
>>+ * is found. This works because all objects must be of the same size.
>>+ */
>>+static int psmi_debugfs_capture_size_get(void *data, u64 *val)
>>+{
>>+	unsigned long id, region_mask;
>>+	struct xe_device *xe = data;
>>+	struct xe_bo *bo;
>>+
>>+	region_mask = xe->psmi.region_mask;
>>+	for_each_set_bit(id, &region_mask,
>>+			 ARRAY_SIZE(xe->psmi.capture_obj)) {
>>+		/* smem should never be set */
>>+		xe_assert(xe, id);
>>+
>>+		bo = xe->psmi.capture_obj[id];
>>+		if (bo) {
>>+			*val = xe_bo_size(bo);
>>+			return 0;
>>+		}
>>+	}
>>+
>>+	/* no capture objects are allocated */
>>+	*val = 0;
>>+
>>+	return 0;
>>+}
>>+
>>+/*
>>+ * Set size of PSMI capture buffer. This triggers the allocation of capture
>>+ * buffer in each memory region as specified with prior write to
>>+ * psmi_capture_region_mask.
>>+ */
>>+static int psmi_debugfs_capture_size_set(void *data, u64 val)
>>+{
>>+	struct xe_device *xe = data;
>>+
>>+	/* user must have specified at least one region */
>>+	if (!xe->psmi.region_mask)
>>+		return -EINVAL;
>>+
>>+	return psmi_resize_object(xe, val);
>>+}
>>+
>>+static int psmi_debugfs_capture_region_mask_get(void *data, u64 *val)
>>+{
>>+	struct xe_device *xe = data;
>>+
>>+	*val = xe->psmi.region_mask;
>>+
>>+	return 0;
>>+}
>>+
>>+/*
>>+ * Select VRAM regions for multi-tile devices, only allowed when buffer is not
>>+ * currently allocated.
>>+ */
>>+static int psmi_debugfs_capture_region_mask_set(void *data, u64 region_mask)
>>+{
>>+	struct xe_device *xe = data;
>>+	u64 size = 0;
>>+
>>+	/* SMEM is not supported (see comments at top of file) */
>>+	if (region_mask & 0x1)
>>+		return -EOPNOTSUPP;
>>+
>>+	/* input bitmask should contain only valid TTM regions */
>>+	if (!region_mask || region_mask & ~xe->info.mem_region_mask)
>>+		return -EINVAL;
>>+
>>+	/* only allow setting mask if buffer is not yet allocated */
>>+	psmi_debugfs_capture_size_get(xe, &size);
>>+	if (size)
>>+		return -EBUSY;
>>+
>>+	xe->psmi.region_mask = region_mask;
>>+
>>+	return 0;
>>+}
>>+
>>+DEFINE_SHOW_ATTRIBUTE(psmi_debugfs_capture_addr);
>>+
>>+DEFINE_DEBUGFS_ATTRIBUTE(psmi_debugfs_capture_region_mask_fops,
>>+			 psmi_debugfs_capture_region_mask_get,
>>+			 psmi_debugfs_capture_region_mask_set,
>>+			 "0x%llx\n");
>>+
>>+DEFINE_DEBUGFS_ATTRIBUTE(psmi_debugfs_capture_size_fops,
>>+			 psmi_debugfs_capture_size_get,
>>+			 psmi_debugfs_capture_size_set,
>>+			 "%lld\n");
>>+
>>+void xe_psmi_debugfs_register(struct xe_device *xe)
>>+{
>>+	struct drm_minor *minor;
>>+
>>+	if (!psmi_enabled(xe))
>>+		return;
>>+
>>+	minor = xe->drm.primary;
>>+	if (!minor->debugfs_root)
>>+		return;
>>+
>>+	debugfs_create_file("psmi_capture_addr",
>>+			    0400, minor->debugfs_root, xe,
>>+			    &psmi_debugfs_capture_addr_fops);
>>+
>>+	debugfs_create_file("psmi_capture_region_mask",
>>+			    0600, minor->debugfs_root, xe,
>>+			    &psmi_debugfs_capture_region_mask_fops);
>>+
>>+	debugfs_create_file("psmi_capture_size",
>>+			    0600, minor->debugfs_root, xe,
>>+			    &psmi_debugfs_capture_size_fops);
>>+}
>>+
>>+static void psmi_fini(void *arg)
>>+{
>>+	psmi_cleanup(arg);
>>+}
>>+
>>+int xe_psmi_init(struct xe_device *xe)
>>+{
>>+	if (!psmi_enabled(xe))
>>+		return 0;
>>+
>>+	return devm_add_action(xe->drm.dev, psmi_fini, xe);
>>+}
>>diff --git a/drivers/gpu/drm/xe/xe_psmi.h b/drivers/gpu/drm/xe/xe_psmi.h
>>new file mode 100644
>>index 0000000000000..b1dfba80d893d
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/xe_psmi.h
>>@@ -0,0 +1,14 @@
>>+/* SPDX-License-Identifier: MIT */
>>+/*
>>+ * Copyright © 2025 Intel Corporation
>>+ */
>>+
>>+#ifndef _XE_PSMI_H_
>>+#define _XE_PSMI_H_
>>+
>>+struct xe_device;
>>+
>>+int xe_psmi_init(struct xe_device *xe);
>>+void xe_psmi_debugfs_register(struct xe_device *xe);
>>+
>>+#endif
>>
>
