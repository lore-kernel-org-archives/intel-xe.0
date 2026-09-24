Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55E7C98318
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 22:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA4710E0DB;
	Thu, 24 Sep 2026 22:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZdmvIeIi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269F710E0DB
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 22:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790290184; x=1821826184;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=a0PVYC0+VewqpEXghux4t6xhBtRi9rJWSE0iWG54rjo=;
 b=ZdmvIeIi8Cyeyj7LjuFEOoFI0kYvqfmcUi/RZ8YYIHRoSoRUjhEIh9CB
 dLCd4eZeFCh0xBdRQKBHANgMeIPLwHK3bTffnZSuBJHky+vFhkGwTlint
 3/vgro36jTHEsl8Ra5THU0xcA4Fpq8sQ2SMLvMStKOYNKYeal3YVEYV7T
 qQfSEFjVW9YE4Ou12zQ8t7NehIKh8Xwp0Y/NldgTqDsvWl/4wMzYTDL9e
 s28gaiWaSLg+sm+rg98fa7WnPQEygDFlBiR2Lu800yZsXkIlvu0BsJAnC
 thvl76Yr5vmhu7Nj4sO6k98HL2nNheBmLQCxRxbe+RWtkE6ANSGpf8KjK A==;
X-CSE-ConnectionGUID: OowV42XLRpu3JOBIZgfCHw==
X-CSE-MsgGUID: hDGM7lepRfKQOHabI9EgtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="93965381"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="93965381"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 15:49:43 -0700
X-CSE-ConnectionGUID: 2dcK6qNgQHq2zEKAHqv7RQ==
X-CSE-MsgGUID: sWYSTSBHRHOp9hIHbzf3ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="282239224"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 15:49:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 15:49:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 15:49:42 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 15:49:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xnSH9lUhpqyg3nOrbi1Qymtr4D2McoJ7EySPaKcgj8LtN99utotedRIUpPdfgOQ+C+PckqfvmVwwxKKuykngQKhCaMhFdEj4apwxE1QKkhD2+FCHKNzirZs2tKhxPBO+UltDs4hcC6NlDV7vuyB0Lb1ehz3XrIU9g/uSN252ChUDsefew+TEPeyr7rbGtbr0fEbqKjhAQGpumVzAUToqp41HEMMGSbkitRdCcIm57DkbtAQ6ctwW26y05F7SxUJLbmmxAzw6CXWQ24WklPeOifhb5PjGE2JIPdJabO4CMmkpRhJzTEycSxs6CbY3seVCV8xDwDUPmAOxlghJgY6dpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SONAw/4Jwiep7dMXbL804PzGcjFMNj5HHT83y2xBk4=;
 b=WJIw19vRZuosNFOLWMz20eBkUw6mBxAsbwBzY/1O347RoW/8pStfNUCqx7EoOndls+KJ0oMXgTxGsm7EAqxaSf790kCwExhosQA1Glu6jlsFRXwEe0Nn69UkCSGE50RtQwooplZfOOG2F0C+WQR4xjk6hlfCAS9eF9Cug5VWh6lzFaZ7NM1+bHrsn78zyX/t1deVxMtDP2e/SDj0zvl2excKaASSaO4Ib5pMDMjRugTy8Y+cRXTNA3agdLi8wlinbgrXYN38QwTtvO4cxQOdQ9QvnatkP3iqFlk/kznV80YoP/yD/PsKBiU7+hXLOzR0cWOX2semstcqdd3Wiu6b4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by IA1PR11MB7680.namprd11.prod.outlook.com (2603:10b6:208:3fb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 22:48:16 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 22:48:16 +0000
Date: Thu, 24 Sep 2026 15:48:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 13/24] drm/xe: Enable CPU binds for jobs
Message-ID: <arWorYdVpHkzyXZM@gsse-cloud1.jf.intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-14-matthew.brost@intel.com>
 <4dd6e6c1-5177-43e9-8ead-9390f545e4ad@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4dd6e6c1-5177-43e9-8ead-9390f545e4ad@intel.com>
X-ClientProxiedBy: BY3PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::13) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|IA1PR11MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aae7640-d54d-45ef-eb5c-08df1a8debe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|56012099006|6133799003|3023799007|22082099003|4143699003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 4IxijbYzT1F5ko+/ZfRv/OCFqvIX8dk1/CUpTWxnU/HDF02b/7j5x4hwUl9ZWFJy6JOcGH9ALn43QVnuW8IOIV2ql+3INmKi470uVOtkqONezV9S8TrLy/wSFJYW3RrYXZ9REQ0gVvwA6vFBoXkOqMf69XB4qNvmk3Uw+XN156vmXTGBrFD2U/lW+n3f/OyXloVon7D2mNhq0UC1WaqWLshvpLcPMIcQfKPL9U86GXtrkkiboc3QWp04RzTX6py+Bfn+f/vuSsI5BwZTUkqgofv8xYnU9L5D8K5Z1f87UFkONi+PWHx71lp2ruRY+aIJI1c9IfhFwMCZOKPWyn+S/8T9l0Yxlr7QMGMz22O18iODnKXOgLigMDaglkofgGbH6FQ40GMOefyKMRiGcTT2asNG0VN+XznPtLdLfcefNR4FWGS0GPuUok4huhKE5bEAkPY5LuBQIC+qhiuSLTqZSEEahZwmVou9Tn4VwEJ9VjVj6tl4l9J2gatMxopRoU6vErEHb8BPiH8gIpcNZRGhd01h1P8MuiiVm9PrzcIjm9xJUJtznzN3MgQWMl/HTjDVdb9zg88FEhLknZNrq7ZE3hS7vL2aYYo5Mpvr+b+msK4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(56012099006)(6133799003)(3023799007)(22082099003)(4143699003)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1gxaExPL3pydWxVZGx0WnY1M3Z4ZGhuVHZhTkRaa2Izc0tkUG51enZLRUM1?=
 =?utf-8?B?NzlUZEZxdmdYTWZmTGwrMXdrbGp5Nm9FUU81TjZvZWsvSTQwMERSTDlaMG5O?=
 =?utf-8?B?ZnJ1WFRFOW1KMDcvL1JlSmMwMGtLQ0xTeFNTMlJZVm4wOVBwUlUybXJwNTNP?=
 =?utf-8?B?NmdYOVN2WElobEVsamV3aWlaY0FvdENrQTRUUE5MMzEzN2xINXBJUGFSekRq?=
 =?utf-8?B?TUtpTFpRM3J3aGxMVGJRUTc3eE0ybkV5MW5Ma1QxeEIvc0pLeFp3Ukw5eTFk?=
 =?utf-8?B?SEs1bFF0eUoyUDlMaWVVdFA1VEd6Q2Rtbk9scGVjcTJKM2tzRFMzc1hlWC9B?=
 =?utf-8?B?UzI3UzBUNjRraDhETHhrckNlWUlJc3RUT3NJWGw2L0lSdHJ1SUVkSEtaaGk0?=
 =?utf-8?B?V2Q4MHZjTjFUUExHL0xRL1dVN3ViRzN6WjRLRnpMOEhCVERXL0FzTUZUV0ov?=
 =?utf-8?B?OW0rdUxONnNoWW5UcW0yRWU1Y1B0QkxMbUZLYlpqakM0a3l1MVl3VVQzUW9q?=
 =?utf-8?B?QmJ5VjhRQ3RKZXlWTjMwZFJraVpYOXV1UEdjRDM5YmRISzVYMU5US3FMcmJw?=
 =?utf-8?B?STZWMytPY2x6bXdqSi9WUkFyQlprSG1uRCtBVkI3eEtaanIwdUd2djBKNWts?=
 =?utf-8?B?QVNPSTQyZGRYQysrTmJuWXp6NmtKTVBNbk5ZSm51QnhpMFZob2lDVVlzRGpi?=
 =?utf-8?B?dTZlTTdEZmtsYUF0ZFR4ZEpnUUg1YWZwK1Q1U3hTQlFKdHhSL1JtRExVSHRl?=
 =?utf-8?B?ZEt5YVowdmRmL2tRemlyR1FuZW1wRXNhV2NjS1Fkbzg1aTJacFVPWTZBYnAv?=
 =?utf-8?B?YlNvdXNrNGdiSWwyUlNaNWxwaTc2dkZpZ3Y5WHlZV01PUHhJMVVWV1B2d3lk?=
 =?utf-8?B?VDgyc0hyNVZXcDl2VXM5bkpycjdvSStPb2UwbDlYVjJjRjAyK1h0Z3Y2bVNa?=
 =?utf-8?B?MnRUV2ZLUjNFVlc0Z01ORjA1MGpDOXJ6Zy9BdzhFcW5HVW05WFYxd2pzRzRi?=
 =?utf-8?B?c1RBQ09LYkNQWjJjSDhDRUJaWThFWm83UzlYS2JxVElIL0ZNUDhhRnBFUDE2?=
 =?utf-8?B?ZG1saytWd3daczVqWXBod0JzdVAyZUlzOVpOdVRUWTRXaG05NFlyZFM5cmFr?=
 =?utf-8?B?SW9kUXlGRUV2NkhuODJmb0pkdS9aTytHbmtlUDFwdFJsemFBSzBOaDFMdkJx?=
 =?utf-8?B?L0NWbTZKaVlLNWZFU1A2QlJNelhDc3JhME1PczIwRkhTbTJVV2FwdHZYMVVJ?=
 =?utf-8?B?SXdoQktNc0hXLytRNmlzd3ZCNDNvOHhiYmtVb1A2RnNNTk5YaE5wZHJPK2kx?=
 =?utf-8?B?V1QyMjdMMjZaVjZBUFRWTlRxdWcvYXpuc1NSbVlkVWFQVjJUS1JsbjBLM2Y2?=
 =?utf-8?B?cTBPWlJnZndWeDRITi9ieWY4SXIwYkkxNTNXcXhEK0N2N1V5U3BPWmp3Mk1J?=
 =?utf-8?B?QytyWlJYNmRVQ1RZaXJ2RWkvL2Zobk8yby9yYTk0RTM2S0pBY1dRQzFMRkhS?=
 =?utf-8?B?OXROVXF0SW5yVUdrTDBVQ0FBNmlVTXh5ZWRON3lPWnhCQjdtS3BhOWlUMFd3?=
 =?utf-8?B?SUtCMWgvTlN1c2pmcURzRzh5cXVadW0vOEZvTTRmQ1o4cFZORTZxVWJ4M0sx?=
 =?utf-8?B?UkNScXhXK3BGYUppSUxkeFBCUkV3bmRWYnZuTkMveDArU213eFlvWWtKRUk2?=
 =?utf-8?B?elp6MVVQNWxUdDFzYTBBT3V4ZXBTQUE1OFByT2t1c2lCbENvR3pQQXB1MStt?=
 =?utf-8?B?SjdneXFIQTB1aWdBblhHY2JhcC8zbzhTLzFwU0lyTUxoa1FFV1BtOXdZTHJB?=
 =?utf-8?B?K295c3Z2eUhkTTFhekQ3WTJUdFlVVWdUR0VkenVOY3Zob2dHMGxIVW1ZQ3pI?=
 =?utf-8?B?Q3lzRlcvZDRsdDJQMGhkV3MwZDB4Wll0VjVtU2ZjTUZ1dW00d1p3TW5xb3Jp?=
 =?utf-8?B?bFIxekFvV3FJZ1BMbExTMW5DcFpQcER4N3dncndEK0VtemNGcXFES2hWTnBE?=
 =?utf-8?B?bFI0YWhHYStzek9YWXphRVZOZzltbmUrakJIUmdoWHVjNnJhRmhaeHROa01h?=
 =?utf-8?B?b2pzdFhuNWFJbmpFV1AxYnUrd2lZTytPcTRqa3hRRDA1bTRhajRBWVNYNkJn?=
 =?utf-8?B?bkMvRUh0V0hNZ0tXRzlMRjVRd0dQYWUzS0dPZHoxampGMzFGNE5MakN0dVRz?=
 =?utf-8?B?MnVhaERqbkRuUlh5MjIvT3RQMnNtN1hQcUUzR09MZVowKzlnMUVENHZoT0Np?=
 =?utf-8?B?bXFLOXpmMThhMzlBeVdsZC9SNHdjd2VMeHpyUG03MVhyNmFXaEZnTmxHQjFO?=
 =?utf-8?B?TlRIRGVrWnR4L3hCcDBaYnl0VWtyVSs2b1Y4c1BwbnpxelBtaTdCUT09?=
X-Exchange-RoutingPolicyChecked: fw5LZJRnEOo+lsGdv3grS/N41Jifu/jPIkMRet7GRnFbX4flOMg09Qa4ekXomzDf3jJBtu4CfZkHdEVwEQ5il4mK6vgW/DW8OJwk4X0nMT4hlJxxqP31Xvt4EsAdmkvJ8sbO7RitmrInBcUaKj/Fl2O8Az77uIMu2Ops+afWaJDvjbqX4yEzqqDgSnTi7wK0rbyifIppe5xCoNqOXUk7bN53rnFvKj9WwXcqXNKLBWiujqvBh5RfA7/JvyzXVKm5Ds/LlJ7Jy5bu4Jez053CjzznNPMk440byxtCYp1KLuaGVXf5vgMC0x1/jBK6jA07lsVE9ExkQE7sWTb4d0w8jQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aae7640-d54d-45ef-eb5c-08df1a8debe4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 22:48:16.2309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TD/Ssi3wGLYmdrLzwaag/Fb+/zwBZ+xXU/ctC0Zv4Y3DCBoA7ZbCx8WzDlddAsQifbdBwvyNDzzi0/81AG3Ymw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7680
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

On Mon, Sep 21, 2026 at 07:11:17PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 05-09-2026 02:46, Matthew Brost wrote:
> > No reason to use the GPU for binds.
> > 
> > Benefits of CPU-based binds:
> > - Lower latency once dependencies are resolved, as there is no
> >    interaction with the GuC or a hardware context switch both of which
> >    are relatively slow.
> > - Large arrays of binds do not risk running out of migration PTEs,
> >    avoiding -ENOBUFS being returned to userspace.
> > - Kernel binds are decoupled from the migration exec queue (which issues
> >    copies and clears), so they cannot get stuck behind unrelated
> >    jobs—this can be a problem with parallel GPU faults.
> > - Paves the for path decouping binds from tiles and individual engines
> > - Enables ULLS on the migration exec queue, as this queue has exclusive
> >    access to the paging copy engine.
> > 
> > Update migration layer to formulate a PT job which will issue CPU bind
> > in the submission backend.
> > 
> > All code related to GPU-based binding has been removed.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Link: https://patch.msgid.link/20260228013501.106680-14-matthew.brost@intel.com
> > Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> > ---
> >   drivers/gpu/drm/xe/xe_bo_types.h |   2 -
> >   drivers/gpu/drm/xe/xe_migrate.c  | 249 +++----------------------------
> >   drivers/gpu/drm/xe/xe_pt.c       |   1 -
> >   3 files changed, 17 insertions(+), 235 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> > index 0eb93052c1d5..8ec4a01a0092 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > @@ -90,8 +90,6 @@ struct xe_bo {
> >   	/** @freed: List node for delayed put. */
> >   	struct llist_node freed;
> > -	/** @update_index: Update index if PT BO */
> > -	int update_index;
> >   	/** @created: Whether the bo has passed initial creation */
> >   	bool created;
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index ba8e195afcc8..e5c46e0fa960 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -77,18 +77,12 @@ struct xe_migrate {
> >   	 * Protected by @job_mutex.
> >   	 */
> >   	struct dma_fence *fence;
> > -	/**
> > -	 * @vm_update_sa: For integrated, used to suballocate page-tables
> > -	 * out of the pt_bo.
> > -	 */
> > -	struct drm_suballoc_manager vm_update_sa;
> >   	/** @min_chunk_size: For dgfx, Minimum chunk size */
> >   	u64 min_chunk_size;
> >   };
> >   #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
> >   #define MAX_CCS_LIMITED_TRANSFER SZ_4M /* XE_PAGE_SIZE * (FIELD_MAX(XE2_CCS_SIZE_MASK) + 1) */
> > -#define NUM_KERNEL_PDE 15
> >   #define NUM_PT_SLOTS 48
> >   #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M
> >   #define MAX_NUM_PTE 512
> > @@ -113,7 +107,6 @@ static void xe_migrate_fini(void *arg)
> >   	dma_fence_put(m->fence);
> >   	xe_bo_put(m->pt_bo);
> > -	drm_suballoc_manager_fini(&m->vm_update_sa);
> >   	mutex_destroy(&m->job_mutex);
> >   	xe_vm_close_and_put(m->q->vm);
> >   	xe_exec_queue_put(m->q);
> > @@ -234,8 +227,6 @@ static int xe_migrate_pt_bo_alloc(struct xe_tile *tile, struct xe_migrate *m,
> >   	BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE);
> >   	/* Must be a multiple of 64K to support all platforms */
> >   	BUILD_BUG_ON(NUM_PT_SLOTS * XE_PAGE_SIZE % SZ_64K);
> > -	/* And one slot reserved for the 4KiB page table updates */
> > -	BUILD_BUG_ON(!(NUM_KERNEL_PDE & 1));
> >   	/* Need to be sure everything fits in the first PT, or create more */
> >   	xe_tile_assert(tile, m->batch_base_ofs + xe_bo_size(batch) < SZ_2M);
> > @@ -391,17 +382,9 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> >   		}
> >   	}
> > -	if (ofs)
> > -		*ofs = map_ofs;
> > -}
> > -
> > -static void xe_migrate_suballoc_manager_init(struct xe_migrate *m, u32 map_ofs)
> > -{
> >   	/*
> >   	 * Example layout created above, with root level = 3:
> >   	 * [PT0...PT7]: kernel PT's for copy/clear; 64 or 4KiB PTE's
> > -	 * [PT8]: Kernel PT for VM_BIND, 4 KiB PTE's
> > -	 * [PT9...PT40]: Userspace PT's for VM_BIND, 4 KiB PTE's
> >   	 * [PT41 = PDE 0] [PT44...PT47 = 4K and 2M vram identity maps]
> >   	 *
> >   	 * This makes the lowest part of the VM point to the pagetables.
> > @@ -409,19 +392,13 @@ static void xe_migrate_suballoc_manager_init(struct xe_migrate *m, u32 map_ofs)
> >   	 * and flushes, other parts of the VM can be used either for copying and
> >   	 * clearing.
> >   	 *
> > -	 * For performance, the kernel reserves PDE's, so about 20 are left
> > -	 * for async VM updates.
> > -	 *
> >   	 * To make it easier to work, each scratch PT is put in slot (1 + PT #)
> >   	 * everywhere, this allows lockless updates to scratch pages by using
> >   	 * the different addresses in VM.
> >   	 */
> > -#define NUM_VMUSA_UNIT_PER_PAGE	32
> > -#define VM_SA_UPDATE_UNIT_SIZE		(XE_PAGE_SIZE / NUM_VMUSA_UNIT_PER_PAGE)
> > -#define NUM_VMUSA_WRITES_PER_UNIT	(VM_SA_UPDATE_UNIT_SIZE / sizeof(u64))
> > -	drm_suballoc_manager_init(&m->vm_update_sa,
> > -				  (size_t)(map_ofs / XE_PAGE_SIZE - NUM_KERNEL_PDE) *
> > -				  NUM_VMUSA_UNIT_PER_PAGE, 0);
> > +
> > +	if (ofs)
> > +		*ofs = map_ofs;
> >   }
> >   static bool xe_migrate_needs_ccs_emit(struct xe_device *xe)
> > @@ -466,7 +443,6 @@ static int xe_migrate_lock_prepare_vm(struct xe_tile *tile, struct xe_migrate *m
> >   			return err;
> >   		xe_migrate_prepare_vm(tile, m, vm, &map_ofs);
> > -		xe_migrate_suballoc_manager_init(m, map_ofs);
> >   		drm_exec_retry_on_contention(&exec);
> >   		xe_validation_retry_on_oom(&ctx, &err);
> >   	}
> > @@ -1169,6 +1145,9 @@ struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate)
> >   	return migrate->q->lrc[0];
> >   }
> > +/* XXX: With CPU binds this can be removed in a follow up */
> > +#define NUM_KERNEL_PDE 15
> > +
> >   static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
> >   {
> >   	/*
> > @@ -1788,56 +1767,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> >   	return fence;
> >   }
> > -static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
> > -			  const struct xe_vm_pgtable_update_op *pt_op,
> > -			  const struct xe_vm_pgtable_update *update,
> > -			  struct xe_migrate_pt_update *pt_update)
> > -{
> > -	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
> > -	struct xe_vm *vm = pt_update->vops->vm;
> > -	u32 chunk;
> > -	u32 ofs = update->ofs, size = update->qwords;
> > -
> > -	/*
> > -	 * If we have 512 entries (max), we would populate it ourselves,
> > -	 * and update the PDE above it to the new pointer.
> > -	 * The only time this can only happen if we have to update the top
> > -	 * PDE. This requires a BO that is almost vm->size big.
> > -	 *
> > -	 * This shouldn't be possible in practice.. might change when 16K
> > -	 * pages are used. Hence the assert.
> > -	 */
> > -	xe_tile_assert(tile, update->qwords < MAX_NUM_PTE);
> > -	if (!ppgtt_ofs)
> > -		ppgtt_ofs = xe_migrate_vram_ofs(tile_to_xe(tile),
> > -						xe_bo_addr(update->pt_bo, 0,
> > -							   XE_PAGE_SIZE), false);
> > -
> > -	do {
> > -		u64 addr = ppgtt_ofs + ofs * 8;
> > -
> > -		chunk = min(size, MAX_PTE_PER_SDI);
> > -
> > -		/* Ensure populatefn can do memset64 by aligning bb->cs */
> > -		if (!(bb->len & 1))
> > -			bb->cs[bb->len++] = MI_NOOP;
> > -
> > -		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
> > -		bb->cs[bb->len++] = lower_32_bits(addr);
> > -		bb->cs[bb->len++] = upper_32_bits(addr);
> > -		if (pt_op->bind)
> > -			ops->populate(tile, NULL, bb->cs + bb->len,
> > -				      ofs, chunk, update);
> > -		else
> > -			ops->clear(vm, tile, NULL, bb->cs + bb->len,
> > -				   ofs, chunk, update);
> > -
> > -		bb->len += chunk * 2;
> > -		ofs += chunk;
> > -		size -= chunk;
> > -	} while (size);
> > -}
> > -
> >   struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m)
> >   {
> >   	return xe_vm_get(m->q->vm);
> > @@ -1938,162 +1867,18 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
> >   {
> >   	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
> >   	struct xe_tile *tile = m->tile;
> > -	struct xe_gt *gt = tile->primary_gt;
> > -	struct xe_device *xe = tile_to_xe(tile);
> >   	struct xe_sched_job *job;
> >   	struct dma_fence *fence;
> > -	struct drm_suballoc *sa_bo = NULL;
> > -	struct xe_bb *bb;
> > -	u32 i, j, batch_size = 0, ppgtt_ofs, update_idx, page_ofs = 0;
> > -	u32 num_updates = 0, current_update = 0;
> > -	u64 addr;
> > -	int err = 0;
> >   	bool is_migrate = is_migrate_queue(m, pt_update_ops->q);
> > -	bool usm = is_migrate && xe->info.has_usm;
> > -
> > -	for (i = 0; i < pt_update_ops->num_ops; ++i) {
> > -		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->pt_job_ops->ops[i];
> > -		struct xe_vm_pgtable_update *updates = pt_op->entries;
> > -
> > -		num_updates += pt_op->num_entries;
> > -		for (j = 0; j < pt_op->num_entries; ++j) {
> > -			u32 num_cmds = DIV_ROUND_UP(updates[j].qwords,
> > -						    MAX_PTE_PER_SDI);
> > -
> > -			/* align noop + MI_STORE_DATA_IMM cmd prefix */
> > -			batch_size += 4 * num_cmds + updates[j].qwords * 2;
> > -		}
> > -	}
> > -
> > -	/* fixed + PTE entries */
> > -	if (IS_DGFX(xe))
> > -		batch_size += 2;
> > -	else
> > -		batch_size += 6 * (num_updates / MAX_PTE_PER_SDI + 1) +
> > -			num_updates * 2;
> > -
> > -	bb = xe_bb_new(gt, batch_size, usm);
> > -	if (IS_ERR(bb))
> > -		return ERR_CAST(bb);
> > -
> > -	/* For sysmem PTE's, need to map them in our hole.. */
> > -	if (!IS_DGFX(xe)) {
> > -		u16 pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
> > -		u32 ptes, ofs;
> > -
> > -		ppgtt_ofs = NUM_KERNEL_PDE - 1;
> > -		if (!is_migrate) {
> > -			u32 num_units = DIV_ROUND_UP(num_updates,
> > -						     NUM_VMUSA_WRITES_PER_UNIT);
> > -
> > -			if (num_units > m->vm_update_sa.size) {
> > -				err = -ENOBUFS;
> > -				goto err_bb;
> > -			}
> > -			sa_bo = drm_suballoc_new(&m->vm_update_sa, num_units,
> > -						 GFP_KERNEL, true, 0);
> > -			if (IS_ERR(sa_bo)) {
> > -				err = PTR_ERR(sa_bo);
> > -				goto err_bb;
> > -			}
> > -
> > -			ppgtt_ofs = NUM_KERNEL_PDE +
> > -				(drm_suballoc_soffset(sa_bo) /
> > -				 NUM_VMUSA_UNIT_PER_PAGE);
> > -			page_ofs = (drm_suballoc_soffset(sa_bo) %
> > -				    NUM_VMUSA_UNIT_PER_PAGE) *
> > -				VM_SA_UPDATE_UNIT_SIZE;
> > -		}
> > -
> > -		/* Map our PT's to gtt */
> > -		i = 0;
> > -		j = 0;
> > -		ptes = num_updates;
> > -		ofs = ppgtt_ofs * XE_PAGE_SIZE + page_ofs;
> > -		while (ptes) {
> > -			u32 chunk = min(MAX_PTE_PER_SDI, ptes);
> > -			u32 idx = 0;
> > -
> > -			bb->cs[bb->len++] = MI_STORE_DATA_IMM |
> > -				MI_SDI_NUM_QW(chunk);
> > -			bb->cs[bb->len++] = ofs;
> > -			bb->cs[bb->len++] = 0; /* upper_32_bits */
> > -
> > -			for (; i < pt_update_ops->num_ops; ++i) {
> > -				struct xe_vm_pgtable_update_op *pt_op =
> > -					&pt_update_ops->pt_job_ops->ops[i];
> > -				struct xe_vm_pgtable_update *updates = pt_op->entries;
> > -
> > -				for (; j < pt_op->num_entries; ++j, ++current_update, ++idx) {
> > -					struct xe_vm *vm = pt_update->vops->vm;
> > -					struct xe_bo *pt_bo = updates[j].pt_bo;
> > -
> > -					if (idx == chunk)
> > -						goto next_cmd;
> > -
> > -					xe_tile_assert(tile, xe_bo_size(pt_bo) == SZ_4K);
> > -
> > -					/* Map a PT at most once */
> > -					if (pt_bo->update_index < 0)
> > -						pt_bo->update_index = current_update;
> > -
> > -					addr = vm->pt_ops->pte_encode_bo(pt_bo, 0,
> > -									 pat_index, 0);
> > -					bb->cs[bb->len++] = lower_32_bits(addr);
> > -					bb->cs[bb->len++] = upper_32_bits(addr);
> > -				}
> > -
> > -				j = 0;
> > -			}
> > -
> > -next_cmd:
> > -			ptes -= chunk;
> > -			ofs += chunk * sizeof(u64);
> > -		}
> > -
> > -		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> > -		update_idx = bb->len;
> > -
> > -		addr = xe_migrate_vm_addr(ppgtt_ofs, 0) +
> > -			(page_ofs / sizeof(u64)) * XE_PAGE_SIZE;
> > -		for (i = 0; i < pt_update_ops->num_ops; ++i) {
> > -			struct xe_vm_pgtable_update_op *pt_op =
> > -				&pt_update_ops->pt_job_ops->ops[i];
> > -			struct xe_vm_pgtable_update *updates = pt_op->entries;
> > -
> > -			for (j = 0; j < pt_op->num_entries; ++j) {
> > -				struct xe_bo *pt_bo = updates[j].pt_bo;
> > -
> > -				write_pgtable(tile, bb, addr +
> > -					      pt_bo->update_index * XE_PAGE_SIZE,
> > -					      pt_op, &updates[j], pt_update);
> > -			}
> > -		}
> > -	} else {
> > -		/* phys pages, no preamble required */
> > -		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> > -		update_idx = bb->len;
> > -
> > -		for (i = 0; i < pt_update_ops->num_ops; ++i) {
> > -			struct xe_vm_pgtable_update_op *pt_op =
> > -				&pt_update_ops->pt_job_ops->ops[i];
> > -			struct xe_vm_pgtable_update *updates = pt_op->entries;
> > -
> > -			for (j = 0; j < pt_op->num_entries; ++j)
> > -				write_pgtable(tile, bb, 0, pt_op, &updates[j],
> > -					      pt_update);
> > -		}
> > -	}
> > +	int err;
> > -	job = xe_bb_create_migration_job(pt_update_ops->q, bb,
> > -					 xe_migrate_batch_base(m, usm),
> > -					 update_idx);
> > +	job = xe_sched_job_create(pt_update_ops->q, NULL);
> >   	if (IS_ERR(job)) {
> >   		err = PTR_ERR(job);
> > -		goto err_sa;
> > +		goto err_out;
> >   	}
> > -	xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
> > +	xe_tile_assert(tile, job->is_pt_job);
> >   	if (ops->pre_commit) {
> >   		pt_update->job = job;
> > @@ -2104,6 +1889,12 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
> >   	if (is_migrate)
> >   		mutex_lock(&m->job_mutex);
> > +	job->pt_update[0].vm = pt_update->vops->vm;
> > +	job->pt_update[0].tile = tile;
> > +	job->pt_update[0].ops = ops;
> > +	job->pt_update[0].pt_job_ops =
> > +		xe_pt_job_ops_get(pt_update_ops->pt_job_ops);
> > +
> >   	xe_sched_job_arm(job);
> >   	fence = dma_fence_get(&job->drm.s_fence->finished);
> >   	xe_sched_job_push(job);
> > @@ -2111,17 +1902,11 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
> >   	if (is_migrate)
> >   		mutex_unlock(&m->job_mutex);
> > -	xe_bb_free(bb, fence);
> > -	drm_suballoc_free(sa_bo, fence);
> > -
> >   	return fence;
> >   err_job:
> >   	xe_sched_job_put(job);
> > -err_sa:
> > -	drm_suballoc_free(sa_bo, NULL);
> > -err_bb:
> > -	xe_bb_free(bb, NULL);
> > +err_out:
> >   	return ERR_PTR(err);
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 16126ffc2ec1..24190ba4f533 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -387,7 +387,6 @@ xe_pt_new_shared(struct xe_walk_update *wupd, struct xe_pt *parent,
> >   	entry->pt = parent;
> >   	entry->flags = 0;
> >   	entry->qwords = 0;
> > -	entry->pt_bo->update_index = -1;
> 
> Patch LGTM
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> Sashiko's comment regarding "Memory leak of `xe_pt_job_ops` and `job->fence"
> needs to be handled in
> https://patchwork.freedesktop.org/patch/751036/?series=149888&rev=8

No, once we call _arm(), run_job() is always called. Sashiko doesn't
seem to understand this - it probably because the scheduler doesn't make
this guarnetee but Xe usage of the scheduler ensure this.

Matt

> 
> 
> >   	entry->level = parent->level;
> >   	if (alloc_entries) {
> 
