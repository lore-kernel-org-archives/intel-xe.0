Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927CBC5321D
	for <intel-xe@archiver.kernel.org>; Sat, 24 Aug 2024 00:32:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D44210E181;
	Sat, 24 Aug 2024 00:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FJrn2+l8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AEE10E181
 for <intel-xe@lists.freedesktop.org>; Sat, 24 Aug 2024 00:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724459519; x=1755995519;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eI9lP602cwWqcgndtDpzU0hwUH9NRp0pwCFOJSfvwE0=;
 b=FJrn2+l88QRGQ7ZXOtVaMfUS1fCYLP7usabXx+KX4uOTSs0MlmwHcY0e
 PilFO4vhi95G46J/dY1RaFIcEPHnNzyyuWAGjHc6DQneIAnIKr8ePAL/M
 tUCvjAOD4Dafa7L/lTXGpEQYGu3aFBlrrAJes7wtJDKprR02BhfsD1G03
 3gSrL/yagQE6aAJ7OVcDFjh6SHEFnuPxvp+J8+7rx64my2Wc7w5P9bfxB
 BM2+eTQePAmhZqsj7+TOZKdq2T0S2JSmKg//8YhEAEjBPmkCeJaB/phRN
 lYtKVmNVOlfZb9VjycFrYvQqzUv+rvO7hQVBbQ+xUxwD4B8aoZeCnKt4v Q==;
X-CSE-ConnectionGUID: oC8xYgswSbamyh4yLHlnIw==
X-CSE-MsgGUID: 3ZV2oquGTT2xQP4yOkT9dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="26721451"
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="26721451"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 17:31:59 -0700
X-CSE-ConnectionGUID: 34HN5OLKQQ6clXPHXW6Ibg==
X-CSE-MsgGUID: 1E+HFpoxTqGreX6vmh/3kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="62126747"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Aug 2024 17:31:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 17:31:58 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 17:31:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 17:31:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 17:31:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1d3JJ5gkhRzv/V3ttQSGEzqVkFuVvczveqEzHfFQYRSWaTCdttJrT3o8/YN9fX3i10BGlmubeUxPS/sDemUlQy4x7o1oNBjAR6lu2PlE0LzfYc/Z4V/MDKZ+uMMGGmYc6iSAcLGlaHk1JkN5tJBdkrx/QUtUaA2GUpJjb+mwqFqaMD2ofwjiFHseMFUq/NMjomQUVQWO+pOvt3NeZtNNhXeRC7voNdQQNaONnz35E5LQmENeDmcvc2eyk7b8YcazHHTr34sAV1WEm3R2tCgphFX0uNor0fb8iUG+TzOB/f0PcZb7ic2oTFhUqwQAefMPIGwiDNsELWO67DlFvbrDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eI9lP602cwWqcgndtDpzU0hwUH9NRp0pwCFOJSfvwE0=;
 b=BIc9InTMlC3793B32iAdMxTS+Lsn3+cYnXY1mkw4XOBbU5bvM2sOg5FULYiLdNWILzXnOZTMAX5LxWPh0EszvvEFZvfvttURl2sMn/r1kXhej+TDztlQmzQGoq6NYM9/UaSj7M0St/x7M7YfloYMQF56IJVSSR1/DEKDW2FBZTUjp23Kfz9DRNTiWbgyefVjHkEUwV8fzzq8RDg+4+8b+JDcj0xOBtGZ0pZxVbs/hScKhnD2yZh4Lw52Xj0TKEcy3RdnnTW3ZimwE2B+1WbFxzZFyL+6YvnHlEulBscC9s1oJkCQJnWYlRWBbgoBTOTCr6O8gvK5wz/dB2iCCYtvMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by PH0PR11MB7524.namprd11.prod.outlook.com (2603:10b6:510:281::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Sat, 24 Aug
 2024 00:31:53 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%5]) with mapi id 15.20.7875.023; Sat, 24 Aug 2024
 00:31:53 +0000
Message-ID: <d89e0ac8-be21-49de-ab9c-a4509bda48b7@intel.com>
Date: Fri, 23 Aug 2024 17:31:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/xe/gsc: Do not attempt to load the GSC multiple
 times
To: <intel-xe@lists.freedesktop.org>
References: <20240813231148.1663731-1-daniele.ceraolospurio@intel.com>
 <20240813231148.1663731-2-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20240813231148.1663731-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0234.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::29) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|PH0PR11MB7524:EE_
X-MS-Office365-Filtering-Correlation-Id: 136a6d2f-39c9-4820-40bf-08dcc3d426b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nk9EQVlYdFpQbXpua2NkVnM2TEp5ZEJSaGdZNmJkRDg2KzdpRjRyQTZLMVJu?=
 =?utf-8?B?VHRXbWRIRlh0bDFOeVpnYnZRd0NNQ3lGTlZpVEU2RGNHZHFXTjlVUks4WDlD?=
 =?utf-8?B?SkRSNHNlcVBOdzV1Z3I3TFZiQWdzMC9YdFpHWG12T1g2T2Z1cVd5SUVIZmZK?=
 =?utf-8?B?WDJMKzBCM1lvOWpMQVZZUGpNMVRJcTcrREpHK1lteEQxYk1iMkZaV1NWVU9E?=
 =?utf-8?B?UmxkNkVrSXM0N3lvODdhVGJZUGIwTzc3TlV2Z2xpbEVWTjF1K0hEaWJSTUl3?=
 =?utf-8?B?WGdRY3QvemtTd0VuR0w4VEJmZkx4d085d2RndkYwUTFNbzRFOVVpVmdrRzJT?=
 =?utf-8?B?RnRDbGU0QW5iVFQ1b2duVHZRdjV1ZGJQOXVQUDFuSEZUVGU0L3NkcUR1c29T?=
 =?utf-8?B?azBENC85NUpGbng4VldxYk0wYk5udDJ3WXNSVnRWZlVrbUZtZ2pkSE9ndjI0?=
 =?utf-8?B?R1Y2VEEwRGdjNTJVOFhnNkl0TkZKQlh5NVpmYS90TlhvTzAxWm43eVNaN25E?=
 =?utf-8?B?Yk9GSHlHNXRnL1YzZjlDTGJMYUNXZm5WQ1ZiWExhUENVdW5aRVphU09TMEoz?=
 =?utf-8?B?Wmd3WmpFNjJrbGFqa25TZkpwbGZyNi9aZUpscXFEM2cxYmpZQ3ozMmNCYjVx?=
 =?utf-8?B?eXFYdklpZEpvcFNVSjM0cS91ek9QdGtMcG5TbTBPUERwTVphRFZ6d1JjeU15?=
 =?utf-8?B?Y3R3V3dHQTJTQWtMZ1NXWkh6ZUNmMUNnTDQ0eVdTUXIxTHhNZDdDTERTQndC?=
 =?utf-8?B?eGwvUnZOK1VsVTQ1WUJPekUySnBPaFlieVVBTkxXYnZtYS9uZy9ubDEzZHZx?=
 =?utf-8?B?RGFCTGMwU0JTanc1RWFDa3REYWlmRUE1WGpQeFdWSlBXamVoSXlGbS9DaVV3?=
 =?utf-8?B?UGhHOU1YNHVKZHdjZjQrOTJDeEJtOGM1dmQ3Y0VrRXV1SVdtMnFyZVF0QmNa?=
 =?utf-8?B?OUlWYXFZYVNHMkZEZ3BCTnk4dE1NcUVrN2tmUjFoQmxNYlE3bE9XY1YzbzVj?=
 =?utf-8?B?R3d4ZnRRZTkrVEl5L0dJb3Fsb0piWC8wRTA4YVpEMDJEbFgxdHJLOUxsY1RB?=
 =?utf-8?B?aWd6ZzBqVW5IZWJtamVPY3JGRmU2ZG9COUt3R3RWWGdBb25DeVFTNUVEUjF6?=
 =?utf-8?B?WTBsTDFNbVpsRUtNdURiSXBqY3JHZlFBcVIyeW1Tb1NLMGdiMXFOMU4zTHJL?=
 =?utf-8?B?MXJpbGhLWXh4NVN3ZTJPNGpuYXc3S1FXWi80Mm5GT2ZjVHRUbDJWYkk3V0hR?=
 =?utf-8?B?N091NmhzeXA3ZituYnlXbE92SjJlSHg2L002a3NnbkFtbVVsejUxSks0N0tX?=
 =?utf-8?B?bW1OTXI1c0c2THR1TFNXbFc5akViZmdneDZtcEpSSkhEY1U4eVkydkxqNVhq?=
 =?utf-8?B?ZjFsRG9XQUErQ1RDMHNHeE1ER1VwK05Dc2VGK0hpSkVsdFdKNldLUGxZQ3dw?=
 =?utf-8?B?Y0RYNjlFOUk3dUNUeDBGTUpOQ1U5dWY0WUlCeWxtNm4xMDBhL2lIWkxvNWlR?=
 =?utf-8?B?U000Mm13ak9xckhZb3BpanNOZVV0Z0crMDduMjArT0pkZnBvbmVDTkNIRU1T?=
 =?utf-8?B?V0UyOFlOM283OEtEYXBPMXVZN1lTU3lKY0RKbXFHN2ZJVlRoanU3U09uUjQ2?=
 =?utf-8?B?NnhsbXkzRGJ2NFpGemlxZGYzWC9QWFZQNEtrNUtvM3E5U1dTKzA2d1QxVDIz?=
 =?utf-8?B?MnNIWmdkYlo3b2F2NDB4ZDZZNmZ6QnpqTmJ4UCs4SG1YQ0tLbDlDL25EU1kr?=
 =?utf-8?B?QnVlNWI4dGZQbVI0VjRWajlESHV2LzJSWlJKa20wdnNyMFE2TXdwU2FqOE9O?=
 =?utf-8?B?WDJmYVdINVppMnRBZUxOUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWF4dGNoeVcrK1RzQ29wOG52ZUh3ZDByTEQrRUdHTm5nNFFhRy9aajBFbkV6?=
 =?utf-8?B?ajBJaGVQTU5wQytaSnp6ZGlZazFNUGlMWXY1bExHaThLZGhLMGRKU3p4dGV0?=
 =?utf-8?B?SHlvRGpXQ0NSMTArYUl5aDdOMkl3RWo1cDcvZHhGVXJ6SW1BZ2tLL0N6NnlH?=
 =?utf-8?B?SzZDTEROOVMrUSsyUU9RRzZKdzZLelFmUE1vdFpCaEI0S0tIcFJ4RUFCdW85?=
 =?utf-8?B?YmpGMUU3dWNBaEFHbHFNd0h1WVVSODVMK3cxd2s0QWs5SjdRUE1QdmswWUI4?=
 =?utf-8?B?aFcrOGhkNGRxMS9BNndFTVQ2RGpNV2pSZDVtajNuTVZzb2JKZnI0bUJuK1gv?=
 =?utf-8?B?Q05aSkdLdlY3akltSk9SaTZRT0hpaHlFUStNTFAxL0xQK2V6emR3RlBxSXFD?=
 =?utf-8?B?M0IvSE14N1ArYTY5UGdiSk9MU0tFUStOZ3JNUkIxWHcvUVpyZDFxc1JkWm9U?=
 =?utf-8?B?bmRVNG9pNXNYOGhGZjNtMEpkdUdjMGlmYVBZUkwydjRyV2tTSGxhK29UQmdE?=
 =?utf-8?B?ZWRVM2ZKY2kwSUJhcVNwdXk0M3N5Ym5BV2RJOC9DNUFLTi84QjJzbG4xejNj?=
 =?utf-8?B?VlYxMmlUQWgwWEJQWlBUNGI1Y3NsamMzQkpkTUtMWXZLVU5ESktuU3hjVmp3?=
 =?utf-8?B?YW5WWU5HWXpZeUJhUlJud3h6WkdVTERsQ3RpSE5PMmdpTUtSZTZSMlVOemZK?=
 =?utf-8?B?QVJTbnVhMU1yY2JRcTdDdTI3SzBpd0JUWEhLdHJha0piTWN6a09OZEZBUExn?=
 =?utf-8?B?dXgybGxLZlRpSEZWRURwS2lxbWwrSGxBZ2lsMlppR1FsNGw5TnR4S3F4MU00?=
 =?utf-8?B?SFVsd3c4K0xkdnFPR0M5T2ZUOEhicGN0UFJTNE5IOE85ZEFVd2xlSGRpVkJy?=
 =?utf-8?B?R2thaGtRWjRoOG5CWm9na2NIREdvZUNhcmZKTmJHd0ZzaVdRSE1HOVlzUHhD?=
 =?utf-8?B?am4rLzJZT2EvWFlEVlhGeUR1eFBvUGJ5a2pXNkcwbXYrOUttNHl6WmJyYndZ?=
 =?utf-8?B?V0xmd1k3aDFMNVVzQ0JKRFNEcXlTQnBzZXNTNXppRnlVRGt4R2hGSTgrM0Yv?=
 =?utf-8?B?WFR3ZkN4SUZtVTdFSGZBeXlLYTQ4Smp1STUyK3VWVXJlb3pXR2liaFptSHUr?=
 =?utf-8?B?K21mQzhmSHRhTGxRdUlwWXk0NGYwb0VsbHN0WEhJYmZ5eGxKQjcwL2x1L0l6?=
 =?utf-8?B?anp5Nk9CdzJ6eE9oWGZhY2pwcW1YZE1zcWZubnF2WlFBT3NUL2U3T1JxVHNT?=
 =?utf-8?B?L2ppRUFhZzZFY0NrdkJqTUVVSEwxdDFiM2NPNnY1amNMOHR5VG1iaDJwTGxt?=
 =?utf-8?B?bnhXMWtpaWY5WUtYM1djMThRUHhQYVBnMHREZWdKR3IrWlVPS2Fld0l2NHFi?=
 =?utf-8?B?MExTYzVnUmpmRmpmZFlsY0ttMFVEWWs5QWJmVldTMkhBWVpUR1htR3VzSU1m?=
 =?utf-8?B?YVd6ZjJSNGIzZGo1K29qOSttcjZEMUxwQU9qMGt5ckVneHJVWTh1dGZwbjFG?=
 =?utf-8?B?c1FnQzVYdEwwYnllbTNsM201NVczZFF2cE1rTWZLL1Mxc09XZDBmRC8rZ0Rn?=
 =?utf-8?B?VjlvYW1waWlHVGYzdjE5SkpCSDdUOEE1bTJRdDVYSmh5U1pwSmVYK01yV0Q4?=
 =?utf-8?B?V05uQm5NeHM5U0JtQnlyMHBqb1dPT0FOaVNwQ3FZb2VwMXdyNTZHY1hmSWd1?=
 =?utf-8?B?SjcxeHdxS21jMGVwSS8xSFQrb0J6SDdaNVFPRnFYcVVEZ1I4dkhwajdSdWdi?=
 =?utf-8?B?d2Y4VjlDbU85NEtkT0tVNHk4UUZ0NEw2R0Y2em9MaVB2QUcwejc0TkpMUnFx?=
 =?utf-8?B?dDRiNGZOK1FweXFHWkdzWUo0a2Z4bUpLK2Viak1tUGVDMkJsMi9rbTIzZnZM?=
 =?utf-8?B?R1RwUmM3Sk9nV1M4ZElWNTBFK1VMd3FUWUE4ek1FSlFuQ1VISXkyb014ZDMr?=
 =?utf-8?B?NzZ4LzRvRU8yZS9NWjd2WnhreFBrYW1CeWV2czV4SmdtU0R4b09vdVZ2eVcv?=
 =?utf-8?B?TkpzOFFIbmhUcnhrMVJRR3hvRERlbHVoVUV3TWovMUlrWCswWlNTK201cC9t?=
 =?utf-8?B?cUR5bklXS0V4V0Fid1NJcjlnVFFpU25Ba2RPdGNGaFY2cXhEcExGSHNFYVQr?=
 =?utf-8?B?eWVpcGFMZldyV1RIcW5abkNvTkI1SXNQM2dCcURxcHdjNnRraDhZVVBUUi85?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 136a6d2f-39c9-4820-40bf-08dcc3d426b9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2024 00:31:53.1870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BLxPCmx4Ftcb0R4VqhflxfAYzU62y1qKX7b9Qk8hEw8hTHEKqUyniw2a0APm768ZMFuXhaVI8KhPztB5clD2+639R/rxJNv59QPtS9MCMjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7524
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

LGTM

Suggest to use "< 0" for error check in xe_uc_fw_is_in_error_state?

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>

