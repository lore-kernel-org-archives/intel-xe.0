Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35016EEAA71
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 20:44:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E241A10E19C;
	Thu, 14 Sep 2023 20:44:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B923110E19C
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 20:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694724243; x=1726260243;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=I6de5EyDu5RH30LrWWqCbUz4e2Jm9n0VFmstMcFT8L0=;
 b=MfUY4dyaxRmgPW1BVKmxIDPh3nlfoo6o6FbIAk78s37/O0LJsSWN4xAB
 0Tre1YldMeI/iALfloGbi3iqYDCuyhb+rMCfExFSokeQ47uo0wDGv+xS6
 3sr8pEZ4NVnRvoeGSMoyuEjh8QPRzAXIlXGvXalIbA8IgkkiO+VQRMllJ
 DRSka8KiEtrN+YJPuJSjmc0lK7NZ1388hW5uC2Gx1AOoqluCz9YcCJU7E
 yfcXCQZ7agvGgjspsIhMbIWHcp/L2+YRySFRg39bxZ+MWhF2rViqEk9r8
 DWaB0QB3USGQFsJIIlqm2sDI2aynJizXyG8JnPLgHlOXi+MFxsDu+LMag w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="410011266"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="410011266"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 13:43:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="1075530377"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="1075530377"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2023 13:43:38 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 13:43:37 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 13:43:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 13:43:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 13:43:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRZIch+xbgzFAn+jKeVPzObCf5dPy5NJNzJ/BpJVDIk7kigh/ERy97KGlTZl7qyK6CO6tt3Y+hOzxKJysPQ1tNWpPh66Z5KSSWvhBr35gygHqski+UU2qo3PnoL82QWuOj/U2BfjpdmkrJ7aPFPB6badlsGuL71YkGnTnBb+E0RgxY8Y5ewqSNN+f4DKWL5vvtax/IEi6OnXDUTI8tc9aVuteCRhG49KyLhdoz4UCrlEgIlxGun6YvMdFsBqqWHTOTLOOr0NhAEXurtebFGUl8ZIh7HBJQKJA5EwosMyMi6dUxHhhZtnboR8HGJ2JLTX1qqMudN6uDKJ12+tk/0TlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6de5EyDu5RH30LrWWqCbUz4e2Jm9n0VFmstMcFT8L0=;
 b=WwjbCnpFZugOU/SFcbVbmOt+hPG5tIlfAZg+UdohxpaR3H91by2Kp8u3FKorJ+h1Xd4o6mKkWxXNh+ZUrz3Wunca1BAROWyPbItTsG/uADakMLmgjedeczWnmwneqqmJSZlYepimO5O034Ht3k85fd9bmhjx+mZro3cAB7DOWfcRjTPDTrpBs2Hbjx4B7NCdwLxuo2FzImuBnXG9mXQcYACH4KFIo2OiKZrYHBc9A5104Ob2gZZLrH/U5Fk88797CffzyetZ5NPs1VxRGy1ptMB4ozM/3qbhJ1m+xe3WmUVWUBaLBbRuK8G9myOpptPxbWi3mHtoiBSGzxqGGIObiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by BN9PR11MB5531.namprd11.prod.outlook.com (2603:10b6:408:104::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 20:43:34 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 20:43:34 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH] xe: Add a uAPI to query micro-controler firmware version
Thread-Index: AQHZ50rgilR5Z23cyU+gGbWGmFwchbAayakA
Date: Thu, 14 Sep 2023 20:43:34 +0000
Message-ID: <c5fe08c4d7617ee002aac2c0566b313a78aa7e2a.camel@intel.com>
References: <20230914203419.111424-1-jose.souza@intel.com>
In-Reply-To: <20230914203419.111424-1-jose.souza@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|BN9PR11MB5531:EE_
x-ms-office365-filtering-correlation-id: 336a8161-a68d-4a7b-9227-08dbb56343e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DI6OEm4Iu7d70G2JK1YkEACduUK3KSHyMRQW6qm4n9sv3SWXEED78pniv1TYhgRqqloJFwGySsSdTzT4CXy3L15w7R5bZIBsS5AA0zWKu3r5T00ZRRIRKLX4ps6NG7G+aj+Jsw8kxC0OvVDo6jbGSi1nofihR5bFfifNesfkXc3zhLE6l+O0FY1Ci692UtdWdZn9iBX9c5ckxZlEKbka8I13+PaiuFj8iFo3LSspGBebVPdNBi7jIv2ItCxdSop7lVlldNxD2iu3vh3cItKsjacpsSbZT8ZnwP+GL0kl827SpXaHabRWiJN4sSZa1iw3NFLQGa9RBwnj81zbN0Es1WB8Z7P3USeGues4fVgu3egHd8Mj3X3ltN2SJgap9mBD1hSZ6kT2JQ1UL6Xo8lVisLOl4U47CbXoA0Jb/r0IoHNIG8lufeY3d/ZLU1fxMqBL4NIsbgfdsGGTPqY5LbhAGvXYSUmZg7GHqrQl464QpDrf3Ft3NBLeZb8XvDYzHqBiDd5OaYbTdUXYnwSXg+0h6rL681z+XGSP2Ki3QAdtTYUFu3pO9RLjZIJHZ9mVoVBmNfhanvBPakgYSssmhEHNuszKlEXEc5EJSxa/jTGDoG5ew/cCj1ZbeaqH44xLQ/QWJMpsmyUL/oCuAokHj2MkqA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(39860400002)(376002)(136003)(366004)(1800799009)(451199024)(186009)(66446008)(91956017)(64756008)(71200400001)(66946007)(76116006)(66476007)(66556008)(6506007)(6486002)(41300700001)(6512007)(316002)(6916009)(966005)(478600001)(2616005)(8676002)(8936002)(5660300002)(26005)(36756003)(38100700002)(38070700005)(122000001)(82960400001)(2906002)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEhGTUY5RFZncDE5Q2hnTlhmeEExVHVNL0lhZjR1VDMyQWhxdWdRalVxREF5?=
 =?utf-8?B?aE9lTkR2S1A1Z2ZzZnUxV1BFZ0tiOGhhNkMzdWdrNDdxOXF1ME9Xa2FQWW8x?=
 =?utf-8?B?WFExT0phRm5TTFI1cE95RXZQMGExQzc1dUpjRUpLajlpQnpQSHlxd0xXOFVp?=
 =?utf-8?B?Tm5oR3N5QU1xNjM0dkVtVWRSUlVGSXBlMHpuK0toRXJweXllUzVlVnlLTjNp?=
 =?utf-8?B?N3JjOGFaUlprMS95aEJBYm44L2tRWWlLN1R1VUVXcUIwNUUxQ1pvTDJDRng3?=
 =?utf-8?B?dzhDRWJta1AyWkhrR2o4S0tPT29KRy83c3UwR2JtSWZ5Sk9rU1pKOFF3QVVY?=
 =?utf-8?B?eVN2SlBRTmVLYVFnME9zdHFVTDNXcVp6d09mVm9vMHcvNjdiNTNQZjRxc2U4?=
 =?utf-8?B?Z0d5d3A1VTQyVDZsZng3Q21FU2FGamtEQjQzalRJVDRXb3IxbXlHdDRKMjFT?=
 =?utf-8?B?NHJaWE5Fa3JRWG4rWEx6TGFVME5UZWlTK2NzdVFYVDVDZnl6aVpRWWJSemw5?=
 =?utf-8?B?QjFCVTNSUDNLOFcrT3EzYTdUZUx1QzFkWnRXbkpmRUI4VEtEclFMbXg4dDVK?=
 =?utf-8?B?WTZRakJ1M1k1OE1VekhuL3MwRGZOUmtaUHc4Zis4c3ZjUS9YOWF1cFAyMGN4?=
 =?utf-8?B?elAyc0x0Sm51WEpjbGltK1Y1cHhnbXV3Q3pkN1k0U3pLM3N3d1hmVmRrdGJq?=
 =?utf-8?B?dDRxSUxxUGpDNUxSdHN5akhhWWtEUHIvTE8vR21sMHJFRXNkcGhCaDdJSzJO?=
 =?utf-8?B?UEI0S1g3UzJSeDFqQllSOG5GYm5zdkt3OEZaNjVzenA3d2xBUmw0TG44T2Ir?=
 =?utf-8?B?NHVBb2Rsb29SdFNnV1o4amxqRXhLWDlLZVM4aFFqd3BhY2VjWWNQV1lscEUy?=
 =?utf-8?B?U21xMGZYUFpLeHdWeVMyZklJL2xGK0NNa0lNdFhVKzUvdVlCaUhBUXA4alBn?=
 =?utf-8?B?KzdXcjJZcmVaMWpFVlcrQ2dTNTMvWTgyV05yQXZ5dytEeEU5bSt4OGF1UzBr?=
 =?utf-8?B?OE0xR0Q0UmNyMXJaeHRwV2FicTk0U2t3aXRhNUdkYVpIU1lVY1RGNlYrZmhY?=
 =?utf-8?B?bEJHT1IvWS8rTTQzclVNc3c1dGFhdmhNZ1JRNTFkdTNqeUNkcjJHL1IxTmFi?=
 =?utf-8?B?WUoxRTdZdjlsa2xpUXlzMTZML0sycHRnQVl2YWFiaTRRL1RPL0FvRWkxek9x?=
 =?utf-8?B?NTBPZzVpNE56MUh1cklmTjdreWRQU2ZYWmNOUTlqeVdPVmdlWmtWYlRUcWVE?=
 =?utf-8?B?L1BVY0JyVE5LVWphZkFzS3p3YU9RVVV1bjBtUEM1U0tqWVhNVkhKaUg2KzNh?=
 =?utf-8?B?eFBvTU5CMVFUTHA4bmVUNUxxcHQzU1JGaG1Nb0trZkU2aHNJb2l6R1F5Mm45?=
 =?utf-8?B?NlNwK2pmb0pLVngxMDBQVVYwc3AzZHVMdm8xSTJNZWp5aUlRSGoyVHZhTGNx?=
 =?utf-8?B?c1hVeThRQlBOU0R6d05maTYzUGhMOGNqQXRkeURzQjB0VmM2TWlIUGc3d0I4?=
 =?utf-8?B?Y2prdkE1L2lXUDJYUGVRVmNhdHNjWFc3aEJla2lwa25oQUNpR2Z4bXBIdWQ4?=
 =?utf-8?B?WW9CSnJ3eTY3aWxsSS9WczFFbXNrS0pzNm1UUzZqdmREbHFUM0lVVHQ0ZGda?=
 =?utf-8?B?QkoyTFF4VWVkKzdhaTdZS1J3a3l5clZTZnR0L0pyWk80R0NpZzZScFVZSE50?=
 =?utf-8?B?aVR6MXNVMXlHZVo4aitVZ0ZZREpnbStKZzBFQ2ZpRUhPNWs1VlNMbGdyN2E5?=
 =?utf-8?B?eUhNYjlBVWtwYmZnTTIrekROM3N6NUdDaWNER2JZOVJlNENKV0kxeXF2TjJY?=
 =?utf-8?B?RXRsenpMVmZLaE1EMGZHbnVYc0JaNU5TN2JLcEpQL2NMYS9xWEJwWFYxMFhS?=
 =?utf-8?B?YXlha3pFZUwxVTRPcmdVaGhMYXQ3N21xYW91djd6bjJIVnFERWpvVnhVaURl?=
 =?utf-8?B?dHRPMjBpbHlPQ2NMN1crR1N3dGVEOUQ5QWZ0RUpLU01VZ0ZaU2F5R1NJeXdS?=
 =?utf-8?B?NVFsU3B3K1FHMkEzaEUrbzAzSnliNktReldhc095SU95RmZvc2dzS0ZZSFBp?=
 =?utf-8?B?T2pwa2VFS09udS9FUVVjS1BUaW1MNFh3WDJCV1g0cnlPVmQ3Y2ZjNWM1bTN3?=
 =?utf-8?B?NlRhWlRySDdOa3VMVHhGK09wRnluQnRiK1RBcGpJK092QzNveE9WMGlGdjg5?=
 =?utf-8?B?b1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <50706F15608AB54884C877081F501F5A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 336a8161-a68d-4a7b-9227-08dbb56343e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2023 20:43:34.8308 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8IEMObftJ7L0Qfkw5JpeJVy7iCCNZ0oHVMJ4XmrHzIjvB4jvngSa54Yo376lBAMEZkaYugO2FNU9DCrg1/gQ4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5531
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] xe: Add a uAPI to query micro-controler
 firmware version
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

T24gVGh1LCAyMDIzLTA5LTE0IGF0IDEzOjM0IC0wNzAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IHdyb3RlOg0KPiBEdWUgdG8gYSBidWcgaW4gZmlybXdhcmUgTWVzYSBjYW4ndCBlbmFibGUgYnkg
ZGVmYXVsdCB1c2FnZSBvZiBjb21wdXRlDQo+IGVuZ2luZXMgaW4gREcyLg0KPiANCj4gQSBuZXcg
R3VDIGZpcm13YXJlIGZpeGVkIHRoZSBpc3N1ZSBidXQgdW50aWwga25vdyB0aGVyZSB3YXMgbm8g
d2F5DQo+IGZvciBNZXNhIHRvIGtub3cgaWYgdXNlciB3YXMgcnVubmluZyB3aXRoIHRoZSBmaXhl
ZCB2ZXJzaW9uIG9yIG5vdCwNCj4gc28gdGhpcyB1QVBJIGlzIHJlcXVpcmVkLg0KPiANCj4gSSBt
YXkgYmUgZXhwYW5kZWQgaW4gZnV0dXJlIHRvIHF1ZXJ5IG90aGVyIGZpcm13YXJlIHZlcnNpb25z
Lg0KPiANCj4gTW9yZSBpbmZvcm1hdGlvbjogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L21lc2EvbWVzYS8tL21lcmdlX3JlcXVlc3RzLzIzNjYxDQoNClRoZXJlIHdhcyBzb21lIHR5cG9z
IGhlcmUgdGhlIGZpeGVkIHZlcnNpb24gKyB0aGUgTWVzYSBNUiBtYWtpbmcgdXNlIG9mIGl0Og0K
DQoiDQpkcm0veGU6IEFkZCBhIHVBUEkgdG8gcXVlcnkgbWljcm8tY29udHJvbGVyIGZpcm13YXJl
IHZlcnNpb24NCg0KRHVlIHRvIGEgYnVnIGluIEd1QyBmaXJtd2FyZSBNZXNhIGNhbid0IGVuYWJs
ZSBieSBkZWZhdWx0IHRoZSB1c2FnZSBvZg0KY29tcHV0ZSBlbmdpbmVzIGluIERHMiBhbmQgbmV3
ZXIuDQoNCkEgbmV3IEd1QyBmaXJtd2FyZSBmaXhlZCB0aGUgaXNzdWUgYnV0IHVudGlsIG5vdyB0
aGVyZSB3YXMgbm8gd2F5DQpmb3IgTWVzYSB0byBrbm93IGlmIEtNRCB3YXMgcnVubmluZyB3aXRo
IHRoZSBmaXhlZCBHdUMgdmVyc2lvbiBvciBub3QsDQpzbyB0aGlzIHVBUEkgaXMgcmVxdWlyZWQu
DQoNCkl0IG1heSBiZSBleHBhbmRlZCBpbiBmdXR1cmUgdG8gcXVlcnkgb3RoZXIgZmlybXdhcmUg
dmVyc2lvbnMgdG9vLg0KDQpNb3JlIGluZm9ybWF0aW9uOiBodHRwczovL2dpdGxhYi5mcmVlZGVz
a3RvcC5vcmcvbWVzYS9tZXNhLy0vbWVyZ2VfcmVxdWVzdHMvMjM2NjENCk1lc2EvVU1EIGltcGxl
bWVudGF0aW9uOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0vbWVy
Z2VfcmVxdWVzdHMvMjUyMzMNCg0KU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6
YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQoiDQoNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSm9z
w6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMgfCAzNSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrDQo+ICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oICAgICB8IDM2ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDY1IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3F1ZXJ5LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiBpbmRl
eCBhOTUxMjA1MTAwZmVhLi4zNjBkZGE5YmExZDFkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfcXVlcnkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnku
Yw0KPiBAQCAtMzYxLDYgKzM2MSw0MCBAQCBzdGF0aWMgaW50IHF1ZXJ5X2d0X3RvcG9sb2d5KHN0
cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+ICtzdGF0aWMg
aW50DQo+ICtxdWVyeV91Y19md192ZXJzaW9uKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3Qg
ZHJtX3hlX2RldmljZV9xdWVyeSAqcXVlcnkpDQo+ICt7DQo+ICsJc2l6ZV90IHNpemUgPSBzaXpl
b2Yoc3RydWN0IGRybV94ZV9xdWVyeV91Y19md192ZXJzaW9uKTsNCj4gKwlzdHJ1Y3QgZHJtX3hl
X3F1ZXJ5X3VjX2Z3X3ZlcnNpb24gX191c2VyICpxdWVyeV9wdHIgPSB1NjRfdG9fdXNlcl9wdHIo
cXVlcnktPmRhdGEpOw0KPiArCXN0cnVjdCBkcm1feGVfcXVlcnlfdWNfZndfdmVyc2lvbiByZXNw
Ow0KPiArDQo+ICsJaWYgKHF1ZXJ5LT5zaXplID09IDApIHsNCj4gKwkJcXVlcnktPnNpemUgPSBz
aXplOw0KPiArCQlyZXR1cm4gMDsNCj4gKwl9IGVsc2UgaWYgKFhFX0lPQ1RMX0RCRyh4ZSwgcXVl
cnktPnNpemUgIT0gc2l6ZSkpIHsNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJfQ0KPiArDQo+
ICsJaWYgKGNvcHlfZnJvbV91c2VyKCZyZXNwLCBxdWVyeV9wdHIsIHNpemUpKQ0KPiArCQlyZXR1
cm4gLUVGQVVMVDsNCj4gKw0KPiArCXN3aXRjaCAocmVzcC51Y190eXBlKSB7DQo+ICsJY2FzZSBY
RV9RVUVSWV9VQ19UWVBFX0dVQzoNCj4gKwkJcmVzcC5tYWpvcl92ZXIgPSB4ZS0+dGlsZXNbMF0u
cHJpbWFyeV9ndC0+dWMuZ3VjLmZ3Lm1ham9yX3Zlcl9mb3VuZDsNCj4gKwkJcmVzcC5taW5vcl92
ZXIgPSB4ZS0+dGlsZXNbMF0ucHJpbWFyeV9ndC0+dWMuZ3VjLmZ3Lm1pbm9yX3Zlcl9mb3VuZDsN
Cj4gKwkJcmVzcC5wYXRjaF92ZXIgPSB4ZS0+dGlsZXNbMF0ucHJpbWFyeV9ndC0+dWMuZ3VjLmZ3
LnBhdGNoX3Zlcl9mb3VuZDsNCj4gKwkJYnJlYWs7DQo+ICsJZGVmYXVsdDoNCj4gKwkJcmV0dXJu
IC1FSU5WQUw7DQo+ICsJfQ0KPiArDQo+ICsJaWYgKGNvcHlfdG9fdXNlcihxdWVyeV9wdHIsICZy
ZXNwLCBzaXplKSkgew0KPiArCQlyZXR1cm4gLUVGQVVMVDsNCj4gKwl9DQo+ICsNCj4gKwlyZXR1
cm4gMDsNCj4gK30NCj4gKw0KPiAgc3RhdGljIGludCAoKiBjb25zdCB4ZV9xdWVyeV9mdW5jc1td
KShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4gIAkJCQkgICAgICBzdHJ1Y3QgZHJtX3hlX2Rldmlj
ZV9xdWVyeSAqcXVlcnkpID0gew0KPiAgCXF1ZXJ5X2VuZ2luZXMsDQo+IEBAIC0zNjksNiArNDAz
LDcgQEAgc3RhdGljIGludCAoKiBjb25zdCB4ZV9xdWVyeV9mdW5jc1tdKShzdHJ1Y3QgeGVfZGV2
aWNlICp4ZSwNCj4gIAlxdWVyeV9ndHMsDQo+ICAJcXVlcnlfaHdjb25maWcsDQo+ICAJcXVlcnlf
Z3RfdG9wb2xvZ3ksDQo+ICsJcXVlcnlfdWNfZndfdmVyc2lvbiwNCj4gIH07DQo+ICANCj4gIGlu
dCB4ZV9xdWVyeV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLCBzdHJ1
Y3QgZHJtX2ZpbGUgKmZpbGUpDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2Ry
bS5oIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiBpbmRleCAwMGQ1Y2I0ZWY4NWU3Li4w
ZjViZjViMTg3NGFiIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+
ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gQEAgLTM0Niw2ICszNDYsMjkgQEAg
c3RydWN0IGRybV94ZV9xdWVyeV90b3BvbG9neV9tYXNrIHsNCj4gIAlfX3U4IG1hc2tbXTsNCj4g
IH07DQo+ICANCj4gKy8qKg0KPiArICogc3RydWN0IGRybV94ZV9xdWVyeV91Y19md192ZXJzaW9u
IC0gcXVlcnkgYSBtaWNyby1jb250cm9sbGVyIGZpcm13YXJlIHZlcnNpb24NCj4gKyAqDQo+ICsg
KiBHaXZlbiBhIHVjX3R5cGUgdGhpcyB3aWxsIHJldHVybiB0aGUgbWFqb3IsIG1pbm9yIGFuZCBw
YXRjaCB2ZXJzaW9uIG9mIHRoZQ0KPiArICogbWljcm8tY29udHJvbGxlciBmaXJtd2FyZS4NCj4g
KyAqLw0KPiArc3RydWN0IGRybV94ZV9xdWVyeV91Y19md192ZXJzaW9uIHsNCj4gKwkvKiogQHVj
OiBUaGUgbWljcm8tY29udHJvbGxlciB0eXBlIHRvIHF1ZXJ5IGZpcm13YXJlIHZlcnNpb24gKi8N
Cj4gKyNkZWZpbmUgWEVfUVVFUllfVUNfVFlQRV9HVUMgMA0KPiArCV9fdTE2IHVjX3R5cGU7DQo+
ICsJX191MTYgcGFkOw0KPiArDQo+ICsJLyogQG1ham9yX3ZlcjogbWFqb3IgdWMgZncgdmVyc2lv
biAqLw0KPiArCV9fdTMyIG1ham9yX3ZlcjsNCj4gKwkvKiBAbWlub3JfdmVyOiBtaW5vciB1YyBm
dyB2ZXJzaW9uICovDQo+ICsJX191MzIgbWlub3JfdmVyOw0KPiArCS8qIEBwYXRjaF92ZXI6IHBh
dGNoIHVjIGZ3IHZlcnNpb24gKi8NCj4gKwlfX3UzMiBwYXRjaF92ZXI7DQo+ICsNCj4gKwkvKiog
QHJlc2VydmVkOiBSZXNlcnZlZCAqLw0KPiArCV9fdTY0IHJlc2VydmVkWzJdOw0KPiArfTsNCj4g
Kw0KPiAgLyoqDQo+ICAgKiBzdHJ1Y3QgZHJtX3hlX2RldmljZV9xdWVyeSAtIG1haW4gc3RydWN0
dXJlIHRvIHF1ZXJ5IGRldmljZSBpbmZvcm1hdGlvbg0KPiAgICoNCj4gQEAgLTM4NSwxMiArNDA4
LDEzIEBAIHN0cnVjdCBkcm1feGVfZGV2aWNlX3F1ZXJ5IHsNCj4gIAkvKiogQGV4dGVuc2lvbnM6
IFBvaW50ZXIgdG8gdGhlIGZpcnN0IGV4dGVuc2lvbiBzdHJ1Y3QsIGlmIGFueSAqLw0KPiAgCV9f
dTY0IGV4dGVuc2lvbnM7DQo+ICANCj4gLSNkZWZpbmUgRFJNX1hFX0RFVklDRV9RVUVSWV9FTkdJ
TkVTCTANCj4gLSNkZWZpbmUgRFJNX1hFX0RFVklDRV9RVUVSWV9NRU1fVVNBR0UJMQ0KPiAtI2Rl
ZmluZSBEUk1fWEVfREVWSUNFX1FVRVJZX0NPTkZJRwkyDQo+IC0jZGVmaW5lIERSTV9YRV9ERVZJ
Q0VfUVVFUllfR1RTCQkzDQo+IC0jZGVmaW5lIERSTV9YRV9ERVZJQ0VfUVVFUllfSFdDT05GSUcJ
NA0KPiAtI2RlZmluZSBEUk1fWEVfREVWSUNFX1FVRVJZX0dUX1RPUE9MT0dZCTUNCj4gKyNkZWZp
bmUgRFJNX1hFX0RFVklDRV9RVUVSWV9FTkdJTkVTCQkwDQo+ICsjZGVmaW5lIERSTV9YRV9ERVZJ
Q0VfUVVFUllfTUVNX1VTQUdFCQkxDQo+ICsjZGVmaW5lIERSTV9YRV9ERVZJQ0VfUVVFUllfQ09O
RklHCQkyDQo+ICsjZGVmaW5lIERSTV9YRV9ERVZJQ0VfUVVFUllfR1RTCQkJMw0KPiArI2RlZmlu
ZSBEUk1fWEVfREVWSUNFX1FVRVJZX0hXQ09ORklHCQk0DQo+ICsjZGVmaW5lIERSTV9YRV9ERVZJ
Q0VfUVVFUllfR1RfVE9QT0xPR1kJCTUNCj4gKyNkZWZpbmUgRFJNX1hFX0RFVklDRV9RVUVSWV9V
Q19GV19WRVJTSU9OCTYNCj4gIAkvKiogQHF1ZXJ5OiBUaGUgdHlwZSBvZiBkYXRhIHRvIHF1ZXJ5
ICovDQo+ICAJX191MzIgcXVlcnk7DQo+ICANCg0K
