Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15BDD30CE5
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 22:08:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5599710E55C;
	Tue, 13 Jan 2026 22:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/yvR08o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E77D10E55C
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 22:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768342088; x=1799878088;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=0LJdAn8TbuY3JKLwY+N4WihYszZFN9BbW0Tkj/3Ihr0=;
 b=M/yvR08oFjpn/At5DjT0KFL+0DIWXD42Ms7dWTRicuVRYk5DZwcE8wR1
 M4BpOE7WELvBg9l8Twzgr1dAemBAEsPGuX6LKV7x5BICNPiyxY6MYPiXF
 ePv02rtKfZcbawLyppjgevTkDR7Nz2jMS+A48eeqxtYlL8BuWkpeWGrip
 HewBuRUPCz8OucTMbEGvkMloCGJSDnhER3j4fKtGrFkS+U+iqY1PwmQlX
 rs3FXb6oW5oOD65RfJA0vwnYA6T+jFHtqMx76U3GUZW269ztsKdz7catC
 UFxuLhi3R0F2dsbMKfWngnW0Uh6DokYB9+HHIHDfsy9dt1jKx4txSWkIW A==;
X-CSE-ConnectionGUID: oDav90HrTI6m8K1IrEs2vQ==
X-CSE-MsgGUID: tJpNdRpuSWKiMlBakw3CMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="81002870"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="81002870"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 14:08:08 -0800
X-CSE-ConnectionGUID: wBc8wzHFTAmBtJeVfbiBmw==
X-CSE-MsgGUID: TTMyj+wsSKCms8l5+XI1XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="208663433"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 14:08:08 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 14:08:06 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 14:08:06 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 14:08:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXVzaqHlOTGY+2FDuTWKcRmoT2A5FjyeCv10kljeJ8SAfCY8ZSlnAvALT8sg2rj4Ica6dW7ZYrZdJWjkUaL5IZdkgDRQ20MdHWAruZpFp/IHHywiu+B7RNYEZmcSqFQ0tL5Fl0ANYRBnBUFt4KFl2DlXDzt8o0uicjeqrU/o/PBZ9zUJIuuPfy9KOxsn0rrmC8+xDdDQ9YR0k2/SUkI12EedrULBuOIRknnIclP7GfATGivpS1jHWoEMyvZu/T5rtWWkjoPdo3uU9bS35eG3+QgZX9ss/vqjjmlYmW/uuD8PeUf68E3veYGur1Nzu8qeavUMNGTRkCJUnZznh/88Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dSOAyDyYdWLBxgeMVCIQ911pGmQ0XgrxlZ0E0bJ2qw=;
 b=QU+Z7oqsHGxEjaxK9NTCZCH4uCvr8rq+ddn2LU+hWDuLR4Qk4jSaUfUjZNEU+XSJ0DNO6oRiwpOu2EHlmvPpZRL4Bs7oiIT+pYtaJrUskiRmxAD1ZXELJM779BalY6awuyO4ojX2vneTQX1kolYz7Uv5djWSxh7NhRvp4xyKZxAoqknHCTu+v6/t/cB54LCrMsiSmwNVvmNcKPMjdlI+fmHyb9EqESWLsrKFDKpeSLc9/qD7bUlIT0mqb0UcmR9Y2Uahrc6iEW3srBbc1dMJCS/A749YI7RV41qCf7cQM5ZgELnZ9zL22J4r3NADgYRN28nqTRMUncjsG8ETijoXyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW6PR11MB8437.namprd11.prod.outlook.com (2603:10b6:303:249::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 22:08:04 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 22:08:04 +0000
Message-ID: <33fb21fa-b75a-4109-9d4e-71f954a2e787@intel.com>
Date: Tue, 13 Jan 2026 23:07:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] drm/xe: Make xe_ggtt_node offset relative to
 starting offset
To: Maarten Lankhorst <dev@lankhorst.se>, <intel-xe@lists.freedesktop.org>
References: <20260113121807.1303124-1-dev@lankhorst.se>
 <20260113121807.1303124-2-dev@lankhorst.se>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260113121807.1303124-2-dev@lankhorst.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0173.eurprd09.prod.outlook.com
 (2603:10a6:800:120::27) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW6PR11MB8437:EE_
X-MS-Office365-Filtering-Correlation-Id: e79f5d99-bb30-481d-cc44-08de52f03917
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFI4MzhTVGZxZ2RPMWYvMUNrTW1GdXJDMTdRL1ZRbk15VmFXM2lTait6SFVo?=
 =?utf-8?B?MXRPUW1aTXdhcy81dDVuZk5ieHRMQkhOTUF3TTd2Z2RLcFlmTk1KKzJjb2g4?=
 =?utf-8?B?V0ljT3UvcUxNL0d6R3Q2RDFCL2QwYlI0RldBN3Bwa0krcGVTa2hJT1V5WjNP?=
 =?utf-8?B?OGRDWU1mWW5FaTB0SUIrTFpaVE1zdWNEbE9CUjdrU1cyL25RdzMxV3hBblNC?=
 =?utf-8?B?aGFyQUZmaGhnTk51a1plbmtDcTNkbHErN2ZEY2ZMMC9lbndKWmx0OGdlWU1j?=
 =?utf-8?B?V2s4UDdsR0dGbENYaGp4TjhYSWZmZXc0ZWVkYm4rWGxNd0dMV3ZGWmMrbFpp?=
 =?utf-8?B?eUFCTFVtYjNMdFhqNGQzQUg3RTJOOEl3SlA2OWhXQmVhb0ZoTjVIRmw1MHAr?=
 =?utf-8?B?VjJSQkJscVdzMkhpTTVIMUUzaytpWFRkVmNxblpWRVJZUDNxOGVIeUNBNlQ1?=
 =?utf-8?B?cjBta3ZLUjV6VUNhcFphdjlMTmRpVVMxeW9aRkhhRDVvdDN3WWZlS0NLWWU0?=
 =?utf-8?B?RWozWXRDcS9oUWJhNnV6am1mT3dwMllTdlphOG05cnRuWklYK21ZbmN4YXhx?=
 =?utf-8?B?UHh0ckxZVnRTNWZrQTJpUUNYYlRSUE9sU0pCYUQ3Zk9JU1h0UXd6TWsvY1ox?=
 =?utf-8?B?SkgrYUFRd282MlgyOXQ2elpMc3BDRDNvT05nUXc4VVZ3bmN5bURZYUZockdV?=
 =?utf-8?B?Y3o0Vm80V1ZhVkNVS2dwNkNoTy9iOFJQSGk2RVBMbFk2ZWZlWjVpV09IUG9U?=
 =?utf-8?B?ekIzYVU3STM1SjNyV2hOYUtQNXdDbU9uYm9EYWJsQTRmb1NrcW1MTXFTVTJw?=
 =?utf-8?B?L0cyK0xOcVRrdlk2aGhkR2dPQjh6b3liMHN6YVhoaHpFL1ViTDJsOVp1R0tl?=
 =?utf-8?B?NmxZQWEzYTNjdUM1UUUwZlhQSzJRSjMycXFOdUNJZnJaM3gzcHc5amc2amFp?=
 =?utf-8?B?ZVBmNmV1TTRJTS9GeDhQVEZHbmJ2aGFYblZuQTBTVFVPOVlLZjM0OWIzRXRG?=
 =?utf-8?B?OHh1L1BtVkRrTEExbXdyenNPdjBmT0U3VHRsZWJmMGZiMGw3RzRMTktid3pk?=
 =?utf-8?B?MG05UHV0OTN0WEJtOVgxcmYxbzBRazhOQjRDZzlJT0gvR1JBUTFBcVBoaE1R?=
 =?utf-8?B?aWcwd3JzUWdFeGdNN3laVDNIT0x2QVZmVHNEQXpjTDdGUkJVOVAreWp3dXdw?=
 =?utf-8?B?Um5ucXhvRnNUdFkzNzlxV0g2emFLNTBaL2ZUSlVwTTBucnVuN0hvQU1za2Ft?=
 =?utf-8?B?OWp4VVRFWjc0YUQzNjRRZldQb1duSzVpdWJKbUpkcVNrVzA3MjFWMVdPSXQ1?=
 =?utf-8?B?WnRsRTBEckRlZ090Tmc1NFhtWnJCM0pWWXlLSzJTRkZGaU9UTi94K1Q5bEIr?=
 =?utf-8?B?dXlYWVBqVlNnbTBUaEwxYk4rWDYrYStkRlJsdEpyU25XcWhMNndCZW44N3Js?=
 =?utf-8?B?TXFwZC9Xb2lEdGNGd2ZHU2U4TXJrYTM4SDhTNC9jOTlBUlhid24weG5iaEJ6?=
 =?utf-8?B?MWZCcE1QeWJ3SUVnODBlVFVtTkxXQm5RT2d3Q1RjTmdMa0xSRkdVVmZpMGxY?=
 =?utf-8?B?N0Y5cTZxM1p5UTZIalkzU05Fd1pyNFN2RmhkZXJRVzVaSDh5b3NqSXR6aGFY?=
 =?utf-8?B?dUlEMk8xYjg4cisrb2N5dmlDUnNlRDQyNDZQNUhWNUswN2dwZVI1QW9QSm1U?=
 =?utf-8?B?K1l6Ky8rRG1rM1Z5RzdwTllFM3E0blAwZnJWUWs3eXNqZ0p0TEdiaVFQcUYr?=
 =?utf-8?B?VGJPSHhCNmg1b1YvMlJDSUMxWmdzdjFxaGh3K0lTWWRCUlJsMS9DUzVubHJ5?=
 =?utf-8?B?RGVjM00xSis2RDFRNVRwVk5SZklocU5TRjkwQTJEOXZsdUpGTkdpVFVFb3JH?=
 =?utf-8?B?TjdnTVd4UkEzSWRPZFVhWUFERTNQYTJ6b3JZaXNIdVREUm1UZW1zQ3Z2NTQz?=
 =?utf-8?Q?Z8Y0bU1Cb38GTv8iFf5AlnPHXDiA4n4h?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDM0NGw2eUxsYlVQTk0rNnh0UnZZQTg3RVpLaFBsc2tTU1REUWxoRDFBM3F2?=
 =?utf-8?B?cXNUTTFxamVXYlFKS2ljc284TFNBY3NVSE1vWmN2S01yRk9CYUwzZndmLzl1?=
 =?utf-8?B?cGpCL3NER0p4SGFvTXhZYUh2a0Q3VUZjdlByRFAxQUZkd0xZUzBtZTBvdU1x?=
 =?utf-8?B?cHNNWVFFa3JIem4yWnE4S2MvVXBzbG12eFZRK2Y4cE5PeHdpbU0vVUF4QXBO?=
 =?utf-8?B?YXhkclp3SFRxMzl6b0lyekFsUEFMQmVic2R3ZWN3Z05pUVoxcVRTN3RGc3E2?=
 =?utf-8?B?WDlXTElxOFYrZm56NHlFOCsxS3pwdEd1MjQwUXFxdS9hOHZWL0lUMVlXenNz?=
 =?utf-8?B?aTNKK3E3bmNxMjh1WTQyK1diOHRVL2hVcTB3ZEhueHMvMVEvSVNQR2VYaGM4?=
 =?utf-8?B?RWR0NmY0K21ML25tUmphRUljMVlhRWRpUUtiRjdETTVXY0N1dlJUbEJWV3Vu?=
 =?utf-8?B?ZmswekVML0swVURQSSt0cnkwckdWbk11UndLN2NDeFU3emIrTEtsdmZpaC9t?=
 =?utf-8?B?YkxseWR6QmhXRXZITEE0VG1Udi90Q2dlZXFHUHVhWHpKS1JFWEFBd1BpTDlY?=
 =?utf-8?B?Rkk3L1JRRy8zZmY1c2RKei9oZGdLMzRwbVQ4bmhDUWtlaThVTWV5OGxSWStU?=
 =?utf-8?B?NWpCYWFFZjJDVks0bUJuc0pWOW1MUTJ4V0tucjZjQmhIdmxSODh3K1NuT2pZ?=
 =?utf-8?B?V3ZET2UzK0t6WHBEblBtOVpxZVVLMEtCTVp4WWkyVXIwVlNuTFJlZHpnZm5Q?=
 =?utf-8?B?K21QMmRheUp1eG9kL1ZHUGlsQlFiOWRhRis1RlFvbzZCNFhPdFpETWJIL0pn?=
 =?utf-8?B?L0REYnZkdnlobE8ycldTcFlLTUxOeUJtNmYrUEc5YnFuMXlzV3lsZ24zQWIv?=
 =?utf-8?B?aEJyWDAyOTVUckNZNXB5bEphMTdpalZlWnJVTjdyWUU1czlpZGdhVXh3YmMv?=
 =?utf-8?B?cmR6VlhQRERlREVhQ2o1bytQTmZaRkRORWJySVRuSWprajJaVS9FNEh2SDVx?=
 =?utf-8?B?OEpOOG91MWdTWC9kdFVnTFo0bndrQ3N4ZjRHbHl1TlhacEkrNjRCb2pKYmtq?=
 =?utf-8?B?YTdkbkp5K2xSdHFKK0VZd3pyc1FrVW1sUHlZdG1NQmtvbkgxcitLZkltR2hJ?=
 =?utf-8?B?Y25ORkdyYXNHNHpVUFIyVzFJR2RtWTFNblNuTlQyNkxOUDRTbE5FY3oxeGRL?=
 =?utf-8?B?bjlON2JITzVtYWJjZmc2QmJXQWVJUlRuQmJaMUxVdnpHbmhxalNXTkxMMFdP?=
 =?utf-8?B?N0hpdklNMWRDNmEvMk1DY3l0NHdEQ3RQcTlERklOajN5UHVsd3ZNbldkMktl?=
 =?utf-8?B?V05URy9aa0dXSWlTblI1WngyYzdYSjR1QVVueC9sNW56Yld3NW1zVUg3K0Zt?=
 =?utf-8?B?WmR4TjBnU3QxbGJZcjh0WDZPWGVsUTBVR3I2bTk4K1ZmTVJmMkRDOHFOdVpl?=
 =?utf-8?B?R0x0aG9mUUNoUTNMYjlrMUkzSTFRbzg5Q3oyc0w1Lzk4WTg2UTFmTEVwUXN5?=
 =?utf-8?B?OG9EZEM1ZHZXcER5dEMrYUZCMHROcjFkZDgxUnh2VU9BOFZCV0w0TGEyb05a?=
 =?utf-8?B?WEIvTHg4ckE2YzJWNmJYeVAvTGJ4NjdwTmJpZEJVaXhFWE5UaW9PZzd0ZW4y?=
 =?utf-8?B?aXUxbWEwaEV4VS9mdGlGNEVuMVZNYXJ4d0NkWXk5NzBaTlM5SWdRVXYxVzhz?=
 =?utf-8?B?QllKV21aZHo3UjlHdUhFem85cHBVL1ExdXAwYkg1aWI2ZHVUdm1JazlNVmxQ?=
 =?utf-8?B?T1EyWHBmSk9Rd0FvZ2E4MFBHNXUxSk5uckpnU0Y4UHdtZ0ZIWGptamRFR1B2?=
 =?utf-8?B?aWI4OHZYd0lPdGxLMkVBSWhNNjIvMGo2ZUsySG9YMlBmOU0xTG5UUnVoRDJS?=
 =?utf-8?B?VUlZdXA1ZVdWOGtOeTAyVi9GOS9KRmg1RzFKbDQxbzJUdENWV2NVcERUai81?=
 =?utf-8?B?VnhvaS9VMTUydEk5V2xJaEoyV21kVFBFYW1RcEJqUG51RVdPVGI5dXpyZVMw?=
 =?utf-8?B?YnhVMmtpMWFqck5NY05qT1AweVFNamRVR0pBMk90VTl5RjY0cGVJa0hVNmlx?=
 =?utf-8?B?ZFJSZERqVnhPVTN6cEd1VnlSOGZYWG56bFJySjNqTkYveXd6cXprcXJjdHNW?=
 =?utf-8?B?N01NWHpCOSswNWg4Skd2Y3JucEZOUnlJZzFhcWtFOUJWWEU3azFjUm5tV3Z3?=
 =?utf-8?B?K2haVW9GNWR6V1BmSkpKbG8yVlFmTmNyRFRRTzYyeFdYa25TVWJhQitLaUo3?=
 =?utf-8?B?OTRnMkNGWjRqaENvRnVKbnNCUktpOU4yQVJNbDhnT3luOFR6QklKdkVwRGlj?=
 =?utf-8?B?NHJsRVNBdksxUHlhVmhsZ1h3LzlrSElHQWpXcndDanZ2blFWeUk1M1c0YnFk?=
 =?utf-8?Q?r2v9+J1LL3KPq1Fg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e79f5d99-bb30-481d-cc44-08de52f03917
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 22:08:03.8664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQRr6DaCc45w/WIKJuos5M5JkWOE+U+zqZbUGrk+05/qCHFsMoChKk92131UiB/8DqpmWi6867PEwts0TRzrX1LTvksfZVCt3m6XYISqyPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8437
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



On 1/13/2026 1:18 PM, Maarten Lankhorst wrote:
> Fix all functions that use node->start to use xe_ggtt_node_addr,
> and add ggtt->start to node->start.
> 
> This will make node shifting for SRIOV-VF a one-liner, instead of

SR-IOV VF

> manually changing each GGTT node's base address.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 58 ++++++++++++++++++++++--------------
>  1 file changed, 36 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index cb23d97845a86..4bdd2c94021cd 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -300,7 +300,7 @@ static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
>  {
>  	ggtt->start = start;
>  	ggtt->size = size;
> -	drm_mm_init(&ggtt->mm, start, size);
> +	drm_mm_init(&ggtt->mm, 0, size);
>  }
>  
>  int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
> @@ -402,7 +402,7 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
>  	/* Display may have allocated inside ggtt, so be careful with clearing here */
>  	mutex_lock(&ggtt->lock);
>  	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
> -		xe_ggtt_clear(ggtt, start, end - start);
> +		xe_ggtt_clear(ggtt, ggtt->start + start, end - start);
>  
>  	xe_ggtt_invalidate(ggtt);
>  	mutex_unlock(&ggtt->lock);
> @@ -419,7 +419,7 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
>  
>  	mutex_lock(&ggtt->lock);
>  	if (bound)
> -		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
> +		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), node->base.size);

nit: maybe
		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), xe_ggtt_node_size(node));


>  	drm_mm_remove_node(&node->base);
>  	node->base.size = 0;
>  	mutex_unlock(&ggtt->lock);
> @@ -574,13 +574,13 @@ int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64
>  	lockdep_assert_held(&ggtt->lock);
>  
>  	node->base.color = 0;
> -	node->base.start = start;
> +	node->base.start = start - ggtt->start;

nit: maybe we should add:

	xe_assert(xe, start >= ggtt->start);

>  	node->base.size = end - start;
>  
>  	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
>  
>  	if (xe_tile_WARN(ggtt->tile, err, "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
> -			 node->base.start, node->base.start + node->base.size, ERR_PTR(err)))
> +			 xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + node->base.size, ERR_PTR(err)))
>  		return err;
>  
>  	xe_ggtt_dump_node(ggtt, &node->base, "balloon");
> @@ -771,7 +771,7 @@ static void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
>  	if (XE_WARN_ON(!node))
>  		return;
>  
> -	start = node->base.start;
> +	start = xe_ggtt_node_addr(node);
>  	end = start + xe_bo_size(bo);
>  
>  	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
> @@ -892,6 +892,17 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  	}
>  
>  	mutex_lock(&ggtt->lock);
> +	/*
> +	 * all cases where start < ggtt_start when 0 is passed as argument are
> +	 * set to 0, as negative offsets are invalid.

but all start values < ggtt->start seems to be programming errors
(except start == 0 which is like a "don't care" flag)

so maybe this should be just:

	xe_assert(xe, start >= ggtt->start || !start);
	xe_assert(xe, end >= ggtt->start);

	if (start) {
		start -= ggtt->start;
		end -= ggtt->start;
	}

> +	 */
> +	if (start < ggtt->start)
> +		start = 0;
> +	else
> +		start -= ggtt->start;
> +
> +	end -= ggtt->start;
> +
>  	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
>  					  xe_bo_size(bo), alignment, 0, start, end, 0);
>  	if (err) {
> @@ -1003,16 +1014,17 @@ static u64 xe_encode_vfid_pte(u16 vfid)
>  	return FIELD_PREP(GGTT_PTE_VFID, vfid) | XE_PAGE_PRESENT;
>  }
>  
> -static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vfid)
> +static void xe_ggtt_assign_locked(const struct xe_ggtt_node *node, u16 vfid)
>  {
> -	u64 start = node->start;
> -	u64 size = node->size;
> +	struct xe_ggtt *ggtt = node->ggtt;
> +	u64 start = xe_ggtt_node_addr(node);
> +	u64 size = xe_ggtt_node_size(node);
>  	u64 end = start + size - 1;
>  	u64 pte = xe_encode_vfid_pte(vfid);
>  
>  	lockdep_assert_held(&ggtt->lock);
>  
> -	if (!drm_mm_node_allocated(node))
> +	if (!xe_ggtt_node_allocated(node))

nit: this could be:

	if (!drm_mm_node_allocated(&node->base))

>  		return;
>  
>  	while (start < end) {
> @@ -1034,9 +1046,11 @@ static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct drm_mm_node
>   */
>  void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid)
>  {
> -	mutex_lock(&node->ggtt->lock);
> -	xe_ggtt_assign_locked(node->ggtt, &node->base, vfid);
> -	mutex_unlock(&node->ggtt->lock);
> +	if (!node)
> +		return;

calling xe_ggtt_assign(NULL) is a clear programming error, why do we want to hide it now?

> +
> +	guard(mutex)(&node->ggtt->lock);
> +	xe_ggtt_assign_locked(node, vfid);
>  }
>  
>  /**
> @@ -1058,14 +1072,14 @@ int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size, u16 vfi
>  	if (!node)
>  		return -ENOENT;
>  
> -	guard(mutex)(&node->ggtt->lock);
> +	ggtt = node->ggtt;
> +	guard(mutex)(&ggtt->lock);

nit: nice but unrelated change

>  
>  	if (xe_ggtt_node_pt_size(node) != size)
>  		return -EINVAL;
>  
> -	ggtt = node->ggtt;
> -	start = node->base.start;
> -	end = start + node->base.size - 1;
> +	start = xe_ggtt_node_addr(node);
> +	end = start + xe_ggtt_node_size(node) - 1;
>  
>  	while (start < end) {
>  		pte = ggtt->pt_ops->ggtt_get_pte(ggtt, start);
> @@ -1098,14 +1112,14 @@ int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u
>  	if (!node)
>  		return -ENOENT;
>  
> -	guard(mutex)(&node->ggtt->lock);
> +	ggtt = node->ggtt;
> +	guard(mutex)(&ggtt->lock);

ditto

>  
>  	if (xe_ggtt_node_pt_size(node) != size)
>  		return -EINVAL;
>  
> -	ggtt = node->ggtt;
> -	start = node->base.start;
> -	end = start + node->base.size - 1;
> +	start = xe_ggtt_node_addr(node);
> +	end = start + xe_ggtt_node_size(node) - 1;
>  
>  	while (start < end) {
>  		vfid_pte = u64_replace_bits(*buf++, vfid, GGTT_PTE_VFID);
> @@ -1212,7 +1226,7 @@ u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset)
>   */
>  u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node)
>  {
> -	return node->base.start;
> +	return node->base.start + node->ggtt->start;
>  }
>  
>  /**

