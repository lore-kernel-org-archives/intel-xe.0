Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507A0C3ABAA
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 16:54:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD3410E92C;
	Fri,  2 May 2025 16:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jqwM+a6y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB20610E92C
 for <intel-xe@lists.freedesktop.org>; Fri,  2 May 2025 16:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746204870; x=1777740870;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JrZld757VXulQEnRjfhJ1TtWhY2izC/E6H6ZHM4O3dw=;
 b=jqwM+a6yRqif54XTCmLkEU5n/f4KUMVSihwF8awRDCmeXhXsvNc4v0zX
 p4eL3TKSfIzkJxEajUrCVNxbSfls+SC44DNQ7mQwnH2/N2MC0BPGqylvi
 i8IjhvvRc5AhRMrXKJaY2p8LflnjJnKzPjQvF884t2t34hVG7YcCs+pV9
 vrs648nJulLX/IIoOU0eX7zUpbTXeOWYvfpHEiQwn4aabI6VrS9qbR55F
 Zv0ckA3JO2tD7YTfjqJZHZrwcg8GStcaNzSZf01bG4AaPQK47AiO6RMdr
 MK2luMD24vJFAZYlSC64ozfj6d3DJQ6ewGKb0S/TDiWoetJMkkXC/i8Vr A==;
X-CSE-ConnectionGUID: UnbW9BdUTV6ZJCBsTeHZFg==
X-CSE-MsgGUID: 26ePrHJ2Rsy3mXkyWRrEcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="73285727"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; d="scan'208";a="73285727"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 09:54:29 -0700
X-CSE-ConnectionGUID: /G3RfUBcS6+//f35PFrKIg==
X-CSE-MsgGUID: rkBpHRa5QDuPheBhgFNqew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; d="scan'208";a="134580774"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 09:54:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 2 May 2025 09:54:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 2 May 2025 09:54:29 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 2 May 2025 09:54:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RaAt4ibbY4bsDoMhJ3uUnqsf7QEV8Cdkpc48QnR0XAjERlJsjx/crsbK1TIE+S6cZ3KZVKY2quOiZOVcdqz8eddKmqZYT7vcZXnmcI44yLS0IOaVhK6qFpNEa/wm9UlzN/WTRjlwVqUP/lPe9WrznH8qQREotI/f66Y9qvjEjlij8OQ3hJK4TjzpRsUzDsw7MZCZlyLHN5YU8SMIbnKDth80BrZ8+CmX0XuROJGaYOclNPFRsuZR/FhajM1usEcvq611wl4YWMjWdXaKzVRT/ViNXuI2dCbtP5NjFePnDY9iflm+CY2fYQRMuAGgwPoT/Ex5smFrtxW9bx5MnfFWnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLs9YK6atIX1yXWOBF5TdwPzTUDkXBTgXqZSIlJ1dAI=;
 b=uLjWlAhs3s8pYlRayBZ/w6QqbgssCKcqosPIKqupZP0Y1Gk24mB5QGgNfXCNv2tMBJ2C5gFtpmCleW+51jYK+576zAOtDrgXlJQtxKgo5ufWx3SX7a3HRsh+EIr/3WV8VtrNzU85YFhL4IcFnpcHDc7F9S5a0ZBnr/aUNq3R7TO/16XMIf7mmT751Rho2ff7UomjNJzBSdBgYlJ3RawZDREzgNLlN5RsUYmZMDP7cB3Cz/k3xbkMyd/GwgeWBmNQAacn3U9myJqophiyeTpi/FRThpgcjhlthagMhvTpOPC5828IbGi82PxKo4AQnXj/RrPdM3QvNkCo5/vuhtHgAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4926.namprd11.prod.outlook.com (2603:10b6:a03:2d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Fri, 2 May
 2025 16:54:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Fri, 2 May 2025
 16:54:27 +0000
Date: Fri, 2 May 2025 09:55:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/4] drm/xe: Silence migrate debug message.
Message-ID: <aBT5FtAdLTAJ1WBA@lstrano-desk.jf.intel.com>
References: <20250502093514.510621-1-dev@lankhorst.se>
 <20250502093514.510621-3-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250502093514.510621-3-dev@lankhorst.se>
X-ClientProxiedBy: SJ2PR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:a03:505::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4926:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d4cb6bf-e3b6-4d9a-4169-08dd8999ff96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RuuNzsqofB9cNMGXBFYL6zIyQd0C03suEYW0D9188hHMgng2sJ7m9I9KeU1j?=
 =?us-ascii?Q?fiWtf47lzKUO+WQU5qxGJKIihELbhpynmO9+pBK/P2d8LEBIn227eTYHjAp9?=
 =?us-ascii?Q?dxpHwQXDLdIoE1Nzh2cf1ocAmwGglNuNI+vcav7mCOHkkrqCF9yjrzOTfvEV?=
 =?us-ascii?Q?+YdzAKi6jc6pmod8L9TFZ/yf32t6WcXH2bXcssOb51r+o6r8Xl+aCNMl++RX?=
 =?us-ascii?Q?tZOeQO24/KhvqOMHrnsdVSNpM2N9dgybeMMyRHvw4w7nsQ83W5o4jHeWWAJ1?=
 =?us-ascii?Q?UsVK1IEtKdOUFaNtx+nJS838jS9h8Y2l1SGuH21M3FM83U016PVExoV84Uq7?=
 =?us-ascii?Q?b3evG8c4+pCke7HESlnblm3IEneDv1HYyaiPXvqf+qYjrJ9kg0FSzQkDG6jF?=
 =?us-ascii?Q?BmG7GAHQo2nReuyi6f8vnHtXhfpJfu/UXyfJ/NSZ4BJcOtELE6RbdwkJxHk+?=
 =?us-ascii?Q?CMBgbk0/pZk33N8eai8uK0GlRKbxPUj7Bk8YS8xZSKWFo16AK8ezqQbKTxcQ?=
 =?us-ascii?Q?aMmojJHmhZrj2ok8yG+/mTmtL2D+vU5e2mhLidGzHtuIe3naFZ3pd7ZrnmNw?=
 =?us-ascii?Q?CerZ00CnVOuF1VA1dZgCpks+XJiucvHkSWP9eTMXNmu4mq3+p2jbZZaOtj4P?=
 =?us-ascii?Q?nr+lEPYqr2bLrj4LFHjO62UkYC9/WiwTIOE//9Y7GB7/be3c4aDjsmk56i7d?=
 =?us-ascii?Q?a6YWx9FqkF5dJZwUHr8wnY9ZuSQgWylxqUoVPcP4n+4F3JKgUHfsL0F28gWm?=
 =?us-ascii?Q?t2CGUcMloppfJ6eEq9S9hD2P6v/1tDlHJw60fFdZ71ilKRy1GYtlTZOChBkQ?=
 =?us-ascii?Q?53NPbbMLNUeQqy3agHkjHhBRtQlReK5s/q5BfgmENLNIFAoAHrIVP1l2tDRF?=
 =?us-ascii?Q?UxyGMgCMVTRTL0VlNIFrZooBPPQmSGqs+OAMOkMGtaZFVQhGxrv8iTTz9Wp1?=
 =?us-ascii?Q?ztAv3vuv+1VdRLCuovytb6NhL2vjyvR/VLCWojfz/LdNAab0zZbMn/K4Ej3n?=
 =?us-ascii?Q?9guOcLXGjbhrva4bDq2F9y9IWrjuMGEggb4bPW8LBHpyNxn1lXirX7n9dO1M?=
 =?us-ascii?Q?ruSsESXKz+31jJ74lNdXQNMq16uvSO1kqscFy+zQ8YtyQmhCgSAIBH89kh3r?=
 =?us-ascii?Q?5YKKk6nLszgcvoy4fmP017gWVQtmIsjgetVkll/+6ct0jazb/TiNfNHNJnrJ?=
 =?us-ascii?Q?jhfyN1o39RIX9iJCBOp/hSx3cwisuJPqKgQvkMTfF3FOnNYyDpn4yQn6HPOd?=
 =?us-ascii?Q?AiHLgav/34WSYdN1ueDXHmswCPpsMcNeWwmZ4oUeth3SEJNhQFBMWqHDo4eK?=
 =?us-ascii?Q?9jZLN6RwhPthWnY+9LeXRElsWHOQhmIx9WlNiYdTQ9cSwRPw28x8x85juUDV?=
 =?us-ascii?Q?/DWOI5RmyhhS+U7EYmmKWlgL1tpM7tnRIpQHDFeozOERkoMV9s5vK9XUs79y?=
 =?us-ascii?Q?lgCdfyFy2zc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ui8YsKo26TUMzi2cpdGYjQNlHtLQFqzRCUobWcw78+XLpwxav5KDXrBWNPFP?=
 =?us-ascii?Q?25hgtjtQ5Ym0sROZeMuLbshnN7pIF4xPlYLAFlEpdXyvpm2dPRCMqk76Pp+5?=
 =?us-ascii?Q?DdeQIX0n+ebMnRDGDetNfaQtp4TX0/36gUbBMXUghKnUQjKD2N3aJ/wp1ucV?=
 =?us-ascii?Q?akncGru4gPHJz1Nyr7r73cVpuGmqkqPn5fjHlii1wApV/xrC14jWwrGYUMAy?=
 =?us-ascii?Q?szEPiPplxIVUHm7lpnhtdbam1mGiA1RZTEBX7Fo+hbj71IfciDQqI5sOjP7p?=
 =?us-ascii?Q?efDokNPah/n5D9yjPLpjFjDaa+aL7nyNOOn12mgqqcQu6DHbhZjf9wRqDXqO?=
 =?us-ascii?Q?BJM3fuvQU9ZfSJv8MRO7J1MDvh4GEq0hGNOCoVKMgDZbDhY39lOp0DqO4yi9?=
 =?us-ascii?Q?Sgjvwb9w2OEm71vJB8hc2H5Vu/p1feZ+QIORX1p5SdWPfdxWt9dEy0tzT8dE?=
 =?us-ascii?Q?5kUuMju41cKlNF62UIm2THlkmRIkhfTfiHig4IjryTg4BA+NBO34JMizhWQL?=
 =?us-ascii?Q?8trsU/8PcJzlE0SGecVu9m59j9hJwty7rlgana+BezUh+ox7kdzPzxEZC1xl?=
 =?us-ascii?Q?u/gSONHqAIdrWArD2A2QLyZJBCrBz/D4NpzNNNdssdEwE+vyDn8zTMX/tIhG?=
 =?us-ascii?Q?c11LfWAsOsb3ktk7N2lmVAzx2GuOE8SnXpFh0gnfRAXduf7pIoXbO0Tt7EDf?=
 =?us-ascii?Q?CzRHehL2DTem3mycSuUCvuULTLFVl4i+h6UY9KdJKsKBHUWu2WXz8DwRSg3Y?=
 =?us-ascii?Q?RXxjJ3PCXn9oN5XHx196YIJIdDOibtSUvRq7j7YJJTs1IdTtkCIWeWLW7QqS?=
 =?us-ascii?Q?iN+WgkwpQ5VyXGTYnScv/1vv1KUizQlwywjUONbtag0vf54yJlHue5OLzWU+?=
 =?us-ascii?Q?64i8Bnlup6WryZKj/Pfj8IDVZWHKaJO2xJ3w0XW7YfXYJA3ociDmkVDC8oq5?=
 =?us-ascii?Q?IakL1mXcM0R7u6uSivUtZ3VaVBMBU1klg2yAEEPDSU1nnR61tyQcNtIifTBd?=
 =?us-ascii?Q?ReNcLbILtlv8jf83SzsBnQ1JtxJwegB3ldd1wCp8uU+Ft433Eg1lS3KBMPcZ?=
 =?us-ascii?Q?tESNa0n8nbBPp8HtIk7+tr5H5R3gTA76SNCcTc1bERz7u3vc/jWdxDmCwd7h?=
 =?us-ascii?Q?9zdPMe1r60f7pDnJxs+M2HEXSOpmNHHNsS753A7WSV1bTfZrRHmdUQaKuHf3?=
 =?us-ascii?Q?CP62SMXrBt/HWFiDPo7k1RFYe4YGbnlGqukkv4DYn99PKOVfmyanMqHGpmJL?=
 =?us-ascii?Q?CUw74fpf/iAItMo+wn8+eZic74bzFOjaLGwsypzcy/MKVLL45gGQBYnGXLOW?=
 =?us-ascii?Q?IQI070QdLBypFMq0kByddI9nAW9hF1EFWcJZepp6dP/F3vMZh9h92oQ+d/j5?=
 =?us-ascii?Q?iuhZRF6wh0S/5pZI0CUyypUk8P6mSXjQAqSfk83gAEc+QqTOOzzL0T5croB1?=
 =?us-ascii?Q?Ad2sy8fsQyekLp4VPgFOdt5/B9z36PQs8ZzoguMKsKlWwtgfEyky0YFBDkgi?=
 =?us-ascii?Q?kHtM/bzfUlfbY2Q32YuS0F6oc0DIUZuG/rWC7ojK4y8MwGEArupknZgoyHWD?=
 =?us-ascii?Q?j6+h4gWhBTiw4SviDK5S7bp+YKBzM2IykXYWy1CJVHvxS6Qk3sj7H3O9vnNw?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d4cb6bf-e3b6-4d9a-4169-08dd8999ff96
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 16:54:26.9852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oV3kmLmaDlGi5GbELzPox+syORDZmzh8/uukYlkSuXSONrO0UhVdCBfLAFPxNOXB9ID9N28sFOwYLJ8nTEKTGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4926
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

On Fri, May 02, 2025 at 11:35:11AM +0200, Maarten Lankhorst wrote:
> It doesn't explain much, and is a debugging leftover.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 8f8e9fdfb2a81..673a5d165482e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -773,7 +773,6 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  	u64 src_L0_ofs, dst_L0_ofs;
>  	u32 src_L0_pt, dst_L0_pt;
>  	u64 src_L0, dst_L0;
> -	int pass = 0;
>  	int err;
>  	bool src_is_pltt = src->mem_type == XE_PL_TT;
>  	bool dst_is_pltt = dst->mem_type == XE_PL_TT;
> @@ -824,9 +823,6 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  		src_L0 = xe_migrate_res_sizes(m, &src_it);
>  		dst_L0 = xe_migrate_res_sizes(m, &dst_it);
>  
> -		drm_dbg(&xe->drm, "Pass %u, sizes: %llu & %llu\n",
> -			pass++, src_L0, dst_L0);
> -
>  		src_L0 = min(src_L0, dst_L0);
>  
>  		pte_flags = src_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
> -- 
> 2.45.2
> 
