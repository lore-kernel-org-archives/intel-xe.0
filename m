Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54703C25B67
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 10:05:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DBFB10E971;
	Fri, 27 Oct 2023 10:05:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E932610E971
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 10:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698401142; x=1729937142;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=fVBG2/5f2JHdruVPMObVUWnxQ6SJEpCPkwE/HOu/4rw=;
 b=QVgWk6CiuLmKaHJJLlJTA2n2vgvQI8HudDDMjG0dvYn9ISu8fSIJDnCz
 Xxiax9vSYiWyAlQfjJZsBq0jDVtAfwKHfv97pzfwAzwqvU3WNBKYjaqi8
 L+Kb02u9Tm8+8Vn9RHuviZjGY5efoTgsMk3ytmry/ly2W1m1tIihDM8yZ
 A0bt4Sp7Awp9OhEGKq1B7xtFnTB2PUL3UuxaqZC8vT5LXwRuPmw+DFqOY
 heMYrc7gf4Uu1XP/AbFkzLrm0EerpMTMeeNqdyEv4zBP6F84Ax15mpSTo
 jSJrUUxOni3e3dSow5P9PuYYrw397UkoM4DVHw//mlmnqDs2kSZ8cDu7s g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="387560917"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="387560917"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 03:05:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="850202134"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="850202134"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Oct 2023 03:05:42 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 27 Oct 2023 03:05:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 27 Oct 2023 03:05:41 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 27 Oct 2023 03:05:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 27 Oct 2023 03:05:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRsLWbxwjVSTHe4Fs8ZKO/9BJevdNu6Yrj4mUTIXHGwSRjbGWkBs5NHsfzNX8HrBDFBmVYSdKOsFaVzhILepmishL3JLb1UWvd06PLI2KDobEMjYbpJviNes+xJhuLcck2BbwfyDNQstspfBq/INkgxAKupgzCgdTp2F76xvi9wwbHuub7uLpZet/+jbPua5YGtt1B8o0kgkG9KhftNvmrxDtqD+LlEBouYq+iw22iOmZsDXa4gXTC84YQV2UiLM8vWxNk1x/NcnKx/OID4snsYvDDpHLXo5MJWKIvYMoYH4KMlXmnYae7/7YGvAsnqlrSckJsgOWSAHPhWXcW5Z3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVBG2/5f2JHdruVPMObVUWnxQ6SJEpCPkwE/HOu/4rw=;
 b=AmclYscTcbj/BOJq+EwwW4kPeDVeCHdSPxBWvQcX4n3VVgCQIvPJnugLJ20K3bagDnZ644N22jzS2BeZJMlYiXoidzDYawrdWwyr/+hz9xEzETb0AK0kpnDLSM6kATAJ3IHH/0cC+fcn4LvPZQz2WWjAe4nTR97SJ4JtTqvG5DxqhSlVuL0WuVtkzb9k4dhYsqsZdz3BqBu+fbsLDyXTv2An0j9nl0pzXQ0CKq6gDmmHnqPeCVcow6+8m1zdenoTFdDnhR6yvCI7+D6bw1nxjAN/DkS97MB8IY81fRl6uk0K0ab0DdRY95Go8FTvaOpdhb8HD6nXi2RYErtYnRKiRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.22; Fri, 27 Oct 2023 10:05:39 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.6933.024; Fri, 27 Oct 2023
 10:05:39 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Thread-Topic: [04/10] FIXME drm/i915/display: Use fence->set_deadline to boost
 requests
Thread-Index: AQHaCL0jHKbV4CmnuESvk7lX+5+gZw==
Date: Fri, 27 Oct 2023 10:05:39 +0000
Message-ID: <7653efc180db9df9e81d02d3faa76e63e8ce055f.camel@intel.com>
References: <20231025102045.817068-5-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231025102045.817068-5-maarten.lankhorst@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH0PR11MB5674:EE_
x-ms-office365-filtering-correlation-id: a025df25-41ff-459d-8711-08dbd6d445ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YrhIt8SscaJOXGA9yEwxa2cpEJVlJOnaXa9vh/dL0W73aLLxaRfXdZiaYfVvD4zRrbuH9Z/dtHUH26KbX7En8NgNnutAVdIfrFXPqXjIRhLNarnBIs9rGimnwQ8GL9kSDxU0rOBzWG31/qDzSWnkzoj31AZIS7+dDdYtPtVqRlDjmGB/qetI6PeTt9mm7tIxhrM1BdF+apAA+33Een/udaQDbjqkh9gFjjc29h43z1Ab+o/0JpGjoR8WpBmhDCEAz0+FO5FWnFAzap6xIacxZMwr5TbdnpUwDiqniRIZbj2OqHJzBc0bRk3KmpZy4jewg7Nfy4WNNHi2xOpzmPmBpxt2fj+yFOY4gGVtgHqw2ssFFuHXvTemvt/nyu5fwC3ESlTZpN5sp9gbZfVCqn979bpXQjGcgvEIS/YyOSuoSyBpoEMX797EA0ucdkJlQIRqwwhMvuz/UVIFtBhB5ZgVPHe7WViLAcCSLYvAOEwGAkOl01zZjzdF1CycinG4VVeroMPfOhLJRjX4RrrsDENWL1HpQ5m8bny/bTUBvJQrB0Z9HEHRBntaL8mKu3Q8jUJz5Jd/3syCbyoV9gxfluJ9fOAF8WkOP+1tJc+Lo4i3gbI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(396003)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(41300700001)(66946007)(64756008)(316002)(66476007)(66446008)(66556008)(26005)(4001150100001)(478600001)(8936002)(8676002)(91956017)(6486002)(76116006)(110136005)(5660300002)(2906002)(6506007)(71200400001)(83380400001)(36756003)(2616005)(6512007)(66574015)(38100700002)(86362001)(122000001)(82960400001)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGlEeWkrWUthQnJCSWxrZ0E1R1hnWmc3bE93RGk4a1l6Rk9GVVFpSmVvTjF2?=
 =?utf-8?B?K3FtVVdJSCtPNGQzVWgvUXRneTVKU3gxNURHSnRSSW42NVNuVkFjQVUvSVBI?=
 =?utf-8?B?dDBBSmFvVFpGNlp3SGhraTc4Wm1zWjM3KzNLUWl3NFQvZng0Zk5TczVaREtj?=
 =?utf-8?B?WkJlcXpTbWJadThXUWd1NS9meUxxRWtGaS9YcHBCNCtJdVF6b2lNK28zQnlE?=
 =?utf-8?B?QkcrUDdvSE9aemVtd29YdmFYNGxtWDhjNTlxbVdoSERwWjUxWE56MWE0N0hD?=
 =?utf-8?B?eVdVT09aaGlHYUdNWHNaMHN6VXcxM0JPbW5EaGV6bHJwdHhaMFBJMEd2MUVy?=
 =?utf-8?B?SENmeXFBcGpaazFQQ1hwYldFQ1RBRXo1WEZBbXRaaFpXK09OWWJVZldpbnIv?=
 =?utf-8?B?YTYyVFQvUFpPRVdqL1R2OUJVaGdYZ1NTbkJvWUJEZ040Sk45RnlyQ1dVM2RY?=
 =?utf-8?B?Z3I1UWpTdGlpUzdnZlp6Mk9vdUc0TnMrdlhGRjE3NVU5R2tyWXJwVVB6Ykdy?=
 =?utf-8?B?cmV6S0ZaZ0dWdFJHRyt4Z1ArK1ZQeUlQTGZWaG9qU3FVYzFjRkQ3NnFBKzly?=
 =?utf-8?B?L2ExT2RIL1haOG1LNEh5U3JXRHVaeGpoZFNFK0wwKzFQWW9wQlVyMFAxZnZ2?=
 =?utf-8?B?R0RpdDBHa3lQR2hjMFdEbFJUUENFS1ZraUgxaWNpdmNwU21DR2NFaWRDMk9L?=
 =?utf-8?B?SkIySkJBRGpMQXFidEZ4a1FaV0xqamI5MlB3cmM3bnZPaFpjbGxTZ2ZxUEJy?=
 =?utf-8?B?endqQlc3QUd4SDRSdjV6ekJSZ2RYYjJ4cjJldVh0NlNCbFF6bmRSeGdGY0o5?=
 =?utf-8?B?bXo3KzlWRWRMaHpiTjcxa3d5bFIzaWZEWlE1U2NobXhFc0l1bWllZzhwOC9u?=
 =?utf-8?B?WnNKUXViNFJySmFTeFppVXlZTXhXK25LcFVaWDVESUpJTWhQelVUVnBpQldQ?=
 =?utf-8?B?c2Z5K1dEcnovNlNOM1J0UTZWY0k0eFRDS1pidnVHOUh5Y0VSRE14a1kxa05t?=
 =?utf-8?B?RllGOUNmb1NxOURkYTN3d0dwWHhXVFdsMjlzclNmY0VORk9MQUlZMTA5eTho?=
 =?utf-8?B?QmJ4dUxxWm9DWDRENGxGU2YzbHdldmIrMDg1ZHA4OFE1UlFhTDdtd1pleVAv?=
 =?utf-8?B?TGdKZzNlcnJTTnhXeEQrMXFUYVJTMTcwRktLLytHUFpnd2s3bk9DVDhEU2pq?=
 =?utf-8?B?OVo0czdIRVU2aEVJbmNJeDZqRjRyUngvaWUyaUFEVzExTlhOVmZoTXZaMkFX?=
 =?utf-8?B?aWJNNnA5d0g1MDQ3UHM4ckhrWFhoQUR4Nm51aWRZcHlFZUZlRTBmRTQ0bHZv?=
 =?utf-8?B?Ync1dEZpNWdqTDNJZXd6OW1pSDNwQXZ0Z2RSVGl4K0sybFlzOHZ6bmRKQjA5?=
 =?utf-8?B?VEo3eUtxaENWWGo3bmFDbUh4QzVCUTJ0ZXdGY01uYmd6QmE4cU95Q0htdUl0?=
 =?utf-8?B?WW1LMys2UlNxazdlZGJDK0FXOUtYazNlTStZajhjRkNHRXdaQTN3SmZIZkMw?=
 =?utf-8?B?eTZGcXg1OFhOZVpsZWltbEYwcmswbjg1TENtdEhlcnYvUk9BSXl0Ym12MEll?=
 =?utf-8?B?RTFIT1Q4eThwRXVyRnNWN29LcE1iYzN0aDI1K2FRM0dVSTNjTzBVcE1iL1Bv?=
 =?utf-8?B?dFlnNWdWd09veFZrM0FSSDkwRnFFZkJ3Sm1IcVB0M0ZlQWdtZnBHVkVYU3dm?=
 =?utf-8?B?UEdpMmhXM0JUZnFnVENZTzZWRFV3bjRYMm9oM204VnJ4QTErUG1ZRmFKUWVv?=
 =?utf-8?B?aEtOY3IxT3k0ZzBSa2NVN1ZDSnFHcWs2QkRIdTd1em5PWmtqRm9DL2owdm1K?=
 =?utf-8?B?bUNldmliSTFmdW1WUWZ5Ym5ndnY3QndMK1ZnMTZiMDlrV1pBSE5SODkvU0JO?=
 =?utf-8?B?YisxZG5tM0l0MXlqUmFRSlBVRnZpNnBCeVlYM0JuWXNyZmhUSHdVR2pDWnlD?=
 =?utf-8?B?NFFaSy96SFFzM0lIbWJIRWxrcW12SmR2YXRGMlh3RWdPS3dhWGJnS20rald3?=
 =?utf-8?B?N003ODN1c2l2MjQwU1NJdFRMSy8xWk5PTkJWYmd1ZVZ3QmQxRVl4cGNJbkJr?=
 =?utf-8?B?aHRzOWNxV1FqRVdFZk9CZUFqWmIxMzlveENvcFlESjdjcmpxVWJITmROV1Uz?=
 =?utf-8?B?YW5ISFJQTWZvOTBKWnAyS1lSOUVIbWlQc3dLVlo0dlBnTTIzWVRlSlE2L2l6?=
 =?utf-8?B?VUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ABB805B659EB0C4AA225341DC6B46938@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a025df25-41ff-459d-8711-08dbd6d445ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2023 10:05:39.7571 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rtBxeAtFULbOZX4Fv/o3KIGMpb/PlPo/ikLlV16cgvEKMcDead04xeWUUO9XzhndGXrQt4wXKE80SpotvI2f6mXoSWvh66AhpJH8hBG0/sY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5674
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [04/10] FIXME drm/i915/display: Use
 fence->set_deadline to boost requests
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

SGVsbG8gTWFhcnRlbiwKCldlIGhhdmUgb25nb2luZyBkaXNjdXNzaW9uIGluIGdmeCBtYWlsaW5n
IGxpc3QKKGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTI1MTYwLyku
IEkgdW5kZXJzdG9vZCB3ZQpoYXZlIG5vdyB0aGVyZSBjbGVhciBwYXRoIGZvcndhcmQuIEkgd2ls
bCBwcmVwYXJlIG9uZSBtb3JlIGFkZHJlc2luZwpyZWNlbnQgY29tbWVudHMgZnJvbSBWaWxsZS4g
VGhhdCBwYXRjaCBzZXQgd2hpY2ggd2lsbCB0YWtlIGNhcmUgb2YKdGhpcy4gQWZ0ZXIgZ2V0dGlu
ZyBpdCBtZXJnZWQgaW50byBkcm0taW50ZWwtbmV4dCBJIHdpbGwgYmFja3BvcnQgaXQgdG8KZHJt
LXhlLW5leHQgYW5kIGl0IHdpbGwgc29sdmUgdGhpcy4KCkJSLAoKSm91bmkgSMO2Z2FuZGVyCk9u
IFdlZCwgMjAyMy0xMC0yNSBhdCAxMjoyMCArMDIwMCwgTWFhcnRlbiBMYW5raG9yc3Qgd3JvdGU6
Cj4gSW5zdGVhZCBvZiB1c2luZyBhIGk5MTUgc3BlY2lmaWMgbWV0aG9kLCB1c2UgdGhlIGdlbmVy
aWMgaGVscGVyIHRvCj4gY29tYmluZSBmZW5jZXMgYW5kIHNldCB0aGUgZGVhZGxpbmUuCj4gCj4g
U2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4
LmludGVsLmNvbT4KPiAtLS0KPiDCoC4uLi9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hdG9t
aWNfcGxhbmUuYyB8IDQ3ICsrKystLS0tLS0tLS0tLS0tCj4gLS0KPiDCoGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jwqAgfMKgIDIgKwo+IMKgMiBmaWxlcyBjaGFu
Z2VkLCAxMSBpbnNlcnRpb25zKCspLCAzOCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hdG9taWNfcGxhbmUuYwo+IGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hdG9taWNfcGxhbmUuYwo+IGluZGV4IGRk
NjU0OTgxNjZmYmYuLjk4YTU5NDQ1ZTZmNDUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9hdG9taWNfcGxhbmUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWljX3BsYW5lLmMKPiBAQCAtMTAzMyw3ICsxMDMzLDYg
QEAgc3RhdGljIGludAo+IMKgaW50ZWxfcHJlcGFyZV9wbGFuZV9mYihzdHJ1Y3QgZHJtX3BsYW5l
ICpfcGxhbmUsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqX25ld19wbGFuZV9zdGF0ZSkKPiDCoHsKPiAtwqDCoMKg
wqDCoMKgwqBzdHJ1Y3QgaTkxNV9zY2hlZF9hdHRyIGF0dHIgPSB7IC5wcmlvcml0eSA9Cj4gSTkx
NV9QUklPUklUWV9ESVNQTEFZIH07Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBpbnRlbF9wbGFu
ZSAqcGxhbmUgPSB0b19pbnRlbF9wbGFuZShfcGxhbmUpOwo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1
Y3QgaW50ZWxfcGxhbmVfc3RhdGUgKm5ld19wbGFuZV9zdGF0ZSA9Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqB0b19pbnRlbF9wbGFuZV9zdGF0ZShfbmV3X3BsYW5lX3N0YXRlKTsK
PiBAQCAtMTA3Miw0OSArMTA3MSwyMCBAQCBpbnRlbF9wcmVwYXJlX3BsYW5lX2ZiKHN0cnVjdCBk
cm1fcGxhbmUKPiAqX3BsYW5lLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+
IMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqBpZiAobmV3X3BsYW5lX3N0
YXRlLT51YXBpLmZlbmNlKSB7IC8qIGV4cGxpY2l0IGZlbmNpbmcgKi8KPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgaTkxNV9nZW1fZmVuY2Vfd2FpdF9wcmlvcml0eShuZXdfcGxhbmVf
c3RhdGUtCj4gPnVhcGkuZmVuY2UsCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZh
dHRyKTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gaTkxNV9zd19mZW5j
ZV9hd2FpdF9kbWFfZmVuY2UoJnN0YXRlLQo+ID5jb21taXRfcmVhZHksCj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbmV3X3BsYW5lX3N0YXRlLQo+ID51YXBp
LmZlbmNlLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4g
aTkxNV9mZW5jZV90aW1lb3V0KGRldl9wcml2KSwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBfS0VSTkVMKTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgaWYgKHJldCA8IDApCj4gK8KgwqDCoMKgwqDCoMKgaWYgKG9iaikgewo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSBpbnRlbF9wbGFuZV9waW5fZmIobmV3X3Bs
YW5lX3N0YXRlKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCkKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0
Owo+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqBpZiAoIW9iaikKPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gLQo+IC0KPiAtwqDCoMKg
wqDCoMKgwqByZXQgPSBpbnRlbF9wbGFuZV9waW5fZmIobmV3X3BsYW5lX3N0YXRlKTsKPiArwqDC
oMKgwqDCoMKgwqAvKiBwcmVwYXJlIGFmdGVyIHBpbm5pbmcgKi8KPiArwqDCoMKgwqDCoMKgwqBy
ZXQgPSBkcm1fZ2VtX3BsYW5lX2hlbHBlcl9wcmVwYXJlX2ZiKF9wbGFuZSwKPiBfbmV3X3BsYW5l
X3N0YXRlKTsKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCkKPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcmV0dXJuIHJldDsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Z290byB1bnBpbl9mYjsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoGk5MTVfZ2VtX29iamVjdF93YWl0
X3ByaW9yaXR5KG9iaiwgMCwgJmF0dHIpOwo+IC0KPiAtwqDCoMKgwqDCoMKgwqBpZiAoIW5ld19w
bGFuZV9zdGF0ZS0+dWFwaS5mZW5jZSkgeyAvKiBpbXBsaWNpdCBmZW5jaW5nICovCj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBkbWFfcmVzdl9pdGVyIGN1cnNvcjsKPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGRtYV9mZW5jZSAqZmVuY2U7Cj4g
LQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSBpOTE1X3N3X2ZlbmNlX2F3
YWl0X3Jlc2VydmF0aW9uKCZzdGF0ZS0KPiA+Y29tbWl0X3JlYWR5LAo+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvYmotPmJhc2UucmVzdiwKPiBmYWxz
ZSwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiBp
OTE1X2ZlbmNlX3RpbWVvdXQoZGV2X3ByaXYpLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBfS0VSTkVMKTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgaWYgKHJldCA8IDApCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBnb3RvIHVucGluX2ZiOwo+IC0KPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgZG1hX3Jlc3ZfaXRlcl9iZWdpbigmY3Vyc29yLCBvYmotPmJhc2UucmVzdiwK
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgRE1BX1JFU1ZfVVNBR0VfV1JJVEUpOwo+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBkbWFfcmVzdl9mb3JfZWFjaF9mZW5jZV91bmxvY2tlZCgmY3Vyc29yLCBm
ZW5jZSkgewo+IC0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgaW50ZWxfZGlzcGxheV9ycHNfYm9vc3RfYWZ0ZXJfdmJsYW5rKG5ld19wbGFuZV8KPiBzdGF0
ZS0+aHcuY3J0YywKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBmZW5jZSk7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoH0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZG1hX3Jlc3ZfaXRlcl9lbmQo
JmN1cnNvcik7Cj4gLcKgwqDCoMKgwqDCoMKgfSBlbHNlIHsKPiArwqDCoMKgwqDCoMKgwqBpZiAo
bmV3X3BsYW5lX3N0YXRlLT51YXBpLmZlbmNlKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgaW50ZWxfZGlzcGxheV9ycHNfYm9vc3RfYWZ0ZXJfdmJsYW5rKG5ld19wbGFuZV9zdGF0
ZS0KPiA+aHcuY3J0YywKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBuZXdfcGxhbmVfc3RhdGUtCj4gPnVhcGkuZmVuY2UpOwo+IC3CoMKgwqDCoMKgwqDC
oH0KPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqAvKgo+IMKgwqDCoMKgwqDCoMKgwqAgKiBXZSBkZWNs
YXJlIHBhZ2VmbGlwcyB0byBiZSBpbnRlcmFjdGl2ZSBhbmQgc28gbWVyaXQgYQo+IHNtYWxsIGJp
YXMKPiBAQCAtMTEyNCw3ICsxMDk0LDggQEAgaW50ZWxfcHJlcGFyZV9wbGFuZV9mYihzdHJ1Y3Qg
ZHJtX3BsYW5lCj4gKl9wbGFuZSwKPiDCoMKgwqDCoMKgwqDCoMKgICogdGhhdCBhcmUgbm90IHF1
aXRlIHN0ZWFkeSBzdGF0ZSB3aXRob3V0IHJlc29ydGluZyB0bwo+IGZvcmNpbmcKPiDCoMKgwqDC
oMKgwqDCoMKgICogbWF4aW11bSBjbG9ja3MgZm9sbG93aW5nIGEgdmJsYW5rIG1pc3MgKHNlZQo+
IGRvX3Jwc19ib29zdCgpKS4KPiDCoMKgwqDCoMKgwqDCoMKgICovCj4gLcKgwqDCoMKgwqDCoMKg
aW50ZWxfZGlzcGxheV9ycHNfbWFya19pbnRlcmFjdGl2ZShkZXZfcHJpdiwgc3RhdGUsIHRydWUp
Owo+ICvCoMKgwqDCoMKgwqDCoGlmIChvYmopCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGludGVsX2Rpc3BsYXlfcnBzX21hcmtfaW50ZXJhY3RpdmUoZGV2X3ByaXYsIHN0YXRlLAo+
IHRydWUpOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+IMKgCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jCj4gYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYwo+IGluZGV4IDQ3OGI4NzY0
MTAxYTIuLjFiNjZkNWFkY2ViZWUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2Rpc3BsYXkuYwo+IEBAIC02NTk5LDYgKzY1OTksOCBAQCBzdGF0aWMgaW50IGlu
dGVsX2F0b21pY19wcmVwYXJlX2NvbW1pdChzdHJ1Y3QKPiBpbnRlbF9hdG9taWNfc3RhdGUgKnN0
YXRlKQo+IMKgwqDCoMKgwqDCoMKgwqBpZiAocmV0IDwgMCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldHVybiByZXQ7Cj4gwqAKPiArwqDCoMKgwqDCoMKgwqBkcm1fYXRvbWlj
X2hlbHBlcl9zZXRfZmVuY2VfZGVhZGxpbmUoc3RhdGUtPmJhc2UuZGV2LCAmc3RhdGUtCj4gPmJh
c2UpOwo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgZm9yX2VhY2hfbmV3X2ludGVsX2NydGNfaW5fc3Rh
dGUoc3RhdGUsIGNydGMsIGNydGNfc3RhdGUsIGkpCj4gewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgaWYgKGludGVsX2NydGNfbmVlZHNfY29sb3JfdXBkYXRlKGNydGNfc3RhdGUp
KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGludGVs
X2NvbG9yX3ByZXBhcmVfY29tbWl0KGNydGNfc3RhdGUpOwoK
