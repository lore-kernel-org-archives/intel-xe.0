Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42B3E77191
	for <intel-xe@archiver.kernel.org>; Fri, 27 Dec 2024 17:47:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D95510E3FD;
	Fri, 27 Dec 2024 17:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OXL1O9bx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71AA10E3FD
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Dec 2024 17:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735321665; x=1766857665;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=OHXDq3Yp1jFDWPOQ6RGjPldEvMU544AFT2cJYrTzqV8=;
 b=OXL1O9bxz4wSJjknN2jenmGN65neQ1S70POm38ultSWAy2yjss46DJB3
 vDKcAeUbouqLHe/CenFPBAFU4dpG6xUyWqPPhSNsOCAEcv6ef4WgqDUEN
 29uWPl+CUo/a16+hJsEZW7r3Nxq2SSBJii6N4tEi/hTbTTSc3sO5W8DIq
 wsbcFArPH7BoOJO7y3i4oQy6rDEW/DG2grd799xB53E5uNFjl/cNUEBUk
 iwwEEp6otJpMfYLT2csRVUQ4nIyFuNgEYjpRe+QOfH93DEtaEVJaVxwpk
 iXNanbCF+RSvpBaYqfPYXVnmJU2hdlPlTTtu/zZ+3+fArzf3xjvGL5NtX w==;
X-CSE-ConnectionGUID: H98GgixEQkuxat247OSrvw==
X-CSE-MsgGUID: KKd6CrV1RraZxKKsde423g==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="46311076"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; d="scan'208";a="46311076"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2024 09:47:44 -0800
X-CSE-ConnectionGUID: XPZQZGvHSeWlRfNnvhunOA==
X-CSE-MsgGUID: er6eA3+XQRKVXHuWVtZWqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105213017"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2024 09:47:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 27 Dec 2024 09:47:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 27 Dec 2024 09:47:43 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 27 Dec 2024 09:47:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LEr3CK9/YFfuvk0gepPhxvfNyT6eKS0xXSvjS000zBYTj01zahLulBE8TcRtvTc0RYZ9eMUWlL9AUrpRWXpQL7Bub0nxrfOV5mvfkRheYQWMow2zdZshWx3bHh5IMOk8sLwjxhuyY/qBE2WfYJ8JIv4T5B7dx54b/D9SehzBhXbSMDbQyqObYTQAy85/wIFedl14pNu6/424AKBbkNFB2l9Hhz3+R7GSjbrqiEJ7O8nSVhEZ3FPIiAw9q+loQisWdvgOWtQySz1epGcjAeZi0KSlokpf1mFW9ogI5UAy6LSa6a212qoqWQ3Jc42qIE7ACt4LfFwF48HadnA+PYSN/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHXDq3Yp1jFDWPOQ6RGjPldEvMU544AFT2cJYrTzqV8=;
 b=JNV6xH9VZMRusoXpBwmjAv5pCdE0jNswHZwiWOW4erTzw/djc8wsDKyVnJ3bwJ99G/Ez/XohZzgTh+YCxN6rh/PmWw6CDCu5OtQ9r+HUnxIRIFzwdONP91+gQlccrJ14t00UkXmZwwA/peLeJL+5+mVaaoRSKKUG2nAvOYNEzUqtbo7aiQSyQG+6YUgMheQ1gQDGPFlkSkiEgAdzqgOQTVPHLb35BiSxqR6RMB00S9+At/HcAiNEtBeCVBEDXSrrIg3Qg+z2nMN2DBg/ovAF/fjTW9DL/WNgDtkdy5cWEl7Z/xd5/OKKp6DuW5BOoE5mpaK6pAjLas50iOSN4ka7yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by DS0PR11MB8719.namprd11.prod.outlook.com (2603:10b6:8:1a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Fri, 27 Dec
 2024 17:47:09 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%4]) with mapi id 15.20.8293.000; Fri, 27 Dec 2024
 17:47:09 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] Revert "drm/xe: Force write completion of
 MI_STORE_DATA_IMM"
Thread-Topic: [PATCH] Revert "drm/xe: Force write completion of
 MI_STORE_DATA_IMM"
Thread-Index: AQHbV7KCOVvlDN/Ef0Kpcb0t0Xr2yrL5cEiAgAC2W4CAADL7gIAABayA
Date: Fri, 27 Dec 2024 17:47:09 +0000
Message-ID: <520c56c7489ce02a33eee13cee9c2546e37c1481.camel@intel.com>
References: <20241226162310.47489-1-jose.souza@intel.com>
 <85a5ch244k.wl-ashutosh.dixit@intel.com>
 <4e19a92bbd488944c52aa93f9cbaee7c70295a44.camel@intel.com>
 <857c7l11go.wl-ashutosh.dixit@intel.com>
In-Reply-To: <857c7l11go.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8185:EE_|DS0PR11MB8719:EE_
x-ms-office365-filtering-correlation-id: f253e25d-0232-4982-0517-08dd269e7c99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NVRkWGYvZWt5UGEyVEMwNXNrOS9CTE9lbzRaTkR4cEdyK29GUTROdElYcDB2?=
 =?utf-8?B?Rk8zUnZCYkFabXAvU0hMYU0zbzBkd0k5RDBwTGl1ejNneFYxNmVsbGIzaThC?=
 =?utf-8?B?VS8xTStCV1hmNnhPQnVycGJtNkVjQmU1YkxOZnpkV09XK1ZkSVB6N1Zyb0RH?=
 =?utf-8?B?Z3RNZkZLVFpEekpSbWh2OVVTVDh2c2VJVFpacUF4N2FveWpka1hKbmI3Tjdj?=
 =?utf-8?B?bGljZ1hUU29ZNnlOU2EwOEJFaTJWTjNMZStucG5RNDYwL3JKUFpPTlNwcDZ4?=
 =?utf-8?B?WEsrQVRGT1c4b2h1UUNjUmNLQlBQL0VDcHRoMTg3QTNvMnpwVUd3Q1lpOHpR?=
 =?utf-8?B?aW8yaTFyK0NaUTVENDBOdSt2cFAreDd1VkI0Sk94SWhCWWZmWlFMc0FmdVRI?=
 =?utf-8?B?a3JpbXRVbzBhcW5NSnhQNmJ4cXB2ZHc3NUZZdGxPbVBoU0tTdVVkVDNLN2hB?=
 =?utf-8?B?c0dNa1V0ajgwTThQSmVRRjZhUkd5aTQrN1k3dEhScHROZG9JdkszbjlBdGND?=
 =?utf-8?B?QUdnQlZ6S0dwK3dvdWRxWWE3Ykgwc3FDZzUycDFULzZsVSsxL01GcGN2WUk3?=
 =?utf-8?B?dGNPakxCbU03Y1ZwVDdLQXNIMFNMTkZxVExEaWg5bWNnNjVIL1RIRzVvaFJF?=
 =?utf-8?B?ZDVVQW41L1ZLdzRuQlo0OEFhRitkdnN4Nm1Lajk0VG1IL1J4Nm42Q2NLVlJw?=
 =?utf-8?B?ZFRwTHd2QUR0MUVPZDlJblh3RWFjSUI1R282clNlRXF4RUNQVHhqVThwYThv?=
 =?utf-8?B?NGRuY0xjU0tiaVJpMk83ZyszMlU5V3crczcxeWV3amZSN3IzaXR0andhWFVU?=
 =?utf-8?B?REhXUFNzZ0Zhc0dtdk5QeHhZR1g0Q1BoRUYxMkdRTmYwM2Z1SG9IaUQxVlY3?=
 =?utf-8?B?MHJ6emZBZS92eTdnZjhhcjBnSnM1Vk9kVTNFdU51eXF0M2srMUpaME5xNTEx?=
 =?utf-8?B?cEM5V0JHR3RPeWlnOGkvU2o5RzQ3S3ZKbDZBdGZtQXhKTk11ZDdIdXBBOHM5?=
 =?utf-8?B?NURPUnlCeWQ3NFpZenU5VmloQUZGN2VSRHBJbGFEUmJrcElkTXNZaGtjY1F5?=
 =?utf-8?B?em53Y0Rkb0VQZnl5c0Ywck12Ri9xbGcyWEZMN1JyRHZxTnRsU2hWa2pWSzZ4?=
 =?utf-8?B?cFNBQUxocVVZaC9LNlVjbHBRcVVOQk0xaGN2Ti9rTTRXMmt2V1o1blA3TzYv?=
 =?utf-8?B?ZzZ4UmhuUHlnckIrVFV1azJTcXUzUkZvZ05FL3dJaTVZcXRmYytucjJpY1c4?=
 =?utf-8?B?V0U4TEordXRzdzVTQTNrMzQzb3RrdTBYNW5pc2M5TnJKZW5HNTA1NkpOS0FR?=
 =?utf-8?B?QmJZQU9rVzhmczUvcGl5dXBFQWNBMEJIUmxwNkE1NWU1QzkyWEpxUGtIZllJ?=
 =?utf-8?B?VlpsS1lzSG9oT0JkNWhkeGRIdDRsa1RvQmtDVUw0Nmc3YVpvb0ZZbHNxVGVX?=
 =?utf-8?B?VGlGeU00cFhvVExhc3lObVRVVnQwSXFBVkZqNzhuV1UwajFRYTRrS2VaSWds?=
 =?utf-8?B?OHdEdzcvem5FWWxHYkxhMGw2dStYRjhsWkNwSlM2elpjb2JGWW50dmlkUkZy?=
 =?utf-8?B?VG1mWFA5Qjl2YVJMU3BLbmp4YVVrMzhRbEUzZGVIVEJ2ejFkN0VqV2orYU5E?=
 =?utf-8?B?U3pnc3l1MmsyVjJTcC9ZUjdpd1A5aXF5SWRqb2NUVUczNDF5S2ZYanVDNFZ2?=
 =?utf-8?B?czV0Tm9KM3FncHhNL2lDNExTT3ljZ1N6UWIwN2orbUY1VTdJWk1mcE9ocE1v?=
 =?utf-8?B?R0JpYVdTZFJWVzYrRnlaVEdIbmVTQWl1ZWY0bEFNYnVIaHFNM2NhdWQ0cVY0?=
 =?utf-8?B?YmtYV2ttN1hscHRsZnV2TlVWVnJDUFRrbEJIbExzMjEyaTRlZVFmK01STVNU?=
 =?utf-8?B?b1M1RkpGeHVHR1k2NlpZc2Q2akZINGxOTjZQSjJwUndLWDRSL2ZkdHBQSEdo?=
 =?utf-8?Q?IgAEaIlir/Zx2lT6e+Ks6iINlX1rGiaR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0JnaFl0Sm5jKzBNN3RVcE1QaXhoUGRMVG50RS9XekFVa3hNb2lid3ZOeDlw?=
 =?utf-8?B?OWl0dzRJY0Vqc2Z1cnV6WXhqMFBWM08wRzZaYkZidTBVSW5GbHZSa3AxZ3BM?=
 =?utf-8?B?bGRZV2Y2L3JGWVBYd3JwZnlVUjBORXhwZTlIZitHOGFHd2x2RXdRQWxHUVJw?=
 =?utf-8?B?bzFkSTJhck9kSjNFM0JMT0MrekZxeWhmSVVNeFRjWUFQdldIb3dTNGY3QS96?=
 =?utf-8?B?anZ1WG04bFdodENRYk9oaVlnK05PSm9pcGw2S2g2eUFncUxwVTZDcWhldkl4?=
 =?utf-8?B?Z2hiSGtUTEo0WmEwZm8yVXNZbFhtTTZ3amk2RUVRNjd0cHdWQ3o1a1BQeTZm?=
 =?utf-8?B?Z1NDNFBiOUhjc3lhMUU0Wi9MQk95ZmcyL2o4R1ZBSGpNSkk1Z1hLZENNUWp1?=
 =?utf-8?B?d0MrVXFXS1ZYZDlOc25tQ2xPWWRadVBUR1EyMERDRS9uMmpucy9NaVpjM3BC?=
 =?utf-8?B?QjNWNVk3MlFST29rTWxsUWpWYzNYbHRtcmtwY3REYTBKTkxzTEFoYXc4bXJt?=
 =?utf-8?B?L1RMZjllTnFwTjdkUHdXdkp5ZFhJTTNoa2dGNFZ5TWg0VTVUZUd0UVJKUVNi?=
 =?utf-8?B?S2pZU0tDTjQzMExIbFplZmpnRlFPT0VJR2JtZnBnWE1YcmFvSElRTnpIVGRM?=
 =?utf-8?B?VEltYWZPaFVQQ0hMdkxGYksvNGVERUtkR0RWYkx6bU5sMGhqWVJlNTRObG5U?=
 =?utf-8?B?TWZFZ2pKU3p0U1JxZENWb1FKR2tDbHJlZy9aWjdzWm1Lb1RoQ0FQcEdDUFZz?=
 =?utf-8?B?NmZRYUNhM2Vpbi9lM1M5Q3V4ZkFPRTFMcFZtTXV6eFEzTTgydXZxVXY4WkUy?=
 =?utf-8?B?WnN6Z0lHNlpuOW01OHN4T0UvY3diN1M2cStFQkk3WHQ0cFJQcXJTT1o3UkRj?=
 =?utf-8?B?cEZTUklNU24xN0tPLy9WY1Nkc1hxTnJ0MjJMUUlaNE9MQzhSSDYxQjZkNmo5?=
 =?utf-8?B?LzZLZHJaUTArSEY2blIxN2NXaFA3ZVFBYmdpTVkwNlVheE9sWWtrOGZJT2hH?=
 =?utf-8?B?dHQ0WmFwRzNqVHdKSGdJVEdrNkt5Z2RkSzdoWTlCZ2V5a3RSVmR2M0pQNkk2?=
 =?utf-8?B?Qm83bkNxWGx3U05qSlRGWlBnZ3VDeGlaMzk2Z2ZIczI4MnRtekdRbnppRGlP?=
 =?utf-8?B?QkduTEM0YmNwTU9udDQxeW1Ub3lPb3JEMnZtUmNLL2ljandvQlpzS1J0T2hI?=
 =?utf-8?B?R3RoSytrRHVoMzBscVNHWkovaVRCSjNVdUlXVlJDeE9SaFcwaFQ5SWxjQzhE?=
 =?utf-8?B?V1pHWnBSbUoxUWg2MXBSK0JZK3kzcjVJZzl5dXc5M1F1Umt0czZxQTQycFRZ?=
 =?utf-8?B?OGxDbEJ3RW1WdWJXMzAxL2VISlZoSXdoS1luNWpURk5NMjlBZWpsS0dqa2Fk?=
 =?utf-8?B?QTJGbFB2MDlTTkY5Nm4rdEVySkxxMlBwdGp2N3dVT21kZGNsdXUzMFdUditt?=
 =?utf-8?B?Y2lIRVBxeU00eTNTS2hUYUtpcERlVk1qUW04bnZWSFBPQlk2OG50bkEvNUlv?=
 =?utf-8?B?U01tZ214NnJ5Wkc1NjE4ZmhrOVUyVUF2LzFMWWtTVm92bGN6bmNtTEpUVlhK?=
 =?utf-8?B?MVJrN3luWXpYa21IblBwODNyNk11d0l0YkQ1dmZLdFlzMlRBeFFzNWlPTEVD?=
 =?utf-8?B?Z25ycElRQXhyNVhLbkNWVkF5ci8wZmtmd2pURG9GL2U5Z1ZpZ0w0U2JzZk1I?=
 =?utf-8?B?Slc0VHhLOTR1MXh1eVMrTFdiQmE5VnlTTmQwbFFqd05VKzJ6VHlaeGdJVVJw?=
 =?utf-8?B?TExCa3JSODNwWEx4RWhTcUtYVjBJNWhLRUIvelBJVTJxOFNPdHRIWVFYdEIv?=
 =?utf-8?B?U2hCUWVpdVI2ZWVWKzZOMlc3cEdjTXRCTHdPOUlqY1lzbjRkNDFvZWxlSEJl?=
 =?utf-8?B?M1FyeUM1aTNBVDVudm9iUjJKQUNkZGdSTzJHN1JGZG0yMnBCUWJrZjdTVldZ?=
 =?utf-8?B?d0N0ZEtvQS9uTUV6Q0I3eTVjdVlMTFltdHk0bmdNdlBhZ3Q5UDBSTVU1ZFdU?=
 =?utf-8?B?UndGOFJQdVpJRXhxYjJjL3M1dEpFMXBjK3huUTZqQmQyWG9ya3REWlVtZnlR?=
 =?utf-8?B?WEdBRXFZYVJ1YzNtOSs3Y3k3NmhVamNuRWd6YjBPMWdRSnpDVWE1ZUtVcGN2?=
 =?utf-8?B?L1BYYXZ0N05jUldJRUxmRmQ4anArclFMYUpwdjNDang4bFNNTUFiRDlBdkpY?=
 =?utf-8?B?RVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <55C74D46CC59BD48BE5E3224AB6EB553@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f253e25d-0232-4982-0517-08dd269e7c99
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2024 17:47:09.3132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aaGhWRfTqr/5ESGEKbmJT6mdn6r9ECa3IoO5p/gZv/+kY27kHQv5Gt+NVm9p+PQYSvGBoMtYaqANKKQgj18ong==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8719
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

T24gRnJpLCAyMDI0LTEyLTI3IGF0IDA5OjI2IC0wODAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6
DQo+IE9uIEZyaSwgMjcgRGVjIDIwMjQgMDY6MjQ6MjIgLTA4MDAsIFNvdXphLCBKb3NlIHdyb3Rl
Og0KPiA+IA0KPiA+IE9uIFRodSwgMjAyNC0xMi0yNiBhdCAxOTozMSAtMDgwMCwgRGl4aXQsIEFz
aHV0b3NoIHdyb3RlOg0KPiA+ID4gT24gVGh1LCAyNiBEZWMgMjAyNCAwODoyMzoxMCAtMDgwMCwg
Sm9zw6kgUm9iZXJ0byBkZSBTb3V6YSB3cm90ZToNCj4gPiA+ID4gDQo+ID4gPiA+IFRoaXMgcmV2
ZXJ0cyBjb21taXQgMTQ2MGJiMWZlZjljY2Y3MzkwYWYwZDc0YTE1MjUyNDQyZmQ2ZWZmZC4NCj4g
PiA+ID4gDQo+ID4gPiA+IEluIGFsbCBwbGFjZXMgdGhlIE1JX1NUT1JFX0RBVEFfSU1NIGFyZSBu
b3QgZm9sbG93ZWQgYnkgYSByZWFkIG9mDQo+ID4gPiA+IHRoZSBzYW1lIG1lbW9yeSBhZGRyZXNz
IGluIHRoZSBzYW1lIGJhdGNoIGJ1ZmZlciBhbmQgdGhlIHBvc3RlZCB3cml0ZXMNCj4gPiA+ID4g
YXJlIGZsdXNoZWQgd2l0aCBQSVBFX0NPTlRST0wgb3IgTUlfRkxVU0hfRFcgaW4geGVfcmluZ19v
cHMuYyBmdW5jdGlvbnMNCj4gPiA+ID4gc28gdGhlcmUgaXMgbm8gbmVlZCB0byBzZXQgdGhpcyBy
ZWdpc3Rlci4NCj4gPiA+IA0KPiA+ID4gQXMgSSB3YXMgc2F5aW5nIHRoaXMgY29tbWl0IG1lc3Nh
Z2Ugc2hvdWxkIGp1c3QgYmU6DQo+ID4gPiANCj4gPiA+IEluIGFsbCBwbGFjZXMgd2hlcmUgTUlf
U1RPUkVfREFUQV9JTU0gaXMgdXNlZCwgcG9zdGVkIHdyaXRlcyBhcmUgZmx1c2hlZA0KPiA+ID4g
d2l0aCBQSVBFX0NPTlRST0wgb3IgTUlfRkxVU0hfRFcgaW4geGVfcmluZ19vcHMuYyBmdW5jdGlv
bnMsIHNvIHRoZXJlIGlzIG5vDQo+ID4gPiBuZWVkIHRvIHNldCB0aGlzIHJlZ2lzdGVyLg0KPiA+
ID4gDQo+ID4gPiBTbyBhY2NvcmRpbmcgdG8gbWUgdGhlICJhcmUgbm90IGZvbGxvd2VkIGJ5IGEg
cmVhZCBvZiB0aGUgc2FtZSBtZW1vcnkNCj4gPiA+IGFkZHJlc3MgaW4gdGhlIHNhbWUgYmF0Y2gg
YnVmZmVyIiBpcyBpbmNvcnJlY3QsIGl0IHdpbGwgd29yayBldmVuIHdpdGhvdXQNCj4gPiA+IHNl
dHRpbmcgdGhlIGZsYWcuDQo+ID4gDQo+ID4gTm90IG9uIFhlMissIHdpdGggQ1NfUFJJT1JJVFlf
TUVNX1JFQUQgc2V0IHRoZXJlIGlzIGEgcHJpb3JpdHkgcGF0aCB0bw0KPiA+IG1lbW9yeSBmb3Ig
cmVhZHMgYW5kIG90aGVyIGZvciB3cml0ZXMuDQo+IA0KPiBPSywgaW4gdGhhdCBjYXNlIHBsZWFz
ZSBnbyBhaGVhZCBhbmQgbWVyZ2UuDQoNCnRoYW5rIHlvdSwgd2lsbCBzZW5kIHRoaXMgYWdhaW4g
YXMgdGhpcyB2ZXJzaW9uIHdhcyBub3QgcGlja2VkIGJ5IHBhdGNod29yayBvciBDSSBiZWNhdXNl
IGZyZWVkZXNrdG9wIHNlcnZlciByYW4gb3V0IG9mIGRpc2sgc3BhY2UuDQoNCj4gDQo+ID4gDQo+
ID4gPiANCj4gPiA+IEFueXdheSBhcGFydCBmcm9tIHRoYXQgbml0LCB0aGlzIGlzOg0KPiA+ID4g
DQo+ID4gPiBSZXZpZXdlZC1ieTogQXNodXRvc2ggRGl4aXQgPGFzaHV0b3NoLmRpeGl0QGludGVs
LmNvbT4NCj4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0
aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gPiA+ID4gQ2M6IEFzaHV0b3NoIERp
eGl0IDxhc2h1dG9zaC5kaXhpdEBpbnRlbC5jb20+DQo+ID4gPiA+IEZpeGVzOiAxNDYwYmIxZmVm
OWMgKCJkcm0veGU6IEZvcmNlIHdyaXRlIGNvbXBsZXRpb24gb2YgTUlfU1RPUkVfREFUQV9JTU0i
KQ0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNv
dXphQGludGVsLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUv
aW5zdHJ1Y3Rpb25zL3hlX21pX2NvbW1hbmRzLmggfCAxMyArKysrKystLS0tLS0tDQo+ID4gPiA+
ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jICAgICAgICAgICAgICAgICAgfCAxMSAr
KystLS0tLS0tLQ0KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMgICAg
ICAgICAgICAgICAgIHwgIDYgKystLS0tDQo+ID4gPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDExIGlu
c2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQ0KPiA+ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9pbnN0cnVjdGlvbnMveGVfbWlfY29tbWFuZHMuaCBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS9pbnN0cnVjdGlvbnMveGVfbWlfY29tbWFuZHMuaA0KPiA+ID4gPiBp
bmRleCBmNGVlOTEwZjA5NDMyLi4xMGVjMjkyMGQzMWIzIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUvaW5zdHJ1Y3Rpb25zL3hlX21pX2NvbW1hbmRzLmgNCj4gPiA+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL2luc3RydWN0aW9ucy94ZV9taV9jb21tYW5kcy5oDQo+
ID4gPiA+IEBAIC0zMywxMyArMzMsMTIgQEANCj4gPiA+ID4gICNkZWZpbmUgTUlfVE9QT0xPR1lf
RklMVEVSCQlfX01JX0lOU1RSKDB4RCkNCj4gPiA+ID4gICNkZWZpbmUgTUlfRk9SQ0VfV0FLRVVQ
CQkJX19NSV9JTlNUUigweDFEKQ0KPiA+ID4gPiANCj4gPiA+ID4gLSNkZWZpbmUgTUlfU1RPUkVf
REFUQV9JTU0JCQlfX01JX0lOU1RSKDB4MjApDQo+ID4gPiA+IC0jZGVmaW5lICAgTUlfU0RJX0dH
VFQJCQkJUkVHX0JJVCgyMikNCj4gPiA+ID4gLSNkZWZpbmUgICBNSV9GT1JDRV9XUklURV9DT01Q
TEVUSU9OX0NIRUNLCVJFR19CSVQoMTApDQo+ID4gPiA+IC0jZGVmaW5lICAgTUlfU0RJX0xFTl9E
VwkJCQlHRU5NQVNLKDksIDApDQo+ID4gPiA+IC0jZGVmaW5lICAgTUlfU0RJX05VTV9EVyh4KQkJ
CVJFR19GSUVMRF9QUkVQKE1JX1NESV9MRU5fRFcsICh4KSArIDMgLSAyKQ0KPiA+ID4gPiAtI2Rl
ZmluZSAgIE1JX1NESV9OVU1fUVcoeCkJCQkoUkVHX0ZJRUxEX1BSRVAoTUlfU0RJX0xFTl9EVywg
MiAqICh4KSArIDMgLSAyKSB8IFwNCj4gPiA+ID4gLQkJCQkJCSBSRUdfQklUKDIxKSkNCj4gPiA+
ID4gKyNkZWZpbmUgTUlfU1RPUkVfREFUQV9JTU0JCV9fTUlfSU5TVFIoMHgyMCkNCj4gPiA+ID4g
KyNkZWZpbmUgICBNSV9TRElfR0dUVAkJCVJFR19CSVQoMjIpDQo+ID4gPiA+ICsjZGVmaW5lICAg
TUlfU0RJX0xFTl9EVwkJCUdFTk1BU0soOSwgMCkNCj4gPiA+ID4gKyNkZWZpbmUgICBNSV9TRElf
TlVNX0RXKHgpCQlSRUdfRklFTERfUFJFUChNSV9TRElfTEVOX0RXLCAoeCkgKyAzIC0gMikNCj4g
PiA+ID4gKyNkZWZpbmUgICBNSV9TRElfTlVNX1FXKHgpCQkoUkVHX0ZJRUxEX1BSRVAoTUlfU0RJ
X0xFTl9EVywgMiAqICh4KSArIDMgLSAyKSB8IFwNCj4gPiA+ID4gKwkJCQkJIFJFR19CSVQoMjEp
KQ0KPiA+ID4gPiANCj4gPiA+ID4gICNkZWZpbmUgTUlfTE9BRF9SRUdJU1RFUl9JTU0JCV9fTUlf
SU5TVFIoMHgyMikNCj4gPiA+ID4gICNkZWZpbmUgICBNSV9MUklfTFJNX0NTX01NSU8JCVJFR19C
SVQoMTkpDQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYw0KPiA+ID4gPiBpbmRleCA4YjMy
ZmFkNjc4NzgyLi4xYjk3ZDkwYWFkZGFmIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfbWlncmF0ZS5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9taWdyYXRlLmMNCj4gPiA+ID4gQEAgLTU4MSw5ICs1ODEsNyBAQCBzdGF0aWMgdm9pZCBlbWl0
X3B0ZShzdHJ1Y3QgeGVfbWlncmF0ZSAqbSwNCj4gPiA+ID4gCXdoaWxlIChwdGVzKSB7DQo+ID4g
PiA+IAkJdTMyIGNodW5rID0gbWluKE1BWF9QVEVfUEVSX1NESSwgcHRlcyk7DQo+ID4gPiA+IA0K
PiA+ID4gPiAtCQliYi0+Y3NbYmItPmxlbisrXSA9IE1JX1NUT1JFX0RBVEFfSU1NIHwNCj4gPiA+
ID4gLQkJCQkgICAgTUlfRk9SQ0VfV1JJVEVfQ09NUExFVElPTl9DSEVDSyB8DQo+ID4gPiA+IC0J
CQkJICAgIE1JX1NESV9OVU1fUVcoY2h1bmspOw0KPiA+ID4gPiArCQliYi0+Y3NbYmItPmxlbisr
XSA9IE1JX1NUT1JFX0RBVEFfSU1NIHwgTUlfU0RJX05VTV9RVyhjaHVuayk7DQo+ID4gPiA+IAkJ
YmItPmNzW2JiLT5sZW4rK10gPSBvZnM7DQo+ID4gPiA+IAkJYmItPmNzW2JiLT5sZW4rK10gPSAw
Ow0KPiA+ID4gPiANCj4gPiA+ID4gQEAgLTEyMjUsOSArMTIyMyw3IEBAIHN0YXRpYyB2b2lkIHdy
aXRlX3BndGFibGUoc3RydWN0IHhlX3RpbGUgKnRpbGUsIHN0cnVjdCB4ZV9iYiAqYmIsIHU2NCBw
cGd0dF9vZnMsDQo+ID4gPiA+IAkJaWYgKCEoYmItPmxlbiAmIDEpKQ0KPiA+ID4gPiAJCQliYi0+
Y3NbYmItPmxlbisrXSA9IE1JX05PT1A7DQo+ID4gPiA+IA0KPiA+ID4gPiAtCQliYi0+Y3NbYmIt
PmxlbisrXSA9IE1JX1NUT1JFX0RBVEFfSU1NIHwNCj4gPiA+ID4gLQkJCQkgICAgTUlfRk9SQ0Vf
V1JJVEVfQ09NUExFVElPTl9DSEVDSyB8DQo+ID4gPiA+IC0JCQkJICAgIE1JX1NESV9OVU1fUVco
Y2h1bmspOw0KPiA+ID4gPiArCQliYi0+Y3NbYmItPmxlbisrXSA9IE1JX1NUT1JFX0RBVEFfSU1N
IHwgTUlfU0RJX05VTV9RVyhjaHVuayk7DQo+ID4gPiA+IAkJYmItPmNzW2JiLT5sZW4rK10gPSBs
b3dlcl8zMl9iaXRzKGFkZHIpOw0KPiA+ID4gPiAJCWJiLT5jc1tiYi0+bGVuKytdID0gdXBwZXJf
MzJfYml0cyhhZGRyKTsNCj4gPiA+ID4gCQlpZiAocHRfb3AtPmJpbmQpDQo+ID4gPiA+IEBAIC0x
MzkyLDggKzEzODgsNyBAQCBfX3hlX21pZ3JhdGVfdXBkYXRlX3BndGFibGVzKHN0cnVjdCB4ZV9t
aWdyYXRlICptLA0KPiA+ID4gPiAJCQl1MzIgaWR4ID0gMDsNCj4gPiA+ID4gDQo+ID4gPiA+IAkJ
CWJiLT5jc1tiYi0+bGVuKytdID0gTUlfU1RPUkVfREFUQV9JTU0gfA0KPiA+ID4gPiAtCQkJCQkg
ICAgTUlfRk9SQ0VfV1JJVEVfQ09NUExFVElPTl9DSEVDSyB8DQo+ID4gPiA+IC0JCQkJCSAgICBN
SV9TRElfTlVNX1FXKGNodW5rKTsNCj4gPiA+ID4gKwkJCQlNSV9TRElfTlVNX1FXKGNodW5rKTsN
Cj4gPiA+ID4gCQkJYmItPmNzW2JiLT5sZW4rK10gPSBvZnM7DQo+ID4gPiA+IAkJCWJiLT5jc1ti
Yi0+bGVuKytdID0gMDsgLyogdXBwZXJfMzJfYml0cyAqLw0KPiA+ID4gPiANCj4gPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9yaW5nX29wcy5jIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3Jpbmdfb3BzLmMNCj4gPiA+ID4gaW5kZXggYzhhYjM3ZmEwZDE5OC4uOWYzMjdm
MjdjMDcyNiAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdf
b3BzLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMNCj4g
PiA+ID4gQEAgLTcyLDggKzcyLDcgQEAgc3RhdGljIGludCBlbWl0X3VzZXJfaW50ZXJydXB0KHUz
MiAqZHcsIGludCBpKQ0KPiA+ID4gPiANCj4gPiA+ID4gIHN0YXRpYyBpbnQgZW1pdF9zdG9yZV9p
bW1fZ2d0dCh1MzIgYWRkciwgdTMyIHZhbHVlLCB1MzIgKmR3LCBpbnQgaSkNCj4gPiA+ID4gIHsN
Cj4gPiA+ID4gLQlkd1tpKytdID0gTUlfU1RPUkVfREFUQV9JTU0gfCBNSV9TRElfR0dUVCB8DQo+
ID4gPiA+IC0JCSAgTUlfRk9SQ0VfV1JJVEVfQ09NUExFVElPTl9DSEVDSyB8IE1JX1NESV9OVU1f
RFcoMSk7DQo+ID4gPiA+ICsJZHdbaSsrXSA9IE1JX1NUT1JFX0RBVEFfSU1NIHwgTUlfU0RJX0dH
VFQgfCBNSV9TRElfTlVNX0RXKDEpOw0KPiA+ID4gPiAJZHdbaSsrXSA9IGFkZHI7DQo+ID4gPiA+
IAlkd1tpKytdID0gMDsNCj4gPiA+ID4gCWR3W2krK10gPSB2YWx1ZTsNCj4gPiA+ID4gQEAgLTE2
Myw4ICsxNjIsNyBAQCBzdGF0aWMgaW50IGVtaXRfcGlwZV9pbnZhbGlkYXRlKHUzMiBtYXNrX2Zs
YWdzLCBib29sIGludmFsaWRhdGVfdGxiLCB1MzIgKmR3LA0KPiA+ID4gPiAgc3RhdGljIGludCBl
bWl0X3N0b3JlX2ltbV9wcGd0dF9wb3N0ZWQodTY0IGFkZHIsIHU2NCB2YWx1ZSwNCj4gPiA+ID4g
CQkJCSAgICAgICB1MzIgKmR3LCBpbnQgaSkNCj4gPiA+ID4gIHsNCj4gPiA+ID4gLQlkd1tpKytd
ID0gTUlfU1RPUkVfREFUQV9JTU0gfCBNSV9GT1JDRV9XUklURV9DT01QTEVUSU9OX0NIRUNLIHwN
Cj4gPiA+ID4gLQkJICBNSV9TRElfTlVNX1FXKDEpOw0KPiA+ID4gPiArCWR3W2krK10gPSBNSV9T
VE9SRV9EQVRBX0lNTSB8IE1JX1NESV9OVU1fUVcoMSk7DQo+ID4gPiA+IAlkd1tpKytdID0gbG93
ZXJfMzJfYml0cyhhZGRyKTsNCj4gPiA+ID4gCWR3W2krK10gPSB1cHBlcl8zMl9iaXRzKGFkZHIp
Ow0KPiA+ID4gPiAJZHdbaSsrXSA9IGxvd2VyXzMyX2JpdHModmFsdWUpOw0KPiA+ID4gPiAtLQ0K
PiA+ID4gPiAyLjQ3LjENCj4gPiA+ID4gDQo+ID4gDQoNCg==
