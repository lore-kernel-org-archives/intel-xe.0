Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E38FF886A
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 16:32:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D949110E813;
	Mon, 27 Apr 2026 16:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LNMvkj9+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E4610E813
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 16:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777307572; x=1808843572;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WXcPwvNNXeL2hhDWOcvJC2OqED5YPKT7uO6OtvAKzcE=;
 b=LNMvkj9+dv55Pr2mLdktMDxn0nhoOjl6wTbcI/0HAqZpFHAzlb/ysvLg
 GKsH0tNgkmqq/x8aY+f0voy006enbHNhc2LFuTfws/qpFZrMBXVDNRi2Y
 R8l4ro2tixoWWfcwLmHMZifmvJm6xbV9Dm+A9ZnHNLTiQnS+X/rmAU4kE
 AeEKKShlHiQy6Oq6JZBM4XWDviPT07rdemLYc0XPsKHa44JAD4oVVOOK1
 wbQGwuVs10MlMOZR/go5OD4ZubVZvqaVkN4ya8qLJUqcUJ64aD3k4/bBE
 WYbh7LGUtvvDE4b08S4tX770ZBg42s8CHB9ksxjCpa0/4fhYfELpeFbFQ Q==;
X-CSE-ConnectionGUID: IhASYjLvTOKp13gZGuvYJg==
X-CSE-MsgGUID: c40RDVwXSMmwaR4wFQx8QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="88898587"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="88898587"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 09:32:51 -0700
X-CSE-ConnectionGUID: /zmrlKZiR0Ws4XsJ2JCPng==
X-CSE-MsgGUID: WZLOIEbqQVyv22a/s1oe/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="257215035"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 09:32:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 09:32:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 09:32:50 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 09:32:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGqVTbXaUFreURgPptP8CLDFdr8UzT/id3/moR3FYSEOET3qIF3NXkUdeYhLo3S8Y8Ev6VhRKAhZ3nYOqwHuv8DwwfIFUTAcXJ1GkX0+pX4jr+X1n1L76+KmKvhzew6YVDWOdmq5qWYysipGmSm3rwxhbvNFgKSAU0nYABH057n3C4u3ee15WKjqowlUJ+65HdQviefx4ujN+mZuE5cIuvbk91vOUvcQ9dDoSz7dwkRg/0C7BqLeXgF3cPBXvDw0c8etyLDC7J1bX4oczoM+OlWM8Lv4T0gr+3W4F29KAtf68D1HKbzdYB+mqFJmW8KqWo1+Wsyx9CGwR7HRQ2Wq8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXcPwvNNXeL2hhDWOcvJC2OqED5YPKT7uO6OtvAKzcE=;
 b=XpZUsEGyLV2adW8YK3jDZRcuGYKJG57AHlkMm69mrWUV4CLYAdH+qv+s4R7yPv+zOBgCYoj7Xq1ZFnp9niLz+nYjus5vuflX03p9ecAXeJ+x9t9gSLEOcPPVV3jcA8ttRZSdQuaDiiVsnD24rfR5O8RHRqi9eH5KFSG86A0BPM5gH2s/TeyQfNjj6SSZQ/Rts1C0FakUsurzvQfo/9blLaAZ9gkd/b+E0la19wXT+JqF8RxVIs8+5moQh2NO/Z9P6UsGDa2IBPhgha2jkhDWFVM3oVf6CYsxwQIw/G3SrVvv9Ihw2RiXupf7/3PXNA4thtGnPbZ91JCPA/2LsBCTvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SA1PR11MB6710.namprd11.prod.outlook.com (2603:10b6:806:25a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 16:32:45 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 16:32:45 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2 09/10] drm/xe: Drop xe_hw_engine_mmio_write32()
Thread-Topic: [PATCH v2 09/10] drm/xe: Drop xe_hw_engine_mmio_write32()
Thread-Index: AQHc1CwC/QlLaPBfB0KGC9R6hVffM7XzHgRw
Date: Mon, 27 Apr 2026 16:32:45 +0000
Message-ID: <DM4PR11MB54562E4955C9F3AA380C0367EA362@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
 <20260424-engine-setup-v2-9-59cc620a25f1@intel.com>
In-Reply-To: <20260424-engine-setup-v2-9-59cc620a25f1@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SA1PR11MB6710:EE_
x-ms-office365-filtering-correlation-id: 0a252a89-967a-4831-0a0a-08dea47a9cc4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: JAzZrH4oC9mPuEObNjGqMZKu7CYAfscMTD3hXLTrnOYVX3EXfwPtknMAKbqs8onMVYXIYUYkznvkq7RKquXhox5hGVVrD79McDP1FxIrHkSviB7QF1Ke9nDeKsnGu8IG93+XoF4bhvKlfy+R4OhyqMDJ7Dulwa+rA0SMJVzeNzsSriNarQaHN37ch/HM8Zcrh+KYsiiBgK6x7KQbVlc2OPSTVqHOhm9WAw9ge4C4PsBtu3gpD1JlAcUSmBwfrkDGfe6eFA2Pnsl4w5evlusAdqkFWBppZ3k6hc3/YNDEIuj5f2dtXdGTXVqC5MAWPVzQG3dJorX95un2rsk/Pff5cNhXfLZ/7nURgSm/isGZTIvBlJz/HNP6exxxn29LajJRbFH2YHM1qVlTrt27DAY0x7870rP+vaITBOPl2/jOsoUG8MHS9rFhL9ntu0yEsbPON7AgXt2VlBpnaSvTXrX7sGsOjUfbcF9sbpQD+/WfbwkEUrrBEzsE4H7v/flU6Gcv+EgTOYRvu0RPkWHAAO997gkqFzsBQyoFzUXAtA/9ql5kElF5zM8n3BJdgYp8IQOO0kX6mA35hSolo6V71koyhKuTUOPIVrUhhiU4D4KOtR93kOPZ7p0X1SQLdH6xKLvlTB+2mge+iNl6yErOwNS5YrzGduZ4RnW+gPGZOUJY84NS+85TWOVNWDK5gUMbyR/gM0xoKrq539pngOgKIeVTPYWW9oqRaijV7CGd/9BnLWsAmHw9UuZWKw5pBP+1LIsIpFXnfwV24YXhkRyMzcfHKSCZR2MujI6LO1p0fMzvrq4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUpQUzNwaGVMbXIzcTV5WldVeXNvWm5TRHFjMmN1VWZsZ3hMWnI3M04vbVJN?=
 =?utf-8?B?blBYN3YyNHBnYnlqTFFRMXJqQnVGUm9tOGxCYWJHaE5GK2tlaDVSVHlrcTFn?=
 =?utf-8?B?dFg3T3BqbGlJdkVXMWozUGtFc2ExellGUGZDWk5FUFBqZnZXQTNINnFOOGlx?=
 =?utf-8?B?eHZhbEhSTTJFSGtMTGhPb1g4Rjc1dWRtN3lzWDdPYmh5ZkpFNXR6dm1Tc09n?=
 =?utf-8?B?N1o5UHppYStsRVdUOTlvVGNKLytQWHAzZW1UU01RSnhaVWtVcUZqSzhJazlG?=
 =?utf-8?B?TmJYdzRtMDlrMHZwaFZBY3B2blhQZ1oyelZKWEp4RVBEL0xuckJkSjRVVWhy?=
 =?utf-8?B?MWN3QjBDWmpLUTBhdisxNGw1S1hJcVZZZ0l2SEllRG1lNHkyV3I1RnZxSnBP?=
 =?utf-8?B?ZTBhaDlZdkEvMFhDNU9HaThURkNRMEc5bC9EdnY5QWZqNDljbEMrVmdSYzYv?=
 =?utf-8?B?WHRsMlQ2Y091OGJEcm5qRWFDU0xjRkRLdmZzSXYvcEgzdjdESTRNMVg3ZFVw?=
 =?utf-8?B?akdBRmQvRzg2NGJ6dVFweTdUKzhvVUx5TEIydGs3NU5RMkdDTlRJNzhlWHJN?=
 =?utf-8?B?N1BwNnhoT0YrZ0Mya0NSMkhPTVFuK3Rwa0xJQ3gwbDN5eHN1NGhoT3ErRVp6?=
 =?utf-8?B?Q2hUYktkb2s1eG5RdjhpcGxXd0plQjdJbTJqTkpLLzhqS0pNQUJmcWVrT25z?=
 =?utf-8?B?azJUcWNRNUhhdVpKQU9LZ2dneUVrZFJNOS9kcjNWMXhONFIxTG4rWTZIcExa?=
 =?utf-8?B?dlRoNjRYVFN6dVU0YkIwcDBKUFNScmZ6ZExSYVVRZEJRVjVIemI2ekR1TXcz?=
 =?utf-8?B?T3BERXJXQUVTOWlhYWs3TGNBOFdzYTdIVEJpVFF3TjUwRmxBV2lHZkVmSEFC?=
 =?utf-8?B?RlVDUiswNGZiZUV5Q2VuNThHWFFVV3orN2RrOXNzRkp6Ry96TmJVQUc1REpX?=
 =?utf-8?B?MnRhay9EWmF4SHV3UDZwYU5BSWEwazdwbXZrS2pmQlJZdEJXZTdST3pwQm0v?=
 =?utf-8?B?ZnNyaWV6WlNuZkJSMTFkV2hTUmdBYURJRCsxSi9NM2lVZWxFblpQRjQyWW1n?=
 =?utf-8?B?c1hmVUtWY2d6Y0w0KzBJd3FaU0Zsc3FrakNIQkhHOHMwS3dVYldzNEpqbDZs?=
 =?utf-8?B?VENSdXNSZi9DdG54SittUWdqbnRYZ3ZlWUNDRXlHcVMvcDI0amo5b2FkQVBn?=
 =?utf-8?B?WUcrY0gxQkhjTFFTcG1LaEVTbklHS2t0ZTllRkNtK1FsTVpER28vbjVObHB4?=
 =?utf-8?B?UkNGU3ZsaUtWZXNBZ0wxYnpJTWtrOWRaQTRjZTk5SVZxKzBqVnFHYWY2bS92?=
 =?utf-8?B?a1lLNm94NEtVZzJZaDc1Q2ZBb2ZpUkFYVTA3ZCttSmxObStGNXFuVlkvamMr?=
 =?utf-8?B?YU13ekkwU25RbnMzZ1A4TTVVL2dGaFhGcEE3U00raGFKV2FKSzdDTW5UNmxz?=
 =?utf-8?B?VVBROGk3UDJSY2phNUNQeXFPQ0Y1L3lPN2RqMFNlU0J6OFpRRk1waGRTNWxZ?=
 =?utf-8?B?ZVBrd1ZFR3duYXFVSjUrRVk4aXhsZ2N1dUREQWt2R0lBNHJ0ZEJCNGpyMWta?=
 =?utf-8?B?SlpaWVp1VVUybU1wbDJpLzVwMnlzZlFIZ0MxS0VFSVU2KzR1Y1dhRjdTcXRv?=
 =?utf-8?B?OUgrNjhJbGJYbU1NT2tYZjFOSS9CVVFkSzNpNnRZWm9nOEV5Q0ViUW1pOFlZ?=
 =?utf-8?B?S3M1NGRJb3Ztb3FQbVNHbzREQlU4aW5SOUszSEJYK044WmZOQk9IVHlPUTRj?=
 =?utf-8?B?Y3dLYXNpK2lWbVpmRXpyaHlLcXZOU2JIVlhrM0x0ZUJvMHVUSFJpUVhnUTY4?=
 =?utf-8?B?eHlCYU1ZejFvaVdBTmV4RHlET0FUSlJlWnFqQWhIRkZSQTVHbDZ6MzkvcWdv?=
 =?utf-8?B?dlg1blZtNzRwK0t1ajdhSnhQd3RodzdIQzR3ZlZrVTU4RVF5eldhU3AyYUph?=
 =?utf-8?B?VEJNelpweE5pSFJEQ3kyV3JEQmpLUFU4dC9oNFM2bWxKSXM3VHQ2dTRVOFVE?=
 =?utf-8?B?V25hMmRxWk9LT0QzUHdUQ2RXVE4wWDk1bFJVd0dVYkxzNVBMQjRGR2ZwWTlD?=
 =?utf-8?B?alZkT1lKaktmaWNMajBWeEhRWFFMeG0wdE9BQzk2R2d6V0ZoYnUyZ25zMERP?=
 =?utf-8?B?eEFOSWpPM3oxTFE4Ym4zV3hIWlR0TWhOQUhLS0RzU1llSVVVUDR3MFhIOURX?=
 =?utf-8?B?YkdkUXZ1MUxtUWd2YjlxUWE3WDRobVZPRkt1TG1mTlBMaVFKK0ZYYmlwcVRv?=
 =?utf-8?B?dHRLL3c3U2EwNmRnV3h2UDlnRjFVUkhDMHRhbUhTbmpZVWozcy8wKzlNMUdv?=
 =?utf-8?B?RlNBdkJTWGwrWkRnSytySVk0NWRMb1l3YnZZYUNNNGh0NityRzA2UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: vJlgmLJTpwYA9C4BkfMAVdToPDPdOJ6fX09pkPOzCe2k3JIUkrYJDEmhlR9cI7hBEHq/gu9uVDS/Q/ExWaFu+nxcStt6bCPXWbSBKFWgsHPT/tGzAnon6/3anMpvSfWC5G3n+/1aaw4qlhDqmfWmBKE99mmuiyVIVKpa4F8Vi2GHoXrONsBkQSg85ifu1QwdqyRyJEAPe1rEdBrWSNKy4+34oFSB3ksFhPkPs/4xPEJBrsNQ3vfXXrlSR11fIuS9ElrzZzz+4zYaoDcbGqTXczvzDD1Hp39M0a/kEqS1Tx79nQWSXxaY3h+ok9RJUdXuaJWtFrMP62WYJU2WR5bpow==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a252a89-967a-4831-0a0a-08dea47a9cc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2026 16:32:45.5840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6LTNCxtUIVEblTbp3kjCFAE9oWQOnsXUDt4z+2drY/1ag76MMa9whnhn3hD4F1B7ifJBrW1VE5Q5wYTDv8pioQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6710
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

T24gRnJpLCBBcHIgMjQsIDIwMjYgMTo0OCBQTSBNYXR0IFJvcGVyIHdyb3RlOg0KPiB4ZV9od19l
bmdpbmVfbW1pb193cml0ZTMyKCkgaXMgb25seSB1c2VkIGluIGEgc2luZ2xlIHBsYWNlIGFuZCBp
cyBlYXNpbHkNCj4gcmVwbGFjZWQgYnkgYSByZWd1bGFyIHhlX21taW9fd3JpdGUzMigpIGNhbGwu
ICBSZWdpc3RlciByZWFkL3dyaXRlIGludGVyZmFjZXMNCj4gYXJlIGFscmVhZHkgY29tcGxpY2F0
ZWQgZW5vdWdoIHdpdGggTUNSIHZzIG5vbi1NQ1IgaGFuZGxpbmcsIHNvIHdlDQo+IHNob3VsZCBh
dm9pZCBhZGRpbmcgZXh0cmEgd3JhcHBlcnMgdGhhdCBqdXN0IG1ha2UgaXQgbW9yZSBjb25mdXNp
bmcgd2hhdCB0bw0KPiB1c2UuDQo+IA0KPiB4ZV9od19lbmdpbmVfbW1pb193cml0ZTMyKCkgZGlk
IGhhdmUgYSBmb3JjZXdha2UgYXNzZXJ0aW9uIHRoYXQgd2UncmUNCj4gZHJvcHBpbmcgaGVyZSwg
YnV0IHRoYXQgYXNzZXJ0aW9uIHdhc24ndCBlbnRpcmVseSBjb3JyZWN0IGFueXdheS4gIEl0IHdh
cw0KPiBjaGVja2luZyBod2UtPmRvbWFpbiB3aGljaCBpcyBjdXJyZW50bHkgc2V0IHRvIFhFX0ZX
X1JFTkRFUiBmb3IgdGhlIEJDUw0KPiBlbmdpbmUsIGV2ZW4gdGhvdWdoIEJDUyBlbmdpbmVzIHJl
c2lkZSBpbiB0aGUgR1QgZG9tYWluLg0KPiANCj4gdjI6DQo+ICAtIERyb3AgcHJvdG90eXBlIGlu
IGhlYWRlciBmaWxlIGFzIHdlbGwuICAoU2h1aWNoZW5nKQ0KPiANCj4gQ2M6IFNodWljaGVuZyBM
aW4gPHNodWljaGVuZy5saW5AaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0IFJvcGVy
IDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KDQpMR1RNLg0KUmV2aWV3ZWQtYnk6IFNodWlj
aGVuZyBMaW4gPHNodWljaGVuZy5saW5AaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jIHwgMjUgKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
PiBkcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmggfCAgMSAtDQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jDQo+IGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2h3X2VuZ2luZS5jDQo+IGluZGV4IDkxZTY0NDA2N2NjNC4uYjNkYTgzMmE1NDE0IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jDQo+IEBAIC0yODIsMjcgKzI4Miw2IEBA
IHN0YXRpYyB2b2lkIGh3X2VuZ2luZV9maW5pKHZvaWQgKmFyZykNCj4gIAlod2UtPmd0ID0gTlVM
TDsNCj4gIH0NCj4gDQo+IC0vKioNCj4gLSAqIHhlX2h3X2VuZ2luZV9tbWlvX3dyaXRlMzIoKSAt
IFdyaXRlIGVuZ2luZSByZWdpc3Rlcg0KPiAtICogQGh3ZTogZW5naW5lDQo+IC0gKiBAcmVnOiBy
ZWdpc3RlciB0byB3cml0ZSBpbnRvDQo+IC0gKiBAdmFsOiBkZXNpcmVkIDMyLWJpdCB2YWx1ZSB0
byB3cml0ZQ0KPiAtICoNCj4gLSAqIFRoaXMgZnVuY3Rpb24gd2lsbCB3cml0ZSB2YWwgaW50byBh
biBlbmdpbmUgc3BlY2lmaWMgcmVnaXN0ZXIuDQo+IC0gKiBGb3JjZXdha2UgbXVzdCBiZSBoZWxk
IGJ5IHRoZSBjYWxsZXIuDQo+IC0gKg0KPiAtICovDQo+IC12b2lkIHhlX2h3X2VuZ2luZV9tbWlv
X3dyaXRlMzIoc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdlLA0KPiAtCQkJICAgICAgIHN0cnVjdCB4
ZV9yZWcgcmVnLCB1MzIgdmFsKQ0KPiAtew0KPiAtCXhlX2d0X2Fzc2VydChod2UtPmd0LCAhKHJl
Zy5hZGRyICYgaHdlLT5tbWlvX2Jhc2UpKTsNCj4gLQl4ZV9mb3JjZV93YWtlX2Fzc2VydF9oZWxk
KGd0X3RvX2Z3KGh3ZS0+Z3QpLCBod2UtPmRvbWFpbik7DQo+IC0NCj4gLQlyZWcuYWRkciArPSBo
d2UtPm1taW9fYmFzZTsNCj4gLQ0KPiAtCXhlX21taW9fd3JpdGUzMigmaHdlLT5ndC0+bW1pbywg
cmVnLCB2YWwpOw0KPiAtfQ0KPiAtDQo+ICAvKioNCj4gICAqIHhlX2h3X2VuZ2luZV9tbWlvX3Jl
YWQzMigpIC0gUmVhZCBlbmdpbmUgcmVnaXN0ZXINCj4gICAqIEBod2U6IGVuZ2luZQ0KPiBAQCAt
MzI1LDggKzMwNCw4IEBAIHUzMiB4ZV9od19lbmdpbmVfbW1pb19yZWFkMzIoc3RydWN0DQo+IHhl
X2h3X2VuZ2luZSAqaHdlLCBzdHJ1Y3QgeGVfcmVnIHJlZykNCj4gDQo+ICB2b2lkIHhlX2h3X2Vu
Z2luZV9lbmFibGVfcmluZyhzdHJ1Y3QgeGVfaHdfZW5naW5lICpod2UpICB7DQo+IC0JeGVfaHdf
ZW5naW5lX21taW9fd3JpdGUzMihod2UsIFJJTkdfSFdTX1BHQSgwKSwNCj4gLQkJCQkgIHhlX2Jv
X2dndHRfYWRkcihod2UtPmh3c3ApKTsNCj4gKwl4ZV9tbWlvX3dyaXRlMzIoJmh3ZS0+Z3QtPm1t
aW8sIFJJTkdfSFdTX1BHQShod2UtDQo+ID5tbWlvX2Jhc2UpLA0KPiArCQkJeGVfYm9fZ2d0dF9h
ZGRyKGh3ZS0+aHdzcCkpOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyBib29sIHhlX2h3X2VuZ2luZV9t
YXRjaF9maXhlZF9jc2xpY2VfbW9kZShjb25zdCBzdHJ1Y3QgeGVfZGV2aWNlDQo+ICp4ZSwgZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuaA0KPiBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9od19lbmdpbmUuaA0KPiBpbmRleCA2YjVmOWZhMmE1OTQuLmVlOTIxODc3
M2I1MSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5oDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuaA0KPiBAQCAtNzYsNyArNzYs
NiBAQCBjb25zdCBjaGFyICp4ZV9od19lbmdpbmVfY2xhc3NfdG9fc3RyKGVudW0NCj4geGVfZW5n
aW5lX2NsYXNzIGNsYXNzKTsNCj4gIHU2NCB4ZV9od19lbmdpbmVfcmVhZF90aW1lc3RhbXAoc3Ry
dWN0IHhlX2h3X2VuZ2luZSAqaHdlKTsgIGVudW0NCj4geGVfZm9yY2Vfd2FrZV9kb21haW5zIHhl
X2h3X2VuZ2luZV90b19md19kb21haW4oc3RydWN0IHhlX2h3X2VuZ2luZQ0KPiAqaHdlKTsNCj4g
DQo+IC12b2lkIHhlX2h3X2VuZ2luZV9tbWlvX3dyaXRlMzIoc3RydWN0IHhlX2h3X2VuZ2luZSAq
aHdlLCBzdHJ1Y3QgeGVfcmVnDQo+IHJlZywgdTMyIHZhbCk7DQo+ICB1MzIgeGVfaHdfZW5naW5l
X21taW9fcmVhZDMyKHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3ZSwgc3RydWN0IHhlX3JlZw0KPiBy
ZWcpOw0KPiANCj4gICNlbmRpZg0KPiANCj4gLS0NCj4gMi41My4wDQoNCg==
