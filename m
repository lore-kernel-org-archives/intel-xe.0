Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C62DC54736
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 20:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E08310E40F;
	Tue, 27 Aug 2024 20:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TBLqawq2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB8110E40F
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 20:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724791249; x=1756327249;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=cSkLU3seT3HTJ2xaSBQTGalvjGUTbMnB20KBEF11eCk=;
 b=TBLqawq2QR4oWkvq/CtIIA5KkQ0qr7V94cNpOazDdPMTJr/0zB34RmS0
 GjzTL0hcJJ1FcL8zikRyrmVAJkEX4PmJSp0s/sASlqXxeyvtlk6kGcxjk
 o9ZhfzgnBltXOih7Ugji/aos+B/tw3QNaaGUf6Ht+/KtX2qr5bNljrM0p
 mdxcuUJ0Qgwa3cGPxAvh68lc+L0UUz9NQO4ZCU6XJBUaJ0mLPtrtg/2i/
 TjHIkROuDCNTI9HTphlOsW2CwEqpY3gSWSVoAKmbFfrf2z/QmpmcbjBHK
 /6G02mQpS1mMkZZRl0pyPA4W7XdhLZbpQzpoqIGkRwXtkvgghQB1w+dhC Q==;
X-CSE-ConnectionGUID: jSQ/rXP3SdCQEIfD4X2jnw==
X-CSE-MsgGUID: Rr9YNk7sSDq2XQwBevHb7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23455103"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="23455103"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 13:40:45 -0700
X-CSE-ConnectionGUID: x5jX66JDSk6xIG0v1XqCAw==
X-CSE-MsgGUID: r/2WLV/6TUuJXJSD6IeRhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67818505"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 13:40:44 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 13:40:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 13:40:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 13:40:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 13:40:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GgRFuBW3vDJgrkcqUhLUX8AGZvjtFkrYOUFwq3C2mfNl6QpAEhHCA4vaNPnmj4PEP8xG7TKvryY4qULpWzqnli+3dMnJTwl7PHidpQHlg8YXH8y1ATggV9yUMTOUe4gYvdWc/nS3GgWeY02gJcg8IAG+cJMxzM2wq1yymhOAOGnH/A58qFNqLAgaD5XjMMWzs+qM963Tr8/hzaFXAAAyZ88aUJ8Xxi/TBbPgx4w6E8/3CRHuu19JXAAjJnvWWjziqNCuFHsnif1l+++MN7sxs2buSKTB6HYkOIbPelkghflG4x+PeobSsE+2mT3dnJkhqamP9DYzkeoTdTjJ+U2CJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSkLU3seT3HTJ2xaSBQTGalvjGUTbMnB20KBEF11eCk=;
 b=fiiqRXmfTtyCRPhqUmLXu5aGgeS/6Cu03oPcHW1d7r3/MYBv2ohx5KpACgtOIvZIsEyS+9xooaQ3LP97GWXC18SP1+8g+0oPQkyAVL9TH8KnZQmNBxD47q4EdTGiuyYJ9QQdHo7Xig3Dm3/+eo232vEeV4HLRCHckt4XwvXRhjG+K4tPAStk386Y4U+ce4myQ9Q0Ha2lFcLxvXLw3b5CgH75r67kLLvETajUz/T1hifWa/BqCLAcxYSIwTBqNLM8AFczm3Z/0DSrW2ssFWQXXt7oF+6ImfCpiaZb1JuCLTZh3k2tUJ/UMeZe8Ys2rOwNTYgcJxYGc1U2vh/HgfBcrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Tue, 27 Aug
 2024 20:40:34 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%4]) with mapi id 15.20.7875.019; Tue, 27 Aug 2024
 20:40:34 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v16 5/7] drm/xe/guc: Move xe_lrc_snapshot to header file
Thread-Topic: [PATCH v16 5/7] drm/xe/guc: Move xe_lrc_snapshot to header file
Thread-Index: AQHa8qZfm2fMNfAnDk+Le0gd6jXBOrI7nWsA
Date: Tue, 27 Aug 2024 20:40:34 +0000
Message-ID: <c13ca1bc95e69e523a2ccc32c77b092687679d3d.camel@intel.com>
References: <20240820021142.436536-1-zhanjun.dong@intel.com>
 <20240820021142.436536-6-zhanjun.dong@intel.com>
In-Reply-To: <20240820021142.436536-6-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SA1PR11MB6614:EE_
x-ms-office365-filtering-correlation-id: 2d7a2484-ef15-44c7-c9d8-08dcc6d8801a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NGZiUC9OUGd6WHZjQ01Nd0VCNkFVMkJXcEExckpoeGNmbjhJeFU2UU5kbUtE?=
 =?utf-8?B?R0oxVlpqMHI2MVJBNEdycUZjci9wdllyTkhLMzRaSTBPaXB4U1FoZkU2ajF6?=
 =?utf-8?B?TXUzVEcyUzFoVjNGbTdyOWNxZnJkYlJRMG5NcWNkMFV0UkQ4cHVHV1ExdlEv?=
 =?utf-8?B?NDZXa2EwWEFRV1pyckd5c0drWTgwWGsybzVMa3h0dXp6SVVCR2ZIS2VObjc3?=
 =?utf-8?B?QTZxQzZYbEQ1aE0zQUJIbWdVWUhsa3htU2s4aGJtTmhHbkpEbTREZmltWHF1?=
 =?utf-8?B?TVZmVEY5bDJIdEtPd3o0Mm1JNk1JUHJja24vaTRkdlJDd21wcGdoMlpPOTB5?=
 =?utf-8?B?V0R4QXo0Y1lLczBMaTZsMGVGd25QUEdGcE5kc1UyS3NTdnJaQ2lEYklrazJS?=
 =?utf-8?B?ZVVNUFA1ZDlKTzJ4M1hka05LWHJDM0kxeFJ2VWJvZ2Q5elc1Skt6Mm4xMGFN?=
 =?utf-8?B?cW9UQXVMY1IzZ1AvSkNoQ1hEYWFOc1FGTTVUUXU4UkZ3YWU3RTVLOU5nbzg5?=
 =?utf-8?B?S0g0aVZwK1cydVFCTGRnUmpUM0hvS1l3eUhmQVRxdmlpYVp0MW1XdDY0bVZm?=
 =?utf-8?B?SDdXNXBpUDA3UWkyWDcrVmQvQVNKajhhRnJ6UGk0RE05aE50VHFxWi80dlZY?=
 =?utf-8?B?MWI0dDBzRmlGeGNGR1I4NWYrUHdWbHF6OWFzeUtBdFpOcHljcVdSMU5WQUhS?=
 =?utf-8?B?ZWNiQzNpZnQ1Y1U2cjBlbUlueUVSWkI0UmsxOUVUQktBZkdOOXpPUzczVlA3?=
 =?utf-8?B?TmVYV1Nuci90bzlvM1d1eVJ4cUNSUzlKYThHZThxWUNUOHlXWTNrR3JJMXR6?=
 =?utf-8?B?RDlDOVRsZVYvS1pTVHJWQngyRTl6T0ZodWhpcGUyVWZQZENxUDZUT2lJd3BM?=
 =?utf-8?B?aWQvaVRIdUhiWHNObWxVVDVNa2tyK3gvVmgwWEowWmtJWnBDdjFZQnhJVFA3?=
 =?utf-8?B?dkhBWGhtMSt5OHhnakZZT053RzBpc2VOVWRBZmR1SER0TmUyMXJMbHpTRnN0?=
 =?utf-8?B?U3FNRFVjSGNtdGhsZHpXTDhybkVYQWVCMWIvc2tjK05odkkwbU55U3FrUEFF?=
 =?utf-8?B?NW84RUM2TWNRVGZHRUZ5dkdzTmFRTHhtZ3hldldwOHh1M3RVSE45YisxYjQz?=
 =?utf-8?B?QTgvTkViQWpRSjE2R1FMOGMvTTk0RmdmaUdheGxmeHlrVzJDcVZPK2dNZUdE?=
 =?utf-8?B?NG9FQVlJd0lZZFU3dkRNSXJnK28zYTFKWUNuQUkzTTQwNG5rV0hNb3YwZW9W?=
 =?utf-8?B?TkVRT3VqOTkrSERzaStjOEJIQVlxT3A5cGJEcEhpeXU5ZkM3S2xDSng5MkFR?=
 =?utf-8?B?WUR6VGdDMkhNRXdmUTBtd1Y2QkN0YzdFSlc1SEh0Yy9XSU50bkdaUFZ4TlBV?=
 =?utf-8?B?ZjI4TlZ4dnFlcWJMUUozdStReTBxeVVnRks2eUZMYTl6d294OWFaOXV3dFJj?=
 =?utf-8?B?Ykx4d2lIODBpLy9PK2ZjTjdoR1Q4OWU1RjVWcGZzeVhvUjRPZXdaOVlDL2k0?=
 =?utf-8?B?OUpxb05lK3pZOXhTdXlHWStyNEtXZm5qbkE0bWRrdTJFdWErVnpxaVFwYUhI?=
 =?utf-8?B?c3QzNmpRRVRPM2x6VXhpd2ljQzZqRUxGNDg5NU1UT0R1V1Axb0N5eFo1NHJr?=
 =?utf-8?B?K0d3ZFV3Q3RJVVo3N2o0bEM2UlgrdzUyUHY0Ry9ITkRsYlRJSGxwdFFJSUow?=
 =?utf-8?B?N0NtN3ZVdmgvYXo5alBFenBITEZPYTR5d0pjd3JibUVlaWxyQTVBR3l2dS95?=
 =?utf-8?B?LzBsRndrL0lHdHE3MHRjRnQ1dkh3S1dpOXJURXR1aXVORHRkVTZkSjZVd0ZE?=
 =?utf-8?B?SW5QaVBxcmNlK1NQd1FKM0RoNWw0eGRrNS9YSlIvV2RUOERnc2htSkJKQ2My?=
 =?utf-8?B?YzZzV2dTZXRzaCsyRkRpZ0QzRzhaMlJLVEo3MGkzQUxrdmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bXBlRlUyRHVHemVaYlgvTUE3cW9ySVlsQ1JKTm9xdW9VdTJyUnRxZDJka3BD?=
 =?utf-8?B?bEFXVDhvNXdHTVMwMW9FMG1iMlhUdXY3QjZQNlVuSXJmekZlRFFUMTh5OFhk?=
 =?utf-8?B?RysyemtjNkt4ZURLQWUyMjhCVDdXZ2t1eVFiT3JNMWxpMG42NytrM0tZRi9q?=
 =?utf-8?B?QjIzMDhJMzYyWU1yUWxjM0dyMytzSXpXY3FQek5QWm9PbHlMRzM2U2l1QURX?=
 =?utf-8?B?aytNT0FQNkJLci9VOFUyYVdCZGd0aTdSTjlsejFOL1JlSGVvQ1hwVXlpTU9S?=
 =?utf-8?B?ZUNYRkdGdHd0bG0zQjRJTWdrNEY0dzlhbmNSMU9Qd1VIUjBXWFJiZUMxaVFr?=
 =?utf-8?B?RmpVTm1TeDFMd0NDbU44c3Vzd0JkSVd5dWNuWkNJSzJhZnpVTkltQytGMGhm?=
 =?utf-8?B?clN2SzNMUXdQVzUzMTF3YU0zSEJ3eTNRbFNHaGx1b01uVU8vN01VeWF2Z0RJ?=
 =?utf-8?B?V2VtVzJuaWFJRXNMQVdNYVJrOTVSWXpQQWZPakZ4b1hhdSs4MkFmMTZKM0RF?=
 =?utf-8?B?M2QxVUpQTE4xeG1CMTdhdTRIeHVQVDZ5c3NkSWRqa1VhZFZYc1NINnZkSE9F?=
 =?utf-8?B?Mll1SHZaQWU4MGhrN1I2RXRZZTBTVDRGZzU1T0VsTUFMZjRoQ1RRRDFOcHFX?=
 =?utf-8?B?MHkvZ2VHZkNOZ3h1RTZvcEVOZVdTMWE3ODU2cjFFbEtCQTZIamxJSUE2SnEr?=
 =?utf-8?B?NGJDbXVwSExOeVliQmZpSlh6aXU0ZGtkWEtPQStVdDlvb043Vk9VNzNvekha?=
 =?utf-8?B?cjNyc1duNWd4dEtGZHNZeWdWME1iams3UnpTVlNqd0JjTnU3Wnh3Wnd5OGha?=
 =?utf-8?B?OGNsd3lIWWVmb0VERHdVeFZLSmhMTFNUYkFMdW9PbTZHUnpZbm5sZUtzM2lq?=
 =?utf-8?B?NHNpUjdpdDBsNnNCNEF4UnhYbnRvb3BlTkxla1BWKzV4UE1DRVllU1QxMTNp?=
 =?utf-8?B?QlZ2bjUyT3RRbll4aGo5Wmh5NU0xazVzSWxUUEFDU1RvbWEySHFZMzcyYjQ4?=
 =?utf-8?B?ek41S0RaRVBPTGlqN2g2V2d3MVBhRjE5NllvMlhNa1lyYm9tZHJaYTdTOHNk?=
 =?utf-8?B?ZnQyOEVmK2FCR1c5c3ZRTktyWlE2czVEbFdRY3ppbzRvM3FPKzBXRG5BU3Q5?=
 =?utf-8?B?RzBPeXFlTWlTY3hCUnhQNEkvdForY0NaNUF2UDdiYVVGYkExTllyT3NxT3d5?=
 =?utf-8?B?cWJiYWtidi9lbXU2MmZJeTZxT1BmMzUrRHE2MlgwZkpQY2FNWTIrcHppYVRw?=
 =?utf-8?B?ZEhvZVhaeWFrSmZYRXNZdEVsajVRaE43QXY3QTZ5bjZmQ3Z0YzNKdUdEQ2JP?=
 =?utf-8?B?SlNRQWJFMUIwNDNmT3ZFNWlSRWg4WHlDOGtnUEpLUEpDZ3hvN1MyMllBdDR4?=
 =?utf-8?B?dTRSTldOY3hzTU1zdDdhRUdWYSsyS3JDdjZ1ZkZONHpsMzJLdFRjdXh4b1My?=
 =?utf-8?B?WmFBN3d1d0pvalZXNnhIL1VHa2JNMk8zNVFQbVk5MkhyL0I3endIVGZqWnZu?=
 =?utf-8?B?Rk0zK2wyeUI2czRpZlorM1RyMko5dy80L1VuSjM4YWpPOGxLZGhQWlJGWlJP?=
 =?utf-8?B?cnAvQkhXMm5TT281cC9mT0Z5M0lET01FRFBVNDlFMXBtWllQNkVGK1hUZjcr?=
 =?utf-8?B?VzRDbmlYUG5SdjUxWlhUdm9HMDlpM3psbjV4WjZSTkgvUytqNjRqVlcyd2I1?=
 =?utf-8?B?MGVBLzJtZTdQaWFtTWN6TjJ4Q1gzbUtnVGY3Vm5QOE4xSUI2SCtaOXFzaTVp?=
 =?utf-8?B?eUx3QmlINXVtMEZYRmEzYnMrd1JwM3l4SXdoa0VpSWE3QXV4VkR3bWw3ZlM3?=
 =?utf-8?B?UjFCQkRsaFBCTURicnFSMXNaekhhK1c1QWFzZVhRQm9yeFREenByejhZT3JH?=
 =?utf-8?B?TzhaRXNrZkhZTTNxNXVzSEdEVThiYlVva3ZpTlJkdGlLNWpwRFZIN3Vnc1lV?=
 =?utf-8?B?aTUzYVQ5Z1VBVlhLWjNNcHZSSFE1c3JLMHJxOEpFcTRGMlVUY2JBMEtaZll4?=
 =?utf-8?B?aTR6QW9XT2VjSEVqODhpVnBwUFlsZUkxSnl5ZmtpSFRoTU95YmpiQUhkTFB4?=
 =?utf-8?B?SzNmZS9TaW1zWGFxVXdtMldrdExtbm5hYURHR2lIVUZNRFB1dHN6NXZZT1ZH?=
 =?utf-8?B?SDFuSzRTblVlaGxNYzRvWWpVUytBakNBR2pSK05YYlNtaWlDMEt6bU5QeUtk?=
 =?utf-8?Q?9Dsqm7kodHIsFiU4waNqLio=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AEB0AE77A87B7242B05C7A58086084F4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d7a2484-ef15-44c7-c9d8-08dcc6d8801a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 20:40:34.4155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EdrCdkcPVfMHcHfURLh2PGl9ZckB3dwOx9MMg5gReddd/mroewYXXgieLX+Y9l2/cW47BtRvz6bXvFsX8IZanqStiIuGo1s7snOFFE9sRIvu5YSVjg1tpPVxMLSUAE2k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6614
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

T24gTW9uLCAyMDI0LTA4LTE5IGF0IDE5OjExIC0wNzAwLCBaaGFuanVuIERvbmcgd3JvdGU6Cj4g
TW92ZSB4ZV9scmNfc25hcHNob3Qgc3RydWN0dXJlIGRlZmluZSB0byBoZWFkZXIgZmlsZSwgR3VD
IGNhcHR1cmUgZmVhdHVyZQo+IG5lZWQgdG8gYWNjZXNzIHN0cnVjdHVyZSBmaWVsZHMuCj4gCj4g
U2lnbmVkLW9mZi1ieTogWmhhbmp1biBEb25nIDx6aGFuanVuLmRvbmdAaW50ZWwuY29tPgo+IC0t
LQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyYy5jwqDCoMKgwqDCoMKgIHwgMTggLS0tLS0t
LS0tLS0tLS0tLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjX3R5cGVzLmggfCAxOCAr
KysrKysrKysrKysrKysrKy0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwg
MTkgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9s
cmMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYwo+IGluZGV4IDk3NGE5Y2Q4YzM3OS4u
ZDM1MGZjYzgxYjRhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYwo+IEBAIC0zOCwyNCArMzgsNiBAQAo+
IMKgCj4gwqAjZGVmaW5lIExSQ19JTkRJUkVDVF9SSU5HX1NUQVRFX1NJWkXCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgU1pfNEsKPiDCoAo+IC1zdHJ1Y3QgeGVfbHJjX3NuYXBzaG90IHsKPiAtwqDCoMKg
wqDCoMKgwqBzdHJ1Y3QgeGVfYm8gKmxyY19ibzsKPiAtwqDCoMKgwqDCoMKgwqB2b2lkICpscmNf
c25hcHNob3Q7Cj4gLcKgwqDCoMKgwqDCoMKgdW5zaWduZWQgbG9uZyBscmNfc2l6ZSwgbHJjX29m
ZnNldDsKPiAtCj4gLcKgwqDCoMKgwqDCoMKgdTMyIGNvbnRleHRfZGVzYzsKPiAtwqDCoMKgwqDC
oMKgwqB1MzIgaW5kaXJlY3RfY29udGV4dF9kZXNjOwo+IC3CoMKgwqDCoMKgwqDCoHUzMiBoZWFk
Owo+IC3CoMKgwqDCoMKgwqDCoHN0cnVjdCB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHUzMiBpbnRlcm5hbDsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdTMyIG1l
bW9yeTsKPiAtwqDCoMKgwqDCoMKgwqB9IHRhaWw7Cj4gLcKgwqDCoMKgwqDCoMKgdTMyIHN0YXJ0
X3NlcW5vOwo+IC3CoMKgwqDCoMKgwqDCoHUzMiBzZXFubzsKPiAtwqDCoMKgwqDCoMKgwqB1MzIg
Y3R4X3RpbWVzdGFtcDsKPiAtwqDCoMKgwqDCoMKgwqB1MzIgY3R4X2pvYl90aW1lc3RhbXA7Cj4g
LX07Cj4gLQo+IMKgc3RhdGljIHN0cnVjdCB4ZV9kZXZpY2UgKgo+IMKgbHJjX3RvX3hlKHN0cnVj
dCB4ZV9scmMgKmxyYykKPiDCoHsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2xyY190eXBlcy5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyY190eXBlcy5oCj4gaW5kZXgg
NzFlY2I0NTNmODExLi4wMTFkNDYwN2U1ODUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2xyY190eXBlcy5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyY190eXBl
cy5oCj4gQEAgLTU1LDYgKzU1LDIyIEBAIHN0cnVjdCB4ZV9scmMgewo+IMKgwqDCoMKgwqDCoMKg
wqB1MzIgY3R4X3RpbWVzdGFtcDsKPiDCoH07Cj4gwqAKPiAtc3RydWN0IHhlX2xyY19zbmFwc2hv
dDsKPiArc3RydWN0IHhlX2xyY19zbmFwc2hvdCB7Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHhl
X2JvICpscmNfYm87Cj4gK8KgwqDCoMKgwqDCoMKgdm9pZCAqbHJjX3NuYXBzaG90Owo+ICvCoMKg
wqDCoMKgwqDCoHVuc2lnbmVkIGxvbmcgbHJjX3NpemUsIGxyY19vZmZzZXQ7Cj4gKwo+ICvCoMKg
wqDCoMKgwqDCoHUzMiBjb250ZXh0X2Rlc2M7Cj4gK8KgwqDCoMKgwqDCoMKgdTMyIGluZGlyZWN0
X2NvbnRleHRfZGVzYzsKPiArwqDCoMKgwqDCoMKgwqB1MzIgaGVhZDsKPiArwqDCoMKgwqDCoMKg
wqBzdHJ1Y3Qgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1MzIgaW50ZXJuYWw7
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHUzMiBtZW1vcnk7Cj4gK8KgwqDCoMKg
wqDCoMKgfSB0YWlsOwo+ICvCoMKgwqDCoMKgwqDCoHUzMiBzdGFydF9zZXFubzsKPiArwqDCoMKg
wqDCoMKgwqB1MzIgc2Vxbm87Cj4gK8KgwqDCoMKgwqDCoMKgdTMyIGN0eF90aW1lc3RhbXA7Cj4g
K8KgwqDCoMKgwqDCoMKgdTMyIGN0eF9qb2JfdGltZXN0YW1wOwo+ICt9Owo+IMKgCj4gwqAjZW5k
aWYKCmFsYW46IHNvIGkgYmVsaWV2ZSB0aGluayBpdHMgYWNjZXB0YWJsZSB0byBtYWtlIHRoaXMg
cGF0Y2ggY2hhbmdlcyBpbmRlcGVuZGFudCBvZiB3aGVyZSB0aGUgY2hhbmdlcyBpcyBiZWluZyB1
c2VkLgpGcm9tIHdoYXQgaSByZWNhbGwgZnJvbSBvdXIgY29uZi1jYWxsIHJldmlldyBsYXN0IHdl
ZWssIHRoaXMgY2hhbmdlIGlzIG5lZWRlZCBieSBwYXRjaCAjNy4gVGhhdCBzYWlkLCBpIGFtIHBy
b3ZpZGluZwphIGNvbmRpdGlvbmFsIHJiIHdpdGggdGhlIGNvbmRpdGlvbiB0aGF0IHRoaXMgcGF0
Y2ggbmVlZHMgdG8gYmUgc3F1YXNoZWQgd2l0aCBwYXRjaCAjNyAoaS5lLiB0aGUgcGF0Y2ggdGl0
bGVkCiJkcm0veGUvZ3VjOiBQbHVtYiBHdUMtY2FwdHVyZSBpbnRvIGRldiBjb3JlZHVtcCIpOgoK
UmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwu
Y29tPgoK
