Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7994FCAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 09:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE9510E2F8;
	Mon,  6 Oct 2025 09:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MAF/gMcX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B46E10E2F8
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 09:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759742413; x=1791278413;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FowQJFcvXtZxyQAoH38AZfj1n9TSjOIYgUh9LDqdCss=;
 b=MAF/gMcXIV6y6ycLuYTwAWevVfiUBZ4JJjW7MbICLvbcnE6cadze9z9S
 rJKaej7lP/vyclxVadXyaBpYpg4B2YmOIfny2aYbLWSo3P6p86heDFlBl
 aPpz50gtTANL/9zRwGTnNH+HPkZTMhyXGAu/a0X//V+efX9/nJcm28kgo
 fVuaeZnZj0hkA6wYdJmfQsS4ByjHpSxwYx6BS3nDHTivLPY87lKs2iFid
 U0gq6hWpC3FYJ3pLIiyki4lhLyVBdyEDJy//V1EzoQAgpOo1u2WeRgJST
 lcKf+cEZH3LszCM+ZW2hSw/+xQ6UG237UWDFyUE5F8JTCPDIzaqifZpny w==;
X-CSE-ConnectionGUID: KEvDTcr8QQ+LUkbqStdNDw==
X-CSE-MsgGUID: 9qxwflVcQKeBcLVuhqTiFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="65560122"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="65560122"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 02:20:12 -0700
X-CSE-ConnectionGUID: Eg6ZSrbnTli0voJCC96J5w==
X-CSE-MsgGUID: 2D798NRiTUi13pyQK4JVSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="180259008"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 02:20:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 02:20:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 02:20:11 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 02:20:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NDocxAgAhk+RD48DWc25g2AXzNBxaSB4jwAK6nBbdpU3R8XYSFb23d50rgipP0aUy6ce6URGmO6IYQtOs+WpvBdi96LBK5Dj3xVpiqVmUNVlyG/CG6tcDioeGrn7OQW8clCRS+30ie+OlhWqPSKDSuekUSAMkAwteo2NYlU0yi1xYKnsS8yEW8RrSqWbqp1vkABjp+IqxcaBG6r07AFiKolXJSKWELivjMZ9DzZTVp31v6L7HRehsivWHfX0ZzbPTTDwzxFIW4LWGsNumXUKOLgIvTmTI0jUoVMTceb/2oGHPyhbLWVyBozvCR9xWN7XlbC32Ium1bG67GJza4kgOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FowQJFcvXtZxyQAoH38AZfj1n9TSjOIYgUh9LDqdCss=;
 b=CUgaiXs/STTvSn3m2IdUyKke4ynh9HkYK9cxYeZajjcZRtfg+44FRM3I66sYrbbu7TkHQLTZOgvhR1FOJ1AvXSuTpJvobMsQDHAUulRjeXvTbuDJQ6mw3UkC3hGjcBOgGrBY5WSH5FVi+pWnqDk/Ng2jZd5LTTAgJzb6d9fcAgPhyc95w0y7nbJhUGMvm7XFONfFuzhSgWUM0LerBlfYnC70qfc0covotD4CxYRdnYARB52Y+omWN4NZUIytVQMbXNNTLTrXUrROfl3lfNRhhr8KPOne5RlHavD+OSIlDYTa82MhdI6wp9rqyQnn2hnfReLIJftItvmuBvUz2/l+9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8987.namprd11.prod.outlook.com (2603:10b6:208:574::18)
 by MW4PR11MB6571.namprd11.prod.outlook.com (2603:10b6:303:1e2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 09:19:59 +0000
Received: from IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e]) by IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e%6]) with mapi id 15.20.9137.018; Mon, 6 Oct 2025
 09:19:59 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Subject: RE: [PATCH] drm/xe: Fix copyright and function naming in
 xe_ttm_vram_mgr
Thread-Topic: [PATCH] drm/xe: Fix copyright and function naming in
 xe_ttm_vram_mgr
Thread-Index: AQHcNMLMj79bKaTx10WuSIWvDqwUELS02dOg
Date: Mon, 6 Oct 2025 09:19:59 +0000
Message-ID: <IA3PR11MB89874C1D695708E22C0C525CD0E3A@IA3PR11MB8987.namprd11.prod.outlook.com>
References: <20251004000425.2489291-2-shuicheng.lin@intel.com>
In-Reply-To: <20251004000425.2489291-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8987:EE_|MW4PR11MB6571:EE_
x-ms-office365-filtering-correlation-id: 9f1f6b4b-5008-4239-fcfb-08de04b985fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?ekVrYzZPOXdmQk5MOFJJdkxMcS9oUG1OMDM0ZXl6OU1JWmNSM2pJbGpIWFFz?=
 =?utf-8?B?cm4yZ3VqM1dzRmMxaVEwVnJhNlpyV3ArTmJNKzYxRXNUOFB6bk9mdytzYTBB?=
 =?utf-8?B?VTFqWlptZVJ0Z3JtUndTamlRNE4rQ2RHcTJaSVV3YWY4WHp1SDVoV0dqSmpO?=
 =?utf-8?B?MnlKQTA3WVNkRWFHWlJlc0RrQ1lVYVRoeGl1YnZvbk11am1pWmR5S0Rwd2ZZ?=
 =?utf-8?B?dFhSdFNaOFE4K09zNEVGbzQ3blZqTXNnS0hMcEhJQjFWZUR2WEp6ZjVPTHNa?=
 =?utf-8?B?NlhNKzhUTlluM2ZoY2RGdXBtek9HTm9Pd3ozWGRnNU50cy82NEVvc2duZHFv?=
 =?utf-8?B?M0VwZk9lbHF6M3JBZXVnS29HRlIxcG9pbzlHQmh1eEVBV3dJd0RRRUl0aUlN?=
 =?utf-8?B?RUIrcHQ2dCtjaVVDVEozZk9OUDhQcjlXQldJQU5yNnlmOW8weldwOWFPdTE1?=
 =?utf-8?B?RGJScFRybU11RTZjTFBYMFJKeGoweitQZWJLN1F2NjR5WDFKREdnUkMzZkxn?=
 =?utf-8?B?N0tmQlVtL09CdnluR2JFb1ZwTnlBa2F3RFlhYmE5SWt5T0VHNUNtUnlqOGJx?=
 =?utf-8?B?Z3hpN0NlTVJvL1NtaW16Wm5ES3hRMzhsa0lRUnRqV0xsSTFjV1RseVZKUDJq?=
 =?utf-8?B?VGs1eXN5NmQ4UXIvYS91MGx5b1dVc1drYTZRUnc2U3VPR1F3OGpiaEtxeXpZ?=
 =?utf-8?B?eWs3R0UwajFxVzhiRWNlSmVVR1BLSnk1L1NuZlYxMVYycXBsdUhNY1k5Rkox?=
 =?utf-8?B?MFVZQnhxejFyNjUwVjl6dGVLdkhlL3k2NFlsZ0ZRLy9qTzFlOGZGYis0TEZq?=
 =?utf-8?B?NmNPelA4bzY4Wm5sM0hwVHJ3Zjk2Z2w2Nmp0T053UEluZ2Z1UmUwL0ZCMi94?=
 =?utf-8?B?V0VjaExTUG50NFBIb21QeFVwWjdkT3A1VjlrV0lQNFk1RXEzckZUd0c3cWhp?=
 =?utf-8?B?WGQ4dW1QcTZoT3Q4Mkk2Q3lMZjI1Rkk5dU5vQVFMTks0Z1BycFMrNlIvdGxp?=
 =?utf-8?B?WXo0VWdhSnd5eHJObWFLdnM3WU0rSTBmR1c5WTRzeUxVbDZQYUlwdjU2aEpY?=
 =?utf-8?B?eTJzSDBpUlZYOHFFSlJmVEVEZjRvQk54eHI5U085VFFrcTFjcEtSaDhoZ3NB?=
 =?utf-8?B?TXZFU1ZhSDY2Mm41VmNWQ3ZicGlGTlhxMjF3eVpUaHYzdExNRHlQR0dKaEc3?=
 =?utf-8?B?QW01U0Nyd040WXFUMmxHRzExdUErWGpVQXozTUVzZWVXK0ZFYzFvUVY4aVk3?=
 =?utf-8?B?NVR1RW9ldlN5eC9xTjBib3NZMW4wR2Z5K2dLdXBaY2RVOFR1RlRSVnFuMHZw?=
 =?utf-8?B?SGY5NmVBYUpZQmlycFNJMEFKU0xYVXhTSnZ1Qlh1RisrSzB0Y25WMUo2d0FB?=
 =?utf-8?B?MnExUk9mSnFsWlYzbGN2ZU40SVpmbXorQWRFMjlGWWZOZm9RMjcwdUZ4Yy9w?=
 =?utf-8?B?Q1kvQkVNSXZuVWdvOFdaVnhwTFlvWjBoUmNJUFE2L0hEY3o3K1EwRVRlK2dw?=
 =?utf-8?B?c0hYbzY0WlE3bndQb1pJM2tIWFlwb1NZeW9qYXM2elFObjduM2s4ZHAwNXp5?=
 =?utf-8?B?Z0V0cU1sMThtMGZBc2RLWEFCcHZZUENKUDBQTHhwdkZDV2pzUHJtZHZwNEFh?=
 =?utf-8?B?WlZHYkNDZjJieVhPVlNpRXFxZk5pNnJFY01OS1R4R0c3OTJBcUxHWFduZjRL?=
 =?utf-8?B?dkNMeHB0UDFhT1RHcVBKVllPSHJyMVZyb0JUUW5tV1Q4NTJkdlh2eEliUS9P?=
 =?utf-8?B?SGNRM29sV0U0TDkyR0E2ek00eXpWRXJCSEoyS05NNC9UeXpFRlBpWFkzTk1X?=
 =?utf-8?B?SXFncGF2Sm1GL3RUbHpsbzIzMTc1SlBieUdhb2lkQkdjUHdZS1NZeTI2WUQ4?=
 =?utf-8?B?dksxNm41L1JTOWpMTXNmaUVFaVl0b2hXdnRqNWJqdWsxU0FTZzVjYXdXN2o1?=
 =?utf-8?B?WTEzUUZCcE1nOWsrQ1NCKy9nYWNPL3R3aUwyeGM5emZHY1lyaitYeVkxRmcr?=
 =?utf-8?B?OXhlOXE4MVdJZDhIcVV5Q2EwM3RvVlhpSkN6Y0d2bnF0c3F1Znp5WUFPYXl0?=
 =?utf-8?Q?ZdnGsU?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWhxSDBINXkzZ0c3c1BrWVkxSVo5MVVta1JpSGVoTGNIL0t4SGQ0ajVWTnpH?=
 =?utf-8?B?dG5FSk80WDVJV3Q3QS82OHgvNzd0V2hOaURJSGZONmlBQVBMN0VpRHkzSlpr?=
 =?utf-8?B?TnMzcGczOHVxTzVoekFnSDAwdlZFa1QrUlJlL2xoTGdQbkpvdXA1cmtiM0JI?=
 =?utf-8?B?T0tjR1k0RFFEYmxRSkR6YW9YUzhybGR4WUVSUVBhTkVpeE1ySmhsQWdvZkpk?=
 =?utf-8?B?YUZJOUI0N2lTSklaZzQwZ3RGUVNRYUZlOVcrQ3lVS0h3clJBUjROMTF2OXZn?=
 =?utf-8?B?U1NldWJGdXYzRjVKR2xlb2pTYjZmWmUwM2ZHN2owSWY5am5uNWpRZmI1TXFq?=
 =?utf-8?B?NS8vWFM2d29oMDRZWnNGZlVQUlFlaEUxRk1JYXZqNHNFN2tKUnF4VWJqd3B2?=
 =?utf-8?B?MExlVURUMXJnTnhIOFlCN2FOUWtRRk9jVUZtd1JUUFZ4K21uVWJBMkdXOEZV?=
 =?utf-8?B?QjZSSmZIZkJxMzdqTzQva2RtV2xuK3JPbkZRMjVZMXUzTjF0WE5SUXkxdjhH?=
 =?utf-8?B?WUJ2TCsvcC81aDNSV2FwMWo0NGNUb3VEOXdMeEY0QjZaMHZYdm5HRGdBZy9O?=
 =?utf-8?B?V0syaGdoWjByOGdMR0hJL1NLM3JodGN3N25EUzV4bkZmQjNKeTRaVkFSajN3?=
 =?utf-8?B?ZkRxOVZiUFlkY3JiWjg1aTRYeFFtNkxZWVdLc3ZGSGxyQ2lrUVRaZ2hhZXBI?=
 =?utf-8?B?MmovakZoejQ5aHZ0U0pwblFiN1BRbG83VW0xWE9jNm96VllHbElZaDd4MGNU?=
 =?utf-8?B?ZDBRN1RwYjZUeFhhYWI5ZFZLY1N5cy8zOWhWdWZvTXZmWjk0a2o2YmV3OUpt?=
 =?utf-8?B?amJNci8xWVprSVBnd1hUWnRBRHU5dVhIek9PZGJsaDREQ3NINERFZEx2WVJj?=
 =?utf-8?B?VTNkSUVXVGM1TW5GMVFiSmFyUDlwb2lVUGEyQkpNSGNkWVdidTE2c2FBSGd1?=
 =?utf-8?B?WG9jMUUzbm9pUFh2WGJLbE1KZWVTY2RFbFcvd2RWK1ovWStmbmxvMmxaQmEz?=
 =?utf-8?B?SXUyWjVSSVRLRERyOXlOOGFySU9IeDdzM25vRTVsK0RqSi9CSkkwazhIdnFN?=
 =?utf-8?B?OEpMM2tpZWpWbEZrcXRxdzZlckprOFRqdS9ERWZseG5VYU9nMDYxM20rRXR2?=
 =?utf-8?B?RVpuM2UxNGVxTUgvMHpWRXN5VmpIeFZhTDNtOEtrWUJaM2tpMGNvME1rMFlp?=
 =?utf-8?B?UHEwZzUxRk9VWU9KczZRcjBrZ25jdkpSbUpLd1ZNQW9uQlN3K2oxL1d2SCsr?=
 =?utf-8?B?eDF0aWM1YlN3ci9qTlk5a2gxUk9OUXZRYytBbFY1azhlMDZ3QURhRVBpdzNa?=
 =?utf-8?B?RndNV2pteWNlcG5DZCtIVEIzeVREN3RMMitGQXdZUEloZXFaN2FxOVlpVmxl?=
 =?utf-8?B?Unptblh6N05aV2lVS3NzUDJvenhYV2g1NTlUVG42WjJhd3hpOHN0NXpyZzNB?=
 =?utf-8?B?eUtnWXI3RzdWZ09yRUVISm1RTjJxdStnNFFaUHpEQU9JZEUySUxnOTl5U2p6?=
 =?utf-8?B?TldITXFZM2dpN2NBeG8wMit4ZCtqaU5OYW9GeHl1bHlHMUtLTnVQRDFObzVK?=
 =?utf-8?B?emN0NVQwUG1GcnpJdE43ejUxK3pOODBmR3NHaFJUN2hiOG5Zc1F3YnVhRm5D?=
 =?utf-8?B?UFhFbzNENm9FZ2ZudHBSajBDWm9xd3pBeXgyQ3QrTXExMDhEZEhJaTVaMldz?=
 =?utf-8?B?SFFSUElVV0FyNXFMeEVzQlZMaTBmK3BMZVkzVExuNnNIMjczdHFJL09XR1pF?=
 =?utf-8?B?eVRwZEFCcFBGNjdKSy84Ymh4MXk4TkhVOTUyR0M4V1R2a3NSUlV4RW1xM0l3?=
 =?utf-8?B?ZUxBR1I2cHY0MGh6R3dTaUc3dXA0TjcrUHV6Z0xZayszREZQMWdPeCtJREEw?=
 =?utf-8?B?Y1N5WFZtbklrVXd6M2JMUEpPWmE0N3BsS28rZ3lzYnpmYzlwK1R1ZVJZc2FP?=
 =?utf-8?B?V09qQWl3cXVxRExXS1p0WHBTRkRXcTIyZzF5elUzdEVjbEExVGdUYWdIZHFI?=
 =?utf-8?B?M0VLbU9naTVPeVJ0NFBoZ1Y0Vnk4QUIxN2V6Tk0wOSswWTJRUFpyeGtTdnFO?=
 =?utf-8?B?anpSaVhjRnA1UGUyeXRpc2R1am5pTXZ3V3J6dGxwNi9XaDBDQkNXb1dBLzJ3?=
 =?utf-8?Q?Mx6sKElqbgmDAjwS4noCBA7sl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1f6b4b-5008-4239-fcfb-08de04b985fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2025 09:19:59.6201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rko+qcu6jCfJikQgWT0Zw9Z04APgoCjpu2nONoUTmTqTgLCgXbbJuCvNYVOYeCwTqeB+VKI5WXhDOPAgqRQkEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6571
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC14ZSA8aW50ZWwteGUt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBTaHVpY2hlbmcNCj4g
TGluDQo+IFNlbnQ6IFNhdHVyZGF5LCBPY3RvYmVyIDQsIDIwMjUgNTozNCBBTQ0KPiBUbzogaW50
ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBMaW4sIFNodWljaGVuZyA8c2h1aWNo
ZW5nLmxpbkBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL3hlOiBGaXggY29weXJp
Z2h0IGFuZCBmdW5jdGlvbiBuYW1pbmcgaW4geGVfdHRtX3ZyYW1fbWdyDQo+IA0KPiAtIENvcnJl
Y3QgY29weXJpZ2h0IHllYXIgZnJvbSAiMjAwMiIgdG8gIjIwMjIiLg0KPiAtIFJlbmFtZSB0dG1f
dnJhbV9tZ3JfZmluaSgpIHRvIHhlX3R0bV92cmFtX21ncl9maW5pKCkgdG8gYXZvaWQNCj4gICBj
b25mdXNpb24gd2l0aCBnZW5lcmljIFRUTSBoZWxwZXJzLg0KPiANCj4gTm8gZnVuY3Rpb25hbCBj
aGFuZ2VzIGludGVuZGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2h1aWNoZW5nIExpbiA8c2h1
aWNoZW5nLmxpbkBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0
bV92cmFtX21nci5jIHwgNiArKystLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3R0bV92cmFtX21nci5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0bV92cmFtX21n
ci5jDQo+IGluZGV4IDkxNzViNGEyMjE0Yi4uOWY3MDgwMmZjZTkyIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX3ZyYW1fbWdyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3R0bV92cmFtX21nci5jDQo+IEBAIC0xLDcgKzEsNyBAQA0KPiAgLy8gU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IE1JVA0KPiAgLyoNCj4gICAqIENvcHlyaWdodCDCqSAyMDIxLTIw
MjIgSW50ZWwgQ29ycG9yYXRpb24NCj4gLSAqIENvcHlyaWdodCAoQykgMjAyMS0yMDAyIFJlZCBI
YXQNCj4gKyAqIENvcHlyaWdodCAoQykgMjAyMS0yMDIyIFJlZCBIYXQNCj4gICAqLw0KPiANCj4g
ICNpbmNsdWRlIDxkcm0vZHJtX21hbmFnZWQuaD4NCj4gQEAgLTI4NCw3ICsyODQsNyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IHR0bV9yZXNvdXJjZV9tYW5hZ2VyX2Z1bmMNCj4geGVfdHRtX3ZyYW1f
bWdyX2Z1bmMgPSB7DQo+ICAJLmRlYnVnCT0geGVfdHRtX3ZyYW1fbWdyX2RlYnVnDQo+ICB9Ow0K
PiANCj4gLXN0YXRpYyB2b2lkIHR0bV92cmFtX21ncl9maW5pKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsIHZvaWQgKmFyZykNCj4gK3N0YXRpYyB2b2lkIHhlX3R0bV92cmFtX21ncl9maW5pKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmFyZykNCj4gIHsNCj4gIAlzdHJ1Y3QgeGVfZGV2aWNl
ICp4ZSA9IHRvX3hlX2RldmljZShkZXYpOw0KPiAgCXN0cnVjdCB4ZV90dG1fdnJhbV9tZ3IgKm1n
ciA9IGFyZzsNCj4gQEAgLTMzNSw3ICszMzUsNyBAQCBpbnQgX194ZV90dG1fdnJhbV9tZ3JfaW5p
dChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0DQo+IHhlX3R0bV92cmFtX21nciAqbWdyLA0K
PiAgCXR0bV9zZXRfZHJpdmVyX21hbmFnZXIoJnhlLT50dG0sIG1lbV90eXBlLCAmbWdyLT5tYW5h
Z2VyKTsNCj4gIAl0dG1fcmVzb3VyY2VfbWFuYWdlcl9zZXRfdXNlZCgmbWdyLT5tYW5hZ2VyLCB0
cnVlKTsNCj4gDQo+IC0JcmV0dXJuIGRybW1fYWRkX2FjdGlvbl9vcl9yZXNldCgmeGUtPmRybSwg
dHRtX3ZyYW1fbWdyX2ZpbmksIG1ncik7DQo+ICsJcmV0dXJuIGRybW1fYWRkX2FjdGlvbl9vcl9y
ZXNldCgmeGUtPmRybSwgeGVfdHRtX3ZyYW1fbWdyX2ZpbmksDQo+IG1ncik7DQoNCkxHVE0sDQpS
ZXZpZXdlZC1ieTogTml0aW4gR290ZSA8bml0aW4uci5nb3RlQGludGVsLmNvbT4NCg0KTml0aW4N
Cj4gIH0NCj4gDQo+ICAvKioNCj4gLS0NCj4gMi40OS4wDQoNCg==
