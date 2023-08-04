Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA2CC04A6A
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 20:42:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0044510E125;
	Fri,  4 Aug 2023 20:42:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CE510E125
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 20:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691181745; x=1722717745;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9BIQYX1B3RA8iQV5Jx4MpO3b9U1lfEzcCMenBBwYgPg=;
 b=VYakMYnFn7oh3a6++w9sLtplwbUrdlYlDf9SXe1YIOUtucqHJuuUpdx7
 qsEA/NExGlVqCCl4HD7Fr0+FdKA9g4f5R9jFUGv1T4at/QtZyhNxzyWjw
 qhqdkhA/QCK1oouwF7MTErdSKLmgniIKnAh3HUrR4kBaPetnDEHCusUsn
 du1JP88h/0TYpIPN4/GvXSeKnZtOeS9ZFXeeuikwnosStzejzbd6zjAoO
 oCjtByMmu/neY72OFSdOvppnSDLb5pwghx6TPxMxkukU0bT07bb4lDNJg
 M1NjlpwcWDMLyk5rG2XiLOI3aSKFFMUQleRZ7EFMBAPOPiKnpXsZexKa1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="369138939"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="369138939"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 13:42:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="723788394"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="723788394"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 04 Aug 2023 13:42:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 13:42:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 13:42:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 4 Aug 2023 13:42:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 4 Aug 2023 13:42:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+LpGu+XtTAUCKViL5wUBujZqqBEGPoyMKtsfYOB/iaRyIGNjeYgUFBIMR0e0Wgk5/+4rGS+PNh4eepOJIX3u1OmnHnwIzzSqEucRYpQE25uOsv9bPvQ3M/TH4K52r5KDDNBveiaHWQzhSZAouYF6nSnY51aifSSLG6uGIokKIpKGjeDzHngQZKgTNlbhKOEZHKrsqyO8WAkadrzQXtNg0yJXsl0vjB0D6x/+/F+5GuBo5f+woju92BfxKfn5daMHrq6HcUzlgPJDskfHrzp6UY5n2f1r/du08l4vtol/fzi1ytZBLqZ0TSK81pTJwrtEFPyWqUyD9yT1vElfiqZug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BIQYX1B3RA8iQV5Jx4MpO3b9U1lfEzcCMenBBwYgPg=;
 b=Ync+k8qH6b2uXu6gLcEsCVUq2PA5JdsaDlwAPWfnU+RRsUpXVS0FK9M/4Gzr9vVeinCm3dGk4vv6X36oUxGVUZ5RaUY85AgpnwUS5eBiA3ZxPPMcf+EF4kkXG/72CjV4sWllXNrYw+EGNnDaqEbzB8oeee2Iow7Bg1Y6MkJ9yPveSBcPto7qFs86n/4lcdPmow1wUPBwfdD8dmADE191sMkEAC2frpRvcVVJruC9F49OiDd2B7oNBwAXvTA2uTy1/4zS0qrooWR72tOSeSfRpiVN1zmFvMwyAFJeu1326YvUPJd2s+2bWY7glI4DuqiJflnQ/jw/Gbu39KDmKVlQUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH0PR11MB5159.namprd11.prod.outlook.com (2603:10b6:510:3c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 20:42:21 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8e21:274a:64d1:5de]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8e21:274a:64d1:5de%4]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 20:42:21 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Zeng, 
 Oak" <oak.zeng@intel.com>
Thread-Topic: [PATCH] drm/xe: Implement HW workaround 14016763929
Thread-Index: AQHZxxMpX0Tl6U/KlEuKsqboxNdPZ6/amiyA
Date: Fri, 4 Aug 2023 20:42:21 +0000
Message-ID: <7ffb08673a9165c0b89de6dc172bfd6704d72a54.camel@intel.com>
References: <20230804204422.2656586-1-oak.zeng@intel.com>
In-Reply-To: <20230804204422.2656586-1-oak.zeng@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH0PR11MB5159:EE_
x-ms-office365-filtering-correlation-id: f49827e0-d0dc-4b41-05ce-08db952b4d19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PCPVnG0NT9yJPd7UYjBTLJvMeiOXE1I5V6/jHFsfaZyIdrDMztq6SslG8Qinu9PHYlpanQCjoZPlRV+OWjRtOKF9xFrA0uo+SZnfyZs0qkXcAyVAM//XMCKDSa5N4zILJFaSRf4HnuvjDoOOHEAXgDx7ebgIfLoCum++x8pXSuC6IYit2esbkFOVsvEkoGzSGM30f+t9rIMZfgkGkHL80+HZjGEZ4h324oBBdDHj4Hupfpg7DzRu8Dxyne+IAp+cqHC5i7ejajm2v7jfL0H1385JA8nl7O+diqHJ7WHV3hmpypzzgB/Zd7vnLDRPjgLucKq0BaInysv4kk39AFyitEaAkEPZ754pc1SrooUrsIEiFT799DPVZXBR+GoU2nrdkKd96Yg9EGq8/BD1xFZFSOXsmoFUhV3Q7gXiSeO5mf0dzNyk55laWyaZQklwE+gBZEYp3vTv/ydRmSCpTsGkkfiGYupANHWo0sQpvg5aY135EA46GNjS4Ms1HwX99AMRgrWZicoKF9yPau4SvTTewEmCemLSZGoPC31mZdYdkkDJ40/wxmKyAZFZHzkNqXKCS84V/5x/ogKQ85nKd3oiMwvPfENodLzcPa8G36V+RtxOdbpX7XmpxmpxC96w6cAp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(346002)(366004)(376002)(396003)(186006)(1800799003)(451199021)(83380400001)(122000001)(54906003)(110136005)(86362001)(478600001)(8936002)(8676002)(2616005)(2906002)(36756003)(41300700001)(5660300002)(91956017)(316002)(4326008)(26005)(66446008)(6506007)(6636002)(6512007)(6486002)(76116006)(64756008)(66946007)(66476007)(66556008)(71200400001)(38070700005)(38100700002)(107886003)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eFBVVVFFWUFBMUNQdU9sTjY3NEFCT1A0ZkcvMkZJYW55TGI3NktkZVBOa3pU?=
 =?utf-8?B?UnFuQVVaZFNTM0dTRVBqTnM2NHl6M2Yrd2JCaG1Na3JHbzUwb2NOLzZpQWZ6?=
 =?utf-8?B?enNSSGVIbTV5YkJxTXVCWFpwZGMzMGhRc1lNYUVtWFdZek4vTWljRzBjYlYz?=
 =?utf-8?B?T0JhbGp1NmRJZEw4UHZUNnlDWXBzWmk3bVhTVzV4T0xmZGg5NmNTZC9JazV0?=
 =?utf-8?B?czlOeStGQTlBR29YYXh2MkFoSi9YbEZzdXl6UEZ6Q3lXb3RyT1U2aTQ3WTZS?=
 =?utf-8?B?RGF5UDRUNEp1dmk5MW5xd0Y5eHdNeXFMcVhuNUVJWXlmM2RFS0hJZ096VXI3?=
 =?utf-8?B?dnRMU0lsQ3N0cUxjZFhXYzltVFVFb1hiOUNXOVpiSFloUE5HNFJxK2JoVzQ2?=
 =?utf-8?B?VnQySHE0ZmQ3NkdhancwVGVib1RlcS9aUnJkWkpQS1pIbUdmMkNXUVB4ckJr?=
 =?utf-8?B?cjY2VDZ2eldWWkc2cnlmM3JvSkxGb0NWS0RuaWl6ZmxvVUF5VHEvdmtjSWl4?=
 =?utf-8?B?dlBjZzJFMkNCR1M4SWRxbm9vSEMwS3dsTHJpQ0FNbVJ5Zm0ybmc1bDVKUUMv?=
 =?utf-8?B?a2RNN0dTbFdyeFJKNEtJamM2MkdQY0xOS2xHZFQ0b0hZVWp2YUUzUDBwSmpu?=
 =?utf-8?B?Z1M5dGQ5NWhwUm1hMHEwTTNUNTdXRnlHSm5tZWIzY0ZDYWdvNHFCYmZrM1Ft?=
 =?utf-8?B?MHA4aDVDU1RoUjdSY3lYRmN5WDlwTjNxb2ZOMndFUU9rdVFjeGI2WGR6WTI5?=
 =?utf-8?B?anN3aklnZnE2MjFCSEk2RGNVcit2UFFkV25RaTA0ZGcvdDBDMG80Y1VxR2ZI?=
 =?utf-8?B?K3lSbWhlVld0T3crSHNBazJjTC9WbCtCeFo4VnIvMlJvNTZLemQ0Wi9FQnRq?=
 =?utf-8?B?VTFuNnRiaTNvbTl3ZGpzQTRwRGl4TEt0MjA1OGFycFhzcTlPQUo5eGJwcXJS?=
 =?utf-8?B?UXFYSjRORngyMzRIYlJwUjNNTjlLRExQbkNONkRmT0tJOUNGc1JwckhsMUN1?=
 =?utf-8?B?bEFtM3BMUE04eDFtWFViNENQQW9RVExYRy92N3FDZm03b3Frc1RYL1JMOGlR?=
 =?utf-8?B?VzkvNG41R0xZZEFiakNOajlEbmJueDVnNzFwdWJGczB0Y1UvZFROblppL3Zk?=
 =?utf-8?B?Q0E0bXNsMDUyVmdVdWdpTlVaSWFmNFFpM0htcnBWT0hMU2pEaVJqeXcwdFov?=
 =?utf-8?B?RzhkcS9NcXEyOHNRWUtaN3lhamRVcXhLTnlPaDd4ai9zajdnbU5rTVRPVWFu?=
 =?utf-8?B?M2hEVTFCUkpSakw2VG9GTGorTXNucTh5WnF5THR6WXJ6OTkzWUx0UlJQR2Q5?=
 =?utf-8?B?WWRDcld0a1Q2Sko2TGc4RWllMzg3VHpjZmNLNlpGS2FCSDg0eUx2Qnh6ek0w?=
 =?utf-8?B?bXdCQWFNT0FqVzNCcmJXdXR0SzJacUxlbTlUV0pvSkthbjZwM2ZUVXBzWjlx?=
 =?utf-8?B?eldKNmNkWTJCSmlEcUNheW9odjlaRTJ4S0RrQVhmdWtCcUJEdEdjbXpiWWRS?=
 =?utf-8?B?S2ZvaThicGh6N1JQV09DNWE1NUN5a2xuby9waXpCSW03K3FFYUFqRlREUVFv?=
 =?utf-8?B?MnVCUkRZUXdlVnFsMXBveFMzOWNObGNVbUdYS2tRNzBZRFByMk1pejcxRlI1?=
 =?utf-8?B?SnRrcVQ4VW56RlR4ZVVjTUwvdFUxMWwwR2hTYnBSUmk0azBYSitRemp1NEE1?=
 =?utf-8?B?SFR3N1RXTHJnNmI3andjZzdZQ2hQVGY2VUxPOXFHMlRCTTFiWDM2VUIzdW1I?=
 =?utf-8?B?QThJSjVKZm9Rb2pWRzM4alIyK0QrS3g1RnM4NVBkdVpvejlySlcxaFdBSkRx?=
 =?utf-8?B?emY2YnhYbTJMdlI0U3lwa0NZbkoyTFpmeE9NSDlEaGt4Q1RTV0xteVVNMXNy?=
 =?utf-8?B?RG1QOHVCMGZlaDB2dUUySHdkdDJneUpWenJiamdXeDFVOXNVMmtuY21nOUc0?=
 =?utf-8?B?Z1JpQnNmakJrM2tnZG5uaVZPS0oyMkZUR1JISlNiajFMeGZ1Y1IycEdma3dy?=
 =?utf-8?B?cnN5WWhOZk52VnlSQVhZelltY3hmOTdpK3JIZWhYK0tBaExVVkhib01qZ2p0?=
 =?utf-8?B?YUk2MmhpMzJvM05YOUhTY3FnYTh1SzN3SmZMeGdwTldmVWw2NDdGK1BQeHZP?=
 =?utf-8?B?MGZSNGdjSFgwRTJjT0pKdTFIVEZMMWhQbXAvYitXbEFsbVZmemgzcHl6QUpn?=
 =?utf-8?B?Q3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7113F71374C61C4C9CD5A5FE091EC0F0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f49827e0-d0dc-4b41-05ce-08db952b4d19
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2023 20:42:21.2142 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KDoFCPvur70FAGnaLhDOdxT3oxafo6CdrHKlgMcBGdEDk+EGUTptH/Q0o7Xl6BgvP4K5dSJpAWhr5rv5JGlw+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5159
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Implement HW workaround 14016763929
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTA4LTA0IGF0IDE2OjQ0IC0wNDAwLCBPYWsgWmVuZyB3cm90ZToNCj4gVG8g
d29ya2Fyb3VuZCBhIEhXIGJ1ZyBvbiBERzIsIGRyaXZlciBpcyByZXF1aXJlZCB0byBtYXAgdGhl
IHdob2xlDQo+IHBwZ3R0IHZpcnR1YWwgYWRkcmVzcyBzcGFjZSBiZWZvcmUgR1BVIHdvcmtsb2Fk
IHN1Ym1pc3Npb24uIFRodXMNCj4gc2V0IHRoZSBYRV9WTV9GTEFHX1NDUkFUQ0hfUEFHRSBmbGFn
IGR1cmluZyB2bSBjcmVhdGUgc28gdGhlIHdob2xlDQo+IGFkZHJlc3Mgc3BhY2UgaXMgbWFwcGVk
IHRvIHBvaW50IHRvIHNjcmF0Y2ggcGFnZS4NCj4gDQo+IHYxOg0KPiAgIC0gTW92ZSB0aGUgd29y
a2Fyb3VuZCBpbXBsZW1lbnRhdGlvbiBmcm9tIHhlX3ZtX2NyZWF0ZSB0bw0KPiAgICAgeGVfdm1f
Y3JlYXRlX2lvY3RsIC0gQnJpYW4NCj4gICAtIFJlb3JkZXIgZXJyb3IgY2hlY2tpbmcgaW4geGVf
dm1fY3JlYXRlX2lvY3RsIC0gSm9zZQ0KPiAgIC0gSW1wbGVtZW50IFdBIG9ubHkgZm9yIERHMi1H
MTAgYW5kIERHMi1HMTINCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxvYWsuemVuZ0Bp
bnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlICAgICAgICB8
ICAyICstDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyAgICAgICAgIHwgMTMgKysrKysr
KysrLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhX29vYi5ydWxlcyB8ICAyICsrDQo+
ICAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL01ha2VmaWxlDQo+IGluZGV4IDFiNTk3MDJjZDlmOS4uYzkxYmI3ZGRjZjFkIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL01ha2VmaWxlDQo+IEBAIC0zNyw3ICszNyw3IEBAIHF1aWV0X2NtZF93YV9vb2Ig
PSBHRU4gICAgICQobm90ZGlyICQoZ2VuZXJhdGVkX29vYikpDQo+ICAkKGdlbmVyYXRlZF9vb2Ip
ICY6ICQob2JqKS94ZV9nZW5fd2Ffb29iICQoc3JjdHJlZSkvJChzcmMpL3hlX3dhX29vYi5ydWxl
cw0KPiAgCSQoY2FsbCBjbWQsd2Ffb29iKQ0KPiAgDQo+IC0kKG9iaikveGVfZ3VjLm8gJChvYmop
L3hlX3dhLm8gJChvYmopL3hlX3Jpbmdfb3BzLm86ICQoZ2VuZXJhdGVkX29vYikNCj4gKyQob2Jq
KS94ZV9ndWMubyAkKG9iaikveGVfd2EubyAkKG9iaikveGVfcmluZ19vcHMubyAkKG9iaikveGVf
dm0ubzogJChnZW5lcmF0ZWRfb29iKQ0KPiAgDQo+ICAjIFBsZWFzZSBrZWVwIHRoZXNlIGJ1aWxk
IGxpc3RzIHNvcnRlZCENCj4gIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiBpbmRleCBjYjI4ZGJjMmJkYmIu
LjM5NGJkMjNkYzE4ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gQEAgLTI5LDYgKzI5LDggQEAN
Cj4gICNpbmNsdWRlICJ4ZV9yZXNfY3Vyc29yLmgiDQo+ICAjaW5jbHVkZSAieGVfc3luYy5oIg0K
PiAgI2luY2x1ZGUgInhlX3RyYWNlLmgiDQo+ICsjaW5jbHVkZSAiZ2VuZXJhdGVkL3hlX3dhX29v
Yi5oIg0KPiArI2luY2x1ZGUgInhlX3dhLmgiDQo+ICANCj4gICNkZWZpbmUgVEVTVF9WTV9BU1lO
Q19PUFNfRVJST1INCj4gIA0KPiBAQCAtMTk4Miw2ICsxOTg0LDEzIEBAIGludCB4ZV92bV9jcmVh
dGVfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwNCj4gIAlpbnQgZXJy
Ow0KPiAgCXUzMiBmbGFncyA9IDA7DQo+ICANCj4gKwlpZiAoWEVfV0EoeGVfcm9vdF9tbWlvX2d0
KHhlKSwgMTQwMTY3NjM5MjkpKQ0KPiArCQlhcmdzLT5mbGFncyB8PSBEUk1fWEVfVk1fQ1JFQVRF
X1NDUkFUQ0hfUEFHRTsNCg0KTEdUTSwgYWxzbyBub3cgdXNlci1zcGFjZSBjYW4gY2hlY2sgaWYg
dGhpcyB3YXMgc2V0IHdoZW4gZ2V0dGluZyB0aGUgdm1faWQgYmFjay4NCg0KUmV2aWV3ZWQtYnk6
IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KDQo+ICsNCj4g
KwlpZiAoWEVfSU9DVExfREJHKHhlLCBhcmdzLT5mbGFncyAmIERSTV9YRV9WTV9DUkVBVEVfRkFV
TFRfTU9ERSAmJg0KPiArCQkJICF4ZS0+aW5mby5zdXBwb3J0c191c20pKQ0KPiArCQlyZXR1cm4g
LUVJTlZBTDsNCj4gKw0KPiAgCWlmIChYRV9JT0NUTF9EQkcoeGUsIGFyZ3MtPnJlc2VydmVkWzBd
IHx8IGFyZ3MtPnJlc2VydmVkWzFdKSkNCj4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+ICANCj4gQEAg
LTIwMDQsMTAgKzIwMTMsNiBAQCBpbnQgeGVfdm1fY3JlYXRlX2lvY3RsKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+ICAJCQkgeGVfZGV2aWNlX2luX2ZhdWx0X21vZGUoeGUp
KSkNCj4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+ICANCj4gLQlpZiAoWEVfSU9DVExfREJHKHhlLCBh
cmdzLT5mbGFncyAmIERSTV9YRV9WTV9DUkVBVEVfRkFVTFRfTU9ERSAmJg0KPiAtCQkJICF4ZS0+
aW5mby5zdXBwb3J0c191c20pKQ0KPiAtCQlyZXR1cm4gLUVJTlZBTDsNCj4gLQ0KPiAgCWlmIChh
cmdzLT5mbGFncyAmIERSTV9YRV9WTV9DUkVBVEVfU0NSQVRDSF9QQUdFKQ0KPiAgCQlmbGFncyB8
PSBYRV9WTV9GTEFHX1NDUkFUQ0hfUEFHRTsNCj4gIAlpZiAoYXJncy0+ZmxhZ3MgJiBEUk1fWEVf
Vk1fQ1JFQVRFX0NPTVBVVEVfTU9ERSkNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV93YV9vb2IucnVsZXMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2Ffb29iLnJ1bGVzDQo+
IGluZGV4IDE1YzIzODEzMzk4YS4uZWE5MGRjYzkzM2I1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfd2Ffb29iLnJ1bGVzDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV93YV9vb2IucnVsZXMNCj4gQEAgLTE1LDMgKzE1LDUgQEANCj4gIDE4MDIwNzQ0MTI1CVBMQVRG
T1JNKFBWQykNCj4gIDE1MDkzNzI4MDQJUExBVEZPUk0oUFZDKSwgR1JBUEhJQ1NfU1RFUChBMCwg
QzApDQo+ICAxNDA5NjAwOTA3CUdSQVBISUNTX1ZFUlNJT05fUkFOR0UoMTIwMCwgMTI1MCkNCj4g
KzE0MDE2NzYzOTI5CVNVQlBMQVRGT1JNKERHMiwgRzEwKQ0KPiArCQlTVUJQTEFURk9STShERzIs
IEcxMikNCg0K
