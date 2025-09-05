Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779B8CA0FED
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 20:03:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16EEE10E370;
	Fri,  5 Sep 2025 20:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dro9Pc+x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE9810E370
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 20:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757102621; x=1788638621;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dfQnKqC/4aNP7WvNXvYHhgITdRP/6aEJqG6yukN7x0U=;
 b=dro9Pc+xT4CxEUUZ2EvG2LyTU2RpwtznuW9nwQlb+37wfgbf+/vnDpKE
 ARWn8qzf6avnl1gpFZLPEoN8XP7UFoToQcGrimWMRftZo9Isy9MODCPyv
 uWDNc+n2z/VCHLPnzObNIDs5OUiH9umWJI5mV6NWv11+h8a8FvPl+m9A4
 geHKfGOLNgJkeFMufgfsthnRpengWcQSUMX3P0NYqVYm+vJu0ur5XTE6k
 iV/jzv64sCU+FVY6acgroUT+WblWajq6F1+98/39wRLyAQ6GasWwRUt9l
 LAZWAojsqmMZhzXAcs+dwtHldbDqP2R+JVyQ3C+7gKgTuJHpwdUrf7oH+ w==;
X-CSE-ConnectionGUID: pj3D7BysSaS2ZzxJSGareA==
X-CSE-MsgGUID: jWIfBap3SuOBCuvZFmccOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59397189"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="59397189"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 13:03:40 -0700
X-CSE-ConnectionGUID: MbptKONWRlOSa7UuwrLo+w==
X-CSE-MsgGUID: e2nKM9r1QOCWzUg8hNyB3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="209412259"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 13:03:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 13:03:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 5 Sep 2025 13:03:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.76)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 13:03:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDfBp4qNwyCLoqiAWzd5ogqfF3Jl6sBepodbWlKUoNxzJJbESYIpOmVWMKvfvr8NHfR0nnjMT2t18jVLostRIu02D1RsQlzXyOELuKf0hDfCOurNYxvDOKobzX7Rxw5ahWDtj9cp1FcX5i4O9ISxoj2ibCfuv9t0+pKQppqLbu/T2y43EwBxJVFwWB4aLu/RyTWpGzgbxiDPsUgWf3UM+NY/K2Vj4X1Pl9AX8vOWqgc56NLbhvPhumykpYZf27zqmcleDhVxCasjYMhSZ6Ss8rxBzrgAuAM85XH31LDdq5hqbdb1rjzadjKNPT5spAhk/XTZ/pXmmmzAyyAKYREb2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XlUQZ3GVOv5o07S77afJCEBgIb0IaN37b0cBmKc1UMk=;
 b=zG/xbMAyBcJWt/EdPbelomKmSDsKMuSuwd66c3GIz+9BoSVDmUJq8hPm6c6fkpim5rZkiyXXPlaYfsbm94gzoRJzG9Rd/H4+CVOvgBcVP7ED9fPOoWjGHGQqbGbQTIhsmJNZMMaVe7jZF/nNy9+dS46vfcdaetacPLPRicwqNHlkkhTMqBqtW2HgFKrBERPVyj2RTUeBAb0eMWZkhg/pThoU5WT7g2mKCKW7bX3JZexUiRpaGxqLnPkcDqsKnSt4PMmi6tM5xS/cHUSWrCTPDPKQ0LougNZggk5aje3p8PlQLXWwSm+4un0Z92TD38A00CnmT23U5MArFVhoF3yJOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by CY5PR11MB6282.namprd11.prod.outlook.com (2603:10b6:930:22::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 20:03:37 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.9094.016; Fri, 5 Sep 2025
 20:03:37 +0000
Message-ID: <e505dfe3-19ec-4323-8833-30a5b00efa19@intel.com>
Date: Fri, 5 Sep 2025 13:03:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Move ADS BO realloc to xe_guc_ads code
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20250905143538.7927-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250905143538.7927-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0085.namprd04.prod.outlook.com
 (2603:10b6:303:6b::30) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|CY5PR11MB6282:EE_
X-MS-Office365-Filtering-Correlation-Id: df948f51-63db-4ea3-8f95-08ddecb74cdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjZqMEtWVWVVQXFhMmxHRUpObk1KdmtaL2RQaDM2b3czc2dDdlZmWGdHV3B3?=
 =?utf-8?B?a3N0V2syMmZuMkpBbVJnY3pSL0pzeEpSYnJhSWdwR2kvUTlRRDJqRDlBUXBm?=
 =?utf-8?B?N2lRSWtXZEFzVjhqT1dtYVVLek02bHZQRTlqY2x2a294WlVVaHJ1VVA2eGJ6?=
 =?utf-8?B?OXhwN3hmUzF6WXpRVnc4c2psYUh2T205TnJZaUVJN0lsdXZZSzlaSzlabXlE?=
 =?utf-8?B?UHpYRDFFeU55K2F6QXl5RjRwdEVCdVUveWo3ZVdCVWN2ZDU1NFIrMHpRT2Fa?=
 =?utf-8?B?bWdMNHlIZ0Z3UWt2R3BIekhJeUt0U2lGbEdBYktIb0xEbFJST3VyczFGYm5s?=
 =?utf-8?B?ak44eExzR3BITDA5NDZGTkpmdmFWR0MwbjFhQWhReUpUY0Q4SEZwQzBkbnkw?=
 =?utf-8?B?WVFsc0F0Vk1KeXI2Tmg4NUhHNkhYTjlsLzFqaSt1UXp4WWVicTR6Unh2SWVr?=
 =?utf-8?B?UXorZENzM2VCMmlWU2tGTHlNYjFUcXVHVzFXRTVJVklxdnE2OWR1eW9Wc0lG?=
 =?utf-8?B?dUJqWjhPaXJ1aWh4NDVoTkQvaXpyazZJOGwvbWsyZ1NJR2F6L2FmSVZSV1Vw?=
 =?utf-8?B?T3BuTVp6b2pqd1h1M1U3SWF4aGY1SEJMNDBsOTBQczU2M0FXQ1BTYmVMekdz?=
 =?utf-8?B?ZDZIenQzc21nREhCclViZ3VHSTVjSVJGeHFFeHR2MXBKbHRJd216ZitRc0Fu?=
 =?utf-8?B?ZkpqQ1dPWFBxUjR0cVZyaUtSSTNQUzhtdEFZTTlUT21JdExWWHJiNzd5Nm4r?=
 =?utf-8?B?WnNuOFRNTkoxRVR1U1dGMGlJQzVJQ01kUnRBZVhseGhZWEVZd2l2bE04OGJZ?=
 =?utf-8?B?Q2xsYWI4VWdjcFM0ZUJMZjlRN0Y3SnAyS2tQSjBZcDdKeG5oU25jdGpIMnhV?=
 =?utf-8?B?anQ4UUtLOXBibFhIWE5GUHdrdlB1N0NzMzI0K3pYMnBSZDhxaWZTK1FDUERI?=
 =?utf-8?B?cWFNcWJBRTNxVGNpSlRwZjFsR0srbWZERUFYc2N2OTgxWktQcnNhMUN4SU40?=
 =?utf-8?B?R1lCQjBLR0JrbE9STFF5N2h1d2VWeHpMNVB5ZnVhMVFHWEVMTkZRTVFTK3A4?=
 =?utf-8?B?N0EzaFgzUG9ZZFZLWWVZZXlRaHdJOW5mNEl2WUZxL0JIaWlucFloOS9BZmxh?=
 =?utf-8?B?NDBWeEdiaDNpbU1Ub3FaQjJ2aGxzRSs2R0N0aW9NSXgwcC9ueThJWE1vRWs0?=
 =?utf-8?B?bG5MZWFKWG1wNGE1R3F6K0pXczhNT0FzY0NSMmhwYXBUcmVabGZwMnhtVkJ4?=
 =?utf-8?B?c3pPbUM3cVZuV1dPSEcxdCszNCtaMkpLSWRKU0ZrME5yZ0dYZ09wOGl2amt3?=
 =?utf-8?B?Um81K1hGZEMwdmdmeHE0MlRXZ29Wa3I3OWRjY3J2WDdDTllOUjlNa25MQko4?=
 =?utf-8?B?SnhsZVA4V3BiUkxoT3hJYjIrWjBKcHczU3ZQSUtZTkhnVDB6clJlenNjaS81?=
 =?utf-8?B?TE9hMW1YQXJVNFBGeHcrWnNZU3NWdzZBZDBuSSt1UmFDelkzU0t4cFpZSEJ4?=
 =?utf-8?B?cmVKY0cxTEVHYnNXYm5QWjduNVE4dDNUay9iMWgzR3ZOYms1bTl5d1lScnFn?=
 =?utf-8?B?Ky9pYzRWVzEwWEY0L285VVh3YnpWdlg3NmIyTmdtWno4UEhVM3h0VUk4Mm5x?=
 =?utf-8?B?alQvOUVrUitrdHBadjhhdkNKeXJ5aHVnUmFSYTlkY2pDUWg4WnJtb2hXRHlm?=
 =?utf-8?B?Y0xhODc3T284d2d1ZWxjMmk5dnlDc2RqWkRwaDhmUnBzb1daSnd3UllZam4z?=
 =?utf-8?B?RlBkaEhvNVJlbXRES3dyWjhxOW5Ud1RBRldUbVN4bjJTS2JDN09UZzlvSGZn?=
 =?utf-8?B?aUFKcFJTRncwY0laZHNXTUdCSHl3NHJRZndraG1QNWpib05Kcm56Mms4Z1Jq?=
 =?utf-8?B?aTViQ3lMOUdaT0traWNGVWRDeUFPTlVZK2tkYmdWd0I3Q0Y4V3pkRVMrV213?=
 =?utf-8?Q?bQPR2Q7EEGU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEN4MndnQW0zU2ZwRjQ0RHN3NDZjUE9sSjl1a3JERk5QQW9GVzBNODgvVjJ4?=
 =?utf-8?B?MEgwSzNaWkR0L2FIWGluTE5rRHpYUTI2ZWsrRjVNcXYycXRNbVAvZEY5eU9t?=
 =?utf-8?B?V01QWG4zT1BtVGxWQkdJT3VVeWd5Zkh2dGxiSks1bWlud3FKVXVyZUlLcEJW?=
 =?utf-8?B?S0YrbXlQOTd2N3Zxd09iNTJNS2tQd2ZKdXptWDBDcmRhV1FZNnQ4SWVSanpp?=
 =?utf-8?B?RTdiSXpPUStCL001R3VDb3BvRUxNNG5aMXBHKzhoLzRpT2R0NHZQTWpvNE1q?=
 =?utf-8?B?ek1uNllvdVpHQTlITkl0RWNuMzB5bFJVbnQ0d1dLZUxKUXEwM1lkajBkK2sy?=
 =?utf-8?B?dFJxWXE3RndySFFvR1dOVHZCL3RQVHVxZ05jVFFZT3B3OXgvcHVVVTM3cmV4?=
 =?utf-8?B?M1FJNFEyY29BZ21MUHYzOTh3Vkl4eVBDMjVGWUs5aWp0YTdBTU9KZ3Y1ZmYv?=
 =?utf-8?B?bTFJVUdYSU43NkgwY2NPKzZMckJ3d2haTkpRVkpaZ0FWVHBuMHZrVGd2emJS?=
 =?utf-8?B?SnpIa054bnRuUHNRVEpLOERseXpseWtCOTJCb2ZlWWRLa2tMTE85SzgzbHJL?=
 =?utf-8?B?Nk9tazlUODg4cjNHd0pURWQ5QUFjcVZoa1hKTW9TWERoL2JXZnBOUlVjWEFM?=
 =?utf-8?B?U3F2RnEzNXZDTVJWc0hzcFlVTnhFTTRhUVk0dmFzMGNKL2JIaUpqOFJIbHRJ?=
 =?utf-8?B?MExBY1luRXdKaFVBZDFCbzRLMEROcnM1aHg5MWJDWTltbjRrNmFPaDAybmpB?=
 =?utf-8?B?Y0VvaDYxNFNyclRMN0piSGgxREdlUGxuWTRKbVE3aWV2TllxaWNSWktxSHFY?=
 =?utf-8?B?UkUyQ05rOFh4SHMvUFhtR0t5TnFydkYxNk5xaWlaME1lSTlhZU9wQUppUXg3?=
 =?utf-8?B?czJVQkJLQzZtN3FmYzlDOHB0NVNGbVQvZnlMWTZuVDZ6eEthbFB1VmFHMDZ5?=
 =?utf-8?B?VFRPSHZHTjRaejNOYjN0TnZiOTVLSUxLd09oU1k2MkEyb0pPcUk3K0NTdnVt?=
 =?utf-8?B?V0VGMmFTcGtRTERISnpWOTNhRndEVlFIbFBmY1J2QjZxMDlGNFVTRCtEeUVl?=
 =?utf-8?B?Y1FuZVI2R2ZRN0Jod1kwNFFPampQTmVKMGdXRFBNNk0wUHZIb1FmVXF5a3hj?=
 =?utf-8?B?b2ozeXpHaDhlWnVXcU14M0xWZkJPTmVaREJvcTFhQ1VuR2wxeVovdXRMdkdl?=
 =?utf-8?B?SW9SQmsxOWw2MEI4aE9tVFZaQnhOMWVPVEZ2SzNEbUlwSlB6MnBYUkxUZGY3?=
 =?utf-8?B?UTZpci9ld0JWTmhnR3g2OUg4YTZTUHplNWF0TjJteWg5UWllblRUSDNhYmxE?=
 =?utf-8?B?OG1qdWNDRkg4MFhqelY0WVk1ZXJ5cDJ2TzNtUytZZmFRZU50V2tyTlJ4Umt5?=
 =?utf-8?B?c1ZHZnJCTDhCR1dQWmdqSG5IVlEzazJkT1ZsVmxqTHVueG16ZDN6UXpweW5a?=
 =?utf-8?B?b2YzQlZGUFNoVUJTZlVRSEVKZzVYMDRmWThzWi8rZFBWNkQ2UEl6OVRXS21B?=
 =?utf-8?B?ZENVN2JGYUQ3TnhuTTJ2Rmozc0w1Vjlvd242YmpHV2Q4M0lWdGs2VDJPaVcy?=
 =?utf-8?B?Qm9mRkRNaDFQQmZRRE14WTlnV0dORG9IdGRCRHJrOVF1dVNMa0xPdjJaWkcw?=
 =?utf-8?B?T3ZRTXVaQ1ZWWEx4c09ydVJrem4xR3A5L1RKVGdESEJyQS9ib1BjamN6WEdB?=
 =?utf-8?B?TUs5bmNmUVlKbHJTNGpER0NkNXpXZzlWNlI2bThhYXZUWkVydkZreXVaUXZD?=
 =?utf-8?B?LzJyYjd2YkJ4OWhaOStDS0ZubEhsVC9Rd2liK2pxS0FCMSs3UlBGMkNGR2Ux?=
 =?utf-8?B?RnFSUndYYmZrUVF5UmVMZ1FFQTg3SS9mK0ptQVM1MFp2SXdOUkU0N3lzZUd2?=
 =?utf-8?B?UlQrVjM0TCtsYVhrZFJKZGZQbVpZQmduVkdsOGV1ckJ5QTVnb3NQRjg1WEZQ?=
 =?utf-8?B?OEVBN0VGVEptZ1grMU9QMllseEJ4NkdtaFNPV2FYY0ZPWm4rakVKK0luRFVu?=
 =?utf-8?B?RGFtQkNHZ2tXbjI3YzkwZ2EwZzNOVEx3N0I2VlFTZkpDa3g1VGxhd3VzK2ZP?=
 =?utf-8?B?S1lramZmWlFNQmIxQ1A4S3RmS0VTRkVvTjQ0SW5XS3Uya0xhY1RUOXFLT2N5?=
 =?utf-8?B?eWxhSktEMitmTWNTYmZ3d2Rqa1RrT1lOVWhnOXdIeEFpWm42TFQ3dzJlMFhW?=
 =?utf-8?B?V1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df948f51-63db-4ea3-8f95-08ddecb74cdf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 20:03:37.1137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5Aid/bT0FCPvDij8ns2HYIh6xLDI8T5DsRG1GAi8B2jyiwAAj61q0Iak2HvE1F/RPqywLOfb+foLdxXJtEsofnGNQiERf0vUp9m5ljPCaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6282
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

On 9/5/2025 7:35 AM, Michal Wajdeczko wrote:
> We already have dedicated GuC ADS function that is called during
> the post_hwconfig step. Move ADS BO reallocation there to have all
> of ADS BO management together. Note that since any BO reinit must
> be done prior to the point where we prepare GuC boot params, as
> those include BO offsets, we have to move up call to ADS function.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c     | 10 +++++-----
>   drivers/gpu/drm/xe/xe_guc_ads.c |  8 ++++++++
>   2 files changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index b3a6408a5760..a62c483c9d88 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -705,10 +705,6 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
>   	if (ret)
>   		return ret;
>   
> -	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ads.bo);
> -	if (ret)
> -		return ret;
> -
But the sole purpose of 'xe_guc_realloc_post_hwconfig' is to do the 
re-init in VRAM for all GuC objects. Why split the ADS object out and 
then have to re-order other things to cope. This is the sensible place 
for it to happen.

John.


>   	return 0;
>   }
>   
> @@ -847,6 +843,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>   	if (ret)
>   		return ret;
>   
> +	ret = xe_guc_ads_init_post_hwconfig(&guc->ads);
> +	if (ret)
> +		return ret;
> +
>   	guc_init_params_post_hwconfig(guc);
>   
>   	ret = xe_guc_submit_init(guc, ~0);
> @@ -869,7 +869,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>   	if (ret)
>   		return ret;
>   
> -	return xe_guc_ads_init_post_hwconfig(&guc->ads);
> +	return 0;
>   }
>   
>   int xe_guc_post_load_init(struct xe_guc *guc)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 5631722f34f5..fc2c37ca9dbc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -424,11 +424,19 @@ ALLOW_ERROR_INJECTION(xe_guc_ads_init, ERRNO); /* See xe_pci_probe() */
>    */
>   int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
>   {
> +	struct xe_device *xe = ads_to_xe(ads);
>   	struct xe_gt *gt = ads_to_gt(ads);
>   	u32 prev_regset_size = ads->regset_size;
> +	int ret;
>   
>   	xe_gt_assert(gt, ads->bo);
>   
> +	if (IS_DGFX(xe)) {
> +		ret = xe_managed_bo_reinit_in_vram(xe, gt->tile, &ads->bo);
> +		if (ret)
> +			return ret;
> +	}
> +
>   	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>   	/* Calculate Capture size with worst size */
>   	ads->capture_size = xe_guc_capture_ads_input_worst_size(ads_to_guc(ads));

