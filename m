Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EE5D3EE91
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 16:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1CF10EA29;
	Thu, 22 Jan 2026 16:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iof9ulmP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BF310EA29
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 16:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769098243; x=1800634243;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vd1x33fA5L0PtyyZrpLarLawg5OPYke3QZQvz95pbOg=;
 b=iof9ulmPxrZvbALTC02ATLncDMz6IKeyg2D90gBRamVU8n1q2JHUKuNE
 GHak5nrqan+4JWWW4QhhOgnFGO2ocGPb8FV8UlVu7hRftnbxbyMGB4UL1
 LEisUw5jBhd+w8YkN2IRw2fS4s+iJZOB21ZZw1aqvXbzRJJ+xCVwVDwlG
 ETaZGe6VQdoCmpileijXAYLk7BcQRg/DzNfVeF8TidsR+bjxosXbtYPIM
 0JD1Fc2Nkg+jGSD+P4LSK41BRoEYg54sTte/HqGEWNN1HRcEVKocJU9ZU
 5xiihXxQ4QNGtspwAVsC/L0z5yJikf88SVfeJbdeNxMJ3A0s29bxgSK59 Q==;
X-CSE-ConnectionGUID: np/6VMSUTSGl1u90mPtK8g==
X-CSE-MsgGUID: cZyvKRyNSRKR7REd/MXT/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70401906"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="70401906"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 08:10:43 -0800
X-CSE-ConnectionGUID: bIWNzpdRSkWq3t83fFvhTQ==
X-CSE-MsgGUID: iM1VzFMvSqyI5oBh2KNACg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="206368825"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 08:10:43 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 08:10:42 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 08:10:42 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 08:10:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UTeKJhVOOfAwjaPV5QvH3hs99EgQqKn00qSSI5yGh5FqgHGq5I1UaDaLN3y6Xo0X2bgot/bFFLTaWoH3awxPcHilN8k+Fi9McKKREHdiHJZ7QQpatgVjposKXGLVwpM+xYT2GHCCqSeflSbgYZZOncPzwDR5z2eeZmBzf6k+SxyQqbMlKZsmVZP9rsq42HT0Qf8x/5+w8qg2IdEizDpPHHRIua3oKjsb3XvAcuRLvy4R9S5LpxTM1ychcrlbmWtpy1fUwogn7IYGV4qsj4IzlM2XPP8CU8IGajt4Tw27ySDavSsKxtzoLjxjRmAbxaxBVbeYewBiB/Uvp4Xx8MFr/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vd1x33fA5L0PtyyZrpLarLawg5OPYke3QZQvz95pbOg=;
 b=feAGZSCaq4VQwrA6qldrDMFmfo1ZJtKBIWG+N076xWd2svduY3rAnWDLgTVKaexCFppthoI9IPKFD7EKvhU4Hdlxn00zTPdpjoKgiNuwS7RTi3AqXB/4ZGg1RYGk7U20eR4CIwGhANlcud7M/7UQQqjMtHAfkvtMAc4szcYS5DBZiXezfISs7iG24jum78rSdXYrPKLGb/He6Thg573EZv10gKPekIhBkd/e6jw+TfA613LKrFkH8J66pf1ZkCIb7cqg2R4ZlQLr9SpTzubbgypWO9PvQmkwlDTc1KOAVk1yhrjVPXQhW8wXw2ZQdiriCqvhIqItWBYA2phTJjGtnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 16:10:39 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9542.010; Thu, 22 Jan 2026
 16:10:39 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH 2/2] drm/xe: Log module init failure as error
Thread-Topic: [PATCH 2/2] drm/xe: Log module init failure as error
Thread-Index: AQHcizIIRHevSk73KEOlj5BzZPVXubVeOwSAgAAgvMA=
Date: Thu, 22 Jan 2026 16:10:39 +0000
Message-ID: <DM4PR11MB54567D47F88A62515F30A856EA97A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260121235618.3138251-4-shuicheng.lin@intel.com>
 <20260121235618.3138251-6-shuicheng.lin@intel.com>
 <e943863e-ddf2-4fc1-bfd5-008219a73356@intel.com>
In-Reply-To: <e943863e-ddf2-4fc1-bfd5-008219a73356@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH7PR11MB7608:EE_
x-ms-office365-filtering-correlation-id: 6dd9aa3e-1630-4c36-5999-08de59d0c91c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?UXp5bVNJQWd5SEg1c3lPMEQ3eWpjdHNYblN3NDZyWXFqNUVYbUVibnV1NUYw?=
 =?utf-8?B?OEhKTlFlakRWZmttQUZIWDBJaEtvYTlvV3B1L2ErSlNjUVEyZ0ZLbGR6TDVQ?=
 =?utf-8?B?MHMzaHZwMFVEQlU0d0pnb3M5d0xKOXRiTjkrei95czg2cThnaTRQMDhZSUdJ?=
 =?utf-8?B?NXZyREorckNodkZRNTdJV05FZnI4a0hWRGxCSUpNaTcrdVVFWWxzOGEzb2Fn?=
 =?utf-8?B?aWNCdUlVNUZnMFNVdHpIa3RwOThJQWhoTFFDZTVjUVhuV0Rqc2pMWXdhZnBt?=
 =?utf-8?B?VTV4dGNhYjNIQVNKbkhjNEZ4UVF1QWsvNVlmbmZGbHdCbVJ2R29RYjhiOEFi?=
 =?utf-8?B?eFZOeVpidXByb0I2Z2lBWkYrSG1KMDY4RXU3YW4wNitiYU5Felh3NnJBZ1g2?=
 =?utf-8?B?ajZ3Sk9tSlhHK3FUaCs2OEd3ODgrRzR1QldobXZqNng0Mm1Qb1lzNEtjUUNF?=
 =?utf-8?B?YlhWR05Xc1N2ZVlpNmdsQllTdnZYME1vSDd1b2l5emR0YlRNZkoySmxiWkpN?=
 =?utf-8?B?WFNBaHE1Y001SUlrSERIU01IajBQeWR0OGUyYTZaMEw4OWxXZC9jQUpybVdC?=
 =?utf-8?B?OEdJOUlPLytJRExuVjk2Y09XN1RKaEhvNW9Pc29leG02Z3JaNnl0dGE2LzVa?=
 =?utf-8?B?SnhENHp3L0Rhd1pJQlQwakpxSTd5aTNrdDFGSzZOUmtkME83TFNPUU42b05G?=
 =?utf-8?B?ZnF6QTBycnh6S1lHbUFMdnEzcmREOFdnSGZUWk9ITEJiS1pucVhzWHM3Nkl3?=
 =?utf-8?B?NTFOM3BuRnpzRkowbFdvTzQ2b09Icjk3YUlPRVZGd0J2ekcwNzdYS3U4a1Zm?=
 =?utf-8?B?Y01CVEJBVmR2bk5qOGJvRnhuNFZaOXJySXdKcjFSOUpNZVN6NTNOdmZGd0oz?=
 =?utf-8?B?RFprQ2huYWloaWlSVm44Mmk1RjV0dWVoNkhHSTdReStySG5WYWNoYUpPb2FS?=
 =?utf-8?B?VkowdXpnSjlkalZsK0JlSVA2aEhVT3BpL2FKSkt3U05yak5HU0JKcDFYUlJ5?=
 =?utf-8?B?bnRPOXNhZVBZaEEycnFUWk5pSUVOc1FHT25MVHhWNE8vazRLL0xKZ3hTVUpB?=
 =?utf-8?B?d2E2bk45QzQ0Si82ZlBrK09FK3NKZ3FXZEMyT0phenczZXA0amZEbWFlc3R3?=
 =?utf-8?B?NmhMOW1KZjBpdzFxbjJXTTBuL0p6ZCtWUDRTV1Q3ODRmV1JwQXRqd1dtOUN2?=
 =?utf-8?B?YzJXaTMxZUc0MlhaZ3FvOTMzcytGTjg5b244dEdJRlYzd1hVVVJCUlh4bHVD?=
 =?utf-8?B?U3JGcEpJdmlkdjBqU1E0WW8ybytxMWRHWStyQzdaTVVNV01DRVFYNHRBaFp5?=
 =?utf-8?B?Wi95SStDaU1nZDgwTVlYRXpoeHI3MnRiaDEycTZSWjZKbytYakkrMmJId2ta?=
 =?utf-8?B?b25VNmVTYmwwVCtkSzFsb3ppTGRCRStkUzRxeHdteWRsdFhtampWTS9McTRi?=
 =?utf-8?B?eEJheFREb2MybGxDaXZaVDRTNlZzRk5iREh0MnIxMjhjbHY4VkRMU1gvZzdn?=
 =?utf-8?B?UkhRb3NuMjVUZlluL3Z1TExvTW1GS1VuOEoxU0I4TkU4NzVYWnYycmhLNk51?=
 =?utf-8?B?UUEvckY0QXN3WHZ1UTFwY0xUa2dTOFkrNnc1SWM1cWR0TVI0TVNnUUk1Zitj?=
 =?utf-8?B?dkc4dTNCS0o1WTdjM3Jud1lBRGZudkhzYTJONER1ZTArSFZyRFM3dDlQU2kx?=
 =?utf-8?B?NVo5cFN6d0k4V1BQT1NpTHhUcjN4c0I4VHZ3UG5hSC9lNGRremswQmtsU3Bm?=
 =?utf-8?B?T3JiU3ZLTTVDNVJxWVIvRVpQc1lnZVI5dE91VTJZaGVJc1Z4MmlKRDM0TkJC?=
 =?utf-8?B?eit6ek5aRW5zZFNLbXJmMkpxbXg3eXBDbjRNYVQwMUVYSGt0aXMwVDk3Z3pH?=
 =?utf-8?B?VHFlVE1ML0M1RWIwWi8zNHBMd0ErejhZNWVXMk5RbkFuTEc4NXJ1ckdZb2pr?=
 =?utf-8?B?NGYybUVmSm42enVmUHI5Y2gyZ1IzUkJtWU1yNEZjQWdaaDV6RmNnVmpSbFdE?=
 =?utf-8?B?UFl1NDZSbTlyTkFHN2VqTTVjYkZ4SzhKMGtEaUxRWEtHdElmNTNrTDNaSDJU?=
 =?utf-8?B?Tm5HMVpKWjQ2U01tTFZxOXhESldFdWtwTlVMcmFoZldlcEVPTU5jQTFFcWRQ?=
 =?utf-8?Q?2fco=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2NneVZlN3NkbXUxYi93c2czckVjbXRrU2JVL3BjR2FoTVZQYVZ5RVcyMEly?=
 =?utf-8?B?ZmtJTFhudC9UOVF2RFRFaVFCTFZCeloxaXNUYmQyVmo0UkJTeXhubnlEcVFi?=
 =?utf-8?B?WWY0am12ZGxLN3o4VjFybzNpYUs2QVN2MjJ3ZWZVVHhaU3Nld2pRem9CSTIy?=
 =?utf-8?B?c0lSMW5Fb2Z3Q2xJSFM3YmcyY09FeHlKT1ova0k0djRFUjZYelVpYnZKSVA5?=
 =?utf-8?B?d2NDZU9sS0loOGx5Tms5MmZscTg3eEJBNXFvMjMrMVRNL2RUd3FvZGZmWUxS?=
 =?utf-8?B?TlYwYzJIZnVGTDNXZ3c0NTU1Z1R2b3lxNGxTSG5pbWZ1QnM2UE9HQ294V01V?=
 =?utf-8?B?SWhYbTk1RDU1d01JYVNMSGxZUHFkVnlzQ20xbHVzakQ3OXlSUDc5WlJtc0Nw?=
 =?utf-8?B?eU04bE1NTnBlYUpLMHFsNkY1ZXdveTZ5L2hwclpQbEFvckNPS2wvbkZTWExx?=
 =?utf-8?B?YjRvTHA0YVF4YW8xWlB6emxkcFNIRUp1QzcwWE96bEt1Tmhxa041cFZxQWFo?=
 =?utf-8?B?ZHg1T25xSEtBU0hYdk9IVHFhcFBudDFFcm5RaXFrMDdYaFkwTCttSStJdW1M?=
 =?utf-8?B?MTZsczVDRGxKUlB1ZEZrQkQyN2JsOCtBdEYwOHVkc0xVbUtlZWs2ZUIxajVI?=
 =?utf-8?B?ZktUelVoR1huUnM1T0R5N1BvNEE3QklOWG9xWGt4TExSYTZManp1WjdXcmJr?=
 =?utf-8?B?alYreW9Lc3FWV282ckFlRVlUb3F2cEtjV3FPQkhnV254RnYvRTI2RUczU1lE?=
 =?utf-8?B?a29XSjgxOWt3ais1cGhTUjJkWXhPMW5jK3k3cDI3RFBjcFZINXkrSGlmclRp?=
 =?utf-8?B?YnduaWI0Z0MxRlZ0VUFVT0FhQ3JBaGNlUS9wUmk1OUl4ZFRuZGRNRms1WmUw?=
 =?utf-8?B?N3hTekY5VHN3MS9PcURCYkRMd2V5Q0lkYUhGZmcrNHVTbXRhZ25vdGVHVzNU?=
 =?utf-8?B?UmpNR1kyV3FjQnRWZTl0dmQ0cWN1NWp0ZDVwU0NOSE56ZitERHBmd21lb0gz?=
 =?utf-8?B?a1pFMWxMUUVueW1MN1Q5eW1ZbHArR2NhalBtcDJkZ1VWb29kZmQvenlmRUQx?=
 =?utf-8?B?aEFWTS9abjZpN0dzVWZGMFVGS3VxU2FVN0xJR2pFV1Q1bUJkblhNU29EV1Yv?=
 =?utf-8?B?V0ZDaXRkLzdsWng2eDByb2NVZXdVcmlhQm9GMklmb1FLNnFWYms0M3JaazdR?=
 =?utf-8?B?Qmt3OW9IZFNYWDVOYVpsa29md3RVc0JzNUlacHdlWk85OVZwTjJ2bVVOTU1i?=
 =?utf-8?B?S0ZubW5scklKNExmcjgraFVBeTZUMUFsWG5IMTJlcERJemNGZ3R0QW9vRm9C?=
 =?utf-8?B?MFRtRDh1WldmRm5Dc3IxeGhZL0tCVTBHNFBVK2JaNm1RR2FyUUhjcjcvdWpr?=
 =?utf-8?B?TnhNbVZua2k3RjBtSXhoVkV2SnR5aHRGNFZXdFRCOEUyRnlnMEJpd29ydmVT?=
 =?utf-8?B?RzkzMHcvZmliVGFKRW5aRE45ZkIwQTBWNjdzdzJZN1B5M1ROenRUT050ZVV6?=
 =?utf-8?B?TXAvMmU2R0NPdlVuYW9qendkNDNGeDRWbk1oNTA0dDZnQWRuSVZCQ1dldmM5?=
 =?utf-8?B?c2orU1crWW9sMll4akkwdmlaL3Y3cWhVTEZ4YnhzTDFqK3lxeVFLRmJHdWlT?=
 =?utf-8?B?TExoeUhha0ZTNXRhT2RyLzZxa1RvcDdlU1cyR3ZPYlJxUXE1L1BrNk4wTUNq?=
 =?utf-8?B?eDRucXplMG16cHJFYTQ0Sy9sdHZvblBZVkpUaUFMbVNIWUh0YS9jeFJRL1Nj?=
 =?utf-8?B?dFRsQk1GY3l5UTBvNG1ORzFPdGdRQkN6cXNDempzTGNRTEREcXR3VUFmc1gr?=
 =?utf-8?B?NCtBN1lqeXZ0Z3JlMkZsUGRmSW1ndEZSZFdiamhSTjlQc3dxanZMeE1oZE9t?=
 =?utf-8?B?NElwNnNxd2pwQlpuaGo0czlRNm04Y3BhaWFZUWJjWWFUSm9ldGlDV0xWNjhC?=
 =?utf-8?B?bFQ1ZmJPN3hPWkZleTlvYk5VanEzZWpFVitTbFJuYm5jMEN4NEJPS1VTcWt1?=
 =?utf-8?B?Zm1zbkVXbC9xZmNsTlRzelptTjlKeW0raFIzenhOY21BTUN1Vkk3THdTb3Vw?=
 =?utf-8?B?dUdoSjB6bzVBS2s0UTVndlcwdTVkcGhZb1ZwdXdxUnJJNVY4MDdaUjFaaTVH?=
 =?utf-8?B?RnhQd1ZrWWUremhybVNzekp2M2xsTkhVNlZ6L2dzQ3VONEg4WlJueU1kZCsw?=
 =?utf-8?B?Q2hBQmNyUXJsMVBDMFRyQ1M3dVJXRkdyT3praWwvcmJHSkVpdHRZK0VpcWFJ?=
 =?utf-8?B?TStqT3NrZytYVmV0OVh3TTh1Rno2aDJkSW1qOVEraWdwaEsvTWxvTGRwZXRL?=
 =?utf-8?B?N2hkcTN5emlvVmpmZXBGaURvZ1B6ek1sMmdnVDdGMEF0bnNkNXJ4Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd9aa3e-1630-4c36-5999-08de59d0c91c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 16:10:39.5191 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DYeceYaGkAjNInQXGJDae8Eul2qCptNMwaVKgmCrV2RntlVvellAiBOOkvY4IQB5F2pDPgRaI0Id4Rv0MLQkcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7608
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

T24gVGh1LCBKYW4gIDIyLCAyMDI2IDY6MDkgQU0gTWljaGFsIFdhamRlY3prbyB3cm90ZToNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogV2FqZGVjemtvLCBNaWNoYWwgPE1p
Y2hhbC5XYWpkZWN6a29AaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgSmFudWFyeSAyMiwg
MjAyNiA2OjA5IEFNDQo+IFRvOiBMaW4sIFNodWljaGVuZyA8c2h1aWNoZW5nLmxpbkBpbnRlbC5j
b20+OyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+IFZpdmksIFJvZHJpZ28gPHJv
ZHJpZ28udml2aUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBkcm0veGU6
IExvZyBtb2R1bGUgaW5pdCBmYWlsdXJlIGFzIGVycm9yDQo+IA0KPiANCj4gDQo+IE9uIDEvMjIv
MjAyNiAxMjo1NiBBTSwgU2h1aWNoZW5nIExpbiB3cm90ZToNCj4gPiBNb2R1bGUgaW5pdCBhYm9y
dCBpcyBmYXRhbCwgc28gbG9nIGl0IHdpdGggcHJfZXJyKCkgaW5zdGVhZCBvZg0KPiA+IHByX2lu
Zm8oKSB0byBtYWtlIHRoZSBmYWlsdXJlIHZpc2libGUgaW4gdHlwaWNhbCBsb2ctbGV2ZWwgY29u
ZmlndXJhdGlvbnMuDQo+IA0KPiB3ZSBoYWQgZGlzY3Vzc2lvbiBhYm91dCBwcl9lcnIgdnMgcHJf
aW5mbyBpbiB0aGUgcGFzdCBbMV0gQFJvZHJpZ28NCj4gDQo+IFsxXQ0KPiBodHRwczovL3BhdGNo
d29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNjY1ODgzLz9zZXJpZXM9MTUxNzczJnJldj01DQoN
ClRoYW5rcyBmb3IgdGhlIGluZm8uIExldCBtZSBkcm9wIHRoZSBjaGFuZ2UgYW5kIHVwZGF0ZSB0
aGUgcGF0Y2ggdG8ganVzdCBzb3J0IHRoZSBpbmNsdWRlcy4NCg0KU2h1aWNoZW5nDQogDQo+IA0K
PiA+DQo+ID4gQWxzbyByZW9yZGVyIGludGVybmFsIGluY2x1ZGVzIHRvIGJlIGFscGhhYmV0aWNh
bGx5IHNvcnRlZC4NCj4gDQo+IHNob3VsZG4ndCB0aGlzIGJlIGRvbmUgaW4gYSBzZXBhcmF0ZSBj
b21taXQgYXMgaXQgaXMgY29tcGxldGVseSB1bnJlbGF0ZWQ/DQo+IA0KPiA+DQo+ID4gU2lnbmVk
LW9mZi1ieTogU2h1aWNoZW5nIExpbiA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+DQo+ID4gLS0t
DQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9tb2R1bGUuYyB8IDYgKysrLS0tDQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21vZHVsZS5jDQo+ID4gYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfbW9kdWxlLmMgaW5kZXggYTAwNDhmNjRlZDEyLi4zMzQ0ODExNTg1ZmYN
Cj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW9kdWxlLmMNCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW9kdWxlLmMNCj4gPiBAQCAtMTAsMTMgKzEw
LDEzIEBADQo+ID4NCj4gPiAgI2luY2x1ZGUgPGRybS9kcm1fbW9kdWxlLmg+DQo+ID4NCj4gPiAr
I2luY2x1ZGUgInhlX2NvbmZpZ2ZzLmgiDQo+ID4gICNpbmNsdWRlICJ4ZV9kZXZpY2VfdHlwZXMu
aCINCj4gPiAgI2luY2x1ZGUgInhlX2Rydi5oIg0KPiA+IC0jaW5jbHVkZSAieGVfY29uZmlnZnMu
aCINCj4gPiAgI2luY2x1ZGUgInhlX2h3X2ZlbmNlLmgiDQo+ID4gKyNpbmNsdWRlICJ4ZV9vYnNl
cnZhdGlvbi5oIg0KPiA+ICAjaW5jbHVkZSAieGVfcGNpLmgiDQo+ID4gICNpbmNsdWRlICJ4ZV9w
bS5oIg0KPiA+IC0jaW5jbHVkZSAieGVfb2JzZXJ2YXRpb24uaCINCj4gPiAgI2luY2x1ZGUgInhl
X3NjaGVkX2pvYi5oIg0KPiA+DQo+ID4gICNpZiBJU19FTkFCTEVEKENPTkZJR19EUk1fWEVfREVC
VUcpDQo+ID4gQEAgLTE1Nyw3ICsxNTcsNyBAQCBzdGF0aWMgaW50IF9faW5pdCB4ZV9pbml0KHZv
aWQpDQo+ID4gIAlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShpbml0X2Z1bmNzKTsgaSsrKSB7
DQo+ID4gIAkJZXJyID0geGVfY2FsbF9pbml0X2Z1bmMoaW5pdF9mdW5jcyArIGkpOw0KPiA+ICAJ
CWlmIChlcnIpIHsNCj4gPiAtCQkJcHJfaW5mbygiJXM6IG1vZHVsZV9pbml0IGFib3J0ZWQgYXQg
JXBzICVwZVxuIiwNCj4gPiArCQkJcHJfZXJyKCIlczogbW9kdWxlX2luaXQgYWJvcnRlZCBhdCAl
cHMgJXBlXG4iLA0KPiA+ICAJCQkJRFJJVkVSX05BTUUsIGluaXRfZnVuY3NbaV0uaW5pdCwNCj4g
RVJSX1BUUihlcnIpKTsNCj4gPiAgCQkJd2hpbGUgKGktLSkNCj4gPiAgCQkJCXhlX2NhbGxfZXhp
dF9mdW5jKGluaXRfZnVuY3MgKyBpKTsNCg0K
