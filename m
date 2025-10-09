Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BE9CCD183
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 19:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7740B10EB00;
	Thu,  9 Oct 2025 19:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fBKFv6Bk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A5610EB00
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 19:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760037165; x=1791573165;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D/em+WX9m40HGqQ2ygNdyFNKTH2vzFO+D+wNpy3vKGs=;
 b=fBKFv6BkFRuvKRvKBVhnD1WZUY+XEW4LOU0Ibseonfl+UNpqdr4t6AFb
 Qb+LllN7vrZm12ZvWKPOhd8b+j36fy8GswWuhTH40tcB7gej4nVX/mhMT
 53Vgt/3cDADA1zTRQ4r6mcMGkfEMdUQsbPGagC1mDXTfFfdilkXNwFcu/
 MNrFjudhFh/kGWuCxCUs4Gu3Om6wQlH8qmA1Xb1Ty/NFrCVbmaMRMWBz/
 66jfabmGAaLf7fruIMRbmybz13wQ3XPZI3/D94+fSX79Qf2g2l67pLTha
 RbreAzZUR91zPL4m+vCAS63wMYjwG8g16Ngtu0SF2hIo9kJTYbIgTpNMu w==;
X-CSE-ConnectionGUID: 8jg4yfWJQi2j4w90zu+hXg==
X-CSE-MsgGUID: 2T3+eWTqQSGGd7rxGw/wow==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="72870173"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="72870173"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 12:12:45 -0700
X-CSE-ConnectionGUID: +QlqPt+3S2uArrBBxxMtRg==
X-CSE-MsgGUID: 7+OBRsb1Spah4XAXjRdqoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="185044500"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 12:12:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 12:12:44 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 12:12:44 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.64) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 12:12:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jo9+PCpQOpKIQjkqW8m0NdmStZrZcStsi06aiC/M+tmdCEprlgfFsxI8tYs1AiuVvd3yGyCenrZE1A/IEVzjz7GMeYG7Vuv4HiJdBvIHsdsqaUeRGSSUlynxCdORfEU1zTBTINNQ7RiSyRsxuvFTV2vVTc2uVfR6veWXuumZO5/+Z8MCJFytfzIw7zX2M3tudPDByi3GaFCkMkP5GLVUH72s1AhGMzhzlYtDL10zpI57MCTxAkh0zmv5xNXxY5737hcgEkON+Ee5igDPSLhubilCBXmhI8EcZZmZFcywsaFIpihkh3hAhjgvFS0MYiK+7OgZqHdrMDo40SoG5VnoFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbf2hoGbxPZBwawrbUdbYVtJ2ZQ2hKDRDH1IymvCcBs=;
 b=YhJRKzx+4TO1fj2qfzSK8SnGU4vW3kWgDAgtW6jIWNgwCHVPesEiao5WcrTj7V22CFylIENIMKW8z+v0FDe3yS+KEfnNsHHE+e5aR2G7CofXqIVuQwtCuomy2Ld+C7bSfA+VEuo3KP4Ml+99GxRvr46bJnQGxJK4ONnm9n6e9tyDmVbUgrlg2uOlPVkwz+Zykp9Hu1/OAk7B9jy6lkrS6CTfpvIoMbyo1trmLWyOUoBfWCqI8j7iimLj+hamalKa94qhxBIinIXB0V34FXibPadFoBnxZjEKDwKRzv127gg+Fwku+PV7YPjakXLcgnlcqrVIX8C3qjkwJUCuK3xP0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA3PR11MB8002.namprd11.prod.outlook.com (2603:10b6:806:2f6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 19:12:41 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 19:12:41 +0000
Message-ID: <a0317011-955f-4496-b316-f4e9c3be51f2@intel.com>
Date: Thu, 9 Oct 2025 21:12:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/xe/guc: Add prefix to guc log buffer macros
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20251002150302.99524-1-zhanjun.dong@intel.com>
 <20251002150302.99524-2-zhanjun.dong@intel.com>
 <pfqh62crf6qveer36aofmwom2zh7ihvqezaedmnsvb3lof7rjk@rnkpsetbrsb6>
 <b8f3e9b3-5665-418b-ad21-eac33886ebce@intel.com>
 <ybfj4vmezjeg4wyyacyluri4gznmahrpzgk5nn4db3ma32qmai@wvkya2ufpvfu>
 <b7c468c3-5366-4eb7-a962-daaae3e1d81d@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <b7c468c3-5366-4eb7-a962-daaae3e1d81d@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::12) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA3PR11MB8002:EE_
X-MS-Office365-Filtering-Correlation-Id: 46c67356-4247-4d0e-1eaf-08de0767d1a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEF6YmREakIybUhOOWpoK1lHb2dDR291NlVXd3BZTk9ONGdmeG1kWUtkcHZE?=
 =?utf-8?B?aVRoQnorNUF6TFRFZldPTTdGQm84ZURINWUwOEErRytrcVRTQzk0Q3oxNVA0?=
 =?utf-8?B?SmJPZFV5TkhEVE9rVzB1WllKY2IxZ2NlN2pDSUljSUw5VkxKVFlDTlNab05M?=
 =?utf-8?B?QXNDZ1pGNVluS29BRGxFQVpyUi9TamRqd3NLQzBSZ0hsTDJxWjlxV1Fvenoy?=
 =?utf-8?B?UFJ3M2xsK1Z3NDRUdEt3bE5GNW0xaXVQNlhEdnh0TitlOVFFSlBTWDdORTVF?=
 =?utf-8?B?eGUzSTRGYWxJbXhUMC9JZWxxK1dmdEx1c1BXRFRtencvWVFMWW9hZGIzeHhN?=
 =?utf-8?B?REl0OWdEUWR6RmEzMjNqS1FWS2dhL05DaWtIbGc3YlIvVXQ2Y1pYUXhsbFpV?=
 =?utf-8?B?RW53ZVV1aU1XOVRBNEozQkZyalRSU0dNMUdwUDBleU5sVm9OSUlnUzhYZEJ4?=
 =?utf-8?B?Z00rWFBqbE1EdTloTHJjSk5FMyt6aERDSTVvYWdsS0Zwa2dwV0lCK2greTJK?=
 =?utf-8?B?NUxZMzZGbC9TSkc1RjhYNWJUOTNsblM5Q3JQditRQkFWVW9wRTJxVnRFVXhY?=
 =?utf-8?B?TUNmd0VLZjNKNUMwN2hNVFVkRE5Jc0lGR2tDNXptbENKWndDSzV1Y2VCNjA3?=
 =?utf-8?B?cGFGRVUvQUpFb1hRRDljZEl2cUN4bnRMdTl3cVR5L2g4RE1OV1ErL2lLTXdh?=
 =?utf-8?B?YTJlVEcxQVk2VlpIdHZTeGtjTkpxM2NtTUc4RUd5RUdmVlJIbVBXQVNGOVU5?=
 =?utf-8?B?dWdGR2w1Yyt6Y21uL0hGbVpkNFNLaFJORGhRSWM3aUlEWFkwc2h2VjM1WXRx?=
 =?utf-8?B?TzlGL3IreVl4NEkwZENLdzdmS093cnM4Qll2MWo0MWFSU2tXalVDRzB1TTgz?=
 =?utf-8?B?RjNLMnRrR1Y5VThhQktKMlJXUnlYYVdMbDBIU3FVR1BYZERrQWk3NWpXTTI1?=
 =?utf-8?B?a2dGOUVvdmJGaXBZTit4UmhsQjFHQ0sycmI0dDdEY0k0OEJTQ2cxdExaVWMy?=
 =?utf-8?B?YndjOHY2L3J5L0VSUFpZTFdzWkpqcGFKTU5uc2N2LzVFRGF5QXBnSlBLVnVZ?=
 =?utf-8?B?OWY2ZEE5QXVvTEVOZ1hyZ1lKT0hVVHBiL1VXT1FhU1d5bHFyRXd5MGo4Y1NT?=
 =?utf-8?B?UUZ2M1ZEUTlmbWpILzlRVXZkN3Bwb29xNXVhNXNvZ040TDJDTDRVb011TEt3?=
 =?utf-8?B?RXFLZkZ4OW84TEpDN1ZqY01xV1NJUllhclMySTFyc3N0d2pSR29qMC83amo2?=
 =?utf-8?B?WmFiL0NPTUZMcUVDaHBDalBhc1BzWGRwN3BQaDdrUkROc2NuWm0vSlRjT3k1?=
 =?utf-8?B?QUtYeURyRGphalhPVFVXRFJqQjhGYm1xdDZSTHlmeTJXY29uSWhMRWtLMzU4?=
 =?utf-8?B?ZE5hdDFrRTBPTDk5KzIvVTgyNUo5STBrN3hXbitUZWFrSUJseTFSSHM1N3Ja?=
 =?utf-8?B?NmFxVUFYNE5tV3IyOEMxcFRBY3JHYTMvejl3WEZDUGNCRGNkTThxcFlYYVZB?=
 =?utf-8?B?MWN0SzBFSnRHMFNIRTVYNk0rQUZtb1R4VHltaVpRRm4zM1JUNDNUQWExaktq?=
 =?utf-8?B?N2pmdkNzQklOKzRoVkNKSnE3cnQydjU1ZkNBNkhxc2tyeTNTY1E5YnlIbTQ3?=
 =?utf-8?B?M1lzbzNnTi9sQzN4Z0dtQitQc09CVUpsQlVFZTFZTGFaVVdUWms5eFBTSEFu?=
 =?utf-8?B?QTNzcE8ra0x3eEMwQ09ZZ1JaTFo2Y0JzWVdFWk1oNXBSOHlTV2QzemJPY2Na?=
 =?utf-8?B?ZWZHdFVOb2dnNFl2SHJRdFBRSU9pRm90ZUVrQTFaK0tqWHhPR1g3SmlySFVO?=
 =?utf-8?B?SjVaREQ1Qlp3eXVFenV6c2picXZYRDFvMmhBR0Zxei9iekE0T2xhUkxRNzFV?=
 =?utf-8?B?RURmQTBwV3E0VTNOMGorZ1BMcG5xZEdMRXFQZlJjU1YvNmIwdlVnRVY0OUJ2?=
 =?utf-8?Q?bdzGHz3/T7DVwxkNnzNZ7AOGlTyWi7ck?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGxCK0grMzROcVdwNkFQSmo5SXAxdGFlY0k5aFpsaGEzMzNyKzhYT21MY3pq?=
 =?utf-8?B?VXg2R0JZcHlta2w1ZUlCeWc1d0RZVTFQUzJ0c3RWbDZWeHRUdmNhQmtnbHlJ?=
 =?utf-8?B?ZkRDdmpBTm5BS3RBdi9wdjJDY2NoaUY3c0psN2JCeWpPWW9hUURacUk4aVN0?=
 =?utf-8?B?UFFIanR6WVBMQ3dERzBTOTE3VVdRN01lTThsTjhxT3pCRm9SQ0lBU2NPL0Fs?=
 =?utf-8?B?ZVNzd2ZWdjlxdExyNmxtemt0U28yK1R0Z0JUbkV3R0hicUVSSFVHQk1za0p4?=
 =?utf-8?B?TWRIYTNoL3NpcWxoTUNJWm40OTk4RStQWjhKYWlTZXgzZVJYRjNTYjFQQWpC?=
 =?utf-8?B?RWg3bjFuWGdYUEVubnZPRnRmSHhQOHBIblV6NVcwbFcwTU4ySS9RWkV1QlFF?=
 =?utf-8?B?bThFbW1RMmduWER4Tmlqc0FLYTUwRnh6b3ZRMFR5S20xNFV4Ky9wYTM0QTlP?=
 =?utf-8?B?UWd2Q2pobHhWNFZGTHN6QTBXYXNhN3hpblE3M1hheWwyOUNCOFpLN3BLbEVR?=
 =?utf-8?B?S2NTQXlnV2dIeVpaODZjM1I4OGQwOE9TektaNm5aRjlOdVd1VDBhR1YxcGY4?=
 =?utf-8?B?WnNJcXVVTkthMUw0QVNRNG94L1Vpck9SYmVUazJNbG1RZWhlQ0R3SUtCRktC?=
 =?utf-8?B?T01scUhrenVmTmtBeCtRZ0NBa3NQeHZ6QmliZnF6TlIvbGdYZHczN3FsMkdi?=
 =?utf-8?B?WTZPVXBuMll2R2M2dWdOM1AxSkN5OWo4RHoxWTBnU0J2WmdxbkNDZmNMUGZW?=
 =?utf-8?B?eFI2UGxqRURPTTVacTd5WDJKOGlaMm9lNWpOeUtGM20zNXF4ZXo2UmNSZnlt?=
 =?utf-8?B?RHp4WWpEMDJEMEFyR2hYN2xDNmpwcVhtUFpjK0lFK2hwUmZ4aEovSUg0alN6?=
 =?utf-8?B?M0RjSE1FN0Mxb0JRTzh1OS95WXZPa3BlemNzb1AwS1dQZDJWZU9HeCtTK3ZB?=
 =?utf-8?B?VjJKeXpwdnN6SnR0ZFFEL1FOamtVNit4TGhhS2VROWdzTUdEUnN3TUVYS1c5?=
 =?utf-8?B?UFFwZlRSNGp3NEplb0xIOXBhY3Y1M0pxWHhUNXdEdnN0SE5KOW1LdG8vcEtG?=
 =?utf-8?B?ZXJTajFUNytsdXkvNGpkenJKNGlkZ1F2WG1Kcjc2cjNFWDQxeHc0UTg5M2hu?=
 =?utf-8?B?Y0lEMnVIR3JOdXFFTG9jTXBLWE9JZFNnTy8rcHpZeVczZEdPSHdWYmtqZVpH?=
 =?utf-8?B?QnJ1SWVGdzRzSU1EdWoxYXFZSERjSGxzNDJOZmFMVml4K1k2NjNwNzJFYTY5?=
 =?utf-8?B?MDRMZDlOdDRydlNIdnRzSCtUOEMvNkpQVnVFc1NEc2ozMnppTHJvb1lob0xK?=
 =?utf-8?B?QlJ0Z1lVN3F2dGlwTkp3bnBVSHYyWWQwUktZd1VybUFkemZROGVTYkJEQk1j?=
 =?utf-8?B?bU0wUGRUdFczU0NLbWh0VUNQY09idzZLV29VM2l5akliN0xBcFE4RW0zZ2JE?=
 =?utf-8?B?YnJmNllTV1ZqVmE4S3ZqNnJzZHYzMmFpaEN6YXI0UDZtV3hVNmVCWHNnL2Ez?=
 =?utf-8?B?WHgzRk9sd1h2ZmN6YU5tb1NPVzRLSDRJSUhNRlJ3MXN6V21Rdk8vQmdOOGRt?=
 =?utf-8?B?L09xMGkrN0kyTmcyTjc2OFhSdG9aWUo2eER2c3dRaEVsaEVBRU8yRUZyelkr?=
 =?utf-8?B?TEZhRktyWlFla1FXTGU3OHd6cERzQ2Y0eTBDcklXanNYTnQxM0JLQjRhcmFI?=
 =?utf-8?B?bVVXMC9seU0zWFA2OU5RSmFRaXpQQ3VQVlFGVnc5eTltN1R5NitMRFRKWnZV?=
 =?utf-8?B?dHhSUHFqSHd6T0QxSFQ1Yi8xMG55eVg5TndsMkZDSmhFUkt5cTNOZEY5Vk5U?=
 =?utf-8?B?NnhmVDcwWVBNMENTRVg3UzhUZnFULzVXTDFsMVMvbHhqd2wxVzBvdHJ3NzRa?=
 =?utf-8?B?dGF0RXdCQ3hLTkF2Q3R0b0tqemI2UEZ2Q1JEUW11V1REVEVzY3dUVjA3QTdp?=
 =?utf-8?B?T2Z3a1FXVytFUFh6cWdPeDhvN2ZoV1ZaNjJxVDQ2SFl0RHlHbnN5OWwwMjRn?=
 =?utf-8?B?c2t3NzdUMHpGdDI1WnFmZFBob3dOSklCVjIzM1BuU1JESDZJdGo4a0ZQSmdj?=
 =?utf-8?B?dGFSOFhFbEh1a3BUSzhaeEFLdnN4VEdZazIrWit1V042eDhpZkRxVXpUS2tk?=
 =?utf-8?B?b2k0d013OGNJWTdPVHN1VzczL3BNQU0xdFJyNVpFOXhNTHpzZG9ZenFvWTBr?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c67356-4247-4d0e-1eaf-08de0767d1a3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 19:12:41.5345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mMLg8mN3ttUPRBXTvj2wyiCns6ka04JL86cb4jsi9I7BTZfUR2K8uGfEP7PJXIbtPG3JN1Pt9VaSQS9kuQz//Bo+Xzd6zyPF3SmdEkUpRpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8002
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



On 10/9/2025 7:54 PM, Dong, Zhanjun wrote:
> 
> 
> On 2025-10-07 1:08 p.m., Lucas De Marchi wrote:
>> On Tue, Oct 07, 2025 at 12:44:59PM -0400, Dong, Zhanjun wrote:
>>>
>>>
>>> On 2025-10-02 12:00 p.m., Lucas De Marchi wrote:
>>>> On Thu, Oct 02, 2025 at 11:03:01AM -0400, Zhanjun Dong wrote:
>>>>> Add prefix to GuC log buffer macros to follow Xe naming styles.
>>>>> Remove helper functions, replaced with macros.
>>>>>
>>>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>>>> ---
>>>>> drivers/gpu/drm/xe/xe_guc.c         | 22 ++++-----
>>>>> drivers/gpu/drm/xe/xe_guc_capture.c |  6 +--
>>>>> drivers/gpu/drm/xe/xe_guc_log.c     | 71 +++++++----------------------
>>>>> drivers/gpu/drm/xe/xe_guc_log.h     | 14 +++---
>>>>> 4 files changed, 36 insertions(+), 77 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>>> index d5adbbb013ec..b0ea9a13847a 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>>> @@ -99,7 +99,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>>>>>     u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
>>>>>     u32 flags;
>>>>>
>>>>> -    #if (((CRASH_BUFFER_SIZE) % SZ_1M) == 0)
>>>>> +    #if (((XE_GUC_LOG_CRASH_BUFFER_SIZE) % SZ_1M) == 0)
>>>>
>>>> can you also add a patch to remove the excess use of parenthesis and
>>>> indentation? Should ahave been:
>>>>
>>>> #if XE_GUC_LOG_CRASH_BUFFER_SIZE % SZ_1M == 0
>>>>
>>>
>>> In case of CRASH_BUFFER_SIZE defined with expression like:
>>>
>>> SZ_2M - SZ_1M
>>
>> but it's not defined like that. If you need to define it like that then
>> the right define would be:
>>
>> #define XE_GUC_LOG_CRASH_BUFFER_SIZE (SZ_2M - SZ_1M)
>>
>> so the callers may use normal precedence rules without worrying how it's
>> implemented.
> 
> Yes, it's not defined like that.
> 
> My concern is who response for ensure the operator precedence, I think it should be the macro, who contains the operator, response to ensure that,
> so that would be:
> 
> #define plus(a, b)   (a) + (b)

this is wrong, it should be defined as:

#define plus(a, b)   ((a) + (b))

> 
> The plus response for that, not a and b. So if a or b changed at later time, the plus still works.
> 
> Regards,
> Zhanjun Dong
> 
>>
>> Lucas De Marchi
>>
>>>
>>> expanded macro would be
>>>  #if  SZ_2M - SZ_1M % SZ_1M == 0
>>>
>>> due to '%' op is higher than '-'
>>> SZ_1M % SZ_1M is 0
>>> SZ_2M - 0 is SZ_2M
>>> SZ_2M != 0
>>> Result: false
>>>
>>> That gives us unwantted result, expected should be:
>>> (SZ_2M - SZ_1M)  % SZ_1M == 0
>>> Result: true
>>>
>>> We might still need parenthesis to prevent operator precedence issues
>>>
>>>>
>>>>
>>>>>     #define LOG_UNIT SZ_1M
>>>>>     #define LOG_FLAG GUC_LOG_LOG_ALLOC_UNITS
>>>>>     #else
>>>>> @@ -107,7 +107,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>>>>>     #define LOG_FLAG 0
>>>>>     #endif
>>>>>
>>>>> -    #if (((CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
>>>>> +    #if (((XE_GUC_LOG_CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
>>>>
>>>> ditto
>>>>
>>>>>     #define CAPTURE_UNIT SZ_1M
>>>>>     #define CAPTURE_FLAG GUC_LOG_CAPTURE_ALLOC_UNITS
>>>>>     #else
>>>>> @@ -115,20 +115,20 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>>>>>     #define CAPTURE_FLAG 0
>>>>>     #endif
>>>>>
>>>>> -    BUILD_BUG_ON(!CRASH_BUFFER_SIZE);
>>>>> -    BUILD_BUG_ON(!IS_ALIGNED(CRASH_BUFFER_SIZE, LOG_UNIT));
>>>>> -    BUILD_BUG_ON(!DEBUG_BUFFER_SIZE);
>>>>> -    BUILD_BUG_ON(!IS_ALIGNED(DEBUG_BUFFER_SIZE, LOG_UNIT));
>>>>> -    BUILD_BUG_ON(!CAPTURE_BUFFER_SIZE);
>>>>> -    BUILD_BUG_ON(!IS_ALIGNED(CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
>>>>> +    BUILD_BUG_ON(!XE_GUC_LOG_CRASH_BUFFER_SIZE);
>>>>> +    BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_CRASH_BUFFER_SIZE, LOG_UNIT));
>>>>> +    BUILD_BUG_ON(!XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE);
>>>>> +    BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE, LOG_UNIT));
>>>>> +    BUILD_BUG_ON(!XE_GUC_LOG_CAPTURE_BUFFER_SIZE);
>>>>> +    BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
>>>>>
>>>>>     flags = GUC_LOG_VALID |
>>>>>         GUC_LOG_NOTIFY_ON_HALF_FULL |
>>>>>         CAPTURE_FLAG |
>>>>>         LOG_FLAG |
>>>>> -        FIELD_PREP(GUC_LOG_CRASH, CRASH_BUFFER_SIZE / LOG_UNIT - 1) |
>>>>> -        FIELD_PREP(GUC_LOG_DEBUG, DEBUG_BUFFER_SIZE / LOG_UNIT - 1) |
>>>>> -        FIELD_PREP(GUC_LOG_CAPTURE, CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) |
>>>>> +        FIELD_PREP(GUC_LOG_CRASH, XE_GUC_LOG_CRASH_BUFFER_SIZE / LOG_UNIT - 1) |
>>>>> +        FIELD_PREP(GUC_LOG_DEBUG, XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE / LOG_UNIT - 1) |
>>>>> +        FIELD_PREP(GUC_LOG_CAPTURE, XE_GUC_LOG_CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) |
>>>>>         FIELD_PREP(GUC_LOG_BUF_ADDR, offset);
>>>>>
>>>>>     #undef LOG_UNIT
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/ xe/ xe_guc_capture.c
>>>>> index 243dad3e2418..acb95a93b530 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>>>>> @@ -816,7 +816,7 @@ static void check_guc_capture_size(struct xe_guc *guc)
>>>>> {
>>>>>     int capture_size = guc_capture_output_size_est(guc);
>>>>>     int spare_size = capture_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
>>>>> -    u32 buffer_size = xe_guc_log_section_size_capture(&guc->log);
>>>>> +    u32 buffer_size = XE_GUC_LOG_CAPTURE_BUFFER_SIZE;
>>>>>
>>>>>     /*
>>>>>      * NOTE: capture_size is much smaller than the capture region
>>>>> @@ -922,7 +922,7 @@ guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *no
>>>>>  *                  ADS module also calls separately for PF vs VF.
>>>>>  *
>>>>>  *     --> alloc B: GuC output capture buf (registered via guc_init_params(log_param))
>>>>> - *                  Size = #define CAPTURE_BUFFER_SIZE (warns if on too-small)
>>>>> + *                  Size = #define XE_GUC_LOG_CAPTURE_BUFFER_SIZE (warns if on too-small)
>>>>>  *                  Note2: 'x 3' to hold multiple capture groups
>>>>>  *
>>>>>  * GUC Runtime notify capture:
>>>>> @@ -1368,7 +1368,7 @@ static void __guc_capture_process_output(struct xe_guc *guc)
>>>>>     xe_map_memcpy_from(guc_to_xe(guc), &log_buf_state_local, &guc-
>>>>>> log.bo->vmap,
>>>>>                log_buf_state_offset, sizeof(struct guc_log_buffer_state));
>>>>>
>>>>> -    buffer_size = xe_guc_get_log_buffer_size(&guc->log, GUC_LOG_BUFFER_CAPTURE);
>>>>> +    buffer_size = XE_GUC_LOG_CAPTURE_BUFFER_SIZE;
>>>>>     read_offset = log_buf_state_local.read_ptr;
>>>>>     write_offset = log_buf_state_local.sampled_write_ptr;
>>>>>     full_count = FIELD_GET(GUC_LOG_BUFFER_STATE_BUFFER_FULL_CNT, log_buf_state_local.flags);
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/ xe_guc_log.c
>>>>> index c01ccb35dc75..fa1d490dca0d 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>>>>> @@ -50,16 +50,16 @@ static size_t guc_log_size(void)
>>>>>      *  |     Capture state header      |
>>>>>      *  +-------------------------------+ 96B
>>>>>      *  |                               |
>>>>> -     *  +===============================+ PAGE_SIZE (4KB)
>>>>> +     *  +===============================+ 4KB
>>>>> +     *  |          Event logs           |
>>>>> +     *  +===============================+ + XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE
>>>>>      *  |        Crash Dump logs        |
>>>>> -     *  +===============================+ + CRASH_SIZE
>>>>> -     *  |          Debug logs           |
>>>>> -     *  +===============================+ + DEBUG_SIZE
>>>>
>>>> what happened with DEBUG_SIZE? in drivers/gpu/drm/xe/xe_guc.c it's
>>>> referred as DEBUG_BUFFER_SIZE
>>>>
>>>> Lucas De Marchi
>>>>
>>>>> +     *  +===============================+ + XE_GUC_LOG_CRASH_BUFFER_SIZE
>>>>>      *  |         Capture logs          |
>>>>> -     *  +===============================+ + CAPTURE_SIZE
>>>>> +     *  +===============================+ + XE_GUC_LOG_CAPTURE_BUFFER_SIZE
>>>>>      */
>>>>> -    return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
>>>>> -        CAPTURE_BUFFER_SIZE;
>>>>> +    return SZ_4K + XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE + XE_GUC_LOG_CRASH_BUFFER_SIZE +
>>>>> +        XE_GUC_LOG_CAPTURE_BUFFER_SIZE;
>>>
>>> The comment in layout is DEBUG_SIZE, while code is DEBUG_BUFFER_SIZE,
>>> will cleanup in next rev
>>>
>>> Regards,
>>> Zhanjun Dong
>>>
>>>>> }
>>>>>
>>>>> #define GUC_LOG_CHUNK_SIZE    SZ_2M
>>>>> @@ -274,49 +274,6 @@ int xe_guc_log_init(struct xe_guc_log *log)
>>>>>
>>>>> ALLOW_ERROR_INJECTION(xe_guc_log_init, ERRNO); /* See xe_pci_probe() */
>>>>>
>>>>> -static u32 xe_guc_log_section_size_crash(struct xe_guc_log *log)
>>>>> -{
>>>>> -    return CRASH_BUFFER_SIZE;
>>>>> -}
>>>>> -
>>>>> -static u32 xe_guc_log_section_size_debug(struct xe_guc_log *log)
>>>>> -{
>>>>> -    return DEBUG_BUFFER_SIZE;
>>>>> -}
>>>>> -
>>>>> -/**
>>>>> - * xe_guc_log_section_size_capture - Get capture buffer size within log sections.
>>>>> - * @log: The log object.
>>>>> - *
>>>>> - * This function will return the capture buffer size within log sections.
>>>>> - *
>>>>> - * Return: capture buffer size.
>>>>> - */
>>>>> -u32 xe_guc_log_section_size_capture(struct xe_guc_log *log)
>>>>> -{
>>>>> -    return CAPTURE_BUFFER_SIZE;
>>>>> -}
>>>>> -
>>>>> -/**
>>>>> - * xe_guc_get_log_buffer_size - Get log buffer size for a type.
>>>>> - * @log: The log object.
>>>>> - * @type: The log buffer type
>>>>> - *
>>>>> - * Return: buffer size.
>>>>> - */
>>>>> -u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type)
>>>>> -{
>>>>> -    switch (type) {
>>>>> -    case GUC_LOG_BUFFER_CRASH_DUMP:
>>>>> -        return xe_guc_log_section_size_crash(log);
>>>>> -    case GUC_LOG_BUFFER_DEBUG:
>>>>> -        return xe_guc_log_section_size_debug(log);
>>>>> -    case GUC_LOG_BUFFER_CAPTURE:
>>>>> -        return xe_guc_log_section_size_capture(log);
>>>>> -    }
>>>>> -    return 0;
>>>>> -}
>>>>> -
>>>>> /**
>>>>>  * xe_guc_get_log_buffer_offset - Get offset in log buffer for a type.
>>>>>  * @log: The log object.
>>>>> @@ -327,13 +284,17 @@ u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type
>>>>>  */
>>>>> u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type)
>>>>> {
>>>>> -    enum guc_log_buffer_type i;
>>>>>     u32 offset = PAGE_SIZE;/* for the log_buffer_states */
>>>>>
>>>>> -    for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>>>>> -        if (i == type)
>>>>> -            break;
>>>>> -        offset += xe_guc_get_log_buffer_size(log, i);
>>>>> +    switch (type) {
>>>>> +    case GUC_LOG_BUFFER_CAPTURE:
>>>>> +        offset += XE_GUC_LOG_CRASH_BUFFER_SIZE;
>>>>> +        fallthrough;
>>>>> +    case GUC_LOG_BUFFER_CRASH_DUMP:
>>>>> +        offset += XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE;
>>>>> +        fallthrough;
>>>>> +    case GUC_LOG_BUFFER_DEBUG:
>>>>> +        break;
>>>>>     }
>>>>>
>>>>>     return offset;
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/ xe_guc_log.h
>>>>> index 98a47ac42b08..0cc059cedb9c 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>>>>> @@ -13,13 +13,13 @@ struct drm_printer;
>>>>> struct xe_device;
>>>>>
>>>>> #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>>>>> -#define CRASH_BUFFER_SIZE       SZ_1M
>>>>> -#define DEBUG_BUFFER_SIZE       SZ_8M
>>>>> -#define CAPTURE_BUFFER_SIZE     SZ_2M
>>>>> +#define XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE    SZ_8M
>>>>> +#define XE_GUC_LOG_CRASH_BUFFER_SIZE        SZ_1M
>>>>> +#define XE_GUC_LOG_CAPTURE_BUFFER_SIZE        SZ_2M
>>>>> #else
>>>>> -#define CRASH_BUFFER_SIZE    SZ_16K
>>>>> -#define DEBUG_BUFFER_SIZE    SZ_64K
>>>>> -#define CAPTURE_BUFFER_SIZE    SZ_1M
>>>>> +#define XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE    SZ_64K
>>>>> +#define XE_GUC_LOG_CRASH_BUFFER_SIZE        SZ_16K
>>>>> +#define XE_GUC_LOG_CAPTURE_BUFFER_SIZE        SZ_1M
>>>>> #endif
>>>>> /*
>>>>>  * While we're using plain log level in i915, GuC controls are much more...
>>>>> @@ -51,8 +51,6 @@ xe_guc_log_get_level(struct xe_guc_log *log)
>>>>>     return log->level;
>>>>> }
>>>>>
>>>>> -u32 xe_guc_log_section_size_capture(struct xe_guc_log *log);
>>>>> -u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type);
>>>>> u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type);
>>>>> bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log,
>>>>>                    enum guc_log_buffer_type type,
>>>>> -- 
>>>>> 2.34.1
>>>>>
>>>
> 

