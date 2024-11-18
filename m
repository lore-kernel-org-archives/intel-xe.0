Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDD5D60CF8
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 23:32:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C6810E190;
	Mon, 18 Nov 2024 23:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lVE3lyCf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7750B10E040
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Nov 2024 23:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731972757; x=1763508757;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HAQRlt42GwhUNi/7rfgaE/xj+o2QJsAN3XU2BI4HfQQ=;
 b=lVE3lyCfgPie/1PSH/q5OjPH1tgLFhhhGjXTsUkfybSVMxiSKzFCVeNm
 +aq+vUPuzmynltg1EOqNI0b8eHrwe93U13q/0U+x8CWHcAV0iXxLfB8yJ
 Rl5wlAHdvRFXbk4FuQraFxu1LxYIsQqrYhtcVj79GVD+8tzQHGok8RCv4
 DTfBLqBP05R7olWoQ0OEDuZlrj0bzOg0L6ayrF6OiuidcmjdYAu9p2GC0
 M0VQYiv7ohCOdVUHK0EEHvo47Ttcs70l9369UWANI/ks2EQMUlRQNrywl
 WBuFH/MuZBDY4jeFxfLNCredbRQmvDXJcwzG2WX44BGq84zaVjr1gIW+T A==;
X-CSE-ConnectionGUID: pLj7SdZIRVGcn4nXHz+lOg==
X-CSE-MsgGUID: OfiI39rlREqaxQNM1E6cTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31325273"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31325273"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:32:37 -0800
X-CSE-ConnectionGUID: dbtvnEBTReKbShq+U+nM7w==
X-CSE-MsgGUID: pmlxGX9WSgqto3QvacReQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="126906060"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 15:32:37 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 15:32:36 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 15:32:36 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 15:32:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbudQW1mEyF93tFBtjVTYfRo3g9AxyjInfugcUCsSigRfQf7iStS0Z/MJYrpdw9yABhGUoGbsPTJ2pjQpKnCDlXi/W3BvRbQ3PkV6V2fg/shzRp8benAJelDhxKK4SXMfutKIqsakriKOgsHuR3cQyIkjZv5h7O/xzy2sRZP9J9SQkdwQiIpcZuV6rXUV00CPGy+b1UoLy7tsM8CHCIifP0zzFK9Wu0DWwNcTVpw/iAmxt8mBh9SkpgmKzfij1OZPhc8kMYYmHuJSaPcPRw1FwxnUBR1thexEVMh7YEitZcptd9v+K+jbrUWvSb5ESkSk+SSaPzINDFPgKzwfGrAsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgd+L5hEA1TWMd3qMD2f7pceUBbV7nPK7ioDh0uS9ic=;
 b=n7iLturxWDPnl8GUKwoaxQkjTdXoJvK+rHWNEXzBTcNo9qwsia0bLqWj7zFk/joDvsVHSrxqGh8vUcwYjdPieBUsqZnEPKDud1B9WYgREDjtn7fPerbKXIUZnP27i7eIdYL7dVCt301QLUfNj9azRjJE8zvmpOoj/95jmUau7dGBhDSEaYNZcUf8657319X5XbEzcPYhaeDcvyvR0YA/jIYDfOh28tUFN9nmV8yYLUXzMuQhgIcvuJNUKj39caBg17u+1z/bgLhdPlStD10i9GajSP/ychVKhdONk/MV5zBaDAqcufKzSPuBc9IG4f030fnSNzwvOCX8KlY2FHZvbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB6673.namprd11.prod.outlook.com (2603:10b6:510:1ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Mon, 18 Nov
 2024 23:32:33 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8158.021; Mon, 18 Nov 2024
 23:32:33 +0000
Date: Mon, 18 Nov 2024 15:32:31 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <vinay.belgaumkar@intel.com>,
 <aravind.iddamsetty@intel.com>, <john.c.harrison@intel.com>,
 <ashutosh.dixit@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH 6/7] drm/xe/guc: Expose engine busyness only for
 supported GuC version
Message-ID: <ZzvOj3lFfaGnL0/K@orsosgc001>
References: <20241113045549.2390980-1-riana.tauro@intel.com>
 <20241113045549.2390980-7-riana.tauro@intel.com>
 <ZzaR7I1G+kuu/SCx@orsosgc001>
 <8ceea4a6-96d2-432d-8375-73d968d068c4@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ceea4a6-96d2-432d-8375-73d968d068c4@intel.com>
X-ClientProxiedBy: MW2PR2101CA0003.namprd21.prod.outlook.com
 (2603:10b6:302:1::16) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: ae7a3a31-2121-40ee-26d6-08dd08294707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTJMazdvVk1yNWgwc1hHdDlIT2tzS3hkaU1mMS8yV0xzLzhFRkNNNDhJaTZT?=
 =?utf-8?B?bEsxb0wxbDUzQ2lLc0N3d3lkeGNZbEc5elJWNUdSMzNhR2NKU0wzdVJrVHN2?=
 =?utf-8?B?cTgrMFNGUEJnUWRUM3pnVktEaStoTXpFYU85SFpza0JKUG54UVBlQ01makRz?=
 =?utf-8?B?Uks5cS9GaGY0cEFCZnVpMkFabEdSbVNEL0JKUTBVQzMzT3EwekdHRmRLMVZU?=
 =?utf-8?B?L0hBMUxkVlVEK3NJMGdNUU1UeVR6bEl3OHRIMEJlQWtpNDljOEpCL25sbzEv?=
 =?utf-8?B?QTd6V1YrazFtTFcvSFZlSld6enVvM2VNOXlnQmd2azcxQmhqaU9zU1l6V1RH?=
 =?utf-8?B?SjBJeGNJdkVDMkFDVHVFbzdHcjVlSnVSVkdMc3o0U1dCTU85OVZmR3gxZ0tM?=
 =?utf-8?B?VEhaVGEvelRDYVJwcUZDRzVmWlUrMi9SUlNneTBDR1ZWSm5yTzFMNHU1MWdX?=
 =?utf-8?B?QzFFTmRnNmhWS0ZaY2pkVkpjWDIxdHFzMmZkdW42Z0ZtN0o0Titoa25SUmJT?=
 =?utf-8?B?Z09WM3BLQkZIUG55R1hKc2wrcWpDZ3B3bWxuQnhGWnFaTGlmQVE1SVRlQ21T?=
 =?utf-8?B?MmZXVU4rT2Nmb01WUnA3WWI0OXR3eEVheTlvSXFhTTdUcmdQaW5lMmRUL1Rp?=
 =?utf-8?B?TFJISHM3S2N1YnF2eEFFZkZiTTFCcHk4MTR6MFR5YWNodFUvMGdFeHowTUVZ?=
 =?utf-8?B?QVVLV3ovWTBFdVhUNCtxNSt6OEJQbzFmdTBqWk9WNFpDSm95alNmVVpJZW9m?=
 =?utf-8?B?SUtyOXVrL2lxRFRLc3VheUVDdmMxNmhoY3NCRVFvYmdJdEJKMmh1UWk4cmFp?=
 =?utf-8?B?TDI0Vm9UOHRQUmxLbjd3dW96YmhGMmk0Z1YwNC8rMWdaeXpDVS9XSDlxN0NZ?=
 =?utf-8?B?YTVMbDF1b0EyeTN2ZjN1a0YwOUsrSU4zazVSM1poWnI4NW9yTGpRQ1hFQldT?=
 =?utf-8?B?c2ZOSFZwMUVNRHBENEpUNWhEa212QVNNYmtuYXA1TFlSc1A0cC9EUzZrbFpT?=
 =?utf-8?B?VkFhS1lYNHZIRjNmUzhxLytuWFJ2cCtVcTlKcldSdXYxNi9wTWVOYy9YaFVk?=
 =?utf-8?B?a3I5T2d5TnV4eTk1NXlvZzFCaTkyR0FCQjVBR1k5ZnN0NWlxemdFQVlEVWxB?=
 =?utf-8?B?VFJGcHVrSVVjTHRJMGw5SU9xVGwyYWcrOVpCd0RaTnhFajNmblI3dTFuK1U0?=
 =?utf-8?B?UHdTUTZhQ2hxSXBJVnA1c2pOL3dBM3RvS1IwSk5DRVVRUXFhRlpCWWNiSGVE?=
 =?utf-8?B?YjBwdW5IWGdNWUlCZVg1SkladnVWTXZhNHQ2R1RERTBXbk45WnhZaVV2YkFM?=
 =?utf-8?B?ZWtjNk5sRzBzdElsaFJwanV0dWtWem9BUHQ3Z1hLMHI2ckhMZERHNktaK2Er?=
 =?utf-8?B?KzMwTk5tVmx1WmpIM2h4ZkFjOTJvaldhS08rNVQzdDY5L0U5ZDkwaXMxMndv?=
 =?utf-8?B?Mm9ZQ3p1UW1mVnZhaGRPZUcyWk9GMWxaREhPbDNsNlhPQmx0U3NydnhrN0JH?=
 =?utf-8?B?TU9HeHNrYjV4WDdTS0Z5ZUVuemdXLzVzNHQ3K3NZNXBZVm1Dcmc5VGJwWC94?=
 =?utf-8?B?dUY3OTI0RmxvSE5mNHUwVjRlWWxoWVpVWmRTcFBKWWk4NE5VY3gra1ZxZDNw?=
 =?utf-8?B?SG0rR0ZUOHBYZlVPRHVrcjRqcmtJaXpiWnZMZ3pocjltWklKdlY4YXM5UWRl?=
 =?utf-8?B?VzZJRGlTa0NSVElZcG85bTdCemcyNG1vd3ZMbFM1ZnB2c2VCWFBsdjduRjZY?=
 =?utf-8?Q?3SHSlyFsjZXRMrV8oNpcHp/2d0E3id7XqRd1L45?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnpkVnZHNldRRkxjcUtKNHRJbE10emNTSGgrOUM3UXhYb3lPcVNFUUNnSE0r?=
 =?utf-8?B?VUNremdZOUR3VnJSRGprTEJ1UjBYY0NKV3B1ZEtPcm1Uc08rUVdlTDcydGp1?=
 =?utf-8?B?dzRjVlBJUytWSVh4WGJYSXpTMHhVRWVOMmxUdTdsemQ2eWF3SXd3eW1mMjVz?=
 =?utf-8?B?NEt5cXNFZnlrYkwzR1ZSMWljUVlsbGo5MnNvRjJyaWlVcW5oazFkU1kvckVm?=
 =?utf-8?B?bk1Sa3Zwc0dYbzdBU2pneGtESEE2WHdTS2c3ZHlYUzdWYjZRVmxiVFNJem5Y?=
 =?utf-8?B?WC83RnZqUVFsb3FlN2NCV2IrN0JOYUpoMDNDSE5kYWkyRmZaTnBHNzF0b2JK?=
 =?utf-8?B?eXNXMDRKZ2lhc1lmeGZZbWtxYkh6TTkyNW1ZN2VSOHhNNzhsZThxUTJjWUFF?=
 =?utf-8?B?YmNaalhnblNhN1duVWJqeGZ5dUM1MTVpNENyZ2lDNzF0aXRlLzZMSmZSeTNX?=
 =?utf-8?B?Z2FhM3NNc0E3QzRMR0RHanhySG1FYjc2azNmenZnVTNabHlRcDBwbnFiNmNr?=
 =?utf-8?B?dXVGNy8rL2RISzBzZVB1bGlyTzJhYldwVlJlRVArYTBOM0R2Vmk3WDBGS1ho?=
 =?utf-8?B?SEUrTFBxODhVeXhZcVFCcERWMEQyaWJIRGhNdnl6S0hQS1BwWDZWUi9QRUhl?=
 =?utf-8?B?bEoyeGdXUUlvOHhBaUlwVit0c0wvMHdEdHJkSDJqWjJhTVN0allNbzR4cFYy?=
 =?utf-8?B?NDJiQ3l2bU9HN0wzblZWbGV2MGtSNFZYeDhDV2R1ODFIYVpUK2Z2N3VGWDVU?=
 =?utf-8?B?Z2J3N2UvWUNNOWhTeUtpT3Y5OCtqV2k0N0ptcXRTeElFcENPVXRBVGJZa1Vz?=
 =?utf-8?B?a2Zhbk9qUHFKa3o5WGlsMDdnSDBwRDlNSXI5TDVSckJrOXNseDFGZWt6d3F4?=
 =?utf-8?B?UjNCTmIxMTl1SWZacER4cDk2STNuWXBmaUJDa3pRWW9KVFBIblBMRXRIWHE2?=
 =?utf-8?B?Rko1elBqamVXdFI0Ui8xRFV2UHlxMmNnV2M2ZzdrVWxVSU8wTEI1WnliSVlw?=
 =?utf-8?B?aFpkQ1A5TGtsQTZPMlRpOU1VTkhOQTJMSkovcEp2KzM1ZTBUaEFOQVdmeHZn?=
 =?utf-8?B?NWZvWUxsOU4zNDFRY0lyRHNkLzFLSENtVkRBWDVHd05JOTdHVkRhdHZqNS9N?=
 =?utf-8?B?MnBPdFBOQlRqK1QrTUpmUGZoUFhtYlg5T1daYVJ4NFFSbVdBdFpYOXRVekY0?=
 =?utf-8?B?ZVlHcmdaaU9tRXFFZXFpMy8ySjdZeWt1MmZaWFlUb1VsRStQU2ZEbExwRkN6?=
 =?utf-8?B?QXZOaWtBTEhpT2Q0b3RpQkJyNTI0MjRsQ1NiMVFkUnBDOHBZVWpUS0o2eWtQ?=
 =?utf-8?B?MGhRZ2gyR0ZMeXNWZlQ0d21UOC9DTUt4TUdBT091ZlVJRU0wZXNFeHVsTTRs?=
 =?utf-8?B?LzVJOGc5Y0dBTmU0ZnkzeGJrcWc0UXVscXZRSlhWVlJtdUYrZ3V5RS9ZMWdE?=
 =?utf-8?B?MEJsU2RkOVBOK00xVUxZcTZGMXlZWTFyNWFFM05KQ3UyZVlMeXpxOU9jemhT?=
 =?utf-8?B?ZmpveElSL0dYb0VFZURkbDFoZ3F4Z1V4cVdkSHFKL1ptemozekwwcEluZk5p?=
 =?utf-8?B?eHpCd21rb0xHSzFGWUhpWUNObG1ZT1R5ZWw0TTN4a0oxVW9CbHJWTlhmUDNX?=
 =?utf-8?B?cEU4RFpRc0lvczNqUi8yMnlRK2JlUnpuKzU2MmdBU0xWcWVmWUhiKzM2NENn?=
 =?utf-8?B?TlRudnpRU0xrc3FyZmV4Y3FrNVMyTFJrbVAzVFJlMFVzbHhHVmtTRVR6ZEU0?=
 =?utf-8?B?YXkweG1COHk2SXJNOW4wbUZkWm14OGI5ZjNSaFBXbCs3a0xVQ1JmdldCM1Qw?=
 =?utf-8?B?SkhJKy9OVENEaFdnQlRpOE1WeWxjWjB0eHpNUGlNVW5tcDNma0ZIZFZhL3F2?=
 =?utf-8?B?RnkzNnRMc2piR09YSWNnR1I0VFlrL3VZSjNZUUJOUmVWSGNxM0V5bnFqTWtB?=
 =?utf-8?B?TWFBL25GNy94R1pRSmkxaTRjejRJcWRSRXpobWNtSmhjMDlUUFJaVElQUDRh?=
 =?utf-8?B?OGdNaWpUb3VGV3JhUnNjWFFpWHQ1a1M5cUh5T01GUkF6REFrcnowdG1EZHZL?=
 =?utf-8?B?ZkNWYTk2eVVLZ0o1YnREMVJNY0tDUnNhU0dFZEZWRy8rZGpUazVRMmVJbnZT?=
 =?utf-8?B?ejkwbk5OV051MXM4STNBSDRRa2pmb2JIVmdRdVZzdHhURklVM3kvTGc4clVs?=
 =?utf-8?Q?PjJOFMJ19dknuxzvYZTPZiY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae7a3a31-2121-40ee-26d6-08dd08294707
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 23:32:33.7003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vBpi2u8j3U5uYhL0pcm7651mUYOPdAIUfo97aSzjrrjsrKwqabosUa0RxXMbYnPXJZVyF1AFvMVZWaVi9swZUPDN4LAq4vYcuNqEdHBfsxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6673
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

On Mon, Nov 18, 2024 at 01:07:32PM +0530, Riana Tauro wrote:
>Hi Umesh
>
>On 11/15/2024 5:42 AM, Umesh Nerlige Ramappa wrote:
>>On Wed, Nov 13, 2024 at 10:25:48AM +0530, Riana Tauro wrote:
>>>Engine busyness is supported only on GuC versions >= 70.32.0
>>>Allow enabling/reading engine busyness only on supported
>>>GuC versions. Warn once if not supported.
>>>
>>>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_engine_activity.c | 22 ++++++++++++++++++++++
>>>1 file changed, 22 insertions(+)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_engine_activity.c 
>>>b/drivers/gpu/ drm/xe/xe_engine_activity.c
>>>index 7a2ae09d23de..fc34dcf3057a 100644
>>>--- a/drivers/gpu/drm/xe/xe_engine_activity.c
>>>+++ b/drivers/gpu/drm/xe/xe_engine_activity.c
>>>@@ -236,6 +236,16 @@ static u32 gpm_timestamp_shift(struct xe_gt *gt)
>>>    return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
>>>}
>>>
>>>+static bool guc_engine_activity_supported(struct xe_guc *guc)
>>>+{
>>>+    if (GUC_FIRMWARE_VER(guc) >= MAKE_GUC_VER(70, 32, 0))
>>>+        return true;
>>>+
>>>+    drm_WARN_ON_ONCE(&guc_to_xe(guc)->drm,
>>>+             "Engine busyness not supported in this GuC version\n");
>>>+    return false;
>>>+}
>>>+
>>>/**
>>> * xe_engine_activity_get_active_ticks - Get engine active ticks
>>> * @hwe: The hw_engine object
>>>@@ -246,6 +256,9 @@ u64 xe_engine_activity_get_active_ticks(struct 
>>>xe_hw_engine *hwe)
>>>{
>>>    struct xe_guc *guc =  &hwe->gt->uc.guc;
>>>
>>>+    if (!guc_engine_activity_supported(guc))
>>>+        return 0;
>>>+
>>>    return get_engine_active_ticks(guc, hwe);
>>>}
>>>
>>>@@ -259,6 +272,9 @@ u64 xe_engine_activity_get_total_ticks(struct 
>>>xe_hw_engine *hwe)
>>>{
>>>    struct xe_guc *guc =  &hwe->gt->uc.guc;
>>>
>>>+    if (!guc_engine_activity_supported(guc))
>>
>>Hmm, not sure my response to this landed on the ML. Sending again..
>>
>>If GuC is an older version and UMDs have implemented the new 
>>interface, we could return CPU time in ticks here so that UMDs will 
>>still be able to use something in the denominator instead of a 
>>divide by zero. Busy value will still be 0. Thoughts?
>We could do this. But shouldn't UMD only read total ticks if they see 
>an actual busyness? Busyness % will anyway be 0 even if we return the 
>cpu time in ticks

Well, I think we shouldn't have to impose that condition on the UMDs - 
read total ticks only if engine busy ticks is non-zero. At the same time 
they should not use a zero delta in the denominator anyways, so you can 
ignore this for now. We can add it if there's an issue later.

Thanks,
Umesh

>
>Thanks
>Riana Tauro
>>
>>Umesh
>>
>>>+        return 0;
>>>+
>>>    return get_engine_total_ticks(guc, hwe);
>>>}
>
