Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FB4F483D7
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 19:27:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB24610E4A2;
	Mon, 23 Mar 2026 19:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nyqEx/yQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E3010E4A2
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 19:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774294048; x=1805830048;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nLN27xy0WK9kJRwGhl2LGHWf8S3BVVIZJ6hceyNz8oE=;
 b=nyqEx/yQZlk0GS1kX/o3DTiGKycbcWiWbxgernKw93rkwcmZoewHrnXo
 sUreMP2WgAq+XWiz5WOZtgwBzE9POYRP3h/xQADI4l7KgJEX3G1Ixu5PD
 fZzTkQJe/66WoeDykunVhSookUCoL3724LmOxTcfMEq3f2iq958kQuKrw
 VdQzEjLVHQQMDXtknR/sYvcAW5d+vvfkD0f+04DRMdWZWR7r8QrBFimCh
 eGG1F6UA3TlBV5XGFXfCjHRoR421hnFp50qdQDRXc3/WCJMyNY1/86Lgg
 QsXHA4yZchkmKo2d84BAoVuRV7y0xFZ8cQNPnWx6xZ8sEsqbRvjmakBIU A==;
X-CSE-ConnectionGUID: 2dNzrw8GRyW8IzqwGTmPEg==
X-CSE-MsgGUID: WF+L6PxOQnKBozvXwAHoYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75421561"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="75421561"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 12:27:27 -0700
X-CSE-ConnectionGUID: H7sY0i+7RMyitjDtZl4irw==
X-CSE-MsgGUID: LikdrZKXSVubS72HspywfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="247159763"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 12:27:27 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 12:27:26 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 12:27:26 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 12:27:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JhfJZzbaY8PoZ2wEmp9EBzcdDXrjDNp6125cz/6cJes8o6Y2qptCnEyyiq0DAGsDHZksYcA58Dv7yN5c3rYsw62ZeMuFfS09jBHDoW9h0snr897YEPh9CCnF2k31gcQAQY+UViFKSt41tyWKObAIAbdZNSMSKv4udR1aNSrzbFnKD17zkXNcKmdr/eSt8sbEIAvMsbtOLQlHO4gQQxL0rvwzdN5/UIiD2ZmXie2V3hvlg9N720xjPLPOposFUs2U8GtR7EKqiBufDL+R3YY5yBWUpUx/kOKBei6TMY1Fuwhmi9KUwwotHaUNIFp5ZBBoQjKQF8TAgsWbrDqSyocrvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9k86HZ724pEUFiMvL5YpqpBBUUIFzR9FTMYErwJ7qtQ=;
 b=jRC4jBnaayTHgJS7mnICTzpeoLZ2sascqlb3WjQwenYJJDz3vRwst11s8YwApdrSzmoZYtunFCBDaitW6xDebfDIca4FSDzYqV8ED0DsozbWNyk4PsnsShxyibeeJ/XVEI8ellInkcKF1bHDZYM6znC1Obavy4bnWFDrp1k1M74YS74s294cTVvMXOve5l3mnj8cEvK5TfG7H6o/XFL3ou9+e6XR+Dj87IrIwoodWiYqY89l45/Gu9wsViw3ul7nI5+kOQQ8VEYHmKfXx+r0MZw/XLXexE7qIAMon6Gpn8aZ4A9IusNgvHsfOCJ8BNCRuVB29hM0SVK/2vKqMxIiYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 MN2PR11MB4551.namprd11.prod.outlook.com (2603:10b6:208:269::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Mon, 23 Mar 2026 19:27:24 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::91c6:c5ce:2424:d1ce]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::91c6:c5ce:2424:d1ce%4]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 19:27:24 +0000
Message-ID: <662754e6-5a2f-44d7-a83d-e0d5f9a1274f@intel.com>
Date: Tue, 24 Mar 2026 00:57:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add POST_SYNC prefix to post sync instructions
To: Matthew Brost <matthew.brost@intel.com>, "Bhadane, Dnyaneshwar"
 <dnyaneshwar.bhadane@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20250424092941.2819640-1-ravi.kumar.vodapalli@intel.com>
 <IA1PR11MB6266DE91973CDC2237B392E7E297A@IA1PR11MB6266.namprd11.prod.outlook.com>
 <aZdliOGe1fXUtF78@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <aZdliOGe1fXUtF78@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::11) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|MN2PR11MB4551:EE_
X-MS-Office365-Filtering-Correlation-Id: 9461ec26-2fd9-4d6e-798a-08de8912360a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: VZwE7wHI0v5L+DRyvnWawO9p80YQSgHwtDiBZxuP6p6KVG3QpB2IaeGTrD8H5+gIqkpX7hVFjtM/dcoC6Y8Afb1zkZHPcjNmYsnCdmgqEctV5V/0qNaeP1QIPm5Iviw8235RiXAXIm6LlADwP5JGgTVJVvzYUeHlQ3xpc7gTG4Wgi8utuV47UhNsOOzUaYjIH96gCO088wkWu4krWwCtNJxUK63EyB3jjrUsLVkP7kmOMZ2YLaNsi0lVYcu2dKYgSD+/tOtlDN96vvoWtUFa40t+2njEu/d8LrrP7MhB+qg9oSL5Jjt92lN6/E4g7fhbYxEuhIV3DF6y1VR2gwqiC+YAb3P6DLdzAsYO8BzeExd2lQ8ukjiGcMC5J0oTqUOWSJUtHRtgaH0JfsZDGaG+4RV6bauRMMesd8wlwBX8zHz8rTfLNXfu16PKotgQdbaAqWC8z84R+/ikkhSxsG7qzErSABQvMlSiEA3q4B+nVADjyCOG2qwXWmrKIAGSyliXhxY9nVQFk/H/eqDOOQR3lyfQaComoQ9hIgZ8HhQ4sUH1Bg5Ej48EJvO4FRxS4miIchG7MiZdRDP12e+MUk3rKxgc0N383bYsol2yhpi95owexnQj7pDmh27UNpjA3U3sDIxB5mJTuICLVX2aMhsh0zHLE/1IxFo27plKPud3utsRI05/uvMoMcUSTvS7LT/sGOaeKAGEk/QtCIssK3MO4hEjHFVfzv/tLlZZsGZG6Xg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEhIYXhQU3dJOWpBaDVOTTdiT0RYYVpvMFVNellqT1FEY2R6TTA4ODFGTVU5?=
 =?utf-8?B?aTQ0L1piUXAvOWdwWDdqT0QvK2dtK3F4dTA5eUJSem0wZTAxNGsySzhGSEJP?=
 =?utf-8?B?WmxvYU9pL0FTQmhlT0gwelFXYXYwSWhXQnpmRURHQkRXcEFMT3p2YkZtMUw0?=
 =?utf-8?B?TWFSS3NMS3NHazlQdFczSjBtd05yZjF1NDF0aVA0MjhaL0gwemZaK1c0RXZZ?=
 =?utf-8?B?eFFZcWpCbWwzWVZPYllvU2VUcFFGZ3hQTjNpdWNGZzFmRVMxaENUaGJITWNK?=
 =?utf-8?B?NVNRa2RzbnlhVWNiQ0crdDA4WU5sQWdpbWVYRkFOa3ozM2k5cFJmUVBJaW1P?=
 =?utf-8?B?Q0YvY0FjT1hsdTBDdzFVMU1RMWY0ZThBWkd5MkdCN0tEYlR4UVZJUlJtSUhq?=
 =?utf-8?B?T1hFelpaZGlTQWFucmhHUjErN1ZiT2U3b0VCRDg4MmJXUmpjNmVadkFINDZK?=
 =?utf-8?B?R0swbUFNSEYyR3h6OE5XWG1LckdURzJjSmV1dzQvekJQajNpekk2d2xteDVI?=
 =?utf-8?B?czlmOHR5emVKRElaSUhmcmRQSnV3SllTTTJSaDlMQ1d5RWdjUkJ6REVqRlRH?=
 =?utf-8?B?NG1uK1FQYWlsek9PNmxuaFljOTVkQ1MyWWVCTjVSaHh6c0VrYmZHOWEweVBV?=
 =?utf-8?B?L1hCTnFQSjdQSitGQThhS2VTZENKS25WbU5tOGkwV0N6Q29uZWVPcFdtanpL?=
 =?utf-8?B?cmU5SEg0VllVNDJGaUkrdTdNaEJQcWhsVVR2a1BiakxVenRBU2J5VGZLSEVK?=
 =?utf-8?B?NFhZMW16b0o0U0tVc0xvRi92MHBDSmc5MW45Q1B6ZEttUHlsemFidkpjY2U4?=
 =?utf-8?B?dUlHRllEZVkwTHkzaGJ6YXFXcVBKVHdtanZnYXhPOWMwVytESVJZRW1DelQ2?=
 =?utf-8?B?Tk9GamFSWU15TlU5bi9OUHlqTnpDWWp0bkxLVEZOMWxQc2pTSnhjVVdnYUdj?=
 =?utf-8?B?YTI5cHNxeFZtWWowWTB3TlM1Tjc3UHo5MHh5alg0WFJhSHlxU285bWhJU0I2?=
 =?utf-8?B?L0FhTHNieS9Ka3RXbWNNY0tnVWhLdmdBZkRZRHVGY3VTczJmU0dOckw1Yy94?=
 =?utf-8?B?Nng3MG9FTGw0U1ArUng4ZXRtbWdKT0xXbUpTMmFrb3JCWU1yK2RnQ3Bldlh4?=
 =?utf-8?B?TU9Bclk3SUQ1TW5jTnk1UFBzMTQxN1hoR0NLUkZnemZ3Y1RMSlRzTE9lNFdL?=
 =?utf-8?B?S1NNdTJBNXYyUlNLNldIK2dnRFR4ZzI4NTYvMHdoNTh0QlczSzdHbk93dlBQ?=
 =?utf-8?B?SjEvOHlscnp0bVFVQXhDQ1ByNmlxSjczWFZIa01Zbk9kMW5HOGdkRml4YWJI?=
 =?utf-8?B?YlRQNXp1WGxOTktVRzJxckpWMFQ1em5wVjFSSUlkaTZpYnZSMUxTUzdGWWtF?=
 =?utf-8?B?ejZaeEtWdXFCSjdLbHBocVN2QXljd2FXeFQ2NGtpV0d6OTVubjAxL0xMQngz?=
 =?utf-8?B?dGdHMkl2S0RUWWZTNnQrSWZjQklSbDRxTkw3Zm5JNTlZQlRpKzJuTk80UWtT?=
 =?utf-8?B?bmQ2cVBqUkM3MXRQUTgxd2k2M1VuMVdEV3dLODl4bk5IQ0Y3amNtNTNFU3dw?=
 =?utf-8?B?RUllVnpmUVBTUit4QVVDOVR2bkw0VlFRaEFwM2l3VTEvcThoaXZWUTNaQ1Bu?=
 =?utf-8?B?TlQvdFdhakg3VzQ1ZFdYckl1STFuNDJ4QkVteE5QUldtTi9TUUVYVVpnWFBn?=
 =?utf-8?B?aVBnaWxYU0FVRmYyblZPbWY1WHNuazA2M3FFZHVSMEYvRlBxQWdQU1Eyb3pP?=
 =?utf-8?B?Y0srRU05WDlveVREcmNQWllKdnRqdHM1b2xiZDhMSlJxeDViSDNyeVptWEt0?=
 =?utf-8?B?dVlqaXBhMlVHTytwTTZTY1pEaTAyQU1OL0hkTTk5cmN4aDdLVEk0b1hmbjg0?=
 =?utf-8?B?dVJGeDRNMnRoYlk5cE8wL05PdU4vNnB5WGZkaU9MQ09FTUlnNUdEbTlWMEY5?=
 =?utf-8?B?aDNrUnJuL253eDM3NldrZExPRFJMVk82VzNhRVllY3NEclpoUmFlUUdybmdB?=
 =?utf-8?B?dWNuU0Vna0F6eGpwZlc3akhORVk0ZzNYTzByanFBek1DVFUzYkxWSWJWdm1D?=
 =?utf-8?B?b01UY0tCdVpCVk9RaksyWXB3bjd3bjN1eUFzUzJUSll0TWR2Z29POGQ4a2Ns?=
 =?utf-8?B?ZDVPN1FzdHpuQTJhS2dualZTNzUzeXA2K1VRUFQ2T2RpVFBYMG5renU1VEp3?=
 =?utf-8?B?clVwc281QVhJSEFjUE0wdzNnUkY4TjFUbFdudjJoNGlLb1MzSHhxOXJTUlZ6?=
 =?utf-8?B?ZDQ1YlBMUlN4VERiTWgyU08zTTJvR2c2TTFIcTY2UU10RHpvUnlUWnJLZ0U0?=
 =?utf-8?B?c2tXa09NUTlkcmFvRHJFb2xYUUltNExjTlJGUHF3TnVGSCtQWWZNVlVETGl4?=
 =?utf-8?Q?0sEn3rfRJczFj7l0=3D?=
X-Exchange-RoutingPolicyChecked: sNISCgQg31UgWn4tSLES18vHQ8PfrwstJe+FwYmkgH8w7tJB+ihW0AvlXMSmqGp/gYiNlueS79lIsPw7g8bxrFpjT1n/CZMF7toNedtTN2vaGpQoAeq4CyDavrkk5HRP4MJdVwpTTjkK+HNaYOxk8gqld7YopWslIsfwXrZSfAkAgmgGWII4gahRORktLe1F5GHQtguxLGFEhQt1zY3skaelXVsRMS07DZefegQzgUUM+U3piTuQxafo+R5eHCoz/42SVH3RLYGOmZIEB8/lVKPPYnFWOvXyeK9kzDPzC8qDePV943EayeSAOiRQUWeADV1ZQ55x10dkzMikrpHSuw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9461ec26-2fd9-4d6e-798a-08de8912360a
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 19:27:24.6108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CFYV7vmIoUOfDaUQpQC75lWlZJ6Ao4ZQ+RBIdn2igTcf5Gnr8IfRcEoNxP25/dU4kCVJtu23WP9+qLgY8yVpGsJEGYUqQ459q2sFoStaZ+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4551
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


On 2/20/2026 1:03 AM, Matthew Brost wrote:
> On Mon, May 12, 2025 at 06:42:03AM +0000, Bhadane, Dnyaneshwar wrote:
>>
>>> -----Original Message-----
>>> From: Vodapalli, Ravi Kumar <ravi.kumar.vodapalli@intel.com>
>>> Sent: Thursday, April 24, 2025 3:00 PM
>>> To: intel-xe@lists.freedesktop.org
>>> Cc: Vivekanandan, Balasubramani <balasubramani.vivekanandan@intel.com>;
>>> Roper, Matthew D <matthew.d.roper@intel.com>; De Marchi, Lucas
>>> <lucas.demarchi@intel.com>; Sousa, Gustavo <gustavo.sousa@intel.com>;
>>> Taylor, Clinton A <clinton.a.taylor@intel.com>; Atwood, Matthew S
>>> <matthew.s.atwood@intel.com>; Bhadane, Dnyaneshwar
>>> <dnyaneshwar.bhadane@intel.com>; Kalvala, Haridhar
>>> <haridhar.kalvala@intel.com>; Chauhan, Shekhar
>>> <shekhar.chauhan@intel.com>
>>> Subject: [PATCH] drm/xe: Add POST_SYNC prefix to post sync instructions
>>>
>>> In existing code for PIPE CONTROL post sync operation instructions
>>> POST_SYNC prefix is not present in the name, add it so that it will represent it
>>> is a post sync operation type.
>> Is there a specific reason for this renaming? Is it truly necessary?
>> Regardless, the terms PIPE_CONTROL_POST_SYNC_TYPE_QW_WRITE and PIPE_CONTROL_POST_SYNC_OP_TYPE_QW_WRITE would be more descriptive.
>> If renaming is indeed required, it should be applied to PIPE_CONTROL_WRITE_TIMESTAMP.
>> This refers to all the post-sync operation types defined and used in the code within the Xe/i915 context.
>>
>> Renaming can clutter the Git history with unnecessary changes, making it harder to track the evolution of the code and understand the reasons behind certain modification.
> I don't think we should consider git history too much in when making
> choices about renaming. If this is a better name, more inline with bspec
> I'd say let's use a better name. If we need to rename more operations
> with post-sync prefixes, let's also do that.
I have checked bspec only these are the changes with POST_SYNC prefix.
> Matt
>
>> Regards,
>> Dnyaneshwar
>>> Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/instructions/xe_gpu_commands.h | 2 +-
>>>   drivers/gpu/drm/xe/xe_ring_ops.c                  | 4 ++--
>>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>>> b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>>> index 8cfcd3360896..75efdacc4979 100644
>>> --- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>>> +++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>>> @@ -54,7 +54,7 @@
>>>   #define   PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET		(1<<19)
>>>   #define	  PIPE_CONTROL_TLB_INVALIDATE
>>> 	BIT(18)
>>>   #define   PIPE_CONTROL_PSD_SYNC				(1<<17)
>>> -#define   PIPE_CONTROL_QW_WRITE				(1<<14)
>>> +#define   PIPE_CONTROL_POST_SYNC_QW_WRITE		(1<<14)
>>>   #define   PIPE_CONTROL_DEPTH_STALL			(1<<13)
>>>   #define   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH	(1<<12)
>>>   #define   PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE	(1<<11)
>>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
>>> b/drivers/gpu/drm/xe/xe_ring_ops.c
>>> index a7582b097ae6..da50213b78c5 100644
>>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>>> @@ -145,7 +145,7 @@ static int emit_pipe_invalidate(u32 mask_flags, bool
>>> invalidate_tlb, u32 *dw,
>>>   		PIPE_CONTROL_VF_CACHE_INVALIDATE |
>>>   		PIPE_CONTROL_CONST_CACHE_INVALIDATE |
>>>   		PIPE_CONTROL_STATE_CACHE_INVALIDATE |
>>> -		PIPE_CONTROL_QW_WRITE |
>>> +		PIPE_CONTROL_POST_SYNC_QW_WRITE |
>>>   		PIPE_CONTROL_STORE_DATA_INDEX;
>>>
>>>   	if (invalidate_tlb)
>>> @@ -216,7 +216,7 @@ static int emit_pipe_imm_ggtt(u32 addr, u32 value,
>>> bool stall_only, u32 *dw,
>>>   			      int i)
>>>   {
>>>   	u32 flags = PIPE_CONTROL_CS_STALL |
>>> PIPE_CONTROL_GLOBAL_GTT_IVB |
>>> -		    PIPE_CONTROL_QW_WRITE;
>>> +		    PIPE_CONTROL_POST_SYNC_QW_WRITE;
>>>
>>>   	if (!stall_only)
>>>   		flags |= PIPE_CONTROL_FLUSH_ENABLE;
>>> --
>>> 2.25.1
