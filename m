Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D4CC79FA0
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 19:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FFB10E081;
	Mon,  7 Sep 2026 19:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nt3CzByN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A5210E081
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 19:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788808639; x=1820344639;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pzaX7mZTfWILrlW9KwPbAtTWVTEABMDC3YgQIRAcnmQ=;
 b=nt3CzByNXsH8Smqi8NnOhYpJCwnAZg7r5juMn48EE2oTNXhZpJHoPQfk
 9DXq654EHaD774AYGzgLy9W01o2fR9wCgoPUqPnI/1tcU1uL+V3SQ9AzW
 JuKLre1l4Yzkq9tkDnxnWp8da0ai3eJRi6ClurKeILuRly4mhrKWkOFDx
 OEhi/4HONwJbhLZpbqrxvRBzHfoVpt/11rYXkg2WDK+jVfvwDFoagL+G8
 UebMhewcbvwOfMKDpDZAk88S0/IHNnlNscaE+r8rxz4MMTM7jpeq+Ad84
 yE6N5gnm1Qz7Lp+mFSDmxqavfHomDauV5xcQHKIt3H02jJHOQ73u7Dsfo Q==;
X-CSE-ConnectionGUID: 15qb4hdZQa2R2iuosG8ZSw==
X-CSE-MsgGUID: 3m9eVrBQTU2Hqw1PUQxSwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89086185"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="89086185"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 12:17:18 -0700
X-CSE-ConnectionGUID: 9ZuqIsXaQzWF5MjP/ThfgQ==
X-CSE-MsgGUID: FAp5lVNPTnKIci0Ke0ILSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="264586105"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 12:17:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 12:17:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 12:17:18 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 12:17:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOTrskAHL2P+f6ShM0eyDt1iA0Pba9CLcaGcclEgvUIRVqLdmTcWs5FGESOmcw6UTQBCOQeBXtmWfDyWEfnqYjLu5ovzkAHjDWB6iQMefDBY0JM9SEqbFUBwy+dbelrWCMde/NMcI5IQebv99XkbDqwOq7/4dvMRQnYZ/uDITwA6qqv0KHC7Zc9LDOPoS7EG5O8c5AIVeyVBKLUAU+oEwRqiR6kyVnyrIvBGS7FD3Pj6qKehv1+SnkILIMrfpnlOE2eoSnr6alsl54jJ5TumYnJgCxoswhXw9Q9PgEODAWU7mt8xdM4nr60SHui4YRhMiwl4g5qSWmY9lAR2B4jODg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzaX7mZTfWILrlW9KwPbAtTWVTEABMDC3YgQIRAcnmQ=;
 b=tlNcv4BOFCI8b+WHeJIe5liK4f3wOOJQMHdjjr2kf778BcXBzWP8xaqxAckcjXm8GXXbsZcqaaPbnlwb49wzgzPmUf7PPtqCRLUs1iDBH3q0l9o3dxo1uzp7TU3GlqdVAoSBh3emIHAURofkgYOZp+cR+LAV4tP7ueQBLI3/tTnZM4RTulR5QDKdXqUTOxvy0685xtUuVGNN62IK98FW7cRYzmuww+5pZTgKnL+pA94eZR/TXWJoy1kccX3w1jvqGHYf2Cne1WZz3KF9GBnuLevlSSMdzlueREB26mFPOeZoP0b/Hct8tgCG92v+FA4YRFqEyV4m3AlVtX9Xegbniw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB8040.namprd11.prod.outlook.com (2603:10b6:510:238::11)
 by SN7PR11MB7708.namprd11.prod.outlook.com (2603:10b6:806:352::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 19:17:16 +0000
Received: from PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5]) by PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5%3]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 19:17:16 +0000
From: "Yao, Jia" <jia.yao@intel.com>
To: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>
Subject: RE: [PATCH] drm/xe/guc: skip TDR timeout check when ctx_timestamp is
 0 or 1
Thread-Topic: [PATCH] drm/xe/guc: skip TDR timeout check when ctx_timestamp is
 0 or 1
Thread-Index: AQHdPJijJN73HM6eyEiaPYY6X7M1F7a+umqAgABHvYCAAFRykIAEKlsA
Date: Mon, 7 Sep 2026 19:17:15 +0000
Message-ID: <PH8PR11MB80403787C0F8895593AF1FACF4B22@PH8PR11MB8040.namprd11.prod.outlook.com>
References: <20260904180943.3455267-1-jia.yao@intel.com>
 <apsLfbXfIYuJgKUl@gsse-cloud1.jf.intel.com>
 <aptHq+dYSBbtRQqW@soc-5CG1426VCC.clients.intel.com>
 <PH8PR11MB8040F9B2950DEA9272114EB2F4B42@PH8PR11MB8040.namprd11.prod.outlook.com>
In-Reply-To: <PH8PR11MB8040F9B2950DEA9272114EB2F4B42@PH8PR11MB8040.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB8040:EE_|SN7PR11MB7708:EE_
x-ms-office365-filtering-correlation-id: 48a09869-e5d6-4f51-1779-08df0d14a0e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|42112799006|10070799003|38070700021|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: +tkkwDKh2CR3QxuHWGfZSmVc4WbbApx4WPBmk46pw6CG419Iw397riDzDTs2V3fP1jH1GjiHF9lM5STdSfuxQq/OJXVyvOpYlhiXwoACgu6R1cMauVkHfFIWNA45oOXCt0uzdyvQOYJYanNX22BhisvJ87CflLgBX4CeX+fFsk5G4e+e8OVRWGuvgmgIz2OmsSTQtUKH/zWRDDvp0lVtoIBTXEdm/TnZODGjq619qo/tndWdo0AVcL7yyR8TYYqLEBG2QUHVWI2p2G7Me7tIirImkCJ0ylZvV8hm1nfe358idTXsEcj4GqHC668nTtTXawMl7yuXrP6tfgKqMpipSZjNIoCt7gR8buXDR+dDcnV1gp/xhceTw765Hi5vCIPi0zXaK3YsCHznmev4G9ECMrlQbict+PkDLIOwxe0eIkM6P/QuGrHd53Kv8EZLm1tZy+y8QKGRzyuyIQsO9YEi4WTcKkv6m6kOiXKJ47H4oQlUrWSJ+KqSzGfMcVfQ8Hhj9Qy7NA6EQwp1vSKCxHo4swUtGKxgJ6LZJkEfMOVZHNb22NGMc7g4fgGQHQV+ubhgHnwK6zQvvREwRV3/tDJJaxHdNi3K3T+Dd4aKRzuZ5D5Lsd21g23P+fXJ3zErhf2OWQ0UOFRvRGR6k7WzJhyB/hhZnHQJsaiDvubqVkj5jmVoN5U3cyZLoab1jB4rMX7I+hH6NiilT64JBG2a8fPtRAuDfEaVyhd/ktRxBfxHXaM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8040.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(42112799006)(10070799003)(38070700021)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckhOdmk2YUYvNDJkWW1WU24zSVE2aUhPTWVtaGNCd0l0M1VqQTdJbmY4bEpa?=
 =?utf-8?B?Z0RjVlF3NTNPc21aS1lwSkRPRkdXb0ZFTHd5OHJ4eEk5STJKcU1VVFplMk50?=
 =?utf-8?B?UWVZbk93eWFqaFM3WmI3YWsyekR0UkNodmU4YXU4SlRNaEcwR2kzNi9LK0hO?=
 =?utf-8?B?eHFqMkdoeVV5NnRHVllyYU1rbnA5VnI0UnVmQnpzdE5aWFFHSy9nbXJobEVE?=
 =?utf-8?B?Rkg4eGZ6T0huOWpBOUd4VkxFcEZxOU9ESDk2RVowVTZTNm16bmFvZHZSck1C?=
 =?utf-8?B?K09uQmVvcW1Yek5yU3MzdDBjV1pZRHU2U21Wci9JekhYNTdIblBkcWZlTmVm?=
 =?utf-8?B?T1VIQ01TTlEyMXFIRldPb25RQVhWK1NaYkNvNm1vYkNaVTJRQTJHRDFKa2dT?=
 =?utf-8?B?VDBvblZ2NU1DVlRGRVhQUi9rbXlDM3V5US9TakVHL0dtZWpKdlVXNHhXUkE2?=
 =?utf-8?B?c2tvUTFqbHBvK0VaZE83YnNJMGRrSzM4eXRYNkVHL0xiWGh5Z2JYQUltTWFT?=
 =?utf-8?B?eVBMV2FJeGo0cUM1ZjBVckQvM0FtRUpoZlNhYml0R1NKS0RmcE1EWjVZdWxB?=
 =?utf-8?B?MU5hNDZLSGtwd0hhMElaWDVvSTVSQXJCRUd1OUoyZ0xNb3VKL3FWQlNETjRV?=
 =?utf-8?B?eDh0UER3UGhuWDVDNy95S1RJd0hNc2F2R1V3c0xhSkdJNVE4K3FMRHJNRjNn?=
 =?utf-8?B?QWtvMFY4TGJWbzhLWU9Ga3hSdGttU052M3pzTU5JbkF2TWRSdnpzQ1Q5bHVM?=
 =?utf-8?B?MHZJRWRyd3dGajVJYjlNY1V4WG02Y1JwQ1NGZ1BOcEdadGMzdmk5SDV4SCth?=
 =?utf-8?B?a0RPN1JpUGF0V08wREY0eUlUUEFTM1o5WFhKYkd4UGp2RFBhOWE3dDBPMlRE?=
 =?utf-8?B?bEQ2eTJLRC9VdFpIOGdmY1diaEJDQU9lWUIwcmFVNURoTThTaW56Z1lnV0FN?=
 =?utf-8?B?a2d4QmtaWXdBaSs5MWViSWdyaHBydGdyWW1sNm54Uisrc1czdnJvcVQvM2l3?=
 =?utf-8?B?b1N6d2VmY0Y1K0NzYTk1Nmw5TlBYQU9oZzFaMnFhTzNLbHpQQzFDZmxCMlho?=
 =?utf-8?B?OUQxVkJxenN1U0JIVFZPcG5pNU5rR2I1YXBpYjdsbGhURitYUjZlcitzMlNJ?=
 =?utf-8?B?Mk5lTEFlRmZLWW82ZVloMFJoMGVDd1JscjVnZTZ0YzVHYzJRZFNsTVlCaXZy?=
 =?utf-8?B?Tm1ndjNzeEZlTFdnK3dJaGRNaTJvTXZxak41YkljVlNkTEpZem9OS3dGRVRS?=
 =?utf-8?B?VnhzT2VvaUhFMnErVTk4Q29xb01nNXFUb01pSWt1TEllMjcrYzB2TC9MVVU5?=
 =?utf-8?B?eUszcmtJSEY2YVZXYnk1RkV6dUdQTndlcnY4aWdIeDRXVkxTN0x6Nm9lK3d1?=
 =?utf-8?B?K1JRd2NLcy9wQloxeUlGaTBiY3NoYVdZSWg4WXlBZ0Z0Zk12VHFYOHBaNFNL?=
 =?utf-8?B?SzJ4SkY1cUZieG85MHZrZzJFcDFjVW5ic1RHV29iY2hveG1pQzRkWUJaRFQz?=
 =?utf-8?B?K2Vma1hxVU9vT2RnUGRrbXBNRmUvaXlDSGN5U0ZnblVvZVk3dTlTMWU2YkRn?=
 =?utf-8?B?SU9UWVlCUTlVOURZek95VjM0SXpRSEVraGN6Y1l6M0dncVp2eW9USmtXQldI?=
 =?utf-8?B?bnIweEdQczlCcVFyVmh1SWFwZStSSkdtODhKZG96c2EvYWVKQWwxWEppWkda?=
 =?utf-8?B?ZFgyWndJMXp1ZnNxWDZCS0M1SHFPRVJXYktuaFlXNVRIWkdlOHN0QmVaR0Nx?=
 =?utf-8?B?ajJPMjJ3SmJnVUZ1VEtKSUxEaVVzcFdUOGNsanFlNk5lOEVXdWVQRUVCb3JM?=
 =?utf-8?B?d040SGN0ZUErdHh5aWlncDBKYTVxbVNzYUFNRGFHUlViTklQRzJxQXV5ZWp3?=
 =?utf-8?B?ZHZ0T1RwRHB0TWtQYzV2Z0dQcWRGUFl5Q3BpbXJxdGk1dHZwc0tnYTNJUU41?=
 =?utf-8?B?VXZhZG5YeTJOeXFrREpGNXVsKzVCY1JaYldwMWl0UTRwMzc5Y29FdGJ1VG54?=
 =?utf-8?B?SFI4cVpoc20zK1d4VDNQMVQrOGVidmtsN29kMDg4MktxZ0RVb05LM0U5cDVk?=
 =?utf-8?B?cy9kbnVpVkpsMmRwbDh0eTRGUmhjcUtGMzJPUyt6QlZWNXBpclh3MFEzMWpw?=
 =?utf-8?B?ejNScWcwVk85WkpHZkQraG1YVDBQclFIY3RHRDZ4VDZlMkdpYWJjRHJ6cXc5?=
 =?utf-8?B?UklnMHEzUlQ2OFV0TTYva2o0Y2psbmlDYXgwWUdQbTFlTld6L0Raci9JU3U4?=
 =?utf-8?B?OUV5aWtCU0dDcEdFbzlQTVhFcTA0Z0hnY0pvTG8vb0xGZFY3cEJyNStHZnpw?=
 =?utf-8?B?dFRuZzZHR2ZoYlNITlRuUjFOQ0VCSTE5UGpkOWJRcWRkbWxrYlo5enViSFZx?=
 =?utf-8?Q?0SHaEk24AcL/fRxxBINEQd4s4h4V12Tdi8O+G?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UKguWZ5+7rDIksf9tsU2sTivXyJmZzElFSyf7mEme7RNO+TMi6p2w2zsRLTpd7u4GH0Bn/CFZTgupSg9btNKGhP9mPdQrCwvpsmyx0Vas/yTnSCrO23TUloGFDFWC6tKE6qx53qM5P7PCBVOA7WHVXNLt8iFyo8C9p3UGGuKskbSKd+v8XJV2BJasmegVXHMvrw9BYlmoJ2EvGHxUTLAeZQ4x8ykXtQJU86itearwYeYJxmNKsAHhU1lYC5kxeSDK1B9BsUxd/r8JPc7w4gtoEhhbNEUfILsgtZQ1x4lCnhIBPCWNVZjlX04wFdcrSMJPa9cxmEXW+MQrtpPHVNANA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8040.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a09869-e5d6-4f51-1779-08df0d14a0e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 19:17:15.9151 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uI2exhfVwTxkhfRX2oJCwMaF4fDqH5S3CAeLOgQ7wSJo0h3+LIBcXw1dPGNeqUIuoiHHNjEIH9CKMLRZ6YWb9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7708
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

T0ssIEkgZ290IGl0LCB0aGlzIGlzc3VlIGhhcyBiZWVuIHJlc29sdmVkIGJ5IA0KY29tbWl0IGNi
NGFmZGRmOWUwMThhODNmZWM4NjE0ZDhlMzM3ZDMxMzg3MTU2OWYNCkF1dGhvcjogR2FqZW5kcmEg
VXR0YW1jaGFuZCA8Z2FqZW5kcmEudXR0YW1jaGFuZEBpbnRlbC5jb20+DQpEYXRlOiAgIE1vbiBB
dWcgMTAgMDc6MTg6MTQgMjAyNiArMDAwMA0KDQogICAgZHJtL3hlL2xyYzogZG9jdW1lbnQgc2Vu
dGluZWwgYW5kIG1ha2UgQ1RYX1RJTUVTVEFNUCByZWFkIFRPQ1RPVS1zYWZlDQoNClRoaXMgaXMg
YWxyZWFkeSBUT0NUT1Utc2FmZTsgdGhlIGZpeCBoYXMgc2ltcGx5IG5vdCBiZWVuIGJhY2twb3J0
ZWQgdG8gdGhlIGludGVybmFsIGJyYW5jaCB5ZXQuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gRnJvbTogWWFvLCBKaWENCj4gU2VudDogRnJpZGF5LCBTZXB0ZW1iZXIgNCwgMjAy
NiA4OjQxIFBNDQo+IFRvOiBOZXJsaWdlIFJhbWFwcGEsIFVtZXNoIDx1bWVzaC5uZXJsaWdlLnJh
bWFwcGFAaW50ZWwuY29tPjsgQnJvc3QsDQo+IE1hdHRoZXcgPG1hdHRoZXcuYnJvc3RAaW50ZWwu
Y29tPg0KPiBDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBMaW4sIFNodWljaGVu
ZyA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIGRybS94
ZS9ndWM6IHNraXAgVERSIHRpbWVvdXQgY2hlY2sgd2hlbg0KPiBjdHhfdGltZXN0YW1wIGlzIDAg
b3IgMQ0KPiANCj4gSXQgZG9lcyByZXR1cm4gMS4gIEkgZ290IHRoZSBsb2cgd2l0aCBmb2xsb3dp
bmcgcGF0Y2ggZW5hYmxlZC4NCj4gdTY0IHhlX2xyY190aW1lc3RhbXAoc3RydWN0IHhlX2xyYyAq
bHJjKSAgew0KPiArICAgICAgIHU2NCB0aW1lc3RhbXA7DQo+ICsNCj4gICAgICAgICBpZiAoeGVf
bHJjX2lzX211bHRpX3F1ZXVlKGxyYykpDQo+IC0gICAgICAgICAgICAgICByZXR1cm4geGVfbHJj
X211bHRpX3F1ZXVlX3RpbWVzdGFtcChscmMpOw0KPiArICAgICAgICAgICAgICAgdGltZXN0YW1w
ID0geGVfbHJjX211bHRpX3F1ZXVlX3RpbWVzdGFtcChscmMpOw0KPiAgICAgICAgIGVsc2UNCj4g
LSAgICAgICAgICAgICAgIHJldHVybiB4ZV9scmNfY29udGV4dF90aW1lc3RhbXAobHJjKTsNCj4g
KyAgICAgICAgICAgICAgIHRpbWVzdGFtcCA9IHhlX2xyY19jb250ZXh0X3RpbWVzdGFtcChscmMp
Ow0KPiArDQo+ICsgICAgICAgaWYgKHVubGlrZWx5KHRpbWVzdGFtcCA9PSBDT05URVhUX0FDVElW
RSkpDQo+ICsgICAgICAgICAgICAgICB4ZV9ndF9ub3RpY2UobHJjLT5ndCwNCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAiVkxLLTg5ODI2OiB4ZV9scmNfdGltZXN0YW1wIHJldHVybmVk
DQo+ICsgQ09OVEVYVF9BQ1RJVkU9MVxuIik7DQo+ICsNCj4gKyAgICAgICByZXR1cm4gdGltZXN0
YW1wOw0KPiAgfQ0KPiANCj4gW1NhdCBTZXAgIDUgMDM6MjA6NTMgMjAyNl0geGUgMDAwMDowMzow
MC4wOiBbZHJtXSBUaWxlMDogR1QxOiBWTEstODk4MjY6DQo+IHhlX2xyY190aW1lc3RhbXAgcmV0
dXJuZWQgQ09OVEVYVF9BQ1RJVkU9MQ0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+IEZyb206IE5lcmxpZ2UgUmFtYXBwYSwgVW1lc2ggPHVtZXNoLm5lcmxpZ2UucmFtYXBw
YUBpbnRlbC5jb20+DQo+ID4gU2VudDogRnJpZGF5LCBTZXB0ZW1iZXIgNCwgMjAyNiAzOjM1IFBN
DQo+ID4gVG86IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gPiBD
YzogWWFvLCBKaWEgPGppYS55YW9AaW50ZWwuY29tPjsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOyBMaW4sDQo+ID4gU2h1aWNoZW5nIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT4NCj4g
PiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0veGUvZ3VjOiBza2lwIFREUiB0aW1lb3V0IGNoZWNr
IHdoZW4NCj4gPiBjdHhfdGltZXN0YW1wIGlzIDAgb3IgMQ0KPiA+DQo+ID4gT24gRnJpLCBTZXAg
MDQsIDIwMjYgYXQgMTE6MTg6MzdBTSAtMDcwMCwgTWF0dGhldyBCcm9zdCB3cm90ZToNCj4gPiA+
T24gRnJpLCBTZXAgMDQsIDIwMjYgYXQgMDY6MDk6NDNQTSArMDAwMCwgSmlhIFlhbyB3cm90ZToN
Cj4gPiA+DQo+ID4gPitVbWVzaA0KPiA+ID4NCj4gPiA+PiBBIGN0eF90aW1lc3RhbXAgb2YgMCBv
ciAxIGluZGljYXRlcyBhbiBpbnZhbGlkIHRpbWVzdGFtcDoNCj4gPiA+PiAtIDEgKENPTlRFWFRf
QUNUSVZFKSBpcyB0aGUgY29va2llIHdyaXR0ZW4gYnkgdGhlIFdBIEJCIGltbWVkaWF0ZWx5DQo+
ID4gPj4gICBhZnRlciBhIGZ1bGwgY29udGV4dCByZXN0b3JlLCBiZWZvcmUgdGhlIHNwaW5uZXIg
aGFzIHJ1bi4NCj4gPiA+PiAtIDAgY2FuIG9jY3VyIHdoZW4gbHJjLT5jdHhfdGltZXN0YW1wIHNo
YWRvdyBpcyB1bmluaXRpYWxpemVkIG9yIHdhcw0KPiA+ID4+ICAgbGFzdCB1cGRhdGVkIHdoaWxl
IHRoZSBjb250ZXh0IHdhcyBiZWluZyByZXN0b3JlZC4NCj4gPiA+Pg0KPiA+ID4+IEluIGJvdGgg
Y2FzZXMgdGhlIHRpbWVzdGFtcCBpcyBub3QgeWV0IHZhbGlkLCBzbyByZXNldCB0aGUgc2FtcGxp
bmcNCj4gPiA+PiBiYXNlbGluZSBhbmQgd2FpdCBmb3IgdGhlIG5leHQgY2hlY2tfdGltZW91dCgp
IGNhbGwuDQo+ID4gPj4NCj4gPiA+PiBTaWduZWQtb2ZmLWJ5OiBKaWEgWWFvIDxqaWEueWFvQGlu
dGVsLmNvbT4NCj4gPiA+PiAtLS0NCj4gPiA+PiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19z
dWJtaXQuYyB8IDE0ICsrKysrKysrKysrKysrDQo+ID4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBp
bnNlcnRpb25zKCspDQo+ID4gPj4NCj4gPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+ID4+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19z
dWJtaXQuYw0KPiA+ID4+IGluZGV4IDBhNmUyYjgxYjVhNS4uY2FmMDJkMjY1NTMzIDEwMDY0NA0K
PiA+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gPiA+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gPj4gQEAgLTE0Mjks
NiArMTQyOSwyMCBAQCBzdGF0aWMgYm9vbCBjaGVja190aW1lb3V0KHN0cnVjdA0KPiA+IHhlX2V4
ZWNfcXVldWUgKnEsIHN0cnVjdCB4ZV9zY2hlZF9qb2IgKmpvYikNCj4gPiA+PiAgCQlyZXR1cm4g
eGVfc2NoZWRfaW52YWxpZGF0ZV9qb2Ioam9iLCAwKTsNCj4gPiA+PiAgCX0NCj4gPiA+Pg0KPiA+
ID4+ICsJLyoNCj4gPiA+PiArCSAqIEEgY3R4X3RpbWVzdGFtcCBvZiAwIG9yIDEgaW5kaWNhdGVz
IGFuIGludmFsaWQgdGltZXN0YW1wOg0KPiA+ID4+ICsJICogLSAxIChDT05URVhUX0FDVElWRSkg
aXMgdGhlIGNvb2tpZSB3cml0dGVuIGJ5IHRoZSBXQSBCQg0KPiA+IGltbWVkaWF0ZWx5DQo+ID4g
Pj4gKwkgKiAgIGFmdGVyIGEgZnVsbCBjb250ZXh0IHJlc3RvcmUsIGJlZm9yZSB0aGUgc3Bpbm5l
ciBoYXMgcnVuLg0KPiA+ID4+ICsJICogLSAwIGNhbiBvY2N1ciB3aGVuIGxyYy0+Y3R4X3RpbWVz
dGFtcCBzaGFkb3cgaXMgdW5pbml0aWFsaXplZA0KPiA+ID4+ICtvcg0KPiA+IHdhcw0KPiA+ID4+
ICsJICogICBsYXN0IHVwZGF0ZWQgd2hpbGUgdGhlIGNvbnRleHQgd2FzIGJlaW5nIHJlc3RvcmVk
Lg0KPiA+ID4+ICsJICogSW4gYm90aCBjYXNlcyB0aGUgdGltZXN0YW1wIGlzIG5vdCB5ZXQgdmFs
aWQsIHNvIHJlc2V0IHRoZSBzYW1wbGluZw0KPiA+ID4+ICsJICogYmFzZWxpbmUgYW5kIHdhaXQg
Zm9yIHRoZSBuZXh0IGNoZWNrX3RpbWVvdXQoKSBjYWxsLg0KPiA+ID4+ICsJICovDQo+ID4gPg0K
PiA+ID5UaGlzIGlzbid0IHJpZ2h0LiBgY3R4X3RpbWVzdGFtcGAgaXMgdGhlIDMyLWJpdCB2YWx1
ZSByZXR1cm5lZCBieQ0KPiA+ID5geGVfbHJjX3RpbWVzdGFtcCgpYCwgc28gMCBhbmQgMSBhcmUg
dmFsaWQgdmFsdWVzIHdoZW4gdGhlIHRpbWVzdGFtcA0KPiA+ID53cmFwcy4gSWYgeW91IHdlcmUg
Y2hlY2tpbmcgdGhlIGZ1bGwgNjQtYml0IHZhbHVlLCB0aGVuIHRoaXMgbWlnaHQNCj4gPiA+bWFr
ZSBzZW5zZSwgYWx0aG91Z2ggSSdtIG5vdCBjb252aW5jZWQgb2YgdGhhdCBlaXRoZXIuDQo+ID4g
Pg0KPiA+ID5NeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgYHhlX2xyY190aW1lc3RhbXAoKWAgb25s
eSBpbnNwZWN0cyB0aGVzZQ0KPiA+ID5zcGVjaWFsIHN0YXRlcyBhbmQgdGFrZXMgYWRkaXRpb25h
bCBhY3Rpb24gd2hlbiAwIG9yIDEgYXJlIGRldGVjdGVkLg0KPiA+ID5BcyBhIHJlc3VsdCwgdGhv
c2Ugc3BlY2lhbCB2YWx1ZXMgc2hvdWxkIG5ldmVyIGJlIHByb3BhZ2F0ZWQgdG8gdGhlIGNhbGxl
ci4NCj4gPiA+SW4gb3RoZXIgd29yZHMsIHRoaXMgaXMgbm90IGEgcmF3IHRpbWVzdGFtcCByZWFk
LCBzbyB3ZSBzaG91bGRuJ3QNCj4gPiA+bmVlZCB0byBoYW5kbGUgdGhvc2UgY2FzZXMgaGVyZS4N
Cj4gPiA+DQo+ID4gPlVtZXNoIHRvIGNvbmZpcm0gbXkgdW5kZXJzdGFuZGluZyBpcyBjb3JyZWN0
Lg0KPiA+DQo+ID4gQWdyZWUsIHdlIHNob3VsZCBub3QgYWRkIHRoaXMgY29kZSBoZXJlLg0KPiA+
DQo+ID4gRm9yIGFuIExSQywgY3R4X3RpbWVzdGFtcCBvZiAwIG1lYW5zIHRoZSBjb250ZXh0IHdh
cyBuZXZlciBzY2hlZHVsZWQNCj4gPiBpbnRvIEhXLiBXZSBjYW5ub3QgdHJlYXQgdGhhdCBhcyBp
bnZhbGlkLg0KPiA+DQo+ID4gV2Ugc2hvdWxkIG5ldmVyIHNlZSBhIDEgcmV0dXJuZWQgZnJvbSB4
ZV9scmNfdGltZXN0YW1wKCkuIDEgaXMgdXNlZA0KPiA+IGludGVybmFsbHkgdG8gZmV0Y2ggdGhl
IHJpZ2h0IHRpbWVzdGFtcCB0byBpbmRpY2F0ZSBob3cgbG9uZyB0aGUNCj4gPiBjb250ZXh0IHJh
bi4gSWYgd2Ugc2VlIGEgMSBoZXJlLCBpdCdzIGEgYnVnLiBGb3IgYSBicmllZiBwZXJpb2Qgb2YN
Cj4gPiB0aW1lLCBzdWNoIGEgYnVnIGV4aXN0ZWQgaW4gdGhpcyB0cmVlLCBidXQgaXQgd2FzIGZp
eGVkIGluIGJlbG93IGNvbW1pdDoNCj4gPg0KPiA+IGRybS94ZS9scmM6IGRvY3VtZW50IHNlbnRp
bmVsIGFuZCBtYWtlIENUWF9USU1FU1RBTVAgcmVhZCBUT0NUT1UtDQo+IHNhZmUNCj4gPg0KPiA+
IFRoYW5rcywNCj4gPiBVbWVzaA0KPiA+DQo+ID4gPg0KPiA+ID5NYXR0DQo+ID4gPg0KPiA+ID4+
ICsJaWYgKGN0eF90aW1lc3RhbXAgPD0gMSkgew0KPiA+ID4+ICsJCWpvYi0+c2FtcGxlX3RpbWVz
dGFtcCA9IFU2NF9NQVg7DQo+ID4gPj4gKwkJcmV0dXJuIGZhbHNlOw0KPiA+ID4+ICsJfQ0KPiA+
ID4+ICsNCj4gPiA+PiAgCWpvYi0+c2FtcGxlX3RpbWVzdGFtcCA9IGN0eF90aW1lc3RhbXA7DQo+
ID4gPj4gIAljdHhfam9iX3RpbWVzdGFtcCA9IHhlX2xyY19jdHhfam9iX3RpbWVzdGFtcChxLT5s
cmNbMF0pOw0KPiA+ID4+DQo+ID4gPj4gLS0NCj4gPiA+PiAyLjQzLjANCj4gPiA+Pg0K
