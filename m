Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102DED73EB0
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 02:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEEB410E04F;
	Fri, 30 Jan 2026 02:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BDnw2m29";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A63210E04F
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 02:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769739477; x=1801275477;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=61yQOvzFfzm5VVbZHtSwEJyDtozwmDQOyTF4af4EPgs=;
 b=BDnw2m29b9y10tU6S/xZ49l7R/8GojZe/b+W1AK0Lxi3LyDXR2RIoUZh
 Z8HtdzTBxvPFWwoMspPl5FEuKq4jYLQuPlH5rTLvw1v16iJVk681rROiT
 3tJqYdbJvhtJ/xtHy9kOWiMCW6y5/TWvkZ+EmKI95+5PklDiAMk0sGRjC
 n6GwPWSaLhuzbOTveyZZQiju3vXK1GE/GYF33+j1bryq2IGIqGlr1qE4P
 G3OYdH0pRPUfsAYDl6kbTfFyqYMSLC3AevRuzU84V8GdS4o6Jto3F32ip
 MXFO0vwBoQDHavafR5o4mIEQhAUhl6ogDbM2yRRME591kMke8Ph3777hm w==;
X-CSE-ConnectionGUID: YT8t0sfyRI+0UP1hndRMcQ==
X-CSE-MsgGUID: mvzkqOO1Rye3vFIPpg4Vqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70705815"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="70705815"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 18:17:56 -0800
X-CSE-ConnectionGUID: xilw9d50Q0u+RcYE0knJCQ==
X-CSE-MsgGUID: p6CTO3m+RgO+VjdIFPmbrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="213693881"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 18:17:56 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 18:17:55 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 18:17:55 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.56)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 18:17:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RW4bF73K1bpoJefZ6DpwfNikc7r3GSxIIkhjhW/BBsHf84QjO+g+wz0i9+WeMBexCHzr30GPEew5tWzKMLsEegcNoqgl8vk9NLqm2KOEWZVRT9gpZr/3JXjCKmEZ7aNTwQzLPE4wF9zme+n2j0xenNkxao2UR4eVl/OdrSJNGxmAvEWya9PMSB9z5QLqEjenbkBObxrTA3k0nNvycNDNh/C4ipXFBV7Jx3Idu56hosdtpIzABUdMii788R1LZDCdmY/6QsfgR2E9EF6Fd3gnRszbNhNpxzxnDqzwIrYkHvJjcsDBsESoJQPgv5dl8aEv3xMxjL8OGa+A6rpdXGYt5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeHOJUA4bFIGFJi662XFSBdv+Az8IaHk1Svv6Jbg0m0=;
 b=Re5hQSDIoMWENFgAoE+UldKSYFUSeTdrUY/R5/LtpemeFdhsnDsHKiKB347Dk5kflWB2qfWf2CSsgnggzLFq+902PQVX4YIJvHTR4r7rEOX89kdrketC0blCIKQIsKdwln/rVhVKwxGnBIHGeir8y2Ph07FgMhZTf7N4uPORDxQIdGW+O7Ij9RUO9EhMvxPb4lD9hSEsLKgYBvsLDnzQZhXsPBQYk/OY0MyNPMpzDJN4dz2XnpchpeuYxcgOPo/BGHCHBIxXvzdHWJ5bmotWmhao1/sg1HCg1LgmxJE07LU0QyszK4af2QZdg4/2UJaQspkOSafdrEMxXj07X4n7XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SA2PR11MB4876.namprd11.prod.outlook.com (2603:10b6:806:119::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 02:17:53 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 02:17:53 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH] drm/xe/mmio: Avoid double-adjust in 64-bit reads
Thread-Topic: [PATCH] drm/xe/mmio: Avoid double-adjust in 64-bit reads
Thread-Index: AQHckJtNytUNIULzYUSkrzB44u7APrVpvysAgAA68iA=
Date: Fri, 30 Jan 2026 02:17:53 +0000
Message-ID: <DM4PR11MB5456E3B1FFABD86F47E99CC0EA9FA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260128211250.3643131-2-shuicheng.lin@intel.com>
 <20260129223956.GF2174980@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20260129223956.GF2174980@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SA2PR11MB4876:EE_
x-ms-office365-filtering-correlation-id: a7066d57-e00a-4cbe-5fe2-08de5fa5c67e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?f47cuI07N/PCNXYI+3sF9XzKTMPSnOYmgnMgOWT36vispeERPOz1fxOXEXEa?=
 =?us-ascii?Q?HWrPTR5Z9Ux1BRtyHjde1rDpvKfbolHUdXzE11MueT1pajSedGM/OR+ZK7o8?=
 =?us-ascii?Q?lWSApwRXg5QomMC2hImUwpxdflFH62VBDFp41UjF2hCyZ9AhBkBxWhk4ieha?=
 =?us-ascii?Q?JUrrPsvh4BwBdRTcDbToYW250zPbMvnNgbeLqGQi7KAdtcw764Ho3kpSkE7W?=
 =?us-ascii?Q?IPcRUPMnU11wMlb2bvsvZeGvedEBnLH7sQ85Mql6ni5YGCOolgU2ReqCQw6w?=
 =?us-ascii?Q?I9HB8FR9V2wlKCmrrG0sHLLyWlBM6SzJUsk0XnGE+owDISVsFW5teAi5CRBX?=
 =?us-ascii?Q?s95jFBDQ19AulX3Cogiz0PB7049uDlAmSzwCPwZG/SJ1nDj2IupeYPhwPt3b?=
 =?us-ascii?Q?Y9uBqM7a+Z3jaUShclZKuuVSxhT6/wjCNuudDc/3rwYkEup1TaaWUsTML9tD?=
 =?us-ascii?Q?lKgvkBus1lW8VfyMqx6Yq0Uoyt8K8K35rfj8rBuZL+WJh1W2y/p8p7RBMRfg?=
 =?us-ascii?Q?YK5aC8Woe/x7qIwtxFLrJC5e7cqJnfZMLV6MYJhRUepvrFfdLEfAVOVlxbj6?=
 =?us-ascii?Q?uMgxNPEJ9OUEh7f4IgnjpJKhrOIOHAMpAbmqvFVKWv/vLt5fdpdisAzUhxSv?=
 =?us-ascii?Q?SreYMseUPlwiXwA8GRHyMaVHksz8SVKZe19hWM7QwU59jof1o92beh502GCB?=
 =?us-ascii?Q?gkpWf3J8S0Khr1EQC8te74lE2+BLvhc4nvRmnEnoAmkt0BuPq2d3qiqzXkEj?=
 =?us-ascii?Q?xts56tEXYWR+IB3gO1ZIrgCAib7ZHRcmdfgkkRnB2t3ayd+H3nKMkjBrfaZ8?=
 =?us-ascii?Q?3eANbU2UWzEfqfqH2YhPNFWiPm17Hp2qgxWAjyoYDqbDLJhGpTPR0SZWEJoT?=
 =?us-ascii?Q?+nB3rcKkuti2I5mr36+td4hMEXZ/wLavJ0N4Cr8xciB6WSk/KUmaocMG3uyE?=
 =?us-ascii?Q?Wun6hlnnUqaHIB2Xo1ahi3cqEhx0vo4mRUXTRtuwnYxc3GffKGEzC9Yl1ZWN?=
 =?us-ascii?Q?z/bVKCO47ILGmPcE8Eoj8JMcHZ7GAXBg3MAA65LoDEXRVpBAb1hUA+G3z9Wb?=
 =?us-ascii?Q?Sz4U7xtPjoi9/fu+yl4FuThuyZ+NTscwn0sDVSzGbJ6thhFRgUnsXPHlmxoo?=
 =?us-ascii?Q?FJUDprh04xYlgr7UBB8osZQGo+xShC+1EIu2cTAA1ik6W4JSTk4AM1MAhMUc?=
 =?us-ascii?Q?mpGIO971no60FIJQppiesEti7li3O7TXwEW9KDI5TuHLMePXsDJjgZx/U7Z4?=
 =?us-ascii?Q?hg6HjA06n9cW6Siq30nYj0YMOf63fJGbITOvG8EjCn9054gyEinboMIPKF3u?=
 =?us-ascii?Q?iBqD+SaetopM7+qMA6JpwtaQUwpzkS4Fy6QgfvO9PMy74fRlMyIWsGhSfjqV?=
 =?us-ascii?Q?I4/ppIRqjoPa09XWblPLfbrJCiYjVrW3pCUcv+q+BIqhkx9/JiLOtFezNYZd?=
 =?us-ascii?Q?+g2Dw9+UoUFyiRAjC6TpQdS9arZXmX5ZR3JI3Ayo0D4WnHPCA7ys96LHmBJu?=
 =?us-ascii?Q?UJtWlNjh6xHsWZpG/O9s3cLvbQr6rBpZsA7DGzFlTBYj5GVBMe0V4r4ZoFaY?=
 =?us-ascii?Q?PzT4twzHMWa4haz/ItLCv7QAlPckONRsqkPLxFLrX/V7gUjnt7PviCPbaukt?=
 =?us-ascii?Q?/EKE+841/D0ANTEE/URCf8s=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/vXdPNPDLqjmGBBu8f64MrAPpd84XTMUbDVN/ltaWoqgSgZkl9wkf1ALNQ/x?=
 =?us-ascii?Q?tIUYHi/x36qpKUdP391XN41JkpaUzzuudtkoVj9AEs97PeENcyg0/m8XRgFX?=
 =?us-ascii?Q?3gINgWHKkzogJbwsNOUdZCvXjdvatE3E7PDQF30j6B+zQMARdvWiNf+H//a5?=
 =?us-ascii?Q?r66V9n6DIpVUmvI4VA0XricAq7GRbfaRlUvSNji1snXiz5x/P7L5sUaJUJwO?=
 =?us-ascii?Q?/UeAT0SVKw79ULhkUCM3rbvoy0KjPhAMOXpoy+rxVHwTv/n1J/igaZcBmYMo?=
 =?us-ascii?Q?uR3nbqzVZkldcI0wlrCcttK+zY+kygyy7AAkhv+m29m3/kghduX7g9u9+Drt?=
 =?us-ascii?Q?ZXrOALms1PxCcD8gfr/2xiTH+swqT7imb2cQKWdkYhi+y77Za9wbLEOhaUt3?=
 =?us-ascii?Q?Lw61aS+Job6fDORWqjM7SgHgd3hYKkXAXx5r//9os+LyUmAfg1eZ4Gf/H9wf?=
 =?us-ascii?Q?IF1/wVWM+h3tEBOgxekejS3M/4lDFlIhzycipZZ+BqQWVJ5B1Fa+dDvhQJL2?=
 =?us-ascii?Q?4IXvX1bS6GDFgWggJsX3+8Lp19I0yaAnYX0KhpCmWjc6uSbssvsYL9zEWxoo?=
 =?us-ascii?Q?TzWliKQLogvRBXVzl3NX7M+uKa8OpF0NrkwD54Zz1+sYjeNNrqJdJY4RQVsW?=
 =?us-ascii?Q?N7yoUTzwVU9bNda9K4P0GAlLlJURNr0j8pLCiXEMyy2PqGwQjZZR84gp1oSc?=
 =?us-ascii?Q?qNKrnhOuyE7tG3TuAsscj6VWNPMd3WhooizLGZVTDYXAkOe8lKgE8ENhPdCV?=
 =?us-ascii?Q?rPE20FUcvIx17tO6D/qES/hwZhOaTLpcVJ7aFAbkrk7sU5atL7X+Yk50fsAU?=
 =?us-ascii?Q?cpQGZUNdj5FKji7a/HgSqmn8Oqi8ZAxHo8eCFNP0LEgrz/Q7C5TZ2qpTNJ8y?=
 =?us-ascii?Q?oPHd8uuW7sMWa2jQRhHTzFPBozEiRyxv88Vbpt3vcuEG6WD96nbyypjIFszT?=
 =?us-ascii?Q?in2LTxdIYzKQ6CeAdEEv6Q0tPpI9B1p/c+kJ49cvKUuDrmWaYI0AjQHek92O?=
 =?us-ascii?Q?PI70RacsFjhFMwqkVG2qyDTD8j3KiHxpoVda3RsHdKPk1ZRQB992NZTXeBEE?=
 =?us-ascii?Q?Sw9bVmyBcf13JfmB1Q8T95+dSgTUSKSuv4/hfyYvFAgu3gohcpVh7aLgEFHE?=
 =?us-ascii?Q?2WEvmlIsq5prjy+7itCrc+a2sHgcRHtifL3HKXbp1UMEd0koq5PSZkeq5K+e?=
 =?us-ascii?Q?hchlPsWztSVgKnNEgOOke7se96DgD6bbC3fL8Qo4/v8oMT5S7ExFQoz4+syw?=
 =?us-ascii?Q?7HksiSIBMInj0zmD4oMYUqUu4FeWhsymmkecmBZ1ImCU4AStxn+rHuLp4TTJ?=
 =?us-ascii?Q?x3zALMKURa+a9mFs+BUW817vNjRFMssKt0CPEFA3KwZKsrTzu7g9rxbSvS2L?=
 =?us-ascii?Q?beF0MUOtI7pyPsO4Nuje7AQZ0VmS0kWWM3PiNUdSytq0zDPFKPbjTvsLk7D1?=
 =?us-ascii?Q?UsCM40yQBNhDmebvplQ7e+SjCn8SWEbBsQ8KCOxWLHx/U+JAQpIslQgv7FiQ?=
 =?us-ascii?Q?D8LUk4e9zwM6wxJfwgHl3YXm0reUILn1sLr4cBxsiWQUilpltceUbv7Gs4Ja?=
 =?us-ascii?Q?m2gziJ83pZQALYE8o3cgWbuV1S6k2KHnbMLcA1OXO3bXqftDEklqR+J7qCT9?=
 =?us-ascii?Q?F1YxAkxhmGOsOtczLIvcY1BilzvVig3UGTke7yX6l1Sblx3N/sOp6zr07mkF?=
 =?us-ascii?Q?i7UOipEnF30870IDa4AUTMbIC2gFqM5ShzKw20HiE8FLnsx9VhTa0lS9ks7c?=
 =?us-ascii?Q?TJOcf1/RM5Lrz2QyQ/p8eS3qacL0ScYFHc2qrm7ewxMceh6vZFSa8XyOhM2i?=
x-ms-exchange-antispam-messagedata-1: H/EdAtoA70dqSQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7066d57-e00a-4cbe-5fe2-08de5fa5c67e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 02:17:53.7580 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yPaBoTtaNxkPAwULfx5O+NVnrRI3kwPhB6z5XXBipKJXVcwdeYFrDgaYcuoGEb5vTxxExQSzF4hLKiPnjsvP7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4876
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

On Thu, Jan 29, 2026 2:40 PM Matthew D Roper wrote:
> On Wed, Jan 28, 2026 at 09:12:51PM +0000, Shuicheng Lin wrote:
> > xe_mmio_read64_2x32() was adjusting register addresses and then
> > calling xe_mmio_read32(), which applies the adjustment again.
> > This may shift accesses twice if adj_offset < adj_limit. There is no
> > issue currently, as for media gt, adj_offset > adj_limit, so the 2nd
> > adjust will be a no-op. But it may not work in future.
> >
> > To fix it, keep the adjustment only for a sanity check and let
> > xe_mmio_read32() handle address translation.
> >
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_mmio.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> > b/drivers/gpu/drm/xe/xe_mmio.c index bcb6674b7dac..76f8458c8ee1
> 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -255,12 +255,17 @@ u64 xe_mmio_read64_2x32(struct xe_mmio
> *mmio,
> > struct xe_reg reg)  {
> >  	struct xe_reg reg_udw =3D { .addr =3D reg.addr + 0x4 };
> >  	u32 ldw, udw, oldudw, retries;
> > +	u32 addr, addr_udw;
> >
> > -	reg.addr =3D xe_mmio_adjusted_addr(mmio, reg.addr);
> > -	reg_udw.addr =3D xe_mmio_adjusted_addr(mmio, reg_udw.addr);
> > +	/*
> > +	 * use adjusted addresses only for a sanity check;
> > +	 * xe_mmio_read32() also applies adjustment.
> > +	 */
> > +	addr =3D xe_mmio_adjusted_addr(mmio, reg.addr);
> > +	addr_udw =3D xe_mmio_adjusted_addr(mmio, reg_udw.addr);
> >
> >  	/* we shouldn't adjust just one register address */
> > -	xe_tile_assert(mmio->tile, reg_udw.addr =3D=3D reg.addr + 0x4);
> > +	xe_tile_assert(mmio->tile, addr_udw =3D=3D addr + 0x4);
>=20
> We might want to rewrite this sanity check in a more natural way:  make s=
ure
> the adjustment cutoff doesn't fall anywhere within the register.
> E.g., something like
>=20
>         /*
>          * The two dwords of a 64-bit register can never straddle the off=
set
>          * adjustment cutoff.
>          */
>         xe_tile_assert(!in_range(mmio->adj_offset, reg.addr + 1, 7));

Yes. I really like this idea.
BTW, the check should be against mmio->adj_limit, not mmio->adj_offset.
So the code will be:
	xe_tile_assert(mmio->tile, !in_range(mmio->adj_limit, reg.addr + 1, 7));
Is my understanding correct?
Thanks

Shuicheng

>=20
>=20
> Matt
>=20
> >
> >  	oldudw =3D xe_mmio_read32(mmio, reg_udw);
> >  	for (retries =3D 5; retries; --retries) {
> > --
> > 2.50.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
