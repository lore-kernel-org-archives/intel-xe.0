Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4C5C531C7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 08:20:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F9C10E55A;
	Thu, 23 Jul 2026 08:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hU+OGo8L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC57310E544;
 Thu, 23 Jul 2026 08:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784794857; x=1816330857;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=a4vGf7Nyk2jRhjtTT3xQK+1RAmTzdOyd+6DeqIV/7KM=;
 b=hU+OGo8L3m5jrC1JhMGGACE80kMp1Y7Q7CUOMhFpsRMBg2gMjqLzPHjg
 EjX8PGVYBMsYSrzg7TnX7ppDqV4cvNUmUrip0o/1dkzN8XnOWCIvKyGp9
 AUN/z7fmzMNy0kGM90+FMUQEU3MicFLNpav6gZai1PhRvTs53hDov9bLH
 hW/wZZANzsr60Yv+qcSRsvwbHSJrKQoI/c4Io0mMo7xwc8rgZ422PDBKO
 vAMbnddx9MgueMdetccoacbHApV7M8aOzZI7ndYmEOn1iEvwL78NgnD9U
 +5AjQAGfC6FxfeEaKVdidyW+t7sY1IxT4Uws2kcNT20vsa4wlt3w7X2z0 g==;
X-CSE-ConnectionGUID: SjmK1MVUQRi2iVIif0Kzfw==
X-CSE-MsgGUID: 2y+U1/0iS/GO6nJlqIB2Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96815227"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="96815227"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 01:20:56 -0700
X-CSE-ConnectionGUID: k9aWHPZuSbWZcFsUN0OdPQ==
X-CSE-MsgGUID: Mu7kmcdgS3uRTVoQCautMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="257800655"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 01:20:57 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 01:20:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 01:20:55 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 01:20:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSoLY7igaPTpQLaLH3JdBc21VK1glDVeIzp6yO3hG0PZNhJLks5HGi5jqP2szq/0gZiHlD7YmBwjeH0/ioux61xt/lwdTuGIL3ip1sOISQTyPQTgsiXxPuOFhwZRkqpekmVGB8zH+/QVvDfw9YhhrPzFt5VqvjZAe19+Wi3mFFStLSybaxqUkhLZFkpIXGI9+wH1EY9Aai6rizR56IYbTZfcoRR0ns3SoHRHuR3bNx00x9IA9apAtlBEuUcQIWJ9+9agqRkSBN/va1KJovmQ+pBZvs6y/kHOftf4o3Z2LuKc1JmWKJIPtHhuQmg3VDZXRystqBCDLrWlGuVsqWZdGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4vGf7Nyk2jRhjtTT3xQK+1RAmTzdOyd+6DeqIV/7KM=;
 b=D6QwXTDjwER4kXT03f0420GEa3BjEWV0K9vab0kgBdvy2bESpPSMfp40X26yOHmg/ZI9YSk1tlnj4YkXt66Nd303eccnnHdcnnz4/koz86NMMcFe+xbMD0aCm1rZzwQmvvC4jIec08T7HN3t+PqN4ojSU/bQsQ9cKT9SV90kzwKcSY6p0kLriFnZuY7Xw89D2NKeWc+ejou9KIrrlYfDNuHbfQWcWMDwHKoBWblmvdG5KA3ScNKnk1IKF1cAfzehlbyfjfCk/eA6I5Ei3oT/AEWWIRYOJPufhLYqu3JFzPHpw0Tajutwg+dSQMeOUBWtt0cPYVURvmUMnEX825fVzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH8PR11MB6855.namprd11.prod.outlook.com (2603:10b6:510:22c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Thu, 23 Jul
 2026 08:20:47 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 08:20:47 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 2/3] drm/i915/fbc: No need of any hardcoded plane width
 limit from LNL+
Thread-Topic: [PATCH v2 2/3] drm/i915/fbc: No need of any hardcoded plane
 width limit from LNL+
Thread-Index: AQHdGd2O+A6VYCe3HE6KA3AdfmYJ8LZ6xJaA
Date: Thu, 23 Jul 2026 08:20:47 +0000
Message-ID: <6d64decfc28654359cb529cfa87130880528cbdd.camel@intel.com>
References: <20260722132448.318112-1-vinod.govindapillai@intel.com>
 <20260722132448.318112-2-vinod.govindapillai@intel.com>
In-Reply-To: <20260722132448.318112-2-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH8PR11MB6855:EE_
x-ms-office365-filtering-correlation-id: a9e98231-d54a-42d1-f063-08dee8934c6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10070799003|38070700021|3023799007|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: Ky8wtyTgYdil0cFa6e7i9NJTETA9T+gOoDXBRXbdLU4Jb2gr78EX8mo21AJE2PlotweGdN9ufTthrl//0GE52oKt+0nVPEyuxISZIBOHRLSkoW0XrHn4j+QkxN9b7nrYpw+AfgDksDY+mYSzOuj+s/8S0VVXO6YTXJN4Q6wQ7MQM8ZP8tINTE/CjF7G4iBBqM8VCYEPVXYJxFZGj4rret9eT0dCiLr9R2bnMdXMcHlNPDxPQYkCAsFsFaWrGDhg3FtNcZcKbg2cJ7SrS1Xt//zfp8Eonj2gAOXMe8G78GNJ/QiwGlDfI55Tm8d0jXrm7vvgoi/vLlerk97kb8nWPkTEWPkOxWsWTM7MUUKEkg5LjJwywneLxbV8QxjMvC2ZiDy3Raidx6w/bJedRDX3i8bI2TYlJfcrqIs+jJh4W4l1+0P01YCsnkdm/kgrydWoqlLDXH24u7nwQsT6GxQbmjO9AO3TQ2v/pfdXAKYaWeCqzYb+/8EBbp4uD44/7mRPXQbZoyWBy4sGO7IgmVhrIuGPYTVH1InXYS+Ry1Q9jz0ZohK0q1hrsFmwiVFKd/Mu6pQqvzK6ST+96+U9lluA0JFFA7o3rjRth6yP/Zjx5ibUFN4g9cekGx8AXf8QlBxtR1dRvQJGqSQrvWLFFCec4dpyq2gy4kBQMzSzcufIBEhjvss9HuwNfLyELDBnRQYlm28uhUEGWbf7kJ6eD31+EsD2iNx5L+S6TOuY/Hl02iTw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10070799003)(38070700021)(3023799007)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RldNeTl3cmFwYUU1dkRWS3FiWWlsbDZXVXdXbDc1STZrNHRoVzlOaXJ2dWJE?=
 =?utf-8?B?Z0tyNEVib3JxU0FvZEQ0b3pWOSsxUDFlTU5tTzBCT3dWUEFYbUJwZExGMHI2?=
 =?utf-8?B?dlFNelI3M0lIdjhuNE1CVnM2Q3NTUzRMMnNkd09pVW1qQUpJNWM2a2FGUWhw?=
 =?utf-8?B?M1VwbUtPY0dyRkdQUFF6eFYxdjJXRXE1bWpMd0VOTGFrQzBpWktyL3ExeklQ?=
 =?utf-8?B?dElOV0pBZlRCQjRFQmtuTDBYODJNVHo3NTFROVUzTHQ3djQ3TldXWnI5L3Fz?=
 =?utf-8?B?cm9aZVRaVnUvV1JFL2psbXI1TFpYWFhHc0pVcTRIUU5TeDJLN25lNEE4SUtx?=
 =?utf-8?B?MGZ6bFM5N3FIRjNSM29VLzdQMUYzUms2TldJMFduMDY1Y2ZkeHhYbHorY1FV?=
 =?utf-8?B?M0cvZ1A1WDJIdkJIditMMTlXblIyclpzcDB0WnVGc3VvZVpobWJNL2lIWlR0?=
 =?utf-8?B?Y3ZKNjRWQ291di8yMExpMCszMWJ4ZDZzTFdqWHR2bFZxZHhPejhieC9TSkcy?=
 =?utf-8?B?K3FWdWVvb1M0Q0VkdEg3OG5kWmtXaWFFYithK2JJYXZ3Y0gyNVdYR0tueXVC?=
 =?utf-8?B?a29LS21pYlBSaURwQ05UdVpEMUpUUmRQOElPYTRRRFlLRS9KRzROK0xQRlVp?=
 =?utf-8?B?MFNmWWRUQTJXZUdKeFRrVmcxQy9LU0lhOTAvd1RkK2JTekl1MXRXWWdTOUhp?=
 =?utf-8?B?OHNjeXNxWGRSODNwSlNqUDBDQzJzTXE1Ulc4U2RBdDRRWHZyTTBCdHdlOTZL?=
 =?utf-8?B?L3A1UmpBRGh2OCtrWmpPVVpKcFpjOXRwS2M4elJieHo3ajBweHFQcnRZdUw3?=
 =?utf-8?B?L1BCWWgwSEdhSkl6T2xzS0RDU0FKcE8zRDJ4Y29WakNJMFZzVGVxeHdkVEZI?=
 =?utf-8?B?U1NYOUphZFlvNVVFRFptVk5JTXdURW9hVWg1N3I4ejhjZnozNEdtOU4reHFy?=
 =?utf-8?B?dVNQTEpvTVk4bGh3ZmF1WjZVZXZ4T3dFc2VucHl2S3o0MVNXZGpBYnBrQllS?=
 =?utf-8?B?dEh6cVRRcGJyL3FkOHViUmdRc242d0xpQndMZFVwTkZpd2dyeTVwSEh6bElO?=
 =?utf-8?B?M3pmcWtiRmdDZnczU3g4QUZkdXJXa3hLQkJCUzF6MmdZTThJR0RuSzdzY2gz?=
 =?utf-8?B?RlBHM0tYUGphdFVmcFovcTRtd3pBS3dtVU9SNGdTS0M0QTJSbHRvUXdKQjNK?=
 =?utf-8?B?UnUyTExGOVBNd0FyYkF6a3ZRODUwS243WUxKZG95SmpOeG9OK2hyUDJuaUEz?=
 =?utf-8?B?aU1YajVmRVlqeC9VZDBlaFBjaDRVVU1QMXZ3ZUExcXNWc1dteGRzaTZMRkl6?=
 =?utf-8?B?SVBPVkFFVmNvMnEyZXpUU1VQa243UlRrdGJOV2JGRWozVzAvVElBN3l2aTN0?=
 =?utf-8?B?eEtKb3Q5dVBqekhKbUd1b0Ewa29pVkVvWHdwUy9pSnZBaTJuUHVVSHd3YlVD?=
 =?utf-8?B?V0JEOG85eDFDNXZzV092TWhqd2RZVTlzSTlQb01oSFhqOU1RZFBkWnUxR3RC?=
 =?utf-8?B?NkZCM2tYTmlBRVV3Y2ZCajhuUTNvd3dZMzR2bUVTOFVzaS9UY1ByTWV2ZU43?=
 =?utf-8?B?aGFEL1dUcm9hM1l3SnFHWGkyYVMyRlhIQURzcDFZZXN6U0p1NlYrN1ZtaVdY?=
 =?utf-8?B?VFJ3b2xnZFdXeEl5WTRPLzAzcVBvMFh2dSthQ0ZsbWduYmpDdGdSdUE2MFJ3?=
 =?utf-8?B?aG11N05Eb1VKbHpvcGhqdjlqRmxWK09qVUsrQWlkV2xRMlVHS3J6bk00azRh?=
 =?utf-8?B?R3MrQlNlTmhITE55UEpwbkMvREwxWGRhSFd4RW9pTEtBTHFWQ3dSQmN5SVRK?=
 =?utf-8?B?alEvcHlHbVJJbjZaQmZOYXRGcG1ueGtpSjdjaU8xWVA5YW51WnFrRmU5aGh2?=
 =?utf-8?B?S3NQT05qZEtDRnZ4Mm9sRnEwcVJkNkhDdDJxTWNQUXpsMUtHQUk0R00wNHR1?=
 =?utf-8?B?N1ZFT01rUWR1NHg4a1FYZ3Q0NkZBWmxuemphRG5IelFUY0ROalNCSGcvbFBG?=
 =?utf-8?B?MW9EdmZ5U0NQZk5ST3pURXoyeGFzaEE4a3NELzZtaGtFcFQ3Zk95Q2UwaFFN?=
 =?utf-8?B?UWViUDVyQ0VraHVBMUdSS0JYczFwWXdGWHlRaXFuc1gybHNXTUpDaFNoTktU?=
 =?utf-8?B?MFZwdEFZSkZvb1QwOVRLSmJnYzFwZ3haL2o5eWdRSnpuS2dVUi9qbnNvWU1P?=
 =?utf-8?B?SjgvMzdHb2NFOXgwZElOTlNuN1B6MFFldmlUNzJqalVVVktYcFV6SFNCWm9I?=
 =?utf-8?B?bjlVWE1tNHRFNUNnZVgwS1llRkdBdHZrdGRSSGEyaytEOXlOaFRQVzZKbUtD?=
 =?utf-8?B?cUxDVVBaZlMzM0JqdFJnbllFTVNsOUpra3VFSVQwamg5bU9KTkFsQ1BhT3gv?=
 =?utf-8?Q?3rQxOds7qNCqA8V7zGBlq/oNj8qx1gniF8+wgICURNnfC?=
x-ms-exchange-antispam-messagedata-1: NYC7Hvn15IXK9GyODs9msmkFVUD4DibYkDM=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4DA545334638134EA56F7B6B2D8F77E6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jxiHJPBtxR0UfRMa6Jyqp9MQjXIu1veQVQKF97E1uKUkhmQKC5TvmWaCmo7go7PGtZ0brijjU12dLIAQduh90OI1VNbL2ec61PjjvAOQmd6rZTKoBVWnFhXEoze3nwJgrowhbd96l2GNygDb2diwNfXPDD90tB9ZF9xTOb2nGCRxPWskDUicRjgQfNYtJpEeB3LXy4kmvlFRxFwGbVV1AVYl15is65Hg/HwX2X0j4z2r8Wdd1OfxW2KYIGa3z3zjw6lTguJpnc82S5yUeknGYXEs+sBqlt8O3gEHaBRNWhXliAbU3wbf9bcpMDCibz+fGCejAE2sVnsLmBgh55A4QQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e98231-d54a-42d1-f063-08dee8934c6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 08:20:47.2466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vf2EOziH//PHchkDmdMOF6AzuNZYxRu2dY2tby6xvxNu/cKHuzlbr63UUWeQpGiptvPjlSB4vfPBI3tGFccrI29ZzfJDEkMbZWROoJNYYRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6855
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

T24gV2VkLCAyMDI2LTA3LTIyIGF0IDE2OjI0ICswMzAwLCBWaW5vZCBHb3ZpbmRhcGlsbGFpIHdy
b3RlOg0KPiBJbiB4ZTJfbHBkKyBwbGF0Zm9ybXMsIHRoZXJlIGFyZSBubyByZXN0cmljdGlvbnMg
dG8gZW5hYmxlIEZCQw0KPiBvbiBwbGFuZXMgd2l0aCByZXNwZWN0IHRvIHRoZSBwbGFuZSB3aWR0
aCAtIHdpZHRoIGNhbiBiZSBhcyBwZXINCj4gdGhlIHBsYXRmb3JtJ3MgbWF4aW11bSBzdXBwb3J0
ZWQgcmVzb2x1dGlvbi4NCj4gDQo+IHYyOiBwYXRjaGVzIHNxdWFzaGVkIGFuZCBjaGFuZ2VzIGlu
IHBhdGNoIGRlc2NyaXB0aW9ucw0KPiANCj4gQnNwZWM6IDY5NTYwDQo+IFNpZ25lZC1vZmYtYnk6
IFZpbm9kIEdvdmluZGFwaWxsYWkgPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50ZWwuY29tPg0KDQpS
ZXZpZXdlZC1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQoN
Cj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmMuYyB8IDE2
ICsrKysrKysrKysrKy0tLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2ZiYy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9mYmMuYw0KPiBpbmRleCBhN2QwMmRkNmNhOTYuLjIwZjAyZWY5Mzg3YSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmMuYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiYy5jDQo+IEBAIC01OSw2ICs1OSw3IEBA
DQo+IMKgI2luY2x1ZGUgImludGVsX2ZiY19yZWdzLmgiDQo+IMKgI2luY2x1ZGUgImludGVsX2Zy
b250YnVmZmVyLmgiDQo+IMKgI2luY2x1ZGUgImludGVsX3BhcmVudC5oIg0KPiArI2luY2x1ZGUg
InNrbF91bml2ZXJzYWxfcGxhbmUuaCINCj4gwqANCj4gwqAjZGVmaW5lIGZvcl9lYWNoX2ZiY19p
ZChfX2Rpc3BsYXksIF9fZmJjX2lkKSBcDQo+IMKgCWZvciAoKF9fZmJjX2lkKSA9IElOVEVMX0ZC
Q19BOyAoX19mYmNfaWQpIDwgSTkxNV9NQVhfRkJDUzsNCj4gKF9fZmJjX2lkKSsrKSBcDQo+IEBA
IC0xMzE1LDEwICsxMzE2LDE4IEBAIHN0YXRpYyBib29sIGludGVsX2ZiY19zdXJmYWNlX3NpemVf
b2soY29uc3QNCj4gc3RydWN0IGludGVsX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0DQo+IMKgCXJl
dHVybiBlZmZlY3RpdmVfdyA8PSBtYXhfdyAmJiBlZmZlY3RpdmVfaCA8PSBtYXhfaDsNCj4gwqB9
DQo+IMKgDQo+IC1zdGF0aWMgdm9pZCBpbnRlbF9mYmNfbWF4X3BsYW5lX3NpemUoc3RydWN0IGlu
dGVsX2Rpc3BsYXkgKmRpc3BsYXksDQo+ICtzdGF0aWMgdm9pZCBpbnRlbF9mYmNfbWF4X3BsYW5l
X3NpemUoY29uc3Qgc3RydWN0IGludGVsX3BsYW5lX3N0YXRlDQo+ICpwbGFuZV9zdGF0ZSwNCj4g
wqAJCQkJwqDCoMKgwqAgdW5zaWduZWQgaW50ICp3LCB1bnNpZ25lZCBpbnQNCj4gKmgpDQo+IMKg
ew0KPiAtCWlmIChESVNQTEFZX1ZFUihkaXNwbGF5KSA+PSAxMCkgew0KPiArCXN0cnVjdCBpbnRl
bF9kaXNwbGF5ICpkaXNwbGF5ID0NCj4gdG9faW50ZWxfZGlzcGxheShwbGFuZV9zdGF0ZSk7DQo+
ICsJc3RydWN0IGludGVsX3BsYW5lICpwbGFuZSA9IHRvX2ludGVsX3BsYW5lKHBsYW5lX3N0YXRl
LQ0KPiA+dWFwaS5wbGFuZSk7DQo+ICsJY29uc3Qgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIg
PSBwbGFuZV9zdGF0ZS0+aHcuZmI7DQo+ICsJdW5zaWduZWQgaW50IHJvdGF0aW9uID0gcGxhbmVf
c3RhdGUtPmh3LnJvdGF0aW9uOw0KPiArDQo+ICsJaWYgKERJU1BMQVlfVkVSKGRpc3BsYXkpID49
IDIwKSB7DQo+ICsJCSp3ID0gaW50ZWxfcGxhbmVfbWF4X3dpZHRoKHBsYW5lLCBmYiwgMCwgcm90
YXRpb24pOw0KPiArCQkqaCA9IDQwOTY7DQo+ICsJfSBlbHNlIGlmIChESVNQTEFZX1ZFUihkaXNw
bGF5KSA+PSAxMCkgew0KPiDCoAkJKncgPSA1MTIwOw0KPiDCoAkJKmggPSA0MDk2Ow0KPiDCoAl9
IGVsc2UgaWYgKERJU1BMQVlfVkVSKGRpc3BsYXkpID49IDggfHwgZGlzcGxheS0NCj4gPnBsYXRm
b3JtLmhhc3dlbGwpIHsNCj4gQEAgLTEzMzUsMTAgKzEzNDQsOSBAQCBzdGF0aWMgdm9pZCBpbnRl
bF9mYmNfbWF4X3BsYW5lX3NpemUoc3RydWN0DQo+IGludGVsX2Rpc3BsYXkgKmRpc3BsYXksDQo+
IMKgDQo+IMKgc3RhdGljIGJvb2wgaW50ZWxfZmJjX3BsYW5lX3NpemVfdmFsaWQoY29uc3Qgc3Ry
dWN0DQo+IGludGVsX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZSkNCj4gwqB7DQo+IC0Jc3RydWN0
IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkgPQ0KPiB0b19pbnRlbF9kaXNwbGF5KHBsYW5lX3N0YXRl
KTsNCj4gwqAJdW5zaWduZWQgaW50IHcsIGgsIG1heF93LCBtYXhfaDsNCj4gwqANCj4gLQlpbnRl
bF9mYmNfbWF4X3BsYW5lX3NpemUoZGlzcGxheSwgJm1heF93LCAmbWF4X2gpOw0KPiArCWludGVs
X2ZiY19tYXhfcGxhbmVfc2l6ZShwbGFuZV9zdGF0ZSwgJm1heF93LCAmbWF4X2gpOw0KPiDCoA0K
PiDCoAl3ID0gZHJtX3JlY3Rfd2lkdGgoJnBsYW5lX3N0YXRlLT51YXBpLnNyYykgPj4gMTY7DQo+
IMKgCWggPSBkcm1fcmVjdF9oZWlnaHQoJnBsYW5lX3N0YXRlLT51YXBpLnNyYykgPj4gMTY7DQoN
Cg==
