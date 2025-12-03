Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66C2D1CDAB
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 23:15:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8666D10E19E;
	Wed,  3 Dec 2025 23:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XaYBHLYv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF9410E19E
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 23:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764803735; x=1796339735;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1rAjWb6OsHmevSMU+qfNj5HbAOpzzgGtAh6EKNZh8cU=;
 b=XaYBHLYvAN5eOd83fT3USgqkN1IueWb1CDKWpqa/MnC6/1KyIRraq7Db
 B9x8TrAhvm14FfjjLFzNg6UWxvJTj7kkISBQgrNrx9WSFwism1s6ExyyK
 8Jj/cTP6PHGKZDP5f5LdQ2+eLRcLzj7xiM5/2HKS+g0lcUXYadEfNWjLZ
 0KGsyxQMSFFKxZampQvdNWFE5YtSvj4SVjM4miK9h+OdSpjrwE8Dnhf8d
 fcQCON1jTpkHzXpvt6voDehZbuLx8/y0vjFJe01n7etiE4QB7AUVqZb3h
 AGwXUTlnjSz/HOm2bzOAMVaJ5Tl7IMIiaT0v4UyU1wV1vig37wVPawWKl g==;
X-CSE-ConnectionGUID: 3g9UlfaQTrq3EhoHmB+AwA==
X-CSE-MsgGUID: Qi1vUt/LRb6QFOMlpnROXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66539501"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="66539501"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 15:15:34 -0800
X-CSE-ConnectionGUID: 6eJqu+gHTdSJ1dfZechydQ==
X-CSE-MsgGUID: w2thRmGkQ2KPZths4/gBuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="194105966"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 15:15:35 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 15:15:34 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 15:15:34 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 15:15:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wtk2mbmBKD1eoHzZBI0VXHVfq51FgTsZWWiBNYms/sfVclhLQUQj9OBGlGdoFS4mtOvs+P7Weos8eXKmwn2GjNbmFbYBG3BndDLGKZGdkgADPBdlyrHR6vVIDi6NAzo1dHKjd2fkdr7SwdKRGrI6K8VwebNdMU8SKi6YThwV1FG98UNT1lPE9LsJ27sDGsb1OzaSWLzTp2eAqxqCF00xh+g4ILoJThzA5gL39l0gPUftSgptbTnNXbKioP0kHI/R5BtcaC3QJDHzzuDB3EPu4sUgAiUgD8hVPLBf2CBF+QRhUZUE4kZgfDd1f46Fs7EaLTFT8wT2fDqrXjdEUJqrTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJ3935n5X+6YE4BIHRJgfn+FG/jRd29gE5ezyhwEJXc=;
 b=trFoRorWzvFPpGgNUR2NXlYZPS2Y+vRGCHX94yCu5eaRIsVgxW4n3ppYmePHs1YejL63UJX1zBH4pGrgXm9nalEBxqGsxngZ2DpDkkliJtPl1L3nS9/L5UQAN4vBMX0B1CJIvq/Dgp8UXy8yHWa/F4irTlEpsrV4bAwwyepIPHWhYOIA/qIHIpg9KXt09Spqz7dE/Rv24PfA2zznwaJU8T+jAIG7+9osUMlQkjjT4FK5UeNO2rgz7VNBkyddF9VVUocGWFD/wRLbY1hheVDfDyLz9wx0sV71WDFXho7iGb3MgghHIA59kiQSJYqVlXiP4r7cbxglgUaT078SAF7Dsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 23:15:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 23:15:28 +0000
Date: Wed, 3 Dec 2025 15:15:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>
Subject: Re: [PATCH v2 09/11] drm/xe: Append page reclamation action to tlb
 inval
Message-ID: <aTDEjdp0P1CYUBCM@lstrano-desk.jf.intel.com>
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
 <20251126230201.3782788-22-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251126230201.3782788-22-brian3.nguyen@intel.com>
X-ClientProxiedBy: MW4PR03CA0346.namprd03.prod.outlook.com
 (2603:10b6:303:dc::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6197:EE_
X-MS-Office365-Filtering-Correlation-Id: 42c19583-f453-4bf5-9830-08de32c1d8be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2SiIojvvTGtM7Sd33w8zMbvGs2q0Kj+FUoQPsOXVLIhOt/O65y8DRHUHZbFm?=
 =?us-ascii?Q?DIu6wbQIssH/f1i4QGVQt8bUgVuMsKIKAVIxnwa2KlG9UxrIqAv16XZxvYhj?=
 =?us-ascii?Q?e3+ZQMyR/HTQaQIyA/MaPeDCV4WTsWAN+eXBlL/qI7cYV1TMkRwzxNdPlFO1?=
 =?us-ascii?Q?PmeczjekXihSCUj+KKBBYIfeqV4epNxy0KdKKVJrCrcZmmpsOr5vq7EFxOxA?=
 =?us-ascii?Q?qzvYDd0XYJZ5kzX+6letVJaZD+J0qJLGuCuBde0lDCNVfn4RplfCgwtxuego?=
 =?us-ascii?Q?5OM1CsWpjyn8qGcvcTVslvy/BOpzOSWap5/fBVNS8C7DiH5hdtW5Tn0xD1eC?=
 =?us-ascii?Q?IdfRBGCNLV7koKkXcyIVXqr5cpiMa3pQK00cl2SN4h1KMZHu3GMwcjmGP4sL?=
 =?us-ascii?Q?PBvZgpbPkP4vqM9qLRKv9rQIpLnpfOTeou50fjH+DH4+wvxk1un9p6kSoGT7?=
 =?us-ascii?Q?X8W/ihVkAOjdUNb8b014bIbXsaRtANIXkcSUJ6fZtJ8/nhF45KuMng4+mDzq?=
 =?us-ascii?Q?+fSzhoijFYxAXL9EZDa9jkbwmD2oVWOX+qP50xoV2dXuE4oU5P8GryfLg1md?=
 =?us-ascii?Q?/KB49QGvOEzsQXfSDYjw/O7YxeZiaVM+Z17OMPCR2Ejz9/jsNtum/ZJrlg5C?=
 =?us-ascii?Q?v5FuEy+kQqD5RgF7cKRo3dTmkLOLIkGT/GYRi6KsJ8ywF0YqMJ2vAFZy3Le2?=
 =?us-ascii?Q?RKFelWSPb9dVSeXF6Fo9YQYtzYU086zXxOOa6+Nrcx94dgwrsAyvLQjF6Bc1?=
 =?us-ascii?Q?rKLxUd0zG0nFmJGK5K7udFBuzvz6AHCCr0KtXYvpbiITvCYrWHvRWk5nwfZV?=
 =?us-ascii?Q?Mmu8/LVSiG6VZL72A88aO2Y3BmR1cE8wt/RYwRFyyiXHQHH7CpohsOXFOvjk?=
 =?us-ascii?Q?ia1KiJXy53f+Lz/Ew45HkjDzX1wpcPzic6ZNZifCeQEDPs6+okLSkH6ZKjSJ?=
 =?us-ascii?Q?Mm1NwogYKigoZ/Yp6NZ3JUA3PMFXSAQAGGUM2LdHpw+1wp1gV/AoHInBfBv4?=
 =?us-ascii?Q?Q4xOs1nULSasxDYo5qMSRQ/nnTBRRvzOJzSi49BtDEOI3h+6ueitHn8+ugVp?=
 =?us-ascii?Q?PcvXPhGUq8dLqRSL6myIrMV/cyDcxc97SPyA/5qQgN7QLORVp9o3fzI2oQBo?=
 =?us-ascii?Q?SwXKKd8ewZCg8M6EKK/VjM3vusJFHCEo1S2jW+cMUTSkDkaOZqC6xW5vSBDG?=
 =?us-ascii?Q?mm8LaDDPDyZ7IK31iOhlCl/oRsWZwDsgbPvvPo+kPnjoTTwrxCr59wDnIbT1?=
 =?us-ascii?Q?2HGuQf8qDcEA1N4VvkfVXVVpjqJGDX35JEUadFpJ15gybEK5CetUpoVrn1Px?=
 =?us-ascii?Q?M/2fYfTrXKHKtOC8bG2cgrPxO8Ec1P/w4rmf7kKouLD9skNC6AtLDfBKtwiZ?=
 =?us-ascii?Q?5dK2wM3LVFJKDStOmh3HpohBr8TBY/jYlK11KT9jBJankkIinaIrxn9q7f9+?=
 =?us-ascii?Q?mh8Hc+vSoEgPYoHbbjRyazOAfP1NaOb+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a6ln8IYHl4lRRPfek2AEB9KmxTzw+T6ClEkTkNqdT5oBmsas8zv3dkf1MlRT?=
 =?us-ascii?Q?pbD2kiRnWKk4fkUtjsBNt38d/YxM9OP9kdDkRpZJ+IccF1FwXDwmjUSWAoT3?=
 =?us-ascii?Q?GDBQy9QLobOIhjWxvFX9s8moB5VDWs1LqcMGwOHp9ORUTz0+3nYAuC8KZO4+?=
 =?us-ascii?Q?DgYqO1O6QUWXEkseUDi5AixVSZlN5PiuNXISsaZXaDLTu8eX10JN9pOkBwO8?=
 =?us-ascii?Q?802A654yNjkk5Qc6uQO/m+mIOS8gKztiXdrXMadnwGbf7knHDOqEa9wIhS6P?=
 =?us-ascii?Q?z8B/H4xQPjTtJmePJFsOSBONmW36A6BJ7j6arqDoJql49wI1wYvWF9CNUJd6?=
 =?us-ascii?Q?Q/qoSSzjvABTDbmJzQMZ/iOLg4ZVocoVpsjJT9dGDC/QxVCzKKCA06APiQRG?=
 =?us-ascii?Q?P3+2yPt1weZV/eXHIp0cIce0qU7/OQuIntn6xj3E6TeY5r032Rs8XasZ+P4y?=
 =?us-ascii?Q?kr+HobRu1Om2F/A++iLRhJ/Q4KqEwqNZt1YjwVumpbc8CJOIuqT5RD38nUvA?=
 =?us-ascii?Q?+wfjdWb3zoB8mT28T9M8WXJ6VkN1DP3VhRR1htNHYApkwiDOARY87xi/STUZ?=
 =?us-ascii?Q?XvT+YfZlpVwbinUHeomJwuqP37Pi2Wd4j81Y8FFKiPvIfAzokc2yBB3Nrknv?=
 =?us-ascii?Q?3OrBhsK8wmdNqanL0saNaDgZwW9Y3fXiUdJbq9TPz1BXhy8FhTKd7TaXcf7r?=
 =?us-ascii?Q?+uYvTPpqw2oM/poBNvKxaTmOkM5cMGTbX0moPUcmsik4szEFqexZhPlbke0L?=
 =?us-ascii?Q?dQPFVt+e6UA94H4E26htN8LOtpJgcchtv/Ff5BxYVYUsQoyKLjD3EQHEGOP5?=
 =?us-ascii?Q?+HIST8kwfCndCT7itpGMMCf2fIBTOozcTBrLK06QNEqlAhrP3nBghx2L3DvL?=
 =?us-ascii?Q?lZi6wpLxqT5QNO97KfuzDIK5i9OEY/cz6W4iASZ/zzKQSEXEaEyLXkGMolXa?=
 =?us-ascii?Q?995HGoYarFlW1uQryJT2hbh8/DPw16RqSdgXYaEKsMWs6R8uTcQZj0w1vPbB?=
 =?us-ascii?Q?kkarvbahdBS8rmLN/gpakbRevrOLOPr6QgfbOhPUerKm40WGmNfYQ+dHIRkb?=
 =?us-ascii?Q?EGAUn6qcjZZhTlTmpZf2RirHFK529280DE9or/lHDf5GGZg/6rR9gLr2pGxC?=
 =?us-ascii?Q?XdVNXAW1BesH2GnhlaS8YstbTEPiwttT/on1jDQpT1D8q5bNE5iBHlj2Yshh?=
 =?us-ascii?Q?aUD1GuON1oWmZop+ZZv9mr6rMm3ynT4nTLWY4XqauEsEXiHYCacswPKAdV4K?=
 =?us-ascii?Q?XxVyH9Xw8EQIQS8dUbxVltwNzi+yEO3hoZUQhA8uRwLVyyFYywzv7/hmHZmk?=
 =?us-ascii?Q?UM0/0w3Z/HyTLmNVZr5J9J+dtWexPX3joTN+FG3LM2B7ZAQ2uiKYotasbs72?=
 =?us-ascii?Q?OtWq9owlgHZ8xPfhZmKQZi/iG6cwVJGWmozLEqr97mcyeb7t+5ic5A+OSVt+?=
 =?us-ascii?Q?eHwsYw05hvDeQALhvV256o9NkxJJ/w3Dk1y0INxeL6v+gYZdoHUCsR6i8r+Q?=
 =?us-ascii?Q?3Olss98LjAftvURNDJUNDWXC+ICT+C3jDRF/UuL8uhmPUQ5aeT/vPCjwUiz8?=
 =?us-ascii?Q?lkoJNvyoC9qECKKBWQsRLt7ZIgQBmYg/fNkq4ESIfA4lIX74w4kvtQKi1sEv?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c19583-f453-4bf5-9830-08de32c1d8be
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 23:15:28.1121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OXDJkiZjyV5h6cyFdztFGcTlN7v9S5z+QoBFVABVjMrJRNqbSABGfBXnBCYAd63Q3YW4OwgTv8hNZp9VywbvSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6197
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

On Thu, Nov 27, 2025 at 07:02:10AM +0800, Brian Nguyen wrote:
> Add page reclamation action to tlb inval backend. The page reclamation
> action is paired with range tlb invalidations so both are issued at the
> same time.
> 
> Page reclamation will issue the TLB invalidation with an invalid seqno
> and a H2G page reclamation action with the fence's corresponding seqno
> and handle the fence accordingly on page reclaim action done handler.
> 
> If page reclamation fails, tlb timeout handler will be responsible for
> signalling fence and cleaning up.
> 
> v2:
>  - add send_page_reclaim to patch.
>  - Remove flush_cache and use prl_sa pointer to determine PPC flush
>    instead of explicit bool. Add NULL as fallback for others. (Matthew B)
> 
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 29 ++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_tlb_inval.c       |  7 +++---
>  drivers/gpu/drm/xe/xe_tlb_inval.h       |  2 +-
>  drivers/gpu/drm/xe/xe_tlb_inval_job.c   |  2 +-
>  drivers/gpu/drm/xe/xe_tlb_inval_types.h |  4 +++-
>  drivers/gpu/drm/xe/xe_vm.c              |  4 ++--
>  6 files changed, 35 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> index 37ac943cb10f..ffea9c0c5cd0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> @@ -13,6 +13,7 @@
>  #include "xe_guc_tlb_inval.h"
>  #include "xe_force_wake.h"
>  #include "xe_mmio.h"
> +#include "xe_sa.h"
>  #include "xe_tlb_inval.h"
>  
>  #include "regs/xe_guc_regs.h"
> @@ -93,6 +94,20 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
>  	return -ECANCELED;
>  }
>  
> +static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
> +			     u64 gpu_addr)
> +{
> +	u32 action[] = {
> +		XE_GUC_ACTION_PAGE_RECLAMATION,
> +		seqno,
> +		lower_32_bits(gpu_addr),
> +		upper_32_bits(gpu_addr),
> +	};
> +
> +	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +			      G2H_LEN_DW_PAGE_RECLAMATION, 1);
> +}
> +
>  /*
>   * Ensure that roundup_pow_of_two(length) doesn't overflow.
>   * Note that roundup_pow_of_two() operates on unsigned long,
> @@ -101,20 +116,21 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
>  #define MAX_RANGE_TLB_INVALIDATION_LENGTH (rounddown_pow_of_two(ULONG_MAX))
>  
>  static int send_tlb_inval_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
> -				u64 start, u64 end, u32 asid)
> +				u64 start, u64 end, u32 asid,
> +				struct drm_suballoc *prl_sa)
>  {
>  #define MAX_TLB_INVALIDATION_LEN	7
>  	struct xe_guc *guc = tlb_inval->private;
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	u32 action[MAX_TLB_INVALIDATION_LEN];
>  	u64 length = end - start;
> -	int len = 0;
> +	int len = 0, err;
>  
>  	if (guc_to_xe(guc)->info.force_execlist)
>  		return -ECANCELED;
>  
>  	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
> -	action[len++] = seqno;
> +	action[len++] = !prl_sa ? seqno : TLB_INVALIDATION_SEQNO_INVALID;
>  	if (!gt_to_xe(gt)->info.has_range_tlb_inval ||
>  	    length > MAX_RANGE_TLB_INVALIDATION_LENGTH) {
>  		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
> @@ -155,7 +171,7 @@ static int send_tlb_inval_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
>  						    ilog2(SZ_2M) + 1)));
>  		xe_gt_assert(gt, IS_ALIGNED(start, length));
>  
> -		action[len++] = MAKE_INVAL_OP_FLUSH(XE_GUC_TLB_INVAL_PAGE_SELECTIVE, true);
> +		action[len++] = MAKE_INVAL_OP_FLUSH(XE_GUC_TLB_INVAL_PAGE_SELECTIVE, !prl_sa);
>  		action[len++] = asid;
>  		action[len++] = lower_32_bits(start);
>  		action[len++] = upper_32_bits(start);
> @@ -164,7 +180,10 @@ static int send_tlb_inval_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
>  
>  	xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
>  
> -	return send_tlb_inval(guc, action, len);
> +	err = send_tlb_inval(guc, action, len);
> +	if (!err && prl_sa)
> +		err = send_page_reclaim(guc, seqno, xe_sa_bo_gpu_addr(prl_sa));
> +	return err;
>  }
>  
>  static bool tlb_inval_initialized(struct xe_tlb_inval *tlb_inval)
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
> index a122fbb9fc4a..dec042248164 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> @@ -313,6 +313,7 @@ int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
>   * @start: start address
>   * @end: end address
>   * @asid: address space id
> + * @prl_sa: suballocation of page reclaim list if used, NULL indicates PPC flush
>   *
>   * Issue a range based TLB invalidation if supported, if not fallback to a full
>   * TLB invalidation. Completion of TLB is asynchronous and caller can use
> @@ -322,10 +323,10 @@ int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
>   */
>  int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
>  		       struct xe_tlb_inval_fence *fence, u64 start, u64 end,
> -		       u32 asid)
> +		       u32 asid, struct drm_suballoc *prl_sa)
>  {
>  	return xe_tlb_inval_issue(tlb_inval, fence, tlb_inval->ops->ppgtt,
> -				  start, end, asid);
> +				  start, end, asid, prl_sa);
>  }
>  
>  /**
> @@ -341,7 +342,7 @@ void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval, struct xe_vm *vm)
>  	u64 range = 1ull << vm->xe->info.va_bits;
>  
>  	xe_tlb_inval_fence_init(tlb_inval, &fence, true);
> -	xe_tlb_inval_range(tlb_inval, &fence, 0, range, vm->usm.asid);
> +	xe_tlb_inval_range(tlb_inval, &fence, 0, range, vm->usm.asid, NULL);
>  	xe_tlb_inval_fence_wait(&fence);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
> index 05614915463a..858d0690f995 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
> @@ -23,7 +23,7 @@ int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
>  void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval, struct xe_vm *vm);
>  int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
>  		       struct xe_tlb_inval_fence *fence,
> -		       u64 start, u64 end, u32 asid);
> +		       u64 start, u64 end, u32 asid, struct drm_suballoc *prl_sa);
>  
>  void xe_tlb_inval_fence_init(struct xe_tlb_inval *tlb_inval,
>  			     struct xe_tlb_inval_fence *fence,
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> index 2185f42b9644..b59e322e499d 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> @@ -60,7 +60,7 @@ static struct dma_fence *xe_tlb_inval_job_run(struct xe_dep_job *dep_job)
>  	}
>  
>  	xe_tlb_inval_range(job->tlb_inval, ifence, job->start,
> -			   job->end, job->vm->usm.asid);
> +			   job->end, job->vm->usm.asid, prl_sa);
>  
>  	return job->fence;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> index 7a6967ce3b76..48d1503e8460 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> @@ -9,6 +9,7 @@
>  #include <linux/workqueue.h>
>  #include <linux/dma-fence.h>
>  
> +struct drm_suballoc;
>  struct xe_tlb_inval;
>  
>  /** struct xe_tlb_inval_ops - TLB invalidation ops (backend) */
> @@ -40,12 +41,13 @@ struct xe_tlb_inval_ops {
>  	 * @start: Start address
>  	 * @end: End address
>  	 * @asid: Address space ID
> +	 * @prl_sa: Suballocation for page reclaim list
>  	 *
>  	 * Return 0 on success, -ECANCELED if backend is mid-reset, error on
>  	 * failure
>  	 */
>  	int (*ppgtt)(struct xe_tlb_inval *tlb_inval, u32 seqno, u64 start,
> -		     u64 end, u32 asid);
> +		     u64 end, u32 asid, struct drm_suballoc *prl_sa);
>  
>  	/**
>  	 * @initialized: Backend is initialized
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 8ab726289583..fc7fc8243326 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3924,7 +3924,7 @@ int xe_vm_range_tilemask_tlb_inval(struct xe_vm *vm, u64 start,
>  
>  		err = xe_tlb_inval_range(&tile->primary_gt->tlb_inval,
>  					 &fence[fence_id], start, end,
> -					 vm->usm.asid);
> +					 vm->usm.asid, NULL);
>  		if (err)
>  			goto wait;
>  		++fence_id;
> @@ -3937,7 +3937,7 @@ int xe_vm_range_tilemask_tlb_inval(struct xe_vm *vm, u64 start,
>  
>  		err = xe_tlb_inval_range(&tile->media_gt->tlb_inval,
>  					 &fence[fence_id], start, end,
> -					 vm->usm.asid);
> +					 vm->usm.asid, NULL);
>  		if (err)
>  			goto wait;
>  		++fence_id;
> -- 
> 2.52.0
> 
