Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A969BCA0FF0
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 16:08:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B3C10E1A5;
	Fri, 29 Aug 2025 16:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eiWu9Ukg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A59E10E1A5
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 16:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756483695; x=1788019695;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=0GDmw/WCX5wy7NFvTa09S6/6gkHExTYpgNu9SAOJ4l0=;
 b=eiWu9UkgAMmw4bSw6AUhCdWPDq/m/mcI8vS9Ly7k6zMNi0c9bxU0YUuU
 A6JMaaeumieaWeQxDJdnw7x/CqFTV7yNcyq1qqGUgpZWWC9R2+JgRlrfp
 po0LzxWoISn8lrhURRPgU3HYEtip/ynbvvGyJtr6i2KyX+AUmDxHQF6jI
 odgvXhlUuXGeDxqxC+GQV7bsOfHVPf+YWQ8qvGFWbo20UhioBWNSurV8V
 6fSxOOSXqs2zNDmVl2p5E3ils2G9PaCGgdJzfw3nMpAh7kilWgPYPRc3+
 cIRPXblpLfk2LjGvEjiMshg0rLcH3kriOKnT+Pp5d6dRCkWtX7UlI5aOJ Q==;
X-CSE-ConnectionGUID: ueoJR0tJQlm+H/FB3jYpbA==
X-CSE-MsgGUID: nl3ARkgoQWSoR2QG7ypSuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58718813"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58718813"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 09:08:14 -0700
X-CSE-ConnectionGUID: tG8mtI1VSwCgn3jXx77lqg==
X-CSE-MsgGUID: nAWDMjB2SM2LxkZmVaLpKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170802280"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 09:08:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 09:08:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 09:08:12 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 09:08:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R7VViYoXKW7dVYZTaeZ5+equ22BuDkIjgUssBXsaTpseT9qT+HSbOcqn9dMjZgXiAy12+1zDlBxOciztu8JPqjffHqd/+NWgCfdp0w5iXWnvAbe4b7Pl+WNR4MDmPg72mbyuOYcMOAQPS6XhmDP0R265NRRRo186cVe8E1ZYiZ7CDe1zKK6y3O07HXs6FSOq/NgtEqV25P8SMfPqmmzLcZ1c0iSId8qKsV2qNxoOZz+V5sDHu9VZB9uODFcwqAAzm+TR1wWpjB06aAYu1JHA+sDgonQq/eE68Rr8jtgK6Ip2YkuTZ7o0qBI93i/eRUM5dM/W/32rpl20268OEjCgeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GDmw/WCX5wy7NFvTa09S6/6gkHExTYpgNu9SAOJ4l0=;
 b=xW1Ni1lj1z6ya6GrRw6Fqi+th2I3qwG8fPTuCkvFRhUDFTgayWnW8jMJzULDr+v4L+W7KQUUxnhOPtQAqDk6fE2DM33vNYjPKa/nu8qTnw4o5yYD9sitC5x/XYsIFpfM1z/uCNB42M48vLe5GSVhNG3D3Jwg8PIbcw9w01I8wuOBxWHehpN0k2fFeEYvOgnF2Gdx2md7obVC1aX4x6y16OD2myXa33VZ40pxiopTH+k4GOonxMZgUmEm415JHlB+vKfU2a+BqGCvg9gNzP/q8AcD72JrQV1xOGfukrGV0GV8x/AMT1ZFCM1jb39hEHdWzxo95Nm5g3KImhHr/tonnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CY5PR11MB6365.namprd11.prod.outlook.com (2603:10b6:930:3b::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.15; Fri, 29 Aug 2025 16:08:06 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9052.021; Fri, 29 Aug 2025
 16:08:05 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Harrison, John C" <john.c.harrison@intel.com>
Subject: Re: [PATCH v2] drm/xe/guc: Increase GuC crash dump buffer size
Thread-Topic: [PATCH v2] drm/xe/guc: Increase GuC crash dump buffer size
Thread-Index: AQHcGP6i1FxMOsNJm0KKMFdRhvMOnrR5zDUA
Date: Fri, 29 Aug 2025 16:08:05 +0000
Message-ID: <0e3d47a6e6886601cba57e40bbb72c92043e1691.camel@intel.com>
References: <20250829160427.1245732-1-zhanjun.dong@intel.com>
In-Reply-To: <20250829160427.1245732-1-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CY5PR11MB6365:EE_
x-ms-office365-filtering-correlation-id: 72ab9bbb-0dea-4732-dde1-08dde7163d3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YlpsMEVnSm0wLytCYWZDNjU1TmhZQlh4Y080d0FudXEzVFFBYnZPV2ZNbld2?=
 =?utf-8?B?bit4c2w5bHBwM3B5MEI5T1RJREpDZXBZMjJ6Z2Zkakl2Y2hzK0VsdzAzeGwv?=
 =?utf-8?B?aE5WaUFRcnFBOExjUm9BN1Y1SkRPalhmWmdsQ2dDS2txdVBwWFZaZ2VKL3Ur?=
 =?utf-8?B?WnlPOXdvYTFyU3FxNUZrcjh1NU8wZVd4MTZJdGlVamYzSzhVZmhVSHozd3Fv?=
 =?utf-8?B?NnBtc094TWZaOVNDbnRqQXd2TERjZ2xyTzdVNVlzT2I2aElpN3ZDU0t4MTJz?=
 =?utf-8?B?eDB4ei81b2ZhM3NLaUsyaFIrUXlmK2tiS05yeURLd1daMHF6c0NWYWh6R21E?=
 =?utf-8?B?N3NMbFpVWVZ2S1lSd0JzemcwY2hIa0pPQUlkTGRLeTl4dC9UTldUT21VM01R?=
 =?utf-8?B?K2N2aTZBc1RCdTRnVGhjU0dPaVg2VnhxMnI1OExTRlRwbWh6RDZCY3JpQTFO?=
 =?utf-8?B?NWUzelVGOWdvQzd5bEpoV00wakk2R2FuMkdyZFdvSzY3ZzZKbTZjWEJFZE4r?=
 =?utf-8?B?Tyt3QXlHbEpCa3dId0VtSGV4RjhRdTljM1FDY1p2Y0wvZWNlTWE3SEtkYWlJ?=
 =?utf-8?B?YTRxOENTWU9oZVdNREtxL3FsZHZTZG9mTmtXdjNWMUV2akp2Tk9GYVB4WUpo?=
 =?utf-8?B?dXd6ZWRsVUNVMytxL05sYlJ2b1FJenJzc3Jua0ZoYVBsRHhlNFhMdDJITk5R?=
 =?utf-8?B?OVJYcUlzU09HZnpMakU4cHg0NVozakxKR25HenF5UWhuOXBVNm5KOWwxaGhy?=
 =?utf-8?B?ZW4zSVZ4UmFYN2ZVV08zT2Q5VzlLWnlUN2l2QmgxbUMwajBEaWt4cXNJWk1y?=
 =?utf-8?B?QWpFNjdMci90T1pmaTlod0hGRXlXZ2JXUFJJcjUwbE5mMFdoalpTSTZmaHFP?=
 =?utf-8?B?ZmNUNU1nVVJJMkJTWWlqVUw0L1FtdGlqc1JYSFhubXp3bWtZU1Qra1FpTDNQ?=
 =?utf-8?B?cnRFOFIxNFJHc0c1ZURyL3FXZGppMFZYY3V1eWxWbXlwSFJaMkZLTG5MalA0?=
 =?utf-8?B?bmQ1UExWMXpGOWxzM1pQVGlnU2FPaFJkT3FEOXdoWTFWa2JGL2tXeDRjdkgz?=
 =?utf-8?B?di9Mb3NlRmV6ODM5aGFDVnE5WG1Xb29VTlFGTTcyZmdlb3Z6MmRDZmRpSnMw?=
 =?utf-8?B?QmkxRGQ3UW1pK1VtUWsxd00ya3JRbS9qelFOYWRMTHFWSDJlc0tDamtwMEg4?=
 =?utf-8?B?NUhWNDQ0NW9PSzBCeDkyeXpVeXRGWHdGZ2RLak03Z2M0bVZudzdQbW8yOVV6?=
 =?utf-8?B?bFdkRXk3V29NbVJsUkNSY0dCekdjdzZyblE4RlAvV1pZa05CNDhuYWM0ams4?=
 =?utf-8?B?eTR0dVNKNWVwV3FsUVYvK0VqMTlvOUIyajIxYjFWVnRiZG9WbUk4YWVWa3dY?=
 =?utf-8?B?d2k0bXB2SHU3bEw4RnZXNlpOem5zaDhKbzdGLzBlcmdrUDlTemFZeGVKejR5?=
 =?utf-8?B?WXl1UWtIbk81MUdKdjVUcjRzMXU0Mm1jb0R1VDRvVG5JUk1UeldNRXpEQXVh?=
 =?utf-8?B?d09EdXFTckhJV3dJQ1R6SXJNUTFaOVBMclpkSFRkalNDaUJlQzNNUlNXb25H?=
 =?utf-8?B?cks2KzFEWDRycG9ncWkxN3IzcElEV3pPZnA1Ky9hQVovMTZnMFBIYXJSWTcv?=
 =?utf-8?B?RGkzTWhkb0tIb1lOeWNDc01hRFk1TEloVTJ0RzlyRzhTc1hlTHE3L1RuRk11?=
 =?utf-8?B?d1V1UCtmVVl5YldRSTdINm0zREdxUEprVXdDRWFJczlpWWI4ZmxKeStnOGlz?=
 =?utf-8?B?TjNmUzRjVnhMTlJLQnFQNEc0TVA1N2hUV1FpUWJ1Z1hKbmhxbmhQNWV4THg5?=
 =?utf-8?B?Tm9ReE5YL0szS3RUaTZBM00vOXBZQ0t5dS9sVTF5clpLalBoLzNCY1BOdU0v?=
 =?utf-8?B?dk5ITS9UN0VZUHRFWUVUNDBBNVNUWUI1NUoycTZvQjdxZlFlVUtSeWhQN3Ix?=
 =?utf-8?B?ZXVCSVEyUExlSFh3WS95Tk9OSUd2b3JJSitiWTZZTGY3b3FQNjRNZHptdVVT?=
 =?utf-8?Q?N/QJbXqTDSSvd5muyrbqADll4y0qV0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1JPNUFSRXFYajUyREdtZnRnUXRZL01CZHpTZWtDLzlVejRQVUZ4dlBrZi9H?=
 =?utf-8?B?V2NPWFI3Q2hpQ3ZlMXlXZW1jUnYzZWtxamtzYzhOZ3UwYnhrRWl2NjZSSHRC?=
 =?utf-8?B?VlFtK3ZKVmVkMjgrYVZlTFZ6TnVPSjFVanU0UDQ5YmFEVy82S2J4dURYS0x5?=
 =?utf-8?B?Nml1MmQ1Qm05UGZFMitJdlpDdXYyWk9DcjlQbnB4N3JVeGgzVlZCSWVLVjVK?=
 =?utf-8?B?eDUwNzNUdllENkFDcVN5cUV4dzRlRU1KaVN2YStBSHhpeit3cktlMytqd3dv?=
 =?utf-8?B?bzJzdFRDeXNYN2p1d3hOVXNPdHFydzNUUkp1a2R2WVRmaTNJalFKenE0emF6?=
 =?utf-8?B?N2kwRVZkcFpXaDZBaVZiVkl1alhKWjBaQzV3eUZtVGRKNC9uMmNFd2dxOHJO?=
 =?utf-8?B?NlBqaDU5V3ZVRW1qYm1xSlhzNlZCRVl6QWp3eGEvQ0Y0dTVyRUV5ZUozcXhM?=
 =?utf-8?B?clhGY3JKdE4vVUVxbW1Hc1gxOTZKcEIvRjJheDJua0Z0dkt4ZjJJVE0yV0ZQ?=
 =?utf-8?B?VmZ6TmJlNE9KczhudzBEdmxnT1lqbEFoNG8yK0VQeGcrTW04TnFFNXJwSXBP?=
 =?utf-8?B?QTFZeVc2R0VaSnJlamR4WEQ2bm9QQWRrdjV5MWZSZmNVOHQvaDBQYi9pRFNH?=
 =?utf-8?B?dTNnTnRzaGQwSEVIN3Yyc1NVVXVCWms4NjFpUXVUUHMvSWFqbW5wblVmUTFG?=
 =?utf-8?B?YUpTdEk2Y1YxSjc3YkhuRFBtSk16V2ZlVHRCTmRoOUxYaHg5RTN1WE85b0Zv?=
 =?utf-8?B?Y283VmRwWWNBU3dNOUh6T1UxV2FVYkhZaEdieTAwSmFmY20zaEc2RHJtdlNl?=
 =?utf-8?B?SEVXbEFBLzNkdmJNWDVKcDIxUTRsNnFETnprUlF5czVlNUJma0FrY0YwU3NQ?=
 =?utf-8?B?R0o4eGxBaHpkWk9ib0d3bit4WXNYWDlQcEhsOUxaZ0k0ckFmL3UwU3JCTUxW?=
 =?utf-8?B?Nm1Kc1p5eVBEaUgzTDhBYkdkeldZb1FnaGpacVZvSXhRVmFRa2tpZ3VlekF1?=
 =?utf-8?B?dGVHSW91Mk90MUNVYm96NlFCTDJ2UjVOdkp5eTlvSGhYNVEyWmhETmxWSSs2?=
 =?utf-8?B?M0QxaXBnM1k5cHRxNHJsOG1KUkYzTjFMbnE5c0dWZGVjUVQ5OEpKRm1KUlp5?=
 =?utf-8?B?MEpIb25oSXRwQysreHVidDJqbzhUOWR4QVJzYzQydU1UZGNBWmZMVW1kdUF6?=
 =?utf-8?B?U1BHakNtQmhORHdhemQ5MkpMMUY0S3NTYmwyR0pkSitLenJ1eXhGc01kenZI?=
 =?utf-8?B?d3VmRXBSUHZZUTFyTUxGQ0FxajRnQk1qM0s3dEhNWmxsZ0NyRGRXWW9wdmx1?=
 =?utf-8?B?cGtobjRUaXgwajM2OWF0S1poTUlOM2RSOGRSenFpZWlrUmZwckE0YlpVSEZH?=
 =?utf-8?B?c3Zud3hRR2lXT2RTdzFZU1cvU3U2VkQySzRsTEI2UDhUWVJubVNCUFdsZEFN?=
 =?utf-8?B?WTk2RzJ2NFpBcFpMc2tLaVAyM1ozT1pJR2NtZTVQWG01TWFZTTdodDVYS3da?=
 =?utf-8?B?cGkzM0R5dW4yN1NGUTNRVG9ZckVqd3BVMHdTcFExUmRUbXU1b0lZbHBtY2xl?=
 =?utf-8?B?SkhyMnQrUFowNjVDV3hnU3Y0ZW01Y3pIK2tpdnd0S0hBeUh6aWQraVlJOTJa?=
 =?utf-8?B?MmdjWDFoNXZ6bmNRMnFrNnZWWW4yNk8zL2dIUERaOU9teGE5azN6NTVUbmdK?=
 =?utf-8?B?TmtVTzFDdTZGRGVPUFpZdHdwYUovNDFDckpORmNQWFZuRVZkYURGL3VISWwv?=
 =?utf-8?B?ekxDRDhMNjBnYUZqbGt6YUdueG1ZY2xwTm05ZXkwSTBrZXdmT09tMkFvNEhx?=
 =?utf-8?B?VHVrb0ZsazVKK0RjVE9aWWovZTEra0h3d25xa3NUNGdPaXR2NC9mYUZrYVRD?=
 =?utf-8?B?SVMzYk4yMTVRK29OYmttektiR3Q4NXhEc1FMTUdZQmxPT0F4WEZVR3ZzR2pz?=
 =?utf-8?B?aS9sN3ovc1ZPeHNLSThKMkNFbFlabkFwR3ZrU3Rjb3ZEUTl1SUdLMXhrbHd4?=
 =?utf-8?B?MmxvbDVvNmZhT3pRQ3N6R1ZDRVkvVlBmMjR0V24xVlM2YTFjUFIveFlMWVBD?=
 =?utf-8?B?TmtZQlk3c1ozSUVvMXFXL0lETXo5ZVczYVN6Q3lZRGQyYVZlR1pBVHBVNXht?=
 =?utf-8?B?bkdvbHoxb2NFSW5XM1FiWkxDTGJQMkZaVWlTNm1xb3BqMzdqQkFUVkh6VVdq?=
 =?utf-8?B?NkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F30C38F1AA3FF94DB8832F0F0B2CE087@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ab9bbb-0dea-4732-dde1-08dde7163d3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 16:08:05.8889 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6sbV5p1tDS7YiHYWXv6kZegxGoUiyfq2tEohdr8kJAyEKQ6JNkrz9jW5GYx694685sOTA0QxJvAO4Og8B9EGfcE76umgylmdqgV7d5Mx7+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6365
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

T24gRnJpLCAyMDI1LTA4LTI5IGF0IDEyOjA0IC0wNDAwLCBaaGFuanVuIERvbmcgd3JvdGU6DQo+
IFRoZXJlIGFyZSBwbGF0Zm9ybXMgYWxyZWFkeSBoYXZlIGEgbWF4aW11bSBkdW1wIHNpemUgb2Yg
MTJLQiwgdG8NCj4gYXZvaWQNCj4gZGF0YSB0cnVuY2F0aW5nLCBpbmNyZWFzZSBHdUMgY3Jhc2gg
ZHVtcCBidWZmZXIgc2l6ZSB0byAxNktCLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWmhhbmp1biBE
b25nIDx6aGFuanVuLmRvbmdAaW50ZWwuY29tPg0KDQpSZXZpZXdlZC1ieTogU3R1YXJ0IFN1bW1l
cnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCg0KPiANCj4gLS0tDQo+IENoYW5nZSBoaXN0
b3J5Og0KPiB2MjogVXBkYXRlIGNvbW1pdCBtZXNzYWdlLg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjX2xvZy5oIHwgMiArLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWNfbG9nLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2xvZy5oDQo+
IGluZGV4IGYxZTJiMGJlOTBhOS4uOThhNDdhYzQyYjA4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjX2xvZy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dWNfbG9nLmgNCj4gQEAgLTE3LDcgKzE3LDcgQEAgc3RydWN0IHhlX2RldmljZTsNCj4gwqAjZGVm
aW5lIERFQlVHX0JVRkZFUl9TSVpFwqDCoMKgwqDCoMKgIFNaXzhNDQo+IMKgI2RlZmluZSBDQVBU
VVJFX0JVRkZFUl9TSVpFwqDCoMKgwqAgU1pfMk0NCj4gwqAjZWxzZQ0KPiAtI2RlZmluZSBDUkFT
SF9CVUZGRVJfU0laRcKgwqDCoMKgwqDCoFNaXzhLDQo+ICsjZGVmaW5lIENSQVNIX0JVRkZFUl9T
SVpFwqDCoMKgwqDCoMKgU1pfMTZLDQo+IMKgI2RlZmluZSBERUJVR19CVUZGRVJfU0laRcKgwqDC
oMKgwqDCoFNaXzY0Sw0KPiDCoCNkZWZpbmUgQ0FQVFVSRV9CVUZGRVJfU0laRcKgwqDCoMKgU1pf
MU0NCj4gwqAjZW5kaWYNCg0K
