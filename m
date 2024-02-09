Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC85C4828F
	for <intel-xe@archiver.kernel.org>; Fri,  9 Feb 2024 18:36:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EB410F997;
	Fri,  9 Feb 2024 18:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dh8JBmhG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4668210F997
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Feb 2024 18:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707503780; x=1739039780;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=yQf6+02PtNGgCzHhPy9H5xUtA8MsvoRK7zaP/QpNFws=;
 b=Dh8JBmhGkS4UZsz1Ve3eA0pFWXTfvy3AY+/pSI/Li6GDtUHHZsYV2L/8
 8bF8KM41UuiXWiN8WHgJlfjL315nsZhZtzSxcsWIusXxKgG7qHw7Uvz4+
 olcdrtxrRUPexPDELIh7cGEOZg/K1+h9z5NHDRUWBsGb4EmZXvXshQUkL
 5rXA8NkrRup20WqN5F0grs4h67LoVev6baHm4pDEFpotE4IEVX3Ze08TY
 HrVu+bSxjYQLC7+MTVKKua625pxW2e4pjMdm07beZLRR/fehoXQkm0v96
 vC7TDcxvddsSgOjH2ZnKrBQEC+ugiKC+0hEBJXvPUXRTNhVVmIBeZzRYF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="4459055"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="4459055"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 10:36:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="2212663"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Feb 2024 10:36:13 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 9 Feb 2024 10:36:12 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 9 Feb 2024 10:36:12 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 9 Feb 2024 10:36:12 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 9 Feb 2024 10:36:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SchjZZ9Yjhn/a0x9pHl/fC2bDtU5/rqBmYFsc39VvtMXJW9y/OruK8ZkTn4v4yruixXAE7mqSrPbCFN5BXJZB3qgcydHrAXywQ2UIfnEE6OCIsACpIRSSTi7uafCV2xAodJnZf6wba76ZLQW4DbeDeRm7OUhKAnTiyxwvfGkEy/5sNALNtF6vi42aNywSQiDMkJff8wbwnVUPSLGjdoIpXyFuEpVE6AekT0616MCy4cqeZGH6crlWDu1892Ak61H2C5h1oOHb9ssnEgwbXjce2uJnpfACmEneZ3Bb8KuYDFl7MaKcGK3g5u/tJ4ZgTJ+WveR7BEMMz7XwGozhD1iNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQf6+02PtNGgCzHhPy9H5xUtA8MsvoRK7zaP/QpNFws=;
 b=lYxyoHKDKCfGUMR7BU6G5psL6pK7XNm2CHLp/hwNrWWApez1QhRE0cDFStFVFeO/npCPMc+sDdTcwiBKL0gh4HBVhy+IkUsiYvb68xzXH2isC1RA8NF3QDov/Sf2rN0k/ZeCtLzPM3w6PLywwHKoXPCqdGnfDzr6fjfX2SsxISK6tPrEwrsxLa5KaITRvEnRaUJpfdNeLdfbJhCrj6kB6ND/pJl9eq585IzOfV1hYUYOS39ggFxfh1pkRYJwq9wX6Of4uKNgTp3/WMJnfVfNXr26Vl9oJ+0ocuQYsafqqc4oshlW/8DpRqhiLHLmAcmPNnzNLDyrP4MQbhhH89CNXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH8PR11MB7143.namprd11.prod.outlook.com (2603:10b6:510:22d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.37; Fri, 9 Feb
 2024 18:36:09 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::89b0:d67c:ea7f:465f]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::89b0:d67c:ea7f:465f%3]) with mapi id 15.20.7249.035; Fri, 9 Feb 2024
 18:36:09 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/xe/gsc: Handle GSCCS ER interrupt
Thread-Topic: [PATCH] drm/xe/gsc: Handle GSCCS ER interrupt
Thread-Index: AQHaT9lZwlzz4nsibk+G8SE2pftPeLECbf2A
Date: Fri, 9 Feb 2024 18:36:09 +0000
Message-ID: <800bf321453080d002525f6d880b1b912ea857b5.camel@intel.com>
References: <20240125215543.3990593-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240125215543.3990593-1-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH8PR11MB7143:EE_
x-ms-office365-filtering-correlation-id: eeb1fc86-13ba-494f-5ad3-08dc299dfbff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sH/p1mB7qVRc9sVQHXpTympOMUFcJ8kB3lfvrohNTwEot6jLSVu3uXXP7UtjfgIF/e6yinf+t30JnSyAH8qM1SZpwPagUTXPy9du833GVkyjrfMkruRkd0bZb7i/WtRs9M4nM9LKgpgLDDc86fQJ3S+SqnMcYyl8CXweXVotf4d0ckJ+luNRM6aykapTpZDQMFhNUFoHAwgfLPlm219vnrN//EJqwJOeAvbCrGnnh811VtJw7LiijBZwxSAvZfxJPjwku08fQVRDbS67Dv9M/2ORkjROumWZASdoEaGNVcI+5LBeppR/mkT8VUYkRWgVZZiL+Rnrydob6PMQPsGO6NjDFlcMig04hXZb36T3PzfW9+AXysCvDkQBiPu0/DZQc/PLJftjVkUeAyg8zm21pcb55JU7HOCANj0LM0KmvgxSJMmCElCeJHBZXJb1UrXj0so+5Oz9zWu4qho8tVPTI0pk0IRCGjEZHcxk8sxe3GvO0bz/rRA6toUJGCq1/sOkW+agIcapiT0vJhwjQiGOzNmQ2tQGom/md7u+5xoNX0+Z3hcRwlgCAXfXsxUTWjLnV6qtJXfXSsCEp+PS3+n0w+tbn4TbfVkPcgyrhRpNaW0EEIXX7lhuZPMDZ55dIVT5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(39860400002)(346002)(366004)(230922051799003)(230273577357003)(451199024)(186009)(64100799003)(1800799012)(38100700002)(86362001)(41300700001)(6512007)(316002)(2616005)(6506007)(26005)(71200400001)(2906002)(6486002)(66556008)(66946007)(66476007)(66446008)(6636002)(64756008)(110136005)(478600001)(8676002)(8936002)(5660300002)(82960400001)(76116006)(83380400001)(122000001)(36756003)(38070700009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Yng1TzRPd2NYc1k1ZkRnWnhOVm1BRjBNMCtIdEZNOFFoNzJFM0gyUXBiVEx4?=
 =?utf-8?B?SDkyUHpNOEIrblFrTjdpcGRkL2M4UmN1ODJvVmc5NGJyOFBMWFVnYjF4dU45?=
 =?utf-8?B?ekhxOUE1NVNSQmpEUjUxNHRBL1doKzMvdkZiVWl3SlJjYkdMZFI1YkRhZGYx?=
 =?utf-8?B?clViYUFnUjZLTjh6Nnh6VGtYUFd0UW5ab25DcnRxQjJQSjBXTW9GY3p3UlQx?=
 =?utf-8?B?emxpWHZRV1ZyUldreE95NmlJbkpoR2k0MC9NZjBKaEt2elByVkVDenBtOVZ2?=
 =?utf-8?B?YVJRQWlVQjdYR0dvMWxLR1FHaHBLbysxNEtqajJZRFVyYVNDcVZvZTdYYUNu?=
 =?utf-8?B?WllGWVJtekZ1ZC8xd3RrQ21pRVozdDlKVTArczVxUFd0ODFtUzFqSW5zMExo?=
 =?utf-8?B?bldsSnFWNU5UdDJ1ZU5MK2JTL0tPNlFjRHQvSDRtUElvM28wQ3dCdHBRZHlD?=
 =?utf-8?B?WERBV2xyZHhyRmdkWDN6RkRpbmprOE1yNFgrSmNFaFpQbkVvQXEwZHJmS21q?=
 =?utf-8?B?bzhKMXFQeHJibXNNbFZNQytXN0plck9IV0FaaGRGVTBwaEJCdzNLVTExRTgx?=
 =?utf-8?B?UE5NN1VnNmlRSHBOWWU4WkprZU5xTllvUmh3aTR3NCtyaXVpM1JoODV5NTk3?=
 =?utf-8?B?aC81RUdER2c0YVF4a1B5N0NLWnZGRG9BSjNvaGl3cXJsV0VVR1ZNQ09Dclo2?=
 =?utf-8?B?cDNZRm5mNWo2V2F1RUhxMWZNRm5oZi9qS0dUdTBKZ2NsNkR0VmtpM2hrOTVM?=
 =?utf-8?B?dkNrSm5nM1N4c1MxMDBGVHdyaGNnbzR5bzJYWW5hK3B1SjFPNDkyclVtR05q?=
 =?utf-8?B?U0lhT0I4T1JHbUM2NHE3bnJ0elovMHJ4TXA4eTB1L3JmTFFUUlNjWEdYQ1Zi?=
 =?utf-8?B?dXRXYlo2elRsOE92YUJoYjZUUGNQVzUvMVhTSVNZQ1Y4RWEwWTV3bWl3cVAw?=
 =?utf-8?B?ejZ6UENaMXRiTnlESzBoWHFQUFZYT2JRTzNPL1paU2paWW5GSVBmSnN4UjQw?=
 =?utf-8?B?SVNrdi9POXExQ295WUxJaUYwWEJFY05WUi9xMlZQTUUvSmpKSitrck1LZDVW?=
 =?utf-8?B?U3BkUko1RDM2YThEeUJwS3NBZnExZDhyVG1YK0pqN3dsQ25zUFJvN2tidzJT?=
 =?utf-8?B?S0lyc0FSaWYwMVY1VXBWazVPQkRac1ZFang5Tzdhb3JEcU5wOE1KeVE1YnM4?=
 =?utf-8?B?L0RraEVpT0pHSE9OeTVaNzlmbFlGVXVoMk5wVHdLWDdOY0trVEZUQmRVeEJh?=
 =?utf-8?B?TENjY3ZpbkM5am9hWHk1WUtZenpXTERPNmk1UUNTOEdhdlF0TjZnQkIwdVNH?=
 =?utf-8?B?YithZkJseDZjc3IwZGRiMWMwRWxNZ2pRQStQVUtSb1BvUTJTSHoxSklYTEtm?=
 =?utf-8?B?SDRaT3plZkh5WTBCa2ZRc0NnN3pKeGVPS3YzMlJYR1c3c0tJbTVmWFhUT2to?=
 =?utf-8?B?eTdEVUtIdjczZTUveWMxVE9TVTBGTzJlcXhCd0hxOGJmem90aXJVZ1ZISnpi?=
 =?utf-8?B?SDV4STNNKzJDQnQ3OExrYlBIVXU4WHZvQXdxUVZxSllwVDRDV1ZZKzdWVzYv?=
 =?utf-8?B?cDZZcHZRLzVjZ3RGYkJNNnJWbzVkS1FoRUJhMTFxdVlHd1dhMVpxVk9MY2FZ?=
 =?utf-8?B?Z2lzQzdDMSs2L1MvWEJVT0RybjI5K2h0TldQMWxSQVlHc0ZBbk15NG9KbWZ5?=
 =?utf-8?B?clE2QkNsbmVHQnVwOGhVU2o0QUxXa2xKa3M2TWtVb3N3eHZBYW1MSDFyY2ZP?=
 =?utf-8?B?VEdyanFVZmhZeTNmOWlwb2JtclNWZHk1ZHhLS2JKYWhHbncxQnBNVTJLRG1B?=
 =?utf-8?B?N1lkWnlhZTJiNnlEeVBmd2hBRXh3dlRZRXErbzZDaUU2R2JucnowZWpPR01t?=
 =?utf-8?B?dTBYcHkxa2JCREJsbWRWRGZvVVFZQ1pnQ1BJUEJjdGZLRlluc1lPMVBubnpr?=
 =?utf-8?B?emFLUHFtOEF1TzlIbWMwTjQ1S2dGTkN0KzVpUXlTdjhwcldLb0dYQys0ZURa?=
 =?utf-8?B?MVUzSU0yMGFkcEFKL1FSVmgwM3FVNlhGd3p6YnVmc3FXYjk4SUJiMkJBRksy?=
 =?utf-8?B?ZGtnNGxZYUxxSDRBQXNLMjVSNDhqTnVjbjlaQSt4VkZ6ZXNxajd5ZTRlUVMz?=
 =?utf-8?B?cFNEVVdiN2JybTN3cnZrNVQzWDNCaGYydGN3STBmRkVkcGtzNlRveC9ydVlU?=
 =?utf-8?Q?tvlZydfyB4eIwtyTVYvDsf8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CBDD34C3A6CC284F97B568B9E7776FED@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb1fc86-13ba-494f-5ad3-08dc299dfbff
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2024 18:36:09.3655 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +5QQamh3IlHVhda/QAHjW+lYw1qUyhTFIYNnW+6zJOlnngQ6bx6/vBkrgGhVkx/Hev9rP1M594lCBIsiFdrDqbfMCHZYp8efEry9X2ax6QkUTNh2YIxb6mrL58crYsE2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7143
X-OriginatorOrg: intel.com
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

T24gVGh1LCAyMDI0LTAxLTI1IGF0IDEzOjU1IC0wODAwLCBEYW5pZWxlIENlcmFvbG8gU3B1cmlv
IHdyb3RlOg0KPiBTdGFydGluZyBvbiBYZTIsIHRoZSBHU0NDUyBlbmdpbmUgcmVzZXQgaXMgYSAy
LXN0ZXAgcHJvY2Vzcy4gV2hlbiB0aGUNCj4gZHJpdmVyIG9yIHRoZSBHdUMgaGl0IHRoZSBHRFJT
VCByZWdpc3RlciwgdGhlIENTIGlzIGltbWVkaWF0ZWx5IHJlc2V0DQphbGFuOiBtaW5vciBuaXQg
JXMvaGl0L2hpdHMNCg0KPiBhbmQgYSBzdWNjZXNzIGlzIHJlcG9ydGVkLCBidXQgdGhlIEdTQyBz
aGltIGtlZXBzIHJlc2V0dGluZyBpbiB0aGUNCmFsYW46IG1pbm9yIG5pdCAlcy9rZWVwcyByZXNl
dHRpbmcvY29udGludWVzIHRoZSByZXNldA0KPiBiYWNrZ3JvdW5kLiBXaGlsZSB0aGUgc2hpbSBy
ZXNldCBpcyBvbmdvaW5nLCB0aGUgQ1MgaXMgYWJsZSB0byBhY2NlcHQNCj4gbmV3IGNvbnRleHQg
c3VibWlzc2lvbiwgYnV0IGFueSBjb21tYW5kcyB0aGF0IHJlcXVpcmUgdGhlIHNoaW0gd2lsbA0K
PiBiZSBzdGFsbGVkIHVudGlsIHRoZSByZXNldCBpcyBjb21wbGV0ZWQuIFRoaXMgbWVhbnMgdGhh
dCB3ZSBjYW4ga2VlcA0KPiBzdWJtaXR0aW5nIHRvIHRoZSBHU0NDUyBhcyBsb25nIGFzIHdlIG1h
a2Ugc3VyZSB0aGF0IHRoZSBwcmVlbXB0aW9uDQo+IHRpbWVvdXQgaXMgYmlnIGVub3VnaCB0byBj
b3ZlciBhbnkgZGVsYXkgaW50cm9kdWNlZCBieSB0aGUgcmVzZXQNCj4gKHdoaWNoIGl0IGFscmVh
ZHkgaXMpLg0KYWxhbjogYXMgcGVyIG9mZmxpbmUgY29udmVyc2F0aW9uLCB3ZSBiZWxpZXZlIHRo
YXQgcmVzZXJ2ZWQgZW5naW5lcw0KbGlrZSBHU0MgaXNudCBlZmZlY3RlZCBieSBzeXNmcyBrbm9i
cyB0byBjaGFuZ2UgZW5naW5lIHByZWVtcHRpb24NCnRtZW91dHMuIEhvd2V2ZXIsIGluIHRoZSBl
dmVudCBhIHN5c3RlbSBpbnRlZ3JhdG9yIGRlY2lkZXMgdG8gcGxheQ0KYXJvdW5kIHdpdGggdGhl
IGRlZmF1bHQgcHJlZW1wdGlvbiB0aW1lb3V0IENPTkZJRywgdGhlbiBwZXJoYXBzIHdlDQpzaG91
bGQgYWRkIHNvbWUga2luZCBvZiBidWlsZCBvciBydW50aW1lIHdhcm5pbmcgbGlrZSB0aGlzIGlu
DQpod19lbmdpbmVfaW5pdD8gOg0KDQppZiAoaHdlLT5jbGFzcyA9PSBYRV9FTkdJTkVfQ0xBU1Nf
T1RIRVIgJiYNCiAgICBDT05GSUdfRFJNX1hFX1BSRUVNUFRfVElNRU9VVD4gW3RoYXQtc2hpbS10
aW1lb3V0XSkNCglkcm1fd2FybihibGFoLi4pDQoNCmFsYW46c25pcA0KDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9ndF9yZWdzLmgNCj4gYi9kcml2ZXJzL2dwdS9k
cm0veGUvcmVncy94ZV9ndF9yZWdzLmgNCj4gaW5kZXggY2QyNzQ4MGY2NDg2Li40YWNjOGYzZDY0
NmMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2d0X3JlZ3MuaA0K
PiAgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3NjLmMNCj4gaW5kZXggMGI5MGZkOWVmNjNhLi40
MmRkNjFhMTk3Y2IgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9nc2MuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3NjLmMNCj4gQEAgLTI1LDYgKzI1LDcgQEAN
Cj4gwqAjaW5jbHVkZSAieGVfd2EuaCINCj4gwqAjaW5jbHVkZSAiaW5zdHJ1Y3Rpb25zL3hlX2dz
Y19jb21tYW5kcy5oIg0KPiDCoCNpbmNsdWRlICJyZWdzL3hlX2dzY19yZWdzLmgiDQo+ICsjaW5j
bHVkZSAicmVncy94ZV9ndF9yZWdzLmgiDQo+IMKgDQo+IMKgc3RhdGljIHN0cnVjdCB4ZV9ndCAq
DQo+IMKgZ3NjX3RvX2d0KHN0cnVjdCB4ZV9nc2MgKmdzYykNCj4gQEAgLTI3MSw2ICsyNzIsNDQg
QEAgc3RhdGljIGludCBnc2NfdXBsb2FkX2FuZF9pbml0KHN0cnVjdCB4ZV9nc2MNCj4gKmdzYykN
Cj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOw0KPiDCoH0NCj4gwqANCj4gK3N0YXRpYyBpbnQg
Z3NjX2VyX2NvbXBsZXRlKHN0cnVjdCB4ZV9ndCAqZ3QpDQo+ICt7DQphbGFuOnNuaXANCj4gK8Kg
wqDCoMKgwqDCoMKgaWYgKGVyX3N0YXR1cyA9PSBHU0NJX1RJTUVSX1NUQVRVU19USU1FUl9FWFBJ
UkVEKSB7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKg0KPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICogWFhYOiB3ZSBzaG91bGQgdHJpZ2dlciBhbiBGTFIgaGVy
ZSwgYnV0IHdlIGRvbid0DQo+IGhhdmUgc3VwcG9ydA0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICogZm9yIHRoYXQgeWV0Lg0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICovDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9ndF9lcnIoZ3QsICJH
U0MgRVIgdGltZWQgb3V0IVxuIik7DQphbGFuOiBpbiBhIGNhc2UgbGlrZSB0aGlzLCBHU0MgaXMg
YmFzaWNhbGx5IGRlYWQgcmlnaHQ/IChpLmUuIHVudGlsIHdlDQpzdXBwb3J0IGRyaXZlci1mbHIp
LiBXb25kZXIgaWYgc2hvdWxkIG1hcmsgZncgc3RhdHVzIGFzDQpYRV9VQ19GSVJNV0FSRV9MT0FE
X0ZBSUwgd2l0aCBhIGNvbW1lbnQgImV2ZW50dWFsbHkgd2UgY2FuIHJlcGxhY2UgdGhpcw0Kd2l0
aCBhIHRyaWdnZXIgdG8gcGVyZm9ybSBkcml2ZXIgZmxyIHdoZW4gdGhhdCBiZWNvbWVzIGF2YWls
YWJsZSINCg0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FSU87DQo+
ICvCoMKgwqDCoMKgwqDCoH0NCj4gKw0KYWxhbjogZG8geW91IHRoaW5rIHdlIHNob3VsZCBhZGQg
YSBkcm1fZGJnIGhlcmUgaWYgZXJfc3RhdHVzIGlzIHNvbWUNCm90aGVyIHVuZXhwZWN0ZWQgdmFs
dWUgbGlrZSAiR1NDSV9USU1FUl9TVEFUVVNfUkVTRVRfSU5fUFJPR1JFU1MiPw0KPiArwqDCoMKg
wqDCoMKgwqByZXR1cm4gMDsNCj4gK30NCj4gKw0KPiDCoHN0YXRpYyB2b2lkIGdzY193b3JrKHN0
cnVjdCB3b3JrX3N0cnVjdCAqd29yaykNCj4gDQphbGFuOnNuaXANCg0KPiDCoGludCB4ZV9nc2Nf
aW5pdChzdHJ1Y3QgeGVfZ3NjICpnc2MpDQo+IMKgew0KPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0
IHhlX2d0ICpndCA9IGdzY190b19ndChnc2MpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2dzYy5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2dzYy5oDQo+IGluZGV4
IGM2ZmIzMmUzZmQ3OS4uZGQxNmU5YjhiODk0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3NjLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2dzYy5oDQo+IEBA
IC05LDEyICs5LDE0IEBADQo+IMKgI2luY2x1ZGUgInhlX2dzY190eXBlcy5oIg0KPiDCoA0KPiDC
oHN0cnVjdCB4ZV9ndDsNCj4gK3N0cnVjdCB4ZV9od19lbmdpbmU7DQo+IMKgDQo+IMKgaW50IHhl
X2dzY19pbml0KHN0cnVjdCB4ZV9nc2MgKmdzYyk7DQo+IMKgaW50IHhlX2dzY19pbml0X3Bvc3Rf
aHdjb25maWcoc3RydWN0IHhlX2dzYyAqZ3NjKTsNCj4gwqB2b2lkIHhlX2dzY193YWl0X2Zvcl93
b3JrZXJfY29tcGxldGlvbihzdHJ1Y3QgeGVfZ3NjICpnc2MpOw0KPiDCoHZvaWQgeGVfZ3NjX2xv
YWRfc3RhcnQoc3RydWN0IHhlX2dzYyAqZ3NjKTsNCj4gwqB2b2lkIHhlX2dzY19yZW1vdmUoc3Ry
dWN0IHhlX2dzYyAqZ3NjKTsNCj4gK3ZvaWQgeGVfZ3NjX2h3ZV9pcnFfaGFuZGxlcihzdHJ1Y3Qg
eGVfaHdfZW5naW5lICpod2UsIHUxNiBpbnRyX3ZlYyk7DQo+IMKgDQo+IMKgdm9pZCB4ZV9nc2Nf
d2FfMTQwMTUwNzY1MDMoc3RydWN0IHhlX2d0ICpndCwgYm9vbCBwcmVwKTsNCj4gwqANCmFsYW46
c25pcA0K
