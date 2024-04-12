Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AE9C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 20:48:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900AD10F10F;
	Fri, 12 Apr 2024 20:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nsR+PMj9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A8F10F10F
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 20:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712954929; x=1744490929;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ddLqUHTHt8hkzegUXA3oMomlhW69J5BL5UdcpzadpVo=;
 b=nsR+PMj9QYI8kv+6wFRhA1d79hd6HpkxyO49pENb5sM0fB8oyGhdgfte
 f+z/2zyH+iS/9jqT0+8J/KDY7S4JeTBSL30bcW8B7i8XMQu5K00ytdVVf
 Q7d+QIFdAgm8fTs6GfyN3rkI5Auleayb5TMNw13eZ5Tkh/eETwXCKNziT
 HmasQFCdA1ulgmplAMXj8dp+w0H/Rn+13ZYxQsZUEP+o+C0iDWLEnyqbC
 EDITWUjZIKXv6JbKUsx5JLScC9ZsxzcTrN6Vsb53fQEbrgDK9WARVTYrP
 Y3LUp/HDh53x3rDfptH7v4uDFzgZYgHQFXd0j0oN5Ctg4gUGuNlq0vHzh Q==;
X-CSE-ConnectionGUID: zdIYTuKFQvaAK6flpZVLVQ==
X-CSE-MsgGUID: bpmsPVDKRQGTFAyDHhDlMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8642798"
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; 
   d="scan'208";a="8642798"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 13:48:49 -0700
X-CSE-ConnectionGUID: 3Gcy6G2vQMODwnzIZv8Cdw==
X-CSE-MsgGUID: 26+VIORrTi25klCAsBXUoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; d="scan'208";a="21262452"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 13:48:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 13:48:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 13:48:47 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 13:48:47 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 13:48:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipHQUwHBgQtks90QTyDNf0xIMevTTrYq253Y0LVrpIRTS9JKR2m0/N3+IcG3OVqT49BpYFexRZaWUmE51S1ZwgvDrLPeJsZBYJif4Klc3fs86ghQjPOw1zHFnckqcnmIYog/ph3tMN43/jYyuQBj5nRR8TBnXCjwa2upyGik21gstjPWQ5y2lbfSseN83twAgu39u2rBe4Zy0eXZcnoU8G5t64A5Xp4C69bNDue80X41ZvZJejW2PgPhwCYw/Bzl0i0y1Ie6YLJ0iGxX1IntflPg4cR+PqiRR0CM1yBF5EvTw7r34gLn/2VHzVLEoURbOkbtkIcCBWHWFuYKZBk3FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddLqUHTHt8hkzegUXA3oMomlhW69J5BL5UdcpzadpVo=;
 b=ctPmxur5I2xdPGY8y5Xcu01KfB1Ey5bB4l8h7RTj6FpYp/shpAZbJAyQ5gw2076dt3eYXmvDmcp9BaU2asgsEeSnQXqKYkPGDc0nrhmaWjKxXKwUHh1s91oa60zvSJL13TSFskicj2CXejNIoZtc9RtN8tyaTKqXbkV8tPRLmBFFzdhDaQXF9cxl5a6VGadG3h3PWx9Qiv7UFMBW419ZXcixtR/XgxMxJDu3zRF5ivd1VL55CyDEuVS1R4m0HARtgySprGdJhlPDedK9WGsIRhgQ0/J5GpHB5d85xOmRuGKo7pnCcXtYY+ikrSVrS7nvUapCvOOS2vvtXW5uNqKsCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MW4PR11MB6838.namprd11.prod.outlook.com (2603:10b6:303:213::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Fri, 12 Apr
 2024 20:48:46 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::36d1:7f54:624d:aabf]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::36d1:7f54:624d:aabf%6]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 20:48:46 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Gupta, saurabhg" <saurabhg.gupta@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v4 2/3] drm/xe/xe_guc_submit: Allow lr exec queues to be
 banned
Thread-Topic: [PATCH v4 2/3] drm/xe/xe_guc_submit: Allow lr exec queues to be
 banned
Thread-Index: AQHah4SWdD3tYr+Qm0eJPANiOK1YpbFlJpQA
Date: Fri, 12 Apr 2024 20:48:45 +0000
Message-ID: <682a2bc1206df21d50611442ff2bced0aef71e27.camel@intel.com>
References: <20240405175505.1161756-1-jonathan.cavitt@intel.com>
 <20240405175505.1161756-2-jonathan.cavitt@intel.com>
In-Reply-To: <20240405175505.1161756-2-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MW4PR11MB6838:EE_
x-ms-office365-filtering-correlation-id: b7d82c3f-a91a-45bf-ee4e-08dc5b31f27a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MCU4Cx6LkK+0FyGSKQTkvj7vt3CnzQ2hPQyNSKIDoxHu1AjvLL12wm5I/vC+Vcu0WwoB06XpVGOusFNPRneDVT/6LwMK23qF58stOmsULW5goU6J15Cws9PPiW0ZYjS+j6YKduibYy3uw7v0f//v3Bgcl3xQLbNFEFs3wkZkFWTaTifDzPM/JRpL/KPJQCFNGGHA14JTanVyXXj++tmtdqObqb0/xNSlFRfdIPaNPVFQQYaXF1bt8IIXBaGoQ0XViZROtACRNQbCESeRF2h8+2Uw4/xd1wzCaCwM+zYsmE2yY0GJVxwUWS/DiXWwM+1bgYfpCWi6AyXPrgaijLZmfTaBWjn/lG+1fYP/rNcm78Hp+66VDiUPrvVA8jzrx/f7pYMkbnLYGw4HoopYxI4fci7KWi2QCC4uOgC0imGLb/NfuSNsd3Z/5KQ1DPsabdwu8371PhWgoKKSREGeqnVxPUroMCfZmH8kIytgUzIKRXoC5xhw73hdnuOv5JYRJkkoxwN4ychE8QpNCYOV+jZUoQGTbvGt+b5grWIk9lUB2o5HgLxAgWPTYXlYEO1cx5tUbwdIViogvVK3Y915vA1EH7KY6NTBoDWRIPqxOQ5ejnReRV3lycBwncIMNT52YXYOJuFlPfGB4/s2IPirNOKtY3TM3rprbSQzywIvaqLTam1fUrooxRddih9b/h4/u9xi7waSJbbUqvcPPdzBXc0ZCA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWNyQVpyLzJQU2EreXhZdW9rRE5OR3oxN2ZoME0yK2d6NVBQckI2azd1RW9U?=
 =?utf-8?B?eHVqZ1dqeFZCUkh2cTNLUEdLNkVYcGZsRVl0eHZGZ2FMeEdrS3BPY21sdXVT?=
 =?utf-8?B?WldHZzNTYUU5bS9GcFpia0hDNDVxcFBGNG9VSVNQZDZjZlBjdWdKcVVzMXdI?=
 =?utf-8?B?MlZiVGdBTTlVQkZsR1RSUHdJanNBeHoxRzd3WDZkZ01FZm5VNTg5RGkyaldS?=
 =?utf-8?B?WHJVeTdoc1pXUHB0akFidmR0WTV3Q1pyakVpZ0t2QVVrb3htU01rTXk5cnJ5?=
 =?utf-8?B?NS9UNlI0REpTbjNBSEFvQTZEdXZEOUdQWVFiek9IRlFlY3Z6ZjZEWFpBd3Bm?=
 =?utf-8?B?bzB6Z3NJK28wZEN5L0l4azBLSmRsN2p2ckV6WmxnelhqdW13NXZlMGFBUktu?=
 =?utf-8?B?N3lZa0pyaUY5a1dsVnVkbWtCR1JhQVlJdzNIallwTi9mNEowbG56YUJvUjd1?=
 =?utf-8?B?YTI0SEZVYzdDajhtVll4OTg0NFJtRTl3YWlUY3VWSlo0bGNMRUlqYmxDbUdQ?=
 =?utf-8?B?UVk0dHh5Q1cxWDl3L3AyaTdrd1JHQ0p6a0k2WVRNd2FIbkR3SEFHb1M3NGNs?=
 =?utf-8?B?R1VVUXZFWXNSTFZ6RmRKU2tpV2xIcVlENW94TUZSdktzWk9kaU5jWmpKbnlJ?=
 =?utf-8?B?S0VkWmRJbEp2dEMyVVBhTU1qTThGT21MYjJoWWRFd3czRjNySElEUkF1cnhY?=
 =?utf-8?B?V2NzMnNpc2oxMG5xTFpKZkpyZTRpdmE4TE9UVjVBcDRJNGllSTdKMjU1QUho?=
 =?utf-8?B?c0g4UGhFV0VORHNDaUNoRVB5Y1FpTGwrK0VuM3doei9PZ3RaY2c2UG1KOFEv?=
 =?utf-8?B?ejQwbE41dXF3ZVppRE5NQXFTcVdPZnphQTQxOG4zTHFQL0xUakJQQnVtMjRI?=
 =?utf-8?B?NFV6aEpseVZJdDFVUDl3endtRnFGZVBjV3BDaENVcElDdG5ZTU15NGpZUWta?=
 =?utf-8?B?SDNYajFueFF0U1hKTlRhaGFjQlhkYU8zaEZ2TVY4VE9wMVA3V2taUDhRTHlz?=
 =?utf-8?B?N2hWVHJ3SGpkT0pqSnNzbG1NT0dMMkl6NWVQVTdyNmZxR1Q3ZG5xWkZzYzYy?=
 =?utf-8?B?WmNJai9xaVMzYUpKRXIwckpWSGxMZEpyMGd1NlR5a05RZlpLN1NpRVlKa2Nj?=
 =?utf-8?B?djR5ME1hSml0WjE4M0Rla0JJOEhvVEsyYk5sNGRUVS9OTGN0SVZaZUxvYTZ3?=
 =?utf-8?B?eUZoUVAvSWczM1QwazUyZjN5ejljS3lSQXViU2w5RkUzRS9TeThZMnozRkpT?=
 =?utf-8?B?ZFZSYWVzenB1SXA4azFZVkxCQm1iQnBHd3MwT2pmMDlPRW80WU1iWUIzckxn?=
 =?utf-8?B?c3JvWllwd2FydjRDMlN1Y2tobTFGVThwcmlzUGo1U3M1WGJmV29Ed1VRaXRG?=
 =?utf-8?B?bjBmOEIwT3pZaDU0MEcyaEt5dDJFVmwzYjdEdGQ1ZWswU0xNbUVxWXFtZ1JN?=
 =?utf-8?B?SlVCR0JRT0lnc3RsUlBzN3RsL3F0Q0kvbExJMFVrOXZwQ0VLaXBNR1ZweVZN?=
 =?utf-8?B?UC9aQms0WFg3OTNMdE9BTURHTXZrN1pxS0NUc2NrNEtMcStXZTMzZmEzWXFI?=
 =?utf-8?B?TGZMbC9Ga2NSU24xM0M1amkrVDZVeHVraVN2NGozaFpUb1JBcmpOQ1Z3L1dh?=
 =?utf-8?B?S2pySUtiMjFiaHVhdXh6S2xrY04xRHdWT1VEcTlXYU9WeVYrVm16OU1scUpX?=
 =?utf-8?B?MFRqWEVxRGtDbEVDa05OdHdmUENwdjVLd2xyZlo0Qk43UVJhcUFBL2JkcXRh?=
 =?utf-8?B?K1pTZjNZVzIvczRwbGovYWhBYVJleGE1VXdHQkdLMFA1Q0hUTEdKYXM3ZVlR?=
 =?utf-8?B?UHdEUEdUSHRMMlhSekxPVStSSGZoTWF4WlNGTkNQdUsrT29FT1dQZ1FWb1h5?=
 =?utf-8?B?WHJzYXorNFZUQkgvZmtHUUp6bUExU1JiZlRuYkI2TDdlOW9xMWx3ZUh0eEpN?=
 =?utf-8?B?clRjN0NZTHBkYWFlczBWTGV2RkpSaklGb3VQOUdqWWhVMzlWL05mN1NRd1Fp?=
 =?utf-8?B?L2x4Ny9Ha0xYbG1EMHo4MEZFbjc0djRTVXJwOUZsdHR0MytIaXdZbVNwQmh1?=
 =?utf-8?B?RnBLVXZXWHdxN1ZKWHNLTExESEVZU2NraVQya1p1RGoreEhCK2JGSExTcXNu?=
 =?utf-8?B?MmJQSURjdkZZSllLbU5uQlFrbGg4cmx2dHVDZmNXd1RmVEZnMWxOR043em92?=
 =?utf-8?B?anc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8344DD5489DCA4A86F3F98F9F7A5906@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d82c3f-a91a-45bf-ee4e-08dc5b31f27a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2024 20:48:45.8991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r6sjCfcR0/eI+0pmOQcI4T6TwdOYWuYCYDMl7V2a/H6FYFIH+Pah6G51psskt5xrkWR9s8Pkw6pa60xcFbW/nron0l8Br2W9w8eGvf7nnHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6838
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

T24gRnJpLCAyMDI0LTA0LTA1IGF0IDEwOjU1IC0wNzAwLCBKb25hdGhhbiBDYXZpdHQgd3JvdGU6
Cj4gTFIgcXVldWVzIGN1cnJlbnRseSBkb24ndCBnZXQgYmFubmVkIGR1cmluZyBhIEdUL0d1QyBy
ZXNldCBiZWNhdXNlCj4gdGhleQo+IGxhY2sgYSBqb2IuwqAgVGhvdWdoIHRoZXkgZG9uJ3QgaGF2
ZSBhIGpvYiB0byBkZXRlY3QgdGhlIHJlc2V0IHN0YXR1cwo+IG9mLAo+IGl0J3Mgc3RpbGwgcG9z
c2libGUgdG8gdGVsbCB3aGVuIHRoZXkgc2hvdWxkIGJlIGJhbm5lZCBieSBsb29raW5nIGF0Cj4g
dGhlCj4gTFJDOiBpZiB0aGUgTFJDIGhlYWQgYW5kIHRhaWwgZG9uJ3QgbWF0Y2gsIHRoZW4gdGhl
IGV4ZWMgcXVldWUgc2hvdWxkCj4gYmUKPiBiYW5uZWQgYW5kIGNsZWFuZWQgdXAuCj4gCj4gVGhp
cyBhbHNvIHJlcXVpcmVzIHN3YXBwaW5nIHRoZSB1c2FnZSBvZiB4ZV9zY2hlZF90ZHJfcXVldWVf
aW1tIHdpdGgKPiB4ZV9ndWNfZXhlY19xdWV1ZV90cmlnZ2VyX2NsZWFudXAsIGFzIHRoZSBmb3Jt
ZXIgaXMgc3BlY2lmaWMgdG8gbm9uLQo+IGxyCj4gZXhlYyBxdWV1ZXMuCj4gCj4gU3VnZ2VzdGVk
LWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+Cj4gUmV2aWV3
ZWQtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPgo+IC0tLQo+IAo+
IHYyOgo+IC0gRml4IFN1YmplY3QgbGluZQo+IC0gTW9kaWZ5IGNoYW5nZSBzbGlnaHRseSB0byBy
ZW1vdmUgbmVlZCBmb3IgImJhbiIgYm9vbGVhbgo+IAo+IHYzOiBSZXZlcnQgY2hhbmdlIGludm9s
dmluZyAiYmFuIiBib29sZWFuIHRvIHZlcnNpb24gMQo+IAo+IHY0OiBBZGQgbWlzc2luZyBzZW1p
Y29sb24gYW5kIHJlbW92ZSB3aGl0ZXNwYWNlCj4gCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3VjX3N1Ym1pdC5jIHwgMTIgKysrKysrKysrKy0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d1Y19zdWJtaXQuYwo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJt
aXQuYwo+IGluZGV4IDFhNmFiYjEwYTk2MGUuLmU3MmYyYTZjYWQ2MGEgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWNfc3VibWl0LmMKPiBAQCAtMTQyNCwxNSArMTQyNCwyMyBAQCBzdGF0aWMgdm9p
ZCBndWNfZXhlY19xdWV1ZV9zdG9wKHN0cnVjdCB4ZV9ndWMKPiAqZ3VjLCBzdHJ1Y3QgeGVfZXhl
Y19xdWV1ZSAqcSkKPiDCoMKgwqDCoMKgwqDCoMKgICovCj4gwqDCoMKgwqDCoMKgwqDCoGlmICgh
KHEtPmZsYWdzICYgKEVYRUNfUVVFVUVfRkxBR19LRVJORUwgfAo+IEVYRUNfUVVFVUVfRkxBR19W
TSkpKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfc2NoZWRf
am9iICpqb2IgPQo+IHhlX3NjaGVkX2ZpcnN0X3BlbmRpbmdfam9iKHNjaGVkKTsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYm9vbCBiYW4gPSBmYWxzZTsKPiDCoAo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGpvYikgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICgoeGVfc2NoZWRfam9iX3N0YXJ0ZWQoam9i
KSAmJgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAheGVfc2NoZWRfam9iX2NvbXBsZXRlZChqb2IpKSB8fAo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4ZV9zY2hlZF9pbnZhbGlkYXRl
X2pvYihqb2IsIDIpKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRyYWNlX3hlX3NjaGVkX2pvYl9iYW4oam9iKTsKPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBzZXRfZXhlY19xdWV1ZV9iYW5uZWQocSk7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfc2NoZWRfdGRyX3F1ZXVl
X2ltbSgmcS0+Z3VjLQo+ID5zY2hlZCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYmFuID0gdHJ1ZTsKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoH0gZWxzZSBpZiAoeGVfZXhlY19xdWV1ZV9pc19scihxKSAmJgo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoeGVfbHJj
X3JpbmdfaGVhZChxLT5scmMpICE9IHEtPmxyYy0KPiA+cmluZy50YWlsKSkgewoKV2h5IGRvIHlv
dSByZWFkIHRoZSBoZWFkIG91dCBvZiB0aGUgbHJjIGJ1dCB0aGUgdGFpbCBmcm9tIG91ciBpbnRl
cm5hbAp2YXJpYWJsZT8gSXNuJ3QgdGhlcmUgYSBzbWFsbCBjaGFuY2UgaGVyZSB0aGF0IHlvdSBj
b3VsZCBnZXQgc29tZXRoaW5nCnJlYWR5IHRvIHNlbmQgYnV0IG5vdCBxdWl0ZSBzdWJtaXR0ZWQg
dG8gR3VDIGFuZCBpbiB3aGljaCBjYXNlIHRoZXNlCndvdWxkIG5vdCBiZSBlcXVhbCBidXQgbm90
IG5lY2Vzc2FyaWx5IG5lZWQgdGhlIGJhbj8gSSBndWVzcyB0aGUgZmxpcApzaWRlIGlzIG1heWJl
IHRoYXQgZG9lc24ndCBhY3R1YWxseSBoYXZlIGFueSByZWFsIGZ1bmN0aW9uYWwgaW1wYWN0Li4u
CgpUaGFua3MsClN0dWFydAoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGJhbiA9IHRydWU7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0K
PiArCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChiYW4pIHsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNldF9leGVjX3F1ZXVlX2Jh
bm5lZChxKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHhlX2d1Y19leGVjX3F1ZXVlX3RyaWdnZXJfY2xlYW51cChxKTsKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoH0KPiDCoMKgwqDCoMKgwqDCoMKgfQo+IMKgfQoK
