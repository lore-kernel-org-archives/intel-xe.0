Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8044F606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 04:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ekZUS4S0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E27A10E1B4;
	Tue, 27 Oct 2026 04:13:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD0410E1B4
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 04:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793074412; x=1824610412;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rlgPdIrmTUwqD0hq0Ol2yp3HR7PAWtRbkefyRznmAFg=;
 b=ekZUS4S0yWB8CAUGnRlHDwPxhmbBx+rc5yyG1DBI2Q3bfNHc92Yf08nu
 v7h7xHSRMn3A49aaCJQ52sxejkg/oXHKvwNJKPgK080KV7OEEBtIEP29D
 ZFbsce6G4rd6q81AOIfQoi67hVaHzSP1722tgYwkYCYYKWfTDsAxDPAzJ
 7dCpJHshRSySJ17Pt03Z8MuXDWt7Xiz3iGtzwdKKaq/KS4Nnbq5n/CzOe
 tsVnWpFJSZGFUixYZhkhlTWKvZtLJBInQazS1i6IApxBaGN8SIJkpeI0E
 hjbTsRI+kAvAniQeOC+a15UY2kAJzbA4NK0tynclTekxtEGj8rh5pL7hc A==;
X-CSE-ConnectionGUID: a6UrWjbaSM2EfkTKgLV8tw==
X-CSE-MsgGUID: Ox/MI31/RQOztJcZ4RCBew==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1766589"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1766589"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 21:13:29 -0700
X-CSE-ConnectionGUID: wC72RkcuQ6GmFIrDcHGRtA==
X-CSE-MsgGUID: FWe8jdjrRz+0LAwXB5p4hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4785511"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 21:13:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 21:13:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 21:13:27 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 21:13:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pc3U9nNvaGnueWneV6KBf78cRvbN0iFA5fvg45A5cYNpfLxiJLh/v+1CJcgdRjxGxl8PKwJZbqsjAFZIVMgc7LI2gviFbwEhVDd9dz83kAYHN+GabSxCmIoAUFEKWFw4e5ktaLU67QRdrkGoDUabTfzEEIhQl10rOB5k8taAjK3CFX66phxIBpYFUlB/AzXSuOegLuBJcZ1b6KIPEwOXg1KdNd744/Z0jyfmvZma2g5XRH+NQA3q903ylJRrnPgZSeikUwAtvviiE8YDyIvd9PO6birprpAhlMZ5bPd8+V9uFGn+9yhHJVKmqqpfLSu1QpeXg0b36twX42Ftg8b6ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlgPdIrmTUwqD0hq0Ol2yp3HR7PAWtRbkefyRznmAFg=;
 b=pCkssBNfPi92OyavXJQIikVU29HPpeKdwPIQSdVrZNqSk1S5002958TD0/YjNCYSE8+iRhCT8hkVre5MyHLywgGqqveGS3alpN6+GmSthJIY0YXJGHYMeLSjxeXvRXUKKp1f2LTdNXvO0oStXOBnBqwF+JLH7/ngco5XWu0z73JOfGl2Mn4u2D3xB88ijebD63ivdIpsT1nZrdibEHMLsws5UqV3vdfUTTKItSDWpLmIbedUzDy7Rt6WrXImwR2wipdsV0Lbet4jmuOViYT1qZ+glNs+7pAouM5Sz1hTMwq8lO/j0EZVBT1XVjzZxcSCT59LVC5f9tnBAAOKUSfIUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5039.namprd11.prod.outlook.com (2603:10b6:a03:2da::22)
 by SJ0PR11MB4991.namprd11.prod.outlook.com (2603:10b6:a03:2df::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 04:13:25 +0000
Received: from SJ0PR11MB5039.namprd11.prod.outlook.com
 ([fe80::d9f2:247d:ca72:fc1e]) by SJ0PR11MB5039.namprd11.prod.outlook.com
 ([fe80::d9f2:247d:ca72:fc1e%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 04:13:24 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [v2,1/2] drm/xe/bo: Add xe_bo_addr_iter.
Thread-Topic: [v2,1/2] drm/xe/bo: Add xe_bo_addr_iter.
Thread-Index: AQHdaaRAylrOTjw0AUdV7G37aa1ZFrcQrxRA
Date: Tue, 27 Oct 2026 04:13:24 +0000
Message-ID: <SJ0PR11MB5039A2297A745041F33B3539BA602@SJ0PR11MB5039.namprd11.prod.outlook.com>
References: <20261023114616.735366-1-dev@lankhorst.se>
In-Reply-To: <20261023114616.735366-1-dev@lankhorst.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5039:EE_|SJ0PR11MB4991:EE_
x-ms-office365-filtering-correlation-id: 9926afbe-4f8b-4735-f9cd-08df33e0a554
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|6133799003|22082099003|261026121527099003|10067099003|56012099006|11063799006|261009223027099003|261021123027099003|261021121427099003|38070700021;
x-microsoft-antispam-message-info: 1biQFr+2LXUevo7wu40dG44oK2vRt25uaUPabFlrFFJQBRKoMjDEe/eQi/ZsvIxHg1eeulXqPJDmnyYUDKb8FzsQv4OYgJvMzxf9If1TdqXXEtyy8ucd2HjJFXSmZKC+kXHFV/NnQR7yculLsvJNdpeXzz/Sxc4dWKp9saN3y4v/Sz3hpelqR9DfcJ3c1wAEfplnmPqVzJN7tdHsU+X0KmhElhJGoQKThoZMR5FxDTi4hu4G1DNZRTfmEluYa6Vqx/tC8ZUvaY91HhS0rjtstdvggOo/TnEWR2YanitGz76JWRqmDhlVq0fVZl4XCVSvgErMx+Y27rxH1dkOIfpW97B4nbMsG0XXSNsnbfFco8Q9fMb8uYYPZHpYEy/M1JU6e2OJiuxaotV8AP5o2yxiK/OFLWLPtaBwXmWK2SIGZJg5CeFaFqZVfLyoBV19DxDceKUtTJEjoLr8HP9ntnU6OHnZ/cYw/ZZJBo8ZvSmELKLZ9I7X2xD2A/J7s8rN0KqB/s2b/s1WZm80+0cJ4comtyX8T+c54U0awMyo8xvBntj67FivzG7WqTWqgn5n9na+JoCCETSwor1C9QGuLMDlwtgLKJyaihqwwAJwlL9xdAN0oWSwDgSPI0wNMVwRo02w+uhfd5qOZF3BA0inic7a1BO7OYEieM+sI/cOeZxT2oZJb/OUBWx5/YOlX8VIUPOQ1FXqS0S+ehlSY4Qn/NgBpOIPW5+UVuGROtJsHSh3kco=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(6133799003)(22082099003)(261026121527099003)(10067099003)(56012099006)(11063799006)(261009223027099003)(261021123027099003)(261021121427099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGFpNkRSZklkMHpTSzNaTTZxKzB4RWFFZVAxYWU2c1BBcUVpc2ZvVWhEQ0RG?=
 =?utf-8?B?clVheGViSmpvaURoT2tBSjFqSmVvNEp0TEovV3R6VFhsdFZpU2VlRFdsRlQw?=
 =?utf-8?B?dzl1ZC9TSGc2RG8zRHlJQjl5cXpGWUlxandWbUhCdHNQeEFoMVczS0h5SEZK?=
 =?utf-8?B?djBwNmhSQlZlN3FEK2YwM2daam1kS2Q2MytVTndxMHNmU0NTU0d3Tk1GUk5h?=
 =?utf-8?B?bnc5ZGgwNWR5U2JGV0RjUVFGSmRDTXFhZ29FWkRiN3VpYWNWQXNnK1VQVU1H?=
 =?utf-8?B?MFB0L3JhaENWL0pMSjRDVXhIZjBtWFRraTdEbElrQzhqYjRINXR4MVlOMTc4?=
 =?utf-8?B?enRWMi9XVHJJazcyTnVPNUVTZGY1aEp6TlpESkRETUZDSFY1ZDNjQXlCNWFE?=
 =?utf-8?B?b1paY1BXMWFXZVNMbnB5UUVLWXZPRzVUbXJkL1BwaUMxdE1TVkhOckoxK3NK?=
 =?utf-8?B?TWtnRnRUS2luUU9hMGRFUjBTRTA3MlJrSGFWWlVyMzN1aDFRMXlBZ0pVRDRN?=
 =?utf-8?B?c2R1anhrNTZVK1F6R28rT0swV0E1T1dpSlJ1QjhKK2dNYzEzbmc0V0Rvai9F?=
 =?utf-8?B?NWkvWkduZ3cwbU4wU2lERTFoYkhjU0RxYm5teDJJaHB5ZjRWVWxLa2s3S2lQ?=
 =?utf-8?B?dVBFdFNoVkRGUXJaL2pITWZEakE3ZWJMTTB5Y3ZEdnJ2VnJMdVJpZ2dOejlP?=
 =?utf-8?B?dFlIeFJ1OXFKTWlGQ1FSMmdSb1Iwb2wyWDBCV2wzaFBNZExFZ0IralVQUnVw?=
 =?utf-8?B?S3l4a1NXY3pqOENwb25jNGZoUis3NXpSTkRLV3lsR0tSNEFjaXRRTlpCK3ZI?=
 =?utf-8?B?enVCZk9rT1Jac1A0c1kvR1hvZ1RheXFvVjhVZGRsVkdOM2o4VGtSQjljeFNu?=
 =?utf-8?B?MHVtZlN0OHU3M29NY04vUnMwTmVoTlFhY0QzNWJLamhNMU56c3VuRkI3Slgy?=
 =?utf-8?B?TTNiY242RUdQZDFPdzlwVUM4em5JR1V4RDQvQWRsZzk5ZEc3NHZValFFRHZW?=
 =?utf-8?B?dUxKalNBdkpicjhRelVNS3NIV1B5eUM5ZFBTSXkwckJ3TXJ2aVZuUVoybUpD?=
 =?utf-8?B?amE5NzQ3RXVmNXh0dTdnUHRMV21nR3hLdC9BU3NKRmxrWVhSYklBSGRVbzdP?=
 =?utf-8?B?RCtyMUhFYmNMU2huekFQa3ZzaXYxZ1RPejBSREx4ejRubDc0MElXaElBVWhz?=
 =?utf-8?B?NnoyM0tNb2x3bENZbXJ6engxNHNOZzdZUWsxcnFlS2tFVGplSmFiVnFrNzQ5?=
 =?utf-8?B?U0xseG5HOEdHUE8vbHplSllQclJzY1NCdlk0VElZVlV4RzQwSzhtR1ExbjhY?=
 =?utf-8?B?REFOblp3NlZCdTZKMG9KZWlHZVlMZGdKNDUxSVcvanlzcWNXRjA0L3dhb3Rt?=
 =?utf-8?B?QkZMRk1MTUN0VXdkVFBJQ3hDTmlaejZWekV1OWYxeWtsZW9Ub1QzVllNMW1Z?=
 =?utf-8?B?RGI1UW00Wmo4bG1SOGFhQmc4RUt4MVdFVDF3VHJyWHlVL0ErUEFWcWk4Q21J?=
 =?utf-8?B?K0dPeWpLN2RyaG1HdFVhQzdOZ0lPRUdBdzdaOGJ4V2RzMWg5Y2RwOG5xTFV4?=
 =?utf-8?B?dmQ3cTJMb3kxL3dzd2Jmd1E3UEdDemlBQkFJV2JadnpRM1cyTURSUkpYM1dI?=
 =?utf-8?B?OFhQbDBEcXRjK3ZVaXZqT3NXNzBiLzJWekxZQk5DMDUvNkFYc0cyeUlBS3Q2?=
 =?utf-8?B?RTZzeXZOUWxVYklhN2VNL2VWVmNyNTkwbStBWVpEUlhCS2Y2Y2cvN2FMQk0z?=
 =?utf-8?B?dXBqTjlJTkZiUjN6TUEyYVh4Rk04UXlTY3hibklaZkdYZmE3ZjNWSnlOby9D?=
 =?utf-8?B?VVZYdi9sL1d6N1Y4dWZHZjNneWZ5UmtpczFiK3hkWW9EY21PbGRyZG9Demht?=
 =?utf-8?B?VStCRE9LZVlzVnpRc0RMUlFSd0JJUHhKMnBqaVdTY0FNc2lkbHV5bndBN1pP?=
 =?utf-8?B?TWVka0JXcUpFZzk5OHZZckFYN09BcG5RQitEb1hSWmtBaEZUcUtYQUxFaEsv?=
 =?utf-8?B?MmpYMnNWbVpGVDNIcXFCWngybDRxVm4zWGhFT2gzLzc3K3Z4TDBjamNhQkZU?=
 =?utf-8?B?TzdtdGtya0p6N1Z1QUlhUEZGMmJGb3BDeUZ2T0owbEZUeWN6RHliWktLZ0ww?=
 =?utf-8?B?MS9INDVrM3ZGWnN3cnNSVGpILzdLM0JTdlo1UDA0U1gyVjJzcSswTmhoNU10?=
 =?utf-8?B?NW10YmdVSk9rVHlpNVlEblgyazZDR3JUYjBTblJXV2QwODAxa0Y0R01zWDQ5?=
 =?utf-8?B?Slo3TWg3dHV6VW1od0RzSUpJK2N0dmhyZ3NZYzllNEsxQ1Boc0RLQWxJTXJ4?=
 =?utf-8?B?WGVwai80TDhtNXU4MXhMYU1sZ3o0SkJ0bXdsZHpZVkhPRXN2UEtrZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: oeTmbDnkT17MFN8sG7Af0QorYnV9y8PhidgUXHBoTeD42D51Y7YCSwscJtdkKacMO+zzFJCTWH9HECkqZtzUdHWr0bI/XQDmTITT3Z7x3uuZx8S+loFX+2nALB+/IbQyKZKOQT8mX/WZB4TjPZxXJQxj6pq+HtSKwVZt7DfQdlzaY/o3zrOXqyzQiX2E0V+8R7r+8jtW8Cy3wfLTHtqjL2OCt6HkkkCLrlHNHdK1C6bTTwrahq+VM+ZwVqDnmx4dpgMkX4S1KZFIwE7w9VADZYnRRKLmU332tOXJJyXGqNxEkfKaXALKgdIhmNM9pJCOBfMyB+kEudksx/qrI2Z3pA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9926afbe-4f8b-4735-f9cd-08df33e0a554
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2026 04:13:24.8917 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6QL8GwGlKoQiyiPu9ggggWXSsJ4ffAQ7VGeCzX4d5xJW5pHcxnMrZ71pjNPe28XmEZrPsddIKTulHHlrKoM7CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4991
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hYXJ0ZW4gTGFua2hvcnN0
IDxkZXZAbGFua2hvcnN0LnNlPg0KPiBTZW50OiBGcmlkYXksIE9jdG9iZXIgMjMsIDIwMjYgNTox
NiBQTQ0KPiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBNYWFydGVu
IExhbmtob3JzdCA8ZGV2QGxhbmtob3JzdC5zZT4NCj4gU3ViamVjdDogW3YyLDEvMl0gZHJtL3hl
L2JvOiBBZGQgeGVfYm9fYWRkcl9pdGVyLg0KPiANCj4gRm9yIGRpc3BsYXkgd2UgaXRlcmF0ZSBv
ZnRlbiBvdmVyIHRoZSBwaW5uZWQgVlJBTS9zeXN0ZW0gbWVtb3J5IEJPLg0KPiBBZGQgc29tZSBj
b2RlIHRvIHNwZWVkIHVwIERQVC9HR1RUIHByb2dyYW1taW5nLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogTWFhcnRlbiBMYW5raG9yc3QgPGRldkBsYW5raG9yc3Quc2U+DQo+IC0tLQ0KPiBDaGFuZ2Vz
IHNpbmNlIHYxOg0KPiAtIEFkZCBkb2N1bWVudGF0aW9uLg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9iby5jIHwgNjQgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5oIHwgIDMgKysNCj4gIDIgZmlsZXMgY2hh
bmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8u
YyBpbmRleA0KPiAxMmU1MjNjNjFjMWYzLi5iNTk3MjE4MWE4ZWJkIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Ym8uYw0KPiBAQCAtMzQzNCwzNyArMzQzNCw2MyBAQCBib29sIHhlX2JvX2lzX3hlX2JvKHN0cnVj
dCB0dG1fYnVmZmVyX29iamVjdA0KPiAqYm8pDQo+ICAJcmV0dXJuIGZhbHNlOw0KPiAgfQ0KPiAN
Cj4gLS8qDQo+IC0gKiBSZXNvbHZlIGEgQk8gYWRkcmVzcy4gVGhlcmUgaXMgbm8gYXNzZXJ0IHRv
IGNoZWNrIGlmIHRoZSBwcm9wZXIgbG9jayBpcyBoZWxkDQo+IC0gKiBzbyBpdCBzaG91bGQgb25s
eSBiZSB1c2VkIGluIGNhc2VzIHdoZXJlIGl0IGlzIG5vdCBmYXRhbCB0byBnZXQgdGhlIHdyb25n
DQo+IC0gKiBhZGRyZXNzLCBzdWNoIGFzIHByaW50aW5nIGRlYnVnIGluZm9ybWF0aW9uLCBidXQg
bm90IGluIGNhc2VzIHdoZXJlIG1lbW9yeQ0KPiBpcw0KPiAtICogd3JpdHRlbiBiYXNlZCBvbiB0
aGlzIHJlc3VsdC4NCj4gKy8qKg0KPiArICogeGVfYm9fYWRkcl9pdGVyX2ZpcnN0IC0gSXRlcmF0
ZSBvdmVyIGEgYm8NCj4gKyAqIEBibzogVGhlIEJPDQo+ICsgKiBAY3VyOiBQb2ludGVyIHRvIGEg
JnhlX3Jlc19jdXJzb3IgZm9yIGl0ZXJhdGlvbg0KPiArICogQG9mZnNldDogT2Zmc2V0IGludG8g
Qk8uDQo+ICsgKiBAc2l6ZTogU2l6ZSBvZiBpdGVyYXRpb24uDQo+ICsgKg0KPiArICogSW5pdGlh
bGl6ZXMgQGN1ciBmb3IgaXRlcmF0aW9uIG92ZXIgYWxsIEdQVSBhZGRyZXNzZXMgaW4gdGhlIHJh
bmdlDQo+ICsgKiBbQG9mZnNldC4uLkBvZmZzZXQrQHNpemUpLg0KPiArICoNCj4gKyAqIFRoaXMg
aXMgdXNlZnVsIGZvciBnZXR0aW5nIHRoZSBHUFUgYWRkcmVzcyBmb3IgYSByYW5nZSBvZiBwYWdl
cywNCj4gKyAqIHJhdGhlciB0aGFuIGNhbGxpbmcgeGVfYm9fYWRkciBzZXBhcmF0ZWx5IGZvciBl
YWNoIHBhZ2UuDQo+ICAgKi8NCj4gLWRtYV9hZGRyX3QgX194ZV9ib19hZGRyKHN0cnVjdCB4ZV9i
byAqYm8sIHU2NCBvZmZzZXQsIHNpemVfdCBwYWdlX3NpemUpDQo+ICt2b2lkIHhlX2JvX2FkZHJf
aXRlcl9maXJzdChzdHJ1Y3QgeGVfYm8gKmJvLCBzdHJ1Y3QgeGVfcmVzX2N1cnNvciAqY3VyLA0K
PiArdTY0IG9mZnNldCwgdTY0IHNpemUpDQo+ICB7DQo+ICAJc3RydWN0IHhlX2RldmljZSAqeGUg
PSB4ZV9ib19kZXZpY2UoYm8pOw0KPiAtCXN0cnVjdCB4ZV9yZXNfY3Vyc29yIGN1cjsNCj4gLQl1
NjQgcGFnZTsNCj4gLQ0KPiAtCXhlX2Fzc2VydCh4ZSwgcGFnZV9zaXplIDw9IFBBR0VfU0laRSk7
DQo+IC0JcGFnZSA9IG9mZnNldCA+PiBQQUdFX1NISUZUOw0KPiAtCW9mZnNldCAmPSAoUEFHRV9T
SVpFIC0gMSk7DQo+IA0KPiAgCWlmICgheGVfYm9faXNfdnJhbShibykgJiYgIXhlX2JvX2lzX3N0
b2xlbihibykpIHsNCj4gIAkJeGVfYXNzZXJ0KHhlLCBiby0+dHRtLnR0bSk7DQo+IA0KPiAtCQl4
ZV9yZXNfZmlyc3Rfc2coeGVfYm9fc2coYm8pLCBwYWdlIDw8IFBBR0VfU0hJRlQsDQo+IC0JCQkJ
cGFnZV9zaXplLCAmY3VyKTsNCj4gLQkJcmV0dXJuIHhlX3Jlc19kbWEoJmN1cikgKyBvZmZzZXQ7
DQo+ICsJCXhlX3Jlc19maXJzdF9zZyh4ZV9ib19zZyhibyksIG9mZnNldCwgc2l6ZSwgY3VyKTsN
Cj4gIAl9IGVsc2Ugew0KPiAtCQlzdHJ1Y3QgeGVfcmVzX2N1cnNvciBjdXI7DQo+ICsJCXhlX3Jl
c19maXJzdChiby0+dHRtLnJlc291cmNlLCBvZmZzZXQsIHNpemUsIGN1cik7DQo+IA0KQ2FuIHRo
aXMgdHJpZ2dlciBYRV9XQVJOX09OKHN0YXJ0ICsgc2l6ZSA+IHJlcy0+c2l6ZSkgaW4geGVfcmVz
X2ZpcnN0KCk/DQoNClRoZSBvbGQgY29kZSB1c2VkIChwYWdlIDw8IFBBR0VfU0hJRlQpIGFzIHRo
ZSBzdGFydCwgc28gdGhlIHJhbmdlIHdhcw0KYWx3YXlzIHBhZ2UgYWxpZ25lZCBhbmQgc3RheWVk
IGluc2lkZSB0aGUgQk8uIE5vdyB0aGUgcmF3IG9mZnNldCBpcyB1c2VkLg0KSWYgb2Zmc2V0IGlz
IG5vdCBwYWdlIGFsaWduZWQsIG9mZnNldCArIHBhZ2Vfc2l6ZSBjYW4gZ28gcGFzdCB0aGUgQk8g
c2l6ZQ0KDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpBcnVuIFIgTXVydGh5DQotLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KDQo+IC0JCXhlX3Jlc19maXJzdChiby0+dHRtLnJlc291cmNlLCBwYWdlIDw8IFBB
R0VfU0hJRlQsDQo+IC0JCQkgICAgIHBhZ2Vfc2l6ZSwgJmN1cik7DQo+IC0JCXJldHVybiBjdXIu
c3RhcnQgKyBvZmZzZXQgKyB2cmFtX3JlZ2lvbl9ncHVfb2Zmc2V0KGJvLQ0KPiA+dHRtLnJlc291
cmNlKTsNCj4gKwkJeGVfYXNzZXJ0KHhlLCAhY3VyLT5kbWFfYWRkcik7DQo+ICsJCWN1ci0+ZG1h
X3N0YXJ0ID0gdnJhbV9yZWdpb25fZ3B1X29mZnNldChiby0+dHRtLnJlc291cmNlKTsNCj4gIAl9
DQo+ICB9DQo+IA0KPiArLyoqDQo+ICsgKiB4ZV9ib19hZGRyX2l0ZXJfYWRkciAtIEdldCB0aGUg
Qk8ncyBHUFUgYWRkcmVzcyBhdCBjdXJyZW50IGN1cnNvci4NCj4gKyAqIEBjdXI6IFBvaW50ZXIg
dG8gYSAmeGVfcmVzX2N1cnNvciBpbml0aWFsaXplZCBieQ0KPiAreGVfYm9fYWRkcl9pdGVyX2Zp
cnN0KCkNCj4gKyAqDQo+ICsgKiBSZXR1cm5zOiBhIDY0LWJpdHMgRE1BIGFkZHJlc3MgZm9yIHVz
YWdlIG9uIHRoZSBkZXZpY2UuDQo+ICsgKi8NCj4gK2RtYV9hZGRyX3QgeGVfYm9fYWRkcl9pdGVy
X2FkZHIoc3RydWN0IHhlX3Jlc19jdXJzb3IgKmN1cikgew0KPiArCWlmIChjdXItPm1lbV90eXBl
ID09IFhFX1BMX1RUKQ0KPiArCQlyZXR1cm4geGVfcmVzX2RtYShjdXIpOw0KPiArDQo+ICsJcmV0
dXJuIGN1ci0+c3RhcnQgKyBjdXItPmRtYV9zdGFydDsNCj4gK30NCj4gKw0KPiArLyoNCj4gKyAq
IFJlc29sdmUgYSBCTyBhZGRyZXNzLiBUaGVyZSBpcyBubyBhc3NlcnQgdG8gY2hlY2sgaWYgdGhl
IHByb3BlciBsb2NrDQo+ICtpcyBoZWxkDQo+ICsgKiBzbyBpdCBzaG91bGQgb25seSBiZSB1c2Vk
IGluIGNhc2VzIHdoZXJlIGl0IGlzIG5vdCBmYXRhbCB0byBnZXQgdGhlDQo+ICt3cm9uZw0KPiAr
ICogYWRkcmVzcywgc3VjaCBhcyBwcmludGluZyBkZWJ1ZyBpbmZvcm1hdGlvbiwgYnV0IG5vdCBp
biBjYXNlcyB3aGVyZQ0KPiArbWVtb3J5IGlzDQo+ICsgKiB3cml0dGVuIGJhc2VkIG9uIHRoaXMg
cmVzdWx0Lg0KPiArICovDQo+ICtkbWFfYWRkcl90IF9feGVfYm9fYWRkcihzdHJ1Y3QgeGVfYm8g
KmJvLCB1NjQgb2Zmc2V0LCBzaXplX3QgcGFnZV9zaXplKQ0KPiArew0KPiArCXN0cnVjdCB4ZV9y
ZXNfY3Vyc29yIGN1cjsNCj4gKw0KPiArCXhlX2JvX2FkZHJfaXRlcl9maXJzdChibywgJmN1ciwg
b2Zmc2V0LCBwYWdlX3NpemUpOw0KPiArCXJldHVybiB4ZV9ib19hZGRyX2l0ZXJfYWRkcigmY3Vy
KTsNCj4gK30NCj4gKw0KPiAgZG1hX2FkZHJfdCB4ZV9ib19hZGRyKHN0cnVjdCB4ZV9ibyAqYm8s
IHU2NCBvZmZzZXQsIHNpemVfdCBwYWdlX3NpemUpICB7DQo+ICAJaWYgKCFSRUFEX09OQ0UoYm8t
PnR0bS5waW5fY291bnQpKQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Jv
LmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uaCBpbmRleA0KPiA3N2IzYTAyZTliOGViLi4y
ODZmNTIyMjViYzc5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uaA0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uaA0KPiBAQCAtMTEzLDYgKzExMyw3IEBA
IGVudW0geGVfbWFkdl9wdXJnZWFibGVfc3RhdGUgeyAgfTsNCj4gDQo+ICBzdHJ1Y3Qgc2dfdGFi
bGU7DQo+ICtzdHJ1Y3QgeGVfcmVzX2N1cnNvcjsNCj4gDQo+ICBzdHJ1Y3QgeGVfYm8gKnhlX2Jv
X2FsbG9jKHZvaWQpOw0KPiAgdm9pZCB4ZV9ib19mcmVlKHN0cnVjdCB4ZV9ibyAqYm8pOw0KPiBA
QCAtMzc1LDYgKzM3Niw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB4ZV9ib191bnBpbl9tYXBfbm9f
dm0oc3RydWN0DQo+IHhlX2JvICpibykgIH0NCj4gDQo+ICBib29sIHhlX2JvX2lzX3hlX2JvKHN0
cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pOw0KPiArdm9pZCB4ZV9ib19hZGRyX2l0ZXJfZmly
c3Qoc3RydWN0IHhlX2JvICpibywgc3RydWN0IHhlX3Jlc19jdXJzb3IgKmN1ciwNCj4gK3U2NCBv
ZmZzZXQsIHU2NCBzaXplKTsgZG1hX2FkZHJfdCB4ZV9ib19hZGRyX2l0ZXJfYWRkcihzdHJ1Y3QN
Cj4gK3hlX3Jlc19jdXJzb3IgKmN1cik7DQo+ICBkbWFfYWRkcl90IF9feGVfYm9fYWRkcihzdHJ1
Y3QgeGVfYm8gKmJvLCB1NjQgb2Zmc2V0LCBzaXplX3QgcGFnZV9zaXplKTsNCj4gZG1hX2FkZHJf
dCB4ZV9ib19hZGRyKHN0cnVjdCB4ZV9ibyAqYm8sIHU2NCBvZmZzZXQsIHNpemVfdCBwYWdlX3Np
emUpOw0KPiANCg==
