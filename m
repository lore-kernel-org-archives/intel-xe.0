Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B11C52D7C
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 14:56:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DAB10EB0C;
	Thu, 22 Aug 2024 14:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="km4rKqLi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DE910EB18
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Aug 2024 14:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724338565; x=1755874565;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=73INsWUT0p10mfu4Jtvt81AJbSxxbnvGxxKIRl4bT7g=;
 b=km4rKqLibKmWH1NJdfBn+WiFo/TaqaQp9oJF2vkhdcYuGumSWygfzOdZ
 Ge/VCB/7c73X3rp9Wxtq2evbIYSsypgX3eN+S1K7omFeJhu/TECPfBORD
 sENHM+R+KKuz8d4TG6Ea0Lpid8/nUDqQAMjEHgArbOio87piNMohIYJ98
 I0GQ7XsqjPpLQ3jMYvUo0brA3NeM+etLu7IFqZu21elAt6vA4Hek1ZB6C
 SkDKzyIsY4xfi2ame/K+NQbC4rPwYHRmZbQtnzw6V04eDX16z/1GApZh/
 TYGDTxvx7Rmhi01cQTxPK0UXCIFIna5YQg0hZqIS0gb/nja479BmnJzHt w==;
X-CSE-ConnectionGUID: 5j4cqM76QVSAlB52OiPdnA==
X-CSE-MsgGUID: rg0BV/FxTPSSPI0OHpLS3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="40224108"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="40224108"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 07:55:53 -0700
X-CSE-ConnectionGUID: YN183AIhTvypMt008q7Org==
X-CSE-MsgGUID: SyfvV7MlRVmCcAgU0iGn5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="61465184"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Aug 2024 07:55:52 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 07:55:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 07:55:51 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 07:55:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LIRmofvJjRt7LJ6znRzdDoMezl8smDMxBWBrUg4c6nN1rWIbBetO6YEIMgJZNTsOgVMi1N7unqmYzZZFRv4124EUK2bODkTD16wpzEk2gogR9SO+UycO+nTw7r5kDRCASu/T6JvaUpFE2BTmJfhuWpfID4f3K61cZ+OHgNonBa+eWMLx5+UD51G/Uj2rycBIm3RWLo2MTluXcLWP6VIt2vWo5lryKNyuboxkviUTENDMeJ1xDyGRE/MpFXXw5GGzmrj/h8dx3Ns11iknIdLOEyXsmwQx+h+p/5kOdV4YcFrGYpvp6iF8jrBI9jeARrk39kTqWlSAoYAKaQirVv2yVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUFDZnVpk5cBXpRG11ggqX4+gvAZkwxvi6bvcr043XE=;
 b=uxe2oleiieV8H9wfvKE0K9r313wH5khyd1roN+XBVa0/sMTBlSENp4367XUHP/JclInmA7ujlMnXNf1NM63u1cLnBHtVxy6e0mfs/zbR8hUHJKFU3ojBGiAdatsutz+0bcwxhUc2r+bVhxPbL9JafqYwmww1Xj63zeGODNI3yhA2xX0x5z10N46KvYk071sOp/brWkgPeuG4BTO7uCLjutiR5yn6z6iIEXYlcQg0oOJs+xdkrcj1tSFyHbodjs8IjSiH9/xglMN0zaN/tgvMd94TfjEzY466aH/cXv1yLu595ercCLPlhVNSoDysx3C0y4qJ2MMGdHRpQn6HnzNorA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB5957.namprd11.prod.outlook.com (2603:10b6:510:1e0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 14:55:43 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 14:55:43 +0000
Date: Thu, 22 Aug 2024 10:55:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Juha-Pekka =?iso-8859-1?Q?Heikkil=E4?= <juha-pekka.heikkila@intel.com>
Subject: Re: [PATCH v3] drm/xe: Align all 64k VRAM buffers physically when
 multiple of 64k.
Message-ID: <ZsdRbE3uuqFuo6y2@intel.com>
References: <20240822142346.818434-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240822142346.818434-1-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0098.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::13) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB5957:EE_
X-MS-Office365-Filtering-Correlation-Id: 6524948a-a488-4e06-20e2-08dcc2ba7ef5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0xGOVlKNEs2S2JCb20wNnlsQ1RQalJlcUxMUzFvaFhXTU9qTzdsNjdZZ1RM?=
 =?utf-8?B?TExIUFoyeEkrdGhnZGlOTFkwVzE1d2VkTksyUXJSa2l6dW40RW9WWHE4NzlO?=
 =?utf-8?B?WmJlQ0tyakFobHJCV3hPbTB6QWpTK29Fdkd5SHByR3QxR3gzWW5MMzM2eUlR?=
 =?utf-8?B?TGxOdGYxWXh3L0ZkR3NUaXRoUU9yRTZHbnl3RHVGU1pDREtGK2RIYVdvL1Vx?=
 =?utf-8?B?Ylh5aGRBL3IyTG92SS80WDQ1MWZMY2hEa2ZPM04ydHdFdGlLVXdla1MweGcr?=
 =?utf-8?B?QzhZU2lJN004WXU0OFQwc2pGaHJNTU5yNktINkMzZHBVc05odVN6aTVjU1dS?=
 =?utf-8?B?MUthTmptdXBLT1BKNE02WGYxMTZoS1J3bGV6d09MeXJzTUhucDl0d25jMGVi?=
 =?utf-8?B?SDJqNS9IZ1ljSkF4cTE4NlpFN0J5cHBzbmZEZFJLcTBjNmZlbFVkWFNWVW5C?=
 =?utf-8?B?bTZHd2QxeTA1UGZWNDZGeVRtZGRpeXRRQ1A4TWFMeXBMdkFnZGRGZEFvNGdj?=
 =?utf-8?B?cXkwc2NtOGtONjhFS0tIR3ZlNHh5VE1tZVhHaThTVmxWVG52cWJTUVRGV1A0?=
 =?utf-8?B?RkdEcU5DQ25teW9iTnlNWCtGcTVpT3AzVHE0bHA5NlNJcVQ2aFRiT1ZuTUJY?=
 =?utf-8?B?c3h2UUs5NHhnTm5EdFRmZ0Vzdkw1M2FRT0NCWENYaS8vdEVBcUw3YWU1cE9j?=
 =?utf-8?B?WWVkYjhLU1dEdUtxMTVWdDRqN2x2T3lCYitVWmcxQU5qUDhLNElJaVB0MVZX?=
 =?utf-8?B?N3d1S0l5bGhJZHhycUpaTGhCN2ZCRDQ3cDZ4SFBRZjlOSXE0VEJaZiswTHFr?=
 =?utf-8?B?OExXcXZaVGJseGY4cVpTOGNVZGZPeXJGL0RzcnR2akxmTW5BSTU3TmtjQkhF?=
 =?utf-8?B?Z1VjK1ZXdWpvMUxDK1IvKzhxVWc1WGdIcGVHTk9sakV0bzk4aFlVRTVDdm1D?=
 =?utf-8?B?cUVjckhwVWk4b1QxOWVldHRBUDkraHNqd2lrSCtscWtVQXVVMlQwaFF5SHVj?=
 =?utf-8?B?SitMNEhCUkVOMi9VRVRITWR4N3AzZVFNMkhBNWVYNGdnRTZFQXU0ZG9yUzdY?=
 =?utf-8?B?bVNvM05BLzhXVWxYMStjT09FZzE5M05lU3M5b08yTWpaOGY1QkhxdWRQQ09F?=
 =?utf-8?B?QTZ0OXRjUTlVM2psZ0l5TktzR3MrMUU4WjA2WDZvVTV2dHc2RFhkRGtJU1o5?=
 =?utf-8?B?TWpDcnU0alkyUFEvMmM3c21ONGN2V1Mrcmx6akRyOTFEd3RlQ2NEU3pRYWdM?=
 =?utf-8?B?TzZqRG15T0dqQ3lkdFZzaTU4VVBPZWlNakZwc1Nuemk3Zzc3WGtnc0Q5bm1F?=
 =?utf-8?B?M1JGZGpZazA3UmhlV051R3dDcFJtdENjcnN6djJRVTRROHhzZWEvNEgzWmxM?=
 =?utf-8?B?NDhESVJxbitSR0lRdWExOEZIZVhXaHh6WWk0QnJYUXp5QmNaeXExbnVwWkhm?=
 =?utf-8?B?UzBWUzg5OGRRMG1IMDJ1bElVaVRXSmVsbGt2MWlWSmxvMFZDYmJZVm8rcHNO?=
 =?utf-8?B?MmlyeG5Pb01YMnBLTnZiRzNmYlhqRExPR3JOcHJLWkkrNzJ1WUtVOGxtOFk3?=
 =?utf-8?B?ZXAxTjNEWEhQR1QrL1RITFZIOVVmUmpWejlqTXl6T1oxc2NyamV6OFo0S2lq?=
 =?utf-8?B?ZE1XcE95R09Ob1VIWmxkczg5blpmVTk0RzJXVFlTRElPK3N1Ykg0OUxRQjJC?=
 =?utf-8?B?dng1aGNRdmo5cXlrQ1V1OGRyL3dqV3ZBdDBuc2VvT0FpSW5WcTMyV3BpUmJL?=
 =?utf-8?B?NVh0Rmt4S2RyUXBmNXpQUFZacWhldUdTem5nc2tDRGphdWNMa0o3SVlEamxK?=
 =?utf-8?B?NzZUQnUvbVVySWc2d3ZCdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sit6bSttZEowakg2RnB2Z0pPN1JtaU1DbWFEZVhtdEtoa05Gc3gxYmJPNU10?=
 =?utf-8?B?T25HYmo5ay95bC9IN2JhR1RiTFhXTCt1TDAvWWJoQk5LVUZGZDlWQnFsUkht?=
 =?utf-8?B?Y1lJekV6djhHMmJnMVZLcWdWSFowNC9zWHBaL3FxNUc4aUN6SlNONHVNNlJp?=
 =?utf-8?B?OEhwYzg2N1FQcSsvMXRSTlZLbi9oSzBTVVI3Q3o3T0hhSnVPN0dKZkJUN3Fm?=
 =?utf-8?B?ZHVnME4xMVcwdXladjZ1NU0yWWFEWnJnazNOMVBmOUpjanpheDV3QTJWbDdH?=
 =?utf-8?B?ZTVacERKczEzcXlreVlHSGRLVGFhMnFHYnpxKzZRZUNDdzdNZnR0c3Y4UHpR?=
 =?utf-8?B?VldpUFRDcU10aDZMbHBZWFFha2FrR1NXd2tzWTc4a1MzbE9FeUpxVmRXNHZF?=
 =?utf-8?B?bjgyengzOUduVGlpVjUwVkZ6UkxDZWluQ3RwbElXSE0yVStZbjdjRUlKSUln?=
 =?utf-8?B?OVhVV3pOcUdPMlAxcWNNbVlzaUZ6WDlRUTg2NUYzSW1sR2xxT0IwSXducy9x?=
 =?utf-8?B?RlFubGF0VjFJN0llUnBVRm81WmhrU0tYODBmUzk4WUhGQ3d5eFZRTFY1SVVv?=
 =?utf-8?B?RGpRb1RPTVZWdGpFZXI0RFZYY0lqKzdBbm40bGJ1QjhEOG95UjVkWXFJcWtv?=
 =?utf-8?B?VzVrMFpiZzJ1NDMwSjZIS1NHclN6eVVrbnI2V2NTMTVmZzRSbGNlblVvVWFt?=
 =?utf-8?B?VFliQldwbWw5MEw1UmZ5NEtxd2U3RVVIWjdVaGpOSjBNdm9FS2xNbFZRQ1Yr?=
 =?utf-8?B?TzUrMzJPaCt1VGpibU1oYWhNb1gzQktBRE9FOWlqTFNFWUV3TWl6aGUvNy94?=
 =?utf-8?B?bEozQzNERmdXcFdUZUVGS2J6elN3a29pdzVNRHk3dXZRcm5FRkZRZU1lVlA5?=
 =?utf-8?B?NGlMTW5TNjJ6RklsUEdoQjRDakF2Tm5uQWN2SndyNVdVeGJsb0YvSS9Pc0VB?=
 =?utf-8?B?Zy9sWDZwMjB4bFlTMlZhZDg0c01SRVE2NUNrc1dDTjV4eE4yN3lnUkJtMFVY?=
 =?utf-8?B?QnhtclQ3VUNGYmRWUmpUR2wzRTRJbmJJSHJOcDBwZ3ZzZHcrbjJRUWFUbEx0?=
 =?utf-8?B?c2h5MnYyNUV2Ky9EOXNRZFFldXdtcDczVHpMWE4wa1BySjNvbzlKNWdhejVJ?=
 =?utf-8?B?WnBLMG03OG9PMEJ2d2g5SEpHcVN5ZllOVFd0UURIWEsyaVgvQllkRk1uRm5m?=
 =?utf-8?B?K0toL2lweWR1UmxHQ3l4dVFRL0NOYkpKaktFc1UrNkVHTjlhZmkra3JTY0wz?=
 =?utf-8?B?K1orSjNUMmh0U2M5WXQ4bVhxMEFnYXZSSjVQYXh3cU15U3AxRDdMOEVJL3BN?=
 =?utf-8?B?NllJbVRZVGJ2VUk2Kzl3bXdkdlhGWlFSdU5YZG40U1VhQy9jU08zMDJMVnVx?=
 =?utf-8?B?dWxPSW9GME1JYVdWK3UyeXlRRTA2WThESngvRTJwZ2cvc3VWY0l5WFdoWXV5?=
 =?utf-8?B?VkduYTNEWWY1RXU3YUFVSmo3OTFqTitMY3pTS0QxK2lBYnJkL0k3SlVlTjIr?=
 =?utf-8?B?M3BhNCt5TXhpMUxBMi9IMkZOWkk0QTVCOFhZSXlIck5wMlVXMlBNc3o2blZH?=
 =?utf-8?B?WGxlTVlhTW5FM0lndVhHbWhMTVdGcUM2WVV4YTJuRWtPdUhjMUVxR01jRUd6?=
 =?utf-8?B?UVpVV09Sd3JzK2NrUFlqVm9HZ1piNDhGYmlZcjdmcFFRNGdLVExYczluMENl?=
 =?utf-8?B?VVk0VGtIR3dsSThLWUx4b1lXb3JIbk0zUXI5ZVZZOGZMUmRFOVlOMjlZc2JP?=
 =?utf-8?B?VEFabVA1d2pidEpSUTgrTE43QTF2RmNlaTZTSlJ2TU5QNVdIS2FCZTAvWjlU?=
 =?utf-8?B?cTBRZGp5RjdGSGkyV2Z3ODdYYisxWWVtb3QyTkNvYk96VlpYSDBpRXM0WnJZ?=
 =?utf-8?B?VnBlRlZiaVRoUGR5elVKQStlL1dKOFNOVUVtSTd5MUV3Q2g5OXhkNmtSRzVY?=
 =?utf-8?B?V2dhWFhIY1h2eEI2NE9VV2F2TCtadm9uOXFCV0ZHcUJmSlVWYkM5QUN0dFlj?=
 =?utf-8?B?SkxDK0cxY3pUK0syTFRiTHV5QzRReURLRWNMeVZpSWtyQ2NXNUZBOVQ0Z2to?=
 =?utf-8?B?K0Rwd2ZjQy9KM01HY1FZRHBTUU9CdE1RUThmTTF1cEMzSDRIaXRMbEk2Q2ZU?=
 =?utf-8?Q?JwcX6glFcTHL6/hSogEaSS256?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6524948a-a488-4e06-20e2-08dcc2ba7ef5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 14:55:43.2685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVMsTOb33B/LOvhor2i7PDVJ4aXBMXDVUkb6S3o2RoMKpdy21vVGoevZ2RFaRFyO2ubW2MgCl+N7Jjdunt36Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5957
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

On Thu, Aug 22, 2024 at 04:23:46PM +0200, Maarten Lankhorst wrote:
> For CCS formats on affected platforms, CCS can be used freely, but
> display engine requires a multiple of 64k physical pages. No other
> changes are needed.
> 
> At the BO creation time we don't know if the BO will be used for CCS
> or not. If the scanout flag is set, and the BO is a multiple of 64k,

I don't see this happening in the code anymore. Where's the check for
the scanout flag? What am I missing?

> we take the safe route and force the physical alignment of 64k pages.

If I had understood it correctly, this is one of the things that
Jose was asking us to avoid since the alignment on the address
was not actually needed. But I might have understood him.

Cc: José Roberto de Souza <jose.souza@intel.com>

> 
> If the BO is not a multiple of 64k, or the scanout flag was not set
> at BO creation, we reject it for usage as CCS in display. The physical
> pages are likely not aligned correctly, and this will cause corruption
> when used as FB.
> 
> This is a slightly different approach from my previous patch. Instead
> of requiring a scanout flag at FB creation, we now make all buffers of
> the right size physically aligned correctly, so no change from userspace
> is needed.

could be a v3: mark and a more imperative language. Something like:

v3: Instead of requiring scanout flag at FB creation, we now make...

> 
> It will be interesting to see if it affects performance in any way,
> could potentially even improve things with 64k PTE's.
> 
> Inspired by Zbigniews patch.

This 2 phrases above should probably be added below the '---' mark,
and not as part of the commit message.

> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Co-developed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Zbigniew, we need your signoff-by here as well if this is the case.

> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
> ---
> Changes since previous version:
> - Drop DISPLAY_NEED64K.
> - Hardcode check for I915_FORMAT_MOD_4_TILED_BMG_CCS, only one affected.

I like these 2 changes for a cleaner code.

> 
>  drivers/gpu/drm/xe/display/intel_fb_bo.c |  5 +++++
>  drivers/gpu/drm/xe/xe_bo.c               | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_vm.c               |  3 ++-
>  3 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/intel_fb_bo.c b/drivers/gpu/drm/xe/display/intel_fb_bo.c
> index f835492f73fb4..de613325e0bb0 100644
> --- a/drivers/gpu/drm/xe/display/intel_fb_bo.c
> +++ b/drivers/gpu/drm/xe/display/intel_fb_bo.c
> @@ -28,6 +29,10 @@ int intel_fb_bo_framebuffer_init(struct intel_framebuffer *intel_fb,
>  	struct xe_device *xe = to_xe_device(bo->ttm.base.dev);
>  	int ret;
>  
> +	if (XE_IOCTL_DBG(xe, mode_cmd->modifier[0] == I915_FORMAT_MOD_4_TILED_BMG_CCS &&
> +			     !(bo->flags & XE_BO_FLAG_NEEDS_64K)))

parenthesis misallignment

> +		return -EINVAL;
> +
>  	xe_bo_get(bo);
>  
>  	ret = ttm_bo_reserve(&bo->ttm, true, false, NULL);
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 6ed0e19552159..dd54cbc14e9d8 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2019,6 +2019,16 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  
>  	bo_flags |= args->placement << (ffs(XE_BO_FLAG_SYSTEM) - 1);
>  
> +	/*
> +	 * Lets see what happens if we simply align any buffer that's
> +	 * a multiple of 64k to 64k in places where it's not officially
> +	 * needed.
> +	 */
> +	if ((bo_flags & XE_BO_FLAG_VRAM_MASK) &&
> +	    !(xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) &&
> +	    !(args->size % SZ_64K))

shouldn't we be checking for the scanout here as well?

> +		bo_flags |= XE_BO_FLAG_NEEDS_64K;
> +
>  	if (args->flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM) {
>  		if (XE_IOCTL_DBG(xe, !(bo_flags & XE_BO_FLAG_VRAM_MASK)))
>  			return -EINVAL;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d1bfd0b6e9558..af215f6d6588b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2878,7 +2878,8 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
>  		return -EINVAL;
>  	}
>  
> -	if (bo->flags & XE_BO_FLAG_INTERNAL_64K) {
> +	if ((bo->flags & XE_BO_FLAG_INTERNAL_64K) &&
> +	    (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)) {
>  		if (XE_IOCTL_DBG(xe, obj_offset &
>  				 XE_64K_PAGE_MASK) ||
>  		    XE_IOCTL_DBG(xe, addr & XE_64K_PAGE_MASK) ||
> -- 
> 2.45.2
> 
