Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E8EC369D7
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 19:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A572A10E9B1;
	Fri, 25 Apr 2025 19:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rx0dPab4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9906910E9B1
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Apr 2025 19:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745610063; x=1777146063;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qTeB3OboybC2bmykKMQI5hzT4JdHET933uGnS8DWCCc=;
 b=Rx0dPab4bmiYuGE1fb+/s1owG0YIQUZDRzBnEprbv25VlefqHqrL3G3u
 mFOZoV4NKmbVG1qe7dYmBtyfuxTGBIhVq37JV+5b42613K5DW3cnAANj4
 4ffeJq3DyLxw5O2EgGPk922PoXYCK+dGZaCqew2ve5dWr+bxaq/HK413M
 aR+VRRgJdgJXODtTLtW15zB3sQRDI6Eo+07gNGTEUKkYZIAFX1E7s2yoM
 wsWs9JsnQc+3amNQEwxpmyKRbOt9EH9dXSsyBgcnpTgBwAXT/EKQ/br3B
 ziU3hrczswYjgYlzO05JsmMm0xztRqOZYp6fpzWd22bUk799bngof+Yvk w==;
X-CSE-ConnectionGUID: kO+pLBJSQJm+fI1Eeg0GeA==
X-CSE-MsgGUID: V0mCTiidQRmD2MnWX5cnaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="47419614"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="47419614"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 12:41:03 -0700
X-CSE-ConnectionGUID: RW/4s3rxQoKS2uxUVjBRLQ==
X-CSE-MsgGUID: Wy3b61zzTaGcMBuau9od+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="133959091"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 12:41:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 25 Apr 2025 12:41:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 25 Apr 2025 12:41:02 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 25 Apr 2025 12:41:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oFuSAUFM4rEFuKtmqblkTy7kAPT5O8xMXxvaRciupn6+iyHCrwElJLRCeaicJC6shZLvqvMISkZ16Fofcp3JiHtLhTAXgzX/6wn7kp54KBQFZuZp2LUx55/bZms9+E3AzSfum2/PtrkUD5y6QBq+RcV/AsjUiiZE4Cseq8jzhj2IOkJATocgG52OPb5na+l7KrFPaL7oaliCQHLzGFI98CNUc4gUHnz22wF0w8ygPHPOL+pbG8Z3XzMhghhDIHKdgw2GmLDjFhHuufOxosarcwkJdtm+9t/hJ+RhCTnJ8vlKoI5jKz0SpW3GpwpzwPkhhAlq7h8oHPItGsBWNpXlUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6GzKDtnJnCtPV7sJsJjW3XvS9jb/BB64+iqVxPCLPbE=;
 b=fi/9gxpbSlOoJZIChVdf7NZ/nmas8yvTbZ8knvkRq0jXXfIXtmCHlXBkKPZIpQ+ChcgNCd8RJOVGyADtfUdrG/B8XNqcKOJMqRbG9TzNLpcxksLKFgr3uOicjSJ6uXCaMRNnrj19TBp7JVBU4OCtVAWgim3fV+b9lEyDeZx2G+dpDAl/XxyYd/d6jVQEFxI1fE+OltNccXYgdan2JM4gyc7WyKIGx6Dkl5h5uWsqybr8xcm8lMn1I/9wSLuJMjxUUwMrWpXVHOGL5e+p97RKNRBO699bkqfEKGeqhfTintXYRmvEyXh8xYpACTZTiEfl130T6tqnxwE5cafEaudiLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6770.namprd11.prod.outlook.com (2603:10b6:510:1b4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 19:40:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.037; Fri, 25 Apr 2025
 19:40:43 +0000
Date: Fri, 25 Apr 2025 12:42:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Add WA BB to capture active context utilization
Message-ID: <aAvljJkPgAXhA8cs@lstrano-desk.jf.intel.com>
References: <20250425191039.1551559-1-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250425191039.1551559-1-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4PR04CA0149.namprd04.prod.outlook.com
 (2603:10b6:303:84::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6770:EE_
X-MS-Office365-Filtering-Correlation-Id: f397933b-cb52-41f1-45bf-08dd84311167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0FGZmhNQS9DMHh1NWxldzBuSWVMQ1laQ1M1UEh2b3lVY3hGOVlTOFNzWW9H?=
 =?utf-8?B?ZTN4Y2pMbFZKVzZWL3BNUFN4amYvNTdKQzlLM2t4a0hnNC9jdjZWOGdndmt3?=
 =?utf-8?B?cEIrZTd1ODBuczlINmtWS1p6Slk0TnEvdCt1SFFJNWpwVzlaSTFRT3VKL0Ix?=
 =?utf-8?B?dHJ3UUNVWTgxRXEzQlRqQy80VzR4aUFoQlVMRUVqVXpwbDdCT3dSd2ZvS01S?=
 =?utf-8?B?UTd2S2srM2RRMWlLT2dhdElZMDk0ZHkxdHdqQnRXdmxOQlJHbnlDTm5SV2Q4?=
 =?utf-8?B?WWVTVkpYZk1tanFDK3MvMTZFS3VtbUF5blh6WGhpNlY1ZTZncGhFRER3c3gr?=
 =?utf-8?B?WURDUUlmWWdBSHZmV3Fnd0J1R3JkUWQ1RUNOWklSYnFyRkM3VGprTXMrRHJv?=
 =?utf-8?B?U2tmWXRXNS9zZWVkR2JwZkFpTWlkMEJPMDdJbWgxbkZDOHJzaVlVUlBGL2lD?=
 =?utf-8?B?bi84bU5HS1hudGhFQWxLVndiZnVQYWpuVlE4QzBRQkk5SVZhdW1xT0tJa0VM?=
 =?utf-8?B?VTFnZXlxMGhqZjJFclJ1bWJmVjBRcEk4bGlVRExPSm5HdFlHMDlCaTJ3N2g2?=
 =?utf-8?B?RkYxZHRkck02b1ZUZWltVnZNWk11UUZISTQ5czM0a2l0QlFGUytCMmF4c3FJ?=
 =?utf-8?B?MmQ1R29IaHFyVW83empYV25jTEFHU05sY2RkemZNVnFEM1NYNmRUbEc2VWtp?=
 =?utf-8?B?dTdxbE8zOXFwdFFidUJLTVo0blBNT08yZE9YSFZvUXZkME5FZDBPSGRVQTc4?=
 =?utf-8?B?LzRWaHZ3bHkyTU9OSm9RbEZsSkt1enE2NGl5WlpsNkwwbWo0ZkpPZURSRG5v?=
 =?utf-8?B?RzhVVE01cEVMcnREdjlOQVpPMUtFeFJFNTJVSDlFMFJiOEoxMUV5NFlGbSth?=
 =?utf-8?B?aVNPTmQvWUt5ME1ocFlWQ0N1dGZYOEFFOHZJbHd4aEU3dXp5ZUZEQi9JMFdY?=
 =?utf-8?B?VTBRSzV2ZjlMMTJhQzJiY1VLaUJmYmtuQ3l1R2hmVlQ2dGZNZnhlYnQzaUJL?=
 =?utf-8?B?cDN1bmQxNFUxUUtjQm0vZlFvOXIvaStLVnRlbFMrTEVmamV6V0w4eGZGdGky?=
 =?utf-8?B?VnJzOHlqVTVGZ3ErK2pUeE5ZN24vRWxvVTAybnM2Z21BQlZkcFdLbVRwdGJM?=
 =?utf-8?B?UUMwcE1OanpodEFaODdJSm1JNWFpdjh6YVVsODNCNHJMVTJYWnI1TS9RRVpo?=
 =?utf-8?B?RytSSG0vV3QzMlJFL2s0NkZKS2VDYW1nT1g3OElucytFL3ZNSXlUNElkSmNE?=
 =?utf-8?B?dDA4MGdSSDRMZ1JIaVB4RUxBcUwwc2FDQTlmbDdzc0ZBUjdUTDBFb3N6SnpW?=
 =?utf-8?B?dndvRjFXUWJlaFpSN1dQOVFRVjVnVE42aUtDbVlSQS8vM3QrZm4wbmdYN2tZ?=
 =?utf-8?B?c2tySEZmTHFib2NDYWJaVlJ5L1NIMkFWZ2d0TXlNVVJDbW5IWnlxYlVIVlJL?=
 =?utf-8?B?MnlzUEdydUFrSFdnRWY3VGNXbHU2d0xrYVpEV2FRTUIrTDQydk9HdDVNNzVq?=
 =?utf-8?B?SGVFWXpnSkRpdU5iLzVRYVlWTFpQUy9YSUJ1ZmN1aDI1SS9EMmd3bWxmbXg0?=
 =?utf-8?B?eDkvYmNZejNCZnlodGdncHJtUzkyZFJvT3Fpa2l1Nzh6a3N6MEM0UUR5UG94?=
 =?utf-8?B?YXljTHJ5ZUNqdExBa3BVb1BFSllwSkNCVDl5RXpLeDNrckhQRG9OekwvcTh4?=
 =?utf-8?B?djNFWkEzeWpMYUZtRTFkanMvUzZXbjZaTjY3NUVhb3ZwWGl6OCtRZnUzbi91?=
 =?utf-8?B?NkFXVDBKSGRra1Uva1lKeFV4V0NFUzdQR3Y5VEVsY0VSOGgwZnlMV2tzK2Jt?=
 =?utf-8?B?L0VIc3UyYkwyTXlmM0ExRGVJenF4c0FId2haMERuQWw4K0dWK1BHREh3TkFX?=
 =?utf-8?B?UHIvMlc5YVVFaWJqMzVrWkFrSVBieTdMT0p2UEl2NHJReGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUZ6N2Z1SEZOUmZSRzlyYlhtVXhESTNzNGlHTWdTQUxOVnNFRUVCbE5NZ08y?=
 =?utf-8?B?Q3g3dEJvRFdFRk9NbWVUM1ExK1crYjYyeDhjdDdEdFFNM0pnYVQwa2MwQk5h?=
 =?utf-8?B?SS9hSDhCTW1FYW1FWU1aTTVSS0IyclhISVlTWTk0dU01bEF5VFQxSTcrblZm?=
 =?utf-8?B?NjFGM1VwenpmSVFFeVlpWGJDNGxiaSt0dSt2eURjbVFzZHR6ZDN5V0lSV01v?=
 =?utf-8?B?YUIzN3cySm9xOFVuOGpOMXo2ckJQUFczbU9hWHBDVmZJVE9pbSt1bTI5SkFD?=
 =?utf-8?B?WFNuRUtnSTlwRmNHV0o3bER6UXRQMldDZElFQTRGM1QzazBobTNqMytReDFw?=
 =?utf-8?B?SEV1U3NWYlowRXYxZHBySkRKWks1bmZDNzQrNjVxcGI3ZVRwZk1ldGN6WUpo?=
 =?utf-8?B?VWZGTmlXazJ0cDZMTTVDNThsV0JpRENLdkZhcC83MDVXcXBSNjZYMy9lR0pm?=
 =?utf-8?B?QTNYQThjSmx2elFPU1RwODVoS0kvVXp1bEI3ZUdudWVZVmM2dU5BRDMrSzFa?=
 =?utf-8?B?TXoxMWtPVUFVa2NrR1ZwS0hFV3JyOTlTYjdaN1R3YTBMczJTYklrSU1jV29N?=
 =?utf-8?B?bGV5eU5QSWxjN3RPZ2szS2NtL0RnOG9XMlZpNGVQREYwVGtlUFU2cVNRNGdU?=
 =?utf-8?B?RG12dU5OaGU5T0dXbGxuU203cXhGbmovVk1makRva1U1Qy9LWmIzZHFSTnUw?=
 =?utf-8?B?UERzYzRtKzZuZWQzSmY2bjdQYVJiSGxsTmNIaVQ5dVlwQ3lWQWNWVEo5Rjhw?=
 =?utf-8?B?clNpZG8vY2ZiMGFaSlVUMy83MFl1SVVrbVQ3aXBNWi9ORzM5TTlZUUtjK1dL?=
 =?utf-8?B?YXdMbmdPZndxY0lPUFppMGxuUVBJTXo2TCtLNFhPOURFajNwREZ1eWE4anBt?=
 =?utf-8?B?a3NRUXhFM3pOdDlDUUFoRG9oRVN6OTZxUW9WbVhuajdHQTFLS2lTdGRoL1Jq?=
 =?utf-8?B?QUlFTWtMOWZPZXd1YVNOMStWQ2F3QWc4WWZCbXhXWWRjMUsycUJkSFkyNE1j?=
 =?utf-8?B?RFhxZ2piNWtlNGdXRXVYNGNZVk10VjZsYlZwNUloZXBieTlDL2Z5M0FoLzdG?=
 =?utf-8?B?WTBtRjh5SGwyaDhFOG9XYVRaMVRSMm9nZDZyZ3ZnN1Y0SVdqREk5Q0hPSU9v?=
 =?utf-8?B?NTcyUXl2bnRqTkY4V3hsVlNWOVJmYmdPMDhwZEthQ2N0MitUR1FTVDczSVRr?=
 =?utf-8?B?aHRxajFBY3dKei9kZWl1ZzhvaTRoOUN0dG40TWZCYlM4YXc0bUZuRk9aRWpi?=
 =?utf-8?B?QUQvd3JmMlJlSDREQXdtUVNVOUpMYXdNWSs3NE9CTXZLSnlkcEt6NWFDb2NE?=
 =?utf-8?B?bm96MFBtQnlxV1NweDBINysxMFRIdmF0N3VtK2FLQ3BHYS8rM0dSRWN4Qmpv?=
 =?utf-8?B?OG9BRVJXMmg5aTZteDVZQndUeHBwYmFVekRBRTNhZ0FvTHNkNFYxa2ozS2lk?=
 =?utf-8?B?bEN5M09uZ3RlazFrb1VHdkV0S3MxZmthVEl3eHRYWWZzT3d4Mmo4alJycWp1?=
 =?utf-8?B?a1VtZ201ZXNDdGtQZjdUYnp4MWZndzFIQ0o4WmRKY2VmUGdQdU1sdCt0V293?=
 =?utf-8?B?citkUVVpSWJDVlNWRTJFK3FONEQwRVZCcTh3dTFoTWttMDFSaEt6eDlRSE5M?=
 =?utf-8?B?eEF4N0tqRGg5S25uK2ZEbmQxRFE4L2pNMEFCeExoSHJRUzhGS1lXNjhhNlJN?=
 =?utf-8?B?Y25oV0NHSjhEbkoyN3R2bk9OVHA0aytCUFVOaytnRzgza1J4R3Jhdkhmc0FC?=
 =?utf-8?B?ZG1SWW5jcVFnSW1XQXNJNFhQL0lDTnFyOHp2R0U2bVdvT3g2UGcwVWhmQkc4?=
 =?utf-8?B?M2F4RENGUDZqWFRZbDNUVGhQdGsvWCtPbTJub0dtMHgrSVlTNTNnTjV2dXQx?=
 =?utf-8?B?L2tPMDBFM0VxOGNSSW81YTR5SWFKWGFEclJkRzk1c0x4YldQMzFCUDVjc3J0?=
 =?utf-8?B?emVjWnJhbDNyMmFiaVh5T0N1UmdGb0JMZTE0ak9TRWlqK00rVTRvem0xNE5x?=
 =?utf-8?B?d3IzUUNrRjJtY01CczE2NEhOZFNCMWlCcmFiSEo5cFQzTmE1eVF6b1VjeC84?=
 =?utf-8?B?bElYc3l4UWtoZVVlSkpWU2lhMVFWSDZzVGFJbVNDODlPejY0Wmo0am10MkVG?=
 =?utf-8?B?alBsZ0FWZW4ycUpNZDhDS2swa09ZRlF3UmpmT1hKY1k5VFh1U3M3c0g2aTRp?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f397933b-cb52-41f1-45bf-08dd84311167
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 19:40:43.8910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqMZN4cE4pkYyX7x4DCkmiUXZLP+NQOUWTOtmRhb5l1lfpgMc5CkQNDQa5OeAJ214+z5DP3nQyT2LhtHc3OWGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6770
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

On Fri, Apr 25, 2025 at 12:10:39PM -0700, Umesh Nerlige Ramappa wrote:
> Context Timestamp (CTX_TIMESTAMP) in the lrc accumulates the run ticks
> of the context, but only gets updated when the context switches out. In
> order to check how long a context has been active before it switches
> out, two things are required:
> 
> (1) Determine if the context is running:
> 
> To do so, we program the wa bb to set an initial value for CTX_TIMESTAMP
> in the lrc. The value chosen is 1 since 0 is the initial value when the
> lrc is initialized. During a query, we just check for this value to
> determine if the context is active. If the context switched out, it
> would overwrite this location with the actual CTX_TIMESTAMP MMIO value.
> Note that wa bb will run after the context has been restored, so reusing
> this lrc location will not clobber anything.
> 
> (2) Calculate the time that the context has been active for:
> 
> The CTX_TIMESTAMP ticks only when the context is active. If a context is
> active, we just use the CTX_TIMESTAMP MMIO as the new value of
> utilization. While doing so, we need to read the CTX_TIMESTAMP MMIO
> for the specific engine instance. Since we do not know which instance
> the context is running on until it is scheduled, we also read the
> ENGINE_ID MMIO in the wa bb and store it in the PPHSWP.
> 
> Using the above 2 instructions in a WA BB, capture active context
> utilization.
> 

I think this may break the GuC code, which samples the context timestamp
to determine if a job has run long enough to timeout.

Let me explain how that code works.

When a job is started, it stores the context timestamp into a scratch
memory area in the LRC — LRC_CTX_JOB_TIMESTAMP_OFFSET. See
emit_copy_timestamp in xe_ring_ops.c.

When a TDR (DRM scheduler job timeout mechanism) fires — see
guc_exec_queue_timedout_job in xe_guc_submit.c — we toggle the
scheduling state to update the LRC timestamp. We then compare the values
to determine whether the job has actually been running too long.

It’s common, especially when the engine is timeslicing multiple jobs,
that a job hasn’t truly exceeded the timeout. For example, a batch of
parallel dEQP test cases (e.g., Vulkan) could easily trigger false job
timeouts without this code.

If I'm understanding this code correctly, with the WA BB we'd now always
copy a value of 1 into LRC_CTX_JOB_TIMESTAMP_OFFSET, so I think this
will break.

Can we not clobber context timestamp in WA BB rather set a bit somewhere
else that gets cleared on LRC switch out? Or maybe we update
emit_copy_timestamp to read a MMIO value rather than from LRC CTX
timestamp?

Presumably in the TDR we could avoid toggling the scheduling state too
and hook into this new code to get an accurate view of the jobs
execution.

One more nit below.

> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  .../gpu/drm/xe/instructions/xe_mi_commands.h  |   4 +
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   4 +
>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   1 +
>  drivers/gpu/drm/xe/xe_lrc.c                   | 168 +++++++++++++++++-
>  drivers/gpu/drm/xe/xe_lrc_types.h             |   6 +
>  5 files changed, 181 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> index eba582058d55..9153a7cd2ceb 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> @@ -62,6 +62,10 @@
>  #define MI_LOAD_REGISTER_MEM		(__MI_INSTR(0x29) | XE_INSTR_NUM_DW(4))
>  #define   MI_LRM_USE_GGTT		REG_BIT(22)
>  
> +#define MI_STORE_REGISTER_MEM		(__MI_INSTR(0x24) | XE_INSTR_NUM_DW(4))
> +#define   MI_SRM_USE_GGTT		REG_BIT(22)
> +#define   MI_SRM_ADD_CS_OFFSET		REG_BIT(19)
> +
>  #define MI_LOAD_REGISTER_REG		(__MI_INSTR(0x2a) | XE_INSTR_NUM_DW(3))
>  #define   MI_LRR_DST_CS_MMIO		REG_BIT(19)
>  #define   MI_LRR_SRC_CS_MMIO		REG_BIT(18)
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index da713634d6a0..cc698136a6f6 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -43,6 +43,10 @@
>  #define XEHPC_BCS8_RING_BASE			0x3ee000
>  #define GSCCS_RING_BASE				0x11a000
>  
> +#define ENGINE_ID(base)				XE_REG((base) + 0x8c)
> +#define   ENGINE_INSTANCE_ID			REG_GENMASK(9, 4)
> +#define   ENGINE_CLASS_ID			REG_GENMASK(2, 0)
> +
>  #define RING_TAIL(base)				XE_REG((base) + 0x30)
>  #define   TAIL_ADDR				REG_GENMASK(20, 3)
>  
> diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> index 57944f90bbf6..210be0ef12f2 100644
> --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> @@ -11,6 +11,7 @@
>  #define CTX_RING_TAIL			(0x06 + 1)
>  #define CTX_RING_START			(0x08 + 1)
>  #define CTX_RING_CTL			(0x0a + 1)
> +#define CTX_BB_PER_CTX_PTR		(0x12 + 1)
>  #define CTX_TIMESTAMP			(0x22 + 1)
>  #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
>  #define CTX_PDP0_UDW			(0x30 + 1)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 855c8acaf3f1..11eabe4216ef 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -24,6 +24,7 @@
>  #include "xe_hw_fence.h"
>  #include "xe_map.h"
>  #include "xe_memirq.h"
> +#include "xe_mmio.h"
>  #include "xe_sriov.h"
>  #include "xe_trace_lrc.h"
>  #include "xe_vm.h"
> @@ -654,6 +655,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
>  #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
>  #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
>  #define LRC_PARALLEL_PPHWSP_OFFSET 2048
> +#define LRC_ENGINE_ID_PPHWSP_OFFSET 2096
>  
>  u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
>  {
> @@ -697,11 +699,21 @@ static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
>  	return xe_lrc_pphwsp_offset(lrc) + LRC_PARALLEL_PPHWSP_OFFSET;
>  }
>  
> +static inline u32 __xe_lrc_engine_id_offset(struct xe_lrc *lrc)
> +{
> +	return xe_lrc_pphwsp_offset(lrc) + LRC_ENGINE_ID_PPHWSP_OFFSET;
> +}
> +
>  static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
>  {
>  	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
>  }
>  
> +static u32 __xe_lrc_bb_per_ctx_ptr_offset(struct xe_lrc *lrc)
> +{
> +	return __xe_lrc_regs_offset(lrc) + CTX_BB_PER_CTX_PTR * sizeof(u32);
> +}
> +
>  static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
>  {
>  	/* Indirect ring state page is at the very end of LRC */
> @@ -731,6 +743,8 @@ DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
>  DECL_MAP_ADDR_HELPERS(ctx_timestamp)
>  DECL_MAP_ADDR_HELPERS(parallel)
>  DECL_MAP_ADDR_HELPERS(indirect_ring)
> +DECL_MAP_ADDR_HELPERS(bb_per_ctx_ptr)

Is this used anywhere? I'm not seeing it in my search of the patch.

Matt

> +DECL_MAP_ADDR_HELPERS(engine_id)
>  
>  #undef DECL_MAP_ADDR_HELPERS
>  
> @@ -880,6 +894,58 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>  	xe_bo_unpin(lrc->bo);
>  	xe_bo_unlock(lrc->bo);
>  	xe_bo_put(lrc->bo);
> +	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
> +}
> +
> +/*
> + * xe_lrc_setup_utilization() - Setup wa bb to assist in calculating active
> + * context run ticks.
> + * @lrc: Pointer to the lrc.
> + *
> + * Context Timestamp (CTX_TIMESTAMP) in the lrc accumulates the run ticks of the
> + * context, but only gets updated when the context switches out. In order to
> + * check how long a context has been running before it switches out, two things
> + * are required:
> + *
> + * (1) Determine if the context is running
> + * To do so, we program the wa bb to set an initial value for CTX_TIMESTAMP in
> + * the lrc. The value chosen is 1 since 0 is the initial value when the lrc is
> + * initialized. During a query, we just check for this value to determine if the
> + * context is active. If the context switched out, it would overwrite this
> + * location with the actual CTX_TIMESTAMP MMIO value. Note that wa bb will run
> + * after the context has been restored, so reusing this lrc location will not
> + * clobber anything.
> + *
> + * (2) Calculate the time that the context has been running for
> + * The CTX_TIMESTAMP ticks only when the context is active. If a context is
> + * active, we just use the CTX_TIMESTAMP MMIO as the new value of utilization.
> + * While doing so, we need to read the CTX_TIMESTAMP MMIO from the specific
> + * engine instance. Since we do not know which instance the context is running
> + * on until it is scheduled, we also read the ENGINE_ID MMIO in the wa bb and
> + * store it in the PPHSWP.
> + */
> +
> +static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
> +{
> +	u32 *cmd;
> +
> +	cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
> +
> +	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
> +	*cmd++ = ENGINE_ID(0).addr;
> +	*cmd++ = __xe_lrc_engine_id_ggtt_addr(lrc);
> +	*cmd++ = 0;
> +
> +        *cmd++ = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
> +        *cmd++ = __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
> +        *cmd++ = 0;
> +        *cmd++ = 1;
> +
> +	*cmd++ = MI_BATCH_BUFFER_END;
> +
> +	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
> +			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
> +
>  }
>  
>  #define PVC_CTX_ASID		(0x2e + 1)
> @@ -900,6 +966,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	int err;
>  
>  	kref_init(&lrc->refcount);
> +	lrc->gt = gt;
>  	lrc->flags = 0;
>  	lrc_size = ring_size + xe_gt_lrc_size(gt, hwe->class);
>  	if (xe_gt_has_indirect_ring_state(gt))
> @@ -920,6 +987,14 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	if (IS_ERR(lrc->bo))
>  		return PTR_ERR(lrc->bo);
>  
> +	lrc->bb_per_ctx_bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
> +						  ttm_bo_type_kernel,
> +						  bo_flags);
> +	if (IS_ERR(lrc->bb_per_ctx_bo)) {
> +		err = PTR_ERR(lrc->bb_per_ctx_bo);
> +		goto err_lrc_finish;
> +	}
> +
>  	lrc->size = lrc_size;
>  	lrc->tile = gt_to_tile(hwe->gt);
>  	lrc->ring.size = ring_size;
> @@ -1026,6 +1101,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	map = __xe_lrc_start_seqno_map(lrc);
>  	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>  
> +	xe_lrc_setup_utilization(lrc);
> +
>  	return 0;
>  
>  err_lrc_finish:
> @@ -1245,6 +1322,21 @@ struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc)
>  	return __xe_lrc_parallel_map(lrc);
>  }
>  
> +/**
> + * xe_lrc_engine_id() - Read engine id value
> + * @lrc: Pointer to the lrc.
> + *
> + * Returns: context id value
> + */
> +static u32 xe_lrc_engine_id(struct xe_lrc *lrc)
> +{
> +	struct xe_device *xe = lrc_to_xe(lrc);
> +	struct iosys_map map;
> +
> +	map = __xe_lrc_engine_id_map(lrc);
> +	return xe_map_read32(xe, &map);
> +}
> +
>  static int instr_dw(u32 cmd_header)
>  {
>  	/* GFXPIPE "SINGLE_DW" opcodes are a single dword */
> @@ -1792,21 +1884,93 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
>  	kfree(snapshot);
>  }
>  
> +static u32 get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id)
> +{
> +	static u32 base[XE_ENGINE_CLASS_MAX][XE_HW_ENGINE_MAX_INSTANCE] = {
> +		{
> +			RENDER_RING_BASE,
> +		},
> +		{
> +			BSD_RING_BASE,
> +			BSD2_RING_BASE,
> +			BSD3_RING_BASE,
> +			BSD4_RING_BASE,
> +			XEHP_BSD5_RING_BASE,
> +			XEHP_BSD6_RING_BASE,
> +			XEHP_BSD7_RING_BASE,
> +			XEHP_BSD8_RING_BASE,
> +		},
> +		{
> +			VEBOX_RING_BASE,
> +			VEBOX2_RING_BASE,
> +			XEHP_VEBOX3_RING_BASE,
> +			XEHP_VEBOX4_RING_BASE,
> +		},
> +		{
> +			BLT_RING_BASE,
> +			XEHPC_BCS1_RING_BASE,
> +			XEHPC_BCS2_RING_BASE,
> +			XEHPC_BCS3_RING_BASE,
> +			XEHPC_BCS4_RING_BASE,
> +			XEHPC_BCS5_RING_BASE,
> +			XEHPC_BCS6_RING_BASE,
> +			XEHPC_BCS7_RING_BASE,
> +			XEHPC_BCS8_RING_BASE,
> +		},
> +		{ 0 },
> +		{
> +			COMPUTE0_RING_BASE,
> +			COMPUTE1_RING_BASE,
> +			COMPUTE2_RING_BASE,
> +			COMPUTE3_RING_BASE,
> +		},
> +	};
> +	u32 c = REG_FIELD_GET(ENGINE_CLASS_ID, engine_id);
> +	u32 i = REG_FIELD_GET(ENGINE_INSTANCE_ID, engine_id);
> +	u32 mmio_base = base[c][i];
> +
> +	if (xe_gt_WARN_ONCE(lrc->gt, !mmio_base,
> +			    "Unexpected engine c:i %d:%d for context utilization\n",
> +			    c, i))
> +		return 0;
> +
> +	return xe_mmio_read32(&lrc->gt->mmio, RING_CTX_TIMESTAMP(mmio_base));
> +}
> +
>  /**
>   * xe_lrc_update_timestamp() - Update ctx timestamp
>   * @lrc: Pointer to the lrc.
>   * @old_ts: Old timestamp value
>   *
>   * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
> - * update saved value.
> + * update saved value. With support for active contexts, the calculation may be
> + * slightly racy, so follow a read-again logic to ensure that the context is
> + * still active before returning the right timestamp.
>   *
>   * Returns: New ctx timestamp value
>   */
>  u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
>  {
> +	u32 ctx_lrc, ctx_reg, engine_id;
> +
>  	*old_ts = lrc->ctx_timestamp;
>  
> -	lrc->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
> +	ctx_lrc = xe_lrc_ctx_timestamp(lrc);
> +	if (ctx_lrc == 1) {
> +		engine_id = xe_lrc_engine_id(lrc);
> +		ctx_reg = get_ctx_timestamp(lrc, engine_id);
> +		if (!ctx_reg)
> +			lrc->ctx_timestamp = *old_ts;
> +		else
> +			lrc->ctx_timestamp = ctx_reg;
> +
> +		/* read lrc again to ensure context is still active */
> +		ctx_lrc = xe_lrc_ctx_timestamp(lrc);
> +	}
> +
> +	/* If context switched out, just use the lrc value */
> +	if (ctx_lrc != 1)
> +		lrc->ctx_timestamp = ctx_lrc;
>  
>  	trace_xe_lrc_update_timestamp(lrc, *old_ts);
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
> index 71ecb453f811..1c973d71ba98 100644
> --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> @@ -28,6 +28,9 @@ struct xe_lrc {
>  	/** @tile: tile which this LRC belongs to */
>  	struct xe_tile *tile;
>  
> +	/** @gt: gt which this LRC belongs to */
> +	struct xe_gt *gt;
> +
>  	/** @flags: LRC flags */
>  #define XE_LRC_FLAG_INDIRECT_RING_STATE		0x1
>  	u32 flags;
> @@ -53,6 +56,9 @@ struct xe_lrc {
>  
>  	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
>  	u32 ctx_timestamp;
> +
> +	/** @bb_per_ctx_bo: buffer object for per context batch wa buffer */
> +	struct xe_bo *bb_per_ctx_bo;
>  };
>  
>  struct xe_lrc_snapshot;
> -- 
> 2.43.0
> 
