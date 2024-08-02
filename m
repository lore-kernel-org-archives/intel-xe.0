Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A947C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Aug 2024 18:22:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526C410E0CE;
	Fri,  2 Aug 2024 18:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hdw5P0cU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FBB10E0CE
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Aug 2024 18:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722622968; x=1754158968;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6XfYD0bny4P4G1fW2q3aNFUCKUoHnM1Tq5/b21yqU1w=;
 b=Hdw5P0cUKt37wbkyw0UNmUkpoKBQ60n/UgEGN9/TCpULJp+1Ec0N0jgK
 DAM89UFTs3x8Sv4NIxRzq0m3FFZoFywAS5nzWnS8wpP51HxIg7PX6Yndf
 pmfQdYAIhDIDvrbfnsqiNcAYmQd5MwMPoH3M6DoWasG4GNFPsAtzq3wqj
 n3efNuzQvcuPW4i6cHYMYeqV5PwPftNf6pPyfrw3IzljKghVoAtmwRO7n
 mw/vhhtP9Rs/Hovkr5JnehrUV/fuSxlf+n7e8r+BOYBa3DrwPDIhMaeZe
 YNTgJHXxlPeqYZ0svyUFMd/e1s1P6qfUPrG/C7OtYOGFSqinXYWyUHKEX g==;
X-CSE-ConnectionGUID: ENJcnaUGQ5aNLHtPhuSrAQ==
X-CSE-MsgGUID: FMcNUMvMRJujNSK0va9D8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="31232723"
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; d="scan'208";a="31232723"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 11:22:48 -0700
X-CSE-ConnectionGUID: 5Sepe09+TC6Wjd8Go3NABA==
X-CSE-MsgGUID: v8luSRztQbCCqn/YCqi4bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; d="scan'208";a="86084796"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Aug 2024 11:22:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 11:22:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 2 Aug 2024 11:22:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 Aug 2024 11:22:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQ1z+FVFeU5OSVs5a1skDZW10wxfszyZZk1h6qAgHXP5mM8QhmRgE7+j7Yf68Cfn6l812nRTqi186r9+6qWZabTluM5OQ2tUIfVyPRiMFdFSrXArbo+SFDoWoapgHYHSRiBzfMGPUu34rFFBbsvkZJt9RRr4DC42J0mte7dsGlTDLDdyjL0vSYAZiSyzgCSd6NEcKLY63rdkp+Dqfnnxoe65ZG1MT/7l8Vkis2e5lXHkOhN0jNHyyXOoV2bn7MkLfTGiDQmitTTby+xEJCT1f62eNriW3Qytg2ZEVB7KpEjg/GOgJDHYKy8pEkLR39DHjqm1OXVa0tH9gbS4MfzM+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DM4Mhm4RyMokkeMNc7Cr4FGPOdNIhAA5igOVxlL2Zo0=;
 b=cYmsLCE+iuzGCVdqhvwwJ3KzeUSmnPyAiMaDtBtKfLjSbDAWUifW/CWBL6nC6Er237ztYmCaZtzYTfB2Wvm9UQjfEthXz/HCZD+OAkbZ/7rCdh4IkBU14FwQMDJjupBD0X6AxI8GKFD8UPk6Ujf7iFxJQz+GCSFwURMLh1o7e/K/D2nZHzk1EBO2o8XCIkJbi4xxT6d2m3ol9x3rPtxF56nJJochA60UF4XMPqmES0XeEH64tXTrsSoyBplyuTMSekyNyV+RNyNfQ91i06S/AXjTNi4I5IbweYxxES4korY1MIIdxTVRC9eLs4lerUWdiQLDVHIqrkdMX4+3FPClXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Fri, 2 Aug
 2024 18:22:44 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7828.021; Fri, 2 Aug 2024
 18:22:44 +0000
Message-ID: <a74dc512-d58c-4b99-ac2d-8c79487e2b7f@intel.com>
Date: Fri, 2 Aug 2024 11:22:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/xe/guc: Release GuC v70.29.2 for Xe as minimum
 required version
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240801224241.3050352-1-julia.filipchuk@intel.com>
 <20240801224241.3050352-3-julia.filipchuk@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20240801224241.3050352-3-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0110.namprd03.prod.outlook.com
 (2603:10b6:a03:333::25) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM4PR11MB7183:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bc00e58-27c7-408f-97f1-08dcb3201a40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXJZTXgzWmdrQW0wTThhcExDN3dyQVVuR0pMemdSeXFzUU9sNm1NcUJtWmh0?=
 =?utf-8?B?M0U4TUdhVzh3N1VnNUVGdXFWcHUya3J2OElUM2wxRnJGTTd5bGNVNUs1eGxE?=
 =?utf-8?B?dnRhVjA2akJJeGFFNWxxUUs3ODZBY3M5K0IwbDdkQlhTMjF6QSszMGxiWERX?=
 =?utf-8?B?YVdZZGZYck1jemF5MGh6K1J2VVB4a0hLdThaSXA2SjdvODJJSDlUZXNJS1VY?=
 =?utf-8?B?WEM0V0dadk1EY2tvMjJYaW1hSGZwSUpoV2pBOGExWkFiSTRhVDJxWFBXWk95?=
 =?utf-8?B?Y05iYW1GTEV6a1ZGTWtHRjlzTzZxYWdZU1FyMlZVSzJ1OVovcEhiT0E2V3NO?=
 =?utf-8?B?cDFmM09QT2gyQnBlb1p1MWE2cTBtaW95NUZoREszS2U4b1B3OHJhSEIzTExG?=
 =?utf-8?B?ZnN4SVJuU0dXZjZSYlErSElSWHRBWVoxc3pkSXY3TTdaOGg3WHRBLzAvN0RI?=
 =?utf-8?B?SVRPbmVCNU5NUHdPUGRwU2NPajBDRFFKNEZGWWFXazQrY1p1OWJkcERmUU85?=
 =?utf-8?B?eUxzcVAzK3RVdVQvZnpWTnFaRE5ERnBlVjMyNHc3TnYxWkd0WlJiT1FmWUVj?=
 =?utf-8?B?Q20yY1R4TkVkZWRrK1FaKzlBMmk0b1huRkpYa1NhbEF5ZDVIUzhEVnBSdHNs?=
 =?utf-8?B?LzNTdlBYcnV2RTlTUnlOeDZvS1lzSEdaYlJZSFIxR0ZwQTQyRmRQSjlVdnFU?=
 =?utf-8?B?eEk1VmszTUpvM2FaRnc3OVk1NFZVZCs3aFNqN29tUitvdU9xa3RBWGs4RzNE?=
 =?utf-8?B?QWw3ckEybDlWSXNjK3pqeFYzOTlXYVFoZUJaQ2RKNzFYN281QzJnZzZmSVgz?=
 =?utf-8?B?cGY0TlQzTkdaZiswQWdGSzI4aHlxYmt5dTRzaHVNZS9BR21WWFBRTmFXVFFI?=
 =?utf-8?B?dnBRMTZYMDhYL2NkWmpuOTBabUJyKzVoWTlqdXlGTER2V2w0d1VzenZvVndu?=
 =?utf-8?B?U1JmSHhTNk5pVTh6ajVBRWZQdld5VmRReFdXVk8zWHVBL0pXQXhrM3J4NjIy?=
 =?utf-8?B?bzhpaXVYcVcyeUlVZmwzaG5VdkxCNGJpMUpSNlFRUXpnd3gwWVRSVEFTM0lP?=
 =?utf-8?B?b0pWZFIvNXcrcVZIT0lOYUFuUmJad2hoeTdoZDNNSFBySjIzWU01QnowYXNB?=
 =?utf-8?B?ZjVidDl5Zk9mS0grRmpKVXFwRHYyQzM4R0RjS2dUV1RMRElqYitvbEY2cUdi?=
 =?utf-8?B?RnE5TG1YRUxva2dsYXZwdzJMYWg1MEcxL3YxVDQ4U2dzTTdmZ240SUlBYnV2?=
 =?utf-8?B?QnVBazd3ZUVhNzhsd0d3ZVM3T0xuLy9DODlzODV6K01lU1d1dllUTm56UGJx?=
 =?utf-8?B?MG9jUEtLcjFIQlE3ZWc0MURhQnZGTUhSVkVCNXdYckxwWXN6MGY2WHFjTFBo?=
 =?utf-8?B?V1NVb01sdDhLZVFhNStCTUx5ejk2cFVkME4ycityVVNhcjVvTEtwdVFrRXQr?=
 =?utf-8?B?S1FZWVpNd3FQWFQ0TVVKTmE0YmY2SDZrelBzdnV0Rm9SWk1hNTQwSFQ0dmE4?=
 =?utf-8?B?eDR1T0QvQXZKMC8xSUE1eFZKMW9WYStWaUViVy9LVVFINXNHTzNndmlTVGlh?=
 =?utf-8?B?WXpxeHVsN1QyOHN4aSt0aFd5TVN6WkxNbHVZVis0THZMa1d2bVgzUGFhdlYy?=
 =?utf-8?B?N1JsRm0xc1pUcGdPUXBNNXpXY1kybXFQYmFoM204OUxrUlBENjl4ZERSMCsx?=
 =?utf-8?B?ZjR6OVhFZ2FmL05FMktiZGp6ZnpSWkx2WGdwTWhGT0NjMnBCTkhsa2lDaVdr?=
 =?utf-8?B?MTlVUW1uaTIwWm9Xc3Qvbnd4STYrVzdVN043YmJ5SlRjNEl5OFBwWHVUSThK?=
 =?utf-8?B?aFlJQWYrV3lnOUF0YjA3QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTdzRys4RTNBaTJlcW5VY1JSWHZxWUN5YlhyWnIzTjVHekFZZC9yZmxmbkhE?=
 =?utf-8?B?V25lcXZ6UStJWW9JRm1Ick53M0tCY0piRHhUR0JFKzdKNXlVL1FTb3plVUxo?=
 =?utf-8?B?N0pIdVg4ekxhVmRraFZ3TVV2MzRWRUF2NDRWRG40TGdRNFdVWjdoQWU0bzVI?=
 =?utf-8?B?a3FQQ3RsZWdzWmp6NTZnaG9TL3Q2Zm5Ta211L096VXNXeVRsME5DMnA2ZDEy?=
 =?utf-8?B?RU1zSnNmeElEK3U0TXpTWUkzYWh0WklNd25YelUyR2dLR2NXNktFWW9iMzEv?=
 =?utf-8?B?N2tuVGZmbWdkVFUrZGVJMlZST0FCeHZKbk1jc1BOSC9qTThSbUhaZ2tPVnBs?=
 =?utf-8?B?RUZWMCt2T3E2OTBkSWFiSVF3WmFveG1lNXVpYkdrSkVIamNyL21xVEFNcDhi?=
 =?utf-8?B?UXBjZEJtWWtJZ1hOU1Uzdi9LNjZxUzltMTBicm1xaENodHJ1cng1OHd1amV3?=
 =?utf-8?B?SndoaXUxT2RoUytkR1ZYdDd0LzlRSDdFQ1gxQUs1bkRZRTZYanR6SVo1OVRX?=
 =?utf-8?B?ZnEzTktyVi8vMFk4NkhueEp6alFiTnhTTWthbGxOWGNnaHlRWXFGTGxtN1JU?=
 =?utf-8?B?MmcrVEdLR3hsSXU0UFpRSGFTWFdMRnlOQkhnN29DL0lzVStrU1gxQ2dMNjgz?=
 =?utf-8?B?bFUrU2FaWTlXZlNDNlh4NHQ4czVQOEZ5cWhGUk5xekxiUE03cUU3VUVMSkRh?=
 =?utf-8?B?NzhSKy9vblRqYUdtSy9iOTVTQUJFdU9IelVFT0RQR3QyVTRMNGxXQUNpWHlt?=
 =?utf-8?B?UFgvc2VWZnZNTWtoQ21DZ3FYUEhLd3AvbVJiN0pMUnZ4MUpJQTNYUk5ubVVL?=
 =?utf-8?B?SlhSRHY4NlpsT1NLbHRIcDZLVDYyNHF5WXB2U1AxUDFmYWZuMDYranlPZFho?=
 =?utf-8?B?Rzd2bkR1TGFjbjRmVzlidDNiSnYrMzE3SVVwTUczREJDdndIbFZhem1IWGVq?=
 =?utf-8?B?OEpoV0lOKzZQWWhoSTFydTE0NWhjQlRHcWkvczJxWjBtUlpvckc5WmVZbTJx?=
 =?utf-8?B?UFNXQTBCUnFDU0toS3ZyRUR6M0RIRFdjM3FNWTAwNm1xR01ZVERMaDluV2E2?=
 =?utf-8?B?dDZoK1BvNTQxU2dzRk1ydjY0UDQ5bjB5cERqalVldlpzMVBPQVhITUhhbDJR?=
 =?utf-8?B?WlhDZ1Y2bzBjMDhOSDJNOU94SHdjbkg1b1ZabEd1am80cVlqL1NFcStIWndK?=
 =?utf-8?B?RFpjeDVXUzJmWDZnMjdxZHhxTEFxYTlKcVZ0SElTbVpNdFJHYllrK0p1dlJY?=
 =?utf-8?B?eEg5czlYRUJtY0FsZnNSU1FQcVFjU21QOG5CT3VLS1NRQXNsVDZySm11OFBW?=
 =?utf-8?B?b0gzMGt4QWR5RklHNEdmM3NKSzlPWHZNZmEzWUNHTzFqRW1HVERhcHVmYS9T?=
 =?utf-8?B?U3dMcXE5K1hNSHFxUHE4Y2lvZFVTODY5aWlUcVorNHBRd1NyYW9iUm5sSmg1?=
 =?utf-8?B?UHNiMEdDWWQ5bUJiUFMrWHFLTVV1eGozTDV0aXl6QWljTVNpRlRZTGEzUlFS?=
 =?utf-8?B?Q2JuR3VTTjNyc09qelg1Y3RvUjYrcERYOHZwM2lpc3hTU25xcEdQTW1Kd2tq?=
 =?utf-8?B?Ly9PaVA4TjNXZkVwNk10VDY3dk5NcFl0cjFiZU8yNkpCeWhPajVNTXllK2Ns?=
 =?utf-8?B?VzhzdzVUZWtJbzhNUG1kSGJhV2FXUmNwNVBkRkJOUkFWeEE5cmVCczFMbk42?=
 =?utf-8?B?UTJJcWJhaWFhalUyTEFySE0zNFZ3R2d4NXFHaFpZVEJicGJHdXlPZ0pVMDB1?=
 =?utf-8?B?UGlHT05BMms0RmVnQ3BmenBOeDArVVRuS1VFcUx3U2s1WGtCLzdWWmsyK1Zy?=
 =?utf-8?B?bFIyNlpVbUFRWWEyTW16WkRuMWRBS1VDTVJiYjF1Z25Sa1oxUWZBTTNnellF?=
 =?utf-8?B?cnhKcENUeDlMOFdMcjJleDdLZ3NLVlh3aHJyWTJoS05NUER4OU1xSXFkbGNO?=
 =?utf-8?B?cDRVTVBMd0hoS2g4UkJKNHgyekpMKzJBcUJXa3lpWjVBNG1MVE1FS2ozOHJn?=
 =?utf-8?B?NjBMOVdhd2E3amlqTjhEOTM3dnhGM1E1YnZRcmFUdkJRNmlrMlF4OTFzYkVr?=
 =?utf-8?B?emhCVk9wVnJWdDVtdWFNRHhxUWQ3SkJzUGpDcGg2UHg4V0xiNE1mR0UwYUJQ?=
 =?utf-8?B?Zkt3b29OYldIc2RTZFJ1aC9IUnJYYlByOGI4S1o0Rk9Ca2RZQUtlYVVwZElZ?=
 =?utf-8?Q?IhDZOdsHIq12QcYj2auOKnQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc00e58-27c7-408f-97f1-08dcb3201a40
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 18:22:44.1498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8Zs3dzM0JTtgZIw7eSIDHbMQftLhclkmzf1VdE7X+nyTjwvVDNudW7/DTzu7zVR7EvA1tTkAQd1AJ1rWYY+nLEW+ziYwvWWTBeMwmSUamM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7183
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

I'd reword the title a bit, maybe just something like:

"Set GuC v70.29.2 as minimum required version"

On 8/1/2024 3:42 PM, Julia Filipchuk wrote:
> The VF API version for this release is 1.13.4
>
> Bumped recommended versions for all platforms. Check for release version
> v70.29.2 as minimum suported.

This sounds like an inversion of order (i.e. the bumping of the 
recommended version is the consequence, not the cause). Also, you need 
to explain why we're doing this. Maybe reword it to something like:

"Bumping minimum required GuC version to v70.29.2 ahead of the 
force_probe removal; this way we're guaranteed that we'll never load any 
GuC older than that and therefore won't have to maintain the required 
support in the code. The recommended GuC version is also bumped to match."

>
> Add comparable version macro to xe_uc_fw.
>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.h   |  3 +++
>   drivers/gpu/drm/xe/xe_uc_fw.c | 26 ++++++++++++++------------
>   drivers/gpu/drm/xe/xe_uc_fw.h |  6 ++++++
>   3 files changed, 23 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index e0bbf98f849d..9a0b9123dce0 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -11,6 +11,9 @@
>   #include "xe_hw_engine_types.h"
>   #include "xe_macros.h"
>   
> +#define GUC_SUBMIT_VER(guc)   MAKE_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY])
> +#define GUC_FIRMWARE_VER(guc) MAKE_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_RELEASE])
> +
>   struct drm_printer;
>   
>   void xe_guc_comm_init_early(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 5b70d23724c4..fe1b97d3d2a0 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -15,6 +15,7 @@
>   #include "xe_gsc.h"
>   #include "xe_gt.h"
>   #include "xe_gt_printk.h"
> +#include "xe_guc.h"
>   #include "xe_map.h"
>   #include "xe_mmio.h"
>   #include "xe_module.h"
> @@ -105,15 +106,15 @@ struct fw_blobs_by_type {
>   };
>   
>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
> -	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 19, 2))	\
> -	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
> -	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
> -	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 2))	\
> -	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
> -	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 19, 2))	\
> -	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
> -	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
> -	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 2))
> +	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
> +	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
> +	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2))	\
> +	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 29, 2))	\
> +	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
> +	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 29, 2))	\
> +	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
> +	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
> +	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2))
>   
>   #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
>   	fw_def(BATTLEMAGE,	no_ver(xe,	huc,		bmg))		\
> @@ -304,14 +305,15 @@ static void uc_fw_fini(struct drm_device *drm, void *arg)
>   static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
>   {
>   	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
> +	struct xe_guc *guc = container_of(uc_fw, struct xe_guc, fw);
>   	struct xe_uc_fw_version *release = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>   	struct xe_uc_fw_version *compatibility = &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
>   
>   	xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
>   
> -	/* We don't support GuC releases older than 70.19 */
> -	if (release->major < 70 || (release->major == 70 && release->minor < 19)) {
> -		xe_gt_err(gt, "Unsupported GuC v%u.%u! v70.19 or newer is required\n",
> +	/* We don't support GuC releases older than 70.29.2 */
> +	if (GUC_FIRMWARE_VER(guc) < MAKE_VER(70, 29, 2)) {

Here you could use MAKE_VER_STRUCT(release) instead of 
GUC_FIRMWARE_VER(guc) and avoid having to get the GUC variable

> +		xe_gt_err(gt, "Unsupported GuC v%u.%u! v70.29.2 or newer is required\n",
>   			  release->major, release->minor);

Should we print release->patch here as well, now that we're comparing 
down to the patch level?

>   		return -EINVAL;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
> index c108e9d08e70..1b1fdd103b9c 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
> @@ -12,6 +12,12 @@
>   #include "xe_uc_fw_abi.h"
>   #include "xe_uc_fw_types.h"
>   
> +/* Create a comparable u64 version number. Prevent truncation from smaller types. */
> +#define MAKE_VER(maj, min, pat) \
> +	(((u64)(maj) << 32) | ((u64)(min) << 16) | (pat))
> +
> +#define MAKE_VER_STRUCT(ver) MAKE_VER((ver).major, (ver).minor, (ver).patch)
> +

IIRC we had some issue with a similar macro in i915 when using u64 and 
doing a 32b build, but the casting you have should cover it.
However, IMO this macro shouldn't be here anyway because different FWs 
have different ways of comparing versions, so we can't have a generic 
MAKE_VER() that applies to all. I think it'd be better to have a 
GuC-specific macro, at which point we can use a u32 because the GuC 
versions is guaranteed to fit in that.

Also, I suggest to use less generic names to avoid a define clash.

Daniele

>   struct drm_printer;
>   
>   int xe_uc_fw_init(struct xe_uc_fw *uc_fw);

