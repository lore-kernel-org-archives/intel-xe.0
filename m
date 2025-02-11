Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E00C0219B
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 17:33:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E183B10E732;
	Tue, 11 Feb 2025 17:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QSzq4lMU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2AC910E732
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 17:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739295220; x=1770831220;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ldpy8pbm6ZfytpjuryFOPFWLpFrKkWwhdRf/YFwiJgk=;
 b=QSzq4lMUgg1PCZSQJd33cRbuD38tNVHhiLOxessLWspg2lwmhXdz2PoE
 RU4poTfcID9lzE+nc08sHHUDvVLsya7ohKtloP9FUsjnYse2eliBZMqaA
 K0GlQOHdWF+ROLQQwLmrH6WyRq6lsF5SmmpXcqV2vq6iJbSfHv/neZ8Wa
 T7vGDlgUvaxEGedvfrSIpeU5V1bNs5l2V55SoaszPFwe9vfsBICIFXQ1d
 OE4zIPvsMuqScbDx1YmMnFpnuBSWyU0SDAbA+XEu+LYupVaEwdqukxONa
 XK9e25pT3avxx3U7TDtX+BtAvDZ0aJfRQ7mmUKH4zDnI0rdnfKpLDrspj g==;
X-CSE-ConnectionGUID: BnQq+WrbSYC3x5TiA9M8Aw==
X-CSE-MsgGUID: hCVB4288Sp6qL2MC9qmR0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39841125"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="39841125"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 09:33:39 -0800
X-CSE-ConnectionGUID: IsucDXFRQei1PfW62eCCzw==
X-CSE-MsgGUID: D19ihZA4RbKGbdMmxHenrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="112409874"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 09:33:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 09:33:38 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 09:33:38 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 09:33:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GO1i3nUZElIywlZZ0DxRwAHtwOA4C5cYKcGxsdDKneFUSgYvnWqe/yHgcsoNCyWtdz5Z7xKHe+LcFEOinuZfKnMOMSbo8VIiMCRegAjz1u2LsOTz2LktxDQParBq2fxtVOyKeOnqvUicmXde+hzPHv7RsSJlEmPkQZgJV8Bhir8CsZEzyv7vJlRFQpK1vG6Eh8G1LAbAZpwA8bo81FpnrgDxxC/Vq332oVTUiTrsoiYoVkOeUkbipx9CRprLokVZn3GHkCSp8wRGoUbQgBGho4PWm3SNaf4D6e6znMrAls1uCqwuHjWpSscirynRy53E49sMJXZXfR1FcVnWU4EvHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCApene/vo7fYhgb/9179E9hucRXZzVN2mJwZMeEhDE=;
 b=MieynQntNDOiYP97URx58HKCJMLZFXJg9l0b1Fm2BpTDAtEX3lr0U/Ubozcs5U4Uc1lJhUGoRge2RuVZYmm8LpTMBiqjTaIBfLUvj8RObWI8iP4ryrC31jkB5fxSL0R7+3sFQKe0zLnCClHgdI02wZv7qtj2CP6OA9O7j+JrF5gRZXQFwQr5k07MPr+4T3F5TiFVNZ40uPGYZb1x5AsAdOB0ReKvfFsKtimgMx1Ej84043Mk5CBaPi6nh70JK2zGm6VL22w01X007Z0drCpS1dr25AoDc3nm8YbY9Qd8kads1U672M7GpLpGggswvAsRcbzTdltAk+pZV/a0rEiX6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by BL3PR11MB6340.namprd11.prod.outlook.com (2603:10b6:208:3b4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 17:33:35 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 17:33:35 +0000
Date: Tue, 11 Feb 2025 09:33:32 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v5 5/8] drm/xe/xe_pmu: Acquire forcewake on event init
 for engine events
Message-ID: <Z6uJ7KEtAwPmqpsL@orsosgc001>
References: <20250206104358.3436519-1-riana.tauro@intel.com>
 <20250206104358.3436519-6-riana.tauro@intel.com>
 <ad580886-537b-4026-bc64-781efb182148@intel.com>
 <8ae02a6c-4459-43f6-8db9-95bb9a7cf898@intel.com>
 <71fed9a8-b8e2-4a38-bf2c-c328eb2d4673@intel.com>
 <Z6aXw52sdI+3KnyT@orsosgc001>
 <31dcd451-70b1-4142-aad0-2cea371f8d2d@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31dcd451-70b1-4142-aad0-2cea371f8d2d@intel.com>
X-ClientProxiedBy: MW4PR04CA0106.namprd04.prod.outlook.com
 (2603:10b6:303:83::21) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|BL3PR11MB6340:EE_
X-MS-Office365-Filtering-Correlation-Id: 5472fa45-2b6f-45a7-1670-08dd4ac23614
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dy9VcnZ1WG5LMTNzRmwvbFpOQ3JhQTlGTDBkTHZwS0VJbEV1WEkwcVhrdTZw?=
 =?utf-8?B?SCtnSXZMLzU4dkJ0TUcwNjAvM3hTREZPNC9EQ1JiZUxTOG9NWmFJL2MyTTFX?=
 =?utf-8?B?anA0SjJZQVFRTEZQR3l6VzYzTWhNUWdsVDg0RjF3bVVyaSs0QWJLUGpVNVYz?=
 =?utf-8?B?N3hXbnFNN3Z6Z0U4ZGMydUk3bGJXZDFMQitnK05vNGYya21uUzBaYWx2Q0FK?=
 =?utf-8?B?dy94ak5YRXdzNXVaQkNrWnVweHpUY0FBWE5DdHJzYzNuWGExU252SHEwZ1pF?=
 =?utf-8?B?dktRRjRESGJHak0wbWMzY3JNbjVRTmF4R0c1aEo1dXBRZFNTQmFQaFBQcS9a?=
 =?utf-8?B?NnI3eTZZZ2dMbGZZU3FDajlWem94WUZBOU1HaHB1cGpsd3dPdklaOVVGMFMy?=
 =?utf-8?B?di9yTGFWNHA5MllVdjNxL1NKMlBXb1doNTMvOXFmZjlwMjY5SlVMK1ZGZURM?=
 =?utf-8?B?Uk92YzI5ZTJGYk1GclNhZysyb2JLMWxtdUh4Ky9NRVFJMUZsWFQ0YUhwTWVB?=
 =?utf-8?B?cVlrNmpiQUhhSHl6ZU8zWklTbU9SY2RtRTlHU0k1d0Y1ZGN6Skw0U083VGF2?=
 =?utf-8?B?Z3VuZytLVms4dUZkK3NISG9Xc3N5ZzFhSEtQOUlVQTV5UWltcDRuTEVpQWhX?=
 =?utf-8?B?RWU2Z0lCMFEwUEFZUVN5THJjMmJQN0xlUUNKU3RGSXBxSEtySEFSSWt0bkJJ?=
 =?utf-8?B?bjF3ZmM3Vm9tNm13NzlQYytyczNMdWZrUHh2UjFMQnR6ZW0rRTgrS0RlcFFY?=
 =?utf-8?B?T0huekFtU2J1Y0J6clZVMlE0OFpVc1JmVFh3UFJkMkFyMmR4a1JKTGhoZU9v?=
 =?utf-8?B?MklBKzgvWjBZNDduUENFSnEzQi9XVmpxMkNLaDB0Y0dGd0I4T0xNbFhoUUtL?=
 =?utf-8?B?bzNIVkt0UmNkeTR5RjhaMjZRN3FWWkVNTi93bmY3TU5qbDNPTFVBMmdyWDg4?=
 =?utf-8?B?ZG9rN0xsUG96cHp6L1A2ekFkeDhSRFg2WTJoSEQxQkwrN1JPTEJKMm5CckpQ?=
 =?utf-8?B?WEp3Tk1mRzB5VFBzMnh0TFRXdXlpaHZCZjM4RnBLK3BMY2ozeDVEQ280T09y?=
 =?utf-8?B?QWtQeEZvZHlhdkMrR3ZuaitWSWJqSTQwKy9FckhtMmhMajMrWHF3NjNabFVF?=
 =?utf-8?B?Mk5tQk5pa0tMUWlVNjdJemlQRXA1UndSVGhLWVdjeEF6Szl5VHFVZmVYY1hN?=
 =?utf-8?B?cm5INmpGK0xmc3dNVWtWY1docFYzcVZORnR1TXNPOFBrZkh6eVJBTXRFUWJu?=
 =?utf-8?B?Ui9Lc0sxZGNwVEJsRGRzZXNCV040VGtocFJhYVVPQVdCdm1seDNiM25qWE1G?=
 =?utf-8?B?UUJvT1BmMWJSWk9FTDUvU0JhYjhZOXJKbFloZ010MTFNNVZMZDJlQXFWMzQr?=
 =?utf-8?B?ODV1S2pJMHgrblZheHZydUFnOFdxd2ZCd2VMN2p2Wlp5bkpKdHJGaUhjWlc5?=
 =?utf-8?B?SjhuVWJQMzg0U2lvU2djUHBmZHc5TGVVb01ObVZEbTNjZG5QYS8vNVlZZGFB?=
 =?utf-8?B?cFgwUDRvSmR3b1I3VlJUUHI5a3Rocm1qSHNsZzhoL1UzT3l5aDg3VUpJWDFs?=
 =?utf-8?B?SkRjQjQ5T0NEZ2czN05pZkVicEVmcnZaYkhkWEFxSFN0UEFKQ0V5TnNYZTZk?=
 =?utf-8?B?SXZlaGc4SVA5cVM2Ti8vb0pOenFUN1JKdkk3clJaOWRVUGE4V1FsTVE4TTJv?=
 =?utf-8?B?VFlCZCttc2pvSVAwUGxOYTBiK0V3cmJld0RER3lWREFCdkV5bDBtalpHKzl1?=
 =?utf-8?B?MVJ4ejQ5eFp2OStZcTlFWUU1ZTFHVFdKc2RoMjB5WTBXNldyWWI0VVpUUlht?=
 =?utf-8?B?bzVjOGpIWDNKRFZ1VXpDMzFZNlRaUlN0V25rb1l2WE8xV1pZdHcyWTlweldv?=
 =?utf-8?Q?QL3vcCqqiZJ6n?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEdQeC9oQjBzSG9PeTM1eGkrUUMweTVVQnFoNTdGd0RHZExLZ29sOHlRckEv?=
 =?utf-8?B?SEorU0h0ZHlHaVJsdzdQbnZqc0NoaWI3bWRpZCsxaHVGQ1ZSWURCMldxTXZm?=
 =?utf-8?B?OWlBUlhmOGlqRU8zYlVkUFlQdHc2SWtyUS9NdVpIUkxWWUtmYy8yekkrQ3E5?=
 =?utf-8?B?NTYweDVrZ2U3WWVYRVpSZkpyM0d3czRtU1N0b3BwclZMdmV6TjJ5NU1vbnpT?=
 =?utf-8?B?T0JaaGpVeVlhMEJoT3lqc1kwL2U3a01NeDZWWFliOFQ2WVRvMnQyWGdsMXZ4?=
 =?utf-8?B?M1ZYMlpGSFhiTGlyQnFXZlBQVENjeEVyQ1FBb0RQZUs2eFpWQ3hhR3BMMUdi?=
 =?utf-8?B?bUxpM0gwQnRhMmRQVDVyL1o0b0dES3ZjMWVoK2lTdGljVzgwRVhWeXZZU3pB?=
 =?utf-8?B?MWJqR21ReHdJcCsxMUYvaTlsTzNJWDVpTm5aTjZ1RXp5SjVCV2kwTDI1UGNw?=
 =?utf-8?B?TnIyZDhLekJIWDJmZWFjVWUxOEE2Q2wxYXZRVXViYlNzNG5JQnRlMDF6MGt4?=
 =?utf-8?B?Y0h2V0hEdld1QXZtWTFpdzlzY2NNeGtuVC9RcTJ4a21xQUozMXF4d3RZd1ln?=
 =?utf-8?B?Vk9PWnhJazQrNEZWYVZnNUV1azFUUXluUCtBMlU4ZUVtUHFrbStoY0dvNEsx?=
 =?utf-8?B?UXlYZDVuUVNJMEJqaXNkbmtuWVB4bzlkK2dtTFZnVW5WVndDWGJkR1JrQ3dB?=
 =?utf-8?B?OHJETytHc2N4ZXpGZmRBNm9lRm1KQ2Q3WnZkV1Q4Q2tpcnRLT2pjbG9KRndm?=
 =?utf-8?B?SGhtMFpHaEFxSkNlSFZyNERubi9WdHUrMTB0NTBUeXRzSDRNaU5qYUhuWUcz?=
 =?utf-8?B?ZHIxZWhoK3BoMTJPMkpNRDRMZlNtT3BCMmlXNUJYaW9XVWk3MnBLVFZqQnkz?=
 =?utf-8?B?dkdWWHQ2emE1VzlMSmo0UitIU3Z4alFmQVpLVUg1V0QrbWtGWXczL3BpWldh?=
 =?utf-8?B?bmIyV1dwY2dKa3NPOEZ6dDg1dTBETGlQZEM0NW94RU5ocWFmU0JnZU9OQ2VO?=
 =?utf-8?B?VTVneUo5R0VVU2QvZFBaaDZJUnptbUlEYkpxL1FUUk5pVjRaMWFVbGMrSThG?=
 =?utf-8?B?MGl3QjVFKzVONFlqL3lYMXNvTWxFQjBXQnprT1ZDaWRBVkVwYWNXZkJvRDZr?=
 =?utf-8?B?bkd1dHgyV0luMDB6SnlVcWFZeW96b3p6YWdhMFJLczdFaEl4OXdMbFl2dzFE?=
 =?utf-8?B?S3BKaHJ6UTdUdGgxN3JUb2pQYUNaTFI5RFMyRFBGYmRnV29vRG1IbitBNTBl?=
 =?utf-8?B?T1E5cE1TQ1NDUU1EWlppK28zK2FXNjVSbnVMMEZsQ21EbXJGcklDTW5RbWQ3?=
 =?utf-8?B?TDV3Ky9wQjgwQlNoNjQvVlFkek1GWjFCTjRBbThJQTc4WGhjczlyalVwalN4?=
 =?utf-8?B?bDF5dy9GV1hsbVNjbnNMVU1YTUVQaTVPRnozMEdjTW42dkpDaXpTdHQxR25u?=
 =?utf-8?B?OHlEODhCck1UOUlueFZ0VHlxWGxvcVYvbzNpWm1yTkxCSmo1OFR0eHE4Qmpt?=
 =?utf-8?B?KzY4bU45T1EyVG9aVm10SnNHSUxGL3dCSDhnWUFmN3YvUWlFU3JHeTViTUlE?=
 =?utf-8?B?ZlhrWjUzNVh3Tk92eWxCODFPS3d2MmVwaGFJUUFQYU9VS0RxR1ZNN3hENXJ6?=
 =?utf-8?B?YUpTUFd5bU9VVCtJQVpaVlhEekxyWjROS2I3R1F5blBoTCsxOEJFdFV3c3M1?=
 =?utf-8?B?bkpRbGQxMFUzRFJydTBSVmt6UXFLUzdldktFYlpONzhIQmlxTkw3VjhBT25s?=
 =?utf-8?B?QSt4YUlRRzdyOWYwZnJVZVlJQVVJRnRxNWhYZkdXV2RUOVV0OERKWU5sVnNL?=
 =?utf-8?B?ckN1YmtXS0hXcGhDSzh2dVNTSEFZbG9CZ05yaVVPK1VCMnpuNmk2bTQ0bDkz?=
 =?utf-8?B?WjhiY2Nvb21IUWNMZ2lKZG8zT043QUQ1UlJhL2c3eHhDdXlmeGMxaEgrT3VR?=
 =?utf-8?B?cjRtM2VPY0xxQTJSUTlOR2VpK1FiSmZPRUM1NFh6RDZicVRtdkMwMWJucG1S?=
 =?utf-8?B?MHZrZzhrZnpheTFITk5QeWJkK3FkMnFXSStmTHUrWkd2S0kxRXpXS2xtN0d5?=
 =?utf-8?B?enk2SmM5RkFad2I5bUhGQmhNVTg1L1BGT0plSkVuM01KdmRwdituQXRWYm94?=
 =?utf-8?B?QTJVa0oweXhIbDBOcVZQSXFGNUJiV1lXMUdaUVdGbG9XRE5EV1BZRE1QTFZS?=
 =?utf-8?Q?o4TTS87Y9uMhGFg4hktkjGc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5472fa45-2b6f-45a7-1670-08dd4ac23614
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 17:33:34.9904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fGKtO5fBe+Yi8XPrbSMMyIdX8a1s78ubs2fMf6KDSqmTvnRhMI2z3512XHIngCpmSeqTU963O1RT8qwjgb8vi9ITc37oZpqGERBmk1pNSJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6340
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

On Mon, Feb 10, 2025 at 03:50:00PM +0530, Riana Tauro wrote:
>
>
>On 2/8/2025 5:01 AM, Umesh Nerlige Ramappa wrote:
>>On Fri, Feb 07, 2025 at 12:21:24PM +0530, Ghimiray, Himal Prasad wrote:
>>>
>>>
>>>On 07-02-2025 11:48, Riana Tauro wrote:
>>>>
>>>>Hi Himal
>>>>
>>>>On 2/7/2025 8:39 AM, Ghimiray, Himal Prasad wrote:
>>>>>
>>>>>
>>>>>On 06-02-2025 16:13, Riana Tauro wrote:
>>>>>>When the engine events are created, acquire GT forcewake to read gpm
>>>>>>timestamp required for the events and release on event destroy. This
>>>>>>cannot be done during read due to the raw spinlock held my pmu.
>>>>>>
>>>>>>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>>Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>>>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>>>>---
>>>>>>  drivers/gpu/drm/xe/xe_pmu.c       | 47 
>>>>>>++++++++++++++++++++++++++ +++--
>>>>>>  drivers/gpu/drm/xe/xe_pmu_types.h |  8 ++++++
>>>>>>  2 files changed, 53 insertions(+), 2 deletions(-)
>>>>>>
>>>>>>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>>>>>index 06a1c72a3838..5b5fe4424aba 100644
>>>>>>--- a/drivers/gpu/drm/xe/xe_pmu.c
>>>>>>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>>>>>>@@ -7,6 +7,7 @@
>>>>>>  #include <linux/device.h>
>>>>>>  #include "xe_device.h"
>>>>>>+#include "xe_force_wake.h"
>>>>>>  #include "xe_gt_idle.h"
>>>>>>  #include "xe_guc_engine_activity.h"
>>>>>>  #include "xe_hw_engine.h"
>>>>>>@@ -102,6 +103,36 @@ static struct xe_hw_engine 
>>>>>>*event_to_hwe(struct perf_event *event)
>>>>>>      return hwe;
>>>>>>  }
>>>>>>+static bool is_engine_event(u64 config)
>>>>>>+{
>>>>>>+    unsigned int event_id = config_to_event_id(config);
>>>>>>+
>>>>>>+    return (event_id == XE_PMU_EVENT_ENGINE_TOTAL_TICKS ||
>>>>>>+        event_id == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>>>>>>+}
>>>>>>+
>>>>>>+static void event_gt_forcewake(struct perf_event *event)
>>>>>>+{
>>>>>>+    struct xe_device *xe = container_of(event->pmu, 
>>>>>>typeof(*xe), pmu.base);
>>>>>>+    u64 config = event->attr.config;
>>>>>>+    struct xe_pmu *pmu = &xe->pmu;
>>>>>>+    struct xe_gt *gt;
>>>>>>+    unsigned int fw_ref;
>>>>>>+
>>>>>>+    gt = xe_device_get_gt(xe, config_to_gt_id(config));
>>>>>>+    if (!gt || !is_engine_event(config))
>>>>>>+        return;
>>>>>>+
>>>>>>+    fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>>>+    if (!fw_ref)
>>>>>>+        return;
>>>>>>+
>>>>>>+    if (!pmu->fw_ref)
>>>>>>+        pmu->fw_ref = fw_ref;
>>>>>>+
>>>>>>+    pmu->fw_count++;
>>>>>>+}
>>>>>>+
>>>>>>  static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
>>>>>>                  unsigned int id)
>>>>>>  {
>>>>>>@@ -144,6 +175,13 @@ static bool event_param_valid(struct 
>>>>>>perf_event *event)
>>>>>>  static void xe_pmu_event_destroy(struct perf_event *event)
>>>>>>  {
>>>>>>      struct xe_device *xe = container_of(event->pmu, 
>>>>>>typeof(*xe), pmu.base);
>>>>>>+    struct xe_pmu *pmu = &xe->pmu;
>>>>>>+    struct xe_gt *gt;
>>>>>>+
>>>>>>+    if (pmu->fw_count--) {
>>>>>>+        gt = xe_device_get_gt(xe, config_to_gt_id(event- 
>>>>>>>attr.config));
>>>>>>+        xe_force_wake_put(gt_to_fw(gt), pmu->fw_ref);
>>>>>>+    }
>>>>>
>>>>>
>>>>>Considering that fw->lock will be acquired and released 
>>>>>multiple times during the put operation, this might create an 
>>>>>overhead.
>>>>>
>>>>>How about implementing a _put function that can take the 
>>>>>number of refcounts to decrement as an input parameter, 
>>>>>similar to xe_force_wake_put_many?
>>>>Could you give more details on your suggestion? Would put_many 
>>>>just decrement the count? But wouldn't that still require a 
>>>>lock? Multiple event_destroys can call the function at the same 
>>>>time right?
>>>
>>>I was thinking about putting all refcounts at the end of last 
>>>event destroy in case of multiple pmu's.
>>>
>>>>
>>>>
>>>>One thing that can be done is to take forcewake on first count 
>>>>and release it when the last event is destroyed in cases of 
>>>>multiple
>>>>pmu being used
>>
>>Unless there is a measured inefficiency, I would recommend not 
>>refcounting this in PMU. If a forcewake is already taken, the code 
>>in forcewake_get is just handling increments and not really 
>>accessing MMIO, so we should be okay here.
>>
>>Also, pmu->fw_count is not required, since the force_wake_get logic 
>>should be already handling that. We should just call get and put and 
>>this should be good enough.
>
>I added the counting because if forcewake get fails then destroy won't 
>know if it has to call xe_force_wake_put (multiple perf opened). If 
>there is count and ref set, then can be called based on that.
>
>If we can return -ENOTSUPPORTED if forcewake get fails for engine 
>events, then the above will work

Hmm, not sure I understand. If forcewake_get fails, then we don't need 
to call force_wake_put. Also if force_wake_get fails, we should fail the 
event init (which means the destroy should not get called).

Thanks,
Umesh

>
>Thanks
>Riana
>
>>
>>Thanks,
>>Umesh
>>
>>>
>>>This sounds even better.
>>>
>>>>>
>>>>>If the overhead has already been considered and found to be 
>>>>>acceptable, I am fine with avoiding unnecessary modifications 
>>>>>to this patch.
>>>>This is the first rev for this patch. Open to suggestions
>>>>
>>>>Background for this patch: force_wake is needed to read the timestamp
>>>>register required for engine events.Cannot take it while reading 
>>>>the register from pmu_read due to a lockdep splat 
>>>>(PROVE_RAW_LOCK_NESTING).
>>>>
>>>>The suggestion was to take forcewake throughout the duration of 
>>>>event being read
>>>>
>>>>Thanks
>>>>Riana
>>>>>
>>>>>
>>>>>>      drm_WARN_ON(&xe->drm, event->parent);
>>>>>>      xe_pm_runtime_put(xe);
>>>>>>@@ -183,18 +221,23 @@ static int xe_pmu_event_init(struct 
>>>>>>perf_event *event)
>>>>>>      if (!event->parent) {
>>>>>>          drm_dev_get(&xe->drm);
>>>>>>          xe_pm_runtime_get(xe);
>>>>>>+        event_gt_forcewake(event);
>>>>>>          event->destroy = xe_pmu_event_destroy;
>>>>>>      }
>>>>>>      return 0;
>>>>>>  }
>>>>>>-static u64 read_engine_events(struct perf_event *event)
>>>>>>+static u64 read_engine_events(struct perf_event *event, u64 prev)
>>>>>>  {
>>>>>>      struct xe_device *xe = container_of(event->pmu, 
>>>>>>typeof(*xe), pmu.base);
>>>>>>+    struct xe_pmu *pmu = &xe->pmu;
>>>>>>      struct xe_hw_engine *hwe;
>>>>>>      u64 val = 0;
>>>>>>+    if (!pmu->fw_count)
>>>>>>+        return prev;
>>>>>>+
>>>>>>      hwe = event_to_hwe(event);
>>>>>>      if (!hwe)
>>>>>>          drm_warn(&xe->drm, "unknown pmu engine\n");
>>>>>>@@ -218,7 +261,7 @@ static u64 __xe_pmu_event_read(struct 
>>>>>>perf_event *event, u64 prev)
>>>>>>          return xe_gt_idle_residency_msec(&gt->gtidle);
>>>>>>      case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>>>>>>      case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>>>>>>-        return read_engine_events(event);
>>>>>>+        return read_engine_events(event, prev);
>>>>>>      }
>>>>>>      return 0;
>>>>>>diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h 
>>>>>>b/drivers/gpu/drm/ xe/ xe_pmu_types.h
>>>>>>index f5ba4d56622c..134b3400b19c 100644
>>>>>>--- a/drivers/gpu/drm/xe/xe_pmu_types.h
>>>>>>+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>>>>>>@@ -30,6 +30,14 @@ struct xe_pmu {
>>>>>>       * @name: Name as registered with perf core.
>>>>>>       */
>>>>>>      const char *name;
>>>>>>+    /**
>>>>>>+     * @fw_ref: force_wake ref
>>>>>>+     */
>>>>>>+    unsigned int fw_ref;
>>>>>>+    /**
>>>>>>+     * @fw_count: force_wake count
>>>>>>+     */
>>>>>>+    unsigned int fw_count;
>>>>>>      /**
>>>>>>       * @supported_events: Bitmap of supported events, 
>>>>>>indexed by event id
>>>>>>       */
>>>>>
>>>>
>>>
>
