Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4981AC71136
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 18:48:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC8C10E0E7;
	Wed, 11 Jun 2025 18:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hV9QydjA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE9910E0E7
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 18:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749667724; x=1781203724;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=MaQxVVqxQStbc75xjdoVRmRC8BB5NdzrdLrwsC2aXXE=;
 b=hV9QydjAnAu4b/oqurRub1r8NGUQLQ79J8VwTn5vY0DRg5cp7BV0C7dJ
 Q7OR+pFqKD5+pB6sPkYVX+Yi4tFKLXeYL7phbAiHgSroZN9PwGm4Uvvo6
 B6Qm755hr0XIz3QIPIqqorpesQO4O0BOEEbEOgtR0/kQn0Ez1oZVlniX1
 sjCxQ/uTNyPDgy1g7Wou449Ya8maJmBsweWQeWh+5Q8vi7XGgEOg6JHFZ
 WM1R/PkaiS5menMczA+xz4ptKusp45HvbqXTax6FHhAU6kjxOuFPzFycf
 R95mXgFvgV5rNnSsKXnNMadA053Hs4NdMMO6eyTDYxrt6dX1E2jRgVjnz g==;
X-CSE-ConnectionGUID: DPqU3SjfRJWoAvxbxn8fmQ==
X-CSE-MsgGUID: FVQhu07nTD+z4faKB28lUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="62477181"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="62477181"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 11:48:43 -0700
X-CSE-ConnectionGUID: ahkzEggyR7yFayHOmJhAsw==
X-CSE-MsgGUID: 3m0ayBZORSGjUwKaanNSGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="147273229"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 11:48:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 11:48:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 11:48:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.59)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 11:48:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLGjdFeiQ+5aufnDzAogt1YcNGJx1OHn7729794gymx8SpEOx7NlHr5vmIr8ZOD1qOe5PS+baM4L2SM3KVWwwen4rv1mE968HQD9z459hvVtwZrzx2j+GQ9PEDNInRiZmry6r1k3kkC+MTMuvp38+WZY+ZcLMqos9mVG3ak+opPQoxVHvAHE1wrxppdoj/018HlT+cyXeGeuZFg5+TJeb1jADhYIToatFw1Vl9ZaL9YWM5ih9i0PQhs1ItBIYirrev/bQ69flaIknxcQhp+PYl8b4+QB+9vCpjP1nLEjYVgX8FjmQp9Qc2FvAZr0yJ4EHa5YOShkp1J4g0+G7P4Sxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MaQxVVqxQStbc75xjdoVRmRC8BB5NdzrdLrwsC2aXXE=;
 b=rZ+VXgbMq9VY8Ma37povrvFe4o3enA5wAsw1LdSEgwQl9NGIP5+YMchKVYlqvsvE5xl6KRxdETD8Pg4CY0uwJrwZWucL6Kk0ld0Rp5S3fLgu8xOZt7U+q3zRJwWKO0EB+RFbM9tbLtbGIZuOXqRl+6RrdrYe2BXuTFZH2f2tmVQnAzj2rd6Rk++9HhcsOhGRzrjEssUXQGyOyB54CVXUMNlJ/I5ljjw67s79Dt81HXdoil1jKtxCu6Kchh2m+Wr4zEPyGcTC95TVBynpWNhxtCiBK5SeNtY2U0lAEOdUAfxhYIfKuXAQpQRGwlyLyJQ/xpC4dBCTjkD2jdoobJPjvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA0PR11MB4607.namprd11.prod.outlook.com (2603:10b6:806:9b::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.18; Wed, 11 Jun 2025 18:48:12 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 18:48:12 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v2] drm/xe/guc: Set wedged on Xe micro hardware
 initialization error
Thread-Topic: [PATCH v2] drm/xe/guc: Set wedged on Xe micro hardware
 initialization error
Thread-Index: AQHb1arOkL9ehQqh1kWkBi+CDXEZiLP+QBcAgAAWsYCAAACkgA==
Date: Wed, 11 Jun 2025 18:48:12 +0000
Message-ID: <276ed80a23eae8732a2487bd23c0373150b99137.camel@intel.com>
References: <20250604234532.1167699-1-zhanjun.dong@intel.com>
 <0d72b0ec0f7dd251f42bcbbeae17ab7b5766c3d8.camel@intel.com>
 <32b0f2c2-cb7a-4a06-b20a-e1082cbfca31@intel.com>
In-Reply-To: <32b0f2c2-cb7a-4a06-b20a-e1082cbfca31@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA0PR11MB4607:EE_
x-ms-office365-filtering-correlation-id: 23590278-91de-4d6f-c2af-08dda91884c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dXJRVjEwN3l4b2hFb01kUWQxU2hFbUNSRXlKWW5Tdmtrd1B1bzlrMEJYSElm?=
 =?utf-8?B?RkU1N1M4MFo0cTBZUHg4Y09BUHh5aTFnMk43UG9BMmxHemhLVVloYlpTZWdh?=
 =?utf-8?B?YkZFeHFVbUVZQi8wUSt2ajdJcllnVzJROTBpbHB5RGtCeHJUVmx1SFdIMGE4?=
 =?utf-8?B?eGlZemo4ek5CaklESEFBdmt1c1docjVLNTNHek1Ubytzb29iQllTRHJZVjlW?=
 =?utf-8?B?VU1FcXlNR3hkREFWSkxpUFR6dStackxFWHJkaHVSYXRjQ01aNEhqNDVBM0lE?=
 =?utf-8?B?dlh1dUVoeEUwYVhrcmd2QW5lWG1kVER6VzRhZi9QMUpWV2RPVFNMWU5xSUpP?=
 =?utf-8?B?amd0c01OeU9lZjFxTDNidWNFVldSNnNjRVlLbzRSWTlZR09BWkc3Vng3QWkr?=
 =?utf-8?B?RVNDMEI3VUxZQzJ2ZVF5VVg1NmFpb2JSRm5ZL0ZkdnpuM3F4MHVlaE44MEp1?=
 =?utf-8?B?c2hyejJxVkpPT0dkNVJyL0ZXREs5Mk9pUEdlVkpQb1ZOZkJiUTdWSjQ2biti?=
 =?utf-8?B?ZVA4QzREeFJJR0xrQ3h2UWdjZlV6R2ZyZVVSVHN3OGFkdUdkUzBxelF3Wm5S?=
 =?utf-8?B?QXBqQytrVm8zVWtCYkRLdXZ2c2ZQaGF1VTBlc1ZIRFpkY3FwSDNFSFJwdTNH?=
 =?utf-8?B?Q0VXQTRWc0xIK0Z1VXhEeGU4VUdZKzlIeVBmZWJLcitMSDVKT0ZocmZXK0lZ?=
 =?utf-8?B?cWo5dXY4TDJqNmZuak9rYldCdDBaMHdWN1JDdUljbTZJSWNIZ1hQakVZKzhj?=
 =?utf-8?B?MTljVW90RFpJa1VxQjhyeWRVSDkrMm45NGRMSlhDZFUzYXdpeDBDRjdoOVpo?=
 =?utf-8?B?cnM2Q0VCeExrZ081L1JidVVnRkxMd2JiS2dWZGEvUWZpVWN1QVJ4Y3MxeU1B?=
 =?utf-8?B?U2RtdVVaVldtZmFJWHNjNmNneXBHd2huRXZmbW0rOURDSE8xOFQ0UUxVWjF5?=
 =?utf-8?B?M2hleXoySUhIUkFUaHgvSjBLdXJrdVB0NWxabzVKTEJWL0xUY0h2bENLS3NO?=
 =?utf-8?B?ZkpYODFnZklGaHcrTVp0Q2lSTHNiWmo4SWxTTnhkekwzbmJyYTNQY0lZRWxL?=
 =?utf-8?B?L1dWUm5ha2JsYTh1RFZENHZmUGFVOWgzaTZCdUMwQWd4NE1iMWlQdGJVU2dK?=
 =?utf-8?B?Rjc4cVVMSTJKQnNFeisrNHhwRUp3WVFuY0NrRnBud3JTcHV0ak5RN2NDSUl6?=
 =?utf-8?B?MDZvOUVrMVhicjlsYzNPTHM1c1BObXJXR1ErcUVXOFBxVGpLdExTK3dxUVZR?=
 =?utf-8?B?aUpObW1jWXZ2VUlJaTZlSEk4MXkzWUNBSTBoaHVwUm1xK3RQUDVENk1Odm9a?=
 =?utf-8?B?azZERVl4Z3BJMU1NemRsMExxcjJBVTlqQzI4YU1kdDI5dHVXWENmRWw0TWpz?=
 =?utf-8?B?bmU3bVR3Y3BQTUxxNGRkUUZaN1FXWWNnL2ZZMVJ3Sk5oMUdjWUpwYUI0cWVm?=
 =?utf-8?B?UXJOR3NlWkJwQjNkUnlGRmxxdVJ2dXBKcjJIdUxEM0NNNEI2enB6VTlUVGpY?=
 =?utf-8?B?eUM1am5SU3IrbGgwR29kOWw0VUJTWVJMVlRTcmpWTnQxdGxBQlFCODd4OVor?=
 =?utf-8?B?a09VQWlLL1BnN3VjRSs2SVdYMU5ZdWdBdnI2WkpLR2hLdmkyMzRTZzRCRFU5?=
 =?utf-8?B?QkNsNmdwbzhKdlBtM0FrK01XZFBZK0NIcXpaZ2hlVmNSSXVEaEYwRnhqSW96?=
 =?utf-8?B?elV1K3JrYzkxU0hOcktPa3dZVnNoeDhGUlFzYU4zVmxJb0t3TDRQdzRTd0pq?=
 =?utf-8?B?Ykx6Y0F5NWE5YTB1TGVsRkJTL1ppYklkbGhOZGtZRXpUOTdXSmM5VGlNZ3dI?=
 =?utf-8?B?akdCb25qNVlJaWg0YnRmcTI1OGJ5YmxTNkJudU1rWU9lelU3M2dpWnZDbnF1?=
 =?utf-8?B?UFY4ZFRiK2JaL25oUXBMM3c2elY2dVh5dFRCaktVN2RzOFNQdFZuU1FFTjRU?=
 =?utf-8?Q?x3lNEIXOElo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDRzKzJ5c1ErZTlJTnd2and4ckUxL3hObW15TFlvRGplOGx2YU0xeXBlSzlZ?=
 =?utf-8?B?L2o5SzBTQ2VFN0xrVHJwaHl3cTE2Y2VLcWhNUWV2cTZLa2xjYXZhTUsydFND?=
 =?utf-8?B?Z3RKb3Y4dXpVVkNiYytYaklPaDVaQkpVTG5jOWlmSzlJSkwvQkRPdWZGZ3BJ?=
 =?utf-8?B?UU40TWNBN1JENjB3b2hBMUtwQkVjSXNCWHpmZXZ3Z1lIbzJoaDFEVGhGVlk3?=
 =?utf-8?B?MTZucUpIOWpyOFFwOHNKOThqRXhMdmZiVU5oc1l2ZlJoU2RrTUZPcVRtZlhv?=
 =?utf-8?B?QXhGN1hhbkFpSUtWdko2TktiWDA2NXBMUWJEbzY2cGFaQW1wUForS1hRRzhm?=
 =?utf-8?B?cVFxdGd4alJYRWxFOENEL1gzY0tGeG1lbXd4aWlNbzdSd3BKWUIzV2RaWThs?=
 =?utf-8?B?em44VmZXb0RTQkFEdDA3RmtXbHpSc2ZvWFJMc2s5ZGtDeW5tSEZ0Rno1UGhT?=
 =?utf-8?B?dC83STJaMlFuRVFqNDBraURHNFlDTmhURzdvV25qUEhiQksrWUtvYmd5YlZu?=
 =?utf-8?B?bUFtam56VlAyMHA0Z2tmL2RWWmJJdEZXR1FMdjJvTUVPOFU1THhQZXpMYzFG?=
 =?utf-8?B?R1RaSUtXZUxpUUpramdIektBTzU0b1V5T1dCV1MyTHBZeU5YSklVcEFObXJt?=
 =?utf-8?B?bHhvZzNoc1loQUlwbkdHSlpVT2tMaFdnb1VuKzdOZ3JqeEhYb0ZaNSt0Y05Y?=
 =?utf-8?B?S2owc1l5bzA3QUxFam9ZTXNFVnRwODdnaE4waGJ3bVVKWWVGRlJwOGdIZERN?=
 =?utf-8?B?bDVYbFRQSEZ1TkRQcG5RWmNrUHJNVzNHMHFiS01sd0lDR3JiSUR2ZEFaVVZ3?=
 =?utf-8?B?eS9PRGdib1ptYVBVVkdKbjI5bmptVHlkYzZwMGlPRHZQbnJWZkh2bUlvVjJl?=
 =?utf-8?B?ZlNGSXdLTWNqa0paZEZOY0FYMlg5ZFJ0S2V3VWdpUjdLK3diSnMvd1U4cFdy?=
 =?utf-8?B?M0JjK0piQ2V1UGtvcWtnYmI5bUNudVAxbG5tcEFxRHp4Zy9sUUE5S0V4Z0ZO?=
 =?utf-8?B?MHFNc3VMaThHSEJsOGxGNkxybTFxU0RXU3Vja0krWDBkTWFmbG50NWZGWERN?=
 =?utf-8?B?bHYyT2pIdWFmdExtOXFONHZTWjlBcklNbFdxRVM5REhPbGpLQ2xEOVBGb1pk?=
 =?utf-8?B?SHN4U3NQNXZKc3dJQ05jV3dhUHQzeXV2cE94VGkrR0RoQm03cUVxbVNHd252?=
 =?utf-8?B?TDZPdVYyNlRFd1lldGJRQTU4SHlkMzc2SXc1cFNDQlNMUmpZQlBXV0xjczJW?=
 =?utf-8?B?dVBJVWl4SGxQOEZzYjhlTXpKN2h4Wk1LTU5aQWZmd0hEUkIvR1doQmJqQ3c3?=
 =?utf-8?B?elVjUmVnVFkwazdramowVFNGRzgwdDhNRHVlUVNvTFlHemJibk55OWhOb0hS?=
 =?utf-8?B?SEJ5SE1QdnkrZ2xieEFQYVd6czZNMXorMnVRSkkzeUxMZm5WMnJLQmtOdVox?=
 =?utf-8?B?UXBDR01UUWdKZ3Naa0dCQksvY2d4QStQWjk2VTI5YU0vWDhGMURnek9pcDRS?=
 =?utf-8?B?dVk5d1Fxd2prODJyS0hLczM3V3QySG5ZR1luNEdmaDhCSXhrd0xYeE8zczRq?=
 =?utf-8?B?dUx0cDNrRTRjaDdOSFdNc09nU1RVRm14VTFSQzFhZWFSZGhoLzZNbmErS2p5?=
 =?utf-8?B?VTE3Z3VTWGlvZ09lRFBjNlk3LzUzbStmQkRXdHR2ZFJQbmppYmhsVnNxaFFG?=
 =?utf-8?B?bDBjNWVZU3lnc1o0cFFNaS9LcEJmSlZJRjRyUGFZM2hSNG5BQTNkaklheVgx?=
 =?utf-8?B?Qm9aVVBrT0ZVc0l3cFAvOW1oYWlQbmJOQUxLaEoxMVI1b0lvSUZkWmt0ZWVs?=
 =?utf-8?B?aWgwZmgrazg0Q2FVWHlqdXEzQzNWWkxCKzRlekcvc3hUZHROaWZyVjRKWHgv?=
 =?utf-8?B?OUlwbnhqZnNRU1RGQUxVRzFkVktTcTdrVWZwbzVnWDdUd1czM2o3SGVPcWxK?=
 =?utf-8?B?NjQvNVlSS0VzR1l4TFZIWmZmVG5iMXlpMmNoQXVYK0xrdklJbDBpclhyQ3hV?=
 =?utf-8?B?QVNPUHR0MU52dEQvNjNPMGZJMjAyVjQrSE9VU1djVEVPQTZvRVhSZTlhalVt?=
 =?utf-8?B?Y1VyNXA4UktQb3h1bjFOSDQrUm9COW51eFU3cGwrYXVCdHRIUlNJTnA4ZERP?=
 =?utf-8?B?Yk1nblVtaVdZR0EzZkViMFRSZnlMTlVWZ3BRVlhRbnFtVVJ2QW5LdVZmNEcr?=
 =?utf-8?B?dEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <225B805919631642BE4825D45B13D2B1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23590278-91de-4d6f-c2af-08dda91884c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 18:48:12.7843 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /lZ2Ur1XfTDPluz26dTD8YIta/PqOXwVg0r6krGtc95kW52Rv+eP5t4HkVtUntMK/M/eqPwuHHunKq2k0rqV0Rj7v7jYaf+wNDVb1kwsRVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4607
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

T24gV2VkLCAyMDI1LTA2LTExIGF0IDIwOjQ1ICswMjAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3Rl
Ogo+IAo+IAo+IE9uIDExLjA2LjIwMjUgMTk6MjQsIFN1bW1lcnMsIFN0dWFydCB3cm90ZToKPiA+
IE9uIFdlZCwgMjAyNS0wNi0wNCBhdCAxOTo0NSAtMDQwMCwgWmhhbmp1biBEb25nIHdyb3RlOgo+
ID4gPiBEZWNsYXJlIHdlZGdlZCBvbiBYZSBtaWNybyBjb250cm9sbGVyIGhhcmR3YXJlIGluaXRp
YWxpemF0aW9uCj4gPiA+IGZhaWxlZC4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFpoYW5q
dW4gRG9uZyA8emhhbmp1bi5kb25nQGludGVsLmNvbT4KPiA+ID4gQ2xvc2VzOgo+ID4gPiBodHRw
czovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL3hlL2tlcm5lbC8tL2lzc3Vlcy80OTE3Cj4g
PiA+IAo+ID4gPiAtLS0KPiA+ID4gQ2M6IE1pY2hhbCBXYWpkZWN6a28gPG1pY2hhbC53YWpkZWN6
a29AaW50ZWwuY29tPgo+ID4gPiAKPiA+ID4gQ2hhbmdlIGxpc3Q6Cj4gPiA+IHYyOiBSZW1vdmUg
dW5uZWNlc3NhcnkganVtcCB0byBlcnItb3V0Cj4gPiA+IMKgwqDCoCBEcm9wIGRpc2FibGUgY3Qs
IHN3dGljaCB0byBzZXQgd2VkZ2UKPiAKPiB0eXBvIHN3dGljaAo+IAo+ID4gPiAtLS0KPiA+ID4g
wqBkcml2ZXJzL2dwdS9kcm0veGUveGVfdWMuYyB8IDIxICsrKysrKysrKysrKysrLS0tLS0tLQo+
ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+
ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV91Yy5jCj4gPiA+
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3VjLmMKPiA+ID4gaW5kZXggM2E4NzUxYThiOTJkLi5i
ZDFkNGU4ZmFiN2UgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV91Yy5j
Cj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV91Yy5jCj4gPiA+IEBAIC0xMyw2ICsx
Myw3IEBACj4gPiA+IMKgI2luY2x1ZGUgInhlX2d0X3ByaW50ay5oIgo+ID4gPiDCoCNpbmNsdWRl
ICJ4ZV9ndF9zcmlvdl92Zi5oIgo+ID4gPiDCoCNpbmNsdWRlICJ4ZV9ndWMuaCIKPiA+ID4gKyNp
bmNsdWRlICJ4ZV9ndWNfY3QuaCIKPiAKPiBkbyB3ZSBuZWVkIHRoaXM/Cj4gCj4gPiA+IMKgI2lu
Y2x1ZGUgInhlX2d1Y19wYy5oIgo+ID4gPiDCoCNpbmNsdWRlICJ4ZV9ndWNfZW5naW5lX2FjdGl2
aXR5LmgiCj4gPiA+IMKgI2luY2x1ZGUgInhlX2h1Yy5oIgo+ID4gPiBAQCAtMTU3LDE5ICsxNTgs
MjIgQEAgc3RhdGljIGludCB2Zl91Y19pbml0X2h3KHN0cnVjdCB4ZV91YyAqdWMpCj4gPiA+IMKg
Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBlcnIgPSB4ZV9ndWNfZW5hYmxlX2NvbW11bmljYXRpb24o
JnVjLT5ndWMpOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGVycikKPiA+ID4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBlcnI7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBnb3RvIGVycl9vdXQ7Cj4gPiA+IMKgCj4gPiA+IMKgwqDCoMKgwqDCoMKg
wqBlcnIgPSB4ZV9ndF9zcmlvdl92Zl9jb25uZWN0KHVjX3RvX2d0KHVjKSk7Cj4gPiA+IMKgwqDC
oMKgwqDCoMKgwqBpZiAoZXJyKQo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cmV0dXJuIGVycjsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJy
X291dDsKPiA+ID4gwqAKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHVjLT5ndWMuc3VibWlzc2lvbl9z
dGF0ZS5lbmFibGVkID0gdHJ1ZTsKPiA+ID4gwqAKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGVyciA9
IHhlX2d0X3JlY29yZF9kZWZhdWx0X2xyY3ModWNfdG9fZ3QodWMpKTsKPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoGlmIChlcnIpCj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1
cm4gZXJyOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBlcnJfb3V0
Owo+ID4gPiDCoAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gPiA+ICtlcnJfb3V0
Ogo+ID4gPiArwqDCoMKgwqDCoMKgwqB4ZV9kZXZpY2VfZGVjbGFyZV93ZWRnZWQodWNfdG9feGUo
dWMpKTsKPiA+IAo+ID4gT24gdGhlIFZGIHNpZGUgc2hvdWxkIHdlIGJlIHJlZHVjaW5nIHRoZSBz
Y29wZSBmb3IgdGhpcz8gSXMgdGhlcmUgYQo+ID4gd2F5Cj4gPiB0byBtYXJrIHRoZSBWRiBhcyB3
ZWRnZWQ/Cj4gCj4gIndlZGdlZCIgaXMgbW9yZSBhIGRyaXZlciBzb2Z0d2FyZSBzdGF0ZSwgc28g
VkYgc2hvdWxkIGJlIGFibGUgdG8KPiBkZWNsYXJlIGl0IHRvbywgZXZlbiBpZiB0aGlzIGlzIGp1
c3QgZnJvbSB0aGlzIFZGIGRyaXZlciBQT1YKCk9rIG1ha2VzIHNlbnNlIGFuZCB0aGFua3MgZm9y
IHRoZSByZXBseSBoZXJlIE1pY2hhbC4KCldpdGggdGhlIGZpeGVzIGluIHBsYWNlIE1pY2hhbCBo
YWQgc3VnZ2VzdGVkOgpSZXZpZXdlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJz
QGludGVsLmNvbT4KCj4gCj4gPiAKPiA+IFRoYW5rcywKPiA+IFN0dWFydAo+ID4gCj4gPiA+ICvC
oMKgwqDCoMKgwqDCoHJldHVybiBlcnI7Cj4gPiA+IMKgfQo+ID4gPiDCoAo+ID4gPiDCoC8qCj4g
PiA+IEBAIC0xOTcsMTkgKzIwMSwxOSBAQCBpbnQgeGVfdWNfaW5pdF9odyhzdHJ1Y3QgeGVfdWMg
KnVjKQo+ID4gPiDCoAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgcmV0ID0geGVfZ3VjX2VuYWJsZV9j
b21tdW5pY2F0aW9uKCZ1Yy0+Z3VjKTsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQpCj4g
PiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Owo+ID4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBlcnJfb3V0Owo+ID4gPiDCoAo+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgcmV0ID0geGVfZ3RfcmVjb3JkX2RlZmF1bHRfbHJjcyh1Y190b19ndCh1
YykpOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCkKPiA+ID4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBnb3RvIGVycl9vdXQ7Cj4gPiA+IMKgCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqByZXQg
PSB4ZV9ndWNfcG9zdF9sb2FkX2luaXQoJnVjLT5ndWMpOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
aWYgKHJldCkKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGVycl9vdXQ7Cj4gPiA+
IMKgCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqByZXQgPSB4ZV9ndWNfcGNfc3RhcnQoJnVjLT5ndWMu
cGMpOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCkKPiA+ID4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBnb3RvIGVycl9vdXQ7Cj4gPiA+IMKgCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqB4ZV9n
dWNfZW5naW5lX2FjdGl2aXR5X2VuYWJsZV9zdGF0cygmdWMtPmd1Yyk7Cj4gPiA+IMKgCj4gPiA+
IEBAIC0yMjEsNiArMjI1LDkgQEAgaW50IHhlX3VjX2luaXRfaHcoc3RydWN0IHhlX3VjICp1YykK
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoHhlX2dzY19sb2FkX3N0YXJ0KCZ1Yy0+Z3NjKTsKPiA+ID4g
wqAKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+IAo+IG5pdDogbmV3IGxpbmUgaGVy
ZQo+IAo+ID4gPiArZXJyX291dDoKPiA+ID4gK8KgwqDCoMKgwqDCoMKgeGVfZGV2aWNlX2RlY2xh
cmVfd2VkZ2VkKHVjX3RvX3hlKHVjKSk7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7
Cj4gPiA+IMKgfQo+ID4gPiDCoAo+ID4gPiDCoGludCB4ZV91Y19maW5pX2h3KHN0cnVjdCB4ZV91
YyAqdWMpCj4gPiAKPiAKCg==
