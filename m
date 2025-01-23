Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9700FC02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 18:57:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6020810E0CF;
	Thu, 23 Jan 2025 18:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0NhYxmZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E160A10E0CF
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 18:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737658655; x=1769194655;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=PwSdxBS9hykYv5nDHxsOlhEJZECGqPZXFzJ1edGynh0=;
 b=B0NhYxmZsGP2hBBNSBVa7M8hjDBrMPoVMe+VcRovIptjaZRXaIPxgvST
 +Hlx2UD7rcbtaNmqQO2SM2nML8eiQWsbUhz95q4jEy2sdQ8q71gJFBspk
 c4W9CND9J8fA+Gf7D4usHFA6XcouSPjG1hvt3BCZ70DXCkaQWRt+2eeB+
 2nHnyyqf4XSPntS2xx8ISebcBmNePungm/aB0nmaTisfquyu2KCviI/pj
 P3EgF98DcHegXFy7K5qFGnmNKf594R/mMR0BCbR5e7VToXBHFnkBePgt3
 aX/Xh1FL9xwUKZxnBtGk2cB+oUmQtBVwi4jSM/vj3wuuK9RGdna+3fshy g==;
X-CSE-ConnectionGUID: AT+k+gGuRVq9bFNUbjOnBw==
X-CSE-MsgGUID: 18eBwHtTTHOH8au5jEEJ0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38057905"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="38057905"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 10:57:30 -0800
X-CSE-ConnectionGUID: r7MxC17aT1SGEm6al6p+VQ==
X-CSE-MsgGUID: U0OSIjFnRWKWpEyYy3PpLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="138402392"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 10:57:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 10:57:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 10:57:29 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 10:57:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9qYjY2gVn9OgoNziCtkHVxMbSFLZiJp9i1TSdgi+DUJYhsML6hZyG3/wEAnlT/eV2PZrOCo5qbO69OPfi5U6Kzpwdg3neXL3rki5tWxDlWB3qND22cV0Noh63f0bC8FBw5RCjeiGRosUjfy9dtNak0dS2/tmw7bLSR0PLBgmdX7p5fJRmDjnnbTy2SDjMLY9EN/zftX2cfQclFyGENtQrm2WANMe46ewENHFPFbDPMQ3+jSNjyfv7cekLf+jmZILwhT0cJP+x+7zj/S4PHgGsTUvxTgJqiWAsfVCpB5WaXOr0JTZTJCocum1YHQjNoIzowUuKkjUzpQfcNZ5DBstw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwSdxBS9hykYv5nDHxsOlhEJZECGqPZXFzJ1edGynh0=;
 b=v7M/CmiS+P5T90FvdF2ckE6PpO2rs+274KreBbEAk8pJ2hKX7ZYQdvRS9sfv3TkRmjc/N0uI6MKD7SivMabMy090YhsoEJ2vkf0Y50cA7Kl6APrYHNZn2zbV/fo5sJPgYVYj7cu2tM5E/PpVbD0Hr0rIso3q/1cbnPTVhbloDOsWs5ZQVqj6kDLG9869oAWYN+aXeBvxVCQle0ZPMNyfujFLACHDx0+X7U02xGN2/QvdEcfvD8xYtx9lu0qx5UIfqemPV+K2B3DjWUZpzdWjdGxlGlDDaLA51xL9gRWVNRUo8deJOx4xVFkX9F9QEnoRZl+sPrJKal0vXYUi/QbSvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Thu, 23 Jan
 2025 18:56:59 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%5]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 18:56:58 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Drop duplicated information about GT tile in
 devcoredump
Thread-Topic: [PATCH 3/3] drm/xe: Drop duplicated information about GT tile in
 devcoredump
Thread-Index: AQHbbcEqwvTX30vHV0akKUUxs8P7+rMkqsiAgAABswCAAAGlgIAAB4GA
Date: Thu, 23 Jan 2025 18:56:58 +0000
Message-ID: <75d315bc086d8382c6cb89a65b1be0b65547e0a1.camel@intel.com>
References: <20250123180320.66198-1-jose.souza@intel.com>
 <20250123180320.66198-4-jose.souza@intel.com>
 <09e5ad52-be12-4d39-9b64-ca75b4851307@intel.com>
 <124780756da7b9546d16158659a562408a23497e.camel@intel.com>
 <a8ac03e2-43c1-488d-a821-902aba7caa25@intel.com>
In-Reply-To: <a8ac03e2-43c1-488d-a821-902aba7caa25@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH7PR11MB7717:EE_
x-ms-office365-filtering-correlation-id: da396820-780e-47d7-0724-08dd3bdfb696
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?K2JYWDBJa1ZFOC8wZWNrKzFKTWRyS0JqYlVWM3FJcERCNVl2M1hQbWFYVmlD?=
 =?utf-8?B?cEpkc1QvNUFGb0pyUXJVaCtjTkw5VjJtL3paNnBWWEZQM3FKMmxQUUU2U3Z2?=
 =?utf-8?B?T0diYVFBR081eWF4NW9LR3dIVWt5aURiR24zWnRybm0vSndKRjdyTkV4RWw1?=
 =?utf-8?B?MjRMby83Q2pVZ1oyNGdaVStrUG5qazVJcDhxUjV4N0I0TW5qNXBrZVBUYmxQ?=
 =?utf-8?B?U1ZBM01FMVFJS1Z5cDZEY05UZXorZGFmWWwzcjBCbUlqQ3o0ZXNqbnZKUHdX?=
 =?utf-8?B?TzBpRFM0UWdIeGcwYWNOQ2k3REdlcmtjNE1Pb21UTVhSdzJCZ1pLTzBqUFZl?=
 =?utf-8?B?VUl6amhWR0pzNlNlQlJFSUJHT0JGZXByQllGK0tjS200MUN0aFA1R1B3TGN1?=
 =?utf-8?B?NWFmRk9obTI5aHpENjVVTUJPNzdlZ0FVVmtHaXlJdC9DY1NwWk5aVUlMUDQy?=
 =?utf-8?B?S3NKMmk1TUloZUR0VzEyQ0o4OStVYXJkRkNIdlRBM0l6SDhPTDZGdlA2OVBH?=
 =?utf-8?B?M1U2ZVErWGR0bmsxNHB0TTVFRzdQbHhCWFdsSkEvOHJhaEx5WHQyMTJmcERy?=
 =?utf-8?B?MTF4VkI5NDM4NHloZ1VSS1VrTWhrUTJRYWoxOHhzV1hRMm5wK0NVNDdsaG5i?=
 =?utf-8?B?OTB5VW9nZkt2UHIvRFJDY2xqSEoyQm5PRFl2VnZ2c21qQmdSSThqUCtCQTU5?=
 =?utf-8?B?NUpPQ0QvdlR6ZGVacG0rVnV3Yng3TXdxLy9SY0ZDOUQ3TnQzUlMwOXRWS3hR?=
 =?utf-8?B?OU9uYU5zY0xqNy9YdExiQm8rdVd3RitpWkNjMkpMejQ4ZXllbDgyUjNNZ2J5?=
 =?utf-8?B?TWNVM3pRU1NRanJ6K2UxMnNZZ05FTTBjbnFDMFo3M0U5WERGUEpsUkowMk1C?=
 =?utf-8?B?d2p2TEw5YXQzWnovVUprZG9xMjY2VUFkbkJaS1NoQ1ppWnVWSzdrMlVuNjJt?=
 =?utf-8?B?ZzIxZUFPQ2VmSERyQm0vb2d0ZDNVT09UanJDaVZ6dTVQZ0J4d0ZSQ0xtVWEx?=
 =?utf-8?B?ZkdvTE1OMWhLRnhJU0lFT1MyazczZ0IzYkNic29xNjcxc1A0TXZRZEovNEdI?=
 =?utf-8?B?dzQramRqNDNwUS82RmgzV25EM09RTU1PQU11bjRnTkltYWExQ29DYUtjQ0oy?=
 =?utf-8?B?WEhta1B0NU1OTTVCcVMyZ1NaQUo3YzlHbUYzNTZHVWxIR0hORG8xQXVnQStE?=
 =?utf-8?B?OGVmWmVpS2RIMWc0M3ZPSFJ5VEM0VkZTNVE0K01TYytacTlTMStGelJmeWk1?=
 =?utf-8?B?M1ZEL2VpZUdCdnJ4SjlMSTRIY3NOeGlkOUl2MVN4bW92L2NhU21MaHZ4RGJ4?=
 =?utf-8?B?bEFuWDdmRTFOOUYzT2JZc1BSQS80Z0F6My83cUVXNnpoaUx3QzJxaW9vUTVC?=
 =?utf-8?B?OU91bWNUcytSNGRBY0ZVd21Ld21tQlRwMERDZ2h1S01hUHVQSXlteE9tZVAz?=
 =?utf-8?B?QUt0aFRpMzlucjdBZ1pmOEx1dUg2clBtU1BORTFrS3VzT0Y0Mis5Vm5rSFNF?=
 =?utf-8?B?WFNNYmxZRWpZWFhmTG9zTDdNeTNJc1FnYTRYclkrUkhDYk1pRUh6YjRGL0Na?=
 =?utf-8?B?ZVh6MFN3Nnl1N2JsK04ybGliOEZtOXZ3dHJrR1dUV1F0WkxocEE0QlAvYUFU?=
 =?utf-8?B?R0Q3OWJuc0hNSjBKYlJKbi9zQW5hdnJKaENodm00aDRUaG9pOHlBZ0dKU2Zr?=
 =?utf-8?B?Z1p1a2VsbFJnQXdVUS9DZ3FXM0hjWEtIWkU1aWphK2hWUXFLSXVSeS9YVFI0?=
 =?utf-8?B?YzhTOGkzZXlVS0ZVQlVHNXpWU2tjUTgvc2JsOCttbFBoYnliYkF3U05HVzdR?=
 =?utf-8?B?VnZabzIxTGpkMWxNVWZucmJsbjF2KzMxWHhpc1FjNkVtM1Q4eC9jWC9kRUpk?=
 =?utf-8?B?SEpEaU55alRCbEpZSGsvUGlZRDBDL2d3ZXFYY1Y2U0krTk1CNndKbDRRUTdP?=
 =?utf-8?Q?PVxJkfFa1VpO7UdCRjz+FCSbhiKgTyB+?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NitKQUpQZUJLY2RXWHNHUGR1dGtCcTQ2a3JDMWlVY1ltZkZZaXh6NkVnS2Z4?=
 =?utf-8?B?ZFVETjZLUHVTV2VxOWM2R1p2d1Z4MUxjTmNFUWlaaWN4VDNXK3ZTS2pma29P?=
 =?utf-8?B?OE8reDgxYjFSb2xPN24rd3o3Y3JRV1R1UmZkajZHQTdEcU1aaFRGM2w0aGdN?=
 =?utf-8?B?YnBPenlsV3hTZWdCWk5HS1QrWk9yTUxLRzVFbTZIMzd3QWdiamF5UlJCbE53?=
 =?utf-8?B?S3ArdHgraVVZUEowakZvMEdlMUN5T2w4dlRCanlEbHFDMlBFU2owaG8vcTg0?=
 =?utf-8?B?VGttaVNUOHYrWjFwSnEyNU1PV2Q3TUhiZHBCa2ZPYzEyRzlSc2V6K3F4RnA3?=
 =?utf-8?B?VzFlaFdFL05XYW1LeTR1MVpScFhhck9KUm9GQVliY0sxZnFoL00yZldWU0F5?=
 =?utf-8?B?ZUJ1WkxCYXhxNG5SdDl6RlpxZys3M3RCOUgvaTdBUllsTXZiZ0J6MTVxR2k1?=
 =?utf-8?B?L3RMMC9GZjYrZjhITGNqKzN6OTdYZE9YZkl4akZNMTlLam1JRUZyekxEUzdx?=
 =?utf-8?B?MWkvY2hReDVQajhzV2Ftd21Pbk1BRUlFdUV6eDhxWHlqZEFiWXdmMDF5OXdk?=
 =?utf-8?B?WTN5QkY4WVd2cDZpYkNXNk1hNjFOdlk2QkpKS1BBdFRCUGhQSDNaRFU1eitu?=
 =?utf-8?B?cmo3OFA3djVSWE5YdlJWUU8vQ21UMGVwcG9NMGlQcVRELy9ibGZwaXN1NVZX?=
 =?utf-8?B?bWt1UXZDdnFHdWRjdmxWUmc5OEdOVkVyeElTQTR0N1liYzNqOEVrYVNWRnha?=
 =?utf-8?B?Y2dWTzJ4bVpjeU1zVkdqelcyMWl3ZzhxdmZBdWdQcWg0Vjk0Uy80V2VEV2ph?=
 =?utf-8?B?dDBxeXpRNVFjVkFjZnJWdDMvaWNaQ3pCZXFvNDdMOXN1K1paeWYyV1Q3L1F0?=
 =?utf-8?B?cm42NEFXQ3RwNzlneTVUclJHUnpIMk4wWEllL3lYcmsrQ0x3OWYzd2VkVDlq?=
 =?utf-8?B?WEk3QThlUzV0ZUo3RHdnR1BVdXk3ZjdGa3FxaWdnb3A1eWVzSVhrT3FoemVU?=
 =?utf-8?B?Y2hOWURGMCtSMGFyKzAzKysvRVYra0lCUVBldjhGWGZpNHlhNkg0L0x5Zis5?=
 =?utf-8?B?by96blRGY1l2TFZVNmtMMlQvWGV3ck45TXZKOHkvRzB6M1RGT1p1RGZvN3pE?=
 =?utf-8?B?U1Y2cGJqc2cyaUNreFg2cUJ0cXUvVkVXYTc1NldFNG51VloxdHM1REE2WXJZ?=
 =?utf-8?B?Sy9HbVRNcTc0dkF6anAyQ1lsbXJZTklydXlZUytNY1RXSkdrWmM5RWpDNGlu?=
 =?utf-8?B?RE1DR3NiWGdIZG5ybWRMOGxYUHAvNHZMY2hzQnFxaDZFNFd5dGhvUGNzeTRw?=
 =?utf-8?B?RDVmRjBlcTZjMVJpbVFvZTV6dUtONVRmTi9NQWtuME96cXZwdkoxUjFUbW9E?=
 =?utf-8?B?T2QrOEdzUDgwZzUwUmZReXhxaTVrQTZYa0hUd0RvYyt1MTJrb2hleUNHRGQz?=
 =?utf-8?B?QkNpM1pDdGc4aUwxOFZCM3NOa2cxQmRiOHpIZHliMy8yQ2V0blJicnRqcVdq?=
 =?utf-8?B?MW1MVFFSb2hveDVHa1RGQWZDNEZ6V1M1blAvUEx0eVMrQXBPK3VOdzRUSmJZ?=
 =?utf-8?B?VzBsZ0UwZ3loNjVxQWJaS0UvZ2VBaHRoOGJNY1RmSWdic0FZRWtrTEJPQloz?=
 =?utf-8?B?QWZqVEpldDZ0czREamgxTUFxR0xQQi9waXN1MVZhL3o4bzAvb28wTzVOYlpE?=
 =?utf-8?B?dnoxa1V4cy8zcXVvQlRDU3lGQzRQNWFiWEtCaFNaeER3SHg4S01NUW90Q0FZ?=
 =?utf-8?B?WnJ2SnRMc1RFYjFZZzZPSkVnbkZEMURDMFJyTmZxaFRrVFFTZTAvRTRFbTZB?=
 =?utf-8?B?U2FRbngwM1ZvWWNrejRhMlZlWlMvN2QzcmhNVGxaMkZ6LzRDb2k0cHlVaE11?=
 =?utf-8?B?OHdVNFhuL3JKNmwrbVFhRWd4NzlidHg5dTdhc3hiYmhudFNvZEdYelk5bzlF?=
 =?utf-8?B?Q2RWSTNFSkZYSjErQW4rN3NsVjRaMWkyYmZHZTU4NkJkYU0vWHBRSW1HR3VX?=
 =?utf-8?B?UUIvMUQ5WEpnUlg3V0I5Qm5tV0xJZVpkelBLR3gzNTlUdGhCWFVSRmRhYzla?=
 =?utf-8?B?S2F2SFZuS1hrR3hjRDJFdjByVE9iNzVPWS9EcGtJNjFpTENweGFWdVlRbktS?=
 =?utf-8?B?eElyQUk4OGRiOTd3MENnRmVzejhqbVFqYVllMlZYY0J6K0ZYcTZiSmFoZnZl?=
 =?utf-8?B?Qnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E224FE60CD4CFC418A2B41EEEC7C6E90@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da396820-780e-47d7-0724-08dd3bdfb696
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 18:56:58.3010 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mzqAEMx0lkucO3CwqiCzkI23mLMIDU9YB9xLYNOook899zo+6qnt6e6KGaQ9b6ynKCKg55u/aO+o3sd5Ae+z6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7717
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

T24gVGh1LCAyMDI1LTAxLTIzIGF0IDEwOjMwIC0wODAwLCBKb2huIEhhcnJpc29uIHdyb3RlOg0K
PiBPbiAxLzIzLzIwMjUgMTA6MjQsIFNvdXphLCBKb3NlIHdyb3RlOg0KPiA+IE9uIFRodSwgMjAy
NS0wMS0yMyBhdCAxMDoxOCAtMDgwMCwgSm9obiBIYXJyaXNvbiB3cm90ZToNCj4gPiA+IE9uIDEv
MjMvMjAyNSAwOTo1OSwgSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSB3cm90ZToNCj4gPiA+ID4gVGhl
IEdUIHRpbGUgaXMgYWxyZWFkeSBhdmFpbGFibGUgYnV0IHdhcyBhZGRlZCBhZ2FpbiBpbiBjb21t
aXQNCj4gPiA+ID4gYzI4ZmQ2YzM1OGRiICgiZHJtL3hlL2RldmNvcmVkdW1wOiBJbXByb3ZlIHNl
Y3Rpb24gaGVhZGluZ3MgYW5kIGFkZCB0aWxlIGluZm8iKSwNCj4gPiA+ID4gc28gaGVyZSBkZWxl
dGluZyBpdC4NCj4gPiA+ID4gDQo+ID4gPiA+IEhlcmUgYSBkZXZjb3JlZHVtcCBleGFtcGxlIHdp
dGggdGhlIGR1cGxpY2F0ZWQgaW5mb3JtYXRpb246DQo+ID4gPiA+IA0KPiA+ID4gPiAqKioqIFhl
IERldmljZSBDb3JlZHVtcCAqKioqDQo+ID4gPiA+IFJlYXNvbjogVGltZWRvdXQgam9iIC0gc2Vx
bm89NDI5NDk2NzE3MCwgbHJjX3NlcW5vPTQyOTQ5NjcxNzAsIGd1Y19pZD0xMywgZmxhZ3M9MHgw
DQo+ID4gPiA+IGtlcm5lbDogNi4xMy4wLXplaC14ZSsNCj4gPiA+ID4gbW9kdWxlOiB4ZQ0KPiA+
ID4gPiBTbmFwc2hvdCB0aW1lOiAxNzM3NTczNTMwLjI0MzUyMTMxOQ0KPiA+ID4gPiBVcHRpbWU6
IDI1ODguMDQxOTMwMjg0DQo+ID4gPiA+IFByb2Nlc3M6IGRlcXAtdmsgWzg4NTBdDQo+ID4gPiA+
IFBDSSBJRDogMHg2NGEwDQo+ID4gPiA+IFBDSSByZXZpc2lvbjogMHgwNA0KPiA+ID4gPiBHVCBp
ZDogMA0KPiA+ID4gPiAJVGlsZTogMA0KPiA+ID4gPiAJVHlwZTogbWFpbg0KPiA+ID4gPiAJSVAg
dmVyOiAyMC40LjQNCj4gPiA+ID4gCUNTIHJlZmVyZW5jZSBjbG9jazogMTkyMDAwMDANCj4gPiA+
ID4gR1QgaWQ6IDENCj4gPiA+ID4gCVRpbGU6IDANCj4gPiA+ID4gCVR5cGU6IG1lZGlhDQo+ID4g
PiA+IAlJUCB2ZXI6IDIwLjAuNA0KPiA+ID4gPiAJQ1MgcmVmZXJlbmNlIGNsb2NrOiAxOTIwMDAw
MA0KPiA+ID4gVGhpcyBpcyBhbiBvdmVydmlldyBvZiBhbGwgR1RzL3RpbGVzIGluIHRoZSBkZXZp
Y2Ugd2l0aGluIHRoZSBnbG9iYWwNCj4gPiA+IHNlY3Rpb24uDQo+ID4gPiANCj4gPiA+ID4gKioq
KiBHVCAjMCAqKioqDQo+ID4gPiBUaGlzIGlzIGEgc2VjdGlvbiBoZWFkZXIgdGVsbGluZyB5b3Ug
dGhhdCBldmVyeXRoaW5nIHdoaWNoIGZvbGxvd3MgaXMNCj4gPiA+IGluc2lkZSBHVDAuDQo+ID4g
PiANCj4gPiA+IEl0IGlzIG5vdCBkdXBsaWNhdGVkIGluZm9ybWF0aW9uLiBBbmQgaWYgeW91IHJl
bW92ZSBpdCB0aGVuIHlvdSBub3cgaGF2ZQ0KPiA+ID4gdGhlIGluZm9ybWF0aW9uIG9mIGFsbCBH
VHMgYmFjayB0byBiYWNrIHdpdGggbm8gaW5kaWNhdGlvbiBvZiB3aGljaCBHVA0KPiA+ID4gdGhl
eSBhY3R1YWxseSBiZWxvbmcgdG8uDQo+ID4gQ2FuJ3QgeW91IGdldCB0aGlzIGluZm9ybWF0aW9u
IGZyb20gTmFtZSArIGNsYXNzICsgaW5zdGFuY2U/IGlmIG5vdCB0aGF0IHNob3VsZCBiZSBwbGFj
ZWQgaW4gb25lIG9mIHRoZSBzZWN0aW9ucyBiZWxvdy4NCj4gTm8uIEkgd2FzIHRyeWluZyB0byBk
byB0aGF0IG9yaWdpbmFsbHkgYW5kIGRldGVybWluZWQgaXQgd2FzIGltcG9zc2libGUgDQo+IHRv
IGRvIHJlbGlhYmx5IGZvciBhbGwgY3VycmVudCBhbmQgZnV0dXJlIHBsYXRmb3Jtcy4gSGVuY2Ug
dGhlIHNlY3Rpb24gDQo+IGhlYWRlciB3YXMgYWRkZWQuDQo+IA0KPiBJdCBpcyBhbHNvIG11Y2gs
IG11Y2gsIG11Y2ggYmV0dGVyIHRvIGJlIGV4cGxpY2l0IGFib3V0IGRlYnVnIA0KPiBpbmZvcm1h
dGlvbiB0aGFuIGZvcmNlIHBlb3BsZSB0byBndWVzcyBiYXNlZCBvbiBoZXVyaXN0aWNzIG9yIHRy
aWJhbCANCj4ga25vd2xlZGdlLg0KPiANCj4gPiANCj4gPiBTbyB0aGlzIHNob3VsZCBiZSBwbGFj
ZWQgaW4gb25lIG9mIHRoaXMgc2VjdGlvbnM6DQo+IE5vLiBJdCBpcyBub3QgaW5mb3JtYXRpb24g
d2l0aGluIGEgY29udGV4dCBvciB3aXRoaW4gYSBoYXJkd2FyZSBlbmdpbmUuIA0KPiBJdCBpcyB0
aGUgcmV2ZXJzZS4gQWxsIHRoZSBmb2xsb3dpbmcgY29udGV4dHMsIGhhcmR3YXJlIGVuZ2luZXMs
IGV0Yy4gDQo+IGFyZSB3aXRoaW4gdGhlIEdULg0KPiANCj4gQW5kIHdoZW4geW91IGhhdmUgbXVs
dGlwbGUgR1RzIGluIGEgc2luZ2xlIGR1bXAgdGhlbiB5b3UgbmVlZCBhIGRlZmluaXRlIA0KPiBk
ZWxpbWl0ZXIgdG8gc2F5IHRoYXQgYWxsIHRoZSBmb2xsb3dpbmcgaXMgbm93IGluIGEgZGlmZmVy
ZW50IEdUIHRvIHdoYXQgDQo+IGNhbWUgYmVmb3JlLg0KDQpDYW4ndCBJIGRvIGEgZXhlYyBvdmVy
IGEgZXhlY19xdWV1ZSBjcmVhdGVkIG92ZXIgZW5naW5lcyBpbiBkaWZmZXJlbnQgdGlsZXM/DQpJ
IHRoaW5rIHdlIGFyZSBhbGxvd2VkLCBzbyBoYXZpbmcgdGlsZSBhbmQgZ3QgaW4gJyoqKiogSFcg
RW5naW5lcyAqKioqJyB3b3VsZCBiZSBiZXR0ZXIuDQoNCj4gDQo+IEpvaG4uDQo+IA0KPiA+IA0K
PiA+IEd1QyBJRDogMTMNCj4gPiAJTmFtZTogY2NzMTMNCj4gPiAJQ2xhc3M6IDUNCj4gPiAJTG9n
aWNhbCBtYXNrOiAweDENCj4gPiAJV2lkdGg6IDENCj4gPiAJUmVmOiAyDQo+ID4gCVRpbWVvdXQ6
IDUwMDAgKG1zKQ0KPiA+IAlUaW1lc2xpY2U6IDEwMDAgKHVzKQ0KPiA+IAlQcmVlbXB0IHRpbWVv
dXQ6IDY0MDAwMCAodXMpDQo+ID4gCUhXIENvbnRleHQgRGVzYzogMHgwMjVlMDAwMA0KPiA+IAlI
VyBSaW5nIGFkZHJlc3M6IDB4MDI1ZGMwMDANCj4gPiAJSFcgSW5kaXJlY3QgUmluZyBTdGF0ZTog
MHgwMjVlMzAwMA0KPiA+IAlMUkMgSGVhZDogKG1lbW9yeSkgMTUyDQo+ID4gCUxSQyBUYWlsOiAo
aW50ZXJuYWwpIDI5NiwgKG1lbW9yeSkgMjk2DQo+ID4gCVJpbmcgc3RhcnQ6IChtZW1vcnkpIDB4
MDI1ZGMwMDANCj4gPiAJU3RhcnQgc2Vxbm86IChtZW1vcnkpIC0xMjYNCj4gPiAJU2Vxbm86ICht
ZW1vcnkpIC0xMjcNCj4gPiAJVGltZXN0YW1wOiAweDAwMDAwMzVlDQo+ID4gCUpvYiBUaW1lc3Rh
bXA6IDB4MDAwMDAzNWUNCj4gPiAJU2NoZWR1bGUgU3RhdGU6IDB4NDQxDQo+ID4gCUZsYWdzOiAw
eDANCj4gPiANCj4gPiAqKioqIEhXIEVuZ2luZXMgKioqKg0KPiA+IGNjczAgKHBoeXNpY2FsKSwg
bG9naWNhbCBpbnN0YW5jZT0wDQo+ID4gCUNhcHR1cmVfc291cmNlOiBHdUMNCj4gPiAJQ292ZXJh
Z2U6IGZ1bGwtY2FwdHVyZQ0KPiA+IAlGb3JjZXdha2U6IGRvbWFpbiAweDIsIHJlZiAxDQo+ID4g
CVJlc2VydmVkOiBubw0KPiA+IAlGT1JDRVdBS0VfR1Q6IDB4MDAwMTAwMDANCj4gPiAJUkNVX01P
REU6IDB4MDAwMDAwMDENCj4gPiAJSFdTVEFNOiAweGZmZmZmZmZmDQo+ID4gCVJJTkdfSFdTX1BH
QTogMHgwMThkYjAwMA0KPiA+IAlSSU5HX0hFQUQ6IDB4MDAwMDAwZWMNCj4gPiAJUklOR19UQUlM
OiAweDAwMDAwMTI4DQo+ID4gCVJJTkdfQ1RMOiAweDAwMDAzMDAxDQo+ID4gCVJJTkdfTUlfTU9E
RTogMHgwMDAwMTAwMA0KPiA+IAlSSU5HX01PREU6IDB4MDAwMDAwMDgNCj4gPiAJUklOR19FU1I6
IDB4MDAwMDAwMDANCj4gPiAJUklOR19FTVI6IDB4ZmZmZmZmZmYNCj4gPiAJUklOR19FSVI6IDB4
MDAwMDAwMDANCj4gPiAJUklOR19JTVI6IDB4MDAwMDAwMDANCj4gPiAJSVBFSFI6IDB4N2EwMDBh
MDQNCj4gPiAJUklOR19JTlNURE9ORTogMHhmZmRlZmZmZQ0KPiA+IA0KPiA+ID4gSm9obi4NCj4g
PiA+IA0KPiA+ID4gDQo+ID4gPiA+IAlUaWxlOiAwDQo+ID4gPiA+IA0KPiA+ID4gPiAqKioqIEd1
QyBMb2cgKioqKg0KPiA+ID4gPiAuLi4uDQo+ID4gPiA+IA0KPiA+ID4gPiBDYzogSm9obiBIYXJy
aXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVsLmNvbT4NCj4gPiA+ID4gQ2M6IEx1Y2FzIERlIE1h
cmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBK
b3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4gPiA+ID4gLS0t
DQo+ID4gPiA+ICAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcC5jIHwgMyAtLS0N
Cj4gPiA+ID4gICAgMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pDQo+ID4gPiA+IA0KPiA+
ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXAuYw0KPiA+ID4gPiBpbmRleCAxYzg2ZTY0
NTZkNjBmLi4yOTk2OTQ1ZmZlZTM5IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZGV2Y29yZWR1bXAuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZGV2Y29yZWR1bXAuYw0KPiA+ID4gPiBAQCAtMTExLDkgKzExMSw2IEBAIHN0YXRpYyBzc2l6
ZV90IF9feGVfZGV2Y29yZWR1bXBfcmVhZChjaGFyICpidWZmZXIsIHNpemVfdCBjb3VudCwNCj4g
PiA+ID4gICAgCWRybV9wcmludGYoJnAsICJQcm9jZXNzOiAlcyBbJWRdXG4iLCBzcy0+cHJvY2Vz
c19uYW1lLCBzcy0+cGlkKTsNCj4gPiA+ID4gICAgCXhlX2RldmljZV9zbmFwc2hvdF9wcmludCh4
ZSwgJnApOw0KPiA+ID4gPiAgICANCj4gPiA+ID4gLQlkcm1fcHJpbnRmKCZwLCAiXG4qKioqIEdU
ICMlZCAqKioqXG4iLCBzcy0+Z3QtPmluZm8uaWQpOw0KPiA+ID4gPiAtCWRybV9wcmludGYoJnAs
ICJcdFRpbGU6ICVkXG4iLCBzcy0+Z3QtPnRpbGUtPmlkKTsNCj4gPiA+ID4gLQ0KPiA+ID4gPiAg
ICAJZHJtX3B1dHMoJnAsICJcbioqKiogR3VDIExvZyAqKioqXG4iKTsNCj4gPiA+ID4gICAgCXhl
X2d1Y19sb2dfc25hcHNob3RfcHJpbnQoc3MtPmd1Yy5sb2csICZwKTsNCj4gPiA+ID4gICAgCWRy
bV9wdXRzKCZwLCAiXG4qKioqIEd1QyBDVCAqKioqXG4iKTsNCj4gDQoNCg==
