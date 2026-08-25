Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D0EC61DB9
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 14:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A794110E602;
	Tue, 25 Aug 2026 14:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WK7/BNA6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2ED210E602
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 14:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787666836; x=1819202836;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=GVyVFdzvs8RBVyLvsRztPf7gkWiHBse7J1Jdx34Ut7U=;
 b=WK7/BNA6T6VyZoWc8Du7iKyH9vSGdtOqlLt1vA3GiASN87tDBJHMR+8z
 +1RRVDM9PgtTLBUa+b2vrFJVOhnMwsl6r7uAv478n1vlGuyzxkFNRnx8t
 ooiRbO7cfLEoYxqN/s6R4rbK2FZQXiaIkI72OsYaoaxw92EWmrfSLLrSV
 RJVirO7uEhkJAS4Pw3mVik6yFISpFnhLBqwmrACg+jXst+91KfFwjPUlv
 3yhZyU7twtq/25GtxMKJ3XQS61UnDejBshUD7deWIvcUq9RQrKVKgq5ML
 a8ROueZ6qLgw55F4VJIOHLclov3c2JGtSPlJCk0f67NqX+DOEtn4C3c3a Q==;
X-CSE-ConnectionGUID: Cy9dhPx8QouXMlqrr8vWOQ==
X-CSE-MsgGUID: FkQjY4KpQ5mzj89S3RSkOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="99481160"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="99481160"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 07:07:15 -0700
X-CSE-ConnectionGUID: FR+GJ5xiR+SMzEH1VPIAMA==
X-CSE-MsgGUID: 3vmkGWyISlStenaWg0s2lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="290827545"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 07:07:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 07:07:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 07:07:14 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 07:07:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSXzauWnLbFrAjqJjWmz279WwwYkAG7Gi96T6ggnq+JzO4qXXYK3sJ4ey9lN6zN4MC1Y5tZIOUYFooWsp1jw3FVUNkojr/kZwpkqOA1KXZz1VrrbSZxbeAs6SRzvfq6aMT4rPqH/MqhZzubmI9lDxUeh+BHdnU2zs6TwOH7oIoVFiFHyPmt9cZ3vhUa0ZsDbTt2iSGdmI5x6ZgvcKkTuNws58zc/Rg4f/5B6/bs557F5CGp98V/tIXg9SgtJyGepIzvYELiDGfrkYtRrc8M6FDgtyIBsAFZ1nwoRxuOmQFV5ljm8fCKyr73JNLxdrIiM9jTsyQ9k/RBptt3zv3Y3Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVyVFdzvs8RBVyLvsRztPf7gkWiHBse7J1Jdx34Ut7U=;
 b=anZxiAxC+hUSK4jSEThOHcDuNHFbxPG7aGCiIIE54hJLhO2SOkXuEGYaEmsX/doYw3nxgz7QLZ+HgLYDvl1JX9sha25zldKX0W2gIMv78gr2l/QI+BzMgCAJ/ZFTIr9/sPBBR07XHDaAyQIka9nmCDkMsJuckE70n/+KqCbttPnq+omY0SSDxRFBAFeLqGjok/qN8kQSSH1AOa1NPquGeo4dC844+4P4fz5aC61LsZ8/xY4+C/tRlQrhY9b/FvqFBARXfp5U5M2bVGxBhd3QLE9ypuezxDJHmOE8fcLuQ9yJl1OEmtN+hJq9vVxW/c7kuvDwRZY5e609rx7W8S6CDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by CH3PR11MB976373.namprd11.prod.outlook.com (2603:10b6:610:364::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 14:07:06 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4%5]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 14:07:06 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: =?utf-8?B?UmU6IOKclyBDSS5jaGVja3BhdGNoOiB3YXJuaW5nIGZvciBkcm0veGUveGUz?=
 =?utf-8?B?cDogUmVzdG9yZSBzYW1wbGVyIGZhdWx0IGZvciB1bmluaXRpYWxpemVkIHN1?=
 =?utf-8?Q?rface_state?=
Thread-Topic: =?utf-8?B?4pyXIENJLmNoZWNrcGF0Y2g6IHdhcm5pbmcgZm9yIGRybS94ZS94ZTNwOiBS?=
 =?utf-8?B?ZXN0b3JlIHNhbXBsZXIgZmF1bHQgZm9yIHVuaW5pdGlhbGl6ZWQgc3VyZmFj?=
 =?utf-8?Q?e_state?=
Thread-Index: AQHdNCpHPd9K4GjgeU+E1Mjw2AgUdbauzVSA
Date: Tue, 25 Aug 2026 14:07:06 +0000
Message-ID: <d60095dff1977da3b6b6a8c7c9406a6b561d7d8b.camel@intel.com>
References: <20260824220458.520358-1-jose.souza@intel.com>
 <178761839517.80981.7640947341174608568@61270ab9df2a>
In-Reply-To: <178761839517.80981.7640947341174608568@61270ab9df2a>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8185:EE_|CH3PR11MB976373:EE_
x-ms-office365-filtering-correlation-id: eb90ebbe-d9a1-411b-8f0e-08df02b22537
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|38070700021|6133799003|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: RqQbeLP6+FHPgKsIFW0i7mOweQcxMrkAvUe3J2vbji+Xcmp4pbkw11Dz/dLv26KfFyYfHAFF7ufo8i0Ckt5xqUnWI6OEMxc0+BKtcMH93iX4ltu7B3BO04ZJ5L1GxSCqZPYKr2I/h8Gm4BLPluV7vHE8iC29GXFMLotL6YGjy4PpgRK7RoEBGAcLVSQnb2cxjwjKC402KSBEHcXOoYkYSHPjBFJrpfGvMu3Owa/ajLH8vJpYF9Kg8to68v4H6Gxj2lgteHyRITRD58dHLjIMkqoJUlZNhwVC2L0fF1j917oPFnjKfMKIHIFjXp+ktF7OvJoFWdpjw8GbuywbdKkBxYcyyj/PZw4k0gQDNvwB0hUbAnUkSwEh6uMC0R72buSNVIVkbUcGx8dZJunHnvk9A8qqUE90BBQATbfn2IOsxnw6Du7gCKbFygZ/j5Y7JNTcPD0kS+PB+0RBGsyQL4Y6uLOaBPuIbtPm92T8Vycy4yCrEq8j/hndNW519IM2BYsMHBWX1NlMTJFLBLfvD4Oj1Go1GhHFhycGz7WdFHOGWiP91sfT1NSnqcekzBPAMUCZGaPGKTMIxsrs1jFaB9qD9d7ZO9ZS0VV04ojxOzL/+jKG7T1PgbiQhVnI4KLE4rOb2htTbpQ2x64IXxc8QmVZxTZf7KCE3UaE+UJ9n596Elo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U095UnNRNnhoUEp5c3BSUFRYcTlFTFAvQTVpUitray9XbldnRnpGZmRiUEQ4?=
 =?utf-8?B?MUZvT1ZlZzVYMzZLcmZEOHk1d0NicGdpejd6UHZBTjF0VzNtNEhEVktoMDd0?=
 =?utf-8?B?YnZCOWM2WHVxUTlxd1dhbTBzb1RNMklrKzFNRDNlMVM4a2h5d215U21SSTRh?=
 =?utf-8?B?WHFRZ1VSZExsemFOOG5LTUNtRDJoOCtNWTZiYit6ekFjdjUwTVovQXJDNFlB?=
 =?utf-8?B?WUlsdCtHT2hPUWNTTWVkYmtUZGkya0dIeHZoekhFUnNxeWxtYWhPUVNURXBP?=
 =?utf-8?B?cHNWaGZQbFZZNjFMSjZJMElMc3FRc1dKWXVjam8vK2FlRFNuWHp2NnBxenFU?=
 =?utf-8?B?ZGhOanJ1MFQ3MHBHWWV1Vmo4WldBS3hNNzRKUWlTem42OWdUWDJES041YnUy?=
 =?utf-8?B?eHkzaUtwWUhERkdiWDR5QVNqZ2NLTGcxMlpWdTA2OVdBbzM2YVZGY2J6OTlC?=
 =?utf-8?B?ZldyZEV4Z1dxMWs3RnhuVUw4eUlVczBkUnlTT1huSXZ3TmlrM0FZcXliOUhB?=
 =?utf-8?B?ZkpZT1REMGdCRFpsSFdiVEJwa1dGbERLNGlPbHRnVHJoTVRjeDA0TXhOZk5J?=
 =?utf-8?B?UkhQWSthekcwR25jTlp5STZ4VkdhRGwwSnphN0hzcWNFbk9paG5sSThCbjRH?=
 =?utf-8?B?eVpmQzZDdnJlTUUvYzlpUGNCVzVTUTJINS80dTd2Mk1ZN2MwVEZLUHBiY2hB?=
 =?utf-8?B?K1hvYXIxRnNxVXBlSlhiQUxwM0g2ZjlrUlc5QWY5MU5FM2p5NERMVWxUWm9R?=
 =?utf-8?B?UVM4bW15eVlzM0JmeTZ1bk5IMC9PYnNDTmlSQW1KVWp0bjJVZHgrcjBhbWxL?=
 =?utf-8?B?azhjYkhITVhIZkQ0YkhVdGRFSG9iM1hKN0JDamRibExKRzlvekdCMEFZZVJS?=
 =?utf-8?B?ejdpUHJ1VWdYRzZVc2V5MTdaZjVBRUhNY29iSVFWZk9LTk8wc2F1djdrbkg1?=
 =?utf-8?B?R0NUKzNKb1dOMVAwRU9kcWVtWDNQRUxQK0ZyQlB5T1c2RjI0b0JNa2JzZTZN?=
 =?utf-8?B?cXdkRU5DY1dnbHo2T3Bzd21tU0pod1Vlbkd5S3JHWHZBaHBtaWprMjJmekc2?=
 =?utf-8?B?bWRBZjljY2VwTU8vTEZuSWQ0a1dZaGZZblFKSy80eGpNa3U3WmpVdlliL3la?=
 =?utf-8?B?bHEvYXVmSXBvUmJCWHJzUmR5UVVSLzV0QjBsUzlTOENaTWwwOWx2Y3ZaS2pY?=
 =?utf-8?B?Ny8rbE81NkJ0ck9nNTFwVEFpOXNQb1ZweGQrVGd4NElkcDFwd1QyV3BqTTNY?=
 =?utf-8?B?eFc0Tk0rRFFsMnRvN25RSlZqdHBBV05lV0NBTGxSdWo4bUI1WlNibldSVzBD?=
 =?utf-8?B?SHNaVUhzcDVMYTBDMTErRndhVCtQVy9Ka3lnaU50WCtSakNwa1BtRFRDbVg5?=
 =?utf-8?B?SWpzTTVKMjBPTGFEWnlLcm9jRWh5dkI3WFd4WW9TZ0RxMndrcDlvWm5tVkpx?=
 =?utf-8?B?Wi9kQXZuSFd3MlFOTVVXdWM0V29uUWhlS2kranVHN2hVYVV0SnFzUWlJaFdB?=
 =?utf-8?B?cTd2RFNSeHptb05CUXh0RG1HTGxlMkN5WDhVQlAycVp3ZlFvcHd0cW5WNDk4?=
 =?utf-8?B?MDdjTzhSLzZVNHNuUUlwZDlaQVg0OE53ZHFWVVRMVkdJZ0hScmZzV1hCZWN5?=
 =?utf-8?B?a2x3bWRhNmNEV1pSMFRCV2ZXejJiQURwRDZVT0FrYkNDV01UeWNlU3JVWHN0?=
 =?utf-8?B?aUdRMDZtL2ZWWEkzalJ3cTR6eW1XWXdoYXFkWVBaTEhCRk91TW4zVFYzc21E?=
 =?utf-8?B?SktFMGJZM3czVDV6YjVlcGtYWWJLWkNQRUVMQUhseEMya3NNNnU2MlpWTGhq?=
 =?utf-8?B?RkdLNVFZTzdzWml2WVcxSTByUXNGVkRaT2VzeGJjb2R1eVBKaXcrMXh3dXhs?=
 =?utf-8?B?ejlycDgzbWI0Q2txNGt2SEVLdDg2Q1NUSk1FL3Y1dTlqa1VhaWt2eUtacDJO?=
 =?utf-8?B?dW5RYVVackw4Nk9oOE9tQXFWN1hDNWc4VHBtc0NDV1kwWGgrZjlzdkZyNWcr?=
 =?utf-8?B?eGxzd2VvZVlHZXd4dmM5Mk1hYUZiOTRzSkRTaEhZc1l0ckRHb2paTEh2SVpH?=
 =?utf-8?B?dmppSzFjek1XbVo2SWUxeGRtSTVVcXk0Z2g0cVFsbjJkL2E0cEJCNXVSZ09K?=
 =?utf-8?B?WHFOOFpXK05FQmVnWUhiZnZxNy9XTlEweVVEYmk5dGdjM0E5ODB4MzY3eHY0?=
 =?utf-8?B?SUJ6RWtPWVE2M3J2dVR1MGhhTVV4bEdhQitZTnhMV2J5MTcySlVxV0tYRFZo?=
 =?utf-8?B?MEFBTUFZcWRERGhkN3lkUkREZEYwN3BwOEZQT25MbGQ5WGVabDlNVUJPWmRn?=
 =?utf-8?B?OGVuSnQ0eW5WYTRwWmdndmxJaXgyeGJnOVJzY2lQQThJZjQzTVhvZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <69621B30D2255D4092A66C2C96837515@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: BsFJZEtwI2LAbB5tzdlpxYPJOE1Vjgd8zRL5pt6hsPuwSTayq1U0nHt6tIZlfo2xpSGhu+Jql34oq90QKOKtBEsCGA10Gpr/iKl+OFCrvqaNV81jBlJOdamMeIDbjSTJalNiWfXX3J1XxEmcIMhNd3xUa4fTLlpn7OU49DqdRxsiz8ertDy/lsnLn0Es3t91jdSQwITYlrycBMqmzApjxMWf6DCYUes/KJWTCsQ8bOK0rg+YW+ic0dLsleQVYABaIL1e3uCBLmK21w+fzmJxGwvX9lXtFP9Ekx2KeNKiyMR4AA1vKioNxmnewMzVIR4FBXAkHYcI5A4ZiPp+JkLFog==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb90ebbe-d9a1-411b-8f0e-08df02b22537
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 14:07:06.1506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkR10jkJMCl6VMo2LcmTESvnY5/i6UKqLsurJiggXTMaloR3YsEkKNIULq2ueRr8MFd7q/cLN6N1CPL8SBue6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB976373
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

SSBoYXZlIGZpeGVkIHRoZSBzdHlsZSBlcnJvcnMgaW4gbXkgYnJhbmNoLCBidXQgd2lsbCBob2xk
IHRoZSBzdWJtaXQgb2YNCm5leHQgdmVyc2lvbiB1bnRpbCBJIGdldCBzb21lIHJldmlldyBjb21t
ZW50cy4NCg0KT24gVHVlLCAyMDI2LTA4LTI1IGF0IDAwOjM5ICswMDAwLCBQYXRjaHdvcmsgd3Jv
dGU6DQo+ID09IFNlcmllcyBEZXRhaWxzID09DQo+IA0KPiBTZXJpZXM6IGRybS94ZS94ZTNwOiBS
ZXN0b3JlIHNhbXBsZXIgZmF1bHQgZm9yIHVuaW5pdGlhbGl6ZWQgc3VyZmFjZQ0KPiBzdGF0ZQ0K
PiBVUkzCoMKgIDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNzI2
OTcvDQo+IFN0YXRlIDogd2FybmluZw0KPiANCj4gPT0gU3VtbWFyeSA9PQ0KPiANCj4gKyBLRVJO
RUw9L2tlcm5lbA0KPiArIGdpdCBjbG9uZSBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcv
ZHJtL21haW50YWluZXItdG9vbHPCoG10DQo+IENsb25pbmcgaW50byAnbXQnLi4uDQo+IHdhcm5p
bmc6IHJlZGlyZWN0aW5nIHRvDQo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0v
bWFpbnRhaW5lci10b29scy5naXQvDQo+ICsgZ2l0IC1DIG10IHJldi1saXN0IC1uMSBvcmlnaW4v
bWFzdGVyDQo+IDA2MTE0MGI5YmM1ODZhZTdmNDBhYmMxMjQ5Yzk3ZTFjYzcyZDFiOWQNCj4gKyBj
ZCAva2VybmVsDQo+ICsgZ2l0IGNvbmZpZyAtLWdsb2JhbCAtLWFkZCBzYWZlLmRpcmVjdG9yeSAv
a2VybmVsDQo+ICsgZ2l0IGxvZyAtbjENCj4gY29tbWl0IDczNTcyNGU5YmM3YzBhOTZjYmQyY2I3
ZjBlODk2ZDYwZjc5N2ViNGUNCj4gQXV0aG9yOiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3Nl
LnNvdXphQGludGVsLmNvbT4NCj4gRGF0ZTrCoMKgIE1vbiBBdWcgMjQgMTU6MDQ6NTggMjAyNiAt
MDcwMA0KPiANCj4gwqDCoMKgIGRybS94ZS94ZTNwOiBSZXN0b3JlIHNhbXBsZXIgZmF1bHQgZm9y
IHVuaW5pdGlhbGl6ZWQgc3VyZmFjZQ0KPiBzdGF0ZQ0KPiDCoMKgwqAgDQo+IMKgwqDCoCBYZTNw
IGNoYW5nZWQgdGhlIGRlZmF1bHQgYmVoYXZpb3Igb2YgYSBmYXVsdCBpbiBzYW1wbGVyIHdoZW4N
Cj4gc3VyZmFjZSBzdGF0ZQ0KPiDCoMKgwqAgYWRkcmVzcyBpcyAweDAuDQo+IMKgwqDCoCBXaXRo
IHRoZSBkZWZhdWx0IGJlaGF2aW9yIHNvbWUgZGVmYXVsdCB2YWx1ZXMgYXJlIHVzZWQgaW5zdGVh
ZCBvZg0KPiB0cmlnZ2VyIHRoZQ0KPiDCoMKgwqAgZmF1bHQsIHdoYXQgd291bGQgbWFrZSBwcmV0
dHkgaGFyZCB0byBkZWJ1ZyBidWdzLg0KPiDCoMKgwqAgDQo+IMKgwqDCoCBTbyBoZXJlIHByb2dy
YW1pbmcgU0FNUExFUl9NT0RFIHRvIGNoYW5nZSBiYWNrIHRvIHRoZSBkZWZhdWx0IGFuZA0KPiBl
eHBlY3RlZA0KPiDCoMKgwqAgYmVoYXZpb3IuDQo+IMKgwqDCoCANCj4gwqDCoMKgIFNpZ25lZC1v
ZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiAr
IC9tdC9kaW0gY2hlY2twYXRjaCAxNWUyYmEyZmI2ZDI1YzAzZDg5NTE5YWVjNDZmOGQ1YmUzZTEx
OGFkIGRybS0NCj4gaW50ZWwNCj4gNzM1NzI0ZTliYzdjIGRybS94ZS94ZTNwOiBSZXN0b3JlIHNh
bXBsZXIgZmF1bHQgZm9yIHVuaW5pdGlhbGl6ZWQNCj4gc3VyZmFjZSBzdGF0ZQ0KPiAtOjEyOiBX
QVJOSU5HOkNPTU1JVF9MT0dfTE9OR19MSU5FOiBQcmVmZXIgYSBtYXhpbXVtIDc1IGNoYXJzIHBl
cg0KPiBsaW5lIChwb3NzaWJsZSB1bndyYXBwZWQgY29tbWl0IGRlc2NyaXB0aW9uPykNCj4gIzEy
OiANCj4gV2l0aCB0aGUgZGVmYXVsdCBiZWhhdmlvciBzb21lIGRlZmF1bHQgdmFsdWVzIGFyZSB1
c2VkIGluc3RlYWQgb2YNCj4gdHJpZ2dlciB0aGUNCj4gDQo+IC06Mzg6IFdBUk5JTkc6TE9OR19M
SU5FOiBsaW5lIGxlbmd0aCBvZiAxMDUgZXhjZWVkcyAxMDAgY29sdW1ucw0KPiAjMzg6IEZJTEU6
IGRyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2d0X3JlZ3MuaDo1MDk6DQo+ICsjZGVmaW5lwqDC
oA0KPiBTTVBfRk9SQ0VfMTI4Ql9PVkVSRkVUQ0gJCQlSRUdfRklFTERfUFJFUChTTVBfV0FJVF9G
RVRDSF9NRVJHSU5HX0NPVU5URVIsMSkNCj4gDQo+IC06NTY6IEVSUk9SOkNPREVfSU5ERU5UOiBj
b2RlIGluZGVudCBzaG91bGQgdXNlIHRhYnMgd2hlcmUgcG9zc2libGUNCj4gIzU2OiBGSUxFOiBk
cml2ZXJzL2dwdS9kcm0veGUveGVfd2EuYzo2MDc6DQo+ICteSV5JXkleScKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIEZVTkMoeGVfcnRwX21hdGNoX2ZpcnN0X3JlbmRlcl9vcl9jb21wdXRlKSks
JA0KPiANCj4gLTo1NjogQ0hFQ0s6UEFSRU5USEVTSVNfQUxJR05NRU5UOiBBbGlnbm1lbnQgc2hv
dWxkIG1hdGNoIG9wZW4NCj4gcGFyZW50aGVzaXMNCj4gIzU2OiBGSUxFOiBkcml2ZXJzL2dwdS9k
cm0veGUveGVfd2EuYzo2MDc6DQo+ICsJwqAgWEVfUlRQX1JVTEVTKEdSQVBISUNTX1ZFUlNJT05f
UkFOR0UoMzUwMCwNCj4gWEVfUlRQX0VORF9WRVJTSU9OX1VOREVGSU5FRCksDQo+ICsJCQkJwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqANCj4gRlVOQyh4ZV9ydHBfbWF0Y2hfZmlyc3RfcmVuZGVy
X29yX2NvbXB1dGUpKSwNCj4gDQo+IHRvdGFsOiAxIGVycm9ycywgMiB3YXJuaW5ncywgMSBjaGVj
a3MsIDMyIGxpbmVzIGNoZWNrZWQNCj4gDQo=
