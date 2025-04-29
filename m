Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50620C369CB
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 06:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD73710E2D7;
	Tue, 29 Apr 2025 06:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7YR0jh2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0791A10E2D7
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 06:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745908570; x=1777444570;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RWu2dUnw8AIHT05SMUlkkFj0hkN6Nc/fpgIraAKJu0A=;
 b=W7YR0jh2nF2+C0IL7SBvBtvvTIDMWubb0p0ukL1+jlEeTHaByVnMnIsv
 /JUHgIeXaXp0tyA+ArSVOSHe1Ep/Y4v3U2x90pf8NSEKhRpCtwQ3cHZg4
 D6xwz2pRtmAT/Et8fNNsag16PXxIC2JI8Lr/TaHx5GFIFKZ0QsQBkINft
 FfNsfXYkley+tmAZHBZ0JvsRNgEQnYPK3kRYbWp2jjg1vsuOOgS8Xz7NU
 QL3OT4LZlQFyXs069uLUP8+IqO8P+VrKnhUvkyGhl/UfeR5cQsep7XqU0
 24MLVVVx7rPfj5uyikSXrliqWJbJWeB7e5EUlkk0zdBLtH8F98mO89cj/ g==;
X-CSE-ConnectionGUID: VAMB4xsHReW0kPQsM1MSSA==
X-CSE-MsgGUID: gsspuVEJQ8KZxS4S3k2O2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47676969"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="47676969"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 23:36:10 -0700
X-CSE-ConnectionGUID: PEsnPxJLTuGKwFAcvS8xTw==
X-CSE-MsgGUID: O+0xN1MYRKedw1IBknp8Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="133622770"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 23:36:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 23:36:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 23:36:08 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 23:36:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJIaycCO+qfeIOHvxdn+1Gld1jqcW7B2LR+ToDmz09B4sG0ghezOII61WEhr8+HOPiX4kKj/JWDf8NrTE+77lxOO9vX8eRgMQ8jID7cbKYi4a4sSX7VaAMUjlgnmRnltBJQ+xMYQRrEtsREQi6KCIsejrxdrPBmELwnfcCh24q/vHeD1hZyD6lwGtpMHDg3naSdRgxxagxXzCax3Awrff3/LVmlPwit35YesCtv1Sa60if7Y0zhdyXJPs435d/f/Lbh2bTRpR2Ss6AjVroUAUqv3kgAbkFsGwu7/Ajn5qNX9c6DJLXAppPOrzzzJ+MIpVfH1HA+cHrxI295NYPwuDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CP86SgAVRb1v4VxBV9I9syxZk5OaHh/wbCWhc+U8qc=;
 b=blfjY/swQjBrkwzUQRFMHHcOqvbL0K1eZOLb2lcDKGgs3sESGurKgMwecOVAIEk2akqceGCRpL26dOQnBxLGFQKigkw+n+6YmWJ6mjdv5nCr525pi4oE6BCNkL/RxxU0RXWgr4Q624t8bo6dR/vJgDMPXCXcWSWciThgZ3g25PK8KQTGjtnmByLGDyOfMgRnw40VUilQ7WaK5/jospgpiA7Krnmm3sfTEQm6VyNCksm+wyXqXLTxNEo0JEzOsdKx5Dy8SgwS3FK/IGD/xTrWb/T1BJDLle7XjY1KeMDG4Dj+EYDWAG6/fRBfr2AQP1b+aWweFWIF6K9bUKjGF0kubQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ1PR11MB6154.namprd11.prod.outlook.com (2603:10b6:a03:45f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 06:36:05 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 06:36:05 +0000
Message-ID: <a40ab94f-0a71-4092-8410-cca3c5f2bc99@intel.com>
Date: Tue, 29 Apr 2025 12:05:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/18] drm/xe/svm: Implement prefetch support for SVM
 ranges
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250428103224.69534-1-himal.prasad.ghimiray@intel.com>
 <20250428103224.69534-18-himal.prasad.ghimiray@intel.com>
 <aA/3nrQgNq8uGaFZ@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aA/3nrQgNq8uGaFZ@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::10) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ1PR11MB6154:EE_
X-MS-Office365-Filtering-Correlation-Id: 01b97f6d-1ede-4c3a-2881-08dd86e81e33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0lkNmNwYlYxUTdYWW5ueTkyZmdNZlN3WkNKWm1OZFBqc1ArM0lTRDVEc1hk?=
 =?utf-8?B?Z2IrQWc0TUYwbE5nMjV1a21LNXVSa1J4T1k4YU1hMVJiSjFYeXJNalRwMU9M?=
 =?utf-8?B?T0Yya3RnSGp0RTBudnpjdkgrUUJ2Tng5eUdwTHNiUzBxVzZjNXVOZHhGdW81?=
 =?utf-8?B?dUhGSWkzVm1DRUxvdSs5Mm0zNHpPYWw1SHl2QUNFU3ZlVFJEaGlWL0FacTRN?=
 =?utf-8?B?Y0J6Vm1pSXp0L1hZU1ZQTkNOcFdmZE9xa0lOL1RhYnljOHhBeEEvU29iaFlW?=
 =?utf-8?B?dzk2VWdXalF0UnVaRlR0c1dwcFJZaTdKQWFmR1puc0RNaFlqejNROVZRT1RY?=
 =?utf-8?B?ZEtLYTdoMmxuc1lnNlBEQUs2cUttQ0MzK3BQY1F1YmM0WXRtb3ZPdlVjVHc5?=
 =?utf-8?B?M2Iza0d6aXFFV3B0MjZtMVNrdXR5NkhCMndkQjFTSS90dWVBaFRlaW5BOWcy?=
 =?utf-8?B?NmJkaE9HL051Q1UrL0FVOUtZU1pwSmZpd3Niakx2d05zU3dhOHY1aVlvcWdI?=
 =?utf-8?B?c1NTcHJiUk5Nc1Zma2ZGUnRNL2V4dzE3OVRBMm00bVFRUEFRc3RPMkFqdXVJ?=
 =?utf-8?B?SXRXYXZLZ1gxenJMeFhiOVRDL2tSaWtkZXJYN1J6K3FYbDhDSkJ1dFhicXRN?=
 =?utf-8?B?WHhMczlJMytlSHlQYjVnS1lHZXlETnBPcmdtS3ZrUERtNmZnQzJVYmdhU29H?=
 =?utf-8?B?NmFVSlBQS2xxYnRKZUxudjMzbS9vTm55OUVzcjZYcGxuY3Y5eVd3N29UUlFp?=
 =?utf-8?B?cG55bHg0OS9kbEtla2ZtbEs5S1ZmVnNTVWJmWm5xcVBhWGFLSEl4RFBFdEJq?=
 =?utf-8?B?YW16ckJnRmRNZDNBNmtkVTZZNlc5bEhqOTJxc0g1RHBIYVZUa2ZIUFZlV2Vu?=
 =?utf-8?B?QWYrMEZwb0xxZlFGTUtWd3VseVRmdUdkaEpMdmhpenBXdTV2b3hzUFBHcHdZ?=
 =?utf-8?B?MlVDa0hwQlV0ZWFGbDNXdHMwNE5qSEthaE9CdUcyVW5WZWhBZXJZeEQ1MHlp?=
 =?utf-8?B?ZFNXc2FIemlSMTBFRVA1dktEQXN4N2dodjN0eXJNd2Z3Q3VkY3c4YUR0UEQr?=
 =?utf-8?B?Ymg0cjNVb2szek1YcGgweE9oM093QTRTWHlsSDZsalRYZGMyV0tXOE82OXYw?=
 =?utf-8?B?L3h0bVcrc0wxUEpHdWxzQTVvYXhwZ2RnK1VETkxtN083Mk5KRlV3TXpxdVNN?=
 =?utf-8?B?aEhMYTBtUGxiaE4vVFZsTjlxL2I0M05SVlI4NGtxelg3eHYrenB5NjVTVVM0?=
 =?utf-8?B?VDQrTmxjbndnUUJKQVhTa2kvcmtWMml6SHlrYzBZZ3E4cjk1NGNZb1ZQcUl6?=
 =?utf-8?B?WFJpcVNkSDlhTk1lbWI3Rk5yblRCQm9zV0krQU9uWk5pZUFRRjd5akkzWU9l?=
 =?utf-8?B?Y0VQTVprRW4zTkJ6OFhZamE5dEIySmNmeG0zSUo4TW45TTRrM0dya2J0MExJ?=
 =?utf-8?B?cmt4YWZxKzhiTXBzZG5KbkNscjRvRXhhSHhsZHlVd014b0dIM3ZMekRyaTJS?=
 =?utf-8?B?a3NsZnR2WmdYSHE2cjNTQlRIemZOLzA5bk4rcU54RENSMmJmeERFRDZEZkRX?=
 =?utf-8?B?YlNjMDBIbnNvc3ZIRDE5aUszc08weGlieTBvWmNuRjVIVnNvQ0VKN1lmbFpC?=
 =?utf-8?B?QWYzRmp2RGJ0eS9uYWl6ckU0eUsrZUJDYTdWYVlWaWVKTTg4VnNBRVo3UXZV?=
 =?utf-8?B?NkJBS2FPQkRpZW9yRENYUEhYcTR6V0JGdWVZZlRyWkJxMFlEQXRKU3RxZUFa?=
 =?utf-8?B?aVliY2FNbmZwWGF4SlJDQ0hpSFJScWhJaUpyZEpaV3ZTaVlzOUR6cURwLzY0?=
 =?utf-8?B?TXJrdDkzL0NkcUJIcHpiMnJOOFdMckRJNWNKN0g0a3RPK3A5anJuZHRvcVdN?=
 =?utf-8?B?MjZFZG1SUlFkTzhQK3VXV2NLMDl4UWhjRTZCSnJUZEhOdmZWTzZzcXE1SXFo?=
 =?utf-8?Q?dlwrZ+3WgyE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlFOekNET0owY1RZNU9nbkpxYVIxYzFmTk1uTGphZ2FJcTljaCtpTDN0NGZ5?=
 =?utf-8?B?ZlZTSE5TYnYvemxQK3BxcUpQTTBnSWswREJXaHpwc0NaZTNNNnRiTVVSMGo1?=
 =?utf-8?B?eXVidG03UlpCVDVaM2FzRFJHUzE4NjlGYkF1ZTROOVlSYUxGZTdtSU41eUIy?=
 =?utf-8?B?TWtPUjNIU3R4Y1V0RWIxNnJRNzdYLzBXT0dMdStyMk5pQXNPS0N6dVcrTXZQ?=
 =?utf-8?B?dHY0a3hweWlYYmhKUzRGMzllejgvWE9tN0pGMWlPUHBFL09JdFRMcWJ0ZWJs?=
 =?utf-8?B?Mmo4bGRMcjlTK05yTTFjUUkwRjA0SXBRekRlaFRQcFJrN2V5Nnl1TEx3eERX?=
 =?utf-8?B?MFZkaTBBcFU0N1pwUUZ6UWQzaThyd1BNQ0c0NjRuUEhFeTNFT1FDeThwS2VW?=
 =?utf-8?B?MkRFem9mZThGZ0s5RDh2ZEJiN0JOdDhTOWllRDd4aUp2TXI2QkJVZlhyYjlm?=
 =?utf-8?B?T1YrVkZSQjBMcVJrNC9lRjVBZkQ5MVAwcHNNUzJWNnFsc1pxcjlLSXIyZU85?=
 =?utf-8?B?bHRvL2Q0MXVlUXRWbGZkTmtaNXJjQ1EvNU14WmtVN05HSHBtbGpMRFN5b0pj?=
 =?utf-8?B?T25oNHY3UUx4L2hpTzJCSUlIY1ljWDRrS2tHalJicWJ0WVBIamo0T3ZoY25v?=
 =?utf-8?B?VHdveDZWb0tMS2prbmc2Y3JDb0JDVXJZN05JMVdSRUx4Y0lkNVVqODFaNlVt?=
 =?utf-8?B?MVNUOUpHT3NzamdjTkE0am4wRTlOZjlKUmtMY0p5d2RCdTkzaTlDQVVaNFNZ?=
 =?utf-8?B?c056MkExMXNIQmkyOExUMDJVSUUycE5mQ25ESFdEZkpDUExpb0Z3d1VmNTE2?=
 =?utf-8?B?U05VYnFncmI5Y3d4SFN0SlJpWm9ma3o2WUNJakU4TFBBMEVLd1ZwVlRjZ0dy?=
 =?utf-8?B?SkN5YWFJK3JvUGtwSDROdjhLanU0cWIvK0ZvRlRobi9iMVZOWndka29TWXJ2?=
 =?utf-8?B?ejVYMUczTGFaQVo2bXlsOXVZSStUaS9yYm9PbVNBVHdBSEV4WlVvZytxWU5p?=
 =?utf-8?B?YUNuMHllWEtzL282NDQ3WWs4emhyR1hKSmFNWFJhRlZWOTgvYmJ4aXdKa0FP?=
 =?utf-8?B?MWtnSS8vM3RNTjdraEdYdzNycGh4ZW9XV0lhSFlRNmUvbFBLaFhQbGQxTXNR?=
 =?utf-8?B?V2ltZktTL2VPK2lOK3h1d2ZveUpmVmZLQ1UvUGVkaWFUOHUxSjFlcXFKNWtE?=
 =?utf-8?B?dE9mMnFXS1NMVDJIZ2pRUU5OV2hFSTR2dW9IcVNHRTNYMTBwcGJNK1hwblUr?=
 =?utf-8?B?S2QzU3hVTTQvSUdwVUJRVjIwclRnbmc4NytyYzFqUnFOYkNuMXRnTk5oREJm?=
 =?utf-8?B?b01YRFA1amd5MXM2a0hTbmtNTUdmb3lWWGJYQ0laWHFXNTR0S21aZlNYTjlw?=
 =?utf-8?B?ZW1kWkVrMDZ1YmhBWmcwQzR6UmxZTDlxbHMzWk4xcW9tMDMyM3UrVjBIOVpv?=
 =?utf-8?B?N081L3UwSHNEc3piT0NVb2szdkxocG02N3E1SFdDVEFNc2xIeGZUdFNPVm1C?=
 =?utf-8?B?ckplL0QrTUNBWkJ6dGM2Mzc4UTRqUjJqdGFoaGpnSzc0dFFTSGJtS1grQ3N6?=
 =?utf-8?B?Mm52RitSWGNvN3RzRDB1UW5xRWFTWitROHF1OCtSSmhVbTFvZk56VDNudVFL?=
 =?utf-8?B?UXRURTVsU2x5dGJWb21oQWhhQVFmOWtZWHNDbDZncTBiMGpyU09HczdEVTQx?=
 =?utf-8?B?TTZ1ZUFRU3FhdDJUSHViMlliSXBVeWN2UWpTc3VCcldkb3pNSzEwSHpMUUVm?=
 =?utf-8?B?QzFqdTMwbVAwUHltNnV1OTNYRDIyWm1SQ3F3aDFvTmJnei9ETzdUL0s0dmZk?=
 =?utf-8?B?SFFFTGNEYzhUR1ZZSkx3SEJ4Z2VSaUVWeC9UU3ExOE0zZmJETzJpN2Nva0lo?=
 =?utf-8?B?ZGdjOThpZ1ZUYnU2NWdDUjlRTlh4T0gvSkFhbWJRRHY4TzdEeSsrOGVJVHVS?=
 =?utf-8?B?Mk9VZ0I4NHh3U01SL3ZnUDhsdVRJZ1F5amNNdTMyeWhQaTVTb25EN041d2hp?=
 =?utf-8?B?bU9KUUFVNERnMDEzMTRyYmdqb0NXSGZQTWNrTnhqS09wMEtIanF1TVhsaFRJ?=
 =?utf-8?B?RlZtUWw5c1hESlRZK3hXL0JJRmxPbHBNSUpJTXpNSEpiczRNL3JyYWlyY1cz?=
 =?utf-8?B?MTdObzdwTkc2VXhWYkxieThzMWV6RDEwK3R5dTZYZU5BbmtNMzJiL1ZwL3NB?=
 =?utf-8?Q?arMdyS9CEO6cYuNP21hOh1w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01b97f6d-1ede-4c3a-2881-08dd86e81e33
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 06:36:05.7021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +KKd8txpxBE/d02Q6ZnMYXvxjHHnA8YYl2/ONfINvrOflGUGyuepYOrHHTQ+5XHEjBmNwQT+cm7CsXs4Z+ygFeQkPxBdkhxqUJFq+QyS4qQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6154
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



On 29-04-2025 03:18, Matthew Brost wrote:
> On Mon, Apr 28, 2025 at 04:02:23PM +0530, Himal Prasad Ghimiray wrote:
>> This commit adds prefetch support for SVM ranges, utilizing the
>> existing ioctl vm_bind functionality to achieve this.
>>
>> v2: rebase
>>
>> v3:
>>     - use xa_for_each() instead of manual loop
>>     - check range is valid and in preferred location before adding to
>>       xarray
>>     - Fix naming conventions
>>     - Fix return condition as -ENODATA instead of -EAGAIN (Matthew Brost)
>>     - Handle sparsely populated cpu vma range (Matthew Brost)
>>
>> v4:
>>     - fix end address to find next cpu vma in case of -ENOENT
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pt.c |  58 ++++++++---
>>   drivers/gpu/drm/xe/xe_vm.c | 208 +++++++++++++++++++++++++++++++++++--
>>   2 files changed, 245 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index de4e3edda758..f3a99ee4f733 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -1458,6 +1458,7 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
>>   	struct xe_vm *vm = pt_update->vops->vm;
>>   	struct xe_vma_ops *vops = pt_update->vops;
>>   	struct xe_vma_op *op;
>> +	unsigned long i;
>>   	int err;
>>   
>>   	err = xe_pt_pre_commit(pt_update);
>> @@ -1467,20 +1468,35 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
>>   	xe_svm_notifier_lock(vm);
>>   
>>   	list_for_each_entry(op, &vops->list, link) {
>> -		struct xe_svm_range *range = op->map_range.range;
>> +		struct xe_svm_range *range = NULL;
>>   
>>   		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
>>   			continue;
>>   
>> -		xe_svm_range_debug(range, "PRE-COMMIT");
>> +		if (op->base.op == DRM_GPUVA_OP_PREFETCH) {
>> +			xe_assert(vm->xe,
>> +				  xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.prefetch.va)));
>> +			xa_for_each(&op->prefetch_range.range, i, range) {
>> +				xe_svm_range_debug(range, "PRE-COMMIT");
>>   
>> -		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
>> -		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
>> +				if (!xe_svm_range_pages_valid(range)) {
>> +					xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
>> +					xe_svm_notifier_unlock(vm);
>> +					return -ENODATA;
>> +				}
>> +			}
>> +		} else {
>> +			xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
>> +			xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
>> +			range = op->map_range.range;
>>   
>> -		if (!xe_svm_range_pages_valid(range)) {
>> -			xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
>> -			xe_svm_notifier_unlock(vm);
>> -			return -EAGAIN;
>> +			xe_svm_range_debug(range, "PRE-COMMIT");
>> +
>> +			if (!xe_svm_range_pages_valid(range)) {
>> +				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
>> +				xe_svm_notifier_unlock(vm);
>> +				return -EAGAIN;
>> +			}
>>   		}
>>   	}
>>   
>> @@ -2065,11 +2081,20 @@ static int op_prepare(struct xe_vm *vm,
>>   	{
>>   		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>>   
>> -		if (xe_vma_is_cpu_addr_mirror(vma))
>> -			break;
>> +		if (xe_vma_is_cpu_addr_mirror(vma)) {
>> +			struct xe_svm_range *range;
>> +			unsigned long i;
>>   
>> -		err = bind_op_prepare(vm, tile, pt_update_ops, vma, false);
>> -		pt_update_ops->wait_vm_kernel = true;
>> +			xa_for_each(&op->prefetch_range.range, i, range) {
>> +				err = bind_range_prepare(vm, tile, pt_update_ops,
>> +							 vma, range);
>> +				if (err)
>> +					return err;
>> +			}
>> +		} else {
>> +			err = bind_op_prepare(vm, tile, pt_update_ops, vma, false);
>> +			pt_update_ops->wait_vm_kernel = true;
>> +		}
>>   		break;
>>   	}
>>   	case DRM_GPUVA_OP_DRIVER:
>> @@ -2273,9 +2298,16 @@ static void op_commit(struct xe_vm *vm,
>>   	{
>>   		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>>   
>> -		if (!xe_vma_is_cpu_addr_mirror(vma))
>> +		if (xe_vma_is_cpu_addr_mirror(vma)) {
>> +			struct xe_svm_range *range = NULL;
>> +			unsigned long i;
>> +
>> +			xa_for_each(&op->prefetch_range.range, i, range)
>> +				range_present_and_invalidated_tile(vm, range, tile->id);
>> +		} else {
>>   			bind_op_commit(vm, tile, pt_update_ops, vma, fence,
>>   				       fence2, false);
>> +		}
>>   		break;
>>   	}
>>   	case DRM_GPUVA_OP_DRIVER:
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 555ed10dac85..14c01e155cb7 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -798,10 +798,33 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
>>   }
>>   ALLOW_ERROR_INJECTION(xe_vma_ops_alloc, ERRNO);
>>   
>> +static void xe_vma_svm_prefetch_op_fini(struct xe_vma_op *op)
>> +{
>> +	struct xe_vma *vma;
>> +
>> +	vma = gpuva_to_vma(op->base.prefetch.va);
>> +
>> +	if (op->base.op == DRM_GPUVA_OP_PREFETCH && xe_vma_is_cpu_addr_mirror(vma))
>> +		xa_destroy(&op->prefetch_range.range);
>> +}
>> +
>> +static void xe_vma_svm_prefetch_ops_fini(struct xe_vma_ops *vops)
>> +{
>> +	struct xe_vma_op *op;
>> +
>> +	if (!(vops->flags & XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH))
>> +		return;
>> +
>> +	list_for_each_entry(op, &vops->list, link)
>> +		xe_vma_svm_prefetch_op_fini(op);
>> +}
>> +
>>   static void xe_vma_ops_fini(struct xe_vma_ops *vops)
>>   {
>>   	int i;
>>   
>> +	xe_vma_svm_prefetch_ops_fini(vops);
>> +
>>   	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
>>   		kfree(vops->pt_update_ops[i].ops);
>>   }
>> @@ -2248,13 +2271,40 @@ static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm *vm, u32 bind_flags)
>>   	return true;
>>   }
>>   
>> +static void xe_svm_prefetch_gpuva_ops_fini(struct drm_gpuva_ops *ops)
>> +{
>> +	struct drm_gpuva_op *__op;
>> +
>> +	drm_gpuva_for_each_op(__op, ops) {
>> +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>> +
>> +		xe_vma_svm_prefetch_op_fini(op);
>> +	}
>> +}
>> +
>> +static u64 find_cpu_vma_start_in_range(struct mm_struct *mm, u64 start, u64 end)
> 
> Ideally we should move this to GPU SVM as we shouldn't be looking CPU
> VMAs in driver code rather the common DRM code.
> 
> With that, then a xe_svm layer wrapper too.

Sure will do that.

> 
>> +{
>> +	struct vm_area_struct *vma;
>> +	u64 addr = 0;
>> +
>> +	mmap_read_lock(mm);
>> +
>> +	vma = find_vma_intersection(mm, start, end);
>> +	if (vma)
>> +		addr =  max(start, vma->vm_start);
>> +
>> +	mmap_read_unlock(mm);
>> +	return addr;
>> +}
>> +
>>   /*
>>    * Create operations list from IOCTL arguments, setup operations fields so parse
>>    * and commit steps are decoupled from IOCTL arguments. This step can fail.
>>    */
>>   static struct drm_gpuva_ops *
>> -vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>> -			 u64 bo_offset_or_userptr, u64 addr, u64 range,
>> +vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>> +			 struct xe_bo *bo, u64 bo_offset_or_userptr,
>> +			 u64 addr, u64 range,
>>   			 u32 operation, u32 flags,
>>   			 u32 prefetch_region, u16 pat_index)
>>   {
>> @@ -2262,6 +2312,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>>   	struct drm_gpuva_ops *ops;
>>   	struct drm_gpuva_op *__op;
>>   	struct drm_gpuvm_bo *vm_bo;
>> +	u64 range_end = addr + range;
>>   	int err;
>>   
>>   	lockdep_assert_held_write(&vm->lock);
>> @@ -2323,14 +2374,79 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>>   			op->map.invalidate_on_bind =
>>   				__xe_vm_needs_clear_scratch_pages(vm, flags);
>>   		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>> -			op->prefetch.region = prefetch_region;
>> -		}
>> +			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>> +
>> +			if (!xe_vma_is_cpu_addr_mirror(vma)) {
>> +				op->prefetch.region = prefetch_region;
>> +				break;
>> +			}
>>   
>> +			struct drm_gpusvm_ctx ctx = {
>> +			.read_only = xe_vma_read_only(vma),
>> +			.devmem_possible = IS_DGFX(vm->xe) &&
>> +					   IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
>> +			};
>> +
> 
> Does the compiler not complain for this declaration after an if
> statement. I though C rules were all declartions before logic.

AFAIK that changed with kernel moving to c11 standard from c89.
For readibility we still prefer all declaration before logic. But from 
compilation perspective it should be safe. Will fall back to 
declarations before logic it causes no harm.


> 
>> +			struct xe_svm_range *svm_range;
>> +			struct xe_tile *tile;
>> +			u8 id, tile_mask = 0;
>> +			u32 i;
>> +
>> +			for_each_tile(tile, vm->xe, id)
>> +				tile_mask |= 0x1 << id;
>> +
>> +			xa_init_flags(&op->prefetch_range.range, XA_FLAGS_ALLOC);
>> +			op->prefetch_range.region = prefetch_region;
>> +			op->prefetch_range.ranges_count = 0;
>> +alloc_next_range:
>> +			svm_range = xe_svm_range_find_or_insert(vm, addr, vma, &ctx);
>> +
>> +			if (PTR_ERR(svm_range) == -ENOENT) {
>> +				addr = find_cpu_vma_start_in_range(vm->svm.gpusvm.mm,
>> +								   max(addr, xe_vma_start(vma)),
>> +								   min(range_end, xe_vma_end(vma)));
>> +				if (addr)
>> +					goto alloc_next_range;
> 
> Won't this cause a problem in xe_svm_range_end(svm_range) below as
> svm_range is PTR_ERR?

goto is to alloc_next_range not to check_next_range, there is no 
xe_svm_range_end() here.

> 
>> +				else
>> +					continue;
> 
> s/continue/goto print_op_label/

Sure

> 
>> +			}
>> +
>> +			if (IS_ERR(svm_range)) {
>> +				err = PTR_ERR(svm_range);
>> +				goto unwind_prefetch_ops;
>> +			}
>> +
>> +			if (xe_svm_range_validate_and_evict(vm, svm_range,
>> +							    tile_mask, !!prefetch_region))
>> +				goto check_next_range;
>> +
>> +			err = xa_alloc(&op->prefetch_range.range,
>> +				       &i, svm_range, xa_limit_32b,
>> +				       GFP_KERNEL);
>> +
>> +			if (err)
>> +				goto unwind_prefetch_ops;
>> +
>> +			op->prefetch_range.ranges_count++;
>> +			vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH;
>> +check_next_range:
>> +			if (range_end > xe_svm_range_end(svm_range) &&
>> +			    xe_svm_range_end(svm_range) < xe_vma_end(vma)) {
>> +				addr = xe_svm_range_end(svm_range);
>> +				goto alloc_next_range;
>> +			}
>> +		}
> 
> print_op_label:

Sure.

> 
>>   		print_op(vm->xe, __op);
>>   	}
>>   
>>   	return ops;
>> +
>> +unwind_prefetch_ops:
>> +	xe_svm_prefetch_gpuva_ops_fini(ops);
>> +	drm_gpuva_ops_free(&vm->gpuvm, ops);
>> +	return ERR_PTR(err);
>>   }
>> +
>>   ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
>>   
>>   static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>> @@ -2645,8 +2761,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>>   					return err;
>>   			}
>>   
>> -			if (!xe_vma_is_cpu_addr_mirror(vma))
>> +			if (xe_vma_is_cpu_addr_mirror(vma))
>> +				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask,
>> +							      op->prefetch_range.ranges_count);
>> +			else
>>   				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
>> +
>>   			break;
>>   		default:
>>   			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>> @@ -2772,6 +2892,50 @@ static int check_ufence(struct xe_vma *vma)
>>   	return 0;
>>   }
>>   
>> +static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>> +{
>> +	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>> +	int err = 0;
>> +
>> +	struct xe_svm_range *svm_range;
>> +	struct xe_tile *tile;
>> +	unsigned long i;
>> +	u32 region;
>> +
>> +	if (!xe_vma_is_cpu_addr_mirror(vma))
>> +		return 0;
>> +	region = op->prefetch_range.region;
>> +	struct drm_gpusvm_ctx ctx = {
>> +		.read_only = xe_vma_read_only(vma),
>> +		.devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
>> +		.check_pages_threshold = IS_DGFX(vm->xe) &&
>> +					 IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
>> +		.devmem_only = region && IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
>> +	};
> 
> 
> Same question here about a declartion after logic, pretty sure some
> compilers will complain.

Will address it in next version.

> 
> Matt
> 
>> +	/* TODO: Threading the migration */
>> +	xa_for_each(&op->prefetch_range.range, i, svm_range) {
>> +		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
>> +			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
>> +			err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
>> +			if (err) {
>> +				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
>> +					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
>> +				return -ENODATA;
>> +			}
>> +		}
>> +
>> +		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
>> +		if (err) {
>> +			if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
>> +				err = -ENODATA;
>> +			drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
>> +				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
>> +			return err;
>> +		}
>> +	}
>> +	return err;
>> +}
>> +
>>   static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>>   			    struct xe_vma_op *op)
>>   {
>> @@ -2809,7 +2973,12 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>>   	case DRM_GPUVA_OP_PREFETCH:
>>   	{
>>   		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>> -		u32 region = op->prefetch.region;
>> +		u32 region;
>> +
>> +		if (xe_vma_is_cpu_addr_mirror(vma))
>> +			region = op->prefetch_range.region;
>> +		else
>> +			region = op->prefetch.region;
>>   
>>   		xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
>>   
>> @@ -2828,6 +2997,25 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>>   	return err;
>>   }
>>   
>> +static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops)
>> +{
>> +	struct xe_vma_op *op;
>> +	int err;
>> +
>> +	if (!(vops->flags & XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH))
>> +		return 0;
>> +
>> +	list_for_each_entry(op, &vops->list, link) {
>> +		if (op->base.op  == DRM_GPUVA_OP_PREFETCH) {
>> +			err = prefetch_ranges(vm, op);
>> +			if (err)
>> +				return err;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
>>   					   struct xe_vm *vm,
>>   					   struct xe_vma_ops *vops)
>> @@ -3478,7 +3666,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>   		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
>>   		u16 pat_index = bind_ops[i].pat_index;
>>   
>> -		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
>> +		ops[i] = vm_bind_ioctl_ops_create(vm, &vops, bos[i], obj_offset,
>>   						  addr, range, op, flags,
>>   						  prefetch_region, pat_index);
>>   		if (IS_ERR(ops[i])) {
>> @@ -3511,6 +3699,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>   	if (err)
>>   		goto unwind_ops;
>>   
>> +	err = vm_bind_ioctl_ops_prefetch_ranges(vm, &vops);
>> +	if (err)
>> +		goto unwind_ops;
>> +
>>   	fence = vm_bind_ioctl_ops_execute(vm, &vops);
>>   	if (IS_ERR(fence))
>>   		err = PTR_ERR(fence);
>> @@ -3580,7 +3772,7 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
>>   
>>   	xe_vma_ops_init(&vops, vm, q, NULL, 0);
>>   
>> -	ops = vm_bind_ioctl_ops_create(vm, bo, 0, addr, bo->size,
>> +	ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, bo->size,
>>   				       DRM_XE_VM_BIND_OP_MAP, 0, 0,
>>   				       vm->xe->pat.idx[cache_lvl]);
>>   	if (IS_ERR(ops)) {
>> -- 
>> 2.34.1
>>

