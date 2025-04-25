Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A025EC369D5
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 20:40:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F2910E9D4;
	Fri, 25 Apr 2025 20:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g1Y3mFKs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729AC10E9D4
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Apr 2025 20:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745613652; x=1777149652;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Cb54+EJcJOVOJFujLrsxgJieR3iQEu4ajFmIHnlLHO4=;
 b=g1Y3mFKsGy/nYMlgwIia3c++6uWcFeJNnunlOFgQRa1Zo5NvSM6T5tBH
 233qd1HVdBC4gklCQHm4a+BQF37Ep+SZJ6nT5y7KP3wr3L5FgsaQFnVQU
 WA899wq8k8+RNvHFGVK7YGeiq6btpAIuA668uSaNArlvZePyV1XGXiMV6
 bAtLyt3T7rezCmwPafquEYSGhzH0Oj0UxzNYILm1glE6y05ssiF1X6qJB
 tKNd/H41XUsL4Br7+J7NlCzDY8S0FhnuKv/Yy1347xz9e2gWjkC4I+oh5
 JXXToUFErmRLGR9hba8o5ecxIS7bnURCeue0cqqBlnBMzKBfn2Nc4i3UH A==;
X-CSE-ConnectionGUID: ZxVqv/AfT4SjIwyThNqSvg==
X-CSE-MsgGUID: 6sheZ/x4QBmsq6VsI3ALVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="47423774"
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; d="scan'208";a="47423774"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 13:40:52 -0700
X-CSE-ConnectionGUID: qD9SwyKOTNunZ3XQiWFVcg==
X-CSE-MsgGUID: AC0UKR3IRbmnf6CxMD4AXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; d="scan'208";a="133931140"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 13:40:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 25 Apr 2025 13:40:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 25 Apr 2025 13:40:51 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 25 Apr 2025 13:40:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=US7dwHItM7M7ugBhdAESjA4O3G4Pc7Fdi0m7DgQxhGvVtr6IG65RnsMxKlmerc65Wt0WOABRzSRng6Mayki0sQwJr/WRukQLIv9/pR+V3818Lar4RWK75JXhJAcqMYHxQE+ejc+6qpHVyY5hn8yJb585C6ILozpCKUmkkCMpBgixgc2SgdJpVaCgeR2Omxpegupn8FQ9WNEKlm0iPoiJ38koZLpw0uaGnrYEyZRAPxATEypongsVBSagItsnC0Rkf/RV200D67UBWvGggX4oeh7tHpCqsZDCdGmdH0csexkdEoQKnNcwKXOjWavh4JTSM6POUs/mCrBjZ4Jprofo1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKmbjP7OQ0O3H5tW8K6jhob5Rtnz5ySiOWwwjEZAbqs=;
 b=uQDv7C5iL7dl9jtiPH69NyYv3VWxc+/rylqI7mUyJL7NItytAEWN3G2nwYn1Ya6jIS9Fpf3lkdbyPPlQyVhxYgXzdrr7xtelcVDXCnQc8WYIhbhyicYD53S6NgLzNekoCx+Hjfvkt/RDtmXLxV61M9NoY1bnAFbKP7ghqC8RyFE0mxu7jlqJQjTrGTM2og9lkWZtDRnjPKfwFEArVkpdOHzOWO3F1wYR/YZ1wNO7XUvXQQNCMFfBKxjjuBLDsl9x76xQIf5XEE24UqVofqBs7G7NQJErvRT8iU4t3OnkIISoFNteF7dfG4S7PJQ68O5iVCDjWWDCWeQsB+4bFwggvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV8PR11MB8723.namprd11.prod.outlook.com (2603:10b6:408:1f8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 20:40:48 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 20:40:48 +0000
Date: Fri, 25 Apr 2025 13:40:46 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Add WA BB to capture active context utilization
Message-ID: <aAvzTo1y_rMJpmy9@unerlige-desk.amr.corp.intel.com>
References: <20250425191039.1551559-1-umesh.nerlige.ramappa@intel.com>
 <aAvnnnVaY2qsmCtI@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <aAvnnnVaY2qsmCtI@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0285.namprd03.prod.outlook.com
 (2603:10b6:303:b5::20) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV8PR11MB8723:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f98d18-8341-4a05-f9f9-08dd843975f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlpUdHp4NmlEZlVsYmZTNXJ1Umg5OUQzWVYwVFFHaXRTbThJUnEwUGlRcUFy?=
 =?utf-8?B?YmxYRnlTWktUOFJpS3BKVEZ0bU9wa2k3eks0Y2dRVElGUG1GaVRYRytWd1BQ?=
 =?utf-8?B?UU1BeVMyQXYvc21lRDFCRjdreDY5T1VjQ1NXT1VJRCs2SXdBRkwxTmRBbEtk?=
 =?utf-8?B?N0JielVhS09iQTA0eGFCdXAxNC9mUkRkM09EVldRVXh6dHVrRWtXazd6dGND?=
 =?utf-8?B?L2g2VVZncnVPK0NMdWozQnE5UXdSN2tLQVowVjFlcjlkSThhOEdwUmVYZjVY?=
 =?utf-8?B?R3ZrNElsSFlINzVDa1dLTkRVUmdmWDFBanVkaW9pYnJXNzQ2V3FHeS9ja3lS?=
 =?utf-8?B?RDlkd1ZlQlpXT2NiNUhFdldMQVNYaHFDaUxMdnJTdUVPSFB2MEFLYUVUTGNI?=
 =?utf-8?B?SXFOTnBiSnlqd0xueDVOa1hINjlxc2p0TDhlWjFNbk96Sk5qcXNtdzE1YXlQ?=
 =?utf-8?B?eWJYeWtmUTd6bStMT09rb3JvcmFxWmZlVENUampXNFJIOUhGek52bVpsWitP?=
 =?utf-8?B?Y3NiUmZxVjZpcFBQUnBEZHdOM2xLNGIyRGRHc1ZhZU11NEhlY0RzTURrQk9C?=
 =?utf-8?B?b1QvRGFXRHh3ZnAvZnlJeTlUaVN1R0lsVUxLZWlWQlp6T3MxaFFjb2RLUU94?=
 =?utf-8?B?WEVsKzJTaHFqUUtud3ROV3hlQ1FEbUxsclZBZ3BVVVQ5QUR1SDl6OFI1WTNC?=
 =?utf-8?B?UmVnSVhrY2FmSFZwVEpzaTU5OUZRNmFIQThpWXlyOU1MQUZLaXgzd2I0aU5F?=
 =?utf-8?B?cmxSaVMyazMwOFQ3NVA1RFZZTllwRmhLQ2JrRWxsckFIUUFZUGtOSWJ2MDlp?=
 =?utf-8?B?OTUyZEdUbVJWaGxGQTFpTWZXNFhjL2F2MzR0SWFNYmRENFVETDJpUnRtTEh6?=
 =?utf-8?B?c01FY3g1OFJhSzdHUUQ4MFMvK2hmK28vOFhvYWRTVDRzWWE3TGIzT2VJRGM2?=
 =?utf-8?B?NDNlWDB2MzY4OVZETHVhZGVFN3AvUEJmMjFBZHBKWlp4OXhJekgzOVF4UW8x?=
 =?utf-8?B?T2Y2STk5WUt5LzdEeGI3cWI5TmFBclZmUVhXQTJESnQ0MzZJSlJCd1dlVVd3?=
 =?utf-8?B?bmp6b21JMUQvVnh3VlpyL2dUdDVBeUFidXIrSmJyMUNkQlZoMDlYcjhWVE5M?=
 =?utf-8?B?QmNUSG5Fa3hSREF6R2JtNjM2SFl2MGkremRnRlhWanFCK1lPdCtOaWJFbi96?=
 =?utf-8?B?TkJjU05wbHI5YjJJK21yWkEvKzNTQmkzYTZrUGVxMnB3RlVQaTN4NXhDZlBu?=
 =?utf-8?B?SDdYUzNUeU1pelVOLzErZFBIWnBoR2xIQlA0ZzZkQk9aanZWS2pkSFZaaTVJ?=
 =?utf-8?B?TCtjMXNyUjVaUUJBRitON0tqajZpVUJudUJiTVZTMWZocVVFUWpTRDlURXZU?=
 =?utf-8?B?cElNOEtIR2NkN0VVS0p1TXYxbHdIaGRURnJyc1B1NTFvMy9vK0VPSThtU3ZR?=
 =?utf-8?B?ZWpFbzdBNnJ4L1Fjblp2eXBMb1h2bHVDM3A2TUcvMkJvRXpodnYyL2lmYzhv?=
 =?utf-8?B?K0NSQ2s4eGcwRUljak8yRyttR00rK2tJRENvVTA5S0lHOERQN2VwMnFZOTQ3?=
 =?utf-8?B?NTJhZXBVOEdmVnBqaWZlbitjMmZMWnlFWkpTOS9NV3JlSVZObGUvcUlxYkta?=
 =?utf-8?B?cUV5MGRYbEI1UU9teUFlSXdGT2MvMjR6N3pvMDNmWjhTN01tYlQzekxJOTRV?=
 =?utf-8?B?S0pvWXp0VytsV0F5SEVac3dGT1ZCekphTlVmVmRpU2hBb1hsemw1N0l4aGZI?=
 =?utf-8?B?UjNuMmNVY0dQMkRmR3FVenlGNS9sWDZNNHphQ0R0N1RzZWxVZHBNcStubCs3?=
 =?utf-8?B?VUU2V0k0cU55dkxPaWJDMGdUK1JWWThsRktsbXVOVEc3L1NMTE5ncHRQanpT?=
 =?utf-8?B?Tmg5Y3E4VXNzeExYRGxwTnZRTFVJdTViUk5ienVnTzhXZUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ek9ic3N6emEzZDhLSGxybnFhcVBZK0syMG5yTTBNbFRjQzBxZC9lWTlvcUEr?=
 =?utf-8?B?SHhHSHFJY2xGalBRNENLYjlYaENKOGc0UzNxQzcvMEhaZUFTQWtNKzkxUlp2?=
 =?utf-8?B?WWpKeWk5b3FWR1AzMjQrcEg5TmQ2OUpsNUsvZUhFbDg1ZFJ6amo1UkNQc0k0?=
 =?utf-8?B?MDJqR2theExjNWJlQlZ6N21xREFsMzRLRHlPUGwxNStpMWljUFFWT0d3Nzdp?=
 =?utf-8?B?LzFUdUkzSStaOTBEenB1eHVzVy9IYytKaXVRVk9jeVN6VFY1ZjdrcjhoY2Vv?=
 =?utf-8?B?UUFpZzhxajVWdWs4U013cXJ5YXMvWVg0RG4rVnZGYkM0Y01KM3F6MFZMdzZY?=
 =?utf-8?B?WjVUQW1Eamdad2xKT3BacFg4Y2sxUlh6OUVrYWhkTTY4dmpVK09mcVd2MDBL?=
 =?utf-8?B?WitXb2MrK3ZFT3VXeVM4N2NqalU5aWZmOXJtMm9sOGN2a3RhTTVFMFROalc4?=
 =?utf-8?B?T2hvLzV5UGZvb0hMMXUxSDJ6emV0a2ordmxhMFJxYTQvT20vRHpINXVhajhT?=
 =?utf-8?B?UEpnV1IreDF1VDRadXY4MUI1Q1hiSE5rNmZXYXo3RDFEN28ycVE4YUcvRE4y?=
 =?utf-8?B?NzJhSFhueURnMGFRd2VlN1F3UERuTnRHQlpMczJ3VEliNCtQY0hiY3hRUkZp?=
 =?utf-8?B?TWR0Uk9pL2tVWEhIcGR6WHJqYnpoWmQ5WndoekNOdDBmMFVPendvVEtzMnEw?=
 =?utf-8?B?cW8rWTFEOTk5MUhQL0dqb25QUzBqK3oxZjh0eHFudVJLSW5CRTVQRW1XWDZt?=
 =?utf-8?B?cE1DUHN0ekUyZDNOUzZhL1l6MzdSSjJLckVkOEtWeFRzS1BEZE42V0dDVFhO?=
 =?utf-8?B?NnV1eERQZ1p1ZEphcVJRa3ZKQW1UR3VXeGtjeUxwM1lZaEllZ2RPOUxlNWdG?=
 =?utf-8?B?NXF6VC82QWxBOTZ6TCs1M0pEb1luKzl6UWp5c0lyRnR2ZWs3MjFyT2paNGxE?=
 =?utf-8?B?LzBkOUpMYWFVc1piNmNQQ21CZ2tocm01bldOQWJxMEZYalVqeENRYThGY3ov?=
 =?utf-8?B?ZzRwTk9UQ3dhb29hOHFKZkQ3YUg2Z29GWHUxWU4zTllyc29ldWtXRGVpdmJq?=
 =?utf-8?B?MnFWMlcrT2tSZmhsb3NpaHhRY215dkVzVk9hVFdYanJ6WERucHJ0cGwxUit3?=
 =?utf-8?B?YmJjOTJBd0R2RHJTbW1FYU9GWmlsVW5TamdROERJQ1VmL252bnUwYXcxbmJx?=
 =?utf-8?B?Z1ExNUNpY1cva3hHZFF0ckxIa3VZOFVSVkxvSFZxTGRET3p4L2V2eXpMci9r?=
 =?utf-8?B?SEtDRWJzN3VtM0dmR2ZjNWwyWGlRUkhtU3ZNdi9GRllWcUZZRjJUSWxndmlH?=
 =?utf-8?B?TjF6TEZ4V3VXNGhMQklIY3daaTB6WllrY3k2OVRzNHpPUGhLMkppOEw4dGl1?=
 =?utf-8?B?WVhQaUpwUjQxWkJiYkhac2kyUWZVYVNGRkpGbFFhc2ROWWdrSVhnT2R4anp4?=
 =?utf-8?B?aTNoWUZhYzZGcm45eklCbDRHYjBIelRNWVNHU05hWUNna1FqVXFmUU5FWTN5?=
 =?utf-8?B?T2ljTy9ySkUraVFid21USnYybkJIT0VscGJlNWQwWmtXenpwR05tYURyUnVG?=
 =?utf-8?B?RWZ1b3lvVkZFWUZpS29oTUVWMXJ3WnFNTVVjSktsNksvQys5d2tXeVFET0RK?=
 =?utf-8?B?OHk3VUtleSt4TUpWcHlVU0RmaE5aUFFtY3FUOWlSM2YwRmZCTkxXNGVQdVZX?=
 =?utf-8?B?LzJQYTRmaUwwamh6T2JZSVZxc1E1T2dkcXZhYVpaalRvdHdwbFRMMjVienRR?=
 =?utf-8?B?OEZEQTZkNWZGRkptWE0zVEVQTzN3M1pQaEViTUlEVWxyL20yVlcwYXVMeWlZ?=
 =?utf-8?B?UktyaGN6bm1mcHNZaDdzS0tneVdIMm9QTkxuN3VTR21NSUhQaEI1ek1JSlhh?=
 =?utf-8?B?eWFwSUI5dmZ1eGZ1WURxcFlydFNjU3kxWVZPNStjaGtZb2pHaVZ1dFVwODNl?=
 =?utf-8?B?ZUFVOGo2Sml4Vmc2QmE4TWY5NnJRMFBGOGxHQlAxSXJHYlZ5RDRkeXZhWVg1?=
 =?utf-8?B?NllCVHhEdVFzZXdpMGhuWGZYUDRSUFJlWisvQXhITG1xbXpzY0I1ZWdyNjFT?=
 =?utf-8?B?cVMyWlJIVzdORlhjR1lLUTFGeEJFUWFYSGlkckJuc2Q4TnVxUXFMNEV2dXRm?=
 =?utf-8?B?b0ZuZ0dNY01na1ZBancyTXY5R2orYks4REptSzJTN3lvcVF4NHJ1TUNvWDVF?=
 =?utf-8?Q?pXFiZThX1Y4xV4mAtDO/sU8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f98d18-8341-4a05-f9f9-08dd843975f1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 20:40:48.4764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjvBLLhkqBqZ9u0FrrOfuuMNuRBcwb/4S5fESEhJJtGlDE75NA0LvIv6m+qqT4LsG6RlatFwyLIVyEBVwuADawnGaFG67WprvfMA3p81Ps0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8723
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

On Fri, Apr 25, 2025 at 12:50:54PM -0700, Matthew Brost wrote:
>On Fri, Apr 25, 2025 at 12:10:39PM -0700, Umesh Nerlige Ramappa wrote:
>
>One more nit...
>
>> Context Timestamp (CTX_TIMESTAMP) in the lrc accumulates the run ticks
>> of the context, but only gets updated when the context switches out. In
>> order to check how long a context has been active before it switches
>> out, two things are required:
>>
>> (1) Determine if the context is running:
>>
>> To do so, we program the wa bb to set an initial value for CTX_TIMESTAMP
>> in the lrc. The value chosen is 1 since 0 is the initial value when the
>> lrc is initialized. During a query, we just check for this value to
>> determine if the context is active. If the context switched out, it
>> would overwrite this location with the actual CTX_TIMESTAMP MMIO value.
>> Note that wa bb will run after the context has been restored, so reusing
>> this lrc location will not clobber anything.
>>
>> (2) Calculate the time that the context has been active for:
>>
>> The CTX_TIMESTAMP ticks only when the context is active. If a context is
>> active, we just use the CTX_TIMESTAMP MMIO as the new value of
>> utilization. While doing so, we need to read the CTX_TIMESTAMP MMIO
>> for the specific engine instance. Since we do not know which instance
>> the context is running on until it is scheduled, we also read the
>> ENGINE_ID MMIO in the wa bb and store it in the PPHSWP.
>>
>> Using the above 2 instructions in a WA BB, capture active context
>> utilization.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  .../gpu/drm/xe/instructions/xe_mi_commands.h  |   4 +
>>  drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   4 +
>>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   1 +
>>  drivers/gpu/drm/xe/xe_lrc.c                   | 168 +++++++++++++++++-
>>  drivers/gpu/drm/xe/xe_lrc_types.h             |   6 +
>>  5 files changed, 181 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>> index eba582058d55..9153a7cd2ceb 100644
>> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>> @@ -62,6 +62,10 @@
>>  #define MI_LOAD_REGISTER_MEM		(__MI_INSTR(0x29) | XE_INSTR_NUM_DW(4))
>>  #define   MI_LRM_USE_GGTT		REG_BIT(22)
>>
>> +#define MI_STORE_REGISTER_MEM		(__MI_INSTR(0x24) | XE_INSTR_NUM_DW(4))
>> +#define   MI_SRM_USE_GGTT		REG_BIT(22)
>> +#define   MI_SRM_ADD_CS_OFFSET		REG_BIT(19)
>> +
>>  #define MI_LOAD_REGISTER_REG		(__MI_INSTR(0x2a) | XE_INSTR_NUM_DW(3))
>>  #define   MI_LRR_DST_CS_MMIO		REG_BIT(19)
>>  #define   MI_LRR_SRC_CS_MMIO		REG_BIT(18)
>> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> index da713634d6a0..cc698136a6f6 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> @@ -43,6 +43,10 @@
>>  #define XEHPC_BCS8_RING_BASE			0x3ee000
>>  #define GSCCS_RING_BASE				0x11a000
>>
>> +#define ENGINE_ID(base)				XE_REG((base) + 0x8c)
>> +#define   ENGINE_INSTANCE_ID			REG_GENMASK(9, 4)
>> +#define   ENGINE_CLASS_ID			REG_GENMASK(2, 0)
>> +
>>  #define RING_TAIL(base)				XE_REG((base) + 0x30)
>>  #define   TAIL_ADDR				REG_GENMASK(20, 3)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>> index 57944f90bbf6..210be0ef12f2 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>> @@ -11,6 +11,7 @@
>>  #define CTX_RING_TAIL			(0x06 + 1)
>>  #define CTX_RING_START			(0x08 + 1)
>>  #define CTX_RING_CTL			(0x0a + 1)
>> +#define CTX_BB_PER_CTX_PTR		(0x12 + 1)
>>  #define CTX_TIMESTAMP			(0x22 + 1)
>>  #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
>>  #define CTX_PDP0_UDW			(0x30 + 1)
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index 855c8acaf3f1..11eabe4216ef 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -24,6 +24,7 @@
>>  #include "xe_hw_fence.h"
>>  #include "xe_map.h"
>>  #include "xe_memirq.h"
>> +#include "xe_mmio.h"
>>  #include "xe_sriov.h"
>>  #include "xe_trace_lrc.h"
>>  #include "xe_vm.h"
>> @@ -654,6 +655,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
>>  #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
>>  #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
>>  #define LRC_PARALLEL_PPHWSP_OFFSET 2048
>> +#define LRC_ENGINE_ID_PPHWSP_OFFSET 2096
>>
>>  u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
>>  {
>> @@ -697,11 +699,21 @@ static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
>>  	return xe_lrc_pphwsp_offset(lrc) + LRC_PARALLEL_PPHWSP_OFFSET;
>>  }
>>
>> +static inline u32 __xe_lrc_engine_id_offset(struct xe_lrc *lrc)
>> +{
>> +	return xe_lrc_pphwsp_offset(lrc) + LRC_ENGINE_ID_PPHWSP_OFFSET;
>> +}
>> +
>>  static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
>>  {
>>  	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
>>  }
>>
>> +static u32 __xe_lrc_bb_per_ctx_ptr_offset(struct xe_lrc *lrc)
>> +{
>> +	return __xe_lrc_regs_offset(lrc) + CTX_BB_PER_CTX_PTR * sizeof(u32);
>> +}
>> +
>>  static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
>>  {
>>  	/* Indirect ring state page is at the very end of LRC */
>> @@ -731,6 +743,8 @@ DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
>>  DECL_MAP_ADDR_HELPERS(ctx_timestamp)
>>  DECL_MAP_ADDR_HELPERS(parallel)
>>  DECL_MAP_ADDR_HELPERS(indirect_ring)
>> +DECL_MAP_ADDR_HELPERS(bb_per_ctx_ptr)
>> +DECL_MAP_ADDR_HELPERS(engine_id)
>>
>>  #undef DECL_MAP_ADDR_HELPERS
>>
>> @@ -880,6 +894,58 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>>  	xe_bo_unpin(lrc->bo);
>>  	xe_bo_unlock(lrc->bo);
>>  	xe_bo_put(lrc->bo);
>> +	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
>> +}
>> +
>> +/*
>> + * xe_lrc_setup_utilization() - Setup wa bb to assist in calculating active
>> + * context run ticks.
>> + * @lrc: Pointer to the lrc.
>> + *
>> + * Context Timestamp (CTX_TIMESTAMP) in the lrc accumulates the run ticks of the
>> + * context, but only gets updated when the context switches out. In order to
>> + * check how long a context has been running before it switches out, two things
>> + * are required:
>> + *
>> + * (1) Determine if the context is running
>> + * To do so, we program the wa bb to set an initial value for CTX_TIMESTAMP in
>> + * the lrc. The value chosen is 1 since 0 is the initial value when the lrc is
>> + * initialized. During a query, we just check for this value to determine if the
>> + * context is active. If the context switched out, it would overwrite this
>> + * location with the actual CTX_TIMESTAMP MMIO value. Note that wa bb will run
>> + * after the context has been restored, so reusing this lrc location will not
>> + * clobber anything.
>> + *
>> + * (2) Calculate the time that the context has been running for
>> + * The CTX_TIMESTAMP ticks only when the context is active. If a context is
>> + * active, we just use the CTX_TIMESTAMP MMIO as the new value of utilization.
>> + * While doing so, we need to read the CTX_TIMESTAMP MMIO from the specific
>> + * engine instance. Since we do not know which instance the context is running
>> + * on until it is scheduled, we also read the ENGINE_ID MMIO in the wa bb and
>> + * store it in the PPHSWP.
>> + */
>> +
>> +static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
>> +{
>> +	u32 *cmd;
>> +
>> +	cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
>> +
>> +	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
>> +	*cmd++ = ENGINE_ID(0).addr;
>> +	*cmd++ = __xe_lrc_engine_id_ggtt_addr(lrc);
>> +	*cmd++ = 0;
>> +
>> +        *cmd++ = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
>> +        *cmd++ = __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
>> +        *cmd++ = 0;
>> +        *cmd++ = 1;
>> +
>> +	*cmd++ = MI_BATCH_BUFFER_END;
>> +
>> +	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
>> +			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);

The bb_per_ctx_ptr is used here. Not sure if there was a better way to 
write to the LRC field.


>> +
>>  }
>>
>>  #define PVC_CTX_ASID		(0x2e + 1)
>> @@ -900,6 +966,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>  	int err;
>>
>>  	kref_init(&lrc->refcount);
>> +	lrc->gt = gt;
>>  	lrc->flags = 0;
>>  	lrc_size = ring_size + xe_gt_lrc_size(gt, hwe->class);
>>  	if (xe_gt_has_indirect_ring_state(gt))
>> @@ -920,6 +987,14 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>  	if (IS_ERR(lrc->bo))
>>  		return PTR_ERR(lrc->bo);
>>
>> +	lrc->bb_per_ctx_bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
>> +						  ttm_bo_type_kernel,
>> +						  bo_flags);
>> +	if (IS_ERR(lrc->bb_per_ctx_bo)) {
>> +		err = PTR_ERR(lrc->bb_per_ctx_bo);
>> +		goto err_lrc_finish;
>> +	}
>> +
>>  	lrc->size = lrc_size;
>>  	lrc->tile = gt_to_tile(hwe->gt);
>>  	lrc->ring.size = ring_size;
>> @@ -1026,6 +1101,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>  	map = __xe_lrc_start_seqno_map(lrc);
>>  	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>>
>> +	xe_lrc_setup_utilization(lrc);
>> +
>>  	return 0;
>>
>>  err_lrc_finish:
>> @@ -1245,6 +1322,21 @@ struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc)
>>  	return __xe_lrc_parallel_map(lrc);
>>  }
>>
>> +/**
>> + * xe_lrc_engine_id() - Read engine id value
>> + * @lrc: Pointer to the lrc.
>> + *
>> + * Returns: context id value
>> + */
>> +static u32 xe_lrc_engine_id(struct xe_lrc *lrc)
>> +{
>> +	struct xe_device *xe = lrc_to_xe(lrc);
>> +	struct iosys_map map;
>> +
>> +	map = __xe_lrc_engine_id_map(lrc);
>> +	return xe_map_read32(xe, &map);
>> +}
>> +
>>  static int instr_dw(u32 cmd_header)
>>  {
>>  	/* GFXPIPE "SINGLE_DW" opcodes are a single dword */
>> @@ -1792,21 +1884,93 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
>>  	kfree(snapshot);
>>  }
>>
>> +static u32 get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id)
>> +{
>> +	static u32 base[XE_ENGINE_CLASS_MAX][XE_HW_ENGINE_MAX_INSTANCE] = {
>> +		{
>> +			RENDER_RING_BASE,
>> +		},
>> +		{
>> +			BSD_RING_BASE,
>> +			BSD2_RING_BASE,
>> +			BSD3_RING_BASE,
>> +			BSD4_RING_BASE,
>> +			XEHP_BSD5_RING_BASE,
>> +			XEHP_BSD6_RING_BASE,
>> +			XEHP_BSD7_RING_BASE,
>> +			XEHP_BSD8_RING_BASE,
>> +		},
>> +		{
>> +			VEBOX_RING_BASE,
>> +			VEBOX2_RING_BASE,
>> +			XEHP_VEBOX3_RING_BASE,
>> +			XEHP_VEBOX4_RING_BASE,
>> +		},
>> +		{
>> +			BLT_RING_BASE,
>> +			XEHPC_BCS1_RING_BASE,
>> +			XEHPC_BCS2_RING_BASE,
>> +			XEHPC_BCS3_RING_BASE,
>> +			XEHPC_BCS4_RING_BASE,
>> +			XEHPC_BCS5_RING_BASE,
>> +			XEHPC_BCS6_RING_BASE,
>> +			XEHPC_BCS7_RING_BASE,
>> +			XEHPC_BCS8_RING_BASE,
>> +		},
>> +		{ 0 },
>> +		{
>> +			COMPUTE0_RING_BASE,
>> +			COMPUTE1_RING_BASE,
>> +			COMPUTE2_RING_BASE,
>> +			COMPUTE3_RING_BASE,
>> +		},
>> +	};
>> +	u32 c = REG_FIELD_GET(ENGINE_CLASS_ID, engine_id);
>> +	u32 i = REG_FIELD_GET(ENGINE_INSTANCE_ID, engine_id);
>> +	u32 mmio_base = base[c][i];
>> +
>> +	if (xe_gt_WARN_ONCE(lrc->gt, !mmio_base,
>> +			    "Unexpected engine c:i %d:%d for context utilization\n",
>> +			    c, i))
>> +		return 0;
>> +
>> +	return xe_mmio_read32(&lrc->gt->mmio, RING_CTX_TIMESTAMP(mmio_base));
>> +}
>> +
>>  /**
>>   * xe_lrc_update_timestamp() - Update ctx timestamp
>>   * @lrc: Pointer to the lrc.
>>   * @old_ts: Old timestamp value
>>   *
>>   * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
>> - * update saved value.
>> + * update saved value. With support for active contexts, the calculation may be
>> + * slightly racy, so follow a read-again logic to ensure that the context is
>> + * still active before returning the right timestamp.
>>   *
>>   * Returns: New ctx timestamp value
>>   */
>>  u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
>>  {
>> +	u32 ctx_lrc, ctx_reg, engine_id;
>> +
>>  	*old_ts = lrc->ctx_timestamp;
>>
>> -	lrc->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
>> +	ctx_lrc = xe_lrc_ctx_timestamp(lrc);
>> +	if (ctx_lrc == 1) {
>> +		engine_id = xe_lrc_engine_id(lrc);
>> +		ctx_reg = get_ctx_timestamp(lrc, engine_id);
>> +		if (!ctx_reg)
>> +			lrc->ctx_timestamp = *old_ts;
>> +		else
>> +			lrc->ctx_timestamp = ctx_reg;
>> +
>> +		/* read lrc again to ensure context is still active */
>> +		ctx_lrc = xe_lrc_ctx_timestamp(lrc);
>> +	}
>> +
>> +	/* If context switched out, just use the lrc value */
>> +	if (ctx_lrc != 1)
>> +		lrc->ctx_timestamp = ctx_lrc;
>>
>>  	trace_xe_lrc_update_timestamp(lrc, *old_ts);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>> index 71ecb453f811..1c973d71ba98 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>> @@ -28,6 +28,9 @@ struct xe_lrc {
>>  	/** @tile: tile which this LRC belongs to */
>>  	struct xe_tile *tile;
>>
>> +	/** @gt: gt which this LRC belongs to */
>> +	struct xe_gt *gt;
>> +
>
>You don't need to store the tile then. The tile can be dervived via gt_to_tile().

ok, I will drop the tile.

Thanks,
Umesh
>
>Matt
>
>>  	/** @flags: LRC flags */
>>  #define XE_LRC_FLAG_INDIRECT_RING_STATE		0x1
>>  	u32 flags;
>> @@ -53,6 +56,9 @@ struct xe_lrc {
>>
>>  	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
>>  	u32 ctx_timestamp;
>> +
>> +	/** @bb_per_ctx_bo: buffer object for per context batch wa buffer */
>> +	struct xe_bo *bb_per_ctx_bo;
>>  };
>>
>>  struct xe_lrc_snapshot;
>> --
>> 2.43.0
>>
