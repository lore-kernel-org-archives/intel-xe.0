Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB05E6F08E
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 22:00:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E4210E058;
	Fri,  1 Nov 2024 22:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lGxy25Wl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FA510E058
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 22:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730498450; x=1762034450;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R1GhFgvrHmIFNcePkewxJDkl89B7xta/pXGEOHnBFyI=;
 b=lGxy25WljZs0KHWtXWRGUCGneUBhN5+DvItQoNKpFK5EqLei3TuIpCJ3
 v1yLAvo4YSrn6ErH/1xC+/+g86vQyiGFAOmmz3cBRI364Gx6U7WZcqNAC
 L2TZad/ESTnO1JJK3//uoJ7Ga0ZqSeTc+OwnEANPQY1J7nguO3t2TQunN
 vqPUKY+uF3R3+JTNAo0kAD5hCz1vGwaDCS8rB2AiNRUARDbJi01SF72qD
 uEWL3YacXlP8tuUv2Zr8nIlq3g1sabKYm6r1XhkJgMQMRdWiHLXR70hAa
 4pqEDZ7DdY4CDoW7XLu/qIotb1fWkSeKvu+eJW3kiLomIpGeOzfyO0Avs g==;
X-CSE-ConnectionGUID: zq6AZeW8T92oF2Z4IEsS/g==
X-CSE-MsgGUID: 21OVsjtaQJek2pWV5gA0aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47727198"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="47727198"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 15:00:50 -0700
X-CSE-ConnectionGUID: JLfLsHbPSoWLu0M06Qh4ng==
X-CSE-MsgGUID: G1Ao1zxXS8C3AM5aJsVlAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; d="scan'208";a="83000652"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2024 15:00:49 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Nov 2024 15:00:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 1 Nov 2024 15:00:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 1 Nov 2024 15:00:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UOzlXr7MYMmDMtE/CaqkDmJnLPqECBPDKwGzKAsmcwLD2GwQuK91yL0S1YotT0X1DdlvLjhEQK8piSyK12u7oftAXbOMfN+TJZosigmj5WSLG2QdgPiAxuEzZkL7uTESM1yRo5igSd2yn1d/BGnt5w0csCk8jiz3sstpgUHpjGyl+x0nkFeER3RmqVFSyg60uq5O2KUvjjjM0E7OCeEpCy8ZeSWBt5q+cqYIdwKt/Ei+m/ilXrWvgGylvH2PxHsA46KuaPPo1rv8VWywgzgrVaXFB4Cg35+5upsCg+38v8aF25Zkt54rIbbRrcvJKnA0Qsz9RkmM1q00e0/B/hYaGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1GhFgvrHmIFNcePkewxJDkl89B7xta/pXGEOHnBFyI=;
 b=I243fNYO+DZE/wy10rN9gGwWc+ihTlPz/3TzxvfOr4EOyU6UKu0LQHP/WjmGit3ql1smyKqjNLxO3i9G0QMMKDVBvoVQiW5EHVblxpf6bNMEDNfZGlonknXhqlx0cv1SjE/2+ohtIpPqabDCL2+XQPevcXE9ZQdIr/6ymf9kZPS0l9cGE9a/L+6FGhF2OVhkhSpjdr11c27rw0BTGVFWunV93s9N2HRMQ3cA5+bFDmnHOwXMrUw7Pfzj97Kv12dBUT5GR96V4BNpgWtmz+p2Hwgry/yQeNXTzVG9BeY4gR0FuCFH3jJTYjKGYbPtW86aRSlKFjodU4mxvhScZ6OS0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB5830.namprd11.prod.outlook.com (2603:10b6:510:129::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Fri, 1 Nov
 2024 22:00:45 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8114.023; Fri, 1 Nov 2024
 22:00:45 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/xe_guc_ads: Add whitelist registers to write list
Thread-Topic: [PATCH] drm/xe/xe_guc_ads: Add whitelist registers to write list
Thread-Index: AQHbLIh6UcCqcibekk20ZmZZBCafgLKiw3iAgAAKRuCAAA5RgIAAAueggAAYqwCAAABB8A==
Date: Fri, 1 Nov 2024 22:00:45 +0000
Message-ID: <CH0PR11MB544446DF9387BC1B7AE57002E5562@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241101180403.97272-1-jonathan.cavitt@intel.com>
 <6a317425-bf13-4269-b510-04a765c3cc23@intel.com>
 <CH0PR11MB5444581AA95D474000743B9CE5562@CH0PR11MB5444.namprd11.prod.outlook.com>
 <80cb07e4-8049-4320-814f-7535b20e1145@intel.com>
 <CH0PR11MB5444240B935D3ABF926E2156E5562@CH0PR11MB5444.namprd11.prod.outlook.com>
 <b32a1ea8-3a2a-4ba8-a195-4babca8e5c8c@intel.com>
In-Reply-To: <b32a1ea8-3a2a-4ba8-a195-4babca8e5c8c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB5830:EE_
x-ms-office365-filtering-correlation-id: c8c366ed-b8f9-44e8-e631-08dcfac0a2fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RlF4c3hPTW05dEFHNkozWmxnRjJKcStQTnhpNnNkM0tIUkQwN3g1VE5MTzcr?=
 =?utf-8?B?dUxJNzJBUjZZWWswZFEwTC9xL2wxQklQcVRlUDYxcWNIVnJ0RUFVSjVTbWV6?=
 =?utf-8?B?eDE4cDdNelNxOHpQVWo4OWFYU0UxRG9BL1hlVkxaM1hZYmxoclF5YldCYkNs?=
 =?utf-8?B?MGt5dUozZ2RvSkl5ZWdYQkx5RDFlZGhUeGZ3YTAycTZYQ3NrZ2d5R1Q3d3RK?=
 =?utf-8?B?NmJ5MDFpLzkzdU00cE1VSHQvcW5rVW1MWDRXWGdtWDJESFZMdi9VVXBYR0lp?=
 =?utf-8?B?NWVHZEFqTStOVnFSMlVNdzRvN2NqR0dsNWo2ZEg2bnMyaEpnRVJiSEhrU250?=
 =?utf-8?B?MHNtRU9PYWc4YkwwaWU2ZGREK1I3VHBOaGRUSkMyLzh1L1BCU0RGZ251eWJh?=
 =?utf-8?B?ekZ5MXlyMEdKb3JGbG95Q0JBd0llRFZvYmpaZTBnN0RYcVVlS2YyR1d4Zm00?=
 =?utf-8?B?bFhTcnN4Wm5XZ1paVHdBUFB0K1JvRDhnNUx2ejZ1RnpzaDhZbE5VOEN2akRr?=
 =?utf-8?B?MTdSMzVYKzFqcFBmTFFJYkp4WnhBR0ZUOGl5NTJNdU14cC8zbW8ybVNLTXp5?=
 =?utf-8?B?N1ZNNjJlRXowTExEMHR2QVN6dk5jc21lT21raG1OaUpTVTM5V3A4dk4rSlY3?=
 =?utf-8?B?WkZadWpFaGhNZ0lIcDlsZVJWZmZQaWRsUU1yNDc2c3FTd3c5cVA5UXNFaUJU?=
 =?utf-8?B?ZFZqUXo1UW00RnhvZkdhSkVTSkVIbjJnaWlobSswQ1JEb1ZXbEtDS2pQMkNR?=
 =?utf-8?B?SExUTFd6VFQ2UGJiVEpOTFhrUVd4SlBzdFVPK0gwc2I2OEJhS0c5K0pYUlhS?=
 =?utf-8?B?RzhJSldKZnpWYkN0emhiTUp4M3ZuYlhIYmdoZ29NbXVRSWI4VnYwcmdlMVdB?=
 =?utf-8?B?MXNTRnhKcEZVRVVXd3QxS2NvKzN6allTNS90Wmt5T0FJTkZQWWRjZm51VW5M?=
 =?utf-8?B?WXpOakZ3bkkrYk1vMW40Yzl4eXMzNGE5d3pZTHB3SDNYdWFLTVRIc3pPRWll?=
 =?utf-8?B?Qnk5SGtDWjc1dngvbXAxaXd3aHcwa29rWkVwWVlVdHk5OHc2TmQ5S0lHYkh1?=
 =?utf-8?B?TGtjQmVOcERBajB6Y25ZZDZ2eFpuN3h1ZE1IWHJnbXhoT3J5cXptZ25rRVhO?=
 =?utf-8?B?TUJIcWg2K0U0S2NoeXNEeWJKcDc0cnJFL29pdWJBR1Fkb2JFNk03YnlPT1lw?=
 =?utf-8?B?YjhFeUNtV3ZWRXlJS0s0cytKR0lmd2xZbzhkWkx1cmVVV01idTNGZEdjTUZm?=
 =?utf-8?B?VDZNdGdqVUtjWEJqQnhkeS8vQTFvR0VPN3F6UTl0OXQ5dlVFdHN3WVl6Z0Y5?=
 =?utf-8?B?Q0NTMWFUQVlQcGxUWm9zdUNjeHBHamhZYnhqODVyWjJYSUtaZXNQYzI4L3RC?=
 =?utf-8?B?ZmN6YTFJN3Urd1kxcDVwTU9rcTh1bG5qQTBVUjRHQVNIbzYvWEQ4QW5aOENN?=
 =?utf-8?B?akRZbWNacUZJVHlTcmtDb3FTMXVwRnhSN2IxVi91aUkyOWdnSVZmUFhheFVW?=
 =?utf-8?B?amVsK3J1T2lPLzZMcy9tNEFzN3BSVVhqM1ZUYVgxNTY5dHU1VG8vcVNtOG5L?=
 =?utf-8?B?a0x1aEkzUWZOdXZwcjJNdks3MTB4UFNBQ3RVdkdNWjNDOUI0elpUREU3aXlP?=
 =?utf-8?B?OVFxZk5QY1hWSSt0K08zT1FNMzRuZXR5RFlpWFR2dWoxWlRUNmtoSUhjN2ts?=
 =?utf-8?B?ZzhSeDlBZzdCYjlQNmFBNkhLNVRCeHVLT3JHZHM1bkVoeVpsYnV5amZDTTBn?=
 =?utf-8?Q?Tv0dVl1s0+CWyR8x0T75sTysXmPAcTLf4cJuJGF?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDg4cVV6WU1vdDIrT0NmVFpPNFlYZWFybnEwdHZHN3lQRDRKWEx5UGFoMDJS?=
 =?utf-8?B?WUpGOFRpLzZMMmNlSnUwUkFwcC80SzNJZUJ1K3VreEtsZW1vQTRVUFp6UVNK?=
 =?utf-8?B?MU1HcmtyM2ZYWmVGa0laTGVFMHRjOE5BVHpTZnNrcFBQRkNIRnNHMFJEZnA0?=
 =?utf-8?B?OE1KbGp6bGZyYU50RE1DdkVuNWgvOFgwbGpNVldXOXdwM3Y1N29rVmhTWXp4?=
 =?utf-8?B?bE15OXo4MU5qQ2U3cXhtam9wdG1lQ2hjZFRIWnB6dTQ0VFRSS1VjWmY3RGpH?=
 =?utf-8?B?QVNFSUZWa3I1MWV3c2IxblFPSkhXc0QrSExEa1dGMi9renRkVWhIdmhNaCtK?=
 =?utf-8?B?MEN3QmhueCtNWTVBbU40M3Fjd1ZBRnFhN0xGd25RVVlySXpxYjNIQ1RjZUNv?=
 =?utf-8?B?SlFEVHJDdHpLUmZsVUo4bGNaWWNZaTBpVU5GZTM3aEMvWlI3ZngzbDd4Mjhy?=
 =?utf-8?B?MWQ2RHBSd1g2TnlmWlg5N1NwUDNoeTdrT0hicjNLNmhPSnFXSjU1a3BnanRR?=
 =?utf-8?B?V0krTVNLRU8vTkI2ZUVIRDZOenduenZ1dXRrUVFIdGpVVEl3VnQ3VVc3ODY0?=
 =?utf-8?B?aHhHUmZQb3FRRVBvblRVNWFUZ0g2bTMrVEtjaksyTnVpTGJXOVVtTWhFc05K?=
 =?utf-8?B?RzVYWm1wMmRNT1dpNHo1YmlxbkR2WHgrVHk1M21WY1lGZ1hqcmpNb1dPckFM?=
 =?utf-8?B?aE9GdXMyZi92a2NYdHlndUtHMGJJR3hlaE5wSUEzNHZmV2JlWnBjM0h6NTd5?=
 =?utf-8?B?blFkbnpOYWFSTjZLbUZsTjlHUHBuODhkVW5iNzl1cnNteVUvYVJ2YUtkUUdE?=
 =?utf-8?B?ellTeFpEZ1owNzF4ZnVoZGVSbXVEUFVheGc2YjRsYm9Qa1BsUm1Vd0tDUGlt?=
 =?utf-8?B?ZzNjbGJnODdYc0NFcUNFWWpNNVR5L2E4UzJJNWlQcDYvNXVadFBQMWFVVHY3?=
 =?utf-8?B?ZXE0STdvekNGVzU2elNsZ1JDNnJNdHc0OHRjWDhYMy9lYTJCU3RIaEVJdmZu?=
 =?utf-8?B?dGZLSFQwNHZYQldJV1Exd2RuTHJ2ZC80UFZaRGFQb1YwRHhLRDNmNkl4QjV0?=
 =?utf-8?B?N25VRm10bzYvRytGK2NiSDQwMG5TcnNUeW9TSVV2WWgyK2trZTZHUW03R3Q2?=
 =?utf-8?B?TlNYL2NieE5idUc5dnptY1pBTG5od0Y3d2NEZklSaDBUL08xQk1xOEhJR2I3?=
 =?utf-8?B?TXh5RVppSlhtZlB0T0RrUGRCZkhOUXJqVW9jNTFxTnpKYkdtdG9VSXgwZkw1?=
 =?utf-8?B?SGZERG9sNVJIYzVDTlZxOVlzNmNPZTRjTFh6ZWQrOUtuR3FlLzlCaDVXdldN?=
 =?utf-8?B?cEd3UEZHdWJWZCs4Rno1MFN0NmpMZ3cvZ3V0a3MrVDZKeDhTZ2d6MlJaY0VU?=
 =?utf-8?B?TWg3K0ZOSmlrSU1MSlBGZEV4ZDE5WTlPU3AxY0NJazc4SVREQmR0REd3amh2?=
 =?utf-8?B?T3FlNHJzUkxySTMwS0FCWk5CQ1pVMThhV0VucGkyOHFyMW1FTUpnQ2FHVmpx?=
 =?utf-8?B?U1BQOE9oZHRwMloyNE02L3lSM2hJbGhpUVo2VFNNUHBoMm1tQkprd25QSEFZ?=
 =?utf-8?B?dWppMFFZOXN2Y3NzZjlRTmNmdDJFNWJDNGFiWlV1MEJOZnZFMTlkb010V3Ev?=
 =?utf-8?B?RXg3VXRaSFV4SHM5OWFlbHFuV1VVUWdmSEl0cHY5bjRoUWFCdVAzMlErRmxY?=
 =?utf-8?B?K1JKc2V0SFlvVER6NElZakN5c285SmFNUFd2TGloaVlCNEk4S0xMdVVsMzMr?=
 =?utf-8?B?Vi9hQXUzNE5XbkE1MDVoTWlEdVB2SDA4TTFUaWxRNDJDL3V1ZkFSZjBKaFpJ?=
 =?utf-8?B?NVVEdUJaM0M5UENQY2JjbjFrejQ1SDJjWmNQelh0WlVFV2dCbVVrNm04TzJV?=
 =?utf-8?B?ZHFSYzdJNGZQM1BvUjBzSkFtYTBHK3lXZ3IwN010YzJWajVBM0VYem1QYUNy?=
 =?utf-8?B?bE44WDdXMk9iVjhZb3I2eEw1YTI5QXMyVks5QVdqNXRRVzFmVHVLbWtRSHJj?=
 =?utf-8?B?Z3ZNNE1lNmRJVlpQcVFlL0FlcEptQjZBdktJc0YrZElMNFpaTmRIbXc2NWNR?=
 =?utf-8?B?NGMvbFc4MnB6b292STJRWHVIWE5iaG9kT1lEQ1JBalQrVXJZOHpFdGVZWmF4?=
 =?utf-8?Q?WWebsktc76+o373mdP+NWPgH9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c366ed-b8f9-44e8-e631-08dcfac0a2fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2024 22:00:45.4551 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CCXs0N9g7Xer4w0Ih6F5qMPj1bIGbLaZ9k4ROlV4uHifDDTKW75felP9wYW9nKyLi3kmFMzWZm2V2T1qbzQzDMO5RRWq7rXhJrWrIovnDYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5830
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEhhcnJpc29uLCBKb2huIEMgPGpvaG4u
Yy5oYXJyaXNvbkBpbnRlbC5jb20+IA0KU2VudDogRnJpZGF5LCBOb3ZlbWJlciAxLCAyMDI0IDI6
NTMgUE0NClRvOiBDYXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPjsg
aW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogR3VwdGEsIHNhdXJhYmhnIDxzYXVy
YWJoZy5ndXB0YUBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFsZXguenVvQGludGVsLmNvbT47IE5l
cmxpZ2UgUmFtYXBwYSwgVW1lc2ggPHVtZXNoLm5lcmxpZ2UucmFtYXBwYUBpbnRlbC5jb20+OyBS
b3BlciwgTWF0dGhldyBEIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPjsgRGUgTWFyY2hpLCBM
dWNhcyA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPjsgRGl4aXQsIEFzaHV0b3NoIDxhc2h1dG9z
aC5kaXhpdEBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0veGUveGVfZ3VjX2Fk
czogQWRkIHdoaXRlbGlzdCByZWdpc3RlcnMgdG8gd3JpdGUgbGlzdA0KPiANCj4gT24gMTEvMS8y
MDI0IDEzOjQ3LCBDYXZpdHQsIEpvbmF0aGFuIHdyb3RlOg0KPiA+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4gRnJvbTogSGFycmlzb24sIEpvaG4gQyA8am9obi5jLmhhcnJpc29uQGlu
dGVsLmNvbT4NCj4gPiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDEsIDIwMjQgMToxNCBQTQ0KPiA+
IFRvOiBDYXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPjsgaW50ZWwt
eGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gQ2M6IEd1cHRhLCBzYXVyYWJoZyA8c2F1cmFi
aGcuZ3VwdGFAaW50ZWwuY29tPjsgWnVvLCBBbGV4IDxhbGV4Lnp1b0BpbnRlbC5jb20+OyBOZXJs
aWdlIFJhbWFwcGEsIFVtZXNoIDx1bWVzaC5uZXJsaWdlLnJhbWFwcGFAaW50ZWwuY29tPjsgUm9w
ZXIsIE1hdHRoZXcgRCA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT47IERlIE1hcmNoaSwgTHVj
YXMgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT47IERpeGl0LCBBc2h1dG9zaCA8YXNodXRvc2gu
ZGl4aXRAaW50ZWwuY29tPg0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS94ZS94ZV9ndWNf
YWRzOiBBZGQgd2hpdGVsaXN0IHJlZ2lzdGVycyB0byB3cml0ZSBsaXN0DQo+ID4+IE9uIDExLzEv
MjAyNCAxMjo0MCwgQ2F2aXR0LCBKb25hdGhhbiB3cm90ZToNCj4gPj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+ID4+PiBGcm9tOiBIYXJyaXNvbiwgSm9obiBDIDxqb2huLmMuaGFycmlz
b25AaW50ZWwuY29tPg0KPiA+Pj4gU2VudDogRnJpZGF5LCBOb3ZlbWJlciAxLCAyMDI0IDExOjQ2
IEFNDQo+ID4+PiBUbzogQ2F2aXR0LCBKb25hdGhhbiA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNv
bT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+Pj4gQ2M6IEd1cHRhLCBzYXVy
YWJoZyA8c2F1cmFiaGcuZ3VwdGFAaW50ZWwuY29tPjsgWnVvLCBBbGV4IDxhbGV4Lnp1b0BpbnRl
bC5jb20+OyBOZXJsaWdlIFJhbWFwcGEsIFVtZXNoIDx1bWVzaC5uZXJsaWdlLnJhbWFwcGFAaW50
ZWwuY29tPjsgUm9wZXIsIE1hdHRoZXcgRCA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT47IERl
IE1hcmNoaSwgTHVjYXMgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT47IERpeGl0LCBBc2h1dG9z
aCA8YXNodXRvc2guZGl4aXRAaW50ZWwuY29tPg0KPiA+Pj4gU3ViamVjdDogUmU6IFtQQVRDSF0g
ZHJtL3hlL3hlX2d1Y19hZHM6IEFkZCB3aGl0ZWxpc3QgcmVnaXN0ZXJzIHRvIHdyaXRlIGxpc3QN
Cj4gPj4+PiBPbiAxMS8xLzIwMjQgMTE6MDQsIEpvbmF0aGFuIENhdml0dCB3cm90ZToNCj4gPj4+
Pj4gV2hlbiBwZXJmb3JtaW5nIGEgZ3VjX21taW9fcmVnc2V0X3dyaXRlLCB3ZSBhZGQgYWxsIHRo
ZSByZWdpc3RlcnMgaW4gdGhlDQo+ID4+Pj4+IHJlZ19zciBsaXN0IHRvIHRoZSBzYXZlL3Jlc3Rv
cmUgbGlzdCwgYnV0IGRvIG5vdCBkbyB0aGUgc2FtZSBmb3IgdGhlDQo+ID4+Pj4+IHdoaXRlbGlz
dCByZWdpc3RlcnMuICBBZGQgdGhlbSBpbi4NCj4gPj4+Pj4NCj4gPj4+Pj4gQ2xvc2VzOiBodHRw
czovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL3hlL2tlcm5lbC9pc3N1ZXMvMjI0OQ0KPiA+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0aGFuLmNhdml0dEBpbnRl
bC5jb20+DQo+ID4+Pj4+IENDOiBMdWNhcyBkZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVs
LmNvbT4NCj4gPj4+Pj4gQ0M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+
DQo+ID4+Pj4+IENDOiBKb2huIEhhcnJpc29uIDxqb2huLmMuaGFycmlzb25AaW50ZWwuY29tPg0K
PiA+Pj4+PiBDQzogVW1lc2ggTmVybGlnZSBSYW1hcHBhIDx1bWVzaC5uZXJsaWdlLnJhbWFwcGFA
aW50ZWwuY29tPg0KPiA+Pj4+PiBDQzogQXNodXRvc2ggRGl4aXQgPGFzaHV0b3NoLmRpeGl0QGlu
dGVsLmNvbT4NCj4gPj4+Pj4gLS0tDQo+ID4+Pj4+ICAgICBkcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3VjX2Fkcy5jIHwgMTEgKysrKysrKysrKy0NCj4gPj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCAx
MCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4+Pj4+DQo+ID4+Pj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Fkcy5jIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d1Y19hZHMuYw0KPiA+Pj4+PiBpbmRleCA5NDMxNDZlNWI0NjAuLjJmYzZiMWNjYzhmYyAx
MDA2NDQNCj4gPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19hZHMuYw0KPiA+
Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Fkcy5jDQo+ID4+Pj4+IEBAIC0y
MzksOSArMjM5LDEyIEBAIHN0YXRpYyBzaXplX3QgY2FsY3VsYXRlX3JlZ3NldF9zaXplKHN0cnVj
dCB4ZV9ndCAqZ3QpDQo+ID4+Pj4+ICAgICAJZW51bSB4ZV9od19lbmdpbmVfaWQgaWQ7DQo+ID4+
Pj4+ICAgICAJdW5zaWduZWQgaW50IGNvdW50ID0gMDsNCj4gPj4+Pj4gICAgIA0KPiA+Pj4+PiAt
CWZvcl9lYWNoX2h3X2VuZ2luZShod2UsIGd0LCBpZCkNCj4gPj4+Pj4gKwlmb3JfZWFjaF9od19l
bmdpbmUoaHdlLCBndCwgaWQpIHsNCj4gPj4+Pj4gICAgIAkJeGFfZm9yX2VhY2goJmh3ZS0+cmVn
X3NyLnhhLCBzcl9pZHgsIHNyX2VudHJ5KQ0KPiA+Pj4+PiAgICAgCQkJY291bnQrKzsNCj4gPj4+
Pj4gKwkJeGFfZm9yX2VhY2goJmh3ZS0+cmVnX3doaXRlbGlzdC54YSwgc3JfaWR4LCBzcl9lbnRy
eSkNCj4gPj4+Pj4gKwkJCWNvdW50Kys7DQo+ID4+Pj4+ICsJfQ0KPiA+Pj4+PiAgICAgDQo+ID4+
Pj4+ICAgICAJY291bnQgKz0gQURTX1JFR1NFVF9FWFRSQV9NQVggKiBYRV9OVU1fSFdfRU5HSU5F
UzsNCj4gPj4+Pj4gICAgIA0KPiA+Pj4+PiBAQCAtNzI3LDYgKzczMCwxMiBAQCBzdGF0aWMgdW5z
aWduZWQgaW50IGd1Y19tbWlvX3JlZ3NldF93cml0ZShzdHJ1Y3QgeGVfZ3VjX2FkcyAqYWRzLA0K
PiA+Pj4+PiAgICAgCXhhX2Zvcl9lYWNoKCZod2UtPnJlZ19zci54YSwgaWR4LCBlbnRyeSkNCj4g
Pj4+Pj4gICAgIAkJZ3VjX21taW9fcmVnc2V0X3dyaXRlX29uZShhZHMsIHJlZ3NldF9tYXAsIGVu
dHJ5LT5yZWcsIGNvdW50KyspOw0KPiA+Pj4+PiAgICAgDQo+ID4+Pj4+ICsJaSA9IDA7DQo+ID4+
Pj4+ICsJeGFfZm9yX2VhY2goJmh3ZS0+cmVnX3doaXRlbGlzdC54YSwgaWR4LCBlbnRyeSkNCj4g
Pj4+Pj4gKwkJZ3VjX21taW9fcmVnc2V0X3dyaXRlX29uZShhZHMsIHJlZ3NldF9tYXAsDQo+ID4+
Pj4+ICsJCQkJCSAgUklOR19GT1JDRV9UT19OT05QUklWKGh3ZS0+bW1pb19iYXNlLCBpKyspLA0K
PiA+Pj4+PiArCQkJCQkgIGNvdW50KyspOw0KPiA+Pj4+PiArDQo+ID4+Pj4gVGhlIGNvZGUgdGhh
dCBhY3R1YWxseSB3cml0ZXMgdG8gdGhlIE5PTlBSSVYgcmVnaXN0ZXJzDQo+ID4+Pj4gKHhlX3Jl
Z19zcl9hcHBseV93aGl0ZWxpc3QoKSBpbiB4ZV9yZWdfc3JjLmMpIGV4cGxpY2l0bHkgY2xlYXJz
IGFsbCB0aGUNCj4gPj4+PiB1bnVzZWQgcmVnaXN0ZXJzIHdpdGggYSBjb21tZW50IG9mICJjbGVh
ciB0aGUgcmVzdCBpbiBjYXNlIG9mIGdhcmJhZ2UiLg0KPiA+Pj4gVGhlIGNvZGUgaW4geGVfcmVn
X3NyX2FwcGx5X3doaXRlbGlzdCBjYWxscyB4ZV9tbWlvX3dyaXRlMzIgdG8gd3JpdGUgdGhlDQo+
ID4+PiByZWdpc3RlcnMsIHdoZXJlYXMgdGhlIGNvZGUgaW4gZ3VjX21taW9fcmVnc2V0X3dyaXRl
IHVzZXMgeGVfbWFwX21lbWNweV90bw0KPiA+Pj4gaW50ZXJuYWxseS4gIFdoaWxlIHRoZSBmb3Jt
ZXIgc2VlbXMgdG8gYmUgd3JpdGluZyB0byB0aGUNCj4gPj4+IHhlX21taW9fYWRqdXN0ZWRfYWRk
cihtbWlvLCByZWcuYWRkcikgKyBtbWlvLT5yZWdzLCB0aGUgbGF0dGVyIGFwcGVhcnMgdG8gYmUN
Cj4gPj4+IHdyaXRpbmcgdG8gSU9TWVNfTUFQX0lOSVRfT0ZGU0VUKGFkc190b19tYXAoYWRzKSwg
Z3VjX2Fkc19yZWdzZXRfb2Zmc2V0KGFkcykuDQo+ID4+Pg0KPiA+Pj4gSSdtIG5vdCBwYXJ0aWN1
bGFybHkgd2VsbC12ZXJzZWQgaW4gdGhlc2UgZnVuY3Rpb25zLCBidXQgaXQgbG9va3MgdG8gbWUg
dGhhdCB0aGVzZQ0KPiA+Pj4gdHdvIGZ1bmN0aW9ucyB3cml0ZSB0byBkaWZmZXJlbnQgbG9jYXRp
b25zIGFuZCB0aHVzIHdvdWxkIG5vdCBpbXBhY3QgZWFjaCBvdGhlci4NCj4gPj4+IE9yLCBpbiBv
dGhlciB3b3JkcywgSSBkb24ndCB0aGluayB0aGUgZ2FyYmFnZSB3ZSdyZSBjbGVhcmluZyBpbiB4
ZV9yZWdfc3JfYXBwbHlfd2hpdGVsaXN0DQo+ID4+PiBpcyB0aGUgc2FtZSBhcyB0aGUgZGF0YSB3
ZSdyZSB3cml0aW5nIGluIGd1Y19tbWlvX3JlZ3NldF93cml0ZS4NCj4gPj4gTm8uDQo+ID4+DQo+
ID4+IFRoZSBhcHBseSBmdW5jdGlvbiBpcyB3cml0aW5nIHRoZSBsaXN0IG9mIHdoaXRlbGlzdGVk
IHJlZ2lzdGVycyBpbnRvIHRoZQ0KPiA+PiB3aGl0ZWxpc3QgcmVnaXN0ZXJzIHRoZW1zZWx2ZXMu
IFRoZSBHdUMgQURTIGNvZGUgaXMgYWRkaW5nIGxpc3RzIG9mDQo+ID4+IHJlZ2lzdGVycyB0byB0
aGUgc2F2ZS9yZXN0b3JlIGxpc3QgZm9yIGFuIGVuZ2luZSByZXNldC4NCj4gPj4NCj4gPj4gU3Bl
Y2lmaWNhbGx5IHdpdGggcmVnYXJkcyB0byB0aGUgTk9OUFJJViByZWdpc3RlcnMsIHRoZXNlIGFy
ZSBhIHNldCBvZg0KPiA+PiByZWdpc3RlcnMgd2hpY2ggaG9sZCB0aGUgYWRkcmVzc2VzIG9mIG90
aGVyIHJlZ2lzdGVycy4gV2hlbiBzZXQsIHRoZXkNCj4gPj4gYWxsb3cgdW50cnVzdGVkIHVzZXJz
IHRvIGFjY2VzcyB0aG9zZSAnb3RoZXInIHJlZ2lzdGVycyB3aGljaCBvdGhlcndpc2UNCj4gPj4g
d291bGQgYmUgb2ZmIGxpbWl0cy4gVGhlIHdoaXRlbGlzdCBjb2RlIGlzIHNldHRpbmcgdXAgdGhh
dCBsaXN0LiBFLmcuDQo+ID4+IGFkZGluZyB0aGUgT0EgcmVnaXN0ZXJzIHRvIHRoZSB3aGl0ZWxp
c3QgdG8gYWxsb3cgYXBwbGljYXRpb25zIHRvIHVzZQ0KPiA+PiB0aGUgT0EgbWVjaGFuaXNtcy4g
U28gaXQgZG9lcyAiTk9OUFJJVl9SRUcoeCkgPSBPQV9SRUciLiBJdCBhbHNvIGRvZXMNCj4gPj4g
Ik5PTlBSSVYoeCsxIC4uIG1heCkgPSBOT19PUCIuIFRoYXQgaXMgdG8gZW5zdXJlIGFsbCB0aGUg
Tk9OUFJJVg0KPiA+PiByZWdpc3RlcnMgYXJlIHNldCB0byBzb21ldGhpbmcgdmFsaWQgYW5kIG5v
dCB1bmluaXRpYWxpc2VkLiBPdGhlcndpc2Ugd2UNCj4gPj4gcG90ZW50aWFsbHkgaGF2ZSB1bmlu
dGVuZGVkIHJlZ2lzdGVycyBiZWluZyB3aGl0ZWxpc3RlZCBhbmQgdXNlcnMgYXJlDQo+ID4+IGFi
bGUgdG8gYWNjZXNzIHRoaW5ncyB0aGV5IHNob3VsZG4ndC4gV2hlcmVhcywgc2V0dGluZyB0aGVt
IGFsbCB0byBOT19PUA0KPiA+PiBtZWFucyB3ZSBhcmUgZ3JhbnRpbmcgYWxsIHVzZXJzIGFjY2Vz
cyB0byB0aGUgTk9fT1AgcmVnaXN0ZXIgd2hpY2ggdGhleQ0KPiA+PiBhbHJlYWR5IGhhZCBhY2Nl
c3MgdG8gYW55d2F5Lg0KPiA+Pg0KPiA+PiBDb21wbGV0ZWx5IHNlcGFyYXRlIHRvIHRoYXQsIHRo
ZSBHdUMgQURTIGNvZGUgaXMgY3JlYXRpbmcgYSBsaXN0IG9mDQo+ID4+IHJlZ2lzdGVycyB3aGlj
aCBHdUMgd2lsbCBzYXZlIGFuZCByZXN0b3JlIGFjcm9zcyBhbiBlbmdpbmUgcmVzZXQuIFRoZXNl
DQo+ID4+IGFyZSBhbGwgdGhlIHJlZ2lzdGVycyB3aGljaCBnZXQgdHJhc2hlZCBieSB0aGUgcmVz
ZXQgYnV0IHdoaWNoIGFyZSBub3QNCj4gPj4gc2F2ZWQgYW5kIHJlc3RvcmVkIGFzIHBhcnQgb2Yg
YSBydW5uaW5nIGNvbnRleHQuIFRoZSBOT05QUklWIHJlZ2lzdGVycw0KPiA+PiBhcHBhcmVudGx5
IGZhbGwgaW50byB0aGlzIGNhdGVnb3J5LiBTbyB3ZSBuZWVkIHRvIHRlbGwgR3VDIHRvIHByZXNl
cnZlDQo+ID4+IHRoZWlyIGNvbnRlbnQgYWNyb3NzIGEgcmVzZXQuIE90aGVyd2lzZSwgYWZ0ZXIg
dGhlIHJlc2V0LCB0aGUgd2hpdGVsaXN0DQo+ID4+IHdpbGwgYmUgbG9zdC4gQnV0LCB0aGUgcmVz
ZXQgc3RhdGUgb2YgdGhvc2UgcmVnaXN0ZXJzIGlzICd1bmRlZmluZWQnIGFzDQo+ID4+IG9wcG9z
ZWQgdG8gJ05PLU9QJyBhcyBzdWdnZXN0ZWQgYnkgdGhlIHdoaXRlbGlzdCBjb2RlLiBUaGF0IG1l
YW5zIHRoYXQNCj4gPj4gYW55IE5PTlBSSVYgcmVnaXN0ZXIgd2hpY2ggaXMgbm90IHBhcnQgb2Yg
dGhlIHJlc2V0IHNhdmUvcmVzdG9yZSBsaXN0DQo+ID4+IHdpbGwgYmUgbm8gbG9uZ2VyIGJlIHNl
dCB0byBOTy1PUCBhZnRlciBhIHJlc2V0LiBJbnN0ZWFkLCBpdCB3aWxsIGJlDQo+ID4+IGdpdmlu
ZyB1c2VycyBhY2Nlc3MgdG8gc29tZSByYW5kb20gcmVnaXN0ZXIgYWdhaW4uIEFuZCB3ZSBkbyBu
b3Qgd2FudCB0bw0KPiA+PiBkbyB0aGF0Lg0KPiA+Pg0KPiA+IE9rYXkuICBJdCBzb3VuZHMgdG8g
bWUgdGhhdCB3ZSBhcmVuJ3QgcGVyZm9ybWluZyB4ZV9yZWdfc3JfYXBwbHlfd2hpdGVsaXN0DQo+
ID4gZHVyaW5nIGFuIGVuZ2luZSByZXNldCwgYmVjYXVzZSB0aGF0IGZ1bmN0aW9uIHNob3VsZCBi
ZSBzZXR0aW5nIHRoZSByZWdpc3RlcnMNCj4gPiB0byBhIGRlZmluZWQgcmVzZXQgc3RhdGUsIHJh
dGhlciB0aGFuICJ1bmRlZmluZWQiLiAgU2hvdWxkIHdlIGJlIGNhbGxpbmcgdGhhdA0KPiA+IGZ1
bmN0aW9uIGR1cmluZyBndWNfbW1pb19yZWdzZXRfd3JpdGU/DQo+ID4NCj4gPiBJIHRlc3RlZCBp
dCBhbmQgaXQgZGlkbid0IHdvcmsgb24gbXkgZW5kLCBidXQgSSBtaWdodCBiZSBtaXNzaW5nIHNv
bWV0aGluZy4NCj4gPiAtSm9uYXRoYW4gQ2F2aXR0DQo+IE5vLiBUaGUgS01EIGRvZXMgbm90IGV4
ZWN1dGUgYW55IGNvZGUgb24gYW4gZW5naW5lIHJlc2V0LiBUaGUgcmVzZXQgaXMgDQo+IGhhbmRs
ZWQgYnkgdGhlIEd1Qy4gVGhlIEtNRCBtZXJlbHkgZ2V0cyBub3RpZmllZCB0aGF0IGl0IGhhcyBo
YXBwZW5lZCANCj4gYWZ0ZXIgdGhlIGZhY3QuIFRoYXQgaXMgdGhlIHBvaW50IG9mIGdpdmluZyBh
IHNhdmUvcmVzdG9yZSByZWdpc3RlciBsaXN0IA0KPiB0byBHdUMuIEd1QyB3aWxsIHNhdmUgdGhl
IHZhbHVlcyBvZiBhbGwgdGhlIHJlZ2lzdGVycyBpbiB0aGUgbGlzdCBiZWZvcmUgDQo+IGl0IGRv
ZXMgYSByZXNldCBhbmQgcmVzdG9yZSB0aGVtIGFnYWluIGFmdGVyIHRoZSByZXNldCBpcyBjb21w
bGV0ZS4gDQo+IFRoZXJlZm9yZSwgYW55IHJlZ2lzdGVyIHdob3NlIHZhbHVlIHdlIHdhbnQgdG8g
YmUgbWFudWFsbHkgcHJlc2VydmVkIA0KPiBhY3Jvc3MgYW4gZW5naW5lIHJlc2V0IG11c3QgYmUg
YWRkZWQgdG8gdGhlIEd1QydzIHNhdmUvcmVzdG9yZSBsaXN0Lg0KDQpBRkFJQ1QsIHRoYXQncyB3
aGF0IEknbSBkb2luZyBpbiB0aGlzIHBhdGNoLCBzbyBjb3VsZCB5b3UgcGxlYXNlDQpjbGFyaWZ5
IHdoYXQgaXQgaXMgSSBuZWVkIHRvIGRvIGRpZmZlcmVudGx5IGZyb20gd2hhdCBpcyBjdXJyZW50
bHkNCnByZXNlbnQgaW4gdGhlIHBhdGNoPw0KLUpvbmF0aGFuIENhdml0dA0KDQo+IA0KPiBKb2hu
Lg0KPiANCj4gPg0KPiA+PiBKb2huLg0KPiA+Pg0KPiA+Pg0KPiA+Pj4gLUpvbmF0aGFuIENhdml0
dA0KPiA+Pj4NCj4gPj4+PiBJZiB3ZSBkb24ndCB0cnVzdCB0aGUgcmVzZXQgc3RhdGUgdG8gYmUg
dmFsaWQgdGhlbiB3ZSBuZWVkIHRvIGVuc3VyZSBhbGwNCj4gPj4+PiBvZiB0aGVtIGFyZSBzYXZl
ZC9yZXN0b3JlZCBhY3Jvc3MgYSByZXNldC4gT3RoZXJ3aXNlLCB0aGF0IGdhcmJhZ2UgY2FuDQo+
ID4+Pj4gY29tZSBiYWNrIGFuZCBjYXVzZSBwcm9ibGVtcy4NCj4gPj4+Pg0KPiA+Pj4+IEpvaG4u
DQo+ID4+Pj4NCj4gPj4+Pg0KPiA+Pj4+PiAgICAgCWZvciAoZSA9IGV4dHJhX3JlZ3M7IGUgPCBl
eHRyYV9yZWdzICsgQVJSQVlfU0laRShleHRyYV9yZWdzKTsgZSsrKSB7DQo+ID4+Pj4+ICAgICAJ
CWlmIChlLT5za2lwKQ0KPiA+Pj4+PiAgICAgCQkJY29udGludWU7DQo+ID4+DQo+IA0KPiANCg==
