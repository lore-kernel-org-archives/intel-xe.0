Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D820CED245
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 22:04:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6F910E1D1;
	Mon,  7 Oct 2024 22:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h6yG2NP5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3AE10E1D1
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 22:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728338655; x=1759874655;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=Nr3gcCDsS8orWeMKt9/lCacKg9tlA8dJ21cQEqhS4D4=;
 b=h6yG2NP5w7Bee1k+/IsAPN3G/WS+pT6fCJrfHyyDeG/amfin50aejlUh
 8gWRlLYrRkScfUiu6rNpSjmfpCeHCVXlQYP0PWqVasOC8nQ69Xk/mzBFL
 DqxvH+ZY8taNOdhwkxL7Ce0ksZUGiRBTrCnRLk6z+ymZmn26v6RoMOR+L
 z96yaUow+uapUAaeQMyn7q+FqoVsb6SAuNOc+XwDUZ9zyOP2SWXuh+nbN
 wtiQ3n/Pr6pNN1VfO0PfXFGRtssQi98FD9BSn6R0Mk3cGOkKWcPw9KUGb
 hckKkBudB4Vk7+HQL50uPrJN+AaC3YmGZfJij/65sueT7ThwStZHhO/Ut Q==;
X-CSE-ConnectionGUID: tRAacXOlRhmyXQf8nYcNEA==
X-CSE-MsgGUID: 3ahY4VJ2RmKHLbvgDbuM+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27644518"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="27644518"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 15:04:14 -0700
X-CSE-ConnectionGUID: EH7jILqbTf6KQTqTVIF0Kg==
X-CSE-MsgGUID: XG/G17ZyQYO3X4yVpttw1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="80438741"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 15:04:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 15:04:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 15:04:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 15:04:13 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 15:04:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbm6BCXXPhRp3weKdqLm32Wf/AEnJr5lBwD36rWPmoA0wORDGlpc1u7zZ4oeYFjcJb8LeX2Lao3NT/xS+bHWO1e5IiLdOTzTzXtC9+3KlyehDEeEf6Rrypyv6FnfgoQlFKF4YLHp4bYeHyDLNHTrYFTtgnCra3L0cz+DmUIuwQOVrlCjSHWLGWGBxLeFoXrVg90QX4Wucfzv869o82BJfzGfzGS2jMuHm7IawRH04GmItfjvveg7SL7njI88sAe1hRoXtw5kA2TgCv9SlaMOMYKa8oyiib3T8YidRLVDePzNY7m4syRFKaiKKdCJYBQqj4emfFd12I4BuiLW9xLlHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jmnpu1WHoz3+CEiaxtvaQYWi4sh/OOcHWfQDWfdliBc=;
 b=GrP2V3QA+HoIAz6F5wNP/E/fjjmqw3s9RgnrC0zl+luXl/YQp/q+ScxHvHfRRvZx4wg7dhzAwUSPrD/w83DZdwJnBrIUN/0ZNcVWlDwOLVQT5ttcmzAY5kI3SabaVaZjdB4NPwlWiFDSqBF4d49vqH5Ve/s4muI7THHS6DxuJMPGb+bxGATpURKGQLaLNAWZDWDd1mLQnIqVeQY3bAKgiiURMCqQ+xPtHXu+V7oWpEZzz6kwJoHx43eNErykM4ZzabijXOqQRgCL11UDHDkFY7OHf6ncbN5EcWopEgCCzyFoDvjVunKk3QjehWrtFaGmzXk3OkuyNIaY+FWPkvK0eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ2PR11MB7598.namprd11.prod.outlook.com (2603:10b6:a03:4c6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Mon, 7 Oct
 2024 22:04:02 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 22:04:02 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241004220550.94308-7-matthew.s.atwood@intel.com>
References: <20241004220550.94308-1-matthew.s.atwood@intel.com>
 <20241004220550.94308-7-matthew.s.atwood@intel.com>
Subject: Re: [PATCH 6/6] drm/xe/xe3lpm: Add new "instance0" steering table
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, Matt Atwood
 <matthew.s.atwood@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Mon, 7 Oct 2024 19:03:56 -0300
Message-ID: <172833863650.72557.6452803043621054900@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR03CA0295.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::30) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ2PR11MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f31b2dc-6aab-42a0-12ca-08dce71bf3d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|16122699012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wk9FMzVCUE9qWVVLMll5MWhXSGt0K3orQW9RT2FrSTc0VUVYTWgyNGZhdFY2?=
 =?utf-8?B?d0o2blVVNkVobzZzMng1S2VqWG9nQzd2UkZxZDRkclNpWVFGazdwSHJwZFhU?=
 =?utf-8?B?R2svbDR1SllCUnkzaDc2UWkzWkFzc2kzOXlBRzIySFpOSjk2RFY3eE1PVE11?=
 =?utf-8?B?MGx6bXdCT0kxbkt0UUpqcHRTUExGOERYeXd1eWxJRFNOTGhjL2plRXZxUklE?=
 =?utf-8?B?ekJ5Sm1zdEM2bHlTdlZJNUxPeWIrMXJwLzI2cXlrK2tzS2ExR1A1bVNjNkFD?=
 =?utf-8?B?dWJIOHFUS29HUjhvWDNqNTFPVVhUNnVzWS9yWTVpMHVlUXBlYnQweVdsc0VF?=
 =?utf-8?B?aUpmQ3Z0VU1kVTl0S1hRUlQ3OU5LSkVsVFRhSWFBbnFyQ0ZjNFl1TDl2UjRp?=
 =?utf-8?B?K2dvTnJRd2ZzMXZuSlpFZDgvMTB2UjYxTFovcG1PUlNQZGY1bHlsZUsxZWRO?=
 =?utf-8?B?bXYxaTBoK2RhcVBFT0Q5ZUg4KzdjY05ucHoyN3pMTlNmWmUxSG03NHUxRGNV?=
 =?utf-8?B?MUZ6b2ZQYnJhV3NKa1pDRlFBNWloZDMrSGlDR1F6d2RZOG9LTXhEbmNsYnFQ?=
 =?utf-8?B?TnR2QWlPRVpQVlhXdkIvcWZSNElWOUNjNjdZbVZlUjRvVGE3UnN2MVRENW5p?=
 =?utf-8?B?NjJIRm5HNCtGU0VQTFlDMEk5alVmKzRuN1BLS01DdEkxTEx1cVFtcnZKVDIy?=
 =?utf-8?B?Zzg3Y0RKb1M1YlFNMnJHeXlUOUlidzNTd0x2em13eFRKWEZmdCtCSDN4cEZj?=
 =?utf-8?B?cGxhQ2QyMGwwaDd0amNBYUxUOGlKZUF0UmhFelhpM29Ncjd2REpNa3NRcGxO?=
 =?utf-8?B?dksvWFZ6czVETmlnSGhjRUJVbWRNZW9sUFNZaDBQd0pCZ1VwNzg0YjVDSlJz?=
 =?utf-8?B?SUZvbXpTQnNXaVoxWGY0ZXo2cStyM29Mc2tsNExFZHBmeHdydHFyTjVQNlNC?=
 =?utf-8?B?MU1CY29mNTB4Q1ZIRjVuLy9ZdlJZUzMyNlY5bzFtQ3pKcytXNVFIOVRiMUV2?=
 =?utf-8?B?REt3STcxSGtJdE83YngxRHI3VGV5TUpuYzdvV1VtQmxNdnVKbUNnZDYva0hQ?=
 =?utf-8?B?V08ycXFyZXFwckVJZzBPT0lvbG5DeDVsTXdSMit4RFhjWjhUYkVOaVZoSUZX?=
 =?utf-8?B?YVZuTHo2OWVmNzRadVE3WldybzZHL1ZWWDFwK2o4UjlTNTlPbWNXVnFnREMr?=
 =?utf-8?B?VDVoZHF1cEJPbEpubnN1bFIvbWxzaWxDckhWbWFDSVRnbHdkTE9EVGFzRDBr?=
 =?utf-8?B?cm5OWmFzeTg5b0RTRmtLYkp5a2xIaG5hZHFMSDlPazlzR21aRmt6K1BZTS9x?=
 =?utf-8?B?RG0wTHV0U3dhaTcvS1dmdmU3bmp6aEVTcVd2MVRoQjdXQ0ZwR3JRWTAyM2lG?=
 =?utf-8?B?U0VEMkZwYWErWFdzL0JJc1ZWWjBQSzB0Mlh0TWprY3RBbEdneTZKM2ZKQy84?=
 =?utf-8?B?MDNYbDRiZHF2MDIzTHgzY3RKSXM5MTFkdmlyVGdtNGdqSUdzRFdUSGdyMGZE?=
 =?utf-8?B?Qnc2SEF1NERpNE1BZDdMS080TU9ScytEVG9GYTdHaWpLUWIrUmNMb1k0Nis2?=
 =?utf-8?B?Nzluck5wR1JpS1lXc0JxdmdTSmNEa2hPbmZsMTJTekxzVXFhSkRwd004UlBD?=
 =?utf-8?B?TlA5MDU1OEFxWml0cnZ0QzdCNlE2ekhsd0Z4eU54TjRlRDg2MzluWnkxOEkr?=
 =?utf-8?B?MkYwbWxVdXRHQU1RV0ZZNkhvTE1Bd0JSVkdDdEVXaUo5ekh5UkRieERFcytq?=
 =?utf-8?B?ekczUmN3alpnOG5pUzg3TCtSTlNNdG4vNGVYWjNZTkM3U0FrUWxSU1ZMTFEv?=
 =?utf-8?B?aEJkTzA2djgrdy9tZ2xMZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(16122699012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUhtSDdnQ1JIU01MVWFadUwyQlgvT2hiMzdGVjg1c0Q5THA0YVdxMjlxUHhi?=
 =?utf-8?B?MXYrU29iUlk2YTgyQk8yOTdMY0xDc3pzSVZmUU1HcXBaK0FiaFNHTnFzQkov?=
 =?utf-8?B?U2Ivbk1BUW5FYmZzbGk2d0ZjZmE5MEo0aE9NNDlDaWNIbDVxMTljOGpzaURp?=
 =?utf-8?B?KytFNUdmY0FXMmh6bWJCSzhhdXdlMkprbnFpcFI3L3JabXF4Uy9WNFNkdzR1?=
 =?utf-8?B?WHlhMGUzT3JkME80Vmt3a04vbEk1L2Zyd3NKcTdRQnl1LzNQRExjVTVDVzNG?=
 =?utf-8?B?TzNublphellLUWtOQkZQelNBdkdmdnp6cENCdXBVcUE5UHlkMVlZNSt6Z1Bq?=
 =?utf-8?B?dWpPVDhnbEFBQ2lOakgyTUZuYVdMV0J4S3pOYW93OFVMRjdaSlIwaXo4NUI4?=
 =?utf-8?B?cld5V3hvSWpxV3VGSVVPdVhIM0R1bE1mV2pEMlJZcTBxU2pKalU0TlUzcWlB?=
 =?utf-8?B?eThrRVlqNjhFdERUSnNlcStrdk5xU3cwL0haQk9IV3BPb2RwaEVoeHhNaHlE?=
 =?utf-8?B?ZTFUZldMaTFuSTJJblNXR291eFUyaEIzTTJiQUZURHdJbEl1NFZLcVFsMG9C?=
 =?utf-8?B?dGRnZGpzY1J6WG1IVERjcmxndnBYNmhMZk1zK1pGTU5ta0lrMFkxZU0weHBW?=
 =?utf-8?B?dXFyUVpvTG1CK05nTzd4ZnMwbGVOK21neElTQzZyUk9rWE1pdkZaQlVCQVg0?=
 =?utf-8?B?cVZoRTdRaGU1eEtML0ZmNVBLVWt6MDBVKytsbWNyLzUzcW94S2JwK0ZPcWU4?=
 =?utf-8?B?K0pmNy9BZjJjZnZ2Ynp1eHVHUk1JeEFTLzBzcWNkR2F3NExEUW14aUdJYk45?=
 =?utf-8?B?ZFAyS2NjR2ptK0toZEdhN0VYS1pIV1k0alVZNW53OHc0QmhCWVFYaWN3V1J4?=
 =?utf-8?B?YWR2VUN0M3Y1NTVYZ0hMYjRlTk4vU3NYSFlWQ3hoUmhOdVVITFBlTEZxV1dU?=
 =?utf-8?B?UVJMY3lnMGlyOVl5RXFJK1B1NUl5VWlRdGEwRlM3Tjg1OFFwZ28zbnRsK25E?=
 =?utf-8?B?Um52dVFLWlV0UXFTWE1wYWthaVg3Y0t1V1JySFRuUDRwUDhORFhialZHbGto?=
 =?utf-8?B?MXpGUGdtZDVQdXloRXBuQ2IvVk9QeG9PMmxvamQyck95U3NTUkpxbHJ3VjVE?=
 =?utf-8?B?WE5wMDBtRExHUG1kMG5jazhmaWQvYnVEdU01VGFZVHdQWlNjb0NwV0t5emR0?=
 =?utf-8?B?M1JMNVFqYkxsS09QVXFQUnYvUDJoZ2tlSHV0aXM0QnRxMUh6cmJJUHVycnIz?=
 =?utf-8?B?eDZvdE1zRThjMlIrTnJvcVR6OWhYL0dBcVpkSi9NTHlKRnJjV09lWlZSMFJo?=
 =?utf-8?B?eFJRUUlBSm9UU2VBUTN6eEJxelJnSGZGUWgrQXJhaGJLNlQvcER0ek4xSStD?=
 =?utf-8?B?NG5UZDRoV3R0cXJYOGFySTQ1dWpDWUgwNFJyRUpsL3I1ZzRKV2Q4b3RabnMy?=
 =?utf-8?B?RXl5UFd3NGRQeGttak1BZjczMmlEeXE2WUZDSC9TVVVmWnQ2dW1uYlc2QVB3?=
 =?utf-8?B?TUJTcjkyRWVVczVSUTNMbElDVVhmaVNHcE1nYm1iSHMzQ3BkbnNqMHl6ZUh6?=
 =?utf-8?B?NlVMOHJyTnpsQjYyaEhlVys1d3R1TXBMQjAzdjVaWGtwc0xHSGwzeFh2L0VN?=
 =?utf-8?B?cDZOZUFCaTRZbnpMU1IwMlVxVWRnaWROdnpZRG5ydmppZDhaNU1PbWFHMzRt?=
 =?utf-8?B?WWpjR2Y5eE5DMGpRQW9uUWVKY1pEOWtPOWlFSVZKNXk5N2FFaEE4Rk5ucDhW?=
 =?utf-8?B?bmlSTFpSNWpOa1Vqa2JQODlCaXp2bERvdndscmtWSWc5ZktoZ0xBL2NxWEhO?=
 =?utf-8?B?eCtiSXhPWnA3Z0ZsbXIzVlIrSndaU3EvZFVpVm1hNFNtQUwvbEZtOERubFpO?=
 =?utf-8?B?SHRqMmNiZTR3SG1NK0dtZEpKc1kxU3RiRlVSV09LRzg3aEM5RlBGaXYyT1FK?=
 =?utf-8?B?UHFTVnY4dGxqb2VGVjdDUTVJc3FyU3pUYklPeFc3RE5LNW1qSzhNTlBGdzQy?=
 =?utf-8?B?T1VlTVl2cTNwcE4zOGp0SW5WbmFKQVpCeU5xa1E1NW9hZU4vV0VhTU8ydjJk?=
 =?utf-8?B?SjFHTUFnT1pxSjZPM0g4YjB3a2ZEVUp0UjdtQysyL1RqYVZZUFBBbVFtQkF4?=
 =?utf-8?B?RldpK1F4M29PQy95SkxXaEE3M2grQ2hrN05DQ2htY1loMDRuQmNyS3hwdGR2?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f31b2dc-6aab-42a0-12ca-08dce71bf3d5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 22:04:02.1805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zy8wvl/o7ZT+VyoL5uhRJt/wc432E50kIaQUwR/PmMqYU6aYLeGEqU1jzCSxbqHGyjtGHM4zQITg/ROa/T9mEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7598
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

Quoting Matt Atwood (2024-10-04 19:05:50-03:00)
>From: Matt Roper <matthew.d.roper@intel.com>
>
>MCR steering on Xe3 media IP is almost the same as it was on Xe2, except
>for one new range (0x38D0D0 - 0x38D0FF) which has changed to an MCR
>"MEDIAINF" range on Xe3.  Since we can always steer to to grpid /
>instanceid 0 for MEDIAINF ranges, define a new "INSTANCE0" steering
>table for Xe3 media.  Xe3 can continue to use the same OADDRM/GPMXMT
>table as Xe2.
>
>Bspec: 74298
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_mcr.c | 17 ++++++++++++++++-
> 1 file changed, 16 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr=
.c
>index 4c0767403881..2f2fb84b4e58 100644
>--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>@@ -237,6 +237,18 @@ static const struct xe_mmio_range xe2lpm_instance0_st=
eering_table[] =3D {
>         {},
> };
>=20
>+static const struct xe_mmio_range xe3lpm_instance0_steering_table[] =3D {
>+        { 0x384000, 0x3847DF },         /* GAM, rsvd, GAM */
>+        { 0x384900, 0x384AFF },         /* GAM */
>+        { 0x389560, 0x3895FF },         /* MEDIAINF */
>+        { 0x38B600, 0x38B8FF },         /* L3BANK */
>+        { 0x38C800, 0x38D07F },         /* GAM, MEDIAINF */
>+        { 0x38D0D0, 0x38D0FF },                /* MEDIAINF */
>+        { 0x38F000, 0x38F0FF },         /* GAM */

Looks like [0x38D0D0:0x38D0FF] and [0x38F000:0x38F0FF] could be
merged into a single entry here. In other words:

    { 0x38D0D0, 0x38F0FF }, /* MEDIAINF, GAM */

With that,

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>+        { 0x393C00, 0x393C7F },         /* MEDIAINF */
>+        {},
>+};
>+
> static void init_steering_l3bank(struct xe_gt *gt)
> {
>         struct xe_mmio *mmio =3D &gt->mmio;
>@@ -441,7 +453,10 @@ void xe_gt_mcr_init(struct xe_gt *gt)
>         if (gt->info.type =3D=3D XE_GT_TYPE_MEDIA) {
>                 drm_WARN_ON(&xe->drm, MEDIA_VER(xe) < 13);
>=20
>-                if (MEDIA_VERx100(xe) >=3D 1301) {
>+                if (MEDIA_VER(xe) >=3D 30) {
>+                        gt->steering[OADDRM].ranges =3D xe2lpm_gpmxmt_ste=
ering_table;
>+                        gt->steering[INSTANCE0].ranges =3D xe3lpm_instanc=
e0_steering_table;
>+                } else if (MEDIA_VERx100(xe) >=3D 1301) {
>                         gt->steering[OADDRM].ranges =3D xe2lpm_gpmxmt_ste=
ering_table;
>                         gt->steering[INSTANCE0].ranges =3D xe2lpm_instanc=
e0_steering_table;
>                 } else {
>--=20
>2.45.0
>
