Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73508C25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 10:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151AE10E44B;
	Tue,  4 Jun 2024 10:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bq18fQmn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04C610E44B
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 10:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717498330; x=1749034330;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xGla+9cO0nqu9pk2wgaIQgpPxVLQJ2NGrpZRWCqgvEM=;
 b=Bq18fQmn2gDFEJCpgO+LD0ytElUrJ7CrBEOIb/rwrN286JgF7TTSA3Ox
 lFBL2G7uZM1TjZifH+aANXWPX6N5nTOIV7dwzgs865/r0CRtDdJh/UiIO
 TYF1eN7MVzIwAut86DdZTc5Fd3o69TbpwOhHfejsPO3JqeLzr1tH+fX9u
 OQc09dPfIHzqG5/JE1ECQ2NigWZ4vG1nl83knxI5XCtJxHX/VsfaOUZFN
 X1mXFWztjBaHeu6g3teGh6KrDK8+w6W0e3UPJyRu8hzkd7uoQ7l1qOXJE
 9p9kawfGb68KnaczfdaysIE1i1hPES28fq2+M02pnCZP25eNTS3HRUZ4b A==;
X-CSE-ConnectionGUID: Nn/TPJZqQDagk3JjXHRpOg==
X-CSE-MsgGUID: kY3P0DZyS5+KzNru5kzNJw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="31570434"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="31570434"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 03:52:09 -0700
X-CSE-ConnectionGUID: 7xTiXrAfTAiwStGX5vMV9g==
X-CSE-MsgGUID: 9Y9746SOT4K+U1Kn0XJoYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="68363963"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jun 2024 03:52:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 03:52:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 4 Jun 2024 03:52:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 4 Jun 2024 03:52:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bERQlhgNLIDY7GCr738XbuavkeuWw6p97PhK8LbcedBKQhqXWjxn/9ltoedYYTTafkQsBvalsCZhHIiHFpbGpZ4n/IHihL7wot+at32NX2goeaLNBm21/7P4WONwmZor0nIdlYcHYYaBF958rkE/mNsJFBnU7B4JQ+88AeRWZxOKaZSARWBn84orYW1qdBYSYfhx38KwDZArUMlNsrP3NIhvlp0s2P0O0puB4uwwT7AU4cGKYwgDuaAyKWXYVvPn14YndEQsUX1M8mX9+QAX7YPK61WDV2tCBGLdpLEOuVipeKZSTj6Y1W5lw47OrdFKxx+aCSqIGAE4TOvbEGMf1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3KQUG+zA3ctL1E2zE23pxbOhsp9qfBUVi01E4ZEJ48=;
 b=QJvpRlDBKDTPXdkPl7I38XMerjvPeBnUGb8I30fVG7Q+/8Jlum15DnkfvGHX48aSA2WWEBZBT1v1zuLoXUp15VbrysctC0bi9zI93Aanbpf+OSlZK0FW0LRfDTIQkVAad+/S7uEjjWOnWhnVIIlNP0ocPwJilmN3XcZ6zwgx+f20o10hZMoKQBwCmXD0m1/YETAwSzKTb3BJ1QIk4ebaC5jsYUJ2Zn78vb8jyttGqRGoODFaWRrxOCREPRTuaz5XXelaInvuLpOMTxHfx2O8w6EQbMw61pRruSN0fSRA2l+6aijetoII7j7I1K0nappU1nCbzBnk2K6krtbWFUscSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA2PR11MB5019.namprd11.prod.outlook.com (2603:10b6:806:f8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Tue, 4 Jun
 2024 10:52:07 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%6]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 10:52:07 +0000
Message-ID: <8cc78563-5b65-40b7-b5d4-49fed52c6b88@intel.com>
Date: Tue, 4 Jun 2024 16:22:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix xe_force_wake_assert_held for enum
 XE_FORCEWAKE_ALL
To: Matt Roper <matthew.d.roper@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240530142533.875437-1-himal.prasad.ghimiray@intel.com>
 <40338a61-40df-4d29-9960-e0f96e9c9e8a@intel.com>
 <00281173-2316-4c6a-b69a-02b6902e08ec@intel.com>
 <b75a1731-8286-4a0f-8eed-015364c32052@intel.com>
 <20240603210336.GA2906448@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240603210336.GA2906448@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::28) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA2PR11MB5019:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e2242cb-ccd3-4086-3619-08dc84846057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHppdCtqN1FrRWtvRUQ1ZXJ2QlJPQzFUTXRJbW9WM3FiZURjSzVXdElQNlY1?=
 =?utf-8?B?WjF5Ui9XZnc3SDB3R09HZmlsM284S0F4Wlh1TkVERzZDWmZRQUFFR2MyeXRq?=
 =?utf-8?B?VE5NcjVxQnM1K092S04zUDZCTXJhWllqQ3d6eUsyVDlyd0llSG8xamNscStT?=
 =?utf-8?B?OWIzcHdsZE5DTDgxdGhiREk0OW5vSmNFcXJGdzQyY3hQOThUWnJ0MHdUV3Z6?=
 =?utf-8?B?ODNjNG9oVk5YTlFJOEYvZjlySU5lUDFzaUx2U2R0U1ZjZUl4dWkwL1ZtZ0xU?=
 =?utf-8?B?dXZGa2g5Uk42OWY1a0dEb0QvS0FRWXFNZEVPeGxKbk9DeGVDOVRZUFNDT0Zy?=
 =?utf-8?B?TkdDdjFEaVc0ekxDTmtUZDRmMzh2bjVpTlVGZVB6SHQ5U056L1lUN210T1hZ?=
 =?utf-8?B?YmdxeklyR0htYk5yTjFLQi9IaS8rNmlsRHV3YVBtckpkMUhjcjV5aXowVGZ4?=
 =?utf-8?B?U3JtZDdqZDY5Y3V5Uk1BZWllUUkrSkRKdlZnY3JBK1l5eC9HWW01c004TlY5?=
 =?utf-8?B?VFFKMHE5Z282czViSUdqaEh5RzFWUEdySXNDMi9xS3p6dEluVHl1VHlZRWhT?=
 =?utf-8?B?dlZQNzdPeFJmQ0UzMUJVM25rZWlKRlVyZFg0ZzhzekVxZFN1R2I0TE1sckJB?=
 =?utf-8?B?QlRPSytubHl5Y1JPM3ozSnAzeHdyWThRUUhOWFV5Z1hRNTgvN1M5Nzh3aDlP?=
 =?utf-8?B?TWRxYzFjMFJPL3FFQ0xsQU5zVkVlQ2YrV2w4MXNqeW50T2c5eUZJUUpQOFFJ?=
 =?utf-8?B?MTVJbGRScUlmZEFIT2pWVFFtVEl4aW5oVlpFbHd0cWlNRm5lNzM3SE04dVp3?=
 =?utf-8?B?TWpsNTRUd1BMUUxTbEU1OXp6R3B2QnZnY2podm9EZ05Tbkc4UmU0RGFOMmh0?=
 =?utf-8?B?eHU0Z2RkUUJoTVVPRDVTY3hYblVVNkI0R1BKNkN1VmN2ejVNZzE2aTVSbndM?=
 =?utf-8?B?YWVWZ1NFYUkrWkp3bHRBM2hNenpjSEVlZGJEK3VyU1U0NmttTk45TVZXY0hE?=
 =?utf-8?B?TUEybm1RU0pFQ1M2eVhmNmFyS1pNMWoxbUFSWXlkQ2JxazFERm1NcVcvSW9u?=
 =?utf-8?B?cG5lcGVwZ2RiTVNYZzRBNEt1alZkMmIrSE5uVFhYMFgzRjJJTk9UaDd5bGti?=
 =?utf-8?B?akhxNDdSanNkNlhYazhzdVBWa0lrckk2TEFLWHlrWGE5TlY3eWpNT3dheHY3?=
 =?utf-8?B?SE9pQnZ2cXdjV2sxbEcxNGhoUFJvWkJZRjRRTm4wRklxMjJnYmNBeHl5VHVI?=
 =?utf-8?B?dVJPSEp1MzFybEtlQncrMk04a3hSS1pRQmlCUlFqSmd4NHJTUCtFYXZpcEI3?=
 =?utf-8?B?MmhPNURkOXFjTGNZRVdJc29OeE0zL2hqVU9xYmZheVQrYUp2L25WWXliU01v?=
 =?utf-8?B?SUFpUHpYSjkxWmU2YVFZWDhGWGQvTFlXM1pKbFRBbm5SNi9wVFphTmFCWG9C?=
 =?utf-8?B?c3hTeGpZdGp0bDNKOFBpUHloTEJYb2Q3N2FPZVRUWHVMZ3ZvNlZ4NzlvK2dj?=
 =?utf-8?B?a0szQVVQY3dxTm9YUzQrMUNUWlkxZ1ZMY1NmcGwrd3RxWlZDS0RobHI4N1pD?=
 =?utf-8?B?Z0R3S0pzUytkeEZnUWtQQno3djhJYXVJMk0xc0RZSTVNejcwWEo5SzRFbVJo?=
 =?utf-8?B?TzFPNHkxVWo2cmdjcGNnSG5hcWQ3TW5odUFpVkZZc3JvYWR0NjIxL1BDKzN0?=
 =?utf-8?B?ck4zYmVCa24wb1BYbXlFMTRFNFhaZU9INWtOWXo0TnJpbUdLV04zaFVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MExPNEJWZ3RkT0p0a2VZOEtnczU4YTJCMlJoUkVSbXRLZUlVVnhVdGNnVnRT?=
 =?utf-8?B?bmxLMHBkdHdUNE9Hb3dveGNXeCt2SklwNG5rYitUS1VVa1l4eSt1bDBONGpI?=
 =?utf-8?B?a0dhRzRaZjl2S3NFNlJuTlZVdDRTMmNUNHBGaFNDWVYvcExnaFhQTW1waUQr?=
 =?utf-8?B?eUNLcEQ3eFZNVGRyYm1xb0xjZlVsNmRnVHpGZ25hOXI4b3REVkVoOG00bXNi?=
 =?utf-8?B?WFRWVDIyS2tlRUU3d0FHNVpXbUNwZy9PNy8rbWs2TDFJbVF3eFpvN2dBS2I0?=
 =?utf-8?B?ejV6Ym9jcmV0TnNnZExYdmNzY1RJZUdhNFdHYWRIQ3BjTnhQTkpXZkJjVUc5?=
 =?utf-8?B?aURwdmJhOThOWklxZlRCYTFocmYrQnV1Y1cvNFJxRGhZdTAvOEtRdUlhdXkr?=
 =?utf-8?B?eHZzQW14SEFFbmNHdG5WTGZGQTFlWTRqYjJ5MThrTURrc2VyRzlrLzFMWCsz?=
 =?utf-8?B?a2hGbFRhenFKZ1RWZkw4QXRIck5jK3JKTFhrQlN4cDNnVS9qRTJId3lzL2li?=
 =?utf-8?B?blROTUdNaGxObkJHaUJqV3djY0EyZzQ3N2tKbHUyWStpMjFQVmZKNi9HaDRR?=
 =?utf-8?B?bXdjbnQzM0JnMElHY0s4Rlo5SHQ0azR3TEZYR0c5ZWUwWW5BaDhZRHhzV1hP?=
 =?utf-8?B?ei9ENlNJekdTazQ5QmdtZEY1Rk5JNW45VEJzMWpvUDR4ZDA1cEdzUEwxbTA1?=
 =?utf-8?B?S1AxU0Y2MWRDem1QOEQvUi9tNkU5aHBwejhZZ1NWVHNQQWJYbVEyVjNDNTVm?=
 =?utf-8?B?dXdrSmNyRXhOVGUrVTdWZTlzYmt3MERwbG5FS1MwcXpobHI0MGpvcldZbTBx?=
 =?utf-8?B?bk93TTFRWjFObEgzRmpTMi9JQUFmTHpObFVLR0tHSmdBdlBGajdhOWFjeUhU?=
 =?utf-8?B?c1A0UXRJUEpSeHN1cWxyeVhpYTdscnREcUcvUGRla0Vlem9ncW9xTlVpMXlp?=
 =?utf-8?B?cm05clRJOWI5UTBGM2JmNWZBU1picGlpRy8vNVRMLzhWOVVSQkc1RHNsaDVD?=
 =?utf-8?B?Ry9oQ0sxMjF1aEN1MWZyY0t6czRpckVWdUhwZUpUenpqM3B6ZlFRUmhwMTFD?=
 =?utf-8?B?WFpxWEZyeEJ4RWsvK0x4cndCcHh1M3dxM3prU0Q4WVR2M0h1a3d4Q3VNU3Bk?=
 =?utf-8?B?d0dtTmRRNG81dkpvN01qbXJydU1MNWpVMXp3dlk2c3RBSGlmSkN0UWs1ZlM2?=
 =?utf-8?B?Ni9Lb1kxa1k2a3ZOUitKUGhWbkd2Q3d3dlhZMnUwWGdjU3d6bCtlRXYranI0?=
 =?utf-8?B?Sy9GUmxCUWtYMTYrWnpuUXVkdVNPTGZrR0xkN20rVEFac3BvcE4xZG8yMUtk?=
 =?utf-8?B?V3hKTFVtWlFUdExmL2Z6TkU4NFZRaWcwVjV1YkxFOVhqcktHMHc1aUVCam43?=
 =?utf-8?B?TkltclRsbEpreUYxamxXNGRVcll2SW5DallWb3RkaDFObVdqYzdIOU1neWxj?=
 =?utf-8?B?RUlpSFVUOVc5dTdseFdDMW9UQ0VjV0d5cG04TjVmaDhUN1Y1YVd2aHd0akF3?=
 =?utf-8?B?MWZMMW5BL0xhY1NYaC8wWlNiUTNaZEl2Wjk1bktRSFlCUnBiaFMyT25QR3Jk?=
 =?utf-8?B?dS81SGFKTnY4TGdKSlFIVU42NTEvdUR4elJ6QldmVDJmeGd4UHdHSGtLTGs5?=
 =?utf-8?B?dWtYcU5Dcll6Wm9MN3NJOHEzcUJaR21VVUw5Mi9WQTNRZUlmV21rM0VBRHo0?=
 =?utf-8?B?S2xabExHdllXTzViWDdobTZ4cjlHRlNRc2ZidGdXcm52N25jSENVVFdmSWhy?=
 =?utf-8?B?bUpBRWhJN1JaTHVHQXFHZ05WZGh5bm8rWlRDaWVpZmEvWkYyYTVRWDJXbW45?=
 =?utf-8?B?R3JQM3hlTDB4VlRMWHYxcW1vVm1xUFBKaHptSEtzL1ArYVozVHFoWk11YkVI?=
 =?utf-8?B?VHh1SXJzalVOcVV5SjRCQTEvUjFScXhSU1llYlQxOXdTdWpQTzdidHFPREI4?=
 =?utf-8?B?Q2xSS1ZORDl3MzQwU1NGRDE2WitoS1ZrL1VXVDRVcEswbmtSMEtnTldDWStN?=
 =?utf-8?B?ZFM0djhSWDlCL2I5aWoxWFhzVjlUaFRxeERXV3hyaWFpeUpsOWhyUFBucytX?=
 =?utf-8?B?ZHBYOHNsVzEwS3hDZlVRb1ZHVWkwK3owcWQrbVc1V1UxT3FQZWgxbk9tMyt0?=
 =?utf-8?B?OHRsTy9uNDdnbWdOVm9xTmk5bDN5OG9ndVRDVkRxMS9qR01vNjk2V05PZSsy?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e2242cb-ccd3-4086-3619-08dc84846057
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 10:52:07.0338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xr3q/n0ew2w5VcoFaObqM/tvkCXeMtIM3xIq760bgoCOP+vxZ5tdLOWnTGtLQjvzG6O0FfKfYb9nC5vzvevj3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5019
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



On 04-06-2024 02:33, Matt Roper wrote:
> On Thu, May 30, 2024 at 10:09:30PM +0530, Ghimiray, Himal Prasad wrote:
>>
>> On 30-05-2024 20:14, Nilawar, Badal wrote:
>>>
>>>
>>> On 30-05-2024 19:51, Nilawar, Badal wrote:
>>>>
>>>>
>>>> On 30-05-2024 19:55, Himal Prasad Ghimiray wrote:
>>>>> Make sure that the assertion condition covers the wakefulness of all
>>>>> domains for XE_FORCEWAKE_ALL.
>>>>>
>>>>> Fixes: c73acc1eeba5 ("drm/xe: Use Xe assert macros instead of
>>>>> XE_WARN_ON macro")
>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_force_wake.h | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h
>>>>> b/drivers/gpu/drm/xe/xe_force_wake.h
>>>>> index 83cb157da7cc..9008928b187f 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>>>>> @@ -32,7 +32,7 @@ static inline void
>>>>>    xe_force_wake_assert_held(struct xe_force_wake *fw,
>>>>>                  enum xe_force_wake_domains domain)
>>>>>    {
>>>>> -    xe_gt_assert(fw->gt, fw->awake_domains & domain);
>>>>> +    xe_gt_assert(fw->gt, (fw->awake_domains & domain) == domain);
>>>> This will always assert for when domain FORCEWAKE_ALL (0xFF).
>>>> Not all the platforms support all the domains.
>>>> e.g. MTL GT0 support GT and RENDER domain. So for forcewake all use
>>>> case only bits for GT and RENDER will be set.
>>> I think to handle this correctly in struct xe_force_wake you can add new
>>> enum xe_force_wake_domains supported_domains to hold bitmap of supported
>>> forcewake domains. Use this bit map to check appropriate domains are
>>> set.
>>
>> Hi Badal,
>>
>> Thanks for taking time to review this. Agreed the check should be based on
>> supported domains.  Will look into this.
> 
> I guess the real question here is why we'd ever be passing
> XE_FORCEWAKE_ALL to xe_force_wake_assert_held().  That assertion is used
> to sanity check that we're actually holding a necessary power domain
> before performing some operation that relies on it.  Nothing in the
> hardware should ever actually _need_ every single forcewake to be held
> at once; we just tend to grab XE_FORCEWAKE_ALL in some places of the
> code because it's simpler to just blindly grab everything at once (even
> the ones we don't truly need) than it is to figure out the specific set
> of domains that will get used.

In the save/restore code path, both at the top level and in subsequent 
levels, xe_forcewake_get() is called with XE_FORCEWAKE_ALL, as I believe 
it accesses registers from different domains. In my opinion at 
subsequent levels we should 
%s/xe_forcewake_get/xe_force_wake_assert_held(XE_FORCEWAKE_ALL).

Regards,
Badal
> 
> 
> Matt
> 
>>
>> BR
>>
>> Himal
>>
>>
>>>
>>> Regards,
>>> Badal
>>>>
>>>> Regards,
>>>> Badal
>>>>>    }
>>>>>    #endif
> 
