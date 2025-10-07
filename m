Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357EBCCA470
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 17:22:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46E610E19E;
	Tue,  7 Oct 2025 17:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KOU9Hw5X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F33910E19E
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 17:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759857769; x=1791393769;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JDi1I71UTznUS2n0qf2rlbvHRyQv7rck5OQ0Dnzucso=;
 b=KOU9Hw5XmNZvofL4uge7yT0OO8T1t85oxUqEb8ID9wJQ4TXct9RTBFF3
 ZBy6c+Xkk+lJgQvWWlJ6/4fFFop7wN+vTn3AaXHZ7UL6yXBppKSyD7rTI
 sXdvyYIFPM7Pe6S/b0+nsH0Khk6VJM22AaoXnOWv7kLUw0KCfGDkKvwYJ
 l27TZe77Bxw8SlKgABHNjbbrxmD2Mq+H5hIUKxLa8VgJFgd2B2FM9EGli
 MsVa/FE2R1ckGez1Ky+l9AbR28MtyQhSgNXUOGqoDE6XVSdAc17Y7DQFs
 fqrmH+FnqMvm0IYZKQofOLKP4mJLWVWnwLxTCOo8kozzcL/rCeABilPUU Q==;
X-CSE-ConnectionGUID: EqeK0uXKRyy4NaB0XHFjcQ==
X-CSE-MsgGUID: Ab43sgDSR3KW+ndsPe10DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="84667802"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="84667802"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 10:22:49 -0700
X-CSE-ConnectionGUID: ZlGYixUYQL61oR0TUrHkHQ==
X-CSE-MsgGUID: 0lWBfCb1SLWkUmzPQBPFHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180017041"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 10:22:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 10:22:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 10:22:48 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.24) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 10:22:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GmjI3DlVQx58OumLaZ2tsZ4lq5d9yCRpKVOWpzqkhOuoExWlBlLIThFCNqIRICF2vIabBwJfq89FT6Ot0uF94+/zMQoP+qE2mSwJ/nUmzfOJ7CuqW8eesXUe0oBFa0Q4C30/5gw+5d+kynfZVF0+/pzswTb5nxu0CVDU94HVjt/vLjb+ZHvd0KQ7EJqhbq8v04zDV02P0mSCJTazQ0h2PqXPF5Q/n5VicvHuEurhQ3lURcBUDaloNOH7sqloH936GRC5igMheEV0TKg4jCSMBdU88usXKkpqosDZ5LzeiQhhYTcksv5GkP91doYEFPbZkRWUtGHTbdYdMjjgsvb/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+AWTHDl51fkZh737LssGflMd+pT6LAIhJspIfN2aiU=;
 b=khgo+ljwsIbFrMIkkU3JOn3X2hAkA5dF7LWwSs2K56HIQxv3YjBNvWCncCUhy3bXV1j4Ijo0g1H+HLMRDRyXTL+7uyUg9oLkoo56TuV4/0iH1y8fCC7O11/oP3tc9/VCVf1tSF8mNT4SZyLJyI6Ohb1pnTOmSGDsi+8/kMW0lLrlMe2za/9NGpftONJkYgH77KWvXeUfa8K9ykUyUutn0/kzsmN5K1b8m2a7my+Vtidzz5ImcdiN9mYquqOPMIsbQ06QBwDgZxw4ShLMelDlOXuc4RS7x0m8zqgUyIxuqQPzCUCOEqAZ2aQ0uMdKoWopyVu0eKVc7FVahbsmSaYmRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB6325.namprd11.prod.outlook.com (2603:10b6:8:cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 17:22:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 17:22:42 +0000
Date: Tue, 7 Oct 2025 10:22:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v6 27/30] drm/xe/vf: Use primary GT ordered work queue on
 media GT on PTL VF
Message-ID: <aOVMXzdQCB1e7LoV@lstrano-desk.jf.intel.com>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
 <20251006111038.2234860-28-matthew.brost@intel.com>
 <t6aytzfw5frhua2ojrz3xyrobi25p424exjagpmovtvif5jwhw@ocmceysqldql>
 <aORH4NrjGSNcCxi/@lstrano-desk.jf.intel.com>
 <h4mwspqv5chueicgkrvd4grucstgev3vfkuavaeqbweqecvznc@wjpe5lk7tkr3>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <h4mwspqv5chueicgkrvd4grucstgev3vfkuavaeqbweqecvznc@wjpe5lk7tkr3>
X-ClientProxiedBy: BY5PR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB6325:EE_
X-MS-Office365-Filtering-Correlation-Id: 4234d4cc-0694-45a9-b9ce-08de05c61f30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1kyR004NHdXMXAzMk9tdmIwbUJ1aFE4UzRQL2tWQmI1amZQNEVrRkpUVElr?=
 =?utf-8?B?WGJMTXE5TWZZbEFKZXYvS0ozTWV2VFhuMEU2REs3dXFHaE1vZUlNMjZaaE9D?=
 =?utf-8?B?Ukpjckc5QUU2OEhzb1NQVE1kb3MyclBaZStIeEdSdElpaytObmQrZWNEOERj?=
 =?utf-8?B?anJpWVVUVTM1S3Fzai9QRmNQZVl1R29BcUFzRXRld2p6MHdlNXFERE5nYnpr?=
 =?utf-8?B?RHd0a1hsVEY3V0MrT21IdnFpUnBMaFJpRGhSc29qVUN0cnJKWnNOaEhCR2VF?=
 =?utf-8?B?NW5YRmtZalRJNzZManFMTHpJM0E3NnNHWnJRWHRRVnBlMk5meldGNzNhU20x?=
 =?utf-8?B?RUpTN1Q1cmpjc2gyc3I4VHBBTDVvUGJoS1kycDl4aDVVU2RSWm42WHNnOUhy?=
 =?utf-8?B?N0llc1RtRmFnNFNRdkFoWXRaR1kwMzlJaGRZSElHQ0I4K3ZuRlA1V2pjUWhP?=
 =?utf-8?B?VHFOLzdiMnQyaFYyOWZjSm4xNVpqZlhLV0diSjVRVmY0cmVISUlDVlpyeDRQ?=
 =?utf-8?B?SXVQL2JObXNvaG1VaTZUdmZFeEpURG5Nd1EybVBFaUI3Y2FROUdOUUFjbmtn?=
 =?utf-8?B?Q0ZSUGNTcWVMcFVwSG1GdnQ0dGRkUmpEYXFTYmZWbDZRbjRBcFlpbHBBdWJp?=
 =?utf-8?B?TjBqSkpCeS9rUElLOE5vYStlUlZjUGdKY29WWEZWTVVyNUZCUGZCQTFxbUo5?=
 =?utf-8?B?V1VUL3VKUWFRa2dYNTVWSDdjdDAyYTc5WmhSTkFrdFFFUmR0OEN0NlJ3WTZ1?=
 =?utf-8?B?YXplelhyU1ZmQndnTXlZbCtGc29IaGFYUksya1lSUnYyOFVaY3NkOGNuN3VG?=
 =?utf-8?B?UHp6LzFocEQ4SDBUWTgxZ1BXVk5xc3p3OUZZdk12L1IvVDhNdVNwTCtrY0N1?=
 =?utf-8?B?KzR1RGFIcWk5aFJuMkZNZzZjZ2x2eEZ6Q2kvZnRQN1ZjK3lsMWl2Sm5Ua09T?=
 =?utf-8?B?ajZ4SndCdGFNTXVJN2tydExsM3hCRkpvZHo0Wlprd2xCdXQwMGNpQ25zNzFZ?=
 =?utf-8?B?Qy9JWERWNmV3OEg1VTBvTjgxNDlwOUN1TGNhOHVuOFJrWUp5dW5SM1BFMXZ6?=
 =?utf-8?B?WFhvY1ZwYUYvOGh3alQzVU9oZ1JreEgvVGNSYWpaeUpMQTRXN2Q2bFV1dWUr?=
 =?utf-8?B?VzdQRCtRVjFNUlB2ZVZCUkdkSVk4Qk9XVkRaUGhQUXBKSlJ0WW9vRWlBY29l?=
 =?utf-8?B?YmQ2YTRzckFIVERaSVNDSzhKUFUyeFlLcGJuTEpiY3RodVA1M0N1ekFManRF?=
 =?utf-8?B?dzNCdTVWQi9xQnZYTU9WU1BXSFltWk0xUTJiQ2Z4cW83WEI3QXN2dFRWMVRH?=
 =?utf-8?B?YTJBR0pyck9ac0hwTzRQZzQ1a0xibER6QXFVcDRqYWs0RDMyaVVpeHBxWi94?=
 =?utf-8?B?YW5sV2kzK2loSys4cFNnYmZjZWJhOExzK25NMExVS0kwQ1NKUWk4d2VGRFky?=
 =?utf-8?B?THliZ1JzS1FwUDdwamdEUEptcVhjU3lyckt4cmR3c3llclJJVThFdlRzT2l2?=
 =?utf-8?B?dnViUlNmbURIc1VZazh2NFNNYUVDRWM3bHdCNW8wSTNCcjdzS3loc3VycFM0?=
 =?utf-8?B?SEluUjRDVXdXVGR0Sm5ONFlSS1dKS2RxTXhiWGFSdWEzZi95NkVnKzVyQnF1?=
 =?utf-8?B?WCtOYjhzNzZYeHF5V0xwelpqMG1hOU44UVh0Y2FiQmNoMlVYUjQwTzZIMkxu?=
 =?utf-8?B?TDBNSHZFMzE5NmlpVmgrMDBZd3dKYnNUUlJ3ZVFvU01Rc3lkVmhKZk9menlz?=
 =?utf-8?B?MFY5d2p4STROeCt2R0VoOFRWZFFyV0VaOEw5L2tPN2lXeE9vUm41bXhUMG8r?=
 =?utf-8?B?M0FiV1ZCbFdrNzN2ZHNkdGp1OUwzY3dLampIcG1HMU8venBDUklTditsS2sv?=
 =?utf-8?B?NkU0RS9tTnFQUUlVb2M0RUxMNCtydXRzRkQrS3pNdTIrQXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N21KNmNhclBFUnhKV3psWHZyK2EydDk0dUpicEJaTUhPZmVOVnViWDZ1TS9x?=
 =?utf-8?B?d0hMQ0R6eElWUCtucERqYitLUGZERW5Ic0FZU1JPSXFqb0V2TXZuOEF6MlVK?=
 =?utf-8?B?N2ZiY3Axc1hPbzR4bnJQQ2t5NW40TkV1bzBMclpzTldoNG5wKzcvVXlTS2lC?=
 =?utf-8?B?alozSHl1enpsVkxnOENhUVJ1ZzVwc2ZRNU1XdHRXamxQNXZyQ2R5aWl3aUp2?=
 =?utf-8?B?ZTFRQ3RzRERMYTRYQmNaUjVWYWgzYjMrNHhVMS9PUUN1N292RENXL0UxbU5Q?=
 =?utf-8?B?MzdaQ3RtTU9JWVE2MVFRN25JK3NQbjJXSnlFSUcyVjUwbFNPeUpPMUVualpa?=
 =?utf-8?B?NXdNVldJUnZWeWxlUFo4U2RPV3dnNzlnUmpWazViU2sybGxhdUJwa1RxK0dQ?=
 =?utf-8?B?NzlJS0dIN1gxR0M2cVVqNm9kVG9iUXRVRHN0MjhDSGtXMGEwU3RKcVMvc3JP?=
 =?utf-8?B?aFFSSXVaQzJybmdxeTFPNmpYTmdPRzV0dzUwclFXa3Q0V3lDSXc4c1VnTFYr?=
 =?utf-8?B?YmEzenNHeGxjVlNGb0U2Y2R4dTlHSWZKRm9FUVpmTzVaVEVIRnJEdkdlMHE2?=
 =?utf-8?B?czZ0alk2MkExZkx2bWVYSjIzdW1Ncll5d0dRdGt1Nld0dHFNOEs2eFJ5YTE5?=
 =?utf-8?B?Ykh1RWluckpZdkJuTjRHam9DT1dpOStxTGhidTNWUkxpL2s4dDVYeU5TQnpO?=
 =?utf-8?B?UUdIcDdyVDhKZ29GSm9hM3JINFFvZUMwYmd4WERudnUzYWJSVzA4L1pia29L?=
 =?utf-8?B?aUJYNDV0QUdKbXFob0pld2g4djlobnpROFNENlhGWVhwcldsZWhtM0NnL3pO?=
 =?utf-8?B?b3Rqa3pYYi9VMVV1VWFkTkZ3K2xkZWdsYmdJZzZsUjZkTGVzK0NNb0tKYW9y?=
 =?utf-8?B?UnNwdUEvc3NueGk2bUliMkhPbzJONnRra1E3cGNUdW55RmJZbVFremMzVGpx?=
 =?utf-8?B?VloyMjI1b3dIdU1heUk3SVZnSHh6RlhVNU95OWNJQWFIZjNnQSswRHNlVE56?=
 =?utf-8?B?WTZwSGtkbk1wSnZrSkRSSEVHWXZTUnMxSnBZc1dZNzdBVC8yNVFxR0lDKzZ6?=
 =?utf-8?B?MGpEL0s2RnZxckF3cmpSWTFGYXhRL0R0NXpYNWxJMXdnNEdsbXpXdTBjN2ZI?=
 =?utf-8?B?UlBBb0x3MnBUNmM4SitjdGM0ZWUwQlN4SWgvWUc1Q1JndFhXNXJPcEdlUkxR?=
 =?utf-8?B?allrVUhxWFNmcThFVHZLN1VIdUtMM2thN2thbUVXMWFkekk5SmQ0NnB0TnZV?=
 =?utf-8?B?Mklkc3diQkdSRDNpTWVabGhXMEZPZzRFK1lhTnVsV21RYlBCbGp3NjhHL3Vu?=
 =?utf-8?B?SGs1VCs4NXU2RERyWjZYTGJQNjNEdDhsZ1B4QzlRWkFVcWtQdnRPSG5OeG5W?=
 =?utf-8?B?SW1rcFR6cVI0bUxlODN1Z1BDNnN6UzJqd3E2ay9qTXBSOG1lUmhaQWJ5bkZT?=
 =?utf-8?B?YlpjcWhDeFBSZHNFTzI4VysvNUNoRWhTWHVJdE55cExjY3MvNTdCV2Y3SmVU?=
 =?utf-8?B?cG4yc0VqYTBZa3NRNWl2YXltV0tERzJXT080Yzl2UjkvK3ZUT2RzenducXp1?=
 =?utf-8?B?UU5UV1BVT21hRW41b2ZuQlFiaWJRMjAyZmpJa25xdFZGVnR1RVEyaVBtdlNu?=
 =?utf-8?B?VEt6c2JwT25Pam9PNllUYWRNaS9mZzY5M0pBUUpadDcrUVp6dWszdkhRTCtC?=
 =?utf-8?B?cVYyNTF2emgrYytKcjBwWTlYRC85Z1oxU09oVjJLVEhkL2VEb3BMUnluRkM1?=
 =?utf-8?B?ZGdLTzNzTDBBTU4yMWRZeTJxbTBzUnNrSmxiR0ZXdno4a2ZQbXBFUk50azNI?=
 =?utf-8?B?Z3BCdDZtUndPZVlVWjZ0ZGxTTGZqWTlCYlkzL1g1Y291NEozVVJFd0tCeE9y?=
 =?utf-8?B?dDJndkhSS1dtUDh0UFpjZS85YWhad2Z2NUNJdngyYUR6LzNDVmpuWHo0V1pC?=
 =?utf-8?B?MURxOFo2WmRkK0NhYUR5cmhMYit4UkozSjZ0OG9oVys2aUZ5ODRZWTBDNFVw?=
 =?utf-8?B?T2hzTUlRVEhyQktaUk1MdlhRUmowSkZhZEIzeFpLZEU0SDVXNXBSU3EyTEhW?=
 =?utf-8?B?bGMvVzBLaWJONUdMc3hBeUlxVVcyVWVCMVVpK0tEak1mNHpuWmltemkvUGZB?=
 =?utf-8?B?VEMvR3Q2QTNtQ2tTYlVuenJvTnR2Q3ZTdWxCc3RsQlFRbGdoSDNKbzgzd3hl?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4234d4cc-0694-45a9-b9ce-08de05c61f30
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 17:22:42.0769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zTfnFoEj4/QcUxR0VKpqCz3ggRieJBo6ROrcah0PV9yhfUB9yJyF+NDqfIzMo3GwDTTVaaBeyXjf5a8AgC874w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6325
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

On Tue, Oct 07, 2025 at 12:00:32PM -0500, Lucas De Marchi wrote:
> On Mon, Oct 06, 2025 at 03:51:12PM -0700, Matthew Brost wrote:
> > On Mon, Oct 06, 2025 at 05:24:55PM -0500, Lucas De Marchi wrote:
> > > On Mon, Oct 06, 2025 at 04:10:35AM -0700, Matthew Brost wrote:
> > > > VF CCS restore is a primary GT operation on which the media GT depends.
> > > > Therefore, it doesn't make much sense to run these operations in
> > > 
> > > I'd need to double check the previous patches to see the entire
> > > picture, but this seems weird at a first glance. The VF CCS restore is
> > > not the single work we queue in gt->ordered_wq.  To me it seems more
> > > like "in what ordered queue we are going to queue the VF CCS restore. If
> > > it's global per device, why are we not using the device wq rather than
> > > making all the GT wq point to the same thing?
> > > 
> > 
> > This is where things get convoluted. Four mechanisms manipulate the
> > scheduling state by starting or stopping the DRM scheduler:
> > 
> > - Job timeouts
> > - GT resets
> > - VF restore
> > - PM resume
> > 
> > All of these paths require mutual exclusion, or the scheduler design
> > breaks.
> > 
> > The first three ensure ordering by scheduling on the same ordered work
> > queue (GT-ordered WQ). The last one is guaranteed by holding PM
> > references in all the right places.
> > 
> > Another issue is that the first three items are all in the reclaim path
> > — the GT-ordered work queue is designed to handle this.
> > 
> > This patch [1] explains the entire scheduler design in detail.
> > 
> > Only PTL has the cross-VF/GT restore ordering requirement, so I figured
> > the path of least resistance is to just point all GTs to the primary
> > work queue.
> > 
> > [1] https://patchwork.freedesktop.org/patch/677980/?series=154627&rev=4
> > 
> > > > parallel. To address this, point the media GT's ordered work queue to
> > > > the primary GT's ordered work queue on platforms that require (PTL VFs)
> > > > CCS restore as part of VF post-migration recovery.
> > > >
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_device_types.h | 2 ++
> > > > drivers/gpu/drm/xe/xe_gt.c           | 7 +++++--
> > > > drivers/gpu/drm/xe/xe_gt.h           | 2 +-
> > > > drivers/gpu/drm/xe/xe_pci.c          | 6 +++++-
> > > > drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
> > > > drivers/gpu/drm/xe/xe_tile.c         | 2 +-
> > > > 6 files changed, 15 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > > index c66523bf4bf0..02c04ad7296e 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > @@ -334,6 +334,8 @@ struct xe_device {
> > > > 		u8 skip_mtcfg:1;
> > > > 		/** @info.skip_pcode: skip access to PCODE uC */
> > > > 		u8 skip_pcode:1;
> > > > +		/** @info.needs_shared_vf_gt_wq: needs shared GT WQ on VF */
> > > > +		u8 needs_shared_vf_gt_wq:1;
> > > > 	} info;
> > > >
> > > > 	/** @wa_active: keep track of active workarounds */
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > > index cf484a2da35e..05465f358c96 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > @@ -65,7 +65,7 @@
> > > > #include "xe_wa.h"
> > > > #include "xe_wopcm.h"
> > > >
> > > > -struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
> > > > +struct xe_gt *xe_gt_alloc(struct xe_tile *tile, bool use_primary_wq)
> > > 
> > > If using the device wq is not an option (possibly because it would queue
> > > with other undesired work going on there), then I'd rather drop this
> > > bool passing here and make the decision inside this function:
> > > 
> > > > {
> > > > 	struct drm_device *drm = &tile_to_xe(tile)->drm;
> > > > 	struct xe_gt *gt;
> > > > @@ -75,7 +75,10 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
> > > > 		return ERR_PTR(-ENOMEM);
> > > >
> > > > 	gt->tile = tile;
> > > 
> > > 	if (!xe->info.needs_shared_gt_wq || !tile->primary_gt->ordered_wq)
> > > 		ordered_wq = drmm_alloc_ordered_workqueue(drm, "gt-ordered-wq", WQ_MEM_RECLAIM);
> > > 	else
> > > 		ordered_wq = tile->primary_gt->ordered_wq;
> > > 	if (IS_ERR_OR_NUL(ordered_wq))
> > >  		return ordered_wq ? ERR_CAST(gt->ordered_wq) : ERR_PTR(-EINVAL);
> > > 
> > > 	gt->ordered_wq = ordered_wq;
> > > 	
> > > ... or something like that so you use the xe info to decide it here
> > > rather than passing it down as a function arg.
> > > 
> > 
> > Sure can refactor this as you suggest.
> 
> 
> another option that would avoid a bool arg would be to actually pass the
> wq from the caller.
> 
> 	wq = NULL;
> 
> 	if (xe->info.needs_shared_gt_wq)
> 		wq = tile->primary_gt->ordered_wq;
> 
> 	xe_gt_alloc(tile, wq);
> 

I posted a v7/v8 which did it like you suggest.

> > 
> > > 
> > > > -	gt->ordered_wq = drmm_alloc_ordered_workqueue(drm, "gt-ordered-wq", WQ_MEM_RECLAIM);
> > > > +	if (use_primary_wq)
> > > > +		gt->ordered_wq = tile->primary_gt->ordered_wq;
> > > > +	else
> > > > +		gt->ordered_wq = drmm_alloc_ordered_workqueue(drm, "gt-ordered-wq", WQ_MEM_RECLAIM);
> > > > 	if (IS_ERR(gt->ordered_wq))
> > > > 		return ERR_CAST(gt->ordered_wq);
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > > > index 5df2ffe3ff83..9545c0c93ab6 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt.h
> > > > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > > > @@ -28,7 +28,7 @@ static inline bool xe_fault_inject_gt_reset(void)
> > > > 	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&gt_reset_failure, 1);
> > > > }
> > > >
> > > > -struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
> > > > +struct xe_gt *xe_gt_alloc(struct xe_tile *tile, bool use_primary_wq);
> > > > int xe_gt_init_early(struct xe_gt *gt);
> > > > int xe_gt_init(struct xe_gt *gt);
> > > > void xe_gt_mmio_init(struct xe_gt *gt);
> > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > > index 3f42b91efa28..25a1d96a68e7 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > @@ -347,6 +347,7 @@ static const struct xe_device_desc ptl_desc = {
> > > > 	.has_sriov = true,
> > > > 	.max_gt_per_tile = 2,
> > > > 	.needs_scratch = true,
> > > > +	.needs_shared_vf_gt_wq = true,
> > > 
> > > as per above... I think this needs to be detached from vf. There may be
> > > other reasons the wq needs to be shared.
> > > 
> > 
> > I’d prefer to share the work queue only when absolutely necessary — such
> > as when PTL is on a VF and migration is supported.
> 
> 
> I missed that you left the VF condition out as an && for the allocation:
> 

Yes.

> > > > +                                       xe->info.needs_shared_vf_gt_wq &&
> > > > +                                       IS_SRIOV_VF(xe));
> 
> IMO a better way would be to call it `needs_shared_gt_wq` and then
> override the condition in the vf-specific function:
> 
> sriov_update_device_info()
> 

I'm trying to follow this one.

This a platform (static) and VF (dynamic) condition combination.

Are you suggesting removing platform information from xe_pci.c and just
have info bit in the device which the sriov code sets? I think we'd need
a platform check then in the sriov code which I thought in general we
want to avoid inline platform checks.

Maybe I'm misunderstanding here.

Matt 

> Lucas De Marchi
> 
> > 
> > > If we just make them point to a device wq as suggested above, then
> > > there's no extra issue with the ongoing work to disable GTs that Matt
> > > Roper is doing (https://patchwork.freedesktop.org/series/154739/).
> > > Otherwise we will need to think on how to reconciliate them.
> > > 
> > 
> > I don’t see how it would ever be possible to disable the primary GT and
> > still do anything meaningful. You can’t allocate memory (e.g., for
> > clears), perform VM binds, or handle page faults without a copy engine.
> > 
> > Matt
> > 
> > > Lucas De Marchi
> > > 
> > > > };
> > > >
> > > > #undef PLATFORM
> > > > @@ -598,6 +599,7 @@ static int xe_info_init_early(struct xe_device *xe,
> > > > 	xe->info.skip_mtcfg = desc->skip_mtcfg;
> > > > 	xe->info.skip_pcode = desc->skip_pcode;
> > > > 	xe->info.needs_scratch = desc->needs_scratch;
> > > > +	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
> > > >
> > > > 	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> > > > 				 xe_modparam.probe_display &&
> > > > @@ -766,7 +768,9 @@ static int xe_info_init(struct xe_device *xe,
> > > > 		 * Allocate and setup media GT for platforms with standalone
> > > > 		 * media.
> > > > 		 */
> > > > -		tile->media_gt = xe_gt_alloc(tile);
> > > > +		tile->media_gt = xe_gt_alloc(tile,
> > > > +					     xe->info.needs_shared_vf_gt_wq &&
> > > > +					     IS_SRIOV_VF(xe));
> > > > 		if (IS_ERR(tile->media_gt))
> > > > 			return PTR_ERR(tile->media_gt);
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> > > > index 9b9766a3baa3..b11bf6abda5b 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pci_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> > > > @@ -48,6 +48,7 @@ struct xe_device_desc {
> > > > 	u8 skip_guc_pc:1;
> > > > 	u8 skip_mtcfg:1;
> > > > 	u8 skip_pcode:1;
> > > > +	u8 needs_shared_vf_gt_wq:1;
> > > > };
> > > >
> > > > struct xe_graphics_desc {
> > > > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> > > > index 6edb5062c1da..e9bcff2de563 100644
> > > > --- a/drivers/gpu/drm/xe/xe_tile.c
> > > > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > > > @@ -157,7 +157,7 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> > > > 	if (err)
> > > > 		return err;
> > > >
> > > > -	tile->primary_gt = xe_gt_alloc(tile);
> > > > +	tile->primary_gt = xe_gt_alloc(tile, false);
> > > > 	if (IS_ERR(tile->primary_gt))
> > > > 		return PTR_ERR(tile->primary_gt);
> > > >
> > > > --
> > > > 2.34.1
> > > >
