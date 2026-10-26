Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AED606A31B
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 14:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xah1T8mW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E3510E07E;
	Mon, 26 Oct 2026 14:09:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39BA10E07E
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 14:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793023759; x=1824559759;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ugm6AFgSXJseBtEfeLbpFq+vn3EiAY2Cl+fWY/1QTjk=;
 b=Xah1T8mWBfpKrZmZ8Kr6yXHKNYiB+who+MiT6RulbCg1xgdyLtZMJShS
 gMBCTQ8hO78/OAtUF02SUMt2RVVpGhDAiFFT14BMBizPYuB1GX7n4MdpM
 NFJPjCF94APLXVi62AsrigMV2dKp5captWdVE2mhzS+P7MvbXQX6GxL0K
 BElr+SaNYKlA/gJfjja6am2rcmWpMTyrKe4UxseI9toipPx1Pjtp5I0o4
 H9Bp2zydhXACJD/w7vMdezX1GBk6XC4ufsZ/RQxYIUeN2m7jqNTKgoop+
 MjOD1V+jzjy5vuQz3kvBzGCOyKDRfGRT2leUFLq6/sI/hSeGJDbz20NSH A==;
X-CSE-ConnectionGUID: uL9i1mBuQGCVE7lwmRhwig==
X-CSE-MsgGUID: +Mr6jSiOTB2OHJiqLx84xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1719481"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1719481"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 07:07:47 -0700
X-CSE-ConnectionGUID: W19+wSQGQaqOg4xxPU0HdQ==
X-CSE-MsgGUID: cPD+/M0CTsix/jjNReIwPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4672797"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 07:07:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 07:07:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 07:07:45 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 07:07:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TbMwc9GhR1903lD9ON3+q89WeIbbyrR+mTYxO07KDO55ZzecU6r09iciEKMegHPBRedUqxk7ycRaNvgtViXcoOoXSZQQIcamM09KARU4P5kcSGdux1OMfzHGhjqPcMwf6vnHY72poj29z9M0n8qg1OxNCU11Zvctb+lWnsWiFiKXM4NQyd5l1AhZMNX0ZKJsvuDxQorwRTiGwz13S8LlX790uD3JR5Mg7lqyzFR6wfKr+92kl8huy6ZTUE/xIP9aQIWcN+U1n64L7urfLoXvFaKhwLPtInGDFD7cM2mW+ryJcVEgvzmywvpRnxsXhD5+Hyh/surLMP/RBch38HHgfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXi9e8V6F+Pvj6zxYI4UM7Wqw5ABP/aQ1B/pSkUEKSE=;
 b=ln/gYGVoRMS9/ufXQocDAc8EzVcHY2X7t9awawPDcunnvAeuhXtWx22HQJGfVZrgXHodF6MUhDeWapHiuwpfbuU6kDDNhztg2cftuXVPvkFPsdJeexdOmA+HOLQfHI4Hxj20Gp+QSn+XmhSL7X4Gng7ieca13KY8f628rIyatSmAE+4J9kPp6VqjuCXQnG/l8uJw0GbEX9WeqpjnK9J6rj8Y9bsaE5qnJGtE5d0TN7SXPF9i13WnyuILwB8YiAXzEnYstyMxMWHtSC7Dt9vt18Sg8/fgpeb/5d2yICTYxYKAgcfg4AztX4z4vGgWLupq+J3sUlSKkXlo9fYM4gpp1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by BL3PR11MB6436.namprd11.prod.outlook.com (2603:10b6:208:3bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 14:07:42 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 14:07:42 +0000
Date: Mon, 26 Oct 2026 19:37:33 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>, Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Reset GuC before unmapping its post-hwconfig
 buffers
Message-ID: <at9epeRtNe-eKEdY@bvivekan-mobl1>
References: <20261019100448.759503-1-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20261019100448.759503-1-sujaritha.sundaresan@intel.com>
X-ClientProxiedBy: MA5PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::16) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|BL3PR11MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: ae7137cd-2ef2-4f76-d47c-08df336a804b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|11063799006|5023799004|56012099006|261022105027099003|261009223027099003|261021121427099003|261021123027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: g5sBnlPzpuGiBpgbShavw18RuzM7O2TdhnuYRKBTJRkY03D6CaoRU9DcJQYuRTe3ENn7EfXlHvMO0PIRR1oSQcRZX6qaozfDeaVxBZ/Q6jPyazsXNaqmWKHk/Sjuif7h0a46RDE4Z1C6DHpV9a6eNMHHmHg7Q53rcTjMusxdn96qQeDRsidC3xULGjePBEMAgm1B5ryHb8NV8bg5GdfYK1M1xW7w5FXP/IJ+yIxY2st5uhcoXrqki7oNrasFdtpXOCXuWQlzABsU1JVufgocTg+QBUmfdfh7QxrnKriTxzk3UmvlN7cVLuicbiiU09ywIrwQQrHjPUxqxT9du3lpEpkcG050eB8TPJnjslD8Z1m79xBb+bYh/3LD8KufGhV/Jq5JcUYwU0H1xdALbSEdDeDk2FFbIYTO38JMH5d52tVHmknlNHl1BnB3BzXWu5acv0QXLXoUfXrzWKQPpIlZZxScaToVyF3mws2rKZhqqoubyV+AhYw7dsttV3T83a4F7wPw9g7XVYG6wKDjkLm4yzmsrTvExTwFSML1qifRjsIWNBcrUE0GBtepm2AFTJW7Fy5ZWA6chTgSUh8iLImMu0UMLePUPZaXrXeuwYxuFdkba9OcFa0T7o6tKd7YowUru+EnGaC3Xaw2KOzeTqvHBahnrTb01OXT9ZodGAmMiww=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(5023799004)(56012099006)(261022105027099003)(261009223027099003)(261021121427099003)(261021123027099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3drNmdnVVZFeGM3WG9IWHJKMlh5aGFlUmFwUEdxWTRFdG80ZVRjcDNlWDho?=
 =?utf-8?B?V1QydjJPZXJWd1lyRFNWYWF3Y1pPVU11RTR5dGdoanVwQ2xySDByeHl5RVlH?=
 =?utf-8?B?dWg0bjBRVmY5dnR3REpVaG9tSGVDanc2d1dhU05RbXFybXVlbTRBQXRBWFZq?=
 =?utf-8?B?NVdzUWYvTjVOTlpZZTNuYmVrREdOQXc5d1V6Zi9DUjI1bDVtRDB1QUZkQk05?=
 =?utf-8?B?MTlNSnUvd0phZ1pCZGhaYlJTUVFGeExCRmFDazdleDNidStlNUwyWkw4dG9Y?=
 =?utf-8?B?d2JpS0xIMFlnZS8zNXRnWUFxQ0swelBOYW8zRlZTUGEwQUdOd2J5L2hIZTlK?=
 =?utf-8?B?TEFFL2lJbUd5b3JSK3luOTVTSUlJakdRbFRBaU9XR0dMdStHNlh3M1pzWGhX?=
 =?utf-8?B?SWNmMGV0U0hjckg2ZEtTeWFqcUgwNDNwN2cvQWw3ZlU5NUN5b3NPT0taQ1hx?=
 =?utf-8?B?U2hQejFIcXdMY3ZwTTltZ1JvMFBya0tFUWxUV1RSdXVJSGl1UmhSUGhkeGlh?=
 =?utf-8?B?MHpzeTVRbzY1eFhPNFdRVG1uOEJBVjloYy9Fc0R0RU9iejlLZGJaSTNMWENK?=
 =?utf-8?B?ajBzSzNFcElxVnJacUFWVGE4TzlKL3NhSUdLYzBzK0I3U21aM0krQ0pyKzM1?=
 =?utf-8?B?UEVaUzdaM3A0WTBEbGdhbEpYcG9yZ2FmT3hJa1FlUHV3ejhIVzExL3lyUkc1?=
 =?utf-8?B?K05HR3BnUENtZzZmWjdTWkVFbTBKVHlnS2RLK0pRUDZ6Z2d2T2lCWG5LL1Np?=
 =?utf-8?B?ZHJFVE9KKzFSN0tHSEkySSttQ25FOXBsUEt1ZytaNk1DYUFEUy9YTlhYSXRi?=
 =?utf-8?B?MThzcWV0dXpzZExreTBic1N3NUsrWVFqTEh6MGRiblJZTnl4d0hraWlGYWow?=
 =?utf-8?B?c3dWUUFzT0N6aGw2UjBlekdxRWtWeUVTNUVKM1BLSldlNWcvQ3hacys5amE1?=
 =?utf-8?B?UkJuYkU0ejRCY0xmWTFVb29mOHJ5QklOQkk1NFQ1Z0JuSU9McTR1VnZFQ2d1?=
 =?utf-8?B?R0J4MFZ4bWVVQzlicDdjcU4wQUVwV1FwMkVrbVNoUWtkaGV1RTh5ajR5Z0la?=
 =?utf-8?B?ajFVcW1ER1RSN3N1OENoOUQ0UDQwYnBBOEJBS1hyTjVjRXZpS1ZKeWRvSlhh?=
 =?utf-8?B?c3JQcUZ0dm1EYnV5MDY1RkxlQkpWU1RPR2Y1Nk5mQVI3M05RNlVGWFBZRGo5?=
 =?utf-8?B?bTdjV0pZelVSa1NBWWJ0UTBUNldNN1FIQnA0Y0g4aVhuK1N2aStkR3paMWk0?=
 =?utf-8?B?ZC9mUm9YRXhKdTAyMXhDZEpjdUFzVFNCdHFYYVhReXZFQlF0VFZlQXRUcEFC?=
 =?utf-8?B?K0hsb3NXQzBZSGV1eXRmc3lVS0R0WXdmcVVzRHZQa0JtWjErclp2enJ5ZWVH?=
 =?utf-8?B?ajdBdjVyTXh5TnFPMnpldkpidGQrUk1rRXp4YXZCaTgzWjlHZnZHbHRKVjBQ?=
 =?utf-8?B?UHlrWm5iWXVGRVUxRnJObmo2UXFxK0FNOEE1MlpwT3luMVdweW1DVHZBWnFP?=
 =?utf-8?B?Nmc3dmNXY0tzY0I4aFRBM0hiVVRsZklWSllEMjBtUHVjTzRaTU9SRk84a0s5?=
 =?utf-8?B?VEg3WC9rMjdDa3VaOFdNZGRyaG9KNEJkbWpDQkgzSm9Eem9IMkU5dWpaRlVw?=
 =?utf-8?B?YlprcG9RdkpVVnJ6NUsxeHlGTS8zQWUwMEVOUHV5QzlqWTlqZWlBNmFpWkFt?=
 =?utf-8?B?QzRTb1NEaDZqTFdGSlowODIrT1dhdFI3UnQweUQxMUxnTHhRaGUrL0hPcG5v?=
 =?utf-8?B?OXlYYjZla3czV1RHWVdNcXVoSmFmZkZvZmVTVWk3WFdvaURsdTNqU1ZaQXlC?=
 =?utf-8?B?QWhSUkYwR2xDUGcrQUFSTGdoZU1ZQzlsM3JZcjZ1a0Zib09NanMzSWp2TnFP?=
 =?utf-8?B?K2FWeXZlSVpKRVFibDVPKzFoaXE5VWdwWlN3TFd1c3c0N2cxQnBBQ1YzQVl6?=
 =?utf-8?B?VE96YkJFY1RNV2lvVzBmVkJQSjNUWllzdnNqR3RIaGg5UnVXakpwdHk0RFd4?=
 =?utf-8?B?Sk80N0Jnd3h4empuZmxTbHNETmdrMm1RLzZQYzVpZW9SU0REN253ZStBcDM2?=
 =?utf-8?B?bDhTU1N0M09TQVQrNTBtK1p1dVJWNE1yN2x6aDFtWHJqQ0M0UTVmWm5XRzB2?=
 =?utf-8?B?dldqVjdmVldua1lqa2hpTXp3YUNqQXJ3VVhtdFF0NFJBRTN1OEhDV2I4alVi?=
 =?utf-8?B?Q2hiUGY5Zkg4ZDB4YitNbDk5UWoyQjh2eWpqN25jajBJWXdBQ0ZyWmREdHF4?=
 =?utf-8?B?Y0VzcU5OdjBmdkg2WkJydWk3NGd2K2tLL3FsWmhtQjRaYjUxZG9jR2Z0aTF1?=
 =?utf-8?B?MGFWQ3NRL0dUZVhUd1d0YjVsS21IWGMxbENrZ1Q4bnJjQWJDU3Bab25oV2hw?=
 =?utf-8?Q?obqn8hhe2EEY68R8dD/xB4gEVzW8K3f9DcQlS?=
X-Exchange-RoutingPolicyChecked: eYTh/PLKDACUi1pGpy0w0JMsGFnm7/K2jhRMaGWApno0xS4vy0geea5aH/6iDnugNRkIzN55IdzgXUPBYefDvZOOgv0O6akhhwamg+aySqRq5utCzFQJ4H71QN3jealFthrTfxPxjjvd304hoWobIWosuKa2elHVxgd3tTAb8SQsbUjAW1q+uu9rrJ/ng6Exsjk7VuFz5Qy1cw9peIxdUsHpYhXrDHun4v2QueehuUlOSL64t0QXfBQ5cH5TGj3m3Oha9YJrVXC9r3qbm0d4cMi5W8Hetum6GJQjAVERtWQIwDEVPyXOKbxp38YEegVIq42o8wUt+z36iZfR8hyPag==
X-MS-Exchange-CrossTenant-Network-Message-Id: ae7137cd-2ef2-4f76-d47c-08df336a804b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 14:07:42.3280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cErj3FNYaFQHs+ePldvLWjRDv5jAJvLcwjiiOLoE5dQnq9xrbwFS5sH7pyvS467PAUGaXJNxpjGzYe7zoITJwZ589AvBBzwZSMML0HvvOYjmJOuCXrRauRK64ZlvLthw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6436
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19.10.2026 15:34, Sujaritha Sundaresan wrote:
> guc_fini_hw() resets the GuC on teardown, but it is registered before
> xe_guc_init_post_hwconfig() (re)allocates most of the GuC buffers. As
> devm actions run in reverse order, these buffers get unmapped from the
> GGTT while the GuC is still running and may still access them. When
> unmapped GGTT entries are left invalid, this results in a GuC page
> fault on unbind or probe failure.
> 
> Re-register guc_fini_hw() after all the GuC buffer allocations, so the
> GuC is reset before any of them is unmapped. Keep GuC submit and RC
> teardown running before the reset, as they still need to stop or talk
> to the GuC.
> 
> Assisted-by: LLM
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 6c35474ab843..14ae73844d76 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -882,9 +882,10 @@ static u32 guc_additional_cache_size(struct xe_device *xe)
>   */
>  int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>  {
> +	struct xe_device *xe = guc_to_xe(guc);
>  	int ret;
>  
> -	if (IS_SRIOV_VF(guc_to_xe(guc)))
> +	if (IS_SRIOV_VF(xe))
>  		return vf_guc_init_post_hwconfig(guc);
>  
>  	ret = xe_guc_realloc_post_hwconfig(guc);
> @@ -897,28 +898,41 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>  
>  	guc_init_params_post_hwconfig(guc);
>  
> -	ret = xe_guc_submit_init(guc);

The teardown function guc_submit_fini, registered by xe_guc_submit_init,
is invoked before releasing the buffers shared with GuC.

guc_submit_fini stops guc submission and also does a soft reset using
XE_GUC_ACTION_CLIENT_SOFT_RESET.
The GuC specification says, on XE_GUC_ACTION_CLIENT_SOFT_RESET, the GuC
revokes the log and CTB buffers.

So I believe, after that GuC shouldn't be accessing any buffers shared
by XeKMD. It must be safe to release the buffers after sending
XE_GUC_ACTION_CLIENT_SOFT_RESET.

Did we understand why are seeing this issue now but not earlier?
Is it a regresssion from a patch, either in KMD or GuC?

Regards,
Bala

> +	ret = xe_guc_pc_init(&guc->pc);
>  	if (ret)
>  		return ret;
>  
> -	ret = xe_guc_db_mgr_init(&guc->dbm, ~0);
> +	ret = xe_guc_engine_activity_init(guc);
>  	if (ret)
>  		return ret;
>  
> -	ret = xe_guc_pc_init(&guc->pc);
> +	ret = xe_guc_buf_cache_init_with_size(&guc->buf,
> +					      guc_additional_cache_size(xe));
>  	if (ret)
>  		return ret;
>  
> -	ret = xe_guc_rc_init(guc);
> +	/*
> +	 * The GuC keeps accessing its GGTT-mapped buffers until it is reset,
> +	 * so move guc_fini_hw() after all GuC allocations above to have the
> +	 * reset done before any of them is unpinned and its GGTT PTEs cleared.
> +	 * Teardown actions that must run before the reset, either because they
> +	 * still talk to the GuC (like GuC RC) or because they stop the CT and
> +	 * submission (like GuC submit), must be registered after this point.
> +	 */
> +	devm_remove_action(xe->drm.dev, guc_fini_hw, guc);
> +	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
>  	if (ret)
>  		return ret;
>  
> -	ret = xe_guc_engine_activity_init(guc);
> +	ret = xe_guc_submit_init(guc);
>  	if (ret)
>  		return ret;
>  
> -	ret = xe_guc_buf_cache_init_with_size(&guc->buf,
> -					      guc_additional_cache_size(guc_to_xe(guc)));
> +	ret = xe_guc_db_mgr_init(&guc->dbm, ~0);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_guc_rc_init(guc);
>  	if (ret)
>  		return ret;
>  
> 
> base-commit: 5bc00022b24f8a7bc6630609e9fd93dd977a87d3
> -- 
> 2.34.1
> 
