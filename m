Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CE3606A320
	for <intel-xe@archiver.kernel.org>; Sun, 22 Nov 2026 08:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a4cKItC6;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=YTttTcr2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A8410E513;
	Sun, 22 Nov 2026 08:28:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0FB10E4F4
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 08:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795336097; x=1826872097;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pLrwF6VS+g8P28tHwCwFdOCYajkguKBNo3RtV3XoOfs=;
 b=a4cKItC6Bjt4ol0vg/V+jfanwf/erILmn+mLXyvzn5IZX4HT1bWiGikr
 Uf4Le/Q0mX0JQyJn73Scw4K9cbCNps/8qGT14VGThC/Fj16O0XNOlqLYN
 o5rbwBcJlVbF5pl1tzft6FXBk0KK/g9aMOUGOaVmNT7IQEpf6QsXTdTsO
 NlfOp9URI3qkpZT7SyIQ2JxaSNfJowM8M8G8DTmyX/SyNXYz11SpHpWbx
 OPYR+R+vWsPdZdsM79jouxb2EuIfMgI8HnpTd8i/iQvejpAwgXQkJvRTB
 7i/gx8LU/2xIj/ciKYndaVu7IUJP3IALfgmncm/895/7tBvgXzOiCxN98 g==;
X-CSE-ConnectionGUID: 2MnnrNPYQ2q1apX8+lTRNQ==
X-CSE-MsgGUID: zku7fWMITwKenee+kna8QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4057099"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4057099"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 00:28:17 -0800
X-CSE-ConnectionGUID: 3rDuOCt3Tvaz9hZx+jLDnA==
X-CSE-MsgGUID: 8nrsJna2S9K6enr1Vnp2LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; d="scan'208";a="11245806"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 00:28:17 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 00:28:16 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sun, 22 Nov 2026 00:28:16 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 00:28:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2yRhQzVzMN/aZX93+eBHW4m4tMtI1elUgH7R4pTrkvv2ievIrfJSI/f3liF/MxjV8sHaPSZjA5GiuwEOo6CIsYroTaD1e+3qc/+z5fEtCmSCzHPep7kGeoE2J9J4XYYGmzqqrMlu8gKsuk6ERixhmXLvqpd6+6P/daRQ4pNVvF7GKfgW1a/OBPqTw5hz6JRLbvD1j4D4XQtX/hVmPDtoDfIKNj0s9L7wzc1P2xQWXYfYycYEVYrOyQTHioTNoxvOJAlashK6+fjW9R6eP8iAwadttvKiqF8OdixxQbC42OgsmkMtb22IPwYaTZk1fBzySwSgpfnhZj6BmlozUoCKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovh8CrSf/4kIc+GYvv53cnOr6WSSJBipiuvwwS5VMv0=;
 b=wfj4CnjkeYh6XnY21Ek7SScqM+B5j70tjx4yP/tKMWjz63qSBq6mdF2xxCcKxbyhfytKnBnwXCd4NescUCmd/naMy5TbEgtdCxCghYNBX6Jysj1ekx2ezXUqHom1ellGhnQEo6P53Sqkz3+AOFkMRHksxboiNezMNCysisGmDiWi1CfuInD5s3bo8f334LcmWWvGE4ZVdJa+Th6nZIYdmqU1dsBweZ1XFNKHWlgGXESPIjaw0grmoHFqUtluW0iHLvkMU1gjFnIjceAS4+M5VZhUpM5lIRqP6XE5YFqlvIKoqJlqjC4DfIYs8FIoX4lmTp/Ah9JcnUtm9zSLNr6nQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovh8CrSf/4kIc+GYvv53cnOr6WSSJBipiuvwwS5VMv0=;
 b=YTttTcr2aGM4bgo0hB6GUtiRtq8dhzSno9STXvjt157jos3ZHhqUVZWuh9rikkutnuePglHfXIhSDlRGwggY9sKnYnkI3l1j0gMsJkNb2ZtzDNtB6LDfcthEImQ8PCwaALStn+brkLx7CcPCT2Ju5KKT1BVBK12ISBNRE6pmHK8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by CO1PR11MB4852.namprd11.prod.outlook.com (2603:10b6:303:9f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sun, 22 Nov
 2026 08:28:11 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.21.0639.012; Sun, 22 Nov 2026
 08:28:11 +0000
Message-ID: <d3d09c5e-9ed6-4ba7-86b4-3dec77a7a337@intel.com>
Date: Sun, 22 Nov 2026 13:58:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] drm/xe/vram: add decay-based reinstatement of
 soft-offlined VRAM pages
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <himal.prasad.ghimiray@intel.com>, <matthew.brost@intel.com>
References: <20261112124329.2960272-5-tejas.upadhyay@intel.com>
 <20261112124329.2960272-6-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <20261112124329.2960272-6-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0216.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::12) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|CO1PR11MB4852:EE_
X-MS-Office365-Filtering-Correlation-Id: f9507dee-888f-4487-d0f8-08df48728b4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|6133799003|261009221227099003|261009223327099003|261009223027099003|261009221727099003|261009220027099003|4143699003|10067099003|11063799006|56012099006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: INWDuWjCeGHbS2915DZZPBQTq/gGd3/r7IIIgXrrHtHbdVVnhGs/KRV+ckt03DLBLUdPNW25pvBGnVoZa991tdHO1IpIbHozEMD+Tr2qOG2hgn1sTggNQgRkxAQL7dP++YwrK6O8KKN2ZOv1X1+RcgFD9ulVCu+R1uL77Loto7Qk2JeFtVV4jg/eXRaHAI6S92eE6e/POE4hrMXvDzYnMewx2uPXoN24eqY+e1Mh8/iNWE1wEBrPibkNfdQGeK/8//U61kmicuUIEpavlPyFtM5ur3dNhbMWP3JG1mySJenRTcatxKh6DRtewqSoMIjGed/x2nSd9LNuE7/iK1LhdNgchJAZ7Gh41SR50CdHHHz1/qTiDRLE1LOXM/p/paPDf4YFh2PQ4L+nk1LcuEw7XiyYuSuKfaSUWr9sYv5aq6smgsl4BnnoUuvTBM3h0O/punW9Hxk2eqh0O1767RTyopf40SLmLOKzhB0PlV29TACZRb1IH+dS7Kk+DspezOKbLiHppgqjFWirg8T5PwC+Q+1A1YfjCrtQiNrttiDhmd1valTwDT/b3e4pQtvaYq6wvj63bVxeUKdNDH0rKT26yqideuvdBTthROJhJz5yY1eewXSOKcU7O86InB9Wtq4J
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(6133799003)(261009221227099003)(261009223327099003)(261009223027099003)(261009221727099003)(261009220027099003)(4143699003)(10067099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0pJb3dtZEJ2eEQzNEEvcStpUEJpMjdvTmFuRWRlS1FFQTlHRHRxaHRWeVU0?=
 =?utf-8?B?WUswT2F2UWNxTkR1aktNeGZUN3N2akNNbmI1SmFGRGg4MjgrSDRFbzBHUXhW?=
 =?utf-8?B?ODZHaVh5bHA4WFhRTk9PazBRdmpUYVJKTXA1bTRTWVUwODZ1MTdpZzN4M0g5?=
 =?utf-8?B?bnQzWmZBMUptSXA3NmZaUU5TMFZqaENWdWp6NDc4SXQrN0pkWXY5VUZLSTlM?=
 =?utf-8?B?OHhOREVDNGdyekM0N0lkeXNJVWx0M0lXU0NLNHBzMlF4Y0VCbExqNGJmTFpw?=
 =?utf-8?B?OEIrVDZPaHAwbXFSdWFtSmtLWm80Z2NzYnhxa2dvUWR2MVl0S1RIVmQvVFVW?=
 =?utf-8?B?MWlZTExsNFpQa0R1a2ozRVNua04veWlzZUFtZ1VsRDhrRk94MWhVNHdxajNU?=
 =?utf-8?B?VGdlTVRQZHNoSklIU0F4ampOdm0yTkp6MjJrdCtYWCtxdTk3K2RtMXgxYmZp?=
 =?utf-8?B?c0RWdUZtRVJvZXJKNDNDcVF4TkZTS016MEVVSDYrUFJ4eVlmV0RTLzdVby8z?=
 =?utf-8?B?WWVIL0tESXllcEU0VllFQUgxYmNKSjMyRU1tT0gxd0F4TGVCVFltUGlLdENk?=
 =?utf-8?B?SWxQWlROekNjczhkTFVlMi93ek5Ua1ExNDRCU1hEdU14Rlk2b0wrdFlEc1JH?=
 =?utf-8?B?aGtWeWQ0TWFIc2xseHZVaytKc2NCOVRoTk5SOFJKQVZ2YjZ2TW9nRDRYMFBn?=
 =?utf-8?B?SUJURkpRUW56WW5FU0l5VWZNZXBncEFsTFBIVTBsc1FNZUorMzdEZkYwRVE3?=
 =?utf-8?B?TTdJUFJqK211eHBQbGhXYkdCVlRPaG1tWGkzQkJjQlE1QWZHMjNFd0xKbUVz?=
 =?utf-8?B?ZkhzanFZVC9VMmNlOHZmMUFKY1pxeUwyMzZ0dUJsZk16dHpMcHhKQ0hYdWx0?=
 =?utf-8?B?YUJVNFVNV2NwVnlWdk1oTHlZbDZWNUw5V2ZkQ3dOSGpaR0JPTEVlZUs1NUNK?=
 =?utf-8?B?T0xxVXdIRURzU2RZWjFIS01rclVPUnVpcFRVbk1HZnJjNDk0RXRwSEtZUFRD?=
 =?utf-8?B?OUZ3K2YzcXZnaktiRXZyUUZONDdNL1ViT2UwN1VhWFFSd0Z0YTNrZkFuYU5U?=
 =?utf-8?B?cld1eFd4SWx0QzFoTWhaL1lvcGtyaGpmc2JhdDNBQlhYbE9XKzA4eG9oMVEx?=
 =?utf-8?B?c1ZaMmpiV09ka2ZJbXZYbWJYVFN2OVNRYjdrR1J0bkwydy9UbTF5b1dRVzBD?=
 =?utf-8?B?WWRNcjhWUXByVWdyZWRMZFdKZktmNHFsT0Z4WjJGN1oyQnRrUUd2d3AzLzQ1?=
 =?utf-8?B?Qy9UTDZsUnFHamhmN2lPandNSVhaeHU0VDh3dHRSKzRiM3dEaVduMHdvdTNh?=
 =?utf-8?B?ZVJXVXRCLzFFNmdUN1hSeGVUQ3Rycmg2bTk3YlQwMnhHWWZoRHI3MTFBNXJW?=
 =?utf-8?B?amhKb1c3bnlGZ2pZVFNHa1BHNU4xemRxSmFJWklRMmhEVFRhcHdhUkd1aUJH?=
 =?utf-8?B?emorQ24xSWRWTDBHODNwQTY0K2ZsV2pPNTVBUEo1TmZtOEFmWi9wdVhDTGpT?=
 =?utf-8?B?MXFnM2J3ZU5ZMzljRjRLOG94U3BlenkvM0xnV0hHWE1QcDloRHNBWGZRcDBW?=
 =?utf-8?B?WXBjYldaUEFoeWdXSVpCUDdOQzNNT3JOL1ZHaS9oL0lZdWtEdlF0NFBndi9P?=
 =?utf-8?B?ZTN5NFdXam5VUGtyRi9uOUxwN1hFY2l6Y09oRWZOY003NG8yZ2NIYktnVTh1?=
 =?utf-8?B?blRReUtCdFpsWFdPcGFIaDN0WXEwOUpQZm9POHk1QWZvV25oZGhSalppSFdL?=
 =?utf-8?B?UUJlRCsyQ3pRaUlmSXdHS0NYOER4YWk4b0pKWVh5TWxXSUdQYURtaGJEdi90?=
 =?utf-8?B?WlZZVVhNVndtUnJ3bEUvUWgveE41ZHlidm9xOFRiYTIwL1Y3NzF1OTlVT1N3?=
 =?utf-8?B?bVJXWmZjQm5vbnBueEt6bTdZZWNBTWZpbnE0THNTQlFUZFp5V1pLV0pHbGY1?=
 =?utf-8?B?LzBSekFpbzBpZ2t3Zm90UHV0RnJGK0VxWEJuV042TWJSWFFZcm5TdmEzdFZv?=
 =?utf-8?B?VmxEZG9BK01YaWo3bngvakpETFRjMVY3ODBsQWszM09vWjN5bWxzK3E2VXg4?=
 =?utf-8?B?bDFuMWxBSml0a2hBQ1Z5SjJ2dWRjNTcyVEowcFpnSHJOWC9qOW55bnBpVE9m?=
 =?utf-8?B?VHRJUkViZVUvOURSZGg5WlhYUG9qQWlwZTFVS2lOVDY4Ti9IWFFjenNjM3U1?=
 =?utf-8?B?MFBTSUlHVzJua1pEZFZUUDRpRE9ZM3AzZ0pBTEZyYVNvR2dqT3hnTkdhdkxS?=
 =?utf-8?B?RXRzUGNmWUVvQmhLaFdJWlZtQVpWUGhYTEx0cEFKcXR3SHRiK29GZHhsVmFp?=
 =?utf-8?B?NmVKMEZLU0IrUFJiVkEyYVoyQU1WakJJWWh0WWYwa1hMMUUreHZMdz09?=
X-Exchange-RoutingPolicyChecked: Ef3OZjHH4ixsOMVKofgRQEl+x3BagSLFJNzpfrWN64bNQY9IffjW8e4oUzqI+RpN9W772qHl7d2W5fd3zFG/j8akLM3gVOLvjA0PLUDzZsxj903UpyfqpyQPginNKI/xRgvwOTmT+ypkWTMvW1Hv5yA4b80awBb1gdYVs4t9h4o4CH0chpkTLukKDKNeFG5jkP569hyWqXoXgOPGyeK3cDxKiPzdF1u35XIOybJCkozN7tgk41CGg+mqtPkXgwt+8VxXIaWq2vSMMJXhe805Ob2BLKmUW/7puWLH4/vXmWCueg9+Qvut2Sv6ihs8ilPP1deA5l3kBKJKkFq7ahRX3Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: f9507dee-888f-4487-d0f8-08df48728b4f
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 08:28:11.2548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sd0ZEgg+XvJKHJi9LBhBf1GxsaoUX7N9m8hPt6VI92kXCxAeHq+TNH4AEFb3MV1eevuCJ6mcmSjiZuiWoreQpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4852
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


On 12-11-2026 18:13, Tejas Upadhyay wrote:
> The existing bad-page flow soft-offlines a VRAM page on the first HW
> report and promotes it to a permanent (hard) retirement on the second
> report at the same address. Once soft-offlined a page stays offline
> forever, which over-punishes transient DBE errors: a single hit caused
> by a one-off environmental disturbance keeps the page reserved until
> the next reboot / probe.
>
> This change adds a per VRAM-manager decay timer so that a SOFT-offlined
> page is automatically reinstated after the configured decay window
> (default 24 hours) of no further reports at that address. HARD-offlined
> pages continue to be permanent.
>
> Also adds the xe_page_offline_mode enum (SOFT/HARD) and per-entry mode
> tracking with SOFT->HARD promotion on second hit at the same address.
>
> Configuration via configfs bad_page_decay_secs (default 86400, 0 disables).
>
> IGT coverage:
> https://patchwork.freedesktop.org/patch/765064/
>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_configfs.c           | 55 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_configfs.h           |  1 +
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 64 +++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h | 16 ++++++
>   4 files changed, 135 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 2ddd707a6dbd..306c4019aa58 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -305,6 +305,7 @@ struct xe_config_group_device {
>   		bool enable_psmi;
>   		bool enable_multi_queue;
>   		bool disable_vram_page_offline;
> +		u32 bad_page_decay_secs;
>   		struct {
>   			unsigned int max_vfs;
>   			bool admin_only_pf;
> @@ -327,6 +328,7 @@ static const struct xe_config_device device_defaults = {
>   	.enable_psmi = false,
>   	.enable_multi_queue = true,
>   	.disable_vram_page_offline = false,
> +	.bad_page_decay_secs = 24 * 60 * 60,
>   	.sriov = {
>   		.max_vfs = XE_DEFAULT_MAX_VFS,
>   		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
> @@ -702,6 +704,36 @@ static ssize_t disable_vram_page_offline_store(struct config_item *item,
>   	return len;
>   }
>   
> +static ssize_t bad_page_decay_secs_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +
> +	return sprintf(page, "%u\n", dev->config.bad_page_decay_secs);
> +}
> +
> +static ssize_t bad_page_decay_secs_store(struct config_item *item,
> +					 const char *page, size_t len)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	u32 val;
> +	int ret;
> +
> +	ret = kstrtou32(page, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val > jiffies_to_msecs(MAX_JIFFY_OFFSET) / 1000)
> +		return -EINVAL;
> +
> +	guard(mutex)(&dev->lock);
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	dev->config.bad_page_decay_secs = val;
> +
> +	return len;
> +}
> +
>   static bool wa_bb_read_advance(bool dereference, char **p,
>   			       const char *append, size_t len,
>   			       size_t *max_size)
> @@ -943,6 +975,7 @@ CONFIGFS_ATTR(, enable_multi_queue);
>   CONFIGFS_ATTR(, migrate_ulls_period_ms);
>   CONFIGFS_ATTR(, enable_psmi);
>   CONFIGFS_ATTR(, disable_vram_page_offline);
> +CONFIGFS_ATTR(, bad_page_decay_secs);
>   CONFIGFS_ATTR(, engines_allowed);
>   CONFIGFS_ATTR(, gt_types_allowed);
>   CONFIGFS_ATTR(, survivability_mode);
> @@ -954,6 +987,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
>   	&attr_migrate_ulls_period_ms,
>   	&attr_enable_psmi,
>   	&attr_disable_vram_page_offline,
> +	&attr_bad_page_decay_secs,
>   	&attr_engines_allowed,
>   	&attr_gt_types_allowed,
>   	&attr_survivability_mode,
> @@ -1239,6 +1273,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
>   	PRI_CUSTOM_ATTR("%d", enable_multi_queue);
>   	PRI_CUSTOM_ATTR("%d", enable_psmi);
>   	PRI_CUSTOM_ATTR("%d", disable_vram_page_offline);
> +	PRI_CUSTOM_ATTR("%u", bad_page_decay_secs);
>   	PRI_CUSTOM_ATTR("%d", survivability_mode);
>   	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
>   
> @@ -1427,6 +1462,26 @@ bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev)
>   	return ret;
>   }
>   
> +/**
> + * xe_configfs_get_bad_page_decay_secs - get configfs bad_page_decay_secs setting
> + * @pdev: pci device
> + *
> + * Return: bad_page_decay_secs setting in configfs
> + */
> +u32 xe_configfs_get_bad_page_decay_secs(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	u32 ret;
> +
> +	if (!dev)
> +		return device_defaults.bad_page_decay_secs;
> +
> +	ret = dev->config.bad_page_decay_secs;
> +	config_group_put(&dev->group);
> +
> +	return ret;
> +}
> +
>   /**
>    * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
>    * @pdev: pci device
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index d726800de26a..231148dc3338 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -25,6 +25,7 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
>   bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
>   u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev);
>   bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev);
> +u32 xe_configfs_get_bad_page_decay_secs(struct pci_dev *pdev);
>   u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>   				       enum xe_engine_class class,
>   				       const u32 **cs);
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 36d47de8b11b..ed0ca5f2b144 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -355,6 +355,51 @@ static const struct ttm_resource_manager_func xe_ttm_vram_mgr_func = {
>   	.debug	= xe_ttm_vram_mgr_debug
>   };
>   
> +static unsigned long xe_ttm_vram_decay_gc_period(struct xe_ttm_vram_mgr *mgr)
> +{
> +	unsigned long period = mgr->decay_interval_jiffies / 8;
> +
> +	if (period < msecs_to_jiffies(60 * 1000))
> +		period = msecs_to_jiffies(60 * 1000);
> +	return period;
> +}
> +
> +static void xe_ttm_vram_decay_gc_worker(struct work_struct *work)
> +{
> +	struct xe_ttm_vram_mgr *mgr = container_of(to_delayed_work(work),
> +						   struct xe_ttm_vram_mgr,
> +						   decay_gc_work);
> +	struct xe_ttm_vram_offline_resource *pos, *n;
> +	struct xe_device *xe = ttm_to_xe_device(mgr->manager.bdev);
> +	unsigned long now = jiffies;
> +	unsigned long decay;
> +
> +	mutex_lock(&mgr->lock);
> +	decay = mgr->decay_interval_jiffies;
> +	if (!decay)
> +		goto reschedule;
> +
> +	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
> +		if (pos->mode != XE_PAGE_OFFLINE_SOFT)
> +			continue;
> +		if (!time_after(now, pos->last_seen + decay))
> +			continue;
> +
> +		list_del(&pos->offlined_link);
> +		xe_ttm_vram_buddy_free(mgr, &pos->blocks, pos->used_visible_size);
> +		--mgr->n_offlined_pages;
> +		drm_info(&xe->drm,
> +			 "decay: reinstated soft-offlined page 0x%llx\n",
> +			 pos->addr);
> +		kfree(pos);
> +	}
> +
> +reschedule:
> +	schedule_delayed_work(&mgr->decay_gc_work,
> +			      xe_ttm_vram_decay_gc_period(mgr));
> +	mutex_unlock(&mgr->lock);
> +}
> +
>   static const struct dmem_cgroup_ops xe_ttm_vram_mgr_dmem_ops;
>   
>   static int xe_ttm_vram_mgr_dmem_reclaim(struct dmem_cgroup_pool_state *pool,
> @@ -415,6 +460,8 @@ static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
>   	struct xe_ttm_vram_mgr *mgr = arg;
>   	struct ttm_resource_manager *man = &mgr->manager;
>   
> +	cancel_delayed_work_sync(&mgr->decay_gc_work);
> +
>   	mutex_lock(&mgr->lock);
>   	xe_ttm_vram_free_bad_pages(mgr);
>   	mutex_unlock(&mgr->lock);
> @@ -438,6 +485,7 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>   	struct ttm_resource_manager *man = &mgr->manager;
>   	struct dmem_cgroup_region *cg;
>   	const char *name;
> +	u32 decay_secs;
>   	int err;
>   
>   	man->func = &xe_ttm_vram_mgr_func;
> @@ -447,6 +495,9 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>   		return err;
>   	INIT_LIST_HEAD(&mgr->offlined_pages);
>   	INIT_LIST_HEAD(&mgr->queued_pages);
> +	INIT_DELAYED_WORK(&mgr->decay_gc_work, xe_ttm_vram_decay_gc_worker);
> +	decay_secs = xe_configfs_get_bad_page_decay_secs(to_pci_dev(xe->drm.dev));
> +	mgr->decay_interval_jiffies = secs_to_jiffies(decay_secs);
>   	mgr->default_page_size = default_page_size;
>   	mgr->visible_size = io_size;
>   	mgr->visible_avail = io_size;
> @@ -725,8 +776,12 @@ static bool xe_ttm_vram_page_already_processed(struct xe_ttm_vram_mgr *mgr,
>   	lockdep_assert_held(&mgr->lock);
>   
>   	list_for_each_entry(pos, &mgr->offlined_pages, offlined_link) {
> -		if (pos->addr == addr)
> +		if (pos->addr == addr) {
> +			if (pos->mode == XE_PAGE_OFFLINE_SOFT)
> +				pos->mode = XE_PAGE_OFFLINE_HARD;
> +			pos->last_seen = jiffies;
>   			return true;
> +		}


Can we mark the entry HARD if the same address is found here too? A 
second report can arrive before the BO releases the page. The entry 
stays SOFT so the worker can later return a firmware-retired page to the 
allocator.

Arvind

>   	}
>   
>   	list_for_each_entry(pos, &mgr->queued_pages, queued_link) {
> @@ -804,6 +859,8 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
>   		INIT_LIST_HEAD(&nentry->blocks);
>   		nentry->status = XE_PAGE_RESERVE_PENDING;
>   		nentry->addr = addr;
> +		nentry->mode = XE_PAGE_OFFLINE_SOFT;
> +		nentry->last_seen = jiffies;
>   
>   		if (block) {
>   			pbo = xe_ttm_vram_block_owner_get(xe, block);
> @@ -843,6 +900,11 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
>   			}
>   			++vram_mgr->n_offlined_pages;
>   			list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
> +			if (vram_mgr->decay_interval_jiffies &&
> +			    !delayed_work_pending(&vram_mgr->decay_gc_work)) {
> +				schedule_delayed_work(&vram_mgr->decay_gc_work,
> +						      xe_ttm_vram_decay_gc_period(vram_mgr));
> +			}
>   			return ret;
>   		}
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> index 4a2cd27a5b61..0a6d8f8c2aa8 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -7,8 +7,16 @@
>   #define _XE_TTM_VRAM_MGR_TYPES_H_
>   
>   #include <linux/gpu_buddy.h>
> +#include <linux/workqueue.h>
>   #include <drm/ttm/ttm_device.h>
>   
> +#define XE_BAD_PAGE_DECAY_SECS_DEFAULT	(24 * 60 * 60)
> +
> +enum xe_page_offline_mode {
> +	XE_PAGE_OFFLINE_SOFT = 0,
> +	XE_PAGE_OFFLINE_HARD,
> +};
> +
>   /**
>    * struct xe_ttm_vram_mgr - Xe TTM VRAM manager
>    *
> @@ -37,6 +45,10 @@ struct xe_ttm_vram_mgr {
>   	struct mutex lock;
>   	/** @mem_type: The TTM memory type */
>   	u32 mem_type;
> +	/** @decay_gc_work: reinstates expired soft-offlined pages */
> +	struct delayed_work decay_gc_work;
> +	/** @decay_interval_jiffies: soft-offline decay interval */
> +	unsigned long decay_interval_jiffies;
>   };
>   
>   /**
> @@ -79,6 +91,10 @@ struct xe_ttm_vram_offline_resource {
>   	u64 addr;
>   	/** @status: buddy reservation status */
>   	enum xe_page_reserve_status status;
> +	/** @mode: soft or hard offline mode */
> +	enum xe_page_offline_mode mode;
> +	/** @last_seen: most recent hardware report time */
> +	unsigned long last_seen;
>   };
>   
>   #endif
