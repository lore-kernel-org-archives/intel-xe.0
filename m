Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03BBD21699
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 13:00:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EB610E0B1;
	Tue, 15 Oct 2024 13:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ahDy08Uq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835FD10E0B1
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 12:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728997200; x=1760533200;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I9ndhLcMOryio5s7cbXO6OE4YG500PdPvliWYxdnioM=;
 b=ahDy08UqzzRhy7RHxP1OTN4PBmAJPSOQYzu6f4pB6sgRglPfxeNMEjO6
 4gwOvA73xrVQCa12AsSgi/4wEzxYmUbKcQqMPGX3VqcrKbh9QRx6xggrQ
 LPHR4aMWgnjLXaYC3ll9JPtmd20VvCIvK9VzQd/K96LLuWOpOzzcnGjcG
 vgplP6w/pk6HaMOntZCLrE/Um78jrcNoT0kPwolpV3Ch8egdBWLbJbZS8
 X3FHGawJgSWSHLIFrIzmNyLUJAfjPrpX7iFSId69k2crqCuXCmZm6QSeZ
 kLQfMMGJ2+XsaicEHKI1M/iowqJO6uMsWrbmw5tlFFlLNIfSZKQQSbbXj w==;
X-CSE-ConnectionGUID: gaqDivibRJufZSY3Z+yxCA==
X-CSE-MsgGUID: 39z9gtJBTSSxLGEL5r8tQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="31262977"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="31262977"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 05:59:59 -0700
X-CSE-ConnectionGUID: bKw2XvFbSfm/0ed8LKMrUg==
X-CSE-MsgGUID: IOH/LqqdTQazobFOl4fMZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="82537085"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2024 05:59:59 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 05:59:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 05:59:57 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 05:59:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwTi60lPfkmkGCJG33DVaUB/XlQXwxMHDKflDE8CgQFUL7Q43VqoZpDe4/xEpZzD5f47rKvbtnf0A4vziQwHwo7roW9YvUndQ6nwPYwOPrUTAGRfo6aK6bYaE9lt40kxPpTKYteCgYRllGosqrMgyaMLH2mEXiD7VFNbUPd8ao/9FfXJ8SNVdvEOao7eouas+Xxzo5Ai44qE/Dvnl1NBfJZm+xFwLlzmzRAfRo/SfKUx91kXwVAELt8q1X6GBKKWGgmgNSxDb/NiP7voCwXq+opxLRUYXGBM/aVPPOI73+cslVCg3o9uDGL8qwi/RAFPiUXxTf9VJAEn9RbVDKePNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQtbB2jp4BDVoKFEuJG+/FCQgIdmhhEcUmnIHwJ4zBs=;
 b=p/fWq30+5qZN2l7pPMq46e6RQWTd7R/EX53zlo9b5ZQLagvBBy0bNW4W7b21keOFSopDFVSaCEDWtg/OgYVgWiDoJcY5nacTbRw50uwbHahRE9Z+GpX42u/WjCMhuN447RUI6rrFDh2cKW3fu9mcuhyu9POPhhrmKoF2URJvxDYi38Ym1T5BKg8hx+pvqwc5KeBEpNXM5WYYCgYAzfIQRMUOgfDx3HYNPq7UqE4scLM9IUZuX5/fqEHGOeQ/bUPZpZPcUydoDhtb26rhfi8kY654AyXKSxNcR2o9Im4k8DLKhgQ+URdTKSr6sBJN5Q9JAXvmFRvJOSa4SZEEfKoTdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 PH7PR11MB6607.namprd11.prod.outlook.com (2603:10b6:510:1b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Tue, 15 Oct
 2024 12:59:55 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.8069.016; Tue, 15 Oct 2024
 12:59:55 +0000
Message-ID: <916aeed1-e9ae-49ba-aa43-2b38e431e9d7@intel.com>
Date: Tue, 15 Oct 2024 14:59:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/ufence: Warn if mmget_not_zero() fails
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Francois Dugast
 <francois.dugast@intel.com>
References: <20241015090546.3082719-1-nirmoy.das@intel.com>
 <20241015090546.3082719-3-nirmoy.das@intel.com>
 <2c1943fd-3a21-44da-a771-162f3ff160f2@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <2c1943fd-3a21-44da-a771-162f3ff160f2@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0023.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::12) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|PH7PR11MB6607:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b741377-9a43-4abf-69e4-08dced1943f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K24yaXliWnBycmZZbWUrV21Objd5TlBad0VrU1ljMng2TTd1RjFpL3NNd1BT?=
 =?utf-8?B?R0tXSUJ6K0o2TElFWEZzclJ6bG1xZDUrT0F3ZDliVCt6NWZiK3hDZmg4ZE9V?=
 =?utf-8?B?eE0yRDExZVgvTDZDeVlIZXRwdjBidjdlYmxnWVlKK2c4NEJmSjRRZlZ2LzRp?=
 =?utf-8?B?MWVzQ0J6NmZGVVNNSkRYbGJkR0ZhWmtmdHgwV0VQbElRRllXSzZHRlY1UGdt?=
 =?utf-8?B?a3QvMDJ5akJCeFdsQ2ZRdVJodzUvQllhRW9DeHJjZmNXTG1oSVJXTHNFZ29y?=
 =?utf-8?B?NFA2Nm15VE1zdytURWI1Z2Q0WElXYUNlZWZCdFdIUGl2OEJNVTJ2Q0FBbGpI?=
 =?utf-8?B?dEcxRE1uWVp5ZnFmVnIvaWtuYzFEZEVzQklrMXVoRzQ2MzhETklPTVhiM2lC?=
 =?utf-8?B?aXJtaWhxLzE1dXcyeThEZEtPWWJ1VmdiTEt4cklaenRMSlpyOVdLRDJ6WVpB?=
 =?utf-8?B?bTRwTVZzWDJqM3pIRTh1YzhTakJqdVhJM213ZzJ2L3p3NUU3TXZnN1JzVHdM?=
 =?utf-8?B?ajZRa3VnbkRpdjNuSmpiRkJjQzNORFFhVXdnSHpoZjgwT3pCNy95Wk0xUURa?=
 =?utf-8?B?VlorTzJiMDlNWmxpd3NWODRnT1NtWmw5bEZKaVlHRTNEbnpIMS9RZS9vRERj?=
 =?utf-8?B?ZzRmRHNrRWFGL0dVM05ud3pCZHhsaDBUbzVYc242a1pjOFZUWUlNU3Z3cEJt?=
 =?utf-8?B?cUhweGFuNDJ3TTd4RzFxSnJmSEJBUkoweWxhUC9NUUtlbUwrSUpWMkFhR244?=
 =?utf-8?B?Zk1najJLSWhjd3g0MU55R25NakoyQ3VjU2czVlpLL094UkhTemVWL1NPOFpu?=
 =?utf-8?B?MUN5V1RldjlKNEhQSXh1L1pVR29MemdVeXJGNVdiclcwMGk5K0dJeHBkM2hn?=
 =?utf-8?B?WnpEU2FLZ2ZJaFlES2FYejJiL1ZGUDY4dmpmb3VkWkh5c1RrVU1HN0Z5cjVR?=
 =?utf-8?B?NHBDVkRKS2o2TkhTUlJZd0EvVjhkTjl5alR1amdUZTErc0YrT05OdTM0VXly?=
 =?utf-8?B?WTUvTWx1UTM2Q3ZUV1lDK2lxTXRCYlR4aG9jcEJXR2NEaVQyQUtIUmxIWnAy?=
 =?utf-8?B?dFR3TjBRWmlWSFc5MnVTd0JiZVNtM3MrOURNbVA0Sm4rcjl2OG02REZKOE1J?=
 =?utf-8?B?OVNML3lXaUx5eWVBMG05UHJwODM3akYvTzA0Nm81K2NVSFFTWlQza3JYWlpF?=
 =?utf-8?B?cnRPNzFnOEtGNE9IaktQdXM1bXQ0RktGWCtlZyt0NzdPTkh2S1RkelJzZlpY?=
 =?utf-8?B?MUxQMHNnazc5VG5rTkpIR3UrN2V1TjBwSnVEUGlTV1BjNXhqQXgxaGJERXdy?=
 =?utf-8?B?RWRGZWk2eFpVZStyK0JBaXZoSG9OT1lTU3FMSGlSbDdFRHZXWnltQU1OelVr?=
 =?utf-8?B?NEowYVdJazdXRzFhdGdtdHVxMjN1UDlLeHRUQnpoWjZGR0dITEFleFhscHpx?=
 =?utf-8?B?OWx4R3k2Tm85THVKdTI2ZnNVeXBrK0JPWEF5cWZTOWc3QzRqNm0vQURvTitL?=
 =?utf-8?B?OGcwKzFkdmJJaTFReVFLbVdpaHd6VjM4dG4yUFo5Vm8wKzhpRG5JRHdmQ1lI?=
 =?utf-8?B?Umo1UzVRL3RIamlOTzg3MnBCMDZ4a3dxSWlJQ2h3bkNrMVF2ZEFtOEdFcGN3?=
 =?utf-8?Q?j5bYrI/tXhZ73c3n9JnOuar/TC7uB5Z0XkXR5fKqE+RA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c01CZG5wcStuQUt4WDBQNmtXQ0VLZk03Wm1vdG1EV2xuWHZLcG4ycXhNWi9o?=
 =?utf-8?B?bWJaTjdjdEhML1dUOTY5eE5JS0hKZDZqNFJzZnNYaGRBK1N6bGFEczNlYTVp?=
 =?utf-8?B?cHRuMzJ5Q2FhQU5neGF2L3NZZ3VpTmVpeUZrWW5zK2hjUzRRTEIyampCanB2?=
 =?utf-8?B?dXVic2NVV3lmenZYREZTOTZpWVI4RUcxSmJMT3BmUXU0RUJvZmdMcU1IUXox?=
 =?utf-8?B?OTcrT2JJZTZMSDBVU0ZKZjNqbDlDcyticXZ4ZHVza1VEQlBZU1A3cForZXY3?=
 =?utf-8?B?TzJYbFdnalVCUjhEaFFCNzdSOXpzTWljQk1QS3p4Rm8rdjN1WVdoQVdjMFV4?=
 =?utf-8?B?bmNNL3BXbnJwZVNQVDlXUjhTNHZkYlZrU1o5VElVMktlQm5BcWZwRzRBN0ww?=
 =?utf-8?B?QzRaSnFxM3JRUEZUM011K1FoUGRMNHk4UFVVOG9pME03K3RZYmtpNEdrK0Zz?=
 =?utf-8?B?N3gvWVA3TFFLeDUxTnFnMjM3VjRUNUxoQ0Z2OW1yMXdDUXZoaTdwbHVWKzBR?=
 =?utf-8?B?NHBDY0ZLVjdGVkovTnNuRThuNjdpTU5tNWlVZ1lGdjhYWG9odGI0Y1o0Y0ZV?=
 =?utf-8?B?bXZiZW5HS2phTktmczliU3ZjVVhMdUZMdW43d0dpV0lJdUF4QUtRNUY5RHll?=
 =?utf-8?B?Z2E0WHJsMHlrVElXQjFlUkxMNzhCbTZtcHJHcVc2cTMvcWhQa2lRSWNCTzNq?=
 =?utf-8?B?SFByRGdQZVpRb25KTFBweEJ1aDFjRHZNbzRHdkVqaHFnRmhLS0RlZTBvMU9j?=
 =?utf-8?B?WnpoTlBuNENrdlFMQkZXdndXVFRJcmpQN1dueUp0M1FOMjVLek9ZdUxVRjQv?=
 =?utf-8?B?TjBDOWdCeXNFY3FMQ084aXdyYjdmQmdWUFBCejJsMkFQdStFNHQxellnN0V6?=
 =?utf-8?B?MkNqOHZNU0N2VGNLaVZEWEw1Z0VFZW9UcEpvY2ZCT2w2RmJuSXBYemI2S0kz?=
 =?utf-8?B?U0FQb1B3S0oxcWUwQjYrQXNQUkJyeVcwZEFkbGRtaUdQWFZnRlJtWnA0ZnpO?=
 =?utf-8?B?M1lGNlVjQWtKdXE3UllJSGxDdU9sRHo0eU5kNjFyTlFOR0tjdFNWV1ZyVnZM?=
 =?utf-8?B?OW5wemFDSmZoWkFXSGJTb1JzRWJNUVVRakk1ejNneGF4WlZxV0lKejNCbGYw?=
 =?utf-8?B?UEYyRWorazdLWXp3ODlJdjd1bXFtUUltYWJUdExvOUZMVlNublUydjBNL213?=
 =?utf-8?B?UFFjcnN3R2FycUZYTGZhamJ2QWVoTHVwU09xMmFmcGsvSlhhRTJGcEVWeUpC?=
 =?utf-8?B?MnQ2cWFSVmtUWVN1Vmg5VDc5WWZNTGpHUUc5VU16WmlZQ3c2d2lvWFNPeG5r?=
 =?utf-8?B?ZFNZbkRFRnlaMjZ2V1o1d0JCVXJ2c3I3UEFQWUttTlY4cGIwQktYUlRQT0V5?=
 =?utf-8?B?Rk9WQ21JV0NlSklGekZGTkM2ckRTd3pOb2pMeTJ4ditndDhZTHE3MnZtT0Fj?=
 =?utf-8?B?MDRzcXYrNHBabFVPaTlySXBpNVdkZkVqaWdkRCthY0RwMno3WnJXNlVxRk44?=
 =?utf-8?B?NFpXOUFuN0RlVGdHaEhQL0Rtci96TXBpNFNGYURXQS9NajQ1MXFwSFpweDg5?=
 =?utf-8?B?M1MyKzBDdDVZU3dXdVNGd1E0RTQ3bTRBeDYycVFVdm1GYTFMaWxzaHk1WXg4?=
 =?utf-8?B?SlExc2crR3hFbDNlcEt2ZlViVmMrSUtPSFVYZlllVCtPR013d0ltVW44Mkdw?=
 =?utf-8?B?am82clN2VnFuQ0gvczZrOXBIMTJYUnBvcHB6RXRvS2pFRnptcExscHlBb3Ft?=
 =?utf-8?B?bXJrVGNRZll5RUV1aEoxQkErdE4xbm40K0gyMFdzaG9GMEs3OVQzTkt1cFdW?=
 =?utf-8?B?ZTVzUTBXMEJBR3lCa1FRanJTd2hleW9HOFpwZ0pkR1NoZVMyMUQxRnhCaWZN?=
 =?utf-8?B?SldqcnlQam1pcy9kM2NSKzRqa2J2VXlkWlRXSEdCUlF4djBER0tHTUhkT00w?=
 =?utf-8?B?cUFCTVFJMEQwaFZSNkxab3NzTTcyL0xtT0JPTUJVQmNPRTgyWXBVNlpKZ1hk?=
 =?utf-8?B?SDNpTmVDZFNmd1F0U010U0F2aFZ3OElYSjJMc1FXaEdpVWdpeGYzaDExSXdD?=
 =?utf-8?B?TmZ4Sm9zQWQ3eWJLTU9lYVJESXJXKytGQzFtaVMzSFFTcVhSQkp0OU1UVS8y?=
 =?utf-8?Q?rQCdCYJug3qoyuw6I2ZwtJ+bW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b741377-9a43-4abf-69e4-08dced1943f2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 12:59:55.0730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eoLnzJGOaD+oSyi6VeICZB6ldVYKJN3YrMq1ExLFvbwdf57xZP2nAZmuhodcRw89isZnLR4WWE+cf9zST1vMgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6607
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


On 10/15/2024 2:48 PM, Maarten Lankhorst wrote:
> Please change this to a XE_IOCTL_DBG, don't use XE_WARN_ON as it can potentially be triggered on process exit.

I missed this point last time. Agree, this can be triggered on process exist, I will make it drm_dbg which is same as XE_IOCTL_DBG. 

XE_IOCTL_DBG would look odd here.


Regards,

Nirmoy

>
> Den 2024-10-15 kl. 11:05, skrev Nirmoy Das:
>> This shouldn't happen but seen this while debugging ufence timeout
>> issue time to time so log it to isolate this particular case.
>>
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> Reviewed-by: Francois Dugast <francois.dugast@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_sync.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
>> index 2e72c06fd40d..22f72df36ab2 100644
>> --- a/drivers/gpu/drm/xe/xe_sync.c
>> +++ b/drivers/gpu/drm/xe/xe_sync.c
>> @@ -83,6 +83,8 @@ static void user_fence_worker(struct work_struct *w)
>>  			XE_WARN_ON("Copy to user failed");
>>  		kthread_unuse_mm(ufence->mm);
>>  		mmput(ufence->mm);
>> +	} else {
>> +		XE_WARN_ON("mmget_not_zero() failed");
>>  	}
>>  
>>  	wake_up_all(&ufence->xe->ufence_wq);
