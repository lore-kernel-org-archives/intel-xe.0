Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4B3D2629F
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 20:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FAF010E097;
	Tue, 20 Jan 2026 20:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kkS1F901";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798A010E097
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 20:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768940998; x=1800476998;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UmxY8R0Kl305baM0ClE6+CnqxN7Y11Kc/Gofh2n7hyo=;
 b=kkS1F901vXzac1lcThoT0vr7pILjnuVARmAv1AB/rupccG8OUNe3i162
 k+GKJQdjEACIQjrh+2GDvcCXH6HSqTmrpnUAXmr5MYI54dzvYL03rzIU3
 9KkE+4oE7LdRtBWu7EiBeaWISa+ivl6jkSPMr3hANFLIyLH90250rb99C
 EivwuH/AfLgeq+/6E+921rWtskGTQXjiYKaJkWQRN1qIXKI/B1CS6OYnO
 PWDaPrQFLtGHEZWz5Ipb6zka/1ghVwT4KHDEEWdA+/0tRaCFipdpLVYlF
 weFu9Fx3zIs8BDBgCWjh/plFVmndX+JQyk8m7M7Kv2zB31dCFhDOPlVW1 w==;
X-CSE-ConnectionGUID: zik9Ic4XSTekQ9Pzo8FmGw==
X-CSE-MsgGUID: u0rku0nkTQq2zrKOmPasHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="81604046"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="81604046"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 12:29:58 -0800
X-CSE-ConnectionGUID: TJsVSv2MRRuYMzl/wJrEPg==
X-CSE-MsgGUID: CYK8cjaiTUm5d6iimHnxcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="206269591"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 12:29:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 12:29:57 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 12:29:57 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 12:29:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EHseiYowIekJDGVT+B7AlXqyNdHL/scX8Lh9aMgq2KFLigcESJr3up/7AJVRX4PibyaT6utlniJSQZwSMKnHZnP/8Q2i47okpZhsFoPwZIRkifVrf4wA0ILt7y/9xDtEbeAKMCaeCfgme47jARUQCtuZNaj09TSiXFbtaUtxATiqIce4vjAKndeGgbqhNQySBXVrgSuk63k0HmpmEhBc34N3Cc+xCXc/FQnrrmlavHabGaN0sZFAthYk4cnJN75Wfzr2RWD/UswFNnt5tYH2MuCV0wqtTsuPv6/6c8Ild7JS+Wz4X7hIs/H5lDghSL0/nTIKM4i8gZ1jxVOCbrfuHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZHj3axFPF5/YMHpjyySTZ62mUkGuQTs8PaVPuYxPsU=;
 b=CfYcdE6ATUwyAluI5zSYbUvcwZTyfAw0QHEn0R8EXKYjmrWwE9tyXPjJW2wT5ZHEJ8LX8aLy3c3VSMDI4rOL05VOcbncH7G773khiscS5Iuml6RUulPISHROTWalrGdiBy4BReIUq5q8cdjSkyTA9LvO8L+Y62aMHFX2ly/URwol+wC/T/G5SCnGoZlqhAq2uxa3cC8961AwOtds0XXPbfdriV+ykOA2Tf6NDJrpmh64fqZnba1/x0I+LORl2cc4hX+gas7VVKbRIISbXRgbMzCnVt24JiW4+EP5CvemtKQso/mb1xDKRvIwsXD5mKbJjRB1B0Vy2RxkMp40fvw6pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB8688.namprd11.prod.outlook.com (2603:10b6:8:1a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 20:29:47 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 20:29:47 +0000
Date: Tue, 20 Jan 2026 15:29:43 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [RFC 1/1] drm/xe/vf: Skip =?utf-8?Q?cr?=
 =?utf-8?Q?eating_DRM_device_entries_in_PF_admin=E2=80=91only?= mode
Message-ID: <aW_lt0B4G5Vs8TL4@intel.com>
References: <20260120112010.70397-1-satyanarayana.k.v.p@intel.com>
 <20260120112010.70397-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260120112010.70397-2-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: BYAPR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:74::17) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB8688:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a96fc08-91c2-4fa0-61f7-08de5862a713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|18082099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWVZM3ZrYk9nOXdDb0x3cTBSNmljZ3YwVWNWeDhTVC9OMy9CTXo3S3UzdUlU?=
 =?utf-8?B?d09sRUdTL1V6WDUrb25iY3RIbHhUWTBhRE5BSEhEakgvOVBJT3MvWVlqRHJn?=
 =?utf-8?B?SWY5WlVYdi9UdlpHcGh1V3ZHMTQzQW4yVlo1RTNNOGE2NkRlakk0MUszYTdG?=
 =?utf-8?B?cXozRXlwdVFQMUJtUTdheG0yQm5PU2ltZWFIanpoamNtNnIwcnFsd3FWZ3Br?=
 =?utf-8?B?SC81TzVxejA5R1p5WXFhbHZHQURLL0IwdktlWjdwTzQrUkVpWDZBd0ZyUGxH?=
 =?utf-8?B?VGlaUXdtbCtZMFRuQ0IxQlFRUk9YTUdkRW15LzgwNDd2a0R0RlFnRG1JUHRj?=
 =?utf-8?B?bURiZDNCOE80eTJFMTJLeTg0ZEVpQXlGOGs4TjYxUnN5anNQb3crTWVROUhV?=
 =?utf-8?B?V2xMWlc5b01FRXZkb0s1d2JYMmpzeXdST2Fhem9LSXZCSE4vV2tnV3FsYTJS?=
 =?utf-8?B?VENUQ281anV4dzRXSlNkalBBNmp3eEZkc245cUduK1R4ZEpiQmROWFpVRnow?=
 =?utf-8?B?ekpMc3dQajMzZHd5QkZaSUtXY3dXMC95Mm80VlJOV0RldkcxN2xjVnJUWG4x?=
 =?utf-8?B?S1M3eTFEM3JrbEI5SWRnWG9Ma1NldWRLK0lxOU04WUd2ekt3RmdONUxGR2No?=
 =?utf-8?B?WkoydmVnZEtwSHVNQ1phcG9QMVlDNGIrK2lseHVEWFM0SVZ3bC9hYTNzOWFu?=
 =?utf-8?B?bUk5SGgyK1FFVlBDdXhRVGc0WE8zbWxGN2R4dlozc20veUF1WWt5SEdKUVhy?=
 =?utf-8?B?OXBocVR3TW0zaXNRNjRLVTVicnFkU0FBeldjRWxTUE5qbE5zemN3ODJxVHk0?=
 =?utf-8?B?NUpyRW94U1F2czNTM2VlaHJzSUF2bGF0a1d2STE4bmhqTUJuTVk0VW50TXY3?=
 =?utf-8?B?MmZkZVRLdnJRZ093N3hreXNQaEY2anUxRU8xUjY1YzN3d3VpTkttUDAvN2to?=
 =?utf-8?B?ejd0S1VxT3pWakcrUHdQZklJWDhIN2Jnd3ZXcG01N1U0RU9lRlo3QVg3Z2Zn?=
 =?utf-8?B?a2FCcXQyVGNoNWdHbnZhWkdMdXc1NXZBM1U2c0RJYXhkcnhVb2tZSDdlNkJP?=
 =?utf-8?B?SWFISFExd3Nuc1lqV2NvbndRTmdVUS81eU9vZ3FLQ3lZWlJOOG5MS2Q2aXNt?=
 =?utf-8?B?OWpiZHBkOHhLbGpGUlYvMVl2Q09OSVo5ZWh3TTloVTN6eXZmc0lvM1lEblJL?=
 =?utf-8?B?MCszdll0cUNxQUkrUFJhQkdyZVRhVWk5OHJGVU5sMFd5R1Zpc0FWa0h6WCti?=
 =?utf-8?B?eG9EZFB2d0tYNFVhYzMvYWhpMk44YkFkNUc5bEQ5cWt1Z3RvM1lrU1Y0YWkz?=
 =?utf-8?B?MUFPS0t4Rmo1WkU3aUdGWlYxQnNCUXNNRXpGVWpDdittcXYxWldiTmlqNGVk?=
 =?utf-8?B?WTJxQzNZNjRxeEFnMkVCeStjeFFWdExlbkttTnBhSEh3eU5Vcm5zVVE2U2Nm?=
 =?utf-8?B?QW5kbmY4NWcyVllQd252YjZuL2R5VGNQRGVjWDJBbmE5VVBLTGVVU3lnVU4w?=
 =?utf-8?B?bTIrc2hiQk5uNDNIUVpoNWh0M0oyb2kxS045RElhdE5UK2VYTlBBUjNqRlM0?=
 =?utf-8?B?ai9lek5KNysweHhDN1h0cXArZWtmT0tvSHdRUkdNNXhvYUdEdzh5Z2J1U05S?=
 =?utf-8?B?UDZCbTAvZldnWXpHeld0OFJXZzg1anlxbk40TzRCTWRUdlpIMWF5MmlTMkZh?=
 =?utf-8?B?YklTSVNJSTliOXhSSXVIb2RsMFNlTzBNdUJYL2FPZGxOeXNkWmNDNk5TODc2?=
 =?utf-8?B?Q0htWnpSV3JubFlzQ3l3d0tGaGZhSnNYcTZLczd4ZVMvTkZobTFpeWRma2lD?=
 =?utf-8?B?cWc2NG9kcjM2dTBaL3NoczVESXptbktJZWliRW5BcTR1SDduMURtUUI5dUtx?=
 =?utf-8?B?WFk2R0tGRUdESkZYV3NTc2MzNHZYZVVVY1p0YjlNaDUxb0l4ZVB4bHV4YitZ?=
 =?utf-8?B?K3Nsb0hWQTZZWlpLUXBUYzdNOStBWURYSmlkczRFZ3NpNnZoOFBVUnVIUVlS?=
 =?utf-8?B?SG5ZSUhLK1lkUkpaQTBVejRSQ0F3WklkeVhRUVlxem10TnJCekNIVnpFSVlh?=
 =?utf-8?B?WjB6dExDVklyeC8wZTRjRnc3Rko0MDM4VzkraDB5YUN4bnhjcCtLeGtTc0wv?=
 =?utf-8?Q?kqrw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18082099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGZ2UnpxdHJ4UytvbEFIUld4eVF5UTUrYjA5QkVnaXM4L0RTU1c2NmVLWm90?=
 =?utf-8?B?dU5mUGFraFVHajZrV3BkQWRCbDFsVU9DT3dlbVpxVUhOK3NTdGE3c1lZQ1Y2?=
 =?utf-8?B?dUdyUkd1TW9reUg3VzZjTmdDQkN4b2JIRFd0SDBPbS81QjgwcE00N2t2MEZX?=
 =?utf-8?B?M0NzV2JDTzV5aDIrVVpaZ0ovNSs2bExmRnl6ckNpbEQ0QytJUXc1ZTdtQlBF?=
 =?utf-8?B?b29GQStvK0hkWGhRY3RWM29SYUQxRVdSQi9MMXpUV1lvSUdSQklyVGFleWIy?=
 =?utf-8?B?SkhLcmYvZGRIaFllTXdyQm13STNGdklSUlk1ejZpelZ6MzlnVUpTTXp3VDg0?=
 =?utf-8?B?UFZMQXpzRnZQWjlKTFBkdDhDMklVU1grZGQ1L0RsNmQyRlF1RUEzUExIUkc3?=
 =?utf-8?B?WmRETlE1REVTQ1Q0OVpuUVh3bFJwa096N0RGTHVaK1V0T0NMaUU0WUlRWmNK?=
 =?utf-8?B?Y0x0TkhxTGRLVkl1M2pmTEo2ODdlekxDWGhtVmh6eHZUUVNqTXFlaXRwODQw?=
 =?utf-8?B?MXpHZURnMWo1MGowb0J2OTh2T25oRTR2cFc1cnhVVnUyVE1GZkU2VU5EQ1ZX?=
 =?utf-8?B?ZW9EcnFRbjU1RHhNUHhWcUhhQXRrM0xNM28yb2dIWGZIM2Ivb0ptQTlSam9m?=
 =?utf-8?B?aWlpV2dBVmlYZ25pSUoyTkZSYUtVYkNTZ20xMkR2UWdRYVJQNG9FZTRYYXpK?=
 =?utf-8?B?ZUhuRS9lOU1PQ2VERSs4L2JHdk1hc09yVzIvZGRCZitraXM3ZS8yQnMzZDRq?=
 =?utf-8?B?RlMvOWVQNjlYN0ZRclRvb2RaNU9UMGxRakNnejBVMnA4bDRybzllcDRWVHZP?=
 =?utf-8?B?dlp6b096cG4wczZXbHVMR2pnQmVhaVJrT1BTdVBlTC80K3BsODVYL3FKSkdG?=
 =?utf-8?B?S2tmOW5yZkFmWUUwbnlYL2pCOVg4Y1NlZ3kybnE4eGhjaVdOQ0NhY0tlM3l5?=
 =?utf-8?B?ZWJ3N1VRRGFZNEZsV1plSEIvUWRzclZpeTh4bFlWeGIzUUNwUzVOb0RpTXhZ?=
 =?utf-8?B?SytTaGgzM1hPY3RtTytKL3hvOGR5cUEyN1lqVTlERkRxOC9tU1RRc0lxbFJk?=
 =?utf-8?B?UzFwUnF3VCtTZXNzNmZRcGhKRlJYWTRQc0VqUUs5RDZFNVVyYXhXU3hZeWVn?=
 =?utf-8?B?N0tuRzFaVkpXVHlnSHF4WmJQWDhHL2Q0WE5hRGgwUS9ndEljR2hVZFNnT2R5?=
 =?utf-8?B?OFl1SUtVYjJrOEtrclNpRGVIVUZwdjljbFAzVk5WcjJhV01ndWVMV2Z3VTVN?=
 =?utf-8?B?VjErMll4VlBHZ0pISzg1OFBONzFxVmlVN3J6bmRkUllKUm52YlZMdDQxcnVq?=
 =?utf-8?B?ZWZnTWQ1cWNTV3hxaDZmQUtjQUhkQlZoNEdUU2lUUUYzYjlsL3Zqek1iUU9I?=
 =?utf-8?B?SzVXNlRHMzNHd0JXVGFxUi9NRTNPN3Rramwyd3BSWnIyS2JoZTRuQjh3dXg5?=
 =?utf-8?B?N2FacmVBbWxuZ3d5bVAxN0c0a0dWb0JhVCtPYkh5MkFyR2FVT09PZHpTb1d4?=
 =?utf-8?B?MjZNNXJiNXQ0S1Jkb2ZndkM2Yjg1eVNvanVFbUc2U1loQkQ1cjVBMDNnN0pJ?=
 =?utf-8?B?NThsY1ZIV1YvY3hCMkxYZzFKYll1YjNLSlZ3OEZwSDhvcGVsN3NoRXd1WHFN?=
 =?utf-8?B?ckxYeUpTczRHdWtGakFFdzlTZjRkclhZLy9tNzEwSkhyUXkwbWNWUW5VSEl2?=
 =?utf-8?B?Rkx4NnlJYVdOcE5nRUhkUWVibm1QQVJaQkNNbzVEZ0FPaFFiWWYwUHlrS2dQ?=
 =?utf-8?B?VWFPZVEzdm9aeFVxMDhJU0g4ZmVrRDd3SUdrRnRuNklvM25SMGpZMm9wRjFt?=
 =?utf-8?B?T01leUZhRXJuRWdMTnM5YXd6UnJaRmMrMUI0S0tkeXlGbFdQWmlYaGtQZUJR?=
 =?utf-8?B?Y0NsUm95eUdRM1FlUFZsWGZadWlyWWRKcVdac2FhSWtlMndkWWdzWm14Y040?=
 =?utf-8?B?VUpTcGFwREJjNjIzTHlvSHBrVEVVa3R0OXVpK2QzanFJOTVqOVFIT1djRW4y?=
 =?utf-8?B?YTRSWm1rNzZaYnZSZWJUSFZvelh5T2lseTNqL2RGTmVmYVVGTkpqR1BPclpp?=
 =?utf-8?B?SDF4eCs2U0lhbGxjYy9HYkJSWXo5K3lsdEFieThhdmxWK2tDSGN6VWxsWldt?=
 =?utf-8?B?RlFKV1RKbFhrdHJPNk5qNmdXRk1rRHJMQ0pxbXA0VzViUEtlaGJtSHdobDc4?=
 =?utf-8?B?TU96cjdIUjBNL3lYRlNXbGJpREkveElUNy9PSVIvVkJiTVdJaDRjdzAzRVA1?=
 =?utf-8?B?R1pzVENWN0NYNVBZdnF1Ly8wNlN0U1hLNUx5aWtmNFBvNi8rbE1mT3JlajRX?=
 =?utf-8?B?VzhLREZNR05kSVB3T2RPYUZtL1lHZTN3Q2dpL0Y5cjNLOE16ZVUxZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a96fc08-91c2-4fa0-61f7-08de5862a713
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:29:46.9764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hcOJKyduCOFEbAyE5Ek2VN2OGhLvG3PcIpAlytGQi99e+T22WeSzHbA3N/Kwqs+GYL6W9anFwrBpEBbLbYfbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8688
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

On Tue, Jan 20, 2026 at 11:20:10AM +0000, Satyanarayana K V P wrote:
> When the PF is configured for admin‑only mode, it is restricted to
> management functions and should not expose a device node that would allow
> users to run workloads.
> 
> In this mode, no DRM device entry is created; however, sysfs and debugfs
> interfaces for the PF remain available at:
> 
> sysfs: /sys/devices/pci0000:00/<B:D:F>
> debugfs: /sys/kernel/debug/dri/<B:D:F>

+dri-devel since this can be useful to other drivers as well.

btw, on the subject it should be drm/xe/pf instead of vf right?!

> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c          | 16 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_device.c           | 11 +++++++----
>  drivers/gpu/drm/xe/xe_device.h           |  6 ++++++
>  drivers/gpu/drm/xe/xe_oa.c               |  2 +-
>  drivers/gpu/drm/xe/xe_sriov_pf_helpers.h |  2 +-
>  5 files changed, 31 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 0907868b32d6..134d2e661c7c 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -458,6 +458,20 @@ static ssize_t disable_late_binding_set(struct file *f, const char __user *ubuf,
>  	return size;
>  }
>  
> +static void update_minor_dev(struct xe_device *xe, struct drm_minor **minor,
> +			     __maybe_unused struct dentry **root)
> +{
> +	struct drm_device *drm = &xe->drm;
> +
> +	if (!xe_sriov_pf_admin_only(xe))
> +		return;
> +
> +	(*minor)->dev = drm;
> +	(*minor)->kdev = drm->dev;
> +	(*minor)->debugfs_root = drm->debugfs_root;
> +	*root = (*minor)->debugfs_root;

I know that I had a few of them in my experiments, but I was wondering
if we could minimize this to just

minor->debugfs_root = dev->debugfs_root;

before the create files, instead this big hammer here....

and perhaps even minimize the use of the drm_debugfs in the cases
where we need in this admin only mode?

in other words, do we have another way to avoid a big hammer like
this?

> +}
> +
>  static const struct file_operations disable_late_binding_fops = {
>  	.owner = THIS_MODULE,
>  	.read = disable_late_binding_show,
> @@ -475,6 +489,8 @@ void xe_debugfs_register(struct xe_device *xe)
>  	u8 tile_id;
>  	u8 id;
>  
> +	update_minor_dev(xe, &minor, &root);

also, can/should we make this conditional on the admin mode only
instead of always?!

> +
>  	drm_debugfs_create_files(debugfs_list,
>  				 ARRAY_SIZE(debugfs_list),
>  				 root, minor);
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 00afc84a8683..fdd8668bd565 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -993,9 +993,11 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	err = drm_dev_register(&xe->drm, 0);
> -	if (err)
> -		return err;
> +	if (!xe_sriov_pf_admin_only(xe)) {
> +		err = drm_dev_register(&xe->drm, 0);
> +		if (err)
> +			return err;
> +	}

ack on this...

>  
>  	xe_display_register(xe);
>  
> @@ -1046,7 +1048,8 @@ void xe_device_remove(struct xe_device *xe)
>  
>  	xe_nvm_fini(xe);
>  
> -	drm_dev_unplug(&xe->drm);
> +	if (!xe_sriov_pf_admin_only(xe))
> +		drm_dev_unplug(&xe->drm);

ack on this too...

>  
>  	xe_bo_pci_dev_remove_all(xe);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 6604b89330d5..bb1e7bc8bf4f 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -11,6 +11,7 @@
>  #include "xe_device_types.h"
>  #include "xe_gt_types.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_pf_helpers.h"
>  
>  static inline struct xe_device *to_xe_device(const struct drm_device *dev)
>  {
> @@ -177,6 +178,11 @@ static inline bool xe_device_has_mert(struct xe_device *xe)
>  	return xe->info.has_mert;
>  }
>  
> +static inline struct device *xe_to_drm_kdev(struct xe_device *xe)
> +{
> +	return xe_sriov_pf_admin_only(xe) ? xe->drm.dev : xe->drm.primary->kdev;
> +}
> +
>  u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>  
>  void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index abf87fe0b345..90fa30de85ce 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -2512,7 +2512,7 @@ int xe_oa_register(struct xe_device *xe)
>  		return 0;
>  
>  	oa->metrics_kobj = kobject_create_and_add("metrics",
> -						  &xe->drm.primary->kdev->kobj);
> +						  &(xe_to_drm_kdev(xe)->kobj));

hmmm... what about skipping oa entirely if in admin mode?!
OA metrics is usage and should be working inside the VM, not in the admin mode.

>  	if (!oa->metrics_kobj)
>  		return -ENOMEM;
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> index 9054fdc34597..9a99fafbe77d 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> @@ -56,7 +56,7 @@ static inline unsigned int xe_sriov_pf_num_vfs(const struct xe_device *xe)
>   */
>  static inline bool xe_sriov_pf_admin_only(const struct xe_device *xe)
>  {
> -	return !xe->info.probe_display;
> +	return !xe->info.probe_display && xe->sriov.pf.driver_max_vfs > 0;

I'm confused on why the probe_display is in the equation...

>  }
>  
>  static inline struct mutex *xe_sriov_pf_master_mutex(struct xe_device *xe)
> -- 
> 2.43.0
> 

Thank you so much for taking care of this.
We definitely need it.

Thanks,
Rodrigo.

