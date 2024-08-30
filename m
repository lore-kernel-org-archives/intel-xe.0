Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856E5CA0EEF
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 08:24:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D0110E84E;
	Fri, 30 Aug 2024 08:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OtBtUgUV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E2310E852
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 08:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725006267; x=1756542267;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VZ2tJpGZUSQ/NeNL7OhVwa6PCyTXZhyykR7M71yJ1fM=;
 b=OtBtUgUVBgn74VQacCKfQf+rhPQH2DcCdIUqQ83QsqQLCVJhy5NLRSgA
 ybsvXNydPKfvY/ce7L6PMOP3J0RTR/eDCM9U/DgUnVxskkLAX0buDFNeH
 ZrTkgZswAhOAAp40R8T9brapZRotH5tNqqLjXPZPuhMkpThx3VZqqmbnt
 4ccQo1AQUXlcHEVpMuRrxbUixTZG16+aTf//rCM2EzcZWDHFB5wQ9lCUp
 aCnq6UMDPNkRk2GFy5rvxOE82c0Ahm3LPt0dHrHscMNbJ8SzZSvjIxD5X
 kNe9fJl6TxhFON0VXmsFYfyl5uiRgZquTp3W4lrEEfpFdNYDZR1nVuCOo Q==;
X-CSE-ConnectionGUID: Q0+nCJ1qQjOUEQVtVrf9VA==
X-CSE-MsgGUID: IAjmQJqvRQOo8GEq45DfIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23766291"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="23766291"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 01:24:27 -0700
X-CSE-ConnectionGUID: DH68qj85TD+pFSMMgvBaGw==
X-CSE-MsgGUID: DKozBPiRTwOHWQ7LqR5kdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="68497279"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Aug 2024 01:24:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 01:24:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 01:24:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 30 Aug 2024 01:24:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 30 Aug 2024 01:24:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMGQzG4zaGpqRL1pXAH0PW6CLDEB+ZtAgepGR4e+uzyc8fquzxR+BobALcmHFDp6fDHakTbYmcWjjHBIFgQ1RzVi7i/sDLJkbQJoVHzibHvXJ/H0Syv941DcAveJGY5rUDUtCz5Tuspsk23xmWDtKwKOzU7ur+S7D1uaG+fxPjl7JgrZmOL4vOTd/KHDVEGIXinyoXL746NWY+DyXtLK7rxS5xklkCJQuGKXn6kgMkibc4WD5kkz+vvZ6V839J5wYmEaemFr9hvjb8SGt0w0g60kvBSVFpBpnTwIkbgqAyho0iV0XFcV301N0PS4bMNovnqeM4BK5kWnHleR2++dwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZ2tJpGZUSQ/NeNL7OhVwa6PCyTXZhyykR7M71yJ1fM=;
 b=I3sYm2CCyvB8d2BDrmZi7iFLsZFRLHkhkoYmMstJilgZAzV/2LzuiO2dW1+sdvJxCTTATKzdMTgzPtmAuIE4XAAizbCyEwaLOj5V5YAF5dajlpL7rlLF9XxdgOojMWkrACLZBAF+7O3waOHN4wbZ9/zsjO31HICEs3SckhvBz/sF8zWyA4hs6cvyXobzPZX7ZSFy8kC/JBEDgScXXZCdjDeDAHZXBDSte8oNFDAKO/DbETI4tckNm+wqv9oIdFjypTl7apKSkQ61pTFdyovYqKLTe8fdxASc0HFGDLx6B3XpmQVTJfaqnD5XQ/UXCWFqxQNpPlsJZxIQzj2izLAjkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5609.namprd11.prod.outlook.com (2603:10b6:510:e0::24)
 by PH8PR11MB6927.namprd11.prod.outlook.com (2603:10b6:510:225::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Fri, 30 Aug
 2024 08:24:24 +0000
Received: from PH0PR11MB5609.namprd11.prod.outlook.com
 ([fe80::410e:7a23:21ce:673]) by PH0PR11MB5609.namprd11.prod.outlook.com
 ([fe80::410e:7a23:21ce:673%6]) with mapi id 15.20.7897.029; Fri, 30 Aug 2024
 08:24:24 +0000
From: "Ranjan, Joshua Santhosh" <joshua.santosh.ranjan@intel.com>
To: "Chegondi, Harish" <harish.chegondi@intel.com>, "Cabral, Matias A"
 <matias.a.cabral@intel.com>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Degrood, Felix J"
 <felix.j.degrood@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Kumar, Shubham"
 <shubham.kumar@intel.com>, "Ausmus, James" <james.ausmus@intel.com>
Subject: RE: [PATCH v2 1/1] drm/xe/eustall: Add support for EU stall sampling
Thread-Topic: [PATCH v2 1/1] drm/xe/eustall: Add support for EU stall sampling
Thread-Index: AQHa8C5c+HX32gF1pkG4mkU3pdLp9rIyILYwgAHLLoCAAXjQgIAEamkAgAAKlwCABY9hgIAACRBA
Date: Fri, 30 Aug 2024 08:24:24 +0000
Message-ID: <PH0PR11MB560993EA3FF44C552B5C2081A1972@PH0PR11MB5609.namprd11.prod.outlook.com>
References: <20240707224141.2865472-1-ashutosh.dixit@intel.com>
 <20240707224141.2865472-2-ashutosh.dixit@intel.com>
 <878qww3xh8.wl-ashutosh.dixit@intel.com>
 <CYYPR11MB83605299AB7259BC17AF3E38B28E2@CYYPR11MB8360.namprd11.prod.outlook.com>
 <87frqwyxsc.wl-ashutosh.dixit@intel.com>
 <3cab72ee68db99761ad07c6b8d8127b7d84ee77f.camel@intel.com>
 <87frqrtelv.wl-ashutosh.dixit@intel.com>
 <CYYPR11MB8360E6440D35516CFF554555B28B2@CYYPR11MB8360.namprd11.prod.outlook.com>
 <ZtFks4OB2fzoY-yu@intel.com>
In-Reply-To: <ZtFks4OB2fzoY-yu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5609:EE_|PH8PR11MB6927:EE_
x-ms-office365-filtering-correlation-id: 495846fc-9d7f-4945-6922-08dcc8cd27e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?M1BTcHd0UWZ2S3JPNE8wai9yWmFGWUFjcjdhTlFsM1l3L1JHOU9Pd0N0WnAy?=
 =?utf-8?B?YmpJcnpUaUlOM2hHRzhhdXd4VlhocDlzWXgvenpreGlabVE0eUExSWJYVTlN?=
 =?utf-8?B?VDZEYkVqekx1Zzd1Q0pwWnJlVVNjNmxMY0tMUXhMSm5RR1lHa1MweHJTVk9h?=
 =?utf-8?B?SjEwcHcvVkpSMno4eGFQenBaSjdXelA2Sm16V3NVQVgvaGpkNzNPL3ZKdm9G?=
 =?utf-8?B?NFkwRm1VT2hpVW5hbFI5eU5BYS9yaFplL0NXRGZWby85eVBjYkp2c0E3a2o4?=
 =?utf-8?B?ZHlteWJEU2RiOERvSXFTbXFEdEtXQlp3NmpyOERjaGYwRTB4OXQxKytTVGhO?=
 =?utf-8?B?LzJIZ043aVY2THArYVpQaG4rOVZRR2pQRDdUSG1HWVlWM28zZXVZTXBpcUVy?=
 =?utf-8?B?R0dBNFpuajJOWEx1YXh5Z09XZ2dWVWdyZTZiOHNKWU1HZHhvQ0lyc3RwRENs?=
 =?utf-8?B?VVRBM1MydGo5b1ZMQUZkdkI1czNVMHZLL2VXZy9VY1R2L2hHbUNGLzlrb1o1?=
 =?utf-8?B?YVB2VmlqZnhoWGk4YjhxT2p3anVWTEtzVnE5ZzZTbG53aFZ4NXQ0NGdjL1Vp?=
 =?utf-8?B?c0c3MkR3ZU92NkZSM1VFWEsvaFlmeUNLS2N0RUNFK3VDZWk0MUxXanVMcERG?=
 =?utf-8?B?TXZFWG5jNDRoS25acDBsdmw4SlRvak5BNko5NHd5KzdBSXBwdUVXa3R4QlZO?=
 =?utf-8?B?WFg3eEdmUThyR2pxUm9KNDZ4eXBFNFF2OStKYVZGWEVIWVpLeWJrQzgrVGNv?=
 =?utf-8?B?eHovYXhlbzVVODRienVKOUZGdUwrTFVmSW8wQ3RJU1VpSGh1SUpETHZQaUtO?=
 =?utf-8?B?a3dvcTRvbFVtUHhCL2I4Qy8veWN2azdwSlEzbURoZUpkN1RUMHpHYzdXUnh1?=
 =?utf-8?B?L3JqbWVYSFdMcndUcG5ZOUtZQjYwQ0l0aXpCaDdwSThSQWZMVkZaVTZGMjFZ?=
 =?utf-8?B?SWVianpqY0ZVTTJHSlk4b0J5ZktpYXNDLzd5MFp4ZXI4ZVlSZE1jNHhyZ0VY?=
 =?utf-8?B?VDVvakoxNGlOY2pwWlNNR2dOR0FQTXdYL2RmbGpsZS91MG1GbHVoZzZhbWF1?=
 =?utf-8?B?bXc3RVV4VlNMakNtMkM0Yys3WURTLzMxMFZZRFdDN3o1MTNlMWFmT09TRkRp?=
 =?utf-8?B?d1kxRlJZQTFsNlRXV3ZlU1dRSVJnc2VqNVFyOXo2YnlCb2FwMXhVWURJQTlD?=
 =?utf-8?B?RUdpRit2MmFTSHhSZkdlMkdxckZqZDdGNSs0MXYvbjVlVktWU2RSMEdsOXpF?=
 =?utf-8?B?Szcyb0diczIyT3FiNzdpc09WTzlNaEJwNGdUcTRCSG5WS2J4Ry9Ccjd0SWZ4?=
 =?utf-8?B?bktpZmdFZGNhWjVqNjFpK1NwNTZGdGI4OUFxKzNCVjhGZXJBRnpOK1lnZzlP?=
 =?utf-8?B?aXpYeHhJcXlBSnFJRlFtOXF4M3NvU0EwZFFiV0tPcmEySzBaRGkxTVNHTkNI?=
 =?utf-8?B?NmtHbFp0STFNRGhoUlpOMzRsWlo3UDMvcmlCU0txTG5jbjBud3JvSklOSHpW?=
 =?utf-8?B?YXBpbm1kU1ZhRWROOUtyYlFKSUFlYWFEUFFQeHg3aE5tdDhSRUxjczhxNm92?=
 =?utf-8?B?cnV6VEc5VFV4ekZBdlE4Y21Kbk5VMmFPbWRONDRycFBBRDhPcGc0ZHBYSWwy?=
 =?utf-8?B?dGhBSDA3YkxKR1djZ1lNU0ZUWHRwVEVmcWNTWjc5UUFaZWZVbzJ6cWZabjFJ?=
 =?utf-8?B?cWdBNzlpTFpZVGVBZUdIcVJwckc5akRJTlZUZnduT0hOb1RyZVhKQ0MzOHI4?=
 =?utf-8?B?UUlyN3ZYcmU3TVhkbUdDSFJWTGJHTkJ1SDVQRGd6MzlYekprOXBldTRuR29B?=
 =?utf-8?Q?WDYCaYlw+RHYNxPk+1QCy1GXmBMbDUo5j/pIs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5609.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZlNickZFMGRmSEQ0L2c0a0p5RWVZMXNrWStYcEZkeTRvdmxlSFZ2WjlvTnd3?=
 =?utf-8?B?MmVtclZyUEM3VTByZ0dTYkpnK3huVlJzMFAyUkRqQzFzR3gvUjMxVDZIRXNa?=
 =?utf-8?B?b0dpMzlTdjdoU21wc0hiam4zcDAwRk1sSTk3WFdxOTQ2ekR4c0lpZCs1Q0gx?=
 =?utf-8?B?b2RVR1c2Ykd4VnJFZzM3UzNWMGdsNkp4NStiRUNsVktna3hNUjVwaDZ1Ujd0?=
 =?utf-8?B?YWxBSk5PcVozMENWTmdHZEE5ZTR3a1YvTDZ3ZFJySXI4SUdQQ0cvbXI4UDd0?=
 =?utf-8?B?SURYNEtBWmJVV0JyN0hjZklwcWJnU2ZTT1lhRS9aWEhRM1ozWXhvSXlDakE3?=
 =?utf-8?B?RUNnY2FLR0ZOejVSeHBRcGRVSUFyQ1BqQnJBWEF1MGtBZDdJZjhxdUFlZUFs?=
 =?utf-8?B?aU5nUWJkbWV2U0VHYlJra3dPZEFjS0lYdWMxaHBYN1A3Y1lPdVNIdVh6R051?=
 =?utf-8?B?ZXBmWC9vT3cwYVlnT1c4ck5lMUZucFRYS1hkSXl1MjFZOEhDVENvT1hnRlo3?=
 =?utf-8?B?T1BBQm0wVHlHcGtMS2NtallFdWZOM2ZlYU9BZXI4aVJySDZzWkZYV0pmMFVw?=
 =?utf-8?B?WUt2bTVvcG1RMHEyNGNYc2RocVAxOHo5T1ozZHJPSUNtNU9KYkRIREY1R0lt?=
 =?utf-8?B?TS90NW1iUkpzc09McXIzK1hudXVqNVEyS2puR045YVhjbTl1ZElvdTdzYU9K?=
 =?utf-8?B?WTd6OEFJSTN1eVd2SktXN2RUUXlVRmZRVGs1ZFBPUFpYVFV5b0ROTlhCN1VY?=
 =?utf-8?B?Z3NsSmVrUFIxT05nakU1NW5xcnhMT0NrWlNOdGROZ3V2a3VJc0s5WmhXdnMz?=
 =?utf-8?B?T2lCTG84bjJRTVpvQXR0enJtTE9UNmhmczJETXp4OGpWdzM1TEJJeHQ0OW1q?=
 =?utf-8?B?ME5FUm1pRGdZM0tTQ1ZHUHpOWE1VTzRLeDZtclZiNGhqUUprRlAySCtXKzIz?=
 =?utf-8?B?Q0ZXa3F0TnhEQzBNSWQ4Y3BscXFnd0lJMFNIR3Q1aU1MYVhZM050NGV2dllh?=
 =?utf-8?B?SjFsdUNjSE4rUzFMakJKREhNeTIyNG9sSExUSmpSMWdJWVd5aktpNGFJTDh5?=
 =?utf-8?B?a0FDYnBkekJVWGd0cldySUJSR2JYZjJIUTkzRVVoUVFRNUJBQ3RsMndXQmpn?=
 =?utf-8?B?dUt6VDgreWFuQTZUSkNpd29UUnlCSHF5c1FiM1lGZVNKUzRHUUxtVTFvRXlz?=
 =?utf-8?B?U3JubU9SRjJ6SUEyU1p4SWpRVStuS1VkQVNrWnlaN0lhSE1GR0Z1SzBmYmNR?=
 =?utf-8?B?UHJESWlsYjJKV2RwWHp4RXZHbjJyc3Jxb0xac1dadnBwQTZOamUyNWFtUlZw?=
 =?utf-8?B?QndFMlRQVFl0anIxR05VK3VxZ3dBeWpXRlp6dXY4eXYrTWhJQVhESVJHZEFG?=
 =?utf-8?B?QWpzcUVIc3AyWjRhalFkblRBOU83dFh1S1QvNmlpMjlGZnhnTC9BYy9uWFVU?=
 =?utf-8?B?MjRzMGVqTTZCczhpQWhxcjYzVHhEVnJDRUFPVXB6cEhDU3c3RitCVEk2NHdJ?=
 =?utf-8?B?VUZmRHZpQUlnYzlKaDhyZkZyOHhCb1hLTkdkTEdHMDloU2VESnkwaGdUbkRX?=
 =?utf-8?B?aVJ2STNhM2FRNHNENTlBdW5ZNGFETjBKU0k4UUFSQkFFNEg4NkZTNmFuVG9a?=
 =?utf-8?B?NHNHTHlXUitMSnFRN1pTd2xJWlc2UllMekFSY09LaGhVR01UMjUwZUMrRnpS?=
 =?utf-8?B?alE1NVNqTzdEanFhUUZWb1AwaXJOT2laMjVBZmVUSEcxSEY3RUl0SHBSSGdC?=
 =?utf-8?B?R0xHczlhUEJTMGIwN0F0YjlKNTdsMStFV3R1WXRHZmFzbUVRVHZqZWpzMnJF?=
 =?utf-8?B?ckEzVjk1Ylk1dnNTNDVWaTdtQ2I5RG5PSGg2NDg4V25SS0RjV1dZNXZRMVhY?=
 =?utf-8?B?UzdtbmNsNys1RVRUMlkySUI2WFkwQktVc1NMR2txN3BZdGpWbm1vY2ZRNnRY?=
 =?utf-8?B?dG1SamcwbmpZdHJpSkhocnpkbGFrMllpU3ZtY1VGRi9QSkVKMi9pY1hqY3k0?=
 =?utf-8?B?WVgxd3JCZGNYbzFXTkF1VXVaR0lTOGJRMHJRZllYRy95TENsWWZieTZwUVVz?=
 =?utf-8?B?Vkt3T041aklyUVh1TU1YRVVabCt2S2x4d0htVGpDRC9XSU04T2lqVnFaeGly?=
 =?utf-8?B?OVEyQnJTQ0VEVGRxYVlxUHM4bEhVdElDZ0M2TUZFdmdOVmpMb09sUmhhdWNZ?=
 =?utf-8?B?MUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 495846fc-9d7f-4945-6922-08dcc8cd27e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2024 08:24:24.2354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4cYejCuCV2Tg7263wvCY9CuCZcEDqk077rKzwBwF1vD78qnIG5BYW3WEFsyqk4Sv9zwwerCHA3QBM5+EtZJUs6DhMRdCg5MUnpoFfPbqAQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6927
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

SGkgSGFyaXNoLCANCg0KT25lIGNsYXJpZmljYXRpb246DQo+IHRoZSBkcml2ZXIgd291bGQgcmV0
dXJuIGFuIGVycm9yIGR1cmluZyBhIHJlYWQoKSBpZiAqYW55KiBzdWJzbGljZSBpbiB0aGUgdGls
ZSBoYXMgZHJvcHBlZCBkYXRhLg0KPkFueSBFVSBzdGFsbCBkYXRhIHByZXNlbnQgaW4gdGhlIGtl
cm5lbCBidWZmZXIgd291bGQgTk9UIGJlIHJlYWQuDQo+IFRoZSBzdWJzZXF1ZW50IHJlYWQoKSB3
b3VsZCByZXR1cm4gRVUgc3RhbGwgZGF0YSBmb3IgYWxsIHN1YnNsaWNlcyBvbiB0aGUgdGlsZSBh
bmQgYWxzbyBjbGVhciB0aGUgZHJvcCBiaXQgaW4gdGhlIEhXIHJlZ2lzdGVycyBmb3IgYWxsIHN1
YnNsaWNlcyB0aGF0IGRyb3BwZWQgZGF0YS4NCg0KSnVzdCB0byBjb25maXJtLCBpbiBjYXNlIG9m
IGJ1ZmZlciBvdmVyZmxvdyAyIHJlYWQoKSBjYWxscyBhcmUgZXhwZWN0ZWQgdG8gYmUgZG9uZSB0
byByZWFkIG91dCB0aGUgc3RhbGwgZGF0YSA/DQoNClRoYW5rcywNCkpvc2h1YSBTYW50aG9zaA0K
DQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQ2hlZ29uZGksIEhhcmlzaCA8aGFy
aXNoLmNoZWdvbmRpQGludGVsLmNvbT4gDQpTZW50OiBGcmlkYXksIEF1Z3VzdCAzMCwgMjAyNCAx
MTo1MSBBTQ0KVG86IENhYnJhbCwgTWF0aWFzIEEgPG1hdGlhcy5hLmNhYnJhbEBpbnRlbC5jb20+
DQpDYzogRGl4aXQsIEFzaHV0b3NoIDxhc2h1dG9zaC5kaXhpdEBpbnRlbC5jb20+OyBTb3V6YSwg
Sm9zZSA8am9zZS5zb3V6YUBpbnRlbC5jb20+OyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IERlZ3Jvb2QsIEZlbGl4IEogPGZlbGl4LmouZGVncm9vZEBpbnRlbC5jb20+OyBOZXJsaWdl
IFJhbWFwcGEsIFVtZXNoIDx1bWVzaC5uZXJsaWdlLnJhbWFwcGFAaW50ZWwuY29tPjsgUmFuamFu
LCBKb3NodWEgU2FudGhvc2ggPGpvc2h1YS5zYW50b3NoLnJhbmphbkBpbnRlbC5jb20+OyBLdW1h
ciwgU2h1YmhhbSA8c2h1YmhhbS5rdW1hckBpbnRlbC5jb20+OyBBdXNtdXMsIEphbWVzIDxqYW1l
cy5hdXNtdXNAaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzFdIGRybS94ZS9l
dXN0YWxsOiBBZGQgc3VwcG9ydCBmb3IgRVUgc3RhbGwgc2FtcGxpbmcNCg0KSGVyZSBpcyB0aGUg
c3VtbWFyeSBvZiB0aGUgZGlzY3Vzc2lvbiByZWdhcmRpbmcgdGhlIHVBUEkNCg0KMS4gRWxpbWlu
YXRlIHRoZSBkYXRhIGhlYWRlciBmcm9tIHRoZSBkYXRhIGNvcGllZCBieSB0aGUgZHJpdmVyIHRv
IHRoZSB1c2VyIHNwYWNlLg0KDQoyLiBTdWJzbGljZSBpbmZvcm1hdGlvbiBpbiB0aGUgaGVhZGVy
IGlzIE5PVCB1c2VkIGJ5IHRoZSB1c2VyIHNwYWNlIHNpbmNlIHRoZSBkYXRhIGlzIGNvbGxlY3Rl
ZCBhdCB0aGUgdGlsZSBncmFudWxhcml0eS4NCg0KMy4gVGhlIG9ubHkgZmxhZ3MgYml0KDApIGlu
IHRoZSBoZWFkZXIgY3VycmVudGx5IHVzZWQsIGlzIHRvIGluZGljYXRlIGlmIHRoZSBIVyBoYXMg
ZHJvcHBlZCBhbnkgRVUgc3RhbGwgZGF0YSBkdWUgdG8gaW5zdWZmaWNpZW50IHNwYWNlIGluIHRo
ZSBrZXJuZWwgYnVmZmVyLiBJbnN0ZWFkIG9mIGEgZmxhZyBpbiB0aGUgaGVhZGVyLCB0aGUgZHJp
dmVyIHdvdWxkIHJldHVybiBhbiBlcnJvciBkdXJpbmcgYSByZWFkKCkgaWYgKmFueSogc3Vic2xp
Y2UgaW4gdGhlIHRpbGUgaGFzIGRyb3BwZWQgZGF0YS4NCkFueSBFVSBzdGFsbCBkYXRhIHByZXNl
bnQgaW4gdGhlIGtlcm5lbCBidWZmZXIgd291bGQgTk9UIGJlIHJlYWQuDQpUaGUgc3Vic2VxdWVu
dCByZWFkKCkgd291bGQgcmV0dXJuIEVVIHN0YWxsIGRhdGEgZm9yIGFsbCBzdWJzbGljZXMgb24g
dGhlIHRpbGUgYW5kIGFsc28gY2xlYXIgdGhlIGRyb3AgYml0IGluIHRoZSBIVyByZWdpc3RlcnMg
Zm9yIGFsbCBzdWJzbGljZXMgdGhhdCBkcm9wcGVkIGRhdGEuDQoNCjQuIFVzZXIgc3BhY2UgZG9l
c24ndCBzZWVtIHRvIGJlIGludGVyZXN0ZWQgdG8ga25vdyB3aGljaCBzdWJzbGljZXMgaGF2ZSBk
cm9wcGVkIGRhdGEuIFNvLCB0aGUgZHJpdmVyIHdvdWxkIG5vdCBwcm92aWRlIGFueSBTVEFUVVMg
SU9DVEwgdG8gZ2V0IHRoaXMgaW5mby4NCg0KNS4gUmVjb3JkIHNpemUgaW4gdGhlIGhlYWRlciBp
cyBhIHN0YXRpYyBpbmZvIHdoaWNoIGNhbiBiZSBxdWVyaWVkIHRocm91Z2ggYW4gSU5GTyBJT0NU
TCBhZnRlciBhIGZpbGUgZGVzY3JpcHRvciBpcyBvcGVuZWQuIEJhc2VkIG9uIHRoZSBHUFUsIHVz
ZXIgc3BhY2UgY2FuIGRldGVybWluZSB0aGlzIGFzIHdlbGwuDQoNClRoYW5rcw0KSGFyaXNoLg0K
DQpPbiBNb24sIEF1ZyAyNiwgMjAyNCBhdCAxMDozMTowNEFNIC0wNzAwLCBDYWJyYWwsIE1hdGlh
cyBBIHdyb3RlOg0KPiA+IE1hdGlhczogY291bGQgeW91IHBsZWFzZSBleHBsYWluIHdoYXQgTDAg
ZG9lcyB3aXRoIHRoaXMgZHJvcHBlZCBmbGFnPw0KPiANCj4gRHVyaW5nIHRoZSBwcm9jZXNzaW5n
IG9mIHRoZSBkYXRhLCBMMCByZXR1cm5zIGEgd2FybmluZyBtZXNzYWdlLiBWVHVuZSAoIEkgdGhp
bmspIGFsc28gd2FybnMgdGhlIHVzZXIgdGhhdCByZXN1bHRzIHdlcmUgY29sbGVjdGVkIGJ1dCB3
aWxsIGJlIGluYWNjdXJhdGUgYmVjYXVzZSB0aGUgZHJhaW5pbmcvcmVhZGluZyBvZiBkYXRhIHdh
cyBub3QgZG9uZSBmYXN0IGVub3VnaC4gQnkgbW92aW5nIHRoZSB3YXJuaW5nIHRvIGJlIHJldHVy
bmVkIGF0IGVhcmxpZXIvcmVhZGluZyBzdGVwLCBWVHVuZSBtYXkgYSkgb24gdGhlIGZseSBpbmNy
ZWFzZSB0aGUgcmVhZGluZyBmcmVxdWVuY3kgcmVkdWNpbmcgdGhlIGFtb3VudCBvZiBkYXRhIGxv
c3QgYikgY2FuY2VsIHRoZSBjb2xsZWN0aW9uIGltbWVkaWF0ZWx5LCBzYXZpbmcgdGltZSB0byB0
aGUgdXNlciB0aGF0IG1heSBjb2xsZWN0IGRhdGEgaW4gb25lIG5vZGUgYW5kIHByb2Nlc3MgaW4g
YSBkaWZmZXJlbnQgb25lLiANCj4gDQo+IFRoYW5rcywNCj4gX01BQw0KPiANCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGl4aXQsIEFzaHV0b3NoIDxhc2h1dG9zaC5kaXhp
dEBpbnRlbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDI2LCAyMDI0IDk6NDggQU0NCj4g
VG86IFNvdXphLCBKb3NlIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4gQ2M6IENhYnJhbCwgTWF0
aWFzIEEgPG1hdGlhcy5hLmNhYnJhbEBpbnRlbC5jb20+OyANCj4gaW50ZWwteGVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBEZWdyb29kLCBGZWxpeCBKIA0KPiA8ZmVsaXguai5kZWdyb29kQGludGVs
LmNvbT47IE5lcmxpZ2UgUmFtYXBwYSwgVW1lc2ggDQo+IDx1bWVzaC5uZXJsaWdlLnJhbWFwcGFA
aW50ZWwuY29tPjsgUmFuamFuLCBKb3NodWEgU2FudGhvc2ggDQo+IDxqb3NodWEuc2FudG9zaC5y
YW5qYW5AaW50ZWwuY29tPjsgQ2hlZ29uZGksIEhhcmlzaCANCj4gPGhhcmlzaC5jaGVnb25kaUBp
bnRlbC5jb20+OyBLdW1hciwgU2h1YmhhbSA8c2h1YmhhbS5rdW1hckBpbnRlbC5jb20+OyANCj4g
QXVzbXVzLCBKYW1lcyA8amFtZXMuYXVzbXVzQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MiAxLzFdIGRybS94ZS9ldXN0YWxsOiBBZGQgc3VwcG9ydCBmb3IgRVUgc3RhbGwgDQo+
IHNhbXBsaW5nDQo+IA0KPiBPbiBGcmksIDIzIEF1ZyAyMDI0IDE0OjIyOjE5IC0wNzAwLCBTb3V6
YSwgSm9zZSB3cm90ZToNCj4gPg0KPiA+IEhpDQo+IA0KPiBUaGFua3MgSm9zZS4gT25lIHF1ZXN0
aW9uIGZvciBNYXRpYXMvTDAgYmVsb3cuDQo+IA0KPiA+IE9uIFRodSwgMjAyNC0wOC0yMiBhdCAx
NTo1MyAtMDcwMCwgRGl4aXQsIEFzaHV0b3NoIHdyb3RlOg0KPiA+ID4gT24gV2VkLCAyMSBBdWcg
MjAyNCAxMjozNTo1MSAtMDcwMCwgQ2FicmFsLCBNYXRpYXMgQSB3cm90ZToNCj4gPiA+DQo+ID4g
PiBIaSBNYXRpYXMsDQo+ID4gPg0KPiA+ID4gVGhhbmtzIGZvciByZXNwb25kaW5nLCB0aGUgaW5w
dXQgaXMgX3ZlcnlfIGhlbHBmdWwuDQo+ID4gPg0KPiA+ID4gTWVzYSBmb2xrczogd291bGQgaXQg
YmUgcG9zc2libGUgZm9yIHlvdSB0byBwcm92aWRlIHNpbWlsYXIgaW5wdXQgdG9vPw0KPiA+DQo+
ID4gRmVsaXgncyBNUlsxXSBpcyBvbmx5IHVzaW5nIHJlY29yZF9zaXplIGFuZCBudW1fcmVjb3Jk
cywgaWYgdGhlDQo+ID4gZHJtX3hlX2V1X3N0YWxsX2RhdGFfeGUyIHdhcyB0aGUgc2FtZSBzaXpl
IGFuZCB0aGUgc2FtcGxlIHdlIHdvdWxkIA0KPiA+IG5vdCBuZWVkIHRoZSBoZWFkZXIgYXQgYWxs
LCBpbmxpbmUgcmVwbGllcyBiZWxvdy4NCj4gPg0KPiA+IFsxXSBodHRwczovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0vbWVyZ2VfcmVxdWVzdHMvMzAxNDINCj4gPg0KPiA+ID4N
Cj4gPiA+IFRoYW5rcy4NCj4gPiA+IC0tDQo+ID4gPiBBc2h1dG9zaA0KPiA+ID4NCj4gPiA+DQo+
ID4gPiA+DQo+ID4gPiA+IEhpIEFzaHV0b3NoLA0KPiA+ID4gPg0KPiA+ID4gPiBTb21lIGlubGlu
ZSBxdWVzdGlvbnMgYmVsb3cgW01BQ10NCj4gPiA+ID4NCj4gPiA+ID4gVGhhbmtzLA0KPiA+ID4g
PiBfTUFDDQo+ID4gPiA+DQo+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4g
PiA+IEZyb206IERpeGl0LCBBc2h1dG9zaCA8YXNodXRvc2guZGl4aXRAaW50ZWwuY29tPg0KPiA+
ID4gPiBTZW50OiBGcmlkYXksIEF1Z3VzdCAxNiwgMjAyNCAzOjM4IFBNDQo+ID4gPiA+IFRvOiBp
bnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiA+ID4gQ2M6IENoZWdvbmRpLCBIYXJp
c2ggPGhhcmlzaC5jaGVnb25kaUBpbnRlbC5jb20+OyBOZXJsaWdlIA0KPiA+ID4gPiBSYW1hcHBh
LCBVbWVzaCA8dW1lc2gubmVybGlnZS5yYW1hcHBhQGludGVsLmNvbT47IERlZ3Jvb2QsIEZlbGl4
IA0KPiA+ID4gPiBKIDxmZWxpeC5qLmRlZ3Jvb2RAaW50ZWwuY29tPjsgU291emEsIEpvc2UgDQo+
ID4gPiA+IDxqb3NlLnNvdXphQGludGVsLmNvbT47IENhYnJhbCwgTWF0aWFzIEEgDQo+ID4gPiA+
IDxtYXRpYXMuYS5jYWJyYWxAaW50ZWwuY29tPg0KPiA+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENI
IHYyIDEvMV0gZHJtL3hlL2V1c3RhbGw6IEFkZCBzdXBwb3J0IGZvciBFVSANCj4gPiA+ID4gc3Rh
bGwgc2FtcGxpbmcNCj4gPiA+ID4NCj4gPiA+ID4gT24gU3VuLCAwNyBKdWwgMjAyNCAxNTo0MTo0
MSAtMDcwMCwgQXNodXRvc2ggRGl4aXQgd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+IEhpIEhhcmlz
aCwNCj4gPiA+ID4NCj4gPiA+ID4gU29tZSBjb21tZW50cyBiZWxvdyBvbiBqdXN0IHRoZSB1YXBp
IGZpcnN0LCB0b3dhcmRzIGZpbmFsaXppbmcgDQo+ID4gPiA+IHRoZSB1YXBpIHdpdGggdGhlIFVN
RCdzIHdobyBjb25zdW1lIHRoaXMgZGF0YS4gQW5kIGFsc28gDQo+ID4gPiA+IGNvbXBhcmluZyB0
aGUgdWFwaSB3aXRoIHdoYXQgd2UgZGlkIGluIE9BLg0KPiA+ID4gPg0KPiA+ID4gPiA+DQo+ID4g
PiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggDQo+ID4gPiA+ID4g
Yi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oIGluZGV4IDE5NjE5ZDQ5NTJhOC4uMzQzZGU3MDBk
MTBkDQo+ID4gPiA+ID4gMTAwNjQ0DQo+ID4gPiA+DQo+ID4gPiA+IC9zbmlwLw0KPiA+ID4gPg0K
PiA+ID4gPiA+ICsvKioNCj4gPiA+ID4gPiArICogc3RydWN0IGRybV94ZV9ldV9zdGFsbF9kYXRh
X2hlYWRlciAtIEVVIHN0YWxsIGRhdGEgaGVhZGVyLg0KPiA+ID4gPiA+ICsgKiBIZWFkZXIgd2l0
aCBhZGRpdGlvbmFsIGluZm9ybWF0aW9uIHRoYXQgdGhlIGRyaXZlciBhZGRzDQo+ID4gPiA+ID4g
KyAqIGJlZm9yZSBFVSBzdGFsbCBkYXRhIG9mIGVhY2ggc3Vic2xpY2UgZHVyaW5nIHJlYWQoKS4N
Cj4gPiA+ID4NCj4gPiA+ID4gT25lIHF1ZXN0aW9uIHRvIHJlc29sdmUgaXMgaWYgd2UgcmVhbGx5
IG5lZWQgdGhpcyBoZWFkZXIgYW5kIGlmIA0KPiA+ID4gPiBVTUQncyBhcmUgYWN0dWFsbHkgdXNp
bmcgdGhlIGluZm9ybWF0aW9uIGluIHRoaXMgaGVhZGVyLiBJbiBPQSANCj4gPiA+ID4gd2UgZHJv
cHBlZCB0aGUgaGVhZGVyIGFuZCBhcmUgcHJvdmlkaW5nIGluZm9ybWF0aW9uIGluIHRoZSANCj4g
PiA+ID4gaGVhZGVyIHZpYSBkaWZmZXJlbnQgbWVhbnMgKHNlZSBiZWxvdykuDQo+ID4gPiA+DQo+
ID4gPiA+IEFub3RoZXIgb3B0aW9uIGlzIHRvIGFjdHVhbGx5IGFkZCBhIHByb3BlcnR5IGZvciB0
aGUgaGVhZGVyLiBTbyANCj4gPiA+ID4gaGVhZGVycyBhcmUgYWRkZWQgb25seSB3aGVuIHVzZXIg
c3BhY2UgcmVxdWVzdHMgaGVhZGVycy4NCj4gPiA+ID4NCj4gPiA+ID4gPiArICovDQo+ID4gPiA+
ID4gK3N0cnVjdCBkcm1feGVfZXVfc3RhbGxfZGF0YV9oZWFkZXIgew0KPiA+ID4gPiA+ICsJLyoq
IEBzdWJzbGljZTogc3Vic2xpY2UgbnVtYmVyIGZyb20gd2hpY2ggdGhlIGZvbGxvd2luZyBkYXRh
DQo+ID4gPiA+ID4gKwkgKiBoYXMgYmVlbiBjYXB0dXJlZC4NCj4gPiA+ID4gPiArCSAqLw0KPiA+
ID4gPiA+ICsJX191MTYgc3Vic2xpY2U7DQo+ID4gPiA+DQo+ID4gPiA+IERvIFVNRCdzIHVzZSB0
aGlzIHN1YnNsaWNlIGluZm9ybWF0aW9uPyBXZSBzaG91bGQgY2hlY2sgd2l0aCBMMCBhbmQgTWVz
YSBhYm91dCB0aGlzLg0KPiA+ID4gPg0KPiA+ID4gPiBbTUFDXSBMMCBkb2VzIG5vdCBjdXJyZW50
bHkgdXNlIHRoaXMuDQo+ID4NCj4gPiBObyB1c2FnZSBmb3Igc3VibGljZSBhdCB0aGUgbW9tZW50
IGluIE1lc2ENCj4gPg0KPiA+ID4gPg0KPiA+ID4gPiBBbHNvIGFib3V0IHdoZXRoZXIgVU1EJ3Mg
bmVlZCBvciB3YW50IHRoZSBoZWFkZXIgaXRzZWxmLiBGb3IgT0EsIA0KPiA+ID4gPiBVTUQncyB3
ZXJlIGhhcHB5IG5vdCBoYXZpbmcgdG8gcGFyc2UgdGhlIGhlYWRlci4NCj4gPiA+ID4NCj4gPiA+
ID4gPiArCS8qKiBAZmxhZ3M6IGZsYWdzICovDQo+ID4gPiA+ID4gKwlfX3UxNiBmbGFnczsNCj4g
PiA+ID4gPiArLyogRVUgc3RhbGwgZGF0YSBkcm9wcGVkIGJ5IHRoZSBIVyBkdWUgdG8gbWVtb3J5
IGJ1ZmZlciBiZWluZyBmdWxsICovDQo+ID4gPiA+ID4gKyNkZWZpbmUgWEVfRVVfU1RBTExfRkxB
R19PVkVSRkxPV19EUk9QCSgxIDw8IDApDQo+ID4gPiA+DQo+ID4gPiA+IEluIE9BIHN1Y2ggaW5m
b3JtYXRpb24gaXMgcmV0dXJuZWQgdmlhIA0KPiA+ID4gPiBEUk1fWEVfT0JTRVJWQVRJT05fSU9D
VExfU1RBVFVTLiBGb3IgRVUgc3RhbGwsIGUuZy4gd2UgY291bGQgDQo+ID4gPiA+IHJldHVybiBh
IGJpdCBtYXNrIG9mIHN1YnNsaWNlcyB3aGljaCByZXBvcnRpbmcgZHJvcHMuIFNvIHNpbWlsYXIg
DQo+ID4gPiA+IHRvIE9BLCB3ZSBjb3VsZCByZXR1cm4gLUVJTyB3aGVuIEhXIHJlcG9ydHMgZHJv
cHMgYW5kIHVzZXJzcGFjZSANCj4gPiA+ID4gb3B0aW9uYWxseSBpc3N1ZXMgRFJNX1hFX09CU0VS
VkFUSU9OX0lPQ1RMX1NUQVRVUyB0byByZXRyaWV2ZSANCj4gPiA+ID4gd2hpY2ggc3Vic2xpY2Vz
IGFyZSByZXBvcnRpbmcgZHJvcHMuDQo+ID4gPiA+DQo+ID4gPiA+IFtNQUNdIGhhdmluZyBhIHJl
dHVybiBjb2RlIHRvIG5vdGlmeSBvZiByZXBvcnRzIGRyb3BzIHdvdWxkIGJlIA0KPiA+ID4gPiBt
dWNoIHByZWZlcmFibGUuIFRoaXMgd291bGQgYWxsb3cgdGhlIFVNRCBkZXRlY3RpbmcgdGhpcyAN
Cj4gPiA+ID4gY29uZGl0aW9uIGR1cmluZyB0aGUgcmVhZCBwaGFzZSB3aXRob3V0IG5lZWRpbmcg
dG8gcHJvY2Vzcy9wYXJzZSBlYWNoIHJlcG9ydC4NCj4gDQo+IE1hdGlhczogY291bGQgeW91IHBs
ZWFzZSBleHBsYWluIHdoYXQgTDAgZG9lcyB3aXRoIHRoaXMgZHJvcHBlZCBmbGFnPw0KPiANCj4g
SGFyaXNoOiBkbyB3ZSBrbm93IHdoYXQgaXMgdGhlIHJlYXNvbiBIVyBzZXRzIHRoaXMgZHJvcHBl
ZCBmbGFnPyBJcyBpdCBiZWNhdXNlIHVzZXJsYW5kIGlzIG5vdCByZWFkaW5nIGZhc3QgZW5vdWdo
IHNvIEhXIGlzIGZvcmNlZCB0byBkcm9wIGRhdGE/DQo+IA0KPiA+DQo+ID4gQnV0IHdoYXQgY2Fu
IFVNRCBkbyB3aGVuIHRoYXQgaXMgc2V0Pw0KPiANCj4gTWVzYSBjYW4gaWdub3JlIHRoaXMgaWYg
dGhleSBkb24ndCBuZWVkIGl0Lg0KPiANCj4gPg0KPiA+IEkgd291bGQgcmF0aGVyIGhhdmUgYSB3
YXJuIG9uY2UgcHJpbnRlZCBvbiBkbWVzZywgc28gdGhlIGlzc3VlcyANCj4gPiBkb24ndCBnbyBz
aWxlbnQgYnV0IGl0IGRvbid0IG5lZWQgdG8gZ28gdG8gdGhlIHVBUEkuDQo+IA0KPiBkbWVzZyB3
YXJuIGlzIGxpa2VseSBub3QgYW4gb3B0aW9uIGJlY2F1c2UgaXQgd2lsbCB0cmlnZ2VyIGJ1Z3Mg
aW4gb3VyIENJLg0KPiANCj4gPg0KPiA+ID4gPg0KPiA+ID4gPiA+ICsJLyoqIEByZWNvcmRfc2l6
ZTogc2l6ZSBvZiBlYWNoIEVVIHN0YWxsIGRhdGEgcmVjb3JkICovDQo+ID4gPiA+ID4gKwlfX3Ux
NiByZWNvcmRfc2l6ZTsNCj4gPiA+ID4NCj4gPiA+ID4gVGhpcyBpcyBzdGF0aWMgaW5mb3JtYXRp
b24uIERvZXMgaXQgbmVlZCB0byBiZSBpbiBlYWNoIHBhY2tldCBoZWFkZXI/DQo+ID4gPiA+IEUu
Zy4gaXQgY2FuIGJlIHJldHVybmVkIHZpYSBEUk1fWEVfT0JTRVJWQVRJT05fSU9DVExfSU5GTyBh
ZnRlciANCj4gPiA+ID4gYSBFVSBTdGFsbCBzdHJlYW0gaGFzIGJlZW4gb3BlbmVkLg0KPiA+ID4g
Pg0KPiA+ID4gPiBbTUFDXSBzaW5jZSB0aGUgc2l6ZSBpcyBjb25zdGFudCwgaXQgc2VlbXMgYW4g
b3ZlcmhlYWQgaW5jbHVkaW5nIA0KPiA+ID4gPiB0aGUgaW5mbyBpbiBldmVyeSByZXBvcnQuDQo+
ID4NCj4gPiBkcm1feGVfZXVfc3RhbGxfZGF0YV94ZTIgc2hvdWxkIGJlIG9mIHRoZSBzYW1lIHNp
emUgYXMgcmVjb3JkX3NpemUgc28gaXQgY2FuIGFsc28gYmUgZHJvcHBlZC4NCj4gPg0KPiA+ID4g
Pg0KPiA+ID4gPiBUaGUgSU5GTyBkYXRhIHN0cnVjdCBjb3VsZCBhbHNvIGluY2x1ZGUgYSBjYXBh
YmlsaXRpZXMgZmllbGQuIFNvIA0KPiA+ID4gPiBpZiBuZXcgZmVhdHVyZXMgYXJlIGFkZGVkIHRv
IEVVIHN0YWxsIGluIHRoZSBmdXR1cmUsIHRoZXkgd291bGQgDQo+ID4gPiA+IGJlIGFkdmVydGl6
ZWQgdG8gdXNlciBzcGFjZSB1c2luZyB0aGUgY2FwYWJpbGl0aWVzIGZpZWxkLg0KPiA+ID4gPg0K
PiA+ID4gPiA+ICsJLyoqIEBudW1fcmVjb3JkczogbnVtYmVyIG9mIHJlY29yZHMgZm9sbG93aW5n
IHRoZSBoZWFkZXIgKi8NCj4gPiA+ID4gPiArCV9fdTE2IG51bV9yZWNvcmRzOw0KPiA+ID4gPg0K
PiA+ID4gPiBUaGlzIHdpbGwgbm90IGJlIG5lZWRlZCBpZiBqdXN0IHJldHVybiByYXcgRVUgU3Rh
bGwgZGF0YSB3aXRob3V0IA0KPiA+ID4gPiBoZWFkZXJzLiBPciBldmVuIG90aGVyd2lzZSBpdCBp
cyBwcm9iYWJseSBub3QgbmVlZGVkLCBpdCBpcyB0aGUgDQo+ID4gPiA+IHRvdGFsIHNpemUgb2Yg
cmV0dXJuZWQgZGF0YSBtaW51cyB0aGUgc2l6ZSBvZiB0aGUgaGVhZGVyLiANCj4gPiA+ID4gUHJv
dmlkZWQgd2UgcmV0dXJuIGFsbCBhdmFpbGFibGUgZGF0YS4NCj4gPg0KPiA+IFNhbWUgYXMgYWJv
dmUsIHdvdWxkIG5vdCBiZSBuZWVkZWQgaWYgZHJtX3hlX2V1X3N0YWxsX2RhdGFfeGUyIG1hdGNo
ZXMgc2FtcGxlcyBzaXplLg0KPiA+DQo+ID4gPiA+DQo+ID4gPiA+IFtNQUNdIHRoZSBLTUQgd2ls
bCBhbHdheXMgcmV0dXJuIGF0b21pYyB1bml0cyBvZiByZXBvcnRzLCByaWdodD8gDQo+ID4gPiA+
IFRoZW4gdGhpcyBpcyBub3QgbmVlZGVkLCBoYXZpbmcgVU1EIHRoZSBwb3NzaWJpbGl0eSB0byBx
dWVyeSANCj4gPiA+ID4gcmVwb3J0IHNpemUgd2hlbiBvcGVuaW5nIHRoZSBzdHJlYW0sIHRoZSBV
TUQgY2FuIGtub3cgaG93IG1hbnkgcmVwb3J0cyBhcmUgaW4gZWFjaCByZWFkLg0KPiA+ID4gPg0K
PiA+ID4gPiA+ICsJLyoqIEByZXNlcnZlZDogUmVzZXJ2ZWQgKi8NCj4gPiA+ID4gPiArCV9fdTE2
IHJlc2VydmVkWzRdOw0KPiA+ID4gPg0KPiA+ID4gPiBUaGlzIGNhbiBiZSBoYW5kbGVkIHZpYSAn
ZXh0ZW5zaW9ucycuIEFuZCBpZiBoZWFkZXJzIGNoYW5nZSB0aGV5IA0KPiA+ID4gPiBjYW4gYmUg
YWR2ZXJ0aXplZCBpbiBjYXBhYmlsaXRpZXMuDQo+ID4gPiA+DQo+ID4gPiA+ID4gK307DQo+ID4g
PiA+ID4gKw0KPiA+ID4gPiA+ICAjaWYgZGVmaW5lZChfX2NwbHVzcGx1cykNCj4gPiA+ID4gPiAg
fQ0KPiA+ID4gPiA+ICAjZW5kaWYNCj4gPiA+ID4gPiAtLQ0KPiA+ID4gPiA+IDIuNDEuMA0KPiA+
ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+IFRoYW5rcy4NCj4gPiA+ID4gLS0NCj4gPiA+ID4gQXNo
dXRvc2gNCj4gPg0K
