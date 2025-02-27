Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED01DC021BE
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 11:22:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECFF10EAB7;
	Thu, 27 Feb 2025 11:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T6hn4K7i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754C410EAB7
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 11:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740655337; x=1772191337;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HvXbLQlZmFO3s3tPzMOQN8XOuZuFOFu+XD2mF0e/Y2g=;
 b=T6hn4K7iE0JPbVMJpQNj56/D3Mo5ZKCMHND4iSxwRBnTKL/rUVLEa8dK
 dzacTXui3WmHa/b25j378TZmGln7ATqtfnKAx+MlRs5TwOIYCx864QIdo
 3CrczlcnxfGhqDz0eKH89cxLfT/FyVxuJDtp0hni4lmEl2bHJZ5EJ28TS
 9KO58A2gRcZIpwm4Edtro9lglu+Sw6ThaHwHvZfDiqblTTyySic/Ms9M+
 bFEdvXFCR3AuAfBDv9oJSSf85f/R0KOIKfc2Vzf27Th1w6dr1B43Wi7tW
 l6KwZf/q8RS1vi2injJbJ1dzGUWAIWWZUCmYBdnXg1PlLkoEpX2jpJTkN Q==;
X-CSE-ConnectionGUID: qb9jeDalS/G/AG+k8lNskg==
X-CSE-MsgGUID: W9FGIBuQTiObwczw6crSyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="45318614"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="45318614"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 03:22:17 -0800
X-CSE-ConnectionGUID: 3gQZkB5STHWe82/uFesPfw==
X-CSE-MsgGUID: amd1r6t3Q3agY5ComqDecQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="122109792"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2025 03:22:17 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Feb 2025 03:22:16 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 03:22:16 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 03:22:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bo4OY/722a4uxJbVeFkYVo0ocYylrXcEnN10seCrVNKfW/OFonFrEA4g18GrMXMXnvqtnIpgYI8wsnIu72DZvnauCTnD3swhNL17UqcvZEnLuAGhmTCkExOEsLKfW9ePiBj9/aT+AMyX7HpTNjObAePXQ7nu4UFW+KSKvXLED+ej3oP2SaFUJcdbeEX/qQiLzj7i/FekxHE6jWmjYcrxLmAzuh9fhwpBwp1Dd4N+hc+gv+OL0XaCNMW3+uByBn+PSXmCd8ukATpTa51Em4HRMyi6Jc53h88vvm/sOHkBDu75irlL3LjidbEuhYtPNO+hGfnMO6s16n4d5I07LMqlkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIESeq9uO5CybPUCp09640dlU30zDp+ExOfCUulj3yA=;
 b=CEC17y0bAn/trMhkPj5yS4Zth1Nt8iPTUSnVuNyd6sykDbq6dIyeQRHhixHyXHp/0LdilABPcpgRB/V+NI6O+iSJ96ZPmjtSEq3rIuQOLUp9+8vIbAEcSaQDhaztjeWmTeO8/t1Ly4O8NtegTpAvwJ7x4I5ntTHatYg/44/n5nsfkux0meLFAg6bRb4KduJSJKzlOR6/YyOp5M9Kt0R9xozxcTfvmzUi0GDAM+cJJ5PJ0c9Ee+h7XLW09FL7cfZr53JnOM7f8mQpf0nnLFkiyyz92rDizArV4m7N0QH7lyfHgy4z262H3U96Hpo/G05Lzbc9jofFV0DtuzB7oR+Y9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by PH7PR11MB6905.namprd11.prod.outlook.com (2603:10b6:510:201::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.20; Thu, 27 Feb
 2025 11:22:13 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%6]) with mapi id 15.20.8466.020; Thu, 27 Feb 2025
 11:22:13 +0000
Message-ID: <91ed57cd-f17a-469e-9bef-fd43f2894e39@intel.com>
Date: Thu, 27 Feb 2025 12:22:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/vf: Set submission version in xe_uc_fw struct
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>
References: <20250225132337.6508-1-lukasz.laguna@intel.com>
 <20250225132337.6508-4-lukasz.laguna@intel.com>
 <f42f1fb1-9cca-429c-b232-1dc2984e04fe@intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <f42f1fb1-9cca-429c-b232-1dc2984e04fe@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0032.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::20) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|PH7PR11MB6905:EE_
X-MS-Office365-Filtering-Correlation-Id: f8aa9c1b-db17-499c-36c9-08dd5720fbe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajRCdWtwTnBxY3prN1FxdC8xMnh5ZjNoeEJKUlNQMFpLcDRhclpMc1VrQVJq?=
 =?utf-8?B?aEFoTDFwZm84RW9DTkpzbmJlK1ZKVER2Uld4WWRpTG05V0FKTkxuMEdaTTJm?=
 =?utf-8?B?QlJMM1kwTmZyajloc1ZMUzdGVEFjYWh0bWl2VHdRYUdUQTNPV0tGQzlWTkpE?=
 =?utf-8?B?aWkyandLbndHK05NTENFNDcyMmFjTGZuaTB5WDh6dDM1YmYvTUZoeVZ4b3lo?=
 =?utf-8?B?VFkwaCtsZUF2QW1QRUZCT2lqZUtOQ2Ercm5YdVYrS3pnM0lBaStkQTd2L3c2?=
 =?utf-8?B?Q3pKSFJWd1NSMldLWlB6Q1BBUjB2NWozVnIzLzRsRXd2cjJHVFB5OTI4WlJ3?=
 =?utf-8?B?V09yUWJ4SllLcTQxZnBpaDdsSGsydEdnOUxPWURDSmhMeG51SHR2TjdHOWE3?=
 =?utf-8?B?d3VhazIxbE9qNGVzU05ycE1OaHFZRndkT1NBTU1VdUU4ek9iZGhhMXhxbWlz?=
 =?utf-8?B?RWpBbnZtZFJzcmtQdnlhYUZyV1NLNWl1cTVxazdmTks5cnA2Qm5jRDlLTFNw?=
 =?utf-8?B?cllZOHk4SUIyNGtzWGlQdVFLbkpKSElmMC9wNDRKRUZMYXlaOEdaWjZQZUE2?=
 =?utf-8?B?NWw2MHladVdOY2t3NlVBTTJQb0N1YkY3blhCM1ZqTWJPTjgrUVFENkxKZHV6?=
 =?utf-8?B?cHRhRlZKQlJlWWxCMFM5MTIwOEFKUTVObXl6OW1Ed1U5RXBrbGo0bFJQZkZN?=
 =?utf-8?B?MVhzV2ZpUkp1NjQrYkV6eFZIaTJtakxZdHRYMnM5TGU2ditWVjN4SXFoMnhs?=
 =?utf-8?B?RCtGUmx3OUhaSkVKU054cWdYNTBMeUhlbnlZeGU5YjB0WHhLV25uM0tMS3Z1?=
 =?utf-8?B?ZS92aFJxY0VnYVh0dEtNdXdFbHFxZDcrR1FwbjIxbjBqSFhvMk1SRjlXcUNK?=
 =?utf-8?B?V0ZvK095MW9UVnRyNVRNR2w2bkFzeVAwaEtBNTZqWEc0cCtjMW82dWlyVVY4?=
 =?utf-8?B?QnpydTZMR1hZeWRUeXNvWDAwU2VlbTZYN09oemRUZ2xBbkNLb0FTbGdJY2FG?=
 =?utf-8?B?cjl3WDkwUjV6V2RkdUpzdk5LQkJJZGk0eEJrMjJ0dEYycHVZTE91WVk1ZWY4?=
 =?utf-8?B?cG1tczgxVUhta0ZqSnQzZkhEd3U2SjZscTJUOUlXNmI3SWhpTHE4R3FrMEVO?=
 =?utf-8?B?cDFKd2RyUHA2N2kvaFdtRVNxTU1lcDkwN21KbEFaaHZ4REt6bFQxSVRNSHpy?=
 =?utf-8?B?YmZ4WVdESGppZU54RGtDUXk3QjF3NmJVb3N4cVNzYXUwTzNIM09GU05IdlNx?=
 =?utf-8?B?ZUZYNXBacXJpeGNjZGt2anFPZVlZNTdlY0dwaktZVm9TaFpNWkFMN3RubnUv?=
 =?utf-8?B?UnZNbUNKOUwrdVY2ajRsZmRDaTVZeXpsb3RERjlxdVdKKzYwZ3BwNGNlNWZQ?=
 =?utf-8?B?ZGRpS2VKWkp4NW00RE10RVJpUytkcWNDYnpzV2xSdElabFpYU3kxVjc3a055?=
 =?utf-8?B?R1VVdzcxOEJGZG1GQXJvcmJBU2kvbFI5RXdab01EeW5Db0h3c3hIRnJTak1V?=
 =?utf-8?B?L2drZloyeDcvTTh4d1RCSDhPWnlGZC9EajFkMHRDM3c4MDloRng2bFRXUTlR?=
 =?utf-8?B?T1JLUnJqcmRrcDZiTWt2bUcvME84ZXhrM2JRTHlqSjlTaXZTVVVzNlR3VFY4?=
 =?utf-8?B?S21yK2dpTUpma3BnTGkxNjU1aGZ3QUdpeXVqQ3lzUnA1Y1d0Zi94aldKVjFT?=
 =?utf-8?B?bFYwNFl4RHBCLzh0MVdpVVJXUE00S2M0TmlmNmVwZEVEY0p6R0MwVkR5K2hF?=
 =?utf-8?B?QTMwSnYxMVJYenRnZHNDME9pckRLZFJUV1VEdjdhMWRFaUVUTE9NczVwbGsx?=
 =?utf-8?B?S3RMeWlnT0kvT01XRE8wL2s4R3hzZnpoSzk4WnJLMG1jNWZDdG1vTGdBc1ZD?=
 =?utf-8?Q?wH2EG+47+mtNv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Um1DSDJKUGhTYWVNT0ZOeGFTdU1rSUZZSnEwTzdCTnhXK0dlOWFmY2NpVnNY?=
 =?utf-8?B?ZEJGM3dTQSt3bjlKZU1SSVpKTG5rSlBYK1VUMVlxM1FjTnVVb29jeldKcXo2?=
 =?utf-8?B?RzdiTlY2d2xqY0tmNVoyR0I2N3MxdDN3Q0JLUEN2a0Y3NlFzL0U3ektPbGlw?=
 =?utf-8?B?Rk9UdlBrb3BYVC9JUVM4YlJjTEhWekJDTXFoRENFMW45VmM1UkJjVXllemZF?=
 =?utf-8?B?d2JHWDA3dWpHUGxnTWhia0l2WVZMdGh0SmJERm5LWnFJK2VMR0M5dFFWS1Fr?=
 =?utf-8?B?NEVzSzR0QnBMbFZPakxGeVVaNk56aExZRTZONTFodFpoZkRocjJIYS92NG5q?=
 =?utf-8?B?WGhnYU41aDBuV2l1MENLTGFjSHhUSGNFcEJYb2dmWXhrLzJQVmpnMCt2Yk91?=
 =?utf-8?B?bTZNWDJsUDc5bXFtQUd6T2dqa3plNjRvLzl1Qkd6YXptejZjS2VvVzRsZVpn?=
 =?utf-8?B?SUtFMUh2TUFTdDBVMnhWQnVhdzBRLzBtSnR4RVFhVFo4RkxLNGRQQVVSR1Vh?=
 =?utf-8?B?OWJBWDcxT1o0dDVvb3lQNkZWTnpVUVNILzJHZ2lLM3REN21Ham1qeS9ReDFl?=
 =?utf-8?B?b3hpZk52K0FJcHlGV1dWTE03Rmx0L2xGRFBBNW1LeVhZTGE4UDNLa0VvZ1la?=
 =?utf-8?B?NGlnUDFsdEEwSEVPWHNZODlqRFpzR1pvN3paa0lUR3ZpeXptVGNtd1lscGRO?=
 =?utf-8?B?RDgyWUlTRkFmLzVUVzc5L3ZWUXdhL2Qrd1h2VkdYNk1SckZyWWxHbVFMQWJ6?=
 =?utf-8?B?K1FvK3RCZldBSjdFNy9GV0hZeGMvWDBoa2FBdHBQNDdaSUU4NVRlMEZ1UGUz?=
 =?utf-8?B?TytVS3pmeVBwSWdpVVNFeVNXZVVXdDk2NGNmeEc1R3BvOEJRN0U4cEFQdGh5?=
 =?utf-8?B?dmFHSHU5UVA2L3hFUjgyRXlzNG1kcTN1UG1yaDZlRGxMcWZpNzRFZWs3TElV?=
 =?utf-8?B?TVp3TXZjaGQxU2RkLzBpM0piMVFxdzFaclVEaTdTZWo4MUlQUmM2bU8wV1Fp?=
 =?utf-8?B?STdRb1NBS0FqSW1IaHFJUHloSmxWeWphSjNHN1NXekxlZ1l0V1hUNTlDeUpG?=
 =?utf-8?B?RFR5MGhzbTNxM285cENBZkczYVp5RlIwbXhnVHAwaVhPbHVIbUoxQXh4ZmVm?=
 =?utf-8?B?MW9UWndRZmtETGxTcGZiWG5kNUl3cmtxNnBveVhqU1BpQisvWDJEa282cEFr?=
 =?utf-8?B?WjZQd3hROExYR0cySUhOakgyUlU1RGF3d0czR0dpVkF4ODN1VUdhTzloM1pQ?=
 =?utf-8?B?cm1ZVXYwZVJNbG5FeDllSi83MDBubXZ4aUJZMXRpVzFVUmJrRjl4MFFNRmpE?=
 =?utf-8?B?bGs3ekZKcU1BeDZDYXE3VHVPRFRScDJHUTFQcHRlZHZMbWFScUFFVVBxQXFX?=
 =?utf-8?B?eVFzZzlIN3ZGdERmckZmaDN3bVUvdXNLWHNUM1NrMy9SZUNta2pUQ1Ntc2JC?=
 =?utf-8?B?TGpCVVd1UnBZWWRxM0EvSkE1YTBpYWNMcTFjV2JmVjViN0tza0hEdW5kRXRy?=
 =?utf-8?B?RnBNOGtLZkozcXY1bS9JekNzTXpPWlBVZ3NyVmdVTC9DTWMxUktmWVFneW9L?=
 =?utf-8?B?YUkyTVhIYy9aL2xyc2M0dUZydDdWY0VJbExrbDd3cFhNNGZhOTJnZUp3b1Qr?=
 =?utf-8?B?WG95RlBjV3krTnpMRXIwR0dqNHEvRnN2MlJNOGpLbytpckZML2gwRDBhbUVt?=
 =?utf-8?B?dVNJaHJGWnlKbkRTekZYVU1kbkVMb2ljbTc3cGRoRGlHWGNPckhScWJLSlYx?=
 =?utf-8?B?RUhXaGtMY0VKL2ZKdFlNam01OGttdjMvNElBOHBpKzVadHROdUN0RDNDam9l?=
 =?utf-8?B?K1B3SUEwaDlaQTQrOVJzQ3puaGV0djZCYWRqbnRpQjJ3ajBrU0l5MGxEY3Rs?=
 =?utf-8?B?dDZCTEdTbENZdnNLOW5VckNLQlFadkdUN3RmSDc2OXhFWHhEVGxQVVVYcTdN?=
 =?utf-8?B?V2cwNGZMRGJNeFJMUTNWeWtDbEJMUHo0SExEU1liSnF1M2NpenFzQWgza1dK?=
 =?utf-8?B?VnhhWjN0b09KdW5oQ3JndUROeEkyS0RtdDhVV21JY1R2RHBHTDlnR1ExbUQw?=
 =?utf-8?B?NGRtVGJrU29QWkN1dlNsL3JMMjM4dDd3Y1ZpWkU5YXV5Q1JvSkVyZEh0Zyty?=
 =?utf-8?B?ajVhZ3lndFhjcGIrQlFxSGNUa25zbzZoYmYvTnhWR0JDVk9MWDZOL0p4SE0w?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8aa9c1b-db17-499c-36c9-08dd5720fbe7
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 11:22:13.5187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHCR5j0kW7SIZEg3CSqhKl8O2AsdWTeXzo1R4yafVKK+dDQzSPHL+WeZEcyBpCdnx2WW7cHdu0E4DbwhtH/3sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6905
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


On 2/25/2025 23:30, Daniele Ceraolo Spurio wrote:
>
>
> On 2/25/2025 5:23 AM, Lukasz Laguna wrote:
>> The VF driver has already negotiated the ABI version with GuC. What
>> remains is to populate the generic xe_uc_fw struct with the version
>> before initializing submission.
>>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index bc1ff0a4e1e7..7b38447d902c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -703,9 +703,16 @@ int xe_guc_init(struct xe_guc *guc)
>>     static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
>>   {
>> +    struct xe_gt *gt = guc_to_gt(guc);
>> +    struct xe_uc_fw_version ver;
>>       int err;
>>   -    err = xe_guc_submit_init(guc, 
>> xe_gt_sriov_vf_guc_ids(guc_to_gt(guc)));
>> +    err = xe_gt_sriov_vf_get_guc_ver(gt, &ver);
>> +    xe_gt_assert(gt, !err);
>> +
>> +    xe_uc_fw_set_compatibility_ver(&guc->fw, &ver);
>
> Why not just pass &gt->sriov.vf.guc_version here, instead of copying 
> it into another variable first?

By using xe_gt_sriov_vf_get_guc_ver(), we additionally verify whether 
the handshake completed successfully (major > 0). Only in that case we 
set the version in xe_uc_fw.

Lukasz

>
> Daniele
>
>> +
>> +    err = xe_guc_submit_init(guc, xe_gt_sriov_vf_guc_ids(gt));
>>       if (err)
>>           return err;
>
