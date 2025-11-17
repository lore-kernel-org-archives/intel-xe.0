Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D30ACE8D6B
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 22:03:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2BE10E1CE;
	Mon, 17 Nov 2025 22:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CIAiajiH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49B610E1CE
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 22:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763417010; x=1794953010;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=jw5MHHfadQrYa36/W3gmFbzYwPDx1y+PoHiPCTy2n5s=;
 b=CIAiajiHdkagSFpJg6H+mCfeGa+FCwNjG0nYiTSOKbuCI9VVycoQGNTS
 9cAw91E9sdyqwWFVITktQuQh1UJ8FeRKPlUIMop1YD+oQ4Vm40AwwAhaG
 ZEAP9faGXJQrsR8XMh1DBFxvR37vYN901Xa4IbYw/l2hidQZLkK49LFmF
 OiveCWoNt5zBl+ABcTy82ZVJfWxNbJE2utZOh+yerF8MNlc79Qayq8n26
 hyxid3EAHalbZbM0PiUp73+TYJXtdcjeFsICama6AdSfPsbVb+BFC4g4w
 QUQLQ78Eg4kiwdLVaWa+wyLWaH8fezcZ/3ySWm7PWPOSwh2IRNbuHNaTj Q==;
X-CSE-ConnectionGUID: 7FLiE2IjTOu+DPfW8MUI+A==
X-CSE-MsgGUID: YZ9wdFELRMKOgWV2GHzdSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65363101"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="65363101"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 14:03:29 -0800
X-CSE-ConnectionGUID: g7UlTanFR1qjtfE3wgLHNA==
X-CSE-MsgGUID: I4lSyOwiTMCDdXVO4WpZmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="191009949"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 14:03:29 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 14:03:28 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 14:03:28 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 14:03:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uia3SvbkTCIQu17EI6aHXCmijRGHF1QFwlQrk9ULlsvCTgw8eIvQOzrQwBWQJmQwLsS37ypNni5tyQZ0qwwKoAvkaCUPvO7uGF704mBJD88O8ylSBUBYKy/3xDMXGER01xfn6O6Fs8YHdJwYRJ4eOiJXrGm0IHbEgOFlJimJ+Rm8T0pYkpXV484OOXN2Pc7wyFsUhzjXDrDDKbX4z1WkXf5q4di6gRiCxUkhcr2Ld/xsoMjuhQS4n4kS5t/3v6FCQdvMJsnbskD5jI/v93ZwnnOMBkkCBzy2POqMmCtC2i4DfxRrhNPIzS+r7MU7M4vMmuVIyb2WdgvvVq1VtX0m+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdAaRPHI50VDZ87wQ/7Wit50ExaVq6Jc7N3LJMure0E=;
 b=NC9rsMAq3Ip7suUnutLvW5+yZQjNbD+9l70Vsp5cNNzjVNa1Mk7zJMvw9MnQ3L76qOYXRHl0kyBFMY8NSkZM7mViM5zHTcUeLvYt02H4R+UnLeE3OaFOKPtwe1T4I4STpJKbhwsp0ndF3uUTUlZVhMfnyqU8entq3r3aB9+TihWS7m7I5kQkcDW22gdm4puHDKNhBwf4szPy9354rOLYetHF1Cs0Y4ibl19v1U4+qMQ8ywGcAygEx1o7Htp+Oca73+uP+2q4lv8Uh/fKgul7i+N3530GE3n1aySuACCH46jQ+LcCVlKrIM0SUbGEIQFL+9i3Qci2w25O0Ynto5Vm3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA2PR11MB5115.namprd11.prod.outlook.com (2603:10b6:806:118::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 22:03:26 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.019; Mon, 17 Nov 2025
 22:03:26 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251114214335.2388972-30-matthew.d.roper@intel.com>
References: <20251114214335.2388972-29-matthew.d.roper@intel.com>
 <20251114214335.2388972-30-matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 01/27] drm/xe/forcewake: Add scope-based cleanup for
 forcewake
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Mon, 17 Nov 2025 19:03:21 -0300
Message-ID: <176341700179.5989.401932592264605194@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR13CA0032.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::7) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA2PR11MB5115:EE_
X-MS-Office365-Filtering-Correlation-Id: 614170fa-0cca-40e4-82ec-08de26252212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3ZOT0ZUNnVqQ1NyR3B6VGU0WEErSzBoUVNrVE8weUZkVHJPdVd0MzJtU2lK?=
 =?utf-8?B?OGl6RXR1bXF0UlZzUE13UXlZSWc5R2V0OEN0bFFubjZsS1p5ampURDZHdGRx?=
 =?utf-8?B?VzhCQzlqV0JyalZTWk55ZXlzQThXbkU3a0h3ZDRNVWtkNVdqMk42NDdvbDJQ?=
 =?utf-8?B?V0wyNDFiSHl5R04wZ3VkbDhiMXVtVW9SRXJnQW8ybEprMkFHVldVLzR1RmtG?=
 =?utf-8?B?ZTJBZi9YVEVwYmZDM0p5cUFWV1ZqSW1tU0FUVXRnbC9OTWJ2dmJ3UzQwSmJw?=
 =?utf-8?B?TlhhVWtkWjZCbG1xempSdXVCUmhCWDZLMW9LR2FOc1ZHRVdCVE1DOEQ3R05a?=
 =?utf-8?B?V1pIeXhjOUhseTVjMzlQRnVJYXVyc1QxMDhmNmZqNng1cGtJZ2VPVXU3SDNZ?=
 =?utf-8?B?SlR4Nld5Z28xWTZsWHlYa01DQlZXWHJGQzVSbGFEeXZ2bHFYMTA1Mnkvd0Nq?=
 =?utf-8?B?MUJwQXFEV3NRQ3NuV1Bsd0Q4Ym9GOEdwbnlBaFJGRTQ4YXpkSHZMaFhIWnNR?=
 =?utf-8?B?djhXdlBBMk5rNUtuOXpOWHNNQ0NmUmxRcXNybDgzWUpzNE4vM3hBbHI3S3RS?=
 =?utf-8?B?NHlQNnFhUkFpcE0zczJhTTFWQmFZN1lSRWtaS08wZ2pJMENzTG9BWWRKa3lH?=
 =?utf-8?B?RnVxUjdwTzZCNHVoUTYvbDVCM2FIdnIvVTNrTjNzNEtBMnRFUkI5U0xPYmFW?=
 =?utf-8?B?bU41VW1Hd2pXYkZHZXJNQUVqaWJKOWJ5aUFwM1k4a3VWSmRJV1MvK0h1bE9H?=
 =?utf-8?B?Y2xiTE0xSTgrcHNIUTVUVE91eDNmSzBjQlZIeGJMTmc3aXJrRWZGeGZDZjZy?=
 =?utf-8?B?aHpENnlTT01vV1ZkWlFISVJmcEZDUExGREdobmYyeXp2eUJHUWcrbTlDNThj?=
 =?utf-8?B?cmJpL0V0TThGQ3ZDemM0K1VuZkgzSEFTS3JFTHo5ZFNYMXpFeXhmOXV6OUNi?=
 =?utf-8?B?VExscnJGa3poaHNzTmgrbW1NU0Z6RWtvK05WaDhNMVpFYW0xTE55b25hbHQz?=
 =?utf-8?B?K0MrNDlQZ3lyU28xZDEvYmJ3N280bk11RFNLNnRaQjhuWkRLdlhSa2ZjQ0Jk?=
 =?utf-8?B?UTJTQklQVHRKK2ZubFR2Mjdub0xuOHR2bkZtNnp6ejJpWlhXWmRnQWF0UmRv?=
 =?utf-8?B?M3FrbG9PZER3eWR5allZNUovOEc1QlF4UE5OQmRuVTZ0S2RFL3dnL1kvN1lM?=
 =?utf-8?B?dVVyTkVpdHZOS1BjSTA3NzdaalB0NVh0WGt2V1BaeGM3cWZDYitUWnpQSUJs?=
 =?utf-8?B?V3hSQ2pqQjduaWU1RkduUGFvYzlCMkcveVR6V1BFNGNoMVdUbUd0WGNXa2M4?=
 =?utf-8?B?eHJ6RHVnRjkzdHZEM3gweVB2Skk2NUc2WVQ5QXFTSkZkMzMrSjdpakVkdUE1?=
 =?utf-8?B?cGlxRzdFMEV5MC9WN1oyT1RRSStrWENBT2cvT0FqamJZK29SdUhiVE1KR3pQ?=
 =?utf-8?B?UHl2ell0b2FxaEtQTWg0bUpaR0NzdkhsS3p1ZFlKL01iYy9ndXQwOWJaQzlt?=
 =?utf-8?B?NXROazlpSnc0MDFCaFRLZ3dkUWhiU3pNMDdsd1c5Qm1XMjd4aEZ4YjlHN21G?=
 =?utf-8?B?MUdoL0t5NXA1MXRHNmxGQ25xRXBaTFpKd0RWamFzWGJ2QWgvVkdINENYWm5m?=
 =?utf-8?B?ZVkxMmRqQTNEMXBLY01oTG5sWUU3VzhUL2NtNjNTMUYzK0ZvY0ZJZ1pOK2J3?=
 =?utf-8?B?d1Bzb3A2SHZtMWlNakVwWVY2b2ZJWlBDc0NxbERUVWR1MnhPbmRYL3Nkb0R2?=
 =?utf-8?B?S21YeSsrQ2NIT3oxd0pPdjRoeEI0T0ZRNGJUM3Q0YS9vTlZqTzRMbk5uZlI3?=
 =?utf-8?B?QUVmTkpnOE9JQzdydDNSd1pRcFhWMDFDV01WMGZGVVFmMWpyZ1dvbk5KTm1a?=
 =?utf-8?B?TTBQdVczbVlsVUpjVGphMGdUbS9LUk5JYTErR01UV0dkcG1UWlNrQ1pZZnJv?=
 =?utf-8?Q?EAgwxq/QIFhp/erXt9+Muthyavx4VC0i?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmhFTVc0bmlmRm5kQ1RkdXJNK1JTYjVLeGdCL2pTcTVmTDVDYzUrTklxWTVB?=
 =?utf-8?B?MC9KR0NBVzVPTUJSZy8wbW1EdFY4Z3piNUFyODVMTjE5NjFwY0tvQ2tFdVhT?=
 =?utf-8?B?aXorSktQMklSU044VGVNSTVqYjhTTTdVaXNTNmlvdHQ5aERlOEExSU5uWmpZ?=
 =?utf-8?B?QVZ5ZlFKYVY5cmUwU0tDSUhraWxqenJlaUJwMTFULzlVUWs1a0g1UEErRmF5?=
 =?utf-8?B?Y3YrMFdTaE0wVDdXbnVzbC9COEdsUFZIU1d4UzNYa3RhVjFCZmhsUnVRY1ly?=
 =?utf-8?B?cGJTYTlXYU1VZlRwSWpIb1pvMDZ6NVgvRDZBdUdKVFdPbmpYa3ZjS1JKSSto?=
 =?utf-8?B?c0VJWHNYd1BtaThDUTRHQXRvdnB0dE5MR0JvMVIyTFlWRXY0MVZDVnBOZHFn?=
 =?utf-8?B?STFkRzVvWkxQVHA1UjllR09IanVrbHlSWUx3ejgrTW96ek5wUGYyU3paY0xV?=
 =?utf-8?B?MUQwVHl2ZkxwWTlicHZFbDNGUlRoZ3BTQTdCYkQyYjJ1M1oxNzVYWENUNElO?=
 =?utf-8?B?RjVIVTRnSFhFdittcmV2dGxsb2FQZHBSQkJSS0w5QkkxTkhKTlRtaU5JbmRX?=
 =?utf-8?B?N1NkV0lTNzI0TFhqUTVZTE1qaUExZHVBbVRTUlVFZkJMSnlNdnY1L0VKQUdw?=
 =?utf-8?B?bmZhcE5zSkFSYW85cVVKRzRubnREaXB3ZGVLSlV6Yzk3QkJtaGpYTXRNVzhN?=
 =?utf-8?B?VlF0aXdJY3Z4V050WW5vbnVYRVhraU5wczdPajVqWTJTZW9FczUvY3Q1eUlt?=
 =?utf-8?B?T2htSDh3bFRIT0UxYmZEWkIwVmlNVGEzY0dZRTdTTnJGbzZoWmRIam1Zc3E3?=
 =?utf-8?B?Q1g1ZkNaQUhTQW5xR1dzQTU3YjlYU1RVOEl5Vkp0aExubmhDTlluQnhWV2xX?=
 =?utf-8?B?SHFMSkRpZDJWVUpjRUJySTRMMEhERENRSEkvMkFKSWg1aHA0Q1hXWDAvQy9v?=
 =?utf-8?B?Q0lsK0UwTnc0SVAxeDR6Z1V0alZIMGl5ZWFaR0htUTRSZVR0NVl4bWRtNFda?=
 =?utf-8?B?TzZoSGo2UmJYaDZIS2hLNUV3MGV1bktGdzByZHU2aUU5RFhVdGgybjRCVWVk?=
 =?utf-8?B?MWhUUUhjbDRxRFZvbVc1MVdWWE9KOVlTMDFzL1FFNEptek5BQ2FseDY4MmFu?=
 =?utf-8?B?NmROMEdBSlZiY2FLSU51V2FoSUdSVldJMitwVVlEUGVaU2tYNTdMZnAyTnFH?=
 =?utf-8?B?N3lxWTRSeXZiQVZMRG5KMDFZYlZENDIvNUpicFh2eE14QzZWWHRpa2diQndJ?=
 =?utf-8?B?SlY2Z25zYUd1NThZUUsxcFRxOTBmWTJvVUJuU1N5L0xmRXNVdXhKaWJudUZS?=
 =?utf-8?B?SmExNGJvd0NTVTd2RHpCQ0UxdWpYNmxYdHE2L1QrV0N2OG9WaWRTd0NackFw?=
 =?utf-8?B?VmlmLzBKTXhaaUZPMTBJSXBPVGx1eTZVKzlnNlp3NHBXVlg0cTdJVXM2SzJo?=
 =?utf-8?B?L1ZkZVVGY1MwUEJjTzhoL1plZWxacE9uZ1hBclNjMDAwaUZKRVFiMDZjYTZV?=
 =?utf-8?B?QTNJRGprNEZ4MDBZWUVGY2w2K1J3TStZVnFwaUVvTGdnMER2eGhHWWs2M2Iw?=
 =?utf-8?B?NUl0Z1pPVTYwWGl5S3pnUURaYmtBaE9VMWpOQWRmd0hyWmp5US9xTWJEbmpm?=
 =?utf-8?B?Ykh1bGtZampGYXFOSkNSM042ckU5Zy9oVVBjSlRyOG1PelFObTJpejRIMXZD?=
 =?utf-8?B?eDRjTVlvUm5VaWlZOWlUZjU1WjFhV0xmU2QvSDlJRVJiR0lVZExCYy9XWkl1?=
 =?utf-8?B?YnRXUldGQ1doVTR5R0I0L3dYanpSVTBYN3pEMHF6ZDExa2hpV3N2MnIyYWNa?=
 =?utf-8?B?OHArN28xSGlaa09ONTJNSi9xZEUzNHlxckMyaENESHRLT0xBU0gxcE9ab1ZU?=
 =?utf-8?B?eFE5YnBZRlFxOTJoc1FCbVVoN1VDRTVON0lDMU1EZ1VYSVlIRTZpVXVIRzNB?=
 =?utf-8?B?ajNraFdpeFo2Z1J5Si9uWjA5TlVVbDBhaHcrVnlnbGpySE5KQ0JxdlowVlRP?=
 =?utf-8?B?bHo5cTBSMkZsWWxCNmFPVGtzNzZlUmVUbjJ1ZUdqeGRnUXJUaHlja0V1dTln?=
 =?utf-8?B?cVphQ1JoTEQ2Um5BT2tWdVN0bVBpUjJBY3ZTUXpHSFNjYkFNL1Y3Ums0QW5Q?=
 =?utf-8?B?NVVPUkxrTVUyVTZsYWxZT2hGU0RsSFJXSGxpOWZZTGVNRG1Tbys4OFY2Z3pF?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 614170fa-0cca-40e4-82ec-08de26252212
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 22:03:26.2631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NidB06OqALpdGYYHyR2sySHh56niIk2lj7JDjRR9t8aphXUom8pSvqtfaxkGhu18cYBpy+xQ5rBiOtU1q4hSYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5115
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

Quoting Matt Roper (2025-11-14 18:43:37-03:00)
>Since forcewake uses a reference counting get/put model, there are many
>places where we need to be careful to drop the forcewake reference when
>bailing out of a function early on an error path.  Add scope-based
>cleanup options that can be used in place of explicit get/put to help
>prevent mistakes in this area.
>
>Examples:
>
>   CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>
>       Obtain forcewake on the XE_FW_GT domain and hold it until the
>       end of the current block.  The wakeref will be dropped
>       automatically when the current scope is exited by any means
>       (return, break, reaching the end of the block, etc.).
>
>   xe_with_force_wake(fw_ref, gt_to_fw(ss->gt), XE_FORCEWAKE_ALL) {
>        ...
>   }
>
>       Hold all forcewake domains for the following block.  As with the
>       CLASS usage, forcewake will be dropped automatically when the
>       block is exited by any means.
>
>Use of these cleanup helpers should allow us to remove some ugly
>goto-based error handling and help avoid mistakes in functions with lots
>of early error exits.
>
>An 'xe_force_wake_release_only' class is also added for cases where a
>forcewake reference is passed in from another function and the current
>function is responsible for releasing it in every flow and error path.
>
>v2:
> - Create a separate constructor that just wraps xe_force_wake_get for
>   use in the class.  This eliminates the need to update the signature
>   of xe_force_wake_get().  (Michal)
>
>v3:
> - Wrap xe_with_force_wake's 'done' marker in __UNIQUE_ID.  (Gustavo)
> - Add a note to xe_force_wake_get()'s kerneldoc explaining that
>   scope-based cleanup is preferred when possible.  (Gustavo)
> - Add an xe_force_wake_release_only class.  (Gustavo)
>
>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_force_wake.c |  7 ++++++
> drivers/gpu/drm/xe/xe_force_wake.h | 40 ++++++++++++++++++++++++++++++
> 2 files changed, 47 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_fo=
rce_wake.c
>index c59a9b330697..76e054f314ee 100644
>--- a/drivers/gpu/drm/xe/xe_force_wake.c
>+++ b/drivers/gpu/drm/xe/xe_force_wake.c
>@@ -166,6 +166,13 @@ static int domain_sleep_wait(struct xe_gt *gt,
>  * xe_force_wake_ref_has_domain() function. Caller must call
>  * xe_force_wake_put() function to decrease incremented refcounts.
>  *
>+ * When possible, scope-based forcewake (through CLASS(xe_force_wake, ...=
) or
>+ * xe_with_force_wake()) should be used instead of direct calls to this
>+ * function.  Direct usage of get/put should only be used when the functi=
on
>+ * has goto-based flows that can interfere with scope-based cleanup, or w=
hen
>+ * the lifetime of the forcewake reference does not match a specific scop=
e
>+ * (e.g., forcewake obtained in one function and released in a different =
one).
>+ *
>  * Return: opaque reference to woken domains or zero if none of requested
>  * domains were awake.
>  */
>diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_fo=
rce_wake.h
>index 0e3e84bfa51c..ffc4e103fe31 100644
>--- a/drivers/gpu/drm/xe/xe_force_wake.h
>+++ b/drivers/gpu/drm/xe/xe_force_wake.h
>@@ -61,4 +61,44 @@ xe_force_wake_ref_has_domain(unsigned int fw_ref, enum =
xe_force_wake_domains dom
>         return fw_ref & domain;
> }
>=20
>+struct xe_force_wake_ref {
>+        struct xe_force_wake *fw;
>+        unsigned int domains;
>+};
>+
>+static struct xe_force_wake_ref
>+xe_force_wake_constructor(struct xe_force_wake *fw, unsigned int domains)
>+{
>+        struct xe_force_wake_ref fw_ref =3D { .fw =3D fw };
>+
>+        fw_ref.domains =3D xe_force_wake_get(fw, domains);
>+
>+        return fw_ref;
>+}
>+
>+DEFINE_CLASS(xe_force_wake, struct xe_force_wake_ref,
>+             xe_force_wake_put(_T.fw, _T.domains),
>+             xe_force_wake_constructor(fw, domains),
>+             struct xe_force_wake *fw, unsigned int domains);
>+
>+/*
>+ * Scoped helper for the forcewake class, using the same trick as scoped_=
guard()
>+ * to bind the lifetime to the next statement/block.
>+ */
>+#define __xe_with_force_wake(ref, fw, domains, done) \
>+        for (CLASS(xe_force_wake, ref)(fw, domains), *(done) =3D NULL; \
>+             !(done); (done) =3D (void *)1)
>+
>+#define xe_with_force_wake(ref, fw, domains) \
>+        __xe_with_force_wake(ref, fw, domains, __UNIQUE_ID(done))
>+
>+/*
>+ * Used when xe_force_wake_constructor() has already been called by anoth=
er
>+ * function and the current function is responsible for releasing the for=
cewake
>+ * reference in all possible cases and error paths.
>+ */
>+DEFINE_CLASS(xe_force_wake_release_only, struct xe_force_wake_ref,
>+             xe_force_wake_put(_T.fw, _T.domains), fw_ref,
>+             struct xe_force_wake_ref fw_ref);
>+
> #endif
>--=20
>2.51.1
>
