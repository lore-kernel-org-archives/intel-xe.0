Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64079C83030
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 02:36:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBAB10E0FF;
	Tue,  8 Jul 2025 02:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FfSUDbGR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD1010E0FF
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 02:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751942216; x=1783478216;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WCThXJNpoCcEBfOkWyqE3lZJKS44JEGLflDkD7DFud8=;
 b=FfSUDbGRRA5FbLTwfFL8WOlCHcwwcGvaLPGqBGbWNvt3UkecG+O4q9sb
 x9egW4se4AR5fwU9l12b+TRT3qT3jg5lIY5AZ7PvQ1hiDyJllshQOFt5w
 Pxf+Zb1XIlWEkU+O/ZTdrMB5FN2EjsOZwiRlDYMQPag5GkAUGwymIIiaw
 lmFjhyO9UMjBgxftCQpo2tLQw4BWHaTyyUJmlEZ9hKYbTiEAZ+i4BWqNo
 j888yYAnZPRSJrEJywczJT8rINaS+b95uySZMUnFHcalloCo7SXlm2+U/
 la4xS0RNWC4Y9+UD4+VfVqmZbqZvqfc7vHRODZjM6etbnQF1bv16Zb30A A==;
X-CSE-ConnectionGUID: dbVozCQ3QeKRnMTIOOxlAg==
X-CSE-MsgGUID: pOb0GZCZQWSA8BOeRXorlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54297497"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="54297497"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 19:36:55 -0700
X-CSE-ConnectionGUID: UIFBtKxDQjW5NImNNw1dkA==
X-CSE-MsgGUID: p1rSVE9dQfW6Rnz1GzCURA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="186399699"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 19:36:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 19:36:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 19:36:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.45)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 19:36:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h40/jwgfI7/fsl4aDmcfiydEAYar+/qrJqGtpT/vODnlpqVq4svGV6HbflLvmdc5mAYBhIKZl7MtSrotnoYQwOL6m3baBwKJUDXkDuCILqdKm/SxiyPTXqykKu9qoGnI57IIbCSz0yC/VHgOG4VdmKY2eDTWOuh0z68mBPN+XVlAKYNzHCt1co106p59owkSoTjmXIGT7kwcYh+voTDARr2wWU4NSeRxQAFwNqbhU3NzvwUmuweJrf9yVeFFkHzetGs6QxOgy/Uh3AWzcPfoaRC07XwzcuzP/F43PBDErTneT8IR7sGtoOS9KcmEjpJK/KJ6nMjiqpavj7RYXs6qyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCThXJNpoCcEBfOkWyqE3lZJKS44JEGLflDkD7DFud8=;
 b=bqU6zLQMeS8iCig54OhyB/9mY6li1EHYNhtzGpjNokGEzaMi99n9NqLtUxUg45iAXJ/jTWvA0atOLJ52SBRr2rRALTY1ws6gp3CHHYDY02iJXJ9HrmRvnYRe0Oei5hEVrwh10syrytmGojuKdndq6+p5MNxfsdpmrXujbgFAFgoRYlML60BYfls4+xbr/PmyDHLSxd1oAH8Vd/HNG1qbFqdOpL5IdZnzjHz7DTpBcPYadeQDEEzuTWC5nbLeC5NEDd5v+JnvD2Vi7r0/L5SoYgReg+vS7Ctk+SGkTn0Pgsbyhe+6gi69pARTLn7ua6044rw4NCSbxjq0XBttkkdDzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5447.namprd11.prod.outlook.com (2603:10b6:208:315::17)
 by CY5PR11MB6365.namprd11.prod.outlook.com (2603:10b6:930:3b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 8 Jul
 2025 02:36:51 +0000
Received: from BL1PR11MB5447.namprd11.prod.outlook.com
 ([fe80::ad51:b35d:1aca:726e]) by BL1PR11MB5447.namprd11.prod.outlook.com
 ([fe80::ad51:b35d:1aca:726e%3]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 02:36:51 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Harrison, John C" <john.c.harrison@intel.com>
Subject: RE: [PATCH] drm/xe/pm: Restore display pm if there is error after
 display suspend
Thread-Topic: [PATCH] drm/xe/pm: Restore display pm if there is error after
 display suspend
Thread-Index: AQHb7uLePwpI+otToUW+u0AU+xcel7Qm1eCAgACs2ZA=
Date: Tue, 8 Jul 2025 02:36:50 +0000
Message-ID: <BL1PR11MB544746A2BAB56B67E470C134EA4EA@BL1PR11MB5447.namprd11.prod.outlook.com>
References: <20250707015825.3522467-2-shuicheng.lin@intel.com>
 <1094c4f1-3273-4832-b282-7489d938eb25@intel.com>
In-Reply-To: <1094c4f1-3273-4832-b282-7489d938eb25@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5447:EE_|CY5PR11MB6365:EE_
x-ms-office365-filtering-correlation-id: a9a6b2b6-1c3f-44ba-f5de-08ddbdc84b64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VTFETytQaHpwbEQ4VlFuRFNpM3IzSVpVczNvRHdtNHdBbHpaNndVMmxiRVF6?=
 =?utf-8?B?T01zQ3RaSmlHeVZxR0d5dDdaeElZRURuR1lxSktNZ1RJVWZhdUJDWjljMFBJ?=
 =?utf-8?B?MFNxaG1sb1VyVUlqQ3JuTTNBSWpHdHV4b1ZYYjZpWHVnSzFKdDIxTmk5Tm9S?=
 =?utf-8?B?bXZpMFpDNEtkdEhyMGhnajZmdUJ6S1plV2FObmI5b004bWFoS1phcENOTGdr?=
 =?utf-8?B?V2IvL2xWbTNWN2x4YkJsWW9JMWI3UnhNVTB1S1grMnJmMURXQnBJNnhTdXQz?=
 =?utf-8?B?RUxyWWRXVmhnVXdudjNtcEIvTytQVW9qUU5KUGZWRmZMZ2VYc1VvY3NHZ0M0?=
 =?utf-8?B?S3U5N0RvZUQyRmVMRVRhRmlvMTFsVWdXMkh4VzdCVi9wd3c1enZvSkpkbXpk?=
 =?utf-8?B?M1B1bHVpM3RZaDhSaGY4V3U1aEpoOHRJL1BOUTYyQUd4L2NSQ0VuTjVIaVFq?=
 =?utf-8?B?S0pEc3VodTdTcStSc3RsbFJmMzNVTGxXWEZRNXM3d0g1VUMvcTI0VkhkY0da?=
 =?utf-8?B?MHZ6VUxjeWJsSUY5MmJyRlpLREs1WG5yQ2JndXlQekZZQUczQzdwYlQyMFNl?=
 =?utf-8?B?UWo4N2t0L2lsTDcyQ1VTNUNQelU2VGVEUVNHVTg3ZGdxeFlQRUZZc3R3UnB5?=
 =?utf-8?B?S1RlT09iZ2FEZnp1SnZXNjVBcVdRNVVRM1NaM1REOTVBSmU3b25WKzJqT3U0?=
 =?utf-8?B?a295WFBzcWh0QzBhL0xaYlR3S2pNRGExV2FnUlk4L0MvMnowb0tYLzlKNHFy?=
 =?utf-8?B?enN3WEdqbFlVT3VsdDdTTGVYbityUGxsVXlRMHhDQ2JEOHhJRHptMmxSUnV2?=
 =?utf-8?B?UUxQVVVLc2ZHU2MvNGtHc3BMSUdGa25uRmR1RWVMS2NrSmVWSmdmTUdBTjRC?=
 =?utf-8?B?M09RSmpVLzBGeEJnbGxVN3Q1ejBkeFBydlJHWm54OUdUZXJaa3J5Q3A3WTZs?=
 =?utf-8?B?YnlQQ2lSMXByWnNxTWdCTnBJTWtkdkpoV0llUEVESGZ1OHQrNk95MjdhVjdi?=
 =?utf-8?B?QlRlVExhNjJTRWErMDJjL2ZHU2Nhams5bUpZaTlMdjZlWkxUcUdhbHluSWNG?=
 =?utf-8?B?b01nTFhkK2QvN1MrNytjbXhkak1OU0xhQXg2WWM5T0pya2grd0puVytqWVMr?=
 =?utf-8?B?WmQxcGJObDJnbGVwM25JdmluZHRNajl4YUorLzg5dU9lVGlmYXgrbThUY3p2?=
 =?utf-8?B?U2ZwT0NsQkxEVXpWSUdZUFV3NlRYZDFIbndEcWhlZ3ovcWRaemhrQjBaV1Zs?=
 =?utf-8?B?UndLWHIvT0ZvYWpHeHdFYTZZL0NORTZDL2JSRXhDNTI1VnZaaVVDUE5ZaVVY?=
 =?utf-8?B?Qk9BK3JPWndFS2FreDVUei9Zdk03OGVlT2tNV2hVMm01MnU2V1RueXlITGFI?=
 =?utf-8?B?dWlZcHAzbFJuTFo4YXVOYXhTcTBPQ0dmL01YZ1hVSVVkQk0wYU5ob2Rmb3Vi?=
 =?utf-8?B?akJDcmR6YXc4cU5TcUNScUFtdnErQWRaQW5PbE05KzJTc3dsM1g2K3ozMEJN?=
 =?utf-8?B?RDdDVE9uZzc0WDYxRDB0UFJiU3M5RGQ3b0hmZXRhamxvQ0taMDkyNndWWU9J?=
 =?utf-8?B?UGpTMGVtRXN5S2pZSUxBb3dHdVYrMjlsVlZiTUF6Uk5pZGtsOXlGdHNrZkNV?=
 =?utf-8?B?cXRaNnVpZnFWOTY3MUpla3FMT2EwY2lOWGM2SkFTd3M0VDdKODdpR3N0aUc4?=
 =?utf-8?B?b3BsWXYwK0xvclp5KzVPYk00bnNnRnQ2Q28ybS9iVzVHYnh4OHlJTVJJV1FE?=
 =?utf-8?B?Z0ZhY2xqak1EZ1lqajhXOEJKekFDSEd1cmljTVlQRVNmOXZCUzFmTHBBTVlK?=
 =?utf-8?B?NmUrczIzbjJpQ1dqU05yanVPejBIWFZwWUJhQnZ0L0JiV1RtQ3hLZWxPTE92?=
 =?utf-8?B?R2tVSDVMSWNSazFmeWJURzhCQWdXZUlrTzl6TWVlM2YxeThwVnNmUkROcDhT?=
 =?utf-8?B?ZkwyWTNFdVlOdEZHNE5neEUvUDRwUms4MHhWaFpGNzhDSWQ2Y3ppb29zTEJn?=
 =?utf-8?B?TE5UREdGZ0l3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5447.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UnhLUUFPZWkwTW04RE56SGFFd3JieFA3TmppWDY1cHpwMXFSb1E5T05pd29v?=
 =?utf-8?B?ajZydDcvc3EvNkk5ZmpiOXRYVE9uejZ0TkhzelFrWUFTOE5mNHJocllwS21W?=
 =?utf-8?B?TlRPVzhHYWUvVmZqQklOQUFDZDVDWU9lZkVnZ1NjVHVPMVZKVXFackxaU0xY?=
 =?utf-8?B?azhLSEFDNHRkTjF6aTB1OXBSZ0ZteVlLSUg1Z2MrSzdYS1ZiYXA5MmY5ODNu?=
 =?utf-8?B?S0dCaTdpb001NlJjajlFQzVnbXpzU2ZSNUNmRmZPSTVQdjlSTVZsTjF4M3Qv?=
 =?utf-8?B?R0xERW8ycEFGaGdYMVZyVXRyM0RVZ3RxaTlRTGJKME5rZ3A4UENoTUpMMjBx?=
 =?utf-8?B?eTlLWFM5WmNSN1UyckEvZm1tM2pvQURaVVkrR0ZXUUpKcUJDRUJtR2RXVXdp?=
 =?utf-8?B?c2VmdXlnRi9pWmlBUjc3RUxxNjIrcEtLR2duRUFRWHlzaXkxbENaSHZwMElR?=
 =?utf-8?B?STBqNzVQNUZGeXBhalhIc2oxUzV3YXFSUmp1RW5ZWDBEZGZVazFFOHY0MmpF?=
 =?utf-8?B?Ry9lWU5aQ2hYYXRLMnlDRkhPQlQrUWNqdzkyVmorRDl0WWwveW15U0hRdENp?=
 =?utf-8?B?NW05a2J1REpXQmlXb1pPRHJoREUyREpxVi93SWMrdzFkaG9jbmg0VzV3N0t6?=
 =?utf-8?B?WHhWR0tPRzFGMER3YmtacEdjUmJwTUVXRkVvdlU3VlZEb0oyVGtpVEthZ0ZN?=
 =?utf-8?B?NHpvTHpUalVLcmdHZW1tTXVORTYxSmVVcGZJdnFLM0N0K2xyaUJaemNBMzVw?=
 =?utf-8?B?eExLc0JIa1V5MXZBc3lJRm90YXlOQU14N0VqRGRyU09HaEtuSjZmY1ZCUzBK?=
 =?utf-8?B?aU5HaFhTeW5jSEFDa2Y0aVB0a0pEUzgwVnN5M2c3U21tUlUvMVZtQmljQXJW?=
 =?utf-8?B?RlRBTHFDYzJ1UnZIZ0FSeVlXcVVCeDlkMXk0Qk5KN0xhY0tCTm1SWjkxNDEz?=
 =?utf-8?B?aUtVS3NBU3Fma2RBYStJTHZLOTJBcUwwa2VOTDBkUHVJd0VtU3JQYWFoZnI2?=
 =?utf-8?B?eWVEdTZtVndPZDJZTUh2SG5FdlRYOXkrcTlXaXBEaFRUNDJieGs5Q3FZRWxT?=
 =?utf-8?B?RUZxY1M5Um5Yb2FVM0UwQXIyM0V1VjAveTl5L2diQzFna0lYS09HQmg2UGRY?=
 =?utf-8?B?K0ErVnQrdmk2TkNjN08zUVB4ZHpmamlQMWNwcWhmdzF6b3E2NFlQcnFxV0Ez?=
 =?utf-8?B?U3FTaWZ2VGpvRFZWSlc1SkxXYXdzZVYzU0p1bjR0d1NLNCtNazkzM0IvaEta?=
 =?utf-8?B?Q05jMGhKSDZaZk9LbTA0blpDeXJqTVZvNmJGSWE2WHVzeWcwMkpBM3YyemdT?=
 =?utf-8?B?cS8vZDVtUHREQlBJdkRXV0NXRjhrb2F3eFZBMklRMXdrN3ZxaytFdWx5QWEx?=
 =?utf-8?B?ei9aVW1ybVE4R0ZzTmFtNjBVNXRSTGlyczhtRVoyMmNqbmFXTHhHaE1BekZk?=
 =?utf-8?B?aEN6cnlweUYrUTBSY0NLRHVDRE1PSzlPVVJCRFlFZ1QyK05OZ3Q3QkF0ZWF1?=
 =?utf-8?B?bXJSOEtoWnBkWTYyRWVOTG8rT1NMZ0ZybE1ucXp1SGlQMjhnbCs1Wm9OMHR2?=
 =?utf-8?B?dVAxWWgwd2hQeTU1VzEyRzg0Rk9VNkhzMVlFeTN5TGlvbyt1WWVlVG9OdEpm?=
 =?utf-8?B?YW5pTGxUZHkzeWo4dUVBeVRkSzZHYjkybExMZEJSRllZSWdWWEVtN3RDTFJt?=
 =?utf-8?B?OGZmMDk0anBXcWpValI3bjRUZTNGOFVZM0hpam90b3RsUWNJU2ZrdEF4MFh0?=
 =?utf-8?B?QkoxcUUzSGpJMjE1dTJOM0ZWUTNGYW5YbjhCaHRnWDRTYlRKNXVtNlZBRmx6?=
 =?utf-8?B?MWZRTll3TDhkS0IyZFVpczJ3MkZqbHIzbjBzWDNJdUNjeEg4Y1hacmM2QXdn?=
 =?utf-8?B?eEJxN1BrR3A4eWY2ZDlub0I5QVUvZ2w5MzFkZG1jSGJXUitnV0tUQWpmTUVl?=
 =?utf-8?B?UU4rUTRyeFNNQ3NEanVxTk4zRzk0OUc0UlFBdXdNSGRWa3NVbTJyKzNFSGx1?=
 =?utf-8?B?czl1OWwrcGxUSktIbmE1OGRwbDJZaHBhbk9rdHZDVWtEZGl5YWNOeTBqZHAw?=
 =?utf-8?B?dGJNYTBGT3YybEVhRG9IaDBldkFnV2NTMmVHMFQ2QUhQbEdzdkxrWHkwMnZE?=
 =?utf-8?Q?gNHPmRvlgwjxkhRUiyLLJqVYF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5447.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a6b2b6-1c3f-44ba-f5de-08ddbdc84b64
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2025 02:36:51.1900 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DlXbG8GtE4kJ9o9QzgZ25mQ4Cmind168k5jNhk+TYOQMeqmKE993DC/VKIr5uaDN8293v7X3wrPDKlFQjRVnrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6365
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

T24gVHVlcywgSnVseSA4LCAyMDI1IDEyOjEyIEFNIERhbmllbGUgQ2VyYW9sbyBTcHVyaW8gd3Jv
dGU6DQo+IE9uIDcvNi8yMDI1IDY6NTggUE0sIFNodWljaGVuZyBMaW4gd3JvdGU6DQo+ID4geGVf
Ym9fZXZpY3RfYWxsKCkgaXMgY2FsbGVkIGFmdGVyIHhlX2Rpc3BsYXlfcG1fc3VzcGVuZCgpLiBT
byBpZiB0aGVyZQ0KPiA+IGlzIGVycm9yIHdpdGggeGVfYm9fZXZpY3RfYWxsKCksIGRpc3BsYXkg
cG0gc2hvdWxkIGJlIHJlc3RvcmVkLg0KPiA+DQo+ID4gRml4ZXM6IDUxNDYyMjExZjRhOSAoImRy
bS94ZS9weHA6IGFkZCBQWFAgUE0gc3VwcG9ydCIpDQo+ID4gQ2M6IERhbmllbGUgQ2VyYW9sbyBT
cHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+ID4gQ2M6IEpvaG4gSGFy
cmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2h1
aWNoZW5nIExpbiA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+DQo+IA0KPiBJZiB5b3UgbG9vayBh
dCA1MTQ2MjIxMWY0YTksIHlvdSdsbCBzZWUgdGhhdCBiZWZvcmUgdGhlIFBYUCBjaGFuZ2VzIHdl
cmUgYWRkZWQNCj4geGVfZGlzcGxheV9wbV9yZXN1bWUgd2FzIG9ubHkgY2FsbGVkIGZyb20gdGhl
IGVycm9yIHBhdGggb2YgeGVfZ3Rfc3VzcGVuZA0KPiAoZXZlbiB0aG91Z2ggeGVfYm9fZXZpY3Rf
YWxsIHdhcyBhbHJlYWR5IHRoZXJlKSwgc28gSSd2ZSBrZXB0IHRoYXQgYmVoYXZpb3Igd2hlbg0K
PiBJIGFkZGVkIHRoZSBQWFAgY2hhbmdlcy4NCj4gVGhhdCBwcmUtUFhQIGJlaGF2aW9yIGlzIHN0
aWxsIHByZXNlbnQgaW4gdGhlIDYuMTIgTFRTIGtlcm5lbCwgc28gaWYgdGhhdCdzIHdyb25nIGl0
DQo+IG5lZWRzIHRvIGJlIGZpeGVkIHRoZXJlIGFzIHdlbGwuDQoNClRvdGFsbHkgYWdyZWUgd2l0
aCB5b3UuIEFjdHVhbGx5LCBJIGFtIG5vdCBzdXJlIHRoZSBGaXhlcyB0YWcgc2hvdWxkIGJlIGFk
ZGVkIG9yIG5vdC4NCkxldCBtZSByZW1vdmUgdGhlIEZpeGVzIHRhZywgYW5kIGxvb3AgZGlzcGxh
eSBleHBlcnQgdG8gaGVscCByZXZpZXcgdGhlIGNoYW5nZSBhbHNvLg0KVGhhbmtzIGZvciB0aGUg
ZGV0YWlsZWQgaW5mb3JtYXRpb24uDQoNClNodWljaGVuZw0KDQo+IA0KPiBMb29raW5nIGF0IHRo
ZSBoaXN0b3J5LCBpdCBsb29rcyBsaWtlIHRoZSBwYXRjaCB0aGF0IG1vdmVkIHRoZSBjYWxsIHRv
DQo+IHhlX2Rpc3BsYXlfcG1fcmVzdW1lIHRvIGJlZm9yZSB0aGUgZXZpY3RfYWxsIHdpdGhvdXQg
YWRqdXN0aW5nIHRoZSBlcnJvcg0KPiBtYW5hZ2VtZW50IHdhcyB0aGlzIG9uZToNCj4gY2I4Zjgx
YzE3NTMxICgiZHJtL3hlL2Rpc3BsYXk6IE1ha2UgZGlzcGxheSBzdXNwZW5kL3Jlc3VtZSB3b3Jr
IG9uDQo+IGRpc2NyZXRlIikNCj4gDQo+IEdpdmVuIGhvdyBkaWZmZXJlbnQgdGhlIGNvZGUgaXMs
IEkgZG9uJ3Qga25vdyBpZiBpdCBpcyBiZXR0ZXIgdG8gc2VuZCBhIHNlcGFyYXRlDQo+IHBhdGNo
IGZvciB0aGF0IHRvIHRoZSBzdGFibGUgdHJlZSwgb3IgdG8gdXBkYXRlIHRoZSBmaXhlcyB0YWcg
b24gdGhpcyBvbmUgYW5kIHNlbmQNCj4gdGhlIHNlcGFyYXRlIHBhdGNoIHdoZW4gaXQgZmFpbHMg
dG8gYXBwbHkuDQo+IA0KPiBJZiB5b3Ugd2FudCB0byBnbyB3aXRoIHRoZSBmb3JtZXIsIHRoaXMg
aXM6DQo+IFJldmlld2VkLWJ5OiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5pZWxlLmNlcmFv
bG9zcHVyaW9AaW50ZWwuY29tPg0KPiANCj4gQnV0IHBsZWFzZSBhbHNvIGdldCBhbiBhY2sgZnJv
bSBzb21lb25lIG9uIHRoZSBkaXNwbGF5IHNpZGUgdG8gbWFrZSBzdXJlIHRoaXMNCj4gd2FzIG5v
dCBpbnRlbnRpb25hbC4NCj4gDQo+IERhbmllbGUNCj4gDQo+ID4gLS0tDQo+ID4gICBkcml2ZXJz
L2dwdS9kcm0veGUveGVfcG0uYyB8IDMgKy0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3BtLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcG0uYw0KPiA+IGluZGV4
IGZmNzQ5ZWRjMDA1Yi4uYmNmZGE1NDVlNzRmIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9wbS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BtLmMNCj4g
PiBAQCAtMTM0LDcgKzEzNCw3IEBAIGludCB4ZV9wbV9zdXNwZW5kKHN0cnVjdCB4ZV9kZXZpY2Ug
KnhlKQ0KPiA+ICAgCS8qIEZJWE1FOiBTdXBlciByYWNleS4uLiAqLw0KPiA+ICAgCWVyciA9IHhl
X2JvX2V2aWN0X2FsbCh4ZSk7DQo+ID4gICAJaWYgKGVycikNCj4gPiAtCQlnb3RvIGVycl9weHA7
DQo+ID4gKwkJZ290byBlcnJfZGlzcGxheTsNCj4gPg0KPiA+ICAgCWZvcl9lYWNoX2d0KGd0LCB4
ZSwgaWQpIHsNCj4gPiAgIAkJZXJyID0geGVfZ3Rfc3VzcGVuZChndCk7DQo+ID4gQEAgLTE1MSw3
ICsxNTEsNiBAQCBpbnQgeGVfcG1fc3VzcGVuZChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPg0K
PiA+ICAgZXJyX2Rpc3BsYXk6DQo+ID4gICAJeGVfZGlzcGxheV9wbV9yZXN1bWUoeGUpOw0KPiA+
IC1lcnJfcHhwOg0KPiA+ICAgCXhlX3B4cF9wbV9yZXN1bWUoeGUtPnB4cCk7DQo+ID4gICBlcnI6
DQo+ID4gICAJZHJtX2RiZygmeGUtPmRybSwgIkRldmljZSBzdXNwZW5kIGZhaWxlZCAlZFxuIiwg
ZXJyKTsNCg0K
