Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AC6C5516F
	for <intel-xe@archiver.kernel.org>; Sat,  1 Aug 2026 05:49:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D47D10E28B;
	Sat,  1 Aug 2026 05:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j8VMgjUu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498AE10E274;
 Sat,  1 Aug 2026 05:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785563355; x=1817099355;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ig7AAFZrXedvEWICgbfvoOK0MlJy1dC5R8lyKcSTElE=;
 b=j8VMgjUumDUYuWw2av4veJRYqhv0mn39W9XBL7ZJQXoOlUyMCH65A4le
 SXntGZidEoIbMZ559sJWVhLWKy78c1pijRVXjtU9518e3nzbyv/qm9fpg
 sO6BhfySPiUW/igxttIjqouwXA+SZ/uovyOc0S2kxRJPhLwnJ62PToKXC
 SnptdeLDAb1f/BShbBMOV4oh490iQVwIUVBjiDHVUn7q/bo7D13qWHSfD
 15FLTxe7IwDbOIaml+qLDD/tQ85JfpIDnvoQ3uDb2Ow2yo7T89YX9KkMo
 /6EtM17sc+GIaxGbuX75DgQvXXvuht7cvoowDh/wRxkg/d8lpJoxZsL+Y g==;
X-CSE-ConnectionGUID: pm6Jd736SLK7G9cjO20hKQ==
X-CSE-MsgGUID: u2nROhFGT4SjXij04FBUag==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86056850"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; d="scan'208";a="86056850"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 22:49:14 -0700
X-CSE-ConnectionGUID: DMKR/5JgSzOtPS+qy6KOrw==
X-CSE-MsgGUID: lr0RPAdkRtObJBjJXQaiIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; d="scan'208";a="260799975"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 22:49:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 22:49:12 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 31 Jul 2026 22:49:12 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.8) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 22:49:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hpqr8DLolS1PYVAeU6XtPqetWHnsTyAw1T+tqNGnMh9Of6IgW1JS/OkUO8tCviK1UA0tch6rOxTkELp5pQOnB82C6LziZkSbRGHpz/Jwi2iN30N2+Jht7K1Z7QmWC8SxN0/s6lv+ixsW/aXIUOWlLaPSd5EpjtZiUWzeGAczPrqpBhaXx+KOCj1JbO1z6OHG2uzLALGEoiDGs4LYioHg18Q8A0mp3PkLvNYmYhLKNRfNrLq+zcgtrNVUTG0eI/FX8nHQoTPg4Ese7gJAAVWsapKztgVO/kjsEWlDgjT3uip9V5y9ZQYN694oMMWdBxBVMvN+I7y/oYWQmy+7vDde+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ig7AAFZrXedvEWICgbfvoOK0MlJy1dC5R8lyKcSTElE=;
 b=lJjMqH0n4ByrCR15ayIMYAQhHaLswRjgyGeDcmi2XcLjb4rF3EvH34m+wYdraXSErqQRKZoXX9UhcTdCFfUZiFepz3fZ7E53hfOs34FUjCzehznXi9hEWcGaO6ipvwGj1to/8uvBTc9di+LyDZFLEdrIjmKR80Tya5rJn2y+RsNE7Fp6KLgtUv95iaByM95YxIUVFC8JtZb08+EcDPjCpyY6M7jfEirM1tox0xK9m5cCyGzS63fjr4KYjTupq8Nyh1MNKiUlDyxWW3lcz25tMUc3Ci7/LliNOUc11yl/anlQ8RKGANQrXikr0kLh6vN11DT/0Sh8GaCn0InNURJaOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5413.namprd11.prod.outlook.com (2603:10b6:208:30b::16)
 by SJ5PPF1611BC49E.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::812) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Sat, 1 Aug
 2026 05:49:03 +0000
Received: from BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811]) by BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811%3]) with mapi id 15.21.0270.016; Sat, 1 Aug 2026
 05:49:03 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Sousa, Gustavo"
 <gustavo.sousa@intel.com>
Subject: RE: [PATCH] drm/i915/xe3p_lpd: Update CURSOR_BUF/WM masks
Thread-Topic: [PATCH] drm/i915/xe3p_lpd: Update CURSOR_BUF/WM masks
Thread-Index: AQHdG5tijEI8HL9vLU+zycfnDKEahraIu4uA
Date: Sat, 1 Aug 2026 05:49:02 +0000
Message-ID: <BL1PR11MB5413D244A3C7F42C53ABA076E2D72@BL1PR11MB5413.namprd11.prod.outlook.com>
References: <20260724-xe3p_lpd-cursor-dbuf-increase-v1-1-42f2faae2fb5@intel.com>
In-Reply-To: <20260724-xe3p_lpd-cursor-dbuf-increase-v1-1-42f2faae2fb5@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5413:EE_|SJ5PPF1611BC49E:EE_
x-ms-office365-filtering-correlation-id: fa31bb75-e38a-42c3-3279-08deef909791
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|56012099006|11063799006|10067099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: bdXIFOcNluW1zhBpAcohaKDDo+gXpv/HFnyVuvBkFmXvrGiBWTDCBvQnlNgaRqoHonrYPUTlVPKA9qk3F+Q/LTZGai6Bok+JQTPE/nA/Ehmru3kO9aq64krxlLiyO8CfNVIx8hpn9MMRuYqxHay7TC9EKjl1AKUQwSWS4IMsinnGA7cEI68zxVKpdzVWWtuKmObX7bAAwJ+uHXMM0ePPL5Z8QxWzJuFoCFmeFeXIcvHJzWmKcOAERNA6X2fQUVI6TKT1NAaj7/t+BZXp9y/4YT/Y2ZxQon+Too6kEdkvGGYzmEn5CjqNSK4QGkFIsSLm9PJsNvW/g49gcpNvk1Ur6bSLdXCqb71qXRew7P4y5SR/Q70ve0CVgyITvPYqdLpiNKDW/8EIIom28kY9CZVrk+iNQGOqNAjPCg4uy7FNeekmuhadt75WogyES3Dgm1CafpBXxXkOB8tyhXYy4XDv7Q5hJwrymPtbuvFoVr1huTym7YgTv62DcQNNFSBq+XcQ5Rl9j4O2FgcKZWbDJ4m7841e+QWISlJUM486ay4k8BLdBTo8+LwR/FRGDSLQY02rr9Mtv1wPrwzQRMEZez8iPAx7EsXDHY+ZADmVU6Gbb1dArpfY+hOHkIsc0QDgwCbz0Xzk+rhfemV/DnfrF0DAWX0q6CRtI370CQZpOPuJ5IRgholbp4Woi51T7auvFT8YVfxsJcWf3HVcx6FgFaVKY9WCokp0MztzINVeVCLCocE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5413.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWx3WkdUNGpkTnpZVmVEa3M2WDJtK1pDUHByK1N0ZGtscUFPVlU2b3FzM2ha?=
 =?utf-8?B?d1Urdmw0SnhvM0MvOVRGeFpVYnRYeXdUMVdsY0s3RGt3N1lWSkJVenRtcnlF?=
 =?utf-8?B?VjVTc0RlOS81VkVhQk0rUmdwWnZBUHdDSkRxTGc1UG9kc3F3SzRRTnpGNEdY?=
 =?utf-8?B?UlU0WlowTzhVc3BYSHNQNEJxQ2I1UndNU2U1QzY4UWwrRnBwQzgvZnQvbFZX?=
 =?utf-8?B?SDgzdmY0V25hVWRXMWlPanRnbk1yQ3ZaWXdUcE8veWsyQ1VBZFZ1L1VrUk1V?=
 =?utf-8?B?MzJUWkxVSkhhdkREWVRybUxxZm1PRm9tdEo4VHlJcEt2TVdhbGZGQmJJaENQ?=
 =?utf-8?B?V0hQWms0WGVySldPTi8yVXErZ0lyc3FKcXJsODU5cllMZ3J4Y2FwNnIzS2RT?=
 =?utf-8?B?aUh5enFWNmlUMkRXTVllT1lKWmFLUVczQ2R3MVBWbC8vYXFyY0F6NnhRWkx1?=
 =?utf-8?B?S2ZieVZQc1VqZUdNRnljdmlkeGJXVUU5MVMyb1Z2Zk1jczJYYldRTFZMODBx?=
 =?utf-8?B?NEFqMzZuc0Q0d0RCS2xnVGZ2VkVrcEtPeEZZWDRIalQ4WnpBZGZNUVIwVWNX?=
 =?utf-8?B?RXBmRmRhdW0vcTNOdnNHTWhRTFRxeXZWZzVwc1F3azZKMnhFVHdtQmtKYUNp?=
 =?utf-8?B?OWlia3dkUFRqc1ZVS2wvOXhGQllpK3Z4aFpRQllzREZJbW1hNkRlRFFITGl1?=
 =?utf-8?B?VVZSUkVhZ0F1UVZWUDA3VHRxcFhWRlIwdzlWaUdBdEd2NkduU2NEWHlIMkY2?=
 =?utf-8?B?bzlCejduaFlLd0k2eUhKbHB4bTU0NmkrODhiTEFNTm5XUHN3RmhUZDNyOEp2?=
 =?utf-8?B?Q051U00xWHliMTdnK01vTWhWWGEwSGV3dncrc1NhWFNsSytNWWZUbHlYZW16?=
 =?utf-8?B?eCs4V3VkTkF1ZDNndkhmRjlKak9kcGNDRXlhMWZmOWVMbklSUjljSEt4bEw2?=
 =?utf-8?B?R1lvMS8rSWM4ZXhvMGpiS0luOFNCUm85aXovVGNKMVFnUC8rVkZFZjVOaGxX?=
 =?utf-8?B?cDdpNHZjSmwwNnRuTDZmZjFKWjZxREJScVM2YllXbnpZb3VjMDBEdWFyOTlW?=
 =?utf-8?B?bW5XaWFGWWlqaUNweGN6c1RWeklxRURFeWRHNGcxYnRlaVorbFdvc2d5TVBG?=
 =?utf-8?B?QWlmQVhCTHVaMFphdlZZR240VmZBM0pZV3MrRUNSWTB2WmN5OVcxdFNMbU9y?=
 =?utf-8?B?QnVpdDhXSmxCd3g5SncwK1UrTitSNytwL3RNOUozam1LT1BMUlBWeUx1UG9P?=
 =?utf-8?B?RUV6RHBlYTZUK3pjRFJVYnZzaXd4N1VUUGU5VTVXbkpQMDNuM0YxMTZFaTd3?=
 =?utf-8?B?Q0RVNWJxSVlKWGc3SmJZWDNLSHIzZno2bytFOEphU0hkU0hoTmMzRTFpQXQ5?=
 =?utf-8?B?cSsvQkpwakR0c0dMZU9ZUWp6WE16clVYNFVmRzVaQUFuV2RFYWp5NUJkUWQv?=
 =?utf-8?B?amZFc2wwVVpYaUo5cVlLWTFSVHRwY2wwVldmbUE1ZkhGL1RkMkJHeXI3ZFdB?=
 =?utf-8?B?OE1LZmY0dFJ2MTdDTHhTWFNqWXBYczBKUFVPVWRtdzFkNzZOc1NORWVVTFpT?=
 =?utf-8?B?SlRTbkIvTUw5djZqaFdBQkZVOUt2czlDWERHVWNkNkk5OW5LaHlLUG5RMVRL?=
 =?utf-8?B?bkUwSjVKeitxSkorRnV4eGJ3c0N5eXp4TExEWFkzNTBETWlESXNiTGNQOGpG?=
 =?utf-8?B?MXZwaSsvdHVTUkJBOFRjTXlpa0Z3b3NkVFJFdlluWkl6cXIxaHBXMVQzeEhl?=
 =?utf-8?B?Y3NOR09WbXU5VXM4bTlBOUtReVZ6TlJhU3lyUEhHSFJaR2JaZElUMkpkejZO?=
 =?utf-8?B?Zzc5bmN4aW1pdXdLTGM1K0hwbnV4aEh0cUoyVHpmRU9jaDFRVFBYSC9jZ3ps?=
 =?utf-8?B?ZndGSVFLUmorOUJHRzFPVWtNVkUyc2txUTBJdHR4UmVBbUNoRlorRlZJdUJU?=
 =?utf-8?B?dC9yOFNGM3ZjWlF2SzdTSXJienVIMEt5bVYzeGowR2NaOE5ZU1duaGRpdFpi?=
 =?utf-8?B?dm5ybDBlRkN2THFKZEVvSVdPaHBibHliNDhrWGNSSFVqSUpQSzIwMkxYZ0NQ?=
 =?utf-8?B?SHlOWnJpM3FRNm5IUE1OSHY5dE00RUU0eUhvYkk3eHNEM244ZlJCZkdBZ2hl?=
 =?utf-8?B?cXBMUDNFRTdraWlhck8wTGs3UDFZS21yUTFFTExmN0MyU09pMWRKMWNYeUZG?=
 =?utf-8?B?ckFhSU9WSmxEOHBtNFdpOXN3b2ZaWUNxOTBJMU5hWTRMb3I1T2NkdVg0NUF4?=
 =?utf-8?B?UUNOaXhPcmZzUU8xcDFtMG1xMUNRN2tGeXZ6dG0yZGE3a3AxU3hGRVpJTjZU?=
 =?utf-8?B?b2NpTE9ITVpxL1loWnVIZk12NE9FQ082Z0ZRcExwdjNudlhUQm1uMnQvamh1?=
 =?utf-8?Q?kZK5+iAomgr5uhYA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XQIoEdgtEz5KNtQeZXESjxPDNHVbmoX+kvKL2Ysk8k/ILh5dHWP4/dkwiYWg/6f4aGZaX4OM7TKUdLkz9HrILmFbRxg3EyVKnrEGoZ6ECajksCuUXJLdxTqd10f3R7256EAyMclDkCafoLCMZbsylC4o8lULato24lVaaeRHxUhr1l8PB6VAnsuBH6g0a9Ni01qN4d72343t/ZcxoIGFLtUz9KY2SXh6ECMxNIQOH7Q8AdyFgEPiWsgjFVYmZc+4NPkQWOy/76aQm2tETk3ZalW/zlPPp1UOXifCXqaRIcSPssz0V1weoAogj+4cumDXFInPWNLJRJjmZI3DeYmJzg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5413.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa31bb75-e38a-42c3-3279-08deef909791
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2026 05:49:02.9946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OCDTfrVoLlZ6VyzPLTYL3KFDQZqODH+pZ80EpeRUWORVNxOA6qMlHwAswWUZllFBzPN7c+D69Gsh6klxDsrFhfyv5C54BqyV46MF36aamYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1611BC49E
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRl
bC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiBHdXN0
YXZvIFNvdXNhDQo+IFNlbnQ6IFNhdHVyZGF5LCBKdWx5IDI1LCAyMDI2IDEyOjA1IEFNDQo+IFRv
OiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4gQ2M6IEthbmRwYWwsIFN1cmFqIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT47
IFNvdXNhLCBHdXN0YXZvDQo+IDxndXN0YXZvLnNvdXNhQGludGVsLmNvbT4NCj4gU3ViamVjdDog
W1BBVENIXSBkcm0vaTkxNS94ZTNwX2xwZDogVXBkYXRlIENVUlNPUl9CVUYvV00gbWFza3MNCj4g
DQo+IEZyb206IFN1cmFqIEthbmRwYWwgPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KPiANCj4g
WGUzcCBvbndhcmRzIENVUlNPUl9CVUYvV00gbWFza3MgaGF2ZSBiZWVuIGluY3JlYXNlZC4gVXBk
YXRlIHRoZW0NCj4gdG8gcmVmbGVjdCB0aGUgZm9sbG93aW5nLg0KPiANCj4gQnNwZWM6IDY5ODQ3
LCA2OTg4MA0KPiBTaWduZWQtb2ZmLWJ5OiBTdXJhaiBLYW5kcGFsIDxzdXJhai5rYW5kcGFsQGlu
dGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogR3VzdGF2byBTb3VzYSA8Z3VzdGF2by5zb3VzYUBp
bnRlbC5jb20+DQoNCkxHVE0sDQpSZXZpZXdlZC1ieTogRG55YW5lc2h3YXIgQmhhZGFuZSA8ZG55
YW5lc2h3YXIuYmhhZGFuZUBpbnRlbC5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2N1cnNvcl9yZWdzLmggfCA4ICsrKystLS0tDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3Vyc29yX3JlZ3MuaA0KPiBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3Vyc29yX3JlZ3MuaA0KPiBpbmRl
eCBhYWE2NjMzMTA2M2UuLmRhMmY5NjMwYWUyZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jdXJzb3JfcmVncy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3Vyc29yX3JlZ3MuaA0KPiBAQCAtODEsNyArODEsNyBA
QA0KPiAgI2RlZmluZSAgIENVUl9XTV9FTgkJCQlSRUdfQklUKDMxKQ0KPiAgI2RlZmluZSAgIENV
Ul9XTV9JR05PUkVfTElORVMJCQlSRUdfQklUKDMwKQ0KPiAgI2RlZmluZSAgIENVUl9XTV9MSU5F
U19NQVNLCQkJUkVHX0dFTk1BU0soMjYsDQo+IDE0KQ0KPiAtI2RlZmluZSAgIENVUl9XTV9CTE9D
S1NfTUFTSwkJCVJFR19HRU5NQVNLKDExLA0KPiAwKQ0KPiArI2RlZmluZSAgIENVUl9XTV9CTE9D
S1NfTUFTSwkJCVJFR19HRU5NQVNLKDEyLA0KPiAwKQ0KPiANCj4gICNkZWZpbmUgX0NVUl9XTV9T
QUdWX0EJCTB4NzAxNTgNCj4gICNkZWZpbmUgX0NVUl9XTV9TQUdWX0IJCTB4NzExNTgNCj4gQEAg
LTk4LDEwICs5OCwxMCBAQA0KPiAgI2RlZmluZSBfQ1VSX0JVRl9DRkdfQQkJMHg3MDE3Yw0KPiAg
I2RlZmluZSBfQ1VSX0JVRl9DRkdfQgkJMHg3MTE3Yw0KPiAgI2RlZmluZSBDVVJfQlVGX0NGRyhw
aXBlKQlfTU1JT19QSVBFKChwaXBlKSwgX0NVUl9CVUZfQ0ZHX0EsDQo+IF9DVVJfQlVGX0NGR19C
KQ0KPiAtLyogc2tsKzogMTAgYml0cywgaWNsKyAxMSBiaXRzLCBhZGxwKyAxMiBiaXRzICovDQo+
IC0jZGVmaW5lICAgQ1VSX0JVRl9FTkRfTUFTSwkJUkVHX0dFTk1BU0soMjcsIDE2KQ0KPiArLyog
c2tsKzogMTAgYml0cywgaWNsKyAxMSBiaXRzLCBhZGxwKyAxMiBiaXRzLCB4ZTNwbHBkKyAxMyBi
aXRzICovDQo+ICsjZGVmaW5lICAgQ1VSX0JVRl9FTkRfTUFTSwkJUkVHX0dFTk1BU0soMjgsIDE2
KQ0KPiAgI2RlZmluZSAgIENVUl9CVUZfRU5EKGVuZCkNCj4gCVJFR19GSUVMRF9QUkVQKENVUl9C
VUZfRU5EX01BU0ssIChlbmQpKQ0KPiAtI2RlZmluZSAgIENVUl9CVUZfU1RBUlRfTUFTSwkJUkVH
X0dFTk1BU0soMTEsIDApDQo+ICsjZGVmaW5lICAgQ1VSX0JVRl9TVEFSVF9NQVNLCQlSRUdfR0VO
TUFTSygxMiwgMCkNCj4gICNkZWZpbmUgICBDVVJfQlVGX1NUQVJUKHN0YXJ0KQ0KPiAJUkVHX0ZJ
RUxEX1BSRVAoQ1VSX0JVRl9TVEFSVF9NQVNLLCAoc3RhcnQpKQ0KPiANCj4gIC8qIHRnbCsgKi8N
Cj4gDQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDogOGQ4YjAxNWNhNGNlYmFiNzQ2MjFmODNjMjIzZWFj
Y2UyMmNjNmYwZQ0KPiBjaGFuZ2UtaWQ6IDIwMjYwNzI0LXhlM3BfbHBkLWN1cnNvci1kYnVmLWlu
Y3JlYXNlLWI4NDczYWUwMjllMA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAtLQ0KPiBHdXN0YXZv
IFNvdXNhIDxndXN0YXZvLnNvdXNhQGludGVsLmNvbT4NCg0K
