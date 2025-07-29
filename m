Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF7AC87FCA
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 03:42:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B03510E5BA;
	Tue, 29 Jul 2025 03:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="juaaZV2o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8497910E5BA
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 03:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753760572; x=1785296572;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eLvl9/tvMTs/DP29gUfeizZLxLiBTlNrrCEAsQGN6M0=;
 b=juaaZV2oLHOO/E9a0XLAXlRPkddrqeJNBl5yu2qLVEFd/kjOytg2zYDS
 glddcsR4K5VI1ZY2iTUfZOJjybn7ZB4OxdtW2v1izksztd67LcwVnqsfv
 YDN+Qz2CX7oo57TjjItK0d2gNT7Q3Rwai/ISH3o/9EekHmVaCypFnkuEv
 827OHmDiSt++hQ6l2+Di8K1+4vJE4r84/OyC0hzEbwLfq/9AYkq59jc7N
 0MAyQm/QXHS0MnG1sVZjm5SNvSNntLnEi1nGj6vZTl8oMh8DQuBX29Vxs
 ogqR1HhEaT49H3PhTXDLkkZ05DhpDfdvZuZg+HySF1oTUsACUTd4l5irl Q==;
X-CSE-ConnectionGUID: 90pzyRV2QL+yl+30RBxOFQ==
X-CSE-MsgGUID: UCnAQ9tQSYScRtc5JlL9gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="66293372"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="66293372"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 20:42:48 -0700
X-CSE-ConnectionGUID: +jsgyCPOTEWyrTGv4jfjuw==
X-CSE-MsgGUID: QeqZP+iaRmqE4qPvW29UxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="166789265"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 20:42:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 20:42:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 20:42:46 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.73)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 20:42:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YBr/2Q+LH8gBBqmNhmoy27K416x/GpMbkuXkhzDDtSwsIMACOctrCg31xogEs57A62Z42jY6nCJWP1olKyr0KNPlV8xMlQVbe3HaqFuu0UNOJBHzDmQ8rYqaWaPSX91m4KO2ABV7HsF6i01WWOa3EoO4WO3U/7TepGHjZf6k7/WAnoRBe0kOrQpe/SbWxisYf/egvxtvH4b/xozt9OkmcXl/QGoa5hJEAa/4zIonM1cI0E2knAo0MfZhm3Qz+1mtVCU+dop5aAI5hl129XUW7TqVUfbyQIB4AJFwsjAgrYmSuopp5YoYHPzf+JZ9IObnY2HZDFqWSwtuL5e5960biw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLV+/1zpV1r1IykBPG2IspKvnArAcIGwXSlkU/rAD74=;
 b=iXf0huxjcG7WqQF/j8QFSz6pCmnEizgZFcmUycDA5fRbFbIGGN9gW7XwNAxjZWJd6Pcy72ni0KIYtcZO1Kf9Dn5oqLBeYziA5YTJ71yh7EsxGRci7G7GZwHrMIxOD4aOhGwMiubvBKlFRWlVpZqNhQhO1SByDCbiVsCLrvVCbL8S8n4WETinCo3KSSp2gVgM1BMlGcn+3bLloovQpoz3hv5LlvNvJ65KU97L7R4xM3OKH7GnCB9BGc1C7/niMx90wJaMzmWUeP4fMwabps0LLMSVdJMu3Y6mbBAtdgpz2EwZOSnzJOMcSHyBfPFlL0RAjRQ64OLlLqV62LqPszp6DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7102.namprd11.prod.outlook.com (2603:10b6:303:22b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 03:42:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 03:42:38 +0000
Date: Mon, 28 Jul 2025 20:42:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 09/23] drm/xe/svm: Add
 xe_svm_ranges_zap_ptes_in_range() for PTE zapping
Message-ID: <aIhDK460yE3NZv9r@lstrano-desk.jf.intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-10-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250722133526.3550547-10-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW2PR2101CA0002.namprd21.prod.outlook.com
 (2603:10b6:302:1::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7102:EE_
X-MS-Office365-Filtering-Correlation-Id: 91ca02ba-4878-4184-8ec3-08ddce51f6be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FyQeMuarpzBVpTPGutdQHkEcT3eHqymdtIrWppHt6Avn0b4ms4cjm5pCqBzV?=
 =?us-ascii?Q?bGQt7KcmUAS+vd1Y6QXCzzVRiWx+4In9nRHGNtccW5tMf1E85GUmp0JYGAsC?=
 =?us-ascii?Q?qnudMv7UaFqppBTi8rx33wXhsqoK6Keh288YRs+cjJG8AQNLietjJqBhomFm?=
 =?us-ascii?Q?BWupk1yLe+qEJ13L1w22fIlS8umEA+SA7l/Ag9H/dSK2rjNsxgWjGO3ufcQu?=
 =?us-ascii?Q?Kaa+QnV6q17bZOlTZBvFEtUG4ZslmxVlgJQIQx2+//Sa5NLpg3Pkriv6K9G1?=
 =?us-ascii?Q?B9q2CCfhUk2TfBG6N3aZwvrI5RRw/SuNRlnW7jjfPy0roimRkab+5yqzQ0pL?=
 =?us-ascii?Q?rxxCs7idYXRwe5fNey0fT+kbCtVrTVib1XIQ4p7lflICpqaOQS5Pqj9bOnyR?=
 =?us-ascii?Q?wmGdtwUJUWhgNjusYtB/sk6biRzmC8Y0j9Dz4L2feSrbCDH8YYErW3RApNvP?=
 =?us-ascii?Q?vfzy+hG2EchJe1YUgFYIDVhGNm3P4eDt+fwy7xYU/25KWhwcavAWAvkQ9pkn?=
 =?us-ascii?Q?s5esAi0ZYXyPzbN2WhhC6itPbM+R5gVdmh/9y46ILJvnDqucN9KAEwX3V5Or?=
 =?us-ascii?Q?xbuJEg4yXoLQxXMZVGrXZ5lDVefAxE8dS2BEYXd0+trkqujhwOgYvpxLQ+BN?=
 =?us-ascii?Q?lWlPd2gDAMa/8ZXuFNSd6sBtiIYP291fXo0dgmRp2OiMImfl5cMfOKLXVYpX?=
 =?us-ascii?Q?KM1zcKKpiY0uzac3bdBFUSdpUfRRd5eaoiLGi6DJTkOQ8x7vymNns11YJZaR?=
 =?us-ascii?Q?K2OOZsgN83NB9/kxdoS5jyzjZDlhDKg8NLqJxpBmk9+njPB8ok8vP+UfBiy4?=
 =?us-ascii?Q?b0s2tNEZ5Jrc+ZOiwWu9FhbX00394Xw2PaHEenNCbJvJjrk0YCjnmCkuYCOo?=
 =?us-ascii?Q?HqsjbWgw4BE3TQkKBtjX/HfMpS9GywmoVZmehs8GqDQBk3IDvni3kR9F4hAi?=
 =?us-ascii?Q?CZwMPE0arUaOU/gBRIJaDmG+H/blkCsK17Av+icEy0Rq5iqeW/LOOLVMMhAT?=
 =?us-ascii?Q?/Ik/lx8KpTanh4o/KxP9OGDQE1F8P6nNoFDzXJ2/6cdMt42FyJEdiuhbiRQs?=
 =?us-ascii?Q?LwQdzQvqMZL092W8WfwpJVWVGm1/vKYgxEa3a7+5MXIUtlmBU4bailHjl23F?=
 =?us-ascii?Q?qgIqQh1UQnd1C5yuMNTeDrdjm8P/QE8Jir1oxljXT4+xrB4TXTMX+1fArNG/?=
 =?us-ascii?Q?ZMMaYt5fHeTVOKfShKSmRdwKD4O9j3lnzFQtzFBcQ9hpo0jM0ZLxhS1xhKV0?=
 =?us-ascii?Q?IMrE5iHm8hTCuJxDBt4/KtCWbjoZPtXKIGiQ8zHSoMv9Fq4ghJauHl2v354G?=
 =?us-ascii?Q?zbofRS24qUMeDCspU035aOmmqbY4ejfhwCd2Nz4tq3HBSIPSSQF9EWmFyZZi?=
 =?us-ascii?Q?8ayiMnY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?abekGvP2+7CBnWzugfjwmR8Kz19zUClOQkG/arJ1fZNjq1cLHhVHG2CJeaoB?=
 =?us-ascii?Q?guscDC7vlMPnpxgOjEOmJjXYo7+xM/QIENliT6u7w6+qPCz/RSu86GKdB715?=
 =?us-ascii?Q?yTJekFY/KVHrdDDj1zmWk0cE1uLVxLubfVHlsYxX9MHfiLh4g8qf25nxWTXZ?=
 =?us-ascii?Q?nuQ4hSFB7QXbf0wJG38ow1Lnu7rx6FqU6CHitNU8olZbXQPFJMKbHeqlgNiA?=
 =?us-ascii?Q?ApOOvq1oFFOc5MGmsKDv8VOmldZ/ysvgVESGkiZfVK/JtsYK76Uwdx1vdjY7?=
 =?us-ascii?Q?nx1mmZ6Y7+gopEij59YCtvAl/vj428ATcRd0CgvulWdw5CBwmR+77uafRe0L?=
 =?us-ascii?Q?IWZ8gB2GSA4URS4wrA1mp9lhU+85EfdwvD0S0OJYfYS2/XMpSGa8U3BdRwjl?=
 =?us-ascii?Q?IsZtD+nf7lEnYZGoaDe2erHhKm4aQPElNKSOq6MDwPfHF40Vh/jMN3v6aifF?=
 =?us-ascii?Q?wzI1BVNPvl+m0QP55lxRwqne1lFP958FpkCG8/ZDbtJrlbKnVRsSFuarw19c?=
 =?us-ascii?Q?VakTEpJcXA2lNdjDx4q8Shi8UlD5KMLCVPJFlnmvAfXqyT6it9d4zaK32tfc?=
 =?us-ascii?Q?cQ4/7/PQAFm3rmI184dx7OTA7NKAN4vBiNydAn8ISFWdgTVAlEfcZDlyW0TN?=
 =?us-ascii?Q?U60vv2+FXgWvpBPyQvUks0LFIm+rhey15/4+zcozl9k6NiclUTH+HNeJ7WZe?=
 =?us-ascii?Q?SgryNK42hs1gcpFJ80y93I+ZltZuQ6CDdteObZ/ZBOvozd7UTIFVOQHIJn7C?=
 =?us-ascii?Q?MY6EJHciVtCmcn6Zyngcb8b+Pd7pW7vqLys2g5TqgG3jDFSqA5qSljCsFfB5?=
 =?us-ascii?Q?sLVSmiXUlB9MIXZirAWqW7PbjeFFIp4DSL/+EO/HDfLZ1NTeoA/Z5nsm/uI3?=
 =?us-ascii?Q?0x/KNWlViCGFHVvLFy9WTCaz2ZRkuufppChpvtyqRxfz+YAcj5+R24RH36wc?=
 =?us-ascii?Q?s2EsgSrQc4JjyKMLHHhlMTdxlrNQGSjOibi9C6c203tBydgCzOz+pOgAVBqw?=
 =?us-ascii?Q?+4Ja+Ual7y98EPQbhRpWjFsQieKo41qUVV2NV3BNXTnhoUEhwqmuFfQaT79s?=
 =?us-ascii?Q?4hKK+hCoJsy2S+DYk0QHVmmux7x14s5v0aG7l4AKjdXWzvNwhrKrHSt+S262?=
 =?us-ascii?Q?Xy9/hO8/a1o1rOsZfFAh1uFbrt1GBumBI8uqLC733YP3rAMCp15rmJ4joFkt?=
 =?us-ascii?Q?g+9AXCI8xyUC4QmbZmzscXe1IytfCAepT5TWLkElpZBXJSaKmi3EyhbuYLTz?=
 =?us-ascii?Q?7kHNUKBE43LGYOKAFzm4Nr/BIE+uMH5ycmRD6MH8BXqwTNQ3EBiOMXyAcoNg?=
 =?us-ascii?Q?gV6N1VKoB8ebVID3Q5OZrl0S9qCeqqLI88hp+Haqk2hNjAvSntsHZiHsWmv3?=
 =?us-ascii?Q?ML2LKqbd3B1sNSiF0RRJ3Y6/e4O+F6AGzkn3CEPfDVDBkVcAbQ7iQ2dHoiNx?=
 =?us-ascii?Q?aMkmN2Itu3er86alU1ZyzrIUgSFd3SmsuTfdLHLn/1U5QWrGcoz4u/30DN3J?=
 =?us-ascii?Q?5zuWO87LeEi0+zIwfemqcoeUTEJ4rZ3HJPR5yDTkgadVgdkv1upUQFgcB3tN?=
 =?us-ascii?Q?baBopII4trWwb2O3YzVGW/QY+WpM6T4GPf0V0zwJgaIL2tQBk//Ivotp9HPg?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ca02ba-4878-4184-8ec3-08ddce51f6be
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 03:42:38.4978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lup2qFC+hf1M4zXKKKCu2z7txFN6SnX2t7E/a5MvRoMYBb8DtA5OWI27T6RG6LcJ+8OIt9zPoAsyhLWEXNPuZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7102
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

On Tue, Jul 22, 2025 at 07:05:12PM +0530, Himal Prasad Ghimiray wrote:
> Introduce xe_svm_ranges_zap_ptes_in_range(), a function to zap page table
> entries (PTEs) for all SVM ranges within a user-specified address range.
> 
> -v2 (Matthew Brost)
> Lock should be called even for tlb_invalidation
> 
> v3(Matthew Brost)
> - Update comment
> - s/notifier->itree.start/drm_gpusvm_notifier_start
> - s/notifier->itree.last + 1/drm_gpusvm_notifier_end
> - use WRITE_ONCE
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c  | 14 ++++++++++-
>  drivers/gpu/drm/xe/xe_svm.c | 50 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_svm.h |  8 ++++++
>  3 files changed, 71 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 1bf0cf81513c..b499006df2cf 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -950,7 +950,19 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
>  	struct xe_pt *pt = vm->pt_root[tile->id];
>  	u8 pt_mask = (range->tile_present & ~range->tile_invalidated);
>  
> -	xe_svm_assert_in_notifier(vm);
> +	/*
> +	 * Locking rules:
> +	 *
> +	 * - notifier_lock (write): full protection against page table changes
> +	 *   and MMU notifier invalidations.
> +	 *
> +	 * - notifier_lock (read) + vm_lock (write): combined protection against
> +	 *   invalidations and concurrent page table modifications. (e.g., madvise)
> +	 *
> +	 */
> +	lockdep_assert(lockdep_is_held_type(&vm->svm.gpusvm.notifier_lock, 0) ||
> +		       (lockdep_is_held_type(&vm->svm.gpusvm.notifier_lock, 1) &&
> +		       lockdep_is_held_type(&vm->lock, 0)));
>  
>  	if (!(pt_mask & BIT(tile->id)))
>  		return false;
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index ce8a71b80811..c093dc453e32 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1025,6 +1025,56 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>  	return err;
>  }
>  
> +/**
> + * xe_svm_ranges_zap_ptes_in_range - clear ptes of svm ranges in input range
> + * @vm: Pointer to the xe_vm structure
> + * @start: Start of the input range
> + * @end: End of the input range
> + *
> + * This function removes the page table entries (PTEs) associated
> + * with the svm ranges within the given input start and end
> + *
> + * Return: tile_mask for which gt's need to be tlb invalidated.
> + */
> +u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
> +{
> +	struct drm_gpusvm_notifier *notifier;
> +	struct xe_svm_range *range;
> +	u64 adj_start, adj_end;
> +	struct xe_tile *tile;
> +	u8 tile_mask = 0;
> +	u8 id;
> +
> +	lockdep_assert(lockdep_is_held_type(&vm->svm.gpusvm.notifier_lock, 1) &&
> +		       lockdep_is_held_type(&vm->lock, 0));
> +
> +	drm_gpusvm_for_each_notifier(notifier, &vm->svm.gpusvm, start, end) {
> +		struct drm_gpusvm_range *r = NULL;
> +
> +		adj_start = max(start, drm_gpusvm_notifier_start(notifier));
> +		adj_end = min(end, drm_gpusvm_notifier_end(notifier));
> +		drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end) {
> +			range = to_xe_range(r);
> +			for_each_tile(tile, vm->xe, id) {
> +				if (xe_pt_zap_ptes_range(tile, vm, range)) {
> +					tile_mask |= BIT(id);
> +					/*
> +					 * WRITE_ONCE pairs with READ_ONCE in
> +					 * xe_vm_has_valid_gpu_mapping().
> +					 * Must not fail after setting
> +					 * tile_invalidated and before
> +					 * TLB invalidation.
> +					 */
> +					WRITE_ONCE(range->tile_invalidated,
> +						   range->tile_invalidated | BIT(id));
> +				}
> +			}
> +		}
> +	}
> +
> +	return tile_mask;
> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 754d56b4d255..b0da0e85f0b8 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -92,6 +92,8 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *v
>  
>  void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end);
>  
> +u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end);
> +
>  /**
>   * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>   * @range: SVM range
> @@ -310,6 +312,12 @@ void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end)
>  {
>  }
>  
> +static inline
> +u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
> +{
> +	return 0;
> +}
> +
>  #define xe_svm_assert_in_notifier(...) do {} while (0)
>  #define xe_svm_range_has_dma_mapping(...) false
>  
> -- 
> 2.34.1
> 
