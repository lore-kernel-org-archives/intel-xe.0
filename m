Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E08C5CFF1
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 23:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6244A10E08C;
	Fri, 20 Feb 2026 23:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NKH7B/29";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1501B10E08C
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 23:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771629133; x=1803165133;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+JlCGoNTqN+vjdJYYoU3uDuZ44a4Y77coqMI0AnL2ig=;
 b=NKH7B/29Vh9Nm0R6KyflWZvirSYdLD29DX3ljQQUr931kzCzNXFt2HKB
 KFSIGDF1M/OvjwnX+uZgevpqB/2/UOnI93hDKVp6JEW0yqKKrERwhlwpj
 8lJ9D+xWM0c5P3ui6L1yxgv2bXW/+SBeYlRYZJxcDx7Qlc6sdYVG1vObq
 xNxvav3FYk9uecBX+64hRKq17eMzgRL1/zYhmu88gP38d8LfPdxVqpF+j
 Ckc+Zfz0/ucISEGqB/SpNCP36sdhhg94RFaoiFwqFdUqhtepIIUgPXgbF
 LBn2V06WCx3x/uWMDKsoVyYiMwmJqlPKbOMkDEA1Z2gZf9RIaY98Y7001 A==;
X-CSE-ConnectionGUID: 277SuUV7TmOPfqWgFsoKiw==
X-CSE-MsgGUID: Cykz7BgJQMCLdmpxSGgKZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72603789"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72603789"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 15:12:12 -0800
X-CSE-ConnectionGUID: RmXsxABITsC4oH0D9SrALw==
X-CSE-MsgGUID: L1J9cxAWT1SuCchHUuz5dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="213993043"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 15:12:12 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 15:12:12 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 15:12:12 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 15:12:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4jm5Rxb6mWjpPO8/p4FgbTnX8a1GVOrS7Txeiziix1otpMAy80LevdV50tJZBNg29DBnNRM1cfk8d2oIaLs3Nzu6YOp0qnXYdfkQINOmsXo1oARySt6OK2BbDQ1Mp2Ak4Myjc5Rre+REyROmj9Jh1sqvKaw92uX5wtVSKChklzgmz0ZDyByrvZ5NPj2H0esxYhzNbot8y8p5FuwH1TmFXSUx7NuQqjHCj8/gMo1lKSpv7IjVUKOZd0O5TRtORQby/FGB/+hp/v5Un6rOU7hDWB379/5QqKZNq90eH/7zH9HEjax7UTBKRzIrxysA7J0jPye3vtEgfPekvE2jGQdPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSrOcaCxi64Sce6s8/stwHmu6GIdljwSeTW9gT0Ln3U=;
 b=QYLrwpdVg+jikiiHRA7DX20EY/VCwgDCC8f+cE3AvShXhr5xgOqQfaWM4LJCY2QGLVoTKHKVBRxemOY6OZo9P7brZQs95fmkCtXew1S9yoOzvq36i1gfzVJETYwjT9qGW8pscXWT7ErqN2lqiqNBAPqnaFJiJorGfvGcqWCnLp9r9zfw9kCXl+inLMSCJjSZjOPQ8Sm0W7CDlb1khMbfsWvxJdppFf3GAr+yFNLTvPA3S3lFdzsiWyEnAw1Nrux2CsahuE5P7/kGnKUtgEEpn30wtYczvgHN67P9be/dy+15xsIudIBFziS0+SY23FsxnDN8pPnEAJ70BDZciL6ybQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB8988.namprd11.prod.outlook.com (2603:10b6:208:57d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Fri, 20 Feb
 2026 23:12:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 23:12:09 +0000
Date: Fri, 20 Feb 2026 15:12:06 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/pf: Don't use LMTT page size if no LMTT
Message-ID: <aZjqRs+U3iLLe0Ph@lstrano-desk.jf.intel.com>
References: <20260220201857.6113-1-michal.wajdeczko@intel.com>
 <20260220201857.6113-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260220201857.6113-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:303:8f::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ed346f4-c018-413c-9b76-08de70d578dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eFu0ER/ESORUF4m+OTAe59xbikItE3IRg1r+0hHuZH7H6+HTAC+qo2d92tHB?=
 =?us-ascii?Q?iaPPoDpCc1jTWcr1FxXLqm14mgJf/m4Sd7gIy8J4dWQ6Xdm5aT6nO6887wzh?=
 =?us-ascii?Q?s1OZ+5COx7LCRL1chtZ2VZ1v9EWhT7DSMYrYBzDqcCTTx7MMFR5D5ZgwWPyO?=
 =?us-ascii?Q?DLUxqxvRHsHd3lRX6p+Z4Q6R2uyD09xg14k97ELGm5xGlX841En6+gjDEe41?=
 =?us-ascii?Q?EJEctVjIbOsie0+aoNFWe65iLXnLHtcG1xl7XuJUJxNY9PqPhWbw/EWu15bu?=
 =?us-ascii?Q?yJ2vqqez0F1N/Xhx7kTgYYoSEwjPR91hiRi6P0bmGAKovibWjwiyd3MSr6Ke?=
 =?us-ascii?Q?cryZ8ceY+YNVUlMBIIEFyBmD3NCSMvWgAXYna20JEfOirucIzsIPw0+zP9Xd?=
 =?us-ascii?Q?ZMKhlJGmzBPgaDjVnuOvy04J/TCchV8rXgxwnAwe2T3JzIXaw/BvjJMNn75Z?=
 =?us-ascii?Q?Zn8kqlqSz0BWqBmMF9ja8FyPmlBO+A7WGrBF2cyXxKasU5nfij9wnh88DBWe?=
 =?us-ascii?Q?F3ZSyfHTeXFL/GbkrOjVzg7+WQTBYPcXtZ41d2v5KPRmZnxjpf2ZKySN3M9h?=
 =?us-ascii?Q?VBgdjTjrwy6NxQQvmqno78ySFWtray6A656mKqwJnju7VRMd5rRAeF2aNwml?=
 =?us-ascii?Q?Sd+9eXpkBgJ62qkbYn9s7pR0QBUKgZdCjGJT2hwOpi1oEBExrDKZ8RFg4moN?=
 =?us-ascii?Q?c8A88RTbwKRGkYBA3WiBe7nRkT5UNiNdDIKEuXTGec+gcdVgTKL6W91g4Nug?=
 =?us-ascii?Q?FKk0VczfgJ8PTN1SlaNlYUtOM0zo8tkyX+d9EgMUZDZgk3aGtAJzVlzCvzcd?=
 =?us-ascii?Q?oO/ZRxRcdRbDdOVH27s41lfODgXlLDQGkClYBizwiMjc32Ouu/QzOfVERsdn?=
 =?us-ascii?Q?tuTkesNjdPFtwHrduV0CY32kXwxrtIDIu1xWxW7Nyqb4hLgMnCujO+QmppxZ?=
 =?us-ascii?Q?qLgtPh2LUDzs/uxQvqqX9XcVz4rUyD9rwNh8CCnNPnArmkAjli3GqdN+gvV1?=
 =?us-ascii?Q?HU0JnOIITKbvbldJq7FdjONakbNv4zeg+qRJU4NisTqnhYUzyZysB6XcrDb6?=
 =?us-ascii?Q?FBNG6XvjS9XYqO7/Uamk5R5/CViccTg8AGFofrkifJJi8I0SDaMc6LBsQWZK?=
 =?us-ascii?Q?fGamF4hc+/oGANx7SI1N5BWQ7WHNmdv4xgatiVKl4nRkkx88nJbou/aaEyKJ?=
 =?us-ascii?Q?g+Q3PKZ2FmoYrj5d4PlW3o/4koQbgeowqwGSxidVKX20kGkG/NO14Mf9kbB6?=
 =?us-ascii?Q?symrnQgiHqHBGYQSUYl829XoNcCJ3zi8Vig4Xv2Ta6gbuP87HKFQ22Go8VjA?=
 =?us-ascii?Q?0xwaFvrPnJQyv6nZlTOc2IaMzFjcmyG4d0nyiAu1Jd59rEcXs3rlrs0SMiiM?=
 =?us-ascii?Q?dJPMFDta/GaqY+pVORJpanW6ydvHZXUPxP2zdrKiG1qfegVY7sFS1tmNKWms?=
 =?us-ascii?Q?uADpzpZzZk9tgfPxqhSKWZ26cQxyt2wD2Kp1XApxe/SFwYMlTIeco30vJdXB?=
 =?us-ascii?Q?c8tbwCEV9SPD8pjMyu1fkcDv6Kyg+Qz0JjH1VKAzoD/ZJL7lwsw3/tb8w/C8?=
 =?us-ascii?Q?So8YnuohnuOyL2r5v+s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0M3fdQKCUes2zTvdtOeCRrlv24RrwFtl8UxJ/Y490aQPhQ5S6An2H4sEImId?=
 =?us-ascii?Q?iow6dcuU58BJs/q0Yx7bXIqf9yWoFJKNZ5ATNiBN8xXq8wGFtiy21xXG+JER?=
 =?us-ascii?Q?IL8xYBaf7pVlk+um+ogywLlVyOsfdZOTdCRFffkecIayYawftz3+7Oy69k1+?=
 =?us-ascii?Q?UF+IhAA3OVH/kka+0Ji2WCO/s9o4JKRVCIPmz3SLOHftvW4uKhCXS2Un9wrc?=
 =?us-ascii?Q?awLFIe4di3tdkz09CAXpEvc2g2CFiKEfRxWjEzQbLy2lKgJDDmdoppv0wCdp?=
 =?us-ascii?Q?5NyEpLyIpInnUv17uw4+uyejIM1skwYAiIKxOc/Aj+fdmsCda1TwhWqxuPKY?=
 =?us-ascii?Q?oI5mlmPJZ+u7TYWDaTBpW4ArEMYgHE0xS5eQ9Fgk39K1xlFQl3yH9ssG1Eis?=
 =?us-ascii?Q?mv4hUt/M+4e4FsPIqMW/3VGQpCetrBwPlBnvavl8e7ZMQFkT++RUTzWYWzjD?=
 =?us-ascii?Q?QDt2jNHzQbkZp80F5FDQlHjxcKSRbr9qVPJ7GEg2a+wcHYASrdXgkSAkjNOi?=
 =?us-ascii?Q?ZM+RMYquy2Cl8C0nACnmzd3WfxHew/JHYwSthZmbupuXm/UpLNKrp5c2PkoO?=
 =?us-ascii?Q?NyoC4if/rFt0Zi9faFpDDdv7e4chtPWO/Q13eYgXJTBl69Jrp8Xpfap2owlL?=
 =?us-ascii?Q?wNNZ2tnEi/xjpwmt/fywHCNiPK48aboAmFxD9tNYprAEdTG/TnOsbxoKnOqO?=
 =?us-ascii?Q?IQPT8ETEFk8Z52ACQwGPLhkMvi5RwXCcahCEY4hIlFi/b51N6F+CmC/OSEiQ?=
 =?us-ascii?Q?NSb3uhG9V1h7qbKsvsL2nCU8e+rlSVu5v2Lnqf33OlHLJ5LWcUwLKebzKkzi?=
 =?us-ascii?Q?2vtuqEfPDvVL9J5TFUTo5tLJxOSlkYjcIIF1UoI+rLKpzwKhav/ZvMVDAS3U?=
 =?us-ascii?Q?ttFuXj4qkJQbAjNdK35T+ys7CXIg6xv6j7SLfRvWOxA8aOw/IUdB4xTK6O0u?=
 =?us-ascii?Q?E+PHd7plRV0EfmW6Cgn66KckLoafJbQToAVj240dcaFCfJPZdiiW3zWWSJz6?=
 =?us-ascii?Q?GNQcd5ffJwFxCBo/8M+OOUL0hpykema7c7r7AauUlCurwRrnG0xN/EWsuJ5a?=
 =?us-ascii?Q?nuEPxdrUUx0L0ckP4hDJOZti3Td2IaGKXAQdu6xJksrInczc/IwGFbY+4qZI?=
 =?us-ascii?Q?cr4Rtmj78i/tCz654xozcEJI5oDtUExkysigW+FDq/JU764GsOdbx8v39VzG?=
 =?us-ascii?Q?v4RXhkb7QKxoaqZF4UCOqLFR6+2pUqXmPAVtMj8e0lGs7HIKv6y9PVWszepM?=
 =?us-ascii?Q?RwhNkxiw82ZVYJpUuFhxac6600GCDgT08gA7c652+zL9US+FQg7JRyldz+g3?=
 =?us-ascii?Q?ihIV1ilvZNsLqVgERP+Y89iFcKGV8EeJttnP30HU2LTbfJuMNL5tJ/9v0npz?=
 =?us-ascii?Q?zFTQPI4e1qPqQX2yqHrX6RwqRUxm80oVdjIBIk7mrAPUn20viKGT+PBJPSQI?=
 =?us-ascii?Q?ePTzILSvuq3e1fsOo0S/cDWAXkIlq1mkySspdFYfhfwCHtuUVVTynhaYk7ao?=
 =?us-ascii?Q?xH+EWvKmbfQSJ4CtMPQ++rtIvq29m2PgnaHwEC7ObrR4KZEyLr0Xv2m+T7be?=
 =?us-ascii?Q?3DhNrQIz1ZcCbrEpoeZ2C1d31AhBg78Rb20xMKFhnrXJnRmDhB0vOkV8b/L/?=
 =?us-ascii?Q?xml2sdklNaBAWqouor/+C4mI7ojUXcy5u+/VHnkV/PpSV9lTiXf69ApE17+G?=
 =?us-ascii?Q?6MZO4wKrkmfOqGkqXakssl5SlDhXXCImDcluNRLWrWWg1k6B3e77/0CsludR?=
 =?us-ascii?Q?I8gKBThBHGXbIMWCFmWdSMDyyCugyP0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed346f4-c018-413c-9b76-08de70d578dc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 23:12:09.2252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5rKro+6ViRLduHLZ+HkGzh9ODe7FO9pMKADRBwGkyQ1TF55UuEJeNtLy37cC0W1tyXcioYzn7h3UvVlGfHSr0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8988
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

On Fri, Feb 20, 2026 at 09:18:54PM +0100, Michal Wajdeczko wrote:
> While today all our DGFX platforms have LMTT, we already started
> preparation to do not rely on this assumption. Add check for the
> LMTT presence and return default page size as VRAM/LMEM alignment
> if there is no LMTT.
> 

Nit: This should be the 3rd patch in the series.

Anyways LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 6383763d02ab..3ae83cffe925 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1451,7 +1451,8 @@ int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid,
>  
>  static u64 pf_get_lmem_alignment(struct xe_gt *gt)
>  {
> -	return xe_lmtt_page_size(&gt->tile->sriov.pf.lmtt);
> +	return xe_device_has_lmtt(gt_to_xe(gt)) ?
> +		xe_lmtt_page_size(&gt_to_tile(gt)->sriov.pf.lmtt) : XE_PAGE_SIZE;
>  }
>  
>  static u64 pf_get_min_spare_lmem(struct xe_gt *gt)
> -- 
> 2.47.1
> 
