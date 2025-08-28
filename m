Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9677CA0FF6
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 22:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E23F10E00A;
	Thu, 28 Aug 2025 22:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mMVb8MDc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAFC10E00A
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 22:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756418718; x=1787954718;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hJiAp9NCanMPHOekfUMTd3gDuQr8F/OfnK5pYzFWzYE=;
 b=mMVb8MDcze1INv7+WSB9b4AfgsmWxZypDZ/UpnJHk+OLPPSnn7EcWcYa
 /VjbMYkAKS7VZ6xELrc3WWqwvsWtzlUdtTJl0+C+WVlNxD015WI+LYAXW
 sRF7TJdfIUAJhX3meYP/TpZXjm0JmqE/CrfC5Xd5P80YmoMl4HyjXfQ85
 C3UBjPRKQ1J0I1YosD8G2OexO0iOhRxcg60lwd0lLG7KME3Xt81qrhya4
 q1gNmMvQ5ud+JuioLvpNDYdAnAZOuSPij++xELrG63QJFExN/MXj2/V3E
 WjcY8FeRL0fvM8Tw+S8KJbxZJqMF+Tl6f/R/iRMcQtV0wFhMd8FY5iZkN w==;
X-CSE-ConnectionGUID: vl/Iz8pcSs2KFIDJQZSWvg==
X-CSE-MsgGUID: DwJvMn+xRguD+x/P9FwMEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58631705"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58631705"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 15:04:38 -0700
X-CSE-ConnectionGUID: a/PobeiHSdGYWcmYQ32k3w==
X-CSE-MsgGUID: WqVBxt7bRAiv/FIh6Fjxxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="193888199"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 15:04:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 15:04:38 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 15:04:38 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.58)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 15:04:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WpHdzaiaiQa8rvTLtbsKJB0vTcBWrXP8B7ZRlUSX0jo/E6RKcETJlUQrLc1eTDC16vzLSigdQ963Ga5eyEVb/m9NFpS2QtqRs4F1kB5+RUuYW2qFerWS8WU5ljaIC7ckoWFR7O1ilL8+VpcpRZu+EhCJEup5icWk/GQncsRVmuLJjYXzyDaMJeMT3ypWnEkX96obKk7/iIAiEZUWOKSqH6ZXiY/LCJdXisfCC/B2q+vGJKmkVfWC1vn1bTeUfsocp1IixTodd1isgSnc7Oagta13aMk3/w3fWA5QqG/ZkN0CFHJLHugaQ3kQuB48H1BO/wD+mC6toM0HCXEfw+SXTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCd97cnzHb+ft3yUQao6j7GW88pY6xMvcQZBQa1VA1s=;
 b=ELjz3b6vRb0ce35EHsQcYfc5d1JPIOUZ4cygja9LaTtFgWjZCFV9x3C7HSRB/RTaZqSs12xiwZf1n+RH8CwuO+6dsJerkgSPRcdOxH9WnM7oUWjk7TgpPsJoNJzE2GGD5vkoY1hOiCpPqJTFrfD9j8xyQOhZC+LUHGjT3MWIklpPYYetWzXTXZ62wjVU7qAs7m+f04U6EMtoW56B/nxzG3vO7GlkvcKGVILpLuqwjy0tzTM/B4SLA1UkxbFn7gb+N/bTXg3u/K4l0+UEGOKBgkoDLExibvyw1O4LKUw+OE6Ajqr0igd8LeDaiiS9sEIyk8cKjFuM9dGOpwHN/2QUmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.17; Thu, 28 Aug
 2025 22:04:30 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%3]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 22:04:29 +0000
Date: Thu, 28 Aug 2025 15:04:24 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Atwood <matthew.s.atwood@intel.com>
Subject: Re: [PATCH v4 2/2] drm/xe/xe2hpg: Add Wa_18041344222 for Xe2_HPG
Message-ID: <aLDSaOtVeRDUgk1P@intel.com>
References: <b131c6dec20a07acab020063df7ff22b7050c14c.1756318068.git.harish.chegondi@intel.com>
 <1b910cab369af1e386b7f8da186a756f6ffe2361.1756318068.git.harish.chegondi@intel.com>
 <l3o4birrnbgohxtopdx3iv7jbp3d7pe4ifurhapygbixehyvhm@eyh75lwhsn7j>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <l3o4birrnbgohxtopdx3iv7jbp3d7pe4ifurhapygbixehyvhm@eyh75lwhsn7j>
X-ClientProxiedBy: MW4PR03CA0189.namprd03.prod.outlook.com
 (2603:10b6:303:b8::14) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|SA2PR11MB4874:EE_
X-MS-Office365-Filtering-Correlation-Id: de503698-8156-4883-a294-08dde67edc63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1RvcGs1cnVqaUFzUUQ4TmdaTjZjSmFiT0xRUG9SZnJnQmd5eGo0emRMY3hj?=
 =?utf-8?B?U2hNc1ZXdVFEM3ZIZVlIbmFIakJsbDNZNThTZm5EM3F3V1NmMnN6RW42R01r?=
 =?utf-8?B?WE1xb0doa1FrRkM3dVByUCtvaTA1SlVzODBFQVlJT0dpRjdKVWt5QWZWWVlC?=
 =?utf-8?B?M0ZKWE1SeUYyUXdOWEZNb0NnNVN6ejlWSVJ5QnlQZENXZ01xUEJFVHRCVS9F?=
 =?utf-8?B?Tm1XUVNFLzBhV1lmNllQY1E3bUdSMHh4MTFaTU04NkNRZWVBTUlFY0tpaVdG?=
 =?utf-8?B?TE43c2NHUEljUVM5RXpiQUxCM1VxM1p5clRTYTlpcTgydGpqdjdTNnpOU3Js?=
 =?utf-8?B?b2c2VTlUZ1lMaWhxVC9Gb2JzbjZFSk96Wlk3TzNyWDdEQmVwTEoyMTV5ZFpV?=
 =?utf-8?B?Z2tsQWw3eFp5bkFHRnNzamVzb0M2TGp0UnVySWZxWW14enJ1QUR2cDVvd2E3?=
 =?utf-8?B?andPNjJLdEVWT1Z2aDZQNkJxaXc4R2dCajJUaDc4VFFkaFpnaEpNZFRYMlZ3?=
 =?utf-8?B?djFRUXFTdHNhcm16L0NzTHI4dkJqOWV2bGN3Yncrak9RcWM5aWxqT1E0Y1R3?=
 =?utf-8?B?VnRGUS9YVGREU0lvZUdTTnNvcURXWVQ2Z3ZSYXFuQTVhaGU1K2tlTTBhaVp2?=
 =?utf-8?B?RUNDVjkzM2twd3A0cWZ4NHBhbWxYZG84YlBGdjJycDYySXI0K3g2dEhoc2NN?=
 =?utf-8?B?R1hMNGNQS3kvbVptU3laU0djV25meUFTTGN5UGhBRDdYNTNPM3UvcEhlVGRl?=
 =?utf-8?B?WC84R1E2dGRUa2QySWxUck5lWlNWUFF0dXh4bVpySTZFdFliazgyNmxrTG96?=
 =?utf-8?B?YWljdlhxN0lFYS9pOW4wZkpjOW9FQW9jdXhjcFpJSmhlZ3M2bEd3TnFzMlJQ?=
 =?utf-8?B?bHlLeEpXZG1HTU1ySzlTc3h2a25LNVBtNlpBQS9XcXl0elZsVUJ6SDB4cXJk?=
 =?utf-8?B?WGNMaVBlSGluNmVBVkNCQ2RvU1p1d1l6STRzcGhBTElyT3g1WDhkemxXTmNC?=
 =?utf-8?B?MnI3NDlsaEg3cHk5N1V2OXd4MjllQUI4cHZMOXExczN6aUtmNE1xaStCbURO?=
 =?utf-8?B?cnhsWjg1RlhzVjVJUXk2K0cwd09RZHUxbmJtODUrZUhINjNvRXFmbFdVc1FN?=
 =?utf-8?B?Z2t2MUpuUy9PMjRnUkVObG1CakxLV290YmlUak1WR2x1RklVWVlaclRwQ1lF?=
 =?utf-8?B?bUVQVmJ2d3RNUTdrTzNReTYyeWk5ZzYyaVBBUGdUSkJoRk5sUzFId2lmYnNt?=
 =?utf-8?B?aGd5VDIya2tVdUlyU01xYksvc2xiK1RkNkVJaVJFNDlDRklMUHpubVBGaHp1?=
 =?utf-8?B?Vnd6QWZGcWhPVHNlTDN4cWNJZnNsTDR6cmVBOFU2NGl0aStRNHlCUTJkQ1pB?=
 =?utf-8?B?QWJrS25ocmwxYnNmekt0eUpvL0prTkdBTUtFZVg3bDc5WXYzTFc4TTRCbytu?=
 =?utf-8?B?b3pjYXVHNVpOaW12UDF5ZWYxNFhBYkJpSTdiZ01mTFhKVk1FS1pvOXV6L05m?=
 =?utf-8?B?Q3VvVVZwaVhJZlFlNHdBeGJ2cG1lbWd3SlBnKzVhQm1RM09weEdpU2N6dWJa?=
 =?utf-8?B?VFBqK1BOdkQ4S3FYUVJRdWJHcVpPbTNqQ21Ld29vTVVTWFdiU3JVY1pmc3JQ?=
 =?utf-8?B?OHRnTW41RndxWHlVS3kvWEo4TndFUzJtWDJrQ3Z4WW5abWR0RlVWZm10eURT?=
 =?utf-8?B?TkpwcEp3OG5OQ1VNZE9TTURNYXZQSGRXUnFlcXdiWG12ZEh3MFB2YWgwY3lC?=
 =?utf-8?B?WjhPTnVqdjJFOWFnL1ZOLzgwOWtZa1NPU2JhbTFpQXk1MUFENWVEZXlvK0RX?=
 =?utf-8?B?RWpmUW42dElMejFTRklucXFuVzNTVHIvK1VJdnJNZUc1bDQyNjlzbUROSXFz?=
 =?utf-8?B?TnFhWkRMc0VFejRqSnMyTGMzbURTd3dXcm9XNTc1NDZDWnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGlFb25udUkzVXRvSWtpN1FrWjN4MUVpejNqQ2ZqNVlRQVNGZmtxN0xpNEpv?=
 =?utf-8?B?UGd6clpIajJVNmRYMklWNnV6bXo0eVQ1N0o5N0k4ZG1GcE9HVzZlbnR4MVNn?=
 =?utf-8?B?OFB1U0pvM1FGaW8wckd4YTAyMTFMN3dDdTdaNC8xM2I5TktoemtnS2tUektp?=
 =?utf-8?B?QnpYVUpORWFqUEZXbzdOMEgvME1SRVVmNWlBZVJtd3dOT3g2OCtJaVlqZjIz?=
 =?utf-8?B?U0UwbXVYeDEzdHpVYWhFc1dwekc4VEVjZmtGem9xYXkxb2VhUENGQy9qRGF5?=
 =?utf-8?B?MkJTbC85TlQzcjFBaHM0eXlVTmJydE1RZ2lSWDZoMGtGT3YxSHNuZjgvQjg4?=
 =?utf-8?B?SkVsL21HQVBISkJuVC81bi9jOXhFUUNyb0pKNzVRZ3FPY2lVcjU5cGwxQWsw?=
 =?utf-8?B?SzJOc09EUU9YeU5jVDlHdHVSUWIzT0Q2RU1WQ3l4cUMvNitEd1FpY0VzRUF1?=
 =?utf-8?B?OGtCVDFJaXRLS1pNNmpIaGFDcnBtYVpaRWpaczl4VGlnWWVtdUNSMHFqY2g2?=
 =?utf-8?B?TlhkR2IrUUZsbDVBUm4ya0o3SDdNcWxQb1F1Tkowa0NFa0VtcDNWN0pxVnVy?=
 =?utf-8?B?MDA5aFBaQ1R6NkJpdjc3RXg3YzVBcC9QeTBYV3p0WXFVVTFGOUU3WnNkMlgv?=
 =?utf-8?B?NkFFZmEyZUpnVG9OZDBlNGF2cFE3Mjlab2V1Yko5dzFUUk1MTk5vRVRISGh6?=
 =?utf-8?B?eHZSbVlvQldjRHgzMWMrRUs1ZnR2a29mZDBmTlFEaUc2UGFiL2grR1hLeFRr?=
 =?utf-8?B?a1E4MUcySUk1TlFqdUJkWjBGRWthZ3VqblRWSENNaUJrSU5xSmZGREJQeGtQ?=
 =?utf-8?B?eEJ1Z0ZFQ1RsZFc5OEI3ckx2Y3NuQzRZNDA2S2JXMVhPSU15UGx3TjNBdVcv?=
 =?utf-8?B?c3BNbXk4RG5oZmduM0FPcjVaRS94UVpnOXlUTnVhUlBycW44MXpMOENFcTRo?=
 =?utf-8?B?eFVJa0RBQnNsN3Q1UHVrQkcrQ3h4dDVWK2lwMTBsN0x0OXA0YnZZR2tINUVq?=
 =?utf-8?B?T1VNZnU0MDErdFZUSEswOXZlWHR4MHNnMWhycThsTHhqaFZnZUMxZUJoWU9V?=
 =?utf-8?B?RHIxUndXNGV6SlBoZENTcDdLYTROSFVRak54eHBGSG9kWitJaUprZ0hubXhV?=
 =?utf-8?B?eVJ2SG8yQ2p4TW1ZK0FXLzNVdlBlTXVoZU0wVzlFb1I5TlQ1U01NNXVrUUR3?=
 =?utf-8?B?dlc3RDNjbGcyRTQyZXBVYUZlcSthN2JaUEFmdUV4ZHNhd01LVitjVUVNY2tL?=
 =?utf-8?B?OUJqdkJVN3hReDBPOWhYUlA3aGY2WVVUbDNCWjVSL2Y2VEgzbmN4YjR6eTB2?=
 =?utf-8?B?S3d4TWVqVjRNcGNIcjZPbzhRMlJLLzdvNm42U1BneVJGeEk5OEdRQUxwQUxo?=
 =?utf-8?B?ZWEyQkdQeHFWZTVvOG0yQjd0SGlENGtGNU81N3NUUkhmaUluRGFScmpkenpa?=
 =?utf-8?B?cFVVdDZYM1paS1FaQU9mcGV0UEw0U3Q5L3RodFgwQ1d1cGNTK1ZZNVF1Nk1n?=
 =?utf-8?B?ME96TVBTWkV6c09QZGNxR212NDJOVnZaMVhhVWdkNXdaa2hqVW5zNnZZaTlu?=
 =?utf-8?B?VCt3TnB4c3UvVlFJSEJya3RmRWhPRDdveHhzRVUvb0JPRXpqNStkaCtwVWRB?=
 =?utf-8?B?WWtPeDVZUHMvbTREdDVaT1VvbEFaL2JwRXczVFFlTDJMTXJsRlF1TjgzNjA0?=
 =?utf-8?B?VHpZNTJmVkk4bEN5OGpWQVhwTEYrMWY4bTk3TXBXN3N6RmptYWtvb0hEaXNP?=
 =?utf-8?B?UGQxdFlFREFVSHI3M0E2bVE3TW8yNGJBZ1FJalIzaEJkSkRYOWE2K1VONW9K?=
 =?utf-8?B?VE5VUlZqWW9aSVQ4QzRLNWJSOWdnMVJHekNuYnlGeVFhSDFmV2tPM3prdHVk?=
 =?utf-8?B?dkYwVEYvU20xRXQzZnNLYVZXYmhOV3RTQmo0S3Y1QTJnMFpleHlLSEVLZTdm?=
 =?utf-8?B?VEhPalMyUnZVSmJJc0lPYStIWVEyMVdhTFgwYmU3dGd4TmpvdWQ2TGticXI3?=
 =?utf-8?B?amVrQWtUM1prc0RSOFlnSU4rWXdQQ3lOOGpDS3NrT1RzUjFXTzJnR0lSRmts?=
 =?utf-8?B?UTc3ZXl2dnVCZUx3ZWlNb0VDL3duVHdKakVNNE82UThrZkxIM1d2RzNJaVpr?=
 =?utf-8?B?Nm1LdjFobmRIQW9zM3hHeE9QRG40Wk9obGVMclp4cXVQajg4SjJlMG9sT2lZ?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de503698-8156-4883-a294-08dde67edc63
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 22:04:29.7735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FTa6sX3cbCHnEw87HE3slyCWmRRxYt7PtHXCnnA93pcM6UCV9aQH7PpN5+8nIrl9Hx7AdMrpIwm2ULFGUShHq2IK5QUR+yCBPNdb8T1LYm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4874
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

On Wed, Aug 27, 2025 at 03:11:35PM -0500, Lucas De Marchi wrote:
> On Wed, Aug 27, 2025 at 11:09:35AM -0700, Harish Chegondi wrote:
> > Add Wa_18041344222 for Xe2_HPG that requires disabling
> > the perf mode for subslice count for eustall sampling
> > when the enabled slices are discontiguous.
> > 
> > v4: Rebase
> 
> this changelog is not very useful, is it?
I wanted to let the reviewer know that v4 is just a rebase and no
other changes made. Should I remove the changelog or add more details ?
> 
> > v3: Skip the workaround for SRIOV VF
> > v2: Add Bspec references (Matt A)
> >    Rebase
> > 
> > Bspec: 79483, 56024
> > Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > ---
> > drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
> > drivers/gpu/drm/xe/xe_gt_topology.c  | 17 +++++++++++++++++
> > drivers/gpu/drm/xe/xe_gt_topology.h  |  1 +
> > drivers/gpu/drm/xe/xe_rtp.c          |  6 ++++++
> > drivers/gpu/drm/xe/xe_rtp.h          |  2 ++
> > drivers/gpu/drm/xe/xe_wa.c           |  7 +++++++
> > 6 files changed, 34 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index f96b2e2b3064..06cb6b02ec64 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -522,6 +522,7 @@
> > 
> > #define TDL_CHICKEN				XE_REG_MCR(0xe5f4, XE_REG_OPTION_MASKED)
> > #define   QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE	REG_BIT(12)
> > +#define   EUSTALL_PERF_SAMPLING_DISABLE		REG_BIT(5)
> > 
> > #define LSC_CHICKEN_BIT_0			XE_REG_MCR(0xe7c8)
> > #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
> > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> > index a0baa560dd71..0ed7dc9044a5 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> > @@ -12,6 +12,7 @@
> > #include "regs/xe_gt_regs.h"
> > #include "xe_assert.h"
> > #include "xe_gt.h"
> > +#include "xe_gt_mcr.h"
> > #include "xe_gt_printk.h"
> > #include "xe_mmio.h"
> > #include "xe_wa.h"
> > @@ -328,3 +329,19 @@ bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss)
> > {
> > 	return test_bit(dss, gt->fuse_topo.c_dss_mask);
> > }
> > +
> > +bool xe_gt_has_discontiguous_dss_groups(const struct xe_gt *gt)
> > +{
> > +	unsigned int xecore;
> > +	int last_group = -1;
> > +	u16 group, instance;
> > +
> > +	for_each_dss_steering(xecore, gt, group, instance) {
> > +		if (last_group != group) {
> > +			if (group - last_group > 1)
> > +				return true;
> > +			last_group = group;
> > +		}
> > +	}
> > +	return false;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
> > index c8140704ad4c..fd08b382e259 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_topology.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_topology.h
> > @@ -47,4 +47,5 @@ xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad);
> > bool xe_gt_has_geometry_dss(struct xe_gt *gt, unsigned int dss);
> > bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss);
> > 
> > +bool xe_gt_has_discontiguous_dss_groups(const struct xe_gt *gt);
> 
> mind the newline
Will remove
> 
> > #endif /* _XE_GT_TOPOLOGY_H_ */
> > diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> > index 47ea1521dc80..b5f430d59f80 100644
> > --- a/drivers/gpu/drm/xe/xe_rtp.c
> > +++ b/drivers/gpu/drm/xe/xe_rtp.c
> > @@ -370,3 +370,9 @@ bool xe_rtp_match_psmi_enabled(const struct xe_gt *gt,
> > {
> > 	return xe_configfs_get_psmi_enabled(to_pci_dev(gt_to_xe(gt)->drm.dev));
> > }
> > +
> > +bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
> > +						  const struct xe_hw_engine *hwe)
> > +{
> > +	return xe_gt_has_discontiguous_dss_groups(gt);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> > index 7951fefdbe04..d0adb29db7dd 100644
> > --- a/drivers/gpu/drm/xe/xe_rtp.h
> > +++ b/drivers/gpu/drm/xe/xe_rtp.h
> > @@ -480,4 +480,6 @@ bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
> > bool xe_rtp_match_psmi_enabled(const struct xe_gt *gt,
> > 			       const struct xe_hw_engine *hwe);
> > 
> > +bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
> > +						  const struct xe_hw_engine *hwe);
> 
> ditto
Will remove.


Thanks
Harish.

> 
> > #endif
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index 52c7df4c3afd..1d4efaca110e 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -612,6 +612,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> > 		       FUNC(xe_rtp_match_first_render_or_compute)),
> > 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
> > 	},
> > +	{ XE_RTP_NAME("18041344222"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> > +		       FUNC(xe_rtp_match_first_render_or_compute),
> > +		       FUNC(xe_rtp_match_not_sriov_vf),
> > +		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
> > +	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
> > +	},
> > 
> > 	/* Xe2_LPM */
> > 
> > -- 
> > 2.48.1
> > 
