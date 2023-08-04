Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBA1C001DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 20:08:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9721910E109;
	Fri,  4 Aug 2023 20:08:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29D210E109
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 20:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691179697; x=1722715697;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l6xVeuu28VwV+Dyq5qgWbtq8eR+sZz1TSplYrQQXSdM=;
 b=kAOC3rseTZ9QVcc0kiLVVhSQk8yLwoh90CB2m0k12hq5+yM7CqhKUdVr
 0I6Sw8C2q+IwfUOiJ2LxxDDT1Wo6qxJ8w0c04a1yXrNQeLUzw0qHBtjWS
 0JbmwiNF4fpM7/y3+gZTcshuLmyy5LEerHJ5dLla4cBhXgbwffHO3Tvt2
 o7qfD7iUHwc/U6a1tjzEZ7v298Ny0/XFenv10HTJ3Z7MZvcbJa9P5i1Mo
 3BOZrO20okiiluBXWJfua0de6GJZFHx6rIW6sZJUbRk7ZMWEdkOZXzJR9
 CZwrYGPQp3I/HrbJzD1L09VtHfU7C1NZPnVR8Fkb/aFpCSWGwxkwI5vOZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="350548790"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; d="scan'208";a="350548790"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 13:08:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="730181998"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; d="scan'208";a="730181998"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 04 Aug 2023 13:08:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 13:08:16 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 13:08:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 4 Aug 2023 13:08:16 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 4 Aug 2023 13:08:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLUWSTcHZ+UhWBJH3xbsV7/0rgtZPrTQubicAZflRGaJYAiwwjt02chEJKufiXNAnoXbTRW2cifagPfgeFVb85WeCWAuH5NOP9m5biOyPMJs++pfDZjIwfk9T5BIHfe60y0Rjpx66Cy1zoUO0MTs3M+Ri2KusHYbX9hZD4iMmV83ryYK/uwqMuHfk+JaucDvQLylbbWurElvywcoM+WvJJ9Etblrlr3Ap7gDl7f4tWCyVwUHYvq6FSXb0pYGI1qvqohcNOcZiwP3RzWj7OszNbJoMBaUeKcnD/sqXnyCnmMWRcjlhqrklmBKDWr/AE1yXXVJGKxZpfokDhec6Gt+Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6xVeuu28VwV+Dyq5qgWbtq8eR+sZz1TSplYrQQXSdM=;
 b=oJYi2g8dnhJSd97sHPCg8e1e10bTbY5moStLIanVHDoOpvtn2uLASIS3rMtvnh5KZd99FxTQbFHs9S3FbP0mytum56nmeBTvnGknvRi0w4SCVnjsYqF+PBf0K0remfbNX1azWJ1RWuR2md1hxbTUMJSrpwRjlX1C539RWocAyFmrcZE08C7csFMNxzTuC137QQjUsPILE2x4NroeLwdBHlotxTsM6HR5ZdSSiNnI5QtVcLTQQRVvfGOxFlI4mxZiSCYw3XQoMY99bcZOslFOl0+d4eGSpL/IsNRpJhvOHTdREZBZekpjD8Wk8jhvlVt9am9QT9ZvLm6+QyPDYEpcPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SA0PR11MB4765.namprd11.prod.outlook.com (2603:10b6:806:9b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 20:08:14 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::27f1:a7a0:b6db:6c99]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::27f1:a7a0:b6db:6c99%3]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 20:08:13 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Implement HW workaround 14016763929
Thread-Index: AQHZxjutLuZIKIMbRU+KCX5qsQM4NK/Y79SAgAAJyZCAAX0OgIAAGj5Q
Date: Fri, 4 Aug 2023 20:08:13 +0000
Message-ID: <SA1PR11MB6991FDFAE9BAD794C732A9B49209A@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20230803190149.2637666-1-oak.zeng@intel.com>
 <c5b2618cc31febf582651f3f2b7875405851ba09.camel@intel.com>
 <SA1PR11MB6991205AEC4589D7D76C24CB9208A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <7849d9c4-3bbb-4c84-92c7-fb391bdde282@intel.com>
In-Reply-To: <7849d9c4-3bbb-4c84-92c7-fb391bdde282@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SA0PR11MB4765:EE_
x-ms-office365-filtering-correlation-id: f3ab490e-c538-4e8e-378c-08db95268843
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zo5fenX9Ac136/JfHneq+pkx5yDwu/6mIh3xnf/bJgM5ZTyzBEylEEtEnKAxC3pNedJeRRaGi+U7YeYKRv5N4GVx9sRM5bsVTptIXrSgLQzHpr0WBugOfB/dShuEUGVmIeEYnwryiPq2oygz32ub7p/3dtKjpjiuAwGUIMbliQSVYvyjiNY3jRcQkDUdF+C0PM1eL0DR+V04HUwBdqc5s/jnlGfyjpXpnZlgk/eSCGFNhuDKcGNswbwVnTO03eV5gsGFM3bK5vw2TomQSxS7K7V4K0T7cAnBCKusEpVIeIz2lV7UlDh8azpzU9qWm5EgPwtviWkWzd/nmIdTJciBiwv3oZGQ5NMN9c3LCwFYtRvpWrM1KdXvsNYzP7K0wMXiP3FQiq1oC5fA9C5pZDaxuWXk3XekO38sooIT5CtvSzcXUqWqJG7ME1O4hc4+xdWbA2cmxxIsTfbuNTDBxohcV2t4OY+duEf8/dZS7uofhCNCM3uTeV5hrZSOkSW1uIeH11HfsAcTwXabJszw0ywHLy8+eFRwlUaxk3Syb1Y7vqW826EnaAFJ3nIixq7i7JnmP2ls0klOo3urw9kamAuc3G/mxYCMrlbRd/eUsBXKAz0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(136003)(366004)(376002)(451199021)(1800799003)(186006)(2906002)(71200400001)(26005)(38100700002)(107886003)(122000001)(53546011)(5660300002)(6506007)(83380400001)(52536014)(66556008)(8676002)(8936002)(33656002)(66946007)(76116006)(4326008)(66446008)(66476007)(64756008)(316002)(41300700001)(38070700005)(7696005)(55016003)(9686003)(86362001)(82960400001)(54906003)(966005)(478600001)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUpyRkxEOWdkT000UEhTZDJTM0FOZWh5MFZkSExPZGttUjFFVVR2S3Vremdj?=
 =?utf-8?B?ZEs4QTFtcWVZN05JdjN1S1lnUVc5NU9ZeHBiaEwxVFpmZG9vUTFUNmVPK05R?=
 =?utf-8?B?NUtDUHlua1hIcjBzdXlLT0M1TWl4MUpLejNPcmp1OHhjU2tuWXo4OUxyRVlu?=
 =?utf-8?B?d2Fsc0JGekh6bG9TaWJPakdEWUFNa0pnZ0hFYTZ4WTc3VjMraVpzc3ZwQkpi?=
 =?utf-8?B?ZUxlMmZ5QVQ4U3ZhMEJHQlFuazYweGlIaTRwbG5vbzJwUVdRZThpZnhMOWd4?=
 =?utf-8?B?Tk9hWllJbmNVVVZRcUcvcU9jL1hHOVhUUnBjMFhVd0Jqc0hvdUZiY3VVZ3Yr?=
 =?utf-8?B?M0VLVmdtajNmcHQ3ajNJdTZhanQrWXpTUE5DR08xdDdlWk1HSTJxdVlUaVVG?=
 =?utf-8?B?MDRXK3JKWFBLZkFUek56SkN0eHMyWno3SFdKRytOdVgyVXl0M2RzNkJ0djdu?=
 =?utf-8?B?WmxoNDRWZXJCT0hjTGlwRldjL2xpTUpvUXNOenhnenh6UTRjS3ZEaXB3eVlJ?=
 =?utf-8?B?ei8vdG5pQ3NoOVd3UkRoQlpFeE5vZk8yYjZRdG9Ja1d6VGMwYmNxZnk5dnVO?=
 =?utf-8?B?clp6VE5HRHBaWlc1T0RrR2RLQUlrTHduSVcwMWRqQlV3ZWtuREdYVERuODB5?=
 =?utf-8?B?Ry85aFlaK3JYcTl6Yk5VR2NkWklEdmhiVHEzODVpaHNVQm90aVVBOStSZFhG?=
 =?utf-8?B?QVlKenduVFZlenRFaUg4YkFNcGdGSzZtRGduc3o0bWo5ZWpzdDVuMzRjTWpH?=
 =?utf-8?B?K2NTY1czTFprditiOGltU2k0RU1YRC8ybldzY0VJRTdodW5tRGZhSW1LYVdi?=
 =?utf-8?B?L2tpUWRZS0w1RDRYVTAxU1hnME1VN3RDN05ySFBQRTMxT1RGZ2dCUHJQTUpy?=
 =?utf-8?B?NjFQRXdNOGdMam81eWtKNldHUnVNVVBFYUNjNklrUmhOSlVvZ0lwQVV0cTVx?=
 =?utf-8?B?c0Y4TGF0YUtTZktQbWlSbVM4Ny83Sm9nZmh6SUNhNU5NNFN0RWMrMFhMZmJ3?=
 =?utf-8?B?eEhrWnNIaHRMTy9uamlqODhUQnlUUnhSb0lrN1JqS3N2M3dsWDJ4ZEFLYnBC?=
 =?utf-8?B?bWw5a3JtMUFHV05SaDZHU1JlTGtXeTFmU2d0YmtpUzVRVk9CTWovWTd2bmNH?=
 =?utf-8?B?bC9lUmZqK0lqOXBpWGs5K0Q3TEx0NGU4blFlQVFKMWVNMzQ1d1k5bDBNTXlO?=
 =?utf-8?B?NnpqN0lMWWphTTBNUDR2TlpEZjlaWncwekRPTEdkenhOREpZcnlVNU1jZysy?=
 =?utf-8?B?MVA4azVZRHUySVVLU21ybXczcWlFcExaSzRYenJ1bGxkWnVUeWNvU25qMndv?=
 =?utf-8?B?U2h4NCtwZkd0MWkvQjNLdWxXYlp6ZG5hN0w2Smp0dUs5NVdQbHA4cVBmeDFu?=
 =?utf-8?B?N0tUWVp6RjZ6USt5SkQ5VVdBUUplY3lFVFgzNWJMeVJMVTdWNW5qMTkybmN1?=
 =?utf-8?B?aVB2OVM3UCtRRlRGaGE1Y1NWMXNkOERXR1E5ajdrckoyejc0ZmdHRHovaUZq?=
 =?utf-8?B?bWdrTVM1VFZZWVEvZG5oNmd0a0ZISDBMNHM2Y1FXN2tJbFIzTjJHY2ZEQXNL?=
 =?utf-8?B?QngyVzRHZlNVUjBxQUJYbncrcjF5YzVQU0NDTC9WOHlvZy9paFViZVBSL2Ix?=
 =?utf-8?B?TlAvU21oOEtqb2tMTVJzN3lYWkJzUzhyTFNRTWFaNE1KTHJPN0tFb1lDbCsv?=
 =?utf-8?B?TWZvbkVpRjNJZEVGMzVZM0JrNm9tTGgvZHQyWnRPMHhvL1VHWXE3VlV1aDI1?=
 =?utf-8?B?ditYWmxlZGVrckxXbHQrbGR0NUhoY2pYRWJKL2wwa3NQbk5EWmFlTmZwMzdD?=
 =?utf-8?B?ODc5aVZHQXZOQ1pna2F6c0RUc3BKOHZFTmhIMllxYk5OWDU0djFqaG5uTStP?=
 =?utf-8?B?SE5TcEJDWnUxZ25WMFdvUW9NdVkyOWpwNzllK0tmdWxZWXBNam10TTZEQWhp?=
 =?utf-8?B?VFg1MVovOGZLdHlRbGo0anVXOWc4bFJtRmRGdUl2ME1CaXVzZnZYRFowcDZx?=
 =?utf-8?B?bzhuR0VzeHFpb2xOUXVRc3prVDNEblRDMkNMcDF6QS9ZOGVSYng4MFpDRkcy?=
 =?utf-8?B?cUl6RXRhcXdwUTNKWUdkRVdaaUc2QTlHTnpjbVVnQ3EyWjl4bVdpcXBoSTdT?=
 =?utf-8?Q?a1LU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ab490e-c538-4e8e-378c-08db95268843
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2023 20:08:13.0239 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hnw5CZqFR0JzT0jtn8FEPNT2tb8O7CmaMQeCK5ZiizIjEfZ3QLnEK21Zcqhlym6VRcZM8RKmPik6keLRITGOSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4765
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNClRoYW5rcywNCk9haw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IFdlbHR5LCBCcmlhbiA8YnJpYW4ud2VsdHlAaW50ZWwuY29tPg0KPiBTZW50OiBBdWd1c3QgNCwg
MjAyMyAyOjI5IFBNDQo+IFRvOiBaZW5nLCBPYWsgPG9hay56ZW5nQGludGVsLmNvbT47IFNvdXph
LCBKb3NlIDxqb3NlLnNvdXphQGludGVsLmNvbT47DQo+IGludGVsLXhlQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPiBDYzogRGUgTWFyY2hpLCBMdWNhcyA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29t
PjsgUm9wZXIsIE1hdHRoZXcgRA0KPiA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gU3Vi
amVjdDogUmU6IFtJbnRlbC14ZV0gW1BBVENIXSBkcm0veGU6IEltcGxlbWVudCBIVyB3b3JrYXJv
dW5kIDE0MDE2NzYzOTI5DQo+IA0KPiANCj4gT24gOC8zLzIwMjMgMTI6NTMgUE0sIFplbmcsIE9h
ayB3cm90ZToNCj4gPg0KPiA+DQo+ID4gVGhhbmtzLA0KPiA+IE9haw0KPiA+DQo+ID4+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IFNvdXphLCBKb3NlIDxqb3NlLnNvdXph
QGludGVsLmNvbT4NCj4gPj4gU2VudDogQXVndXN0IDMsIDIwMjMgMzoxMCBQTQ0KPiA+PiBUbzog
aW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBaZW5nLCBPYWsgPG9hay56ZW5nQGludGVs
LmNvbT4NCj4gPj4gQ2M6IFJvcGVyLCBNYXR0aGV3IEQgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5j
b20+OyBEZSBNYXJjaGksIEx1Y2FzDQo+ID4+IDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+
ID4+IFN1YmplY3Q6IFJlOiBbSW50ZWwteGVdIFtQQVRDSF0gZHJtL3hlOiBJbXBsZW1lbnQgSFcg
d29ya2Fyb3VuZA0KPiAxNDAxNjc2MzkyOQ0KPiA+Pg0KPiA+PiBPbiBUaHUsIDIwMjMtMDgtMDMg
YXQgMTU6MDEgLTA0MDAsIE9hayBaZW5nIHdyb3RlOg0KPiA+Pj4gVG8gd29ya2Fyb3VuZCBhIEhX
IGJ1ZyBvbiBERzIsIGRyaXZlciBpcyByZXF1aXJlZCB0byBtYXAgdGhlIHdob2xlDQo+ID4+PiBw
cGd0dCB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2UgYmVmb3JlIEdQVSB3b3JrbG9hZCBzdWJtaXNzaW9u
LiBUaHVzDQo+ID4+PiBzZXQgdGhlIFhFX1ZNX0ZMQUdfU0NSQVRDSF9QQUdFIGZsYWcgZHVyaW5n
IHZtIGNyZWF0ZSBzbyB0aGUgd2hvbGUNCj4gPj4+IGFkZHJlc3Mgc3BhY2UgaXMgbWFwcGVkIHRv
IHBvaW50IHRvIHNjcmF0Y2ggcGFnZS4NCj4gPj4+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBPYWsg
WmVuZyA8b2FrLnplbmdAaW50ZWwuY29tPg0KPiA+Pj4gLS0tDQo+ID4+PiAgIGRyaXZlcnMvZ3B1
L2RybS94ZS9NYWtlZmlsZSAgICAgICAgfCAyICstDQo+ID4+PiAgIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV92bS5jICAgICAgICAgfCA1ICsrKysrDQo+ID4+PiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV93YV9vb2IucnVsZXMgfCAxICsNCj4gPj4+ICAgMyBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlDQo+ID4+PiBp
bmRleCBlNzk2MjRhYjJjYjMuLmU2YTA1ZDM1YzkzMSAxMDA2NDQNCj4gPj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0KPiA+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL01h
a2VmaWxlDQo+ID4+PiBAQCAtMzcsNyArMzcsNyBAQCBxdWlldF9jbWRfd2Ffb29iID0gR0VOICAg
ICAkKG5vdGRpcg0KPiAkKGdlbmVyYXRlZF9vb2IpKQ0KPiA+Pj4gICAkKGdlbmVyYXRlZF9vb2Ip
ICY6ICQob2JqKS94ZV9nZW5fd2Ffb29iDQo+ID4+ICQoc3JjdHJlZSkvJChzcmMpL3hlX3dhX29v
Yi5ydWxlcw0KPiA+Pj4gICAJJChjYWxsIGNtZCx3YV9vb2IpDQo+ID4+Pg0KPiA+Pj4gLSQob2Jq
KS94ZV9ndWMubyAkKG9iaikveGVfd2EubyAkKG9iaikveGVfcmluZ19vcHMubzogJChnZW5lcmF0
ZWRfb29iKQ0KPiA+Pj4gKyQob2JqKS94ZV9ndWMubyAkKG9iaikveGVfd2EubyAkKG9iaikveGVf
cmluZ19vcHMubyAkKG9iaikveGVfdm0ubzoNCj4gPj4gJChnZW5lcmF0ZWRfb29iKQ0KPiA+Pj4N
Cj4gPj4+ICAgIyBQbGVhc2Uga2VlcCB0aGVzZSBidWlsZCBsaXN0cyBzb3J0ZWQhDQo+ID4+Pg0K
PiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3ZtLmMNCj4gPj4+IGluZGV4IGNiMjhkYmMyYmRiYi4uYjA0NWJiMzQxYTVj
IDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gPj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+ID4+PiBAQCAtMjksNiArMjksOCBAQA0K
PiA+Pj4gICAjaW5jbHVkZSAieGVfcmVzX2N1cnNvci5oIg0KPiA+Pj4gICAjaW5jbHVkZSAieGVf
c3luYy5oIg0KPiA+Pj4gICAjaW5jbHVkZSAieGVfdHJhY2UuaCINCj4gPj4+ICsjaW5jbHVkZSAi
Z2VuZXJhdGVkL3hlX3dhX29vYi5oIg0KPiA+Pj4gKyNpbmNsdWRlICJ4ZV93YS5oIg0KPiA+Pj4N
Cj4gPj4+ICAgI2RlZmluZSBURVNUX1ZNX0FTWU5DX09QU19FUlJPUg0KPiA+Pj4NCj4gPj4+IEBA
IC0xMjM1LDYgKzEyMzcsOSBAQCBzdHJ1Y3QgeGVfdm0gKnhlX3ZtX2NyZWF0ZShzdHJ1Y3QgeGVf
ZGV2aWNlICp4ZSwNCj4gPj4gdTMyIGZsYWdzKQ0KPiA+Pj4NCj4gPj4+ICAgCUlOSVRfTElTVF9I
RUFEKCZ2bS0+ZXh0b2JqLmxpc3QpOw0KPiA+Pj4NCj4gPj4+ICsJaWYgKFhFX1dBKHhlX3Jvb3Rf
bW1pb19ndCh4ZSksIDE0MDE2NzYzOTI5KSkNCj4gPj4+ICsJCWZsYWdzIHw9IFhFX1ZNX0ZMQUdf
U0NSQVRDSF9QQUdFOw0KPiANCj4gSXMgYWJvdmUgY29ycmVjdCBwbGFjZSB0byBpbnNlcnQgdGhp
cz8NCj4gSSBkaWRuJ3QgbG9va3VwIHRoZSBXQSwgYnV0IHdvdWxkbid0IG9ubHkgdXNlciBWTSdz
IGJlIHRoZSBjb25jZXJuPw0KPiBTbyB0aGUgYWJvdmUgY29kZSBzaG91bGQgaW5zdGVhZCBnbyBp
biB4ZV92bV9jcmVhdGVfaW9jdGwoKSBzbyB0aGVuIGlzDQo+IG5vdCBnZXR0aW5nIGFwcGxpZWQg
Zm9yIGV4YW1wbGUgdG8gdGhlIHNwZWNpYWwgdm0gY3JlYXRlZCBpbg0KPiB4ZV9taWdyYXRlX2lu
aXQoKS4NCg0KWW91IGFyZSByaWdodCBCcmlhbi4gSSB3aWxsIHJlc3VibWl0Lg0KPiANCj4gDQo+
ID4+DQo+ID4+IElzbid0IERSTV9YRV9WTV9DUkVBVEVfRkFVTFRfTU9ERSBpbmNvbXBhdGlibGUg
d2l0aCBTQ1JBVENIX1BBR0U/DQo+ID4+IFdoYXQgaWYgdXNlci1zcGFjZSBhc2tzIGZvciBmYXVs
dCBtb2RlIGluIERHMj8NCj4gDQo+IFNvIEkgdGhpbmsgd2UgYWdyZWVkIHRoaXMgaXMgYmFzY2lh
bGx5IGEgbW9vdCBwb2ludCBzaW5jZSBGQVVMVF9NT0RFIGlzDQo+IG5vdCBzdXBwb3J0ZWQgb24g
REcyLg0KPiANCj4gVG8gdGlkeSB0aGlzIHVwIGFuZCBhZGRyZXNzIEpvc2UncyBwb2ludCwgSSB0
aGluayB5b3UgY291bGQgcmVvcmRlciB0aGUNCj4gZXJyb3IgY2hlY2tzIHRoZW4/DQo+IA0KPiBT
byBtYWtlIGJlbG93IHRoZSBmaXJzdCBvZiB0aGUgRkFVTFRfTU9ERSBjaGVja3M/ICBPciBtYXli
ZSBkb2Vzbid0DQo+IG1hdHRlci4uLg0KPiANCj4gICAgaWYgKFhFX0lPQ1RMX0RCRyh4ZSwgYXJn
cy0+ZmxhZ3MgJiBEUk1fWEVfVk1fQ1JFQVRFX0ZBVUxUX01PREUgJiYNCj4gICAgICAgICAgICAg
ICAgICAgICAheGUtPmluZm8uc3VwcG9ydHNfdXNtKSkNCj4gICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsNCg0KTWFrZSBzZW5zZSB0byBtZS4gV2lsbCBkbw0KDQpPYWsNCj4gDQo+IA0KPiANCj4g
Pg0KPiA+IFZlcnkgZ29vZCBwb2ludC4gV2hlbiBJIGZpcnN0IGdldCB0aGlzIHJlcXVlc3QgKHRv
IGltcGxlbWVudCB0aGlzIHdvcmthcm91bmQNCj4gdGhlIHdheSBhcyBzaG93ZWQgaW4gdGhpcyBw
YXRjaCksIEkgdGhvdWdodCB0aGlzIHdvcmthcm91bmQgaXMgYmV0dGVyIHRvIGJlDQo+IGltcGxl
bWVudGVkIGZyb20gVU1ELCBzaW5jZSBrbWQgYWxyZWFkeSBleHBvc2VkIHRob3NlIGZsYWdzIHRv
IHVzZXIgc3BhY2UuDQo+IEJ1dCB0aGVyZSB3ZXJlIHNvbWUgb3RoZXIgZXhwZXJ0cyBoYXMgZGlz
Y3Vzc2VkLCBzZWUgdGhlIGNvbW1lbnQgaGVyZToNCj4gaHR0cHM6Ly9qaXJhLmRldnRvb2xzLmlu
dGVsLmNvbS9icm93c2UvVkxLLQ0KPiA0OTk5MT9mb2N1c2VkQ29tbWVudElkPTIxMDU1NjA3JnBh
Z2U9Y29tLmF0bGFzc2lhbi5qaXJhLnBsdWdpbi5zeXN0ZW0uaXNzDQo+IHVldGFicGFuZWxzOmNv
bW1lbnQtdGFicGFuZWwjY29tbWVudC0yMTA1NTYwNw0KPiA+DQo+ID4gTGV0IG1lIGNvbW11bmlj
YXRlIGJhY2sgdG8gc2VlIHdoZXRoZXIgd2UgY2FuIGltcGxlbWVudCB0aGlzIHdvcmthcm91bmQN
Cj4gaW4gdW1kIHNvIHdlIGRvbid0IGhhdmUgc3VjaCBpbmNvbXBhdGlibGUgY29uZmlndXJhdGlv
biBhbmQgYWxzbyBub3Qgc2lsZW50bHkNCj4gY2hhbmdlIHVzZXIncyBzZXR0aW5nLg0KPiA+DQo+
ID4gVGhhbmtzLA0KPiA+IE9haw0KPiA+Pg0KPiA+Pg0KPiA+Pj4gKw0KPiA+Pj4gICAJaWYgKCEo
ZmxhZ3MgJiBYRV9WTV9GTEFHX01JR1JBVElPTikpDQo+ID4+PiAgIAkJeGVfZGV2aWNlX21lbV9h
Y2Nlc3NfZ2V0KHhlKTsNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3dhX29vYi5ydWxlcw0KPiA+PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YV9vb2Iu
cnVsZXMNCj4gPj4+IGluZGV4IDE1YzIzODEzMzk4YS4uNmZjNjhjNTkyY2E4IDEwMDY0NA0KPiA+
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhX29vYi5ydWxlcw0KPiA+Pj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhX29vYi5ydWxlcw0KPiA+Pj4gQEAgLTE1LDMgKzE1LDQg
QEANCj4gPj4+ICAgMTgwMjA3NDQxMjUJUExBVEZPUk0oUFZDKQ0KPiA+Pj4gICAxNTA5MzcyODA0
CVBMQVRGT1JNKFBWQyksIEdSQVBISUNTX1NURVAoQTAsIEMwKQ0KPiA+Pj4gICAxNDA5NjAwOTA3
CUdSQVBISUNTX1ZFUlNJT05fUkFOR0UoMTIwMCwgMTI1MCkNCj4gPj4+ICsxNDAxNjc2MzkyOQlQ
TEFURk9STShERzIpDQo+ID4NCg==
