Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD38CC28B20
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 11:19:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668A610E0F3;
	Wed,  2 Apr 2025 11:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aK+zNUez";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C031110E0F3
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 11:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743592786; x=1775128786;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U2WnXSPf8v+b4jAz2YCmevw1KPJhhv7AMXAlzBrcni8=;
 b=aK+zNUezHON36dA8ZOnErXimuklAvX/lJ3XZXeDQE9byHVfhxTYnJDsq
 /gmxc+PZwUvKRRH+wNbVs+WHawQYkHdYvQzp9sfqOYVs0IDU6GHqFoSWR
 p0q8y7BzE751sa0R0/8NaJR4Nf0M+Oxl/QdJ9JFVNeyf1qve4Kb3D2080
 ZYiIOq1uAKdHtU0fbeDv0pDsdX9AYYDw9bMetORA+/tnvmS7kaOlLGUAv
 dj9GkPsoj3EpibJoDcnUNxvEx2/lrmU9usf/bzJaT2+/wHm6JCG+rkkiB
 0HoMffSfz/qF+5EUjn63siH9odL8fHblgIUOSsovXDbo6ZBvKBKTzrcJb w==;
X-CSE-ConnectionGUID: Vsx42/o8S7ODrYO4yQKCXw==
X-CSE-MsgGUID: wih810sFQOC6oQnSI72FUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="48741079"
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="48741079"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 04:19:42 -0700
X-CSE-ConnectionGUID: xXzuUW/fSTaMrcp61TIObA==
X-CSE-MsgGUID: ula8aSAHTmipCdaXJ3ieCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="131795855"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2025 04:19:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 2 Apr 2025 04:19:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 2 Apr 2025 04:19:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 04:19:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m90JOWtKdGXROGWToBEPQcBlvB18gG+oBAsig8gDlcjUXOE217REqEsuseaEn+OfL8nzYzskNZRhq0YH5LHm8vEAmpw+p+QAtze3ISCUfuK1T1z811haDKRyBxPTLpon2nPQUXIc94L+pODikgC3ZJAId3BiPfmA52fbIjxmD1squ8mQohUGkyrZvuDm/M26KkO+twbFjHQryOXescmTHsXXK3Vmo35Kg+mBPxvIg5JqbiQjj0c/o0mymhEv7niP28hDmWaz/iLEB/+LhnQei1Jp5k3to3CiWNaPWKYSNUne3JAzFW2b4wqKmjg60c7uRJ1gZsV+4oOepOGdaNa9Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2WnXSPf8v+b4jAz2YCmevw1KPJhhv7AMXAlzBrcni8=;
 b=AtqAvuDVN8KyCjuMSsW6zBOx1G+B5V0BtHruIMhjP9HHo0TAVypokt7+z46baR4dOHgj9dRO29ZsKxiQIxe+dN5ZNMgXjxxg2aM7U3XswB98cMT0FQld8N3osrI/m2yH5sZNrW4nNVbbS+h6f8hgfjaX7eB6CZt8PEOiBLySTt49voMevpaSB8iJ/5m4BDZLkXzyv9XEwSlTokkdnMjIZv2qdOYjWUCBM2JOEajIfygsBWY+PLTvMPLKu8JXSPm5+DXBjtW/7bYla7sSabL1lgq01ddN4MA1rzRNk5+OHhpSh04R6QzlOuAkaqZRxR3gkTdzQW2XqgsPJB1N3rjlGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 11:19:39 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%7]) with mapi id 15.20.8534.045; Wed, 2 Apr 2025
 11:19:39 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, "Jadav, Raag"
 <raag.jadav@intel.com>
CC: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Nilawar, Badal" <badal.nilawar@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/d3cold: Set power state to D3Cold during s2idle/s3
Thread-Topic: [PATCH] drm/xe/d3cold: Set power state to D3Cold during s2idle/s3
Thread-Index: AQHbnzQDvwIbzJzC+EyD7gTJZC+MebOHLUGAgAALpICAAX5BgIAA3w2AgAPbn4CAAEPYAIABaecAgAAckYCAAQG7kA==
Date: Wed, 2 Apr 2025 11:19:38 +0000
Message-ID: <CY5PR11MB621188424780247774086EA495AF2@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20250327161914.432552-1-badal.nilawar@intel.com>
 <8a514fa3-af9a-4b92-a6d3-3c6764b20a5e@intel.com> <Z-WHYbhu1QdjUFPR@intel.com>
 <Z-bICZUBN_Fk0_mM@intel.com> <Z-eDJUtxjzIjGlJT@black.fi.intel.com>
 <Z-q_n1g9wIEZc-dm@intel.com> <2d3f3cbe-c33d-4ded-8c19-e2bd2e76a68b@intel.com>
 <Z-woHnrukI7qtB4m@black.fi.intel.com>
 <CAJZ5v0j7ob4YQ9weQ6e5iVbHyRwf-6Vk2MU4r9mK11-8wD09RQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0j7ob4YQ9weQ6e5iVbHyRwf-6Vk2MU4r9mK11-8wD09RQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|LV3PR11MB8603:EE_
x-ms-office365-filtering-correlation-id: aecc9973-ff20-48f8-71d2-08dd71d841f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dGYzaW5tVGUwazdZZjAvVFR1eDZmU1ZzakQ2bm4rUnFuWG9YL1B5QXdSc3I5?=
 =?utf-8?B?eHN3QnNYRVpBSlJXNU13NzlvVWEzbzZ4anFDNHBEVEl5aFk0Qy9iYTRVWjRV?=
 =?utf-8?B?dmdRTHZveGdPa3RpNk1DNEV0eVFlS09xc2pER1dkRUk4R2pvL1RoOHVaZ041?=
 =?utf-8?B?WU4vcndsUGViL0h4SVpqZm9WWXpINWUvbnV4UndMVXRqR3U2ZmV2NFB2QUUy?=
 =?utf-8?B?NHhGZEc0SWRBSE1JdmlNODhpUjMranZWQUIwbHNTZlhFd2F4UHhrTXY5YUgv?=
 =?utf-8?B?RXdESHhsTjFQSVJVZmxqQTE1b2J5RG1mbFE4aytjWThSZzFHR3lOSGdKL253?=
 =?utf-8?B?SmpOMDhSRDhIK0pYQnpLTlFsWlluZnJIS2lLVytMRWNtenhmc0RiTXd3bmNB?=
 =?utf-8?B?d0lDUFREVjlSVGRsWWxvSkxKaWRZNDUxV1I0OUQxV3B3VnZyK2FSNCtaQncx?=
 =?utf-8?B?ak1RMGJaVGJpT3R6c2R2VU84RUMyZ3FrRm5KWTJ3N0oyVUg5U05PeGRyOTBK?=
 =?utf-8?B?NzdmUmFNOXBIcE9TSmt6czNvc0dtZVJia1hKZldPU3JIbjBvNnJ4MVU4ZnE1?=
 =?utf-8?B?N1BMM2I3cnBUTElkUlFCS0tkQ2c4VytsS1htdzVTUnFjdGQvcmVPV2RIRXdB?=
 =?utf-8?B?cEJTWTQ0d2RJUFc2N2xzZVkwVHdVeTRMckQvQzlmd1V0K2dDOTI1WDE4ZDJG?=
 =?utf-8?B?aU5GRVhlaWtiTm9GdW5CcWZETThUbEpScVQrczNLazQ3RkpJRzlnOVhFU3hP?=
 =?utf-8?B?OTZCd29ieEtBbkdCeWxGUUpwZ0UxV2swUk5WUklnVkFVdk9CYzRZRnNaTEs4?=
 =?utf-8?B?dlozUGxiS3dZZUZNcUwrNmZpS3l6N1RiVmhPUm9LU1RYbXc3aUJCZ01Zd1Qr?=
 =?utf-8?B?ZGl6MUdISXlwN0J1TTJZU2F1ZVlFSWlOakFYcmdGRjhJL09PQnlQbUpkaHpF?=
 =?utf-8?B?Tzg1dHFYNUk4RkM3Nm9BNDlQYVgxVHBkT0RhaHV2YmxwVzlPekRJQXlOZFh5?=
 =?utf-8?B?Vm1Qb0tIR1hrd1lXTGRCMVMzZkp6Z3JnaUdwL2xrQ3I2TW10SloxVFY4R3cw?=
 =?utf-8?B?aWpsU2dQZitHdmQ5ZjBXOGN1U0NydkcweDFlUCtKbW03cjhOckhKaG9hSkdH?=
 =?utf-8?B?Kyt1WXVPckdiMnFYL0o1aGkvdEpoejVYaDN6dVQ3NWNVVTZVU3dFdGlvdE91?=
 =?utf-8?B?SndwQzh1cVJtc251Wlp2VC9jdlIxNlkxZHdkM1lVblBIYnVGd1U2M2tSQ1Rj?=
 =?utf-8?B?SlNmSFcvMGtydEliQllJbnRiSFpRcVJPcWZOWVUzM01QSXhhaHIyOXVVckM0?=
 =?utf-8?B?Umd2ZVl2djJNS0hyd2VFdnN2WjVveEJQSTAzZU85dTM3cWVIdkZIb2RKYmRU?=
 =?utf-8?B?RG9taCtRMzU4c1BQZUp6Q3hycGJteVM5TmcyL2JUWEFtYVJjMXp0MzBjSWdF?=
 =?utf-8?B?U0RtbVJGTkhyWEcwVlk3WlZ3Um5mVmJPTWYxUXNhQ2U0SXR6ZFFNd2tTaENp?=
 =?utf-8?B?VlpLTHhHQVdnWmswQW91WDI3OGg5VHdaclNRWm0zZnJhWnVGZUNpenFIbHd1?=
 =?utf-8?B?SHNMa1FBcmZEekRRNERCazJDMjVQWTlIVCtIUHlFNDE4SHdPd3RnYnk4UXgx?=
 =?utf-8?B?R1VZYWpoUWlRbEViR0gxYW5DVkJRZVJKcWdiT00yTVRKLzBBNktySVV0MnlY?=
 =?utf-8?B?NXJvSUhGcDJPZkVIdjBoN2ptaE4reEZLa3l3MnFJTDRSejFGdjkzZFMxTHA3?=
 =?utf-8?B?cjJ3YmIwb3hpVlVJWkJSMVlIQzNBS085OWNBZXk0N2Y5SXdCODNFQU9pczB5?=
 =?utf-8?B?R3Qrd2JlelAvbVhSdHhsZFhmNzNJVTRSVEVac1ZSQkxYYzdDWnBLSVljd3dx?=
 =?utf-8?B?TXhVK2V5ejlzT3JQVzA4TUVVMDJrWEJPc2lUenhpTlpZMWdBbVFQVTZLejd3?=
 =?utf-8?B?Ym9PdFMvSi9HYTRSL241UU91ZFRkQ2wveEt1Z1R6bCtYNVZmUCsxRDhCQlhh?=
 =?utf-8?Q?fFxh7IIQ9OoCOt9rPyKWvLHDWJbNsg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmM5ZkZST1NVbVNSY3h2OUQvc1A3RGhPOEFtVTVVaExqa0FqaUhkb0VqN2dr?=
 =?utf-8?B?VHp1NWMwR2t4dHpKTzlBRTdZZEZITURJVlZJRVF0cXNvdE1SZlpIV05XOUZr?=
 =?utf-8?B?SFR2bmpyZkxzcWc2UXQxZUc4ZUd1YUdRVFBGN2JIY3BwUHBzL2VtSFNVRVo2?=
 =?utf-8?B?MzRPSm83THdBTjdLU0lLTnJoZit0MVhwZENLS2wwNk4zaXM1ckJVMCtNZmt4?=
 =?utf-8?B?cEM4aUJxMm5GaVVCU3BnbmNuVVNNNlhOcnFsUHBqUlJoQndKOFJEUzRIV2Ew?=
 =?utf-8?B?TXlpMm83a2s0Ny85UnhtTlpQOFU0a0NOZmYzTkJzN1B4RDEwcEEycVBnSVFo?=
 =?utf-8?B?SDBVb3BRQUl6MEExbnB6aHRMZmRxdEh6bnhwOEdYcEJSa3lvakZpd2MxcEFW?=
 =?utf-8?B?eGNETWNOZWVwaENialV6MzJMT0ZBOTVxc1ljemV2SnA5NkV3VFlZb0U5UFQr?=
 =?utf-8?B?OHVLcUtBNER4aVl3NHA2aW11R0FwTnorQlZ2Um5xQlBYTFI4anFldHd6WXlm?=
 =?utf-8?B?R0dYUzV1RzJ5U3NkZC9vOVBrUG01UGN6UHpvaDVLUis4YzZUK3lLeFp3Y3I2?=
 =?utf-8?B?Zk9sNUxSTWxNZThsd2thVHhqS0I3QnJEUnBQbjh0aTk2NWlDZjk1NUU0b21p?=
 =?utf-8?B?a2NiSGNudGlmdVBHdzhUTnlGTUYxNG9TQmRhZFhsbkgwWC9oTVFRTUMrRFdX?=
 =?utf-8?B?dWZCdnIxdHpPQmZuUUtUc0cyVGp3WG14NnplZ01zVFUxT080ZCtJR0Jlb2RV?=
 =?utf-8?B?STZUZUo1dTJWaVpFY0V0WFNVUlZnS3Z3U2liNkNEeGQ4bUdOUUFBZzhIYXAy?=
 =?utf-8?B?UFdsYXNyNElVNml1WGk1LzgvdlBxYWIzWVdUbGdUc2s0ZjArTWkvVHhwdytk?=
 =?utf-8?B?RU5nSFd5OFJndU02cDdVRHBsdUQ5RnVYY2U5Qko0RmVpMHM0bXBHV05aYkhw?=
 =?utf-8?B?YTFSc0JlVHI0cERLSE9HSGdVMHYyUy92U3dUU2NKN21tM0tmMFhmNXpyT200?=
 =?utf-8?B?cUtkTDlFNGpTN2dYeUF0cFMzZ04xZXBoeWg1M1FNUzF3aE1NTGtYQm1XU1gv?=
 =?utf-8?B?anozck10UEM2amkwaWVPSkpWamg1ZVQ0NzZUTDFoOVlCZVVORkZ4YWwvTldq?=
 =?utf-8?B?aktLYVF0MDlHMk1rQUN5N21ML0Y5QzVBTS9qak92Q2lDbitSc3pXUHR6cFdD?=
 =?utf-8?B?MldpaXNlSjFpOEE0TWZTRk0vQU0yb0hIUTVzcTZ5Nm1hWWZVdGVwbmMrTnNy?=
 =?utf-8?B?aWhiSlExbWJlUG1pbUNjYmUwWllySnlHd2t2ckVmWXF6aGxBcTlIaHdxM20r?=
 =?utf-8?B?YzBFbC9ueEtiVXFIMmR4WVFibTQ5L2Y4UWRRaG84RkN2Z3NHM0doYVpsWXhL?=
 =?utf-8?B?MHBqTWQwOHV1cmxNTGZWSi8rQ01FMVFxZEhWQnhGNnY4SlorMXJhVmltdlJZ?=
 =?utf-8?B?REJWUDJOSVNNMTNLVGloUnRtWkFjU1hUeGVjOTVrNlhZb09ZR2k4MTJ4eVBZ?=
 =?utf-8?B?cWFkb0R2eUJDUVJjM1ExbWd4Skh1dmNZVGJmdHFhb0VaQjY3bWdkN0pUaFMx?=
 =?utf-8?B?N0RWWmVza3JRR3FaeGJzUmlxZTc1RHNSN3ptM1RQZDVJK3JiSVJyb0NCQ294?=
 =?utf-8?B?VTFYdTErU1JvcWpkeCtBR0I3NUNJRFB1V2Zmc0NZVUNDdHlha2E0YVQvOGV3?=
 =?utf-8?B?RVc4eS8vWGQvOGRHNVIwaFhjYkFQdnorWWlGWTB0NGNSbkRldjB1QzVWUHZF?=
 =?utf-8?B?QUdMdHErbC9oOGlVeDE0aUhYWmhKcHlsVWtUN3YzVHRjZ2VIbjR0TnNWSXRC?=
 =?utf-8?B?Rk5GZ1RLRXZpSEVOSGlBUmtWZkhsZWJWZm1sSW1JYU8xdVArSUt6N2FtL0Rn?=
 =?utf-8?B?SktqVjc3RmhVVHRJRHpXbHV4ejE0cnlqd053cFF2dEFlM0l4aEQ2aWlXVVNR?=
 =?utf-8?B?U1JYZWxwK1V6ZEZyekg5TnQyM1Y1UCt2RmNIYkFFR2tqMHhTVnVhQnIxMFVa?=
 =?utf-8?B?V3lLZXhzLzlhRGhzelVzSHFiUzhyU1phbUxmRWxHRkYvb0luVGk3VTVHZ2t2?=
 =?utf-8?B?bitlTTY0WVFWbXQvdXJEWDRTdkdiRUE2YktMc2R0QmsxK1NCaksyOWJFeDU2?=
 =?utf-8?Q?f6YKQkyNxzmizUTM/Fteb69pN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aecc9973-ff20-48f8-71d2-08dd71d841f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 11:19:38.9188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 46u/GpDkZO0Aa/KrYPpHfYf8S1gqnRC63b2MeAob33zWixTdWqrB279+1+Z85D0V8AK6+O5La5ZMy4ZSgEcemGw1qjjH8tPrEsCXqNvJ5jU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8603
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

L3NuaXANCj4gVGhhdCdzIHRydWUgaW4gcHJpbmNpcGxlLCBidXQgY2FyZSBuZWVkcyB0byBiZSB0
YWtlbi4NCj4gDQo+IEZpcnN0IG9mIGFsbCwgRFBNX0ZMQUdfU01BUlRfUFJFUEFSRSBhbmQgRFBN
X0ZMQUdfU01BUlRfU1VTUEVORA0KPiBhcmUgYWJvdXQgZGlmZmVyZW50IHRoaW5ncy4NCj4gDQo+
IERQTV9GTEFHX1NNQVJUX1BSRVBBUkUgaXMgYWJvdXQgdGhlIGRpcmVjdC1jb21wbGV0ZSBvcHRp
bWl6YXRpb24gdGhhdA0KPiBhbGxvd3MgdGhlIHN1c3BlbmQgYW5kIHJlc3VtZSBvZiB0aGUgZGV2
aWNlIHRvIGJlIHNraXBwZWQgY29tcGxldGVseSBpZiBzb21lDQo+IGFkZGl0aW9uYWwgY29uZGl0
aW9ucyBhcmUgbWV0IGFuZCBpdCBhbGxvd3MgdGhlIGRyaXZlciB0byBjb250cm9sIHRoZSBiZWhh
dmlvcg0KPiByZWxhdGVkIHRvIHRoaXMgb3B0aW1pemF0aW9uIChzZWUgIkVudGVyaW5nIFN5c3Rl
bSBTdXNwZW5kIiBpbg0KPiBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvcG0vZGV2aWNlcy5yc3Qg
Zm9yIGRldGFpbHMpLiAgVGhlIGJvdHRvbSBsaW5lIGhlcmUgaXMNCj4gdGhhdCBiZWNhdXNlIHhl
IGRvZXNuJ3QgcHJvdmlkZSBhDQo+IC0+cHJlcGFyZSgpIGNhbGxiYWNrIGluIHhlX3BtX29wcywg
dGhpcyBmbGFnIHdpbGwgaGF2ZSBubyBlZmZlY3QuICB4ZQ0KPiBtYXkgd2FudCB0byBzZXQgRFBN
X0ZMQUdfTk9fRElSRUNUX0NPTVBMRVRFIHRvIGRpc2FibGUgdGhlIGRpcmVjdC0NCj4gY29tcGxl
dGUgb3B0aW1pemF0aW9uIGNvbXBsZXRlbHksIHRob3VnaCAoaTkxNSBkb2VzIHRoaXMgZm9yIHNv
bWUgcmVhc29uDQo+IHVuY2xlYXIgdG8gbWUpLg0KSTkxNSBoYXMgZGlzYWJsZWQgdGhlIGRpcmVj
dCBjb21wbGV0ZSBvcHRpbWl6YXRpb24gZHVlIHRvIGhkYWNfaGRtaSBtb2R1bGUgcmVsaWVzIG9u
IGphY2sgZGV0ZWN0aW9uIGZyb20NCkk5MTUgcmVzdW1lIGFuZCByZXF1aXJlcyBpOTE1IHRvIGVu
YWJsZSBhdWRpbyBwb3dlciBkb21haW4uDQoNClRoYW5rcywNCkFuc2h1bWFuDQo+IA0KPiBEUE1f
RkxBR19TTUFSVF9TVVNQRU5EIGlzIGFib3V0IGxlYXZpbmcgdGhlIGRldmljZSBpbiBydW50aW1l
IHN1c3BlbmQNCj4gYWNyb3NzIHRoZSBlbnRpcmUgc3lzdGVtIHN1c3BlbmQgdHJhbnNpdGlvbiBp
ZiBpdCBpcyBzdGlsbCBydW50aW1lLXN1c3BlbmRlZCBhZnRlcg0KPiBydW5uaW5nIGl0cyBkcml2
ZXIncyAtPnN1c3BlbmQoKSBjYWxsYmFjay4NCj4gDQo+IFRoaXMgbWVhbnMgaW4gcGFydGljdWxh
ciB0aGF0IGlmIERQTV9GTEFHX1NNQVJUX1NVU1BFTkQgaXMgc2V0LCB0aGUNCj4gLT5zdXNwZW5k
KCkgY2FsbGJhY2sgbWF5IHJ1biBpbiBwYXJhbGxlbCB3aXRoIHhlX3BjaV9ydW50aW1lX3Jlc3Vt
ZSgpLA0KPiBzbyBpdCBjYW5ub3QgYmUgdGhlIGN1cnJlbnQgeGVfcGNpX3N1c3BlbmQoKSBiZWNh
dXNlIGl0IGNhbm5vdCBtYW5pcHVsYXRlIHRoZQ0KPiBkZXZpY2Ugb3IgY2FsbCBwY2lfc2F2ZV9z
dGF0ZSgpIG9uIGl0IG9yIHNpbWlsYXIuICBUaGUgbW9zdCBzdHJhaWdodGZvcndhcmQgd2F5DQo+
IHRvIG92ZXJjb21lIHRoaXMgd291bGQgYmUgdG8gcG9pbnQNCj4gLT5zdXNwZW5kX2xhdGUoKSB0
byB4ZV9wY2lfc3VzcGVuZCgpLCBidXQgdGhpcyB3b3VsZCBjYXVzZSB0aGUgZGV2aWNlDQo+IHRv
IGJlIHN1c3BlbmRlZCBsYXRlciB1bmxlc3MgaXQgd2FzIHJ1bnRpbWUtc3VzcGVuZGVkIGFscmVh
ZHkuICBJbiB0dXJuLA0KPiBzdXNwZW5kaW5nIGl0IGxhdGVyIG1heSBjYXVzZSB0aGUgdG90YWwg
ZHVyYXRpb24gb2YgdGhlIHN5c3RlbSBzdXNwZW5kDQo+IHRyYW5zaXRpb24gdG8gaW5jcmVhc2Ug
KGJlY2F1c2UgdGhlIGRldmljZSB3aWxsIG5vdyBiZSBzdXNwZW5kZWQgaW4gYSBkaWZmZXJlbnQN
Cj4gcGhhc2Ugb2YgdGhlIHRyYW5zaXRpb24pLg0KPiANCj4gVGhlIHN1c3BlbmQgdGltZSBjYW4g
YmUgZGlzdHJpYnV0ZWQgc29tZXdoYXQgZGlmZmVyZW50bHkgaWYgdGhlIGNvcmUgaXMNCj4gYWxs
b3dlZCB0byB0YWtlIGNhcmUgb2YgcHV0dGluZyB0aGUgZGV2aWNlIGludG8gYSBsb3ctcG93ZXIg
c3RhdGUuDQo+IFNpbXBseSByZW1vdmluZyB0aGUgcGNpX3NhdmVfc3RhdGUoKSBhbmQgcGNpX3Nl
dF9wb3dlcl9zdGF0ZSgpIGNhbGxzIGZyb20NCj4geGVfcGNpX3N1c3BlbmQoKSBzaG91bGQgYmUg
c3VmZmljaWVudCB0byBtYWtlIHRoaXMgaGFwcGVuIGFuZCB0aGF0IHdvdWxkIGJlDQo+IG15IGZp
cnN0IHN0ZXAgKGFmdGVyIGZpeGluZyB0aGUgZGV2aWNlIGRpc2FibGUvZW5hYmxlIGlzc3VlIGRl
c2NyaWJlZCBhYm92ZSkuDQo+IA0KPiBOZXh0LCB5b3UgY2FuIHBvaW50IC0+c3VzcGVuZF9sYXRl
KCksIGluc3RlYWQgb2YgLT5zdXNwZW5kKCksIHRvDQo+IHhlX3BjaV9zdXNwZW5kKCkgYW5kIHRo
YXQgaXMgc3RpbGwgZXhwZWN0ZWQgdG8gd29yaywgYnV0IHRoZSB0b3RhbCBzeXN0ZW0NCj4gc3Vz
cGVuZCB0aW1pbmcgd2lsbCBjaGFuZ2UuDQo+IA0KPiBJZiB0aGlzIHdvcmtzLCB5b3UnbGwgYmUg
cmVhZHkgdG8gc2V0IERQTV9GTEFHX1NNQVJUX1NVU1BFTkQuDQo=
