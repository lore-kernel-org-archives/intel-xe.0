Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B72C83F09
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 12:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B9010E7C6;
	Wed,  9 Jul 2025 12:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PmuXsER6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708D010E07F
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 12:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752063363; x=1783599363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ir0uniD81vd1ZIvkvhMT24yQfRB7cbUxRwiPEQRq4kM=;
 b=PmuXsER6EEJk1Cnc/nslUfDyhz25c924R6sXjebu6GjEZJg/mX9LCWB3
 oeLYSq/OuGeI5o7zzPaVNI4mLM+xeUISkIzgoWv4ya3drJQbo9+8tYsR6
 KLViwzyRVpndGkrfyxC8USdrHZqKG4cck/DFFPIGVqHZazmfb4aFj+ZEP
 uOU3uJoVVvbx//ex/5iwtso4TrM3B94toNRhATdDmxe0HRAj+XpGT+fBk
 XQGWAY1RFEJALzpyNmvI53pR/ZPEmS5nKT/8F2RUGWSl1h31jhNS/Nj7b
 Dy2kh8wgdXkl84/YEsECHffyeY3U1c9XwuDNU6z4bG1unC2efCU5pesrA A==;
X-CSE-ConnectionGUID: ZZMNVqBlRxGb3IX9eDqYxQ==
X-CSE-MsgGUID: s6dWZkIbSRy4Z8MQaNXlfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="58129323"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="58129323"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 05:16:02 -0700
X-CSE-ConnectionGUID: u9zT3M9LRgSfUFcDwTQXiw==
X-CSE-MsgGUID: vCwoZRnIQLO9vnmhgQgDqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="186762113"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 05:16:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 05:16:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 05:16:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.78)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 05:16:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWrbybuRm/VmkfKbU8I83A63TtKl7HeXnODH+IymoWl+G7Y/DoIUevJdLCB70iufLSJ7n5XGUq2beafuJiYOgqhBzPn9FwMPKfnUZYQFwqTPrDept6rgB9v8veWL7udLV7Imulb4rc+BAL0+tfkQdbxDH66fiwm+ucfhTfmjjasyqbSwDXTQExXj8x3E4nBDTd496SP6Xy9h0f25bp/XaS1ctKN8aCTRLVXd6WJCRcnljNJ5XIp9OafyLhfzX0atJ0vKkjWOIwaOyzhOOUvh5OCh4WWPSqu3Q3+/isKls23EIy8yA6pGFn4QdamdPfHh0lwyakwVCi9uon+BL7kfng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ekn8d7koASvIlofRBMUW81JN1jdYt6obFHfbXHzvojU=;
 b=lyDarrm2xerLoPTTmdT20dE1TcrOSKk8EAgxD3YxJQTR66ggv7ewUWeT5YnnFkBeeNaZkgrTaH8af6ous1wBnwbpuU0WxtaogfWg0pUUy0LIezOQVndY0AA0K+s2fO90TVW64lYotGY6mpc2mhAUgaVvxaLecHX6gicRflZVB6OCLdmHfQRban+/nkMeDEGhUp6/xdsNflUurZz+iwvg19sz95zBTGbpDD6LYpFF3pB86XL9Y9Jxbi7qeeYFYB2/RxpSNUpNbROyTytOfUeto2mtYDdh2y4jwcXws1OZA5FhsisK1swmx6CZ7F5LFPP5kQzDivd9FjqQb63zaigGxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ0PR11MB5008.namprd11.prod.outlook.com (2603:10b6:a03:2d5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 12:15:58 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Wed, 9 Jul 2025
 12:15:58 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Jani
 Nikula" <jani.nikula@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v10 3/5] drm/xe: Move struct xe_vram_region to a dedicated
 header
Date: Wed, 9 Jul 2025 14:15:41 +0200
Message-ID: <20250709121543.4129807-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709121543.4129807-1-piotr.piorkowski@intel.com>
References: <20250709121543.4129807-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P190CA0012.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:550::11) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ0PR11MB5008:EE_
X-MS-Office365-Filtering-Correlation-Id: 027692bd-ecea-4c27-cac0-08ddbee25cc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXdpcWxLVHZkcTJKdFlYZU5iNTVlanRFd2dadmRzV2RXeEQvKzVtNVlFQUhs?=
 =?utf-8?B?Smd1K043MGFwVzJMNGZ2dGhGZjJoemdEWVJXb3BxTDYvcnRIc2JwT3lwYmFC?=
 =?utf-8?B?Z2NMaWJDQVFQaEx2c3M4VUpsRUY4ZDN4MkgxV05LNmZ2YmNSd1RFeUpzWnlq?=
 =?utf-8?B?OHg2aTJ1enk2TGcxSHlXaStSK0lKbVdzSi9sRVlFNVY2Sjkwbjlkb1RmRHJr?=
 =?utf-8?B?ai9xYTFQZHdybjhhM0JQaTBnYlJxc1VQQTE4elFtbmlONjcxUFozM3laL3Jt?=
 =?utf-8?B?dlVLR2dtM0dHSDIrWjE3YnI2QXRJRm0yVHpqamdOa1lZVm04U0ZCZkh0NTJx?=
 =?utf-8?B?bEJtcXN0MUYyOEN5M0o3R1pKb3M3NzVLeXoxSWc3aG1NMzRPSzVVanU5OVVi?=
 =?utf-8?B?YTRmQjFyMXFLSGNaUjVnZmlock1nVWVIdkVGNUd6Z2ZJYlBvT2RrVXh4Zzdt?=
 =?utf-8?B?SDllY2pPTEloV0NoMjgwMml2dWhnUjlaS2QyM3pHYlU0Zzh6R2V5MUVyMWt5?=
 =?utf-8?B?eSsxcEcwcThBb2o5S1ZiQ3BUNURBc00ramsyV0x1L1AweTNHZVp6d21DcGts?=
 =?utf-8?B?bWVmT1VMTDJsT01iMitOdEQ4bnJJRWZ6M0hsdTRTNmZHbFdkUjNtUFY3VURk?=
 =?utf-8?B?S2F0UXpBK0N6bXZydlF2Vm1ENXNERGlDVHpBVnNsQlNrM1djT1BVVlVOZ2I3?=
 =?utf-8?B?dFJiM2dnT2NZU1YrR21xRXVnbXl3bEl3WUVmV0IrU0U3UGNoUmszS0NBdno1?=
 =?utf-8?B?T0tESWRJOXlRRzgyWDFaMzBybk5ISktvekZjS2hNVnpDYnN4ODZ2N0hHSGxx?=
 =?utf-8?B?dlN6c2lNczlZYUJnWDZkWEpGZ3JXNGV6aG5lemdkY3dvNWlSZDZkRFVGUkZD?=
 =?utf-8?B?WGt4OWhsdGl2eHVoNERSbWFpMUhxeVdEeENhUmRhWTdoQUFQNWxEbk1RelJS?=
 =?utf-8?B?ampOSG9rVkJZUGRwYTJOdnV3OUxlUTRMTUdIYk5WYkFXcmc2YmdySHNyN3d2?=
 =?utf-8?B?elBlcllBN0ZYSVhUZ1Fkc3JIZ2Roc21EYXlxRk5Sck55YTRwd3FqaXNaeFJW?=
 =?utf-8?B?YmxPaGozTWM3T1JUcmtaenF6ODBnRHJIUG1EYjczUS9GRGphM1RFaHBQWUV4?=
 =?utf-8?B?OUk4S1hmL1Fid205SmlYb0pSemxteVVIdDVBR21vR3lBbXJKUVBCclBKZ3Bm?=
 =?utf-8?B?RGtXYnF2Y2l2K1FmMkg3ZFZaY3BqaldIb2cxdm4zVVQzeUtCa2lsb2tMaUFr?=
 =?utf-8?B?clpVd2Q1cVFJSFdwWGozTnZJbC9TMWNBZS9pWS9jT3RRT0FhdUpCS0RoeG01?=
 =?utf-8?B?TGVTVW9YOWl6dlY3Q1RCVjlvbVpDZ0ttNnllRGZ2U3hlYkh6U2dOZ0QxWldn?=
 =?utf-8?B?VmNXT1d6ZWlwUlZzejRjYW9ReUt2L2ltWWxVVitUMnJRNUthS2N4d2xzdEtl?=
 =?utf-8?B?VkVTR0ZWaC8xMFliRGJablhSYmozZ0FoTjdWMzNCa2tmWlg2eUtyV0JMTkp6?=
 =?utf-8?B?TmhpWFlSUFJCZHRRZTJHbG1tT0crMUQySTFxRThyYzdpVEFPdEdpdE1oZ3h1?=
 =?utf-8?B?Q3ZiQ3NlMllxSXNyUUZwbW83VzRyOXZCL1dJZm1CRnQyUXNuYWI3VytGREoz?=
 =?utf-8?B?RWJlZ1dHNlhkZDZiRC9zK0xiUldJOUg1RE1teUhWU0MxNzFod3lOM213eE9S?=
 =?utf-8?B?WlptKzYxU0h5djRoUVV3Y1JZM1ltRHBqY3VGVy9kRWxyNlZPMFE1UmpGRzFL?=
 =?utf-8?B?UkdDUE9kazBYeXhlSTYwN2dGcVlkend5NkdQM3lzcUVQZnVqZkVKcVVhVFk3?=
 =?utf-8?B?dW9MTDlpampKTlJOOERUK0lHblVnSVVLaXAxVWtMV0VCdTBTV2Y0SmdsYTZ6?=
 =?utf-8?B?dUlmQUxHZUViRE5zQksrb1ZOdGkvT0dYUzU2L3lpSXBPWWF2ZjlIRGFuVVFv?=
 =?utf-8?Q?NN0mszi6ffM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlZDaXNPaytNMDd4OUk1TU5ZdWpYSlNmK2NMeHp3dFFhODZ0bTBaNnUrSWlV?=
 =?utf-8?B?YXI4aTR0Q3BabzR0Ym1CMG1GYm5EdVdJOG1rL1B1cmlEUXNXSGlZVllGcG1x?=
 =?utf-8?B?Qk5HT1VGQ3o3UVRweHg0NGlaVC83M0JWTElRRjQ2bzhpNTU1SEFtOHA3Tnh6?=
 =?utf-8?B?U2tPWE9YZHE1YkRQOWFTMm9DZkVPNGhjb0pEYnp6OUlZWXFhR3N0aTFrNE9y?=
 =?utf-8?B?TWNwa1lOREpFU0tHNy9OMmpQYUpYd1MxZjdqVWlmY3M0bEVvWG1MT0FwNGx4?=
 =?utf-8?B?YkpwOFJraUV5MFB4OGZMNS9pMWU1L3M0N2lpWDlnYWpPTDlvM1lVbEVTTFph?=
 =?utf-8?B?eTh4QjJQZGVKTXJNakJtMCtsbURCVnNQd0RwNFZ2eVFxaVMvMGtyOG81ZWFm?=
 =?utf-8?B?OFIxc0d3QjN2eWIyYjU2eTI2VGRNWGNLRGFFSUU3ekZDVCtnMjhaM3VGT05F?=
 =?utf-8?B?UThra1l0Vno5aVhJZkJxbk9OLyt5TlpGUUdsQXBsUXplQ3JMWkcyeGJSQkpB?=
 =?utf-8?B?VTRDRE1mbkEvaG5mRHVoREZMNytMRW9jVlRMdHJPS1Z4ZGNHUGRUS21FWnRv?=
 =?utf-8?B?b2tvcHJtTjhFY2Y0bTQrMW1ydlVoS1NZRDJMcld2SEtKSGUwYzdSUUh1U0I4?=
 =?utf-8?B?aGo2Qi92TGpOT3hIWEtiK00zWklSS2E3bHIxMktyc0hPb3NTQmN6RWV5T0Nu?=
 =?utf-8?B?L3I2M0xIcGkwMXZkYnhyVmZUaVVYMjQ2bnRta3ErUDloRHExS2dnL21zODlE?=
 =?utf-8?B?ai9XM3Y5UVlCT1lEN21EdlNybks0K2p1N0RicXltNjhucGwrZThzRWFZeTNl?=
 =?utf-8?B?QlQxNUErNnRrOHNhMjZXdmlOaFBQaVRvSVlPQ2hqR1FWa1BIUHJQTnh4c2Ev?=
 =?utf-8?B?SDhJQUxjTVZJbk96b0dWa0dDTEtvY1VsNU0zdWRZb05KRkttWHBMdnUrRmtL?=
 =?utf-8?B?VGMzTDY2elF3S3JVbStCM244cDdlQjBrYWRzTjlwQ1Zrd2xRSnprNTA3MU5U?=
 =?utf-8?B?a2k2bktXU1BpZ1VvRWZJR3o2RlZYcUhzd0lIb2tEN3JkVkFEQzllaG8ya1Br?=
 =?utf-8?B?WEdYQjdSV3MrMEhyT2srcG9SRXRZTkdMcDZLeEN5akl5VTEyUWFYelpJY0xm?=
 =?utf-8?B?ZlA3WSs4QmxyMERRWUVxVFhOem9XbVdxdCtLTWxTUFdxVkRNZTRBc0Y4My90?=
 =?utf-8?B?WGQxQkhsQTFzMXNiOUNLUWhXUTlWMFRrK05RZHRwbEhFd1NSZS9CY3IraFpu?=
 =?utf-8?B?NURZak54NmVMeDJ1TU9DTVlFZ1F0VWRnd1RUS0llWU1jYzlJUVpCT1hxUUQr?=
 =?utf-8?B?VFJ1ZE90dkV6dlYwVDFqOWJRelM3b0Q1WHZDUXNwOU1vWkd5NUptR293dUxm?=
 =?utf-8?B?RjdOR01YVWIvTlB4RTJ4NWhhQXp0ZGhwRlMzL1pXazY2elZLSy9DSGpsMnJT?=
 =?utf-8?B?RlVNYTkrSVg0TUE4SHNyak5BUi9sd01pb1lkcnNCdXB4NHErd0ZWZ2xqendO?=
 =?utf-8?B?TTJyMVBHdjhkVEYxQkt5Y1dpRTJ0d2ZFMW9nZW9XczNFREJDbkt1ZXM1SDRp?=
 =?utf-8?B?VlpDWjl4U0t2SHJ5dVhGbkVZRGtOclY3WU12clJBR1h5aWhud3c0RUZXSW1X?=
 =?utf-8?B?SllzaEx4ZDk0TC9WL1h6d3JrWkFyVzhjNXhPYVdZbTllK1VlNWtLWENnOWFk?=
 =?utf-8?B?VnZ1UnlBdUpJbXF2UlNHOWcvR3NMN2xOVmRBNytCNXRxTjRtTXMxS21UNVVz?=
 =?utf-8?B?VjFOZ3N1dGVnRDczMmt5SmNYNU1qWGxOTlpycXBFc3BaaUpnaGhxOW1uUnRC?=
 =?utf-8?B?S3VuRGErUWJWbXBlOUUramJ0TmgxQm5pcUFla1RwTjM1YUFVZEFvL1dJWm5x?=
 =?utf-8?B?bmlJMGNHUGU2VGxSWnU5bSt5aTY0N0RGQm9aOTRaT1JiN2p3cmE0RzJOWlBF?=
 =?utf-8?B?VDNFRzhJMWtzODJTaWM2K3Bob0c5Yzl4Q2g0Ujg3WE02TzMwVEVoUFFlRE1U?=
 =?utf-8?B?TS9FV3BQb0Y0MHV2ZWZjT0QvSTRLTTRlaXoyR1N4WVU5TmtsYW0yUzBiMSsx?=
 =?utf-8?B?K0hVNFZwS1ZDak01WTZWbzQvQ3J4a0VZWW9YNDhERHF0MXpqRnBZa1dHelh3?=
 =?utf-8?B?NnRGOU9zSnBCZGhsZjJxRSt6MWtHN3haU2w4eHNPSVBaaFdyRThEL2dqbGFt?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 027692bd-ecea-4c27-cac0-08ddbee25cc1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 12:15:58.5651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QlRj9pksVXvbReDUynQxOJMLZ6HG2WDkTa/gSuXV0zRyFdQAVkHtjsTWfZyPVLiRDKqgl9Q9tSzp2UKPKbb4i2HcuSQZwENH7dETpvswcNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5008
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

Let's move the xe_vram_region structure to a new header dedicated to VRAM
to improve modularity and avoid unnecessary dependencies when only
VRAM-related structures are needed.

v2: Fix build if CONFIG_DRM_XE_DEVMEM_MIRROR is enabled
v3: Fix build if CONFIG_DRM_XE_DISPLAY is enabled
v4: Move helper to get tile dpagemap to xe_svm.c

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Suggested-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com> # rev3
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  1 +
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  1 +
 drivers/gpu/drm/xe/xe_bo.c                    |  1 +
 drivers/gpu/drm/xe/xe_bo_types.h              |  1 +
 drivers/gpu/drm/xe/xe_device.c                |  1 +
 drivers/gpu/drm/xe/xe_device_types.h          | 60 +--------------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  1 +
 drivers/gpu/drm/xe/xe_svm.c                   |  8 +-
 drivers/gpu/drm/xe/xe_tile.c                  |  1 +
 drivers/gpu/drm/xe/xe_tile.h                  | 11 ---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  1 +
 drivers/gpu/drm/xe/xe_vram.c                  |  1 +
 drivers/gpu/drm/xe/xe_vram_types.h            | 74 +++++++++++++++++++
 13 files changed, 91 insertions(+), 71 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vram_types.h

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 2187b2de64e1..f2cfba674899 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -16,6 +16,7 @@
 #include "xe_device.h"
 #include "xe_ggtt.h"
 #include "xe_pm.h"
+#include "xe_vram_types.h"
 
 static void
 write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_ofs,
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 873f4e18cb2a..11591c7cdc70 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -21,6 +21,7 @@
 #include "intel_plane.h"
 #include "intel_plane_initial.h"
 #include "xe_bo.h"
+#include "xe_vram_types.h"
 #include "xe_wa.h"
 
 #include <generated/xe_wa_oob.h>
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7f8470b22dc9..a35a9e0dbfae 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -34,6 +34,7 @@
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
+#include "xe_vram_types.h"
 
 const char *const xe_mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
 	[XE_PL_SYSTEM] = "system",
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index ff560d82496f..57d34698139e 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -9,6 +9,7 @@
 #include <linux/iosys-map.h>
 
 #include <drm/drm_gpusvm.h>
+#include <drm/drm_pagemap.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 19019b032c78..4bd0619574ff 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -63,6 +63,7 @@
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
 #include "xe_vram.h"
+#include "xe_vram_types.h"
 #include "xe_vsec.h"
 #include "xe_wait_user_fence.h"
 #include "xe_wa.h"
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index ece4bfcde477..55b068183f8c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -10,7 +10,6 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
-#include <drm/drm_pagemap.h>
 #include <drm/ttm/ttm_device.h>
 
 #include "xe_devcoredump_types.h"
@@ -24,7 +23,6 @@
 #include "xe_sriov_types.h"
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
-#include "xe_ttm_vram_mgr_types.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define TEST_VM_OPS_ERROR
@@ -36,6 +34,7 @@ struct intel_dg_nvm_dev;
 struct xe_ggtt;
 struct xe_pat_ops;
 struct xe_pxp;
+struct xe_vram;
 
 #define XE_BO_INVALID_OFFSET	LONG_MAX
 
@@ -68,63 +67,6 @@ struct xe_pxp;
 		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
 		 struct xe_tile * : (tile__)->xe)
 
-/**
- * struct xe_vram_region - memory region structure
- * This is used to describe a memory region in xe
- * device, such as HBM memory or CXL extension memory.
- */
-struct xe_vram_region {
-	/** @tile: Back pointer to tile */
-	struct xe_tile *tile;
-	/** @io_start: IO start address of this VRAM instance */
-	resource_size_t io_start;
-	/**
-	 * @io_size: IO size of this VRAM instance
-	 *
-	 * This represents how much of this VRAM we can access
-	 * via the CPU through the VRAM BAR. This can be smaller
-	 * than @usable_size, in which case only part of VRAM is CPU
-	 * accessible (typically the first 256M). This
-	 * configuration is known as small-bar.
-	 */
-	resource_size_t io_size;
-	/** @dpa_base: This memory regions's DPA (device physical address) base */
-	resource_size_t dpa_base;
-	/**
-	 * @usable_size: usable size of VRAM
-	 *
-	 * Usable size of VRAM excluding reserved portions
-	 * (e.g stolen mem)
-	 */
-	resource_size_t usable_size;
-	/**
-	 * @actual_physical_size: Actual VRAM size
-	 *
-	 * Actual VRAM size including reserved portions
-	 * (e.g stolen mem)
-	 */
-	resource_size_t actual_physical_size;
-	/** @mapping: pointer to VRAM mappable space */
-	void __iomem *mapping;
-	/** @ttm: VRAM TTM manager */
-	struct xe_ttm_vram_mgr ttm;
-#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
-	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
-	struct dev_pagemap pagemap;
-	/**
-	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
-	 * pages of this tile.
-	 */
-	struct drm_pagemap dpagemap;
-	/**
-	 * @hpa_base: base host physical address
-	 *
-	 * This is generated when remap device memory as ZONE_DEVICE
-	 */
-	resource_size_t hpa_base;
-#endif
-};
-
 /**
  * struct xe_mmio - register mmio structure
  *
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index e69a05126dae..275ab5f03291 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -33,6 +33,7 @@
 #include "xe_migrate.h"
 #include "xe_sriov.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 #include "xe_wopcm.h"
 
 #define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index e6871734ffa9..901f9a0268e6 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -17,6 +17,7 @@
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vm.h"
 #include "xe_vm_types.h"
+#include "xe_vram_types.h"
 
 static bool xe_svm_range_in_vram(struct xe_svm_range *range)
 {
@@ -989,6 +990,11 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 
+static struct drm_pagemap *tile_local_pagemap(struct xe_tile *tile)
+{
+	return &tile->mem.vram->dpagemap;
+}
+
 /**
  * xe_svm_alloc_vram()- Allocate device memory pages for range,
  * migrating existing data.
@@ -1006,7 +1012,7 @@ int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
 	xe_assert(tile_to_xe(tile), range->base.flags.migrate_devmem);
 	range_debug(range, "ALLOCATE VRAM");
 
-	dpagemap = xe_tile_local_pagemap(tile);
+	dpagemap = tile_local_pagemap(tile);
 	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
 				       xe_svm_range_end(range),
 				       range->base.gpusvm->mm,
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 858ce0183aaa..bd2ff91a7d1c 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -20,6 +20,7 @@
 #include "xe_ttm_vram_mgr.h"
 #include "xe_wa.h"
 #include "xe_vram.h"
+#include "xe_vram_types.h"
 
 /**
  * DOC: Multi-tile Design
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index fb0473fa9098..8dd87ccb2aca 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -18,15 +18,4 @@ int xe_tile_alloc_vram(struct xe_tile *tile);
 
 void xe_tile_migrate_wait(struct xe_tile *tile);
 
-#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
-static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
-{
-	return &tile->mem.vram->dpagemap;
-}
-#else
-static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
-{
-	return NULL;
-}
-#endif
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 3de2df47959b..8f9b8a1d2c05 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -15,6 +15,7 @@
 #include "xe_gt.h"
 #include "xe_res_cursor.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 
 static inline struct drm_buddy_block *
 xe_ttm_vram_mgr_first_block(struct list_head *list)
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index c93e9b96354b..366e5d8a85ca 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -21,6 +21,7 @@
 #include "xe_module.h"
 #include "xe_sriov.h"
 #include "xe_vram.h"
+#include "xe_vram_types.h"
 
 #define BAR_SIZE_SHIFT 20
 
diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
new file mode 100644
index 000000000000..a01838236036
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_VRAM_TYPES_H_
+#define _XE_VRAM_TYPES_H_
+
+#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
+#include <drm/drm_pagemap.h>
+#endif
+
+#include "xe_ttm_vram_mgr_types.h"
+
+struct xe_tile;
+
+/**
+ * struct xe_vram_region - memory region structure
+ * This is used to describe a memory region in xe
+ * device, such as HBM memory or CXL extension memory.
+ */
+struct xe_vram_region {
+	/** @tile: Back pointer to tile */
+	struct xe_tile *tile;
+	/** @io_start: IO start address of this VRAM instance */
+	resource_size_t io_start;
+	/**
+	 * @io_size: IO size of this VRAM instance
+	 *
+	 * This represents how much of this VRAM we can access
+	 * via the CPU through the VRAM BAR. This can be smaller
+	 * than @usable_size, in which case only part of VRAM is CPU
+	 * accessible (typically the first 256M). This
+	 * configuration is known as small-bar.
+	 */
+	resource_size_t io_size;
+	/** @dpa_base: This memory regions's DPA (device physical address) base */
+	resource_size_t dpa_base;
+	/**
+	 * @usable_size: usable size of VRAM
+	 *
+	 * Usable size of VRAM excluding reserved portions
+	 * (e.g stolen mem)
+	 */
+	resource_size_t usable_size;
+	/**
+	 * @actual_physical_size: Actual VRAM size
+	 *
+	 * Actual VRAM size including reserved portions
+	 * (e.g stolen mem)
+	 */
+	resource_size_t actual_physical_size;
+	/** @mapping: pointer to VRAM mappable space */
+	void __iomem *mapping;
+	/** @ttm: VRAM TTM manager */
+	struct xe_ttm_vram_mgr ttm;
+#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
+	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
+	struct dev_pagemap pagemap;
+	/**
+	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
+	 * pages of this tile.
+	 */
+	struct drm_pagemap dpagemap;
+	/**
+	 * @hpa_base: base host physical address
+	 *
+	 * This is generated when remap device memory as ZONE_DEVICE
+	 */
+	resource_size_t hpa_base;
+#endif
+};
+
+#endif
-- 
2.34.1

