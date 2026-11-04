Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6DC606D801
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 12:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cOFRipT7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D65210E772;
	Wed,  4 Nov 2026 12:58:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF3E10E8AB
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 12:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793797132; x=1825333132;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q3Vmw4aadX+cH4aG+gjsgkKq2Iy0LjOYnaRP68Pmy4Y=;
 b=cOFRipT75jTrcxcbmB4yS+XXAZC6PpbU98y2Qw9EgCF/J528D7bSdwmc
 QQ6NHazQJCUTWXaNe/lY1wf7A3E44MLKiYJuezqldkc+aXJMYNG8oGmu8
 T5NxCoqNxHE+Ck98UFjJyQevVeEp6nnadIb4WbFFVcJMe3zAQDdcWMYKT
 /wLDRC3AVgCA/J2DoqIKPhnRMePu/WkSqkIdXUU37W1zv1izvCCy8Cx80
 92Om44DwfHHD7c5KBX4NjxBaUn1A8CzbqCk8TO+8ThlAFMuwnnN8+kXb0
 abUrxW1CJ3eLdosLFYsYy54Fkgn79gFHhQhcH676qwPQm63Ay+8bsTWy7 g==;
X-CSE-ConnectionGUID: bH/fBmG/TNm+LvxD7ixT6w==
X-CSE-MsgGUID: LexPTwsgQZm7dd0DSUauxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2555490"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2555490"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 04:58:50 -0800
X-CSE-ConnectionGUID: RnLqzDhDSmSn2smoMKXoeA==
X-CSE-MsgGUID: OayRLcitRhymV7NM60/FZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6564161"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 04:58:47 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 04:58:47 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 04:58:47 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 04:58:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVzVr8+Ifqbm9ox7JBU8VJRL5MvNOk1/Je9XFRmryZCLN1ecq8FlnBOHX40panUEZvNMQIHWfw6GBl1sd10ebn8xaC91gwQfWvtncUX5dX2tTQIrODTjkNfZDBT5vLmXOIN3uY3go065cxnnE3SW69vr2t29SzjVlWYfH6h3K6W1Dy22poGx1V/K+bf8OP4BpEm3swEdCXYMJkISHuo4kdGTyiDRZVSvu/IOwtD9AAo6fOtmKhmUXvsILBzJmmcsbNbF6px2g2zYbv8g5UaYSge5IYWotrl616XMjzmNv5/N0OkgCk6VTA0/+3wLeMiQowvxAm2cX/QnxWvAWLEKQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5R+un5fenL/xJzz8+4xKriVYGG11DetYnKq9a5m4++g=;
 b=SoJ7rTczjkoZE1QbEjeRkKLJL4A3zqJOQtDG2gmhGMhb4NFJ1iQbHOUeIFMYV7S0+Gvkvu7pCEXjLPjZmZr/Qw9ZW8yRzJWIP9TC8yMnp5B7pOeZPpxZ2iQpCJ6aoSlgI5Pu6f6yTv/ks2oYWdh3qWOBj1acZFzHZ1FVsVq1K9ZU0+pp5k3gEBM49O5PnuArO5t6JjXKcJFJ4pr17Lm/CBZVQmCfof9d8/2uBkoJHeBLH6ZAme8Q6UcGNvnPt8sNId6JjVxr47moZvtspkfwREfrPslZPkxdtiwbjVGtI2nLUgXsAyArLIT2tauO5hwUN7MFP+yyAV47ktV8RFZMwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SN7PR11MB7115.namprd11.prod.outlook.com (2603:10b6:806:29a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 4 Nov
 2026 12:58:38 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 12:58:37 +0000
Message-ID: <eb674144-e405-4029-acc6-858ee2ee5753@intel.com>
Date: Wed, 4 Nov 2026 18:28:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] drm/xe/hw_error: Initialize hw_error_work per tile
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <tejas.upadhyay@intel.com>
References: <20261103060929.1586783-9-riana.tauro@intel.com>
 <20261103060929.1586783-11-riana.tauro@intel.com>
 <8ec923e1-fafa-44a6-80f0-05e9ce7b14d2@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <8ec923e1-fafa-44a6-80f0-05e9ce7b14d2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0360.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SN7PR11MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: df65de57-18ec-459a-3fe6-08df3a735733
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|261026140227099003|261022105027099003|4143699003|11063799006|56012099006|261028144727099003|261021123027099003|261009223027099003|261021121427099003|261022075727099003|22082099003|6133799003|261026121527099003|18002099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info: b1jOmvHjPkb8CaAHu4woO2eThMttFQcpsM+EqctQe46G35EDfb/2bmB0se1PljtTYNZ2SsFqVB9qhHU1lWhKX4gpyg+kcmh5G+MrMtF6FdjpHTbH1JcJNAvqzp4HAFkByfTyo3HTv1YX1YWJtbBjC0Cab1imRuL9NVtdUoDRV4cyccMbuchwOvZtJB3BAQOxGt1KN6ZZHLdkkBr5C7uNJtqza6cqWS2efECzb0qX1oJTrNghq1uFTC5+impwh/+BHosukggdweiQK7ySV+WlvnpTrdrwgnwn2nzDym5xnucWGCrOrcqRVz50HsQkbn55tx4GmXaHTFFM96+S96BYklERt8aRCyGF33bc22yS1xYwfSLZ0nhioAoZnQwniYNItPWQZ41Ko8ycPjDH+Nh0NXtG+TIbdwaDgKIkj5vzNZylmbw17xrcDfQYbE5rP8Qbc5/KIWge+V21udXW9HSAAiojMbW2c4/b1/GBOSk4ZUDD9TMm3+EXnD/NdHlOlLbrFT1t6YkhQczeQ4XRTFL59Hy3dw2wYRrey258TWNVDsupoc6a3ZXfg0apGg6GIvji1nFpBKB1AA932vufJ0bJO4/CGsFJ6NHwiWRhjfk38515A0R4u5o170zPONTtpwF9K2pPgrsFyBS6CLRaY5BuFc7puGkUNCvX5CiwBeUMM3A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261026140227099003)(261022105027099003)(4143699003)(11063799006)(56012099006)(261028144727099003)(261021123027099003)(261009223027099003)(261021121427099003)(261022075727099003)(22082099003)(6133799003)(261026121527099003)(18002099003)(261102123227099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXMyYTlJSmR0ZjZJdkZTSTdSWFNpY3hlTFE0WExUSXdGdHk1dGN4MVM2WHpt?=
 =?utf-8?B?UHVxVEJFNUEydmo2eXlIOXRFTlZUL1Nwd0FVN1E1VXE0MVFpWFFYQ0dwdFM3?=
 =?utf-8?B?NC9DZGUxai9LMUZqYmQwd21YUnNCWFRGcnhkMmRBRVhBL1p3R3pSYlQ4OFU0?=
 =?utf-8?B?Vy9IMmhwbHRJdTlPeVl6QnYxMnlVVmpseWRDUEZCcHF1NWIxM3hnVUNTZ3Fo?=
 =?utf-8?B?cmp6d1VnYlBxMHg2Q3lSZ0dZVkRVaUxjdEl0Zkp0QjhaVFFOQ2VKdEgwK28r?=
 =?utf-8?B?QmJuTjNRa3lVM2hBRExJVkxXTmRNb3p6MVd2OVE4eFZxQVJyQ1BKWStCK1d1?=
 =?utf-8?B?S0VNcTNvcWQzWWFPdFpuejBKVlBpVnd1QUdOaVhyc1VsaFAxbXpzOWVqMk1D?=
 =?utf-8?B?bFdxNHRta0lmMkpwYWQ2Q1FGNUZlUC94akptcENQYnV1aGEwb3k5VTJ4aFRT?=
 =?utf-8?B?M1BHNVJCdnVCaW9Fc2FXKzBDN1M4dUxDRGRiSmdRZHQ1L1NlUkxEUGZ2dEk2?=
 =?utf-8?B?c2tCQXA5dUYwVlpteUlkZy92MWh0aFFXL21jZ2R0ZnZWMHNvMzVNRU13L3BO?=
 =?utf-8?B?NHp0bnFrSktrc2U4YUNkbGNvVjBzWk5YTkp4SWpMMzRSS09YRlpCNWRyS2VN?=
 =?utf-8?B?TE01NFRKMW1NRXhlSWk5b1pGOWkyM09HcVBRTFJ5bFg5Ry8yMXlIcjRCaHJJ?=
 =?utf-8?B?VWlCdjVLYmUreFNnUHBBVXdGeUE2S0FqWW5Da0xFTU1VNzJMSE02YS8rUURI?=
 =?utf-8?B?R1o3a2JZWlp1OTM0NkpzaUhWd21TT1ZpSHJPeWxTeUdRN3VsZWNuakRWQVpP?=
 =?utf-8?B?eXBxR1pNK0QxOXAzNXJpcXhzSGxvLytENnF4S1RjNXNUT1l4QkQ2L0w4QU9a?=
 =?utf-8?B?Sm1MdFlEWndjM1ZFSXRpcC9XbENadjEvNW1LdzZ2eDlNNXFqVzhBOXhUNE5v?=
 =?utf-8?B?ajlSVnc2T1NNWVpOdWhZWVpMNjBVa2d4SzZuTlFuK3I2ckF4dm1HcXlEYjYy?=
 =?utf-8?B?Sm5Lc3lMZGl3SEhDZmJFZitSeWRkT3dqcHNtZHQ5S2d3bWYwRksxS2RjTGRQ?=
 =?utf-8?B?ejZ2YnFoU2cyMVY4eU5KVnY5b29OaS9QcmtZOEhCem5QWStpM2dIR2VuYWJs?=
 =?utf-8?B?Mlcya1hFczBzT09DeGU5eHdFcHh5UEtTeXNuWGZtL1ZYb2QvMUt2YndsSTM2?=
 =?utf-8?B?OGF2bzBuL3FKQzNSK3VLUmJ4N2VhRytMWEZZZFdBRmg3dnVPZnA5ZlJhWE9j?=
 =?utf-8?B?eVlMSFZmTWs0NVFvZmM3TTFIcmQ0OEp4a2dXRlZhNTBPRkRsRzdJeGhlSkha?=
 =?utf-8?B?K3JPM2dpNFlRWHltQ0ZzNFgwRTE2ZkxXNksvREdYUE5Ka3pPQ2pZMDRIY1p0?=
 =?utf-8?B?cmJYR3dIN21OQTEvWTlFZ2pZK1VUL2g5eW1kWVRmdnlUeFNjWXRleGprMW00?=
 =?utf-8?B?YXJBUWZsUVkwY0c2RGpiYU0yQzRMMHl3ODEzeFhFNWNOVkVTSFNPNXk4cFpB?=
 =?utf-8?B?YkNSMmg4UU8wNTR4Qmdna0Y4NGhwQWNKVnYxU2pZQ3crcllaM0VkdjYzTEd4?=
 =?utf-8?B?bGFsL3pFUnRJUnU5Rm9YeWtxTG5DZ1diYkxWaUxNc2VLOVYwRWxZdkVNd3RF?=
 =?utf-8?B?QWtaQXhTOUlHMWlBdFdyOSt1WGZ4cDhlN0dFcVk4Sk52c3lRbUFIZVBaVDNJ?=
 =?utf-8?B?L1cydU1KanBUK25BVkFJQi81MVY1WGZLeWJkU0xBNm1ETVZ6NGZmQnBwcWY5?=
 =?utf-8?B?Z2VLQWhPM0NkLzd0eGIydVpDV3pOQnN2VVBTei91eHhsSFF3TmE3TzhqUzVr?=
 =?utf-8?B?aGw2M2haMDNiMGZZNnQ4UkpuM2hSdm1FVXpwTmV1aTA1eUlqNk5mWFl3WFB1?=
 =?utf-8?B?VEZGSExTUFFkSXI3RSt1cTlOdUp6elowelBvVENFR0o4cHpqbHRkb1VoT3JE?=
 =?utf-8?B?ZjQ5eTZlQzc4WXZkalV4V3ZyRE5STWdrdDkraFBacS9tOCtCQ3hTNjRRaHQ2?=
 =?utf-8?B?S3RNOWlLbWd2aDU0ekI1eDNONWIrZUVRbUZXbERXMkVOU1Bic2h3dDlBdTI3?=
 =?utf-8?B?MnRNTHhLSFpZR0dCYzNTdTlCL0Vsa0dyU2NWMkdQSGNaOG1naFYrOWt1bHly?=
 =?utf-8?B?eXdNakZlN2pMVm81dGlXNDB6dkEvWldxa2Q0dnlUczZRMHpVNmRTSGRMUHFL?=
 =?utf-8?B?OVJXZXJrMG41UnhyRVZBQVY1emlkSkVXbm1EUzU0VXZqeGMvZExNL09oZzBC?=
 =?utf-8?B?UU1ScXUza3EwSDkyS0hmclZLKzlyM3M3bnNyV2dUYTAwdSt4ZjhZYzYzTmcy?=
 =?utf-8?B?aVVwdU43dHloS3RSVFNzbjg2Qk1ldUo0L1Vyai9jNjMwZnpDZ0cxZz09?=
X-Exchange-RoutingPolicyChecked: tQwgm+c8hiGPJzTEeCGiWNfSK4Up7Y7iis1bm6ER6wE6NjbTFyIgG7hwhP0DxUSjhE8m+YdlXm8flcmizVerXWRAdj/Fm1YBNJHtYiUWo/88yEy1RtEwCmfSoj8P9D9v/fmb2b3t6jv37lc2YKD7P4QP94ytT7L9t1+UrQC525it2NeNBF27yx3Tt0msReTNjTixxVMzHVwMGMRA1rmTmj+JP4N5gEDFHQ1h58VA6AP57zg62pSm2BmcPJAmduyqWa5iU+rey3LbleFKtiNNjV+FRRJLe/oM5F7fru5H3Avc73HL9DP+wH1FV/kTfih6uri5N3U9v4pP0a/A6tSeyA==
X-MS-Exchange-CrossTenant-Network-Message-Id: df65de57-18ec-459a-3fe6-08df3a735733
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 12:58:37.5681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hetjwLrCZFtsemD+lLLsTVxHrwIVXT/jLPFmHBJ5psLM1wjlzdV3Fjv41Dd8gMByBLKxjAaP6kii4sCLBkuuwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7115
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 04-11-2026 15:01, Mallesh, Koujalagi wrote:
>
>
> On 03-11-2026 11:39 am, Riana Tauro wrote:
>> Since hw_error_work is now being reused generically, initialize it per tile
>> so that we don't hit uninitialized work for non-root tile. While at it,
>> disable hw_error_work on remove to prevent UAF during unwind.
>>
>> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
>> ---
>> v2: move disable work to xe_device_remove
>>      add dgfx and sriov check (Sashiko)
>> ---
>>   drivers/gpu/drm/xe/xe_device.c   |  3 +++
>>   drivers/gpu/drm/xe/xe_hw_error.c | 24 ++++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_hw_error.h |  1 +
>>   3 files changed, 26 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 07a7ab6ac083..8f498e3e3e58 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -45,6 +45,7 @@
>>   #include "xe_guc.h"
>>   #include "xe_guc_pc.h"
>>   #include "xe_hw_engine_group.h"
>> +#include "xe_hw_error.h"
>>   #include "xe_hwmon.h"
>>   #include "xe_i2c.h"
>>   #include "xe_irq.h"
>> @@ -1118,6 +1119,8 @@ int xe_device_probe(struct xe_device *xe)
>>   
>>   void xe_device_remove(struct xe_device *xe)
>>   {
>> +	xe_hw_error_work_disable(xe);
>> +
>>   	xe_display_unregister(xe);
>>   
>>   	drm_dev_unplug(&xe->drm);
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> index a934b649575c..aaa2437d40bf 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -537,6 +537,24 @@ static void process_hw_errors(struct xe_device *xe)
>>   	}
>>   }
>>   
>> +/**
>> + * xe_hw_error_work_disable - Disable hw error work
>> + * @xe: xe device instance
>> + *
>> + * This function disables work for hardware error handling for all tiles.
>> + */
>> +void xe_hw_error_work_disable(struct xe_device *xe)
>> +{
>> +	struct xe_tile *tile;
>> +	u8 id;
>> +
>> +	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>> +		return;
>> +
>> +	for_each_tile(tile, xe, id)
>> +		disable_work_sync(&tile->hw_error_work);
>> +}
>> +
>>   /**
>>    * xe_hw_error_init - Initialize hw errors
>>    * @xe: xe device instance
>> @@ -546,12 +564,14 @@ static void process_hw_errors(struct xe_device *xe)
>>    */
>>   void xe_hw_error_init(struct xe_device *xe)
>>   {
>> -	struct xe_tile *tile = xe_device_get_root_tile(xe);
>> +	struct xe_tile *tile;
>> +	u8 id;
>>   
>>   	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>>   		return;
>>   
>> -	INIT_WORK(&tile->hw_error_work, hw_error_work);
>> +	for_each_tile(tile, xe, id)
>> +		INIT_WORK(&tile->hw_error_work, hw_error_work);
>
> What will happen when probe failure occurred after xe_hw_error_ini(), 
> how are tile workers cancel?
>

Makes sense. Will add it in xe_device_probe error path

Thanks
Riana

> Thanks,
>
> -/Mallesh
>
>>   	process_hw_errors(xe);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
>> index 5e3a11424108..944699331a93 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
>> @@ -12,4 +12,5 @@ struct xe_device;
>>   
>>   void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
>>   void xe_hw_error_init(struct xe_device *xe);
>> +void xe_hw_error_work_disable(struct xe_device *xe);
>>   #endif
