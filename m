Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C30E81A44
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 17:04:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E1D10E3E6;
	Mon, 16 Feb 2026 17:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dgm+VSFQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF5510E3E0
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 17:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771261472; x=1802797472;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3NCkA/poOJ/thw056jJNlMlja0PtM58ggqRCYX5RiFY=;
 b=dgm+VSFQ6SfM90wmo9PanzdjNJ/IsdTmpUK2ZVSTNsiCYfU/8ilx9/lq
 qZ5Opl/8oJJHrL5fSdsS3bf0ruRUWmJrL9gNvGmV8Wp1+y0LHWZoErWBT
 C26CJDExMoOdU5HvE60R5VPpyv2AZYWRupRVjD6lDHWigN5K8jeOR9wPB
 IW8zXCwCMpIn/NzqbSqBCjBeqHqMkZ5XAkOUXoXqlxN2WIBFdgehCcTv9
 MqBw/3HtNTFm7UuD5GoGMAz2jZh/sHK/+WvbrARHfgISPv7U93c8WR7ke
 3OLGMQOBZsNNxc+/f0WESlnkOft+xUHTQqFsZNRzjMRV1IWuY973mahKq g==;
X-CSE-ConnectionGUID: OcwYQkztSzCbsbOQ2NNKug==
X-CSE-MsgGUID: GYMnbYIXTrqiOeS/B56WvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72438653"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="72438653"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 09:04:31 -0800
X-CSE-ConnectionGUID: EqXMGv6CQZ+nNBazeUl4VQ==
X-CSE-MsgGUID: 5kmoZDiPRna0S5VVVB+0MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="218644196"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 09:04:31 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 09:04:30 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 09:04:30 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.30) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 09:04:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wLyrn6ihEqk7sfTA7zHS6RzOlGSIFP1uwWZBgG8D4rVfR1VBiYQg/+5iQgBRfw3qT202G6TpilvKj1YGmDtBsiW0pXnCDdIrcWLyFdEBM8GojgfB3zt+EzxFsyA1jKGgokj06QAZ3MpMgtchQhzgOMB4+WvRmfW3/6KFVQh1tUD9+jNAf+RqKX72cPXLHAR5YaeBbrKKXxlzixMCRNTLL3Phs8mqcccg/h14sWwGGdrm3xNsHYlnxT4gif6gKcA3+177mXm9fy6vqIlxNv96pp3am7Y6qOsKne/9uMkXZZJ7D7mCDqQ13ZIZHR1M4T32HZMy3HP5kYHjzqhhJgA3xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flsw6wLyvHF792lPNuB96mIzcZSaDk4L3FmXttzRwYA=;
 b=Ijr9BiTFkv96tzs7gAgGfV8j+6JUSt/B795ms+UmlLpkYiSy3KOcwaLi6ADVHNTO706+6v1s/r2GRpj5r0MNjtQk23pJtIqmTaxpeP9XZDsW9fO4ZCj2z+32wsOCqF3Bjw72TSVGqksRhhqLDQVlMTw7JGnrRgP1E1nQ6OhvakLQz5p6nh4uC1bBZgGoT5MosWGIzAHcsIKV/RtMzI9ORcl58muBdZIWKQDf5MxKK031o7teiUCxx4C/QySZL+IeTEIkKpAr7v7wdwH4m43bOgMBiQH6caiKvbt3RoJX/UHEKzPdzwONen6aS4/W0koCA1I0EE9Nj2Copz+E7MX/mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MN2PR11MB4568.namprd11.prod.outlook.com (2603:10b6:208:266::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Mon, 16 Feb
 2026 17:04:28 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 17:04:28 +0000
Date: Mon, 16 Feb 2026 18:04:24 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 9/9] drm/xe/pf: Add documentation for vram_quota
Message-ID: <20260216170424.aijirkstpbqyltqk@intel.com>
References: <20260215203323.595-1-michal.wajdeczko@intel.com>
 <20260215203323.595-10-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260215203323.595-10-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR0102CA0019.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::32) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MN2PR11MB4568:EE_
X-MS-Office365-Filtering-Correlation-Id: b233613a-6795-4f1d-d6f6-08de6d7d7202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHFGaGxzWmlRd08xTDlyWVpCWUs5a3FQOElOMkxFZGVKTnpqaXU2aTBlbnc3?=
 =?utf-8?B?d0d6MEp3YTRsM3dQZTFaY3VOL2JHa3JJNzVLMlkvb2kwbGNDdjlCWnBJSzk2?=
 =?utf-8?B?YTlOVnFjRnd2N3ZVdlVnNDM5TnJKYTlDUFpuY3RRQVZ6aFZvNnphRHpXVFVq?=
 =?utf-8?B?bm5Ed2xWcUM2c1ZCS0Q3WWdjQ0V3OS8xczlyTXJ1RitXZWhwOE9SUTdaUy9U?=
 =?utf-8?B?UjZpV1h0MGQ3S2RHUEhMM0dRWkVhVDRVcVBpaXZZRjMwbXZMd0M1NWhLdTRY?=
 =?utf-8?B?SGNsV0xXblNqQzZ0aEFNR2JHbTJMc05Hamc1WGlWMUtEeHlDRG0yUnR3VGtT?=
 =?utf-8?B?ODlFRDBWbmw1aHFpNnJza2Q0bCt4RFkxaHRTaVlxb0cwdk14ZW1JWE16Z0c2?=
 =?utf-8?B?MUpSSXZiaXdRdnpVYjNXYVJoTVZ3WFZPTEhHcHRmWEVSSG0yK3BGWGdVbCti?=
 =?utf-8?B?cHV0bXJUa00zejJBZ3B4RWp1ZVFsMTF0aGNSWmpUU0htRndjVk9qeDkwZFNS?=
 =?utf-8?B?V1FGZXEya01rN3JwWituYzFtTXZEUHdyUlZrK2VkNnlHbWUwbWNwTkFMVlNn?=
 =?utf-8?B?YVFWWDdXc05JZ003Q0N6YmVVdzE2LzBORWo0NXZ5Q1RqSXZOWnlFVjhEdHJS?=
 =?utf-8?B?Zk1ZYm12eTNqeitzMGUrZjVIdGtTLzVZK0NaZEhDMmN6TWRqNTVNaUJHeW4x?=
 =?utf-8?B?dEgxZmMvY1FraGVTd01PdkxsTGV5OFBGQWNzQjhQZFJra2QwMUJ3a2s2SDdX?=
 =?utf-8?B?UHlZOGRDaEkvRnJMdS9GTnhuL2ZUa0lqSFNBSG4wTFlkQzhOM2ZjQmppMTZW?=
 =?utf-8?B?bzZydnhvaEVDaWNIUk95alBZd1Y0ajg3NEM3OE1zdUI2UTU2VWRBeWpzWGFi?=
 =?utf-8?B?T1ZnTkxEcXMrYjNYVXdIeEU3clYwbldiUkg1Mjk0Z1dtWVFLNnhXMWM3WXFT?=
 =?utf-8?B?STNoWVN1NlA3ejV5WCtraUhwRFFieGM0VmQ4ZklqekMycitjcmg1dVZkaGll?=
 =?utf-8?B?N3I3Tk4zQnBQclpiSXYrejlnanhYQ0NVS0ZKaU1Ldjhld2NBZ2xwWnZDOTMx?=
 =?utf-8?B?UEdmdGNyNFhtZFJmb0t6YmZXRS9LSlVqNEpkN25uRUJOQTZEdGUwUXU4RTVy?=
 =?utf-8?B?UUZTQ0NhbWJSdnd4U1VnaEk0cTlGMlB6RUpETmNkRE1LV2RiRzc2UUl0VDNG?=
 =?utf-8?B?WHIrM2kzN3FzeUwrTlI3b2RGWHBUV2N0eTZGbnRQTThSVEZlZEE4Q2p6QjRh?=
 =?utf-8?B?NHF2RThGbzJOVDVTRVRRVHlwZEk3N3ltYUVKNXFpQWdrODFwbDVPVWUvNXRB?=
 =?utf-8?B?YjNEQ1FjL2NGMCtDZER1NkpvZ1pybGVaTUhGZEQrNXU2cndCVUZhN3R0eEt3?=
 =?utf-8?B?NlFVTGhheUV6MkRuLzQrQWlhK3JFU2xlU0xFdTh4NGM5enQzZVk5MWV6bWhB?=
 =?utf-8?B?TTBGdXJDVUhwd1hVV0ZlUURkNjcrcHhsZlV1NnRZelZvdFFLTCtBdXEzNmJt?=
 =?utf-8?B?VnYxd20yK2d5Njc1UzJjMnlHcFFGYkEyTXJRY2R4QVkvbW92cG01a2dXMmRY?=
 =?utf-8?B?UDdrMldqbm0vWTNVWTQ2dDk3L3RGWW5SYkdoZUxjVkFnM2NNdWVwVXIwS3Bo?=
 =?utf-8?B?NHl5T255WjBrMU5rQ0czb1Z1V0QwU2MyTW9vc0J6VXYwcU1YMDFBSHY3eFNu?=
 =?utf-8?B?bElFVUQvckh4UENJVXR4dVQxQVFaRm9iM3QwREppakpHY1Z1SnBpK2lnSlhW?=
 =?utf-8?B?WkpUVUozWHRtL25xd1YyZzhmUEpCWjhEaURsM0g5NGZWTXc1UW5wdDRUNXI5?=
 =?utf-8?B?b1N3VzliNnFjOHRBQThla1hDMzdGR0F4VVE0bURQaXFVSjA2M3pPZFc2MFQ4?=
 =?utf-8?B?a2RZaG1raDM2WUFkTGpHOXlWU2JtYXhuNGxjMjNjSTJsTEFVdjdJNUNYajRS?=
 =?utf-8?B?QTBOTnZDQlQrcVZqZzVLVy80NThqcFJ3c3VuQ3BFelEyZzFyZkx3cEJSRVRP?=
 =?utf-8?B?VnJ1NVpNY2FDSzRuQmlOM29XY3NUWWx3LzVsQnRrNzdJQVJ1RHBsNEpaUlJL?=
 =?utf-8?B?UkdnZFdaWjV2cXo5dmRZU1psZ3R4RmVVMmJGMjZwYnhmNTZ6L3dWdys1K3V3?=
 =?utf-8?Q?ilyE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnRqZlk2ekRzWnhPRDUzMFpVU1RxNEFiZ1NxU1RVN2VvN3RWTWljT3YvQm80?=
 =?utf-8?B?QnZac1pjd3UwUEdpMUcrbDNWMUlmcjRIRzVpa0pxMWtXNkE4WjU2OHZVdHlB?=
 =?utf-8?B?MlR0d3NwUHAvdk1sUmZFZFNidkN1N3c1cUcxdHhSSml2Y3ltRzZST2VSZUVv?=
 =?utf-8?B?ZTZ2Y2FqQWtCTGpYekpyV2xCSEJ6S1cyS1psK01MMUdrdXNRUkdJUHEva3kx?=
 =?utf-8?B?SzU3MWhVU1VibkJEOU1Qb29oT3NUdys4dDB3bmNnemNDQXdPUWtjeGYvdHhl?=
 =?utf-8?B?Q0JXVGozVXdxRzM1THhibXBSNm9DQk42SlQ5MXMxNEl1aVplVG12SDZHMGxo?=
 =?utf-8?B?QTYwdGg0bEJvcHgxcFMvU0h4RzZpeVdVVXQ2aE9uR2I2dndXMmsyZ0NldUQx?=
 =?utf-8?B?OU42OXNPUGhXREhnNXM5N0RLcnp3elgyMldDcElIbWtRUmtzbVUvUnBnSlVJ?=
 =?utf-8?B?TjR0M0F0eGZCSUVkUXlQRTA2bjVuVXF6YkllNGFyTWVLM3U5bnhMZUtLY3NI?=
 =?utf-8?B?ODFJVUFFeTNBWFU0bDVqbW5kaHJNL2QzamtFeXhZa2k5SEFKRm5saUJRRHZH?=
 =?utf-8?B?L3VrdE1DaU02R2FvRVNuS0JFeW9YYXoxRWErMklQWlcyRW9ETG0xalVXenRV?=
 =?utf-8?B?WGlKWDFGekZ3ankyQXpzdjRHbnVoU3ZmUmpabWdSQ1NMbklGQnR0d1RzUmFI?=
 =?utf-8?B?dExUY0VhSi9IWlR2d29odG1LWVpCYTlPSXlyZ3FyTXF4UHRINldvbGhpcHJH?=
 =?utf-8?B?RFZoVWN5L1ltMG9XYlp2M1pwQmpsNnJBT2RKQnBBK3ZFUVdzWk01VkxIRGtk?=
 =?utf-8?B?dzNrQ3F5cG9sRDJXRFhKTUpTY3lQSndCcm0yMWdhUUZMTmhCQzdKSlJOZnpa?=
 =?utf-8?B?TjBZTkRYVUZZUGJsekhuNjk2TG1GTk5Hd2F1TjNDR3gyQnYxNWZzb0ZUWUZ5?=
 =?utf-8?B?ekdCc1pTSmNrZm1YUkx4ZGRDMERoeXVIMWdoWnJnRmdXTDFWZU1CNkoxajJl?=
 =?utf-8?B?S01SSVNmb0tVYm5SSE40NGRjOHdXUjFYRDJPM3hZN2loNGdxQmFia3gzc1hn?=
 =?utf-8?B?am9taGpjM203Z0RHQmhWZ3BsQWR6TkMxa3FwbEE4VFdSeE1WSzg4N3BTcVhi?=
 =?utf-8?B?dERsRVY1WjZTMzRSYmIrUUdZa1dZeUZuT081bFE5eUpDS3dwdDI0a2RTTGRQ?=
 =?utf-8?B?SG9QMU50bFNpWTNCcDlZUnZNZFRZbGtUZUJYcHAyNjFCL0tJZGNiamZRUU1Q?=
 =?utf-8?B?cFBUeEdYTVV6Mi9JWW9iMFhHVW5WUTFLWjB0L2ZLVXp2ellseE56aHdFcDg2?=
 =?utf-8?B?c3lwbWloQjM2OUZvWDdRdlBwN2pVK3QwRTJLMmVXRytQMWk4akVzejZyUVRZ?=
 =?utf-8?B?ZVZMaWphVGVrSTY0NzNnQ0sxUytqcUU4RzlWRVpKcUFiRDdVOWljVllBRTFm?=
 =?utf-8?B?eHV3QUJBQ0FiaER6b3BVTWFJZWtoQXZ3Z0F2b3FQalJudXplRldhRnlWb2cy?=
 =?utf-8?B?bVczRmREY2d0Z3I4L3R2a3Q2Zys5cHhYY0Z3a2xZVlRIV3NvVGNFUyt2R0tR?=
 =?utf-8?B?YUVFeTVqcUl4VXN2c3pjNGZmQVRxRzBWMkhDdUNJUHRHL2ZhZWl6WXBIWi9Y?=
 =?utf-8?B?WGxsQ0llaHIzUGpENG02REkrRHhqUEROUWN6SFA2YVRLYUJJUEhxUTBnOUxP?=
 =?utf-8?B?aWhlMWNmR0d0d1psNXVsSGE2cGppbEFudUp3b2hQZnlFbDNNV1F1UmdkcTdx?=
 =?utf-8?B?U21sR2dqNVAvVU1KMkZkVXE5bDIxM211dXBxS0dkVm1FYnZsaHcycW1PSHdH?=
 =?utf-8?B?cWZKS3QzT25EOEhFRDRoL2oycTJsOUw2NVZYSm9VdWpwek9SSE5aVGV2SlBL?=
 =?utf-8?B?azVBN0lOcE5YMXN4UnlmYlcrTFAralNaK2E2KzRiRkJad2ErVDREbkNaN090?=
 =?utf-8?B?RnpiWloyMys4L0d6dW9LZzRuRWpuamJrazV3a1V3dzdZR0kzU1dzRmYzS0FY?=
 =?utf-8?B?ZGxiK280aCtHQXBaMzE5U1JFVEpCWG93c2FSdnF6UC9aMytRaFdNeFd6ejJW?=
 =?utf-8?B?cHluaExJcW9YWFplc2tvdXNPWE9hTGhvQnMweHNpeTRJYnpCbUMrb2xwaVRq?=
 =?utf-8?B?RWFpcXo3RjN5MUNHeUlwZG1TeDExbGg5V3dBSGRDd3FMaURrMmhZUk51cTh2?=
 =?utf-8?B?V3VHbFB2Q1dBenNLRFB6b0tLdXphQkV1Qk9FQVNvZDhxekIvb2U5YmV5SzRI?=
 =?utf-8?B?WUY5ZkU4Zll3YUg4Y0UvVkY5T05IQ2lCc0NKWTdkUXB6c1NuMnYwNkFSWmdx?=
 =?utf-8?B?TDZkaXBFcDY4WCsrSTlYUldLSy9EQTE2Si92LzlxUFVwTWtUR3p0TzhmZy96?=
 =?utf-8?Q?/wL75N6MxBPgY/l8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b233613a-6795-4f1d-d6f6-08de6d7d7202
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 17:04:28.8223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M/BkIIdTo1xUftHC5uFRFvCcuIVpBkxlbMwm+ebPP8K+EsEqIGi/SFhwxm3UkVyAA0hcSJBRTQ+dhUfoupJ+J9LmSjzXpU+4vCbl+cdLIjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4568
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2026-lut-15 21:33:23 +0100]:
> Add initial documentation for recently added VRAM provisioning
> Xe driver specific SR-IOV sysfs files under device/sriov_admin.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-sriov   | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov b/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
> index 7f5ef9eada53..14b61bd2d602 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
> @@ -129,6 +129,37 @@ Description:
>  			-EIO if FW refuses to change the provisioning.
>  
>  
> +What:		/sys/bus/pci/drivers/xe/.../sriov_admin/.bulk_profile/vram_quota
> +What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<n>/profile/vram_quota
> +Date:		February 2026
> +KernelVersion:	7.0
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		These files allow to perform initial VFs VRAM provisioning prior to VFs
> +		enabling or to change VFs VRAM provisioning once the VFs are enabled.
> +		Any non-zero initial VRAM provisioning will block VFs auto-provisioning.
> +		Without initial VRAM provisioning those files will show result of the
> +		VRAM auto-provisioning performed by the PF once the VFs are enabled.
> +		Once the VFs are disabled, all VRAM provisioning will be released.
> +		These files are visible only on discrete Intel Xe platforms with VRAM
> +		and are writeable only if dynamic VFs VRAM provisioning is supported.
> +
> +		.bulk_profile/vram_quota: (WO) unsigned integer
> +			The amount of the provisioned VRAM in [bytes] for each VF.
> +			Actual final value might be aligned per HW/FW requirements.
> +
> +		profile/vram_quota: (RW) unsigned integer
> +			The amount of the provisioned VRAM in [bytes] for this VF.
> +			Actual quantum value might be aligned per HW/FW requirements.

Copy-paste from exec_quantum_ms ? :)
> +
> +			Default is 0 (unprovisioned).
> +
> +		Writes to these attributes may fail with errors like:
> +			-EINVAL if provided input is malformed or not recognized,
> +			-EPERM if change is not applicable on given HW/FW,
> +			-EIO if FW refuses to change the provisioning.
> +
> +
>  What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<n>/stop
>  Date:		October 2025
>  KernelVersion:	6.19


With fix:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.47.1
> 

-- 
