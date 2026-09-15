Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F579C88E53
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 12:56:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F81B10F493;
	Tue, 15 Sep 2026 12:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RNbsz+Mm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D603C10F493;
 Tue, 15 Sep 2026 12:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789476967; x=1821012967;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=REkxrjaHe2OMmDtY9m4YaOZM+jixuIaco1j52kXgHys=;
 b=RNbsz+MmjE9TjzIQ0dAguSdBhEewEu+FMoS8y9BAmLeofA/vpg8uM1+h
 CqeOEj/BRQkIhkwGDk+W/Y/VDRKihuuXkF/4a9dDfUy0eHqyrRLBtX5ma
 EfqOoEoCMbONW/PN2foNhk2TMKJmUMW3xT6Vfoe0GcjSPNJCeRxK0Q9Ga
 Lfyb/kLX6+iEL48hbutNRj8Q6hrTRsR88Ws0zAtl0sfbaQ62ieF5BCMz/
 slRU4M0AyP3d0TZ6OHFWrqQEMujfQO9C7X2tXwGfLJCPjoNZRNOZG4dIn
 QAEFTEHLWPQYKSD0Nnsidf5ZH016DyT4qYnRf97C6FRNeuA4WdX2CdH/U A==;
X-CSE-ConnectionGUID: nqmcGk1CQ1O66pgneMU1tQ==
X-CSE-MsgGUID: yCv7ZizBQFquRhveqWmKog==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="346780"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="346780"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 05:56:06 -0700
X-CSE-ConnectionGUID: NoFzX+9XRvSWgBVXggCiZg==
X-CSE-MsgGUID: jOvo29rGTMWBKmSQD8H1QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1230611"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 05:56:07 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 05:56:06 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 05:56:06 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.69) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 05:56:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPlkCrEHNauDgpLLh8iIStRLhXBrh4lKpci+SRYrrgPe9mDRN8sk69KjwKcupPEiTMAIy3wlMZ1B7VXqX/zNFiuy11RJLZZ4f088UjQrdr40rzlplmrVU36qC8lL+6jOLAvooo0HrOuj+2EUg8t5aCPIrZ3fk+vhO7zqVuqowpouFZzf4XFvqHkEH8xtkmdfpOwwTOfyb/xQNp8c6DrAQWvmcXdo2h+ijdni29UGC5rxxmlPCwCcTZY+PrGPmgH8lyjcMjThzWIPoUhSnhqh9wCFQ3hYZAvCOPLqn1vPo4pGvVFAzMyOpekkiX0AQtme8B4GtUYOoTlvK53OxCGRCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REkxrjaHe2OMmDtY9m4YaOZM+jixuIaco1j52kXgHys=;
 b=nIXOkVOONSGUWSN+yj2L8TkOz87uH5zcP6rLzxxBXDia9/lmJrYaYLOAZAslnV5FHuGgv+QtofYPZSqiCxzPA+9NEDaw0Wg0AjAKBYsJv5YPcHceWYbvjSuY4/NmhAX/B90J/qaEydUxkrpcqDUFNttTStpYW8CuTRu0Yy3H5QY2QHPyiSU9Rsc3BErEzxtnujCf4AhfvuYYIgfsnf1c7aXU3g+HosFr9ZF9bC4Ghv39hkYl2nOOzwwuuk+BT5gBTo9ySLTfeiIVrGYISab7uy7ypzpm/ZubB5394BRhTmKyWaq9FV6M5Xm3/37H/fvGQN+YfndE2bqhoC+Z0irL7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 12:55:56 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 12:55:56 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Subject: Re: [PATCH v8 5/5] drm/i915/hotplug: avoid HPD polling if the device
 is PME capable
Thread-Topic: [PATCH v8 5/5] drm/i915/hotplug: avoid HPD polling if the device
 is PME capable
Thread-Index: AQHdRPRCj/mdAllHA063I/6ptJ/ODLbPmS0A
Date: Tue, 15 Sep 2026 12:55:55 +0000
Message-ID: <def231e772cbe95b67aafe6b52ab8ac9787f25f3.camel@intel.com>
References: <20260915092518.639448-1-vinod.govindapillai@intel.com>
 <20260915092518.639448-6-vinod.govindapillai@intel.com>
In-Reply-To: <20260915092518.639448-6-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CH3PR11MB8701:EE_
x-ms-office365-filtering-correlation-id: db84379b-8bd9-4518-186b-08df1328aeac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|38070700021|4143699003|5023799004|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: LdhIdb/24OC2m44m5acg8Z9ME4w0XYT/96pECHBjGUtLpKg4QrPzalscWhh9DHtf+KhAa0JlREKn2pztMfdh9OfjD1TuaR7GwvLdVi9EqFuY4fCOyrvkV6JKyGeR520mCwnlgu8ValBxu9NJah3/DnVx0eYxdwQwGa0g1Wh+h3WH+ui+yWH6l+eZHhWjtd5KvSWPRuwkCo31WDLxMI9xVDAhIB7ExIt1fY01VsK6OWZhS0tWsD4TxqH+sryAyk06/yHMOStbAgJOLIOU+LfQ+fZpTAEblC3we5Hkukq4iEA8QRlA87GNVJFgMOMfXHp9xDcQwshTi+9yfDksdzwxCiS1/fi41whRFTdxRVjhQOfBUDh1152GZJobUi6B/calTVK3qVBGE4t2WzWE6RGKP6qfDszpp9kP1RbpCXjnQUVshRpEzDIfk7PZlPNmDdkfWn65tBlrAo+ocXgR0j/H4f/pmxqg4NaYX0H1AK1cS5fTrdPqICT4PxNoed3Q+ZzJGpCRPgIcdc5PzcWJ7dHJSDX2XeXnLLUgWGSKFz3TPx0a+eZfVXpijk+IpC3WT8xaC8Jdzc6XaNjxoCgwypZISmBzcgxV+Pgfi+0KhStbTImARYW2y8MFJnutCq+iJRsK6cKvr5FBK+tsqoypOae5JKOHTndNZxK+hs6UU971OZAhnqgXiZnO0iTdo/ZygV/CMGXIYnruPpgGvz9NI6YGAGmZz9C4HV6qZwW3jPz7QGI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(38070700021)(4143699003)(5023799004)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXNpREJpRDZSOVlBODFPL0FPME5QM1dmOWJKWVRLLzRiamQ4eXVIcDFseWd6?=
 =?utf-8?B?VFlkaGJjcHpZNjNpQnYzSEhWRTBYK2JHS08xU2ZaOWcreXRiRFZaZEZTOWpt?=
 =?utf-8?B?OW45ZXNaQTFWa3BzSHFFbm9xbmM3Zng5WlBMRE1wNkFZTC80VERVQ1lhS2hX?=
 =?utf-8?B?RGtoTVdMRU44WE1ZNDI2RmtHbHRXYTM1bm9CQ3NLRHFUNndVUXZWelV2RUZq?=
 =?utf-8?B?bnNIVHR6Uk8wa3VpQWFrSjVpd1B0WFpFWjRvUEczRkhySDNHc1FmNGoxNlNw?=
 =?utf-8?B?R004aE1vNUVTM3FKaEdQUjhQazAvMHhlemJ5eDJMZmFsWHM5T3RvQnl0ZWJt?=
 =?utf-8?B?c202ejZ1ekd0UkVBcFdkaGtqQ2hLaytOMURkdGpFWXdRbTI4REh1TzNENDF3?=
 =?utf-8?B?dHJVejJudktrTXF5all6cnRUNzl5VnRscVZrTkwwbHY0YUQ4LzVoVkx0R3hE?=
 =?utf-8?B?RFpxRy9FL3FLSXNtQzFJaVBQR0o0aHlFSGJuNFFERUFFUk1aR2RwYTN1RmdN?=
 =?utf-8?B?SU94b1NNOUJsWlUyM3pkalBwOXhpMy9Eb0F5d0tmTzhhRWl5NExXMTVjY2NL?=
 =?utf-8?B?V0dYa1FSWkljTHBYdFRZMkR5T1k4REJtVDgzbXNmSHlFYlFpWG1XT3NuWE04?=
 =?utf-8?B?UnJVZk9MTUx1QlF5bHFPeVh3c3hwTnNxcjdOMWV6SnJnWmxlemlTSkNFM0xm?=
 =?utf-8?B?Mk8vMC9mU3lRM1piS0c0RElSK3NuYlJ4YWRnbCtZaS9aRFY3M2ZoTjJGbUk4?=
 =?utf-8?B?ODJiL3JuQTBWRHRyNlRrZnB6RVYzT0RLc0l3ZnpqOEFIRm5tMTFrSHRmWXh0?=
 =?utf-8?B?dVk0THlVS0E5ZXZaMjF5WTgxemhZcUZ0MHVCSUhRTXpSUlNQWXdKSHJkWTZ1?=
 =?utf-8?B?Z3gvTS9rZjZkSVlEMnZNeExjYzcrdlpWeGY3SVFnc2Rtd2M5YkhDcFEybnZa?=
 =?utf-8?B?UDFJbGlVbEpETm9sMENKNlEvOWpjalliTkFvV0N6VnY5NjZxaUlPWVdhRHlQ?=
 =?utf-8?B?ZCsyVWxDSDAzb0hqUkxmQlg1UVNUM0hwZDErQ3BQakdOZTRxZHNaRS8wK09u?=
 =?utf-8?B?Qmg5VmNMRmIyS0Y5OXRSeWlwUkI3dUdHa2NQQ2xiS2J1WS82WW9pcGhta0th?=
 =?utf-8?B?QjFGUUVZNzU3K25FZzZZcVdMVVZiMEVaUUF6YnY1MHJydjZXeWpzajBTa1Bh?=
 =?utf-8?B?QlFjbkNDdWJIZkk0Rm1lSjUzOHAvbmIwR05sTExNWEpKbzN2T3dVVk1HSTRV?=
 =?utf-8?B?cGtRd2cxV00reUYzNGRBR0dPbml5UjdIa0RkOGJyOEVvWjUvNFVWREQ4SUxP?=
 =?utf-8?B?ZExXZGpJekFaNm9yMk9RUElUbGxuWTVqcXcvUWFscEdFZlh5UzUybkcvTTky?=
 =?utf-8?B?LytmWmtUSVBVc1BJQUx4aldkcDJVMjdNNDFhVXNOVFJCVUVFMU5uQmpTeW8w?=
 =?utf-8?B?NUJ1RGtHbHRYcnkvazJkdG50YXpYS2ZrektTbmhHbFF6VGRpN2dJUi81aytB?=
 =?utf-8?B?aVNBbUIreFVLM3hnUjRIeG5iOFhNblpaSlZDT1kvOTA2YzVtWWZBSXE2WDRM?=
 =?utf-8?B?YUhvU0duY2wrMHJZKzVMenZsMy9WaDF2dkhvMnJuOEl4dGI5dkdwRGU4NDhj?=
 =?utf-8?B?a1d1akdxWDFHbzNuSm92a2h1NEpiRUhpRnYxam1nNXZmN25lbGkyV3psQ3BB?=
 =?utf-8?B?WnNrRXc1bWRxTVFqZ2pIZXVhb2xNSmpWQ2QvQ0lsUm52ZjV0aW5CTVpPd2RV?=
 =?utf-8?B?OFVZTm43ZWRuREFqekxkZEl3bHRDZ1NWd21IbFNURzh0R0hTMzZ6OFZFT0wz?=
 =?utf-8?B?UFovdDZzOEEremxRcklBOHpEUGI0TnE4TUhLUncycjZlSUlBNGViK1phdnlB?=
 =?utf-8?B?dXJMTWU2L3B3STlJRndoZ1RRNFJidVE2TWJEckNZL1dPclNGZVNOeTVGZUMz?=
 =?utf-8?B?WnpPTHlCTDRxeFR1NW4yUVJQMG5DOUUwZVhKQmRaZkt6dUViZ3BkcGRQbU5V?=
 =?utf-8?B?VnRwWWhKTmxoTEUrVWVJWlNHcTNoMXlJNC80QWFoWHl4cVRZUkxiM0RoTytj?=
 =?utf-8?B?aURYQXRsaUVnd2tScFYxQTVGSXcralgyS2xxbFRCM0VGRG5hVUtjajJPeFNR?=
 =?utf-8?B?bDdxY0paZGVxU0dSY0FLNUR3NWJlLzI0SlFacjV3RlN3eHJ1UDZzQzlTdUxU?=
 =?utf-8?B?UUxyUzhTWlBUcTgvT0w1bHlmYWt0Q21aMXNta2NzUjRhanN4ajJkNm9rdDFm?=
 =?utf-8?B?b0JrNHVybjRDRi93ZmNhV3ZLbC9UMkJYbmhHOVMzclZPbndxK0FUZ21RV2NE?=
 =?utf-8?B?Zmh5Q1ZYcENGYWR5eHdnYmc1LytKTE9EU3NqYUJLVGdmUWxwTzJLRG5tdm8y?=
 =?utf-8?Q?0vHCe4mK1D8o0Aao=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1CD6A2BD0A507E44AB923E5ED6C15A5A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: aH/Zg/iwRXl9nvJDWD3CpcC6v9LN3LJGGem0jjG9iSzRlAr0+ds2TuzkO0HbqwHpItVIrjd11qSgDeCH7ZG8AGBebU8GgZJhGl0NhC2II/tvfBzzUsezNsoP390rbNMG2bCc0JaY7ZY1VjIgdire9AnSBw51qTsUxn6w30U5LYeoBJbMiUc+mb01pcvlNjGVcmFYW7pTx9c0PrZx35ADHxUNvIro+ob6aS26h6AmYi6VfN4A8fMkdszZIVObWhZzMJWNfRU1wxMQk7Qk8CqOTZTz9QsvTpMheJK3XjaVZveHuZuugoCOFssVmEnbf/saBRcTntZW+72x0BnWDTL/BA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db84379b-8bd9-4518-186b-08df1328aeac
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 12:55:55.9973 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Q3LIrzKMrELNBn880YfdE1nEFlUt2TIq+sSGA7Ll6fXZDfnfiVi8hGCY+mv3pfmNLyggF/LI2KwCfsCREJoG9mJZ/D/DDRZ5pFq8NFLPu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8701
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

T24gVHVlLCAyMDI2LTA5LTE1IGF0IDEyOjI1ICswMzAwLCBWaW5vZCBHb3ZpbmRhcGlsbGFpIHdy
b3RlOg0KPiBJbiBzdXBwb3J0ZWQgZGV2aWNlcywgSFBEcyBjYW4gZ2VuZXJhdGUgUE1FIGFuZCB3
aGljaCBpbiB0dXJuDQo+IGNhbiBpbnZva2UgcnVudGltZSByZXN1bWUgY2FsbHMgZm9yIHhlLiBO
byBuZWVkIHRvIGtlZXAgdGhlDQo+IEhQRCBwb2xsaW5nIGluIHN1Y2ggUE1FIGNhcGFibGUgZGV2
aWNlcy4NCj4gDQo+IHYyOiB1c2UgaW50ZWxfZGlzcGxheV9ycG1fcG1lX2VuYWJsZWQoKSBkaXJl
Y3RseSAoSmFuaU4pDQo+IA0KPiBCc3BlYzogNTI5NzksIDUyOTgwLCA2ODg1NywgNjg4NjcsIDY4
OTcwDQo+IEFzc2lzdGVkLWJ5OiBHaXRIdWJfQ29waWxvdDpjbGF1ZGUtb3B1cy01DQo+IFNpZ25l
ZC1vZmYtYnk6IFZpbm9kIEdvdmluZGFwaWxsYWkgPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50ZWwu
Y29tPg0KDQpSZXZpZXdlZC1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRl
bC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaG90
cGx1Zy5jIHwgNSArKysrKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hvdHBs
dWcuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaG90cGx1Zy5jDQo+
IGluZGV4IDk3MGFhOTVlZTM0NC4uZDA5NWViMTNkYzA2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hvdHBsdWcuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hvdHBsdWcuYw0KPiBAQCAtODY3LDYgKzg2NywxMSBA
QCB2b2lkIGludGVsX2hwZF9wb2xsX2VuYWJsZShzdHJ1Y3QgaW50ZWxfZGlzcGxheQ0KPiAqZGlz
cGxheSkNCj4gwqAJaWYgKCFIQVNfRElTUExBWShkaXNwbGF5KSB8fA0KPiAhaW50ZWxfZGlzcGxh
eV9kZXZpY2VfZW5hYmxlZChkaXNwbGF5KSkNCj4gwqAJCXJldHVybjsNCj4gwqANCj4gKwlpZiAo
aW50ZWxfZGlzcGxheV9ycG1fcG1lX2VuYWJsZWQoZGlzcGxheSkpIHsNCj4gKwkJZHJtX2RiZ19r
bXMoZGlzcGxheS0+ZHJtLCAiUE1FIHdha2UgY2FwYWJsZSBkZXZpY2UsDQo+IHNraXBwaW5nIEhQ
RCBwb2xsaW5nLlxuIik7DQo+ICsJCXJldHVybjsNCj4gKwl9DQo+ICsNCj4gwqAJV1JJVEVfT05D
RShkaXNwbGF5LT5ob3RwbHVnLnBvbGxfZW5hYmxlZCwgdHJ1ZSk7DQo+IMKgDQo+IMKgCS8qDQoN
Cg==
