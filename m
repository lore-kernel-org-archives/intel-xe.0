Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B116CC25B78
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 17:01:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3788D10E004;
	Wed, 22 May 2024 17:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IX5ZEDkL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C3F10E135
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 17:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716397279; x=1747933279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+xhFu7bdsdOJLOsLqXyzHCyrfZDxsLH16HvOq8llWLc=;
 b=IX5ZEDkLUUeL0Tmk6OMttwviOp4tdMPfIufEVNtWxNi1Kxux5B7vh+XS
 myFvkgPnL9lScTYXpuROqFvdZU7SXFNvilVrGH/GP4Md/Rvq8YZnNPrbM
 ZSHb5qal6heIDv40Bw9Ph5gHnuiWXQGZ8Bvp7h577CL2P4bIle6o+9hwW
 Y+uw3ErjQ/eq2dmp6okC6hsg39zqVQT7tk5FEog+xjrQ8n5rg50dJcS5E
 1Dtztr2ct/SAIPKoo32NRiSoS2/oOE0UcdSyllYsxmnnbadj8cxSNcg6m
 Nn2V3j+hgufny6vlGOMoIMWiSg9sx3WwwGimf7P90VIwL5VexESFTnX3J A==;
X-CSE-ConnectionGUID: TV4/78D/T2qyTglbj/Ddfw==
X-CSE-MsgGUID: ifhkS/unQeub0RwQyEwZwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="24070983"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="24070983"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 10:01:18 -0700
X-CSE-ConnectionGUID: rBsM65pGSR+w0uFSMbwH0Q==
X-CSE-MsgGUID: UDvB3WhiRPuB/9JcQTdZfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="38203537"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 10:01:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 10:01:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 10:01:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 10:01:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsVm/gDjREM4t66nkOeB327g3rJCt0l+aFvLe71BnibwAwF6fzybDn3TuhMZYzO5FCi/EgRtchkVf6bqMPJnYrallDt07F5hRSwiG6jRu96+UkBtgxheHjykm2gNkfJw1zQ9fHTsKGe5zXnKfL5XyU1Ub7c/4/lzQ9ItLrfrTRFw5BOqb6Ga2kaBAwKHRMmZABjigcIQuDWsbkIpDSzm9BersoKngdqOWLdYk7G67HmKQlunjwFHrm5cj8hO1aXHjbCR8F7kQXDSi4aJk8gHXjsN7XshNwFaI83m70QTnF+OG1t17ytuVWBvilMoT2RJOuvxXY3WjrmNq1g3kxWJjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+3CC1Sn25FVpXwg/nMbeVtPqeRK+66Nk9HrrJX1eGU=;
 b=B+ZcKQ6/R9ZapDIOiOSB/ZRXjiVGgTjprZyIpkgkpvKOLPQEIiEqUoGdAanVBDn+SmvmcNQjYQPUTz0sBgtdCf6R2j37qvNU9XgUcx/CR9zgLgFmjRkr+dIhGWqFfgBoGEe2/HtEMpovVSgQ0BDHgR9wpmHEQVSbWohCTL7EZvUGtUYaO5Ty7T6VTw6Jb2BFccjDKnwum2Zvc3Y2U/njdx2L5m5pPxgp26IJv1WLnBYCzi+jEFn+xRYgHOaBieReiTiFj0OFm5+x+nAOdteIp99yFv4XSa6sX5Yi6mp2Ljd1+/LdlGiT/hIz9jK7bb7LRbKger2kCKBjG67TqhJgxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB7253.namprd11.prod.outlook.com (2603:10b6:8:10f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 17:01:14 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 17:01:14 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: [CI 2/7] drm/xe: Fix xe_pm_runtime_get_if_in_use documentation
Date: Wed, 22 May 2024 13:01:00 -0400
Message-ID: <20240522170105.327472-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240522170105.327472-1-rodrigo.vivi@intel.com>
References: <20240522170105.327472-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:a03:180::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: f678e3f8-6a91-4d33-d081-08dc7a80c9f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2wwM01ZUjQrWVlSblJMbTJiaXc0enc1MXByazRIWkpnbm8wcFd5N2hUSG5O?=
 =?utf-8?B?eVhpSmRwcHFVMm5obENnbzZDanhpbzVQc0JLM09EN1pRbTY2Mmt0UW9iN1By?=
 =?utf-8?B?N3hhb1VjOEIwbVZ0WE1BUXVlSG5QN1VpM3lRMno1RG9VajlEck5jcmUzVmdM?=
 =?utf-8?B?eHEvQ2NRcU90bGVncWFEUjdDNjF4NHRhMTZJa0dYWGhhQVBnV0N3WUZmNUpI?=
 =?utf-8?B?NTdkWXZkejRkU1hUM2NaV0dIckNRVDlOd3F2eHlnU3VhbVZyWHlKakt6N2J4?=
 =?utf-8?B?QS9KZDdQSmRhTDRaTG9VbmpQbVh4d3dJOVB0V0hiaUk2bDQ1TFR0NzVvVnhR?=
 =?utf-8?B?ODZpdUhOMkJsZ0xrU0tFTU1GZ2ZKYklIT1dHWWlGVjJCVUl6R3NTYlR5bWRp?=
 =?utf-8?B?MnZyOW1URCtjTVVyUDdlZDh1WjBRbG5XdkVMRmdadjgyRTkzM252S0NjN0Ru?=
 =?utf-8?B?Rm1YVThxa2FLd3NPczhuTHNjU3pLWWNzNU1FRGlRWko4SFpoR2JnVWdSc0pa?=
 =?utf-8?B?aG1GcXhQQy9Hcm5RRDh1b1RSK2gzY3N6dkhUUGoxZEM5UUtXWjN4UDQzRUE0?=
 =?utf-8?B?Nmdvam9PRVVEMmpIQWVDUmxkcENZRkJINWo0VGhCc1Y3RHpsQ3lnNWVkTzBB?=
 =?utf-8?B?alpTc0lVZDZjMDM3a1g1U2htY0lCMUtrQ25COTZxWHpyK2Z2aVlSdU9DOGxM?=
 =?utf-8?B?dENEbGhndTUrT3FDQ1hVYzFQZ3A4MWliTkQ4VFpiUURkSWNmQnh3WTNtd3U1?=
 =?utf-8?B?TE1vR0VQcXlHaGR3cFJYWTQxMm10bm1ZZENMUFM0NTlTajNBVEVtc1JrT1l2?=
 =?utf-8?B?WTNUVDEvSEVHREhkczJPb1ZCTUlVVXJ2RHdBb0ZEOUlrM1FQYVNMZVVjM2hI?=
 =?utf-8?B?MHZwQkp6d0pFL3hqdU80Unl1Lzg1d0tQUFNTdWV6T3VML0ZqZm95d0RwdHdI?=
 =?utf-8?B?NTdKRUp1L1hSR3dIR201eWtJU2NseWMxNW5wclhPV0kyODBjSHpvRUkyZEdt?=
 =?utf-8?B?aEMyVExQbzMzTW5zb3VzcC8xSWtaZUowL05UeEZjM1J5c2VTeFNXYVJTaExi?=
 =?utf-8?B?aUtXR3IyVyt5KzlQckxTMGVHOXpBNHNxdGVqMjQ4U3hzbUNxQlI0OTVlTGRX?=
 =?utf-8?B?eFFud2N1WmQzanFKZnhoUE42OVdOMEM0WTZ0L3ZzYnN2NlJGTHpjWWpiTDRo?=
 =?utf-8?B?ZzM5Nm1jcmVNMzZlRS9jenBOYWFTc3E0QzBWREpIQm93aUliTitYaEpRenhX?=
 =?utf-8?B?ekpJRTU0Wm9zYVhJRlZ4ZEVuN0h1eWFWUm9XT0ZmUHhHUGJjQk0reUZCV0cr?=
 =?utf-8?B?bXFJbmRwVWovNElYUHhqRi9WTW5zUWRORnN1V3ljSnYwTDBUSVBsRzRZLzJK?=
 =?utf-8?B?WVNUc1lsSEVxejZpQm4wQ051M1ZTa3FqYUtsN2FreTIyTkhtLzFnWnRXMzNw?=
 =?utf-8?B?VFhnTmZBdHV2TmtTc2pjc1ptdkUrRVl1akJCOHVmOUdPNi92bk5ERExCUlZS?=
 =?utf-8?B?SW1EcUdMYiswdkJtKzA4VGRQcXd5MXF0Vm5lQlhIY3Jyejh6TTExQS9YS1ov?=
 =?utf-8?B?QXdTcHdmU0dQb1ZtVmdpRUZIN2wzOVJpNzlxMGtIOEpON2p6aUhaZWJuMEhM?=
 =?utf-8?B?Witid2NVdCtWSTVkUVZyL2xpTm1nVWNVSGlWVUdPRFJva1k2ZHV3VGw0Vm02?=
 =?utf-8?B?MXdzSDBSL09Xc2Z2VWhjc3h0eFdoeFNoRmlTcGcyOS9CcE8xZkluZHd3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkhsUXdvdjlmTDlENjJheEkwQ2greEpGSWtFcVBFY25FT2MrVE9ycWRPSFVI?=
 =?utf-8?B?VUlkVmhDUTZTNDdvUjI0ZzZzdS82OU1KWkJQL1JwNTBhS3pTZTREUEVXc1V6?=
 =?utf-8?B?YTRoZ3FYSURueUVlTnJKMlF2ZnB6WHA5YjNUcVNTc1JBcENwWkQwaTh3blE5?=
 =?utf-8?B?bkhlMXlpWEd2d253YmMyWDJlYVp1WGVYcTFHMGdJQVlSUTI4KzlzV3Nudnp5?=
 =?utf-8?B?VkJBczBlbHkzV0ZXRTdyZnVyUWExWDd6L2t0YUVUa2pkcHRNNzE3N3hsTU16?=
 =?utf-8?B?TzF2Y0s4WmVnaXhXN1VSalRRMmhZbjBCc2t6NkxpK3hOU0xJbVlTR0JvNlZq?=
 =?utf-8?B?KzN2UHYvYno3M0JpdGRTSXRYUWhYZ3RhdXRHNjdvNDUvbnVoQzZlTzFPT3VG?=
 =?utf-8?B?ZFY0dnV5c282MzN2L09vMmdjbFBTUlJjMXVuK2UyRFZ5THJyU3djQ3o0WTd0?=
 =?utf-8?B?K21yZUd3TXVPcmVVcGR4UjByUTRsNGVwMEUxMkMzSjBqRy9PUDVWZXI5UEhQ?=
 =?utf-8?B?ZlR6VGlpSTNEbGIxSldUTzBjcURVcjF1T0hxQkd2V0d5ZHFtZGsyZ0c2dE5I?=
 =?utf-8?B?d01TZ0d6MVEwUDBQUGo5UHhJSitDcnB4ZEFmUThwQ2xEUmY5SDF1YnJuT2RB?=
 =?utf-8?B?WHZDM250VHY3aEdzVXJ1N0JPclFyL1Zub2pTVVl4emFpOFdIWlgvRzJyelU0?=
 =?utf-8?B?anRrMWo5MWY0TUZrcHNhQXVKOVRCc1pBdzE3QktWUWorUlo1eXc5ZlIzUTk2?=
 =?utf-8?B?MWR2TlJYUWlZUmRGbjk5SzJ4Y3VDc25sSWIzVDVOOUF1cHVhcEhBM3hWUGI3?=
 =?utf-8?B?ZW4zd29JS0djUnFaWVZjd3V3UFVpeHFBT0t0TnNWdUxVTUc5L0xhdXBZRjY0?=
 =?utf-8?B?TXliUEZUY0tGM2x3Q1B5S3ZCb2d1OUpGV1laRk54dVBEWFFmeXc5bkwybUdR?=
 =?utf-8?B?REMxbGRyZjFDQXFvUkZtUnpGYk52eGR4N1lacVVQejBJc2dSY3Y0NzZpYk44?=
 =?utf-8?B?T0lsM1VjZVoyWStBUDF1cklmQTNBQXdUOTdWbStYSTlETGE4WC9jQnBjYjho?=
 =?utf-8?B?dWhLTnNNbG11cHdOdDFNV05TbTM0dUtWM2xJdDBsNnNtcWt0OWN4d3ZkTklP?=
 =?utf-8?B?UkgxQytRLzJPaGZOZXBIdDd4RjBkaFpYSHNvSURVVGJUZHpYM2xEdXdOaXcv?=
 =?utf-8?B?djJkUTNzVWRsdU9sdDlITkJ4QW9tZlBpbC8zOGt2UUJTdW9henBCL0kzR3Jp?=
 =?utf-8?B?Wk9XcitMTDRyTjVWMllzMysrNThFYklJeWdlUldvZDVYZVNnTEJTcXZ2Y1c1?=
 =?utf-8?B?V28raFFsb3BZNldIV1FUZytYeGFQRzA2TnNxa0pUQkRBQTFoeTFNMjBwNGt6?=
 =?utf-8?B?UkRmbVF5UnZjMCt2TzQxSFlKMzU1ajU4NXFrY2RtVU5nN3BaeXN5VEZ1UjNY?=
 =?utf-8?B?UEh6VkZNOHk0eWlXSnVGaGtNS0oxYXFBQXdkclo1SW4zNHJ5M0x6STRlTTc3?=
 =?utf-8?B?M0RlOUlPclBUWVdIWk5uZUd4ZEc0dVdaRGxRWGZDdVFLeHFMZ012UGhuUlN5?=
 =?utf-8?B?R2hNNkpwZy8vTFJJZ0JaRHJyTzBxblR1MmtWeFh4SXZXd2dUUWxTQjBkTGhZ?=
 =?utf-8?B?R0NvcnkzZlJVUU5jYVJnd2lRdnBxYUJjaDZRVExNYlM2VzNlMERHUXR1d1Y2?=
 =?utf-8?B?K3pQMDlQaGh3QjZmRDRwQmlnd2Noa1pRV1BnTjhraU0zYXFudXN4eHN1RENC?=
 =?utf-8?B?WHhrdVBtNWlJRkZGSWpnL3g1UTM2VFhmSWtzblg4ZkpyeTh4MVNhQ2pDOVhE?=
 =?utf-8?B?bitsSlFzSi9XNGtKM2ExazMvNzZjb2RZNWR6djJqTlNkSmFaRVR4UEUrT3lQ?=
 =?utf-8?B?OW5FSGNYeUJiM1l2bnZZa2hsV3oxTG1MWGlEL1dBWU9BL1hMelFtdDhiSTUr?=
 =?utf-8?B?a0p3TWZ4bXk2VDJzaW5iZ29FSnNMUUxUUjU0L3U3MHpXRVhKVi91UlVscWdW?=
 =?utf-8?B?UGtzTUptZnhJSG9RU3NOMWJPL0g0SnFiMkpCN1FYZ1RFb05jeXNDZzd1aWVh?=
 =?utf-8?B?dFB3Qzhpa0ZxYk1KM1FjNzhEeXlOQXhlbG9RdUhTck5BV0JMcTZvai8yc1VE?=
 =?utf-8?B?V2RoTlJuaG83eExZNTluOVdWSjNqa29GNnVsdTE2WkFpSUFnb3VhWUlPYUh5?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f678e3f8-6a91-4d33-d081-08dc7a80c9f3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 17:01:14.3041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7k3u4G4PMify/uOsswo8AtT3VtuCPMWTYLajnDaICWGhyQTB8p2fwKpMXg0FVFarLpO1uXXe72sUo4KJV1XCjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7253
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

Let's be clear on what it is actually doing and align with
xe_pm_runtime_get_if_active doc style.

Tested-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index d14741f35cc4..c3ef2283770f 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -514,10 +514,11 @@ bool xe_pm_runtime_get_if_active(struct xe_device *xe)
 }
 
 /**
- * xe_pm_runtime_get_if_in_use - Get a runtime_pm reference and resume if needed
+ * xe_pm_runtime_get_if_in_use - Get a new reference if device is active with previous ref taken
  * @xe: xe device instance
  *
- * Returns: True if device is awake and the reference was taken, false otherwise.
+ * Return: True if device is awake, a previous reference had been already taken,
+ * and a new reference was now taken, false otherwise.
  */
 bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
 {
-- 
2.44.0

