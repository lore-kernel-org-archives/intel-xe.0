Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFA3C001DF
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 14:39:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAE710E405;
	Tue,  1 Aug 2023 14:39:54 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A117910E405
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Aug 2023 14:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690900792; x=1722436792;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=gvn7k5hVz0C1khCtPwpCi9ns1QgXsmCL9hGT2FthHGk=;
 b=MOkkx8+gw5qiuVr1thTkPVdVHw+ClQcxt7882vudlx6ayXeKvtV1DIRx
 OPOgRyBNZJNsKFZShnduLxssuz6CX3URLXJ36CvxVY4QPSOVzsWBdgtN0
 onYBdfQV66mXbN5A3shikPp37e9m1p6L54128rhMEz4Zi77Xn3Nu2a5Ww
 5St9ePXejOZbkBcF6c/x2S1VoU8E6nk19YONVpaSg3mrEcFCNZ5AEw0Ex
 frVlO+bMVTqsj4eyoQdvzW/cY/nojiHlT2df53r/zP6f9z98v8fVJVb49
 WfCqTqt7mkINMrHQ0HUW8S1MhY64h8yO59CardL94ztv7bkVje8u+K9CZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="400262469"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="400262469"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 07:39:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="678690649"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="678690649"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 01 Aug 2023 07:39:51 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 07:39:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 07:39:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 1 Aug 2023 07:39:50 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 1 Aug 2023 07:39:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVUU6uo9+wnSc7R9Z8xzanV4dvtS/aJRA5bz4VLR2F+btValtI4hS1h2icXf9N7ZNFLwn1nfK/pupKqcyBe3H+I1I/XdJcRxIbRIaCnoT8jgn3DF+lx797gkkEEHUNOH62iD4ysexHXgIf6UYM4GGxwl3ntL8PezWS5SBhbTvct+olsCM+dvftX6YQW77wORA7VGJARGX1dsw3omnJURbVsw96Qwl82eVe6egwmCxmA0MKinRgc+f+UZJ6s20IkU9AnCvTvd6NA+pDqjobr8EaTBCcbob9yXNVZIrW4qT5RMIq9ldGENIoKfwpgrUvWqebsXwE+ORDUsiVmxQl/05A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvn7k5hVz0C1khCtPwpCi9ns1QgXsmCL9hGT2FthHGk=;
 b=ZscRMwsswM4bZCWohYXt9bdZ2JQCHo4flEIX3dIktzmyycnckcJaf0BpLhETl1DyDagxRR07zElNzNdE8Xsk0egLeRh5Xw6AQmgjhNWCXFagsr3RyqjPXdiud0WWcS8CFY5dv0CXKvKHAGePHwdLhdJhyq0meGdXHE3XuwHvIfZFve4quXR0UgNomzePTu2um9b1Y4VzQt7nOv298Rsfb8/h+bErZkByiNB21n7MfIpyIw64QmeJOq5sxHj/buwZG5rR/Y0STj+gzDNeF61shgl8DkBdQ2FCnDo7vYdao0PTXEVy09mcWq1mlikK6cerQmuaUtjd/3Ixj/we/helqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7467.namprd11.prod.outlook.com (2603:10b6:806:34f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Tue, 1 Aug
 2023 14:39:48 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 14:39:48 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, "Dugast,
 Francois" <francois.dugast@intel.com>
Thread-Topic: [Intel-xe] [PATCH v3 2/3] drm/xe: Prefer WARN() over BUG() to
 avoid crashing the kernel
Thread-Index: AQHZwJpu79RwDu9P60+FetcfMRPy6q/VgCIAgAAKsIA=
Date: Tue, 1 Aug 2023 14:39:48 +0000
Message-ID: <9740b69d9b95b477fcc50761644a70cf47d72626.camel@intel.com>
References: <20230727145530.7-1-francois.dugast@intel.com>
 <20230727145530.7-3-francois.dugast@intel.com> <877cqex3np.fsf@intel.com>
In-Reply-To: <877cqex3np.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6059:EE_|SN7PR11MB7467:EE_
x-ms-office365-filtering-correlation-id: 37b8748d-221a-4be0-5a1e-08db929d283e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +9Yhs3tRIAnLiJawKFH7B4V4k34bJtamfxJnaJPLZvymrwm0tPSuByPk21bi4a1ZKO99D5x0SWzQlM2dQgvAXU6ZwhwF10t7Ax0hp0SArbC8uqJLkPMnS2/iKOoM6pLH7NAoutdidDfD+3tDR2Q7jVLValtt+Z1iWwuPhqtbRBjXzfskilMcW5LDytS92QV19yfXVUWlcE7BjyHjNwZWw6GL3X93ppLz5RA43WX54NSaGpp+m5fUXuajV/lkFLF15GNK5Z5tyrIvCuBsH0E9lZMjxgeYTTrPu9ntRJiiR4dZBBHQmttAn8oZIwZ/3nwosuFJqckn1rs9fiz6wi9BDC/5s8g7o5rKLLheAiOGmft7NrF9KNRv8cV848alGjLXri/QARDZzBJmSUzJuQipf4EZChysqAX8NmoUEokvr2GI/X8KHmer/5gvv1Egk0Al64BPtjx3QB38bj9om7ZMTY9f+7nQ6AStZ6acBdQQz56ISgY8vrJvTB6s9G/F5WME5p7K4QQz7fU1CxtSVJq4RAaDTw8CADAEIJ2rlQrEXFNgKiNaN2k6HDqr+1Se3PUyr+Te+Zizm30Baq+uArsG7rSh6BMH2RAINqONCYDU2a/wn55K7pi2cm4JfdpXBtqR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(396003)(39860400002)(136003)(376002)(451199021)(83380400001)(82960400001)(2906002)(110136005)(2616005)(6486002)(38070700005)(71200400001)(26005)(478600001)(91956017)(6512007)(86362001)(38100700002)(5660300002)(41300700001)(66556008)(6506007)(66446008)(66946007)(316002)(76116006)(64756008)(122000001)(6636002)(8936002)(36756003)(8676002)(66476007)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1ZpWmYxRkVqSFgzV3FGL1RqVENNSmVuVjU1OFdZU1pQb1ZoeW1rZFh6UCti?=
 =?utf-8?B?NTIrZG5sd2Z1NjNYTW02VytOUFErKzQzcTVLM29RU3M1ZmhEZERRbUJBQVpW?=
 =?utf-8?B?ODRLajNuTk84eDZXTEJOenZBNkptQ29wMm9UZDFlejRjNmZocHZKUVUvdnhW?=
 =?utf-8?B?ZGtTeTI4TURMZnd6WU5hSXhub2lxeVhzaVNpcUxQTHU2cHNQYUFzQmJoQlFE?=
 =?utf-8?B?eFpGYkdXVVN3TjE0NXFSS05hRmV1b0pHYWhzT0xRc3Y2c3Z2WVdaUTRJNVFH?=
 =?utf-8?B?QmZUMlFIcUxTblFQOUhjdzRNZWJhSTB0YzBrZDQvUHBRYXlDcDdCS2JCaTJO?=
 =?utf-8?B?NWJic3MwVmpZMHBKbUV3b2JMRVBuSUlvVlBCY0FMUHNZdkk3R004cUZ0dnVR?=
 =?utf-8?B?Vm5hbFNpbnZCNjJVN1dvNGZiYW5HbVJ4Tm5MMFJ6Y1ZUMnNBRnRmVnYwb2Zu?=
 =?utf-8?B?Y1o4TFB4THFVd2h1N0hFS3ZLYkJBNmtDeUVRZkJCOUxjSm9IMTFwK05MYWU0?=
 =?utf-8?B?OXRVR2xIdTlCTmhqL1Y4azkyem1EMEJmUGdOM25naERqeTJJUVRsQlFOSi93?=
 =?utf-8?B?dlBuaGZsSWF0VU1YUUpNTkV4SnFydTA1TVJaa0tYZFpvWCtZNitiWlk0aXhm?=
 =?utf-8?B?cTRGVWtWTWNDR3dXNWw4RDljUW5WMUp5UFlUUm5zUVN0bXF5R09uTTE3d3pr?=
 =?utf-8?B?azlNMHRLcjIwVDRmS000TEVXOWM5RnJmSndueHhWNExBaU5ybkhIU2lBb3F5?=
 =?utf-8?B?MzZZcTRQSnMvNnRoUWZQYjVwV2EyZ0NGZ2UvZFhhS1B6UkZMbFZ3YU5UV0NJ?=
 =?utf-8?B?TGhuaVRWSHduSitYWDM2bEx4bml3bzJOWThIVW1sRDZ5K2FXcE9qTUVQRXcr?=
 =?utf-8?B?RkwyTFduYUREOE4zWXhHUDh5T21CQWZGZ3NUODBKaHpaMHR0d0k2SjRTRFhq?=
 =?utf-8?B?c2NydTYvbFVyb3NvN3E1bzArMTRPMnp4dGNySFMzTnI4VU1vdGdWc2FJaEh3?=
 =?utf-8?B?cjBiWkVUdjN5TG03OGYrZkFTNDVQYW92UTdyOGFQYklZcG5jYVJjSnVrdDBj?=
 =?utf-8?B?eGFxbGRDRTRhekp2SUFzdmRzMHBuZTlRUEVJYWZLV3FFbWhQbnpuNWFvUjI2?=
 =?utf-8?B?ZWlZTFd4VXBFV0R1b2Q2aDRyUlVBSWtHSTlBbnV2NllsdG1CZVFxd0VIY0ht?=
 =?utf-8?B?UmpoZnVSMnA0c0tkQUZCa2tEMDNreCtNMm5wOGpMNld1R0RnYi9qckcvTSty?=
 =?utf-8?B?dmNzd0NxdnBDbENENU80bmZnZnVlYmMwMU5Qd2dhbWRvRVQ5UnR5Unc1T0N5?=
 =?utf-8?B?ejhZcXpoNGdNT1cwa1Avb1BMWnZ1emVKWXFGYlZ5QTM3L0ZRT1Q1SVB0amU0?=
 =?utf-8?B?Mk56LzYxRG5WMHQreklKVEk3NU41cU52cDFWZk9aQ1o1by91SlY5ek1YcnpE?=
 =?utf-8?B?M0h1bVdFeFlROXRjK0dWcnRkQnRxVU9wWDhTY2lOazYwTWl0QjZteExVZnJX?=
 =?utf-8?B?TE1YVktYd1gxc2E2UFNtUU9TYmlMOUVtMklnYmw5U2E5cjJGU20rR1M0MXV6?=
 =?utf-8?B?aG0wU2dvZFB5Qm5GcE1VVW1OOHdjNXVZTDdhZ1ZTTEUxbkxCVjdjd0ZXNWVZ?=
 =?utf-8?B?SjNIeEdNYjMwVTZZZkNQNUFuZm9oNWhZUitQUEgrZ252WmV2aHozQVRGcVdh?=
 =?utf-8?B?RlZUc285SHhnbXd2S3NsbUVTYVU0OXc3aXk2c1hCcXZWM2xIQzR6d2k1eTVs?=
 =?utf-8?B?c1hRb3Bac2pNSUk0WjFyZDEzTVZoYXp4VW16OWRCWUEvTnFHUXNndEFTZ0RT?=
 =?utf-8?B?V3pDUnZNNVB2TGN5TEgxL2hFR3I5aW41bFVDek1nYkdEeEJ2NjU1cXFLbTdo?=
 =?utf-8?B?QU91aWdmL1Q5QXo4aFVjdUxjZzdTTmlFS0szMXUwSWRoTFRZMGNjM0J4eUNP?=
 =?utf-8?B?b1N2TFBacmpqMUNjVlEvdHdjS1FMMS9WTGhxMEdYRFA3YTRMdGdMcCtGUEZR?=
 =?utf-8?B?WWVjaG1uTGVqTkRLYkV3VjErNFdCZ1lrNVlmMXl1TXBLaHRpUUk0MDFOSEVY?=
 =?utf-8?B?R0lrMjEzZk1yUld2T29VdDd3clo4YkVXTGRUZEFVb3ZMeUYzenNBTlFWQ083?=
 =?utf-8?B?TGJPZjF5N3J2WWRPVlRKVFRBbE5zSHY0L09RMUg3N2xHcktuK1RJTU9lV3c5?=
 =?utf-8?B?c2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3ED12D50C43EA74899B444810E6D75AC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37b8748d-221a-4be0-5a1e-08db929d283e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 14:39:48.5697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z/MrFEEMR01F49ubzf/k7C5ihPfUW6V+pHVkcXvrprzzqMvqXvF4Qn2nv3VGIJmcES7QrqNwbYNmPRxGICnDUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7467
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/3] drm/xe: Prefer WARN() over BUG() to
 avoid crashing the kernel
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

T24gVHVlLCAyMDIzLTA4LTAxIGF0IDE3OjAxICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToKPiBP
biBUaHUsIDI3IEp1bCAyMDIzLCBGcmFuY29pcyBEdWdhc3QgPGZyYW5jb2lzLmR1Z2FzdEBpbnRl
bC5jb20+Cj4gd3JvdGU6Cj4gPiBSZXBsYWNlIGNhbGxzIHRvIFhFX0JVR19PTigpIHdpdGggY2Fs
bHMgWEVfV0FSTl9PTigpIHdoaWNoIGluIHR1cm4KPiA+IGNhbGxzCj4gPiBXQVJOKCkgaW5zdGVh
ZCBvZiBCVUcoKS4gQlVHKCkgY3Jhc2hlcyB0aGUga2VybmVsIGFuZCBzaG91bGQgb25seQo+ID4g
YmUKPiA+IHVzZWQgd2hlbiBpdCBpcyBhYnNvbHV0ZWx5IHVuYXZvaWRhYmxlIGluIGNhc2Ugb2Yg
Y2F0YXN0cm9waGljIGFuZAo+ID4gdW5yZWNvdmVyYWJsZSBmYWlsdXJlcywgd2hpY2ggaXMgbm90
IHRoZSBjYXNlIGhlcmUuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIER1Z2FzdCA8
ZnJhbmNvaXMuZHVnYXN0QGludGVsLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBSb2RyaWdvIFZpdmkg
PHJvZHJpZ28udml2aUBpbnRlbC5jb20+Cj4gPiAtLS0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgfMKgIDIgKy0KPiAKPiBUaGlzIHNlZW1zIHRvIGhh
dmUgYmVlbiBtZXJnZWQgYWxyZWFkeSwgYnV0IGl0J3MgcmVhbGx5IG5vdCBoZWxwaW5nCj4gdXMK
PiB0byB0b3VjaCBpOTE1IGFuZCB4ZSBpbiB0aGUgc2FtZSBjb21taXRzIHVubGVzcyBpdCdzIGFi
c29sdXRlbHkKPiBuZWNlc3NhcnkuIFRoZSBpOTE1IGRpc3BsYXkgcGFydCBlc3BlY2lhbGx5IHNo
b3VsZCd2ZSBiZWVuIGEgZml4dXAKPiBwYXRjaAo+IHRvIHNvbWV0aGluZyBlbHNlLgoKbXkgYmFk
IHNvcnJ5LgpJIHRvdGFsbHkgZm9yZ290IHRvIHBheSBhdHRlbnRpb24gdG8gdGhlc2UgY2FzZXMu
Li4KCj4gCj4gCj4gQlIsCj4gSmFuaS4KPiAKPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Ji
LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDggKy0tCj4gPiDCoGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHwgNTIgKysrKysrKysrLS0tLS0tLQo+ID4gLS0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2JvLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxNCArKy0tLQo+
ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfYm9fZXZpY3QuY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqAgNCArLQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY2xpc3QuY8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE0ICsrLS0tCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9mb3JjZV93YWtlLmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNCArLQo+ID4gwqBkcml2ZXJz
L2dwdS9kcm0veGUveGVfZm9yY2Vfd2FrZS5owqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDQgKy0K
PiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2dndHQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHwgMTIgKystLS0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X2Nsb2Nr
LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDQgKy0KPiA+IMKgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d0X2RlYnVnZnMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4gPiDCoGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9uLmPCoCB8IDEyICsrLS0tCj4g
PiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfCAyMiArKysrLS0tLQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Fk
cy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxNCArKy0tLQo+ID4gwqBkcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjX2N0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMjIgKysr
Ky0tLS0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19od2NvbmZpZy5jwqDCoMKgwqDC
oMKgwqDCoCB8wqAgMiArLQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2xvZy5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDQgKy0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d1Y19zdWJtaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNDggKysrKysrKystLS0tLS0t
LQo+ID4gLQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfaHVjLmPCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9o
d19lbmdpbmUuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMCArKy0tCj4gPiDCoGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9od19mZW5jZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICst
Cj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgIDggKy0tCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9tYWNyb3Mu
aMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgLQo+ID4gwqBkcml2ZXJzL2dwdS9k
cm0veGUveGVfbWlncmF0ZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzNCArKysrKyst
LS0tLS0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B0LmPCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfCAyMiArKysrLS0tLQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfcmVzX2N1cnNvci5owqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMiArKy0tLQo+ID4gwqBkcml2
ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAg
OCArLS0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3NjaGVkX2pvYi5jwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqAgMiArLQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX3N0b2xl
bl9tZ3IuY8KgwqDCoMKgwqDCoCB8wqAgNCArLQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVf
dWNfZncuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE2ICsrKy0tLQo+ID4gwqBk
cml2ZXJzL2dwdS9kcm0veGUveGVfdWNfZncuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqAgMiArLQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDU2ICsrKysrKysrKystLS0tLS0KPiA+IC0tLS0KPiA+
IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhaXRfdXNlcl9mZW5jZS5jwqDCoMKgwqDCoCB8wqAg
MiArLQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfd29wY20uY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8IDE4ICsrKy0tLS0KPiA+IMKgMzQgZmlsZXMgY2hhbmdlZCwgMjIxIGlu
c2VydGlvbnMoKyksIDIyMiBkZWxldGlvbnMoLSkKPiA+IAo+IAoK
