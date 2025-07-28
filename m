Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69667C83F17
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 18:33:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2079C10E0CE;
	Mon, 28 Jul 2025 18:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E0R9iy+c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B0F10E0CE
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 18:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753727603; x=1785263603;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f6tV3x/Jwrte+KN4L7t4nDZ6IcdJohmm/DVMjRegdt0=;
 b=E0R9iy+cagaUg9IsFKziUATTM1C/aNXO2ctmtvqZ6cwsGQkGKVi+0zzt
 5iddGFAwDn0YkOWveQRLfWf2VKDN3/BVIIte6v/cHElUvj4/JawjybsH/
 ochEDzb3PZmMaatzUvbJDfx86F6CGpyqnM1fykFhnnH3+x2d4H7sBAls1
 xSw3S3oMTQgnwRScwUky3JHiIWHjtjNoMhYVZy+U3lgNIei3IbCWfMFA7
 DruOr5NZ9CnBCWSfx/cvuiw8PnzoUeBKit4JG7Zeq4ziFP3V+85r71ZQ1
 sH4MCxjuDDM8ekMB6ZtyJvEMV5YYoXTVfHmS3v6YQmHq1kwLY+7rX2SPu g==;
X-CSE-ConnectionGUID: 4n+I2rDiQE+eCl+VfHoxNA==
X-CSE-MsgGUID: GBkXJ5rsTJ+HBzbYIJtKXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="66257243"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="66257243"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 11:33:23 -0700
X-CSE-ConnectionGUID: gZeLNjcET/m2YF6A7+1M7w==
X-CSE-MsgGUID: GxTEJes7SIyS9H5LLciwCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162944967"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 11:33:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 11:33:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 11:33:22 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.66)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 11:33:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zKv6dvboBiZfwv3jDCnRd4kwDXn2c1/UO4PUVwQlbXm37qPdt5wQKjMBD5869g4jjRyN8CViBZesDGcvFtbsvma6FxU3v+B88qPAiDrlIEK6jbtQIU7zOgRsf9uEdjW7fdFJC0H9Bfn0qPz2s3jCDh6jkzL0NZhz3fElpLXlrm96hPxCo8IAJTBH9xzFqC1Ivtay6pTGthlCWerRxhg249zHQMUEYYwEAf7IDMyMaqYTh0nYVNH37O70kxGXDNi1+uEsrJK/mrzmg5nzpKqnZnVgRetq9K2IFOyS6dxz3nSODfiDGDmx8lqSgtiJndh56sfPlwxn3rAkxXbNljoMbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6tV3x/Jwrte+KN4L7t4nDZ6IcdJohmm/DVMjRegdt0=;
 b=BJSGF0lIB6HNHp8Vj5Y+LiD3K3TV90H+3lomC2SoxTs1c8jZKUXmqIFZfXubs8TE7PjSdzUKYv/bL6lHNN6l2mbSrHFWYcO1SG44v66DLFmEbh9o1iCv81ymfCQxXJ+g6c/DAXIXFBKEn+mxqLzxZdbw9gslbn/ie8lHg1k8u5ssVwHjpu8DGsizKB6tOBbH7C/joY3FqEoBcElyZKThqeTiM/BmyroUxjKTtS9h11KE87K6vX+zvQlA2hfqaOpVwvWm7hWPmQjewJfzzoqy7QBaN6waAvRE8sOsBteY6MCLzARHfKT3Tio76XxnB62ikC34ylltSjiQP2O3p2aO9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB7269.namprd11.prod.outlook.com (2603:10b6:208:42b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 18:33:04 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8964.026; Mon, 28 Jul 2025
 18:33:04 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2 1/2] drm/xe: Probe for tile count during device info
 initialization
Thread-Topic: [PATCH v2 1/2] drm/xe: Probe for tile count during device info
 initialization
Thread-Index: AQHb/+2cGx07YGNyhkiSeSj6Kr3GabRH245A
Date: Mon, 28 Jul 2025 18:33:04 +0000
Message-ID: <CH0PR11MB5444138F03288882024320FBE55AA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250728-gt_count-improvements-v2-0-78841ce8a81c@intel.com>
 <20250728-gt_count-improvements-v2-1-78841ce8a81c@intel.com>
In-Reply-To: <20250728-gt_count-improvements-v2-1-78841ce8a81c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB7269:EE_
x-ms-office365-filtering-correlation-id: d5474adc-3ea4-486d-31c5-08ddce0530dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cTlVM0FwWkl1ekZMUTgwa1pPeFd2R1JFQk5CSlF2MzloODcyZTBEamZVMy9Y?=
 =?utf-8?B?ZzA1TithaUZHalY4ZUU2Q2hzUTFoTTV1QzJJeHdSZHVWV0xoQXdXa0ZmTHJX?=
 =?utf-8?B?Z2tPM3hsM09nNU9GSWtMSDVUY01IN0VZOEd1R1JvL0dBbW5yeG8rVFhrcXY2?=
 =?utf-8?B?QXlPRy9EV1VaMnBHWFhMRFFzUDdDNi9RRDlPeXp0R2x0SE5Gb29vbmVscmd0?=
 =?utf-8?B?dXIzeHZ0R1RwWTlqNTlDT1c4N0tFZHlKRFY3KzZtdzJIVXluRncyTHdSbC96?=
 =?utf-8?B?UFhqOUtsbkNIR1JjUU5JQnNXV2lZM1lFVUI1MFlvNXc3eXpxcHNvVk1EdTZW?=
 =?utf-8?B?UTVYVTF3cm5ReFZGOHJFZW51eHdwNVZjdlprYXdFNjJ0ajdCM0Z3K29rNGlk?=
 =?utf-8?B?LytPVlE3Um5zNkpmcll4VW1Ca3hsdE80WVBlWG94T2ZocU5pdTVjMlZUMFFU?=
 =?utf-8?B?eDdoVnhwb1VyRHkvTyttVGVnb3hnNURvcGFpMVVUMmJLRmRsc0VnVWJvV1hW?=
 =?utf-8?B?aFBwN1BFb0RjUmN1QTVPd1gxbGh4TlVNakdlMDN5cUlCQ25sU3hnaDFXb1Jn?=
 =?utf-8?B?S202Tko5UHQ5V2xmVEl2dXFIUlJkUUkyN3djZkJKNVlGOG9sSHhzeHRTYlht?=
 =?utf-8?B?V0NrdDFLUkNsZEdZYVlpSlYvcWtqbmRMdXQrRHFGWGw4NkJ0bjl5VVpzcmF3?=
 =?utf-8?B?bUs1ZUF4V3VuS2FubE16NUdBLzlZd0xvQjErQ2xPU1ZCSG9hbEZwcW5kR2dt?=
 =?utf-8?B?NXM2NXM2SldubkJEZTV1LzFwRTlXcHloWVJobnBobjBZNjJvQkRwVEJqRXFG?=
 =?utf-8?B?M3lLelBFeVBkWWtLb3Z0M2NmSmpSWm56RWVTZnJqVW9udGwzYzB6S212dElX?=
 =?utf-8?B?cHZMVXl4U1FBYjQ4cVg3WkRXUVNkNURwK0V5NXFaSVlDSDdPTlgvdDYvT01N?=
 =?utf-8?B?Wk1zSjR1dThhK2FlMGE0b1lweVVINVhTUTBMNG1EL00rR0FLdFdwL1NCTWN4?=
 =?utf-8?B?TlU2V1ExRzJOem5HVjJTYUhpVGNTK3FRVFE5cmRSbUdHZnBIZG90bkw0NE13?=
 =?utf-8?B?VjZ2MEJqWkNUeWhkU1JmK0ZRYm1mTjRuTEYwdENGVWZoaytVZklMVXBDTUhY?=
 =?utf-8?B?cDZMT216T0hYbmU5RDhUNE8wNlZIRkdKcDMrMkpuZ3NSQWkzM0YyZzFGODhU?=
 =?utf-8?B?VEJwUkpDTG1TZXFESWg1Z3p6L2Vhc2ZhNVRQRDlQWnRwaHlBZGdTL0p4SlJB?=
 =?utf-8?B?T1V4SWk4SEdGMk51ZDArQU85YVFONlJFdHpWZmlLMUJFOHp4SEdURW1Ba1Zw?=
 =?utf-8?B?MFNMS2J2SXV2dDcvSDhENGNBNGk4ZWJycmlwbVdmVUdRWG5FZlJmLys5SHFD?=
 =?utf-8?B?UnhDdjU4N0lZcVFiZExDSWlQUG9jN05UbWJrUC9mYWl3QXJqZm1GUmVxSVdm?=
 =?utf-8?B?dlpGRzM3VEJIUTlGdVB3czczRjdQWWZJZlhFeEEza0lKRHQyOVlnRjcvTXBI?=
 =?utf-8?B?bm84ZHIzSjE2YmhBcFI1eDZKRjJrTFV1NkJTTmlKOXIyUnJFcXNQQ2d2cFBN?=
 =?utf-8?B?cGl5Tm5MRk4rckVPVW9UTURXRk9GQjZTemN2UURRNkZIVllMNUtwcG40K1Jv?=
 =?utf-8?B?azl6QU9LcUFRdE1qSGhVb3pTN1pVZ25IaUhZeVlGTlowYmZzdnh6Wk04UENv?=
 =?utf-8?B?NGR4dnVtcWNmSi9VcC96Z0tPai9XbWRUUXdDSklkdWtUQjVXZEpvU1FobnZX?=
 =?utf-8?B?cUZiaHF0aUZOb21SWk84Uk1lNXFmUVFBdzdzYk12SjFZN2JFd3dVMnFrQ1Y5?=
 =?utf-8?B?NlJkZ3JXalZidU5XV3pGQisvNzNSckc1NjFraXFWUmNOTTlIUTVvRkVsQnk3?=
 =?utf-8?B?ZlZtZ2N5dGdML25wN0dSbFJqWXhaNUlKdmllQTJNdnpIaDFHSnFoVDZaKy91?=
 =?utf-8?B?eEZQMitjeXNnWHQvbTlzbkZPZVhvMGtTWDFNcFR0U2tMWWR6OXV6QTFFZS9M?=
 =?utf-8?B?OEhkdWxxcmRnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1hSWldBVDBEbnpXdkRTTXh1LzlPa0VDZlBOYndrUjRkSTIrUmFuWnFKZTBV?=
 =?utf-8?B?N3VwMkxiWGZsWTZNczRHWk5HbUR5ZjNFN2w1emc3ZHBHMHpXdWtJcEhtaVNt?=
 =?utf-8?B?d0xmZDczd2JnYUJ1elNaSG5UdVhMeUZsYVFGcmtva1l4YTNnTGxQdEwrd1g2?=
 =?utf-8?B?WTA5QlY5d2RpZysvUUtUaUxxMld4QTFESy90aFppWkkvNWVHTjYwYjBUaEpT?=
 =?utf-8?B?dmUramdBM1ZkQ3dFUWRtdjl6UkdLUlNOZVkxZUFtQnRqeExzVjN2UDlLY0hD?=
 =?utf-8?B?YU0yM2FWQ0NYdW10ZlpHTEEyYW9mQmk0aUFQTHRKTDZadGw0c1lDQnFMTzRP?=
 =?utf-8?B?WkNNRndWcWJNV1RqMVllcFZVTkl6Y3c5SW9tR3NTcXhwRklKMWE2UGF5OWd2?=
 =?utf-8?B?bmg3T21aYmx0L1ZtU3JEdmtHbmQ4emdJU3VaY0JLZ2VlVFROaTdKa2hNUFI1?=
 =?utf-8?B?bSt1UzlHVVJSWVNyT3VLVUVRMlIweEsvS1F3cUJieDl4emtieUdSY0NjeFo4?=
 =?utf-8?B?NnlqM0ttUzB3YjRRbFFubVErUm1JM0ZudnMwYzJJOXVWaS9rU2pKS1ZQb0VB?=
 =?utf-8?B?NG52OFZRakxlcTNYWkFXdkJOWVVLOFpVNjlVc3RMVjRKMFJCbGFHQ29WckxS?=
 =?utf-8?B?cjVzNi92NGtjUWVaKzVabWlQMWp3ZHB1bzBxcFBzOXZiYUFCYU1Ua1AwSytU?=
 =?utf-8?B?QlVZcUlSdEw3TmpzeSswTTc2dEFtcEhOYmxlQmJYKzlxc1RpMG91T2lMZ1RI?=
 =?utf-8?B?OHh2ek1XMFlqWXN4dUZWc3VPRVk3MzFWREk2bVFZaVZGaUJyS3VRN01KU3N1?=
 =?utf-8?B?VEUvbzlEb2taTTVJMlNKNnloOTNQTUVJdjlJMCtLSDdScDBDUitoWkg5aFFO?=
 =?utf-8?B?dndEK0dXeFRBZUpvN2xZSnA1cml1ekdKeTJzVk1MeEtYcTdHYm1xZ0lPRmxR?=
 =?utf-8?B?SHIwemJNenAvZHFlZWNkd0QzcEJobXM4NG9GMkR6NzcxR1lXb2J6bU9RRGkz?=
 =?utf-8?B?QkxFVzRYVFhUSGhRb01tK3IwQi8zb3g5eGNwNkdFVzRUUkR1MVlWdWJONUl0?=
 =?utf-8?B?cThpNEtScHMrMkIyWWlNOTlqWG1XbXplVWZtU0twWGR0YURWb1kzUGN4bUJv?=
 =?utf-8?B?bDJsam41YlUrWGlMLzNLTkE5MHA1NjJTRVNGRmtuQnY5VVNvdDkzenJHY2Y5?=
 =?utf-8?B?a052SUlSb0NhL1paeW0vd0JQY3ZaRkNqenB6T1BUdjBML1dseCszUjNFZzV2?=
 =?utf-8?B?TzNqckRkYUxqQ3F5eDNldXMvaVhHc25JaXM2TlhPN01idEd2MDdtQkdnQnBH?=
 =?utf-8?B?Q1p1NkpJZm4renJKQTJWL3dnSDZScGRvNjErdVp0QkxrOUlMM2NwK0tkN1Ni?=
 =?utf-8?B?a3Y4Ky9ralUraFFyN051REdXRjI2WkdxQjJMTjVURi9nMFFnMzduemZtK1ZO?=
 =?utf-8?B?cU5paWoyNExPd0FZMldCaG5rVWUyRmhjQWpycTZROFBHY0VmdUFpTzNYTTl4?=
 =?utf-8?B?QWNwQkJ0YkNWSHZGaWlneXB4N010N0N3bUtJUE96aG13ZUFaWGNCNitscGdp?=
 =?utf-8?B?MWZrN0l4bVpuVWlYVDZxVnBtcTBOVjVhTm9FTXpZQ09kUmFMVTRFL3NLQjkw?=
 =?utf-8?B?alFlYmVrWUt4aDkyak5teFhPMlZtRUtMRU9BaFZPNVhGa2FXelpOb2ZaczVO?=
 =?utf-8?B?V3NhbXR4TU0vOE9oSXdnMitMbElDc0RSMUxyT29Uek53ZGpqSzRoUTlDOWV3?=
 =?utf-8?B?L0dySlpuSUY2TlY2ZElTWlRYejMya25DaEswV1VuQ2FCWUhNQjBOa2xkUVZn?=
 =?utf-8?B?UkVvdllLS0ZTdEpSRjBDOVo5SDNkenBmV0lka3RqK2JFUStOVm9XL05ZNHpl?=
 =?utf-8?B?dWlVejVkU1k3MFdvNHdiOFFRWVlSUmdHWkN1Wkw5YVBQMzhMZ3lTR2ZuSDN5?=
 =?utf-8?B?bXFjUVNySnZMK002QlgzbW4wSkttZXlOaG9abWZqRGVWRytrYWMzU3Zya0Np?=
 =?utf-8?B?SEVpWUd3RmNMTGgzaFY3RlJJSVRCVkN2b1NvRDhDZkQ4T21paTFSckxGa01T?=
 =?utf-8?B?N3pjdTJuU01xaU1oVmF0d3E2Sk1XSFBSMzlzQmY2WWNQVmdSOXJrQm8rdTN5?=
 =?utf-8?Q?6FkitQ6zihR6L/UarLjIGn1nh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5474adc-3ea4-486d-31c5-08ddce0530dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2025 18:33:04.6163 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Ta0mw8hdmgC84HEAI/m1Rd42UkYZT9Z+nLCC83VBQFvehz3bkct/LVD9bFCygl8GI0tdw6xRV2NOa7y1mBtGoN8QSZweN3QZoK9y1auLl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7269
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFNvdXNhLCBHdXN0YXZvIDxndXN0YXZv
LnNvdXNhQGludGVsLmNvbT4gDQpTZW50OiBNb25kYXksIEp1bHkgMjgsIDIwMjUgMTE6MjkgQU0N
ClRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBDYXZpdHQsIEpvbmF0aGFu
IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPjsgU291c2EsIEd1c3Rhdm8gPGd1c3Rhdm8uc291
c2FAaW50ZWwuY29tPg0KU3ViamVjdDogW1BBVENIIHYyIDEvMl0gZHJtL3hlOiBQcm9iZSBmb3Ig
dGlsZSBjb3VudCBkdXJpbmcgZGV2aWNlIGluZm8gaW5pdGlhbGl6YXRpb24NCj4gDQo+IFRoZSBm
dW5jdGlvbiBtbWlvX211bHRpX3RpbGVfc2V0dXAoKSBkb2VzIG5vdCBsb29rIGxpa2UgdGhlIHBy
b3Blcg0KPiBsb2NhdGlvbiBmb3IgcHJvYmluZyBmb3IgdGhlIG51bWJlciBvZiBleGlzdGluZyB0
aWxlcyBpbiB0aGUgaGFyZHdhcmUuDQo+IEl0IHNob3VsZCBub3QgYmUgdGhhdCBmdW5jdGlvbidz
IHJlc3BvbnNpYmlsaXR5IGFuZCBzdWNoIGluZm9ybWF0aW9uDQo+IHNob3VsZCBpbnN0ZWFkIGJl
IGFscmVhZHkgYXZhaWxhYmxlIHdoZW4gaXQgZ2V0cyBjYWxsZWQuDQo+IA0KPiBUaGUgZmFjdCB0
aGF0IHdlIG5lZWQgdG8gYWRqdXN0IGd0X2NvdW50IGlzIGEgc3ltcHRvbSBvZiB0aGF0Lg0KPiAN
Cj4gTW92ZSBwcm9iaW5nIG9mIGF2YWlsYWJsZSB0aWxlIGNvdW50IHRvIGEgZGVkaWNhdGVkIGZ1
bmN0aW9uIG5hbWVkDQo+IHhlX2luZm9fcHJvYmVfdGlsZV9jb3VudCgpIGFuZCBjYWxsIGl0IGZy
b20geGVfaW5mb19pbml0KCksIHdoaWNoIHNlZW1zDQo+IGxpa2UgYSBtb3JlIGFwcHJvcHJpYXRl
IHBsYWNlIGZvciB0aGF0Lg0KPiANCj4gV2l0aCB0aGF0IG1vdmUsIHdlIG5vIGxvbmdlciBuZWVk
IHRvIChhbmQgc2hvdWxkbid0KSBhZGp1c3QgZ3RfY291bnQgYXMNCj4gYSBwYXJ0IG9mIHhlX2lu
Zm9fcHJvYmVfdGlsZV9jb3VudCgpLCBhcyB0aGF0IGZpZWxkIHdpbGwgYmUgaW5pdGlhbGl6ZWQN
Cj4gbGF0ZXIgaW4geGVfaW5mb19pbml0KCkuDQo+IA0KPiB2MjoNCj4gICAtIFVzZSBLVW5pdCBz
dGF0aWMgc3R1YiBzbyB0aGF0IHdlIGRvIG5vdCB0cnkgdG8gcXVlcnkgaGFyZHdhcmUgd2hlbg0K
PiAgICAgcnVubmluZyBLVW5pdCB0ZXN0cy4gKENJKQ0KPiAgIC0gVHdlYWsgbGFzdCBwYXJhZ3Jh
cGggb2YgY29tbWl0IG1lc3NhZ2UgdG8gbWFrZSBpdCBjbGVhcmVyLg0KPiAgICAgKEpvbmF0aGFu
KQ0KPiANCj4gUmV2aWV3ZWQtYnk6IEpvbmF0aGFuIENhdml0dCA8am9uYXRoYW4uY2F2aXR0QGlu
dGVsLmNvbT4gICN2MQ0KPiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIFNvdXNhIDxndXN0YXZvLnNv
dXNhQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUvdGVzdHMveGVfcGNp
LmMgfCAgNyArKysrKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pby5jICAgICAgfCAz
MyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9wY2kuYyAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4gIDMgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgMzMgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3Rlc3RzL3hlX3BjaS5jIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3Rlc3RzL3hlX3BjaS5jDQo+IGluZGV4IDljNzE1ZTU5ZjAzMC4uZGIz
MGM1MTU2ZDBjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvdGVzdHMveGVfcGNp
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3Rlc3RzL3hlX3BjaS5jDQo+IEBAIC0xMDEs
NiArMTAxLDExIEBAIHN0YXRpYyB2b2lkIGZha2VfcmVhZF9nbWRpZChzdHJ1Y3QgeGVfZGV2aWNl
ICp4ZSwgZW51bSB4ZV9nbWRpZF90eXBlIHR5cGUsDQo+ICAJfQ0KPiAgfQ0KPiAgDQo+ICtzdGF0
aWMgdm9pZCBmYWtlX3hlX2luZm9fcHJvYmVfdGlsZV9jb3VudChzdHJ1Y3QgeGVfZGV2aWNlICp4
ZSkNCj4gK3sNCj4gKwkvKiBOb3RoaW5nIHRvIGRvLCBqdXN0IHVzZSB0aGUgc3RhdGljYWxseSBk
ZWZpbmVkIHZhbHVlLiAqLw0KPiArfQ0KPiArDQo+ICBpbnQgeGVfcGNpX2Zha2VfZGV2aWNlX2lu
aXQoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ICB7DQo+ICAJc3RydWN0IGt1bml0ICp0ZXN0ID0g
a3VuaXRfZ2V0X2N1cnJlbnRfdGVzdCgpOw0KPiBAQCAtMTM4LDYgKzE0Myw4IEBAIGludCB4ZV9w
Y2lfZmFrZV9kZXZpY2VfaW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gIAkJCSAgIGRhdGEt
PnNyaW92X21vZGUgOiBYRV9TUklPVl9NT0RFX05PTkU7DQo+ICANCj4gIAlrdW5pdF9hY3RpdmF0
ZV9zdGF0aWNfc3R1Yih0ZXN0LCByZWFkX2dtZGlkLCBmYWtlX3JlYWRfZ21kaWQpOw0KPiArCWt1
bml0X2FjdGl2YXRlX3N0YXRpY19zdHViKHRlc3QsIHhlX2luZm9fcHJvYmVfdGlsZV9jb3VudCwN
Cj4gKwkJCQkgICBmYWtlX3hlX2luZm9fcHJvYmVfdGlsZV9jb3VudCk7DQo+ICANCj4gIAl4ZV9p
bmZvX2luaXRfZWFybHkoeGUsIGRlc2MsIHN1YnBsYXRmb3JtX2Rlc2MpOw0KPiAgCXhlX2luZm9f
aW5pdCh4ZSwgZGVzYyk7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW1p
by5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21taW8uYw0KPiBpbmRleCBlNGRiOGQ1OGVhMmQu
LmVmNmYzZWE1NzNhMiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21taW8u
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pby5jDQo+IEBAIC01OCw3ICs1OCw2
IEBAIHN0YXRpYyB2b2lkIHRpbGVzX2Zpbmkodm9pZCAqYXJnKQ0KPiAgc3RhdGljIHZvaWQgbW1p
b19tdWx0aV90aWxlX3NldHVwKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBzaXplX3QgdGlsZV9tbWlv
X3NpemUpDQo+ICB7DQo+ICAJc3RydWN0IHhlX3RpbGUgKnRpbGU7DQo+IC0Jc3RydWN0IHhlX2d0
ICpndDsNCj4gIAl1OCBpZDsNCj4gIA0KPiAgCS8qDQo+IEBAIC02OCwzOCArNjcsNiBAQCBzdGF0
aWMgdm9pZCBtbWlvX211bHRpX3RpbGVfc2V0dXAoc3RydWN0IHhlX2RldmljZSAqeGUsIHNpemVf
dCB0aWxlX21taW9fc2l6ZSkNCj4gIAlpZiAoeGUtPmluZm8udGlsZV9jb3VudCA9PSAxKQ0KPiAg
CQlyZXR1cm47DQo+ICANCj4gLQkvKiBQb3NzaWJseSBvdmVycmlkZSBudW1iZXIgb2YgdGlsZSBi
YXNlZCBvbiBjb25maWd1cmF0aW9uIHJlZ2lzdGVyICovDQo+IC0JaWYgKCF4ZS0+aW5mby5za2lw
X210Y2ZnKSB7DQo+IC0JCXN0cnVjdCB4ZV9tbWlvICptbWlvID0geGVfcm9vdF90aWxlX21taW8o
eGUpOw0KPiAtCQl1OCB0aWxlX2NvdW50LCBndF9jb3VudDsNCj4gLQkJdTMyIG10Y2ZnOw0KPiAt
DQo+IC0JCS8qDQo+IC0JCSAqIEFsdGhvdWdoIHRoZSBwZXItdGlsZSBtbWlvIHJlZ3MgYXJlIG5v
dCB5ZXQgaW5pdGlhbGl6ZWQsIHRoaXMNCj4gLQkJICogaXMgZmluZSBhcyBpdCdzIGdvaW5nIHRv
IHRoZSByb290IHRpbGUncyBtbWlvLCB0aGF0J3MNCj4gLQkJICogZ3VhcmFudGVlZCB0byBiZSBp
bml0aWFsaXplZCBlYXJsaWVyIGluIHhlX21taW9fcHJvYmVfZWFybHkoKQ0KPiAtCQkgKi8NCj4g
LQkJbXRjZmcgPSB4ZV9tbWlvX3JlYWQzMihtbWlvLCBYRUhQX01UQ0ZHX0FERFIpOw0KPiAtCQl0
aWxlX2NvdW50ID0gUkVHX0ZJRUxEX0dFVChUSUxFX0NPVU5ULCBtdGNmZykgKyAxOw0KPiAtDQo+
IC0JCWlmICh0aWxlX2NvdW50IDwgeGUtPmluZm8udGlsZV9jb3VudCkgew0KPiAtCQkJZHJtX2lu
Zm8oJnhlLT5kcm0sICJ0aWxlX2NvdW50OiAlZCwgcmVkdWNlZF90aWxlX2NvdW50ICVkXG4iLA0K
PiAtCQkJCSB4ZS0+aW5mby50aWxlX2NvdW50LCB0aWxlX2NvdW50KTsNCj4gLQkJCXhlLT5pbmZv
LnRpbGVfY291bnQgPSB0aWxlX2NvdW50Ow0KPiAtDQo+IC0JCQkvKg0KPiAtCQkJICogV2UndmUg
YWxyZWFkeSBzZXR1cCBndF9jb3VudCBhY2NvcmRpbmcgdG8gdGhlIGZ1bGwNCj4gLQkJCSAqIHRp
bGUgY291bnQuICBSZS1jYWxjdWxhdGUgaXQgdG8gb25seSBpbmNsdWRlIHRoZSBHVHMNCj4gLQkJ
CSAqIHRoYXQgYmVsb25nIHRvIHRoZSByZW1haW5pbmcgdGlsZShzKS4NCj4gLQkJCSAqLw0KPiAt
CQkJZ3RfY291bnQgPSAwOw0KPiAtCQkJZm9yX2VhY2hfZ3QoZ3QsIHhlLCBpZCkNCj4gLQkJCQlp
ZiAoZ3QtPmluZm8uaWQgPCB0aWxlX2NvdW50ICogeGUtPmluZm8ubWF4X2d0X3Blcl90aWxlKQ0K
PiAtCQkJCQlndF9jb3VudCsrOw0KPiAtCQkJeGUtPmluZm8uZ3RfY291bnQgPSBndF9jb3VudDsN
Cj4gLQkJfQ0KPiAtCX0NCj4gLQ0KPiAgCWZvcl9lYWNoX3JlbW90ZV90aWxlKHRpbGUsIHhlLCBp
ZCkNCj4gIAkJeGVfbW1pb19pbml0KCZ0aWxlLT5tbWlvLCB0aWxlLCB4ZS0+bW1pby5yZWdzICsg
aWQgKiB0aWxlX21taW9fc2l6ZSwgU1pfNE0pOw0KPiAgfQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3BjaS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jDQo+IGlu
ZGV4IDUyZDQ2YzY2YWUxZS4uMGQ3MDczYTA0YmIyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfcGNpLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jDQo+
IEBAIC0xNyw2ICsxNyw3IEBADQo+ICANCj4gICNpbmNsdWRlICJkaXNwbGF5L3hlX2Rpc3BsYXku
aCINCj4gICNpbmNsdWRlICJyZWdzL3hlX2d0X3JlZ3MuaCINCj4gKyNpbmNsdWRlICJyZWdzL3hl
X3JlZ3MuaCINCj4gICNpbmNsdWRlICJ4ZV9kZXZpY2UuaCINCj4gICNpbmNsdWRlICJ4ZV9kcnYu
aCINCj4gICNpbmNsdWRlICJ4ZV9ndC5oIg0KPiBAQCAtNjA0LDYgKzYwNSwzNyBAQCBzdGF0aWMg
aW50IHhlX2luZm9faW5pdF9lYXJseShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4gIAlyZXR1cm4g
MDsNCj4gIH0NCj4gIA0KPiArLyoNCj4gKyAqIFBvc3NpYmx5IG92ZXJyaWRlIG51bWJlciBvZiB0
aWxlIGJhc2VkIG9uIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXIuDQo+ICsgKi8NCj4gK3N0YXRpYyB2
b2lkIHhlX2luZm9fcHJvYmVfdGlsZV9jb3VudChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gK3sN
Cj4gKwlzdHJ1Y3QgeGVfbW1pbyAqbW1pbzsNCj4gKwl1OCB0aWxlX2NvdW50Ow0KPiArCXUzMiBt
dGNmZzsNCj4gKw0KPiArCUtVTklUX1NUQVRJQ19TVFVCX1JFRElSRUNUKHhlX2luZm9fcHJvYmVf
dGlsZV9jb3VudCwgeGUpOw0KDQpJIGRvbid0IGtub3cgbXVjaCBhYm91dCB0aGVzZSBzdGF0aWMg
c3R1YnMsIGJ1dCBpZiB0aGV5J3JlIG5lY2Vzc2FyeQ0KdG8gbWFrZSBDSSBoYXBweSBhbmQgZG9u
J3QgaGF2ZSBhbnkgZnVuY3Rpb25hbCBpbXBhY3Qgb3RoZXJ3aXNlLA0KdGhlbiBJIHdvbid0IGJs
b2NrIG9uIGl0Lg0KRXZlcnl0aGluZyBlbHNlIGlzIHRoZSBzYW1lIGZyb20gVjEgKGNvZGUtd2lz
ZSksIHNvIG15IFJldmlld2VkLWJ5DQpzdGlsbCBzdGFuZHMuDQotSm9uYXRoYW4gQ2F2aXR0DQoN
Cj4gKw0KPiArCWlmICh4ZS0+aW5mby5za2lwX210Y2ZnKQ0KPiArCQlyZXR1cm47DQo+ICsNCj4g
KwltbWlvID0geGVfcm9vdF90aWxlX21taW8oeGUpOw0KPiArDQo+ICsJLyoNCj4gKwkgKiBBbHRo
b3VnaCB0aGUgcGVyLXRpbGUgbW1pbyByZWdzIGFyZSBub3QgeWV0IGluaXRpYWxpemVkLCB0aGlz
DQo+ICsJICogaXMgZmluZSBhcyBpdCdzIGdvaW5nIHRvIHRoZSByb290IHRpbGUncyBtbWlvLCB0
aGF0J3MNCj4gKwkgKiBndWFyYW50ZWVkIHRvIGJlIGluaXRpYWxpemVkIGVhcmxpZXIgaW4geGVf
bW1pb19wcm9iZV9lYXJseSgpDQo+ICsJICovDQo+ICsJbXRjZmcgPSB4ZV9tbWlvX3JlYWQzMiht
bWlvLCBYRUhQX01UQ0ZHX0FERFIpOw0KPiArCXRpbGVfY291bnQgPSBSRUdfRklFTERfR0VUKFRJ
TEVfQ09VTlQsIG10Y2ZnKSArIDE7DQo+ICsNCj4gKwlpZiAodGlsZV9jb3VudCA8IHhlLT5pbmZv
LnRpbGVfY291bnQpIHsNCj4gKwkJZHJtX2luZm8oJnhlLT5kcm0sICJ0aWxlX2NvdW50OiAlZCwg
cmVkdWNlZF90aWxlX2NvdW50ICVkXG4iLA0KPiArCQkJIHhlLT5pbmZvLnRpbGVfY291bnQsIHRp
bGVfY291bnQpOw0KPiArCQl4ZS0+aW5mby50aWxlX2NvdW50ID0gdGlsZV9jb3VudDsNCj4gKwl9
DQo+ICt9DQo+ICsNCj4gIC8qDQo+ICAgKiBJbml0aWFsaXplIGRldmljZSBpbmZvIGNvbnRlbnQg
dGhhdCBkb2VzIHJlcXVpcmUga25vd2xlZGdlIGFib3V0DQo+ICAgKiBncmFwaGljcyAvIG1lZGlh
IElQIHZlcnNpb24uDQo+IEBAIC02NzgsNiArNzEwLDggQEAgc3RhdGljIGludCB4ZV9pbmZvX2lu
aXQoc3RydWN0IHhlX2RldmljZSAqeGUsDQo+ICAJeGUtPmluZm8uaGFzX3VzbSA9IGdyYXBoaWNz
X2Rlc2MtPmhhc191c207DQo+ICAJeGUtPmluZm8uaGFzXzY0Yml0X3RpbWVzdGFtcCA9IGdyYXBo
aWNzX2Rlc2MtPmhhc182NGJpdF90aW1lc3RhbXA7DQo+ICANCj4gKwl4ZV9pbmZvX3Byb2JlX3Rp
bGVfY291bnQoeGUpOw0KPiArDQo+ICAJZm9yX2VhY2hfcmVtb3RlX3RpbGUodGlsZSwgeGUsIGlk
KSB7DQo+ICAJCWludCBlcnI7DQo+ICANCj4gDQo+IC0tIA0KPiAyLjUwLjENCj4gDQo+IA0K
