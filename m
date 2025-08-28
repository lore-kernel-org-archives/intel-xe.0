Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A99DC8303F
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 20:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A2510EABA;
	Thu, 28 Aug 2025 20:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hdD24XU4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BB810EABA
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 20:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756411807; x=1787947807;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ysACqubsY0yVNch6gNcjUh1dg9q31VYOp2q0SHgYCog=;
 b=hdD24XU4wiyj+aLkLQimjqxxtnRDxk7DGqX9UqMURSXaP4WUOCwXzJEf
 VNIqQey3Kjshs9Ox4BC+fgua9Mn9vCnvybgCXS9v0CWwCHkp9r4xqqmr/
 BwcIY8ij6zRBQPn3+UHiojMmtOlOf1sGhb1Cw/WE620FA/P+NysIkcFYD
 ql+mMey1S4cs4fJbmyQP5gZCoEm9FSd1xJHcEiRpfDf/+RkvdjR/0ZDJy
 09YGnoRNz62Gz27QqcoeuPuqOpHYCbSc4Et4T9w/OG8+pyTFVgMapiYXL
 pdU+jWlk+bgo7mz7wlYO4KsT/Msnmsr0W02vCjN6quO+pR+W6wy/d+inW Q==;
X-CSE-ConnectionGUID: p2j5DPfiSsuokv1l14MkSg==
X-CSE-MsgGUID: h1zL6zIKSCq1UgdOl8lqJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="84097598"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="84097598"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 13:10:05 -0700
X-CSE-ConnectionGUID: sX8SNOz2TFKe6WNaEKxOGA==
X-CSE-MsgGUID: y5LTej6uRUWNtdvb/Qk6kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170998380"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 13:10:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 13:10:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 13:10:05 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.55)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 13:10:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YM59sizP8Cl6rBEKFbw7wUGgNkDDw8BS1k5MOkJ2COlr55Bd2ONFjRcFUJcqR+kTMPT6xUcQFeMN0iJTwPL14QFOXDCzjcFA9+o9Zf16L6jl/JpT9+qG9RmuQVOtMh8iX54bFvuoeOrSVjsSNWaKnokWmj9xrXxf8XVqtSdLWmaQqJvwqc4riCYXeLfbX3OU3HnWxlq8tco0Y+HVWwP+FLGr7PrTqEblfiHQLFdf31xTReVBKmLNccNTvMOYvkePgeHD2kED0RrGFpdunNAyzzjGXTA4vOb9K5nPAlqArANCSMhwPiel5Sgx1ehP/szlM09lYZRrpDMKTO5w4o5NbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ysACqubsY0yVNch6gNcjUh1dg9q31VYOp2q0SHgYCog=;
 b=XOD2ahHqxeTk6V/LvjovygzwU0nLD4wm1rbeNXs+WNMWOnwmJXP7oWffMOn6NTPTKWCT1jh91fUkBi6vYfj3T7ErP6W7h/klAgmxpCte/d3jkgnibF1/YdPUm3YldL+DqPtMJAzhf/oRxRg4rEMFWPENabwhA9QqxM+CDnsJtEbuXPtUANUi0lrnYfWfCm1jWs9qBrwpW2WCGCt/oorMyu/VG6Vw593XC8WW7cZ+TbpLohXUFy3nX8CT2eRdD3Czbmt78mOlV076kR0/47sCacppJQIho4n5x6KzM/XHxg5frrU/nDPSfETaFN9pD38Z6PD9MDa01aBqXgV6JilKHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 LV3PR11MB8555.namprd11.prod.outlook.com (2603:10b6:408:1b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Thu, 28 Aug
 2025 20:10:02 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9052.021; Thu, 28 Aug 2025
 20:10:02 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Mrozek, Michal" <michal.mrozek@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH 02/11] drm/xe: Implement xe_pagefault_init
Thread-Topic: [PATCH 02/11] drm/xe: Implement xe_pagefault_init
Thread-Index: AQHcBpqUULnsSN/1VEeqxSPKxk3pY7R4okKA
Date: Thu, 28 Aug 2025 20:10:02 +0000
Message-ID: <2efe98148129c4233337d92f28fba91dc2cf6f89.camel@intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-3-matthew.brost@intel.com>
In-Reply-To: <20250806062242.1090416-3-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|LV3PR11MB8555:EE_
x-ms-office365-filtering-correlation-id: f19035e4-c6dd-4eb9-e149-08dde66edf34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?N1R5SnRmVnJWbUducFllbEMrUVU3bStOc2Y0VkI0OHFkRWRvZ1gvdUJNYUhV?=
 =?utf-8?B?Um92WTRFQmllT1IxMHJUSkRRZURocm9qWlJzVURnVU9PazZkWkZCMTZISDRX?=
 =?utf-8?B?Vlljd0p0VWNwaWxFSWlCaXJlckh1K2NyZlEyTU44ZHdvNTNRZEV1ZGNVZFBu?=
 =?utf-8?B?b0wzdGF1cUJ6NGFpVjFZbi82ZlVOQ2hNZnlheFU1dUFQdWlCZ25ZZlZtSlYz?=
 =?utf-8?B?UFIwMTdMREZBWXBkaU01WXN5R1BDSGpCeEZqRS9DclkwWHhBOEtNQjB4QWhr?=
 =?utf-8?B?YURUQUV4OHBVWXB3L3hjMDFCV1dOK09tbnp3aEUwcXFOYzNKQlprdThVdnRh?=
 =?utf-8?B?NUE0RjlMN25UWjA4Z3BFZFc1MmNrL05jT21OM1JGZkdFYUk4M2RFR05zTFJL?=
 =?utf-8?B?cUp0ajA5d0lVODZyb0dXc0Q1ZFJlNkprcFRhRjdiV25Qd05ucGxXWU5nWktp?=
 =?utf-8?B?ak9LNHhyZlRVQU5ZQ2l5Z2FqeFFsTDFtZnlzcy9JT2JDZ000Y1hwN2o5ZXdp?=
 =?utf-8?B?T2JqL1pRYXRITGtpWGxHdWlHMTVuREtxUnJCR01KMDZLalhTeDdwbUllUUc0?=
 =?utf-8?B?Q1pDVWZQRy9yWjVoSHN5SzI2ZENYcURpaFFpbDVSUGFnT1JhVklrUnpCeW1n?=
 =?utf-8?B?Wjg1aTF4K21heVQyeXRrQUlXNHdhOEcxM3BucGg3OHhMdXd6ZjJ3dzd6cnp2?=
 =?utf-8?B?RDhOM21iVFZYOTRJY1hWQ2dScTIvbnQyS085NlhTQ0JxUlMvUjlVVlBac0Jx?=
 =?utf-8?B?aU1qbGxmajJFK0pSY0JQdTE4MHFFZXEzZU9yUFhFRk5TMFBzdkdFdHZRZUUx?=
 =?utf-8?B?SHpFaGxYVWlGazNsSk52bXdjaThlekhmMEJ1RG1qWnV0eEhoaUVjNFZNeFhn?=
 =?utf-8?B?TmxRcTV2Nlg0RU1iTXFuc0FvZk9ZMXdIejdFSFVVN1dKNnFackFyRUR0YUxK?=
 =?utf-8?B?WWsrdVlEVWJqOTFoNmorVDA0M3M5clBGNGhnbXZJYVBXZVBNVDN2VWtOSWc3?=
 =?utf-8?B?ZkQvcC9ubVBzZUVNYko3NVU0dTBDSDVHK1BKZUNtR1ZYYWxzY0VqcjJPQVVN?=
 =?utf-8?B?dWFzRmNqY2Jzd21aY0FYTFFNM0xYRE9jSDR5UUdFUktyWlo5aUFWaDM5V3Ni?=
 =?utf-8?B?dWZWeUgzMEI3dkFiZ0czTTEyOGswWjdaTHlVWjFISGZYcCtpa1c1cTIwRlpV?=
 =?utf-8?B?RS9YeS9aSnNTcDN1VDVjcTJWMitCMFp4c1c1MHZZUDBuMUl4RFpZNEN5WUd4?=
 =?utf-8?B?Ym9iSHB5YlVabG9aL1RKbDBac2NFNXZ4bDhGK3Q1SzlVclpUSGUwZUxRVUNG?=
 =?utf-8?B?cEhFZnd1b3daaDJqNUphVEJodWo0RUVKSlkzMWp4Uyt2dlhOTExZbWRVdTEy?=
 =?utf-8?B?TlN3SWV1VkZuRmh3aEJWU092NzMwVFFQbzAzRzNaQjJuRld3UjR2dC95TFo0?=
 =?utf-8?B?RTRzcUhTanZDUjdsNEpIQm4vdVBqR3A2eHBPVEMvSG9Nc2FPeUx4RWRGaHNi?=
 =?utf-8?B?dUN4ZDYyRVI5WTErUmdrZ2h4eW5qRjEvUDA5bC9uMUU3L3gzdUh4QW1ZbEVH?=
 =?utf-8?B?UDE1UmRNb1pZL0ZnZ1BxY0U2V0RVS3hjN1dFSEtTYlZOZDdQR0NRbGF5T053?=
 =?utf-8?B?WEVVWVRnd0U0L1ZQcUJoekl1VDg5cVJ3aHpQQXlxN3hPTU1XR0tOVkNkb1Y0?=
 =?utf-8?B?WlNKb3BtaTNncE9oM1lQSVFVSXZyb3YyWDNtQVhBUXFUMmYvY0pneFFrZjYv?=
 =?utf-8?B?V25HY091SXlNRXU5MDM5QVMybjNFYjd0VVdDVUo0UmpzWEx5L1JxbHpVZWs5?=
 =?utf-8?B?K2NYQzErM2h6VE50bkxCeWlxbzZjYWREd0VSNzNWdnloQ0I2Sis1di9SdDRo?=
 =?utf-8?B?ejZIZ1VIby95a21yS2FXS254c0Y1eHJsZ2Z0c01zd0MyWFl2N1FTQ3QxUVRZ?=
 =?utf-8?B?L3diK3RDejNiSmJRNG13a2JPNDQ2UVc5aXFXWVArcGZ2QnBCb1g3cFYvS3Zk?=
 =?utf-8?Q?Ky4HMlzXKcuBzDmAO/zIf4R/XDOrpA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0JmdjhoS1NvWC9hZ0JqTkpBM1I2TnlYQ3lKNFFISit1UWh5UFh5Tk5valc3?=
 =?utf-8?B?V2Q1Z2xiQ3MrUlZnQkpLb3RpbUhFa01vT2ZzTzhCMk1iTXYwbll2N0pvWlZp?=
 =?utf-8?B?dTE2Y1Q5QXRqdVB4QnBkQ2lSTy9BVkJqSlhDMjZyN2o2QzFpRDdkYzBUN0JE?=
 =?utf-8?B?UTJNSjF0V21aMUFVR2hudDBBRUhHWEw3cjBJVEpYTzBtUTUvVUxpSDgrVm81?=
 =?utf-8?B?UDQ0b2VCM01lLzdsTytybjdLYXRpcHRNWE93Z3JOclpUa2RmYWZ3QWpDSU95?=
 =?utf-8?B?TGhRbVI3REpOanhtcVUyZ0M0UEZVaUluY2lJempWMFRmVHM2eHN6S2tYZmNE?=
 =?utf-8?B?eUtMTmJZeDk0TzVkNE1sZy9jM3Z4c0VnNzVUNVpoSDdEWG5pWk93cE5vVzND?=
 =?utf-8?B?Z1VnTmlRbkJvelRUSkxuVHRWQTd4cHZHcVJjS29OeTMvZ1pQQjJGSGdJV05l?=
 =?utf-8?B?VVFxR3hRL2Jzb1c1UXh0TlViYU8xaGVKWWg1eVhGNVFnQm1CV1pLNWtaV1hY?=
 =?utf-8?B?eTVTT09hektBdS94R2IwNFBjdFJVZHRrTk1HMklKdGtCMmVvdG9FUEJub0E1?=
 =?utf-8?B?V2JOb0FFcmllV0UwemtiV2FBQTErS25Lb3FUeFNJdFFwRVA5TDdiZjR6TXBt?=
 =?utf-8?B?OCtHWnZYMUVZQnJSazA0cTA2bnlJN2NBYkNqT0FIRXU5bUcxd2FreFJOcWpZ?=
 =?utf-8?B?VlNHWDBvdFk4SkpwRnNuSTdrV1BKMW9pOWtHZzBHSmQ3bm1nYTg5aHFhcWxC?=
 =?utf-8?B?OHowM1hSeGVWQjVMT3o2YzFLK0hteGo1clVGRFJITUJzT0I5Qllma3VmQ0o4?=
 =?utf-8?B?VmlHeXhtRnJMNzZIZk85OCt2Z1M0UjNicHNCWnZ6U3FsYjU3TnJHZHE5c2Uv?=
 =?utf-8?B?V3p2RTUwWFFRMXdUSlNCTDdFb1BtVDR3ckxJeXVPck93dkNkVE1IM3k5WEE5?=
 =?utf-8?B?MDNydFpsM0Y4cDBXbjFYVW4vQmRPSEVEZWhvWlBpWThHTlRzY0dLU3VJeVRN?=
 =?utf-8?B?ekVWclhTYitFY0IrQTh4d1ZXUFhIT1VNaStWbTVyVHNVU2ZnREZyTWJRZ3ZE?=
 =?utf-8?B?alhyNkhQd1VLUlVUREFrZEV1djd2aVpudS9zRTdUckkzM0xSSkVUaXk5VUdC?=
 =?utf-8?B?Z0M5Z2o0aHBnOGxZWk5CdlZlRlBQdlVRamtxMzVTMHpyQmJaaEs4aFgwSGs5?=
 =?utf-8?B?RmxoeEhqY3VuTXZMc2wwcXBkUkJnRjdtWTF2SElVWHNpeEhGYm1UR0ZqUzBY?=
 =?utf-8?B?M2xscEsyZmNtOTJQWjkvQzJVTXhKMmhwYVFFTGplR1NYU2Z2ODB5K3pKRzlk?=
 =?utf-8?B?ZlBBbHJDYmt3ZFBaaHc0dnd6Y3F0MjVmSTltd1FoMTRIdzVsWFF4dlduSHZk?=
 =?utf-8?B?aEdLV2dBcG55bGE4dXMvWHpXR3UrYmlZN1Y3bzJWbzF6UGpNMG5SdzQwU2NK?=
 =?utf-8?B?Mi9MR3ErcHV0WDFmVHlFM1JKZkpSYnNBQ09ua0dabmtJaUFKOGRsMjRWT3Fr?=
 =?utf-8?B?eTJOVzdQY2wyY1VlNjFoeU9GOXlCTWxGYnd5V3A3dTV5a3ZqeVhHTTNzeE00?=
 =?utf-8?B?SWpscGtvUG5UYjlQZjQ1Y3oxSUVjNktkbWthZU4xWjVXbnl6MmFnbGxTdXdl?=
 =?utf-8?B?OVVOOFN3TVA2enlZdW9HT0ZTU1l0WVdEeUZYeEZKd0M1MmM1ZEpkeERWOTlL?=
 =?utf-8?B?WjBFTGNOZzJuUEVVSEhYNkJ3b2JWSGhzblFVS29MbEJRaDJsNWM3L3pONER4?=
 =?utf-8?B?NGFiTXREUmRqMFZrWWtZb2RMQnhzNTc2UUpnYURVQlBibWhNVkVCT05DL3g1?=
 =?utf-8?B?aHk0L1VVTGFNRGJaQ0xuVndUQ29MeXAzYmg3REhQTXdvT2FFellMaUhaTlFq?=
 =?utf-8?B?eXdwSHBiajJDN1FDM3QrUHVPZXBTOEJiTnFBQ2U1cEUyeGRrS1R4OVcvSG1E?=
 =?utf-8?B?Y2gwZUJmQ2lhdElHaFh0UFJRZ0t3Q3JJVmJYclhiMWdhUkd3UFRCNjRZS0p3?=
 =?utf-8?B?bGtsd1dXVUN0bFRvTXAvT1RoZVpCZFRsTzIwWGtPR3U2cDNaSSt5eWZMaVpr?=
 =?utf-8?B?Z3AydmdROXZvRDlad2xXR2VuaHZpN1drOEZ4VzVmTkRobm1jck1STUY4ellt?=
 =?utf-8?B?d2d2YVNtelpUcHVNdHlGTnNseHgvbDQ3QjNCbSt2K2lOQjBQdlNVanJ6T3kv?=
 =?utf-8?B?bmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E4FBDE208FE1A4AB7B099A0B52DB979@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f19035e4-c6dd-4eb9-e149-08dde66edf34
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 20:10:02.2034 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2EJApUjsMN/ZrG0K/orW/Pqx1EiIMWVgm+aQ/bhAgrnIezd/vxvThaWalwTXdA/bmfeZi76Thth7c+/XyGG4bAS/xaOB0Nw95VYMyZ7K9aY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8555
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

T24gVHVlLCAyMDI1LTA4LTA1IGF0IDIzOjIyIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IENyZWF0ZSBwYWdlZmF1bHQgcXVldWVzIGFuZCBpbml0aWFsaXplIHRoZW0uCj4gCj4gU2lnbmVk
LW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+Cj4gLS0tCj4g
wqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmPCoMKgwqDCoMKgwqAgfMKgIDUgKysKPiDC
oGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaCB8wqAgNiArKwo+IMKgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3BhZ2VmYXVsdC5jwqDCoMKgIHwgOTMKPiArKysrKysrKysrKysrKysr
KysrKysrKysrKystCj4gwqAzIGZpbGVzIGNoYW5nZWQsIDEwMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNl
LmMKPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYwo+IGluZGV4IDU3ZWRiYzYzZGE2
Zi4uYzdjOGFlZTAzODQxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZp
Y2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYwo+IEBAIC01MCw2ICs1
MCw3IEBACj4gwqAjaW5jbHVkZSAieGVfbnZtLmgiCj4gwqAjaW5jbHVkZSAieGVfb2EuaCIKPiDC
oCNpbmNsdWRlICJ4ZV9vYnNlcnZhdGlvbi5oIgo+ICsjaW5jbHVkZSAieGVfcGFnZWZhdWx0Lmgi
Cj4gwqAjaW5jbHVkZSAieGVfcGF0LmgiCj4gwqAjaW5jbHVkZSAieGVfcGNvZGUuaCIKPiDCoCNp
bmNsdWRlICJ4ZV9wbS5oIgo+IEBAIC04OTAsNiArODkxLDEwIEBAIGludCB4ZV9kZXZpY2VfcHJv
YmUoc3RydWN0IHhlX2RldmljZSAqeGUpCj4gwqDCoMKgwqDCoMKgwqDCoGlmIChlcnIpCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZXJyOwo+IMKgCj4gK8KgwqDCoMKg
wqDCoMKgZXJyID0geGVfcGFnZWZhdWx0X2luaXQoeGUpOwo+ICvCoMKgwqDCoMKgwqDCoGlmIChl
cnIpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBlcnI7Cj4gKwo+IMKg
wqDCoMKgwqDCoMKgwqB4ZV9udm1faW5pdCh4ZSk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgZXJy
ID0geGVfaGVjaV9nc2NfaW5pdCh4ZSk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9kZXZpY2VfdHlwZXMuaAo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBl
cy5oCj4gaW5kZXggMDFlOGZhMGQyZjlmLi42YWExMTkwMjZjZTkgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2RldmljZV90eXBlcy5oCj4gQEAgLTE3LDYgKzE3LDcgQEAKPiDCoCNpbmNsdWRlICJ4
ZV9sbXR0X3R5cGVzLmgiCj4gwqAjaW5jbHVkZSAieGVfbWVtaXJxX3R5cGVzLmgiCj4gwqAjaW5j
bHVkZSAieGVfb2FfdHlwZXMuaCIKPiArI2luY2x1ZGUgInhlX3BhZ2VmYXVsdF90eXBlcy5oIgo+
IMKgI2luY2x1ZGUgInhlX3BsYXRmb3JtX3R5cGVzLmgiCj4gwqAjaW5jbHVkZSAieGVfcG11X3R5
cGVzLmgiCj4gwqAjaW5jbHVkZSAieGVfcHRfdHlwZXMuaCIKPiBAQCAtMzk0LDYgKzM5NSwxMSBA
QCBzdHJ1Y3QgeGVfZGV2aWNlIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHUz
MiBuZXh0X2FzaWQ7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiogQHVzbS5s
b2NrOiBwcm90ZWN0cyBVTSBzdGF0ZSAqLwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgc3RydWN0IHJ3X3NlbWFwaG9yZSBsb2NrOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAvKiogQHVzbS5wZl93cTogcGFnZSBmYXVsdCB3b3JrIHF1ZXVlLCB1bmJvdW5kLCBoaWdo
Cj4gcHJpb3JpdHkgKi8KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHdv
cmtxdWV1ZV9zdHJ1Y3QgKnBmX3dxOwo+ICsjZGVmaW5lIFhFX1BBR0VGQVVMVF9RVUVVRV9DT1VO
VMKgwqDCoMKgwqDCoMKgNAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiogQHBm
X3F1ZXVlOiBQYWdlIGZhdWx0IHF1ZXVlcyAqLwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBzdHJ1Y3QgeGVfcGFnZWZhdWx0X3F1ZXVlCj4gcGZfcXVldWVbWEVfUEFHRUZBVUxUX1FV
RVVFX0NPVU5UXTsKPiDCoMKgwqDCoMKgwqDCoMKgfSB1c207Cj4gwqAKPiDCoMKgwqDCoMKgwqDC
oMKgLyoqIEBwaW5uZWQ6IHBpbm5lZCBCTyBzdGF0ZSAqLwo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfcGFnZWZhdWx0LmMKPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wYWdl
ZmF1bHQuYwo+IGluZGV4IDNjZTBlOGQ3NGI5ZC4uMTQzMDRjNDFlYjIzIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wYWdlZmF1bHQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9wYWdlZmF1bHQuYwo+IEBAIC0zLDYgKzMsMTAgQEAKPiDCoCAqIENvcHlyaWdodCDC
qSAyMDI1IEludGVsIENvcnBvcmF0aW9uCj4gwqAgKi8KPiDCoAo+ICsjaW5jbHVkZSA8ZHJtL2Ry
bV9tYW5hZ2VkLmg+Cj4gKwo+ICsjaW5jbHVkZSAieGVfZGV2aWNlLmgiCj4gKyNpbmNsdWRlICJ4
ZV9ndF90eXBlcy5oIgo+IMKgI2luY2x1ZGUgInhlX3BhZ2VmYXVsdC5oIgo+IMKgI2luY2x1ZGUg
InhlX3BhZ2VmYXVsdF90eXBlcy5oIgo+IMKgCj4gQEAgLTE5LDYgKzIzLDcxIEBACj4gwqAgKiB3
aXRoIGEgc2luZ2xlIHNoYXJlZCBjb25zdW1lci4KPiDCoCAqLwo+IMKgCj4gK3N0YXRpYyBpbnQg
eGVfcGFnZWZhdWx0X2VudHJ5X3NpemUodm9pZCkKPiArewo+ICvCoMKgwqDCoMKgwqDCoHJldHVy
biByb3VuZHVwX3Bvd19vZl90d28oc2l6ZW9mKHN0cnVjdCB4ZV9wYWdlZmF1bHQpKTsKCkFuZCBo
ZXJlLCBpdCB3b3VsZCBiZSBuaWNlIGlmIHlvdSBjb3VsZCBhZGQgYSBicmllZiBjb21tZW50IHRo
YXQgdGhpcwphc3N1bWVzIHRoZSBzaXplIG9mIHN0cnVjdCB4ZV9wYWdlZmF1bHQgYWxpZ25zIHRv
IHRoZSBoYXJkd2FyZQpyZXF1aXJlbWVudHMuCgpUaGFua3MsClN0dWFydAoKPiArfQo+ICsKPiAr
c3RhdGljIHZvaWQgeGVfcGFnZWZhdWx0X3F1ZXVlX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3
KQo+ICt7Cj4gK8KgwqDCoMKgwqDCoMKgLyogVE9ETzogSW1wbGVtZW50ICovCj4gK30KPiArCj4g
K3N0YXRpYyBpbnQgeGVfcGFnZWZhdWx0X3F1ZXVlX2luaXQoc3RydWN0IHhlX2RldmljZSAqeGUs
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzdHJ1Y3QgeGVfcGFnZWZhdWx0X3F1ZXVlCj4gKnBmX3F1ZXVlKQo+ICt7
Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2d0ICpndDsKPiArwqDCoMKgwqDCoMKgwqBpbnQg
dG90YWxfbnVtX2V1cyA9IDA7Cj4gK8KgwqDCoMKgwqDCoMKgdTggaWQ7Cj4gKwo+ICvCoMKgwqDC
oMKgwqDCoGZvcl9lYWNoX2d0KGd0LCB4ZSwgaWQpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgeGVfZHNzX21hc2tfdCBhbGxfZHNzOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBpbnQgbnVtX2RzcywgbnVtX2V1czsKPiArCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGJpdG1hcF9vcihhbGxfZHNzLCBndC0+ZnVzZV90b3BvLmdfZHNzX21hc2ssCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBndC0+ZnVz
ZV90b3BvLmNfZHNzX21hc2ssCj4gWEVfTUFYX0RTU19GVVNFX0JJVFMpOwo+ICsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbnVtX2RzcyA9IGJpdG1hcF93ZWlnaHQoYWxsX2RzcywK
PiBYRV9NQVhfRFNTX0ZVU0VfQklUUyk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oG51bV9ldXMgPSBiaXRtYXBfd2VpZ2h0KGd0LQo+ID5mdXNlX3RvcG8uZXVfbWFza19wZXJfZHNz
LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBYRV9NQVhfRVVfRlVTRV9CSVRTKSAqCj4gbnVtX2Rz
czsKPiArCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRvdGFsX251bV9ldXMgKz0g
bnVtX2V1czsKPiArwqDCoMKgwqDCoMKgwqB9Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHhlX2Fzc2Vy
dCh4ZSwgdG90YWxfbnVtX2V1cyk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoC8qCj4gK8KgwqDCoMKg
wqDCoMKgICogdXNlciBjYW4gaXNzdWUgc2VwYXJhdGUgcGFnZSBmYXVsdHMgcGVyIEVVIGFuZCBw
ZXIgQ1MKPiArwqDCoMKgwqDCoMKgwqAgKgo+ICvCoMKgwqDCoMKgwqDCoCAqIFhYWDogTXVsdGlw
bGllciByZXF1aXJlZCBhcyBjb21wdXRlIFVNRCBhcmUgZ2V0dGluZyBQRgo+IHF1ZXVlIGVycm9y
cwo+ICvCoMKgwqDCoMKgwqDCoCAqIHdpdGhvdXQgaXQuIEZvbGxvdyBvbiB3aHkgdGhpcyBtdWx0
aXBsaWVyIGlzIHJlcXVpcmVkLgo+ICvCoMKgwqDCoMKgwqDCoCAqLwo+ICsjZGVmaW5lIFBGX01V
TFRJUExJRVLCoMKgOAo+ICvCoMKgwqDCoMKgwqDCoHBmX3F1ZXVlLT5zaXplID0gKHRvdGFsX251
bV9ldXMgKyBYRV9OVU1fSFdfRU5HSU5FUykgKgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqB4ZV9wYWdlZmF1bHRfZW50cnlfc2l6ZSgpICogUEZfTVVMVElQTElFUjsKPiArwqDCoMKg
wqDCoMKgwqBwZl9xdWV1ZS0+c2l6ZSA9IHJvdW5kdXBfcG93X29mX3R3byhwZl9xdWV1ZS0+c2l6
ZSk7Cj4gKyN1bmRlZiBQRl9NVUxUSVBMSUVSCj4gKwo+ICvCoMKgwqDCoMKgwqDCoGRybV9kYmco
JnhlLT5kcm0sICJ4ZV9wYWdlZmF1bHRfZW50cnlfc2l6ZT0lZCwKPiB0b3RhbF9udW1fZXVzPSVk
LCBwZl9xdWV1ZS0+c2l6ZT0ldSIsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhl
X3BhZ2VmYXVsdF9lbnRyeV9zaXplKCksIHRvdGFsX251bV9ldXMsIHBmX3F1ZXVlLQo+ID5zaXpl
KTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgcGZfcXVldWUtPmRhdGEgPSBkZXZtX2t6YWxsb2MoeGUt
PmRybS5kZXYsIHBmX3F1ZXVlLT5zaXplLAo+IEdGUF9LRVJORUwpOwo+ICvCoMKgwqDCoMKgwqDC
oGlmICghcGZfcXVldWUtPmRhdGEpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
dHVybiAtRU5PTUVNOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBzcGluX2xvY2tfaW5pdCgmcGZfcXVl
dWUtPmxvY2spOwo+ICvCoMKgwqDCoMKgwqDCoElOSVRfV09SSygmcGZfcXVldWUtPndvcmtlciwg
eGVfcGFnZWZhdWx0X3F1ZXVlX3dvcmspOwo+ICsKPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsK
PiArfQo+ICsKPiArc3RhdGljIHZvaWQgeGVfcGFnZWZhdWx0X2Zpbmkodm9pZCAqYXJnKQo+ICt7
Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2RldmljZSAqeGUgPSBhcmc7Cj4gKwo+ICvCoMKg
wqDCoMKgwqDCoGRlc3Ryb3lfd29ya3F1ZXVlKHhlLT51c20ucGZfd3EpOwo+ICt9Cj4gKwo+IMKg
LyoqCj4gwqAgKiB4ZV9wYWdlZmF1bHRfaW5pdCgpIC0gUGFnZSBmYXVsdCBpbml0Cj4gwqAgKiBA
eGU6IHhlIGRldmljZSBpbnN0YW5jZQo+IEBAIC0yOSw4ICs5OCwyOCBAQAo+IMKgICovCj4gwqBp
bnQgeGVfcGFnZWZhdWx0X2luaXQoc3RydWN0IHhlX2RldmljZSAqeGUpCj4gwqB7Cj4gLcKgwqDC
oMKgwqDCoMKgLyogVE9ETyAtIGltcGxlbWVudCAqLwo+IC3CoMKgwqDCoMKgwqDCoHJldHVybiAw
Owo+ICvCoMKgwqDCoMKgwqDCoGludCBlcnIsIGk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGlmICgh
eGUtPmluZm8uaGFzX3VzbSkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJu
IDA7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHhlLT51c20ucGZfd3EgPSBhbGxvY193b3JrcXVldWUo
InhlX3BhZ2VfZmF1bHRfd29ya19xdWV1ZSIsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFdRX1VO
Qk9VTkQgfCBXUV9ISUdIUFJJLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBYRV9QQUdFRkFVTFRf
UVVFVUVfQ09VTlQpOwo+ICvCoMKgwqDCoMKgwqDCoGlmICgheGUtPnVzbS5wZl93cSkKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FTk9NRU07Cj4gKwo+ICvCoMKgwqDC
oMKgwqDCoGZvciAoaSA9IDA7IGkgPCBYRV9QQUdFRkFVTFRfUVVFVUVfQ09VTlQ7ICsraSkgewo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlcnIgPSB4ZV9wYWdlZmF1bHRfcXVldWVf
aW5pdCh4ZSwgeGUtPnVzbS5wZl9xdWV1ZSArCj4gaSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGlmIChlcnIpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBnb3RvIGVycl9vdXQ7Cj4gK8KgwqDCoMKgwqDCoMKgfQo+ICsKPiArwqDCoMKg
wqDCoMKgwqByZXR1cm4gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KHhlLT5kcm0uZGV2LAo+IHhl
X3BhZ2VmYXVsdF9maW5pLCB4ZSk7Cj4gKwo+ICtlcnJfb3V0Ogo+ICvCoMKgwqDCoMKgwqDCoGRl
c3Ryb3lfd29ya3F1ZXVlKHhlLT51c20ucGZfd3EpOwo+ICvCoMKgwqDCoMKgwqDCoHJldHVybiBl
cnI7Cj4gwqB9Cj4gwqAKPiDCoC8qKgoK
