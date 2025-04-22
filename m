Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B77FC369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 16:03:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225F710E5E1;
	Tue, 22 Apr 2025 16:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R60plvSA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D321110E5E2
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745337784; x=1776873784;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=mKgl9CO7HFqFoVss+4/a9DCEh3w2r5JUTS1ITQcGp+E=;
 b=R60plvSAAaNG9kNZiVX/ObPQLroHOVtij01IyAoLl5kiRHA9nhbC7qUY
 eiy9hkPPti7R4txKYn4I/5IOsSdYIHpRUcilECeHndBIvMr2yMIKLX2Op
 5O7hVNm2SPO8zPCN4rK3knJaXStmYBPTbYt+XRxL9TQcv867zCWqOO0JN
 LTelIPjN4/edOpO4c2oLELpSrWKIpjy4/c9SrSuZ6YRbDAGvDQZ5EkoLm
 16kZqP1UrpXPmv+k2k+16kbF0Le9THwEKTw1xCv4q4Buzys5K6oyLsB9Q
 i6hlHdQ210Ll9YCEzKOmMSb34G9ulxohbd8s5MrGyvFK41FxMIJlIUeI8 w==;
X-CSE-ConnectionGUID: F4xN9LDfQHCeimp7Gu8Mmw==
X-CSE-MsgGUID: Rbhb2QWJQBCQxF8qTaKS8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46024049"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="46024049"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 09:03:04 -0700
X-CSE-ConnectionGUID: Jzkj7DU/SK27fKl12sG8hQ==
X-CSE-MsgGUID: yTaGlfhDSGi5IfCRm3t2qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="133006926"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 09:03:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 09:03:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 09:03:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 09:03:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y3CRfi/dFsSWYx1UXPyb6X2xrStjUS46NOtRC8k5qS2CQLAUqN/ULct02h+1QK2g9IvFW5nke8pnRAvtyycFNRy+iLcF0K7c5IWL6A6lZYrH2eXnjZgWvbZWOxnDvPJZdUtRK1XklpwxFWsDNEN75CIwiOYX1WiTkTdc1QYp9N0B3BHPV4o8+eb82dpgGR89T4Rsdz3nrDcllY9cF/xVkfzwnggD+vkECtzHMlW95g3j6Llk6leCiFL3Kswww1ZahIGQHW8Acsordfn2NB2gso8Ghz4U9Q7DcufjpbHihud9SRLbxmPNHFIoSBibkziuWrCs9JDqnRve1LO3HYvqHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKgl9CO7HFqFoVss+4/a9DCEh3w2r5JUTS1ITQcGp+E=;
 b=YpkgHWMqzHsi9zMmmNNT5xw39W4hQjOWZ6xWuhgdFCwtbUTxVmKC9rarmg4QcJkpvVvrG8GjdbvPboTSGydLX0jgKWkfatCYhLuqTaVU9u6BMyUWIZ0iBEe4fVcDr55i0MyiIOSg0+SRNxPDUQ0Y267MKT8fkHww56r15VzTDwjLqj2Q8L6iw3p2flJS8Lk04RHGF34gQPFmYV8LvsQYFD4o2p1aMMkRh18uiDT1TWNl1n4Rwn9QAXw+f/qp/JW6ifS9jO0s1fqKwVubOoFiuIqErhzTdNFtbjyrfdjRLLI3YqHzPnvmmaBwTGbTiT5tt2bwagNPkb6N9JaU9cktGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CH3PR11MB8237.namprd11.prod.outlook.com (2603:10b6:610:154::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 16:02:58 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%6]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 16:02:58 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 17/32] drm/xe/uapi: Add madvise interface
Thread-Topic: [PATCH v2 17/32] drm/xe/uapi: Add madvise interface
Thread-Index: AQHbp6Lu7DD/vlYFq0a8UzzQfyhwEbOoO1iAgAevIACAAAZGgA==
Date: Tue, 22 Apr 2025 16:02:58 +0000
Message-ID: <dc38675294a98589b550fb0929d028e669b4d873.camel@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-18-himal.prasad.ghimiray@intel.com>
 <023b0ec5c3e00b1779e0bbfde5a279042a86efa9.camel@intel.com>
 <aAe4bIz2NEpidrNC@lstrano-desk.jf.intel.com>
In-Reply-To: <aAe4bIz2NEpidrNC@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CH3PR11MB8237:EE_
x-ms-office365-filtering-correlation-id: 812c9b56-b1a6-4fb7-088b-08dd81b72684
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eVZtb2tLSEYwY1dHNlpNNHRwcjNhalhCYm1SNGhvbmNHOG8xYy9NaktVbFRk?=
 =?utf-8?B?VlkxRVA4dGpreGVkWFh3eDBSZytCS1dtZmRFWDBobmFPNGFYclc5eld4clNo?=
 =?utf-8?B?ajRxYlRoUmlzbXJmbWh6c21WZDJPSktqVW1VYWdkcEk0N3c2enM2cFZIUFJI?=
 =?utf-8?B?eDZFSXNDMVI4SiswRk1ubkwyQ2JTZ0pkRWRUMTZNQTl1NTFTUkYvSkw2Zk9h?=
 =?utf-8?B?VElvOU1sRyt3Wmt0S0UwYlplNTVtbTJGcXE4TlpIeERmdHNTWTcvcHRuRmdW?=
 =?utf-8?B?Z2RhWkNkR2t4RFZXQncrWlBiMEgrTC8zc05ZOFF3ZG1NcUJYUE9ZTkNSVTJ0?=
 =?utf-8?B?K09nTjg3SVk5Mytlb3VQV2I4TnZjamp2SmtVcFZUUXI3NVNmcytXTmJORGVZ?=
 =?utf-8?B?bFNSNDNLS1F2QTRXWGZ6Smp2QSswZ1pPUUhvR0dpMStFbGZreUxDQ3NwODBr?=
 =?utf-8?B?T2tpbkxkQW9lTUtDUEhkVmI1blY0UnBIc0p0VTJoRGpuMWJFQ3hPTVBMM1Yy?=
 =?utf-8?B?OUh6aHgvdTlhTFFGT0lONUdnbVFZZGFvQm1RU3dDdU01Yms2WXl5UkdaUktU?=
 =?utf-8?B?K0JYd25MV0FlcnJtSEVVNnB1dE1JU2E3eS9wWEFnWm54ZFlKNjR3MG9SQ0ZS?=
 =?utf-8?B?TGZzaGd5a0kyeHA3eUZaYWc5RlY3cG9MOW5xS0srSmFVOXlVOFVNZHJ3TFEx?=
 =?utf-8?B?MDhlOFRWT25NM2I4ajN6bkk5ZEJoOUFLbkZwSUFFTWp1TERLdkN1WjQ5TEda?=
 =?utf-8?B?K3gvWUZHd1dzeldjN0dyNWlUSEVSbkt0VnV2UVRHWkt1Tmx1S01jZVdicHFh?=
 =?utf-8?B?WjIxbVg0dTVEdXdxRGhveEhTUlk3d3JzQkhPa2ZvUlYxSFNsV25XaDgySGpQ?=
 =?utf-8?B?emZrR005N1UwSjVmeHNOeFpWUHNac1VLKzhRSlE0T1FyQXFUdGQzWHZ6RnFQ?=
 =?utf-8?B?TC92SkU0Zm1WQit0VFU1NUQrUDIrVFFRZDIwTjFIZzFwTFVheGw4bkJDbTI2?=
 =?utf-8?B?L1RmWVhWMkRFN1VQNm95M29JanVlT0luS01SZWQ5ZkxPT05tOFNleG9VMmpM?=
 =?utf-8?B?ZlR1ckUvYUQ3NHNCcDlJSHMrQzFNYW00TzZMVEVjOEFHbGNtbDF5K0pTMkZt?=
 =?utf-8?B?eU1RTEtJcEYxdjNhNnZkTDJYeVlyWWdYWXN0UVlRSnNtRU12d2pOYkpSVjVl?=
 =?utf-8?B?eXVmSVJ6RitVZXlzeW5UdzUxdHdHVE96eGgwVVlHbmRUOE81bURUcHpEc2Jv?=
 =?utf-8?B?MU12UmdPL3gvTGxCTVpEY1NEVVFxREZSMmNpQ2tJS3U5Vkk5Rjhtd0dzR2JO?=
 =?utf-8?B?RmFDazIxQjJnNTVBTUdYaEIwd25IVmg1WFNaeGMxLzlIQXA5cTBZM1k3cG5E?=
 =?utf-8?B?TXJxQU0ycHZrOWI1dnZMOTBDWGFmdnJUMmJvUnVPbFRLdWNVRGd3N0lPMSs3?=
 =?utf-8?B?UGRuUmxHUldZTTd6NE1aajlQdko3dDlERWo2eEt0Nk9CTmhXaGJZNDFLVHA1?=
 =?utf-8?B?Vm4weHdVdTUyZHdaaDhIaGI1dHBpTGVPT2pBZ3VaS0Q2akgrMnp4d1c3Wjc5?=
 =?utf-8?B?TE4vT2NiY2thNmFaWWJncmtMYUQ4d2I4VUtDOUZIY3dsUkpvbHBtb3EyVlZo?=
 =?utf-8?B?VnVlaUtpT2ZTNEF0Qm1zT1JIdUhIc0VSVTZaakw2SEVmYkUwSE1tdGZKMlZU?=
 =?utf-8?B?OXRObWV2ZVdOK0JybUFCTG5NS3h0MG9kVklUN0FzeTFyTDVsekI4cVlzeWRU?=
 =?utf-8?B?Q1E5eFFmV1JSanR2cnFtUXFSZmo4VkN4dDZEd1Fla0h4emVLSldQREpKOHJG?=
 =?utf-8?B?ZmtSaFNEdTkyMTVqWGJUTVNjcExCLzVyUUc5dEVKWlNnSERwSzVCaWNsRmpj?=
 =?utf-8?B?SmVXRW53SjY3dE9QSU1HTzIrdW5YQlR6UUFMWGhxOVNCS1N4a3hzOVVXWFNi?=
 =?utf-8?B?aE5VdzRZbGQvRWVXN01ET0c0elY2TDZEaTNYOE9kVWFuU2krL25CRDJIQXNU?=
 =?utf-8?B?cWM2c3N5S2hnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0xlUDI4ZEpLNUZ4MDdjWHpldGY1bGl1WW9ZRUd0RzFFZmh3ZVdyMGU0YzRx?=
 =?utf-8?B?bVMxNGVEbDdsY1J2Y0tIM0xBQWR6R1VOeUFrakZhU3pWREJkVnE3L3REUzhF?=
 =?utf-8?B?OERSTUdQS2REemt3L1VoNE5tbm9GeWV5M2RXZnIvWkQ3aXh4NWdNWDdZdFZt?=
 =?utf-8?B?RjFpUlowUUhEbnd6aE1WZHVBbGpObHZIKzlXWktDUVdLMmsrYWlpYk4xUFpm?=
 =?utf-8?B?clp5Y0pkN3haNmpzT0VTd0szQUIwRzQ0Nmx1RkhnaW9tckVZVlQzZklOMnVP?=
 =?utf-8?B?cXpwaHd2R2VLNFJnU0tLNWFyVUFSN0F3Z0RLb2puNFNlU0ZaZU52TWtIUTVj?=
 =?utf-8?B?Qm9IYVNWZkNkdTJ3d0NRZU9adUVvSUFEQy9LbGNHOTZ4d1lWL1hCZjg5NmN6?=
 =?utf-8?B?QkgwM29ydW5DVkNGZWR0Rk44djdXamFTY3UvMXMxVElrRHhYYTFxWGs3OXVN?=
 =?utf-8?B?OEt2Zlh3ajZFbmE5RktubHB1d2t1T3VSWmZ5RmtNdjV6cWJicnpiMGVTS1VU?=
 =?utf-8?B?QXFwaVFKRGV2UEFEYTR5VW9xVkUvUFIyNW8ralpRTGlrK2R1NnFEbGErUk5t?=
 =?utf-8?B?SWF0Zm53b3RpMzNoVFhMR1NzTFpnUEwzeUZ2dXVTWXpKVTQxZWtZc0JDeFRv?=
 =?utf-8?B?b0JPZXFhK0NCWWYxejV5TWhYa3RScVdYQUdacnRyUURDdFRPTnAwOHM5NWtN?=
 =?utf-8?B?S1VEcFNOblIxT25DY0ZHUzk1c2lCaFJWcVM2WnRDMWZhQm55TUJqaU01dDc5?=
 =?utf-8?B?b1MzT2RFc1FoSElyRWp2cklMTG9aMXJwRGRjZGFRa0FHYVhza29Yb0pPS0NJ?=
 =?utf-8?B?d0QwdGFxalE2QzVocDhudjdaL0t4ZTQzY1NDQ0ZvcmptRklnVEdCYS9OTTdK?=
 =?utf-8?B?UVlPek9aNkE0Rzc3d3M3MEVibTZZT1pTa3ZHRzYzeWlDcE8wTXhaLzZ3OXN5?=
 =?utf-8?B?N2E2OWUrck1WOXdsaWhKNWl1dS9pQTVQUktmTnllT2xDQ25rK2c4UVFnakw0?=
 =?utf-8?B?a0tHT2RDNm51OFl2eitrTENCZzNJM2pkMEY5dmxRWW9vdTdFM2phVjdSQTdQ?=
 =?utf-8?B?MjhCUFRLRmhLS1NuRlR0Ym5BeGFuR3RxWTNBVjEvRlBBUXhwTm55b0wrSWM0?=
 =?utf-8?B?Nk0xMGgwSzV5ZlFFcWVacTNUbjA4U2cwVU1kMFcyaHVBS1AvOW1pYldhVVJ1?=
 =?utf-8?B?d0dVT3J6UVZMaU5BT241aStkaGIzRWZmeXQxbVJTZ2hEdmNXZGQxVC9LMXpk?=
 =?utf-8?B?d0F2eDMxQW9wbXFTck9CeHJvWGVRRzdTQ1NGYVRTeTlIOFRSTXVvL0tvWTR6?=
 =?utf-8?B?bnFZY0FTM3R4bjM2VDlubXpiZGJwVXZEenZQbXlDeHRoYythdDVLbmRWNW04?=
 =?utf-8?B?UnRFRDFDRTJoL3l2SlUxSThTMjUwQUFEZFN3QklsSUNpZWhlZllwSUgwMzZq?=
 =?utf-8?B?S0tOVVQwbTI0VEl5dDZGbkNmRHpDZmEyYmdISlBPazRXc1A1Q2xBRENndFZi?=
 =?utf-8?B?MFFFZWIwektSYzgwVGZiMjNMQnVYbW5mUThjOGNleStES2ovbkdlZTBNTERE?=
 =?utf-8?B?SUlib0twRXd5VU13Vm5Ka3k2QXZVY3dMWTdKQ3pWdW9yQXZ0Um81K2FFdFFo?=
 =?utf-8?B?dlF0NHd6YndHUXl2dU12dUpmelI5N2VXenh4VlBDTGU5UHphdnEwZ3BaR1hK?=
 =?utf-8?B?VTRGWXJURHhLUSs1bWpkZ1ZHR0N2MW13cmdZa0VHT0hTbWFTRTdNdFpCSmNO?=
 =?utf-8?B?eGFiblVSWVNaNEFvWENFTnRxYStiZkdsVFAyQXFyd1RFTTZ5Z0szdlJLb2dB?=
 =?utf-8?B?SitXcE5JOVQ1TlBkcmQxWi90aGUybkJpNTNyMmFOc3c4bUtrOWJmZXc0NHNG?=
 =?utf-8?B?elRPbE9GZGZPZGc2RnhXOHFxVEJDYU5aWlZSeFRvQzdMdlB3ZWdFV2VPZTZG?=
 =?utf-8?B?YlYrcit5N3pWNFdMZjY1bFFJK0JwdklaeE5RZWY5MVRTNVc2OHlsNlc4QkJy?=
 =?utf-8?B?eWlQai9xRXlHdi9rQUg1OXRVdy9YcFkxZjdWSmI3RWV2Y2tpd3I1MEZSYUxL?=
 =?utf-8?B?anI3Y1FCSlg0YTZwd3JRNHluSCtqVUQ2bExzRXFVU0hSRmZsSE5FZDBJVUJ5?=
 =?utf-8?B?Z0RKRndhclRuSzExOTZvQmowNUpWQ3pZTU1rNW1oTm45KzBVMHJYVWpndVlN?=
 =?utf-8?B?VXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A30D4E14C1615844B367811C85669527@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 812c9b56-b1a6-4fb7-088b-08dd81b72684
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 16:02:58.1075 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RjYxqryg/ZjsaS0E/20P8AeLSqk6SfgqkT7AGfnWoCEd6G2agMw8exPsB62jPRGx2FvZzGpN2g3PhxxmJxsL3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8237
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

T24gVHVlLCAyMDI1LTA0LTIyIGF0IDA4OjQwIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBUaHUsIEFwciAxNywgMjAyNSBhdCAxMjoxOTo1NFBNIC0wNjAwLCBTb3V6YSwgSm9zZSB3
cm90ZToNCj4gPiBPbiBNb24sIDIwMjUtMDQtMDcgYXQgMTU6NDcgKzA1MzAsIEhpbWFsIFByYXNh
ZCBHaGltaXJheSB3cm90ZToNCj4gPiA+IFRoaXMgY29tbWl0IGludHJvZHVjZXMgYSBuZXcgbWFk
dmlzZSBpbnRlcmZhY2UgdG8gc3VwcG9ydA0KPiA+ID4gZHJpdmVyLXNwZWNpZmljIGlvY3RsIG9w
ZXJhdGlvbnMuIFRoZSBtYWR2aXNlIGludGVyZmFjZSBhbGxvd3MgZm9yIG1vcmUNCj4gPiA+IGVm
ZmljaWVudCBtZW1vcnkgbWFuYWdlbWVudCBieSBwcm92aWRpbmcgaGludHMgdG8gdGhlIGRyaXZl
ciBhYm91dCB0aGUNCj4gPiA+IGV4cGVjdGVkIG1lbW9yeSB1c2FnZSBhbmQgcHRlIHVwZGF0ZSBw
b2xpY3kgZm9yIGdwdXZtYS4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogSGltYWwgUHJh
c2FkIEdoaW1pcmF5IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0KPiA+ID4gLS0t
DQo+ID4gPiAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCB8IDk3ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKw0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5NyBpbnNlcnRp
b25zKCspDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2Ry
bS5oIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+ID4gaW5kZXggOWMwODczOGMzYjkx
Li5hYWY1MTVkZjNhODMgMTAwNjQ0DQo+ID4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2Ry
bS5oDQo+ID4gPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gPiBAQCAtODEs
NiArODEsNyBAQCBleHRlcm4gIkMiIHsNCj4gPiA+ICAgKiAgLSAmRFJNX0lPQ1RMX1hFX0VYRUMN
Cj4gPiA+ICAgKiAgLSAmRFJNX0lPQ1RMX1hFX1dBSVRfVVNFUl9GRU5DRQ0KPiA+ID4gICAqICAt
ICZEUk1fSU9DVExfWEVfT0JTRVJWQVRJT04NCj4gPiA+ICsgKiAgLSAmRFJNX0lPQ1RMX1hFX01B
RFZJU0UNCj4gPiA+ICAgKi8NCj4gPiA+ICANCj4gPiA+ICAvKg0KPiA+ID4gQEAgLTEwMiw2ICsx
MDMsNyBAQCBleHRlcm4gIkMiIHsNCj4gPiA+ICAjZGVmaW5lIERSTV9YRV9FWEVDCQkJMHgwOQ0K
PiA+ID4gICNkZWZpbmUgRFJNX1hFX1dBSVRfVVNFUl9GRU5DRQkJMHgwYQ0KPiA+ID4gICNkZWZp
bmUgRFJNX1hFX09CU0VSVkFUSU9OCQkweDBiDQo+ID4gPiArI2RlZmluZSBEUk1fWEVfTUFEVklT
RQkJCTB4MGMNCj4gPiA+ICANCj4gPiA+ICAvKiBNdXN0IGJlIGtlcHQgY29tcGFjdCAtLSBubyBo
b2xlcyAqLw0KPiA+ID4gIA0KPiA+ID4gQEAgLTExNyw2ICsxMTksNyBAQCBleHRlcm4gIkMiIHsN
Cj4gPiA+ICAjZGVmaW5lIERSTV9JT0NUTF9YRV9FWEVDCQkJRFJNX0lPVyhEUk1fQ09NTUFORF9C
QVNFICsgRFJNX1hFX0VYRUMsIHN0cnVjdCBkcm1feGVfZXhlYykNCj4gPiA+ICAjZGVmaW5lIERS
TV9JT0NUTF9YRV9XQUlUX1VTRVJfRkVOQ0UJCURSTV9JT1dSKERSTV9DT01NQU5EX0JBU0UgKyBE
Uk1fWEVfV0FJVF9VU0VSX0ZFTkNFLCBzdHJ1Y3QgZHJtX3hlX3dhaXRfdXNlcl9mZW5jZSkNCj4g
PiA+ICAjZGVmaW5lIERSTV9JT0NUTF9YRV9PQlNFUlZBVElPTgkJRFJNX0lPVyhEUk1fQ09NTUFO
RF9CQVNFICsgRFJNX1hFX09CU0VSVkFUSU9OLCBzdHJ1Y3QgZHJtX3hlX29ic2VydmF0aW9uX3Bh
cmFtKQ0KPiA+ID4gKyNkZWZpbmUgRFJNX0lPQ1RMX1hFX01BRFZJU0UJCQlEUk1fSU9XUihEUk1f
Q09NTUFORF9CQVNFICsgRFJNX1hFX01BRFZJU0UsIHN0cnVjdCBkcm1feGVfbWFkdmlzZSkNCj4g
PiA+ICANCj4gPiA+ICAvKioNCj4gPiA+ICAgKiBET0M6IFhlIElPQ1RMIEV4dGVuc2lvbnMNCj4g
PiA+IEBAIC0xOTY1LDYgKzE5NjgsMTAwIEBAIHN0cnVjdCBkcm1feGVfcXVlcnlfZXVfc3RhbGwg
ew0KPiA+ID4gIAlfX3U2NCBzYW1wbGluZ19yYXRlc1tdOw0KPiA+ID4gIH07DQo+ID4gPiAgDQo+
ID4gPiArc3RydWN0IGRybV94ZV9tYWR2aXNlX29wcyB7DQo+ID4gPiArCS8qKiBAc3RhcnQ6IHN0
YXJ0IG9mIHRoZSB2aXJ0dWFsIGFkZHJlc3MgcmFuZ2UgKi8NCj4gPiA+ICsJX191NjQgc3RhcnQ7
DQo+ID4gPiArDQo+ID4gPiArCS8qKiBAc2l6ZTogc2l6ZSBvZiB0aGUgdmlydHVhbCBhZGRyZXNz
IHJhbmdlICovDQo+ID4gPiArCV9fdTY0IHJhbmdlOw0KPiA+ID4gKw0KPiA+ID4gKyNkZWZpbmUg
RFJNX1hFX1ZNQV9BVFRSX1BSRUZFUlJFRF9MT0MJMA0KPiA+ID4gKyNkZWZpbmUgRFJNX1hFX1ZN
QV9BVFRSX0FUT01JQwkJMQ0KPiA+ID4gKyNkZWZpbmUgRFJNX1hFX1ZNQV9BVFRSX1BBVAkJMg0K
PiA+IA0KPiA+IEluIG15IG9waW5pb24gd2Ugc2hvdWxkIGRyb3AgRFJNX1hFX1ZNQV9BVFRSX1BB
VCBhcyB3ZSBjYW4gYWxyZWFkeSBjaGFuZ2UgdGhlIFBBVCBpbmRleCBieSB1bmJpbmRpbmcgYW5k
IGJpbmRpbmcgdGhlIFZNIHdpdGggdGhlIHdhbnRlZCBQQVQgaW5kZXguDQo+ID4gU2ltaWxhciBm
b3IgRFJNX1hFX1ZNQV9BVFRSX0FUT01JQyBhbmQgRFJNX1hFX1ZNQV9BVFRSX1BSRUZFUlJFRF9M
T0MsIHdlIGNvdWxkIGhhdmUgdGhvc2UgcHJvcGVydGllcyBpbiB2bSBiaW5kIHVBUEkgYW5kIGlm
IG5lZWRlZCB0byBjaGFuZ2Ugd2UgY291bGQNCj4gPiB1bmJpbmQgYW5kIGJpbmQgdGhlIFZNQSB3
aXRoIHRoZSB1cGRhdGVkIGF0dHJpYnV0ZXMuDQo+ID4gDQo+IA0KPiBJIGhhZCB0aG91Z2h0IGFi
b3V0IG1ha2luZyBtYWR2aXNlIHBhdGNoIG9mIFZNIGJpbmQgdG9vLiBJIHRoaW5rIGl0DQo+IGNv
dWxkIHdvcmsgYnV0IEkgZG8gdGhpbmsgaXQgZnVydGhlciBjb21wbGljYXRlIGFuIGFscmVhZHkg
aGlnaGx5DQo+IGNvbXBsaWNhdGVkIFZNIGJpbmQgS01EIHBhdGguIEFsc28gdGhlIGlkZWEgd2l0
aCBtYWR2aXNlLCBpcyBpdCBkb2Vzbid0DQo+IGFjdHVhbGx5IHVwZGF0ZSB0aGUgR1BVIHBhZ2Ug
dGFibGVzIHJhdGhlciBqdXN0IHRoZSBLTUQgVk0vVk1BDQo+IGJvb2trZWVwaW5nLiBNeSBwcmVm
ZW5jZSBoZXJlIHdvdWxkIHRvIGJlIGtlZXAgdGhpcyBzZXBlcmF0ZS4NCg0KTG9va3MgbGlrZSBv
ZiB0aG9zZSAzMiBwYWdlcyAyNWlzaCBhcmUganVzdCByZWZhY3RvcnMgdG8gYWxsb3cgbWFkdmlz
ZSBzdXBwb3J0IHNldCB0aGVzZSBhdHRyaWJ1dGVzLCBtYXliZSBpZiB0aG9zZSB3ZXJlIHN1cHBv
cnRlZCBpbiBWTSBiaW5kIHVBUEkgaXQNCndvdWxkIHRha2UgbGVzcyBjaGFuZ2VzLi4uDQoNCj4g
DQo+IEFsbCBvZiB0aGUgYWJvdmUgYXR0cmlidXRlIGFyZSByZWFsbHkgb25seSBpbnRlbmRlZCB0
byBiZSBzZXQgYnkNCj4gZmF1bHRpbmcgVk0gd2hpY2ggTWVzYSBkb2Vzbid0IHVzZS4NCg0KV2Ug
aGF2ZSBwbGFucyB0byBkcm9wIHNjcmF0Y2ggZmxhZyBmcm9tIFZNIGluIFhlMisgcGxhdGZvcm1z
IHRvIHN1cHBvcnQgYSBWdWxrYW4gZXh0ZW5zaW9uIGJ1dCB0aGF0IHdpbGwgdGFrZSBzb21lIHRp
bWUuLi4NCg0KPiANCj4gPiA+ICsjZGVmaW5lIERSTV9YRV9WTUFfQVRUUl9QVVJHRUFCTEVfU1RB
VEUJMw0KPiA+IA0KPiA+IE1lc2EgY2FuIG1ha2UgdXNlIG9mIERSTV9YRV9WTUFfQVRUUl9QVVJH
RUFCTEVfU1RBVEUgYnV0IG5vdCB0aGUgb3RoZXIgb25lcywgc28geW91IHdpbGwgbmVlZCBvdGhl
ciBVTURzIHRvIGxhbmQgdGhvc2UuDQo+ID4gDQo+IA0KPiBJIGNvdWxkIHNlZSBNZXNhIHVzaW5n
IHRoaXMgb25lLCBidXQgYWdhaW4gdGhpcyBqdXN0IGZsaXBzIGEgYml0IGluIEtNRA0KPiBpbnRl
cm5hbCBzdGF0ZSAtIGl0IGRvZXMgdG91Y2ggR1BVIHBhZ2UgdGFibGVzIHNvIHdvdWxkIGJlIGdv
b2Z5IHRvDQo+IGltcGxlbWVudCB0aGlzIGluIGEgdmVyeSBjb21wbGV4IFZNIGJpbmQgSU9DVEwu
DQoNClRoaXMgb25lIEkgYWxzbyBkb24ndCB0aGluayBpdCBiZWxvbmdzIHRvIFZNIGJpbmQgdUFQ
SSBidXQgSSBkaWQgbm90IGtuZXcgaXQgcmVxdWlyZWQgYSBmYXVsdCBWTSwgd2UgcGxhbiB0byBy
ZW1vdmUgdGhlIHNjcmF0Y2ggZmxhZyBmcm9tIFZ1bGthbg0KZHJpdmVyIGJ1dCB0aGUgdXNhZ2Ug
b2YgdGhpcyBhdHRyaWJ1dGUgd291bGQgYmUgaW4gdGhlIE9wZW5HTCBkcml2ZXIsIHNvIEkgZG9u
J3QgdGhpbmsgd2UgY2FuIG1ha2UgdXNlIG9mIGl0IHRoZW4uDQoNCj4gDQo+IE1hdHQNCj4gDQo+
ID4gPiArCS8qKiBAdHlwZTogdHlwZSBvZiBhdHRyaWJ1dGUgKi8NCj4gPiA+ICsJX191MzIgdHlw
ZTsNCj4gPiA+ICsNCj4gPiA+ICsJLyoqIEBwYWQ6IE1CWiAqLw0KPiA+ID4gKwlfX3UzMiBwYWQ7
DQo+ID4gPiArDQo+ID4gPiArCXVuaW9uIHsNCj4gPiA+ICsJCXN0cnVjdCB7DQo+ID4gPiArI2Rl
ZmluZSBEUk1fWEVfVk1BX0FUT01JQ19VTkRFRklORUQJMA0KPiA+ID4gKyNkZWZpbmUgRFJNX1hF
X1ZNQV9BVE9NSUNfREVWSUNFCTENCj4gPiA+ICsjZGVmaW5lIERSTV9YRV9WTUFfQVRPTUlDX0dM
T0JBTAkyDQo+ID4gPiArI2RlZmluZSBEUk1fWEVfVk1BX0FUT01JQ19DUFUJCTMNCj4gPiA+ICsJ
CS8qKiBAdmFsOiB2YWx1ZSBvZiBhdG9taWMgb3BlcmF0aW9uKi8NCj4gPiA+ICsJCQlfX3UzMiB2
YWw7DQo+ID4gPiArDQo+ID4gPiArCQkvKiogQHJlc2VydmVkOiBSZXNlcnZlZCAqLw0KPiA+ID4g
KwkJCV9fdTMyIHJlc2VydmVkOw0KPiA+ID4gKwkJfSBhdG9taWM7DQo+ID4gPiArDQo+ID4gPiAr
CQlzdHJ1Y3Qgew0KPiA+ID4gKyNkZWZpbmUgRFJNX1hFX1ZNQV9QVVJHRUFCTEVfU1RBVEVfV0lM
TE5FRUQJMA0KPiA+ID4gKyNkZWZpbmUgRFJNX1hFX1ZNQV9QVVJHRUFCTEVfU1RBVEVfRE9OVE5F
RUQJMQ0KPiA+ID4gKyNkZWZpbmUgRFJNX1hFX1ZNQV9QVVJHRUFCTEVfU1RBVEVfUFVSR0VECTIN
Cj4gPiA+ICsJCS8qKiBAdmFsOiB2YWx1ZSBmb3IgRFJNX1hFX1ZNQV9BVFRSX1BVUkdFQUJMRV9T
VEFURSAqLw0KPiA+ID4gKwkJCV9fdTMyIHZhbDsNCj4gPiA+ICsNCj4gPiA+ICsJCS8qKiBAcmVz
ZXJ2ZWQ6IFJlc2VydmVkICovDQo+ID4gPiArCQkJX191MzIgcmVzZXJ2ZWQ7DQo+ID4gPiArCQl9
IHB1cmdlX3N0YXRlX3ZhbDsNCj4gPiA+ICsNCj4gPiA+ICsJCXN0cnVjdCB7DQo+ID4gPiArCQkJ
LyoqIEBwYXRfaW5kZXggKi8NCj4gPiA+ICsJCQlfX3UzMiB2YWw7DQo+ID4gPiArDQo+ID4gPiAr
CQkJLyoqIEByZXNlcnZlZDogUmVzZXJ2ZWQgKi8NCj4gPiA+ICsJCQlfX3UzMiByZXNlcnZlZDsN
Cj4gPiA+ICsJCX0gcGF0X2luZGV4Ow0KPiA+ID4gKw0KPiA+ID4gKwkJLyoqIEBwcmVmZXJyZWRf
bWVtX2xvYzogcHJlZmVycmVkIG1lbW9yeSBsb2NhdGlvbiAqLw0KPiA+ID4gKwkJc3RydWN0IHsN
Cj4gPiA+ICsJCQlfX3UzMiBkZXZtZW1fZmQ7DQo+ID4gPiArDQo+ID4gPiArI2RlZmluZSBNSUdS
QVRFX0FMTF9QQUdFUyAwDQo+ID4gPiArI2RlZmluZSBNSUdSQVRFX09OTFlfU1lTVEVNX1BBR0VT
IDENCj4gPiA+ICsJCQlfX3UzMiBtaWdyYXRpb25fcG9saWN5Ow0KPiA+ID4gKwkJfSBwcmVmZXJy
ZWRfbWVtX2xvYzsNCj4gPiA+ICsJfTsNCj4gPiA+ICsNCj4gPiA+ICsJLyoqIEByZXNlcnZlZDog
UmVzZXJ2ZWQgKi8NCj4gPiA+ICsJX191NjQgcmVzZXJ2ZWRbMl07DQo+ID4gPiArfTsNCj4gPiA+
ICsNCj4gPiA+ICsvKioNCj4gPiA+ICsgKiBzdHJ1Y3QgZHJtX3hlX21hZHZpc2UgLSBJbnB1dCBv
ZiAmRFJNX0lPQ1RMX1hFX01BRFZJU0UNCj4gPiA+ICsgKg0KPiA+ID4gKyAqIFNldCBtZW1vcnkg
YXR0cmlidXRlcyB0byBhIHZpcnR1YWwgYWRkcmVzcyByYW5nZQ0KPiA+ID4gKyAqLw0KPiA+ID4g
K3N0cnVjdCBkcm1feGVfbWFkdmlzZSB7DQo+ID4gPiArCS8qKiBAZXh0ZW5zaW9uczogUG9pbnRl
ciB0byB0aGUgZmlyc3QgZXh0ZW5zaW9uIHN0cnVjdCwgaWYgYW55ICovDQo+ID4gPiArCV9fdTY0
IGV4dGVuc2lvbnM7DQo+ID4gPiArDQo+ID4gPiArCS8qKiBAdm1faWQ6IHZtX2lkIG9mIHRoZSB2
aXJ0dWFsIHJhbmdlICovDQo+ID4gPiArCV9fdTMyIHZtX2lkOw0KPiA+ID4gKw0KPiA+ID4gKwkv
KiogQG51bV9vcHM6IG51bWJlciBvZiBtYWR2aXNlcyBpbiBpb2N0bCAqLw0KPiA+ID4gKwlfX3Uz
MiBudW1fb3BzOw0KPiA+ID4gKw0KPiA+ID4gKwl1bmlvbiB7DQo+ID4gPiArCQkvKiogQG9wczog
dXNlZCBpZiBudW1fb3BzID09IDEgKi8NCj4gPiA+ICsJCXN0cnVjdCBkcm1feGVfbWFkdmlzZV9v
cHMgb3BzOw0KPiA+ID4gKw0KPiA+ID4gKwkJLyoqDQo+ID4gPiArCQkgKiBAdmVjdG9yX29mX29w
czogdXNlcnB0ciB0byBhcnJheSBvZiBzdHJ1Y3QNCj4gPiA+ICsJCSAqIGRybV94ZV92bV9tYWR2
aXNlX29wIGlmIG51bV9vcHMgPiAxDQo+ID4gPiArCQkgKi8NCj4gPiA+ICsJCV9fdTY0IHZlY3Rv
cl9vZl9vcHM7DQo+ID4gPiArCX07DQo+ID4gPiArDQo+ID4gPiArCS8qKiBAcmVzZXJ2ZWQ6IFJl
c2VydmVkICovDQo+ID4gPiArCV9fdTY0IHJlc2VydmVkWzJdOw0KPiA+ID4gKw0KPiA+ID4gK307
DQo+ID4gPiArDQo+ID4gPiAgI2lmIGRlZmluZWQoX19jcGx1c3BsdXMpDQo+ID4gPiAgfQ0KPiA+
ID4gICNlbmRpZg0K
