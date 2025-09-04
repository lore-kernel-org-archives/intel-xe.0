Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B469CCA1012
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 20:55:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4824210EADA;
	Thu,  4 Sep 2025 20:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJNuLwFE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A4010EADA
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 20:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757019336; x=1788555336;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TGjdcAL8TQ+D8iGlHAcxEZRVOxEIE+Sur9n4w7Z/S8A=;
 b=AJNuLwFE0d/vBdq1hZzL3db8LaWBQim7weRDX74MieW8rIpkMiC2ez85
 AdniCBf8CqpWZtaK4emwkqLgk/2z4gr3iuLYJfpr7muiCgqcxIvJ4p+lj
 B2IvrNZYqtFbcLvgxviwLEolD4xr6ZU0PPJa96CTHC4JrwPALfRYI86uZ
 kd7gKvNqAFyEl1xMah3lNgc9ZKy7VKbf/bFjQUPctEH0azUQU+0/tt0EO
 BK8e93JpPdtxzHxk8obf/3eui9Bqd+2KmL3JRrxSqQZDl1i8Ks1IlK/mx
 1K+J1CUsxhi9vQUgtugO7fToeR45sY5E3LuV4P3507Pw1lJyL2yAM32uI A==;
X-CSE-ConnectionGUID: nO3kFzoBQWKjxqRRVRqE4w==
X-CSE-MsgGUID: FgN1MMcuQuefBp/ve28RLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59291531"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59291531"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 13:55:35 -0700
X-CSE-ConnectionGUID: R6RKMxRpQd+nXZeja9TmSQ==
X-CSE-MsgGUID: 48w5NH9rRLCA1paZf4gmvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="171555089"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 13:55:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 13:55:33 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 13:55:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.67)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 13:55:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wTSmtWEnKGERotOsEVGkm5FuakwL+Ci+D1RBua2x512pbSFMvsZI/LNmef791mrRfDSrdhgprV+GnkEuzIi4TThLvlz33dLmkkNgoha7dEls9HixkjikKfNv/0gHyiar+nU/SOnR+AehDGRn5M8HZpDt9hOrkDv9i8Qa/JKw2yKbTYLOv+XtpeZa5gljkdgncas+Bx2VPz8JHL4YbWPWqIH4gRxc4HQWmtZE9DXZaDqE2RitJHbTABfd+J9NVKHuzP2NkP7Zb7m0ELK/1Xj8uSkVN6EWxXEjl8PrJTDAaI0xpCWYF6zqMCZZxkRioGPK4d+/YgygLby85tfQvjgUYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2CUyFv1CAg5BFypgpkqo6k6VTQZx96pd/SGZhF17BY=;
 b=vMew/hWuG9bk9wBmloEzYWcyCgukJUx39iZ4ur9FlMX5HtOchNm8JFviOiYfjmnQe/BWnyeWlddszN3dlrOCkxaqysHo7/a45t4BOrGIPjspz0ISH5r8xLwlRi6oRrUAnE2VVM8mrjw9KOgEnQ0n4vyoEYBywHeoZsDsPPnAbjosd0mBhFwTWSskfBisyWxJ01u15sv8Lg7KNc7prtC723b4TGZavjV14fGoDmjQLmnnUtWW+ShcBRoOpSV9jJbPo/mtMY9PuXdK0GOeLASKWM3stFW7/fJSo1A8Gyoq46sKjzp2wRNhgsft/dUPDvqDLt1EvIBXfthpe3hk0XQm6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ0PR11MB5939.namprd11.prod.outlook.com (2603:10b6:a03:42e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 20:55:31 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%5]) with mapi id 15.20.9052.024; Thu, 4 Sep 2025
 20:55:30 +0000
Message-ID: <b820386a-79c0-4726-87c7-69806a110b79@intel.com>
Date: Thu, 4 Sep 2025 13:55:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Fix error handling if PXP fails to start
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20250818234639.2965656-3-daniele.ceraolospurio@intel.com>
 <fe1b455b-9917-4dec-8a16-94daa922263f@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <fe1b455b-9917-4dec-8a16-94daa922263f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::10) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ0PR11MB5939:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c778699-e997-4763-90a9-08ddebf561df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnZ5Sk15c0EzOFJ6NmdML0REV1h1UDc5VEtYN0RkWUx1Rml2c1FXUWRONExn?=
 =?utf-8?B?ZVFaUk11c1dQNkZWaEdCK0dDUGFjSHM4dCtKYlNubEZpV3FNTGJBZm5RU1ZM?=
 =?utf-8?B?eDlFVzB0OXRGMkN2Q2F0YVpsajFkV1BiWnAzR1Jyb0tpVEVUUWZxUk1UTFFl?=
 =?utf-8?B?c3kwY3dRY3pzRzZXZlRudWl3cUQwWG1zRE4zeVNDSDNMMTh3VEM1UTg1V1J2?=
 =?utf-8?B?RmZndTJJOEtISk40RFpGd3hBck85cm5wVVFhYWZoZU1XMDV4UGNoM1dIdkNh?=
 =?utf-8?B?K21PVEI1OWg5cWo4RjJtZ3JqY1dVQXJPZVNtWWFSV2IyM0dzYTQ5V2pxUTFN?=
 =?utf-8?B?bmRRbmNUTjZCZDgrVHhGN3dnSE13Q1kwbTI4YkJXTXNadTErOGl2M3oyUkJu?=
 =?utf-8?B?WmtNTXo0UC9TNkQ4WEc3YngwSW5ZWjBHTi9TSzBOQkJpSUJzdzdqQnE3OG5y?=
 =?utf-8?B?djZqSTRsaS9sSUQvTVdYMC9ickdlZGplL1hxNGxVVzhWYVlvdCtlOE95RlJ2?=
 =?utf-8?B?LytOYVpCUWx0NFp5Q3BxUHhuNDh0dUZweWlNUG1xaUgyMy9mUTgyVEJnMVZq?=
 =?utf-8?B?MEdpUGxFMUgycGovTlViRSszYTFOejFUYzZ3b0UxU1pjdUl2VlR6TnpuRDhJ?=
 =?utf-8?B?TkpTN1VXcDFrdytOQjhaVzNqQXVydjlLME9aMFc0TmkyTDNMQ1N6QkVwLzY0?=
 =?utf-8?B?RmQyUEtwMWo5bUhsTUhCelVlSHZKeWJlUjdGZTFNQW15eTEwbEUxWk1iUGpx?=
 =?utf-8?B?MktVZXlKL0FKT1BEbGZXVnRkYnAwWXZJY0pDajcyd0MxU1VpWk44N0QrY25o?=
 =?utf-8?B?cElLQ0RmYjZORDFwbllmZWtOYURkcHBpbExrY3RnVmJNajVFRGZzRjhURXhQ?=
 =?utf-8?B?WTBYVVhMeTV4MDVoV3MyVG84WmNaYk50YU1MTVpiSTdNUEJjL0RQZ0dheFdI?=
 =?utf-8?B?Vy9lRHR3ckJxOVF6YzBxditBVFNxWmZiNnU1VFVEc1VQbExxTEl4SkR5TkZH?=
 =?utf-8?B?TEZtUG5aWUlDbnc4SG1ZYUVtRkpaWVlHTmdFY0w1cTVURUhabnJLTDlEdkhq?=
 =?utf-8?B?TEFRSmdNZUtwMms3RUtlb0RUUXBrbU84MEF1QWhFTTFLSlV0YzVVdDFSbGVr?=
 =?utf-8?B?Tk02emZMa2tsMG9aRHdtUjBaUUs1R094djJIVitkM1Y5QXd4RDRodnpPd1Bj?=
 =?utf-8?B?WUlHWnRVWXRjTGV5dlJlZTF3bEhVZXdnWEZQRURnbFNGOWtJMVlHWW1PbnZV?=
 =?utf-8?B?YXJ1Y01VWnBoaTdDd25BK2RrZ1JkTE9OOGVtWWZGemsxNGlLazJkdnh3QXUy?=
 =?utf-8?B?NTA5Wm9yZ1hGWTduNkJHLy9zalVDMXZ3V0Q1dXFCSnllN3YwV1NaMDRadWhK?=
 =?utf-8?B?Wng5VUp4aWJUUGNUSFdsWFVaYllzZS9McGpKT2t2TmhSS0JpNmF3QzFDc0dm?=
 =?utf-8?B?WTRiMW9sUnFWSVZmUTlTTjZMbG1tQmprRzFNbGQ4WE1Hdk1MbGNaK2lramVM?=
 =?utf-8?B?cjN3akFmaktnUmxUd0xSUXFNVVJ3WUZGNnZjOG1QUjZoSFFOQUJ2dnhodDd2?=
 =?utf-8?B?MDNva09jc08vRDk5cXlRT3RSbUxpenR1YUZPTTlkOVA0RHhHRTBrcnlFZzRF?=
 =?utf-8?B?M1lRdmF0Tk0xdEV2K050eHErODJMak40Y3lGa3BEYXdTL2lSY2hnVFJtekFO?=
 =?utf-8?B?T0tibHpmUFpCMlorSExPMVcwTjU0cXRrVWNnL2RTUENYeTFYWFpVY0dNZTNL?=
 =?utf-8?B?cGtVeWZpdmZXZ3RtTWgzR051bENGSFBubU5UTCswbHhubkxSUU1HMVZ2U00v?=
 =?utf-8?B?Y0ovYlVSbHYwVFdhTG5qaHM5cG1QRFozQzVsNURhemZpbVBTZ2RaczBRWXFw?=
 =?utf-8?B?YWRCQmptU1djajFQbytnYmJ4Mlh0UjYxYitNUnNYTFMrSlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SSt2aGJLK0ZJcnhweVZFRS8rZmFnVGJCekd2SXAyQXpWeDdzZW94UE1rV1FR?=
 =?utf-8?B?VzcwN0FXRXA3QkVWUUkyWjJwMysxRllkTjkzVVNrNVlBL25ZL2lnSTRXVWdv?=
 =?utf-8?B?cVFiTGVGeWFnTC9rSy9aTTVDT0hEL3pyU1NTN3pnSUJTQ1NSOEgydGVRREg4?=
 =?utf-8?B?N3k3U0N3bjdFOW9mRXRGYk9XTUk4VlI1cWRFQUZpb3B2RVQ0cGJyWUloRkVp?=
 =?utf-8?B?TEdpL0V0U0FBSWVMQ2c4Z2VwN3JUTDVEQVkzOWFaV2o0MmVVUmR5N0oyWVhs?=
 =?utf-8?B?YUU1Y0piWVloZEsrNkUrdGNyVFdlUk13OTc4NU5NeWNjaDJtc0xmZThKWmNO?=
 =?utf-8?B?YlVWblNDa1ZlOTNxVHZyUWhINm9waTFnUDh6bTRlMXJrWEw5TDFOa2xGZ2lG?=
 =?utf-8?B?WGlYa3YzT21qUkhFVk9oVjhWQ2FnbmZxNkNDaGhpc243V1VoWmgwa2RNejhw?=
 =?utf-8?B?YkVjMFVVKzVzMHVMYlFud0E0MUVydUp6ZkFNZnRUczN1azhFVVR1cFRZekpO?=
 =?utf-8?B?SXUrZy9NdnlFenI1RkdJTVYwMG41dUk1VXVIaXdIbDN3bW5USEdFS1RodmtP?=
 =?utf-8?B?TC9HL1ZFengrWWNQbWxVc29iVHVzV3BJZE16WmdYV2VyVmYxTXRsUGxhbHRO?=
 =?utf-8?B?Q003WHRya2NTcVovNlFyOFZnSHdmbi9IakdoVGRNS25ESjkva3YyVmVHY1cw?=
 =?utf-8?B?MSs1MjNNQThFamlIa3c3MDVDcDJ6ZmxFMFAxdjY4Y1dVZUc2Ky9WZ2VwU1pC?=
 =?utf-8?B?ZlZWaDlKdEg0RVJ1R1V2TEx4aTJJcDdrMjBtUmZORVZDbFBjTTQ2KzFZcXh3?=
 =?utf-8?B?bXhxY2ErYjRzMGVDdHZZUXMzN2tpWDRmRCs3L2FQRHJwOVduQUpub1J5ZnhX?=
 =?utf-8?B?SWNBQnZXRkF0bTVzbTR3S0R3aUJwa0tVQzhHUkFVMWVwWnc3eDdWU3VrN1RY?=
 =?utf-8?B?Y01kSlJiUzdFM2xlM085OGs1Q05JbWlBdDNGWDJza1d4U2tlM1crUUo5Sjcv?=
 =?utf-8?B?WWpackw4MVU4aFhaSk9RblRTRDJ3YUVFd2MyNlI5cXJqVnRRcWpzZGY1ejFG?=
 =?utf-8?B?TFVlNW1XWldnWkxWVG81Q2Y0SzgzdWdsRzVxQWg3SEc4M1RhVFNqVVZkVll5?=
 =?utf-8?B?bjQ1d1hPUWdzaWNkT2taL05Mc0NRVVZwemtnN0w1NktZSzc2bVJuRThFdE1Y?=
 =?utf-8?B?NTRvNTB2OWptUll4MHJOS3BNSTJUaSt2dnlncVJtajJ1ZGttSUl0SnZ0SGMx?=
 =?utf-8?B?bVlQKzJEZ0dQK2RPSWdtMVhzaEVpMUlyZHJLdGtkajFxY2JBNXJVckZEd21C?=
 =?utf-8?B?YVZzbTg4aDUySXF2UjQ2R0NQRzJNaUF0NlBOeGFxN3V4Y3Z6VE55dU1ITngx?=
 =?utf-8?B?RCtldStxaTZVamRQaldDMUlOS215bzJlNXpGUWt4b3N2NUhrTGUzcjA1dmhH?=
 =?utf-8?B?OGNiVzR6dk9McHQzQS9WcHpHUXBiUldLQ25TeHFKSEM5SDNma3A2WFNMZGRp?=
 =?utf-8?B?SGk5VGwxWlpBRjVUcTJ5UmtXNzRZdEVVRHpyeFNsS3Z6RGZXREtxKzdXekgr?=
 =?utf-8?B?K0VwTjBMeFh1VGVkcnZubjZocm04NWpmcmdienRHWWpPTlNYeTYwclh4UmNp?=
 =?utf-8?B?ZFVMeHk4YzBKR3Qxb0pHbVRrb1NOeWNQODh1VmZudjNaQlFxMkpVSnNZdGtY?=
 =?utf-8?B?SXR5czl5TnRmQmZwZVI1NENsSnhyNzNod2VoSnZjSXdOUmM1RFJOTUlUbUh6?=
 =?utf-8?B?UERqZnUzWXpjZXlJaW9OQVdZL0tzS1FmTk5iOGNTZ050VGV1M041QldhVW13?=
 =?utf-8?B?VXhwem1CWFYxTHA2WW1wdTBkRGlCRmdwbXRDdEhEZkRBeWhkalVSTHJ4WUNS?=
 =?utf-8?B?Qlo3Q05WSjdPL2NSNmFLUlR5U0lWS2tOZG1keUkzQ3Q5ZnduNmxidGFIbkJq?=
 =?utf-8?B?cEQ0MnNJaFBnWFhGYWZwZHQ3b1p6L0dzcm9ZVzNqd3dQUU5nM1ZjSHN0eGor?=
 =?utf-8?B?d2ZYR0Fsa0JiQ2YzMFhKcHIyWm81RW1YZ0ttTzdMUWpVbmtoVnl1T0xkVWJN?=
 =?utf-8?B?QWVYZDNHbDV4LzZDWGNVSzZ4MFhrNmt1VUg4SXN3aDRGNFZ3aExRb1dqYlpw?=
 =?utf-8?B?eTdYOGdYV0xaR0xwdE5qeGhqN21oK2k4bEpiL2lvLzk1c2tLUkNsQ0xQcDh0?=
 =?utf-8?Q?ZKXiV1Ai8rL/9/9DtV6qoY8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c778699-e997-4763-90a9-08ddebf561df
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 20:55:29.9992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0KUmIvBrPsOPfT6fXAzyHvl+Ab8EhW87fKhpjcnXLAiS8dyiYE+pGDCJEBvTr86UlJHEYocK+lIIYta8zdssz+dugfxCuPsp7KN4k5sQXos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5939
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



On 9/4/2025 1:45 PM, John Harrison wrote:
> On 8/18/2025 4:46 PM, Daniele Ceraolo Spurio wrote:
>> Since the PXP start comes after __xe_exec_queue_init() has completed,
>> we need to cleanup what was done in that function in case of a PXP
>> start error.
>> __xe_exec_queue_init calls the submission backend init() function,
>> so we need to introduce an opposite for that. Unfortunately, while
>> we already have a fini() function pointer, it is does perform other
> it is does?
>
>> operations in addition to cleaning up what was done by the init().
>> Therefore, for clarity, the existing fini() has been renamed to
>> destroy(), while a new fini() has been added to only clean up what was
>> done by the init(), with the latter being called by the former (via
>> xe_exec_queue_fini).
> It would be much easier to follow the changes if the rename was split 
> into a prep patch and then the behaviour change patch was just the 
> behaviour change.

This is a fixes patch, so I wanted to avoid having prerequisite patches 
for it because it'll make it fail to apply.
The other option I thought of is to do something like:

patch 1 (fixes): add a new function pointer with a new name (fini_last 
?) to undo the init() action.
patch 2: swap the function names (fini -> destroy, fini_last -> fini)

However, not sure if this is better because we'd leave unbalanced naming 
with only patch 1.

Thoughts?
Daniele

>
> John.
>
>>
>> Fixes: 72d479601d67 ("drm/xe/pxp/uapi: Add userspace and LRC support 
>> for PXP-using queues")
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_exec_queue.c           | 24 ++++++---
>>   drivers/gpu/drm/xe/xe_exec_queue_types.h     |  8 ++-
>>   drivers/gpu/drm/xe/xe_execlist.c             | 25 ++++++----
>>   drivers/gpu/drm/xe/xe_execlist_types.h       |  2 +-
>>   drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  4 +-
>>   drivers/gpu/drm/xe/xe_guc_submit.c           | 52 ++++++++++++--------
>>   6 files changed, 74 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c 
>> b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 2d10a53f701d..bce507c49517 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -199,6 +199,18 @@ static int __xe_exec_queue_init(struct 
>> xe_exec_queue *q)
>>       return err;
>>   }
>>   +static void __xe_exec_queue_fini(struct xe_exec_queue *q)
>> +{
>> +    int i;
>> +
>> +    q->ops->fini(q);
>> +
>> +    for (i = 0; i < q->width; ++i)
>> +        xe_lrc_put(q->lrc[i]);
>> +
>> +    return;
>> +}
>> +
>>   struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, 
>> struct xe_vm *vm,
>>                          u32 logical_mask, u16 width,
>>                          struct xe_hw_engine *hwe, u32 flags,
>> @@ -229,11 +241,13 @@ struct xe_exec_queue 
>> *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
>>       if (xe_exec_queue_uses_pxp(q)) {
>>           err = xe_pxp_exec_queue_add(xe->pxp, q);
>>           if (err)
>> -            goto err_post_alloc;
>> +            goto err_post_init;
>>       }
>>         return q;
>>   +err_post_init:
>> +    __xe_exec_queue_fini(q);
>>   err_post_alloc:
>>       __xe_exec_queue_free(q);
>>       return ERR_PTR(err);
>> @@ -331,13 +345,11 @@ void xe_exec_queue_destroy(struct kref *ref)
>>               xe_exec_queue_put(eq);
>>       }
>>   -    q->ops->fini(q);
>> +    q->ops->destroy(q);
>>   }
>>     void xe_exec_queue_fini(struct xe_exec_queue *q)
>>   {
>> -    int i;
>> -
>>       /*
>>        * Before releasing our ref to lrc and xef, accumulate our run 
>> ticks
>>        * and wakeup any waiters.
>> @@ -346,9 +358,7 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>>       if (q->xef && 
>> atomic_dec_and_test(&q->xef->exec_queue.pending_removal))
>> wake_up_var(&q->xef->exec_queue.pending_removal);
>>   -    for (i = 0; i < q->width; ++i)
>> -        xe_lrc_put(q->lrc[i]);
>> -
>> +    __xe_exec_queue_fini(q);
>>       __xe_exec_queue_free(q);
>>   }
>>   diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h 
>> b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index ba443a497b38..27b76cf9da89 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -181,8 +181,14 @@ struct xe_exec_queue_ops {
>>       int (*init)(struct xe_exec_queue *q);
>>       /** @kill: Kill inflight submissions for backend */
>>       void (*kill)(struct xe_exec_queue *q);
>> -    /** @fini: Fini exec queue for submission backend */
>> +    /** @fini: Undoes the init() for submission backend */
>>       void (*fini)(struct xe_exec_queue *q);
>> +    /**
>> +     * @destroy: Destroy exec queue for submission backend. The backend
>> +     * function must call xe_exec_queue_fini() (which will in turn 
>> call the
>> +     * fini() backend function) to ensure the queue is properly 
>> cleaned up.
>> +     */
>> +    void (*destroy)(struct xe_exec_queue *q);
>>       /** @set_priority: Set priority for exec queue */
>>       int (*set_priority)(struct xe_exec_queue *q,
>>                   enum xe_exec_queue_priority priority);
>> diff --git a/drivers/gpu/drm/xe/xe_execlist.c 
>> b/drivers/gpu/drm/xe/xe_execlist.c
>> index 788f56b066b6..f83d421ac9d3 100644
>> --- a/drivers/gpu/drm/xe/xe_execlist.c
>> +++ b/drivers/gpu/drm/xe/xe_execlist.c
>> @@ -385,10 +385,20 @@ static int execlist_exec_queue_init(struct 
>> xe_exec_queue *q)
>>       return err;
>>   }
>>   -static void execlist_exec_queue_fini_async(struct work_struct *w)
>> +static void execlist_exec_queue_fini(struct xe_exec_queue *q)
>> +{
>> +    struct xe_execlist_exec_queue *exl = q->execlist;
>> +
>> +    drm_sched_entity_fini(&exl->entity);
>> +    drm_sched_fini(&exl->sched);
>> +
>> +    kfree(exl);
>> +}
>> +
>> +static void execlist_exec_queue_destroy_async(struct work_struct *w)
>>   {
>>       struct xe_execlist_exec_queue *ee =
>> -        container_of(w, struct xe_execlist_exec_queue, fini_async);
>> +        container_of(w, struct xe_execlist_exec_queue, destroy_async);
>>       struct xe_exec_queue *q = ee->q;
>>       struct xe_execlist_exec_queue *exl = q->execlist;
>>       struct xe_device *xe = gt_to_xe(q->gt);
>> @@ -401,10 +411,6 @@ static void 
>> execlist_exec_queue_fini_async(struct work_struct *w)
>>           list_del(&exl->active_link);
>>       spin_unlock_irqrestore(&exl->port->lock, flags);
>>   -    drm_sched_entity_fini(&exl->entity);
>> -    drm_sched_fini(&exl->sched);
>> -    kfree(exl);
>> -
>>       xe_exec_queue_fini(q);
>>   }
>>   @@ -413,10 +419,10 @@ static void execlist_exec_queue_kill(struct 
>> xe_exec_queue *q)
>>       /* NIY */
>>   }
>>   -static void execlist_exec_queue_fini(struct xe_exec_queue *q)
>> +static void execlist_exec_queue_destroy(struct xe_exec_queue *q)
>>   {
>> -    INIT_WORK(&q->execlist->fini_async, 
>> execlist_exec_queue_fini_async);
>> -    queue_work(system_unbound_wq, &q->execlist->fini_async);
>> +    INIT_WORK(&q->execlist->destroy_async, 
>> execlist_exec_queue_destroy_async);
>> +    queue_work(system_unbound_wq, &q->execlist->destroy_async);
>>   }
>>     static int execlist_exec_queue_set_priority(struct xe_exec_queue *q,
>> @@ -467,6 +473,7 @@ static const struct xe_exec_queue_ops 
>> execlist_exec_queue_ops = {
>>       .init = execlist_exec_queue_init,
>>       .kill = execlist_exec_queue_kill,
>>       .fini = execlist_exec_queue_fini,
>> +    .destroy = execlist_exec_queue_destroy,
>>       .set_priority = execlist_exec_queue_set_priority,
>>       .set_timeslice = execlist_exec_queue_set_timeslice,
>>       .set_preempt_timeout = execlist_exec_queue_set_preempt_timeout,
>> diff --git a/drivers/gpu/drm/xe/xe_execlist_types.h 
>> b/drivers/gpu/drm/xe/xe_execlist_types.h
>> index 415140936f11..92c4ba52db0c 100644
>> --- a/drivers/gpu/drm/xe/xe_execlist_types.h
>> +++ b/drivers/gpu/drm/xe/xe_execlist_types.h
>> @@ -42,7 +42,7 @@ struct xe_execlist_exec_queue {
>>         bool has_run;
>>   -    struct work_struct fini_async;
>> +    struct work_struct destroy_async;
>>         enum xe_exec_queue_priority active_priority;
>>       struct list_head active_link;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h 
>> b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>> index a3f421e2adc0..c30c0e3ccbbb 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>> @@ -35,8 +35,8 @@ struct xe_guc_exec_queue {
>>       struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
>>       /** @lr_tdr: long running TDR worker */
>>       struct work_struct lr_tdr;
>> -    /** @fini_async: do final fini async from this worker */
>> -    struct work_struct fini_async;
>> +    /** @destroy_async: do final destroy async from this worker */
>> +    struct work_struct destroy_async;
>>       /** @resume_time: time of last resume */
>>       u64 resume_time;
>>       /** @state: GuC specific state for this xe_exec_queue */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c 
>> b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 860c07da598a..75208ea4d408 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1418,48 +1418,57 @@ guc_exec_queue_timedout_job(struct 
>> drm_sched_job *drm_job)
>>       return DRM_GPU_SCHED_STAT_NO_HANG;
>>   }
>>   -static void __guc_exec_queue_fini_async(struct work_struct *w)
>> +static void guc_exec_queue_fini(struct xe_exec_queue *q)
>> +{
>> +    struct xe_guc_exec_queue *ge = q->guc;
>> +    struct xe_guc *guc = exec_queue_to_guc(q);
>> +
>> +    release_guc_id(guc, q);
>> +    xe_sched_entity_fini(&ge->entity);
>> +    xe_sched_fini(&ge->sched);
>> +
>> +    /*
>> +     * RCU free due sched being exported via DRM scheduler fences
>> +     * (timeline name).
>> +     */
>> +    kfree_rcu(ge, rcu);
>> +}
>> +
>> +static void __guc_exec_queue_destroy_async(struct work_struct *w)
>>   {
>>       struct xe_guc_exec_queue *ge =
>> -        container_of(w, struct xe_guc_exec_queue, fini_async);
>> +        container_of(w, struct xe_guc_exec_queue, destroy_async);
>>       struct xe_exec_queue *q = ge->q;
>>       struct xe_guc *guc = exec_queue_to_guc(q);
>>         xe_pm_runtime_get(guc_to_xe(guc));
>>       trace_xe_exec_queue_destroy(q);
>>   -    release_guc_id(guc, q);
>>       if (xe_exec_queue_is_lr(q))
>>           cancel_work_sync(&ge->lr_tdr);
>>       /* Confirm no work left behind accessing device structures */
>>       cancel_delayed_work_sync(&ge->sched.base.work_tdr);
>> -    xe_sched_entity_fini(&ge->entity);
>> -    xe_sched_fini(&ge->sched);
>>   -    /*
>> -     * RCU free due sched being exported via DRM scheduler fences
>> -     * (timeline name).
>> -     */
>> -    kfree_rcu(ge, rcu);
>>       xe_exec_queue_fini(q);
>> +
>>       xe_pm_runtime_put(guc_to_xe(guc));
>>   }
>>   -static void guc_exec_queue_fini_async(struct xe_exec_queue *q)
>> +static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
>>   {
>>       struct xe_guc *guc = exec_queue_to_guc(q);
>>       struct xe_device *xe = guc_to_xe(guc);
>>   -    INIT_WORK(&q->guc->fini_async, __guc_exec_queue_fini_async);
>> +    INIT_WORK(&q->guc->destroy_async, __guc_exec_queue_destroy_async);
>>         /* We must block on kernel engines so slabs are empty on 
>> driver unload */
>>       if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
>> - __guc_exec_queue_fini_async(&q->guc->fini_async);
>> + __guc_exec_queue_destroy_async(&q->guc->destroy_async);
>>       else
>> -        queue_work(xe->destroy_wq, &q->guc->fini_async);
>> +        queue_work(xe->destroy_wq, &q->guc->destroy_async);
>>   }
>>   -static void __guc_exec_queue_fini(struct xe_guc *guc, struct 
>> xe_exec_queue *q)
>> +static void __guc_exec_queue_destroy(struct xe_guc *guc, struct 
>> xe_exec_queue *q)
>>   {
>>       /*
>>        * Might be done from within the GPU scheduler, need to do 
>> async as we
>> @@ -1468,7 +1477,7 @@ static void __guc_exec_queue_fini(struct xe_guc 
>> *guc, struct xe_exec_queue *q)
>>        * this we and don't really care when everything is fini'd, 
>> just that it
>>        * is.
>>        */
>> -    guc_exec_queue_fini_async(q);
>> +    guc_exec_queue_destroy_async(q);
>>   }
>>     static void __guc_exec_queue_process_msg_cleanup(struct 
>> xe_sched_msg *msg)
>> @@ -1482,7 +1491,7 @@ static void 
>> __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
>>       if (exec_queue_registered(q))
>>           disable_scheduling_deregister(guc, q);
>>       else
>> -        __guc_exec_queue_fini(guc, q);
>> +        __guc_exec_queue_destroy(guc, q);
>>   }
>>     static bool guc_exec_queue_allowed_to_change_state(struct 
>> xe_exec_queue *q)
>> @@ -1715,14 +1724,14 @@ static bool guc_exec_queue_try_add_msg(struct 
>> xe_exec_queue *q,
>>   #define STATIC_MSG_CLEANUP    0
>>   #define STATIC_MSG_SUSPEND    1
>>   #define STATIC_MSG_RESUME    2
>> -static void guc_exec_queue_fini(struct xe_exec_queue *q)
>> +static void guc_exec_queue_destroy(struct xe_exec_queue *q)
>>   {
>>       struct xe_sched_msg *msg = q->guc->static_msgs + 
>> STATIC_MSG_CLEANUP;
>>         if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && 
>> !exec_queue_wedged(q))
>>           guc_exec_queue_add_msg(q, msg, CLEANUP);
>>       else
>> -        __guc_exec_queue_fini(exec_queue_to_guc(q), q);
>> +        __guc_exec_queue_destroy(exec_queue_to_guc(q), q);
>>   }
>>     static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
>> @@ -1852,6 +1861,7 @@ static const struct xe_exec_queue_ops 
>> guc_exec_queue_ops = {
>>       .init = guc_exec_queue_init,
>>       .kill = guc_exec_queue_kill,
>>       .fini = guc_exec_queue_fini,
>> +    .destroy = guc_exec_queue_destroy,
>>       .set_priority = guc_exec_queue_set_priority,
>>       .set_timeslice = guc_exec_queue_set_timeslice,
>>       .set_preempt_timeout = guc_exec_queue_set_preempt_timeout,
>> @@ -1873,7 +1883,7 @@ static void guc_exec_queue_stop(struct xe_guc 
>> *guc, struct xe_exec_queue *q)
>>           if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>>               xe_exec_queue_put(q);
>>           else if (exec_queue_destroyed(q))
>> -            __guc_exec_queue_fini(guc, q);
>> +            __guc_exec_queue_destroy(guc, q);
>>       }
>>       if (q->guc->suspend_pending) {
>>           set_exec_queue_suspended(q);
>> @@ -2202,7 +2212,7 @@ static void handle_deregister_done(struct 
>> xe_guc *guc, struct xe_exec_queue *q)
>>       if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>>           xe_exec_queue_put(q);
>>       else
>> -        __guc_exec_queue_fini(guc, q);
>> +        __guc_exec_queue_destroy(guc, q);
>>   }
>>     int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, 
>> u32 len)
>

