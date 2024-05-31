Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF38EC25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 14:33:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F9710E18B;
	Fri, 31 May 2024 14:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jahwtncv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5160C10E18B
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 14:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717166016; x=1748702016;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:cc:date:message-id:mime-version;
 bh=3FsFkJmBnoIUzjAwXlqIo2ivWQCfWn4lh/71izb8tAw=;
 b=jahwtncvyaSduD6IFgEncqOU9v3UP0VH+OI8JxN5K3dU6iYp3jTjzcmk
 eFw2ywcH89N5qCHbuBqjDM5VTtJixf1CPsZ+3qTIISCkZFMgZCHmr+LUW
 Vyv241M2VZcxCQ/kPCBwWXwYgSYkC/dklIJLsCbSlGIk1q+pkKn3HbfS5
 ycNs8QkJEIZYhR2UO812RXILsP4IcsRuR8XQsi40BKAGOi6e7iU1BpUxX
 zJO1+6iK6GgVGv3Tm1NsOge6RcgVikfUCZNKChJE4d0ncMNmQQYNC7b7h
 ZA1BthHVRkd74hnW8oxYXdLdNsY6bLOdCMLe6VmI4eoQVDbDttSFn8HW1 Q==;
X-CSE-ConnectionGUID: FSxPSjYwS8+W8w0HpA0Jtw==
X-CSE-MsgGUID: G/6+SeW9TtCWrNCjZOTI8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13937617"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="13937617"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:33:34 -0700
X-CSE-ConnectionGUID: Pes2dXobTDqCV0Oh9qxHQA==
X-CSE-MsgGUID: 6TIDcnwPRkKOqHffBYJULw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="67028375"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 07:33:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 07:33:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 07:33:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 07:33:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 07:33:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EK6ufAruLQWmKN6dPF3RgIP1OfSp0OjnlBkj/yB/a4pIMZzAze9Q9CUiQPqt0WCmQaIM2TDSoYz1DcAZtbpcK/pMtMigM8w5AzIOv3Ok5O4MEqdn/6FhjV2jEMTJEUtVOhl+R1kH4KR4VLc+kxo7+ujrg27+MhI7Lt8S5ChM4vh5zcWeek0tqHEs12ukEkSNjTMqLZfbZDAKq+89x25sS6LBWoq3sBxhdlnumuuTp2kVr8ug5Ef5EQHds6OKlCfkYiLl8kQnombNT8yOf9EsAahS29DC2pvmY34AQdH2d6hAzd2yyslknzPD/Q+p/R/tjhrMz77uqP/BD/v/nbFGEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDwa5OKbPWitr+DlyeCFbZ+feflyM5B8QHx3r36y08E=;
 b=O+AQ2cG8/9caLcLgxXGtfQoKZfTSE6G2FAe2FEe4aYK6BZvJ1/+kmAr1IUB7kWJT9+wPEh3Ik2vGH4k68I2yOLz3RGZs0YzkqiOLdAAL8YWDnWHaN6LqqcT5aAPNkQeIHGdiM6wg91V3MaoExpSX8E4xmOgPQ9OhbGx/elHtBhZuu6Q53+5F/CzqBXYi7ojVXGiNHqXwIVO67d0e7w58kYd+WZ3xHGcavByEHM2YblKFFPOBD3lh+fAsZoU/X7foy8ZtHvwNib2+wO0Of1ZOSRBsEpfDhNPh5yAEv1d2+HUR1msaD3AQkwPYIb4xaHD+uLNqeGiywxEgYopxRtIXUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CY8PR11MB7171.namprd11.prod.outlook.com (2603:10b6:930:92::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Fri, 31 May
 2024 14:33:23 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7611.016; Fri, 31 May 2024
 14:33:21 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240530151313.2284182-2-radhakrishna.sripada@intel.com>
References: <20240530151313.2284182-1-radhakrishna.sripada@intel.com>
 <20240530151313.2284182-2-radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v3 1/6] drm/xe/trace: Extract bo, vm, vma traces
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, Radhakrishna Sripada
 <radhakrishna.sripada@intel.com>, Jani Nikula <jani.nikula@intel.com>
Date: Fri, 31 May 2024 11:33:16 -0300
Message-ID: <171716599640.5017.8848009252260135408@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR05CA0070.namprd05.prod.outlook.com
 (2603:10b6:a03:332::15) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CY8PR11MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: 012e7d85-c6b2-46f9-46c7-08dc817e9ee1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0paaTFUM2d0dVJneUF2RWQrdGR3SmFLVWc2OGRmU3Q4dDkyb2Z1cjNoWlBt?=
 =?utf-8?B?ZHorVk5LdENtUm1KRzJ0NGYzWVp1V1VCdXpodG9aN3dtMWhwOWJuemtISjFU?=
 =?utf-8?B?RGY3REx3Ry9pYWhwK3VQR1ZwUDlXenFwcm9sMGl5NTVSenN4QXpzZEJwc2s3?=
 =?utf-8?B?aTNFWDhSQVNoRXY4TkpKZGZybSt2aVRKUXJLRk1kMjErcElWLy9mbWozU2lu?=
 =?utf-8?B?Y1c1N0dsaFlEV2o5WU9lRjNNS0NrUlM2RkpvUEZQYVBSZXRhODcrTmFZM2VK?=
 =?utf-8?B?cllzQVd4cVM5bzhMWWJ1UVVMampoL1VDazdlOU5BLy8xUDc2TzIrRWp2a2ky?=
 =?utf-8?B?VkFCZHZ4Znp4YndRRUFqWFVqKys4VnhrUHhnWGU1WWhFUE1SeURWTTZYZlZG?=
 =?utf-8?B?VTlMT2NyZTBsYzRYZ25CZU1WRDAvSEdBaEthNTBWR3ppNTNoMEI1U3VPcFVx?=
 =?utf-8?B?em02bFBYYWdRWXR2YWhoYjZTRkdUQVAwbE9Ub2hjNVJEZHJ3TlpBbTFCZlJR?=
 =?utf-8?B?cFErRFgrV3lNQTBVTU1SRmV0Y3AzZlBNRnpaSDFZWnpTYkIrMVUySUFUWlE5?=
 =?utf-8?B?VGRuei9PZHF4YzlCbEozb1luUGhSVStXeGh4ZVpPRnN3MG1oZmVyRHRnYjlI?=
 =?utf-8?B?SUVRZ3JDb1VRVjdOT0NMQVBuTmc3R3oyeXVIZ2FYaUpvZ25YTkEwSmZLR2pk?=
 =?utf-8?B?SFRGNlFGNjhRWHpzN2R0QmZxMW53RS9UdXJhWEFoOUtqdC81QVFHK0h4cFhI?=
 =?utf-8?B?aEVhS1ZLdTc0TFhHU25uK0NldEVnWWE5RHpyaUN4WHdERGkzSkplb2xxM0tQ?=
 =?utf-8?B?Nmk3VnFDMkFOaWkyU3RMemNoekU2d2xwMEwyaXlkd24rTXlZTTNyenVGeEcr?=
 =?utf-8?B?dmprLzJhZVI0MUZMaU5VRGJ0Y3puUnI0cUJ0dVNzWkphOHhGNHV4ZGdSUjRO?=
 =?utf-8?B?THVYWHI5YmdDZ1M4REhxWVFDNWlUU1UzNkJ2T0h1QWZXMHhUd1UyWCtVWjQ1?=
 =?utf-8?B?bXZMOXRHcEYzSjQyY2ltY2x5N1QrUndMUGpXSng5c29SbFVvZHhPTm40V2lL?=
 =?utf-8?B?dS9lNkJ2cXZPWStrWXhENTNMME5CUnVrV1FlK0RpMDVTWml1L1NYRWp3dkd0?=
 =?utf-8?B?N0IwMlRUaWFJQ3lib3ZmaWZ2Umw4aFVndXVGcU42UVRUUis3TDVaSDQ3TkhO?=
 =?utf-8?B?Yyt5bGllRWFDS3ZxTFRvR0xCdGx6TlFEZjBZTkREY2oxOFlSTXZ1T2tjUGJQ?=
 =?utf-8?B?RDQ0Q0pUUjNEK1lkZzV3bSs2Wi9yc3drUVRCazJUWjJOZTV3TWI4cmRaYm1B?=
 =?utf-8?B?bEdubTJoY0FhMmhsUnc4R3IvSWREaDN4VThGbHJGNEpnNldLRGFmL21YeHlJ?=
 =?utf-8?B?YWpWR3lQb0Zkczg4NjR1UmY1eHBRVks2K3c0OEx6ZlVsL05hd1NOamhxcXNk?=
 =?utf-8?B?T0puRitIYmdtdmc5aXRFcjBrMDNDZDEyTnM3S21SM2M1dW5VdzZyWXBjb3BQ?=
 =?utf-8?B?RXY4dGxDYkN2WTVtdnhkTks1azVObWFOUUFJMzFtUW1nVTJsZldvWmwrSXZu?=
 =?utf-8?B?STZqQ2ErcTZOWDM4YWZ1YUMzZ0lUMEtVNitvOTdzdFNDaUNwOXBsVnZNQktC?=
 =?utf-8?B?NE9xTXN1c0s1dFBSQWNLWTZMRW5BOXE1R3VJUnowYnMrQW9IS0RCQjVsRWJM?=
 =?utf-8?B?WWw2OUNKN21sNVFBVzFZc3BKZDVFT0hjTU1RbWVhZXpTS1kzZGR4TDd3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm1jYmVDWldrc3dnbUJMU3pFNzh5VnNEQ0RSV1pYeTZjaGE3VGhCNUQ1bWFx?=
 =?utf-8?B?Uy9icWVJV3p4amRTZzEzRW5yZkF0WklNdjdvckdMTEhpWnVmU25rT0QzK3B6?=
 =?utf-8?B?ekM5RzI4NW5LbnRuTGszTW5pSE8xTDF2S2VCUFZpMmdkZWFHVVlWcFpGM1Yv?=
 =?utf-8?B?U1lyQTlmOHRiN01XNUlJRTBER0lkVjRBU3MvYWJwa0ZsQks0ZDh3T3RzWjdJ?=
 =?utf-8?B?cklVR3hzUmg3dlJzR0VsM3NhY25tRS9iOWtiS2xvdVZhSUtMME82WWxXYWs0?=
 =?utf-8?B?OTJkcEp5WWs0UGZ0UEI1bWpIWTlBRkFHOFl3bzlDV2VxZ1hHSFVDUzlONUlS?=
 =?utf-8?B?bTh2aXRtV2E0Q2lMaitKK3ZEN3o3UWw2eXQzSnZXK3VtWDdsSmwxa3VRYWRy?=
 =?utf-8?B?aHg1T2FGM1ZQZ0d4ZnJtSHlFOUo0aDJPM2dKWWNrN1QwY2UvWW5DZHhLRmUy?=
 =?utf-8?B?MDg0YVNVdmE4WndFWGNhR00vMlNjZ1ZOZnJBZlVzU3k3WnBGcCtTdG1naEly?=
 =?utf-8?B?bzhiWjR1Ry9vNm9KeVRsdU45SC9wZVFUUDcvTjZtRE04WmNCWjZNWmhPZUI4?=
 =?utf-8?B?c1kyTjBaRE1GSzJBelE5SnZkcWo5S1JmSTdUVjhUTVRiYU1OdFhkMHZ5Wk96?=
 =?utf-8?B?amdKMWtHNHd2VTFKQjZzZHo0OEN2QUtvVnhTSnhoam1jTnRtblBQZ2NkZVVm?=
 =?utf-8?B?UTk0elB5a2dWWktCS3Jud1k0TTYvZkYwWUFMMWpOMitzSS9rcUdjTmFURVRk?=
 =?utf-8?B?eXF1a05OUGhBQXlHN0o0bXB3NCtxWDNzRmF4L0Z3eFU2RkFVNXNlVlZkcGlJ?=
 =?utf-8?B?cmsrbDV0NGxXcHIvTTUxRHpFQVQ2ejh3TnBsQk9Vb1dPbDNkVG56SFdEd1RC?=
 =?utf-8?B?YTJkakpZT01MdWdMK000L095RWpJTGVpSzlGSmFrSUpraEVnc2xxQjBCWGh5?=
 =?utf-8?B?dzRQTzdSb1dsVzk1NVpzSE9BbUR0UmdaczRORE5DNEJBM25KSElxWDZWb3dm?=
 =?utf-8?B?S3NGaDVxYmUxN0lHT1FQbG13Y2o3ejVVRTFWZ2VJZHNpSGtmRnZFYVV6V2g4?=
 =?utf-8?B?MENhS2lLSnpEVnR0a1BmZy9jT1ZVSXpxQ0RnaE5yV2FkMWlyUUFNcUdLTFFn?=
 =?utf-8?B?QmtwZWRoL2ppUVFNY1Zkc0piZjhXWENGQ1ViK0JWQzl0TDBMWERHSkp4bUJm?=
 =?utf-8?B?VWpnK0hWbTZqbjFqZGlSZ1dKcWUxSGU4WVIwdXQ1eVBoNnBxMW51VWgzd09j?=
 =?utf-8?B?SlV6aDh2UE9zZWo5RWZWTy9Kb0xSS25ZSzdHNGFXVGUvek5MUVFHMzJteHd4?=
 =?utf-8?B?RlUzSUU3U3llYWJyaTRiMnlQcmxqVjFyTUpvZWp1dlgzd1VyblpkYzlMNDEx?=
 =?utf-8?B?bVdIOFpidDhuZ25od2JGRHlxVGhLSitsUmtON3FwWTRTTUVGQ3Ixc203QThB?=
 =?utf-8?B?TVdlZlZsa296bjVIVi9DUzlPMEJxZS9zVStvVnIrUWRJYi8zcTVCWm5iS2R4?=
 =?utf-8?B?ZlpGb1ZsNitQdWhwdVp5RGVER3VCaGJZbzQveEtIMXpQOWxqcFBxa2pBd1FX?=
 =?utf-8?B?ODNjUEVkU0ptNEhtS0VPdEdLdW1tVHVKcTlBWW5OUGtudjNsV0ZXTnhZd1VR?=
 =?utf-8?B?QWRtbGREYXg2bTcvMmpwQStSdFA2UkVnUWxNSVRRcVNUaTJIOEVPY1JOQ3Nz?=
 =?utf-8?B?ZGNQVnNVRjU4eUtQY3Y5Z1pNemNnL2pEZFErNHdsVTRIL3ZucnpFS0ZEVXV3?=
 =?utf-8?B?Snh1MXNPQkRVUlpzWnBycitGeHhXcUZMS05OTDV4Y2JSL0tmOS9pM0NYelBp?=
 =?utf-8?B?UmZzM0RxSnJMb1VnK3JZNDJPbzY0NlFQQ2o3STE3UnlSZzRVajFrRno0K3ha?=
 =?utf-8?B?dmJkTWEzSFcxK3VnUUtVRUl1RzR1Vkx2Wm9aODJPVi8wMWx6MUExcGJpdnJm?=
 =?utf-8?B?NUl2UEo4RSs1RkROM3hEQm5rYTNpME1nTFJXU1YvYURBYTU1c3lPYnZwdi92?=
 =?utf-8?B?dTFvTTRWZmdTMklsSXFBbVAzN1FHamRTeGpUM1pMT0dGUHRuMXA5NXhrdHNW?=
 =?utf-8?B?TzRDa1h0TElpaFhCM1h2Zm9hd2c4eEZTSVpWN1M1c1QvMFJTZDJTbW51NWFx?=
 =?utf-8?B?REN5UGNHUW41Y09JOCtXSFlQZG4xNFZKK2xjZlFQR1pZVjlVWlVjTXUrL2Va?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 012e7d85-c6b2-46f9-46c7-08dc817e9ee1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 14:33:21.4584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vu4no9s0cn/aHaMnOplZosh7QKoTRU3BaXEAvSxgNcFOxrKDeicRpcs9ifLrKcYR/zBcB7RYnVmwPfWB+VOzYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7171
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

Quoting Radhakrishna Sripada (2024-05-30 12:13:08-03:00)
>xe_trace.h is starting to get over crowded. Move the traces
>related to bo, vm, vma's to its own file.
>
>Suggested-by: Jani Nikula <jani.nikula@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>---
> drivers/gpu/drm/xe/Makefile          |   1 +
> drivers/gpu/drm/xe/xe_bo.c           |   2 +-
> drivers/gpu/drm/xe/xe_gt_pagefault.c |   2 +-
> drivers/gpu/drm/xe/xe_migrate.c      |   2 +-
> drivers/gpu/drm/xe/xe_trace.h        | 212 ------------------------
> drivers/gpu/drm/xe/xe_trace_bo.c     |   9 +
> drivers/gpu/drm/xe/xe_trace_bo.h     | 236 +++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_vm.c           |   2 +-
> 8 files changed, 250 insertions(+), 216 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/xe_trace_bo.c
> create mode 100644 drivers/gpu/drm/xe/xe_trace_bo.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index ae07f3d6a068..fa9960acfe53 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -135,6 +135,7 @@ xe-y +=3D xe_bb.o \
>         xe_tile.o \
>         xe_tile_sysfs.o \
>         xe_trace.o \
>+        xe_trace_bo.o \
>         xe_ttm_sys_mgr.o \
>         xe_ttm_stolen_mgr.o \
>         xe_ttm_vram_mgr.o \
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index 2bae01ce4e5b..74294f1b05bc 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -25,7 +25,7 @@
> #include "xe_pm.h"
> #include "xe_preempt_fence.h"
> #include "xe_res_cursor.h"
>-#include "xe_trace.h"
>+#include "xe_trace_bo.h"
> #include "xe_ttm_stolen_mgr.h"
> #include "xe_vm.h"
>=20
>diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_=
gt_pagefault.c
>index 040dd142c49c..dead920de5f1 100644
>--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>@@ -19,7 +19,7 @@
> #include "xe_guc.h"
> #include "xe_guc_ct.h"
> #include "xe_migrate.h"
>-#include "xe_trace.h"
>+#include "xe_trace_bo.h"
> #include "xe_vm.h"
>=20
> struct pagefault {
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migra=
te.c
>index cccffaf3db06..da3305834448 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -32,7 +32,7 @@
> #include "xe_res_cursor.h"
> #include "xe_sched_job.h"
> #include "xe_sync.h"
>-#include "xe_trace.h"
>+#include "xe_trace_bo.h"
> #include "xe_vm.h"
>=20
> /**
>diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>index 450f407c66e8..9493cc3d6d82 100644
>--- a/drivers/gpu/drm/xe/xe_trace.h
>+++ b/drivers/gpu/drm/xe/xe_trace.h
>@@ -12,8 +12,6 @@
> #include <linux/tracepoint.h>
> #include <linux/types.h>
>=20
>-#include "xe_bo.h"
>-#include "xe_bo_types.h"
> #include "xe_exec_queue_types.h"
> #include "xe_gpu_scheduler_types.h"
> #include "xe_gt_tlb_invalidation_types.h"
>@@ -76,58 +74,6 @@ DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_in=
validation_fence_timeout,
>              TP_ARGS(fence)
> );
>=20
>-DECLARE_EVENT_CLASS(xe_bo,
>-                    TP_PROTO(struct xe_bo *bo),
>-                    TP_ARGS(bo),
>-
>-                    TP_STRUCT__entry(
>-                             __field(size_t, size)
>-                             __field(u32, flags)
>-                             __field(struct xe_vm *, vm)
>-                             ),
>-
>-                    TP_fast_assign(
>-                           __entry->size =3D bo->size;
>-                           __entry->flags =3D bo->flags;
>-                           __entry->vm =3D bo->vm;
>-                           ),
>-
>-                    TP_printk("size=3D%zu, flags=3D0x%02x, vm=3D%p",
>-                              __entry->size, __entry->flags, __entry->vm)
>-);
>-
>-DEFINE_EVENT(xe_bo, xe_bo_cpu_fault,
>-             TP_PROTO(struct xe_bo *bo),
>-             TP_ARGS(bo)
>-);
>-
>-TRACE_EVENT(xe_bo_move,
>-            TP_PROTO(struct xe_bo *bo, uint32_t new_placement, uint32_t o=
ld_placement,
>-                     bool move_lacks_source),
>-            TP_ARGS(bo, new_placement, old_placement, move_lacks_source),
>-            TP_STRUCT__entry(
>-                     __field(struct xe_bo *, bo)
>-                     __field(size_t, size)
>-                     __field(u32, new_placement)
>-                     __field(u32, old_placement)
>-                     __array(char, device_id, 12)
>-                     __field(bool, move_lacks_source)
>-                        ),
>-
>-            TP_fast_assign(
>-                   __entry->bo      =3D bo;
>-                   __entry->size =3D bo->size;
>-                   __entry->new_placement =3D new_placement;
>-                   __entry->old_placement =3D old_placement;
>-                   strscpy(__entry->device_id, dev_name(xe_bo_device(__en=
try->bo)->drm.dev), 12);
>-                   __entry->move_lacks_source =3D move_lacks_source;
>-                   ),
>-            TP_printk("move_lacks_source:%s, migrate object %p [size %zu]=
 from %s to %s device_id:%s",
>-                      __entry->move_lacks_source ? "yes" : "no", __entry-=
>bo, __entry->size,
>-                      xe_mem_type_to_name[__entry->old_placement],
>-                      xe_mem_type_to_name[__entry->new_placement], __entr=
y->device_id)
>-);
>-
> DECLARE_EVENT_CLASS(xe_exec_queue,
>                     TP_PROTO(struct xe_exec_queue *q),
>                     TP_ARGS(q),
>@@ -386,164 +332,6 @@ DEFINE_EVENT(xe_hw_fence, xe_hw_fence_free,
>              TP_ARGS(fence)
> );
>=20
>-DECLARE_EVENT_CLASS(xe_vma,
>-                    TP_PROTO(struct xe_vma *vma),
>-                    TP_ARGS(vma),
>-
>-                    TP_STRUCT__entry(
>-                             __field(struct xe_vma *, vma)
>-                             __field(u32, asid)
>-                             __field(u64, start)
>-                             __field(u64, end)
>-                             __field(u64, ptr)
>-                             ),
>-
>-                    TP_fast_assign(
>-                           __entry->vma =3D vma;
>-                           __entry->asid =3D xe_vma_vm(vma)->usm.asid;
>-                           __entry->start =3D xe_vma_start(vma);
>-                           __entry->end =3D xe_vma_end(vma) - 1;
>-                           __entry->ptr =3D xe_vma_userptr(vma);
>-                           ),
>-
>-                    TP_printk("vma=3D%p, asid=3D0x%05x, start=3D0x%012llx=
, end=3D0x%012llx, userptr=3D0x%012llx,",
>-                              __entry->vma, __entry->asid, __entry->start=
,
>-                              __entry->end, __entry->ptr)
>-)
>-
>-DEFINE_EVENT(xe_vma, xe_vma_flush,
>-             TP_PROTO(struct xe_vma *vma),
>-             TP_ARGS(vma)
>-);
>-
>-DEFINE_EVENT(xe_vma, xe_vma_pagefault,
>-             TP_PROTO(struct xe_vma *vma),
>-             TP_ARGS(vma)
>-);
>-
>-DEFINE_EVENT(xe_vma, xe_vma_acc,
>-             TP_PROTO(struct xe_vma *vma),
>-             TP_ARGS(vma)
>-);
>-
>-DEFINE_EVENT(xe_vma, xe_vma_fail,
>-             TP_PROTO(struct xe_vma *vma),
>-             TP_ARGS(vma)
>-);
>-
>-DEFINE_EVENT(xe_vma, xe_vma_bind,
>-             TP_PROTO(struct xe_vma *vma),
>-             TP_ARGS(vma)
>-);
>-
>-DEFINE_EVENT(xe_vma, xe_vma_pf_bind,
>-             TP_PROTO(struct xe_vma *vma),
>-             TP_ARGS(vma)
>-);
>-
>-DEFINE_EVENT(xe_vma, xe_vma_unbind,
>-             TP_PROTO(struct xe_vma *vma),
>-             TP_ARGS(vma)
>-);
>-
>-DEFINE_EVENT(xe_vma, xe_vma_userptr_rebind_worker,
>-             TP_PROTO(struct xe_vma *vma),
>-             TP_ARGS(vma)
>-);
>-
>-DEFINE_EVENT(xe_vma, xe_vma_userptr_rebind_exec,
>-             TP_PROTO(struct xe_vma *vma),
>-             TP_ARGS(vma)
>-);
>-
>-DEFINE_EVENT(xe_vma, xe_vma_rebind_worker,
>-             TP_PROTO(struct xe_vma *vma),
>-             TP_ARGS(vma)
>-);
>-
>-DEFINE_EVENT(xe_vma, xe_vma_rebind_exec,
>-             TP_PROTO(struct xe_vma *vma),
>-             TP_ARGS(vma)
>-);
>-
>-DEFINE_EVENT(xe_vma, xe_vma_userptr_invalidate,
>-             TP_PROTO(struct xe_vma *vma),
>-             TP_ARGS(vma)
>-);
>-
>-DEFINE_EVENT(xe_vma, xe_vma_invalidate,
>-             TP_PROTO(struct xe_vma *vma),
>-             TP_ARGS(vma)
>-);
>-
>-DEFINE_EVENT(xe_vma, xe_vma_evict,
>-             TP_PROTO(struct xe_vma *vma),
>-             TP_ARGS(vma)
>-);
>-
>-DEFINE_EVENT(xe_vma, xe_vma_userptr_invalidate_complete,
>-             TP_PROTO(struct xe_vma *vma),
>-             TP_ARGS(vma)
>-);
>-
>-DECLARE_EVENT_CLASS(xe_vm,
>-                    TP_PROTO(struct xe_vm *vm),
>-                    TP_ARGS(vm),
>-
>-                    TP_STRUCT__entry(
>-                             __field(struct xe_vm *, vm)
>-                             __field(u32, asid)
>-                             ),
>-
>-                    TP_fast_assign(
>-                           __entry->vm =3D vm;
>-                           __entry->asid =3D vm->usm.asid;
>-                           ),
>-
>-                    TP_printk("vm=3D%p, asid=3D0x%05x",  __entry->vm,
>-                              __entry->asid)
>-);
>-
>-DEFINE_EVENT(xe_vm, xe_vm_kill,
>-             TP_PROTO(struct xe_vm *vm),
>-             TP_ARGS(vm)
>-);
>-
>-DEFINE_EVENT(xe_vm, xe_vm_create,
>-             TP_PROTO(struct xe_vm *vm),
>-             TP_ARGS(vm)
>-);
>-
>-DEFINE_EVENT(xe_vm, xe_vm_free,
>-             TP_PROTO(struct xe_vm *vm),
>-             TP_ARGS(vm)
>-);
>-
>-DEFINE_EVENT(xe_vm, xe_vm_cpu_bind,
>-             TP_PROTO(struct xe_vm *vm),
>-             TP_ARGS(vm)
>-);
>-
>-DEFINE_EVENT(xe_vm, xe_vm_restart,
>-             TP_PROTO(struct xe_vm *vm),
>-             TP_ARGS(vm)
>-);
>-
>-DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_enter,
>-             TP_PROTO(struct xe_vm *vm),
>-             TP_ARGS(vm)
>-);
>-
>-DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_retry,
>-             TP_PROTO(struct xe_vm *vm),
>-             TP_ARGS(vm)
>-);
>-
>-DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_exit,
>-             TP_PROTO(struct xe_vm *vm),
>-             TP_ARGS(vm)
>-);
>-
> /* GuC */
> DECLARE_EVENT_CLASS(xe_guc_ct_flow_control,
>                     TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u=
32 len),
>diff --git a/drivers/gpu/drm/xe/xe_trace_bo.c b/drivers/gpu/drm/xe/xe_trac=
e_bo.c
>new file mode 100644
>index 000000000000..6320168677e8
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_trace_bo.c
>@@ -0,0 +1,9 @@
>+// SPDX-License-Identifier: GPL-2.0-only
>+/*
>+ * Copyright =C2=A9 2022 Intel Corporation

s/2022/2024/

>+ */
>+
>+#ifndef __CHECKER__
>+#define CREATE_TRACE_POINTS
>+#include "xe_trace_bo.h"
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trac=
e_bo.h
>new file mode 100644
>index 000000000000..6d90f3f42d54
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
>@@ -0,0 +1,236 @@
>+/* SPDX-License-Identifier: GPL-2.0-only */
>+/*
>+ * Copyright =C2=A9 2022 Intel Corporation

s/2022/2024/

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>+ */
>+
>+#undef TRACE_SYSTEM
>+#define TRACE_SYSTEM xe
>+
>+#if !defined(_XE_TRACE_BO_H_) || defined(TRACE_HEADER_MULTI_READ)
>+#define _XE_TRACE_BO_H_
>+
>+#include <linux/tracepoint.h>
>+#include <linux/types.h>
>+
>+#include "xe_bo.h"
>+#include "xe_bo_types.h"
>+#include "xe_vm.h"
>+
>+DECLARE_EVENT_CLASS(xe_bo,
>+                    TP_PROTO(struct xe_bo *bo),
>+                    TP_ARGS(bo),
>+
>+                    TP_STRUCT__entry(
>+                             __field(size_t, size)
>+                             __field(u32, flags)
>+                             __field(struct xe_vm *, vm)
>+                             ),
>+
>+                    TP_fast_assign(
>+                           __entry->size =3D bo->size;
>+                           __entry->flags =3D bo->flags;
>+                           __entry->vm =3D bo->vm;
>+                           ),
>+
>+                    TP_printk("size=3D%zu, flags=3D0x%02x, vm=3D%p",
>+                              __entry->size, __entry->flags, __entry->vm)
>+);
>+
>+DEFINE_EVENT(xe_bo, xe_bo_cpu_fault,
>+             TP_PROTO(struct xe_bo *bo),
>+             TP_ARGS(bo)
>+);
>+
>+TRACE_EVENT(xe_bo_move,
>+            TP_PROTO(struct xe_bo *bo, uint32_t new_placement, uint32_t o=
ld_placement,
>+                     bool move_lacks_source),
>+            TP_ARGS(bo, new_placement, old_placement, move_lacks_source),
>+            TP_STRUCT__entry(
>+                     __field(struct xe_bo *, bo)
>+                     __field(size_t, size)
>+                     __field(u32, new_placement)
>+                     __field(u32, old_placement)
>+                     __array(char, device_id, 12)
>+                     __field(bool, move_lacks_source)
>+                        ),
>+
>+            TP_fast_assign(
>+                   __entry->bo      =3D bo;
>+                   __entry->size =3D bo->size;
>+                   __entry->new_placement =3D new_placement;
>+                   __entry->old_placement =3D old_placement;
>+                   strscpy(__entry->device_id, dev_name(xe_bo_device(__en=
try->bo)->drm.dev), 12);
>+                   __entry->move_lacks_source =3D move_lacks_source;
>+                   ),
>+            TP_printk("move_lacks_source:%s, migrate object %p [size %zu]=
 from %s to %s device_id:%s",
>+                      __entry->move_lacks_source ? "yes" : "no", __entry-=
>bo, __entry->size,
>+                      xe_mem_type_to_name[__entry->old_placement],
>+                      xe_mem_type_to_name[__entry->new_placement], __entr=
y->device_id)
>+);
>+
>+DECLARE_EVENT_CLASS(xe_vma,
>+                    TP_PROTO(struct xe_vma *vma),
>+                    TP_ARGS(vma),
>+
>+                    TP_STRUCT__entry(
>+                             __field(struct xe_vma *, vma)
>+                             __field(u32, asid)
>+                             __field(u64, start)
>+                             __field(u64, end)
>+                             __field(u64, ptr)
>+                             ),
>+
>+                    TP_fast_assign(
>+                           __entry->vma =3D vma;
>+                           __entry->asid =3D xe_vma_vm(vma)->usm.asid;
>+                           __entry->start =3D xe_vma_start(vma);
>+                           __entry->end =3D xe_vma_end(vma) - 1;
>+                           __entry->ptr =3D xe_vma_userptr(vma);
>+                           ),
>+
>+                    TP_printk("vma=3D%p, asid=3D0x%05x, start=3D0x%012llx=
, end=3D0x%012llx, userptr=3D0x%012llx,",
>+                              __entry->vma, __entry->asid, __entry->start=
,
>+                              __entry->end, __entry->ptr)
>+)
>+
>+DEFINE_EVENT(xe_vma, xe_vma_flush,
>+             TP_PROTO(struct xe_vma *vma),
>+             TP_ARGS(vma)
>+);
>+
>+DEFINE_EVENT(xe_vma, xe_vma_pagefault,
>+             TP_PROTO(struct xe_vma *vma),
>+             TP_ARGS(vma)
>+);
>+
>+DEFINE_EVENT(xe_vma, xe_vma_acc,
>+             TP_PROTO(struct xe_vma *vma),
>+             TP_ARGS(vma)
>+);
>+
>+DEFINE_EVENT(xe_vma, xe_vma_fail,
>+             TP_PROTO(struct xe_vma *vma),
>+             TP_ARGS(vma)
>+);
>+
>+DEFINE_EVENT(xe_vma, xe_vma_bind,
>+             TP_PROTO(struct xe_vma *vma),
>+             TP_ARGS(vma)
>+);
>+
>+DEFINE_EVENT(xe_vma, xe_vma_pf_bind,
>+             TP_PROTO(struct xe_vma *vma),
>+             TP_ARGS(vma)
>+);
>+
>+DEFINE_EVENT(xe_vma, xe_vma_unbind,
>+             TP_PROTO(struct xe_vma *vma),
>+             TP_ARGS(vma)
>+);
>+
>+DEFINE_EVENT(xe_vma, xe_vma_userptr_rebind_worker,
>+             TP_PROTO(struct xe_vma *vma),
>+             TP_ARGS(vma)
>+);
>+
>+DEFINE_EVENT(xe_vma, xe_vma_userptr_rebind_exec,
>+             TP_PROTO(struct xe_vma *vma),
>+             TP_ARGS(vma)
>+);
>+
>+DEFINE_EVENT(xe_vma, xe_vma_rebind_worker,
>+             TP_PROTO(struct xe_vma *vma),
>+             TP_ARGS(vma)
>+);
>+
>+DEFINE_EVENT(xe_vma, xe_vma_rebind_exec,
>+             TP_PROTO(struct xe_vma *vma),
>+             TP_ARGS(vma)
>+);
>+
>+DEFINE_EVENT(xe_vma, xe_vma_userptr_invalidate,
>+             TP_PROTO(struct xe_vma *vma),
>+             TP_ARGS(vma)
>+);
>+
>+DEFINE_EVENT(xe_vma, xe_vma_invalidate,
>+             TP_PROTO(struct xe_vma *vma),
>+             TP_ARGS(vma)
>+);
>+
>+DEFINE_EVENT(xe_vma, xe_vma_evict,
>+             TP_PROTO(struct xe_vma *vma),
>+             TP_ARGS(vma)
>+);
>+
>+DEFINE_EVENT(xe_vma, xe_vma_userptr_invalidate_complete,
>+             TP_PROTO(struct xe_vma *vma),
>+             TP_ARGS(vma)
>+);
>+
>+DECLARE_EVENT_CLASS(xe_vm,
>+                    TP_PROTO(struct xe_vm *vm),
>+                    TP_ARGS(vm),
>+
>+                    TP_STRUCT__entry(
>+                             __field(struct xe_vm *, vm)
>+                             __field(u32, asid)
>+                             ),
>+
>+                    TP_fast_assign(
>+                           __entry->vm =3D vm;
>+                           __entry->asid =3D vm->usm.asid;
>+                           ),
>+
>+                    TP_printk("vm=3D%p, asid=3D0x%05x",  __entry->vm,
>+                              __entry->asid)
>+);
>+
>+DEFINE_EVENT(xe_vm, xe_vm_kill,
>+             TP_PROTO(struct xe_vm *vm),
>+             TP_ARGS(vm)
>+);
>+
>+DEFINE_EVENT(xe_vm, xe_vm_create,
>+             TP_PROTO(struct xe_vm *vm),
>+             TP_ARGS(vm)
>+);
>+
>+DEFINE_EVENT(xe_vm, xe_vm_free,
>+             TP_PROTO(struct xe_vm *vm),
>+             TP_ARGS(vm)
>+);
>+
>+DEFINE_EVENT(xe_vm, xe_vm_cpu_bind,
>+             TP_PROTO(struct xe_vm *vm),
>+             TP_ARGS(vm)
>+);
>+
>+DEFINE_EVENT(xe_vm, xe_vm_restart,
>+             TP_PROTO(struct xe_vm *vm),
>+             TP_ARGS(vm)
>+);
>+
>+DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_enter,
>+             TP_PROTO(struct xe_vm *vm),
>+             TP_ARGS(vm)
>+);
>+
>+DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_retry,
>+             TP_PROTO(struct xe_vm *vm),
>+             TP_ARGS(vm)
>+);
>+
>+DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_exit,
>+             TP_PROTO(struct xe_vm *vm),
>+             TP_ARGS(vm)
>+);
>+
>+#endif
>+
>+/* This part must be outside protection */
>+#undef TRACE_INCLUDE_PATH
>+#undef TRACE_INCLUDE_FILE
>+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
>+#define TRACE_INCLUDE_FILE xe_trace_bo
>+#include <trace/define_trace.h>
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 26b409e1b0f0..c2100d26b4e3 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -36,7 +36,7 @@
> #include "xe_pt.h"
> #include "xe_res_cursor.h"
> #include "xe_sync.h"
>-#include "xe_trace.h"
>+#include "xe_trace_bo.h"
> #include "xe_wa.h"
> #include "xe_hmm.h"
>=20
>--=20
>2.34.1
>
