Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DC0D6C2AF
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 22:42:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EB110E055;
	Tue, 19 Nov 2024 22:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q109Bng4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF9010E055
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 22:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732056154; x=1763592154;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PjbNSRxppUhWZw/7xAnbLuOluLbpAZBTO6GrkRjliRs=;
 b=Q109Bng4vtXnW+uZgPKekUq0ZH+S74KuNLE9E8ZSVH3SnYDXabKTAtN5
 Uhz8QrdRWxWAURBhFGG2t2AURp5LcwQezD+MsZkg/wVGoNvcsp2jFGomM
 2snOX8N/+utrIrsk7vhmgimgXQi7kCWqSNivtLGlDaoDprmbm0xhhjkQf
 N9ThOboigBT/tFfLdHbmHnQBDGOcw+1XHGLV/94YRICZ5W9SHACdVSukD
 xf7YLiENX0LjEU61e/WSMEFQfDiWAWv4aJfeTSZjk11JyOjW/unkJkW3u
 gr0P2pQDczcXmGKRR+MhARfijCWEim8jSsRLv8xXeDg4sGQ+BC5WiuMJO w==;
X-CSE-ConnectionGUID: RUq1tDwYQlinZhoif5mYoQ==
X-CSE-MsgGUID: mWExMKQMQ7am5x8QebFuVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="35998957"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="35998957"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 14:42:34 -0800
X-CSE-ConnectionGUID: SbFBVArnT+SfNqQTugjeJA==
X-CSE-MsgGUID: akvhGKUpRMmf4zNhfET6wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="89293282"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 14:42:34 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 14:42:33 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 14:42:33 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 14:42:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NdANaFfNH7YQOn+XtsJ5zIRJUVoY3zYwsT0nMxDBEJffP2HwsCRxcgHI6TkAz0dpr93Hz5G5f9ZM1PbW1t83U1M4ix61JIoZ336nWkRnW8tLz2BXR2PKeLQDkhorkzyHEU6rvx1fbCemZX+6UsmU4MWn2+aivtgaTATN/Qwq6ZI5g/dyWQAxBVNahKbpbC3MSgrCaPV1ifMHtG/6JhRFl5+ErP2It1NgSh9jFZJWZ0v3ISgnA/VrTHBtRmJiZjR+UXiu0l/b1D4Hel9X5hIZUtcCrXChbNNe85Ze7USYGjDew9iwK9YeSoZ8uPBqMFlz4NfGO4NjmoBBXYAZF+qUGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iy5EDBFgShTREpbUFBsYRQh2ENcXkOLbnmtJAxN2Az0=;
 b=Pdyuygy5kXffGeAMjphyoczmvYdo3QnJuUaGmm23XIzRDA1Zr9MunH2XXtsdfidosuiaJX/CpxXxYbe5Ciqby8UQvnWFKvIaEwP/aea+0HcZK8soLQw+qxyezl5gUt5yLO9cz+uLgXAZDT85XheYP2GnpJUbIoop90WWcLjmEMV1mvk6hLgY4I7psM13N34gLardkIieWYOf9HIwAHMmKRIIoVAtZSygfobaJFHqtIWeRMKUgj1ZeOdWLe51gXYG5eg3DA6wicnLknQs2MbsTsY7UEFce4lJrcueqJN/mcRKz/JGh9yP0kiQqFgScwkhOKkqpi8+e+Znu5C5DnQ5DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CY8PR11MB6913.namprd11.prod.outlook.com (2603:10b6:930:5b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 22:42:30 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 22:42:29 +0000
Message-ID: <6735e0d4-3b44-41f4-adf2-9903f2c8ed07@intel.com>
Date: Tue, 19 Nov 2024 14:42:27 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH topic/xe-for-ci] drm/xe/ptl: Update PTL GuC revision
To: Matt Atwood <matthew.s.atwood@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20241119193156.12951-1-matthew.s.atwood@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241119193156.12951-1-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0231.namprd04.prod.outlook.com
 (2603:10b6:303:87::26) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CY8PR11MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: 33abfb9d-6930-4128-50f3-08dd08eb72ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGJudS95WWQ0bzdsekZ3a0ZtZXpsU0xKTUJFZ1dkaEtXbGVDYWlhb01YSzE5?=
 =?utf-8?B?d1hUbkFZQjlJTFFPRWZNUDdwaUFBcmlMem1kT2w5eTNTVXJkNG8rSnQ3U0VS?=
 =?utf-8?B?Mll1WXNQbGY3UUYwOSs2dVBGSlB5V3QzaE11UnBaUnVXaTNzcnR1SE53M1Av?=
 =?utf-8?B?aWR6dDRESlkxZnp3M2dWRElGWlRDY2JPamNLQjVLMHRaUzgvWEE1MVQrdllC?=
 =?utf-8?B?bkhmcEFYd1BOSU12VW16YnlaT25BKzdBVHhSRUsvbDgwcCtzSGlqZTNobXJv?=
 =?utf-8?B?RlNjMHgwd0s5eSt4MjNaMmJ1SGFPWEFZZmhHbGlVRURqUUZFM2ZzRW9pczNN?=
 =?utf-8?B?dGF0eitqNUl0bWJEL1d1c3pnQm13M0N4UC9FMUZ1SnhqUGhQMy9nWWZuSVpp?=
 =?utf-8?B?b3R4Z1pXNDhJcnVyYTdZNG93alZIVzB2TGNQU21QSk92ZHhweURNNTlRUVoy?=
 =?utf-8?B?N0FDQ0hFc2I0MjZ5RWhETGVXNlZXR2JVWTRDRU8ydGhwUjFzci9BWW5KWlIx?=
 =?utf-8?B?UkdXdlR1Vm1FVkhSQTgwcTUrMnpyclM1RFBGVXVab1ZNUkF2bm1iQS9Delhu?=
 =?utf-8?B?L1A4ckFQTTZMR3RUQ2dPdjJycXI4c1NmTUY5MzVYQy9TM2hxbzQweTNlZUZs?=
 =?utf-8?B?MHgwZ0dkZi9qRFMwWFplTW1kVWxZNUE2TW9FTWlhcXRNc3hSMm9hTjJONFVY?=
 =?utf-8?B?ekR6MXpvUVRyR3A2bHhRNXpxYldGaUpoNnlDSlpPSUZVNm95ZW5pZTl1Qk8w?=
 =?utf-8?B?eVFpWlhFdS9Ud2F2NnBEbUZxN0ExT2c3am5QVHZ1TEhCNjF0aVIxczUyTmJ4?=
 =?utf-8?B?WWp4T3pMeGloNEExZjdNN3hWSXhlWG5JOFpxQ2Z2ZlFlNjIyZVk3TEYxajhS?=
 =?utf-8?B?c1ptd05zakhLQTNkTFdNUEttWXprRFhBTjdxWmYrUTZ4N0pzbWpVT0Zpbmxn?=
 =?utf-8?B?SmJnc0JIenloT2ZkQkZCM09ZVzNlZGtNNGFKM0hFNmVwOEl6SzB4MGhwY3Zw?=
 =?utf-8?B?eDYzODFwMFNFN0p2RDBFNWZQNTd5dHlqL3B4ZTlhRUl2ZjdPczVLeTc5Wi9m?=
 =?utf-8?B?aG0ydW5lcGpaVzdiamdMc1ZmakNOK2gxZm0rajFhakhYY0xCZTB5QzRsU1li?=
 =?utf-8?B?VzhzVGtUdFFjKzFWaitJUVJtUjBvVVQ1Ry8zSHFrQXVUZ3h3QUl4dHIwMXhp?=
 =?utf-8?B?UjZDQ3M0YUUySGdZZzQyT1ZoMDUzSlQwNEpMSTQxOXd5VWdqUUptenFWMHA5?=
 =?utf-8?B?Tmhkb2w4UkFaOXQxa2pVWVZ0T3dQVk1LYlI1OWFrdmVZZmFTakJzUzU4bEh4?=
 =?utf-8?B?UnBXZE9abEdTWUNVQ0I1TjZ0STJSeXQxNThHNXNZd0RuTG02d0JsOHNGSWJt?=
 =?utf-8?B?akh2elczTlBTYzVvdlRKekNwc0ErcDVGcHhDNHQ0ZmVZWXpsakwyN21YZWY2?=
 =?utf-8?B?Uml2dnRMbDBFNFZrZnRGNXFwOW96dnNXNG90NXRqcys5Q3dLZ00zVGdGVWpT?=
 =?utf-8?B?QWk2VnRua25Zd3hkSXcwTnRUWjVQVGl1SXdvQXNJYTRNU3ozc2k1T3hyd3VG?=
 =?utf-8?B?LzJVYW9FMWhXUG5mWFY5bGZOTisxV2R6V0I5TXNnaGRBaXZ5ZlRtVEtpODJF?=
 =?utf-8?B?TUFZaVpaUGJEbXhnQnJGWm10dHc2bHRGMUtZNGhCSTNWVWVEc1E5Ym11cS91?=
 =?utf-8?B?c3owb3dsT21yNGl4L2NsYVQ4c0haVnJlMm1BSUFhRTVOSEdkTGw4NGhiTHZK?=
 =?utf-8?Q?tG9o+vZyDwmuDF72ZHiDGdH61f8FvkAysL9mcwN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUhXM2x6R3kvWEZEMG9Jak1wT2FlWWlFV05SZFI4UzNOcjRwaUFiUCs3RVBw?=
 =?utf-8?B?cUEvT3QxUmh0VGovUnI1Tk5qNnNuMEU1SVNra1dkSTdUYnkyUWx4cDcvbXU5?=
 =?utf-8?B?QzJPR0EwUUErekRZOXNlSDN4STBiT2ZnVDJ2Yy9pK1hnMGFWYkxmTWdCT29y?=
 =?utf-8?B?MkE4bWY1T1RzQXN1KzJqR0YybVRtRTNsb3pONmg4MURFVGRwOGRIZE1aTmxG?=
 =?utf-8?B?Rm5ZVnhNNmNnUmp0YUFrdzViUTZITktMSzdrdE9VYlVhb1NpNDhoYy9keEJW?=
 =?utf-8?B?SU1VQ29FOXdvemlIYWtSQWx0T2FWWlArWnI1MlZjd2FDRjdpRElzR0pjWXh6?=
 =?utf-8?B?U2l5M3hQN3E3eXNjeUkxUDN5L3oyVzNQMzA0N1dpVVJaZjkxekxqSi9RSGpF?=
 =?utf-8?B?Z3dhdFA3d1FPMGFya2JEcEFsK2NEdTd0eGRscUxZTHQvanhvS1BkbnZockxH?=
 =?utf-8?B?c3hxQ2dzQ004NVVIYWFUTGorOFdyMlNxQXlIU1owTFBzeUtVS2tRUmtDeU85?=
 =?utf-8?B?eUNNdkhUWGJDdWc1Tm9kU2hNSTdvNWM3eTJCQWFDZmRCTmZJVTZsMEVHNzFH?=
 =?utf-8?B?MWRXdEVRVWlDVENYV2JqdXlsbDR6MkpSenM3K1BoZlRYQmFvc2VnQStVUlRY?=
 =?utf-8?B?RXJia0VEMDlCTmoxWWs2WVVtN1BKMkp4UXA1N0c2a1JtUlg2MkFDYnlXZWNM?=
 =?utf-8?B?K1RMUWFGWC8wK3JHbzQ2ak1NNGFFTTBvMCtoMk9xYmJweG15d2FRMVJRbGFl?=
 =?utf-8?B?VzNJbnkwdG9QRmxreStraG9hUUNFcTBMVllXdE1pY1dOS2FEQWEwY2pPMlRu?=
 =?utf-8?B?KzhzWnBqNFJhUC9yd2ZuS3Zob1RJQjdVTjN2a2VKWkJxNWtKQXFEbU1IaUIx?=
 =?utf-8?B?U3IwRHM3LzZoQ0Nlb1E4V1F2VkVvZ0RPUG5mRkdFSXorNzg2U3FpalpLd3VR?=
 =?utf-8?B?WW1pVktEVU1sTTNNZlpraGlvc0N6REx4UzF4c3NsNm1QQVUzOUZmWm1CQjNp?=
 =?utf-8?B?NmV0eVpoL3NPV0o2VzA2WUFUR3V2c29BazFSa05JVVBGZGU4T1FHckFGeXd6?=
 =?utf-8?B?QUJvUFlaZTB0c3orenk0V0FrRWYyajBiYyt0YVc2US95M3EreENhcEM5Rnlp?=
 =?utf-8?B?NVNyL25Zb0FuRHB6S3RFc2FPdVdCSmcxZ3JKMDJuclNXWWdrRWNWWkdWQUdO?=
 =?utf-8?B?ZUhuT3JoaVRMamhEdWZjZlZkS050RUZ5WU9Ld3c2NW5kZ0R4RUNxZ1pNRUdk?=
 =?utf-8?B?dW5FSTlpU0ZNTGFEYm9hNGh6RUM1WlNmZ2RIWG1QWStEYzBNNEo2cStTRE00?=
 =?utf-8?B?U3pHNnNpRGs0cWpGK0U4d2tGK1Q2QUdvNDhBcnE1cVVaS052SXBqM0F3akFK?=
 =?utf-8?B?MDBaOFJEL3BTSkRreE5GcTVvSnlnTXpyM0NHSDhRZzVIUjdzRjlBdmFWV3Bt?=
 =?utf-8?B?eGE3WVBnL2hLVkNENXB0MDF3S1JZVms5Sy9zV0NCY040Z3VmZmNwdThwSDA3?=
 =?utf-8?B?VkFkMEV2Qmcrc1lSMEwzdm9xaXl5a3draVNBVklyWng3b0J3U2pjRUJ2RjYw?=
 =?utf-8?B?TnErQWtSRlhGU0lLVFNMbWVQNHU1K1pyMlFGK3ZrUTk1aHNwcFZYOEtPZTA5?=
 =?utf-8?B?V21PN2pNQXhLYXg5QklVcitKTmdTRDNyaHZRb0ZBNEwydUhDbkhWejd0eWtC?=
 =?utf-8?B?RjhObUNTYWd1TC9jUmhabFhZT2c1RmRaRWhybXdXZnhvWUdYSmJTZFFNOWVj?=
 =?utf-8?B?RytreFYzRlZaRFdiT1pOczZ5TldrS01LRkUyOVVTM2VQYmJjQ3huTjg2a3Vr?=
 =?utf-8?B?akFDWU9NbU5yVVJCN3NWcXhEbEdKdDlma0xwblFWdVdrbGdJeHNYdzNqNXhi?=
 =?utf-8?B?TVJKM2hzZ1JacEoxVDA0d3hSQUdvM0g0T3prd1VKc2pQTnF3cVVadnFTWS8v?=
 =?utf-8?B?QUF4QmtsS2ZWaHpvOEpUZTREc1Q5VGRxTjRMZ0RKbGRENEM1c2IwYi9VMWZq?=
 =?utf-8?B?dmRCa1lTMll6cjFQWlpZbXRENS9VL0NJWVl1Yk8ycDRUSUJtVWJrZnE1OGd5?=
 =?utf-8?B?cEJRbTEzTzZlNWRnTExTU3VBSnovMXBvamFhcjNDRXlFRmRJRkxzUTRoOEpY?=
 =?utf-8?B?OGlzK01ycThXdVJpcFpxbDJTckF5TlQzOHE4cUJ5YVNuMTlNMC8rQzh0QVgz?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33abfb9d-6930-4128-50f3-08dd08eb72ff
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 22:42:29.8452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7JipqNQ5Bob3qRsOUM+4lpOQkRUKuDPAbcr9kK59lYN2LQCbboeKvE0w/Sdlobl70AB0rGcNFE/f+euWcp2UhCQ5IpTic8PtEDPVzf4sh5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6913
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

On 11/19/2024 11:31, Matt Atwood wrote:
> Update PTL guc version to 7.36.0.
This is still wrong. As per comment on previous post, with that fixed 
you have my r-b.

John.
>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index b0deb082ab2b..9c14b0adad0c 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -107,7 +107,7 @@ struct fw_blobs_by_type {
>   };
>   
>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
> -	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 33, 2))	\
> +	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 36, 0))	\
>   	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
>   	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
>   	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\

