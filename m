Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBF4C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 19:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157B410F73F;
	Thu,  3 Sep 2026 19:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NSuJx5+m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF3B10F73F
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 19:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788462005; x=1819998005;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/QvN4xBsiex2U9fqMkhNDlG70rlGF/TPl86j+owfroA=;
 b=NSuJx5+m7sTy3Npp+DSa+ArJeh23r8c+BRlKJwLkBpKxf2VA3gzH2Jwb
 U/SWmoGKwZ6tHD+A59bdDApLcpC1gKz2cniul/a4dYy1LvFdVYBstlpj8
 +DvK8Kqy8NLnOFMVZuHCQ0X4J608U5maz5Nf7RxmBA3hJRnr0ZXbXPzWf
 RIV23bqG5HkPbmIeQXefDSt0NkwF4EJKZQKq0TutYxiAgVSoNeVG3xfdH
 p3rog0zaIUY8nDklaY+5s/bdrjqydX7SlJ8BF3gHkCAmTLisjyFC257sI
 7nGLRQb29jcPp4BTbS1qShjZJx1kw8aASAeENSZu24OJvG9wuecMvyWXl A==;
X-CSE-ConnectionGUID: y8is+drtRA2LCLEoY2nILQ==
X-CSE-MsgGUID: q4gdpEaWRjyJ3i+AdccObA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88977338"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="88977338"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 12:00:04 -0700
X-CSE-ConnectionGUID: i5lT6uu6Q5mCx40NlCIG1g==
X-CSE-MsgGUID: zyHmzj5tTNmj2AYuP7jmvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="294679153"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 12:00:04 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 12:00:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 12:00:04 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.65)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 12:00:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cI0MGStcT/ZYqTbzGI0VLAZT+7fHzeDA7qdKH5u99VDdTJ6c8U7YNhoX7Uy4w0OlBGgtFXyLy5x76X3TR/f9lfRYr+jBe8c92Vw0c1g6JXIvxRJDpD+7A6XzTYvpBody5stALnCE5rh39A4tr1OK4X7OpPhCZAxgetJL0eIoVn5i8+4rdNERyQ8gkMIz9zWq1veJIgLFGJIDFi6Nt6Hf5wgiYtMtO5CsO74pilR9FQ6UrFsED8bByqKksqb90Upm7nPTalg9ijza3+0jlvCsq/eILu1MuYCLh/HC3nbogio+xvt62el/wcna7Kp270lYtgagpgkKCL+FQWVdmFlsYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtURiLvmw+9tNt4noFgx//39FwjE5IKx48I67XUI/3k=;
 b=BhUKR1Sq5VdhkCmEtqcw66QPFSdVgNm5iLer2LK+FkBA6htfbOQ9gly/WW2ypzDCJEQ4qcSUwoaL0cwSKnyNbjrlL2iNQxdIyz/UWcCsUUTb6Gq9ZaQmkFtiZ986hJyQJS9yyr5gS+9aY7QTHRNL5610UDpKdY9WWjkx7XjyL9iTJmnOBLAwvCbbLySRT90RwtKEnUUWlqSMVKFwZ44MH6pbMpAu/igMeC74rj4Lp3zKmx6GEm+HP1yIPbQovXXJ0mofzFn4rxDD2hlVLRSgqVvXUJjz8ArfhqSL/BZaUGkc4OeDObb2gWKppvkLGZxOLH+6oDXC/S3IohA6Dj014A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW4PR11MB8265.namprd11.prod.outlook.com (2603:10b6:303:1e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 18:59:51 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 18:59:48 +0000
Date: Thu, 3 Sep 2026 11:59:46 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Zongyao Bai <zongyao.bai@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jia.yao@intel.com>,
 <matthew.brost@intel.com>
Subject: Re: [PATCH v5 0/4] drm/xe/forcewake: add delayed-release optimization
Message-ID: <apnDogYw4G6bXNlh@soc-5CG1426VCC.clients.intel.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260813000654.2712317-1-zongyao.bai@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260813000654.2712317-1-zongyao.bai@intel.com>
X-ClientProxiedBy: MW4PR02CA0029.namprd02.prod.outlook.com
 (2603:10b6:303:16d::34) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW4PR11MB8265:EE_
X-MS-Office365-Filtering-Correlation-Id: 22bcac44-0037-4645-0d46-08df09ed86d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|11063799006|4143699003|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: yn+hneyrRcEdcSaBY5g232vpQObHt8U+S10Qe87z2UAXN5qtE/y5vz+22pmKUxLUhr4r1AUyjkcsqJauljNG26E84MWlY45DvDnMNX63VuQ00mlLXjWqQssdut/rYhcXR9BuselkjYZHxYSucaiAx8nYTffglEI4OoxjT1eier2NoYLEN+MrlX6bTGjKhX36qDfzr6FIZou87F+21k5qIkX7nhDxiympRds/pUYkI6fgqmVH/D/o4IRIbSBf/dFd7mhPVF48FnEAF3Zx/b5AEotwZYsUhLnOO8Y82gmgAXXvxDH01/U9PlHPQpCBSssMdGMkIyLEQ99b9HlijE4CkVwu8PqbhDHLRcxjyB8NTxK/aefAyG6qXom09qH7krKuZ4OgZviXGj3MknoWNh9x984E6EM/dD3LR57HvHPVGAcGSdzPzz6beV1H4xC+BZvyeSX70wXjD3JIJR2NUUW97s9pxXVasX7zc0rquCFkzWimij7NwskW+rWsBboNYtlzl77+zk6vve0gWs3RlBXtqIx7l4VVY9NDEEJeHT5gfb0KSz66hd0XGxeC8IlbJnOutZrKsnxtLgknqTaKIj8IoKEZfzqPzuIuM/4z7i8cud+11Yt+s5YVw2LpJMdcCcXbz+qx14pRtWuNuoAOt8vfE68YaWt2nhWejsW/N3HMCHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(11063799006)(4143699003)(22082099003)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjdRUi9rUHhuUythTC9oMWRHODNLTGJWTXp5d3dRUE5vWFcxZjFUL2FCVXRJ?=
 =?utf-8?B?ZDArV3NYR2tIVGxvN3JsRHVwOTRUaGlRejlNRytQYVBha2lEOFlpWURBdjls?=
 =?utf-8?B?SlM5L2dFMjZIMFhyT1dteXpPWjdPNDJxZFBjOXF3RGU4c2duSEFHb3I0YXJK?=
 =?utf-8?B?bDFNV1VGam45T0t2b01BZ2RqSHJnNUJWeHJTUXBqTEFUaXV0NXVFS2d3WmFI?=
 =?utf-8?B?SXJFUWdIK1lLVGhNaHhydGVRV2Vrd250aWhZZE50eUhFcUZNOStCam1xaEph?=
 =?utf-8?B?Yk1JRkFpV2xBd3MwLzhhVnhyM2o2bTRDZlRzMmcyTDBmeXlPTTdOdVVmQTZM?=
 =?utf-8?B?MXdDQVZFZzd1MDk3QlB1OFZhaThyNW96VHYvQ1UrakVxRlNrakUvcmJhV0Ey?=
 =?utf-8?B?aW9UcDZVU0N2Q0U0QWdmait0RG9xZmRDTTJCajRDbXViVitRR0g1ZGppSnNY?=
 =?utf-8?B?a240UXRtVVRXV2kxR3NSdFFtaGh3WmUxeitFMkd6VkRVVUdxUncyRUcrMWtB?=
 =?utf-8?B?MlM5MUJFMXd0UG05TnB0eWVIVEQxSlpMMklJU0pqRVRoaWQ0RDRkb2xDckZL?=
 =?utf-8?B?cjhZZjFpSkJDeXZlMWllTEQ5NEFBZFI2YU4zSFQ2YjhCVW8vWXpaZU1IOXRq?=
 =?utf-8?B?bmJ0andWVWN5NGF0QzNNb2dFbkFVSENUYldmTm5Obm11dmtsTmVHQ1Ztc0Qx?=
 =?utf-8?B?WldUU0d2NDJNQm9kYjE3YlozSnJyK2FDeWhzNW5LeFg5eHJNR0tIRmlVVzlQ?=
 =?utf-8?B?V25tem9FMHNScjRVLzhncTZCS2l3bTBVeTh4SFVkakxxSHk3MURUa1Z5eklM?=
 =?utf-8?B?bGdTMWRhTGp3YTVlRUdkcFR0N1h5dGNUenhIYWZXaEdyR2VoU2NjTXozamdk?=
 =?utf-8?B?a3RzeFBMajVqYXNCOWg0ekl0VXlobWFGZEZWNmxHN25veE9OSENqTDZlQXBO?=
 =?utf-8?B?aXYzd1BDbk1hWTdLMGpKNG81ZE9vUmFhK2c1T1dDajNnelZIUXEyYm42RFRE?=
 =?utf-8?B?T0NwWktiR1BWU0RaZmVBZXZpQlBPSm9MWEs1cTY1am51ektuVHp1bDJvYjVC?=
 =?utf-8?B?OVFXUXo2Zmo4bERHcVJQSjlUT3ozQlZXdm5XWFhLWnFXSnhnZDAxYVBtNm1p?=
 =?utf-8?B?YW9xZDZuNEF5QmNjSVNWbG1IeTZZcXRrRVFQQytHUjN0TUd6UjVXQ2VNamJL?=
 =?utf-8?B?QmFpNFJnWFJ5c0tscmhMZTFuWm8ybzFOTS9RMlltRkE2Z3FjdW11ZXRMa1l2?=
 =?utf-8?B?VmdWZ1RoeHRzS1NUdmV1eDNyS1V0LzFGTXQzZkhUMTBtazlENkVacWV1dWt4?=
 =?utf-8?B?Y0Yva2hzNDhzL3lRdFFQeUdKVTM0WEZWUWJ2RjgvV3FrMkUxc2ZoL21sWm01?=
 =?utf-8?B?TVUrWnpLejVocTU1U3VwUDVQSFNLS0w5TVJUWkRyN2tEUllGV0VtSTNOazB5?=
 =?utf-8?B?Z2VCR21ZYlZJSXNJQ1M3bVh6eDFDcHdvYXhTejI0eWh2MFZGZFRWRVkvY0s3?=
 =?utf-8?B?Wmw4anJESVNNWGVlUlp0aFYzOUxBWDUrOHM3VDhFdDdaOE9UdUZIYm1MVmRn?=
 =?utf-8?B?Qnp0SGtlY3dDbVgvS3dWSUpGaVBIUFR5RjZiOEF5Ri9yeWtnZ3plZGZGQ2tI?=
 =?utf-8?B?bUdnLzdyZUNPUXFSVWtoZWJMS2pCQ2JuR0JET3l5QzRRK29sMEtUNEhlWU16?=
 =?utf-8?B?ZGxUbWFiRlRkVXduZndLTXVYYmI2Qmo3K0prSjVCSk1vSTdiZHBTVXRWMVdi?=
 =?utf-8?B?NlVhR0NFQUM5WExpd2U2SGxNMVpPR2ZpQkd6bjN2emdac29ZYUJlZnUxNkdW?=
 =?utf-8?B?L2RKQTNWN3VlYUpXcGJMV08zakJyaGpEajk5amN6RWFNcmMvak5CRjlxYm9j?=
 =?utf-8?B?Smx3RkV4VmlqaUZiT0x0SUR0S2IwWHByT28ycE5BSkN4R0htQnp5bk9xb2lD?=
 =?utf-8?B?NmJXd1NmMG1TVTlSWitBTXc5SjJ5dVVrVVM4blJlZVlOc1VBRlRzbFozWGlt?=
 =?utf-8?B?ZDZWOEFRMUd6SFBZYldRcFZXWVplL0w5Y2NDaG5IakxPY3lsRFRQUzQwaEh3?=
 =?utf-8?B?dkVIdjd3U0I4NTltcXN0ZUJZMStvNUI4MFlWZWl5WThUbkR3RlV6dVdSNjdF?=
 =?utf-8?B?LzBIMVdMeWF5YlVHWld0S0huOUdqL1hqaERJNmoxZnJveldDT01iR2tXRHRk?=
 =?utf-8?B?N04yejUrU3pRYnRDWjZpMU4rbDdXeDYvbmxhK2oyZDl1alpRZ0hpTng1RVBC?=
 =?utf-8?B?eGl6QlNtQSswZXVnYWRHdFhpWm9SbndodDQ3N0lGcXNHL3R1cEd4cUVSSFI2?=
 =?utf-8?B?VnpvMSs0ckVuR0QxQ3RWZXpTbGdpVXZMRE1NaEdxZDh0V1FtY1llT3p3a0JO?=
 =?utf-8?Q?qmoX0cR2UeFhI2rqAYmxZ8xWi1m4sF4BInsuP?=
X-Exchange-RoutingPolicyChecked: PHg2/3mFAxu6m3M9MvTKR3loceuTWvyXWusNNI9YoilUn8Dp6zs4QKxB8aaU47udS7ajGeO2vpMLCL5XNk00DSoAOoJlIHOLc6nSgFTtTHPIxFd7QD7pWe5eKtD/POzXmrkXflsw/RvWptqlq3jqsx3l6RT1RKV5uiLvT2lDV+ymH9pRnePa8sb/f1oECVFSs3uS3Ndg+hzphg3moZaqu+iPV06OA/jjoJmI7NFBHW4ATU5AUyjPzN/oiSFOgoAooKbdk6AYiOIwMyAqZakT5ThjpECsv9muCzW3Fsg+iRcUbv1dTsIotJD9U4fku5gPmH9XqXhMbBK54vszmrJqvg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 22bcac44-0037-4645-0d46-08df09ed86d7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 18:59:48.5995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0jV/UjL5wuLzROC4LN+4BEuUaDAQDUP7NE/A7AAYM6wuq/Wy1BFk8x+mf5pCpJc+BFZlKpTr49A2yFPyy0UGc5TR8YY0wxDXtZNIB5rbNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8265
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

Hi Zongyao,

On Thu, Aug 13, 2026 at 12:06:50AM +0000, Zongyao Bai wrote:
>Engine-cycle queries used by tools such as VTune and PTI can arrive in
>bursts. Releasing forcewake immediately after every query makes the next
>query issue another wake request and wait for its ACK.
>
>Add an opt-in delayed-release path that keeps an idle forcewake domain
>awake for a configurable interval, allowing a subsequent engine-cycle
>query to reuse it. Other forcewake users retain the existing immediate
>release behavior. The default hold interval is 100 us and can be changed
>through configfs before binding the device.
>
>The series also synchronizes engine-cycle queries with unplug and flushes
>pending delayed releases before suspend, shutdown, remove, and probe
>unwind, ensuring timer callbacks cannot access MMIO after power-off or
>teardown.
>
>On BMG, this reduced the Level Zero timestamp median from approximately
>48.5 us to 9.4 us.

Can you please add some more info here on what this measurement is and 
how this is affecting the VTune/PTI use cases? In other words, what 
breaks if we don't have these changes?

The purpose of engine_cycles query is just to capture CPU and GPU 
timestamps as close to each other as possible and then the user would 
use that to map the two timelines in whatever they are trying to 
correlate, so I am interested in understanding the use case that this is 
improving.

Thanks,
Umesh 
>
>v5:
> - Split the original patch into four patches: unplug synchronization,
>   delayed-release infrastructure, power-boundary flushing, and opt-in
>   enablement/configuration.
> - Preserve a newer hold interval when an older timer callback is running,
>   and settle an outstanding sleep ACK before waking a domain again.
>   (Sashiko, Matt)
> - Synchronously cancel delayed-release timers during forcewake cleanup.
>   (Sashiko, Matt)
> - Flush delayed releases during shutdown, device removal, and
>   post-registration probe unwind in addition to system/runtime suspend.
>   (Matt)
>
>Zongyao Bai (4):
>  drm/xe/forcewake: synchronize engine-cycle access with unplug
>  drm/xe/forcewake: add delayed-release state machine
>  drm/xe/forcewake: flush delayed release at power boundaries
>  drm/xe/forcewake: enable configurable delayed forcewake release
>
> drivers/gpu/drm/xe/xe_configfs.c         |  72 ++++++++
> drivers/gpu/drm/xe/xe_configfs.h         |   5 +
> drivers/gpu/drm/xe/xe_defaults.h         |   1 +
> drivers/gpu/drm/xe/xe_device.c           |  16 +-
> drivers/gpu/drm/xe/xe_device_types.h     |   3 +
> drivers/gpu/drm/xe/xe_force_wake.c       | 211 +++++++++++++++++++++--
> drivers/gpu/drm/xe/xe_force_wake.h       |  46 ++++-
> drivers/gpu/drm/xe/xe_force_wake_types.h |  68 +++++++-
> drivers/gpu/drm/xe/xe_gt.c               |  12 +-
> drivers/gpu/drm/xe/xe_query.c            |  36 +++-
> 10 files changed, 437 insertions(+), 33 deletions(-)
>
>-- 
>2.43.0
>
