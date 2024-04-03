Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7F8CD1292
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 15:07:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30ED2112755;
	Wed,  3 Apr 2024 15:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kFug5kpI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1589112753
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 15:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712156870; x=1743692870;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=MyH+wbai/5Ua0hoN+ON1suJv3DqWFtuwc36udIWdcgQ=;
 b=kFug5kpIzUBA/f1Tn1gu+dmSjsR0NRybB090i7q+iGmJMr6fw+ZeQozB
 itS+EZ6QEdPraYJLjDj9vdFJ/6/hY24gpBXMQsZM7DUx8oW+bC6VJ1D2k
 hCru9hJJbhcgyfXCCIXVXwVFggMQp7V7vtMbYX8AZ7DugQMV3cTqUBt+o
 HsLG6Ej1OpOsdW2JX4UnOnfqORtvIFdPv2aoOkQg4J5Dm/mNQzFA3xcG8
 09wXQP6eQY96jvhoRnPZTUP+BX2y1xYbHeoiOB97gTcgdLcfNLdhbwrDH
 shBUM6viiQO98R7fQbPy7Fe2TZqbLXdB6Nf2ROGg19JkoDJXblOdAft/A g==;
X-CSE-ConnectionGUID: ZIyEyOm2QJOK682E4u4Zgg==
X-CSE-MsgGUID: sBrg6bHYSvKnxof/J2YWcw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7260718"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7260718"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 08:07:49 -0700
X-CSE-ConnectionGUID: CMXGAVY2RaaMm3P/agdr8A==
X-CSE-MsgGUID: LivMW2nTT06H5fQLBBZUTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="55928538"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 08:07:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 08:07:49 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 08:07:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 08:07:48 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 08:07:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CAUi+qmen5cdbLwPXiqAQAHtN1PydNkgI60OpKp0VPy8OwIh3c8E9GjWOsWYYy7hqdDNEWeieJQP/EQjNdQ2tdO7dpJwFbYepC0gndU1QrhJrMWYYAf4ikSFu/B8qifeTZj/+KiAJC01P4Ou8OGyfpvwBEP1bU3FD9Qd0LK1gtfsZgzElki+p1+ICXv4SFn4MqY0TbkmXb3y4C17odde76VlbeBclrCYwgjbt+dnH/j1OqaYAVqRzlSuv3ArWB61fATUhv5/vH9suQzndVDIZ9a+dvHO5hnj1qJpNjJu8lmp7OxghLTg5wabRlfLzb1pPSUa4F3PmGAz/tpVhlebBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIw1uh5OMGu94gg+77JbTPZEejtamK/9A2mp+waMTGs=;
 b=JWtIAkPOGTbKWc3efbP3dEEFlNOsc8DxzYry4+HYy2e+VzEaYUXsMrlcbVztvwGjKJaMPq0/3irtEhCw76ihGpx3V41HFulsGhrjIDoIQYu9E7FbBCeGkIGecspSNuzKIPCNJ/m/mCC7G1CgW1LMV+Mdlp9Wf0lb5AFZYZtQGjQWf+R2VtORiJPldvQwdIP7NjV65RgiMqDaW4q0XrKkOBJ2dSI06EN5mAaQ4GlUQIQTFpyY4dilB3Qb8vB3cGlZoqxUCyk0Qo8HViuitGt9hfELyN8QK/TLFCmgyBOwluT5HFAaiqmzYLj5XDWMq4jyX4DG46hRSrnAcrGqVtWu6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB6689.namprd11.prod.outlook.com (2603:10b6:303:1e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 3 Apr
 2024 15:07:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 15:07:36 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: [PATCH 0/4] Introduce a wedged state
Date: Wed, 3 Apr 2024 11:07:28 -0400
Message-ID: <20240403150732.102678-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0058.namprd07.prod.outlook.com
 (2603:10b6:a03:60::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB6689:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M3wBcCoMXWUh+14+LxDX9Cz6sNb50XlIzGXIXL8ZLHBgK4amXoqzpJiPDhCJf3hgcfeo7kWy4hKuEbwY7f1k7fAUXqYdA4J7F/C7RYF1xEBomuZ87LbSWNq0afZuIoOAYS3yjq5RrYx/7JT2TsV56/dMhfp0UOZB03KadHi/Jkpf8K0d/s+TN1TW+ng+sT3zQjBcz6kVEnqT6b+F/dJKfCcinl14zBRkmqHsrQP9WGnkJYun/60DZS02JMnkdF7X3nFaEW3Ev+bGJaWJm+ndcEgLcqTfS22PynJ5QWRkjP8jh2PB9Le2Id8nCw/823Zfdt+UzHb60b+KByH32tbisd9YW3Hcn1aifKZj7Sqa5LdbO5qMpO/WYqzJIrF+eltQdcUjOwu3LidBqwfVMqxhve1n8nk0Ofq5SCZnKTgAgb5qYVnR5fL2Rnr+U8jU0Q8DeJD2Zm9bg/li5pTGzw+vsuzLmdS9BzgR3xFMoh9wZSzrBHaUJBZoogX+jN5q7ZLHwo7o72uH0I4J5LcGEt/k/w5cnKfgVqp+HYKGV/c26fefx7HOzSKNP76/RT8x4T45WptIdG0+0v/bWGClRpdBtwj5dCtQ84o8w/qytr1RQ32+GXL3kPdQ3IAcwariPb2c46xk7eKJB5KOXymZDQ058LCaoxIl/ehWsKJSFyPLPh0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1A0L1dXdEpoL3VBYVhuM0ZiRlg3U2Q0YTVPMnlRQzFIQUQ3cDJwQmx6VU1x?=
 =?utf-8?B?Lzl5Y0taUFppaVlhU3ZhOWRlcVl4NURpcy9ZYWdLWGtEc1I1TFpqSlB4bmhX?=
 =?utf-8?B?MFNnVG1yY1hNdXpCMGFLdU1lRWZWVWpPQ2RLOTQwV0kxeXVKdUNaVFc5bGhm?=
 =?utf-8?B?OG9raUhoQU1ZSUZSVnlKSmpQMkJKa0o0aEV6bG9yalVVTllFVnJSdW40a0xp?=
 =?utf-8?B?VDNzdjRtS3pVSmdCZjdmTXZ1eUhGYjdZeHlpTkd2bDA1bWl2NForRzF5clQ4?=
 =?utf-8?B?MklQRk0vbTdhSlFhRlZHZEJta2JSbDR3akVRWVhuOXBUaXJkekpoa0JqRktn?=
 =?utf-8?B?UkZGdzlPLzVxNEV4ZkNrdmJRR3Z5TnljL2RUdGo3TTU0c0xkb1RoQ1ZSS0VE?=
 =?utf-8?B?RGw2Y21sMGdmOGM0TmRxVGM4VnZzRFpvNlh3VnJOZHVjWk16eWV3Tjd2aVJr?=
 =?utf-8?B?V2MzRGRteUpQbitXS3lTSkFhMHVFaDluZW55MmZuRU5kSjBkZzVMclliUFBH?=
 =?utf-8?B?RVpYZk1yNHZEUzdSUVpEbTErV3FnRjZ1RUh3Zms3RmhqQjZoNkZLZEROWjRD?=
 =?utf-8?B?a0FDbWtLdVFBQ1BUZFNUYWJqSlVPTEZzbGExU3ZyamNMbld6WkpOSkgwM3k3?=
 =?utf-8?B?c1A4N29kczcxZzE2Nmg4eWpsc3RnbVB0RWlqbDJMY2xzSDdoVVB0WUV5Znc5?=
 =?utf-8?B?UjhjZFArZWFCV0I4a2FhSVh4OW9rV3lyMDNZTjFNdVNHMjlZNVhrbzAwNm9F?=
 =?utf-8?B?V0hyVVJJTkpqdkJpNE9lU1R6Wm9KN2Y4eTRPa0hEZnVENHpMcEJPMUQycmlL?=
 =?utf-8?B?YUlPakNsS21ad3B5UDVPZ2JkTEFRV3Zxb2V1ZDh3eU9TTzBFeEl3dXplaGVH?=
 =?utf-8?B?QUxhMmdxTmdBNUlOSGxGaEdtMmpMNzd0Q2NHZG9RYTJUUzdMZXkyZXJtMy9U?=
 =?utf-8?B?QmoxaEQzS1lyNVU2ekQwQm44MitnT0lzV1FqcDUwRkhMYlF4dWVUYmJlb3Na?=
 =?utf-8?B?bVU3bWFsbysvTTdweXRGU1JWMGJMTm9rbmJLbHJpNkI4RkVzR2d3ZzRwRExE?=
 =?utf-8?B?d2duMFlQVEI2S0NMa2JoTzF3WDR1cU9lRjlBNGdtb2pYblJkR0dhRGJVOEdi?=
 =?utf-8?B?eTMvZkxzN0pFQUFPTlVGS1pzc2FzRkFITGVVT2RBbkhzbDZQZVMzdWc3c1JG?=
 =?utf-8?B?REc5dmpHMm9USzhvUHZMa010WDlOOFR2allMclJxZFNJd3V3SDNpbEpjKzBH?=
 =?utf-8?B?UVhFb2gyQk1nMGU5MG41Q2Y5Zm1BbkFibWdYcmVZdlNzdXc5ZmQwa3d1MkVE?=
 =?utf-8?B?WGQ3ZlpvVE1jSnpRUzBGc3RldkdoZmRoUTNHc282cTZJVUZiaVM2TXRUOStE?=
 =?utf-8?B?cGViZ1dEM280ZlNOa2lpcEJFdEN4RXdRRmZSU1Fwb2VhSWJzeGhOWWZNNkRy?=
 =?utf-8?B?R3RZajRqODN3dG4xY3lhSG5aNUhkL3U2RVlPWFZ5OXJzOW9KRjNKcXNkM1U1?=
 =?utf-8?B?aGNja3crUmNkbnZuWmMwWmFDYWFIQzVzZ2d5N281WUg5eUtMWElVU05yVjRn?=
 =?utf-8?B?RHNsckQzd2dRT3I5YjU2eGg1alNLQTIzZENQQTRyRmhQMURGMmZCVnJIMms1?=
 =?utf-8?B?U0ZUZTRIQmdROGJPeUs4OTFRdjkzQU9RWFhkOVVqWFpseVZvVm1uWHkrNFY4?=
 =?utf-8?B?V3pIWGRKTHVHOU41Y3dSdGVYRVNScWNWMCsraGE3cU5oeWJ1b2c5eDdaY2p5?=
 =?utf-8?B?a2xZQlc0UGV2Yy93eUxKSWc0eTJlTm5RZStZaGRVaFNVZHhkd1BwWHIxL0pW?=
 =?utf-8?B?bVU5WmpTYTU5T0lacnMvRmpTb2M3bE43QkVHejVva2ZadTVhUm5UaXR6ZTJw?=
 =?utf-8?B?TmdxMnEwRGU5OGJuWHhleFREMVQ1aE55UU9mMjZxZkVZRCtCcFVCV0tYVWx4?=
 =?utf-8?B?V25CcG9OU0htL0lQUm9BQlptRklVZnA5RStQeGhza1hNLy9meFM1RWwyYnV2?=
 =?utf-8?B?OXJBYkVBNlAvWEYyTCtKalpGUlFDTVJTVHpvZnlKSjVqUzlrR3dEVGFBUWlx?=
 =?utf-8?B?b21yK2JNZWhqNXBRSmxYdVNLZUZTMUZ3UStmRVRmUVBMaGNkMDc4Qlg0WWpu?=
 =?utf-8?Q?K9PdW1yFTBZoB1mt8uaxKpbRz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f047dd1-6d59-4c4a-a40b-08dc53efcc1b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 15:07:36.8384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fn9iJUtKjvpXbDj6Z60WxoZ1kAqoWd1zYS+zwKOAmTEfu8sTVQHaV/jprymRx8BzVRq3cBUrT7gzU2o9iSHNJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6689
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

Let's introduce a wedged state in Xe.

First of all, we need some more robust protection here.
One of the current biggest pain developers are facing with
Xe is that if something goes wrong and gt-reset cannot solve
the issue or when guc load has failed, we would like to
stay in a system where we can debug and reload the module,
instead of getting forced to reboot the system and start over.

The first patch of this series is enough for this protection,
and it is ready for that.

The next reasoning for this series is that in many cases,
software validation teams need to work in a system where
the memory is intact after the the first hang. For this
case, the next change in this series adds a very aggressive
wedged mode, where guc is blocked to attempt a reset and
our xe driver doesn't do any clean-up other than just signal
some fences.

In this aggressive mode it is expected that some memory will
not be clean and even some leaks might happen. Later, during
rebind and even module reload, many kernel warns will pop-up.
But again, the target here is not to have a safe fail out,
but only a specialized debug of the gpu hang. While
writing this, I realize that I need to add a config protection
to this mode to be only used in debug+expert mode. This will
come soon while addressing some comments that this new version
of the series might receive.

Also, this series includes some IGT tests (sent to igt-dev
mailing list:
1. basic-wedge: tests the mode 1 with a fail inject in the
   		gt-reset then check if accesses are blocked
		and do a rebind to restore the access and
		confirm with a simple exec.
2. wedged-at-any-timeout: tests the aggressive mode 2 described
   			  above, configuring with the debugfs, and
			  then running a simple-hang case. Then
			  also checking for the blocked access,
			  and then rebind to restore the
			  device and confirm with a simple good
			  execution.

$ sudo ./build/tests/xe_wedged
IGT-Version: 1.28-ged62883ec967 (x86_64) (Linux: 6.9.0-rc1+ x86_64)
Using IGT_SRANDOM=1712103638 for randomisation
Opened device: /dev/dri/card0
Starting subtest: basic-wedged
Subtest basic-wedged: SUCCESS (2.855s)
Starting subtest: wedged-at-any-timeout
Subtest wedged-at-any-timeout: SUCCESS (4.580s)

Thanks,
Rodrigo.

Rodrigo Vivi (4):
  drm/xe: Introduce a simple wedged state
  drm/xe: declare wedged upon GuC load failure
  drm/xe: Force wedged state and block GT reset upon any GPU hang
  drm/xe: Introduce the wedged_mode debugfs

 drivers/gpu/drm/xe/xe_debugfs.c             | 56 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c              | 55 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h              |  7 +++
 drivers/gpu/drm/xe/xe_device_types.h        | 10 ++++
 drivers/gpu/drm/xe/xe_gt.c                  |  5 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  3 ++
 drivers/gpu/drm/xe/xe_guc.c                 | 41 +++++++--------
 drivers/gpu/drm/xe/xe_guc_ads.c             | 57 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_ads.h             |  1 +
 drivers/gpu/drm/xe/xe_guc_ct.c              |  8 +++
 drivers/gpu/drm/xe/xe_guc_pc.c              |  3 ++
 drivers/gpu/drm/xe/xe_guc_submit.c          | 47 ++++++++++++++---
 drivers/gpu/drm/xe/xe_module.c              |  5 ++
 drivers/gpu/drm/xe/xe_module.h              |  1 +
 14 files changed, 267 insertions(+), 32 deletions(-)

-- 
2.44.0

