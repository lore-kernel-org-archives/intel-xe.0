Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E52DCA101F
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 07:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324C110E881;
	Wed, 10 Sep 2025 07:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hKCbPCvu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FEB10E884
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 07:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757489735; x=1789025735;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6WMZMc8EG2C1Jm3ba5axf5W7l6+QZUDsgITYPdwPtiw=;
 b=hKCbPCvubfXCwKnPINRqLhxQcJ7TnVFiCbpFP0zRs1bH0o4IkuTIkfJ3
 vOUVmcnyMkXAkB0S8Q4tLROMVo18hdpkytKuYwcNOl8Wqx6sZGaxluWZg
 BQLQvQGaPbdGnxE6T8jmwkQudZt0LiNS7+rCdssk3SzozxhK6IIY97Uzi
 uNpdfOYx6oh/cSLQmnYFtxDYxVRLFQ3LB9UAWl4aJabjHVk7JMQwkrUsw
 poXiQKevKJckrJRynTfIef83FZuehEAkIWFYGv5XabeKLbHcaBlj/ePrp
 lazlywXEDMSX+xaojBKJxynfT6bgH80pTqLLuY2PqIGF3Nzc+T/TSILtw w==;
X-CSE-ConnectionGUID: VZj0YfK4ToKbQS9GO+bx0w==
X-CSE-MsgGUID: 8lDen5upSO2+HQsiZScEvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="63420918"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="63420918"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 00:35:34 -0700
X-CSE-ConnectionGUID: KBPPe35mTeyGFjd9m3wT3A==
X-CSE-MsgGUID: tADD8yUzSleEsebEzm+4lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="172601947"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 00:35:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:35:33 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 00:35:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.89)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:35:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXpOOo52+LWbMICq2ThwBSFRy8w0oxX7OMBGALz5Qd3hhvW7bcVm3Heoe4zvQvQiKFV/ybjmP9a989C0kG24nvQlgpt4cPlxtkCcOu7XZtdzUy9cehVISSUdrO1uO4FmG+U2GMlVstUg53fuaiK5QmOrtS6ncUkfNHD1CkVuONKstUdukFFaMmLDmI+FddIp27MgHOehIBMD73xIVPt/Wgi3/h12WdrW6m8ywlFKT2Ijm3axaDXaLXVb2fSI6uNpLMCxm4i9ItCniDjGL+1Yn28U94Xy8/9g/qyG8/tT/5mvzzJte/Nm4djsUilSxEKb14HWEjYPe4onSvIiyKTJ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zeZJ/nRNLIDYEut2VwwAGZYw1+Z7m6dahveHURf7T1M=;
 b=TmOCSudnOS5d3wVAOKlHEXDMdFT2zNeW1Faq38wexZc1ZJZZquSQOADRcrymCHJMK29rNl4MjLZSUVNmBnngHnhKk2s3UZPhaKH22hU+VdB0tP+HGrTZap7LhEYe5Kr4jCzkzgBh2217VMuBa21j6jAzwzNBvC2qw6cs//YJHcjyE8cxM4mfrlyewe9JwY9P0JbcSJ1oIA0nvB8erF5iwjM0xvzoxYPyVEg83h2eiXNV9HpbO2GO1E0YXk8I6STP9vket7c58u2lwJ9pe2qr8/zD7Syj2Kl9efaeHl64mjPXRd9EhicyYWE/FvdZ+w4w2MM31JenGFlX16E72IKTVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7902.namprd11.prod.outlook.com (2603:10b6:8:f6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Wed, 10 Sep 2025 07:35:30 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 07:35:30 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v2 1/4] drm/xe: Add initial support for separate kernel VRAM
 region on the tile
Date: Wed, 10 Sep 2025 09:35:07 +0200
Message-ID: <20250910073510.732250-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910073510.732250-1-piotr.piorkowski@intel.com>
References: <20250910073510.732250-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0018.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::17) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: 83db83ce-1468-40a6-405a-08ddf03c9e60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHRRRlZuSWcwZGV1YWRmTVpJNThuK3plT1dveC9TMGF6cHpHandNU3BpUXN4?=
 =?utf-8?B?ZFRzVFAyTHNuS0RkbnptYUdyNnF4Ujk0REVsRmlhTkJqUG1sNmloRmo0NFZw?=
 =?utf-8?B?YVZSUVA1NTV1Y3lmUVJ1OEllK3dFY2lXTTRHTk5nOUcrQU1zSTVkektvdyti?=
 =?utf-8?B?MVpmN3Nyamt0SnBRZFB2L2Q3WElpcjZweUVvNy9IRzc0WDNHYlNQT2x3RGtz?=
 =?utf-8?B?YjR5dnpJOTEyM3ptaVBxN2w4clJWSUVmV0xUWVNDVlFqQzVFbmttendXUlFj?=
 =?utf-8?B?aC9LRExtVjRVdFl6K3JtN2E2WDRNbnBsR0lsYXFNaEZlVld3bmVBb05rVE1x?=
 =?utf-8?B?aGtCUTkway9aa21XK3prbUEvNlFpZi9ocXgrekQxTC9CNFZtNmhuajVBajIw?=
 =?utf-8?B?RXhpMWFib01jZmtycWx2cUZEdVV6c1VNT3N5K0tYaUlkbERsQWN0UHFGYUxK?=
 =?utf-8?B?cytGZVdRRWV2UUxQbXAvSG11WHJIU2tWV0o4SW5HalUyTzBnOUxiZkc3eWxR?=
 =?utf-8?B?SUN0Mkl5QXhBaXV0NVcvd1VmaE9JWlZjeW1OL2UycVh3cUNZTWkrMVIwV29y?=
 =?utf-8?B?MzY2YlRkVC9DeUd6ckl1QmtETzBLYjFHTjBjZ0FDcHUxTm1hSlZnM0tTUzRL?=
 =?utf-8?B?K0krSWVjS0FVWWl5S0hBcTkrcDJRTGNWenJJR2Rwd3JXRlRoSjB2dG5ITDRj?=
 =?utf-8?B?ZExSdFhLRUc0b3k0R2Rvb1Y1SllsQWlaakk5ZHEvblZpVHRXT0lNbGN1TFFv?=
 =?utf-8?B?Y2ZSTUtuSURPdWwzbFo4YmkyR0NpaEErK0R6N1FrWDU5emZlaTArejVtOUt1?=
 =?utf-8?B?NmpyY0FteTNRVnVvWFo4V3dzK1VSbUZMVzhqM1dlek5ONS83SVFxTWJ4a2Y2?=
 =?utf-8?B?REs1aVVLWUdGd2NDakUyWjRjK1o4MUtOUlhrV2VNbEJYRXRVZFg3Umhvamd2?=
 =?utf-8?B?aEw0VkMwWVBua3pmYTdnYXNjM3pDVUV3TnJPL2c3TTQ1K0NDMVVONTAwdnYy?=
 =?utf-8?B?aXVXdEw5Smd4YlBqcmFwOHNmWWhQbzBLYVp4OUZCdHZUWFhCMjVSenJQemJn?=
 =?utf-8?B?dDJCamtSTllvSENqc1VZc0xCS0JhRXowdkJ0UHZiVmhUNUh1Z0hMT0xzMUNp?=
 =?utf-8?B?eGlUNzViWU5IWkp3cUpoSEFLOHcrSWVNTEh3TlAyOGRUTnRpeVNOcVBzY2lw?=
 =?utf-8?B?TER2bk9Jb2tDMXNEY25pcHptQ2htVTZ2RmVLNDBhc2c4L2hsTEYyYUFRa2FG?=
 =?utf-8?B?eWF6OHdPZDQ2RW9zUXZqaTJjUDRRbStZT2xlT2pJUGFXVWpDZTVSZCt4eitz?=
 =?utf-8?B?Y3o4S1lBVUNCYnR4K1g0MGE2YU1WallpOWcxU3QwR1o0T3h0ejJlaitGbUhH?=
 =?utf-8?B?L2FrNlNNQ2lZa1ZWYk4vc3ZBTzVmUHRGNWcwZS9jY2hLaysya2JIQWJna3ho?=
 =?utf-8?B?dEhzQTZmc1pqUDQyalVDb004aTRsUkkvR1YzcS9iN2dpbStqWmw1L3RQZ0NN?=
 =?utf-8?B?VFZ5OGVOQkdZeHdjZkRzWnJDQ2dkOU5CeGozWGR0c3hUa3MxNlRRVExEQzlC?=
 =?utf-8?B?WUZPaUw3YU9NUWVrOUNRM25IYUIvNnloQWpSbWJOTEFBdUFLZ1l6bkJOQmZK?=
 =?utf-8?B?a1JvaUZwQmt0SjFjMTExZG9uUm5EMEhMQjlGREZEWExkeVJwSnMwc2xtSEV5?=
 =?utf-8?B?ZU9ZQ1dRbkhEOG9lVGZuQXdYdkQ2OFVFNHk2KzV6N0JHbUc5WWU2RERrdzZj?=
 =?utf-8?B?L21Icjd3emoxTHdPbE9YMEFMcVdQbk9RZHZSK2VnRzFNbW9Vc2psRjhZVEpv?=
 =?utf-8?B?T2pOaG5nWERPOWZRZG9mb21kc0lkZ05ING1nLzJhazhkNXc5blQvTDk3MXNa?=
 =?utf-8?B?VVQ3ci82NTRJdjhzbmx5QktnZHVTb1dzYmdsNzhsbWpYNjNvV0NyYUJOcFRz?=
 =?utf-8?Q?GRl7moZ0aqE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czVuTHBNaW9vaEVZYml1N0dENmJobEVZYy9iSWtSa2lLWHZ0QjhpcXJMS1dQ?=
 =?utf-8?B?d2xGSDFob2FlUXhSZVRSZXFSaEg0R0NlNGVYK0RzeG1PL1kvSmMxT2JmTm1i?=
 =?utf-8?B?dXowV05jMXJRWmNSeWVROEhWTlNjOVVWbWhwVExsVE96eE1FNUJpV1NzdEdX?=
 =?utf-8?B?Mk51UHFvcmd3eGxONWdULys0RzJiS3k3MktWOWozcEF2dFdvVkovN3RPdm1X?=
 =?utf-8?B?WExubWkxd0t5VVVKbjRyMXc2dHJCUVU2c3IxYXduWXBGUElzd21TTU5CUnpD?=
 =?utf-8?B?YXJ2Q0IyVFZ4N2lKQjh6cEdmOFVnMDMyQVFubXhGSi9paGJUTVVSSVA0bmpO?=
 =?utf-8?B?ZGN3MWgwWWR3dXA2Y2JWWDRVbHdxWldoSWM0aXVhTU1ubDVmVWZXNTZiamU3?=
 =?utf-8?B?VkFadVBHZHNKeG5TSzlLdHBkV3FSSXRGT2hWYi9YcjM2TlNCZG5DeUF3cHE3?=
 =?utf-8?B?b1hGQkFubUxoMTkvRjNrSU1wWTQ0NStHWjVKejRkN1RtRjdiOG52aE9hZWQy?=
 =?utf-8?B?VWpLSzlSaVVIM2ZReDBRNTJUWGtEOUViYU1MRWVaS3lyZnV1OVdMYWt5QTFk?=
 =?utf-8?B?L3hTUDIyRlRYamhlVisyeEowZnRkelpzSGxaVnlBazFvVGNleEdjeWEzUGNv?=
 =?utf-8?B?bklyMnNYczdONnB3WWFHNVBvSlBXa2hiZnMyU1Erd1N3dHhTVGJyYjRjUTVk?=
 =?utf-8?B?aFcrYkNpd3R0RWdRVU8yVjVQVWcwRGUzZHpTcGhLYWlQUFRwTjU2NlIzNE04?=
 =?utf-8?B?MGdUNlVHeDhmanVrS1Mwb1NoamlwTnpOeFZYWGJPb2Z3MndiZEdxV2dFTFBT?=
 =?utf-8?B?YmlZa3VsN3lnTFZLVVVjY0tXSWlyNVc5RngvdURXbHFjTjRCTUJCZFA1L3J0?=
 =?utf-8?B?aVg5dkhFRXIvWm9YcG9nM2pOYTFXQmNTMUVkSk9vWUdXalVMRm5hbXhoMUo1?=
 =?utf-8?B?LzNsRUF0M2Z5b08zanVrbWVwb2lXUWdtVU84SEw3Q1lNeEt0SFdxa2lEUDdT?=
 =?utf-8?B?VytBQTN5TFIyYkV0L0loREpHekdKMENpQ25QYzFrU2EwZnFsTDFWT05ocVFo?=
 =?utf-8?B?aWk4YkxIdThPWkE5Z3hWQkdIMXU5bVFFYWpsRXdHQ1ZDWTJVdzZkQ09HOS9n?=
 =?utf-8?B?NlNmYXB2eEFENllUalJ6M0dWbmUwUUxRcmNXaEorbURhN3pFRHl6SjJET0tZ?=
 =?utf-8?B?RUNhdXJGZ0c5UmQ2VG5Xc2QxZHdJL2dBMFRpbXorbUNHSUFzYmxXSUhGV3dK?=
 =?utf-8?B?bDYwZEZSbXZTdllMRDlRdElmeEVJS3k0aVl3MHJNaTIvVVNNL085Si9MRmpn?=
 =?utf-8?B?SUhKRTdzNytvMzdoTHRYd2pvRU1TSHdtL2NFY0YxVEM0SXZscUYrZFVtZzRj?=
 =?utf-8?B?ZWRJQVBOM3B0WTh3RDhqdjVTMHRhWXhZT0JUTEVGTzFVNldjZ1p4aklFQ3p5?=
 =?utf-8?B?TU5YV1VLZmNSc0ViTkxnR090b01MdSs5ZksyMlI4UDJmUlN2T2pFWVRaMjEz?=
 =?utf-8?B?MWg3TWpBUHdiOFVERGxiSU9SdmhkQm16ODlzcGJvU25PTHZ6b2hUTENMKytn?=
 =?utf-8?B?emlVS0JTU0YvNVJvNGo5dXB6bnpTYVVEWmF2U2VnZUtxUk0vaUE0aS9IMXdS?=
 =?utf-8?B?SUNzODJsS2x3TklWM0FqUk0yVGp5eU5DQ2w0VUFNblRrNm9GaGwxcFM0UUQ2?=
 =?utf-8?B?RjVzVUJGVmxXTytidGV0NkZIRFVHVU5RY2lTQ1JzcENJVDU0TnhTR1Y2MGNq?=
 =?utf-8?B?N1lYeUpBTzdjckxiV0ZoWWZsSUlia1lpZ0xDZjV1QXFPQnB5NG9HSENMZjh6?=
 =?utf-8?B?UWgzTElGZ3Blb3M5YUh1NVZMSzdTK2ltUjRPb1E0LzZmb3pQYTd2SVQ2VnNJ?=
 =?utf-8?B?SUtzdGR2aHdRdWhxYUpzZ1BhV01HanhMRlBHNUgvSnFuWHNWdWZHR0ZGazRS?=
 =?utf-8?B?MzFEbzhianZYMUZTTGVnRzYrbDkzNC9QaHpFU0VKYllFUEhtVGRScWlzczdG?=
 =?utf-8?B?cm9ueU4wSkE1Q1VIUWxGTGlrWHh4cEtoTE1aTlJabnVkZEJVQnFzbDJPNkpS?=
 =?utf-8?B?cktTVDY1TFhmTEZueWIrUkFOSGZ5NjhHTEhhclBVUHN2TVZRUGQ0eVJ1VklP?=
 =?utf-8?B?UFF3eklaSDlQcTJMUmhmOUV6TTV1ZmVqMVJ3Sk1wVFAvR0w4UU83cVRNQ0Vx?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83db83ce-1468-40a6-405a-08ddf03c9e60
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:35:30.4503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ieeRhthi1DXK5q3Tmukjn7hmX2e3GFQmPkspNUVwdIA9kzKiiuTiZFpSQXFsoP6MJpCa7SOpf3JHYLzM4OBdHddXmwg5n/KfSDa5WBvinho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7902
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

So far, kernel and userspace allocations have shared the same VRAM region.
However, in some scenarios, it may be necessary to reserve a separate
VRAM area exclusively for kernel allocations.
Let's add preliminary support for such a configuration.

v2:
- replaced for_each_bo_flag_vram with the improved
  for_each_set_bo_vram_flag helper (Matthew)
- moved the VRAM flag iteration macro definition into xe_bo.c (Matthew)
- drop unused bo_flgas from bo_vram_flags_to_vram_placement (Matthew)
- use hweight32 helper in __xe_bo_fixed_placement for readability
  (Matthew)

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 89 ++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_bo.h           |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h | 10 +++-
 drivers/gpu/drm/xe/xe_tile.c         |  8 +++
 drivers/gpu/drm/xe/xe_tile.h         |  5 ++
 drivers/gpu/drm/xe/xe_vram.c         |  6 +-
 6 files changed, 92 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4efc1c8d15b8..94838431288a 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -34,6 +34,7 @@
 #include "xe_res_cursor.h"
 #include "xe_shrinker.h"
 #include "xe_sriov_vf_ccs.h"
+#include "xe_tile.h"
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
@@ -81,6 +82,10 @@ static struct ttm_placement tt_placement = {
 	.placement = tt_placement_flags,
 };
 
+#define for_each_set_bo_vram_flag(bit__, bo_flags__) \
+	for (unsigned int __bit_tmp = BIT(0); __bit_tmp <= XE_BO_FLAG_VRAM_MASK; __bit_tmp <<= 1) \
+		for_each_if(((bit__) = __bit_tmp) & (bo_flags__) & XE_BO_FLAG_VRAM_MASK)
+
 bool mem_type_is_vram(u32 mem_type)
 {
 	return mem_type >= XE_PL_VRAM0 && mem_type != XE_PL_STOLEN;
@@ -213,6 +218,27 @@ static bool force_contiguous(u32 bo_flags)
 	       bo_flags & XE_BO_FLAG_PINNED;
 }
 
+static u8 vram_bo_flag_to_tile_id(struct xe_device *xe, u32 vram_bo_flag)
+{
+	xe_assert(xe, vram_bo_flag & XE_BO_FLAG_VRAM_MASK);
+	xe_assert(xe, (vram_bo_flag & (vram_bo_flag - 1)) == 0);
+
+	return __ffs(vram_bo_flag >> (__ffs(XE_BO_FLAG_VRAM0) - 1)) - 1;
+}
+
+static u32 bo_vram_flags_to_vram_placement(struct xe_device *xe, u32 vram_flag,
+					   enum ttm_bo_type type)
+{
+	u8 tile_id = vram_bo_flag_to_tile_id(xe, vram_flag);
+
+	xe_assert(xe, tile_id < xe->info.tile_count);
+
+	if (type == ttm_bo_type_kernel)
+		return xe->tiles[tile_id].mem.kernel_vram->placement;
+	else
+		return xe->tiles[tile_id].mem.vram->placement;
+}
+
 static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
 {
@@ -245,12 +271,15 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 }
 
 static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
-			 u32 bo_flags, u32 *c)
+			 u32 bo_flags, enum ttm_bo_type type, u32 *c)
 {
-	if (bo_flags & XE_BO_FLAG_VRAM0)
-		add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM0, c);
-	if (bo_flags & XE_BO_FLAG_VRAM1)
-		add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM1, c);
+	u32 vram_flag;
+
+	for_each_set_bo_vram_flag(vram_flag, bo_flags) {
+		u32 pl = bo_vram_flags_to_vram_placement(xe, vram_flag, type);
+
+		add_vram(xe, bo, bo->placements, bo_flags, pl, c);
+	}
 }
 
 static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
@@ -269,11 +298,11 @@ static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
 }
 
 static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
-				       u32 bo_flags)
+				       u32 bo_flags, enum ttm_bo_type type)
 {
 	u32 c = 0;
 
-	try_add_vram(xe, bo, bo_flags, &c);
+	try_add_vram(xe, bo, bo_flags, type, &c);
 	try_add_system(xe, bo, bo_flags, &c);
 	try_add_stolen(xe, bo, bo_flags, &c);
 
@@ -289,10 +318,10 @@ static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 }
 
 int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
-			      u32 bo_flags)
+			      u32 bo_flags, enum ttm_bo_type type)
 {
 	xe_bo_assert_held(bo);
-	return __xe_bo_placement_for_flags(xe, bo, bo_flags);
+	return __xe_bo_placement_for_flags(xe, bo, bo_flags, type);
 }
 
 static void xe_evict_flags(struct ttm_buffer_object *tbo,
@@ -1938,7 +1967,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	}
 
 	if (!(flags & XE_BO_FLAG_FIXED_PLACEMENT)) {
-		err = __xe_bo_placement_for_flags(xe, bo, bo->flags);
+		err = __xe_bo_placement_for_flags(xe, bo, bo->flags, type);
 		if (WARN_ON(err)) {
 			xe_ttm_bo_destroy(&bo->ttm);
 			return ERR_PTR(err);
@@ -1996,34 +2025,33 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 }
 
 static int __xe_bo_fixed_placement(struct xe_device *xe,
-				   struct xe_bo *bo,
+				   struct xe_bo *bo, enum ttm_bo_type type,
 				   u32 flags,
 				   u64 start, u64 end, u64 size)
 {
 	struct ttm_place *place = bo->placements;
+	u32 vram_flag, vram_stolen_flags;
 
 	if (flags & (XE_BO_FLAG_USER | XE_BO_FLAG_SYSTEM))
 		return -EINVAL;
 
+	vram_flag = flags & XE_BO_FLAG_VRAM_MASK;
+	vram_stolen_flags = (flags & (XE_BO_FLAG_STOLEN)) | vram_flag;
+
+	/* check if more than one VRAM/STOLEN flag is set */
+	if (hweight32(vram_stolen_flags) > 1)
+		return -EINVAL;
+
 	place->flags = TTM_PL_FLAG_CONTIGUOUS;
 	place->fpfn = start >> PAGE_SHIFT;
 	place->lpfn = end >> PAGE_SHIFT;
 
-	switch (flags & (XE_BO_FLAG_STOLEN | XE_BO_FLAG_VRAM_MASK)) {
-	case XE_BO_FLAG_VRAM0:
-		place->mem_type = XE_PL_VRAM0;
-		break;
-	case XE_BO_FLAG_VRAM1:
-		place->mem_type = XE_PL_VRAM1;
-		break;
-	case XE_BO_FLAG_STOLEN:
+	if (flags & XE_BO_FLAG_STOLEN)
 		place->mem_type = XE_PL_STOLEN;
-		break;
-
-	default:
-		/* 0 or multiple of the above set */
+	else if (vram_flag)
+		place->mem_type = bo_vram_flags_to_vram_placement(xe, vram_flag, type);
+	else
 		return -EINVAL;
-	}
 
 	bo->placement = (struct ttm_placement) {
 		.num_placement = 1,
@@ -2046,13 +2074,24 @@ __xe_bo_create_locked(struct xe_device *xe,
 	if (vm)
 		xe_vm_assert_held(vm);
 
+	/*
+	 * In the case of kernel allocations, if the tile has dedicated kernel
+	 * VRAM region, and tile->id does not match to tile->vram_id, it means
+	 * that we are using unified VRAM and we need fix VRAM BO flags.
+	 */
+	if (tile && type == ttm_bo_type_kernel && xe_tile_has_separate_kernel_vram(tile) &&
+	    (flags & XE_BO_FLAG_VRAM_MASK) && tile->mem.vram->id != tile->mem.kernel_vram->id) {
+		flags &= ~XE_BO_FLAG_VRAM_MASK;
+		flags |= (XE_BO_FLAG_VRAM0 << tile->mem.kernel_vram->id);
+	}
+
 	if (start || end != ~0ULL) {
 		bo = xe_bo_alloc();
 		if (IS_ERR(bo))
 			return bo;
 
 		flags |= XE_BO_FLAG_FIXED_PLACEMENT;
-		err = __xe_bo_fixed_placement(xe, bo, flags, start, end, size);
+		err = __xe_bo_fixed_placement(xe, bo, type, flags, start, end, size);
 		if (err) {
 			xe_bo_free(bo);
 			return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index c7ee9c7605e5..ef3268e73489 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -127,7 +127,7 @@ struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_til
 int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src);
 
 int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
-			      u32 bo_flags);
+			      u32 bo_flags, enum ttm_bo_type type);
 
 static inline struct xe_bo *ttm_to_xe_bo(const struct ttm_buffer_object *bo)
 {
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c0a1f71f767d..87e90cb4962d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -156,7 +156,15 @@ struct xe_tile {
 	/** @mem: memory management info for tile */
 	struct {
 		/**
-		 * @mem.vram: VRAM info for tile.
+		 * @mem.kernel_vram: kernel-dedicated VRAM info for tile.
+		 *
+		 * Although VRAM is associated with a specific tile, it can
+		 * still be accessed by all tiles' GTs.
+		 */
+		struct xe_vram_region *kernel_vram;
+
+		/**
+		 * @mem.vram: general purpose VRAM info for tile.
 		 *
 		 * Although VRAM is associated with a specific tile, it can
 		 * still be accessed by all tiles' GTs.
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index d49ba3401963..6edb5062c1da 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -124,6 +124,14 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
 		return -ENOMEM;
 	tile->mem.vram = vram;
 
+	/*
+	 * If the kernel_vram is not already allocated,
+	 * it means that tile has common VRAM region for
+	 * kernel and user space.
+	 */
+	if (!tile->mem.kernel_vram)
+		tile->mem.kernel_vram = tile->mem.vram;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index dceb6297aa01..5d834378b354 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -23,4 +23,9 @@ static inline bool xe_tile_is_root(struct xe_tile *tile)
 	return tile->id == 0;
 }
 
+static inline bool xe_tile_has_separate_kernel_vram(const struct xe_tile *tile)
+{
+	return tile->mem.vram != tile->mem.kernel_vram;
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index b44ebf50fedb..7adfccf68e4c 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -13,6 +13,7 @@
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_assert.h"
+#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt_mcr.h"
@@ -283,8 +284,11 @@ static void vram_fini(void *arg)
 
 	xe->mem.vram->mapping = NULL;
 
-	for_each_tile(tile, xe, id)
+	for_each_tile(tile, xe, id) {
 		tile->mem.vram->mapping = NULL;
+		if (tile->mem.kernel_vram)
+			tile->mem.kernel_vram->mapping = NULL;
+	}
 }
 
 struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement)
-- 
2.34.1

