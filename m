Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FBCC87FC9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 11:08:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA3F10E1B2;
	Wed, 30 Jul 2025 11:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MH2eS4gV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA4B10E1B2
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 11:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753873720; x=1785409720;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pcbY5osx4Z89yi0fPe3aB5gOk49S4rgLb7oJnIL641M=;
 b=MH2eS4gV60Q9XMo7iMh4z8BM4QMUCEfgzMBxyTVFv02QrG8OsUOwjscV
 oRv5Gx6hh4e5IWjA7M/3Wd9s12HzxEzjWZ7vRjZPfGDsvJdmWY2GzCX7m
 ARnke1sUTX+FJ8+Oyrz6mxDQt7nmDxK3jk4PJD/2TN48vF6cZmohGcwvh
 zOOdoxSmmI0RdntsXtoC8+txrMpVerLOXMMF3M0HRqPXL98CXmUmbdj6a
 MmfbsduNrLNWeDAuZarIo5yrEAiX9rxPfuAFM72aG+/y/yQOnAoFbXxJJ
 tEF7sBGgL+C+hOYan0IK8IgylM7LP8eyOJ4eEm3YO7xow1qPTq6cVXRAT A==;
X-CSE-ConnectionGUID: TBaDgQ3jQdeg9+VgYXjFTA==
X-CSE-MsgGUID: 1yPRmaNVTaSqHIhEYSEj4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="67527573"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="67527573"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 04:08:40 -0700
X-CSE-ConnectionGUID: 2cFjjyjRRvSYBxtN8bgZNw==
X-CSE-MsgGUID: AZyrpZdeSOW+sLnX+HsNvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="163303476"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 04:08:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 04:08:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 04:08:39 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.47)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 04:08:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TN4ulyM64AuITb0h2PzsmKuzP4Dn9He2V8TDN59U4RudSfVEU6uKa027u9uHnZIf2Lq/am1oqSluQOT6tlxmwhXmsimC5PMfZeaBpwUIjD9VvXrm8/ASWqpkRUKrOIW6VLF34yTtwqVO+o10flDEz0r8q+Ip3NlCFU/qmJ35h+60RsulrnJxCszGhgYJrvcU2YEfTo1UK2sAIDYJcZ6G+O9Q+N2RSjFo4IfF0eirEv5w5K7wf+OqnUDSCg2bxLTXPqTD94C8mkkTRbrL/DSGY9nOjf9UFtkinZzbNGFWtuGbBrF/+yAPVOWPYla65Dx3l4MJP26xoJA749yXwJCPcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruvwAeGyhHwmTq/XelxDN6K/o+CbYCx0VBDMhCrSn8E=;
 b=SOI/S1LTA6K6JuwvgzKsTVsU1lj85M3bTWRVkL4yxEXZpbbv7lo/g1V+7826JMrlkuB0nGpqM0QlvPetZhRG/lD5RYHxeb7z8KYqjZ+rop8zw3KBbky4t0evMcgImWsWmmZwc/ZulJfXmagDDohtaLw1x08FAOoV9DKfy7mcKdjpaGs7Khbgat7doHAfFLdxwMYenhL0OdwFK707kdAbFywh0CYi42MrQOU2GYLFJoutYtGWmeJr7BdjmNojbRM38K18AwcvjHUY0PrWMQ0EjRIb8ZJRGTMucqa19Oqre5zWiejmqroSv2uogvjSVSNUTEhAsQG4BCMh757mMZj2ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DS7PR11MB5989.namprd11.prod.outlook.com
 (2603:10b6:8:70::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 11:08:23 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e%8]) with mapi id 15.20.8964.021; Wed, 30 Jul 2025
 11:08:23 +0000
Message-ID: <a7b2b9b7-aaf8-4141-b162-9d4a5fc81d2b@intel.com>
Date: Wed, 30 Jul 2025 16:38:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/23] drm/xe/vm: Add a delayed worker to merge
 fragmented vmas
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-22-himal.prasad.ghimiray@intel.com>
 <aIhQlxdb0778u1ad@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aIhQlxdb0778u1ad@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::9) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DS7PR11MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: cdf8e4f5-5a7c-4cea-394d-08ddcf59662d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVpmZHZpMnNGbFlEY25LMHlwSm05ZDVwVnRGN0hudW9ONzNnV3ZEQTFiUVh3?=
 =?utf-8?B?L09Nb3RQV2VEd1lyMXdFRFVrZ3F4QW9nMTBUamIvc2NXMERQMEw4SEZSWS8r?=
 =?utf-8?B?SkY2L3AwdUpwMVA5NEYzZVplVnhGZnF5MzlDMlZDNW83aklMNm52UWZzS0Vz?=
 =?utf-8?B?b0EybmtWaWhiVE9NQmMrM2J0UW1IQnh5eW1sSXRUSGVsUm9wbk9YbnJJUThV?=
 =?utf-8?B?dUpmK2ZUa1RtTWpWdUdWSHIrSEpydlB6N3BpelNxUjdRY3psWEVaL01ObGUz?=
 =?utf-8?B?VEZMNjExZ1c1Qmw5M3IzOS9wOCswOXcxc3cvVmtPVjNjS1A3bnJGWTVqS2xK?=
 =?utf-8?B?S1p3OXBGNDJ1ZFZlb1djVmhwNDdTaTF0NkRpOTdsMnlKQzBHQ3JlNjFBSmJr?=
 =?utf-8?B?VVhUeVdxdUJURG5tcGQrY1BoYWZ4L1k5SmdxVm40Q2k3SHBoeGVXamR2RkVF?=
 =?utf-8?B?ZXMwZncxS1ZtcW55VEhUWVh6OHFWRzN4NzM5L1BtUUYrK0JIb2tJY1ozeXQx?=
 =?utf-8?B?YityQnJVem9IZnlseHNHK0VCWWhESFNWeEpnbXhpU0tmVzNXcUlhUkZicVV1?=
 =?utf-8?B?OUZPYU5GdUZ3dzVmSUdFR0VCTTFqUG5QS1p5UENjQ0hPZGZKVmFKL2FkemFS?=
 =?utf-8?B?K0JhNDJOb0xJV09rTVE3THBVdlROWmo5REdoMTdlOElvWloyNnZjNW9taEJh?=
 =?utf-8?B?bDd5eHczZkFzemdKVXcxbnpkc1l6RldCMTdLZ2pFZWVnTG9YWXY4OTB2bkVP?=
 =?utf-8?B?L3g0eEVaOXRsMXZkaHZkSU9zaENTL084aS8rUTlaaWp0SVlWYzBReG5yZ0FE?=
 =?utf-8?B?TElIV3B0dk51bTV1d3BtbVRHYlcxd3ZnSTVZOGRCWHgzSEc4YVQ1eGU3SW1B?=
 =?utf-8?B?RlFhdW9FVFFCSVllMVExY0lHTEsrdWd3RVB6blBQYWl3L0lVZEJZUURtZG81?=
 =?utf-8?B?dEFtb1pYZ25KaGtvWVQwV3JYeWZSTjVEMXlHQ0RXQUZlT210eEdVbk1JSGd1?=
 =?utf-8?B?cFNmUUNLRVZzYnhWbnZxR2oxUlRsY1ZLWWl5RDlUZC8rL0lwTGQ0cSsvN1J6?=
 =?utf-8?B?UkdhOEdUN3JEcWV4RDhjUmVyeHRVd2dsTnhpOGJWNGJYdzl5SXdldFNieWs3?=
 =?utf-8?B?Rys3TlY0RE9RejJtQjRRK2t3RjNhVU5pUVN4TGVVTXkraXdVak5Na0tjUWgv?=
 =?utf-8?B?bE5WVFFWSVJnN0J3UHFpSVhSL3FqaldoN1lPdnhhTE9rQVZJbU1OUDFKTngr?=
 =?utf-8?B?NEZZZ1VVODB1QTZTUUpJSUlKRnRpOVdKcWJ1bzlqcmJOZS9ZVCtkSU9ZeVdY?=
 =?utf-8?B?Q2hIbUw3RjdZbEptdkVjR2g5VSt3V3ArTTRLNkZTQmsrQWVmTDU0ZW5qRHJ3?=
 =?utf-8?B?c0ZJSzB5YlhIaWV5U3d6ckVJYzJZOWJUcU9DYWx1OVdlWFFEOUtpZWJQbVd3?=
 =?utf-8?B?eTV2eVNPMTkxUjFXWm5ZaEhIYkFheUVNY3hueG53VlV1MVFIZ3pZZXBId1Ba?=
 =?utf-8?B?YnIxS1R3aWM5U2RrSXA4YzZpKzNNRHZMVWtydXR1RGdEa2haTEhwV1Z6ektQ?=
 =?utf-8?B?UmROU1RwNXlZSFh6T2lxaVBReFlpVUQvYVRZaThjTzhadmdBTXVZRllPRlJU?=
 =?utf-8?B?SnU4UXVqanRneUJuQ1N5Qmh1aFhta2lkSk5vSkVIejc0ZlROeWZ5SGNLdnZT?=
 =?utf-8?B?UzBkb0xuZ1FWV2hINXN2SEVBdXo5OFVMYS9scGFaeFdMNDgwVXdQOFZwOC9r?=
 =?utf-8?B?QnFZWk1OTHNvMFcxYU1rdzRtSTU4Q2NvTXlMUWYrT3hieE9ONUo3cnQwN2VQ?=
 =?utf-8?B?N3M3UU5jb0FYbVNRRXBjZUo5MEtjSFZhdThmV0lzcTZ2a2l1OGc4Rmdwcnc2?=
 =?utf-8?B?MHlKUTV0SkczUkZLWS9HV2MrTmVYUm42aW5jTFc4YUdEOFZTYUxVbmk5Mkcw?=
 =?utf-8?Q?+WBjRBxHxkU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGp6di9USTE1MytwL3djWmZPdHNPWlhxc3VGVEFOUUN3U3BLWm1iMU52amtu?=
 =?utf-8?B?cE5rbmdZTi9mMXRoU0RWaUs5TFMwOFZ1ZnhUcU9reWJxNlMyT0p4YUtVRFhl?=
 =?utf-8?B?TlczN1BtdWF0R1huZ3NmWWs0dHc4Q3lsK28vc1FlYlgwUHoxOWM4M1RtZWVv?=
 =?utf-8?B?TDV4ZzNLb1B0QzBCUFppWXpYWUNtUFF1dDlPTVltcGFTTzlycGRqK0QxS0gy?=
 =?utf-8?B?a1lyOW1ROU5RSnRRTmNCWWdWOGtRZDYwZ0hHaVEyY1R3UUVnZ0s3R0FWYnIx?=
 =?utf-8?B?U0x5VmRlYWZTbkxVYjVkYk52cW0yYStUUHlIalc1UUw5Q25GbXJmUjY0Uysw?=
 =?utf-8?B?SUFOSzJaTlc0ME1OZDV4VU4vSnNPN08wUkNNMzVJMy9iV29EUC9JYUdPdUJx?=
 =?utf-8?B?WEt1cTJ4c2txbEd6bWtqdU5vRXkwYjNGQ2xJbnRvcGcyNzVBTGZHMEo5L2Fi?=
 =?utf-8?B?U2EwZ2tpdU9JOVdyeE5KU1ZGMGgxK1B0aUp1VCtEa0xCVnIzSEJnMG10eDhk?=
 =?utf-8?B?OUQzR3BTYlFXRUxMUGZnc3lOYkhsVnQ5MGJod2RkcXdKV0o0bWxKVXBVS01l?=
 =?utf-8?B?UC96NElSNmhhaTZyYzhjdDFEbU00WFNKNVVPYnNTMkFTZTJrMlZyNURVSzNS?=
 =?utf-8?B?Q2pzb1JOaFdDNXppaDFheUc3MWpkNmgyK3gwVkJWRWFHVFQvVWl2SVViZlVt?=
 =?utf-8?B?M0R3bGVkQ1YycmQzaXFUZmdyaDFrenVXa2xyTzNua3hlSUpaMkZQdHdJdWJR?=
 =?utf-8?B?WjZJUG5LbWE2Y0x2ZjZmdnZ3VjFwaDFTdWl6Q0NUYlBMemJPNzBmL0d6dUs1?=
 =?utf-8?B?WWhOR3dIWW4rcEpjRDNsWGVWMUpZcEQ0WGo4K2RNcGhka2x1Y1BTeHJvbW5N?=
 =?utf-8?B?M21yQm1YQm9mYVVEOUVubDc3dzN2Und6VEg4eHdyNjlvU2F0blBPTFg4ejRL?=
 =?utf-8?B?RXppVUlsaXhOV1REcU1aakJiSlVpanZjaVZZM1JYUlFaZjJjZVU3OTVxdVJZ?=
 =?utf-8?B?TkZsaXl6Rkt0c29xSHJHaUJRb3QvN0ExWEtuV3gxRkxLNldzRG90VS9EYkZ6?=
 =?utf-8?B?MDhreDRqdHYwM3ptZEJhK1d4dUtpNnhlcGY3YlhNVTc5clhYZU1Pc3lDM0dH?=
 =?utf-8?B?WThlTHdTOFpMNnAxYnRsYjJzQVhQa1FVVWczd3VMMDdUQndkSnJnaXJLZkdy?=
 =?utf-8?B?VzVaVkpwM05SUzFFNXRHOW9GOU9TcU1kYU5nZzJhMkFrelFBT0FOc2h0Mjhq?=
 =?utf-8?B?Z1p5RU9VZmxvUE52a0JNREpuNnFDTEV2dlMrWGgwQU9YRmRxTGtPZU5pbjcz?=
 =?utf-8?B?by9sOWNZMWV5dlpyd1ltS1dmM25Oclc5aHpEOFJCSW52YVRUdllVNFhBcjNP?=
 =?utf-8?B?VXhwNGM4byt2bUlCU3FNWlBydWEySEwyUXNYUjlJUGh2YjRvQTc1bzFFRHhN?=
 =?utf-8?B?MUdJRzYvMHZCYVZKakdNVzRiMTJkeDFTd0dwd3JsdU1FVW5ES0pQdHdPRER2?=
 =?utf-8?B?Y0NxU1hTNHNLczlXcnFPU0FzNG9YQ05JMUloYU1hVUZrNU1uclFrNzVEWHpz?=
 =?utf-8?B?WXV2c01paTFJS1JpM2c1d0tsVHpHa2d3UkxjbVpQeS8yQS85UmE0TGhIc2lu?=
 =?utf-8?B?Z053cklPUm4zbHdlQzlJeG1qbGpFUkJWLytiMEZDU0gzTWhYMmZkUHpJb2hE?=
 =?utf-8?B?aUZKenQzS1BmYmd2N3A3dmgvSHEwaHZiUXZpOUY3SHN5OXEwcDdBL296ajZx?=
 =?utf-8?B?eUkzeEEyWDN4MnZmQUNZYTFXSTdEY2tmZTNGVlNGVGQyVEZFcm1vOGJBZ0Qz?=
 =?utf-8?B?dHNqbjdPY21WRWwxVkFnNnpHaFd6MFZuMTVwQVh4SzR0c3FjVGYzMTl5T21F?=
 =?utf-8?B?WXV2QUdSM1NDNTJ0K3crSzVBR3FnbVczaWw4bVZXU3ZrV2xVN0JhcU91ZGxJ?=
 =?utf-8?B?NllyWENab2dtZ0pUZUFHT29rZXBwcTkwL0t2WllWN0lCbEszUXBScDJGLy9k?=
 =?utf-8?B?bEk4YmJaaHhoV0J1RS9NRTVxM2tVbkFmR3Q0VWtGMTJGVGtrei9sK09wUVhZ?=
 =?utf-8?B?RGFpNE1zOHVSb0FDWGtJM0JHdWxDVm92OFZ2bmU1MUUrSUo2UDU5RlM5YXRT?=
 =?utf-8?B?RkRzY09KZks1UGl3ZmYrby9EcEdGdTE5bTJvcVBEZWl3cE41ZXY3MHc3TDRJ?=
 =?utf-8?Q?VHk6WG6aX2SySzJ2Fs84S4M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf8e4f5-5a7c-4cea-394d-08ddcf59662d
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 11:08:23.3783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: isWfl5BY9wy9JAkW+VoQUoeKpU79obe6gyFrVrgeHRt+9Zwa3ZSNWcMOxZkxr8Q1FFfXsnsZWvgrB+0uB/5PVGk+JIcXhgbXojp4HTuWd+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5989
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



On 29-07-2025 10:09, Matthew Brost wrote:
> On Tue, Jul 22, 2025 at 07:05:24PM +0530, Himal Prasad Ghimiray wrote:
>> During initial mirror bind initialize and start the delayed work item
>> responsible for merging adjacent CPU address mirror VMAs with default
>> memory attributes. This function sets the merge_active flag and schedules
>> the work to run after a delay, allowing batching of VMA updates.
>>
> 
> I think we will need someway to defragment but it might need more
> thought. The trade off between defragmenting on every insertion of
> mirror VMA (binding a BO back to mirror) and every unmap restoring the
> defaults vs. periodic worker needs to be carefully considered.
> 
> The trade off is more time up front (plus perhaps some additional
> complexity) vs periodic worker which blocks out all memory transactions.
> 
> Since this doesn't affect any functionality, perhaps table for now + we
> run this one by Thomas to formulate a plan / solution.

Sure, Lets discuss and conclude before taking the approach. Will be 
dropping this patch from next version and will post seperately in future 
after finalizing on it.

Thanks
> 
> Matt
> 
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c       | 126 +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_vm_types.h |  15 ++++
>>   2 files changed, 141 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 003c8209f8bd..bee849167c0d 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -1160,6 +1160,127 @@ static void xe_vma_free(struct xe_vma *vma)
>>   		kfree(vma);
>>   }
>>   
>> +struct va_range {
>> +	u64 start;
>> +	u64 end;
>> +};
>> +
>> +static void add_merged_range(struct va_range **ranges, int *count, int *capacity,
>> +			     u64 start, u64 end)
>> +{
>> +	const int array_size  = 8;
>> +	struct va_range *new_ranges;
>> +	int new_capacity;
>> +
>> +	if (*count == *capacity) {
>> +		new_capacity = *capacity ? *capacity * 2 : array_size;
>> +		new_ranges = krealloc(*ranges, new_capacity * sizeof(**ranges), GFP_KERNEL);
>> +		if (!new_ranges)
>> +			return;
>> +
>> +		*ranges = new_ranges;
>> +		*capacity = new_capacity;
>> +	}
>> +	(*ranges)[(*count)++] = (struct va_range){ .start = start, .end = end };
>> +}
>> +
>> +static void xe_vm_vmas_merge_worker(struct work_struct *work)
>> +{
>> +	struct xe_vm *vm = container_of(to_delayed_work(work), struct xe_vm, merge_vmas_work);
>> +	struct drm_gpuva *gpuva, *next = NULL;
>> +	struct va_range *merged_ranges = NULL;
>> +	int merge_count = 0, merge_capacity = 0;
>> +	bool in_merge = false;
>> +	u64 merge_start = 0, merge_end = 0;
>> +	int merge_len = 0;
>> +
>> +	if (!vm->merge_active)
>> +		return;
>> +
>> +	down_write(&vm->lock);
>> +
>> +	drm_gpuvm_for_each_va_safe(gpuva, next, &vm->gpuvm) {
>> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
>> +
>> +		if (!xe_vma_is_cpu_addr_mirror(vma) || !xe_vma_has_default_mem_attrs(vma)) {
>> +			if (in_merge && merge_len > 1)
>> +				add_merged_range(&merged_ranges, &merge_count, &merge_capacity,
>> +						 merge_start, merge_end);
>> +
>> +			in_merge = false;
>> +			merge_len = 0;
>> +			continue;
>> +		}
>> +
>> +		if (!in_merge) {
>> +			merge_start = xe_vma_start(vma);
>> +			merge_end = xe_vma_end(vma);
>> +			in_merge = true;
>> +			merge_len = 1;
>> +		} else if (xe_vma_start(vma) == merge_end && xe_vma_has_default_mem_attrs(vma)) {
>> +			merge_end = xe_vma_end(vma);
>> +			merge_len++;
>> +		} else {
>> +			if (merge_len > 1)
>> +				add_merged_range(&merged_ranges, &merge_count, &merge_capacity,
>> +						 merge_start, merge_end);
>> +			merge_start = xe_vma_start(vma);
>> +			merge_end = xe_vma_end(vma);
>> +			merge_len = 1;
>> +		}
>> +	}
>> +
>> +	if (in_merge && merge_len > 1) {
>> +		add_merged_range(&merged_ranges, &merge_count, &merge_capacity,
>> +				 merge_start, merge_end);
>> +	}
>> +
>> +	for (int i = 0; i < merge_count; i++) {
>> +		vm_dbg(&vm->xe->drm, "Merged VA range %d: start=0x%016llx, end=0x%016llx\n",
>> +		       i, merged_ranges[i].start, merged_ranges[i].end);
>> +
>> +		if (xe_vm_alloc_cpu_addr_mirror_vma(vm, merged_ranges[i].start,
>> +						    merged_ranges[i].end - merged_ranges[i].start))
>> +			break;
>> +	}
>> +
>> +	up_write(&vm->lock);
>> +	kfree(merged_ranges);
>> +	schedule_delayed_work(&vm->merge_vmas_work, msecs_to_jiffies(5000));
>> +}
>> +
>> +/*
>> + * xe_vm_start_vmas_merge - Initialize and schedule VMA merge work
>> + * @vm: Pointer to the xe_vm structure
>> + *
>> + * Initializes the delayed work item responsible for merging adjacent
>> + * CPU address mirror VMAs with default memory attributes. This function
>> + * sets the merge_active flag and schedules the work to run after a delay,
>> + * allowing batching of VMA updates.
>> + */
>> +static void xe_vm_start_vmas_merge(struct xe_vm *vm)
>> +{
>> +	if (vm->merge_active)
>> +		return;
>> +
>> +	vm->merge_active = true;
>> +	INIT_DELAYED_WORK(&vm->merge_vmas_work, xe_vm_vmas_merge_worker);
>> +	schedule_delayed_work(&vm->merge_vmas_work, msecs_to_jiffies(5000));
>> +}
>> +
>> +/*
>> + * xe_vm_stop_vmas_merge - Cancel scheduled VMA merge work
>> + * @vm: Pointer to the xe_vm structure
>> + */
>> +static void xe_vm_stop_vmas_merge(struct xe_vm *vm)
>> +{
>> +	if (!vm->merge_active)
>> +		return;
>> +
>> +	vm->merge_active = false;
>> +	cancel_delayed_work_sync(&vm->merge_vmas_work);
>> +}
>> +
>>   #define VMA_CREATE_FLAG_READ_ONLY		BIT(0)
>>   #define VMA_CREATE_FLAG_IS_NULL			BIT(1)
>>   #define VMA_CREATE_FLAG_DUMPABLE		BIT(2)
>> @@ -1269,6 +1390,9 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>   		xe_vm_get(vm);
>>   	}
>>   
>> +	if (xe_vma_is_cpu_addr_mirror(vma))
>> +		xe_vm_start_vmas_merge(vm);
>> +
>>   	return vma;
>>   }
>>   
>> @@ -1982,6 +2106,8 @@ static void vm_destroy_work_func(struct work_struct *w)
>>   	/* xe_vm_close_and_put was not called? */
>>   	xe_assert(xe, !vm->size);
>>   
>> +	xe_vm_stop_vmas_merge(vm);
>> +
>>   	if (xe_vm_in_preempt_fence_mode(vm))
>>   		flush_work(&vm->preempt.rebind_work);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>> index 351242c92c12..c4f3542eb464 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -374,6 +374,21 @@ struct xe_vm {
>>   	bool batch_invalidate_tlb;
>>   	/** @xef: XE file handle for tracking this VM's drm client */
>>   	struct xe_file *xef;
>> +
>> +	/**
>> +	 * @merge_vmas_work: Delayed work item used to merge CPU address mirror VMAs.
>> +	 * This work is scheduled to scan the GPU virtual memory space and
>> +	 * identify adjacent CPU address mirror VMAs that have default memory
>> +	 * attributes. When such VMAs are found, they are merged into a single
>> +	 * larger VMA to reduce fragmentation. The merging process is triggered
>> +	 * asynchronously via a delayed workqueue avoid blocking critical paths
>> +	 * and to batch updates when possible.
>> +	 */
>> +	struct delayed_work merge_vmas_work;
>> +
>> +	/** @merge_active: True if merge_vmas_work has been initialized */
>> +	bool merge_active;
>> +
>>   };
>>   
>>   /** struct xe_vma_op_map - VMA map operation */
>> -- 
>> 2.34.1
>>

