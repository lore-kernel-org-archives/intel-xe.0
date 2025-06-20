Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94599C7115C
	for <intel-xe@archiver.kernel.org>; Fri, 20 Jun 2025 16:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D1C10E117;
	Fri, 20 Jun 2025 16:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SApjks5+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8319C10E117
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Jun 2025 16:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750436624; x=1781972624;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rKgjHMH2C449Fot8LcWMqWFawfaX2IZimmR/jqoWNJs=;
 b=SApjks5+DyUlzYN8FPxiF1yhUu8guAiNt+42ztWOxBRG1CsSF3YPcq4e
 2by3XOZijEKG6sTTL5j6I7KtLSVMz5MFublUq5PkOQds9P9yaZVFMNxJk
 RWlDT0yuLwm503thvTRJCx46rZMmD08Dsk3Sop9If/ZYwmbExR4u1f1tL
 Np5a/D0LA0Er9OatKmulcPaPjB9Z3Bp9+G0MbWHEhV8NBiZH430w23oYr
 ybBPW7ptmZ9lVORC0QixNImpyvcbeSi9spA/uZXbsX9GIku2aZPRchix4
 UhhJMjLE9s7YAAsVwwvRRPpYtOo8c/qGtM1j4qTL7MTISuo0ZOwP0ail+ g==;
X-CSE-ConnectionGUID: x6Adjo0kSj6c3tlYDpKPZw==
X-CSE-MsgGUID: ExyvMQRlT6K26Z5jXpDxJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63756602"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="63756602"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 09:23:44 -0700
X-CSE-ConnectionGUID: duKgLHCET161UZtZ/VOS6A==
X-CSE-MsgGUID: GdfeVVjlQEajAFGpv+RbUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="150442011"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 09:23:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 09:23:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 20 Jun 2025 09:23:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.86)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 09:23:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kwz3ynyQ8xsquEaIQpH8lO2uRATf+W87ZDJP0hbnTyvQUsebiEcIA+7t+LauWd34mrGieaJAY7sfaJP8ccKOF0akZwsTUf1WhtTFRCruBZ01GOG+JOHf2NF1Tql312lpXuYSQQo/asAfk1L0011yFwgroOsHXbNFStwBXA+Vvr4FFgRUwx3NWIgYnfKDo6gCIMZkJ3a2xPRXMsx7voN+oKYYZ1U2jl1W1fNO3yDBidgGmC4bvnSbLCWWstoGrq2/gigHSL8HO8ie9wSR1sB47J0Nx9mGaJCuDBoHcUjqmSbxcO7IWpvi8ZeobVSf0qY1ErNx+rPNUuoRtW8B5af7gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjdCln3jsF08rifWKvyRq3W1fZtfwyOxl+rbiZNAOlQ=;
 b=kDdtZ2nSwNWwoEj6sHDhdFN7VMVYeGc9ECLZTZCVoGDJRzH/v095FJZVsZswO5hSzyvupIF3IV155BdzLtVIyD4ymR9ib7bvxawxgf5gCNs3VdMEZh2mb5u9PdR2lVackTQjeYX2eLB8U8WiDrey1mPlvWjOM9gUt/R6GGLnbUwloxKrELeW6Vv7NnYvSFcbR4tgQ+wbduDGwye284GemLJptYO0kKj2Q4Ut8OjeENrPGMftjX+5iKpKf8uJ2Qu2Zrl4yUEysF8u/T3RUyXjJqjbq0AFbDfIcOaus3HycHvyMIkMn91V0ZbntjK7NPoVXQzN12ZsTu4kqUva18xwlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH3PPFEEDD586DA.namprd11.prod.outlook.com (2603:10b6:518:1::d5e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Fri, 20 Jun
 2025 16:23:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Fri, 20 Jun 2025
 16:23:40 +0000
Date: Fri, 20 Jun 2025 09:25:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>
Subject: Re: [PATCH v8 2/3] drm/xe/vf: Attach and detach CCS copy commands
 with BO
Message-ID: <aFWLbiiMQ8ZnIL2x@lstrano-desk.jf.intel.com>
References: <20250619080459.27731-1-satyanarayana.k.v.p@intel.com>
 <20250619080459.27731-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250619080459.27731-3-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR03CA0168.namprd03.prod.outlook.com
 (2603:10b6:303:8d::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH3PPFEEDD586DA:EE_
X-MS-Office365-Filtering-Correlation-Id: 112023b7-0640-48dd-a036-08ddb016d133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEJhY1FmZWM1ekNCMnRJa3BVNi9kRXNjV29rd043VlJWRXdTaEZlYkcxWHBT?=
 =?utf-8?B?dFZTRlZwOS9PVGd6RzdnWXhaMFRwT0ZKY2g1VUZseGR4WU5MNDNRNmpWUEU1?=
 =?utf-8?B?SWdiRUpwZVpLWnc4UXhrT3NCckFYY3hkNlZZY2pWRGdvZGtieDIxaXVtMHpX?=
 =?utf-8?B?V0FMSTJvV2QvM3YxTkgvWXJNTlJuSGFkYUQrOGxZUng1OEVzQjNvZ3BpMUZo?=
 =?utf-8?B?Q1V2bjJxUGpjUEZqZS9RQWZUYk5GcFhENGEvNXUzTENhMUtHWmM0ekc4b3B4?=
 =?utf-8?B?eXVTMGdaMnZpR093c3owWng0N0hGZTZkWTRrZUFBazFsUjlTNEt6Q1dUSzND?=
 =?utf-8?B?MmsvakVpdmM5TUV2WVRYNkdBWkJDaTFNTkZaZmZzeXNLblV6MWZvYUNyOW4x?=
 =?utf-8?B?NzlRR1RMcHd1T1RFYXl5UkxaVno5NWQ4K1RUb21yODFtYUNlRWIxRnUvUHNk?=
 =?utf-8?B?RnpTUnhhRStHMWE1YWk0amNrb1lXTzVkemNTN1Z0V0tXQmRyZEVOVnJ1V1VI?=
 =?utf-8?B?cEMvanNxNzVhdy8xQWk5WUZmN2s2cFo3U3dHVFNHMWc3d2pDYzV3UitOeTBU?=
 =?utf-8?B?S1FNZWJ6amV4dGRLK2Q4SXdTUkFIWWFicWJhdVYyRFdzWndSeVViWDN4QTlk?=
 =?utf-8?B?OHdSNlRUZW5sdVNqbElZQ055UVYzUkdjSXlZRXN2dktCYkdiaHJFWkttUGdm?=
 =?utf-8?B?aWJ0RnU5TVV0MjY2MDJWTXZWUml1NGtOWko2a2F6L21FcEVUSmlId3VEbHhC?=
 =?utf-8?B?R01QU2V6a0hkRTduRldxbWMvYzgzMWRFVnY3ZTBXR2phUUpkcCtub1Yxc0pz?=
 =?utf-8?B?Q1RaNUpHSjNGdDRSaUR6dHBjdnBHN1dWRTQ4SHZVOXpBWnFTVlVTNEFNTURN?=
 =?utf-8?B?QzZBbXdhRDhMdDRjRVQ1cFlYeENaT3dkRUc4bis0ckhaTlpYNEdqM1k5TWM5?=
 =?utf-8?B?THpQZWtFNjJDaElmNmRnWFVYTXVwT0tNM3g3NTNqWS94b3Q4dGRabUlPUHdJ?=
 =?utf-8?B?RHpTNm5xdUtDV0ZTZWhjU2MzNCtsRnJSbURqY2ZXejJWU3prSDNKMS8rTElX?=
 =?utf-8?B?UFgvandhdnlHY2FjVnRXczNvNXJvRjNucXloWGZ6V3l1bSs1Wmp1YllkNDBE?=
 =?utf-8?B?QktibTYwNndjdFJ4Y3Fhcjc5NUgxUi9nbXRET3pCQ1o4RjBGc3grcm9Gcjkw?=
 =?utf-8?B?R3VPRS9wdVVUdklCaGdiYUh4bEl0VE81blN2MHR5T3Z5MUxQNlZMQ1NENm1G?=
 =?utf-8?B?UXdqdkFreGloWTI3c1d3VlI5US9MZFBWL3BZVUJwVTFCaHd4ei9KRHc1UVNV?=
 =?utf-8?B?bEl1OUtveTMvbW00dWd5TXB6Q1lPVEczT2FwU1NXWXRIai9iNlBPWExNcGpv?=
 =?utf-8?B?R3JiQUtjbW9DaGtPOElUOEF0dHI0Qm9PMkR6bklia1lXWXhFamJ6aUpkVExK?=
 =?utf-8?B?Tzh4ZUhuTEZtU0xScWtGemdGaEsraUMvZVNUK2dWSkNia0hFQ0ZIOTZCMjFJ?=
 =?utf-8?B?OGQ1Wkl4b0pvTThYdk5TcWg2MmluOTA1NkVDU2Y2dXRtWVFUWHJ3ZGpxQXVK?=
 =?utf-8?B?dXJXeFIwUERYSmtwaDZnUWg0UkwxOWxEbVZlNzlGUm1qQ3gweFBjSFBZZi8r?=
 =?utf-8?B?azhJMlFqYmFXL0VZYkJrRnMvcjBHMzZYb0NKOSs1WGlnNlJhSVlLcG8rVEFp?=
 =?utf-8?B?NllFaXRJQzNGZ1R5N0Y5d25SRmRjbFhaR21qMnZhMTdxWWZ0SFZWRHVWeVM3?=
 =?utf-8?B?Mjd4elh1Y3NwMkhOZHF6dUx2T01wL0J6R3lUaE5rR1A5TFlHQXpvL2dtZTBn?=
 =?utf-8?B?b2NZZXpmTjJidXY0c3BUaExkNFpZYzhNNWtiTzdjSjBINkdndjJuZTJZY3Y0?=
 =?utf-8?B?Vk9XdnVVeWZFaTdXUm1ZTUJUS2pKUXEyQVFiN0Z5N1U2dFFpZE9ybjVXWk53?=
 =?utf-8?Q?0gtPwYJxrZY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3crVnFPb0QrZGI0TjZVUXJUMnY3a0VJVXJwRXJQdnJ0aHoveGxzUm1EUzNR?=
 =?utf-8?B?eWhSUStmMmxkMEpLM0FGM3R4SGY5MmhyN2NZcmcra0VwSERHQUxXZnZmTExB?=
 =?utf-8?B?RUlMN2t3TGFvOFB6RlhHM1Y0RE5MSVdXaTZZYy9hZnArU284d01iaGVRZnUx?=
 =?utf-8?B?QWFDVUVXc3pwU3RSMUxpdURMdGt6SHdhMFAxOFo5b2o2WVJjS2llbXFWZmdE?=
 =?utf-8?B?cnJsWXVXS0NLS2U3QXZJWkVaeElMVUVuYXB5NTR5VS9zU1dISnJVTGkwdXN1?=
 =?utf-8?B?dGJ3dzRrbk4vMGtjeUltb2huQVNQb2FvQ2xSaTdqTmhhSWZqYjdaQ1B1U0l1?=
 =?utf-8?B?ZmJTTWVwaW54dGw1eUkrd0JIZVFnMTJlb0NPSlc5Y1NyOHdFYWdSd2NIREl4?=
 =?utf-8?B?OVg4Z0crbXF4RHR5NUovcjREa3MrdXZVY2JuL01lRW9vNDRpcDRobElORDFl?=
 =?utf-8?B?QWo2NzIwbE9Cd295SzB6YmZtbnNjdFlERDhFaktWQm42WWhZWGw0eFprWHVY?=
 =?utf-8?B?SUNkVVUzMFlhOTBDbmVKWGszNnBoaXNhSjRxOE9mZXFPSnNPRWNsWGNDZDJJ?=
 =?utf-8?B?MWRHVnl5TkV5VEc5OWtDWVM4Q1lEeU5xd1VYTjAxYWxFVEptVld2NmdBUkNS?=
 =?utf-8?B?djlodkpLNEd2cmIvWjdTT0RNdGMzcVppV05RekNjOG1vUUdBV092YWZRekhk?=
 =?utf-8?B?dnlzdXpzOFoxamwybmFmQktZRnJ6ellqRGdKZFRiZ1NMUnBVMjJXa3hwV1NK?=
 =?utf-8?B?MUlQL1lIdnVSdWh2S1Y2Rlhhc3JzbFhYcm4vdXhBY3hCVlQwa2VyQklNRllM?=
 =?utf-8?B?cktEWit6V0RhMjQvQ1VqMytFaG5raTdGSU5PcGFVZHFpSHZ4c0x0UnFJREhq?=
 =?utf-8?B?a3oyOHprWERwNVE4K0ludnQrOFFsUGRmaWtuU3dUZ0F2WWgxeDBpWmRoeUNN?=
 =?utf-8?B?RWtNbTZtd05Dd3RXa0NoQ0JwcjFEWlZwRFNGM0MrTmR5N1hJSlBCdzVFSHRl?=
 =?utf-8?B?VFZTMldqbmM5eVlEZ1Y4TkVheVBQQ2kyZlhiM3A2N2dXUTBUOExJWDBTRTBn?=
 =?utf-8?B?K2VQdHNUVnhuS0dqUjkxSXVHdFBnMVE0R0pXajhCcEVOaXgxblEvTUNSRDhL?=
 =?utf-8?B?NDNIdmcrSkc0bVBJa0IwNlFidkVMZWxPSTRSTytMWlB4dk5NaG9iUUNYY0Fy?=
 =?utf-8?B?S2RsYW0rWnJYNTBzYzdrenlaRyszVjkrWDNINzc5bTZjN2dxZ050MCtiQ0Vu?=
 =?utf-8?B?WUE2TWVBakpBRTZTYUJXbmtHRmZja0NCcmZSTTU3eGMzVVN1ajlrdEI3RTV2?=
 =?utf-8?B?M2RZVXAwWWh6WDA4bFljb3M3WURzSTBiajBYMEVsdmRtdThiODVZZm1XZVFl?=
 =?utf-8?B?M2FXSjFzOHB4ZWlBVmkreGYxQzJFczFmSklOTGlKRkdaMk0rWVJiSkxneG95?=
 =?utf-8?B?azRaYjE0amI5Y3M0NVhISjJsWTYzRUx5bmZ4UW15UXpudCtVNmxicE9CNmFF?=
 =?utf-8?B?OWt3NDNiMS91cmtKaGg4U2VDdDBzOGVSOXEyek9zN0dDbXF4cXZoblRnU2Fz?=
 =?utf-8?B?RTFzZ0s2YnYwckxUMUxpM3NxUXVRTDZqT1loYjZLUTR3ZlEyR0NLbGdQVDYw?=
 =?utf-8?B?SW1aU0F6cDNWS2FFNlBjNlVQTFBCbnQ4aFBVZVV4VUJYNmdIL1hVUWdkaXIx?=
 =?utf-8?B?T1RCZEJyL1BJaTZrOW1CeWFiOXRaZUhYUGM0SmkvODJEZ21LY2t5LzRZQkRL?=
 =?utf-8?B?MzVFVCtYVHcvNUNrZHZhcU5qMzJnaWluR2ZXNGtGeklOQldLS3NjQk9aa0tN?=
 =?utf-8?B?K3dPNC9ERnBlbXkvcTFON1B0YS8rdVNFb0I3OHFtT1hQSitlQVFuSE12bnBu?=
 =?utf-8?B?QkhaTHB2NTBabXBvOFpEQkk0VG51bEJkMUtNWGVlSXJIblphbjk2dHdZQ0ts?=
 =?utf-8?B?WVJBSkJLaDIxQmpER0kwb2Y4cWVFN1g3QXp6SVdZWEo0SmVKeHhia3B1WXN0?=
 =?utf-8?B?OVB0SnpLYi9xVUttdkEvRzlhZUlZeENwcVN0MEZscVV0eTBRTlB6eEJxelBp?=
 =?utf-8?B?OCtGOERSdVhKbEFPakJZRHVYdVNOYlBSTUdTWlR3R1hZcjVwcVVrRHBhYWtY?=
 =?utf-8?B?bTNTa3BkUFFiaXlCNXNrOWNlcm5kYktYdytnYzNHTFBxbzhtSGNBWkxxTDJJ?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 112023b7-0640-48dd-a036-08ddb016d133
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 16:23:40.6104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GvzqghstYOspsNp9cWzzNKQDScujxOr5q1Zq6NUW2uEMCZnuT0PsiX0B1Smp3lGGKojU9XfoTZPV43sDI41UEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFEEDD586DA
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

On Thu, Jun 19, 2025 at 01:34:58PM +0530, Satyanarayana K V P wrote:
> Attach CCS read/write copy commands to BO for old and new mem types as
> NULL -> tt or system -> tt.
> Detach the CCS read/write copy commands from BO while deleting ttm bo
> from xe_ttm_bo_delete_mem_notify().
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> ---
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> 
> V7 -> V8:
> - Removed xe_bb_ccs_realloc() and created a single BB by calculating the
> BB size first and then emitting the commands. (Matthew Brost)
> - Added xe_assert() if BB is not NULL in xe_sriov_vf_ccs_attach_bo().
> 
> V6 -> V7:
> - Created xe_bb_ccs_realloc() to create a single BB instead of maintaining
> a list. (Matthew Brost)
> 
> V5 -> V6:
> - Removed dead code from xe_migrate_ccs_rw_copy() function. (Matthew Brost)
> 
> V4 -> V5:
> - Create a list of BBs for the given BO and fixed memory leak while
> detaching BOs. (Matthew Brost).
> - Fixed review comments (Matthew Brost & Matthew Auld).
> - Yet to cleanup xe_migrate_ccs_rw_copy() function.
> 
> V3 -> V4:
> - Fixed issues reported by patchworks.
> 
> V2 -> V3:
> - Attach and detach functions check for IS_VF_CCS_READY().
> 
> V1 -> V2:
> - Fixed review comments.
> ---
>  drivers/gpu/drm/xe/xe_bb.c                 |  35 ++++++
>  drivers/gpu/drm/xe/xe_bb.h                 |   3 +
>  drivers/gpu/drm/xe/xe_bo.c                 |  23 ++++
>  drivers/gpu/drm/xe/xe_bo_types.h           |   3 +
>  drivers/gpu/drm/xe/xe_migrate.c            | 130 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_migrate.h            |   6 +
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       |  72 ++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |   3 +
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |   8 ++
>  9 files changed, 283 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index 9570672fce33..533352dc892f 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -60,6 +60,41 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
>  	return ERR_PTR(err);
>  }
>  
> +struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> +			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
> +{
> +	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_sa_manager *bb_pool;
> +	int err;
> +
> +	if (!bb)
> +		return ERR_PTR(-ENOMEM);
> +	/*
> +	 * We need to allocate space for the requested number of dwords &
> +	 * one additional MI_BATCH_BUFFER_END dword. Since the whole SA
> +	 * is submitted to HW, we need to make sure that the last instruction
> +	 * is not over written when the last chunk of SA is allocated for BB.
> +	 * So, this extra DW acts as a guard here.
> +	 */
> +
> +	bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
> +	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
> +
> +	if (IS_ERR(bb->bo)) {
> +		err = PTR_ERR(bb->bo);
> +		goto err;
> +	}
> +
> +	bb->cs = xe_sa_bo_cpu_addr(bb->bo);
> +	bb->len = 0;
> +
> +	return bb;
> +err:
> +	kfree(bb);
> +	return ERR_PTR(err);
> +}
> +
>  static struct xe_sched_job *
>  __xe_bb_create_job(struct xe_exec_queue *q, struct xe_bb *bb, u64 *addr)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
> index fafacd73dcc3..32c9c4c5d2be 100644
> --- a/drivers/gpu/drm/xe/xe_bb.h
> +++ b/drivers/gpu/drm/xe/xe_bb.h
> @@ -13,8 +13,11 @@ struct dma_fence;
>  struct xe_gt;
>  struct xe_exec_queue;
>  struct xe_sched_job;
> +enum xe_sriov_vf_ccs_rw_ctxs;
>  
>  struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 size, bool usm);
> +struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> +			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
>  struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
>  				      struct xe_bb *bb);
>  struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 4e39188a021a..beaf8544bf08 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -31,6 +31,7 @@
>  #include "xe_pxp.h"
>  #include "xe_res_cursor.h"
>  #include "xe_shrinker.h"
> +#include "xe_sriov_vf_ccs.h"
>  #include "xe_trace_bo.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_vm.h"
> @@ -947,6 +948,20 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	dma_fence_put(fence);
>  	xe_pm_runtime_put(xe);
>  
> +	/*
> +	 * CCS meta data is migrated from TT -> SMEM. So, let us detach the
> +	 * BBs from BO as it is no longer needed.
> +	 */
> +	if (IS_VF_CCS_BB_VALID(xe, bo) && old_mem_type == XE_PL_TT &&
> +	    new_mem->mem_type == XE_PL_SYSTEM)
> +		xe_sriov_vf_ccs_detach_bo(bo);
> +
> +	if (IS_SRIOV_VF(xe) &&
> +	    ((move_lacks_source && new_mem->mem_type == XE_PL_TT) ||
> +	     (old_mem_type == XE_PL_SYSTEM && new_mem->mem_type == XE_PL_TT)) &&
> +	    handle_system_ccs)
> +		ret = xe_sriov_vf_ccs_attach_bo(bo);
> +

You don't check the 'ret' value of xe_sriov_vf_ccs_attach_bo. That seems be an oversight.

>  out:
>  	if ((!ttm_bo->resource || ttm_bo->resource->mem_type == XE_PL_SYSTEM) &&
>  	    ttm_bo->ttm) {
> @@ -957,6 +972,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  		if (timeout < 0)
>  			ret = timeout;
>  
> +		if (IS_VF_CCS_BB_VALID(xe, bo))
> +			xe_sriov_vf_ccs_detach_bo(bo);
> +
>  		xe_tt_unmap_sg(xe, ttm_bo->ttm);
>  	}
>  
> @@ -1483,9 +1501,14 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
>  
>  static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
>  {
> +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> +
>  	if (!xe_bo_is_xe_bo(ttm_bo))
>  		return;
>  
> +	if (IS_VF_CCS_BB_VALID(ttm_to_xe_device(ttm_bo->bdev), bo))
> +		xe_sriov_vf_ccs_detach_bo(bo);
> +
>  	/*
>  	 * Object is idle and about to be destroyed. Release the
>  	 * dma-buf attachment.
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index eb5e83c5f233..642e519fcfd1 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -78,6 +78,9 @@ struct xe_bo {
>  	/** @ccs_cleared */
>  	bool ccs_cleared;
>  
> +	/** @bb_ccs_rw: BB instructions of CCS read/write. Valid only for VF */
> +	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
> +
>  	/**
>  	 * @cpu_caching: CPU caching mode. Currently only used for userspace
>  	 * objects. Exceptions are system memory on DGFX, which is always
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 8f8e9fdfb2a8..c730b34071ad 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -940,6 +940,136 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  	return fence;
>  }
>  
> +/**
> + * xe_migrate_ccs_rw_copy() - Copy content of TTM resources.
> + * @m: The migration context.
> + * @src_bo: The buffer object @src is currently bound to.
> + * @read_write : Creates BB commands for CCS read/write.
> + *
> + * Creates batch buffer instructions to copy CCS metadata from CCS pool to
> + * memory and vice versa.
> + *
> + * This function should only be called for IGPU.
> + *
> + * Return: 0 if successful, negative error code on failure.
> + */
> +int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> +			   struct xe_bo *src_bo,
> +			   enum xe_sriov_vf_ccs_rw_ctxs read_write)
> +
> +{
> +	bool src_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;
> +	bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_READ_CTX;
> +	struct ttm_resource *src = src_bo->ttm.resource;
> +	struct xe_gt *gt = m->tile->primary_gt;
> +	u32 batch_size, batch_size_allocated;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_res_cursor src_it, ccs_it;
> +	u64 size = src_bo->size;
> +	struct xe_bb *bb = NULL;
> +	u64 src_L0, src_L0_ofs;
> +	u32 src_L0_pt;
> +	int err;
> +
> +	xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
> +
> +	xe_res_first_sg(xe_bo_sg(src_bo), xe_bo_ccs_pages_start(src_bo),
> +			PAGE_ALIGN(xe_device_ccs_bytes(xe, size)),
> +			&ccs_it);
> +
> +	/* Calculate Batch buffer size */
> +	batch_size = 0;
> +	while (size) {
> +		batch_size += 6; /* Flush + 2 NOP */
> +		u64 ccs_ofs, ccs_size;
> +		u32 ccs_pt;
> +
> +		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> +
> +		src_L0 = min_t(u64, max_mem_transfer_per_pass(xe), size);
> +
> +		batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
> +					      &src_L0_ofs, &src_L0_pt, 0, 0,
> +					      avail_pts);
> +
> +		ccs_size = xe_device_ccs_bytes(xe, src_L0);
> +		batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
> +					      &ccs_pt, 0, avail_pts, avail_pts);
> +		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
> +
> +		/* Add copy commands size here */
> +		batch_size += EMIT_COPY_CCS_DW;
> +
> +		size -= src_L0;
> +	}
> +
> +	bb = xe_bb_ccs_new(gt, batch_size, read_write);
> +	if (IS_ERR(bb)) {
> +		drm_err(&xe->drm, "BB allocation failed.\n");
> +		err = PTR_ERR(bb);
> +		goto err_ret;
> +	}
> +
> +	batch_size_allocated = batch_size;
> +	size = src_bo->size;
> +	batch_size = 0;
> +
> +	/*
> +	 * Emit PTE and copy commands here.
> +	 * The CCS copy command can only support limited size. If the size to be
> +	 * copied is more than the limit, divide copy into chunks. So, calculate
> +	 * sizes here again before copy command is emitted.
> +	 */
> +	while (size) {
> +		batch_size += 6; /* Flush + 2 NOP */
> +		u32 flush_flags = 0;
> +		u64 ccs_ofs, ccs_size;
> +		u32 ccs_pt;
> +
> +		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> +
> +		src_L0 = xe_migrate_res_sizes(m, &src_it);
> +
> +		batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
> +					      &src_L0_ofs, &src_L0_pt, 0, 0,
> +					      avail_pts);
> +
> +		ccs_size = xe_device_ccs_bytes(xe, src_L0);
> +		batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
> +					      &ccs_pt, 0, avail_pts, avail_pts);
> +		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
> +		batch_size += EMIT_COPY_CCS_DW;
> +
> +		emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
> +
> +		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> +
> +		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> +					MI_FLUSH_IMM_DW;
> +		bb->cs[bb->len++] = MI_NOOP;
> +		bb->cs[bb->len++] = MI_NOOP;
> +
> +		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> +						  src_L0_ofs, dst_is_pltt,
> +						  src_L0, ccs_ofs, true);
> +
> +		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> +					MI_FLUSH_IMM_DW | flush_flags;
> +		bb->cs[bb->len++] = MI_NOOP;
> +		bb->cs[bb->len++] = MI_NOOP;
> +
> +		size -= src_L0;
> +	}
> +
> +	xe_assert(xe, (batch_size_allocated == bb->len));
> +	src_bo->bb_ccs[read_write] = bb;
> +
> +	return 0;
> +
> +err_ret:
> +	return err;
> +}
> +
>  static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  				 u32 size, u32 pitch)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index fb9839c1bae0..96b0449e7edb 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -24,6 +24,8 @@ struct xe_vm;
>  struct xe_vm_pgtable_update;
>  struct xe_vma;
>  
> +enum xe_sriov_vf_ccs_rw_ctxs;
> +
>  /**
>   * struct xe_migrate_pt_update_ops - Callbacks for the
>   * xe_migrate_update_pgtables() function.
> @@ -112,6 +114,10 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  				  struct ttm_resource *dst,
>  				  bool copy_only_ccs);
>  
> +int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> +			   struct xe_bo *src_bo,
> +			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
> +
>  int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  			     unsigned long offset, void *buf, int len,
>  			     int write);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index ff5ad472eb96..242a3da1ef27 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -5,6 +5,7 @@
>  
>  #include "instructions/xe_mi_commands.h"
>  #include "instructions/xe_gpu_commands.h"
> +#include "xe_bb.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_migrate.h"
> @@ -208,3 +209,74 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  err_ret:
>  	return err;
>  }
> +
> +/**
> + * xe_sriov_vf_ccs_attach_bo - Insert CCS read write commands in the BO.
> + * @bo: the &buffer object to which batch buffer commands will be added.
> + *
> + * This function shall be called only by VF. It inserts the PTEs and copy
> + * command instructions in the BO by calling xe_migrate_ccs_rw_copy()
> + * function.
> + *
> + * Returns: 0 if successful, negative error code on failure.
> + */
> +int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
> +{
> +	struct xe_device *xe = xe_bo_device(bo);
> +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> +	struct xe_migrate *migrate;
> +	struct xe_tile *tile;
> +	struct xe_bb *bb;
> +	int tile_id;
> +	int err = 0;
> +
> +	if (!IS_VF_CCS_READY(xe))
> +		return 0;
> +
> +	for_each_tile(tile, xe, tile_id) {

Same comment as patch 1, I'd avoid for_each_tile and rather use
xe_device_get_root_tile.

> +		for_each_ccs_rw_ctx(ctx_id) {
> +			bb = bo->bb_ccs[ctx_id];
> +			/* bb should be NULL here. Assert if not NULL */
> +			xe_assert(xe, !bb);
> +
> +			migrate = tile->sriov.vf.ccs[ctx_id].migrate;
> +			err = xe_migrate_ccs_rw_copy(migrate, bo, ctx_id);
> +		}
> +	}
> +	return err;
> +}
> +
> +/**
> + * xe_sriov_vf_ccs_detach_bo - Remove CCS read write commands from the BO.
> + * @bo: the &buffer object from which batch buffer commands will be removed.
> + *
> + * This function shall be called only by VF. It removes the PTEs and copy
> + * command instructions from the BO. Make sure to update the BB with MI_NOOP
> + * before freeing.
> + *
> + * Returns: 0 if successful.
> + */
> +int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
> +{
> +	struct xe_device *xe = xe_bo_device(bo);
> +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> +	struct xe_bb *bb;
> +	struct xe_tile *tile;
> +	int tile_id;
> +
> +	if (!IS_VF_CCS_READY(xe))
> +		return 0;
> +
> +	for_each_tile(tile, xe, tile_id) {

Same here.

Matt

> +		for_each_ccs_rw_ctx(ctx_id) {
> +			bb = bo->bb_ccs[ctx_id];
> +			if (!bb)
> +				continue;
> +
> +			memset(bb->cs, MI_NOOP, bb->len * sizeof(u32));
> +			xe_bb_free(bb, NULL);
> +			bo->bb_ccs[ctx_id] = NULL;
> +		}
> +	}
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> index 5df9ba028d14..5d5e4bd25904 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -7,7 +7,10 @@
>  #define _XE_SRIOV_VF_CCS_H_
>  
>  struct xe_device;
> +struct xe_bo;
>  
>  int xe_sriov_vf_ccs_init(struct xe_device *xe);
> +int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
> +int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> index 6dc279d206ec..e240f3fd18af 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> @@ -27,6 +27,14 @@ enum xe_sriov_vf_ccs_rw_ctxs {
>  	XE_SRIOV_VF_CCS_CTX_COUNT
>  };
>  
> +#define IS_VF_CCS_BB_VALID(xe, bo) ({ \
> +		struct xe_device *___xe = (xe); \
> +		struct xe_bo *___bo = (bo); \
> +		IS_SRIOV_VF(___xe) && \
> +		___bo->bb_ccs[XE_SRIOV_VF_CCS_READ_CTX] && \
> +		___bo->bb_ccs[XE_SRIOV_VF_CCS_WRITE_CTX]; \
> +		})
> +
>  struct xe_migrate;
>  struct xe_sa_manager;
>  
> -- 
> 2.43.0
> 
