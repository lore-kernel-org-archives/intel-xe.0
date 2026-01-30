Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C13BD73E85
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 00:48:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC9B10E0BA;
	Fri, 30 Jan 2026 00:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KwN2h850";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7143410E0BA
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 00:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769734137; x=1801270137;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ypXNl/LATgHyf34DHPXJK0b2M4CeEA0z+EntHdJmvQU=;
 b=KwN2h850ljwff67gxHpLFSGbJGsXlKXSC3JnlHDgneQkIRKZzSH8ljO2
 D3uB6KHxdE+lS3fivMOOrh1ZSr5qpGYHQZ+SeRiliRcz91/oKHr0JRQ0n
 m9EqLhwYpYzbkYiO8w8wpV/QokU4SqzgyDcFFkVqzg1uwoCgG8ziOHBbo
 6/XajBMNC5c/fN9ewzDkRd2AwyaQHgD+lHxEIB4jd7oo0j9CfJ5rf0zQa
 MqWBPi8Gw+6OijwT5Ei2IX2EKjXgeXhQ+BigfYrj413PMsC9ZIMx0l94g
 y3cSajc260Hvd603kdBDProALNJb9Nj8ZAa46m39TR3nN/e9YN6cvaweC Q==;
X-CSE-ConnectionGUID: 2ICmwmTCQ0uItNqMf+mmcQ==
X-CSE-MsgGUID: WSesYyh9RSuhHWSr7yV8oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71023019"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="71023019"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 16:48:57 -0800
X-CSE-ConnectionGUID: jyx4ILcRRtm9qt2A+JGiXw==
X-CSE-MsgGUID: qX2J2mOrTt2zAPd2GaxsFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="239450549"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 16:48:57 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 16:48:56 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 16:48:56 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 16:48:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zR3pl0/QACcrgB4TksCA8lU/AZQlPAmTrq1jBuiJax3yznXf5HbtFCvZmRsAVT/uDj5oLN/QbwQRVksxXSM4T/cXOwEODJOcCkl9bZo0ArEwbE7Amb1nyujvdUDQHS4sMQ9ViryKlcqflzCWZN3mJtlzXPId/LT2jGHcarJt3ZwSQmBxWEx+TvQqTViNJ6C6RCv68MLHA/GMc++sCF5pJcm4zW0bJxmIMisnsm3CmnHLCSb78r1xtgU8YdbttBjIYYDj2jcc3L8J5nElEnGaPzo4v41sztkml960wNepKAOLp+3m1xXS/22fVv9hZvsfsMTATxejpU/NHxF41iWTUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Na03ybme6xTAIyOOGo4I0CCYrj4/6Nkarsu4nuQx/z4=;
 b=PwlnE4urzXa5/PaWdXArX2vvjY8wgz763BB/SFlhYYstRJAzdkXb18zV3rrau1QZOnYQJVfjEtFe7kJrctHtuyWfnbZaaFVJQLrEbDO2Z7y3XBrDjaKbCZ1KFHU18pldHlbxWjy7cUTraYUnOLzWjzz2OAsrsFBDnclulYRk4VWvBztzzchO/NYJRTO5cCZsF3PcWoC/6+bbK1jAi3LABuqZfKGZiViT48md0pY+qo4N7rSQjdj4EEjyD4BFr6bf7rD97UH5abbfDgPmnLXps4/os+UfgEixcJqx2TmNerC7/sZh9yYPjTpoKn/uIwf5ODlJD3u/5pFLt51GlJEnyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by IA3PR11MB9160.namprd11.prod.outlook.com (2603:10b6:208:57a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 30 Jan
 2026 00:48:53 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf%6]) with mapi id 15.20.9542.010; Fri, 30 Jan 2026
 00:48:50 +0000
Date: Thu, 29 Jan 2026 16:48:46 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/xe2lpg: Extend Wa_18041344222 to graphics IP
 20.04
Message-ID: <aXv_7mzwHdpYVGY0@intel.com>
References: <ddcfcd0631ccc39a84d63e1760cce672dcc7f097.1769499842.git.harish.chegondi@intel.com>
 <20260127205004.GA2174980@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260127205004.GA2174980@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:303:8e::8) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|IA3PR11MB9160:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f0861b4-dcee-4143-4a7b-08de5f995560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3RpTHVGZ0hncVIwYk9mZzZnS00rVjZDMC9tSjBxeFdlUXkrbzJ1WDZXbmd4?=
 =?utf-8?B?cGs2T0RuaG1lSnMzTmV6VGpsRytRYVB0SmV6czRIWm94MEJRMldjNG5OdjJL?=
 =?utf-8?B?a2dTVTVOMGpqV05Yb1VSSmRwSjNKZXJRcEU1UEw2YjBzeU4xa1JHaTE3MVpW?=
 =?utf-8?B?UTNmZEZZSjJhZmRLclNUdWoydS9FVjZOdWdKMHNIdU9hSXdqVHQrN3dUYVVW?=
 =?utf-8?B?dGRBb2lFdnVHTlRJcTlGWnhvejJiU0JoZHgxbUIwUDNvbjY2ZWdFOENUS3cz?=
 =?utf-8?B?TEpXSWF5eXVraCtOc1V3d29YVzF3Y3lIUWFtMVV4Q0NNQlJTbjkyMXk2MHhp?=
 =?utf-8?B?cmVGWWpUY2V0LzJVOC9jRVRHYkNzaFRDL2xZWjRNSnlIMzFveU9YQnE0ZUNU?=
 =?utf-8?B?MmxFMGpsYXkxbE9seEhKNzV5SXJYUElNb25ENTRsMjQyRU1ONHJ5dVF5ZDNT?=
 =?utf-8?B?b1Y3RFBKbXg4MTZJQ3FGbWdSNjFyOHdmNUlrazlpQzNxNGhtOHZEOHk5dTVG?=
 =?utf-8?B?REVlQWYrb1FSdTMzZHovOVFaRTYvczlpV0JVQW9VYzZtNDhpS05hOHVFU2NO?=
 =?utf-8?B?SWc3dU5vWUVZVVpRYlpsUk9FUVU3NnlTaTUrNWt1R0dHaFptOXVDWURaK2Ny?=
 =?utf-8?B?ZGtzUmNaNnlGb2hOc2ZnVW9Cc0NXUmVrMlBYRU9YdkMxZEJQN3VUTTgrZVJI?=
 =?utf-8?B?MENXTmo4QzZsQi8wTWYwandzMkU4d0ZSNlZtTUFTcENwRU9kSkdjZzdmY05r?=
 =?utf-8?B?cUkrRlpyRHVYUGVWRFNZOTlqSTFMbmpHWWt5UnFZS0VnMVBoYm44WGVIV1hv?=
 =?utf-8?B?cFI0RUpqWFN2NjRUaFdTbzh2VDgwazFqNzJ5RXBCOEkrdE11NHN5THdxKy9o?=
 =?utf-8?B?VVFmS3BZSy9qMEpqM1p0dHJwcW5FL1FmL2o1MmVvQ2pZMzA1bmhBaWRpOUpR?=
 =?utf-8?B?TWFVb1Q4aEU1elpEKy9xVUh4TjVUWE5pY3h6eDd1b3ArdWRuMDZnRStoU1Fx?=
 =?utf-8?B?bm93LzR3QnUrd0k2YzJ6OHJRQURKRmxkeEFIQW5kdlEwSGUzUURjVGphbUVM?=
 =?utf-8?B?a0sxd2k1VXFkTmFlQ0Z1Kzczd2xoVGVqUVRyeHlCM204OUlGY0wxSkh1ZXNj?=
 =?utf-8?B?bHU3c1ZqQlUxMjhLOVNhYVczWFJpZmtKcXVLOWc5ZTNQSGF1UXlDUTZ1STRJ?=
 =?utf-8?B?cDhjbnczcUc0THFzYXBQVWI2anRtVjI3TzZFaVBnbC9CVSsrUzh4UnRQSXkx?=
 =?utf-8?B?QzE4d3NpWFBZMWsxSkVwVVdzTUdCK2xLekZ5S2pHVmxhYzY3UXNHaWdwNmlD?=
 =?utf-8?B?MjdCOEg0MXlFL3EyM1NjYi9QYm1CMlYvcnNkaUlLK2hlY2t6KzNKUzBET0pw?=
 =?utf-8?B?NExPR2lyVU42S2xNMFgxaHllSEhpRkl3U3VjMmUvUTBXeDZQbUh0Z2NMeXhF?=
 =?utf-8?B?L2kvcTRzNTM5YTBrMUJtdFB2VU9nL1NGTllHeTA4SndXd0U5aVFxT1RPYkVC?=
 =?utf-8?B?RkFJVXh5TGN6UVhlOFFsN2pabXhUVEh2a2ltMWJBTUdBMkx6ZHA1RFhDVXEr?=
 =?utf-8?B?bS9Yakk3NGVvL2RpSHB0N1VLZHQvbjNtVU8wT2lBaHpmb200SzRHTWQyeGth?=
 =?utf-8?B?WXU0TGpiT2FVaE5TWVN1Z1loNHY3d1pHbXdaUERyL295UEs1cXdYR1kzV21O?=
 =?utf-8?B?NGMwaFVQNUM0YkpSZUpjTzJuK1J2bEozVHFnTFF0M3FwWnlTQUtXNTFScm9V?=
 =?utf-8?B?K3hid2dqWG9ITTQ2VTd1QXhtRHdjdDNjVlZCU2xUZDNEc21GaVlxazE0QkpT?=
 =?utf-8?B?aWJqNjZWblUxREJjZjZiekFGelBRcXRoU2JCNDFIcm93UkNHSzVVQ0srT3RS?=
 =?utf-8?B?elJOcGlCUU1TMlN3dXBqc3g1S2NROFdoSXI5TUFpeXk4aWFYMXhoMnc5TkhS?=
 =?utf-8?B?TXVtdGEwZXQxeVVLNWNXZzVMWFlMb2EwOGFGL2NESURuOFh0bk1DdG1OaUpw?=
 =?utf-8?B?KzMzSDRicmthOUJ3WjFJWUtUZ0FtVm9qWC9ZanNyRnlHYzRhWnBKbVYrUXAz?=
 =?utf-8?Q?zTS4IK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUdFSTI4LzlldXNxV3ptblJWaXhaaTc5SE5pTTQ2ak9Xb0NHVkZzVVVCOFh6?=
 =?utf-8?B?QXU3VlpER3NSS1NNeVI3aUNTRHZ0SDVrRWo2V2VidzJTcnExK3VPdUd5a1JP?=
 =?utf-8?B?MnM4c1M1L1g0aGdiVGdYdmNnNDhFc2F2djdQMVFlcld0aVp5bHZDbHlqK29Y?=
 =?utf-8?B?ek5DSGgrWmFmRXIwYmVKOTR4bHRmdWdPQ09YU09jdXB2eFR2cDZJSXVvTDYx?=
 =?utf-8?B?MEE2WEJTRDZDcUlSZjdDTWxuanVSbHdEMnpMcWNDYk9KT3c0OC9YdTBGcU9h?=
 =?utf-8?B?Q3VOTEdRY3pncDVaaWFFRzN2amM2Q0NvRU9kMmlHNkF1dTkxdXJrMzAwRzMw?=
 =?utf-8?B?MDlnQ1d4UXZSVlB5c1NudDV4N1JCUnJPMHV6U0dXaDVtcGY3TTJwYUZFNGcr?=
 =?utf-8?B?UnlOS2VzMGZPcUxHUU5HMGJVRDYza0RPOWV0VDlnVFY3eVdwbURnL0N4NDZw?=
 =?utf-8?B?QTc3VEdxRlZBRDhpYTZFM1I3Q0lVdjNzM2pCdWxXaDkrdzBMOFBiMjF1ZVM4?=
 =?utf-8?B?VXFiL3R3WHdZcTRqVktOVXM5T3JRS0JHU0FPVnpzd3hrQW1oMmVycmxSeU52?=
 =?utf-8?B?TmVpWXZvMGhPdFB0bllJeXlDZHZZRWZ0YU1kYnBEb0hOcERlbTYySWNSOWVr?=
 =?utf-8?B?VHBaM3o3dzlMWXVXME9Rc0NyRXNKbnRwYUZ3cFg2MUppa2FPSGVlNHJMQWtD?=
 =?utf-8?B?M0IrbVRZV2pDR0haYkltUFgyNk9DcFp3aXFKQ3EyekJ4LzFycjhKc1RGY3F4?=
 =?utf-8?B?cGp0eVJmeEFZY0JyeDNaUVdNcWRRQWoxSzJ5Y201ZWNsM3luUGhoVmVXRmdR?=
 =?utf-8?B?MGpjSGxEMmRHeXRpbHFMMG1HbHp5eVNVbUZTVmVFb1NKRFRqdmwxWUdiVXp6?=
 =?utf-8?B?WldleFMwRW5SR3JzN1JoeEJTd1RsRlRXTHQ4b2dhRFRlZ3RtUzhGODFJN1du?=
 =?utf-8?B?UEYzaHQ5UHEwT0d3TWEycldFNW1UR0xuTno4RWlodVhKZThHVEVEQ2xyWFdl?=
 =?utf-8?B?a1grNEtCNVBFUm5paWZyZVpTb0RsTGpUZkF1bmd4cGdtclJqbzhJNDU1eW0w?=
 =?utf-8?B?QjJzemkxQlhYZ25NYjcxUk45NE1HOUtybUlkU2ZLUjZHdE5pb0hXaHhPSlRV?=
 =?utf-8?B?bWt4OUhRRFVhVWZqcDBSUkczUGt0QlpGclNHWnUxdkR6UjY0THdvUjZZcmxS?=
 =?utf-8?B?aU9PREtyYWVkckYrU1draGkrSzAxOXRVT1ZMZmxqL29BN3lzM0dhYTFHUTIx?=
 =?utf-8?B?ZVByc0JTTHM2MTNpbklXMWdiRmlzN2MrNUhJWDZzM1ozcXptM2ZLUVk1NEpY?=
 =?utf-8?B?ZXBuTHhBTnNLY2hQd29oODdML2I1Qk1GeVlIbEp1L2dWOWpVWTAzU1N5ZFFl?=
 =?utf-8?B?WjI5aVBPWXhmdWhqN3kra0h6TFlsbXFIYkxKc1RaNGowZzJaSXVBQUxFaytj?=
 =?utf-8?B?WXVRUk1EODBIMWVkYks0SDJmU3hMbzkxalJ4Qnh2MEJVd2ZTQmNVbmZSZEJQ?=
 =?utf-8?B?MlRubStMa0dSWmZwVGhvMzUyT3NEVVBDaTlZQXp5VWxDZkthcjhCNWxsVmJ1?=
 =?utf-8?B?bHhZZmNZK2NWZGs1c3poZ3RMdEM0TTg4QTR4QUl3TGRoTlVXRGE2TzFldGJ6?=
 =?utf-8?B?cGxJdnV2YmFmNWh4b2lCQ3BlV1BNVEs5TGlycDd6K1BzelRiakZQaitkZkR0?=
 =?utf-8?B?K2xoRng5LzdOUnhRUjZCK0lwVzd1bnl6b2RJWUN4M0huUXdRQWMya2NKa3ZX?=
 =?utf-8?B?VUpuekF3NlUxSlJPVFJOVVBZRHBmOGVqdEU3Yk04QnM2VkJvcG5MVXJ3Y2ox?=
 =?utf-8?B?YUlENnpoSVUwMG9WZDYwaUZ6d2VZcWt3S0dHSnN6Vi81cWpQSHpzdjI2QmRY?=
 =?utf-8?B?dXd5OFdlQzFmYlVvZzQ1RmVUaG5RTWlxdkJLSHErNE5HYUYyQnN6M29mbUhL?=
 =?utf-8?B?WHJsSFc5UzdHbWJCTU5ScHdLWjRKUTBqcUI1THBIdW92cGpXVW5BN2g3OVpI?=
 =?utf-8?B?dW94dWk4aUNnSXdVTE9zeDJKWDFtbUF1czFWa3hCRXRQdWh1eXdOdXdlNmJh?=
 =?utf-8?B?VXQrdjIrQitkSDg1RCtad045anJDY2RNWlJjbVhYMWozSGw2cXJQU1JkdDEy?=
 =?utf-8?B?dTNtZmttcmJMS01Jc2ZJd1FJdnM1R2lPUHBjbmlLVVVFMHVaRmtWbTBCZTRW?=
 =?utf-8?B?c1krT0kxWXh5ZFZPcjl6cjZBZkg0M1RmVjF0RzhEaWs1UXgvTmlGalBDTURi?=
 =?utf-8?B?VGp3L0E5RDFKTElWU3NPWkhsZVhVMGFaV0g0OWloYlBFekM2OVNkQXAweEVi?=
 =?utf-8?B?WlB5UUxyd1Q2YjBMS1JWOUJSTE8wdlFmRFBiQTZTNHl0bWtSTnlCcnlzc0pV?=
 =?utf-8?Q?8hFhT6BvdS9Lqc/g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0861b4-dcee-4143-4a7b-08de5f995560
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 00:48:50.1603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +GGGl/3DsBoiJ7Cm6IyvU+7p2cMsrA0a3irQaAr6HUjMn5Ddm8WztF3j6QvQP5ov7kx58HCWymy4O9Xbb4er77tBm4/FKtYUOyZ7xFk9lbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9160
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

On Tue, Jan 27, 2026 at 12:50:04PM -0800, Matt Roper wrote:
> On Mon, Jan 26, 2026 at 11:49:50PM -0800, Harish Chegondi wrote:
> > Apply WA 18041344222 to Xe2 LPG graphics IP version 20.04 too.
> > 
> > Bspec: 56024
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_wa.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index a991ee2b8781..1153a7363cff 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -535,6 +535,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> >  		       FUNC(xe_rtp_match_first_render_or_compute)),
> >  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
> >  	},
> > +	{ XE_RTP_NAME("18041344222"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> > +		       FUNC(xe_rtp_match_first_render_or_compute),
> > +		       FUNC(xe_rtp_match_not_sriov_vf),
> 
> We don't need this; nothing on the engine_was[] list applied to SRIOV
> VFs so we never apply any of them.  This RTP match function is intended
> for OOB functions (and possibly LRC workarounds).

I submitted a patch series https://patchwork.freedesktop.org/series/160865/
to remove the RTP match function xe_rtp_match_not_sriov_vf() from the
earlier WA patches and the SRIOV IGT tests are failing.

Michal mentioned that with the below patch, WAs are applied for VFs
92a5bd302458a1663 (drm/xe/vf: Unblock xe_rtp_process_to_sr for VFs)

Thank You
Harish.

> 
> 
> Matt
> 
> > +		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
> > +	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
> > +	},
> >  
> >  	/* Xe2_HPG */
> >  
> > -- 
> > 2.43.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
