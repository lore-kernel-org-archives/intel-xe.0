Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F26FF531EC
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 05:36:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1AE910E065;
	Tue, 14 Apr 2026 05:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TNm1eYbH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E4710E065
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 05:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776144971; x=1807680971;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QOVXwuvcPJF7olsVHJOL4Go93KfdEanxqyRpx9/edI4=;
 b=TNm1eYbH/8rI2/odDcuirplNdqTmianMPyQkOEdpgC8AXNE3ajGW4SF1
 cv85eFablD5vg6SXQdoG4ioXT8jeYvEVyAmA577w1UMHv19pWi1NW6V9w
 sNEpktn8Vhtqb7CL24wQI+4HR6nXgezWN2hdC3NvgQ/JiVoUqyQpqAsMx
 CndgmLH0XwGaxdt0Fx8ZmAjdD53qcHOo1gHu8kQXapiWTy79XJDlD7s9H
 r3+W7bAIc1DC4g/9yC6PSdllqE5JvtWocNRlv2GJP3UEA79qf1kHuNqTS
 Tm6QCw2jMSOZE//CqWoaPIHlQ3etImaMCvXzRd7s1m0ZyrB3bGX5DbqYZ w==;
X-CSE-ConnectionGUID: A4E4T65YTbe9/dhKRp70uQ==
X-CSE-MsgGUID: zNiQNtuGRHuj+KZlAGfd5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76797129"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="76797129"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 22:36:10 -0700
X-CSE-ConnectionGUID: psXxKQ5LS9qHaqXWPAStow==
X-CSE-MsgGUID: HWw65xl0ROW0ZSBmpWOXZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="234027431"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 22:36:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 22:36:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 22:36:09 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 22:36:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dG0zq+gd+iNQAtEt8iTywj4/xLc1qYn+i3n553yIHgOy9oi285V52CxbF/Md0ZflxbKqK6wQRB0WuSBQlsA7O0PETiVMJQ56n5zrpnxWMikueRARpufMioyxoiIBJaOVtni4ARlYWjAw2gATjcgiNjAm1m2baZY4wwq+uLZoRefU5H/bDyMKCJQYXfWJjPuj0S85Sjbi3hUkeLNhJ+peVtiOwvFMSmjKn0zIdgmMV6JTwBE0uzZ6CvobBd8lYZLl2TebVq9/Ak8GLkfrco2iEDcKIGGgSvNnKVlpubd0nfU073AtZwmkBAW+Thcq9v38MZTSDv0HZHHFW0o2pGBy1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOVXwuvcPJF7olsVHJOL4Go93KfdEanxqyRpx9/edI4=;
 b=Fa55Z9larbNLFLPDnNX7Zs7P2zEPU2ksKfZHQZunkXM18k9uiHWaoBddFqFv9iqCFIdpaeUaSz38gzJTxrmpRFvTOTMVAQVb4H6FfoTUVK7sqDVOQc496n/0WWED58yAyhtq5nQq9hsjEwxYYLdUVwbVY6COx8aR6df5UWyS5leATJjaB8eH2W8/3UD7x+npG4u7BlqIFGs6Nl+88+20rGzAfDAc4KzGlnWRDbGIO99evACF904DIRDoIqv0JLKssmXIxGmIZikN26xqtDnBUcaVfcMU15apEO0Mn6pZa1Wvt/IH1D0HnnxeEl1sbOXP+ZOOwIXGhHpWI7GsQHTXXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DSWPR11MB9739.namprd11.prod.outlook.com (2603:10b6:8:356::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 05:36:08 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437%6]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 05:36:08 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [RFC PATCH V7 2/9] drm/gpu: Add gpu_buddy_addr_to_block helper
Thread-Topic: [RFC PATCH V7 2/9] drm/gpu: Add gpu_buddy_addr_to_block helper
Thread-Index: AQHcy0fVEP38HQaGO0i+TlIjLVeI/bXdP+AAgADJS0A=
Date: Tue, 14 Apr 2026 05:36:07 +0000
Message-ID: <SJ1PR11MB62047D427E3A5E8712437CAA81252@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20260413131623.2891528-11-tejas.upadhyay@intel.com>
 <20260413131623.2891528-13-tejas.upadhyay@intel.com>
 <b95cb8c7-301a-4de4-877a-d45d981272fa@intel.com>
In-Reply-To: <b95cb8c7-301a-4de4-877a-d45d981272fa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DSWPR11MB9739:EE_
x-ms-office365-filtering-correlation-id: 4d281ec4-db83-43ec-cc12-08de99e7ba9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: br9iBtiaagw28Mb42K/NMOkPUsSMsRX6TI0cQ56iJOBGROz+AJp21QiLP6TlacAwCqKqPjJ3zhJ9V/plAo2V20wDaIeMXoEBQiDFiwrUK8Y12MjDyHMGrrM/may+dvzpl8FMi8AkPaA8bv2lTzMYT0g9TUAsBXr9YOGAHEtVhrzlFcq3jmv1PnDp3lAAQrtlwkYbGAmcACfVZyRvKjijtU/VOTAuB4JOq9j1hk26mfIYhRhCRbGG8TYyQegQmkDlCnxI6ciUDyLE669tlEOlJ1c2fyLi51nnb2S2BvHbRUMNKI9cAxy7e5F4VRFlEcRz+pthgpbJQuDHrG5Ztu9urBtHzj079VHo3Oq6BJOGeXtWS3e06btCKot1NZA5wKqcJrFcnRCWAlcqjAfxUggDG4lHim+xCRxSHT2Ya+QtabQW0O6kAgoqGTSIhamy0wz7l5aAOd3e9giuXnuQBPdutRoVpUiGS/K84EyFh8uzdZR4qBCkyf9zA5hOhqdvT4DY9Lwi37G7X+MSIuC83iNhVN/2OeBylV2mpl84ONZfV22TvSzTmilsi/sTsDJf28NDAWIASKSybmT1IC3NpDxeSFDNJeA0iBN3c+0kI//YxVK3rhbQoOk9WUTAiuxmNVrdSimt/yrQePcRCfLjjZPQWjg8v8ISVFlNgGtmBHxPCx4Iyct0RC8OHxRM81Ae91LYOLPo4Ydp8UFXTciSg2/olJHgsu/qfuNGwPcnzC1vBJYNGlepxR0h8RqcLRt+0kD9IFZbZdhCZ9LcJJe5t93ZdsuXR2i6AdcYzlPWWYM1Zo0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T01CMkxKdVZJdmQ0WHN2b1UvRldyRTNKTzFFeUZIcHV2NUsvemxnK0VXTDlm?=
 =?utf-8?B?OVArakJSU01yY1RBNFlXdStzVkdJbHBvTjMxQ3FaTlkwemx6dEhkbXFiQndw?=
 =?utf-8?B?bU13bmNHUjhrLzN1cTBtMzVzc2JmWERIRlNWWlluQk90ZktsU1lKa0tWclRB?=
 =?utf-8?B?dHNFUlJYZ2tGVXFTWGtpVVFVeTUzRFlKaStkczdvUjg4NHFzQkdVY1IvK28z?=
 =?utf-8?B?aGtaOG5DYk5MdDJmMkdhSFVVSHZSY3ZHdFRiZkJwSktHY2VmNnVNdHp1UW5o?=
 =?utf-8?B?SlhMaWl3Vml6Z1NPNmxSMWZKSFVyaCsxblFaTWpZUzB6SVBiN3hlVjFqUWxa?=
 =?utf-8?B?Tko1dDVKMGc1NG5wNTN0UlBhS3ltNEttUERDelhucDJock1XZkFwQk9QQmU3?=
 =?utf-8?B?eDdnVVcvRDlvNDVkL29VdkRnSnRhR1hoRDNQWkxhV2pjZGdoRzlTQ2Y2SHQ4?=
 =?utf-8?B?L1NpUG00elBtQVVFaWVZYnVCbTBkOW5NcTd6bWtLRS9CTFRPR0h2VjIvdkRR?=
 =?utf-8?B?VlY3VFViMDg2bXQzeGI1Vk5UVkFlVFJSa1VtMjBMYzJ5YmNkSTUxamNvZ3Nj?=
 =?utf-8?B?bXlMZERFY3FoUUg3S1ZGLzhPeEgwbzFYN3FZbUdOVEtiKzZGSFoyRkpuSlpH?=
 =?utf-8?B?Z0Z1K01tcXJNMWs0SjkwMjJEWmpGak9ZV093TVFWd1VNaDFvZGVoOE92YmpH?=
 =?utf-8?B?S3VLWWs4WDNiRHA2TjY0dzVlZjFCOVVlTThQVmdTWnZ4N2lBeFVIVHdDN1E2?=
 =?utf-8?B?MjdkZXdlZ1NRQjhSRFhYZkZzTjFMaVBXYllEOW1rVkhrU3Znd1RFdjZscG5p?=
 =?utf-8?B?cGNWTHUvcTMvMEFrazUvU2RKQlRnNFNuWXV3RFVOZWhMQ3pGYlFxV29KelVm?=
 =?utf-8?B?N2srbWlBMXM4M1ZxS2lTWE1oR0xUN2ozbWovWFBhYUllVjdLMGY2NmhBWVl4?=
 =?utf-8?B?NmNETDFLVVVTeHVTeHFWRXNIMjR0cTBmVHpFSUtOL3VtUzB2YmUwWkR6TTNV?=
 =?utf-8?B?Z1VucXNvdFFmMW5UTXlpeEZzWm54RmR1cWpRM1dCbkhOUXJLek56ZVhua2Rq?=
 =?utf-8?B?dlJCSjdHODYvblFNb0M5cTlZZFJaK3ZsNzhmdG1mRjNYTVIyc3FybDFJWWdT?=
 =?utf-8?B?ZzVpYU9JY2kxVStMOStqWksxc2VpSlJLaVZ4WCtuR0M4Nk9QcjFtYlJEclM1?=
 =?utf-8?B?d0k0Wm5sS3JNQjNNblRGM3l6aGhsNXhZT212SUZwUUN2Y3ZpV1VqSTdXSmdE?=
 =?utf-8?B?MG54UnY2OEV4T0FyT3pDem0vN3diVnIxVUhSbDQyUEpOTmV6NW1IN1prOHVK?=
 =?utf-8?B?L2M1dFdWR2U3L0xCRi9hbE5KNmNGOVJPRHIxUFkyZEdqNGNYZnNyYXpZanhl?=
 =?utf-8?B?ajRWWlhuM2NaYVpNZXpPOGlXNGtlSGlvK3g0SVlzdkNvbndkNXRmc05JblJ1?=
 =?utf-8?B?V3kvb3JiUjA4cG9rUVlzOU0yY2M4M0xneU9QL0ZxUjNqVmFkTW0rZ3FTcU42?=
 =?utf-8?B?VHVWSC9Dc2pDeldjYldKNzB1MS8zbWEvY3JDNVVYR1pHTW9hK1h5RnhUMVI5?=
 =?utf-8?B?NmtGcXBjd1BrRHRLalozcy80UDFMKzVFdDBuN3d0cnJ4UGpNOU04MzJVN01h?=
 =?utf-8?B?ZWdGOENKS25wY01OemoraVlUMWdmbDRQaWZhWUZVdHloa1hVcWFmMnVoQ1ly?=
 =?utf-8?B?WUtwRG1zRDhueHNORW5lTGZOdENxRnVzMHZ3MlBST0dUYldsUUMvaXlXZnBt?=
 =?utf-8?B?Mkh4bnpXM2hqOVBRTDVENHVRVlVuN0hQTHhRclUwUVFSeGtpNG5ZUkcvc3c4?=
 =?utf-8?B?RW1xdUZ6Vnc1UHBrQTFZQWhwN3ludkFvdHZpSVNUcDljN0hCaFlFbGpHRmMr?=
 =?utf-8?B?am11UnQ1bjRPaCtydnkyNnlJNVhoSFNSazlPZklBYWRtZEVuOWVtRjNRaFJQ?=
 =?utf-8?B?b25HRk9FUmtFTVQ5WUxUdlZyOEY5U0F1Rzl1YUtZWGtzVUNiT0RpdmNjZ3Bm?=
 =?utf-8?B?ak9ST282Y3l3Q0FSZTVXZ3k1RUlmeFhiKzFwSHRZWnkxWkVXSjVvMU9CTjJT?=
 =?utf-8?B?emx1ZFRxdmpic1JxK2FURllKaDdVN3M5QjZZc2plU2h3N1dSbStTcjZwckxE?=
 =?utf-8?B?VUsxS0dORDNMOGo4cWlDTzdHTkRlTzhYbEJOMjlQNHlIcEdTSHNzVFk5M2hR?=
 =?utf-8?B?bWdYaUxPZjA3WUF1eGNWemVPZXZYNGpWZGo3VlV3L1ZteTBCR2k1cG9HVHoy?=
 =?utf-8?B?c1V1TkxZOXFodXJMcVllZTFSNVlKRGpLdmVSV0VFWmZNOUVLL2libEdZanpV?=
 =?utf-8?B?ZTBUb0xZNXVWQ3BVN1FZam1iTlFiOCt6cmVTWDczL3hzYU14cG43dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TrPFdSTugEWQc4PkLGgZiXzgnOpAqvImYGOcMSV158ouJwmyQAgu9Iw05AjlSt9FK3N3UJtZe3abjd/db5qZ/mkdkkszhhSHdtY39Fzsm6oe3WE7+DH37Mwjpj341sMmYGxwnNzUIhVXiODBaZBn5Jze4akyJ5s4+srXTFi2KwiEe8vWxfDx4SlJ3cfonTsJ5/kTd1P2Z5KIFbP1YpJwwYc3G4mZr4lPRR2zvAHajWg95V5ya1392ikP49PsblyiG1JkqaXIsHBjZdzvrYj/KIlZufyXSo37GgzPATnmydOqfdE9fssodR8qataBL4fzpI0A6rbfFtfXVFA0iJC+3Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d281ec4-db83-43ec-cc12-08de99e7ba9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 05:36:07.9828 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ryOJLs88j09T/iQ4sq2Lr+RfhmcYygA/gvq3pGBm0HCRMDpLCiLaCR/Pn9n69mJ50WL7qJXF927gcmrR1ZUK6MTRjtOWaJ+KTiCjurNPQVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9739
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogMTMgQXByaWwgMjAyNiAyMzowMA0KPiBU
bzogVXBhZGh5YXksIFRlamFzIDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+OyBpbnRlbC0NCj4g
eGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBCcm9zdCwgTWF0dGhldyA8bWF0dGhldy5i
cm9zdEBpbnRlbC5jb20+Ow0KPiB0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbTsgR2hp
bWlyYXksIEhpbWFsIFByYXNhZA0KPiA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggVjcgMi85XSBkcm0vZ3B1OiBBZGQgZ3B1X2J1ZGR5
X2FkZHJfdG9fYmxvY2sNCj4gaGVscGVyDQo+IA0KPiBPbiAxMy8wNC8yMDI2IDE0OjE2LCBUZWph
cyBVcGFkaHlheSB3cm90ZToNCj4gPiBBZGQgaGVscGVyIHdpdGggcHJpbWFyeSBwdXJwb3NlIGlz
IHRvIGVmZmljaWVudGx5IHRyYWNlIGEgc3BlY2lmaWMNCj4gPiBwaHlzaWNhbCBtZW1vcnkgYWRk
cmVzcyBiYWNrIHRvIGl0cyBjb3JyZXNwb25kaW5nIFRUTSBidWZmZXIgb2JqZWN0Lg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogVGVqYXMgVXBhZGh5YXkgPHRlamFzLnVwYWRoeWF5QGludGVsLmNv
bT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2J1ZGR5LmMgICAgICAgfCA1Ng0KPiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIGluY2x1ZGUvbGludXgv
Z3B1X2J1ZGR5LmggfCAgMiArKw0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1OCBpbnNlcnRpb25z
KCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvYnVkZHkuYyBiL2RyaXZlcnMv
Z3B1L2J1ZGR5LmMgaW5kZXgNCj4gPiA1MjY4NjY3MmU5OWYuLjJkMjZjMmEwZjk3MSAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9idWRkeS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvYnVk
ZHkuYw0KPiA+IEBAIC01ODksNiArNTg5LDYyIEBAIHZvaWQgZ3B1X2J1ZGR5X2ZyZWVfYmxvY2so
c3RydWN0IGdwdV9idWRkeQ0KPiAqbW0sDQo+ID4gICB9DQo+ID4gICBFWFBPUlRfU1lNQk9MKGdw
dV9idWRkeV9mcmVlX2Jsb2NrKTsNCj4gPg0KPiA+ICsvKioNCj4gPiArICogZ3B1X2J1ZGR5X2Fk
ZHJfdG9fYmxvY2sgLSBnaXZlbiBwaHlzaWNhbCBhZGRyZXNzIGZpbmQgYSBibG9jaw0KPiA+ICsg
Kg0KPiA+ICsgKiBAbW06IEdQVSBidWRkeSBtYW5hZ2VyDQo+ID4gKyAqIEBhZGRyOiBQaHlzaWNh
bCBhZGRyZXNzDQo+ID4gKyAqDQo+ID4gKyAqIFJldHVybnM6DQo+ID4gKyAqIGdwdV9idWRkeV9i
bG9jayBvbiBzdWNjZXNzLCBOVUxMIG9yIGVycm9yIGNvZGUgb24gZmFpbHVyZSAgKi8NCj4gPiAr
c3RydWN0IGdwdV9idWRkeV9ibG9jayAqZ3B1X2J1ZGR5X2FkZHJfdG9fYmxvY2soc3RydWN0IGdw
dV9idWRkeQ0KPiAqbW0sDQo+ID4gK3U2NCBhZGRyKSB7DQo+ID4gKwlzdHJ1Y3QgZ3B1X2J1ZGR5
X2Jsb2NrICpibG9jazsNCj4gPiArCUxJU1RfSEVBRChkZnMpOw0KPiA+ICsJdTY0IGVuZDsNCj4g
PiArCWludCBpOw0KPiA+ICsNCj4gPiArCWVuZCA9IGFkZHIgKyBTWl80SyAtIDE7DQo+ID4gKwlm
b3IgKGkgPSAwOyBpIDwgbW0tPm5fcm9vdHM7ICsraSkNCj4gPiArCQlsaXN0X2FkZF90YWlsKCZt
bS0+cm9vdHNbaV0tPnRtcF9saW5rLCAmZGZzKTsNCj4gPiArDQo+ID4gKwlkbyB7DQo+ID4gKwkJ
dTY0IGJsb2NrX3N0YXJ0Ow0KPiA+ICsJCXU2NCBibG9ja19lbmQ7DQo+ID4gKw0KPiA+ICsJCWJs
b2NrID0gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKCZkZnMsDQo+ID4gKwkJCQkJCSBzdHJ1Y3Qg
Z3B1X2J1ZGR5X2Jsb2NrLA0KPiA+ICsJCQkJCQkgdG1wX2xpbmspOw0KPiA+ICsJCWlmICghYmxv
Y2spDQo+ID4gKwkJCWJyZWFrOw0KPiA+ICsNCj4gPiArCQlsaXN0X2RlbCgmYmxvY2stPnRtcF9s
aW5rKTsNCj4gPiArDQo+ID4gKwkJYmxvY2tfc3RhcnQgPSBncHVfYnVkZHlfYmxvY2tfb2Zmc2V0
KGJsb2NrKTsNCj4gPiArCQlibG9ja19lbmQgPSBibG9ja19zdGFydCArIGdwdV9idWRkeV9ibG9j
a19zaXplKG1tLCBibG9jaykgLQ0KPiAxOw0KPiA+ICsNCj4gPiArCQlpZiAoIW92ZXJsYXBzKGFk
ZHIsIGVuZCwgYmxvY2tfc3RhcnQsIGJsb2NrX2VuZCkpDQo+ID4gKwkJCWNvbnRpbnVlOw0KPiA+
ICsNCj4gPiArCQlpZiAoY29udGFpbnMoYWRkciwgZW5kLCBibG9ja19zdGFydCwgYmxvY2tfZW5k
KSAmJg0KPiANCj4gT29wcywgdGhpcyBsb29rcyBsaWtlIHRoZSBidWcgeW91IHdlcmUgaGl0dGlu
Zy4gVGhpcyBpcyBjb3B5LXBhc3RhIGZyb20NCj4gcmFuZ2VfYWxsb2MsIHdoZXJlIHdlIHdhbnQg
dG8gYWxsb2NhdGUgZXZlcnkgbm9kZSB0aGF0IGZ1bGx5IGNvbnRhaW5zIHRoZQ0KPiBbYWRkciwg
ZW5kXSwgcmVjdXJzaXZlbHkgc3BsaXR0aW5nIHVudGlsIHRoYXQgaGFwcGVucy4gQnV0IGhlcmUg
d2UgYWN0dWFsbHkganVzdA0KPiB3YW50IHRoZSBmaXJzdCBub24tc3BsaXQgb3ZlcmxhcHBpbmcg
bm9kZSwgc2luY2Ugd2UgY2FuJ3Qgc3BsaXQgYW55dGhpbmcuDQo+IA0KPiBJIHRoaW5rIGp1c3Qg
cmUtd3JpdGUgdGhpcyB3aG9sZSB0aGluZyBhczoNCj4gDQo+IGlmICghb3ZlcmxhcHMoYWRkciwg
ZW5kLCBibG9ja19zdGFydCwgYmxvY2tfZW5kKSkNCj4gICAgICBjb250aW51ZTsNCj4gDQo+IGlm
IChncHVfYnVkZHlfYmxvY2tfaXNfYWxsb2NhdGVkKGJsb2NrKSkNCj4gICAgIHJldHVybiBibG9j
azsNCj4gZWxzZSBpZiAoZ3B1X2J1ZGR5X2Jsb2NrX2lzX2ZyZWUoYmxvY2spKQ0KPiAgICAgcmV0
dXJuIE5VTEw7DQoNClllcyB0aGlzIHdvcmtzIGFuZCBlbGltaW5hdGVzIGJ1ZyB3ZSBzYXcgeWVz
dGVyZGF5LiBJIGhhZCBkb3VidCB0aGF0IHdoYXQgaWYgd2UgaGF2ZSBhZGRyZXNzIHdoaWNoIGlm
IHdlIG1hcCB0byA0ayBtaWdodCBiZSBnb2luZyB0byBlbmQgaW4gbmV4dCBzcGxpdCBibG9jaywg
YnV0IGl0IG1ha2VzIHNlbnNlIEkgdGhpbmsgd2Ugd2lsbCBhbGlnbiB0byBmaXJzdCBzcGxpdCBi
bG9jayBvciBuZXh0IHNwbGl0IGJsb2NrIGJhc2VkIG9uIGFkZHJlc3MgYXMgd2hlcmUgaXQgZmFs
bHMgYW5kIHdvbnQgY29uc2lkZXIgYm90aCBhZGphY2VudCBzcGxpdCBibG9ja3MgYXQgdGhlIHNh
bWUgdGltZS4gQ2xlYXIuDQoNClRlamFzDQo+IA0KPiBsaXN0X2FkZCgmYmxvY2stPnJpZ2h0LT50
bXBfbGluaywgJmRmcyk7IGxpc3RfYWRkKCZibG9jay0+bGVmdC0+dG1wX2xpbmssDQo+ICZkZnMp
Ow0KPiANCj4gQW5kIHRoaXMgc2hvdWxkIGZpeCB5b3VyIGlzc3VlIGFuZCBzaW1wbGlmaWVzIHRo
aXMgY29kZSBhIGJpdC4NCj4gDQo+ID4gKwkJICAgICFncHVfYnVkZHlfYmxvY2tfaXNfc3BsaXQo
YmxvY2spKSB7DQo+ID4gKwkJCWlmIChncHVfYnVkZHlfYmxvY2tfaXNfZnJlZShibG9jaykpDQo+
ID4gKwkJCQlyZXR1cm4gTlVMTDsNCj4gPiArCQkJZWxzZSBpZiAoZ3B1X2J1ZGR5X2Jsb2NrX2lz
X2FsbG9jYXRlZChibG9jaykgJiYNCj4gIW1tLT5jbGVhcl9hdmFpbCkNCj4gPiArCQkJCXJldHVy
biBibG9jazsNCj4gPiArCQl9DQo+ID4gKw0KPiA+ICsJCWlmIChncHVfYnVkZHlfYmxvY2tfaXNf
c3BsaXQoYmxvY2spKSB7DQo+ID4gKwkJCWxpc3RfYWRkKCZibG9jay0+cmlnaHQtPnRtcF9saW5r
LCAmZGZzKTsNCj4gPiArCQkJbGlzdF9hZGQoJmJsb2NrLT5sZWZ0LT50bXBfbGluaywgJmRmcyk7
DQo+ID4gKwkJfQ0KPiA+ICsJfSB3aGlsZSAoMSk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIEVSUl9Q
VFIoLUVOWElPKTsNCj4gPiArfQ0KPiA+ICtFWFBPUlRfU1lNQk9MKGdwdV9idWRkeV9hZGRyX3Rv
X2Jsb2NrKTsNCj4gPiArDQo+ID4gICBzdGF0aWMgdm9pZCBfX2dwdV9idWRkeV9mcmVlX2xpc3Qo
c3RydWN0IGdwdV9idWRkeSAqbW0sDQo+ID4gICAJCQkJICBzdHJ1Y3QgbGlzdF9oZWFkICpvYmpl
Y3RzLA0KPiA+ICAgCQkJCSAgYm9vbCBtYXJrX2NsZWFyLA0KPiA+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2xpbnV4L2dwdV9idWRkeS5oIGIvaW5jbHVkZS9saW51eC9ncHVfYnVkZHkuaA0KPiA+IGlu
ZGV4IDVmYTkxN2JhNTQ1MC4uOTU3YzY5YzU2MGJjIDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUv
bGludXgvZ3B1X2J1ZGR5LmgNCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L2dwdV9idWRkeS5oDQo+
ID4gQEAgLTIzMSw2ICsyMzEsOCBAQCB2b2lkIGdwdV9idWRkeV9yZXNldF9jbGVhcihzdHJ1Y3Qg
Z3B1X2J1ZGR5DQo+ICptbSwNCj4gPiBib29sIGlzX2NsZWFyKTsNCj4gPg0KPiA+ICAgdm9pZCBn
cHVfYnVkZHlfZnJlZV9ibG9jayhzdHJ1Y3QgZ3B1X2J1ZGR5ICptbSwgc3RydWN0DQo+ID4gZ3B1
X2J1ZGR5X2Jsb2NrICpibG9jayk7DQo+ID4NCj4gPiArc3RydWN0IGdwdV9idWRkeV9ibG9jayAq
Z3B1X2J1ZGR5X2FkZHJfdG9fYmxvY2soc3RydWN0IGdwdV9idWRkeQ0KPiAqbW0sDQo+ID4gK3U2
NCBhZGRyKTsNCj4gPiArDQo+ID4gICB2b2lkIGdwdV9idWRkeV9mcmVlX2xpc3Qoc3RydWN0IGdw
dV9idWRkeSAqbW0sDQo+ID4gICAJCQkgc3RydWN0IGxpc3RfaGVhZCAqb2JqZWN0cywNCj4gPiAg
IAkJCSB1bnNpZ25lZCBpbnQgZmxhZ3MpOw0KDQo=
