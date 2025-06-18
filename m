Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6ADC71155
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 02:43:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BD110E0E1;
	Wed, 18 Jun 2025 02:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g8gVasnC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C1A10E0E1
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Jun 2025 02:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750214632; x=1781750632;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cfMMV1r0GEh2ArBkZyl/xah/8dbdo4arI0Lkrt/fiDk=;
 b=g8gVasnCe8Xh7bq/z7QGyr3gnrJ7HAlYwvkZENk9eZgzZAY5cgxW37eE
 fu/1SfP+VXSkqOIXoMNvgyJ/t/lIomRH1iJylR/IupgesToMrUGV6Oe0V
 wLHjJO1PE6bjJP+iw49SgHUHc9lsRQay+kgRUha5Q3VJb5hHdtH2I0DtA
 MjufkM990vEFgs4GrRpr0tTSFtkOl72C7pcvjVotr1fVHskIw6wrNV1o1
 YK8bguf9u3MryPJau9d81L8QCZTkEfZZdJXsYdrJenr+TcOmq1/ZwAKM+
 +yi9GaTYJiwUz43xlA3++bhFsprpSvaQpkuaxEGsAWyf9CO4/LkTgynck g==;
X-CSE-ConnectionGUID: H6D7pjCJR4+v8mzbYZ2GoA==
X-CSE-MsgGUID: 7P56uxbdQ6u8X6TUg5OofQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63773302"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="63773302"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 19:43:44 -0700
X-CSE-ConnectionGUID: P8YC1zTnR9aNTilB0P2BUw==
X-CSE-MsgGUID: mrfAZOD+Q/CCTItWcERhLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="154385122"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 19:43:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 19:43:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 19:43:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.78) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 19:43:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmY/HXYA8JsFmVkemOZltGMXVGkX7TtlWp3payN6fuNQrOHIs9zIdxb62xKaiNB1iXEFTOHhpJR+cnPnxcaDb2EpVmKpy6t7xV00ltbyYLhc3Cax3VIcnqiGGBeuVPWLWC6OKDvfo4gFpGjIGUoeXRgvSTWe/2agAf+gJ8lKKE7rRWfSsUCLkEwJXAa9prTodMF16vtctFn0AQ7okl4vKmxD4t7JirCsvnfkV8TtNi3Oc6xLOSrSjzfWMCfTvVd6c2oo/LFrxYJembaznF9F9+COnamIfL4Ckd3p3PYdbnPjsL4Lm0uzQLRRT8DkC5oeVs2eAdxSBXqWEpDy3bDQUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRB2LpMfpVqr76qBlV+UxE+uNP8RrYhdMsIuScL16X8=;
 b=oaF32t6PS4SFDsrjMPwshHNNMlQMzGjTQNAd7q7JESq8KtIQZfPGe++3IQS2kauezW6rughHduJobu7nAklNEEid0H7kR2Cio/w7fOPsWPzDzxhCx3PFEGu6nGpE/DiOvNgyVVnYnfliBsg+I9UQHc8nMkBJcMLwAk51TVpZs7p1S/HOSauWpNG1rZlcqHwOQer1Mheqqjy1IsUll81YJfB1bY0e15ewCTe3dcRXLtW1KEWhAsSVcFXixI+jQ3BbWvpldEFdQw7WNhp2aRkkMYJcZrdU7S+BKLAk5j98zFwSgoQNm5zMVXFy6F5ipPiAIajJxm/J8u0i81mrvJY0fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SJ2PR11MB8472.namprd11.prod.outlook.com
 (2603:10b6:a03:574::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 02:43:19 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8835.018; Wed, 18 Jun 2025
 02:43:19 +0000
Message-ID: <470e8624-0f1d-44dd-819a-2526d77bb133@intel.com>
Date: Wed, 18 Jun 2025 08:13:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe: Add xe_vm_has_valid_gpu_mapping helper
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250616063024.2059829-1-matthew.brost@intel.com>
 <20250616063024.2059829-2-matthew.brost@intel.com>
 <a5f37fef-4558-445d-94ce-4e9cc055f546@intel.com>
 <aFHVKsvVItiHxMKm@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aFHVKsvVItiHxMKm@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::7) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SJ2PR11MB8472:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b257c5b-2344-48ee-a425-08ddae11e279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVJPVEdtK3J0T0NldjdjbkdBeHJhTHVnVW9OMG9vY3dsZUJ1QjBvV3o3dWwy?=
 =?utf-8?B?LzJkOWFmVW1NU2tOYTUxbjNPOTAxWFU4blZCZVU5ZWxMMmNwNTdPK3BJWGFY?=
 =?utf-8?B?QUc5Y21FbFFJTW1yZEdaNkI2VzZ3aDlHVHNZVitWSlUxS3B6T2ppSHpZcGow?=
 =?utf-8?B?cjlGWXpCSDlzNE9kbEpGSWxGcGsrenZsbi9VTlowemsrNk5xRVc3VmtoczEw?=
 =?utf-8?B?VFg0VXk0L0Yzc2RmeURNOEtLWXBZc1BaM0dLRTNrbVhJdTVRYzVrK1QzVkpU?=
 =?utf-8?B?WWluRTVTUjNvZVZEUnI0dExBOFg1ZFNaVllDNFZ2L2U5UXE5eFNFYVZ1ZkVk?=
 =?utf-8?B?cFlrWGlucWlTLzVHYllhcVVMZzZMdkZtTmpxWW5LQmEyVmZFQWtDR0FKRlhJ?=
 =?utf-8?B?Zlk4WEZod1ZkMEllcm82cWRoV2VwbnEzU25rOWkyeU41dHdiOVlERFdJVnJN?=
 =?utf-8?B?aDlLbHpod3ZLZ2NrbHE2dTRDQklsTnEwQ2UrY2NkQWFTTHptNU0yYmFsYUFV?=
 =?utf-8?B?bysrWUhBSG1ZMFZtNnRiOWVJVFNjcXRQekFwMnFCdHFFL2JuZTkveThzaEIv?=
 =?utf-8?B?WXFRc0VLK3g1NkVwaTdrRzB2aHFxTjg4eXgydFRpKzVCZ1R4NU9GcGVqZHdy?=
 =?utf-8?B?TmtNZXp0NmpsWW82aXlvUk44ZG5FZTNEZ3UwQ1BwM2lUWHZTdThmRWU0eWdB?=
 =?utf-8?B?Nnd5Q3dVK3l0M0lLTllMWFZmWW1LdTlBSmFSUzVaZkMrM0xndmdzRmZ4LzY2?=
 =?utf-8?B?V25lbHUreUVJc1M5QUJOVG5IMENnRzJRUi9zR3R2Rm55R25lTXVUcURXV1N3?=
 =?utf-8?B?dUYvZDMxSW9FeWpjSVBmNWdIY3pMWkJ3d2pQdTJndnMyV2NWMmc3YWVFWTR5?=
 =?utf-8?B?dU5tOFB4dTltTkxmMUNWdlA4WmdHQ2I1cXArK1lNUkVxaWdvWHNqVHBKM3lr?=
 =?utf-8?B?bkh0TzB1RmRuM0FCZ2EvdnZwUDlpaDlDb0pnd3NhcjN5NzVTZm1CaWs4bSs5?=
 =?utf-8?B?YVoyZVNCR2JmeEVJOFZsdFFOMSswM3hva0Q2aEJ3UlM2UWFPb3VGNkJLQnpr?=
 =?utf-8?B?VUlNbFU2V2Zra0s1SWU0dWlhMEdZTTUzWkEzRy9sa2hGUHM2QlpHcVFneFFh?=
 =?utf-8?B?RmpaTUluS2NGZlVIMFNydE05SjdFQkhWNXd1WkdXUmZWZmZHM1BpWjFTU1Fk?=
 =?utf-8?B?VUtQeGlJMHpCbjl1cHI5MW1OWW5lOE5nYVZvY29odjYvUjloK1R6cUdQbUFy?=
 =?utf-8?B?VkExUEtZdEdhZzlESE04VUZ0cUNJZFRwb0FwZ3AvUTl3cUU2T0Flc3g5RlIz?=
 =?utf-8?B?RlptYllETENRUTlKRUdiU2o3c2ZvcHdPeURSVzlzeVdwbDJKUDFoOWdNd04r?=
 =?utf-8?B?Mzk1WjI5eHdEUndDcHgwRmtFdHRja25BeTJFWFcyUXRZTElsTVpyRTJvZHRK?=
 =?utf-8?B?NGdINnZVaGlSN1RPeEpwUUxlQWdkb2F5bXpMbDlVTGJid3YxZU5LSFV2Njcy?=
 =?utf-8?B?VUlvblZrWFQ3YnlrU3BBckgwa1JPd3FHQWJRWlgwaUhaK3NMSWtFaTNUaWNH?=
 =?utf-8?B?UGpib2FaVjNNSncvUGFjdXJEQU0xNXNoUEhJQitMV2xRbS80OU5IMFRpOEdn?=
 =?utf-8?B?Nm9GOUY2SjAzZHhjQXRhMlFzOHVNWVB2Z0NaSXBzSjlFdjZhYlROZm5WUUJJ?=
 =?utf-8?B?NmZGOFZtMHZibVBoUE94WnJ1WG16UzRKZEFLT29iVE5ZRkpkMkczNzhzeW5x?=
 =?utf-8?B?cHVma0NKSjlGcitCVWtQSHhjclVjZFFIN3JOSkV4UFU2TlJrLzl6eGp3aHJz?=
 =?utf-8?B?ZHR1ZFZnQXZyeWVnMlA4Ny93Zy9MQlN3L21TdFZuMldGc2lRakZMV3c0dnZu?=
 =?utf-8?B?V2lCYlRUTnREcGRIZkpuSHdsUnpCVWIwMGhLRzdTNTJMMVdmZzV4S0VHNWp6?=
 =?utf-8?Q?jldzYjSBS2I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2tnZ1BVdlBpR0x0NEluTlVqQTA3SXJXeWJsMWFsR2J0dmh0bENaUVZnMHFK?=
 =?utf-8?B?YjJlVURLc001Yldya3AwbFJxVXVsNFZZek8rbHhHbGt5ZmdsRFdiclhBOXl1?=
 =?utf-8?B?SDBRaWtyTm11NklicVdBSmJSZWpPdjB1K2lXWkx6dk1TSWVOQUt4emx6ZWMr?=
 =?utf-8?B?Uk9hWHVsbU5PRlN3MHBLQW9wT1BnbFpRcmRDNG9Ga1JpMUxHSHBXV29RNWM1?=
 =?utf-8?B?ZnVPYktGaThETi9lYlFPNXBYb3BlRjM2TUFxYmxsajV3UjYraVREQTVBZFoy?=
 =?utf-8?B?Zkw5VElHdTNwWkJRTHU2NDZGSHczNnMxTzZ1SWVSOTBjZG9BR3NZK2JiSXo2?=
 =?utf-8?B?Zk1IQUtWZmxScmdXU3RVbGxBN3RCV2tpT2VNckZ2aUtFOGRVQno4bDN4TU5P?=
 =?utf-8?B?Sk40R3l6U0JQSWdwUndsa2hvU2lyQjhIa1ViSi9MMXl5QTF0YXdKU3cvN1pU?=
 =?utf-8?B?UXlRWWN2endXMTFJM0VFVmR5Qk54VCtLS1VqdzArTGU5clQraDdSM2FtWE9R?=
 =?utf-8?B?TkwwNTJvdERCUUQ2KzZ5TWZyL2FZMlY0K1RuVHJ0ZGZQUjNWNUxsMlFHZUhE?=
 =?utf-8?B?eWM4ZDl0R2NBSy9SdytKQ1h2bUhLNmxBbklhQ1ZYTUlKWUU0YjltK0xlSGNP?=
 =?utf-8?B?Y0c1dXl5Y3A5THVQK2Izc01xRHVWUDJRU1Y1blRLaEJ5ZWVvcit4Q3l2U1Uz?=
 =?utf-8?B?THl5RUV3WTltVC9wcWNDMG9ZbEdIZi9STGtyRDIrYXRVSCtQMXRkSTJoNkwy?=
 =?utf-8?B?dFdwMkFKSWh4czZHWC9HVk43c2FkSjFxamkvRnFxb2s2MVovTnlzZ1hwWnor?=
 =?utf-8?B?dUtYQmQzbFdweEg3M1dlanRFd0dCbWNTVzdyZHlZbHBBMWU3WTVDRkxOZXdJ?=
 =?utf-8?B?M3FHRUtZbVBydlRvU0NBYWs1dzduaHBWRHE5c0pMWHI1ZEJGY1ZwMXNTYysy?=
 =?utf-8?B?WjlVVExsbHh4N0lMRTZnUUZ4VnkxRnJKWURkM0FmdXFyZWtPUGNCUVE0U2NO?=
 =?utf-8?B?ekVtcExTa004SUpHdWJLRHd0OEEwZFlHQ3lSTHpHMUZ1OE9mcGZtRnVaeWpJ?=
 =?utf-8?B?WGFLU21qRSs0cHBwclUrZTYxOEJWdjdUNVRIS1EvT3BFSHFpd0F4eDdsM1oy?=
 =?utf-8?B?dzgvdWQvMHdzV3BTSU8zQVI1TzRYcmxNdGNuand4WmYwdFRTTTlrV1M0eEpn?=
 =?utf-8?B?dXk2THR1a2xjSWRYU01jejNvWnBIMk9rM3l2VC9mK0FSakh1QVJ4Nkg3QW5Y?=
 =?utf-8?B?ZTNEUW9YUkl5YTllKzU1WkovdU9Vc1pjamVhWmJsamxxZi8wQkgrUGpDdHFh?=
 =?utf-8?B?YmM4c3JyWWtBNlc2RkZoWCtqdnV4UGxEdjV2WTRuaUowbDlVM2k1SDJ1WXVr?=
 =?utf-8?B?S0dNVk82VXdmMTJENVNEeWxoK3hGdWM0RXBuNitSOUU5cVFpWUc1SGJ0andp?=
 =?utf-8?B?V1FWYjJ0d24remxBWmlLMzJweitXZjZqUlkza1lKN2dIMlZtN2FmVjk0MnRT?=
 =?utf-8?B?NVVyc21KRHJwT2JzZmJURWpIZGZPTVdpUGlEV3FKT0E1SHFnc1YvcGZ3L3Fh?=
 =?utf-8?B?WmZmUmlaTFAzeERsNnhrdzVQRExvclovTlZFN1V2NGFsWnlwclZKY0d3S2VI?=
 =?utf-8?B?ZHF1YXlEeFQrbUxjVTFHSUpyaytRQ2V3Y3pxNXkrMzhScjRoTzh6Q3N1bHB6?=
 =?utf-8?B?ZE5CMGhrcXo0bVU2b1VER0RwYmFDMjc1Rng0Sk1xd05GMTB1YUxMMlBlN0hO?=
 =?utf-8?B?bDR5dGRCdUNBS21hdU5EY0tYWUhHbks0ZGZDQUdVTWwrcUFPOUd2ZitUd1dM?=
 =?utf-8?B?NzJoQlFuZTdzVE1lNjFSdk9rL3BtNjlFQmFXamg4c2IvVzNJVlpoY2N5Zktr?=
 =?utf-8?B?SzFhYndlRXQzZTUydm1JaER0YUZmeEZWYmVEUm1FWXpGZkdWZ1ZKa0tHOTht?=
 =?utf-8?B?VXZTYkZsNitobHZwYktCNU9UU2toSFN3aVBWd2IvRUljVEVBSXNRVk1SVVlS?=
 =?utf-8?B?ZGJ5eExSUUdTMFBYVnpDSVE3TXhLQlphMVlzZDBrYWhxM1hqeFNuRXBKTzYx?=
 =?utf-8?B?b1dwelk0UVRNRXdWOUZjZWlGZmxGVEJHRDhCNzBxaVNqRHlldThaM3RIVDQz?=
 =?utf-8?B?M3Q5SDFRTkJsMSs4NGJadVhSSjlHMFRoM29acm5iQWRnVG1JY0lWZkIwMmpi?=
 =?utf-8?Q?2jzDNuQZPvBU9+TnhNcafvM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b257c5b-2344-48ee-a425-08ddae11e279
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 02:43:19.7503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8o57kp35s7LBIn2Jqy6SMz7axbJRgn2IllA1V0sVmFM1PJOTSuTYN6vc6hknLU6ZXuGVdkWNfcqjUAfxvfNbJE0bxkcWEfZ38BbYT3bLokc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8472
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



On 18-06-2025 02:20, Matthew Brost wrote:
> On Tue, Jun 17, 2025 at 11:11:40PM +0530, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 16-06-2025 12:00, Matthew Brost wrote:
>>> Rather than having multiple READ_ONCE of the tile_* fields and comments
>>> in code, use helper with kernel doc for single access point and clear
>>> rules.
>>>
>>> v3:
>>>    - s/xe_vm_has_valid_gpu_pages/xe_vm_has_valid_gpu_mapping
>>>
>>> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_gt_pagefault.c |  9 ++-------
>>>    drivers/gpu/drm/xe/xe_pt.c           |  6 +++---
>>>    drivers/gpu/drm/xe/xe_svm.c          | 16 +++++++---------
>>>    drivers/gpu/drm/xe/xe_vm.c           |  2 +-
>>>    drivers/gpu/drm/xe/xe_vm.h           | 19 +++++++++++++++++++
>>>    5 files changed, 32 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>> index e2d975b2fddb..3522865c67c9 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>> @@ -69,15 +69,10 @@ static bool access_is_atomic(enum access_type access_type)
>>>    static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
>>>    {
>>> -	/*
>>> -	 * Advisory only check whether the VMA currently has a valid mapping,
>>> -	 * READ_ONCE pairs with WRITE_ONCE in xe_pt.c
>>> -	 */
>>> -	return BIT(tile->id) & READ_ONCE(vma->tile_present) &&
>>> -		!(BIT(tile->id) & READ_ONCE(vma->tile_invalidated));
>>> +	return xe_vm_has_valid_gpu_mapping(tile, vma->tile_present,
>>> +					   vma->tile_invalidated);
>>>    }
>>> -
>>>    static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
>>>    		       bool atomic, unsigned int id)
>>>    {
>>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>>> index f39d5cc9f411..9c30111e8786 100644
>>> --- a/drivers/gpu/drm/xe/xe_pt.c
>>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>>> @@ -2196,7 +2196,7 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>>>    					   DMA_RESV_USAGE_KERNEL :
>>>    					   DMA_RESV_USAGE_BOOKKEEP);
>>>    	}
>>> -	/* All WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c */
>>> +	/* All WRITE_ONCE pair with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
>>>    	WRITE_ONCE(vma->tile_present, vma->tile_present | BIT(tile->id));
>>>    	if (invalidate_on_bind)
>>>    		WRITE_ONCE(vma->tile_invalidated,
>>> @@ -2255,7 +2255,7 @@ static void range_present_and_invalidated_tile(struct xe_vm *vm,
>>>    					       struct xe_svm_range *range,
>>>    					       u8 tile_id)
>>>    {
>>> -	/* WRITE_ONCE pairs with READ_ONCE in xe_svm.c */
>>> +	/* All WRITE_ONCE pair with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
>>>    	lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
>>> @@ -2324,7 +2324,7 @@ static void op_commit(struct xe_vm *vm,
>>>    	}
>>>    	case DRM_GPUVA_OP_DRIVER:
>>>    	{
>>> -		/* WRITE_ONCE pairs with READ_ONCE in xe_svm.c */
>>> +		/* WRITE_ONCE pairs with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
>>>    		if (op->subop == XE_VMA_SUBOP_MAP_RANGE)
>>>    			range_present_and_invalidated_tile(vm, op->map_range.range, tile->id);
>>>    		else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
>>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>>> index 2fbbd6a604ea..26418e9bdff0 100644
>>> --- a/drivers/gpu/drm/xe/xe_svm.c
>>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>>> @@ -141,7 +141,10 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
>>>    	for_each_tile(tile, xe, id)
>>>    		if (xe_pt_zap_ptes_range(tile, vm, range)) {
>>>    			tile_mask |= BIT(id);
>>> -			/* Pairs with READ_ONCE in xe_svm_range_is_valid */
>>> +			/*
>>> +			 * WRITE_ONCE pairs with READ_ONCE in
>>> +			 * xe_vm_has_valid_gpu_mapping()
>>> +			 */
>>>    			WRITE_ONCE(range->tile_invalidated,
>>>    				   range->tile_invalidated | BIT(id));
>>>    		}
>>> @@ -605,14 +608,9 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
>>>    				  struct xe_tile *tile,
>>>    				  bool devmem_only)
>>>    {
>>> -	/*
>>> -	 * Advisory only check whether the range currently has a valid mapping,
>>> -	 * READ_ONCE pairs with WRITE_ONCE in xe_pt.c,
>>> -	 * xe_svm_range_notifier_event_begin
>>> -	 */
>>> -	return ((READ_ONCE(range->tile_present) &
>>> -		 ~READ_ONCE(range->tile_invalidated)) & BIT(tile->id)) &&
>>> -		(!devmem_only || xe_svm_range_in_vram(range));
>>> +	return (xe_vm_has_valid_gpu_mapping(tile, range->tile_present,
>>> +					    range->tile_invalidated) &&
>>> +		(!devmem_only || xe_svm_range_in_vram(range)));
>>>    }
>>>    /** xe_svm_range_migrate_to_smem() - Move range pages from VRAM to SMEM
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index 6ef8c4dab647..04d1a43b81e3 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -3961,7 +3961,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>>>    	ret = xe_vm_range_tilemask_tlb_invalidation(xe_vma_vm(vma), xe_vma_start(vma),
>>>    						    xe_vma_end(vma), tile_mask);
>>> -	/* WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c */
>>> +	/* WRITE_ONCE pairs with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
>>>    	WRITE_ONCE(vma->tile_invalidated, vma->tile_mask);
>>>    	return ret;
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>>> index acd3fd6c605b..cc332c4ebdf2 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.h
>>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>>> @@ -375,6 +375,25 @@ static inline bool xe_vm_is_validating(struct xe_vm *vm)
>>>    	return false;
>>>    }
>>> +/**
>>> + * xe_vm_has_valid_gpu_mapping() - Advisory helper to check if VMA or SVM range has
>>
>> Nit the helper is no more in use for VMA in Patch 2.
>>
> 
> vma_is_valid in patch uses the helper though.

Just to clarify — the comment I made in patch 1 was actually intended 
for patch 2. The nit was regarding the commit description of patch 2, 
not the code itself. Ignore the comment here.

> 
> Matt
> 
>> Rest all looks good to me.
>> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>
>>> + * a valid GPU mapping
>>> + * @tile: The tile which the GPU mapping belongs to
>>> + * @tile_present: Tile present mask
>>> + * @tile_invalidated: Tile invalidated mask
>>> + *
>>> + * The READ_ONCEs pair with WRITE_ONCEs in either the TLB invalidation paths
>>> + * (xe_vm.c, xe_svm.c) or the binding paths (xe_pt.c). These are not reliable
>>> + * without the notifier lock in userptr or SVM cases, and not reliable without
>>> + * the BO dma-resv lock in the BO case. As such, they should only be used in
>>> + * opportunistic cases (e.g., skipping a page fault fix or not skipping a TLB
>>> + * invalidation) where it is harmless.
>>> + *
>>> + * Return: True is there are valid GPU pages, False otherwise
>>> + */
>>> +#define xe_vm_has_valid_gpu_mapping(tile, tile_present, tile_invalidated)	\
>>> +	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT(tile->id))
>>> +
>>>    #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
>>>    void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma);
>>>    #else
>>
>>

