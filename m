Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523C2EEA871
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 00:14:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0454610E2BC;
	Fri, 13 Feb 2026 00:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jH3as8ct";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E02210E2BC
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 00:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770941673; x=1802477673;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+P6+yxw1m212k/6f+RAnc6aINsl5nA8VxHpiDijq+2Y=;
 b=jH3as8cth4wdbCuFq/YpDV880Rp1mGeHEUOQnY+uCbwc8bI8pW0/zgFh
 NgasOSYHSTdZRoqbl7vQXV9VrYhNNO6GHi+1KslsnPHNs6UgDItUshnom
 1AR8b58Jqw1TuFezFexvray26px3t4iTHSVotGmXa+0oHY+ztSvwC3Q4l
 swqriF/n7DD9U3/wOxMvlYbZMfAEsRAE17Y6+TPF3vLSo+wq3pVBcgrx+
 bHMArm1IpB5cEe3KPxA74b3QdRwrCE6xmIo2y4q1VbapNFbV/dgd7Eqp8
 7CyueI+XIg24vMpeovv7fjYOsxU/khJyIXcb5WxgqQjDtrEkMTTpC12f6 A==;
X-CSE-ConnectionGUID: 2EgoCNjBQ6CV1Zog1f1+qQ==
X-CSE-MsgGUID: uTMNxutZSHmYcUzI3ZOpVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="83569823"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="83569823"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 16:14:25 -0800
X-CSE-ConnectionGUID: /ZKQD0lrRBi5tww8EX43XQ==
X-CSE-MsgGUID: A4MuvXTyRH2yhnZ/TvfM5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="217246493"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 16:14:24 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 16:14:23 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 12 Feb 2026 16:14:23 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.69) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 16:14:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lh9NYLI9JvIHo0fwms/Mm9QgLAKzfOdkdmnCBS4LGlOzKCGX3l60fp6LSWYr4Lk1PnGL9U4uyPECM+aK9Xk5s4MrKo2BLFU/RoEsxRcgJGI4VqFIH6F2fdxZ3pV6cHu3S82LPwytTc7tJQZqz4vFTbohIkPjPbjmwpmMbM2ciQj/0pD3Ip4H/mSwRx0ENlIBCK0FREyw3yhRwjJ3quLpTOru2qJTBFiT4mW4S07hKpYm+gXlxMW/T8Y7TOmCAqVIUNoaMXvXCoBrq9LZbqVxqML8N9Uw4iIwxfgHcJX7jjDqSuYzqKUqTO0Cc34Ko2Kp0ADJ92d9GzfFqaku2w/0SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLeBaXvCVZdweRKewNDxX96BnQAGdNa8I/uBzJjI3Vo=;
 b=EinNtU21PSfbOCnWcgyf/M5s/SC0GpPZwTK+2aITtchG7LBMTUfvbYyCZNw77QyQvixYzl3UXnDkFX2i02K1OqP4kPAi8KUePbZKgffO+RtLmKCxT63TI0te2BO/gzDcb3amrBySkqfNPVRKrqWohLspwi1rZNUdsvwoL4s5DIrYp7QIU+iugfGVKbQGmXLzLH1GxQNceLB61y5groA50T8QbYLiaAfDTdmyVXHhzQDFVC4uM7LDwkA26lOdVv0e8DEzcR/LO+Bqc9/5SPArBP+moqAlxrARIjiEoAhhsHvkdtR6MU0kShVpHP0tpTK9/xefWso8jYXWA5gIcVfN9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CY5PR11MB6509.namprd11.prod.outlook.com (2603:10b6:930:43::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 00:14:17 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%4]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 00:14:17 +0000
Message-ID: <e6a75a05-4a1f-425f-8320-b9726fa7c5c1@intel.com>
Date: Thu, 12 Feb 2026 16:14:15 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/xe: Enable Wa_14025515070
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260206225610.3232909-5-julia.filipchuk@intel.com>
 <20260206225610.3232909-6-julia.filipchuk@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260206225610.3232909-6-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::21) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CY5PR11MB6509:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ee31ad9-aa44-4761-fd86-08de6a94d3ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDVROC9HRzBKbStCNXVTaURObVQ2T2NWR1U3Y2l0L1JGVllMNkExaWdTSXNS?=
 =?utf-8?B?cE5aV2hScjliaCsxdXZiWG4ydVRsMWxjRnlEODlpMXJWQm0weDdobDN2M1FU?=
 =?utf-8?B?U0I3cGdxVk1CeW5mWHAyWXVmM3hwUEJkWEZWS21OTkg3OFlSZW5Ccy9ublZS?=
 =?utf-8?B?TjRXWTA1Nm9ETS9ZdWFLYWZUN0NadTRaeWlQUHdHNUc3dmgwaEZCdFh3MnNw?=
 =?utf-8?B?MXlIckUzUUNtNVBTbitsQVNZU3hmN1ZKa0VrMGoyR2dMa2IxSTVMK1VhT2V5?=
 =?utf-8?B?L1pPZUxuWkIyL1gremhqeFFzUVBveHFCZi9SVVRhU0s5K0hwY3d6enYyV3h3?=
 =?utf-8?B?ZjVBK1lYbEFNQmlFMmJNNERZU0pBNHMvaWRRd1JtRUFFM0Fxd2daL2wrLy92?=
 =?utf-8?B?ampJQ0Vuc3NQVmJPWk0xNU9uWDkvMGdRYXA1b1RPZjBldEhDOVFCK0g0S2tX?=
 =?utf-8?B?ZEhPSmQzcmxJbisyVWIvYTVXUmYvYThLbm0wWGw1bXNRdXlzeWNWQWx4NXpD?=
 =?utf-8?B?cFpmY0Y4RVlXSGY3UjFzRUk3enpPV29WNFhTOEJ0WnhJN21mdW5XMm1TaGk2?=
 =?utf-8?B?K3FpOVVHdk5seHV4ZUpZekllMlVRSDd3UzBHWlA3S1BuaThaZXNNY3ZtUTJD?=
 =?utf-8?B?V1JuNkZtTk8zdW14ZkJNLy82WmxwTzRsT3k2ZDBldEE2SkFYR0ZsVFFtWEdp?=
 =?utf-8?B?REZFa25lTTE2RXBnb3BFRVZRcHhJYjhQV1BCRnFvYUppVzcrWWhZQkJiWldQ?=
 =?utf-8?B?T1VqQjVzUVFGRGV5M0s2Z21GemxsNTBXRVdIQk9rZ2diZCtjY3ZHNkNUaXB2?=
 =?utf-8?B?R1BzOE52Y2ZoR1lFZ3VRM3JTOHJEZDJKRmtMcS9Ed2pFVmxVSUZMTGF2bFZk?=
 =?utf-8?B?QVRHOCtUVXU3YURNT3BMcldGK2ZEd1c4YTFPazhFSlE4N2NGOWRGUEYwMEJH?=
 =?utf-8?B?YjhmQUZxTGc1Z1p0RUpHM05ieDlLcjFGUmFnTGJObDBUc3hZOGRaelN1OE9l?=
 =?utf-8?B?OW96dUllMnRFNHZSZjViSGdSWFVFMjhBR0psM0RZSTF5UFQzMUZpNVBtc2xj?=
 =?utf-8?B?SC84dWoxQm11ejB6Qm9PTFk1T09DTXoyQ1o3VmlYbnBXWlhxQ3ZBU2xzYVdo?=
 =?utf-8?B?RVRrbUp0UkRvU3dONlYxckpVZjM3QWhkY0o4eC9jM0Zma2hBamRKd1d3aFBV?=
 =?utf-8?B?QldqWGpoTFFPKzV0dDZkM2VEaTVwYk1Dc1RKM2F0SE45MUdPZE1tWjdQenhR?=
 =?utf-8?B?VEs4d1pSaytqV3dRYTh3eGpvNUJnZlNPaEx2RHowNGtOamJGYzRvSW9BWFBP?=
 =?utf-8?B?YkthZE9sUEtySGtqM0tqY0l4MnpRenhUbks1SGNHZkJtTzErakhJdEJyaXRk?=
 =?utf-8?B?TXNhVzNJSGlGRW95cThPelZOVXVuc1FRb0x1UFpXTmprQ2JPcW1kbUE4VmFE?=
 =?utf-8?B?WFFndkRWL0J3NHQ0enlYWXhzRXZtbDdOaW9VbnIxa25hU1FMMy96ZWdacFJB?=
 =?utf-8?B?VGR4VFRiQ2hnWjhCMmJKZWlUcmFIYkpGbVZGeCtqZDJYdW5zQ3RXV1RVRXBU?=
 =?utf-8?B?aE9WQVl1STlJbFI5RDFrZWpqak5rNDRtWVM5YjFnNEVxdnpaWWtzaW1yTG40?=
 =?utf-8?B?Z0Z4eWlWZXFMSXQ4Nk5QUFNXeWZUdFZmUkJaY1VYUUtuOUJZbEJUM3pDK3RR?=
 =?utf-8?B?VTVBSHVmWkVONVNyKzlEdU9Nd2hCaUc5UmdoOUlodktYWnRjRDRwcTlZejZx?=
 =?utf-8?B?QVAweDFpVm45aG9hRE1XM3JOanUzeXdoT01sOFMwMXU1ZXI3N2crbXdJTkRs?=
 =?utf-8?B?V3c0MElCMm5NMndsemhWdFcwajB5V1h1cVpoUEZzazRyTGtKK1NYNCtmRWls?=
 =?utf-8?B?R2h3UWZRR3M0bUh1TUhJZm8rUjM1VkJGK1FqZ2xSZDJWUCttL0NhUGZSY0pU?=
 =?utf-8?B?aVNKNmx6dk9td2VVMzdPbXIzWnQ1bmlyTmN3ZEM2U3dGeVBjeEV5YWxUd3JR?=
 =?utf-8?B?ZXdsV0JJMW1uZ3YxS2xVVS9zeGhSalMrZ3JZTExkOU5VWkZxWFQ3enZMaGp0?=
 =?utf-8?B?RUluQlBkblpUc3ZvcUx1M3d3QVpzUS9rL1dDZmI5N2VFQVR5ZkFEWW9TekZP?=
 =?utf-8?Q?rNX4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDJpdzR5MHNoVXlFalF3cmNoSHFOV3FTYVFFZ1NidFFlM1lpOEJSTi9TN2Rn?=
 =?utf-8?B?dnV1LzAwKzMrMGFiVjc2Q3Rxb05RMi8wWUFWa0JhZ1RLMzlWdjVvQnM2Q1NE?=
 =?utf-8?B?QTRjczRDZW9rUzdOYzMwMVY2TmFPZW1jUWM0QlZIaGIyUktaTXh3TExFVFhW?=
 =?utf-8?B?TCt4UmdKWEdxMzJqanpic1MwRmVaekZmUmQ4dkttdlFSQjk5VWNBemVRdlpQ?=
 =?utf-8?B?UU96cUNQOHRGZXh0d3lYQTl4T0lLMTFpZjlPY0dqUlpzSFZkSkloWGlzK0U3?=
 =?utf-8?B?NnI1QUc5bEh3aWlvdWJOS2JHSzR5QkRySTE2STlYSElUOWhJT1ZHbWhjZytM?=
 =?utf-8?B?cVgwT3B6V0xGampkcUNDQTk1MTE0RWZrOGpUMFlscXJORFR5Z0RzUlFpbmN0?=
 =?utf-8?B?dXJRZkZHZnh0UDREZDMwbktiWHNJM3FYVXYramRhQzFBL0ZMV2pKYWphQlZx?=
 =?utf-8?B?aGFjYWZ6RGE3VGpaVnZlUWpEdDMxUFZJV1kzaUtIenVVTlRWKzhEbThrYVo2?=
 =?utf-8?B?bm5wVEVRcis3Yk5Edmd2cFYwVERHUDFmVklXL05yRlQ4MHhXOXFuN2RHU0M1?=
 =?utf-8?B?WWxUWWhVV3JQMGtPYVJBOWorTG1vUXA4VUJQMHZubTBHczVhV0U0a1U4cS9T?=
 =?utf-8?B?UFZkQnduR1h2ZHRlZXZoODZlSm9sOEhZdStmekNNTlh3eVp0RFlrNlVsa04v?=
 =?utf-8?B?RXluWHRLMmMyS2FqUkxmL3I2Rkx2RW5SMGJpSWJEOVV2bnZHcEFCQ1J6VnFP?=
 =?utf-8?B?OVc4ZWd3dmdyTUpQYXFLc3oxWHFrZ2hyUEdLa2hEa3ZjN3NidzhNdUNTT1Ny?=
 =?utf-8?B?UWU0VGlxTUZ0dUgwb0kwVlQ1Mk03UmZtRXNJeWc1TWNLUnFmRzRqVXI0bEd3?=
 =?utf-8?B?UjlmM2pZT0ZGMngwY0V2RU9CSmpITVpFRjE4YkpROUxyZlRsUFFYNmE2Uk1S?=
 =?utf-8?B?eFFlNk1JMVF1WVc1WERDaWhIRGM4UjRqbDdPL295dXZkZVZoUjBCR2ZBOVM2?=
 =?utf-8?B?VE5CNG81S0JaYzMzUjE3dHJYci9YTmRhZ0dBWisrOTdieW9kSGJWUEtvc1V0?=
 =?utf-8?B?Sk95cE0waHVNeGpBelI0YUp2Qk9lR2RvNFdGaGFZSXFhWTJQTHhuNVYxeFBY?=
 =?utf-8?B?c2U2U0x0Yno3cmNna0hQMk54RFFqa1JoRkQxT0pWMjhiSUlxeC9HRUtscGZj?=
 =?utf-8?B?K0ZoYVYzUmhuRldEdnFDd2tyVmdDQkpXWjRHU21mUTZGSXl1ZVlJaVJ1V2VU?=
 =?utf-8?B?WCtnZ1ZKamdQRk52VXJuaFZOS1NJeDhPMDE3cHJLY1ZoRldpWXFkb0RKdnY0?=
 =?utf-8?B?WDkyMXlmUnFlNkF4YkNiZzVxazVhcFJ1MnZSUExxcDRscW9jLzFodjE0Y3VE?=
 =?utf-8?B?Wlk0UDI5MFZmN3NrVm5oRHZhdU5CNk9Ra2t6RnlLeU8rOGpmcmxFczF1RTBq?=
 =?utf-8?B?bzNrM0V3RDZJY0ZiY1NieGNYVTIrWERPL05Ecm5VeGtFb2hrUmdQNW9DMWdt?=
 =?utf-8?B?YzZuVTZ4cTU1azhFVTMyOFJKYUpSb2Z0Wnk2ZDZNcjhmSEthU2RaalB2ZVNw?=
 =?utf-8?B?T05oQ1MyYUJiVjhDNW8vcXl1NnRzaDFYUzlIR2crT09hTHA1emgzR29hWjhD?=
 =?utf-8?B?VldSR2JpSGxnekRQUjFDeTB4dGttVVBlL3dkZXBHcVBJUDd6OUIzTSttRDB4?=
 =?utf-8?B?dEh4NGs1MXZJQTJLZ2ZSRjlpbEhyVWlkbmIvRkRjWXBHUldYL3R4ZTBrNXpj?=
 =?utf-8?B?TlZNS1pzcjE0Vlovc1NwWXJTWlY4OThyaXJReDRIOUkvTUluNHl3MUNjRGUx?=
 =?utf-8?B?T2Fodk4wd2FLNklKTXgwRWd3Z2RKWkpzWFBMUkVyQ0ViM2RrY2RRSCtTZHRJ?=
 =?utf-8?B?bWtjKysyamMyMlJRL1NvcHVPaW9zZDBnT3pMaG9sN2VtKzFzVDZSa1JTWDVU?=
 =?utf-8?B?MnZHOUlTYXdIUGU3ZlZOcnlzN2ZMRER4aFJtTDNTSTlnaUJ6NHhCU0hwYko1?=
 =?utf-8?B?VVJZVis3eHpmL1doYk1JRm8yeDlQd3lEQzFWUnVsUURUV1ZiUjlPS29mdTV0?=
 =?utf-8?B?SE52dkpmSEljMjlZZUN4dWlBNG9oNkpGalMvQjdNZVFIRnZtWHpqbWc2RSt2?=
 =?utf-8?B?Q0U4bUhtSHdHZUVuRytvbFVkeFN4QkxVeElLZ203bnZMemkyUUZPOSt0WTQv?=
 =?utf-8?B?ZThzbmJOMm1QVFZoTGtIYWswQzI3QVFDM3pSc1hSMGRRK3IxUHc1TTVQenpz?=
 =?utf-8?B?L0RoN3Y5K3dIdDIza1FDc3lNZUszbXJweWdrK0d5bzl1eEVlNVpVSDhLZ3NT?=
 =?utf-8?B?RWFNVUhQalArNHlGTzc0ZFBJTERFUUtxc0lSK25RTkhQY2N1ZEhWMzlUcHNu?=
 =?utf-8?Q?zb12wiYwbigdmzho=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee31ad9-aa44-4761-fd86-08de6a94d3ba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 00:14:17.4426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vFqZAR3nUZsku/Wt8Cr/HO2L1g4P3oWmmXSN7ihGGEC+PZpJK3+ZP3wGH7CjLhYVKwHtjUiXsdGTyS/h7pgc8QjEHsfxciye+2N/NfUT20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6509
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



On 2/6/2026 2:55 PM, Julia Filipchuk wrote:
> Corrects a failure on context switch. On registration of context with
> indirect ring state will correct state of targeted and idle command
> streamers.
>
> If Wa is unavailable, notify and disable indirect_ring_state.
>
> Added additional XE_RTP_PASTE macros for expansion of longer rules.
>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  1 +
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 10 ++++++++++
>   drivers/gpu/drm/xe/xe_rtp_helpers.h   |  4 ++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  7 +++++++
>   4 files changed, 22 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index e33bd622ab44..f0815500177b 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -496,6 +496,7 @@ enum xe_guc_klv_ids {
>   	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO					= 0x900a,
>   	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
>   	GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG					= 0x900c,
> +	GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG			= 0x900e,
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index f4cbc030f4c8..6a5863a54215 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -360,6 +360,16 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>   	if (XE_GT_WA(gt, 14020001231))
>   		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
>   				 GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT);
> +	if (XE_GT_WA(gt, 14025515070)) {
> +		if (GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 53))
> +			guc_waklv_enable(ads, NULL, 0, &offset, &remain,
> +					 GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG);
> +		else {
> +			/* Disable indirect_ring_state when workaround not available. */
> +			gt->info.has_indirect_ring_state = 0;

To double-check I've put a log in xe_gt_has_indirect_ring_state() to see 
if it was ever called before this point and found that it happens from a 
couple of different places:

xe_guc_ads_init_post_hwconfig -> xe_gt_lrc_size

xe_migrate_init -> xe_exec_queue_create -> xe_lrc_create

So this is too late to change has_indirect_ring_state.
Sorry for the late comment on this, during the review of the previous 
revs I checked the code and didn't spot those instances, but now I 
wanted to be extra sure before giving the r-b.

> +			xe_gt_notice(gt, "indirect ring state requires WA in GuC 70.53+\n");
> +		}
> +	}
>   
>   	size = guc_ads_waklv_size(ads) - remain;
>   	if (!size)
> diff --git a/drivers/gpu/drm/xe/xe_rtp_helpers.h b/drivers/gpu/drm/xe/xe_rtp_helpers.h
> index a33b0ae98bbc..e462a4d5ad69 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_helpers.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_helpers.h
> @@ -66,6 +66,10 @@
>   #define XE_RTP_PASTE_10(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_9(prefix_, sep_, _XE_TUPLE_TAIL args_)
>   #define XE_RTP_PASTE_11(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_10(prefix_, sep_, _XE_TUPLE_TAIL args_)
>   #define XE_RTP_PASTE_12(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_11(prefix_, sep_, _XE_TUPLE_TAIL args_)
> +#define XE_RTP_PASTE_13(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_12(prefix_, sep_, _XE_TUPLE_TAIL args_)
> +#define XE_RTP_PASTE_14(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_13(prefix_, sep_, _XE_TUPLE_TAIL args_)
> +
> +
>   

Extra blank lines.

Daniele

>   /*
>    * XE_RTP_DROP_CAST - Drop cast to convert a compound statement to a initializer
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 5cd7fa6d2a5c..3e677c911960 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -69,6 +69,13 @@
>   		MEDIA_VERSION(3002), FUNC(xe_rtp_match_psmi_enabled)
>   16023683509	MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
>   		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_psmi_enabled)
> +14025515070	GRAPHICS_VERSION(2004)
> +		MEDIA_VERSION_RANGE(1301, 3000)
> +		MEDIA_VERSION(3002)
> +		GRAPHICS_VERSION_RANGE(3000, 3001)
> +		GRAPHICS_VERSION_RANGE(3003, 3005)
> +		MEDIA_VERSION(3500)
> +		GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)
>   
>   15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
>   16026007364    MEDIA_VERSION(3000)

