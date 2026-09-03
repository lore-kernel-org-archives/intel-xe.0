Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE79C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 12:53:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E094210F593;
	Thu,  3 Sep 2026 12:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SfTcPVR7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC5210F593
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 12:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788440003; x=1819976003;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NU1WoSo5YxtS6CAdAbSxUTNRZGWUGvPNn5JrxB36fXU=;
 b=SfTcPVR76zq2Xg6zzRQVzNwZ+v+2Q/xjzpIb5vUlA0vwYjbHCw/OjSq2
 3Ez1Hk2CW1rjSAKUoxIL7PHVtHRIbVXXuS3zVUu8WiLVFz62rypPAahCb
 VdoGhU6wXW+wYnmL1FMtJ4AMy9TOcRjw0vk+jVF/XHIdeHExGlFIvGviu
 I37I9n2IXfylV/mSBXdqcwmDdGwbxrNGi0OP9/sa6c8SYEiwG24YPHsgQ
 yUOvnLKeVzZ0ZZs3pyjtN90qjtXCaBQ7pBb48uvZ1a4XDM5ksC0VwsVO1
 ZO9e3K2yLatiWOyAb1M8LhqJBgd0pKTdAtEAnXK33b92JmQVHQW5vOIcx w==;
X-CSE-ConnectionGUID: 5gD3dFnnS7+p9rPt5WCR5Q==
X-CSE-MsgGUID: BK9/0qCZQH+YkrdU511WAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88972034"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="88972034"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 05:53:22 -0700
X-CSE-ConnectionGUID: Y+l78YUiQ5CPRs2I+cuMHw==
X-CSE-MsgGUID: PqtWoNTERAWvqCrd8VnIOg==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 05:53:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 05:53:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 05:53:21 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 05:53:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvf4AY12/KceC9xtwvYzqlMfU3ehqjUZXWfjs7D9YhcV6zWyZ4B+TEHAWC/4P0+YdNLVhfKaMF381s/3YEESGqrtH4AzGyEu96LVWc2BiPTgcSxUNO2CawQVlcPoVF14cWHG5pvnNpLs8o2ROwTrxBFF650WGobPzBMkfLjuVQ04UOWxflUTMpkuWQ9EBN61UUXuv9Y3F6IePY8f+mr4CvxAnGBsvtIyXACxXLXRrj65BqODChSwC5UyTmdHWs+lHO3M3KZtdE9YjsgIm+lQRExt8oNkt3iimuFLrhdeQSjvrVdzFyyL4fsjffKTtuxUNeSlIO4o0aJ70vEcXN/F7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NU1WoSo5YxtS6CAdAbSxUTNRZGWUGvPNn5JrxB36fXU=;
 b=tjilJYxiwcspEQHFafPrYgzJts7hjqMO4fcTuoTnCxduWuhCG0DvDyu7qAu9PiY4nvQlC8i8LoZgwY5tGl94mUgPyJlKW/bRodwOmAUHj9K0r+ure4/7ZRwNXgHMUm66q5kLrLrW+N/kj01x9aF/bOh0ORocbF0hch5e/Erpj+V9bvo6Os3/CeJxW2sPY54Yp1YXNQ1UDZYoZRZNC+gd1ufDyrQoydx0C8dwb1GwAdYbRRZD7dX6MDc57xaCiDDaZhS137xHDAOh6q0fcDbd7J1niob0LtnvBBIlZTxQwbl4y5cCbyDxPgjMZf8ipzYNVs0EiH2ZQmARMtf6xC+pOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5242.namprd11.prod.outlook.com (2603:10b6:408:133::18)
 by IA1PR11MB7269.namprd11.prod.outlook.com (2603:10b6:208:42b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 12:53:06 +0000
Received: from BN9PR11MB5242.namprd11.prod.outlook.com
 ([fe80::5657:45bf:d335:24d5]) by BN9PR11MB5242.namprd11.prod.outlook.com
 ([fe80::5657:45bf:d335:24d5%5]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 12:53:06 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Jadav, Raag"
 <raag.jadav@intel.com>, "Koppuravuri, Ravi Kishore"
 <ravi.kishore.koppuravuri@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: RE: [PATCH 1/2] drm/xe/xe_pci_error: Wait for pcode init post SBR
Thread-Topic: [PATCH 1/2] drm/xe/xe_pci_error: Wait for pcode init post SBR
Thread-Index: AQHdNuDKx64l4fZffUaKGTCFh3f20Lazeo3wgAShZ4CABLsToA==
Date: Thu, 3 Sep 2026 12:53:06 +0000
Message-ID: <BN9PR11MB52420B5A86A55D7E8505895495B62@BN9PR11MB5242.namprd11.prod.outlook.com>
References: <20260828113104.319843-4-riana.tauro@intel.com>
 <20260828113104.319843-5-riana.tauro@intel.com>
 <BN9PR11MB524232BB439BB10F87C48D2395AC2@BN9PR11MB5242.namprd11.prod.outlook.com>
 <0bad9269-ddae-4ab9-9823-9fef7363323a@linux.intel.com>
In-Reply-To: <0bad9269-ddae-4ab9-9823-9fef7363323a@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5242:EE_|IA1PR11MB7269:EE_
x-ms-office365-filtering-correlation-id: 01dc95ff-cca2-4737-f031-08df09ba4c68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|38070700021|6133799003|10067099003|4143699003|11063799006|18002099003|22082099003|56012099006;
x-microsoft-antispam-message-info: pi4G6BKj6N/85E/T06kUHwk1+Rd2QB1tdbsie9zjNve7TS4MlqDzSJRYcJDl2mm1Mm2n/GH5WpeT4V+hmEfaeXZrJrSR0b5209onZghCl9Hg3p1YNtYDM/XDKxmbexg2kvyPzyl/B6oPbn0zkrc0XeFinR6HnkPlng034biIWfoMnAe3DDgP7T2rqXhQIpmMzixFqBEqS65DPEVaSZXhPJ6amwqTMhh3fx50+OmLz2kocCy2gyZ+zuik2px/WidKmNC5sjnGcbK3AEoWY7QG1wsNgDSJhfqf+L8BW3qdFv5rz5bVdczO4eKIFtv7mnyeCli0TdoRUeq2/6CuLSap4WnoaxV4QuqqB6LaPTqMqZDhFifqKdLF86RaL5oIGDL5CnBHK3hbR3dv44H3eKV2Fy0L8mIt/ZzdLSjHaD7TeGvmtERfwqxqPBWBnk4IDlrq1jVz/gIRKFFzkDdoHsg3wFFF7zFDZJtGC8EwvKOhgM3H6gD7heuWWvnyxn6HG5zejpK+w2zwbrlvy4X+5HoNDmEQTdOD35YmeVXQN41fN4i8lGtYjgRhPzwFkQF2sfAf6mxHw33fOXFXz969BUEacxIYgHqB3vdIn3cBx3TU5mQnhNHHjahRzVgdlL6rOuU32IFuxBZBKrfnCOKUeIyX/DSRowT88xfvZ2Jx15uwh1IqE4LQSLbYI5hdyDfvjWPIadvJrDgUOYMZWSiknrMyyiPM+A1lEz6CeFALNoXSCbU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5242.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(6133799003)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dW1rY3haK2lackpqMGxLRDEwb0dSQUwralI1Uk1tdzdLZjNtMGZacWxWNlB0?=
 =?utf-8?B?eHAvMHd6d21SNHphNkF5R3ZhSURKK1JJN2ZSTUhsc1Z3a1ZCbVNNRE5QaEJL?=
 =?utf-8?B?cXVZcWtpakdsblNUeDB1L05TYndYZWl3eUdYR0NhZnIrMkxOZzhEbEN1blhH?=
 =?utf-8?B?Zm1ZWXdxMmI4SktmQUJ0N3pYUW1kUXJnOFJBWElzZEhrNGlUTHpSWEdKNFJP?=
 =?utf-8?B?ZTVNckJucEU5Z2xpZzdXaDRsYzRQS0hpeXg2Q0dGOUJSd3c0WFoxV2V5VnVq?=
 =?utf-8?B?NmZhbk1USVpOcVNoL084aWtrbVJNVGZkUHJqOVBxMHZxRUtEaFVWQmNLRXpJ?=
 =?utf-8?B?RDh4eTQzemp2Z1Z0eStyYS90UGRvekVFWDRDczZiOHFjVVlZOWRnY21YNzdY?=
 =?utf-8?B?RVU1MFZDdHNyRDZlSENlVDVDcUs2NTNGR2VMUzVEWXRmZlRGeXJlYXQ4M1Vs?=
 =?utf-8?B?QXR0NUc3ZVpidmVFek9tU1hYT01UVENPMGJkSnRmM0xnekhPcFZZQS9GaUM2?=
 =?utf-8?B?M2dGeWNXdm9GVWZkV3lTT3kveSt0Snoyc2dHUHRFVEVzV2xXWmh6OThBVVEr?=
 =?utf-8?B?TG9RZTkzWGFFK3gwNFNUSDY5K3hnQWNXN0hxVXA4UmpmMFF1Uy9DWUViWTgx?=
 =?utf-8?B?RkNwbHlBNXpPZkoxSEhwWnBWWGVucEFxdjVVd0NaSzRBOG1YdGVPL2lNUDdM?=
 =?utf-8?B?VGlERm40elZKU2pRZTFoblBuTi9FMlhzTjl0VmZUMiszcTgvVy9ucVhqWmI5?=
 =?utf-8?B?ZFcwWkxKZGFtZCtiV05hSDVxRnhlMUtQVXc3eEpqQlZIQ1V2ZHovZjRpWWYy?=
 =?utf-8?B?QVcxQnptRjkvNHNHR1lzejgvNGpFTlJRY0xhOFZ5SnBkTTN5YU1QMzhGR2lZ?=
 =?utf-8?B?VDJLWWNmQUt2N0RRTHNITmUxcVFrVDhFYVhzNUVVa0VvaWJtNkVtUTM4SWlU?=
 =?utf-8?B?NDNpcWhmS2l4L1BVVmdsSUhlS1grSVZEVTdWWGRQd0tMWWk1TWRmakE1TjlI?=
 =?utf-8?B?aEkwUUtEWjJISFVrdW0vbVFLbzN1TDlaaTNhaS9kTG41N0VwQ0d1a2NhVTF5?=
 =?utf-8?B?WitoeUU0ZzNXZVpudEEwaExEalcvOUV4dnJlYU9vVXpwWisxNkdleHIrNkhJ?=
 =?utf-8?B?UVRvQThuWVlWeldjbWtvUWFaUnhoaTNLYm9NWGJCNitvaUdLWmh2Ty9zaFlL?=
 =?utf-8?B?UFZ6d0tnejdWVnZITHBJa3ZTdnloTVoxemdsSmJ1YWdLL3doRXFJcUV6WFQz?=
 =?utf-8?B?czhyZGdSeDA5WnBZaFlSUU5yb0RmOFJTdStqSXZsTzAyMFFsN0QvcU54VUFU?=
 =?utf-8?B?cUJzZXV3MjBFYk5MNCszSHY0N1VIWm42Zmx6SC8raUhwVUgvMVM4dkk0aTJs?=
 =?utf-8?B?RS9xQ3JkMFhqa0RZSnJGck14V080M0lKSnFlOElRbTNrKy9WZDJlM2d5YlZ0?=
 =?utf-8?B?ME13OFZtMzRmUm1YTkU4TU9NTFE1RWZ3ckV0RjJIdG1CT1FweEg2N01saXNv?=
 =?utf-8?B?RERJeGdvZHZBUE1jMHVyKzEwTytwbUhxaTFKNGpCSXVzKy9DYnQzcWJGSWp4?=
 =?utf-8?B?MkhzQTVWNFpzc3JlQkFoMGwvUXd6MFlsTjd2ZlNmbjU0YUwvNzlObEFjUUhq?=
 =?utf-8?B?Mk5NQnRYSFNJbzlCaGl4SnFYYndzSWpQdzBTZS9PN1R0QWRaakxlSGkvNzZU?=
 =?utf-8?B?WmZGV1psaXNLQ05MRVRiVVVmR1YwaElWbWFhZzEwTXZ4LzlPNHFaUktuQXZH?=
 =?utf-8?B?NXd5MUkwekJFdnV4S0FhdUNSS3R4MzVsK1NDWFBvTnA0OStWa0p5RzYwU0hP?=
 =?utf-8?B?eTc1WnRWdkJobjJhNUNiTzBmWmgyUnpZWnIvblVyNGs4cGMyWTNkQ2ZvY3ds?=
 =?utf-8?B?cjU4VFdXMll4THIzMWpTcDA2bWxCS0FWZzdJc0JBdWFmQVg5U3FRUW1KaFhZ?=
 =?utf-8?B?ekE4OHY4ODJGNXppcGFRT1dmL2g5Y3ZkbjNzaWFEV3B2cVN5RTI2WFo3Q1Rw?=
 =?utf-8?B?RGREcjFnSDVwWGM4Zm13RmJvVmIyaXV0UjV3NE9WYWJlcjdua0FsWVpTZTJx?=
 =?utf-8?B?Zyt3VFF4RjhjMmYvZ091am9CWWpZQVl1QXcrcFh1NExWM3lmVkFqUnBOTTRu?=
 =?utf-8?B?NGtMejZYVlFpZHVldzE3enl6cUlMNXErYjJXMzBXM3NOL2pGb3BpTXdaWmh4?=
 =?utf-8?B?SnIzR0R2VHFCa0JUMzlwRDJubUNCYkxrY2NTSnFoejRqbS9yQlI4NDM3REFO?=
 =?utf-8?B?cWN6U3FDREtIQlA2Znd3RHpmNUx1eTFKc1hZeFBTVXM3bVRzc1ZLdkpLNThH?=
 =?utf-8?B?aFNrRlFHNU0vQ1JNTVBOaDV4QkNnV3NUMFNsam9KSitaOXRPSHpUQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: uOWiQ1gJTIECH/Qw6RwX4L0hfg6IdS5C/5Km5IdD3q8jdPMPsM2Byn4Nabdk7SDcJQFM12kq5yDMN5A7w56mrrXZR1d+Jbp5tDiOvEfX7z385QbRBwoFQYO5LhmKZu7KcRT1btUm/PsJsduXBIqITk8VXX1OiBQVPqINch9OuZMi6FKWluJQHQ35AcqPd7oyRiGYikj0dWjkAPjn66zP+M7SoYVRhabaDKWVPM/Fj605Jfv5NBBCJP5glQQrrc+qBFgn1EXDEOwmcsWnBWc/b0GREPiQuxx9XVk7W+2AoIkSOGnNbYA1dsJ9UgCxJfvbyhbNHFMBhL01KJ2g2NvNhw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5242.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01dc95ff-cca2-4737-f031-08df09ba4c68
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2026 12:53:06.0216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 88Y17rU8CX6/CRM1/V1nG7WAucPMmyM2i0e9IZXnclRziPJ2kp2EgrEMLxMrFYmbnuIgPZhV32KmNm/07fqKjdSvMaeMWgOZFCEkp3AW15Y=
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXJhdmluZCBJZGRhbXNl
dHR5IDxhcmF2aW5kLmlkZGFtc2V0dHlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBNb25kYXks
IEF1Z3VzdCAzMSwgMjAyNiA2OjAzIFBNDQo+IFRvOiBHdXB0YSwgQW5zaHVtYW4gPGFuc2h1bWFu
Lmd1cHRhQGludGVsLmNvbT47IFRhdXJvLCBSaWFuYQ0KPiA8cmlhbmEudGF1cm9AaW50ZWwuY29t
PjsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBWaXZpLCBSb2RyaWdvIDxy
b2RyaWdvLnZpdmlAaW50ZWwuY29tPjsgSmFkYXYsIFJhYWcNCj4gPHJhYWcuamFkYXZAaW50ZWwu
Y29tPjsgS29wcHVyYXZ1cmksIFJhdmkgS2lzaG9yZQ0KPiA8cmF2aS5raXNob3JlLmtvcHB1cmF2
dXJpQGludGVsLmNvbT47IFJvcGVyLCBNYXR0aGV3IEQNCj4gPG1hdHRoZXcuZC5yb3BlckBpbnRl
bC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSBkcm0veGUveGVfcGNpX2Vycm9yOiBX
YWl0IGZvciBwY29kZSBpbml0IHBvc3QgU0JSDQo+IA0KPiANCj4gT24gMjgtMDgtMjAyNiAxOToz
NiwgR3VwdGEsIEFuc2h1bWFuIHdyb3RlOg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ID4+IEZyb206IFRhdXJvLCBSaWFuYSA8cmlhbmEudGF1cm9AaW50ZWwuY29tPg0K
PiA+PiBTZW50OiBGcmlkYXksIEF1Z3VzdCAyOCwgMjAyNiA1OjAxIFBNDQo+ID4+IFRvOiBpbnRl
bC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPj4gQ2M6IFRhdXJvLCBSaWFuYSA8cmlhbmEu
dGF1cm9AaW50ZWwuY29tPjsgR3VwdGEsIEFuc2h1bWFuDQo+ID4+IDxhbnNodW1hbi5ndXB0YUBp
bnRlbC5jb20+OyBWaXZpLCBSb2RyaWdvIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPjsNCj4gPj4g
YXJhdmluZC5pZGRhbXNldHR5QGxpbnV4LmludGVsLmNvbTsgSmFkYXYsIFJhYWcNCj4gPj4gPHJh
YWcuamFkYXZAaW50ZWwuY29tPjsgS29wcHVyYXZ1cmksIFJhdmkgS2lzaG9yZQ0KPiA+PiA8cmF2
aS5raXNob3JlLmtvcHB1cmF2dXJpQGludGVsLmNvbT47IFJvcGVyLCBNYXR0aGV3IEQNCj4gPj4g
PG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+ID4+IFN1YmplY3Q6IFtQQVRDSCAxLzJdIGRy
bS94ZS94ZV9wY2lfZXJyb3I6IFdhaXQgZm9yIHBjb2RlIGluaXQgcG9zdA0KPiA+PiBTQlINCj4g
Pj4NCj4gPj4gUGNvZGUgaW5pdCBjb21wbGV0ZSBpbmRpY2F0ZXMgdGhlIGRldmljZSBpcyByZWFk
eSwgd2l0aCBkZXZpY2UgbWVtb3J5DQo+ID4+IGluaXRpYWxpemF0aW9uIGNvbXBsZXRlLiBXYWl0
IGZvciBQY29kZSBpbml0IGJlZm9yZSBhY2Nlc3NpbmcgdGhlDQo+ID4+IGRldmljZSBwb3N0IFNl
Y29uZGFyeSBCdXMgUmVzZXQgKFNCUikuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IFJpYW5h
IFRhdXJvIDxyaWFuYS50YXVyb0BpbnRlbC5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3BjaV9lcnJvci5jIHwgNSArKysrKw0KPiA+PiAgMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3BjaV9lcnJvci5jDQo+ID4+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaV9lcnJv
ci5jDQo+ID4+IGluZGV4IDc5Y2UwYzY3MTU0OS4uM2U5Yzc3Zjg0ODNkIDEwMDY0NA0KPiA+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpX2Vycm9yLmMNCj4gPj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3BjaV9lcnJvci5jDQo+ID4+IEBAIC05LDYgKzksNyBAQA0KPiA+PiAg
I2luY2x1ZGUgInhlX2d0LmgiDQo+ID4+ICAjaW5jbHVkZSAieGVfbG9nLmgiDQo+ID4+ICAjaW5j
bHVkZSAieGVfcGNpLmgiDQo+ID4+ICsjaW5jbHVkZSAieGVfcGNvZGUuaCINCj4gPj4gICNpbmNs
dWRlICJ4ZV9wbS5oIg0KPiA+PiAgI2luY2x1ZGUgInhlX3ByaW50ay5oIg0KPiA+PiAgI2luY2x1
ZGUgInhlX3Jhcy5oIg0KPiA+PiBAQCAtMTA5LDYgKzExMCwxMCBAQCBzdGF0aWMgcGNpX2Vyc19y
ZXN1bHRfdA0KPiA+PiB4ZV9wY2lfZXJyb3Jfc2xvdF9yZXNldChzdHJ1Y3QgcGNpX2RldiAqcGRl
dikNCj4gPj4gIAkJcmV0dXJuIFBDSV9FUlNfUkVTVUxUX0RJU0NPTk5FQ1Q7DQo+ID4+ICAJfQ0K
PiA+Pg0KPiA+PiArCWVyciA9IHhlX3Bjb2RlX3Byb2JlX2Vhcmx5KHhlKTsNCj4gPiBUaGlzIGNh
biBiZSBhIDMtbWludXRlIHdhaXQgaW4gd29yc3QgY2FzZSwgYWZ0ZXIgUENJZSBjb3JlDQo+IHBj
aV9icmlkZ2Vfd2FpdF9mb3Jfc2Vjb25kYXJ5X2J1cygpIGlzIGFscmVhZHkgd2FpdGVkIGZvciAx
IHNlY29uZCpbMV0uDQo+ID4gV2hhdCB3aWxsIGJlIHRoZSBpbXBhY3Qgb24gYWxyZWFkeSBydW5u
aW5nIHdvcmtsb2FkIGFuZCBhbnkgd29ya2VyDQo+IHRocmVhZCB0cmllcyB0byBhY2Nlc3MgdGhl
IG1taW8gb3IgUENJZSBiYXIgaGVyZT8NCj4gDQo+IFRoZSBleGlzdGluZyB3b3JrbG9hZHMgYXJl
IGV4cGVjdGVkIHRvIGNyYXNoIG9yIHRlcm1pbmF0ZSBmb3IgYW4gZXJyb3IgdGhhdA0KPiBuZWVk
cyBTQlIgdG8gcmVjb3ZlciwgYmVmb3JlIHdlIHJlYWNoIHRvIHRoaXMgc3RhdGUgZHJpdmVyIGRl
Y2xhcmVzIHRoZSBkZXZpY2UNCj4gYXMgd2VkZ2VkIGFueXdheXMuDQpDb25zaWRlcmluZyB0aGF0
IGZhY3QgUENJZSBjb3JlIHdpbGwgbWFrZSBzdXJlIHRoYXQgY29uZmlnIHNwYWNlIGlzIHJlYWR5
IHBvc3QgU0JSLCANCmJ1dCBmb3IgR1QgTU1JTyBhY2Nlc3Mgd2UgbmVlZCB0byB3YWl0IGZvciB0
aGUgcGNvZGUgdW5jb3JlIGluaXQuDQpSZXZpZXdlZC1ieTogQW5zaHVtYW4gR3VwdGEgPGFuc2h1
bWFuLmd1cHRhQGludGVsLmNvbT4NCj4gDQo+IFRoYW5rcywNCj4gQXJhdmluZC4NCj4gPg0KPiA+
IFsxXQ0KPiA+IC8qDQo+ID4gICogRGV2aWNlcyBtYXkgZXh0ZW5kIHRoZSAxIHNlYyBwZXJpb2Qg
dGhyb3VnaCBSZXF1ZXN0IFJldHJ5IFN0YXR1cw0KPiA+ICAqIGNvbXBsZXRpb25zIChQQ0llIHI2
LjAgc2VjIDIuMy4xKS4gIFRoZSBzcGVjIGRvZXMgbm90IHByb3ZpZGUgYW4NCj4gPiB1cHBlcg0K
PiA+ICAqIGxpbWl0LCBidXQgNjAgc2VjIG91Z2h0IHRvIGJlIGVub3VnaCBmb3IgYW55IGRldmlj
ZSB0byBiZWNvbWUNCj4gPiAgKiByZXNwb25zaXZlLg0KPiA+ICAqLw0KPiA+ICNkZWZpbmUgUENJ
RV9SRVNFVF9SRUFEWV9QT0xMX01TIDYwMDAwIC8qIG1zZWMgKi8NCj4gPg0KPiA+IFRoYW5rcywN
Cj4gPiBBbnNodW1hbg0KPiA+PiArCWlmIChlcnIpDQo+ID4+ICsJCXJldHVybiBQQ0lfRVJTX1JF
U1VMVF9ESVNDT05ORUNUOw0KPiA+PiArDQo+ID4+ICAJLyoNCj4gPj4gIAkgKiBTZWNvbmRhcnkg
QnVzIFJlc2V0IGNhdXNlcyBhbGwgVlJBTSBzdGF0ZSB0byBiZSBsb3N0IGFsb25nIHdpdGgNCj4g
Pj4gIAkgKiBoYXJkd2FyZSBzdGF0ZS4gQXMgYW4gaW5pdGlhbCBzdGVwLCByZS1wcm9iZSB0aGUg
ZGV2aWNlIHRvDQo+ID4+IC0tDQo+ID4+IDIuNDcuMQ0K
