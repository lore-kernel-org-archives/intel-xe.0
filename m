Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62941C87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 03:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3D310E45C;
	Tue,  5 Aug 2025 03:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b5YpF6DY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F044310E45C
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 03:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754365563; x=1785901563;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QnRuCG2DxkX+TvZ4LTeGzPECWDFhkchJwG4PHmNPMLo=;
 b=b5YpF6DYZxvI6ESJ8li5kocCzgfKWuUKHzs5gRBg448nn02fbWNlHYl5
 w94rVgb4JJ7xLMeIUZEoqTlWd/kZePU0r5tRVZja7PQwM8ThHvhDkDm3j
 YF+fFZBd3Oq56LuSID0iHNR5046i5j2rgeymYrxJ67gtdLNXlaeCZTael
 QFgTYfoZMpZN3O4HwEa9D2mZDFb7lHLae41XMPxoerYivIYLpO4EHVH8J
 FzDfh51RV8w7S9MvkRfHga7ODSSg/69o7853bZz+Pq5Yr3ZZskk3ksdSl
 rIAJMO1JsnIIg9xUK7zsbLjZ/FsJ6Vp0lU+Y7Tuo8lCCDaG2nckxOLdbq w==;
X-CSE-ConnectionGUID: P3wbgmTnS7qPjg14FDTMPQ==
X-CSE-MsgGUID: LEX3Lg2SSvW6cJGzMNGh4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56721808"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="56721808"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 20:46:02 -0700
X-CSE-ConnectionGUID: d+1q5/jhTU6x4NSJMLT0Xg==
X-CSE-MsgGUID: j3PJU8S2R26Z5ju/Mo8fvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="195294580"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 20:46:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 20:46:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 20:46:02 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.73)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 20:46:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHgUiKJRYYDJOkx/ZqrascNfdAJ2Z267J9NkPx2TDEwYpEVMP1ySmw7H+yZHDngivPHPkBH6OcUuwKdnCNs2IOxUYmLpdouLNm4IDSQAwMQ5UzaLcuPMtMYbK7wJaslEuFSIgjLhRVylas09QTQPH29em5Poj76OubLlgF2MGlSXj2EGxpjZgXPwRF/m+9Y2VHyv0I8itcsop5UkbxMW4ojkALJDAAv3L7LEqaIMP3UkKopzni5rYbKj33EJqNQSSAOANvTC/dmw4zH/0gB0g3+HChZDBi8x6CzPzZIy3a31gJlxXWocjZ/DnIzkJe3YdgSB37w5sUZ19+SPDO3j+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3aM6RswIVXnKsb0LRZ9CpSzXGUB8Lsupmo852VncJQ=;
 b=xvNhHHttueDgBU0jam+rL6NvgcZIPvt5oXJJowsfWYfVd/SSITgPOj/LLGkqKbYJEl7H/sNW4jUO3M6vuUkb9qW1/nnA8fbouWSnh7qV3pK6hfPA4dF+V4H8jlRNbrZCMZPsCGED2dZwKdTY1vl8bMJCU7fsSmFTdprv2LBQPvEI3eS67Qv7ZjneksrNLC8KATyfJUEk7j9CRjctgRAg5wK/s5zwA8Nuf8FrhADOAb9eilDeVlO6l9sFmnW/L8ZgPySJiiVbADfpYsAann8YT5rlxPkSmy3fSQ3m8iJvzUyVjsBvAEslYtUWW6zttxcEcuLW85qZDZ4TqWp4J7HiXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6898.namprd11.prod.outlook.com (2603:10b6:806:2a6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Tue, 5 Aug
 2025 03:45:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 03:45:57 +0000
Date: Mon, 4 Aug 2025 20:45:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Caterina Shablia
 <caterina.shablia@collabora.com>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v5 02/25] drm/gpuvm: Kill drm_gpuva_init()
Message-ID: <aJF+chu+NLBtxh1F@lstrano-desk.jf.intel.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
 <20250730130050.1001648-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250730130050.1001648-3-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0240.namprd03.prod.outlook.com
 (2603:10b6:303:b9::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6898:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a5ef30f-792e-4594-c926-08ddd3d29678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DM+QuJVgV9V4g+z3HwNKnneFECAsR8ntXVk04Dzpo1yoGDzwlN8dvPIzOku3?=
 =?us-ascii?Q?aDQV/pV9CPRLHKpin7BsxoA6nAJH9Bs+0wkpi4mpDjWmYkS2HYeET2rkqGOG?=
 =?us-ascii?Q?UA4Mi/1J1EKrj2syuUBRZa13v+3L/ee1mmSGl7Aa/UQ6kAcmacv5c8OhyBeU?=
 =?us-ascii?Q?jHNNuDuNOm0ni8E0DppZf2xgW8gQ6sd7UanPm0XfwJlntSpre6HOB3TL4mev?=
 =?us-ascii?Q?dkekLUkjPnTqLPj3idpIFxtG0WcVuzw00wxBlyycfymNN/DCO3qowVJXunfA?=
 =?us-ascii?Q?jyKylguykYnviZQED26obrt3WTBU6/z1wVJUEa0z0++LmAEDvOfEN89R9aps?=
 =?us-ascii?Q?T5vAuGZKjtJSPaZq3JfBJFxM86ecTNW/LfkzGDVsugWWULEd78zguf7eniVa?=
 =?us-ascii?Q?W5vwpIiONUYOeP49B4o4CstUiFzEjmifGxrsDkHQF/WnCeyn9rnCblY3pHu9?=
 =?us-ascii?Q?F2wAligDXmxfZqdSS0ZhWTshJGIpyMmx1w2R20I1lZxjmry7FXPuFp/VQOr1?=
 =?us-ascii?Q?Nhnky2AHKtSRZB3qtFk9/EcESQ2Lxp8BsKIXI4+8U5VExCm3UobfEG2SHr0q?=
 =?us-ascii?Q?I5o3lABAcj5gQBOpWp+1ltkQTHTApuU0JR3R0lu9pE4fti3xM50LrXv0z1i/?=
 =?us-ascii?Q?endM2dpfJIXrn4+LTue5OI5FCx2X2Iokm/aT/tmZATFgPxOOOaOLyB7YSeC2?=
 =?us-ascii?Q?OCRStwbYOwyCR8VWPMZy+qfU+W4lNO1CAi8exCMdikkt/33AQkGqn7Fi+TlQ?=
 =?us-ascii?Q?46cc+10w+Zu7R6GbG5heG0+k1/UMP6adqxrsHR8cmBJLVu1euAeSMZiGI4u2?=
 =?us-ascii?Q?1B3d0hOCYsSqcNJlJcqHsLB8xXGSb5/zomJFPYtRIFLAV7V1WvjZ4WB3AWB0?=
 =?us-ascii?Q?rf0l0Ge8ft0ysjhYw9Sd7oCTskH5T8F8/e7oRpBmWXeumCJUbKf4Jp/2C7Rd?=
 =?us-ascii?Q?97bJh2ziDrxDKEs7def05YqP8gHbajfSEfDwsyqghxQb77GniWu44AqsteMR?=
 =?us-ascii?Q?IN3wE0IDiNxg7Pf6+GTLLVpBWyP6kEpMjj5tNfpf1yK4fPBzeGgbG1bxKD4g?=
 =?us-ascii?Q?0aBp3I/yb/6WpzcYp0NSZlk1ogOmFwcQpl9gaputd2RYkZUNU8+LQauIl72z?=
 =?us-ascii?Q?XnyrCd4zcaOp3iGArgwrVheFemnIrihG32tyq+ADW3c503yIF79vT+OIKOrE?=
 =?us-ascii?Q?lcJygMWTgFN+zhWUtRIVx3/rp8qUDGPWVUDZP0dhd7pM+WUEm72k+Pa9QoFn?=
 =?us-ascii?Q?RrvtoDAbSgfVay+1Ywv2nijYITzetGtf/M6JMRIi7CF0Sk1N10NGp63lmAdI?=
 =?us-ascii?Q?BynTLKAgc4SstEDZGMJycqtcpWTMa2VO/7mSYqYjBIZDCrKV+ECW5b8ILHFN?=
 =?us-ascii?Q?Ofuq6/T0GyCPdaD5vCFFz/JZq0C2pcJaPnuofZsax+G4PSWfiuFiQh4w/q2I?=
 =?us-ascii?Q?Q7ffnCoHe9k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bRfolNYS4PegIGoy8Cfnol7WDwwNgNcICrewD6qjqDMMuHKJNdGqSgsMLTnG?=
 =?us-ascii?Q?P8YpVaBceN9i9ZJVNVItHyBE3d31tnEn+0PtGkijgv7/PNhoz37Pb1hEzuw3?=
 =?us-ascii?Q?ZnTVuizB8y7WkGzQZbJU9+Hm+wnJukBtMQ2K4ljCqEvrigCOWhbkw3SMhzdq?=
 =?us-ascii?Q?J/ivojHh+xmp7KrjUv1ZlrMw5L45KkkW9a0YfDz1I+BbXq75CmEPbSloHOfR?=
 =?us-ascii?Q?sWWvNKljXap2bOvwVD1xbikRTtqtywxpeukP9Jgl8dRxuroliMtRrjkOWxAh?=
 =?us-ascii?Q?jfycV6ToNGNMmkrb5RhFeN0AtKXMKQJIEixWb4120n4rQKHZvQlD8bFsjL2i?=
 =?us-ascii?Q?VeMtCc/Qaekw81aPoeZTEg/vK1aGWYVGpKkd2wYfQrdbKyuf9Eqy/0Vk+PYc?=
 =?us-ascii?Q?SMGCD5gHQ80EjqodtAeeIp4b5BX+bNYGtiY1gC0WToD4VzLKbJNwff9RYpEN?=
 =?us-ascii?Q?ohs2jMNnTb8/Vq3hcaVDbh1Ef1wR0Z9uVDAXq/BLUDd28LKot9JE7wWXh2kf?=
 =?us-ascii?Q?rpFsHsxWPHpaf0hZNSM5DGYsqCXWFpffaG1tSD5troCydxZ2gb6JEQN9jb7u?=
 =?us-ascii?Q?ryxlOzPtoFGqNRnd7jLCZk0b+wECTm2Sa55DubKVqYaQOn2nka86IRujfPOj?=
 =?us-ascii?Q?+G6Tauw4FY9KpTRIxHN9ovv2VtTAnHylUymvPFxRjR5E86gwIAhfqaF52oTa?=
 =?us-ascii?Q?MM0DF/C8kpLX2Ix5v9HA8GTZ0UltiuMEcdXIAF4iyifTnMO0yaAMt7pRc3I4?=
 =?us-ascii?Q?iqWgGfzM9T0fikVNIUpFyo/0og61SaWOVsJuMNfuC1kt57IOQ/LKpen/IqMq?=
 =?us-ascii?Q?2jWjDecNo+rMCvmlbylv7DDkXviYDIJwNQ/fL654AGo4iB3uJevmCw8N9hKY?=
 =?us-ascii?Q?F2cl7Q3mvn13bZ1eToL7fCpLXTLk/rECKi4VQrQez5j6nqN+bpsgkPPponNh?=
 =?us-ascii?Q?9rNg8O8MsX52qSZlFQ/JYvwlikbr+Osj7B0E9XpgzI1WILvOX3WChfoyZqFe?=
 =?us-ascii?Q?YiNiIAc5EPfTD2lFmPw8bV8i95BaB85Wo449Uv8P0U7YAIOhQHaApGJezu8Y?=
 =?us-ascii?Q?EN9i7KMc2uEMsXo73xJ0l0G5CWzBng1we/2tVmhm7dn4YLAggzD8a0cyX//+?=
 =?us-ascii?Q?qKRFBr7M5ag9uH0yceS7B3baMQLIvQoM+pYgTB51V4C+dUXqgNovATFGboeu?=
 =?us-ascii?Q?8abwEDAyvGklfakCusrGf7sjVEaa+tEu43pzZwAqXdKMtPq5IUFdE1kXaOUF?=
 =?us-ascii?Q?HLdc6HScaEc26+pAipZMEF0CAx4EJRGlED3RzitOBki366ZwivB+u2+Q6enB?=
 =?us-ascii?Q?HyhNSdjvcUAAn01ILnvjv39uAxBgQqMcn4Jz4mQ0N7lM/0yVdBA8I/b20hLI?=
 =?us-ascii?Q?tB0v3TxZVyorg3iiXLug9tXIRXZ8tYa1xjPHqM49gn35YS6CHS/Ytj8G+C4o?=
 =?us-ascii?Q?yzonXE4nyR/pc4ihR5YvdHSTNU5PWvVsj6MkEzA3aHuJPBXrQBLPyxVk6N0J?=
 =?us-ascii?Q?Fx02pSI3bcIbZYqB7WIK+NOrhx5Z4uaBWOgAc8Pvhpiu1YTtsW7DuqH+wlp/?=
 =?us-ascii?Q?eWoE5Sf/yWy2dgkOtKzexFmbSbulSXO9FgDnYAUryrZOPS7ifiDdROvcIloM?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5ef30f-792e-4594-c926-08ddd3d29678
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 03:45:57.9116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V9Fb8ijQff0POWbQuL47Tn2LO25+4reW3C+ZgCNoYxVGHn/aeNtS9QWtfZ+Wf6nqCGfKPBPTS5nfXUIl7hUELw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6898
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

On Wed, Jul 30, 2025 at 06:30:27PM +0530, Himal Prasad Ghimiray wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> drm_gpuva_init() only has one internal user, and given we are about to
> add new optional fields, it only add maintenance burden for no real
> benefit, so let's kill the thing now.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  include/drm/drm_gpuvm.h | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 892ffe75a62f..2d24d000f2ee 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -160,15 +160,6 @@ struct drm_gpuva *drm_gpuva_find_first(struct drm_gpuvm *gpuvm,
>  struct drm_gpuva *drm_gpuva_find_prev(struct drm_gpuvm *gpuvm, u64 start);
>  struct drm_gpuva *drm_gpuva_find_next(struct drm_gpuvm *gpuvm, u64 end);
>  
> -static inline void drm_gpuva_init(struct drm_gpuva *va, u64 addr, u64 range,
> -				  struct drm_gem_object *obj, u64 offset)
> -{
> -	va->va.addr = addr;
> -	va->va.range = range;
> -	va->gem.obj = obj;
> -	va->gem.offset = offset;
> -}
> -
>  /**
>   * drm_gpuva_invalidate() - sets whether the backing GEM of this &drm_gpuva is
>   * invalidated
> @@ -1079,8 +1070,10 @@ void drm_gpuva_ops_free(struct drm_gpuvm *gpuvm,
>  static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
>  					  struct drm_gpuva_op_map *op)
>  {
> -	drm_gpuva_init(va, op->va.addr, op->va.range,
> -		       op->gem.obj, op->gem.offset);
> +	va->va.addr = op->va.addr;
> +	va->va.range = op->va.range;
> +	va->gem.obj = op->gem.obj;
> +	va->gem.offset = op->gem.offset;
>  }
>  
>  /**
> -- 
> 2.34.1
> 
