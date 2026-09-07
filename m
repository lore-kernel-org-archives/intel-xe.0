Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E06C79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 05:22:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA0710E655;
	Mon,  7 Sep 2026 05:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UretRU5i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB1310E63F
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 05:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788758539; x=1820294539;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vMB6hp225yhtFGB7XEXOGyBgkg52TF/Qbg8Onnggnd4=;
 b=UretRU5iACb3Z3jMXzvSsupK5c4A7NltsvEQ4sSeWLJ5Q4jzJuPSwVJR
 OPhgYXkza7IaNnNT+NFss7MX8GWmGrYkqe3vOjMftjKxNvje4LbhxGRwF
 wYOLsYJtGBbte2i7f2FqCDrx1fzQm+dcrRjUOis66eun+c77a3MK4FEeu
 uFEr7bwKQhRJV77DOQKTUBALEc+zOciup4k8q3SAqPQomTZEdBNUHj3DU
 FRku0c89k9NeF7wliupDzkGf7XlUKOnWgjbNsye/PLB31LnAAIpzDXqKQ
 rYRSYTS009OjPKjwrSlN7Gx8tJN4aya500aCCtlm+CHBPlEv7t/P5lMgK Q==;
X-CSE-ConnectionGUID: ws6geVycQVK4Jws74wBvYg==
X-CSE-MsgGUID: TxNykVhdSgy0qh6yu8flXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="100513156"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="100513156"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 22:22:19 -0700
X-CSE-ConnectionGUID: 53B/BaFBR6yrbu4jGBN3Lg==
X-CSE-MsgGUID: 6xOdPtLRRZa5OwbcSZDgOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="268870962"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 22:22:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 6 Sep 2026 22:22:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 6 Sep 2026 22:22:18 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.42) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 6 Sep 2026 22:22:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yerze6pZJDVhvAZGk7NDUR+U+JDQIlfUdCaOl2DFc1JcZfjNWciHdvGhOUGKSImUl5U4bwWi8AOmyKHF7106he6e/d59V9P1spdQpz3lX8PTAOiyY4jhUuMIbbhcPkUugSB79G1EBuasa+EJR7oCnZPEwJtfW9Ue+HMIq3rL3KIceJY0UMQZ8U1QeKlw/VwYCklKQM8B2wYpq1ATEGLmLx0kybAl5fbd0wM4wJbHQJvdJVZX7VjuuehOJiyqFkmLvN/8CaZdVnfP7Pmox805xvgCTbDZFHtUSdSrsEVd1d2Jdes2x31uEJoxsC659vjnzoByv6TtSEsqlpWTSjIfEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMB6hp225yhtFGB7XEXOGyBgkg52TF/Qbg8Onnggnd4=;
 b=vWMfyp7XPaegr1I1/cd4toYwQVVq7xf0fwI1tnhRxvHL2QUibDNNY4IWCq8EnJ581iYdLroIqzX5jPGTuO20nyFC3e929dwJcoUxG7Q7WvFG5D9DP9t/tta7PIMKjojfY6fODwADWluRxPAuLm3QCh9Fev4jKKFFtGuUTxd+8KQGpfmr2lUL1aAwu7OeasmyWvm+WiUJzhQqS4+t/wMrxua+xbmnsRCwvlAZIk1ARvvj2/gs9bD+19xLP2UnuiqmGU03WJyB4IW1NnH/RxNSPLq4xq7epS9k+hOR9yN1kOThrUGrFZm8sLK7s4sHL3e7Q4uOye8eX1Bx0QqFXFPYgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by DS0PR11MB8072.namprd11.prod.outlook.com (2603:10b6:8:12f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 05:22:16 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 05:22:16 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Gupta, Varun" <varun.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v3] drm/xe: Guard page-fault worker with runtime PM check
Thread-Topic: [PATCH v3] drm/xe: Guard page-fault worker with runtime PM check
Thread-Index: AQHdPoXiTZWbSlATIEqKgj6CipWRlbbClGsA
Date: Mon, 7 Sep 2026 05:22:16 +0000
Message-ID: <DS0PR11MB871808AD4CE57A07A12DF1D081B22@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260907050011.497181-2-varun.gupta@intel.com>
In-Reply-To: <20260907050011.497181-2-varun.gupta@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|DS0PR11MB8072:EE_
x-ms-office365-filtering-correlation-id: a9dc2e38-8aa4-463b-9a2a-08df0c9ffb07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|38070700021|10067099003|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: Agx+Ye2EJDbVTGnchmriNW32atX/3/qd2tx/dxJSZw2CqCaTjXNSoQXg1L0H9lloFigWdphDb6QmPvvcv27X9Lx5Ozjp/CmQBD6BIh/JjzkFF8hOq29mJucl2ijGIqh1CpNN8dcJ98kQhW1joQQ/9SdGjfFwSRHX8Xd5N5d5R4hOeDN4XcoM43lVruzTW2A0p3igfR9IxuUWvpN19a+5auAYYhxVfDI58vXSUsEioa2QWGwMG/RqFNYrtsD2wONFpzWwLvPZJSTrgX+uufPlngnrfq3KFs38wrk0uaT1I5/vboMvb6rm300xqZ+9s3MEEvi3kOhuBkY83JsXd2iewhwYx46kMe4PnnpS3pqPla3Eq2SA8oY8GbPIQ4D39L9rx9bafObHtGh+dBSE7b/R4wDy9YHa3acWu74P2lAcZvf4OsEk4EjKEEou4Ta/u8OLmom3BSER5E+53o2rQ2QkcS6SXjF85jjdRYiY0aK67ktH+KczS31rtrKiKEk7Fjuhal0RXxvl1kvcaD6W1z0h+n3YNRtNWy6x9Ah9EOmz8YrPnULSHxqvde05pSkcJON2M1x5l4WFdgvhebgPTcSrmptTs8fv1Z68eRXj9nINJQujlK68AubNoY+bw4Lp7LU//DsDiSQfDlE87C1cG7pWM9iQjhoH+eIVx34NQW6cLGoNDtaE7FjaB5dALRg6aqrVCdJSnZbJiaTQl/Oh90GBtTfRXiLXCuY+Si2AcCPZOgE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0Y5NUFtWUl1ekVYNTUzUTRGQkg2aFpvT3NwV2JQSGJSZzgzQ0t2SSszWjh4?=
 =?utf-8?B?MzZHcWljYXhwOEhGeUxyZDZWRWpGZUJDQ1MrVUdXWSt3RTJQQllSOXJwR0Q3?=
 =?utf-8?B?R3ZNVU0zQi9VTVJMR3VMV0UxQzBreUsybmJyVHg3U3RRRVVPbWJTc09ZV1lu?=
 =?utf-8?B?b1hjK2lTR3QxdnVHTC9PSk9XSUlzd29yaWE0VEtqOXZmc2NIVmZZQWR0U252?=
 =?utf-8?B?WktBWFhlUFg2SDVMTlp4M2lCamd2MFZXRHJiTVhUa2E3blpWYk85d0h3SHVr?=
 =?utf-8?B?VXlnbExMU2RVMFUxWEdCYVczRHBleEpPaUJKU3YxcitmZEc2RlUxcUR3Yjgx?=
 =?utf-8?B?cGlqaitveDBobHlybjdoU1dlSUhvR0RISUZlY2xlZHNnNUhuT3A4b3NFUnRZ?=
 =?utf-8?B?TW4yRHFLSncxNEMxVGY1dWk0MXdyVDRQVlQ2cjNDS1IvZXlkTHd3djljUzRh?=
 =?utf-8?B?VHc4NFduMXE2M0xTN2RnRnZlbmUwbjZVaFE1TEJ6RDYvSkJTa3dObEprcTRs?=
 =?utf-8?B?U3dPV242a2taMUUvcGJuc2x3b0podElxZUZySU1tb2JBellzeHJ5TVBQcThG?=
 =?utf-8?B?YTErSTBzOUt6eVZYYmpFTFp0Mm5jMGorQ2tsOFNmd2FIS2ppZjk4UlR4MlUy?=
 =?utf-8?B?MWhMcUFhOStEbXBkNGgwN3hHc2docXZVZThKYi9jQURDMmcxWVF6blozRVlk?=
 =?utf-8?B?aFd1b1BYZW5icVhVeDJTbTcwUXZidHFGQWFMdGlscm5BNnVCMFJWZzE0eTZM?=
 =?utf-8?B?aDgzVkgyYU9BZlkyQTJWeEo5Z21sdndUVTgvVGxiczRZNTFXcGo3R0oxbzFz?=
 =?utf-8?B?cTlmQUtRaVVobVg2V3RJR20xREVLSHRrWmUrOWxIMTNwSHhGVlFTNlpDYkZP?=
 =?utf-8?B?VVV1bUtsb3pvNG10TG9OTXBLV016NzVITEJHTFg3S3FPcFVKcFNkUkZEQXM5?=
 =?utf-8?B?ekxQUUI1SnJsbDY5UFU3ZXJJenBBVDcrWTRGUVlXTXZwRnBTS2kwV3FHQnh1?=
 =?utf-8?B?SDZtYllmUTdxVTdXelVlYmZkejUwSllnOGFtSVpwcU5waUNtSi9JYUgyQ1hZ?=
 =?utf-8?B?Q0h6a2dZYkthRjk5eW9ROTBIM1BRQ2dTUDFDK1o0b1V4RU1jcWc5Y0IyODZ4?=
 =?utf-8?B?bDdSUW5DRk5aNGRNNC9jb05lZlNrTUE2YjBubTZnZUlHSUJ3emFxVGJnZU5H?=
 =?utf-8?B?WC85eW9qZVRHSGh2VkF2dk5ZWHB5Tk9Bck95L2w5Y1FncWhMWi9OOWhoNW4r?=
 =?utf-8?B?dHBMTXVxOS8zaWt3VFNUcnZrUEVIK1RYVkUvQmQ3Y2FhL3RXR09FaW82MXRU?=
 =?utf-8?B?bnRySEt4dW1aRzlwWmd3WWZpZlh3TDNyczdJRHg2VmpSRVorZXRNUWI2UDAy?=
 =?utf-8?B?MUhyMkROZkJueUF2VHNsNTdJR2taMHYzbEJYOUlhTkFjYXZ4REJ5akRDTFh3?=
 =?utf-8?B?eEJYYTJlSTJsamVlOXV6WVJDdTRrOWZsbFErTVJYUWNqL1JOcXBvMkRPOGdq?=
 =?utf-8?B?RzVHOC9rTFFMZlRKOXVNMDJwNXppTU82MFVKeEtHVTNKVGlUYlFRYzkzSFJC?=
 =?utf-8?B?MnFoZ29xeit6dnpIb3FObjY0TGVraTBwNm5ZQklCQkplTURDMS9PUzlZRFhL?=
 =?utf-8?B?dmdHUlE3ZkNkWWlmSERUanhlQ29hck9jeFhtdm42U2luSWlkSWpNWnZLQW42?=
 =?utf-8?B?UDAvdmdvWmVPZDgwZ3I3eTN1aldVQjNDa09JQXlWMGZoenRiTlZFMWxLQWZR?=
 =?utf-8?B?c0kyQ1JoUFFLRktFTUEzdURXblFITFlORUxhRy9Zb3lkMzlDMDdPaTlrdCsw?=
 =?utf-8?B?OTJoayt3VS90N0dVa3NJQ1JxMkx5cGUxU3RUWXFPZDJqVVVYUG9VbzhUaFJ4?=
 =?utf-8?B?V3kvejRtbDhYYlNWVzFWcXZyRzZhcXN2WmJUQUVsazRnbFFZY1J5WjVrWXZq?=
 =?utf-8?B?eUozWThJSWttUjlESnRvUVJ6NVZBSTZjekM1REJ6VmVNK2dkc0xnU1ljZUsx?=
 =?utf-8?B?aGZqaXN5SC9WWU4yV3A3Umpaa0NtaCtkbXh0MGNCV0JtRFBna3lQRStKZXQ1?=
 =?utf-8?B?aVRNUkNmeG1ON1hEVDAweVJueVRQeE0vVWp1QlZKNlk1cXprWlRUUmVCNUtM?=
 =?utf-8?B?SDF5YlJzbGJneHh6T29pMHViY1Y3cXdlN0UyKzVvTXhoS21HS2ozZmhWR2lQ?=
 =?utf-8?B?WHRudGlBNnEyZytSTzJzRnBkaHNRYkRUZ05pYkRBZ00wTDFqOFBrbW1Bby96?=
 =?utf-8?B?WEpYQmQ3NVJrTnFydThISkNteFBJbW5WVHJxczQzc0g1Zzd4R3lCeWFzU3cy?=
 =?utf-8?B?N0lOVWQ4eEcrTDVocFNxVEd6UjF1YzQvVG9VdWNuQkFjOEhWajhTdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Ziuwt/JktmOr7xJeWdQX59BtSwW2rq9Oxa4tmfMNGkqLcxLWBtUxEQYZnYogjbktaMKG0ffCOjv7YTA4igy0LYJm/zqcSJLRxh0RaptFMSsu0BOcRFBzkTI5plmS2A6d/wfM88ydf76CmxgIwNQ5wxf2ZwMFuMMGKJjxbvO5o4p7OuDnzPPyU29wXukGVlUkQyBmI+4E11CfB5Fh3OajgNyMTlJPYB1JV2+5yTtbA4OqEg0l2QKFixwppe5F7xGd/p09fSn8Z0m86TtfzGwGwHlMbPQ+5Kt4jpnucXB2osdRaFvIcBqw+gkdPuqh0zYCXB5fSRNIA6HD2PkI81TEQA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9dc2e38-8aa4-463b-9a2a-08df0c9ffb07
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 05:22:16.0384 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /hO3v4o7OSl10Wijw3M6Y9oXVbR25ccEnNdN8zADmNQl3QNR8xRlkyVV8J1QfBHSJb2d4vYsVK6i1ShdqnRifrwBD65Bp6fxA8WDSAsSGs0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8072
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgVmFydW4NCj4g
R3VwdGENCj4gU2VudDogMDcgU2VwdGVtYmVyIDIwMjYgMTA6MzANCj4gVG86IGludGVsLXhlQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBbUEFUQ0ggdjNdIGRybS94ZTogR3VhcmQg
cGFnZS1mYXVsdCB3b3JrZXIgd2l0aCBydW50aW1lIFBNIGNoZWNrDQo+IA0KPiBEdXJpbmcgVk0g
dGVhcmRvd24sIHRoZSBWTSdzIHJ1bnRpbWUgUE0gcmVmZXJlbmNlIGlzIGRyb3BwZWQNCj4gYXN5
bmNocm9ub3VzbHksIGFsbG93aW5nIHRoZSBkZXZpY2UgdG8gYXV0b3N1c3BlbmQgd2hpbGUgc3Rh
bGUgcGFnZSBmYXVsdHMNCj4gYmVsb25naW5nIHRvIHRoZSBub3ctZGVhZCBWTSBhcmUgc3RpbGwg
cXVldWVkLiBXaGVuIHRoZSBwYWdlLWZhdWx0IHdvcmtlcg0KPiBsYXRlciB0cmllcyB0byBhY2sg
b25lIG9mIHRoZXNlLCBpdCBjYWxscyBpbnRvDQo+IGd1Y19jdF9zZW5kX2xvY2tlZCgpIG9uIGFu
IGFscmVhZHktc3VzcGVuZGVkIGRldmljZSwgdHJpcHBpbmc6DQo+IA0KPiDCoCBBc3NlcnRpb24g
YCF4ZV9wbV9ydW50aW1lX3N1c3BlbmRlZCh4ZSlgIGZhaWxlZCENCj4gwqAgV0FSTklORyBhdCB4
ZV9kZXZpY2UuYzoxMjY3IHhlX2RldmljZV9hc3NlcnRfbWVtX2FjY2VzcysweDExYy8weDE0MA0K
PiBbeGVdDQo+IA0KPiBBIGxpdmUgVk0vZXhlYyBxdWV1ZSBhbHdheXMgaG9sZHMgYSBQTSByZWZl
cmVuY2Ugd2hpbGUgaXQgaGFzIG91dHN0YW5kaW5nDQo+IHdvcmssIHNvIGlmIHRoZSBkZXZpY2Ug
aXMgc3VzcGVuZGVkIGF0IGFjayB0aW1lLCB0aGUgb3duaW5nIGNvbnRleHQgaXMgYWxyZWFkeQ0K
PiBnb25lIGFuZCB0aGUgZmF1bHQgaXMgc3RhbGUuDQo+IA0KPiBUYWtlIGEgcnVudGltZSBQTSBy
ZWZlcmVuY2UgYWNyb3NzIHRoZSBlbnRpcmUgcGFnZWZhdWx0IHF1ZXVlIHdvcmtlciB0byBzYWZl
bHkNCj4gZGVsaXZlciBhY2tzIGZvciB0b3JuLWRvd24gVk1zLg0KPiANCj4gdjM6DQo+ICAtIE1v
dmUgUE0gcmVmIHRvIHRoZSBnZW5lcmljIHhlX3BhZ2VmYXVsdF9xdWV1ZV93b3JrIHVzaW5nDQo+
ICAgIGd1YXJkKHhlX3BtX3J1bnRpbWUpKHhlKSBpbnN0ZWFkIG9mIHRyYWNraW5nIGl0IGluIHRo
ZSBHdUMNCj4gICAgYmFja2VuZChNYXR0IEJyb3N0KS4NCj4gDQo+IHYyOg0KPiAgLSBIb2xkIFBN
IHJlZiBhY3Jvc3MgdGhlIGVudGlyZSBiYXRjaCAoYmVnaW4vZW5kKSBpbnN0ZWFkIG9mIHBlci1h
Y2suDQo+ICAgIFRoaXMgcHJldmVudHMgdGhlIGRldmljZSBmcm9tIGF1dG9zdXNwZW5kaW5nIG1p
ZC1iYXRjaCwgd2hpY2ggd291bGQNCj4gICAgbGVhdmUgd3JpdGVfb25seSBhY2tzIHdyaXR0ZW4g
YnV0IHRoZSBlbmQgZmx1c2ggc2tpcHBlZCwgYW5kIHNraXANCj4gICAgY291bnRlcisrLCBkZXN5
bmNpbmcgdGhlIGNhZGVuY2UgY2hlY2suKEhpbWFsKQ0KPiAgLSBBZGQgYSBjb21tZW50IGV4cGxh
aW5pbmcgc3RhbGUgZmF1bHRzLihIaW1hbCkNCj4gDQo+IEZpeGVzOiBmMjg5Zjc4MDcxMTkgKCJk
cm0veGU6IEFkZCB4ZV9ndWNfcGFnZWZhdWx0IGxheWVyIikNCj4gUmVwb3J0ZWQtYnk6IFN6eW1v
biBNYXJraWV3aWN6IDxzenltb24ubWFya2lld2ljekBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYt
Ynk6IFZhcnVuIEd1cHRhIDx2YXJ1bi5ndXB0YUBpbnRlbC5jb20+DQo+IFJldmlld2VkLWJ5OiBN
YXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJz
L2dwdS9kcm0veGUveGVfcGFnZWZhdWx0LmMgfCA4ICsrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3BhZ2VmYXVsdC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhZ2VmYXVsdC5jDQo+
IGluZGV4IDJlNDE1OTk1ZjA2Ny4uM2U4ZThmN2Y1ZjQwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfcGFnZWZhdWx0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3BhZ2VmYXVsdC5jDQo+IEBAIC0xNyw2ICsxNyw3IEBADQo+ICAjaW5jbHVkZSAieGVfbG9nLmgi
DQo+ICAjaW5jbHVkZSAieGVfcGFnZWZhdWx0LmgiDQo+ICAjaW5jbHVkZSAieGVfcGFnZWZhdWx0
X3R5cGVzLmgiDQo+ICsjaW5jbHVkZSAieGVfcG0uaCINCj4gICNpbmNsdWRlICJ4ZV9zdm0uaCIN
Cj4gICNpbmNsdWRlICJ4ZV90cmFjZV9iby5oIg0KPiAgI2luY2x1ZGUgInhlX3ZtLmgiDQo+IEBA
IC02MDQsNiArNjA1LDEzIEBAIHN0YXRpYyB2b2lkIHhlX3BhZ2VmYXVsdF9xdWV1ZV93b3JrKHN0
cnVjdA0KPiB3b3JrX3N0cnVjdCAqdykNCj4gIAl1NjQgY2FjaGVfc3RhcnQgPSBYRV9QQUdFRkFV
TFRfQ0FDSEVfU1RBUlRfSU5WQUxJRCwgY2FjaGVfZW5kDQo+ID0gMDsNCj4gIAl1MzIgY2FjaGVf
YXNpZCA9IDA7DQo+IA0KPiArCS8qDQo+ICsJICogQSBsaXZlIFZNIGhvbGRzIGEgUE0gcmVmZXJl
bmNlLCBidXQgYSB0b3JuLWRvd24gVk0gZG9lcyBub3QuDQo+ICsJICogR3VhcmQgdGhlIGVudGly
ZSB3b3JrZXIgbG9vcCB0byBzYWZlbHkgZHJhaW4gc3RhbGUgZmF1bHRzIGFuZA0KPiArCSAqIHBy
ZXZlbnQgYXV0b3N1c3BlbmRzIGZyb20gZGVzeW5jaW5nIGJhdGNoZWQgQ1QgZmx1c2hlcy4NCj4g
KwkgKi8NCj4gKwlndWFyZCh4ZV9wbV9ydW50aW1lKSh4ZSk7DQo+ICsNCg0KTEdUTSwgUmV2aWV3
ZWQtYnk6IFRlamFzIFVwYWRoeWF5IDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+DQpXaWxsIHdh
aXQgZm9yIENJIHByZS1tZXJnZSByZXN1bHRzLCBpZiBhbGwgbG9va3MgZ29vZCwgd2lsbCBtZXJn
ZS4NCg0KVGVqYXMNCj4gICNkZWZpbmUgVVNNX1FVRVVFX01BWF9SVU5USU1FX01TICAgICAgMjAN
Cj4gIAl0aHJlc2hvbGQgPSBqaWZmaWVzICsNCj4gbXNlY3NfdG9famlmZmllcyhVU01fUVVFVUVf
TUFYX1JVTlRJTUVfTVMpOw0KPiANCj4gLS0NCj4gMi40My4wDQoNCg==
