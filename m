Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2ABD116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 14:23:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A2710E2B9;
	Mon,  1 Dec 2025 14:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="me5HPRMC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322A610E2B9
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 14:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764599033; x=1796135033;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m4CVFYO9WXQq5p9vk577d4WJC7Y3LywBIzsXcj8KvvE=;
 b=me5HPRMCWpJDK1CYskvtXOEan7G1EQzvZXSUjq/Pgr4WO6/GJOTiM/KI
 AOL/4gjbMbE5ES8rMhRbb7d6BFwRhp4myjJffh2LgNwdjuxuLojp4Cl4E
 GN9D7pY9E5KhuB+U9rIUnysTQSvRPuGXhk61O7CzKQ7IiTKpNIEYeOFKM
 78S1/8WNvdnjqLLY1W1worxf4nzm+d9i3iXFnxWhNYNTJK9EqUfra2Mg+
 JFP8fJZegbOi9cc4MGoCvNUdB5Z4U3xnrIuhpUw83Sp2yGyiWzy6xTXwZ
 tS1idxpZel1q1EQuBQq3pstafNDVJxC+AtT//R+Mcj3Mtpx/pU7uz/f2G g==;
X-CSE-ConnectionGUID: xddFv1pJSkK5lRujrEX7OQ==
X-CSE-MsgGUID: dMoJL3CJQ8+yYr4WwxfzwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="70152037"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="70152037"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 06:23:53 -0800
X-CSE-ConnectionGUID: u4rABTg0S12N5eKXOiE2wQ==
X-CSE-MsgGUID: GhkRLwATSGKRXtN4SYAidA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="199025332"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 06:23:52 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 06:23:51 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 06:23:51 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 06:23:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFVF9fGc5VetpSc74zsC6oEhG2QYjgXwINfNAN8IYbZKGBS1Xj8IhXGaANxTN2jecp96ueCQ1KUKgDYpLWpxajdVcE1MxjKrtzXg3okIJpxJwRSLXRjwbrqNzG7lRvkX94OXcVZkir1Zel7EVpXNIFFHN8qgc8+Eh73+7c5f9XS23mVCWiOR6u/Yru5HCf8lyFQJW+lcEciPh+eAZEQ5kCdbjAf7L3kVqVEna2h0sxywwiIsd/4lgXmufZJ/Rd/fMkcWYiXODLNbmyL7VGXsGy4SfSU6jVCB1sFGBB5MZw0VcEub85tr7MHt7Q+bo4hEXvGCvAtcQtusoekjhPiodA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUlP0jq5ueVk6GOmvLIaHP5UDolVvGMdwB69vzzW6wc=;
 b=AKeD4RYz6/uDGLo6utVWFYrU16nxbmhBEz3L/SP3pK9VGN+4mXbDtWPCXJx+auyUigFsoVLTikGJnkOG+jpkWhwjrXmDw0UgwST7cPyonUk0kEO3Tviw2LbSpQbLU9DBGZbixpn6blI09GxlabjZ3WUanXGRB9/NBqqgSIe+cPyDrEMyG0D5/3yAwSM68cyreAyuvEd3Dhg4L8NKTpvUu/08lCWr6BpMLkr+SK7Z9uiAqW1frCr7hbcZewl8OIykrVp0PxcblId/30T653UW+5lUGdGXlRyWcdU062/MvzbPTMM8Aexu/Pm9IqGl4l0Hw0k9mM2OxeNM0UIMPi8+eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB7796.namprd11.prod.outlook.com (2603:10b6:610:121::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 14:23:41 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 14:23:41 +0000
Message-ID: <d88ca0d9-8e1d-4ea8-80a7-5c44ad74bf28@intel.com>
Date: Mon, 1 Dec 2025 19:53:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Apply Wa_14020316580 in xe_gt_idle_enable_pg()
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
References: <20251129052548.70766-1-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20251129052548.70766-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0160.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB7796:EE_
X-MS-Office365-Filtering-Correlation-Id: 16cca411-234d-400d-7fe3-08de30e53a26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0F0YUxWelVjTDQ0eERpSDJGaTYwN2xiRlJBNjhNV0ZkbFRLT3NSK1dTQTFH?=
 =?utf-8?B?Qk9hRU9GMzFGL0h4STVwelVuSnAxaXFjS1pmQmVCenFJdStSYittZmYrZ0p3?=
 =?utf-8?B?eWVNalJrdzNROHg1V3JiRklOTzBBOHJBVnk2bzR2U0QwTWF3eXYwOEpZOHJ6?=
 =?utf-8?B?UzlsMGgrb255K2laT3lhampyeTY0Q3BZMW1zdzJEWjI1WnQ5UlRndXRncHUy?=
 =?utf-8?B?cWdsNEFtRFZoTVVVZFNIOVBaS1Jhd0pobFk4YWtPZGMvNGxnWVViVkpzUFNY?=
 =?utf-8?B?NkxsWmtQUDZwNWhEQnhtdW5UOW4vVzlVQVhaNStTZ2tVN0tuMUJMSnRJMlRO?=
 =?utf-8?B?ak83TDlXVUM5WUZDSU0rUnd5MUxHMStIUkliQmxiTGNEczBWY1JzS3E4NFgw?=
 =?utf-8?B?THZlL1VTUXhDTVByakZ5c2piZ1dEaXk4QVljY1pJMFNPbitEVmpJZENnR3Vt?=
 =?utf-8?B?Q21CR1BETlVQc0xUdlFiWUUvWURiQzJnOTZpb0o3b3pOYUVwWkRnZW44VWFY?=
 =?utf-8?B?Y0xVL0pzUGxEMWZhbDRBR0RVcW1oWWtHREVKSlU2MmxRRlNBWHdjK0YrWnVi?=
 =?utf-8?B?VG5Cd0o1dXUxNEFicDJjamw0VjRJNXNCYUVlMDlkZVkyd1M0eDdFRkRZNG1q?=
 =?utf-8?B?d2dzYnZJeGhrdFlsai9YU2c0OUJxbnhQeW5iZnFVNVlJR1U3NmlheUNNWFpr?=
 =?utf-8?B?dWNiczMvWUxiTmE2OUFSMkVhY3ZBN0docmlWeFNxNzNxWHRMUEZGTjRVREww?=
 =?utf-8?B?d3E2TW13Y1pKTWlpREkyWnJzWG1mNHVKVG9mL05tQklRN2pqS1pVYlhCZXVH?=
 =?utf-8?B?UFhYTWZicWdFVTJJdUh0MGZYRHJTRWtIZnNnRGJYQjdsbGZRRzlYRHpvMGVZ?=
 =?utf-8?B?bkxiK05JcHZ1MTYwUWhvdEdqUlQxYzlwY0d5Q2xKdm5WdTNKYjhPbkx1aE45?=
 =?utf-8?B?akUxTzl4Y21pUlIwL3I5UmR6L05id3BnS1RjQ2dJalJlcFp3UzdTbmhtMEJo?=
 =?utf-8?B?NUhlejZDZ0hqL1E5Qmp4ZVZpYjJuSGV2RU1sWFA1dytJbEJsSzRlS2l0UVcw?=
 =?utf-8?B?U3Q5UEcrWThKaVBsRSsrR2ZTa09lcEY0Rk5UM1IvS1JXd1ZUODFVNmFxVXpR?=
 =?utf-8?B?WVF0QUdtMFBxdncyYzBXam5LK3ozNjg2Ti8yaFVLWmxxR0NUYk42WGlGMU5P?=
 =?utf-8?B?WWdiWkh5ZHc1ZWExenlubGswT3hXZzkrcERYcC9Ea0FiMysrc0FMT0FQTFlB?=
 =?utf-8?B?cGVVVURhNjBveHc2UVVGOXQvb05pdCt6K2dlSkZ1L0UreUs1cXVRek9RcUxE?=
 =?utf-8?B?NEVmWkVKeUsxNzN4a0FydDl4ZlpoMFhZQlpKdHJqTG5pdGovRlRVZWd3ZENa?=
 =?utf-8?B?dXg3MmUzb1VSbFIvTk1pZGloOG5JcFdQSVpZMW9hd0R5MGlnT2VYaFlmZ3JN?=
 =?utf-8?B?WHByeTRCbUJka3ZxdXVVMFBNM0hTTzlsQzFJbm9Wd2M2eVFnMzUzSnZBYTFQ?=
 =?utf-8?B?NWNQc2J6R043cUJIS3A3d05UUjJuTXYzNjF4YTA5bzQ3R2dxaHFhN205N0FZ?=
 =?utf-8?B?VnpGVy94ZkdKbjZuemNPNVY0eUltV0FsTEplWGY5Tk9YUGdqejZkdjhLais4?=
 =?utf-8?B?VURlWnd4cTNjN2M4bHZFVzJZaHFJVnl4R2M4dTloREVpd3h0NmtUS05OSEsr?=
 =?utf-8?B?Q0VIOXI3S3hnejM3dHVJNEQ2UjlBYXJGcDhDdmVGaDQ3Z3VoeW52NVc3bE5v?=
 =?utf-8?B?TWkxL2hVeW9sL1QxVkVmWEY0NTZnNHdaZjcwWCtSVS9YT0EwMEJlSmR2bTVV?=
 =?utf-8?B?QVR6TlIwTGtzWW1EOGdCMHp5VmdxaFA0VUhTT3pyUDhKUmdqNnRwdGxSZnR0?=
 =?utf-8?B?NldvSEc0NDRqZVhHQ3FUckxpUy9nVm5RenJubGZ2emdwMVBJZjlIeUl2WWVr?=
 =?utf-8?Q?bn8ukp5BpcKXYfdMfukH9WinyIBDiQts?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXgxR05UcFQ1YWl4a0Q4bFlZa0Z4c2xUQWxwRjYyWGNrK3B0OEtKREkvd3Zz?=
 =?utf-8?B?djV4cVVtejFpbFVPdGFvbGczRTJ2OHpNYXVuaHo3RTBRUllwN1RDanhjQ0Rv?=
 =?utf-8?B?eitNMzlKNFNqSFp3dy8vTEp2R3A5c3c1OEhpYmJjU21OR2xTM1BtVE5rK1g2?=
 =?utf-8?B?dTdxdVl5eTA1ekJKS0l0NHczN3J1UUt6cWhWalBUbXkrSEJoajFhUXpraExK?=
 =?utf-8?B?RDRzTnF0SEZXS2ViUjBpSUdEOFQ0MlRqeEZhaThVeUp6c3gyM0NUR2NWdUtj?=
 =?utf-8?B?bTM1dDNFRUc3TllDdHdkelp4MzlHRlhEdXdLWXNvTm0xREtJdzNvekFJZU0v?=
 =?utf-8?B?WWZOWVB3YjZpSkYvMk1Qa1Z6YWZ6eEVBZGtjVzgzTEJBRDd2MDBtdWVFM1NN?=
 =?utf-8?B?dE41N0IzWCtBWDFqOHVLOHNMdnpjNGoxaTZVUFBwRHpEalZFWUxHSmtmWVRU?=
 =?utf-8?B?RnNIQVRGTCt5bDZIQnlTSTJnMnBFWlBGclFIR3FQMU4yVlhETFdrT3F2MFJH?=
 =?utf-8?B?Zm5lSzlnMjI1YytHZzJ1T0dOR2RnWU5FMmllaVdxdWg2a2RKOU01WVpCRG1Q?=
 =?utf-8?B?Si9CNWpqZ01XL2JZQ2FjU1Mxd1R1TVNZdURjcHJzZEZaQWp3YjQzZEFlLzFS?=
 =?utf-8?B?enBMUjhlSGl3VTQxZ2s5OGFabTR4U1ZMRFdrWXo5MlVCdGZJM0Noc0pTNEkw?=
 =?utf-8?B?SXpvSEJEbDBCOCtoSHZnejVaTTVabytvYU1heUs2UVBpUkhwYlY5Z1ZJQzFX?=
 =?utf-8?B?U3JqVWMrM0MwdXEyd3UzaC9sZEdZOStjRmdPQ2ZVOUgvQnhjbFdzY2I3MDky?=
 =?utf-8?B?TFhxaTgzRXptdm1IOFB0c2tMZmJuaC84Vll3K1F1YklDTVBiVDE0N0pia2Ft?=
 =?utf-8?B?NStPRGpNTVd2RUNlVDJpN0VaaFl0VTN5WVNKVkdoZktibXRvVkNnZ3dlcjZq?=
 =?utf-8?B?OW1RcHN3c1hTYSthQjllbHhRb01RTEg3WVRyQXM0VU9MN21aYjIrOE0yZ1Bk?=
 =?utf-8?B?SzZLV1JjVHRZdjJ1Y0lWWDVBS29hOVhVdWl3L1AzMzlzTkZhZy9EYWpmWW9y?=
 =?utf-8?B?eDMvbnZBRlJ6akN2dE94UnFDVkFuaFlIeTRFbnYzdVVRVjFoUmJxQTMvbHpX?=
 =?utf-8?B?R0M5OEh1dmpCTCtpcHhtYzVOc2dJMXlBTlBBR2didE0xMWdaeU1mcjllRGZT?=
 =?utf-8?B?OWJET3I4YTVjZzJHSUJiTGZxb2ZCTEp6TTBTY2ZqYnQrTjJrVCs2d2lQckpH?=
 =?utf-8?B?RFFOVDladnFUVHcyUUFXaXhPZWNaK2ZaK1MzaVQ1UCtxYjE1bklleHBpaHNm?=
 =?utf-8?B?QjNwMlgrVkRzc1UrNnRXalVRaEVHd0g4MEFQTXFHTzlueXNMM3lidTc4a2F2?=
 =?utf-8?B?aEtrUjE5czlWcmhQTGxNRDV5WUljc1BOc1pRYXlWQ0cybTNnb0NUSHFLOENt?=
 =?utf-8?B?ZkdRTmxsRE1WaVM3ZzVjRlkwc2JnaVdiLzlON1BvY0kyV21DcDE1N3hMdnVv?=
 =?utf-8?B?Tmo2ckJyZWNUUE9obWpSaFo3UmhXSWErY1hOeG84QXNnanhiOTVLQjEyZnFL?=
 =?utf-8?B?TzYwWnAvYnFvK0JmUnFQaC9hTko3dzU2a2o1VHZnT1lxblBheWIvZWVRQjNh?=
 =?utf-8?B?MUZNMDFCOGpTb3VxNmxubFBCYk9yQk5ndDFDQjZTK250cWdoOENhZzJTRXpW?=
 =?utf-8?B?WWltYXgrKzJpWTE0ZjdCSzFtQndMelc1VW4yQlhvTHdIVkJJMGRYZHA4VkNZ?=
 =?utf-8?B?RTUzYm5iZVlZQ1Qva1JBbUx3YWNnemZLdEZMSjlvUWVHNFd1TDNuRUEwNlRU?=
 =?utf-8?B?QVprSUhzaVNUQWYva0pBZnZndEV4WWt6M0FYMnlVT0xOZTVhWVlKbUhlRW9G?=
 =?utf-8?B?dG50K0hPS2dYeXg3S3B6SVhpLzJRbUlFWkpGY3ZLc0hFZG82bUJ2N3VFcDZ1?=
 =?utf-8?B?NkdNRUdwbm11K014cGxBWkdWbTdGekdOekg1aUI4TXNTZ2IyYVdNZVlJem5P?=
 =?utf-8?B?dk8rVmllOStNZTI3U0FMcDh2azdCdFc0c3JpL0ZZYmphUXIvUzZXUWw4UGJS?=
 =?utf-8?B?KzdpdjJtcDZpK2NScytWekZvZWpGTDRYN1Z2VjRSdVRwekI2OTdPTEtsSlYv?=
 =?utf-8?Q?l0GV3gZzV63jg1EdnKqRMA0Ai?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16cca411-234d-400d-7fe3-08de30e53a26
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 14:23:41.7855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ui23rCSJhzWXU9rUMYD4eID/zv/eFl1mSaKPRlj1xlrfoy4KEmFxMyhRWvzUL4hZMnj4IYJZbPz1Y595kNhDMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7796
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



On 11/29/2025 10:55 AM, Vinay Belgaumkar wrote:
> Wa_14020316580 was getting clobbered by power gating init code
> later in the driver load sequence. Move the Wa so that
> it applies correctly.
> 
> Fixes: 7cd05ef89c9d ("drm/xe/xe2hpm: Add initial set of workarounds")
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Looks good to me

Reviewed-by: Riana Tauro <riana.tauro@intel.com>


> ---
>   drivers/gpu/drm/xe/xe_gt_idle.c    | 8 ++++++++
>   drivers/gpu/drm/xe/xe_wa.c         | 8 --------
>   drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
>   3 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 3ca7bd7c9bcd..c1c9bec3c487 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -5,6 +5,7 @@
>   
>   #include <drm/drm_managed.h>
>   
> +#include <generated/xe_wa_oob.h>
>   #include "xe_force_wake.h"
>   #include "xe_device.h"
>   #include "xe_gt.h"
> @@ -16,6 +17,7 @@
>   #include "xe_mmio.h"
>   #include "xe_pm.h"
>   #include "xe_sriov.h"
> +#include "xe_wa.h"
>   
>   /**
>    * DOC: Xe GT Idle
> @@ -144,6 +146,12 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>   		xe_mmio_write32(mmio, RENDER_POWERGATE_IDLE_HYSTERESIS, 25);
>   	}
>   
> +	if (XE_GT_WA(gt, 14020316580))
> +		gtidle->powergate_enable &= ~(VDN_HCP_POWERGATE_ENABLE(0) |
> +					      VDN_MFXVDENC_POWERGATE_ENABLE(0) |
> +					      VDN_HCP_POWERGATE_ENABLE(2) |
> +					      VDN_MFXVDENC_POWERGATE_ENABLE(2));
> +
>   	xe_mmio_write32(mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 3764abca3d4f..e32dd2fde6f1 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -270,14 +270,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>   	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
>   	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>   	},
> -	{ XE_RTP_NAME("14020316580"),
> -	  XE_RTP_RULES(MEDIA_VERSION(1301)),
> -	  XE_RTP_ACTIONS(CLR(POWERGATE_ENABLE,
> -			     VDN_HCP_POWERGATE_ENABLE(0) |
> -			     VDN_MFXVDENC_POWERGATE_ENABLE(0) |
> -			     VDN_HCP_POWERGATE_ENABLE(2) |
> -			     VDN_MFXVDENC_POWERGATE_ENABLE(2))),
> -	},
>   	{ XE_RTP_NAME("14019449301"),
>   	  XE_RTP_RULES(MEDIA_VERSION(1301), ENGINE_CLASS(VIDEO_DECODE)),
>   	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index fb38eb3d6e9a..7ca7258eb5d8 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -76,3 +76,4 @@
>   
>   15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
>   16026007364    MEDIA_VERSION(3000)
> +14020316580    MEDIA_VERSION(1301)

