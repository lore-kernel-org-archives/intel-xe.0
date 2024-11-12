Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1660BD597A7
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 20:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB01310E678;
	Tue, 12 Nov 2024 20:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gWezmvWL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A345910E671
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 20:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731445061; x=1762981061;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XSwOWJlB2MZfNcuaVlTcMZ81YO1X3df9v+Kjm9gjV9c=;
 b=gWezmvWLF8U+YsUaLLl7gwAaCUTAnItSxivoBAfjk+2bom7Kd0VQTogW
 q6SNu2oEiEm6Lv1u2H7t6erjbaPDyYZt0WY5z3VE8bSR2xNezdOZcoh2s
 9DhYyb09vEQPsBp4ucCTVdDI9YRbewaRZWS9wBMI43oDUFQfxHtWTc9YY
 8xHKCfOuS79MkkawMEUQaHfGMaiK3mkhBbjqxcvY+m29u3DvZgGcc/RjT
 A6GF+nC3IUoaZhjx76cc6/4uhwSPtk8InBwEGVjPXOKAFh+gd5S714NB+
 qqdL3dAoE9W25A9NP7wwtGE4sBwK/RdGRYfyOl987LePFU2LM0qbrsmjR A==;
X-CSE-ConnectionGUID: /sonHArwSKCx1z7lIROlfw==
X-CSE-MsgGUID: ppk6i00DS5+CnXLQYlQnRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42410858"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="42410858"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 12:57:40 -0800
X-CSE-ConnectionGUID: x/xWKYR0R7uQd6cht7C3MA==
X-CSE-MsgGUID: yU50xxsdSUSji1zICz7BNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="87400157"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 12:57:40 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 12:57:39 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 12:57:39 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 12:57:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Opyp0ICqBAyJuWjbX2sWMaApMKlOtlAPsbAIHFIRxGZKfQuvPONw7pANfnj9+Xdllli73N+32K/eR73lihl1j7qhj894ZHImQNPSmaFNKu+Jv9YD9wOlvvits3ansCfYIpuqc6nzJvpZ1KikD9qOeRFR5ichQpcSZtADOGN+wjUuLQahdDaXQMbGxvXuKio4NetYGTBtzbBe9UDAVlDWpZgOANU5WRGcm14RmSG2j4YyDL3yiSYylRprLJWeBfOnVosMR/WVbXBGof9/iFBRT9lyqSqmKi99hk/gZwR2jqAcgV6BIZOJwupM7DaTSy4tssY5f8lwbPDwdjAZZC48WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSwOWJlB2MZfNcuaVlTcMZ81YO1X3df9v+Kjm9gjV9c=;
 b=XAq4GA8yYgTTtsrNdm4bGz9yVtgtzgyX9tQ4iSwdaAFNVHg3EbraFG8gHHopNs63s46nPQgKk1H9ZZpdzZrUk/Ll0ONxiy/AXZWCqbKpJQhbXgaiE1HtpZhPmrhjXy+BuImNdVr5ZnkUbugb+01Mhxi25P5hkgzz9S+jISsGl0CJHVokJsxiFCeQ05q3xcy6QDcvgmw2se0eAcja3dh02/9EPKXgoP+U+7nt1HyxVKEx2PHl/uNlYiH47SGOZNY12mBagCNfLGLhMsdyBdoz4bGijKVH1jHq1rZny7+8a1psdWvaoAvyCtNMPemrIwqDTxAyZ6bDLfgRD8W3UmCMZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by IA1PR11MB7296.namprd11.prod.outlook.com (2603:10b6:208:427::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 12 Nov
 2024 20:57:36 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%6]) with mapi id 15.20.8158.013; Tue, 12 Nov 2024
 20:57:36 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Harrison, John C" <john.c.harrison@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>, 
 "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Dong,
 Zhanjun" <zhanjun.dong@intel.com>
Subject: Re: [PATCH] drm/xe/xe_lrc: Rename desc to addr
Thread-Topic: [PATCH] drm/xe/xe_lrc: Rename desc to addr
Thread-Index: AQHbNTR7eRw4cOOKKUyWktzLt8apxrK0Gt8AgAAFtYA=
Date: Tue, 12 Nov 2024 20:57:36 +0000
Message-ID: <40897f1caac5a0f618e0197b3809b710b225dd75.camel@intel.com>
References: <20241112185515.64060-1-jonathan.cavitt@intel.com>
 <ZzO8dIiqWMVmMaWy@intel.com>
In-Reply-To: <ZzO8dIiqWMVmMaWy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|IA1PR11MB7296:EE_
x-ms-office365-filtering-correlation-id: 2665a177-0d4f-485d-c6aa-08dd035ca31b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bzg4YUdIY0VJcjdGU3lscENGeXU1K2ZEdUR0UzRITHF6Mms1K2pRRDdBeWJp?=
 =?utf-8?B?bVRVa3BSVkY5VWxESjJGaGtabjJBWmpxbjUyNVhROVdZbVRWcnpsZFFxeTVt?=
 =?utf-8?B?dDVGT01lbVhHMU02NnF4SXNGeVhVSmJicVNGR3FDNTljOFRxcEEvTGlWOGVp?=
 =?utf-8?B?WGpSMHp3YU56aTU0c3FTaDFuNktmRW9DMXd3MTFtZGQydUE5emNUd2w5eTFW?=
 =?utf-8?B?S2dPblRlcmcyUjMxMlBROVQxSFJzOS9rSUFOb3J5QmlTUWRwNDNDc3g2b1R4?=
 =?utf-8?B?Tmk5WUV0RmZQTEVKU0xNYm01ZEtIaU1EczB2RjJibkxpRThoT0htazJBTkJX?=
 =?utf-8?B?UTVvVGFET1pjSFVxaStvbkU0ZjVxMXZPRzBBd2t5cVdDVmk4VHRmRjR5Z1Zw?=
 =?utf-8?B?endyUGtTL1Q2aVJuU0tDUm1qSlp0bDU1YTFQTHJnQVRSNjNhMk1NSkYveFBX?=
 =?utf-8?B?UGJEREVMQnBCcnQwc3ZuaThCem9kd0pkODVDTmFVOFpwdEtJN1pHY0RxbzRO?=
 =?utf-8?B?Y040aDNjSFhva0JaVXdtdHpyVFIwWDR4NU05V0l3UDk5WXNsYlVFRUFwdVhY?=
 =?utf-8?B?Z20zTHZtb1RzRTIyRXF4aTN4OGRFb2hNbGg5QUxBcFl5N2Nvb0IydFlTRGND?=
 =?utf-8?B?VmdoVVE2dUJKZzQ1RnQzT3g1TG1xSDQ1K1lxb0llNDNhQ0xob3ZxeWRYQ1Q1?=
 =?utf-8?B?c3k3SnFTSmZBcW9od2pZcURQODRiemlVc3pYaFhDUHFCL25rTW15V05HQ29l?=
 =?utf-8?B?OGpQdWEySzc2S092bnVZaFZKSmxoaHhteW1UZ1duSi82TTBKZWpsMUtSeEpB?=
 =?utf-8?B?bDVFa2NCYS9SdHk3eitqZDdNNWtySTRtemVPeEVPUjFCaVFENVpFNDh2bFVh?=
 =?utf-8?B?V2JOZEFWUXZvb2VhVjhUTm5uZWJYVlpqa202YjBKeHFlVlBJOWVpdFJSVkdX?=
 =?utf-8?B?M0VEQjNMWU96bC9BZU9IbG85U0tseHpjMVZtVVZoMzBXYUtCMFBXKzZwVk1j?=
 =?utf-8?B?UGQybTJ6ZkFISFhKWWl4Z0FSS1J6N2NKL09VbnVFNjgyanRYdWhubXhIdS8r?=
 =?utf-8?B?bVpYdlhldTQ4d3pYL1VuVmd1Wm9JYTNuSlNteGJBdGlJY2N4dWFuSUkzbWdk?=
 =?utf-8?B?cWhwc0lWb1NDTVlLS0UwbTRRWWt5aHRJeUwzbDMwa0IrNXFsN2xpSmxRUlVk?=
 =?utf-8?B?UDRoU1RJcnNIcVdhcFZOUGF3LzQ3V3Fsd2JQajUzT09FY0xabEFQLzJ5MGNO?=
 =?utf-8?B?bVZsVVMwTWFvMzZUZHNIYU03TmJkNjRXQUZHTzU2ZDVwakFZRFdKM1h3UWlm?=
 =?utf-8?B?YnhXQlpSbkJrNnFYVHRYZU90SDZTVTVrWG1PY0dCUUNBK0NmdjRQdXpDcUFv?=
 =?utf-8?B?Y2pSOWZqcHlwUnpFa1dKb0p1cVd6N0hKaEREZHA2VzB3bnlpS3k5TjVLWmVu?=
 =?utf-8?B?S2d6eUpHQVFBMEFqN3hCTHBTbjZVRVo0c2hBTlhRTUJ6bFVDK1FZTi9GSE1W?=
 =?utf-8?B?MzZxWG4zNkdZa2ZoMjNXVTArQjdUWTY2dnlvWndVeWluT1Fnb1UrNkxIM3Bq?=
 =?utf-8?B?K3pWUGpuQ1ZHTjgxdk5JTHN6aUJWZjNyWng2b0hrdE05dUVoL2t5Y1dHVmRG?=
 =?utf-8?B?TVlKczBmM0w1Yms2blY5Rk80RnpiMlVIWlZ3bk42b0c1N2tJT1gyU1RSOUdi?=
 =?utf-8?B?aUF5OXV5aWMyZnZ6WDJLVm93Q1ZQdWpubFRtRk5NY1BvQXcwUFFnRkNGU2Yy?=
 =?utf-8?B?aEJValE4bGxCRUF2RTRpZVBkcWJqT0Mza0Zrc3orS2EvUmZzWE1HSmFKT1ph?=
 =?utf-8?Q?lALbhXeA55EQgd9eMpsBk6Dr/nLfL2EQHKszU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVJRZWl1ZGhrbWVlY2dydXRCU0todVRpTVhkdUNGRWExTmdEbXJ0azRSMHZ6?=
 =?utf-8?B?cnVWTnRyQnBGaDgwSkFneUdvUy9ubFZPbExOZ3QvdTBuazJteTlHR0grLzM2?=
 =?utf-8?B?VjJCNXdSM1Q0ckQ1M2t0eE8yTXBwOHU1VXNzcXlTQStqRWF4ZDFoeW1iVEpB?=
 =?utf-8?B?L2ZWczZ6SU1YdzQxa0JmTnVEbEgrMzZyQ3lYdmZNZ0VBTFNuTEl4UUxpdlFT?=
 =?utf-8?B?ZEhsVjFOQnBueDZxeDVxWVN6Ykw5WjI0WkdTeEJCVS9QdjBCc1JIQVovN1BU?=
 =?utf-8?B?RUdyQUlkTElqMUxwbmJqVWp1VmZ1N3RLclVDT1VmSmExMGhuTFNxNWVwZkl6?=
 =?utf-8?B?aHBXV0FsWnRNUXVVcmJ6RERCOWlVWFAwbXU2TVJIU0IwVU5CYXNFbEF4VzR4?=
 =?utf-8?B?UVFlYk1OdE9EUjNDM3J4dXNLREtyQktCdlRZMEJWSzJVRGc3NXczRE9vQnBh?=
 =?utf-8?B?R3ZuUk5LN2dsbzVyQVBudmxMbENMN1d0OWlPNTBGb2FUMmkrNTExUUoxSkcy?=
 =?utf-8?B?RU9ISEJMbk9scE1SZ2pUUUNwRFc0MXp0VGFvMko1Smp5M2VGSjVZM1J3Y1RT?=
 =?utf-8?B?TUoxbzhkUG1Ia2IwTWp4OTNLcjViSUdFcGh4QWJCMm5QaUpHeThWTWZJV3Mr?=
 =?utf-8?B?Y2YzQmN6MStXZ1B6dnlMeDh2VDlJd1BUbkFhaDR1dGtYakk5SUVkZ1NVYWFS?=
 =?utf-8?B?NHZ3Z2QzRHNNcUc1N0doclVNZ1BQMDEyLzBwVExNVUJaUlZNc1BkazluYWg5?=
 =?utf-8?B?ZEJzU1FUS3Fmbjd1anJXWTRCM3JxTzY0bW5xbzBHNDF3Z1hlOUhyS2VCVkRQ?=
 =?utf-8?B?ZDJLNUdaUUV2NUdHeC9wSFhJSFAxanAwSHdMN1FPVnBxZkU2cHR5aUJtcC96?=
 =?utf-8?B?QzVWR0dFR28xY21oMHJoRGxBcWFzK3N0RXV0dDBlclQreGRxTktLV1JwU1ll?=
 =?utf-8?B?SFFyeVRDMDFwVUJEN1RkbVBqb1BybHJjOTRXc2p0Nm4veWt2ZGxyUXBFTkU5?=
 =?utf-8?B?N2VOSTJLaGRNZG9DMVRXdkVtbnQrdWUzemJTZENVU2ZHaGdpUGNHYkhxa2Qw?=
 =?utf-8?B?K1BDUWYzaGZLYjRHZlM1Zml2Y0IxUnR5dW9KZmFTNzFQM3BCdUFwMnptcVRu?=
 =?utf-8?B?TzlSVmhXZVFTRTAxNnQ2VFFyN0tNTjBaQUFQQ1JVdHRiUGQxaDNGNm1tRmhw?=
 =?utf-8?B?K1NoVEJ6Rkl3eDdHWXhMZlZobkljSW1oY2ZNZXcreDhNVTlFSm16ZlRPV2JZ?=
 =?utf-8?B?cUlEL3VaOWh0TDYvRjQ1Qm91cHA1RzJhbHdkQnRvRXEwNG5KdzU0bDE0aFVH?=
 =?utf-8?B?cWh4Z21ERkMxSGNXaWNEYmV2dEN1QkZURHlRK2tmWmpibllCbzNhK1RTNE5J?=
 =?utf-8?B?MENGWWk2QmpyWmJWcVlYLzB1Y3Z1RFNia1dBQTd5MHRRcDdKdUVScm5mNlVX?=
 =?utf-8?B?eUsrNnV0RzZBOVNtdDZnS2dyY2Vic2lNQjdZbzZ3OVNBbHpOd2pPa0VOZFJ2?=
 =?utf-8?B?TVhUNjFsRHNaaXJyQTBuUE8xQ2tKc2lYaVVNaEJiMzhPaGFQMFVsVldTdDBS?=
 =?utf-8?B?UWl6YkpBdzhrTm5BajJaSm4yVzZ4bnZyOEM4VEx0QjNNY0QxY1Z3K1AzZFdF?=
 =?utf-8?B?ZU8vaVhmWFhzdy9kNXJyTG81T2syYjErQXpWVGhReTdiQmtRSlUxTjE3R2lp?=
 =?utf-8?B?VnJWUTZoazJDb2FPbWpUSGNwQVZCS0trOXV0aTdwU2N1N2JRN3VUWE1yWGRs?=
 =?utf-8?B?ait6YkZkK04ySmZsT1cxMytmVVVtWnZCSTh6bC9OZDFlcFdWcnlaalRRVmlW?=
 =?utf-8?B?ZDVTSDA4WURXLzkzK096MUtLSS9Jb2JTNkVMZ3hTb3FQRStmODdRWUt1a0ZZ?=
 =?utf-8?B?cWplMmVtTjlvWFV1Y2daZ0VOcUJDbHRMRHVLbk55VFZWeEdaQVUwZnJVd2c2?=
 =?utf-8?B?VkxScWYrSitjWjluZzN0V2JEenJyQmRIZTdKb3ZVS3kxMERPZGtWSVdIT0Qw?=
 =?utf-8?B?eE5pbERBdyttejB6ZE4rTndTa0lzUnBDbkFrT0REbFJTOFNqOUdzSEtiOTdL?=
 =?utf-8?B?ZHY0eTF6azFMMU9kS3Q0a09vY0FFRmVITjhEbEcyd05Sc3c3REVqTVp4a0Vl?=
 =?utf-8?B?eXY3TFJ1eTBnUFg3QkF1NkliaXZrYThCVFNkQ1NLRk1aeG0rMzEyTFYvODM1?=
 =?utf-8?B?TXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2251AC6D755C448901F7AE03AECC9BF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2665a177-0d4f-485d-c6aa-08dd035ca31b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2024 20:57:36.4410 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 213DvXPafR2awz6Txuof0kJtNwnCb0ChWytWP/G3vJr4aUoN72iyLmOBhWU/pBoImvlz9J1sNI6i62RiHnncyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7296
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

T24gVHVlLCAyMDI0LTExLTEyIGF0IDE1OjM3IC0wNTAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIFR1ZSwgTm92IDEyLCAyMDI0IGF0IDA2OjU1OjE1UE0gKzAwMDAsIEpvbmF0aGFuIENhdml0
dCB3cm90ZToNCj4gPiBUaGUgcXVhbGlmaWVyICJkZXNjIiBhcyB1c2VkIGluIHRoZSB4ZV9scmNf
c25hcHNob3Qgc3RydWN0IGlzIGEgbGVnYWN5DQo+ID4gdGVybSB1c2VkIGJ5IGk5MTUgdGhhdCBo
YXMgYmVlbiBpbmNvcnJlY3RseSBhcHBsaWVkIHRvIHNvbWUgb2YgdGhlDQo+ID4gYXR0cmlidXRl
cy4gIFNhaWQgYXR0cmlidXRlcyB0aGF0IHVzZSB0aGUgImRlc2MiIHF1YWxpZmllciwgbmFtZWx5
DQo+ID4gImNvbnRleHRfZGVzYyIgYW5kICJpbmRpcmVjdF9jb250ZXh0X2Rlc2MiLCB3b3VsZCBt
b3JlIGFjY3VyYXRlbHkgYmUNCj4gPiByZWZlcnJlZCB0byBhcyBhZGRyZXNzZXMsIHNvIHJlcGxh
Y2UgdGhlIGluY29ycmVjdCAiZGVzYyIgcXVhbGlmaWVyIHdpdGgNCj4gPiAiYWRkciIgaW4gdGhl
c2UgY2FzZXMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25h
dGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KPiA+IENDOiBKb2huIEhhcnJpc29uIDxqb2huLmMuaGFy
cmlzb25AaW50ZWwuY29tPg0KPiA+IENDOiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGlu
dGVsLmNvbT4NCj4gPiBDQzogWmhhbmp1biBEb25nIDx6aGFuanVuLmRvbmdAaW50ZWwuY29tPg0K
PiA+IENDOiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4N
Cj4gPiBDQzogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gPiAtLS0N
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jYXB0dXJlLmMgfCAyICstDQo+ID4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYyAgICAgICAgIHwgOCArKysrLS0tLQ0KPiA+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfbHJjLmggICAgICAgICB8IDQgKystLQ0KPiA+ICAzIGZpbGVzIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jYXB0dXJlLmMgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3VjX2NhcHR1cmUuYw0KPiA+IGluZGV4IGNjNzI0NDZhNWRlMS4uYjk1YzIxYTE4
YzMxIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY2FwdHVyZS5j
DQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jYXB0dXJlLmMNCj4gPiBAQCAt
MTYzMiw3ICsxNjMyLDcgQEAgeGVfZW5naW5lX21hbnVhbF9jYXB0dXJlKHN0cnVjdCB4ZV9od19l
bmdpbmUgKmh3ZSwgc3RydWN0IHhlX2h3X2VuZ2luZV9zbmFwc2hvdA0KPiA+ICAJCWlmIChnZSkg
ew0KPiA+ICAJCQlndWNfaWQgPSBnZS0+Z3VjLmlkOw0KPiA+ICAJCQlpZiAoZ2UtPmxyY1swXSkN
Cj4gPiAtCQkJCWxyY2EgPSBnZS0+bHJjWzBdLT5jb250ZXh0X2Rlc2M7DQo+ID4gKwkJCQlscmNh
ID0gZ2UtPmxyY1swXS0+Y29udGV4dF9hZGRyOw0KPiA+ICAJCX0NCj4gPiAgCX0NCj4gPiAgDQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9scmMuYw0KPiA+IGluZGV4IDRiNjVkYTc3YzZlMC4uMDlmMGU2Njk1MmU3IDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYw0KPiA+IEBAIC0xNjM1LDggKzE2MzUsOCBAQCBzdHJ1
Y3QgeGVfbHJjX3NuYXBzaG90ICp4ZV9scmNfc25hcHNob3RfY2FwdHVyZShzdHJ1Y3QgeGVfbHJj
ICpscmMpDQo+ID4gIAlpZiAobHJjLT5iby0+dm0pDQo+ID4gIAkJeGVfdm1fZ2V0KGxyYy0+Ym8t
PnZtKTsNCj4gPiAgDQo+ID4gLQlzbmFwc2hvdC0+Y29udGV4dF9kZXNjID0geGVfbHJjX2dndHRf
YWRkcihscmMpOw0KPiA+IC0Jc25hcHNob3QtPmluZGlyZWN0X2NvbnRleHRfZGVzYyA9IHhlX2xy
Y19pbmRpcmVjdF9yaW5nX2dndHRfYWRkcihscmMpOw0KPiA+ICsJc25hcHNob3QtPmNvbnRleHRf
YWRkciA9IHhlX2xyY19nZ3R0X2FkZHIobHJjKTsNCj4gPiArCXNuYXBzaG90LT5pbmRpcmVjdF9j
b250ZXh0X2FkZHIgPSB4ZV9scmNfaW5kaXJlY3RfcmluZ19nZ3R0X2FkZHIobHJjKTsNCj4gPiAg
CXNuYXBzaG90LT5oZWFkID0geGVfbHJjX3JpbmdfaGVhZChscmMpOw0KPiA+ICAJc25hcHNob3Qt
PnRhaWwuaW50ZXJuYWwgPSBscmMtPnJpbmcudGFpbDsNCj4gPiAgCXNuYXBzaG90LT50YWlsLm1l
bW9yeSA9IHhlX2xyY19yaW5nX3RhaWwobHJjKTsNCj4gPiBAQCAtMTY5Miw5ICsxNjkyLDkgQEAg
dm9pZCB4ZV9scmNfc25hcHNob3RfcHJpbnQoc3RydWN0IHhlX2xyY19zbmFwc2hvdCAqc25hcHNo
b3QsIHN0cnVjdCBkcm1fcHJpbnRlcg0KPiA+ICAJaWYgKCFzbmFwc2hvdCkNCj4gPiAgCQlyZXR1
cm47DQo+ID4gIA0KPiA+IC0JZHJtX3ByaW50ZihwLCAiXHRIVyBDb250ZXh0IERlc2M6IDB4JTA4
eFxuIiwgc25hcHNob3QtPmNvbnRleHRfZGVzYyk7DQo+ID4gKwlkcm1fcHJpbnRmKHAsICJcdEhX
IENvbnRleHQgQWRkcmVzczogMHglMDh4XG4iLCBzbmFwc2hvdC0+Y29udGV4dF9hZGRyKTsNCj4g
DQo+IENjOiBKb3NlDQo+IA0KPiBUaGlzIGNoYW5nZSBtYXkgYnJlYWsgY3VycmVudCB1c2VyIHNw
YWNlIHRvb2xzLiBTbyB3ZSBuZWVkIHRvIGF2b2lkLg0KPiBFdmVyeXRoaW5nIGVsc2Ugc2hvdWxk
IGJlIG9rYXkuDQoNClRoYW5rcyBmb3IgdGhlIGhlYWRzIHVwIFJvZHJpZ28uDQoNClRoaXMgY2hh
bmdlIGRvbid0IGJyZWFrIE1lc2EgcGFyc2VyIGFuZCBJIGRvbid0IHRoaW5rIGl0IHdpbGwgYnJl
YWsgYW55IG90aGVyIFVNRCBwYXJzZXIgYmVjYXVzZSB0aGUgSFcgY29udGV4dCBkYXRhIGlzIG5v
dCBhcHBlbmRlZCB0byB0aGUgVk0gZGF0YQ0Kc2VjdGlvbi4NCg0KQWNrZWQtYnk6IEpvc8OpIFJv
YmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KDQo+IA0KPiA+ICAJZHJtX3By
aW50ZihwLCAiXHRIVyBJbmRpcmVjdCBSaW5nIFN0YXRlOiAweCUwOHhcbiIsDQo+ID4gLQkJICAg
c25hcHNob3QtPmluZGlyZWN0X2NvbnRleHRfZGVzYyk7DQo+ID4gKwkJICAgc25hcHNob3QtPmlu
ZGlyZWN0X2NvbnRleHRfYWRkcik7DQo+ID4gIAlkcm1fcHJpbnRmKHAsICJcdExSQyBIZWFkOiAo
bWVtb3J5KSAldVxuIiwgc25hcHNob3QtPmhlYWQpOw0KPiA+ICAJZHJtX3ByaW50ZihwLCAiXHRM
UkMgVGFpbDogKGludGVybmFsKSAldSwgKG1lbW9yeSkgJXVcbiIsDQo+ID4gIAkJICAgc25hcHNo
b3QtPnRhaWwuaW50ZXJuYWwsIHNuYXBzaG90LT50YWlsLm1lbW9yeSk7DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9s
cmMuaA0KPiA+IGluZGV4IDQwZDhmNjkwNmQzZS4uZjZiZjgxMDA5Mjk0IDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9scmMuaA0KPiA+IEBAIC0yNCw4ICsyNCw4IEBAIHN0cnVjdCB4ZV9scmNfc25hcHNo
b3Qgew0KPiA+ICAJdm9pZCAqbHJjX3NuYXBzaG90Ow0KPiA+ICAJdW5zaWduZWQgbG9uZyBscmNf
c2l6ZSwgbHJjX29mZnNldDsNCj4gPiAgDQo+ID4gLQl1MzIgY29udGV4dF9kZXNjOw0KPiA+IC0J
dTMyIGluZGlyZWN0X2NvbnRleHRfZGVzYzsNCj4gPiArCXUzMiBjb250ZXh0X2FkZHI7DQo+ID4g
Kwl1MzIgaW5kaXJlY3RfY29udGV4dF9hZGRyOw0KPiA+ICAJdTMyIGhlYWQ7DQo+ID4gIAlzdHJ1
Y3Qgew0KPiA+ICAJCXUzMiBpbnRlcm5hbDsNCj4gPiAtLSANCj4gPiAyLjQzLjANCj4gPiANCg0K
