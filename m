Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE53CD37B6
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 22:38:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17C410E60E;
	Tue,  3 Sep 2024 22:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EJAS11OH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E7110E614
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 22:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725403110; x=1756939110;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=WeBZRhnizG+gR6DYGwMdN395tjWXVh6rwIt3Jm19pgs=;
 b=EJAS11OH2ijhToxEFZJsgMTA2wSdjXivRWixpzRsli45/aL7pv/gYYnY
 DWwqZ7oDB74DIbm2JcX4/EI3CXVBbvbenmBnwr+DN17pproAJd2NF+n+e
 vray06ilRogf0y8xVKKhRM7/2laW+3GhW/NwwmAR+u8yyuRE8P0kWYJfj
 i97GFvHA085TnQkk1PNAPZ+DWMt+9nuVt1JIYIsPdgpwsnT3dTfB2lplu
 FSJsiT242QLnKisnQY938aOlvzYHD+mX3Mw2hzN1aHwzCzXDdl5tbGqb8
 WeOkFyMDO1ropfymrFOuKPCfNAs+xuusCha/v4QzDiU3h8tBSWFTKkvvX A==;
X-CSE-ConnectionGUID: fx1tBRVmR76e169uu9ggIQ==
X-CSE-MsgGUID: aFRmQ/1ASr61SVjxwucMeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23546812"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23546812"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 15:38:30 -0700
X-CSE-ConnectionGUID: b5dd+4XsR02rZoW1Avg0QA==
X-CSE-MsgGUID: GWp06MDVRhKz4/g39Ab/xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="88304538"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Sep 2024 15:38:30 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 15:38:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Sep 2024 15:38:29 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Sep 2024 15:38:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=krWcgYzkUyJVM7lPbhUVllzrMogayVeJ2Qq5LKwWAaBohCAwAy7lw3xtwV81SA8+Etvu5O4gIigseqq9SgkX07avc072hK4OrX3fRqGgGy45yawS/gpQdr93RMmb5KEvrJJky2LFmB/36eAZN6UhGMZTp7NI5kuWJ9fGe1409YC7MiBtmBlXJl4EoaIRRwWOlld7v+ttSFWFkD9ahVqP8OFY5QbIWK1L13LWQxSRwqkA6egsFIfGOLzsUHOxWn+2cCwUGrpLUnM8P59QCQ3Ul1rmXKRqMuETYqv3fpOoUgqXHTk20Gw0LW3bxPlweSN6tyK4QNyCx/qdZa//lPEojQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPrfIFoe6f0FPZkShdVCcUlnsJWlzfG1PNFFR3fVR6E=;
 b=Xkbf+lcMTfVa+anZCzL8sYl/W1y7e3DkDBNw+dFotR9bEt0mznimRQfm9wu/peNl2esdM2HGCHl+Vs1jr/yDwIUWX3ni+GPruClhhGIG4p9PJQzjj36Fe450Ddsav0apVU+9eE8xr6wzPD9svdQVzDJVuH6zef58pn0sjw/7KKSA2y564QcAYmRcOZ9WVT+QfX06oj+7k8Ieba+/aOySlVjv0utzAuKjFc+e6gpzgrg7oL5uKZ/X2EFYAPp345Q1Ja0brYuvT5HWAIrHu0P7wwpy+gAwMa5mDgqZxQ61IqOtq85ej/4mriXqU9SVnbJjPi20wRqrR2zUdOG3B1d7wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ2PR11MB8371.namprd11.prod.outlook.com (2603:10b6:a03:543::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 22:38:26 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 22:38:26 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe: Kill missing outer runtime PM protection warning
Date: Tue, 3 Sep 2024 18:38:22 -0400
Message-ID: <20240903223822.380841-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0208.namprd04.prod.outlook.com
 (2603:10b6:303:86::33) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ2PR11MB8371:EE_
X-MS-Office365-Filtering-Correlation-Id: e8a1c63e-c287-4623-829c-08dccc691f94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHRPeU1RMDlTVlhzUWkxQXRHMWU1cGJzYnZBNW1RYkE1cE1FeDAva1BPQlJJ?=
 =?utf-8?B?dFlUeVdNMkNhVklBTVNYQURnSlZrTG8veXlxWG5ERllYTTIvVUZRekp3TFc3?=
 =?utf-8?B?K1NFSGt1ZE5JNXhvQ1dmMnJuOU4yUzcxS2lZRnV0elFhMTFPQTZTQkNhMXFn?=
 =?utf-8?B?UjRybHZsMEVDNTB2VFZVWUIvdmE0RU1lcmFVRTkycEZpMnF2alkyYUt5SVhK?=
 =?utf-8?B?b0N3TnpKWHV4SG50clRzaVhSaHhlZFV2bHJEZE5FdU0ydVhtQndEWWd5VUpr?=
 =?utf-8?B?cUpBUUNaZGk1WEIwQjk5MndsYUw5SmJWbnR0NXBqdTdhSSttenNvQVYwOE84?=
 =?utf-8?B?QlY5Z3NsdjFrN3dNdk45NFVPU0NmVlJBZlEwUU1QY1JjeGY4cFNnVzRwT3hZ?=
 =?utf-8?B?RnRYRmEzc3p5S0xCZG5GN05xQmhYZmlIVGxlR0Uvc2NnRnFQaHRvVmdsdFNU?=
 =?utf-8?B?cy95MlRYb2x4V05vbCtFSys3UXpHbGc3MFp6U1lxMDBRVEhPd05oc3MzSU5o?=
 =?utf-8?B?RmJweEROQ3YvKzlXN3VsQXJHaktzcFdJS2txOUpJSW9tZHdXWkpyTVYrcnVp?=
 =?utf-8?B?amVWa3lEZUgvSkZkT0xmRWlYTDcwZlg3USszb2Vwajh2THNTd0xZQzdOWWZN?=
 =?utf-8?B?S1lKOGovRFRBR0gvbU9ZUW16bHl6Y1RmRU1PNzF5Y2lDazcxclRxbDdEaWJm?=
 =?utf-8?B?UTg1Nm1XbzluZUZLWnN1cStjNmYwM0l4R0lFYXE3Y1RwSHA1SEZiWDBYMmtM?=
 =?utf-8?B?US9GOHlNRG1DZ28zV3Q4NFFJL3hlRU96SzZoNUF5VW04ci8wMGlGNjdpTmh2?=
 =?utf-8?B?RDVJRVp6djZWL2hLcXJhNXRUM2RhWW0xZWphL1orWUdsSDQ4TXNhNVhrZ0la?=
 =?utf-8?B?bWl0SnJMYXVXa1ZjbkZ0TWdPeXZGRmt3RTFYeW1UanEvNGp2UkFiOTJxQ2l4?=
 =?utf-8?B?dU91ZzFQem9Ua2xQWG5oOEJZNTA4RUY0ZG9TUVFQUFZHK1BLZDVGWC9ZcGpj?=
 =?utf-8?B?NEszWXozMmsvaWE5T0J4clN2MzZRREMwM04zSXFZd1k5NWpVU1dqTUtXK1RR?=
 =?utf-8?B?UXMvbmNTT3JxMWhhMzZrSjVsTzdVMUpZRHpscFk4WHpRZ3NuQ0diaXJJRE1Z?=
 =?utf-8?B?aFNMMmxZSHJTRFZXa1duTGZ0Q0YzcnBFdlBzd3p1bWxzL2hpUnIxNEJjc2Yz?=
 =?utf-8?B?d01sRUFaUmswRXp4ckFxaGo5REdNRTdUQWdDR3ZvNnkxNnM3REpydnViTHVp?=
 =?utf-8?B?eVM4VWxZUEQxdUhwcjdaQkpNY3h4dkt1SGRJRHJzWElEeTREZnVPeVRsVG9z?=
 =?utf-8?B?Y2k3dktPY0hZem00ZENQSnlkZ21QQ1k5OGM5OThleFRCU0o2T2RPcHcyeGFH?=
 =?utf-8?B?QnpwTnIvd0dNcURzM3VzVnorWC9qaG9kQnFCUTVQNnA1ODZwU3A3RVUrZndw?=
 =?utf-8?B?VjhIcTRtdTA1M2pmRTlSU2tudTQxNy9EVkF2MWJDOXlXbFZjbUlMSFlDMmND?=
 =?utf-8?B?SVU5ZmZrWXowelpUNVFOK1poRE1nSmtSVGNxNkRmd0VYUjhaQ3FxM2dSeHl4?=
 =?utf-8?B?SWVRQ3JGaDd0RDIxQWVTMkhsVFFab2ZMVzRWeEREcFRzTlE2Sy9FcXE0RXRn?=
 =?utf-8?B?Z0pLY2dpalJSVzZWazJhajREcDVONU15OFE4bmJGSXF3bTN1QTYwdGtNNW5p?=
 =?utf-8?B?M1NxZkw0RGpwbmRNRGdQRnBrRzB1cEdQQTR1ZlVwRUJMdG5UeWthZVBHZG05?=
 =?utf-8?B?TXFxYkVNR0NEVkFTVUc3VDU1ektjZnVHb3ZkMldNL2RiQjVReGZGQmw2c2tL?=
 =?utf-8?B?V0pSWnJzRjhVamNVVm9aQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlN1WlNDQTlSQ0k0dlRBUXhFY0Y4REVkMGFXeHhtcWNheHRWaWdtSlczNWlT?=
 =?utf-8?B?SGI1WlM1OHlPQ0pkNjFuVGh4L3Y1cDJVTWEwTE9Tb0tydmhuTGZjNkF5WkxN?=
 =?utf-8?B?eDE2Q0dxUWVJNUpOV2NlaElOV2xOcWxHUTNTeXlsNEVCUmlzb3dQTUVSNkdK?=
 =?utf-8?B?OGw5UmVwZzA5OE0xVGswWTA4bkJ2dHZkYzdrVW1ta1drMUpod0J6YVNBK0hO?=
 =?utf-8?B?b0ZkU3k1OENyM3paMmRaeEZjZlR5VXRieVhVbWZmZm5pcGlNZEdHTlhGZlk3?=
 =?utf-8?B?WnRybUppSlUrOEp5cDFLYjMwOXM2a1VnVVUwWXVSdEFFQTVMMnJHOHJpVXBN?=
 =?utf-8?B?V0xwYmZqdXRNcG5sOW81U2EwWjRXMUQ0T3VqenM1ZHlabXZydXZ2QnZ5VTM4?=
 =?utf-8?B?dzBhVmhPcHRYeGJoNnBzRmJzaDVIOTU4LytjNWpHN2Y5WGJxeWRaVGg1bTZH?=
 =?utf-8?B?akZyd0xqZjVaMUU3Z3dEUFZKU2UvRVp4UlZsSUlvMG50TGJPQkxJdk9uT0hM?=
 =?utf-8?B?dk0rSjF2bFZCcWxpQ056NmlDYTV6WkJVa2kyVysranhMeGwyQzFUMUJhZ1c1?=
 =?utf-8?B?OUdHSklRY2dicC9ReTg2N3RaQzh4aTk4S1A1cDFaVTNsU2J2RVltaDBHTy9o?=
 =?utf-8?B?OWxJRmdWQkpuOGtEM3pKVXJMcmMvZXR1a29HaHJKRjVFVzFjVjBreXdDSHVj?=
 =?utf-8?B?WHJmYUxXTnBpS2gySU9lR1VFaWsrT25hMzhxMWRtWThKbWFNblUwWGRrRHFX?=
 =?utf-8?B?VGZZWFBmZlBXekd6S0d0RFcyQXdyZ2sxdzYyajVGUGpsYmN3Z1cyTUNMcnB0?=
 =?utf-8?B?SGdCRW8xSTFMUitnR3VtZUtiaVpxN1hPWnRvcnVZUFJhVEl5UDVZVHAySDZV?=
 =?utf-8?B?Nnc3bHlLV2JDM1lOSzNna0ExZ0tHelBsa25IQUluSnRJcEx6eDViOG1BNStX?=
 =?utf-8?B?T25WZ08ycTFFTEg4SVl2anJadVVUNW9TN1RMSnVBbHlLcnIrN2pvVXhWVStV?=
 =?utf-8?B?UDY1RVlEc1E3WG5aWjMyVyt6MzRrQ3dHMkdEYUFFaUJVWktvbFVoOVB1YUpX?=
 =?utf-8?B?eS9YTzBUTUR3VjFSR2xtbjVJZXcxRGsvck1KWVU3V05YSGUvNmxLS0xWWjc4?=
 =?utf-8?B?b2w3OUpOV3YwM1ZHbVFIZkltejdOZ29FdTg2VXpaS3VKdkVZbUlTNXBkV3dM?=
 =?utf-8?B?TkVydTVodnFYVXJRUHpCV1Zrc2ZwenVEMFRzbzRMR0hvUU10aTM0b3dvS2pO?=
 =?utf-8?B?Y2l0cUh4RGt0UFA5OFVva25qT2NCdDd3NWs0WEFTQ1d3U1lPcXlxaDhiMUxC?=
 =?utf-8?B?aFZhZGhBaXcxTytuL1JIUFhFS3FGemJ6TzFiTlVza2JOTzVkZEozYk1ZQkE5?=
 =?utf-8?B?cDdqT1RCMm1heS93NGYvUENHSkRHbHlscTFKQXk3aXNmQnJmQ2FBbnFJcHFW?=
 =?utf-8?B?VDlGRmlaNDdOaldvV0dIazl5YThwUk9WZ25kcTFiUXZ1bFJ6MXNBS2hHa1M1?=
 =?utf-8?B?L2Z1enRCYnpoUVZmdGlEak4vYlJMYlMzTDlwTnBhSFRtMVArUlRvTFZGQVU0?=
 =?utf-8?B?S1hSSUpzNFljUE92QlV4SWpJZHJDQTh6blgxMnRaNEhFUW1oSlR0WnBmT2tu?=
 =?utf-8?B?SFVGU2pjM2p5T2FQZHh4TCtmL21RWUVSejdQN1ljbUd2RVNCK3BFZmE1OXBT?=
 =?utf-8?B?YlVEU3lBUWVDSWVuUlRrQUdUNXRWTnFqd3p6d1hGWm1pZ1dvZTd6UkJGcGFv?=
 =?utf-8?B?N1FmcGtqbnE0dzRXVUovN0JDY3V6YS9vVXRwbVpCZ3JrNlZlcHNEcThWVWQx?=
 =?utf-8?B?TzBqRkhlOUwvakJjL0ZLUXNPcUVxZmRGb2wyL1dKMXAzSU5lZEhtNU5aOGNu?=
 =?utf-8?B?clNNWXNBdXJNOWlva1FKNXhJRTA5VnAvTUFtc1VTaU1zU3dkcWEzUERGRjNB?=
 =?utf-8?B?Q0ZkRjE5WWIwZkFhWm9IemVtQlJVNnQyVTNJNUk5VlpiREY0VFZ2ZGRJdGdZ?=
 =?utf-8?B?YWlicmFuOEI5WXIycDROeXdVbCttMnRaWFBTc2haQjlGVDNKQklBOFo4T2NE?=
 =?utf-8?B?RmRZMDZ0WTU0WEFCL2tua1lUN3lhMkd6NlpNc2JDdHp5UGVRNEtaaGg1cGwx?=
 =?utf-8?B?NzgxaE9VNUh6Vk5oUGFMaThGMXd3d01vV1ZNS1FvVHN3SVhlbjlPd2FwT2xQ?=
 =?utf-8?B?MXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a1c63e-c287-4623-829c-08dccc691f94
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 22:38:26.0016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2G5otPI81fvSuBMn6PhWz2nw0C+LmExVSWomcMfHorlCmpoeAVm5hemnsjeT2YJgwJpWcLEN89QQSXbLUhlHyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8371
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

This message was very useful to ensure that Xe was taking all
the needed outer runtime pm references. However, at this point
it is only a false positive. So, remove it.

False positive cases:

1:
[184.983389] xe ...: [drm] Missing outer runtime PM protection
[snip]
[184.984096]  drm_ioctl+0x2cf/0x580 [drm]
[snip]
[184.984710] xe 0000:00:02.0: Runtime PM usage count underflow!

In this case the underflow is the problem since we are sure that
the ioctl is protected. But something else is abusing the 'put'
calls.

2:
rpm_status:           0000:03:00.0 status=RPM_SUSPENDING
console:              xe_bo_evict_all (called from suspend)
xe_sched_job_create:  dev=0000:03:00.0, ...
xe_sched_job_exec:    dev=0000:03:00.0, ...
xe_pm_runtime_put:    dev=0000:03:00.0, ...
xe_sched_job_run:     dev=0000:03:00.0, ...
rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
console:              xe 0000:03:00.0: [drm] Missing outer runtime
		      	 	       	     	     PM protection
console:               xe_guc_ct_send+0x15/0x50 [xe]
console:               guc_exec_queue_run_job+0x1509/0x3950 [xe]
[snip]
console:               drm_sched_run_job_work+0x649/0xc20

At this point, BOs are getting evicted from VRAM with rpm
usage-counter = 2, but rpm status = SUSPENDING.
The xe->pm_callback_task won't be equal 'current' because this call is
coming from a work queue.

So, pm_runtime_get_if_active() will be called and return 0 because rpm
status != ACTIVE (but equal SUSPENDING).

The only way out is to just grab the reference and move on.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index da68cd689a96..e1a5e43b0f34 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -592,20 +592,14 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
  * xe_pm_runtime_get_noresume - Bump runtime PM usage counter without resuming
  * @xe: xe device instance
  *
- * This function should be used in inner places where it is surely already
+ * This function should *only* be used in inner places where it is surely already
  * protected by outer-bound callers of `xe_pm_runtime_get`.
- * It will warn if not protected.
  * The reference should be put back after this function regardless, since it
  * will always bump the usage counter, regardless.
  */
 void xe_pm_runtime_get_noresume(struct xe_device *xe)
 {
-	bool ref;
-
-	ref = xe_pm_runtime_get_if_in_use(xe);
-
-	if (drm_WARN(&xe->drm, !ref, "Missing outer runtime PM protection\n"))
-		pm_runtime_get_noresume(xe->drm.dev);
+	pm_runtime_get_noresume(xe->drm.dev);
 }
 
 /**
-- 
2.46.0

