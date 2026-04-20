Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BF6F5A8B6
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 19:51:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10B410EB24;
	Mon, 20 Apr 2026 19:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lMGD2EYp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D089D10EB24
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 19:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776714675; x=1808250675;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6mItALu2I7TzjBiR2chDGUpoParQ19sIM66i/C+H+vM=;
 b=lMGD2EYpMzdAfm9YPzsxgeiRwx9OJlRZZv8aModGNwcw17D6wopLRz6r
 lqnhdVEP2NM3o8UgGdLENwa5rMbcxtbIpBO++MLOzoxX+hQ2BznvE7inM
 tabIuObq0RlDYt2tXWo2CZ9yH/RZrL1KHX0uvBTt436iosQAn/wuoUGno
 MgD7ZDJDSa5Ar6hDq1ecJPWYV9w6W70uv07LFHfymuG3klNeTWWcZveRw
 u/uQAcXyiqKwyPctTK/0PNqpLVOUaE5pHKKmCtBfj5J3np9GUfg88Kox1
 OU5eqE6ZxxvrFRlFTaVn/AMiHUwqfDjWKlF0rtirFULisjkrAYjRw+Rc8 A==;
X-CSE-ConnectionGUID: TTPiI4ODSUqrmNhJJeNmzg==
X-CSE-MsgGUID: OLnN1lyyTeC4a+m/S/NGDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="89110444"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="89110444"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 12:51:14 -0700
X-CSE-ConnectionGUID: q3Y2VcvXTxurwFflWi981g==
X-CSE-MsgGUID: iBzG9k8VRTyd09fJrXyQfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="255072366"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 12:51:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 12:51:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 20 Apr 2026 12:51:13 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 12:51:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/oPuRRqPGvXBl6c8skF95panaRutwHVLYMMzxFlja29B796NmX+67iqDB51P/vlrdKguCPhdCPL8UQlVR7D4TvmPtVqK4EJqfFjfG25ZqhF5nl3og58INGYvgP6VNyqFUt8Dqa6xlAiV5e0O4XI8em0qwEL7PIpNFbJmdcisgga20YGiXlJzvqvlj5BAVe5t2p3lPAVeLUKM262u8T+8kM0r0VU91IXjo2y0QQWJ2XPXn9i35TQCPTeVp09NeAXlU/CBfKHIDqr2NoFpm/FW0sZAHSVncpfk/i1PiMzYH5gboZtjEbvFkOQxI3YufyXZsq+fi8B1u/4QHKbzqnl2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mItALu2I7TzjBiR2chDGUpoParQ19sIM66i/C+H+vM=;
 b=FHxq7iobF70ciTRfZpfC579NeQVfRjrO7zGWcxr5CIu8+LFybNea5N8TjAhIhZ/L08Q5cl1YEENRQjzOYCgCce476iaxuJGZY0foQG+COWejbpfPz0Y8Nxv1CqTDjwEliCc/SUgBkLThRFJG8U1odlABrct8QZaZm1yzPFbIwTYihf5Gpb9RbzfV4+b+mkL8R14H4y38axT76rlgXEDMCNhYlvGz6N1W+aizjDvolTNRtVudyjFIqPSbmm0SPoE8PpJBjx7ZZ8dRmsRrBosdwUloh+TRzghy3C7uxj11agubidJryOORUTmdGy/KIzb1M1072n7r87Mj5NlZJlXfew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH8PR11MB6659.namprd11.prod.outlook.com (2603:10b6:510:1c2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 19:51:09 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.20.9846.011; Mon, 20 Apr 2026
 19:51:09 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Anirban, Sk" <sk.anirban@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Jadav, Raag" <raag.jadav@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>, "Purkait, Soham" <soham.purkait@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>
Subject: Re: [PATCH] drm/xe/guc: suppress GuC error logs when device is wedged
Thread-Topic: [PATCH] drm/xe/guc: suppress GuC error logs when device is wedged
Thread-Index: AQHc0LlVduBsWUMHUU2hBUOSHdORbLXoXI2A
Date: Mon, 20 Apr 2026 19:51:08 +0000
Message-ID: <ced90e9252d7bed413b9c61d2f8495af72941bf7.camel@intel.com>
References: <20260420112925.1379274-2-sk.anirban@intel.com>
In-Reply-To: <20260420112925.1379274-2-sk.anirban@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH8PR11MB6659:EE_
x-ms-office365-filtering-correlation-id: 8b7a9cca-e6e3-4497-a530-08de9f162adb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: eVs/1kQJV/z3kvVShJfxJx7S3N6tg4A/5MXIHu2WLiLOAxAts1xPnp+7vw6m48cjvrdsdr8FbIcsQvAy7DbKGWz6HwE7WtKxvr0vQshDmN0Ew1YG19Xf2ddc9RZ4QPDSnVNSi2jFOcR13EddFlBq1PFr9sWnkLhfac0Af3pVCH6ZRTxlZRp8sFtuemWN5pohU64xVD6d5hAXAQbcIexbrDRaXcK1uMobVBfa4mWfn1GRsxzPbLGU6oNebOwsxA7aauRFOsckXq9IISIvQG2OlAU5EoNdRnek3P+nclpJ0Swf+S9QM3sIGtwoRAji9s1p3DMFAKpOf2O628BLpRxWkqmcCpTnUrz+eC7oOJt1FDogs1Fxy1O/egprY86D0SU7UniyBYVHuLmfUj23CErACrtQ60+xz0wW6OKohHsJqil/srTo1NSAXe3fh6mEqMe+e5n1dWAAWu2VgTPhkFB/PoEmnrxGsvpsdeAvWtJ6OPKZMIiw6klFIRnMqFwQgfY9NtvWZnQh/FKuRk0JF50eSOxp8cBjZXYrVWCbyU8l1Ycku8ak+h5Mj8IeN6YfNRjXkYJi5hz4enuKeu2rE5iXejoDnp68RpRnA4+Opi6Vqv2Q/XAbYnwUwyBcH2Sr1TjPFts7z/HbFVCZqjXDCKrQR/KJaUGbFimvorRhSPq1ENNyuP/dUlIxDfuUG9p575JF7yYQu5aVjqJSsw3ccp4FcOK61U04NpZ+nQau9ABwLxEL1Ad9zO2OA8kImuyT7BVXr6+tbUoK7VLq4KuLqMNkRNgMg1gAUL5nWJA6my9QU+8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGhvYm1EZ0pqMmRqVzgra3VTNFdCaE01T3Buckh2TVJDY0lRa0xrMm4wYWVa?=
 =?utf-8?B?Ni9VZ2YwcFVTMzNBWU40dG05WmRsdmw2YXFJUWxCK0F3cVhLWFZxcVpTMHhZ?=
 =?utf-8?B?MDQraXVJMEhOQkJ3KzBlN0dKU2QwcHdRMkJsWFFEUFVsQUNiLzdXdTdnQzQx?=
 =?utf-8?B?OUlMYWpOMnZpejh4SzlpVUJjbmQwMUFhNzBrbWJjd1lGZm9OMGd6ZTdXWU1y?=
 =?utf-8?B?Vzl1Mld6djZJcXkwUk5VYzZsNU9hVWFwOUZFZ1FtMXl4Z1hpNEdvWGRtZnln?=
 =?utf-8?B?MDNJOUx0WWlhSXZBdmFzN25hdXNNbHdlRFNGemFsMml3NVdqMVNveTNESnht?=
 =?utf-8?B?WnFGQ1JmaDJoRUNhVG93RUFIeklnY3g0QkwzK1RFMHdGV3NkT0NEQzZTVjhw?=
 =?utf-8?B?VFVUeUJNSDZRMERDeGZDMEt4Q3dCZUtSa2tVZ0haeEVlV1hOTUxVYW5YZmRz?=
 =?utf-8?B?b203NHNjaDBET3JjazlxSnZDVGVmU3pubzJOQ2gwcmRkcTZIakovSmYvV1I3?=
 =?utf-8?B?eWZ1Zk13ZTFrdDkyMG1NdjRPdVQvTlA2SWtvaFVPQnEwUDN5SU1YSlZZTW50?=
 =?utf-8?B?d3pMdlBIL2svZVJ0aVVmSnFVNldRQmo5cXRxd3hIQTBhSmhGM0tNdExLR0p1?=
 =?utf-8?B?M3pYVDJWNGRQL1ltVVJFSHlJSnJ6OWtqRnpBUGducDgvbEl4WnJtZmR0T296?=
 =?utf-8?B?YWNMZkRvOElLMmovTXJrY0tMRVVyQis1MmZHRVlLWjBieHRNY1RRZ3E3dVMy?=
 =?utf-8?B?Q0E4aFhGWmRnalRIcS9YV0NnR2ZxS1R0a0daM3VlQVJPb1ZOMXRqWm81OC9z?=
 =?utf-8?B?dm1pRktlYmxkaXU3Mjc1RU4xV2lVZ3YvemlEd2lnNWlTeHo4d1NxaXVXV3Vn?=
 =?utf-8?B?cmRNY1UyV0cvbE5qcVd5amJhSzFpVEY0M25hY2tiZHpERmlNM1JmUU54RWNj?=
 =?utf-8?B?b2tvOTltaVdrQ2dRSC9TeEJDZ1BTWTJSVG9EWEdraTlpb2pIamYxa2hxdkZR?=
 =?utf-8?B?S0QwdFZ6Z0JIY1RxMzE5M3Z6UG92WlhGSHZzUWdPZzFTN0NYUEF2dERxbnFP?=
 =?utf-8?B?NFF5Sk5LS3ZlcWNmdVE1bmF6NFh6K3VsQlZTcFlEMm4xcjlqV0lQQkZJY3BI?=
 =?utf-8?B?dkJsYndFM0h6NHVSSnloeW85WWdGNHNmWFhKMkR2RVJSMWFBazM3dXNrNXpH?=
 =?utf-8?B?NFZQbUlQVDRDUCtrNTE1NWR4VzR6UFBUaHBOWHFSTnFiTlJOeTR6R0xnUXhx?=
 =?utf-8?B?b3FkNDBRWjhabXhqRU1EQTNncnhIU3ZSWmJoTWRBajN4aFVvcDk1OUFJS29v?=
 =?utf-8?B?R1NYMU9KTmhOdXR2MEpIUHN3b2ovTHFJdXhyNWtiQVVreS9GVzZjUmZoc0Vm?=
 =?utf-8?B?M2lCcDJFNzB2eWFvRXVhekpUSVlMd2V6SHA5aU52TnBqMjRtTHRBZWVMaytz?=
 =?utf-8?B?aHZmc3JUVjNkS1JDNlYveW5lMk9zSE1HdVhNbVhDNHdBTm5zS2QxU1hXc2Jq?=
 =?utf-8?B?eVBrSzlVbjlnSTZhdGhBYVg5Q2JFQjl2QUJUWXFOMElyZHZqZmhabzhtUHlY?=
 =?utf-8?B?aFhaenBzeG1wUDNDS0hvRHJoUS9xL3FBNlBjczlPeGNuZ2lDLzFKUkg1TEgr?=
 =?utf-8?B?c0V6UEFtUTNnMlp0eko2OFI0bUdrTDh5a21kSmltQkl2UG50VDZjZmUrZXlk?=
 =?utf-8?B?UG5ENlVFVkFNb0ptdnl6U1g5bmMzelVTdU45WUR6Z2tZQSsydG9JMVRQZVh6?=
 =?utf-8?B?YXVjV2ZpT0lqRDYrNHR5RnFwWURteUNlTHBNV3BZYmprVC91NHVoSEFoVnVy?=
 =?utf-8?B?aWFjL0Jvb0lKWTRDSXFrVTA1ODB0SXlPL0xGNWdyM1kvRG8weUxpS0NxZ1pI?=
 =?utf-8?B?ekNDdnlXNEtrWW02RjB2aWw4NW9scmxKczc3ZXdLdzJJMGRVeXNxbHB0V1o3?=
 =?utf-8?B?N0l1cjhMNnVNNnRiYjZhbkk4ZWEvZERHZ1NVdm1WeHFxM1Vlb004WDRYdmJL?=
 =?utf-8?B?L09yL1VKSFlMZmRWNVcyR2YrWlJ5YTgwbGdodHlpd1VINUl5VEt1TUpLZ2tk?=
 =?utf-8?B?bG1Xb254Z0RUY2gxR2h1NnBwYlozRzRkSkRxZndEOFg1OVVrQ1BLNGpCT2U5?=
 =?utf-8?B?WnJ3cGZycjcxM29yb2tyK2JrN1E3UmJjNzJ1YW9kYi9uaUEzNkFSL21XNDZL?=
 =?utf-8?B?MWt3cHRxWWxuY0E2YlB5OU9xay9MMVV3WlFDTi85RlhINExNMjQ4ZFFjN08r?=
 =?utf-8?B?V2ZOVmMxZHlRcXl3Vmdvb3dJaE1oSXJBVmR0SzgrejFmQlorVEJoVGJMckJ6?=
 =?utf-8?B?c3NlaW9zaVNSOEMrOWo2Mjl6aEQrSjhSc0FlRmtqVEkxZFRtamVybVNrbmJT?=
 =?utf-8?Q?DCuruhLVIZGTx36w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <422AB3CD6B9EFA40A512760E98F1B637@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TCFyFNrr4DVl4uflKxobTg54poKnfG1X4QGnKB4N/9brxElLVNCAY60qCSmIuCsaWDyuYSCjOw6PECuBjYKgXKEXdczRfkj3oy91luUSMaOZmkXDU4vZoZU8o2Kp9n9A1xjRVmxAVkesYGxplPpFB3b8lYfajiKjsVSmPzHjwzlwgwt43Mz2QNKsgtSjxaSZIjLS6x7xB74ekVkFMOqPWayIw2m10e6BN6FzHGY1pNRajmsD+wH+7LscupwtNlweZaw1u2zW0y/2Uolhi+Z5yI0EjDvPM8rdks2JbF4as5EZ1gIkSByGDJpHqwioIkm6h2kvAYvuU01NhMqXHiCbXA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b7a9cca-e6e3-4497-a530-08de9f162adb
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2026 19:51:09.0062 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JnKGHaZMbCUro/S4Taxmm1hkjbxbQlUkV+3QYuS+51iKfpqdpLtCw2Y3gGmVFna08A35Nh9bitlhACgIH/BNERXb/tzyRoKy9hS073pFJ6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6659
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

T24gTW9uLCAyMDI2LTA0LTIwIGF0IDE2OjU5ICswNTMwLCBTayBBbmlyYmFuIHdyb3RlOgo+IFdo
ZW4gdGhlIGRldmljZSBpcyB3ZWRnZWQsIEd1QyBDVCBzZW5kcyByZXR1cm4gLUVDQU5DRUxFRC4g
VGhpcyBpcwo+IGV4cGVjdGVkIGJlaGF2aW9yLCBub3QgYW4gYWN0aW9uYWJsZSBlcnJvci4gQXZv
aWQgbG9nZ2luZyB0aGVzZSBhcwo+IGVycm9ycyBpbiB0aGUgZW5naW5lIGFjdGl2aXR5IGFuZCBw
b3dlciBwcm9maWxlIGNvZGUgcGF0aHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogU2sgQW5pcmJhbiA8
c2suYW5pcmJhbkBpbnRlbC5jb20+Cj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
X2VuZ2luZV9hY3Rpdml0eS5jIHwgOCArKysrKy0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19lbmdpbmVfYWN0aXZpdHkuaCB8IDIgKy0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dWNfcGMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNCArKy0tCj4gwqBkcml2ZXJzL2dw
dS9kcm0veGUveGVfdWMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA1ICsr
KystCj4gwqA0IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfZW5naW5lX2FjdGl2
aXR5LmMKPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfZW5naW5lX2FjdGl2aXR5LmMKPiBp
bmRleCAyYjk5YzFlYmRkNTguLjcwMGYzNDY0ZmI2MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjX2VuZ2luZV9hY3Rpdml0eS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d1Y19lbmdpbmVfYWN0aXZpdHkuYwo+IEBAIC00NjQsMTggKzQ2NCwyMCBAQCBpbnQK
PiB4ZV9ndWNfZW5naW5lX2FjdGl2aXR5X2Z1bmN0aW9uX3N0YXRzKHN0cnVjdCB4ZV9ndWMgKmd1
YywgaW50Cj4gbnVtX3ZmcywgYm9vbAo+IMKgICoKPiDCoCAqIEVuYWJsZSBlbmdpbmUgYWN0aXZp
dHkgc3RhdHMgYW5kIHNldCBpbml0aWFsIHRpbWVzdGFtcHMKPiDCoCAqLwo+IC12b2lkIHhlX2d1
Y19lbmdpbmVfYWN0aXZpdHlfZW5hYmxlX3N0YXRzKHN0cnVjdCB4ZV9ndWMgKmd1YykKPiAraW50
IHhlX2d1Y19lbmdpbmVfYWN0aXZpdHlfZW5hYmxlX3N0YXRzKHN0cnVjdCB4ZV9ndWMgKmd1YykK
PiDCoHsKPiDCoMKgwqDCoMKgwqDCoMKgaW50IHJldDsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBp
ZiAoIXhlX2d1Y19lbmdpbmVfYWN0aXZpdHlfc3VwcG9ydGVkKGd1YykpCj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmV0dXJuIDA7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gZW5hYmxlX2VuZ2luZV9h
Y3Rpdml0eV9zdGF0cyhndWMpOwo+IC3CoMKgwqDCoMKgwqDCoGlmIChyZXQpCj4gK8KgwqDCoMKg
wqDCoMKgaWYgKHJldCAmJiAhKHhlX2RldmljZV93ZWRnZWQoZ3VjX3RvX3hlKGd1YykpICYmIHJl
dCA9PSAtCj4gRUNBTkNFTEVEKSkKCklzIHRoZXJlIGEgcmVhc29uIHdlIGRvbid0IGhhbmRsZSBh
bGwgb2YgdGhlIGNhc2VzIGRlc2NyaWJlZCBpbgpfX2d1Y19jdF9zZW5kX2xvY2tlZCgpPyBJdCBs
b29rcyBsaWtlIGJlZm9yZSB3ZSBkbyB0aGUgY3QtPnN0YXRlID09ClNUT1BQRUQgY2hlY2sgKHdo
aWNoIGlzIHdoZXJlIHdlJ2QgcmV0dXJuIC1FQ0FOQ0VMRUQpLCB3ZSBhbHNvIGNoZWNrIGlmCnRo
ZSBDVCBpcyBicm9rZW4gKGkuZS4gd2UgZ290IHNvbWUgYmFkIHJldHVybiB2YWx1ZSBmcm9tIEd1
QyBhbmQgbWFya2VkCkNUIGFzICJkZWFkIiwgaGVuY2UgcmV0dXJuaW5nIC1FUElQRSBoZXJlKSBv
ciBkaXNhYmxlZCAoYW5kIHJldHVybiAtCkVOT0RFVikuCgpTYW1lIHF1ZXN0aW9uIGZvciB0aGUg
b3RoZXIgY2FzZXMgeW91IGhhdmUgYmVsb3cuCgpUaGFua3MsClN0dWFydAoKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2d0X2VycihndWNfdG9fZ3QoZ3VjKSwgImZhaWxlZCB0
byBlbmFibGUgYWN0aXZpdHkKPiBzdGF0cyVkXG4iLCByZXQpOwo+IMKgwqDCoMKgwqDCoMKgwqBl
bHNlCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlbmdpbmVfYWN0aXZpdHlfc2V0
X2NwdV90cyhndWMsIDApOwo+ICsKPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Owo+IMKgfQo+
IMKgCj4gwqBzdGF0aWMgdm9pZCBlbmdpbmVfYWN0aXZpdHlfZmluaSh2b2lkICphcmcpCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfZW5naW5lX2FjdGl2aXR5LmgKPiBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfZW5naW5lX2FjdGl2aXR5LmgKPiBpbmRleCBiMzI5
MjZjMmQyMDguLjE4OGYzMjVhNDYyZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjX2VuZ2luZV9hY3Rpdml0eS5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1
Y19lbmdpbmVfYWN0aXZpdHkuaAo+IEBAIC0xMyw3ICsxMyw3IEBAIHN0cnVjdCB4ZV9ndWM7Cj4g
wqAKPiDCoGludCB4ZV9ndWNfZW5naW5lX2FjdGl2aXR5X2luaXQoc3RydWN0IHhlX2d1YyAqZ3Vj
KTsKPiDCoGJvb2wgeGVfZ3VjX2VuZ2luZV9hY3Rpdml0eV9zdXBwb3J0ZWQoc3RydWN0IHhlX2d1
YyAqZ3VjKTsKPiAtdm9pZCB4ZV9ndWNfZW5naW5lX2FjdGl2aXR5X2VuYWJsZV9zdGF0cyhzdHJ1
Y3QgeGVfZ3VjICpndWMpOwo+ICtpbnQgeGVfZ3VjX2VuZ2luZV9hY3Rpdml0eV9lbmFibGVfc3Rh
dHMoc3RydWN0IHhlX2d1YyAqZ3VjKTsKPiDCoGludCB4ZV9ndWNfZW5naW5lX2FjdGl2aXR5X2Z1
bmN0aW9uX3N0YXRzKHN0cnVjdCB4ZV9ndWMgKmd1YywgaW50Cj4gbnVtX3ZmcywgYm9vbCBlbmFi
bGUpOwo+IMKgdTY0IHhlX2d1Y19lbmdpbmVfYWN0aXZpdHlfYWN0aXZlX3RpY2tzKHN0cnVjdCB4
ZV9ndWMgKmd1Yywgc3RydWN0Cj4geGVfaHdfZW5naW5lICpod2UsCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqB1bnNpZ25lZCBpbnQgZm5faWQpOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3VjX3BjLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcGMuYwo+IGlu
ZGV4IDdlY2Q5MWFkNjE5Mi4uZWZjZDQzMmVmNmVmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndWNfcGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcGMu
Ywo+IEBAIC0xMjAyLDcgKzEyMDIsNyBAQCBpbnQgeGVfZ3VjX3BjX3NldF9wb3dlcl9wcm9maWxl
KHN0cnVjdAo+IHhlX2d1Y19wYyAqcGMsIGNvbnN0IGNoYXIgKmJ1ZikKPiDCoMKgwqDCoMKgwqDC
oMKgcmV0ID0gcGNfYWN0aW9uX3NldF9wYXJhbShwYywKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU0xQQ19QQVJBTV9Q
T1dFUl9QUk9GSUxFLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2YWwpOwo+IC3CoMKgwqDCoMKgwqDCoGlmIChyZXQp
Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKHJldCAmJiAhKHhlX2RldmljZV93ZWRnZWQocGNfdG9feGUo
cGMpKSAmJiByZXQgPT0gLQo+IEVDQU5DRUxFRCkpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqB4ZV9ndF9lcnJfb25jZShwY190b19ndChwYyksICJGYWlsZWQgdG8gc2V0IHBvd2Vy
Cj4gcHJvZmlsZSB0byAlZDogJXBlXG4iLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2YWwsIEVSUl9QVFIocmV0KSk7Cj4gwqDC
oMKgwqDCoMKgwqDCoGVsc2UKPiBAQCAtMTMwNiw3ICsxMzA2LDcgQEAgaW50IHhlX2d1Y19wY19z
dGFydChzdHJ1Y3QgeGVfZ3VjX3BjICpwYykKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqAvKiBTZXQg
Y2FjaGVkIHZhbHVlIG9mIHBvd2VyX3Byb2ZpbGUgKi8KPiDCoMKgwqDCoMKgwqDCoMKgcmV0ID0g
eGVfZ3VjX3BjX3NldF9wb3dlcl9wcm9maWxlKHBjLAo+IHBvd2VyX3Byb2ZpbGVfdG9fc3RyaW5n
KHBjKSk7Cj4gLcKgwqDCoMKgwqDCoMKgaWYgKHVubGlrZWx5KHJldCkpCj4gK8KgwqDCoMKgwqDC
oMKgaWYgKHJldCAmJiAhKHhlX2RldmljZV93ZWRnZWQoeGUpICYmIHJldCA9PSAtRUNBTkNFTEVE
KSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2d0X2VycihndCwgIkZhaWxl
ZCB0byBzZXQgU0xQQyBwb3dlciBwcm9maWxlOgo+ICVwZVxuIiwgRVJSX1BUUihyZXQpKTsKPiDC
oAo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Owo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfdWMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV91Yy5jCj4gaW5kZXggNzUw
OTFiZGUwZDUwLi5iNDQwY2Y4YzQzMWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3VjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdWMuYwo+IEBAIC0yMTUsNyAr
MjE1LDEwIEBAIGludCB4ZV91Y19sb2FkX2h3KHN0cnVjdCB4ZV91YyAqdWMpCj4gwqDCoMKgwqDC
oMKgwqDCoGlmIChyZXQpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4g
cmV0Owo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgeGVfZ3VjX2VuZ2luZV9hY3Rpdml0eV9lbmFibGVf
c3RhdHMoJnVjLT5ndWMpOwo+ICvCoMKgwqDCoMKgwqDCoHJldCA9IHhlX2d1Y19lbmdpbmVfYWN0
aXZpdHlfZW5hYmxlX3N0YXRzKCZ1Yy0+Z3VjKTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgaWYgKHhl
X2RldmljZV93ZWRnZWQoZ3VjX3RvX3hlKCZ1Yy0+Z3VjKSkgJiYgcmV0ID09IC0KPiBFQ0FOQ0VM
RUQpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7Cj4gwqAKPiDC
oMKgwqDCoMKgwqDCoMKgLyogV2UgZG9uJ3QgZmFpbCB0aGUgZHJpdmVyIGxvYWQgaWYgSHVDIGZh
aWxzIHRvIGF1dGggKi8KPiDCoMKgwqDCoMKgwqDCoMKgcmV0ID0geGVfaHVjX2F1dGgoJnVjLT5o
dWMsIFhFX0hVQ19BVVRIX1ZJQV9HVUMpOwoK
