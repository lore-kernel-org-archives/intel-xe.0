Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF32C83F0A
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 19:37:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA2E10E360;
	Wed,  9 Jul 2025 19:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJnwSqOV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0989310E360
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 19:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752089827; x=1783625827;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=KI5qpttBkZnP8nXtXwsv+wpQlXZSYX1BPoe72VRoeds=;
 b=nJnwSqOVr+Bm3jOpBAmvemZnjHf0qkM4W/Qj//TgjO1s5sBnFx2QODAQ
 xO+hQZFHlW0ikMdYC1IJuS8KMcmNeHu4FzZjwtJHYRoWVgAIwcxeZxrFn
 nTZ9yN5OyLN1E+18qCMPOjuABir3cvIjKtl6w3mJ8xGqebNvhqvV8bxNa
 E/lTZEfgG74GpAZ2fcnA3sKVxX10AsoAlK9ebBNH2MyV6kduowTtmfKKU
 NdqJ17iWwchkA9/MXarDzse/CgHH9sYja7XxOE5v2q4YZyZbSPZS6B96G
 bRqaQrwaCsMajrWbW6xlfyLFw6tWAD6hONCU8k2GtoZiWe1EMYKVc8BpK g==;
X-CSE-ConnectionGUID: Jz0KWf9bS1yeFQ9p/vH/BQ==
X-CSE-MsgGUID: +Ex34UsfSradFdvdz2u3IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54333890"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54333890"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 12:37:06 -0700
X-CSE-ConnectionGUID: 3sBCowYxT3mccLd/9tPmKw==
X-CSE-MsgGUID: jnQ72k5pTeGyNua04LUAfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="155276906"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 12:37:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 12:37:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 12:37:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.83) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 12:37:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZzNrW9H0MLo714tbfLe5thL5BldEQoq6QnoKlXpKcvgeFQBBxOFrtEzi9D/8MqYZx0E/up9xPXJ3i8iJ5ek5vkTiCXgEPk0vETCGG6yedV0xl0cg/tEhv6ihaHV5gjNO9HwmKoWH/RUh9yvL0c4jXRcWNM7MT/8bD6n7VP1C95VvE+ZhX2EF0z3aPswV9kaKSD4+GmQtW8mXsbnkQ53vgVkNKw2syKp3R0KO/i5vFbsynjvYXkibkUKpWH3mY+0P7KZD/HDTctcEKFCQtVthnOZWgR+gBbPmntJVHFAxidbQHHmW0HXHB8s6AFlQgpLSw8tonJsp3P0eQu5q3NA0TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KI5qpttBkZnP8nXtXwsv+wpQlXZSYX1BPoe72VRoeds=;
 b=SgKU8xe3zImXKm3NVJG6knYgDa9GBq2tFj9fuWdOIHyiGq41qkce/g0T3x1Avd1cnd04KBQXkKAbaTTbas4qVWYAEPXdcZ4dWjD35290AOncF2/skYQN4GH1ODbzBL6iPhr4kwQYfVk7LbO1kWWXN7N2ZzPHk4TBbm8fWyJDXJ1H3+ecg1Qostt7qphG0SNjY9zii1o6/P4b58NB2t22wpBL70ZTc4yoZbZnI5pFzIivL9BlQdJRKVinUrjIMr58Mb1Z1Tqbd+V8GARHVb77Gqm99qshHFxbvl3ZvyrFiL8EXhqGEVvjtINIKoameL8d38TEbZ431uA4Ma6Tjg/5wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH7PR11MB6056.namprd11.prod.outlook.com (2603:10b6:510:1d4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Wed, 9 Jul
 2025 19:37:02 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 19:37:02 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "tvrtko.ursulin@igalia.com"
 <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH 5/7] drm/xe/lrc: Remove leftover TODO
Thread-Topic: [PATCH 5/7] drm/xe/lrc: Remove leftover TODO
Thread-Index: AQHb7Guz0HSDyWXKmkuT2dMkiFIbJLQqONaA
Date: Wed, 9 Jul 2025 19:37:02 +0000
Message-ID: <8e4710aa4b3d241c27f01661ae2a2cb862367cbb.camel@intel.com>
References: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
 <20250703-lrc-refactors-v1-5-6aa22f174041@intel.com>
In-Reply-To: <20250703-lrc-refactors-v1-5-6aa22f174041@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH7PR11MB6056:EE_
x-ms-office365-filtering-correlation-id: aedb02eb-5738-4ceb-a002-08ddbf1ffaa7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WTQ1blpoNGU0cUEwSUlOdU5MeDZ0MThyQUM3TGxrbnhPUlNERytRQ25FYkxP?=
 =?utf-8?B?VGVWRTlra0M4bk92aHIvZDQzRytNUitIa21ibGdHdjlET3pjNkFmOEpkbkZT?=
 =?utf-8?B?NDR2OW1HOGRLMmpha0gxU2dvcFM0Z2IwYUJZeGRBWkJMelhGcTc0WHVNZ1g0?=
 =?utf-8?B?R25FZlBnN3BRa3Y2WU5saXIzckplMzArNmFVZ1VyWDhKOUxhL1JpRDRFM28x?=
 =?utf-8?B?TGd5Z1FhejFvdWxZeVlSTGFmTGtUU3JzLzRndXZPdTgrVExET3lBZk9yaEhC?=
 =?utf-8?B?ZElBeXNJUm94SDBrNElCS0RxVllXVHozS1RpWHZZbC9aVy90SHFVb2pqWGVn?=
 =?utf-8?B?aXk4ek1tNTZCUkFoZkJsOGFRV0J4a0VDUE5qdGNKTFRQamhvSHA3S2hKK0Yy?=
 =?utf-8?B?aFdtYnZFV1Rsa2wwTzdycmI5U0VzRmo4MVdyNDRSbWJDZU9GdWhMYjFzQ0pC?=
 =?utf-8?B?Lzcvalg4VUVMRUNmalZVZ3M5TXZWSHY4bXpIQmRPcjc0T3ExdHI5VFVXdkhP?=
 =?utf-8?B?d1BGUXg4dXY5N3UwaVB1YnM0bGI5QkVRY3l5MkVPZklENkh2OXV2UG8rN2FB?=
 =?utf-8?B?QUh4S2ZJdHE1OEw3cmxWakMwTEFQZ09EK1YwMk9KQTZSSTVuMVRJWEZJMEZX?=
 =?utf-8?B?ZTNZTDJyTHRhUFVmS3Jzb3NBc2hGeEozdldJaHlrS2N0TTVyaDBZSWFId05N?=
 =?utf-8?B?dmdmRFM5dVJlNm5VTjNqbk5nSTk3TEJNMlVlZkRsVzloMHNBRHEwYTU1RFFI?=
 =?utf-8?B?bTJrT2psd21CaWdiZjJ1eStGMkxLZWdjUVJtRC9SamlLSmR1YktVQ0dwbmZx?=
 =?utf-8?B?TklRbHF5d0VQV3Z6Y3BCUUVqdVIxRlg5MkdsWVh4bWNYa2hUaEthTERRdDFy?=
 =?utf-8?B?dENKcExFUlMzdmw3Y2t0bTlsM3c0cHFxUWZCd2h5MWgwdHg2WnA2STk4VFRV?=
 =?utf-8?B?VXZJalY4Wk4wRlAwcEJORWNMOWQ1eDBSYlZqQmo4SXNIQ293eXVQRlZTbG4z?=
 =?utf-8?B?SElHQjRacURocWJrZ2hKZXkyR1EwSWFETytCanN3Zm96U3hndldHS3RReXBw?=
 =?utf-8?B?Vm1ZcUNMbDhwaXBRekpFc2x4MzkvaVl5RjhReEd3K3EySS9hMkl3d2hvYkdw?=
 =?utf-8?B?QnZBN0VnWFRQeWxzVE5nZm03SVhQODdFaWtBd003bWsydDVqMWo1VkcrcVdl?=
 =?utf-8?B?OGVxTzNIWFBuVU5KeTNvb2hLNGJZV2pZdWxlYXVnZjNuVkVqOWZHYnN1eVh1?=
 =?utf-8?B?QkNtNlBXajZBVEhVYi95enFud1RjK0JYaGttaTBRNUNRT1NwWlZCeFR3VGlp?=
 =?utf-8?B?djdTdGFFcUdSM1RwQUdEbEc3S3Zqa2xYaWRZY0FwaTNjNUtNbytqM1pLTnpY?=
 =?utf-8?B?Tk5RMy9mU29QUVN1VmtmK3Rzd2Q2VnZ6eGdxWGFFaWpMR1l1L3VNZ1VDMnht?=
 =?utf-8?B?Z0Q2SHlEaG81ZzdxelVLNDlET2p2TXM5cldRYXIzcjIzRWhqLzY1MmhVTm1m?=
 =?utf-8?B?MkVRYUlSeUNnZ1hjVlJCY1ROc0UwYjRpTUY1d0xtWkJ5YkNZTmNjSkh5Mmcz?=
 =?utf-8?B?MU8wS05PMys3WVVvWlVUZXpMQXpLczNOZHJlbVp4SUJlVzhZNmNZa3Q4MXFt?=
 =?utf-8?B?eXBlQ00xUEs2S0tEd2VTVHppZndMTWg4dHlERHVwMWh6RlBKNC9aMlVIZ3Fm?=
 =?utf-8?B?TEFza3hzelJtLzd1VlJqVXFGaWhCc3JYWVp6VjlZd2VEMmJ5QmQwMXZzcWRr?=
 =?utf-8?B?OFhwSGV0NzJXSmNhY2JPckgvQVlVMWhhT0dRaGNuaUZ1ZEhjS0VrWDVuRytP?=
 =?utf-8?B?M09IUnpCai9BWjd6WENId29EemVIdWRtRENBZHFjR0g5YnFnRjdoUVBOdENX?=
 =?utf-8?B?ZEFlOFdVUVJIYVhSSTVaajNsNFVhb1dwcllFMU9HWUNoeEdiQWVBNlhGQVRq?=
 =?utf-8?B?RHlOcjNJR2NVSTRKSmpaRmZ1SDVLZm0rVG1FbFNsZmRLTXdFYnRqVTloZkxJ?=
 =?utf-8?Q?ZYhMxBTJ4BJptMoHB57NAicAXoyheY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1hqTEhadlc1dkpmZ2lWekNxUWNFaXA4R3hWdHZlajNZQnlIcjllVk9VN1Ex?=
 =?utf-8?B?SVhqbXdaN3hWdm1PTHZRejU5Qm5QMGIraGQ2ZDUxM2tJUnZuMWgzSGlPcng4?=
 =?utf-8?B?L1hzRHNXQ1dRSi9wdldlalZpa1R5ZjU1OUM5RXZuVHdEZEM0dXFiT2wyTWhS?=
 =?utf-8?B?TFd5OVdob2g4NThwRk52UDhzZk4wTy9LNm5PWnZQbWpQeXdDRUhsaEwxZEY5?=
 =?utf-8?B?SWxGWVNaVVg3U2t1U2V4TFF6QWJZVUMzNDNFVGplRWx0ZzhxMlJtQjlDQ1Av?=
 =?utf-8?B?U0VPOUpkN2h3R2hONlpjcWFFdTNpaHFxVndBM0MwN1J0VHZUYkFOWHBrK1Nq?=
 =?utf-8?B?ZjZxSjBraDZ0UnJYZ3VnQkhvZW5SejNlcmZIaEdBV05IalZCUjlFM0tIK1dn?=
 =?utf-8?B?UmxOV0YvUU9wa0hmZnY0aXFhL3paZm1JZ01scW1aRHRKVnkxYk4rU1RXTjZj?=
 =?utf-8?B?ZmJoRnVHVnZLN0hOb0NwNUtMYWhzS2JVdTNhTklSWEdEYzdnMXFxOUdNRnU5?=
 =?utf-8?B?U0o2SHJRUVlVS05WYjFBdTluZFl0WXlNaW52emVUb2xDaDc1cjlHSEFwRWk4?=
 =?utf-8?B?ZCtWbDh1NEFucVlVNTJpeWtvVWYyaDFmaXgrZ1U0L0Y4Wlg4Rkp1MXg0SWl2?=
 =?utf-8?B?NGtXSmlsdXpUOHpFbGFpVTJxMmc4anFTQjJpdVN0WG1QK2dTejBHckVvWDdY?=
 =?utf-8?B?REhPRXc5Z1FYY2Qzd1Nxa2xMYVNqM0VabU5sbGdXNDZyeDRRNHVUOWFzaUdU?=
 =?utf-8?B?RVhwWTBBQjZTQlF0bFpiMUU1bkxXM0dXdXNzSDAxNVdZZXAyWU9CNCtMeEgw?=
 =?utf-8?B?OUxoaC9VL0k4S0xKZVYvQ1VIdGpOUDRTVTdvOEt0c3UwQ2xSb1JOR1dVdm1H?=
 =?utf-8?B?SEhxSFg0NEI4Q05OQys3UkhXTE54aWlLdGxsUEsxUHNEYXMvUkRHeDJJM2pa?=
 =?utf-8?B?TEN1N0N0RHA4RkxWd3FRRXBrT1R5K0VnY1FlMWhUbTBLRnhoaS9WYi9kSC9N?=
 =?utf-8?B?MFMvYmZjbVd2WTZNbWxEL2crYmthQVJvbFVFZ1kzYUJZNGw5YnRqeU1ka2VS?=
 =?utf-8?B?Yy9Vbk8wTGR4ejVRV2JwbFVlOW1HZzdSRVpjK2VxZE5NU0Z5Um9La3BDejB3?=
 =?utf-8?B?djhTSktibWJEZ3pab1dDMHZZZCtBcXFabU9qaWVSOWJFT1htTGhsUkRibHVJ?=
 =?utf-8?B?VUNrLzA4RCtLQ1RpNXpCTVB3MkNYbFRyNmhlUFM4K1FkOUY1UVBFRUY0a0FK?=
 =?utf-8?B?VTFIaEZRYW1nS0dlbWF5OURBQ3lRaDVvNUdhV0hpWW9FZ2EzQWNNK2dDTlQ2?=
 =?utf-8?B?QndDd2JKT2RYcVU5d0NsdzRrSW1CeUtId202ZGNXVTJNaFlDeUNrZjdyRUt4?=
 =?utf-8?B?S0xHYUZlOHo0UklqM2ptci9HMUVxQjJvcEtaZkZ3bUprWnNXbnJWL3o5d0dQ?=
 =?utf-8?B?NzNXUnlNNzlTMjlwY3NJZjdYNjI2dzQ5aHJFbFBpcC9PUzh0blYvRkpaQkdn?=
 =?utf-8?B?ZlJQdDd3VG9vL25BRlhWUVlTZXRYR0dEMUxDalpDbngxTzBITXlRMnBLalZp?=
 =?utf-8?B?RWpvcU9SUndlcnFPbytZMUZnLzlMSlFOK2RDcHJobTZBNUlDRjcvZWkvcEEv?=
 =?utf-8?B?Z2ljeUMyTE1vZm5DbEtBZDA4YmJXZG9vOXZwRDQ0eG9HaXFHRUVHSnE4a21Q?=
 =?utf-8?B?aUxBU2ZKckZPZ2dMdS9LMm96S1pUOXVicU5hanZqdTNEL0lFMlhLQ1dsVm01?=
 =?utf-8?B?c09LODZOQlN6cXE5SUVGaHg1RSsyb0pGdlN5R3lqQ09ORUpzRFEwZnA4S0pq?=
 =?utf-8?B?VjhERWxzNFA4SzV4YlFLRktpZkV0ZnZZeTFqa3Q0MXk0UFZIVEI0NnNOZDFw?=
 =?utf-8?B?MCticFhxMkgyNWgrUzI0S2ZmT2JMeGdGK0dMd0FDVHlXdG5Lb1NrYWMxS3Js?=
 =?utf-8?B?eDVkeUMyUkdBQ0NodGU3c2ljQm5iSGlXMTIvOThXNzlEKzlzTW1aeXJlWUda?=
 =?utf-8?B?T2tUUWp6OUZZb2JraTIxTzdRdWg4T2E0TzdCQlBtdmFrMG9yOWI0YjdveWN1?=
 =?utf-8?B?K1JsR2hCb1h6ZDQwaCtxTzhRL1VLZ2JXZno3T1FWZDJoUDNiR01NTkwwVFE1?=
 =?utf-8?B?emVpN2xrbC9obEdSS2luMUw2aGsxdkFhOVh4eENVNGNKSVJFWGowUXVYV2ZK?=
 =?utf-8?B?ZWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0517249D3BF8D44D9F574377B5E05995@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aedb02eb-5738-4ceb-a002-08ddbf1ffaa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 19:37:02.6597 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rnO8TU3g5OW+PGJth5LKLrPDKEzE4hf/gLQT7lXjU91effVhqzT2lxTNV/qQRVr+6rTmko9U+3MkNUgvHDhPfwnPi2AW2V47jQuzNm+/LEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6056
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

T24gVGh1LCAyMDI1LTA3LTAzIGF0IDE1OjQxIC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IFRoZXJlIGlzbid0IGFueXRoaW5nIHRvIHNldCBmb3IgQ1RYX1RJTUVTVEFNUCBoYW5kbGlu
ZyBpbiB0aGUgZW1wdHkNCj4gTFJDLCB0aGF0IGlzIHNldCBvbiBldmVyeSBMUkMgaW5pdCBzaW5j
ZSBpdCBzaG91bGQgYWx3YXlzIHN0YXJ0IGZyb20NCj4gMA0KPiByYXRoZXIgdGhhbiB0aGUgdmFs
dWUgc2F2ZWQgaW4gdGhlIGltYWdlIGFmdGVyIGZpcnN0IHN1Ym1pc3Npb24uDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4g
LS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyYy5jIHwgMiAtLQ0KPiDCoDEgZmlsZSBj
aGFuZ2VkLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9scmMuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYw0KPiBpbmRleCA3
NWY0Njc4Y2IwOTBhLi4yYzczNWIzNjc5Zjg2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfbHJjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyYy5jDQo+IEBA
IC02MDMsOCArNjAzLDYgQEAgc3RhdGljIHZvaWQgc2V0X2NvbnRleHRfY29udHJvbCh1MzIgKnJl
Z3MsIHN0cnVjdA0KPiB4ZV9od19lbmdpbmUgKmh3ZSkNCj4gwqDCoMKgwqDCoMKgwqDCoGlmICh4
ZV9ndF9oYXNfaW5kaXJlY3RfcmluZ19zdGF0ZShod2UtPmd0KSkNCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqByZWdzW0NUWF9DT05URVhUX0NPTlRST0xdIHw9DQo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoF9NQVNLRURfQklUX0VOQUJM
RShDVFhfQ1RSTF9JTkRJUkVDVF9SSU5HX1NUQQ0KPiBURV9FTkFCTEUpOw0KPiAtDQo+IC3CoMKg
wqDCoMKgwqDCoC8qIFRPRE86IFRpbWVzdGFtcCAqLw0KDQpTZWVtcyBpbnRlcmVzdGluZyB0byBh
ZGQgeW91ciBjb21taXQgY29tbWVudCBoZXJlIGluc3RlYWQgb2YgdGhlIFRPRE8NCnVubGVzcyB3
ZSdyZSBhbHJlYWR5IGRvY3VtZW50aW5nIHRoYXQgc29tZXdoZXJlIGVsc2UuDQoNClRoYW5rcywN
ClN0dWFydA0KDQo+IMKgfQ0KPiDCoA0KPiDCoHN0YXRpYyB2b2lkIHNldF9tZW1vcnlfYmFzZWRf
aW50cih1MzIgKnJlZ3MsIHN0cnVjdCB4ZV9od19lbmdpbmUNCj4gKmh3ZSkNCj4gDQoNCg==
