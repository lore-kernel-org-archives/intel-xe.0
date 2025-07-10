Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E401EC83F20
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 22:36:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A897910E987;
	Thu, 10 Jul 2025 22:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FE5DLq4V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4976210E987
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 22:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752186959; x=1783722959;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VnRzCSijm4IPJN32jpOcZ2n7YtgOKJUigGPEL+EsJL4=;
 b=FE5DLq4V9BZb8nAF0LMNnVJeY3UOUNcMcdkXCOAtSUtfqhx0siiqxaFJ
 71Ob/+JpzTNENJ84NTCZkXTS/8F1Sn3e47EWFJUqnivpdb4fLK2iaITcN
 h53OjcWvVFaDiOtjMNZPYJYZo8DuKz5oVbj3VJG+zSCinqbE2ko5H7f9b
 psY+nVDXGHtqtEth3WTGbaT4dUDtnFiE944GaEyudBIv4b1K/bCkkuPfH
 jKI8o+84hqxzUJ+PjRkALN7hT1vaant+H4EWrNMqEU5eNzlxfcMmti24U
 JoMXc+e/Zq01JYnk0Lo5SYugtqCfLqU0vjColyNUCpxnss1fXQQ1J++Yj Q==;
X-CSE-ConnectionGUID: +QxWchG3RoGuFj8cjy7iEA==
X-CSE-MsgGUID: +YxHjB5uTL+BB8iOJgxmpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="53590450"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="53590450"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 15:35:59 -0700
X-CSE-ConnectionGUID: iQHZI5QsRMqff0r+4IsAjg==
X-CSE-MsgGUID: DiwnX0kbSG2/aoT2YnNo9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156338997"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 15:35:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 15:35:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 15:35:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.55)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 15:35:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qCf9MB9Hp3Fo0MEkRoaknKzMgUl0+CgVhJk+CrmCeE9EHVJzFsVJm4qNsv2wA3MRgkN5cLe2E/0AaAaE6grHPj2QEJxL66D4tfiObd6xDBjkcS5D8pPeAjMTurBLmPkOIZGjdmVKaw1GbVYMpCp3zTzJj9cDPs4E0/2I35hIfqhL/Ou55cXkNPQuwRd5M21GZmnMczHvQjtXxqtYN7jx4q4n9+D8uzyQnE08TBuD4oXn5BV9FrcqVCUCVQ583VKNDIbDrVp98J9qZ0ofXsjXkoM8ur/jnuB5NvcStiMinZ8/a4jR67kpNlo2EubbE+4ALXOhz/xvHKGhDpF6Nyifcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NA+TdfcHs/Bk/tDK/dzhlcNGlcdWEL3HtZdv4sqZQVM=;
 b=XksQqBRZcvgQFMEtzWbMjg91q2ulGcpBAL6V4lkdddsJsIPa6ok1OrJ3iCAAe4HIQn00FNOZbGaVPxkHUz7Go5ob7dqQJdxPQq8pOrOL9IulCf6SQeuUPku9wxYWSlI8pUMOszStiTA7cMw9MPIJiIyirVhzUS5EYWdNBrgFpS+W8thk9LIxr7gG4SiyXY9XhGMZ6Jxnwayr05i54/Y3gZPCsk0IC8EsdnJNfQjGvWvLPQrusgvUkejtZUYTZJb9kNFIZZlwab2uEamuweidLXB5Y8LtGeUFrWR/AA4XSab1Y+YPHdG/Om6dkuoBdgi1WuyeL4r4j0OQx6DOwMZ0KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7080.namprd11.prod.outlook.com (2603:10b6:303:21a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Thu, 10 Jul
 2025 22:35:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 22:35:11 +0000
Date: Thu, 10 Jul 2025 15:36:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe/migrate: Fix alignment check
Message-ID: <aHBAh6HHWCRHXLei@lstrano-desk.jf.intel.com>
References: <20250710-migrate-aligned-v1-1-44003ef3c078@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250710-migrate-aligned-v1-1-44003ef3c078@intel.com>
X-ClientProxiedBy: MW4PR04CA0184.namprd04.prod.outlook.com
 (2603:10b6:303:86::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7080:EE_
X-MS-Office365-Filtering-Correlation-Id: 14151a80-79c3-4ec7-5eeb-08ddc0020810
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c7tr4X6ddE8TAkGH0Tuf2A32FIIMULhFQK5l8YW5LkiAbnz5AabBHsPIYAX6?=
 =?us-ascii?Q?yNAsmjBouZpMVb/X+Z5ldZ+g8ukQq9UueFx8/ek5Hjs5kNuIh8URfPit6tt7?=
 =?us-ascii?Q?vqcTRwrGTTWcH14GbqLYPpJ/IF/7XxIU30cekmk+bRY3Ra/A3xkfISD/RkNX?=
 =?us-ascii?Q?DgbOuvAdyE3llcp41ZOPRU/Lq5MdDw0kKYEi0qQe4OMLfaCEcgknBA0QBEw9?=
 =?us-ascii?Q?VmTulJgLi+va99N2oUWx9g5q1lnfUvyjwPULxenCK0DHowvLcBlswzdPPZef?=
 =?us-ascii?Q?sSAGYtkPegR6Rb6Uv4m6W+zOxwpF/0gSk/+klYg5Gt32JiarhyXbkTtTlXGv?=
 =?us-ascii?Q?8MvklTu36UJuZmir8zlGXSeQLE+xZJLZR4BaoQAPz8H+TOT71kKxSe3Z5txY?=
 =?us-ascii?Q?zzD8YKbnlDA8lEZkVBLBcHoJxvrl1sWFEVHgvtdNsojVGnDI4M+dzZTFvVMN?=
 =?us-ascii?Q?TKGqHaY2x9Of74tRjoYsPzhyvloRNXdfXEUpbwfr+Q6qdxHEUS5c9H6VVVFa?=
 =?us-ascii?Q?axlg/wN9NydQrMNfLYxlw82QtDKa6V0qK0MbKl6npfrxHTnRpgUppOyTVRg0?=
 =?us-ascii?Q?uJAqBxXpnEyN5SRCUeeu8AJeEBRn+SWZzD14jfOTVlnhyZjxS1JXxyxFPpux?=
 =?us-ascii?Q?jv4phMZF75BqLSxbiSGdAJI7e1PePssmes06qfbWkCLqj1OFS4IwaTREjg2+?=
 =?us-ascii?Q?ZFLpOiaJB8D8SizXGn2cdXo+iumM8LXldthCSunS9Xc58s6F0ttVVsw7V5h3?=
 =?us-ascii?Q?rf7Qdda3nEPYZ2qn3b0z4Gx7kUw/fZsqhmnyhIDo5tB+ArpXDnvJTsZzM5td?=
 =?us-ascii?Q?lz5hB/LiyovHy0YMt8H8o3L81BetgkxLePo9pxgaprwvqtMHAkJSufS2iSzS?=
 =?us-ascii?Q?5x0i7xq1x54vGTYCCQvjO1a06PU0O30sDysMlzEUTowrMApa5wOvfYpqZnoZ?=
 =?us-ascii?Q?LeSps9onb+i3bOzJsN4gzLvpr8Rntyfy3+jbv/rLzAoV4K0MBnhibypsXgw5?=
 =?us-ascii?Q?ivQOkeMM1jCojnov8ZGl9z2xERRTgbKKRVNyMZlllRVXESJ5SUzTMaLtno8p?=
 =?us-ascii?Q?np0ky8rk+M9m0xBO4nbNJejBaKeWdcf8iIa0d+0L5KPgEfdVYUDHucr3mTop?=
 =?us-ascii?Q?AZisx6kfNDQH8Oy8SOmMcByq1VyhxH11kggRccolSb2ohvj0FuC61Xb4/yCb?=
 =?us-ascii?Q?7xTezNWnkaLQNB1BpvJ1b4K8fW/w8FLHvX8XBBcMB55QKCOitRYQxixZtb5L?=
 =?us-ascii?Q?jAeGWb/+kK7zKy82YBbQDc0crjqPkiwBXhyF1px49phfCo36Aukp4Ae7Uyid?=
 =?us-ascii?Q?WpmtWt2gcaP9XCCb/aDumLJQZVdEPLMO8nI2uK9IvsPDVDeOAZuaqSwNJqDr?=
 =?us-ascii?Q?qjbIJxX2Da2XVSQJeqRDZQyU+3wVYGtC+cJj8H+PsvhcxuwJtw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nmiHr7rzOF3d1XAdLoUijE6O55DZG8OxNR4KJuVsGISvrcjdPqagYYbgYvqd?=
 =?us-ascii?Q?lhYabNycZpi/fOwpQNjRdkBjrxT48RFVMTQ1Fay8cwa2aFhOxHaGKF6/vk0T?=
 =?us-ascii?Q?7qdd+tJv513fJhoAGpasnjnPLkNk7VB8IAWiN34Z4L0n7pqvPoAvnBrmHd4+?=
 =?us-ascii?Q?T8v2J93p0d/omTlNN3eNRUoWyaG/Aqga+rnUSwECed4ZDpM6TRE/tF+VqLSg?=
 =?us-ascii?Q?liVcitcT1E91tSL6PwyQybGH05EGW4/S2G3imRqwxkAdDBzEaGKdUyVaCQVM?=
 =?us-ascii?Q?cnDQqqXa/Cc/X20axsN367Gl/1HPxWGxuAQrsQkUH5E6ATtZCJuwhGD8mdIX?=
 =?us-ascii?Q?TwXMpeBpLPQzskDT3c9fXGJUbZw09de3/3yEGmazeDtJcfW3HIRClb4Moa4f?=
 =?us-ascii?Q?KxiDXBrQprqeAtv6EMvFTOnlSneGSNCONMIA4MVu4dRBEvarO1Ko7TRZFUol?=
 =?us-ascii?Q?dkIK9cum4hM3MXFsMCYUNbtm3wzd+nQkOUyDW5vi8cPdlDWnayNsMkLE41Eu?=
 =?us-ascii?Q?uLjjIoulvT5Kxc46Y3Ze2jeXVu0xLrWRKmCMlGk4LyoH2G4k7RAJFwYAt1uD?=
 =?us-ascii?Q?LVfSCQbT9csbS5mUeWpcN7RDfpAit2WMYb98Sfx/vmp1m4dpDXoo5pza41TJ?=
 =?us-ascii?Q?OWqOHF/p27Qlpb2IKKCshrlgDoU5HqwQS5yG+6H25ZKHAmSJBtBLbbjmEtA0?=
 =?us-ascii?Q?vLGvB4wob8Hx5h0cIHo8i7oNVxNZNKED10gQyxVG9VwsfNGxeSJhM/o0qQQX?=
 =?us-ascii?Q?vqufwZYflPBWCYjgacu1nnPE7ks1IaTWQkjld460IzedzAhGXvAd8HERrNs/?=
 =?us-ascii?Q?+Prytmtux2tHWzah/SSV1b0amoThQAp/9K791lkeqfyLV7tTE5oZ882RAX4g?=
 =?us-ascii?Q?tM9rl38dXl/W7atBKegMNvdx/yDLaFyYj9i44zwAYoCRGQEtJ6twYn9fG7NO?=
 =?us-ascii?Q?qg5EhIBrL1/SemU1KBI70GDAxr34X1ZwEL1c+4a2Zr8EzTrI4PMOiFOwpg0a?=
 =?us-ascii?Q?px3HOtoOQa+8fS3nhWhhSjCa0S9OQ8/RkrkUPqdKAzfyAYjee9q7E5au2MEf?=
 =?us-ascii?Q?NcF4FiU1MTv5/G5CgGu4aQPu26M1jTC8qErC3MTrNDYkWPlmqoubbh3GUDaZ?=
 =?us-ascii?Q?mLvL36jVi2SCLn5NaiVGMMBKXhTDU2wswYH/WDqoe9Vy9Y/bAJhPGaoZ5ALo?=
 =?us-ascii?Q?AwiJSXGIQ8IIkJf/4bYTougZ/ntYCpAY0/5HgCk6Q2bFslqG8Yw/wxOfAGC0?=
 =?us-ascii?Q?DLsRiO4FvQCUoxAu8SMYcF0ztkKTcIij4dElWcyZnYMLHze6MO2x5kiwjKBb?=
 =?us-ascii?Q?3Xn+ioHiyQmsJrsFgIeihKDhxFmztb4nPuh8nheJEvhOf4MuWtzzeMmo7pos?=
 =?us-ascii?Q?SZ+6PhZ7JAuttQwDyep100axHihg73eCU8Fu9gcLu8/WnIoatyXegWXtem0r?=
 =?us-ascii?Q?7TH+WAUUv6gYKlYDrBd1IugHvmPOehnqfysF+HTVWysZ3HEBF8it8/f2O/JG?=
 =?us-ascii?Q?1BI9odjmV1WiJULCRmwLZB7H9GuxUz12t+dMM+kqixDU5krmGMaGMZnNsniK?=
 =?us-ascii?Q?2kPPgDNEqdMwuysUwaw3XosJijKkDtLTmDW0fdp26yCnaSex70nw/nnOZ1vt?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14151a80-79c3-4ec7-5eeb-08ddc0020810
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 22:35:11.7077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 57qxnxe6/Y+2gpIkxUzKuLE+EbSTivXx3c/Fux+qaMfBKd0G7HdidsU0cqEQlxNLyBL1IZ4OPa4/JeufmX//oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7080
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

On Thu, Jul 10, 2025 at 02:34:41PM -0700, Lucas De Marchi wrote:
> The check would fail if the address is unaligned, but not when
> accounting the offset. Instead of `buf | offset` it should have
> been `buf + offset`. To make it more readable and also drop the
> uintptr_t, just use the IS_ALIGNED() macro.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Probably a fixes tag even though this data path is not used at the moment?

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 4e2bdf70eb70b..18b53a4e267d3 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1817,8 +1817,8 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  	xe_bo_assert_held(bo);
>  
>  	/* Use bounce buffer for small access and unaligned access */
> -	if (len & XE_CACHELINE_MASK ||
> -	    ((uintptr_t)buf | offset) & XE_CACHELINE_MASK) {
> +        if (!IS_ALIGNED(len, XE_CACHELINE_BYTES) ||
> +            !IS_ALIGNED((unsigned long)buf + offset, XE_CACHELINE_BYTES)) {
>  		int buf_offset = 0;
>  
>  		/*
> 
> 
> 
