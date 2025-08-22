Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B803CA0EED
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 14:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2FF10EB3E;
	Fri, 22 Aug 2025 14:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YLABmlv+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E8C10EB3E
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 14:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755874660; x=1787410660;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Ze6OtXuJgiPs+Z1jVuFI1G0xgN8CCCa1+x7WYmC/v2E=;
 b=YLABmlv+HDtxHudetteZ8fnmsONNpgyoASIkaQQ3S9iCgQNu8ootzBsA
 97N+rBkosb4r9wdpmsZnhwFjoIbVfNm9ER0lVzJo9HLs7T6mIZPK8kXGh
 kqTRAo1VfALbpbGq5PGlPnTtZycVJZY8I56HQkUY4d71r7nV+lxyVFB9h
 YvzihAtmqJJ4C5/YBb2504zRiN4hJ0C1Aounod3QTfw61sIDVR93DBIre
 Uj8ZbGIjnEtJl7ee5JuGSpezsPk+z0MtmXEekykB0XjXdyNrR581g90YC
 BzHclKFkTus33VqevpkqVR7jmS0tZptB3yIemGBvwV6OA4XvZ7l+2/TcS g==;
X-CSE-ConnectionGUID: rpZoyffgTuCga0GmWmpCnA==
X-CSE-MsgGUID: kczjNTZ/T6KFPljTXvNzuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="61827287"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="61827287"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 07:57:39 -0700
X-CSE-ConnectionGUID: wSBWnCzYRRq8NOqHaMkXJw==
X-CSE-MsgGUID: cxNcxYMsTG6QpidVCZT+yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="168326945"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 07:57:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 07:57:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 07:57:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.76)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 07:57:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjEgJ1+lkE9hsIw1tID2TsZKREL41KpKIvIgziU9vpkCH2mFFm4FqTptA+BfUSAw/YAnYLLikMKxrY7XDeb/NtKNoFYnob+iigW7OVFWJktlq0vO+OWr5fdSAXwGP3K9pp2UiXh5j4KPLU2jyrLP/cy001rc7HD3uQizkLMcW+6XCMbAzXRAdxlvTIcxeEOWLygaVOeNS/2RYt506uGRYcLUI4eqWbsliU5vR6yRYlKaaUni96qE5qdLBvvfr18M3SBwk7tAbRx2bHdChHWbXz6S93jDHC4mP2paoUOeJyMVmszS3zQ+iNUjGlGqd49y3scR3J97JPYMpeCpx3CeKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ze6OtXuJgiPs+Z1jVuFI1G0xgN8CCCa1+x7WYmC/v2E=;
 b=g4z20sG1/Q3/LsGAKyx49sWaarBAuWftqCDMHW+jS0aW+dxAOl91rAakVnbzRQTVfuEVMWoldlrbpOyQ7RTVhtdX9iLSARs8pjnpDPTgSyMohYF14hS0sh7LjVmTQy52sIx+isyhLt6NWCQ4Bx1S6H861m6W7k40Cpib/bEV+KRQRUes1kMUyIcJsGO726VnvAOkVfctyGNTromopJSq3BPdDWSe0Jpplf2aqpQjecD6UQe1xkqTX0WTEjN9vV5GjiyyukfDUS106susTvlcHVkIjFt8KCBlsnHKXq6ylmegMyqcMJKf9RkyMHWFaf4TwLNvMqLg95mCCHBhfOXyEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA2PR11MB5081.namprd11.prod.outlook.com (2603:10b6:806:118::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Fri, 22 Aug
 2025 14:57:37 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9052.017; Fri, 22 Aug 2025
 14:57:37 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kassabri, Farah" <farah.kassabri@intel.com>
Subject: Re: [PATCH 2/9] drm/xe: Cancel pending TLB inval workers on teardown
Thread-Topic: [PATCH 2/9] drm/xe: Cancel pending TLB inval workers on teardown
Thread-Index: AQHcEiqCOSd3Xnn8PU2dwjpLxyYn0bRtrTwAgAAWzgCAAC6uAIAA0yQA
Date: Fri, 22 Aug 2025 14:57:37 +0000
Message-ID: <0f42810fe3eebf4044c6730bfdc90a32db9904b8.camel@intel.com>
References: <20250820233057.83894-1-stuart.summers@intel.com>
 <20250820233057.83894-3-stuart.summers@intel.com>
 <aKeZ+JZ3j6hm1vR1@lstrano-desk.jf.intel.com>
 <ea0fcf8ee5cc8eb3f78836538e5fa9517a580077.camel@intel.com>
 <aKfUQvfrpv8kFAWz@lstrano-desk.jf.intel.com>
In-Reply-To: <aKfUQvfrpv8kFAWz@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA2PR11MB5081:EE_
x-ms-office365-filtering-correlation-id: a12b198a-0de0-425f-5223-08dde18c3be7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Z1h3R01vdW53UVh2NWVZOW94dm1yOU5PSXo0dWxpSXZXblliQk9sVUdraGpO?=
 =?utf-8?B?SGRFTTcyMkJ6c3g5ZncrUExESitwTTcwSXlmY2h0eEZWMVpoOHBrb2dBNXRE?=
 =?utf-8?B?MkVjZnhLN2tZN2V1QUJmNmhmdEN3SEwxMEk2RkpvcE53Y1ZJMVl6ZkxVUWFw?=
 =?utf-8?B?WUtHQitUM0NIY2VxaEMwOVRXVGZMdUg2WkxNa2dlSU1VbDdLbWtPek5QY0JN?=
 =?utf-8?B?SU9tNzFLUmc5UGNxTUJvMjhuVkx4cGJNY1cwSmZZUEVVc2JjeUo4c1JETkpw?=
 =?utf-8?B?WnJ6R2RDWVBqWnNhNzB4dTZlVUQ5SkZZenZrbGJDRXc4ZFRyWC8yMGM3Nitp?=
 =?utf-8?B?cXRSaENlUzVFYWNEOVJudWRTaHJIVHBBeWZoTTIxYzhnQmVVS1VmbHR1cTc3?=
 =?utf-8?B?bkMwc3hzVEdTSFlGaFhIczdTT25kWTFaQzhtNDhtNitESGxxSmRIZUxNL3BT?=
 =?utf-8?B?MWE2VVZyQURtVjNicXJRL2lrUGttU0ZiTzZVcTRzV2U0MkZ6Um5uaFhid3dt?=
 =?utf-8?B?RkJCT1IyZ2EvQnMxeDdHemxrZHl6ajVwc2M1NExPSDBYaDdHYWpKWWNXM1ZI?=
 =?utf-8?B?THdSUTJTazAydHVrWkI4QldPYW10VFZ2MGtjdHk5ZjJxTEszaHppQi9xVGRw?=
 =?utf-8?B?SU5ZWkVsSXVtRTU3Q2JiQ0wxQXlMbW5YNFlWS2RDdnd5emJDcE9YYXN3NkNO?=
 =?utf-8?B?ZytTeEhvSzg0TjIyUEN6TGVnWXpYdENPOTNTZ2k2WFNvUTl0ejRMSzQvR0Nl?=
 =?utf-8?B?ckdUd0ZLV0FQRHg4NVJLcFVHcE9aTGIzeVRId2tlUnNERHNkQ2ZCc2dYN0Zh?=
 =?utf-8?B?bGtYSzRKNGlKc1dTYUw4R1dHQkI5czJ4ME94ZldpblViTDJmWlhkSDJNQVQ5?=
 =?utf-8?B?ZlIzaGZma2Z1NWc2WWZQK2I5a0JJczB3YXRlWHZ6N2ZscWRRTUdocllQVGg2?=
 =?utf-8?B?V0RlM05LOEZhbFhqc0tybUtkYU5VVWRmOFFXTnkzOEJSaEY3MUxiYkJxTVlO?=
 =?utf-8?B?aUh5TzBWd1VDN2RnR3VnSjlDelNBSGJtNVJQY2VkQ3RTeWlGRGJ3b2Q5ZFFX?=
 =?utf-8?B?LytTaW5idHZnQ3R0MElZYjFLV2JVY05TTXFmSGZ4V0g4ckwrTUlYdE9xZ2Na?=
 =?utf-8?B?bDZKcGtaU2JMNE81QUhtVkorYytkaFNTNU5ub1lsOUE5ZFJQSWV3T294RWl5?=
 =?utf-8?B?TG1CWHdOZjQwbkRuSDUvMktMdXJqQllseGorZDV5TzZpUzIzY1NmZDZ3ZUxk?=
 =?utf-8?B?NHVjK0tVL0hZMHFhbnBteTZaYWlFUFNkc2p2K2ZYMkNWZmRmU2t5MjJKMmJ1?=
 =?utf-8?B?VTNuOTVhZ3NHVGRkRkhURDIvN1JiN1dSZlBHY2hwOW9UWkZQdEpwRHRNOGNh?=
 =?utf-8?B?a2xMd3VsNlUwWFhyeUFNdkJpeWh1S21sSUtDOXhITmRaL0RkYXlKMGwzUUNS?=
 =?utf-8?B?c2R2Q0hkbk9hUUkxK2U2QmRUWlF4eVZIQXZvc3orRTRGYzY4ZFMzc2h3Z2Rw?=
 =?utf-8?B?SHZVVnJTL3BjVEwrVEMvN1hVT1VYWDBqWWVmaFdpYjY3VHZFTkF3ZzFwbTBs?=
 =?utf-8?B?UTZCVUZBV0lFVUJrUmg1aVZsZkpSOEdDbE5mVUgrSEI4Q1p1bEN5Q1RENi9w?=
 =?utf-8?B?NzAxZU5NWW9INlJvd3ZzcU9Fd0psVDdiNFM2cllucFFJVitTUitWTks4YmZy?=
 =?utf-8?B?MmdmaGFoc1VWZzB6UVZ2SFRqN3RQc3I5TGttSHB3Z3UyU1BjaTNnT3RVNFNE?=
 =?utf-8?B?OWRrVklYUStjdFpJZzRUZFlXMzVjN3JvZm8wcEM3ZjZYTGM3enFCUjAveFNn?=
 =?utf-8?B?VzEvRmgwVWlIV25XUEU3YkdzcytnR21KSHVpelphaHAxNlgrZlFhNlU5YjZr?=
 =?utf-8?B?MkdXcGU2RXhaVGtIYUYyL3ZGcXBsZ1N4ZWVJZHc3RXp3NkRNQklqME9WT25D?=
 =?utf-8?B?ckNZZzRZY3RiYnJnZ3RiL3htMG9hSmJ6QUhtczFrLyt6WkV6dzh3NzF6N2VZ?=
 =?utf-8?Q?wSoQhvkcV1S9WIU/iy9xCq7sBJzPfQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEZBVGNwcXhaVTlDUVo2MTV5OC9DZ2R1Mk9sNEZrekc3MWh4WEQxMmhpMkQ5?=
 =?utf-8?B?Ynd6UnRUUGxWY0dieVZVY3UwekpEa3JFVng4eFExcGpaYmU1RTRFb2Q4d2ha?=
 =?utf-8?B?dlYzSXFGNGQybmlOS2RHV3RVenJseUg2TTdxRlU5MXZBcThZN3ZEaVBxUjN1?=
 =?utf-8?B?YXNYNmtqM0FteXNWUTBUTytnTEdOdktIdndmVTYrbVA0VmFYOG5VNDRQdjV4?=
 =?utf-8?B?V2pDWFAzL1RzN0QycTJ4SkxtQWRxYUg0TUw4UnRmazFTVzVtam5ST1RuNGJQ?=
 =?utf-8?B?UkxvamFiNGc5a0J3SEhQU2FYMXFZRUdHbVNUSzE3Si9wQndqSWRqUXpXSmNs?=
 =?utf-8?B?aHZxd1Z4U21ZbzFvb0JLcEMxdWNCUWlkdVdJZUdPb3VJMjkzU2hkWFEvSG80?=
 =?utf-8?B?NnN3VHVRcFAyWHUzTWV1alhlN3M4TTZSb3FpOE9wYm4zdkxON2tJM2RBdG92?=
 =?utf-8?B?RHFhRlU3QVFGb3Z1d0YvTmI3L2dGMyticXlHTWxvQjFsRDdBa1ZTL0NGYk85?=
 =?utf-8?B?WUszN2RrLytrVjc4WDJKQVBrTG9ZWElRSWl5U0NaSk1KNnJLS2ZWdCtCWFR3?=
 =?utf-8?B?Z3FKQStVU29zQW5MKzhsQ2FPYndSUGtBenprRFJjWXZWdE5Nc2VYWEVFWllU?=
 =?utf-8?B?dEZ2emc1a1VrUzhxb2pSZjFabktQbWdSaVFKempMOURDU2oyY1NldW5PVFFu?=
 =?utf-8?B?MDFXcFlUaEFVR3p1Mm5uVElpS0lDcE01V2txZE9qM2xjZnhIZkZVVGo0YXFt?=
 =?utf-8?B?MXFJTXdRUStxNmpEL3dkWGpCdld3MGxpbG5WaFd0ZXF5UU4remF3R2g3VWFC?=
 =?utf-8?B?L2FVOENKOGRia2F0R2JpYjhUZFpKZlVxRTJvT1pnOCtNSkUvYi9WMVVnUjUx?=
 =?utf-8?B?WitqUFc1SlQydjlTdzQvMTFWN3JwZ1h5eUIxeHNiOXhZb0o2NWx1Wm5MWFo2?=
 =?utf-8?B?UkEwRXY4SXA4YnpVM0U0dHZGVkZhY2VsK1k2VktQS0xrdG1wSDgyWVFaYnFR?=
 =?utf-8?B?YXRTZlBtNW4wNG5YNnZINkMwYUJHeFhnNDRuZDBTMzhlMGFDZFZLMXNMV0d4?=
 =?utf-8?B?KzBudDNNd1ZxOGRXM2NCNWJMbnZ1T3g4Wlg2UHlFMUJnb20wZ0RxbW5VbzZw?=
 =?utf-8?B?cHRIamNoblJoTWIyWndodXFqa1VJZGN2SDNFQkdqV2xaRTNXMHFZeFo4TXl4?=
 =?utf-8?B?aG00RXQ0VHp4VDNvZHJGbzVkMlZXeFVWNXlWNXpEV3VjdVBvUDlEcDZyMFMr?=
 =?utf-8?B?SVBNNHhJQmRTVVJpMGhxOUtnY3R2RXlORFBtYWNzRE5iZjBiU2hTVXFXdGl1?=
 =?utf-8?B?RHlWZC84WVZVbk1tT2ZISUNQekk3bkJycUxjNzBLNHl0TkFkY0FzTnREQUY0?=
 =?utf-8?B?L0ZURG04V0x1alNmeXFldW9ISjFDK2ora3VKUkZsNE9ObEMyNWdBRmdxbkZ2?=
 =?utf-8?B?TDZSeHNBSHRhOXRYNUVzOWhaY3hxRmhMeVREVjk2Qmd6QXZaVnU3eDFXYk5u?=
 =?utf-8?B?WFM1YVNETWNuRU9LUzN3WXJtdDIzSm03M0xLWmR3MEVkYi9Xd1JtRk1ldEJX?=
 =?utf-8?B?dkZxSEt1VG5lQXRwNXEwRGdJOXBYSVR5RTdaaHV1Y3FXbnAyQU9Qc2Z4eUpn?=
 =?utf-8?B?RUZ6MGN6SW5Sb1U1L2tXbHlGUmpwekc4S0lXdFhjcGJTTWF0UllsN1hwVVBP?=
 =?utf-8?B?WWc5Z1ltd0FpMjJjYTVGcFIrbGIrdk1zckdqUnVsSzJwaWV3cmQxb1JPZzAy?=
 =?utf-8?B?ZTcrR3ZES1JSUDZvTkJMYVl5b1F0d012UXNNNE5scFVRYzB3Vzg2MFBOS2tm?=
 =?utf-8?B?YUNMd0xsTkYzMkVqd1QrcitSTnpCM0lkUkhwaGdQcmVTTnFXQ0lCUklyTTB0?=
 =?utf-8?B?N29IUm9LN0R4aXA4YXBhaXA0WG9YazgrdjR3TmUxM1FjZ0VwNkVEdkZTRFNG?=
 =?utf-8?B?NlhZMUxtSE1BM3Q0bG1WV2wxRmR2Wnk5a2diMjM2aUFZVnhFK3FQajZNaTNr?=
 =?utf-8?B?bWJhaFN6Uml5V1F6SVdtaEFnTlJzamdwSUViV1EwUEpnUTFGZnFBVTNsZHVV?=
 =?utf-8?B?VUtGRXB2NVNoRG1nbGpTWUMxdFUzTHZpTDZHSCtUb1NkZ3BpdnFjcnFnQ1RH?=
 =?utf-8?B?cDlGMnZvZzRmSitQUTYwM1BCdnNkaW9KZ2RLZGYrdlJNamlFYVpNWUJTRlhY?=
 =?utf-8?B?OWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C7EC664A7F78A4D906A870F430A9910@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a12b198a-0de0-425f-5223-08dde18c3be7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 14:57:37.2800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a5uEAYwNo+RHONSHbdFkyRMibkQ19jnHQQN791tiIROk2RTnTHm+lXhgMSKk8p4K18+zQPJkEaYkKdOQx3C9rdatBKK46CFkhnLdyYH30FE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5081
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

T24gVGh1LCAyMDI1LTA4LTIxIGF0IDE5OjIxIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBUaHUsIEF1ZyAyMSwgMjAyNSBhdCAwNTozNDo1M1BNIC0wNjAwLCBTdW1tZXJzLCBTdHVh
cnQgd3JvdGU6DQo+ID4gT24gVGh1LCAyMDI1LTA4LTIxIGF0IDE1OjEzIC0wNzAwLCBNYXR0aGV3
IEJyb3N0IHdyb3RlOg0KPiA+ID4gT24gV2VkLCBBdWcgMjAsIDIwMjUgYXQgMTE6MzA6NTBQTSAr
MDAwMCwgU3R1YXJ0IFN1bW1lcnMgd3JvdGU6DQo+ID4gPiA+IFRoZXJlIGlzIGEgc21hbGwgd2lu
ZG93IG9mIHRpbWUgZHVyaW5nIHRoZSBkcml2ZXIgdGVhcmRvd24NCj4gPiA+ID4gd2hlcmUNCj4g
PiA+ID4gdGhlIFRMQiBpbnZhbGlkYXRpb24gZmVuY2UtPmd0IGlzIHNldCB0byBOVUxMIGJ1dCBh
bg0KPiA+ID4gPiBpbnZhbGlkYXRpb24NCj4gPiA+ID4gd29ya2VyIGlzIHN0aWxsIGFsaXZlLiBU
aGlzIHdvbid0IGNhdXNlIGFuIGlzc3VlIGN1cnJlbnRseQ0KPiA+ID4gPiBiZWNhdXNlDQo+ID4g
PiA+IHRoZSB0bGJfaW52YWxpZGF0aW9uIHN0cnVjdHVyZSBpdHNlbGYgaXMgc3RpbGwgcHJlc2Vu
dC4gSG93ZXZlcg0KPiA+ID4gPiBhcw0KPiA+ID4gPiBwYXJ0IG9mIGEgZnV0dXJlIHJlZmFjdG9y
LCB3ZSBhcmUgbG9va2luZyB0byBzcGxpdCB0aGF0DQo+ID4gPiA+IHN0cnVjdHVyZQ0KPiA+ID4g
PiBvdXQuIFRvIGJlIHNhZmUsIGdvIGFoZWFkIGFuZCBjYW5jZWwgYW55IG91dHN0YW5kaW5nIFRM
Qg0KPiA+ID4gPiBpbnZhbGlkYXRpb24NCj4gPiA+ID4gZmVuY2Ugd29ya2VyIHRocmVhZCBvbiBf
ZmluaSgpIHNpbmNlIGF0IHRoYXQgdGltZSB3ZSBhcmUNCj4gPiA+ID4gYWxyZWFkeQ0KPiA+ID4g
PiB0ZWFyaW5nIGRvd24gdGhlIGRyaXZlcndvcmtlciB0aHJlYWQgb24gX2ZpbmkoKSBzaW5jZSBh
dCB0aGF0DQo+ID4gPiA+IHRpbWUNCj4gPiA+ID4gd2UNCj4gPiA+ID4gYXJlIGFscmVhZHkgdGVh
cmluZyBkb3duIHRoZSBkcml2ZXIgYW5kIGRvbid0IG5lZWQgdG8gY29udGludWUNCj4gPiA+ID4g
bW9uaXRvcmluZyB0aGlzLg0KPiA+ID4gPiANCj4gPiA+ID4gQWRkIGEgbmV3IF9maW5pKCkgcm91
dGluZSBvbiB0aGUgR1QgVExCIGludmFsaWRhdGlvbg0KPiA+ID4gPiBzaWRlIHRvIGhhbmRsZSB0
aGlzIHdvcmtlciBjbGVhbnVwIG9uIGRyaXZlciB0ZWFyZG93bi4NCj4gPiA+ID4gDQo+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+
DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArKw0KPiA+ID4gPiDCoGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9uLmMgfCAyMQ0KPiA+ID4gPiArKysrKysr
KysrKysrKysrKysrKysNCj4gPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdGxiX2lu
dmFsaWRhdGlvbi5oIHzCoCAxICsNCj4gPiA+ID4gwqAzIGZpbGVzIGNoYW5nZWQsIDI0IGluc2Vy
dGlvbnMoKykNCj4gPiA+ID4gDQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3QuYw0KPiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jDQo+ID4gPiA+
IGluZGV4IGEzMzk3ZjA0YWJjYy4uYmJmM2Y0ZGE3ZjU0IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3QuYw0KPiA+ID4gPiBAQCAtNjksNiArNjksOCBAQCBzdGF0aWMgdm9pZCBndF9maW5p
KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sDQo+ID4gPiA+IHZvaWQNCj4gPiA+ID4gKmFyZykNCj4g
PiA+ID4gwqB7DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZ3QgKmd0ID0gYXJn
Ow0KPiA+ID4gPiDCoA0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqB4ZV9ndF90bGJfaW52YWxpZGF0
aW9uX2ZpbmkoZ3QpOw0KPiA+ID4gPiArDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqBkZXN0cm95
X3dvcmtxdWV1ZShndC0+b3JkZXJlZF93cSk7DQo+ID4gPiA+IMKgfQ0KPiA+ID4gPiDCoA0KPiA+
ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRp
b24uYw0KPiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9u
LmMNCj4gPiA+ID4gaW5kZXggNzU4NTRiOTYzZDY2Li4xNzBmNmM5NzI2OGYgMTAwNjQ0DQo+ID4g
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9uLmMNCj4g
PiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRpb24uYw0K
PiA+ID4gPiBAQCAtMTg4LDYgKzE4OCwyNyBAQCB2b2lkIHhlX2d0X3RsYl9pbnZhbGlkYXRpb25f
cmVzZXQoc3RydWN0DQo+ID4gPiA+IHhlX2d0DQo+ID4gPiA+ICpndCkNCj4gPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoG11dGV4X3VubG9jaygmZ3QtPnRsYl9pbnZhbGlkYXRpb24uc2Vxbm9fbG9jayk7
DQo+ID4gPiA+IMKgfQ0KPiA+ID4gPiDCoA0KPiA+ID4gPiArLyoqDQo+ID4gPiA+ICsgKg0KPiA+
ID4gPiArICogeGVfZ3RfdGxiX2ludmFsaWRhdGlvbl9maW5pIC0gQ2xlYW4gdXAgR1QgVExCIGlu
dmFsaWRhdGlvbg0KPiA+ID4gPiBzdGF0ZQ0KPiA+ID4gPiArICoNCj4gPiA+ID4gKyAqIENhbmNl
bCBwZW5kaW5nIGZlbmNlIHdvcmtlcnMgYW5kIGNsZWFuIHVwIGFueSBhZGRpdGlvbmFsDQo+ID4g
PiA+ICsgKiBHVCBUTEIgaW52YWxpZGF0aW9uIHN0YXRlLg0KPiA+ID4gPiArICovDQo+ID4gPiA+
ICt2b2lkIHhlX2d0X3RsYl9pbnZhbGlkYXRpb25fZmluaShzdHJ1Y3QgeGVfZ3QgKmd0KQ0KPiA+
ID4gPiArew0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAvKg0KPiA+ID4gPiArwqDCoMKgwqDCoMKg
wqAgKiBBdCB0aGlzIHBvaW50LCB3ZSBleHBlY3QgYW55IG91dHN0YW5kaW5nIFRMQg0KPiA+ID4g
PiB0cmFuc2FjdGlvbnMNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgICogdG8gc3RpbGwgc2lnbmFs
IHRocm91Z2ggdGhlIG5vcm1hbCBjaGFubmVscyBvZg0KPiA+ID4gPiBpbnRlcnJ1cHRzDQo+ID4g
PiA+ICvCoMKgwqDCoMKgwqDCoCAqIG9yIE1NSU8gcG9sbGluZyB1cGRhdGVzLCBldGMuIFRoZXJl
IGNvdWxkIGJlIHNvbWUNCj4gPiA+ID4gd29ya2Vycw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAg
KiB0cmlnZ2VyZWQgYXMgYSByZXN1bHQgb2YgdGltZW91dHMgaW4gdGhvc2UgY2hhbm5lbHMsDQo+
ID4gPiA+IHRob3VnaCwNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgICogdGhhdCB3ZSB3YW50IHRv
IG1ha2Ugc3VyZSBnZXQgY2xlYW5lZCB1cCBkdXJpbmcgYW4NCj4gPiA+ID4gdW5iaW5kLg0KPiA+
ID4gPiArwqDCoMKgwqDCoMKgwqAgKiBTbyBoZXJlLCBjYW5jZWwgdGhlIGRlbGF5ZWQgd29yaywg
YnV0IGxldCB0aGUgbm9ybWFsDQo+ID4gPiA+IGZlbmNlDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDC
oCAqIHNpZ25hbGluZyBoYW5kbGUgdGhlIHJlc3QuDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCAq
Lw0KPiA+ID4gDQo+ID4gPiBZb3Ugc2hvdWxkIGFzc2VydCB0aGlzIGlzIHRydWUgdGhlbiwgZS5n
LiwgdGhlIHBlbmRpbmcgbGlzdCBpcw0KPiA+ID4gZW1wdHkuDQo+ID4gDQo+ID4gVGhlIHByb2Js
ZW0gaXMgdGhpcyBzZWVtcyBhIGxpdHRsZSByYWNleS4gSSBkb24ndCB0aGluayB3ZSBjYW4NCj4g
DQo+IEhtbSwgSSB3b3VsZG4ndCB0aGluayByYWNpbmcgaGVyZSB3b3VsZCBiZSBwb3NzaWJsZS4g
VHJ5aW5nIHRvIHJlYXNvbg0KPiBob3cgdGhhdCB3b3VsZCBiZSBwb3NzaWJsZSBhbmQgY2FuJ3Qg
dGhpbmsgb2YgYSBzY2VuYXJpby4NCg0KQWxyaWdodCBsZXQgbWUgd29yayBvbiB0aGlzIGFuZCBn
ZXQgYmFjay4uIEkgaGF2ZSB0cmllZCB0aGlzIGFuZCBhbQ0Kc2VlaW5nIHN5c3RlbSBoYW5ncyB3
aXRob3V0IGEgcGFuaWMgKGF0IGxlYXN0IEkgaGF2ZW4ndCBiZWVuIGFibGUgdG8NCmdldCB0aGUg
cGFuaWMgb3ZlciBzZXJpYWwgb3IgaW4gdGhlIHN5c2xvZywgZXRjKS4gSSBhbHNvIG9ic2VydmVk
IHRoZQ0KbGlzdCBzbG93bHkgZHJhaW5pbmcgKHZpYSBwcmludGspIG92ZXIgdGhlIGNvdXJzZSBv
ZiB0aGUgdGVhcmRvd24NCm5hdHVyYWxseSB3aXRob3V0IHRoZSBleHBsaWNpdCBkcmFpbiBoZXJl
Lg0KDQpCdXQgSSBhZ3JlZSBpdCB3b3VsZCBiZSBuaWNlciB0byBoYXZlIHRoYXQgaGVyZS4uLiBJ
J2xsIHJlcG9ydCBiYWNrDQpvbmNlIEkgaGF2ZSB0aGlzIHdvcmtpbmcuDQoNClRoYW5rcywNClN0
dWFydA0KDQo+IA0KPiA+IGd1YXJhbnRlZSB0aGF0IHRoZSByZXNwb25zZXMgYXJlIGJhY2sgZnJv
bSBHdUMgYnkgdGhlIHRpbWUgd2UgaGl0DQo+ID4gdGhpcw0KPiA+IF9maW5pKCkgcm91dGluZS4N
Cj4gPiANCj4gDQo+IElmIHRoaXMgdHJ1bHkgaXMgcmFjeSwgd2UgY2Fubm90IHJpc2sgZmVuY2Vz
IG5vdCBzaWduYWxpbmcgYXMgdGhhdA0KPiBjb3VsZA0KPiBsZWFkIHRvIHZlcnkgYmFkIHRoaW5n
cyAoZS5nLiwgcmVjbGFpbSB3YWl0aW5nIGEgb24gZmVuY2Ugd2hpY2ggbmV2ZXINCj4gc2lnbmFs
cykuIEkgdGhpbmsgd2Ugd2lsbCBuZWVkIHRvIHdhbGsgYWxsIHBlbmRpbmcgZmVuY2VzIGFuZCBz
aWduYWwNCj4gdGhlc2UuDQo+IA0KPiA+ID4gDQo+ID4gPiBJIGhhdmVuJ3QgY2hlY2tlZCBidXQg
bGF0ZXIgaW4gdGhlIHNlcmllcyB3aGVuIHdlIG1vdmUgdGhpcyB0byBhbg0KPiA+ID4gZW1iZWRk
ZWQgc3RydWN0LCBpcyB0aGUgZmluaSBvd25lZCBieSB0bGJfaW52YWwgbGF5ZXIgKGkuZS4sIGl0
DQo+ID4gPiBoYXMNCj4gPiA+IGl0cw0KPiA+ID4gb3duIGRybW0gb3IgZGV2bSBmaW5pIGhhbmRs
ZXIpPyBUaGF0IHdvdWxkIGJlIGEgYmV0dGVyIHBsYWNlbWVudA0KPiA+ID4gSU1PLg0KPiA+IA0K
PiA+IE9oIHNvcnJ5IEkgc2hvdWxkIGhhdmUgYmVlbiBtb3JlIGNsZWFyIGluIHRoZSBjb3ZlciBs
ZXR0ZXIuIFllcyBJDQo+ID4gYW0NCj4gPiBkb2luZyB0aGF0LCBidXQgSSB0aG91Z2h0IGl0IGJl
c3QgdG8gZml4IHRoaXMgaW5kZXBlbmRlbnRseSBmaXJzdC4NCj4gPiBBdA0KPiA+IHRoZSB0aW1l
IHRoaXMgc2VyaWVzIHN0YXJ0cywgd2UgZG9uJ3QgaGF2ZSBhIGdvb2QgcGxhY2UgdG8gaW5qZWN0
IGENCj4gPiBuZXcNCj4gPiBkcm1tIGZpbmkgaGFuZGxlci4gSSBtb2RpZnkgdGhpcyBwYXRoIGxh
dGVyIGluIHRoaXMgc2VyaWVzIHRvIGRvDQo+ID4gZXhhY3RseSB0aGF0IChyZW1vdmUgdGhlIGNh
bGwgZnJvbSBndF9maW5pKCkgYW5kIGFkZCBpdCB0byBhIG5ldw0KPiA+IHRsYl9maW5pKCkgdGhh
dCBnZXRzIGNhbGxlZCB2aWEgdGhlIGRybSBsYXllcikuDQo+ID4gDQo+IA0KPiArMQ0KPiANCj4g
TWF0dA0KPiANCj4gPiBUaGFua3MsDQo+ID4gU3R1YXJ0DQo+ID4gDQo+ID4gPiANCj4gPiA+IE1h
dHQNCj4gPiA+IA0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBjYW5jZWxfZGVsYXllZF93b3JrKCZn
dC0+dGxiX2ludmFsaWRhdGlvbi5mZW5jZV90ZHIpOw0KPiA+ID4gPiArfQ0KPiA+ID4gPiArDQo+
ID4gPiA+IMKgc3RhdGljIGJvb2wgdGxiX2ludmFsaWRhdGlvbl9zZXFub19wYXN0KHN0cnVjdCB4
ZV9ndCAqZ3QsIGludA0KPiA+ID4gPiBzZXFubykNCj4gPiA+ID4gwqB7DQo+ID4gPiA+IMKgwqDC
oMKgwqDCoMKgwqBpbnQgc2Vxbm9fcmVjdiA9IFJFQURfT05DRShndC0NCj4gPiA+ID4gPiB0bGJf
aW52YWxpZGF0aW9uLnNlcW5vX3JlY3YpOw0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRpb24uaA0KPiA+ID4gPiBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9uLmgNCj4gPiA+ID4gaW5kZXggZjdmMGYyZWFm
NGI1Li4zZTRjZmYzOTIyZDYgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9uLmgNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRpb24uaA0KPiA+ID4gPiBAQCAtMTYsNiArMTYsNyBAQCBz
dHJ1Y3QgeGVfdm07DQo+ID4gPiA+IMKgc3RydWN0IHhlX3ZtYTsNCj4gPiA+ID4gwqANCj4gPiA+
ID4gwqBpbnQgeGVfZ3RfdGxiX2ludmFsaWRhdGlvbl9pbml0X2Vhcmx5KHN0cnVjdCB4ZV9ndCAq
Z3QpOw0KPiA+ID4gPiArdm9pZCB4ZV9ndF90bGJfaW52YWxpZGF0aW9uX2Zpbmkoc3RydWN0IHhl
X2d0ICpndCk7DQo+ID4gPiA+IMKgDQo+ID4gPiA+IMKgdm9pZCB4ZV9ndF90bGJfaW52YWxpZGF0
aW9uX3Jlc2V0KHN0cnVjdCB4ZV9ndCAqZ3QpOw0KPiA+ID4gPiDCoGludCB4ZV9ndF90bGJfaW52
YWxpZGF0aW9uX2dndHQoc3RydWN0IHhlX2d0ICpndCk7DQo+ID4gPiA+IC0tIA0KPiA+ID4gPiAy
LjM0LjENCj4gPiA+ID4gDQo+ID4gDQoNCg==
