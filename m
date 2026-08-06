Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BEFC55838
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 06:10:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0855C10E274;
	Thu,  6 Aug 2026 06:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jC0o+23P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CDC10E274
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 06:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785996629; x=1817532629;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fPGjDJ0dHxRPR03c/xB7z83qIIoxVTn8fFSK+F4yqa8=;
 b=jC0o+23PprgZJU7qpObJTd14ZNYpY0so0iWtOOsDHOYscbs8oGNUqQYd
 7broTOit9GxCpnStEFBvmRhFQudQHdphJLL7Cjy0Tyr08O73A8dcNvA00
 WhDcJkh0m+g+YDDpG6yOKodGLxRSuCYkGC2I4rcyEsQT7Zz1MdcdrAnre
 muI9WEznW/Z1ajyGyY2yRAgTZTovptkDHg0AL+RUzdz11g3SxvBtHV+yt
 kPxOyc4k6+SXaG4PaaV6t3u6yBfsj6JWKtlvfmCdljb0pQ9Kd1yxL1wdV
 dJlXAfpAZOwpKmaqmclEt12U2V79xaT26tLjtfHKxjSrgquiJrjKWq2vK A==;
X-CSE-ConnectionGUID: +YQp50tXQWGanb5I/udEGw==
X-CSE-MsgGUID: 0UZzFswaS5KQXOhNFMrsWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="103984037"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="103984037"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 23:10:29 -0700
X-CSE-ConnectionGUID: Io4IkU+1RE+UhIANGx98Ww==
X-CSE-MsgGUID: fXtkDmaPQH2lrnlje5sl1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="262628533"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 23:10:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 23:10:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 5 Aug 2026 23:10:27 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.3) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 23:10:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rb6XysmJ+c8GvUhu8z6GRXuCFCd/BC29vRkmt9zBlk/2Rh9ErceQW8ZKRZyw4TdXtqZljcbOwvOZ2aaFPz2ljAO6HKNGSjP0tInH/MYi1s606EX3fcKQWw+zpCx/Gs6kNhQyi7h7yV4W320utPIIVJjhjQ2BpLCmfOIExuCuhJSLDhb2IB93m+EGKzmlrmXZyDEaw0eej2J/PWw+zgZTKHxxVGIemFxB87IctU/qv7vLLLELfTE3jUga7EDNv3wfLWo3mzvPrzE8wnEXwSvRQyAf+uBHaqOmBR1j72G/8KAcVCBrNXYMSeMhzxml1VoE6UvBTved28HJ2saq4HcY6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPGjDJ0dHxRPR03c/xB7z83qIIoxVTn8fFSK+F4yqa8=;
 b=bhDzSxu5NePCZ1gBR+F/q5L+KNQ3g+Bb7ZmbeIWbFyfU/7JQSk2Q8KRvr43nXS+fZQUHUqGpiCi8zF4IGV9OMMixnT4immify2xc5nJzh1jiOkgMUWuY1pu41FtMWTbhBlfsvrkz85kRdaJAIasZLZSENr3Z/2rnHRsg9JTvHH6zMWoDwZ45839KNmNqchGO9N898lzzoJh7GTns3rWx0f7ROnR7wtqGg0Q70MiEGofPJINs8tdpamG9QxUN3niEUNo7lGrwiXPYGnbYNzU5k5c1LIaQ0yQ6cyHw/+GQvhnHKBLfvKb1ULUTAW3oPMYvZF6ShKMOpWtLIPT8osSLSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 06:10:21 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5%5]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 06:10:21 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH] drm/xe/pm: do not warn about missing runtime PM
 protection after hot-unplug
Thread-Topic: [PATCH] drm/xe/pm: do not warn about missing runtime PM
 protection after hot-unplug
Thread-Index: AQHdH+A3blUlj5trUUqN9S8Ho0aa+LaF//cAgAqNuwA=
Date: Thu, 6 Aug 2026 06:10:21 +0000
Message-ID: <SA3PR11MB81183F6C80A4EF8EF25E4EDDD0D22@SA3PR11MB8118.namprd11.prod.outlook.com>
References: <20260730053635.1515929-2-nitin.r.gote@intel.com>
 <cb07be16-b69a-4ff5-b56a-78050d2e364a@intel.com>
In-Reply-To: <cb07be16-b69a-4ff5-b56a-78050d2e364a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8118:EE_|SA2PR11MB5177:EE_
x-ms-office365-filtering-correlation-id: ef913590-d32f-447c-bfae-08def3816583
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|38070700021|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: iW6TOj8jqPK4ycIDc5gwKqI42h40VUUQ94Zx+eOtUjwzcr1rLaKSY25u9ONy+QlLKp8dnTY1cpjfOUM9ENSpRJITRrZAJbVzCo5KTdoumPSRgX9+m2xH/hKJQEGI64h81MAHtPWvxcNurMPIV1ViMrVHvaGsCZg/I6ZizDETWiR2BAZ8w16KNruTyHGsvSEsASMkEgZm3iwIIywnPlyaxKSRkwWKGOXpcnxZDf9sw/CPmv5Dcm92ucKurmlC392Tct15lN5xc+xxOT4hXhTP/M6xpkgpHXMxAViwortswQzdkouKhRofvszucu5V//28WKFOVI0orbjnWJyklQTMYqaNmBKEl60p39VQGYaUfmSWIggKTsC3Yb6NEgWai0OU7ANpY28Zjt0dl4BLrve1qgLmakvklU3goCDTQiN19sv2jIjDwE1u7pdqP3x9qvTnJ+zXfJcgt02n1p3Ki6vo83xLIFyLpWoznskGQfT7gM+QdJi/DGu7UMkINCcMyo+SiT1fnAXj9Fmh/KG7hQnGIQ4ifMbrxIR/ztjIXRLiIQBEbu3rSgdMYjxeyP/iITmtKChRiXXl9MpxxJiM23jrN7jU7NFsdP7PytUqd54ZWlm49/iQLlIarU/QwRJHFE9Vha3hQw++WVPuRWSKl5a933zH7oI1MZX6XVQbhSGANifBoYMnXvafXGZT/cJsVoJ+uXirFJ9mlyzoJDlp5WjFxIAoSPcCU3YhjV6LN4vsgAo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8118.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVgvV3pkOXpFamJUekFMLzZpZU5ubXdGb1pJcFFEeVpvN3dJeE44WVUyLzBG?=
 =?utf-8?B?Q0h4L2oxZ3ptcGRjYldKMHJrcks5eW9Vamw0bE5HL0RtR2Fxd1BrTWtKakxT?=
 =?utf-8?B?NlZjRHlxVEtTdnJxMlBvYkxab2c3eWJRNGxoT21uRHhMUkc5MWFVTXZZQ3pW?=
 =?utf-8?B?cWkvV3M2TXJ5eXcwZU9VZU9MaWdTOHJ0TTFiU25WbVpsVDZUUVFBZjdVYS8w?=
 =?utf-8?B?dFhKcElwR090RW1MRy96L3RuY3M1ZTZiNUE0VzJIOGdvVThKdTU2blcyaWhD?=
 =?utf-8?B?dysyN2pLU2NXa0ZSYnY3amI0d2paRm92ald4YWV2N2pmSXowQ2Z2a01oSzdj?=
 =?utf-8?B?YjJDckdzZ1hXdnQ5R1p4QTVOcDh4UjcwanZhV2tONk9ibWNneVZyRDZQTVpM?=
 =?utf-8?B?WStVT2pHOWpiRHNvTWNaTThwTm9odll5WHFoRmM4ekVzWDhsTlFPaFZBSjcx?=
 =?utf-8?B?NWMwTFFEb2FCSllMMU5JQmhRZTFvc0NVdVkzeVN4OGh2bWIwZHhHN1FBTmw3?=
 =?utf-8?B?eU5zdDZZK01qcVUwZFlwSXUvVnVSeTkraWs5TXlSeklmK1Y3VndyWjUzZ3BM?=
 =?utf-8?B?ZWJhSmM1dlNMVktRMHp5THRZY3dhS1pCT2tJZFZuNHZmc1l4MFNuU2JOM041?=
 =?utf-8?B?OVVTeEJyUEtESU9adUdxelJKQkh3NFVmanRrV3RPbHNJbDF5amk1NHN1RDc1?=
 =?utf-8?B?b2k4Tnk2aEZ4U09kZytkZTFlZjI1U1hhU3Zadk9wMXFqUkx5azkrL0MwRUhC?=
 =?utf-8?B?UkZCRFAwY1NmYjFrcDYwcGgrL0drWHU1aEVqZ3VrUExpNkgyUWY4dG5nbnpJ?=
 =?utf-8?B?dlVEL1k3UnRRVmhTVFpDNkJlK1dSdEd4U0hJYjhCclFNOGpONkFRMXlIR0Jw?=
 =?utf-8?B?a2NjYkJnSWFobXNGY0ZPeTVtSzJwbDhnb0IxWkJGRnR5OEtQVklBZXBEdkwy?=
 =?utf-8?B?UUFocEZ6RjhOajZCUDRJQ3hwYVViMDRhcGdSY1lTVTFXV29UVVJ1YnduOVlo?=
 =?utf-8?B?RExFNnJYWE43SWlOMzF1RFBmWVhvWlRwdHZuYlhLc1dwYTBPL1g0bHlIY0ZZ?=
 =?utf-8?B?ek1sWXZFdTlOT0pkbE9pM0MzeGhDQi9yZGZQbTFNZ1Z2ejNHV3hvRzdBSkk0?=
 =?utf-8?B?S0tKVlhSRjhSUUxZWmhFdTQ3ZFJNc3NhaUp1K1hzTGtBN2szb2NDRU9DRkFX?=
 =?utf-8?B?bHR0ZDJGb1BrTnlYNDFVNzVKajJIRzZxVEk3UWhsaUJCcDk1SG5lUzFJZnp5?=
 =?utf-8?B?WFhPZHcrR0VEaE1hMXRYakVNNU9KVDVLT2tHLzdXYjFuczhPZDBEVU8zU1k2?=
 =?utf-8?B?V0I0d0NRNnVRcXVxVndpSWZJMXVMU3BUVzZSV1NZRDFtNEJ0QmRNMDBPZ3RO?=
 =?utf-8?B?dW5mOG9tOVZRd3J3R0FlMThYOFROTWloVW01NHZrQjdxLzcrTGFXWjFTbE5w?=
 =?utf-8?B?bWFpVXVuWFlFMjIvOHFrRkdqSDB0WmJVYnc1NDQ2U0Rscmd2UEpiM3hDUFYw?=
 =?utf-8?B?YmNGN0hTRVF3dFJBZ0hiRk12WUs1Mlh5VGNSc3U1eWc5cHVZUzZNc0RxRDB2?=
 =?utf-8?B?SzhWU0N4dXQ5N3pTa3EwMnNpZFVPcVJMenhYcTNaMHQ3ZitBMFgvb3g0Y3ZO?=
 =?utf-8?B?a1BqanBUY2xwV2txMXJ2U3VzaE9lcUNKYzh1OHVNeXdxR1EzbzlGUXFXVmU3?=
 =?utf-8?B?b0VrVzJpQUhRSXhJczIxMW9FbDY4ekJ0SlZ6WnpJQlhQN0hES0Q1RWpGdHJK?=
 =?utf-8?B?SXYrR3pQenF6R0Z1cnIwR1NTQlZaZ2srOWI0V3hMc0tQNmpKQmZ6YkZLYS9N?=
 =?utf-8?B?STFCd3V2UUpsOFczemlCWGpFZWpZNVNLbWw1Z0xXZS9ZZC9zTTB2YjlUZVhz?=
 =?utf-8?B?VTc4TWYzZk1hMlVWOE8zRzlScXBDbzU2TmlFM1U0L0Z5bWQzVDkrdXNxM2Zi?=
 =?utf-8?B?dHYvc2RPN1JEYmtjeGhkak9ra0lDT3FzTis3aEUrOHI3VklNY3dKNVRUaWNn?=
 =?utf-8?B?WDlBR0xPWWFIeFlhVzA1RXRUNnF3SXUyMHVRQUVkWkprQjcyZWtTMk9odHhn?=
 =?utf-8?B?N2pmTWVHeklnc3FwYnBvNFMwUFJKYnJyMXJRN1hIVC92bzRZQytRSWMzdFdu?=
 =?utf-8?B?Uk16Zm5pNjgycHJrTm50U2NzRzJENG9QU0FNSkYwVHJVZWphY0gyTUM2VlU5?=
 =?utf-8?B?ZndHVWFiRXlTMTI0dm8vbmdmNHY2NHhIZUQ2YjhkbzJxc0ZhOHVqNGJmMVZu?=
 =?utf-8?B?K09TcWw3b29ld1lydnlHMUZaNzdDZzBZbC9HemtrVDArS0NXS1ZGakZiNEVm?=
 =?utf-8?B?dlhvQUpmMXFvV010cFJvenZBV3dIRTJzNURUUEtUdUVVYnhyemRZUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: AUPC+B2YINffgpRYsw8niujolOZvbTgWLp78Ny1Tcx4jYV8lOybKkfqP7YsJISvFX6IeJbwM9QDxP8oY61iav10TKc0qKbG9C0wgUclghM9EIkEdZe5vANfIIF9yZ+JLLcL4Pr66qwR/mEq0pVbBEGfuuFHv+kWy0h0aM0eBErsy01k1aiQOg7wh4bJXCoJJOgZEm7vlNR6MQKnB8V00iS1ZpSoxwx59iRK4Un9yTbSYmONwbixreN4O/sQuZdvC5t4ouEaAEDB8l6uuHdYwzs7pHVhc89bL37lEJ4X9NyR1L2k1DntHciBgEEJ/ctxJzJrysjntqIpNjQUGbfRRrw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef913590-d32f-447c-bfae-08def3816583
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2026 06:10:21.2248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hIAyyO/iO1mxSRc56IM1LQkGw1C84nBGFNy6zAgR+J2pUvEdgKGuNZxKhuQh+u1N+MIsE0Z+H3j+k5QKoDQdRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5177
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEF1bGQsIE1hdHRoZXcgPG1h
dHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDMwLCAyMDI2IDY6
MDUgUE0NCj4gVG86IEdvdGUsIE5pdGluIFIgPG5pdGluLnIuZ290ZUBpbnRlbC5jb20+OyBpbnRl
bC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3
LmJyb3N0QGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL3hlL3BtOiBkbyBu
b3Qgd2FybiBhYm91dCBtaXNzaW5nIHJ1bnRpbWUgUE0NCj4gcHJvdGVjdGlvbiBhZnRlciBob3Qt
dW5wbHVnDQo+IA0KPiBPbiAzMC8wNy8yMDI2IDA2OjM2LCBOaXRpbiBHb3RlIHdyb3RlOg0KPiA+
IEFmdGVyIGhvdC11bnBsdWcsIGRldmljZV9kZWwoKSBkaXNhYmxlcyBydW50aW1lIFBNLiBBIGRl
ZmVycmVkIGZkDQo+ID4gY2xvc2UgY2FuIHN0aWxsIHJ1biBsYXRlciBkdXJpbmcgcHJvY2VzcyBl
eGl0IGFuZCBkZXN0cm95IHJlbWFpbmluZw0KPiA+IGV4ZWMgcXVldWVzLCB3aGljaCBtYXkgY2Fs
bCB4ZV9wbV9ydW50aW1lX2dldF9ub3Jlc3VtZSgpLg0KPiA+DQo+ID4gQXQgdGhpcyBwb2ludCBw
bV9ydW50aW1lX2dldF9pZl9pbl91c2UoKSBmYWlscyBiZWNhdXNlIHJ1bnRpbWUgUE0gaGFzDQo+
ID4gYWxyZWFkeSBiZWVuIGRpc2FibGVkLCBzbyB4ZV9wbV9ydW50aW1lX2dldF9ub3Jlc3VtZSgp
IHdhcm5zIHdpdGgNCj4gPiAiTWlzc2luZyBvdXRlciBydW50aW1lIFBNIHByb3RlY3Rpb24iLiBU
aGlzIGlzIGV4cGVjdGVkIGFmdGVyDQo+ID4gaG90LXVucGx1ZyBhbmQgZG9lcyBub3QgaW5kaWNh
dGUgYSBtaXNzaW5nIG91dGVyIHJ1bnRpbWUgUE0gZ3VhcmQgZnJvbSB0aGUNCj4gY2FsbGVyLg0K
PiANCj4gSXMgdGhlIGNvZGUgdGhhdCBjYWxscyB4ZV9wbV9ydW50aW1lX2dldF9ub3Jlc3VtZSgp
LCBub3QgdHJ5aW5nIHRvIHByb3RlY3Qgc29tZQ0KPiBraW5kIG9mIGh3IGFjY2VzcyB0byBlbnN1
cmUgdGhlIGRldmljZSBzdGF5cyBhd2FrZT8gSSB0aGluayBwb3N0IHVucGx1ZyBodw0KPiBhY2Nl
c3MgaXMgbm90IGFsbG93ZWQgb3V0c2lkZSBvZiB0aGUgZGV2bSB0ZWFyZG93biBzZXF1ZW5jZS4g
RGlkIHlvdSBhbHNvDQo+IGRvdWJsZSBjaGVjayB0aGF0IHdoZXJlIHRoaXMgZmlyZXMsIHdlIGRv
bid0IHRoZW4gdG91Y2ggdGhlIGh3Pw0KDQpZZXMsIG5vcm1hbGx5IHhlX3BtX3J1bnRpbWVfZ2V0
X25vcmVzdW1lKCkgaXMgdGhlcmUgdG8gcHJvdGVjdCBxdWV1ZSB0ZWFyZG93biBwYXRocyB0aGF0
IG1heSB0b3VjaCBIVy4NCkkgY2hlY2tlZCBhZ2FpbjsgdGhlIHBhdGggd2hlcmUgdGhpcyBXQVJO
IGZpcmVzLiBBZnRlciBob3QtdW5wbHVnLCBHdUMgaGFzIGFscmVhZHkgYmVlbiBzYW5pdGl6ZWQg
YnkgZ3VjX2Zpbml0X2h3KCksIA0KU28geGVfdWNfZndfaXNfcnVubmluZygpIGlzIGZhbHNlIGFu
ZCB0aGUgY2xlYW51cCB0YWtlcyB0aGUgc29mdHdhcmUgb25seSBkZXN0cm95IHBhdGguIE5vIHF1
ZXVlIHJlbGF0ZWQgaGFyZHdhcmUgY2xlYW51cCBpcyByZWFjaGVkIGF0IHRoYXQgcG9pbnQuDQpU
aGUgV0FSTiBpcyBvbmx5IGJlY2F1c2UgeGVfcG1fcnVudGltZV9nZXRfbm9yZXN1bWUoKSBzdGls
bCB0YWtlcyBhIFBNIHJlZiBhZnRlciBydW50aW1lIFBNIGhhcyBhbHJlYWR5IGJlZW4gZGlzYWJs
ZWQgZHVyaW5nIGRldmljZSByZW1vdmFsLg0KDQpJJ2xsIHVwZGF0ZSB0aGUgY29tbWl0IG1lc3Nh
Z2UgaW4gdjMgdG8gY2xhcmlmeSB0aGF0IHRoZSBxdWV1ZSBkZXN0cm95IHBhdGggd2FzIGNoZWNr
ZWQgYW5kIGRvZXMgbm90IHRvdWNoIGFjdHVhbCBodyBzdGF0ZSBhZnRlciB1bnBsdWcuDQoNCk5p
dGluDQoNCg==
