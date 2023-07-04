Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D62CEB64DA
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 13:28:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE0110E13E;
	Tue,  4 Jul 2023 13:28:20 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA51E10E13E
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 13:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688477298; x=1720013298;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+sDKLZptoDUmVMmIQnhUofQrq/tTrltO9E6dzH5lpCE=;
 b=TmduKpcLSLHKe9X9fiPPaoJ9062rvuAQNToHzKSpD2wcO4MAsrKikx/8
 hOAzqGSNjPFr55lBWWdoR80UtP7S1CfmldhJfwYxOH2EEJIRv90+DcoFo
 jFWNxsRZoGdBSstfav0LtoWDadq6UIEAvAbhVlS2hSaqdwiXjizISj0dK
 ONd8rfensVy9KqR+xeAWJCMoAwKTrhTnaG5o7Zt0/0HGPIJTVCsKvG6nr
 QwyBFtVADLBKLaef1jWw7xvCrX0GO528TSAt6CUx7023FjBHTybgFDG79
 eC78Mdtx7CH6h0lWxQ+Bex0ncatFsxOqLyPi5YO6vD2JBIGIs951cRcil Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="342710519"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="342710519"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 06:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="748428381"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="748428381"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 04 Jul 2023 06:28:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 06:28:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 4 Jul 2023 06:28:15 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 4 Jul 2023 06:28:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZeh+P4f7fkXqaCJasWeefYkpZIJChc04Y7lKikxF8p7R/EMfKqVVyTYDXZisVsA3w8EtyZQWh/sF0CS0DHQPI38sTcJPTJbdd2y5hMQOyzmUHivt1SXSEosjYeN7uUgTdrQwCoK7nwVYkssHBbau9hOSaf6xXyNwRGHitadf/3SbW5Gcr5g6Ei6we7wqIArXO3hB0xMzcyivO9oIMNFQTcwOpxwhHHhH36e6Jsqwcnvsi6yF8Mu3qjhp3CnmH+Zm/TU+Me5yVVL5GH4fEvFfz+qZecaF7zdistdqTEW7XGkgyITc/vmK+3x8vTcW+X4t1rZntlrH8IXp0g3tqFGJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sDKLZptoDUmVMmIQnhUofQrq/tTrltO9E6dzH5lpCE=;
 b=c5YfP97aBE55J1Tuiny0zYIeVm0sIio6wd85l9ipFd1+oTqLIV+wxiXWseeveskWVqX30GciVB+PIw/UfQAPgfycvv9XhXOWR41nrED9iGPbCmU8iLVddp66jSLiCpQcPc6H/g4gUeRLUF6dBbb/1XEw/uWCmTDi1XUcJIgqpvFib/vidzB5ZPMj9FK+e3Jdg1t8CfZ0dObw65q4NNEe47RVYd13L6uXJ5U8aoXuyLnSBUa037cr62MHujfJcChLafMARUPwa+SS+/rlxfSnrlcAmuWkBS10AL3XV+1Tx4DGd6zfkrZDfi2b/lJ9tvDLqYoBsiGONvaQipw5inM0FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by BN9PR11MB5323.namprd11.prod.outlook.com (2603:10b6:408:118::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 13:28:13 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 13:28:12 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "ogabbay@kernel.org" <ogabbay@kernel.org>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Make explicit that exec uAPI expects
 canonical addresses
Thread-Index: AQHZreDH/UoOFOjo70SJTlUs3GPcT6+pRcGAgABVPQA=
Date: Tue, 4 Jul 2023 13:28:12 +0000
Message-ID: <1e091216133021896f1a56cce493356fa296df32.camel@intel.com>
References: <20230703190105.148419-1-jose.souza@intel.com>
 <CAFCwf13GCjaCRU3n6gJUe+AiegYo8K4YxJWuMhhQD=iQ+=bxJA@mail.gmail.com>
In-Reply-To: <CAFCwf13GCjaCRU3n6gJUe+AiegYo8K4YxJWuMhhQD=iQ+=bxJA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|BN9PR11MB5323:EE_
x-ms-office365-filtering-correlation-id: 58af39ea-e7aa-4b90-83a9-08db7c9283f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kKA8xf553Q8ZbfYs8PAUbwJXkp7luiQxryci/kgS1VQzJ2ovVNYmu9ApuRBo1wx6lu8Lx8eG2qXQ0ck3wN7yO5WdfOdk0DmOm1B7CQhHTfJ9B/jxNrsZ9TI+qspC5NS7t/81tPPW/D+IWaQskOUw8oEXU20O/dpAe8vAlQiCn+CsDj+mVxhYPDG2JNH96YcfMC7GSh+jELw0sb+bjEyJiRF0MmzNn/AjDPuOFxjWBy4hyC5Ra/7MsFKJ42WjfdSv4l2YCMQ1GGwxeAjQgmm80sGJtQL2JsaDPccBr3VqkJSm3GNJ0eXyMrJybB4kCXZS/CEEae2/FPup8siBBHYCF58wU2hNcbg7ucbpAhiZyaQR5wmxW44AUfFoZQjjUpCho0ClN4pxJSLyGtKK85gyif5XaC2us3yTySguGHmNzd1qabkAu7BnI57pRggHx3fplSqXnJ+O7vXjnBJEQkj5ffH7Vop4Jzn8BVt/ntC0YgmFDkQENi8ODX4nMp60ZMAGRxo3pr/i+8UbUYGJw++/xuY9b89xdD6ZV1XlL85EkkgiG47tyqdr1/qLkajWeFmlw/1UxXq0mQIyIOE1StcfPFVgL5Wt4LK3rCoz1eq/fEwcLrn/ycjr3clP5jIxq2ca
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(136003)(366004)(346002)(396003)(451199021)(6512007)(82960400001)(6506007)(53546011)(91956017)(76116006)(66476007)(64756008)(316002)(38070700005)(38100700002)(122000001)(4326008)(66446008)(66946007)(66556008)(6916009)(2616005)(83380400001)(66574015)(186003)(26005)(478600001)(2906002)(8936002)(8676002)(36756003)(5660300002)(71200400001)(86362001)(6486002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aG1KYWczc3UrMHFjaTd1TDdFNy9GK094WW51TllldzJ2cjJsNkdaNEw3R1RT?=
 =?utf-8?B?ZTMwem9GWFB1emVOa0ZRZDBaRnpvcFkremI4b1FscTh5MDVtS2h3UUF3ekRC?=
 =?utf-8?B?WllJKzVrNk8vTU1MMWU1aUprUm1aMk16aUxYUDlkRGFXVUxiaHcwRDBrQ3Bn?=
 =?utf-8?B?QWw5RENmRWRHTzdvTittWWZUUEF3b0dyTmYyajhDS0xabHRRWGUvUVdocVV1?=
 =?utf-8?B?M01oWlFFV2NHMnRKVmt1TVNoRERDTlloZGEyK3dMSjZhNHlBV1FJUVg4R1Vp?=
 =?utf-8?B?VWdMWlNpR1p5ZXNkazBzcXNITlVnVmxKQUVEZDZnV2tTZ2FuaTRkVlFkUTZ1?=
 =?utf-8?B?cEt2aWZHZnJyV2VrdE9yemtIMUhTS3Rib2lvSWVvTHg0bXNPTW8yM3RVd2Nr?=
 =?utf-8?B?c1M5T1FQancwNXBwd2pWUTlja2JuNCt0MVA5dXJyNncyNVg1bUdmQndvQXo2?=
 =?utf-8?B?T2dhYWY4Qi8zY2pKMldlYm1PWVpESEpyTkYwU0g4ZW5TQW1OellZNXZEVUlN?=
 =?utf-8?B?U2x1ZVg2bk1FVTh3VlgvNGZOMml3WjBNOGpKZUFFa2JHOWRqUUpCTENtWlhw?=
 =?utf-8?B?TzZDRTY0K2gwWTRuZ2RaeHF3ekVNNFQvNFE1TVg5S0hHS0RmREJ4V1hrdmkr?=
 =?utf-8?B?cEtjSVlkZ1NrVzBkL2xrNVRYLzM4V1lTUDYrSlBaU2FyQ1RBaGZiRjNEK25V?=
 =?utf-8?B?NndXaUZHaEROQ2RoMTJ5NWwwU0o2ZEYxT3ZwbkNtcXN3Skp5OGRyWlVXWXRw?=
 =?utf-8?B?L1YvM0hRbGNCcStTMFk4SE5MZHNWc0VyU1NNdGp2U3pXbGYyUis2cGNXWjE0?=
 =?utf-8?B?TmFzdFRRN2ljendCMnd5dWRMOGVjQzNqNW5LUVhYN1I2Mi9LZklEK0tGa3pO?=
 =?utf-8?B?S3NtZm8zcUdRV1R3VlZRWDhvVkVPaitaak5YcnBLRFRxR1loQzF6MWVRRWRC?=
 =?utf-8?B?VzVSdXN4dmsyZW9yT1V5a3phSGJjc0xYT2FCZ2xyM0pDNlA5UW10U291bGZo?=
 =?utf-8?B?YVRQQ3NrOVdMNW1PZWcvZFZERjlxN3N5MHRmNTRIdWNiMWdMY3dYMkFtSFkx?=
 =?utf-8?B?dXdBS3Zwc2puQ1VDbGhKa2lkdXJGUlVCSmhVd2J6cDRoRzBZMzlVaFdhWEdW?=
 =?utf-8?B?TjFNeDd3QXlmdGI5bzlrZzE0L3pubnZSbGx3Mmc5VFRrdkNrYk1TSEt2dXF3?=
 =?utf-8?B?M25TOHk4ajU0T1ExeHhpSGVjVEtaay94cnVJSzFFSFhQM1ZVUU1EK0RkWjkx?=
 =?utf-8?B?SC9uQzJ4RStEU0RRbDRSRzJXMVovWTdsTU1ZWFFXOHFnbUJOQ2ZEejR1VkVh?=
 =?utf-8?B?UGwzQ2ZlTEp4TUNVR0J1bHR0QUJsREd4Z0pKZ1A0M043aldwL3NNMktBUytx?=
 =?utf-8?B?eVR5Z0pqeVgvdUdFd2dkQUtsS1JNNU5VTVlWWUtpVTRWRkZwTW5WaWtjU0pG?=
 =?utf-8?B?UUhvUkJXT0J3ZHpLNlQ1YzBTc2RsV1pXbDVSRFlzckV0ZkdTUEkrZ3RwU2pF?=
 =?utf-8?B?Zk5OTlQ0WlVHbDNrU24yNkZIRGVERzJsOHg2TFNIV20vL3BES3RJbTM1SXQr?=
 =?utf-8?B?aUsvLzk5R1NlMzRUMUlGUFQzZzVsdmtVSDdHZE05b2lyWmIwTDU3TXZpN3ZG?=
 =?utf-8?B?YllQUGdTRGd1SGdWSHg3UElRWmRGTi85cWo5RkRscjFya2NKcEtoV0psSEta?=
 =?utf-8?B?NzVac1JvcUw5MmNCYTQ2MjI2V3d1OTlPVHZuQXpnVVRkQW5KaUJ5V1UxVmh4?=
 =?utf-8?B?WnZBUWFkQzR0T0JLY25yYkdFS3B1UWhXT3ZiaHZJOS9qWUtpTlFmVStFVGRx?=
 =?utf-8?B?cUNGazByR3RUVmhqc2ZGUjVTVTc1UWZlemQwMTB2Z1gyYWk3R1plVkY1OGZh?=
 =?utf-8?B?YjJlWW5aa2poK05KanhOcG9NaGZzNlRRY1QwejJycnBzajBSK2FrcHd1cGhq?=
 =?utf-8?B?L3lZb3QrY2lVS21iZ2duNWZhSFRNZGJHSlFKelI3UG0ycmViSlVDL0RnS2o2?=
 =?utf-8?B?SGdkaVZBVUhYeEppV0lvNlc3cGVUZldsRDNkb3RvdjVPODdQN0JWR25jZXFx?=
 =?utf-8?B?SmVHaFlNRXVnOGxKT1ZoWVA1TkZ4dDU4VmczalBLZDU3Y3l1VlI2aENycmVS?=
 =?utf-8?B?UEluRGVnYmRzV1FWTDlmalVIV0p4UEorU2pnTEZNRWx6VmRuNGhhaERlL3hS?=
 =?utf-8?B?aGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <542853277DF492489C2768549C1A7F17@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58af39ea-e7aa-4b90-83a9-08db7c9283f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2023 13:28:12.3496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /49xECdQna0l5Oe4TvtmJJrcSySaBoeZy07CGjcb/SQ/z+zV9OVHazUj265Fd689LVwdxzWFQI6P4MJHUeif9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5323
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Make explicit that exec uAPI expects
 canonical addresses
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA3LTA0IGF0IDExOjIzICswMzAwLCBPZGVkIEdhYmJheSB3cm90ZToNCj4g
T24gTW9uLCBKdWwgMywgMjAyMyBhdCAxMDowMeKAr1BNIEpvc8OpIFJvYmVydG8gZGUgU291emEN
Cj4gPGpvc2Uuc291emFAaW50ZWwuY29tPiB3cm90ZToNCj4gPiANCj4gPiBUaGUgYmF0Y2ggYnVm
ZmVyIGFkZHJlc3MgaW4gZXhlYyB1QVBJIGlzIHVzZWQgd2hlbiBlbWl0dGluZw0KPiA+IE1JX0JB
VENIX0JVRkZFUl9TVEFSVCB0aGF0IGV4cGVjdCBjYW5vbmljYWwgYWRkcmVzc2VzIGluIGZ1dHVy
ZQ0KPiA+IHBsYXRmb3JtcywgZm9yIGN1cnJlbnQgb25lcyB0aGUgYml0cyBhYm92ZSA1NyBmb3Ig
UFZDIGFuZCA0NyBmb3INCj4gPiBvdGhlciBwbGF0Zm9ybXMgYXJlIGlnbm9yZWQuDQo+ID4gDQo+
ID4gU28gdGhlIHNhZmVzdCBhcHByb2FjaCBpcyB0byByZXF1aXJlIGNhbm9uaWNhbCBhZGRyZXNz
IGZvciBhbGwNCj4gPiBwbGF0Zm9ybXMgc3VwcG9ydGVkIGJ5IFhlIHRvIGF2b2lkIHVBUEkgYnJl
YWtzLg0KPiBXaGF0IGRvIHlvdSBtZWFuIGJ5IHVBUEkgYnJlYWsgPw0KDQpJZiBYZSBzdGFydCB0
byBleHBlY3QgY2Fub25pY2FsIGFkZHJlc3NlcyBidXQgYSBwdWJsaWMgcmVsZWFzZWQgVU1EIHNl
dHMgcmVndWxhciBhZGRyZXNzZXMsIHRoYXQgd2lsbCBicmVhayB0aGUgdUFQSS4NCldlIGFyZSBh
bGxvd2VkIHRvIGNoYW5nZSB0aGUgYmVoYXZpb3Igc3RhcnRpbmcgZnJvbSBwbGF0Zm9ybSBYIHRo
YXQgYXJlIHN0aWxsIHVuZGVyICJmb3JjZSBwcm9iZSIgYnV0IGJldHRlciBoYXZlIGl0IGZvciBh
bGwgcGxhdGZvcm1zIGZyb20gc3RhcnQuDQoNCj4gSWYgdGhlIHVzZXIgZ2l2ZXMgYSB3cm9uZyBh
ZGRyZXNzLCB3b24ndCB0aGUgZGV2aWNlIHNpbXBseSBpc3N1ZSBhDQo+IHBhZ2UgZmF1bHQgYW5k
L29yIGEgZGlmZmVyZW50IGVycm9yIGV2ZW50IHRoYXQgd2lsbCBjYXVzZSB0aGUgam9iIHRvDQo+
IHRlcm1pbmF0ZSA/DQoNCkJ1dCBpZiB3ZSBkb24ndCBjaGVjayB0aGUgaXNzdWUgY291bGQgZ28g
c2lsZW50IGFzIGN1cnJlbnQgcGxhdGZvcm1zIGlnbm9yZSB0aGUgYml0cyBhYm92ZSA0Ny81Ny4N
Cg0KPiBBcmUgeW91IGV4cGxpY2l0bHkgY2hlY2tpbmcgYWxsIGFkZHJlc3NlcyB0aGF0IGFyZSBn
aXZlbiBieSB0aGUgdXNlciA/DQoNClRoZSBzdGFydGluZyBiYXRjaCBidWZmZXIgYWRkcmVzcywg
eWVzLg0KDQo+IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgdGhpcyBjaGVjayB3YXJyYW50cyBhIGRl
ZGljYXRlZCBjaGVjayBpbiB0aGUgZHJpdmVyLg0KPiBpbW8sIHlvdSBzaG91bGQgbmV2ZXIgdmFs
aWRhdGUgdXNlciBpbnB1dCBpZiBpdCB3aWxsIGp1c3QgY2F1c2UgdGhlDQo+IGdwdSB0byBpc3N1
ZSBhIHBhZ2UgZmF1bHQgYW5kL29yIGFuIGVycm9yIGludGVycnVwdA0KPiANCj4gT2RlZA0KPiAN
Cj4gPiANCj4gPiBCU3BlYzogNjAyMjMgNTk0NzUgNDU3MTgNCj4gPiBDYzogTWF0dGhldyBCcm9z
dCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+ID4gQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0
aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb3PD
qSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jIHwgNiArKysrKysNCj4gPiAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2RldmljZS5oIHwgMiArKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVf
ZXhlYy5jICAgfCA4ICsrKysrKysrDQo+ID4gIGluY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggICAg
ICB8IDQgKystLQ0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
ZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+IGluZGV4IDA3YWUy
MDhhZjgwOWQuLjg4N2FlZDgwYTIwZTkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2RldmljZS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5j
DQo+ID4gQEAgLTQzNywzICs0MzcsOSBAQCB2b2lkIHhlX2RldmljZV9tZW1fYWNjZXNzX3B1dChz
dHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPiANCj4gPiAgICAgICAgIFhFX1dBUk5fT04ocmVmIDwg
MCk7DQo+ID4gIH0NCj4gPiArDQo+ID4gK3U2NCB4ZV9kZXZpY2VfY2Fub25pY2FsX2FkZHIoc3Ry
dWN0IHhlX2RldmljZSAqeGUsIHU2NCBhZGRyZXNzKQ0KPiA+ICt7DQo+ID4gKyAgICAgICBjb25z
dCBpbnQgaGlnaF9hZGRyZXNzX2JpdCA9IHhlLT5pbmZvLmRtYV9tYXNrX3NpemUgPiA0NyA/IDU3
IDogNDc7DQo+ID4gKyAgICAgICByZXR1cm4gc2lnbl9leHRlbmQ2NChhZGRyZXNzLCBoaWdoX2Fk
ZHJlc3NfYml0KTsNCj4gPiArfQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZGV2aWNlLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmgNCj4gPiBpbmRleCA3
NzlmNzFkMDY2ZTZlLi40ZGY0ZjUyZjk0NmVhIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9kZXZpY2UuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZp
Y2UuaA0KPiA+IEBAIC0xNDAsNiArMTQwLDggQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgeGVfZm9y
Y2Vfd2FrZSAqIGd0X3RvX2Z3KHN0cnVjdCB4ZV9ndCAqZ3QpDQo+ID4gIHZvaWQgeGVfZGV2aWNl
X21lbV9hY2Nlc3NfZ2V0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKTsNCj4gPiAgdm9pZCB4ZV9kZXZp
Y2VfbWVtX2FjY2Vzc19wdXQoc3RydWN0IHhlX2RldmljZSAqeGUpOw0KPiA+IA0KPiA+ICt1NjQg
eGVfZGV2aWNlX2Nhbm9uaWNhbF9hZGRyKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1NjQgYWRkcmVz
cyk7DQo+ID4gKw0KPiA+ICBzdGF0aWMgaW5saW5lIGJvb2wgeGVfZGV2aWNlX21lbV9hY2Nlc3Nf
b25nb2luZyhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPiAgew0KPiA+ICAgICAgICAgcmV0dXJu
IGF0b21pY19yZWFkKCZ4ZS0+bWVtX2FjY2Vzcy5yZWYpOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZXhlYy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWMuYw0K
PiA+IGluZGV4IGM1MmVkZmY5YTM1ODQuLmJhNmU4MjExMmU0YmUgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9leGVjLmMNCj4gPiBAQCAtMjMxLDYgKzIzMSwxNCBAQCBpbnQgeGVfZXhlY19pb2N0bChz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUp
DQo+ID4gICAgICAgICAgICAgICAgIH0NCj4gPiAgICAgICAgIH0NCj4gPiANCj4gPiArICAgICAg
IGZvciAoaSA9IDA7IGkgPCBlbmdpbmUtPndpZHRoOyBpKyspIHsNCj4gPiArICAgICAgICAgICAg
ICAgY29uc3QgdTY0IGNhbm9uaWNhbF9hZGRyID0geGVfZGV2aWNlX2Nhbm9uaWNhbF9hZGRyKHhl
LCBhZGRyZXNzZXNbaV0pOw0KPiA+ICsgICAgICAgICAgICAgICBpZiAoWEVfSU9DVExfRVJSKHhl
LCBhZGRyZXNzZXNbaV0gIT0gY2Fub25pY2FsX2FkZHIpKSB7DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgZXJyID0gLUVJTlZBTDsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBnb3Rv
IGVycl9zeW5jczsNCj4gPiArICAgICAgICAgICAgICAgfQ0KPiA+ICsgICAgICAgfQ0KPiA+ICsN
Cj4gPiAgICAgICAgIC8qDQo+ID4gICAgICAgICAgKiBXZSBjYW4ndCBpbnN0YWxsIGEgam9iIGlu
dG8gdGhlIFZNIGRtYS1yZXN2IHNoYXJlZCBzbG90IGJlZm9yZSBhbg0KPiA+ICAgICAgICAgICog
YXN5bmMgVk0gYmluZCBwYXNzZWQgaW4gYXMgYSBmZW5jZSB3aXRob3V0IHRoZSByaXNrIG9mIGRl
YWRsb2NraW5nIGFzDQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgg
Yi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gaW5kZXggZTg5MGIxMzFhZjkxOC4uNzJk
YzIxNjFmZDIzMiAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+
ID4gKysrIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+IEBAIC04MTEsOCArODExLDgg
QEAgc3RydWN0IGRybV94ZV9leGVjIHsNCj4gPiAgICAgICAgIF9fdTY0IHN5bmNzOw0KPiA+IA0K
PiA+ICAgICAgICAgLyoqDQo+ID4gLSAgICAgICAgKiBAYWRkcmVzczogYWRkcmVzcyBvZiBiYXRj
aCBidWZmZXIgaWYgbnVtX2JhdGNoX2J1ZmZlciA9PSAxIG9yIGFuDQo+ID4gLSAgICAgICAgKiBh
cnJheSBvZiBiYXRjaCBidWZmZXIgYWRkcmVzc2VzDQo+ID4gKyAgICAgICAgKiBAYWRkcmVzczog
Y2Fub25pY2FsIGFkZHJlc3Mgb2YgYmF0Y2ggYnVmZmVyIGlmIG51bV9iYXRjaF9idWZmZXIgPT0g
MQ0KPiA+ICsgICAgICAgICogb3IgYW4gYXJyYXkgb2YgYmF0Y2ggYnVmZmVyIGNhbm9uaWNhbCBh
ZGRyZXNzZXMNCj4gPiAgICAgICAgICAqLw0KPiA+ICAgICAgICAgX191NjQgYWRkcmVzczsNCj4g
PiANCj4gPiAtLQ0KPiA+IDIuNDEuMA0KPiA+IA0KDQo=
