Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99362EEC2AB
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 23:33:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603D110E462;
	Mon, 23 Feb 2026 23:33:50 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DA110E462
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 23:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771889624; x=1803425624;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SwB6+DypPPx4JP1NAePuKSN+dgBjyWHNpbWU4SIHlq8=;
 b=F+dh7cQEooJ9kMkamZuEg5hcsQOPvPEEWASi4zOgTl8BUZlzD/0hMANP
 ilSYt0gapLt4phH9MfmkBRnlcqgWpa/NyxMIZMxhbwO7YssNOuD/fKSzW
 fg+IPAoi82/VHhQF7L4VQJl548jERv+tt31Zd4d5Y2o89ZsnoqnxG4HZ3
 gMJOERzyFRGpAaUWC5INE2ct9C/DOwEXdaao3xOH7RIH51wjt0gDysK5e
 vHquxYrP4ZG6TArkYQDDPbon0Ffrkuxb63lajJioJHkbWyxboafalFFEA
 sEB0tz6LuVd/dd4pRZZv5FNEJox6nA49qGKtmlZJhENsIaCBm2Po+nKqX w==;
X-CSE-ConnectionGUID: bU+iSSCBRhGgr3DfBRt0+g==
X-CSE-MsgGUID: uloSTc/DSPiaYzjD7Lxstw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="75504630"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="75504630"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 15:33:34 -0800
X-CSE-ConnectionGUID: XNFWKtT4RNyuj3Ln3svxig==
X-CSE-MsgGUID: C/Oov5FSSpipBiOVqH+u0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="220723225"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 15:33:34 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 15:33:33 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 15:33:33 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 15:33:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TI27pYfgLM0pe9iyzWFuT/Ks06qQRO0EhxqJH6U9TE4JhWXnayD7SqJP6gqqzcSiOvMcRxWlNeSv8+YEvy1l2UlV+IpxLk0gjmL0meQbA+xKk7Qig+NbLwI6VTEoBgHNSQ10OzE5kQfzDThCyfN0DVLisdU0Xtak/96L7BadJShFP02LnHyuwEV81KqDGgDy8u/3PklpopNJ+2ocK/traFDPhb/LULGp/KianxqLsJIDu1KDaTQs67nArCYgIjVsCo5vUknSmAbChZT0OsdxsPnblR0W4xPxj1h05C3DrOEL2bn2n3FpmU768T04RZdc7wJB08St+NIQJoeD+9a/mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SwB6+DypPPx4JP1NAePuKSN+dgBjyWHNpbWU4SIHlq8=;
 b=LBj78jFdhRGrmbqJfXHvFgb1LxTbftIuD2D+UsvjiTfqtbjFjop9SdwWQHFTNHWHpIX9zW0MvKue3CnR1KdiIm31fg4/PVAFcJ4gQcYX3+KZqeoKjg1bIAwZpgTV/hLUuZenpUSFBmOqcNUhd7CDehhL8nnb1mYpMUKWzTarJbuphBN0rKP9WLHZO4P0wdJhMg2ocLUMwAFd0tad7jfarFQImf1WaXbfNyEezYBIvE/gCEI4wnqN5bzNhOhSILzIrRLj1IBooeZNLHRbXtm3+8u7yNVoojFdU1c4trbHN2YjQnW5ZjWDjoHlhx7kjva8nXtYf5zI+y0lODcoJYoTnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by PH0PR11MB5141.namprd11.prod.outlook.com (2603:10b6:510:3c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 23:33:30 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 23:33:30 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper, 
 Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 1/2] drm/xe: Skip over non leaf pte for PRL generation
Thread-Topic: [PATCH 1/2] drm/xe: Skip over non leaf pte for PRL generation
Thread-Index: AQHckPkyBh2vRb2pEEC3l3WshI0DQLWRC1mAgAAC7ACAAAIfAIAAAHsw
Date: Mon, 23 Feb 2026 23:33:30 +0000
Message-ID: <SA1PR11MB88390D32C4A1C2BDC6629BD3AA77A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20260129082756.1096935-3-brian3.nguyen@intel.com>
 <be5e3d57544ece734dec2513ab4717e80b49adec.camel@intel.com>
 <aZzb5COhqfv/3SBF@lstrano-desk.jf.intel.com>
 <943064bb067941dd6883ebd60514bc147d346da6.camel@intel.com>
In-Reply-To: <943064bb067941dd6883ebd60514bc147d346da6.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|PH0PR11MB5141:EE_
x-ms-office365-filtering-correlation-id: 02ddf9f0-3ed8-4cfc-2523-08de7333f3d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?clIra0dzMHZJUDBQWlVkMlpKRXpXdzV3YitaSzdMN3l0bFNSSjRtYjliaDdO?=
 =?utf-8?B?S3pBTy8yTVZhL29oVVJmLzRHWXM4WElUWVJyUUdORVlSQ3NvMHhtQ1J4V3M4?=
 =?utf-8?B?OXBCVDBkVVUwNVhQdUR5N1Q2MWcxbkdoNUFQVWJ6eWVUd2FHU1pPNFNsdml6?=
 =?utf-8?B?cUd2NFREV0RzTzYxQ1ZyZU51Slg1RWsyZU00Q3lwL2NwS2dSaHR1RDhNdXpB?=
 =?utf-8?B?eGZEV0NHaGV0WmVGS0d3UVpEVkg2SlVWUUt3bWljN3Zkdzh3U1pxbzJlU0ox?=
 =?utf-8?B?WlA0cUFROW9pQUVrUVRlbXdiNlh5MVBWVzZKc05Jd3hIN2lOY3oxdXBHVDNI?=
 =?utf-8?B?MGtpak1Dd3hyYTdud1dseXZybEhUOHNrV3JvMEJ2WmlVVjhxVnFEMlFpSEs1?=
 =?utf-8?B?TmJnS3BWL1RVM0JYVE4zL1BjUlRQYmxWenVoOWRWc0lHbGdIaXpiVkRHd1ZH?=
 =?utf-8?B?T3JiWThKaFZ4K3o4S3FIK3dKYTRON2FjVDNUZ25aMkxUOGtFMjRYWDM2dGpo?=
 =?utf-8?B?Q2M2K0tYWGJ5NVVDbDBJTHU3ZVFIMy95ckRiSWFnT0JrS25ER0dHOG1Eb3VG?=
 =?utf-8?B?NkZ4RTBSaW53SzJMK0o4REh3YmRyRmRGdFN4UmhPMFlrTHJHMVFQQ0JsbHBY?=
 =?utf-8?B?dDVqVkdNTE9LV0RnT0RKWkdqYVZGOWlna3pPendQTys5Ylg1VjZ2eDRaM0Yz?=
 =?utf-8?B?STB6SDJna2tvY1BvT21rREIwQVhEUVZweWxhY04vOXB0VW1KTzJOZzIySE54?=
 =?utf-8?B?L3E3a0FseWtaNVZueDkxVVRUbnYxY24rZnVZeWJTaWFnNjVXZ3NiVmduMkc3?=
 =?utf-8?B?aThBdmtOM1pTQmxPVVhNYTRUalBiWm0wbTFROHYwdVN1OGlJMHRIQjUzSnhz?=
 =?utf-8?B?YlRNRVg5dlc4NER2ZWpDaEFpcHFKU2ZWWlF2VmJrK2N2blllZ01xRnJpajNy?=
 =?utf-8?B?aHp2U0NQbFAxczhpd2NvU3REWGEycGtNMnVoOUd5Ukt6Nm5yV3NXelp4TlBr?=
 =?utf-8?B?NCtzSDFYTzNUNmoyQ0lBeENpSXRVZFVJeVlVbURyUHdHbUlOSkRyQ3Fud2o0?=
 =?utf-8?B?cWVIWWZjbzJaVmtPdWl1M2YwUmpnNnRCSTJQR2psL1VTbFZZcURpWFdIMUVJ?=
 =?utf-8?B?U2U0UnMzNGdsS3ZXTThnK0QxbjhzaHhVR3JMUHgrcWtUU090Yzc1ZUR3eDVp?=
 =?utf-8?B?bDRmbHZBSk8xYnk4M3FGZ3FydEhJTDdIV3hrSnpvZ2ozZVF5QWR0bnBlWGc3?=
 =?utf-8?B?dVpZTm9RUUhiUVhHK21vMWN4V1kxd3M3OGpKMCtydGV4OVZYTmxZbzg0ZzdF?=
 =?utf-8?B?dFBlWmxzWmRTbklLRmNyL09GSzNtR0tQZTZmV0M3bm82a3R2R1U5NGxEZlkr?=
 =?utf-8?B?TFhmSHpUei9JenJGQzJsVFBHUm15TWN0ay9IMXVmcE9rZjRHcnJBYW5US0NJ?=
 =?utf-8?B?d05BNDRNamhXTHNjbmhrQjU3eXM4M1NXOU5RWi9jMktFUU9CSWdvdFlPSkJ1?=
 =?utf-8?B?bUFKWnpkd1hpRmVjdnRselBCV2V6UWYrSjBWKzZsaTJBWk9yWXBOOHRFL2dl?=
 =?utf-8?B?R0dHSi9RdUJsY3RLZitvSUY0OVNTTEN4ZTdzRjI5ZWNtOW1xMEc5WHgxZHpX?=
 =?utf-8?B?cmsvdG4rY09uenRoaDBrNmFtNExkTGJEYWc0eG8rU0ZMbzdFb29XY2ErbWtK?=
 =?utf-8?B?dmhxN2s3bDhhamc4eGgrMTRuYWlleW9QTlZwaTZGVk4xWGdWYnVucDFHbTBX?=
 =?utf-8?B?M21iTzhPR3NjVm9NNWl6STlGelBaSmxBL3M2RWlmOFI1NFRqTmJxTzNxQjJ6?=
 =?utf-8?B?SlF3dlp2dWRBLzlCZStLdE95T3ZDcUpwL2I2dUVMakNDejJkZXhsaHFYa0Nu?=
 =?utf-8?B?a2I3eWEvSnVLY1A3czNqOVY2TEJkejNJdmxLeUt5SVlZWTlSNTJnaDZNcEtO?=
 =?utf-8?B?bkNoaU9PeTNOL29tNWdDYm1ZbllpQ1VZYW15NzRLd2l3Tlhyd0EyWEJKODQ1?=
 =?utf-8?B?UTdCVTJhWlF0VHNmdTFxK2FwODhJQXBYZDJZSWtnZnQyT3JPbnJpN2VpOCs4?=
 =?utf-8?B?cy9tTU5jZEVubkRYeXNoL2hlL2xycTN1VERYalhkc1JsRmREWTViVGtxNGVy?=
 =?utf-8?B?NkE2TjMxaXI2Q0RCZUNvUk5GdDBQa25iU1ZnRTVWb3dyVHFhOXZCZkFIOVd2?=
 =?utf-8?Q?5/vwlMYzafAa6miRWH1q4Ao=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDlVKzliOWl1SXI1OWRrcTBOcTQvdHZacFF1dFVHeUwyOUd0eVdBNHcwQ3FT?=
 =?utf-8?B?Q0xObXFOaXgwaUsxU0FsSjZDY3JobGN1TE9qQlYySEVLK3NsN0ZjVllFQncw?=
 =?utf-8?B?M0pwb3BwSm5vV1dpdlNKYWZ3VFcwaWJVd280MmpFUi8wZVVLY2hDVmhtYndJ?=
 =?utf-8?B?R2k4YjJDaHFCUHFjdGtZS0pEMElmWVU5amZEWFRLUDZUSGVLc0dQbmVtUFRy?=
 =?utf-8?B?SnhqUlAvNEc2U1BqcEt3WEhCKzRZdHBUVGtpNDJkTDJaZjN0dTk5UWJQZ1Vs?=
 =?utf-8?B?S3FiQXBsbW1WRk9lUk1qbDRLVjJTeUR0a2ZEdG5jdjBEdW5YSjZVTlBibjFY?=
 =?utf-8?B?WHJlNlFjdXlRRThyS0lkOHhGVGRGTW8vUDlybGo0VUd3OWI3Z3VXWDlQN1pp?=
 =?utf-8?B?Q28wRnhxcm9wRDhYcDE1OVRZUENBNExveEZ4aWdHSDE2NnFZRDBRRDlNZEU2?=
 =?utf-8?B?MisrVEtPT0l0bVpUbWZZT2llRitPN2l3V2dWR0RiSzYvTUZ6T0FTcmJBWFYr?=
 =?utf-8?B?Uk9VeWZNSmxKM3FIaVFta09ndUtTL3ljRGkya3VtUHFTbjZpaWZKeGZNTnFt?=
 =?utf-8?B?WVZ4VmR1WS9RWjhWNVM5V0J0M3hCMlRFVlpMcGU1N3hQMStmdVhWZEp1eFB5?=
 =?utf-8?B?VTNSSkpLN050NnVjOTVrWExNa2k3ek5ObzlnSGJPTlZZMktEakwxeUVEcjh6?=
 =?utf-8?B?d29Vc01VN2hSVnM4dE5FT2g0T2Q3UktING9rTUJQSVN5aG9JSnowUHNmcG5q?=
 =?utf-8?B?ampNOGZiMmlSTUE1T20yQmhST0VJeFJaTi9JY25jZHVSMzl2MWlBZzZ2L3ZY?=
 =?utf-8?B?U253dWFGWXNEdjlSeTZkTUFLUnBqZ2NlN0VoaVlGaWJNVlRoMHdsM0hmcnB3?=
 =?utf-8?B?aFNYZEc1SGJ1MVVzemdPYy9oRVo0c2t5UXlScVEySURDWjRRWE45b0c1U25E?=
 =?utf-8?B?SWNtVnBhaWYwdzlmUXBLMnZnckkrUGNkTk9EektONWF6WUE3MlZGVkY0ZUtn?=
 =?utf-8?B?b3ppZXJaOEtacVpGaW4rOEpzVHh4Yi94VDBuTU9XZ1psR1l1TVVUS1ZoR1g2?=
 =?utf-8?B?WHliVHBST2xJdlVtTGt6bTZ6VUNrOHd2ODM3d3FIeDBVT0FEYzU2YWdRdW90?=
 =?utf-8?B?eTg1YzRFVlRuUTFoREttOGswSVNDZVpWdnRnN2xoUHRON2ExcHYyYU5tS0Fu?=
 =?utf-8?B?UDRXZDMzUWh6bmZLN1d0MDdnaW1KVTdKbHk4NDJkS2VjOFl2UU5qUHRvUXRJ?=
 =?utf-8?B?YndQUzhEdTROc25UYlNjbnR1ZjhYbHplZlpVM0E2UzVOTENIM2VPcXN5eXk5?=
 =?utf-8?B?aU53VThoaGZyS0R5aGFLTjZWRk50N2U1eVpBUFRyRTNSNHhiSllTQ0xGeGdJ?=
 =?utf-8?B?Y2Z6SGdQcENpMXNqTnRMVnNQM2x5NnZ5eDRyRXFWWUFlYUNIcEpJdnJHQXpB?=
 =?utf-8?B?dVd0NkJaVVRLc2VkUjBHZGpKQkVOS2pzVnREMHJEek9uV29pZCtBQjNRem1T?=
 =?utf-8?B?RlVLMStOcHJXcTU5ZGFScWtoVi9KS1FDTGh5T0VEMWFoYUlRRmo3Z3E5SzRq?=
 =?utf-8?B?MHRpUHVwS0c3Kzk3SWs1VkNRMGEyTDJLak9KV2E0d2VQK1RJdVhCL29jNFdQ?=
 =?utf-8?B?QjF6YUh0eXoyRW1TQ1NEb1M0UWdEYllzRXR4L0x0L2gyb1BnV1RRaTFDWXQ5?=
 =?utf-8?B?VVNjdEdsZzRUUUxBRkFVZVpZa2FYWWZjcUFmcXhlVDk1VFNVclhzR1pXb2lo?=
 =?utf-8?B?RXFWRC91WC9rVXJSK3lVd0FrL05FRm9JVlNpU1NaWU83TlI1bGdZVmhwdmFO?=
 =?utf-8?B?ZWVVNmcwb05wbVBWL1RMVnNtOFkyNlI1d1dMZXVYZzlGSHhnVmsvTUtMQ1l5?=
 =?utf-8?B?ODAzQWk4Sk1OeEZBQk1hQ3BjTVZkUVZRZHcwZUtta3J0TWgzakpjM3g5S0hh?=
 =?utf-8?B?cEVqNkh3YXlOZDZwTURsK0gyR0pmYXpTeEVjM2hiTVB5Qk9xR2UvQXZkb1Zn?=
 =?utf-8?B?TlQ4QmpiNy9VRFpYY091dktLM0tCenR3dVRKNUUvZGxGNDI4RG5IRjhPZ0Fa?=
 =?utf-8?B?b0VQbzMyOEoxV080dlUyem02clhKT2gvZ0RUcllmWThuOWFRcTBqYUMxVEtj?=
 =?utf-8?B?a0c5NXhJQUNQSktKeGhSOEZSYVlNVHkzQkV4RkEwRnRQQ3lNd2N6SjN2SmJB?=
 =?utf-8?B?OW9GRTJjR3BqcWlCQXVaZXBYalFUYStsQ0pLa0F3NFZ0VTBpMnFadEFuWHRr?=
 =?utf-8?B?bFoxSzhCTlk4bWZOMWswYVJjSGNtdThoUWI1Mm5rcGlFczVOSTdMUFVLTXdi?=
 =?utf-8?B?TmV0aFQ1dWx4anNmMkZ3QW53Y0VNUGJibG9jVDJsRU1CdUFZdXEzdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ddf9f0-3ed8-4cfc-2523-08de7333f3d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 23:33:30.3864 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /HEbRmHFtkooK/N5DZb42YdjjpECeV8SMqFF3wu/4bACVGPqT/KTjvD9ciZUZx24TeSY9Lgu/JcHquiP9P2vaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5141
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

T24gTW9uZGF5LCBGZWJydWFyeSAyMywgMjAyNiAzOjA3IFBNLCBTdHVhcnQgU3VtbWVycyB3cm90
ZToNCj4gT24gTW9uLCAyMDI2LTAyLTIzIGF0IDE0OjU5IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdy
b3RlOg0KPiA+IE9uIE1vbiwgRmViIDIzLCAyMDI2IGF0IDEwOjQ5OjIxUE0gKzAwMDAsIFN1bW1l
cnMsIFN0dWFydCB3cm90ZToNCj4gPiA+IE9uIFRodSwgMjAyNi0wMS0yOSBhdCAwODoyNyArMDAw
MCwgQnJpYW4gTmd1eWVuIHdyb3RlOg0KPiA+ID4gPiBUaGUgY2hlY2sgdXNpbmcgeGVfY2hpbGQt
PmJhc2UuY2hpbGRyZW4gd2FzIGluc3VmZmljaWVudCBpbg0KPiA+ID4gPiBkZXRlcm1pbmluZyBp
ZiBhIHB0ZSB3YXMgYSBsZWFmIG5vZGUuIFNvIGV4cGxpY2l0bHkgY2hlY2sgZm9yIGlmIGENCj4g
PiA+ID4gcHRlIGlzIGEgbGVhZiB0aHJvdWdoIHRoZSBiaXQgY2hlY2tzLg0KPiA+ID4gPg0KPiA+
ID4gPiBGaXhlczogYjkxMjEzOGRmMjk5ICgiZHJtL3hlOiBDcmVhdGUgcGFnZSByZWNsYWltIGxp
c3Qgb24NCj4gPiA+ID4gdW5iaW5kIikNCj4gPg0KPiA+IE1vdmUgdGhlIEZpeGVzIHRhZyBieSBv
dGhlciB0YWdzIChTaWduZWQtb2ZmLWJ5LCBDYykNCj4gPg0KDQpHb3QgaXQsIHdpbGwgbW92ZS4N
Cg0KPiA+ID4gPg0KPiA+ID4gPiB2MjoNCj4gPiA+ID4gwqAtIFJlbW92ZSBvbGQgYXNzZXJ0LiAo
TWF0dCBSKQ0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCcmlhbiBOZ3V5ZW4gPGJy
aWFuMy5uZ3V5ZW5AaW50ZWwuY29tPg0KPiA+ID4gPiBDYzogTWF0dCBSb3BlciA8bWF0dGhldy5k
LnJvcGVyQGludGVsLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+IMKgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3B0LmMgfCAxMyArKysrKysrKy0tLS0tDQo+ID4gPiA+IMKgMSBmaWxlIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5jDQo+ID4gPiA+IGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3B0LmMgaW5kZXggNjcwM2E3MDQ5MjI3Li5iNzNhMzU2ZDBmYTENCj4gPiA+ID4g
MTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5jDQo+ID4gPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5jDQo+ID4gPiA+IEBAIC0xNjU1LDcgKzE2
NTUsNyBAQCBzdGF0aWMgaW50IHhlX3B0X3N0YWdlX3VuYmluZF9lbnRyeShzdHJ1Y3QNCj4gPiA+
ID4geGVfcHR3ICpwYXJlbnQsIHBnb2ZmX3Qgb2Zmc2V0LA0KPiA+ID4gPg0KPiA+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgWEVfV0FSTl9PTighKmNoaWxkKTsNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oFhFX1dBUk5fT04oIWxldmVsKTsNCj4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgLyogQ2hlY2sgZm9y
IGxlYWYgbm9kZSAqLw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAvKiBPcHRpbWlzdGljYWxseSBj
aGVjayBmb3IgbGVhZiBub2RlLCBtYXkgbm90IGJlDQo+ID4gPiA+IGd1YXJhbnRlZWQNCj4gPiA+
DQo+ID4gPiBJIHdvdWxkIGtlZXAgdGhlIGNvbW1lbnRzIHRoZSBzYW1lIC0gd2UncmUgc3RpbGwg
dHJ5aW5nIHRvIGNoZWNrIGENCj4gPiA+IGxlYWYgbm9kZSBoZXJlIGFuZCB3ZSBhcmVuJ3QgcmVh
bGx5IGRvaW5nIGFueXRoaW5nIHNwZWNpYWwuIElmIHdlDQo+ID4gPiBoYXZlIHF1ZXN0aW9ucywg
d2UgY2FuIGxvb2sgYXQgdGhlIGNvbW1pdCBoaXN0b3J5IHRvIGRldGVybWluZSB3aGF0DQo+ID4g
PiBjaGFuZ2VkIGZyb20geW91ciBwcmlvciBpbXBsZW1lbnRhdGlvbi4NCj4gPiA+DQo+ID4gPiBP
ciBpZiB5b3Ugd2FudCBkb2N1bWVudGF0aW9uIGhlcmUsIGl0J3MgbW9yZSBpbnRlcmVzdGluZyB0
byBtZQ0KPiA+ID4gKndoeSogd2UNCj4gPiA+IGNhbid0IHNlZSB0aGlzIGZyb20gdGhlIGNoaWxk
IGFsb25lIHRoYW4ganVzdCB0aGUgZmFjdCB0aGF0IHdlIGNhbid0DQo+ID4gPiAod2hpY2ggd2Ug
Y2FuIG9ic2VydmUgYnkgdGhlIGlmIGNvbmRpdGlvbikuDQo+ID4gPg0KPiA+ID4gQWxzbyBhcHBs
aWVzIHRvIHRoZSBjb21tZW50IGJlbG93IHRvby4NCj4gPiA+DQoNCkFoaCBnb3QgaXQuIExldCBt
ZSByZXdvcmQgdGhlIGNvbW1lbnRzIGhlcmUgd2l0aCBtb3JlIGRldGFpbHMgZGVwZW5kaW5nIG9u
IHRoZSBjaGFuZ2VzDQp3ZSBtYWtlIGluIHRoZSBjb21tZW50cyBiZWxvdy4gDQoNCj4gPiA+IFRo
YW5rcywNCj4gPiA+IFN0dWFydA0KPiA+ID4NCj4gPiA+ID4gZnJvbSBjaGlsZHJlbiBhbG9uZSAq
Lw0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHhlX3dhbGstPnBybCAmJiB4ZV9wYWdlX3Jl
Y2xhaW1fbGlzdF92YWxpZCh4ZV93YWxrLQ0KPiA+ID4gPiA+cHJsKQ0KPiA+ID4gPiAmJg0KPiA+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICgheGVfY2hpbGQtPmJhc2UuY2hpbGRyZW4gfHwg
IXhlX2NoaWxkLQ0KPiA+ID4gPiA+IGJhc2UuY2hpbGRyZW5bZmlyc3RdKSkgew0KPiA+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBpb3N5c19tYXAgKmxlYWZfbWFw
ID0gJnhlX2NoaWxkLT5iby0+dm1hcDsNCj4gPiA+ID4gQEAgLTE2NzUsMTAgKzE2NzUsMTMgQEAg
c3RhdGljIGludCB4ZV9wdF9zdGFnZV91bmJpbmRfZW50cnkoc3RydWN0DQo+ID4gPiA+IHhlX3B0
dyAqcGFyZW50LCBwZ29mZl90IG9mZnNldCwNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOw0KPiA+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9DQo+ID4g
PiA+DQo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgLyogRW5zdXJlIGl0IGlzIGEgZGVmaW5lZCBwYWdlICovDQo+ID4gPiA+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfdGlsZV9hc3NlcnQoeGVfd2Fs
ay0+dGlsZSwNCj4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhlX2NoaWxkLT5sZXZlbCA9PSAw
IHx8DQo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAocHRlICYgKFhFX1BURV9QUzY0IHwNCj4g
PiA+ID4gWEVfUERFX1BTXzJNIHwgWEVfUERQRV9QU18xRykpKTsNCj4gPiA+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKg0KPiA+ID4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIFRoZSBjaGVjayBmb3Ig
eGVfcHQncyBjaGlsZHJlbiBpcw0KPiA+ID4gPiBpbnN1ZmZpY2llbnQgdG8gZGV0ZXJtaW5lIGxl
YWYuDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICogSWYgbm90IGxlYWYsIGJyZWFrIG91dCBhbmQgY29udGludWUgaW4NCj4gPiA+ID4gbmV4
dCBwYWdlIHdhbGsgbGV2ZWwuDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICovDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHhlX2NoaWxkLT5sZXZlbCA+IDAgJiYNCj4gPiA+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIShw
dGUgJiAoWEVfUFRFX1BTNjQgfCBYRV9QREVfUFNfMk0gfA0KPiA+ID4gPiBYRV9QRFBFX1BTXzFH
KSkpDQo+ID4NCj4gPiBJIGRvbid0IHRoaW5rIFhFX1BURV9QUzY0IG5lZWRzIHRvIGJlIGNoZWNr
ZWQgaGVyZSBhcyB0aGF0IHNob3VsZCBvbmx5DQo+ID4gYmUgc2V0IGF0IGxldmVsIDAuDQo+IA0K
PiBPaCB0aGF0J3MgYSBnb29kIGNhdGNoLiBQUzY0IGhhcyBhIHNwZWNpZmljIG1lYW5pbmcgd2l0
aGluIHRoZSBQREUuIEFyZSB3ZSB0cnlpbmcgdG8gY2hlY2sgaWYgdGhpcyBpcyA+IDRLIGJhc2lj
YWxseT8NCj4gDQoNClRoaXMgd2FzIGNoZWNraW5nIGlmIG9uZSBvZiB0aGUgYml0cyBpbmRpY2F0
aW5nIHRoYXQgdGhpcyBpcyBhIGxlYWYgZW50cnkgd2FzIHJhaXNlZCBhbmQgaWYgbm90LCBza2lw
IGFkZGluZyB0aGlzLg0KU28sIGNoZWNraW5nIGZvciBpZiBpdOKAmXMgYSBsZWFmIFBURSAod2hp
Y2ggd291bGQgaGF2ZSBvbmUgb2YgdGhvc2UgYml0cyByYWlzZWQpLCBub3QgbmVjZXNzYXJpbHkg
aWYgaXQgaXMganVzdCA+IDRLLg0KDQpQcmV2aW91c2x5IEkgaGFkIHRob3VnaHQgdG8gcmVtb3Zl
IFhFX1BURV9QUzY0IHNpbmNlIGxldmVsID09IDAgY292ZXJzIHRoZSBjb25kaXRpb24gYnV0IGp1
c3QgZm9yIGNsYXJpdHkgb2YNCmNoZWNraW5nIGFsbCBsZWFmIFBURSwgSSBrZXB0IGl0IHdpdGgg
dGhlIGFzc2VydCBhbmQgdGhlbiBrZXB0IGl0IHNpbmNlIEkgaW52ZXJ0ZWQgY29uZGl0aW9uIGlu
IHRoaXMgcGF0Y2guDQpJJ2xsIHJlbW92ZSBYRV9QVEVfUFM2NCBpbiBuZXh0IHBhdGNoLiBUaGFu
a3MuDQoNCj4gVGhhbmtzLA0KPiBTdHVhcnQNCj4gDQo+ID4NCj4gPiBJIGFncmVlIHdlIHhlX2No
aWxkLT5iYXNlLmNoaWxkcmVuIGNhbiBiZSBzZXQgYXQgbGV2ZWwgPiAwIGJ1dCBub3cgSSdtDQo+
ID4gdGhpbmtpbmcgdGhlIG91dGVyIGlmIHN0YXRlbWVudCBpcyB3cm9uZyB3cnQgdG8NCj4gPiAn
eGVfY2hpbGQtPmJhc2UuY2hpbGRyZW5bZmlyc3RdJy4gQ291bGRuJ3QNCj4gPiB4ZV9jaGlsZC0+
YmFzZS5jaGlsZHJlbltmaXJzdF0gYmUgTlVMTCB3aGVuIHN1YnNlcXVlbnQNCj4gPiB4ZV9jaGls
ZC0+YmFzZS5jaGlsZHJlbltmaXJzdCArIDFdIGJlIG5vbi1OVUxMPw0KPiA+DQoNCkkgYmVsaWV2
ZSB0aGlzIHdhcyB0aGUgaXNzdWUgSSB3YXMgcnVubmluZyBpbnRvIHdpdGggb25lIG9mIHRoZSB0
ZXN0IGNhc2VzLiBIYXZpbmcgc29tZSBzb3J0IG9mIG5vbi1OVUxMIHN1YnNlcXVlbnQgY2hpbGQg
ZGVjbGFyZWQgaGVyZQ0Kd2l0aCB0aGUgeGVfY2hpbGQtPmJhc2UuY2hpbGRyZW5bZmlyc3RdID0g
TlVMTC4gQnV0IGRldGVybWluaW5nIGlmIHRoaXMgUFRFIGlzIGEgbGVhZiBlbnRyeSB3b3VsZCBy
ZXF1aXJlIHVzIHRvIGl0ZXJhdGUgdGhyb3VnaCBhbGwgdGhlIGNoaWxkcmVucw0KSSBiZWxpZXZl
LCB3aGljaCBpcyB3aHkgSSBoYWQga2VwdCB0aGF0IGNoZWNrICh4ZV9jaGlsZC0+YmFzZS5jaGls
ZHJlbltmaXJzdF0gIT0gTlVMTCkgYXMgc29ydCBvZiBhbiBvcHRpbWlzdGljIGZpbHRlciBhbmQg
aGFkIHRoaXMgbmV3IGlubmVyIGlmIHN0YXRlbWVudA0KdG8gZW5zdXJlIHRoYXQgdGhlc2UgZW50
cmllcyBhcmUgbGVhZiBlbnRyaWVzLg0KDQpTbywgd2hhdCBpcyB5b3VyIHN1Z2dlc3Rpb24gaGVy
ZT8NCg0KVGhhbmtzLA0KQnJpYW4NCg0KPiA+IE1hdHQNCj4gPg0KPiA+ID4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVh
azsNCj4gPiA+ID4NCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgLyogQW4gZW50cnkgc2hvdWxkIGJlIGFkZGVkIGZvciA2NEtCIGJ1dA0KPiA+
ID4gPiBjb250aWdpb3VzIDRLIGhhdmUgWEVfUFRFX1BTNjQgKi8NCj4gPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHB0ZSAmIFhFX1BURV9Q
UzY0KQ0KPiA+ID4NCg0K
