Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF2FE77188
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 23:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70ECE10E040;
	Wed, 18 Dec 2024 23:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHjVOtiT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD4910E040
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 23:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734564313; x=1766100313;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZcaHoMNQiujoy8G2P4cSIqoZMt3MKtnzaqWN4vnE6CQ=;
 b=mHjVOtiTR+gni7dO9HQwa6aIExLBFxjl4oxFjdpkWe2lGWmwbZ9Ib7wP
 N7/4dw2xm/ctURpGTBSqMu3zq687eL4rsXQICxiFWIG6O6EtiCK7JmWlU
 EtWBpLc2xhSYMZcKPUENOeUx5S71ve9DG7YR6+t/3tKmmNg+CwupBcoWA
 vbHeemRuzr81vOfcCa/i4N2yui5uRQ008R7rWIqw0Xyoxl2BmQOSZGUxR
 ARwm4ynQdmwWNWUmtL9YsD1TPtJQq56s+0/ikvSaDq30jZAhG/+dZUduu
 yu6CxR4KIMXYC29nCDSwMcHmSgcDxrsoB1FJad3ck46njvsIQ9R8SBS/c Q==;
X-CSE-ConnectionGUID: 3O+hpe36RzGFdMxByP6mEA==
X-CSE-MsgGUID: F8TL5TyVQJqnfOwQ36BVig==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="46447300"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="46447300"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 15:25:13 -0800
X-CSE-ConnectionGUID: 3yf+dz46T5iUqSeWOWcfQA==
X-CSE-MsgGUID: /w5Kd1fYRZ+8kxLZCD8nNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98490201"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 15:25:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 15:25:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 15:25:12 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 15:25:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMsFaMfpq4STrLkWvSubHtHPRSadyN+suUMLmjl5bXrHht/41rt4DaruPepmDlQrh5BRuD29+o643JDfsv1CqL2aHKV4Xa1SYZPH2MEqVOFgYBCcRrcD+qxGsFM/0JYedqFZPEeZO6XaaxaEAmjyNnPIyoycTxXtin4OHFyFptHA/2NT+y0gW1UioWLtafnqEdlhNoneHcis4NFIT2XVfqj6fTml33DhVRn/57Xp0+35KocfYvMO+K3u6ENkt0veR55HqCu87XGicht2n7o3+nYB9LngtY/xOYlhMoO7VgaLZeQWAfdstpmXZzTTiSg6AvDkEiijGlrDl25Ak8jqvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/M2tT0tnzTrMavawfPxAlY5YhY+0IGuTKHrke4FU4c=;
 b=glapeexPUtDarJHSzDQRFYJbwmy8dJ3ZabI4mr9FicsHjyXjQLCySNRBEn/euFnv9EbnTnG94iwc8cYcMFOU9o+14xbtq6TjEeqz6LXWTxhuLZL/9Gba5N0un8GzkECL+q5h0Fgja6mgkvww61QUlP1eU4hpm4oY5qoFCqcRrjaDszjPU1m2RrlpHKiIV35x/6JQS6oWsxBHpC3inxjYtFdFQt1QEZfG2AzZTk6+/CL8NK/j/vjbT/Zp3z8tx8NsD4Ivu2S1ykIG73qGV9ouBETbl3ZmFeH8KtRaFsdHavUVmthuh9nUTVA5ZQ5g1ZuneG9oeTif5SbndeD65HN7jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by PH8PR11MB6708.namprd11.prod.outlook.com (2603:10b6:510:1c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 23:24:26 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%3]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 23:24:26 +0000
Date: Wed, 18 Dec 2024 15:24:18 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <james.ausmus@intel.com>,
 <felix.j.degrood@intel.com>, <matias.a.cabral@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <shubham.kumar@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.olson@intel.com>
Subject: Re: [PATCH v6 6/7] drm/xe/uapi: Add a device query to get EU stall
 sampling information
Message-ID: <Z2NZouMGW3OwAMXl@intel.com>
References: <cover.1734427624.git.harish.chegondi@intel.com>
 <6e104a81ccf931e55a577ce816e5821aab57bec4.1734427624.git.harish.chegondi@intel.com>
 <855xni2huy.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <855xni2huy.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0086.namprd03.prod.outlook.com
 (2603:10b6:303:b6::31) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|PH8PR11MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: 0038a94f-b585-4f1f-2955-08dd1fbb1d35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXlEWHkxL3dqUXRTK1FnMHo3UFRoV2NHdzRpNHhFWDB3ZmIwbk9IaWRQT1Z6?=
 =?utf-8?B?blVyQ0JzOG5LVU01ZzQzOFNhR0pqUVNaaGo0M0l1a2YxTWsvT3I4WTUyQ2hV?=
 =?utf-8?B?YVl2T1p5OEk3SUcyRVRuYWxuWWw4dEw3VEZBeTNsRGlwbjBWaFlQSE1KZU50?=
 =?utf-8?B?R2dieHY2cWZOaWhmY0RmQis4ZjVoT2tDdlJ5WmdDV0kwd0dBay91WU5ZODFF?=
 =?utf-8?B?RjFUak9TaFhneFN1YkJVS0RjTTNYOW1HZ1NlbndFeXhob0xLM1lRdmpZK3Bl?=
 =?utf-8?B?U3pYNWtrNFhNQnVuY0EwOUs3aVp3VW4wcWNoSFE3YVU0MjBxckxRZ3lKMnp3?=
 =?utf-8?B?TmdQcGJOOVVNZGowK3RzU3VTMy9aY05WNUhweU9YVnhjMW40VEhPd2VoZUJY?=
 =?utf-8?B?NnRTcUZVMjM3K2p0akVQNEpVYmxGd0svWTFKbWFSUjc2SDdJTitYVHNVYWdH?=
 =?utf-8?B?b2VrY1NpRjBuYmtHRnkzRlNiTitvT1gwZldGT0Y5ZFlPaE5UK2JkeFpKczAr?=
 =?utf-8?B?WFJkRXg4WkFjZDQ1SmhmZUpjU0tsRjZsNDNyV2xpYmt5UStTVlBEV3pTbG9C?=
 =?utf-8?B?VWQrSnFvd04xa2V0bmxsY3d3ZTdSM095R0RqS2VoM1ZjU3g0a2I1V200ajVK?=
 =?utf-8?B?Sm9oK3JUL2NNQW1BN0kvOHRRVkNscjJ5dGIrVTdIaElnN0x2clVSRnVwWkRP?=
 =?utf-8?B?UWJoNk01Mk5UUXI4VjI3Tm55R0Flc2lRUUE2K0d5d0ZvWDRUQXdyenFPdWww?=
 =?utf-8?B?ekF6UUw2dEJTNjVrQWxRdXl5OFhhdHBCUjN6ZGpwYU4rRFF1QjBKR0ljemNU?=
 =?utf-8?B?RTY5ZXRERythUzlmOUJPeDQ0SkNTdGFQVW93Y0plWVh0R3FOZHZqMDBsdzF4?=
 =?utf-8?B?eVJVeWpOM2tCZTI4Q25taWV4ZnhJa056aDVOQ0todmw2VUxKUzg0OEdvQ0cw?=
 =?utf-8?B?bVpoV0NyWHByU1FFejhPVTNWTzFqQ3lJNVIzZndhK1pmQ3ZBaitJMmpaMElM?=
 =?utf-8?B?Q3pJeEZzVTZSUWVhNThBZzRERHd5Qzc0azZlYVBaWG9ZNmRLQWxUc21Ddklq?=
 =?utf-8?B?Wm9UM2N5NkVkck85UjlEdjlXcjI3dWhlYitDaXhnRXY4NjZXYmkyV3BvNGhk?=
 =?utf-8?B?d1BNZjhLTVg0d2hMMXZyL2tEemlySnVOeWc1QUlzWXQrRHI2T3VlSVVIa1Nz?=
 =?utf-8?B?ejRxOWpTcFRIVXpyamovNHk2THlRWDUyTWE5QmU5R0MyMlk2Mm1VdkVnMVd0?=
 =?utf-8?B?Mkh2T0g2YXBQWVZZMGRNWGZ0Y1lteng4Y1FISm1ZLzd4T1lSLzlnbElqMy92?=
 =?utf-8?B?b0dDM3VYVFRlYnVLb2YrOWx5UTFqRWpZeEJxY1RTWjdLWUFybDYwQjQ5a3hU?=
 =?utf-8?B?eHZoYUU2SzdMTmdIZW4vczBVbG8rYnZ4U2k3K0RzeThVK2kxME11cm1BV0cr?=
 =?utf-8?B?VHBSVnJINlRxdktUZy81MFZzMzIrckdET1lwVVdiNzJYc283S0VEWW90WjVZ?=
 =?utf-8?B?YTRaOHgxYmdYZHhRaDk1S29FWkorWThVYzJNRjNvb1oxZkRadGo5eHg4ZUJB?=
 =?utf-8?B?ZVI5RWppYSswM2h2UW1mQmc0b28yN0dnMjRwTEwweVdoRHZ1RlFXL1N2anJX?=
 =?utf-8?B?RjZldjlZbWhueC9YQUU3NmFLek53TXdkdm5JNG5CekVzVmFHTTYydWlPUkxY?=
 =?utf-8?B?ZmZyNWsrNkpSUUFOWlM3OEoxSUJQMXRza0RJcmNRY3RYcXBiV1ZHd0FsOVI4?=
 =?utf-8?B?SW9pSSthaG5Cc1UvREMvSU5yRkZ3Q2NOZDNvYm0xNDF5UFlWUWN4KzNJYlVr?=
 =?utf-8?B?em1SZ2ZCM1hWcEtwWkRLZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck9TQzJjeUJoOW5rMGFFVWJkeDVhZHdUMmdSUHUrZHlCejFVOWl6Q2U3TGJx?=
 =?utf-8?B?d2c4RVNsbmZlYnBzVktjc2l3b3dFY01JZ1NCT0J2R2UxSHUwSG1kL1RhTTRN?=
 =?utf-8?B?WkRuZ0U5NDdTVW5vY1RKUmFxL1RhWkc1OU04NWFNRUt5QUsyaE1hVzJHd2Rj?=
 =?utf-8?B?TWMzWmkzZlVmN1ZHN0EzZTYzWUVFcGdoYUk2QzZHUVBQc0ZXTjF2Rm9mVi9x?=
 =?utf-8?B?MDNRWlFheCtDcEtIZG1LS2s0RjA4ZFppSlpIOXJsQVZDdkk1VWJjYXJWeklP?=
 =?utf-8?B?VnNzck5ZdnFHODQvWm5ERFZ0NXJQYzBTVlAyRlVTZEJUUmRoTHFkeDREVWc1?=
 =?utf-8?B?bk9vV0lvT1p4SkVwcG9Rc2wvbE5LWi8xVjBMbnJKdjBHRUxEY3JUZWM1NFJ1?=
 =?utf-8?B?Q3VUOTNHWCtVeVE5b0k2TE0zdzNiTmFRMUhxWG4vckxXYjQxNEkxOUVUNHhm?=
 =?utf-8?B?U3RRcjlQT3A2SzVudXpWNGZlS0xxYWtBcnBrWWFicnNuckVnY0RyRGtHdmlU?=
 =?utf-8?B?U3NTZVR3ZkYzTk9JL1dXRUVhY21DK0FjWUR0SE51ajJEZE9FcG1jbHRXdlA2?=
 =?utf-8?B?dXkrTWhUZkpLYlR0cjd4Y0RSWHFlSzJod0tVVDh0UTVwTGtJK2c0eHdMS2Zk?=
 =?utf-8?B?TDkrenIzRUpmMEFZRVJlbGdtcndFRzA3cWRldzNyZU93STRSYWhKNjZQVUJ4?=
 =?utf-8?B?ZFY1VDgrVGE5MndnQTBoOFg0eWNYcjg3ZVJ1QWdiWUNvNjVDZms5MWxzaHk3?=
 =?utf-8?B?Rmx0Q1R3akNGWG5wYUFEekhkNFZiK3o1SmVsTEt5LzRUamlIUlNhVElWOGJv?=
 =?utf-8?B?Qlh6eGFGK2R6UTZhaGZQS3hXczJvZ2NydXlHbmdTZytLVzk0R3JiRUt0TGpy?=
 =?utf-8?B?L2pQNHl6aEc5S3ZGc2UybG1kS2ZXUDZSZjQxMTl1U2NiVmFwVlRkV0Y0MURa?=
 =?utf-8?B?UlpCUVVDam1jVEg0ZFFDQUV0aTJHcDJtZ2JmeUE5ai85aFI0Mko1TGFteWwy?=
 =?utf-8?B?K3pIQUtvZkRMVmVQRnRxNU5DY2o3MmtzRUd5K2hEdnVxUGhOMS80WGV6U250?=
 =?utf-8?B?ZllHcDg4a3NZcnVUb3pkTS9wZzFkNEpxZGkxYlBOSkFaV1NCemRGSSs1R3R3?=
 =?utf-8?B?ZUVibUkvYVltalovbFg0Y04zVWRpNUErWUVPUXhmOWdxNVVqeU83eUpsMWty?=
 =?utf-8?B?Zk1CN296eWJsM1JBdU9Sa2duTW8xc0w2QzhlVFN2bFIwT2ZDZUErcEt0eDVN?=
 =?utf-8?B?S1JjbkhhUEdlN3lBN2JScWhMVDRzVS9wS0pLWFdYUEhhemhvOE93WDg4Y1d1?=
 =?utf-8?B?TUl2UlBWZ1lYL3gydkx5RGVjVERTdUV0WkJ3WVR5a2FENTN6WXRLYXFlaHQr?=
 =?utf-8?B?RlR2ZC9vb1JuM0tVc2NmcUR2dnVTNnQ1YUpzM0F2UGNQNkRSdytJMkRFRFpI?=
 =?utf-8?B?Q3Z0OFphSW05ZjhMUGUrdnZTWHFFYllVTUlBQVdKemREK0Z3Uld0Y0gxNEZ2?=
 =?utf-8?B?SWQ2V3Y5UlRWa2paSzZNa3RqdXhDOHYvY2EzeitGVWJDamx3S2pWNXVHWjlW?=
 =?utf-8?B?Z3V4aUpKREZ0K2VLaVdSVWgzbWlaT3dqR2NzVllpMC9CUW9keVNtZytUYmIv?=
 =?utf-8?B?bDh4bk5TbGlqdVVIMHlqWWZXQlljbkRwY1BJRmwyVTUreWZDZmh3QXRTRnpn?=
 =?utf-8?B?SzFGSUFKek4yemZNd1NZV2thZmhtVG9JS1Y3K3ArUGxqRzd4ZDBBTHNHUnlk?=
 =?utf-8?B?MHRBcWgwc1Jqa3I3V3hqdHNoOXZDaSt5OHdYalZrck1MSHpudW5NQ1YwWlVK?=
 =?utf-8?B?elRJUUtWZ2JMcVFQU21WSUFPYnI5YTk4bHhEU21vUGhWSWlDd0hncllsbnZ0?=
 =?utf-8?B?MXZJUFBqN1I2ZTF6eTdPNjBrb2IxcTEwWlgyam5HbXV4WXArQTN1dnpONnlh?=
 =?utf-8?B?YjFQTVphamFXNW5OTzVNanVFaWZkeUY1U1kyVDRQQ2ZSWUNGSkZsNXFrdllo?=
 =?utf-8?B?RjB5Tjc2c25nZVBuQUZxQ2Job2lHdUVvbW42TUZJNjBwQ2l6K3lnditnek15?=
 =?utf-8?B?Y25XSEJ1SDF6cndpR0F1eXJoc1A0OTJqbjZpZFVrSkVnSUNxL3JQakQydmJv?=
 =?utf-8?B?THNaMEdDNGlpR2N2blVjWVFudmk0TUhpVkZHbDI2My9lWFZhZzZyNGtoQlJl?=
 =?utf-8?B?T1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0038a94f-b585-4f1f-2955-08dd1fbb1d35
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 23:24:26.7083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0e9JHjsQQoa97OUVux4KWv105V9X1sfr0QawPQZlceEDR385aI9fglQak/RSbaV7bPjZgJd4iNvms+dQKkyJ0DlmGjd5rlvm1tz0dA6vYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6708
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

On Tue, Dec 17, 2024 at 12:07:49PM -0800, Dixit, Ashutosh wrote:
> On Tue, 17 Dec 2024 01:46:56 -0800, Harish Chegondi wrote:
> >
> 
Hi Ashutosh,

> Hi Harish,
> 
> Only reviewing the uapi, not the implementation.
> 
> > User space can get the EU stall data record size, EU stall capabilities,
> > EU stall sampling rates, and per XeCore buffer size with query IOCTL
> > DRM_IOCTL_XE_DEVICE_QUERY with .query set to DRM_XE_DEVICE_QUERY_EU_STALL.
> > A struct drm_xe_query_eu_stall will be returned to the user space along
> > with an array of supported sampling rates sorted in the fastest sampling
> > rate first order. sampling_rates in struct drm_xe_query_eu_stall will
> > point to the array of sampling rates.
> >
> > Any capabilities in EU stall sampling as of this patch are considered
> > as base capabilities. Any new capabilities added later will need
> > a new capabilities flag.
> 
> s/a new capabilities flag/new capability bits/. Or, better to say something
> like "New capability bits will be added for any new functionality added
> later".
> 
> See OA capability bits in the latest drm-tip.
Will check and change.
> 
> >
> > v6: Include EU stall sampling rates information and
> >     per XeCore buffer size in the query information.
> 
> /snip/
> 
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 4ee3b04a1bb5..40c2d274473e 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -700,6 +700,7 @@ struct drm_xe_device_query {
> >  #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
> >  #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
> >  #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
> > +#define DRM_XE_DEVICE_QUERY_EU_STALL		9
> >	/** @query: The type of data to query */
> >	__u32 query;
> >
> > @@ -1770,6 +1771,40 @@ enum drm_xe_eu_stall_property_id {
> >	DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT,
> >  };
> >
> > +/**
> > + * struct drm_xe_query_eu_stall - Information about EU stall sampling.
> > + *
> > + * If a query is made with a struct @drm_xe_device_query where .query
> > + * is equal to @DRM_XE_DEVICE_QUERY_EU_STALL, then the reply uses
> > + * struct @drm_xe_query_eu_stall in .data.
> > + */
> > +struct drm_xe_query_eu_stall {
> > +	/** @extensions: Pointer to the first extension struct, if any */
> > +	__u64 extensions;
> > +
> > +	/** @capabilities: EU stall capabilities bit-mask */
> > +	__u64 capabilities;
> > +#define DRM_XE_EU_STALL_CAPS_BASE		(1 << 0)
> > +
> > +	/** @record_size: size of each EU stall data record */
> > +	__u64 record_size;
> > +
> > +	/** @per_xecore_buf_size: Per XeCore buffer size */
> > +	__u64 per_xecore_buf_size;
> 
> This new member has appeared. What is its purpose and how will userspace
> use it? Basically how is it relevant?
This is the per XeCore buffer size which will be used to create the per
GT EU stall data buffer. In the earlier patch, user space configured the
per Xecore size with one of the valid values - 128K, 256K or 512K. But
it was removed from the uAPI and instead the driver uses the biggest
size - 512K and creates the EU stall data buffer with size:
512K x number of XeCores. User space requested the per XeCore buffer
sized be exposed through the query IOCTL. In the future, I need to add
support for this buffer size to be able to change it via the debugfs
> 
> > +
> > +	/** @num_sampling_rates: Number of sampling rates supported */
> > +	__u64 num_sampling_rates;
> > +
> > +	/**
> > +	 * @sampling_rates: Pointer to an array of sampling rates
> > +	 * sorted in the fastest sampling rate first order.
> 
> sorted from fastest to slowest.
> 
> > +	 */
> > +	__u64 *sampling_rates;
> 
> This should be written as a flexible array as follows:
I used a pointer instead of a flexible array as I didn't want any field
after reserved fields. But since flexible array fields don't have any
storage space allocated unlike pointer, I will go ahead and change it to
a flexible array and move it to the end of the struct in the next patch
series.
> 
> 	__u64 sampling_rates[];
> 
> So sampling rate array is just present at the end of the struct, there
> should be no separate pointer here in the struct.
> 
> 	https://en.wikipedia.org/wiki/Flexible_array_member
> 
> Also we need to document what units the sampling rates are in. So something
> like "Sampling rates are specified in number of cycles of the reference
> clock".
> 
> So we have decided not to use nanoseconds (so sampling period rather than
> sampling rate)? Any particular reason for that? Though I am ok either way.

I decided to use GPU cycles instead of nanoseconds as using GPU cycles
will be more future proof to the uAPI. I also received feedback that
there are other interfaces in the driver that use GPU cycles instead of
nanoseconds, and therefore to be consistent, using GPU cycles may
better.
> 
> > +
> > +	/** @reserved: Reserved */
> > +	__u64 reserved[5];
> 
> Because flexible arrays must be the last field in a structure, this
> reserved field should be moved before num_sampling_rates field.
Will move to the end of the structure in the next patch series.
> 
> > +};
> > +
> >  #if defined(__cplusplus)
> >  }
> >  #endif
> > --
> > 2.47.0
> >
> 
> Ashutosh
Thanks for the review.
Harish.

