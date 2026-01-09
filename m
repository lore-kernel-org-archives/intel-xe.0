Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43512D1A631
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 14:05:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE24610E2C2;
	Fri,  9 Jan 2026 14:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YWsnKXGm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5AF10E19B;
 Fri,  9 Jan 2026 14:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767967554; x=1799503554;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=ga4GMMwzyKy31iQYQxNQuZ+DSwmmOxeMrUS8Wn16gis=;
 b=YWsnKXGmWff+SPH+uBDpOqNxULS49T9URbb7hmsI7rSRYqCdAfXwGCpk
 0ZPTaEecIwD+nVepzllPJuBhBkd826sXSf2zefG1ADRFNlOML51jbcMG+
 3kY1wjvy+eldVkQwV0o+CpDpTlNGZAOdii59Tmc6NKg6BJGmhFJ7v/7Vi
 cpxOh6qfkBnflPOXeAfgob5ipdEe+e7ByyV1muEFJGHbr2Gz/HOBpszHt
 O1HDZsvtMs6J801M6MQZP45EsQ3o5i1z7s1H8UZUbuwyucTe1S+/BhFd8
 hkJXJleGZcVKr1QqOJ7miIJ9sz3mp+jgij2CVyhUpGDXMTj8v2WzoSI2X g==;
X-CSE-ConnectionGUID: bqwwO5h+RXi52VEii2oFuQ==
X-CSE-MsgGUID: bJQKGrEuQQqRZanMpmt29A==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="92012782"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="92012782"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 06:05:53 -0800
X-CSE-ConnectionGUID: 5mMY1rO4RR6wv0sV3DZ3lw==
X-CSE-MsgGUID: dH71MYLmQ+6wh1pBXuRB7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="204290529"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 06:05:53 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 06:05:53 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 06:05:52 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 06:05:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2DYFFeWMGxZbm4rhyxAhxnC8j/igM39DTz5o5lh7d0wiV8dTDJev5BPdfCUok5mz6zhtbUWqoob48tZZuU2gZQ91DWyzLFUSOkGzv+xwxqTiNn85DJB3vsG16CCqBXLq6kVNLTpJ7KaiAu8KgFlNMcHvh4p3NwKvW+9N95J/Nf8Ybun4olkMhNVffKJQHnc7x3IDfZSyglzJg+l1I1m0x9QhoAstPyEMo83tmZdEcOAG9iFEAg3AbatK7Vmm/tLCByNznDFHU/p7LBHMzfKfQA3OUZGrUqXQb4CIDw6MGwHyCCiDZZAg2DgdwW8hKJt8KlurblG0QLpotQDe9so/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=by1ZMukKG5N7cUgE2+Gf7cgnXvrvDBCXVN5HKsWbMlE=;
 b=CLBdFGRHKjr0I2xRURVGggwFHMe1Zx9tbF05IXqf/0lP5QZD7r3pyeOJhbSLxPH/lZboKZ3vCmxhKRkZRMloDpJO6JnAD7+o2pPNLSaIAznYydzYAepXxJGpDcN8T69FX3MuL4/mqWH5rOKQcaJNZ9NKLOVKZtv/KnQNvl8WpxIqH0yq6ejiUBCAi4NCHyr+MGWgTAcxAnWPnRVMThq92aMQ3fB8+Jx6mi84oKFeMHhtumMm1AfwumtijKXcn5WmZwdfbdPZY1pguBX59dni7V2MqOnrxORctmdD5swQYhJMN5KOv4rnj5sVmJiWboqx3DxZI2sYmD+1RdahOBpv6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8280.namprd11.prod.outlook.com (2603:10b6:806:25d::21)
 by DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 14:05:50 +0000
Received: from SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::cdde:8d34:980c:776e]) by SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::cdde:8d34:980c:776e%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 14:05:48 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <176775596863.131373.1963967412877940350@a3b018990fe9>
References: <20260106-xe3_lpd-no-cd2x-divider-v2-1-06e5cbc9dabb@intel.com>
 <176775596863.131373.1963967412877940350@a3b018990fe9>
Subject: Re: =?utf-8?b?4pyX?= Xe.CI.Full: failure for drm/i915/cdclk:
 Incorporate Xe3_LPD changes for CD2X divider (rev2)
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
To: <I915-ci-infra@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Date: Fri, 9 Jan 2026 11:05:42 -0300
Message-ID: <176796754232.11411.18304304308213975194@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BY3PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::8) To SA1PR11MB8280.namprd11.prod.outlook.com
 (2603:10b6:806:25d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8280:EE_|DM4PR11MB6360:EE_
X-MS-Office365-Filtering-Correlation-Id: b1ecfe98-0fb5-40e0-5e86-08de4f882f97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTlQVW54blB2SGVwdzFlSUYxbkFYbmJJTFoyV05mN29WOFB2Qzdxc0ZFR3ZT?=
 =?utf-8?B?QzFCWDVzdkl5cWVDamhsU1U2QWpGVEM3YytNUUV1YXVkZWFZcUtKU2F6TVo5?=
 =?utf-8?B?NU1PSEk3QWkxUVpBTWhlREpTZVdLUE9JdVMrM0ZKeldWNi9rYW5EOUlGdStV?=
 =?utf-8?B?YjZVT1BvVXFadUJCWWR0elNSTm1WR01ORStNelFMU1BBTTFhekZkQVAyVnZK?=
 =?utf-8?B?emxpamthRlJJdTdPeVNiQWhVTEtLbHZwZHVzUTBVVVpvUGtTcnROYXN1MjFv?=
 =?utf-8?B?dzYrekY5bzJXN0cvRTNNMEVsTk9BTHB3Ym1mamNBSEVOUEJmR0JtQW05WDRa?=
 =?utf-8?B?WkM4ZkhEUXRBYnMxYmp2aDJwTWwyanJZbHpja3lkcjBtSForSXp3TUpuRkFZ?=
 =?utf-8?B?bW5teXJpenF4U3N1Vko5QmZCRXlTRUVya0VxSHNNM2RKZ0hxU3YvYlNES1ZF?=
 =?utf-8?B?YTBMYmx2OFRTa2h1VUtGRGVXNStvL2dxaXpJeWRTL0hxTHJvRjNmZlFOWUh4?=
 =?utf-8?B?dGNXVnFPTGlhb2ZRVUYwVWF3K1VtbzdVajUvNm9zVmZzQ3dkNFIzMnFLMDlr?=
 =?utf-8?B?VndZUVVDemZrRm5YejZWbC9kRVpWNVlweHc5dWhGMmlvZjAyQllOWExJWFJJ?=
 =?utf-8?B?NFRIYWM3OWVMWGo1d2RyVlVLd1BsV1p3enorOWYveU1aTHBWUDJxN3NZeS80?=
 =?utf-8?B?ZUFWVVRkdmVBVFg0ZlZEam1JaUtJMWJJNWVTUjJMbk02QVBJdVlKTWl4cGxV?=
 =?utf-8?B?SUlxdmFWNGN1WTluMnQ5aWxJenQrSXlyS2dWVUdVYTJwc0JUV3JvUlRUaGVX?=
 =?utf-8?B?c3g5NDNoNDZqLzhqMFdORG5jd05hTjNEV1hQRUxicWh5WGdVTUVFUXhWeGJC?=
 =?utf-8?B?a1BsMDZxZEdLYkhRK2hJTlZjdk90eXVIYXViK2R6VW1JR1RKSi84TElLazVJ?=
 =?utf-8?B?dGxGNHFoTGpSVHJ0MERsQXVOcGRveWE4ekxldWZhYmNucXorMUVGWE9DQWM1?=
 =?utf-8?B?d1NaQ2JzdDZtMFhJVVFOQm9FMFJxOUcwaFZ5UTZUbUkrZnpReEFnaHpCZjJE?=
 =?utf-8?B?UTZIWTZPeVhSbHBZbVVGQUxBbXUyckt0OFFWVGhjOW1wTkVBNVJLLzdVWEdU?=
 =?utf-8?B?Tlkwd01uR3B3Ykozd2gvV2ZMM29IN21KR3JoYlZOeHp1ZjJPSDRQNXZnNkVI?=
 =?utf-8?B?cE5xNm5RalYwK0lLL09BRmpFVHpuREU0cSsycWJTaU5xNXZxRWlQeFBwZTVD?=
 =?utf-8?B?UmdXM2pua01FdXBWWW1VcmJiL1ZVYkRZbG1zb0NmYVNKR0JOcURMRXpsT0Mr?=
 =?utf-8?B?U0hWTlBibTZrSWdHWVAxd1dFVjdPZ04yUkFMV1RQNWZqYUZFK3BES0ZueDdK?=
 =?utf-8?B?V29Nem9BcTYxNnpJcFF4V3NoTGtPTGNuV3pGckpmN09keURtbG5yeW1MKzYw?=
 =?utf-8?B?UGFjSGRnZThnazJBNUV1dUpObFhQVm8wMFJWd2U1UFh1N2YvT21ySjFrTWhr?=
 =?utf-8?B?bU1kYlgvRFU4ODlZRjloSkllY2tITU9xSDlLOEJZVi93TmxVajhFRSs0WWZT?=
 =?utf-8?B?L3Jhdnc5Z3dhNXBGUUxuM3JuVUxpekN1aU1RenFFeFVrUFBRU2Q2WXRlbjE0?=
 =?utf-8?B?WHhGRVQwSnV2ZXlYcGpKWWd6KzhZVXBxeGhaV2F2b3grU3BFRFFsdEZ0eXIw?=
 =?utf-8?B?QVM4V29rMzQwbkxWWFY1NXl3Q1JsK1RaZ2c4MGtCc25tQ0hKSmZQOWRtYStu?=
 =?utf-8?B?ZGh0dHZZdURzTXRTaHRSUEpxMEp0TS8vbXZyQkViYnJnczc2cHVCam1uT3FR?=
 =?utf-8?B?bUtPc2lITHhzUi8vdzJXeWE2N3h0NVg0eko3VXF4SmtWS202bUFWYytaZVk3?=
 =?utf-8?B?T0gwdVNiMUxRaHgvMXczbVN3Y0hGSnlVaktqalFaY2JnL2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8280.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWpXWElDNE95NWJIdnIvOEZJZlhLdFFlemd3VzhzVlk0UVZod2hqdng4ZHJ3?=
 =?utf-8?B?MjVaMzVCWUVUMmVYSVFwTFBhZGV1V3dmOWwzMDBhNEtVbTU1cDhXL1hmNC93?=
 =?utf-8?B?TjE1elhTZml2RDBreEpUS0M1YU5lVnpDRXNKZUpRZm5rOEtuSEMvYUtjSERB?=
 =?utf-8?B?S2hBZXBhMUZJQ3JRNnVORDNLL2NqRHJhbkI2aTZieDBya09KTXBXdWhSWGdM?=
 =?utf-8?B?QTM2VnhKbUR5Z2VWbm9lRWJSc2pxcnN2ajdFaFJmMXFLYXR2ZDZKRnh6SlVQ?=
 =?utf-8?B?Qjl6c2ZER2lhSTBUZ203UnpSYytXeDhDU3ZqUVo1MG9ORmRFVC9ZYTZHVHVx?=
 =?utf-8?B?VThidS9zTXBScUZwWGY0MXhEL3B2bG13WXBqR3kzdG13ekV4WXVTK1dJWGJ5?=
 =?utf-8?B?aE4wR3k5bkhDcTc0TG4xeUdGNUtsSklwc2trSDc2bVN2d1NqR2lsT1Y0NkVq?=
 =?utf-8?B?TU1YWkdNWVh4V0NtUUlxME1uWEs0TFVzTVdxb2wrZnpzMk42WFA3LzNFRTE1?=
 =?utf-8?B?NWhEUUtJcFI5Sy9RNEtQMDM4VFhQRW9VODlWMnFvSDU1Q1h0SzBiVUk1Slhs?=
 =?utf-8?B?dWtkS3ZUVVowdkQ0VjNaVyt3VFdUUnJPYWhmekVDdnB4S0JIK3p1U2cybDh1?=
 =?utf-8?B?Y3lqeXA3ZVR1UkRaYUNqMG9wSjN4eUxNR0VHdE1wL3lFTzE4eDFzN2RYL01k?=
 =?utf-8?B?N3V4ZlR3RG1uZHU0N2l6cEU5b09NZzVyUXFKK21KM3JrV0hGWWtjN2t5eEd3?=
 =?utf-8?B?b016eHV0SnVQQmxPN3BPYkNTVmYzd0dNMlhiWXV1UGpCUEo4N3JIcHRoQVUz?=
 =?utf-8?B?cVJpMkxGZ3Zqa3RsZUpWMGEwbTBVVHA2Y2NWYWFrUmszS011OThLa2Y5WStx?=
 =?utf-8?B?TlkydU1oMWdGbWlKQWVRRVdxVUMwRTlMUFVGaG1FTkEwZWlPbGkzek9CN2hF?=
 =?utf-8?B?QXdxV2NLUmF0THhUelY0bk90Sm40ZFN2NVVEc2NZeENaMnVyNU9ObStuZG1l?=
 =?utf-8?B?SDZhZHNEamp6b1gxN0RzbEw2RlpVR3pwNk9BUVlOeHRBK3dCWWlPa0hQazhT?=
 =?utf-8?B?eVRra25zd3BIMDEyOGZLbHNEamtZY0d1QzNoNFVrV1ZlQmowS3gzTWJrRlEy?=
 =?utf-8?B?d0ZDZk9YRWdVcmxhNUN5ZzVQYXFSTFMrMjFRNDdKUi9oVnNreWE2NFlkKy8z?=
 =?utf-8?B?Smx1bkhHeTJCcHlPK21sanlvOTR5ZkNuQVdEV1M3UEtlbGd5ZVA0Y1g0YkEr?=
 =?utf-8?B?UmdkeHptSjNMMFp0YktrMytMWCt6OGZwZURGNDUzTG9jeE1zd3hBUXJwZlV4?=
 =?utf-8?B?dU1hVVYrTkhUMWdqZGZrcFlwYU5oTDFZSTdtWjVvY29nNlFlMWxMbS9SazNj?=
 =?utf-8?B?alpEQU5hT1FUNEZoY2Rrc2hQZXJxM2VRSmlvL2pLZEh4SEVsRzJhTlprajEx?=
 =?utf-8?B?UHExcUxsTERjM1FSc3hnNnd3M0tUOTMxdEpURFowb0tabVY0eXF2R0kzVHVl?=
 =?utf-8?B?MmZhUXhueEcyM3hicTlwY2ZQUzA0VUlTWGJOS3BZSVpvdDJOYk9vTXBVRzhR?=
 =?utf-8?B?aTBGOUc5TWRHbCs4NVkwRlVOdTB2clQrR2lHZUJYZVB2T2pmdHZhOWRRb2dz?=
 =?utf-8?B?R011V09iRy8wcUZ2cFhFbWNhWWg2MGlBUHlrajVuTnFmVktCb2c3Z3Bac0pZ?=
 =?utf-8?B?YU4vQ3dFUE9aZXdPUGdzUTY5bVpaaFh2bHRIOG9neWl4d25WV0RDUnBXWGRq?=
 =?utf-8?B?UWljQzE2SG1KVlRwdFFJOUw2WTYrRE1ldXo5RmZUOVB2YWZQYU40QmxhSlZZ?=
 =?utf-8?B?ZWdMRVpZSEZzVGtDbnRIUUtQeXU3ZGZubkgrYkRheFJxcTlmbm80dUh4cEh1?=
 =?utf-8?B?S1VlQnlHUUViQk1VUmo0cWlYTkNnMHdId0F4TXJ5VHZrWlRXNElLcGJnOGtM?=
 =?utf-8?B?Z01iblNnM0doZUtZOFk1VTRSUjc4OE4yajUrM0w0K29xbEtpUDZmWFJzY0ow?=
 =?utf-8?B?SVNhdHc4SndmcmM5Q1hVRk45Y2JONXFpTDY2YVRLWlMyYndxak1CbkpidURv?=
 =?utf-8?B?STNDaTQwcDBERXduc0xLeHdaREdmckVjeGUrVFlZb254OERtTk02aW9Pc2ZK?=
 =?utf-8?B?UUZHMmJrazFweFdpaC9sTFNlWVdnQmJ1c1FKdDRqNUdDSm9LV3p6MHA3ME54?=
 =?utf-8?B?d2pwT2lDS0dMYTRheGZEWmhUb3NXemxHUjkrTHZoNGloc2FQYVlUTkxvUUg1?=
 =?utf-8?B?SndaTFhZYU42cENGaWU0OVBzbDFKU2hBaGJkR1p3VERiOU82OUpJTmV4WnJh?=
 =?utf-8?B?STNUU1pTWkk5K2dnZUFOMW4xTHlDeWdYZ0V0Y0RMWWRhMXB4Z1NPZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ecfe98-0fb5-40e0-5e86-08de4f882f97
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8280.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 14:05:48.1936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4oKuBH4hz3tcg3Op9X6QlK5GJsaND9+p271tV/3RTfgyIgXVP2HzlB5RRP6X07ZE/9xANNq+wdloL/9ZDSMNvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6360
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

Quoting Patchwork (2026-01-07 00:19:28-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: drm/i915/cdclk: Incorporate Xe3_LPD changes for CD2X divider (rev2=
)
>URL   : https://patchwork.freedesktop.org/series/159400/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-4336-3d6700a02638d446a4e8ad92a8212c3efef84ae0=
_FULL -> xe-pw-159400v2_FULL
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-159400v2_FULL absolutely need =
to be
>  verified manually.
> =20
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-159400v2_FULL, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in =
CI.
>
> =20
>
>Participating hosts (2 -> 2)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-1594=
00v2_FULL:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@device_reset@unbind-reset-rebind:
>    - shard-bmg:          [PASS][1] -> [ABORT][2]
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4336-3d6700a02638d446=
a4e8ad92a8212c3efef84ae0/shard-bmg-1/igt@device_reset@unbind-reset-rebind.h=
tml
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v2/shard-bmg=
-10/igt@device_reset@unbind-reset-rebind.html


This appears to be an issue in the unbind path and unrelated to this
patch.

--
Gustavo Sousa
