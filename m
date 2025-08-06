Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F473C87FD3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 23:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1756B10E062;
	Wed,  6 Aug 2025 23:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L5C0kUVK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890E110E062
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 23:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754522191; x=1786058191;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tu99RcrMN283CpZa88tVHdgHvdJ6KUoY1RHO9pR6XL0=;
 b=L5C0kUVKCLRH/9/ASkJJuDBaFWUwjtRMSyFTzPyTSJuAi5Yaf0EGgGLZ
 g6pP3M/3WdZtl+F3g76gbOduCPnWTviCjyHOSr9wW5nuQE1VxNSjkG+er
 zMWWCbG8ntuprRjOhnAaRYq1oVIs7DpA7FuMAOpWlny9nJ8ZAWJsRnog8
 NTX9xo0qdWrcfFam8RyTlRjVwkt+Ph5sYXlnIf5yK3zmw8aP0kJPNGm7y
 chavkdnqWpCErZlSX3p4YJZdEkozP6DJQPLTMKGFEljI+2j4brHVt3vfP
 33F++IlRhKDngUPb3+YTv64W0R+3lguRtMvy+WgnVJ0Ekw6GObeVKmFjm w==;
X-CSE-ConnectionGUID: X98R0jf7ROeCrLHI5yOTEg==
X-CSE-MsgGUID: qEwKxSwTTaGb5++IpSuFfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67441776"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="67441776"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 16:16:30 -0700
X-CSE-ConnectionGUID: +7tjrFOWSEK1MHyyQGp01Q==
X-CSE-MsgGUID: eBb3uKSwQ8ifPVAN6UXMPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="165305507"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 16:16:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 16:16:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 16:16:29 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.89) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 6 Aug 2025 16:16:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+8MPuyLMkv4CWSWVVkzegFiOTMidUmaRndAmwV90VgHTVlMiSipMatLPvALJ8afFXRgN/qZUgV2u7zJUv3dQu5+fnjdadAGLyt8L1httrHdByT356AfKNjRU9i8yxAjo26hAuHriWUZr+j+5E0SPwhiFtQotF9i2FM98+23j6ZneK81grSIlm1buWoHX0SXEXzQERMWIY+2g+h2cNnwUoAr9OeLFKthAPn7PCDcO8kQVB1dnQsll9Rq3pZe9NnHgSim0MY/l/7esqo+O6o3CnLFnwxCzqaytiXY/cz92AJ0jkskmBC2O9M5WlKuQULCkR2ohe5rUHvUsBS2YjbrMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tu99RcrMN283CpZa88tVHdgHvdJ6KUoY1RHO9pR6XL0=;
 b=TKogQjLEMsDqhV6C4SkAxF7T8Kof8Xn067Gp1hgQq8d/04mMkvRDyrYMesKVVOb1l45d+E2+SX44o1IH47dH/C33s3VjCVPZ5ivLjwbvcKqZ+ITuYop1otLcoYSwDuCMbbeFnHkw37YWrGE0Y0fqR8ZAqNSMytgBxH9vVhLioTGSoBOnswHCZswE7W9eBipDpnflvYYIbMmVm0i11D+tbz+VbFc1Kgg09EIj8yOuTZVODasgwHnPwfzZu/zb6vnnE5uto/s3QLmPAvrhzu+C0M5OBM8J9X2UO7R3qY5Gu/nGB2DLmvT6N/zjlfjb0oJ2H3yMbYyaJdIe/4Ez7LPPdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 BY1PR11MB8078.namprd11.prod.outlook.com (2603:10b6:a03:52a::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.13; Wed, 6 Aug 2025 23:16:26 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 23:16:26 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Mrozek, Michal" <michal.mrozek@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH 03/11] drm/xe: Implement xe_pagefault_reset
Thread-Topic: [PATCH 03/11] drm/xe: Implement xe_pagefault_reset
Thread-Index: AQHcBpqXPZ5n8oG+e02fc1Svz38ylrRWQwsA
Date: Wed, 6 Aug 2025 23:16:26 +0000
Message-ID: <ab3197ac98e3a60065f846fb0bf996092f861e64.camel@intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-4-matthew.brost@intel.com>
In-Reply-To: <20250806062242.1090416-4-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|BY1PR11MB8078:EE_
x-ms-office365-filtering-correlation-id: 9ac8b779-86e2-441c-df64-08ddd53f4488
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WEJiM1ZUOGliVkhuWER0Tjg2MmlZOUdYVXZLV25ZaC9lN0xMSldVRE1nRFpi?=
 =?utf-8?B?TEZodE9ncXYzZHFLREJHL1NobGMyTDkvZ2ZqQ2YrRjg4OW13YUhQTnROWHkv?=
 =?utf-8?B?TjVDN1Q0VzFxSEFCNlROb0Z2RTZob0k3bXE1NjNZQkZYZEh6QVp2bGZlblM3?=
 =?utf-8?B?aDZnVy9ZVDA2bnk3RFV2T2N2NmtDTzlYMkkxM1FPeFdkWUkwRkl6QXRIS1BT?=
 =?utf-8?B?SUxsWkxkdkl5RENJNzk4aVQzQmsrYkMxZWZqc3lKRW1OQW0ydFBqempweDFQ?=
 =?utf-8?B?aGw5UDhDT1R5Mm5JNTBrZHpTejRLa3hxR014bzFMSVdOa0xrZWNadjFudS9o?=
 =?utf-8?B?cERabXlrYktoTE1seGlvNFpnV2xsS2RaL2RLUzEvbUJzVzBzS2pxc3RCZHFR?=
 =?utf-8?B?OXRQTXgrOFBHZWpBYlFvOGpKYVE0U3VuR0lLMk9pL0ZHb1FiUEJjOEs0WUkr?=
 =?utf-8?B?Q0RITHdRSlVsOXBOckJSVFdvNTlYei9rUUJWbVBtbXhKRS9JVERhZDMxa1FX?=
 =?utf-8?B?KzJ3aVVKTkdvcE03Mkg4b0hnSnllSVMrWlQ0QytnOEhpTS9nRTlaUS8xcDB1?=
 =?utf-8?B?WXlkbTNtN2V5TEdVRUp6cjlTSkxrT1duaFhDZVU5WEVsK2NoaTlQZGV2Qmt5?=
 =?utf-8?B?UHBzU3dUUmFHWVZnUzNkNWFya2JvdkJncTE1T3o0a29OVnpSSHZpTXIwZUxR?=
 =?utf-8?B?aWF0NXU3ZW96RTNFSG1DcW1YOEI0UThEQVFvMEVxbWhCcEE2TDUvS3lnZC9E?=
 =?utf-8?B?K0RnWlI1MTFObmtBdURhT1hWOG5uVnYzYTlPenFOME0vODlFV3l4ZkJpQzBF?=
 =?utf-8?B?Uk9xOEFhZkVsZUMrdUxOT3A0RE1LS1VUWW1DczZiYWVrRzFGQTRTQVUvMnVG?=
 =?utf-8?B?RGRrWDYvMTZRYmlST1dUdUhpWkJBSjRXdlU2L0RSaVRPR01idHRWdTRhZS9U?=
 =?utf-8?B?OXlYL1RPdmpaanJUNjJjbVVLdXhFNXBmeDlEMzJza1JwN29waXMzYlNxRnZ2?=
 =?utf-8?B?eG1RNEVkMXRzZTVHTWh6SXBwYjNoYmFiOXF0MDdncmZBeEJ4NWNYcTVKQUo3?=
 =?utf-8?B?cEs3N045UHBPQzI2TFM3TTg4Y3R4RmZ6UG9hc0hnODdHWG9rdjJad05VVDFT?=
 =?utf-8?B?QTZKZ1J0c1pzclBDd2I5a0F4ci9YTk9UODB4RU5EeHZnVU5pZHhxQ0JoRnBa?=
 =?utf-8?B?SktQMTNNV3NXU3V5dTVXcVhPNjRXTU1wTmRrTTNMTC9qdU14SkhBaHRHbkx2?=
 =?utf-8?B?YzllREdJN3RWY0dBSXEzaXVKVERUVCtUMEJKR2xta01qWE1xMGVxUFVLZkZG?=
 =?utf-8?B?Z2xMemxjQkhNQWttUHlnYkxwanI5MUQwRVgyV1pma2dCalZ0R3gyRFlHUzEx?=
 =?utf-8?B?UW9uRmQrZHFab214bFU1bUp2emI3SFgwdGprTXIvTVJLVk5sUEpIcU1OSUR2?=
 =?utf-8?B?TXlOQjgzV2ZGaXNWVitCWmt3MGRLbW0yb3Brek1RN0JjcStYQ3YzRkdVTDNC?=
 =?utf-8?B?Q0VtSkl5L3RMVmlTdTNZQUpUY3NmRytjOHRBaHFpU3gzeEl5eUdmN0h1SE0v?=
 =?utf-8?B?cmVvOStBbmlUWHBmeG5pUGR1bUFacno3UU5Mb3BnY1krbmVlNGlPNjFNQVhX?=
 =?utf-8?B?SVA1UkNtdG8wY1lXbmx3WFp6ejRxeGtRdDZ6V0x2cmlyRnJWenpnREdzK1hN?=
 =?utf-8?B?NnhQeHRYb0JuL0FBV2tiRXVXL1g4ZG8zY2syKy9rL0pBUnVwUTNzb2d4WFNh?=
 =?utf-8?B?Lyt1T1VCaEJ3dFpYWkJvRzNsTjhhNk50OGFub0xjM1JUdVVuUWpnZHJBSE9y?=
 =?utf-8?B?RitPNy80OHEvc2doei9EOHVYVlc2Sk1WOWEydzNlZTlaRExNOWtNZTNPOUNM?=
 =?utf-8?B?dldpd2hvVSt4RUtYYXFJZ1c3c3ZRT0NrYVBNMHZvaUlzb0M5NUZDOUlXOE9i?=
 =?utf-8?B?QitKMHdKL01RVVIxNnMxZUphZzNNU2p1OEVQRVUvazg4cnBQNi96RkdTNVFi?=
 =?utf-8?Q?EuCGfOWhBoHtR1jQ55ZeoNWFwdAeZg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RklSbStWWm9jQ1ZwdHlvZlhWY1Vjd0ZqaW1XMEFsdk0yRTFpd2RKKzNqdklU?=
 =?utf-8?B?QlhQQVo2bzU0REZQeFJEaU1EZS9YTVhXRG1lM0ZJUnMzalArSEZaNmM4OWU3?=
 =?utf-8?B?MUV4WndDY1F4aThWTnFaQ2M2V1Y2V3ZjWUxYYjBzWngwOEhyaUpaTmI0cmIw?=
 =?utf-8?B?N1YwQ1VYS0g0Yi9VSXphZG9mQU43WG5vQXJncHhRTUdNeXlTSGlMbi84bnZz?=
 =?utf-8?B?UXlBV1loT2VRbHlmM0pNSExYc2ZBWldGeTNsWGNzODllSmg3TEF1OEx1RFlQ?=
 =?utf-8?B?QzRuZTZaNzRmcUt2RUxwMVRZbGpGUE9QS0t5UDZPQjNFbFFKampBY2x4NVdM?=
 =?utf-8?B?eTNhZDVwVXlwS21HaStnOHJQL21zKzZmdWpHK3l5OHhNYkJ4RENHNkNCVmov?=
 =?utf-8?B?OVFTYnpGNjI3TXVVd0NyV2I1VUw0eEo1MTI5a3dYeUJMK2ptemRuSzIzcXhC?=
 =?utf-8?B?YTZIWFNXeEx3eG1aMmVQaHplOHA2VkVGclhieE9wL29zbm4wNzlHRW8yVElD?=
 =?utf-8?B?TldOUkg5WXVhNVh3RHBBNWpVbkpTRHVrcEtsQitiMElOWGpxTUcvTDBxeGtn?=
 =?utf-8?B?UGRmVFNVQnpyY20wdVhuVThvWmxyaXd1RWRqUXcrTStTTFoyaVpmei81UlJW?=
 =?utf-8?B?QmFpSWhHS0FMWnN4WTdIblZQVG83Uk9WS1Nqem53RXpPRGJ3NTJoYkUvQVRt?=
 =?utf-8?B?cmhQcERkVllLT3V1SkZTWitvQWZKcUxnNnRuQW5FMjZQcXNUL0VWZTkvdU9H?=
 =?utf-8?B?d2NpWVM0dzdNdENqUkRqYUNjRVVRb1ZXazFNTHlRY2g2NjMzclVQUEgwY3dw?=
 =?utf-8?B?d0U4cmtrSE5NOTRwWktjVzROWnNLbk5WYTk1T2RyVHFwL2I2YVVLNUZPaENT?=
 =?utf-8?B?VDVyT0RBRXFTVXNKcjBzTHhFVnRaYWFkN2hiVGFJVHNWb1FYSWFHMmdwTkI1?=
 =?utf-8?B?bks5SElNM1phZTZJMnJRbHJRT29BVHZpV2xpZzVpT3F6dHJmR2JUNkRMY0Qr?=
 =?utf-8?B?aDN5TjFMVTVMNWlvM3BwY2hpSXVmNHN5L1BVaXoydGp6alJlSjUreWZmeGti?=
 =?utf-8?B?aUVPdDNFR21HWXdJalNXc1hmbUZkY3krbk1ac3Y1U1B3MnVGcnd3bncwUjdR?=
 =?utf-8?B?QWVwNzlwMUlEVHpCS1lDcGVQdE5QSlA2QUdxbGJLWDdSRDdSVXFZTy9La0dt?=
 =?utf-8?B?czhRK2FyU3ZhMTlNLzBOdmlwaERzQUd5UFBRYXdhaytmWHIvL3lqeElpVk5t?=
 =?utf-8?B?OVIxOHZvVU5xcTJDa3F5a0dFZ0NIMCtPN0RSRkhyV1BGbmRSQ1hpRU94OVFo?=
 =?utf-8?B?K0t6UE9rSlM0cjFUOHptQmtGR3d4eGh0NjlmaFQ4SkVFTFpzWHZTSGdKNVo2?=
 =?utf-8?B?dHl6V2pDL1R5WDU3dmxzeGI4cDBtd2ptT3VYN2tiY29jNVpRTUdzNXRxOE1C?=
 =?utf-8?B?emdZR0RYMUJrSFJtcFE2K21UNnRGSU9jNGRsZ0VITERJcXhEVnlGVDFKSUZl?=
 =?utf-8?B?VHNKWHJzNHo1NUFaZlpMNzFKVHVjc2RhaUpyWU1BMUF5RWcwanJ1UDlkVG1V?=
 =?utf-8?B?RzR3Q3Z5bys4d1p2RTB4cU1YQU9kdjhRY2R1Zks4UG9RRE9VSGM1NGdJS1ZN?=
 =?utf-8?B?QzBSL0lTUzdCdnZaamxRVFYzUjVCbUtGbjJDM3NUMWxXS1BTQldnSm14Unl2?=
 =?utf-8?B?aEZidFJEUTZialkyNmF2ZlpEemlhOWNheWhHcFFCVEpvTngwY3JDd0VySkRa?=
 =?utf-8?B?b0YzbmVMZlo4bU9wZStlMkI1K0Iwb1ZIeVZXK2U5S29sWlZhamxMdEtGc0JN?=
 =?utf-8?B?TnJTNXd2RzBidTVBakpibDNYYU0ycld6ZVhUVml4Uk5pSGhhQXBDZm9yUzVJ?=
 =?utf-8?B?cDNzOWZZU0RRdmwvZ2Q2dGMzdG0xNHUzRHE4MkJkMnQxZElJSWpsN1l2bER1?=
 =?utf-8?B?RmZlY2hzN2NZMU9VV2pXUUhsQXZRMFY0YUI5c25VK0txQWpuT3BKSzAvNUdM?=
 =?utf-8?B?QlBSY0UvbjZRc2ErUlFWN0dCNmJ5a2FXancwc0lNUFJ0eTRBbzFtdlR2S2Ir?=
 =?utf-8?B?d1R5K0R0VTV0YTZwTUNEcTNHRWRoenFKZnVWb0VrZFdkYU0vUFU0aElIT1JL?=
 =?utf-8?B?bzZjM1Z0QlNYbnpFTFozcXAwMVhGQkJvakpnSTFEMUtjVTJNUnA1QStyTzNK?=
 =?utf-8?B?ZUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D67B88478F672D4BB0E5ADE0CF352A5F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ac8b779-86e2-441c-df64-08ddd53f4488
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 23:16:26.5735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KHsVQp3nOlsVtWZBoRhg6oWBm9FFRrH0eL461P215LuibUp07CLnRaSQQKwnm4OYoKUUMrmI9wJsL6TE1RjYw+hlwWCrE1J4TZR35+RZyRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8078
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

T24gVHVlLCAyMDI1LTA4LTA1IGF0IDIzOjIyIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBTcXVhc2ggYW55IHBlbmRpbmcgZmF1bHRzIG9uIHRoZSBHVCBiZWluZyByZXNldCBieSBzZXR0
aW5nIHRoZSBHVA0KPiBmaWVsZA0KPiBpbiBzdHJ1Y3QgeGVfcGFnZWZhdWx0IHRvIE5VTEwuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNv
bT4NCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmPCoMKgwqDCoMKgwqDCoCB8
wqAgMiArKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wYWdlZmF1bHQuYyB8IDIzICsrKysr
KysrKysrKysrKysrKysrKystDQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d0LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYw0KPiBpbmRleCAzOTAzOTRiYmFhZGMu
LjVhYTAzZjg5YTA2MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMNCj4gQEAgLTUwLDYgKzUwLDcgQEAN
Cj4gwqAjaW5jbHVkZSAieGVfbWFwLmgiDQo+IMKgI2luY2x1ZGUgInhlX21pZ3JhdGUuaCINCj4g
wqAjaW5jbHVkZSAieGVfbW1pby5oIg0KPiArI2luY2x1ZGUgInhlX3BhZ2VmYXVsdC5oIg0KPiDC
oCNpbmNsdWRlICJ4ZV9wYXQuaCINCj4gwqAjaW5jbHVkZSAieGVfcG0uaCINCj4gwqAjaW5jbHVk
ZSAieGVfbW9jcy5oIg0KPiBAQCAtODQ2LDYgKzg0Nyw3IEBAIHN0YXRpYyBpbnQgZ3RfcmVzZXQo
c3RydWN0IHhlX2d0ICpndCkNCj4gwqANCj4gwqDCoMKgwqDCoMKgwqDCoHhlX3VjX2d1Y3JjX2Rp
c2FibGUoJmd0LT51Yyk7DQo+IMKgwqDCoMKgwqDCoMKgwqB4ZV91Y19zdG9wX3ByZXBhcmUoJmd0
LT51Yyk7DQo+ICvCoMKgwqDCoMKgwqDCoHhlX3BhZ2VmYXVsdF9yZXNldChndF90b194ZShndCks
IGd0KTsNCg0KQ2FuIHdlIGp1c3QgcGFzcyB0aGUgR1QgaW4gaGVyZSBhbmQgdGhlbiBleHRyYXBv
bGF0ZSB4ZSBmcm9tIHRoZXJlPyBJDQpyZWFsaXplIHlvdSdyZSB0aGlua2luZyBvZiBkcm9wcGlu
ZyB0aGUgR1QgcGllY2UsIGJ1dCBtYXliZSB3ZSBjYW4NCmNoYW5nZSB0aGUgcGFyYW1ldGVycyBh
cm91bmQgYXQgdGhhdCB0aW1lLiBKdXN0IGZlZWxzIHdlaXJkIHBhc3NpbmcNCnRoZXNlIGJvdGgg
aW4gYXQgdGhpcyBwb2ludC4NCg0KPiDCoMKgwqDCoMKgwqDCoMKgeGVfZ3RfcGFnZWZhdWx0X3Jl
c2V0KGd0KTsNCj4gwqANCj4gwqDCoMKgwqDCoMKgwqDCoHhlX3VjX3N0b3AoJmd0LT51Yyk7DQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGFnZWZhdWx0LmMNCj4gYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfcGFnZWZhdWx0LmMNCj4gaW5kZXggMTQzMDRjNDFlYjIzLi5hZWYz
ODllNTE2MTIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wYWdlZmF1bHQu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGFnZWZhdWx0LmMNCj4gQEAgLTEyMiw2
ICsxMjIsMjQgQEAgaW50IHhlX3BhZ2VmYXVsdF9pbml0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0K
PiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGVycjsNCj4gwqB9DQo+IMKgDQo+ICtzdGF0aWMgdm9p
ZCB4ZV9wYWdlZmF1bHRfcXVldWVfcmVzZXQoc3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdA0K
PiB4ZV9ndCAqZ3QsDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB4ZV9wYWdlZmF1bHRfcXVldWUN
Cj4gKnBmX3F1ZXVlKQ0KPiArew0KPiArwqDCoMKgwqDCoMKgwqB1MzIgaTsNCj4gKw0KPiArwqDC
oMKgwqDCoMKgwqAvKiBTcXVhc2ggYWxsIHBlbmRpbmcgZmF1bHRzIG9uIHRoZSBHVCAqLw0KPiAr
DQo+ICvCoMKgwqDCoMKgwqDCoHNwaW5fbG9ja19pcnEoJnBmX3F1ZXVlLT5sb2NrKTsNCj4gK8Kg
wqDCoMKgwqDCoMKgZm9yIChpID0gcGZfcXVldWUtPnRhaWw7IGkgIT0gcGZfcXVldWUtPmhlYWQ7
DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGkgPSAoaSArIHhlX3BhZ2VmYXVsdF9lbnRyeV9z
aXplKCkpICUgcGZfcXVldWUtPnNpemUpIHsNCg0KU2hvdWxkIHdlIGFkZCBhIGNoZWNrIGluIGhl
cmUgdGhhdCBwZl9xdWV1ZS0+aGVhZCBpcyBzb21lIG11bHRpcGxlIG9mDQp4ZV9wYWdlZmF1bHRf
ZW50cnlfc2l6ZSBhbmQgcGZfcXVldWUtPnNpemUgaXMgYWxpZ25lZCB0bw0KeGVfcGFnZWZhdWx0
X2VudHJ5X3NpemUoKT8NCg0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0
IHhlX3BhZ2VmYXVsdCAqcGYgPSBwZl9xdWV1ZS0+ZGF0YSArIGk7DQo+ICsNCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChwZi0+Z3QgPT0gZ3QpDQo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGYtPmd0ID0gTlVMTDsNCg0KTm90IHN1
cmUgSSBmdWxseSBnZXQgdGhlIGludGVudCBoZXJlLi4uIHNvIHdlIGxvb3AgYmFjayBhcm91bmQg
ZnJvbQ0KVEFJTCB0byBIRUFEIGFuZCBjbGVhciBhbGwgb2YgdGhlIEdUcyBpbiBwZl9xdWV1ZS0+
ZGF0YSBmb3IgZWFjaCBvbmU/DQpJcyB0aGUgZXhwZWN0YXRpb24gdGhhdCBlYWNoIGVudHJ5IGlu
IHRoZSBwZl9xdWV1ZSBoYXMgdGhlIHNhbWUgR1Qgb3INCmlzIE5VTEw/IEFuZCB0aGVuIHNldHRp
bmcgdG8gTlVMTCBpcyBhIHdheSB3ZSBjYW4gYWJzdHJhY3Qgb3V0IHRoZSBHVD8NCg0KU3RpbGwg
Z2V0dGluZyB0aHJvdWdoIHRoZSBzZXJpZXMsIHNvIGFwcG9sb2dpemUgaWYgdGhpcyBpcyBhbHNv
DQphbnN3ZXJlZCBsYXRlciBpbiB0aGUgc2VyaWVzLi4uDQoNClRoYW5rcywNClN0dWFydA0KDQo+
ICvCoMKgwqDCoMKgwqDCoH0NCj4gK8KgwqDCoMKgwqDCoMKgc3Bpbl91bmxvY2tfaXJxKCZwZl9x
dWV1ZS0+bG9jayk7DQo+ICt9DQo+ICsNCj4gwqAvKioNCj4gwqAgKiB4ZV9wYWdlZmF1bHRfcmVz
ZXQoKSAtIFBhZ2UgZmF1bHQgcmVzZXQgZm9yIGEgR1QNCj4gwqAgKiBAeGU6IHhlIGRldmljZSBp
bnN0YW5jZQ0KPiBAQCAtMTMyLDcgKzE1MCwxMCBAQCBpbnQgeGVfcGFnZWZhdWx0X2luaXQoc3Ry
dWN0IHhlX2RldmljZSAqeGUpDQo+IMKgICovDQo+IMKgdm9pZCB4ZV9wYWdlZmF1bHRfcmVzZXQo
c3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdCB4ZV9ndCAqZ3QpDQo+IMKgew0KPiAtwqDCoMKg
wqDCoMKgwqAvKiBUT0RPIC0gaW1wbGVtZW50ICovDQo+ICvCoMKgwqDCoMKgwqDCoGludCBpOw0K
PiArDQo+ICvCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7IGkgPCBYRV9QQUdFRkFVTFRfUVVFVUVf
Q09VTlQ7ICsraSkNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3BhZ2VmYXVs
dF9xdWV1ZV9yZXNldCh4ZSwgZ3QsIHhlLT51c20ucGZfcXVldWUgKw0KPiBpKTsNCj4gwqB9DQo+
IMKgDQo+IMKgLyoqDQoNCg==
