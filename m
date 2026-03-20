Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB33109319C
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 09:21:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDFE10EA93;
	Fri, 20 Mar 2026 09:21:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pine5jI+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C68D10EA85
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 09:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773998468; x=1805534468;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j7ceHehqm7tleH+hEN2Ktgo4cf54C3aSXt30p4nftLE=;
 b=Pine5jI+gCc76pDK4yPYH569dIIz1aW9dCekbtaJFXudzWLCBXJAfD+y
 TaLO+h8BKBNvE7UVwN35vTM5tBLVjaA9IEO41IUJVwCUpKF26kXhB5Mq/
 ec5h81NL0qkd58vACb01D7Sejo4pfDqXTTE/SAjJw7p+AW3HqZLxoKShI
 WisVV0iHEcXSsjqMSHT7SOp1OEW++mpNPL75INd0SUOyfLveVdX76yn8M
 uA8yDVkZRcvOs/CpF14t7p3Si/nwy6lpSIVqfK75gdG6cm4XS9VMWuNVJ
 7U25qqcJfiTZX0nf7nhibUqdbqPHg9ThicdTA+32HnSGiQA7qq8XMx2w8 w==;
X-CSE-ConnectionGUID: B55FSQspRZiDv2UQ0LaV4A==
X-CSE-MsgGUID: hAzQ7LzyTECSFgEQX1f7Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74988655"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="74988655"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 02:21:05 -0700
X-CSE-ConnectionGUID: GJ+BQOJlTpSAUgwZD/tFCA==
X-CSE-MsgGUID: qjybCRoIR0GGB2+mtzJC5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="222325432"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 02:21:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 02:21:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 20 Mar 2026 02:21:03 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 02:21:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MY+a/SCX8gMfuhrrW9ulPi9hbC7IIkxr/Qg3Lvdclql/YA6NSkbsIGMhQgStM6BH0ZDS3XTzJGdagC7G/ztDjDQayA5D1inQlAPxw6/pf4ZCb4ITz3fJAe7GsDijjXoceRT2JjU188DRhVrxL109+5fXHwRoVo/YkbdHtssFxp8whJP+1Bvle/7PrquzKw0NlNdH4C4t7gIhBbfcS50jHlJsamWWWVbkIh5ynfuvHNJ9PY2IuqDY4VuxOChOELJ8tzZfIhDd15GONWhcxPJ+a3mS49vsK8i+RHMtNNneXOIhBCwmRTYr3oC/2fcH3/2SwOfhsCfG4XebTg5X1ytVgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7ceHehqm7tleH+hEN2Ktgo4cf54C3aSXt30p4nftLE=;
 b=mOSt6cCmINzC8d3ertA4xXha9bXm3/YC8m04/kyr00hY6pGIm0exas0B8ocm+51toEEzZQjeIMD4XwMAOmZnRAI/BzkQJS3/OLLWIpQNxfGYhCgCq1jfuPavujjpmRxvWY+h49IPICoqM/Zz73KSxIUGiuzaM4bSntfGF38jNH179UbeJ8ffYoDzdOCgF59ZuSK5Gab1S+ANmp3I2RNC13tPYckpTqYClQjtdRuNZGRuMZsCzoUKU4y4ud9KElXwi2Gnj53GoRW50dIqUz5pCuWVjbUaBkpxGWNoLnaF9FJHmuNN+p9TnSlZHY9ZUVaXx0+e920wbGGgKF2iwJ1Z8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 DS7PR11MB8855.namprd11.prod.outlook.com (2603:10b6:8:257::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.9; Fri, 20 Mar 2026 09:20:56 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680%5]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 09:20:56 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "kernel-dev@igalia.com" <kernel-dev@igalia.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, "Ruhl, Michael J" <michael.j.ruhl@intel.com>, 
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: RE: [PATCH v23 10/12] drm/xe/display: Respect remapped plane alignment
Thread-Topic: [PATCH v23 10/12] drm/xe/display: Respect remapped plane
 alignment
Thread-Index: AQHct4g6yEML6rZ/c0mqcsb1xaUJy7W3Jgig
Date: Fri, 20 Mar 2026 09:20:56 +0000
Message-ID: <DM4PR11MB636071EEE02758F16A225D93F44CA@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20260319100707.60157-1-tvrtko.ursulin@igalia.com>
 <20260319100707.60157-11-tvrtko.ursulin@igalia.com>
In-Reply-To: <20260319100707.60157-11-tvrtko.ursulin@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|DS7PR11MB8855:EE_
x-ms-office365-filtering-correlation-id: fa4717c9-f785-4b6a-ab01-08de8661fdcc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: bRstXbJOlv2RHMYgZ0cnGWSTBNRIYFSyKf3RXgoKMb4d9u4FA2wXDabfVz+X8jLc3A7BuV/2tpcJDC/CU7IRcFivqiFIQrV4ftQVxStw+q162UCeno1TTLOfdCAEHdLBmh60mmuy6gFyfkN8hpLIzSyhmf1yehgJPlhjIo034tv2TUd51AhatpXtzIE3TxXS7nsjf6mVqykqiFH885ja5Z0Fpw8mLBzTeWTaZlLM7DBL0fJWa1RB+jZDeS6um9g33asyOG18VLJvPxC5Npe1HzolmljxN9hxanZa/dXWIPv/zDlsIIltOKutm7ysO/B++6wcXY8M85Uy4WMxxiMjYKKahq0mDncRkGkswoALQpsUFMSNxQODgau59G9YqZ7iR51M4iVB0gLTNDHig73pKTJIgpFfQ87QjUkdm6d0+409xYCjN87KxeLaMiThzm/oxUoE60rSiQfBkyHAvLzupthZpJ2yw8eq7UgdKHRZUGP7RVfIE1ZwNHJHhvL5BlZOSXt0OZxGHSm0wzvsQTbAemmwolfDa+pW48lHnGjyPaANjSquLrbFh1MEQoDkpuKRoCQuFQlTtT04zmhn6PelFxwwPKclGz7VM8wmbsbQgI1RkWnsHkjeqY+ub8sZyyuA2Sr3NOxwX1l4moxLe5khWvSNwUZizne54vJoVEbTfRV2KiXrRAkDscNYnA7CWLrvD6qCxhcFtToWCOE2qzcRSiC8/ikVABRjfDSN7c+mwH09eS+L6ZEIzniuxq8TkffryPZR6dD+CTO3UzifzLDSL1D+CZ4jO7Mw7oMTyRRo3nw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dURtTlBLcmNWMVUyY2tCQktvTnhOWUgydHFranNNRDNTbFRsdDdrOW9wdXlE?=
 =?utf-8?B?UGh5dTRyTDJObHl6cWJJWDJMYURNVmdwSTB6NUZORFFqVXlUMURjNmptTVV6?=
 =?utf-8?B?bHpucnFNU1RrRlk3WExNVlk0dFRNMTV0QmtZVDN4UGd1WTRYLzRyL1JxK3hQ?=
 =?utf-8?B?amdpdWJ1dVhZMGZWTlZlVVR4S3BFUmR2QU1HdVBGV05hdE50Z3dRL0tyUER6?=
 =?utf-8?B?RkpaTGdaWlpwb1BUakt4N3dZZS9nRGwxcFMwVU40SkxVWGkwM2U1Um9CNmY2?=
 =?utf-8?B?YTl6ZUtRSGU0cm5SczBRTDZLR1RPTHN0NlZTcldUL1E0TFZTdnBiMnJiOWtt?=
 =?utf-8?B?aGt3QWVTZ3V1UjRmQWEzRkp6TXd2dDhxUHZseWV1eHpUVHVBYnFvRUxmSGR5?=
 =?utf-8?B?cW42ZnhQWDRDbjB0amU2OEpscFIvSCt3azYxaHorSEFaZ3cyV1hyUEZMbVNp?=
 =?utf-8?B?TXBxY0RERG82ejZFcEVySEhWVnVqVjVLVlR6TE5FTU1GTnkrWHNsLzdOeEc0?=
 =?utf-8?B?Tnd3ZGR4OE4rU1A5Z2JEeEhhL296Y2dES0UyejJ5aG1ZWXFBRkFoTGZ6MStZ?=
 =?utf-8?B?amQ1T0pyaXE5QXlsdnZland2RWp6eGtNOEcwUWJTZE8vUkZmU3FNcmdsclAx?=
 =?utf-8?B?dWNlbGYyYzlUOEJuNUJ6R2JRdlJ5VzM2a0YrR0thK1I2RFhqSEJxYkRnNDdm?=
 =?utf-8?B?L2RNbWFzUGV3RFpwbDU4WmwzZmpMOWVxNkZZM0l4SnJmbmx1d2FNOTlsMlV2?=
 =?utf-8?B?MURzL3lCdEpxQkI5VjJ0K0pKcnJDUi9GTEFkQUZ5SFllbndRZDJzMktWU1dD?=
 =?utf-8?B?RDk0L2U3QjFib1BOY1VKdnZuQWVGNUhsODhDOFMweXVuWWgxejNEbnVoMy9Q?=
 =?utf-8?B?MmNVakRrUkZjRWhBeXJHSEFSdVMxczBYOE1DczlGOTZPWTdlS0NDUVVhUUVn?=
 =?utf-8?B?Zk94UlIwZ3Zyckc2d0Q4akpwa0dMdE1lRC9CMndZanZqNU1kRnJzblVtOXlq?=
 =?utf-8?B?YmpxdXl2U09DL3I4RlF5WGs0V2pGRWlnM3BGMXd0cktIQ0ZibHphd2IzVUtB?=
 =?utf-8?B?RVJENzYyb3ZtbDlOYzN6SUd5NExJWFZHRlppa3JhR2lWUWtWL1lyeUtON3V2?=
 =?utf-8?B?L1BDbkNmUUdNSUNwVUhPMEJlWnd6bmNjbE5BSGhJUkFpYkpUTS9ENHAxVHRU?=
 =?utf-8?B?Q2lBdnBOb1k4S0NoYVpkNjQ1VDIxbFlkdm5BL2NxWlRVWEhZdThIYkFwWURE?=
 =?utf-8?B?VGxGTzJhMU1hbEJZVER0WTJHeDNTR3BBMXdDNEVRUGhSR3dFM3hINGlXeENx?=
 =?utf-8?B?QVA0REhQdGMwRXdiZFJ4dnRwM3U0NlIyMFAralJ5QmZnWTI5NWticFZZUzY5?=
 =?utf-8?B?NGJ5em56cHp0NXBXVGVIRzFXa3U4Y1AwVFppeWJwT2d5NENZbERDc2ZWb0Qz?=
 =?utf-8?B?YjF2clZpcFV1VDUvcTFnSzRJTjM5NGNKa21FSGlJWStycld1T1RNQmRqT3lR?=
 =?utf-8?B?VEVvNjVmbXZsejVWOXZjQnlXdklMWjZlNDgzS0NpdmMxa0x3VDBRK2UzN0xX?=
 =?utf-8?B?REdqenYvMnplYXplYmFmLzdYSkNQYjhyeWdxOXNUVWRsek1ZVEIvMldlN25x?=
 =?utf-8?B?dkNaWit0Wk8rT3lnb3lrUHZKR0ZnQVArdGxRbUc0N1JObGNXR2NXL2hVclVH?=
 =?utf-8?B?WVBqeVZUVTVEc3JMdFNlb1A4WjlOSHExWkxRNFpMVktUMjFydUk0YWI1OWdH?=
 =?utf-8?B?MkdLK0VJMVU3V3VjQmwwZTdSeHJveFlSZ1A3T0krb0xzMXZZSUtsYmdwcGZO?=
 =?utf-8?B?SDFIdDRnaE8xUHNmRW9IT3lJcktlMHNwRFZOdzBNOEU4R0RXV0FMeHVsOTd6?=
 =?utf-8?B?K0lJQXVqTk5jYVZWcmJ3cFB5ZE1FSzBTSkxyNm9YYlRmamp5WVRNODl3SXI5?=
 =?utf-8?B?emh4MGZnLzI2VDhzVjNQbGVISUlrL2xCN3NudWhMTWpKMDhUNWkrSmFZTjhh?=
 =?utf-8?B?d1BQcVpNRDFUSDhHZTdoNFhoSHFTMmpQNm1FbXkrRWpNUzFKclRwdnZ4VWpD?=
 =?utf-8?B?SnVxTnVVWFlMSWExSTIwbHl0TC9UcTBlYVltZlJ2L0RXY0dEenVFSG5DTHN0?=
 =?utf-8?B?N0NqRU41cWE2cEdHeVZFTDZTREhnVnpQYy9HVWgzbThJMUk1c2RRalBtRFc4?=
 =?utf-8?B?SXB6N09PWFk2UFEzZ0YwclFhRjJDR0dEemxhTExEZmsvY3RJcEI2SHVDbDJ6?=
 =?utf-8?B?MXplRGQ3U1pQaTQ3cUpDR3VMa3dDMTlPN1hZOEVqNUJpeENDUGo4RXVkTmI2?=
 =?utf-8?B?YmNiN2hiRktaU1JqaFJhZEUzN05ZWm81ZW0zVmswT2lJdWhUZmtXdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: t+x+qpIuTVrsomx20j0tOhkq6Hsohu+XWTV4RpWyayHOzzL2ZVIJcwGYHGQK//EL0vN9tlTN/vnSBu5EtrMaoD+loLUtPJoLQcsk9nAoUsyj+43FuQp4QpAynXj7fDG4nQtxLnnmjC0ttSVq3Qg4swtpL3U0+swBjaSdajfJnSTm/pduYtdBwCAOsEmDbJalb0dV9oD/HPmRr+PPdaIaZniujMzJ96hlu4QB5Z0IugbOalP4BuXjXW9MkRbLbR34RXWgjP1ZTfr1df5YGurLEpRybg1GmGHLkQBo8rGW+WVDLbGEGwr6RDrgYuqok9v4c4gTUT/4RHhoLyrXRZ7p2A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa4717c9-f785-4b6a-ab01-08de8661fdcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2026 09:20:56.0697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +7+HD24jDAmu2pTXr5WWP0D7AkP+P5pwi7j87xCu0G2QAAue4m2lXpbbyhfcLntFZrFBoldxUOUioK7qU593Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8855
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVHZydGtvIFVyc3VsaW4g
PHR2cnRrby51cnN1bGluQGlnYWxpYS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAxOSwg
MjAyNiAzOjM3IFBNDQo+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6
IGtlcm5lbC1kZXZAaWdhbGlhLmNvbTsgU2hhbmthciwgVW1hIDx1bWEuc2hhbmthckBpbnRlbC5j
b20+OyBUdnJ0a28NCj4gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaWdhbGlhLmNvbT47IEp1aGEt
UGVra2EgSGVpa2tpbGENCj4gPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+OyBSdWhsLCBN
aWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT47DQo+IFZpdmksIFJvZHJpZ28gPHJv
ZHJpZ28udml2aUBpbnRlbC5jb20+OyBUaG9tYXMgSGVsbHN0csO2bQ0KPiA8dGhvbWFzLmhlbGxz
dHJvbUBsaW51eC5pbnRlbC5jb20+OyBNYWFydGVuIExhbmtob3JzdA0KPiA8bWFhcnRlbi5sYW5r
aG9yc3RAbGludXguaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIzIDEwLzEyXSBkcm0v
eGUvZGlzcGxheTogUmVzcGVjdCByZW1hcHBlZCBwbGFuZSBhbGlnbm1lbnQNCj4gDQo+IEluc3Rl
YWQgb2YgYXNzdW1pbmcgUEFHRV9TSVpFIGFsaWdubWVudCBiZXR3ZWVuIHRoZSByZW1hcHBlZCBw
bGFuZXMgcmVzcGVjdA0KPiB0aGUgdmFsdWUgc2V0IGluIHRoZSBzdHJ1Y3QgaW50ZWxfcmVtYXBw
ZWRfaW5mby4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJz
dWxpbkBpZ2FsaWEuY29tPg0KPiBDYzogSnVoYS1QZWtrYSBIZWlra2lsYSA8anVoYXBla2thLmhl
aWtraWxhQGdtYWlsLmNvbT4NCj4gQ2M6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxA
aW50ZWwuY29tPg0KPiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0K
PiBDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29t
Pg0KPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVs
LmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9mYl9waW4uYyB8
IDE1ICsrKysrKysrKysrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL2Rp
c3BsYXkveGVfZmJfcGluLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9mYl9w
aW4uYw0KPiBpbmRleCBlYWQ3MGVlNDgwMjguLjIzYTdlYzQxZjAxZCAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZmJfcGluLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL2Rpc3BsYXkveGVfZmJfcGluLmMNCj4gQEAgLTgzLDkgKzgzLDYgQEAgd3JpdGVf
ZHB0X3JlbWFwcGVkX3RpbGVkKHN0cnVjdCB4ZV9ibyAqYm8sIHN0cnVjdA0KPiBpb3N5c19tYXAg
Km1hcCwNCj4gIAkJCQkJIHBsYW5lLT5kc3Rfc3RyaWRlIC0gcGxhbmUtPndpZHRoKTsNCj4gIAl9
DQo+IA0KPiAtCS8qIEFsaWduIHRvIG5leHQgcGFnZSAqLw0KPiAtCWRlc3QgPSBBTElHTihkZXN0
LCBYRV9QQUdFX1NJWkUpOw0KPiAtDQo+ICAJcmV0dXJuIGRlc3Q7DQo+ICB9DQo+IA0KPiBAQCAt
MTAwLDYgKzk3LDE4IEBAIHdyaXRlX2RwdF9yZW1hcHBlZChzdHJ1Y3QgeGVfYm8gKmJvLA0KPiAg
CQljb25zdCBzdHJ1Y3QgaW50ZWxfcmVtYXBwZWRfcGxhbmVfaW5mbyAqcGxhbmUgPQ0KPiAgCQkJ
CSZyZW1hcF9pbmZvLT5wbGFuZVtpXTsNCj4gDQo+ICsJCWlmICghcGxhbmUtPmxpbmVhciAmJiAh
cGxhbmUtPndpZHRoICYmICFwbGFuZS0+aGVpZ2h0KQ0KPiArCQkJY29udGludWU7DQo+ICsNCj4g
KwkJaWYgKGRlc3QgJiYgcmVtYXBfaW5mby0+cGxhbmVfYWxpZ25tZW50KSB7DQo+ICsJCQljb25z
dCB1bnNpZ25lZCBpbnQgaW5kZXggPSBkZXN0IC8gc2l6ZW9mKHU2NCk7DQo+ICsJCQljb25zdCB1
bnNpZ25lZCBpbnQgcGFkID0NCj4gKwkJCQlBTElHTihpbmRleCwgcmVtYXBfaW5mby0+cGxhbmVf
YWxpZ25tZW50KSAtDQo+ICsJCQkJaW5kZXg7DQo+ICsNCj4gKwkJCWRlc3QgPSB3cml0ZV9kcHRf
cGFkZGluZyhtYXAsIGRlc3QsIHBhZCk7DQo+ICsJCX0NCj4gKw0KDQpJIHRoaW5rLCBpbiBnZW5l
cmFsIG9ubHkgY29uY2VybiB3aWxsIGJlIHRoYXQgTGluZWFyIHdpbGwgYmUgYnJva2VuIGlmIGJp
c2VjdGVkIHRpbGwgdGhpcyBwb2ludC4NCkJ1dCBzaG91bGQgbm90IGJlIGEgZGVhbCBicmVha2Vy
IEkgc3VwcG9zZS4NCg0KTG9va3MgR29vZCB0byBtZS4NClJldmlld2VkLWJ5OiBVbWEgU2hhbmth
ciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPg0KDQo+ICAJCWRlc3QgPSB3cml0ZV9kcHRfcmVtYXBw
ZWRfdGlsZWQoYm8sIG1hcCwgZGVzdCwgcGxhbmUpOw0KPiAgCX0NCj4gIH0NCj4gLS0NCj4gMi41
Mi4wDQoNCg==
