Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1069AC4450A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 10:39:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C690B10E341;
	Thu, 16 Jul 2026 10:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QTmAen1S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D15610E341
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 10:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784198370; x=1815734370;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=s37dIJjQibWFq7hbBsGvP0lPAiuqjM9biDOQvBK9zC0=;
 b=QTmAen1SB+EFGDx8jIaVgVpn6PKPKE1CjJqcD7Vew9s10VCywiI2OsPW
 K3gCSO5/KkfXfULUCHa67LPRP3n/JOWaaInR6FvNDR+MtPwYohBpDjhej
 5wh96F3GrIULmWWBwDcTRQtaAZdc2XnWYAY52+iKWTODEDnkOtxzE7PRa
 eqdiUur08Iddl/EIONHjoyAZkwepk1lWlW42O2GS+lZClU38hvLD1MPlN
 d9Q6Z7mPz2RVCqc43+Q1p4zAu7h/ykuzg/vrp0EGuoL0xps4zoDhSkXlM
 L+BpyAi4JmX8ADlghlO206i1DAgMlFa5TTedYtjhsz9aVcKYvZGB5LGVP w==;
X-CSE-ConnectionGUID: eZJTXUdFQx2+CwEDqUL1ew==
X-CSE-MsgGUID: 5FWltUDDSnqDFDG1CR12vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84813412"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="84813412"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 03:39:30 -0700
X-CSE-ConnectionGUID: hhRBrSwFROacDpVBOOllcA==
X-CSE-MsgGUID: Hz5L/g2yQAqtkeknj/Zsew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="253053761"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 03:39:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 03:39:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 03:39:29 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 03:39:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LDda7S+jEBnYuwwad+5gXP83mbeveWOnLkbHzBew6IaKstuuv8Sl0Wxt7l2bIqnkIO12gpVYt0hpWyESGF66MMcIg3i5mzLYPqOdX419wq0gjXqQuv11BPe8O9xNlpP2lyVBuQtcXSfnCoqZ9DXyGBsF6KBqtbHR0LF71CIQkOiA9ryycXd1war64u5E2iITHiWZvqGbdrVQ8zd5wyfhCkUsDcolSzisaXb4adLowuXEtvH26NIot8+EP8RCamjgxG21CSU4j8R718P+O0FKVFETr6iHEUcapR66qErQe3YGJBRgYQRmBBPv2IcmtcZKWaqdr9/SSk8LSlRkOpG8Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s37dIJjQibWFq7hbBsGvP0lPAiuqjM9biDOQvBK9zC0=;
 b=qcXHRBvMMehRDNkM0rnfvrCkuhFz4UK7Fsn5+oJtu9V8RrQF8wF8SzmyC09Kn0FB9cwlf6KVjFDUXfozCr5F2nxgbBZP54ovNJdMUy6pbv5X1kOO/WMmO0hKc0SXS1ipsW5/FPUBQd2kNWEh5m8+2G+odpxbXnG2qD8woU0LT7Qy6s4MRRgIbQIoc2glyH5ozYaHmuwunsTQC1gBvXRRfKQvvqACSy9/Mb40opfgiyKc42OciFEW65reNhXfnlX2aNyd8R1YzbU36fvCqnRvvSQmNe+OgQ2/IintsmCfmsvi+gy8OkB6vhuCrwxU+M2NeOodUXRRqCWI87ybJ4aPBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by IA4PR11MB9229.namprd11.prod.outlook.com (2603:10b6:208:563::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 10:39:26 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 10:39:26 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH V13 00/11] Add memory page offlining support
Thread-Topic: [PATCH V13 00/11] Add memory page offlining support
Thread-Index: AQHdFQzizLNGqpvNG02JQl5fj3YK0LZv9Gzw
Date: Thu, 16 Jul 2026 10:39:26 +0000
Message-ID: <DS0PR11MB8718ECC86FFCE67C51F7BBEF81C72@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260716102110.1549938-13-tejas.upadhyay@intel.com>
In-Reply-To: <20260716102110.1549938-13-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|IA4PR11MB9229:EE_
x-ms-office365-filtering-correlation-id: 5fcb7a41-573a-4b97-85de-08dee3268221
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|38070700021|6133799003|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: uevVOy93b+TLvx/hJw7WBrmcjR36GFqRziXIqpEC8D8zOWDkCHU9lnZ1c4XFkTZHkRR3Dqsg+cvWIULa0BE8Rwr1WnWgLkLqwzGQlaXxDQxLC/7MpgrLJUGTbxskzj3wCWuO29opR+JOiI/Q/BlL/efa/uRWNh/phEfVJNEUiYSiQYzz+LFd+IOw9Psf1DtTEGyNq3UQirlhfyKTl4FcA+Mno8vSHg+egU4Fou0+we7c0GZXDU8NpLnYBxYxuRL/sWTA+3fZJV56txmV+PmFU9vHP1N0br7IMe0Itz/QJeZogHJpBIRX+DbJZ960R2BkBpQ2VuMgy9NgmLMH5pod7EZY7XrUa6FHAvv+EdGcnJAX2xGq3siui0+jUHEPN7Rp0E+8u5QNwF6fQIIPyqWneiakj6XRoy1kOuuKzPSNV25BOvvH3RZcBFye5vcs6cq5gK4ryXeiunDcRD0eFZ7Y9jN8vsRBLckzYzT87eK6vv0Zhq46h/KFiNwLhWjEuZu72h6A3wAKu5zRJik+diPbXlfHOn930VWLXWfAOG/yHNdk0islfWtEDQHkd2HUSxkRDACEaVHvF4X8nqMqCMGUJw6K3COsTqr8sv/Bhx65HEbYPhEV6WbMjv7qTWM0lWchioj/TxauSvKgYEXBGrUSeOgPU3v9qZZguu9Blbjfh+Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(38070700021)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWJSamJNMDZYckIrOUtTM2JNWWZTY3J5QjJYRGl0cW5DUFZCaFd5OTd0czN5?=
 =?utf-8?B?NEdqRDdnZHF5RjcrYkRxNTNpcFNUaGRQR2dhOWhkWjREVmJJVHdsVXJkalUx?=
 =?utf-8?B?K0JnWjR4SG9TdlAyZTMwdzMxaDdSKzFhMFRCa3ptK3A2ajhOK2hQT1l1Q1Fw?=
 =?utf-8?B?aDY1UFZsMm96NXlrSUlNRHpZV0xzR1ltUm45MzFKYVk5N2lrY0dtcDJQK2JT?=
 =?utf-8?B?cXpGL20vWk9OVG5xaTAvcnJYbUQwS3VybGJhNjQvNkZmL3NVeXZvWGFiajhH?=
 =?utf-8?B?d1JNUENlcFBRTEpFQXNuQm5BVlVreEZIemJWc21ucnU0WFkxdFZOdEZyU3NR?=
 =?utf-8?B?UG5uSjNYZkcrMW4yREMxMXd3U0NmbTAvZkNNOFBnbi9QcEgwTHUrV1ZaaGJI?=
 =?utf-8?B?MktyVm16b1dqazROQWJpWk44NkNnZHNTVmdmYSt2a04rbVhVRXRFVEdmN0hR?=
 =?utf-8?B?OUJsTUk0aEVNdGVkU2cwdlcwOFRwU3B6RDNCSE5FRHp2dzFPaWl6dUovTjhq?=
 =?utf-8?B?bTliemFLQ1ZlNTVsbERpR3p3WTZyemhHWkdGVFJQeERTc0ExeURBSmZjNkRC?=
 =?utf-8?B?OU5MU2VaVHJkNU84eHBEUm5zTnF6cWFHQ0ljdWdRVHY3OGpSQlpzV2RLcXRi?=
 =?utf-8?B?RUhpbmkzYjN4KzdYb0I5bGMwN0d5OHpHTGtKMlczdXRSY3RodFU4NEhFUjlZ?=
 =?utf-8?B?OWV0T29xTWhFelpWdHRJYTh5ZTNPcGJjZThXbDhBY2dwQ29VVzQ3eTV1UFI0?=
 =?utf-8?B?Qm93UXg3U1ppOXZGNGxqQ1hML1EwTnZIWE9HMmxxRSsyRjBpRVBoVG44R3Av?=
 =?utf-8?B?OHhCWHFPRkc2L1NYZHR2VFYySUt1bm9jYjdnOWViN2pDMVpoUUJsUlhzUXhh?=
 =?utf-8?B?ODJKdXlscTJYYWJPblBPZzAvbksrT2E1VWt1Q3JZTFdacUJZSm1JQXBlWmll?=
 =?utf-8?B?Uk5OOGVyV2phTkxTSTgrbGI4ZndrWm9MNXFmNHF1U0FQVjZTT3BSMlUyUUkv?=
 =?utf-8?B?ZTc5UWczR0p0TE9ZTFdscVNWdkx3Y3RpVitaYmpmUm9tMUFFZzVZQlVyWlY2?=
 =?utf-8?B?K0VBWmZGcHFqeHB3Nm5OdlA3RitiMjdGRmNDRzZCbzdzWU5vUFF6WUpLRUYy?=
 =?utf-8?B?WjhNZTJ4eHZSQmEzMXU0cDRRZmJRSU1EdEtieUI1TXBadUtHaVRKYVg2NVBC?=
 =?utf-8?B?NkZTRCs2S2pTN0VrMkoxdTRsYTBMT01QMVdrdWRxZkJ4Z2dISFQyQmwwbnIv?=
 =?utf-8?B?RDROVFAwNVczV293N1E3V0lIUWhxWDhwWUJHNHNpQUVReEZGY1FHbmZoaTFN?=
 =?utf-8?B?Y0tHTDY0NGNBcGdtbGdzZ3lCTmkzM2VTSGRxT0pRYXlObEx3MkgxUENCNHZ4?=
 =?utf-8?B?Mkl4SFpVS2VTQ1lLUVFQeXhkNXVpU3hBWmFNK0FLSys2OS9RUzJ6TXU0WXVH?=
 =?utf-8?B?Q3JRSzc0WTA3RDI1MXl1YTc0OXcyT1lmQ1lMWjRBUXUyMHBZSjVrYVlWK3VF?=
 =?utf-8?B?aEEvb1NHbGM4ejRVQWdGQ2dkTzFLK0NuVTdjbEtxU1JOdjRmUkplVGx2K3Y5?=
 =?utf-8?B?Wkw3Z0ZrMVk5TFo1MWVqaXFhakxCVU55MmlpTUFWMDhYTjF2MThRbXdKTTE5?=
 =?utf-8?B?L05LQ1Q2OTJwWldqSmtmbTcrVVlZODlaWTZRVlpPUGdFeUpRU2h1UWVlakZP?=
 =?utf-8?B?K1c2Qy9WM1UxejhydCtDY3JUaTBXY0U1N2lSQmhPT1BhN0NDNU9EL05TSHVJ?=
 =?utf-8?B?TFJFZGhaT2QxdWdSc2Z4Vm1WVWVQVGR1QWJzK09rZnl2cDdSdGlOeklNNWt3?=
 =?utf-8?B?bkxaVmNsMSs0VmlJME5USEk0QytLZW00QlJZeElkZXhKZVhTczVHK1RldXZj?=
 =?utf-8?B?aUh4eW9OT3dCWFA5dkRvU2o0c3haZXB5YUluTEsrNWEwSzNJQngzcG1ZUUl6?=
 =?utf-8?B?Z2kvVnB0bEtzTWZseVhaK2FnamZYaXgrVUQzTlR5SXdlcjgzd1VGZnljSVRv?=
 =?utf-8?B?MWhmWmpld1RmWTZEZjhWWmMwOThoQkg2NHdyOTFxN0dXdHNoUktuNHJxSWZa?=
 =?utf-8?B?WVN4bFB4U01PWU4xZHV0d1U0WnVlSTh4aitqdW5rbnNDSllvRkVCdC9nQkp0?=
 =?utf-8?B?U0dBV0lTaGNYMlZmN3ZIbkc0WXc4dHFuUlI3Wml0SUFPdG1RVFZlNk5CWTQ5?=
 =?utf-8?B?L0VoK1FiMHRGaCt6TDJqc0pzUWlGOVZETEwyQ2x3NERBaUkyNmd5YmZNdFo5?=
 =?utf-8?B?QjMzU2xyN0NBQlhBb0JsdWt1ckFnQnh6b2VZVXZlSGhHV0daZFU1NVZ4bGtu?=
 =?utf-8?B?N2VJcEtncUs4djMxMVkrQTlzQ1RMVzRoNE1kYjlXM2h1Nm1lUE5Hdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: oFPGXDDG8Oabuxnw3RhjlHr+r2/rLXzTQwDOJXpXplCezQqrxYQvFbPod4TkC58tUMA3JavbNaf/iKxJYEhKMSI5dL4K9IZsyX4JVpgD6+wWxfLPbvrvMDwoN0P/H11trMlhM9cMPd0WaF2ZsDDMUKmuR7IoV0Q+abN4zHl6zpgDVYf4B+cHK1WX2JXBQK4nNJANaZVZnjMpk1SH04gnGIvOeOHOfJ4YOn7ERYiW9SGYqQoy9UL7At38JjhYJrSg3FfWJXxHdDJBLPF5wQiJdh9u2wuRlghj1IaKW6Y1qJG0Ib4+sM8ZkZPqclcWlDhGNjAhsF/HeXgHliMkTdlsCw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fcb7a41-573a-4b97-85de-08dee3268221
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 10:39:26.4509 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IZ+Dea2iNw94JyCvg0myhEv45+33MqK//xIO24iTxTOtGL6N/y9yaF1WwTKOMXO4asqMf3N2WRjV8hR8D3ZT7bYhogyeu1sNA2xCMFzpETc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9229
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

UGxlYXNlIGlnbm9yZSB0aGlzLCBlbmQgdGltZSBsYW5kZWQgcmViYXNlIGNvbW1pdCBhbmQgcHJl
LWJ1aWxkIG9uIENJIHNob3dpbmcgY29uZmxpY3QsIHJlc2VuZGluZy4uLg0KDQpUZWphcw0KDQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFVwYWRoeWF5LCBUZWphcyA8dGVq
YXMudXBhZGh5YXlAaW50ZWwuY29tPg0KPiBTZW50OiAxNiBKdWx5IDIwMjYgMTU6NTENCj4gVG86
IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogVXBhZGh5YXksIFRlamFzIDx0
ZWphcy51cGFkaHlheUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBWMTMgMDAvMTFdIEFk
ZCBtZW1vcnkgcGFnZSBvZmZsaW5pbmcgc3VwcG9ydA0KPiANCj4gVGhpcyBmdW5jdGlvbmFsaXR5
IHJlcHJlc2VudHMgYSBzaWduaWZpY2FudCBzdGVwIGluIG1ha2luZyB0aGUgeGUgZHJpdmVyDQo+
IGdyYWNlZnVsbHkgaGFuZGxlIGhhcmR3YXJlIG1lbW9yeSBkZWdyYWRhdGlvbi4NCj4gQnkgaW50
ZWdyYXRpbmcgd2l0aCB0aGUgRFJNIEJ1ZGR5IGFsbG9jYXRvciwgdGhlIGRyaXZlciBjYW4gcGVy
bWFuZW50bHkNCj4gImNhcnZlIG91dCIgZmF1bHR5IG1lbW9yeSBzbyBpdCBpc24ndCByZXVzZWQg
Ynkgc3Vic2VxdWVudCBhbGxvY2F0aW9ucy4NCj4gDQo+IFRoaXMgc2VyaWVzIGFkZHMgbWVtb3J5
IHBhZ2Ugb2ZmbGluaW5nIHN1cHBvcnQgd2l0aCBmb2xsb3dpbmc6DQo+IDEuIExpbmsgVlJBTSBv
YmplY3Qgd2l0aCBncHUgYnVkZHkNCj4gMi4gTGluayBhbmQgdHJhY2sgdHRtIEJPJ3Mgd2l0aCBw
aHlzaWNhbCBhZGRyZXNzZXMgMy4gTGluayBMUkMgQk8gYW5kIGl0cw0KPiBleGVjdXRpb24gUXVl
dWUgNC4gRXh0ZW5kIEJPIHB1cmdlIHRvIGhhbmRsZSB2cmFtIHBhZ2VzIGFzIHdlbGwgNS4gSGFu
ZGxlDQo+IHRoZSBnZW5lcmF0ZWQgcGh5c2ljYWwgYWRkcmVzcyBlcnJvciBieSByZXNlcnZpbmcg
YWRkcmVzc2VzIDRLIHBhZ2UgNi4gQWRkDQo+IGJ1ZGR5IGJsb2NrIGFsbG9jYXRpb24gZHVtcCBm
b3IgZGVidWdnaW4gYnVkZHkgcmVsYXRlZCBpc3N1ZXMgNy4gQWRkDQo+IGNvbmZpZ2ZzIGZvciB2
cmFtIGJhZCBwYWdlIHJlc2VydmF0aW9uIHBvbGljeSA4LiBTeXNmcyBlbnRyeSB0byBwcm92aWRl
DQo+IHN0YXRpc3RpY3Mgb2YgYmFkIGdwdSB2cmFtIHBhZ2VzIGZvciB1c2VyIGluZm8gOS4gRXhw
b3NlIGJhbiByZWFzb24gaW4NCj4gRVhFQ19RVUVVRV9HRVRfUFJPUEVSVFlfQkFOIDEwLiBBZGQg
c29mdC9oYXJkIG9mZmxpbmUgbW9kZSBmb3IgVlJBTQ0KPiBwYWdlIHJldGlyZW1lbnQgMTEuIGRy
bS94ZTogQWRkIGZhdWx0LWluamVjdCBiYXNlZCBWUkFNIHBhZ2Ugb2ZmbGluZQ0KPiBpbmplY3Rp
b24NCj4gDQo+IHYxMzoNCj4gLSBBZGQgZmF1bHQgaW5qZWN0IGFuZCByZW1vdmUgc3RhbmRsb25l
IGRlYnVnZnMNCj4gdjEyOg0KPiAtIEZpeCBTYXNoaWtvIHJldmlldyBjb21tZW50cw0KPiB2MTE6
DQo+IC0gQWRkIEJBTiByZWFzb24gZm9yIFVNRCB0byBrbm93IGFib3V0IG9mZmxpbmluZw0KPiAt
IEFkZCBzdXBwb3J0IGZvciBzb2Z0IG9mZmxpbmUgbW9kZQ0KPiAtIFJlYmFzZSBhbmQgcmVtb3Zl
IGR1bW15IGxvY2tkZXAgYW5ub3RhdGlvbiBwYXRjaCwgYXMgaXQgbWVyZ2VkIGZyb20NCj4gdXBz
dHJlYW0NCj4gdjEwOg0KPiAtIFJlbW92ZSBSRkMNCj4gdjc6DQo+IC0gSW1wcm92ZSBkZWJ1Z2Zz
IHdhcm5pbmcgbWVzc2FnZXMNCj4gLSBVc2Ugc2NvcGVfZ3VhcmQgZm9yIGxvY2tpbmcoTWF0dEIp
DQo+IC0gQWRhcHQgYWRkaXRpb24gb2YgcXVldWUgbWVtYmVyIG9mIExSQyBCTyhNYXR0QikNCj4g
LSBFeHRlbmQgYW5kIHVzZSB4ZV90dG1fYm9fcHVyZ2UgQVBJIGZvciB2cmFtIHBhZ2VzKE1hdHRC
KQ0KPiAtIEhhbmRsZSBkbWFfYnVmX21hcCByZXF1ZXN0cyBmb3IgbmF0aXZlIGFuZCByZW1vdGUo
TWF0dEIpDQo+IC0gQWRkcmVzcyBpZiBpbiBuZXZlciBpbml0aWFsaXplZCBibG9jaywgc2V0IGJs
b2NrIHRvIE5VTEwNCj4gLSBBZGQgbG9ja2RlcCBpbiBncHUgYnVkZHkgKE1hdHRCKQ0KPiAtIENv
cnJlY3QgYWxsb2NhdGVkX2FkZHJfdG9fYmxvY2sgbG9naWMgKE1hdHRBKQ0KPiBWNjoNCj4gLSBB
ZGQgbW9yZSBzcGVjaWZpYyB0ZXN0cyB0byBub25jcml0aWNhbCBibyBzZWN0aW9ucw0KPiAtIEhh
bmRsZSBzbW9vdGggZXhpdCBvZiB1c2VyIGNyZWF0ZWQgZXhlYyBxdWV1ZXMNCj4gLSBCcmVhayBj
b2RlIGFuZCBtYWtlIHB1cmdlIHNwZWNpZmljIHN0YXRpYyBBUEkNCj4gVjU6DQo+IC0gU3lzZnMg
Im1heF9wYWdlcyIgYWRkaXRpb24NCj4gLSBSZXNldCBibG9jay0+cHJpdmF0ZSBOVUxMIHBvc3Qg
cHVyZ2UNCj4gLSBSZW1vdmUgd2VkZ2UsIHJldHVybiAtRUlPIHRvIHN5c3RlbSBjb250cm9sbGVy
IHdpbGwgaW5pdGlhdGUgcmVzZXQNCj4gLSBBZGQgZGVidWdmcyB0ZXN0cyB0byB0cmlnZ2VyIGRp
ZmZlcmVudCB0ZXN0IHNjZW5hcmlvcyBtYW51YWxseSBhbmQgdmlhIGlndA0KPiAtIFJlbmFtZSBh
ZGRyX3RvX3RibyB0byBhZGRyX3RvX2Jsb2NrIGFuZCBtb3ZlIHVuZGVyIGdwdS9idWRkeS5jDQo+
IFY0OiBBUEkgcmV3b3JrcywgYWRkIGNvbmZpZ2ZzIGZvciBwb2xpY3kgcmVzZXJ2YXRpb24gYW5k
IGFwcGx5IGNvbmZpZw0KPiBldmVyeXdoZXJlDQo+IFYzOiB1c2UgcmVzX3RvX21lbV9yZWdpb24g
dG8gYXZvaWQgdXNlIG9mIGJsb2NrLT5wcml2YXRlIChNYXR0QSkNCj4gVjI6DQo+IC0gc29tZSBm
aXhlcyBhbmQgY2xlYW4gdXAgb24gZXJyb3JzDQo+IC0gQWRkZWQgeGVfdnJhbV9hZGRyX3RvX3Jl
Z2lvbiBoZWxwZXIgdG8gYXZvaWQgb3RoZXIgdXNlIG9mIGJsb2NrLT5wcml2YXRlDQo+IChNYXR0
QikNCj4gDQo+IElHVCB0ZXN0cyBmb3IgdGVzdGluZyB0aGlzIHZpYSBpbmplY3RpbmcgZmF1bHQ6
DQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC83NDA2MDEvDQo+IA0K
PiBUZWphcyBVcGFkaHlheSAoMTEpOg0KPiAgIGRybS94ZTogTGluayBWUkFNIG9iamVjdCB3aXRo
IGdwdSBidWRkeQ0KPiAgIGRybS9ncHU6IEFkZCBncHVfYnVkZHlfYWxsb2NhdGVkX2FkZHJfdG9f
YmxvY2sgaGVscGVyDQo+ICAgZHJtL3hlOiBMaW5rIExSQyBCTyBhbmQgaXRzIGV4ZWN1dGlvbiBR
dWV1ZQ0KPiAgIGRybS94ZTogRXh0ZW5kIEJPIHB1cmdlIHRvIGhhbmRsZSB2cmFtIHBhZ2VzIGFz
IHdlbGwNCj4gICBkcm0veGU6IEhhbmRsZSBwaHlzaWNhbCBtZW1vcnkgYWRkcmVzcyBlcnJvcg0K
PiAgIGdwdS9idWRkeTogQWRkIHJvdXRpbmUgdG8gZHVtcCBhbGxvY2F0ZWQgYnVkZHkgYmxvY2tz
DQo+ICAgZHJtL3hlL2NvbmZpZ2ZzOiBBZGQgdnJhbSBiYWQgcGFnZSByZXNlcnZhdGlvbiBwb2xp
Y3kNCj4gICBkcm0veGUvY3JpOiBBZGQgc3lzZnMgaW50ZXJmYWNlIGZvciBiYWQgZ3B1IHZyYW0g
cGFnZXMNCj4gICBkcm0veGUvdWFwaTogRXhwb3NlIGJhbiByZWFzb24gaW4gRVhFQ19RVUVVRV9H
RVRfUFJPUEVSVFlfQkFODQo+ICAgZHJtL3hlOiBBZGQgc29mdC9oYXJkIG9mZmxpbmUgbW9kZSBm
b3IgVlJBTSBwYWdlIHJldGlyZW1lbnQNCj4gICBkcm0veGU6IEFkZCBmYXVsdC1pbmplY3QgYmFz
ZWQgVlJBTSBwYWdlIG9mZmxpbmUgaW5qZWN0aW9uDQo+IA0KPiAgZHJpdmVycy9ncHUvYnVkZHku
YyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDk5ICsrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9iby5jICAgICAgICAgICAgICAgICB8ICAxNiArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2JvLmggICAgICAgICAgICAgICAgIHwgICA1ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfYm9fdHlwZXMuaCAgICAgICAgICAgfCAgIDMgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2NvbmZpZ2ZzLmMgICAgICAgICAgIHwgIDY0ICsrLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2NvbmZpZ2ZzLmggICAgICAgICAgIHwgICAyICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
ZWJ1Z2ZzLmMgICAgICAgICAgICB8ICA0MCArKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rl
dmljZV9zeXNmcy5jICAgICAgIHwgICA3ICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kbWFf
YnVmLmMgICAgICAgICAgICB8ICAgMyArDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19x
dWV1ZS5jICAgICAgICAgfCAgMTMgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1
ZXVlX3R5cGVzLmggICB8ICAgNyArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNsaXN0
LmMgICAgICAgICAgIHwgICA0ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1p
dC5jICAgICAgICAgfCAgMzAgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYyAgICAg
ICAgICAgICAgICB8ICAgMSArDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcHQuYyAgICAgICAg
ICAgICAgICAgfCAgIDMgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV90dG1fdnJhbV9tZ3Iu
YyAgICAgICB8IDUxNw0KPiArKysrKysrKysrKysrKysrKysrKy0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV90dG1fdnJhbV9tZ3IuaCAgICAgICB8ICAgMyArDQo+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfdHRtX3ZyYW1fbWdyX3R5cGVzLmggfCAgNDIgKysNCj4gIGluY2x1ZGUvbGludXgvZ3B1
X2J1ZGR5LmggICAgICAgICAgICAgICAgICB8ICAgMyArDQo+ICBpbmNsdWRlL3VhcGkvZHJtL3hl
X2RybS5oICAgICAgICAgICAgICAgICAgfCAgMTIgKy0NCj4gIDIwIGZpbGVzIGNoYW5nZWQsIDgy
OSBpbnNlcnRpb25zKCspLCA0NSBkZWxldGlvbnMoLSkNCj4gDQo+IC0tDQo+IDIuNTIuMA0KDQo=
