Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DC0C3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 16:31:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D5B10E686;
	Wed, 14 May 2025 16:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WHyCSFAi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F02010E686
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 16:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747240270; x=1778776270;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FmWftH3n8X/feQMbSPaXfZij8GP2/SgeHfGQNJDz6oU=;
 b=WHyCSFAiDdCrfG1KYkXnVEkAxhttR2qpNySjWMh/K2Kwv2hCCbF5aI5R
 8vNqDLIHYxNZuyhD2NKhPOmkGokJTgY+7NmWGUGNGrrl5gnn74TA9OiGR
 6Xf/Hxp5RxTwLQJBIGcdHeIWQ4ZNIu+myXLnDFQJKK8sRX2F+KLt26hN5
 naH0+JG5e6mtZBFmGvAEroHzO9D49ZgSsjI/k7n8O1wNN9CtFt3NY30BY
 fMDlk8c2V+Uh1v5/Dvaayxn9PAsa4hKPtEhQ8udFN5wff0LWMQjElHvDP
 tYvzlZ8yDEJEj1+jf7LD262kve3xQitnMf32wrTpxMeLKe22ItkPgn3vr A==;
X-CSE-ConnectionGUID: CNf/XcihTH2jSkfg++8S4Q==
X-CSE-MsgGUID: rWuERAvhRgCVXSbRfdFapQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48260203"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="48260203"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 09:28:40 -0700
X-CSE-ConnectionGUID: IFu+S9JXTTmxh82Ajwjm6Q==
X-CSE-MsgGUID: 1LpUt2d9QNiFdbqHZv9Vbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="138150433"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 09:28:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 09:28:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 09:28:38 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 09:28:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=efZFLpPa72paD691zz2obv5D4XuQCAjs/ogRx0VDtO5JvvEPqiQI5FH/JTVVBzFKO4+G+/W9OVp2/kGKZO4kNTwUkSCbWiGsFg89z2zovGNnrDNDmGD/MWsMSl+OWd9vzt38d88ga7Dp7WAtwdkMx41XIE+CYEX2UM3BIOum7kPlD8jpzCOW+IKZLS3AbAnYnWsSxDjnv23hYYpIOm7Evg03DrDkeX+IZ9KwcJJ/icipLrtdC+83YAuTtPHcGXEGlhpGxafOTRncCB0XSo2zKt1MzmKhunRcfRAOFtVBJxyMHlnnHFkmUhJP1KbUwknACXA4x6G15zHnmhj434C7MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/Xy9pxqiE77shRwUhOhlV3A0pcFKa0gEBqJuOdrzug=;
 b=lYpQqxiJxJVRLeCE4hG8OMnsJqGB08gQ7rcpm0argdM8V7iNrBBZF2lfsYD3E3vgD9ahBl+BgFy7Ux8WFSfsci3xwQj4Bz2RlPsbS4itmLOh5rGNrjvWC4rLmFcG+EmpaT44w9+U1AWqLSZ+8BYVk0GlfSF49/v+N2uEOMC3apMeOq/YnBKF+Z8wBal+wME+mHwoaV7xEqjWNxbJy4VpPl///m0L1zuxSKBg5wHVepTdzzDulMGpC3NaGRW/1dXgJOrB0+my9LDjJvYucAruxG1rkpIY8LQadOk8XHNHW9i9vVJLE6pO5o/+5rG4mc8wqNL1bsnIOYT0WWoAmL4lBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB7920.namprd11.prod.outlook.com (2603:10b6:208:3fc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 14 May
 2025 16:27:53 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%3]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 16:27:53 +0000
Date: Wed, 14 May 2025 12:27:49 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
CC: "Purkait, Soham" <soham.purkait@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>, 
 "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>
Subject: Re: [PATCH 2/4] drm/xe/xe_debugfs: Exposure of G8 residency counter
Message-ID: <aCTEhUCSIxVJJSNT@intel.com>
References: <20250514080721.265515-1-soham.purkait@intel.com>
 <20250514080721.265515-3-soham.purkait@intel.com>
 <CY5PR11MB6211DB2EB721F392610831779591A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CY5PR11MB6211DB2EB721F392610831779591A@CY5PR11MB6211.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0129.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::14) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB7920:EE_
X-MS-Office365-Filtering-Correlation-Id: 52224fb1-7b07-4f41-8bef-08dd930446a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p+gGnh2trnywIgDczUccWHr9T6EhQ0hwpWwB4NmtHwmSmzTM5oJC9z/+Rj71?=
 =?us-ascii?Q?FLpx641KQ6Up2kQuev+isaXNjd8uCyXdmwr+7BUHO/QEgNa31Qa141D3A5Q9?=
 =?us-ascii?Q?tTcXduc3SPf6lXG07O+d0zGKva2u2/6/zhk1HIFTLGCd3NHXOhb4isD6C3hJ?=
 =?us-ascii?Q?5qaGU86wt4vLcz98COJiBKfhc11Jzb28sHJCEgO0K9QT7BfkaBeOuEwA0HZw?=
 =?us-ascii?Q?KsCc/b9rQuYnMcQwXRvuaOz2WkJlM1jLxiyMEXFh4ssE2WyrYm7S2ktdP5Lu?=
 =?us-ascii?Q?iYopmlQTqzEUFuVhd6r2g1FfQl7A8NSClN/N14/OYrtRgelilKRlN7Kx1emA?=
 =?us-ascii?Q?Vh688hdP6gX3D7VaIelPuJEZ8cUohorYS8tD0pCED/lEK6whsx+EpQT9kWvK?=
 =?us-ascii?Q?kxX8edrxKNzkT5cjU8yjOOTSL8VyQxBRn/5r4bbLnvxWSzhTqn/QXoGO1YN5?=
 =?us-ascii?Q?tzcJzd4m5Jul7hW5eu12skxjDPhDjh3Rxoe3qyW1qEZuxWj1dxWBCDTlSPfe?=
 =?us-ascii?Q?/XlTYiqc7Gw632qsx4PolUQiKcI28wuMw7233uhiESExuAOmMj3xHoiGIHwM?=
 =?us-ascii?Q?L+V5i//Pa63GwrDc3vIEgl7IrOSKFf3v6tUwZsY/9nk30MJgZR/qlOtbiV/8?=
 =?us-ascii?Q?KGmmOHnL685/5u8SPRL09a2fGhIvqBSccYfs977DMcIZKJY4GD77g9VmOnv3?=
 =?us-ascii?Q?ez6G46ZIlhJAqy8ZK8M/83VKKtq+5xJ5aEWhB/jH72g8PxJU1KSFIvXpEpVG?=
 =?us-ascii?Q?3q6LLo03pq/+CscvVYnQw/8ukc3BYq9nV4WWdJm/8xgvnX5o1W5+9CB8uOLs?=
 =?us-ascii?Q?bG+zxGgM4RT8SyOwVIXyoz5llLfVkfm/xU0P1nNYg/MYaVS6rS7adAGxaH93?=
 =?us-ascii?Q?VOq3W8jnUr2jhUwqbzkucYyuodNgDDlsqBcVoZwBXH1hTCY6Wg8p6N093XT6?=
 =?us-ascii?Q?QHyh7p3V5Ie6YFPH1Ozd4y7y8WGye1lJI87Ub/Bw1pWO91BX/v/F+FgY2pno?=
 =?us-ascii?Q?SaqxqF75RCSaezrqOj/uRDwkj3oo9u5olCCW+xY4+ubGduc63hy+XZK9LVnM?=
 =?us-ascii?Q?2in6AQEoft7RmsaV81RGyBgJro4r6fTC/0uyMWKvcdKlXeAoSYYx3GRb8kt8?=
 =?us-ascii?Q?82Qu4ionLtzS5+5SLsqDXhNLF5DjQp4Vo4CIOZLwRrm5d7PY7gx21ak892Oo?=
 =?us-ascii?Q?cXdg5Deys38xYf416bh26btIMaiKGjZritv4J45HCvSfIlICKtO8ZPHWa8xq?=
 =?us-ascii?Q?rDEu53AzziFUZXoteIHeBFTtm/I5dyENf90ly4bSZw4UUwaeA38L1kfy1m20?=
 =?us-ascii?Q?v9tHd/WNTqSvcarYmH/i9KfZQM0iNEkSWhnc/duT+dKHUPziq4oIfPP6IcfD?=
 =?us-ascii?Q?wFZqqaq5z9y3Qy4SWwI/PosiYVLRh1i1vA7MRqdCnOfKOPGJHKh9lKKk5ZW6?=
 =?us-ascii?Q?IuKVXZN4fUo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4fLwQa2PRRwtC4CKScqedjnJYLOIQs3STM+c2S2IxA+tnPfhjj7vUsXtGtkS?=
 =?us-ascii?Q?yadKLAAViZVUL5zTqFbIkm76p+IWbX25S+WU7jH3ZUJM8ApaGaI2KHlgQ2ig?=
 =?us-ascii?Q?9C2dolVMXMa9onyoJzmA84zU2zOhsATMdZSWnZmSds48nbBH8SRZufr9O3ii?=
 =?us-ascii?Q?0oUKEhdjx+gkWsnRHbA4uZjDJMF5jwVzyIU7iwrYXwdVXIxSoESGntWgwrPm?=
 =?us-ascii?Q?tCaf+Q6dC9/8cRHvoVHDvBk2Oi0a1SESkreGPvHvJa0BU8t+lDhN9VBIJuBQ?=
 =?us-ascii?Q?cICfLpInSQlUG5exY7nNBrkgWOgG7lY+JeSf4sOdXFx7kyRJtzLuua1rFPuP?=
 =?us-ascii?Q?CugSt+mXPF6CoZwG9UxOEni4dE69Egtm+tnhhswk9FPzPyJd8F7GLcqH2aFq?=
 =?us-ascii?Q?C0zLoTospsAnuCcEz8Qz457ZqvfMNYWFotVfPYZq0e4AseasauEBQb22FLoE?=
 =?us-ascii?Q?F0+GvKOGJd6XDpC21i+xGOerXWbDbXuFBNm0CJ3vVUWDO6Meye0eUGQpBlpY?=
 =?us-ascii?Q?YXky/dSAo4YrFNINgFUEEPz9MsyYrgjIc8wpcyDj2RH2KgqpBYWdpCP31auF?=
 =?us-ascii?Q?BpTlfGKnPvPlz1GFeKvgdnLYswqQqXdXPxHfykXeXsqvPtRuA72xvEYONAXd?=
 =?us-ascii?Q?FWJzbbFS4Lg3h3R3u2hrMnr2FVOvVHgCHbX0MZR9H61rjE1f9DQlHLN6Tmx3?=
 =?us-ascii?Q?b56o+x2jWfhBl1JzL7wNVibfPeR0X03J1HJ3t+76Jg3Jp7jw4lve06XlM1Sb?=
 =?us-ascii?Q?zRyHb9GwFsB4pX/i+H43VKwoaHFVNcf60WbjHNFxZ5A4O7ArXJKSp7XuWajs?=
 =?us-ascii?Q?wBWW+lWttaO2fchHG5/WzV79NeDspFet8jJ/A/dm0/B17WsijM+NJZaA+JQ9?=
 =?us-ascii?Q?63y4trM6sEFVAjsGh7GccTNKlYNPizTjr2lAfeU0y4nb7vdsjxn/3Mns1i5s?=
 =?us-ascii?Q?0XYZ8KNoaQw8onIiDf8aAPE3V9VWKCrf46PzLaYQU0WTdhQf5bvY14f/2p1x?=
 =?us-ascii?Q?UrykCLdq9Z03c5ibHrEGfWjFay76lMj/N8MbGSM2BEo0m4WaxxWF+IrVghF0?=
 =?us-ascii?Q?BteinjsjzKmWrNCiRP2zvHkCsog7j1Mn+5l7+RBo6qYRY63/5DC3XusZA9HY?=
 =?us-ascii?Q?Dqhn1QLEB84IyBA18GfjJexng/QVhSZZ2VBPzs+ERHv0jOye1H7DNgWJQM2+?=
 =?us-ascii?Q?exQ2oLPn/ztEarj5r3vIn2VcHCIRXZn7rXsTrcIX5YZWgwikUx4DSqx2xwuJ?=
 =?us-ascii?Q?A0U7TVoJb9R4VV9PrKgvwOmmRZ+FPzhZJxS5mhpw+DhovRv0rOzGEtWh8Git?=
 =?us-ascii?Q?GCHLub3iOz01EQV9XWGKk/BlkS4rs2MbpFIEH8kTZsB0ZqXvPcGfw9pXOvOB?=
 =?us-ascii?Q?rFDxstpSxRhgNTvgVwxcZNCc7nSDEbdj7czQJ254pvB57LSkOHE7zPRgppQ6?=
 =?us-ascii?Q?PStnxljBwKaf2UEQsWyySPXEL4UotoOr8L69KQ6ps6SigjQwJxs42uGJYnmH?=
 =?us-ascii?Q?gxaQGbhffPO25Z8cfolwd25/X2zPe6CP/6UgSQkGJjLE6GIvEL259v9eXn9U?=
 =?us-ascii?Q?n+WgfkK6VwH3KXDuALRWXc33Y9GFCzOUvvonScgEr9pQWBH90mdugzn91guS?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52224fb1-7b07-4f41-8bef-08dd930446a0
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 16:27:53.2642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1m6McWvhPumv5Ci3UlZtMXPy/ZO8PE6JVoDAwv5RPx5gppP4YoKgflY6j+NJW7Hj/+meUEFDLqu9O8vTq9JUDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7920
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

On Wed, May 14, 2025 at 04:44:14AM -0400, Gupta, Anshuman wrote:
> 
> 
> > -----Original Message-----
> > From: Purkait, Soham <soham.purkait@intel.com>
> > Sent: Wednesday, May 14, 2025 1:37 PM
> > To: intel-xe@lists.freedesktop.org; Gupta, Anshuman
> > <anshuman.gupta@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>;
> > Poosa, Karthik <karthik.poosa@intel.com>
> > Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Purkait, Soham
> > <soham.purkait@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
> > Tauro, Riana <riana.tauro@intel.com>
> > Subject: [PATCH 2/4] drm/xe/xe_debugfs: Exposure of G8 residency counter
> > 
> > Add a debugfs node named g8_residency in order to obtain the G8 residency
> > counter value.
> IMO better to expose all such residencies under a debugfs called dgfx_pkgc_residencies 
> CC @Vivi, Rodrigo for naming suggestion. 
> Context: This is similar to cpu PC8~PC10 residencies. i.e  /sys/kernel/debug/pmc_core/package_cstate_show 

I'm with Anshuman here. I'm bad with naming though.

Perhaps dgfx_package_cstate_show ?

And format something like this as well:

$ sudo cat /sys/kernel/debug/pmc_core/package_cstate_show
Package C2 : 3250051350
Package C3 : 19056503
Package C6 : 929010443
Package C7 : 0
Package C8 : 2718
Package C9 : 0
Package C10 : 0

But of course, just adding the ones that are relevant to us.

And dgfx_pkgc_residencies also works for me... no preference to either one

> 
> Thanks,
> Anshuman.
> > 
> > Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_debugfs.c | 37
> > +++++++++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_debugfs.h |  2 ++
> >  2 files changed, 39 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> > b/drivers/gpu/drm/xe/xe_debugfs.c index d0503959a8ed..f9ab6a03af29
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > @@ -11,16 +11,19 @@
> > 
> >  #include <drm/drm_debugfs.h>
> > 
> > +#include "regs/xe_pmt.h"
> >  #include "xe_bo.h"
> >  #include "xe_device.h"
> >  #include "xe_force_wake.h"
> >  #include "xe_gt_debugfs.h"
> >  #include "xe_gt_printk.h"
> >  #include "xe_guc_ads.h"
> > +#include "xe_mmio.h"
> >  #include "xe_pm.h"
> >  #include "xe_pxp_debugfs.h"
> >  #include "xe_sriov.h"
> >  #include "xe_step.h"
> > +#include "xe_vsec.h"
> > 
> >  #ifdef CONFIG_DRM_XE_DEBUG
> >  #include "xe_bo_evict.h"
> > @@ -185,12 +188,43 @@ static ssize_t wedged_mode_set(struct file *f,
> > const char __user *ubuf,
> >  	return size;
> >  }
> > 
> > +static ssize_t g8_residency_show(struct file *f, char __user *ubuf,
> > +				 size_t size, loff_t *pos)
> > +{
> > +	u64 reg_val;
> > +	char buf[32];
> > +	int len = 0;
> > +	int ret = 0;
> > +	struct xe_device *xe;
> > +	struct xe_mmio *mmio;
> > +
> > +	xe = file_inode(f)->i_private;
> > +	mmio = xe_root_tile_mmio(xe);
> > +	ret = xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
> > +				xe_mmio_read32(mmio,
> > PUNIT_TELEMETRY_GUID),
> > +				&reg_val,
> > +				BMG_G8_RESIDENCY_OFFSET,
> > +				sizeof(reg_val));
> > +
> > +	drm_warn(&xe->drm, "G8 Residency read from mbx 0x%016llx, ret
> > %d\n",
> > +		 reg_val, ret);
> > +
> > +	len = scnprintf(buf, sizeof(buf), "%llu\n", reg_val);
> > +
> > +	return simple_read_from_buffer(ubuf, size, pos, buf, len); }
> > +
> >  static const struct file_operations wedged_mode_fops = {
> >  	.owner = THIS_MODULE,
> >  	.read = wedged_mode_show,
> >  	.write = wedged_mode_set,
> >  };
> > 
> > +static const struct file_operations g8_residency_fops = {
> > +	.owner = THIS_MODULE,
> > +	.read = g8_residency_show,
> > +};
> > +
> >  void xe_debugfs_register(struct xe_device *xe)  {
> >  	struct ttm_device *bdev = &xe->ttm;
> > @@ -211,6 +245,9 @@ void xe_debugfs_register(struct xe_device *xe)
> >  	debugfs_create_file("wedged_mode", 0600, root, xe,
> >  			    &wedged_mode_fops);
> > 
> > +	debugfs_create_file("g8_residency", 0444, root, xe,
> > +			    &g8_residency_fops);
> > +
> >  	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1;
> > ++mem_type) {
> >  		man = ttm_manager_type(bdev, mem_type);
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_debugfs.h
> > b/drivers/gpu/drm/xe/xe_debugfs.h index 17f4c2f1b5e4..86868a3cd379
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_debugfs.h
> > +++ b/drivers/gpu/drm/xe/xe_debugfs.h
> > @@ -8,6 +8,8 @@
> > 
> >  struct xe_device;
> > 
> > +#define BMG_G8_RESIDENCY_OFFSET			(0x540)
> > +
> >  #ifdef CONFIG_DEBUG_FS
> >  void xe_debugfs_register(struct xe_device *xe);  #else
> > --
> > 2.34.1
> 
