Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDBDCCF9E3
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 07:01:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FEA10EA2F;
	Fri,  7 Nov 2025 07:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T5XC15J8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA38893AB
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 07:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762498916; x=1794034916;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=E9XIKoG7KFQtlJ50Ea4j9lsfeCmKRuZrmYX7LfYw6aw=;
 b=T5XC15J8k2ETi3iyNYwxs1DkSgzQDL3FjACffrfqTiBq2QNwo4fmLRhq
 jlpAwmP+sFBh351Q2xnZzfqyf7IthDHmkHm2NLMX/5h5itrvnpL+bAj3R
 lDoUsUVO3hS9o3HTMDomRllo/Xf7zhKzs+vtmWe3uTiB95+1OPsdBBDeZ
 zqzFaNSjPln3In9GFeHNM+pGONE18gpNVys/PoBWjO5m+8N+UTBSl0/3A
 28r5eIOwAph3c/8q76JoWtQq4nGGNyK97pHZ2YmW3Mlb4pZHbFzZSp036
 dY0t28Ou2Od3GxnwBhdI+DgjRBq9msX4ec+zlTNZU8ujnkWi5/dKLkxiz Q==;
X-CSE-ConnectionGUID: l893LaFhQEW12WsPJcXYDg==
X-CSE-MsgGUID: xPKA0bFGQhqP+KXdAMnl1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="74938611"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="74938611"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 23:01:56 -0800
X-CSE-ConnectionGUID: 1+1uFyA5Ryy+1oCCGXISqg==
X-CSE-MsgGUID: P0CpjKwGSDu/c4fNsvySqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="188405251"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 23:01:55 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 23:01:55 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 23:01:55 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.41)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 23:01:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4GkDJ6Py5BYxDIpB8z43ZU+eR41lFPW9Pg8amqmQ/YuJ5cnUHkPqnepUTr1k9gTqHZE3kaNkWbZrlBe1xUpacFrSlKvaM4QdkuZpwJJmv/HDK3wNRgF+nIQGOTCKo07FPRgSD9atZi+pQHr8nqKkE7yGshvF68Kb+o9gjn4cAKsiymrbKAHLil0nK1XmlkOY4wZiQa//wGWngm57bMURq5m9BjD+RyEMlATzR/J0tIWhesFFJMN5c0OkBOJgujwRuiLLxo0PclrNLkQFrUKOwOtLhIg/uQIvqGTpbnIpAXRgE1jrKz1/nIWCjACV1PFIMkSPwrMMy0bCMQxfJmAkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGEgsfraFQ0l0bu0YcbIMxEaYs7xQ1tkM8xujxvR+lY=;
 b=CSMJUdBfTzOiNhQ16RqfEKKGfx8wDhFZ86HtZaK3qikdaDSPPmZsR1K0FSpRMlYn8NJ9Z17WRM6r/0q6kFFRrG6rx2vJ0Xd4b8NpGDZS1JTtr1mu601ozHBMy5NvjmqFaqbfnUKKjPLE7IN74IZUwMFylwWRSnoU1IRWIZWYCQNJBiIXEg3KX/Btqm0WXYrUU2yNTL5FKZDxo9/TkReH7dxgdYw+IoZMzRu43b8uxfjt4/u89vxQQGPSB/qDMGv2RjX3d0puQcuGHpVTfE6DXqAQsJfBVNGB/dy1ljwRfTNSAL8EJb7q10ma0lTUyltk4Cuq2sqLw6Q1JRZS5Y/htg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4600.namprd11.prod.outlook.com (2603:10b6:208:26e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Fri, 7 Nov
 2025 07:01:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9298.007; Fri, 7 Nov 2025
 07:01:52 +0000
Date: Thu, 6 Nov 2025 23:01:50 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper, 
 Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 11/12] drm/xe: Add context-based invalidation to GuC
 TLB invalidation backend
Message-ID: <aQ2ZXhKjys6Rdwiw@lstrano-desk.jf.intel.com>
References: <20251104195616.3339137-1-matthew.brost@intel.com>
 <20251104195616.3339137-12-matthew.brost@intel.com>
 <746dd3acad81c8af5cb408ff4b50936ecacfeb5c.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <746dd3acad81c8af5cb408ff4b50936ecacfeb5c.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0058.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4600:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de50e94-7506-4f66-8470-08de1dcb87be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDRQUkJhaHlKaXg0NGt2TVNVOGtSYkd2REJwR2thTGNPSTlEZXpDN0I4OTJ2?=
 =?utf-8?B?Slk5dVVCOXBicGpTYnJvRjBNL3A3MjFQN1ZGaVlGNnpmdHpNNCtBZkd4Vm1k?=
 =?utf-8?B?cVl4ZjRoNitmRUdzZ0hreEgraThYN0dXS2hHSGU2NDROekd6OGpJcmEyZGds?=
 =?utf-8?B?MENSVnZqbzc1WDhkUE9MZU0wZFhSdkk4SkxYS2kvUVB1a29HVHNkOVZhdG9H?=
 =?utf-8?B?Wkpla0diRG54S3lxTU1UdGRNZnYvYVlFZHVMbThtTm5CWFRjdXNJS2FBYThU?=
 =?utf-8?B?bkdQakN3TGRPcHJ4dlVDczZxNHA2T0JpekFnSWY1eENVWUdvWmZabVdjY0dB?=
 =?utf-8?B?Yjc3TGEwclBxYi85ZFdWN3F6MkZpZVBISklvVEhNY0YrdlJVOWRLa0FpVHA2?=
 =?utf-8?B?WjRCWisvLzRMTysyMElMTUJOVEZDYjVmNzkrU1Z3a2duL0JBd3RpOVpMVGND?=
 =?utf-8?B?UEZiR1I5TjJYclpFNEJ4VEh1dXVpL1k2a3M0eVgrK3J6TW81bFp6R2RzY1gv?=
 =?utf-8?B?THdWNWtQWDQ1bkhwdnZXYUE4dXY0enlCQWRqWUJlOXpGUWMyMkFvQTFBQk1o?=
 =?utf-8?B?aUZEdjgvY1REaEVURE1JYU9YcmQvRDBkU0xMV2RSOVdpL3FZZ2VRRUc2aGQy?=
 =?utf-8?B?OEcrOXBqajk4dnh6Yk5Lb3pvU2R4TjY5RXhnSm9BMkZJVXdXT1l2RFJxWE92?=
 =?utf-8?B?OTZSRkh5c2ozYlZKNi93UXcwZFBhWWJPRytDSVEza0Q0OG9VVkZwenhUa1F3?=
 =?utf-8?B?L3drQUJodkg0V3JtRDBQSUpJVFB3M3hiODZ4WFJqbWdUdHVJbFViRGhOT0M4?=
 =?utf-8?B?QkR2MG04eTRZenF3djlrbDBIck8zQzR0MzJzSldEMkJ4ZGE3bGsxR1dTMzRE?=
 =?utf-8?B?cDhKckNaOUFQaFRTc25ocTFJeldEbVhPSmlWbWVJY0VNbUVaSDFkU05WZ09Y?=
 =?utf-8?B?TFl0a1ZYWVpYN0xDRlowOWlwajIwSlpXeE1ZWko0dFNOZE5yemF2UVg2K0xE?=
 =?utf-8?B?MEYyYTZQdGVGL2lLZjBxZmRXY21aeTFiMTlQekR2UDA2eHRWNURmVEVXVnpH?=
 =?utf-8?B?bjBUWDFQRlRJZ1ovT3Z4bnEzTGFkR29sc0RIVURvTzJBdksvMitzc1NsODd3?=
 =?utf-8?B?U01wcmtsaXNRdXU3UTNib3gwcWNyaUJuZWZDcURjOEdKOTNQYkp4NTEyVGFV?=
 =?utf-8?B?ekRXdHZicmcydzRVMElkZ0JJclFiNkh5b3R4cnhGMW52a294Q3dYZS82N21a?=
 =?utf-8?B?MjI1SHNvMG13MHEwTFlRSnJubndJdUcvQkVEQWkrL3NxdmY4TmxEOEdycEl2?=
 =?utf-8?B?VHdSUDB3aDk0Y1N5bWpVTjdSc3FPNE9KbGxTVURIL1cySVI0b1EvNlBScFI2?=
 =?utf-8?B?TXNYc2RlckFybTRMR01ybEJYY0lyM2N3aVJWMmNFL0pTRXZnYnBiRUdCbVBR?=
 =?utf-8?B?eHRNTW1HZ2tjL0hSSzNzOWY2TE1TYUpaZVBqWldySWMvZnJDams2bm5QdERu?=
 =?utf-8?B?UTMvMjdhMlJpMXMzUFhONElpbGhydlJodDhBOUJhZ3h6VWpBdlhvTFF0OHNv?=
 =?utf-8?B?KzhzUWFQZG8zUzFuMzJZTXl1ZjQ1NjRFQkxZQk5kTFhKNXM2b1JOdEg1TGpy?=
 =?utf-8?B?Umg4U2gvN1Rkblk0Q3ZGdUxZaVFicVVqNGpHTjFJVGxPOEpXRXY2aTZDTGJR?=
 =?utf-8?B?elFqZkZ4cFVqamdsSGlSaGliYlBhQTcyamZLQjVwemhkVDdJb3U0clliMkkv?=
 =?utf-8?B?NzNvWTNsRmpQWFV6N203Q1hVc3FwbFJacWkwWUdqVEZFWVAxQUNUdmN1WHpx?=
 =?utf-8?B?TVMyb3ZLUEhVR05XR2cwd21oaTNUYmQ4Skgxb2w2YTBQa0Ezdm1xTFBLTFNp?=
 =?utf-8?B?aC80SDQrY2ZzS2xrcUFKemFrQTBDeXBiMHlCNzdDUWp4TGdOTC9VSnZ3SU9Y?=
 =?utf-8?Q?RAqFUVHIeJus8QlGIpueLCjZ7krmc/T6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFdhQ01DbkdiTERRcVR6MSt6OGlyZHdRZlFoanhSN2RucW0yUXhlODliK3hW?=
 =?utf-8?B?NjFmTXcwRW16YlRTaGlGVnEzWGh2YjNmWjhFNEZHbEVxYjhFT3E0ZmZpVkNt?=
 =?utf-8?B?TUZkOXRJU2JNb3ZNTi9Hbk02bUtCdWZzcENodVoyMVl4THpVOTRkQ083eGVp?=
 =?utf-8?B?SVA2SURobCs0a0M1dW9ROUR0MjJUWVlyS3JRNmhuZllKbnhiV3pKZVBCZ1Nk?=
 =?utf-8?B?NXFXOG81Wm5zMFRSdzRNSHU2WEtWOVU4cFIwVjNGRTJha0ZOSFJxQlRUVE4y?=
 =?utf-8?B?cjAwNG9zUUxiWmhLSTBWTDFLZ2FKUFpub0J3ZmFONytPNWdxMTk4cDNsWTBH?=
 =?utf-8?B?YmEvclljR3dFOXlZWjdZWDREenY2Y3V4TlVCS1B5MWRlVkxKck8yR2t1NHYy?=
 =?utf-8?B?QWt1N1ZGZzJ0dFJGbzRGRmNkZ296YVNlNnRQYkxHbW9EcjNkdHRnVlpnOXRD?=
 =?utf-8?B?U1hEdG5IV3dPN2wxMllXdUF0WXJGU0RoeTNRTFZRQ2wyd3dBakJsdHhEc2xQ?=
 =?utf-8?B?Z0tHOGpTRkpVL1doMGtiM25zWDFaeUxjSGg1cHhoNGlrVXlvTUFDWnF5RDVM?=
 =?utf-8?B?OXM5Q25xb3dTVWx2NnFPT1pPaVlGbTBDNzhIWDRtazNXQmt1b1RoK1FuTytF?=
 =?utf-8?B?T0hJY01vcSt5ZVhUKzk3Z3VESEpxRUthRHFlNTQ3NmY0bm9GV1VjazliSGto?=
 =?utf-8?B?d1ZYWGJPOGEvWEhhdVluMjJLZzJnRmwrQWhlSzFIQVgxNnV0NC81cFNJREw2?=
 =?utf-8?B?bnRaTTFHRFI0dWtHRGgveXRlQy8wa3VsWXBOSVJNbkV5VjJ0QWpBdUVHM05l?=
 =?utf-8?B?VkpJR2FHb3pucVQ4TkNnYldSbFc0djlIN3VuVWIwUEVXa2ZHNVVWRzgrcmtP?=
 =?utf-8?B?MHhlQWxlWERZZzNKNWhaY2RCQXNwd0pHenRneGpMVUFudDRTNzV4MkZ5aWFJ?=
 =?utf-8?B?UmZIdzlFdVFUZDNydEFKTE5IcUs5SzVCeWRVK1hRbEdMSTRhUkFxYU8rdDl3?=
 =?utf-8?B?ZkhKOUl4bVZqUkJHNWhwczdWOE9DOWVwa1dUQXZ4MG5kdGlyTlpMck55ajFz?=
 =?utf-8?B?bTc0aDJTWDQwU0VpZHVwT0NlZnlhbzF4SmFDeW9TaTNuc3o0dHgvZU1DdW9R?=
 =?utf-8?B?SHZjSGNDeVEvTmI5eDg4ZytVbkdoUHB2RlgraUg3SmRZc1Q3bmEwU1lyL0o4?=
 =?utf-8?B?RWtyRzhnUGZVT2dLb1g2djVtTElvbU55SEJLTnBzT3pHVzIzRlZqYjZsUWs1?=
 =?utf-8?B?MGkrQk00dzBqcDVpTjVKdWMwSWwwalZwM2pkUnBPWUxualdvRm84dVJZTDMw?=
 =?utf-8?B?SmJzb3JsN2VURSswdVp6ZGJJWlRxZE1ySEh6VitZUHAwWWViMWRCWmFPRWhO?=
 =?utf-8?B?N3Z4dTNLODlVTE9YQ2MwVC9tdHBLY1Vjc2RiRDBucVhreWNYMVlSUmNRSlUw?=
 =?utf-8?B?K0RnODlzT01FbVRTZ1FITzVWQVhpNlM1T2lIN21oWGZOazhwZVhnbEw4TVR6?=
 =?utf-8?B?TFZmVkRySU5Kd2ZUd1g1R1VtbStleWdZMGh2NVdDK09Xb20rUmJXeEtnOTV5?=
 =?utf-8?B?NnhoU0dBUXhjSm01USt1OE9mM0hoNGFyc2NOdEdVRzdVd2hFR3hocjlMdlBu?=
 =?utf-8?B?MFBMSXJiazM3NDRramNJS1pja0lEdVE4VXl1R2kxNUI0ditCVEQyS3pKb3la?=
 =?utf-8?B?NTNhY1NwU2h2Sy9QNnNYSFMvZTFHMzI3Y2t6Ykt4VGpzL0pFLzMwTUs4YWR0?=
 =?utf-8?B?Z05zZ2todmRjUXczeGNPNXhab3QvK1pZZXhzTk9FWHN4YnpCK0x2MWY5M2l0?=
 =?utf-8?B?NDhLUDBKbW51MW5EQXNHNlQ4Y3VUWk9oK25yU3drK1JTWXE0TENYZmFnaDFD?=
 =?utf-8?B?cWU5bENmK3Fna0VzWENtUjZwb3ZSVzJCV1VqZldPelBCWTU0UjUyT1dFNFFN?=
 =?utf-8?B?ZjBOWGVFUWJvNlRXck1EY2xaWXorRitOSjh0b0d5ZEF0ZGwrTTV2VUVJRjU2?=
 =?utf-8?B?N3ZvTG5pRWJUMFBXK1U3Y1hTNlUxcjM2azNCbFhtZ0t6R3k5MFFNUTREa3hT?=
 =?utf-8?B?TlVXZ0FKcXd5YUN3L28xZGY2YWNnZkZzZ0g1TXVjRElVV3I3WUJLKzNBMFZ3?=
 =?utf-8?B?K1BqMjRXenRSdFFGdkhOZmdvMk5RbTd3TjhvbXFWdlk4bDFRV3lNaXc5S0RY?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de50e94-7506-4f66-8470-08de1dcb87be
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 07:01:52.7538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tKO/vCtImGdRRg0pKjBrDRW53SOmi3hr3mx7HVllaZeCynLc79ZGkB+ArVnREhDiBAGbBo3XkT7CTSWPXL6/YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4600
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

On Thu, Nov 06, 2025 at 02:50:45PM -0700, Summers, Stuart wrote:
> On Tue, 2025-11-04 at 11:56 -0800, Matthew Brost wrote:
> > Introduce context-based invalidation support to the GuC TLB
> > invalidation
> > backend. This is implemented by iterating over each exec queue per GT
> > within a VM, skipping inactive queues, and issuing a context-based
> > (GuC
> > ID) H2G TLB invalidation. All H2G messages, except the final one, are
> > sent with an invalid seqno, which the G2H handler drops to ensure the
> > TLB invalidation fence is only signaled once all H2G messages are
> > completed.
> > 
> > A watermark mechanism is also added to switch between context-based
> > TLB
> > invalidations and full device-wide invalidations, as the return on
> > investment for context-based invalidation diminishes when many exec
> > queues are mapped.
> > 
> > v2:
> >  - Fix checkpatch warnings
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device_types.h  |   2 +
> >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 122
> > +++++++++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_pci.c           |   1 +
> >  drivers/gpu/drm/xe/xe_pci_types.h     |   1 +
> >  4 files changed, 124 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > index 145951dd95c9..ca285f4bce11 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -316,6 +316,8 @@ struct xe_device {
> >                 u8 has_mem_copy_instr:1;
> >                 /** @info.has_pxp: Device has PXP support */
> >                 u8 has_pxp:1;
> > +               /** @info.has_ctx_tlb_inval: Has context based TLB
> > invalidations */
> > +               u8 has_ctx_tlb_inval:1;
> >                 /** @info.has_range_tlb_inval: Has range based TLB
> > invalidations */
> >                 u8 has_range_tlb_inval:1;
> >                 /** @info.has_sriov: Supports SR-IOV */
> > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > index 6978ee8edf2e..1baaf577cded 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > @@ -6,14 +6,17 @@
> >  #include "abi/guc_actions_abi.h"
> >  
> >  #include "xe_device.h"
> > +#include "xe_exec_queue_types.h"
> >  #include "xe_gt_stats.h"
> >  #include "xe_gt_types.h"
> >  #include "xe_guc.h"
> >  #include "xe_guc_ct.h"
> > +#include "xe_guc_exec_queue_types.h"
> >  #include "xe_guc_tlb_inval.h"
> >  #include "xe_force_wake.h"
> >  #include "xe_mmio.h"
> >  #include "xe_tlb_inval.h"
> > +#include "xe_vm.h"
> >  
> >  #include "regs/xe_guc_regs.h"
> >  
> > @@ -136,10 +139,16 @@ static int send_tlb_inval_ppgtt(struct xe_guc
> > *guc, u32 seqno, u64 start,
> >  {
> >  #define MAX_TLB_INVALIDATION_LEN       7
> >         struct xe_gt *gt = guc_to_gt(guc);
> > +       struct xe_device *xe = guc_to_xe(guc);
> >         u32 action[MAX_TLB_INVALIDATION_LEN];
> >         u64 length = end - start;
> >         int len = 0;
> >  
> > +       xe_gt_assert(gt, (type == XE_GUC_TLB_INVAL_PAGE_SELECTIVE &&
> > +                         !xe->info.has_ctx_tlb_inval) ||
> > +                    (type == XE_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX &&
> > +                     xe->info.has_ctx_tlb_inval));
> > +
> >         action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
> >         action[len++] = seqno;
> >         if (!gt_to_xe(gt)->info.has_range_tlb_inval ||
> > @@ -176,6 +185,100 @@ static int send_tlb_inval_asid_ppgtt(struct
> > xe_tlb_inval *tlb_inval, u32 seqno,
> >                                     XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
> >  }
> >  
> > +static bool queue_mapped_in_guc(struct xe_guc *guc, struct
> > xe_exec_queue *q)
> > +{
> > +       return q->gt == guc_to_gt(guc);
> > +}
> > +
> > +static int send_tlb_inval_ctx_ppgtt(struct xe_tlb_inval *tlb_inval,
> > u32 seqno,
> > +                                   u64 start, u64 end, u32 asid)
> > +{
> > +       struct xe_guc *guc = tlb_inval->private;
> > +       struct xe_device *xe = guc_to_xe(guc);
> > +       struct xe_exec_queue *q, *last_q = NULL;
> > +       struct xe_vm *vm;
> > +       int err = 0;
> > +
> > +       lockdep_assert_held(&tlb_inval->seqno_lock);
> > +
> > +       if (xe->info.force_execlist)
> > +               return -ECANCELED;
> > +
> > +       vm = xe_device_asid_to_vm(xe, asid);
> > +       if (IS_ERR(vm))
> > +               return PTR_ERR(vm);
> > +
> > +       down_read(&vm->exec_queues.lock);
> > +
> > +       /*
> > +        * XXX: Randomly picking a threshold for now. This will need
> > to be
> > +        * tuned based on expected UMD queue counts and performance
> > profiling.
> > +        */
> > +#define EXEC_QUEUE_COUNT_FULL_THRESHOLD        8
> 
> Does seem interesting for this to be configurable. Maybe different
> applications have different requirements here... But also we should
> have some kind of default. No issue with what you 
> 

Yes, I figure we can make this tunable somehow.

> > +       if (vm->exec_queues.count[guc_to_gt(guc)->info.id] >=
> > +           EXEC_QUEUE_COUNT_FULL_THRESHOLD) {
> > +               u32 action[] = {
> > +                       XE_GUC_ACTION_TLB_INVALIDATION,
> > +                       seqno,
> > +                       MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
> > +               };
> > +
> > +               err = send_tlb_inval(guc, action,
> > ARRAY_SIZE(action));
> > +               goto err_unlock;
> > +       }
> > +#undef EXEC_QUEUE_COUNT_FULL_THRESHOLD
> > +
> > +       list_for_each_entry_reverse(q, &vm->exec_queues.list,
> > +                                   vm_exec_queue_link)
> 
> Braces here around the if() {}. Otherwise it's too easy to accidentally
> add lines below the if condition with unintended behavior.
> 
> > +               if (queue_mapped_in_guc(guc, q) && q->ops->active(q))
> > {
> > +                       last_q = q;
> > +                       break;
> > +               }
> > +
> > +       if (!last_q) {
> > +               /*
> > +                * We can't break fence ordering for TLB invalidation
> > jobs, if
> > +                * TLB invalidations are inflight issue a dummy
> > invalidation to
> > +                * maintain ordering. Nor can we move safely the
> > seqno_recv when
> > +                * returning -ECANCELED if TLB invalidations are in
> > flight. Use
> > +                * GGTT invalidation as dummy invalidation given ASID
> > +                * invalidations are unsupported here.
> > +                */
> > +               if (xe_tlb_inval_idle(tlb_inval))
> > +                       err = -ECANCELED;
> > +               else
> > +                       err = send_tlb_inval_ggtt(tlb_inval, seqno);
> > +               goto err_unlock;
> > +       }
> > +
> > +       list_for_each_entry(q, &vm->exec_queues.list,
> > vm_exec_queue_link) {
> > +               int __seqno = last_q == q ? seqno :
> > +                       TLB_INVALIDATION_SEQNO_INVALID;
> > +               u32 type = XE_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX;
> > +
> > +               /*
> > +                * XXX: Techincally we can race here and queue can
> > become
> > +                * inactive, not ideal. The TLB invalidation will
> > timeout in
> > +                * this case unless we get GuC support to convert to
> > NOP...
> 
> We actually can't support this. It won't just time out, GuC will return

Yes, I agree. I think we'd receive a failure response to
GUC_HXG_TYPE_FAST_REQUEST, but if I recall correctly, in my testing I
only saw timeouts on TLB invalidations sent to unregistered GuC IDs. Let
me follow on failure case (I hit this in case when then the multi-GT
code wasn't quite right yet).

> an error (invalid parameter that the context isn't registered and we're
> trying to submit something via context invalidation - nothing actually
> gets sent to hardware) and we will issue a GT reset. We should make

A failure response to GUC_HXG_TYPE_FAST_REQUEST is indeed a GT reset.

> sure when we send this, the context is registered and any
> deregistration explicitly happens afterwards.
> 
> This is why generally we want to do this add/remove not at the queue
> level but at the guc registration/deregistration level to guarantee
> this. But I see you split the queue add and the submission based on
> this active flag. Right now I believe we're tracking "pending
> deregistration" with exec_queue_destroyed && exec_queue_registered,
> although it might be nice to have an explicit state there.

Locking is required to make this race-free, which just doesn't work.

- TLB invalidations must be issued if the context is enabled or even if a
  disable is pending—otherwise, we risk memory corruption, which could be
  catastrophic.
- The context disable "done" G2H is received under the CT lock; the
  subsequent deregister is also issued under the CT lock.
- The lock that iterates over a VM's exec queues (contexts) is the outer
  lock of the CT lock.

As far as I can tell, we can't resolve this race without inverting the
locking order—at least not in any way I'd consider a reasonable locking
scheme for the KMD.

> 
> Alternatively we could also capture that error response from GuC,
> although there are a few different places we can get an error there and
> we might not want to overload the CT error handler in the event there
> is a legitimate state or hardware error that requires a guc reload/GT
> reset.
> 

I believe the solution lies in GuC support. We could introduce a flag in
the H2G TLB invalidation that signals: "I understand the risks—this may
race. If it does, discard the TLB invalidation and still return a valid
G2H TLB done response."

We’d likely disable this in CI builds unless it causes noise. In
production, if we hit this race (which should be rare, given CI passes
with the race exposed), the worst-case outcome is an extra TLB
invalidation—which is acceptable.

Matt

> Thanks,
> Stuart
> 
> > +                */
> > +               if (!queue_mapped_in_guc(guc, q) || !q->ops-
> > >active(q))
> > +                       continue;
> > +
> > +               xe_assert(xe, q->vm == vm);
> > +
> > +               err = send_tlb_inval_ppgtt(guc, __seqno, start, end,
> > +                                          q->guc->id, type);
> > +               if (err)
> > +                       goto err_unlock;
> > +       }
> > +
> > +err_unlock:
> > +       up_read(&vm->exec_queues.lock);
> > +       xe_vm_put(vm);
> > +
> > +       return err;
> > +}
> > +
> >  static bool tlb_inval_initialized(struct xe_tlb_inval *tlb_inval)
> >  {
> >         struct xe_guc *guc = tlb_inval->private;
> > @@ -203,7 +306,7 @@ static long tlb_inval_timeout_delay(struct
> > xe_tlb_inval *tlb_inval)
> >         return hw_tlb_timeout + 2 * delay;
> >  }
> >  
> > -static const struct xe_tlb_inval_ops guc_tlb_inval_ops = {
> > +static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
> >         .all = send_tlb_inval_all,
> >         .ggtt = send_tlb_inval_ggtt,
> >         .ppgtt = send_tlb_inval_asid_ppgtt,
> > @@ -212,6 +315,15 @@ static const struct xe_tlb_inval_ops
> > guc_tlb_inval_ops = {
> >         .timeout_delay = tlb_inval_timeout_delay,
> >  };
> >  
> > +static const struct xe_tlb_inval_ops guc_tlb_inval_ctx_ops = {
> > +       .ggtt = send_tlb_inval_ggtt,
> > +       .all = send_tlb_inval_all,
> > +       .ppgtt = send_tlb_inval_ctx_ppgtt,
> > +       .initialized = tlb_inval_initialized,
> > +       .flush = tlb_inval_flush,
> > +       .timeout_delay = tlb_inval_timeout_delay,
> > +};
> > +
> >  /**
> >   * xe_guc_tlb_inval_init_early() - Init GuC TLB invalidation early
> >   * @guc: GuC object
> > @@ -223,8 +335,14 @@ static const struct xe_tlb_inval_ops
> > guc_tlb_inval_ops = {
> >  void xe_guc_tlb_inval_init_early(struct xe_guc *guc,
> >                                  struct xe_tlb_inval *tlb_inval)
> >  {
> > +       struct xe_device *xe = guc_to_xe(guc);
> > +
> >         tlb_inval->private = guc;
> > -       tlb_inval->ops = &guc_tlb_inval_ops;
> > +
> > +       if (xe->info.has_ctx_tlb_inval)
> > +               tlb_inval->ops = &guc_tlb_inval_ctx_ops;
> > +       else
> > +               tlb_inval->ops = &guc_tlb_inval_asid_ops;
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c
> > b/drivers/gpu/drm/xe/xe_pci.c
> > index 1959de3f7a27..9a11066c7d4a 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -863,6 +863,7 @@ static int xe_info_init(struct xe_device *xe,
> >                 xe->info.has_device_atomics_on_smem = 1;
> >  
> >         xe->info.has_range_tlb_inval = graphics_desc-
> > >has_range_tlb_inval;
> > +       xe->info.has_ctx_tlb_inval = graphics_desc-
> > >has_ctx_tlb_inval;
> >         xe->info.has_usm = graphics_desc->has_usm;
> >         xe->info.has_64bit_timestamp = graphics_desc-
> > >has_64bit_timestamp;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_pci_types.h
> > b/drivers/gpu/drm/xe/xe_pci_types.h
> > index 9892c063a9c5..c08857c06c7e 100644
> > --- a/drivers/gpu/drm/xe/xe_pci_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> > @@ -63,6 +63,7 @@ struct xe_graphics_desc {
> >         u8 has_atomic_enable_pte_bit:1;
> >         u8 has_indirect_ring_state:1;
> >         u8 has_range_tlb_inval:1;
> > +       u8 has_ctx_tlb_inval:1;
> >         u8 has_usm:1;
> >         u8 has_64bit_timestamp:1;
> >  };
> 
