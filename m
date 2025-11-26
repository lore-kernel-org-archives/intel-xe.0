Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DE0D10F2D
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 12:21:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F2710E5BD;
	Wed, 26 Nov 2025 12:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C5R/Sc2l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C2910E5BD
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 12:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764159712; x=1795695712;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JOfsJRQy1+bbhut09aOTXUOJvwG87LoRysuOQAcooEw=;
 b=C5R/Sc2lwDG5PJY6W/Ee6fCEyc6eQCUAeUd7hApfYFPUrw6NTki9QbFZ
 R9U5sp52ESrgsIW4VqaXnkQe1XN30ynsKxhaJI3L4/MDXlvuhYsz+OQz0
 HK3J1DWvRyX1Rw3z+JCHIEHomKQw/Xu73fA+q9esY+hJ49zpDXgOAa7qf
 hn/K33bR1e8anKEJBDG3dfnsUavTEV6Cuw9tQ3zLN3xAaj/iZUkBC15rs
 tduby0ZIUL5MtArjcf28gFeIUhp1QbbBbrXaI1aNRQUpQIMDcWPjB79oZ
 uuVGDhbbmBFm3NkwvooWA6vT8H4UlaGxTYJCjioKdTKE1jGD3v5rrqzoz w==;
X-CSE-ConnectionGUID: oT1FUppcSTWBqoUBukEg6Q==
X-CSE-MsgGUID: 4tlE4eKjSD6DKELrVkQ6tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65382770"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="65382770"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 04:21:51 -0800
X-CSE-ConnectionGUID: p1C4g9GRSSGirQhx3XzbMg==
X-CSE-MsgGUID: WIrc4fbzQsaZlc1k1Ub9rQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 04:21:51 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 04:21:50 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 04:21:50 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.39) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 04:21:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4LimBiDpZ5Zxrin49dmdHJbqni+gZBZve+vXwRFP0d6q5VpcfSNBu9LDzhEfUPWzK9Vgfk86q96yLyBurppwIK8fsd2drNBgKJ3j5BHJoMCmdMCFaRmmSOTuMPDhgBWFLN499pujdjZZemGQvT+xWAzk6/N+GUQHhyKN0XkD1pfa2/hyrFj77dPc1NnpEVTNNo/N2rfzRZXctc4VJC0jhkygnBSO3trywVyvcijXKQd/d225WW9askI6X7AlQ7akglYtS2JqFz7H+HpSHSsWyHnbCyDGUN/pvk1tXTvLf1Eil3LXlPwdKAY+T942d930XBhgaL9W4D5ZM+sIu18Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HP9AmFfpSKCa9pDsgzsMlgt1CZR/EhMV++tp3lYy3CU=;
 b=GU16XcEH3e+I6GMDzPMSBMV9Re/jIpleYghzLt/73u2KronO/86ufgIHBKvq00kyJ7ki13iVPGKxQ4YSDxAgnS/JYUFt7TA4Q0NPUlEqgChbRz8B/JsGpifhui9S4wnIMx/ga0pBbxYxWzfoAhThxmfB2ZtYnxO7BFpjSlEezLIS7LLoPksf6nENElTNZWe+VI2EiMCrNJb1zI1PzoqL/i5JQQm+GQsUGRVvBKpW8PTpIInu8X8v68zbSyqnUu1FAHIGT0xT6/dQsqVU+PHNMxmBm9GihID6FQwiJnU0hZx8jQLZj7/wgFn+MyU+y9REUT3kFPmThWZOBF42V9X76g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7164.namprd11.prod.outlook.com (2603:10b6:303:212::6)
 by CY8PR11MB7105.namprd11.prod.outlook.com (2603:10b6:930:53::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Wed, 26 Nov
 2025 12:21:47 +0000
Received: from MW4PR11MB7164.namprd11.prod.outlook.com
 ([fe80::a972:1395:dd49:1dc5]) by MW4PR11MB7164.namprd11.prod.outlook.com
 ([fe80::a972:1395:dd49:1dc5%5]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 12:21:46 +0000
Message-ID: <c5dac5ea-00ae-4e0b-8d21-364086b4a088@intel.com>
Date: Wed, 26 Nov 2025 17:51:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 PATCH] drm/xe/xe_gt_ccs_mode:Mutual Exclusivity b/w Multi CCS
 Mode & SRIOV VF Provisioning
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251015142820.2519054-2-naresh.kumar.g@intel.com>
 <20251125165749.2616038-2-naresh.kumar.g@intel.com>
 <d30cc881-706e-4c6d-9307-4cf927343504@intel.com>
Content-Language: en-US
From: "Kumar G, Naresh" <naresh.kumar.g@intel.com>
In-Reply-To: <d30cc881-706e-4c6d-9307-4cf927343504@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0184.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::12) To MW4PR11MB7164.namprd11.prod.outlook.com
 (2603:10b6:303:212::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7164:EE_|CY8PR11MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: 43eee8f6-20c2-425a-3a55-08de2ce65e20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUx1NkpnTzFrOGc1dWtWdzA0OU91MWgxTXd0MHdMVk5wN2NQR3lIL255QU5s?=
 =?utf-8?B?QW1KL1lRRWhvb1pGRWZwL2Q1aWVhM3h4YVl5WnM3TTV1Z3AyTExmS0xaaWNZ?=
 =?utf-8?B?MUhPcXFEbGNYL1FCSGJCV2tQZ3VRTFdlbmIwTm5QOXltVVRMaFVhOTdEWFFE?=
 =?utf-8?B?aW8xMmc5VGdzeVk5RStnYW9GSEdqTHFhZmNTMDN2WWFzemU0dWJJemJzTk8z?=
 =?utf-8?B?VU5uY3l3RFQ4OG1TbVlCbnM3cis1RG5aOXJTc1lIRHcwckI0Q3EybVhiNmpI?=
 =?utf-8?B?QnI0VUYxMWVSMDY0WW1GQWJRQ2xIdDNlTHBkVi92NWhIYTJDU21Fak00OU4w?=
 =?utf-8?B?NUZKWWZmT1o3ejJpRVc2SDZSMlhLNzRvd0swcnpQTXZ0THJ0ZmQwOWVGS1hP?=
 =?utf-8?B?VHpHL3N2UnJlWjg4QndJTld6aXE4R29kb3VoNzQ4RTJFZTBFKzAyQWR3NFgz?=
 =?utf-8?B?ZTlPL294dEtiOC9ZeHJUc3NVZGZod1JZajdCYlRwOEcxQTFLOUZhcjBDOHVy?=
 =?utf-8?B?bUpQZFVNL0F4eW56VlFIb29mQzlzdjhKYlJZVzUxdStCM2RIWCtMVDBHNElX?=
 =?utf-8?B?b20vTENKb2E2dUhsd1c0RWozTXAxSjB6bzQvRnpMdTBpL3NiSEN3cFhjcmpk?=
 =?utf-8?B?YjJrWmlCMThvRzEvUGh3N2cwaFp2QzdhRm9UZ3ZydHpTR2lFK3hQRXJBdDRM?=
 =?utf-8?B?NVVYbjFSQXU2VlpkQWZIVW1KRjIwWDRlMEtGcmZmemlqQVd2UmRLcm50RGlS?=
 =?utf-8?B?M1FwcGFFc281QkJrZkgvMW9SbXRtc2gxQmRmWnR1bU5hKzQxR0RkaHRNbnFv?=
 =?utf-8?B?VC95QTVPUE5IOEcxekxKT3JxOGY3eGNaMEh0TjRKay84MlI2YkxXeWZpT3Bw?=
 =?utf-8?B?alkxYWd3RlVGTDNzNkZFaGRNUkI0cDFsQTZWNnd5UDVzUmQ2Z3AxaW1OMmY3?=
 =?utf-8?B?cTNaelJ3QlNXa1MzcmFxclhrRCthMW8vR3pmS05jWUtFa2lYSU45TmRNZm9m?=
 =?utf-8?B?NkYyOWdWY3g0UUtyUHduK3IrTGlOdFpCT2tUMVE3c1FreHpLVXlOdXJoaU1Z?=
 =?utf-8?B?VFN2d0pCZCtOZEtVU3lOY3BtbDF6alJIdDZJbWxwMm1idTVsRHFVRklmSCtw?=
 =?utf-8?B?ZGFTVDliMmN5WGRBdUt3RlRHNTJWbU9SV2IvbnVBcExvMkpCOEwydGFCam5t?=
 =?utf-8?B?U20xc2N1N3VFcU1UR3lJY2czc1ZiOFpmNnJObFU2eUNvWEtXWmw0QUI3QVUw?=
 =?utf-8?B?K0dwc2dnSWs4UWVxZEVGS3hoN3d6ZFVhVmdJbitlbkZXR1AwZVA2QWlyK29V?=
 =?utf-8?B?VG9NeFFZTnJEUUpkOWNZZXhZaDg2dVVGamlDTVFGN0VZNS9UclQ3Y21ldU9P?=
 =?utf-8?B?dUh5eElrSTZJYzk4VmRvV1g4NDV2MFlkMDBMdDNQa0J6VDNnYWN0YkNERXNF?=
 =?utf-8?B?YnJDa2JENU4remFrUTRHaW1FZ3I0L2RpRllNNkJITHc1UFJBRXRpVUsxdGpD?=
 =?utf-8?B?bk1Uem83MlZVYnJCRkxVcjBiU0U4QXJ6bVUycVcydVRiSEQ1amI2SEJ3akNE?=
 =?utf-8?B?WjV4bXZMRjZYU1NEU0J4RmIvdGZrS2ZTL2grd1VEeFRJZlY5ZnFBL09DeTMv?=
 =?utf-8?B?NGIrdjhMall4cXlaZFNYd0ZYSnh6d2U3QXNBaFBtd2I1Sjl1cFdJNWgrZWxx?=
 =?utf-8?B?ZFlKN0EwTUs0ZndFQzNLQ3l5eENSZHdKNklGS1ZYaUFnSWZSaVg3czlVeVk3?=
 =?utf-8?B?dCtCOVlZRllCemo3emxaM3lxWHVzK3RYTFBZNVdNMnl4elRnV2c0MTV2U0F3?=
 =?utf-8?B?bDU1VlZSVi8rYTVSTm9VL1ljKzYyVkdhYnJadGkyK1BKN3R0dnBYNWJOUGho?=
 =?utf-8?B?UmJidldiLzNvR3NQRUlvOHYzcFVzcnNYY1pEbHpiRkFYM3JlMGxnc3VocHpE?=
 =?utf-8?B?NWFKeUp4YVl4dG16SFlnL3RaUE93R0pCbTJFdTlaOXVYTFhzcHhYaUxYdG1y?=
 =?utf-8?B?UERVT2NRWHFnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7164.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1NrVzBSa1cwL25henFIWFUwYzdlNmlDOUZXL0VWbVBsb05qbkQvdVRCTTZD?=
 =?utf-8?B?ZmlqZjZtSlkwL2tiOHhLL2QrTWllSEU4N0pEZW80WGJXNk9uZlkzMS9KeURZ?=
 =?utf-8?B?WURVc25ISkh3cEpydExQeDZPbUxaV21HQlVmRk5zWkR4VU45eTdBU3ZDdnFs?=
 =?utf-8?B?eGJRKy8yT1hTUHY3REJLY25iSzlaaUlyekNYck9wSnJvaHVDRW9IaXN6RlVt?=
 =?utf-8?B?M1dWSmtNYVIzTG1kMTV1dkpjdHgzUkhBOUpGbFU0QnlCK296L241SUZ2RWxX?=
 =?utf-8?B?NS94Y0JLZWtlUlNmNG1IM0o2b2pyZTdzUTVXUlRTazYyVVYya0hxTDBzUGNs?=
 =?utf-8?B?RWRyVFdWRWRhUktjK2hiQzBiY3pnbGZ5KzYraWVRSmZHMmF0TVpqOUVmaFlR?=
 =?utf-8?B?bWI1elB4UUptQjRNTGtlU1E1QWJIRU95WXhZNEVNWmF1bDNxeXJMTGdVRmpm?=
 =?utf-8?B?NGpwVFZJWi9WTStQWVVvOUU1TXJxNUY5OE9UWUliaXNIUGZWb3pBTllqQkhu?=
 =?utf-8?B?eW5BaDNrdi9HbVU4WHhBSlhKZ3IvR1MyN0hQTUx0RmpxTDJlQmhmSTJrNmQ0?=
 =?utf-8?B?dVlSbm14RGJWODRqRitYcng1UmlqZDBSbXN0MU9KWGRkVjZZemNqTFB6NGZr?=
 =?utf-8?B?UkxwR0liWE9VTW52U3NaOEJkUXZVSHhVbzZHZUViM21PcWpxTGF6U2pITUxR?=
 =?utf-8?B?MllIaEg1bVB4M1dyZkVLMFZyMHh1ankvWm92TDBXMW9WR293bHI1cGN4VDVj?=
 =?utf-8?B?dGw5YlVTbHAwUGRST0d2TUdvNnNyUE1lZkg5Z0d6N0w0bmNvS0Q5QmZkdU9C?=
 =?utf-8?B?NEZKUEQyNkc3K1U5TkdQNVhrYXgvaU1SU0R5T0g5ZlpreVBIckVtalU5WUQr?=
 =?utf-8?B?dEQ4MTZWUElWeERld0tBTXF6QW1PMkFrMFcyK2FJWVFPNEhGMUF5T2dGRTZi?=
 =?utf-8?B?YUQzTGVvV3ZwV0NrVGVkckMvTktKSE1Bb0VRQkl3K1JYVWFSNEhsNG9FZmtr?=
 =?utf-8?B?RVZraW1DRFcvamlha2ZvaFhYbWYrRlRUQmpJa1JxN2FPMy9WdWNjT1pKVmJL?=
 =?utf-8?B?bmFXYkhXMGp1ZlUyNzUvazBNa050ZEV3SU1yUzBtWU5xbmFhZFdOZDBneVND?=
 =?utf-8?B?djJJajRiMmFFRG5aZTRhWjc4ZnNWT0lESkFDdE1IZFFrRGRLdFpFZEVkdEt0?=
 =?utf-8?B?REpibGp4bzE5bmJBd1pndjRjVlJUdk43TE0rTFFIak82UlVjMFRTT1dONi9W?=
 =?utf-8?B?bTI3UzZmQUxLdytvcWVBRnV0ZS9XU0I2Y1ZCVFpUYzlZTys1U3BEZ0I3aXQv?=
 =?utf-8?B?ZW9vc0dIM2wxdzdOZlJSY1RXeWxYVmszVU9mN0dnWFZ0OE5jYlhQempxbkNE?=
 =?utf-8?B?enhhWnE0NUsxWjJzUGRPSTlvR0FWbDUwVkthdG1PRnlpNmg1RnhBS3VPM1gv?=
 =?utf-8?B?TEpaRFhKdVRkdmVyYWpySzNidXZaNTVOVklmTzN2S0tIZ2VkUWdNTVZ0UnQy?=
 =?utf-8?B?ZkJGRFZ0OWRPV2ZxTndoeEVxNGo3d1FxR3N1OExiU2l3OWxLamNCMFMyNEpz?=
 =?utf-8?B?K20zem5ySkxVSDUwNnBNQy9jck9rdEZlMmtHVGpkZjNkWURtR1UrZkpzbkdN?=
 =?utf-8?B?KzhUL243Skg0U2FkQVNxUDBrb2hzR3Q4bkJmZGVNMzF2ai8rUUxpSHl5NHE2?=
 =?utf-8?B?am91WldrbEhQWFgwR1dTSlB4ei95L21ib2wvZTdlTHF6RUFmaFZ5UXA5YWFu?=
 =?utf-8?B?Vmd0NWdGcTl5QXQ1TnlJWitBcXdaWkN4VE9wNmYvRDExZ25abFlkZ0ZwUUlP?=
 =?utf-8?B?eWRpRisrcWQ4OFJGZW1CR3JSUDJFZXZJVFJwOVl6QjJHYzNOYVpVTi9nK1M5?=
 =?utf-8?B?YXhNZlBwYUZIVDUvK3EvZWRFQ0dRbnR1ZnpzOXRoWGtzSnlDbWI5OHdkNWdv?=
 =?utf-8?B?K2FNVjRtOTBCTXhGTzUwN3JmeW1tUnFjcFVzVXJBakJHbUxlMUthOFRrbDFX?=
 =?utf-8?B?akR0bjdNZXhnZEFzZ1hHT0YweVNLVHZvSXRtbS9KVlJZT2htTHJ4ajZXdk9y?=
 =?utf-8?B?WXRpa1RtWGlVWGhoRFR5N0l5OW1Wa09mcjBHUHdFWllPNjl6MDRFMGFpd0xv?=
 =?utf-8?B?dDhMZ09BczZINWVtR1lFNUpvRzJXSGxBZGRqQ1ZIMld3RG50eER4bmVNUDhM?=
 =?utf-8?B?V1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43eee8f6-20c2-425a-3a55-08de2ce65e20
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7164.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 12:21:46.9271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4dAlf0X7saEisjKU/KZTp9eOJuAcFgjydd4zUKiyr8bg+9uQnrOSKu0ZAGRVZ1P6YXrnd9o2sPckQj6z1xJY7OJK8eBcKrRwlBmW0UUYfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7105
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


Hi Michal,
On 26-11-2025 00:43, Michal Wajdeczko wrote:
> subject is little too long, maybe:
> 
> 	"drm/xe: Mutual exclusivity between CCS-mode and PF"
> 
> On 11/25/2025 5:57 PM, Nareshkumar Gollakoti wrote:
>> Use PF lockdown supported functions to enforce mutual exclusivity between
>> CCS Mode and SRIOV VF enabling/provisioning during CCS Mode enabling.
> 
> please explain in commit message "why" we need this
> 
> [1] https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> 
> and also mention about a change for the VF case (no sysfs file in VF mode)
> 
>>
Noted and update in next revision
> 
> and then you can move whole below change log under ---
> 
>> v2:
>> - function xe_device_is_vf_enabled has been refactored to
>>    xe_sriov_pf_has_vfs_enabled and moved to xe_sriov_pf_helper.h.
>> - The code now distinctly checks for SR-IOV VF mode and
>>    SR-IOV PF with VFs enabled.
>> - Log messages have been updated to explicitly state the current mode.
>> - The function xe_multi_ccs_mode_enabled is moved to xe_device.h
>>
>> v3: Described missed arg documentation for xe_sriov_pf_has_vfs_enabled
>>
>> v4:
>> - sysfs interface for CCS mode is not initialized
>>    when operating in SRIOV VF Mode.
>> - xe_sriov_pf_has_vfs_enabled() check is sufficient while CCS mode
>>    enablement.
>> - remove unnecessary comments as flow is self explanatory.
>>
>> v5:(review comments from Michal)
>> - Add xe device level CCS mode block with mutex lock and CCS mode state
>> - necessesary functions to manage ccs mode state to provide strict mutual
>>    exclusive support b/w CCS mode & SRIOV VF enabling
>>
>> v6:
>> - Re modeled implementation based on lockdown the PF using custom guard
>>    supported functions by Michal
>>
>> v7:
>> - Corrected patch style as message written as subject
>> - Used public PF lockdown functions instead internal funcions(Michal)
>> - Creating CCS Mode entries only on PF Mode
>>
>> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 48 +++++++++++++++++++++++------
>>   1 file changed, 39 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> index 50fffc9ebf62..468c3a6790d0 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> @@ -13,6 +13,7 @@
>>   #include "xe_gt_sysfs.h"
>>   #include "xe_mmio.h"
>>   #include "xe_sriov.h"
>> +#include "xe_sriov_pf.h"
>>   
>>   static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>>   {
>> @@ -108,6 +109,29 @@ ccs_mode_show(struct device *kdev,
>>   	return sysfs_emit(buf, "%u\n", gt->ccs_mode);
>>   }
>>   
>> +static int xe_gt_prepare_ccs_mode_enabling(struct xe_device *xe,
> 
> nit: usually we don't use xe_ prefix for static functions
> 
> and there is no point in passing *xe since there is *gt
>
Noted

>> +					   struct xe_gt *gt)
>> +{
>> +	/*
>> +	 * The arm guard is only activated during CCS mode enabling,
>> +	 * and this shuould happen when CCS mode is in default mode.
>> +	 * lockdown arm guard ensures there is no VFS enabling
>> +	 * as CCS mode enabling in progress/enabled.
> 
> this should rather say just something like:
> 
> 	* We can't change CCS-mode when VFs are already enabled and we
> 	* must prevent enabling VFs when alternate CCS-mode is active.
> 
>> +	 */
>> +	if (!(gt->ccs_mode > 1))
> 
> can we have helper which name would describe this magic condition?
> 
> 	bool xe_gt_ccs_mode_default(gt)
> 
>> +		return xe_sriov_pf_lockdown(xe);
> 
> note that all xe_sriov_pf_xxx() functions expect to be called only in the PF mode
> 
> so before calling this xe_sriov_pf_lockdown() you must use IS_SRIOV_PF(xe)
> 
>> +
>> +	return 0;
>> +}
>> +
>> +static void xe_gt_finish_ccs_mode_enabling(struct xe_device *xe,
>> +					   struct xe_gt *gt)
>> +{
>> +	/* disarm the guard, if CCS mode is reverted to default */
> 
> "guard" is just an implementation detail of the "PF lockdown" feature
> 
will update in next version
>> +	if (!(gt->ccs_mode > 1))
>> +		xe_sriov_pf_end_lockdown(xe);
>> +}
>> +
>>   static ssize_t
>>   ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>>   	       const char *buff, size_t count)
>> @@ -117,15 +141,13 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>>   	u32 num_engines, num_slices;
>>   	int ret;
>>   
>> -	if (IS_SRIOV(xe)) {
>> -		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
>> -			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
>> -		return -EOPNOTSUPP;
>> -	}
>> +	ret = xe_gt_prepare_ccs_mode_enabling(xe, gt);
> 
> shouldn't this be done under below mutex?
> 
yes it can be done anyhow prior is just input validations. will update 
in next revision.
>> +	if (ret)
>> +		return ret;
>>   
>>   	ret = kstrtou32(buff, 0, &num_engines);
>>   	if (ret)
>> -		return ret;
>> +		goto err;
>>   
>>   	/*
>>   	 * Ensure numbers of engines specified is valid and there is an
>> @@ -135,7 +157,8 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>>   	if (!num_engines || num_engines > num_slices || num_slices % num_engines) {
>>   		xe_gt_dbg(gt, "Invalid compute config, %d engines %d slices\n",
>>   			  num_engines, num_slices);
>> -		return -EINVAL;
>> +		ret = -EINVAL;
>> +		goto err;
>>   	}
>>   
>>   	/* CCS mode can only be updated when there are no drm clients */
>> @@ -143,7 +166,8 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>>   	if (!list_empty(&xe->drm.filelist)) {
>>   		mutex_unlock(&xe->drm.filelist_mutex);
>>   		xe_gt_dbg(gt, "Rejecting compute mode change as there are active drm clients\n");
>> -		return -EBUSY;
>> +		ret = -EBUSY;
>> +		goto err;
>>   	}
>>   
>>   	if (gt->ccs_mode != num_engines) {
>> @@ -155,7 +179,13 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>>   
>>   	mutex_unlock(&xe->drm.filelist_mutex);
> 
> to avoid such manual unlocks, you may want to start using:
> 
> 	guard(mutex)(&xe->drm.filelist_mutex);
> 
> but then make sure to do not use "goto"
> 
>>   
>> +	xe_gt_finish_ccs_mode_enabling(xe, gt);
>> +
>>   	return count;
> 
> 	return ret ?: count;
> 
>> +err:
>> +	xe_gt_finish_ccs_mode_enabling(xe, gt);
>> +
>> +	return ret;
>>   }
>>   
>>   static DEVICE_ATTR_RW(ccs_mode);
>> @@ -191,7 +221,7 @@ int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   	int err;
>>   
>> -	if (!xe_gt_ccs_mode_enabled(gt))
> 
> btw, the "xe_gt_ccs_mode_enabled" name is little misleading,
> IMO better name would be "xe_gt_ccs_mode_supported"
> 
That's a good point. Since this function isn't part of the current 
patch, we can address the API name change in a follow-up patch. For now, 
I'd prefer to proceed with this patch using the existing name, and we 
can update the function name in the subsequent change.??

Thanks,
Naresh
>> +	if (!xe_gt_ccs_mode_enabled(gt) || IS_SRIOV_VF(xe))
>>   		return 0;
>>   
>>   	err = sysfs_create_files(gt->sysfs, gt_ccs_mode_attrs);
> 

