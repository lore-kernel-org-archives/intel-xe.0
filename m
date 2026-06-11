Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFFBCD98C5
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 00:27:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8179610E648;
	Thu, 11 Jun 2026 00:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sa0QWSV8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BE110E648
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 00:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781137634; x=1812673634;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rnNaetBjt6yj49CsKpJCFsi4ZSUlInAFW8nHfneZU2c=;
 b=Sa0QWSV8oFqPHdZi5G74iYTwFKkV5LR2Up/K3RSsObg14IjPNZphzKLG
 LH1apEjZu7Zn+7eVpeZl1hIWR2cU6OVHf7my61Yb8Z3kNq/1vcuFGSvZ1
 EWL6nUFvy7HfXBcbqOYm30YCTV1PRjpJm1TXwjD6EFoN9MHLm8XFvAbBv
 suwu3BqmeU7BQCsQGMhibpVcL5GGdAsiEOnLrRQORJE+nYfga0w5Gq2Ay
 upbNKTE0pQBXJ42F9LXwdefdoOChazqS+wiYrVsWcFR02Gfc/Z2f8s95F
 voEhSA9PBpxS+R+xynFnRNN4DbzK4iOb3lj+uVWf0FMJxbB5EGkhpxHGY w==;
X-CSE-ConnectionGUID: VkIWdDniQjKd5VaK3rT40A==
X-CSE-MsgGUID: y0LUamUESmqc9l8nwVf1Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81949620"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="81949620"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 17:27:13 -0700
X-CSE-ConnectionGUID: Gw020qt6TUiW+MRMsoVblg==
X-CSE-MsgGUID: 6D4qmv7ORdSDKgEPlvXZKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="276523396"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 17:27:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 17:27:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 17:27:12 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 17:27:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AGOq2SeVJTLJSVuLONQRD0FcVC6VPmBx7h2N83xqUTEYdZ2wQ5klpLaNEwoCB47/514MseRDSeqED4uBAP6npTKFfG4H8pTVxRTscbbDC4RvPdDy2BWj2ODiUg5feoVV0kMOiLchR4njU7dwERXp2kGLTGNc3VXYBFUcHz7EBcyAKK3x5w0Fp8r216VxyyFnp0qPeKZ51+TdQewlDTWe/bKpE9iQRpqq0CdkVEiHAMQu0KoYIpqvHghzn2RPCzMRtHZkrZL5UrJ4WnjoFf/wuTIJqGisqTh5ytkMAaLfbjnWPhusuRe9OU/fFG//4Ee/qGdaLaANLEkGS6oqkXAdug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlEBYApkqMnJgq+pZ/EZlT6dssaa15kK8SDAZOSVxvo=;
 b=oBpz4f3299wExvxBrDQQuGjxNS13qx44vp8VlJfYbWbpYXaljDbqbY1+3tnsV2zC0N/mUkf6YzOeAmtUC1URjKcZshgQ/RrmxPuwsORJtCD+HC3YZGr0cdrX0was70TCWm/nIF6V4AF4MeQo8Y7qp+FmMLajbna2XQmGGvLGuSD3wDh1Fc1O9HvGuZz30jwdvMrZe+Ni7ASPjPQ74th/ZJnlPYYwX3gSkpJSxlKWJeiULthwoB4GUuDBqLqOYbS3lWeVecyH3MQFywDuyp4ySOFXXmlG3/6B6s3XK858a66nr4qJ6/dZTxjEZpzSDrKEffHy/yqJG3EIgJjInJo7hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6787.namprd11.prod.outlook.com (2603:10b6:303:209::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Thu, 11 Jun
 2026 00:27:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 00:27:09 +0000
Date: Wed, 10 Jun 2026 17:27:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jia Yao <jia.yao@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Wang Xin <x.wang@intel.com>
Subject: Re: [PATCH] drm/xe: Wait for GuC deregister before VM page table
 teardown
Message-ID: <aioA27DXnPTzGjy6@gsse-cloud1.jf.intel.com>
References: <20260610232656.1250879-1-jia.yao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610232656.1250879-1-jia.yao@intel.com>
X-ClientProxiedBy: MW4PR03CA0164.namprd03.prod.outlook.com
 (2603:10b6:303:8d::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: d387b3f2-3b7a-4d85-a707-08dec7502cd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|22082099003|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: sHzan+FcGgLRpFgph+QB5umzrajO+SvqTOZHt3PuP3nsECqbHjWnvX/90AkTxw91p6j0I43R1qoxBcgGmzw3MpiRTBFE5M3AcPMMKU7zmvRx7xe+JdxdEI5lAKPA+PejbiZbM6neI+nysXz3hSVlxXS8Z1WzaJ1znS9Fh8txkGsUFcYUiXazsXzepqgSjSz8/JSmcaI3MuQ8kQQNesc6hIF6uJNOn5K7ReA2ZQUZtqjElZn4VhhDG4QcKr8MvAsfXKLSdURnNvcDR5atGNx9z4Dy74VDN6h+lwxnjng7xuWTnezDKFacFPkwr+9RdhbMLnUIMEasAhnBwO8FshnA71/5HBcAII99B3K/aZrsWE+yQZ1D0HOTTyuZinFTayBwXlJjiGldD7vRKw/PGoW8n0vmCK6wy87JWlpqevv4OUyhUFZLh78Yl3FG93SWNv1cGoSkL/6ua8FDi17nMNM9HJKwJrW7FDJEH4lsQvIyTpj9q7UADIoIFatdgc/5vfVxcEouUHFPZyFTg/EEBpZPbIRGWz3WuOXPLTGD0j7p0gT9HCEjExtEu91/hHSMcpFubKwiDfY58nlPg93YLWP5hpiLr2yZxWsbYp7zDvFXE7UdFVYbIK5xRLXH6A/7+xen7EIIWAFmlUV7AurihJg3oBN7wAqJXVdHqy1vDaKkBi6esPsPxNItQSxsg3Kl0KMG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(6133799003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2M4Y0VTVFQ0UElOenRQakpJQ3p1NWZiSXJGRU5kN29PM0UzcXliUzlqOEUx?=
 =?utf-8?B?dVIzSCs2Y09ITFJvN0MxbzJEblRBZjFoRDFRQmNaN0ZraHpwcVRlaHR1MUU3?=
 =?utf-8?B?dmROZEVlbjhTc0h2U2dZeHRSL3ZsN1BoaTZ0WEFEUXdlSjdYcWRVRUNpc0ZH?=
 =?utf-8?B?Tjc2ZU5qVHpzTmpFUFQyTVJZZmxiZ1c1OWZvckwrTzFDQTlZVElCaUQvSVJN?=
 =?utf-8?B?VUUyUm5vY240bDBxR2taN3FtVHZIMzlIaUJuYTg5c0F2YzIxaThhWmE5N1FM?=
 =?utf-8?B?WktNV3NZSVNXL1dFUGlsVWQ2RVJQTW1NM3N3TjNtdnBsTjlGait3R3pSUnl2?=
 =?utf-8?B?SkRaZ2ZkSE40ZEpsbjVYTWJQcjVnMUcxNzFMZVdSRDJPdUl0NU0wS1VrM1lC?=
 =?utf-8?B?WGhlRFpDRVVoR0Y1QVFhc001U3dmVkVEaFdyRXNsRWpTbUxpdXJEaEFwZjhx?=
 =?utf-8?B?aFc2ZEtvbzREZ3lpcmFyQitybE9XdmFsbVcxZWhDQ3kyZ0dHSWpZOW5IL2sx?=
 =?utf-8?B?eUJOem1CaFFRaHYyaVBxaXU3YXRwNWlwN0ROSDJiR05JYVBvZzgrT1ptREdm?=
 =?utf-8?B?c0x6eHNRdmlsNTFKTU5DbjRub3A3ei9qWHMrUXF1UWN5ZHR5UlpuVGE2c2Jl?=
 =?utf-8?B?VnZtbGRUNVhkaDJnRFpqZmlFeXgzNjB3MG5iTWNFbEV1RlNsTGtJdkhqcUJs?=
 =?utf-8?B?OG95WEpBRHYvMXJITXIwQklZK2NtRWhFeC9KdUQrTTAxeWJWOTNzNkMxeWYx?=
 =?utf-8?B?VnJ3KzQvdlBNdWhvMWk3VnB6dUlCdEp1eHdjL1A4TGU5VDlVODlsNTFlZkRz?=
 =?utf-8?B?dDkxQXJrSlhDRmplNnVhd1paQWk2d3hsVkhVc0UyWW5OWUlSb0xReWhjNE14?=
 =?utf-8?B?MjNBWmlpZWt2WmRZa0xrcTVHOGFyMVc5eUtXRm1VbzBnZkJkRllpSUR2ZG9w?=
 =?utf-8?B?ZzYyWWVJRTlsWGJ0SHhVZXM5d0N5cEZzb1VaVDBRTDhEQlM5QTc4ditYcHJR?=
 =?utf-8?B?WXoxMkJvKzlmeDJFd1ljdVA3TmovbjZhOWIrY2c1dmV1N0ZTR280V0FKeGxm?=
 =?utf-8?B?VFBtY0crU2lJVCtOeFNxaUVramkrZFFXOHU0VTRXbDZpSzRmenRIV0g3dW5r?=
 =?utf-8?B?MGJBSlVLUk1uZWdBZVlTQzJPSmFFTHhKU2I2VU5NNVRvM3lUK1gyZVE3NVV3?=
 =?utf-8?B?Q1R6cklWWGkrL0NwdkpTQk1HMHhrRlM3bis0U2xGV0dSR0o5WEF2aEFucXVw?=
 =?utf-8?B?MUhGd0ZaeTcwZXAvY1FUMUVXZmtveWVrdEFCcEJIZ1VnU0hrUDlVWDU3T2cv?=
 =?utf-8?B?eVFxTEJ2NHJzYkxBaGJqaU5uQU1RY1FnUDR3ZXlMTm5BazluRzZ6WENCNkFD?=
 =?utf-8?B?cWkzK2xRcFcvUDFhL0daY21BcHpQWnhZMlZrSC9pclVPQnV3cnFEVXYxc1FB?=
 =?utf-8?B?ZUMxd3JaWm1TK2dtU2lBVXBkbzh6R3Zybzl2dUM0bEF2THNBelhuK2JQV2hS?=
 =?utf-8?B?TVRkbm9hRk9rNmlxWk96QVlGRWVCZzB4eUpsL284VUhiTEdXenZIancxK0Nk?=
 =?utf-8?B?NVIyVGtqcnVab0d6Vm1VUGVVRUdKc3JibXJyQkRtUHUyQ3VmUkg1bEJSR01C?=
 =?utf-8?B?N3BUOWNvTlUxZWxlQTRnOTlSYlhvMnNQVXlWTFdnNkFnVDErZU90RHdhMmJr?=
 =?utf-8?B?cUhQVk5mVmFGREVCcWVHdUtvQVUvRVp3R1luVUVyMWxSU2h6TnNmcGE2MElT?=
 =?utf-8?B?V3VlaThqUldSamQvTUQrVUQwYVpUSjkrbEVOSnBYRDZoSkNCWHk2RmhQZTFY?=
 =?utf-8?B?OVh2SG9leDFTT3lLTWM5ZnExNDdSbjh2QXkwUVBjeStWeVV5cnRiQStBNFNN?=
 =?utf-8?B?Uytmb0VyMmdxaFl4Mkt2RkV0NFhPRUgrWXdsZytqS24rNVVvQ0YwZmZ4cmpm?=
 =?utf-8?B?TmVRakVIZi9kTFhRb0NnTkJKLzRzNUZyWGJ0QzEyNWR2UEw0MkY1bWNkVk4w?=
 =?utf-8?B?dHFhSlYzcExUZEFMZFRFWEFUTCtBMGJxWUNRRThBQUhLOW1WRzJtTERScTFS?=
 =?utf-8?B?aDlnRCs3VHNOVlhzeU9sRlZzbXF2UHIxTnA4akhhcGdhNUNlUUpKMzlSWUFu?=
 =?utf-8?B?YSs3Q3drdVZHRDd1T3pXSnR2YWZVNU9VL01NZGMvdHNhQWRYb2FXb2FtSWVn?=
 =?utf-8?B?bjJWMVQvMlFYdXpHaXFiQkJadTJMV2xUZkhFNjlHWDVWeHUydWRwRmhWRStk?=
 =?utf-8?B?MmdDdU85VmYyNngxR0I0emJRR2F2djJLazUwUXc0SlI5MGJNLzBZYWJidW1C?=
 =?utf-8?B?UDNyOHAzSVlxSm9PZW9PcjBqbW5oOElWVER0aDRHMDRrdGJyNzVqVUdyQlhB?=
 =?utf-8?Q?VgwqjT/ObQ9Pq8Gs=3D?=
X-Exchange-RoutingPolicyChecked: ayxmQTctRxCiAb8jp9wfIIVcIVPBmTG3ymLVsTiajyjYNMKt8gibE8MZS7AXdvcM7kDygYWD4yN4zNd3xk0nUlLH/ubp+REpzDWip0pcTsM/pd/bJrs3RD0FKFe7GP1Rn0oOiYLZz6Qnt0bdMM67g3ooCMveQ31ZQ/3VTrdcr+dVAUG7WwgUZ3CSMysgSTw2pPo+Cw3Cg4szsbiW0U8RmnMGMIKS8eOnkIZ3iHlp11JAMvomye3iZqIKo2Uqn6NW1sLHkLu9cKC6+jhkaqy6duYyFddcCiuKvkir/bIN+SFM+NEHZr8VpfDXoejluZgOkHv3gQsKvUWKNIln7SXY9Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: d387b3f2-3b7a-4d85-a707-08dec7502cd9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 00:27:09.8488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5wjX+gM1LFdrbwkYapNruuCb3KXue6muiAH0GPKeW3sJAUjmQJTfTm2KCA5VeJgQlXLcovC6sKyDRoth7Bfjsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6787
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

On Wed, Jun 10, 2026 at 11:26:56PM +0000, Jia Yao wrote:
> LR-mode VMs skip adding fences to the VM reservation, so
> dma_resv_wait_timeout() returns immediately on fd close. This lets
> xe_pt_clear() zero the PML4 while GPU contexts are still registered with
> GuC and actively executing. A context walking a zeroed PML4 triggers a
> CAT error and GT reset storm that disrupts unrelated workloads on the
> same GT, causing xe_wait_ufence timeout (VLK-90362).
> 

A CAT error should be fine, as our hardware and driver support process
isolation. If a CAT error somehow triggers a GT reset, then process
isolation is broken, and we need to root-cause why a GT reset is
occurring after a CAT error—not work around it—given that user space can
trivially trigger a CAT error (e.g., by submitting a batch with a bad
address).

Therefore, this patch is a no-go, and we need to follow up on VLK-90362
to determine why a GT reset is happening.

Matt

> Add an atomic counter (guc_registered_count) and waitqueue
> (deregister_wq) to xe_vm.usm, incremented on GuC registration and
> decremented on deregistration. xe_vm_close() waits up to 1s for the
> counter to reach zero before clearing page tables. Once
> xe_exec_queue_kill() has set the 1us preemption timeout, each engine
> resets within microseconds and completes deregistration in tens of
> milliseconds, so the total is well under 1s.
> 
> Cc: Wang Xin <x.wang@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Jia Yao <jia.yao@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 42 +++++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_vm.c         | 39 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm_types.h   | 15 +++++++++++
>  3 files changed, 89 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 4b247a3019d2..1d08ae4913bc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -77,14 +77,35 @@ static bool exec_queue_registered(struct xe_exec_queue *q)
>  	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_REGISTERED;
>  }
>  
> +/*
> + * Track the number of exec queues registered with the GuC for a VM that owns
> + * an ASID. The count gates ASID release and page table teardown in
> + * xe_vm_close() so hardware never walks a freed page table via a stale ASID.
> + * Tie the count to the REGISTERED state bit transition so it stays balanced
> + * across every register/deregister path (including GT reset and rollback),
> + * and remains idempotent if a clear is issued more than once.
> + */
> +static bool exec_queue_tracks_asid(struct xe_exec_queue *q)
> +{
> +	return q->vm && q->vm->usm.asid;
> +}
> +
>  static void set_exec_queue_registered(struct xe_exec_queue *q)
>  {
> -	atomic_or(EXEC_QUEUE_STATE_REGISTERED, &q->guc->state);
> +	int old = atomic_fetch_or(EXEC_QUEUE_STATE_REGISTERED, &q->guc->state);
> +
> +	if (!(old & EXEC_QUEUE_STATE_REGISTERED) && exec_queue_tracks_asid(q))
> +		atomic_inc(&q->vm->usm.guc_registered_count);
>  }
>  
>  static void clear_exec_queue_registered(struct xe_exec_queue *q)
>  {
> -	atomic_and(~EXEC_QUEUE_STATE_REGISTERED, &q->guc->state);
> +	int old = atomic_fetch_and(~EXEC_QUEUE_STATE_REGISTERED, &q->guc->state);
> +
> +	if ((old & EXEC_QUEUE_STATE_REGISTERED) && exec_queue_tracks_asid(q)) {
> +		if (atomic_dec_and_test(&q->vm->usm.guc_registered_count))
> +			wake_up_all(&q->vm->usm.deregister_wq);
> +	}
>  }
>  
>  static bool exec_queue_enabled(struct xe_exec_queue *q)
> @@ -1741,10 +1762,12 @@ static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
>  	 *   it is safe to directly destroy the exec queue on driver side, as the GuC
>  	 *   will not process further requests and all resources must be cleaned up locally.
>  	 */
> -	if (exec_queue_registered(q) && xe_uc_fw_is_running(&guc->fw))
> +	if (exec_queue_registered(q) && xe_uc_fw_is_running(&guc->fw)) {
>  		disable_scheduling_deregister(guc, q);
> -	else
> +	} else {
> +		clear_exec_queue_registered(q);
>  		__guc_exec_queue_destroy(guc, q);
> +	}
>  }
>  
>  static bool guc_exec_queue_allowed_to_change_state(struct xe_exec_queue *q)
> @@ -2049,10 +2072,12 @@ static void guc_exec_queue_destroy(struct xe_exec_queue *q)
>  {
>  	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
>  
> -	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q))
> +	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q)) {
>  		guc_exec_queue_add_msg(q, msg, CLEANUP);
> -	else
> +	} else {
> +		clear_exec_queue_registered(q);
>  		__guc_exec_queue_destroy(exec_queue_to_guc(q), q);
> +	}
>  }
>  
>  static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
> @@ -2298,8 +2323,10 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>  		}
>  	}
>  
> -	if (do_destroy)
> +	if (do_destroy) {
> +		clear_exec_queue_registered(q);
>  		__guc_exec_queue_destroy(guc, q);
> +	}
>  }
>  
>  static int guc_submit_reset_prepare(struct xe_guc *guc)
> @@ -2864,6 +2891,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
>  	trace_xe_exec_queue_deregister_done(q);
>  
>  	clear_exec_queue_registered(q);
> +
>  	__guc_exec_queue_destroy(guc, q);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 080c2fff0e95..6d1a69049e6b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1798,6 +1798,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
>  			goto err_close;
>  
>  		vm->usm.asid = asid;
> +		atomic_set(&vm->usm.guc_registered_count, 0);
> +		init_waitqueue_head(&vm->usm.deregister_wq);
>  	}
>  
>  	trace_xe_vm_create(vm);
> @@ -1850,6 +1852,43 @@ static void xe_vm_close(struct xe_vm *vm)
>  				      DMA_RESV_USAGE_BOOKKEEP,
>  				      false, MAX_SCHEDULE_TIMEOUT);
>  
> +		/*
> +		 * For LR-mode VMs with an ASID, wait for all exec queues
> +		 * registered with GuC to complete deregistration before
> +		 * clearing the page tables. Once GuC acknowledges
> +		 * deregistration, it will no longer schedule those contexts on
> +		 * hardware, so it is safe to release the ASID and zero the page
> +		 * tables. Without this wait, a racing context still registered
> +		 * with GuC can walk the zeroed PML4, causing CAT errors and a
> +		 * GT reset storm that disrupts unrelated workloads on the same GT.
> +		 *
> +		 * This race is specific to LR-mode VMs, whose in-flight jobs do
> +		 * not install fences in the VM reservation, so the
> +		 * dma_resv_wait_timeout() above returns immediately and cannot
> +		 * tell whether hardware still references the address space.
> +		 * Restrict the wait to LR mode to avoid penalizing other VMs.
> +		 * The wait is bounded so a stuck GuC cannot block file close
> +		 * (e.g. ctrl-C) indefinitely; on timeout we proceed and the
> +		 * memory protection from xe_vm_close_and_put() still holds.
> +		 *
> +		 * The 1s timeout is generous for the normal deregistration path:
> +		 * once xe_exec_queue_kill() sets the 1us preemption timeout, GuC
> +		 * resets the engine in microseconds and completes the
> +		 * disable+deregister H2G/G2H round-trips in tens of milliseconds
> +		 * per queue. Even with many queues serialised on the ordered
> +		 * workqueue the total is well under 1s. Waiting while the page
> +		 * tables are still intact means no CAT errors can occur, so the
> +		 * CT channel is not flooded and the normal path always applies.
> +		 * On timeout we proceed anyway; memory is still protected by
> +		 * xe_vm_close_and_put() but CAT errors may follow.
> +		 */
> +		if (xe_vm_in_lr_mode(vm) && vm->usm.asid &&
> +		    !wait_event_timeout(vm->usm.deregister_wq,
> +				       atomic_read(&vm->usm.guc_registered_count) == 0,
> +				       HZ))
> +			drm_warn(&xe->drm,
> +				 "Timeout waiting for GuC exec queue deregister before VM close. CAT errors may follow.\n");
> +
>  		if (bound) {
>  			for_each_tile(tile, xe, id)
>  				if (vm->pt_root[id])
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 635ed29b9a69..26599a9c8b1f 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -355,6 +355,21 @@ struct xe_vm {
>  		 * get a flood of faults to the same VMA
>  		 */
>  		struct xe_vma *last_fault_vma;
> +		/**
> +		 * @guc_registered_count: number of exec queues currently
> +		 * registered with the GuC for this VM. Incremented when an
> +		 * exec queue is registered, decremented when the GuC confirms
> +		 * deregistration. Used to delay ASID release and page table
> +		 * teardown until hardware has stopped using the address space.
> +		 */
> +		atomic_t guc_registered_count;
> +		/**
> +		 * @deregister_wq: wait queue signalled when
> +		 * @guc_registered_count reaches zero. xe_vm_close() waits on
> +		 * this before zeroing page tables to prevent racing contexts
> +		 * from walking a zeroed PML4 via a stale ASID.
> +		 */
> +		wait_queue_head_t deregister_wq;
>  	} usm;
>  
>  	/** @error_capture: allow to track errors */
> -- 
> 2.43.0
> 
