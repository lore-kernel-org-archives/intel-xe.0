Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6624BC71135
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 07:40:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3CA10E2A6;
	Mon, 16 Jun 2025 07:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ffb7KMjW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18AF510E2A6
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 07:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750059615; x=1781595615;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bSoF5wSC5pMWg1TLLvW8IrcpCXYDIuYWniXNnmrnYHM=;
 b=Ffb7KMjW5sl9qVljIueSSzCROSmhhdAPu4Zqh/qAcLPJGnqHtlSdbbH4
 dKl1llCgXbUKpvROevDp1Lxw+k9g2ckBrr4nPvYGc8I/2hk4t6TzSzwwL
 umkpzre1IZMVqeETvf1kZ7EpuyX5Yjw7feBRksSlb+OqAN7E7Jvm342UG
 PG5/BieoyoW7pgpuK2BHpiqhe27yR2DnfjuqimuoyqF1QuhaPukQ3fpnG
 lVyUd67fXx7e4ufwi0b5GiNsxS9QDf8v+Rhb9zfQodxDFfljsLaI7szoe
 k8uxYZjM/Sf/Bvxd6ZZ2FN/CBFgGFDvxqixDFJBxQCLC3ESOHok6L6I5y Q==;
X-CSE-ConnectionGUID: qiNIBsr6TkOB8rd1ezyGRQ==
X-CSE-MsgGUID: PnQHqt5VSwqnd4Fr5DqTFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="55995924"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="55995924"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 00:40:14 -0700
X-CSE-ConnectionGUID: HMLbuN0EQ5aJYDrKIW+kew==
X-CSE-MsgGUID: Hh80KTYWQHedQYpxrtS3Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="185657472"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 00:40:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 00:40:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 00:40:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.73)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 00:40:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kNBNRvvbHzUHEA+xP1gJCHU3Ee+I7uz8bQTJm+yEs+KUwb4q95U5RfcoBeK5IohEG0TiToFBPBEZWtaGOqpy13WFYrZQLQZ8LsXXpxAC+ndDtS/NixWOHKE6y0CzE66tJRHka+KBGeSzCxjJ7UAlrnnQ3OrtLvhGLjGnxae+k2QsN9ohucoXoRVM/SHRzp0W2zh0XqlH3yUOH0EXLemQx1pJqJI/vPkBaWt0ICHZkmAISHEvK888RreCa1IrnxbGkdbYDF9WXKSoph5gogIxCVOxTiUo8jMHCRjPYK8Qajl8DD3Iu4tsglXvtYlQSXSxdBvdyekqStexgpAccVSGNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GDLcZhjjXBLrpqiziUvzxSXYPRrfNSFnMy0pS1B2b0=;
 b=CqgnKb3tvbwmYNUCMcF9V2pe08EKAxRLvzR/ji76DGGOhYOP7sxEFOlmMGllTLK0RQmc3Hl7felqDBzgL9Ofs5jv0EYpqAO9+S6JlxYAV6UvFZS/x3BjsMGgPssLCSUWpXvcHznk31WJYVx1ntYyR28ZMXuYzBpMdVqr5Hakxx3dRBBds+kw4stj6QscSBtjj76eTF81qJORar8Z0AXMBFvDgTBLTljo5HnNMYz2a49WPtldi4oYBYbKV8jwJFTp2Pb27DtRaLhs8KDW31eoK/0KyaHWsP6z/23NeAg/q5Gq9GxBH1ci7aHt14xyMZT6ZaksnQ/JA24gLaH3QGGqyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 BL3PR11MB6314.namprd11.prod.outlook.com (2603:10b6:208:3b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 07:40:11 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 07:40:10 +0000
Message-ID: <2298dfdc-f17d-43e5-9fe0-bffda4f50690@intel.com>
Date: Mon, 16 Jun 2025 13:10:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/hwmon: Fix xe_hwmon_power_max_write
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
References: <20250616071133.458363-1-karthik.poosa@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250616071133.458363-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0356.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::8) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|BL3PR11MB6314:EE_
X-MS-Office365-Filtering-Correlation-Id: 04bdd63d-06a2-445a-0fae-08ddaca9053d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUpNcVd6M2FGNVNZbGJydGRFcnBSakV1ZytOdzF6Q1dPM1RMRWw5OU5QdGkv?=
 =?utf-8?B?MXZvYVFKQXNhMnlHSFlHb09RLzB5cDFFVkVZZGRUYkEzUFBPZy9OaDg2N1Bx?=
 =?utf-8?B?ME9iZWpadGNDRWtFT0NPdVZLTlM5ckRBRHk5TXVCbzkzN3IxQ1dkSWptR3dr?=
 =?utf-8?B?WlNMc2pwMitvZGZDR3lwSS9ZNGg5czZ2TlN6VDhwS3NJRHlZaHZyVTJWUENK?=
 =?utf-8?B?ZEQ4OVVvNjk3b0MzZDlobUJ2OG11TW5yYnFkNlZwYW1hSkRUc0Mza2VSSkpR?=
 =?utf-8?B?MjkyV1ZsTFZHd1Q4azdZWG1jbUZIcmt4QSt6N2pnL3ZlNzNjUmxuOHZjSEVy?=
 =?utf-8?B?MlZ5RlBHS0VKcWE2VEZVMVg0RnpaMFJqQXRBU0hWZVJSalBDNkU1YVZtWUtz?=
 =?utf-8?B?MDZ0Y01xUXZiS2JCYWdjWXdJNTE1bjNmZ2ZUcFRlcDJBYXhyclFndU85UlFx?=
 =?utf-8?B?U0NWZDMxS21PeldvUXFKaWNaYmJnUFFiaW5EVEhZY1lwSFhsb0ZyVEJjV1Bm?=
 =?utf-8?B?T3hPOUtUc2lRdnNuOEpCUUI5Z21HMHN6TWtmYzd1cnRDNXNhREJlL3VIOUds?=
 =?utf-8?B?VnY5RVNCRHVOa2hsV2NBSTY5aVZnMGtJRWd6Y2V1eERNQjNtNlE1emFCSEhp?=
 =?utf-8?B?K09ha0hJVDNxVmg1eC92SmtVRk5lMlZlWE9wdG1iTi9TcnhpR1ozY1VYQ25i?=
 =?utf-8?B?LzdUQW42Q1lWTlRHMXhoU1lkb3E5bytKMy9NOGY4THNSbmNrdGFDR1B3d25p?=
 =?utf-8?B?UVdDMkpRQTFNTk9sUlZCZTM5YVFLb0lZSFp6emhLT29tOFdINWdROXRUWmxV?=
 =?utf-8?B?Mjg3dXpacDZ5VEJTMWpCTUFnZncza0tucmR1L0wvMk9IOEN6aHpFZlpFM0t6?=
 =?utf-8?B?Z0ZDQ3UxNnk5QkFOUkJOS3IyNStXSTYxWW5kZ2ErSDlCRUFVRXhFK3VsUE0w?=
 =?utf-8?B?RGlWQm9JVm9KUUVpc0tka3F1di9aRi9MSFZML1l5ZVliTzBmN281RlZRWFlE?=
 =?utf-8?B?NWRHQnFBN1ZDclJqTHpLS0RKVXJtbkljVEsrZWgyTWkyRENHejJhMGFsTW1O?=
 =?utf-8?B?SkJCZUNVdlpmUFB2T0luMnMrVVhhOXFwZGs0S1Uzb1NOU2RkUlRjQWtWVjlX?=
 =?utf-8?B?V0taZGZPT0dEZlNZMXhnNlgzRWYwOXA3dFZxOG4yOElrM3ZEd0xtbm82VE1i?=
 =?utf-8?B?eW94WWZMZUt5UG1iejg4a2pDcnppQm01SnJRNThLS0dqNzYwbXhQSFV3RmdO?=
 =?utf-8?B?eHR3Uk1TejhlaWtKdEhZZFA1c09vK0xWdCtVZEtXakhFbHBUVWNZeVBuTjZF?=
 =?utf-8?B?SDJDYnI3bkR0MTR1cCtRSU9mN0xJYnRlRTNuck9ZUkpzYTFGQVYyQ2VjUElV?=
 =?utf-8?B?TkN0T3N3ZmJzU25vY0lOcHJSV1VSVXRONGdDbkhBa25lRTU5dHNFdXlKWktQ?=
 =?utf-8?B?T0Qwa0lVcGV3akhFZTRldXFhdDRmU1d1R2trYnpRc3hRT0VsSkN1ZVJzM05B?=
 =?utf-8?B?bzJBaVcwQ0Naek1HUTk1ME9NaktIT3hFYnBvSDhXMjlUeVltNGpublJySE45?=
 =?utf-8?B?aUk3bklEVFJwakdoSWZGSlpJZjRHVkhUK3pnSDVVcWxyUzFwTGtrZ3Y2Yzc3?=
 =?utf-8?B?akwwYk5iR3lHdnRUS0swRENadHJjNlMvSWg3WTdIK0FsWndJNTl1dStjb0sv?=
 =?utf-8?B?YXZsNUFvTWM3ZUJGODdPS2Z0RTNvbmJzT2JKS1JIU3J1a1p0b1VsRElnOFMy?=
 =?utf-8?B?U2ZsQ3VQWWY0aWpjQ1pRZC9JR2tFMlBvcU44dDhIOXpnbWJzd3RGQ2pIYStm?=
 =?utf-8?B?Y2llQmQ4dDREMEFHeFQ0cWk1amVzTjN1NTU3d3Q2ZWV2RHhvblVlZnJqUGN6?=
 =?utf-8?B?NDBoVWZmUnRHVFV2MnVpNm02cG1WZkhhUk5idStoeVFGYlk4R3ZtNGVMRVU4?=
 =?utf-8?Q?bF8A90Ef9Cg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnZYMVc4MjYwak43MzcrOWxJbE9XeXphdEY4L2V3Q0JPWGlaMGpZbkl3R0Z0?=
 =?utf-8?B?Zkl3Ym5BUm1Xby9HbjJtdFpBWXJpNnJMNlRJdWFSeWNVWDBkZWdIYThnajh3?=
 =?utf-8?B?WGIrN3BqVUZ5bGxPZXdLcTFybXVPd2tZRGt1YVI5d3hpVUVnQWVaWktneU1X?=
 =?utf-8?B?MlQzRUxaTnZ3Z0JYQzE1aEZIYjY4ZnNycTArZlVXNWtKY3I4N3ZmQzZ6OTZv?=
 =?utf-8?B?RjFoc3dPeEs5SlBnUWxSVzhiOGJ0VlE0SEE1YUxlS0pmN0pkWk1zVWRHNm8z?=
 =?utf-8?B?WnlpbkViUjN1S3ZqYUVBR21OdVk2VDFEK0pFTUFCdzk3TE93YVA4blQ0SGMx?=
 =?utf-8?B?bjNkcHFrWkNOcXFDY0dVWUd5U21HK3IvNkZoajNTMkl4RzRBdDZkNnQ1REc2?=
 =?utf-8?B?Z0NiaTZQZkFuRW5DUTU2Zk5IOHdjTm40NllnVXVvNEl2eFpoZ2ZCcmdjT3VT?=
 =?utf-8?B?Yk15RDFSNmJnNjBYZkdENGF6Yi9VQXNRKzlBc3hpSTV3T0tReGF3Q2tOTlRV?=
 =?utf-8?B?Q2xaN0haU2ZDdFpsQnNKZmU4WCs4cmJaUW5aTWhSN0hpc0RNaVVIOEFYWDg3?=
 =?utf-8?B?bW5ncnZkaWVMUk1PR2FmS2lLQ0xjc2lldUNuNDl2WnEyY0pOUUNnRmJkdWJw?=
 =?utf-8?B?ejBIOUZFZlV5TFZLWmVzU1dkbHZ5eWtad29jT2ptbUpFSkZwT0ZaQVVrZ25T?=
 =?utf-8?B?ODhPQ1k4YXhpQkFKRTJjSFR5bUcrdTNUZG9SYlJoN1ZJcEVkbXloVmdld2dW?=
 =?utf-8?B?VTRFMytUbVBISFZRRTdvOWRpVkgyOFpNZzJJVGhpSW9HaGhDS3M2b2hobjdT?=
 =?utf-8?B?R0pib2NXdmdvQU5PVVdIaXN6Um5CTGZFd3FFaFR5SjVEKzUwSXA4NzBTbHkx?=
 =?utf-8?B?WjlsNEpuOGRHNlV4cVIrdGRkeXAzL2JyQmtCZjU4aWlyKzhMMW9hSGQ5U2Jj?=
 =?utf-8?B?RmRxN1h4N1JOKytzZVJoS0pKV2xVYXBxT01vaFRhVkFnenIvTFY1bmRSZjlP?=
 =?utf-8?B?eC8zUW96L0c3YzIzZlB4eVJ6Sjc0TjRxUkpZcFlnaFczWlBpODBMelZVbVBt?=
 =?utf-8?B?blJzcjlWdVM4VmJtQ2VQZWFHejhLQittOVlHdjV4MUhnUmVpOHNRZnNyNHNE?=
 =?utf-8?B?dWxPaFJkbUJaYmFSa1VBNVEwT0lTNG5IaGZ1U2p6bFR3azEzSmptNVhYVjVl?=
 =?utf-8?B?bTdXTnpKNWtZVFNKUXY2eUJVNHpqRXNFbExOZEpRZ041aWkrNFhKdm5XN25R?=
 =?utf-8?B?YXI0WWRwdzhlS0RaVjlrK2ZaN0wwMUdhVzMxekp5L3h5WVJBNlhKYWhmQ0Qy?=
 =?utf-8?B?RHpZbjlIU1didzJTNEtHeC9kMHVBcUxFNzNsNkdZVFp2MTdPVEpxM0lWY1d3?=
 =?utf-8?B?MGs4Q1duYlNremJWSlFTeUR4aG1VRlVyd0lhaWlieHdqUUlHVjJlQytoY2g2?=
 =?utf-8?B?SkFrQUdQSFBhYjNndVFTZVhKU0hZTHV4U2REbS9aeFk2KzRrQk0rWkVOWFVj?=
 =?utf-8?B?WTBUL2RPM3Fvb2N4MCtDSVVLcFpDdEduZnAzRUFDTW5LclR0S3dyZm5xdHFr?=
 =?utf-8?B?UUhZSHg1Yk8wWFVuNG92OGVTVm1ZWjRrNWJvMGkzTXhGVnlvbDlUMEFObHJG?=
 =?utf-8?B?a0cra2xRbWMwWU9qNmNrdnhXeU0zclZudUNhelhUb0RwcFJqVGsydUZlREJR?=
 =?utf-8?B?RkV0SVR2ZEVLeHVaUllrZC9jK0ZBdGNKTHBoYTMwdjd3di9PWlROVXloeTJx?=
 =?utf-8?B?SmI1dmRSSWxzKyt2U1Z5dEo4NmpacFV4OGgrYkpoWSsyM0JNRTRKNGRYc0NW?=
 =?utf-8?B?Y2tCOXNBVTNLSmlMZ252bGtndTRYTG5hQzhqNmlIOUpZVmdCOU5NNnpoaG5h?=
 =?utf-8?B?MnpDUUdnOVc5cUhoc2lOaDRPUmRyei9Sb1JrcWRPVXJ3ZGhFT2ovbFpFcnE0?=
 =?utf-8?B?ZHZ3M2o5N214R1VTWEZkYVBQMjY2YW5CT2FqQlNxZVc1Q1UxSUVmQzFSTGtM?=
 =?utf-8?B?aTUxcG5oT0hvM1BrSEdCQWVBWWJSL2JHNTZZWHhJaVQ1SzF6WHlFaWl5elFK?=
 =?utf-8?B?YmZsdXFQcXRQR0tYcXVXWTBJQXVITFkvQVRyZWpoTElnV2lnaTVOUzhLSVBX?=
 =?utf-8?Q?f//wcdA2K5QE1+B0LB1z2i/ak?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04bdd63d-06a2-445a-0fae-08ddaca9053d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 07:40:10.5540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EGbq+oJGX1roHDf1cZ94A7OmcX59QpbpvhVzSzPsY6/oGXBZyfo+rEUNLiiR/Eb7stBBcf35OMzPYpCQ+oaC4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6314
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

Hi Karthik

On 6/16/2025 12:41 PM, Karthik Poosa wrote:
> Prevent other bits of mailbox power limit from being overwritten with 0.
> This issue was due to a missing read and modify of current power limit,
> before setting a requested mailbox power limit, which is added in this
> patch.
> 

Since you are making changes to power interval also .Split the patches 
into two. One to add rmw and make changes to existing code. The other as 
the new fix.

Thanks
Riana

> v2:
>   - Improve commit message. (Anshuman)
> 
> v3:
>   - Rebase.
>   - Rephrase commit message. (Riana)
>   - Add read-modify-write variant of xe_hwmon_pcode_write_power_limit()
>     i.e. xe_hwmon_pcode_rmw_power_limit(). (Badal)
>   - Use xe_hwmon_pcode_rmw_power_limit() to set mailbox power limits.
>   - Remove xe_hwmon_pcode_write_power_limit() as all mailbox power limits
>     writes use xe_hwmon_pcode_rmw_power_limit() only.
> 
> Fixes: 7596d839f6228 ("drm/xe/hwmon: Add support to manage power limits though mailbox")
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h |  1 +
>   drivers/gpu/drm/xe/xe_hwmon.c            | 48 ++++++++++++------------
>   2 files changed, 24 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> index 5394a1373a6b..ef2bf984723f 100644
> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> @@ -40,6 +40,7 @@
>   #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>   #define   PWR_LIM_VAL				REG_GENMASK(14, 0)
>   #define   PWR_LIM_EN				REG_BIT(15)
> +#define   PWR_LIM				REG_GENMASK(15, 0)
>   #define   PWR_LIM_TIME				REG_GENMASK(23, 17)
>   #define   PWR_LIM_TIME_X			REG_GENMASK(23, 22)
>   #define   PWR_LIM_TIME_Y			REG_GENMASK(21, 17)
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 0d32e977537c..fa841311bdcf 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -175,8 +175,8 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
>   	return ret;
>   }
>   
> -static int xe_hwmon_pcode_write_power_limit(const struct xe_hwmon *hwmon, u32 attr, u8 channel,
> -					    u32 uval)
> +static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr, u8 channel,
> +					  u32 clr, u32 set)
>   {
>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>   	u32 val0, val1;
> @@ -195,9 +195,9 @@ static int xe_hwmon_pcode_write_power_limit(const struct xe_hwmon *hwmon, u32 at
>   			channel, val0, val1, ret);
>   
>   	if (attr == PL1_HWMON_ATTR)
> -		val0 = uval;
> +		val0 = (val0 & ~clr) | set;
>   	else if (attr == PL2_HWMON_ATTR)
> -		val1 = uval;
> +		val1 = (val1 & ~clr) | set;
>   	else
>   		return -EIO;
>   
> @@ -342,7 +342,7 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>   		if (hwmon->xe->info.has_mbx_power_limits) {
>   			drm_dbg(&hwmon->xe->drm, "disabling %s on channel %d\n",
>   				PWR_ATTR_TO_STR(attr), channel);
> -			xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, 0);
> +			xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN, 0);
>   			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
>   		} else {
>   			reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN, 0);
> @@ -378,7 +378,8 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>   	reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
>   
>   	if (hwmon->xe->info.has_mbx_power_limits)
> -		ret = xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, reg_val);
> +		ret = xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN | PWR_LIM_VAL,
> +						     reg_val);
>   	else
>   		reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN | PWR_LIM_VAL,
>   					reg_val);
> @@ -591,14 +592,11 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>   
>   	mutex_lock(&hwmon->hwmon_lock);
>   
> -	if (hwmon->xe->info.has_mbx_power_limits) {
> -		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, (u32 *)&r);
> -		r = (r & ~PWR_LIM_TIME) | rxy;
> -		xe_hwmon_pcode_write_power_limit(hwmon, power_attr, channel, r);
> -	} else {
> +	if (hwmon->xe->info.has_mbx_power_limits)
> +		xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, PWR_LIM_TIME, rxy);
> +	else
>   		r = xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel),
>   				  PWR_LIM_TIME, rxy);
> -	}
>   
>   	mutex_unlock(&hwmon->hwmon_lock);
>   
> @@ -1217,25 +1215,25 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>   						    &hwmon->pl1_on_boot[CHANNEL_PKG]) |
>   		    xe_hwmon_pcode_read_power_limit(hwmon, PL2_HWMON_ATTR, CHANNEL_CARD,
>   						    &hwmon->pl2_on_boot[CHANNEL_CARD]) |
> -		    xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
> +		    xe_hwmon_pcode_read_power_limit(hwmon, PL2_HWMON_ATTR, CHANNEL_PKG,
>   						    &hwmon->pl2_on_boot[CHANNEL_PKG])) {
>   			drm_warn(&hwmon->xe->drm,
>   				 "Failed to read power limits, check GPU firmware !\n");
>   		} else {
>   			drm_info(&hwmon->xe->drm, "Using mailbox commands for power limits\n");
>   			/* Write default limits to read from pcode from now on. */
> -			xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR,
> -							 CHANNEL_CARD,
> -							 hwmon->pl1_on_boot[CHANNEL_CARD]);
> -			xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR,
> -							 CHANNEL_PKG,
> -							 hwmon->pl1_on_boot[CHANNEL_PKG]);
> -			xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR,
> -							 CHANNEL_CARD,
> -							 hwmon->pl2_on_boot[CHANNEL_CARD]);
> -			xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR,
> -							 CHANNEL_PKG,
> -							 hwmon->pl2_on_boot[CHANNEL_PKG]);
> +			xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
> +						       CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
> +						       hwmon->pl1_on_boot[CHANNEL_CARD]);
> +			xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
> +						       CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
> +						       hwmon->pl1_on_boot[CHANNEL_PKG]);
> +			xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
> +						       CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
> +						       hwmon->pl2_on_boot[CHANNEL_CARD]);
> +			xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
> +						       CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
> +						       hwmon->pl2_on_boot[CHANNEL_PKG]);
>   			hwmon->scl_shift_power = PWR_UNIT;
>   			hwmon->scl_shift_energy = ENERGY_UNIT;
>   			hwmon->scl_shift_time = TIME_UNIT;

