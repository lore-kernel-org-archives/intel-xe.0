Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7273BE7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 18:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9A110E642;
	Thu, 12 Dec 2024 18:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M+YNZhML";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A8310E642
 for <Intel-Xe@lists.freedesktop.org>; Thu, 12 Dec 2024 18:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734027498; x=1765563498;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=V2qUbX66HycqXUBHypOxaqZ/cJ6ovL2hlxhllHKECjw=;
 b=M+YNZhMLcpkBR8RQFhH1i9sYcTpWQMjthcT+uI0P9X6sVF6VftVxc0+H
 oWJkgJok8SDM+d/bH2AqBIDVz77eqLECLe7TI1RIbbiM5y69uk6cj+dUA
 gBxObchO7MIuRaOo43onaYm5wQ6No6E8SHRIEQ95/g342BGmxAMlcUH07
 CPCJEdxPG53vwBwXJpEsbddQkiHV/si8MfI4b9uLnpfyoklAyNXnVZ9ep
 12m46DuG+QTXsSIl2o98MQ2zPZHDI1AT1eQXC0xCSv7VpHy6cjwz9sR2h
 FhbpWDXO3bbB5E3LZyDfk1lKIxcs+540qD2cpQX8E1tqEBfXZA2pp61hZ A==;
X-CSE-ConnectionGUID: hLqp5EyERj6i1wkHOUd+TQ==
X-CSE-MsgGUID: U7rAJNMhTlmE7+kkLVvCWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34593597"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="34593597"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 10:18:15 -0800
X-CSE-ConnectionGUID: 1bUq6IrASmiAmdww/iqQNw==
X-CSE-MsgGUID: +8+K9cqZQbafmZ4SLnsKvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133680066"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 10:18:15 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 10:18:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 10:18:14 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 10:18:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCdbJ4kmvG8vug9I6PkoXgmBY+MQsfh5LGU8oGpN/XHJwInsugSJV5qAfJjiY7U2Zw92JTabByBpYxyTCKdKWqogkgjfQ20ICaXCEYSPf8BC9pLBskSMsaium9t9IhDRYnD2o997T/xyZEtdjYzUSaph8neQl7TQYNySKyew7V25aQef+Wvs3s+IeOnJkdJF2ot5ciwSqTl71p/pvVhyHsENqv0CHGIa3C2lMKC+HEwbaM3fCAEDRUqtYSyYuD1uI55Bsk7M5aFKsCBqEuT7ejlyEbHLCb3uBlzDocxNDSQAT0va4xZOeJ/Elyd7eJcBREcz/rXi/VatTGSqfKxjmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2qUbX66HycqXUBHypOxaqZ/cJ6ovL2hlxhllHKECjw=;
 b=qn5zjK132/oEG4pQUycVcwfpJWNas3XXXbrWPT6hXqcuDBD/5aSPKqKpgbavSYirhSDu548LwZ63NUq36lbY75Au9DGqery5xUiLFkF1loey/gKX23waw9l5unBwayo05jQJZ5B/pKfmirNRTjKFc3fJCOOMbN/VGtikjADuR8pcG/dAWWoqFvD78mfCaXszjvu3K2zdHIRcBvJ5mmgJQ3XMvzAb0qIFyqES1eyfwJJt56DgQ88snVYGRrnpOwm6WxNGk5cGuJ4aIfXMxmjerfD5dq3P2Fem8hXxyYtFlttUvuXZxCNzYKZMQhjxskyNCdWOLyJzR1zfHq77RbZ6vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DS0PR11MB7960.namprd11.prod.outlook.com (2603:10b6:8:fe::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 18:17:52 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.8251.015; Thu, 12 Dec 2024
 18:17:52 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "Filipchuk, Julia" <julia.filipchuk@intel.com>
Subject: Re: [PATCH v9 03/11] drm/xe/devcoredump: Improve section headings and
 add tile info
Thread-Topic: [PATCH v9 03/11] drm/xe/devcoredump: Improve section headings
 and add tile info
Thread-Index: AQHbFS22wULV4kwY+0uYXcAdod4eerLjWfGA
Date: Thu, 12 Dec 2024 18:17:51 +0000
Message-ID: <ca2978d748368f37e0fd29fd65b059c52b1b755f.camel@intel.com>
References: <20241003004611.2323493-1-John.C.Harrison@Intel.com>
 <20241003004611.2323493-4-John.C.Harrison@Intel.com>
In-Reply-To: <20241003004611.2323493-4-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DS0PR11MB7960:EE_
x-ms-office365-filtering-correlation-id: 23261ef1-1f92-426b-ec8c-08dd1ad94aae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?enNkZHY5eGk1Zkp0Y2k1M08zTzRXNTFtMm83emFaeUFVdTkzeWJqR1ZRZ1Z6?=
 =?utf-8?B?bWErZ08rT3NkcXJLNXJIQW4zVmZ4a2FwdXRnSS91cnR2bmMvWFJkVmhpdXZI?=
 =?utf-8?B?NUhpZ3VRMSs1dlNKbnhLWm9iSEh5WWgzL05NalRtNHdEZmc5K2VUWEpoRGo3?=
 =?utf-8?B?RnNSMzczY3NqOUFKdTNjMVcweFpjcjVQNFVJcnRxK0pMYmQvMjFyeTNMeEpw?=
 =?utf-8?B?OCt1WDFwWmpSM2VKK2lNaFpnZFpBL2RqcU14czg0T1Yva0g3YTR6MDI2VytN?=
 =?utf-8?B?UWtmZlJDWmhqQ3RZeFJmTmhPQnBVcVhhZFQvMUtCZHpIWmd2alU2aFk3WnY2?=
 =?utf-8?B?TllJeXFGYjk5Z1FEL05LRkx5aUhZNjUwOHM4K2pSTXFNbzJMdUFrTGVhZk83?=
 =?utf-8?B?TVpRdjVrWC9yVGVCM0RlbWdUV1NUM0pXMG1TU2ZTK2VUUFF6NW5JbGFKTUR2?=
 =?utf-8?B?RitLUXE4cUlzb3N2WTRTRHVHcmJhSkZWcTlhTStrU2wyaGQwczVCYTIrb0FR?=
 =?utf-8?B?QnNvYmZSNVN5QUFqbGVZeW5rQkVSdFZSR0swVmhYbW9Sd1hFNjIvTXRtYWRq?=
 =?utf-8?B?dXBma0t3cEcrWTRwZG1UZ2tlOURZbjhMM0NoZjhHakdFZndwRmE4U3Q5aHpX?=
 =?utf-8?B?eS9ublR4ZEpPUzkySUtYaXJ5RE5XbVBLODk1VWRTSHgrZzgxeEgvNjI5Ulpy?=
 =?utf-8?B?Q0Q5ZS9BODZsMTJNZE1wV1FhZ0k4b1VFbGJUS21JMUxsdjUyaEhYa3VncGFk?=
 =?utf-8?B?dEdpKzNsdUFEUGJPQ3R1Und2MU5FMUxFcEo0MjYxT3ViNTl6MHc5TkNWcEhB?=
 =?utf-8?B?eWlNSUxIcEhqOFYwVCthSHV6ODhWb0ZmUmRUbFMxYnlnQm1CWmJscDFBbGR1?=
 =?utf-8?B?aEh4L2k5NFBiSGRtaktFVEhGVStLS2VkRFdmTERrVzNRUHVUUzVPOEF6cTky?=
 =?utf-8?B?NnUweFExRUhsOGVpallGTjd1WHRMaVhyMFR2ZHhrZW9NamJUSUdKbytOMEMw?=
 =?utf-8?B?VkNOSnAyVDV1YkVMWEY2NWNUdVVJUDFmQTRjcU5EaHRVeEYzRUs5eGdQSDg1?=
 =?utf-8?B?bWlzMVVGL3htWm8vTE9xZW5XdXowUktBNG9rZWR0UkJZWXlpaHh4TWxkVXE4?=
 =?utf-8?B?Z0hQT3pJamY0bWR6ZTZrb21TZXY5OC9DN082UjB4L3p1RTdrelpVV3UzRFNF?=
 =?utf-8?B?d2tJcTlxelk5UG1MR0dYL0VzcVlQSXFsQnhhZ1U3QUpQRDJiSjBFOG5YdmZn?=
 =?utf-8?B?OExDdCtMQ2VDZ2lDeXBXZm92UjJpc0c2U0dEQk1CU1FlSGZDR2NJQU9uOUZ6?=
 =?utf-8?B?UWdhZWZ0Zzcxb2JaV05keitraHF5ZXNFRyszcTVpUEsrUHJRZkQvSmZ5S0lW?=
 =?utf-8?B?MXI3cG0rZ3ZWMnRLZ1NYa3VaMEM5emltS1k3MUpRZVpjZXA2cFk2V1ZLSUsz?=
 =?utf-8?B?WHpJaURUV25DeVNPYWRVSnVKbXVHS2QxK0FERGZQU016WnN4ZjJibnhNa2pz?=
 =?utf-8?B?U2VVZlZGNGxxRExiYWhnbS85cUx6ZUg4NTJqblFzY293NGpqTmwzcDQvU0F3?=
 =?utf-8?B?V3lQQ2R4aWZMZ3lpUUFRMGI5SXYrZlMxN0tOTFhYb2FaSlFIK0FiVTVZR29F?=
 =?utf-8?B?cVNxSmlDbFlFc1dsTUZOSWdOOWo3QzVWcEkwU09xcW5MUmJKYlQ1dFFZQUNH?=
 =?utf-8?B?MTdwM3J6ZUV0TGNiVWM1dThRRmtHejJUcStiRGp2Z21KSytzaC9jR3lHdEVY?=
 =?utf-8?B?UGtNVnBkVUF3ZktDL1V0eUFpaHNDdTM5ZlBSREdoZEYyWDZmTk5jUUZsU2Yx?=
 =?utf-8?B?cWR3UXlNRXBsMTZmam5sNitqT0FqcXVBT1Z6QVRCQUZ5ZGJFOTYvZEVRenBk?=
 =?utf-8?B?THk0OEFrdWpoNks4bVQ4QkNVeVl1WERDTzhxcGFiNFlSS0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGwwSWRkS1dzRklEQXBpczd6UVlJYllrLyswd01wWUJYOVk4NEVsbGFzK2VV?=
 =?utf-8?B?NWRBYkNnSi9IUDZ3UkpNMG01b1VFcEJwUmZvRlpFbXpGUzEyYUVNS0laam9Q?=
 =?utf-8?B?Q29TZGFTZ1FLK0xsWEphNWlOVVlVWUl4R2JNUksyNjlxeVRpS0o3d25LNmcv?=
 =?utf-8?B?L2JiY0kwcmMrS1kveDhIK3lOdmdkeitBb245ZXNlbjZOa05lWE9uRDMwM0I4?=
 =?utf-8?B?a1ZqM2tjSjJNSHNPMk1YcUkzQnpaZ1cwOUg5UC93ME5aVUU4eDVINVl6UTky?=
 =?utf-8?B?S0Y0ZHB0NjB2b0VrVTN0OERCQUpycWVQdmhXSUwrSEFtVjBsSjUraW1UelVo?=
 =?utf-8?B?N2kzK3E5d0NsTXVOQ3U1YUE5R0YvR3V1dUc5OVZMSUErMGNSYkRtbllKY2x3?=
 =?utf-8?B?L1RxanNIOVJ4V2E1ODJYZi8yRTR4M1MvRVFSTkxsN3VXdEhvTmcvaGpyZzdy?=
 =?utf-8?B?VjMxU1J1Wmp4QTEvbUNQSGQ2Qm9DUzk4ak1Fb2NLZlY1eldRczRIVlpyQXBJ?=
 =?utf-8?B?SDhtamxtcXN3Z1RweDk2RU1FQWxmdWE0TXNwNlVKTTlBanVRdXpvVlNBaERI?=
 =?utf-8?B?a2JDUTFyNURRUDg3Ykd0WGZqZmNaekVWSngxeU9Vd2x2a0Z5d1FCTVhpa2E0?=
 =?utf-8?B?K2JadnpFejJPSnMxdzJmWWpqQVh6ZS9VeUhoSkNTN3ZRZndPdDZVSkNvVFgv?=
 =?utf-8?B?d3lYTmxEZ1pyakZ2aEZWWG04dEszSE9kNU00UG1oc0JPNjhLSnRRQnBiOU9M?=
 =?utf-8?B?UjQyVkp1ZCs0WVNCOVJQQWxrd0JYbzAxUVZkR3FmaDYwT3hqZXprdG52WENa?=
 =?utf-8?B?Q3NDZU9qb3NFcytSelc1RW8zTEk5a0p0Slp1eS81dnA0ZEZ2UmtQY2xtTENM?=
 =?utf-8?B?SkkvbXc2dUxIVTRWUm44U2VmRElMYlNSM0FNOEZUZUZUSWM1dXFjVGFqWUts?=
 =?utf-8?B?ZS9mejh3MlhHbzlLcmJ1eWJsNzJhRlRBM2JpRlhESGNNUWduWEFyL0NLOUlJ?=
 =?utf-8?B?TWpRT3ZJUDJ2S05NSFFSczIvc2V6VHltS3VwTi9yVFFqNWw4OEV1alR2dVF4?=
 =?utf-8?B?L0FDUWpPdHNLMkpPelhnSitpREp0Q3ptSTN1WlNPQ1hUZ3pReFhhdkZ3RFZ4?=
 =?utf-8?B?clJQaDV6anV3SUdGVmUxRkVuMGZ1Zld4TGhhek13c1JGM3EyYnVEalh3V3RZ?=
 =?utf-8?B?L3hWQzArTkFaZnlucWUzZUgrNjFmWGVvQW5mVnBjZ055SEg0K1dxUnNNeHdS?=
 =?utf-8?B?TWdNT3EraDFybjdkSUtyRG95VmNkV05oTWs4SzUyVm5TaDF3VnkwcndqZDZR?=
 =?utf-8?B?cllIbkg0RHhTQk11SGs0NUxFbHdHcEVkN0J6TzRmNVU1SGlJeEFtVHRJQW8x?=
 =?utf-8?B?MGNxQStzSnRHOWFBVW5aOFJxcmJtbVZ5blM5NzFFalNPQ0VKTnRyV2Q3K0FN?=
 =?utf-8?B?TDJtQi9jYnlRbndjMzBkdkVjL01QV3RSUHpuK2o1MytXeFJHanNFQ3NLclND?=
 =?utf-8?B?dVdzR05LT2xJU1ZkbDlVSExEUG5pL0Vib050cUlzdWtsaURIRjJ2OGJtVHJW?=
 =?utf-8?B?dWl3SHBvZ1djRFJURmZaVVRBUmF4dGt0R0NDSGlxaVNLZTdVMGl2M2hwdEFq?=
 =?utf-8?B?QWhjdmlja016WUVZa0pFZWlYM000MWlmcEE3b2d3M3MwT3FjQlZCUXgyTTRj?=
 =?utf-8?B?N2liNUYyOWpYeWJ6aHI4UC9rWVl5MFNPb1lGWjhhekhFQjgyaEIxeGRaMHRQ?=
 =?utf-8?B?UjlHdE1ScTEyeXhOeVhpV2VMaTVUb0tCOWxXQ0lXaEJXNkpUdy82RC9NZFgr?=
 =?utf-8?B?ejhOL1FXSENkQThQaEo3aVFuQXR2LzVBMGRpSnUvNnRySTJEMDRhc2pLSHpR?=
 =?utf-8?B?M3JGN3g0Ri9TTDkzWnQ1YjFlcFErTENDQWZFS21hajJ5MHZwS016alhTUFdn?=
 =?utf-8?B?QjBHYjdDQktnRjgwZ1VxNzJsaVp5cnlzVVFIUGwrQTVCa1phWUlKZVpqeW80?=
 =?utf-8?B?cENIckN1RElvdWhwcjRBd05zQVZaQWRDaWJBbTB5cHY4d1I1aHNlK1lGZGRS?=
 =?utf-8?B?WkxjTUF2Q3Q5TjhIenBicUtpQ1VDR05TT0tJYTVBMTNhcUhTZjBFSjIxWmFL?=
 =?utf-8?B?VkVYdUJNdjEzVStDVzZZV2ZxMXJaU1dkVmtpWW55TzhlSmw5d3B5MVV1aVRL?=
 =?utf-8?B?bFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A15E852386AE944192FEF064792A5063@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23261ef1-1f92-426b-ec8c-08dd1ad94aae
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 18:17:51.9144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8gRYOVmjj+m4dI3F9p0dvY9M3HdhF6tISE5zCBkKuYep4VggU0RAZFGPQBesJW09P1So9bxMx36gxWvj+Og8mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7960
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

T24gV2VkLCAyMDI0LTEwLTAyIGF0IDE3OjQ2IC0wNzAwLCBKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tIHdyb3RlOg0KPiBGcm9tOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tPg0KPiANCj4gVGhlIHhlX2d1Y19leGVjX3F1ZXVlX3NuYXBzaG90IGlzIG5vdCByZWFsbHkg
YSBHdUMgaW50ZXJuYWwgdGhpbmcgYW5kDQo+IGlzIGRlZmluaXRlbHkgbm90IGEgR3VDIENUIHRo
aW5nLiBTbyBnaXZlIGl0IGl0cyBvd24gc2VjdGlvbiBoZWFkaW5nLg0KPiBUaGUgc25hcHNob3Qg
aXRzZWxmIGlzIHJlYWxseSBhIGNhcHR1cmUgb2YgdGhlIHN1Ym1pc3Npb24gYmFja2VuZCdzDQo+
IGludGVybmFsIHN0YXRlLiBBbHRob3VnaCBhbGwgaXQgY3VycmVudGx5IHByaW50cyBvdXQgaXMg
dGhlIHN1Ym1pc3Npb24NCj4gY29udGV4dHMuIFNvIGxhYmVsIGl0IGFzICdDb250ZXh0cycuIElm
IG1vcmUgZ2VuZXJhbCBzdGF0ZSBpcyBhZGRlZA0KPiBsYXRlciB0aGVuIGl0IGNvdWxkIGJlIGNo
YW5nZSB0byAnU3VibWlzc2lvbiBiYWNrZW5kJyBvciBzb21lIHN1Y2guDQo+IA0KPiBGdXJ0aGVy
LCBldmVyeXRoaW5nIGZyb20gdGhlIEd1QyBDVCBzZWN0aW9uIG9ud2FyZHMgaXMgR1Qgc3BlY2lm
aWMgYnV0DQo+IHRoZXJlIHdhcyBubyBpbmRpY2F0aW9uIG9mIHdoaWNoIEdUIGl0IHdhcyByZWxh
dGVkIHRvIChhbmQgdGhhdCBpcw0KPiBpbXBvc3NpYmxlIHRvIHdvcmsgb3V0IGZyb20gdGhlIG90
aGVyIGZpZWxkcyB0aGF0IGFyZSBnaXZlbikuIFNvIGFkZCBhDQo+IEdUIHNlY3Rpb24gaGVhZGlu
Zy4gQWxzbyBpbmNsdWRlIHRoZSB0aWxlIGlkIG9mIHRoZSBHVCwgYmVjYXVzZSBhZ2Fpbg0KPiBz
aWduaWZpY2FudCBpbmZvcm1hdGlvbi4NCj4gDQo+IExhc3RseSwgZHJvcCBhIGNvdXBsZSBvZiB1
bm5lY2Vzc2FyeSBsaW5lIGZlZWRzIHdpdGhpbiBzZWN0aW9ucy4NCj4gDQo+IHYyOiBBZGQgR1Qg
c2VjdGlvbiBoZWFkaW5nLCBhZGQgdGlsZSBpZCB0byBkZXZpY2Ugc2VjdGlvbi4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+DQo+
IFJldmlld2VkLWJ5OiBKdWxpYSBGaWxpcGNodWsgPGp1bGlhLmZpbGlwY2h1a0BpbnRlbC5jb20+
DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMgICAgICAgfCA1
ICsrKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXBfdHlwZXMuaCB8IDMg
KystDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMgICAgICAgICAgICB8IDEgKw0K
PiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYyAgICAgICAgfCAyICstDQo+ICBk
cml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMgICAgICAgICB8IDEgLQ0KPiAgNSBmaWxl
cyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZGV2Y29yZWR1bXAuYw0KPiBpbmRleCBkMjM3MTlkNWMyYTMuLjI2OTBmMWQxY2Rl
NCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMNCj4gQEAgLTk2LDggKzk2
LDEzIEBAIHN0YXRpYyBzc2l6ZV90IF9feGVfZGV2Y29yZWR1bXBfcmVhZChjaGFyICpidWZmZXIs
IHNpemVfdCBjb3VudCwNCj4gIAlkcm1fcHJpbnRmKCZwLCAiUHJvY2VzczogJXNcbiIsIHNzLT5w
cm9jZXNzX25hbWUpOw0KPiAgCXhlX2RldmljZV9zbmFwc2hvdF9wcmludCh4ZSwgJnApOw0KPiAg
DQo+ICsJZHJtX3ByaW50ZigmcCwgIlxuKioqKiBHVCAjJWQgKioqKlxuIiwgc3MtPmd0LT5pbmZv
LmlkKTsNCj4gKwlkcm1fcHJpbnRmKCZwLCAiXHRUaWxlOiAlZFxuIiwgc3MtPmd0LT50aWxlLT5p
ZCk7DQo+ICsNCj4gIAlkcm1fcHV0cygmcCwgIlxuKioqKiBHdUMgQ1QgKioqKlxuIik7DQo+ICAJ
eGVfZ3VjX2N0X3NuYXBzaG90X3ByaW50KHNzLT5jdCwgJnApOw0KPiArDQo+ICsJZHJtX3B1dHMo
JnAsICJcbioqKiogQ29udGV4dHMgKioqKlxuIik7DQo+ICAJeGVfZ3VjX2V4ZWNfcXVldWVfc25h
cHNob3RfcHJpbnQoc3MtPmdlLCAmcCk7DQoNClRoaXMgYnJva2UgTWVzYSBwYXJzZXIhDQpJdCBj
YW4ndCBub3cgcGFyc2UgdGhlIGV4ZWNfcXVldWUgY29udGV4dCBiZWNhdXNlIGl0IHdhcyBleHBl
Y3RlZCB0byBiZSBvbiB0aGUgJyoqKiogR3VDIENUICoqKionIHNlY3Rpb24uDQoNCj4gIA0KPiAg
CWRybV9wdXRzKCZwLCAiXG4qKioqIEpvYiAqKioqXG4iKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcF90eXBlcy5oIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RldmNvcmVkdW1wX3R5cGVzLmgNCj4gaW5kZXggNDQwZDA1ZDc3YTVhLi4zY2MyZjA5NWZk
ZmIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcF90eXBl
cy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcF90eXBlcy5oDQo+
IEBAIC0zNyw3ICszNyw4IEBAIHN0cnVjdCB4ZV9kZXZjb3JlZHVtcF9zbmFwc2hvdCB7DQo+ICAJ
LyogR3VDIHNuYXBzaG90cyAqLw0KPiAgCS8qKiBAY3Q6IEd1QyBDVCBzbmFwc2hvdCAqLw0KPiAg
CXN0cnVjdCB4ZV9ndWNfY3Rfc25hcHNob3QgKmN0Ow0KPiAtCS8qKiBAZ2U6IEd1YyBFbmdpbmUg
c25hcHNob3QgKi8NCj4gKw0KPiArCS8qKiBAZ2U6IEd1QyBTdWJtaXNzaW9uIEVuZ2luZSBzbmFw
c2hvdCAqLw0KPiAgCXN0cnVjdCB4ZV9ndWNfc3VibWl0X2V4ZWNfcXVldWVfc25hcHNob3QgKmdl
Ow0KPiAgDQo+ICAJLyoqIEBod2U6IEhXIEVuZ2luZSBzbmFwc2hvdCBhcnJheSAqLw0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2RldmljZS5jDQo+IGluZGV4IDA5YTdhZDgzMGU2OS4uMDMwY2Y3MDNlOTcwIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+IEBAIC05NjEsNiArOTYxLDcgQEAgdm9pZCB4ZV9k
ZXZpY2Vfc25hcHNob3RfcHJpbnQoc3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdCBkcm1fcHJp
bnRlciAqcCkNCj4gIA0KPiAgCWZvcl9lYWNoX2d0KGd0LCB4ZSwgaWQpIHsNCj4gIAkJZHJtX3By
aW50ZihwLCAiR1QgaWQ6ICV1XG4iLCBpZCk7DQo+ICsJCWRybV9wcmludGYocCwgIlx0VGlsZTog
JXVcbiIsIGd0LT50aWxlLT5pZCk7DQo+ICAJCWRybV9wcmludGYocCwgIlx0VHlwZTogJXNcbiIs
DQo+ICAJCQkgICBndC0+aW5mby50eXBlID09IFhFX0dUX1RZUEVfTUFJTiA/ICJtYWluIiA6ICJt
ZWRpYSIpOw0KPiAgCQlkcm1fcHJpbnRmKHAsICJcdElQIHZlcjogJXUuJXUuJXVcbiIsDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiBpbmRleCAwYWM0YTE5ZWM5Y2MuLjg2OTBkZjY5
OTE3MCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+IEBAIC0yMjQwLDcg
KzIyNDAsNyBAQCB4ZV9ndWNfZXhlY19xdWV1ZV9zbmFwc2hvdF9wcmludChzdHJ1Y3QgeGVfZ3Vj
X3N1Ym1pdF9leGVjX3F1ZXVlX3NuYXBzaG90ICpzbmFwcw0KPiAgCWlmICghc25hcHNob3QpDQo+
ICAJCXJldHVybjsNCj4gIA0KPiAtCWRybV9wcmludGYocCwgIlxuR3VDIElEOiAlZFxuIiwgc25h
cHNob3QtPmd1Yy5pZCk7DQo+ICsJZHJtX3ByaW50ZihwLCAiR3VDIElEOiAlZFxuIiwgc25hcHNo
b3QtPmd1Yy5pZCk7DQo+ICAJZHJtX3ByaW50ZihwLCAiXHROYW1lOiAlc1xuIiwgc25hcHNob3Qt
Pm5hbWUpOw0KPiAgCWRybV9wcmludGYocCwgIlx0Q2xhc3M6ICVkXG4iLCBzbmFwc2hvdC0+Y2xh
c3MpOw0KPiAgCWRybV9wcmludGYocCwgIlx0TG9naWNhbCBtYXNrOiAweCV4XG4iLCBzbmFwc2hv
dC0+bG9naWNhbF9tYXNrKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9o
d19lbmdpbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiBpbmRleCBl
YTZkOWVmN2ZhYjYuLjZjOWMyNzMwNGNkYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2h3X2VuZ2luZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdp
bmUuYw0KPiBAQCAtMTA4NCw3ICsxMDg0LDYgQEAgdm9pZCB4ZV9od19lbmdpbmVfc25hcHNob3Rf
cHJpbnQoc3RydWN0IHhlX2h3X2VuZ2luZV9zbmFwc2hvdCAqc25hcHNob3QsDQo+ICAJaWYgKHNu
YXBzaG90LT5od2UtPmNsYXNzID09IFhFX0VOR0lORV9DTEFTU19DT01QVVRFKQ0KPiAgCQlkcm1f
cHJpbnRmKHAsICJcdFJDVV9NT0RFOiAweCUwOHhcbiIsDQo+ICAJCQkgICBzbmFwc2hvdC0+cmVn
LnJjdV9tb2RlKTsNCj4gLQlkcm1fcHV0cyhwLCAiXG4iKTsNCj4gIH0NCj4gIA0KPiAgLyoqDQoN
Cg==
