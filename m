Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09848E87849
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 16:47:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5A710E712;
	Tue,  3 Feb 2026 16:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J3Fy4Ejw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B1410E712
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 16:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770137230; x=1801673230;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7kzKnTVHs4lT8cz9G+TJyo773H/ZnfjTEEe9rArXsSo=;
 b=J3Fy4EjwM06DtgNa69vJO54lTRk6q/PpOzSDx0gyHsHVowLcFd56hDb4
 WGLv+8vqcfkuRWcE6rcx8//N0VEvQNe5rwQOqRgSJ/BfdNbxEL5N4SOo9
 6C6EwiuLUB8Z0ITs4ZOtmpXe7RpCBE55N5hwdHVMBsJtj5FRM/REthqn0
 iSefc1YHYRtPm0o6DNUwqOiyKKrZjT8atyd9qNPjMaVNynNevunymLQqs
 Dj6fMQPbi8J7k2Sk70AGLpzsugdyCkPFJNppHxQYbSijIIf7DwTdiI5sL
 C7rsr4SzWehFhySPVmOIuITOhjMVS8aSzeGlYl+U3krQ1/3LtePChwPmH g==;
X-CSE-ConnectionGUID: aJbUJfTIQnm7zjWXxgVcZA==
X-CSE-MsgGUID: vD1eQYjQT3eAMYOU0vhvdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71473473"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="71473473"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 08:47:09 -0800
X-CSE-ConnectionGUID: /PInJVWtRNutanjTII0gkA==
X-CSE-MsgGUID: GREbX44tRkC/ykuELu6Jwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="209984927"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 08:47:08 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 08:47:06 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 3 Feb 2026 08:47:06 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 08:47:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9Qpsry9MYjDcqAvcJU7eQybFSnnwgr8K9ipIed3pqwsj0w/wl2YTCksT9mER0Mqr3doiJI2UeWyFyDcfmfRQcU6F8iA0GKcoc4EAe3AH4EiSaiTQZCayKaItJqDENfCJQzXHHCdYvEMq795TYlqPkSX9+XOZPa6M28JJnb+C2REi85oIzBwia5+s+/iIpINdETnw5742p0L/EWIIgX4rill5lYwbV5Ym4AojYCS3aR+utwxTHziwMXI4qLKglayQB0oSUrktSgJzbHbapVbCRPGPpUlRdRDJCVpTiA7UGDZKHQaB1FjLtaSr3BHnu2N5i2jTUvWrjIjBNhMJdqi0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPvhU/RWpDKvGRt4OdgKIrxFbqik+A0eG9YwpGCHbSU=;
 b=h5Swf1ewfxDh+ZsYKN2eySWNSIb+PqzrkbfG2EpLnVHCqwD655y2SAipq3j+O6QK/9VORqNZ40qt3EnInr9OFsc6PAIk8QUAHF3BfoWBS7meONPpPOshvzFOv1BbOyKw9r/Z43r5/zxzk7pBDJEnFjOkurtoAwa+p1TGJuPPkpFgl8rJaopeVTh/+p2BXz4oU0BFJZCWWgEUvFrUlhggoX0mlIdX2CZpTCS7ugQca0UpY3IbnX57xrromepFiCGEAiJr6GSIIQHHok7wgNwNWDMzN8c8Mj+ew2EV6tsdyd2wjyJkiegTi2f2PneF2XNOwEyAQU2too8Zw/VgicGnZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ1PR11MB6084.namprd11.prod.outlook.com (2603:10b6:a03:489::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 16:47:01 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 16:47:01 +0000
Message-ID: <b677bcb0-7db6-4d87-9318-294e004b0167@intel.com>
Date: Tue, 3 Feb 2026 17:46:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] drm/xe: Decouple GuC RC code from xe_guc_pc
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>
References: <20260128022320.1054591-1-vinay.belgaumkar@intel.com>
 <20260128022320.1054591-2-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260128022320.1054591-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0183.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::40) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ1PR11MB6084:EE_
X-MS-Office365-Filtering-Correlation-Id: b1042991-4f0e-4217-6529-08de6343da6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|18082099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2R4VTVEeG53SUVKWWRuYkR5TFp1QWcweHBNTE5KcGZRMldXQ2dFbDd1L0tm?=
 =?utf-8?B?Uk1lcVpoSkxKZ3VQZmVjdnVOMDFKWW5ldWhMUzRmMEVtckw5czhaQmZzMXla?=
 =?utf-8?B?VjlFaFQyUVN5RDF3NWp5eittWlZhL0t4cUwwUlhEamZ1YnpQNHVYdGFrNkVn?=
 =?utf-8?B?cVNUQlhzejM3MDZhRHZMMFNaQm1GUit2ZklHY0cvZ1hWWjFsa0xLZmM5c3JB?=
 =?utf-8?B?eThMcDhlNGtORnhNaGRTRDhzM1RZcDRDLzVhcVZHWGR4emptVHRFMHJaNGtt?=
 =?utf-8?B?RHh3K0NIOUkyN2d5SzFiZDZMMVJNQ3BZbzI0cExpOWdwTWV2SXY2bTNuU3dR?=
 =?utf-8?B?UXFmbEd3UlU3UHBWT0FwcUpLb01oRWNGSkFqZzVUWlNPaXdNQnVkNjBoTk9N?=
 =?utf-8?B?R1NUbUdnQ1N0ZXBIdFVjZkE4S1lMVXNQbzI4V3JhSFMvbStSbDBtdnluTWNR?=
 =?utf-8?B?LzZFamgvZy83YWhnQnNDRmRTeHlHQnNQZTBsWDZlak56d3dwVU1yR2pEZEVU?=
 =?utf-8?B?Q05ZY2ZCZldkSERPTmpIN1hiT2drd3E3THJFQnF2aDRvR1VQOERjbnlUY3pM?=
 =?utf-8?B?aVBGVXRrNE5PaUF4VWpxbnRRL01XYnJhTWdCUkg0WGlnL3lod1A1NFRvUmpC?=
 =?utf-8?B?Q2dMQWxUbzhvcE91ZzJpanc1MmtIZTRBTnY0dUk4ajU4WGNmQS9CYjRLTFo3?=
 =?utf-8?B?bVpsdi9JR2dtQ3hCbG9UVERzVGZFZ1JsS3VzWVo5Q0RrRjY5VmVPWU04N0Ji?=
 =?utf-8?B?LzlFd0FxN2daLzFuTCtxZllaa3pRbE5DdVcxOTAzNTZZVndMUUE4amdwSUJG?=
 =?utf-8?B?ODRPU0N1VVpndlhHeitPM3pVR2pCdTl4aWtLTkpDdzd2VXZsdXR5WklPaE52?=
 =?utf-8?B?cytIOWw4N2RITmJQc0Y0VWlUZ1U0SzYxZzlpSnYyeUdvc0JCbGhJbkVPRkRu?=
 =?utf-8?B?d1lTYjZUbVhQbGY4YTRsMnM4K25LYVRIQksxSDZYYWR1RitCWDJLRGcvQ1hn?=
 =?utf-8?B?bXNKNTBZT2p3SUpncWQxUzJkeVEzODhldTJVMVdhckdCRjljWk9PZzdRdlkz?=
 =?utf-8?B?M2hOdlcwK3BzR2U2T2lSMG92MzB0YmZYOVpVMlBGUjlpREtnU2d6R2ZnbTRM?=
 =?utf-8?B?ekVoWVppdmUxcnNjKzRlcDBhck5hVC9qd1ZzTFlLYjhma21uWjZGWEpaemhP?=
 =?utf-8?B?SG1OQ1Byd2YxSEEwMktwaXhNR2Erc0xZNXVrREhJTUhNR25nTU1hVjZqMEZL?=
 =?utf-8?B?RkI5T0dBeWdReWl5eURYUDJ4dUhvcml5ZFU2QWFSUk44T2ZaeXlkMDU0Z1lr?=
 =?utf-8?B?SWF3Y0FPWlVQRzNWbTlDMUMyRm5lbSttU2ZtK1VNN2RYWTVCS3EvS0lpMUNY?=
 =?utf-8?B?bWN6cC9EazAzQUtpR0tydkZyU3diYjdib0VYMnVsc1F5K0ZFWEprS0pwMm1i?=
 =?utf-8?B?b3dFSEZ1aWVkTzdVMVZSUjVmODF2UlRkcFU5S2NKRm44dEVSYUlxakZJNGph?=
 =?utf-8?B?a3pLQWcvT3BqNHZvRzRZaS8xYWpOdHhtVGpBNFp3WDdnT0Q2OGV2TXJaK3h4?=
 =?utf-8?B?S1dwVElrTUM4NlV2OUxZdVZnamd6ZGhyY0ROejdmMGIyRlVVQU9pZVFuL1NK?=
 =?utf-8?B?THZHUHRXQXREOHJGajBPY1N6d3ZoVEdmUzhRRURXaUpXS0NpeEI0N3JUSElh?=
 =?utf-8?B?QkZFTVlkbkJieUJmM1lmSDJQY3FheXBnN1FhWjRmNXpjWnNmbnlWOEZlZEJ3?=
 =?utf-8?B?b2ZzRGFKYVNwOHIySndyTTcxakFUTFl3Y3FKYjh6c0czYU5mZnU0OXJsOG1r?=
 =?utf-8?B?QUFuV0sxL2dJNGcyQ3JDZHVmN2pTeEQ5S1kxTitQVndVZ01Sbk1ONHBjSzR3?=
 =?utf-8?B?UVB3bVNaQW9vWGxabzVhcCtnWFhmaDRiUTJHZU1XZE9JSEZBanBTeHNBMnZv?=
 =?utf-8?B?emExUWFKcVNSUHVnUEhSUkR4VlNHVTZUTVYwVDR1b2QvYjJJeFp4N3l6T1pm?=
 =?utf-8?B?SGNaL2ZBUjFiUFZtdHpOTEJrbjJMVmVXdWZUOC9DZmNMMEZBa2F5V3daTjhU?=
 =?utf-8?B?enVzWmc3Sy96eDlOYmxyTnNZUm1BMnhUcnRlUWJTb281TWNxYlI5Tm00Q09V?=
 =?utf-8?Q?dN+A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18082099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2lFTEtKMmMzNDk5U044SEFuSCtFamZyY2dZbnJXQlVuMSt1MjFzQ1dHVEVZ?=
 =?utf-8?B?bUJzczh2eFFWamV0WS9sZkt4dEQ1UDRBRGZFZEk3Z0ZLOTlpVVd5R05LcEYy?=
 =?utf-8?B?K0NaT0pDZFErLzRmaitud1lHL3BiRnJJdWQ3bkZmWDhLWk9FOU1udmRUR0ty?=
 =?utf-8?B?S1BFR2xoTEtjd3pmNFA2aVRlbTdsdy9tei8xeXRESmM0YVgrU242T21WQ3N4?=
 =?utf-8?B?SzlPdWdWcGkyUHNaOFM2Wk1lMmdVektVOTNaRWdHaUxuWFNxU2gvSDI0Qk45?=
 =?utf-8?B?RnM2dnF1Z2V2SGZmOVpBZmZmSHFtTlFGV0RvbitUVTNhZ0lMbk5kRDMrYktz?=
 =?utf-8?B?d3NVbHpJcFd4bmMrYWVsQjhkWmQ0V3htbUNUM1R1MENRWnhxS2Z0UmI3UmV0?=
 =?utf-8?B?TmN5d293ZW4ycXMrU20vNGxjbnRNUXdQNE5Zbndlb1dOdC84a2ZTeTJaNU1w?=
 =?utf-8?B?V3p0R2FlcE9BaUtHN05oTStDU1RQMUd5YUI0RldPVHN4eUI0a0YwMm1CTU1l?=
 =?utf-8?B?WnFTRmdZRXdNeGVmbWpTTHVlY2I3Z2xGdENLUVIrd1UxUk9iVWU0T1Q0Y29j?=
 =?utf-8?B?aWdEZlQyTjN4TjVGT1B0TjM0UTNyR3J5UzRZZVM0QVVTckU0bXprYm42YmZX?=
 =?utf-8?B?bndvak9PcisyMXlpY0d4QnhkVjNvcDdMbk1ncTFRUDFwZ3k3Nmduc2VJQ3RJ?=
 =?utf-8?B?Y0xnck1BMFU0V3d0N3BlVVNhZklRcS9McXZVMDUyc29ZVGJHUjZwcEdXVkdw?=
 =?utf-8?B?Z2RsaTFYZ2lsNmlnWmhBTVp4Wk9vSE1Bc3VJTWxSMkcyaWV6aENjOGNUNjFE?=
 =?utf-8?B?bG1nN0dHR0dlcStVSWxTU0w3YzlOWEpQbCt2RndLZjJpRjJlUFhXbndqQVJh?=
 =?utf-8?B?b1ZkdHBGY3pSaytVdnZkYStCSUN6TGxHZzhUV2VjcmI4MVA4b1lzd3dmYnhH?=
 =?utf-8?B?NHdleW9VWHVYaWdYQ2hyZHZ2cUg0WVdFL0Q3L0JvL2pDcnp4NEJ5dWZJZE1L?=
 =?utf-8?B?Tzl6TmpZR2FRV2FUZ1IxcTdoallKZ1pBYVRSZzYzQm9Xb1F2YUY2dzZaWU5H?=
 =?utf-8?B?U2t0UHA1Uys5bXZxUEpkeEpEckNnTi90bFJiRWtXN0hVMTRRRUtKb2NlWXlQ?=
 =?utf-8?B?aWVqR2tVVjM3cWp1OEJTR2x6WVZLOFVtU3FsVGF6SHZab1ZvVnhWdzBUbkVU?=
 =?utf-8?B?VGtueVM2V1RlS2RCN21pTnZzMnBIMTdtY0wyc0RlZHpEMGh0ZGJHcUxMUVdS?=
 =?utf-8?B?ODBMb2ltNkpuTmNXaVNBRFg0dEJxUHQyeS9Cb2hYWDlWK1RyM2IzWWlON3pV?=
 =?utf-8?B?WXpRMXpOUkNxbDFtVFNwMFJYbXh6eHZIRlJoclF4ZXc1NlhZOHpTaklwc0NM?=
 =?utf-8?B?VWV1STBhQzJ2cy8zM3pWQmhxNzJCTnY4QVlpNmJWbmRCemNHcmdQb0hXVDhM?=
 =?utf-8?B?V3AzQmhEQzJwMm1kWXNMdVZqL1M4MUp1b1dYMFE2d1RoR21STEJwWndLL1U1?=
 =?utf-8?B?bTl2MmhQcy9DVzdlNWpMc1UvcStoL1d3VldNbjlUWFJUdEVPYllKbjRTbEJv?=
 =?utf-8?B?dXpaVjJnSUZjdGRiaUhKNFdsdy9GaXJnUjNHQUc3Y0I2QlJxckZndVFOc1FN?=
 =?utf-8?B?N0pTL01ScnFUcXVGNzd1S3hDbWI2aWN4N2xSY1ZicERNTStsYVlQNEhNNWd0?=
 =?utf-8?B?M240dWIydWNnT3ZzeTlKdzRjZWRaMDh6SHlVdGNkRGVoY0tJbW1YZU5KQlh3?=
 =?utf-8?B?RFh5ZVBXL0JpMmRhbjF6dUNwY2Zoa1k0SkdsaDhDYzdOcTFQSW8vUkltZFdY?=
 =?utf-8?B?TzBJZ00rc09saVFYSDNOZnc1L25ENUV5VVBlNUxKUFFIV2M4NVpLSUYzZU1B?=
 =?utf-8?B?Q05VbXhONEl1aUt4SDU5VlU1WnpZa2hOQkd0ZFBwNjZJdlZDY08wTmtNWFlN?=
 =?utf-8?B?SGozTjREWnZTeFdTaER1cEZ6eU9rNFpNUCsrUHUxVWZLYnJCditaREhTcU1z?=
 =?utf-8?B?WFVrMExSUmt3UFk2d3FWZ0VVTFUwclZEZVFLVmVQMEdSclNJcndXcVlkS1Y3?=
 =?utf-8?B?elBJenRpZWN2UXlCako2WVRodkU2R1FMUWllSGFYQTdqQTJiUFdONlBDcUtK?=
 =?utf-8?B?bHl5ajlYMmVONUNqcHZWdDVqU3E5clh0ZlZiWHVteVV5N0VBRVEzdkE4SWt3?=
 =?utf-8?B?eG82bnZReVZlS3R6UDZVRUdWSGhXbWNxZDFYd1AwdHJOL3A0emNtbUtVYjFs?=
 =?utf-8?B?NFNuMkxqTU1JMUwrSmZ3OU1COEs0ejRBYUpDbHVsY24xYlBRRGxQRjk3SFFE?=
 =?utf-8?B?Um8yMDhFUzVydTFzeDBGZkVndHR4R3NjNm83a0xVdXpnMTdFL3lFSkd4YmQ4?=
 =?utf-8?Q?STsXZ7wN5ha0BX4Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1042991-4f0e-4217-6529-08de6343da6a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 16:47:01.3036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IM2CGsSqd45ZoBQM+DDyBAbvQbPDbTabvIwDH0g0NoCVjvXmAchuy5ajN4BpNjecRLc/5F1cygp3ic/hkFDwYtSrvkPj1rN9RktZ+DOdi0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6084
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



On 1/28/2026 3:23 AM, Vinay Belgaumkar wrote:
> Move enable/disable GuC RC logic into the new file. This will
> allow us to independently enable/disable GuC RC and not rely
> on SLPC related functions. GuC already provides separate H2G
> interfaces to setup GuC RC and SLPC.
> 
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
> v2: Comments (Michal W), remove duplicate c6_enable calls from
> xe_guc_pc.
> 
> v3: Clarify crosss interactions between xe_guc_rc and xe_guc_pc
> (Michal W)
> 
> v4: More comments (Michal W)
> 
> v5: Remove rc_init and use enable/disable (Riana)
> 
> v6: Link to kernel docs (Riana)
> 
> v7: Don't call devm_add_action_or_reset() in rc_enable (Michal W)
> ---
>  Documentation/gpu/xe/xe_firmware.rst |   3 +
>  drivers/gpu/drm/xe/Makefile          |   1 +
>  drivers/gpu/drm/xe/xe_gt.c           |   1 -
>  drivers/gpu/drm/xe/xe_guc.c          |   6 ++
>  drivers/gpu/drm/xe/xe_guc_pc.c       |  70 +++------------
>  drivers/gpu/drm/xe/xe_guc_pc.h       |   1 -
>  drivers/gpu/drm/xe/xe_guc_rc.c       | 129 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_rc.h       |  15 ++++
>  drivers/gpu/drm/xe/xe_uc.c           |  10 +--
>  drivers/gpu/drm/xe/xe_uc.h           |   1 -
>  10 files changed, 172 insertions(+), 65 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.h
> 
> diff --git a/Documentation/gpu/xe/xe_firmware.rst b/Documentation/gpu/xe/xe_firmware.rst
> index 5d23e9f27391..9c15a300bc62 100644
> --- a/Documentation/gpu/xe/xe_firmware.rst
> +++ b/Documentation/gpu/xe/xe_firmware.rst
> @@ -31,6 +31,9 @@ GuC Power Conservation (PC)
>  .. kernel-doc:: drivers/gpu/drm/xe/xe_guc_pc.c
>     :doc: GuC Power Conservation (PC)
>  
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_guc_rc.c
> +   :doc: GuC Render C-states (GuC RC)
> +
>  PCIe Gen5 Limitations
>  =====================
>  
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 51a9a531fb7e..41ec698b3cc1 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -74,6 +74,7 @@ xe-y += xe_bb.o \
>  	xe_guc_log.o \
>  	xe_guc_pagefault.o \
>  	xe_guc_pc.o \
> +	xe_guc_rc.o \
>  	xe_guc_submit.o \
>  	xe_guc_tlb_inval.o \
>  	xe_heci_gsc.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 9d090d0f2438..c8a1d44bbf3a 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -852,7 +852,6 @@ static void gt_reset_worker(struct work_struct *w)
>  	if (IS_SRIOV_PF(gt_to_xe(gt)))
>  		xe_gt_sriov_pf_stop_prepare(gt);
>  
> -	xe_uc_gucrc_disable(&gt->uc);
>  	xe_uc_stop_prepare(&gt->uc);
>  	xe_pagefault_reset(gt_to_xe(gt), gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 2efc4678fa73..dc198d499da3 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -35,6 +35,7 @@
>  #include "xe_guc_klv_helpers.h"
>  #include "xe_guc_log.h"
>  #include "xe_guc_pc.h"
> +#include "xe_guc_rc.h"
>  #include "xe_guc_relay.h"
>  #include "xe_guc_submit.h"
>  #include "xe_memirq.h"
> @@ -880,6 +881,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>  	if (ret)
>  		return ret;
>  
> +	ret = xe_guc_rc_init(guc);
> +	if (ret)
> +		return ret;
> +
>  	ret = xe_guc_engine_activity_init(guc);
>  	if (ret)
>  		return ret;
> @@ -1620,6 +1625,7 @@ void xe_guc_stop_prepare(struct xe_guc *guc)
>  	if (!IS_SRIOV_VF(guc_to_xe(guc))) {
>  		int err;
>  
> +		xe_guc_rc_disable(guc);
>  		err = xe_guc_pc_stop(&guc->pc);
>  		xe_gt_WARN(guc_to_gt(guc), err, "Failed to stop GuC PC: %pe\n",
>  			   ERR_PTR(err));
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 5e5495a39a3c..878eb273c3e6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -92,6 +92,17 @@
>   * Render-C states is also a GuC PC feature that is now enabled in Xe for
>   * all platforms.
>   *
> + * Implementation details:
> + * -----------------------
> + * The implementation for GuC Power Management features is split as follows:
> + *
> + * xe_guc_rc:  Logic for handling GuC RC
> + * xe_gt_idle: Host side logic for RC6 and Coarse Power gating (CPG)
> + * xe_guc_pc:  Logic for all other SLPC related features
> + *
> + * There is some cross interaction between these where host C6 will need to be
> + * enabled when we plan to skip GuC RC. Also, the GuC RC mode is currently
> + * overridden through 0x3003 which is an SLPC H2G call.
>   */
>  
>  static struct xe_guc *pc_to_guc(struct xe_guc_pc *pc)
> @@ -253,22 +264,6 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>  	return ret;
>  }
>  
> -static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
> -{
> -	struct xe_guc_ct *ct = pc_to_ct(pc);
> -	u32 action[] = {
> -		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
> -		mode,
> -	};
> -	int ret;
> -
> -	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> -	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
> -		xe_gt_err(pc_to_gt(pc), "GuC RC enable mode=%u failed: %pe\n",
> -			  mode, ERR_PTR(ret));
> -	return ret;
> -}
> -
>  static u32 decode_freq(u32 raw)
>  {
>  	return DIV_ROUND_CLOSEST(raw * GT_FREQUENCY_MULTIPLIER,
> @@ -1050,30 +1045,6 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>  	return ret;
>  }
>  
> -/**
> - * xe_guc_pc_gucrc_disable - Disable GuC RC
> - * @pc: Xe_GuC_PC instance
> - *
> - * Disables GuC RC by taking control of RC6 back from GuC.
> - *
> - * Return: 0 on success, negative error code on error.
> - */
> -int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
> -{
> -	struct xe_device *xe = pc_to_xe(pc);
> -	struct xe_gt *gt = pc_to_gt(pc);
> -	int ret = 0;
> -
> -	if (xe->info.skip_guc_pc)
> -		return 0;
> -
> -	ret = pc_action_setup_gucrc(pc, GUCRC_HOST_CONTROL);
> -	if (ret)
> -		return ret;
> -
> -	return xe_gt_idle_disable_c6(gt);
> -}
> -
>  /**
>   * xe_guc_pc_override_gucrc_mode - override GUCRC mode
>   * @pc: Xe_GuC_PC instance
> @@ -1247,9 +1218,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  		return -ETIMEDOUT;
>  
>  	if (xe->info.skip_guc_pc) {
> -		if (xe->info.platform != XE_PVC)
> -			xe_gt_idle_enable_c6(gt);
> -
>  		/* Request max possible since dynamic freq mgmt is not enabled */
>  		pc_set_cur_freq(pc, UINT_MAX);
>  		return 0;
> @@ -1291,15 +1259,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  	if (ret)
>  		return ret;
>  
> -	if (xe->info.platform == XE_PVC) {
> -		xe_guc_pc_gucrc_disable(pc);
> -		return 0;
> -	}
> -
> -	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
> -	if (ret)
> -		return ret;
> -
>  	/* Enable SLPC Optimized Strategy for compute */
>  	ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>  
> @@ -1319,10 +1278,8 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
>  {
>  	struct xe_device *xe = pc_to_xe(pc);
>  
> -	if (xe->info.skip_guc_pc) {
> -		xe_gt_idle_disable_c6(pc_to_gt(pc));
> +	if (xe->info.skip_guc_pc)
>  		return 0;
> -	}
>  
>  	mutex_lock(&pc->freq_lock);
>  	pc->freq_ready = false;
> @@ -1343,8 +1300,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>  	if (xe_device_wedged(xe))
>  		return;
>  
> -	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
> -	xe_guc_pc_gucrc_disable(pc);
> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FW_GT);

this FW_ALL => FW_GT change probably should be done in a separate patch

>  	XE_WARN_ON(xe_guc_pc_stop(pc));
>  
>  	/* Bind requested freq to mert_freq_cap before unload */
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 0e31396f103c..1b95873b262e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -15,7 +15,6 @@ struct drm_printer;
>  int xe_guc_pc_init(struct xe_guc_pc *pc);
>  int xe_guc_pc_start(struct xe_guc_pc *pc);
>  int xe_guc_pc_stop(struct xe_guc_pc *pc);
> -int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>  int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
>  int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
>  void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
> new file mode 100644
> index 000000000000..55eeee7b1011
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.c
> @@ -0,0 +1,129 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <drm/drm_print.h>
> +
> +#include "abi/guc_actions_slpc_abi.h"
> +#include "xe_device.h"
> +#include "xe_force_wake.h"
> +#include "xe_gt.h"
> +#include "xe_gt_idle.h"
> +#include "xe_gt_printk.h"
> +#include "xe_guc.h"
> +#include "xe_guc_ct.h"
> +#include "xe_guc_rc.h"
> +#include "xe_pm.h"
> +
> +/**
> + * DOC: GuC RC (Render C-states)
> + *
> + * GuC handles the GT transition to deeper C-states in conjunction with Pcode.
> + * GuC RC can be enabled independently of the frequency component in SLPC,
> + * which is also controlled by GuC.
> + *
> + * This file will contain all H2G related logic for handling Render C-states.
> + * There are some calls to xe_gt_idle, where we enable host C6 when GuC RC is
> + * skipped. GuC RC is mostly independent of xe_guc_pc with the exception of
> + * functions that override the mode for which we have to rely on the SLPC H2G
> + * calls.
> + */
> +
> +static int guc_action_setup_gucrc(struct xe_guc *guc, u32 control)
> +{
> +	u32 action[] = {
> +		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
> +		control,
> +	};
> +	int ret;
> +
> +	ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> +	if (ret && !(xe_device_wedged(guc_to_xe(guc)) && ret == -ECANCELED))

nit: I still think we should have this 'H2G canceled due to wedge' logic inside a CTB layer as this is applicable scenario for other H2G actions as well, but this could be improved later

> +		xe_gt_err(guc_to_gt(guc),
> +			  "GuC RC setup %s(%u) failed (%pe)\n",
> +			   control == GUCRC_HOST_CONTROL ? "HOST_CONTROL" :
> +			   control == GUCRC_FIRMWARE_CONTROL ? "FIRMWARE_CONTROL" :
> +			   "UNKNOWN", control, ERR_PTR(ret));
> +	return ret;
> +}
> +
> +/**
> + * xe_guc_rc_disable() - Disable GuC RC
> + * @guc: Xe GuC instance
> + *
> + * Disables GuC RC by taking control of RC6 back from GuC.
> + */
> +void xe_guc_rc_disable(struct xe_guc *guc)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +
> +	if (!xe->info.skip_guc_pc && xe->info.platform != XE_PVC)
> +		if (guc_action_setup_gucrc(guc, GUCRC_HOST_CONTROL))
> +			return;
> +
> +	xe_gt_WARN_ON(guc_to_gt(guc), xe_gt_idle_disable_c6(guc_to_gt(guc)));

nit: maybe it's worth to have local var:

	struct xe_gt *gt = guc_to_gt(guc);

> +}
> +
> +static void xe_guc_rc_fini_hw(void *arg)
> +{
> +	struct xe_guc *guc = arg;
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
> +	if (xe_device_wedged(xe))
> +		return;
> +
> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> +	xe_guc_rc_disable(guc);
> +}
> +
> +/**
> + * xe_guc_rc_init() - Init GuC RC
> + * @guc: Xe GuC instance
> + *
> + * Add callback action for GuC RC
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_guc_rc_init(struct xe_guc *guc)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
> +	xe_gt_assert(gt, xe_device_uc_enabled(xe));
> +
> +	return devm_add_action_or_reset(xe->drm.dev, xe_guc_rc_fini_hw, guc);
> +}
> +
> +/**
> + * xe_guc_rc_enable() - Enable GuC RC feature if applicable
> + * @guc: Xe GuC instance
> + *
> + * Enables GuC RC feature.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_guc_rc_enable(struct xe_guc *guc)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
> +	xe_gt_assert(gt, xe_device_uc_enabled(xe));
> +
> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> +	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
> +		return -ETIMEDOUT;
> +
> +	if (xe->info.platform == XE_PVC) {
> +		xe_guc_rc_disable(guc);
> +		return 0;
> +	}
> +
> +	if (xe->info.skip_guc_pc) {
> +		xe_gt_idle_enable_c6(gt);
> +		return 0;
> +	}
> +
> +	return guc_action_setup_gucrc(guc, GUCRC_FIRMWARE_CONTROL);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h b/drivers/gpu/drm/xe/xe_guc_rc.h
> new file mode 100644
> index 000000000000..35fabb82cb0e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_RC_H_
> +#define _XE_GUC_RC_H_
> +
> +struct xe_guc;
> +
> +int xe_guc_rc_init(struct xe_guc *guc);
> +void xe_guc_rc_disable(struct xe_guc *guc);
> +int xe_guc_rc_enable(struct xe_guc *guc);

nit: maybe they should be listed in the use-order?

	init
	enable
	disable

> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 3f63c2a7e86d..d9aa845a308d 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -13,6 +13,7 @@
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
>  #include "xe_guc_pc.h"
> +#include "xe_guc_rc.h"
>  #include "xe_guc_engine_activity.h"
>  #include "xe_huc.h"
>  #include "xe_sriov.h"
> @@ -214,6 +215,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
>  	if (ret)
>  		goto err_out;
>  
> +	ret = xe_guc_rc_enable(&uc->guc);
> +	if (ret)
> +		goto err_out;
> +
>  	xe_guc_engine_activity_enable_stats(&uc->guc);
>  
>  	/* We don't fail the driver load if HuC fails to auth */
> @@ -242,11 +247,6 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
>  	return xe_guc_reset_prepare(&uc->guc);
>  }
>  
> -void xe_uc_gucrc_disable(struct xe_uc *uc)
> -{
> -	XE_WARN_ON(xe_guc_pc_gucrc_disable(&uc->guc.pc));
> -}
> -
>  void xe_uc_stop_prepare(struct xe_uc *uc)
>  {
>  	xe_gsc_stop_prepare(&uc->gsc);
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 5398da1a8097..255a54a8f876 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -12,7 +12,6 @@ int xe_uc_init_noalloc(struct xe_uc *uc);
>  int xe_uc_init(struct xe_uc *uc);
>  int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>  int xe_uc_load_hw(struct xe_uc *uc);
> -void xe_uc_gucrc_disable(struct xe_uc *uc);
>  int xe_uc_reset_prepare(struct xe_uc *uc);
>  void xe_uc_runtime_resume(struct xe_uc *uc);
>  void xe_uc_runtime_suspend(struct xe_uc *uc);

IMO one change deserves a separate patch
also few nits, but otherwise looks good,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

