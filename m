Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B792EB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 15:23:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A6E10E421;
	Thu,  6 Jul 2023 15:23:57 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB05D10E412
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 15:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688657035; x=1720193035;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=jk7T2nPWm5OaKoPa0eqP/UYLTndm4Ch8Ezm4XiBdgYw=;
 b=T1Hp/bEQNKBW3r/EwugqAXeum3kzPJmMF610QvrkVhOsrPJm3QF4oqDx
 7yt8LPjCVhd6+9ovDvKFeYeYSF45VMXDnPCEdMqsULLV99WjZVvjDTh7e
 UxhXoVJL/GUWNmLnrSuRAQ1qY8ikATM21ZuBtzNREQ7Dn5Fl7Fr+rmuax
 SA4kIOfITpGa/wNDh6KjFiqRlKfV8qzmXtpXBsgkLgScwmBKlXtg4XCzi
 Eaw5tp6ZDncgMiAZcEoqcNKxTaYbkUC5PyiIxnNEfhjRxie5uheC6z5OE
 Oph/GObpYtfKVftf1W71cH+uwrhYb99pN/hAbA8Bgw2VSZV1yTW6lKpxA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="363668275"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="363668275"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 08:23:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="696884963"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="696884963"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 06 Jul 2023 08:23:53 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 6 Jul 2023 08:23:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 6 Jul 2023 08:23:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 6 Jul 2023 08:23:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1KQBqZ52m3iN4IRZen/JVgtuUCPNLCZVY23phLnoA58JDLMvXRnHCrY3NBcqBU+rj2wm/uJd4Rm5+Ggxm/49J/AhTcC07/Jrl8Fr2LJG2XAljvQnFrMGiQpQd0h1JoFufbbS3ldsRH5so4/i3XriAD988QNaV77Qgn1ZOj6Wrja7azPbWBLIXUdeq2kHz39G6pXSWNFi0UlRaoSaBS8DcdpfmZ5hk3Y5GD9BYgsRWz4c3Smn/bi+2IN7a984ttknGbC5HYOmFpgXtn5ThT7rosVTDYbQn31XG7E3j8XU8qYXMc263mzHfyKDKB8E57R4EEtf9xc70ulXjrheiUeEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jk7T2nPWm5OaKoPa0eqP/UYLTndm4Ch8Ezm4XiBdgYw=;
 b=lAm6qQ94e3h0RFy81wRrpVFQImESGyKjZXS0sCVIB2z62bOnFKkI4kdXCaeTNMaSElCjKzZpQcv1XLQARPYy0l9mMFTyrsR6Z0raF0xnIWqBx4fuLRefHb+fynVRdKoyU0c1hCDUOOiIyo6b5FLFE5yXmdRdbMMFzDGOKmK0Nc7bwme5qJdUJ8d0HkGvP1Y9cvny4T1qmUqDnjiD6mVsJoXbOZ67Qw5eRVGfmcgmydYxqXEFmaTyXGR4Ecgxz2KpHr+Eo9L4q17mjXsyDJEb9IpzUh605eUbatUIVWj6UsmhbfQ+yTZ0D1tl16ZtU18hXBxouETeXIU0ZuNZKF3QlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB5918.namprd11.prod.outlook.com (2603:10b6:a03:42c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.24; Thu, 6 Jul
 2023 15:23:48 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0%7]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 15:23:48 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Thread-Topic: [Intel-xe] [PATCH v4 0/7] Try to handle TLB invalidations from
 CT fast-path
Thread-Index: AQHZr1sXtRVqx1vw0kGSSqrWFXC7Ja+s3P0A
Date: Thu, 6 Jul 2023 15:23:47 +0000
Message-ID: <e968685ecd7bfc330dde20b885f826549e6c6e51.camel@intel.com>
References: <20230705160602.237213-9-matthew.auld@intel.com>
In-Reply-To: <20230705160602.237213-9-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB5918:EE_
x-ms-office365-filtering-correlation-id: 0323e26e-d5d1-4d68-d488-08db7e34fea3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ly2FCqvrCECssPZmKHOI61yhxR3shDjdzOct8caukT4vLpH/1SYAcmMDj2BhrsqQcFKE7VnsuUiKOcZHpRlL7XAVBpYLjp3o5+GSRW4sS72vC9qYHa9W/Q0h833EWj03+VavdQaoD9BZAX47gfbNQvZj7eWEScsbonYxpktk4VRq5+kO01aCDLLqN+oPv/wnuLOVM/RvTbf7LwR+Bo5ndv7yxLicdoxFGguBN66+qGpVSofLzM6nnRZt1HsHayA/eaWnEbSFxerOt51AXm7HsbBiysWSA1S6LwH8R0AzPHPSDZ+D/2Cq68iMb7RNTgIvKoTCd032evl8jdIxX+N2De0DcmWn1wBPKTIQvucoQ3Q7CzdYxrzBRu+0yNbNXFR1QmBOglYD05e8A0FikH73wX/eg3SlxS+ft1H0XGBJj9IAtI1PvnjzJ44OGJ6uZaiKCUVlH/Zms9mnpHSPh8MTNqIk0dOiSuJJcMatmkNBZE6oyoKo7VBGX/mxR9QHIwp0lFCEIeCC8d7dKUBWL6r9wyDPdd2ip7Z0ZktJ47qCIuuHgb2gSiLugK8VSXMRWgsxd+STNFjRBRZnb+CwWgNQY3xPf57PKfXUDWyEepOJU/8MnrxNvbn26OkdWYegOzS78FvwN8lwewcY6zBSyp7Lgw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(346002)(376002)(366004)(396003)(451199021)(91956017)(5660300002)(66476007)(64756008)(66446008)(66556008)(6636002)(66946007)(76116006)(38100700002)(41300700001)(316002)(8936002)(8676002)(86362001)(36756003)(4744005)(2906002)(38070700005)(6486002)(83380400001)(71200400001)(6506007)(26005)(186003)(6512007)(966005)(2616005)(122000001)(82960400001)(110136005)(478600001)(10126625003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUZ4V2xkcVVxTTlHVFowcmxzejRLRzFKeGwvTHNDQ0dvaWZCSXlaRGVnUUZO?=
 =?utf-8?B?ZGhEbTZSV0M4UTJPcHpjTG5UNHJFc01hVHdpdFl2bGkyamgxejJwVTRZVEs1?=
 =?utf-8?B?WEpPeGUyV0xFOGlsZVNaL1dzL3IvS3dhK1k1Umk3MGh5eVM5ekplMHI0bmQ1?=
 =?utf-8?B?UVJCcUVFSzlVMGN5MDFBVi81SG1ONEdhd2p1WmhhM1FIUFV4K0dzSFlpdXg3?=
 =?utf-8?B?ZW9rTjhyR1B3dVg5dE5qa1AxVFNleGFYaTYwM1ZYQ3lwakFLdWZnalQycllt?=
 =?utf-8?B?Mk16dUtmN3JZSkV0ZnlLejFTWElUL1pDTGhITkpSZW80aTdGdm5ZdHI1TTBU?=
 =?utf-8?B?R2pPd0JYVEFJZ2lhakN5a25JRkxLS29Tc0paMThOa2FEMTVvQ2dGNEF4T0xj?=
 =?utf-8?B?RGpMZXdKVkxjK2hnSUo1VkxDRFU1Z3ptYzZjOURWWGtJSHRqRC9OWEdzTTlX?=
 =?utf-8?B?Q01uQmFybEE5cjFYQ2tHOGRGWFhERWtlK0ZBeWZPL1ZZTEpuNTduL2tZR1M3?=
 =?utf-8?B?c3VVTExWWFZCNHRTNmlSL3lEbTBqTmtQM1VKd0FweWoxMGorZ0VZa1VwS0lP?=
 =?utf-8?B?b1R1b3NRVmdmNWhwT3hjU3RDNDhya2IxSU9xdlhBQ3dqTEhNWUNDckE4U09M?=
 =?utf-8?B?L1c3eHphVURkNHMwSjJiRGZvY3AwV2hLNVNpOFBhRHloWmpXVzQ3UTg2dHR1?=
 =?utf-8?B?aGpFUHNVcEVqci9hVU1qR0hUT09lMFhONk1zWUd0RVJoSm81N2NoK3E3L25G?=
 =?utf-8?B?RGl5cit1ZXNaSzJ5RnBiSkJxRlF4MEMrRU03dnlNVHZLdzZ6Q2lOUjIzZFg2?=
 =?utf-8?B?UzlZL281Zm5lMEpucG5MTTdycitENGNaZVdFdVZEQk5iWFl5U1hqcStIaTVV?=
 =?utf-8?B?QTgxdGFJT09FQ2czWnY5eGRZK21NYUdrUXg5dFZUcVhqeVZKSFh5L2JwSll2?=
 =?utf-8?B?dGptWnk5UHVZRkoreHVnSXIxU2k4KzJwaGRDeDFKTm1qcWJNS2hsTW5ZV1o3?=
 =?utf-8?B?MmRDQUFPcVBucHdLaEt5SzlXODdML0c0NjM5QmFFdHBGd25DRHVLbVgxdkdw?=
 =?utf-8?B?OTI2Si9qdHpGTTFMc2pnU0FSQnJEbFpUZitEcmg4WUdscmVIckEvMU5sQTZZ?=
 =?utf-8?B?SURlOStFNmd1c083eUprN1RvMXppZTN6dFhMUUdXMnBtcVpMaWlONHY2SkhY?=
 =?utf-8?B?QmxVdDhQR3VVbEFxWUk5WThqWnRsTFVJZXJaeDA3RVF5SEFFam8xeVBMYXRo?=
 =?utf-8?B?YzFpVEMzUXBzVHdNQWM2TFJScFRNYkl4SjNOMEo2aVA3Smc1SmQ0R0F4WVZF?=
 =?utf-8?B?K2ovT0NrajFIS0o4aW9tZUlBQ014NWRrTjF4dTFMNytmbktnblNEZjJ3aXh1?=
 =?utf-8?B?VmZNcjFkaWd1aXIxU0RvMURUSUN5bUUwZDJmVW9VZGpoNVdJTnlVOE12NnRr?=
 =?utf-8?B?cUNiWDlvQ2pJeis5UlNyYllibDhrUXZ5MDJLQmdPbkpYcGEwTlN5ZWg1L0h3?=
 =?utf-8?B?aWxvTTVweWVIdFp0M1UvNTZ0MlBhVGQ0cnIya04xci93WEttcWhjNSthb2tM?=
 =?utf-8?B?dXViUWlQd21BaitvYzBpb05NdWtaeGlxQytVUEdCTTBSazJOZC9XNW8xSVky?=
 =?utf-8?B?UG1xK2JkdTlqNkZYU3djVTZNWjQrTVlLcERhVGNBWWI5MDUvSGdYeXlCR0tU?=
 =?utf-8?B?aHRmSTFFSVRTaW1OOEEyQjVjY1QwbnN3eTVCSzBrdVhhVEJJRlE1VDhkS2pI?=
 =?utf-8?B?dHQ4eUN2SlIvWGpkUDZaK0svQ21BV1JKcDR5N2JUUG92cWNyN29jbW1iVGxJ?=
 =?utf-8?B?SU9pVVk2N3NIc3hFU2ZWM0s2WXZ4TXZVbWVsZ08ybWIvelVuV0tmWEE2RkxM?=
 =?utf-8?B?SFRKSE8xWXpMWGdqckFRNWVQbVRDSW1rOUNKL2x6S21zTjFhUnYvdEw2cFhh?=
 =?utf-8?B?d3hDTXE0QXEzNmkzS0lpMDFYYmdoemp2R2t1czBZK3Fhd3Y0Y3NQQTFjaDFq?=
 =?utf-8?B?eHlqVTloVWpONXV4bndlTmNnckpHR1dRSXQ1UUk4YkhqeThXQmwybG5IQklG?=
 =?utf-8?B?Z2pCYy9OTjFIZjlQMnNaeXhWZ0diSFF6dTlFM1h5emNCS3JIemhDWE02d3o4?=
 =?utf-8?B?Vkp4VGE2dm94SFRUdHZTczh2c2lnMFh2d253UGVIRFAxbVBRdUNxZVVOb21x?=
 =?utf-8?B?VWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <172B7AD1A05EB2428337F151B0629CA3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0323e26e-d5d1-4d68-d488-08db7e34fea3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2023 15:23:47.8094 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G5+ukjLctGm13I+dB42omyvCmy2VTGV9BgXsW3kmjY/hdpGo7qL80ldnzRsKgoFxcwNxwPRyh8vklCoqVseJQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5918
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 0/7] Try to handle TLB invalidations from
 CT fast-path
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

T24gV2VkLCAyMDIzLTA3LTA1IGF0IDE3OjA2ICswMTAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IEluIHZhcmlvdXMgdGVzdCBjYXNlcyBhbmQgd29ya2xvYWRzIHRoYXQgcHV0IHRoZSBzeXN0ZW0g
dW5kZXIgYSBoZWF2eSBsb2FkLCB3ZQ0KPiBjYW4gc29tZXRpbWVzIHNlZSBlcnJvcnMgd2l0aCBt
aXNzZWQgVExCIGludmFsaWRhdGlvbnMuIElmIHdlIGhhbmRsZSB0aGUgVExCDQo+IGNvbXBsZXRp
b25zIGRpcmVjdGx5IGZyb20gSVJRIHdlIGNhbiBzZWUgYSBiaWcgaW1wcm92ZW1lbnQuDQo+IA0K
PiB2NDoNCj4gICAtIFZhcmlvdXMgdHdlYWtzLiBCaWcgdGhpbmcgaXMgdG8gbWFrZSBzdXJlIHdl
IGdyYWIgdGhlIGZhc3RfbG9jayBmb3IgdGhlIGcyaA0KPiAgICAgcmVzZXJ2YXRpb24gd2hlbiBk
b2luZyB0aGUgQ1Qgc2VuZCwgd2hpY2ggY2xvc2VzIG9uZSBiaWcgcmFjZSB3aXRoIHRoZSBDVA0K
PiAgICAgZmFzdC1wYXRoLg0KPiANCg0KTG9va3MgbGlrZSB0aGUgX19nMmhfcmVsZWFzZV9zcGFj
ZSgpIHdhcm5pbmcgYXJlIG5vdyBmaXhlZCBmb3IgZ29vZCBub3cuDQpCdXQgZ290IG9uZSAnVExC
IGludmFsaWRhdGlvbiBmZW5jZSB0aW1lb3V0JyB3aGlsZSBzdGFydGluZyBYb3JnIG9uY2Ugb24g
YSBUR0wsIG5vdCBhYmxlIHRvIHJlcHJvZHVjZSBhZ2Fpbi4uLiBodHRwczovL3Bhc3RlYmluLmNv
bS9VRnFRNEc3WQ0KDQoNCg0KDQo=
