Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EA1C83F26
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 15:53:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51DB10E07B;
	Tue, 29 Jul 2025 15:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gXrbM16H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EFEB10E07B
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 15:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753804433; x=1785340433;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7FjUEuYI5Lz0aYRRgvQV9/YyIki1i7SHwr9Q93bbrQs=;
 b=gXrbM16HoUknYB1R/sUWZqGr8bR1ls4JCuJ6AsZxTVtMEphPRrAnHQNt
 /pPA/RiimKu6DxLsSRRceO7NumdNqvizdQ3Tkfui+mZ4RuTl9ywuZexB/
 XNfFo5I5IfZWOOgHTVIriP3heJWv4UuSd3s8wR/7JdI7Lnb5XXnRVxhn9
 SodIL6cH37KjkDH5Y5BoiYJjB4JSjKtDAmISUiga6nq+tWrTYQsIkQK+U
 Vzl4JsLJEPtfbxsgYeL5TOXAiSLUvPAB5PFTWZD1Lmflmupa1BZn57mpt
 oNdugG2vTpNr1kEo2/S2nXQcLlSAksZGJJyAGAa2bp2reDUx/7uLwMq+U A==;
X-CSE-ConnectionGUID: E7BnuScdTkWdbWuL30eNLg==
X-CSE-MsgGUID: Ve/hD7WXSbSLEFKO7HD3mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="73668137"
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; d="scan'208";a="73668137"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 08:53:52 -0700
X-CSE-ConnectionGUID: CO7OUb9XSgqSv5AU8FnS0Q==
X-CSE-MsgGUID: t1Lc0T8NRG6/yo3AsJs0bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; d="scan'208";a="168141596"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 08:53:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 08:53:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 08:53:51 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 08:53:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZpOmfmhiZLI3VwO2xhQ53OaVwbzxcWqPOV53BYtvECtDsh0sGwqqaAqISVzuwS9ayu6Fa7p/wcxVKKISmkRlpB8vyAbQMCwguhvkYU+I7pfONHP6xaTHCE3XvH/GxjcOLZncwzCBI38YV77ex8dWy+dzX1U8DgU71st7a1ZpbKO2RUR3O1pJ72iaKDN7pgQXgWQvl/ijMU0/qcUT8plW3sot1+0prWK7SWdUVIXqbrraReDF06qfglQ5Pdr73LxxzLyrRJ7Gic4R+u+nzTE01FUroSU1OposPfm0XB7RujIxdGDOrnZsRko9VVTbl3X934w0wBT/90OvzE+3tXzxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6CXXObJaSKWT6XIxq0ecS+xYkIq2dXCaDu8pWqve/A=;
 b=VbncHdFqzqtuz8gC8rgvbRxrL12twq+2lUkgWDsuHJ5MvanA8y+lc09MgKdAyfpDiDkMhtcDF3Tr5mcGgSp93fRD0W6c+kTXOlnbk/c03+vM3sb8pCfDMRMfUS/duO4UGdq0QgHSRqvHgiPwsQfnnOhYnmBVoBdUmcpBXwEmUn65IuBIwSiQsknJKbM/7qzaAuImgXsFf5wERCTL70KhW6d9XjKbkzKQf6bgOHnvcwyEIpcnwvJjAt4VRgL+BynMBxVB8AuvRVo4V7h3SooAzNQV23FXMyd3SAs5Shf+VLnCeWGMDf6zfE0cLpqk7YcDDI5yPTS80fk7EGJvKeLdhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7880.namprd11.prod.outlook.com (2603:10b6:8:f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 15:53:47 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8989.010; Tue, 29 Jul 2025
 15:53:47 +0000
Date: Tue, 29 Jul 2025 17:53:43 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v4] drm/xe/vf: Fix VM crash during VF driver release
Message-ID: <20250729155343.sqp73jhxarjdypag@intel.com>
References: <20250729120720.13990-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250729120720.13990-1-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: VI1PR09CA0159.eurprd09.prod.outlook.com
 (2603:10a6:800:120::13) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7880:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fd7641d-3fc9-4fe3-4fb7-08ddceb81a49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODBGeFN5VWJwSzIyU3FTOWVTNWthalRGVjFWNkU1MFBFTG9ycTJ3SU1PRmlj?=
 =?utf-8?B?Ky9vUjIyRG54Y0x2ZWdQbkZEV2hLR0N5TlVOTjIveTdjaGVVOUtiU1BDbnJi?=
 =?utf-8?B?S2RFUmg3S0w1MExrY0x1YmdGb0NUVlRCdW1MbzhTOExGRm5iMHhvN1QrOHJr?=
 =?utf-8?B?MmVlb01ua0REdjc2NWFwMUc1WVFVZWJwdGl4S3hvcGNKd2RsY1FoSFZMUkc4?=
 =?utf-8?B?Yk9SLzZaSHlTanlPYlJLZ2tCdjZ6djdPeXg2RDBDWUZzQWprZ3dhNklmWkFO?=
 =?utf-8?B?KzJyMytDSEFSYnFHMG83blVDNjN6bEJkNG5RN0lUL1l6S1dEVGd4VWh6Mk1q?=
 =?utf-8?B?NWZFUldtZU92TEtjcEF6cDRYMjhqSlJQVGl0cVdJY2c5VDZKYTEwbXZhWCtP?=
 =?utf-8?B?ekVMR2ppQXNYbmh1c2VwRGIwd0h1ckNCV2FzRmVTSjQ5OWZPYzMwV2l1WXdH?=
 =?utf-8?B?N2pMV3c2dnViNHFSL29wZGJyN3daZnpSNmRxRGJZUUFjcFpRNXQzT1dZQUZY?=
 =?utf-8?B?cWNQVmJnSG1hZGVTWkl4K2FqVkhDMkJNTmRPSGd2V0xxajBDK0ZjcEgxb0sw?=
 =?utf-8?B?Y0tndnphZWVucDVSOEt5bkh2SkMvdUZ1L3l4VlFOUXY4WCtuM1Jadjgya3Y3?=
 =?utf-8?B?UkFUZ3VsWTdGV0pzYTFNeUZMSmhTUlNoODdNQVhackkwMk1LTjRvNDViVFRo?=
 =?utf-8?B?Mm9Ddys4S0ZsL0oyTzVEdnRUOEp2cjJJNGZKbC92ZVpjUkM2UHIyQ2hHT2U3?=
 =?utf-8?B?MDd5cUVjbmVaWVFJd2hrTHBCVm1aRUVIWk95UE5jajhsR2RndTNvY1MyZmxU?=
 =?utf-8?B?SGdJanhBY2VBOXpKSnk4L2dJcmFnUzMwb3VQdlVwZUpVNldjY3FJaHdDQ25j?=
 =?utf-8?B?L3k1a0FiRUkvVU0wdktUTE9HRU5SSnkzVWl5bk9iTytXRTdob2dleG9kV3VX?=
 =?utf-8?B?ZEtPdDdMTEcrRTRZcTFBZjBRdVdkK0NKalZidlQrekRZYmI3Tmc4MytkZVdB?=
 =?utf-8?B?bnh1RTNiNnVmcHhKM3dZTGtZcWdsUkxRRlpXWVZMTWE3K1hUWUhmbDQyb21q?=
 =?utf-8?B?UXlHeHFRWmdqK0VGcTVnVmVqVWE4dzdhdmJmV04vN1NxQTlMNnQyelhoa0Jp?=
 =?utf-8?B?dnpNeFVDdmdrMXRzZ2J5ejMvWUpRaXdQR3BweVM1ODkwYjBiZWczTHY3d1pO?=
 =?utf-8?B?SFptT3JNUUtNaEFQS2dpeXZTSEQ4MXFDSGhIYWhEL2F0LzZzc3U5SDdXNVlZ?=
 =?utf-8?B?SXhUSXE3ZzdERUdXYkZmWE9lMG9NczFLRjlXbFRSOEdQMTFlYUdONFBmWEFi?=
 =?utf-8?B?WG5WeEE3TnNSSmFVN0gxbTMzL090eHhodTR2cEpDL1lMMjRZOUh2WXRXcHZO?=
 =?utf-8?B?TEUwZUYrVEN2dXl3K3R0YS81bmVtcEpCamtIZk9pZVJkTUxHc1F5dGQzRlR3?=
 =?utf-8?B?dkpVT3BDU2N4SFc4d3U2WTJmQUVTMHcwSEx2VlJuNWtRdFVKdUJLNEdGbTRB?=
 =?utf-8?B?c3Y2Mnhta0p3aWdkdFpHVFJxM0J0bjZMOEQ4L1lYMmpuU1gvalUvQ3F0RVNp?=
 =?utf-8?B?Y1ZUY2w4RmpYblFCSTRyTjk1czFIb05IemFGbFhrOFFIZmlYZWJOYmFENEk0?=
 =?utf-8?B?ZUtLeWxjVlIzbDhYTThoVE9mV3ZWbjZPUXJkRit4eWdxaUZrdm40bGF5NGl3?=
 =?utf-8?B?cFNTWFRqTVMybk02cm5iVFhWeWpRTS9ONENRTlFPcnhhc3IxangzREI2MExX?=
 =?utf-8?B?U0JoZ0lmaHBPRG9Jdk1vQTIxekJySkJteUlINGxYbHZ0L0w0QXZNb2FxMklF?=
 =?utf-8?B?NDQzVzZmUVlnTlRkdFlJRzNKdWRuTndtMjhkL2lubWk2Z0dCRE02UWdSUDZE?=
 =?utf-8?B?dWdrYVNvbTRiSmNyOWxJRTNHcFE3YzRsVTIxbHNIcFlHMHlDbWVraWtoZDNj?=
 =?utf-8?Q?C3nZJHeJFyk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1Z3MDR5NUppQit4RzY0N0xWL3IwcUFLa3dnYS81MXhkc1lGSDUzTEtTd0Nt?=
 =?utf-8?B?S2d4dW9Uekg1UzVUcXR2Rm9kdTBtQVBVd2ZhWEhxclZrWndFWFVDZmhDeFYx?=
 =?utf-8?B?aTRzaitMSHZWc3FOcXlMT09PdWlnK0k3SVY0TXp5Vm5WSFVlb0V2MHFlNm84?=
 =?utf-8?B?bWdSbG9VOWpVVVZBZTJIMUd6VTdGUEZUR2RVWXZYUjFUaENzSzJ0NnZ1M3Qy?=
 =?utf-8?B?bGtPY0N0SDFUN0tpc0tRTEt0djQ3cWtBZnVRWkJHZG5lcXdCNy9NV1Zzcm9m?=
 =?utf-8?B?MHQvWnVIbnJobXFuWThlL2Zickg3ZG53WlNKRnJidVZNQTh6YXNxYzF2WEpU?=
 =?utf-8?B?RlVqZW5yMU4wUDVDRFZSbkpzQzVKdEVGSDBRZSs2ZDFBdldrRUppRUF4SDZC?=
 =?utf-8?B?N0htL1hBWUlRVDNCcjlSL2gzWHNaeSs3RXRxd0d6ZjRXL2xJSGxrL1I3ejBa?=
 =?utf-8?B?MEFZQ2I2c0NtTUF5UjhKeG15UjVaVWc5WXlUYjZ6cDI5WHNzTHlvSWM1NnJT?=
 =?utf-8?B?cE5nbmcxaERUdENTejBqNFJqMFhxS1lDcVdQU25jZ1lhWE5nK0h0NjF5UWxR?=
 =?utf-8?B?ek5UM3Fzci95MnFZUlpDNEhkQXQ4b0tTalRCTnplakNsdFVFOGVGK2ZYR2lh?=
 =?utf-8?B?UEtsUXRCSkxOdE5jOG9CWWMySGZrZm9ydXF1c09YTVRtemhlK2ROS1FzVWl5?=
 =?utf-8?B?ZVR0YmxTblRwWnJhTUM4Q2o3UTJFbEFwWXJFLzNyeGtwT1RqZDd5aDE5ai8v?=
 =?utf-8?B?S1JRako5Tmd6NmlrNUpYZkRDbVVUZElXTDg1ZmVPZ2xWY2NlT0NLTzBWVzZs?=
 =?utf-8?B?S28yVTJtWW9UeHVqL2tEMm5BRmVEMjJ5UitUcGJIaVc4VGNlN1BvR0orVWpY?=
 =?utf-8?B?RTFCSzNVWHhVdHNBZWEzTVVKTkp0cWpaTmJzN0owN3U3TGVEdG9ta2tLMCtV?=
 =?utf-8?B?clVkSVhxRmtSbzdHcnZRWlR6SEFLU0srTElMN2tXb2xVK0lGM3JTNU1LNU51?=
 =?utf-8?B?WmZEUHNZdWYyK0QwcnJudjVIc2k2UGxseUExRU55WnlKelErZ3l4QXpLRHoy?=
 =?utf-8?B?NmRYQmxvcVA4d3hBZEVrQnMrNXAyenZsd2ppYkxBaUppalJ5czJtajdkNDhM?=
 =?utf-8?B?bnhFNDZTcHhQajRoUlZBTHhOWWkyQkVuUmJkSzJKbEFJZVdkRzZsU3d6WEtw?=
 =?utf-8?B?YmllNUh4cUMvdUFOeEJ2cVpWMDFuSE9KcDZ2YjlsdlhrQmtSejNvU1BiYlR6?=
 =?utf-8?B?b043WHA0OWJ0ck9uWldOOTdLellHWlJTZy96N0hiWDhHV0ZaNG5iZ1NMbWlS?=
 =?utf-8?B?QVJaU0pnOHlxSnlSRmoxWWVtMnJiOE1Qb09kNWhLcGxVc2hvZHRlYm1QbDFV?=
 =?utf-8?B?dS9yZ1pHWnlXYnNHZ1lkTENHYURnVUJVK3V1NG5yM2N5dkRvelR1VlVTaXJN?=
 =?utf-8?B?ZGxrazFXRWJBajlkcmZyVGZkazdiOXpqUUFlMGJwYXhPRCtSem1tVmNXeHFO?=
 =?utf-8?B?Y0RFdHdGcFRiWHQ4dkx2SXRrSVU4SE1HRVdxOURwMXB3SktwRGZYR3cwWlRW?=
 =?utf-8?B?enBVL0lpTnkvTWdrRUljTDlEV0dySWZ1RDFTSytVODdydmExdkFEUzFONStx?=
 =?utf-8?B?OWR2OVJkRUFYQ0V5b0tKQ240UnFUNWRrUVpmSGhEQ01PNytWcEpyNGs3WmFD?=
 =?utf-8?B?ZkVBSW5LZDltOGdBSEdLdlo1clhFQmJwSUhiSXdCazJzL0hEQTVYY2wrSVVs?=
 =?utf-8?B?RG55MDYydk92MVNsaHRpcys0SXA3cDRDMU9admF0VkZ6ZkNGUjlMYUVCOG1o?=
 =?utf-8?B?NXJoeG9vQTA3c3M4cHAwVEQ5czhjRyt3U3BrNzFNMmU5MXczc1VPQUMxTHo3?=
 =?utf-8?B?QUhqNmZ5UDJGYk9DNnBUUmtEL2pkZDZrWGREOUlJQ2VJQlo3MjBwMm9zNHd3?=
 =?utf-8?B?eDBkR0VDcEljY25JQWdqM3VsS3ZXRlZacXNjMmQrRVlEZmMrelcydDZ5UFZy?=
 =?utf-8?B?ZGhkZlU1WTA2M00vRmJlUUs3TXFkYlh6azRVMStJR05qTC9SQiszYm9hQlEz?=
 =?utf-8?B?dnpzb2YvNnJjeDhMSURZRXdSbXU5ZFVTN3U3dngxU1B5VEV6R0E4cUlmUVdn?=
 =?utf-8?B?T3ZLS1RGUVY4MjZrQ01DTTlkRmVqaUtWd2N3RmU2cjNaemJrSWYxU1IrMHhJ?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd7641d-3fc9-4fe3-4fb7-08ddceb81a49
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 15:53:47.0614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z9/j3c5kc/mehmlNlfMTObNH9e7cjAt+1ykbrqu7gPLGdlP3yg0DSiqXSHqKFXoWS8Eq/P82IJ+TFRumxtpjlx1LSNOYNl2eAUKEnSVqgHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7880
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

Satyanarayana K V P <satyanarayana.k.v.p@intel.com> wrote on wto [2025-lip-29 17:37:20 +0530]:
> The VF CCS save/restore series (patchwork #149108) has a dependency
> on the migration framework. A recent migration update in commit
> d65ff1ec8535 ("drm/xe: Split xe_migrate allocation from initialization")
> caused a VM crash during XE driver release for iGPU devices.
> 
> Oops: general protection fault, probably for non-canonical address
> 0x6b6b6b6b6b6b6b83: 0000 [#1] SMP NOPTI
> RIP: 0010:xe_lrc_ring_head+0x12/0xb0 [xe]
> Call Trace:
>  xe_sriov_vf_ccs_fini+0x1e/0x40 [xe]
>  devm_action_release+0x12/0x30
>  release_nodes+0x3a/0x120
>  devres_release_all+0x96/0xd0
>  device_unbind_cleanup+0x12/0x80
>  device_release_driver_internal+0x23a/0x280
>  device_release_driver+0x12/0x20
>  pci_stop_bus_device+0x69/0x90
>  pci_stop_and_remove_bus_device+0x12/0x30
>  pci_iov_remove_virtfn+0xbd/0x130
>  sriov_disable+0x42/0x100
>  pci_disable_sriov+0x34/0x50
>  xe_pci_sriov_configure+0xf71/0x1020 [xe]
> 
> Update the VF CCS migration initialization sequence to align with the new
> migration framework changes, resolving the release-time crash.
> 
> Fixes: f3009272ff2e ("drm/xe/vf: Create contexts for CCS read write")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
> V3 -> V4:
> - devm_add_action_or_reset() does auto clean-up. So, remove new clean-up
> code added. (Piotr)
> 
> V2 -> V3:
> - Fixed issue with error handling in xe_migrate_init() (Michal)
> 
> V1 -> V2:
> - Updated xe_migrate_init() input arguments and return type (Michal)
> - Fixed review comments.
> ---
>  drivers/gpu/drm/xe/xe_gt.c           |  6 ++---
>  drivers/gpu/drm/xe/xe_migrate.c      | 37 ++++++++++++++++------------
>  drivers/gpu/drm/xe/xe_migrate.h      |  2 +-
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |  7 +++++-
>  4 files changed, 30 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index c8eda36546d3..5a79c6e3208b 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -564,11 +564,9 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
>  	if (xe_gt_is_main_type(gt)) {
>  		struct xe_tile *tile = gt_to_tile(gt);
>  
> -		tile->migrate = xe_migrate_init(tile);
> -		if (IS_ERR(tile->migrate)) {
> -			err = PTR_ERR(tile->migrate);
> +		err = xe_migrate_init(tile->migrate);
> +		if (err)
>  			goto err_force_wake;
> -		}
>  	}
>  
>  	err = xe_uc_load_hw(&gt->uc);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 90065d7d29ff..3a276e2348a2 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -396,15 +396,15 @@ struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile)
>  
>  /**
>   * xe_migrate_init() - Initialize a migrate context
> - * @tile: Back-pointer to the tile we're initializing for.
> + * @m: The migration context
>   *
> - * Return: Pointer to a migrate context on success. Error pointer on error.
> + * Return: 0 if successful, negative error code on failure
>   */
> -struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> +int xe_migrate_init(struct xe_migrate *m)
>  {
> -	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_tile *tile = m->tile;
>  	struct xe_gt *primary_gt = tile->primary_gt;
> -	struct xe_migrate *m = tile->migrate;
> +	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_vm *vm;
>  	int err;
>  
> @@ -412,15 +412,13 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  	vm = xe_vm_create(xe, XE_VM_FLAG_MIGRATION |
>  			  XE_VM_FLAG_SET_TILE_ID(tile));
>  	if (IS_ERR(vm))
> -		return ERR_CAST(vm);
> +		return PTR_ERR(vm);
>  
>  	xe_vm_lock(vm, false);
>  	err = xe_migrate_prepare_vm(tile, m, vm);
>  	xe_vm_unlock(vm);
> -	if (err) {
> -		xe_vm_close_and_put(vm);
> -		return ERR_PTR(err);
> -	}
> +	if (err)
> +		goto err_out;
>  
>  	if (xe->info.has_usm) {
>  		struct xe_hw_engine *hwe = xe_gt_hw_engine(primary_gt,
> @@ -429,8 +427,10 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  							   false);
>  		u32 logical_mask = xe_migrate_usm_logical_mask(primary_gt);
>  
> -		if (!hwe || !logical_mask)
> -			return ERR_PTR(-EINVAL);
> +		if (!hwe || !logical_mask) {
> +			err = -EINVAL;
> +			goto err_out;
> +		}
>  
>  		/*
>  		 * XXX: Currently only reserving 1 (likely slow) BCS instance on
> @@ -449,8 +449,8 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  						  EXEC_QUEUE_FLAG_MIGRATE, 0);
>  	}
>  	if (IS_ERR(m->q)) {
> -		xe_vm_close_and_put(vm);
> -		return ERR_CAST(m->q);
> +		err = PTR_ERR(m->q);
> +		goto err_out;
>  	}
>  
>  	mutex_init(&m->job_mutex);
> @@ -460,7 +460,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  
>  	err = devm_add_action_or_reset(xe->drm.dev, xe_migrate_fini, m);
>  	if (err)
> -		return ERR_PTR(err);
> +		return err;
>  
>  	if (IS_DGFX(xe)) {
>  		if (xe_migrate_needs_ccs_emit(xe))
> @@ -475,7 +475,12 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  			(unsigned long long)m->min_chunk_size);
>  	}
>  
> -	return m;
> +	return err;
> +
> +err_out:
> +	xe_vm_close_and_put(vm);
> +	return err;
> +
>  }
>  
>  static u64 max_mem_transfer_per_pass(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 3758f9615484..e81ea6b27fb5 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -105,7 +105,7 @@ struct xe_migrate_pt_update {
>  };
>  
>  struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
> -struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
> +int xe_migrate_init(struct xe_migrate *m);
>  
>  struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
>  				     unsigned long npages,
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index af43e04179aa..bf9fa1238462 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -270,11 +270,16 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  		ctx = &tile->sriov.vf.ccs[ctx_id];
>  		ctx->ctx_id = ctx_id;
>  
> -		migrate = xe_migrate_init(tile);
> +		migrate = xe_migrate_alloc(tile);
>  		if (IS_ERR(migrate)) {
>  			err = PTR_ERR(migrate);
>  			goto err_ret;
>  		}
> +
> +		err = xe_migrate_init(migrate);
> +		if (err)
> +			goto err_ret;
> +
>  		ctx->migrate = migrate;
>  
>  		err = alloc_bb_pool(tile, ctx);

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>


> -- 
> 2.43.0
> 

-- 
