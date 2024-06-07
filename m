Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CCCC27C6F
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 13:23:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B1910EC43;
	Fri,  7 Jun 2024 13:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fr5uCNXL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72F310EC3F
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 13:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717766600; x=1749302600;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=eZLCWu93bIH83gzwVFtedDalAsO7NoX0xc2q8KulMtY=;
 b=Fr5uCNXLSewZC/hEmklA9vqYaPGSqa+Vw/0f3T2J61CidJgizahq+ZDO
 uEuiBmOf6YCNh/lwPLwdtfgJN+SXSAN0QOeQhAR0afY3PlNfLUDmlG461
 4BFfsKD4k8t3dFXgGPbd8kWIdyIkuxPWRrdNNL1fV8KHv1V40aWkawA3u
 wV8FDDvumF/6j5efvF1DGqYS9wFha3G58oz4j76bx3PrBvZfMlOdphnNl
 TEVP8c9/HCeNGPWOQJMlvWbDRdGWaL4wtYh331Qdx7TVYXOoHfU2w2MDz
 WtOQ+VIRuAxvdIFc6T1s9JY4zhmVTz5HEp/1aUtSDJcrjBPV9N5aJ5HCT g==;
X-CSE-ConnectionGUID: NwIc4M5HTV2i22D2cYRObg==
X-CSE-MsgGUID: 7PaK4CkrTEewDIfqf6aW7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14227389"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14227389"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:23:19 -0700
X-CSE-ConnectionGUID: 0yrC7gAkRfSLvyouVNoseQ==
X-CSE-MsgGUID: C9/gkNDgT6OhXekp5Wc4AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="61528431"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 06:23:19 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 06:23:18 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 06:23:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 06:23:18 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 06:23:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ME8UR8sJv9FNse2402J4+YkU5ztluszeGjYxk6ctJHyDjKTx/lOTS38vuF3EjlVmH2Wc9P7NuMz5WLHptXLxnh7nnsi3f8zuGgQGVJ6eZ+2E5L9nxNInfqMrZWfzTQEUPzm6hfL996VdBDV6H2cf7NcKeBgBbKKhP8d7FgcoTjLlPaCUC+frKOq5fSqX48D+ZcRIya1ft5smkgEPPa/wFGre335bxYUS7Eht/oVCtoqGfUu/Lxjv+GUVBR9FmFTTPa6ZvM0kYrv0mVzt9KOBJTBt7GeC6BnTADaazR6pViecdeByoZDCsoMgGngXtubp1rEqX5ouDZkNtsmJ+MKI7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IpcFWUcyguXc/TyoMtCyhKJHD79kA+nxStED2/LYPFw=;
 b=mvmIpdpL9S9+ph1Wafw2hOAaf8qlYAcHOy8jEsMNih6JkfqXq+hyv87dLeL8htQGnzKrRbvEd4kOIxAkmkmGKWRgBaF8mGezqmTQ9BYQ+Nvk9VviwGaMeGtclpinbNi2247DaWikomdVE7sdmb3/C2wT6DkIpDDx0wK4vOdBb508pGf6HJreYlH0aHJvYwZeMPClRsCJmDmzq3UZLy+gMipMuWR/lGBe/U1Wdpday3H2oQbiByZtz2P9C+yYVqniDocbXvQrbrp9vvbKnW+caz/PoKxjIX4HR8FFCOwQqiwuGdmmppswL0sMmHXE40zZUPz3g6W1Dex4SabmPPKqBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CY8PR11MB6865.namprd11.prod.outlook.com (2603:10b6:930:5f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Fri, 7 Jun
 2024 13:23:10 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7611.016; Fri, 7 Jun 2024
 13:23:10 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240606223819.3545560-4-radhakrishna.sripada@intel.com>
References: <20240606223819.3545560-1-radhakrishna.sripada@intel.com>
 <20240606223819.3545560-4-radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v5 3/6] drm/xe/trace: Print device_id in xe_trace_bo events
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Radhakrishna Sripada <radhakrishna.sripada@intel.com>, Ville
 =?utf-8?b?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Fri, 7 Jun 2024 10:23:04 -0300
Message-ID: <171776658468.2025.7229578555926905290@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::11) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CY8PR11MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: 76fbe04b-f815-4174-d90e-08dc86f4f994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amk3ejBHZXJQNWZKTzFPVmdXak41bThNSVhRbWk4Yy94bXY1Um9XTllVaWRW?=
 =?utf-8?B?dVJ6SEdlNWprSnFzZWRkcUh6N3FKbDAzTFN5RlJDT1NzQXZRWXZaVVlvMjJz?=
 =?utf-8?B?blNzUnhUQWZsVVF6TGEyNFFDb3NFU21JRlFpMTV4bGJyc2VRSTRWY2NiVmNX?=
 =?utf-8?B?NkUydktuTkZIbUhUUzVmSUx5OUpVQ2JKNTNPS1hCUXRHdHBxVFc3KzNoc3hm?=
 =?utf-8?B?LzF1OUJsLzQvRXA5NS9SUXVjSDRYQXcxNWhxWXpWZmNlUDYxcHJYTkZkUkxi?=
 =?utf-8?B?VDZrd1p1c1VUQi94MTVZVnN3b3FpVDdmMU1hd2lNS2tNRkJqMXUzSVF5Tmt6?=
 =?utf-8?B?dEpWS0FDSUE4ZWNWMVdSL3Fpd1dBSmhTb2t0MDNnaGZSR2xpayttRXdWSUpF?=
 =?utf-8?B?OHlHeDd6WWUvWnhiNkZUQVp2Rkhzc0oxd1ppMmk4enhKbGNSZC9PcDV1OTVt?=
 =?utf-8?B?aTJmU2FPUVdzd00yS2hDb0V6eko5OFFpMmZ3ZWRkZHdGemVJb0tzcWZrTFNn?=
 =?utf-8?B?NXRSYTJzS2dPTG1XaVJaaFZJQXZja2E5eUxRMGRXeWVuakJsRzRWMmcvTFVv?=
 =?utf-8?B?dWhUL1JZaGd3R1FtT1g5czlRcUxIU3JIWmxpN0Y0a1kxY3RDVytmd1M2NFNZ?=
 =?utf-8?B?aE8yaTlXdGdlekVOVVhMYnhINGRpNExTM2JZREozZVMvVnRFTm5BT0tsVzNK?=
 =?utf-8?B?TWFrQkd4VENJSk8rN3NVdXRteS9SN2lUNUQxTXg1S3haKytjVmd2SHJHVitI?=
 =?utf-8?B?cTd2UEQ0MHFtczdUc09TRno3Ykg4UlN3cWQySk5ZTW8zTmlsY3ppOGFCaGJQ?=
 =?utf-8?B?OGhNRjNseVBFNy9LTHg2bVFUU0YrVGtFYjFsRWs5WUp6K01xQjBQQWlWZVBM?=
 =?utf-8?B?bGdLMWhKdFZFNXlkWStZUXJvOHp3ZkVBanI4S2hlbE5HK0wvdDlmeFVXaFE1?=
 =?utf-8?B?WTc3OEd0NEtHTlI0aEc1cjFXaEFabFVpcXl5Z0xLSmNGZW5LQklCdHR4Rjdi?=
 =?utf-8?B?bmtrSWl5Tm40QndrK2VpbVpnK2lsalBrc3hzdDhFZWI4ZHQwZ3VDSWZ0TWc2?=
 =?utf-8?B?UWhiM1FYOEN6a1NkUmRtWHd1VEFnYXhaaTVDMUw3STVvclBsaEkxY0U1bHhW?=
 =?utf-8?B?ZGxlU0ZCdU45elVZNDlWRjB3UXZFTFVKL1FQaHVwSjVNRm1CTjRpMWdhQjBM?=
 =?utf-8?B?Mmhxc3RxSjIvNHJlYmp6THg4SU9yRkQyamZ3WkNVWlJ6WjVhSFluS0tDZWhl?=
 =?utf-8?B?eEFyaENURWptdnJXMFY5bUVPK3ZyVU1XVTNKeVVZbGtocGtUbkZCTlVtMGw3?=
 =?utf-8?B?b0FZL0JuLytMa1MzUWEyVFVlK2FMQjdOUmlRS0c1VWs3SHYrQ3htN1dHZXh4?=
 =?utf-8?B?eDF1c1RiUkpFbHJuUjV4VjlwMkNFQXNpd1F5MXBiU2Q1aVpwbGdZT2NzSDl3?=
 =?utf-8?B?M1JxQi9ZbXFhVG1BRnF0RlNCUlpQb051cXlMc2YxTVZKRmVFN1p6VDRsWEo2?=
 =?utf-8?B?b0hBaFY5VWdRb0VFUEtVMk8xOGpXUktZOUtOTThJZFBnYnRXQkh5Y3ZHMFox?=
 =?utf-8?B?dnNBcWVKNVlkOWZzYWErVjFtRWlWYUl1Ri8wK2gybU12a3Z1S2EzRUd3ZzNp?=
 =?utf-8?B?bVNWaVhvT25BVFEzWENzTWIwMXQyNWtrOEl6bFYyWlJlemJoMTNVR1JHM29z?=
 =?utf-8?B?Ky9NVnhpemlRVkdZaDFOVFNlSWNvT09DQ0M3cUF4ZkpsNklNVnFFRTVlQ1BB?=
 =?utf-8?Q?BNr1uIxhWyWZ8PQiiS0reHiKHgT7YYMtXe8WXpx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEpBVjdCalMwZ2w0eVJwNXpLVFdnZUJzL20rbHdyUUdSb3RDSHlLczlFS0kx?=
 =?utf-8?B?Ymw4L0VpRWdKQkROdVRDbTRzeEx2VUxqZHA2RnZhVzVhN0xZb1Btdk5kUXNr?=
 =?utf-8?B?YXdMTHNjbmlEbHVhU2oyZkhWeExjOVlzRE0yMm1xU2h0OHdPaVBLQzE0c0Rv?=
 =?utf-8?B?ckdTand6L1p0SFVmWTh1TTNTVHBwVDhINjJPOGFVbjZSNjY0eDMxZDRaWGpx?=
 =?utf-8?B?eVViZ01sOU05ZEdSNkRGWmNpdGE0eC9PbkxIQWFJVXd1eTI2MDZNVFdkSTNV?=
 =?utf-8?B?bU9sdHFDN3VaWElDbURUMkNrVUJ3N29WYmtrZmI1ZzdGRWpBaVU5ZDd5OHBK?=
 =?utf-8?B?dEhvK1pPa0JZUWRmd3gwUklHZ3FJNkVwWEVnbDZJU3ozT3ZJNFluVisxNU1t?=
 =?utf-8?B?NEEzcjgvcE92NlhwdTdIZCtnNUYvT21QMERMclJNU3hkUlRYQlJOMkFqYnVr?=
 =?utf-8?B?czdJNW9OVHlXQTNIVHJtNkVacGVPanhUVHZSSnNtUnZXZzhMRUVMMlNhKzdi?=
 =?utf-8?B?NHpSVTlBbUxLYUM1SnpqRzRiV2FkR29JWlNFSlU3czNURXI1cU5qZ0R6YUs4?=
 =?utf-8?B?SWlwVmpzZ1FvSnkyQzdKbktNTmZDSVd3OEtYdkFsMUdQamdvOVI0ekE5SUcw?=
 =?utf-8?B?dkU1WG9XWGFCV3Y1cUFldkFHLzVHWkRkbldXdm9EWXJSSnY4Z1ZyOGJwbWJj?=
 =?utf-8?B?UmJMVkw0TnNtL2VUMTlkaDhOL01OdXpsZkxyUjV5Vnh1eTdGM3M5bW5LeUxR?=
 =?utf-8?B?MFhWRXArdkpaOURqdWl2RjMxbUlTNm9JY0gxUVlULzZ4R3E3K0NuS25rZDhz?=
 =?utf-8?B?VFhPQnFMM0FycStjQVZFc3ZVZW5laUlIWm5nVGpXUTJOUnkwNDZ2SlRTNnht?=
 =?utf-8?B?RzlhRWtRZ3k4czgwRE1ZTTJ4TW1LYlVQNVJuQWEzNHRqT0JsUEpWN2QzNDFC?=
 =?utf-8?B?SUhZUUxCdDJmYkh6OWswTzZOMFFiSmI5d1BMYWFvMUt0NEtNNEhDdWlCSHFG?=
 =?utf-8?B?QzY2WFJveUtpemwyV2dKbVNRRkE4aFVUSDVldGRnZStXWndpWlBNdU9RUitT?=
 =?utf-8?B?VUZyVGVQOU1xR3I3dFNtTUVFYlVZbmJBVU5yNnU4SnUrYUUwVHlBcmhKbDl3?=
 =?utf-8?B?M0JhU0FUSG9rZ0pSWEl1bW9JN0poZjF4eVphNk95NHJDZWFWWGpYUVlDdFdN?=
 =?utf-8?B?L29wWGVKZFkxQy91Zk9OdmRVVzBaeWp2aldvQkhlL3Z1clI3dnhzMkFGVXhV?=
 =?utf-8?B?L1drSEhyNWlxUEdiR2JaM1lZVmh2b1krR1RpNmw2RXlneGRRSWtXcmU3dnVV?=
 =?utf-8?B?UHZ6L3B4aW84VE1vY1lkcHZaQjJKWldjME1lbXl1NSttSFlHbGNLSkZ0RDEw?=
 =?utf-8?B?S2xISGdvdGdGQkVXNTg5YVV2ampJajBvK3BCdWk2cTMwbitoSDJZWmNzSmU5?=
 =?utf-8?B?MWdHdmQxeHFGempYVDdQVDA3TEFQSmdJS0JpdWdwM3V0YWxwdERnZi9SRm5v?=
 =?utf-8?B?dDVhTGZCNFQ5Y2txanFjcEFjUlJUR05tTDlQcCtaSHZ4aVJZUnI5KzE3bFBs?=
 =?utf-8?B?TVB5SEFDRWFZVmMyR2FzdjZPeDU0bXZ0Q1JaMS9JNWdudUtzZ2Z6ZkF3L1VR?=
 =?utf-8?B?MmNtMGpzdUJIR1Q2c2ZOYVNIaFVYWmx4MjY2ZHhRMTU2anZBMllKY0c1ME9D?=
 =?utf-8?B?L1A5bzBiWG5JZ1ZGMGhYTlhjMVNOZ3NzN2N1TzZma0hhWXVSV21EMHY1bk1U?=
 =?utf-8?B?ZU42Ylhzb0U4TkhjVHZVZ3RqeWZHV3VPUjVYVUlHRlE5L01GVXoxV0VrcWh3?=
 =?utf-8?B?emRGV2s0d2dBOFRYSGlGV2lJNGhHcDVwa2dGTTlVazAvWXhpWFVZa1V3a1JR?=
 =?utf-8?B?UzI1QVl0cGxzYklzNjdJRTVpWVNzZjJuQWI5ekZldVNGQ2RnY2lLdldjTVU5?=
 =?utf-8?B?Vm5JYU1nTVNHOEQ5Q0IwQjNEbjJqQ2FLeDZNMmViWlZDeko4NjY4dXFDd2NM?=
 =?utf-8?B?SU5qWUVFRWRTbDhWejBSZ0tSVXJHMGNkdFZLZC9kZ2xjZDAyaFl6OXVwbnc1?=
 =?utf-8?B?RUFnazZEd2dkNzNZRUNsM2pycGxpdzJWZ1BDYUs2ZHlMQ1RIdmpSTVBXOHpz?=
 =?utf-8?B?aVQ4T2RjR2J0Uk5la29VTFl1UDJlOVNGQ0ZFVXllTzRicCs1Wld1Z2VLcWpz?=
 =?utf-8?B?NlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76fbe04b-f815-4174-d90e-08dc86f4f994
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 13:23:10.0960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQe2WAAiKp7s4zvboVcXi+m8ZFold0SHpL3jQy3DYXXYApw1IRsQcZhFp3wIM1rkdKV6ubqoj3sbnoIs1tIkaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6865
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

Quoting Radhakrishna Sripada (2024-06-06 19:38:16-03:00)
>In multi-gpu environments it is important to know the device
>bo/vm belongs to. The tracing information includes the device_id
>to indicate the device the event is associated with.
>
>v2: Use variable sized variant to display dev name(Gustavo)
>v3: Pass single argument to __assign_str to fix kunit error
>
>Suggested-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>---
> drivers/gpu/drm/xe/xe_trace_bo.h | 30 +++++++++++++++++++++---------
> 1 file changed, 21 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trac=
e_bo.h
>index c8bd746d9d41..4f45408c3cce 100644
>--- a/drivers/gpu/drm/xe/xe_trace_bo.h
>+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
>@@ -9,6 +9,7 @@
> #if !defined(_XE_TRACE_BO_H_) || defined(TRACE_HEADER_MULTI_READ)
> #define _XE_TRACE_BO_H_
>=20
>+#include <linux/string_helpers.h>

I believe string_helpers.h is not necessary here.

> #include <linux/tracepoint.h>
> #include <linux/types.h>
>=20
>@@ -16,24 +17,31 @@
> #include "xe_bo_types.h"
> #include "xe_vm.h"
>=20
>+#define __dev_name_bo(bo)        dev_name(xe_bo_device((bo))->drm.dev)

We can drop the extra parentheses around bo.

With those tweaks,

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>+#define __dev_name_vm(vm)        dev_name((vm)->xe->drm.dev)
>+#define __dev_name_vma(vma)        __dev_name_vm(xe_vma_vm(vma))
>+
> DECLARE_EVENT_CLASS(xe_bo,
>                     TP_PROTO(struct xe_bo *bo),
>                     TP_ARGS(bo),
>=20
>                     TP_STRUCT__entry(
>+                             __string(dev, __dev_name_bo(bo))
>                              __field(size_t, size)
>                              __field(u32, flags)
>                              __field(struct xe_vm *, vm)
>                              ),
>=20
>                     TP_fast_assign(
>+                           __assign_str(dev);
>                            __entry->size =3D bo->size;
>                            __entry->flags =3D bo->flags;
>                            __entry->vm =3D bo->vm;
>                            ),
>=20
>-                    TP_printk("size=3D%zu, flags=3D0x%02x, vm=3D%p",
>-                              __entry->size, __entry->flags, __entry->vm)
>+                    TP_printk("dev=3D%s, size=3D%zu, flags=3D0x%02x, vm=
=3D%p",
>+                              __get_str(dev), __entry->size,
>+                              __entry->flags, __entry->vm)
> );
>=20
> DEFINE_EVENT(xe_bo, xe_bo_cpu_fault,
>@@ -50,7 +58,7 @@ TRACE_EVENT(xe_bo_move,
>                      __field(size_t, size)
>                      __field(u32, new_placement)
>                      __field(u32, old_placement)
>-                     __array(char, device_id, 12)
>+                     __string(device_id, __dev_name_bo(bo))
>                      __field(bool, move_lacks_source)
>                         ),
>=20
>@@ -59,13 +67,13 @@ TRACE_EVENT(xe_bo_move,
>                    __entry->size =3D bo->size;
>                    __entry->new_placement =3D new_placement;
>                    __entry->old_placement =3D old_placement;
>-                   strscpy(__entry->device_id, dev_name(xe_bo_device(__en=
try->bo)->drm.dev), 12);
>+                   __assign_str(device_id);
>                    __entry->move_lacks_source =3D move_lacks_source;
>                    ),
>             TP_printk("move_lacks_source:%s, migrate object %p [size %zu]=
 from %s to %s device_id:%s",
>                       __entry->move_lacks_source ? "yes" : "no", __entry-=
>bo, __entry->size,
>                       xe_mem_type_to_name[__entry->old_placement],
>-                      xe_mem_type_to_name[__entry->new_placement], __entr=
y->device_id)
>+                      xe_mem_type_to_name[__entry->new_placement], __get_=
str(device_id))
> );
>=20
> DECLARE_EVENT_CLASS(xe_vma,
>@@ -73,6 +81,7 @@ DECLARE_EVENT_CLASS(xe_vma,
>                     TP_ARGS(vma),
>=20
>                     TP_STRUCT__entry(
>+                             __string(dev, __dev_name_vma(vma))
>                              __field(struct xe_vma *, vma)
>                              __field(u32, asid)
>                              __field(u64, start)
>@@ -81,6 +90,7 @@ DECLARE_EVENT_CLASS(xe_vma,
>                              ),
>=20
>                     TP_fast_assign(
>+                           __assign_str(dev);
>                            __entry->vma =3D vma;
>                            __entry->asid =3D xe_vma_vm(vma)->usm.asid;
>                            __entry->start =3D xe_vma_start(vma);
>@@ -88,8 +98,8 @@ DECLARE_EVENT_CLASS(xe_vma,
>                            __entry->ptr =3D xe_vma_userptr(vma);
>                            ),
>=20
>-                    TP_printk("vma=3D%p, asid=3D0x%05x, start=3D0x%012llx=
, end=3D0x%012llx, userptr=3D0x%012llx,",
>-                              __entry->vma, __entry->asid, __entry->start=
,
>+                    TP_printk("dev=3D%s, vma=3D%p, asid=3D0x%05x, start=
=3D0x%012llx, end=3D0x%012llx, userptr=3D0x%012llx,",
>+                              __get_str(dev), __entry->vma, __entry->asid=
, __entry->start,
>                               __entry->end, __entry->ptr)
> )
>=20
>@@ -173,17 +183,19 @@ DECLARE_EVENT_CLASS(xe_vm,
>                     TP_ARGS(vm),
>=20
>                     TP_STRUCT__entry(
>+                             __string(dev, __dev_name_vm(vm))
>                              __field(struct xe_vm *, vm)
>                              __field(u32, asid)
>                              ),
>=20
>                     TP_fast_assign(
>+                           __assign_str(dev);
>                            __entry->vm =3D vm;
>                            __entry->asid =3D vm->usm.asid;
>                            ),
>=20
>-                    TP_printk("vm=3D%p, asid=3D0x%05x",  __entry->vm,
>-                              __entry->asid)
>+                    TP_printk("dev=3D%s, vm=3D%p, asid=3D0x%05x", __get_s=
tr(dev),
>+                              __entry->vm,  __entry->asid)
> );
>=20
> DEFINE_EVENT(xe_vm, xe_vm_kill,
>--=20
>2.34.1
>
