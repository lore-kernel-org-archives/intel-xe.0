Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5FDE81A24
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 14:17:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8393910E12B;
	Mon, 16 Feb 2026 14:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X0vCSxGP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192F610E12B
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 14:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771251449; x=1802787449;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=zn7V5eHK3fCSsP6zyllP9MJPC9h8CWTNjYDFCj+U6B4=;
 b=X0vCSxGPadh1YlrQMXKFpaF+2Si0xOujXlMv/RCogJis3leQui1+/Ovy
 HZde1hdD2shbM6D+jxyRfe4Cp51aS7vEVYFo0Bi7yeSw5nOVF0xj3TLn3
 J0ituExNhY3XdqVwwHOSU+CduMTK/G7RPLZWulx10YUXQpH9bI/blzNYK
 qiMzAv32vhFtn0LVJ3LCDkY16jAW8JixknbynU/DK8EBcpQtEaFu3peuf
 5KCA6nj3/f8QoeIeboQ3OwRYLbP59cdnRgBo9FuSmDL0MbuRdRS9zTh1C
 x7LTGL9fhA3d2esY3bTheOMU8jN32MNQ+JFKXBRRu9+jLoyTPyxJTJjNR w==;
X-CSE-ConnectionGUID: 67+/9lxJTeiNvgonTJXNrA==
X-CSE-MsgGUID: zdMeDer2TX+dO4XJoNdrsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="94962505"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="94962505"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 06:17:29 -0800
X-CSE-ConnectionGUID: 1PeZHdZgR1CVmTbmDbFIBA==
X-CSE-MsgGUID: pZ+o05jCQEWbNj7QiorPNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="212718441"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 06:17:29 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 06:17:28 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 06:17:28 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.35) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 06:17:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNRqLcUKx5Lh97T3AiuVdk0yV/Es1o8TT4laGvOq5Dz1HTQ80SuxNegNbinwRg7UAIIcMKOfRLoOTJqaPJkPdnc3fGNoll/IhMoNDrOoHubusm6saSRsUisSp9IZa/kCyfqRiMRjW+IiuAJ2i6vNo2BZVtuWRH66vIJCCtiu6A15qfsscokYqBWU9VtMmfTX8y1TBz/g5ZErBdCuqRKtkKcCYC0dLgyjb+PuWzIIZs68OWU1GkSV2j4Y0gWDFuj/yLLpXDU2pAaQWKcga834+f8Fwo73qabq0oMRFrIVb6/v+o/n63Z+tQXM2TIkCbaN1r8XdJa3obH3JyhB4X4liQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zn7V5eHK3fCSsP6zyllP9MJPC9h8CWTNjYDFCj+U6B4=;
 b=gl5TKr26x0LFSoejnKZwBMfkdJuobjq6yPZg9dLfeI6cN/onNYKYANjX3/RzvO4kTOg1cY9ZWPnt+oMA5dFMv+XbSclg24lntVvuPjtjgf414E5iAlBlA15uhFxuDnXGXmhEqjPNTbDV11G3X4hodygSzSKgvRJa0w66GWINDiR9BGVyfZp5UdqlrWh++aFxUh5bE2c4njBNHcc20J+F3K9Ukvm3IYrRZqjqObg2Ha/K9DJfjO9ZGtt+NoQABY1mVSIAvlxUB9iElMVEymhQYW/2QPtx6uOYQMXuVit8vpnshGuFrPEQOlZG6pPg0v+Ndv6bY/JohgTtVYx/FKu2bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 SA3PR11MB9487.namprd11.prod.outlook.com (2603:10b6:806:47e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 14:17:26 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f%3]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 14:17:26 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kumar
 G, Naresh" <naresh.kumar.g@intel.com>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 0/1] drm/xe: Set GT rp min frequency as 1.2GHz default for
 BMG/CRI
Thread-Topic: [PATCH 0/1] drm/xe: Set GT rp min frequency as 1.2GHz default
 for BMG/CRI
Thread-Index: AQHcn0wyvygcDRHvk0KatfuHN4t7dLWFX1gA
Date: Mon, 16 Feb 2026 14:17:25 +0000
Message-ID: <a842f2e9d2abbf571e96835f4578b74ac6562f1a.camel@intel.com>
References: <20260216135107.3148167-3-naresh.kumar.g@intel.com>
In-Reply-To: <20260216135107.3148167-3-naresh.kumar.g@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.2 (3.58.2-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|SA3PR11MB9487:EE_
x-ms-office365-filtering-correlation-id: e1d3074b-d13b-4041-4ae9-08de6d661c2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?aG1QZGVsSkdHOUxCME5KVWQwWjAyTFlwNDBsa1k2WmEyRDIzYWErNDhlRDhZ?=
 =?utf-8?B?VkRLc3J3YXFHajFaZjJWSzdrazVUSDhGV0RuVXRmRUdLcmxPU01iLytzSEhZ?=
 =?utf-8?B?aU16aUY3UjlSeVBZT2IrMU1hNUNMYXpRNXF5SzhnL2FNeG45cUF0QlgwV0xY?=
 =?utf-8?B?LzNmcFUvN0wxSmtoTmFNR2d3QkwyekZ5SzZzQzZoeUxZdHF1YUlUeFVHSVJk?=
 =?utf-8?B?TGF4b2xycGU3VjFTK2xFayttM2NBMkg4cklOa3hwNFRWa1FhbDF3Z0dWZGhu?=
 =?utf-8?B?RFV3Q0VYV3Jaa1hyQ0lTUlRDQ3M2T0U3UmNNN01mMGlRdWQ4YStuWW5uYXgy?=
 =?utf-8?B?Wi9wTG9kaTRUMDlxdnRTNVZ4UUJqZ3lUYmUrUGpWUlphOEhaek0wL3RCVTVl?=
 =?utf-8?B?WWgzYVhjYXVEZmUzMmhMbFhsejE1MlNEWDVmQTdwL0tkOHFTRnJDQnJ0c3lL?=
 =?utf-8?B?UWd5czBsa2t5UHcwMEQvM0xBSHZTSThGUFpFUDVGc1NJMmhlNlZSdlEzMmxI?=
 =?utf-8?B?QWdFR3czSktCeis4TUsxZ1VqLzVUWnFWV2w4QldacGRITS9tR1o4Q2c4Wng1?=
 =?utf-8?B?N0ltSWlSNm0vUFAyQWtxUUkrbDFBWWZuQ1FGYVF4YUVuQ1ZYcU1FdkxscVVY?=
 =?utf-8?B?R3VhU1ZNZ1N0VEZhY0Y4Yk4wcml1OVcxZWN5MGE5WGRlRXFadEo1eUtML3Zo?=
 =?utf-8?B?ZHIxengrZWdYWWFTQ0ovb0V3Y2g1Sy85dFlDTTNZVG5EWmo1QW5BUjE4cDFC?=
 =?utf-8?B?YXVyamVTaWtaYmY3b1hqZWdSc3YzTE41dElVVDJjRHhYVXRQdTlNdzB0R3JL?=
 =?utf-8?B?SzhZKzlXTXZVcGl5K3BDdFdxd0V2RlJiRHVUV3Rha0lYSSsvaExJZTVBbTdr?=
 =?utf-8?B?VE93RGNzUUNMRUxaU3JxU094VWVjSUx1aUVOMUtLb2grdkM0cEdhcmx3UUlL?=
 =?utf-8?B?MWEwSFB3SnFqM1NEOXN3a0w5Vmx6SUl2S0MrYlI2czV0UEJNbUpaSThjOU5l?=
 =?utf-8?B?bjJtMGNiR1ZDWUJJSE5YZ0dCMDkzVklCc2ZRNUNSeVRUbHpwSjRYQUZNaHVx?=
 =?utf-8?B?L0dvZE85T29jV0dVSnRoYW55RXMvbmRsZklzMUg3TmVpaGtENmtJQ2UyNmdI?=
 =?utf-8?B?SnI4YzQvaHpSQUJ5TW9OM2NjRUVuVzRPRkZLWmd0bUU5dkFYSkxpTzdFbmF2?=
 =?utf-8?B?RnRiOFEyTVE3d2NydndGc3c2M1RqektEQXNvamNwQ0dURVdWMHBpS3E3cWZU?=
 =?utf-8?B?ZEhxTnk5VDZhYWl1aytBSU5QelgwMDYva1VsSWErK2Z4MDdyVll4R213K0FX?=
 =?utf-8?B?RlhQaTNRZnlITXk3YTh2Z09tS3JKVm9kSVR6R3BHa1VOS3hYenlOK0dUbUNC?=
 =?utf-8?B?NW43OWRZdzRwb2lMM2VVOGlZYTUyakxJakNTQXhTTlhWN0czekJqNUJxWjlu?=
 =?utf-8?B?anBCWEV4MTNuSW9UK0ZtamJsVFNHR2dVdEtBdjFuTlNQWnFYRWVQdFFFb0VC?=
 =?utf-8?B?SktQK1c2ZDRXRGtUS0tSR0dGblFkV3drVC8rN3ljakRGZTM5RVVyNVllZmFj?=
 =?utf-8?B?MTlNZ25tYlEvRGF5WGdHRUx1ZjN4SlI0OUQ3QmhvYitqajJmd2xGOEN6OUxk?=
 =?utf-8?B?aW5XZncyb3N0SDFqcnlyai9oZEl2WDVqa29CeWdhenFFRTFobFV6b2gwNTlm?=
 =?utf-8?B?ZmE0NmV4TE1yeHhSZWtOUnR3WVlBQlVmODJreXBmbWJVRUhyOWlzdVpRTVI1?=
 =?utf-8?B?ZkpDLzN1QXRnZTJhUDF0cllZZ0p4MTVQdXIwMm9USXlwbFZNUkM1V3dva0w1?=
 =?utf-8?B?azdXQS9kazNCWTJyRnhqSDhXSU56K3dRazBmREVQT0s2cHNIQmdxc2N6eFRz?=
 =?utf-8?B?RU0zYWU5eTV5S1BzZUFQczJwSnQ2ZzBwM2ZHSm5iSGc5VGE4K3FMSk05RWhI?=
 =?utf-8?B?eldDVEIrQ3NSdjVzc3RDTzgzbzcrNDhuWUhtdjZ3REZ6RllacmMySkx0TjZN?=
 =?utf-8?B?bG4wRWJZZHcvbmg5L24wcFVDUGZscnh0NEZpbkZUTEsrOVhDZG5kU2RmaGV2?=
 =?utf-8?B?T0F2ZVBPSEZaTTJsWEtGdDkrY1ZOWU1acG1pUVppRCtla20wSStTUmkreEJ4?=
 =?utf-8?B?c2tjaUZRQWlmVmdHK21ZWFNKNUZhMDM1c2VDQWxyenA2MllFN1NwYVhydW00?=
 =?utf-8?Q?4Lc+YEZ0oqj84T+2ytqm6N8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YzltMlhremZIMmJNYnhrWnBVYzVQSW1xemxtQk1oN0dZK0FzZlhTNzBuU0Fa?=
 =?utf-8?B?RDJxQkNrcUZQNFhianFCT1MrblN6UFhiRENVOWZDeWxzU1g0QnA3R2pJSTJ1?=
 =?utf-8?B?eUFaWHZFem9yRjg1L0EvMTlaMXZ1VFo1bHpqWHVqZTFaanA0d1JXdUx0endj?=
 =?utf-8?B?blVLY0xGWG9wbHF0NDI5U1k1Qk94VWp3Q2wvQzk0cW1DS2FaQjNlcVBsTDE0?=
 =?utf-8?B?YlBiM3BxVVFHQkYvTGtsZC81cGF6MG1ZWmQ0Yi93cWxNZ3g0RVJCWGJVc2pw?=
 =?utf-8?B?VUt1MU1qQU02dE8vOXFVUmF0WTJORmZPSUNsQlpOMndOMC9QOUNlMjBBOTFB?=
 =?utf-8?B?aS9tWUc5Ump2Z3hJZndjVUZURkhmMzZ6YkpwUytrdlBrMGdybXdBYW92NCsx?=
 =?utf-8?B?eVh2LzI3WkUzaXFUYnpMbUVmM1lsaWw3YWQ3NkdnSUd2NGhmekNCSTZBUE9T?=
 =?utf-8?B?eHkzRW1SYlZQaGd2UTVFS0NBeDBmZjRCUXBPTUdMVE5Jdmp5dnd6bENSTmpE?=
 =?utf-8?B?NERQMVQ0VUd3SXdHeERsbFl6L3VMTmgxcU5KY3dpeUdqOFllY05xNkZ1LzBp?=
 =?utf-8?B?dmYxeGVvQ2RRcjFhcVRwWnYvRTdRbTZQNmJncm5oUThzZ1NsSGdOSU41aDNa?=
 =?utf-8?B?SFIrdnNNSkp2eFcvM2o3Z1hjTVdzazIrRmFueUl6ZDdxOUpMWkliWGR6Q3I5?=
 =?utf-8?B?OHR6Z0UxNVRsdkFxdy9YZnRIUXZ1VXI2Q3NUTkJCejJDb1RnS0psRStETjh1?=
 =?utf-8?B?cUFaVUpVVmxqWXlhcXpxUUk5WVczajdPU3dxWEszTDlVbmVZeitUQThZZ2lp?=
 =?utf-8?B?Skw3OFoyUFdJYjIyRjVxdEE5UDNrQjY5TkgyU1dPa0ZhUXJwNVZ5Q084eWFn?=
 =?utf-8?B?YWJjUGk0bklyNENBRG0rWUZRdlFZbWtwOWpwR0ZVU3pqVk04SXB1NWVmVXpw?=
 =?utf-8?B?TXkxbVJDc0w2ZzdLNUhxcHNlQmdZQWRtQjFjOXN1dDBlbnVuTk92amUxZmEw?=
 =?utf-8?B?ZUR5Z01kTWlFbVhwQUlOUmRISzRBakhQaU5obkNjVEFWRVhGTkVSZWR3MThw?=
 =?utf-8?B?UWYwUGtkUmdiTUlXM2ZZSHZXK2J6OURJQ3A1M1p1RStBRmJ0US8rUk1iNnZS?=
 =?utf-8?B?VUtoQUxqbFVPTVpFcnR0YU9WZmtDVkNYM3BJWis3R3I4cGNpQWxMVThRV1ZG?=
 =?utf-8?B?Wno0VGZnOEN1VldTNlo5UzFmRVNhWW1RSFZYSVJCTXFwM1dFUk15M2d1RlV3?=
 =?utf-8?B?My9pSFloUTF6MzdBdkVaVlNhbWc5RjYyS3dqeHVUUjdUQVF3Z2VERDJ0ZkxZ?=
 =?utf-8?B?bS9uTXZKVFptQmJuR2kwMGtwNU5CdTdiZU9zU3F6L3d5R25rOTdMM2g3ZnZP?=
 =?utf-8?B?K2wxUGNYcnJGa0pLcG91WUlDUGg1S3VMUytDcmpud3BDS3NxSStmU0dHdXAv?=
 =?utf-8?B?U0s5dGZZeEovZVZ6QmRQOERULzcxWmtJS2FackM4UEVzcy8vTDh5NWZPM2s1?=
 =?utf-8?B?ZGFjNnNWOVRTZFJmUERLVG4vR3ZCZDFWU0NsT0dIZFR6cDZFUkdlUGtKL0Yz?=
 =?utf-8?B?cWQ5VWJ4RTArODF4NFdYVkQwWlNvQTFJWFlabEhtMGlGY3R6c0xrSEVUNUl3?=
 =?utf-8?B?YnFEZUMxa2wyNzg2bXhXTktpZXlhSTVOaVR0aU9kdGpLMjR6YmNDWkZGOXY0?=
 =?utf-8?B?VzBUSGw2dXJIcnAva0JHRXkwMmhHa0orbE9uQzZGL25GNVg5cVExS1FoSHZp?=
 =?utf-8?B?NmdRelJGT1drMnFlK3BuVjJLOW1mSlBLc245WDR1S2dOYzJ3c1hPdHk2eXgx?=
 =?utf-8?B?Zyt0aUQzN20zcks4ak1uVnF6MUxYdytyUFA3WnNSYms2YmpMTHJjQ0V2b1J3?=
 =?utf-8?B?eHZFNm80c29UR3BZMDhEbWt6WkhpNzVGNVlSMklUazk0N1ZYeXowczBMZDhU?=
 =?utf-8?B?citXM0ROYURjRG54QkpiNGZNc21FckxxMnlUQmlxalQvdVYwQzhsOVNUaWhp?=
 =?utf-8?B?Zlp4ZElYdUliSXhHMUY5cUtYZVUyLzRhUmIzRzhzQ2dldTRlRno2TFlwSTlh?=
 =?utf-8?B?czd0eDB0OXVkUjQwV0toUkxnWmpjc1JGL1hTckt4eVVmNHhXK3gyY3EvTm5z?=
 =?utf-8?B?cXFlUGViemh6bWxTUUZXOFNUMkpvcDJiSmlqYWd5SVJYUnZUa3N2ZWkweUtQ?=
 =?utf-8?B?bnVIQ21zSWd5RDdGMlJFclJxQVRHbjdMVlRDbDNBdDBVaXNLejEwWGdSL0po?=
 =?utf-8?B?d08vNGpKNVFubzhRcWlSVHg0OWdqTlBSaW1RelpDYUNZYzdMRjVoQXdXNGFy?=
 =?utf-8?B?bTBWNGVmZGNWU1ltYVdDbGNFQjZwb3VlU3RqUWhSK1hMUkdPTmxXVlRWZUpO?=
 =?utf-8?Q?oRpQ3n6Whq6R1Ht3o5hzXSwxODIGnTnVsMcUddWPsV1cQ?=
x-ms-exchange-antispam-messagedata-1: d4ISDFtIUezN5g==
Content-Type: text/plain; charset="utf-8"
Content-ID: <63214FA3016FB14AB9085D651775E471@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d3074b-d13b-4041-4ae9-08de6d661c2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2026 14:17:25.9633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r50GlQjmwmt6RD6AvlpklDP3sxW2KKjUyH9eyNhqIsOkShTpgNriEBqCuu5cbvVMgJkgY+O+FQTCLSGfm+RqNSrEk+h+6NhUeNO1sBkeBSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9487
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

T24gTW9uLCAyMDI2LTAyLTE2IGF0IDE5OjIxICswNTMwLCBOYXJlc2hrdW1hciBHb2xsYWtvdGkg
d3JvdGU6DQo+IFBlcmZvcm1hbmNlIGRlZ3JhZGF0aW9uIG9jY3VycyBpbiBtdWx0aS1CTUcgR1BV
IGNvbmZpZ3VyYXRpb25zIA0KPiBkdXJpbmcgUGVlci10by1QZWVyIHRyYW5zYWN0aW9ucyB3aGVu
IG9uZSBvZiB0aGUgdHdvIEdQVXMgcmVtYWlucw0KPiBpZGxlDQo+IHdpdGggbm8gZW5naW5lIGFj
dGl2aXR5Lg0KPiBUaGUgcm9vdCBjYXVzZSBoYXMgYmVlbiBpZGVudGlmaWVkIGFzIGZyZXF1ZW5j
eSBkb3duc2NhbGluZzoNCj4gdGhlIGlkbGUgcmVtb3RlIEdQVSByZWR1Y2VzIGl0cyBvcGVyYXRp
bmcgZnJlcXVlbmN5IHRvIHRoZSBtaW5pbXVtDQo+IDQwME1IeiwNCj4gd2hpY2ggbmVnYXRpdmVs
eSBpbXBhY3RzIHRoZSBiYW5kd2lkdGggYXZhaWxhYmxlIGZvciBQMlAgdHJhbnNhY3Rpb25zDQo+
IGluaXRpYXRlZCBieSB0aGUgYWN0aXZlIGxvY2FsIEdQVS4NCj4gDQo+IFRvIGFkZHJlc3MgYWJv
dmUgcHJvYmxlbSB0aGlzIHBhdGNoIGVuc3VyZXMgZm9yIHRoZSBwbGF0Zm9ybSBCTUcvQ1JJDQo+
IHRoZSBkZWZhdWx0IEdUIHJwIGZycXVlbmN5IG1pbiBzZXQgYXMgMS4yR0h6IHRvIGVuc3VyZSBl
ZmZldGl2ZSBQMlANCj4gdHJhbnNhY3Rpb24gYmFuZHdpZHRoLg0KPiANCj4gTm90ZTogDQo+IFdo
aWxlIGZyZXF1ZW5jeSBib29zdGluZyBpbXByb3ZlcyBwZXJmb3JtYW5jZSwgDQo+IGl0IGFsc28g
aW5jcmVhc2VzIHBvd2VyIGNvbnN1bXB0aW9uLiBJbiBzaW5nbGUgR1BVIG1vZGUsDQo+IGl0IGNh
dXNlcyB0aGUgR1BVIHRvIG9wZXJhdGUgYXQgdW5uZWNlc3NhcmlseSBoaWdoIGZyZXF1ZW5jaWVz
IGJ5DQo+IGRlZmF1bHQNCj4gYW5kIGFzIG9mIG5vdyB3ZSBkbyBub3QgaGF2ZSBhbnkgbWVjaGFu
aXNtIHRvIGxpbWl0IHRoaXMgZm9yIHNpbmdsZQ0KPiBHUFUuDQo+IA0KPiBOYXJlc2hrdW1hciBH
b2xsYWtvdGkgKDEpOg0KPiDCoCBkcm0veGU6IFNldCBHVCBycCBtaW4gZnJlcXVlbmN5IGFzIDEu
MkdIeiBkZWZhdWx0IGZvciBCTUcvQ1JJDQo+IA0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dWNfcGMuYyB8IDkgKysrKysrKystDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KDQpXYXNuJ3QgdGhlIGlkZWEgdG8gZG8gdGhpcyBvbmx5IGZvciB0
aGUgQXJjIFBSTyBCTUdzPyBQZXJoYXBzIHRoZQ0KY29tcHV0ZSB0ZWFtIHdvdWxkIHdhbnQgdG8g
Y2hpbWUgaW4gaGVyZSBmb3IgdGhlIHNjb3BlIG9mIHRoaXMNCndvcmthcm91bmQuDQoNClRoYW5r
cywNClRob21hcw0K
