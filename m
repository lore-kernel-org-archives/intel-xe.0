Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52EAC3DA5D
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 15:44:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6C910E2B5;
	Thu, 25 Jul 2024 15:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CjtyDHdO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5457510E2B5
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 15:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721922261; x=1753458261;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EuGDYj3mlqSq7RWSXkyBcNLuMcjRIUVg/n/pJcyQRyc=;
 b=CjtyDHdOM37TZ5Joazs+Aqwmar8RFfDvPpM6+S/tMPBeFK20n38g0K5F
 Rv1zQZA+vfof4hLaInUxJ4RU27tETJoAiWIkCH7ZjmKSdgZJLXNkO9WET
 c6Ihap1t7ncKJIr7Yyz1oW4z77MPS2tnCA86Wm7+R7K7UQGhDzTZ+f36y
 IB1dX0G4U4F/1v1G16jFnPmi3xPZrBGNPQwYsv5XPYBg3R32mxDho6nZt
 ycxG67xwkEMM+hCz/KzylFhU5xVLmT0CA7Fsh1O0Yzsoe0PllIJnpVdqU
 rfCJ98zeEDMX9APuZcabV403HnjxnN8IUu5DlQeogA1ND8p/nJw8iXnuU w==;
X-CSE-ConnectionGUID: NLNPe7ykTVG6dOBnANAkQQ==
X-CSE-MsgGUID: UDTVyhjVSK2v/NTM++prPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="22581361"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="22581361"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 08:43:56 -0700
X-CSE-ConnectionGUID: UJA+m5RHSry0CfLKhr/yZA==
X-CSE-MsgGUID: XiXW1vtqQoiWNAoaGXuyXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="52841280"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jul 2024 08:43:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 08:43:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 08:43:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 25 Jul 2024 08:43:54 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 25 Jul 2024 08:43:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L2lY2r/HdToO7Ugt/BIxy0yUfb8hBopPPBi43w50mubdzQvF1hJvQLkN1Izz9b6Q6nLgQNj3GRNtsf8kO4UPvhkOJy5rol/6DP5MlgfMdqj8ukjlivfjGe6PVjpEurrVWAxOiWUIs2IKhRtrYAwHFtFgjcnX4226R8IB8fbd6z4RwBVi3+9HVqSm2Gp92j1T8rWs/YVXabcN875rDBTGEes3cmsDBEWGM6kF7Ri2j3dTWo8YZdq9t/PqqpiEY68/hOWJgdxpRj89qAMWYl2DGq4o0LoHcH7nj+04DLJJ0PQxfr/aUR/oX9iIhMtM1j5V5+zJoeIHQuTJvriJrM0Iiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmIAqnoOYD+UZsWgT4WuEQVo6MkQFARFdYyqpNGLaj0=;
 b=y06n8q1suwI+cewA8tQzgvdAO33WiWNfQwvqTbxVaTsON0n3TNc3mBEGrEQ/Ubqqi/yCpkrdP7s9HISky/B3PxfjQ1dipRDG9uTVacgAiWSYF1w1BEhbSvi8YRe15UDFYhGh3LANt2AxBJqjr6P8yPGPL2GwkXM5eWstVXcJDmYrb52MYySkWW+FzEx2zD95ezgDPlMU5nDJ+qzj2oCpnyRLR1WxLy5u8RUY6EvPmjVazetYW12CbL+IHTUhe7T22ZSOUCLDMTpFY0BKlbwrWqZIB1+cFz6YQqlVIJDc6FuJjr1gpe/3LRTf1yONyYgO+2Rg5dXIRGmspPJMY+bDHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB8227.namprd11.prod.outlook.com (2603:10b6:8:184::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Thu, 25 Jul
 2024 15:43:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7784.020; Thu, 25 Jul 2024
 15:43:50 +0000
Date: Thu, 25 Jul 2024 15:42:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC PATCH 1/2] drm/xe: Implement APIs for measuring various
 events
Message-ID: <ZqJyg/y1kClhmrd7@DUT025-TGLU.fm.intel.com>
References: <20240725150550.13085-1-nirmoy.das@intel.com>
 <20240725150550.13085-2-nirmoy.das@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240725150550.13085-2-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR03CA0060.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: 90eb0082-38c3-48fe-03c7-08dcacc0945f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?xWZrgNEBfyMDhqkfLC3RIIZ3RuaKWw2hczQL6tmmbtGDcoKYvZkBmXul8o?=
 =?iso-8859-1?Q?4C64nHb4RBgkbU8/Si7eEWdxIIzr9JVuUbroGg5gHn2pAT5IzMORhok6kq?=
 =?iso-8859-1?Q?2SQUDNsvhhkUvYIUbXfgpdM6YHTVQzMJp7hqIIJTQYPR5qH4DbTpw83l60?=
 =?iso-8859-1?Q?UBN+bqP6852T3mHD8H2/Y89YGURXj2EoatQsf6qKx9qOFYJleyEjAeOxuy?=
 =?iso-8859-1?Q?cokHYKGDkZJbntNQJ2wVWcpG66bTiy09FkjfF0LfO3zoMwloLzgOhlI9a+?=
 =?iso-8859-1?Q?hjgRAoWfUecM4rFGRptUzaib2DfQ6qr5WYqxVYkI0GrY7rXf+EA3FEb5M6?=
 =?iso-8859-1?Q?54le1ZmksNqq5mb5tlf4D8sMQQDj4wtmLyOE/mS95abT1pEMq9u3cGwbuY?=
 =?iso-8859-1?Q?oqhTeWdWpzhIpT5JFcqc1XAaThehyrB5aFkyfqVmbm5dGzU4iKxHs1W0rj?=
 =?iso-8859-1?Q?LRjYdBlAm0ZeUewwX9FGXTtfWinht8JhS1nTrZjLAwLzkzM72O2yzt2bzo?=
 =?iso-8859-1?Q?k45IiX5FuMvLEzP63o6BDLDuCpzn/lcZIS8sNmkXxw5oaMQoZxch132m5e?=
 =?iso-8859-1?Q?PfDsm5/mbI8hpdAt+8Ey5h2sXphL1hmg/origgtqys5Apb++ms/xgX1gtv?=
 =?iso-8859-1?Q?y1y88UfgwtvHRBPV53pZE8Ae0jr7tYBR3Rr1jtoOeyA5U/2mUFcH+M1hzX?=
 =?iso-8859-1?Q?xBpEm5fe2rOavGVfR5Rw7PFFL9YgzwpS17kw9qXSqeQjBR0X+BJ5VEaBiX?=
 =?iso-8859-1?Q?sv9LfFCTb1Fw+P4uzX1tzN147DHJZvZPiTDeNmzqfff4rzT4+ida3I12IK?=
 =?iso-8859-1?Q?nhRwzd9RRUsAH4uok5FdB8QN6vroPDKN5L8fVNwVkiSfXcrJCvNCkxLgUV?=
 =?iso-8859-1?Q?yOwtWsv7E/7zCgRBPOVPEYSRH3Ua3blCpktoIcVt5rXhPB0fCWkciLTopU?=
 =?iso-8859-1?Q?GTzaVzF4qZ4q3zusCmqP6Pi0C9HWY+BoBWUrVljIcvWThmQRzTXYoidRRu?=
 =?iso-8859-1?Q?C6SnlIAcoBhCDTuyARaXPBJFB5zU3pkn9SVUikiKIxFyzHfkdt4u5SOQiO?=
 =?iso-8859-1?Q?jzfrMV3cu3dMmQElvmTdIR+K7pJWCSVeiJDLWZ1J4wvMExqOo1KSX4y2QY?=
 =?iso-8859-1?Q?5aL+Pcy/2V+3RcvCoY9HRuUr/Wy8nnhkVGV4BU8K9DGwzSusJQfpbXO7Aq?=
 =?iso-8859-1?Q?amDTTHnsZ3MWQksrkILz6UDh/tSWVNakrhePJLJ0GaFw7EHos31K7JR/7D?=
 =?iso-8859-1?Q?oIuGTZ3PVDj55OUmk89X3EzLldRCNEEUOqYcamYQqzp4ME16wDyJLIgzYj?=
 =?iso-8859-1?Q?9eyN95526YsAi52RH0yiJWDT/c5DA9SQvvXgXJXiEkZBYNPA9gT55MzMdZ?=
 =?iso-8859-1?Q?Br4TqDC5hLYjbpEbJksq5vpVWBnMSoRg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RTt4MzuZ1dvI37Qy8l8Emcc6vqUoivr16SfPYkhzUIA0SeFfLNc/Yz1zD/?=
 =?iso-8859-1?Q?T0oGvnf/NB6KaR9pyLoq1JKa40YbFB9OPiNu/V+VY3R/l5V0hnWrjK25gM?=
 =?iso-8859-1?Q?c6fyk69Ba11+0tWlMVK3a+3+sRRWI/fmplHUSZb0btPoq2ALGkucbQczcn?=
 =?iso-8859-1?Q?PF5vO73LlS1mtLOmhLLPp/UeY6RQQ7xis7rVyHETra8Prt6AC3+ySn/lig?=
 =?iso-8859-1?Q?pdZ02S/wGN4h5qFCdxSGfyLiIhlWqQlOgT8R1TRrGkCwHZywaR/qYbKrud?=
 =?iso-8859-1?Q?7u97H05QLf9H2kvabW7p6jI9WcwCdNxeZvUxSB+gSpNSUJkInoLg0N/epR?=
 =?iso-8859-1?Q?HzxlpVeXBAf8SlyJgrvGa+t6nN53IwgXQND43YJznDyR/CUZ88rMzI0Gai?=
 =?iso-8859-1?Q?7VukEAxBiMudsA4dZkuYN/Kia+S8bPohev1y38Kfd89PLYZMKwVNN7ZsML?=
 =?iso-8859-1?Q?8M9XEPftis4GPU6qRZB2Z4W37OmryQqZR1LRnFruR9qVnT++mh9WttwgOj?=
 =?iso-8859-1?Q?yeF6zyEqP9mx3TbS0UU9ybNgCM7QEvnWDhAQWGzEm0AALROAQuZSy8AXms?=
 =?iso-8859-1?Q?VBq/cY0D9lxOvNyz/pXDH3rGhVPDQXq57JziMjuvntn5azo8C7BsNNOTVX?=
 =?iso-8859-1?Q?krfp9CZkdRcst2sThzY5w2MmuX7GZKa7eTbMNDFighz1zVoNZNOpZC6I/X?=
 =?iso-8859-1?Q?v2j4ctIiaj/Sc8QBfJeEFKX58dQ7Ncqb7HReJKkTUWouVQwmG6LF9xJDgB?=
 =?iso-8859-1?Q?j07jTvk45DqIQgEMamaTNPOWNMyyZOmXPFJIJgou8K+BGa6FMzrYrw9B3q?=
 =?iso-8859-1?Q?g7se6ytLT6UXUI+i8Tr5vMnHwFwKnWFzbmriojHP32ioMr4hHrqbFrToA3?=
 =?iso-8859-1?Q?9kJsNlRbBJWZaeq1z9ISaMQXS2fkvouojTnxx4rJRP4pky/2afXRzCztbd?=
 =?iso-8859-1?Q?vJQgx+872HanL8/jSV2reMVRwkaxv9zzY7tscgV7ZI2n5o2HmNeIGLZ7Xs?=
 =?iso-8859-1?Q?TXVcoedMafsb/5uFuiij3yBxmDGuW22Gc6YFQBTcYF73ErELcWMqTyIxf1?=
 =?iso-8859-1?Q?VXjqOtojXDJmp461/jqLqAghL5HWEGTSD5gyC5K8X50uGZeVWqvQ0AGEsU?=
 =?iso-8859-1?Q?z/Kd64w8gqAlVVMt/uI7ve08RPFEOzIllPhEN9KqjqsJmhpR64EaMv9d9P?=
 =?iso-8859-1?Q?+Aim43QZFTOr4wH1Jc93EuRBwld3hdGLCKh7H0YYVqyx1pANDr0QbyAtKa?=
 =?iso-8859-1?Q?BBlY7zy2o1jTyRsji6AoYEVCmSdLkFCn0ChX86F65fZfetyLbFeJge3Uz3?=
 =?iso-8859-1?Q?NY+LFVrW0NS9vcS/54jQyMVucEFiTkfGrOjdD+ghb1RHb6pwat62fjh3f9?=
 =?iso-8859-1?Q?NaLcVlqSgdbS8wzl6pITslBn5Ff4hRoJJZZ75MG46xrF8wlfmd1eWeG0E7?=
 =?iso-8859-1?Q?3VTcHcUkEMN6ADzba/dXwXJ9IBFYHuAI0SpTDVNyostw3qLPVoEOqSxKUf?=
 =?iso-8859-1?Q?eD8mpIxqUczh2AGo2FP81+ADVFFoJSS6LkmWmI5IqjFpLvBC5TjxD5QFnx?=
 =?iso-8859-1?Q?rJrlb4ReHeFA/BppQyhB/2ztJpg+a+H0lVwM5PpB6m1SxYotUFgvhs9YOv?=
 =?iso-8859-1?Q?dc/Khv1bp2CII3aK1AvHmKhgFXYUb9F3LAEcU4Pz6lYpAaN57PE5cGYQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90eb0082-38c3-48fe-03c7-08dcacc0945f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 15:43:50.3896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6LGNAd1/JS50kxtD9ys+aac8pSbn1SSAXAmswmw7rMGjW0od8yyxr3Wst0VxNq2qVa56xCizm2dROe9kEu3W0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8227
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

On Thu, Jul 25, 2024 at 05:05:44PM +0200, Nirmoy Das wrote:
> Introduces a set of APIs for tracking and managing events.
> This currently only supports counters.
> 
> This can be conditionally enabled with the CONFIG_DRM_XE_STATS
> config option.
> 

Idea is right but thinking the implementation is overly complicated.

Roughly what I think, in this example a GT stat.

struct xe_gt {
	...
#if IS_ENABLED(CONFIG_DRM_XE_STATS)
        struct {
                atomic_t value[XE_GT_STAT_COUNT];
        } stats;
#endif
	...
};

enum xe_gt_stat {
	XE_GT_STAT_FOO,
	XE_GT_STAT_COUNT,
};

void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stat xe_gt_stat, int incr)
{
        atomic_add(incr, &gt->stats.value[xe_gt_stat]);
}

static const char *stat_description[] = {
        "foo",
};

void xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
{
        enum xe_gt_stat xe_gt_stat;

        for (xe_gt_stat = 0; xe_gt_stat < XE_GT_STAT_COUNT; ++xe_gt_stat)
                drm_printf(p, "%s: %d\n", stat_description[xe_gt_stat],
                           atomic_read(&gt->stats.value[xe_gt_stat]));
}

With xe_gt_stats_incr used at the caller which wants to increment stat:
xe_gt_stats_incr(gt, XE_GT_STAT_FOO, 1);

Add a 'stats' GT debugfs entry (see xe_gt_debugfs.c) which calls
'xe_gt_stats_print_info'.

We can also add 'xe_device' stats too.

This is simplier as no need to configure stats, just add an enum + table
entry, and incr caller.

Also leverages existing debugfs code, honors existing layering, and no
need to malloc anything either.

Matt

> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig.debug |  11 +++
>  drivers/gpu/drm/xe/Makefile      |   1 +
>  drivers/gpu/drm/xe/xe_stats.c    | 145 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_stats.h    |  66 ++++++++++++++
>  4 files changed, 223 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_stats.c
>  create mode 100644 drivers/gpu/drm/xe/xe_stats.h
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
> index bc177368af6c..4db6d707c1af 100644
> --- a/drivers/gpu/drm/xe/Kconfig.debug
> +++ b/drivers/gpu/drm/xe/Kconfig.debug
> @@ -94,3 +94,14 @@ config DRM_XE_USERPTR_INVAL_INJECT
>  
>  	 Recomended for driver developers only.
>  	 If in doubt, say "N".
> +
> +config DRM_XE_STATS
> +	bool "Enable XE statistics"
> +	default n
> +	help
> +	  Choose this option to enable support for collecting and
> +	  displaying XE statistics as debugfs.
> +
> +	  Recommended for driver developers only.
> +
> +	  If in doubt, say "N".
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 1ff9602a52f6..c5d9ec22c6bf 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -117,6 +117,7 @@ xe-y += xe_bb.o \
>  	xe_wopcm.o
>  
>  xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
> +xe-$(CONFIG_DRM_XE_STATS) += xe_stats.o
>  
>  # graphics hardware monitoring (HWMON) support
>  xe-$(CONFIG_HWMON) += xe_hwmon.o
> diff --git a/drivers/gpu/drm/xe/xe_stats.c b/drivers/gpu/drm/xe/xe_stats.c
> new file mode 100644
> index 000000000000..1b8910900fd3
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_stats.c
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/debugfs.h>
> +#include <linux/seq_file.h>
> +#include <linux/slab.h>
> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
> +
> +#include "xe_stats.h"
> +
> +#ifdef CONFIG_DRM_XE_STATS
> +static struct xe_stats_entry *find_stats_entry(struct xe_stats *stats, const char *name)
> +{
> +	struct xe_stats_entry *stats_entry;
> +
> +	list_for_each_entry(stats_entry, &stats->entries, list) {
> +		if (strcmp(stats_entry->name, name) == 0)
> +			return stats_entry;
> +	}
> +
> +	return NULL;
> +}
> +
> +static int stats_show(struct seq_file *m, void *v)
> +{
> +	struct xe_stats_entry *entry = m->private;
> +
> +	if (entry && !entry->enabled)
> +		return 0;
> +
> +	switch (entry->type) {
> +	case XE_STATS_TYPE_COUNTER:
> +		seq_printf(m, "%s: Counter value: %llu\n", entry->name,
> +			   atomic64_read(&entry->data.counter.value));
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int stats_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, stats_show, inode->i_private);
> +}
> +
> +static const struct file_operations stats_fops = {
> +	.owner   = THIS_MODULE,
> +	.open    = stats_open,
> +	.read    = seq_read,
> +	.release = single_release,
> +};
> +
> +struct xe_stats *xe_stats_init(struct drm_device *drm, struct dentry *parent)
> +{
> +	struct xe_stats *stats;
> +
> +	stats = drmm_kzalloc(drm, sizeof(*stats), GFP_KERNEL);
> +	if (!stats) {
> +		drm_err(drm, "Failed to allocate memory for xe_stats\n");
> +		return NULL;
> +	}
> +
> +	stats->drm = drm;
> +	INIT_LIST_HEAD(&stats->entries);
> +
> +	stats->debugfs_entry = debugfs_create_dir("stats", parent);
> +	if (!stats->debugfs_entry) {
> +		drm_err(drm, "Failed to create stats debugfs directory\n");
> +		return NULL;
> +	}
> +
> +	return stats;
> +}
> +
> +void xe_stats_add_entry(struct xe_stats *stats, const char *name, enum xe_stats_type type)
> +{
> +	struct xe_stats_entry *entry;
> +	struct dentry *debugfs_entry;
> +
> +	if (!stats || !name)
> +		return;
> +
> +	entry = drmm_kzalloc(stats->drm, sizeof(*entry), GFP_KERNEL);
> +	if (!entry)
> +		return;
> +
> +	entry->name = drmm_kstrdup(stats->drm, name, GFP_KERNEL);
> +	if (!entry->name)
> +		return;
> +
> +	entry->type = type;
> +	entry->enabled = true;
> +
> +	switch (type) {
> +	case XE_STATS_TYPE_COUNTER:
> +		atomic64_set(&entry->data.counter.value, 0);
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	list_add(&entry->list, &stats->entries);
> +
> +	debugfs_entry = debugfs_create_file(name, 0444, stats->debugfs_entry, entry, &stats_fops);
> +	if (!debugfs_entry) {
> +		drm_err(stats->drm, "Failed to create stats debugfs file for %s\n", name);
> +		list_del(&entry->list);
> +		return;
> +	}
> +
> +	entry->dentry = debugfs_entry;
> +}
> +
> +void xe_stats_increment_counter(struct xe_stats *stats, const char *name)
> +{
> +	struct xe_stats_entry *entry;
> +
> +	if (!stats || !name)
> +		return;
> +
> +	entry = find_stats_entry(stats, name);
> +	if (entry && entry->type == XE_STATS_TYPE_COUNTER && entry->enabled)
> +		atomic64_inc(&entry->data.counter.value);
> +}
> +
> +void xe_stats_decrement_counter(struct xe_stats *stats, const char *name)
> +{
> +	struct xe_stats_entry *entry;
> +
> +	if (!stats || !name)
> +		return;
> +
> +	entry = find_stats_entry(stats, name);
> +	if (entry && entry->type == XE_STATS_TYPE_COUNTER && entry->enabled)
> +		atomic64_dec(&entry->data.counter.value);
> +}
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_stats.h b/drivers/gpu/drm/xe/xe_stats.h
> new file mode 100644
> index 000000000000..dba79ae28714
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_stats.h
> @@ -0,0 +1,66 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +#ifndef _XE_STATS_H_
> +#define _XE_STATS_H_
> +
> +#include <linux/atomic.h>
> +#include <linux/debugfs.h>
> +#include <linux/list.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +
> +#include <drm/drm_print.h>
> +
> +struct drm_device;
> +
> +enum xe_stats_type {
> +	XE_STATS_TYPE_COUNTER,
> +};
> +
> +#ifdef CONFIG_DRM_XE_STATS
> +struct xe_stats_entry {
> +	const char *name;
> +	enum xe_stats_type type;
> +	bool enabled;
> +	union {
> +		struct {
> +			atomic64_t value;
> +		} counter;
> +	} data;
> +	struct list_head list;
> +	struct dentry *dentry;
> +};
> +
> +struct xe_stats {
> +	struct dentry *debugfs_entry;
> +	struct list_head entries;
> +	struct drm_device *drm;
> +};
> +
> +struct xe_stats *xe_stats_init(struct drm_device *drm, struct dentry *parent);
> +void xe_stats_add_entry(struct xe_stats *stats, const char *name, enum xe_stats_type type);
> +void xe_stats_increment_counter(struct xe_stats *c, const char *name);
> +void xe_stats_decrement_counter(struct xe_stats *stats, const char *name);
> +
> +#else /* CONFIG_DRM_XE_STATS not defined */
> +struct xe_stats;
> +
> +static inline struct xe_stats *
> +xe_stats_init(struct drm_device *drm, struct dentry *parent)
> +{
> +	return NULL;
> +}
> +
> +static inline void
> +xe_stats_add_entry(struct xe_stats *stats, const char *name, enum xe_stats_type type) { }
> +static inline void
> +xe_stats_increment_counter(struct xe_stats *stats, const char *name) { }
> +static inline void
> +xe_stats_decrement_counter(struct xe_stats *stats, const char *name) { }
> +
> +#endif /* CONFIG_DRM_XE_STATS */
> +
> +#endif /* _XE_STATS_H_ */
> +
> -- 
> 2.42.0
> 
