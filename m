Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A72ECCA472
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 13:28:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C217A10E80E;
	Wed,  8 Oct 2025 13:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CRY4X8WA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD6710E80B
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 13:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759930095; x=1791466095;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=LMyK41biIrTgM3uQXVUtU8aSaELmdnHvo+fqL+dlOLM=;
 b=CRY4X8WADGJm749jRlJIY4h6a6pf/X7Ac8qnVyKcY3GNnKaaj7CqJYeF
 ncB8eDzWts4ThAKvVuCKrVqhqmbqZo7vetCGamonG8ttS1pFs6MKyGLr5
 xGU1E3gmZ3BXjOlTgwX5Ta0ZmS+fq7yO70iNgQ4cfwgQqxWcKW5VNQ1sD
 bHx8KkSAW+e/Y+LJrLhhf4L00IIuL5Q+ZgTfLVUNmNvpZI+2iLXc2meKQ
 4EhzLzPt5hZUpBdrEfgemVNKfiIQeLZ4j3GmO7q/dEzhI61FVK72N5uqc
 Bth8svLy59kiuXYF1n4xh+KzkesP2zw9JcXXHqi5uqNLVMincWRbRS6rO g==;
X-CSE-ConnectionGUID: 3bxtzXq/SC6KUDBWOimxYw==
X-CSE-MsgGUID: q1q/L7cZRqOKnMJ0baNZow==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62067927"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62067927"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 06:28:15 -0700
X-CSE-ConnectionGUID: pV7+Fw2jSDW5RMTSYsJKYw==
X-CSE-MsgGUID: MwyOYnb4TXyjczDzZe1ErQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="184475879"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 06:28:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 06:28:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 06:28:14 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.23) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 06:28:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uFnZt9sW2yjHL1zjgHp6XvqV0l66WfQJVCrd5le6BwmFbdVK9Ri8IMhhpKIb90WW9CNwhC6jzVZmYfcL4A681c/A7A5WT4LNC3V82fIfyOkxd0DKJ99slXJKHeCnxXOe1QWkijJhnICifEEyJ5sr4oRKwFPE7Zc7Onu47YK9R2aZissKuf/7eMn0CO2FQieAH0sG/tcdpbCfoHTQbnNBXXSwICGqwectAIYtYWhrKkRQ0y4DFc028RkC2x56yBiJtMATUL5ob+ZhmBJdvM18PdrPQ34lLjXz2eYIgpfI8g74H7rcPRyE63+0N7eDXcndvuLNH2fcZGm2c9m3KxD3LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SlYpBvtco8FSJW8E+Z4kdZfw0oNd8Eo+FVPNPR7Qo0=;
 b=FxiNz/ytKPUqBz/2kv0khdaY8M9pFHcHSNAq8fFM9QUsFq3ECeO2sGwyQnMtY3qATdUwlvmZyZ4PtMT2Xxg4Zxaygncv0H470Szo+YSCGTj7iFDSUMdzTV8nqT0u24VbUnykYLYzp7r7mdF7xyXQrw4RnD2sV8nH/AEY4mQ7EOV0u3C2j2j9lfKAQXu7XKGGKZZcK2+4iTX4Eka5oLOf5tRP6FT4S/dirxrM+sXxOOWG2SipI6gczbex+prP7x3XYFOJ8NKsUp0ctTXOU5T3rdDmIj9WzTlk8UOBQux3WV4gCcBPyL2o+ZPV5YOVVWKtfJVVRi71FYdrWcoPs7cXcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS4PPFCAADA7A6C.namprd11.prod.outlook.com (2603:10b6:f:fc02::4d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 13:28:11 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 13:28:11 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251007204829.1468209-29-matthew.d.roper@intel.com>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
 <20251007204829.1468209-29-matthew.d.roper@intel.com>
Subject: Re: [PATCH v4 04/23] drm/xe: Move 'vm_max_level' flag back to
 platform descriptor
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Wed, 8 Oct 2025 10:28:08 -0300
Message-ID: <175993008801.201562.9741607596597062253@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:40::15) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS4PPFCAADA7A6C:EE_
X-MS-Office365-Filtering-Correlation-Id: 29aca499-084a-43b5-7384-08de066e86b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmJaTVJ6eE9lVDd1L0Nnb0ovaVR0SjdFcG0zZm5EdGl1bmcxZURuaFZtckNC?=
 =?utf-8?B?dlJYS1hyaG54cHVGWEpISTFrQlM4ZlA3MXp5SVo5SmJsRFc3dXVHWE94Njh6?=
 =?utf-8?B?cmpMbjdhd0JGbW9FNGU2QjBuWFArN0xGTGFrbzR1cUo5RWsxbEJrQys1S0ln?=
 =?utf-8?B?YlhVVzVrUWRDSnhrNWlQYktmYmo1NjF1SDlOQ1ZzOHIxV0lZejh3dVVJOHJS?=
 =?utf-8?B?NjVNekVUMlpzdGFSVE13TStQbnVIQ0pmWVc5WXdER1NpLzdqOHprZWxmcXlW?=
 =?utf-8?B?bzR0aitseUh5RFZiZG1VOVErMDNSdXFZNjllb0EyWFIwd1Jvclk3VW5lSmxB?=
 =?utf-8?B?dHNEakF6dGJCNkJXK0ZQTktaZ1NZNk9RTmpvdUVYbktmdVlIeFAwU0hENEtw?=
 =?utf-8?B?dkwzZ2M1WXhwdWNURm1ERlhNK2tGMWJLVktpMERtMkF2c1BUdG9XZ081OG5h?=
 =?utf-8?B?MWpydkthZXZvN2pINXBYd1FzRHFmSzVqQ2QrTEcrVi94THlhcEN5V1U3dkJ1?=
 =?utf-8?B?SVdyQkJrMWFvY25rRnErT0RNZmtzc2xHZmFUeFgzeGdMd1FJSk1ySTVFK0Zn?=
 =?utf-8?B?b0QyZUE1c1J3cjM4WklsMDhQZHlDTWpwS0xiQmxEWStlVzNUVDd3djBzc2ZZ?=
 =?utf-8?B?ekZjWEQrdVdjMkFQOUliME1vTGNFdnJTQUxmMEdHM0p1V1p0eWdrS2ZncjZ2?=
 =?utf-8?B?WGxjcExnTTJvM3ZBVjlYcHVsaytxT1ppYmxPWnFuUmExOTNmOFlsQnIva2Jm?=
 =?utf-8?B?YVB1Ny9sT3JBYnltNGtIWnZwdmZvaGU1b3dOdVFSNE5HRlRxZU5XWVFGOEpm?=
 =?utf-8?B?K3ZyZm4yRDh5OXlMMnE2ZDQ1aC9mVTNtQmVjL08vRmdOeXppT3RhTHFTVkYw?=
 =?utf-8?B?MGJsRFhqczJjejAvZThVM1RTREE4WlBKUTl0TEZ5V0I1WVdxZnBsdmJMM2RX?=
 =?utf-8?B?WFJaVTc5Ymk2dHZDR3psc1J3YnRNK0xpU2MrNTlhbS9aQy9sY0h0M3dyRWkx?=
 =?utf-8?B?d3VLN3lkZTlEUXVIUGZaem9hQUFVQlZkTjhaUnA1cDRwS3lINGEycVZSVi9z?=
 =?utf-8?B?NmwwUGc3enRrNGJqK0llbDM0eXlPL1BsclJqM0EwWGVrR3JNOFZkRUFSUHdM?=
 =?utf-8?B?Z0gwR09BUHZxZXhIWWNBbE1KQnNrWjBEY2dBS2pma01WWTlyT1FqUjFaU1Vs?=
 =?utf-8?B?ci9LRW1UTVJXcnU3SlRjVmVsWWo1YjNyajE2OEt1VjFERVByRy9zY0NiZGIw?=
 =?utf-8?B?T3ZYTVpxbWNieDJVZVQ2TVhvYU4yOEVCdzJMNURKblJBck5HK00rWHYzNXVi?=
 =?utf-8?B?TVNKNnR5Q1poYTdjdFJMeE8weDc5SjhudUZXSDRoMnNKdUJ2UTM0OWZjdENt?=
 =?utf-8?B?ZjBlMXhBbTIwdWYwaHE0VVp1TlA1MUUzR0VsOGJmcS9qUVFwZ01sQzZiL0U3?=
 =?utf-8?B?cU92RDR4NFJGcHJtVitrZHpnSmt2VmFPS0xRZXJscnQzRjJtaXFKY21MM0pH?=
 =?utf-8?B?d0xDYnZSckE3bWJncmFlYm0rVHoxTDlsSE9CRUF1TnN1a1F6bTRWZTBrQ3VT?=
 =?utf-8?B?eWZZLzd0WWxmUkh2NEFNSjlMaEJLZy8xU2ZGb05QOWtqVDZ2NHNrT1gxNDcr?=
 =?utf-8?B?U0FaZzNRSjJ5OFVJU2lhSlJXOUJHK0M3WGJTNUdkYVBHd1dlMDNQamM0UXdm?=
 =?utf-8?B?REZQMjlyWElidU8ybTlTYStRZlFMMUJzdmtQakpOTFZEZzBxUW9jRG9DRFJF?=
 =?utf-8?B?K1k5aFdUNVVYU2N3TWJyTUt2QWtFL2ZYcGNMMnl5MVEwTCs0c0ROMDRyczFI?=
 =?utf-8?B?dElGQXpYMWRNVUlqM3FSWEd4L1lzV2NRRjVBVnRCTlNHSGlrSlVyUjdJUUJR?=
 =?utf-8?B?bStiT2ZqQ1pWdkp3cTAvRHBSVnlqd3grdUdacXAxMXV0MzY4Tyt0dGRwQ2JC?=
 =?utf-8?Q?FSoJf6LzypbONFpj8fKyS2nsfg7f9hIL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0M5cHl1cFF3Z1VyU2s3WGZxVmhNVDJiS3h1MGVhZjhlVm1yTVdkSnEwNkl6?=
 =?utf-8?B?VEpGZlUvNDgxd0hPMVhHVElMbVR2RldsQVhvbFlUK2VyQ0tlWXRqZEhKanNm?=
 =?utf-8?B?YnRRREJMbTBydC9jRDNQRElhQ1pTc3VwSkdEN0RQOUhjcnpCV1ZnaFh2S1pF?=
 =?utf-8?B?L2Z3cWc5UFREeXEvdVR4T1lwVnNub2l3RWVkczJncVZweVlGTHNIbjVXRVc1?=
 =?utf-8?B?Um1mRWFPcjRPM0R1MldqaDZWZzRoNzdYZFNoKzI2dngxbE1mMDRCTUhGWjBN?=
 =?utf-8?B?d1gwWEFHbjdMZXRuTGdUcEg5cEwvdUs3eWgyOVVHbjU4STJYUUswa0dCSlFl?=
 =?utf-8?B?aDhYTWUyalh3cWpBOE14WW9VN1lsbFFnNGNDZ29ZZSsxZlNuYTg2dCtLZ290?=
 =?utf-8?B?ckh1dE1zNXJYVlpyeFdZU2JVWmkwazAzZm9rZTJtVGRhb0J2UTRDMURSTzhl?=
 =?utf-8?B?MVFVNjMyWmRxTXhLOTdNQjl0aU5NZExtVllNbkpIVmVHcGJjRndRRXRKdlQr?=
 =?utf-8?B?T2RTZFVIL3RSdlRJeFRNaUd2REV4cEVHSFdVU0ZjK2ltUEVEUExZSGdEK1lY?=
 =?utf-8?B?TkxQT1JMRkxEMFRCb3NZK1NnNTk2Sk9qMG1CbmxyQklldWJOdlZYaWJ1Y1Aw?=
 =?utf-8?B?eEQ5SHo1WEpVNFNMbFlqQ0UrOS9sZU5udVRWYmJJMTk5Um1pTDI0MzJFeVdi?=
 =?utf-8?B?ODZ2OTR3bTNyTXI1MXp5cCtnNk5Vdng1L2hnK1ByTms5aEZFRk1yMlNCZTY5?=
 =?utf-8?B?VUc2Mk5wNVdJcng1eFZ0LzNOYlk0djk2K0poWUNyb1FrVWFkVTQ1RE8rRjhW?=
 =?utf-8?B?SEF6eWZQNCtXRWFGVExDV29hV1dEK2Ruc3lqazV3R2VvUmZ3QVkyKzl4VkIz?=
 =?utf-8?B?aVRlOUN4ME16Y0h4U3N4akNuK2JzK2hwMmxuWU9xbTJvVkpJZEd4ZkIvMENo?=
 =?utf-8?B?OU1RdXptN2I4N1lOaXNERWNHZ2k0SUJsaU9oSGJ2MGNLS3BOcXZSaUFyZmtP?=
 =?utf-8?B?S0RCaFAxQktPbE5DaDVUU1lncmpjWFpVZGpFZU9WT0tBOS9iUS9vSWtLZ0l2?=
 =?utf-8?B?enBTNVZXOEVScGFTR3RKRnEyQmdrZGsxWkpQYkwva3Z2ZjNBenU0SzFqeUdp?=
 =?utf-8?B?bFB3VEFnL1ZETzhHUFprVTBtN3RCMmNUaDJ1cWFtYlVxYTB0cU03amNpdElu?=
 =?utf-8?B?MStOeVUyV0lHZFl5ZGhWdzg1cDFDT0Z6N2FyMGcvNE5nUjRkbCtLc2dLS1o4?=
 =?utf-8?B?RlJyelhmdkl6enIyRmlCd0pTSmZMMVBnNFAxa01UZWM1M2Qwa1VXN05NL1BJ?=
 =?utf-8?B?aG5GVE14K1NxZTNXSHUxRUk0bzhSeGZUdFovOHM2V2dLTVJEdHhoT1EveDVD?=
 =?utf-8?B?MDVHc2ZQWTNrRnYydk9sQ1FqYTN6eXJKTTZyWlkyRlRYWlh6UTlocHJtUnVq?=
 =?utf-8?B?bTF2c1JJK0Nvam9ZL0Rrb2FrT2JnQ0E5SWc1bFBBVXE3VnhmWXRWNVVOdzBi?=
 =?utf-8?B?SUpaZWlQa3pKanBDWXp0QkRzd1E5cFczZFBSdVZnT2Y0OGJrS1o4M3IwWDNG?=
 =?utf-8?B?Y1VSVjd6OGxxSiszYXdvK05MdWhQejdwMyt4RWxzVkY4aWNYTy92aDYvdW9D?=
 =?utf-8?B?ZHo1VHgwNmdVN1U2ZXFXV3BSeDB2SmtxMlVKL201OTUvU1R0ditzd3pYTUt6?=
 =?utf-8?B?cEZXUzRTbEZ1VXMyWkJ0QWVJLzl2OXZGaS9ZNnVJWENYdWdDaHkyR2Fnc3FH?=
 =?utf-8?B?cTVXRDNBZ0ltRW1yZ2xHclNqYTRpdHNlbXl2Y2hsRXE4TjRpNlJxejdlRFJj?=
 =?utf-8?B?UTZYQUVjZzZrQkZxdUlhaGllUTlVbks1UVJJR1dyeDBIYlgvVnZKZzl3OVYw?=
 =?utf-8?B?dDRZenYvRnlRckI2aWduL2ZBRTcvSTlxZUJCOXI4MkZ6RXNxZkhzL0UwZWJ4?=
 =?utf-8?B?TXdXcWpvNkNaVkNjZSthclRhanhadUZDYlRzNWVLUWN6NDM2ZHh6Y1o5UGJZ?=
 =?utf-8?B?d0pHZ05GMm5MTWVGRGVCMzE4ZmxTd2cwVVJ2UGlIdkhQN01tVktvOE4xcjEv?=
 =?utf-8?B?ZE1oTlg4MTIyOU9wZTUxYkx0WHM4ZE5oY2hlSzVMVmFGZVlaaWFtY21FQTdr?=
 =?utf-8?B?cSt2TCtSYXpPS2x1bG9JcWU1SWU2RXlTUGpoY3A0QWsxbFFQUEp0WjFSWk1J?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29aca499-084a-43b5-7384-08de066e86b6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 13:28:11.1409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +A75kdE6PY5HuuxxCJOiRQ1APyoK0mVHhDLe1ZSgfHVZVzuiTWSIDlMQ4zzyJSGFl3AaKMLPfXCkyVVCQLdmCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFCAADA7A6C
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

Quoting Matt Roper (2025-10-07 17:48:34-03:00)
>The number of page table levels for PPGTT virtual addresses is something
>that should be tracked at the platform level rather than the IP level.
>Even when mixing and matching various graphics, media, and display IP
>blocks, the platform as a whole has to have consistent page table
>handling.  This is also a trait that should be tied to the platform even
>if the graphics IP itself is not present (e.g., if we disable the
>primary GT via configfs).
>
>v2:
> - Drop default value of 4 and explicitly set the value in each platform
>   descriptor.  (Lucas)
>v3:
> - Drop outdated code comment and commit message paragraph about default
>   value.  (Gustavo)
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_pci.c       | 22 ++++++++++++++--------
> drivers/gpu/drm/xe/xe_pci_types.h |  2 +-
> 2 files changed, 15 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 69ed987fef67..8688f40f55d8 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -51,13 +51,10 @@ __diag_ignore_all("-Woverride-init", "Allow field over=
rides in table");
>=20
> static const struct xe_graphics_desc graphics_xelp =3D {
>         .hw_engine_mask =3D BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS=
0),
>-
>-        .vm_max_level =3D 3,
> };
>=20
> #define XE_HP_FEATURES \
>-        .has_range_tlb_inval =3D true, \
>-        .vm_max_level =3D 3
>+        .has_range_tlb_inval =3D true
>=20
> static const struct xe_graphics_desc graphics_xehpg =3D {
>         .hw_engine_mask =3D
>@@ -82,7 +79,6 @@ static const struct xe_graphics_desc graphics_xehpc =3D =
{
>                 BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
>=20
>         XE_HP_FEATURES,
>-        .vm_max_level =3D 4,
>         .vram_flags =3D XE_VRAM_FLAGS_NEED64K,
>=20
>         .has_asid =3D 1,
>@@ -105,7 +101,6 @@ static const struct xe_graphics_desc graphics_xelpg =
=3D {
>         .has_range_tlb_inval =3D 1, \
>         .has_usm =3D 1, \
>         .has_64bit_timestamp =3D 1, \
>-        .vm_max_level =3D 4, \
>         .hw_engine_mask =3D \
>                 BIT(XE_HW_ENGINE_RCS0) | \
>                 BIT(XE_HW_ENGINE_BCS8) | BIT(XE_HW_ENGINE_BCS0) | \
>@@ -183,6 +178,7 @@ static const struct xe_device_desc rkl_desc =3D {
>         .max_gt_per_tile =3D 1,
>         .require_force_probe =3D true,
>         .va_bits =3D 48,
>+        .vm_max_level =3D 3,
> };

I think we are missing setting ".vm_max_level =3D 3" for tgl_desc as well.
With that fixed,

    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>=20
> static const u16 adls_rpls_ids[] =3D { INTEL_RPLS_IDS(NOP), 0 };
>@@ -202,6 +198,7 @@ static const struct xe_device_desc adl_s_desc =3D {
>                 {},
>         },
>         .va_bits =3D 48,
>+        .vm_max_level =3D 3,
> };
>=20
> static const u16 adlp_rplu_ids[] =3D { INTEL_RPLU_IDS(NOP), 0 };
>@@ -221,6 +218,7 @@ static const struct xe_device_desc adl_p_desc =3D {
>                 {},
>         },
>         .va_bits =3D 48,
>+        .vm_max_level =3D 3,
> };
>=20
> static const struct xe_device_desc adl_n_desc =3D {
>@@ -234,6 +232,7 @@ static const struct xe_device_desc adl_n_desc =3D {
>         .max_gt_per_tile =3D 1,
>         .require_force_probe =3D true,
>         .va_bits =3D 48,
>+        .vm_max_level =3D 3,
> };
>=20
> #define DGFX_FEATURES \
>@@ -251,6 +250,7 @@ static const struct xe_device_desc dg1_desc =3D {
>         .max_gt_per_tile =3D 1,
>         .require_force_probe =3D true,
>         .va_bits =3D 48,
>+        .vm_max_level =3D 3,
> };
>=20
> static const u16 dg2_g10_ids[] =3D { INTEL_DG2_G10_IDS(NOP), INTEL_ATS_M1=
50_IDS(NOP), 0 };
>@@ -268,7 +268,8 @@ static const u16 dg2_g12_ids[] =3D { INTEL_DG2_G12_IDS=
(NOP), 0 };
>                 { XE_SUBPLATFORM_DG2_G12, "G12", dg2_g12_ids }, \
>                 { } \
>         }, \
>-        .va_bits =3D 48
>+        .va_bits =3D 48, \
>+        .vm_max_level =3D 3
>=20
> static const struct xe_device_desc ats_m_desc =3D {
>         .pre_gmdid_graphics_ip =3D &graphics_ip_xehpg,
>@@ -307,6 +308,7 @@ static const __maybe_unused struct xe_device_desc pvc_=
desc =3D {
>         .max_remote_tiles =3D 1,
>         .require_force_probe =3D true,
>         .va_bits =3D 57,
>+        .vm_max_level =3D 4,
>         .has_mbx_power_limits =3D false,
> };
>=20
>@@ -319,6 +321,7 @@ static const struct xe_device_desc mtl_desc =3D {
>         .has_pxp =3D true,
>         .max_gt_per_tile =3D 2,
>         .va_bits =3D 48,
>+        .vm_max_level =3D 4,
> };
>=20
> static const struct xe_device_desc lnl_desc =3D {
>@@ -329,6 +332,7 @@ static const struct xe_device_desc lnl_desc =3D {
>         .max_gt_per_tile =3D 2,
>         .needs_scratch =3D true,
>         .va_bits =3D 48,
>+        .vm_max_level =3D 4,
> };
>=20
> static const struct xe_device_desc bmg_desc =3D {
>@@ -345,6 +349,7 @@ static const struct xe_device_desc bmg_desc =3D {
>         .max_gt_per_tile =3D 2,
>         .needs_scratch =3D true,
>         .va_bits =3D 48,
>+        .vm_max_level =3D 4,
> };
>=20
> static const struct xe_device_desc ptl_desc =3D {
>@@ -355,6 +360,7 @@ static const struct xe_device_desc ptl_desc =3D {
>         .max_gt_per_tile =3D 2,
>         .needs_scratch =3D true,
>         .va_bits =3D 48,
>+        .vm_max_level =3D 4,
> };
>=20
> #undef PLATFORM
>@@ -593,6 +599,7 @@ static int xe_info_init_early(struct xe_device *xe,
>=20
>         xe->info.dma_mask_size =3D desc->dma_mask_size;
>         xe->info.va_bits =3D desc->va_bits;
>+        xe->info.vm_max_level =3D desc->vm_max_level;
>=20
>         xe->info.is_dgfx =3D desc->is_dgfx;
>         xe->info.has_fan_control =3D desc->has_fan_control;
>@@ -723,7 +730,6 @@ static int xe_info_init(struct xe_device *xe,
>         }
>=20
>         xe->info.vram_flags =3D graphics_desc->vram_flags;
>-        xe->info.vm_max_level =3D graphics_desc->vm_max_level;
>         xe->info.has_asid =3D graphics_desc->has_asid;
>         xe->info.has_atomic_enable_pte_bit =3D graphics_desc->has_atomic_=
enable_pte_bit;
>         if (xe->info.platform !=3D XE_PVC)
>diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci=
_types.h
>index 796439571abe..6354280584d9 100644
>--- a/drivers/gpu/drm/xe/xe_pci_types.h
>+++ b/drivers/gpu/drm/xe/xe_pci_types.h
>@@ -31,6 +31,7 @@ struct xe_device_desc {
>         u8 max_remote_tiles:2;
>         u8 max_gt_per_tile:2;
>         u8 va_bits;
>+        u8 vm_max_level;
>=20
>         u8 require_force_probe:1;
>         u8 is_dgfx:1;
>@@ -52,7 +53,6 @@ struct xe_device_desc {
> };
>=20
> struct xe_graphics_desc {
>-        u8 vm_max_level;
>         u8 vram_flags;
>=20
>         u64 hw_engine_mask;        /* hardware engines provided by graphi=
cs IP */
>--=20
>2.51.0
>
