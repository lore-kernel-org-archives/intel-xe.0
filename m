Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C18C87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 06:23:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81FA10E4AF;
	Wed, 13 Aug 2025 06:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cR4eqR2L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7092210E4AF
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 06:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755066232; x=1786602232;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yzVXmPj/fadBim8lpFaWz2gFQoZQVIW+CZYm85DRLu0=;
 b=cR4eqR2LMFLESrvFm3apJ5jEJ9LWhMO3F/qoldA7OlROb+bq3K71zLiy
 JWTaQAT56HG06XOe9hEBIK+24ETrFv4qHDnYqQI9X88ASxPRoHnGiFC8T
 FNR3JT5ic9z5F5ziBBPa/1CHz6hyNk64vgh2RmZnZXjHDj0aI455pZJJU
 N7X7WkcXoKOk4YvTAJ1H37CX7kA9BvMTdMsryML+TKaZAdAkhG1+bLwwu
 pkC4c9GkTYDZRPpAUi6whFDCUUlXlEjXx0AFhqoUrZ+ZNeAvWWsylZSND
 SWDmqz63EKZ2Y4iJp2pRc0JSbbA93A4pd3A7bmAoAiJbZUB+823pEoz96 Q==;
X-CSE-ConnectionGUID: HptJva5oTraetlPctDwxzQ==
X-CSE-MsgGUID: XFd3W5PGRTuSuGdRc06RJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68725145"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="68725145"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 23:23:52 -0700
X-CSE-ConnectionGUID: 7dcaucpFTG+rxQ6G1JE+DA==
X-CSE-MsgGUID: e8OARsjyRyyKCBtzx2mdsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="190088784"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 23:23:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 12 Aug 2025 23:23:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 12 Aug 2025 23:23:51 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.61)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 23:23:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K2L6SBY8M4jcOtEZKrBQ23CZQWI0Q9Oj6q6Vd6i8Smj91H53jXz3X/YBoQFbf6wg5GWbjNgzldQjVZskow4wM2Npop6E4092IpxgzhD2jOld2uSZqWbKAk8Va8O650w+gObWlmwNoow5v7yj0rMeii4TPPffWbGdCPwInJd5cCmUP675Y03uT9KJT0ruSAtY7/jqBvFymBEQUcWppRbknSdBtpn3U1dCptDHEguCZD0+o8oMCv9YJiBevHLwCF+DgTnW1biVcQ3liQpWM/QE2rZAUAEOwsBg028XU3LANxPRLuiQgcprz9dGgghYBhIJCn+cYhIJWek434Ig/Q47pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xotJykksZ1ke9suot24Rj4HrLD+bFEhpn+kVdtl95+s=;
 b=bWKxp7gnUzxS5oSuzdwfTASkDogr+zRQFt+dPjnLai12bj58XlobseFZ1n/yN5SqrEAIZMoAXkBgJ29qESPrGaiu1HjhfJUz27Ohn663GSjRTZSy1hQ9bUSOOVQxH8NeSs1WP6rPJJxFqKevK7mK5IwzyBVpW4kXr4GOIcQ6gapR9YzlYkD6/BnBtYMRJva5ZnstPuwJx6xMJgG39OLgQzi1QWqnVECcBNDhzOYdExa2XBDLwRaPvh72dF5PWnpHSIcQMSW2n7zgz/vsz98BzRVgZzeoaamLwDtAbmD8jSHoeZyDtZ8xdDsA1nj5TxTUQitP685EeBnV+wOdA5GYQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CO1PR11MB5203.namprd11.prod.outlook.com (2603:10b6:303:98::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.14; Wed, 13 Aug 2025 06:23:49 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.9031.012; Wed, 13 Aug 2025
 06:23:47 +0000
Message-ID: <84629c13-7021-46dc-bb08-2dd2ec17c9a2@intel.com>
Date: Wed, 13 Aug 2025 11:53:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/13] drm/xe/configfs: Simplify kernel doc
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <prashanth.kumar@intel.com>, <dnyaneshwar.bhadane@intel.com>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
 <20250808-psmi-v3-6-a111e9f1e4b7@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250808-psmi-v3-6-a111e9f1e4b7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CO1PR11MB5203:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bee6b5c-0833-4d80-1894-08ddda31f5d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHNtNU9hcGFwcSt4Y21iSmhlL0Vqb2JRV2VzR1VuU0xKWU9yQ1cwV2xMYW5X?=
 =?utf-8?B?NzRDdEZxUTZnblJzbWdDelNaSExTeHNkZk8xMzlvWDFLczBtNm1Ga1hTdkJB?=
 =?utf-8?B?RFNjdTBVa0w1NFo4RVRFUTkwOTlmak82eG9ISXZvYWVZSHpXSHMxNDhsbTNP?=
 =?utf-8?B?akRFSUJhUi9LRFdpSmFIR3Z6d08vVEpPSE9JWEhEeG1sOGgvYU9OR1FObXlN?=
 =?utf-8?B?Mk5sSlZCQ2JOWHVMSDNsbnVPZHdXTWJTeitkTndCN3FIdEdmaEsvdU5KRWlx?=
 =?utf-8?B?UklXTk5KT0pyZ2VwVHA1NjV0NWZDMWwyRkxwelBLa2NiSzBJUHQ5THJYdHY4?=
 =?utf-8?B?Tmh5SXZJVXM0aDhRVDhZa1IvbzdJWE1IditUWk9LVzhjSXpSak1jTFJBQ1FF?=
 =?utf-8?B?VldrYk5Oa0RDWDJvTXpDVW1ZOXd4VHBnMU12K3I2MUJ6czRodlM0Wm9oSWYz?=
 =?utf-8?B?WUFWYy9MKzVYc0tFT1h6SjhuSHdrZ3loT3NPQVIrQUFTbVdVb21tNS93Q3JO?=
 =?utf-8?B?UnR6Vm5MMHFxY0FjZFhDQWF6Qk5DMFhEL3JQSDlHbjkrdjFwSTN0bUR0U3hH?=
 =?utf-8?B?Ny9qSGNyWmVHZ0VQMmJSYWVwMjV5dlFvL2phS2NON0dFeXhlZUVtUzRFdXlH?=
 =?utf-8?B?eEZ0akg0REo0U2Q0cmRBNEJHbTFrbzEwbitvdGlqY3pkTW03ajZMRVFLTFBI?=
 =?utf-8?B?UEl1cUllQng0RXVqMXBYTUNuM25lUm16QWxkNEFBbGh0TmVBSloyMWtTdU5t?=
 =?utf-8?B?ZlBXand2SkZHcmtYZytIM3ZTbWVMT2JXMWluZTVSZGtvWUpsd3JERWpnOGJN?=
 =?utf-8?B?TVFRUENmTGU1b1pNNjZMUUNnbUdvMU82SG5tSkVyKzdyQ2RDOTJUWjhQZTZP?=
 =?utf-8?B?TGdKRGh5YjVOaExqSW4vaVl5eHZqVEJBb3pPRUV2TitaUThwNDNibjBzbE83?=
 =?utf-8?B?TU00ejFnV0dScStRS0VCRnlZUlVhdjNIL1dTRDUrbWI5bjNrSHlRb21MVFM0?=
 =?utf-8?B?cmRxYmpFSnp6VFRoeVYzOHZJbjR5RklENVAzbHFjWVd2S1NOOGU5cnVNeC9j?=
 =?utf-8?B?MkJYalVSSDNZSG04VkFKbm1hM2dCcy9ZeDMrdVNDd3MrS2FxVlhIR2tSSXZQ?=
 =?utf-8?B?MnlCelMxbUx1Unh4ZEFlOU5Uc2lTNm1tQ0RXWVpEVXlSQ2EvaTlrajB3VkJG?=
 =?utf-8?B?K0d2NklpTm9PL0RPMjN3TXNuRFhlZUJxY1d3NTF1bGplYVNidzJ2czkvNzFD?=
 =?utf-8?B?S000aE5xLzVoUUtkVTkxaVVycTEreTZ2OUpZMW5BT3p1RjV3dHFKQitzaHov?=
 =?utf-8?B?d0tsZUNrMkhjSXI5WDlqd1RXUytjZnNPTjNkYnd6cCtuTDRDb3hCT0NPdmU3?=
 =?utf-8?B?WWh4Y2h4WGJoK256cm5rUElJWnJscmJlSHRPSVM2NUw5UVBrQWlnRWFMQ3R5?=
 =?utf-8?B?eG5VTXN0SzJXVStFQUhLN04wTzNUU0ppa2lwdGRtRjBxY2ZtUlhld3kxZXY2?=
 =?utf-8?B?cDczd3VlcEwrK2I3SWhkeHZjczN6SkkwWWRZaGJQbmd2NTdVay9wWWlzbHB3?=
 =?utf-8?B?T3VxWEtLVmwxZ2F1SGUwTE9zcFdQcHhFcDZXTE53ZlpmeTEwTm4rbjY0blVn?=
 =?utf-8?B?eHlnNVN5K1VHTVVyYlB3bUsxc0kxUGw1NUIrc3BCbU5MNDlmTDZSaWV1bENv?=
 =?utf-8?B?Tm9vdHEwbVE1T2dJVTkrNHJrY3JVdjVTMm50LzExUkErdk43SDUycnVzVFdL?=
 =?utf-8?B?Ti82cjlKR1FiNGV3UVk1amtoN2dhQ21OcWhOVVQ0Mms4N05jQjRzb1htY2g5?=
 =?utf-8?B?WjJUcStEOWFFaFgwNStOVjgwSmRIZGtLZm4rRFc2dDFXMVRVR1gvSFFoVklq?=
 =?utf-8?B?Wlk4dHpyd044Wi96dUljVERIazdnNkhxeS9GVEl3RnQxelFaOU54ZU53Q01K?=
 =?utf-8?Q?UnGSYzEg8fw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0E2MDhDTkswVUVscG92SG9McEtUZ21jVUR6VWRLR2t2cXdRT3VYV0FXZUhX?=
 =?utf-8?B?Y3piRk0zTlpqaWptWEd0Sm82NHc4ekFDUmYxYU1MQitFTnF0WmJJbWFudysx?=
 =?utf-8?B?V005b1VIdXZ2eHFYSWIvbHBvQ1ZzT3k0R1pRZC9oRGtsdVFaUVl0c2pLVlhj?=
 =?utf-8?B?WloyNHQvdzNOWDl0aS8zNkhEM1g4dGovYkZvWVkrOGpBOEQ0M1FKZTcvNTBS?=
 =?utf-8?B?bFRTNWsrckZqMGFJVzZ4RTB5eng5SUVTeHUrMEJ2ek9RdjdEdUp6VmtPYTgx?=
 =?utf-8?B?dHQ4RXlxTmRWRFlNODk0eG9lRngrbjNkbU5Lb29NZlJZdTVvUmJuZHBpUVlz?=
 =?utf-8?B?WGdzK1BpalZlaU9RN09NVENzbHE5M1pqMDY5WjBKeFhSSmEreWRmMkRKWEcz?=
 =?utf-8?B?OUd2NkpXZ2hqMnd2SzRoaVJ1amNxeDZINzg5YTRYZXl0eE0ybTBTTnBzNXBv?=
 =?utf-8?B?TG1UYUU0YjR1bnRjZm5hT1BBbXkvaWF3T3djdW5LLzlVamFrNkVYMHFyaWo1?=
 =?utf-8?B?TFNuYXFKMGRHZUFHQlhNbmdnaTZZalpBR2tkNjl6dXdkRVNjWnZpWUMvblRs?=
 =?utf-8?B?T3VCMEwvVlg0NlpuNmk2RkVZSldKOHRsc3lHSEhOdlFrbks1OUY2UDUrT2dk?=
 =?utf-8?B?QXFtb0h0a3R6UGFiMG9Nbyt5NTgraEw1R2cwcEVXVHVkMVRESFRkMVN3ak1C?=
 =?utf-8?B?TCtiMGVRZWJkc3hQVFhwam52cUpSQW5Tc01pVC84Nm5lUThjNXlRbGkrUEVU?=
 =?utf-8?B?bnh1L1hpRmFsbHdMblBTZTh0Mm1mRHVrN21uaXhSQ1B0aE9lS2c2RGVGZEQv?=
 =?utf-8?B?c2ZYK0E4Wm9tQkZvTkpSMDZDRkhxcDFlTkpiMnJrV3hLL3g3WFMvOSt0YkJk?=
 =?utf-8?B?a29XY1pJUFN2c3p4U1poanViTWw1ZWhiZ2RobFFTZDdIRll0aXp3c0QvUEl4?=
 =?utf-8?B?bmlGdFFxWVozZ2pLbDc1RUNKSmxmZUpTYndyd2xWbjFJOEE0SW5iZ3hUYzBl?=
 =?utf-8?B?WWhxZCtYMTNSV1g2ODVjNkZxelNhMFExQU9QMlcwSVFoaXlFZlJQMkg3SFVu?=
 =?utf-8?B?dlpiMzQzME1rOVFaN3hqR0FpNlhkV0JRZkxzMk42YTZ0TGFqM2dWejUweFhD?=
 =?utf-8?B?Qk5vc0p5cFhqQkZWRURnK0gyUlU1YUUxOGtiTXZiWFBQanBMZ2tORDJ1cDFl?=
 =?utf-8?B?QnROOVVWWllGRGdUR3RtbWxkd2pEUVVpTCtqUysyVnVPSGdsSFBoZElyZnhY?=
 =?utf-8?B?YmpkUk4xUzE0c0JCTnRuVXc4UnQvWW5nR05VNzhoWTlKekZlSkFTK1NXeUZh?=
 =?utf-8?B?NlZINWlaWWJhaXF0RWlUbTVURW93NEpWMVNUYlc0UEhrVUxheWEwcWU5cnRu?=
 =?utf-8?B?TXYrTXI2dHJYTkNETjdsNkVxS2prM2RqdmNJMkJwelBibGRVb0IybGMyMytI?=
 =?utf-8?B?QW53YTFHVCtiTXdvd1lXUk9XSTdTR0JKdGtpYXBiQzc3NmJEZlo3OG9Nd0hJ?=
 =?utf-8?B?MXQwbVJIVStIcUF5ZmdTU1JhOFJCMitCWlJUaGlwMlBvV01WeGtOYmFqQW95?=
 =?utf-8?B?Q2NzOElCd2tOYVY0dUFnUERZbSs0aVRjdHZyVUY1MDkzaUNoK1liMWprSzFQ?=
 =?utf-8?B?YTBQQmJzaTc5NVpPNTNOWTZSdDhXaDlvemtVZmpZWlhTMGxLckVZNllCQUQ0?=
 =?utf-8?B?VWxFaG1OWWl0Y2t6ZGI5a1pLaTl4OVNKK3d3blBvenRiQXIyZTlEbkRBQmx5?=
 =?utf-8?B?SDVLU1piL2VjR29UNkZsaUR3TmZGbm5OZ3BnV0o0QjU3ejNDU0dQNTRscEVh?=
 =?utf-8?B?VzdZMENGQnYyWlF3alZydVluOVhrZDJDZEh4NXduUHh1RGxMWFVSb2w3TmVL?=
 =?utf-8?B?OVAxS0tXMU5YdmJXWVlUQjJmQUNaMU45cnhPUkkyaG16amFMYSt4UytRajZ3?=
 =?utf-8?B?SGVaSVU5Y05oNzE1cUVBWGxQSlBEeTU4Rm83NEpHdFB2RTgxSHRUSjlaRXJs?=
 =?utf-8?B?Q2tDN1FnQUI2b3JPSUYycXBEaTNiTnJhVEZRUXp5SjJkakNIK0k2c0JZKzFD?=
 =?utf-8?B?ZnFOcUFTcXZyaS9IWU1Rd1R2NlpISVVEcUsrdXFuQWZRdFhVcjJIMzQyZzE1?=
 =?utf-8?Q?e4JdmDu81Lv92vDv6wfgtkDTB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bee6b5c-0833-4d80-1894-08ddda31f5d6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 06:23:47.3369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/HmAkH3BYU9y6qrzNg+FoZ2smNuto5zsU16W9EnH5f/4so9GP5TD+luevZIh7fE85hDeeAQzavLiLd/NDwg5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5203
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



On 8/8/2025 10:59 PM, Lucas De Marchi wrote:
>  From the caller perspective reading the documentation, there's no need
> to be so specific about everything the function is doing/checking. Just
> document the functionality a caller cares about.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_configfs.c | 15 +++------------
>   1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 853da2ee837ac..17b1d6ae1ff6a 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -389,10 +389,7 @@ static struct xe_config_group_device *find_xe_config_group_device(struct pci_dev
>    * xe_configfs_get_survivability_mode - get configfs survivability mode attribute
>    * @pdev: pci device
>    *
> - * find the configfs group that belongs to the pci device and return
> - * the survivability mode attribute
> - *
> - * Return: survivability mode if config group is found, false otherwise
> + * Return: survivability_mode attribute in configfs
>    */
>   bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
>   {
> @@ -409,11 +406,8 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
>   }
>   
>   /**
> - * xe_configfs_clear_survivability_mode - clear configfs survivability mode attribute
> + * xe_configfs_clear_survivability_mode - clear configfs survivability mode
>    * @pdev: pci device
> - *
> - * find the configfs group that belongs to the pci device and clear survivability
> - * mode attribute
>    */
>   void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>   {
> @@ -433,10 +427,7 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>    * xe_configfs_get_engines_allowed - get engine allowed mask from configfs
>    * @pdev: pci device
>    *
> - * Find the configfs group that belongs to the pci device and return
> - * the mask of engines allowed to be used.
> - *
> - * Return: engine mask with allowed engines
> + * Return: engine mask with allowed engines set in configfs
>    */
>   u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
>   {
> 

