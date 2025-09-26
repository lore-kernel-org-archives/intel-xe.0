Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B1ECAC5BB
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 22:05:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7223B10E14A;
	Fri, 26 Sep 2025 22:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJ5wfIKm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0583710E14A
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 22:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758924305; x=1790460305;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lVXt2VLH5BeWe59uLY+PbRVqPdexR6EVkSO8TzdWceU=;
 b=XJ5wfIKmbVNqh/f/leNk2zurIbxzXgi9oCevxr6jGN4dTjd2+sZ6Rbu7
 jWOY8FEaOaqzTmvPXqQrel51PBsVq0Jn2yDTVM+gkQkrSM07R/GyP3SmP
 rue3FvX86RaZvI/v9pxmrnxgxcM7ipXox7XTyS+zezDHrHEOLNNY0xZfW
 DUsdZV37HS52aJv79Ltf11sttUauWceRUV9ITFigu26Il5tMBnvzwnP4i
 zpS7H9Z/8fD2dfBzmzvrmTIdUuixYlu7LpOBLP3WN6VRrsufAzKFGlQwy
 RFU2Q5BgNzZsQM26F9inOa79Z76ZMuRoWcHMmqB+gjv1iK6/dbDGFL/wA A==;
X-CSE-ConnectionGUID: 0ea7dug+Q9exb1p9ldGBvA==
X-CSE-MsgGUID: LSU/4liWTsqSeevEwOfwlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="78905586"
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; d="scan'208";a="78905586"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 15:05:04 -0700
X-CSE-ConnectionGUID: Cc5DmN2cT2atTUvqFRZRYw==
X-CSE-MsgGUID: 8e663UJWRH2bIv+vwFxnVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; d="scan'208";a="182991631"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 15:05:01 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 15:05:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 15:05:00 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.44) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 15:05:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pvidk1Twex3jWEucOpwMCS3W90pYo/MjWcyo3XNRuq9z7Aen8DAoB7xv9SposCqKiTt/a0v2iuyAeVN7/FHni0+ZZNDphw2aQpIqsViOUWzv7dFumJqIhEEWaOiEmkTLhdwP26vZ2TcWh2Oo5JsN+SWeH9JuNi+LlGXHWoMH76Sc+GeW+VsiX7aRT91w7+lxDZMLEaTRrTTK9T7jdivI54IPNZpcd7dKwRBad8pwGiX4be5GALJJBM70PXR3pCcK+WuVRMqelpG38eoBjqSJwUXkyuxGyAA5dDaJRnOSNfiS+947c5QJ7lF6zD+41uod80tHkFlqCHraIuaRjyTA9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZj8guuz0S4DOhMJkyYlKyL7UxfybDdkW+BHFGvQ02o=;
 b=WFZUkD9/UI6Kxn422n4c7M3HlzYNiP6sxB4UVCGVuOhAW4rM8hIzc4PAn/2wcJbF5ICtxbT1A2idNXscoY+L1eElB2uP8kwvKlkMSsZYQT7WFHwt6BasNmnxxWAIVAhQR8v3S3GkSejTcOV+M7pDnCQ585GdbkJ7QnrUxoUvlXM4RvU8bQYh70dRsAEdQD+Y7m9J4kPvLIcp1fqW93NcziEYeWdfMK8s9Nq0j79YurCo/ynnJw+ZOxCFT/pEVEWT9K9pas+1muqv5tU8QE5ZGljahIlWZamXp5Iykyi0Q8btnZs+q4neGsL6ed31oe7bbTNfxVaEbEgjwsKIQ03F2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA0PR11MB7696.namprd11.prod.outlook.com (2603:10b6:208:403::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 22:04:58 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 22:04:58 +0000
Message-ID: <ff327184-b6e5-4414-8d9a-6320297d9c7e@intel.com>
Date: Sat, 27 Sep 2025 00:04:53 +0200
User-Agent: Mozilla Thunderbird
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 4/5] drm/xe: Guard against NULL GT in xe_guc.c
To: Matt Roper <matthew.d.roper@intel.com>
CC: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>
References: <20250926155948.145934-7-jonathan.cavitt@intel.com>
 <20250926155948.145934-11-jonathan.cavitt@intel.com>
 <6ba18666-d2e9-4184-b717-b0c5d160d998@intel.com>
 <20250926192628.GD10167@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
In-Reply-To: <20250926192628.GD10167@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::13) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA0PR11MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: c9c67f7e-deb4-44d6-5a83-08ddfd48bb66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0ZrellnckxJYk9QR1Z0ckdiQnNjcUhXSHYwQW14RVpzanpvdUpzclhHMHNm?=
 =?utf-8?B?S3kxZm5MZnZVVXljdWZ0NnQ0ck9XdmloZnNuWU9iMTI0bHVIaC9Ka2NqOW9D?=
 =?utf-8?B?UXB3b1JpYWpnOFlNV1hId1NkUmh0QmVrZXYzUHVHM28xNWRUMzNtNm9abHNi?=
 =?utf-8?B?Sy9VT1Nqd3NYQWlZYktGckU5Yzl4YlJKVUdmQUJoUytZV3pHWXNPbDlZd0ha?=
 =?utf-8?B?bGtDdE9LNGpXTi92ZkxqVFdWSGFWSlpHQ2JUc3YxNXFjMWoxcXZncy85T3Vk?=
 =?utf-8?B?ZmlyWTVPSW5HM3J3eUhHeFFwcGd0YXplUGltZlhLMncxNUhYdzlaT0NYNHlX?=
 =?utf-8?B?OHZPbGpRV0ZkVTlNVDJjazMrYlNmREs3UDdWVlZCTTBmdW9KNGQ1MHRYNU10?=
 =?utf-8?B?QmFwYXdwd3BDYjdTclJ2QTBOUjhIL2h5NjRGUVRXenVzNGtnczlPUGFIaXA4?=
 =?utf-8?B?QU9JMFczV3plekw0VTJEMkJiZzFOU0g2SGpCMG9zLzBUemxKcUtBZ1BjNlUx?=
 =?utf-8?B?cmdFREl4eFR4MW5WeEFrc2lWVzNLNFBSRmU3ZG9MUituRFRNTC9CWVZPSHdp?=
 =?utf-8?B?aTh4NkdCMWFqdis1VWh1Kzc2NUpsalFWRmZENWtrTmFNc2tzQXhwbWMzaEZw?=
 =?utf-8?B?Y0paWGVtcGxheTlsOXg4UmNubmhIUFUrZmpWcXNqZm5DS1hSVGNDcCtSVWty?=
 =?utf-8?B?UlZRUkxlY0VPWUg4TWFZaDlmL0VyU0NNang4eVoraVFCK2hUUDV5Y1pVN25X?=
 =?utf-8?B?UHJadUo0SGQwdjlSbmdLVHJxSnU0SXVXVWIyWVhMTkQ2QXI3SEsxVEJWTlpK?=
 =?utf-8?B?TTZ2eTVEVmN2VmNuaysvMTFuOUJ4UFFmekY5bkIxZ0hpRnlaMzVsUTltSzgx?=
 =?utf-8?B?WWJNOUlsY2NvLzNSV2pBM25DWW9adm1yUVdqVmZvTHIycVAyM3duVzNiYnNl?=
 =?utf-8?B?TUEwLzJnME1KUE9NN0RIQzRObnlxM2VhczI4SzZiMmJzSm1GSTBDK3I1Z3Qv?=
 =?utf-8?B?UDZGdnZPVFlTanh2WXd0NFJNSTFjVDV0dW9HY1hIS25nWjllODhjMHloNG1u?=
 =?utf-8?B?aHJKMVJ6VUt1MU5HSllaUlhUSFcxbGt0YlpWSGRTb1YvQ0lnM3dPcllKb280?=
 =?utf-8?B?Q01lQm83WWRPUTBLc0dUSXZtSlRKdjJJUjg1VG43SGdNeWY4dVlQYXZnSjF3?=
 =?utf-8?B?ZFFOQXlBZElaeSt2ZkpTVkZiVTRFUVh3T1lXZGUxd3pkVFp1QzNlbHlTQmpu?=
 =?utf-8?B?SVNrV1ZLdEFFa1JmR1ZKN2lsbWVGdU1ZTWNFQ0VmZE5FS3hlQlovWVp0dmFl?=
 =?utf-8?B?aUNpSHB2a2R4RmhGU1ViRkFiakliMjB2VzJPclo1MXBWbWZsOXVkOC9ORmdN?=
 =?utf-8?B?TDA2NHRrUTk1d1dWbVlxemR6cWRuTXl5ZTcvUkthVVlSdzh4TFJiQk5MMVN3?=
 =?utf-8?B?bjl5aFZJeHptMEYvcmQ0MFljS2NFNlQvZkRFV1Vma1RPTmFVcUozT3M2V3I0?=
 =?utf-8?B?RHRybHQ2K0F4NzRZeXNYMXNka2padkdmQ2t3WkM5Q3pYeTlITkt2WDhNYmdv?=
 =?utf-8?B?Ym9hSVVmdjJOaFRaS1dldThtaFRQeHh0UXM5QWUyTHZpUDZhczdVM0NFZTNJ?=
 =?utf-8?B?T1JQL1dPNXB0WnVSUVh3THA5b05DMWxZNzd4VEFSZUxwT1AzM3RyMkFaWmY5?=
 =?utf-8?B?NWttZjUyYVBGN1VCUTN0WGk5b0lYMVF1dVFKTEN2NjNLdkl2azFPZ1Q4STI0?=
 =?utf-8?B?dzZUeDlvbjJNdWJnSm5NbjlLc1o0b3Izc0tCUE4wQmFaZDFQT1VwTWVpMzBB?=
 =?utf-8?B?RnZ4UThTdzhzUmdWa2dhSDYrejFZcE5NU1FPS25peEVWcENMeWdDbEdQNkV6?=
 =?utf-8?B?TEpiby9iLzZzSlRvWW4yVHVlVjFGWGkwWXhUT2tkUlpubkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk5UM29VYlB3NDY5WHBvWFQ2dWIyRUQ2dnF3VEp2ZkFoNkZDdEZHZndUQlRs?=
 =?utf-8?B?V1lBSWhqR0RlS1JGaERMSm1PQi8ySlkvSVdzYmhOWmppaEpQWG96YWNwa3FR?=
 =?utf-8?B?ZFpRMnFQV3R0TzZCVS84eTRsL29nUU5vZ1YrMUpXZUVCc3FmbjZCaHNLS0Zn?=
 =?utf-8?B?dVF6SmpxbW1GRWRGWmJIYlZrWUhBYnFqQmNWNVNNeTBia2FPS1BCZHp6Wnd5?=
 =?utf-8?B?VFBjYUVQelVNdFFpaXFtS1pOYkZ6UnA5M0p1NCt0VU02NlNGc0Q4S0IrTXRP?=
 =?utf-8?B?Ykk1Vmo5ejR1RkxOSUZPc21QZWRzYnFPT0xwenZMRGY2NnVEK0xOMEx4RXBo?=
 =?utf-8?B?cjRrUW5pWHAvVHIrcHdWaWRoek5CN0xGdlJOWWtzd1JqbC9sM3lPcGJxOUdI?=
 =?utf-8?B?WkxLbDQ1VUNJOFIveEhSeFRua3d2cWcvYkR5RDBOanlqSTl6azhZZSt2aGpE?=
 =?utf-8?B?SC96TTBONzMwK0g4MzVLWnVWWW5uOExHSVV2NFJ6ZzBZbE4zRlFhR1JCNTQv?=
 =?utf-8?B?Ukw2NHlsRHZWZkFZVWdFYzNxN2JGNVltVVc4RkF3MklXWHFTMVNaWGsyS2dt?=
 =?utf-8?B?V0ZMYlQ5cU5yemV1Tk91T2VvZXJtTzVGUEFISGhjVUwyb2ErWFVuQWNNL0Ez?=
 =?utf-8?B?SE5NTlc5cHVJLzA3N3hqM21Nb240VU5aYy9TWFJIeExiTy9zTk5TcWJVUTRi?=
 =?utf-8?B?UkFsRXJYdlIxTmJsZjRDQWhhNzl1ekM3OE1MY0xZcmQ3VENteDdxdE91K1BR?=
 =?utf-8?B?MDVWUGI5NW9jUkIyWmJjRnVueEs0NHNNbzFHK1VFZnpOZU9JWHFHOU5kb3Br?=
 =?utf-8?B?YWtxRVVpc29Bb0pzRnZ4dlpRY1FMT1dLRDlTUG1KYWRUem5Yb0tBbGpjeDJP?=
 =?utf-8?B?WFg3TWdPRkN6SzkyVGhLbjZvMDhvZWNHa2VRNXdyNXpZd1ZsUFhUTEI2blVl?=
 =?utf-8?B?UTJoQnlTUHhQcXpiOUZLMlZ0VkdaRXpGKy9teE92dG5VUGtML3I5SWY2SGd0?=
 =?utf-8?B?ZEpJc3ZBMW9QZ1NWdEY2R01HVnhGNW0xanBKVDdQc1VBVHp0QXlYenlzbERH?=
 =?utf-8?B?NlM0bXpkNFZOMjQrVWsyNzVwaVpDdUx4OEhIcU5BR1FHSUo0UEwzUFBQZHdU?=
 =?utf-8?B?eWRMSllxWjgxSEFVcUZhQ2FoQmFYNmE4ZzVMaVdvRTZNM3VRQnRTcmVLQVRy?=
 =?utf-8?B?L25ibWRKcWNCUC9Yb1FzUlhtYjlQY01mWjF2dTlYN0c2TlBteE93YTk4SWJC?=
 =?utf-8?B?aFpGT0c3djFUOStoTE9oRUVPMlM5OFhMSVNVUWUxVGZqUjlQTno0cGQ0Qzdm?=
 =?utf-8?B?cDM0RXFYYmowckNQamJjamtyOVIySS9INFRkVHRkUkNZSnN3QzRhbkRuVnQr?=
 =?utf-8?B?RTRjZWZ4QVJmdnB5NERmSFhjeWhjTWlIWTJQK3pWNmR5V0Rwd1ZMWHhHOEpW?=
 =?utf-8?B?UXlZZytJL00xWGpZQ1k4dDA3dDJRZ0NjZDhyNmxKNHNXMVJJeGpRdjlTekZt?=
 =?utf-8?B?eFhQbVI5Y2I4NSs0NXNtYmlRT05CaHpMaHVYekdNVWE1WEtwdU9lQ2o0RWIy?=
 =?utf-8?B?ekxYWEdmUTVBckNXNE54QVVMUFM4YkR5SENqdmNDR0d0U1dxMGFJRGpaT0x5?=
 =?utf-8?B?OWRlMkM0NnlnVzdiZUo1dFpSeTRUYWVoSHZuSm0vZ2JYdE05UlIreGVobnJo?=
 =?utf-8?B?KzVWTUw4eFBuVGNXRm4vdDJiYkNwUm03TC8wbkhVUHdyeXN1cytIYnN2SmNT?=
 =?utf-8?B?SVI4aEd4d1pVQXZOY1d3NDYzTzN2eXlhNDQ3cFZpTlMraFYrSUFOZWJGckJ2?=
 =?utf-8?B?aTV2OGVETHBnQnUyVjFEblhnR2hhcTA1VjZ2SStXa0FpUVN5bm5xcm9xdVF1?=
 =?utf-8?B?ZS9CQ0ZSL2VQYklhekF4ZklRRnlmYllaWmE3TFN0UnptOUNPTVBxTFI1NkFT?=
 =?utf-8?B?MGpYQm9TWDJvcXE5QzBmTFNHN0dCbXRmQkMrZGFQRDRVTjAxQ1V1bkxHT3Yv?=
 =?utf-8?B?YVo2dEZUUi9iOXVxT3FyYjljK084bS9MbWFXUnhlNUZLanlWcTdXR1p1NHoz?=
 =?utf-8?B?VDR1SUk0L09RNmdGck9CYVg2SDlaVXJiTkNwZFB2QkxGMmFxSCtPM2k3d0ZD?=
 =?utf-8?B?d2Mram9qejdWUnI5U0VEbFVONFB4UmhNMURMbU56Ylc0dVJiYlFQZGtxK3dI?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c67f7e-deb4-44d6-5a83-08ddfd48bb66
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 22:04:58.2283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHJcRuMN96S691sZ4Y1/tXMYr2n0yssaWRohqgiWJs1wifdFP/YbruI3spr7BWOGOAl6d2VQEn8cbrhM773oo4p7E72Xf0+1g2f/Wc3Hj1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7696
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



On 9/26/2025 9:26 PM, Matt Roper wrote:
> On Fri, Sep 26, 2025 at 08:36:31PM +0200, Michal Wajdeczko wrote:
>>
>>
>> On 9/26/2025 5:59 PM, Jonathan Cavitt wrote:
>>> Static analysis reveals the following issue:
>>> xe_device_get_gt is theoretically able to return NULL in some cases, but
>>> several use cases don't check the return value before performing a
>>> dereference, resulting in a NULL pointer dereference.
>>>
>>> Use xe_root_mmio_gt instead of xe_device_get_gt to prevent this in
>>> xe_guc.c
>>>
>>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_guc.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index d5adbbb013ec..0bf1402c61a0 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -466,7 +466,7 @@ static int guc_g2g_alloc(struct xe_guc *guc)
>>>  		return 0;
>>>  
>>>  	if (gt->info.id != 0) {
>>> -		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
>>> +		struct xe_gt *root_gt = xe_root_mmio_gt(xe);
>>
>> while this looks ok today, I'm not sure how this will work after [1]
>>
>> maybe we should check and abort here? + @Matt
> 
> On today's driver, xe_device_get_gt(xe, 0); can never return NULL.
> Hardware-wise there's always at least one tile, and every tile has a
> primary GT.  If something went wrong during init of the tile or GT and
> we couldn't create/initialize the structures, then we already aborted
> the device probe immediately and we'll never get further on to places in
> the code that would be chasing a NULL pointer.
> 
> As Michal pointed out, there's work to change this (i.e., allow the
> primary GT to be disabled via configfs for debugging purposes), but even
> with the referenced series we're not at the point where that can happen
> yet.  More patches will need to be written and land before we relax the
> probe-time checks and allow probe without a primary GT.  Once that
> happens, xe_device_get_gt(xe, 0) and xe_root_mmio_gt(xe) are both
> equally problematic, so replacing one with the other doesn't really
> help.

maybe we should have two helpers

* one that never fails - to be used when are sure that given GT exists
* other that may return NULL - in case we don't know if ID is valid

	/**
	 * @gtid: the GT ID of the valid GT to get
	 * Return: asserted pointer to &xe_gt
	 */
	xe_device_get_gt(xe, gtid)
vs
	/**
	 * @gtid: the GT ID to lookup
	 * Return: asserted pointer to &xe_gt or NULL if not found
	 */
	xe_device_lookup_gt(xe, gtid)

> 
> 
> Matt
> 
>>
>> [1] https://patchwork.freedesktop.org/series/154739/
>>
>>>  		struct xe_guc *root_guc = &root_gt->uc.guc;
>>>  		struct xe_bo *bo;
>>>  
>>
> 

