Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2CFD3C537
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 05:05:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F38110E0F5;
	Fri, 18 Oct 2024 05:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hLsnr8w0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64ED310E0F5
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 05:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729227929; x=1760763929;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pBWPm/t7F8bDsbrlhech59HLXQn9hEsyoy28gbBVw64=;
 b=hLsnr8w0rLvhQWqjYQ1qeCeGh8OJsITa+6dGvBf4ZIVFuif/XLFQ1bsY
 KFKcc7+r5a7UATcdTNt2tMrK2ek+gVeRe0c3gHrg0KqAO7Zr69dkXcgm3
 1LwfgXtyt0s3Qd/AHXYH5UhtrVid6F6MWwS//wf819yh982y/GD3V3kka
 uGpSxA5UICQa+tAQpg87+2cp0vORAkxpGc4ULytcnZhL9upJt0rXtRFUc
 AnWQ5H1Id1qjS1KG18RNCo6zgxLXTiCkmoUPfoTSHAVUqYCtGb80uQ75L
 c9Oq6q4B0VrclkZd3nhsK/TWocmqFSIVD5RjGYpV40jQAuZjD+YoVYHs5 A==;
X-CSE-ConnectionGUID: 3Bk86cXaQf2hdcd71tpO4w==
X-CSE-MsgGUID: 37VYVaKoTaGwalalhZ7W+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28627776"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="28627776"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 22:05:26 -0700
X-CSE-ConnectionGUID: jY1qztKPRZ2SqEf7i4w1TQ==
X-CSE-MsgGUID: Va6TABAjT623islgvmJV6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="79562644"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 22:05:25 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 22:05:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 22:05:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 22:05:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xs8kQ4wYV5zjw4ZDfTxxO8YRTXsxPm5EZiK2GasRA994FN/zIbOuZ7s9eawtlIUxcI5aYgKCMBYLD0DIteiHsNYDFnE6DaH6VUjjb5i5Xdiyh7s4XW7YymFB00zkUdckCPyQe5mRSRxWIwy0vAYhceryhXMae8QQUb2ZzGl55qsUstpNV30+KlNJHHYUExUu5oMSMwXOn8eulndMZPiYv8gxSp5S8RbEGhvRplMCBX48Fozc/gYYPD22QOpEa/lSD56bLBOKVjvXpXdSxPlJkO1Kja+tBBb2DGGpb+h7OuazIb69ySD/J7V8p3tn3Au4ut2BnFLiTtqyITv4e2raOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBWPm/t7F8bDsbrlhech59HLXQn9hEsyoy28gbBVw64=;
 b=y8cPiWvG9PIz6T5ea2+NpCyTFnndyuT71YCvFXSyJqKAPcJr8WPKrxk/9baIz8ES/TbcfTjSIyWXaC66xezJ2VwCWByg9XtqpFzssNnXzhTiYk275UCvrV+1X5+BFeYqQUa9WNli5dk6aGHxXF7JXQW+BBduBnufWaJEqflsWmw24ghydtu61OHEJtJeEuuuNVJoA4H2yUgRnoRTXS/W1sNjzpv3SdroFeBVokIdenQ3knKHS8IdMMws3hHeiT1pcFXoF2YH+xwYitU2+xu4auCCZLcNj/NBvnDUJaKd/woRSKitDbTtJyTtFqN75ImohZ4f/oZoCOdtQmgX/n2Fhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by PH0PR11MB4917.namprd11.prod.outlook.com (2603:10b6:510:32::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19; Fri, 18 Oct
 2024 05:05:22 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45%7]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 05:05:22 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/i915/display: Workaround for odd panning for planar
 yuv
Thread-Topic: [PATCH] drm/i915/display: Workaround for odd panning for planar
 yuv
Thread-Index: AQHbEyrq7YQw4fCzWEaIpV6Ywf6aFrKJEpIAgAGdqACAAJO0gIAAy2jggAAA3nA=
Date: Fri, 18 Oct 2024 05:05:22 +0000
Message-ID: <IA1PR11MB64676F19FCF05A96B1EC365AE3402@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20240930112146.2673086-1-nemesa.garg@intel.com>
 <20241016072436.261438-1-nemesa.garg@intel.com>
 <SN7PR11MB6750713F83272902F5472C03E3472@SN7PR11MB6750.namprd11.prod.outlook.com>
 <9abd8034-abd5-48da-b5af-ec2f24bb0795@intel.com>
 <IA1PR11MB64675D48E2FBAE7A8BB4622BE3402@IA1PR11MB6467.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB64675D48E2FBAE7A8BB4622BE3402@IA1PR11MB6467.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|PH0PR11MB4917:EE_
x-ms-office365-filtering-correlation-id: 140d32a8-44aa-4482-08a1-08dcef327832
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WUtycjhETlpLck4xSCtyb2J0NzZVSTVhczIyRURGSkxGelZBYzFvRWJhZ3A5?=
 =?utf-8?B?NGQyMHFoeVVzVStyVmlzZVFNSkd3T2taYjBXNGJpWVhyaGlkWS9QT3NiSnVz?=
 =?utf-8?B?N3NMc1lIb1ZIWDVUV0NwSjRRZE9BWjU0Nk9zNW9Ma1hQbVZ2R21NOGtrOHp1?=
 =?utf-8?B?UXN3dHBVWGVPaEhiRHB6TWlxUjZjd2lTVlh1bFd4RVFUcEo4YkJyRWhtRmlB?=
 =?utf-8?B?YlBYemI5cHhLT1ZCY1N4b1VjTGQ2UUplTVluREE1b0lGZUZxUTN6b1F2bVlX?=
 =?utf-8?B?RCt0NGIxY1F1SjNyVkMzc2F0Qy8zM2FkQTJEYmV1QVdBL2t1TmJ0VTVxdE5G?=
 =?utf-8?B?dkloOFpwTi9sMk5taFl0MjcvNzQ5Wlp5c3lPdGVLMnBQaGlWRXZ0Z1E4bGVT?=
 =?utf-8?B?N1RzYndyeDhBMmJBSXhtOWoxM0hMcHcwSHNHTGlXYW5VVUorRU9Qd3o3MWph?=
 =?utf-8?B?ajd0VCtZWkNjM1BQdzNvZ3NJUUdOb0pZeGxsblJteTVzQkg1K0p0YjlQWmQz?=
 =?utf-8?B?VTA0STlic05SYmllZGNXckQwOW03ZFcvdmlXQjJQcmFHUGVRekhNdlJ1VEli?=
 =?utf-8?B?UTJodmJmdVNkMXNRSm5ra3dsTXBFWVhrZWY5K2l0WjE3YmxGZnhTTkh6QzIv?=
 =?utf-8?B?citPQk5zRU1ZZi9hYTdvREt1ZU9zZnovbE5FYW5xNFJQVU92T2JFK1d4b09H?=
 =?utf-8?B?WmQ5L0pDNkthNnlYZG03YkliZnJodU9XSUxYS0NHQk9sK201V0R6QVN2Nlh5?=
 =?utf-8?B?WHVpbXlCRnprTXhQeFR5NmhOWkprSXQxTWQ0MUFwK3hIQlRtVDV0alJiUmFh?=
 =?utf-8?B?L3FpNU9hWThVQ2hWTzNrSURFckxQdDdPNkRYMnNDdUVyNWpzUVh1QnZvQ3FV?=
 =?utf-8?B?a3VjYjhLbHoyV1J2MmJ0T1JCRnVwbHJRZmxVajQyN0grV1l1OEZKZFpKTXVJ?=
 =?utf-8?B?WXpFTGUyYjkwcnZCOHZGNUNsc1dOZHp5NVd6Zno5ZnA3Rk1BYXpINjZZeFY1?=
 =?utf-8?B?Y0dzcDBZVkJ5bTJ0SzlTVk1EUDZXSW11Y2UyNDZXdk1QbFlhSHFRWjNHNUVF?=
 =?utf-8?B?RFZmQzk4VXhEeVZxN09vNHdBNUFremlQeFdrMWVwa3hNL0NzVWIxREwyTHlD?=
 =?utf-8?B?MFl5TnN0NkdCNUhpd29TZVZzMnViSUZMQlFvWVF0RUliOXJDYmduZU9MN25w?=
 =?utf-8?B?TTdFNXZtQk5QNFE2OS93c0dwUGNmaDZmNEM5UnBjTEx5RUpaS1lPbkZVK2hh?=
 =?utf-8?B?a3JkYW1xSVZBZHFzVnhsSExkSUdKU2lQVHpkRHQxUUhOZDQwaElqWUQvbG5r?=
 =?utf-8?B?Z1RHcVoyV3ltWTFwWTFmUmMxaUNkb1dGT3ZZOEVQMkhXZHBERkFIblZibkpT?=
 =?utf-8?B?WHJjd1dhYmg1VHB0YlRabm5BV2VKdlhMTGZJRENucWpwV3oyb3dSajFjOFJU?=
 =?utf-8?B?a0ZvYy9lV3F1THZxQ2I4eVZ2UVk0c2pwekNXeUtndHlxYlVTcU96enBXaE1y?=
 =?utf-8?B?bkdtbVljU0N1Wk1Ua2JqSENxbDBOYk1OTDVLdFluYUkvK0N4Rzd6bXFzU1ox?=
 =?utf-8?B?TnJPbFhyaGtiYUdGL1hzUmhFNlYwa0k4ekt0b1R3VzNKR1JxUy9tS3JBa2dD?=
 =?utf-8?B?ZXF6di92eFlDZ2NQZ2pOUDAvTVhXOHB0TktuSUJ5aGdodFpzcG1uY1VpMU05?=
 =?utf-8?B?UlFiRVNoekZEanR5NmZqK0JHVmQ3aDltVmI0Tm5lTTFpeG5jdHNoYm9QNk9W?=
 =?utf-8?B?djhwNERtYzhzbWh0S2thU0JvNkIzMG1MYld3VHRNWTh3bEZDdzk4V2tTM2Qz?=
 =?utf-8?Q?BJZuhST+zo3Fh34iSNnocX9aZ2DJ3NmtDNXJI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L09lOTlDWFhUUFhJanRuR29DenhmNmFmcmF0TUh0WkJDQm5uSzIwRFZpVGNP?=
 =?utf-8?B?Y0l1WUlpMXBSNVN5UnBWWDRYODFhY2IvaVprU0ZjUTloYm1uVk5IczlIR0tN?=
 =?utf-8?B?cUE2ejRSa2FtVHF4K1RQZUhzdjVhNElzOTY5Mlk2RW4zOThYQ0F1YjFoN1g1?=
 =?utf-8?B?bU5vcEZxZ0FjUURmamFJTGJROHAwTDlMbHMrV1VDajYwVzNmRmFOd2N2R1cy?=
 =?utf-8?B?YlFISUZZUVZ6Q2xCRmlVeGpWM0E1czlKc2lnTzdQbTRlNk9XM1pmdElqL3RP?=
 =?utf-8?B?ZW5GNXBBd3VvWWJlbUp5cnhzV0tTc3VNK2hSSTlMdlRCd0JCWWUwQWh5T29Y?=
 =?utf-8?B?Y3hvWkpSTTd2RGxUaFVqZTh1VnRwZytUNU9iZ2VOZzFHQjN1ZTlFL0JvdjNG?=
 =?utf-8?B?WGlVeC9WbjkxRjdYdU9laTdJZUxtQ0dXSkhRZlRpbVVDS0hFbDBGQzJjU0Z3?=
 =?utf-8?B?MzRFZ0NFTWxTMldnOGE2bDhrR201cHhpbUVadFYxSlJtcDlMeGVOeXMyUWVS?=
 =?utf-8?B?SzROYmdaaHAvMy9mbGxiYWkzbUNVQzYvaVFQNzBwaC9TUHlkL1hCN2RNWkRU?=
 =?utf-8?B?QUVtaE5VOEZzUHRpVmxXdy9VQjJIMlJINmtJQlRhQm12enJOTnMwbWJqT1hz?=
 =?utf-8?B?RHFVUDJSZFVjNVJVMzhyYk53VEZ5RWJqSFphUU1EdGt2S0w0UFo2WERSY3RM?=
 =?utf-8?B?K3luSHlJSCtabnMvamRRMXpKZy81VTJiQUtsZXQ5b3Y4S2FyY0gzQ21hR3J2?=
 =?utf-8?B?aWFlWDZnUUdHeEFCRXh2VlFibmJpaVBCZjNIcFlBRHU2ZlNRSjVza25aeFVv?=
 =?utf-8?B?YVdYRm5QUjI2R1JBUlhXKzZwRHdtbytiYUxPUm5GMzhRaUhSaTE1aS95cFJZ?=
 =?utf-8?B?MHZwVWcxWUduUXdCU1g0TnZGWDFTYmJWL0c3a051cjhNdEJ2cTAvUE1JVlJ3?=
 =?utf-8?B?VzN1Y3p4RXAwd0JjMzMxYThDR3JNK2pQTFV4bXpwSFVJZ0FYZ3Q0ZW1ZblZY?=
 =?utf-8?B?Uk82NE9SclRxamdSVFlwZHQ1RGkxSnRtM1h1MDgyVkFPRGVRZmxHOG9KVHNZ?=
 =?utf-8?B?WjJKZVk0ZGFzMmJEQzFZS29iRmJ0TDczRzhveWpEdnhSc3NwMmhoMEs4eFdw?=
 =?utf-8?B?ZkwyQ2VPM2FQa2VoYkxYUmZqc2lublVXT0xYK21iZE5RZ0t1b3dUSWZSZTR3?=
 =?utf-8?B?ZkFNZFR5S1BGQUlyWXpha29GSkN0UGw1TUp0akhOWUQ4ZUVJWmUxVmVBMmMw?=
 =?utf-8?B?NVV4OGd6MGs1Vndzc2RlVm5IZ1lOQ0RsZWRiWUZueE1oOWdscHJWdHMvaWtR?=
 =?utf-8?B?SlJLa2V6U0daYjZYSkZ2VXFvN2l5MXFKRTU5SmNnMjZtdWtOZkFOZ3ErdkxU?=
 =?utf-8?B?ZHRvTk5ncFFoTHNXU0JiaXhYakVYMjZ1VFR0VzFMKzFDQmFLR1pJYWZKYUJn?=
 =?utf-8?B?SmJSVDROeTJMMFNUVGdlbTBLYXZmRFk4OEh1YUV6UXNxSUh6RjgxR0ZPdC9k?=
 =?utf-8?B?dllNV3F0SHBNNVNldUhlSkcvSnJUc2xTa2pIL3ExWGdoaE9KTUhsNjNpMGNv?=
 =?utf-8?B?Witzd1g3ZWFJMThOaDhBWXllTHhhUTlRa0dWQ3FLbHpEbjFIaGJ4VjRmOVVM?=
 =?utf-8?B?M0dIZVg2VEtLVmpIeitDRllzb3VQVUdqVFliRVl1cmwrVnh4R2pDVkhBUGd1?=
 =?utf-8?B?TnlVMDJrVTlxMXNQdjlLd1lnZm8xc0ZWeGszZzE3U0pVT2J6ZjIzUWZMcTdo?=
 =?utf-8?B?WFhISm5MRkdUc3YvdXJEdnZkcTNjV3cyVWpmdnlHODcwdkxWSytmZXpEQk41?=
 =?utf-8?B?SFVIaGt4L1NZWk1YQnNTWVZmcjJSVVQ5WlQ4V2VtSUlYMmVwbENXNGl6Z0RJ?=
 =?utf-8?B?eEJyZW5xTjI1cE9GVWF2c296T0Z4OVVZL2U5TDlxNEFZdkwzY3c1bFhvQnFV?=
 =?utf-8?B?UTNJWlFZRjA0U2R4d3dqNTdSRkFYUFBSQWhDRVdnUDZnNzRTVUEza3RYb2pK?=
 =?utf-8?B?SG1ZYjhpdVJYTFZrWm9OVkVYS1lBd1FYZmJ1eDBPdlBRdk5sbnZnbXQ5blVR?=
 =?utf-8?B?cW9WemZTWGxIc0UrczNBSTZPQjdPSk44YmVlNGM5Tzlrclo4blVSc2VQeVV2?=
 =?utf-8?Q?2ddRgx68GFVLC4ZxWVDAepgo2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 140d32a8-44aa-4482-08a1-08dcef327832
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2024 05:05:22.3337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z0iOzvEa2c1NvPKUhuHnTGdPr5BDyxj8XOnBbaqZlX5cFu3S/g6lZlgSKotjoX6B8DnhO60wO+5Lx1szsWIIHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4917
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2FyZywgTmVtZXNhDQo+
IFNlbnQ6IEZyaWRheSwgT2N0b2JlciAxOCwgMjAyNCAxMDozNSBBTQ0KPiBUbzogUG90dHVtdXR0
dSwgU2FpIFRlamEgPHNhaS50ZWphLnBvdHR1bXV0dHVAaW50ZWwuY29tPjsgS2FuZHBhbCwgU3Vy
YWoNCj4gPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPjsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+IENjOiBSb3BlciwgTWF0dGhldyBEIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29t
Pg0KPiBTdWJqZWN0OiBSRTogW1BBVENIXSBkcm0vaTkxNS9kaXNwbGF5OiBXb3JrYXJvdW5kIGZv
ciBvZGQgcGFubmluZyBmb3IgcGxhbmFyDQo+IHl1dg0KPiANCj4gDQo+IA0KPiA+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogUG90dHVtdXR0dSwgU2FpIFRlamEgPHNhaS50
ZWphLnBvdHR1bXV0dHVAaW50ZWwuY29tPg0KPiA+IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDE3
LCAyMDI0IDEwOjI0IFBNDQo+ID4gVG86IEthbmRwYWwsIFN1cmFqIDxzdXJhai5rYW5kcGFsQGlu
dGVsLmNvbT47IEdhcmcsIE5lbWVzYQ0KPiA+IDxuZW1lc2EuZ2FyZ0BpbnRlbC5jb20+OyBpbnRl
bC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiBDYzogUm9wZXIsIE1hdHRoZXcgRCA8bWF0
dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vaTkx
NS9kaXNwbGF5OiBXb3JrYXJvdW5kIGZvciBvZGQgcGFubmluZyBmb3INCj4gPiBwbGFuYXIgeXV2
DQo+ID4NCj4gPg0KPiA+IE9uIDE3LTEwLTIwMjQgMTM6MzUsIEthbmRwYWwsIFN1cmFqIHdyb3Rl
Og0KPiA+ID4NCj4gPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4+IEZyb206
IEludGVsLXhlIDxpbnRlbC14ZS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVo
YWxmDQo+ID4gPj4gT2YgTmVtZXNhIEdhcmcNCj4gPiA+PiBTZW50OiBXZWRuZXNkYXksIE9jdG9i
ZXIgMTYsIDIwMjQgMTI6NTUgUE0NCj4gPiA+PiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+ID4gPj4gQ2M6IEdhcmcsIE5lbWVzYSA8bmVtZXNhLmdhcmdAaW50ZWwuY29tPg0K
PiA+ID4+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2k5MTUvZGlzcGxheTogV29ya2Fyb3VuZCBmb3Ig
b2RkIHBhbm5pbmcgZm9yDQo+ID4gPj4gcGxhbmFyIHl1dg0KPiA+ID4+DQo+ID4gPj4gRGlzYWJs
ZSB0aGUgc3VwcG9ydCBmb3Igb2RkIHggcGFuIGZvciBldmVuIHhzaXplIGZvciBOVjEyIGZvcm1h
dCBhcw0KPiA+ID4+IHVuZGVycnVuIGlzc3VlIGlzIHNlZW4uDQo+ID4NCj4gPiAtIFByb2JhYmx5
IHdpdGggdGhlIGRpc2N1c3Npb24gYW5kIHRoZSBsYXRlc3QgdXBkYXRlIHRvIHRoZSBwYXRjaCB3
ZQ0KPiA+IHNob3VsZCBhbHNvIHVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gYXB0bHkgcmVm
bGVjdCB3aGF0IGFyZSB3ZQ0KPiA+IGRvaW5nIGhlcmUuIChXZSBjYW4gcmVtb3ZlIGV2ZW4geHNp
emUgcGFydCBvciBtYXliZSBnaXZlIG1vcmUNCj4gPiBleHBsYW5hdGlvbiBvbiB3aHkgZXZlbiB4
IHNpemUgaXMgbm90IGJlaW5nIGNoZWNrZWQgaW4gdGhlIHBhdGNoKQ0KPiA+DQo+ID4gLSBXZSBz
aG91bGQgaWRlYWxseSBiZSB1c2luZyB0aGUgd29ya2Fyb3VuZCBsaW5lYWdlIG51bWJlciBpbiB0
aGUNCj4gPiBjb21taXQgbWVzc2FnZS4NCj4gPg0KPiBTdXJlLiBJIHdpbGwgbWVudGlvbiB0aGUg
V0FfbGluZWFnZSBudW1iZXIuDQoNCj4gPiAtIEFsc28sIHNlZW1zIGxpa2UgTlYxMiBpcyBub3Qg
dGhlIG9ubHkgcGxhbmFyIGZvcm1hdCwgc2hvdWxkIHdlIGNoZWNrDQo+ID4gZm9yIGEgcGxhbmFy
IGZvcm1hdCBpbiBnZW5lcmFsIGluc3RlYWQgb2YgTlYxMiBzcGVjaWZpY2FsbHk/DQo+ID4gQ2M6
IE1hdHQgUm9wZXINCj4gPg0KPiBJbiBXQSBpdHMgbWVudGlvbmVkIHRoYXQgdGhlIGlzc3VlIGlz
IHNlZW4gZm9yIFlVVjQyMCBmb3JtYXQgc28gdGhhdCdzIHdoeSBJJ20NCj4gY2hlY2tpbmcgZm9y
IE5WMTIgZm9ybWF0Lg0KPiANCj4gVGhhbmtzLA0KPiBOZW1lc2ENCj4gDQo+ID4gVGhhbmtzDQo+
ID4gU2FpIFRlamENCj4gPg0KPiA+ID4+DQo+ID4gPj4gV0E6IDE2MDI0NDU5NDUyDQo+ID4gPiBU
aGlzIHNob3VsZCBiZSByaWdodCBhYm92ZSB5b3VyIHNpZ25lZC1vZmYtYnkgVGhlIHJlc3QgTEdU
TSwNCj4gPiA+IFJldmlld2VkLWJ5OiBTdXJhaiBLYW5kcGFsIDxzdXJhai5rYW5kcGFsQGludGVs
LmNvbT4NCj4gPiA+DQo+ID4gPj4gdjI6IFJlcGxhY2UgSFNEIHdpdGggV0EgaW4gY29tbWl0IG1l
c3NhZ2UgW1N1cmFqXQ0KPiA+ID4+ICAgICAgTW9kaWZpZWQgdGhlIGNvbmRpdGlvbiBmb3IgaGFu
ZGxpbmcgb2RkIHBhbm5pbmcNCj4gPiA+Pg0KPiA+ID4+IHYzOiBTaW1wbGlmaWVkIHRoZSBjb25k
aXRpb24gZm9yIGNoZWNraW5nIGhzdWINCj4gPiA+PiAgICAgIFVzaW5nIG9sZGVyIGZyYW1ld29y
ayBmb3Igd2EgYXMgcmV2MVtKYW5pXQ0KPiA+ID4+DQo+ID4gPj4gdjQ6IE1vZGlmeSB0aGUgY29u
ZGl0aW9uIGZvciBoc3ViIFtTYWkgVGVqYV0NCj4gPiA+PiAgICAgIEluaXRpYWxpemUgaHN1YiBp
biBlbHNlIHBhdGggW0Rhbl0NCj4gPiA+Pg0KPiA+ID4+IHY1OiBSZXBsYWNlIElTX0xVTkFSTEFL
RSB3aXRoIGRpc3BsYXkgdmVyc2lvbi4NCj4gPiA+PiAgICAgIFJlc29sdmUgbml0cGlja3NbSmFu
aV0NCj4gPiA+Pg0KPiA+ID4+IHY2OiBSZXBsYWNlIC1FSU5WQUwgd2l0aCBoc3ViIFtTdXJhal0N
Cj4gPiA+PiAgICAgIFJlbW92ZSBzcmNfdyBjaGVjayBhcyBub3QgcmVxdWlyZWQNCj4gPiA+Pg0K
PiA+ID4+IFNpZ25lZC1vZmYtYnk6IE5lbWVzYSBHYXJnIDxuZW1lc2EuZ2FyZ0BpbnRlbC5jb20+
DQo+ID4gPj4gLS0tDQo+ID4gPj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2F0b21pY19wbGFuZS5jIHwgNSArKysrKw0KPiA+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKQ0KPiA+ID4+DQo+ID4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWljX3BsYW5lLmMNCj4gPiA+PiBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWljX3BsYW5lLmMNCj4gPiA+PiBpbmRleCBlOTc5Nzg2
YWE1Y2YuLjJkN2NhNmU2MjkyNiAxMDA2NDQNCj4gPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2F0b21pY19wbGFuZS5jDQo+ID4gPj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hdG9taWNfcGxhbmUuYw0KPiA+ID4+IEBAIC0xMDMx
LDYgKzEwMzEsMTEgQEAgaW50IGludGVsX3BsYW5lX2NoZWNrX3NyY19jb29yZGluYXRlcyhzdHJ1
Y3QNCj4gPiA+PiBpbnRlbF9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUpDQo+ID4gPj4gICAJCSAq
Lw0KPiA+ID4+ICAgCQloc3ViID0gMTsNCj4gPiA+PiAgIAkJdnN1YiA9IDE7DQo+ID4gPj4gKw0K
PiA+ID4+ICsJCS8qIFdhXzE2MDIzOTgxMjQ1ICovDQo+ID4gPj4gKwkJaWYgKERJU1BMQVlfVkVS
KGk5MTUpID09IDIwICYmIGZiLT5mb3JtYXQtPmZvcm1hdCA9PQ0KPiA+ID4+IERSTV9GT1JNQVRf
TlYxMiAmJg0KPiA+ID4+ICsJCSAgICBzcmNfeCAlIDIgIT0gMCkNCj4gPiA+PiArCQkJaHN1YiA9
IDI7DQo+ID4gPj4gICAJfSBlbHNlIHsNCj4gPiA+PiAgIAkJaHN1YiA9IGZiLT5mb3JtYXQtPmhz
dWI7DQo+ID4gPj4gICAJCXZzdWIgPSBmYi0+Zm9ybWF0LT52c3ViOw0KPiA+ID4+IC0tDQo+ID4g
Pj4gMi4yNS4xDQo=
