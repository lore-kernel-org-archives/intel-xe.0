Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC263E81E1B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 17:25:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADD310E558;
	Fri,  6 Oct 2023 17:25:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B652B10E554
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 17:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696613112; x=1728149112;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=0YWvva6upIQY2K8vXndgJdhD/RQxSfjSh1a/O9Hyq/A=;
 b=fQmdTogvK54O+BYRRBEQyY46yDiIWtwGTzx4tM6W1FOm5Zy8anKXzjmP
 PROmlPEgKOkC/9b1aPzFURKGRMLAXsyRUG00+Cv+bdm3Yz5SVpXn8zLut
 s9AYO8bT5NIz2Y/Bf34EybQgX/+vNE3a26MC49Ut6VuQNfrcaaZ9PK2Oq
 aRZw/Ru1Z7EsPfIDwmIT70qnJBmpuL5U+3l49ryazvcUpp9iJ7QI10fuG
 hGwkMEJFWzka/qdWtMUzBUTqhfi9DIb8A8uj+oGVV7Y9qzJLF8yJWpyt6
 CFQ7noU+ijZw9HVmhpbkQxsrcXNjmDT7As5e0mmtxJoFzyxOvXJRC70C5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="382656767"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="382656767"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 10:25:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="787461741"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="787461741"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Oct 2023 10:25:11 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 10:25:11 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 10:25:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 10:25:11 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 10:25:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OI3lXskrRWc2yMwfuVR1CE9MgRu7MUI8Kwxi3tNuojZBnoFD1ZaXA216eAYzK0Lpjt7trRSuQwWyJPqGsBnv7RJA6yN8ESeAYJ1kzgIk78MXFkGwK6llAkpyNCfWeSlkh8+JO65MACQmfNCRP9Xa+kgP4EAayNAMn16lRxfUNASnVlSvxAOhMz85iqY2ZDeCqouvR9ZmKxCLxV1Mo5q0ZWG8vG2GQBocG/SCx3MsXdOWILssWPE/mpeLEuREMoAPeW8Q4keupIg2b3DUiAzhX6s6Q6XuzDAZdl94Hhwbp3kLohHGCUmhq5kYRMG8sVbBB0m4Lp9/pgb7DomNprj2bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YWvva6upIQY2K8vXndgJdhD/RQxSfjSh1a/O9Hyq/A=;
 b=g9aAa1ttH7/GmENZQlM44u2LqKyll4tT1isiWdTdlJADYg29aqzfokx35kdaseGXNsn3/gVHxt2Vt+mx5N1zl2qPSgHUPVPXaY0A9MNvwPtQv3XFtcgNqPfNV8346KYMg+roEZKMGfHdbdf5tjbx3AZYKsgl3/0bsF6Dq6HCfz7gRZbaOmtKcUP4FcyhUmGTmwgPZ47V/Yx8FVsDQPinlJJDvDRQ5HMXfrbkQ6RPKemGEdjBlS6x1hr+CQADAjSVehSfmaffOHd6AqHZNlfmtmlEBiEosLeyGT05N7LZmmAeZIuIez38uLNC+gdkZBbBuoe3HoN7NEvMPfmoko0O3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SA2PR11MB4987.namprd11.prod.outlook.com (2603:10b6:806:113::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Fri, 6 Oct
 2023 17:25:09 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb%4]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 17:25:09 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v3 3/3] drm/xe/display: Don't try to use vram
 if not available
Thread-Index: AQHZ97qY8F7Ep2GAOEKgUSDdC4kGtrA7iL5wgAE9ywCAAD2QQA==
Date: Fri, 6 Oct 2023 17:25:09 +0000
Message-ID: <IA1PR11MB64184F6E293D5A485F07B1C5C1C9A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20231005183404.324835-1-juhapekka.heikkila@gmail.com>
 <20231005183404.324835-4-juhapekka.heikkila@gmail.com>
 <IA1PR11MB6418356D73CC092531E3D8BAC1CAA@IA1PR11MB6418.namprd11.prod.outlook.com>
 <f9b72a0b-1698-fef1-02bf-f15412756889@gmail.com>
In-Reply-To: <f9b72a0b-1698-fef1-02bf-f15412756889@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SA2PR11MB4987:EE_
x-ms-office365-filtering-correlation-id: 5e7482a1-cf18-40ed-26f0-08dbc69130b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XR28J/FITZatRv/hJZYwNh3s7/1ROnBbmL0irtq/2SV7esrFS0RhnD9VgjNasiGG4NW0oh/FD1R6LrsosDeuPIjD/9utkLRXneNA92450I8eSVTLc7C9vEhdrAD6smG6dxgn86AGjyX7tR9rqwmvtYrF6TMaMn1b59EU5Wsd3KeTXwr5KbzNx63O9bbACGgvB+ud7loAlGwZdoZHKLyb/g1Ijdrotx+mM82n7zJ+E4brOCselU2reo8px6GjTUOsQgbe8woE60x3pX4/AOL4T1Xr0c8hSnAl+aDLAxw9zklo7esvo4xsfxb7azNDhAUoZ+URtJ7+2I92pyeBsGXsfRt4RrLtjGewEq7c7Pyvuzw9xk6J7TSsY9BeYsX+ENYf/3i8tlHwntUTjqafLm4gAB71W6kEs0SpzQjM0GechdM4jYoI8vOO2EujnaLAXFlfJR5WolLD/xBPqOrfQLRMAInc8JOXnfajx6Ck92FEJyGyi9krFJKi+ATTEUInVFXp3RsgdhzjRTDQA//idcoUts2SQJ/r5hlDR6vzJ1W1eZELBDlibNsTIjWG/lRTPlba4w30Pqq3F4WDWuMagmJ1wyHYzNHs6wkBgna4huNnhKa0sxrtVXudlSXKATcBnnL2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(366004)(396003)(346002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(55016003)(76116006)(82960400001)(2906002)(38100700002)(66946007)(316002)(122000001)(64756008)(38070700005)(66556008)(66476007)(478600001)(110136005)(66446008)(5660300002)(83380400001)(52536014)(9686003)(71200400001)(8936002)(53546011)(6506007)(41300700001)(7696005)(8676002)(26005)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejBkeXFYU3djNFNvVnpPUnVPSjFmejlzMFhoMVFUVXg2c3NyNC9KZTVIeGg1?=
 =?utf-8?B?K1ZyVmJXSUh2Rm9SRzh0WldudytQRlppVTVJcWNqZk5lazErNEl6SU43VHJL?=
 =?utf-8?B?cDZlQVVVYk5xblRSR2RUcWpRUTdaeEh2T3FId3d1K2lVVHcxbWxhMldSeSs5?=
 =?utf-8?B?Qis4UEI1WkVka3dLNVEyV3BUbEpPSG13UTJOczNRVHlhSnAvNEhXK0UyenVB?=
 =?utf-8?B?N3pRSjcxKzVPTzBOSHl3c3R0dnc5RkdWcEdjYnNsNW05WEp5RG5xVVU3NDNM?=
 =?utf-8?B?blM3OFpEb0s1L3FqMFUrdkhNTVNkaVUyb2dFcGdhV2pEL1BueXk3R0ozc1I2?=
 =?utf-8?B?aGhpTDZpdEgwUkZ4dVVTelJ5cXZ5TVRialZmeGFjNys0RTZuZDRlZ3ZiWkdn?=
 =?utf-8?B?S3lmeDd1bGlzalhrbk5JZzNpTHQwNERjdGhmVU4zYjZ5My9lMDBQYWxva3RJ?=
 =?utf-8?B?UkR2ZHZsNGMwMVV0cC9EUk45akMvMjg3NCtiZmg1aU43eXIvd1o4RGlNNkN1?=
 =?utf-8?B?WEpUeUkrcmIyeTJqSTUxWExGNjdEbjh6bysybGNLVFduR0dtT3RXM2RYZ1Bp?=
 =?utf-8?B?akljWnZzM1BjSGkvamYvVGZkSlY3UnNlRjVXZWlJRVdNdmhvN1BnbEh6eEFN?=
 =?utf-8?B?cENtL2JITk5GNmVnaFZhV0VhRzAzSU0raUI1NzhSVmdiczdmNVhmTXlZMThX?=
 =?utf-8?B?RmJFUzVGbEtUYTJSdXNIMW0zNHl1UEhpTDNSQnYvY1BHL3F2R2dqdm9UMkNi?=
 =?utf-8?B?LzJhdkphYlVIeVNVdnZTVEhXOTNOckdGT3oxRGxKanR2ZnJzelhNR2RZMzB2?=
 =?utf-8?B?aUJsWnd4RFFOVHNWM3I0V3hhTlh0bCtVdTAwZGQrdzJ0b3ZXZjNYb2VWODlX?=
 =?utf-8?B?UHB0RDNSMTJiL2h6cFE0TjgyT3NLcEExa1R0ZFEvTTZCUnZ0NnVmaGprVkk2?=
 =?utf-8?B?NnNURUljRmtmckpiSEU2MkZHT1lnYjNibVF4RE9aUUZiNlhHR3FVNXlFdHE1?=
 =?utf-8?B?Q1g0RkFRNzg3alZKdWlpQm1tRTQrU0NPN1lKbjdCYnNaMWdRQUFSS3d5K1VH?=
 =?utf-8?B?K3BXWjkybDNHWlFYdE5DM1JRanpaNU1UcUo0Nm9zeG9yU1VEdWNZK08xM05T?=
 =?utf-8?B?VEhaTSt5T2QwckVsQ2xoNFRIZkVzMldTaUhpUEkyMkRtWlZDSzMvSTd1anpS?=
 =?utf-8?B?U050VDZSWnI4MHcxOXp6Q1ZhZGxySUhsRjJKT0gwSkkyLzZnMHNYOXBJbXpI?=
 =?utf-8?B?aUN1OElTaE1UQkQ3NG4zQllyTUhDUHNKY2tnWldwWXdVanpWdGwzbFVPUitl?=
 =?utf-8?B?d0d1N01zbTF3NExWa3FaQWFrMHBCT2NOVmw2Z0lJU0U0aTNvdHF2TGpJT1Vh?=
 =?utf-8?B?SndBc2UxZjJrZXU4ZlpCaXorNnN3bVFvSEUxa0tSTlArL2VqV3RWRFEzSDhO?=
 =?utf-8?B?YnkrZUxvQ3N0ZE95dU54OTFsbVl1cFlsRmhBQlNRalF3Z3RZU3BHaDAwQ0FK?=
 =?utf-8?B?UjFBVHU1eEcxR0hSdXBLNDVuN3BWcG1iN1hMUksrbnJUY1gwdlVNUG9pdzFW?=
 =?utf-8?B?bEVjbzl1TXdwZ2FSd2FOMUhsTmJqT1Z3em4yc0dxMlJoMUMwU2xDQXcwK0Qw?=
 =?utf-8?B?MG1wamFFSytOc3B4T1dVOWtCWnFzRGRHVG52NC8xaHV6eUFWNDFWcnhUNnZa?=
 =?utf-8?B?T0N6OG85MFZrVVN5NDNDbGtnZkVtbHR1dVlKYkxIRFJQWUVReUtTOTVhblhm?=
 =?utf-8?B?S0V2Z3NQZENGNGFCVFYralBST25pWEswenpGZ2xtOURKOXV1SlJScExyVHMx?=
 =?utf-8?B?M1h5ZGpqY0FJM1hrdEpLNWRjbzBDa0ZNR0s3enBvVlAzL0ZWQTAveHdFZHU1?=
 =?utf-8?B?cVdOMHBwOVRHbE02S25Bb2tKMmVtVnYvU09Nb1ozN0NYbXRkY293U0RpQUtC?=
 =?utf-8?B?TGg0ZEt2ZjM2enRHcnhyYzhsUGhyeGFmckNaTm91NnhhTERyWkFXWjd1aXBI?=
 =?utf-8?B?LzFPcy9idTE1cU5JWFFMYjF0b1dMYTdRMXREUnNuZFNkVjIrYVJ5U2liRTFt?=
 =?utf-8?B?Q3JtcVJFZEN1Z3V1Q3NuTzgyMGNRMTFMN3lEYm5pRGVKQTJSV2tCUjBXMmZ3?=
 =?utf-8?Q?/M7Uv9NzP7UM1s9tU9CYm+Vlt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7482a1-cf18-40ed-26f0-08dbc69130b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 17:25:09.2729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mhg9yq1tTnD5SuWv3TpOw4d9C0/lEJ1P7ZeUsJsapBvy+YKS936DnfFSHnujC/Cz928rbtkQCWNoEPbqu2klybDnSvsMAP5qj5mQZrzyu28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4987
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 3/3] drm/xe/display: Don't try to use vram
 if not available
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

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogSnVoYS1QZWtrYSBIZWlra2lsYSA8
anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4NCj5TZW50OiBGcmlkYXksIE9jdG9iZXIgNiwg
MjAyMyA5OjQzIEFNDQo+VG86IFJ1aGwsIE1pY2hhZWwgSiA8bWljaGFlbC5qLnJ1aGxAaW50ZWwu
Y29tPjsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+U3ViamVjdDogUmU6IFtJbnRl
bC14ZV0gW1BBVENIIHYzIDMvM10gZHJtL3hlL2Rpc3BsYXk6IERvbid0IHRyeSB0byB1c2UgdnJh
bSBpZg0KPm5vdCBhdmFpbGFibGUNCj4NCj5PbiA1LjEwLjIwMjMgMjEuNTYsIFJ1aGwsIE1pY2hh
ZWwgSiB3cm90ZToNCj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4+IEZyb206IElu
dGVsLXhlIDxpbnRlbC14ZS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxm
IE9mIEp1aGEtDQo+Pj4gUGVra2EgSGVpa2tpbGENCj4+PiBTZW50OiBUaHVyc2RheSwgT2N0b2Jl
ciA1LCAyMDIzIDI6MzQgUE0NCj4+PiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+Pj4gU3ViamVjdDogW0ludGVsLXhlXSBbUEFUQ0ggdjMgMy8zXSBkcm0veGUvZGlzcGxheTog
RG9uJ3QgdHJ5IHRvIHVzZSB2cmFtIGlmDQo+bm90DQo+Pj4gYXZhaWxhYmxlDQo+Pj4NCj4+PiBU
cnlpbmcgdG8gZ2V0IGJvIGZyb20gdnJhbSB3aGVuIHZyYW0gbm90IGF2YWlsYWJsZSB3aWxsIGNh
dXNlDQo+Pj4gV0FSTl9PTigpIGhlbmNlIGF2b2lkIHRvdWNoaW5nIHZyYW0gaWYgbm90IGF2YWls
YWJsZS4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEp1aGEtUGVra2EgSGVpa2tpbGEgPGp1aGFw
ZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+DQo+Pj4gLS0tDQo+Pj4gZHJpdmVycy9ncHUvZHJtL3hl
L2Rpc3BsYXkveGVfZmJfcGluLmMgfCAxMSArKysrKystLS0tLQ0KPj4+IDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZmJfcGluLmMNCj4+PiBiL2RyaXZlcnMvZ3B1
L2RybS94ZS9kaXNwbGF5L3hlX2ZiX3Bpbi5jDQo+Pj4gaW5kZXggZThlMzgwOTFjOGU2Li5hNzlj
MjQxNjU3OWYgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVf
ZmJfcGluLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9mYl9waW4u
Yw0KPj4+IEBAIC04Myw3ICs4Myw3IEBAIHN0YXRpYyBpbnQgX194ZV9waW5fZmJfdm1hX2RwdChz
dHJ1Y3QNCj5pbnRlbF9mcmFtZWJ1ZmZlcg0KPj4+ICpmYiwNCj4+PiAJc3RydWN0IHhlX2Rldmlj
ZSAqeGUgPSB0b194ZV9kZXZpY2UoZmItPmJhc2UuZGV2KTsNCj4+PiAJc3RydWN0IHhlX3RpbGUg
KnRpbGUwID0geGVfZGV2aWNlX2dldF9yb290X3RpbGUoeGUpOw0KPj4+IAlzdHJ1Y3QgeGVfZ2d0
dCAqZ2d0dCA9IHRpbGUwLT5tZW0uZ2d0dDsNCj4+PiAtCXN0cnVjdCB4ZV9ibyAqYm8gPSBpbnRl
bF9mYl9vYmooJmZiLT5iYXNlKSwgKmRwdDsNCj4+PiArCXN0cnVjdCB4ZV9ibyAqYm8gPSBpbnRl
bF9mYl9vYmooJmZiLT5iYXNlKSwgKmRwdCA9IEVSUl9QVFIoLUVJTlZBTCk7DQo+Pj4gCXUzMiBk
cHRfc2l6ZSwgc2l6ZSA9IGJvLT50dG0uYmFzZS5zaXplOw0KPj4+DQo+Pj4gCWlmICh2aWV3LT50
eXBlID09IEk5MTVfR1RUX1ZJRVdfTk9STUFMKQ0KPj4+IEBAIC05NiwxMCArOTYsMTEgQEAgc3Rh
dGljIGludCBfX3hlX3Bpbl9mYl92bWFfZHB0KHN0cnVjdA0KPj4+IGludGVsX2ZyYW1lYnVmZmVy
ICpmYiwNCj4+PiAJCWRwdF9zaXplID0gQUxJR04oaW50ZWxfcm90YXRpb25faW5mb19zaXplKCZ2
aWV3LT5yb3RhdGVkKSAqIDgsDQo+Pj4gCQkJCSBYRV9QQUdFX1NJWkUpOw0KPj4+DQo+Pj4gLQlk
cHQgPSB4ZV9ib19jcmVhdGVfcGluX21hcCh4ZSwgdGlsZTAsIE5VTEwsIGRwdF9zaXplLA0KPj4+
IC0JCQkJICB0dG1fYm9fdHlwZV9rZXJuZWwsDQo+Pj4gLQkJCQkgIFhFX0JPX0NSRUFURV9WUkFN
MF9CSVQgfA0KPj4+IC0JCQkJICBYRV9CT19DUkVBVEVfR0dUVF9CSVQpOw0KPj4+ICsJaWYgKHRp
bGUwLT5tZW0udnJhbS51c2FibGVfc2l6ZSkNCj4+PiArCQlkcHQgPSB4ZV9ib19jcmVhdGVfcGlu
X21hcCh4ZSwgdGlsZTAsIE5VTEwsIGRwdF9zaXplLA0KPj4+ICsJCQkJCSAgIHR0bV9ib190eXBl
X2tlcm5lbCwNCj4+PiArCQkJCQkgICBYRV9CT19DUkVBVEVfVlJBTTBfQklUIHwNCj4+PiArCQkJ
CQkgICBYRV9CT19DUkVBVEVfR0dUVF9CSVQpOw0KPj4+IAlpZiAoSVNfRVJSKGRwdCkpDQo+Pg0K
Pj4gSG1tLCBzZWVtcyBsaWtlIGp1c3QgJ2Vsc2UnIGhlcmUgd291bGQgYmUgc3VmZmljaWVudCAo
aWYgX3NpemUpIHZyYW0wIGVsc2UNCj5zeXNtZW0pID8NCj4NCj5UaGF0J3MgZ29vZCBpZGVhLCBJ
J2xsIHNlbmQgbmV3IHZlcnNpb24uDQo+DQo+Pg0KPj4gSXQgYWxzbyBzZWVtcyBsaWtlIG1heWJl
IHRoaXMgY2hlY2sgc2hvdWxkIGJlIGluIHRoZSB4ZV9ib19jcmVhdGVfcGluX21hcA0KPmZ1bmN0
aW9uPw0KPj4gSS5lLiB2YWxpZGF0ZSB0aGF0IHRoZSByZXF1ZXN0ZWQgcmVnaW9uIGJpdCBpcyB2
YWxpZCBiZWZvcmUgY3JlYXRpbmcgdGhlIGJvPw0KPj4NCj4+IFRoYXQgd291bGQgbGV0IHlvdSBr
ZWVwIHRoZSBwYXR0ZXJuIGZvciB0aGUgSVNfRVJSIHdpdGhvdXQgdGhlIGluaXQuLg0KPg0KPlRo
aXMgSSBkaWRuJ3QgcXVpdGUgdW5kZXJzdGFuZCwgSSdtIHN0aWxsIG5ldyB0byBob3cgdGhpbmdz
IHdvcmsgb24gWGUuDQoNCkkgd2FzIHN1Z2dlc3RpbmcgdGhhdCB4ZV9ib19jcmVhdGVfcGluX21h
cCgpIHNob3VsZCB2YWxpZGF0ZSB0aGF0IHRoZSBWUkFNMC8xIGJpdCB3YXMgdmFsaWQNCmZvciB0
aGUgdGlsZSBhbmQgcmV0dXJuICBhbiBlcnJvciBpZiBub3QuDQoNClNvIHlvdSB3b3VsZCBoYXZl
IG5vIGNoYW5nZSBoZXJlLCBidXQgZWggeGVfYm9fY3JlYXRlX3Bpbl9tYXAoKSB3b3VsZCBnZXQg
dXBkYXRlZC4uLg0KDQpObyB3b3JyaWVzLiDwn5iKDQoNCkkgd2lsbCB0YWtlIGEgbG9vayBhdCB5
b3VyIHJlZnJlc2guLi4NCg0KTQ0KDQo+L0p1aGEtUGVra2ENCj4NCj4+DQo+PiBKdXN0IHNvbWUg
dGhvdWdodHMuDQo+Pg0KPj4gTQ0KPj4NCj4+PiAJCWRwdCA9IHhlX2JvX2NyZWF0ZV9waW5fbWFw
KHhlLCB0aWxlMCwgTlVMTCwgZHB0X3NpemUsDQo+Pj4gCQkJCQkgICB0dG1fYm9fdHlwZV9rZXJu
ZWwsDQo+Pj4gLS0NCj4+PiAyLjI1LjENCj4+DQoNCg==
