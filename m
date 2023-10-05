Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40F9E7B61F
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 06:49:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A325010E1B3;
	Thu,  5 Oct 2023 06:49:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B5310E1B3
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 06:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696488544; x=1728024544;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9KSmNLQg9DPobb5XOOtZiCGFDhTXG2Sl3NPl9ZJ9nnw=;
 b=CpG9n/JkA6Y6g/2kt5PqhfFyFIGHhQfouQ6TL510zDOsCmo72y7OdQev
 urqkwZcT3NfxocGZKHoGihtFaf9xObMSagVBRvmBbdoDuEIhckUIz1+p1
 GZCJ+/FU06ntN7PVon3rMnX+wubS5gqlqBznhdFa+5mnWqb1/g8+IBngL
 MGFiOuw36Wq+jPsffDJX8VMuwGeMyMGXp79yPj8fqY1HIyjrpjcYjuovK
 jfa19jVzTGHLiVcxyxUQL3HU31TznV3amnlCs/z9AKpRlWEUPPfMw4g8a
 IacaOgmD74GvCfTEDuFdCbSjOkNNTZmbYu66SsmnRI4GfhZOJgQam9nXg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="386246875"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; d="scan'208";a="386246875"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 23:49:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="786840440"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; d="scan'208";a="786840440"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 23:49:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 23:49:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 23:49:03 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 23:49:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JCnTQx4DalripVDDNOmqMUkPQQji5WQ08rUnNLJ4D/xqZD6UbRRvYtVINNUiQraAIyZ2VIsEIW32OX9xOmnR18C1zSsfWkP8b9HVFE3j4YUzfLOtINSUMeTx+h9JoA7h1akCMUHEMb4nWWxV5jUTCwO9bI5IJBKvLrBHYE22H3yKzFO5mVMPTnNdxrSiiCDFR2aj+VacXY9a7vmlIjR3DclFwXG6eezmwWPQLJUrBN/xUl2Rt82U0RFGky5h2ByJ2nb4b6pn4aNn654r58ECSFQ/9p9hi3k9zyUbrjA3WYV+EI5j8KqFOpLD4th8/BBhN+nQu7Q1zFifNUfzI66lrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KSmNLQg9DPobb5XOOtZiCGFDhTXG2Sl3NPl9ZJ9nnw=;
 b=WcK8XCZfAMeBlAIehoP70mcq+74UY1jCyj9mfjvsi1Vi3CIEijE1OTh0/5dCZxriwqH9Ke3i3eeRgef1rFx0cC8ofZl+A4ieX2anZG0QnhjRIh0Fr8GXEAgZcUqqINq5tufMHgsr21m7nS4JdrWDu42pxIDO9mpAwehevvPX/f2XFi4DWomG55q/IJzNO1sgv7k3k+QHJY3CcsG6CYtZUGdafgQRKa8BwltevPvn0mjiBXkoxAXWJ7OhBu0LfKwoggm40VoaVWFBa74/qcnMrfKsfZ8r1JYL2bF+YfIir8+tQ2vMWF7dt0XnSXwhs/fMxMXLAnZJAMX+LWEKHFqstg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SA1PR11MB8541.namprd11.prod.outlook.com (2603:10b6:806:3a9::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.35; Thu, 5 Oct 2023 06:48:55 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf%5]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 06:48:55 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Thread-Topic: [PATCH v4 0/4] Frontbuffer tracking and dirtyfb
Thread-Index: AQHZ9Rqg/ySGvUtdhEG35x4UA8cNIrA505KAgADyOoA=
Date: Thu, 5 Oct 2023 06:48:55 +0000
Message-ID: <6f499662598efe65fdb774ac9a6c96a59bbff84b.camel@intel.com>
References: <20231002102359.3740026-1-jouni.hogander@intel.com>
 <9d2a6f00-14ad-41db-98bb-caaba43f70f5@linux.intel.com>
In-Reply-To: <9d2a6f00-14ad-41db-98bb-caaba43f70f5@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SA1PR11MB8541:EE_
x-ms-office365-filtering-correlation-id: 904787ae-a532-474e-b4d6-08dbc56f24ca
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fLWjPI5OLdnCJflKY/8+xz/5elvuOiZ7vvLjIu+0RS9Af4iA+BKeJ9z/HFG9jsNdkF+Qak1ThYlrNzPBi00WZJAwAPC0ptvJtfdePF6CkhfleTFI7HZRNYIzPiWLAszYGTdfi86nwk3GasK7qrZy29Qvwc5ulbNgkSJGQH4u33gh9K6G8EOyFZjR8UHxQhKCuM3ZfSh3Sx+HOMpkvgvAYt1x/cbiZZdL6tkqsIbFgGqEqpU3HScM3+RL2Ei6iYBEtowsagZ1C2FE2yK5rMsf1Ff9nFRc8h1TbmOwVu/kxwuSG0BYFYb7wDuHio+81SAyaoPz3EIgbIpuF5/IlvOSImMhj9SBBDh6I/1es8sTP5HaZHMXDhnl5t9Ch9Qe1kCHCLO80igcFODcsYGwt67qi4JqJgvDCEELjZFzVCkOFbF0g9b3EgK/KM9hxqguXHrzn5hx2OuF7O91RVjw13q9XXNcAtKs+6xbXAcyDK0gnxR7BmOEyYY6Yxgka37UJ4g+1z+YLZe9m+y3QSi/TC8pq1TdkymcCcMHOjrl4gsK1YZ5zAXUMRaGysJxh3wkNj8Dryn1qUqb32jCNfmfuWSk4mxBB5kB4DFtX4jdtZYhx+roUcCq2ye8TTO7Db8gXd1f
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(136003)(376002)(346002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(91956017)(110136005)(66946007)(66556008)(76116006)(38070700005)(316002)(38100700002)(66476007)(66446008)(26005)(2616005)(54906003)(64756008)(83380400001)(41300700001)(71200400001)(6512007)(6486002)(6506007)(5660300002)(4326008)(8676002)(8936002)(478600001)(2906002)(86362001)(122000001)(36756003)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SElzazJvbEcwK2M5T29BVUxmN0V3R29wY2NnVFNRcXRoQnZsUDg2bkVleUl6?=
 =?utf-8?B?VUpnTjdQbEV5WjAyTE1WNkl5dzVUTTBDekZVc3V3cHNjYTlzRTBtYkhJcTN4?=
 =?utf-8?B?ZHVMNy9Dc2lFdkN1dlZRQlhTUHZId21MOWkrUVlIaDlHRkVTL29WRStDUkgr?=
 =?utf-8?B?djRTRjRkYkt2R1VHd1QwVlFXTHhpT2ljQkVpTkNHbVZkV1JLbXloMEgrV0dL?=
 =?utf-8?B?RFZXaGR6YU9hTzF5TUJqWXpXeXRYa0owZkFnRHFrcGJtWUpDaFkyaXh2Rjlt?=
 =?utf-8?B?NnZUMDdObTc2Y0JDcWlxM1RkNXlqakhnMUpqOTI5V3hDbVMxcGphK0RidUVK?=
 =?utf-8?B?TzF3SjdGWldpQWt1WHB5ZWI3Q0trYkV1aTZ2MFdrOHJGVG84N0c2dmRUdEEx?=
 =?utf-8?B?WjFScEhnYWJ3aHZ3aWxTRGdXa3dqZHdjWHlNU3hGQlBFZ1RtWUQxVzZNQWRa?=
 =?utf-8?B?MllkU2U5WUwxUVM3Z2MyYUcrTWMxZXpoeTgvSGQvajl4ZWpRYzJxam93eER4?=
 =?utf-8?B?amtqZUxjMVNGZDFEeVh4TzEwdmd2STEwM0hPUGszOXFSalNqdyt6bkVrNUJD?=
 =?utf-8?B?eGtONXMxVExXRVRrWktvV1FGQUl0YXNNemsxY0NJS1lHK21ERkRYc0xHU1Ba?=
 =?utf-8?B?YUxoMUhhRWh5SFVmcjJpTDVTaXJoUnY3U05kOXBQdkphbEpBcGREZVN1WWVN?=
 =?utf-8?B?YXRHc2hKQWgweFNiVFZNSkVXRVRld2lpUnkyR0tBRlNPWnlBeUZXVEg0cU1D?=
 =?utf-8?B?c1ZjQ3Jnd2tScGJ2cHk3N0d1K2FwNHBjcHBueFRlSjNBelhYTzFWcEtUam4v?=
 =?utf-8?B?L2dKMnRQblFWOVBHWW9BOGdxU1VSRnRjZE4weFNVdE9qaVhZdW5XQldCcWcx?=
 =?utf-8?B?T1BWUXI3eDdOLzZXbFdaTHVPY1gzbGs1NUtJNnBDcEd3UkNRUFV0a3UvZ1ht?=
 =?utf-8?B?d25uQkU4czZnZW4vN3ZOVUV3Mi81Y3krclFxNmVqNWJIc1RZeDY2T1JvN25I?=
 =?utf-8?B?RmE1K254ZTc5eXRzQVd5eFpGdW5pUGhBQlAxOGcxejBhZS9sRjRKU1pObThr?=
 =?utf-8?B?WFQxdzJqOFFGOWJ5T1VYT2lvVmhWVW5SOTFaKzhPN25icnQ1dzdndXQ3N2hl?=
 =?utf-8?B?VU03NVkrUkc2OU5DWXJSR09KaHhKK2VNWW0rSDJ3UGU2ekRvS3NIZjVmU1Vx?=
 =?utf-8?B?aURDM1ZRaE5NN1hZL3ljQ3dVcTlOR2xzbHdXU01XTEgyQ0FNbVBHdndCcjEv?=
 =?utf-8?B?OVBUcWV4WVFyZWRiK3E4Q01QVzM2RVh6MmZwekZIZGtzQUM4V3BXcXZwaGE5?=
 =?utf-8?B?a1FCV2kycVh0UmFTeGRrc2M5eG93MDhQRjNiSHJsUElwM3RHYXZRWG1palg3?=
 =?utf-8?B?bEIyaFdFWUlMT25RQzVlRjYyRWlaZTBmL1hJSGs2T2Q4UDFTYXZmWS8yS2JC?=
 =?utf-8?B?cXg2YjJlMkc4a1lOQmcxbHpsa0dPeWIwdlpYOHFyaFFSMm5GRXpkYUJaK21n?=
 =?utf-8?B?SHd3OGRoYlNFZTBvTjlxYUpwR1locTJLRzc4Ylhic0k2N2gzWEZEY1duU2xi?=
 =?utf-8?B?aEFhdmxyTjM2RHQwMkxKWGtvQmcxdElzdGdNb2RHZ0JVZTA1L2dyeC9jQmdO?=
 =?utf-8?B?cTlnb2hicjZRWExYTmRQaTNWVXJ4QnQ5ZGxZMnpqYnVqaXFoMEh6YTNxeCtI?=
 =?utf-8?B?eXhHR2RJT3pNUGVhdkpUcHhIMHpOZjZqVXhPZE5kc0V5YTJmU256Qi9uTGZN?=
 =?utf-8?B?NUw0QjFwNzRWRlltd3VXZ3VvcVJTQURyVWV3di9HL2IzK0EvVWxYZ2t1QWgv?=
 =?utf-8?B?Q2ptOGV2ZVJTQndvaGd0NkViTlpCZU9PeENCRTVzamUwbUxzdEFrZXFuU2sz?=
 =?utf-8?B?Q05GOWcyanBjOTA4VHFYemFBQWNkTnkvbVhCUCtpZ0Z1U3ppSmVjdnJMMm9D?=
 =?utf-8?B?M0FCeGNrUXgrL29oVFhYcUlncjZrUmxrNmY0ZU1HSXFCRHpjdy9xOTZQTXRj?=
 =?utf-8?B?YWhrREFVeEFhREQ0dDc4d1BQVE1HZndVbCtVVTUvbjlUWEhoUGphV1dFK0I2?=
 =?utf-8?B?Q0l4dWFZUWNGVm1yWnlkdUlrc1g4ZDhWY2plYVU0QXREK0hQeWhvSkt4YW1C?=
 =?utf-8?B?MndzYVExOG5kQWRsdDgwN010aUQyd0F2aTg5Q0FYL0VvbmVkSTNvL3FvNWlO?=
 =?utf-8?B?SVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6411B7FA24E5304AAA85455BFEC2D7B7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 904787ae-a532-474e-b4d6-08dbc56f24ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 06:48:55.1746 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iwuDLw493J1e2lNGaAb2urEcShn7UryKw7+ehD2e0fcTEceD4Ng4RqTzJAJkJ7pIYWcKGDjnAB3/WAhuExJSMHpSb5/7Q/6JQcocfGt14Vo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8541
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 0/4] Frontbuffer tracking and dirtyfb
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTEwLTA0IGF0IDE4OjIxICswMjAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gUmV2aWV3ZWQtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBs
aW51eC5pbnRlbC5jb20+DQoNClRoYW5rIHlvdSBNYWFydGVuIGZvciBjaGVja2luZyBteSBwYXRj
aGVzLiBUaGVzZSBhcmUgbm93IG1lcmdlZC4NCg0KQlIsDQoNCkpvdW5pIEjDtmdhbmRlcg0KDQo+
IA0KPiBEZW4gMjAyMy0xMC0wMiBrbC4gMTI6MjMsIHNrcmV2IEpvdW5pIEjDtmdhbmRlcjoNCj4g
PiBHZW5lcmljIGRpcnR5ZmIgaW1wbGVtZW50YXRpb24gd2hpY2ggWGUgaXMgY3VycmVudGx5IHVz
aW5nIGlzIGRvaW5nDQo+ID4gYXRvbWljIGNvbW1pdCB3aGljaCBpcyBpbmVmZmljaWVudC4gV2Ug
aGF2ZSBub3cgZG1hIGZlbmNlIGhhbmRsaW5nDQo+ID4gaW4NCj4gPiBvdXIgZGlydHlmYiBpbXBs
ZW1lbnRhdGlvbi4gVGhpcyB3b3JrcyB3aXRoIFhlIGFuZCBDUFUvR1BVDQo+ID4gZnJvbnRidWZm
ZXINCj4gPiByZW5kZXJpbmcgYXMgbG9uZyBhcyBzeW5jIG9iamVjdHMgYXJlIGltcG9ydGVkIGJ5
IHVzZXJzcGFjZQ0KPiA+IChkbWFfYnVmX2ltcG9ydF9zeW5jX2ZpbGUpLg0KPiA+IA0KPiA+IHY0
OiBhZGQgbWlzc2luZyBwYXRjaA0KPiA+IHYzOiBzcXVhc2ggZml4dXAgcGF0Y2gNCj4gPiB2Mjog
cmViYXNlZA0KPiA+IA0KPiA+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9y
c3RAbGludXguaW50ZWwuY29tPg0KPiA+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50
ZWwuY29tPg0KPiA+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50
ZWwuY29tPg0KPiA+IENjOiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPg0KPiA+
IA0KPiA+IEpvdW5pIEjDtmdhbmRlciAoNCk6DQo+ID4gwqDCoCBkcm0veGU6IEFkZCBlbXB0eSBk
ZWYgZm9yIGk5MTVfZ2VtX29iamVjdF9mbHVzaF9pZl9kaXNwbGF5DQo+ID4gwqDCoCBSZXZlcnQg
IkZJWE1FOiBkcm0vaTkxNTogTW9yZSBkaXNwbGF5IHVnbHkgd2EgbmVlZGVkIGFmdGVyDQo+ID4g
cmViYXNlIg0KPiA+IMKgwqAgZHJtL2k5MTUvZGlzcGxheTogVXNlIGludGVsX2JvX3RvX2RybV9i
byBpbnN0ZWFkIG9mIG9iai0+YmFzZQ0KPiA+IMKgwqAgZml4dXAhIEZJWE1FOiBkcm0vaTkxNS9k
aXNwbGF5OiBSZW1haW5pbmcgY2hhbmdlcyB0byBtYWtlIHhlDQo+ID4gY29tcGlsZQ0KPiA+IA0K
PiA+IMKgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmIuY8KgwqDCoMKgwqDC
oMKgwqDCoCB8IDEwICsrLS0tLS0tLS0NCj4gPiDCoCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2Zyb250YnVmZmVyLmMgfMKgIDIgLS0NCj4gPiDCoCBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfYm8uaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oCAyICsrDQo+ID4gwqAgMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEwIGRlbGV0
aW9ucygtKQ0KPiA+IA0KDQo=
