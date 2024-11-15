Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58C1D68BDC
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 23:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7078010E3E6;
	Fri, 15 Nov 2024 23:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XON6EHmo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E267210E3E6
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 23:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731713039; x=1763249039;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e2xVBJjF/3zAFR1ODfYvEIDiqayKDx22JtMe4DHO2Rk=;
 b=XON6EHmoMUB4ggl5rY3X5j3hDpBpPJGzpQGvCJBmtB4VvKthwA22997r
 0Qznazc7pBVBtybPnW8TYQzi0NX+KpAQk47mR5oYNKIAArC/BBsENSHUj
 4kdqjcgh3icnlh84NvFdyScRRnCGJx3JNlJ5fwPATSf+X8MHkBOFTaRP8
 bniNX2q3fJdlAvgOMbVxrHy0nHgmyAUD/Cdi53p64QRH+kZX0jnHqAuvb
 EINw8A8+RJ0hiVq4Fu0uOx4JWqITNt8+OMlOK1IUWIQjPip1LfMqfzhB/
 BC4ep15+oB264lZDMHYiXF44hode4qzI2BXEVEb0/QNm/A79biajqAvVO w==;
X-CSE-ConnectionGUID: IfYdvY03SuOtabF6zfZ5gA==
X-CSE-MsgGUID: GDGhXFW/Rt6CNpVMaG31Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31492716"
X-IronPort-AV: E=Sophos;i="6.12,158,1728975600"; d="scan'208";a="31492716"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 15:23:59 -0800
X-CSE-ConnectionGUID: WarFfOwqTXib45DyI1waxg==
X-CSE-MsgGUID: nN5rSKiJSd6e+foZwCWalA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,158,1728975600"; d="scan'208";a="119536281"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 15:23:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 15:23:56 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 15:23:56 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 15:23:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+mdWJOkZk5IoNQw3jSxnYBKu8LA/BgCluYm4EKifHs6MN8vbkJWV3YPmT6M+3a0QU8vcBXfou1iuO9qzxoru2yzMNKDkfhAmFL0nP5FaUaaBAKz4omQFFGaM6zxxe75DEf4LBmwRJnMc6eY9gRoUA3fHjja0VdUjYRJ7kdHhYsjKAP3zy2KTYhYm4I8sW1szKkTZ17Eoe904n/26HZe2n331ReUjhrL4xuefiITLTN+HODRWpsTIg0nhufWkW6VLR2ykSPdjygzwqpHil4dCXf+r4enzyCBitVva4UhfgwIPm8CGZNjlCklgEP5KVe8ruYV1yCaDcNkwBdM+mzoIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AO5YEKLidd842ZwxJOdrZvyeyPP/jvOO7byNSCqDg80=;
 b=YtXzBh3ifc++liCpvp3QQwo1YHY5lUoL2HGIshlhhTpQ+oTjKTlyAoOWcrAwXurlTjErzxqntijRXlh7nfTo/lDqwsfS1rX7FNTzCgxH/GkOSsL9fRztz+jys27vJNN441mTs4hfbBJ3xCPzoFSo/4y/ueRIV4n1TtjjcyDC+Cqmrr/BQ+u4pbcVFmCFN7bQlF3t9XBQnkET5s4nwcA7VvNf0Sr5WlNvph22zeDoN9KN8Ehdp+AjWnX6p8BsYAcPq4kbzrHhd67UNRhCEkKQyxClyAsjTieshTgwaHX55R8YVeeZKPkUi7APFfLPcs1od0nrhYXVLG7hD2Qkc0rFtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV1PR11MB8841.namprd11.prod.outlook.com (2603:10b6:408:2b2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 23:23:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 23:23:52 +0000
Date: Fri, 15 Nov 2024 15:24:27 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Drop useless d3cold allowed message
Message-ID: <ZzfYK1jr6KTGxR0c@lstrano-desk.jf.intel.com>
References: <20241115192155.2050987-1-matthew.brost@intel.com>
 <ZzfCwCZr0byTqGj1@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZzfCwCZr0byTqGj1@intel.com>
X-ClientProxiedBy: MW4PR04CA0155.namprd04.prod.outlook.com
 (2603:10b6:303:85::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV1PR11MB8841:EE_
X-MS-Office365-Filtering-Correlation-Id: be5f7917-7953-4f51-c299-08dd05cc916a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QBmL4odS+6W5iXSpWjw50vxYgXRh8+O+B/qhFE+36n2gVKDqW9daVF8FXEaX?=
 =?us-ascii?Q?z9/nIwpTjebHLDM8yVZ5ewFLX8uoCsNDRFt3y5hFOgrcWjrujHnS37fS182U?=
 =?us-ascii?Q?uGjIwsV5eQJdqRAbLeyVa3T5xRMcHZs9jytSsCqW6TA57FQ67fLHtcXc3wsN?=
 =?us-ascii?Q?Fk5QGRz+VT/7SM77TNWFE8QmWGhv79PmDIkeWk8+p/B1hTYd58dg148eIK0e?=
 =?us-ascii?Q?lWtNzVaymEo6PLLvhV7rJLLopzTcowoTGu0G8bJae900ZUvESUUBLuDY6zMf?=
 =?us-ascii?Q?bYyAocjIKmDsVuJM+2YHEiz3RnbmQIj4Eq6TMVEsThLEFuWXKvic1ImbuELD?=
 =?us-ascii?Q?goQbtUJAEKSjbQRm7VvOAi0YW2GvitzVwRVlN5TeL9cTbh1bsIgAm6W177pO?=
 =?us-ascii?Q?ry0lYQPU2mCMXFQaJ+EHNH9HjB2qF7Uda1WUnrUp1ZeK2i/6qgUmqeXW/0vQ?=
 =?us-ascii?Q?H4a9C1o0JanRSfOryct5n80/ym2H4dikeTiXLw5d2FWQXnCI3uEJHwqY8veG?=
 =?us-ascii?Q?Ra93xdiz0sMvkZYib3cEzj6WLY3e20OcesFaPY5/GO8YvO6vxlwvi6y+sJ4+?=
 =?us-ascii?Q?9/yaRtP00DWrrAf1TWCtkABkrmc5c1omAUG3ekrqQVoHC3ydTfeyd40UhEVE?=
 =?us-ascii?Q?6HsCPv8BBIjK4+EwUgATbymUfgoaE2F3X7dYMPaIu0Rs2Gyf8HKD/B76FZlv?=
 =?us-ascii?Q?FJeQ78Yjvnrp+PsHOpAJf/6KDGzQCvOXMh2AfJyXpRNAn5x7wjpVJcQncxB3?=
 =?us-ascii?Q?ym1DML+Ru2SdXZp9hh/HIijVtk1iFRfceOckLxehoWRXi6JfqIkeB80YxU0c?=
 =?us-ascii?Q?FY72YxN2zLPAzoD+pnRSAB46QrX5JbY7+eKST01sPSvC4h5xAiPxJw8yBjj8?=
 =?us-ascii?Q?4Q8DUo01l8lZ0PDltzBXUqvs/RNgGW7RDZqQUAVbj7FjFWuS6oL4hLz7vb3e?=
 =?us-ascii?Q?6TMdvryIIoPFX0+VrArbYLMctz5hRHNMgVo/Cj5BxOYYDCvK5u9UNIAVlSaK?=
 =?us-ascii?Q?bJYNkqSvuIX9301K4jNOJfJslNVvuT4Ge4IeMdB+2oWtxBzyTeTOO4sDjXE7?=
 =?us-ascii?Q?jXDwiu25bePb91NKChrkJyWKvciOlBwH6lbvJWXtD6/qhQkdCHwcDTjTIsGx?=
 =?us-ascii?Q?IDzZbIpHG36/FbPX9sY7IvhWFhD7Fg6/rbwebLti/icBWxEszGHUPPYHDuPz?=
 =?us-ascii?Q?IJZn91QkxO97bt8it9co5qz6twjlZzIVU2q4Y5AEPJFBAe3/H5tCbjtzDtav?=
 =?us-ascii?Q?Ab4yejESB02vDLoieObU//BI9IxacEs6vakfghV0fYOvrH/HJYCJN06Ku15W?=
 =?us-ascii?Q?zO/UwP2vhk0CTCHnVn9lL+/Y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lk+zg9qjnYagUGn4k5wR5GaQHWnoeQ8yna0b7s++j2TEUiMoNkmJ2COCqzDd?=
 =?us-ascii?Q?qgUDfNmkVZimPRzM8pjRCQdx5b5p4d9jG0WJQDSysxq3ELlbpqEpeun4WeXj?=
 =?us-ascii?Q?Q0rTFxAtjVHOix9FFImIB56fXdygD5GtgRLfv/f7wsxjhiaE/SXR3kYgwFvp?=
 =?us-ascii?Q?QvDwnargOjIngFVQedoT6heprIIeB4rYmUTmFRE0irmaHLy5uAnBa7EHwi6o?=
 =?us-ascii?Q?TRW+USL/Zg8iSKKGld5O4MayOqC8HuolXLOW0dJcJUMZCE+ipBioLolItkGY?=
 =?us-ascii?Q?GYLwhPBy3cbwDXfoS69C2ghjpIall5nRVf4pWuDZd8ywKuz/VGaC6107XfrK?=
 =?us-ascii?Q?SmPB2RuGIhmT6AZCVDn56uHfGSWx+cObwEeoB32iSCnnMHo1wfyuqr6a/T8n?=
 =?us-ascii?Q?yaXU23WlDz0qdG+pVCS8O20dWXJSKTZO3umaUCu1Sa+NVli50de0ggJ6ggaF?=
 =?us-ascii?Q?uZwhMCizogPljNtkoJ9yRuEGrNTe1IfQ4BidVcVJwr3/fM0UOQYDxfvCV7Aa?=
 =?us-ascii?Q?WtpUpmzkqzGVNdUGTEwZGVUQf3732MGWkBlld1s0mQcBc3r7/UQMLU3IVMpL?=
 =?us-ascii?Q?huoA45oxXzYycsas+iNlkOWjHsyjyeBHd+cUF4VEePkykgj4bBZy/zaS6XV0?=
 =?us-ascii?Q?Bm0mqmzRZ1k4biKFCt4vJxn4lEGEWrYynz6MI529M5GeQ4VjDq+aJOLSO+Z/?=
 =?us-ascii?Q?8aTx9H/+Nq8QpgqcnoZOlcwWxE3M7c3nbeY6HvlFdCf79I709lj4vAJlrStk?=
 =?us-ascii?Q?LQH9nbPf+1QvFS/IBb6/McFyc3Be2Sh7adH3a1Mj6GtUAbAcnS/gNb7BCksr?=
 =?us-ascii?Q?pfPbJDkTU1pOIcR8jU787h6IkpMDSjkJtQhmPlNS452rYbny+s58nveFfzcA?=
 =?us-ascii?Q?SC063dHONDWlHBlssfmm76OMBnIeFAidXckwb/iujPesengDeVQWe357J0k8?=
 =?us-ascii?Q?VFPnL7QIVzPGoI2bQDdseqMUPKBOgvBSd1ZluiH4LD3bhXromq0D9fegwqCY?=
 =?us-ascii?Q?2oMMq6CpHbQmpySJl1GJ/0QyH0qaoWfSjOeUsgmhDBVa3d3/2VBGuYEMXljl?=
 =?us-ascii?Q?qMFrv6VWP06Vyggg3UyHjrDXb3yzqQ44ksqgE/IzfY80FZwwUgehsq+R9PJR?=
 =?us-ascii?Q?C80u0qft/o+BPVbWIUoa799cKqWUrcOZoQCoXb344FY45HkwE4a68gAFZJSJ?=
 =?us-ascii?Q?4UUeTDHsKoeDM3Xze1OjzoAHH5/u1CHy20u3It/K957sLiWIVmXHwFyqQddL?=
 =?us-ascii?Q?7oGUDqUZF3FVu09yNmRPXS+6SzBIt/NiuO5+nNL/+ah55T3csnGDQh8X0I8Z?=
 =?us-ascii?Q?7ZxATWstSX+ce69VpE61u5yUK52UIo09h6pmNq3jraUuaaOuk71CgW20SsGj?=
 =?us-ascii?Q?uYINCSWbBXQArddM9eDix54rTmxtJ/8PWh51OHV8bJDj06ijK3pXHFfwbcxn?=
 =?us-ascii?Q?PLbiLntz+dVcr0D1v+PXnSVmcVEwO5qmlrRUF3U2Mbv3T85xJNuxbNAne+4D?=
 =?us-ascii?Q?EbRCpvPe4IfEqcmNjR3upCQ31aAad65a3IvxtT+m9NtfzMXvvF0wQ5IIdQCj?=
 =?us-ascii?Q?crMjindLM6dNlzMO0KcmMc9eDoydrfLmoZlOGIiigpX7xuCRBnAKjF9ZonRr?=
 =?us-ascii?Q?8w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be5f7917-7953-4f51-c299-08dd05cc916a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 23:23:52.8905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jtpqHQmxLOd9kayOImpkYTkN3dnzzNSDxqn7FRDmthl2cnuXQ6MXIMYAIdlTDXi85BYHgdvcW4J7WhPtLjW2lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8841
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

On Fri, Nov 15, 2024 at 04:53:04PM -0500, Rodrigo Vivi wrote:
> On Fri, Nov 15, 2024 at 11:21:55AM -0800, Matthew Brost wrote:
> > This message just spams dmesg providing little benefit. Remove it.
> 
> I don't believe it is useless, but I also hate the spammers...
> 
> perhaps we could bring the status of it in some debugfs form
> as a replacement?
> 

ftrace could an option so if you really care about this enable it there?

Matt

> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pm.c | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 40f7c844ed44..80699dbeb2e9 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -738,9 +738,6 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
> >  		xe->d3cold.allowed = false;
> >  
> >  	mutex_unlock(&xe->d3cold.lock);
> > -
> > -	drm_dbg(&xe->drm,
> > -		"d3cold: allowed=%s\n", str_yes_no(xe->d3cold.allowed));
> >  }
> >  
> >  /**
> > -- 
> > 2.34.1
> > 
