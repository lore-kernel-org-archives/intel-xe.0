Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3D5C27C5F
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 13:50:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAD710EC6C;
	Fri,  7 Jun 2024 13:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lKI1qqgd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A9210EC68
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 13:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768240; x=1749304240;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=YeO91uHXLjeZXJhCdfJvRDiUjF0uV/89Cz+vZn0x2RU=;
 b=lKI1qqgdTCzeKLt9tIgNVDPSxeVsdrirFbXjyr2X/1zAgn3IZq1636H5
 b4+ttsTm3RsIfA25UcYJxP6XhhEwHoNHukY9SSjHPi0QEjosEGOcUv5Z5
 C2kpmHoTsh7/nCFxfMmmqGTbDZjtfsudhzadqN9eWTTbuB2imX/z03vTB
 18eRFax/RSvrz0TpYDQzNGL3xSbnsTdH8bDZcWGiCLgiqgTxg8hcsM+sm
 Q2HFj5M89JaDK9ZkDJwbhfxeT3/M+QASr1EbOpuyNknqBhOzoyuQ4w79D
 +ReSOplEfzMtiu2EZbg3itDKaiYEXQrGUl/0eeitEy0dCM8E0kE4GW/xm w==;
X-CSE-ConnectionGUID: Rmyc3HsxTB2NX0vP9wXumw==
X-CSE-MsgGUID: bRixiSciR9CvhkoU0gAiiw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="31984186"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="31984186"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:50:39 -0700
X-CSE-ConnectionGUID: RzUeH4ZjSVK7w0t9qrgRzQ==
X-CSE-MsgGUID: npdGSn98QtS/kd6woWJN6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="75815124"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 06:50:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 06:50:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 06:50:39 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 06:50:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngTX7EzLHSVEb/W5pjPdPrQqZQ6dyUdEuSZXiwuLV7zcl3cCJPZVAdQ4fqwNNBKVzU0ft+0nYT6YSxkohbSJ6XkARORjdVDYLy6X/xeKOOeXwXJXpkFwPXvnopwnvUPpMrF2XNCLpzH05mqBwNu/SNG6PiAtmBXaASU+gRH33L67pEL/rl1yfibpJKnAjhEGZxRxGfTNu9wwpk2e0k0GASyBJwis56FCpx1DTlL5FMShgeSVqRWUxbzdTsO2JqzVTvxqy0dQ9zLO37qrn363OMUKcseERhamNfxyOD5BFqXEB3p/PP1wPiqu/E6pFHmdE3ba9PGnuiBqyvWB4uZ+tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tckPSuQSgj7/7JT9ldKHxWh9ddC/MxzDyjF+yZWU+fM=;
 b=POsFuuVWedMextOU6UF+zdhWv635JrzmmhkxdbTSwqJQWCy5DIE9JnscRkvaPphE9PkW9K7qEbWYuSfMaxXAoPRB2Lau7b0fE7n7BmNyLadlhdhleRNA9aOr+KnHgMiuFarBIh6/zGEWe2gL1pqBa8hDVioVn+IDPlt4XPtaYBNWRQW7IjLPxkCYl6jObAj27oTpMR8D4gH03fac17rLc/0SIHpqhYw+BUka0syCLCKX4rZc5B+WHxY1mrIE0161XsttQKRU26OHxi/mHEBLLTNVgJOFcFFJ1ekWaF76utBbAxwyh2Jb/NB/PPgwctK9gIvYgQFPHhDeNZtt404glA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CY5PR11MB6305.namprd11.prod.outlook.com (2603:10b6:930:23::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Fri, 7 Jun
 2024 13:50:36 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7611.016; Fri, 7 Jun 2024
 13:50:36 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240606223819.3545560-5-radhakrishna.sripada@intel.com>
References: <20240606223819.3545560-1-radhakrishna.sripada@intel.com>
 <20240606223819.3545560-5-radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v5 4/6] drm/xe/trace: Print device_id in xe_trace_guc
 events
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Radhakrishna Sripada <radhakrishna.sripada@intel.com>, Ville
 =?utf-8?b?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Fri, 7 Jun 2024 10:50:32 -0300
Message-ID: <171776823263.2025.10231169391248778004@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR13CA0239.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::34) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CY5PR11MB6305:EE_
X-MS-Office365-Filtering-Correlation-Id: 661c4152-1d8d-4eac-6ed7-08dc86f8cf0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1pMR09LV3BXUjBVRC9DbkdOUlhmSUprUnNhQ3EybGFjRmJBSlVDOG9uV0V4?=
 =?utf-8?B?R3lTSnpCd282SFczQkh4OGRXaUhrdUtMTm1uZW9nSmxTa0pseDVxWEVvSnJ4?=
 =?utf-8?B?RlNSKzloazFEK0NJQjVCVk4yZkp5UlRJa1NvRDBiWnBaS2h0MmhuTTNQQXVu?=
 =?utf-8?B?TVN5SXQzblJsT3UweHNiUlZGOVRvWjZHdXBRVW9rQ0xuZHpHM25FOTV1YUx2?=
 =?utf-8?B?cEh2ckVkZjNJeGEzUVU3QXEvWmxyR25tUGxqaGI4SmJ2VUJ2TzUva0RlejBD?=
 =?utf-8?B?aXMxT3JHZ09ma1RuMURDNWM2M3RoM0dMSTlrVUloc01WZmk1bysxZEJKWis0?=
 =?utf-8?B?VkNGK1dRT0ZKZ05PRlI3bTdod2VsS2pmK2U2MW5Dd0Y5cWE0TTZSRSt3clhN?=
 =?utf-8?B?WjdHQitsTVBaWmFpZ3JhSXZ4S2ZKZ2Vwb1hXemo1ZVVvU3ptWGk4aTZLcnlk?=
 =?utf-8?B?a1lHa0poOXdEMnB1RXp6SUlpcEg4allVcTU4OGpZdWl3L0hRK0d5aGVzeWF6?=
 =?utf-8?B?cW42THczdnZ5SFF0RUVTUFdmSjNYMTZFT3VPV0JqUWVRREtxVVkzeGJTdnhp?=
 =?utf-8?B?cTZReFA4STlaNGh5ZHh3cmU3amNsUnIwUmNSNW9SbW0wWDJVdHNtNm9yQURH?=
 =?utf-8?B?VDhWaHMzTzBXb0I1OUt2bFRuN3FEMkorS2xHUit3OXV2b0RKRFV5L1RhRDdK?=
 =?utf-8?B?TDJIZTdncUhHOFdRY2JUVnAwdCt1bkgzNVo1a3E4NkhFQVhBVUtVMFJxR254?=
 =?utf-8?B?TVBrckcwM0Y1dDJLUmhFQk02NXY5NWZLQnR5U1J5d2xQMFhwRC9vYVl1U2Zi?=
 =?utf-8?B?VjVvcXhkUUVIRGo4MDlFM0JRWXBSWE1VL3g3L0ZUb0RTNU9XczAvM2Rlam5L?=
 =?utf-8?B?NjZPL3RER0FaQ3B1N2I4WHVsaEtlTVBKQnBWTTErVGpFQXRUc0l3eG95OEZq?=
 =?utf-8?B?RE1PclYxNDZudnpSTHYvRHpEVnR4cTAwUXg1R2hSK1FpaDFjTHJ3YmhKaDhG?=
 =?utf-8?B?NUlrRzRuRTl1cVpIOGNoNTdWdFg0b3FZcUdKWHd5TXRZN1V1RzhwbWszcnE3?=
 =?utf-8?B?RjQvSzRYNklrOS85RnE0dEYveURQSGh0ZldWNk1PYUxuV3JKcUVvd2tMK2dU?=
 =?utf-8?B?TzRPZDg5UXpSWE52ME81WnRBM0l4Szg5OVAzUVV5dzRSYTFvbkNGNVd0STUy?=
 =?utf-8?B?NW1JUVh4V0VRSFVuTmVrSENnUlFxbDNRamgwTm54MnhYRW9TaE4zTGVyS3FB?=
 =?utf-8?B?R25zT0ZIYm9nU3NEWGZSSFZMSFQzbHJSSGNRT0kzRjR4V1RtYjdEUEU2TFg0?=
 =?utf-8?B?Z3pjTEZBY0JKYTFFdjlNbGtCZE5JMTFOdEZFQ2IwV2syL2JUODd4dllCQUZ2?=
 =?utf-8?B?S1l0cC9pK3E4Nnh0TDRHQUdPakhPalpsSHE0VkZySGZpNC9DeU5xVytjVis2?=
 =?utf-8?B?c29kRFZFbGVSc01CU2tNMm5WVGxpdlZlN2w3T3VLcW54WGpKamxreExUK0JV?=
 =?utf-8?B?SUV0Wk4yQUdqY0JIalZQTUJmMmEyYlExZlhLRlhqZTZRV1dielNsWVZpYWhn?=
 =?utf-8?B?QTU2VS9pODllTTlKbTNRdWVob3RCVTZjclRyanR2SW4rNklGaUtOK1dWR2w5?=
 =?utf-8?B?ODlSUUE3VEppR25qOURFdWJMTEkyaTNiM1EyUjh5bGZ1S1p2MEpKQW1FNURF?=
 =?utf-8?B?aldMd1d2Y0pZMXVXQ0MxOGFnWDhpd21iU1FVWk1hLzhTMUN4T2dQWXVUdzg3?=
 =?utf-8?Q?ck9zzQf0fV5Ps1AiKVjXyVrVpLH9RqRG3m9Vp2t?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGgrVndXL0dqRE9BVlRIOWVuM2FGNW1tMkxId0hoYnJxUUNyaDNFMjl4TUQw?=
 =?utf-8?B?RVBUd2gxQi9LMG5hcVdXQ3hMWDZjVjdoZW0zem5WL0lxMTl6MFRSdVVESFZz?=
 =?utf-8?B?c2RHNklBSXppLythSzVXbElFRk9sZDZvMk1QcmZoaG9wZkR1MUM3WFZmVWx1?=
 =?utf-8?B?cUU2c2dCcDg3eStuL0ZtZ2p2ZXVDT0hBU0Z6OWJ3aUxaTTYyaDdXU0h5RG1j?=
 =?utf-8?B?QWZIUXhvVll5czA1RHFvaWtWRFl3VTY2d1FNUHE2NDdxWGJjdmVxL2U5cG1T?=
 =?utf-8?B?Y0s4NEJXTktjK2VRU0ZyZ25tVlF6RDRrcFgyRklBVWhzektjWUcyb1pVM0dJ?=
 =?utf-8?B?bFRzNklCWGdGaXRFR0p4Nmw2TlFrNXNBVWR2T0J4RVJ6TkdkNXQyMWZqOFM5?=
 =?utf-8?B?N0dNdVlKNFpRbmd0UjR6RENVOUREekZtSTNjWmVHalo5YnFNQ3NpVzArWlpr?=
 =?utf-8?B?eU9jWnZXbERCYXAvUFpqTTJIUUt1SjZrWGRnbmZQSkpPZUx6SFd2THVXUGg3?=
 =?utf-8?B?WGFDb3NkSVZwZTdpZHVrYTYwbGpRYktHMnpkNldZVDNCRlBySEV6d0M0VkZL?=
 =?utf-8?B?OFNoeTFXd0txZ2x0MFQxTnMvYW0rWUVRdTFSTDRKSzZiODJlaFB1NnQ5TDNl?=
 =?utf-8?B?UC9LMXMzNVdoSVBWUG9XbWxTayt5UmFoem5LaWhZWkFYbkgyM1RyR1RNMktK?=
 =?utf-8?B?aVp3NFRSek52ZUNCdEl6bTRjeVJOY0g2RVJyZWF0YmNmS0FhMUh0Y0NyOFhJ?=
 =?utf-8?B?V2lsNWc2ZzJONDYxekEyNlYrbmxvN2Zham5lZW5GZGFUVGNoUnRBNHRwYjB2?=
 =?utf-8?B?Z3Y0V1IzTDhhQVErR3Y0bEl4YUkycTkxbzJUdm84SjJMVldzOFFiNndreCty?=
 =?utf-8?B?Nk11d0pLb3FIRjZ3cElHQUdyOWNFbmtVU2R6TGh0a2ZrdWl0aWdLYjhscUZw?=
 =?utf-8?B?d3R6c3BRTHF1WFF3c1J2TDZmdmpvd2ZEamJVRlNTZFR5U1lYMC81RS9GUWJ4?=
 =?utf-8?B?SGV2azBvWHFUOGlrV1BYc3FzZUtTOENxOHdhUU5RMzJxRVc3czg4ZEdRM2o2?=
 =?utf-8?B?VDFlb2NDblpWdzlRNUUydVA3V2VUdnBIa0UwZS9iVW5CSHVsSVhwRUZqTERG?=
 =?utf-8?B?MFQzaG56SEJwdm9jMXN5S2t4TlMrckU0OTZ4dGUvaXh1d3JBZlFUWUJubGlr?=
 =?utf-8?B?S0g1Q3A5UjB1QzI0UXkwSWg0bFluOWlOZ0s1dW9HNU10ZUVoYUNQWUE5TjdQ?=
 =?utf-8?B?TC9Udi9uUDJWTEVtKzUvckJyTFJ1TlRFNVdGUVJDbGVBQk9lV1QwMVhZSjMv?=
 =?utf-8?B?YzVOVzFweHZGZjdiSWNuZGc2ZjkycHVZSzNQUGxXS0FhRHZqaU1NVkt3WXNQ?=
 =?utf-8?B?N2R5VzE0cHdkTlhaQ3Jybld2YWNJKzdFQllGaExGYUVvS2RROHdha1VITURk?=
 =?utf-8?B?cnVYalFjaDVnMVRRWDN1L2kwTHN6dlM3U3pJZ1krU2NCOXl0UkFmdHY4TlJu?=
 =?utf-8?B?NGFpekRpaXdxOEhtS3pZb25ZMW9rT3NyMWl2VWh3aXpzT0pGM005ZVR4WGh3?=
 =?utf-8?B?d0lGeGFvOHpMeTBYYnQ4alJOYllPYmhMU3lSZlBxQ3luVGNlTllheCtUWlB2?=
 =?utf-8?B?a3JrR0ROaHdrTWV6K2l1K2xRYjh1b3VEMjZpZEhxaFZJNUN0OURFaEVNMXhE?=
 =?utf-8?B?QVVoOFVMaFA0eWhGOEVFbTEyR3lscXBxNmJuRTNRUmdHWUc4TXZ5SXI1RXVr?=
 =?utf-8?B?ZnhaS2FDKy95clJ6NjdaSHF3RlBmUnBCUEtHaW5EOVdUeVBLTTVkeDVFWDN2?=
 =?utf-8?B?cE9VekJBSE9kSkxkSHBlK0ZKcGJFd0pSa24yVUhOVnRURUZBSnN6QVFYbVg5?=
 =?utf-8?B?d0RHdjlnZWd1b3l6L01vSnkwM0YrZ0Nib3Y5czJML3dtVmtydTRlN1pDMHV4?=
 =?utf-8?B?YTh6UDNybHB4alFoTm1YS1ZPSUx5N3pGREtJRG9KSDZxNUoxVFAvbHdYT2lF?=
 =?utf-8?B?ZXVCM2J2eUhjak15ZnlnZlUrcXlpeERWN2VoV0lyUU5vTWMrZ0hnMWl0bmh6?=
 =?utf-8?B?RmRMaURMNXo1dm5zQk93K3hybEsvRm94OG5rWUE3dEdteVVnZm5McVZTYzhG?=
 =?utf-8?B?bU9PYWpEbmx5Y1lGdm1iZ09sTGkxRCtJTGIyQWVsVUVJOUo4VHB1cy9iQm1u?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 661c4152-1d8d-4eac-6ed7-08dc86f8cf0b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 13:50:36.6606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6QHSUI1R3nORGL5/mdxJisz7WXCehGyWCPYDSxUyemBAhVFQVBqLOBfZsW92aPdQGQvNxo+AKLrORLW3HSWgTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6305
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

Quoting Radhakrishna Sripada (2024-06-06 19:38:17-03:00)
>In multi-gpu environments it is important to know the device
>guc txn belongs to. The tracing information includes the device_id
>to indicate the device the event is associated with.
>
>v2: Use variable sized variant to display dev name(Gustavo)
>v3: Pass single argument to __assign_str to fix kunit error
>
>Suggested-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_ct.c    | 11 +++----
> drivers/gpu/drm/xe/xe_trace_guc.h | 48 ++++++++++++++++++-------------
> 2 files changed, 34 insertions(+), 25 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct=
.c
>index 78f79df638d5..ff3fd10cd417 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ct.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>@@ -528,7 +528,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *=
action, u32 len,
>         /* Update descriptor */
>         desc_write(xe, h2g, tail, h2g->info.tail);
>=20
>-        trace_xe_guc_ctb_h2g(gt->info.id, *(action - 1), full_len,
>+        trace_xe_guc_ctb_h2g(xe, gt->info.id, *(action - 1), full_len,
>                              desc_read(xe, h2g, head), h2g->info.tail);
>=20
>         return 0;
>@@ -641,6 +641,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, co=
nst u32 *action, u32 len,
>                               u32 g2h_len, u32 num_g2h,
>                               struct g2h_fence *g2h_fence)
> {
>+        struct xe_device *xe =3D ct_to_xe(ct);
>         struct xe_gt *gt =3D ct_to_gt(ct);
>         struct drm_printer p =3D xe_gt_info_printer(gt);
>         unsigned int sleep_period_ms =3D 1;
>@@ -668,7 +669,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, co=
nst u32 *action, u32 len,
>                 if (sleep_period_ms =3D=3D 1024)
>                         goto broken;
>=20
>-                trace_xe_guc_ct_h2g_flow_control(h2g->info.head, h2g->inf=
o.tail,
>+                trace_xe_guc_ct_h2g_flow_control(xe, h2g->info.head, h2g-=
>info.tail,
>                                                  h2g->info.size,
>                                                  h2g->info.space,
>                                                  len + GUC_CTB_HDR_LEN);
>@@ -680,7 +681,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, co=
nst u32 *action, u32 len,
>                 struct xe_device *xe =3D ct_to_xe(ct);
>                 struct guc_ctb *g2h =3D &ct->ctbs.g2h;
>=20
>-                trace_xe_guc_ct_g2h_flow_control(g2h->info.head,
>+                trace_xe_guc_ct_g2h_flow_control(xe, g2h->info.head,
>                                                  desc_read(xe, g2h, tail)=
,
>                                                  g2h->info.size,
>                                                  g2h->info.space,
>@@ -1170,8 +1171,8 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, =
bool fast_path)
>         g2h->info.head =3D (head + avail) % g2h->info.size;
>         desc_write(xe, g2h, head, g2h->info.head);
>=20
>-        trace_xe_guc_ctb_g2h(ct_to_gt(ct)->info.id, action, len,
>-                             g2h->info.head, tail);
>+        trace_xe_guc_ctb_g2h(xe, ct_to_gt(ct)->info.id,
>+                             action, len, g2h->info.head, tail);
>=20
>         return len;
> }
>diff --git a/drivers/gpu/drm/xe/xe_trace_guc.h b/drivers/gpu/drm/xe/xe_tra=
ce_guc.h
>index d6830ff21822..3791baad1866 100644
>--- a/drivers/gpu/drm/xe/xe_trace_guc.h
>+++ b/drivers/gpu/drm/xe/xe_trace_guc.h
>@@ -9,16 +9,21 @@
> #if !defined(_XE_TRACE_GUC_H_) || defined(TRACE_HEADER_MULTI_READ)
> #define _XE_TRACE_GUC_H_
>=20
>+#include <linux/string_helpers.h>

I believe string_helpers.h is not necessary here.

> #include <linux/tracepoint.h>
> #include <linux/types.h>
>=20
>+#include "xe_device_types.h"
> #include "xe_guc_exec_queue_types.h"
>=20
>+#define __dev_name_xe(xe)        dev_name((xe)->drm.dev)
>+
> DECLARE_EVENT_CLASS(xe_guc_ct_flow_control,
>-                    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u=
32 len),
>-                    TP_ARGS(_head, _tail, size, space, len),
>+                    TP_PROTO(struct xe_device *xe, u32 _head, u32 _tail, =
u32 size, u32 space, u32 len),
>+                    TP_ARGS(xe, _head, _tail, size, space, len),
>=20
>                     TP_STRUCT__entry(
>+                             __string(dev, __dev_name_xe(xe))
>                              __field(u32, _head)
>                              __field(u32, _tail)
>                              __field(u32, size)
>@@ -27,6 +32,7 @@ DECLARE_EVENT_CLASS(xe_guc_ct_flow_control,
>                              ),
>=20
>                     TP_fast_assign(
>+                           __assign_str(dev);
>                            __entry->_head =3D _head;
>                            __entry->_tail =3D _tail;
>                            __entry->size =3D size;
>@@ -34,30 +40,31 @@ DECLARE_EVENT_CLASS(xe_guc_ct_flow_control,
>                            __entry->len =3D len;
>                            ),
>=20
>-                    TP_printk("h2g flow control: head=3D%u, tail=3D%u, si=
ze=3D%u, space=3D%u, len=3D%u",
>-                              __entry->_head, __entry->_tail, __entry->si=
ze,
>+                    TP_printk("dev=3D%s, h2g flow control: head=3D%u, tai=
l=3D%u, size=3D%u, space=3D%u, len=3D%u",

I think "h2g flow control:" serves as a prefix for this line in the same
way as "g2h flow control:" does. Maybe it makes more sense to place
" dev=3D%s," after them?

>+                              __get_str(dev), __entry->_head, __entry->_t=
ail, __entry->size,
>                               __entry->space, __entry->len)
> );
>=20
> DEFINE_EVENT(xe_guc_ct_flow_control, xe_guc_ct_h2g_flow_control,
>-             TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len)=
,
>-             TP_ARGS(_head, _tail, size, space, len)
>+             TP_PROTO(struct xe_device *xe, u32 _head, u32 _tail, u32 siz=
e, u32 space, u32 len),
>+             TP_ARGS(xe, _head, _tail, size, space, len)
> );
>=20
> DEFINE_EVENT_PRINT(xe_guc_ct_flow_control, xe_guc_ct_g2h_flow_control,
>-                   TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u3=
2 len),
>-                   TP_ARGS(_head, _tail, size, space, len),
>+                   TP_PROTO(struct xe_device *xe, u32 _head, u32 _tail, u=
32 size, u32 space, u32 len),
>+                   TP_ARGS(xe, _head, _tail, size, space, len),
>=20
>-                   TP_printk("g2h flow control: head=3D%u, tail=3D%u, siz=
e=3D%u, space=3D%u, len=3D%u",
>-                             __entry->_head, __entry->_tail, __entry->siz=
e,
>+                   TP_printk("dev=3D%s, g2h flow control: head=3D%u, tail=
=3D%u, size=3D%u, space=3D%u, len=3D%u",
>+                             __get_str(dev), __entry->_head, __entry->_ta=
il, __entry->size,
>                              __entry->space, __entry->len)
> );
>=20
> DECLARE_EVENT_CLASS(xe_guc_ctb,
>-                    TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u3=
2 tail),
>-                    TP_ARGS(gt_id, action, len, _head, tail),
>+                    TP_PROTO(struct xe_device *xe, u8 gt_id, u32 action, =
u32 len, u32 _head, u32 tail),
>+                    TP_ARGS(xe, gt_id, action, len, _head, tail),
>=20
>                     TP_STRUCT__entry(
>+                                __string(dev, __dev_name_xe(xe))
>                                 __field(u8, gt_id)
>                                 __field(u32, action)
>                                 __field(u32, len)
>@@ -66,6 +73,7 @@ DECLARE_EVENT_CLASS(xe_guc_ctb,
>                     ),
>=20
>                     TP_fast_assign(
>+                            __assign_str(dev);
>                             __entry->gt_id =3D gt_id;
>                             __entry->action =3D action;
>                             __entry->len =3D len;
>@@ -73,22 +81,22 @@ DECLARE_EVENT_CLASS(xe_guc_ctb,
>                             __entry->_head =3D _head;
>                     ),
>=20
>-                    TP_printk("gt%d: H2G CTB: action=3D0x%x, len=3D%d, ta=
il=3D%d, head=3D%d\n",
>-                              __entry->gt_id, __entry->action, __entry->l=
en,
>+                    TP_printk("dev=3D%s, gt%d: H2G CTB: action=3D0x%x, le=
n=3D%d, tail=3D%d, head=3D%d\n",
>+                              __get_str(dev), __entry->gt_id, __entry->ac=
tion, __entry->len,
>                               __entry->tail, __entry->_head)
> );
>=20
> DEFINE_EVENT(xe_guc_ctb, xe_guc_ctb_h2g,
>-             TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail)=
,
>-             TP_ARGS(gt_id, action, len, _head, tail)
>+             TP_PROTO(struct xe_device *xe, u8 gt_id, u32 action, u32 len=
, u32 _head, u32 tail),
>+             TP_ARGS(xe, gt_id, action, len, _head, tail)
> );
>=20
> DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
>-                   TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32=
 tail),
>-                   TP_ARGS(gt_id, action, len, _head, tail),
>+                   TP_PROTO(struct xe_device *xe, u8 gt_id, u32 action, u=
32 len, u32 _head, u32 tail),
>+                   TP_ARGS(xe, gt_id, action, len, _head, tail),
>=20
>-                   TP_printk("gt%d: G2H CTB: action=3D0x%x, len=3D%d, tai=
l=3D%d, head=3D%d\n",
>-                             __entry->gt_id, __entry->action, __entry->le=
n,
>+                   TP_printk("dev=3D%s, gt%d: G2H CTB: action=3D0x%x, len=
=3D%d, tail=3D%d, head=3D%d\n",

Same reasoning here: Maybe it makes more sense to do
"G2H CTB: dev=3D%s, gt=3D%d ..."?

With those tweaks,

    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>+                             __get_str(dev), __entry->gt_id, __entry->act=
ion, __entry->len,
>                              __entry->tail, __entry->_head)
>=20
> );
>--=20
>2.34.1
>
