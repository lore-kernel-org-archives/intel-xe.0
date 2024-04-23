Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1F0C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 04:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67BB113077;
	Tue, 23 Apr 2024 04:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hAlSSc56";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D58113077
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 04:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713845942; x=1745381942;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=pDNRgMCA7UaViAMczjKfas8oS4a3jP0yfQPWf8zJyKA=;
 b=hAlSSc56R3vg3rUGouwolQMyMLdZjehD9ZNi+NEtmV3XaOs/J6C8dzi8
 9Ah+e2XScZjnD6vk2Y9CoCgUDz9SaUWS6BBON9UtGafOkyebSVecBmvSx
 AN5P8Z5iXSe2jaf8VecaWJ0xqgF14MHuQ3hUJjsEluP2Q10S0p4PQnvcc
 /GqtOlCCbLOiN8HmBq9dNWB50lo3VtguXIfYRW3m/6EZxfih/RiioRJFa
 h4SPxzEP3+LffjmKT9HsOKGnDfma2ZWRmBtnAcQpl8yUXr+rNeO1cJKv6
 DBME2sZJ8arJmf2Jbk5M6DTR5iURwG2AvHIOapUD0afzPwMZ5kYdDCxuJ Q==;
X-CSE-ConnectionGUID: VwOBF4kZShKpHCUTbOrNvA==
X-CSE-MsgGUID: /lk6CKxjScaf0l+L/7P91A==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9281984"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208,217";a="9281984"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 21:18:52 -0700
X-CSE-ConnectionGUID: CcFRqxzIQ+mRmzCAuk5ZFQ==
X-CSE-MsgGUID: 9RGohj1TT92Jekv79gcZ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208,217";a="24102450"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 21:18:51 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 21:18:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 21:18:51 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 21:18:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mplEG9e0U1A8GP4HCxDxRRFRTcLVKD+YsbaXU/FvS5e/xB2PvBTxnYNU/krv2itS11wfVYhgwxzQAmWPUA9cyMqMMonPOBkGsPaTXNiFzCQk4beA1Qw5ZtfgRCUF8B5x1/ggdq9eBTvzNVxmub1tcvF/Ad1Z1M+jAUcGLqcOZb5CFTIany2lvIYBhncCAFzGDx6MXpbK5JoAL3Q8Gok9U/LFVfoQsRMELFzr3pAI13HV33FlDxcP7KmRs2HTxT+w2G4IjsU2jafHorHzR+ZHEK4WIERGn9U+76d00d6gD75xhMbrnSzYFwFl6E0CDT+8I5rqgMOJepvTzt2vOXD2gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtrOyDMWnVtVGR+dNkv6xpvF5yUE4JA/EQ+Gmxz6v2c=;
 b=WAD0XkT/aEN0l3tNl5YwGRTvrXro30zkfwWgqFHshBdVMhjS3OqXIYLBkIo95Wvut6jyF9EXp4+EawMBAt5k1JXLTaXQwqhKy/ogskzQYvjizWnr/SPmZ0fiL/wn7Kjeosx06FkqAXsTt6g7HG2tdUTc+N1m0t8wRbQUxHWuG+iIVmGaruVTHq0vZ6TR3vgN+dp3f/PV7kVUS0HrgkwCIbFCqozT3i1gSF3sGyCpHKDn+P5EDM72zKqLWANYZ27W1dHN8hrijnLiRIkYViKq5l25Rq5XNwZmmO7xEunPnItdWGl44WOFZPeC6arspXgIJIm2AIwvX8qVPKefH5efiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM6PR11MB4740.namprd11.prod.outlook.com (2603:10b6:5:2ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Tue, 23 Apr
 2024 04:18:48 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7519.018; Tue, 23 Apr 2024
 04:18:48 +0000
Content-Type: multipart/alternative;
 boundary="------------t0f92HECEOjxmXtP2ACXj2Vg"
Message-ID: <aa5f34f4-6ab4-4632-a10d-fa247138279f@intel.com>
Date: Tue, 23 Apr 2024 09:48:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/xe/FLR: Support PCIe FLR
To: <intel-xe@lists.freedesktop.org>
References: <20240422065756.294679-1-aravind.iddamsetty@linux.intel.com>
 <20240422065756.294679-5-aravind.iddamsetty@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240422065756.294679-5-aravind.iddamsetty@linux.intel.com>
X-ClientProxiedBy: PN3PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::9) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM6PR11MB4740:EE_
X-MS-Office365-Filtering-Correlation-Id: c5771e73-22fa-4235-9f07-08dc634c7924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rnc5aDBXTkhVdUF0VER2dWJXaHRUMm03bEVPSmxRdFVZT2Y0NE9DTHZDbVkr?=
 =?utf-8?B?d2VVMTdpakVDUzVSclJYY3Zia2JSa1RVUVNtQWhCaTI2ZlZzdFRRZzFQckxo?=
 =?utf-8?B?a05qZ2NOSlJHTHJxVTMyTGF5bzJIaU1Xd0V5ZnpoZzBMcmpJd0l6K1JaNHRN?=
 =?utf-8?B?Y09oSkMxK0ViRE11QzFRbE81Sm1WVjkrbUN0azdxNGNVY3JXS292V0JEUW1l?=
 =?utf-8?B?TlpEY1R4S3NxK1MvWWJERitWVGttQit0Sml4aW9ORTRUUklmREZ0ZHpKVS84?=
 =?utf-8?B?Ryt5UUI0MW1la0tvZEVvNFFUdmM1L0c2S1JRMjN0K1NjcVFPNmtGWmhzNjdx?=
 =?utf-8?B?NkFQRFg1Y0gwRVlOSmI1aHhtVWRkWUVXQ3ZhY1N6MjNYdjhQY2xOZjV1cUND?=
 =?utf-8?B?QTZlNVVna1JhbWVldGtZOUhQWEQ0aEkrNStYMCtvTnRBNFlFM3ZVYjA2dzVn?=
 =?utf-8?B?U0xOVC9hS1g2M0d2OFRwV3VySkRrMS9nbkhtaU1hTkFmbmlXekNUTjBqNWJ1?=
 =?utf-8?B?SS9HMGxBeVIvK1JMMUlYNlJtZ1VxQ1B5bmJ5blRSOXdMUzVNOHE1MTY5YVBN?=
 =?utf-8?B?WFNMU3M3aEhMN0FjOWJqZitvVTRSQXN2T0JhNlExV0xGSHd6MHFEZDg2VmxE?=
 =?utf-8?B?aDZVbEtENnJzVVVqQ0hNL1lyTVZNVjB5TGs0Und5bUNvU21Pa2pqWmxDZ1FB?=
 =?utf-8?B?bXJQR3lZY2k4NU5CWmV4UUxHMjh4YlJ6MFhQRTllV0huang5bXdIRkplMlk0?=
 =?utf-8?B?enI2VExlM3RTWXExeHRHbTV6dEJUYmZRMGZNRlc0dko1U1NpM1o1ZEdSYWxS?=
 =?utf-8?B?dStqY25jUmRuelRpVnNGNjg2ejdGS3ZkVkZ5OEhmOVQ0N1dYZGdTM2NHU3V4?=
 =?utf-8?B?MFhZTGhzdjZXaXIrdFhzamV5b1RMK2lNVWs0RG1DMVN4VTZweDhMTm1mVXBh?=
 =?utf-8?B?NGRsODdQRyt4NUZ0RXZ5Z3NkMWg5NXJTdXkrTkZOVjY3d1N1QmNTOUlQOEs2?=
 =?utf-8?B?akJxcVBWMW9JS2pGOE1aUWVXaVlOaXA1c3RncmxJdHBtVnRhK3Q2bExpT3Fi?=
 =?utf-8?B?RGJBbm53d2YwMHRiYVhNbWxEYXk5Z2k4NmluWlRTbUxkbzU5VndlVmhyZCtU?=
 =?utf-8?B?OVJyTFBoakdNRytnYkNmbFVzRExLUEwvTHNjZ3VRWmtodkZsUnFuTkNmRmRS?=
 =?utf-8?B?K1lHdnBiaVd1RUxWYjBnRVJMa1N1MlJkcTFJQWVQVnAxZUY1a2xZb0tVaGFM?=
 =?utf-8?B?bkdnSVVsK012cFpVdDdseXdQVVRETUx1ZkNENGRVSGRTZFlob1QybUc0ZHhU?=
 =?utf-8?B?cXUvcmZBSk1IMnpqTTBERGN3U1Q1Y2syOHUyTTBzeFFrRVRpcU5PZXpkNlRN?=
 =?utf-8?B?ajVBOVU1eG96NXJCdEgyTHRhY3ZLVDZkOUttSW1sUHdDVjg2T2MwRUMrUHlO?=
 =?utf-8?B?dHl5VGVmNlJuU0haS2lWbnl1QUhQc2Fhd0JrejM4OEREenVTTnBxZ1VCSjdl?=
 =?utf-8?B?SmFYUTFRdVA5d3pFWjVueFdNejlaNFQwV0ZrQmxjeFZFYkhvaWpXU0J0d1NS?=
 =?utf-8?B?Wk5qdm0rZ0ZPSXdmTE1nQXlaSUowMU1TSkh1cXRsR0pwbFNmRWpWQlcvZzl5?=
 =?utf-8?B?RG5HY3dGb2kxRzVJOC96VVE4S2lNeWxkVlJMRHVuRUV4QnpHamFxd0hSNmxJ?=
 =?utf-8?B?QmsrL053TFpwWk5QTTNVc2FNNXJHSEdWZUJ4WmhXRklOSXBTWFlaV1hRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVZ6dTZBRm0zNVRyMk52UmNiQzhwV2s4bXpGUHBDa05PamJDZDZ4YXB0ak9M?=
 =?utf-8?B?QkhDVUU2emE4N1BBeEU4M1VWYkJvMm5oY3NQR2ExRTliTDFrdCtId0VlZ2Ir?=
 =?utf-8?B?Q3J2L0xqcll6cTcwcGdHbTRxMytDS0ZibTlqM2FyRlZSZWtFK1BQc25Xejcz?=
 =?utf-8?B?anJXZENJR3NkM1NjN1BPT2s2M1ZpVUFLc3J1eGpCblB4Wkh2aU9FWFpQY2tL?=
 =?utf-8?B?TWhRR2YwR0VoWEhwcXEwNEtkNXJGTGlMbzZHNjVsbDJHZFVQTUIrTG5jemdM?=
 =?utf-8?B?WFRIZUlrV1luQzV2ZGduZkU2RDJCMkxYTkhScllVc0hia3p4ak5FMUlaMDZi?=
 =?utf-8?B?cVdKRDExcW5IZUVFVW4vUDFTdS9UUGNnOFI3aDYyZkQ3cjNmTFlDenlpN2pW?=
 =?utf-8?B?V2cyYzF5bWNWanZuazRvT2xDQmtaVE5jWm5JSUtieFQ3SzVLckFXdWRoV0tO?=
 =?utf-8?B?ek4za3FmZFc2ZDNzd0VMTzFuNDlnSnRQcDBFQmhVZzFtMTExUmtEUnJSUDY0?=
 =?utf-8?B?Uks4WjlKaHkyZkVnVGdVVzMySmtuSGtBWk4waFcyWjdWWFN3SExuLzdCSEpq?=
 =?utf-8?B?cVViL1JEL0pFcnRVUWZKMHFhUDlzTlM4YThaQ1NFRWdvYnlIYzFxcURQQVJI?=
 =?utf-8?B?VEJYQVU0VWF6djlYUDFCWDFidmJHc0RDakN5S1dESUxtKzJBSFpIV0R5bzhJ?=
 =?utf-8?B?cnZtVWVaVjRlN0RZcE52R3hlNExjU05yYTA3TnFWTlJSRnhvSjd3MFI1VUNY?=
 =?utf-8?B?TTI4YUowK2ZOUmNvcVVuWjhrcld1WmhlVlpPLzlYZHdGWFowWDhxemhRR1NF?=
 =?utf-8?B?UWpYQ1dMNnN5ZEl0SFlMNXNHZ2RBNnY2Nml6eHMxdHRoWmNDMDBDSktqQ1Fl?=
 =?utf-8?B?Q2VxZ2hPVnY2akdHUjgrYTBlR0hYU05RUG1ZaDJIcER2VnFOamdIektiNjdi?=
 =?utf-8?B?bUFuVjJtSW1OcTdXVWJiT3B4L2lJNXpEQ0djTkp4bW9yaW4vbk9ZMnJZaGli?=
 =?utf-8?B?eHRGbWhRYzFmNWlSNW9GVExtZ2ZBRGFRRU8yYWloOXhqQzRjSitPZzhKS3Rm?=
 =?utf-8?B?U0c2M0pEVlU1KytQSTFOb25MbTFGcWRMK0NGVksyeDBELzBjRTBiT0drUW4v?=
 =?utf-8?B?NCtBQjEyRTVkSFZZalZ0amVjVURwYTJycERTVTFLazFHZGxKUHFZVVlBNTVn?=
 =?utf-8?B?dGZNVW5hTGZFQ2U2ZEFoSmlQbHhyaWJjYWp1eUsvdkFkbnhnRFJHaHcwZG9U?=
 =?utf-8?B?SmZBdktNeWp2cVZ4K3QxbjZZajhtVHo4amRwTkVBKzFBdWxZYnovYk55QlJh?=
 =?utf-8?B?ZCs3T3RuU21IaWc4a1RMaFFOaVZMS1JlcUNKcXB5TU1qL2d5bit1WHBuTHJu?=
 =?utf-8?B?YTAvT0lFQjYvRElVa1lTbjhjY3JFaVNJbk1Qa2VOVUk1S2JSeFQ3VDVvbEtv?=
 =?utf-8?B?L2dabzlIM1MzTmRsZEE5dTUzQjBjQnEwVmMwd3ZUQStzZHNJSERlTlVQQTYx?=
 =?utf-8?B?b3BqRzJDSjN3bEZUZG1NeC9OYzJpTGRlQzVrSG56dzdMOVNIMHpRREVTY3Uy?=
 =?utf-8?B?NG1heXk1UzFQVFUvSSszZHp0bnRGbVBhVHpqTU91ZWgwRUUrUE1jaU1WSDcx?=
 =?utf-8?B?Z1hMODdUSFZEdFN6c2ZleG1EeVZ1Z1dCVUZqU3JMQTVINlB6TE95SHdrK0c5?=
 =?utf-8?B?WnFLUEorR1VTRytNTlFpRUNGbTVqVmc2Q0hUZk45QXV0bHBaWEZoNWRDZ1dU?=
 =?utf-8?B?N04rU3k5Y2tIdG03c0tFTkRRVVhUZCtlMUsrZFRZbUhoWkRNOTdUanJUTjNF?=
 =?utf-8?B?eTdtN0k4d2pMZnhnY3NCNlNsMmFWOC9IdUVDb21ESnlZQWlZVVNYdmU4MHFU?=
 =?utf-8?B?VkFSUXpYeXVBelpNRUJXdFFrdVJVWE5RUkxtVHY0YjM2TVQ3dTVocVJkd2Nk?=
 =?utf-8?B?VmZlL01ILzVCeERvclRhenJBZzMvWDg3RWR5RURPd1llQ1U3cFdjcnJYc2tj?=
 =?utf-8?B?T2luLzRvVm1rc3dmeWZwN2lHdjdiNlZ3ZHdiMjVSNEloSHhPRkN1WlNkZ2lE?=
 =?utf-8?B?T1Y2VUloMjFwSk84OG5sTm9GaDZTN1h1SWsrZmhWdWxEaXBXeUY4Y2pFSjFG?=
 =?utf-8?B?UkxoZHF2RUhPem9ENGF0cU4zMVBRU2xKSWwrTEIrZnZhdnl6R2ZVMHlHTjVs?=
 =?utf-8?Q?nZwwtRfC6qPDp9bGUxflQtY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5771e73-22fa-4235-9f07-08dc634c7924
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 04:18:48.4488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o39mWLsZx3nY7pmKjLm0px+ItNT6ea/X9WPwdLQ2L8COO39Yj+Yeka4WV+lkNNTdB/SCoMaw/LLflOAqRMb0OlwGH9fZN7BIG8ThhvK4SpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4740
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

--------------t0f92HECEOjxmXtP2ACXj2Vg
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 22-04-2024 12:27, Aravind Iddamsetty wrote:
> PCI subsystem provides callbacks to inform the driver about a request to
> do function level reset by user, initiated by writing to sysfs entry
> /sys/bus/pci/devices/.../reset. This will allow the driver to handle FLR
> without the need to do unbind and rebind as the driver needs to
> reinitialize the device afresh post FLR.
>
> v2:
> 1. separate out gt idle and pci save/restore to a separate patch (Lucas)
> 2. Fixed the warnings seen around xe_guc_submit_stop, xe_guc_puc_fini
>
> v3: declare xe_pci_err_handlers as static(Michal)
>
> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi<lucas.demarchi@intel.com>
> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
>
> Reviewed-by: Rodrigo Vivi<rodrigo.vivi@intel.com>
> Signed-off-by: Aravind Iddamsetty<aravind.iddamsetty@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile          |  1 +
>   drivers/gpu/drm/xe/xe_device_types.h |  3 +
>   drivers/gpu/drm/xe/xe_guc_pc.c       |  4 ++
>   drivers/gpu/drm/xe/xe_pci.c          |  9 ++-
>   drivers/gpu/drm/xe/xe_pci.h          |  2 +
>   drivers/gpu/drm/xe/xe_pci_err.c      | 88 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pci_err.h      | 13 ++++
>   7 files changed, 119 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
>   create mode 100644 drivers/gpu/drm/xe/xe_pci_err.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8bc62bfbc679..693971a1fac0 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -117,6 +117,7 @@ xe-y += xe_bb.o \
>   	xe_module.o \
>   	xe_pat.o \
>   	xe_pci.o \
> +	xe_pci_err.o \
>   	xe_pcode.o \
>   	xe_pm.o \
>   	xe_preempt_fence.o \
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 0a66555229e9..8c749b378a92 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -465,6 +465,9 @@ struct xe_device {
>   	/** @pci_state: PCI state of device */
>   	struct pci_saved_state *pci_state;
>   
> +	/** @pci_device_is_reset: device went through PCIe FLR */
> +	bool pci_device_is_reset;
> +
>   	/* private: */
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 509649d0e65e..efba0fbe2f5c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -902,6 +902,10 @@ static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
>   		return;
>   	}
>   
> +	/* We already have done this before going through a reset, so skip here */
> +	if (xe->pci_device_is_reset)
> +		return;
> +
>   	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
>   	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>   	XE_WARN_ON(xe_guc_pc_stop(pc));
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index a62300990e19..b5a582afc9e7 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -23,6 +23,7 @@
>   #include "xe_macros.h"
>   #include "xe_mmio.h"
>   #include "xe_module.h"
> +#include "xe_pci_err.h"
>   #include "xe_pci_types.h"
>   #include "xe_pm.h"
>   #include "xe_sriov.h"
> @@ -738,7 +739,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
>   	pci_set_drvdata(pdev, NULL);
>   }
>   
> -static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> +int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   {
>   	const struct xe_device_desc *desc = (const void *)ent->driver_data;
>   	const struct xe_subplatform_desc *subplatform_desc;
> @@ -986,6 +987,11 @@ static const struct dev_pm_ops xe_pm_ops = {
>   };
>   #endif
>   
> +static const struct pci_error_handlers xe_pci_err_handlers = {
> +	.reset_prepare = xe_pci_reset_prepare,
> +	.reset_done = xe_pci_reset_done,
> +};
> +
>   static struct pci_driver xe_pci_driver = {
>   	.name = DRIVER_NAME,
>   	.id_table = pciidlist,
> @@ -995,6 +1001,7 @@ static struct pci_driver xe_pci_driver = {
>   #ifdef CONFIG_PM_SLEEP
>   	.driver.pm = &xe_pm_ops,
>   #endif
> +	.err_handler = &xe_pci_err_handlers,
>   };
>   
>   int xe_register_pci_driver(void)
> diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
> index 73b90a430d1f..9faf5380a09e 100644
> --- a/drivers/gpu/drm/xe/xe_pci.h
> +++ b/drivers/gpu/drm/xe/xe_pci.h
> @@ -7,8 +7,10 @@
>   #define _XE_PCI_H_
>   
>   struct pci_dev;
> +struct pci_device_id;
>   
>   int xe_register_pci_driver(void);
>   void xe_unregister_pci_driver(void);
>   void xe_load_pci_state(struct pci_dev *pdev);
> +int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pci_err.c b/drivers/gpu/drm/xe/xe_pci_err.c
> new file mode 100644
> index 000000000000..5306925ea2fa
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_err.c
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/pci.h>
> +#include <drm/drm_drv.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_printk.h"
> +#include "xe_pci.h"
> +#include "xe_pci_err.h"
> +#include "xe_pm.h"
> +#include "xe_uc.h"
> +
> +/**
> + * xe_pci_reset_prepare - Called when user issued a PCIe reset
> + * via /sys/bus/pci/devices/.../reset.
> + * @pdev: PCI device struct
> + */
> +void xe_pci_reset_prepare(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +	struct xe_gt *gt;
> +	int id, err;
> +
> +	pci_warn(pdev, "preparing for PCIe reset\n");
> +
> +	drm_warn(&xe->drm, "removing device access to userspace\n");
> +	drm_dev_unplug(&xe->drm);
> +
> +	xe_pm_runtime_get(xe);
> +	/* idle the GTs */
> +	for_each_gt(gt, xe, id) {
> +		err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +		if (err)
> +			goto reset;
> +		xe_uc_reset_prepare(&gt->uc);
> +		xe_gt_idle(gt);
> +		err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +		XE_WARN_ON(err);
> +	}
> +	xe_pm_runtime_put(xe);
> +
> +reset:
> +	pci_disable_device(pdev);
> +}
> +
> +/**
> + * xe_pci_reset_done - Called when PCIe reset is done.
> + * @pdev: PCI device struct
> + */
> +void xe_pci_reset_done(struct pci_dev *pdev)
> +{
> +	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +
> +	dev_info(&pdev->dev,
> +		 "device went through PCIe reset, reenabling the device\n");
> +
> +	if (pci_enable_device(pdev)) {
> +		dev_err(&pdev->dev,
> +			"Cannot re-enable PCI device after reset\n");
> +		return;
> +	}
> +	pci_set_master(pdev);
> +	xe_load_pci_state(pdev);
> +
> +	xe->pci_device_is_reset = true;
> +	/*
> +	 * We want to completely clean the driver and even destroy
> +	 * the xe private data and reinitialize afresh similar to
> +	 * probe
> +	 */
> +	pdev->driver->remove(pdev);
> +	if (pci_dev_msi_enabled(pdev))
> +		pci_free_irq_vectors(pdev);
> +
> +	devm_drm_dev_release_action(&xe->drm);
> +	pci_disable_device(pdev);
> +
> +	/*
> +	 * if this fails the driver might be in a stale state, only option is
> +	 * to unbind and rebind
> +	 */
> +	xe_pci_probe(pdev, ent);
> +}


LGTM

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


> diff --git a/drivers/gpu/drm/xe/xe_pci_err.h b/drivers/gpu/drm/xe/xe_pci_err.h
> new file mode 100644
> index 000000000000..95a4c8ce9cf1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_err.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_PCI_ERR_H_
> +#define _XE_PCI_ERR_H_
> +
> +struct pci_dev;
> +
> +void xe_pci_reset_prepare(struct pci_dev *pdev);
> +void xe_pci_reset_done(struct pci_dev *pdev);
> +#endif
--------------t0f92HECEOjxmXtP2ACXj2Vg
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 22-04-2024 12:27, Aravind Iddamsetty
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240422065756.294679-5-aravind.iddamsetty@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">PCI subsystem provides callbacks to inform the driver about a request to
do function level reset by user, initiated by writing to sysfs entry
/sys/bus/pci/devices/.../reset. This will allow the driver to handle FLR
without the need to do unbind and rebind as the driver needs to
reinitialize the device afresh post FLR.

v2:
1. separate out gt idle and pci save/restore to a separate patch (Lucas)
2. Fixed the warnings seen around xe_guc_submit_stop, xe_guc_puc_fini

v3: declare xe_pci_err_handlers as static(Michal)

Cc: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Cc: Lucas De Marchi <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
Cc: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>

Reviewed-by: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Signed-off-by: Aravind Iddamsetty <a class="moz-txt-link-rfc2396E" href="mailto:aravind.iddamsetty@linux.intel.com">&lt;aravind.iddamsetty@linux.intel.com&gt;</a>
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  3 +
 drivers/gpu/drm/xe/xe_guc_pc.c       |  4 ++
 drivers/gpu/drm/xe/xe_pci.c          |  9 ++-
 drivers/gpu/drm/xe/xe_pci.h          |  2 +
 drivers/gpu/drm/xe/xe_pci_err.c      | 88 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_err.h      | 13 ++++
 7 files changed, 119 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
 create mode 100644 drivers/gpu/drm/xe/xe_pci_err.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 8bc62bfbc679..693971a1fac0 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -117,6 +117,7 @@ xe-y += xe_bb.o \
 	xe_module.o \
 	xe_pat.o \
 	xe_pci.o \
+	xe_pci_err.o \
 	xe_pcode.o \
 	xe_pm.o \
 	xe_preempt_fence.o \
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 0a66555229e9..8c749b378a92 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -465,6 +465,9 @@ struct xe_device {
 	/** @pci_state: PCI state of device */
 	struct pci_saved_state *pci_state;
 
+	/** @pci_device_is_reset: device went through PCIe FLR */
+	bool pci_device_is_reset;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 509649d0e65e..efba0fbe2f5c 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -902,6 +902,10 @@ static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
 		return;
 	}
 
+	/* We already have done this before going through a reset, so skip here */
+	if (xe-&gt;pci_device_is_reset)
+		return;
+
 	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
 	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
 	XE_WARN_ON(xe_guc_pc_stop(pc));
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index a62300990e19..b5a582afc9e7 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -23,6 +23,7 @@
 #include &quot;xe_macros.h&quot;
 #include &quot;xe_mmio.h&quot;
 #include &quot;xe_module.h&quot;
+#include &quot;xe_pci_err.h&quot;
 #include &quot;xe_pci_types.h&quot;
 #include &quot;xe_pm.h&quot;
 #include &quot;xe_sriov.h&quot;
@@ -738,7 +739,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
 	pci_set_drvdata(pdev, NULL);
 }
 
-static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
+int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	const struct xe_device_desc *desc = (const void *)ent-&gt;driver_data;
 	const struct xe_subplatform_desc *subplatform_desc;
@@ -986,6 +987,11 @@ static const struct dev_pm_ops xe_pm_ops = {
 };
 #endif
 
+static const struct pci_error_handlers xe_pci_err_handlers = {
+	.reset_prepare = xe_pci_reset_prepare,
+	.reset_done = xe_pci_reset_done,
+};
+
 static struct pci_driver xe_pci_driver = {
 	.name = DRIVER_NAME,
 	.id_table = pciidlist,
@@ -995,6 +1001,7 @@ static struct pci_driver xe_pci_driver = {
 #ifdef CONFIG_PM_SLEEP
 	.driver.pm = &amp;xe_pm_ops,
 #endif
+	.err_handler = &amp;xe_pci_err_handlers,
 };
 
 int xe_register_pci_driver(void)
diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
index 73b90a430d1f..9faf5380a09e 100644
--- a/drivers/gpu/drm/xe/xe_pci.h
+++ b/drivers/gpu/drm/xe/xe_pci.h
@@ -7,8 +7,10 @@
 #define _XE_PCI_H_
 
 struct pci_dev;
+struct pci_device_id;
 
 int xe_register_pci_driver(void);
 void xe_unregister_pci_driver(void);
 void xe_load_pci_state(struct pci_dev *pdev);
+int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pci_err.c b/drivers/gpu/drm/xe/xe_pci_err.c
new file mode 100644
index 000000000000..5306925ea2fa
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_err.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include &lt;linux/pci.h&gt;
+#include &lt;drm/drm_drv.h&gt;
+
+#include &quot;xe_device.h&quot;
+#include &quot;xe_gt.h&quot;
+#include &quot;xe_gt_printk.h&quot;
+#include &quot;xe_pci.h&quot;
+#include &quot;xe_pci_err.h&quot;
+#include &quot;xe_pm.h&quot;
+#include &quot;xe_uc.h&quot;
+
+/**
+ * xe_pci_reset_prepare - Called when user issued a PCIe reset
+ * via /sys/bus/pci/devices/.../reset.
+ * @pdev: PCI device struct
+ */
+void xe_pci_reset_prepare(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pci_get_drvdata(pdev);
+	struct xe_gt *gt;
+	int id, err;
+
+	pci_warn(pdev, &quot;preparing for PCIe reset\n&quot;);
+
+	drm_warn(&amp;xe-&gt;drm, &quot;removing device access to userspace\n&quot;);
+	drm_dev_unplug(&amp;xe-&gt;drm);
+
+	xe_pm_runtime_get(xe);
+	/* idle the GTs */
+	for_each_gt(gt, xe, id) {
+		err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+		if (err)
+			goto reset;
+		xe_uc_reset_prepare(&amp;gt-&gt;uc);
+		xe_gt_idle(gt);
+		err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+		XE_WARN_ON(err);
+	}
+	xe_pm_runtime_put(xe);
+
+reset:
+	pci_disable_device(pdev);
+}
+
+/**
+ * xe_pci_reset_done - Called when PCIe reset is done.
+ * @pdev: PCI device struct
+ */
+void xe_pci_reset_done(struct pci_dev *pdev)
+{
+	const struct pci_device_id *ent = pci_match_id(pdev-&gt;driver-&gt;id_table, pdev);
+	struct xe_device *xe = pci_get_drvdata(pdev);
+
+	dev_info(&amp;pdev-&gt;dev,
+		 &quot;device went through PCIe reset, reenabling the device\n&quot;);
+
+	if (pci_enable_device(pdev)) {
+		dev_err(&amp;pdev-&gt;dev,
+			&quot;Cannot re-enable PCI device after reset\n&quot;);
+		return;
+	}
+	pci_set_master(pdev);
+	xe_load_pci_state(pdev);
+
+	xe-&gt;pci_device_is_reset = true;
+	/*
+	 * We want to completely clean the driver and even destroy
+	 * the xe private data and reinitialize afresh similar to
+	 * probe
+	 */
+	pdev-&gt;driver-&gt;remove(pdev);
+	if (pci_dev_msi_enabled(pdev))
+		pci_free_irq_vectors(pdev);
+
+	devm_drm_dev_release_action(&amp;xe-&gt;drm);
+	pci_disable_device(pdev);
+
+	/*
+	 * if this fails the driver might be in a stale state, only option is
+	 * to unbind and rebind
+	 */
+	xe_pci_probe(pdev, ent);
+}</pre>
    </blockquote>
    <p><br>
    </p>
    <p><!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-US</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <w:DoNotOptimizeForBrowser/>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;}
</style>
<![endif]-->
    </p>
    <p class="MsoPlainText">LGTM</p>
    <p class="MsoPlainText">Reviewed-by: Himal Prasad Ghimiray &lt;<a href="mailto:himal.prasad.ghimiray@intel.com" class="moz-txt-link-freetext">himal.prasad.ghimiray@intel.com</a>&gt;</p>
    <p class="MsoPlainText"><br>
    </p>
    <blockquote type="cite" cite="mid:20240422065756.294679-5-aravind.iddamsetty@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">
diff --git a/drivers/gpu/drm/xe/xe_pci_err.h b/drivers/gpu/drm/xe/xe_pci_err.h
new file mode 100644
index 000000000000..95a4c8ce9cf1
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_err.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_PCI_ERR_H_
+#define _XE_PCI_ERR_H_
+
+struct pci_dev;
+
+void xe_pci_reset_prepare(struct pci_dev *pdev);
+void xe_pci_reset_done(struct pci_dev *pdev);
+#endif
</pre>
    </blockquote>
  </body>
</html>

--------------t0f92HECEOjxmXtP2ACXj2Vg--
