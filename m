Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C81CCAC597
	for <intel-xe@archiver.kernel.org>; Mon, 15 Sep 2025 15:33:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0515110E366;
	Mon, 15 Sep 2025 15:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ao3SalpB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807BF10E366
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Sep 2025 15:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757950420; x=1789486420;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xaF/hDngeFYM+/zB5HKNheI6+nPsViyouPDLxe7K5RQ=;
 b=Ao3SalpBJkPyB4k17Rj1jBcR1+UIVCrlq4tLcqkLRXJESFH4jAi8qd+8
 tKwsuZDBdh6DlRHu3yly8f7FiLg9D0Ch71Ff7Ta7IJi0fynFDWcatNc7i
 /6ztCyXXEyV93b7KY0KGSCwmE6jpsDdJGGXwD/d5bsRc77LxWYXYO29py
 Ar1/C/FEPswbgHhT32sDQ5c4c6IqQMwEXTD9K6JHDdL71Vw+ZU0Ne4vdS
 JFkcykUwaom5heF5Vb9J7UOoFD0/pLz7Wfhokjy0hoCdFnHvUMvfjI38A
 eLfYMGZATD6Qx4TW/pvZS5p2dlwQPDzmGVRf5zuYliIVmTwRi+vkWhWVN A==;
X-CSE-ConnectionGUID: 5JSToXGXQ2m8lQc7kijQWQ==
X-CSE-MsgGUID: i9PEA7YHS2Od1HqTvTfNiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="59253666"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="59253666"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 08:33:37 -0700
X-CSE-ConnectionGUID: vsqJ5mbNSWekIHg390hJCg==
X-CSE-MsgGUID: g7r8J8+/SFKaX4kkmiskOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="179912476"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 08:33:37 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 08:33:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 08:33:36 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.16) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 08:33:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBovVPIVUZ0+Fr8/3QMpTOFUjowy9apvgbdO1uTq2sKI8dz/rORR0WripSmT049+4EL0t4c73SS3wdXJmV0tCGEI7t0RpqwKXYRVBlx0slMWnrjxx7adsuaZ8nBZyiXcbOTerYN7sTUmCxPgs5zWTLr8oFt7p5fqHA5YCMbW2y1Ma1A3kdhuUpXbBMxMMZc8Y2cikAHHvXsPKDl/p8lTjOtFPFMzRsizscL8ORqmukndNPvgd0y78tzwJS3u7s6b1jGpz9PnM9zOIYHFRYLdUGK6SFx2Fbgc5+NdGFptoD6GMpqDInvLNN0Dy0/T/xGNb3m2qsY1Ff9ZN13sfdn/xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhwmwspGG+h0oUxZgHEu3dstWDKazCMxqogvzYtodcc=;
 b=CZ5HHyVxVcuy4wjh56K24AcmEris6EL14P5QCmkEA20RNFHKYe104HOBxZAzeJIdIZ9dJmLOCefXkUSK+9A6JpS0ownzp+CE7EyWfRkdcL3FmZKzoOmdmazwp3nf1yyNb64RZLnbyuJxrSCypQOCyfrgfq27G71X4PzoAaFXxpV10HfohHRyE5MxPNpJ/QB7YK6cVTA2ptZHhT8DQq+xp89UKldDdbYPfFWzhpC9Z7NUvjaX4esOlzVAVA5kA5AhbxJNUc9ZEUgok7XeSJER66qsH9+shLoRGt5glSfSTQaKHxMCJDfWIaSTQNySEbDQijOV2//D8Ak77PMeDjZfmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SN7PR11MB6601.namprd11.prod.outlook.com (2603:10b6:806:273::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 15 Sep
 2025 15:33:34 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 15:33:34 +0000
Message-ID: <32cb4726-ad85-4240-b40f-cf5a3b499fae@intel.com>
Date: Mon, 15 Sep 2025 17:33:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/sysfs: Simplify and fix sysfs registration
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Raag Jadav <raag.jadav@intel.com>
References: <20250915140614.2076-1-michal.wajdeczko@intel.com>
 <20250915140614.2076-2-michal.wajdeczko@intel.com>
 <wrdmty6mixvzuononvsfwqcg3ftvsraallbaibauffhfymizu5@ejcdqwurfqd5>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <wrdmty6mixvzuononvsfwqcg3ftvsraallbaibauffhfymizu5@ejcdqwurfqd5>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0010.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::22) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SN7PR11MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b3bb854-d8e7-49b4-4ae6-08ddf46d3b01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHZ6N20wa3k4YU00VjRQdnRLYlk1TGtjbXhKVHN4TVU2NEZIRE9rMGJlNnFH?=
 =?utf-8?B?MldUK29VeDZQdWxTTisxN3RRd212RHhleFZrOFF5VHQzUXhGQVBjL1ZIUHpm?=
 =?utf-8?B?U0RaY0cxOVJpQmRHQk5jeGJRa2Y4S2l2dml0OTlKVlBQYWZiVHVEYkVEUWVW?=
 =?utf-8?B?S3BaQ3JDcVIwd2tiRVZFMFRldmdub3hRM09HU1pvcEc4ZFY1MzRZRTNlWTJr?=
 =?utf-8?B?czZxaHRpa1NlR1JOdStrUTl3Q1Fvb2xJSk93bi9RSWlZKzBmdkNzalNOQmsr?=
 =?utf-8?B?VUM3Y3c2bjV6dXJ1RWxoYnpmSVp1aGtLeGM0ZUFaYUhKYlZPSmZFRllKaXpN?=
 =?utf-8?B?L2tZN041UHBZZFoxTTRzMlJwOGZveEVKY2ZRbk1EcThhR2pUSnJvL2FxMW5C?=
 =?utf-8?B?WHRweHpvNW5WeFBGNGZxcndwNUg2MTNtdStLMmo4ZzJOUDgwYUpIWWd4RzVs?=
 =?utf-8?B?NmJzRWFzc1BwMW1nZXJKb01HWk4xelkyWTZCS20vU1RPSGpnNHl6cFgzYmsx?=
 =?utf-8?B?RzVTK28xMW01bjJZWi8zcEFIYUN3NkoxY0Z2NG11OWdvTWdtRGh4amQ1ZGh2?=
 =?utf-8?B?cGFOUWZkVDZkMU5iZW5ON2RDUmRBZXV4cGlYRUJILzhmeFI5T2Jpc3hWUWp0?=
 =?utf-8?B?ZVVWYzlCeGdoNDJTdDN3dEhlWTFIVVhNOVZNaVZNMEpyUjFnV1ZvajRobEdW?=
 =?utf-8?B?aU9jemsrbjA3KzVwRmF3WFRaTjI1RzhRMUMwMy9uR24xLzRiZ3c1UjBpWlRJ?=
 =?utf-8?B?YVFqeEZvZE5DaWtJL1pubDVyTUZBWUxhdmtEeDlvaHIzdE9zeWl3SCt6RnBk?=
 =?utf-8?B?ZTVqa2VucCtmTkZqcUx1SUdkanZsMHA4czRVS1ZMcHB0TU1XUHZWTFpZaTFn?=
 =?utf-8?B?aEo4NXFIcWtTMDFuNzZMYkoyN2xrMjF6WFhuYTNhazkrZXNoNVd3V2pKS2Vr?=
 =?utf-8?B?Y3NHR2RTYy93bDUyR3NscEJtRm1kUUtOcXVkQ0JtakhCVFM2TVRXeFBjM1Fr?=
 =?utf-8?B?ZFJXZG1IUlBES0VnYkRGNkp0cHJvMUdBbHc4eDBKYmtvempNTng4ZTlrZWY3?=
 =?utf-8?B?a1E1b3Q0M3UydjdaRTl3YzVaNTFwL08wMXU0Z1UrZ3hrY3VITEt4N3MrdmFw?=
 =?utf-8?B?WU1YTG0zMFhDSWI0SHBBcEVlZjdudHpaRDJjL1dPSHphaXhIcnBWME51MFU1?=
 =?utf-8?B?K3FQTUtyOXZyT09oR1ZXbk54MWRwNzdlVERCZkR2QlR5UjZvM3YzNnBadHdm?=
 =?utf-8?B?TUxHYytNQmdXM3J6QlVvamRMWmpGb1Qyb1V5a0tpdWp0aUZtYkhwOGE4dzZU?=
 =?utf-8?B?MURhMVI4NW42U3dLcGMwR0IvSGtHMzNUc1l1QldPY3JwUWdHb2VyWm1sSU9p?=
 =?utf-8?B?SS8vUFZLVllnL2pOeTk2U1RBOGVNcWFJWVlBWlozUTh4WUEwWmxRM0dSeVR1?=
 =?utf-8?B?RnlmeWdYdUM1aXNWZkNMQ1JINFFSUkQzZEVkREdZbGNSWmk4TlkyUTRXRHp0?=
 =?utf-8?B?ZlRXSnpUci9QZTRSemVLdlZSbHhRR2lRNjc1T205TStKT0x5Q3JReERVTWh3?=
 =?utf-8?B?VFE1UVRNczJiK1pyU1BoWFRTTVJDcWE5NUxUWDlCbkdGZlJQT3pHZTVVVmdH?=
 =?utf-8?B?SmNYODR5dlc2WEFDZXQvYVgrejhNQjNtNG1wNmh3eHFEYkNGZ0d5KzBEaStx?=
 =?utf-8?B?ajVGVHZaUU02aEtQTG1aWWJoQnFOT2ROV1FqY09JUEFRejRvVGRRdDJEQ1N4?=
 =?utf-8?B?TUROOHg2c0tMYzF1NEpONmllUmFINmlNZzFSOER3YUlkZzR5ZHQ4S21jVFkx?=
 =?utf-8?B?TXNnMnVwa2ttcVcrd0l1M1czd3F2Wm10eTBlcGhQS2MzSm9Kell0bXNKc09q?=
 =?utf-8?Q?92D9iZyuEDW94?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RExyZnlLbE1aSU5hMVZ6TE5zcE9sRmJQU2VGSUExaWdwOG9ENTZFRnJYcXpN?=
 =?utf-8?B?dnBFQ0FCdWcvNGozWmtoMzNXd0RYeGdGNXYzZkxzd1pud3IzRmZCZWhoMDMx?=
 =?utf-8?B?V2pMaUNmT2FsR3V1NExuamQ5VS9IbmR5Z29NNjA3aGo5aEhuNWJsK2J0Witn?=
 =?utf-8?B?TkJuT0NNNTFqd3dSQ01lY1ludnZiaXh0VGhMNWQvWVB0MWNEOUNKUWpDUy9M?=
 =?utf-8?B?TWdVMERod2d1Ym10ejBNZ21rT01FMFBYWExBVGxSQ1ZOVzhPMDAyTVF6Vzda?=
 =?utf-8?B?Q08xNEJ1SWlnWUtFZ1FsYThnK2pveWpJMU9jaW9ycHVNdmMrazRwTnpDcG9B?=
 =?utf-8?B?SStoY2kxaTJDekd6Ui9FYi9ZVk1NUGQrd3ZZQWZ5K004MFVrTU5MR3BOTGY1?=
 =?utf-8?B?VG81TVRPSDVRSHorVDNTQ3dqcVh3TmFLbC9haHdsYTNsRHBwbDhTS0ZQa2Nk?=
 =?utf-8?B?aE5YMkp6RkU5Um9qd1V4eWw3aEVsSkRZZzFRWGxyRkxncGRuNy9DWTVvT2Yy?=
 =?utf-8?B?b0NiRDlTZmUxaVpyaEpXYjl2SkFHRVAyMjIrUnNXYUhITmhtcUpva0RDZTRa?=
 =?utf-8?B?WmExTEtXTFloQVRkMXdHT3JqaXJ4TGdvS0tCbCtEZjQ1NFVmSTljbzB0SW9L?=
 =?utf-8?B?enpGT1pZMGhZYUYzMU0vNHozZTRxVGdod1pVckJGbUdFMVozZzFjT3RxMkpt?=
 =?utf-8?B?Y1JsS0tIYUFndWxOa1FHYzlpYTk4ZzRFQnhDcHNvbTJEalUvS0U2M1BUTTho?=
 =?utf-8?B?aFh4dnVHSmMvZXpyZjBNRTlOUW5EK2ZubEwrRDhkZjNXNG1XdFBpYmhSbXp4?=
 =?utf-8?B?RkRaR29xWVR6U3F4bTZXaExPNVg4TDZERDZUSlkxM3VQM3ZwMWRNd0tIejVD?=
 =?utf-8?B?bURTYmN0L2RKYUVycXQ1bEdNTzh4R0ZVR0pKL212WjhDTW9GR24xOTNBYjJl?=
 =?utf-8?B?MjNtQXBjOHh0dVdCSy9WMTllUDBxZmVGY05oT3lKYnRnS3cvdGpHdThlaHRQ?=
 =?utf-8?B?Ymg5Y3o2RnA3ZTR2aW13Q09xS2RSb3VRdzFPTjBja01SM0V1VEFVLzRvNkMw?=
 =?utf-8?B?NWhVUjlBb21VUDc4NmdZckZmWUdFcXZNK0E1bVNualA1enoyT3Y4QTlVZGhl?=
 =?utf-8?B?eXN4V0htSHI3SnFuVmEwL3JXTEpXNmpielpjZEkzWEVNRXg0QzMrWkdlcDVG?=
 =?utf-8?B?Smc1dThBWTY0d3g1ZmxLRWF4SlR5VDBLUURMeUo3WWdOU1l1cy9TMDc2MnRj?=
 =?utf-8?B?OC9WaUphVFcvZDEremhUaktqZzhhZ0JFbG5aZDJRZXZ5N3ZaZ0pvWmxIYURB?=
 =?utf-8?B?NVFjOTRWKzlvT3hDZmdOMHR1aFJDMXhKY3NLVjVIbm9vOXlGNXZ2NjVoUUl2?=
 =?utf-8?B?TmNYR3ZCamJaSXE3TGwvUXF2SVRYakNFemoyQk9OU1N2Y29vYTJrNXNtdzBT?=
 =?utf-8?B?ZDVINzRhR0V5Y2pWMTFVZitvMk1uSEdNTURNazN2UkVtQzhHeDNqVWkrZy9w?=
 =?utf-8?B?REJCZ3o0ZHE2d0YwVk1BUW5VYjlmS1l3MDZjbGZvTFRWYnFLNXZUOXNWKzkr?=
 =?utf-8?B?Zng5SnpTYS9qWlEvWkIvcDYyc05kTGEzWHRzL0IyeFBtQnQwWUtxRlV4dk10?=
 =?utf-8?B?MUJYTm55NW51aDJwbTFuWFY1NEhnK2ZDUVVLZkdPb090YnpPK3RBQ1A3ZXBP?=
 =?utf-8?B?dmJ2K2UxLy83RTFYei9PZ0RZRk0ycmdWUlNuclJ6VnA5V2JGN1ZmOTBrZW5y?=
 =?utf-8?B?MVlVQ1QyRCt4VWxvZXN2dUV1aUljOG4rekQycUlad1dvbW84ZjJCdWViWDMy?=
 =?utf-8?B?a1VzNm5HbUlVU3N4czNIblM4NFVqallrRnNWV2xRLzJiUDRHcUNkMVRRTjN4?=
 =?utf-8?B?ZHhwcUU5blpNNEVMa2ZFS0UzMnhnVytwNjR2akR0WmMzNlF4K2VFNmd6cmEz?=
 =?utf-8?B?aU93SGNidDF2eTd0SmZpNkY2bm5JRU9OdW80SFdvRXV4WTZJRDVGOFhqVGpu?=
 =?utf-8?B?U0Y4OWxBdytJeGJxRXNpMzR6Qk42dk8zR0d4M3o2ak1SbnJka09xdUNVREF4?=
 =?utf-8?B?clczZUdRaXZTdnBFcXZ4WitXVVE1eUZVV2hUY21YNWVaNTB2L2dCNEoyYkJN?=
 =?utf-8?B?ZW1HaVEyYXhXSlVjdzlYRjZKdTAvU0VBSmRFMEJmeWo3MXlaVUR3SFhwWVMr?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3bb854-d8e7-49b4-4ae6-08ddf46d3b01
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 15:33:33.8497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +laOj7zytukA+RXOw+OCIJfzNAr4uaD/wTDolI0Nv0E44AHuWboPhpB22LzgTwVj5J4YGfe+SwDrnXpoYnIS7XWt7Zg45xmgjh2CcGaKaNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6601
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



On 9/15/2025 5:12 PM, Lucas De Marchi wrote:
> On Mon, Sep 15, 2025 at 04:06:13PM +0200, Michal Wajdeczko wrote:
>> Instead of manually maintaining each sysfs attribute define and use
>> attribute groups and register them using device managed function.
>> Then use is_visible() to filter-out unsupported attributes.
>>
>> This will result not only in less code and smaller footprint:
>>
>>  Function                                     old     new   delta
>>  late_bind_attr_is_visible                      -     183    +183
>>  ____versions                               80832   80896     +64
>>  vram_attr_group                                -      48     +48
>>  late_bind_attr_group                           -      48     +48
>>  auto_link_downgrade_attr_group                 -      48     +48
>>  late_bind_attrs                                -      24     +24
>>  vram_attrs                                     -      16     +16
>>  __pfx_late_bind_attr_is_visible                -      16     +16
>>  xe_device_sysfs_init.cold                     20      21      +1
>>  __pfx_xe_device_sysfs_fini                    16       -     -16
>>  xe_device_sysfs_fini.cold                     21       -     -21
>>  xe_device_sysfs_fini                         271       -    -271
>>  xe_device_sysfs_init                         421     135    -286
>>  Total: Before=2848898, After=2848752, chg -0.01%
>>
>> but will also fix some bad error handling that we had here.
>>
>> Fixes: 0e414bf7ad01 ("drm/xe: Expose PCIe link downgrade attributes")
>> Fixes: cdc36b66cd41 ("drm/xe: Expose fan control and voltage regulator version")
> 
> we should probably land the fix separately though:
> https://lore.kernel.org/intel-xe/7p7wqbghc2ebupbzljjaegakun3azczuby2haiqmmneavnpl44@joqtzfismsgv/
> 
> and suggestion to rather use attribute group, similarly to what you're
> doing here:
> https://lore.kernel.org/intel-xe/3tkvzv7krbeuofuew44zm3ibenlntqkfclueq3soazkagwkezg@wtdhq4yvengu/
> 
> 
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Raag Jadav <raag.jadav@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_device_sysfs.c | 96 +++++++++++-----------------
>> 1 file changed, 39 insertions(+), 57 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> index 6ee422594b56..5b0b98ac9b17 100644
>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> @@ -71,6 +71,15 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
>>
>> static DEVICE_ATTR_RW(vram_d3cold_threshold);
>>
>> +static struct attribute *vram_attrs[] = {
>> +    &dev_attr_vram_d3cold_threshold.attr,
>> +    NULL
>> +};
>> +
>> +static const struct attribute_group vram_attr_group = {
>> +    .attrs = vram_attrs,
> 
> since we are already checking by the attribute inside the is_visible
> hook, couldn't we just add 1 group for "device attributes" and
> share a single function?

I tried that approach first, but checking for late_bind_attrs was
so different that decided to keep it separated from other attrs

after all, this is what the purpose of having multiple groups is, no?

> 
>> +};
>> +
>> static ssize_t
>> lb_fan_control_version_show(struct device *dev, struct device_attribute *attr, char *buf)
>> {
>> @@ -149,8 +158,16 @@ lb_voltage_regulator_version_show(struct device *dev, struct device_attribute *a
>> }
>> static DEVICE_ATTR_ADMIN_RO(lb_voltage_regulator_version);
>>
>> -static int late_bind_create_files(struct device *dev)
>> +static struct attribute *late_bind_attrs[] = {
>> +    &dev_attr_lb_fan_control_version.attr,
>> +    &dev_attr_lb_voltage_regulator_version.attr,
> 
> As above, I think we can just consider them "device attributes".

IMO we should _group_ related attributes into "attribute_group" and
either add them based on single prerequisite condition and/or provide
is_visible filter to control each attribute separately

now as we only have five attribute, it's tempting to put all into
one group, but I assume we will soon have more attributes, and trying
to manage them as single group may not scale, so it's better to show
how to split related attrs now

> 
> Lucas De Marchi
> 
>> +    NULL
>> +};
>> +
>> +static umode_t late_bind_attr_is_visible(struct kobject *kobj,
>> +                     struct attribute *attr, int n)
>> {
>> +    struct device *dev = kobj_to_dev(kobj);
>>     struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>>     struct xe_tile *root = xe_device_get_root_tile(xe);
>>     u32 cap = 0;
>> @@ -160,51 +177,25 @@ static int late_bind_create_files(struct device *dev)
>>
>>     ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
>>                 &cap, NULL);
>> -    if (ret) {
>> -        if (ret == -ENXIO) {
>> -            drm_dbg(&xe->drm, "Late binding not supported by firmware\n");
>> -            ret = 0;
>> -        }
>> -        goto out;
>> -    }
>> -
>> -    if (REG_FIELD_GET(V1_FAN_SUPPORTED, cap)) {
>> -        ret = sysfs_create_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
>> -        if (ret)
>> -            goto out;
>> -    }
>> -
>> -    if (REG_FIELD_GET(VR_PARAMS_SUPPORTED, cap))
>> -        ret = sysfs_create_file(&dev->kobj, &dev_attr_lb_voltage_regulator_version.attr);
>> -out:
>>     xe_pm_runtime_put(xe);
>> -
>> -    return ret;
>> -}
>> -
>> -static void late_bind_remove_files(struct device *dev)
>> -{
>> -    struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>> -    struct xe_tile *root = xe_device_get_root_tile(xe);
>> -    u32 cap = 0;
>> -    int ret;
>> -
>> -    xe_pm_runtime_get(xe);
>> -
>> -    ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
>> -                &cap, NULL);
>>     if (ret)
>> -        goto out;
>> +        return 0;
>>
>> -    if (REG_FIELD_GET(V1_FAN_SUPPORTED, cap))
>> -        sysfs_remove_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
>> +    if (attr == &dev_attr_lb_fan_control_version.attr &&
>> +        REG_FIELD_GET(V1_FAN_SUPPORTED, cap))
>> +        return attr->mode;
>> +    if (attr == &dev_attr_lb_voltage_regulator_version.attr &&
>> +        REG_FIELD_GET(VR_PARAMS_SUPPORTED, cap))
>> +        return attr->mode;
>>
>> -    if (REG_FIELD_GET(VR_PARAMS_SUPPORTED, cap))
>> -        sysfs_remove_file(&dev->kobj, &dev_attr_lb_voltage_regulator_version.attr);
>> -out:
>> -    xe_pm_runtime_put(xe);
>> +    return 0;
>> }
>>
>> +static const struct attribute_group late_bind_attr_group = {
>> +    .attrs = late_bind_attrs,
>> +    .is_visible = late_bind_attr_is_visible,
>> +};
>> +
>> /**
>>  * DOC: PCIe Gen5 Limitations
>>  *
>> @@ -278,24 +269,15 @@ auto_link_downgrade_status_show(struct device *dev, struct device_attribute *att
>> }
>> static DEVICE_ATTR_ADMIN_RO(auto_link_downgrade_status);
>>
>> -static const struct attribute *auto_link_downgrade_attrs[] = {
>> +static struct attribute *auto_link_downgrade_attrs[] = {
>>     &dev_attr_auto_link_downgrade_capable.attr,
>>     &dev_attr_auto_link_downgrade_status.attr,
>>     NULL
>> };
>>
>> -static void xe_device_sysfs_fini(void *arg)
>> -{
>> -    struct xe_device *xe = arg;
>> -
>> -    if (xe->d3cold.capable)
>> -        sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
>> -
>> -    if (xe->info.platform == XE_BATTLEMAGE) {
>> -        sysfs_remove_files(&xe->drm.dev->kobj, auto_link_downgrade_attrs);
>> -        late_bind_remove_files(xe->drm.dev);
>> -    }
>> -}
>> +static const struct attribute_group auto_link_downgrade_attr_group = {
>> +    .attrs = auto_link_downgrade_attrs,
>> +};
>>
>> int xe_device_sysfs_init(struct xe_device *xe)
>> {
>> @@ -303,20 +285,20 @@ int xe_device_sysfs_init(struct xe_device *xe)
>>     int ret;
>>
>>     if (xe->d3cold.capable) {
>> -        ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
>> +        ret = devm_device_add_group(dev, &vram_attr_group);
>>         if (ret)
>>             return ret;
>>     }
>>
>>     if (xe->info.platform == XE_BATTLEMAGE) {
>> -        ret = sysfs_create_files(&dev->kobj, auto_link_downgrade_attrs);
>> +        ret = devm_device_add_group(dev, &auto_link_downgrade_attr_group);
>>         if (ret)
>>             return ret;
>>
>> -        ret = late_bind_create_files(dev);
>> +        ret = devm_device_add_group(dev, &late_bind_attr_group);
>>         if (ret)
>>             return ret;
>>     }
>>
>> -    return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
>> +    return 0;
>> }
>> -- 
>> 2.47.1
>>

