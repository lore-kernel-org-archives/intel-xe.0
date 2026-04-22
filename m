Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C102FA1FED
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 20:54:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79D210E027;
	Wed, 22 Apr 2026 20:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihxatdSH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4482510E027
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Apr 2026 20:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776891278; x=1808427278;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GWSh/qJa9X7hyWzibPLtF9ShFlwYav+/BIXY9IrTDS0=;
 b=ihxatdSH5saklaKIH9PmgViXoaYwctjgtrqKyX7xvLb7O54eiXrnz9g7
 zfA0nxvUzKmAoOYzHJMDvNfAMqfEpvAZZuXygl62NYgd6SgeBe2odQey5
 KQsEGbi8Nr2rCtYy0PIEd8f8agTYD8pnSGXr5vQla7iE6TWY0Vm9ggZAg
 FS+k/3+DwuBYcxeEtdwf7Q8bx82UMWrXTuB4RTUAZMQYhR3oFMEZzfb4s
 Z8gERPaLssxkqTgN3HrpsdYD5E4DV56VMO1GZR26XiEyps+ie+HSs6jzO
 bX+kI2MQFNJdq7l+NqnMBk0iGpXy956YZKmK4w3/1xZf6Z+XTp/s/Ed5h Q==;
X-CSE-ConnectionGUID: rslObYo1T8GezHUg+hb7zg==
X-CSE-MsgGUID: ALinwQyyQe2GWXuaAEuS1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="89241386"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="89241386"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 13:54:38 -0700
X-CSE-ConnectionGUID: YlZScx5jTxmeAhwKNdzIKw==
X-CSE-MsgGUID: X90kZom8SN2mCrHAcn2+jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="255933350"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 13:54:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 13:54:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 22 Apr 2026 13:54:37 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.11) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 13:54:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W57mSU75Z3SrJVAhyV95A3bQ8Jo/LVbv/SNx0an13jtmzjIqVNL0BYLRAQOpt3FtuvNiTDgbvl3c00T+DyQRaag400VRjcRJp7eEzCR6usA2rj+UQSiu+lK339WUQWOI3C/U0mKTIxyTsY1wLjgplNtvUlaJFkQoWzDDvrXQNHOKb9d7bqC4znoTnT1/uyjUBgG0qzwIEEtHQt0BJsfzXYP6x5ba0K175a0MVf5zagcj8Mp4WMhPc9buSeWtiUUBwaxjhkMHJzdDHsr3gvcFvUXCwJy2fyzai07hf9G9OSFKNB7xTdNUnSlVXRwplRLjCSzVVIKOq60KLlSvvSMvAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWSh/qJa9X7hyWzibPLtF9ShFlwYav+/BIXY9IrTDS0=;
 b=WEfGdj5FUp1PwKjmXTBVtIG67Yaj9UXPqCOoyV7QJj3V4UC5isDHnWsZjhastWFyy7dFYUGidmlE7jddCAwDRVwSR0og1Y2U/279OpsgNoDeCt9iFNFbVeRicRUuwx3Swg7OaDK5er9IVF9SScgSUbAKw0gL3LWFublMtR00wUXIi4OXjbFelWzdc+PBnasn7bohzIxeG8L/0RSkH3ptZNsRyuC832FZJlAoD5P8y+YolDOnTcgLBLYieu0coF5qlBecnbCsgP3oKS0uijsB5AdwV9cSQ+BnLiwEt9afNSEHBVQ3hyxwQJx+9fYUQU8eLSULTNXQCnKm5OYtye4thQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS3PR11MB9669.namprd11.prod.outlook.com (2603:10b6:8:38c::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.20; Wed, 22 Apr 2026 20:54:33 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.20.9846.011; Wed, 22 Apr 2026
 20:54:33 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>, "Yadav, Arvind" <arvind.yadav@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC 14/15] drm/xe/vm: Add xe_vma_supports_access_ctr() helper
Thread-Topic: [RFC 14/15] drm/xe/vm: Add xe_vma_supports_access_ctr() helper
Thread-Index: AQHctqZZRvC70oPOaEO64sIWJ4FSjbXrxyKA
Date: Wed, 22 Apr 2026 20:54:33 +0000
Message-ID: <766694ff7d27ea1d6879c26210d5f90e3da47ab5.camel@intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
 <20260318074456.2839499-15-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260318074456.2839499-15-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS3PR11MB9669:EE_
x-ms-office365-filtering-correlation-id: 1389716c-ce15-4e3f-66d5-08dea0b15b2b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: qndqY8qh2PLejqMmHHvVoq1AUM+uw2AbOXQ6u+GF81XfB0YrS5vbojRKM0AFBnDqUMfq6BdzgZlbxH/ol67Hewr1VWr71FEnnHB3nwCFsGzLRuUuUSYClMf+rMsN3ILqrxSNdVbJJais7zK5U8VRzle4DSFyWr92r1LD1XZyliwoJg2SaCIj823SMRph4PD8UbDU0R0+FR79XQDoGbfW8SalLBp1YNXvJphD3vEN1ls8NnlPqEBqPk4rNBJ0sZYeGPhOReAe906BB5gQ4LLoQbymUwiiFry5gJDK5v1qvM8fJZuFyVqxwzm9Zzssi4g2VgBQR+GiO80zO9PVvEJuC4K+iWwqFD6HaWdgULAEg6U8oVJKF2pH+OZESang1CXIW8E1QwaDc2Y3qO8CJpY81V9lKbJprVXaB5HedJtd4y3+vd/ImB1j4y/OufiIdjS9IX4sZDl9MUpiFjLl+9b3Fp4W3No5VqAWFDxdbtp7XE6P7Mr+nDs90ApwCksK2ug0SAyW6ZKJP0Y8SS3giOG0LhWL8SigHyajKMEjQKhUN8B/jr7DMmx6WRcn2T87QBKODjCKysPfDm4qm6iOKCAqkSqvFj+dzmvSwyBoOEnX5lljtBFNDx2HxZlipn4CYoY2A7tnGJIKPg7SHwqRmJpoT4K+gapebmFykFaZk3mQciTYrKZCixwwRygKJfdrYPAQYbCBIlKl+vJB1jHw9RHY70UyaE3QHj/FBDLqlQ1AN8sSAJahCP1f0wSihQtgGz0X839YsZlyorBkkp/wwovwP18p02KQ2R79qQYfiaXTvT0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZG44REQ1TTErL0YzcEtIblg3Wk03N21hemFyRHllT0l5Rm41TW1RbkR0NlND?=
 =?utf-8?B?blJhSytSR0U0Q2ZyM1Z4eDVndGdFdTRJd0VVcUpRYm02bXZpZFIyUVZBclZQ?=
 =?utf-8?B?SEpoek8yNEZzdzlHcnQ4MlJFbUMyZCtZK2NJekNGMXpsT1RlTjY0ZnJ1Q2xi?=
 =?utf-8?B?a0FzL2VQdmZuRnh5NHpQcEhjYXhFMXMwRXBQSllzQmplVGtvZ28vdTgrTHFZ?=
 =?utf-8?B?Qm1tWnUxaDIzOHNuZ2dCZ1FROHk2dzlxMm9KcEI2YWlXc25uZHZoUDhzbmxC?=
 =?utf-8?B?U3lvbmthdnRqcFZtUXBqNXRMbHBlbFVjSTNiRnhpSnpJdXpqY1J5TldWU3Uv?=
 =?utf-8?B?VG5hem9JMnZodWp5STgvaXFjTmVDdzdNeDA5UlVmT25VY1Y1Uk9ZTkpnQTBZ?=
 =?utf-8?B?d2NERE52WmZNckllVjJkYUg3Y2lmMS9EMXBBK0t6a245UnRaWklEcG1PaWt2?=
 =?utf-8?B?ME1oby9CYWlueStvdWlwcG93ZWVHVEJ0cGlwSUNhRzF2a1h1ZUF2dTg0NUs0?=
 =?utf-8?B?Yjk4VVBBcWZOZGZiWUh3emQ0TmQxVmJ2UGdyKy92a2lhR1V0V2NhL29KN2xB?=
 =?utf-8?B?bHhHMVhmSDhFVXpvU0dWNUN4T00ybXdocEtPR1YxZCt6R05hN2Y4UkNiUHJn?=
 =?utf-8?B?bHp6SnhtMXYxN3puVjBqbVl5K3VsaHZ2Q0EyaHZYRFVCUlFEVHNoQkRyZ29h?=
 =?utf-8?B?dEZxaEdGRTV0WmVWb2xLWU9oSmdZdTIxSFd1eGpHVm11dGlROG81Rll1NSsw?=
 =?utf-8?B?bnBiT2x6Um5uc245VVluZ1IwVk5pRFppMzlmOGc5bGhrQll6VzlnRHdTaWpv?=
 =?utf-8?B?dXFkYmxmaWhpZlQ5b1BTWEQ5QVRhbW50bmRFbzZIVCttUkMxY3REV1Q1NFJM?=
 =?utf-8?B?N08wRUZ6eExEM29iTlZuazlOMVBCTnRmMXUzeGtFOTR5Vk9wZ01lN3JWUWlR?=
 =?utf-8?B?aDlmd3E5ajAzdGRJOFlnckJ5VkNYbG9mcFF2MVF3bGdWZ0tWS0ovb1p6SDE4?=
 =?utf-8?B?NWhUM2dVd1J2ZVNZdHRMb0tEOVgyR3EzUE1CVUlwbWZ4U2U5aWpLUkxzY3Qx?=
 =?utf-8?B?djYzTC9xZngwQW9XWnJiRlFyQ0JHT1dCOXZIaUhXNW1uckNDREpkM1k2MHhj?=
 =?utf-8?B?MEUvTFVvV1lOU3dlalI5YStMaTJsLzRDSmE5SDd3ZzYxSWVwWk9rZW5kVmZ3?=
 =?utf-8?B?ME55Wko5Mk1NenVLMVhIMHc5dit4dkxsbVhhZFJuM3p4SFZvaGhBemFqckJs?=
 =?utf-8?B?VzZOQm1uRk1KN1lzMlc1WlJPOS9hTFh2UDlnN0RZTVlHY1lsUlMyTFZNZ0dq?=
 =?utf-8?B?aVVINFBnWlFoejhaSDF6UXJHRVJ4c28waVhzbEhyc0FoQmxoQ0VBcnAvYjVS?=
 =?utf-8?B?RVhONnNaWWIvNHdEckFrSTM0UXdVUjdUbzhvcW8rWUhoWldFNzhNTkJ2b05C?=
 =?utf-8?B?Q0tzelNmeHNNN0JpOHlRZWVjaTllZjNBeFgreWxyUWpkQmtrMTcxeVNqdmd4?=
 =?utf-8?B?MjR5QS85aSt1Wk55T3ZMdllJVWNHemNWVEZsRmFPRVQrd1AyQVVnaVcyTWUy?=
 =?utf-8?B?ZUg4U0tVTEZDODVKZkZqdC9nVWpBUmNybENJV3NGL2NxTUozK0o3a0FaeG9q?=
 =?utf-8?B?ODR6L1YwUkxiNStHUUlSY2h5N1lDd0xaVm0xK3ZISUMvOEowaTFGZERTUmZt?=
 =?utf-8?B?VDdOWGp3RDBwRHkxSVJwMFZMbVl6ZkVaRTF2WFZEcVJBREhMNVRNNmwrTlhk?=
 =?utf-8?B?dEJCM1l6TndxbGVCMCtWRDlINFRWY2pMTzJvb1NuMXlzbStZYk9RdVplenVY?=
 =?utf-8?B?dEZCQStvdGZzNjlPakRXTCtHbEtlOTUyRmREZUpMclZuaTRXQzhEcENLa01Y?=
 =?utf-8?B?R2diVE9FTDVHdTc0ZDRqVGY4UlFOWTFwOE03K0o1U1pLZHRIdzZmVVd1a1BV?=
 =?utf-8?B?QVo0WTZJM0VCbGVKMTNWZGdDSUFSZEs3cDBHb2lmSnB6Q2Z3OHZzOFI3RUpa?=
 =?utf-8?B?T29uVTVaVW5rUENIWGdpZVVpR3NvSVNUWnFDTDN6ZDhsbldKcDlScHp2UXhy?=
 =?utf-8?B?VFZiak5sa0VOelpIRHJvTUg1b0srNk44V0ZVOTJ1QUJOV3NjQjJVclNlVUNE?=
 =?utf-8?B?a0VJWjNVaVdNblhwWllXdUdCQ0UyTmY3T01heFRxRmFkNm1DL2szalhUeFpQ?=
 =?utf-8?B?Z2lSbzNOTkJDQS9td2FySVJPUzlHN3IyRzZtbkpPQ3g5QjE0Q245UDNDWkVt?=
 =?utf-8?B?c1NFam84em9nTWJVZEV4TnNML2NDQXVRdU5LN2lONGtKc0x2WDVjRXI0WkZP?=
 =?utf-8?B?L1RBeWYrb1dXMDY4czFRRHZKQ0xCY2pPVjVPNWpHQXR3VXBIaW45aXlJdGxH?=
 =?utf-8?Q?xX1wCSP1ZjLgKiFk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <29D5258E3B65C340AE0B2471ABA12375@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: IxjcwvVUzAGASwrDiNxPkAZC0epKShHWkYusARU/Ply2eVbdX2g7shp/lJEosmS9b+k9oTbFYy9+dKqnpVi6oTuEufBjALWxR5o2c9AhBojd1Yv4z3mus3Pb2bhxep7lPjD2QaE0qvL40sBQRNbuUEktnY/q0PY3JEx7pLwSdOXjUXEJ+cSkkqaryTxiZ6xa3YFyBmxiDdt9iIvAedf4BXuhzOuzcKM+tHkYyxxFW0EWBXSR3pRYblX4E62IHIE42PVO49gDx3NCyaZP0nqe8oom6yDObKDlAgH4NNKTtTjKIV/qHYhcucnOHyRuBmzDBueESqiuegCdM1BF7ZZj+A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1389716c-ce15-4e3f-66d5-08dea0b15b2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 20:54:33.1268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xIhlFfEmNt3DQ0MWpdEaoEOybHe8K/8+SLl4i+0bJlumxHVoBJY2p3o9HqPkCCCejN4YpkXOQ72p5+ofkVJaKQM863B+ECZqqLAb2jqI5No=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9669
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

T24gV2VkLCAyMDI2LTAzLTE4IGF0IDEzOjE0ICswNTMwLCBIaW1hbCBQcmFzYWQgR2hpbWlyYXkg
d3JvdGU6DQo+IEhhcmR3YXJlIGFjY2VzcyBjb3VudGVyIHNsb3RzIGFyZSBmaW5pdGUgcmVzb3Vy
Y2VzLiBBZGQgYSBoZWxwZXINCj4gdG8gZGV0ZXJtaW5lIHdoZXRoZXIgYSBWTUEgaXMgZWxpZ2li
bGUgZm9yIGFjY2VzcyBjb3VudGluZywgc28NCj4gY2FsbGVycyBjYW4gYXZvaWQgd2FzdGluZyBz
bG90cyBvbiBCT3MgdGhhdCBjYW5ub3QgYmVuZWZpdCBmcm9tDQo+IG1pZ3JhdGlvbiBoaW50cy4N
Cj4gDQo+IEEgVk1BIGlzIGVsaWdpYmxlIGlmOg0KPiDCoCAtIFRoZSBkZXZpY2UgaXMgYSBkaXNj
cmV0ZSBHUFUgKGFjY2VzcyBjb3VudGVycyB1bnVzZWQgb24gaUdQVSkNCj4gwqAgLSBJdCBpcyBh
IENQVSBhZGRyZXNzIG1pcnJvciAoU1ZNKSBWTUEsIHdoaWNoIGlzIGFsd2F5cyBtaWdyYXRhYmxl
DQo+IMKgIC0gVGhlIGJhY2tpbmcgQk8gaGFzIG1vcmUgdGhhbiBvbmUgcGxhY2VtZW50IHJlZ2lv
bg0KPiDCoCAtIFRoZSBCTyBpcyBub3QgYWxyZWFkeSByZXNpZGVudCBpbiBWUkFNIGxvY2FsIHRv
IHRoZSB0cmlnZ2VyaW5nDQo+IHRpbGUNCj4gDQo+IFVzZXJwdHIgYW5kIG51bGwgVk1BcyBhcmUg
ZXhjbHVkZWQgYXMgdGhleSBoYXZlIG5vIGFzc29jaWF0ZWQgQk8uDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBIaW1hbCBQcmFzYWQgR2hpbWlyYXkNCj4gPGhpbWFsLnByYXNhZC5naGltaXJheUBpbnRl
bC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jIHwgNDENCj4gKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gwqBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfdm0uaCB8wqAgMyArKysNCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMo
KykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+IGluZGV4IDY1OTUwNGVjNWExMy4uN2Y5NzlkNjIwNWY0
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiBAQCAtNDM1Niw2ICs0MzU2LDQ3IEBAIHZvaWQgeGVf
dm1fc25hcHNob3RfZnJlZShzdHJ1Y3QgeGVfdm1fc25hcHNob3QNCj4gKnNuYXApDQo+IMKgwqDC
oMKgwqDCoMKgwqBrdmZyZWUoc25hcCk7DQo+IMKgfQ0KPiDCoA0KPiArLyoqDQo+ICsgKiB4ZV92
bWFfc3VwcG9ydHNfYWNjZXNzX2N0ciAtIERldGVybWluZSBpZiBWTUEgaXMgZWxpZ2libGUgZm9y
DQo+IGFjY2VzcyBjb3VudGluZw0KPiArICogQHhlOiBQb2ludGVyIHRvIHRoZSBYZSBkZXZpY2Ug
c3RydWN0dXJlDQo+ICsgKiBAdm1hOiBUaGUgVk1BDQo+ICsgKiBAdGlsZTogVGlsZSB3aXRoIHdo
aWNoIFZNQSBib3VuZCBpcyBhc3NvY2lhdGVkIHRvDQo+ICsgKg0KPiArICogTm90ZSwgYWNjZXNz
IGNvdW50ZXJzIGFyZSBub3QgdXNlZCB1bmxlc3MgZW5hYmxlZCBpbiBMUkMuDQo+ICsgKi8NCj4g
K2Jvb2wgeGVfdm1hX3N1cHBvcnRzX2FjY2Vzc19jdHIoc3RydWN0IHhlX2RldmljZSAqeGUsDQo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHN0cnVjdCB4ZV92bWEgKnZtYSwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX3RpbGUgKnRpbGUp
DQo+ICt7DQo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9ibyAqYm8gPSB4ZV92bWFfYm8odm1h
KTsNCj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHR0bV9yZXNvdXJjZSAqcmVzOw0KPiArDQo+ICvC
oMKgwqDCoMKgwqDCoGlmICghSVNfREdGWCh4ZSkpDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqByZXR1cm4gZmFsc2U7DQo+ICsNCj4gK8KgwqDCoMKgwqDCoMKgaWYgKHhlX3ZtYV9p
c19jcHVfYWRkcl9taXJyb3Iodm1hKSkNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHJldHVybiB0cnVlOw0KPiArDQo+ICvCoMKgwqDCoMKgwqDCoC8qIHVzZXJwdHIgb3IgdXNpbmcg
bnVsbCB2bWEqLw0KPiArwqDCoMKgwqDCoMKgwqBpZiAoIWJvKQ0KDQpHb29kIHRvIGFzc2VydCB0
aGUgYm8gbG9jayBoZXJlLi4uDQoNClRoYW5rcywNClN0dWFydA0KDQo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZmFsc2U7DQo+ICsNCj4gK8KgwqDCoMKgwqDCoMKgcmVz
ID0gYm8tPnR0bS5yZXNvdXJjZTsNCj4gK8KgwqDCoMKgwqDCoMKgLyogaWYgZm9yIHNvbWUgcmVh
c29uIG5vIGJhY2tpbmcgc3RvcmUsIG5vdGhpbmcgdG8gbWlncmF0ZSAqLw0KPiArwqDCoMKgwqDC
oMKgwqBpZiAoIXJlcykNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBm
YWxzZTsNCj4gKw0KPiArwqDCoMKgwqDCoMKgwqAvKiBjYW5ub3QgbWlncmF0ZSBpZiBzaW5nbGUg
cGxhY2VtZW50ICovDQo+ICvCoMKgwqDCoMKgwqDCoGlmIChiby0+cGxhY2VtZW50Lm51bV9wbGFj
ZW1lbnQgPD0gMSkNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBmYWxz
ZTsNCj4gKw0KPiArwqDCoMKgwqDCoMKgwqAvKiBjYW5ub3QgbWlncmF0ZSB0byBvdXJzZWxmIChh
bHJlYWR5IGluIFZSQU0gbG9jYWwgdG8gQHRpbGUpDQo+ICovDQo+ICvCoMKgwqDCoMKgwqDCoGlm
ICghdGlsZS0+bWVtLnZyYW0gfHwgcmVzLT5tZW1fdHlwZSA9PSB0aWxlLT5tZW0udnJhbS0NCj4g
PnBsYWNlbWVudCkNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBmYWxz
ZTsNCj4gKw0KPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gdHJ1ZTsNCj4gK30NCj4gKw0KPiDCoC8q
Kg0KPiDCoCAqIHhlX3ZtYV9uZWVkX3ZyYW1fZm9yX2F0b21pYyAtIENoZWNrIGlmIFZNQSBuZWVk
cyBWUkFNIG1pZ3JhdGlvbg0KPiBmb3IgYXRvbWljIG9wZXJhdGlvbnMNCj4gwqAgKiBAeGU6IFBv
aW50ZXIgdG8gdGhlIFhlIGRldmljZSBzdHJ1Y3R1cmUNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV92bS5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmgNCj4gaW5kZXgg
MTI3Y2VjZmNiODBiLi4xNzg0NGVmMGYwYjcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV92bS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5oDQo+IEBAIC0x
NzgsNiArMTc4LDkgQEAgc3RydWN0IHhlX3ZtYSAqeGVfdm1fZmluZF92bWFfYnlfYWRkcihzdHJ1
Y3QNCj4geGVfdm0gKnZtLCB1NjQgcGFnZV9hZGRyKTsNCj4gwqANCj4gwqBpbnQgeGVfdm1hX25l
ZWRfdnJhbV9mb3JfYXRvbWljKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgeGVfdm1hDQo+
ICp2bWEsIGJvb2wgaXNfYXRvbWljKTsNCj4gwqANCj4gK2Jvb2wgeGVfdm1hX3N1cHBvcnRzX2Fj
Y2Vzc19jdHIoc3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdCB4ZV92bWENCj4gKnZtYSwNCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgc3RydWN0IHhlX3RpbGUgKnRpbGUpOw0KPiArDQo+IMKgaW50IHhlX3ZtX2FsbG9jX21h
ZHZpc2Vfdm1hKHN0cnVjdCB4ZV92bSAqdm0sIHVpbnQ2NF90IGFkZHIsDQo+IHVpbnQ2NF90IHNp
emUpOw0KPiDCoA0KPiDCoGludCB4ZV92bV9hbGxvY19jcHVfYWRkcl9taXJyb3Jfdm1hKHN0cnVj
dCB4ZV92bSAqdm0sIHVpbnQ2NF90IGFkZHIsDQo+IHVpbnQ2NF90IHNpemUpOw0KDQo=
