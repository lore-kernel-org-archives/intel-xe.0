Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F0DC369C7
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 21:35:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3A110E0A0;
	Wed, 16 Apr 2025 21:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SWn0dxz3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B41B10E0A0
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 21:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744839350; x=1776375350;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VcNYVqbDJ26cvIzCdd2marXMntt1C3tJnat1CG9sE1I=;
 b=SWn0dxz3nAI8lpI780izX1C2Dt8ypzRFIszirZE5t/ZqCaQX0HTtHiRG
 JZrYpe5oOT8R/etVu7tZffRqU8LzEXqPP7ql0tqIZmthzZrLoe/4cm+i7
 V50rjDBwQkBM54v5hEIMFvHcrBSEa0jiZOwtI65f3uw+4KJgzbCMBueYe
 a1Uca4n9/gDfk6kdxJI6z27mHxL85Sp64i0fObL5YVE7MKS8RwpLyLw9V
 fyyyq+1YWpEIrHVBMdqpmmxuK/XYWtPPDQX+WePJS9JnS/JsbPR58cfos
 bMS6FhytEVNgbtMptqrHmFqCuU/+RVGABhdAWlUo/nmqFdggr1webbqX8 g==;
X-CSE-ConnectionGUID: USQcxGNcSPOlUK7NkAfEjg==
X-CSE-MsgGUID: lb9i7B21QMObkn501ggdDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46125866"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="46125866"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 14:35:49 -0700
X-CSE-ConnectionGUID: pCQ5EtjJR9OEhGvIHUd5vw==
X-CSE-MsgGUID: FaUiWEKbQ5uMu76pgbyKUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="131153236"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 14:35:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 14:35:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 14:35:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 14:35:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+n8Od7hzB/nDLOL1CPhYWC1IN4wWmws2YFDonBimkSBC5Husi5gL7lLB/oC4f2KsA1xtoCsvCcnaXChA5y4KKjFGXCVyaDvHBoGEYgRfVNtm1iYbzZnnk50nZnHliolaCATdbQKsjhrvMN5/Hll72h6n3tk0DPWXfa1UFnf8trgA9ziyKsnhhrhqNOqLi4lVF8mkTwL1VbJV43yY8cXx7oHH52SqS4K/8ieCde/9SqUhaUpv9ssj/VxrAWGydvKwmzUNCn0fMEvNJhIoTyNmQ/cF8Jp9r1BIpXvX+uqzl9aOD+0EoXk2sYCAfuXAGUVgpc+FE/RA9d+6o7hVmMauQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYhDE0cOP/IwSAuWz/lDXRcM2duDffbpHEmK4wHnOpA=;
 b=c6fE0jpUuI5RowlNIulrwl/rz3GXxnSScReEE2LBu+/BtDcaB7EDW3MpL7F4loWoHaCCaafpFexSHJk6MQRH9ihZ3MuWeeOMrv01tZPMmPz7SW/JU4PyqQlb0a1bhFoW5RsDTtrGGFYWyE0oW29qG5nx/9mO6fWjmZo8KHoyDF3CzBT7h4N86w8ppKWl+EkqCWNN21e36iNmzaCKgJ+NYoKto0jz139Bvyk97JGa8mpg5oleu3g3UbMsmjkUmmb+oAQ975a5c3dwgyFgUndqJxckRXYm/kfnUHI4GOWp2ucwUrmEGHetT9SH3iX5hAVaypL/07z+Ai2PEGJLpchuAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SN7PR11MB8066.namprd11.prod.outlook.com (2603:10b6:806:2df::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 21:35:45 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 21:35:45 +0000
Message-ID: <0da60d60-08f9-4da8-bf8b-ad62cfe3245d@intel.com>
Date: Wed, 16 Apr 2025 14:35:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] drm/xe: Add devcoredump chunking
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250415183916.332202-1-matthew.brost@intel.com>
 <20250415183916.332202-2-matthew.brost@intel.com>
 <9aa30608-7a74-42de-be19-1c3c6e0a7e5c@intel.com>
 <Z/9DyT1rzA2tOEOo@lstrano-desk.jf.intel.com>
 <b0634792-f2e3-4402-8b48-58b83f773426@intel.com>
 <aAAUnDb+EqjPFQ7M@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <aAAUnDb+EqjPFQ7M@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0321.namprd03.prod.outlook.com
 (2603:10b6:303:dd::26) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SN7PR11MB8066:EE_
X-MS-Office365-Filtering-Correlation-Id: 1120e76a-15a9-4b28-1e0e-08dd7d2ea564
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjFNTzFKNTVheExZd1grZmxmSUVtRUxBWDdDOFJhc2hXUVF1U1BURndmTG1p?=
 =?utf-8?B?ZXlmT01RUjVQZCtadnBPZkh0V1UwQkpVdnZUOWFhUERpVXp0QjVaNStrMWdD?=
 =?utf-8?B?d0J2bXFSbnE2T29xSlpzZmEyZllDS1dHSkJ0cGVBS3JhNTczTDk0MzY3R1BT?=
 =?utf-8?B?dUN0cjNBQkRvdWVZZnM0L2pxZ21iZ0NFT2tkaWhNeTQ5QjA1MzNTSXVaeVJZ?=
 =?utf-8?B?SUxINDlTa0kzZUV2bldaWDdDNENhbW1xVUdkVUFsK3pCaXJ5bEN5dW1mYzQw?=
 =?utf-8?B?K1JTY2VjbDZqRDkydXliVmhXNkVwRVZrMXRTcXlLZUp3a2ppUlgxWXRNemNz?=
 =?utf-8?B?LzVaV3IyUlZMRWFZM05ub0xDN25zZDNzSERRemcxN0x6Uk1kL0dia0RvTHlt?=
 =?utf-8?B?TGlYMy9BbXp0Y2hKblBRNStYWEZhTTQ1aTE0d1VzZUZUeG1SaytBUHlCSjJQ?=
 =?utf-8?B?Mmx5STdza1hyRm1FTlh1UWl1U09Jbkl3T0dMSzRxSzdweXRpcHRoUXNRczFx?=
 =?utf-8?B?TUlpOXdSa1QzSWI3UytFdzBaNzhFcFFNVktIdDR3Smk2WklDWnJMblU5c1ph?=
 =?utf-8?B?eUk5TzJqSkU1anQxYUVFejFSOFVyOFhsM3NyVFVuMEdCR08wN2dZSDR5R0NY?=
 =?utf-8?B?ckx5SEUyNnNuU1ZnZjZxakJ1bk9XN1F6OERkQ2pSWHVjUHlZQ2ttbjAzWjJO?=
 =?utf-8?B?TjUxdUM5R2J1MnVNRzN6ellXYktiYy80SkZrM3UwWksvRGtWeC9PMnQ2bUc3?=
 =?utf-8?B?eHpnZE9WUFhpckdaaHRCSlNGcDZYaHlDR1FGSFByZDFZWmovbHNNL2xQbmg0?=
 =?utf-8?B?ZDNZeHVzMUttb0ZGTmJ0dUNwTkVpTnBGNjJsQ1N3YlBacUNGdlRRRzkwczJ5?=
 =?utf-8?B?UzRoc2p3SElQblY0bitSTVVwNlVjMUhNaktJRkh1OHNXUi84T1BFNGJCNkl5?=
 =?utf-8?B?d1BQNWhQTkdTRjRhOHYrWGJ2dUp1ZWxTcXhuQ01YSGVyVUFFRGg3bVFIdGh6?=
 =?utf-8?B?RitheExyVlUvZ0tsVk1QOHBITEtZUDVETzZrdjNNUzRFZzUybHViWVBlM0Uz?=
 =?utf-8?B?K2gycnBlVWFBUFMxNnNNMVk5eXpTS3VVQ05QSXZvTU1oaVpWeXJNUXFLZ1FT?=
 =?utf-8?B?QTE5UnFTOEp4VG1DM2VWZGFpaDd0ekY0SU94cjdvNit1WGJMWW0xVVBSamZK?=
 =?utf-8?B?YWxoTWFrZkJ4VXA2K1hGZ2xreGI0M2xFSHJGNEZUeUJRTkJwZldwVm1BdmtO?=
 =?utf-8?B?Y085cGRsdGtKWGJOQWkxbFRqeHVsQzJhV3dxa2lPZ2JGRERyaEtaaXhpeU1C?=
 =?utf-8?B?NnIvZG8zMWxuQnNVWWVSQ3ArOEZKSmhSSFI1S1pLcHRjY05WbXk4WlNNR2xy?=
 =?utf-8?B?QXVOdGt2UVJzeFQvemdNTHRieHRkRzl5S3ZFVDJHWEFIb0hVTXR5R1Rrallj?=
 =?utf-8?B?K0l4eWtxWmpKdCsxeDFLRkMrOG9DZkVWS0xCVnJSanFYQkQwNzZqanZUR3pn?=
 =?utf-8?B?ZWZXYWtOc1hmeUZ5MHo0TUxsKzNXVGZKUmZLSlZhRzFlS0lZM2NVM3p4UDdC?=
 =?utf-8?B?SjgxeHlIbFc3QlppbWxqUnF5dmVBTVhvcVhxajdEc3RWMS9URHZnUzVJelVp?=
 =?utf-8?B?TFYzYnU4ZldUMnphQVVBYmRLSjVOb01GNnh1cEl3R21DQnI0L3g4T2lWYUtI?=
 =?utf-8?B?WGlReTBIU0hIRXp1NFpTOGR6UnhiNFhQbEx5YVBOL0tFa3N5V0ZnaHdEYkxJ?=
 =?utf-8?B?dnZjTklFbXU2Wlh6OVZKSS9GUjl4ZDNHZGFPK2s3elVLTzF0Sld1MERHU05X?=
 =?utf-8?B?WEhLMzlGcGlsUDE2bXgyYzlOWHl2NlM2aFRlNG5yOUFRNEE2VVZFdmRLSmcx?=
 =?utf-8?B?eFgwZ04xMnk5a0k1TVA3MUtIMWFjUDg4MUlmMjdqTGRsNy9JZ2djMmRPNmwv?=
 =?utf-8?Q?fDeFZ1hSGvk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGZKSW1kcG1ObmcxdlhoUTB3dVdHSWRFN045Zlc3M1ZOaUlKK1lCb3FLQXBB?=
 =?utf-8?B?K0JqeXRxVXBpc2RkTldtelpsL3V6SGdkN0JVVXBJa0JqL0FaN3NWOEVNUU15?=
 =?utf-8?B?c0h2SXBpeDg5YlZ1ZFdIcFpRMFFDRlp2cTJvV3VuZzFxY0hRTmZkYWhndEti?=
 =?utf-8?B?UTEvRGlPNU5PNjA5V3NUR3FydjY2SmFLU0l5YUZ5TWdtVCs0L095N2VpM3la?=
 =?utf-8?B?d3phMHBFc0lGbE5tTVVMSkZlRDFRTkNjL2ZYb1FNVFZmbDhqcXphT0ZnY0xW?=
 =?utf-8?B?dEtjMjhoVnExeE1hc3gvb1hsQThUc0VTMzhoUVB1bTJZWmdpQ2E4K283eUIy?=
 =?utf-8?B?Z0Nkd2U0WXVaS2g1N0ZLQ0RlTWQyNDBWRjVXdVIrcUxPYkFCaEY5UndDNXVo?=
 =?utf-8?B?M0pxTWJMWnQ1djUwL2pwU2phSkQraHBzbnZ3YVJ1a0QrRTlheE83SnFRbnVt?=
 =?utf-8?B?elJVTlN0RlluUzlFdnk4OEZVMzlLd3VHNHo0US85alpFMytUbXVEWDBhSlRp?=
 =?utf-8?B?M3RQOHV6SmZ5WDMyaXN4K1pSNTc1UEZQRkNDbFhWN2k1YUdWK0dXSmZxV3FD?=
 =?utf-8?B?STVVM3hPaTJ1di85UHpJdFIwekxNaS94NlkvcWlYcjJlQ3ZyUFdUbjJyMUZz?=
 =?utf-8?B?TW9tVmhjVExpVDhLbi85dHdySVpIcUl0TC9JL1NQaXdFQ3hGdFU1TXk4Tllp?=
 =?utf-8?B?SlgvMlBHUVE4UEdNbDlqcTVTN2VuT1RVTkRGS09QeEhzMWNFOWhWWGo3Umg0?=
 =?utf-8?B?UDR0NHpJZ0Q2RS91ek1QYkYwN3dvYjhxUEhad2N0NXBoa1JabTVWYU56MVZI?=
 =?utf-8?B?UTY0NXdtazA1WUhWYXRKRXdLSkxHTTRQODZJSGsrV2N4aER3WTE2WWhJSXAy?=
 =?utf-8?B?ZDlSR3JFQnpPMC92NURIbHNnY3JOL0w2dzB3V1I1RVdLcWVLRkg0YnRIblNa?=
 =?utf-8?B?aFJOWVpCSFdmVWxyWjhGdkhOMW9EVU95Y09oeWYzQklsNER1dXo1NkNOTGpq?=
 =?utf-8?B?TlFEODYyMFpESC82WmlvblVwS0M0UWQ4bHBVTjlJYkFYUU1tYUJOWjZiZUUw?=
 =?utf-8?B?cm4yUmhPbFliTll3ekx4UmtYNDFKaysxWDRCemJqbHZ0dlEwSHNObnBBMFFy?=
 =?utf-8?B?ck5jejlpc3MvcjE4UVF1REhkK0QxUzcrY1YrS2RRLzNIVFVnOUNGcUNYSjJm?=
 =?utf-8?B?VnpPamtYMHpLQUtlUTVUY1RORXFsc25Md1JFa0JYNTQ3S1pWWHNlNkk2L0R3?=
 =?utf-8?B?UXJETFRNajduNEhrRklvenp5OVc2bW9LTnhsZmljLzNaZEFkUy8yajFRRlFX?=
 =?utf-8?B?K3lpenhCc0VwZlZMdnFjRkFJT3ZGdUowV25ReGFtcVhqcnZNTDBpSWE3eWRB?=
 =?utf-8?B?QkVpeVErT2dRSjhGbUlUNlY1QWkvczFqTDUySjJyYnIya1lMa2dWWFBTR0py?=
 =?utf-8?B?NHIxdnlENERobXBkazFteTFRS1c5UWdFZGlKejAzNDkwUnM4bXA5MHhrZnhI?=
 =?utf-8?B?OWdSc2pMcUNDWC9NRXF0VjJtZXh4UGt1YWFsdnVpcnlWbG5WaUw1YnRpYkhF?=
 =?utf-8?B?dS9iODg4MklJM0xyRzdkOEFoOVNxSFFXajd5OWsvcnFwb05qWnVocmhneUJ2?=
 =?utf-8?B?N0pUQ2MvVFRncUh4cE5KWVFWRFdsYk8wRVR1QkpGVHFTSkRETkJTSkF5Rndp?=
 =?utf-8?B?T2wwOWdOMzU0MU1LVFpWRy8rZlBNbkNRLzkyaXZ3VERDNjgyZ1hOTDRReUs1?=
 =?utf-8?B?RDJySTNOMDlGR1hueXE5SXVoRWg4aEZSUUtEOEpDRDlZZE9kRzNpaDlGVFY5?=
 =?utf-8?B?OGhyOGpuOStINlZNaE1PV05ZR0NrdmtMM3g1SjVDUnpjTFMwZ1B5OHp6OFJF?=
 =?utf-8?B?Q3ZyS213ODFoQ1RPTE5IMUZEQzcyZWpJMXB6ZUY4RnlLNndWbE5DbWtoTElS?=
 =?utf-8?B?REtHTXhYazZZY0owZUVUZTA0eG5FMmNWUXhHdjVydE1GOXhnMFJXL1NBVXZE?=
 =?utf-8?B?SE1IaEliNGhHclUvcnpmK3kwMHFBT1lMSkNwV1R0bXlZb3NNRXUrSnRXbmpY?=
 =?utf-8?B?OHpCc3dBOFJHRkhhcFI2TG9Mc29XTmkvai9DZUpkUisxZ3ZIVWQ5bGJyeXpJ?=
 =?utf-8?B?UVBpM3hKNGtkYlUyaWlEQmFWT1NnUmZRL1lOTGU1QzhsTU8wR0xIbi9Damc2?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1120e76a-15a9-4b28-1e0e-08dd7d2ea564
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 21:35:45.5599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5oolD1dymurAUmcLwLKlqirCmocwQx0mREp/HPr4CVhRE2/zsr9QFbSVEKRw/95UUqMTk1Ow4Kmg4D8rjiDCyHB69kLq5A1lHsc9Nbsm9Bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8066
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

On 4/16/2025 1:35 PM, Matthew Brost wrote:
> On Wed, Apr 16, 2025 at 12:30:27PM -0700, John Harrison wrote:
>> On 4/15/2025 10:44 PM, Matthew Brost wrote:
>>> On Tue, Apr 15, 2025 at 04:18:29PM -0700, John Harrison wrote:
>>>> On 4/15/2025 11:39 AM, Matthew Brost wrote:
>>>>> Chunk devcoredump into 1.5G pieces to avoid hitting the kvmalloc limit
>>>>> of 2G. Simple algorithm reads 1.5G at time in xe_devcoredump_read
>>>>> callback as needed.
>>>>>
>>>>> Some memory allocations are changed to GFP_ATOMIC as they done in
>>>>> xe_devcoredump_read which holds lock in the path of reclaim. The
>>>>> allocations are small, so in practice should never fail.
>>>>>
>>>>> v2:
>>>>>     - Update commit message wrt gfp atomic (John H)
>>>>>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/xe/xe_devcoredump.c       | 59 ++++++++++++++++++-----
>>>>>     drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 +
>>>>>     drivers/gpu/drm/xe/xe_guc_hwconfig.c      |  2 +-
>>>>>     3 files changed, 50 insertions(+), 13 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>> index 81b9d9bb3f57..a9e618abf8ac 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>> @@ -80,7 +80,8 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
>>>>>     	return &q->gt->uc.guc;
>>>>>     }
>>>>> -static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
>>>>> +static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
>>>>> +				     ssize_t start,
>>>>>     				     struct xe_devcoredump *coredump)
>>>>>     {
>>>>>     	struct xe_device *xe;
>>>>> @@ -94,7 +95,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
>>>>>     	ss = &coredump->snapshot;
>>>>>     	iter.data = buffer;
>>>>> -	iter.start = 0;
>>>>> +	iter.start = start;
>>>>>     	iter.remain = count;
>>>>>     	p = drm_coredump_printer(&iter);
>>>>> @@ -168,6 +169,8 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
>>>>>     	ss->vm = NULL;
>>>>>     }
>>>>> +#define XE_DEVCOREDUMP_CHUNK_MAX	(SZ_512M + SZ_1G)
>>>>> +
>>>>>     static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>>>>>     				   size_t count, void *data, size_t datalen)
>>>>>     {
>>>>> @@ -183,6 +186,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>>>>>     	/* Ensure delayed work is captured before continuing */
>>>>>     	flush_work(&ss->work);
>>>>> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
>>>>> +		xe_pm_runtime_get(gt_to_xe(ss->gt));
>>>>> +
>>>>>     	mutex_lock(&coredump->lock);
>>>>>     	if (!ss->read.buffer) {
>>>>> @@ -195,12 +201,26 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>>>>>     		return 0;
>>>>>     	}
>>>>> +	if (offset >= ss->read.chunk_position + XE_DEVCOREDUMP_CHUNK_MAX ||
>>>>> +	    offset < ss->read.chunk_position) {
>>>>> +		ss->read.chunk_position =
>>>>> +			ALIGN_DOWN(offset, XE_DEVCOREDUMP_CHUNK_MAX);
>>>>> +
>>>>> +		__xe_devcoredump_read(ss->read.buffer,
>>>>> +				      XE_DEVCOREDUMP_CHUNK_MAX,
>>>>> +				      ss->read.chunk_position, coredump);
>>>>> +	}
>>>>> +
>>>>>     	byte_copied = count < ss->read.size - offset ? count :
>>>>>     		ss->read.size - offset;
>>>>> -	memcpy(buffer, ss->read.buffer + offset, byte_copied);
>>>>> +	memcpy(buffer, ss->read.buffer +
>>>>> +	       (offset % XE_DEVCOREDUMP_CHUNK_MAX), byte_copied);
>>>>>     	mutex_unlock(&coredump->lock);
>>>>> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
>>>>> +		xe_pm_runtime_put(gt_to_xe(ss->gt));
>>>>> +
>>>>>     	return byte_copied;
>>>>>     }
>>>>> @@ -254,17 +274,32 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
>>>>>     	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
>>>>>     	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
>>>>> -	xe_pm_runtime_put(xe);
>>>>> +	ss->read.chunk_position = 0;
>>>>>     	/* Calculate devcoredump size */
>>>>> -	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
>>>>> -
>>>>> -	ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
>>>>> -	if (!ss->read.buffer)
>>>>> -		return;
>>>>> +	ss->read.size = __xe_devcoredump_read(NULL, LONG_MAX, 0, coredump);
>>>>> +
>>>>> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX) {
>>>>> +		ss->read.buffer = kvmalloc(XE_DEVCOREDUMP_CHUNK_MAX,
>>>>> +					   GFP_USER);
>>>>> +		if (!ss->read.buffer)
>>>>> +			goto put_pm;
>>>>> +
>>>>> +		__xe_devcoredump_read(ss->read.buffer,
>>>>> +				      XE_DEVCOREDUMP_CHUNK_MAX,
>>>>> +				      0, coredump);
>>>>> +	} else {
>>>>> +		ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
>>>>> +		if (!ss->read.buffer)
>>>>> +			goto put_pm;
>>>>> +
>>>>> +		__xe_devcoredump_read(ss->read.buffer, ss->read.size, 0,
>>>>> +				      coredump);
>>>>> +		xe_devcoredump_snapshot_free(ss);
>>>>> +	}
>>>>> -	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
>>>>> -	xe_devcoredump_snapshot_free(ss);
>>>>> +put_pm:
>>>>> +	xe_pm_runtime_put(xe);
>>>>>     }
>>>>>     static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>>>>> @@ -425,7 +460,7 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, char suffi
>>>>>     	if (offset & 3)
>>>>>     		drm_printf(p, "Offset not word aligned: %zu", offset);
>>>>> -	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
>>>>> +	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_ATOMIC);
>>>>>     	if (!line_buff) {
>>>>>     		drm_printf(p, "Failed to allocate line buffer\n");
>>>>>     		return;
>>>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>>>> index 1a1d16a96b2d..a174385a6d83 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>>>> @@ -66,6 +66,8 @@ struct xe_devcoredump_snapshot {
>>>>>     	struct {
>>>>>     		/** @read.size: size of devcoredump in human readable format */
>>>>>     		ssize_t size;
>>>>> +		/** @read.chunk_position: position of devcoredump chunk */
>>>>> +		ssize_t chunk_position;
>>>>>     		/** @read.buffer: buffer of devcoredump in human readable format */
>>>>>     		char *buffer;
>>>>>     	} read;
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
>>>>> index af2c817d552c..21403a250834 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
>>>>> @@ -175,7 +175,7 @@ int xe_guc_hwconfig_lookup_u32(struct xe_guc *guc, u32 attribute, u32 *val)
>>>>>     	if (num_dw == 0)
>>>>>     		return -EINVAL;
>>>>> -	hwconfig = kzalloc(size, GFP_KERNEL);
>>>>> +	hwconfig = kzalloc(size, GFP_ATOMIC);
>>>> As per earlier comments, this should not be happening while dumping a core
>>>> dump. The only code which uses this is steering related. That implies we are
>>>> reading EU registers while printing out a previously saved core dump. That
>>>> either means we are unnecessarily reading registers during the print or we
>>>> are not capturing state in advance and only actually reading it out when
>>>> printing. Neither of which is good.
>>>>
>>> Ok, I don't have bandwidth to fix that. I'll let this series die then.
>>>
>>> Matt
>> Or maybe just add a FIXME comment? I've been meaning to take a look at this
>> myself but just haven't had the time.
>>
> I guess that is a better option. I can add a FIXME when merging.
>
>> If we need the large file support to allow people to debug issues then we
>> should get it in. Your patch is not causing the bad register accesses (I
> Yes, this is an ask. And no, this patch isn't causing bad register
> access rather exposing it via a lockdep splat.
>
>> don't think), that is something that is already broken in the driver. But I
>> don't think you should make this change with a comment suggesting it is all
>> fine and happy. The commit description should be more like "FIXME: This
>> should not not be happening, but until the unexpected register reads are
>> removed/moved make the alloc atomic so it doesn't go boom" and add a similar
>> comment to the allocation itself.
>>
> Ok, can fix commit too when merging.
>
> Matt
Sounds good.

Although I've worked out where the dodgy reads are coming from. It's the 
GuC backend for the register capture code. And it's not actually doing 
register reads, but just re-calculating the steering for the register 
value that it had previously read at capture time. It should be possible 
to cache that information as well, rather than re-calculate it at dump 
time. And that will get rid of the need for the atomic alloc. Will try 
to get something posted later today. Up to you if you want to hold off 
merging for another day or not.

John.


>
>> John.
>>
>>>> Rather than making allocations atomic when they don't need to be, we should
>>>> be fixing why the coredump is not doing a clean separation of save versus
>>>> print.
>>>>
>>>> John.
>>>>
>>>>
>>>>>     	if (!hwconfig)
>>>>>     		return -ENOMEM;

