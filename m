Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEADFEE57D0
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 20:12:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBD410EA8A;
	Wed, 11 Sep 2024 20:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H64V+96h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A79010EA8A
 for <Intel-Xe@lists.freedesktop.org>; Wed, 11 Sep 2024 20:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726085547; x=1757621547;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OB6rQIftn+ii9OpwnY8lVon7OEGSxim8rHzzPx/gvbs=;
 b=H64V+96hNRB3wfl+0K7+q1Od0y/4IQKHRVd/wjHdinQ9cr/egljA9+n9
 FnNVP47HJQ0O7O7USA0BMeJn8/YPUHmytvu4WoWU+4yIB3YHaaqbzTtaU
 Hs52/mPLMEc/WyW1r44s+/Ken4pDuNxpcHeHEp4vSxo6zJDsKRD+fZdSD
 9ffopcGnGLvlFBoB4yO6W1UBgDX6gG1gs0VJuRIqMK+g8bQNKO5jTEJCv
 4jfLuU9MCfwSXpQuRbQw5fKlqwIjW26WfKmhuPh93xFYN3adWtBNwgDjM
 zdUIm2M1UWmEdDwmX66DceN5MbwGBIwCiAGB7aEEyz5ydUogEH0XqEAqb A==;
X-CSE-ConnectionGUID: k2spX8KfRd20k24M7lYvBw==
X-CSE-MsgGUID: 4Keb3BBETxqLPQd2QlVBAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24449052"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="24449052"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:12:26 -0700
X-CSE-ConnectionGUID: 02G3L6dTQnOwca/4Jd/PvQ==
X-CSE-MsgGUID: Vu9GzRi+QnGsD//KoADGyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="67783463"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 13:12:26 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 13:12:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 13:12:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 13:12:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVFCPqLCtCvfj8iphWSCsogXhH8BpU3C+4iYUCOiPdfpCaeg/rSl5xHeon5hi7wmlGMm32tfpbS/flUgR9W34mspsSykcb5SaUlMYsD9U0Ww38kl1zqKPWXnOipY+XvRpcSjfO18g5Zibz6eATp4UbLDLYfIzyfFXjxe/3Y/WF4/zz2beXusluWtpHWYXVbUFliGcJ7QmUFpFVw1eF7BKkjx660ttrV0Do8P//cBaAR1fnhnMXfiycBXAbG8ruyPQjA0teWruYUYXP+GgZH82kKcxwcnbOcdlrW7bbtPuHzknXeaBmUrVfszUmbBuijdsgODtID0jQO5rzIamuNI1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OB6rQIftn+ii9OpwnY8lVon7OEGSxim8rHzzPx/gvbs=;
 b=WEhhwfjINhDoAY8IPr3b71p2UNboOws3PziE8qpw7YzIDmTWz0z1TE4Y5+amzaiU9/rzoQz5nGjYiI/Hh+p3RQYAxgZQHmbOXMxJngLPICDRc7RHt+WJ3uXB9l89lu/sthxxNmC6kVvQ5wMAaPUC3wpxqbMoft2LZotsa1knMeIkUdxBMCBwE6r93FE0lG/aiup0SWVwyZWwBSw/bJCpDd1pS/yjO7SnKuVQntZsC7gaYTXPgHPJ6lTE7KfCcr8IjZSw2KCykGJNxlSlpL2sPBC2c/14sshS4arm3KGWurQlozw93SHj/2XX12cGVR0nxT3hqFxu9R/9CdzXXMT5ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by PH7PR11MB7027.namprd11.prod.outlook.com (2603:10b6:510:20a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 20:12:22 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%3]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 20:12:22 +0000
Message-ID: <efccf52e-dbb7-46be-9517-f92d2cdb6f75@intel.com>
Date: Wed, 11 Sep 2024 13:12:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/10] drm/xe/guc: Dump entire CTB on errors
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <20240905205106.1063091-9-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20240905205106.1063091-9-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0290.namprd03.prod.outlook.com
 (2603:10b6:303:b5::25) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|PH7PR11MB7027:EE_
X-MS-Office365-Filtering-Correlation-Id: d13cfbd8-f1d5-467a-6f05-08dcd29e0be1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NEJaUjhQTkUvWTFKNmFod1N6TmNpbHJQSGc5Qm9JVElQREFaSFg2OEozNG9G?=
 =?utf-8?B?WDdZZUk0RkZ2N1BYTXdlazRMQ3BzNlRTMHZnUWxrdFFOKzA5b2FpK2dJZE56?=
 =?utf-8?B?QkkwY1gzMitySXRzYi9la2hHTzhOazVrbVhwdGtudWtaZXVBYkdVOWVJb1pm?=
 =?utf-8?B?Z2I0YmFyd3ViOXR3eDdIcW9wSEQzaTVmUHdpWm5aSi9WSE1SaGV6d0lhc2VI?=
 =?utf-8?B?Zi95TmtqbHBHYTk4Qi9iY0FIMG94dXFaTEVITTlDQkpWNnVKd0tHbVNVTjFn?=
 =?utf-8?B?bXVOU09ZRElwQnhxY2YzMUlvckVqdVRlRkQvVXRBVkpWRjVacXZ3OUhyV2pQ?=
 =?utf-8?B?Ryt5Mk9uZjl5TVFPNW1KUkswZE5tc3M2ZTRqb3RBaVNBdG1NZlJ3VjhtSmVt?=
 =?utf-8?B?THY2SzdoK0EyZjIvb2lJaUJrdFg3cVNsS1VTamYyZE5SQUg4TEtzd05KOXRn?=
 =?utf-8?B?V2JSTktDVHQwR3hONWRsaG9kR2NuU1czY1NsL0dBUm1SdXJvVnd2bVVGZEdK?=
 =?utf-8?B?ZU01M0pkcTJ3QzRrTXVsNmV0WG1HSU5xcEJtSlFZL3JpaTVUeXFUazRmNzJQ?=
 =?utf-8?B?YjZLcm96SUhER1MxdmxpZ09sVTB5ZU92dW9QaHlyWWtvQ2JCbk1FWW5pMFlD?=
 =?utf-8?B?TFpoR1h0LzlGYlRqOVpnMjhuSUsrL1I4NFBQdTM4Qml2NGdjN0FtcEVORlZo?=
 =?utf-8?B?MHNqVHdqQjZ1eGhHUE9MaDNuN2Y0TzdlM3FhNmVTb256WnpVaTBaQjJqRUFz?=
 =?utf-8?B?aXFzRTBCU2ZwTm9ldVdUZ0oyZkIzYkg1TGdZU0xOWFl6YWg5VHVDMldXNzQ5?=
 =?utf-8?B?a3JtQ2JyYlBkeXczVUpDb09RRkpXQjBlY1JQeERCSlNPSHpYM1dVd1pDb25j?=
 =?utf-8?B?TWhSdDg2UURidEdVeDNtMFZyRHZXYTNCV3hyZ1VURFR0b3BuVDVacTF1Ynlw?=
 =?utf-8?B?cmh1MG51WDB2QmhoQThvSWUwczVOYzVTL285cXh5S2JCSVdTYkpTUSsyS3Vo?=
 =?utf-8?B?ZHEydUFGS0lSank4Q09BTGpmZStiL2YyYVhkU1FwRmdFbFcvZXV4eEJybHR0?=
 =?utf-8?B?MkQzVXpsck9zV2h0c1VBSVk3ejQyTlEvZ2kvMXRkS3dsWUhTYjZ4czQzZ2d1?=
 =?utf-8?B?M25BNytXZTV0OWRhc1I3QXdDdGdCamtBc2o3dWl6cXdCSUVBcWVwUjY3Vjhy?=
 =?utf-8?B?b0FqdzJEYndYcDJncWZ6MzV2N29GS1lYUnI0cHdLM0RpM2lNQkdGMzBCSjFK?=
 =?utf-8?B?OUZGQzBiaVdLdU5wUXFJVzNCN2szN01QNXM4RVdLVGhKbHpVV2pzV1YrenRv?=
 =?utf-8?B?VzMwcWNaT0YyeURxcXZUOE91dXo1U1ZLNk4wQmliYkZ0bytHK1diTDZyK2Nx?=
 =?utf-8?B?Ykkyb1hDQTc5VlBVdzJ3dUNsL2EwVE92anZhaHRqUzBiOGVTSlYrVkhzMnJs?=
 =?utf-8?B?NmI3Smc3Q1FsQkl6VVkvZGxoL0hNV0VKUHlKZi83ekYwR08yVk1YaWpFUWx5?=
 =?utf-8?B?ZXB4YnIvNEt0aFczajJvbnRVRWtsdGkwMG5OdWh1andYSE1HSHlXRWlxWXRR?=
 =?utf-8?B?clQ5SjBjeklNMTdzemZXUmszbkZDTHpYakxTODR3MDBRRC9LRXpkSUIwNWx2?=
 =?utf-8?B?V2xFYS9CcmNBUzhZSm15RVdBS1Z6Z2o2V0FlYzVpQnlyTTdaaUt2ZWg2K3ZL?=
 =?utf-8?B?N20wMnVqSjdSNWFnYzgrZGFSUmRxYlNqQ3RyNzFNZnhiUVdNQVpSQlB0dlRH?=
 =?utf-8?B?OEZFNkZ4YnlRUzlpaG9qVkE4R1cvV1cyUEVjYzNDYWZEQ1NvVlpYclpGenZK?=
 =?utf-8?B?eDN0TFpkVlM4Wi9QcWZ3dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3JJNlBKUWFtR2dOeHo2VWwrb2F6bTBUUkhtN0NpZDk3YmNFVHZsVGw1cWht?=
 =?utf-8?B?VTdDNTNoRWZUaXhWSEhDY2xjbUFtZ1Q5Nk5vem1BdUg5S2dEUm9QVUJJNmdQ?=
 =?utf-8?B?YnEwZXN2bEdsSXZ2bitCT0pVbkxadFRnTVhYQXQzTEZZcS8wOHBWVlg4YTJV?=
 =?utf-8?B?blBHMlZ1VUtlSS84aDVLS0pHN0FkaE9ablpkeGU1VXhldHVrU2c5dHNDOXFR?=
 =?utf-8?B?U25kWlpGWm92TG1obHZiWTdWeU9IOE1WZ0RUUGI1R041TW5JRjZFOGhSTjFj?=
 =?utf-8?B?c3FUY0hkbnR6Zy8wdFFaNzIvbWpjT0Y1eS8yclFIRkFlY3ZyanNHSk1XM3Jh?=
 =?utf-8?B?eGpKZEVQRTB1bEdzTzZtcGNmL1ZBWUNqQlMvbXpnMHhnNGlTK3FYb25CM3g1?=
 =?utf-8?B?QnZrM2lGTXRRNnQ0MS9qSHZkQ2JOd052Z2c0T1c2ZjVxWit0NFBhdHlNM2Z0?=
 =?utf-8?B?QXc2NkdUUStTeEkwNmU0ZmtiQ3lFOTZmM1V6UXR3QWtORVZWRnJTbm44WVlB?=
 =?utf-8?B?Vy95NmpsY1d2RC9rYXJONjcvcEZQK3gyaW5XdytscktoQVRXd3VBU0xkQ1B1?=
 =?utf-8?B?T1pDdFptbDJxdi9VbXFmUUk3Q0JtVFlib1BQWmttN1lHYk54Y3IxdFRyM3Ji?=
 =?utf-8?B?VVZnK1ptdU9ZUEFDTzFDSFBJWmxEMERKVW1qVUpzekRlOWoxNDF4S0RhMEl1?=
 =?utf-8?B?MXl0SVJtSFUvQkhtNmFrSllyQUlpU3RHaVd4MmZ1RmxjUFVjd3hIRU1KbFdX?=
 =?utf-8?B?YnM2Uis4b3l6Q05uM1FiamYrRHBLOVFBU0RBTnN5bDB4ZEtsMElMaTh5bUVW?=
 =?utf-8?B?Tm5jZm9jNW4xUU1kTmF1bEtIZ0o3aWg4QlVRb0haQXNKam9neTRGVy9va0Na?=
 =?utf-8?B?L0g0eWFQejRSR2VqZk5YdXF2S3Q0MFpGUDJ6bHhRMllJaktSelVtUWlJLy94?=
 =?utf-8?B?TEJ2UWhJWlFvd2k1VldsMDc5Zk1uZXRLQVJOem5rc0YvUU5mSmZ0SmVURmlM?=
 =?utf-8?B?ZjBNalpKZlFGSnhBaGNWZEFRWEt6Nm5ZRkUwcUZQc3ladXhQYWdxVDFkUklu?=
 =?utf-8?B?NitGa0xwMVdwTGpmNzdKQ004eWJMelEwd0FYNkkxME1iQkgyNFJkVUFMZG1n?=
 =?utf-8?B?UjdpR0Rtb1ZFckM0VWxscHdBN0JxRlRuVXk3MXRyQXlpQWpvVFhHMlprdHJ2?=
 =?utf-8?B?K1pFY25vNHZzOU83VmUyWXhPVzVZdkd3eitINHl6andzaStHMmdvbnRhajhx?=
 =?utf-8?B?KzlHYlE3Wm1IaUNYYlc4NmhOSDl4TXF6ZkZUb0tybDRWOEZaN3dmUzFOcEVB?=
 =?utf-8?B?VkN3NlNPcXk1MUtkS2JIUzlSZGU3SzkyQVRFUllxTGxWSzlMK0pXaVpUb09t?=
 =?utf-8?B?YWhRU2VheUZlT001VnpwSFFXQ1RMbCtSWVl2U2sxdlp2aE9BRERZcHlqQm1p?=
 =?utf-8?B?Z2J4N3VVaWVBV1E5Qjd4K3ViZHl3ekxMTGovQnphYTVqdUxtZTJZSisyQWZr?=
 =?utf-8?B?ZmoweEtEWXZOeWl4aE1zTWp4azAyQWF3ZW8rdHQyRVN2bzJOMitja2VHQ1g0?=
 =?utf-8?B?R0w4aDQvc2J2S05acURQUmw4VXdFd0lON21LQTFoNVl3bmFINnlrZnhhR3Yv?=
 =?utf-8?B?YmtPTkdNS1Q1SS9sSm1mZTE4MXFLR2VhcGwxVVF0cGZ5a050MUlPdEN6SW5Z?=
 =?utf-8?B?OU9IUHMyU3k1QjFJNnNVak1BSjNOQkhDREgzNFRFRi9hZ3I3RHY5V1BHZmhz?=
 =?utf-8?B?cFh2eVY3RDBaY0dCTWt5WFA3VE5KUjNyYjVyL25vVWVIanB0VGp2Wk9adHFC?=
 =?utf-8?B?c2xCLzBSY0RUTWxvOXp0bWNXSEM2UDEvSHBKTi9lc2hkaFpnTFZocmJRN0ZU?=
 =?utf-8?B?YzhTSFhnZTlGclhSaTJ4YUFZQjYvbjNEMll0QWFLYnZBdC85SHpGM05za0Rq?=
 =?utf-8?B?TzJJaVJuUEJCWURGdlNrd0xEZzV0UHNkVm1Sam13Y1pTRHZEWC9yUEFrc0d1?=
 =?utf-8?B?eWh4azRDcFZrZ0pWVjV3UC95M2JCaTVzTTZxVm4rZ2s3aWNkczIyRXI2L0sw?=
 =?utf-8?B?MWVjcGhRR25hTmFnQmVkU3VWNlhDcWg0OU9GM3pOQlhwQWx5VlBOVVN2Qlox?=
 =?utf-8?B?UWF4RG03Vld1cTlVYnRuYXJneEtNSEtRb1RPeFRvNjYxTjVCeXlRQ2VxNDJx?=
 =?utf-8?B?UEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d13cfbd8-f1d5-467a-6f05-08dcd29e0be1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 20:12:22.7664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXtKfxXQqfXrHYoi38wJNTjIziD6VqPtMHwcAgChIcIH0Q2IrDLP8lA3RRtJIIZ85kwsDD8GnfZEb8Am72iKaw03Lv16YMD72AC/g92KUbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7027
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

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
