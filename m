Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A62CCA470
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 10:26:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB94A10E2A3;
	Tue, 30 Sep 2025 10:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EfniJ5IV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831A710E2A3
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 10:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759227960; x=1790763960;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=85fT23cozUxu5OTcxEAVjys822FGXad/XdvdEnXEkNU=;
 b=EfniJ5IVyDzOumbwT1J0EHPIU6kDwIZkAvg4QOO9U8D23Xyyq/mM1BJg
 lg+PVws5oW03QN0Lbi+kSEC2Is9unkK9j26vkwCiV1nUHIJUatCq8Id5a
 NLwOsAQVKSszW0PM3C/Dqwws9PvkRCFUTT/MFAMo0omtVaWQFkcRf9Aeu
 XDyPzKhyzPrkBElwZt4QG9m41Mmdk0WjF2ejR5YT5FJ0Jxcpw4Apo7iv6
 gEM7cEmkG9fshEQLhTxVrSfpWUQ982dXoGkh/XJkCyWRAgA61d/6igFjo
 CNsENwWyHOVW1megEIFaDV7BirEDZvQ12uJYYb5u2w0CRwoDPZd1W4mjB w==;
X-CSE-ConnectionGUID: jCB7jyMxRlWWni+MHkez/g==
X-CSE-MsgGUID: XZbJMWPBRX6NAwy4d+GNDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="64100592"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="64100592"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 03:26:00 -0700
X-CSE-ConnectionGUID: EdV/Hh9RR7i89YdQtSnYlA==
X-CSE-MsgGUID: 545SPltpRne1KsiOpSlDFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="177751963"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 03:26:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 03:25:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 03:25:59 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 03:25:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x0nRQwC3t9aDQFfzvjLMIGdBcwPhxjoSwAfze9vNsiQVthFxSS58zQy13tZc4v1HG5JjbHAxckcV1+Dk4vfCT/QcVOIhuWEGiNmrBIc55NfU6j+R/0dwu3TmnzDuqolI1kFRo3+9SEX6jhYjfK++CXr636Rhc0XX+oyqa6B3IghZFcOo3OZvpBYfgaGRHXb70WHGvN3Y5DDxTKIu55TgVDtCFQpiodjNxRWXDJNDZ43M97yyUTFfWSuOPHLBFpusgoIv+qcXFnG6mtObwhXw8YM3vBsmCR+h+r3I29RpQVOmI/kqUxZH1Sj2Q1Hdh9IfsSDbNnhHwrrGieHNimRfig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgmFNca6gb+S6O4agz48IWyE/gn93LS9RRJiKroNlfw=;
 b=H6WvBOR6HV+jeT0W1MSz7EXekZflfAK8DNtV8Kevy8pCOR3rByboYrf2lZMcvwH0KQugI8ijuh9WjoCTHIxlXEGKmwXcYoG2VPp1ruTgo5d3SkD2IfEEWvYa/8kwVcSHJvchBQYGx30LcO9TyO2u+b+0i/o5cGmpogRFDmc824u+RJaXyC4qcdYS89/SzAZ5pDoFCYM7ABry5+57/c67sAEagebcLLzzGn75CRyBp8iip9XQlVh1LwNi0o3alOLXMxFbjtqtcyJ3OitWOvNVQnghVAmVr9Sevbt9dL8hxJoZNJVnFsn2fKOJf9dXI02oaMKKcMF3vXFiTKnePKoVYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB8181.namprd11.prod.outlook.com (2603:10b6:8:159::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 10:25:56 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 10:25:56 +0000
Message-ID: <5960f198-b20a-4d13-ae60-7aea17903755@intel.com>
Date: Tue, 30 Sep 2025 12:25:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/36] drm/xe/vf: Lock querying GGTT config during
 driver init
To: "Lis, Tomasz" <tomasz.lis@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-3-matthew.brost@intel.com>
 <ff5ee0cb-05fe-4e82-9994-589bf279d302@intel.com>
 <aNp4asaemvWydMY8@lstrano-desk.jf.intel.com>
 <2d5aea6a-0d77-4f51-a54c-0be0ccf469e4@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <2d5aea6a-0d77-4f51-a54c-0be0ccf469e4@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::11) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB8181:EE_
X-MS-Office365-Filtering-Correlation-Id: c228b50e-6996-476c-90e5-08de000bbdca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTB6RXZjK1p0WHExS0RBOXUvWVNNQ20rTjJhc051eXJzc3hCK284UnBqMTNG?=
 =?utf-8?B?aWpvZ3FjV3l3aG1Fc0NGeDdaMDE3SWJVb3Jrd2tsZHl6TTJwM1RtVW8xcCs0?=
 =?utf-8?B?ZHgyUDRKaTZXeTVmM042c21ucWF5aXpBUTN6WDg0SHB2Q3NlM2xKOXRPbzZu?=
 =?utf-8?B?QVoxTDBKUUdPUE42SXRTcHRzMnUxZWNrN244RUpJbmUvTEdwUnorN0xGNmZR?=
 =?utf-8?B?UnJHWkh1cnBLSm9meDJ1M2xmKzIwdEFqSWRRdnd1d0h6ME51eEorcVJheSt1?=
 =?utf-8?B?S0RKUCtHUVV0endXbk11WVlJQnJ3a09KTmtwVWZRM0FpSmZDMmQwOEtYUkRx?=
 =?utf-8?B?RmpnTmlXTFpEeE5oSXlIRnVPNHg2Z3I0bUhKU0wyVi92bmIvVGxRWXQ2ajZ2?=
 =?utf-8?B?b0dPNUQ4QjZiOEVTVS9lMFBnNmZ2QzhwT2dDanQyNTM2UkI0cTJqdDF2Wkd5?=
 =?utf-8?B?bEdnUno4Q3RGejJjaGpScW8xaTVZRGNPeEE3OW1YSWZ6cW1sOGRLcWxCVmdR?=
 =?utf-8?B?Tzc4Wm4rQTVxQlNkY25pdjloMEJqRnBIK2RFdTdLaFVuWUl3TXk2Z0FIR1Iw?=
 =?utf-8?B?UGR2eVcvRUtodnBHUDZ6UHdYcGRldCttRktSY0w5ZHNTWklDcW9td2NXMjZi?=
 =?utf-8?B?ZEFSOStWcnoxK2JlajFuQjZxUWdCNlJERi8zUFZQbmErazZWVjRjUk90MzV4?=
 =?utf-8?B?NDQ5TThsN3B0eklCWFVvOUcwK2I4TFU4NVViNlIrTTBFZFVGZ1RqcWdGU0c0?=
 =?utf-8?B?L1NFUkl4c0d4NkJHUXJIQm1FVDM1N0RWaktiNE5hNXo5VVRTWHNRTDNaeFNy?=
 =?utf-8?B?K2t1eXlJdUhGa0UxUXZwRmtGdWE2SWd0SWE1ekdoVWMvbjR1MklCZmp4RmpR?=
 =?utf-8?B?VzNlSmovNGl0YlM1cG9wazIybkYzd2pkV0xxdmFpczhhM2lsMUt2STlmc0lC?=
 =?utf-8?B?TFM4V1JHZG9ReXlOcGlvV2tybm83c2puUDJabEF2aTc5L0tOMXU2bWw3R1Js?=
 =?utf-8?B?QVUxQlFQcTNLeU45c241Z3pOUzhnZmtha2RCcWNMRG8yNE9KVDhFREVtSlo1?=
 =?utf-8?B?amZkQnl3M2piZC9BR1FYRlBNWlNScDhKa0lGbEtFSDNLY0xvUTEzY1dQa05a?=
 =?utf-8?B?dUZTV1dGUWZocU9iaURTaTlWcnJ3Sy9YSVFhY3N0N2pkL2VqMVU2cjRuWlg2?=
 =?utf-8?B?a2FxZlNsSnkzSzBMTXN0TVErMXlPVmdFaXdiZC9ISXZoWkdmMzRzaGVGZ0Vh?=
 =?utf-8?B?K1dYY2VvTkFXNWxCbnlVV2VDeFMrN04zYytOYTI0NzNZN3dZVWkzcGgydnI4?=
 =?utf-8?B?M3FveGR1V0kzUXB2UVVwYmZOVUptY1Z3NFRHMGEzZkVyQ0g3ZVJPR0pDS2Qw?=
 =?utf-8?B?L01SUzUvVlhlRWdXQk5xWnA4TE1ERTFCbkF3ZkVENXdJRFJGekNzWUdJUWs4?=
 =?utf-8?B?bTlvK2ZQckNLWE9wcnlWVmpUMzRZMzJuTFBTZ3JsY0lDcmNqMCs0RCtjQmZY?=
 =?utf-8?B?dTdDOFNYNzdicm9ZZjIrMndqTm9nTng2SEZEZ1dkTTdJR1pwY1VHd2twSWll?=
 =?utf-8?B?ZlQ5UTc2dWYrL0hqbGZMVVlSUzMvWjQ3aTBkbWVSWlBWQi9VVEZjMkV2OFhS?=
 =?utf-8?B?MXFwTGpZSkJMRXY4MFE0b3hmSS9ZNWJxblBmN2QyVmFFOElTK01hV1FHUFFM?=
 =?utf-8?B?UktnYnJqNUw0T2dFdDZVRk8zOHFCTmJwdnNzVlVWczNSVmtyQWNUOGxSWmlj?=
 =?utf-8?B?QmErZ0UvbHRDVVZSbCt4dnVSYXJuOHJMTHhDRnpBM1NZK3NNZDdSejg2QTZN?=
 =?utf-8?B?WU1NNHNjRklQakp1cVEzcG5TSENIUmdraUFtYUxZQTNldisxeG44UlpwUDI5?=
 =?utf-8?B?UVVOV2FwVUpad2xDYktSWldDL0JBWFVqNGU1VGEzZ09tV0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2FIMFUwMmJDMHFaekJNc0xvZml0MjVucWdNNGk5U3gxS2lzNkJKSXBrcis2?=
 =?utf-8?B?eXAvK3o0U3dmdWhzYnRPV0JrNlYyTG5wWkt2WUoxc1FJeXlXT01aQnpoTXRD?=
 =?utf-8?B?SFhkallEZkc2dDBLOUtZeUxOMDlmQThRREtJM1Z0bWc4VEozNVUzN3VFenV2?=
 =?utf-8?B?RSt5V1NhcFNRcW9qNXpTYUlyaGNOekJQcmtKVy95cUZMN2NMSzFUa1NKRi8v?=
 =?utf-8?B?UkhOWk0rZkFTclRRRjhlS0g5Rld3MnBITkRFNnYzcXBhazM0UFpBeVEvN2w4?=
 =?utf-8?B?dEZaZUk1TUNnSi9IU2F5bEJUR2J4TkYwVEd5ZHUwcXJQLzRIcmcrTFU5emlv?=
 =?utf-8?B?OEloL1hKbHNWam90L2trT1B3L2RyREJXVVdBdTR5emw3eWZIZlpVV0x4WkQx?=
 =?utf-8?B?UDBmd3g2Rjk5WVh6aU9lMGM3VjVzZHZEMFA4SFRQdVRJbDdhTjM3c1RnUnBv?=
 =?utf-8?B?U3gyZnVSc2Q4N2swZFRqSGt5c1VNbXBNWE5ocFZBdFJVRzNsZFprOGNldktR?=
 =?utf-8?B?VElnRGU2ZnlDSDJMZmg0YnFHeGUzOUIzcHR0dlN3VjN5aEhHcjVjM00xMVcx?=
 =?utf-8?B?K2dWUEU0Ujdwd0p5NWF0VUFxNWUwRWlSYW1oSHJKNjUwbEJmTXJqUmdEZTg4?=
 =?utf-8?B?WFZFSW5scHh2LzF0ZXBwNXNnK3dEak5iQlBSNkVKZ1k2bWVSRWRwNnVhQ0RQ?=
 =?utf-8?B?blM3NWlnZHIzQ0hxbmd1cThyZlFic2F4YnYrNW5jY2V6S0l4bE5HLzN3ZFpU?=
 =?utf-8?B?NUx0MGM2dXFmZVpOY3ZFVzdEZnhBV0k3Nm9WNXhyS2JJTEJMbnZOeFNxYjBw?=
 =?utf-8?B?SEFlVUV5Q055aWx1Tk9KZVZ5OU9uQUQyaFhwak4xUjViY2FxTTZCaEt3aXNB?=
 =?utf-8?B?TmkzTU5FWmJIWWdXUmZFSExBVGZ4UUQ4QkZyRVNWaUlzMDFCM2FOOU40b01l?=
 =?utf-8?B?WCtPZUZqNzNJQTdSZzJEeWFuM21zNVZ6QS96TDhyR3U4aEF3SXczUWordm5U?=
 =?utf-8?B?TzJTdi92UC9Ubm8vK2wxa0JXRERhSFZOL1ZEcndWZGVGbHFiWWlQMkJ0djU2?=
 =?utf-8?B?QU5SOXVLdVVmZWFNVlJGYmpiT2t2WmhHalB3NFVuaVRXdjZHSGFHYkhrclBC?=
 =?utf-8?B?b29vVCtteFhNQ0FJTFRwVWVYcEhSSDJFOWpLYUtkMVZESld1dWJLSUJmNDRL?=
 =?utf-8?B?cUt2N08vbWpZSHJoc1J4S3BURW4rTVM3UGQ3L1RoUlFnRHQ3RzNXL203d3Bv?=
 =?utf-8?B?enFkcTFEQnNwMWhUREs2RVoxdlFzZmR6dUVmZW5qRUZzQkVVUUY3cVBZSnZI?=
 =?utf-8?B?SUdXRjZybDduZEpkQXJNSUN5TU1RY0k5KzZWWE1jYXRpS3hXMVZVRFhJa1pG?=
 =?utf-8?B?a3pKNFoxeVVrR3Vxa0JzL2Rzc0F6S2pPdzR3cXdJSGdNeUJuWFp4SVZvVWZT?=
 =?utf-8?B?S1NVWnJmQUtkZGMzMnYzYWdXazBrU0Y4eTJCVTFvWkJhY0hNS2U4VDhTTFJv?=
 =?utf-8?B?Y2lycHVkM2V4QjhjWGRwVGZWK2Q1aXVkelQ3eDNhWUw4QkpZWTZ2OWVpNno3?=
 =?utf-8?B?NksvOGtzdTB2aFVWQnV2cFJuSjZvTHltQ3JXNDJNRXdqWjFjWm1McE81SWt0?=
 =?utf-8?B?bUwyR0h1SWw2ZE5LblRqMExjMTJMemNXMUN2YUphMGZyN2xTcjRtNU4yOXdo?=
 =?utf-8?B?RXJiSDRHR3ZYeFduU0hkakxhOGZwa0M5Nlo2KzRpalV0WHZCc2hmVEhmMEFs?=
 =?utf-8?B?d1ZsMmp1RDdXM3NpeWhBZDRubXFHMVlaNlVZQndkRURnSjRVb0FGQTBPSG1K?=
 =?utf-8?B?SDJ2UUxzcVVCRWZQSmhuYUhIbktrelF3TERRS3ZDMkFLVFlJRWxOeUFpRXpF?=
 =?utf-8?B?NXRoa09HZWZVNnFqbEM3eExITndRSGpZeUJOb0NYbmJCN0FrUzN6SjduMVg0?=
 =?utf-8?B?SkIzZGpsWHphN0VKcnhYZ0N4T0NWMzV0bW1qZHNoT09taE5CZmJxRS9Wak04?=
 =?utf-8?B?SExPQ0IrV1hzOUczeHhRUENHZ0wxajVpT0JKTEZLYXEzSU1sbFkva0c5RVRS?=
 =?utf-8?B?QzVERDZ2aC9vKzRUcktVOVFtVTBJazRCdWRHR1JWOWlTYTlIbzZodHZpa0FL?=
 =?utf-8?B?alg0MVNCeDhWRTQxQ3E4T2hXNXA0Y0dJSytnSSsrbSs4S1I3a2YzWENldlkw?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c228b50e-6996-476c-90e5-08de000bbdca
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 10:25:56.3882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TmIpP8/glnG/FsLoiQ3f0pzaBfj/jJHMw+k5Dhkr9RST2+lZTJFzbUzbKonMCThhsRAnf2IHWDMUnxjUPT96Ud3KzGUwfMubgjhNYzanhP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8181
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



On 9/30/2025 2:42 AM, Lis, Tomasz wrote:
> 
> On 9/29/2025 2:15 PM, Matthew Brost wrote:
>> On Mon, Sep 29, 2025 at 09:42:55AM +0200, Michal Wajdeczko wrote:
>>>
>>> On 9/29/2025 4:55 AM, Matthew Brost wrote:
>>>> From: Tomasz Lis <tomasz.lis@intel.com>
>>>>
>>>> Protect access to GGTT config as this is non-static information.
>>>>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 96 ++++++++++++++++++-----
>>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  3 +
>>>>   drivers/gpu/drm/xe/xe_sriov_vf.c          |  6 ++
>>>>   3 files changed, 84 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>> index 0461d5513487..016c867e5e2b 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>> @@ -440,18 +440,21 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>>>>         xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>>   +    down_write(&config->lock);
>>>> +
>>> still didn't get answer to my earlier question [1]
>>>
>>> [1] https://patchwork.freedesktop.org/patch/676375/?series=154627&rev=2#comment_1240924
>>>
>> Again, this isn't a patch, so I believe Tomasz will need to chime in to
>> provide an answer or conclusion here.
> Now answered.
>>
>>>>       err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
>>>>       if (unlikely(err))
>>>> -        return err;
>>>> +        goto out;
>>>>         err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_SIZE_KEY, &size);
>>>>       if (unlikely(err))
>>>> -        return err;
>>>> +        goto out;
>>>>         if (config->ggtt_size && config->ggtt_size != size) {
>>>>           xe_gt_sriov_err(gt, "Unexpected GGTT reassignment: %lluK != %lluK\n",
>>>>                   size / SZ_1K, config->ggtt_size / SZ_1K);
>>>> -        return -EREMCHG;
>>>> +        err = -EREMCHG;
>>>> +        goto out;
>>>>       }
>>>>         xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
>>>> @@ -460,8 +463,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>>>>       config->ggtt_shift = start - (s64)config->ggtt_base;
>>>>       config->ggtt_base = start;
>>>>       config->ggtt_size = size;
>>>> +    err = config->ggtt_size ? 0 : -ENODATA;
>>>>   -    return config->ggtt_size ? 0 : -ENODATA;
>>>> +out:
>>>> +    up_write(&config->lock);
>>>> +    return err;
>>>>   }
>>>>     static int vf_get_lmem_info(struct xe_gt *gt)
>>>> @@ -474,22 +480,28 @@ static int vf_get_lmem_info(struct xe_gt *gt)
>>>>         xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>>   +    down_write(&config->lock);
>>>> +
>>> also, commit message says "Protect access to GGTT config "
>>> while the patch seems to apply locking to the whole config ...
>>>
>>> what's the rationale to extend this protection?
>>> just unification?
> 
> That's true, the title doesn't match.
> 
> During post-migration recovery we call the whole `xe_gt_sriov_vf_query_config()`, which was the main reason I went for protecting the whole provisioning.
> 
> Since we can query GuC multiple times, narrowing the protection would work as well - it would just be a bit unusual to allow two threads a race over writing provisioning info.
> 
> But since these values never change, both would write the same, so no visible problem.
> 
> If you want, I can remove the protection of anything other than GGTT. The solution would be then a little confusing maybe, but would work the same.
> 
> So, which way do we go? Fix patch name+comment, or fix locking range?

if we make the VF GGTT data as tile-level, as suggested in [1], then it
can be protected with it's own tile-level lock

then GT level query can be as-is, just updates to the tile.ggtt will
quarded by the lock

[1] https://patchwork.freedesktop.org/patch/677304/?series=154627&rev=3#comment_1242644

> 
>>>
>>>>       err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_LMEM_SIZE_KEY, &size);
>>>>       if (unlikely(err))
>>>> -        return err;
>>>> +        goto out;
>>>>         if (config->lmem_size && config->lmem_size != size) {
>>>>           xe_gt_sriov_err(gt, "Unexpected LMEM reassignment: %lluM != %lluM\n",
>>>>                   size / SZ_1M, config->lmem_size / SZ_1M);
>>>> -        return -EREMCHG;
>>>> +        err = -EREMCHG;
>>>> +        goto out;
>>>>       }
>>>>         string_get_size(size, 1, STRING_UNITS_2, size_str, sizeof(size_str));
>>>>       xe_gt_sriov_dbg_verbose(gt, "LMEM %lluM %s\n", size / SZ_1M, size_str);
>>>>         config->lmem_size = size;
>>>> +    err = config->lmem_size ? 0 : -ENODATA;
>>>>   -    return config->lmem_size ? 0 : -ENODATA;
>>>> +out:
>>>> +    up_write(&config->lock);
>>>> +    return err;
>>>>   }
>>>>     static int vf_get_submission_cfg(struct xe_gt *gt)
>>>> @@ -501,23 +513,27 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
>>>>         xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>>   +    down_write(&config->lock);
>>>> +
>>>>       err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY, &num_ctxs);
>>>>       if (unlikely(err))
>>>> -        return err;
>>>> +        goto out;
>>>>         err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY, &num_dbs);
>>>>       if (unlikely(err))
>>>> -        return err;
>>>> +        goto out;
>>>>         if (config->num_ctxs && config->num_ctxs != num_ctxs) {
>>>>           xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
>>>>                   num_ctxs, config->num_ctxs);
>>>> -        return -EREMCHG;
>>>> +        err = -EREMCHG;
>>>> +        goto out;
>>>>       }
>>>>       if (config->num_dbs && config->num_dbs != num_dbs) {
>>>>           xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
>>>>                   num_dbs, config->num_dbs);
>>>> -        return -EREMCHG;
>>>> +        err = -EREMCHG;
>>>> +        goto out;
>>>>       }
>>>>         xe_gt_sriov_dbg_verbose(gt, "CTXs %u DBs %u\n", num_ctxs, num_dbs);
>>>> @@ -525,7 +541,11 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
>>>>       config->num_ctxs = num_ctxs;
>>>>       config->num_dbs = num_dbs;
>>>>   -    return config->num_ctxs ? 0 : -ENODATA;
>>>> +    err = config->num_ctxs ? 0 : -ENODATA;
>>>> +
>>>> +out:
>>>> +    up_write(&config->lock);
>>>> +    return err;
>>>>   }
>>>>     static void vf_cache_gmdid(struct xe_gt *gt)
>>>> @@ -579,11 +599,18 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>>>>    */
>>>>   u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>>>>   {
>>>> +    struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>>>> +    u16 val;
>>>> +
>>>>       xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>>       xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>>>> -    xe_gt_assert(gt, gt->sriov.vf.self_config.num_ctxs);
>>>>   -    return gt->sriov.vf.self_config.num_ctxs;
>>>> +    down_read(&config->lock);
>>>> +    xe_gt_assert(gt, config->num_ctxs);
>>>> +    val = config->num_ctxs;
>>>> +    up_read(&config->lock);
>>>> +
>>>> +    return val;
>>>>   }
>>>>     /**
>>>> @@ -596,11 +623,18 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>>>>    */
>>>>   u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>>>>   {
>>>> +    struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>>>> +    u64 val;
>>>> +
>>>>       xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>>       xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>>>> -    xe_gt_assert(gt, gt->sriov.vf.self_config.lmem_size);
>>>>   -    return gt->sriov.vf.self_config.lmem_size;
>>>> +    down_read(&config->lock);
>>>> +    xe_gt_assert(gt, config->lmem_size);
>>>> +    val = config->lmem_size;
>>>> +    up_read(&config->lock);
>>>> +
>>>> +    return val;
>>>>   }
>>>>     /**
>>>> @@ -613,11 +647,17 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>>>>    */
>>>>   u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
>>>>   {
>>>> +    struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>>>> +    u64 val;
>>>> +
>>>>       xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>>       xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>>>> -    xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
>>>>   -    return gt->sriov.vf.self_config.ggtt_size;
>>>> +    down_read(&config->lock);
>>>> +    val = config->ggtt_size;
>>>> +    up_read(&config->lock);
>>>> +
>>>> +    return val;
>>>>   }
>>>>     /**
>>>> @@ -630,11 +670,18 @@ u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
>>>>    */
>>>>   u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
>>>>   {
>>>> +    struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>>>> +    u64 val;
>>>> +
>>>>       xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>>       xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>>>> -    xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
>>>>   -    return gt->sriov.vf.self_config.ggtt_base;
>>>> +    down_read(&config->lock);
>>>> +    xe_gt_assert(gt, config->ggtt_size);
>>>> +    val = config->ggtt_base;
>>>> +    up_read(&config->lock);
>>>> +
>>>> +    return val;
>>>>   }
>>>>     /**
>>>> @@ -648,11 +695,16 @@ u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
>>>>   s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
>>>>   {
>>>>       struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>>>> +    s64 val;
>>>>         xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>>       xe_gt_assert(gt, xe_gt_is_main_type(gt));
>>>>   -    return config->ggtt_shift;
>>>> +    down_read(&config->lock);
>>>> +    val = config->ggtt_shift;
>>>> +    up_read(&config->lock);
>>>> +
>>>> +    return val;
>>>>   }
>>>>     static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
>>>> @@ -1044,6 +1096,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>>>>         xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>>   +    down_read(&config->lock);
>>>>       drm_printf(p, "GGTT range:\t%#llx-%#llx\n",
>>>>              config->ggtt_base,
>>>>              config->ggtt_base + config->ggtt_size - 1);
>>>> @@ -1060,6 +1113,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>>>>         drm_printf(p, "GuC contexts:\t%u\n", config->num_ctxs);
>>>>       drm_printf(p, "GuC doorbells:\t%u\n", config->num_dbs);
>>>> +    up_read(&config->lock);
>>>>   }
>>>>     /**
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>> index 298dedf4b009..d95857bd789b 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>> @@ -6,6 +6,7 @@
>>>>   #ifndef _XE_GT_SRIOV_VF_TYPES_H_
>>>>   #define _XE_GT_SRIOV_VF_TYPES_H_
>>>>   +#include <linux/rwsem.h>
>>>>   #include <linux/types.h>
>>>>   #include "xe_uc_fw_types.h"
>>>>   @@ -25,6 +26,8 @@ struct xe_gt_sriov_vf_selfconfig {
>>>>       u16 num_ctxs;
>>>>       /** @num_dbs: assigned number of GuC doorbells IDs. */
>>>>       u16 num_dbs;
>>>> +    /** @lock: lock for protecting access to all selfconfig fields. */
>>>> +    struct rw_semaphore lock;
>>>>   };
>>>>     /**
>>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>>>> index cdd9f8e78b2a..d6e2ed9b9bbc 100644
>>>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>>>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>>>> @@ -197,6 +197,12 @@ static void vf_migration_init_early(struct xe_device *xe)
>>>>    */
>>>>   void xe_sriov_vf_init_early(struct xe_device *xe)
>>>>   {
>>>> +    struct xe_gt *gt;
>>>> +    unsigned int id;
>>>> +
>>>> +    for_each_gt(gt, xe, id)
>>>> +        init_rwsem(&gt->sriov.vf.self_config.lock);
>>> as before, this should be done in
>>>
>>>     xe_gt_sriov_vf_init_early
>>>
>> I pick up this change but again I think Michal's need some answers to
>> his questions.
>>
>> Matt
> 
> Sure, that is also very early call so we can move it there. (As Matt actually did, just not in this patch.)
> 
> -Tomasz
> 
>>
>>>> +
>>>>       vf_migration_init_early(xe);
>>>>   }
>>>>   

