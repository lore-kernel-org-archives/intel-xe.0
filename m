Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0F2C25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 22:14:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6930910E0FF;
	Fri, 31 May 2024 22:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Twu8EfL2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F50810E056
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 22:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717193638; x=1748729638;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YA5tbX1W70Tp5iIPLaJt7B0QzkGUYIu5ivpL6TdCWek=;
 b=Twu8EfL2Niqrr9cfZdQufObqDSDT44u5p/CjX0CRGoriS1DEuHsbZjDe
 z5zOXORvLYkGuKypJCczVxbIcGClvnkl9g3WAoYTIa34vW4wAgAXs6n8G
 r7cAsXm1xKgPzdD0Z1IdhRFKV5ZGeMXtVsAK+ik4jk3S5epDVsaKleRdc
 ChnorbQnY7s2i1uRTQkPnjxVhh2wjV97+S1ZzXvmfzN9nnCSVYG64zo3P
 8RBAgg5kjU0vCZooTm7lOfqbok4dfseEg/pyyvpMRAWlU1TkJYh2KPYTH
 Yzj4hetJYmmYW64+zSLs+jW7yTOiXKSPW+hipyRZdz7p9/PbR8DqhQ8QH w==;
X-CSE-ConnectionGUID: DrZAZRsTR2OC2LyvaUjJOw==
X-CSE-MsgGUID: wlSgbWhYR5StTeJDk9eKBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="39156825"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="39156825"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 15:13:57 -0700
X-CSE-ConnectionGUID: U69w9FHzRFiCL59pe/QX1Q==
X-CSE-MsgGUID: OMj/YZwMQb2mlHRXmZtSiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="36291132"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 15:13:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 15:13:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 15:13:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 15:13:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 15:13:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6Y+sGDDkM7wlIRQfd7KlIcCftecyqB2JtjU/JyPxhszGvBAsqFn/dJljgR9AtpeKksyKB1XyLh65C1Ws81e7cuEYUTRn8J9ct133ncZKzp8tiD25AYYHtl8G3+eZ8Lfhd3+BsazhsFEdow27FGbx8ZE4si3Q43wO6SywJI7HAxm/yzNTatYf2eT298HwCCQi2THWruicrSIXrKA1LICxDZC0lnFj/PKqmLifpnVv4qAOWkYrYNxCW91UmaPQTzdinhcv0p229ui3niIx/EqSq5OkVy+opMspXFOqt0LH7ltK7BjmHx5Bd0G3nozUBMLqs6Sjl+0X909ckYojj32BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8N7XxxUzZqQ6F3FzQqG5GaoxLestHkNPOtxh5NeUZE=;
 b=PBCQkaonb4p0JdWk1vW4PKLKSFYggpXbQbdtaDv44qVPTibMPqwwrtOwjfdFHXrHhvf9TiP+yWwwvMD5KeVtSHkLLRMPHo9AsOHopZyADOmvds1JePp8Sm5U7UNwT2wDnYyLJz+iyTCVay+BO8dbE+3mYhs8knT4pyvQ49CahwZkHHHO6Eg12F3cMujkGAXE8YP+hSUsgR3Tqj6QJKwhXY+P9W+LYH18+kKQd/ZQibnRnFY485B6pJnlULNfpU16EW+faPTkC/f6eauE/5J9l/aveE8qIR+UGI0k0JJXbqKNVcdBqxiy4SwlLeSz9A/HD95W/8og9WbSU80PmC5VrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0092.namprd11.prod.outlook.com (2603:10b6:510:2b1::6)
 by SA1PR11MB6871.namprd11.prod.outlook.com (2603:10b6:806:2b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Fri, 31 May
 2024 22:13:54 +0000
Received: from PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7]) by PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7%2]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 22:13:54 +0000
Date: Fri, 31 May 2024 22:13:24 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Yang, Fei" <fei.yang@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [RFC PATCH] drm/xe: Don't overmap identity VRAM mapping
Message-ID: <ZlpLhKSfUN5Y3z/n@DUT025-TGLU.fm.intel.com>
References: <20240531070717.1904762-1-matthew.brost@intel.com>
 <BL3PR11MB63624632546B03D6551C4F0C9AFC2@BL3PR11MB6362.namprd11.prod.outlook.com>
 <Zln6NXwSXfLFZyMN@DUT025-TGLU.fm.intel.com>
 <BL3PR11MB63623093B3F25F03F4EB14099AFC2@BL3PR11MB6362.namprd11.prod.outlook.com>
 <ZloC+a18NbT/jXrY@DUT025-TGLU.fm.intel.com>
 <BL3PR11MB6362F6BB0C6FFD668F3E86759AFC2@BL3PR11MB6362.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BL3PR11MB6362F6BB0C6FFD668F3E86759AFC2@BL3PR11MB6362.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0176.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::31) To PH7SPRMB0092.namprd11.prod.outlook.com
 (2603:10b6:510:2b1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0092:EE_|SA1PR11MB6871:EE_
X-MS-Office365-Filtering-Correlation-Id: a33c82a8-dcc5-4789-f0c6-08dc81bef587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OglcubwQX98A2IwRJsW065jDEfO89uvIiU7o1byBveduD2hVmN7lsk+Ds+Q9?=
 =?us-ascii?Q?M2yCgsRHkYw7zth1IP5W8Ynmv8rCB9Ajztb3L4dvnIGnIz/h4lBhZdNAJFPi?=
 =?us-ascii?Q?HtTXAVA7IlZ6CvUxuTenFV+HvTc3cc3vHT0Ja41n8IWr9C6IbIl0LRtNDZI9?=
 =?us-ascii?Q?+KrAy0gKJUeCiyruK+Y+xbnblalokyYW8AxUekHtSd3rjp7g5j9af4sCHmZ2?=
 =?us-ascii?Q?b/qw6C1Fv7iGF2m9qRuaO3vZwubNCzOk56QZ0d4MtBIMykpimBiJhmCHw+23?=
 =?us-ascii?Q?iv5pDPZBwr89U8ud5RgRjQKNPl5Q4VwyusvNoXlIrOSfGc29lCJ+XXAlbqUD?=
 =?us-ascii?Q?mv+F2kYKTHjECDvfk4OOYtm7N0wxvogQb+e7kBxl46OvpvViX/TQWSD0ezRw?=
 =?us-ascii?Q?wQmIZeyVS/b9Z/atoc9vGLPtJuCr8MF1VdmQCx16RldB1q9dPO6zoYcJ2rGD?=
 =?us-ascii?Q?6l83BZfm9zYQteTpwJ9LWCyD6hrKRTzuGxJCYCAqMV/6xvSkQ1+Ld9zBxC5r?=
 =?us-ascii?Q?Co3rw/iSMuvs4PiKauMoLIn+lE7goiCEPAEDfChRD/kS5s/TdaGh0mOk6STL?=
 =?us-ascii?Q?50kOlywxswVMQqy9e4aj2oCuprKOu10l6olhDRnUcgG9G24KtBFR6mOd+hbs?=
 =?us-ascii?Q?wWd4x8z/j6cjzfhorGOi/zVvQ41fVBNNDzIi/IP3vwIlUJyWKDunbWl5TClp?=
 =?us-ascii?Q?4J6b9415gSdAhAFfdwgXEQPiMEr4svHdzERlz3z8kdbr4XUClypW1tvAS7nA?=
 =?us-ascii?Q?BFbVDzvVJOL/6rDKqPRtVTtVcgFfVKB8vEmV9rfUiVYaRIP831F6vWIQVBjz?=
 =?us-ascii?Q?lKOjoenAUZTNxJDx2Kll9L40SDuPAjZiqXy998FciexB8xRl53FF50y3SpDg?=
 =?us-ascii?Q?6gzbMCEHwrEJXxXpRBSQ4zE/wnYzMIvKns5u6rZUvgghNOPf2CrEL7VsnfsR?=
 =?us-ascii?Q?sK2hrEIk9SovqrEx2H4sc82DnAa1AzpUS3YgpSJ6alnPmX/OEQsOsgNzWDwf?=
 =?us-ascii?Q?qXg2pA1UgEXFH5zyM/lGSsczS+MC25DYrFlvyy1FRFKuFtPWLCez+V12nesR?=
 =?us-ascii?Q?i4KU28BbS/NKjmMHF9+CR/f8UNjmzMzeHnkhWHw477JcAdsHBwX0giKhHdbn?=
 =?us-ascii?Q?/jDMM+ElXvX41o6lzpG+6o7L1tHqcO/Wbvs4S3Yjjw1A9e9SDa1LZUc6ap2x?=
 =?us-ascii?Q?NW2gw+H+hK5AnELU8xKJb/xYrIPir3JIdcKb1ij3J7KogyHPbWxfJGP6OZI6?=
 =?us-ascii?Q?fDbeIZaKbXMFoaGH3Q7qw17a5G7o4BEe2/Mkcf+bow=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0092.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3rmDvSmpeW92cXAapGV6+YqLHWfwiM3DRUwwgFyaUtNFMLR0gmehW8ioZ9kf?=
 =?us-ascii?Q?6uDvcVY1PnaLWJRsfdp3bXmspK8vC7j4XlB9yIrK+acNPc6prJzQ35t3J/vc?=
 =?us-ascii?Q?eTpufBi7OVbtHAakE+Q2vDQufe9osLHUFqkJIDL+2BGxuNHLeVSIGvAVYEDR?=
 =?us-ascii?Q?kD7v+y3AGqsvgUxKwRr/O+5mcgPSaRaWcgsFRor9NTSEwM441rXOPhV5uRhB?=
 =?us-ascii?Q?Uzmzc31r46/BMajGHJ47RnAxi2EHOF3u2fOe4r5K5CEqTQPabXkaOS/NtfmK?=
 =?us-ascii?Q?IaUoonzUNAI3fvm9oHpCwcME1aukAEWNIEz86eZ9lfDc9yVu7iCgnRAS28RX?=
 =?us-ascii?Q?Br9w2zisz9i1sb7jv3Y/j5WsOOTey+6vIAr5xJHe8soZpaDk6SrXFZI9KvtA?=
 =?us-ascii?Q?GWu9b/PcrcmRCcDZN08oFrmaFeCrs52uX7IdYvyJb9Mf+tgbSPRGXQbbI38x?=
 =?us-ascii?Q?8a9PHmSFrWmb/n8XN3J3x78amqPk5/1+KStUXLfoMTv7JJ4IsE82JHSqKT3w?=
 =?us-ascii?Q?XzAK3eCxv/aSiublu4K3oXpM63p5UxlVeRVifgz6dEOXdW0eLmpL0rDk8AS7?=
 =?us-ascii?Q?FPp+DnSL4XsRuTKQQJ1kyHXkqbzOAmxoeVjumbX1HCflaCT2U6u8WP+LE6Gt?=
 =?us-ascii?Q?I+QKjC497JnOuy5gTdP8zdh/YSd4eip/2CCx5XlMb0iKA2hzcD35lWV7WLP6?=
 =?us-ascii?Q?sAnuxY2PPak+WCk6WFUxn9Wo7lNren6E63tzPh0yS4uptAxoUzPqmCtEH55+?=
 =?us-ascii?Q?T8L7PVwoDIZMJSZBD5PwJ+nbji5Yz7mZe5H2J5i18VwSFunKm9dJaCM8KwpW?=
 =?us-ascii?Q?LPdruH+VhY6V+oviVdw8R+Gj4+QdsRdd+ToDdbbSXSmmnEYBiwtECRRa7ThX?=
 =?us-ascii?Q?rtSsPcmaOsTx67BqrM9Cs/eukAZMQ6ZbkbpQ8p0y48jKQFNVFY4nA+0/NGL0?=
 =?us-ascii?Q?QWijFktNYbcehrMZlQW8vuXdVUiia5aWfzJoe+HAogeajTsjRhTzgXS2bHfg?=
 =?us-ascii?Q?dMa07wPb4jj2Lg/dxcFADLv1Kmv3GMhaosMVLZ11OLFVsc05PKp4TpN3M0gJ?=
 =?us-ascii?Q?vF5nodFsnnmQQN19JamR5acUOEKwo2TqNyi0CegSpzHBgmFPHdRu+7cYRUEt?=
 =?us-ascii?Q?0SRV+g2UAMB5cVnAxm66mFi9D8ZssXlJtljgAUUGkqeTw7yb+pUz2HqAmq6a?=
 =?us-ascii?Q?/Jusfi1nwA7fh05oRfJDnJf/0wrd6XmllkhwhwK8pyqW8ZPeMFohWmI5+bJv?=
 =?us-ascii?Q?JMIkkDRQUN4qgdJGtggBQ7cu2sVr9NJN1PtHHsHsB++3M+aD04CjU4wG3E0B?=
 =?us-ascii?Q?XlsT8aN15+vb3Ft73OZjoxrsr3w7duWzWnE4jXnzo4shCJzLx9VvAqRg6SZL?=
 =?us-ascii?Q?KycWZ/3RUyimmfvcd2yZNCGrmzjaL0ca8+iH2+9GjW0eiYe+3cCgmBmHfcL2?=
 =?us-ascii?Q?cg8rbCqqkAUjjI0l0l6FqWFnxarrQqPj/tIOBsIABg7rkWil1SGG7QUr6kGC?=
 =?us-ascii?Q?pamIt1BixF2t7YcHf+f2ddEqGRXa5WKj8NVPMi48yx+hM5ybTmLBZbB8Exau?=
 =?us-ascii?Q?UNMJ7bRXVIttPKqCzeXGtZ1agqxYHEO1Cj4wPaZHH1Tn3AmIW3Bsd2IS7JAk?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a33c82a8-dcc5-4789-f0c6-08dc81bef587
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0092.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 22:13:54.4595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J8DhiM2D/ZWIBm7Ed4pCJGg5tSOoXVFWUVdy0c2ZnSoyVhjUm6Awoo5xdx2IK2s+N5jD9MhdOsXJDV5IsTIZaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6871
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

On Fri, May 31, 2024 at 03:22:45PM -0600, Yang, Fei wrote:
> > On Fri, May 31, 2024 at 10:52:37AM -0600, Yang, Fei wrote:
> >>> On Fri, May 31, 2024 at 10:20:26AM -0600, Yang, Fei wrote:
> >>>>> Overmapping the identity VRAM mapping is triggering hardware bugs on certain platforms. Use 2M pages for the last unaligned (to 1G) VRAM chunk.
> >>>>>
> >>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >>>>> Cc: Fei Yang <fei.yang@intel.com>
> >>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >>>>> ---
> >>>>>  drivers/gpu/drm/xe/xe_migrate.c | 54
> >>>>> ++++++++++++++++++++++++---------
> >>>>>  1 file changed, 40 insertions(+), 14 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> >>>>> b/drivers/gpu/drm/xe/xe_migrate.c index b882d32eebfe..2d92ec27981c
> >>>>> 100644
> >>>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
> >>>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> >>>>> @@ -69,7 +69,7 @@ struct xe_migrate {
> >>>>>
> >>>>>  #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
> >>>>> #define MAX_CCS_LIMITED_TRANSFER SZ_4M /* XE_PAGE_SIZE *
> >>>>> (FIELD_MAX(XE2_CCS_SIZE_MASK) + 1) */ -#define NUM_KERNEL_PDE 17
> >>>>> +#define NUM_KERNEL_PDE 15
> >>>>>  #define NUM_PT_SLOTS 32
> >>>>>  #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M  #define MAX_NUM_PTE 512 @@ -136,10 +136,11 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> >>>>>       struct xe_device *xe = tile_to_xe(tile);
> >>>>>       u16 pat_index = xe->pat.idx[XE_CACHE_WB];
> >>>>>       u8 id = tile->id;
> >>>>> -     u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
> >>>>> +     u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level,
> >>>>> +         num_setup = num_level + 1;
> >>>>>       u32 map_ofs, level, i;
> >>>>>       struct xe_bo *bo, *batch = tile->mem.kernel_bb_pool->bo;
> >>>>> -     u64 entry;
> >>>>> +     u64 entry, pt30_ofs;;
> >>>>>
> >>>>>       /* Can't bump NUM_PT_SLOTS too high */
> >>>>>       BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE); @@ -159,10 +160,12 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> >>>>>       if (IS_ERR(bo))
> >>>>>               return PTR_ERR(bo);
> >>>>>
> >>>>> -     entry = vm->pt_ops->pde_encode_bo(bo, bo->size - XE_PAGE_SIZE, pat_index);
> >>>>> +     /* PT31 reserved for 2M identity map */
> >>>>> +     pt30_ofs = bo->size - 2 * XE_PAGE_SIZE;
> >>>>> +     entry = vm->pt_ops->pde_encode_bo(bo, pt30_ofs, pat_index);
> >>>>>       xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
> >>>>>
> >>>>> -     map_ofs = (num_entries - num_level) * XE_PAGE_SIZE;
> >>>>> +     map_ofs = (num_entries - num_setup) * XE_PAGE_SIZE;
> >>>>>
> >>>>>       /* Map the entire BO in our level 0 pt */
> >>>>>       for (i = 0, level = 0; i < num_entries; level++) { @@ -233,7 +236,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> >>>>>       }
> >>>>>
> >>>>>       /* Write PDE's that point to our BO. */
> >>>>> -     for (i = 0; i < num_entries - num_level; i++) {
> >>>>> +     for (i = 0; i < map_ofs / PAGE_SIZE; i++) {
> >>>>>               entry = vm->pt_ops->pde_encode_bo(bo, (u64)i * XE_PAGE_SIZE,
> >>>>>                                                 pat_index);
> >>>>>
> >>>>> @@ -251,6 +254,9 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> >>>>>       /* Identity map the entire vram at 256GiB offset */
> >>>>>       if (IS_DGFX(xe)) {
> >>>>>               u64 pos, ofs, flags;
> >>>>> +             /* XXX: Unclear if this should be usable_size? */
> >>>>> +             u64 vram_limit =  xe->mem.vram.actual_physical_size +
> >>>>> +                     xe->mem.vram.dpa_base;
> >>>>>
> >>>>>               level = 2;
> >>>>>               ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8; @@ -258,21 +264,41 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> >>>>>                                                   true, 0);
> >>>>>
> >>>>>               /*
> >>>>> -              * Use 1GB pages, it shouldn't matter the physical amount of
> >>>>> -              * vram is less, when we don't access it.
> >>>>> +              * Use 1GB pages when possible, last unaligned chunk use 2MB
> >>>>> +              * pages as WOCPM is not allowed to be mapped on certain
> >>>>> +              * platforms.
> >>>>>                */
> >>>>> -             for (pos = xe->mem.vram.dpa_base;
> >>>>> -                  pos < xe->mem.vram.actual_physical_size + xe->mem.vram.dpa_base;
> >>>>> -                  pos += SZ_1G, ofs += 8)
> >>>>> -                     xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> >>>>> +             for (pos = xe->mem.vram.dpa_base; pos < vram_limit;
> >>>>> +                  pos += SZ_1G, ofs += 8) {
> >>>>> +                     if (pos + SZ_1G > vram_limit) {
> >>>>
> >>>> I'm afraid this patch wouldn't take effect on platforms where
> >>>> vram_limit is 1G aligned. Even for the last 1G, this check wouldn't be true.
> >>>
> >>> We shouldn't use 2M pages if the VRAM limit is 1G aligned. This leaves this code in a risky position where the 2M pages could largely remain untested. Perhaps introducing a Kconfig option to enforce the 2M path could be considered? However, excessive Kconfig options can be frowned upon, so I'll defer to the maintainers to decide if that's a good idea.
> >>>
> >>>> Should be if (pos + SZ_1G >= vram_limit)?
> >>
> >> But the problem we are trying to solve here is that the last 1G page
> >> overlaps with reserved memory region, there would be no change at all
> >> if we don't break down the last page.
> >> Or vram_limit has to be usable_size + dpa_base, because usable_size
> >> excludes the reserved region.
> >>
> >
> > I misunderstood your statement. Yes, I have a comment in the code for actual_physical_size vs. usable_size which needs to be addressed. Need a platform expert here to answer.
> 
> Harware is checking for any PTE crossing the reserved memory boundary. Stolen memory is considered as part of reserved region too, so it would be safer to stop virtual memory mapping at DSM_BASE, which means using usable_size instead of actual_physical_size. Of course if the DSM_BASE is always 2M aligned, there wouldn't be any problem to continue mapping reserved region with 2M pages, because no PTE is sitting on the boundary anyway. But breaking down the last 1G page into 2M pages is a must.
> 

Ah, yes. I understand what you are saying here. Agree then it is best to
break down the last 1G into 2M pages. Also still a likely unclear to me
if stolen memory needs these mappings.

We also likely want an assert somewhere in the code ensuring usable_size
is 2M aligned too. Does that seem correct too?

Matt

> >>> No, it is always better for performance (TLB usage is better) to use larger pages if possible. With that said, the logic is correct.
> >>>
> >>>>
> >>>>> +                             u64 pt31_ofs = bo->size -
> >>>>> + XE_PAGE_SIZE;
> >>>>> +
> >>>>> +                             entry = vm->pt_ops->pde_encode_bo(bo, pt31_ofs,
> >>>>> +                                                               pat_index);
> >>>>> +                             xe_map_wr(xe, &bo->vmap, ofs, u64,
> >>>>> + entry);
> >>>>> +
> >>>>> +                             flags = vm->pt_ops->pte_encode_addr(xe, 0,
> >>>>> +                                                                 pat_index,
> >>>>> +
> >>>>> + level - 1,
> >>>>> +
> >>>>> + true, 0);
> >>>>> +
> >>>>> +                             for (ofs = pt31_ofs; pos < vram_limit;
> >>>>> +                                  pos += SZ_2M, ofs += 8)
> >>>>> +                                     xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> >>>>> +                     } else {
> >>>>> +                             xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> >>>>> +                     }
> >>>>> +             }
> >>>>> +
> >>>>> +             xe_assert(xe, pos == vram_limit);
> >>>
> >>> Also while I'm here, I think this assert will pop on 2M pages. I think a break is required after writing the 2M pages.
> >>
> >> hmm... pos would be incremented to vram_limit no matter it's 2M or 1G. Unless vram_limit is not even aligned to 2M, which I doubt that would ever be the case.
> >>
> >
> > The assert is for ensuring whatever we map is fully and exactly mapped.
> > So yes, if vram_limit is not 2M aligned this will pop. In the current codd if we use 2M page, the outer loop also increments pos += 1G after setting up the 2M pages which would create an issue. Sorry if reviewing my code is confusing, just noticed this during my reply.
> 
> You are right, I missed the outer loop. A break after the inner loop fixes the issue.
> 
> -Fei
> 
> >Matt
> >
> >> > Matt
> >> >
> >> >>>       }
> >> >>>
> >> >>>       /*
> >> >>>        * Example layout created above, with root level = 3:
> >> >>>        * [PT0...PT7]: kernel PT's for copy/clear; 64 or 4KiB PTE's
> >> >>>        * [PT8]: Kernel PT for VM_BIND, 4 KiB PTE's
> >> >>> -      * [PT9...PT28]: Userspace PT's for VM_BIND, 4 KiB PTE's
> >> >>> -      * [PT29 = PDE 0] [PT30 = PDE 1] [PT31 = PDE 2]
> >> >>> +      * [PT9...PT27]: Userspace PT's for VM_BIND, 4 KiB PTE's
> >> >>> +      * [PT28 = PDE 0] [PT29 = PDE 1] [PT30 = PDE 2] [PT31 = 2M
> >> >>> +vram identity map]
> >> >>>        *
> >> >>>        * This makes the lowest part of the VM point to the pagetables.
> >> >>>        * Hence the lowest 2M in the vm should point to itself,
> >> >>> with a few writes
> >> >>> --
> >> 
