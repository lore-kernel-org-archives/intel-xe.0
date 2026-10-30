Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9841A606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 07:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QnVpj0Jm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DFA10E224;
	Fri, 30 Oct 2026 07:20:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42BFC10E224
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 07:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793344844; x=1824880844;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n3k1kEPavvhNGsbEFaz4Qb69eU/qlGLFzT6Fx22JBpY=;
 b=QnVpj0JmR3UOasME4qFEY9mhEoKqxpgB891S+Gg5NDh6nVVrAqZwIzcA
 Ips8eRJkw47IWcDI62clKOBQU2PwsTV2HNZFwoaO1kbUzcy5qY2WXReEu
 fKubxaB0aBdDmaPi0/Wih3ebOyFfpgdNrMA/Mi7V+ldJEwzJ4MFTKu1AQ
 Lnkiga8rdvv0HAXwNUwMr+OoYqnBilOr6jZdBn7z6SJ1dQT99NUIeXKiO
 4mct+pgNS8OMjDj5QpYSmvVfcmp2ApMmYUfjebugOhpmzhxW+oqz5+GXr
 LCW/p/9er043mD8ooRB6whXuW9nPJb+Mf6qXDMVXjbuOsXnFKnI5D9bmr g==;
X-CSE-ConnectionGUID: yxcCsE4SRoeYoecCYYCBJA==
X-CSE-MsgGUID: Dptbc0z9STSE5BOB+wHO/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2205824"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="2205824"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 00:20:38 -0700
X-CSE-ConnectionGUID: KbB/pFYlSACu/W2s5bxr8w==
X-CSE-MsgGUID: h7SJoEUTS8WVAipPZCv6VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5728604"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 00:20:37 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 00:20:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 00:20:36 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.53) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 00:20:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VaYLMAMSQjEraBgdyeJX/4vpeJ/lAVJB+rndvmBCZ2MQJ5uiAKPcpthMbhW2dIZRO2bH+UgeJ0wxi65NV8hJyM5mTZDShmYJKVue/LaGuzqW0C/7SrqpbH0KNaavHg+yTu1YEcDSsf0iyCdsPGsWPQ5wcY5VzVgFigVdtqqqIMSopkrqr0Td8GFjEemHtXvHFyUfi6MKaLZDwJJnsB1BMJBhjquxtRRFxLMz1Q/+nI161ij5a1mLlA2B/wsbGJkE8LgE7fCSGGeyJB21EzQSq5GXHdpAc2j/wYXPhu4wxQxIkGYIUh8GOjJvwnaPDYHI+HkqhdClZXleE+j7UDdDDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ak/bjtYf8goIugMpHZA+cuJ1cjzleJr8CClEhXdMrGg=;
 b=RpfpIdxhPwRPk4yuMcUcyy9vCUbz1HtPtdD2imHu6Fj7ijUGN8f6hq0emcWWavM8GVpvVd00f93e1SMX8ABw4w0Yp8wZpy4z+cKVx5lzZ7AcOfwAgPwOzMiuh0pqoZHAnk5TT5b/Kk834cl7R4MpPWrsgZzAzru+j/sRRQm506cMM59PgY0wdcV/h1uFK5l8z3Z9miwgA/sfMYlXky55gFvSJ3IlRVrD4DKUh1s198MGw1hG69H5CJByIRGwRn5qvMl5j5ZNWPpN/KBYDXKwyOhGrX3YguzH17vezcaEj2A9NSJCoikxhJWj/FqXy6NzsjJpwaAIorQZZKrDaYhg2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 07:18:15 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 07:18:15 +0000
Message-ID: <ad7a3f66-7659-445e-ae8f-b1fac5a83cd6@intel.com>
Date: Fri, 30 Oct 2026 12:48:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] drm/xe/xe_late_bind_fw: Add support to load Ocode
 firmware
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <michael.j.ruhl@intel.com>, <alexander.usyskin@intel.com>,
 <anoop.c.vijay@intel.com>, <shamim.begum@intel.com>,
 <kelvin.gardiner@intel.com>
References: <20261028181951.1093283-7-badal.nilawar@intel.com>
 <20261028181951.1093283-10-badal.nilawar@intel.com>
 <da374559-aaab-4d0a-be4d-1e75e42fc8dd@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <da374559-aaab-4d0a-be4d-1e75e42fc8dd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::9) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|LV3PR11MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: 312b9836-51a4-43b2-f534-08df3655f6e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|11063799006|4143699003|261028144727099003|261009223027099003|261009221227099003|261022105027099003|261022113327099003|261022075727099003|261022115727099003|261021121427099003|261021123027099003|261021130227099003|261021133027099003|261021135927099003|56012099006|261026140227099003|261026135527099003|261026121527099003|261026130827099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: XcYDK7ZKA/CEu4h6x9SxFprgi9JXdnZLptQev7zyFaZz834vA1SDBaSzeA5ZVA16BSUaHfT5WHzwXfhHu/HyTbJ/uFGi+9ImpdgcfvaUIzU8KL2Svc9g0kJGvGoeZ3FMxgjRKbTROcbX07HRY79ywt/B5kWxnZdyEvLU0EYmonJs/1QoH4NXSUJuLNCgVAzj5GRCRgL2jcEOVwEho5fikb/bWLHyCtxJnrcQZ71109QFlDc4uXi7rH04re3oERSClZKQHQfGr8U5/hSt3oqnpGus9Gh7qkuD7DhuYsZn9nvVMdg+ysYwP6dUAOKf8mjHiBmk543UBAqs5vGXxPM9/3sR+I8HjBGM9sVqjoiXJOigAaL1x3oOqnjwgq+bZji1n1DCQDNBV3O9rFibCF2Yr4Jxat70Lek0DavnDv0ixLjZc9hRrEqrwuhxm2tFhm7Lm4FClTHDvVVaifDKoo/ROhx3p+8uxjYevhsCEmA4fo4eZIRSn4UISnZJrr5gNyUjiqMAR1w4fmy87Q1qq8eE5oVI6rPHhu642ukriEoM505rjdDjgGm2du8QOKsw2PjZrMrIPok2D4E+wu30WODQm9cQZZ/1vfDtA+JHKxVa1381jWeNLzXLjthJPzifkAElIjbMs1gAZkTHvLOUt2cLwiwGU8HL6bFRSaYiRWryhQE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(11063799006)(4143699003)(261028144727099003)(261009223027099003)(261009221227099003)(261022105027099003)(261022113327099003)(261022075727099003)(261022115727099003)(261021121427099003)(261021123027099003)(261021130227099003)(261021133027099003)(261021135927099003)(56012099006)(261026140227099003)(261026135527099003)(261026121527099003)(261026130827099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1hKWVQwUStzMllyWUsxR1h6M0RGVjFEZVE2SnNqZ28xUWVLUEc5cFFqNTA0?=
 =?utf-8?B?M2FOTmtmMjNBU0lwelJIcEZLUXI5UERlYlh5VVRvV1ZrRGE4ZTFKbjJtS293?=
 =?utf-8?B?VHZuVTFJdWw1a2MyMU94d0sxRUNxUk53VG5SeCsyVVR6ZmdaR00yeXM3YlFT?=
 =?utf-8?B?ckx1SU9ZSy94QW9xenZHVDZVazZhQ0VhdzlLcll2bXZoMDliZlpNQnVxY25L?=
 =?utf-8?B?S1p4YXJNTHRrQ3VlZU92TURhV3RZN3paeFo3RUpjVVVDZ1F1c05Va1hkc29x?=
 =?utf-8?B?WGlTT3JWQzhSVThDZFQ4bTh5cGxHTmJOV01JYklvS3FkZXNMM0p1aHdReWln?=
 =?utf-8?B?MmY4MHJzNnlwSFpCQ0pEdTkrQ0tEbXg4MGRyaVdOSStpSFNhbXlnYjJ4MHIy?=
 =?utf-8?B?UmlKK3plRDAwbHR4YmFsRFBoUUV3Tmd5OEhyS3c1RkdPZWxsaVp6RUNyZHNB?=
 =?utf-8?B?ZjhHUzZlc1liRVpKeFV5MEo5Vi9aQytnV0ZQZmNLWVRBamJZTEgzcWZ3R20r?=
 =?utf-8?B?OEpFTDRHT1J2a3dvbFc3eTRyMU1WTm1BRytwWTdKZ2N1eFQwa0N5aTU5SW54?=
 =?utf-8?B?bksrMXp0RXRUbFNKSW1jNEx6cEREZFJJVkd4bGNVWGUwWUphclBQanJyUkNo?=
 =?utf-8?B?TFk5UVBNM3ZwUE1kSjRQYXFkUzRDOGo3a0ZkWXd6VXduZXUxZng1ODhJL3Ja?=
 =?utf-8?B?cUsvUXk5UzFMVzBDUWhJMnRkNFZiOUdYdm5vYkdGSU5GUjBOKzFoSDF1bmhm?=
 =?utf-8?B?Z2ZuRjJYVE5zckVRQm84TTVqMUZON2hqTFFWNEtSbGdRL1dQRm1kOEFRek4y?=
 =?utf-8?B?dzE3bkJYNy9SeTU5bVB1UmlBRi9YT0M0T0p2MzZ4cGRSK0h0K0JkUUZWVUZw?=
 =?utf-8?B?KzBST0lNbzBaUmVkZ050a1NyVnVYbGxKc3NuTGJwK3BWUzJYNUhMWVp5QzhY?=
 =?utf-8?B?NERyR2d6SXFWYjZiN2VubDhGdkxtKzRDTzdTbDUzRDQyVzlITDJvaVd2MDFV?=
 =?utf-8?B?L1RpMW1HSXMwQm5OUG5IR1djS1NBOUtYOFp4Y1o3aWJlV0FqbGZBQ2d3eHhM?=
 =?utf-8?B?b3lHeWtwaXk3ZC9QZFVrREptMHBzRC9ES25ldlc5SWhiTkFlNUltdVB4a1BH?=
 =?utf-8?B?c2NXbGZ4VjczS1Z2SEVnaVYrVDhsbVVuc0o4UWNVRXllMnFKNEFNMDZHdjRV?=
 =?utf-8?B?SUUzellNZFh0WGtYY3l3dFViQnpXK2lBcElmR2ZUZUUxbWhRTGs2VVZxMTdZ?=
 =?utf-8?B?bktwTE0rcWQ1TE9lOHZGTEd0UURsd1B2bWV6M29ibVZsVmFmdDRDVEJ6cWoy?=
 =?utf-8?B?RUtRbmZTM2RQZ1AxNTNpRGlNNDg5bGhyV085VmhYTjVuMjFvQkhlWFQ5d09n?=
 =?utf-8?B?bVpoUFdjN0tTMUZDeFdWc1pwdjQyaDI2MjhDUDRMVFNaSVhUbkZuMEdkay9a?=
 =?utf-8?B?eFBiRlF1MTluV3dBMlpSOGlDY2t4bXVXS0FqWjdhT0dDKzNDLy92TkFlR1lh?=
 =?utf-8?B?QTBqK2VYWFBLNXZzcHJVL25RRzA5YmtHa1ZhQzl3Q0s2d0lNN0dXMnl2NHNu?=
 =?utf-8?B?dlZXeitvamZGM0RZU0QveWo1NVVlY0V2WW1ocGc3NVZGSGs2WDRCRCt1SWxn?=
 =?utf-8?B?RitzR1pFRTY5TU9hQUJZbWFrSTU0amxQQ1dJVnpoRStzQlhlQVhMYko4R3Fh?=
 =?utf-8?B?WlNDcUZRNUtjbkZBL3JsR1NEa2JiUG01b2RsOThWR2dnNE05cW50cmxCMDU5?=
 =?utf-8?B?OFAxelpQaStnc1ZmQjNBU3JSQUJSd3locmpDY25aYWZmVWpFZFFsMENITVdm?=
 =?utf-8?B?N1I5ZEE3Sm1sajFYOWFOeHB6dlJqcnRkeldzUXdKTXNMclVHRmJpdTdYY2NF?=
 =?utf-8?B?SGNqdUlab0xZMVZqQ3hPcXQ4bE9lRU11TTNsRnZMTnpvK0k1N1prejFmdHk2?=
 =?utf-8?B?S0VRa2NiRDE0Z1lPdXc5aytRNWJOd2VGOVlZQjVJdHBma3dHbmVwSkc4a2pu?=
 =?utf-8?B?aGNCbFpJSnFCOW4yYms1amh6Y2VnQU82T1VzTGtKTVNPQUEwbDcxdnNPRjZj?=
 =?utf-8?B?ckZuak1RSHMzZE5xVUIzbC9pTk9saStvRm9NSm5PNWRNNGxWRjlaak5VRFI2?=
 =?utf-8?B?NFY4cFVUMnhWbjdLOHNNR0VSNjFlV2phSGpnN1pyRUxwcXpUTGFRUmw0TURO?=
 =?utf-8?B?Y1EwTEVDajY3UjJ3dXpGcHg2TDFaN2Y0MmZlZGRFb0x4NW5ONDA1Sjh6dCtP?=
 =?utf-8?B?WlcvNkdoMmNsdzVnWDQ1cmxEZ29uci9peUtaclJnbmNlNmJOeVN4MFFySTFK?=
 =?utf-8?B?VFdPU1BuZzV1M2tzTm1FVXdBV24wNktxc291SWE5dWV2bUlKdjJKQT09?=
X-Exchange-RoutingPolicyChecked: 1XKQthXD3q7NFZFtbpJVVOG1heYD7+JqBv5+JpPWp//9tpQM35BDNz2uJefUMVoL4q8ZmYzj3p/BRSXqV8rV83pZGUyh6hMlQLwrLEEz48/itL26a5nnQRoggJAlJGnxD58cixoFZisTqQx6hgCJpjXYibvbZOJ+j2M5t2uvMMvXZWbKDrahfzpiletZGElh6y9oC6mnqgwQ5vFTSxiPWzsEfvb5/Ucrbamw4ty44E4LPK79WCa/N7vhHKjyFBdvepi2KaH+9cIVS8cS1sw3hXMsC6r60DTaNTogI9lqvxLVsZx6FnmZP1fYAq50tNbTYTrTtHL5vZtUelMBOkVScQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 312b9836-51a4-43b2-f534-08df3655f6e0
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 07:18:15.3092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ZIqv1JQ4Y6iCoVQyZRxwTushJ+/5gp/1Adf8UO6P5ywwTqJloLy6ApSssQcZ8KlLvONTtbGxno5EN5pexEARA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8508
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 29-10-2026 22:13, Ceraolo Spurio, Daniele wrote:
>
>
> On 10/28/2026 11:19 AM, Badal Nilawar wrote:
>> Enable loading of Ocode, the legacy OOBMSM firmware, through the
>> late binding flow. The payload size check is no longer needed as
>> late binding supports larger payloads.
>>
>> Ocode may not remain backward compatible across IFWI updates. Query
>> the SDK API version from the System Controller mailbox and load the
>> corresponding xe/cri_ocode_<ver>.bin. Skip loading the firmware if
>> the SDK API version in its manifest does not match.
>>
>> Assisted-by: LLM
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/uc_fw_abi.h            |  3 +-
>>   drivers/gpu/drm/xe/xe_late_bind_fw.c          | 76 ++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h    |  6 +-
>>   drivers/gpu/drm/xe/xe_sysctrl.c               | 32 ++++++++
>>   drivers/gpu/drm/xe/xe_sysctrl.h               |  1 +
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 12 +++
>>   6 files changed, 117 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/uc_fw_abi.h 
>> b/drivers/gpu/drm/xe/abi/uc_fw_abi.h
>> index 198e949660e0..ef734825d949 100644
>> --- a/drivers/gpu/drm/xe/abi/uc_fw_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/uc_fw_abi.h
>> @@ -331,7 +331,8 @@ struct gsc_manifest_header {
>>       struct gsc_version meu_kit_version;
>>       u32 meu_manifest_version;
>>       u8 general_data[4];
>> -    u8 reserved3[56];
>> +    u16 sdk_api_version;
>
> As far as I can see from the specs, what we actually have here is a 
> u8[24] field which is reserved for data that is specific to the type 
> of FW the header belongs to. Since this is the generic header 
> definition, it needs to reflect that and not the ocode-specific usage 
> of that field.
> We have something similar in the css header, where one chunk of it is 
> different between GuC and HuC (see uc_css_guc_info). Following the 
> same approach we used there, we could do something like:
>
> struct ocode_manifest_data {
>         u16 sdk_api_version;
>         u8 reserved [22];
> }
>
> and then in gsc_manifest_header you can have:
>
> struct gsc_manifest_header {
>         [...]
>         union {
>                 ip_specific_data[24];
>                 struct ocode_manifest_data ocode_data;
>         }
>         [...]
> }

Yes, this make sense, I will follow this approach.


>
>> +    u8 reserved3[54];
>>       u32 modulus_size; /* in dwords */
>>       u32 exponent_size; /* in dwords */
>>   } __packed;
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> index 881a46abc4f5..39c47b743edc 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> @@ -17,6 +17,12 @@
>>   #include "xe_pcode.h"
>>   #include "xe_pcode_api.h"
>>   #include "xe_pm.h"
>> +#include "xe_sysctrl.h"
>> +
>> +/*
>> + * TODO: Add MODULE_FIRMWARE() for xe/cri_ocode_<ver>.bin once the
>> + *       Ocode firmware binary is available upstream.
>> + */
>>     /*
>>    * The component should load quite quickly in most cases, but it 
>> could take
>> @@ -33,10 +39,12 @@
>>     static const u32 fw_id_to_type[] = {
>>           [XE_LB_FW_FAN_CONTROL] = INTEL_LB_TYPE_FAN_CONTROL,
>> +        [XE_LB_FW_OCODE] = INTEL_LB_TYPE_OCODE,
>>       };
>>     static const char * const fw_id_to_name[] = {
>>           [XE_LB_FW_FAN_CONTROL] = "fan_control",
>> +        [XE_LB_FW_OCODE] = "ocode",
>>       };
>>     static struct xe_device *
>> @@ -104,6 +112,7 @@ static int parse_cpd_header(struct 
>> xe_late_bind_fw *lb_fw,
>>       manifest = data + offset;
>>         lb_fw->version = manifest->fw_version;
>> +    lb_fw->sdk_api_version = manifest->sdk_api_version;
>>         return 0;
>>   }
>> @@ -179,6 +188,34 @@ static const char 
>> *xe_late_bind_parse_status(uint32_t status)
>>           return "Invalid Payload";
>>       case INTEL_LB_STATUS_TIMEOUT:
>>           return "Timeout";
>> +    case INTEL_LB_STATUS_INTERNAL_ERROR:
>> +        return "Internal Error";
>> +    case INTEL_LB_STATUS_INVALID_FPT_TABLE:
>> +        return "Invalid FPT Table";
>> +    case INTEL_LB_STATUS_SIGNED_PAYLOAD_VERIFICATION_ERROR:
>> +        return "Signed Payload Verification Error";
>> +    case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_CPD:
>> +        return "Signed Payload Invalid CPD";
>> +    case INTEL_LB_STATUS_SIGNED_PAYLOAD_FW_VERSION_MISMATCH:
>> +        return "Signed Payload FW Version Mismatch";
>> +    case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_MANIFEST:
>> +        return "Signed Payload Invalid Manifest";
>> +    case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_HASH:
>> +        return "Signed Payload Invalid Hash";
>> +    case INTEL_LB_STATUS_SIGNED_PAYLOAD_BINDING_TYPE_MISMATCH:
>> +        return "Signed Payload Binding type Mismatch";
>> +    case INTEL_LB_STATUS_SIGNED_PAYLOAD_HANDLE_SVN_FAILED:
>> +        return "Signed Payload Handle SVN Failed";
>> +    case INTEL_LB_STATUS_DESTINATION_MBOX_FAILURE:
>> +        return "Destination MBOX Failure";
>> +    case INTEL_LB_STATUS_MISSING_LOADING_PATCH:
>> +        return "Missing Loading Patch";
>> +    case INTEL_LB_STATUS_INVALID_COMMAND:
>> +        return "Invalid Command";
>> +    case INTEL_LB_STATUS_INVALID_HECI_HEADER:
>> +        return "Invalid HECI Header";
>> +    case INTEL_LB_STATUS_IP_ERROR_START:
>> +        return "IP Error Start";
>
> As far as I can see the defines for those status code are already 
> merged to the mei header, so adding the extra logs for them could be 
> split to their own patch to keep this one focused on the ocode fetch 
> and sdk comparison.

Sure I will split this in separate patch.

Thanks,

Badal

>
> Daniele
>
>>       default:
>>           return "Unknown error";
>>       }
>> @@ -298,6 +335,7 @@ static int __xe_late_bind_fw_init(struct 
>> xe_late_bind *late_bind, u32 fw_id)
>>       struct xe_late_bind_fw *lb_fw;
>>       const struct firmware *fw;
>>       u32 num_fans;
>> +    u16 sdk_ver = 0;
>>       int ret;
>>         if (fw_id >= XE_LB_FW_MAX_ID)
>> @@ -320,9 +358,23 @@ static int (struct xe_late_bind *late_bind, u32 
>> fw_id)
>>               return 0;
>>       }
>>   -    snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), 
>> "xe/%s_8086_%04x_%04x_%04x.bin",
>> -         fw_id_to_name[lb_fw->id], pdev->device,
>> -         pdev->subsystem_vendor, pdev->subsystem_device);
>> +    if (lb_fw->type == INTEL_LB_TYPE_OCODE) {
>> +        /* Get SDK API version */
>> +        ret = xe_sysctrl_sdk_api_version(xe, &sdk_ver);
>> +        if (ret) {
>> +            drm_warn(&xe->drm, "Failed to get OCODE SDK API version: 
>> %pe\n",
>> +                 ERR_PTR(ret));
>> +            return 0;
>> +        }
>> +
>> +        snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path),
>> +             "xe/cri_ocode_%u.bin", sdk_ver);
>> +    } else {
>> +        snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path),
>> +             "xe/%s_8086_%04x_%04x_%04x.bin",
>> +             fw_id_to_name[lb_fw->id], pdev->device,
>> +             pdev->subsystem_vendor, pdev->subsystem_device);
>> +    }
>>         drm_dbg(&xe->drm, "Request late binding firmware %s\n", 
>> lb_fw->blob_path);
>>       ret = firmware_request_nowarn(&fw, lb_fw->blob_path, xe->drm.dev);
>> @@ -332,17 +384,17 @@ static int __xe_late_bind_fw_init(struct 
>> xe_late_bind *late_bind, u32 fw_id)
>>           return 0;
>>       }
>>   -    if (fw->size > XE_LB_MAX_PAYLOAD_SIZE) {
>> -        drm_err(&xe->drm, "Firmware %s size %zu is larger than max 
>> pay load size %u\n",
>> -            lb_fw->blob_path, fw->size, XE_LB_MAX_PAYLOAD_SIZE);
>> -        ret = -ENODATA;
>> -        goto release_fw;
>> -    }
>> -
>>       ret = parse_lb_layout(lb_fw, fw->data, fw->size, "LTES");
>>       if (ret)
>>           goto release_fw;
>>   +    if (lb_fw->type == INTEL_LB_TYPE_OCODE && 
>> lb_fw->sdk_api_version != sdk_ver) {
>> +        drm_warn(&xe->drm, "%s late binding fw: SDK API version 
>> mismatch %u != %u\n",
>> +             fw_id_to_name[lb_fw->id], lb_fw->sdk_api_version, 
>> sdk_ver);
>> +        ret = 0;
>> +        goto release_fw;
>> +    }
>> +
>>       lb_fw->payload_size = fw->size;
>>       lb_fw->payload = drmm_kzalloc(&xe->drm, lb_fw->payload_size, 
>> GFP_KERNEL);
>>       if (!lb_fw->payload) {
>> @@ -355,6 +407,10 @@ static int __xe_late_bind_fw_init(struct 
>> xe_late_bind *late_bind, u32 fw_id)
>>            lb_fw->version.major, lb_fw->version.minor,
>>            lb_fw->version.hotfix, lb_fw->version.build);
>>   +    if (lb_fw->type == INTEL_LB_TYPE_OCODE)
>> +        drm_info(&xe->drm, "%s firmware SDK API version %u\n",
>> +             fw_id_to_name[lb_fw->id], lb_fw->sdk_api_version);
>> +
>>       memcpy((void *)lb_fw->payload, fw->data, lb_fw->payload_size);
>>       INIT_WORK(&lb_fw->work, xe_late_bind_work);
>>   diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> index ee5efe60774e..c7b3ffc743cf 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> @@ -13,14 +13,14 @@
>>     #include "abi/uc_fw_abi.h"
>>   -#define XE_LB_MAX_PAYLOAD_SIZE SZ_4K
>> -
>>   /**
>>    * enum xe_late_bind_fw_id - enum to determine late binding fw index
>>    */
>>   enum xe_late_bind_fw_id {
>>       /** @XE_LB_FW_FAN_CONTROL: Fan control */
>>       XE_LB_FW_FAN_CONTROL = 0,
>> +    /** @XE_LB_FW_OCODE: Ocode firmware */
>> +    XE_LB_FW_OCODE,
>>       /** @XE_LB_FW_MAX_ID: Number of IDs */
>>       XE_LB_FW_MAX_ID
>>   };
>> @@ -45,6 +45,8 @@ struct xe_late_bind_fw {
>>       struct work_struct work;
>>       /** @version: late binding blob manifest version */
>>       struct gsc_version version;
>> +    /** @sdk_api_version: late binding blob manifest SDK API version */
>> +    u16 sdk_api_version;
>>   };
>>     /**
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c 
>> b/drivers/gpu/drm/xe/xe_sysctrl.c
>> index 4067e1dfdcd5..27a59e8e4487 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>> @@ -217,3 +217,35 @@ bool xe_sysctrl_is_diag_fw_ready(struct 
>> xe_device *xe)
>>       return xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_DIAG) ==
>>              XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
>>   }
>> +
>> +/**
>> + * xe_sysctrl_sdk_api_version - Get SDK API version
>> + * @xe: Xe device
>> + * @version: SDK API version
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int xe_sysctrl_sdk_api_version(struct xe_device *xe, u16 *version)
>> +{
>> +    struct xe_sysctrl_sdk_api_resp resp = {};
>> +    struct xe_sysctrl_mailbox_command cmd = {};
>> +    size_t out_len = 0;
>> +    int ret;
>> +
>> +    xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_CORE, 
>> XE_SYSCTRL_CMD_SDK_API_VERSION,
>> +                  0, 0, &resp, sizeof(resp));
>> +
>> +    ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (out_len != sizeof(resp)) {
>> +        xe_err(xe, "sysctrl: unexpected SDK API version length %zu 
>> (expected %zu)\n",
>> +               out_len, sizeof(resp));
>> +        return -EPROTO;
>> +    }
>> +
>> +    *version = resp.sdk_api_version;
>> +
>> +    return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h 
>> b/drivers/gpu/drm/xe/xe_sysctrl.h
>> index b69a3f474236..c0b6d4330c88 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>> @@ -22,5 +22,6 @@ void xe_sysctrl_irq_handler(struct xe_device *xe, 
>> u32 master_ctl);
>>   void xe_sysctrl_pm_resume(struct xe_device *xe);
>>   bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe);
>>   bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
>> +int xe_sysctrl_sdk_api_version(struct xe_device *xe, u16 *version);
>>     #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h 
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index 1f3f782d770e..cdacceebca06 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -57,10 +57,12 @@ enum xe_sysctrl_gfsp_cmd {
>>    *
>>    * @XE_SYSCTRL_CMD_LOOPBACK: Loopback test command
>>    * @XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID: Retrieve application 
>> status by ID
>> + * @XE_SYSCTRL_CMD_SDK_API_VERSION: Get SDK API version
>>    */
>>   enum xe_sysctrl_core_cmd {
>>       XE_SYSCTRL_CMD_LOOPBACK                = 0x03,
>>       XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID        = 0x05,
>> +    XE_SYSCTRL_CMD_SDK_API_VERSION            = 0x06,
>>   };
>>     /**
>> @@ -126,6 +128,16 @@ enum xe_sysctrl_fw_status {
>>       XE_SYSCTRL_FIRMWARE_COMM_FAILURE,
>>   };
>>   +/**
>> + * struct xe_sysctrl_sdk_api_resp - Get sdk api version response
>> + */
>> +struct xe_sysctrl_sdk_api_resp {
>> +    /** @sdk_api_version: SDK API version */
>> +    u16 sdk_api_version;
>> +    /** @reserved: Reserved for future use */
>> +    u16 reserved;
>> +} __packed;
>> +
>>   /**
>>    * struct xe_sysctrl_mailbox_command - System Controller mailbox 
>> command
>>    */
>
