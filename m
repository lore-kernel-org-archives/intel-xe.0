Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCF1D1A427
	for <intel-xe@archiver.kernel.org>; Sat, 12 Oct 2024 02:23:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E108410E18C;
	Sat, 12 Oct 2024 02:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2sBSYv/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BAC110E18C
 for <intel-xe@lists.freedesktop.org>; Sat, 12 Oct 2024 02:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728699819; x=1760235819;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7Ix7vdXxRjEwbntt+InD52Z925KG+c/USfErXyiDVpo=;
 b=M2sBSYv/zXAS+76Pr6/pDmDGasPZ6M/NxUwweP6aYJBOHL3x91bxrOQv
 dUB0FSEWitokcn4fgXLidCAn7l0xQCi1hLUEIPAox6TXoujS7lZHB+4AY
 URprZaXvfWQU1IRYi0/a89VVZfvKGVffxqM4fjGtSIPcw4RfdNzNgPSns
 KJ3WYpFLzpIA2y4GlJKslNUAjHctU6V4AktbqCyI0y2/Xt8nFdooPzlS+
 coinFKwtw4wIJrFw+tgRSSWUDuurWg8KMHMRDynwFyPR+EzOzTyesgwXe
 ktm2s//ngmO91Fi+AHvsPs9XTE1EGt1x9Z6QHKpBhYA7mcYRSDGTAwvwu g==;
X-CSE-ConnectionGUID: jA8RZacPRzyZMSEseoeX4Q==
X-CSE-MsgGUID: Z4xq7wcmQQCzkXsEcDAQog==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28206671"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="28206671"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 19:23:39 -0700
X-CSE-ConnectionGUID: qpAyi7ewR/SxRWOuEVTS9Q==
X-CSE-MsgGUID: Qm7ZCC5qQQyGGKrfKe1Gzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="77896054"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2024 19:23:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 19:23:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 19:23:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Oct 2024 19:23:38 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 11 Oct 2024 19:23:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUTWUXabd/dxeFLaMY08vCdDNSBXJI+kJYNc0dYALZT5DFEJI2k5Igz6CTfV/C6IOj6ecdAHRzEf8k0ZAXiQ5xo8byoX8Xf7YyJkmQHZUrZTYGFC2qk0AXsw9tK/2z4tY2RM1ChjToYy+Vo/O0stL73Ibub1qnYIwla3O47LDz/LyF9JfwLS2Ndi+APHKFK+MwRduYuOVVwN+0QYmzi/3pUbWWNgY6q/aeyrVTmHGh2/uye/IdUswAEOmM0KHfKB6IC0r+KuVAu5K4sggMdQQwZTlN8MHgMj31noxSE0iwFvcVC7M0hgId2hcOV1WnYh6O+7qAWPNjRu+Jw/88b9Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODRDsdfCJ+3AY1ggljxgvVxO4KMcC6SYjJXuSjIx15A=;
 b=Uob2bB6phnN5zaCwjsbfIEdqH3dCHg689f2LntiSUsLDSQYPb5rTA1PwMkSVoueRRUXHJGGqzQ9BRvANWu8+rFFatNFNswnS3A38nJtV3Fgdr9rmposdBkguBLnHWq1A8Fq7bIRJCoqMe+d7BkWIaJGVXjV6RA38pwnIB1DzlabGJiBv0Sa9bmVGp++Rni5+QEHXjBCfdBDDCmRQX+2UoQHggM7j+9RiodRBmLzWYmO+IeZwakHiiqTU2xBTRx1ZAVuQBqAM+2uzAPNzQKP6hKtdTvyoJnkpNP0Hxri+n56B2qlno9dprHcXiDMAG2FRw5Y6BMtxkFCedKT2ye9aOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7168.namprd11.prod.outlook.com (2603:10b6:510:1e9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.21; Sat, 12 Oct
 2024 02:23:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8048.017; Sat, 12 Oct 2024
 02:23:34 +0000
Date: Sat, 12 Oct 2024 02:23:10 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Mika Kuoppala
 <mika.kuoppala@linux.intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v3] drm/xe: add system memory page iterator support to
 xe_res_cursor
Message-ID: <Zwndjh6knRv2Bs0P@DUT025-TGLU.fm.intel.com>
References: <20241011-xe_res_cursor_add_page_iterator-v3-1-0f8b8d3ab021@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241011-xe_res_cursor_add_page_iterator-v3-1-0f8b8d3ab021@intel.com>
X-ClientProxiedBy: BY3PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:217::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7168:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b7b9647-8f40-4c25-8301-08dcea64df7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y8k8JBpQ6PELnH6sWVPDyvlLDO3eKOh/V41c08IpAthqOGkUYuXMorWwW9ka?=
 =?us-ascii?Q?3gU5U9wKf5pddgq5+5WNtAvEQN29ef2x7owOlhtFOJRgk/M4YYVVCK7LvUMQ?=
 =?us-ascii?Q?J7m0ptpIwsZI0zXc7MDKow91kbCW6ghCYr27c1e0fUV/AdvIsdL3tb2XB8tj?=
 =?us-ascii?Q?knYBauP52BCnTWgqTMKUy2Hiv0WB9HVVt1pwSDhOY/YxrEzyVaXPK/CasSj5?=
 =?us-ascii?Q?WhW+qN4kjcCa/M55IUkl63l9q6zjjdogSzti8sBBIWrR40K7PtIBcgDfWz4B?=
 =?us-ascii?Q?C5rwjtVzlYgLuRm3mXvEinvM9IFK4R2oI5eC5Dk9wDdkV0SlVnzIuRk5tRRu?=
 =?us-ascii?Q?00hFN9sYVjnjmn8+eilVEbTojcbn51xgBhYQVNHjwf+hchzkS1W6z/ShPUl2?=
 =?us-ascii?Q?DconHpo7DXK/MhsSGMLFruIPJ258Dl+gpnwJno7k4OdCDBtSxOfR+nFOvZDY?=
 =?us-ascii?Q?oY14BvHPfgpm6gn7o/EswC7JXouR88uVxNJ3TvSFscTOtrPjHWi3aMMI88VS?=
 =?us-ascii?Q?8x7uMuI9KN+7PmXI9PBtxCvAv8kgCq0fTkdPAsBQCXaZi0Pn8b98H0AFZkLn?=
 =?us-ascii?Q?0woXDcsCcM46qF9vIpFMP6TQ1kuWusm0vbPxeUOAaiBfsspGhEY79/SsfdUz?=
 =?us-ascii?Q?EF46gzt/7ITdYBg9nyB3S5RCjkWepm66zxYK9TPKKhAmqqbAkfYkrrDr+mdF?=
 =?us-ascii?Q?MldmlQtFOnNPTcyNlUGY8MZlLS+OJm0XqFvWgZSbphnwr+k14u+6tlMQCeA9?=
 =?us-ascii?Q?SV4fbPIqMh9ohx6+Klt2Ut8b0HPVXwp31MV3m6/V9BkrdvOodkAWieR3UGUn?=
 =?us-ascii?Q?tGojBCPsuM/bsdJB/ZaXpRLvu5GVQlil7h/4oEa3tOFngFusEpzSqEjIzXkQ?=
 =?us-ascii?Q?JWEvpL2J1eLMVX/I2LA0WtgKFrdKLuhQ2chGOV5ft5i6ZSUw6dtRcKNXVGT7?=
 =?us-ascii?Q?jyr4Jks09ksnSsr9B3yn/1rz6E697FeVP3Aa1CAAxKaIf321RWiWnCpXmQYz?=
 =?us-ascii?Q?uV5XMwtQ5TnoEn1JkBLo/sHP/m192Vj0Vgl8ohCknoaOoVp0p8r6hD8ysEjR?=
 =?us-ascii?Q?/ezpnBnOPFqUyf3ZTaR8bKcRX+MEiZb4RCyV0zQbtttydgyGt1gCoBrCwph4?=
 =?us-ascii?Q?4svQ8W7z30lMfqueLL9VRoo1dFrdfBZuIg8nL2Dnbo/GEvkIeCxvpptgE1uO?=
 =?us-ascii?Q?bqeQXZ5lKCNKHu42Sdofe/XxhBcrdQSyMY+VjwplX55LdoOS6fCOJsPJ0G8?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RDJ0sW+8MY82OGEPkC/JrDurJeNqUvh+LltyC86D2I4SNvMjfkJPGiVpUH91?=
 =?us-ascii?Q?rvizxQ4/2KB09UrbWgoDiK9NG9irePQB9m1X3o2jqnVUKc5m6GB/fD/NbLFt?=
 =?us-ascii?Q?5eCzFFaThSbuoGLptR55O08z5HvXEg2tF3aEtIlBW+NGdJkGTMHAzcWIEpMy?=
 =?us-ascii?Q?qofdA5zaGhofdtlVBSIUdu0Eji7DZv7ypM8nH+K/nMSXh7mjN1DpoH+1jvtV?=
 =?us-ascii?Q?1gVYnENBvrL2ZIIf23m9hY1LIIAKtuG+oJDP4pjNdnJ9Ho/nc/RO6dxzewti?=
 =?us-ascii?Q?M26k/4jma4pIvGy3fLLlA9WC8YVj7yqpd6pK3E1PmTHyXDH5yuCf2AJAxm6y?=
 =?us-ascii?Q?rIe1mQt2z2rwaLFCBlI/ymnNoYOpUekp5A9kUKRb4FfCX5IuaYMhlhPhPd4e?=
 =?us-ascii?Q?cKDzz4vBkSbkn4m8IK/w4LOFqpuX+tH1BDLMBGqgZqedr9VdEndDplTA7zF3?=
 =?us-ascii?Q?AAuyx3QPCMZ6FqeRKgr5UuxxJO/WfiiNfX3vMO2pcHCBQ8PvDR+uWf0jr92e?=
 =?us-ascii?Q?CfDHSq92ViJsB6x0tzuuK/52mDGRXvkdnrG7d83DmYyFTv+7EWeBVghn9XsW?=
 =?us-ascii?Q?K18dKub3ogE2LyqJu6oFqEbCf14DT7Ab8CJulA/GaF0AtJQi057B8yslPF4V?=
 =?us-ascii?Q?vAHkxFvzSq+WN5hRL7MIag//F418K2u2htV8M5oBBBOtwLIgdkn0bw2n7sGR?=
 =?us-ascii?Q?aeZ1QYx+XAxYNxjAPxe+1Z+ChhmQpFq/Pw6XxQwv0JxDHzKHcbTieZBsxrKf?=
 =?us-ascii?Q?shZWcQrYMtwFhB3yOBqLHSHZ6mAYUWoUFLSNxB2HRLfENisBTUf6d8Fax8vs?=
 =?us-ascii?Q?E17Cih/9YkowXDhMSmNrBg9/a1sGn5bEKhrbNtiCdPM9GwcZaQq8ToJ7ch2I?=
 =?us-ascii?Q?r2tUSGIQnu91Scidw+jukghPUuR37FpaJvPtYxhlYmX36Sp7JmtQ6V2cZB9A?=
 =?us-ascii?Q?5jlcAAnFNiD39QU/3YZrmpCNgX9uS39N4nucLJrgKq08hx6epWuZC/+/CyTS?=
 =?us-ascii?Q?gHMOI21EJHjCXPulCjse9N8Q+BMEH3eWhnIicYr9FffIWNBlxViqK61cVG8U?=
 =?us-ascii?Q?0nRtKt09XkY/PEK9czukvwFDc6nXOGDQmrLk7FUJU7XkXHELfW0q2unjFEMk?=
 =?us-ascii?Q?mOaHjiUy1CLR8IXK5YcZ6AAG5F3RJ+mH3fPK6HVoeI8h27/qG0jeF4IS2+zo?=
 =?us-ascii?Q?eFAG0UKiw9SON5WbRUhCGROGnP6eenstl8OMKZxFWikaluQniYfeMoqMojAm?=
 =?us-ascii?Q?42JizOoxSMYtN45cPMsvGhxH4fNjspsjq1K5CGOYDUv37Ha5C0uOqfhjZb+G?=
 =?us-ascii?Q?zNDlzKk/AjJnQ7LRHGBKDGaNcWYrjgUK+P9NkS+oKXaRTZNVa0FG1bZaSbZG?=
 =?us-ascii?Q?l4pJ8+OW2vUTD2z7ySV3FGA+JeYJhyMrWaUtdGbYwfI4GQFMZ/818f2szUJv?=
 =?us-ascii?Q?DlVWrk5lTca3BuUtcvP0XNJ1/A28svPpIBjrIOeXErSbQfBZ7dQne/1NcdGj?=
 =?us-ascii?Q?/71ElaWnVBYwAuDCtNNHY48AyBCgvWfbiT5kqGzUAPeNK5AuQhebMLgAX/Bq?=
 =?us-ascii?Q?QvU6uTKqDoHOFBLBvwmhp5BQY58FzbOzaJtPYzCtHm5wBXda9Cx+kwFqdmOW?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7b9647-8f40-4c25-8301-08dcea64df7e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 02:23:34.8183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WSsSel59+lY54fK8rBrmP4v8mFms/WuWPn1cBvf6xRmFqJqkWXPphFIqZIV+HXV7QT9WY30TBHsBaAvyG4NknA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7168
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

On Fri, Oct 11, 2024 at 09:26:30AM +0200, Andrzej Hajda wrote:
> Currently xe_res_cursor allows iteration only over DMA side of sg tables.
> Adding possibility to iterate over pages allows the use of cursor in more
> contexts.
> 
> v2: fixed wording in commit message (Jonathan)
> v3: indentation and author fixes (checkpatch)
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
> - Link to v1: https://lore.kernel.org/r/20241009-xe_res_cursor_add_page_iterator-v1-1-c883446e5770@intel.com
> - Link to v2: https://lore.kernel.org/r/20241011-xe_res_cursor_add_page_iterator-v2-1-367b74c1cc29@intel.com
> ---
> Hi all,
> 
> This patch is required to proper implementation of userptr_vma access
> in configurations with iommu turned on[1]. Required by upcoming eudebug
> feature.
> 
> [1]: https://lore.kernel.org/intel-xe/20241001144306.1991001-13-mika.kuoppala@linux.intel.com/
>

I'm failing to see why this patch is required for [1].

I don't see this patch included in [2].

Both justifications here are pretty vague - 'use of cursor in more
contexts' or 'Required by upcoming eudebug feature'. Not understanding
the why. Can you please elborate?

[2] https://patchwork.freedesktop.org/series/136572/

> Regards
> Andrzej
> ---
>  drivers/gpu/drm/xe/xe_res_cursor.h | 51 +++++++++++++++++++++++++++++---------
>  1 file changed, 39 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
> index dca374b6521c..610407f23dbd 100644
> --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> @@ -129,18 +129,35 @@ static inline void __xe_res_sg_next(struct xe_res_cursor *cur)
>  {
>  	struct scatterlist *sgl = cur->sgl;
>  	u64 start = cur->start;
> +	unsigned int len;
>  
> -	while (start >= sg_dma_len(sgl)) {
> -		start -= sg_dma_len(sgl);
> +	while (true) {
> +		len = (cur->mem_type == XE_PL_SYSTEM) ? sgl->length : sg_dma_len(sgl);

This doesn't look right. sg_dma_len should always be sufficient unless
I'm missing something. Can you explain why if 'cur->mem_type ==
XE_PL_SYSTEM' you need to directly look at sgl->length rather than using
sg_dma_len(sgl) helper?

> +		if (start < len)
> +			break;
> +		start -= len;
>  		sgl = sg_next(sgl);
>  		XE_WARN_ON(!sgl);
>  	}
> -
>  	cur->start = start;
> -	cur->size = sg_dma_len(sgl) - start;
> +	cur->size = len - start;
>  	cur->sgl = sgl;
>  }
>  
> +static inline void __xe_res_first_sg(const struct sg_table *sg,
> +				     u64 start, u64 size,
> +				     struct xe_res_cursor *cur, u32 mem_type)
> +{
> +	XE_WARN_ON(!sg);
> +	cur->node = NULL;
> +	cur->start = start;
> +	cur->remaining = size;
> +	cur->size = 0;
> +	cur->sgl = sg->sgl;
> +	cur->mem_type = mem_type;
> +	__xe_res_sg_next(cur);
> +}
> +
>  /**
>   * xe_res_first_sg - initialize a xe_res_cursor with a scatter gather table
>   *
> @@ -155,14 +172,24 @@ static inline void xe_res_first_sg(const struct sg_table *sg,
>  				   u64 start, u64 size,
>  				   struct xe_res_cursor *cur)
>  {
> -	XE_WARN_ON(!sg);
> -	cur->node = NULL;
> -	cur->start = start;
> -	cur->remaining = size;
> -	cur->size = 0;
> -	cur->sgl = sg->sgl;
> -	cur->mem_type = XE_PL_TT;
> -	__xe_res_sg_next(cur);
> +	__xe_res_first_sg(sg, start, size, cur, XE_PL_TT);
> +}
> +
> +/**
> + * xe_res_first_sg_system - initialize a xe_res_cursor for iterate system memory pages
> + *
> + * @sg: scatter gather table to walk
> + * @start: Start of the range
> + * @size: Size of the range
> + * @cur: cursor object to initialize
> + *
> + * Start walking over the range of allocations between @start and @size
> + */
> +static inline void xe_res_first_sg_system(const struct sg_table *sg,
> +					  u64 start, u64 size,
> +					  struct xe_res_cursor *cur)
> +{
> +	__xe_res_first_sg(sg, start, size, cur, XE_PL_SYSTEM);

Not seeing where this function is used in [2].

Matt

>  }
>  
>  /**
> 
> ---
> base-commit: f1561e6c62b5b5c3fe0276f2fbe7325e0d7c262d
> change-id: 20241009-xe_res_cursor_add_page_iterator-d29d73c3eb99
> 
> Best regards,
> -- 
> Andrzej Hajda <andrzej.hajda@intel.com>
> 
