Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF32C25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 14:34:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9991410E00B;
	Mon,  3 Jun 2024 14:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YOx150xY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A4B10E00B
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 14:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717425243; x=1748961243;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MQPdoIJh1Fd1LZoF2AJ6AmVVJl81w6p9r3B/uMn0h4w=;
 b=YOx150xYExBWfecRGhqUhqZVSRjj464GKHQyz2ZpzTfW/T5huwM70NWM
 ywPfprQAAEGkCk3KUbrfEQOI9PaDWtghsdijcEwKMzS241SPwnfc2fMB2
 zVyXq9yusYhVC6vNW4n7lVZWYz0PW3F7iz6aWqi4VwRy96I52SrxOA1TE
 nVj02ianhePf23nWU2QvKpMg/DtIrrjN4DrDhy7yvJzj7ELZVq8zKyzCn
 +Nuj+X3vgaFcGrTn0LDphxMMn7Y9VlWT9lqWVlMLbAdpS4S1yRMocl8t8
 cTKEH4hn8mpNl7T+5pcm6BxPylJon8FQFmYmQtgiW5eYsb+RzygHvqCe3 g==;
X-CSE-ConnectionGUID: 1jgpHHs9Sjak7O9l1napVg==
X-CSE-MsgGUID: Ojk0W5ibSoiKVGO7P0DVYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="11875213"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="11875213"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 07:34:01 -0700
X-CSE-ConnectionGUID: 7ea0jQKnQQGYk9QFM4D5Wg==
X-CSE-MsgGUID: Be1L0UNpRneqAEHc/baUZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="37353496"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 07:34:01 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 07:34:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 07:34:00 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 07:34:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X1aVAl1vWjzv4uQW3Xyue4V4FA88OuTVT4U87K3WhXKGx1YQlP6tCyPT20E/tJ9Fd+40ItnLulsEAwz/XkYcaUGRefrsQiDDLtteEMTMm3K2N5BbgDKJlkfcpyKffxdZvXhIVzI0hSbBpd5DJ3W3qA4hPv00D0xUr5U9gatp4NXKrxYoBvXEeKqchjgagWAsaheODSEUvhKp7YIIqx4cd+pclu34PJukjinzrAiFrIChOfY/It+3BpYov+DyDfH5WKY5DmYVOxhuAG6Xtu/c4nS7x91sN+8DBmFjH2YSRnkxjyUch+a8yqKw8u23ZdNE+LJBqv3urYgcUsn6N92agQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BBKWu0vcLaaX3p3RGodbXBwFe9ITxWta+wykpKIIFE=;
 b=e3ew0vu1ihBmvc5/kh2cg9AQozANr5rZEAhvNlZ9CiNVUdwtO4KRCOrA04GtorLSWL502vtIZiNBss1WiFUrwGfZzEqbLd51JsyE/TZJVDCmrdyUBLXAr1LNrt4RN84vt6dx242fl4df4MKNKBSHk3d6hr1NhxOxo0RRdTu3hdu0E6wgmUW5TB9+XcmjFGnkFivepByQBLinh6hmXxT0a8/AJ80W4pyLQ2dmd9cJa149pQG4pg8xsXFoivthuq1D4/lQmR9257PSfZTYkDZKNKXKe/fmy300xmHFjTsUlngPTL+EpuQTMhRoNOrSFLvaNWdb8d/5g+/EY9+uMCEPaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH7PR11MB6860.namprd11.prod.outlook.com (2603:10b6:510:200::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Mon, 3 Jun
 2024 14:33:55 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7611.016; Mon, 3 Jun 2024
 14:33:55 +0000
Message-ID: <f66c1a47-dcc9-44c2-acdb-5e964911b1cd@intel.com>
Date: Mon, 3 Jun 2024 20:03:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/xe: Add member initialized_domains to
 xe_force_wake
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240603090147.1098639-1-himal.prasad.ghimiray@intel.com>
 <20240603090147.1098639-2-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240603090147.1098639-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::26) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH7PR11MB6860:EE_
X-MS-Office365-Filtering-Correlation-Id: 10a7d7d4-d9b8-4533-5ab8-08dc83da327f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVAxT1N1VzByamN0ek1USFRScWpXU0ZwRGt0UjdmaHVWekFOa1M1WjJJdWtO?=
 =?utf-8?B?eVh3TEFNNkZzc0Y4dE50a01NQ0l3NVp0VXVCUWM1eldEZyt4eno5OW1kNmE2?=
 =?utf-8?B?SXE5QkI3SzRHK1dwQmFUamdUZlZKWkNIZm9rZFU4bDFWQWdLcWJaUXUyeVJl?=
 =?utf-8?B?TFcrSlhpMCtpL25oclNnYS9hd2RhdjgxZ2psMjRydG1leUhsZGNOU3dIdjh5?=
 =?utf-8?B?UXdWM0hkdG5PV1d3QUFsbVljRGFwNmVwYlVybGpwQzRiMVFQT2NicVMzODAx?=
 =?utf-8?B?UXltRmRyWDM0SzgwbXhJclkya2FiZVlHVGRoSk40REd4NmZ1anF1c3RYcFln?=
 =?utf-8?B?QmprTlIra2lZdnFjSmNGd3piUEFWQ04vS1EwbGxLOTRaQk9rRHlaUGEzNEx5?=
 =?utf-8?B?ZGs0WW5ROC9BVDBDVlpZNVZDQTRPbHBrc2p3QTA3UDlCUnl2a3dxVy9CSHRu?=
 =?utf-8?B?MUU1eDU2cG03MkUwSnd0bUc0MVdyL25EMzQ0K1JpcnNmZnNiQ1dQa09taG1L?=
 =?utf-8?B?d0RyMUlPQSt2bDA1Z2Z5QmxKL0tzOG9wMjN3M3RRdDQrTXN6eXJ6ZEVrL2FC?=
 =?utf-8?B?cmQyRlRHYm55WDJwN3kvMGRvWnc3ZkhSZXY0VjF2dHlmMVZYRUJUOVBZK1NH?=
 =?utf-8?B?R3NIV0NaV256VVAwWE9BcXNVTWUvWFVhU2hiUml4SDdSMlg0elA5UEIvUHdj?=
 =?utf-8?B?cXdvZFVDanpwWEd5a250TUhEclYvT3NkRUxuTTJVcy9tV2hqK3ZXNXh4dFFu?=
 =?utf-8?B?ZWtmWGtMSWtnSDhXOGdWYkJXL24vZnZwVDZ0UEZEQTRPTXkrUDE2Tks4L0k5?=
 =?utf-8?B?czZZdFRwbXh6QURWRFlaeUg4VFdDSFduMGtNeG5UQ3JMUVFuZnYxbXNjcjBK?=
 =?utf-8?B?VzVGL05wb2FnRnY2azVKcWFPZ0g3a3VZY202alg1RVpUVmR0eWZxd05DQzJD?=
 =?utf-8?B?YW5UcXZBeHFQVjJzd2w3WjBzVlZEbmdjOVNHUzB5aGtVWTQ2aytmVkdlaEhq?=
 =?utf-8?B?YjBWeTFvdzJ1NXRCcHJkdGVWUlI5R3F4MHg1Q0tjenB3K3ZXM05YTGJWd2VJ?=
 =?utf-8?B?c0syOVhXbGpveE9NSUtJQisrWThuUzRDUkh4bHppWUM3MDRncktLdTVha3N4?=
 =?utf-8?B?NlZMWC83STNsTWhKUUVNRno4R1ZjMzFNeFl2NHdJM0dLQjV0YzdKV2VNSVVi?=
 =?utf-8?B?QnA2RGU1M0w5VlBoU3BMWGVoamZSYWE5dmI5Y0FRUWZHeWhyem5GVFJ0bnJh?=
 =?utf-8?B?aDUydWJkWHBHNHdHM2ROTlRpK3lrYmlkMWpheEtEelJEOE43cStzanJpejdD?=
 =?utf-8?B?cUJzKytLY0dTODNpNU8zeXhock5UdFY4ZGpWMFhsTjZKOEN0L3BJL3BRRVhR?=
 =?utf-8?B?Ym1DaE0yTXFBU2JHOVFSQnF5WE5sckVTQUttZjNGUTdvZC9rVnFCUTV5SEkr?=
 =?utf-8?B?UXBoYnZaYlYwSVhpRTlQVHZEMWRRTkRkekVtUW1wLytNdGZ2VW5jaFFsTzZw?=
 =?utf-8?B?Mm5YUDFJQm5ZRmQ0Vmo1bnNuL1FFOE9qOFVqc2UvazNhbzJkNXBWdDFTQjRo?=
 =?utf-8?B?cGl3Uk5zSURDSHdJV3lhTzZPdWJCN3lhL2lFWk9PdlYxV3JOTmFIZWNzTTBs?=
 =?utf-8?B?NHdDZzVnOHh2cXNrMVVBNnFCUE9ud1krdm1oL3BtVnhpeitwRzhMaWxCS1NL?=
 =?utf-8?B?VjFJY3lINTJrWjIrb0drdjM0QTVtK0pFOS95Z3lEZXFlbWFpZUhMMERRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXd6UUE5NVhXeXR6MnlEdlhuUXF6bWdNamxjYTJ3RWdDRWppZEtRNTlrT05T?=
 =?utf-8?B?R05IQ3ZTZlBsM3A3ZVltQ2dXYk1JOEVDeGFWSEg4bmhNQVFQbjVENHhUZ1Ju?=
 =?utf-8?B?bUcxWWIrTkQ0ajFNTXZId1R3YWtraVE3NnB6ZklYb2RObWNrMmZnZ3FDYXlt?=
 =?utf-8?B?N24wdWhRY2lFWnJCNjdvS0RwRE9lWFFQTjIzTEN3WkNPK0tqUWhaeXc5ZGpr?=
 =?utf-8?B?Tmk5MUNOSm1zbnB1bUlCQkphVHBiMjVRKzdzNk1yd0I1RXd0UXJFOGlwaXpI?=
 =?utf-8?B?dGo1Sk1aelhibXhjcFJKU0VJbERvSndEdm1KTzFJMzhCT0Q3K1p1QktKYWZD?=
 =?utf-8?B?TUw5UVQ2eDBXOGx0YzFwOHhXU2owWXZ4VmZuaUUwNmJWaWZTN2orNEhCNmhW?=
 =?utf-8?B?TjJzYXNvYUdQbmtyMDF0eGFrRjgxTGNMRitHUTJvMGJGbUtzK1VKUGhHMzd5?=
 =?utf-8?B?MWpzZnp2dGZaNG40bU5nWkoyQ2VDRmNlODQ5cmIxU0pxTnEwNnBMQXI0aXVv?=
 =?utf-8?B?NXlKR1VPSHVsdjQxL0E2TXdnTXRSZ1M3cDFNdHlLRVpzajZWZEJSY1JNYndX?=
 =?utf-8?B?cU5wMHJxNTJJb2cwZzFDdmpyTVBhWXErNjJmd0ZlUWRiUmZhd21wR05SMXBJ?=
 =?utf-8?B?d29wcmFtS25MVXhaUXFiajF5cjkvaS9TWUNOcFh2MzhWb0VGSncxMi9SVlJW?=
 =?utf-8?B?KzJROFoweXVGeGJGNTNZUnlMWkhDZUZrd2FQM01PWEI3bmNZRkpPQmhCeG15?=
 =?utf-8?B?RFhmemIrVklkYjI5MGZNY0NmL2xyMXBtNUZuaHZZcW14bGdMN3k3dThucVdp?=
 =?utf-8?B?YUI3bTdTRGl5R2p6WXNldG9aclRuOS85SWcvOXJmNDBEWkNrakdEMExwVG9y?=
 =?utf-8?B?di9TLzdmWGpRWHR5TEtwZ1R3TjYzbldwRUdXSzNFY29FdUlaL3d2Z3c4V0Vt?=
 =?utf-8?B?aGsxMHI5Z3UxUS9nOHlHeE44Q2YwellReW9SNDFSZXhGQ1F5ZzAwZ0duNDZr?=
 =?utf-8?B?Q2ZkK2tEMzVjMlJGNFVlaHdLL3dHTWdHcGg3Uy9OMlBTaHhNSWxMNUwxUHl4?=
 =?utf-8?B?K25RN2tKOWYyU2JQTWxCa3k4MVdOVnh3U0tIUVNtM3h4UGJSODc5b1pYTEdV?=
 =?utf-8?B?L0VMb0JpSUc4aW9tVmcvR0JQRFp3clRWTDBLMnFMMU1pVDBrZXNYYVB5VUlz?=
 =?utf-8?B?NDNMV09rWlZ4S3BNODM3MEt2bEZ0Q1BSUm1VajdkeEFBTWFmZHZOV1ZqUFJO?=
 =?utf-8?B?OVRiZEMvd3ZzTzZ3cnFEWUsvRlRJcmhjWjhkRjRCdkZHc0haYUUzeUFzcE1m?=
 =?utf-8?B?QU9XcFQ2anpBNWRGeFU3Q2F0MWh0RlhWWm94ZnRWWm9uY1E5VnpEY1pZdU1S?=
 =?utf-8?B?aUdYSzBaQWgxMENnaUhaS25ycUJGU2xJdVZ1aXAyTTNtWTNLMmlPOUVTV3BL?=
 =?utf-8?B?bnY1bE9xRmtUeG91aTdZTEExVUNuS3V6SHo2Sm53aEdmWFM5YmM5WDVTS0Yr?=
 =?utf-8?B?NHJDZTUvRzhCWi9saUFsdVFrL0haZVZLRFFMYmk3ajdZQ2xFNk9wVy9kd2xE?=
 =?utf-8?B?WWhia0FSaEtTVUlNbmg1Mnc5MFQ5VDZaSEs3d0hLSmZPaEdiL0k4RnNuWW0v?=
 =?utf-8?B?VUc2UVpzNUlrRDUvTER1eEllUEZSMjMvNFlpSnR2K0xMMDJzMC9NRWFpS29u?=
 =?utf-8?B?RUdveVpRb3ZqQUNjN2o0MUV0V3B2OURFWTczRCtWdkhoWTJGcUxhSnZZZFlp?=
 =?utf-8?B?MzdTbW42cEFRTjdVYVBoTXZtMnJ2dkhLNGQ2aXZSWU5lSVBCZXBwSW9tTGpN?=
 =?utf-8?B?Q2NyK2ZXek1CblN5ZWRVTmcybW1ma050WXRCWXlFQVIwTnlpeFVEN2lyS1I1?=
 =?utf-8?B?SVZsRkwvcTI5YkVqbWlxaHZiaTQyWHJjNjMrZlNNSGRaYStZSVZURFYza1NC?=
 =?utf-8?B?WFdSd0NFNzM0aHNPWjRicHZmVGFpajdSMFZzcEk5b1pFR3dicjN5WTM4M2NH?=
 =?utf-8?B?dFZXR1N1UnhCZ3Y1cXM3TkRLZnF4UitSZmpndkVwZDZOYjdUdnBWZ0VMSjg0?=
 =?utf-8?B?T2Zvd3ZsQzQ0RkdkY29EUXF3TWdrYi9WTUUyWXBmVVFka0Q3V2hvSVZYbnVY?=
 =?utf-8?Q?ejCqKu6/qP3fKECQXUf9edDM5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a7d7d4-d9b8-4533-5ab8-08dc83da327f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 14:33:55.6483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tawean+t0kKg9MH2izrOBdOAscM2E0JE40yNNaKXMwZzu+y8JI9ayjZu8HDUYAGPrdkU/MZVpUM8GExBxdHQ8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6860
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



On 03-06-2024 14:31, Himal Prasad Ghimiray wrote:
> To determine the wake status of all initialized domains, a direct
> comparison using (XE_FORCEWAKE_ALL & fw->awake_domains) == XE_FORCEWAKE_ALL
> won't suffice due to difference in domain support across platforms and GTs.
> For instance, MTL GT0 only supports GT and RENDER domains, thus for the
> force wake all scenario, only bits corresponding to GT and RENDER should
> be activated. Consequently, the condition
> (XE_FORCEWAKE_ALL & fw->awake_domains) == XE_FORCEWAKE_ALL will
> consistently be false.
> 
> To address this, introduce a new member named initialized_domains to
> xe_force_wake. This attribute will function as a bitmask, encapsulating
> all initialized force wake domains on the GT.
> 
> v2:
> - %s/supported/initialized/
> - update commit message (Rodrigo)
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Suggested-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_force_wake.c       | 30 ++++++++++++++----------
>   drivers/gpu/drm/xe/xe_force_wake_types.h |  2 ++
>   2 files changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 64721c01f30d..98699622d83b 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -26,15 +26,25 @@ fw_to_xe(struct xe_force_wake *fw)
>   	return gt_to_xe(fw_to_gt(fw));
>   }
>   
> -static void domain_init(struct xe_force_wake_domain *domain,
> +static inline void mark_domain_initialized(struct xe_force_wake *fw,
> +					   enum xe_force_wake_domain_id id)
> +{
> +	fw->initialized_domains |= BIT(id);
> +}
> +
> +static void domain_init(struct xe_force_wake *fw,
>   			enum xe_force_wake_domain_id id,
>   			struct xe_reg reg, struct xe_reg ack, u32 val, u32 mask)
>   {
> +	struct xe_force_wake_domain *domain = &fw->domains[id];
> +
>   	domain->id = id;
>   	domain->reg_ctl = reg;
>   	domain->reg_ack = ack;
>   	domain->val = val;
>   	domain->mask = mask;
> +
> +	mark_domain_initialized(fw, id);
>   }
>   
>   void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
> @@ -48,15 +58,13 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>   	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
>   
>   	if (xe->info.graphics_verx100 >= 1270) {
> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
> -			    XE_FW_DOMAIN_ID_GT,
> +		domain_init(fw, XE_FW_DOMAIN_ID_GT,
>   			    FORCEWAKE_GT,
>   			    FORCEWAKE_ACK_GT_MTL,
>   			    FORCEWAKE_THREAD_XE,
>   			    FORCEWAKE_THREAD_XE_MASK);
>   	} else {
> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
> -			    XE_FW_DOMAIN_ID_GT,
> +		domain_init(fw, XE_FW_DOMAIN_ID_GT,
>   			    FORCEWAKE_GT,
>   			    FORCEWAKE_ACK_GT,
>   			    FORCEWAKE_THREAD_XE,
> @@ -72,8 +80,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>   	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
>   
>   	if (!xe_gt_is_media_type(gt))
> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_RENDER],
> -			    XE_FW_DOMAIN_ID_RENDER,
> +		domain_init(fw, XE_FW_DOMAIN_ID_RENDER,
>   			    FORCEWAKE_RENDER,
>   			    FORCEWAKE_ACK_RENDER,
>   			    FORCEWAKE_THREAD_XE,
> @@ -83,8 +90,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>   		if (!(gt->info.engine_mask & BIT(i)))
>   			continue;
>   
> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j],
> -			    XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
> +		domain_init(fw, XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
>   			    FORCEWAKE_MEDIA_VDBOX(j),
>   			    FORCEWAKE_ACK_MEDIA_VDBOX(j),
>   			    FORCEWAKE_THREAD_XE,
> @@ -95,8 +101,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>   		if (!(gt->info.engine_mask & BIT(i)))
>   			continue;
>   
> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j],
> -			    XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
> +		domain_init(fw, XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
>   			    FORCEWAKE_MEDIA_VEBOX(j),
>   			    FORCEWAKE_ACK_MEDIA_VEBOX(j),
>   			    FORCEWAKE_THREAD_XE,
> @@ -104,8 +109,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>   	}
>   
>   	if (gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0))
> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GSC],
> -			    XE_FW_DOMAIN_ID_GSC,
> +		domain_init(fw, XE_FW_DOMAIN_ID_GSC,
>   			    FORCEWAKE_GSC,
>   			    FORCEWAKE_ACK_GSC,
>   			    FORCEWAKE_THREAD_XE,
> diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
> index ed0edc2cdf9f..1056d196b29d 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
> @@ -79,6 +79,8 @@ struct xe_force_wake {
>   	spinlock_t lock;
>   	/** @awake_domains: mask of all domains awake */
>   	enum xe_force_wake_domains awake_domains;
> +	/** @initialized_domains: mask of all supported domains */
> +	enum xe_force_wake_domains initialized_domains;
>   	/** @domains: force wake domains */
LGTM,
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal
>   	struct xe_force_wake_domain domains[XE_FW_DOMAIN_ID_COUNT];
>   };
