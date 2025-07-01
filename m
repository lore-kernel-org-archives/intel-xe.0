Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CF6C83038
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 21:10:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAB610E600;
	Tue,  1 Jul 2025 21:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BPRQeTO/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DB210E156
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 21:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751404207; x=1782940207;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P0oM7+aGo06OGYAJ08tNmAyBRri0lPCugFEUuleeGE4=;
 b=BPRQeTO/ONcXIUJGL1pIpKHxZs0WBDo69KADGlb4ZX9g+f1zEdqi971R
 LLgdD6jZQgUABdsRZpbl6ll4yxVxPaoPYBQKwDHhZ5+4NjaWYkV7N5Jl3
 kugUA4au8yOJQUFjPeTGMzmoPD3SQ9z4aL9ZuLMOSWef976ttSGZ/0woN
 WbAxVj3cb+zYK3Xb+x+Bb0B6Pq6kKEAsG6NyKxrr0k4nHSCk2twBFq8So
 nV87KrI6bw6JqYWfoz+h8gcFeoBxeBxGL0xFhbMnuWSzpndHn59x8B8hC
 YUHjb1bRB+JvP7+pYelAlC53/KRfwjljPTK2txNIlFv38k8UfCKfkdhXz A==;
X-CSE-ConnectionGUID: qn5iw+JlTM6k16tgf4Zz4g==
X-CSE-MsgGUID: qrexHs8RQgG9/G5c1oUuXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="52800372"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="52800372"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 14:10:02 -0700
X-CSE-ConnectionGUID: Sd1uB2+JTpenbA7gTnjFzw==
X-CSE-MsgGUID: uY0MNLHWT/+qJfECB7hX3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153505848"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 14:09:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 14:09:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 14:09:50 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.89) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 14:09:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bs/Awo+XL2o0WD6xE4bQQ2PCihh7fhBJdPRVhoiPgJDad2wtN2f+MO/UT3jAuxWcjAsbOjIwrOkrQpIp1MHpbRTzzDha5GWzhCka9D3KK6ByfpKcCFlUbTDhv9aMUIHpUFaI6lIg6umjRkZN8LS5v2zDzt9BCOHjcUpjoxoUZEKUB0sYMjgeKxdlvL/hoHV8HEyzkSr99vuMuc+bTUotTe3ard2z7iHFXNVCr/iYFIE1pXMuF0lQNAsZAsEOc0Jmhdiwn45/TJzOZRgBFHi2uCNq9iZP2GwLThjSDcPoWjCiu5xCLInWkt1EV7yJ7hVzHa4+e0IrE5RxoYe6p05lkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9CzyQcGIB7FSZUGTgpV8f1+atwknQaK6qKXW1QGaqE=;
 b=pT1u6BgafYjQwg/XfuQiRPiV8UhMp2UAz/jXv9IVt8A8hAa17L19s971dqPkUszpY8zsmn2rFRadsSViLB4EKk6LfUGsYqRsJGjWSbFsTtCLu40FM6QYkdnP6Ve7KG4VrRs7CY2ILaltKcWs/a7PNLphaXK2KW9zfO5dwlb2L8bOA3zlECb/X1McaMwhqXe5WwvbnPffmsGRkKBBATXL8GZOI5nlrvrHdt/swN5DdC6vAS9Ck5ZRqi3dErUUeJzK1oyRyhXcipZSEVr4+uJ1nFsgGB4XrkOds8PBPS1TNE+mfVGUIBq9cv3o/g3uxaVzskJSs9p9QH9oVOQEZvwxRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7367.namprd11.prod.outlook.com (2603:10b6:208:421::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Tue, 1 Jul
 2025 21:09:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Tue, 1 Jul 2025
 21:09:48 +0000
Date: Tue, 1 Jul 2025 16:09:44 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <sk.anirban@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH] drm/xe/xe_pmu: Validate gt in event supported
Message-ID: <dn56hltsdh4ftxxrpcvyyow5rmv7j5jipq2mxymmaj4xucgknj@zhnnyt5r545m>
References: <20250630093741.2435281-1-riana.tauro@intel.com>
 <q7bmmb7s3v2wxjeamrcuhcpwm23tlju2l3uqobg3mo4y47dj5r@ndr2kbjfhhkc>
 <20250701203128.GL4868@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250701203128.GL4868@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0117.namprd03.prod.outlook.com
 (2603:10b6:a03:333::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7367:EE_
X-MS-Office365-Filtering-Correlation-Id: a4772141-14ff-4939-7df8-08ddb8e39c9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c6rbejEDn1vQ/Z9Jqu1Nx4EeqAK3ryJEUXRt6ALphVlGe4O9xGe48Zcn+0z8?=
 =?us-ascii?Q?hp94FoG6C0Cix0VP+zgkc8AJyNMvaUWhGbdxFLntDBJTkJqekkKSEfCfdC9R?=
 =?us-ascii?Q?U+w6ylCdaBILbTmRfM2tLkSNIVEYPnTrYd/MYBfQB6szJpHj+e5vIArxQPPH?=
 =?us-ascii?Q?kncU/dseHIfEgmVxIvyRD8KPGUocFo98aGFBEI8Bn1khiAU55WwjIJ3/UjwQ?=
 =?us-ascii?Q?pgn9RhXBVYEmP4P9YANcS+XAwQoRDxy0MR4lOr16ZMgc+7O/dBKV4EHOLT8b?=
 =?us-ascii?Q?AZBT0KoMMS/6j9781mgkK/LjWecb9c1UR/rBNIyGXLUqVER36XOBjbWxZwTR?=
 =?us-ascii?Q?N4sfO5931LONzApT945c+UqkoRYRmqWOehnrbt16aOEMhIo1Lonilxpe10FC?=
 =?us-ascii?Q?1SIu9uOmrAXLDfyqn3+gw6jyNyaVTmvjYDJfJKimWPcRVoiDiOdIfFWTKTyQ?=
 =?us-ascii?Q?rlJzROGwm8M+SRkkiLoNfLsPXtFGtW3RP409buUkpmH+0PeoWiUde13+0MRf?=
 =?us-ascii?Q?D3iS956snLcQxD2L2umPzpa3DcvQkEcUfkf7n2JFuR0pXj8R6nw6xPAdBWu/?=
 =?us-ascii?Q?++rmLi1Xe5REVl9AeTbbXecrqwKumAu6E5t6u+y6c/Mn+gK+895g2OYnsdzb?=
 =?us-ascii?Q?svv1hUkpd9XdGmJJ4TDwMed/rDS15nwD9KZu2K1ItnHlIk/Gr5ZY19oFm7v7?=
 =?us-ascii?Q?aUX7RFFPH0yoKU0FUtDuSjSZidwRC3ZNV0GsmjPj/Tc52AnpsP20wkvIlLHm?=
 =?us-ascii?Q?2AGAoMHm+lY2iEZNddyDgtniXwSgVREA7sh+jHNqVEG1kbNp7xkJcd+aFs3U?=
 =?us-ascii?Q?1ijpt4jxAcHGHchqDwSAuZpMS09CXcgPEEgRyuoXl3yza7VATIuZC5RJU6E6?=
 =?us-ascii?Q?3bZeL3eHOiSJhH6RcRDLhgxxX/ZX3RCZTI/clzLXl9G9QZoS0Yu/dF7kycAV?=
 =?us-ascii?Q?MLCYKTXk5sqX+QdfYyfcdOJ6tf4/a2SZDWjQBBiMSADVjkbRn8+xc2KxjVYl?=
 =?us-ascii?Q?+MeqUx6T5JPb9b3DYJFQ86rtQlVbXB84I5Ahg9RHYMotMper8Nlusb3PITf9?=
 =?us-ascii?Q?frJ2zvwCB/kvp0YQEkc9+cqMfS3vhB6UFx5Bmkp8i9yP1vQKwVs3zpEcEAIY?=
 =?us-ascii?Q?ZeTE81NS2KsVNCs9ZtVqh+xysU4JRCxb+AHJpeUlA9M9bXRx0ajU9ObHihiQ?=
 =?us-ascii?Q?yqh969s+WFS6fRnAqSmM0TUc4rB1QPOoUYHQI2UkEjeynu1i+zlukKgM0V5S?=
 =?us-ascii?Q?BknSgs0ed5cB6csY6VDPD+84h1IqNbbI1Vub0qMEaK5KbYzvK+NWA4Kvn6gc?=
 =?us-ascii?Q?xesAeN0F3cZRY9EaqoxWIv1EktFP5NTvLvp9LxrbnR46ispg5iFar+YK8B/M?=
 =?us-ascii?Q?h1TNMRdvb5dsCmUNfyCVxc/Od26Kdd+ocB10CQBE+b4IuA9pIYaf2TG27oz2?=
 =?us-ascii?Q?NE5QmdVjD+c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wP7Ryba9WF2fP36rRvncnhnhCTaDgfQWmiI+INzWyZPmQvxeZegXmjJp28hC?=
 =?us-ascii?Q?CSaLq8HaNM6+GmkGOgZ9gteMfWQI0cApmiaNCMb9/axSZLYIxQQOKxM+N/aS?=
 =?us-ascii?Q?bzMSjHQ8Ydf7Y16cfwwywn6ZgxkBtpKZMuSTgFCzdNpTuw8M3lFCp6+alzEZ?=
 =?us-ascii?Q?RJWdQ/UxMPuzkRPQP3q9pzjLCp9Rz6IxWVb15NtlKdZYL4TOkk8IqxhMll4F?=
 =?us-ascii?Q?7+RybfLp9MWDWSO4pRgpowgg9mKGLCdOnHkizOLm2q223Nsn0HZUUmpQVZ4n?=
 =?us-ascii?Q?2rMSVyDu5eeHZ6xMMezC9ioxVmNlM39lbuuAT6rTQ9RzFu4VGMbJIjb5GUXJ?=
 =?us-ascii?Q?AQgPU9QfvCIZLZ/iPt8GZWmPn/LAuabR3ivk4fT4Za1RDU846U1BisBgjp8k?=
 =?us-ascii?Q?wbbJzW6A+PJ+utHucum+Gwt2V5X4AlpCV5GRF5VU3fP5zuBFSEF/91W4wZ3/?=
 =?us-ascii?Q?TD93BVoelCizOAHtBHPgV7tvasTS/BNWu6gdCxMkybZnns+uuppWdulZ5H25?=
 =?us-ascii?Q?wbQm4mTGVBrWtcOFVDvXWITRHNw187/Qd7BdqivR8mK7aAwooGM0cl0GABTt?=
 =?us-ascii?Q?BaEEfX8urqGJckK4wBZzldQ/04RJb9WAp9tbD1Ud/8j6m1NEzkYCkC+gKODy?=
 =?us-ascii?Q?hOVR4r7AwAbdHiIMm263oev1gpbtbN/kYQdPTMCeS/m0s7KQBomN9jejQyrv?=
 =?us-ascii?Q?r99NQWqMaUcDKJV0S2C9SN0rgcH0w1JfSZISrYwyWAMmgBPA4UTRhbf6KFdT?=
 =?us-ascii?Q?XXEnzEWTZv7HnFV8WJ0qxCZsZU78HWdSyIDZad6lrTycDVw/bhNfU3R46fJR?=
 =?us-ascii?Q?XhQ64o5sARbjZ4Rzs3y7+m8fdfSwpNJAAk8d0ECwWSyxGT3P9H0OU2CTg9y1?=
 =?us-ascii?Q?hdB19Z8oVwuqkS2afcbAqzUVJS2NCm0NaaNqXx35+MRuflgLOZ+lJY97FtK3?=
 =?us-ascii?Q?xl38mzG9UyvWRJmTvhTBsEasRX9Hc+ROa8nQEolWdoXRIbswbb+WuMF5ajTI?=
 =?us-ascii?Q?y0umZKGptt3ZVycUTrEjg4S1aGV4Z1CpDc6+3xVMXYLuQEdflYFRLM5LA2Yz?=
 =?us-ascii?Q?kTYGy69NsB7xTAY18qeSNWTARovOiFM1Ih2PIyg56Gr9fGlraGC52As2mpen?=
 =?us-ascii?Q?VBMOqRY7knMLotAqea4l5Ynuz9K1mO9Cx4tK+kTRgShfQh6s4R1f7KaOMjIb?=
 =?us-ascii?Q?VS6FM3Ndo+v3V+LpL3RZHq5XEw9p0PBEADZBCcTMemt6wky9e7Tj3Ivv+4pn?=
 =?us-ascii?Q?07rFp8ArOfAWnx2zBy5WAWZ7igz6+JCuwkTcxq3okQ9foLsSLM/fbvnKRCy6?=
 =?us-ascii?Q?IN6JN5P6UdYoZeKEcSOykUvS5HXqqxLW+BicEWtLi57/cRx5ZyK6J63EPQuK?=
 =?us-ascii?Q?ehxd+nuzpJLyuKvPUUq3wjht1nEpTcHPXSrCtPHhBUQksxQnb3w8SHTbQLjY?=
 =?us-ascii?Q?E/CxHEZPxJ4YLMk53n8Qe5CuNOoM4sSvPuBI+0/VAuZ/wZWWEAzsgPs3PFSL?=
 =?us-ascii?Q?zgZEqEyEjl6fhi2lNAawP8dFw9HbU0ToX//sAmPtIU12/TRUW2Yl5dAa8ZfV?=
 =?us-ascii?Q?uDVuXROb/V2r9iJsG9HTzxUO5aK1wdD73nLXC3bTGJIF9JhLEnGrjxawO6QU?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4772141-14ff-4939-7df8-08ddb8e39c9d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 21:09:48.2737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: riOd2/0KpHejbFLJzcjHEphGFA37wjvb2qf0os2/jupaA0qeGcVgvHNk292jw0HtRIBsXQ3WmicHGr6U5u05+TXfkpEcRsRNx/8YBg75GTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7367
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

On Tue, Jul 01, 2025 at 01:31:28PM -0700, Matt Roper wrote:
>On Mon, Jun 30, 2025 at 05:28:53PM -0500, Lucas De Marchi wrote:
>> On Mon, Jun 30, 2025 at 03:07:41PM +0530, Riana Tauro wrote:
>> > Validate gt instead of checking gt_id is lesser
>> > than max gts per tile
>>
>> I prefer the series from Matt Roper that is refactoring this part well.
>
>I think we want this change regardless.  My series is about refactoring
>to future-proof the behavior in case we wind up with multi-tile+multi-GT
>platforms in the future.  However Riana's patch here is fixing a real
>bug in the code that exists for existing platforms like PVC (i.e., the
>code currently lets "GT1" through as valid even on single-tile variants
>of PVC).

I misread this patch and thought it was an impossible condition that was
already protected during event init and it was added more as an "assert
we always have this". Now I see this is the call that actually protects
the event creation. So, yes, this looks the correct thing to do.

Riana, could you expand the commit message to emphasize this is a real
issue for platforms like PVC?

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
