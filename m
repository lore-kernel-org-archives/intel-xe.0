Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B244C54F30
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 06:35:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3170E10E7EE;
	Fri, 30 May 2025 06:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aQpv1DPg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8DBE10E7EC
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 06:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748586902; x=1780122902;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=drLi6iIrdJz6E73wKZD+As01qgCImkmuhFkhcXPfnaw=;
 b=aQpv1DPglyHgFK63erfrDLtEQmxUWmt3dFVG3gTyPhlu4wK7RraoboQX
 MJJJj13zgsJDJzHjCEJg2HAtkr7KUE1d2X79blpt9B5LzJ8utqp0TSX0t
 zDTzVCZhriIqOnBoFle+8743SyFByeJavULr0yO/WdjNHtSfzYAVBuDhP
 fPPqTDT7u5vFVvbKNWxvbHufpnFIY+40B1pw7FIiJXG62rf3Hzn3hcb6H
 z8pjD24A5SHHIpwGIrzEgRU3vDtGSNvICo8qqTrEUjqtt8Ku1yd9RNq56
 23ihjm2QKsa0Fioq6CaOikIPSq+3daWmiugJ1WC/ZCnK4auSKCH/9I9Jl A==;
X-CSE-ConnectionGUID: /VwXvUGPSQi9ogjeDGi2+Q==
X-CSE-MsgGUID: glPPte6wQ0yVGLjvZKC7IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="68222789"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="68222789"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 23:35:00 -0700
X-CSE-ConnectionGUID: KhSgK3WsSkiMhg92GVB5JA==
X-CSE-MsgGUID: iUHaapGuQWOr5MYYBiQAZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="143611676"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 23:35:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 23:34:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 23:34:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.51) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 23:34:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLXeuF3rlRBaGAYy5n3MkPZ8M+wSsFh8Z/+l9bE3FeL9nu+E1CuNpsYmB2e9itodlzCHa0+tVWELY0g/qbyiuZyxfyNz3rBNNndy/NoZMa2PpU4VQNCGPawDs/heh4QKYHrQsdH3gG/89dFjwobN6NtdlZLkH9qRdoHHGDXYxFrUGGSh5HcGF0DRnUYupbelrx0Htm/pNpVID+wemuH2g7oovPkehJtQusLSHdr8IvsVxqrQ4dI39W5LcBbAgfpTxM8ackzCU/iNdd2fcdKyPrV8Mx9UYUMHzXFmXLi/v/0aCI8cwt8UbFevEyt5yvEC/nP02M/FkKFkj3Zcwv2kkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HpY9VR2x9zepQKMz2si4JBQ3HlzuaWGZlCPBww505g=;
 b=xshmqmtGwQDA1QkXNmFW8hJHWsLzc9Drgg9qZs8PJi/BU1oAo7gX2Hl/znWzPvZDEvZMUR9zW2zvhOvy6IIlvRN8WBWszUgIV38MIXedGlLhXrN/jnI7zTeM6gu+ZOOqeAlP7XaMIrN0IA4iJI0WKb6A7eLfaUHw9kSDkeKkloN5IDpByxA/cOX0Rsnmlm+jfhSHcHslfIwppBhVSaZ4riaKLKHxqOT8oIai+BYnVFXxdiFN6h2bOsmVcN8wRuHa6diUwRLpIZ7DQaQAv9bcVqafWl3qu+Urk2JmgRkU0fbJ2J7+tUXnzJ+58aOuiau1YrzLI347b6F1cUz1QTqqrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB8225.namprd11.prod.outlook.com (2603:10b6:8:188::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Fri, 30 May
 2025 06:34:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 06:34:41 +0000
Date: Thu, 29 May 2025 23:36:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 10/19] drm/xe: Implement madvise ioctl for xe
Message-ID: <aDlR3SHcWKwQXpMb@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-11-himal.prasad.ghimiray@intel.com>
 <aDjjHAk3xkU4nWOU@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aDjjHAk3xkU4nWOU@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:303:2b::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: 869afe34-7b2f-4bec-0133-08dd9f440ee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N01pR3dJS2dWT2s5S0FPSWRKRVZCRkRrNzZFeEk2UHc0NW5VUjEyanpLY29a?=
 =?utf-8?B?R0Mvc2ZOa1FrSnhXWFIyRWFzdDdTNkJDVGZsN1gybUVhVzdybFFkZDdvWnNs?=
 =?utf-8?B?SU8zMU9tRHNOMGVNNXZiVEhZN0R1YWhZdlhUSG4vM2JNdmptYVhtcE9pcFVo?=
 =?utf-8?B?Q1ZBZ2Y0TVVyNjFlYzJlaExxUXVlN08xQWJjMHYrRFM2NXZScjlLbmR6U3hn?=
 =?utf-8?B?Y2t0aEdUUnY1ekZMMjJhSmFYZkV0elp1MHNxSnNKQjNRdGcrVU9PS20wd0c0?=
 =?utf-8?B?b0t6czJrenFZdGlEdTl3TG9rdU1XYVViNllka3ErVnV2MWlaTzFOLzkrdm4w?=
 =?utf-8?B?bVZEdy9GQUw1dEFSU2w2RUNUOXRwNkVhWEJob2xSZmlIaFVkbDRKUk1KYWlk?=
 =?utf-8?B?dlVwMXp4Q1crUEhsQzFLUHFlYnpDcGJDdUxiN0RVaFcxdEpDZWFvWnh4MXNB?=
 =?utf-8?B?YVBKUi9DcFZXRlBNblV4QVE5QnFnaDVvMXFmYVFNQXVOUnVUQlI2ZHZvdC9I?=
 =?utf-8?B?a3BPR21IOEdiSVJTZi9KMmpMYUxWZVkrZzg4a2lDM2REODVCSXhSTDF6UWJr?=
 =?utf-8?B?V0JIQjU5NVVWUEhCMnBlRHJ4c2djbkJCZUQ3YmpHejhRbWNoNER6QzkrcDNz?=
 =?utf-8?B?WDlYMkcrZDMxOE5xTHNoc2thbFMvRVpydVRGM2pxZ0RydWYrUHU0WlBMdUR6?=
 =?utf-8?B?UjZRZ0U1WjAzMUFuZUpidG5JRGZpMHh2eDZJemJvL3hLeW10Tm5MT1o5enpF?=
 =?utf-8?B?OXVKWnNFdkhwSy90ejhadFJmR2lPNW10WnBIMUpnZmMrWTJ4ZVE0ZklPRzdF?=
 =?utf-8?B?UC9yU25yQkljeUhNNy9GZW82VGtrVitqRktQQ2xkYktERFpzNVdWaWpmRmox?=
 =?utf-8?B?eWVOUkNkL3pVdUpNRlJzWVJFWVBzaDhrU2tsckpaaWVQbjdsMzd0azBsWVJT?=
 =?utf-8?B?b2Y2YzRnTGY5clhEUDhRTHVLK0dBMC9QdkJLaEl2VHRja1NQMkkxZ0hucHlx?=
 =?utf-8?B?S3g1N20wbEZaclJhc2Q5Q3YyRzFMVDRwOHNDV2d0YTJ5QWV4NFFvMS94OFdn?=
 =?utf-8?B?NWZlQjdNL2FCWS9WNDJUNVRJeGRpcllYd2p4dG9nWUZhLzlBVTZ6WTNOZWk0?=
 =?utf-8?B?eFNTM2xwS2dsMndLd0ZGVUNaUHRmclZPbk9qbG91eE1BakxXS1V1WTRhNVZr?=
 =?utf-8?B?Qkg2Tk9TZU9mWlpzQWRzZ0tyeXdWNGdnNXgweGg5Vjg0ZmxzbU9oOHdPZldl?=
 =?utf-8?B?SHZuNmVpQ2U5ZGdNck9BQys4QWVTTWU2M3JNODZNRFNaNzNYcjhPVDJ4YXMw?=
 =?utf-8?B?MXFaOC9aaElUNCtkVnV1V0w4Zjlxcm5GRkxEbDNTS3N2Y0t1VkUrS3pXcU85?=
 =?utf-8?B?SE5VM2hwREtpa0VOeFdpa0o2WVYxV1p6Mkk1Z3J4R3RpOFpoNUdQMTMwWDIr?=
 =?utf-8?B?NlViSDZ0ZS9mRGRpM1FiSDFPU01Xb2ZGRTJYTzVLTm16aGZzSHRpYXIxV0VS?=
 =?utf-8?B?d1ZGSi9qY2dyMEJMSVJFOHdKcjlaQkE4VHY1V0tyb3VXcy9CZ2xFMXE2OFNF?=
 =?utf-8?B?LzBqZEl0YUdOck5OSG84dEUzdVg3L0VwU0tQR3lFdlg0ZEV2RTc4bWJMT3ph?=
 =?utf-8?B?cUcrSzMvQ0hicHBrQXg5RzZZeVk5c3FyOHoxRlcwSitxQlJ2OWN1N29uS3lB?=
 =?utf-8?B?Si9Ib0VBUWdacHNHV084Q2xLZ2F1RHM0ekFyV1U3alYwbGhwd3hWOHg0QWtr?=
 =?utf-8?B?UzhhR0wrMkRuMFl5UGIrbFJjSXVqQlNtSkNOOWZ0ZWJweGYwNitacnVRSzls?=
 =?utf-8?Q?kkjVnQ7+K198pd+SGDQnaqtG1uS7ggeINAb8U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHJ1dmRzcGNOZmpTNUtOcmFtNjFRMjd1S2RKRVZqbXN3ckt3RGhRbGJJZkow?=
 =?utf-8?B?SnZ1V0VnKzlGSUVMTDh3aDYrek0zOEtHSHF3T0phKzY4WVNtUUt4UzN3VFM0?=
 =?utf-8?B?UFBTTGc3MUhBRE4zbEdHeFd1WEtnQS9FL2Z6dHVVTFlGbTI5ZDArdWNyaEp5?=
 =?utf-8?B?MHZRQ1dWWUd4My9kNDhVaVYyM0YzcHFPVTV3ZkVOa0xoYnJ3bkwwejdUNDJp?=
 =?utf-8?B?ZlVzdnRKd250ejZqVnR5VkgvbGFUR01qQ1kzSExMM29WTlF1R3RjQkZGVmVY?=
 =?utf-8?B?dG9HWWF4UU52YlFqeDF4elVJVlVndE92ZjhSd21CRDdnQklQRitqdC9VTW9O?=
 =?utf-8?B?Wkl0VE9FdGxvUkg1UmNhNzc1YzhMQ0VDQTd3M0RpZjB3SVoxZ0ZkdFUvSVBZ?=
 =?utf-8?B?Z2FWblNyMzZ0N0EyYVZNY1BuSEhBbVhqWEx1bkFVdzY4N2N6ZmUvZlNmQWtP?=
 =?utf-8?B?Um1wTkJlM3JScTdBSmxjRWVadXd0RlpmUlJGcFhqRFYvU2RNak10ZXd4Rllj?=
 =?utf-8?B?UHZCcFY1VGVLRHhUVDB4NDJsY25hcURWS2craCsxZWxKaUdCeFZ0cFFKUUp0?=
 =?utf-8?B?dkFncjEzMExSaGI5YkZIY3p1WGZ1dEdRYVlEOTRKWGhIUVpZbWdqb0l1RXdh?=
 =?utf-8?B?RVJFaFNrN0dpVWNHZVFzYVNHL2MvcWtHUkhMbkdMZUxHV0dpckpIcWQ2MlJR?=
 =?utf-8?B?OFdwNHgwNmNBWTF6QmFDVkUyNmpHYWZxWEJacTZvc2Q2YnhLRGh3UE9hMW8w?=
 =?utf-8?B?ekdBczYxOWpVTDhsM081SXQrT2NkalRmcS91Z0RzK3JYZ01kOTNBNDJhQnJY?=
 =?utf-8?B?MWQvbWFYaUpmWnBsb3dMN2FRZkNqVHI3TFhza1FsSmVHRTQ2Z1RWTXJ3TFVo?=
 =?utf-8?B?aXVidnU5N2s2WHBQSnUzQmdhaWV1dFIxNUR6cjVMdzdIMG1QMVhJL2Q5UzJH?=
 =?utf-8?B?THhsMlovSzZZV0hkQy9EeGNoWVlHeDRUeXBITXZnTG5nN2VZOStxR1l0Sk5W?=
 =?utf-8?B?UmJvNFM4QXRvelFvSkRxa0JBTE9nQVRMcCtKaGEyUm9RR0Fvc0RRYmc4VE1k?=
 =?utf-8?B?Y3hTUkxTM1RvZjRabDZnR09XL0trZUVjenltTytuUTFJY3ZIWW53S29hMXUx?=
 =?utf-8?B?ak9vWk1hWlBQazRmaCtUa2VXaHZmelRiNGwwelU3ZUExd1Z6Mnh2RVlPUWRZ?=
 =?utf-8?B?UXJLODR2WWVBZEpYMWJIN3JNdEdMNDRlUGdVdG9oREpuTWNOTkNMUUN4ZE9p?=
 =?utf-8?B?R3dGdGNoR1p4cko3RTFLellFZTdmUDVkeml0eEQ5ODRQRmQ5aGwzN0FTTlVV?=
 =?utf-8?B?ZXQ1cENqRVl1Vmc3UUZRellZNEJENG9UMlZlR0JpLzE4b1o4UHpFTnpTcHZy?=
 =?utf-8?B?dkpyak1tUzVzUHFEemswRk9JQkdEOGxxMnpzVEZpRXU5ZVRNakVzL2FzNGM5?=
 =?utf-8?B?TnVaR3NseTNpNlJkRi9UYmlrV1JUTWMzb1ROdzgwSnlHdHRxY21OdWcxd0tV?=
 =?utf-8?B?eldXbDlvRlo3aWdMQ09ubmlYY1V2WUhFRG5nNzZQV1RLU1I0b2k0RU1BSzN0?=
 =?utf-8?B?NXRKU1NkU1dPV0kwTDFhZllZZEVEZGhsUk9FZk4vTDZzemRNQzFud1NZYnRa?=
 =?utf-8?B?dXE0MCtFM0o0K2h0eCtPZ1NYZjZaS1ZJU0xDNWN0WDIzTEZQNm9EeFAyWVZ5?=
 =?utf-8?B?Q01EWXJKanJ1TGk4K2JuREhSS3ZMVnN1MCtyRC9Ibm40SlNpcG9MUVoxUHFW?=
 =?utf-8?B?Tkg4QklqY2NoSnlBS1k1VmdhV2VRM2h0SmY0YmlMWUxTeHVDMWZIb1hxblVG?=
 =?utf-8?B?Zyt5NFVZa0hmM2Fhcm1JZWRLYVd3Z0I3VXRPbmpBY0JZZ3JLQXQ1NElJMlF2?=
 =?utf-8?B?bHo0Rk5wSlhSMW1UQVpwUzRnMm90RGlQdmZ4Z3g4NFpYN0QyUm9IMUUrK2Jw?=
 =?utf-8?B?Qm1rREhtNjlKVHVNNUdIZTV5UVpRaFVwRnBBRFpvbVQxQ2U5T1VST0JVVExC?=
 =?utf-8?B?czQ3Y1VoeEo5bzcyYTFSQ1F2ZjJueWF6TXZUNnhVcnJOQnE2cjVaL0Z2U0xk?=
 =?utf-8?B?bmY3ZC9mMWVBOFc2eXRUeFQ4TmFRU25zVFcwYTl0UjZWRFdFSTNVSjBzb3F3?=
 =?utf-8?B?UlYxcG1iK0RvalV5bGJkdkF0elZlKzVvNzdDVFBrL3Nqckdqa0QvbmtDcUhD?=
 =?utf-8?B?QXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 869afe34-7b2f-4bec-0133-08dd9f440ee4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 06:34:41.5076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBdjgxuKnwit9P3uTZR02JNv48CtkXFSD97S0q50hpSQeSa9+gLKdPUt9iP2dpTIeqSUUSSkH/w0SjtkGmc1gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8225
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

On Thu, May 29, 2025 at 03:43:40PM -0700, Matthew Brost wrote:
> On Tue, May 27, 2025 at 10:09:54PM +0530, Himal Prasad Ghimiray wrote:
> > This driver-specific ioctl enables UMDs to control the memory attributes
> > for GPU VMAs within a specified input range. If the start or end
> > addresses fall within an existing VMA, the VMA is split accordingly. The
> > attributes of the VMA are modified as provided by the users. The old
> > mappings of the VMAs are invalidated, and TLB invalidation is performed
> > if necessary.
> > 
> > v2(Matthew brost)
> > - xe_vm_in_fault_mode can't be enabled by Mesa, hence allow ioctl in non
> > fault mode too
> > - fix tlb invalidation skip for same ranges in multiple op
> > - use helper for tlb invalidation
> > - use xe_svm_notifier_lock/unlock helper
> > - s/lockdep_assert_held/lockdep_assert_held_write
> > - Add kernel-doc
> > 
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile        |   1 +
> >  drivers/gpu/drm/xe/xe_device.c     |   2 +
> >  drivers/gpu/drm/xe/xe_vm_madvise.c | 264 +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_vm_madvise.h |  15 ++
> >  4 files changed, 282 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index c5d6681645ed..dc64bdcddfdc 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -117,6 +117,7 @@ xe-y += xe_bb.o \
> >  	xe_uc.o \
> >  	xe_uc_fw.o \
> >  	xe_vm.o \
> > +	xe_vm_madvise.o \
> >  	xe_vram.o \
> >  	xe_vram_freq.o \
> >  	xe_vsec.o \
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index d4b6e623aa48..b9791c614749 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -61,6 +61,7 @@
> >  #include "xe_ttm_stolen_mgr.h"
> >  #include "xe_ttm_sys_mgr.h"
> >  #include "xe_vm.h"
> > +#include "xe_vm_madvise.h"
> >  #include "xe_vram.h"
> >  #include "xe_vsec.h"
> >  #include "xe_wait_user_fence.h"
> > @@ -197,6 +198,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
> >  	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
> >  			  DRM_RENDER_ALLOW),
> >  	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
> > +	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
> >  };
> >  
> >  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > new file mode 100644
> > index 000000000000..f7edefe5f6cf
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > @@ -0,0 +1,264 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#include "xe_vm_madvise.h"
> > +
> > +#include <linux/nospec.h>
> > +#include <drm/ttm/ttm_tt.h>
> > +#include <drm/xe_drm.h>
> > +
> > +#include "xe_bo.h"
> > +#include "xe_gt_tlb_invalidation.h"
> > +#include "xe_pt.h"
> > +#include "xe_svm.h"
> > +
> > +static struct xe_vma **get_vmas(struct xe_vm *vm, int *num_vmas,
> > +				u64 addr, u64 range)
> > +{
> > +	struct xe_vma **vmas, **__vmas;
> > +	struct drm_gpuva *gpuva;
> > +	int max_vmas = 8;
> > +
> > +	lockdep_assert_held(&vm->lock);
> > +
> > +	*num_vmas = 0;
> > +	vmas = kmalloc_array(max_vmas, sizeof(*vmas), GFP_KERNEL);
> > +	if (!vmas)
> > +		return NULL;
> > +
> > +	vm_dbg(&vm->xe->drm, "VMA's in range: start=0x%016llx, end=0x%016llx", addr, addr + range);
> > +
> > +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, addr, addr + range) {
> > +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> > +
> > +		if (*num_vmas == max_vmas) {
> > +			max_vmas <<= 1;
> > +			__vmas = krealloc(vmas, max_vmas * sizeof(*vmas), GFP_KERNEL);
> > +			if (!__vmas) {
> > +				kfree(vmas);
> > +				return NULL;
> > +			}
> > +			vmas = __vmas;
> > +		}
> > +
> > +		vmas[*num_vmas] = vma;
> > +		(*num_vmas)++;
> > +	}
> > +
> > +	vm_dbg(&vm->xe->drm, "*num_vmas = %d\n", *num_vmas);
> > +
> > +	if (!*num_vmas) {
> > +		kfree(vmas);
> > +		return NULL;
> > +	}
> > +
> > +	return vmas;
> > +}
> > +
> > +static int madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
> > +				     struct xe_vma **vmas, int num_vmas,
> > +				     struct drm_xe_madvise_ops ops)
> > +{
> > +	/* Implementation pending */
> > +	return 0;
> > +}
> > +
> > +static int madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
> > +			  struct xe_vma **vmas, int num_vmas,
> > +			  struct drm_xe_madvise_ops ops)
> > +{
> > +	/* Implementation pending */
> > +	return 0;
> > +}
> > +
> > +static int madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
> > +			     struct xe_vma **vmas, int num_vmas,
> > +			     struct drm_xe_madvise_ops ops)
> > +{
> > +	/* Implementation pending */
> > +	return 0;
> > +}
> > +
> > +static int madvise_purgeable_state(struct xe_device *xe, struct xe_vm *vm,
> > +				   struct xe_vma **vmas, int num_vmas,
> > +				   struct drm_xe_madvise_ops ops)
> > +{
> > +	/* Implementation pending */
> > +	return 0;
> > +}
> > +
> > +typedef int (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
> > +			    struct xe_vma **vmas, int num_vmas, struct drm_xe_madvise_ops ops);
> > +
> 
> See my latest replies in patch #19, if possible, making these functions
> so they can't fail would be best.
> 
> > +static const madvise_func madvise_funcs[] = {
> > +	[DRM_XE_VMA_ATTR_PREFERRED_LOC] = madvise_preferred_mem_loc,
> > +	[DRM_XE_VMA_ATTR_ATOMIC] = madvise_atomic,
> > +	[DRM_XE_VMA_ATTR_PAT] = madvise_pat_index,
> > +	[DRM_XE_VMA_ATTR_PURGEABLE_STATE] = madvise_purgeable_state,
> > +};
> > +
> > +static void xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end, u8 *tile_mask)
> > +{
> > +	struct drm_gpuva *gpuva;
> > +	struct xe_tile *tile;
> > +	u8 id;
> > +
> > +	lockdep_assert_held_write(&vm->lock);
> > +
> > +	if (dma_resv_wait_timeout(xe_vm_resv(vm), DMA_RESV_USAGE_BOOKKEEP,
> > +				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
> > +		XE_WARN_ON(1);
> > +
> > +	*tile_mask = xe_svm_ranges_zap_ptes_in_range(vm, start, end);
> > +
> > +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
> > +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> > +
> > +		if (xe_vma_is_cpu_addr_mirror(vma))
> > +			continue;
> > +
> > +		if (xe_vma_is_userptr(vma)) {
> > +			WARN_ON_ONCE(!mmu_interval_check_retry
> > +				    (&to_userptr_vma(vma)->userptr.notifier,
> > +				     to_userptr_vma(vma)->userptr.notifier_seq));
> > +
> > +			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
> > +							     DMA_RESV_USAGE_BOOKKEEP));
> > +		}
> > +
> 
> I think the similar code in xe_vm_invalidate_vma is a bit stale and
> contains remnants from when we issued the userptr TLB invalidation
> outside of the notifier lock in the MMU notifier. There, it should be:
> 
> if (xe_vma_is_userptr())
> 	lockdep_assert(userptr notifier lock held);
> 	extra sanity checks
> 
> So with that, you need the userptr notifier lock in read mode here.
> 
> Also, I think the first WARN_ON is likely to always trigger here, as the
> CPU pages are likely valid, so that one should be removed.
> 
> In xe_vm_invalidate_vma, the extra tests are protected by the
> PROVE_LOCKING Kconfig option. So if you keep the dma-resv check, I’d
> recommend hiding it behind PROVE_LOCKING.
> 
> Note: speaking of the userptr notifier lock, Matt Auld has a patch
> series [1] to unify this with the GPU SVM notifier lock. If that lands
> before your changes, then you should use the SVM notifier lock in read
> mode for userptr here.
> 
> [1] https://patchwork.freedesktop.org/series/146553/
> 
> > +		if (xe_vma_bo(vma))
> > +			xe_bo_lock(xe_vma_bo(vma), false);
> > +
> 
> Ah yes, you do need the BO lock here to prevent races from BO moves
> issuing a zap. Maybe we can update the xe_pt_zap_ptes lockdep assertions
> for userptr/BOs, along with some comments? We could do that
> independently of this series. I suggest this because I had forgotten how
> this worked in the previous revision. Maybe I can post this
> independently.
>

I posted a patch for this [2] and also realized a few more things. These
locks need to be held for an extended period, as detailed here [3].
Additionally, you don’t set vma->tile_invalidated here — you’ll need to
do that. Make sure to use WRITE_ONCE when doing so, and include a pairs
with comment like in [2] and in the existing SVM code for the
tile_invalidated / tile_present ranges.

Matt

[2] https://patchwork.freedesktop.org/series/149676/
[3] https://patchwork.freedesktop.org/patch/655898/?series=149550&rev=1#comment_1201162 

> > +		for_each_tile(tile, vm->xe, id) {
> > +			if (xe_pt_zap_ptes(tile, vma))
> > +				*tile_mask |= BIT(id);
> > +		}
> > +
> > +		if (xe_vma_bo(vma))
> > +			xe_bo_unlock(xe_vma_bo(vma));
> > +	}
> > +}
> > +
> > +static int xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start, u64 end)
> > +{
> > +	u8 tile_mask = 0;
> > +
> > +	xe_zap_ptes_in_madvise_range(vm, start, end, &tile_mask);
> > +	if (!tile_mask)
> > +		return 0;
> > +
> > +	xe_device_wmb(vm->xe);
> > +
> > +	return xe_vm_range_tilemask_tlb_invalidation(vm, start, end, tile_mask);
> > +}
> > +
> > +static int input_ranges_same(struct drm_xe_madvise_ops *old,
> > +			     struct drm_xe_madvise_ops *new)
> > +{
> > +	return (new->start == old->start && new->range == old->range);
> > +}
> > +
> > +/**
> > + * xe_vm_madvise_ioctl - Handle MADVise ioctl for a VM
> > + * @dev: DRM device pointer
> > + * @data: Pointer to ioctl data (drm_xe_madvise*)
> > + * @file: DRM file pointer
> > + *
> > + * Handles the MADVISE ioctl to provide memory advice for vma's within
> > + * input range.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > +{
> > +	struct xe_device *xe = to_xe_device(dev);
> > +	struct xe_file *xef = to_xe_file(file);
> > +	struct drm_xe_madvise_ops *advs_ops;
> > +	struct drm_xe_madvise *args = data;
> > +	struct xe_vm *vm;
> > +	struct xe_vma **vmas = NULL;
> > +	int num_vmas, err = 0;
> > +	int i, j, attr_type;
> > +	bool needs_invalidation;
> > +
> > +	if (XE_IOCTL_DBG(xe, args->num_ops < 1))
> > +		return -EINVAL;
> > +
> > +	vm = xe_vm_lookup(xef, args->vm_id);
> > +	if (XE_IOCTL_DBG(xe, !vm))
> > +		return -EINVAL;
> > +
> > +	down_write(&vm->lock);
> > +
> > +	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
> > +		err = -ENOENT;
> > +		goto unlock_vm;
> > +	}
> > +
> > +	if (args->num_ops > 1) {
> > +		u64 __user *madvise_user = u64_to_user_ptr(args->vector_of_ops);
> > +
> > +		advs_ops = kvmalloc_array(args->num_ops, sizeof(struct drm_xe_madvise_ops),
> > +					  GFP_KERNEL | __GFP_ACCOUNT |
> > +					  __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> > +		if (!advs_ops) {
> > +			err =  args->num_ops > 1 ? -ENOBUFS : -ENOMEM;
> > +			goto unlock_vm;
> > +		}
> > +
> > +		err = __copy_from_user(advs_ops, madvise_user,
> > +				       sizeof(struct drm_xe_madvise_ops) *
> > +				       args->num_ops);
> > +		if (XE_IOCTL_DBG(xe, err)) {
> > +			err = -EFAULT;
> > +			goto free_advs_ops;
> > +		}
> > +	} else {
> > +		advs_ops = &args->ops;
> > +	}
> > +
> 
> See my reply in patch #19, I think we should validate user input ahead
> of the below loop rather than failing mid-loop on bad user input.
> 
> > +	for (i = 0; i < args->num_ops; i++) {
> > +		xe_vm_alloc_madvise_vma(vm, advs_ops[i].start, advs_ops[i].range);
> > +
> > +		vmas = get_vmas(vm, &num_vmas, advs_ops[i].start, advs_ops[i].range);
> > +		if (!vmas) {
> > +			err = -ENOMEM;
> > +			goto free_advs_ops;
> > +		}
> > +
> > +		attr_type = array_index_nospec(advs_ops[i].type, ARRAY_SIZE(madvise_funcs));
> > +		err = madvise_funcs[attr_type](xe, vm, vmas, num_vmas, advs_ops[i]);
> > +
> > +		kfree(vmas);
> > +		vmas = NULL;
> > +
> > +		if (err)
> > +			goto free_advs_ops;
> > +	}
> > +
> > +	for (i = 0; i < args->num_ops; i++) {
> > +		needs_invalidation = true;
> > +		for (j = i + 1; j < args->num_ops; ++j) {
> > +			if (input_ranges_same(&advs_ops[j], &advs_ops[i])) {
> > +				needs_invalidation = false;
> > +				break;
> > +			}
> > +		}
> 
> I'd drop this extra check. The invalidation code already short ciruits
> on the tile_present / tile_invalidated bits in the range or VMA so I
> don't think an extra short circuit here buys us a ton.
> 
> Matt
> 
> > +		if (needs_invalidation) {
> > +			err = xe_vm_invalidate_madvise_range(vm, advs_ops[i].start,
> > +							     advs_ops[i].start + advs_ops[i].range);
> > +			if (err)
> > +				goto free_advs_ops;
> > +		}
> > +	}
> > +
> > +free_advs_ops:
> > +	if (args->num_ops > 1)
> > +		kvfree(advs_ops);
> > +unlock_vm:
> > +	up_write(&vm->lock);
> > +	xe_vm_put(vm);
> > +	return err;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
> > new file mode 100644
> > index 000000000000..c5cdd058c322
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
> > @@ -0,0 +1,15 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_VM_MADVISE_H_
> > +#define _XE_VM_MADVISE_H_
> > +
> > +struct drm_device;
> > +struct drm_file;
> > +
> > +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
> > +			struct drm_file *file);
> > +
> > +#endif
> > -- 
> > 2.34.1
> > 
