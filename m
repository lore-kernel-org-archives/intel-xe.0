Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05F5C77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 13:58:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BFA10E0B4;
	Tue, 30 May 2023 13:58:16 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D5110E39E
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 13:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685455093; x=1716991093;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=P4jmGqVWLfVqon5G5u5u2twOnaY4u0g/6yIHZGajGGY=;
 b=LtX+72Tfnf6GWJLx3qrhOHpxJh5Pnyg3HQK8NuoZ44JdX6yyqTbdepRS
 r6xGJlkCplBlFn/p+vOuPqEH7x9oMD5qLKwHnisvbG7vhfQZ/55ofWSA6
 iB5Ac34uf1sxzN/J9h4uT9GVQmqcFTheHskBREYwGTRt3ek0aUL/6RTJ7
 alFA1ScTj6Wze/i9dlh65kwJhyNQizhsqt1QsuMMoVdU1ggN6foDaFvVB
 bby7wFktDzaPnaUgPhL4e+DZ+2R4GzseltgUgWJLZd6HAcQ8sevF81n/X
 8Iz8a50pAcdLzdUZdL0JCEopXSk7716MAkSAMFCilBtui2TLYcAXzPe3A Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="344423725"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="344423725"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 06:58:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="850776530"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="850776530"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 30 May 2023 06:58:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 06:58:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 06:58:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 06:57:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E4/d4doFV0TXFMBOjff4qPTcaNjFiaFLLsFbuGB31C549SH86fnv8EpUgysWKRsHmtW5d8K/JFaq58wxBREAaxT1BE5JrKp7o7FmoDy+KhJjWvnPiIRP+VIXw5a1wjjA2t4wySiTYG0JZkYC3wGWgDbXjAY/NBUSj+38X8ciTQUCF9pzpZRfeGvrZG4O1NSCL5I1Xnw/5KNJnN3MjfGq+EXNghdGWf5p/SLn+rh4yxFtvQbprCI485btCfk+9LUdcP8SR+KxxlBwzCQroHgziLA2BEErz0RpJSxzmATExJdl8tdEnsQu36Dj8xVtsivB4GjqFOJSeyoLP5ssRYkDng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4jmGqVWLfVqon5G5u5u2twOnaY4u0g/6yIHZGajGGY=;
 b=gSifh94iDs7n5gUn0TWn3o1wxBpxDbsSUvGP6uU9r6rnLJSucv9Ipae3R8SIhDitW9rowzGylinX+LeDpubyyf8hBQ9upx95P+KTIjTgTgrat25PGslYPfwaJzZRngMRc0R/aAyEO8oITpFxVIEpGEhB40yck9kA2umYbkSG9kuxqlU+/9lGsYD55sOS9uj0fRs+AOY26nNn3eR4bpI9Bp8gzfeHX7cGJrCXZbALZtbN8ZOEQL35ZqjPB478S2uvfVs29pIkJUW9ZBxmCoiX2nuPHLcUNHzf8h0ZRN8wxETY3pd2HNBtMf5YGw8gIGJF2AzVnS1jrLFdT/mlFgKw4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 IA1PR11MB7341.namprd11.prod.outlook.com (2603:10b6:208:426::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 13:57:57 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::2796:34e3:dbb9:fe97]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::2796:34e3:dbb9:fe97%6]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 13:57:57 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>
Thread-Topic: [PATCH v2 0/9] Clean-up Xe FBC additions
Thread-Index: AQHZkuQmF17MQt3OokaVVx/wC/JTwK9yxU6AgAASYIA=
Date: Tue, 30 May 2023 13:57:56 +0000
Message-ID: <69a8caf99beb496d15f791e0f8f3fb98a32719b8.camel@intel.com>
References: <20230530104713.2570554-1-jouni.hogander@intel.com>
 <87fs7egex2.fsf@intel.com>
In-Reply-To: <87fs7egex2.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|IA1PR11MB7341:EE_
x-ms-office365-filtering-correlation-id: 7dc5deac-ac25-4b09-5151-08db6115df41
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Or6krxv0oMGuzQnH1BGlT4ugUXJlGxM6NDhKyvS50joR8zympERtVrr8uJvqvOnG4XtCkk/U1Qfk/Jyy9qwDyuSI+x6PTNP4SkUT8gb6K2FpbQIb57j0ccwYAvLyiAAXFROVSmWcRD4eVepTbeQ8leHhLOgeK+zk4y222h/tZOADY4SeKlaDCv6u+QUO2S0hc15iXyAIiISpPPiVNVTlhdcVWadcS9+Z9CLo9qKI61D38yeaYf313zcmiIDw5i7CIXAojsHUpJryMHIR0Ffwv/HwaYbn73F1TuLW1PyqO7TV2ZVovhgMDj32Qh8mUNKAVwaix4MFOmqfxixiVapBs//RFvnfcJsBEFBD6bJ3J7fydiUvlKgGEGnUU31K+X77ZvIXJxxPBxSkT10bUQ/EHLABz7tzXQakMjLCPz262oMRZJ7Jq8PPHYUCzsW0lzKRlz35CEwyxif3nLFQ4MN7ZMJpeilHk1rojRPQ56EEcUbXnC5MiMPnvQTz1hMyGFFj/lzz5rBeu22rBeRLpq67fXUFL41MMeovRO9nLj+rDfpn7xQCQUQzUF/J/Py0/1sA4FoO74FilWpDMurPliMrje9EIqjPIp+KsW7e2WMFd6GO7nXyt729s1kaxnz0gifr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199021)(86362001)(36756003)(316002)(110136005)(54906003)(6636002)(4326008)(91956017)(66446008)(76116006)(66946007)(66556008)(64756008)(66476007)(478600001)(6486002)(71200400001)(8936002)(8676002)(5660300002)(41300700001)(2906002)(38070700005)(82960400001)(38100700002)(122000001)(83380400001)(2616005)(6512007)(6506007)(26005)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RElQbkxwaDlZdVU5bnR4UTFJYThRVFNrdEdHdmdoL0JoQ3lCVTliem5TUjl2?=
 =?utf-8?B?WGwycTUwbE0wQ0FaWnpCNURUbmlZRjRoOEE1OVMwODFhU05LSEJvdVJCcllx?=
 =?utf-8?B?bEwxbUxCTTVRUnZrVmJweDlINzk0MnhuNGhUVURmMDYxTGFVSkVSRERhT25N?=
 =?utf-8?B?RVVYNUs0VTFSdm0xWVRIemNic2VHWXdmbE5MVFAxL3gvVW9QVDA5alloK2cv?=
 =?utf-8?B?MW54eS9FK2FPSURER3dlcjJVVjdMR1VaNVlOL3BabnZwdnRPeGp4VzA1RXdH?=
 =?utf-8?B?V2pBVG1wRkp3Vm14bTFmc0pxVmdRWUEvYjQrY3hkNXo0OFZtZ1JiOW41bVVm?=
 =?utf-8?B?V3lGVERreGZNM1VVRy9aWkNNOEFCUTVYZmF5QzdLZXpVR1Uwby8rZURYcEJI?=
 =?utf-8?B?ekcrdFlVOHR6L2s1V2lxWGNiczZ1b1lJR2FCQmsvVXQwZnNhcW9PVi9JZWN2?=
 =?utf-8?B?WDNhRXppUVUyNWpUVkdXdURhZFM5cWxNZEIxNS9ZYmI3Njk3OG5jbE1KYkZs?=
 =?utf-8?B?S292U1hrdExOK3BHenVWUUVpMjVtTnNDQ1lFSlIrSjNvNlQrOEVwY0x5UFZF?=
 =?utf-8?B?c2JaQldEVVd4Y2JzOVlua1M0V2wwSFYwekNZV3pWRGdOUDEyM3FJZXFZbEtW?=
 =?utf-8?B?U25Dd1NSSW5FU0xuYXZzS3VDUmxQSlBVcC9DbFBiWGo4bjZUMEsyM2NNZit2?=
 =?utf-8?B?SHJBTzE1S3JmdzdTZU4yUVE5QjljY2h4VDBOVVphMnQvK2tPOTBzWnE4SkRa?=
 =?utf-8?B?eTJHSmwwRlo5eUhRNUhiRVVmdEQwd0VNREZLSWp4VDhrUTNhUlpWcW1UTjVU?=
 =?utf-8?B?WDllMXRtbzVFalJPY0FHSmhTdk9maHppYTRldDNZelA5OU1ya2wzanNoKzM5?=
 =?utf-8?B?cjlGWVkwbnZFREFLRTRtQ1dFczhZeWtOVHM0Qk9DcGNJQk1hRnJqRW5IeXY1?=
 =?utf-8?B?ZGR0OHNNaVpwQ3p2UDZSTlp2WjNPVVdxMitWTE1SVGEwTTF5TWp3ODBaTkMr?=
 =?utf-8?B?OVBoWXFJUjVPYi9wYkZ1aWZhZCtkMXpZMEhteUZXVldpNmJGTTRsZlkzdmhC?=
 =?utf-8?B?Y2U3Ri81VWN4YUFubjJZL3E5WkdlTGVkRFZidjJQaUw2V21JZTByeU9iWWM2?=
 =?utf-8?B?ZlJjN0RxbEdiU2VlWXkyUnBLUmZDVHhJLzU0Q0dyOURJbHR5em9HMU8xSGtH?=
 =?utf-8?B?Si9NaUk2V1o0bzRJUXBuM2Ziams1SUphZWorbWp4b0FmT25yQ21OcllBbzFp?=
 =?utf-8?B?L1BoOFAxejNPMnVqRlI4Q2N5N0t0eHpKLzU1RXdhMnhUNlhqbU9FWE5LOXUx?=
 =?utf-8?B?UlJXMkVVd2JmLzVWOURxRnliK2gwVEE3RmRwMTZlRjdlcC8xMVhGR2w0d0Yz?=
 =?utf-8?B?WVdZY2V3WlQxVC9uZkhyQXpQRTVsVGRIZGYxRzZEcStUdFRmR1pnVGlOL2Jo?=
 =?utf-8?B?dmRLd1N1YUFORTFHTmx3TFM3cDNxbnVNNDMxdG1nZGVJeElJeEV3Zm5GWWNr?=
 =?utf-8?B?eWFES1BpSDlpV2UxN2JBVkxRRCtjclpGVkcrZnI3VVhrenRaSVZlN0hoY0Er?=
 =?utf-8?B?c3lSUGxpZXRhVVJtc3k1UzRRKzdBbVhrRkhna1ZMc3JUTkJ5WUx5S0lycFZU?=
 =?utf-8?B?S2czeVhNOUhvYUgvNmpyc0cvVTZlbC84K3RrSjVXZjEyb1Z3ZjFBZlZpdnFp?=
 =?utf-8?B?c0xJM0E3dDhMQ0pCTkdrY1hHeE1BS0pvZmdtU2pLRUo5SHo3U0phcXU5ZEIy?=
 =?utf-8?B?Ti9jRlh5V2RlNkJ1R1ErSExrOUFMZ29DYTNMNmJtVWJtaDM1R09PdnFsT3Nq?=
 =?utf-8?B?ZER3dTF4em1VMTRrWXlyYkRqL0pUMzh4RHpxQTQwY3pMNnZESGJDYWNqSUZ6?=
 =?utf-8?B?eVQzYnl4Nk5BZTdRYW1VZEVueC8yQWw0U2NLWEcwZjE1VDU2OEZTbE5ScFc0?=
 =?utf-8?B?ckV3MVhmczFjQUJSMmxIL3NOaUlzdG5iY3JzOUhmUXJIT09aZVlmSXp0SzVP?=
 =?utf-8?B?WWZlLzRtZW93VEpHSXk2L3pid0xobEhTbEJ4dUc1ZjlydDhnMk4vV0hXcWw2?=
 =?utf-8?B?VEN5dDk4QVJoTEFrUVE1QlY3STV6RGxmS1Nvak4vWWsxcXgzY3l6MjQxTzVC?=
 =?utf-8?B?bzJXUWcybm1KVUhqdTBjTDBVekttbGN6a2pCS1hhRk1RNXp3bVNOUGdtTDE3?=
 =?utf-8?B?YVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94676B92BA805F44907C9D8C504C78A0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc5deac-ac25-4b09-5151-08db6115df41
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2023 13:57:57.0757 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w9+beux255QmSfgJnim0qhi7tPYV9uznGEsRrg9vk0Ei6/67iSue43RIL00A6M1PEyhWjR4GuATXpRb/lv6L0xEAK+jOZd/01qOW2Oy+c0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7341
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/9] Clean-up Xe FBC additions
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA1LTMwIGF0IDE1OjUyICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gVHVlLCAzMCBNYXkgMjAyMywgSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRl
bC5jb20+IHdyb3RlOg0KPiA+IFRoaXMgcGF0Y2ggc2V0IGNsZWFucyB1cCBYZSBGQkMgYWRkaXRp
b25zLiBBbGwgc3RvbGVuIG1lbW9yeQ0KPiA+IGRldGFpbHMgYXJlDQo+ID4gbW92ZWQgdG8gaTkx
NV9nZW1fc3RvbGVuIGhlYWRlciBhbmQgc291cmNlIGZpbGVzLiBBbHNvIHNvbWUgZmVuY2UNCj4g
PiBoYW5kbGluZw0KPiA+IGRldGFpbHMgYXJlIG1vdmUgYXdheSBmcm9tIEZCQyBjb2RlLiBUaGlz
IGFsbG93cyByZW1vdmluZyBhbGwNCj4gPiBpZmRlZnMgYWRkZWQNCj4gPiBpbnRvIGZiYyBjb2Rl
Lg0KPiANCj4gSSB0aGluayBhbGwgdGhlICNpZmRlZiByZW1vdmFscyBzaG91bGQgYmUgZml4dXBz
IHRvDQo+ICJkcm0vaTkxNS9kaXNwbGF5Og0KPiBSZW1haW5pbmcgY2hhbmdlcyB0byBtYWtlIHhl
IGNvbXBpbGUiLg0KDQpPaywgYnV0IGhvdyBkbyBJIHByZXNlbnQgcGF0Y2hlcyB0YWNrbGluZyB0
aG9zZSBpZmRlZnMgYXJlIHN1cHBvc2VkIHRvDQpiZSBhcHBsaWVkIGJlZm9yZSAiZHJtL2k5MTUv
ZGlzcGxheTogUmVtYWluaW5nIGNoYW5nZXMgdG8gbWFrZSB4ZQ0KY29tcGlsZSI/IE90aGVyd2lz
ZSBteSBmaXh1cCBwYXRjaCByZW1vdmluZyB0aG9zZSBpZmRlZnMgaXMgYnJlYWtpbmcNCnRoZSBi
dWlsZCB1bnRpbCBwYXRjaCB0YWtpbmcgY2FyZSBvZiB0aGF0IGlmZGVmIGlzIGluIHRoZSBicmFu
Y2guDQoNCj4gDQo+IEJhc2ljYWxseSBteSBpZGVhIGlzIHRoYXQgdGhlIGFib3ZlIGNvbW1pdCBz
aG91bGQgYmUgcmVkdWNlZCB0bw0KPiBtaW5pbWFsDQo+IG9yIG5vbi1leGlzdGVudDsgdGhlIHJl
bWFpbmluZyBvciByZXF1aXJlZCBpZmRlZnMgc2hvdWxkIGJlIGFkZGVkIHBlcg0KPiBmZWF0dXJl
IG9uIGEgY29tbWl0IGJ5IGNvbW1pdCBiYXNpcywgbm90IGluIG9uZSBiaWcgbHVtcC4NCj4gDQo+
IEJSLA0KPiBKYW5pLg0KPiANCj4gPiANCj4gPiB2MjogYWRkIG1pc3NpbmcgaW50ZWxfZ3RfdHlw
ZXMuaCBoZWFkZXINCj4gPiANCj4gPiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVs
LmNvbT4NCj4gPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4
LmludGVsLmNvbT4NCj4gPiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29t
Pg0KPiA+IA0KPiA+IEpvdW5pIEjDtmdhbmRlciAoOSk6DQo+ID4gwqAgZml4dXAhIGRybS9pOTE1
L2Rpc3BsYXk6IEltcGxlbWVudCBGQkMgc3VwcG9ydA0KPiA+IMKgIGRyaXZlcnMveGU6IEFkZCBu
ZXcgdHlwZSBmb3IgY29tcHJlc3NlZCBmYg0KPiA+IMKgIGRybS9pOTE1L2ZiYzogQWRkIGNvbW1v
biB0eXBlIGZvciBjb21wcmVzc2VkIGZiIHRvIGF2b2lkIGlmZGVmcw0KPiA+IMKgIGRybS94ZTog
QWRkIGk5MTVfZ2VtLmggY29tcGF0aWJpbGl0eSBoZWFkZXINCj4gPiDCoCBkcml2ZXJzL3hlOiBN
b3ZlIFhlIHN0b2xlbiBtZW1vcnkgaGFuZGxpbmcgYXdheSBmb3JtIGZiYyBjb2RlDQo+ID4gwqAg
ZHJtL2k5MTU6IE1vdmUgc3RvbGVuIG1lbW9yeSBoYW5kbGluZyBpbnRvIGk5MTVfZ2VtX3N0b2xl
bg0KPiA+IMKgIGRybS9pOTE1L2ZiYzogU3RvbGVuIGluaXRpYWxpemUgY2FuIGJlIGNoZWNrZWQg
aW4gcGxhbmUgY2hlY2sgZm9yDQo+ID4gaTkxNQ0KPiA+IMKgwqDCoCBhcyB3ZWxsDQo+ID4gwqAg
ZHJtL2k5MTUvZmJjOiBBZGQgZnVuY3Rpb24gdG8gZ2V0IG51bWJlciBvZiBmZW5jZXMgZm9yIGd0
DQo+ID4gwqAgQWRkIG5ldyBmZW5jZV9pZCBhbmQgZmVuY2UgY291bnQgZnVuY3Rpb25zDQo+ID4g
DQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiYy5jwqDCoMKgwqDC
oCB8IDEzNCArKysrLS0tLS0tLS0tLQ0KPiA+IC0tLS0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2dlbS9pOTE1X2dlbV9zdG9sZW4uY8KgwqDCoCB8wqAgMzcgKysrKysNCj4gPiDCoGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zdG9sZW4uaMKgwqDCoCB8wqAgMTMgKysNCj4g
PiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0X3R5cGVzLmjCoMKgwqDCoMKgIHzC
oMKgIDIgKw0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV92bWEuaMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNSArDQo+ID4gwqAuLi4vZ3B1L2RybS94ZS9jb21wYXQt
aTkxNS1oZWFkZXJzL2k5MTVfZHJ2LmggfMKgwqAgNSArDQo+ID4gwqAuLi4vZ3B1L2RybS94ZS9j
b21wYXQtaTkxNS1oZWFkZXJzL2k5MTVfZ2VtLmggfMKgwqAgOSArKw0KPiA+IMKgLi4uL3hlL2Nv
bXBhdC1pOTE1LWhlYWRlcnMvaTkxNV9nZW1fc3RvbGVuLmjCoCB8wqAgNzYgKysrKysrKysrKw0K
PiA+IMKgLi4uL2dwdS9kcm0veGUvY29tcGF0LWk5MTUtaGVhZGVycy9pOTE1X3ZtYS5oIHzCoMKg
IDIgKw0KPiA+IMKgLi4uL3hlL2NvbXBhdC1pOTE1LWhlYWRlcnMvaW50ZWxfZ3RfdHlwZXMuaMKg
wqAgfMKgIDExICsrDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX3N0b2xlbl9tZ3Iu
Y8KgwqDCoMKgwqDCoMKgIHzCoMKgIDggKysNCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV90
dG1fc3RvbGVuX21nci5owqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArDQo+ID4gwqAxMiBmaWxlcyBj
aGFuZ2VkLCAxOTQgaW5zZXJ0aW9ucygrKSwgMTA5IGRlbGV0aW9ucygtKQ0KPiA+IMKgY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS9jb21wYXQtaTkxNS0NCj4gPiBoZWFkZXJz
L2k5MTVfZ2VtLmgNCj4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUv
Y29tcGF0LWk5MTUtDQo+ID4gaGVhZGVycy9pOTE1X2dlbV9zdG9sZW4uaA0KPiA+IMKgY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS9jb21wYXQtaTkxNS0NCj4gPiBoZWFkZXJz
L2ludGVsX2d0X3R5cGVzLmgNCj4gDQoNCg==
