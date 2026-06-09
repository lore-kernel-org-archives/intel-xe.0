Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E27FCD8CA4
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 15:02:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3EA210E354;
	Tue,  9 Jun 2026 15:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mA30hD+q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A851110E354
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 15:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781017355; x=1812553355;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=H3L4qaXnQwinU39CIr12Eyn3jWIg29hILnodO61IgaE=;
 b=mA30hD+qpvobRD5rKFlfxprTrwCKi7WOEYlgcqBsyxjM6+kLPeJrUA9H
 9bMJyNdxX9ZNieWuOvNMLtZg4Vmx9Y6qeaCsTPHDLyucdc1aM/AOqnpNf
 hOHdWU9hsT4GvYjh6EWHWpoBgwXsbhGs15n+T54zkXTNTX7Ve2nxvZYaE
 ZYUVv4M4Au8T9l761wQcKDvABOath4Y20gaOm1UrlyTP9sSC7eKbtP0fy
 dYaFMvksQ/fVdHgIjwNIaXMbgrRnxZU2B0wU6CPww7sEBJif1icbnfsmW
 sCWVUcpxulJOvoMjwf8Oq674OJTsIevSimJABeCG0l3O4mHAK3divvYX/ Q==;
X-CSE-ConnectionGUID: 8e3O7DEKSjWWbf2RG6cVdA==
X-CSE-MsgGUID: y8BnU8ldQ5u8Gt3k1BDDzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81687313"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="81687313"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 08:02:35 -0700
X-CSE-ConnectionGUID: kzo9vpsbRjShc3gtb8UwSg==
X-CSE-MsgGUID: FhaAAbKvSFOoI5AA3wEizw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="269565350"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 08:02:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 08:02:33 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 08:02:33 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 08:02:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vr4wxtuAE4k16D34RRKwHtLjYR2dvKR9W4Ycww28SvDyI0Fod25ZHfrJF2vtLcQ17ZSCq5PrZRAAVhiAi/3gM8OT36DRu8XWdcH28HnB/2fkkHwxSA5OCXwO453kF77dqJ23LOzheVR6Mu/BjMGxJO49nNvq9Py3weA1AWqQ2BAKPBC6eUSVKDf8fps3pbfj1+YpBQoXcsOeF9imthTgNitYomklxYSXs+dK4S09rzH8NqCsfYpCae1rLSQt3ddSQZsKWISR5bWxzWuv72F9V8DHbbmXtUOUdpEBQZxqgVc/TbSVyvXtK0El2nWU1NIDGAZygUfH1umjOP4zEcPjgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3L4qaXnQwinU39CIr12Eyn3jWIg29hILnodO61IgaE=;
 b=gfE8VDbTyrqfhav01OQLhsVw2IGixUJZhay1gFhc9/vs0plWE9FYylf568oEWvXJLH2BdqXtHhrv6z6TV2+GmGo7a8+ECLtHFbifTHGf7UaVSAnQBIBaoNSFVIg+TPqbHCmGXenjDCa/iJJvvoftzQm0nB/VVkQN98KUjqyVSrJsFjAPWwpHSP9JLuEJ5gfGS2otPp2kky13fjYKIvDc4t+WdU5H4oJJMMoD33oe+VTr8X+hRkybMpmx7YiS58PkR/uquBwaWfqaBqMfKX1lRwPoTZJlmV51OAP6MwOc2BzOTvzVDrmqPggj2xLXo+dWJgNK7N+JJ5IoZmMaOw6Zsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 DS4PPFBA72E12AE.namprd11.prod.outlook.com (2603:10b6:f:fc02::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.15; Tue, 9 Jun 2026
 15:02:18 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 15:02:18 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>,
 "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: include all registered queues in TLB
 invalidation
Thread-Topic: [PATCH 1/2] drm/xe: include all registered queues in TLB
 invalidation
Thread-Index: AQHc92PUUcu8nHZOH0mDtABS/w9n1bY2UyWA
Date: Tue, 9 Jun 2026 15:02:18 +0000
Message-ID: <18d30e971b2763075abb7254b4e2b8d63ab02e35.camel@intel.com>
References: <20260608162745.338725-1-tilak.tirumalesh.tangudu@intel.com>
 <20260608162745.338725-2-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20260608162745.338725-2-tilak.tirumalesh.tangudu@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|DS4PPFBA72E12AE:EE_
x-ms-office365-filtering-correlation-id: bab2a87d-5eb4-4536-9183-08dec638199b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|56012099006|4143699003|22082099003|18002099003|5023799004|11063799006|38070700021;
x-microsoft-antispam-message-info: ZVfFPz3mpEaTkpo0+JRgyZrURQUcst9R+Cgpf/OQsfJOCc2feqCLCNVcGZzgVJdKnENWgYNEb79iNGzzm7ob0i1M6CaCLkWqbVF+yCq5f86wr0FhFObCy3UHWi37CMFQ6+GUQYZ1oW3UfZ0L3LPvQu4ws2nFsSXn7xJ5tmJDVX1tQ8wHndp9xNXJlE+IJmv7HNQPM09EFC3hFIrA6YYnl2N9L3fUxkigA/ONO2JB9osjnNQTjbrl8ElsQ+/lPwGqJbeVPOlARJnhMxMWz0DwMLorQmx9F8+flbBK9hsh6Btt4SuOK4EHI+BMAxcJhT674mGahSoBGKVtkpxQwFZtooncMWY/yb0Azu1lAujongDWm900X7ihDXsAbWY3Bqqgea1hMKhi0PAKoIo+QqfnRUuqa8+OiJoiHQAkPbfmX8UEANJQ9pMHWsyiaElkmBemvKiwYnL/S/AZWZsMusfDMSJezzFf8VoeAvwxFtsyE0BITiEVwouB/EOT8B90GYRhstKmlnjWjkAzKpSUOdQ/yRDUuHWtRPwYs4lByDTMP3+C1P3w7IxntZM5cKWqqqlFEY1cV/ipXRaYeAuLNYxHugF9NKoMmTsV8K6mKqo6oCEO5F5h91UUwVv7mgpw0iaSzE8qAI1f3DDz+0s6gN8bUE5ZzHB6s7spTnHvQf4CDVdN5ts5oQ6MFFLUvLtx/zwySex7/n+6XYsU4NCsKpdy/uRIfZ+ENNzc0lcB/0QXSdL0D/PEaEzV7XlA/jq56t+W
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(56012099006)(4143699003)(22082099003)(18002099003)(5023799004)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmNkenJvWkc3MG96QThaRHlSSWR1SWsrSm9nRlFZdk03Y1poQVdYai9BSUwz?=
 =?utf-8?B?NVFpdnZ1bC9yUURYYndKM3VEL29pQk5uTWVGUUdHMEZwclhzWERmMDFqcm8z?=
 =?utf-8?B?di9SZjB6Rm1TM2wrM2x6bHRmWFhyanNiRXhQb0V0Q0hndVN3YnNHVkhUSnBB?=
 =?utf-8?B?VUpmMEVPZ2NTSDNxMHZpOGx2Ly8yR2QvSVhia3pwSDFzUTkydDRwNVN3RXNx?=
 =?utf-8?B?dmZ4VHBOQ2Zld0EwTGpRd3o4aUM1ck0yUEV1QmNKMnhuM25XaldaVUJtM1Br?=
 =?utf-8?B?dnoyNWQvbVJmSVIrbGJkSW5OM2JxN3BCaTFiMjU1S2ZYcS9TZzhQakM4d0o0?=
 =?utf-8?B?RTVTRDhpZGliQXQ2dnF4NjVEUFUrOWcvNGlBZ1ZYY2NsOC8wazZGOFN3RDlC?=
 =?utf-8?B?R2pzcGkwTWVibTRWY2xNQ0c4NFg5bDdxazBzOWsrQVpQZ1VGTWJ6SllsM1Zw?=
 =?utf-8?B?TnJOTytiZ2hpQ21wOVZJVm1DMklpRlovaTVPMzdWNWx2U3JNcDdqNVFpVjYw?=
 =?utf-8?B?TjFzMEpxaGx0U3VLZ1RPczFJS0g3VmJQampMUDdydkErbWZoMmZIUmZDM1g5?=
 =?utf-8?B?OGxyRDA4RDg3WkIzTmN1RU9jWEhLekNJSVR2dVB2UlFOQWhJdVllamlKU3lr?=
 =?utf-8?B?WWRwSmE1T05HREJUMzZHeFRqUVhSa243OHhoMGFXTVk4TGNPbXZjN0o2a3d3?=
 =?utf-8?B?QkdyM3VkZHU4eTQ5eXl2UHZIMi91c2VSenRwaHlpeEl4NGJTMlRXeUk4Ny9w?=
 =?utf-8?B?djRGTkc2NXhOZHR5SWI2NTRDWmF0dXBMWVlNQmc1d05tajdTRWlTWFN5ZExu?=
 =?utf-8?B?Z3FaMm1Gby81Z3Ntbk12cXBrWGhQejhvbkFiS2s2dWpFWUtIRmpxNjVGNnRO?=
 =?utf-8?B?VXR1Z0pKOURzUjByS0lsN2RCbUhOcWVDOGdVc0xDU1kraFlmOEtOd2VzQXNm?=
 =?utf-8?B?TTI5d1dwUTVUbzBjK3dvYWR5Y2FyMHdoQXZ5SktjRkdEcTNTMGo1d3FpUjc1?=
 =?utf-8?B?UEdBWUg2ZkxqL0hPSkpFNjZISFBpeEcwL3dOUWVTanNFa25tdmIyOHI1ZjBl?=
 =?utf-8?B?a1ZML0NhR0hvemZrSU1tcnlacTI3SEc2Vk9HSWdORVF6VlZ4ejJXeWgzb2dn?=
 =?utf-8?B?UjgvUFdBME9EcnJMMGltQnBjanNoMVNjeGtUOVVCSlJBdHRGcXJxbVJKWjAw?=
 =?utf-8?B?NkNBaFhaZUJCZkkvdE8rUmx6SkIrVVNkalY5WUZXWTNhMWx6VXNVcXpXTFoz?=
 =?utf-8?B?ZEh5Y0VOZDZ5bE96cW4wbCthRk5BNGhzdjZCN2RaL0tWNStHSFdmTkFHT0pX?=
 =?utf-8?B?Q2ZhV0YyeDJQKzlNRGVKTmxEMFBMSDZhWTViT25QZXNBMmlTTzFNblBwb1V4?=
 =?utf-8?B?YUs0YW0wN1R2RmpqaWVQR1JZR21tVFRWZlJQWGpnZHA1L3Y0TTRmV2ZYWHNT?=
 =?utf-8?B?QzBkNFEzY29GbEhRcjgxU0NZbXdmbWxnWTZyRHo2V3FvZzNYTWgwaDJLWmhT?=
 =?utf-8?B?Si80bzhhUy9aM0pFeHRMdEVoOVF4RGpHM1dYMWNoYTlhelBYV29tSHpoZEM5?=
 =?utf-8?B?R1AwaklNY2s1WFFtV091YVJkNzJEN0l3WmFESmRxSDNqaHo5MWpGS3RzWmlP?=
 =?utf-8?B?bjlPTVBubENHd2dERloxS3pPQkdwM1U3cmxXS1hqb25XLzZVSk5KcHEzWXM3?=
 =?utf-8?B?bUJwRytOSjdhbUNUSVAwU1hTcEtmL3FwMVhFY2IyenVEOEgzRTRJbHNWcUhD?=
 =?utf-8?B?MDB6NkRjazZZcE8wWDZERU9keXArbXRiQ0trZ3c3cDY0Ym5yVmVVMXRoZTdl?=
 =?utf-8?B?V2xoWVFRMXpnN2dOSnVIRWxSTElSMHRuNnVVb09pTWNWb2lNa1J2ekhSZjM2?=
 =?utf-8?B?UlltSDcvQlVrMmJOMlcvOGtVK0RmM0pmbnVZcjhhT2crNklIamd2eC9neWVv?=
 =?utf-8?B?c0tyVXFwV0Zua1gxRkhoMThLY3p2bEhlYm85clJnVDJWWDY0U3lkaUdvVDdt?=
 =?utf-8?B?QkJhWnZIMHh6QjI4YXlRL3o1b0xUR3RTVXVkZW80SVo0QXloYS9LWjZzME9O?=
 =?utf-8?B?cUttU2NMcGo0aWFGeTNneWtqQ0I1WEhZL1U5TkNkcFZmckNBZUJqSmk0WE1G?=
 =?utf-8?B?Tm4yY1Mza3R6Mzl6akRjb09PQVgvelEzUk4ycy9YT1dLYnRNQ0VIZm5nU2tR?=
 =?utf-8?B?UFBVb2w4cVpRckQ4dU1IVnA0c09NbVBUbXBKc0NoWkUrN2xQL1ZBTExwcUNC?=
 =?utf-8?B?cFRySVJQcFJZd0xuMDA5UGlaQ2FLekdBQ3I1RVlMRmU4TTRheUxUNFNVbCt2?=
 =?utf-8?B?ek92NDlkQk1JMStTT0JNYWZFamhpNE1HekhUbXdWVW9KMWVMSkMyZE9HOGFD?=
 =?utf-8?Q?KpHwhSE3PnrsqkvasPUGcOtLExeP1K6uWc54PaEvFLtGh?=
x-ms-exchange-antispam-messagedata-1: lvX+3kRc7d+ugQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <86D57072E86FD14583EDFDCAD3A88529@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Pryx9ArLPbgwB+CYQGTfPVe5oT2d17vNQ7VmENsW3p+SCWBrErruynUO0l+NUbzLzMKMZ7vSlUOX/kYJG10sIKjjVc98mf8NBr62He/ss1Xu0ILDO+P4hP8qiIPpmJrQp9y112X8n2pZOgzwiLWmEmfoJQ3f+RfkaWe2jAwiMK8tyg+8LBaQv6atXCgFGX7mIR6KHyPY2z3oDFj0mWQpba8/OWM8adpf6lRIwoaRjqx8iCb+VszlB6fL0WjBj2SL7TaLrPgI0uKrLRCzNeTZ9eJJ2GJ/SvaQU80YCCdX9gop0b+rOF532WBVQEJM1f4DDruHnlztEm78xpR6UEkkcg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bab2a87d-5eb4-4536-9183-08dec638199b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 15:02:18.3124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MK6LNvZRHey/Sn28m9lS+oExqmeeGQr3yQN3n2elRXhpyZBpazf3MBq+L66xTDMW3CRL+9bJ7tA2Z0Dk67002684BsYSiQwHWmoUluLFNlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFBA72E12AE
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

T24gTW9uLCAyMDI2LTA2LTA4IGF0IDIxOjU3ICswNTMwLCB0aWxhay50aXJ1bWFsZXNoLnRhbmd1
ZHVAaW50ZWwuY29tDQp3cm90ZToNCj4gRnJvbTogVGFuZ3VkdSBUaWxhayBUaXJ1bWFsZXNoIDx0
aWxhay50aXJ1bWFsZXNoLnRhbmd1ZHVAaW50ZWwuY29tPg0KPiANCj4gQ29udGV4dC1iYXNlZCBU
TEIgaW52YWxpZGF0aW9uIGN1cnJlbnRseSBzZWxlY3RzIG9ubHkgc2NoZWR1bGluZy0NCj4gYWN0
aXZlDQo+IGV4ZWMgcXVldWVzIHZpYSBxLT5vcHMtPmFjdGl2ZSgpLiBEdXJpbmcgcmViaW5kIGZs
b3dzLCBxdWV1ZXMgbWF5IGJlDQo+IHN1c3BlbmRlZCAob3IgdHJhbnNpdGlvbmluZyB0aHJvdWdo
IHJlc3VtZSkgd2hpbGUgc3RpbGwgb3duaW5nIHZhbGlkDQo+IHRyYW5zbGF0aW9ucywgY2F1c2lu
ZyB0aGVtIHRvIGJlIHNraXBwZWQgZnJvbSBpbnZhbGlkYXRpb24gYW5kDQo+IGxlYWRpbmcNCj4g
dG8gbWlzc2VkIFRMQiBpbnZhbGlkYXRpb25zIG9uIExSIHJlYmluZHMuDQo+IA0KPiBUaGUgdW5k
ZXJseWluZyBpc3N1ZSBpcyBhIFRPQ1RPVTogcS0+Z3VjLT5zdGF0ZSBiaXRzIGFyZSBmbGlwcGVk
DQo+IGxvY2stZnJlZQ0KPiBmcm9tIGVuYWJsZV9zY2hlZHVsaW5nKCksIGRpc2FibGVfc2NoZWR1
bGluZ3ssX2RlcmVnaXN0ZXJ9KCksIHRoZQ0KPiBzdXNwZW5kL3Jlc3VtZSBzY2hlZC1tc2cgaGFu
ZGxlcnMsIGhhbmRsZV9zY2hlZF9kb25lKCksIGFuZA0KPiBndWNfZXhlY19xdWV1ZV9zdG9wKCk7
IG5vdGhpbmcgaW4gc2VuZF90bGJfaW52YWxfY3R4X3BwZ3R0KCkNCj4gc2VyaWFsaXplcw0KPiBh
Z2FpbnN0IHRoZW0sIHNvIGFueSBzdGF0ZS1iYXNlZCBwcmVkaWNhdGUgY2FuIHJhY2UuDQo+IA0K
PiBJbmNsdWRlIGFsbCB0aGUgcmVnaXN0ZXJlZCBxdWV1ZXMgc28gdGhhdCBUTEIgaW52YWxpZGF0
aW9ucyBhcmUgbm90DQo+IG1pc3NlZC4gVGhpcyBpcyByYWNlLWZyZWUgYmVjYXVzZSBsaXN0IG1l
bWJlcnNoaXAgb24gdm0tDQo+ID5leGVjX3F1ZXVlcy5saXN0DQo+IGlzIHN0YWJsZSB1bmRlciB2
bS0+ZXhlY19xdWV1ZXMubG9jayBoZWxkIGJ5IHRoZSBjYWxsZXIuIFRoZQ0KPiBwZXJmb3JtYW5j
ZQ0KPiBpbXBhY3QgaXMgZXhwZWN0ZWQgdG8gYmUgbWluaW1hbCBhbmQgaGFybWxlc3MuIElmIGl0
IGRvZXMgdHVybiBvdXQgdG8NCj4gYmUNCj4gYSBjb25jZXJuLCB3ZSBjYW4gY29tZSBiYWNrIHdp
dGggYSByYWNlLXNhZmUgc29sdXRpb24gdG8gaWdub3JlDQo+IGNlcnRhaW4NCj4gcXVldWVzLg0K
PiANCj4gRml4ZXM6IDZjZGFhNTM0NmQ2ZiAoImRybS94ZTogQWRkIGNvbnRleHQtYmFzZWQgaW52
YWxpZGF0aW9uIHRvIEd1Qw0KPiBUTEIgaW52YWxpZGF0aW9uIGJhY2tlbmQiKQ0KPiBBc3Npc3Rl
ZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVzLTQuNg0KPiBTdWdnZXN0ZWQtYnk6IFRob21hcyBIZWxs
c3Ryb20gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5
OiBUYW5ndWR1IFRpbGFrIFRpcnVtYWxlc2gNCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBIZWxsc3Ry
w7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCg0KQnV0IGxldCdzIGhvbGQg
bWVyZ2luZyBmb3IgYSBsaXR0bGUgd2hpbGUgYW5kIHNlZSBpZiBNYXR0IEJyb3N0IGhhcyBhDQpk
aWZmZXJlbnQgaWRlYSBvbiBob3cgdG8gYXBwcm9hY2ggdGhpcywgYW5kIGlmIHNvIHdoZXRoZXIg
d2Ugc2hvdWxkDQppbXBsZW1lbnQgdGhhdCBhcyBhIGZvbGxvdyB1cC4NCg0KVGhhbmtzLCBUaG9t
YXMNCg0KDQoNCj4gPHRpbGFrLnRpcnVtYWxlc2gudGFuZ3VkdUBpbnRlbC5jb20+DQo+IC0tLQ0K
PiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfdGxiX2ludmFsLmMgfCA3ICsrKy0tLS0NCj4g
wqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfdGxiX2ludmFsLmMNCj4gYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3RsYl9pbnZhbC5jDQo+IGluZGV4IGNlZDU4ZjQ2Zjg0
Ni4uY2Y2ZDEwNmU2MDM2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
X3RsYl9pbnZhbC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfdGxiX2ludmFs
LmMNCj4gQEAgLTI1NSw5ICsyNTUsOCBAQCBzdGF0aWMgaW50IHNlbmRfdGxiX2ludmFsX2N0eF9w
cGd0dChzdHJ1Y3QNCj4geGVfdGxiX2ludmFsICp0bGJfaW52YWwsIHUzMiBzZXFubywNCj4gwqAj
dW5kZWYgRVhFQ19RVUVVRV9DT1VOVF9GVUxMX1RIUkVTSE9MRA0KPiDCoA0KPiDCoAkvKg0KPiAt
CSAqIE1vdmUgZXhlYyBxdWV1ZXMgdG8gYSB0ZW1wb3JhcnkgbGlzdCB0byBpc3N1ZQ0KPiBpbnZh
bGlkYXRpb25zLiBUaGUgZXhlYw0KPiAtCSAqIHF1ZXVlIG11c3QgYWN0aXZlIGFuZCBhIHJlZmVy
ZW5jZSBtdXN0IGJlIHRha2VuIHRvDQo+IHByZXZlbnQgY29uY3VycmVudA0KPiAtCSAqIGRlcmVn
aXN0cmF0aW9ucy4NCj4gKwkgKiBNb3ZlIGV4ZWMgcXVldWVzIHRvIGEgdGVtcG9yYXJ5IGxpc3Qg
dG8gaXNzdWUNCj4gaW52YWxpZGF0aW9ucy4gQQ0KPiArCSAqIHJlZmVyZW5jZSBtdXN0IGJlIHRh
a2VuIHRvIHByZXZlbnQgY29uY3VycmVudA0KPiBkZXJlZ2lzdHJhdGlvbnMuDQo+IMKgCSAqDQo+
IMKgCSAqIExpc3QgbW9kaWZpY2F0aW9uIGlzIHNhZmUgYmVjYXVzZSB3ZSBob2xkICd2bS0NCj4g
PmV4ZWNfcXVldWVzLmxvY2snIGZvcg0KPiDCoAkgKiByZWFkaW5nLCB3aGljaCBwcmV2ZW50cyBl
eHRlcm5hbCBtb2RpZmljYXRpb25zLiBVc2luZyBhDQo+IHBlci1HVCBsaXN0DQo+IEBAIC0yNjYs
NyArMjY1LDcgQEAgc3RhdGljIGludCBzZW5kX3RsYl9pbnZhbF9jdHhfcHBndHQoc3RydWN0DQo+
IHhlX3RsYl9pbnZhbCAqdGxiX2ludmFsLCB1MzIgc2Vxbm8sDQo+IMKgCSAqLw0KPiDCoAlsaXN0
X2Zvcl9lYWNoX2VudHJ5X3NhZmUocSwgbmV4dCwgJnZtLT5leGVjX3F1ZXVlcy5saXN0W2lkXSwN
Cj4gwqAJCQkJIHZtX2V4ZWNfcXVldWVfbGluaykgew0KPiAtCQlpZiAocS0+b3BzLT5hY3RpdmUo
cSkgJiYNCj4geGVfZXhlY19xdWV1ZV9nZXRfdW5sZXNzX3plcm8ocSkpIHsNCj4gKwkJaWYgKHhl
X2V4ZWNfcXVldWVfZ2V0X3VubGVzc196ZXJvKHEpKSB7DQo+IMKgCQkJbGFzdF9xID0gcTsNCj4g
wqAJCQlsaXN0X21vdmVfdGFpbCgmcS0+dm1fZXhlY19xdWV1ZV9saW5rLA0KPiAmdGxiX2ludmFs
X2xpc3QpOw0KPiDCoAkJfQ0K
