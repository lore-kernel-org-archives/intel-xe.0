Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DB8C83005
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 15:29:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B982410E147;
	Fri,  9 Jun 2023 15:29:04 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBC010E144
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jun 2023 15:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686324542; x=1717860542;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=cqWA269VZCAo0pPectWhzEBpDr+RtBbavCH6Sbz6pTA=;
 b=Eabf8um3mpn0MF4IZqSyr/jS/SxkJsgm3BCn/Mb8xC/iaCH81fwaFok5
 vzSMshRldMnKI2+1rxNzOwWvYf5aYnH7Kk/hTPsYyYQ6NfD020OetRKzE
 Pdsj30/i9jfZ/7GlYoHBfz3WWS8ozvO3oBhckiAQp/vS6j+yxCSJU2KC8
 Fngord3+BPoO69Aih1BsOZXpOWBcwVCEShQJnTmFv20QVstNvZrk/I2Bc
 3ydfk5o+cFOidTbN1u2jvFVANR9ybGDabYiPY+ZFBUTydSEa0sgMjsAxf
 Wlbu8aBa9AqH7ftDQtj8gS1BJchRmymkiKl/WyrmffP8amsBpwFz5Jn6i A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="360105230"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="360105230"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 08:29:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="823108154"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="823108154"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2023 08:29:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 08:29:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 08:28:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 9 Jun 2023 08:28:59 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 9 Jun 2023 08:28:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YdIFuktEhlNh/3kqt76Xst+uRF7lxfy1XxjQcQPstUwC/5qxfXK0JGCXQvtcCqTUUhKtI1oVnhaJpIXFtscE2b7JsflX3C+15ajfHpxaInKmbGLDYPonuxaY1eJVBYKR/ps362KEQh0nuhNTe/D5vPQ1tVhgFZJTLQeZNcFkioICmmkR4P8yanotmfUN2kqck7BVUzGYnBACU2nyTTvYsLPusYJ9vi6ueC9soecvpiHsOjtpMxB0tcn9xbNPa7QP/w2I5lfheVPkLBKH51lsBRAgu6A7Wvz8gS2XGk7zFkus2uDEJPSkAXBBo9GeKm5JOoV+SxNpXbDCgiDjrafVRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqWA269VZCAo0pPectWhzEBpDr+RtBbavCH6Sbz6pTA=;
 b=lCty8tP/92TCq+EEX6d9WU3nwJGMXtaQmlIxN6YeNvWWflyo7YsHb7X62pe2/R8uuWhS07FEn4ia8RpRCzZFjmM+tZtjhV9UJ0nMoyocu2djzNo8gCpJFVRKdVh1gwLirXXi5/3xaml8ENmZeP2b7BR24andg3H3P0XOBWHxSyD/wziZMkqyjW8SjKCEcMeBNqBYmvBIkj/SXZZk6yFse9Ss25Kp2fhR1hOD+6AmQFPW7KhP+69XJYxpNrUeSgJcgnmcwXWq31fBOBHrNVEKxCySTOtUFeE8QdkcS2GKC2fFxsVWEumCwJiH7ANWbZWcVSEzmjZ2dBzdzNqzWXHw9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DM4PR11MB5344.namprd11.prod.outlook.com (2603:10b6:5:393::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 15:28:58 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0%7]) with mapi id 15.20.6455.034; Fri, 9 Jun 2023
 15:28:57 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 0/2] Implement missing invalidations and
 flushes
Thread-Index: AQHZmrCqgzQK6wZWP0W5M6cyEGbEga+CmM6A
Date: Fri, 9 Jun 2023 15:28:57 +0000
Message-ID: <fdd75c136267ac88d8bc374ca35ee63680f0428e.camel@intel.com>
References: <20230609085840.114729-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230609085840.114729-1-thomas.hellstrom@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DM4PR11MB5344:EE_
x-ms-office365-filtering-correlation-id: 9dc10959-566e-4c4e-3e19-08db68fe3e1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mzJsGFV65Wgm+M0V6y/9k8GWej9unWNdC7dBQ0y8gHRVrtUBewbBE7CwTDWhkGguPS22K6/y88zYTJi+zTgOYH4b6mNnAjkAQC993FllNfIwZojlKcAO+3GTzk+lk8f51hVMx3USi/+MZm1hMqoMY2/5IhyO9xiJzVf2JeNeLamQM8g0T4DNAOt0Pzb1mnU16Qn8LItQdl3KcjN4dUBo2hoz8vSOMd6dOrZz7oSiUmmAedHCIX9MtVu8ajiiFH4nBBC4aGM+2NICZfbLHX7uDvzmEqyufVd+fFmILsSy74jw0kCGY5p4NBSJG55ne8munzrue6jiKhdiJAB/CAuYYqWzdHlZ/SSxO+7QpoDYvSkJy/EIz5amFbdFAvfAlnSNYJ4tyODRqu2C627ltQtiUueMHHRjFkIwpkHUJe4YHYAASfyMDXS08/Jmw/r68EVJVPEcIfjNavMit6XmpziuSVtKTk7lIhFnqW/c5L2cDjQWHMNmoYGCUZucES+bD/MCQJTY0H944vSG62cMV+wFD00VYDPeqe8cLG4B6hzdUkEBcRa+Lv0eYEjZaZhFa5uvq8x1ijF/Q37ov+4S94v39fqv5ielVRS6xzdBZTJA/myeqy371F5AeqUI0htCaJ82
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(376002)(136003)(396003)(366004)(451199021)(41300700001)(71200400001)(8936002)(8676002)(5660300002)(64756008)(66476007)(76116006)(316002)(91956017)(66556008)(66946007)(110136005)(66446008)(36756003)(478600001)(2906002)(38100700002)(83380400001)(6486002)(66574015)(6506007)(6512007)(26005)(186003)(38070700005)(2616005)(122000001)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NURLc0tiL21MWGF6eUdLVDJaTUpOQkpDWTBMOGNuQ0FFYmFUUEYvME5NcS92?=
 =?utf-8?B?VWFObFdnNXVIVzVaaVk1cEdPYUpnN2hJR0d1bCtsRG8yb3RLblNmV216eXhD?=
 =?utf-8?B?eGk0N2IyRVNiNGNqN0dUdzFvbkZndXNWNGlWZTl3K1NnVExRUTBBbWVrREFr?=
 =?utf-8?B?OUJkZW12RFU1d2tDK3Q2d0dZRk53ZXpDeHJwS2FTTHYzWWNUYVU5NENvMitS?=
 =?utf-8?B?ZlRudjF1c2F0eG9kMmJLcGlMVUkwM1JjVFRIbWNtZCt4WFZBWndzcVhFREln?=
 =?utf-8?B?aDZzNy9zR0FNaEVxVWJqclczL0JtWXBjbVdkRjFqNVk0RlB0SFlkanZkWGRN?=
 =?utf-8?B?NVdKWFhDai9QMHlxWnl5a2EvSllRQ0kxSUg4endiU25XTkR1S04rT01wNWd3?=
 =?utf-8?B?RjViZlliL1FOY0pWYzlqSDg2SllwRjBsY0U1WU9ETjVvU0FEdnBxV21KdmNw?=
 =?utf-8?B?M3NZc2xiYVlFNUxTWXBsUHVqNXhuV3V2VHZjVldrMlI2aG91SXI5MDFoS0ln?=
 =?utf-8?B?YU51dDVZeHZZN1ltMFpuN05MVDhOOU9aN29FVHloQWNUbVc2UzJxektVT2pG?=
 =?utf-8?B?U05NSTR4V3lpbTVzYXk1R25OaG1ZL2JKQ2c5YkQxL0o0U0xsN3UrZ3VINlJi?=
 =?utf-8?B?bWQ1QWtvZUpkN3J6bWNnQWt0QlpBWHM0Y3NiZlp4NlpjRVUxUFFUczVWbkF5?=
 =?utf-8?B?SCsrcll5NjVFbVkxdkRKOFplMXlkZXJZdFhuSUljN0VTRkRVZWF0YXR6VEZB?=
 =?utf-8?B?Q2greDU2azE2WE9jTzR5M2tlejNrZXlBcmM5YUpaZEpLdE96TERKQzQxc1RW?=
 =?utf-8?B?L1JSZjRWVHpHMWg5RzdZUm9hUFIvam1namV2dU14NUlXWjc4MlZxWGVBOHdT?=
 =?utf-8?B?WkZOSks1NkxhVjZ3UlpQcFN4QmduUUlHUmtZKzJ3QWNid0RJUGc2SlUrNUl5?=
 =?utf-8?B?ZHcwM25wR1h2emdHS2pHL2lpT25BNXBvdjk1RFcvaEdhbHR1NTF1RCthOXZs?=
 =?utf-8?B?Z2UzbkIxbCtRcU5wODJPWHZYTUZHYUtJYWxwRStaM3BZYytMc0luZVhXUjV5?=
 =?utf-8?B?NHdreHVYTmI2ZmhDQVl4di9EYXgwbzFTY0RUS2JXb2ZuNVZOTkF3bmlJMFRV?=
 =?utf-8?B?MGQ5WC9BNlVTZ3RWb2U0aWVQbUpnSE4vdmwxL29CTXd5OFNpVWNIbXdrZmVW?=
 =?utf-8?B?U0c4bHNIbzA4OXMyVWFMY0FjODNsQzN0bkh6L2svZzNqS056b29aTkF3dVV2?=
 =?utf-8?B?ZW1mNTliS1FjQWJ5SEYwbm13YTNSOTNlUndsRml0K3dMSGg0b3BjMEZDMU03?=
 =?utf-8?B?WGllTjRBaUVmcG9lQUtSckMzckpnOGNHZXF4dHZDWlJVaFUvWmNzY3NJMG54?=
 =?utf-8?B?a3pub002NUE5aHVuYm1jVGMyRVJ1ZnB3RWtGYWszVmhGQ1JlSTFIM3lVTVdI?=
 =?utf-8?B?dnlSUXd6U1g3M1p5U1Y5L0FWV0Q1cVI0VWV1cGZVZ1hqSzdhb3BZK3k4KzdI?=
 =?utf-8?B?YVoxWmZqV0lhakxxTkkvY2FPL2tCcGFIRXJEa3c1TC9pVzF4emZZSjExZytj?=
 =?utf-8?B?Mk45WVJUL3BKVGMvVzE0Witaa2p1OGVGbE8yMThPSUlDcU1XZVVyZzFlbG9j?=
 =?utf-8?B?VUJiNTZMUlFteGtVS2toN0ZDMG9uVU5RVmhoUXlqaWxIZW5zKzJ3NzIxQmhO?=
 =?utf-8?B?Z0FaNjRhQys3RmtLTlZ1blRhdk1TQ2dXaXdHTHpFRW5tNzdSTE1rN0JzVkFl?=
 =?utf-8?B?SDV0Z2V2aVR1dUZjb1Bod1R4UGRaTUdTTm5VekVGRnA1RnlNZzlkK2JVWjZh?=
 =?utf-8?B?Vy9GR0VFSVJQOGkxMmdadTd3THo4ZDl1dTFPb3VzSHdPSVZDa05JMkY2RXl0?=
 =?utf-8?B?OFhFczNZMDRoRTBlUjVmRHZzOFNYWFVKVzRhOUNsNmFsVTlIR2JkdTV3S21a?=
 =?utf-8?B?ZXJLNzJDYndwMjJnd3g0Q2p5TVJpTVoyMXBUUTZqRzVURmdJVXlxckJEU2Nw?=
 =?utf-8?B?empXYWRVakFiTVZRZEw3bUtsbFlzNzdDMGY2UklwdnB6OUVObnJaT3lJTWhS?=
 =?utf-8?B?dVBPVUJlZXg1Wi9IeE51WGxzZWhqRStKaS9aVjBlWDJ3RUliaUIwd3ZpR3Ji?=
 =?utf-8?Q?Q9Uw8kpIuxlceEtejDjwVhNv4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F0C541A1D28BC45845059FF16A9CED1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc10959-566e-4c4e-3e19-08db68fe3e1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2023 15:28:57.5589 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wE0virH3Bmi1irlgmv3WTAnlCWiT+V0LPzVdGE1Z1gYK7Kw+yH1lhBDkNU1gx7HK36m5a8hR/ZL2EA+n8B+Tbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5344
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/2] Implement missing invalidations and
 flushes
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

T24gRnJpLCAyMDIzLTA2LTA5IGF0IDEwOjU4ICswMjAwLCBUaG9tYXMgSGVsbHN0csO2bSB3cm90
ZToNCj4gTWVzYSBpcyBzZWVpbmcgdW5leHBlY3RlZCBjb250ZW50IGluIHNvbWUgdGVzdHMuDQo+
IEZpeGluZyB0aG9zZSByZXF1aXJlIGEgVExCIGludmFsaWRhdGlvbiBhdCBiYXRjaCBzdGFydCBh
bmQgYQ0KPiByZW5kZXIgY2FjaGUgZmx1c2ggYXQgYmF0Y2ggZW5kLg0KPiANCj4gS01EIGFsc28g
cmVxdWlyZXMgdGhlIGxhdHRlciB0byBtYWtlIHN1cmUgYW55IEdQVSBzaWRlIGNhY2hlcyBhcmUN
Cj4gZmx1c2hlZCBiZWZvcmUgaGFuZGluZyBtZW1vcnkgb3ZlciBmb3IgcmV1c2UuIFRoaXMgaXMg
aW1wbGVtZW50ZWQNCj4gaW4gcGF0Y2ggMi4NCj4gDQo+IFRoZSBmb3JtZXIgaXMgbGlrZWx5IGR1
ZSB0byBzY3JhdGNoIFBURXMgcmVtYWluaW5nIGluIHRoZSBUTEIgYWZ0ZXIgYQ0KPiBwcmVmZXRj
aCBvciBzaW1pbGFyLiBXZSBjb3VsZCBkaXNjdXNzIHdoZXRoZXIgdXNlci1zcGFjZSBzaG91bGQg
YmUNCj4gcmVzcG9uc2libGUgZm9yIGEgVExCIGludmFsaWRhdGlvbiBhZnRlciBhIFZNX0JJTkQg
b3BlcmF0aW9uLCBidXQNCj4gcGF0Y2ggMSBpbXBsZW1lbnRzIGEgVExCIGZsdXNoIGF0IGJhdGNo
IHN0YXJ0IGZvciBub24tTFIgdm1zIHdpdGggc2NyYXRjaA0KPiBwYWdlcy4gRm9yIExSIHZtcyB3
aXRoIHNjcmF0Y2ggcGFnZXMgdGhlIFRMQiBmbHVzaCBpcyBpbmNvcG9yYXRlZA0KPiBpbiB0aGUg
YmluZCBmZW5jZS4NCj4gDQo+IFRoZSBUTEIgaW52YWxpZGF0aW9uIGNhbiBiZSBvcHRpbWl6ZWQg
LyBjb2FsZXNjZWQgbGF0ZXIuDQo+IA0KPiANCj4gVGhvbWFzIEhlbGxzdHLDtm0gKDIpOg0KPiAg
IGRybS94ZTogSW52YWxpZGF0ZSBUTEIgYWxzbyBvbiBiaW5kIGlmIGluIHNjcmF0Y2ggcGFnZSBt
b2RlDQo+ICAgZHJtL3hlOiBFbWl0IGEgcmVuZGVyIGNhY2hlIGZsdXNoIGFmdGVyIGVhY2ggcmNz
L2NjcyBiYXRjaA0KDQpuZXcgdmVyc2lvbiB0ZXN0ZWQuDQoNClRlc3RlZC1ieTogSm9zw6kgUm9i
ZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQoNCj4gDQo+ICBkcml2ZXJzL2dw
dS9kcm0veGUvTWFrZWZpbGUgICAgICAgICAgICAgICB8ICAyICstDQo+ICBkcml2ZXJzL2dwdS9k
cm0veGUvcmVncy94ZV9ncHVfY29tbWFuZHMuaCB8ICA0ICsrDQo+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfcHQuYyAgICAgICAgICAgICAgICB8IDE3ICsrKystDQo+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfcmluZ19vcHMuYyAgICAgICAgICB8IDgyICsrKysrKysrKysrKysrKysrKysrLS0tDQo+
ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyAgICAgICAgICAgICAgICB8ICAyICsNCj4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV92bV90eXBlcy5oICAgICAgICAgIHwgIDMgKw0KPiAgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3dhX29vYi5ydWxlcyAgICAgICAgfCAgMSArDQo+ICA3IGZpbGVzIGNo
YW5nZWQsIDk3IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQ0KPiANCg0K
