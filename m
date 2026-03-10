Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899B5FD4F07
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 16:50:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4644610E1E5;
	Tue, 10 Mar 2026 16:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OuW+9see";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61EB310E1E5
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 16:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773161418; x=1804697418;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6WQ21j3QEGh5g2AlhaaohYCE2pWHCMlMbhiBlv1yJEY=;
 b=OuW+9seeQAX4rOD8iQsfwluuX0kFeX4N4WY1FUk4q9MMNUtojbkAV/+H
 xVpVAgtUNgwO441ct3F+oFpcEdxCx1rwXk/fMQwk3CYTSFHtH9Iwk16pr
 pL3n8rFnuLFxPqM/paZufiV0pAdMT33lrT6ij57ba5F19hR65mwp3CXk0
 buund/RyhLzaJnO7lKTvoH6IhkfLsqD91hm2dbXV92sqMjFhbKRcPJZ93
 PdxtWY1yrXo3x1JEpdaWZgzIeV7AcZYtCaUTbVZAjQCOUme8VTYW1/d45
 rw33UqKAalRHM2y1WGnDjOvbG2pYBQYCDFyrClF8AQJaEweHwPwn6eBfX A==;
X-CSE-ConnectionGUID: RjANixVqQs+8t0R1fy33sg==
X-CSE-MsgGUID: E6kf2G5tTZKGXlq1ruKOGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="99682213"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="99682213"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 09:50:10 -0700
X-CSE-ConnectionGUID: TVIcYtAxRaiohXsZLydu3w==
X-CSE-MsgGUID: wRcRSs/hSN6+wFiUVKenHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="222760873"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 09:50:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 09:50:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 09:50:09 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 09:50:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RGi+72d+2F9ry3O347srA1eTUpp9MFZP81fYezs6IHpEJr05H8+YCN8TxQBFD4yyh0J/IYd6qTxFbGS7DGWXnucFVyVc2K5EF04LpskmqOheGh8ANTgnPtz2YoBHypB6p3mVh70o13vOObeeqCaEIrhJQUEtsHMAws1yS4MjiQpsDjXjolticzG0qselLSfM83rvMHBag2FdVwEF8OYaK3AvEhDzYCY70l+0Y3YgFUercOy1v1VBSaWmnuuCOnWbv4gt0xTFqbvCO3mYz4SAUENVwipE26qDLX6Y/3Q7nffnsjtc5vhr2M4mNi8WL35Lc68mZH1dnDk6S+8wQsd6lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WQ21j3QEGh5g2AlhaaohYCE2pWHCMlMbhiBlv1yJEY=;
 b=An0qpMrqXiBzYC9vdC3fvo5DmzYeD70Fsm4D6qESTnTgJ6XvCZD++Ic9lXwNi23WxdrJInWA09yWHMhMwOKWMx3zsWxRRvgg7aXGyv0REIjPRtvkcXaXLm89Ry/Z7VBClaib/BNtJuYC/GWBGjnhuoIf1yAsKWSuPzoe4wsuc22ZgxfTmyDFjJias9FFbtKnEe0baGgQz6asnAfG+GLviqaXu2yZk+jKXa+NizKgC+Ywvb0EL19IrjLmcac3wVPpVsiDDi0q8JNbeGG7m8Wj9JVQl0XmJJCG/ESU5ptFThimaTIUMdsqWBoTCPMCYRjjDhJcDAmWktMo5zLkgrbagA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB7076.namprd11.prod.outlook.com (2603:10b6:510:20f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 16:50:05 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 16:50:05 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBDSS5LVW5pdDogZmFpbHVyZSBmb3IgZHJtL3hlL3hlX3ZtOiBJ?=
 =?utf-8?B?bXBsZW1lbnQgeGVfdm1fZ2V0X3Byb3BlcnR5X2lvY3Rs?=
Thread-Topic: =?utf-8?B?4pyXIENJLktVbml0OiBmYWlsdXJlIGZvciBkcm0veGUveGVfdm06IEltcGxl?=
 =?utf-8?B?bWVudCB4ZV92bV9nZXRfcHJvcGVydHlfaW9jdGw=?=
Thread-Index: AQHcsKdKdEGwC7g0gUOPeHIxPjMH97Wn+e8w
Date: Tue, 10 Mar 2026 16:50:05 +0000
Message-ID: <CH0PR11MB5444C67854CC11FB8570A772E546A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20260310144914.7525-6-jonathan.cavitt@intel.com>
 <177315849909.340695.15397274662768315276@a3b018990fe9>
In-Reply-To: <177315849909.340695.15397274662768315276@a3b018990fe9>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB7076:EE_
x-ms-office365-filtering-correlation-id: 86d41e47-56cb-4e51-95f2-08de7ec514b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|38070700021|7053199007|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: i/2lvnbJPZKL8IvG2Tijc1iCuHP736ry5Qku5W9Y33smtkaTVLMpKfWdHMwlV8TupH8LZ40QZJGrSZ2obhsj2wYAYyj9KDDTd65aYVHl/nRvcbHuiDkwzXLCkbYag8diH4n/9lyJs7W0v0XiR0VBS+xZQgsdhPvGLeH6SitpFb9kf2VswWqeUdN0Vj5ogjQc2H+FEfqNpDSL+sCPwleGCzRhAwPl+tKw2iQiaPTnB0jd4ZIUZOsttXpn5pY1rvckwTEAE3265movef58m/y0oCHg2ksCxlDURl5iBczeLT0YQ+PO/IqOtlat/8rW7V2PpM5CaAsstYq5BQ/gA4FuFtG/kvFiLhH6KxSihs38GOJ7ZLoyGIet/w+lAAujaZ4bL1Dx5PVWfreS5nKtQs11jciOj6Ede90VBE5LcJqsTWfaRg3sxmk8+431z0WxYskNY7EaUFE6skqiUUa5ymR+otjZORt3h2a36+2L6uW6+wdKDvw000ix7b5/6OLJgVaflQ8DEUIB2kNST3Bc84z9SdYBhzBLlibaqjP8Q2v2h3vs/svZCWxCxzHPhq04DSvJZDKU6Z/mQWHZ9oS1WFi6kkXFuKsRTA9bLd4VMyF63Ho8Dn/z442fHU2iNzhGhr0V53mEHjWpwa/SzXazUdtOiBDgXdSzDDg4mGyBgw2S84xhiQ5i61mIpu7143XT8UaGdARAaj2txz9xlwseFeooq98YtRzc1YU4jdUa2tpwCZ5UKZz5b/Z33C+SubnbIb7O
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700021)(7053199007)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEN5MU5nbGVoQ0ltRzZ6RW82UEtpd2pIMkJmT3c3Z2x1b28vMW5UaDNQaGhJ?=
 =?utf-8?B?VEVPZ3Q2a1FpUkxaekpsL1MrZkJFd0U1TkhYMUNsZGpla2g2bVVTbDJYSWpL?=
 =?utf-8?B?US8yS3hRU3RoUUV5d1h4aXREWjJUdGRra2hRLzlSZGFWN3JkN3MwS2NnMExG?=
 =?utf-8?B?UmxYbDZHSnhPYk5HNzdFNlR4VFZ1TWxiOW9CNGs5a0NiMDMrN0NnRnp3d2tH?=
 =?utf-8?B?QXNaYlBJQitXbzBXczR6eFgxY0lYTmJ6SlN3T3puSGVBbzU1S2pTOUdYLzM4?=
 =?utf-8?B?Y2F6akNjaXJRbzNlaEhDdzdRdzFpdkxMVEI5S0hxaThRdm1Zd3lVcThGcGtJ?=
 =?utf-8?B?VHlBQVpQdElCaFp0VEttSlhxTCtNdDQ1MUNrQUpERlNRcHlyTTNIVmF0QWZl?=
 =?utf-8?B?S1Z1UHByRnZrY05VaENHWUZzNEZsc21yZzN0b2RtczZlTHVHc1FqNGU3cnJ3?=
 =?utf-8?B?VXJRYTNVSCtzWHExVjNZQ1BCWG5meUtHUElBTHJwWk9xbU1NeG1XeCsvWEVG?=
 =?utf-8?B?MUJ1WU55bGdCSDNIU0RLWjhaTXhHZXB2aUFQcFN6N3B3VWVlWTB6ek9zL1R5?=
 =?utf-8?B?MEdEL2NmSzlqWm9ueFJhQ2lzblpMblhoa25Halc4ZlhURUNhWDlmYjFhWC9q?=
 =?utf-8?B?a0tHWjV1cFYrNXpkcVBqNzJIYmFPOVkwTnBvVjJUZnhlM3ZLd20rQVNmTkFZ?=
 =?utf-8?B?UE1MU0wwYXpBYnFodWZyaEZHenZPam9oeVFpdzcycGx4MmZmRHRRektIWlJW?=
 =?utf-8?B?Y3NZNmswSkdvRGxaaUZscGxzNjYyaldQM0dURFdKQkFicFZVd0x6RkQvTkxC?=
 =?utf-8?B?QlRXVlZNejBodzJiZnlWQmJlVXd5VEk2VDl4TkhYZHU0bVY2dzB5NUxYMWlF?=
 =?utf-8?B?K1dXUG8zQUpOWnRoVjc3ZXRRUENnTytpQ01wSUlxNGxuNlplVzVCd1BvQ2R1?=
 =?utf-8?B?Qnp4Z1UyQkVaRVlDemt6UDlJdVdFWjB5QVQ4T1pzZ0ZyZlJXVjZoaS9vNUFK?=
 =?utf-8?B?T3JFVHVrWXREVDRRTnVmdmtPOFVUMHk4Yk8zMWpGMXE0SFJxYnlXeDZDZkU0?=
 =?utf-8?B?ZjMrV01NTHB3dTVZL2c0c0RmcERIWkZWZUhEQnJSOU11SW9uMElaZVV5Nlll?=
 =?utf-8?B?anF2UlZ3VkFPUURLNCt2ZEFhLy9NVjhGUmRqMDcvNFJsczBkTzY0cU1oUHBU?=
 =?utf-8?B?cVQxbHdwUFVTWU43WXoyZDBmQVVhWEZuR0FSbnpHNU5CNUtPZFArTUIvVzUy?=
 =?utf-8?B?djlYQ3JqNjVUWjRYQ01jdGgxVGU5djJhS1V6OGFaVnB6VmU5N0lvVjY1U3h6?=
 =?utf-8?B?VFc0T0ZqVDZFUzMrbjNQZkdFOWp3M3pWV2ptaGpHbHpPRnRrRTNiZ3pEdjQ2?=
 =?utf-8?B?Z0pBUHBCWlFwcVBKVnROSWdDL1FUZTJxanJveDNaUTQxZi93aWdNUUwwbzlJ?=
 =?utf-8?B?L2tBT2YwWnZ4NFhNVnFFUDMzcUp4OVpYaEJMNWN1OHh5cnFsRGxIOWxVdHNa?=
 =?utf-8?B?eWk5NkRMb3BsVVpGMkpvY3hZR3lJNllzSDRsKzhYcDNZd09pYk80bWZuMVgr?=
 =?utf-8?B?N2d1M1hDY1NRUWpuUndWN1lzTWgyUG5xTERRRnBBcDBTcUg5YXdpV3EzdVVR?=
 =?utf-8?B?VjI3dUllM2p2OHdkc0gxc09kWTM4SUVITWJ6MzkzZmJ3UmhnUlY5YTBzaG1w?=
 =?utf-8?B?NXRoajRWQk4zYjJVUEFLTnRMZ2pLOTQyTHlTaXVTbnA4RjJ3MjJWb1NlVjJx?=
 =?utf-8?B?d3IwVk4yWUNCSFdVY1lnWGo3Tlg1bW55QkNoenFqZWI5cTFNNW1NMTZhZE1x?=
 =?utf-8?B?aEFyMHFpczd0RXA4TVpDTEpQQ0lYekxIMXg3b1c2UW1KUDNMbFVlOEZrWHY1?=
 =?utf-8?B?WElTZkM5Vk9KUklkWlFiYmRCM1NHS2RSczlhUU9OazMzeVpxV0daZ2Q0QVFj?=
 =?utf-8?B?cHM4ZmppTVRZN3dqVFFCSDQveXlMNnBvZ1FkYndJMjZwVkI4WUt0Qi9Sclg0?=
 =?utf-8?B?elcrYm94QUNoZ3J3Nm9ESzFZcVZXWEhlUjJzY0lKdWxPK2x1eUI2S0c0bDVC?=
 =?utf-8?B?alJGQTdiWEFBKy9vMm9tWHc2anpTMlIxU1huMm5wR1M1V1lPSWh3eVR2a1BI?=
 =?utf-8?B?NHJBK1ZteWpjSzVjcjl4MkQwakdyaUtpZ2pZd0hsU0RTNEwrUjBITWxsaHVy?=
 =?utf-8?B?YTBDSDhPUFdRVGNJOTExYmpFSEtqL1ZTZVphVHh6aHdlVXcvYnhEQVdWNWNU?=
 =?utf-8?B?b2o3VlA1SjhLdEhlamhiNjVZeTZZQWZNckhBc0NodEN4aWtoRmdIaWpjaTRU?=
 =?utf-8?B?R2F6emZueWg3N1NBajhjdnFDZ1dSekpHY3NuZjNtZVFxNkg3WTkwU0JOUEZT?=
 =?utf-8?Q?e8sKmb7+wUqObhbNQa/jKpMFqTGh1ZwHvFEMoZl0AUVDJ?=
x-ms-exchange-antispam-messagedata-1: f8OfZjxtRe2w1A==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TgU0M2MBFhGJ6x/E+PzW8Qv1fu6yVDN8ozXMJWb7lhch4u+E5sDQjldGDu8a2GAhneUg1J70cAr4mkjGSQoSDK0Q2+2yxd8Qtzs5HxSr0X99aZNNpi+Z3pXpc7IWW1nLQcJj41Q91syF/vfmpePMKzI7wmzJ7vo+yQmlJlDCFKCbVQgqq80x5duNear63h/b0nE1W6M5pJErioxNj5za1vTzBesVXZGpafrkbIQXYciyB1Q2Rv/vbsxzG5Rsn2MNNDuMrNAtP7RZjaoZS0Kt8YBKJi1M+wFKx8Ch/FW9/4SmVrgJFCvBJ2Ec1LhLHTUDk5tHpKDVm+Fb+jMXnLp7dQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d41e47-56cb-4e51-95f2-08de7ec514b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 16:50:05.3656 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ErUXhbBBKHmI0xmFWErVirgpYDA7JLmZkLdOg99+Xm0L3QkwDvYtq7QY4SkZyyEYHzp9w7gDvyk9bRDCfSSVYv8hW16yowA+bHTNzqg+CNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7076
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

VGhpcyBmYWlsdXJlIGlzIHVucmVsYXRlZCBhbmQgd2FzIHJlc29sdmVkIGp1c3QgYSBmZXcgbW9t
ZW50cyBhZ28sIGJ1dCBpdCBwcmV2ZW50ZWQgQ0kgcnVucywgc28gSSdtDQpnb2luZyB0byBpc3N1
ZSBhIHJldGVzdC4NCi1Kb25hdGhhbiBDYXZpdHQNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IFBhdGNod29yayA8cGF0Y2h3b3JrQGVtZXJpbC5mcmVlZGVza3RvcC5vcmc+IA0K
U2VudDogVHVlc2RheSwgTWFyY2ggMTAsIDIwMjYgOTowMiBBTQ0KVG86IENhdml0dCwgSm9uYXRo
YW4gPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+DQpDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQpTdWJqZWN0OiDinJcgQ0kuS1VuaXQ6IGZhaWx1cmUgZm9yIGRybS94ZS94ZV92
bTogSW1wbGVtZW50IHhlX3ZtX2dldF9wcm9wZXJ0eV9pb2N0bA0KDQo9PSBTZXJpZXMgRGV0YWls
cyA9PQ0KDQpTZXJpZXM6IGRybS94ZS94ZV92bTogSW1wbGVtZW50IHhlX3ZtX2dldF9wcm9wZXJ0
eV9pb2N0bA0KVVJMICAgOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVz
LzE2Mjk2Mi8NClN0YXRlIDogZmFpbHVyZQ0KDQo9PSBTdW1tYXJ5ID09DQoNCisgdHJhcCBjbGVh
bnVwIEVYSVQNCisgL2tlcm5lbC90b29scy90ZXN0aW5nL2t1bml0L2t1bml0LnB5IHJ1biAtLWt1
bml0Y29uZmlnIC9rZXJuZWwvZHJpdmVycy9ncHUvZHJtL3hlLy5rdW5pdGNvbmZpZw0KRVJST1I6
cm9vdDouLi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmM6IEluIGZ1bmN0aW9uIOKAmHhlX2xy
Y19jdHhfaW5pdOKAmToNCi4uL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYzoxNTU0OjQzOiBl
cnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYX01BU0tFRF9CSVRfRU5B
QkxF4oCZOyBkaWQgeW91IG1lYW4g4oCYUkVHX01BU0tFRF9GSUVMRF9FTkFCTEXigJk/IFstV2Vy
cm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0KIDE1NTQgfCAgICAgICAgICAgICAg
ICAgc3RhdGVfY2FjaGVfcGVyZl9maXhbMl0gPSBfTUFTS0VEX0JJVF9FTkFCTEUoRElTQUJMRV9T
VEFURV9DQUNIRV9QRVJGX0ZJWCk7DQogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fg0KICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBSRUdfTUFTS0VEX0ZJRUxEX0VOQUJMRQ0KY2Mx
OiBzb21lIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzDQptYWtlWzddOiAqKiogWy4u
L3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6Mjg5OiBkcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLm9d
IEVycm9yIDENCm1ha2VbN106ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uDQpt
YWtlWzZdOiAqKiogWy4uL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NTQ4OiBkcml2ZXJzL2dwdS9k
cm0veGVdIEVycm9yIDINCm1ha2VbNV06ICoqKiBbLi4vc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo1
NDg6IGRyaXZlcnMvZ3B1L2RybV0gRXJyb3IgMg0KbWFrZVs0XTogKioqIFsuLi9zY3JpcHRzL01h
a2VmaWxlLmJ1aWxkOjU0ODogZHJpdmVycy9ncHVdIEVycm9yIDINCm1ha2VbM106ICoqKiBbLi4v
c2NyaXB0cy9NYWtlZmlsZS5idWlsZDo1NDg6IGRyaXZlcnNdIEVycm9yIDINCm1ha2VbMl06ICoq
KiBbL2tlcm5lbC9NYWtlZmlsZToyMTAxOiAuXSBFcnJvciAyDQptYWtlWzFdOiAqKiogWy9rZXJu
ZWwvTWFrZWZpbGU6MjQ4OiBfX3N1Yi1tYWtlXSBFcnJvciAyDQptYWtlOiAqKiogW01ha2VmaWxl
OjI0ODogX19zdWItbWFrZV0gRXJyb3IgMg0KDQpbMTY6MDE6MDRdIENvbmZpZ3VyaW5nIEtVbml0
IEtlcm5lbCAuLi4NCkdlbmVyYXRpbmcgLmNvbmZpZyAuLi4NClBvcHVsYXRpbmcgY29uZmlnIHdp
dGg6DQokIG1ha2UgQVJDSD11bSBPPS5rdW5pdCBvbGRkZWZjb25maWcNClsxNjowMTowOF0gQnVp
bGRpbmcgS1VuaXQgS2VybmVsIC4uLg0KUG9wdWxhdGluZyBjb25maWcgd2l0aDoNCiQgbWFrZSBB
UkNIPXVtIE89Lmt1bml0IG9sZGRlZmNvbmZpZw0KQnVpbGRpbmcgd2l0aDoNCiQgbWFrZSBhbGwg
Y29tcGlsZV9jb21tYW5kcy5qc29uIHNjcmlwdHNfZ2RiIEFSQ0g9dW0gTz0ua3VuaXQgLS1qb2Jz
PTQ4DQorIGNsZWFudXANCisrIHN0YXQgLWMgJXU6JWcgL2tlcm5lbA0KKyBjaG93biAtUiAxMDAz
OjEwMDMgL2tlcm5lbA0KDQoNCg==
