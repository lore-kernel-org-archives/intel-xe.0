Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E04D149DB
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 18:24:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7780C10EB74;
	Fri, 25 Oct 2024 18:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eLXY2dun";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED36310EB74
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Oct 2024 18:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729880651; x=1761416651;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RJTEzRqoTBr5srssO86WNd+fDdbWUoIPUgvR38JhNj8=;
 b=eLXY2dunmU566LEU34wbflz3ZcblknC8uo7yndVmCND+S0O3CNtUnHJI
 R7z7nIA5ZcSTYXgEI/k9b/7lXiBBKRVTn0X4ckmzMi94RPfqeIBjuLSmT
 nYTBUbUKpbUnD3gY8wXjDo9T8bmSzPzGqTWwZ9TjYyCTwf8FIomfyGUro
 k+J0dzlDkCp9u77QpoYs2mHKG/3CmMd7aLamVqDjzhuto7at1nZQgF8rh
 QUE5eRwMJ1aFV1n0QaznFEx88E9UNM+RaBOSRAr6BR/PC6varI5H7FjEW
 /5VigFgTlw4DWEv73sG2sf1INOQ1ZaeAoa9fjRw3rpKLhTivS3tw3rEJw Q==;
X-CSE-ConnectionGUID: xE1Q7JUZSoepYVy6JRTlOA==
X-CSE-MsgGUID: 9Qp7A9pmTAidyW/fbD+vmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="40951362"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="40951362"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 11:24:11 -0700
X-CSE-ConnectionGUID: BtdeIrBUSc6zdlOjgnT2nw==
X-CSE-MsgGUID: KMZibIT+ThqU0i9ZMYzylg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="85770525"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 11:24:11 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 11:24:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 11:24:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 11:24:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KfHTSMCxHMMTNdasHG97zPDm1wGsoJzChvaiV8SQbHS9Hi3vR09yHMnwWuFFKUCe0QM5kBcgoExE7+JBECvVwso+H2XwoUO5wFKe5TaRmRZ3+AVbvF+7ipu7yupW7n1Hkd6vKg0T1VlAz3RKnFB759FgPjF/3qZAq8Joot9U7TG9qWbrTucYecFJNP3u7Pjjw/hAeRlUUxct43JqOyoytOsaU+hDOOFv2uV6SFcVQzgdwXaRpRuNp9etHK3W7H5zIg3EiLoMk2OznGb1LpGoPYXSUX3CqpcUHDVq2KZhmug1MFDqIcUc8v44KvOZU3GX8unkdKBm9iC0LmkEMF9TOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+w0AowkMYJEHIKGhurRvOX7WuBFvyMCTWq6JT+UZTtI=;
 b=D2D9QWw99wWkIpch9C2MyEIg/E8g9b3LuHeeVwZVLA6IiARo4uXwDMOQbASFnOaYcXS06kJ1swbyJHcYJtKEMjq0gARkfyy0Ssxgnu+p6RwTl42iDQqvbIy/VnooaHTtBRwSiQe5yFL9IlM0BzMivKcJr50KwvpoLfnY5gtnkvTXTpbW6UBiHfjhy/LD3UXEGXrFSdkPhAMvgVkY/3tubFmc4h8WyO/UfX+6leKxUCISA8AcSyNK0gKDXx3comlCawrVcrLMLTaU/VCQeM6ales+6uFwSTJfbJeB+G/mT/EU8avki889K5SVi35UimO9JEpcdoUSjPumN0i5T68aIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6085.namprd11.prod.outlook.com (2603:10b6:208:3cf::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 18:24:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 18:24:06 +0000
Date: Fri, 25 Oct 2024 18:23:40 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>
CC: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Maciej Patelczyk
 <maciej.patelczyk@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 12/18] drm/xe/eudebug: implement userptr_vma access
Message-ID: <ZxviLOv75ISykjK8@DUT025-TGLU.fm.intel.com>
References: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
 <20241001144306.1991001-13-mika.kuoppala@linux.intel.com>
 <ZxVI8IpkcgAq7PRx@DUT025-TGLU.fm.intel.com>
 <e50c5fdd-2872-4d92-a60f-d1db53fd1b79@intel.com>
 <ZxbW+3+hZtcSuWn8@DUT025-TGLU.fm.intel.com>
 <3afce3a1-5ae1-4c87-9bb1-838be1c8d951@intel.com>
 <Zxpwg6GyMAg35L4+@DUT025-TGLU.fm.intel.com>
 <447c0757-e987-4714-a720-16191be2416c@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <447c0757-e987-4714-a720-16191be2416c@intel.com>
X-ClientProxiedBy: BY5PR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::39) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6085:EE_
X-MS-Office365-Filtering-Correlation-Id: 58ccb5bf-fe03-42ad-9707-08dcf52235fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?9VaUNb7yr8Ss2hphoZ+k2dDrIRWN4btMmwH1ZSdIXY+rbGVfNfaZMzvohe?=
 =?iso-8859-1?Q?xrhZ+zhyP0Cu2PWX12PDAlzb7Yw9weKwuC9DHj5zTmpUO84Av45LttStN7?=
 =?iso-8859-1?Q?jR5BtA34JWUvSW+UUh+LhVcoV4SAFpt3TKswh3HUDneB+Ghk1rbmHO8n4s?=
 =?iso-8859-1?Q?iDHYn6omxqpkXt5tjN4U9m73J3LvGIel0maXMOzrNaVVsgvedVX2Heeyks?=
 =?iso-8859-1?Q?FxhOQrMH92tMzOYd2nKBO8uhl0cx2+8T53k32F1eHWCQW9JYlOauKNCe1Y?=
 =?iso-8859-1?Q?+2SU3G+gLgBd8f3ZhRUE7bwTyL+tBGOEv5ZA9x8sLDjHe4Jx/UOEB+9WjT?=
 =?iso-8859-1?Q?SUdvgaMH7G84WTDCldFs5kBN/kvKEzZmWeHgrD7hl8b/CgeTO9GoZsA3QY?=
 =?iso-8859-1?Q?uZo//6DV0H9GCs88yyLeYgQ0CC1mpJM8FJtTuajg9mqeuO51uLFdZ66frT?=
 =?iso-8859-1?Q?TBIKUb63EHux/ZNsab+8XEGXiojP4cMgHOr6zF6kDqL+QGtOjufniD6sss?=
 =?iso-8859-1?Q?j/7cri/9VQpyXph+cvZhglS8tGblg8YQP74FV6wg5xUetRX/k0MSueuU8N?=
 =?iso-8859-1?Q?zCyHcYAsHptnICrlwAtVrireIrmNwksWJqC09CWr8xeAsB8omfu5CNQcfQ?=
 =?iso-8859-1?Q?RTjXhs3U6tjaZujNTRrSpbBL4kKxJNsx6UehS2O5NxtaaG45QxZ/TNPo0D?=
 =?iso-8859-1?Q?7aJsvUrN6Z/yCjL8ef/I7zxYrkPxgiA3sW8Xq7hwSY5r7FOZc9J3pOYr3r?=
 =?iso-8859-1?Q?3BecznlILkwYZMPF0RnB5A/w1MUkubCF3HjRXSVQ8cfTvhgVLOeV96qCkq?=
 =?iso-8859-1?Q?I/l04NAlXHXDGPZttjmN8gCr7ZQgYDFEJ+Pqy8Q5j/ClqQH0vzwriwTGdM?=
 =?iso-8859-1?Q?CVK27tmxGBAOQ6Z/MvhInHIkAhla0hO52Gr8AWruqGkpaRfk0XlajiyH4P?=
 =?iso-8859-1?Q?c65AIjbWFpv+Rt+vFFgcFXf7EBbjLiBJMHdr9DbVjW51saR/4fkm04e0Tx?=
 =?iso-8859-1?Q?NcUJtIzKFWs89ZfPwUTxw8zWHM62VpNhVHYGpl7AANXzWvwLsTMZqu+Ldo?=
 =?iso-8859-1?Q?RbCx+8GdUwCeZkVy/HAqn/uMOCPuGe0xQTF2vp2I6W8znD8jnFQ2J6wutt?=
 =?iso-8859-1?Q?2/t2X4kwqQkWpQEDK6jDPW2Xfl7E7q+p0tH65tmFpRWaGCAieYgO/HWNIb?=
 =?iso-8859-1?Q?xukT2ay7/S/dlzWV2dGzsAVpbixiaZnbcLqu30QSVxXtI86MKGe/+JwL9a?=
 =?iso-8859-1?Q?ItDTXalLZi1ScCu9NY04zGX9v/2RihtYIz+LjjlzqUCnhc4NQ7XnZwgffT?=
 =?iso-8859-1?Q?XBGTOMyRhYM6nh97YYDE1ZWVzQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?rNpVDSWB/D1t7V+2/GjjG17aI/Fs7wztG4hRpIO9j/+pNdiNOF/+fFSttT?=
 =?iso-8859-1?Q?gVzT3B9NdU9nybFeO/vzj+kJdMZqD6osNWkAaxT+9AC6Ls+b7NV/Hx18uG?=
 =?iso-8859-1?Q?MLcln8gsEa7qzpaUzk4wq7N/e6uFgLiPa2TLoh+1G4H0PNcXo06fQgCZQm?=
 =?iso-8859-1?Q?7rnMOwb6hxgheyE68HJbIIpkRYqgpd2ITJKPOcszLQ/oZVINZCckC4VuSS?=
 =?iso-8859-1?Q?l7KHwnu/7oofRhuSbTcXx92y1MF9PZQg6Oc8T1ZxDy/8hIswJgMtfPXTFX?=
 =?iso-8859-1?Q?oj5YwYY8YIUGN4V1jA6SkPQBbppSoV7mItRR1YSQfJLOXT6BGAcaxhvUmF?=
 =?iso-8859-1?Q?cqB7bDsafWp11ugNWsl7GQqUGPVyCUHkMO2a3/MwaYRTarbZBc6pReJaXq?=
 =?iso-8859-1?Q?vSOnZpPimLbdnAJ9JzuhkMEE6Fj6ioDFTt9F5qaqRLCVtX9JtV07S6h3uY?=
 =?iso-8859-1?Q?zO9aSuZ8BXNRTc5ZGqnhnPx75H08xAAHOhdVisGErpYl0lUVJRwphJQm7W?=
 =?iso-8859-1?Q?Ugbolq9294553BoKb8ToPGsFICcYHiKBVtNcE86HGBWqqQkdtFnW5WPIiy?=
 =?iso-8859-1?Q?2gmMxlvrBfj2ma9Tyhxmw2KKbEC3Bad9zmuNMVJrYRrj4plKtgb9tZg95M?=
 =?iso-8859-1?Q?WJD0/DzlC9pwb/WrJGcnZzNOmXIHywFtVP0MS1L/bzTzeO1bZ9xKTh6IDy?=
 =?iso-8859-1?Q?AYeaOPM9QMNpX6+delKrfH33/zWWODm+R5zRo50KFfYqEvSA6NM0kN+01/?=
 =?iso-8859-1?Q?pEcaYUBzWfi2qKLui3gJgP3LAo1GlAPvQOGLllTAiZq0BW9+LE5wDq7ZKX?=
 =?iso-8859-1?Q?27HhF3asSBGC9C7YrGkdNugTdS07qeLu8FcAi19EhDFTyx5aU2iB77H91t?=
 =?iso-8859-1?Q?ZshX7ARuaO6k1xWQG/CDhhMyXPh88ESNy6dcV31ZbBeC1irGeu61tgPp7C?=
 =?iso-8859-1?Q?rxKzPfnpuKM/ZAYfga3h/kYpSZmzuXzXLvMtSHrUZJfRb2CE0JLZ6P7Ytz?=
 =?iso-8859-1?Q?G8ldVMTdqDXGaOc1fLESB5GFpJQFideDcvpovSxtXLIlQzceBOfxccFxF+?=
 =?iso-8859-1?Q?+TcTv8o+ToJqyePNxSR0gnHlsYt1VdRczHZy8Hx/J53ss6jJ6jAmh3K30c?=
 =?iso-8859-1?Q?XV4/BhgJbyH3a6Sa3w9Comcpd4MLTtwtWLcEBTfhAmxUIvVEx2YOb4CC+F?=
 =?iso-8859-1?Q?YOaN3PORulm2qksR58lRTMClj68oS2QvDqwM+zA5hVJ7BuoluH0CwBTBCo?=
 =?iso-8859-1?Q?6gL2bPFz97LbuFTpYNhEsZZztfBof0ESR2+AkcsQWGX47slHEIu0qpDWKf?=
 =?iso-8859-1?Q?6pCHLPSMDjOkGyjm9yJZg2f+RSDXYQoO3XIkLwoGdBGSa5C5WPvQ//nQhz?=
 =?iso-8859-1?Q?GvjXYfq/LOIATGnHmmUPNGXK/oCeVsJ+1X3p7rlswNqA8v62T3TJKwZ9Lz?=
 =?iso-8859-1?Q?6KTNp/Qie+YWnMj2qnhYTFQBxCezyQ7iOkeQNE3TfByl941Rdx5uvmm4ku?=
 =?iso-8859-1?Q?JH+Tr1Ostv7Ka52Elwajfe0dJW9gm/Zvroj/XrgGm9+qzF9ofr3f6l0RHB?=
 =?iso-8859-1?Q?vqE8lnCb9LRDuMgRuWTBe6SeZmaLR9neE43Suq90pmKtOr81MqLYtF80pA?=
 =?iso-8859-1?Q?tYYb2bfQteu2hU7mimp2Jd8mB4K2m3xX+E6rCqtnTSF6tprXNG6qj0Ng?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ccb5bf-fe03-42ad-9707-08dcf52235fa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 18:24:06.4661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 77AFi7g5yJbMMM81KcQlf6E0AHN/CIeOTFioBaSJ3/ZF/k8z85sjtCKDBbIsEVDMyQ2n+sp+c0VlXToVYcv0jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6085
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

On Fri, Oct 25, 2024 at 03:20:18PM +0200, Hajda, Andrzej wrote:
> 
> W dniu 24.10.2024 o 18:06, Matthew Brost pisze:
> > On Wed, Oct 23, 2024 at 01:32:53PM +0200, Hajda, Andrzej wrote:
> > > W dniu 22.10.2024 o 00:34, Matthew Brost pisze:
> > > > On Mon, Oct 21, 2024 at 11:54:30AM +0200, Hajda, Andrzej wrote:
> > > > > W dniu 20.10.2024 o 20:16, Matthew Brost pisze:
> > > > > > On Tue, Oct 01, 2024 at 05:43:00PM +0300, Mika Kuoppala wrote:
> > > > > > > From: Andrzej Hajda <andrzej.hajda@intel.com>
> > > > > > > 
> > > > > > > Debugger needs to read/write program's vmas including
> > > > > > > userptr_vma. Since hmm_range_fault is used to pin userptr
> > > > > > > vmas, it is possible to map those vmas from debugger
> > > > > > > context.
> > > > > > > 
> > > > > > > v2: pin pages vs notifier, move to vm.c (Matthew)
> > > > > > > 
> > > > > > > Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > > > > > > Signed- off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> > > > > > > Signed- off-by: Mika Kuoppala
> > > > > > > <mika.kuoppala@linux.intel.com> Reviewed- by: Jonathan
> > > > > > > Cavitt <jonathan.cavitt@intel.com> --- drivers/
> > > > > > > gpu/drm/xe/xe_eudebug.c |  2 +- drivers/gpu/drm/xe/ xe_vm.c
> > > > > > > | 47 +++++++++++++++++++++++++++++++++ drivers/
> > > > > > > gpu/drm/xe/xe_vm.h      |  3 +++ 3 files changed, 51
> > > > > > > insertions(+), 1 deletion(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/
> > > > > > > drm/ xe/xe_eudebug.c index edad6d533d0b..b09d7414cfe3 100644
> > > > > > > --- a/ drivers/gpu/drm/xe/xe_eudebug.c +++
> > > > > > > b/drivers/gpu/drm/ xe/ xe_eudebug.c @@ -3023,7 +3023,7 @@
> > > > > > > static int xe_eudebug_vma_access(struct xe_vma *vma, u64
> > > > > > > offset, return ret; } -	return -EINVAL; +	return
> > > > > > > xe_uvma_access(to_userptr_vma(vma), offset, buf, bytes,
> > > > > > > write); } static int xe_eudebug_vm_access(struct xe_vm *vm,
> > > > > > > u64 offset, diff --git a/drivers/gpu/drm/xe/xe_vm.c b/
> > > > > > > drivers/ gpu/drm/xe/xe_vm.c index a836dfc5a86f..5f891e76993b
> > > > > > > 100644 --- a/drivers/gpu/drm/xe/xe_vm.c +++ b/drivers/gpu/drm/
> > > > > > > xe/xe_vm.c @@ -3421,3 +3421,50 @@ void
> > > > > > > xe_vm_snapshot_free(struct xe_vm_snapshot *snap) }
> > > > > > > kvfree(snap); } + +int xe_uvma_access(struct xe_userptr_vma
> > > > > > > *uvma, u64 offset, + void *buf, u64 len, bool write) +{
> > > > > > Maybe dump question but are we overthinking this here?
> > > > > > 
> > > > > > Can we just use kthread_use_mm, copy_to_user, copy_from_user?
> > > > > > 
> > > > > > If not then my previous comments still apply here.
> > > > > This function is called from debugger process context and
> > > > > kthread_use_mm is allowed only from kthread. Spawning kthread
> > > > > just for this is an option but looks odd and suboptimal, could be
> > > > > kind of last resort, or not?
> > > > > 
> > > > > Another options: 1. Keep reference to remote task in xe_userptr and
> > > > > use access_process_vm(up->task, ...).
> > > > > 
> > > > I think remote refs are generally a bad idea but admittedly don't fully
> > > > understand what this would look like.
> > > > 
> > > > > 2. Pass xe_eudebug.target_task reference down from eudebug framework
> > > > > to this helper and use access_process_vm. Current call chain is:
> > > > > __xe_eudebug_vm_access - has access to xe_eudebug.target_task
> > > > > ->__vm_read_write --->xe_eudebug_vm_access ---->xe_eudebug_vm_access
> > > > > ----->xe_eudebug_vma_access ------
> > > > > > xe_vm_userptr_access So to achieve this multiple changes are
> > > > > required, but maybe it is valid path to go? One potential issue with
> > > > > 1 and 2 is that multiple UMD tests were failing when
> > > > > access_process_vm/access_remote_vm were used, they were not
> > > > > investigated as this approach was dropped due to different reasons.
> > > > > 
> > > > > 3. Continue approach from this patch, but with corrected page
> > > > > iterator of up->sg sg list[1]. This was nacked by you(?) [2] but
> > > > > I have problem understanding why? I see lot of code in kernel
> > > > > mapping sg pages: linux$ git grep ' kmap.*sg' | wc -l
> > > > I looked here every example I found has mapping and accessing 1
> > > > page at time not mapping 1 page and accessing many.
> > > > 
> > > > > 61 Is it incorrect? Or our case is different?
> > > > > 
> > > > A sglist segments are dma-addresses (virtual address), thus every
> > > > 4k in the segment can be a different physical page.
> > > sglist is also list of pages and their lengths (in case of consecutive
> > > pages, they are glued together), i.e. exactly what we need. And this is
> > > done in xe_build_sg: it calls sg_alloc_table_from_pages_segment which
> > > is documented as follows:
> > > ...
> > > * Allocate and initialize an sg table from a list of pages. Contiguous
> > > * ranges of the pages are squashed into a single scatterlist node up to the
> > > * maximum size specified in @max_segment. A user may provide an offset at a
> > > * start and a size of valid data in a buffer specified by the page array.
> > > ...
> > > So sglist contains the same information as hmm_range->hmm_pfns[i] and little
> > > more.
> > > 
> > > So my concern is if mapping operation can destroy this info, but looking at
> > > the code this does not seems to be the case. For example iommu_dma_map_sg
> > > docs explicitly says about "preserve the original offsets and sizes for the
> > > caller".
> > > 
> > > 
> > > > i.e., look at this snippet:
> > > > 
> > > > +		void *ptr = kmap_local_page(sg_page(cur.sgl)) + cur.start; + +
> > > > cur_len = min(cur.size, cur.remaining); +		if (write) + memcpy(ptr, buf,
> > > > cur_len); +		else +			memcpy(buf, ptr, cur_len); + kunmap_local(ptr);
> > > > 
> > > > If 'cur.start' > 4k, then you are potentially pointing to an incorrect
> > > > page and corrupting memory.
> > > With added possibility to iterate over sgl pages in xe_res_cursor[1] it does
> > > not seems to be true.
> > > Why? cur.start is limited by length of the segment (cur.sgl->length), if it
> > > happens to be more than 4k, it means sg_page(cur.sgl) points to consecutive
> > > pages and cur.start is correct.
> > > 
> > I suppose if the cursor is changed to walk the pages not the dma
> > address, yea i guess this would work. Still my much prefered way would
> > just call hmm_range_fault or optionally save off the pages in
> > xe_vma_userptr_pin_pages given at some point we will ditch SG tables for
> > userptr in favor of drm gpusvm which will be page based.
> 
> Both alternatives seems for me suboptimal, as their result is what we have
> already in sg table, for a price of extra call (hmm_range_fault) and extra
> allocations (both). Most important they will complicate the code without
> clear benefit.
> 

Again the SG is going to eventually be dropped in favor of a page array
in GPU SVM. Also the general consensus among the Linux community is SG
tables are terrible and wouldn't be surprised if eventually these get
pulled out / deprecated in the kernel entirely. Fine if you want use a
SG table I guess as we will just rewrite this once GPU SVM based userptr
lands.

> I will try to implement version with hmm_range_fault but I am still confused
> why we need to complicate things.
> 

Correctness vs convenience...

It is a bit unfortunate our hmm_range_fault wrapper is built around a VMA
argument - I suggested a more generic interface there to this easier in
reviews but that feedback was ignored.

Matt

> 
> Regards
> 
> Andrzej
> 
> 
> > 
> > Matt
> > 
> > > > Likewise if 'cur_len' > 4k, then you are potentially pointing to an
> > > > incorrect page and corrupting memory.
> > > Again, in case of consecutive pages it should be in range.
> > > 
> > > Anyway if there is an issue with consecutive pages, which I am not aware of,
> > > we can always build sg list with segments pointing to 4K pages by
> > > modyfing xe_build_sg to call sg_alloc_table_from_pages_segment with 4K max
> > > segment size.
> > > 
> > > [1]: https://lore.kernel.org/intel-xe/20241011-xe_res_cursor_add_page_iterator-v3-1-0f8b8d3ab021@intel.com/
> > > 
> > > Regards
> > > Andrzej
> > > 
> > > > This loop would have to be changed to something like below which kmaps
> > > > and accesses 1 page at a time...  for (xe_res_first_sg(up-
> > > > > sg, offset, len, &cur); cur.remaining; xe_res_next(&cur, cur_len))
> > > > { int segment_len; int remain;
> > > > 
> > > > cur_len = min(cur.size, cur.remaining); remain = cur_len;
> > > > 
> > > > for (i = 0; i < cur_len; i += segment_len) { phys_addr_t phys =
> > > > iommu_iova_to_phys(sg_dma_address(cur.sgl) + i + cur.start); struct page
> > > > *page = phys_to_page(phys); void *ptr = kmap_local_page(page); int
> > > > ptr_offset = offset & ~PAGE_MASK;
> > > > 
> > > > segment_len = min(remain, PAGE_SIZE - ptr_offset);
> > > > 
> > > > if (write) memcpy(ptr + ptr_offset, buf + i, segment_len); else
> > > > memcpy(buf + i, ptr + ptr_offset, segment_len); kunmap_local(ptr);
> > > > 
> > > > offset += segment_len; remain -= segment_len; }  buf += cur_len; }
> > > > 
> > > > > 4. As you suggested in [3](?), modify xe_hmm_userptr_populate_range
> > > > > to keep hmm_range.hmm_pfns(or sth similar) in xe_userptr and use it
> > > > > later (instead of up->sg) to iterate over pages.
> > > > > 
> > > > Or just call hmm_range_fault directly here and operate on returned pages
> > > > directly.
> > > > 
> > > > BTW eventually all the userptr stuff is going to change and be
> > > > based on GPU SVM [4]. Calling hmm_range_fault directly will always
> > > > work though and likely the safest option.
> > > > 
> > > > Matt
> > > > 
> > > > [4] https://patchwork.freedesktop.org/patch/619809/? series=137870&rev=2
> > > > 
> > > > > [1]: https://lore.kernel.org/intel-xe/20241011-
> > > > > xe_res_cursor_add_page_iterator-v3-1-0f8b8d3ab021@intel.com/ [2]:
> > > > > https://lore.kernel.org/intel-xe/Zw32fauoUmB6Iojk@DUT025-
> > > > > TGLU.fm.intel.com/ [3]: https://patchwork.freedesktop.org/
> > > > > patch/617481/?series=136572&rev=2#comment_1126527
> > > > > 
> > > > > Regards Andrzej
> > > > > 
> > > > > > Matt
> > > > > > 
> > > > > > > +	struct xe_vm *vm = xe_vma_vm(&uvma->vma); +	struct
> > > > > > > xe_userptr *up = &uvma->userptr; +	struct xe_res_cursor cur
> > > > > > > = {}; +	int cur_len, ret = 0; + +	while (true) { +
> > > > > > > down_read(&vm-
> > > > > > > > userptr.notifier_lock); +		if (!
> > > > > > > xe_vma_userptr_check_repin(uvma)) +			break; + +
> > > > > > > spin_lock(&vm-
> > > > > > > > userptr.invalidated_lock); + list_del_init(&uvma-
> > > > > > > > userptr.invalidate_link); + spin_unlock(&vm-
> > > > > > > > userptr.invalidated_lock); + +		up_read(&vm-
> > > > > > > > userptr.notifier_lock); +		ret =
> > > > > > > xe_vma_userptr_pin_pages(uvma); +		if (ret) +			return ret;
> > > > > > > +	} + +	if (!up->sg) { +		ret = -EINVAL; +		goto
> > > > > > > out_unlock_notifier; +	} + +	for (xe_res_first_sg(up->sg,
> > > > > > > offset, len, &cur); cur.remaining; +	     xe_res_next(&cur,
> > > > > > > cur_len)) { +		void *ptr = kmap_local_page(sg_page(cur.sgl))
> > > > > > > + cur.start; + +		cur_len = min(cur.size, cur.remaining); +
> > > > > > > if (write) +			memcpy(ptr, buf, cur_len); +		else +
> > > > > > > memcpy(buf, ptr, cur_len); +		kunmap_local(ptr); +		buf +=
> > > > > > > cur_len; +	} + ret = len; + +out_unlock_notifier: +
> > > > > > > up_read(&vm-
> > > > > > > > userptr.notifier_lock); +	return ret; +} diff --git a/
> > > > > > > > drivers/
> > > > > > > gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h index
> > > > > > > c864dba35e1d..99b9a9b011de 100644 --- a/drivers/gpu/drm/xe/
> > > > > > > xe_vm.h +++ b/drivers/gpu/drm/xe/xe_vm.h @@ -281,3 +281,6 @@
> > > > > > > struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm
> > > > > > > *vm); void xe_vm_snapshot_capture_delayed(struct
> > > > > > > xe_vm_snapshot *snap); void xe_vm_snapshot_print(struct
> > > > > > > xe_vm_snapshot *snap, struct drm_printer *p); void
> > > > > > > xe_vm_snapshot_free(struct xe_vm_snapshot *snap); + +int
> > > > > > > xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset, +
> > > > > > > void *buf, u64 len, bool write); -- 2.34.1
> > > > > > > 
