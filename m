Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AB8C88E58
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 15:24:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7782310F67E;
	Fri, 11 Sep 2026 15:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KUm0m4Qw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6655E10E3D0
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 15:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789140271; x=1820676271;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=O46ccUHRTmH00/jRfFydol0gh9KV68DQXrkXE9cSpPM=;
 b=KUm0m4QwrE/aH3aMfocbwPZ9r8BbaEdcZZJWGsM9G+AzV5pFwKAr4tPI
 dgtdjnstc+PSiQcRyDxdU4WU2H/tX0cgzGzdc6UwkLqpBCXVvMuOT+yMi
 AC0ZjEN29UwGURBttKUE6akyPLP0NBTthC+4rXSgL91qYgXrnOx/sSZPw
 iubjocaK4VF5MV1ADiva/Se21ml5pgR4PPTVt4HOXEIZ0t6wORIAx+IQ1
 H2trHrYSfrUvnYWeiBi/X6Cn6AIBXczAgq5+1lVdJk4J+mxLT/hJYyszz
 4SH6z/hskcr65dDFKuKD8+APj9Cy/Uht+1gJtNFRYZy1H1KSJOJLDwxY3 Q==;
X-CSE-ConnectionGUID: dZAO2NncQj+mUuBcbhWrmA==
X-CSE-MsgGUID: lW+fSJzLRXq4mP7icwemGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="106973088"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="106973088"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 08:24:31 -0700
X-CSE-ConnectionGUID: 44pz2eEUSLi7SF491MuqDA==
X-CSE-MsgGUID: C5ka+JFGRImWC2ecOiK51A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="212466"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 08:24:30 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 08:24:30 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 08:24:30 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 08:24:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vnxQW28HZLsGXHCg4dmxAA5dVJHo4FvbAiaaKxn0c4vDl41z9YhZVz10UFiR45mGZCd5RhyQChrdoe5x9WnNsh+ks2MBDL5u4myASHZYMXHZvJFVqMNAnpRz+2DMo+gDTLHbgcfKAZFVMzh2ffPz+V6Usfm2ZAz9Vuglat65xWDl7zcIUjfwKLcTx7YWsxnz5vIkzNILC+GGYCCHHbO9WeJs936ED3dwzvAD1rytXvN+Lbf0/Fg1IKvZEetHmR0DvolNytA9sO33Nf1C6dqbZ5YWfYu+jOvdBjj1ytgHKbu5YkQ1y/eDRXjlb2Nq5PWX4TUAHfkgha1ptPpfjN9/4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hsrfg2+Us3mWVMNzhnNPMHYTX+6YB9tdDiSmXP8FYOE=;
 b=GOC8vukOIkjDZPcJqsARhEymZRXXbXy7OSU/WZAKGr3U84R9jkdXb4lC9CVRhM3jEHwfGBRry//KV2rENj16gLviwUyt4IGnYFKdgVavleCy+JWSPo3v1Ywm6HGSAasckLXpccJy3H2V06ARI4ZQyqUqhafRxZ51hieF2AIGwsoOT5xzoteGZWn6IRS/uqmu3WhNYsqydLq5TtlLPzjWPrUHpsbny+TiWdMMzoj6qmoD9eqdTkXdmZdkzNcyMoF6T3HEJhpNrn3JVbYR9gxgve0ROMU7v7kZfZtt+M2vGDRUYNex+Q6/iFTAk1dFmQSs9NsOwBw9ZKGIdtiEs2AkFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB9534.namprd11.prod.outlook.com (2603:10b6:510:39f::22)
 by CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 15:24:27 +0000
Received: from PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266]) by PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 15:24:27 +0000
Date: Fri, 11 Sep 2026 17:24:23 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 07/24] drm/xe: Update scheduler job layer to support
 PT jobs
Message-ID: <aqQdJ9X8FhhZq6lM@fdugast-desk>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-8-matthew.brost@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260904211613.3934307-8-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0338.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::8) To PH8PR11MB9534.namprd11.prod.outlook.com
 (2603:10b6:510:39f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB9534:EE_|CH3PR11MB8443:EE_
X-MS-Office365-Filtering-Correlation-Id: dc178dae-0e24-4cb1-618f-08df1018c478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|10067099003|56012099006|11063799006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: qwRVwR01BUh+DBufEP5NIH9Drp97B8qTeji1LlQOt5KJCtf7rr4ZHxGVeBEB5p7BBmohVHJZCy8tAA4H42TRzqtobXbox9v4EqFyOG5uYcfNwg3cmfKOtrW9iy/3cgeMmf/2ZDEY5GXRy7j1RAgO4wME1oXtWMV4pGAJkW8NnkhnBMsjxtXGU4AcAEqsxoFBOYkCa/RmooA1muDUkUjf2ZeUSg6zZoE36+3fTpRlLnd5tVXY7UGya5fzW1fE7t9CzJGmbDTImLY1E6WnQem28QzF5ewMD9Oy6jXdJhhYQfjSF6DtD0zqRUk2E4zxgOTTISr0LNZ6Jhazfv7j5y5Xo0ZBn09l7s7OcccEen6HMm6MEH+0XNBgx860zxmOl/Z/pye6mMtzHbaMswhi+exbLOu8iqy+RamV0Da3s1OFOjNaR1kg7cXU3C6qd2NMlzd+DKMvMCZNnW5nxxU9LZyLYmdytiAi1gOvG7MqCgfH0j6O/QHDvTtwjhY9EUBgVJ23S6x4pXKSckjYR4f6b6+3WXlsAsKnMj9vUoT67o+oPY1EUBBe3WriMuP5i4nIFTwVLIn/iXssdemVjnkpNuh7zF2FT5bqmwyoSesH+mdzyMQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB9534.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHpoUS9nSUt5Q3N3QkplVXJtcnhXeG1Qc1ZoMmh2R2d6cjNYeHc2U1JhbVVs?=
 =?utf-8?B?ajdIRGU5WDljYU9UTHBJYUs3WWxwdFozTnQ5TVdGaGFFTFl3K2VLV2JralJo?=
 =?utf-8?B?M3E5MXJEUmxXL05JMVluOGVKajJvV1F1SHFPOXpuZVFiVGJqdkIwWmFwUjg4?=
 =?utf-8?B?MHBDR0JyeFBVK29xRkovU2EreXB6RitNUFBNRjlJK1RmODNjOWFMWXk4SFR5?=
 =?utf-8?B?UFFPOWpCb01HekVqNVp6Y3VuekllUUh0aG14YWZra2ZUNWZMaXRxeDB1SnA1?=
 =?utf-8?B?NEVzOGpzR2lWR2lqa1lsdXVlR3d2cis4ZnVUMWVjWlN0UmxjN2pQZTlXWkdU?=
 =?utf-8?B?WHdkV2RtVytPcGVzSUQzU20vcW5nRlp0akFJZWpKcjNQc1VyR2NLWUoxQ2VK?=
 =?utf-8?B?b2dUTllOOXEyTElGMVEyTG4yMDFScVRmVUNQR0cwZTdQU2l2cExobjhZRmxD?=
 =?utf-8?B?QkFLQ2JSZmFoV1hqN0I4OUk4Wk04MjRyYklWdGEyWmZ3RS9scmVnTFBKWS9Q?=
 =?utf-8?B?dkZNWU9SYmtwZjBOYVo0N2xQdUh4WDBrSVNSYlllQy9hcDhPL3VJdHRDRWl6?=
 =?utf-8?B?K0Mwek9CZE1rYjdjTDBjc1pnbzJVbVR6bUtlbERrVTBDUWFmZEoyRnRnYitJ?=
 =?utf-8?B?RXVybmZJckNjN2ZmWExrRlY2RlVSZ2hlZyttYWNKcnV6blBSaFJTK1h3NDF4?=
 =?utf-8?B?YzFPRGJneVJVWlZvYUl1bDVqUDhobEVnR3FEWGRMRmwxMU1pSGhVYXBxeU43?=
 =?utf-8?B?cFcyMmxqOGd1VTlsWDQwUkpmU2IwbXpmUDNIRitZR1VIYlh0S3d3ZERzMEJi?=
 =?utf-8?B?L3EvczhFWnhGc1FEZEsxVW9OYmFYM3JBUE85VmhtZU9Td25RVG9GZTE5a2pP?=
 =?utf-8?B?UisrZFZmMU0ralNJb3ZWZCs3UkwwdmJiU3A1N0ltQUF6aC93ejJ1YTNLUy9O?=
 =?utf-8?B?QkxhZlNDdmZ6UTYwV1BpVXZMaERoZG14UUU4aXkzL2xneWE4c2pqVXZRN0E1?=
 =?utf-8?B?d1FneXpYWWFMWEZ1US9QcC8rSnd2aEg5QmpUMThNbW9vdXpYNkNhRjFlUTJQ?=
 =?utf-8?B?anJQOXNwOW0xbGZ5N0pKV3A5ck81aitjT1hMOGRjdUtHQTBybElETW8vSnRR?=
 =?utf-8?B?OGtRWU9xckpnUzJvMGRQaWl3dGZBQWxJY1U2V3p0N2RScE8wdjJxOVpVU2lB?=
 =?utf-8?B?MkNPWFFGZnczaTh2akNCREwzSlI1YmE2ZGZkS0U2YmEvaDk4K2x0RXRXRFlV?=
 =?utf-8?B?a01sMG4rd3p3aXFqcHRncnVSOGZyYWx6bC9lakZWRS84c1JOeXpiSUcvb3BH?=
 =?utf-8?B?ODlKd0VyM0FKbXJ3Q2IxMG8yS1pRamhxQllPempkeG9OODFRbUxqRFA1bUxk?=
 =?utf-8?B?bUZ4TUtZZXhGcmxObXlBelJiRWhISmpHV2NHQXg3b1pnWkdRZkFHbXUwRytQ?=
 =?utf-8?B?OFNZN09iVWF5cHRkakUrekhBcHlRRSthNG10U3l3N09FdjJQTEM0aXNUem9N?=
 =?utf-8?B?ViswR2s5Q0VxcGZBeTJvRHpObWlVb0JZdjhrNDY1K2dkcEF4bVdDc1hNSm1p?=
 =?utf-8?B?dXZzQVV4SStxRWJZb3dORTNjYWFLWEI4K0FPazE5amlQQ01sUTBlTks0T29K?=
 =?utf-8?B?RjcyZWNHYkhPWHlRSHhwUnZMUHZJQytIcDhJaXMzdGorVGp5ODFMN0J6WHZq?=
 =?utf-8?B?Zndnd0doLzRhdGczczRwbDNqZlc5QTdIZE9CUEs5SWk3SG45ZHJtRzB2eVJY?=
 =?utf-8?B?Q0hIN3lRV1E4RzV4WTIvbGtzVG5wYXpCbFJQQWg2em9CMmVDTXFTVUM4VWZO?=
 =?utf-8?B?aDMwVlgyeUxXWWowTzRKYmZuN3BTekV5OFh6MUxsem9GUnRiNUphUGJUcjF2?=
 =?utf-8?B?WFdyOUJXek9qc1dLWEZpeGFQUTErUmZ0aERsWkVQQXppZXhFS09rM0ZNaTRy?=
 =?utf-8?B?N2RSVklPdWtXS0ZHVWdYWkFNNFpQNExNVVJQemVtM0pVenRJOVNGU0J4d1FL?=
 =?utf-8?B?RVVCaUV4K0toTTM3RnlncTdDMWNDRTZWUWN0bW11VU9NOVBiNmlyWk4zeUl2?=
 =?utf-8?B?M2pXNUtubWJUL20xdmZZRm5xb3N4SXhnZ1F0eUdKR2hzQUFSVUdsN0swN3d1?=
 =?utf-8?B?VkY4dTBwTFl5MEJyRGFwZVRIUHpVZm43bkFBd3J5UGZhMzdUUEhzZk56TEkv?=
 =?utf-8?B?K1JJQmIyc0xKb0RRYXc3Q0xUcHM0Nm9NT0crd0NWeGMxZHltU1BwTUp1dUxa?=
 =?utf-8?B?TWpYZlRLK2J2UmRGMmNqTFUrdGRVem0wU2ZGVW9nWDdkdkFlV1R3ZURKVjNT?=
 =?utf-8?B?RkNZbWl1ZVNBNDFJQWdWZEJHaERvSmtNdU9od0dtZFlodUdDVUNLY2lvM3Zw?=
 =?utf-8?Q?ExV1jvz9V5EYix+M=3D?=
X-Exchange-RoutingPolicyChecked: 5xCxrw2GSyiIN0k7H8Tmc4ZDPSHFeU2lm3zGbm626Hp6FxTgWD6tgGkhgEHvIjbjVn/2Jm7bqmMIv9cYlYPICIXAPc90BfnJw7czxcHE02ht/nOIlDEOWm7h7hu0IQhBKlABD8V5RSBUi0UdWMaTVOdQYuStr/qvh8rxFhwPyxlylkDKx6sX32WXFuhaPxW0rE8LyrEBah8i+CzGxjo5DTzpMGNSl/lI6CQcSbQb93WSDO3fbWnBsaMyyC+yUejpSBcy/PMmGVbta/GRFQ+iQsiBAT3nG+afEfvapkBvdAsyI9KSdA+pD4ZysvoWP4sh3awHn5nvXKy1slb9DMmKMA==
X-MS-Exchange-CrossTenant-Network-Message-Id: dc178dae-0e24-4cb1-618f-08df1018c478
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB9534.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:24:27.2604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WSSsdd4yXos/baegf4e1ca9slM0RJHMtEkpW+1i1v3H7PFtu1ObCOvCTpok4SU1XOblvvRsq5xdejCrQ9pyoXuYqoMbq0vz1rI454OIy8a8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8443
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

On Fri, Sep 04, 2026 at 02:15:56PM -0700, Matthew Brost wrote:
> Update the scheduler job layer to support PT jobs. PT jobs are executed
> entirely on the CPU and do not require LRC fences or a batch address.
> Repurpose the LRC fence storage to hold PT‑job arguments and update the
> scheduler job layer to distinguish between PT jobs and jobs that require
> an LRC.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Link: https://patch.msgid.link/20260228013501.106680-8-matthew.brost@intel.com
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_sched_job.c       | 95 ++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_sched_job_types.h | 31 +++++++-
>  drivers/gpu/drm/xe/xe_trace.h           |  2 +-
>  3 files changed, 92 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index a4fa00632a30..841d67ebd5b0 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -26,19 +26,22 @@ static struct kmem_cache *xe_sched_job_parallel_slab;
>  
>  int __init xe_sched_job_module_init(void)
>  {
> +	struct xe_sched_job *job;
> +	size_t size;
> +
> +	size = struct_size(job, ptrs, 1);
>  	xe_sched_job_slab =
> -		kmem_cache_create("xe_sched_job",
> -				  sizeof(struct xe_sched_job) +
> -				  sizeof(struct xe_job_ptrs), 0,
> +		kmem_cache_create("xe_sched_job", size, 0,
>  				  SLAB_HWCACHE_ALIGN, NULL);
>  	if (!xe_sched_job_slab)
>  		return -ENOMEM;
>  
> +	size = max_t(size_t,
> +		     struct_size(job, ptrs,
> +				 XE_HW_ENGINE_MAX_INSTANCE),
> +		     struct_size(job, pt_update, 1));
>  	xe_sched_job_parallel_slab =
> -		kmem_cache_create("xe_sched_job_parallel",
> -				  sizeof(struct xe_sched_job) +
> -				  sizeof(struct xe_job_ptrs) *
> -				  XE_HW_ENGINE_MAX_INSTANCE, 0,
> +		kmem_cache_create("xe_sched_job_parallel", size, 0,
>  				  SLAB_HWCACHE_ALIGN, NULL);
>  	if (!xe_sched_job_parallel_slab) {
>  		kmem_cache_destroy(xe_sched_job_slab);
> @@ -84,6 +87,9 @@ static void xe_sched_job_free_fences(struct xe_sched_job *job)
>  {
>  	int i;
>  
> +	if (job->is_pt_job)
> +		return;
> +
>  	for (i = 0; i < job->q->width; ++i) {
>  		struct xe_job_ptrs *ptrs = &job->ptrs[i];
>  
> @@ -93,10 +99,23 @@ static void xe_sched_job_free_fences(struct xe_sched_job *job)
>  	}
>  }
>  
> +/**
> + * xe_sched_job_create() - Create a scheduler job
> + * @q: exec queue to create the scheduler job for
> + * @batch_addr: array of batch addresses for the job; must match the width of
> + * @q, or NULL to indicate a PT job that does not require a batch address
> + *
> + * Create a scheduler job for submission.
> + *
> + * Context: Reclaim
> + *
> + * Return: a &xe_sched_job object on success, or an ERR_PTR on failure.
> + */
>  struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  					 u64 *batch_addr)
>  {
>  	bool is_migration = xe_sched_job_is_migration(q);
> +	struct xe_device *xe = gt_to_xe(q->gt);
>  	struct xe_sched_job *job;
>  	int err;
>  	int i;
> @@ -105,6 +124,9 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  	/* only a kernel context can submit a vm-less job */
>  	XE_WARN_ON(!q->vm && !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
>  
> +	xe_assert(xe, batch_addr ||
> +		  q->flags & (EXEC_QUEUE_FLAG_VM | EXEC_QUEUE_FLAG_MIGRATE));
> +
>  	job = job_alloc(xe_exec_queue_is_parallel(q) || is_migration);
>  	if (!job)
>  		return ERR_PTR(-ENOMEM);
> @@ -119,34 +141,39 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  	if (err)
>  		goto err_free;
>  
> -	for (i = 0; i < q->width; ++i) {
> -		struct dma_fence *fence = xe_lrc_alloc_seqno_fence();
> -		struct dma_fence_chain *chain;
> -
> -		if (IS_ERR(fence)) {
> -			err = PTR_ERR(fence);
> -			goto err_sched_job;
> +	if (!batch_addr) {
> +		job->fence = dma_fence_get_stub();
> +		job->is_pt_job = true;
> +	} else {
> +		for (i = 0; i < q->width; ++i) {
> +			struct dma_fence *fence = xe_lrc_alloc_seqno_fence();
> +			struct dma_fence_chain *chain;
> +
> +			if (IS_ERR(fence)) {
> +				err = PTR_ERR(fence);
> +				goto err_sched_job;
> +			}
> +			job->ptrs[i].lrc_fence = fence;
> +
> +			if (i + 1 == q->width)
> +				continue;
> +
> +			chain = dma_fence_chain_alloc();
> +			if (!chain) {
> +				err = -ENOMEM;
> +				goto err_sched_job;
> +			}
> +			job->ptrs[i].chain_fence = chain;
>  		}
> -		job->ptrs[i].lrc_fence = fence;
>  
> -		if (i + 1 == q->width)
> -			continue;
> +		width = q->width;
> +		if (is_migration)
> +			width = 2;
>  
> -		chain = dma_fence_chain_alloc();
> -		if (!chain) {
> -			err = -ENOMEM;
> -			goto err_sched_job;
> -		}
> -		job->ptrs[i].chain_fence = chain;
> +		for (i = 0; i < width; ++i)
> +			job->ptrs[i].batch_addr = batch_addr[i];
>  	}
>  
> -	width = q->width;
> -	if (is_migration)
> -		width = 2;
> -
> -	for (i = 0; i < width; ++i)
> -		job->ptrs[i].batch_addr = batch_addr[i];
> -
>  	atomic_inc(&q->job_cnt);
>  	xe_pm_runtime_get_noresume(job_to_xe(job));
>  	trace_xe_sched_job_create(job);
> @@ -246,7 +273,7 @@ bool xe_sched_job_completed(struct xe_sched_job *job)
>  void xe_sched_job_arm(struct xe_sched_job *job)
>  {
>  	struct xe_exec_queue *q = job->q;
> -	struct dma_fence *fence, *prev;
> +	struct dma_fence *fence = job->fence, *prev;
>  	struct xe_vm *vm = q->vm;
>  	u64 seqno = 0;
>  	int i;
> @@ -266,6 +293,9 @@ void xe_sched_job_arm(struct xe_sched_job *job)
>  		job->ring_ops_flush_tlb = true;
>  	}
>  
> +	if (job->is_pt_job)
> +		goto arm;
> +

I think Sashiko's warning is valid, we should move this ^ one block
above to skip touching q->tlb_flush_seqno and ring_ops_flush_tlb for
PT jobs.

Francois

>  	/* Arm the pre-allocated fences */
>  	for (i = 0; i < q->width; prev = fence, ++i) {
>  		struct dma_fence_chain *chain;
> @@ -286,6 +316,7 @@ void xe_sched_job_arm(struct xe_sched_job *job)
>  		fence = &chain->base;
>  	}
>  
> +arm:
>  	job->fence = dma_fence_get(fence);	/* Pairs with put in scheduler */
>  	drm_sched_job_arm(&job->drm);
>  }
> @@ -329,7 +360,7 @@ xe_sched_job_snapshot_capture(struct xe_sched_job *job)
>  
>  	snapshot->batch_addr_len = q->width;
>  	for (i = 0; i < q->width; i++)
> -		snapshot->batch_addr[i] =
> +		snapshot->batch_addr[i] = job->is_pt_job ? 0 :
>  			xe_device_uncanonicalize_addr(xe, job->ptrs[i].batch_addr);
>  
>  	return snapshot;
> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> index 0490b1247a6e..5e1824c36c74 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> @@ -10,10 +10,29 @@
>  
>  #include <drm/gpu_scheduler.h>
>  
> -struct xe_exec_queue;
>  struct dma_fence;
>  struct dma_fence_chain;
>  
> +struct xe_exec_queue;
> +struct xe_migrate_pt_update_ops;
> +struct xe_pt_job_ops;
> +struct xe_tile;
> +struct xe_vm;
> +
> +/**
> + * struct xe_pt_update_args - PT update arguments
> + */
> +struct xe_pt_update_args {
> +	/** @vm: VM which is being bound */
> +	struct xe_vm *vm;
> +	/** @tile: Tile which page tables belong to */
> +	struct xe_tile *tile;
> +	/** @ops: Migrate PT update ops */
> +	const struct xe_migrate_pt_update_ops *ops;
> +	/** @pt_job_ops: PT job ops state */
> +	struct xe_pt_job_ops *pt_job_ops;
> +};
> +
>  /**
>   * struct xe_job_ptrs - Per hw engine instance data
>   */
> @@ -71,8 +90,14 @@ struct xe_sched_job {
>  	bool restore_replay;
>  	/** @last_replay: last job being replayed */
>  	bool last_replay;
> -	/** @ptrs: per instance pointers. */
> -	struct xe_job_ptrs ptrs[];
> +	/** @is_pt_job: is a PT job */
> +	bool is_pt_job;
> +	union {
> +		/** @ptrs: per instance pointers. */
> +		DECLARE_FLEX_ARRAY(struct xe_job_ptrs, ptrs);
> +		/** @pt_update: PT update arguments */
> +		DECLARE_FLEX_ARRAY(struct xe_pt_update_args, pt_update);
> +	};
>  };
>  
>  struct xe_sched_job_snapshot {
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 2fe8f89a1e34..d4e9d91f6f7f 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -261,7 +261,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
>  			   __entry->flags = job->q->flags;
>  			   __entry->error = job->fence ? job->fence->error : 0;
>  			   __entry->fence = job->fence;
> -			   __entry->batch_addr = (u64)job->ptrs[0].batch_addr;
> +			   __entry->batch_addr = job->is_pt_job ? 0 : (u64)job->ptrs[0].batch_addr;
>  			   ),
>  
>  		    TP_printk("dev=%s, fence=%p, seqno=%u, lrc_seqno=%u, gt=%u, guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x, error=%d",
> -- 
> 2.34.1
> 
