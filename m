Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6149CCD1A5
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 18:39:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5F410E09F;
	Tue, 21 Oct 2025 18:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IMdt2TpD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273B910E03D
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 18:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761071977; x=1792607977;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zufPPjtfB9qJRJF6NIhbXAS0SVI4DL3YkWcAsj3nRg8=;
 b=IMdt2TpDc8EA5D1z8EMrJMDsZSoBQ83g6ucWYFuMFx46CXqBLdkmNfKk
 1HPJEdkieHz9srM4DQ88mqt2wMw7c+co/peU7unG9shmhSZsZbaBC/uKR
 PtScsK3aRvCa8BkOuP+trjWYr6MlSV5DY9QLnxDO1l7/B3RD0FPGEmoZE
 XAeD5QgxHzyAMmSmlXqqS8/bpK0BROWyt5Kv+gYqTd+ZQFoz0ozxlBaGi
 7ZtBam4RrisKtf6NyNUvU2wqCAZqXhbv2pgRH601exqeBMSK7dpEgvPgt
 XV2HoIu4CJF6Mi+5gCRJqkSTcOMtWNpRmyo3Qm6tYqpvVPHF66YBERPNb A==;
X-CSE-ConnectionGUID: DfFDHTRBRDmmJqlO0mSfGw==
X-CSE-MsgGUID: vG31BVu4QR+Jjt9NZ6C22A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88677445"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="88677445"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 11:39:37 -0700
X-CSE-ConnectionGUID: D97zgwHhQ465tCsu5p0wiw==
X-CSE-MsgGUID: QniNd+RERw2Pf28/a5M+1g==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 11:39:37 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 11:39:36 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 11:39:36 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.40) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 11:39:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FqeW/TAg7XUdR0geJeeeNupw8kOz189g+OGY+DuoiiOox7aMg7pEKn2uh9IIBpRVWekpilUOnWsyEWhg9hALEvr2iK/U5d6ADszlQ2CMOVHbubmx2onFygkcg/0+PdPiB4j+u5IxUF6EZVbEL9dTi1Z256B+zb8eUqO8W57crI04eEpcUjeqqAC+YzyG/yo+VsX/y9ZVykldU/r6fXe0BnNyH3lzoaAIXYmJexSiOqGpizzl/sEr2rBbvYqBA0K0+pg+51Whetx52o4LOM7lGm7u9iYxTIgoEEofc4qbHk0NRddmUlrnPE9jKW7tiOeUnWgAkV+6+4RlpHmUDedvZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouhlNceNZED7JQHwUDoUP+pAHYC0pAmz+Q88joZlExI=;
 b=rQkjnmFsJNisiZq6hZVT2Py8W3PSzSrHDpkeTvA/oNwZGsFB8RCtefz/gVmvcVU4yPHd2b+O0/99MewNyykvuuiyOLlDeyr69k1OISL22BdkP67BW0941UUiTuu8PdRs7sRYwAxEytjDHy7YtZfcOhgQBurP4AlgwfFn1VzkoJAuZR4taRLOfLWFdS1ocAiVx0fgBX6MXG+voJn4R3ad7rBj4aYg8PDrXdIcAn3YBeukz5Sd0SvN4LZzVJu3lKVomlSDv79JqXMdggygC+iu5sGhAIJfNPUdHrtQXyuKZlGzizNMNlejF366X0cS33q6EgWl+bW3JqnmMyHFysOVIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ0PR11MB5216.namprd11.prod.outlook.com (2603:10b6:a03:2db::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 18:39:34 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 18:39:34 +0000
Message-ID: <5b46eed6-fa1d-4ab2-8963-a8915b802c12@intel.com>
Date: Tue, 21 Oct 2025 20:39:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] drm/xe/vf: Fix GuC FW check for VF migration
 support
To: Tomasz Lis <tomasz.lis@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
References: <20251021181250.1541639-1-tomasz.lis@intel.com>
 <20251021181250.1541639-3-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251021181250.1541639-3-tomasz.lis@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0423.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:83::22) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ0PR11MB5216:EE_
X-MS-Office365-Filtering-Correlation-Id: af700555-1b7e-42d7-1493-08de10d12dfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGEwL2dUR2kyNnJwNEM1RytzcG1nbHlTY1hQWGlRSVN5L3lBVnJVMzhsbFlu?=
 =?utf-8?B?Z2FmUStkT005NDY5amNiQkVEYnAxUHAvdDlRcXpMM3RqVmovRjQxbHh2Yksy?=
 =?utf-8?B?VjVVazNLa2NobWdJcXQvVGRKOHRvUzYyOHZzbGVvSFVFcW1scWFyK0E4M3Ur?=
 =?utf-8?B?c0xDb1BYcmZjQnNnV0dOUDJ0WU14b3lmSXppTUQxL3BNdDVsNzRxaTk2Tk5y?=
 =?utf-8?B?WWdSZHFNd3F1bC9XcDRSVW0vUGJabVl6eWpzZHdORjNSTGgrUTJVbThSUFpp?=
 =?utf-8?B?amFmWll0NUVTVGZDSjBRNFRXOTZEWWs3enBMSHYxYmphQ0xnRS9rMXN4dUJG?=
 =?utf-8?B?VTlCNGNBK1M0cmZOeDMwdXhkZkd3SWdvYXdPRjIxUFRWT3ZscjlVcTA5MDlz?=
 =?utf-8?B?YnVYWHRQUkRLSGxHRVdoQjdNOFMzd3RibWdGbWxNTXFIeVo5WjdnZEdXaGRP?=
 =?utf-8?B?M3ZpT3g5SEdxdlFucS83Ry9SV0VpdnB3RE4xTnBGU2lHbGRmSDNUY1VtQXY3?=
 =?utf-8?B?MWtZYUhMSk1Pdk1QM1F6U3dFYnVPZjdYbGEwNUZqSlQrQzlmRUtHSFJLWHRQ?=
 =?utf-8?B?d1MzaUJhMnJ1K0FoYnkvZkRiZklhNjNVc3RWekRHTkZzK1hHZmk0M0Y0YVhZ?=
 =?utf-8?B?SGxFMXB2UTJWUFFDQzAxTmNtR28xZTFpVW1meElyNXFtZHMzbHJ2VWxyamRV?=
 =?utf-8?B?T2FTNnFCNEkweUcyUGVhaHRBakd4Q2Vrc3BweThmdXNkRkkxRVpxZ2Z4eTRN?=
 =?utf-8?B?RzNoeDduamFubEFzYXdnU29VcU9OTDhsQjZSUXVpUWgvb1AyemJoVVhBRWVv?=
 =?utf-8?B?Nm9CVVBlaERBZGJ4VFdIYXJRK0tuZkVVK005azBUQTBlT3FyODJSQzlPVXRw?=
 =?utf-8?B?aHRONmpydFFFVFlnOEVHTkxXSmtVNVRyYUFod0ZEMko2N1NjbU5Nb0xaOGlj?=
 =?utf-8?B?aFRXeTc4Y08reGx5QWNGRVZucXU1ZjRFcUZNcUl2d1hiM015UVo4M2h5Tm85?=
 =?utf-8?B?SnQ4d1E3NE1Ia1ByVnMya09NbFpxNzV3d2lIRXh4eWduRnl4d2UyTXZCZGlF?=
 =?utf-8?B?dEV6aTFXRmFEUWpvVjEySDVhK1QwMEVZd0hGeWhQZi9yeHZVZVJQbitZVUc3?=
 =?utf-8?B?OWNJbkxESlR4TmQrMHVZYUpnMkpiZkkvb2U2b0U0L2pBbXFsQ016c1VrZks2?=
 =?utf-8?B?RTB4NEJDLzRWalpzd1QyWjV1YWVteEtCOEM2ZDNsOXdHckJGZENZR1pHcFZQ?=
 =?utf-8?B?MEY1NWVQSFJ1VEpGL0Vxdm50UHh5L0IwNVE4eWdsTEZiWlU1VURhM1RNRzlB?=
 =?utf-8?B?NnZ6L29TL0dIeFk3MlVhRE5vZlI3akllajVOeWczcXE5YXZVT3drVjNldEFq?=
 =?utf-8?B?a0J3MmJlUFhtSVlkalBZelBCeDBXbVR3SWF2bVgrL1E5TXZiU3ZvbTZwRTZl?=
 =?utf-8?B?dGo1VEUzaFM1WEN5dTlpSm1oVzlsa3dJQi9ySjJiUTFaZFQ4L0dTUHYyUC9J?=
 =?utf-8?B?Q280ak1wZnF4V0s0MXZhSVhKdmszYWpoRmt1Um5rL2hEMVB6V1pPRXZzRTdL?=
 =?utf-8?B?WkNPSE9JbUFseXJrZkhPdU9CcE1XRHhPY2RPazgxUGh5cTJIV3gyanJWZzhZ?=
 =?utf-8?B?T3NidzJJVGFzRmx6N0lVZlMvUEVEVUV4aWI3ZGRGVlVMbHl1YnJFUXB1WHI0?=
 =?utf-8?B?ekZvZlRCekpwdW04ZXp6MHJSZXlITHRkOGlYNk1NcWlhbUlyUjZoMlViVURo?=
 =?utf-8?B?VkZ1emIxcWQ0NVlyQnBFaFEvZFdvd2NLbkR1UUlHdmNCVm00NWY0Y2YvdjdY?=
 =?utf-8?B?S2R1R2UzSmVCeEhaVWY4SG9NSHg0UlhJUENVakRjeFNJV29FS1lHK1lTaUFu?=
 =?utf-8?B?Tnh0OXpVWEMybEFXeWdxQ1RGcUIzSEpMM1hIZTZwRktHd3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHhOTm1kcGNIL3hPQWNYTFA5TWpnT2NYSmlDMFB3ZmVHM25VR0VzZlhnTFJ2?=
 =?utf-8?B?ZmphUFhuMk1VSDdzR3hxa0w2SE4xcnp3eitTME1iRHhud2gvUkY4TnY1NkJu?=
 =?utf-8?B?bVlQVC9MU3RMb0E3dWxrWndRU0Q1UkxJNXZUOGgvTUEzb3RvdUF6MGNXVEls?=
 =?utf-8?B?eVVVNDVHamJ0d3N5U3ltMkxyMjVGa2xCN3daVFpxbXdDT1NGOVAweGxTUHpi?=
 =?utf-8?B?cnNJNER0RXpwdTNZOEtPYXhXWmJRdUhHeFRlZnNQMmMxdC8ycUFnR2JQTzYr?=
 =?utf-8?B?eVZLYkNKdnZwVURHaU5LdzkyMGVkRFY5VU5BT2dhaXA3ZDBsd1N6T0NsQitR?=
 =?utf-8?B?OURLZElmVmFoU2dJQzJITEQ5R2ZRWFZGVHBhSEpYclNQbXlEYm90VURvZkQx?=
 =?utf-8?B?VkswMlEzNlBla2cwTW1hQUowdW9DNHJ2ZmN3enJXZUU3cXlwWitTamNTdjk5?=
 =?utf-8?B?QWRheGpaVEtyK0xabmxWZEFBdUlCMXhtMGRiVks4WWlmcXF1czNrR3Z6TzVE?=
 =?utf-8?B?aW1xdmFpdUt5UkRPVGtkNklZQWRXOFFmVkJxdG53czJtRCtjc2JsM3llcTZI?=
 =?utf-8?B?STdUNDVpZTV2dUMzZEthOWVDTUdWKzVxZUpyMWk3SVIyeWJYenBlYWp2dTRr?=
 =?utf-8?B?bFI5SmdDUEM0K3hsaTA3bHhnSEpSZGxJSjNvSnVQbUNZTk9rT3dZOG5MLzF5?=
 =?utf-8?B?Y2REcUdMczhUamhteG82ekN0VTVITGdoU2psVnRuR0NkOWxid29DclNJckh3?=
 =?utf-8?B?RSttQjRSSnpBSDVWWGJPd05GTkpqVzNVSzd3YSs1VEM2bDM5WG8rV09GL3Iz?=
 =?utf-8?B?SGJUWGxSL0M4dFpMM2VOOFdWQXM5c1ZBRkE4TGFuQmZudmcxbUtobUg3azc1?=
 =?utf-8?B?eGJnaTRtcTF3MVdXMXJreWY2bFJ5UlpvMkNLTXRoK2tEb21UZk1GSXIyeFBR?=
 =?utf-8?B?U2NvejkyQTd3Y0l6TEhQR1Bqc3g2N1dvSk9tNGhpRWQxM2RQd2M1NWdaMjFZ?=
 =?utf-8?B?TWxiTUpON1NpeU5xN2ExNDdDUVpTNFgwaWQxcXlzNHpOTUY2K043ekNieldp?=
 =?utf-8?B?bWJBOWwweUhtV3lWbFpTTkk2VmEwcjRvSGYrSTBvY1RNcHFIRGZZblZUTDVJ?=
 =?utf-8?B?Wkd1YmZaWk1mSVJ3MzVzRFNQcmpoUkpqeXhpc3BMb2lwZlN6ZEVyNWpQSWE4?=
 =?utf-8?B?Uml1aXZUTis3cjhLcjVtdEtiOEl1NXlmUFk1WDRkaUc4ZnhNTlRYYkZjUXRV?=
 =?utf-8?B?TnVFSDRVbjNYcnJSNjhNVTNjS2U3M3NmSk1pd2VpYjErZmczYzVaa0g2Q08x?=
 =?utf-8?B?WjBxVk85bzRRazhrTzlKUndTcGtqRkVuTmtrZE1Hb2wzMWlpRCtjZWk0T1d6?=
 =?utf-8?B?Y2dmVC9rSG5lWDFsUTg1T2I1eWdQWWd0b3NESHVGT012aDFxNkhwNTZMSnBz?=
 =?utf-8?B?Kys2VHdOUUpTcjVId0N4amJHZmloc0RiU2ZwejhOaGFrZVYxRkgvaExabGFW?=
 =?utf-8?B?b0dhRWxRUFNqMC9lMUJrM2YvY0N3aVZEWGlQa1pFbHdlQzd1bW5NNkd2d2ty?=
 =?utf-8?B?WnFXRkF0dU9OZ0RiSUlOVFpRQ3hCRGFpTkdjK2xXRHJUYm9TNHFWd0JmTE1D?=
 =?utf-8?B?S3VKYUF2Y0E4dHlCa3BDK2VrdjNnNm1OK0R1dExFaXpXOGR5OUNVR0VKUEVw?=
 =?utf-8?B?UFIzMUUva3hKRmNEZERuZktFbGhaU2ZJblZpOEVGUDd1ckp2NFJ6aFM4UFp4?=
 =?utf-8?B?djQ0R2x2eG9IV2g0ZTVqYzRNZ3NRb3hGVUVFMzltRTRvQ1F5dWdKbmxzOGJX?=
 =?utf-8?B?eWptbG1qS2t5M0dWNjlsQjloWTRUMXdtRlpWeVdWbG9EOVJocVZYb3JCSzZ0?=
 =?utf-8?B?YlQxL2dSckVmSDZYbS82SEZUQVRFNTVDQlg4RklzQjVFNHlrYVduRnZCai9h?=
 =?utf-8?B?cjdsazFrR0hsZC81WEYyblpiN21sZDJJOGU3M2gwNm1XeGNoVzE5NEh3UEw1?=
 =?utf-8?B?QmFnNWtjRjExVG1RNmEzOTdaZXc4MTFUeTlIZUd2VURhT0tPbGYwMFIxLzV0?=
 =?utf-8?B?S0pVY1d5cGczVFFRald0U3dXOHg1R0YxQ1BwRXo3QmZ3U2JFaldUc1RJZy93?=
 =?utf-8?B?S3RhUTBmSWwwYUZZTVUyMkJaOTlJTzBRck15WG5rV0JFRVRNKzZ2QW5JVVNK?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af700555-1b7e-42d7-1493-08de10d12dfc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 18:39:34.1633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCwGNUNhgMSUvg5EMjuU8YSSbQBAj5Nqf9N/bfI6Je8TCs6wd/DlpFtkWzjyEIXKUDcmuEyN1VWtyyaawc0bZJm4WVtLm+PXTx2x8hiVbnQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5216
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



On 10/21/2025 8:12 PM, Tomasz Lis wrote:
> The check whether GuC ABI version meets requirements shall be
> performed after said version is received from GuC.
> 
> Doing it in wrong order was triggering a warning:
> xe 0000:00:02.1: [drm] Assertion `gt->sriov.vf.guc_version.major` failed!
> 
> With this change, dislodge part of the VF migration support check
> and moved it to after GuC handshake.
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Tested-by: Matthew Brost <matthew.brost@intel.com> #v1
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6349
> Fixes: ff1d2b5e3d28 ("drm/xe: Read VF GMD_ID with a specifically-allocated dummy GT")
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
> v2: Use xe_sriov_vf_ccs_migration_bb_needed()
> 
> v3: Update commit message, move check funct to ccs module (Michal),
>  rename xe_sriov_vf_migration_disable(), remove its duplicate
> 
> v4: Limit scope of some functions to xe_sriov_vf_ccs file,
>  switched 'Fixes:' tag to a different commit (Michal)
> 
> v5: Squashed with "Helper for telling whether CCS migration BBs are
>  needed", added kerneldoc, moved location of some checks (Michal)
> 
>  drivers/gpu/drm/xe/xe_sriov_vf.c     | 33 +++++++------------
>  drivers/gpu/drm/xe/xe_sriov_vf.h     |  1 +
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 48 ++++++++++++++++++++++++++--
>  3 files changed, 59 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 0d8135f3927c..13d6c094ae8f 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -133,7 +133,12 @@ bool xe_sriov_vf_migration_supported(struct xe_device *xe)
>  	return !xe->sriov.vf.migration.disabled;
>  }
>  
> -static void vf_disable_migration(struct xe_device *xe, const char *fmt, ...)
> +/**
> + * xe_sriov_vf_migration_disable - Turn off VF migration with given log message.
> + * @xe: the &xe_device instance.
> + * @fmt: format string for the log message, to be combined with following VAs.
> + */
> +void xe_sriov_vf_migration_disable(struct xe_device *xe, const char *fmt, ...)
>  {
>  	struct va_format vaf;
>  	va_list va_args;
> @@ -156,22 +161,13 @@ static void vf_migration_init_early(struct xe_device *xe)
>  	 * supported at production quality.
>  	 */
>  	if (!IS_ENABLED(CONFIG_DRM_XE_DEBUG))
> -		return vf_disable_migration(xe,
> -					    "experimental feature not available on production builds");
> +		return xe_sriov_vf_migration_disable(xe,
> +				"experimental feature not available on production builds");

indent ?

>  
>  	if (GRAPHICS_VER(xe) < 20)
> -		return vf_disable_migration(xe, "requires gfx version >= 20, but only %u found",
> -					    GRAPHICS_VER(xe));
> -
> -	if (!IS_DGFX(xe)) {
> -		struct xe_uc_fw_version guc_version;
> -
> -		xe_gt_sriov_vf_guc_versions(xe_device_get_gt(xe, 0), NULL, &guc_version);
> -		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
> -			return vf_disable_migration(xe,
> -						    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
> -						    guc_version.major, guc_version.minor);
> -	}
> +		return xe_sriov_vf_migration_disable(xe,
> +				"requires gfx version >= 20, but only %u found",
> +				GRAPHICS_VER(xe));
>  }
>  
>  /**
> @@ -193,12 +189,7 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>   */
>  int xe_sriov_vf_init_late(struct xe_device *xe)
>  {
> -	int err = 0;
> -
> -	if (xe_sriov_vf_migration_supported(xe))
> -		err = xe_sriov_vf_ccs_init(xe);
> -
> -	return err;
> +	return xe_sriov_vf_ccs_init(xe);
>  }
>  
>  static int sa_info_vf_ccs(struct seq_file *m, void *data)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
> index 4df95266b261..e967d4166a43 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
> @@ -14,6 +14,7 @@ struct xe_device;
>  void xe_sriov_vf_init_early(struct xe_device *xe);
>  int xe_sriov_vf_init_late(struct xe_device *xe);
>  bool xe_sriov_vf_migration_supported(struct xe_device *xe);
> +void xe_sriov_vf_migration_disable(struct xe_device *xe, const char *fmt, ...);
>  void xe_sriov_vf_debugfs_register(struct xe_device *xe, struct dentry *root);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 790249801364..842e2a4e4774 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -10,6 +10,8 @@
>  #include "xe_device.h"
>  #include "xe_exec_queue.h"
>  #include "xe_exec_queue_types.h"
> +#include "xe_gt_sriov_vf.h"
> +#include "xe_guc.h"
>  #include "xe_guc_submit.h"
>  #include "xe_lrc.h"
>  #include "xe_migrate.h"
> @@ -260,6 +262,49 @@ int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
>  	return err;
>  }
>  
> +/*
> + * Whether GuC requires CCS copy BBs for VF migration.
> + * @xe: the &xe_device instance.
> + *
> + * Only selected platforms require VF KMD to maintain CCS copy BBs and linked LRCAs.
> + *
> + * Return: true if VF driver must participate in the CCS migration, false otherwise.
> + */
> +static bool vf_migration_ccs_bb_needed(struct xe_device *xe)
> +{
> +	xe_assert(xe, IS_SRIOV_VF(xe));
> +
> +	return !IS_DGFX(xe) && xe_device_has_flat_ccs(xe);
> +}
> +
> +/*
> + * Check for disable migration due to no CCS BBs support in GuC FW.
> + * @xe: the &xe_device instance.
> + *
> + * Performs late disable of VF migration feature in case GuC FW cannot support it.
> + *
> + * Returns: True if VF migration with CCS BBs is supported, false othherwise.

typo

> + */
> +static bool vf_migration_ccs_bb_support_check(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = xe_device_get_gt(xe, 0);

this will make static code analyzer unhappy

likely xe_root_mmio_gt(xe) can be used instead to avoid that

> +	struct xe_uc_fw_version guc_version;
> +
> +	if (!xe_sriov_vf_migration_supported(xe) ||
> +	    !vf_migration_ccs_bb_needed(xe))
> +		return false;

nit: IMO it would be cleaner if moved to the caller side ... 

> +
> +	xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
> +	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0)) {
> +		xe_sriov_vf_migration_disable(xe,
> +					      "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
> +					      guc_version.major, guc_version.minor);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  static void xe_sriov_vf_ccs_fini(void *arg)
>  {
>  	struct xe_sriov_vf_ccs_ctx *ctx = arg;
> @@ -292,9 +337,8 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  	int err;
>  
>  	xe_assert(xe, IS_SRIOV_VF(xe));
> -	xe_assert(xe, xe_sriov_vf_migration_supported(xe));
>  
> -	if (IS_DGFX(xe) || !xe_device_has_flat_ccs(xe))
> +	if (!vf_migration_ccs_bb_support_check(xe))

... here

>  		return 0;
>  
>  	for_each_ccs_rw_ctx(ctx_id) {

but otherwise LGTM, so if CI is happy, then

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

