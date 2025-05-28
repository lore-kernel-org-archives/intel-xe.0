Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B59BC3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 10:55:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D4A10E5F2;
	Wed, 28 May 2025 10:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M3aEMI79";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C5D10E5EA
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 10:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748429732; x=1779965732;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qu2sYbh7lJEgFJD4UNHVL0oLe6jql2tOvj13Aqbn2no=;
 b=M3aEMI79UHBjJMtB6pHRgCwhHESa6E9g91oPiKfH9Orw77eik5bRoZzk
 cdpksc1tv9CpoPWTvQZTejEIHRzSmaaYFZzdXlFp0WtHeU80Y8KJGAmJG
 igqCNHfoy3aZVUXBKQpJNTYk3y0g0UMccHyesuIE4LTlrO8zAPdMYXPiB
 zBW6ZG15v628f8wNDb5qYlyWz9qFiB3ftWujnKPBrEs4bTAUvqwyAGVtu
 nlP+kiCWsMyQIytwx08XavUd4VkhnwkO22s7zOS109NthNWJTXzgJyee1
 tyXR9VoNe92JKGeowebjn+sNES2nKVuwheSx2pwsFE0VBqTHEM7yD2v+p Q==;
X-CSE-ConnectionGUID: yqNY82jGQZOfrKnGZT1mtQ==
X-CSE-MsgGUID: 8IvaNkQfTRuyKQUD6BigMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50606569"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="50606569"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 03:55:29 -0700
X-CSE-ConnectionGUID: rXWp1WRRS4WDlK0wz1hHVg==
X-CSE-MsgGUID: omaWmAqBRsOmGbl5wpCiQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="148071111"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 03:55:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 03:55:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 03:55:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.66) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 03:55:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=btuOK4D7L40JCg62ZnjzBNPvLCfwYzy9ueE//H/I+0k6s9Q6j3MZ1nnffAxRupdggJSWzg6L6/mc6W4e+OpFCXDPStcBkJuMY/ROw63tK2cE+wsPDzJQeD4kk0RVTYFJoxJp7/QWzT0lV8No2VXVzrxEscz3ASl1EKCbOsGQi+T9dvmhHd7KLT7zaZC4R+d0oqNg5mo5Vkk2dViBeH1mqE6gHf3EnqFPFPkjLi4s94z589+9Z2Wxyxxc7xL1XsPFBKlUcmYTbqlX52eWupWCvpNjwZKGx2Cng9x0BSPRQMTeLQRCu9QB08FtqFHuoLD5zbNmIXY2RNQrWijyUaXq8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOTrR7inp/4FFpdej9z99YlP5vSU1EAYsXWmVUpoURo=;
 b=TX8Gmfhllszoo7OJCx3oBhWUHQW5FMyPiBLjF1LrP5ec2o6ZbECDW910S0hjZxmq/7Iy3Vf6lG1/jC3wuw5P4gUbGo3Z6KgpFskH3aQTLvDa/wM+E2zZnpV3S5dSJJnwP/X6T/VwSlTe4OsQi377R9K5H88DXS93iXY9YP0Usw9+12QCiTu7rhHZTPSpQkMAf/Q+zOX6qobEzELvHRSc8zKklr7WHCgvhhnHMXZCT6xemRCuX1iB1mMgB9rggE2Y06ObUriF2/jOl+nuwwOfpL/kX8+KFmCihaXcKulHj2tJ222V43bTyQ0hmmwdO8O8FQD1gUG6M1GuOyScwJFG3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH0PR11MB8165.namprd11.prod.outlook.com (2603:10b6:610:18e::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.30; Wed, 28 May 2025 10:54:41 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 10:54:41 +0000
Date: Wed, 28 May 2025 12:54:38 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?utf-8?Q?Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 7/7] drm/xe/vf: Post migration, repopulate ring area
 for pending request
Message-ID: <twcothnuc6agtazwjigkjpmpu4zuqa557lx7jbo23ohzm2ufaq@ecd7fu6tuopa>
References: <20250519231925.3196154-1-tomasz.lis@intel.com>
 <20250519231925.3196154-8-tomasz.lis@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250519231925.3196154-8-tomasz.lis@intel.com>
X-ClientProxiedBy: VI1PR09CA0118.eurprd09.prod.outlook.com
 (2603:10a6:803:78::41) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH0PR11MB8165:EE_
X-MS-Office365-Filtering-Correlation-Id: 128a0eb6-9375-4dce-bbe6-08dd9dd60c60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dExxTVFnRUhyYmpwenZKZlhaUXNWL0ZHQVlCb0s3OXhXRDllTEU5RXNFUFdo?=
 =?utf-8?B?OGhEYkhKYThSY2RHV1BLMU1Makpkb1NiSXVnckxIRG0yc3lWd1RZcTEvclRp?=
 =?utf-8?B?UEdBcmw5WU5ZempNZm5xc3ByZ3loK2kxMU53VnRHekJVdHhrUko2L1g0dm1x?=
 =?utf-8?B?ekNzRDlIbG4vV2RkSG9QZlhGMVNCcXBna2pCaWFXSHNwaDduL2I1T1pPZmNy?=
 =?utf-8?B?bWVmV2R4bVI1MlpMY2d1OEdNWnRyZy82b1ZtZG92RXNtSzZYTlhST0JOeGZY?=
 =?utf-8?B?L2o2OFY5MXZ1SkJvNlJnVmRaSG1PaytKcXArMmNqRHZMd3BGYkRPZlNqdnVO?=
 =?utf-8?B?akNYNUN2WlBCVXlqYUhFbjBmSytWWEZnamtRVGpSckd6b0h5TTlueWVtdTU5?=
 =?utf-8?B?QUhQUmVtRG1URGt6d0RpZG1nWlU2amF4TVllazJIVmFrNW1IZkROdE1jRE5n?=
 =?utf-8?B?eTRSTmFKd3FRUE8wWm81WDdaVVNzN3pmWDk4UllqK292d1FZR3cyR0FrRHVR?=
 =?utf-8?B?c1RjMDFJelkvNkpnMzhESi9xN2dqSlBCU3JDUjFKVHhlNWdqYWRjeVkrUXlK?=
 =?utf-8?B?NjRwYWFySWpBZFE1WVl0T0NCdE9qQkRQcnc2RW1WZnpIZlhxVHVEdUViQThy?=
 =?utf-8?B?SE9zL0JhZTIySW5JVDdqdEZtRFhuRGZGT3NiTE1ybGFXRERkblRtZlM1YnBU?=
 =?utf-8?B?MFBaTEo3UEVhZU1md1BIa3lxOWJlVUR6NDdsZXByaVlmNlJNbEpXT3pRZkhV?=
 =?utf-8?B?R2tZVWlNOUFEODF2ZVBzbWNLUFJPcnV1NVhuRVM4QzFoU2hSY0JZMjBZN1BV?=
 =?utf-8?B?WnVZYlFTV0dRSkZuZ3ZrZUUvK1pXdGlQVDI1L3RuK3MwZGI5Z1JURG54MWdY?=
 =?utf-8?B?MXFNZ0dwSHk5MmdLK2NsQUt5aGtZQmpHVGJVNGJoUUhBb2F1UDZMUDdLZjNU?=
 =?utf-8?B?T0RlL09IMEdmRERRVmNRd1BzR1E5VW50ZDNpUmtYL2JQMUlXNkNKYlpWNm9T?=
 =?utf-8?B?TVpHSnNML0ZZWFM2Y1dXaVRwWEt1SFpxaHcvWDdBYVBydEoySlZaS0Y4di8r?=
 =?utf-8?B?YitUT2ZOZ2UzRFR1dWNJQjRSVnRObjdHVmFoTnVaZFhDdDFaMFp4cFJZY0Z6?=
 =?utf-8?B?aStrR1c4MmwweWdOSFB0Ykt0TWRKaFkrcHY0cDNUZVZjK1NKVm9EVWxpem1n?=
 =?utf-8?B?MFc5WFpzK1BkUHRSMCs2Z3dxUEF0aWVLV3Z1c1d3eDdsVXM5dC95SGNhb0dU?=
 =?utf-8?B?VHhSK3dtSkVOaHZPcHhOclppRURBYmZiV1VCSU9KTUVZN2YyMTVXeWZFdllr?=
 =?utf-8?B?YWgzTXNkQkJsalFIY2ZoUTZvSFFlMjgxb1JtMDUzdHNDQ3A2emRnc1o2cUlP?=
 =?utf-8?B?b1REV3NIWDQyOW5kRkdJTnFodnA5OUdVVHh3bE1qWUVSNTdCV1Z3dlpjR2sz?=
 =?utf-8?B?cWh3NDQwOGN6UWFBTVhDc1drWG1zUWFBdFRmQ25zYVN2R2Y3R25HSGt6dFR2?=
 =?utf-8?B?MEhjS3NoOWRaVGR4Y3owcFV4MWovellLREdwMS8zcnZ3NXpWNHJXaU9PUGFi?=
 =?utf-8?B?cGVKaFRMdTdpVFlqelZ6UjUxWWh3NVl3QmgvVU1majA3TUdRR0h2d0xhc01l?=
 =?utf-8?B?cWFRZ0FMQUw0OUt2YWVMWHBSQ3lydFo2aUw5MVh2cVZpajVTWDZORmxaZzhG?=
 =?utf-8?B?Q3lXVjNWckxrLy9LVE1rcm1XTzhaN0xXUzlSQ1V2UFJEdFVaWEdEY20vUm1p?=
 =?utf-8?B?M2k0azNUaFRGK1R6L1EyaFJIbXhMRkZEdVBGTEsrWEpjb0ZFYzJEWHUvZ0x4?=
 =?utf-8?B?NS9aVjRjSHpRSEtuSjJoM3RuTmpWTXduTy82YmFOMGxVSE5ZUW9kT1BzRXJ2?=
 =?utf-8?B?RVp3UENRUXBPNUxOeVBnRi9Sc0ZQOUVQN3Z5K1RkQ1F3WkpyYXFMNFYzUWho?=
 =?utf-8?Q?aznJOfamEIM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZW01QXdSK3pVZ2w0T3Z5SWw5VUhzYmNRdmFyMjJiWGlLWDdtQnhWOHBBTmRY?=
 =?utf-8?B?bEI1dDFmbFA3YXMzd0dJaW8vR1lLWk9KNG0zSUpkZ0hvOW5mOVJNNFJqZEhp?=
 =?utf-8?B?TzlCNVJreW5qT20rZVRoSTVsQVdNWjZ2dEtwUytyaklTVWZrSEZ1MmxuN1Jv?=
 =?utf-8?B?SXR1cmFpbVBYUk9MTFNDeThlT2txWjFsZWo5cHRPeUNqcVZXWTJId0JBOVNS?=
 =?utf-8?B?N1NMckhJQ1pSU2Q2alAvTTFwYUhWcG9vb1pwcUhQamxVNDRnSE5qdEJrMGkx?=
 =?utf-8?B?aU5qcEdFMmZFMTRicHBGclY0WDRHbzhSMjNnQlkrRStCamRMMWJtSUhnRUQv?=
 =?utf-8?B?TVA1S1BOTG9ha0gyUHBiUVdGWTNLS0NCVkl6bXVWem5kWnZlOFlzeHM1SzlL?=
 =?utf-8?B?NE9CTlljVDYyVkVNbVNoc2lqeTF3MytsTjR1VEJTUWZYeGtGVEliS3BpbVN3?=
 =?utf-8?B?MXpnQ0twamZseHNKT2FJQTRwUzdPNWZqZWdkcHNzMnpEK0tlQ1hIaDZheFJQ?=
 =?utf-8?B?MGV5Y3d0ZXB0OThRT05mTkxhVHQ0ak1HVmZjeUV5b2VuQWovdGRyZWlUZmlS?=
 =?utf-8?B?aU9GeU5FMlVOd0d2eENJRlFXZ1IwQ0JzSkwzZm9PbzJCVUpWYnhjdWltVmdH?=
 =?utf-8?B?TkFEcERJVW45YXd5NUswVzJweklGUEhjVWxBZ0V0WHJvWUZ0b0ZHTTA1QlFY?=
 =?utf-8?B?VERBNE9ORFJzeEdiaFMyZEFGdnJsckE0UnRGYTk3Q25ST1dneExReVJ3cTVw?=
 =?utf-8?B?TjdhUjJIa25wNlBURm5SUXVXY2FEenhrMlc2TlZ4VVd5a0tUWUV6aGtsVXVU?=
 =?utf-8?B?SGhlT3BWOHRRaU0ra0xKZFphYlJzNko1N2dGU1BLaW15VFNLd3VFS1EyUURm?=
 =?utf-8?B?b3VyMGJ6UDU4aWtNTkFmUnY2a2Q5ak9OZTIwcEhKZm5LZTU2cEFZdmdmcE5E?=
 =?utf-8?B?L2JrblU4dU9FN1hudyt0c2w2Mis0OE5ac0hSUGxzKzhkSnRqTTJrby9SeXla?=
 =?utf-8?B?aS9KV1JnOGNsTE0wTjhSZ04zWkVPSEVQZlVlUjY1TDUzUXNUOXdmYlF6RlA4?=
 =?utf-8?B?T3h0cDlxTlh4bG51VGhBSVRVbzZSOXRFemlhZXROOTNEM0dJclNmRzFQYUd5?=
 =?utf-8?B?LzNXUTBVcnpVSWxmYUpuYnhIcTAzNmlINXFjZGk2WC9McGdpOVFpUzRGdzBW?=
 =?utf-8?B?WG5Hbk9ZK2FlaEZjUGlEV1E1VnUvUnlqZHp2QUxwSmdNUE1IYk5mVVQva2sz?=
 =?utf-8?B?cnpIdFJYZmp0L3R0c3JjcU5HWnA4YWdWeCtWdnJtM1RkWTh5RDArZTNUM1li?=
 =?utf-8?B?YnZ2dWVhQlZ6R3djN1RvT2c2UU9FUENTRFRNQ0VsWGhENS9jRGcxT0Fsdmh5?=
 =?utf-8?B?UEZzbDFOMmV4YjRTM2RyNURJT0FKUXJLdGIvRHRwbU81Z2Nwc0xmRjVuU3lO?=
 =?utf-8?B?Q0ZNQVVqVG0xbEZacDBWeElOMVBTamVER0s0U3pWbXpGNkR1ZXp6eXpjVExv?=
 =?utf-8?B?MWExRFE0QU5KTzdXZERYMVROb0Z2OGM4Qmora0hWbm5GNGdSWlQ2S3B2amlQ?=
 =?utf-8?B?bGszWlpWcUpnMFZiYStOeEtma2hyS1FrV3ZPVFJLM1VUclBhc2MzYmplZUpC?=
 =?utf-8?B?c2JRWnBreDZ5TkZRaDBHdU5jbHhIU2U5RUxtK2FRbEZxejd6SytScVVUcDc2?=
 =?utf-8?B?d0dVSUMzRTNzazhRdEw5K2lPRmdabFRWOWVkeDZCVzdQdFZxVlJNSzlmWjk3?=
 =?utf-8?B?WUNVa0taV0lpclZJeU5nOFBwOC9NQVlWZEJSSmN0SDJ3czQ2RTVhT0hjNmlU?=
 =?utf-8?B?RmFBeis4aW1tcG92ekdvcG9xRTd0ekRrY3VBOWwzUzVhaDZacWJISGViTGdy?=
 =?utf-8?B?dUgwM2tMelRoNHRQd0x1bjZwSlZaN1R5Ymd5TUlpcW1PTEpXYW9QbW1BWlZW?=
 =?utf-8?B?dEdtMFUzQTFjZmNNV0lqbkFhdVdwOXIrc1pwOVhqYW01aXRic0dUbGJFS25t?=
 =?utf-8?B?UU43V3FuejRZOHZaTk5Pb0lHd0tnQWFReTlVRVhnMXc3a0QrNFZ3OEJsS1lJ?=
 =?utf-8?B?enhCc3QrY3JSRkdrdlkzM0FEWU80bHo3dmlXazdRSm1uRjlpSDdaMktQWGdV?=
 =?utf-8?B?MitsZ3ZsS3cvdjF2dTI1bTFaOTZuYmFWbVZ0ZXRyL1hlQU82L1hmYkpna2tG?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 128a0eb6-9375-4dce-bbe6-08dd9dd60c60
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 10:54:41.4243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxtk2hfk83YTFIQDaFKrRAAPEyvW+RdzEmtC8ibnCWv86f5UCtJ1sb1f9xrUVJlOAgnMocLxfTqzZqLAHypYPBewuV6OcrzVUbjNhv170sA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8165
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

On Tue, May 20, 2025 at 01:19:25AM +0200, Tomasz Lis wrote:
> The commands within ring area allocated for a request may contain
> references to GGTT. These references require update after VF
> migration, in order to continue any preempted LRCs, or jobs which
> were emitted to the ring but not sent to GuC yet.
> 
> This change calls the emit function again for all such jobs,
> as part of post-migration recovery.
> 
> v2: Moved few functions to better files
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c | 19 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
>  drivers/gpu/drm/xe/xe_sriov_vf.c   | 13 ++++++++++++-
>  5 files changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 9c3e568400e0..0488d80d5b99 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1056,3 +1056,20 @@ void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q)
>  		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
>  	}
>  }
> +
> +/**
> + * xe_exec_queue_jobs_ring_restore - Re-emit ring commands of requests pending on given queue.
> + * @q: the &xe_exec_queue struct instance
> + */
> +void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *q)
> +{
> +	struct xe_gpu_scheduler *sched = &q->guc->sched;
> +	struct xe_sched_job *job;
> +
> +	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
> +		if (xe_sched_job_is_error(job))
> +			continue;
> +
> +		q->ring_ops->emit_job(job);
> +	}

Shouldn't we take the lock that protects sched->base.pending_list?
I know we're under guc->submission_state_lock, but that doesn't protect
it, right?

Other than that - LGTM.

Thanks,
-Michał

> +}
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 1d399a33c5c0..67c2baa42c0f 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -92,4 +92,6 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
>  
>  void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q);
>  
> +void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *q);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 990f3265c7ad..a60e0575cc56 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -766,6 +766,25 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>  	return fence;
>  }
>  
> +/**
> + * xe_guc_jobs_ring_rebase - Re-emit ring commands of requests pending
> + *   on all queues under a guc.
> + * @guc: the &xe_guc struct instance
> + */
> +void xe_guc_jobs_ring_rebase(struct xe_guc *guc)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +
> +	mutex_lock(&guc->submission_state.lock);
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> +		if (exec_queue_killed_or_banned_or_wedged(q))
> +			continue;
> +		xe_exec_queue_jobs_ring_restore(q);
> +	}
> +	mutex_unlock(&guc->submission_state.lock);
> +}
> +
>  static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
>  {
>  	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 2cc44298465f..e31680a08dba 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -33,6 +33,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  
> +void xe_guc_jobs_ring_rebase(struct xe_guc *guc);
> +
>  struct xe_guc_submit_exec_queue_snapshot *
>  xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
>  void
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 0a9761b6ffb5..3e7eb365f2e9 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -8,6 +8,7 @@
>  #include "xe_assert.h"
>  #include "xe_device.h"
>  #include "xe_exec_queue_types.h"
> +#include "xe_guc_exec_queue_types.h"
>  #include "xe_gt.h"
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_gt_sriov_vf.h"
> @@ -16,6 +17,7 @@
>  #include "xe_irq.h"
>  #include "xe_lrc.h"
>  #include "xe_pm.h"
> +#include "xe_sched_job_types.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_printk.h"
>  #include "xe_sriov_vf.h"
> @@ -245,6 +247,15 @@ static void vf_post_migration_fixup_contexts(struct xe_device *xe)
>  	}
>  }
>  
> +static void vf_post_migration_fixup_jobs(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +
> +	for_each_gt(gt, xe, id)
> +		xe_guc_jobs_ring_rebase(&gt->uc.guc);
> +}
> +
>  static void vf_post_migration_fixup_ctb(struct xe_device *xe)
>  {
>  	struct xe_gt *gt;
> @@ -327,7 +338,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>  	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
>  	if (need_fixups) {
>  		vf_post_migration_fixup_contexts(xe);
> -		/* FIXME: add the recovery steps */
> +		vf_post_migration_fixup_jobs(xe);
>  		vf_post_migration_fixup_ctb(xe);
>  	}
>  
> -- 
> 2.25.1
> 
