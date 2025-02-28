Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A98C19776
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 14:47:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8249B10E008;
	Fri, 28 Feb 2025 14:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XSZhkyp5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7492E10E008
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 14:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740754071; x=1772290071;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HTyzgL0daZmY73X7om6tWpUDYs/3Yev0luMRxv22tdU=;
 b=XSZhkyp5ZDMNbgnkwWn6p87x9i9RBS/G1s8rYLNTXSbdn0atjyeQc1AK
 a6YUs1xHCeFpMgbf7EJe7qO+SWYiQ8cs9pHIWOQUh2zsrO9KQXXgTLele
 bjYA08NoATdDK0q8oRV4qD126ndfjBMwt2w5KzX71IcUFBmxvNiSbJbsO
 RGSrPV9OhH6bGimf1RSkPwnAInzkQuiC445wmncMiQ3rLUjVuxEyaWCGh
 8iQEorpsgd+zWbzk91lJexp0F3nNbhdNBRXnHbaDzKmD4NvS7Dt0XUrzg
 M00ah3hlf5P4/vnaL2NjD1hMOj+MlNsR+QF1XGZ2Uuxv2j0knjb9Me693 g==;
X-CSE-ConnectionGUID: JWbtmTz2Ti+czZ0FekSUAw==
X-CSE-MsgGUID: srmKG7xkTfemp3VWobFQLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="44500904"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="44500904"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 06:47:50 -0800
X-CSE-ConnectionGUID: 7vE7D0yYSx2YVupjaerQIQ==
X-CSE-MsgGUID: SrUFv27JRlysYO0rqtyYaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="117141366"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2025 06:47:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Feb 2025 06:47:49 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 28 Feb 2025 06:47:49 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 06:47:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SKyAQ27LVK5T/3OUFZacQhcxHH9hG8sqZyrs1Cv6dzMWzKWnaZlR77V6PlBCjFWhw7fgGIjLn69DXr0d6acjhNtZcssdgldsvw90cJx/h3Btcg16oPopr2KMOkSzluyuPKMl6PpticSU/CweG2InVN4WskIYUeqaIZu5Wrm0p3t7MwB9deRquxSiGNE7tTMBYcOgwOSRKcIXfXE+mJVRBw8QSIbb5KKNMsKxuUYyRI2jMFoDYWVLDJOqluoh72e1ATFCH6ZopZXJijczfEIq0zs+5JAgcX9mP5nuSnFnTpPCk55K3uqRGn7BeqlrF7HiWmIcPvnKN8WlPqzk0P5erg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTyzgL0daZmY73X7om6tWpUDYs/3Yev0luMRxv22tdU=;
 b=Fiu8WfIkzwFsWGGXDv1/PyBDuVzzle+GkM7ZmBDvkIDQIz6jWHCeg3ptnTpP7QgDWRRsEw8qXiY/AROn+nAJwqzzoberkgBhj3buawbu7Xgp9TSF6Q8Fj6MFcpCQVCUNajWBA26lwOwboLDP/Fk1NKI7HZ53EaX6eRf/YQFtzZYCSjQdrjinFwaqDK0cOoZ+IF0r+KlzehkMHz+wdMktGBY47w9Q29V7NC9k6xiTfppbAFMXcI9+bGNMuigErDQg/FWv0WNheQi2F3b3EwuMrzAo13zlo+/YBhx4Icd7AudqGh6dI8xolnRjDPQFZwEkfurbMnNZfM1kSYTVTHU0Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 DS0PR11MB8000.namprd11.prod.outlook.com (2603:10b6:8:128::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.21; Fri, 28 Feb 2025 14:47:45 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%7]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 14:47:45 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "Bhatia, Aradhya" <aradhya.bhatia@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/2] drm/xe_migrate: Switch from drm to dev managed actions
Thread-Topic: [PATCH 1/2] drm/xe_migrate: Switch from drm to dev managed
 actions
Thread-Index: AQHbia1mIZnwzBm7s0uFGGpRmrBRbrNcgdiAgAAN9oCAABVOAIAACA2AgAAe7wA=
Date: Fri, 28 Feb 2025 14:47:45 +0000
Message-ID: <56e1e5b6d4d68d67cff09fca2f77cc125c29fc7f.camel@intel.com>
References: <20250228065224.320811-1-aradhya.bhatia@intel.com>
 <20250228065224.320811-2-aradhya.bhatia@intel.com>
 <1b66c78c-82d4-4002-9fa4-6f30e97e0268@intel.com>
 <3a74a434957fb52ebcc36a4d5b88e8428ac2165f.camel@intel.com>
 <1bb4be8a-8058-4066-b447-1af29cbb46c0@intel.com>
 <7238c8a392fc5fb4ce297cd85dacf8ef2b342669.camel@intel.com>
In-Reply-To: <7238c8a392fc5fb4ce297cd85dacf8ef2b342669.camel@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|DS0PR11MB8000:EE_
x-ms-office365-filtering-correlation-id: 86cdad6b-e968-42b9-18a8-08dd5806dce4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?aVhIV0ZiWEc1N24zN2RZbEJVcndiVGdMeTZhWVpzRy9uTFBRTTh0OFpRTDBB?=
 =?utf-8?B?OWVWYmloUFpRTTdhRG1OZG9xQTltWW14OGNrSDhJSzBqWHplcS9UcjZTTjl3?=
 =?utf-8?B?OFRhZ1Y2M3NRdFR0TlRKMCtaREV2b1RRQmxFMjIrVGpySUM2U3JTai9mZTJH?=
 =?utf-8?B?VHBadjlNQVJyWHpCOFFrWXlYZmJHWE1qREhSTVFjWDI1R3J6Y2c0QU1wbWlH?=
 =?utf-8?B?OUYwV1pybndONXFiTkM0Z3pLNnVwZS9LbHRoL28vaXRPUFRYQkZWNjdOckxG?=
 =?utf-8?B?cHgxVGNKbWgrNmlSUXg0ZHdpcVRjSkMvYXlIazIvZzJ2elA4akx3eDdHRlV0?=
 =?utf-8?B?cGhjNko4MFdUclVNK2VrTk9wZ0g2RkZmdlVFSEJzeThQUEIvV2lVUHh6eGhq?=
 =?utf-8?B?NWtTWFR5bWhvd0ZBbWc2SXdGZitkbkxqeklTbWE1d1ZrTVh5c3Z5eCtRenlU?=
 =?utf-8?B?UDNidWw4UVQvR2cveTMxc3JLNE5ML2N5aWorMytZNit6VDhlUzNKMERYa25o?=
 =?utf-8?B?elhqYmY4bk9yUlEwY2RjZVhSdlV1bDZZdkNBTkdjT2ZRMnpNSGxtRjZlejF2?=
 =?utf-8?B?QUd2RlBxd1ZFY2JNWithbm1zcVB5WGhtdE1HQlA1d01hNXJneUY3VWpRSU1u?=
 =?utf-8?B?YzlRYnp2Tk5YNjJ2RnFEcXRZbkZNL0gwNHhrdjdZbFZYcWNodlhock5qNGVo?=
 =?utf-8?B?NENTTC9HV3hFWHBiN2x2QjZMdm5hdklrMzlKa05BYVlIbG5tSnJtbnBxVVB0?=
 =?utf-8?B?dElWdFc0cTg5NUwwYjFjcGhWcXIxc3E1QVVxbjcrejFsZUVmQ1VTYTVJT3NB?=
 =?utf-8?B?ZEQ2biswaGhnbHpoNURTcjhWYWYxRVFNWUtnUkRQeWhhVzlBZ2xhbkNQVFQ4?=
 =?utf-8?B?UVNzU0tmbWpkOUx4M3lZNURzbkVlS2ZRd1IyOGppejdzUjZ1NnI2RTJYZWU3?=
 =?utf-8?B?d2hGSGhRNFJSMFV5d1hUdkxMVE5ua0p5Y0VSZUh0SEhzQzhVR2NRWkdDZkdT?=
 =?utf-8?B?c255Qzg2NWJpd3RjRDIxTjdveTlReWFwZ1JUcUNCckF3UGhjd2M0dDdINUlh?=
 =?utf-8?B?RExmOGt0bXlxMjI0OG1vN0dYZW5VMDBiaFBZV24wMmhGcHYxZStDSzV1M1BO?=
 =?utf-8?B?SnRTT1R3TUJDZEc3TjZvZzFQT2xDVHF0K0o1RlVQSUlzaEZ3VTBuenVvT3pE?=
 =?utf-8?B?b1ZxalRNeC91eTFSTllVdkliYU9RVG0rMlp6S0NhcFpyN0t5Vmw4UC9ub0Vo?=
 =?utf-8?B?Z2hMQXBRWVpVUVNGTXJTYkxwRTh0eGxMTVF0MU5QQk95V2ZHWmZHM29EWXB5?=
 =?utf-8?B?d3FGcHFkQ2VHdXIzVjRsdGdjdGN0cGt3bStGRUExKzJpQXZRc21JWUcvT2c4?=
 =?utf-8?B?TWVIeGRrN2NhUTFmeUdaSHVjRUl4aDJsZ2x5VVVia21kQ0NybDl1cHAwMzIw?=
 =?utf-8?B?WXV0bVRBV0NFUW9ieVVFU2RGOUs1bWNhY1BPcE1COXVxam1xSWJqbGRRVm9P?=
 =?utf-8?B?RUtMSHFyOEpvUDlFa01RWUNDSTN4c1JDMC9zdXFQdHRlUTZHY2p2eWdBRjI2?=
 =?utf-8?B?OHpHcklQSVpDZ3BXVytnQkFoSFRiTWNPVjNTc2ZmaUxhV3RjUGlMNS9NekQw?=
 =?utf-8?B?RHpMNlAyU3lYeStqdkJlcnRiNU1aQ01lRjRQVFMvV040ZTA2NWxCWXhNekMz?=
 =?utf-8?B?VnNQOWVrbStleUcvTzJ3MndtSXRzMXRtbEVpZzJMZmZMU0xUTUQyRVJlS1VC?=
 =?utf-8?B?cjBudHVQaW1rN1VuamoxdnBtSWlRb2dwZ1hrZmZKMThhVzNGU3pLQTJXZU82?=
 =?utf-8?B?RW9VbXJCbW5lS0ZMbWpVWmpaR0lvcjF2NlNKZWtxczBIcXc4akVKVUNsMkp5?=
 =?utf-8?B?L2JtNU9WRXRKR3Z6VjNyeWtNL1AraGRpNmlkS25BNytvR2I0cGFBZFZCSjlK?=
 =?utf-8?Q?YnwXyWI0FbCnrvm+OJmuc0VWt4R/4NcZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZkQweTF6Mnk0NTRRc3MwT1JLaXFIQ3NaZVBzN29pVmxFZUt5Zk9zZjF2U2tO?=
 =?utf-8?B?a3pWM3hZMnV5RTFqa3R6OHJTZ3hOcmJ2V05xa2xyOWhxT3o3Q0RHN2ZSd3Rh?=
 =?utf-8?B?cmxKRElseWMyd2NqU1FGb3hHNFF6b0NQT3AzdGNBSkdORFlUQ3lKWUNOZkc3?=
 =?utf-8?B?N2NKaVVybUN0dXg0ZFZxdFBUTDlLcnF2bWxRMEVrZUlqUE9CcUlIK1hDcjVr?=
 =?utf-8?B?UnZJUkI4d1NLYmVFOVhnZkh2dFB5d2JQd3E3TnJ5Wm5ac012bTd6NExsUHl3?=
 =?utf-8?B?SGNnN1dMbVc5Z3B3Q2RvdVhkbFZ0Wk80SmE1WUFuT1BPdFpEdjdwdzY0ZGxp?=
 =?utf-8?B?U0ViSWtwU3hCQlI5U3VjRHZQVWZLQS9CWUNFbXpFMzl1ZGNVbjMvekQvTlQ5?=
 =?utf-8?B?TUxsVGZXWEFIU3ZVK3FFMkVlaEtVVU9nN0lQRnF6Vy9UKzBZOXpSeWxzajVP?=
 =?utf-8?B?L0YrZGlwbzZuZmN3VlhUL21oby9vS2FNRlM4Q21wT2xnYjh1RFErZnFKY0pM?=
 =?utf-8?B?VWN4RUQ3cS9oRmhjWk83M2VDbHRpSkdZUE1aWjZNaG4zMDd0dGx1WGFYYUtW?=
 =?utf-8?B?NGg2Mm9tTGRSaTdQRzVaeGV6RHdkeEFxVVNwaGhGc1N0aWFzS3FpSkZadGFp?=
 =?utf-8?B?MUY5ZFczYUpWNjJPclVMamZpcmVlVjRyeGM5eVdXTXdETzk4STFTaEpaVWpF?=
 =?utf-8?B?SkZ2TWpIRXk4aFBWdG41cStMMWEzU3RCNHFUMU5Hdm1FVFVDYXR0VitSV1Qz?=
 =?utf-8?B?anllY1o5WHQwSFprQzJSTEJROGZNV1IxeTJ4MG5OQmRJQlFwemhIclZXSVdY?=
 =?utf-8?B?TGF3djRBM2UrS0wrcVJVek15YzRkMnNPOTc1Z3UzelFlOGRqcFZlNnh5emFo?=
 =?utf-8?B?S2VSZzJ2K2dxQVB6aU5pM0J3WkZTZnVGcHpyTmZQRFpnM2JKcGJYcGxyZW1v?=
 =?utf-8?B?ZVNlVG9kb09kYXgwS2RhcC9uT3U0K1BwV09lb3FrMVZXV0FPb1ZpdkFzVUZ3?=
 =?utf-8?B?VGc0YThGME5yZUxmYzB0MUxPeGdjbjg0WWdtYnVGa2Z5ZmxhVktBK2x6WVFI?=
 =?utf-8?B?eitzL2p6NGpHMFRYK3QyTHBEdDhQazkwZXBqWm12dzhSeWVrdlZjSVdZaVNz?=
 =?utf-8?B?ZHMzeFg4UVVNUEQ1cjdibFp4UHFMV0pJWnRKY3hIWkcycGVFK2NxVjdaeWxt?=
 =?utf-8?B?VGVETi95aXRsVmpNZ2p1clJUdURXVDVpSnZDZG5raXR3L3hUeHVGSERTcm9q?=
 =?utf-8?B?dTZQV3VZeERIRHJCSUdDRVZybjNpMitrOFJGM05pNldGRnF6aGd4YlZtMEFD?=
 =?utf-8?B?WDJkYUowY09PVm96TjNxRXdiRU1QSEdxSzY3RlpJY0FjNTFMbTY2YjROMjdp?=
 =?utf-8?B?aWFmTTcwNE9vR0gyN09tdG5MRE84bnVsZG4zQ05PbkR5TWhhQXMxWGFMZDdo?=
 =?utf-8?B?NWpZck1UVllRK3FoK3lRMDdwK1YyY0JPS0EzWlNsNitLb2lFN1UyZG0waDgz?=
 =?utf-8?B?ZnZMYVJTTUtUbXJrb1NYbjdvZDNnVjViZUQzem5OU0d0UmN2eWtqYTFZRFBY?=
 =?utf-8?B?ZXRtaVdRRU1td3d4QmUwdlVqNmMxZXBXVGZKWkVyTUNFNGk4MTNmZDQyRDJ1?=
 =?utf-8?B?VnpyVUVrYVh6eGJ2R2twbG1EU3poU3Y3ZXFoNGI1SmF5SFN0blRUNjJtT21J?=
 =?utf-8?B?WUs5YUJJMm5rTVlMNXVPV0FLZExiK3J0cnY1enpRanVuSnluMTdjR3ZpMFZK?=
 =?utf-8?B?dE85bWFvTE5WN2tXUGc2SmlNL1NCUUVPeTU2bDNidFhnZkdRcnZWcHFWMHQz?=
 =?utf-8?B?SVhmSW9FTGRXZzcrK3V4SWZtWXE4MlNNVFdPOFpic0M0bXNJaXp1NUs4a2tM?=
 =?utf-8?B?S3I3YmtzcVZFcWpyMzNUNVVPKzV2WVZ6ZXZYdDF2T003ZFRUNVVnUU44dVNW?=
 =?utf-8?B?THhka2h0UDRMRW5jaWRYNkxLbm9UQ3czSjl2MmsxU3FpNWJJNGhpaVFJdzRw?=
 =?utf-8?B?QUE3cG9CL0Y2M294cDk4YWROdFJOQ0kvVldLTmR0b0lSckYvbE1yWlVpWVZo?=
 =?utf-8?B?V2I5Nk5EUEc2eDkxcDRScGs1bGFUcXNSMnNvMTJsUTNyN2RGUzd1cUd1MExN?=
 =?utf-8?B?aXVpNk1hSzVySlRuRFJSM281QUhpUFNxdDlkK1FGQmFjdk45R0x2R2pZRDc5?=
 =?utf-8?Q?0hKrDK/VgHekbE6WtHlFAqlC4toxR/bJIGVJ8XBrhpe4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <984147626C569E4E82042F5F2A91A067@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86cdad6b-e968-42b9-18a8-08dd5806dce4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 14:47:45.4941 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2cKHFWBAUe9mlbKy0tohEfzWTAz4KbPo6sIsruBZBKU+LUxUJTMYtGCrV2aTFDj1UgUPyHBzKuveCJ6g8nsB/9h7JbKoGvzerDCpjWqltNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8000
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

T24gRnJpLCAyMDI1LTAyLTI4IGF0IDEzOjU3ICswMTAwLCBUaG9tYXMgSGVsbHN0csO2bSB3cm90
ZToNCj4gT24gRnJpLCAyMDI1LTAyLTI4IGF0IDEyOjI4ICswMDAwLCBNYXR0aGV3IEF1bGQgd3Jv
dGU6DQo+ID4gSGksDQo+ID4gDQo+ID4gT24gMjgvMDIvMjAyNSAxMToxMSwgSGVsbHN0cm9tLCBU
aG9tYXMgd3JvdGU6DQo+ID4gPiBIaSwgTWF0dGhldw0KPiA+ID4gDQo+ID4gPiBPbiBGcmksIDIw
MjUtMDItMjggYXQgMTA6MjEgKzAwMDAsIE1hdHRoZXcgQXVsZCB3cm90ZToNCj4gPiA+ID4gT24g
MjgvMDIvMjAyNSAwNjo1MiwgQXJhZGh5YSBCaGF0aWEgd3JvdGU6DQo+ID4gPiA+ID4gQ2hhbmdl
IHRoZSBzY29wZSBvZiB0aGUgbWlncmF0ZSBzdWJzeXN0ZW0gdG8gYmUgZGV2IG1hbmFnZWQNCj4g
PiA+ID4gPiBpbnN0ZWFkDQo+ID4gPiA+ID4gb2YNCj4gPiA+ID4gPiBkcm0gbWFuYWdlZC4NCj4g
PiA+ID4gPiANCj4gPiA+ID4gPiBUaGUgcGFyZW50IHBjaSBzdHJ1Y3QgJmRldmljZSwgdGhhdCB0
aGUgeGUgc3RydWN0ICZkcm1fZGV2aWNlDQo+ID4gPiA+ID4gaXMgYQ0KPiA+ID4gPiA+IHBhcnQN
Cj4gPiA+ID4gPiBvZiwgZ2V0cyByZW1vdmVkIHdoZW4gYSBob3QgdW5wbHVnIGlzIHRyaWdnZXJl
ZCwgd2hpY2ggY2F1c2VzDQo+ID4gPiA+ID4gdGhlDQo+ID4gPiA+ID4gdW5kZXJseWluZyBpb21t
dSBncm91cCB0byBnZXQgZGVzdHJveWVkIGFzIHdlbGwuDQo+ID4gPiA+IA0KPiA+ID4gPiBOaWNl
IGZpbmQuIEJ1dCBpZiB0aGF0J3MgdGhlIGNhc2UgdGhlbiB0aGUgbWlncmF0ZSBCTyBoZXJlIGlz
DQo+ID4gPiA+IGp1c3QNCj4gPiA+ID4gb25lDQo+ID4gPiA+IG9mIG1hbnkgd2hlcmUgd2Ugd2ls
bCBzZWUgdGhpcy4gQmFzaWNhbGx5IGFsbCBzeXN0ZW0gbWVtb3J5IEJPDQo+ID4gPiA+IGNhbg0K
PiA+ID4gPiBzdWZmZXIgZnJvbSB0aGlzIEFGQUlDVCwgaW5jbHVkaW5nIHVzZXJzcGFjZSBvd25l
ZC4gU28gSSB0aGluaw0KPiA+ID4gPiB3ZQ0KPiA+ID4gPiBuZWVkDQo+ID4gPiA+IHRvIHJhdGhl
ciBzb2x2ZSB0aGlzIGZvciBhbGwsIGFuZCBJIGRvbid0IHRoaW5rIHdlIGNhbiByZWFsbHkNCj4g
PiA+ID4gdGllDQo+ID4gPiA+IHRoZQ0KPiA+ID4gPiBsaWZldGltZSBvZiBhbGwgQk9zIHRvIGRl
dm0sIHNvIGxpa2VseSBuZWVkIGEgZGlmZmVyZW50DQo+ID4gPiA+IGFwcHJvYWNoLg0KPiA+ID4g
PiANCj4gPiA+ID4gSSB0aGluayB3ZSBtaWdodCBpbnN0ZWFkIG5lZWQgdG8gdGVhcmRvd24gYWxs
IGRtYSBtYXBwaW5ncyB3aGVuDQo+ID4gPiA+IHJlbW92aW5nDQo+ID4gPiA+IHRoZSBkZXZpY2Us
IGxlYXZpbmcgdGhlIEJPIGludGFjdC4gSXQgbG9va3MgbGlrZSB0aGVyZSBpcw0KPiA+ID4gPiBh
bHJlYWR5DQo+ID4gPiA+IGENCj4gPiA+ID4gaGVscGVyIGZvciB0aGlzLCBzbyBtYXliZSBzb21l
dGhpbmcgcm91Z2hseSBsaWtlIHRoaXM6DQo+ID4gPiA+IA0KPiA+ID4gPiBAQCAtOTgwLDYgKzk4
MCw4IEBAIHZvaWQgeGVfZGV2aWNlX3JlbW92ZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPiA+
ID4gDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoCBkcm1fZGV2X3VucGx1ZygmeGUtPmRybSk7
DQo+ID4gPiA+IA0KPiA+ID4gPiArwqDCoMKgwqDCoMKgIHR0bV9kZXZpY2VfY2xlYXJfZG1hX21h
cHBpbmdzKCZ4ZS0+dHRtKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqAg
eGVfZGlzcGxheV9kcml2ZXJfcmVtb3ZlKHhlKTsNCj4gPiA+ID4gDQo+ID4gPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoCB4ZV9oZWNpX2dzY19maW5pKHhlKTsNCj4gPiA+ID4gDQo+ID4gPiA+IEJ1dCBJ
IGRvbid0IHRoaW5rIHVzZXJwdHIgd2lsbCBiZSBjb3ZlcmVkIGJ5IHRoYXQsIGp1c3QgYWxsDQo+
ID4gPiA+IEJPcywNCj4gPiA+ID4gc28NCj4gPiA+ID4gbGlrZWx5IG5lZWQgYW4gZXh0cmEgc3Rl
cCB0byBhbHNvIG51a2UgYWxsIHVzZXJzcHRyIGRtYQ0KPiA+ID4gPiBtYXBwaW5ncw0KPiA+ID4g
PiBzb21ld2hlcmUuDQo+ID4gPiANCj4gPiA+IEkgaGF2ZSBiZWVuIGRpc2N1c3NpbmcgdGhpcyBh
IGJpdCB3aXRoIEFyYWRoeWEsIGFuZCB0aGUgcHJvYmxlbQ0KPiA+ID4gaXMNCj4gPiA+IGENCj4g
PiA+IGJpdCBjb21wbGV4Lg0KPiA+ID4gDQo+ID4gPiBSZWFsbHkgaWYgdGhlIFBDSSBkZXZpY2Ug
Z29lcyBhd2F5LCB3ZSBuZWVkIHRvIG1vdmUgKmFsbCogYm9zIHRvDQo+ID4gPiBzeXN0ZW0uIFRo
YXQgc2hvdWxkIGNsZWFyIG91dCBhbnkgZG1hIG1hcHBpbmdzLCBzaW5jZSB3ZSBtYXAgZG1hDQo+
ID4gPiB3aGVuDQo+ID4gPiBtb3ZpbmcgdG8gVFQuIEFsc28gVlJBTSBib3Mgc2hvdWxkIGJlIG1v
dmVkIHRvIHN5c3RlbSB3aGljaCB3aWxsDQo+ID4gPiBhbHNvDQo+ID4gPiBoYW5kbGUgdGhpbmdz
IGxpa2UgU1ZNIG1pZ3JhdGlvbi4NCj4gPiANCj4gPiBNeSB0aGlua2luZyBpcyB0aGF0IGZyb20g
dXNlcnNwYWNlIHBvdiwgdGhlIGJ1ZmZlcnMgYXJlIGFib3V0IHRvIGJlDQo+ID4gbG9zdCANCj4g
PiBhbnl3YXksIHNvIGdvaW5nIHRocm91Z2ggdGhlIHRyb3VibGUgb2YgbW92aW5nIHN0dWZmIHNl
ZW1zIGxpa2UgYQ0KPiA+IHdhc3RlPyANCj4gPiBPbmNlIHRoZSBkZXZpY2UgaXMgdW5wbHVnZ2Vk
IGFsbCBpb2N0bHMgYXJlIHJlamVjdGVkIGZvciB0aGF0DQo+ID4gaW5zdGFuY2UgDQo+ID4gYW5k
IHdlIHNob3VsZCBoYXZlIHN0b3BwZWQgdG91Y2hpbmcgdGhlIGh3LCBzbyBhbGwgdGhhdCBpcyBs
ZWZ0IGlzDQo+ID4gdG8NCj4gPiBjbG9zZSBzdHVmZiBhbmQgb3BlbiB1cCBhIG5ldyBpbnN0YW5j
ZS4gVlJBTSBpcyBiYXNpY2FsbHkganVzdCBzb21lDQo+ID4gc3RhdGUgdHJhY2tpbmcgYXQgdGhp
cyBwb2ludCAoZm9yIHRoaXMgZHJpdmVyIGluc3RhbmNlKSwgYW5kIGFjdHVhbA0KPiA+IG1lbW9y
eSBmb290cHJpbnQgaXMgc21hbGwuIElmIHdlIG1vdmUgdG8gc3lzdGVtIG1lbW9yeSB3ZSBtaWdo
dCBiZQ0KPiA+IHVzaW5nIA0KPiA+IGFjdHVhbCBzeXN0ZW0gcGFnZXMgZm9yIHN0dWZmIHRoYXQg
c2hvdWxkIHJlYWxseSBqdXN0IGJlIHRocm93bg0KPiA+IGF3YXksDQo+ID4gYW5kIHdpbGwgYmUg
b25jZSB0aGUgZHJpdmVyIGluc3RhbmNlIGdvZXMgYXdheSBBRkFJSy4gQW5kIGZvciBzdHVmZg0K
PiA+IHRoYXQgDQo+ID4gaGFzIGFuIGFjdHVhbCBwb3B1bGF0ZWQgdHRtX3R0LCB3ZSBqdXN0IGRp
c2NhcmQgd2l0aCBzb21ldGhpbmcgbGlrZQ0KPiA+IHR0bV9kZXZpY2VfY2xlYXJfZG1hX21hcHBp
bmdzKCkgZHVyaW5nIHJlbW92ZS4NCj4gDQo+IFRoYXQncyB0cnVlIGZvciBtb3N0IGN1cnJlbnQg
dXNlLWNhc2VzIGJ1dCBleHBvcnRlZCB0aGluZ3MsIGxpa2UNCj4gbXVsdGlkZXZpY2UgU1ZNLCBp
ZiB5b3UgdW5iaW5kIGEgZGV2aWNlIHlvdSdkIGN1cnJlbnRseSBqdXN0IHdhbnQgdG8NCj4gbWln
cmF0ZSB0byBzeXN0ZW0sIGFuZCBpdCdzIG5vdCBmYXRhbCB0byB0aGUgcnVubmluZyBhcHBsaWNh
dGlvbg0KPiAoc3ViamVjdCB0byByZXZpZXcgb2ZjKS4gQW5kIEknbSBub3Qgc3VyZSB3aGF0IHRo
ZSBleHBlY3RlZCBkbWEtYnVmDQo+IHNlbWFudGljcyBhcmUsIGFsdGhvdWdoIGlmIHdlIGZyZWUg
cGFnZXMgdGhhdCB0aGUgcmVtb3RlIGRldmljZSBoYXMNCj4gcGlubmVkIGFuZCBrZWVwIGFjY2Vz
c2luZywgdGhhdCBzb3VuZHMgYmFkLg0KDQpIYXZpbmcgdGhvdWdodCBhIGJpdCBtb3JlIGFib3V0
IHRoaXMsIEZpcnN0LCBJIGZ1bGx5IGFncmVlIHRoYXQNCmV2aWN0aW5nIGFsbCBvZiBWUkFNIHdh
cyBwcm9iYWJseSBhIGJhZCBpZGVhLiBXZSBuZWVkIHRvIGJlIHNlbGVjdGl2ZSwNCmFuZCBldmlj
dCBleHBvcnRlZCBWUkFNIG9ubHkuIFRoYXQgbWVhbnMgU1ZNIChubyBhY3Rpb24gcmVxdWlyZWQg
dW50aWwNCm11bHRpLXN2bSBsYW5kcykgYW5kIHAycCBETUEtYnVmLCAodW5sZXNzIHRoZXJlIGlz
IGEgd2F5IHRvIHJldm9rZSBhDQpkbWEtYnVmKSB3aGVyZSB3ZSBhdCBsZWFzdCBuZWVkIHRvIHNl
bmQgYSBtb3ZlX25vdGlmeSgpIGFuZCB3YWl0IGZvcg0KaWRsZS4gQSBwb3NzaWJsZSB3YXkgbWln
aHQgYmUgdG8gaG9vayB1cCB0byB4ZV9ldmljdF9mbGFncygpIGFuZA0KcmVzcG9uZCB3aXRoIGEg
TlVMTCBwbGFjZW1lbnQsIHB1cmdpbmcgdGhlIGJvIGZvciBhbnl0aGluZyBidXQgU1ZNLg0KDQpQ
aW5uZWQgcDJwIFZSQU0gZG1hLWJ1ZiBJIHRoaW5rIG5lZWRzIHRvIGJsb2NrIHRoZSByZW1vdmUo
KSBjYWxsYmFjaywNCmJ1dCB3ZSBkb24ndCBzdXBwb3J0IHRoYXQgQVRNLg0KDQpTeXN0ZW0gRE1B
LWJ1ZiBzaG91bGRuJ3QgYmUgYSBwcm9ibGVtLCBidXQgd2UgY2FuJ3QgZHJvcCB0aGUgcGFnZXMN
CkFGQUlDVC4NCg0KSW1wb3J0ZWQgZG1hLWJ1ZiBzaG91bGQgaGF2ZSB0aGUgYXR0YWNobWVudCB1
bm1hcHBlZC4NCg0KSSB0aGluayB0aGF0IF9ldmljdF9hbGwoKSBjb3VsZCBiZSBtYWRlIHRvIGhh
bmRsZSBhbGwgdGhlc2Ugc2l0dWF0aW9ucw0Kd2l0aCBzb21lIG1pbm9yIHR3ZWFrcywgYnV0IHRo
YXQgc3RpbGwgbGVhdmVzIHRoZSBwaW5uZWQgVFQgYm9zLg0KDQovVGhvbWFzDQoNCg0KPiANCj4g
PiANCj4gPiA+IA0KPiA+ID4gQnV0IHRoYXQgZG9lc24ndCByZWFsbHkgaGVscCB3aXRoIHBpbm5l
ZCBib3MuIFNvIElNTyBzdWJzeXN0ZW1zDQo+ID4gPiB0aGF0DQo+ID4gDQo+ID4gSSB0aGluayB0
dG1fZGV2aWNlX2NsZWFyX2RtYV9tYXBwaW5ncygpIGFsc28gaGFuZGxlcyBwaW5uZWQgQk8sDQo+
ID4gQUZBSUNULg0KPiANCj4gWWVzLCB5b3UncmUgcmlnaHQuIEkgc3RpbGwgdGhpbmsgaXQncyBy
ZWFzb25hYmxlLCB0aG91Z2ggdG8gDQo+IA0KPiA+IA0KPiA+IEkgYmVsaWV2ZSB0aGUgcGlubmVk
IEJPIGFyZSB0cmFja2VkIHZpYSBiZGV2LT51bmV2aWN0YWJsZSwgc28gaW4NCj4gPiB0aGVvcnkg
DQo+ID4gaXQgd2lsbCBudWtlIHRoZSBkbWEgbWFwcGluZyB0aGVyZSBhbHNvIGFuZCBkaXNjYXJk
IHRoZSBwYWdlcy4NCj4gPiANCj4gPiA+IGFsbG9jYXRlIHBpbm5lZCBib3MgbmVlZCB0byBiZSBk
ZXZtIG1hbmFnZWQsIGFuZCB0aGlzIGlzIGEgc3RlcA0KPiA+ID4gaW4NCj4gPiA+IHRoYXQNCj4g
PiA+IGRpcmVjdGlvbi4gQnV0IHdlIHByb2JhYmx5IG5lZWQgdG8gZGVhbCB3aXRoIHNvbWUgZmFs
bG91dC4gRm9yDQo+ID4gPiBleGFtcGxlDQo+ID4gPiB3aGVuIHdlIHRha2UgZG93biB0aGUgdnJh
bSBtYW5hZ2VycyB1c2luZyBkcm1tbV8gdGhleSdkIHdhbnQgdG8NCj4gPiA+IGNhbGwNCj4gPiA+
IGV2aWN0X2FsbCgpIGFuZCB0aGUgbWlncmF0ZSBzdWJzeXN0ZW0gaXMgYWxyZWFkeSBkb3duLg0K
PiA+ID4gDQo+ID4gPiBTbyBJIHRoaW5rIGEgbmF0dXJhbCBwbGFjZSB0byBkZWFsIHdpdGggc3Vj
aCBmYWxsb3V0cyBpcyB0aGUNCj4gPiA+IHJlbW92ZSgpDQo+ID4gPiBjYWxsYmFjaywgd2hpbGUg
c3Vic3lzdGVtcyB3aXRoIHBpbm5lZCBib3MgdXNlIGRldm1fDQo+ID4gPiANCj4gPiA+IEJ1dCBh
ZG1pdHRlZGx5IHRvIG1lIGl0J3Mgbm90IHJlYWxseSBjbGVhciBob3cgdG8gKmJlc3QqIGhhbmRs
ZQ0KPiA+ID4gdGhpcw0KPiA+ID4gc2l0dWF0aW9uLiBJIHN1c3BlY3QgaWYgd2UgcmVhbGx5IHN0
cmVzcy10ZXN0IGRldmljZSB1bmJpbmRpbmcgb24NCj4gPiA+IGENCj4gPiA+IHJ1bm5pbmcgYXBw
IHdlJ3JlIGdvaW5nIHRvIGhpdCBhIGxvdCBvZiBwcm9ibGVtcy4NCj4gPiANCj4gPiBZZXMsIHRo
ZXJlIGFyZSBsb3RzIG9mIG9wZW4gaXNzdWVzIGhlcmUsIGJ1dCBvdXIgdGVzdGluZyBpcyBzdGls
bA0KPiA+IGxhY2tpbmcgOikNCj4gPiANCj4gPiA+IA0KPiA+ID4gQXMgZm9yIHRoZSB1c2VycHRy
cywgSSBqdXN0IHBvc3RlZCBhIHNlcmllcyB0aGF0IGludHJvZHVjZXMgYQ0KPiA+ID4gcGVyLQ0K
PiA+ID4gdXNlcnB0ciBkZWRpY2F0ZWQgdW5tYXAgZnVuY3Rpb24uIFdlIGNvdWxkIHByb2JhYmx5
IHB1dCB0aGVtIG9uIGENCj4gPiA+IGRldmljZSBsaXN0IG9yIHNvbWV0aGluZyBzaW1pbGFyIHRo
YXQgY2FsbHMgdGhhdCBmdW5jdGlvbiAob3INCj4gPiA+IGp1c3QNCj4gPiA+IGdlbmVyYWwgdXNl
cnB0ciBpbnZhbGlkYXRpb24pIGZvciBhbGwgdXNlcnB0cnMuDQo+ID4gDQo+ID4gU291bmRzIGdv
b2QuDQo+ID4gDQo+ID4gPiANCj4gPiA+IC9UaG9tYXMNCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiAN
Cj4gPiA+IA0KPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFRoZSBtaWdy
YXRlIHN1YnN5c3RlbSwgd2hpY2ggaGFuZGxlcyB0aGUgbGlmZXRpbWUgb2YgdGhlDQo+ID4gPiA+
ID4gcGFnZS0NCj4gPiA+ID4gPiB0YWJsZQ0KPiA+ID4gPiA+IHRyZWUNCj4gPiA+ID4gPiAocHQp
IEJPLCBkb2Vzbid0IGdldCBhIGNoYW5jZSB0byBrZWVwIHRoZSBCTyBiYWNrIGR1cmluZyB0aGUN
Cj4gPiA+ID4gPiBob3QNCj4gPiA+ID4gPiB1bnBsdWcsDQo+ID4gPiA+ID4gYXMgYWxsIHRoZSBy
ZWZlcmVuY2VzIHRvIERSTSBoYXZlbid0IGJlZW4gcHV0IGJhY2suDQo+ID4gPiA+ID4gV2hlbiBh
bGwgdGhlIHJlZmVyZW5jZXMgdG8gRFJNIGFyZSBpbmRlZWQgcHV0IGJhY2sgbGF0ZXIsIHRoZQ0K
PiA+ID4gPiA+IG1pZ3JhdGUNCj4gPiA+ID4gPiBzdWJzeXN0ZW0gdHJpZXMgdG8gcHV0IGJhY2sg
dGhlIHB0IEJPLiBTaW5jZSB0aGUgdW5kZXJseWluZw0KPiA+ID4gPiA+IGlvbW11DQo+ID4gPiA+
ID4gZ3JvdXANCj4gPiA+ID4gPiBoYXMgYmVlbiBhbHJlYWR5IGRlc3Ryb3llZCwgYSBrZXJuZWwg
TlVMTCBwdHIgZGVyZWZlcmVuY2UNCj4gPiA+ID4gPiB0YWtlcw0KPiA+ID4gPiA+IHBsYWNlDQo+
ID4gPiA+ID4gd2hpbGUgYXR0ZW1wdGluZyB0byBrZWVwIGJhY2sgdGhlIHB0IEJPLg0KPiA+ID4g
PiA+IA0KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFyYWRoeWEgQmhhdGlhIDxhcmFkaHlhLmJo
YXRpYUBpbnRlbC5jb20+DQo+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gwqDCoCBkcml2ZXJzL2dw
dS9kcm0veGUveGVfbWlncmF0ZS5jIHwgNiArKystLS0NCj4gPiA+ID4gPiDCoMKgIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMNCj4gPiA+
ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMNCj4gPiA+ID4gPiBpbmRleCAy
NzhiYzk2Y2Y1OTMuLjRlMjNhZGZhMjA4YSAxMDA2NDQNCj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfbWlncmF0ZS5jDQo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX21pZ3JhdGUuYw0KPiA+ID4gPiA+IEBAIC05Nyw3ICs5Nyw3IEBAIHN0cnVjdCB4ZV9l
eGVjX3F1ZXVlDQo+ID4gPiA+ID4gKnhlX3RpbGVfbWlncmF0ZV9leGVjX3F1ZXVlKHN0cnVjdCB4
ZV90aWxlICp0aWxlKQ0KPiA+ID4gPiA+IMKgwqDCoAlyZXR1cm4gdGlsZS0+bWlncmF0ZS0+cTsN
Cj4gPiA+ID4gPiDCoMKgIH0NCj4gPiA+ID4gPiDCoMKgIA0KPiA+ID4gPiA+IC1zdGF0aWMgdm9p
ZCB4ZV9taWdyYXRlX2Zpbmkoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZA0KPiA+ID4gPiA+
ICphcmcpDQo+ID4gPiA+ID4gK3N0YXRpYyB2b2lkIHhlX21pZ3JhdGVfZmluaSh2b2lkICphcmcp
DQo+ID4gPiA+ID4gwqDCoCB7DQo+ID4gPiA+ID4gwqDCoMKgCXN0cnVjdCB4ZV9taWdyYXRlICpt
ID0gYXJnOw0KPiA+ID4gPiA+IMKgwqAgDQo+ID4gPiA+ID4gQEAgLTQwMSw3ICs0MDEsNyBAQCBz
dHJ1Y3QgeGVfbWlncmF0ZSAqeGVfbWlncmF0ZV9pbml0KHN0cnVjdA0KPiA+ID4gPiA+IHhlX3Rp
bGUgKnRpbGUpDQo+ID4gPiA+ID4gwqDCoMKgCXN0cnVjdCB4ZV92bSAqdm07DQo+ID4gPiA+ID4g
wqDCoMKgCWludCBlcnI7DQo+ID4gPiA+ID4gwqDCoCANCj4gPiA+ID4gPiAtCW0gPSBkcm1tX2t6
YWxsb2MoJnhlLT5kcm0sIHNpemVvZigqbSksIEdGUF9LRVJORUwpOw0KPiA+ID4gPiA+ICsJbSA9
IGRldm1fa3phbGxvYyh4ZS0+ZHJtLmRldiwgc2l6ZW9mKCptKSwNCj4gPiA+ID4gPiBHRlBfS0VS
TkVMKTsNCj4gPiA+ID4gPiDCoMKgwqAJaWYgKCFtKQ0KPiA+ID4gPiA+IMKgwqDCoAkJcmV0dXJu
IEVSUl9QVFIoLUVOT01FTSk7DQo+ID4gPiA+ID4gwqDCoCANCj4gPiA+ID4gPiBAQCAtNDU1LDcg
KzQ1NSw3IEBAIHN0cnVjdCB4ZV9taWdyYXRlICp4ZV9taWdyYXRlX2luaXQoc3RydWN0DQo+ID4g
PiA+ID4geGVfdGlsZSAqdGlsZSkNCj4gPiA+ID4gPiDCoMKgwqAJbWlnaHRfbG9jaygmbS0+am9i
X211dGV4KTsNCj4gPiA+ID4gPiDCoMKgwqAJZnNfcmVjbGFpbV9yZWxlYXNlKEdGUF9LRVJORUwp
Ow0KPiA+ID4gPiA+IMKgwqAgDQo+ID4gPiA+ID4gLQllcnIgPSBkcm1tX2FkZF9hY3Rpb25fb3Jf
cmVzZXQoJnhlLT5kcm0sDQo+ID4gPiA+ID4geGVfbWlncmF0ZV9maW5pLA0KPiA+ID4gPiA+IG0p
Ow0KPiA+ID4gPiA+ICsJZXJyID0gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KHhlLT5kcm0uZGV2
LA0KPiA+ID4gPiA+IHhlX21pZ3JhdGVfZmluaSwgbSk7DQo+ID4gPiA+ID4gwqDCoMKgCWlmIChl
cnIpDQo+ID4gPiA+ID4gwqDCoMKgCQlyZXR1cm4gRVJSX1BUUihlcnIpOw0KPiA+ID4gPiA+IMKg
wqAgDQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4gDQo+IA0KDQo=
