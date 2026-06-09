Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1863CD8CA4
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 15:22:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701E310E3EE;
	Tue,  9 Jun 2026 15:22:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKjw5D41";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A67A10E3EE
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 15:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781018575; x=1812554575;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=K07aflT7LXmyo0xZAvFS5YkKJ0L2ZzVNwd8dJVC8nlM=;
 b=RKjw5D41wDOxPvkwsXWQuInAP8bZxePj4NihdFtIm2JxK57NQePebaHc
 dVUt1FnUD265VSlxJIw4o2+LdiKc/Zme9sp/Gk23VgTcMzU/6SUMmSRQA
 KSsjUgxMA3KUmNE07w3ZPIC7ivlQwM5m9p7Yzis5KHV0pC1fJWHyoedb5
 SzxK91wZfmnWCiMss+M0IxYDusQARB7OE114RZ4PRd23HHdr36PZ64Oqu
 jsFN/AbmR9hfnb/ce+18MeiCr0vq8rHiUPtfxfiMLut+EqZBtSbUJjqTJ
 Z4Dt5dq1sr4M3fzE2wPagkjfdc2JnXqpLoERqkACYsP1Q76u6uT/O7S6P A==;
X-CSE-ConnectionGUID: rRnLZFl/ScmeJ7wC2uRPTg==
X-CSE-MsgGUID: /vYYw4z3SEGa3tajxCnbbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="104447539"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="104447539"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 08:22:55 -0700
X-CSE-ConnectionGUID: 0l84q50iSxidX7QGEbyOwA==
X-CSE-MsgGUID: o/lL4Hn/TJ6YF+8Y9Pplzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="269903941"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 08:22:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 08:22:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 08:22:53 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.53)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 08:22:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NIazVGcmftvgW4Mpc4tWPdcMumDzALpl/sJknRgXOdMBGlQPgbwlgmUZ53jmnFJ63dMdvflNKSHyFHVJuIrfQtSSLNyh0RHS/ZwiL2GBBEqRPQZPzVpFhtzKzvBP+WNQ8WwksYFNwfAFUvWdmztBGOrfYoWkv8IlSU4U6nqR3dDbdz+7Q45rKOJvpQVDxmeQT58F3F63IfDZp1jnvp+MMzixEa9HLqF0Oq4ycYr6l3d1mPVSHDOMRi+wRJ2h/BjJZgjGTYEnG38mMnCVUmOu8qh2KfZjuys+jly1DhRjbkcVHPpfyWCRc7jQqO9jtCk22OPFG21fNu3v6kcfRrTPuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHto+y0FuPq6TCePz7djIM5xi0kr9v1oCJFBYZGEg/Y=;
 b=RALMnUzcsBgV8QgaFhcuoUfz6yz3gfKM2xlg/+c4UROhJpt/wcTsA17bQxlSy6HhHqnbQU5xAsmofU63rRyM8hJhA9Z7vBvy+MhqBOPLrJR673p4vK3D0OyG7yWux49/70yv4NFQP1eRZnHW1rSUQgTqdedL7Advo32hLy70pm3/WA18uxam1m9m2mVbo8r9CE5sqVyadnqRhXfHWxjB65JrMNFeVEW4Y4fT9CLzWBMGEOOKPHVzN9BZR5T8nx4DArC9jOCwDbbBQLnugtwgwMKtsF7Vf8vjlWkEmpi5akWBqpF2fukctLeNTxXn3yUvKZs4kBDTVBKY0aWdcUlKwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by DS0PR11MB7443.namprd11.prod.outlook.com (2603:10b6:8:148::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 15:22:49 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 15:22:49 +0000
Date: Tue, 9 Jun 2026 11:22:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: fix job timeout recovery for unstarted jobs
 and kernel queues
Message-ID: <aigvxsRgK5hjWkJa@intel.com>
References: <20260603150059.157355-4-rodrigo.vivi@intel.com>
 <8dfe4463-476d-4606-850c-c9c34bbf4408@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8dfe4463-476d-4606-850c-c9c34bbf4408@intel.com>
X-ClientProxiedBy: SJ0PR03CA0372.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::17) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|DS0PR11MB7443:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d06a066-76be-4dda-d649-08dec63af785
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|6133799003|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: M8PL0xAYiUv622E0K911xM9mLFL4n/FfaDoz4dm4mq2sTtvrHGTuglejZyx5fTGMM+xDdg9ea2FvMtAFewd3Y9N7/IdZdzymkq6QUEpO6Ki62gWXcN/SB3rDOTgn9TfrP2q5iRoEfDvMSOmOi8FPIP6FVV9WSkh60Hllhkm+2J+C2TP2QVmx3UCSai+ikVIUCvF0/1nPFMqrVVRf6lB4b3Zjpm+aX3KRE/ePQh4WPPWuE9KwNT8DCulVmr07JpzHoRTNCqDMHQmgEx96B7c+t5fuR7Cgmu4eikGLKiFCZ2lUZtJVE2YwwEzw/BfCn8O08tCnV87WN35Ky2x4hZUBdlncjN5VdpbnbTr1vZZHLSCSjFfMjnVdC09q/J+LL5q1NlgKZd208xiZBiN1Ug+aQwIvmxSn9qHaZb1AAv2lFCm0L88Oq7ClV7l2hJQtOHKTJargA3esq4JCWnJ4gMA6oN5I1N9kPGhdK2iDgx8dJHCRzSfHRwKLKkiWN6/F36ziVI7td2CLNh4oQCmSq1psKuBd6hA7NPQfZx05MaDIpFvDitDysaEaKPuJacnEPkSl8xowRO6vB2/PZNrcTrxCm6T48le9Zq/ECmlpux6eJb7/RZ3OF5bAigizSNIUnPxKcj65lKLDgsLMF0ZNCdI6QWLgKxtSsAkmtAyph0fowrMGJ0CFSiyZ24dgIrgp41Tnoy8n94i9FxwDCpJ87gT/2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(6133799003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWhjbTVuQjdmVzFuakt3SDlzdzIzdG4xVlUySXNBWlJPVUJOeGJReVk5MVZ3?=
 =?utf-8?B?TTZjYjE1THdIaUJuQ1p5MXpEZUNvVzhGb1dyYnpwbWQwWjZUWjNxR0FIbVFT?=
 =?utf-8?B?NzQwbDYvblpVYWtqTDBJV2grUlVEQWk0RVVlUE92blIzelg0VVo3TnVlbStm?=
 =?utf-8?B?eEVYeFZWTVFaUVhsbUpocVdyTFVtK1IyalpnQWpXNk4yTndWVE9rams5VFRY?=
 =?utf-8?B?dlFvVlU0dzVQWWNuT3JkREQ3VlgzOUxTVU9kaDVVRkUzZFZMNEh0RzYrbytC?=
 =?utf-8?B?akkybE5qbWgvQnQvYVBuWnFDWUgwR1dmVnJYVUV2Tk5rMk5qczNHdTdDRzR2?=
 =?utf-8?B?Nk55WFo2RE5raDdjazVGQnZFdFVwTjFEUXZZTWFZWGNSaXJvWER0VW10WGR0?=
 =?utf-8?B?aitDMDVGOGVXc2QrSTVtcTZ3UUFBZ3NIODVGMDg2R3hKQmJDRHZURWJZcDJv?=
 =?utf-8?B?TmIrZ2k0dU9PUzFRR2o4VEltRndyd09pVVhpVUZBVFhlVktiTFgwd1NYYm9V?=
 =?utf-8?B?N2RaeE1tL2xybGRZVGs4U0ZGUlBsdk9NdVZlZ2V2MVY1THU3cjgveWFoOTRt?=
 =?utf-8?B?TlMzMGFwRlJHeTkrbnJRYkprakdtK003MjY4ZHFweTQ3MmpHRGQ5NnFNUlNZ?=
 =?utf-8?B?YnhmdkRYL2xsOVZwMmxQdlRKMStwOTBHRVZpbnkzdkZBZExiL1ZLazhZcHo4?=
 =?utf-8?B?Q1VwNEZLVjBiR3NNZTBmZ20wNWRObjYvUXBpbXZEWHEwaFhkK3VmQ0xvNEtn?=
 =?utf-8?B?VDhaVlovVy9mSHVvVHVaYkxhMVJSZGRhTzhKUWc4dWtDQjhVcitocHBOREo4?=
 =?utf-8?B?NEtyWmVDZFBqRE9MOExKZmsyZjhaSFFKZTNMTi9jdi93QUJ5cFdyTFN4a0tT?=
 =?utf-8?B?Y3pwZm5YMWFFYkxOWFV0QUhzVWFZdTlyaXJJaVQyZVdqKzFaTnI4bFpXR2V1?=
 =?utf-8?B?bTg2N3JjKzZQaFpha1Q5aXd2Y0RUTlhIUTJkUnY4b2NCOWJJTElwU2lhbjR5?=
 =?utf-8?B?cEFDZ2ROUjlUVW5uSWI4dmhVNUV1d04yVUlscnQ5UDlwRVJQSXY0VlNCdXB2?=
 =?utf-8?B?MVhTZ1E4cTYzb3NkS0NWMTU2ZkNwMHZpdk5NSkpmWlZXaTJjOWN5MVZzekdy?=
 =?utf-8?B?ZFhQT2pBMUszV1h1azhYQUNadGlBZld5eFA2aklYbGhocVhvbiswOTZvM1ZD?=
 =?utf-8?B?bjFsK0JqVmt0WnRLbXBxcDdSZnpQNmFQbmJXTXpqRkxUVFpJdVc3T1RqVHdU?=
 =?utf-8?B?M084YmZtbmpGQnd0bStiSG1lU2tGc1lad1NDS05RR1U3LytoTFJOM2RTR3Qv?=
 =?utf-8?B?a1BtREYvSmZjazJUK1VNWG9IMFRhQ3NzQjVFSXl2UUI4aFVxUzVKQjE3dmYy?=
 =?utf-8?B?aE4zcGJGNFRUaE1ZNllhTVJkT1ZSdFNEMjVFNVZoejN3OEpQdUpLZjUzZ2hq?=
 =?utf-8?B?RFNsQUQ4WERGTmxXVXdocDFVUHVFdDk0eE5FM1FRQ0tXY1A5cTNxcldXSFU5?=
 =?utf-8?B?Uy9tUkJNTmpnQ3ozaXg3ZVZEVUN3SW1ZL2JKbi9PMEZlaWFwbmdoalN5Wk1q?=
 =?utf-8?B?MCt6ZVhJTm1JVWZMdnVqR3BWZVFVVUwyNmJ6ZWN0U2xoSzlHZXNvKzJTQkxk?=
 =?utf-8?B?dkNsWXN4MHBMWi9kendRekhIOWhEQTNOcWgxd1h3bEZaVGJiWDlBN3lSeFlh?=
 =?utf-8?B?Zklyb3lsMWVGaEF6TXJCazkyYU0wQVNDMVk5aDJ2di9UNjJtUmxOcWhMZnk3?=
 =?utf-8?B?d2lwd210RHFiNS9vSW1iSDdLTkp0RUNCTVJPMjFDb2VLSXhuYXdGZnVmbk9y?=
 =?utf-8?B?MWtrTkJSOUY0S0h3RVplUmhHU1Z3NDdobEZFd0F5MEUwRGQ3WW5RQmkxZmp2?=
 =?utf-8?B?Rm5GY2l4S2RmT3UxbzlVdnArUWZmZ1F0TUdTQ240NUZSd1UyTnMycnNiL2Fo?=
 =?utf-8?B?aFZ2czlvVTl4amdYN3ZOL1laZGh6WWRqbHVacW90YzdnblZSdEJFMDdTVFcx?=
 =?utf-8?B?aEVFeFRCL3ViM3NLSjZpazdYbGhna0FSMVdVWXVpYzJ2MlZiUllueU5udEE0?=
 =?utf-8?B?NFVhcXBHbXVVck9INXVPeVh1bDYzSjlTc0JDMlBFd0pPMjlCTldidFpjVU1w?=
 =?utf-8?B?eUp2VlRnMmZlWXozZG90eEV0eDFtMHc1dTFXQ09iaDVvcFM5M0JsUXlKbFJL?=
 =?utf-8?B?TWVKSGNZNnhhUHZVQUxuaE9mT2dBTHJFK2ZvT2xSSVBLVmE2enlxcTV0WGRQ?=
 =?utf-8?B?dGE1SjhFL0V1Q1NTRkhYOFkwUU00MkZSRDJsRmJSM0d6aWFobWNwbW8wK0FC?=
 =?utf-8?B?VW93c2NrM1lXc3U3a1V6NWtHYXgrUVdPb0tENnpneEFOR0JKUXhBZz09?=
X-Exchange-RoutingPolicyChecked: DRixVtbW51kWH/SzpMeYjZpAZYDhyxE4b8Dtf73DFWVV0dIQEMnptrvjij0usPPZA+j163t7W0LWI6/00m/jaJR9gusDZCf5lAsgcN3O0gMw654qH7U0iwrLBMoUnph/+uHJ2ZBR/1t6pfn5gcBZCXTRetTabDqI6/EE0U8qgm0XD3uDGCSNuJzdSfNAGfZJoQGFJAnuiObgItDzN1WMRDBOCTLfaTrZQk3ceFCr4GfvUtBz1yGz+Ha5euHk9R3SSWDi/wlSLNbPTzHadQdgoEDw0ixSPtZIztQ/B+lXh63bpkiD0aLI94SMq6q1eDx+N/WF7zSqq4un3ttVBwYRkg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d06a066-76be-4dda-d649-08dec63af785
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 15:22:49.8673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5meYCkRwLSfyQQIsNHixJNAsj9d6RuqIdEBDOXGsV7sYmoQ23LtCB5FSLqS/p8aoFkg8lIQfK7tSkBakDpjWKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7443
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

On Thu, Jun 04, 2026 at 12:16:38PM +0530, Yadav, Sanjay Kumar wrote:
> 
> On 03-06-2026 20:31, Rodrigo Vivi wrote:
> > Jobs that GuC never scheduled were silently errored out instead of
> > triggering a GT reset. Kernel jobs that exhaust all recovery attempts
> > should wedge the device rather than silently fail, and userspace VM bind
> > queues should stay permanently banned rather than being reset and retried.
> > 
> > The queue is banned early in the timeout handler to signal the G2H
> > scheduling-done handler so it wakes the disable-scheduling waiter; without
> > it the waiter sleeps the full 5s timeout. For kernel queues the ban is
> > cleared before rearming so that guc_exec_queue_start() can resubmit jobs
> > after the GT reset — a banned queue would block resubmission and cause an
> > infinite TDR loop.
> > 
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Tested-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> LGTM
> Tested with Reproducer IGT and xe_evict - No IGT stuck recovery works
> correctly and subsequent migration tests pass.

Thank you. Since I changed the code a bit on the v2, I didn't keep your
tested by.
Could you please check the v2 as well?
https://lore.kernel.org/intel-xe/20260609144412.244678-3-rodrigo.vivi@intel.com/T/#t

> > ---
> >   drivers/gpu/drm/xe/xe_guc_submit.c | 31 +++++++++++++++++++++---------
> >   1 file changed, 22 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index ab501513d806..bbccba367626 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -158,6 +158,11 @@ static void set_exec_queue_banned(struct xe_exec_queue *q)
> >   	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
> >   }
> > +static void clear_exec_queue_banned(struct xe_exec_queue *q)
> > +{
> > +	atomic_andnot(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
> > +}
> > +
> >   static bool exec_queue_suspended(struct xe_exec_queue *q)
> >   {
> >   	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_SUSPENDED;
> > @@ -1376,7 +1381,8 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> >   			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> >   			   q->guc->id);
> > -		return xe_sched_invalidate_job(job, 2);
> > +		/* GuC never scheduled this job - let the caller trigger a GT reset. */
> > +		return true;
> >   	}
> >   	ctx_timestamp = lower_32_bits(xe_lrc_timestamp(q->lrc[0]));
> > @@ -1622,19 +1628,26 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   			       q->guc->id, q->flags);
> >   	/*
> > -	 * Kernel jobs should never fail, nor should VM jobs if they do
> > -	 * somethings has gone wrong and the GT needs a reset
> > +	 * Kernel jobs should never fail permanently. Attempt GT reset and
> > +	 * resubmit; if karma is exhausted the hardware is unrecoverable so
> > +	 * wedge the device.
> > +	 *
> > +	 * Userspace VM bind queues are banned permanently on timeout
> > +.	 * No reset is attempted, the ban already
> > +	 * signals the G2H handler, and the queue stays banned so the job
> > +	 * errors out cleanly.
> >   	 */
> > -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> > -		   "Kernel-submitted job timed out\n");
> > -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> > -		   "VM job timed out on non-killed execqueue\n");
> > -	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> > -			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> > +	if (!wedged && q->flags & EXEC_QUEUE_FLAG_KERNEL) {
> >   		if (!xe_sched_invalidate_job(job, 2)) {
> > +			clear_exec_queue_banned(q);
> >   			xe_gt_reset_async(q->gt);
> >   			goto rearm;
> >   		}
> > +		xe_gt_WARN(q->gt, true, "Kernel-submitted job timed out\n");
> > +		xe_device_declare_wedged(gt_to_xe(q->gt));
> > +	} else if (!wedged && q->flags & EXEC_QUEUE_FLAG_VM &&
> > +		   !exec_queue_killed(q)) {
> > +		xe_gt_WARN(q->gt, true, "VM job timed out on non-killed execqueue\n");
> >   	}
> >   	/* Mark all outstanding jobs as bad, thus completing them */
