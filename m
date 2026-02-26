Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFA2FD8FE4
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 17:59:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D62410E9B9;
	Thu, 26 Feb 2026 17:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DUNFICli";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B39B10E9B9
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 17:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772128740; x=1803664740;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7GAQ7zw8FJLgS+QflB63WlEOJ2UIzeaJpOlctNIdYTs=;
 b=DUNFICli5PzXjow0dbfIxizuI7AqHTOlnxiZGEP7A2grTf6FxKqNlzE0
 g1mTobgUVWUdXBly0uf27YoaK4qnSMvAoyzvPwy0rHfczurWVylX6ALeG
 03rZSCoEaor+AEjYpzm+5TyVc/i/o2W2ljb5L4r4K7KUQCGmxDdTifRiy
 R8nbJyi42KDqdx6lMmlrkJy/3t7u8Zf9h/YSSX8IrrVreg3+81pNklaGm
 006kSCcjd3pxbyM2D+XHuD2jfTY+keVNlFyEaE+TBcrbkNl7Fj/gb9ZmS
 5q/iENjcYJ99vihcRDYwBTmMsL1t7ptd5RA72LvDeZnpycUGIiJjlY7gn g==;
X-CSE-ConnectionGUID: J+0iUrZ5Sri8pMCHe+3L0g==
X-CSE-MsgGUID: I1W8UwlBR02iv0uBsBYCWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="84292194"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="84292194"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 09:59:00 -0800
X-CSE-ConnectionGUID: Ehvc9dnUSFqnmAzLDb7SDQ==
X-CSE-MsgGUID: bPbHvbrvQyqiHV8wyEomNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="221639509"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 09:59:00 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 09:58:59 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 09:58:59 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 09:58:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z98OXhOy5V029dVk6Pzg07SX0GuETf/Z1g+lhyNHluqDRxr64ewOAILDKu8qss1lW0xI+6FnfwUsEqw5GmXfMbZQdSkMZ6JyF7qQ+MFJXLa1njvx7uGBrHrmNxiTpQ/iV4Jvh+8knNPkurYkRI0I4uMrUshL4TimdDROjugdd3EzDgrV8uasMfp79QufQ3e7mEkBH9OYYi+3g33LmYzYp9TIR9q4AUXfeRQqgJ0y+0SQ1OibbHlCo2nbEzjxbRIaaxs2atX1TNXapj4d4wSRxscZNA7sI5jpbs2Bms6kNcNj4Tea6q9N3VuX0Ew1Gob9sOYoEsB7QJJOQqJvhSHkyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GAQ7zw8FJLgS+QflB63WlEOJ2UIzeaJpOlctNIdYTs=;
 b=UiqS4MH9Ic8gLUZK075vo986sORkDFdeFuPc+tYCm+PD0LKoXZZ055gCYD1iLRt4jo7csBWQaDjSq6cVLGfmSrZLH6nkqmr7MjItsq4NrOMEhRhhtd5aRcBRl57jiSn6eI0pFOTvOwwte/2J9JC+g2AteCOcy1OjSU0bQXI6A78jtcXj2FYlTPItP3bp/vRi7Zd6uIqMde4XnnsiXAWu5EnLj3S/9AaLcIbFVUl8xVoLmx2MGqbuH7XsW5tAS6EhTGutSYrUkbOr86KFU01PAJKDMqepj85E61mpILaPRls7f8xtxr56P719x4wfqr4n5KdIt9R4eApc3fwSVVcYzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 17:58:55 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765%5]) with mapi id 15.20.9654.013; Thu, 26 Feb 2026
 17:58:53 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Yadav, 
 Arvind" <arvind.yadav@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Mishra, Pallavi"
 <pallavi.mishra@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 1/9] drm/xe/uapi: Add UAPI support for purgeable buffer
 objects
Thread-Topic: [PATCH v5 1/9] drm/xe/uapi: Add UAPI support for purgeable
 buffer objects
Thread-Index: AQHcm2r1KndNBXSZI0aGSDAcs34Vi7WVXD6A
Date: Thu, 26 Feb 2026 17:58:53 +0000
Message-ID: <90f98e02221b626eb0eb6fb5fb7986d1c10d1c52.camel@intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
 <20260211152644.1661165-2-arvind.yadav@intel.com>
In-Reply-To: <20260211152644.1661165-2-arvind.yadav@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DM4PR11MB6189:EE_
x-ms-office365-filtering-correlation-id: 40cdd19c-ca2a-441c-3560-08de7560b459
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: czxkTsHtmaIDaMU1Wd+f3mG5wENhBdCXm+1s/+FQJ3Q2GNPEmsBZ8s/Pg1H+TgGDJF70N2krD1f4x4s90fEExx5pABB2ogyq7weiikYKoTqigwzIoq721PAzvPqsexn3u7Yj6jHCNy/95RKcev7R5+792XsE6As9oBMz6ltrO/jIPBCVXCdeFrAIFRQ0zgZOqR7PnCoRNNYRzqCFo38WKGNIhr4BAk8KqvxbIZLydhK+Vi7fLLmTtBo3xXnfmqeofURRxBw6eSv9tbBjf6TqeQVbg0RZXgMg+ghc0qQvfbDdnHjXaki3qeaW16RXyl5zCcuD/Sfu1b3F8Omvsia5wpXTvYAIM2h5000CoUkj/vKf6nqol6kuIgPYe6qiQB3gShyqgchUt8If1dYpjA9JBqGiiphdHh64mI1iLEf9M/qD2jjQuYbb6sfx3mOCqxpL65H2HKJNGWJKuBXHQ04JFXL8w1ljDiWXoyM/eZOfqohpoK2+gmM/hIWCoMe3nX6R+e1o1xZ7uJq7agfV2Sm8lTgYcte1mNQ2Cfx1GJOnJo5bl26iHnOCKINzx346KvQcvfR/1NgAGzcBVfCRWltv9lHQnrH0JdhOhzpYtkQrIgv2oSw+8+zo9AN1rBZn4d5XNDdMud+wC8qTt+hI5cgq8F/qdGVbA8klQkwg9kQmVUGg0l7m1xnaITTTonyqWXOeOm0Aa+d4+poSKBKa4PMqeOUk9W5/FY/QTcEq1fvTHL+Dk4VMDPQpeLa7Cpes8dk6q10oxuCMMdH5SLbS52iHtQgazi3gNAy31a8W9X09Jl4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnpHRkNnVVlxSm5Cc1ArMTdmSkROY2xrOTZMUmRZVkNrREs3TFJmSmtsU3dy?=
 =?utf-8?B?V3dhUHBYemliZUhDUURUWTNJYnVkNDMrTDVSd05XZExvMngwYTRnK0NtN0JQ?=
 =?utf-8?B?V1RiY2VBeUpBK2FMdTFKQmt3QThqV1ZvbUNqZzFXSWhVSVhoNEtWYllQdFZO?=
 =?utf-8?B?WUllWmgrVEN0Sk9kbUd1eDF1UWZ5UDVCWlJnUDlVb3ZmMTBrMWNKQUlINXpz?=
 =?utf-8?B?K1VnUGpnaHMwaUQrUkNwVzVJUUNjUnNMTm9HSklkaG5TSm4raS84VXprWUJt?=
 =?utf-8?B?Q0s2WDN1K3A4WW02a1FUNlFQN291MktmcUU3TEpzRTZzbVZXSmhhQm1oMUtw?=
 =?utf-8?B?Zk1vUjFZWEsyWHBta2NNU3BBczVkeUpDUlhFWnNFc291ZUlnUkg1ZGhkTUk1?=
 =?utf-8?B?c1p6YU45VEdDdTd6d0htenE0RW1mTWt4UFJhRmJ6N21pTHNLb0ZFTE1sZnV5?=
 =?utf-8?B?L2gyMWkzalVuMkM2UXN4b3l3dWkzWmIzVjhUL3BmRFJ6bjIxQ2sxcXZtbUVP?=
 =?utf-8?B?amRxcTVSdDcvckR6RXVMamRZcEZvZ3lmUVdQTVVQUVZDYjROclRjRWdmZUFz?=
 =?utf-8?B?TlhFTWM3dlQxNCt6TGxFajljMVpMYmF5QkdJMGZpbXpLT2F6NHRSbTllTDk2?=
 =?utf-8?B?cVN0U3RiWG1OWEdMeDcvekpEbUc3K3hZbnRveTJ1c3hpaUtLU1VuaUcvUEhw?=
 =?utf-8?B?YTc4RnVXWFQyZkVzWWsrT2xlVWNzMjczcEFreEpqS21jN3BHR3cvd01xOHpH?=
 =?utf-8?B?NFM0dDJkclRvRC80RzE3dWh5eVRXSXlxcFB1bENJWUg1WjNoN0pCYVFHQ29v?=
 =?utf-8?B?QWxnNDdlVjB1MG4vNmRneWRPVlU1L3U3Ty95WnJCZFRNczRoSVJPeCtnUHR1?=
 =?utf-8?B?L2hseTVxS3F3c0JGU2w1VjR0OTlqUTVuMkZVUmZGblBoRE9pVTk0c1VYQ1U4?=
 =?utf-8?B?UkpTV0FpV3NRcVNQSXVENXh2V2E4QTdlRzBic1Q3R2NKandkN3dQdDE0Q3Rj?=
 =?utf-8?B?NSttVDFtSjNSSU05d3ZXUDdvOFYzQ2UwSDhMWjZQc01FTUpDRkZhZ1l3U0Z3?=
 =?utf-8?B?UkwvTzhGRFBZODBEc2QvNW9pWmo4R1ZSQ2VBcDFxWWVHZ3hDWjJETkovNkdj?=
 =?utf-8?B?QjliZzVjeVNTMVdZQW1ydEU5YytyOXF4d0UvQjhQUkZLeS9ldCtPUGgxTlJj?=
 =?utf-8?B?NTVrdDdkbnQ5Z2R5a2JlMldyOTJqRGl2SE85REdIOHI2TEFlaThIcTBHdi93?=
 =?utf-8?B?U3djSUVuWFgxdVZBdmNvTGZLUGoxTnQzV2pPZEZrSld5SitpTFN4OUZySkpO?=
 =?utf-8?B?N09PS1hrMWxHckxpekFKeWYzbmRGODluYTc3by9Kc0FuUUxnRWEwQkE3Z2Jw?=
 =?utf-8?B?QnhFZmVkNWJBMjhGTjN6SUhwQXppOURDMUhKaXVQdkVuQzMyOE5DcG9zVVpo?=
 =?utf-8?B?T0hrYTJSQ0dyRjcySEZvVGpkZW9Wa2FKOGd6alRhd1QrUFBBbTNMZG9pQzF4?=
 =?utf-8?B?RWIvUnZMWDNvbG16VlFDb1Y4YXI4cVNCQXVtUVNCY0tQUXNkNURkVEcvdm5a?=
 =?utf-8?B?N2dRNnZqS2dVa1BORTkzVmFydytlWUZYd1psazcxMjE3LzR6ZWtCT2RUUTk0?=
 =?utf-8?B?Y2pQZlNvMWhpekp4WWN5VlFodXF1N0xNZFRReU5nTE5RQ0RydlNFb2k4cnlV?=
 =?utf-8?B?dlFvd1RUWSt0MER1R2RBb1c3dFhuSk5GdEVzNXRzUGV3eW82dzNPZ2VxaTRL?=
 =?utf-8?B?U0dpd3VRK0pxMmJLaWRYb3FhQ25PSUlBSGQ0dEE4U3N4Z2hJODllQXQ4bXBr?=
 =?utf-8?B?eEpXUW5jNWgzVXVRZ2lpOGFQYnRZcTc1MTM5QzErSk91c3YwdlZWWG5tMy9s?=
 =?utf-8?B?WWZ6ZUw2c0V0QkpIc3RwTGpNcm1rVW1BUEx6L0FPMXpVN1hIRTh5enZncnhO?=
 =?utf-8?B?L25pRWFrWEZTMEh1ck9uUlVHbmNlcEM1NzZ3SXRzOUlsYTNaY01ETVR1UERE?=
 =?utf-8?B?VlNVNHZpQVZtNkVQS1dhdXNpMUI5L21uS2U5ZFNXOGZBbjZ4VnJmcDRKR0Mr?=
 =?utf-8?B?bkc0YUVXc1ZNcVQvZ1NVVU5CS2tCNkNDNVBkWkl2cUVWSjJQMlBhUjhGRWNG?=
 =?utf-8?B?c2xZVm9XU29tL1FZbmZ0TWtIZm02UnBhZksxbGxpY0taSFcwU3I2dGlFMEVr?=
 =?utf-8?B?S082OHlMVFF5cVVqUm5GanEzVVJhb3lRalp4azA4WUF2MmtHbUUzNnJhVlFa?=
 =?utf-8?B?U2dvZXZYSjBNczFvY0JPZVQrWEZSRUdUYjE2SEcwV0FCS0VlQzMzSWtJWHJj?=
 =?utf-8?B?My9sYmh0WHc1R1lyTnpJbUgwTDV1SVZrSitZbmZFSHJ3TkIvejFxdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA2670563C17F044B03134344248DE04@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40cdd19c-ca2a-441c-3560-08de7560b459
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 17:58:53.6119 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N0skuwVrxWlJSUpKjScJHz5CKPS2GgqColG53+KrhkP18dVG6ddR0gXkghKS7IyLEbZKXi/tFlOSptZzONPB3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6189
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

T24gV2VkLCAyMDI2LTAyLTExIGF0IDIwOjU2ICswNTMwLCBBcnZpbmQgWWFkYXYgd3JvdGU6DQo+
IEZyb206IEhpbWFsIFByYXNhZCBHaGltaXJheSA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVs
LmNvbT4NCj4gDQo+IEV4dGVuZCB0aGUgRFJNX1hFX01BRFZJU0UgaW9jdGwgdG8gc3VwcG9ydCBw
dXJnZWFibGUgYnVmZmVyIG9iamVjdA0KPiBtYW5hZ2VtZW50IGJ5IGFkZGluZyBEUk1fWEVfVk1B
X0FUVFJfUFVSR0VBQkxFX1NUQVRFIGF0dHJpYnV0ZSB0eXBlLg0KPiANCj4gVGhpcyBhbGxvd3Mg
dXNlcnNwYWNlIGFwcGxpY2F0aW9ucyB0byBwcm92aWRlIG1lbW9yeSB1c2FnZSBoaW50cyB0bw0K
PiB0aGUga2VybmVsIGZvciBiZXR0ZXIgbWVtb3J5IG1hbmFnZW1lbnQgdW5kZXIgcHJlc3N1cmU6
DQo+IA0KPiAtIFdJTExORUVEOiBCdWZmZXIgaXMgbmVlZGVkIGFuZCBzaG91bGQgbm90IGJlIHB1
cmdlZC4gSWYgdGhlIEJPIHdhcw0KPiDCoCBwcmV2aW91c2x5IHB1cmdlZCwgcmV0YWluZWQgZmll
bGQgcmV0dXJucyAwIGluZGljYXRpbmcgYmFja2luZw0KPiBzdG9yZQ0KPiDCoCB3YXMgbG9zdCAo
b25jZSBwdXJnZWQsIGFsd2F5cyBwdXJnZWQgc2VtYW50aWNzIG1hdGNoaW5nIGk5MTUpLg0KPiAN
Cj4gLSBET05UTkVFRDogQnVmZmVyIGlzIG5vdCBjdXJyZW50bHkgbmVlZGVkIGFuZCBtYXkgYmUg
cHVyZ2VkIGJ5IHRoZQ0KPiDCoCBrZXJuZWwgdW5kZXIgbWVtb3J5IHByZXNzdXJlIHRvIGZyZWUg
cmVzb3VyY2VzLiBPbmx5IGFwcGxpZXMgdG8NCj4gwqAgbm9uLXNoYXJlZCBCT3MuDQo+IA0KPiBU
aGUgaW1wbGVtZW50YXRpb24gaW5jbHVkZXMgYSAncmV0YWluZWQnIG91dHB1dCBmaWVsZCAobWF0
Y2hpbmcNCj4gaTkxNSdzDQo+IGRybV9pOTE1X2dlbV9tYWR2aXNlLnJldGFpbmVkKSB0aGF0IGlu
ZGljYXRlcyB3aGV0aGVyIHRoZSBCTydzDQo+IGJhY2tpbmcNCj4gc3RvcmUgc3RpbGwgZXhpc3Rz
ICgxKSBvciBoYXMgYmVlbiBwdXJnZWQgKDApLg0KPiANCj4gdjI6DQo+IMKgIC0gQWRkIFBVUkdF
RCBzdGF0ZSBmb3IgcmVhZC1vbmx5IHN0YXR1cywgY2hhbmdlIGlvY3RsIHRvIERSTV9JT1dSLA0K
PiDCoMKgwqAgYWRkIHJldGFpbmVkIGZpZWxkIGZvciBpOTE1IGNvbXBhdGliaWxpdHkNCj4gDQo+
IHYzOg0KPiDCoCAtIFVBUEkgcnVsZSBzaG91bGQgbm90IGJlIGNoYW5nZWQgKE1hdHRoZXcgQnJv
c3QpDQo+IMKgIC0gTWFrZSAncmV0YWluZWQnIGEgdXNlcnB0ciAoTWF0dGhldyBCcm9zdCkNCj4g
DQo+IHY0Og0KPiDCoCAtIFlvdSBjYW5ub3QgbWFrZSB0aGlzIHBhcnQgb2YgdGhlIHVuaW9uIChw
dXJnZV9zdGF0ZV92YWwpIGxhcmdlcg0KPiDCoMKgwqAgdGhhbiB0aGUgZXhpc3RpbmcgdW5pb24g
KDE2IGJ5dGVzKS4gU28ganVzdCBkcm9wIHRoZSAnX191NjQNCj4gcmVzZXJ2ZWQnDQo+IMKgwqDC
oCBmaWVsZC4gKE1hdHQpDQo+IA0KPiB2NToNCj4gwqAgLSBVcGRhdGUgVUFQSSBkb2N1bWVudGF0
aW9uIHRvIGNsYXJpZnkgcmV0YWluZWQgbXVzdCBiZSBpbml0aWFsaXplZA0KPiDCoMKgwqAgdG8g
MChUaG9tYXMpDQo+IA0KPiBDYzogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5j
b20+DQo+IENjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRl
bC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEhpbWFsIFByYXNhZCBHaGltaXJheQ0KPiA8aGltYWwu
cHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQXJ2aW5kIFlhZGF2
IDxhcnZpbmQueWFkYXZAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBpbmNsdWRlL3VhcGkvZHJtL3hl
X2RybS5oIHwgNDQNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+
IMKgMSBmaWxlIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiBp
bmRleCAwNzdlNjZhNjgyZTIuLjNlMmYxNDVlN2Y4ZiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS91
YXBpL2RybS94ZV9kcm0uaA0KPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+IEBA
IC0yMDk5LDYgKzIwOTksNyBAQCBzdHJ1Y3QgZHJtX3hlX21hZHZpc2Ugew0KPiDCoCNkZWZpbmUg
RFJNX1hFX01FTV9SQU5HRV9BVFRSX1BSRUZFUlJFRF9MT0MJMA0KPiDCoCNkZWZpbmUgRFJNX1hF
X01FTV9SQU5HRV9BVFRSX0FUT01JQwkJMQ0KPiDCoCNkZWZpbmUgRFJNX1hFX01FTV9SQU5HRV9B
VFRSX1BBVAkJMg0KPiArI2RlZmluZSBEUk1fWEVfVk1BX0FUVFJfUFVSR0VBQkxFX1NUQVRFCQkz
DQo+IMKgCS8qKiBAdHlwZTogdHlwZSBvZiBhdHRyaWJ1dGUgKi8NCj4gwqAJX191MzIgdHlwZTsN
Cj4gwqANCj4gQEAgLTIxODksNiArMjE5MCw0OSBAQCBzdHJ1Y3QgZHJtX3hlX21hZHZpc2Ugew0K
PiDCoAkJCS8qKiBAcGF0X2luZGV4LnJlc2VydmVkOiBSZXNlcnZlZCAqLw0KPiDCoAkJCV9fdTY0
IHJlc2VydmVkOw0KPiDCoAkJfSBwYXRfaW5kZXg7DQo+ICsNCj4gKwkJLyoqDQo+ICsJCSAqIEBw
dXJnZV9zdGF0ZV92YWw6IFB1cmdlYWJsZSBzdGF0ZSBjb25maWd1cmF0aW9uDQo+ICsJCSAqDQo+
ICsJCSAqIFVzZWQgd2hlbiBAdHlwZSA9PQ0KPiBEUk1fWEVfVk1BX0FUVFJfUFVSR0VBQkxFX1NU
QVRFLg0KPiArCQkgKg0KPiArCQkgKiBDb25maWd1cmVzIHRoZSBwdXJnZWFibGUgc3RhdGUgb2Yg
YnVmZmVyIG9iamVjdHMNCj4gaW4gdGhlIHNwZWNpZmllZA0KPiArCQkgKiB2aXJ0dWFsIGFkZHJl
c3MgcmFuZ2UuIFRoaXMgYWxsb3dzIGFwcGxpY2F0aW9ucw0KPiB0byBoaW50IHRvIHRoZSBrZXJu
ZWwNCj4gKwkJICogYWJvdXQgYm8ncyB1c2FnZSBwYXR0ZXJucyBmb3IgYmV0dGVyIG1lbW9yeQ0K
PiBtYW5hZ2VtZW50Lg0KPiArCQkgKg0KPiArCQkgKiBTdXBwb3J0ZWQgdmFsdWVzIGZvciBAcHVy
Z2Vfc3RhdGVfdmFsLnZhbDoNCj4gKwkJICrCoCAtIERSTV9YRV9WTUFfUFVSR0VBQkxFX1NUQVRF
X1dJTExORUVEICgwKTogTWFya3MNCj4gQk8gYXMgbmVlZGVkLg0KPiArCQkgKsKgwqDCoCBJZiBC
TyB3YXMgcHVyZ2VkLCByZXR1cm5zIHJldGFpbmVkPTAgKGJhY2tpbmcNCj4gc3RvcmUgbG9zdCku
DQo+ICsJCSAqDQo+ICsJCSAqwqAgLSBEUk1fWEVfVk1BX1BVUkdFQUJMRV9TVEFURV9ET05UTkVF
RCAoMSk6IEhpbnRzDQo+IHRoYXQgQk8gaXMgbm90DQo+ICsJCSAqwqDCoMKgIGN1cnJlbnRseSBu
ZWVkZWQuIEtlcm5lbCBtYXkgcHVyZ2UgaXQgdW5kZXINCj4gbWVtb3J5IHByZXNzdXJlLg0KPiAr
CQkgKsKgwqDCoCBPbmx5IGFwcGxpZXMgdG8gbm9uLXNoYXJlZCBCT3MuIFJldHVybnMNCj4gcmV0
YWluZWQ9MSBpZiBub3QgcHVyZ2VkLg0KPiArCQkgKi8NCj4gKwkJc3RydWN0IHsNCj4gKyNkZWZp
bmUgRFJNX1hFX1ZNQV9QVVJHRUFCTEVfU1RBVEVfV0lMTE5FRUQJMA0KPiArI2RlZmluZSBEUk1f
WEVfVk1BX1BVUkdFQUJMRV9TVEFURV9ET05UTkVFRAkxDQo+ICsJCQkvKiogQHB1cmdlX3N0YXRl
X3ZhbC52YWw6IHZhbHVlIGZvcg0KPiBEUk1fWEVfVk1BX0FUVFJfUFVSR0VBQkxFX1NUQVRFICov
DQo+ICsJCQlfX3UzMiB2YWw7DQo+ICsNCj4gKwkJCS8qIEBwdXJnZV9zdGF0ZV92YWwucGFkICov
DQo+ICsJCQlfX3UzMiBwYWQ7DQo+ICsJCQkvKioNCj4gKwkJCSAqIEBwdXJnZV9zdGF0ZV92YWwu
cmV0YWluZWQ6IFBvaW50ZXIgdG8NCj4gb3V0cHV0IGZpZWxkIGZvciBiYWNraW5nDQo+ICsJCQkg
KiBzdG9yZSBzdGF0dXMuDQo+ICsJCQkgKg0KPiArCQkJICogVXNlcnNwYWNlIG11c3QgaW5pdGlh
bGl6ZSB0aGlzIGZpZWxkIHRvIDANCj4gYmVmb3JlIHRoZQ0KPiArCQkJICogaW9jdGwuIEtlcm5l
bCB3cml0ZXMgdG8gaXQgYWZ0ZXIgdGhlDQo+IG9wZXJhdGlvbjoNCj4gKwkJCSAqIC0gMSBpZiBi
YWNraW5nIHN0b3JlIGV4aXN0cyAobm90IHB1cmdlZCkNCj4gKwkJCSAqIC0gMCBpZiBiYWNraW5n
IHN0b3JlIHdhcyBwdXJnZWQNCj4gKwkJCSAqDQo+ICsJCQkgKiBJZiB1c2Vyc3BhY2UgZmFpbHMg
dG8gaW5pdGlhbGl6ZSB0byAwLA0KPiBpb2N0bCByZXR1cm5zIC1FSU5WQUwuDQo+ICsJCQkgKiBU
aGlzIGVuc3VyZXMgYSBzYWZlIGRlZmF1bHQgKDAgPSBhc3N1bWUNCj4gcHVyZ2VkKSBpZiBrZXJu
ZWwNCj4gKwkJCSAqIGNhbm5vdCB3cml0ZSB0aGUgcmVzdWx0Lg0KPiArCQkJICoNCj4gKwkJCSAq
IFNpbWlsYXIgdG8gaTkxNSdzDQo+IGRybV9pOTE1X2dlbV9tYWR2aXNlLnJldGFpbmVkIGZpZWxk
Lg0KPiArCQkJICovDQo+ICsJCQlfX3U2NCByZXRhaW5lZDsNCg0Kd2h5IGRvIHlvdSBuZWVkIGEg
dTMyIHBhZCBhbmQgYSB1NjQ/IHdoeSBub3QgdXNlIHBhZCBhbmQgZHJvcCB0aGUgbGFzdA0KdTY0
Pw0KDQo+ICsJCX0gcHVyZ2Vfc3RhdGVfdmFsOw0KPiDCoAl9Ow0KDQpUaGlzIGlzIG1pc3Npbmcg
YSBuZXcgZmxhZyBsaWtlDQpEUk1fWEVfUVVFUllfQ09ORklHX0ZMQUdfSEFTX05PX0NPTVBSRVNT
SU9OX0hJTlQgdG8gdGVsbCBVTURzIGlmDQpydW5uaW5nIFhlIEtNRCBoYXMgc3VwcG9ydCBmb3Ig
cHVyZ2VhYmxlIG1hZHZpc2UuDQoNCj4gwqANCj4gwqAJLyoqIEByZXNlcnZlZDogUmVzZXJ2ZWQg
Ki8NCg==
