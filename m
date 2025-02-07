Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEF5C02194
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 13:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33DCA10E2DE;
	Fri,  7 Feb 2025 13:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CrgIgdyE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6040110E2DE
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 13:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738934694; x=1770470694;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4ou9u4z+r/MH7t95pSVHeDxEpuPPEGTRAEVhR/PGVP8=;
 b=CrgIgdyEt04icEah5DWz1si+oVXC8qcBm9M1lyOlwKzmnVyg4S0Wbuae
 8lvUfdeDJVV+Qxz1rg3Xx1k9Z8r9d7teb0+Ro4udneEbaS1gXJu0uoAXL
 Q7VKWKIIYASa3cCABAUcU6l7+Dmm6xTFJqWThBLP90pPNH6cHIM/DMAoc
 EzL90l2uXpdi+FrjaizivETtfOBT7OxKk6/xCZeX3RlH8nlqBQEvcak67
 XsctgUUX9VC0fCZKEcBzNPX60VvGCTUz8p/cu/eXDCk5XoRW1yT9PGDSw
 PXzuFVeaS4F1g6dDioX/+Y5X1JxiTEBZDtnJh+cUrXSxJRnZfrKaXECOu w==;
X-CSE-ConnectionGUID: 6QaZ3aKmTyWjZEE/OmMR6w==
X-CSE-MsgGUID: X1Y+Ch9rTCeuvsdXqA3nNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43495265"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="43495265"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 05:24:53 -0800
X-CSE-ConnectionGUID: ezkHexk0Q4uI1mV+s2RJog==
X-CSE-MsgGUID: j8HRB7s3R52Pl0CwTBecFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116724719"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 05:24:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 05:24:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 05:24:53 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 05:24:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVHjMnhgdKS/fnM1p65qdhilwcXf3VBUWm0UItZ3okUpti1FYQCbfAB0pHYaABzQwJnWDPwEc3hA06bz7rnvndjLME6spzDEatYi75lfUWqeQV+C198TxXdfHmr1byyGHfOM385UNiMnZf5S0WtmTEl1ik7yRrNGl0MWiNFARgD0SYdK/kI292t4ZGVbB/rYqKx9R9073a3YmwRF82a+YaThey1xSaa+AIDm+1GuD5X0c+ANbGfZJRzR8KrToQZc6sruopPUrjuU68Z2p0cLbcEaEQUE6d67dL6wSntuZFXLg4Y++BCPlP+xi1LjtS1K8U4pK1K3g3v0X07j2XHRcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ou9u4z+r/MH7t95pSVHeDxEpuPPEGTRAEVhR/PGVP8=;
 b=BssIbHCNM9D8S/WteOhOiCl7sST4CcKLPcb4a8TT323hb0mnz9Oogr+f2l5rHrzxWBQO75EBWLASQVXVDMcDnqMLBqQxl/tlcvipkquJ9hy+vEsgSzb3brgA+cT5N1ozFk2Hw5imIW+zv6Xwo60Mn5EwE194r8xixZlNNpEZrDugd79OjWUzifQTnoJXSCzIvESmckkOiVwmY/KA7CkWfDK1fwUfBgp13iMlezL8FzrWqjtw0P5F9DQE4QtU9Mb8imBtG6GXB9+PQ6xlXCotsImDBNhEx/esFmqCcksO+u/tKDhaJYZRHQmTC9Y66bBY33RpQ6d/Pf/hwdFZlSUESQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6696.namprd11.prod.outlook.com (2603:10b6:a03:44f::18)
 by SN7PR11MB7067.namprd11.prod.outlook.com (2603:10b6:806:29a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 13:24:44 +0000
Received: from SJ0PR11MB6696.namprd11.prod.outlook.com
 ([fe80::c25a:5de1:4bf0:4d8d]) by SJ0PR11MB6696.namprd11.prod.outlook.com
 ([fe80::c25a:5de1:4bf0:4d8d%4]) with mapi id 15.20.8422.011; Fri, 7 Feb 2025
 13:24:43 +0000
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, Thomas Hellstrom
 <thomas.hellstrom@linux.intel.com>, "Piorkowski, Piotr"
 <piotr.piorkowski@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Enable SR-IOV for PTL
Thread-Topic: [PATCH] drm/xe: Enable SR-IOV for PTL
Thread-Index: AQHbeOCLw91puNWWhkOSHNO/X9HgJ7M70pGA
Date: Fri, 7 Feb 2025 13:24:43 +0000
Message-ID: <SJ0PR11MB66960E99D097EF734F6F6A04ACF12@SJ0PR11MB6696.namprd11.prod.outlook.com>
References: <20250206214545.940-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250206214545.940-1-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6696:EE_|SN7PR11MB7067:EE_
x-ms-office365-filtering-correlation-id: cb089b39-212d-406c-a575-08dd477ac8e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZWRHVTJGbGFUWHVSSW04VS9EdUhHNnFSa3BWZmRIWWxXRzZIN1p3T1RKTzA3?=
 =?utf-8?B?RHM4Y1N1ZkxKL09xM1hiZkJuWWE4YjZhM3BwVGlBTGhxRXNHUytpeFFSaFJH?=
 =?utf-8?B?N29uK3g1Ymx1WUpSSXZHckZlbnZVQStVQTdFUlRxbTU3OE02ZjRqU1NEUG9o?=
 =?utf-8?B?WFJsTUlEZDU4Nm51Z1ZSWnYyclQzUUtGTVpUL3FoZWNvODRzSG0xRGdMWGg4?=
 =?utf-8?B?Vk80SWhaVk9pcEk4QTNDd3Rja0JQMW04OHdUTi92RTNndFhBK0dVeDNEL1pu?=
 =?utf-8?B?SHU2OTBGSGt6Q0hQczBoS1VXamNvZ2NPL0xMU0VJcjFHZEtXWmtacTU1a2la?=
 =?utf-8?B?OVJleExNZWxhV0VtNWxyNndqNjA3bDdCMmZJVXhXTE0ySy8xa0M2S2h0azRr?=
 =?utf-8?B?dml5Tk8wd2lYV2ZyNWlBOFFZSlNjM1RNR2xIVk0vblVtam1CdDdnRnVmSWM0?=
 =?utf-8?B?a0swM1BVcFFDQ1p0WHNmelh4YmtLc2REcC9SNTRYdnV1ZXZJWWZzL3YvVkw3?=
 =?utf-8?B?Mk1OaktVcWRhUGJMOThRUWFTSENJSTJ2RDNVVFFic3VsYWNHOEpnNG1EWVdT?=
 =?utf-8?B?Vjcwb2E0SHp6QWRiQlVRdFF1dkI3d3hxZTkva1Vac1YxWnFtQklUckFIb0hU?=
 =?utf-8?B?L2llWWZrN2dUeHFxN3pFVjdZMXNSQzVoMTVGWm5RSVRWWU1QdnpnVlhaWm93?=
 =?utf-8?B?Lys2dlRTZlRUQUFaSy84NDMwemxCSHdGRUxMNk9uQ2EvWHdkL1I3UndRSmQ3?=
 =?utf-8?B?empZc1pVTElWTVZCQzdqVXhpZ0h2cUZoR3BLemUxZG8wQnRRSHFXRGpKUVlV?=
 =?utf-8?B?M0E2S01rRHBXSFJreFVFWW1LNjhicTZmcHRTdzlMT3pRSEg3cGFESEdqaVhD?=
 =?utf-8?B?KzNiMXJ5UWpWdUxuYlNPTSt0c3VHOVZwdzA4SER6ZCt4UG9nTzdRdUk3SnFI?=
 =?utf-8?B?LzBCYjlHcVJGdnlRSWU4dDdxVEw4aHoyZytad3BWdGNwK3FLQ1JKc2dyc1FW?=
 =?utf-8?B?RDZibmJmNHJGeitEUW1MaXRwYUNOeGZTZEk2N1ZvSFIxeWtuVUQ1cEN2Nnph?=
 =?utf-8?B?OUV2TWs5OW9IOFJlMStjeFFIajZtaitOYTJIcWliSDFjbW8zYldUVi9FZ1li?=
 =?utf-8?B?ZHQ1YkRWSEE1K1V4dVRZUi9ncDlQTGhjSE0rSHdYU25OOXQrZ3R1Q1NpYWpF?=
 =?utf-8?B?QnVQNG5SOXZabkJ3bzZLd1NtV0FXc2Z4WDUydUhQN25LcE11bFBRWWFURWNW?=
 =?utf-8?B?RFBzci9ZWktKV0Y1S2M0ZDZhMVlla3hnaXc4MGkyL0JmYVZaR2FKZlFxZlh6?=
 =?utf-8?B?YzdVUTB6MlVLSVI2SUpKYTlkODZucUR2Sm9sbjhpZTRldmN2cXpNNjlSYXNR?=
 =?utf-8?B?c2t0NzByMkZZSUZpNEthRDZlS05Sb3N5aU1icjJGV0czMUdSeDJSRDlGdUdv?=
 =?utf-8?B?VzN1aU1tSW9xZE0xRVFSNnlqTDVKSVpjYmxOQ2Q0aXNMVENQM0lJZUluVEZx?=
 =?utf-8?B?WjFYS1RXMHBUYmNHaFc0N200T3VNWGozTmppTUxEeDNibVkwejRSSjJMMHFk?=
 =?utf-8?B?cHdubnBWa0J2bGVJTUgrLzlLMWs4bW9qUjE1V0xsV3k0eWpXMW5KamU1MWpj?=
 =?utf-8?B?eDVVOTVBVnRCS1ZmN1lqWTFMamgySU1EZEJ4dG1NOTc4T2tDNHZuaGRISnp6?=
 =?utf-8?B?bGgxWnpvaWg3SmFkeUErb2RUTDRYZ0VXK0MzM044SGpvVkxrT0VYcThBWnNs?=
 =?utf-8?B?ZGdWYkptVGlSQ2ZqWUNvVm1HRHRMYVpDQ1RQQ1oydlZ6ekpEbFlBbkV6N3dT?=
 =?utf-8?B?L1VQSkNCQ3VaZ3J2ZUlSd0g5Z25oOGFxYWM3RFBLaGl6QmtSREsrVWxaVFNX?=
 =?utf-8?B?aDBwb01QWnpBUWlBNlg2Q0VTc3BEaHZmNEdUbjN4RFcwc3ljT0VyYjhWSzR6?=
 =?utf-8?Q?fGwSsYTByoklyJQbhG555njPXHnKW+5E?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6696.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0VNeDIzVE5UblNWTjZQM25ZMFN5c3JSMlk3YzV0dExOVlk3SitkeEhjdTNV?=
 =?utf-8?B?c0FsSnVWVDI3TU1GclJQclhaYXl0MHBDNXFyTjV1bUYzdlJXbTdVTVdoZU9P?=
 =?utf-8?B?UW9HRUFvcVlYVmY2MUpVMlB4RWNJNEJuMjlvckZ6VEVQSHBaS09hbCticVBP?=
 =?utf-8?B?ZWdlZjZJTmFWckVtWGdWWmY3U3E3aHBTaDZFb2NzbEcrR25NbFd4SGZLTlM0?=
 =?utf-8?B?Q090SXhBMUZkVWNHZWhyLzByQjFkWHBpeGUwditYdy9EUHJZeW80TkwyY1Nr?=
 =?utf-8?B?dm0wdjcySGJwQ3RCbW9US09YVUswNkxOeWxSbGVtNU5Iby9wL2pKK1U4QnBO?=
 =?utf-8?B?aC9qR0tYaWViM1JEdXNHdmdtQVVsUk9STUU1MUVmS3Z5UUUzUG9ya01hMTZ4?=
 =?utf-8?B?bzlFWTFSNjE3TVZFemc3YmFuck0xSmlRbnQyOVQ0MFlvSElzOFdmSDlSR3VT?=
 =?utf-8?B?SENYUFZEenpZTDFTU0k0TnpWWFNKaExmK21WUUF2djJ6aDMzU3d4djlSb3ZL?=
 =?utf-8?B?aU9tYm51Y3lDOTJ4d2JxNzBvd0Q3RmtwU0NSeW45ejg3MzBFdDV3bkhHa0ll?=
 =?utf-8?B?RVRRNEx5alNnSTBYeGYwdzk5b0g4SXAzcGQ3OFExTWZEMTNQQ2xyd09XRTNj?=
 =?utf-8?B?SHJQUU8rWEZNSEd3NEEwMkFFR2NFUjRkczVyek5xL2s3czBRTC9zL2xmQStM?=
 =?utf-8?B?NHdMQW1saFk0Ujd5L25CVXhRalFvSG5LeTJlM29KSnhKRCtENkkxREhuQmVL?=
 =?utf-8?B?c2RuaVMxRjRXV1JlZitGVlh0WFpFZWhBRTg2SWE0dG1VdUIvK09vU0RYSURQ?=
 =?utf-8?B?cWNjcTFWc0YwVytmamVjMmFlRzNHODczemxJek9NNDRwWDdsbVkxU3hTa2pQ?=
 =?utf-8?B?UWh3aTR2b0ozdHI5NUZ2dFU1dWwvc2hJbnpWc0NEaGY0dmVGdGQwSVhhdE0y?=
 =?utf-8?B?My9oQVpVUklEL1lYd1RCVmlLcWJ1MFArUkhudGxjaFZ1UlpOTGQrSnU0NUlV?=
 =?utf-8?B?OTgvRnVWWjNvR3VvZUhtc2QzVW9qY1VXMHFpcmpvRzVCRWJ5MDdoZVZobTZh?=
 =?utf-8?B?SDdrZ2ZxblV6OHVhNXEvU2V1aWFNdTJSQ2RqanRaUDZxaU90SHZtZGVVZ0xH?=
 =?utf-8?B?bHovNndvNTdWcURRVGs0MDFjS0RlVGkyaXl6ZTcyeVppRjREOHVIVkYzaHgy?=
 =?utf-8?B?NndHMUJDK2ZHZ1hjMWlVVHltdWxxUHc4SStjbnU2bktocnI5SjRoZ2RyZHUr?=
 =?utf-8?B?VXNDT1QwQlV3N0VVTlVuNmZTZ2xhM1BsbXJHcENqV2QyYUdPdCszMkdXYXZr?=
 =?utf-8?B?aWpDb2tFY2pkSkRyUk1pbWZVMUlRUGxVUWtNbW9yVWFaRnQxREdqNVRtQW9I?=
 =?utf-8?B?UTMzVlJKb1hWQUMwa3ZpN2l4VTJQUXlEbjR3NG4yNzBLaXBhZkJUeFE0UVkr?=
 =?utf-8?B?UmYxR2VmWkVRM1IvbE1HVXpoN1ZvWXkrZUlVa1V1L25RNXMyNUoveTZVSlBZ?=
 =?utf-8?B?QnYvaGpPbGhreFV4d2lrckREcS9HaFZRNC9OZkI5NE1kL1A2elVxTnZGV2hS?=
 =?utf-8?B?b1lmTmQrUkJtd2FNRXpWdHJ6eFBuZVFPOEo0SXlGSGNiYUNhM0NDNVhhdW95?=
 =?utf-8?B?Uy96ZE9FZHpGbkU4NEpHN1BUU2E3bHVDZjJHdXk5MXBvRWxuU2k1VzFOME9n?=
 =?utf-8?B?YWNyWVlZai9ROWUrdk5RT090Q1FOajN5MFpCbDNnbllkMmxUaGNGelM0T1Y0?=
 =?utf-8?B?eGsxMlBZUmFPTHJuUExuZmFHY3hhMVU1bXd5bFJjVkNVc201ekRqTTR3MGgy?=
 =?utf-8?B?M2lFZExHeTVkcW11Vk1CZVllNFpqWDdDbXBNRUR5T1RDNmZFeTIrZGxySWZ6?=
 =?utf-8?B?SHpsSGlFczJVaWZXeGlEakNlcU9DUTBGTTV4aWV4VW85L1ZxcURlTVhHSjIz?=
 =?utf-8?B?MHQ1MlUrVHVkUk52Z0pWdW04bm1qK0xGUEc1L2t0L2s4SUNHTEI5U1hZSWlM?=
 =?utf-8?B?Q0RaUVNLWE5HYlJZSWdNbzZWNVB2cERCZTdEMUkyT1F0S3RJemE3azA5TzFI?=
 =?utf-8?B?d0JiVmJxdE1Tc2JSa1Npa3h1UXZWMCtZSVFlYmZqTTBYRWtkc1NRWGk3NXBk?=
 =?utf-8?Q?mQWUidqaAFlwohnjLyFZegQX+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6696.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb089b39-212d-406c-a575-08dd477ac8e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 13:24:43.8007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 832jp8TT3e6du7/jPK9ybmekrt+5ajYzyjd8LQAwz7rO2SNaetJ1ONeu6THHC1MLkyBilG3jZY8hYXShVeEPIlqMemdbjdgcn0GQ+eJcEBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7067
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

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBXYWpkZWN6a28sIE1pY2hhbCA8
TWljaGFsLldhamRlY3prb0BpbnRlbC5jb20+IA0KU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDYs
IDIwMjUgMTA6NDYgUE0NClRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBX
YWpkZWN6a28sIE1pY2hhbCA8TWljaGFsLldhamRlY3prb0BpbnRlbC5jb20+OyBWaXZpLCBSb2Ry
aWdvIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPjsgRGUgTWFyY2hpLCBMdWNhcyA8bHVjYXMuZGVt
YXJjaGlAaW50ZWwuY29tPjsgVGhvbWFzIEhlbGxzdHJvbSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51
eC5pbnRlbC5jb20+OyBQaW9ya293c2tpLCBQaW90ciA8cGlvdHIucGlvcmtvd3NraUBpbnRlbC5j
b20+OyBLb2xha293c2tpLCBKYWt1YjEgPGpha3ViMS5rb2xha293c2tpQGludGVsLmNvbT47IE1h
cmNpbiBCZXJuYXRvd2ljeiA8bWFyY2luLmJlcm5hdG93aWN6QGxpbnV4LmludGVsLmNvbT4NClN1
YmplY3Q6IFtQQVRDSF0gZHJtL3hlOiBFbmFibGUgU1ItSU9WIGZvciBQVEwNCg0KPiBXZSBzaG91
bGQgbm93IGhhdmUgc3VmZmljaWVudCBjaGFuZ2VzIGluIHRoZSBkcml2ZXIgdG8gcnVuIGl0IG9u
IFBUTCBwbGF0Zm9ybXMgaW4gdGhlIFNSLUlPViBQaHlzaWNhbCBGdW5jdGlvbiAoUEYpIG1vZGUs
IHRoYXQgd291bGQgYWxsb3cgdXMgdG8gZW5hYmxlIFNSLUlPViBWaXJ0dWFsIEZ1bmN0aW9ucyAo
VkZzKSwgYW5kIHN1Y2Nlc3NmdWxseSBwcm9iZSBvdXIgZHJpdmVyIGluIHRoZSBWRiBtb2RlIG9u
IGVuYWJsZWQgVkYgZGV2aWNlcy4NCj4gDQo+IFRvIHVuYmxvY2sgU1ItSU9WIFBGIG1vZGUgeW91
IG5lZWQgdG8gbG9hZCB4ZSB3aXRoIG1vZHBhcmFtOg0KPiANCj4gIHhlLm1heF92ZnM9Nw0KPiAN
Cj4gVGhlbiB0byBlbmFibGUgVkZzIGl0IGlzIHN1ZmZpY2llbnQgdG8gdXNlOg0KPiANCj4gICQg
ZWNobyA3ID4gL3N5cy9idXMvcGNpL2RldmljZXMvMDAwMDowMDowMi4wL3NyaW92X251bXZmcw0K
PiANCj4gTm90ZSB0aGF0IGluIGRlZmF1bHQgYXV0by1wcm92aXNpb25pbmcgYWxsIFZGcyBhcmUg
YWxsb2NhdGVkIHdpdGggc29tZSBhbW91bnQgb2Ygc2hhcmVkIHJlc291cmNlcyAobGlrZSB1bmxp
bWl0ZWQgR1BVIGV4ZWN1dGlvbiBhbmQgcHJlZW1wdGlvbiB0aW1lcywgZmFpciBHR1RUIHNwYWNl
LCBmYWlyIEd1QyBjb250ZXh0IElEcyByYW5nZSwgLi4uKQ0KPiANCj4gSG93ZXZlciB3aXRoIENP
TkZJR19ERUJVR19GUyBlbmFibGVkIGl0IGlzIHBvc3NpYmxlIHRvIHR3ZWFrIG1vc3Qgb2YgdGhl
IFNSLUlPViBjb25maWd1cmF0aW9uIHBhcmFtZXRlcnMgdXNpbmcgYXR0cmlidXRlcyBsaWtlOg0K
PiANCj4gIC9zeXMva2VybmVsL2RlYnVnL2RyaS8wMDAwOjAwOjAyLjAvZ3QwLw0KPiAg4pSc4pSA
4pSAIHBmDQo+ICDilIIgICDilJzilIDilIAgY29udGV4dHNfc3BhcmUNCj4gIOKUgiAgIOKUnOKU
gOKUgCBkb29yYmVsbHNfc3BhcmUNCj4gIOKUgiAgIOKUnOKUgOKUgCBleGVjX3F1YW50dW1fbXMN
Cj4gIOKUgiAgIOKUnOKUgOKUgCBnZ3R0X3NwYXJlDQo+ICDilIIgICDilJzilIDilIAgcHJlZW1w
dF90aW1lb3V0X3VzDQo+ICDilIIgICDilJzilIDilIAgc2NoZWRfcHJpb3JpdHkNCj4gIOKUgiAg
IOKUlOKUgOKUgCAuLi4NCj4gIOKUnOKUgOKUgCB2ZjENCj4gIOKUgiAgIOKUnOKUgOKUgCBjb250
ZXh0c19xdW90YQ0KPiAg4pSCICAg4pSc4pSA4pSAIGRvb3JiZWxsc19xdW90YQ0KPiAg4pSCICAg
4pSc4pSA4pSAIGV4ZWNfcXVhbnR1bV9tcw0KPiAg4pSCICAg4pSc4pSA4pSAIGdndHRfcXVvdGEN
Cj4gIOKUgiAgIOKUnOKUgOKUgCBwcmVlbXB0X3RpbWVvdXRfdXMNCj4gIOKUgiAgIOKUnOKUgOKU
gCBzY2hlZF9wcmlvcml0eQ0KPiAg4pSCICAg4pSU4pSA4pSAIC4uLg0KPiAg4pSc4pSA4pSAIHZm
Mg0KPiAg4pSCICAg4pSU4pSA4pSAIC4uLg0KPiAgOg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWlj
aGFsIFdhamRlY3prbyA8bWljaGFsLndhamRlY3prb0BpbnRlbC5jb20+DQo+IENjOiBSb2RyaWdv
IFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+IENjOiBMdWNhcyBEZSBNYXJjaGkgPGx1
Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gQ2M6IFRob21hcyBIZWxsc3Ryb20gPHRob21hcy5o
ZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gQ2M6IFBpb3RyIFBpw7Nya293c2tp
IDxwaW90ci5waW9ya293c2tpQGludGVsLmNvbT4NCj4gQ2M6IEpha3ViIEtvbGFrb3dza2kgPGph
a3ViMS5rb2xha293c2tpQGludGVsLmNvbT4NCj4gQ2M6IE1hcmNpbiBCZXJuYXRvd2ljeiA8bWFy
Y2luLmJlcm5hdG93aWN6QGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9k
cm0veGUveGVfcGNpLmMgfCAxICsNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9wY2kuYyBpbmRleCBlOGVmN2Q2YjRkYjguLjZhOGU4MmFmZjM4NSAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9wY2kuYw0KPiBAQCAtMzY3LDYgKzM2Nyw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgeGVfZGV2aWNlX2Rlc2MgcHRsX2Rlc2MgPSB7DQo+ICAJIFBMQVRGT1JNKFBBTlRIRVJM
QUtFKSwNCj4gIAkgLmRtYV9tYXNrX3NpemUgPSA0NiwNCj4gIAkgLmhhc19kaXNwbGF5ID0gdHJ1
ZSwNCj4gKwkgLmhhc19zcmlvdiA9IHRydWUsDQoNClJldmlld2VkLWJ5OiBKYWt1YiBLb2xha293
c2tpIDxqYWt1YjEua29sYWtvd3NraUBpbnRlbC5jb20+DQoNCj4gIAkgLnJlcXVpcmVfZm9yY2Vf
cHJvYmUgPSB0cnVlLA0KPiAgfTsNCj4gIA0KPiAtLQ0KPiAyLjQ3LjENCg==
