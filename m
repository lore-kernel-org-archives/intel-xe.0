Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EC1D4335B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 22:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCD710E304;
	Thu, 11 Dec 2025 22:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LyHIMU53";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D196A10E304
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 22:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765492511; x=1797028511;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=44ynY+udPABsnk1CP69aJMwWEFmd8KSk30mR/LgIoYE=;
 b=LyHIMU53BD2z26vKRaVzs6fBJ3dn46aorqr6WesnyTWQ2x2nrIMyGOO0
 rhLLeaRjL695hPK9Ua3zDgFxIwm2GURDemy7uFA3hZLtGaYhBcYy6E/eY
 IxPDgVmozvKcqNAADtmOH3CzmiWRk1EdiKAQDElUGz9UyhphjCxK0Zkl4
 vkHQSGT5T3yFQDafR6ClZQXdC2BsFtp0+hcJEwXVW+ZqNlywTjcay6yOr
 /grnIt9FahkEkNK+7z2P2Bu23NDSQSu/5MopHXsuQ4VO1cs0MUkXOu6i7
 pWMWhY0jp4t7cNV6l+3sCuaKS0dKMP8FLxKzwdHq841nbRHNH0CzxEJVL g==;
X-CSE-ConnectionGUID: Ee3Ui5HyT7CxjVYTX3YsQw==
X-CSE-MsgGUID: gQ6KEf7xRPOwcAhs6/cjpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="85093224"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="85093224"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 14:35:11 -0800
X-CSE-ConnectionGUID: unVqbxyGTQm8Z835lCt6Uw==
X-CSE-MsgGUID: LXxCqw6/RLCP8VJ0fKWqAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="201997818"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 14:35:10 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 14:35:09 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 14:35:09 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.22) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 14:35:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tAoZp0wFyEq82dNW46dZFOr2ZtPufMdZsC7pSu88hurdE04E9C7WTYRT9OzqsEzNC10KRCC7FhRQHYUvWeTfHoGIzEd1EgHg83FEU5ZewMjd9mlx1oE9vMTvCjRQ9l4NYK8R4hDJLMq+ZelOHqsKQe1B46deTKjEAHiZ4tbIcSpNZb4+U6ilWb7f42M5auT+hHp1J2sGpwmM+zpeIzCMfdiUhXJvcpQ0rHssFSwscKwUyfaI2NSE/qZw/PTUSOz70JHghm7Cbn7UxnCRpHWaIfQKOQtdHdPafngxqtWof5Uyx/c9xAsKXWESWlppmuUT7aGRDq5sp5oFh2yXKJc28w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ug89eG3VjGczVXmyzIjIcVH1b15V6dR2XUjrUWSfOpw=;
 b=vFzVqnCeW8pwWuvuWr6xQ85u53xHBiIxKwsyajQhBp8NVNrpSsw4H7A3AwdyfLEld7YZvwn97po6Z8i8GrnI5VcgWKas99lweTCpL/dTwatdPSh3g3jHcWuM7eazBgL6R+5oc5cA6VeUnGry+T6Y2MUylPcCu7hgYUtGcZ44x/vPShfj6KNypIn8IMtusr8RyOS9ged7usPxqIK2rN+ee4nhxzFgQvD668C++hm94ZKeyXz2JpJyLrp3Oei8B8R5LMIMfwGq94bcrjdMP/Vki1E1idjQz/46ABonxyGG5+pzVynTMvHBAXgIzvCWV3dPlZqjYIj7YiJpkTbdMR/r7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by PH3PPF3DE9570BE.namprd11.prod.outlook.com
 (2603:10b6:518:1::d18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 22:35:06 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::28e0:9ef7:24f0:c21b]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::28e0:9ef7:24f0:c21b%7]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 22:35:06 +0000
Date: Thu, 11 Dec 2025 14:35:04 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <lucas.demarchi@intel.com>, <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 05/12] drm/xe: Taint TLB invalidation seqno lock with
 GFP_KERNEL
Message-ID: <aTtHGEwT9nBk3AFX@msatwood-mobl>
References: <20251104195616.3339137-1-matthew.brost@intel.com>
 <20251104195616.3339137-6-matthew.brost@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251104195616.3339137-6-matthew.brost@intel.com>
X-ClientProxiedBy: MW4P221CA0025.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::30) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|PH3PPF3DE9570BE:EE_
X-MS-Office365-Filtering-Correlation-Id: 041480ed-cf6c-40ad-5c49-08de390588a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3dGZm9wQlgxREdjZDVtb0hEdnJjd2NEMHdMcTQvN3d5Uzhqc1BxeU9EaHQ2?=
 =?utf-8?B?WHNMNHZLU0VncTdQNWR1akhXdGFmOGdUa3JnK1I2bjlmUHowczFEYkJCeE93?=
 =?utf-8?B?c3QrcEVyVUl5anVtVE1sWHBVTlFXeUNrNDRGalY3cVM5OXdTZ1l1bmFlU1hn?=
 =?utf-8?B?NUpWVnE1TU00MHlRZ0ZQajFUaDhtV3NJS0FsaEl2MXRTQnZFRDRJcnNEV1VD?=
 =?utf-8?B?WVpHc09hQktZVzljdzNEclloOXBWUVhVZUJKVWtsSVhNYmxtY0d4Wjg0M0sw?=
 =?utf-8?B?R3V4SUduekorc29wUU9kYllsL1dQNTZTOWtFbHZPcjl3NXdJa0xIaWtHazVx?=
 =?utf-8?B?Ti9jTEFIWC90R29yRlRSYmhncnRQMm04RTJGUkJSQXpYSmovQmFpS2pWVGUw?=
 =?utf-8?B?elYvd0VsdlJBRmRvTjVMOHlnaWRoUEJkZWgrSXdpbEQyMjNvaFprVkdSQUNS?=
 =?utf-8?B?aDdmazRhcnhkcFZOVU4vM01BTjY2cWdHSUY4OTBXV29qZ0VUSEx6VndGcGl6?=
 =?utf-8?B?a3VRaWkvVGdJVmhNMWVpY1hYU1dUS3llRFJDQ0h1RFpsMHdKVEl2QmNOT1B6?=
 =?utf-8?B?R295T1FadlZvWGwxR1F4Z3BTR0szOXJQQUtXbU0zTERnNVlUZldxY3QzWnBk?=
 =?utf-8?B?aGcyT0RFalpURlQvbEdOZWhwMEs0K1FEdDMvWGZ5a2dWY0lqS29yQ3J3TUwz?=
 =?utf-8?B?MnRKeXhDRWdtaVVYSFVIQVA0RnFvN2UzajVCZXl1WWFDZzZCSldIbldiOHNE?=
 =?utf-8?B?SmpVZ2dBRWc4bDU4dUVnN3N4cWpzQStqQ3dBOWZhdmxvVFlieGFnYVNndnM5?=
 =?utf-8?B?OFZqVjczZjkvNGJGQ0lxbEVQWDBiWVN2WVYybFRPK3RaYTN1NlBxRzdFYjZV?=
 =?utf-8?B?dGdlSmh3TkdoUmZEc3JkRHpJWXVCbVM3ZmdlOHlNb1hvSlBxYUk1NDhraEhy?=
 =?utf-8?B?eEZ5Z2tNSmJ1c3p2Q0ZNVGp1bVdvK3Qxczk3UmRGMnE0VlpWSmNTaEtPQ3lG?=
 =?utf-8?B?aWROVENjdHNhUnpqUWVReWhKYm9sYzRkY2xPRHlEZDZ6VlgrUEp1Njh4N0ow?=
 =?utf-8?B?WWlRdUhXV1ZuTlNJT05SR09HWHdLTzdGWkFERUJadk5Ma3kya2VucUhibjV6?=
 =?utf-8?B?cTNKMUlaZVNhV0Q5ZkpyNXlJeGxKcXNFNUhyN094RDJON0hoVVRnTVR5V2xs?=
 =?utf-8?B?ODRoTW8yVHMxcnhLQ2FNSE9wQk1CZU9BSWxqZkc0OXFBMkp4ZTd6WWk2NHZQ?=
 =?utf-8?B?dFpnMTVWTnNXTE1YZHpIRlJzRk16aGtRZWtKRTZYK256VDI0ZTErZFB6bXFs?=
 =?utf-8?B?NlhIY2ZSZzdlSTltMHZxM2VlcU84c0lCRVZGTXBmYWVKd2lTeVI0cTkyaEho?=
 =?utf-8?B?dENWT0Fxc2dpS1BnZW9KeGRPWTFSbm5wM01vbTcrc01FNVBZTmVqSWhhQjhi?=
 =?utf-8?B?Tm1zSnZLUTFQMDdDSlNPeUZBK3p6UGZvb2J6MHFVWE9Mc1UwVUFVMTRlaTRN?=
 =?utf-8?B?R0E4cG0yMFVpRWlUZzYwSEJqbDBPWkp5NzdIdld3TGRrVVFvTEVTbXpFaDh0?=
 =?utf-8?B?MURKMFhBcklVNUdjbWJiM2ZOYnE5QUhsam5IUFl4a1NJWisxVno0WHY3bUYy?=
 =?utf-8?B?YWxpanF4Nm9KZ0h2UWdJN3hFYmN4TGphRDhIVjlhZms5VVZkMjBMVm5jZVNX?=
 =?utf-8?B?QXBVT3ZPY2FUUytJQmptR1dXVFJ4QVlZQ2dXMjJEMXJaS1lRd1FMblhNVEQy?=
 =?utf-8?B?NEs4aGdCVG9vNWszcG8yMkswaVB2NHpnbGhXMHNQcjhUWVFwTFlVTFJRQVBx?=
 =?utf-8?B?bkp2a01EVDFURmI4NmpUUlBselhrWldFYUFReCt3ZVlrMURva2hJQlR0dW1u?=
 =?utf-8?B?WndrNUNRT2dTblpDNXFBSTRrMjlHZEdRbkI1eFZ4VjMveU91a0w0SUFDNlgv?=
 =?utf-8?Q?liG89SHrv7bEyQ/wMq4EcGSdezzOxUhF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTR1NWlVa3Z5cG8yNHVwQ0JtRnhURFZOVHdLNUpXOGVBNk9mdGRSSm9SejVH?=
 =?utf-8?B?RmNYSjdkWU9TUU80THhtZnlGaG5ES0lJcHd3MFJGK0FXNWl1bjNENXBzSWtI?=
 =?utf-8?B?NmdodHJPRmZETXI2VERBbjNHNGNFWTA2MWVwYm9KT3ErQTdWc25LK3g1VUJJ?=
 =?utf-8?B?ZEYzZTB5aWs1MjZjc2kyaFNhcjU4aVozdlJxNkNYYnFvaFpHaVdyUFNyVkN5?=
 =?utf-8?B?U1h0Sk9DTU1JWk5OVDVNSWhLNmJ4MzBPV3kyQmI2SmNPZWo1VUFSMTRQSGRK?=
 =?utf-8?B?b21XNGdCK2xLdmt2dkkveXAvazhDQkRxcFlDV2d1NFN4SzRnL3ZaaTkzeU0x?=
 =?utf-8?B?NERHR2dCWVBHcC85bzJFY0VIS0pHRnZlNVpna3pCcEprc2pGM3psTXlRaVJL?=
 =?utf-8?B?anc3ZUtKQU1zS0lVNlRzSWpCYlhBWTk2NzZ4NDcrZmRBRitVdXI0UEZtSUpX?=
 =?utf-8?B?OUx2MWEzc0I4ejdLbUJtUTFtOW1Eemw1THZlSllLNmdLakZYd3RtZjdseUVT?=
 =?utf-8?B?TFRneThKanZWVzZnRFRTZlFqMUI1SjQ4NlZ3bGVrRkY0TTNYVEVOelFOSDR6?=
 =?utf-8?B?c1RqT25ZZUNyY3VIVEJveG1FaDAxMHRwVVRiV003ckYvNG9OZHhJS3hOMVA0?=
 =?utf-8?B?WEI4eEFOVmVETnZPdVNUQTFhRWptTFJjYzRPeUpjM3lrY2c4OUZadCtjajJ1?=
 =?utf-8?B?NW50RUtheGkxcVpDMUxVN2NUVy9TdVViZi9Jb1NYdFUrcG5rVnNkcHcvdjhS?=
 =?utf-8?B?eCtSb0VROHY2aER6S3FtMGRETUxZNHllcEs5MkJPRmpnN2tLazFDVFFURFVo?=
 =?utf-8?B?Z21MNjUwMm9oNU8zWjgxS2NMVXU0RVNWcWM2TFdUUTBCbC9pN1djU2tMV2tE?=
 =?utf-8?B?NENCMWJxY2s0ZmtOTXFXd1RsNnM2OGlEcENKSmQ5UTIybW1zTGhqRTRZa3ov?=
 =?utf-8?B?WTBIWUk4NkE5aTFJUXFaK3NDRHJSR2ptbngzcUtqSEZtVkk3SS9lMXVuWm12?=
 =?utf-8?B?STBrdERGSGtIMG5Kd1oybEFEY0ZPTkVMYkdBbjU5WkI5TW5YMGZrYzZ6d2xa?=
 =?utf-8?B?Rk5SS3RWM3FoeWhtQ0pNMGJQZEI1dXJiYkxlQXdHWWFKUnlIbmdMZXdtVzV2?=
 =?utf-8?B?cE5IUWZQZHQ0Mm9KOUpOUzFOaFNaeXdoVHIya2RyTDZUUEZuSHhlcGxiS3ZN?=
 =?utf-8?B?Y3RTT00waVNvWDNCb0pHU1ErQUpFN1dNSjFORFY2WWpUL0lMZ0JOSEMwWWlL?=
 =?utf-8?B?R3ZER1RFbk1rcCs3RXV6dFAxRWphUkFpOEYxaHJiUksvcUV3MG5vTWkvVk5E?=
 =?utf-8?B?V2ZndEZYeGp6eDVITHMxL1VzUHl1VGUwb0oyQTZRZzg5QVVyNkgrbFM3WDlX?=
 =?utf-8?B?SFhXSmkwemFiUkRTajh2N3lNRkNsNG5nbWxkQlJqMkM5dkZFMkZ6WVlRM2w1?=
 =?utf-8?B?eDF5OTRVcEZDYk52VmdLRDh2SGhWdnh5Y0VZOEphV3BoK0V4VWNEeGtneHVP?=
 =?utf-8?B?dFF2ZmwvdkZ6eGRLRFFsMlpKMEprRC9qWlEwL1VNQXZJSjNjNTZHWU5XVmEz?=
 =?utf-8?B?VUdWTU1FRFYrd0kydGdQdno4Z0NFYjJFVTdXUDdxWXIvK29pcmd5VEQ4dDNL?=
 =?utf-8?B?amcxdFhURUxGNzVBZHZVNVRFRFZPcW9BMWhzOEdVVWlwWTNwVVMxV3BqV1Fn?=
 =?utf-8?B?a3pkdG1hOTZ2Rk5jNElSUkF5SUg0MmNGYk5PQXlpaGJ5SnFwaHZLYlE5S2lw?=
 =?utf-8?B?TXN2VTJiV1VkUXFmb2tNRjJ0Q05XWUVncnZQYzdHWnhiSWJlcUlVMzgrUEt5?=
 =?utf-8?B?TlJRSHk1MEhINHZPRjMzVXI1bnRTTllYamU2cXZRSXd6ekJLKzg1WEVLRk9V?=
 =?utf-8?B?UjdCa1pRcVFqMXRTb2xDcm54VGpkUElnODFFbzQwMXZrRTcvN1lKd3h4bHdJ?=
 =?utf-8?B?b3FlLzV2eUJoeXRGaHVjc2FGRGtsMGVaRzY5aVB5ZFVhTTBxQ3kyRmhMWlVQ?=
 =?utf-8?B?eGQ5bnlkN1pkSnBLUnlCUExHUkQ4YVh4WUZyTStQTE9WV3NiYXVieURTbHhD?=
 =?utf-8?B?Q1llTXNoVDF2ODhPUXdOd1dXenpLcjVVK3ZxanJqVkQveXI4ZnpLMUM2NXZJ?=
 =?utf-8?B?RVArSW9kN3cyNFpsNkFhUFJZTnpEb1FhazBRem0wVnhUYXJKbm5WV2QxSk1a?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 041480ed-cf6c-40ad-5c49-08de390588a7
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 22:35:06.5574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fw61iXIsdsasHK6clEUfm6OwgVHw7mB/+9+eyM7jhldVygHmGVkAat6T8yUj0zmf8k1P0iwFrai0ZO9f4U0K9qTPsqDAIoF43XA4iZ4xtIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF3DE9570BE
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

On Tue, Nov 04, 2025 at 11:56:09AM -0800, Matthew Brost wrote:
> Taint TLB invalidation seqno lock with GFP_KERNEL as TLB invalidations
> can be in the path of reclaim (e.g., MMU notifiers).
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_tlb_inval.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
> index 918a59e686ea..7ee081b94f90 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> @@ -114,6 +114,16 @@ static void tlb_inval_fini(struct drm_device *drm, void *arg)
>  	xe_tlb_inval_reset(tlb_inval);
>  }
>  
> +static void primelockdep(struct xe_tlb_inval *tlb_inval)
> +{
> +	if (!IS_ENABLED(CONFIG_LOCKDEP))
> +		return;
> +
> +	fs_reclaim_acquire(GFP_KERNEL);
> +	might_lock(&tlb_inval->seqno_lock);
> +	fs_reclaim_release(GFP_KERNEL);
> +}
> +
>  /**
>   * xe_gt_tlb_inval_init - Initialize TLB invalidation state
>   * @gt: GT structure
> @@ -140,6 +150,8 @@ int xe_gt_tlb_inval_init_early(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> +	primelockdep(tlb_inval);
> +
>  	tlb_inval->job_wq = drmm_alloc_ordered_workqueue(&xe->drm,
>  							 "gt-tbl-inval-job-wq",
>  							 WQ_MEM_RECLAIM);
> -- 
> 2.34.1
> 
