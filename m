Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3994EC88E4D
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 19:33:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E1710E4EB;
	Fri, 11 Sep 2026 19:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iddKnbYW";
	dkim-atps=neutral
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Fri, 11 Sep 2026 19:33:01 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A9210E4EB
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 19:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789155181; x=1820691181;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OQ6NqVfzPwSsN/MPdVspoiuWUoiL0s92XozzpRADr7M=;
 b=iddKnbYWaWLYGicleZa6zUvfWPEZKEKk/kYRai2Pp0iRsruhFmbk4wm8
 oUVm4m/H4FJtcu3KdJrDGV9wZrf67hBucW54fWUpHAGb9uNehD+w3vsd7
 t9q+jonGifDNfJS7KAfsBMnzp17f2wXRl/ehCSQp12btTBbnmxMcqSIi2
 o6Rck0EzFeeljB0FZxId68uNiGrCe7n3W8vV5gHFGjEQwpr5ObNpusyFA
 KzuC6JFwZ00xhObDcLR0ZKPnXJhtCG+N6LIRubPfVlJariDXAHcH1HQ+F
 LyCgAsQ9LprxKmcN0K3AkcfZMaqzbKqbqfyLxZxxVWqpiRyF9qp+dIdSF g==;
X-CSE-ConnectionGUID: HGBTG70PQw6La1ga6Z9ltQ==
X-CSE-MsgGUID: 2jjV/yieQMuS2SpcnM1V4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="133389"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="133389"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 12:25:54 -0700
X-CSE-ConnectionGUID: 1NA0RZQYSve5mi2piky14w==
X-CSE-MsgGUID: HkaJwNPZT3KrFFBw/VCpDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="272512807"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 12:25:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 12:25:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 12:25:53 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 12:25:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jaIaB+5hwZZdBshy+wJIH2YZty8QzlX1epGrDVitC+iy+rT6rnlb10Z0e6IlfG0J1TaqGFim52hCnwLmxAjmINyff5pGcoLb8EqkaXOJuXGif0y/PpzQsyic9V0wYCdmri8KEriVAJ9fS0hetoP73ekpVe+zq1FoYfYkfsD2Gzph78wkPG1nQj1mxqBRdkpYQdF/5lYT+Ge6/8SAgVTEKdznN567jOfqzZc30pnopBs10PjYjCdfKPaeyqLsUutys/3eCgBNXCugD9GBZFIBBLp2CMKSI8oDgzcVBf4uHwoun1pJGEKtqhzKB2YlM5G439+MgSLF8x4JiIo+CghWbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZrpaDpTFeDX0657gTtWf7Ls7zJd6wfcSeo3EBk0dyJ8=;
 b=Ykf/iaK5kK2WRJ2NS1bjNCw/AdzMitL2wQvNlj8pEmKt5fG2VYMiq5skuepMlKRTVYKdv4Qyg/YcX/Vpe0Bt3ZBTpVc8IRoyQ259DZ3fgcKDh/umK+TwFmkdSi6gkgYTqYPutMxVz76/ypfhpj2fI5c5TX98L+o3WgCgSROT5RQC5sbD+qqeRIVEtnahoBgFll66xTHm3nWj11BKDvQB/1D/Obb/BvT8BUf4PZd2XHe6Xt0/75olzPn1gGVToCDe1Le9MnYEvBW7f95OG06xFukvaSJK4Q2tNvq+0S+XPLV6lIS0KZaBN1oWEbdPMTVoj84k0wMOEP39PBav8WBopA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by PH8PR11MB6853.namprd11.prod.outlook.com (2603:10b6:510:22e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Fri, 11 Sep
 2026 19:25:50 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%3]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 19:25:50 +0000
Date: Fri, 11 Sep 2026 12:25:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 07/24] drm/xe: Update scheduler job layer to support
 PT jobs
Message-ID: <aqRVvG4pqmwlAJnk@gsse-cloud1.jf.intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-8-matthew.brost@intel.com>
 <aqQdJ9X8FhhZq6lM@fdugast-desk>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqQdJ9X8FhhZq6lM@fdugast-desk>
X-ClientProxiedBy: MW4PR04CA0385.namprd04.prod.outlook.com
 (2603:10b6:303:81::30) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|PH8PR11MB6853:EE_
X-MS-Office365-Filtering-Correlation-Id: 35b03e8f-ca45-4571-4a7a-08df103a7cd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|10067099003|11063799006|4143699003|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: xzdtrSfW3t+sUVILoq7SB+4LzYPhNmfA8RphGzh6LHGRACJqCtqyliGwMBZYpUjUbuX8Rhm0Zx83HsUahmZ72odCB/flxKDbGR8QF1M0SDziOr1J4FP9bpB2V/6jj9fEWdbYh4pCMCVUr3aiiAFYWJNDH2BjMkzy3uZATdRRF9rE1hLUEOtVIGQsV0Aej7IkoMefjde2kRXI6fRVu8LPl03O4RE5cUWl5cM0X3xwNaG6k/kqNl1RndbezuX3tErSXAUBoFS7Z6tR6oWNzKjnhlN1nIehvohVMvNQbAVq7iAsxST3Evr5x3hn0TyMQpFZeHZVC7JkX7GYcU+ilZcDbk7x4StYs4gYBFd1B71tvad3PeWMxYBk+O1ZCP117a6Lwf6FjCf/y9UVvq2DJx3eoTV2V+zRr2+WOjGPX7bdTBwzhKO89++0PKR+P/LU3po6Hcg62RHEOEfE3O8JPoIhudiFqKSkYcuUTnhxPRHGuk48xrzuzOCwTW4edz0BMoKV7JPAo7kNu7u3r9iXvN83G8YN1R7AaMcQQFULEV98EgNooOT9j8+x9VxUecIGKezRiZiYtG1UW9CaaftPdkKQ1v3HsvIhtzbz7qM41cULysM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(11063799006)(4143699003)(6133799003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ry8yeGJySTlSSUdRbXVEdkZha1hldENPMlVEYURzQkFJMWdHUEhFQkRiMFFu?=
 =?utf-8?B?blhKdkJDUGNDZjZOV3RyVndMbjQ0SGVNbDk0S3RWcTArL28yMnpqbHMrakMw?=
 =?utf-8?B?c1BYZGFBTWxWeDJuMHBZMjVxK0J6eDFmMjhLTHpjU1Q2bUJrZGZQR1B3WTVZ?=
 =?utf-8?B?TkhSSUU2RWJiTW5jSmRoUGRBcmtnajRranp0dG42dkY2K1E2YVRNRXJhY2Fp?=
 =?utf-8?B?MEozTmg5cjcrOE9MVDBXdXMzUVJjSDZhVXVHMVdSWVFZczVUWE41MWRtMFk3?=
 =?utf-8?B?YzB3cGFVRktSMG1EUXM1NnJZUGQvZXlNcmpMbE9TVFlsbHF2RkU3UldSSW14?=
 =?utf-8?B?d3VsZDVNNHJqNDNBS01hZTlURlhnZ3BwLy9IMWVqTmtWQmxUVGxpbCtTeXQ4?=
 =?utf-8?B?WUQ1TzROc0pRRkFjQm9mMis5WVAxa3B4RkFsd0FRdmJ0TnlTRGVzcGY2S1ZP?=
 =?utf-8?B?R3B6d2ZIaHB3eTR0Z2RGdzRxZUhQcmxGakJIUDcvdm1HNzNvS1RGdXh3VFcx?=
 =?utf-8?B?SXNlMXB3cnZLRk43c05OZnFqSFF0ZDcrVXU1eHlIeUMrMmdpQ2t4VzVaV0J1?=
 =?utf-8?B?YXB6MDF4RUMzei9zdzJNVVBPRmpHVUxiMEMwR0I2TGNjb3RNNWlzcXFnSDMz?=
 =?utf-8?B?dVd1cUszWUpXVEFaaitPQU9kbDQveVRkdW1mWjUwM2tBbFg0TGoybU1WcEpR?=
 =?utf-8?B?T21iV0tWRS9nQ1FKaWpjaDhWM0d3VFBDUlo3alVRemgrL2tQalYzY2ZtR2FW?=
 =?utf-8?B?ZVdVeGxFaDZSZ3ZuS0VEY0t0Q3BueG5XUUZ0WGJhRElDcEgxK0p3MVVnTUVM?=
 =?utf-8?B?Z080ckZqZHVTUDBmVW5ieVNyR2VsRkNGSnlmU1BOQlBjUWxOWjRVN1BpTWFl?=
 =?utf-8?B?MGlDZnZOQjNzTnZZM3U5RW45WW9oU2lGRlN6ZExZZXROVGNBbnQ1NVdXRS9K?=
 =?utf-8?B?Sjd5U05xVHZwdkxDeXc3VzlmYUVLMGJ5Q1piWDdsM0wwL1ZUbHh1WVN1Vm9l?=
 =?utf-8?B?aHpLVnlKeWlGWWIxVzhxUDByVy9sNkkwWEZZb2lNSktkbnJtL3d3ME9jaHcy?=
 =?utf-8?B?T0hsMVVXVXVWaXQyVVR4ZjU2VFlZMEw0MHpFQkV2VHg5dHZydEloTy90V1hY?=
 =?utf-8?B?NHh0eDkrbVZLTG0rYXZWVDFGYitSeFRNQnc2dWw4ekJMYTRrWHExSTRINGRL?=
 =?utf-8?B?OEp2OFVMNUpvR0JybG5pNFZmeGRIOEUwQ3NEOTZFS3lieXF1am5WdGdreEMw?=
 =?utf-8?B?YUdkaXJRQjFFbU5IeGZudndwTmlqVXhkTVk1eEF2cHUyNU94VWkwMzQvb0ZY?=
 =?utf-8?B?OTVVcVpjOFloVUxJSHIrT0I5cGFyWnJOSGVEU0FESjF1bVlORk9Mby96cFFv?=
 =?utf-8?B?RStZZUMxLzVaNlU5aVpYQnN5VndVK2xQRkVrdU5yd3VOMngwc2hOcnRoK2E1?=
 =?utf-8?B?cXlUUHFZbUxkelgzUzdSQTQ0aWtTWEhXYWIyWnd4c284NVd4anRONzIyUE5O?=
 =?utf-8?B?dzg3KytGOUlIVkRzUkhablJIZEJJaEF0NDJhcWZaa1VwNVhXTXNZWUdXWDB4?=
 =?utf-8?B?K3B3bFhIK3NJd0ZIa0UwVk5PK2ZQcnl6WjkrZmVpNnIxQ1NPWGdGU3psZmJ3?=
 =?utf-8?B?WnpyQlNFYkRUeGt0RExvdGNpdFpyWmxLVUdJeGk5cjNCUWlvVFN4Um5ZUm12?=
 =?utf-8?B?MUczajZJenc4R1RUblVESFRKWGRjYWhDekdJdWI5SDlUL0NoemZ2b1BhRzJp?=
 =?utf-8?B?QWVOUjB4UlJOVFY1UC85V2dLc0c5dUdmODVBZm1xOU5LMnpKWkJ6Q1cvOTFL?=
 =?utf-8?B?b2JIRXBzSjhRc2JOYURNL3hTK1VBRDBnOFlUOE5QN2lOQWZONDN6SnNFb3BZ?=
 =?utf-8?B?K2Z2dDJtbjErcjFCOUk3eWs5VWFmNFZYWkhKc1lSbkJxQUprK1ZqYXlFVjJx?=
 =?utf-8?B?YVlGaWpQa3lIMk1JVE8ySU9sdkM3d2tUdUQ3aUltb25lSHY3L1JWdjFQVWpl?=
 =?utf-8?B?amt6bGlQVWp4OGJwOVlDdVE0d0tab25XZkpPRG9RUTF0K2x4MzAzZlpNODVR?=
 =?utf-8?B?UmpCOVBqN0pzd2JoQmxZZXF0RHdvWDRqYW8vSVlRTnZ0VmM2eFRiSVVYb0Ju?=
 =?utf-8?B?OThsZFVSWnVUc2lxbVRTZlVwK1c0N0hxcStON1ZoSkZXV3h5T1hQRTc0N1lI?=
 =?utf-8?B?MWRLSlRBYVIvTjdoUHFERnM5ek9XdEpNVDNvNEljVU9kOXVCMUhPU1RRa1dI?=
 =?utf-8?B?cGNHbVYxQmhFZEFGWldlT09nOEpsYUtmMytPMmsybCtzSXpSckpybEswOWVC?=
 =?utf-8?B?NWlSRm1PYkc2MXBQVmlkemoyYWxmVWk1UzBBVzQwTUdPZFdxRnVFdz09?=
X-Exchange-RoutingPolicyChecked: AggW62ZgowHmv4YRYHwuUwCEj+KYGai7YM+w383E1Ox5NNYYVBfLABq/M2i3XUbgFhrznqNhtJWrKRFok6DqhbFgcByHZVia/nuaGu3Rs3qWIQHfsKvUnEpf8+wx3jdAvBNKoMURHR5tlCbLmBGSmvM/hXi+bG/Co2iUcmpF0pcsgZ/p6w1WGQhLm9iQAgc9ne4co6eshDXkJDiBB+nwqse1a4lDTXUGb2zPoZDWXvGGD3Emt2yk58N4fZoz9GwgZgupgdjnG/DIWYYt0AvuydpdQBc55HVOk9cZRic0FJNhZyO8ifLARGJjwYhsqzk1UZvc5JzewYkdyIFCacyCew==
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b03e8f-ca45-4571-4a7a-08df103a7cd5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 19:25:50.0730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZsEVLFVRdo5VtQZjYiPDZgWkkRaRje+3stFOSMxi52JPg65zPAaUsNNtikduCrHwKAbkFIkmKDV+TB7rmJsbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6853
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

On Fri, Sep 11, 2026 at 05:24:23PM +0200, Francois Dugast wrote:
> On Fri, Sep 04, 2026 at 02:15:56PM -0700, Matthew Brost wrote:
> > Update the scheduler job layer to support PT jobs. PT jobs are executed
> > entirely on the CPU and do not require LRC fences or a batch address.
> > Repurpose the LRC fence storage to hold PT‑job arguments and update the
> > scheduler job layer to distinguish between PT jobs and jobs that require
> > an LRC.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Link: https://patch.msgid.link/20260228013501.106680-8-matthew.brost@intel.com
> > Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> > ---
> >  drivers/gpu/drm/xe/xe_sched_job.c       | 95 ++++++++++++++++---------
> >  drivers/gpu/drm/xe/xe_sched_job_types.h | 31 +++++++-
> >  drivers/gpu/drm/xe/xe_trace.h           |  2 +-
> >  3 files changed, 92 insertions(+), 36 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> > index a4fa00632a30..841d67ebd5b0 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > @@ -26,19 +26,22 @@ static struct kmem_cache *xe_sched_job_parallel_slab;
> >  
> >  int __init xe_sched_job_module_init(void)
> >  {
> > +	struct xe_sched_job *job;
> > +	size_t size;
> > +
> > +	size = struct_size(job, ptrs, 1);
> >  	xe_sched_job_slab =
> > -		kmem_cache_create("xe_sched_job",
> > -				  sizeof(struct xe_sched_job) +
> > -				  sizeof(struct xe_job_ptrs), 0,
> > +		kmem_cache_create("xe_sched_job", size, 0,
> >  				  SLAB_HWCACHE_ALIGN, NULL);
> >  	if (!xe_sched_job_slab)
> >  		return -ENOMEM;
> >  
> > +	size = max_t(size_t,
> > +		     struct_size(job, ptrs,
> > +				 XE_HW_ENGINE_MAX_INSTANCE),
> > +		     struct_size(job, pt_update, 1));
> >  	xe_sched_job_parallel_slab =
> > -		kmem_cache_create("xe_sched_job_parallel",
> > -				  sizeof(struct xe_sched_job) +
> > -				  sizeof(struct xe_job_ptrs) *
> > -				  XE_HW_ENGINE_MAX_INSTANCE, 0,
> > +		kmem_cache_create("xe_sched_job_parallel", size, 0,
> >  				  SLAB_HWCACHE_ALIGN, NULL);
> >  	if (!xe_sched_job_parallel_slab) {
> >  		kmem_cache_destroy(xe_sched_job_slab);
> > @@ -84,6 +87,9 @@ static void xe_sched_job_free_fences(struct xe_sched_job *job)
> >  {
> >  	int i;
> >  
> > +	if (job->is_pt_job)
> > +		return;
> > +
> >  	for (i = 0; i < job->q->width; ++i) {
> >  		struct xe_job_ptrs *ptrs = &job->ptrs[i];
> >  
> > @@ -93,10 +99,23 @@ static void xe_sched_job_free_fences(struct xe_sched_job *job)
> >  	}
> >  }
> >  
> > +/**
> > + * xe_sched_job_create() - Create a scheduler job
> > + * @q: exec queue to create the scheduler job for
> > + * @batch_addr: array of batch addresses for the job; must match the width of
> > + * @q, or NULL to indicate a PT job that does not require a batch address
> > + *
> > + * Create a scheduler job for submission.
> > + *
> > + * Context: Reclaim
> > + *
> > + * Return: a &xe_sched_job object on success, or an ERR_PTR on failure.
> > + */
> >  struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
> >  					 u64 *batch_addr)
> >  {
> >  	bool is_migration = xe_sched_job_is_migration(q);
> > +	struct xe_device *xe = gt_to_xe(q->gt);
> >  	struct xe_sched_job *job;
> >  	int err;
> >  	int i;
> > @@ -105,6 +124,9 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
> >  	/* only a kernel context can submit a vm-less job */
> >  	XE_WARN_ON(!q->vm && !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
> >  
> > +	xe_assert(xe, batch_addr ||
> > +		  q->flags & (EXEC_QUEUE_FLAG_VM | EXEC_QUEUE_FLAG_MIGRATE));
> > +
> >  	job = job_alloc(xe_exec_queue_is_parallel(q) || is_migration);
> >  	if (!job)
> >  		return ERR_PTR(-ENOMEM);
> > @@ -119,34 +141,39 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
> >  	if (err)
> >  		goto err_free;
> >  
> > -	for (i = 0; i < q->width; ++i) {
> > -		struct dma_fence *fence = xe_lrc_alloc_seqno_fence();
> > -		struct dma_fence_chain *chain;
> > -
> > -		if (IS_ERR(fence)) {
> > -			err = PTR_ERR(fence);
> > -			goto err_sched_job;
> > +	if (!batch_addr) {
> > +		job->fence = dma_fence_get_stub();
> > +		job->is_pt_job = true;
> > +	} else {
> > +		for (i = 0; i < q->width; ++i) {
> > +			struct dma_fence *fence = xe_lrc_alloc_seqno_fence();
> > +			struct dma_fence_chain *chain;
> > +
> > +			if (IS_ERR(fence)) {
> > +				err = PTR_ERR(fence);
> > +				goto err_sched_job;
> > +			}
> > +			job->ptrs[i].lrc_fence = fence;
> > +
> > +			if (i + 1 == q->width)
> > +				continue;
> > +
> > +			chain = dma_fence_chain_alloc();
> > +			if (!chain) {
> > +				err = -ENOMEM;
> > +				goto err_sched_job;
> > +			}
> > +			job->ptrs[i].chain_fence = chain;
> >  		}
> > -		job->ptrs[i].lrc_fence = fence;
> >  
> > -		if (i + 1 == q->width)
> > -			continue;
> > +		width = q->width;
> > +		if (is_migration)
> > +			width = 2;
> >  
> > -		chain = dma_fence_chain_alloc();
> > -		if (!chain) {
> > -			err = -ENOMEM;
> > -			goto err_sched_job;
> > -		}
> > -		job->ptrs[i].chain_fence = chain;
> > +		for (i = 0; i < width; ++i)
> > +			job->ptrs[i].batch_addr = batch_addr[i];
> >  	}
> >  
> > -	width = q->width;
> > -	if (is_migration)
> > -		width = 2;
> > -
> > -	for (i = 0; i < width; ++i)
> > -		job->ptrs[i].batch_addr = batch_addr[i];
> > -
> >  	atomic_inc(&q->job_cnt);
> >  	xe_pm_runtime_get_noresume(job_to_xe(job));
> >  	trace_xe_sched_job_create(job);
> > @@ -246,7 +273,7 @@ bool xe_sched_job_completed(struct xe_sched_job *job)
> >  void xe_sched_job_arm(struct xe_sched_job *job)
> >  {
> >  	struct xe_exec_queue *q = job->q;
> > -	struct dma_fence *fence, *prev;
> > +	struct dma_fence *fence = job->fence, *prev;
> >  	struct xe_vm *vm = q->vm;
> >  	u64 seqno = 0;
> >  	int i;
> > @@ -266,6 +293,9 @@ void xe_sched_job_arm(struct xe_sched_job *job)
> >  		job->ring_ops_flush_tlb = true;
> >  	}
> >  
> > +	if (job->is_pt_job)
> > +		goto arm;
> > +
> 
> I think Sashiko's warning is valid, we should move this ^ one block
> above to skip touching q->tlb_flush_seqno and ring_ops_flush_tlb for
> PT jobs.
> 

Those are completely unused for PT jobs / queues which run PT jobs so
the ordering is harmless but for clarity it would be better. Will
adjust.

Matt 

> Francois
> 
> >  	/* Arm the pre-allocated fences */
> >  	for (i = 0; i < q->width; prev = fence, ++i) {
> >  		struct dma_fence_chain *chain;
> > @@ -286,6 +316,7 @@ void xe_sched_job_arm(struct xe_sched_job *job)
> >  		fence = &chain->base;
> >  	}
> >  
> > +arm:
> >  	job->fence = dma_fence_get(fence);	/* Pairs with put in scheduler */
> >  	drm_sched_job_arm(&job->drm);
> >  }
> > @@ -329,7 +360,7 @@ xe_sched_job_snapshot_capture(struct xe_sched_job *job)
> >  
> >  	snapshot->batch_addr_len = q->width;
> >  	for (i = 0; i < q->width; i++)
> > -		snapshot->batch_addr[i] =
> > +		snapshot->batch_addr[i] = job->is_pt_job ? 0 :
> >  			xe_device_uncanonicalize_addr(xe, job->ptrs[i].batch_addr);
> >  
> >  	return snapshot;
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > index 0490b1247a6e..5e1824c36c74 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > @@ -10,10 +10,29 @@
> >  
> >  #include <drm/gpu_scheduler.h>
> >  
> > -struct xe_exec_queue;
> >  struct dma_fence;
> >  struct dma_fence_chain;
> >  
> > +struct xe_exec_queue;
> > +struct xe_migrate_pt_update_ops;
> > +struct xe_pt_job_ops;
> > +struct xe_tile;
> > +struct xe_vm;
> > +
> > +/**
> > + * struct xe_pt_update_args - PT update arguments
> > + */
> > +struct xe_pt_update_args {
> > +	/** @vm: VM which is being bound */
> > +	struct xe_vm *vm;
> > +	/** @tile: Tile which page tables belong to */
> > +	struct xe_tile *tile;
> > +	/** @ops: Migrate PT update ops */
> > +	const struct xe_migrate_pt_update_ops *ops;
> > +	/** @pt_job_ops: PT job ops state */
> > +	struct xe_pt_job_ops *pt_job_ops;
> > +};
> > +
> >  /**
> >   * struct xe_job_ptrs - Per hw engine instance data
> >   */
> > @@ -71,8 +90,14 @@ struct xe_sched_job {
> >  	bool restore_replay;
> >  	/** @last_replay: last job being replayed */
> >  	bool last_replay;
> > -	/** @ptrs: per instance pointers. */
> > -	struct xe_job_ptrs ptrs[];
> > +	/** @is_pt_job: is a PT job */
> > +	bool is_pt_job;
> > +	union {
> > +		/** @ptrs: per instance pointers. */
> > +		DECLARE_FLEX_ARRAY(struct xe_job_ptrs, ptrs);
> > +		/** @pt_update: PT update arguments */
> > +		DECLARE_FLEX_ARRAY(struct xe_pt_update_args, pt_update);
> > +	};
> >  };
> >  
> >  struct xe_sched_job_snapshot {
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > index 2fe8f89a1e34..d4e9d91f6f7f 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -261,7 +261,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
> >  			   __entry->flags = job->q->flags;
> >  			   __entry->error = job->fence ? job->fence->error : 0;
> >  			   __entry->fence = job->fence;
> > -			   __entry->batch_addr = (u64)job->ptrs[0].batch_addr;
> > +			   __entry->batch_addr = job->is_pt_job ? 0 : (u64)job->ptrs[0].batch_addr;
> >  			   ),
> >  
> >  		    TP_printk("dev=%s, fence=%p, seqno=%u, lrc_seqno=%u, gt=%u, guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x, error=%d",
> > -- 
> > 2.34.1
> > 
