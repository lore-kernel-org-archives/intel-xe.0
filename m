Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFFECA5FB9
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 17:42:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A9210E63D;
	Tue, 20 Jan 2026 17:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nRz+PQgO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A583610E641
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 17:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768930973; x=1800466973;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lDxMsiq7RDgGoeD04Cnopjj8E3wSnOV4ceiR9zqJahY=;
 b=nRz+PQgOrFOxgg8eMcPDMTvgbUPlPSinuH/EHMzVxGanSmCNr91lXEVJ
 jusOFJJXdA6y0MOYwd1uLmJJvcCntYpGG1SYAJ4v/GDLcOEkB+Ck5tLmL
 XkzzsoU+JcdXusqxDdz/3UUT0XCv1twSEtwBAroSlu/vSbRFBfe8JTTct
 VKYlBL+Di0Q8D0Hrm5KlF/CKSEQkiplomayyXT+OYiaYG5UYqD5tpkMWV
 8qYZo7NqG1zXNBIKc+v+SyHjnp9kCqN9GZAM+tXRgWdeXrtVSnQPAbjOP
 ngqdLAjum+l8RDoXOeKLvjYYQAOxijSzrt0L0575Jl5jOO9eCzLvzrWlM g==;
X-CSE-ConnectionGUID: H4zO4m3ZRIObHkAdv6v57A==
X-CSE-MsgGUID: RCS1+WIJSxiA11GlFuMzEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80451269"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="80451269"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:42:53 -0800
X-CSE-ConnectionGUID: 5oo87H98Tea3VzICtG2/qQ==
X-CSE-MsgGUID: 4W5Wn/HlSIWS9Bv0K0b1rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="206100705"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:42:53 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 09:42:52 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 09:42:52 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 09:42:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBaECSfMbOLCWlVMySqfAQobZjpZ3+pG3WTmrtnX4Z7IsQUrTjYNPQFtLQEt13fgmJyC/gFOYG0WnLYohC3hLaG1JqJFipv6Lk6vW42tRTu3EYnAe/qOIPkmPt22e4G72UA+H3E0mTNxBoAAqxxwvcbiUFgL6ur4Y/AdS/DpItuJYzJ4wjDilt4GAVpyvtR/sNXXgwHwUJjrnreQZJlHGFd2ADSMYOUXjpOHeZLju9fsn0Vq7ymvudHnYWGtEN7ppsfRNKH8G6yyaI/SBcWvolwMOqxgXe6ZH7vl12wm40iEBG5VD1WpLBX1tvawgHZG8VuOB2kE5Jf+QpmcLHXyvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDxMsiq7RDgGoeD04Cnopjj8E3wSnOV4ceiR9zqJahY=;
 b=HNJ0XLlPBekKnfWnh/bEfFdQqeEz0qm9uUq5kOGtDypD4GvI8aXpdqQ0gSJPnyrysMNfB4i3CIQ++S6r7ioxlI/oH6weUBqZJKdMv5X8NxDd5MoEgFZvUO40hWPV9yGvOCpEjXTYv5MoPKpe65IkbHX4lGXdgVYn5y/F6plC0VN01sYMuaC6Gq3FUHwTsK2tydqaL1HUp+J0ai9edBWeoRSf8ZYdhsxb9Y48e74IyqJ44Stw34w24oySxAl/BsgsfkP/IQs0y+lt6zvo0dSDwZxl5EdYhmPYrKoHutwX7Bh14jcU26fHqTXeI0RnbS+zWy1tKZ0ay570xcYoZiPZVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SJ5PPFE5BD61D44.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::85a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:42:48 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 17:42:48 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gote, Nitin R" <nitin.r.gote@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Nguyen, Brian3" <brian3.nguyen@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/nvm: Fix double-free on aux add failure
Thread-Topic: [PATCH 2/2] drm/xe/nvm: Fix double-free on aux add failure
Thread-Index: AQHchzFat7p68lf30EGekNkcfpvI77VXgrGAgAPWBiA=
Date: Tue, 20 Jan 2026 17:42:48 +0000
Message-ID: <DM4PR11MB5456D1E86394FA17E4EA7C6DEA89A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260109220026.2468067-2-shuicheng.lin@intel.com>
 <20260116214055.2882338-4-shuicheng.lin@intel.com>
 <20260116214055.2882338-6-shuicheng.lin@intel.com>
 <CY5PR11MB63669F630DE40D3F6668E00BED8BA@CY5PR11MB6366.namprd11.prod.outlook.com>
In-Reply-To: <CY5PR11MB63669F630DE40D3F6668E00BED8BA@CY5PR11MB6366.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SJ5PPFE5BD61D44:EE_
x-ms-office365-filtering-correlation-id: 98b0d1f4-0cdf-49c2-08a2-08de584b53c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?cFJ2SDMzYXBFbUxiVVVLOHVCcmtBSnpMTVUzUnl6VzJvSnFpQ2dsZFJSWXY3?=
 =?utf-8?B?ZGdmOHBkRmtXb1Jva3hmOHo1c1U1V3RVVmVKZ252RTdEREJDYURrT05BeWtO?=
 =?utf-8?B?UTh1U2Zpc2QrK0NSRVJEd3FFdE1TUElzYStBMWhwaWtzZXU3UVpyek9RSmdL?=
 =?utf-8?B?eTV1eWFkUjRabnJTeWowdFIvWFpvb1pvVnhyTTh3N3JMN3kzVWhiZ3dmTWNO?=
 =?utf-8?B?aTFUcDJjaU9kMjdyS2NzSzJGRlFwWmZPcEc4Sm90STQ1NHNzOHhUNHpqTExy?=
 =?utf-8?B?WkdXSmtmUGlFS1cxUUh2NzR1SC9EL2Z0d1czdUZQQkEreldra0JxQ2tjanpQ?=
 =?utf-8?B?aDBDZVY1VU94SFYydTduVnc5ZVpUVHBwVEJCVjVHSTBTdzRuMXlRektObTJU?=
 =?utf-8?B?eGttdVpCVnQwMHZmc2k4NUhYTWFEdzEwMm9KWFZMRXhHdzk2TGgwWHZ2VFBZ?=
 =?utf-8?B?dzg2bVAwUEJ0d3U2SWJkbWhkQUkreFdQTGZ1WjlCWFNlYnorODRSV0pYMUxZ?=
 =?utf-8?B?UEloQ2t5TGxHTzJzZlpRRHFQZHV4blNzOWdHYjUveG03YVhHWXY0MHJNRUVC?=
 =?utf-8?B?NnFDYmlVb0UrN29tb0VUWVlHQTdzUVFOMDJKRlFmWGxtWFc0R3ZzR3F5cFdU?=
 =?utf-8?B?ZWh3NS8rU2ZMSXRQR0xaTjJodHVja1M5M2UzL01kT01ZZHVvSVJnN2l6cWF6?=
 =?utf-8?B?QXc1ZmxpNThEVHdOTGNhNUVaSlhzSU0rWmk0REhpUDFZTE4vYTR1UGVmREtt?=
 =?utf-8?B?THA1QUFDcXMyY1gvbEdzWUhiSkdJSGpXeXBaT2dEajJMUy82VGZIdVJFd3BB?=
 =?utf-8?B?ejg0OUdJTnV3dldKL0ZhLzk5eUdHaS9JZmJYMC9hOXk2QUZ1OWcrdGhMNUN3?=
 =?utf-8?B?elFXb2NhL25jejFLdmVHT3BkNDJ6ayt1a0dWb2p3ZnE2anh6VlFzT3RPQWlo?=
 =?utf-8?B?U0ZidWlHTUlacGphL0x3QlZHRFRwb05FeHEzRFJDdTVzZWpzR3ZpU2VoT1dN?=
 =?utf-8?B?enRqMXR0bFEwRGp4TTlDUURvOUVmZUNIdHNJVEduZnN3eWhReXFpQmIxT044?=
 =?utf-8?B?cEVONHl1VHRNRTZUN0RsRWNiZ1pPNGtiVmdGMndSMjVqbHdqMmRSL1R1UGVI?=
 =?utf-8?B?VjhkRkZQTXhTaHlNTDVIM1gzcVkyMnQ0bm5uWllGL3JKbEJOaGZIaHowK1M1?=
 =?utf-8?B?Y0J0K05RWW0rOVhSaGxhVFZxd1FnVTBOaEtjdmViQXluNm1ud0YyVTQzYThD?=
 =?utf-8?B?TVJadDNTRjFvL0xLS2RwbzYwU1JDOGJzNDRJWGVhVDNScjFud3pUV00rUjNZ?=
 =?utf-8?B?ZDR4bkVrclJTOElsNm5EWmdtTGlGZDI2cnFWYmpQNkR2VFAzM1VrNEhhd3pl?=
 =?utf-8?B?c0ZlNlYwWHZVYTJGTzlxNFp0REhSczNsendDZnhiQ1NtdXA0ZEpyVHorQkxK?=
 =?utf-8?B?eE80cjFEL3AyUUFvTnZsR3Z3TVRhQ1l3WXYzamhEOWFjQXBXS0szSWRvNjNM?=
 =?utf-8?B?WGh6ZFVBMDNIR1JtcTcyYldsUFF0cU5YM1llRXdITWVMNWtGUXBHK1VrSUk2?=
 =?utf-8?B?azBZKzYzd3p4Q1FoRW10TFowNlFXbHpvYmp3QWkvWGQ5OHk0U09taUxqSnZ0?=
 =?utf-8?B?SjlodVB0RmV0aE42UVQrWVl3bWFhSm5WQ1JrU1ZGR3BzeTdYaXZLWmZVRHgx?=
 =?utf-8?B?Mk1XS1grVElNWk9jZndvcmhmdUdIWkNhZVZUZThXTjJmdEtkYTdDdmJaaGFH?=
 =?utf-8?B?NnhkZ1VoVFZnQWMxcjFjUy9idnB1bzd4cURVbTI2Rno0YlJYWDAvOCswVDRy?=
 =?utf-8?B?SmxlSDQxTVZKY01rVGw5STlzbHI0Uzdra2RzS0MyWnQzZURSVUQvcVdHK2NJ?=
 =?utf-8?B?ZnQ4dFI4MGRCaWZpTUJTSDl3SU9qVnVUYzRSYVM0SXdrb0VrbFR4dmVoU3Bp?=
 =?utf-8?B?WndMWHpUYm1lWER1ekZVa3U4aTA2YWMyeWNhQ1RzbUhmNEd0VjM4U29IUFJk?=
 =?utf-8?B?UGZzRlk4RlhsS1lGemFnRkswclBGZm52VHZXdFQwcnpjclFFeXdQbTJIbkJp?=
 =?utf-8?B?MnIwQS9XWFJ6ZFJuV2d4Sk1vay9IN3lmbi9jNmpLbVQxWWRjRmhkaXc2aDJu?=
 =?utf-8?B?UGhEV1Jhanc5YUpncTNwemFwV0N2YUtIeElvN1kzNmxGNkNKcmF3UkdFR3JW?=
 =?utf-8?Q?9Odiz5jLu7UBXXDd0Eziuh0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MTRzQS9vbjREYk9TeUZZV2lKcVlRSThxT2RBMEFZcThPNlM5cTVGTXRwLzdo?=
 =?utf-8?B?UDRYZi9EVnRaTGFGYm1oMzNnY2QyN2JpbnRxVDFDU0ZtZVQ0R1Y5eU9vSTlm?=
 =?utf-8?B?QUFMRTA4L3JrY1pXQmV2a3dUdS8zTVN1MjBOZWxGaGhZemswMURkRndzdDFy?=
 =?utf-8?B?WTIrMnV5clR1NG9OaWlLOVpNS0VlVlpCZ3lFUEx1d0xGcGxtb1QxOTFtL0FW?=
 =?utf-8?B?UGZPV0xiSmxYM21KdHYwTk9JNTNSc0ZhMGFydjFpRU9KR1R5dVFOUXI1M2w3?=
 =?utf-8?B?NWlZM2U4a3crQzk0UkVaWGdEcmJBMmhYc3BlTC8zbGt5SmtKSWVJbHRnOXlu?=
 =?utf-8?B?QWRwZTdxSmJOMDlhaVlEalQwSm9CcmZsWW5OTHFMMGxUOFUxMUU5NzlaOHk4?=
 =?utf-8?B?M2dCWjI5WGxwUGlLTk5zSFFVdm5oZWVzNVFuVDJJYTFLVElIZTI2M0JoZzR6?=
 =?utf-8?B?Q1NSVm1WOXhNMzhWdWo2Z01ROGFwc2NiUGtPREFkL1ZPQkx0bmF6eFRyUE0x?=
 =?utf-8?B?Wi9vaXZOMWR4R2lOUnhieWZ5QS9JQmE3RzZ0dnlkSUdPeDlrci8zVUQ1Z0VG?=
 =?utf-8?B?TStKK3Nockc1bmxlV1FVZHZCYktUV2RVeVpBaTNaaHpZdVBkVDI4MlhMT0JY?=
 =?utf-8?B?cjdqdW0waEwxalI5cTgwdGplRUlTYnFJazY4SWtMMHU5cEJJWHFCZ1M5dE40?=
 =?utf-8?B?ZHBqZXRSTG9lT0w2dEpOb3JkMVVKYmVMR0NjM05sZzRERVFRNFh6T3RibEtL?=
 =?utf-8?B?b2sxSmw1NG5STUZYVWQ2aEp5dXdDTnNpRmtDTUIrZThxVlRrdEZZaWd2eE50?=
 =?utf-8?B?RXNoa1I1VDc5czhIeE1nM2Z3VmpUR0JhcFJpcVRmNlBlS1BZVm96RlV4R0NC?=
 =?utf-8?B?Y2QySjZiT3kwck9RZHlJYmt0RWd0RFEyVHhtQ1JnY0hRZFlORDBCdkRNRGNw?=
 =?utf-8?B?MTZhVmV0aGJySG5JL01FUWdYSE1ra0c2TkpOZ29hZ25OVS9FZjYycXZzanov?=
 =?utf-8?B?bFhDUDU3dUpyTlB4Z2dpZmxqUTJvd1o3YlBTY1dxT0gvWUxoRTZnTFgwZGdl?=
 =?utf-8?B?TklCcG8xREdXTnlNRG9HdlViSDBVV1M1UDJTT0NnUU9jUUhvYWZPbHZvNWlt?=
 =?utf-8?B?TE11YksxdUtZbHpTeENYOXVmQWZ3aVRpOFNBMjhPR21lVzhyR2pXRnhuTFZM?=
 =?utf-8?B?dm1HNXB6STJyTVBpRWJkRVhvMDFQZ2trWnRHQzlYL0Z3OURaWGgyci9YaEFK?=
 =?utf-8?B?akF2SlN3UjNqdDN5aEtYQXFPQzM1WEJsaGMrei9Qb1lyT2hiYktGY1FoYllG?=
 =?utf-8?B?Z1M3a3d2QXJTOU1QMkhnQ0VnTDZjajdxZE5KNGNSME4rNVBZQk1oaEMydDQx?=
 =?utf-8?B?SVdBVkdRZXdlSlpPWENpNy9nckpyWXRQR2lEZ1Y2cGpwZzgrUXpWQW44ZTQ3?=
 =?utf-8?B?cEJSZTVqZ2NkVEVFSVU3STNkWFp3UGNWbGpUcjVaWk80TjVWWC9TaURSZHh4?=
 =?utf-8?B?K1N1WklmalpSS1RKM3VOelphMlJsVUN5NGhzTElCamo0d1JDbEFKS0FyYkgx?=
 =?utf-8?B?RUFadjBIN1E4YkJRR2pHRS9sR0NCNk56b1BseEIrcVhZa1J0aENvd0xlMG9O?=
 =?utf-8?B?NzNJZ3VpV2hXMmMrTzNQb0VHTUFKUG5FS3QyZFJmbENtUGtFRE1LSVFzelhI?=
 =?utf-8?B?MFMwSlo1RjduaDFnOHZmcWF1b09jUzFkY2tiYmEyTzNocnlmOWs3SUh2dGxS?=
 =?utf-8?B?ZHZwNlpTWExVbWhCbHc4N1BGUjVndzJiMWR2SG11VDRmVkh3RU40RHlpSkZt?=
 =?utf-8?B?MEFuazNYbDB2VzdVMjdqVnpma0hpMnRkQjF2ajd5NFRBQjJQSlZYRytteXRB?=
 =?utf-8?B?Z1FEdXB2M2lCYW1idFhTeWxRYlZlQktNVzMyM2NRajVSTTQ1VGFObXRIWWZv?=
 =?utf-8?B?VTUvSk1TWjJLVlZMZGZ5Uk1FUXhkMmw2ZE0xOEFURHVsQkdFQlY0VVRZeWxz?=
 =?utf-8?B?Rkd1WFo1VW1yQ2piZWtkMXdXbldEak04YUFDM0VoYVNjbWV2bmc5ckJZM3Fl?=
 =?utf-8?B?d3l5QTdNYjVXTjFiYWN2WEs2bzc4b3FieE9FVUhoUmc1YW5MWjl5WTViT3hX?=
 =?utf-8?B?MkI0RlhESWs4WXh6aGVKNDJSYXZzZnlGOWxSb0hiQ2tZNTdzU2VsTHNPUmhP?=
 =?utf-8?B?RDBNY1lEdDQyYWpUVzdnckc4TVY3Mmt0NWtJVlhTZktyNXhtZzRtMjd1MjZW?=
 =?utf-8?B?QmFTL1crQ2xpMzAxRnErL0FFRnduNWJWS2dMc2M2a1ltLzlSMnJQYW1FS0JP?=
 =?utf-8?B?KytLQkszd2lIRkhpd1JJR1FncG5oQ3g1eWx6RlRMNnNZT0M0MEpCUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b0d1f4-0cdf-49c2-08a2-08de584b53c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 17:42:48.4267 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BYjgrWopNOXOU8w1GfDGYfdUzNI/nA4B+tU9ld0c8GET/EVmaJzkfmy/Fe8ukoz01+rQWhYY0ou6u7qEBXdO2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFE5BD61D44
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

T24gU2F0LCBKYW4gMTcsIDIwMjYgMTE6MDMgUE0gQWxleGFuZGVyIFVzeXNraW4gd3JvdGU6DQo+
ID4gU3ViamVjdDogW1BBVENIIDIvMl0gZHJtL3hlL252bTogRml4IGRvdWJsZS1mcmVlIG9uIGF1
eCBhZGQgZmFpbHVyZQ0KPiA+DQo+ID4gQWZ0ZXIgYSBzdWNjZXNzZnVsIGF1eGlsaWFyeV9kZXZp
Y2VfaW5pdCgpLCBhdXhfZGV2LT5kZXYucmVsZWFzZQ0KPiA+ICh4ZV9udm1fcmVsZWFzZV9kZXYo
KSkgaXMgcmVzcG9uc2libGUgZm9yIHRoZSBrZnJlZShudm0pLiBXaGVuIHRoZXJlDQo+ID4gaXMg
ZmFpbHVyZSB3aXRoIGF1eGlsaWFyeV9kZXZpY2VfYWRkKCksIGRyaXZlciB3aWxsIGNhbGwNCj4g
PiBhdXhpbGlhcnlfZGV2aWNlX3VuaW5pdCgpLCB3aGljaCBjYWxsIHB1dF9kZXZpY2UoKS4gU28g
dGhhdCB0aGUNCj4gPiAucmVsZWFzZSBjYWxsYmFjayB3aWxsIGJlIHRyaWdnZXJlZCB0byBmcmVl
IHRoZSBtZW1vcnkgYXNzb2NpYXRlZCB3aXRoDQo+ID4gdGhlIGF1eGlsaWFyeV9kZXZpY2UuDQo+
ID4NCj4gPiBNb3ZlIHRoZSBrZnJlZShudm0pIGludG8gdGhlIGF1eGlsaWFyeV9kZXZpY2VfaW5p
dCgpIGZhaWx1cmUgcGF0aCBhbmQNCj4gPiByZW1vdmUgaXQgZnJvbSB0aGUgc2hhcmVkIGVycjog
bGFiZWwgdG8gZml4IGJlbG93IGVycm9yLg0KPiA+DQo+ID4gIg0KPiA+IFsgICAxMy4yMzI5MDVd
DQo+ID4NCj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09DQo+ID4gWyAgIDEzLjIzMjkxMV0gQlVHOiBLQVNBTjogZG91Ymxl
LWZyZWUgaW4geGVfbnZtX2luaXQrMHg3NTEvMHhmMTAgW3hlXQ0KPiA+IFsgICAxMy4yMzMxMTJd
IEZyZWUgb2YgYWRkciBmZmZmODg4MTIwNjM1MDAwIGJ5IHRhc2sgc3lzdGVtZC11ZGV2ZC8yNzMN
Cj4gPg0KPiA+IFsgICAxMy4yMzMxMjBdIENQVTogOCBVSUQ6IDAgUElEOiAyNzMgQ29tbTogc3lz
dGVtZC11ZGV2ZCBOb3QgdGFpbnRlZA0KPiA+IDYuMTkuMC1yYzItbGdjaS14ZS1rZXJuZWwrICMy
MjUgUFJFRU1QVCh2b2x1bnRhcnkpIC4uLg0KPiA+IFsgICAxMy4yMzMxMjVdIENhbGwgVHJhY2U6
DQo+ID4gWyAgIDEzLjIzMzEyNl0gIDxUQVNLPg0KPiA+IFsgICAxMy4yMzMxMjddICBkdW1wX3N0
YWNrX2x2bCsweDdmLzB4YzANCj4gPiBbICAgMTMuMjMzMTMyXSAgcHJpbnRfcmVwb3J0KzB4Y2Uv
MHg2MTANCj4gPiBbICAgMTMuMjMzMTM2XSAgPyBrYXNhbl9jb21wbGV0ZV9tb2RlX3JlcG9ydF9p
bmZvKzB4NWQvMHgxZTANCj4gPiBbICAgMTMuMjMzMTM5XSAgPyB4ZV9udm1faW5pdCsweDc1MS8w
eGYxMCBbeGVdDQo+ID4gLi4uDQo+ID4gIg0KPiA+DQo+ID4gRml4ZXM6IGQ0YzNlZDk2M2U0MSAo
ImRybS94ZTogZGVmZXIgZnJlZSBvZiBOVk0gYXV4aWxpYXJ5IGNvbnRhaW5lciB0bw0KPiA+IGRl
dmljZSByZWxlYXNlIGNhbGxiYWNrIikNCj4gPiBDYzogTml0aW4gR290ZSA8bml0aW4uci5nb3Rl
QGludGVsLmNvbT4NCj4gPiBDYzogQWxleGFuZGVyIFVzeXNraW4gPGFsZXhhbmRlci51c3lza2lu
QGludGVsLmNvbT4NCj4gPiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29t
Pg0KPiA+IFN1Z2dlc3RlZC1ieTogQnJpYW4gTmd1eWVuIDxicmlhbjMubmd1eWVuQGludGVsLmNv
bT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTaHVpY2hlbmcgTGluIDxzaHVpY2hlbmcubGluQGludGVs
LmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX252bS5jIHwgMiArLQ0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPg0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbnZtLmMgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfbnZtLmMNCj4gPiBpbmRleCA3Nzg1NmY0NjA3NzAuLjZkMThjNzc1ZDU1MCAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbnZtLmMNCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfbnZtLmMNCj4gPiBAQCAtMTY0LDYgKzE2NCw3IEBAIGludCB4
ZV9udm1faW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPiAgCXJldCA9IGF1eGlsaWFyeV9k
ZXZpY2VfaW5pdChhdXhfZGV2KTsNCj4gPiAgCWlmIChyZXQpIHsNCj4gPiAgCQlkcm1fZXJyKCZ4
ZS0+ZHJtLCAieGUtbnZtIGF1eCBpbml0IGZhaWxlZCAlZFxuIiwgcmV0KTsNCj4gPiArCQlrZnJl
ZShudm0pOw0KPiA+ICAJCWdvdG8gZXJyOw0KPiA+ICAJfQ0KPiA+DQo+ID4gQEAgLTE3Niw3ICsx
NzcsNiBAQCBpbnQgeGVfbnZtX2luaXQoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ID4gIAlyZXR1
cm4gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KHhlLT5kcm0uZGV2LCB4ZV9udm1fZmluaSwgeGUp
Ow0KPiA+DQo+ID4gIGVycjoNCj4gPiAtCWtmcmVlKG52bSk7DQo+ID4gIAl4ZS0+bnZtID0gTlVM
TDsNCj4gPiAgCXJldHVybiByZXQ7DQo+IA0KPiBNYXliZSByZXBsYWNlIGdvdG8gZXJyIHdpdGgg
dGhlc2UgdHdvIGxpbmVzIGFuZCBlbGltaW5hdGUgZXJyIGxhYmVsIGF0IGFsbD8NCg0KSXQgd2ls
bCBkdXBsaWNhdGUgdGhlICJ4ZS0+bnZtID0gTlVMTDsiIHR3aWNlIGluIGJvdGggZmFpbHVyZSBw
YXRoLiBUaGF0IGlzIHdoeSBJIHByZWZlciB0byBrZWVwIHRoZSBnb3RvIGVyciBwYXRoLg0KSSB3
aWxsIHJlbW92ZSB0aGUgZ290byBpbiB0aGUgY29taW5nIHBhdGNoLCBhbmQgY3JlYXRlIGFub3Ro
ZXIgcGF0Y2ggdG8gcmVtb3ZlIHRoZSAiIHhlLT5udm0gPSBOVUxMOyIuDQpUaGFua3MuDQoNClNo
dWljaGVuZyANCg0KPiANCj4gLSAtDQo+IFRoYW5rcywNCj4gU2FzaGENCj4gDQoNCg==
