Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BACCCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 19:01:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3238E10EA7A;
	Thu, 16 Oct 2025 19:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VpxjdAhr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F84A10EA77
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 19:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760641296; x=1792177296;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=35Ql8fC8sAa4TO6NoMD1LFxKmjFThSMceTmE25nKLWM=;
 b=VpxjdAhrf8yW47wQ32S6vAhh4GRnS8RYwVwnDdRfzG1XYLVwnhou9e/v
 KOROC47kVt3t8u7/5YmDNZfP7sUGYcuZXJ9w9I73to4kCjFHYdTdj7Efu
 ETdky2sk1oy9cDLJEhmTyyerVoDCwrorftOO+nlrNBoqJUByG9BKRjTY/
 PQUG8+7UcIDr1RplgtHhM9Sf6lpyEHt32OAOhJWC1NCWu8Z/he7vR5/Sf
 Y8zyS7L5a9lw8LE2uVwYkPNXP2WNzW/u7nTbZFhif0awFQt70+RBo+6/+
 eAFpnZsxCKSH1Dze0kgu3+pgeBAvvQxnHtR9X7OOOL7rF1d/EH6iZFIXx w==;
X-CSE-ConnectionGUID: EeLDbH+7Trapau5PpAuesg==
X-CSE-MsgGUID: l1qzhvaqTtWxk9PLjI4/qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="74191120"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="74191120"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 12:01:35 -0700
X-CSE-ConnectionGUID: wGsN7BxXQTKzL+W4Np4tMg==
X-CSE-MsgGUID: w6KHF39TTN22IslSJM9QdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182942783"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 12:01:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 12:01:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 12:01:34 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 12:01:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dl+Peeg1OXKxW38f4b4hCRscyOFcjPeXd5Lnw1scdxDQV47S8ttwfJRmJZxSkLPxy7l4sskEboom+z2f5Is6PFmI9LB2zla+9uTqFc7Tcobf56Mx4cf7NLH2dcGnZdNQ7e8eVy+IhuC2D4VKd8ATqbPG0DKAzTX9Lkm5ynlfPebwRiYH/1rOx8vpuXishSpRAeJTWlCguHbqNsJSWgciiyALMklr00+5CnWhNyYGmgN7IpF7FL+q8A2RR/6dhyJYP8NgAGAOJgagkq1mVVoMyFiNYB8gEcpo0Tb2rBKDHiN9K8LGmtDeno2VRrOoPRTdYSP/cVhAsNVMatY0qh2w/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2zYRBtVP872IorxWQVjWGDrm5/BtGTwHjAiHq7ngB8=;
 b=jSnkHO1/9CbLd8fefSF+HxGTEnhm2XuIs0RRzC4WoNhfhrBJ+W+2vBfwsMttis+i6WaxgFUCHOt5JHYW5R4zmdt91iYMmEnxUaNeXLL6MGaK70JQ1JV4SMjS26xbqUAXfE0QLKvikMKxVzA5qvo+hIZD5+xS9fz7YyKkRL6NDixP92gMpZvF7mpJMWSC5hT86W8tOhfXTZ5BmQ23Iwm0FYizfPu0daR3WQUJiZ6JddLN6Cjk7Ow5PE2iNSX2hyW8kMIdqI2Kw2sJKj+t9ZLGj5463Ege+4uDc85u8A02CyBKpq5O/D8A1ZYMAVkzaZzcur4UTcJiN3xzzVUEPVB21w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6654.namprd11.prod.outlook.com (2603:10b6:806:262::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 19:01:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 19:01:30 +0000
Date: Thu, 16 Oct 2025 12:01:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <daniele.ceraolospurio@intel.com>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v5 1/2] drm/xe/guc: Make xe_guc_submit_pause() available
 for non-VF cases
Message-ID: <aPFBCIteNnib8TDr@lstrano-desk.jf.intel.com>
References: <20251014073036.3282329-1-raag.jadav@intel.com>
 <20251014073036.3282329-2-raag.jadav@intel.com>
 <aO6Rzzh7YNzpVy/0@lstrano-desk.jf.intel.com>
 <aO9Hbfo06ZrVShss@black.igk.intel.com>
 <aPDjNWORoOC7SccI@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aPDjNWORoOC7SccI@black.igk.intel.com>
X-ClientProxiedBy: MW4P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6654:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c5c3c76-7ee0-4ada-16aa-08de0ce66ad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LiWYiMFQhp2CnsyA7MVEfi8KyV7VJELGfa9hjZM4f86WNTVKnwbX+ShwCBLu?=
 =?us-ascii?Q?J9CZwREL3/gQA8VwBkwBdZ35xPEUCoIqEKFv12nezsfG974doNbhDpWc45UY?=
 =?us-ascii?Q?mih/J0Updb/qiBu/5zfAOF8a8NempqBalWCh6pm2sqBLmehHef9XXkX9zxjK?=
 =?us-ascii?Q?GNf7LoS9V2uzPBfvgsTh1kB6k1xs9vavIXkfyjoiiLQfNLb/SokAiT5aftDT?=
 =?us-ascii?Q?eZd1jyBMfF1ZP8cdlVv2vAq+Lyyh6rAXu13wukWWY3M+BnFFvR7JnQ5RN1aZ?=
 =?us-ascii?Q?R6cdpuRmN9f/aNQww404hJBUDmECJ2X8RLc9wZvDFiFMXHzhm7mGzdNrwJ06?=
 =?us-ascii?Q?qaKSHTDYjFvwcl8c5LcjV04hd/ycXgwb3pUuURIgtPs4FN4ct1l4HzeFfnlV?=
 =?us-ascii?Q?cyMYTFaRh5YH7aWT6UiB700pgLZXaO3ZzTXy0qTZk+qCf9S2OO1NliR7jIIX?=
 =?us-ascii?Q?95xUkd4wjaRbhC9OiJh5VVxwkC/2tgd+7dlLPuLQ59dCjX5a3qZazIKPgc2H?=
 =?us-ascii?Q?i1iMixN4FTiaPNDupSZo/T6Bc4iR33sqHwaJGYx53LpQ75d5P9ucqYbrm90G?=
 =?us-ascii?Q?UD1Uq37XI6ktpegus6+aWWouYvEtyIWOB+BHToiJYFiG3IUFPAczFq2DijjP?=
 =?us-ascii?Q?6p2W3kKmLhDsDRIMdzPbofDFE4KPlqWOaoHR+eBxIO1Ce+XI7jdlRd+eFkJV?=
 =?us-ascii?Q?Jgka0Jdtm1a5WZg5NmjZtEQHcvaRTd0MoTxb65R638GFg+MfMkHpIIR5Q8eb?=
 =?us-ascii?Q?km5+vJR5ieUxTtTfOCvKtg/JdyNttNat6PatmkjVVnV4lMIKV/oTD2sPi8HK?=
 =?us-ascii?Q?0l1sIEd3TuxOyEB2lY+jGnJCOUOM3bVbgSkq1/kdLRQycdy/X6jk86Hlq4e1?=
 =?us-ascii?Q?cw2nolQ3WtkROubJ9otJVJxMUgTCVqD2w13VTE0sC8rTXD73DxjFYnUbwe8/?=
 =?us-ascii?Q?nyKwTmLibYK8Svm7v4thbxwwwasz4A4pJV48vmJ6bPJkBWABaovBdVDDu6x7?=
 =?us-ascii?Q?AGxaCKfJjWDYusaU18g5+sgiRiUVGoCZJfTxhRs/74XkUp3/DKdwrIkICfXU?=
 =?us-ascii?Q?Ai1kNdYZa9wvRakpnP5UaO20f88Ie02xj3ee67jROxYXrZRkMRCjzgKPLHAQ?=
 =?us-ascii?Q?x8MWCnS3WJ4yapnHnJodS28JZFhlkYSvwhWT3l66kvK+HLOamdhDEHIFFz+x?=
 =?us-ascii?Q?3hKxC+/gkRCWhJ5DPVMUR1jtgwu/ls72ft9uGJJmBkaRydE2CC5ZtV9gaglt?=
 =?us-ascii?Q?tOH0bsWneZDeK3wUiENlaWm7S8MERltbwO1/3nsT7DtrgfOx5bwAC6CknIpQ?=
 =?us-ascii?Q?O0nIM4g9RwbKiDzyeYz0wGiVA6XPaNCi1y9JGHmOB9rE/Tj/F2OajhS7G1Hu?=
 =?us-ascii?Q?upYcREYtVvmAa/55+85I/F6QYztQfOzSc4OkRIqv6Q9WDfgWV7CBj+ADf8vG?=
 =?us-ascii?Q?M6kadKDMkvBFWVupV6oyf3TkRBHpoVac?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GMqL7USaHiuw8vRj/KffkGyGk5mK6bdVW6res8Q+We9Ek3pFNAvIeN5sHlTY?=
 =?us-ascii?Q?kLYQgWd3kR3bHfIgAZ4RZA3pF+g5hb7s8w2yrSiRTd2T+f5WlaRV5Ko4XIo5?=
 =?us-ascii?Q?Xi8PAseJFtJkaImWeTsB+h8IdCxrOZKUlgYYeZGp96zJr0U61srB2q16zfKm?=
 =?us-ascii?Q?CFiH5uag9hIjRupDqTYr3vjTSEglVdW9Hy+djoGIvo6414bGSwZWsZlY82/A?=
 =?us-ascii?Q?PAGT1d9B4i9TK9WJC4UVLoE14JiZcFAUcbabfzhpAQB5sq0fuuXg+Gv+5sL1?=
 =?us-ascii?Q?ehhmOFfAIyyvh/bPVUHFM1gELlCOlYYqK5AVJvEvrJqdcPYcDFPfUPyXpzs5?=
 =?us-ascii?Q?/JBHy1TDGEOB7fTWwHzFFjG5IKHam+ubRzm+n1vfuoPTNCwDzHz1Yqi3RXIi?=
 =?us-ascii?Q?J0Zyuid8Fple+a5wk2lzCtcN6c4gHWC85IQAua8Icr6GsCNxolVMJR0LQhq+?=
 =?us-ascii?Q?WrPbJMhYoZWWI79fTWDiutJJet9lJL0gCnsKuDPN45yvxjKfxBBIPx+WoNUX?=
 =?us-ascii?Q?tPIcxKgMj75dxPbXQd8UqrpjEIq4uykykH6QSVqQ/hJ/dZkR0PkFhhx/6N//?=
 =?us-ascii?Q?WMTCKMmKCeRSmgxW5232rY0sizGvccgDP9v2hPsAdumD/SW4l5Y9kVysKjLw?=
 =?us-ascii?Q?bdFLMX2f6qiyFOQcN3YavZkriUeMhCRTIWt4PBRLnEync2erV+GJCEKTqEC/?=
 =?us-ascii?Q?ODJ7gE0X+kxyMvwc2pmjsAhsYfXBWw6x+m+fQyBitVJ7hP16WVsKVWxtENSh?=
 =?us-ascii?Q?U050lD3rSy9DERLAwfqpLpWZhv59fNHiaEG6W22UigjMFMbtxl0Mw4NdrnmF?=
 =?us-ascii?Q?rSdUddwLCV7GcqnWmeP3Binz/p7Ye3FhkgN8Vgh9Z8vOlMxuJWeE1KO3/Wuh?=
 =?us-ascii?Q?cqxMWExw8Iv4UZ9P3VxaPe5pjbFeziKSvG7E/IaxuPFZMeNqvYwoqwa+NjWS?=
 =?us-ascii?Q?owvcgh62VcIEsTLxc7bOTVYB/J4Yc2AjNgVFqvBZ5VXwOCiTPYEMBZNAA6TK?=
 =?us-ascii?Q?npUdYl1TPA4ICssGRwy0G/x6dwkR5J5QcZVZ9+lAeIFaHReNWu3nm5iuosM0?=
 =?us-ascii?Q?xsGcVdB/RvtgnAB81oTW3kvX5ul0OnaIPyCqyzv8b7jtPGFMvldKpae1C67T?=
 =?us-ascii?Q?vAoxx1NYYfmXiMAtykQWLJ1FKdDNvYQJ/UJ/1cgMIngVFjetEFh37AIf5B7Z?=
 =?us-ascii?Q?bV5tXuOAoj4nIy1bsMJCcLGans0X9hbbIGz4UvPGtxHTVwM7l1gWJd1pATOw?=
 =?us-ascii?Q?9a3Y7q1/525HyiA6cpLlVlMmXNlI99LoLvu/J2esniZJmVKznkuILcZiXKu+?=
 =?us-ascii?Q?ewVomZo7B2jvuMr/3o2HYlqHlslmXEVG23e1ANjOg0tTBlxAYybtZ5K3e4I0?=
 =?us-ascii?Q?jG+gHcFlxhd7nGdkov5OYleNLP0V14yLh9exwyFeewPsKDryFbFZtKNB7QbD?=
 =?us-ascii?Q?tfkj5G5pcvxDAR8eNyq3kaL5WcJ76j3iBS2PWVIhun4N0dFkV7DFc7aHG7kp?=
 =?us-ascii?Q?R8TsYGpX97wT+5rWmgvHjgkC6MkAwTTLtnVmWdF2RBFPULrGGEcNFFzZeXdS?=
 =?us-ascii?Q?S58IWYIoj6qp3vqi0r/5hSgX3GWDi5w173Xe+5Ee2fA4NznkrCb26EKW/mNc?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c5c3c76-7ee0-4ada-16aa-08de0ce66ad2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 19:01:30.8536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /O4QRcnEllyA7DGd+yVFSt9t8DxIoVOqJMoW/8aM129IozhTwkvfY/m7409h0WBJW3K2yv2YgNOCYpId9W8wJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6654
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

On Thu, Oct 16, 2025 at 02:21:09PM +0200, Raag Jadav wrote:
> On Wed, Oct 15, 2025 at 09:04:18AM +0200, Raag Jadav wrote:
> > On Tue, Oct 14, 2025 at 11:09:19AM -0700, Matthew Brost wrote:
> > > On Tue, Oct 14, 2025 at 01:00:35PM +0530, Raag Jadav wrote:
> > > > Drop xe_gt_assert() meant for VF migration and make xe_guc_submit_pause()
> > > > available for non-VF cases.
> > > > 
> > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_guc_submit.c | 2 --
> > > >  1 file changed, 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index 0ef67d3523a7..3cc428d45b4a 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -2170,8 +2170,6 @@ void xe_guc_submit_pause(struct xe_guc *guc)
> > > >  	struct xe_exec_queue *q;
> > > >  	unsigned long index;
> > > >  
> > > > -	xe_gt_assert(guc_to_gt(guc), vf_recovery(guc));
> > > > -
> > > 
> > > This function does a lot of things specific to VF recovery, it should
> > > not be called in runtime PM flows. Same goes for xe_guc_submit_unpause.
> > 
> > Can we branch them out inside pause/unpause()? Or is there a better
> > alternative?
> > 
> > Considering we'd still like to achieve the original pause/unpause()
> > behaviour here (stop/start submission on a scheduler without loosing
> > GuC state), do you suspect any side-effects?
> 
> I came up with something like this, but not sure if this is correct way
> to do this. Let me know what you think.
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 0ef67d3523a7..8ee6069abe99 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2127,6 +2127,11 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
>  
>  	/* Stop scheduling + flush any DRM scheduler operations */
>  	xe_sched_submission_stop(sched);
> +
> +	/* Non-VF cases don't need migration */
> +	if (!IS_SRIOV_VF(guc_to_xe(guc)))
> +		return;
> +

This is roughly right, all you need to do is stop / start the DRM
schedulers. I think it might be best to just add function that does
this (xe_guc_submit_rpm_pause?) and perhap
s/xe_guc_submit_pause/xe_guc_submit_vf_pause ?

Matt

>  	if (xe_exec_queue_is_lr(q))
>  		cancel_work_sync(&q->guc->lr_tdr);
>  	else
> @@ -2170,8 +2175,6 @@ void xe_guc_submit_pause(struct xe_guc *guc)
>  	struct xe_exec_queue *q;
>  	unsigned long index;
>  
> -	xe_gt_assert(guc_to_gt(guc), vf_recovery(guc));
> -
>  	mutex_lock(&guc->submission_state.lock);
>  	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
>  		/* Prevent redundant attempts to stop parallel queues */
> @@ -2325,6 +2328,12 @@ static void guc_exec_queue_unpause(struct xe_guc *guc, struct xe_exec_queue *q)
>  
>  	lockdep_assert_held(&guc->submission_state.lock);
>  
> +	/* Non-VF cases don't need migration */
> +	if (!IS_SRIOV_VF(guc_to_xe(guc))) {
> +		xe_sched_submission_start(sched);
> +		return;
> +	}
> +
>  	xe_sched_resubmit_jobs(sched);
>  	guc_exec_queue_replay_pending_state_change(q);
>  	xe_sched_submission_start(sched);
