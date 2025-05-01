Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DCBC369DC
	for <intel-xe@archiver.kernel.org>; Thu,  1 May 2025 20:31:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F8310E119;
	Thu,  1 May 2025 20:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nL7mMZdu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD4A10E119
 for <intel-xe@lists.freedesktop.org>; Thu,  1 May 2025 20:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746131487; x=1777667487;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Zq/n3Rs0tz6sBn7cjHao9qllOs1hHf3jl2PWu2lxBRU=;
 b=nL7mMZduaH4WXPT+ld9BoxFlCldjqFuogEjR7GCM2rveddAB8C6hnmWj
 tFmcHskOQyvXYuyoJ2QM1ayHMoEzudEusDKIVBWWcBEkJUOVdZtACgRYM
 ru6j3j3GU/HsRPiWYZu3G4OksYeZvTJ/WAU6eFczh00AjrLK2ZxFdAeB5
 nDC6IveFpt0w1rncpmYxavikNkfd331jSEeumyqzy2yWR/Lom/RRbUThE
 bYDYHOXgNfugAKjak/y225AiMO4EjG13PuUXakhsV3K9qh4rZjaDVhiGy
 nExEKx+OLx3qRPqmHLfzE+UR87/Rog/J0MIACuiJ04R5L+lG/w5loZhq/ w==;
X-CSE-ConnectionGUID: BvFZKHWRQTKRdQnw9GY48A==
X-CSE-MsgGUID: onf/gFadT0KeapKVGK2oow==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="51476166"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="51476166"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 13:31:26 -0700
X-CSE-ConnectionGUID: ggICweCwQmu1VzCwEzbRZg==
X-CSE-MsgGUID: ioQm/u6ZQ7K7qLPcDFBNqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="135429868"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 13:31:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 13:31:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 13:31:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 13:31:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjfZDw05vW/Qbk6cvtEIx3oYdbiasJBfAj1oNfggDILkRwaqGyvGBhUfs6PE1df3M5pb0WbFtcjmZD+ebIlqi9mOE8q2l1h4PNHrH53n0H7Mtwz64uo6yX7YN7WLifVIUo1utv3pzZtlgGKMpIQ7FY5QC3/xWdG54/RqNDGc6zxKTu8ZYocIDJF6g/CRTIG9C0e73R2EB9yCzgGmteMaQBDZaUQy0KNhFZ9IpJ62zpEwNrEGITIeCwYHAUM5SPwENT3jcZ3/RNQVqVvo5Z1iP2cd7y+ESBKxGbnDCyvdvryk6tu1R9M5s5UG2YZl60oDmkHFllZOn7MBjX05hRnPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zq/n3Rs0tz6sBn7cjHao9qllOs1hHf3jl2PWu2lxBRU=;
 b=rymObd0YSbWlwrZffAlkerUTcyOCXMHY0CQY/9ApUKNV8B4l5OzcXTsn5q2XYqhfRku/3NmGOHPR+iM+dovz+GQZOIW1jv2erCGIYVJPtasFGOceKtxtL3rUdJAI7GhDtWeP2Y+vv1+KBqp6mwTL+zEZt5W+L91n4gSGjUbUiB0qxO9y4huRlmQN+hlJPdo/SW7E7Fcza3HoDRMVO4v7JTbEURTMUYmY2hqkX0RK13DXpciPIFItr12ecVzjXKf2LuDjj41dJhOOgHqaFs2aR0WW58ffS9cwzkbPRWqef5pUjP166O2OnEWiRUopUWhFxsyAZP2QODwVbMi83I0KpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MW4PR11MB7054.namprd11.prod.outlook.com (2603:10b6:303:219::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Thu, 1 May
 2025 20:31:07 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%6]) with mapi id 15.20.8699.022; Thu, 1 May 2025
 20:31:07 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Fix page fault queue calculation
Thread-Topic: [PATCH] drm/xe: Fix page fault queue calculation
Thread-Index: AQHbusdpWUpc17J6PkKszvtHIeFBB7O+LpYAgAALx4A=
Date: Thu, 1 May 2025 20:31:07 +0000
Message-ID: <f0be4d059694db692b344a9318ac589e543bac0f.camel@intel.com>
References: <20250501183220.72097-1-stuart.summers@intel.com>
 <aBPQKJ1mjYBKRfNh@lstrano-desk.jf.intel.com>
In-Reply-To: <aBPQKJ1mjYBKRfNh@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MW4PR11MB7054:EE_
x-ms-office365-filtering-correlation-id: 31fe6e14-6144-4b58-a392-08dd88ef1a03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RUpSMmpmdXcwVEY5MzczMHBDYTFLU2VBZVhwQU5GK3FuNkNqTTB6VmlzSnVH?=
 =?utf-8?B?OVhmZzhPMlhKWlRUV3pZQkF1MVpDSGtEc1VmQ0ZnQk16ZVkyRkNFNmFWbHR5?=
 =?utf-8?B?MXF3K1FFVzBjNkcvR2ErQUdRMXYwUDdWQVpzNm11Q3lnV0M4c2Zib2svT3Z6?=
 =?utf-8?B?bGJLZkxXUzdtVzJwSGhaNHlPVVdGNWFpaGJNeGYvbW0wN2hpLzJIcUsvczhK?=
 =?utf-8?B?TkFFdll5WDE5QVBjU2R0TU15RDdJbUdHdDdrdWtLTm1EbmZvY3oyWlU0VUNI?=
 =?utf-8?B?azQvK3ZWaFhURTFOOE1jenEvNDBSTFJwR3BlOUxod29CVm9NVG5rN0hYV2Vq?=
 =?utf-8?B?bTZCZjBTWlcxRXk0MHMzSmh0UVc4ZEFjenF0SjNWVVcyaDhNVEt4TDk3NTNT?=
 =?utf-8?B?UGxYaW14YTBiSHVTN3I2T2I4dk85UUsvTGxuaEppSTBjL09UdUdaMUtiVFBL?=
 =?utf-8?B?Vm9zM0RzbStFZXMraG1BU0lOR0ZBS01JeXBockdxb0lDS2Zhb0MzVlVWVVFr?=
 =?utf-8?B?YUs4Ui9IM1l5TmhobUY2bVR0UVZib1VEVDFiOHdscVppSFd0WlBIb2xyNm80?=
 =?utf-8?B?Rmh2ZURlYk5uc0dZSFJ2Y3VaYjlicDIrb0tOd1hEcGttSGpsWi9zUnF0ZGhS?=
 =?utf-8?B?TDRxalV3c3JXZHp6eTYxRUVJa3ZwdlA5cEhudzN5cWJYaFFXZUF5SjRKQktp?=
 =?utf-8?B?aVJsOCtjV1BWWHFkNThiRS9oSEdJY0QwVnB3T3pHc1VEWjcxU0M0QjdPZHJB?=
 =?utf-8?B?cUhweWVHOXNweW42STJTSkFCU0J6Z3pib0VHSngxdHcxU1NBZmcrVkVIbnBF?=
 =?utf-8?B?dWtHNFA4RE1XMW1jU1pxdkhaVjVWYnU4ZzB1MXhOVldBRHNIaVo2T1NFZGtC?=
 =?utf-8?B?V04rRzZ2N1c5OGx6dmRMaHJhSHZaTGVaejA3Mm5DcDRFUi9LYXNCWUFZbTRt?=
 =?utf-8?B?NUdpTlE5M3g1Tm9OUEV1Z0FJUS9tdXZHeS9qb2U3R1psU1lQU3JtUUJidXVF?=
 =?utf-8?B?aExNR2NiL0cyV3dwMmxqTDRaZVF5S2NZV25EdlBEMXhlSXc0YldrL2FqVTNP?=
 =?utf-8?B?TjFOMG1ZTGhla3QwZHZLTEQ4Q2xMbWVYVlVGT0VlajM1Y29VVHIxVExBUmI4?=
 =?utf-8?B?QUFZOCtHU2EzNXFDbEMzcU82djJXZGlVdDZpTEU4a1pXOHhRYXl2a1ZzUkZF?=
 =?utf-8?B?WlBRNFQ0TlJ6ZjBDdkxjUUFQTnpxMG9mSlQyZ1ZKZ0FhZW55UEVYWHNSTHds?=
 =?utf-8?B?OUFmSS9hb1RpL2J1aFdVSUxyQ3AzZTdDeDJSY3NtZDVJVkJjWEtYMmUvQ2xa?=
 =?utf-8?B?aDFxbE9QM3lodHRmZ3UxZ1NONVU4dmpldkZ1Rko3MWh0c0hCeWk0MVFIcTF4?=
 =?utf-8?B?NEFqQnlkOUxjVjJiMFc4ZjdOSHAvNFRvS2d5NmZvVUtQRTBEK3Bzd3hWcVNK?=
 =?utf-8?B?VDdUNDVLa0NRMzJzN05EZU8vaHUyN2FkTU9YUEllaUtVYU1hTUU5WnJBTktn?=
 =?utf-8?B?QWhHOUYxejI3NkxLNFlYRSt5UXFaRmFTSm4vUllRVVpsR2FlRC8zZXpzd0pw?=
 =?utf-8?B?QXRrazBjaWwzWDJCd2N0L041RnJOd2pvYzVpQ0YvbWhDTCttOFdJcTdKd0Fu?=
 =?utf-8?B?THlSbHQyMVFrTGtNNDVCQ3B1dTlpcmxQU1lncFZnRWhuckM3TTFHV2p2bkR0?=
 =?utf-8?B?Vi9mWFFUWlNKUnluYkhhbkFvYzlmanQ0ZzJTV2xTL2loY004WWRXMU1JUmlw?=
 =?utf-8?B?a1JCWUh3MitGODFTekVmUXVLYTJaNTRsc3puWmtLY0lHQytKVWFJU3VZT2JU?=
 =?utf-8?B?bmRMOWlmQ2RubFBFVko4dW55dnJFTDNoZlFsVnhGSjJNaW0zR3QxaGNTa21o?=
 =?utf-8?B?dTdwQ1dMVGFIcXREV3g3M1N3RHErbmMzUWlUTWlOemJlYTNKZUpjVWpWSmVo?=
 =?utf-8?B?bDFNSDlrUHdvekJ6YTlHRnZzRFVnNWtvS1pDMHVORDFhU3krek55QzZZbGtV?=
 =?utf-8?B?QkV5aWQ0RUN3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTgxU3E5eHl5bUdPM016akZFRVJYUHdtbnJPMmlxV2ZRM2JWRjNJQ2g2Tkww?=
 =?utf-8?B?eUd0RFI4dy8wN2FOZjNhRm9ZSzA2dDd6WDhaRWdLRWJsd05hQzhFNTJBaTdB?=
 =?utf-8?B?RkhSRUljUkxGeHpLOEpNenVNVHRmalpianhvWjc4SkJrQ2U1blpiY2hJbTNI?=
 =?utf-8?B?aFZyQnVLcFpKT2xoT0pLWk5BS20yUW1WNStreDAxa284Z1UvTW1HRFA4M29C?=
 =?utf-8?B?clZxNjlLMUt3dmxRZnBRaGRpKytDNkc4aWo1Ty9rN3czbjZqWmRRWUVtMEc3?=
 =?utf-8?B?MlVJVGpucFF1Tlp0cksyRDYvd1NTSXdNZGpQTjZrYy9qdkwrNkdWQWwwQUxY?=
 =?utf-8?B?S3FxRUt2N0o5bUN2ZHhEYWNGTVh1azFEQWF6eWF1aEEvL1U3aWoxUGhoeUpy?=
 =?utf-8?B?UUc3WlB6ZElHeWR2L3Zoa0lHakNZYjIxUHFRUXg1eFlWT295Q0dPZ3I3L0tj?=
 =?utf-8?B?R3pNRU9BcklCK0crdFBrbHJBYjRqazRNNGZCMWdZWDNVWkVjTmZZWTJ3R3Uw?=
 =?utf-8?B?Y1FHSEZKWGgvVzF5dDJ6Zk1EZE5mQ1hKRkxUeEtkZUhTOGYxSDBDUC90OUpK?=
 =?utf-8?B?Nno1LzYvTmc0bDV5T0lUeWdzTENaZmJJY3U2MWZQcStxL3I1WndxQ0lmSEE2?=
 =?utf-8?B?MWVhTFJ2M1Q5NlVLSGFEUDVEbHVqc3JzWnlQak80cmhYVkRnb3o1bjgrdmMw?=
 =?utf-8?B?cGV0ek9ZOXpyMm1aWGxHbnVRc01yT2JzODJSSGpVUGlMNmI3eTliUDl5b2hm?=
 =?utf-8?B?d3FwZmZnaEE1ellFYVI4RVEzQzltVUVUeGIvamFyaVhrbENDbktaUUhKUXgx?=
 =?utf-8?B?RUJJNjJZdUlFcGlpdnBZWVl2ZTY0Q0wxTG9pUDY4Q1hlNDFHRlQ4ZUZrQUxs?=
 =?utf-8?B?T1ZnK2NSSy9kWWtqM2pncjFEL1J2S2FXS0lieUVReDhqNHVGaTRGblBSOWdH?=
 =?utf-8?B?ZThGUkwrVmpKeGl6Z3QyOVZEejJaWjMvcGxoalJvK3p6S0pwVDlSRklNdXlu?=
 =?utf-8?B?cjdqNVI3UnhwdmY5VGNuQVZuUUdhUDd6NTdrdHRKRytVb09FSWZ2RFR0VWZK?=
 =?utf-8?B?czZLY0xLckU4ZmIwd05MT01kVDJYb00zSjJYNDBEMW5iNTBINnk3bEh4YXh3?=
 =?utf-8?B?aURWb3dHN2x6R3RRTlRqQ3dxVnk1cVdXemlNMC8vR1VYenUzTFN2N1Zabi9J?=
 =?utf-8?B?YmRGMWZpTm5aNFhXQmZHdHh0aEJ1Z1o3K1ZGZUQrQTI3T1R4YnFoTnRDUFhw?=
 =?utf-8?B?YTlNVmVhckRWQWJjRC8zSTh3YnhQR1FaTjJ0QVZvL3FTOEkrSUFGaURoanM2?=
 =?utf-8?B?UnoyT3VmSjBNOEZ5MlU0eXVuMTVXQksvSWNSbkpZNEtYU3djVFFLa3VnMGZi?=
 =?utf-8?B?b3A2VEZGSm9UQ3REcS8xaDFRTmhCd1NLbHVybmRnQi85b3NrbitoZmVGMFlK?=
 =?utf-8?B?V1JramYyTXpJTTZabnpQR1E2aGVmbUFIelN0SlNaNThQMTZqNHlnU05paEh0?=
 =?utf-8?B?TTJ4RVVRWFFseVFtNmMyRkYydnJTWlZVZlZvZDBCY281bjRBYVJtV3NsWVdB?=
 =?utf-8?B?d0grYzRLeXo5YXNkQUtlNVFubkxjNi9iQ2pMMi8wSlVPa1ZxRHREWnA3L2Q2?=
 =?utf-8?B?ekVSUlB3bCtvVkoxY25teEZFQzhXY1BoY0tXZERpanRkNjRUV1RPd0VRUWFH?=
 =?utf-8?B?NS9hcjZ4RlBwaG9zYlBHS3R6c0xFME11WXBOUXNEMk93RURNUUs0bG1DTG9u?=
 =?utf-8?B?L0lkM2N4K0hZTEl3RjVuaGFnWVJJSDhFVzY3UzdJdEQxT0tWRDhkYnBoN2Q4?=
 =?utf-8?B?V29VYTdtRTNmSXV6TFBXZ1ZpNmlxeTRpMld6WTN2Y2FEZzZFTDIwNWQ3TkFU?=
 =?utf-8?B?NFYyRUtHYXFvTjZkSzRXZHBib3BJY3g3bmY2WHk2Znl5aHlZVHVMWHAvWnZ2?=
 =?utf-8?B?bGtNK01pellQeWZDcEQ3anQ4M3lISlB3bGtZeHhsQWI1b0NTQzRkMjlSYmY0?=
 =?utf-8?B?c0dvakxWdCtQbzQ3L3FPRmpaRWRPdUZWSjN2Sko5d0FvR3hQclRqQTArR3pi?=
 =?utf-8?B?ZkNNYWNReDRSUzc5OTlNdmRINEFFWFMwNFdQYTQ1c01ScnhrNDhDNi9sY2xS?=
 =?utf-8?B?c1o4dVJ0OW82bUNoNmZzSm4rakt5SUpqQ2F3WWdtRFViY0Z0NVlmZ3Z5Q0NB?=
 =?utf-8?B?RkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A71019E2A0B4EC41A0C5E46F71B01781@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31fe6e14-6144-4b58-a392-08dd88ef1a03
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2025 20:31:07.1334 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wgy9Ogr+uqMp6juJh6W+AG4Fy8GRNyHTOck/NgzZW9zeoTgfNYoUgg1Yzu1eAR3TjSyQuNzFKR2SWfCaMmdajC8Re40YyIVJTRJLmwW4IdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7054
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

T24gVGh1LCAyMDI1LTA1LTAxIGF0IDEyOjQ4IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBUaHUsIE1heSAwMSwgMjAyNSBhdCAwNjozMjoyMFBNICswMDAwLCBTdHVhcnQgU3VtbWVy
cyB3cm90ZToNCj4gPiBXZSBmb2xsb3dlZCB1cCB3aXRoIHRoZSBkZXNpZ24gYXJjaGl0ZWN0cyB0
byBoYXZlIGEgbW9yZQ0KPiA+IHByZWNpc2UgY2FsY3VsYXRpb24gZm9yIGEgdGhlb3JldGljYWwg
bWF4aW11bSBudW1iZXIgb2YNCj4gPiBwYWdlIGZhdWx0cyB3ZSBtaWdodCBleHBlY3QgYmFzZWQg
b24gdGhlIG51bWJlciBvZiBUTEJzDQo+ID4gYXZhaWxhYmxlIGluIHRoZSBzeXN0ZW0uIEZpeCB0
aGUgb3JpZ2luYWwgY2FsY3VsYXRpb24gd2hpY2gNCj4gPiBkaWQgbm90IHRha2UgdGhlIG51bWJl
ciBvZiBUTEJzIGludG8gY29uc2lkZXJhdGlvbi4NCj4gPiANCj4gDQo+IEl0IHdvdWxkIGJlIGhl
bHBmdWwgaWYgd2UgY291bGQgZ2V0IHRoaXMgaW5mb3JtYXRpb24gaW50byB0aGUgYnNwZWMuDQo+
IA0KPiBBbnl3YXlzLCB0aGFua3MgZm9yIGZvbGxvd2luZyB1cCBoZXJlOg0KPiBSZXZpZXdlZC1i
eTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQoNClRoYW5rcyBmb3Ig
dGhlIHJldmlldyBNYXR0ISBJJ2xsIHNlZSB3aGF0IEkgY2FuIGRvIGFib3V0IGdldHRpbmcgdGhp
cw0KaW50byBic3BlYy4uLg0KDQotU3R1YXJ0DQoNCj4gDQo+ID4gRml4ZXM6IDI5NTgyZTBlYTc1
YyAoImRybS94ZTogQWRkIHBhZ2UgcXVldWUgbXVsdGlwbGllciIpDQo+ID4gRml4ZXM6IDMzMzhl
NGY5MGMxNCAoImRybS94ZTogVXNlIHRvcG9sb2d5IHRvIGRldGVybWluZSBwYWdlIGZhdWx0DQo+
ID4gcXVldWUgc2l6ZSIpDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogU3R1YXJ0IFN1bW1lcnMg
PHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndF9wYWdlZmF1bHQuYyB8IDE3ICsrKysrKysrKysrLS0tLS0tDQo+ID4gwqAxIGZp
bGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVsdC5jDQo+ID4gYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFnZWZhdWx0LmMNCj4gPiBpbmRleCAxMDYyMmNhNDcx
YTIuLjgwYTgxNmMzODM3YiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3RfcGFnZWZhdWx0LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFnZWZh
dWx0LmMNCj4gPiBAQCAtNDM2LDE1ICs0MzYsMjAgQEAgc3RhdGljIGludCB4ZV9hbGxvY19wZl9x
dWV1ZShzdHJ1Y3QgeGVfZ3QNCj4gPiAqZ3QsIHN0cnVjdCBwZl9xdWV1ZSAqcGZfcXVldWUpDQo+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoFhFX01BWF9FVV9GVVNFX0JJVFMpICogbnVtX2RzczsNCj4gPiDCoA0KPiA+IMKg
wqDCoMKgwqDCoMKgwqAvKg0KPiA+IC3CoMKgwqDCoMKgwqDCoCAqIHVzZXIgY2FuIGlzc3VlIHNl
cGFyYXRlIHBhZ2UgZmF1bHRzIHBlciBFVSBhbmQgcGVyIENTDQo+ID4gK8KgwqDCoMKgwqDCoMKg
ICogRWFjaCBUTEIgY2FuIHJlcG9ydCB1cCB0byAzMiBmYXVsdHMuIFRoZSBudW1iZXIgb2YgVExC
cw0KPiA+IGlzDQo+ID4gK8KgwqDCoMKgwqDCoMKgICogZXF1YWwgdG8gdGhlIG51bWJlciBvZiBy
ZW5kZXIvY29tcHV0ZS9tZWRpYSBlbmdpbmVzIHBsdXMNCj4gPiB0d2ljZQ0KPiA+ICvCoMKgwqDC
oMKgwqDCoCAqIHRoZSBudW1iZXIgb2YgY29weSBlbmdpbmVzIHBsdXMgdGhlIG51bWJlciBvZiBF
VXMuDQo+ID4gwqDCoMKgwqDCoMKgwqDCoCAqDQo+ID4gLcKgwqDCoMKgwqDCoMKgICogWFhYOiBN
dWx0aXBsaWVyIHJlcXVpcmVkIGFzIGNvbXB1dGUgVU1EIGFyZSBnZXR0aW5nIFBGDQo+ID4gcXVl
dWUgZXJyb3JzDQo+ID4gLcKgwqDCoMKgwqDCoMKgICogd2l0aG91dCBpdC4gRm9sbG93IG9uIHdo
eSB0aGlzIG11bHRpcGxpZXIgaXMgcmVxdWlyZWQuDQo+ID4gK8KgwqDCoMKgwqDCoMKgICogUmVz
ZXJ2ZSBlbm91Z2ggc3BhY2UgaGVyZSB0byBlbnN1cmUgd2UgYXJlIGFibGUgdG8gY292ZXINCj4g
PiB0aGF0DQo+ID4gK8KgwqDCoMKgwqDCoMKgICogdGhlb3JldGljYWwgbWF4aW11bS4NCj4gPiDC
oMKgwqDCoMKgwqDCoMKgICovDQo+ID4gLSNkZWZpbmUgUEZfTVVMVElQTElFUsKgwqA4DQo+ID4g
KyNkZWZpbmUgTUFYX0ZBVUxUU19QRVJfVExCwqDCoMKgwqDCoDMyDQo+ID4gwqDCoMKgwqDCoMKg
wqDCoHBmX3F1ZXVlLT5udW1fZHcgPQ0KPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAobnVtX2V1cyArIFhFX05VTV9IV19FTkdJTkVTKSAqIFBGX01TR19MRU5fRFcgKg0KPiA+IFBG
X01VTFRJUExJRVI7DQo+ID4gLSN1bmRlZiBQRl9NVUxUSVBMSUVSDQo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoFBGX01TR19MRU5fRFcgKiBNQVhfRkFVTFRTX1BFUl9UTEIgKg0K
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAobnVtX2V1cyArDQo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBod2VpZ2h0NjQoZ3QtPmluZm8uZW5naW5lX21hc2sp
ICsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGh3ZWlnaHQzMih4ZV9od19l
bmdpbmVfbWFza19wZXJfY2xhc3MoZ3QsDQo+ID4gWEVfRU5HSU5FX0NMQVNTX0NPUFkpKSk7DQo+
ID4gKyN1bmRlZiBNQVhfRkFVTFRTX1BFUl9UTEINCj4gPiDCoA0KPiA+IMKgwqDCoMKgwqDCoMKg
wqBwZl9xdWV1ZS0+Z3QgPSBndDsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgcGZfcXVldWUtPmRhdGEg
PSBkZXZtX2tjYWxsb2MoeGUtPmRybS5kZXYsIHBmX3F1ZXVlLQ0KPiA+ID5udW1fZHcsDQo+ID4g
LS0gDQo+ID4gMi4zNC4xDQo+ID4gDQoNCg==
