Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67327C52D6F
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 19:07:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B6D10E3DC;
	Tue,  6 Aug 2024 19:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U2eEbr6Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC4610E3DC
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 19:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722971223; x=1754507223;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g/7lXQJYXKSOcTTCddf2PI14+q+qR9wxmc7V4d3ONYI=;
 b=U2eEbr6QMvM60+8CDx/vWuKEUDZ5vqsYScMeFvYnnXd24Zf7zZkJ2pSe
 UTzqNcfYKbVUv4EYljkpweoQBbSi7GqRNPk+zxFkMSvUQ4vpYnkDguo7X
 Q8DfTs4ztDrM6DAyfjj6u9D8KDmTuXQlx+lTHXH9O3SqWRd7qUXWQzSEm
 3ogso8l5h3SQ/pC9GgLQfZHHrUHAAXJaGGEPPbx4z+XbHN7aNxQr/vbQk
 9ETxxFy5c6vrYi8N5QKEDCvVpqIg4Ew1Az7cI6e4635nVeIgXvP4YT/RC
 R/HwlusvF8KuD3SMmRHcrjZtsxzSqxk5oiPJkJaq9pOv1WbXsZ7qRkrwd A==;
X-CSE-ConnectionGUID: dkE8uFVAQx2TI+ogV1upag==
X-CSE-MsgGUID: rKvVyxzQSMWvnMNKt1cMFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="38465611"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="38465611"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 12:07:01 -0700
X-CSE-ConnectionGUID: Qbf3Agu1Sc+q5QopAX1J1w==
X-CSE-MsgGUID: fj7EPhTYTWCW0MS5Kz0Xww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="56310224"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Aug 2024 12:07:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 12:06:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 6 Aug 2024 12:06:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 12:07:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ie9aTw46WIEMcHSCfCRrr0/swpsg7cKdys2oTB0iiEFbPDs7lUxpgd/g6sS15i3mgmd8ALCJZsIz+b+279v6TrLuSYTFipuURgF/Nrdw0wHgCdg1bRJBeIEnYXDRLRotYkmz3CWMZBsj4OrCt4fJ8xSlhgk8QModu5Uokql+mraMnqtIMYdQuq4bzsMzWQxSjn9JTiTym/S+x01o6b9gSmSaBhiBxpLon0/dfegOaR2qNqhSBXxYQkCDaV6zeOK2yTf+vb7SXc9AokZJw689xwiyAscpnv4JBaqHAfeVwFB0bVpXdqA+DHM/ndLOW4UViPThhJxMYiMJhCCn5GWVew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/7lXQJYXKSOcTTCddf2PI14+q+qR9wxmc7V4d3ONYI=;
 b=RsQ/WBXwDkgvWidJQpZRn0NxpNevOHTDOx4qggnaU73r8ZProTLtSuvaprAj6JJY2RYO9HSca6xKWxZz0b/+rAcy0f5idOyQctSondJaRWRRGbSfr+vf71dZEDw2SxhYWpPM8HYNuvqbW8Ylk1qtUYo3jbRj9FMImCY/7XCl6QSvEcB+KKt0e3YrpakDgCi8bnMiHZ/PyWYwZlS7e0tDdaaeS3uul9fPsrVdHyFFWc4+kfwWGg7ayuqEf3KIdD9MFWugyrZzoK6t0J3fQcmazPYf8NEYuKkinBvEzUxRXPKOL1qiK/P+sWftfaQoi3Dhs7lfFk1JQvh7HVMxt/ruWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH8PR11MB8016.namprd11.prod.outlook.com (2603:10b6:510:250::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Tue, 6 Aug
 2024 19:06:56 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 19:06:56 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Piorkowski, Piotr"
 <piotr.piorkowski@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/pf: Fix VF config validation on multi-GT platforms
Thread-Topic: [PATCH] drm/xe/pf: Fix VF config validation on multi-GT platforms
Thread-Index: AQHa6CtMSQszT4TlLk2BegeGo1QWxLIajR+Q
Date: Tue, 6 Aug 2024 19:06:56 +0000
Message-ID: <CH0PR11MB5444D43F49E815158EA5B1C3E5BF2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240806180516.618-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240806180516.618-1-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH8PR11MB8016:EE_
x-ms-office365-filtering-correlation-id: 4f672de0-73f0-42ef-5726-08dcb64af0ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OVhkNVd2TVd1d3B0Ky9NUDBDM3JPTmxuN2NBZXg5cmdyRTlCTXhuL1h2M2RQ?=
 =?utf-8?B?RVdiN0RSNTFTTCtPakxZU0RsOStud04rK2ppak1iNldIL2Nickg1K3lIUC82?=
 =?utf-8?B?cVgybjNOMDlUdWswNm9ibkpGOTNTU3ZsT0hyS2tIWkNxTEhKZlJITjhWcWxU?=
 =?utf-8?B?akhLRWtzRDJLQXRnT2t2ckJPb0tKSkdyVnpoRm1PTmZUUTZodjgvd1kxNjdk?=
 =?utf-8?B?ZUdqWGtnK3l5THlkM0Q1N0wzdy8vS3dSSTdRbmlKS0JGRkZUUUluY1ViSkJo?=
 =?utf-8?B?TDgreGdGZWY2bGU2bzFNa1JtYThtWUV2c1FUemlWMjRTYnNaSUVsOVNITjlM?=
 =?utf-8?B?U01TSThBL3pETXFSMGwzbDNSbUR4bHRPZUJWaW5yQS92MnZtOVlEKzFkdDZC?=
 =?utf-8?B?cVFlcWNiQ2pEcHNDZmZFcUlNeXpjM0dHSHZrWldEQUYxLzZlRktTVXVmQkVo?=
 =?utf-8?B?Q1ZyOTN6T3JhbWJKQzkxR3Y0K0JMMGpQa0ljRGtkYkw4Z3ZtalZ4Q2huNlU0?=
 =?utf-8?B?L1luQVNWajZEcnczM2NESmV3NHMyZXNPRFRpWnBRcHgyS1YvWTRaaFYwUWxJ?=
 =?utf-8?B?cHJwaWtVRXNMeXZVZmo4ZllXbUc5ekdkTUpNM00rSTZFWFZUY1dPeEtVVXRO?=
 =?utf-8?B?R3Jwc2xCelhvaW1KdG9zYWpITlIrTk1ZTlllMmt1Q2dTWDBuUkxwalpMMXlG?=
 =?utf-8?B?elRGNk12TytjdEUrZXZlODF2RVNyVndwa0pIdVkySXQxcGsvcCtObGdVaFU4?=
 =?utf-8?B?ZmVXSHBVbE95aVlRdnE3ZXhHK3NiUVVLeUxCbW83eGpuK2JsazZWRmQrUHBo?=
 =?utf-8?B?Z0xDVGViOHIzTlNCeE90YmI0cEk1QmlOMUJZOWd6QXJZMms3Q3JSNUI4cFVP?=
 =?utf-8?B?Tk5uWkRiUVhvTHlDUTlJUldsTDRscDczMGtQV1ZFaGdpUWN2NE51M3REYnhY?=
 =?utf-8?B?UWRUTmRpNWhaLzh1akpnWWllR2ZZWWpjeWxqZlQvV2FlRnNHdFU5UXpCdlZX?=
 =?utf-8?B?UlB6NG9nMkREMTN6dU9WbUsrQXh3MytndmFZR3MzNzNLMGJ5bU1RN3gzNkND?=
 =?utf-8?B?cXhxNE9rdjJPanB0VVcvRk9OR0VpNVhGUnJzZHJaWHNyQ0lTU0IxenpzVHA1?=
 =?utf-8?B?WTE5citPQk14Zjd1Y3JlR0t2bDYxOUtSVDJ1cVJwbjM1WDJPZVMyWCswaUY0?=
 =?utf-8?B?NFd0clNzZDJqQk91b3RRVTF2S1pWSFV2d1RRQWFmZWZrdEtTQ1VzcE0rWC9a?=
 =?utf-8?B?aXJEaGxVdjNsZWYvM25pMTd1ZDI5aVgrYUhYaTIwUStDbUprSm1tZmNGV2kw?=
 =?utf-8?B?YzlnWGp2L3M3VnRnS01kUUpSaXNTVWdBV2o3azNGSyswZ0ZPcUplUzNXdGRZ?=
 =?utf-8?B?WmFweGN1Vm1QK25qNjNCdlRuVzVyQTh3eXF3WXhZdVB2RHJ4dFdNOXh4MWxq?=
 =?utf-8?B?cG9UVXZpckhoSjRqODEycW1Pb08zNnZLRU5IeGZoUU9mYjlGYTBOSnBEaTF1?=
 =?utf-8?B?cjhNdGEvd2oxblNEYk5iOEljSWdhRVc0UHBtbzUxN3R4RG5EM3RQUGVZL1Zv?=
 =?utf-8?B?TS9TOG1nQkxYakFoMEU1TDJiL0JTY3dhODU0NEtQdUZPeTl5dnI4VW9uTEdm?=
 =?utf-8?B?NnpOV3J4elpzTnhST3dkU01KSlpud1BWMGwvY0gwaTB4UC9UV0E3UzdSVHA0?=
 =?utf-8?B?SVJzemdwblNjVlU0eFcvV3k1bFhhdmFROHhCcnVoUVlES0V6VFYyRlRxa09D?=
 =?utf-8?B?UUdLWGxEd0wzYXFSakQwZzArejBQaVoxVkNxRjhTQVhRQ3o0ekZTblJoZ1pK?=
 =?utf-8?B?ajVJc3JZVUlEbWJiZHM0QTV6T1J3d2R5clhScjBvZXBlc2RWSmlDNzlrS2Iw?=
 =?utf-8?B?REhLaCthSDFSNXNhdTlYWjdtRHllVG4wZEFqNUM0cHhibmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHMzQ1dxck1henU4R29lWThwemptb0ZQQnM5ME4yTjBkbjA4T0VFdHA2WFJk?=
 =?utf-8?B?M2NCQTV5Mi81Q0hCU0RCNnlTZkx1WTdHY1ZiR3JOL2cxV3dFQXVKN2QyeGta?=
 =?utf-8?B?V3NxRXFIdWVsd1QyWG5YU3ZsdHdnMUZCUzE0Sy9tT29YUG1qUXQyL21KZXFa?=
 =?utf-8?B?eWJoZzZ3UGxBSDBVSHBqWFJ1RGFBREhjaTJKWUQzZnc3UWFvajRFZlVpaFFj?=
 =?utf-8?B?U1pTN25UOHZNTVVCTmJnWFRVWHZpOSticVZ3eWFwNWNTWC9OY290SXhsWlBP?=
 =?utf-8?B?bjNra3ZheDlCWHFuRWFVWGVFWnJtcGZ5VENtVUZseHRDdC9Ud2NpRTF1TUl3?=
 =?utf-8?B?V2xISXJSSm92bkNuYzBNcVBvV0doVHExWjlwK0UrL0ZtVm9NN29KVU0xLzdp?=
 =?utf-8?B?WXRSbTA5M2FjUDVnTDdxdy9sOEd5cUdCNWZIM2FJdTUvd0tZbm1LTUFmM2NU?=
 =?utf-8?B?WXlsaWZjQTB0R2tUckJ2TGdNdlNZcTQvTDF6cDBSN1EyMW1kMmx1QkY1WDFm?=
 =?utf-8?B?dE1oTTd4dTlxWGx5ZGZBTXBSaVNiV2N3dU1LV0xVRTZYVGVhb2ZrMTBxaElP?=
 =?utf-8?B?eVNyZkFUaWRSb0EwTFNPb2F2YmNEa3p1NU5ua0tJTThySStGdU85cmJqTGVr?=
 =?utf-8?B?c0pYOUllRUVQQndPL1pTdm16R0hBWjhvZExETi9VSzZCUGsrWTdyQVVYTE5R?=
 =?utf-8?B?eFRaTUxVOHVjWkF2QU9pak1Sc1Q5VVp1cFAvcnJzZDRuMlRoZHRaUjFESXdw?=
 =?utf-8?B?QTlobTBRVGVyYXpnYkp2Z0NoTmtWb1FLdmh2MmQ1Q080WUtNeVl0MTJtcVV4?=
 =?utf-8?B?WFBKQjRKa0NWRmtSTzNTVU5paW5hMzdjeHJyVDhOYVpsZ09QeHdmZXAyOEJi?=
 =?utf-8?B?OVNFUHdQSEo1d3QvdVZZMHIzTmFCSGpIWFdQYzh4MUhSM2c2d2p1enJGcG04?=
 =?utf-8?B?MXd3QjVTWUVHb0VUN2FlQlc4SEV2UFhMeVBrS2xQSGtteUpvVHVQSHg5eE9n?=
 =?utf-8?B?SVpSUi95VTlwK2Z6WVJ2VDBuM21mTGpCL0xiSG1lQzBXN3FqMGVaR05rKzFw?=
 =?utf-8?B?WUdMbzg0eWFhMEdZNFBpSUdBcDZiM2JGM0lRUjZjeEZNMXU1NXN4OWNnSktE?=
 =?utf-8?B?UXhlczF1eHIvb3dVMGtCUmJnTTBQZVdGSW81ZFlIRjhybHp1ZGhGaTBhWmYr?=
 =?utf-8?B?M0c4QzA2T0xiWm9UTi8zbzc2b010dXZOL0J2N01IQkpqbVR5bEliL3BKVjRl?=
 =?utf-8?B?VEVSQ3lXRTJ2cWZneFUzZFRyUUxEajFJd2JybXBNR21sWE1VcGNybGdZYStH?=
 =?utf-8?B?YWpRNUkwVGg4SmdEcUJPRjUycTB0ZFQyY0lwUE80NUlXNE0wcWk5VHo4bUR6?=
 =?utf-8?B?bWVKYktLeVA2V0gyYk5TQVgycnNWeG44NWJQN0J3dWlXN0tzYk15ZGxsTWhn?=
 =?utf-8?B?aHExUkc4Wk44L2dTNGl4V3o2ei9YZWpZSDlqaVRLRStmaXg5NEdKbXNuVGRn?=
 =?utf-8?B?Mjhvd0J0RjluZ1J3VSszM1ovdVNBU3lMQndYVVNkODdEUmZvTXVkci9PREhK?=
 =?utf-8?B?U1VMb1NlZjRVeE9xd1BuZndla05TSXd2RituNlRJQVVvRzZDNkRJMmY1Qk5H?=
 =?utf-8?B?bVN6aHpmMzVKU1hvS3dsQVViamNWbEczRXRESEJnY0tTRXNOcUg0dHR5R2Nu?=
 =?utf-8?B?Zks2MTFINHBqUTI1ZDllTmVaRnBsY1VpT2tBNmdMRzdhSmt6bW0vME1XTnY1?=
 =?utf-8?B?UXVaMW50Q25qOEF2bnFueXFja09jV01pU084dUlMQXB4dzhucHdDYVNsSjRP?=
 =?utf-8?B?RTBhdy9yVmFOUkJnZGVxSmdYNG5zT3dERmJ2SUk5WE5odkl0TDVTQ2lJUjg3?=
 =?utf-8?B?dlh4VCtzcGtOVUdrYU55OXRPY0F5anZFc0VRV3JEbGdHZ2tLSk1GeUwyNWhZ?=
 =?utf-8?B?bnI5cmlMeHNxS2J4OFJ5bGxveS82MHF0Yk9EUHFMSjcvZ081V1ZWbEZyakF5?=
 =?utf-8?B?T1hha1ZwelRORHNkWUo2VkxFNGFKNWlnaXNqTlZxZUFFYUNDOVdjbFNQQndG?=
 =?utf-8?B?azVEcFhkWXRGcnlQczYyak5kRUUyb3J2MmhMTktoZW12eGhQMHJ2R1NwQlFV?=
 =?utf-8?Q?pTdYLkAogoOdZovnHl33X9tMj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f672de0-73f0-42ef-5726-08dcb64af0ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 19:06:56.3237 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aHoT4yF3sV/q94ATAiNNsZDtDBuf3AaEtfWUd24uaMn5f0PDkdeN+UZrDCzxHn8afTxRGhIu8Q1ux6Rv2mwI8MVlRZ28Z5eCjdU7H/QgUaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8016
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEludGVsLXhlIDxpbnRlbC14ZS1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIE1pY2hhbCBXYWpkZWN6a28N
ClNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCA2LCAyMDI0IDExOjA1IEFNDQpUbzogaW50ZWwteGVAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogV2FqZGVjemtvLCBNaWNoYWwgPE1pY2hhbC5XYWpkZWN6
a29AaW50ZWwuY29tPjsgUGlvcmtvd3NraSwgUGlvdHIgPHBpb3RyLnBpb3Jrb3dza2lAaW50ZWwu
Y29tPg0KU3ViamVjdDogW1BBVENIXSBkcm0veGUvcGY6IEZpeCBWRiBjb25maWcgdmFsaWRhdGlv
biBvbiBtdWx0aS1HVCBwbGF0Zm9ybXMNCj4gDQo+IFdoZW4gdmFsaWRhdGluZyBWRiBjb25maWcg
b24gdGhlIG1lZGlhIEdULCB3ZSBtYXkgd3JvbmdseSByZXBvcnQNCj4gdGhhdCBWRiBpcyBhbHJl
YWR5IHBhcnRpYWxseSBjb25maWd1cmVkIG9uIGl0LCBhcyB3ZSBjb25zaWRlciBHR1RUDQo+IGFu
ZCBMTUVNIHByb3Zpc2lvbmluZyBkb25lIG9uIHRoZSBwcmltYXJ5IEdUIChzaW5jZSBib3RoIEdH
VFQgYW5kDQo+IExNRU0gYXJlIHRpbGUtbGV2ZWwgcmVzb3VyY2VzLCBub3QgYSBHVC1sZXZlbCku
DQo+IA0KPiBUaGlzIHdpbGwgY2F1c2Ugc2tpcHBpbmcgYSBWRiBhdXRvLXByb3Zpc2lvbmluZyBv
biB0aGUgbWVkaWEtR1QgYW5kDQo+IGluIHJlc3VsdCB3aWxsIGJsb2NrIGEgVkYgZnJvbSBzdWNj
ZXNzZnVsbHkgaW5pdGlhbGl6ZSB0aGF0IEdULg0KPiANCj4gRml4IHRoYXQgYnkgY29uc2lkZXJp
bmcgR0dUVCBhbmQgTE1FTSBjb25maWd1cmF0aW9ucyBvbmx5IHdoZW4NCj4gY2hlY2tpbmcgaWYg
YSBWRiBwcm92aXNpb25pbmcgaXMgY29tcGxldGUsIGFuZCBvbWl0IEdHVFQgYW5kIExNRU0NCj4g
d2hlbiByZXBvcnRpbmcgZW1wdHkvcGFydGlhbCBwcm92aXNpb25pbmcuDQo+IA0KPiBGaXhlczog
MjM0NjcwY2VhOWEyICgiZHJtL3hlL3BmOiBTa2lwIGZhaXIgVkZzIHByb3Zpc2lvbmluZyBpZiBh
bHJlYWR5IHByb3Zpc2lvbmVkIikNCj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdhamRlY3prbyA8
bWljaGFsLndhamRlY3prb0BpbnRlbC5jb20+DQo+IENjOiBQaW90ciBQacOzcmtvd3NraSA8cGlv
dHIucGlvcmtvd3NraUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d0X3NyaW92X3BmX2NvbmZpZy5jIHwgMTEgKysrKysrKystLS0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d0X3NyaW92X3BmX2NvbmZpZy5jIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d0X3NyaW92X3BmX2NvbmZpZy5jDQo+IGluZGV4IDUyYzcyNzdkMjQzZC4uMjI3NTI3
Nzg1YWZkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3Jpb3ZfcGZf
Y29uZmlnLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3NyaW92X3BmX2NvbmZp
Zy5jDQo+IEBAIC0xOTI4LDYgKzE5MjgsNyBAQCBzdGF0aWMgaW50IHBmX3ZhbGlkYXRlX3ZmX2Nv
bmZpZyhzdHJ1Y3QgeGVfZ3QgKmd0LCB1bnNpZ25lZCBpbnQgdmZpZCkNCj4gIHsNCj4gIAlzdHJ1
Y3QgeGVfZ3QgKnByaW1hcnlfZ3QgPSBndF90b190aWxlKGd0KS0+cHJpbWFyeV9ndDsNCj4gIAlz
dHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGd0X3RvX3hlKGd0KTsNCj4gKwlib29sIGlzX3ByaW1hcnkg
PSAheGVfZ3RfaXNfbWVkaWFfdHlwZShndCk7DQo+ICAJYm9vbCB2YWxpZF9nZ3R0LCB2YWxpZF9j
dHhzLCB2YWxpZF9kYnM7DQo+ICAJYm9vbCB2YWxpZF9hbnksIHZhbGlkX2FsbDsNCj4gIA0KPiBA
QCAtMTkzNiwxMyArMTkzNywxNyBAQCBzdGF0aWMgaW50IHBmX3ZhbGlkYXRlX3ZmX2NvbmZpZyhz
dHJ1Y3QgeGVfZ3QgKmd0LCB1bnNpZ25lZCBpbnQgdmZpZCkNCj4gIAl2YWxpZF9kYnMgPSBwZl9n
ZXRfdmZfY29uZmlnX2RicyhndCwgdmZpZCk7DQo+ICANCj4gIAkvKiBub3RlIHRoYXQgR3VDIGRv
b3JiZWxscyBhcmUgb3B0aW9uYWwgKi8NCj4gLQl2YWxpZF9hbnkgPSB2YWxpZF9nZ3R0IHx8IHZh
bGlkX2N0eHMgfHwgdmFsaWRfZGJzOw0KPiAtCXZhbGlkX2FsbCA9IHZhbGlkX2dndHQgJiYgdmFs
aWRfY3R4czsNCj4gKwl2YWxpZF9hbnkgPSB2YWxpZF9jdHhzIHx8IHZhbGlkX2RiczsNCj4gKwl2
YWxpZF9hbGwgPSB2YWxpZF9jdHhzOw0KPiArDQo+ICsJLyogYW5kIEdHVFQvTE1FTSBpcyBjb25m
aWd1cmVkIG9uIHByaW1hcnkgR1Qgb25seSAqLw0KPiArCXZhbGlkX2FsbCA9IHZhbGlkX2FsbCAm
JiB2YWxpZF9nZ3R0Ow0KPiArCXZhbGlkX2FueSA9IHZhbGlkX2FueSB8fCAodmFsaWRfZ2d0dCAm
JiBpc19wcmltYXJ5KTsNCg0KSSBjYW4gc2VlIHdoeSB5b3Ugd291bGQgd2FudCB0byBrZWVwIHRo
ZSBnZ3R0IGNvbmZpZ3VyYXRpb24gc2VwYXJhdGUgZnJvbQ0KdGhlIHJlc3Qgb2YgdGhlIGNvbmZp
ZywgdGhvdWdoIGl0IG1pZ2h0IGJlIGNsZWFuZXIgdG8ganVzdCBrZWVwIGl0IGFsbCBjb2xsZWN0
ZWQNCnRvZ2V0aGVyIGxpa2UgaXQgd2FzIGJlZm9yZS4gIE5vdCBibG9ja2luZyBvbiB0aGlzLCB0
aG91Z2g6DQpSZXZpZXdlZC1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50
ZWwuY29tPg0KLUpvbmF0aGFuIENhdml0dA0KDQo+ICANCj4gIAlpZiAoSVNfREdGWCh4ZSkpIHsN
Cj4gIAkJYm9vbCB2YWxpZF9sbWVtID0gcGZfZ2V0X3ZmX2NvbmZpZ19nZ3R0KHByaW1hcnlfZ3Qs
IHZmaWQpOw0KPiAgDQo+IC0JCXZhbGlkX2FueSA9IHZhbGlkX2FueSB8fCB2YWxpZF9sbWVtOw0K
PiArCQl2YWxpZF9hbnkgPSB2YWxpZF9hbnkgfHwgKHZhbGlkX2xtZW0gJiYgaXNfcHJpbWFyeSk7
DQo+ICAJCXZhbGlkX2FsbCA9IHZhbGlkX2FsbCAmJiB2YWxpZF9sbWVtOw0KPiAgCX0NCj4gIA0K
PiAtLSANCj4gMi40My4wDQo+IA0KPiANCg==
