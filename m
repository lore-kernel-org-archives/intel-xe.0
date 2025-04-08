Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64616C369A5
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 22:08:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D01410E77F;
	Tue,  8 Apr 2025 22:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TUbBYKbQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA3110E77F
 for <Intel-Xe@lists.freedesktop.org>; Tue,  8 Apr 2025 22:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744150129; x=1775686129;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YE7oy4ywdTNo7DvDYbyQqvymZDaAFDIk4JQLJ0VSEF0=;
 b=TUbBYKbQGK/BDEa5Y2gSLGxX9eOlRY+BIRn80SXGe2YxKSxkgp9CJ7bz
 lHIsRG5QvWAvWPFJg+mwTtKqYom4uOIWk+22mcXVKsHVFFOhbFJN+cRUO
 kMyef53eD/JDH5UEXteNlt4hfVAvRcr+W+tI38sGyIRIezIveukdwwC4+
 PPn1BWxr190BLL8aFrfiHk0KYBSSe34aceNj322CXsKBBA5EMN7R+G0vX
 RDAxRGyBNUO2UIPNPKJmI2nl2LyAxu1eYbY7H1cvPPp4KMlWVTW8SqO2H
 b1B3sWHFlaWZt7YolcvU6191z/Bx4XaE9qws3bSMAAQJ9WoGXV/5EPJvb g==;
X-CSE-ConnectionGUID: LYDBiYtWS6KgZibNFLEkvg==
X-CSE-MsgGUID: RScYm22wSeipLQABNttGFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45499197"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="45499197"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 15:08:49 -0700
X-CSE-ConnectionGUID: VefpngyZSUy0/VkRyKTJDA==
X-CSE-MsgGUID: qtHbrC1xRaO90w/a/yUwtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="133530146"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 15:08:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 8 Apr 2025 15:08:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 15:08:47 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 15:08:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8DFp55jOIDp3F5nubVr7yxfgKSs15Fwc0S9nFpCOjHiewSHENnc5bCaKQjQhnoNHYNew2yCuqC85cVIE4/1t8ItDKGaEWJ6CNfz5AY3mJI2YTzDc+/g1FObkHFtlJsbra7F1vtDHbp7jmKoFTKDhKW80GYFeObTLKhwvXiG9hbj0YrYtyl5k+w7HuV1CSB7gBs3T5oRCzQrFloLGjqw8OJaUNPl0z9JAbkD+7/2xNaZPbJDCanLiU/hSsHPYC+dTl/OhSOWof/efmMfxkiY1+wNmxSK3wF/ZFsX08eurCs17S2Is8fhPwQLKUZLC3M4pkUIznIPuS7b+mantxK/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2Jub4aUFz5Li9GIvCPKdsrzULZJwaIAx5AJnEOe8k8=;
 b=G3IeKLZnPrAl4iBUI91uSgicfydjUWCTPFFIMUwbkX4s4uhKjl/0VfbW+9wZq2xMLUxJUoK0DqYOmUaj6FUmQbokK3WMUqR9AEQMdROAXP4AqoBCZdPtjj9ExG6hb5xLDWTbZcnxiQoUFYMPbXkh18SVgWwU6WYc1BTQNnwysfrD8e4Wxjw/ySkqqoTTzl5ofvTiPCAoSFv5exwqwfiql2ue+BKLYZv6A8D0+kKxz5MhWfo1CPEYFAirz6fuZ1z/+SrnrKJSgZ12NXi6rAqVSwhF6IaaDgz1nswfkhxMtrDFxi9S+BW/GuSfU4RjcCHUuY3T9wly2gcFLKEW+MadKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MW6PR11MB8310.namprd11.prod.outlook.com (2603:10b6:303:249::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.20; Tue, 8 Apr
 2025 22:08:31 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%5]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 22:08:31 +0000
Message-ID: <bdc1eee4-06c4-4bad-b9f5-5554fd372568@intel.com>
Date: Tue, 8 Apr 2025 15:08:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] drm/xe/guc: Enable w/a 16026508708
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20250403185619.1555853-1-John.C.Harrison@Intel.com>
 <20250403185619.1555853-2-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250403185619.1555853-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0109.namprd03.prod.outlook.com
 (2603:10b6:a03:333::24) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MW6PR11MB8310:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e6baf0-f9c9-4d1f-2752-08dd76e9e602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2RHVmcvaVA5d1p4eFlYMytLMUlDYTUwajlWVEw1VGRwdmFGTDZxeFVIdmVD?=
 =?utf-8?B?VVFqRUNiTXlVTHY0VDYwY3gvOHAxMnVUZ1VBaitBVDFIcUVFdEdDZFM5TGU3?=
 =?utf-8?B?dFhxaVprYXBidmdsNFdCcnI2R0FZUlh2Nm5Lck5FRHJvMmpGNFRyNDN5UTkr?=
 =?utf-8?B?L0I0WUFudi84dDd2d1I0dG90NEZlcW1sRnpIeExsUUFzSzNCeld2N1A0UmJZ?=
 =?utf-8?B?VnFiTms5Z1YrZzAwZ0hlSGw3clpSdUl0dmhsbStvRE5mVTdSb0xWRFpUU3ZI?=
 =?utf-8?B?cG16K1NsMS96NHZyaVFQNkgzZk43SmhDM28rVVpjQXBPaVVldy9EN1BRWHo0?=
 =?utf-8?B?RUYrcE8zTnpjd203cFRLbGQ5Tmw4KzJET3MvNFdSWDFyUXZ3STVSTTVHZFBH?=
 =?utf-8?B?TDJjclk2VnVDTVN6QnJTQkppbFBtem9BZysyQUVyUTMrUEpOcUdUMGFtcUxR?=
 =?utf-8?B?QWkrTlBNclR5d3NJTjVZb3cra1FPc0laVmRGNXJqcDA0dmlwN3hWL2Nla1VM?=
 =?utf-8?B?MlRTYzExM0Q1WW5vVk1XekVpcVdHQ0ZsTUxoTzB6dE1aWE5UZWZXOCtWYmpI?=
 =?utf-8?B?NXlPSjNFc0c1V1lpTkc2VnRqbmRjdERIRzZjMG1BWjRGajdEOTQwM1hnNW1i?=
 =?utf-8?B?ZlZLV0tEY2Zuc3AxM05UcjFTSFZVNkJEZVZwOE9CcjkxVVZWcGhaY3pTUFQw?=
 =?utf-8?B?VmowZFVPSFRkampmdXFkR2F3UnhoWHFSNnVZSm5La3diK1pnVXI0c0hDd09Y?=
 =?utf-8?B?dUo2c1FCaDRxWnJFZUltNlo1Y1RGc3VjZUxHTGJ2eGozZEYwZjhobTV1dDZ5?=
 =?utf-8?B?djdOR2dBSHhKZVVKUW0xa2VQV2ZmS3BNbS80RnNwWWZQcDd0VzVzaW1EZzA4?=
 =?utf-8?B?ZklBS0crTGt2QUtYcjJGeXBCSllxVkR3clErTGNaaURkclVLZkNhN2ZXZVhH?=
 =?utf-8?B?dlg5L2FiKzlYbkFJTkxkbmFNTlRoZG1NRFdVQlZlWG5DSGJhSFhLWURFTytJ?=
 =?utf-8?B?bjhtSmkveXRUYUdMcVhLR2VySVhhaFpHYWhVRWhoc2Nsa1A0U2RjTDd3M3Jp?=
 =?utf-8?B?cWJvS2pnYTdkSTRGZHZQL2l3R1dTblpUcDBNM282SHFpQnQ5RHNWVmJQeFV4?=
 =?utf-8?B?T3V4a2svMlFWTTdBTUFhajNmbHF1NTB3eFdISTI3Y2NzZEo0THdta0g1MUlt?=
 =?utf-8?B?SWMyRVZLWTdZVUdESm9zRFMvbFlxWXlqbmgzRExSN0pPb1VjVmNkV045VFRy?=
 =?utf-8?B?dmZjNCtFaFU5YTcvZkVJRmJWcE0vZUd2N3pOVm13RXhhcXA5TGNobGIvUmNq?=
 =?utf-8?B?WHJPY0Z1TWhpckpIMWpJTEVHMVJOVnVjeVFvQ1ZSQklxaVo0VkRjN255OGs0?=
 =?utf-8?B?eWc5MjJ1REc4UFNIb2orS0hwN0JqMkRQMXZpcEJ2ZzVvT3RvbGs5NVVyYjh1?=
 =?utf-8?B?SEJWWnN3bVF3bnBpYy9kVVY2S1h4TEtFS1JzWm5vTTZBczVWdkt1eTFSNkRy?=
 =?utf-8?B?eGs1UkpWb2d4SkY4SjFQcGRnSnl3ZWJJMFBadmFZN204Nkd1aFJIWHBsMzdv?=
 =?utf-8?B?MUM5Y3FZTFhkRSs2OExYaTNDKytmZUUyeGFmczllSmIxSUV2OFNoakd1d3Vj?=
 =?utf-8?B?ZnpSUDVLQnNGTCtScEpkRnNrQTZCNFUwbUFBazJXL05wMExoWU8wWlMvNjFP?=
 =?utf-8?B?UGN0aGVHcjVJODFZa1dMUlF4d0tlTUhFMTVyQVVwZXZhaWoycXNsZUI3TnQ1?=
 =?utf-8?B?R2VMMUhsZzQ0bW1MVnd0QURWV2d5UkNJOGhQM1R0cnlseDNtSmNMZmNXdmZm?=
 =?utf-8?B?M2RHYmR1VktJRjZUaGFKN3o3Wjh2RjlibEw1NU1RV3pKaHpJUEMrZXBLUFBu?=
 =?utf-8?B?RkU2NXAwMGprb2l6UGY2b3RDSjFqV3kwbkplNjBlaUNXVnZPejFzWUd1UVBN?=
 =?utf-8?Q?3JLsJDM/L1c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1pIb1lQSFcxZ2lKeWVYaGxSemM3TFFrTWZDNmpzZE81THZjVVU5YjVPMGI4?=
 =?utf-8?B?elJLdGlhQ0pqc3EwalpBejc5Y2FjTU9jQUZ1RFUzbkp3K3N1TS8yL2V1QkRp?=
 =?utf-8?B?QmhpM0ZrSHJkbjMzYTFMaysra2pLMWlUbk03L0p4aW5SaTNVM2pRVDBPVG5t?=
 =?utf-8?B?ejRYSTVJTlBaODBDZDVBUlJEYXl3WWErTmhSVUhNYndwNHQ0M1UwVzQ3azdM?=
 =?utf-8?B?aHR5aU9Id2N2UGJZRGVCK0t0YS9lK3hJbWRwMEhlYXNyd2Z5aGtSUjErNWkx?=
 =?utf-8?B?UVlIRUFpQ1UxOUw1Q2UycUhJcC9LalV3OThVMEFWdnA1OVNYWDg4NVdySjVs?=
 =?utf-8?B?aGgvUnRyb1ZyR1RzcTUrME5TVnVHNlJGVEdJaGlXNDNCck03cnhTWHNnNlBT?=
 =?utf-8?B?ZHBvcnMwM3h3eTRZRk5MTUpQVmZzL21WM1ZSakFqZUVnT29yZUkxclNrRW82?=
 =?utf-8?B?M1l4aGtUSDZFU2hGV2hXakdQNEpmUHgzR2gyTm5FNTQxTHdMVlVPNzVvK00v?=
 =?utf-8?B?aS9Fd0Z3NXh3M2p1YXhlVHRrZ29sS251S3I0QWUxcHVUQkU4aDJUL2NJUUFo?=
 =?utf-8?B?bllLT3N6aGw4NGNOeERsMS9JWDVUZmQ1cUg2cVFZMHV0L010N0pJSlREY1l0?=
 =?utf-8?B?NE1hcjlXZ2FTdXdWS1JNNFdaUWgwM1ZUZWdrUUpaUnkybWlFaVNpdnFPZHIz?=
 =?utf-8?B?U1pPdy9aTC9OV2Z1VFg2NU0wVFM1SU1Mc3lORGxjTTNMZkJLYWpld3BuTG1Y?=
 =?utf-8?B?VkQzVnVYSzlmTVBocjFGMjMwZzVodzcyZndXSHg3L0NkcTVZSlhXemQ4SGZK?=
 =?utf-8?B?L0xNakp3Mm5yY2l2SnhvSDJwV09iU1pUb2pvamc4NHM3MEEvRW9KekhhRkJV?=
 =?utf-8?B?NDFhcENxcnJsdjdDUE41VEZxSTMvYy9sVDQrMkdhU3F0MG1rZFNEWFdWVVFs?=
 =?utf-8?B?eUVZbGRkRjg3SExNTHEzTVB6VzBwajdWNlB4djlwNFJGaElCOGxTV2RkK09t?=
 =?utf-8?B?TXE2RjVnS1gzV2xYcG9LL1BwRWtGZ2IrSlgwaEJob0xYVXlBdVN6ZGNIRVdK?=
 =?utf-8?B?RGU4VkNkcEVMLzEwZmNXY3JuTzQxdWMwOCt3bCs3K0Ntd2J5VVYyRXY0WWVD?=
 =?utf-8?B?VzcwSTQxZzY3NUFYdWdnMll1S29LNVBnWS9ydmFEbXdZSWhFOUVUMURRUVdI?=
 =?utf-8?B?L2dKZFlFZGRBRFhxYnNjTHdJdHlNbUN1akFFZnUzMjhIQ3hDZGg0ZTlXK2Yx?=
 =?utf-8?B?V1NiNnNsckwvY0t0QTV4dGxBd0dPS3pORkRJTkRUYVMzcUNaRVRMOXpnZ3g0?=
 =?utf-8?B?R2V2TWFVOXU0TFEvSG9USFM2VkVqQjROR2U5VmFMZ0JKOE5zeFlHWUZaSW5K?=
 =?utf-8?B?ajBlS1FVTnhxYmdGek9NL2ZyekxkMCsvMGxQMDlmNDhiQklrSVkydTZSeHJk?=
 =?utf-8?B?MHlZcFRKbDcvNHZsOUQ0TWI0OHI0QXd6UlJsbTJ2M25tMzh0TFBsWGNnWW0x?=
 =?utf-8?B?ZW5WTWprUncybWVMcXJEMitEQjVzZ0Myd0IzcFg1MjlxdllJZG5MVFJNRmdw?=
 =?utf-8?B?ZDJrM0t4KzZwUVRxQkcrK1lwektSOHUvdDd3YkdnTXU3MWxxbVA3MUQxTVZa?=
 =?utf-8?B?VHdOZXNVUjcwOTJRdExJVGlBN3ZRT0puclR5SzdMUkRCU3JEMEdPUksyc3Ns?=
 =?utf-8?B?Mk15bnhreHo3cXZFQUlFZFF3UE9FVkMzd0VsM21IL0QyQldzaGpsZVh6NXpW?=
 =?utf-8?B?U1U5bkdYWEN2K1NEbWRRdW1GcU03Zk5BNnY5eFNtQ3lYMGoycFJEU2k0YUhi?=
 =?utf-8?B?L3l1bWR5V0VlYjhSUnRRMGMydWdlT0tJaEllUHA5NlJKdkRVZ1pXV2ttVitQ?=
 =?utf-8?B?UHEwM2lHeGJ2RmEyODZFK2hQSkFGRTMxR3ZJQkVhUlBZUCt5ME9ZcCtyWDR3?=
 =?utf-8?B?OEV6NS9VRmVWYTFvSEpjTnVQWDI2ZjdXTDhjTnVOVC80TFFCN0FtY2Y2TE5x?=
 =?utf-8?B?ZzZGeDRFbUpOckxZMXZocndpU01kdS9EcmwrZks5T2E2dS80N2VISThMMk1D?=
 =?utf-8?B?K1dwTW4vTTRFcGh5WUpjaG5NTFZNMDBNNGVEbHEzNW4yNFhFejFOSmE3eFVI?=
 =?utf-8?B?c3VEMk91QVlpbnZadkxQUVVTYkZkUkNINnAxdWJZelp1TGZmWWpiOWdpTnBP?=
 =?utf-8?Q?fjwWNS2xQemZmjlwK462M8Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e6baf0-f9c9-4d1f-2752-08dd76e9e602
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 22:08:31.7362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gnXgW7VUUy9aKLCByFS1OXif2sLoOmzSwZD4MXi3/WANOGy3ID1zMLwUrxmUjZSjI7a+NRpDX2T35kI/kQnZdjmAVqnceMTl8TibY+FZh5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8310
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



On 4/3/2025 11:56 AM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The workaround is only relevant to SRIOV but does affect all platforms.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 5 +++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules    | 2 ++
>   3 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index d633f1c739e4..7de8f827281f 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -367,6 +367,7 @@ enum xe_guc_klv_ids {
>   	GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE			= 0x9008,
>   	GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET				= 0x9009,
>   	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO					= 0x900a,
> +	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index bee4e0cfe7b8..9de8c2b81f0d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -376,6 +376,11 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>   					GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
>   					&offset, &remain);
>   
> +	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 44, 0) && XE_WA(gt, 16026508708))
> +		guc_waklv_enable_simple(ads,
> +					GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH,
> +					&offset, &remain);
> +
>   	size = guc_ads_waklv_size(ads) - remain;
>   	if (!size)
>   		return;
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 9b9e176992a8..9efc5accd43d 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -57,3 +57,5 @@ no_media_l3	MEDIA_VERSION(3000)
>   		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
>   16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
>   		MEDIA_VERSION_RANGE(1301, 3000)
> +16026508708	GRAPHICS_VERSION_RANGE(1200, 3001)
> +		MEDIA_VERSION_RANGE(1300, 3000)

