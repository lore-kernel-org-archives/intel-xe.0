Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69922C87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 05:42:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E1510E4B8;
	Fri,  8 Aug 2025 05:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fa1AginW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8FC10E4B8
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 05:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754631761; x=1786167761;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kczDyVuUsG+HZGU4m6z79UegqWmfbR/jktop4Zzz73U=;
 b=Fa1AginWFxmOBZ2C/bhvYwOEhWvGHvaAPrsb2s1PT6r6ciqAMsf8HZ7q
 Pjp1Np+XrLlSfzWslPSb0k0El6k39dtXcHOLME4JJyQ6QdlG0chs3CVCZ
 xEiw2VWfm488WnvT5YXmadFeH5FimKQr74a0zpcs7ExRr9N7RdU0DynbC
 mhXBp6rr9p9Ep8gKzjn0LqgMz8fgxvNEgG0JoKTOweOMDWB4bZnMiws0S
 Cyy1tjHsIGWF5HgFLVp85x8Z64axHIvc5IS/2t2wZjz8LWQdMWiDDQ4fv
 gURzGPoIFWab6mom+u947ciLkVhScyp2/WeM0oxb4gqRd1LR5prOSIjoD w==;
X-CSE-ConnectionGUID: gZ7NOwZ5TqeVSMxFLNPZrw==
X-CSE-MsgGUID: HbAxW4ctQ/CK17BY271KEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56180097"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="56180097"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:42:40 -0700
X-CSE-ConnectionGUID: oKYMxVVoQ22yNayLjkwkiw==
X-CSE-MsgGUID: SsYcG8fJQ/OZt8/hSmYH6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="202410847"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:42:40 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:42:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 22:42:39 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:42:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBncULw5sRLAOolO7uBzpiQx53Mmt+7Qo7JdOmiLLPw3kWAy4zBsBsdPnoSeN1CkM1Q3YIE3R5nyrBmr4kbMC6YpmDfCKepny3qgag6velt+WxCPVX2agh8Bs5Y6uw/N4o5BfM03hQXrbuHwN0SFz1ZxABYz2qyQkUhjL/jp0SO04cC1Nsn/RqAebKr7294kt9ooodtkETiBx2rLiY1HxNPfFsIQuQXKikI+GGomjwefF7uLGGWlzlD/J9E01g98RzhofpPz4PGUoJk+xVHyfYbsB8E6YJ8KZe/AJaQpgp+byQ78LRkFZrgyvBvmJAsaBCYnxvB9UoqzkVKkukMwUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kaH9TPj+wmWaNG+E8r8DUIdy0ogsKOPi57dZpiMhjd0=;
 b=zOi605db2PvrAvRHRO8bSLBNZxHzRen/+nq8WjtYdcBnYBt/XOSo0MoCV2V4gZ9IWufaX/h8yzzJoRkzwW5m1XURqFHuNOdksG4WJdPwUyNiblVxQCj625T+ddFm16V0ZjpUHFh9pPDevCJofgzqoMJc3mE999NvSeo+rcmFD+a19UOqDiP+fnoXP+nrAmUAU1miXpb8bsT1Ti/CLBzqXgsTI/c6GFrN+tc/4G0ejFJCtMIx2yTdIg0avzTJSI2W02TfynRg9ZpPTlZsj+e6sWBC/UyzfgKfrtqzUHPLJvRaSQBS5kqCDc6bQwbkoDpQtfNi18QYPwDHN6s/tlkc5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Fri, 8 Aug
 2025 05:42:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 05:42:36 +0000
Date: Thu, 7 Aug 2025 22:42:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v6 14/26] drm/xe/svm : Add svm ranges migration policy on
 atomic access
Message-ID: <aJWOScHT+1Q1r97E@lstrano-desk.jf.intel.com>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
 <20250807164338.1832254-15-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250807164338.1832254-15-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0112.namprd04.prod.outlook.com
 (2603:10b6:303:83::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: 369d73fb-6dc2-400a-be47-08ddd63e60dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eqFlVC9yCwPHhjZEwXF9hLCrbhM8iTkq9/8Ji9Vh2dfbjQc3OVtT3ICckqhs?=
 =?us-ascii?Q?bX1l9kdnCLwWijMIayYME75Ae1JN1glsyMiqhCRe/dqzx56aovIIrIbVNRzg?=
 =?us-ascii?Q?TyqhexhqP07RaWfm/fILm9xxr3Ytzl5kq/pdWIyP4qJjN81wGbGNjhMkjxFT?=
 =?us-ascii?Q?iuwo1cFus0U7pmi19EmlgAS3QghddImk53d8EFWFJHzRTtJuuiekkHi9wgW1?=
 =?us-ascii?Q?G4uNI1cmwTVxSD2R+aadEs24F4ysFzJRSkwFfgL6FBIFgbzAmnom+k3kHft8?=
 =?us-ascii?Q?7AuBIFxHsNjSMHBRpvnFQbc4C9a8D/HQP7K5TMG9EgFDiYKNj7FapNadYkpF?=
 =?us-ascii?Q?ZQjkz8KsP2Ye21PNu8IqrRlqIg0VK6m3sdRv8OtiWesw3TilIDZ3Z9X9QFs9?=
 =?us-ascii?Q?34vnSxpRXKYzJEElpTxwFzBfewWvdcfbxRLTRX3JYs0qTN1nKYVSqqkLqqZ8?=
 =?us-ascii?Q?zFbtGXvjekeET1GY2U1CYRhTqrBh0WUFFSS4qV2Fhl5XOI3zXy2nq08yRbn2?=
 =?us-ascii?Q?hbUj1vWFqBpk+C0DwK1rLjCY/EkWsU95pvhHhfMGf6vaW2nf0e7ckRU2HFLY?=
 =?us-ascii?Q?PKbAECfyX+BKBIz9bDr27JETIVFQ0MsRFSzDUUI8cIzhE89VPn4KZZA07bNb?=
 =?us-ascii?Q?qjOKL9/VPP1hW6eZV2AlB8i051jaJkNoRKwZ/5aXI3ehlM1Ff3XsVAOrZh/A?=
 =?us-ascii?Q?weWYaVnFvboR4wqlGwuibpn4UdaSuupdV0+XUb/GGh6MS2r5wri5ynQz8dHK?=
 =?us-ascii?Q?ufRXOJtYeL5PyrOetUu9hLAEL2BSwyq/GrW0wRTufVY7xbpXwcX8JROjdqnI?=
 =?us-ascii?Q?Oec6cy0ZHAewei+JnU+ndBORTpWEd1haJjSMQ3tSrEX4lnkPMG6o1M0jPaBF?=
 =?us-ascii?Q?HrK6JF4SOzg+5+tdrn7WcUn3RLl/07ZL31yDGLdd4v4GstwA9NGoWrpNSnNP?=
 =?us-ascii?Q?04g82PUOqS4uDBEsbjdyqiszWR4KX2+XlDrJ9+30VleuwymqFQnKQVTTtEew?=
 =?us-ascii?Q?84asGbypoj6wRwfQ9c+2irGXKijy7Aqkw6gIC3z9opcWvnX+s62ndBvMr3JN?=
 =?us-ascii?Q?WMqlAJB4Z27T8D5l960BMTz9VyaqZWdDed7AhAOgqxNxKf5aquvsU2U2kipC?=
 =?us-ascii?Q?AqCTlI9QCQItfqOYMfBLC1rv7NBygcP5SZMzW9GkoPcV1EJ4UkgnHrOApral?=
 =?us-ascii?Q?9FYPdejCAdq6nuq5ouyx5lls7He4f2wZYak0SXTU2kJtjDVjq192ASeNPudn?=
 =?us-ascii?Q?eAYeS+GTZk/lG8cSFflbCqQm7J/d++iO0JooAZVHaRP12LeVZ0eMxcUQq2c6?=
 =?us-ascii?Q?7YDCA7nTeflHEh29xpqF6qFqCZ8Ai5AcHXxFCiCiuDuikEBUioPRcOs5onsx?=
 =?us-ascii?Q?I5PkzqFdsyE8hQcxAuFZSK5WPb0Y6Wb3cO6ohHNJ5W1LNXo/sHOuAqIPp4DY?=
 =?us-ascii?Q?uRDdPbJN95k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gzIiH7NUhKIFFdeko9CB9tKPUnxWMchqprrqJxJGPQ/nwGmSSFaJoxKQ8t1N?=
 =?us-ascii?Q?BY9m76e2ImM4Vm0R0IFTcC9U2Pu8O7gpVGVVRilg2TZVN+vzb94vvi91+GDT?=
 =?us-ascii?Q?ls19rI5U6ip2Y+9JlWk2eulsZrMMk1oxzNFs7+aNqrVsonlQmqsyQTtVrJoj?=
 =?us-ascii?Q?C8uSKNI7UlMl4r8Lmn/IF7E7FA2jL8MLCWyphVTsax8y8NnNzrMP4pM5SWKd?=
 =?us-ascii?Q?c4fqR1CNwn9+ihnu81ZWfUKTM5otbDsxNqEqmdTdMKTTXJC+BQN9w+XN+yPe?=
 =?us-ascii?Q?swG6oiziuYosGryV1CBqfZbORZrBsP4lKgVyANpzeBu7qAA7R3jqKmONrNJm?=
 =?us-ascii?Q?YkEkdNLEBQw0CU3qQZ+hHd1dGfJWg+Sjg4dlRno7nMFUhifoXT4j9MSWDzoF?=
 =?us-ascii?Q?c/KiIISfsIj6RvfHq9sdcN8KuwrkW0fbaLzCpWs8enFr18WgupyPB/E7pOQo?=
 =?us-ascii?Q?jrOInb2QAe3UIyxyxizUvA71t9587hINyvhuZg3wLZHW7xoOK1yMcE+a18Yy?=
 =?us-ascii?Q?D7U6Ia+qr31mXgLvc+ZghPSoMdD8u5lCLN6z0k7LKNVWyxjIwJQiv8henNEr?=
 =?us-ascii?Q?NxCK5JlzUMgdY0epuv6KfHdH6E6xiSBVUC5fULjM+U47V/+oZiQN9RQbrajb?=
 =?us-ascii?Q?It6iXoRa7oB6+1AKFUBtnl8tHGK//YV57kkkKHC6v7mo1pTp8GWmG9kCTi4u?=
 =?us-ascii?Q?UaJ980mnSz9rR1LkJWhy/MvqIoUYZtp/U1p2DqK70IxVU+YEe76Vy6O2cF4G?=
 =?us-ascii?Q?24oUNClYfGyV8nhnDQyNBEYUMx2GbWFR4qi4t4sF0YsrdlJWsU/RxHboy1g6?=
 =?us-ascii?Q?f0zxX21F+HbZdgCW9Y8L++SDOO9bWPnY80eRfd8dpbkZj9tq+C8WIzYQq+RK?=
 =?us-ascii?Q?dWQWocprEZkAzWXBMorj1hHRpMPqcy6cKNK3Ju4CBesgSBxdNOE6cyeH8Z7n?=
 =?us-ascii?Q?bXigpu2A5ufCTBHahlRibQauTGtoZROYq5XhE5Mtuak/0mfaaqcqCUM8M44F?=
 =?us-ascii?Q?h9VCYYnv0IkU7jt2wThNSXKwptODuYhGNGvLD72hwNX54iLne0Spq1DnOXlo?=
 =?us-ascii?Q?VJ48YOTZCeQN035eFlvseegmA4FBOVXSWEfRaoUbNk2bigODzqcqVwFHH6VH?=
 =?us-ascii?Q?gwy+T1Zv5KS44A21MdAkjtmzWPSzlYU9VaaE6W/VwRKDUwQR1+9LzDXs2KRZ?=
 =?us-ascii?Q?53YfNcEzjFd0NMmxbBPp3VZMxadlveo1P3HMbMGvuEcmrvOfY/OItB5Lz5Mh?=
 =?us-ascii?Q?cJ195wYDPifs2NLgNVUXoi5oyae5/VZunpyXQ4Z9+rv161EnOCQsyTIcbnUK?=
 =?us-ascii?Q?LNn0HvLfQecajcl4UpqLIuc1JgwHajfnUXS2iVpuDUhTFz5EGOUEpkqxJS3F?=
 =?us-ascii?Q?JvKbKyqMh4vkBXdAyzYaG6gHYqGG0PDVqqP9iUTM7ydPyeI3J50LpAN++QfO?=
 =?us-ascii?Q?AM2I/rlCwRo/qyeqFLvDAbHKforL+VnTJLg2CsC9MVWSDWE2m5bTgNWey1Xb?=
 =?us-ascii?Q?wmvPn7/j6KEncWf2/a/YkaSjS26N4HlY76+rAXjK9AiEV9UPnD0sUQGhOiO2?=
 =?us-ascii?Q?oxYwV/T2ykxB66UZ2Gwm5uCpc8H9Axo3gRmFQfza8Gpdms5QO5T/E3qPJA3F?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 369d73fb-6dc2-400a-be47-08ddd63e60dc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 05:42:35.9424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ynlPBHtu/Svs9zMKtixrRYgUA7KXJyUj2Gh+bbMY6X9OfO87VO2lZheMIOIPkRBOMMpog7OMAMJISAIu1Pp8XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
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

On Thu, Aug 07, 2025 at 10:13:26PM +0530, Himal Prasad Ghimiray wrote:

Nit: you have an extra space here, between 'svm :'

'drm/xe/svm : Add svm ranges migration policy on atomic access'

Otherwise LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> If the platform does not support atomic access on system memory, and the
> ranges are in system memory, but the user requires atomic accesses on
> the VMA, then migrate the ranges to VRAM. Apply this policy for prefetch
> operations as well.
> 
> v2
> - Drop unnecessary vm_dbg
> 
> v3 (Matthew Brost)
> - fix atomic policy
> - prefetch shouldn't have any impact of atomic
> - bo can be accessed from vma, avoid duplicate parameter
> 
> v4 (Matthew Brost)
> - Remove TODO comment
> - Fix comment
> - Dont allow gpu atomic ops when user is setting atomic attr as CPU
> 
> v5 (Matthew Brost)
> - Fix atomic checks
> - Add userptr checks
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c         | 23 ++++++++------
>  drivers/gpu/drm/xe/xe_svm.c        | 50 ++++++++++++++++++------------
>  drivers/gpu/drm/xe/xe_vm.c         | 39 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h         |  2 ++
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 15 ++++++++-
>  5 files changed, 99 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 593fef438cd8..6f5b384991cd 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -640,28 +640,31 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
>   *    - In all other cases device atomics will be disabled with AE=0 until an application
>   *      request differently using a ioctl like madvise.
>   */
> -static bool xe_atomic_for_vram(struct xe_vm *vm)
> +static bool xe_atomic_for_vram(struct xe_vm *vm, struct xe_vma *vma)
>  {
> +	if (vma->attr.atomic_access == DRM_XE_ATOMIC_CPU)
> +		return false;
> +
>  	return true;
>  }
>  
> -static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_bo *bo)
> +static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_vma *vma)
>  {
>  	struct xe_device *xe = vm->xe;
> +	struct xe_bo *bo = xe_vma_bo(vma);
>  
> -	if (!xe->info.has_device_atomics_on_smem)
> +	if (!xe->info.has_device_atomics_on_smem ||
> +	    vma->attr.atomic_access == DRM_XE_ATOMIC_CPU)
>  		return false;
>  
> +	if (vma->attr.atomic_access == DRM_XE_ATOMIC_DEVICE)
> +		return true;
> +
>  	/*
>  	 * If a SMEM+LMEM allocation is backed by SMEM, a device
>  	 * atomics will cause a gpu page fault and which then
>  	 * gets migrated to LMEM, bind such allocations with
>  	 * device atomics enabled.
> -	 *
> -	 * TODO: Revisit this. Perhaps add something like a
> -	 * fault_on_atomics_in_system UAPI flag.
> -	 * Note that this also prohibits GPU atomics in LR mode for
> -	 * userptr and system memory on DGFX.
>  	 */
>  	return (!IS_DGFX(xe) || (!xe_vm_in_lr_mode(vm) ||
>  				 (bo && xe_bo_has_single_placement(bo))));
> @@ -744,8 +747,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  		goto walk_pt;
>  
>  	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
> -		xe_walk.default_vram_pte = xe_atomic_for_vram(vm) ? XE_USM_PPGTT_PTE_AE : 0;
> -		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo) ?
> +		xe_walk.default_vram_pte = xe_atomic_for_vram(vm, vma) ? XE_USM_PPGTT_PTE_AE : 0;
> +		xe_walk.default_system_pte = xe_atomic_for_system(vm, vma) ?
>  			XE_USM_PPGTT_PTE_AE : 0;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index c2306000f15e..c660ccb21945 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -789,22 +789,9 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
>  	return true;
>  }
>  
> -/**
> - * xe_svm_handle_pagefault() - SVM handle page fault
> - * @vm: The VM.
> - * @vma: The CPU address mirror VMA.
> - * @gt: The gt upon the fault occurred.
> - * @fault_addr: The GPU fault address.
> - * @atomic: The fault atomic access bit.
> - *
> - * Create GPU bindings for a SVM page fault. Optionally migrate to device
> - * memory.
> - *
> - * Return: 0 on success, negative error code on error.
> - */
> -int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> -			    struct xe_gt *gt, u64 fault_addr,
> -			    bool atomic)
> +static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> +				     struct xe_gt *gt, u64 fault_addr,
> +				     bool need_vram)
>  {
>  	struct drm_gpusvm_ctx ctx = {
>  		.read_only = xe_vma_read_only(vma),
> @@ -812,9 +799,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
>  		.check_pages_threshold = IS_DGFX(vm->xe) &&
>  			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K : 0,
> -		.devmem_only = atomic && IS_DGFX(vm->xe) &&
> -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
> -		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
> +		.devmem_only = need_vram && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
> +		.timeslice_ms = need_vram && IS_DGFX(vm->xe) &&
>  			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
>  			vm->xe->atomic_svm_timeslice_ms : 0,
>  	};
> @@ -917,6 +903,32 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	return err;
>  }
>  
> +/**
> + * xe_svm_handle_pagefault() - SVM handle page fault
> + * @vm: The VM.
> + * @vma: The CPU address mirror VMA.
> + * @gt: The gt upon the fault occurred.
> + * @fault_addr: The GPU fault address.
> + * @atomic: The fault atomic access bit.
> + *
> + * Create GPU bindings for a SVM page fault. Optionally migrate to device
> + * memory.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> +			    struct xe_gt *gt, u64 fault_addr,
> +			    bool atomic)
> +{
> +	int need_vram;
> +
> +	need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
> +	if (need_vram < 0)
> +		return need_vram;
> +
> +	return __xe_svm_handle_pagefault(vm, vma, gt, fault_addr, need_vram ? true : false);
> +}
> +
>  /**
>   * xe_svm_has_mapping() - SVM has mappings
>   * @vm: The VM.
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 376850a22be2..aa8d4c4fe0f0 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4183,6 +4183,45 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>  	kvfree(snap);
>  }
>  
> +/**
> + * xe_vma_need_vram_for_atomic - Check if VMA needs VRAM migration for atomic operations
> + * @xe: Pointer to the XE device structure
> + * @vma: Pointer to the virtual memory area (VMA) structure
> + * @is_atomic: In pagefault path and atomic operation
> + *
> + * This function determines whether the given VMA needs to be migrated to
> + * VRAM in order to do atomic GPU operation.
> + *
> + * Return:
> + *   1        - Migration to VRAM is required
> + *   0        - Migration is not required
> + *   -EACCES  - Invalid access for atomic memory attr
> + *
> + */
> +int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic)
> +{
> +	if (!IS_DGFX(xe) || !is_atomic)
> +		return 0;
> +
> +	/*
> +	 * NOTE: The checks implemented here are platform-specific. For
> +	 * instance, on a device supporting CXL atomics, these would ideally
> +	 * work universally without additional handling.
> +	 */
> +	switch (vma->attr.atomic_access) {
> +	case DRM_XE_ATOMIC_DEVICE:
> +		return !xe->info.has_device_atomics_on_smem;
> +
> +	case DRM_XE_ATOMIC_CPU:
> +		return -EACCES;
> +
> +	case DRM_XE_ATOMIC_UNDEFINED:
> +	case DRM_XE_ATOMIC_GLOBAL:
> +	default:
> +		return 1;
> +	}
> +}
> +
>  /**
>   * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
>   * @vm: Pointer to the xe_vm structure
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 0d6b08cc4163..05ac3118d9f4 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -171,6 +171,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>  
>  struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
>  
> +int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic);
> +
>  int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index b861c3349b0a..95258bb6a8ee 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -85,7 +85,20 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>  			   struct xe_vma **vmas, int num_vmas,
>  			   struct drm_xe_madvise *op)
>  {
> -	/* Implementation pending */
> +	int i;
> +
> +	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC);
> +	xe_assert(vm->xe, op->atomic.val <= DRM_XE_ATOMIC_CPU);
> +
> +	for (i = 0; i < num_vmas; i++) {
> +		if ((xe_vma_is_userptr(vmas[i]) &&
> +		     !(op->atomic.val == DRM_XE_ATOMIC_DEVICE &&
> +		       xe->info.has_device_atomics_on_smem)))
> +			continue;
> +
> +		vmas[i]->attr.atomic_access = op->atomic.val;
> +	/*TODO: handle bo backed vmas */
> +	}
>  }
>  
>  static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
> -- 
> 2.34.1
> 
