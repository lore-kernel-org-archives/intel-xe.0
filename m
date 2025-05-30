Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75616C5AD49
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 14:23:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197A110E854;
	Fri, 30 May 2025 14:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hsZivfAv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4249F10E86C
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 14:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748615025; x=1780151025;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/BYjqeG8Oy8C/6IVJWqDJdFBbZaupDmd7/BKix4XiIc=;
 b=hsZivfAvEGm1mIRYghwCTnpso5Xl/D+Y/Orl5Oo0XPB5gEnQvxPL7Z8o
 OsYsF86bia3EoR2VepkAMYczBL3JGKlGPep9Y11fZJ/GsnlAJvQn0POrI
 JQlgVjez0xd0pzVke5RNvTaEtk2ymxhqj2U78cwNaeMi/GlLzRaf8iD7v
 z3pz/nx2Kv6KekbbH69HK8oSIuBwj4N46WHnApd1Hnyf7VBnuIEi5TlGG
 9a6lSFkNiPDrPz7SZRECTNhA7w/X6lZ1K5DvKIDTxQAQL7i6l/kuH4w9l
 eQTJ3/GVGMY2U71wgWCwWK16SflRFpWJ2vPlLFZZEYuWLkZwh4ugF1epZ w==;
X-CSE-ConnectionGUID: cDVXKXokTNi8RqgxlKfwRQ==
X-CSE-MsgGUID: 0gp124PHRuSOZoqgvzYIJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="73242178"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="73242178"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 07:23:32 -0700
X-CSE-ConnectionGUID: ZHAtn6+oS76OgBCIdVRlow==
X-CSE-MsgGUID: Rajk2/wBRsuNsOFPN664MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="149156611"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 07:23:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 30 May 2025 07:23:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 30 May 2025 07:23:31 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.63)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 30 May 2025 07:23:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0Q/iHofyOnqfDPyBPeKf1Pg8nd7ieZo6b35ulc+S2DW7I1wD3dfVPC7OXx7NC5VgM+dxEo6ShEOCTWBwcJ3gBE1ZbAjC9OnHH+bl4oUanvb/OK4dFVA7cLwIr6sefm1+t5DvpxqYbnlLUGxC6fm59crCwQWJKp5xqbXJDMfldycOwZ+LrdjZK/Qwx8rb8OUbZMiotmuNOXHubpDx0kGrQ1ZwT70jt5cXDh0TF3SmMmzZ7JHVSX07aHRKZEZlcliLRrM5bt9kNX09vg/WghfLf/jDcyTimdWLLfOnTvBsrL5qHutiovfy7VgAECpLGM7FYFx6FH+yairwVRqG41Nag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KsbcVBQNpJu/b/LTpUZZsYHh9fOKqCc6RyrDYPzoYPg=;
 b=JPAgQRiYflK7HnEF7+QZ4MPPJeTwv0oqAkT1u9PBYklXMa/hN6k328iOPKM8K52o1FNL4REKUvbvVSjZ/qUJFpOS/b6hAtkyAAt7EOut4hwcS1Of7wFzvLG4CnOo+yR1vw686JKmldYnT3G8P0lXxdlx8g9Ut7318e5CXYNbGPmSctC2t5BWc04ox3qr8Is9N169xotdZB8qGtTpuG06+tCQEtEfmmx8XaEQSn6XG72VhmtcsC7PP84pYxac1RjAxdZF1j+1Nxuc2GnU4vDGmgMg7wctVU0nDxNKybzRFQRBkTx48Ny45W8FqZ5Gry7ebu9jFLXrvJwZB6X/uw0FvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16)
 by CO1PR11MB5011.namprd11.prod.outlook.com (2603:10b6:303:6d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 30 May
 2025 14:23:00 +0000
Received: from MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6]) by MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6%4]) with mapi id 15.20.8769.022; Fri, 30 May 2025
 14:23:00 +0000
Message-ID: <1b0ec584-8eaa-468a-8d97-e2a11add3e57@intel.com>
Date: Fri, 30 May 2025 16:22:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: remove unmatched xe_vm_unlock() from
 __xe_exec_queue_init()
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
References: <20250530084856.2612849-1-maciej.patelczyk@intel.com>
 <CH0PR11MB5444F39447DA84B2B22D4DD9E561A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <CH0PR11MB5444F39447DA84B2B22D4DD9E561A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB8PR09CA0004.eurprd09.prod.outlook.com
 (2603:10a6:10:a0::17) To MW4PR11MB6864.namprd11.prod.outlook.com
 (2603:10b6:303:21b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6864:EE_|CO1PR11MB5011:EE_
X-MS-Office365-Filtering-Correlation-Id: 78066e86-6cd4-4b3c-f2ff-08dd9f857b4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEp1Y2ZOc1JtUVR0S0dZblRVd1pEam5OeEFrKy93dnh2bFl4UG85R3pBUG9j?=
 =?utf-8?B?ZTByOGw5R3pNdmpCek0rb2dWNm4xNHpyNXJZZ054ZGJtMDlRZUZ5M3Vnamt4?=
 =?utf-8?B?Y3d1dHpSZWRSU3FiZHIyMFV3aDBEUEdjMGh6K2h6OGR2d1VpSTd0OU9OMUtU?=
 =?utf-8?B?c09CQ29kaXNHRHU4Tm9sT3hNVHByUzRPUnBVRTM0bjgreExya2RtRkpVUm1y?=
 =?utf-8?B?SU9WY2JwZlgxU1ZBdWQ0TFhSMEZPcE0yMm53Zm55b0RwcU5ya05OV2dvUERP?=
 =?utf-8?B?SFRQcWNlWnRwNkY5ejBXTGRzcklid0cyTTJqTXNDMDQwanBNY29PNG5ydi9Y?=
 =?utf-8?B?K3hneGZGeDd2TmQ2dTF6bnJwbnZmbmNJQ0V1S3FnWXFKcVFQSElzWlFJeTJZ?=
 =?utf-8?B?YXdsSTB5VkdpQTZwbklXcXhCQXI2bVhVS1ZZV0hYZDM3NDlybEVsSCtwTktw?=
 =?utf-8?B?WFM4WHVFNmRweW9ZOCtJd21GSGhnck15VG41WXdwY2tIVGdzdDBMdHBZeHRD?=
 =?utf-8?B?cWlZSWhxQ1gvOERyalp4N3dNOTF3NlRZQ2lLcFRndmVUbncraWZ2MkFvcjRn?=
 =?utf-8?B?akU1ci9GeUdiV3ArUHJOMmMyNmtFQkV3VTRlNnRPYzFiVmVhck1JdHVzcVcz?=
 =?utf-8?B?Y09SL2tBTC9xdkNSUjhxUFY0Tlc1a2RzTlFPQjA5NzZ3aFJvNGhXYXhVQ1ox?=
 =?utf-8?B?TU1MVklPM2hOamhsOENrSzZLSHVTR3MrZjFUaU1zN0dqTXQ4OVBkbHRMUy80?=
 =?utf-8?B?eVREZ2cwWDA1cW5EcnNKVG40QXNud0Jna2F1Q3pOaXZMUFdtR09vcjZuekt6?=
 =?utf-8?B?RE15RkdEODJhNHVTcndRc1l2dmJVR2lFNHJIbWt4NlRURkNEdVNZQVYyN1g3?=
 =?utf-8?B?bnptZ01iWkVEZlBycEtVMzhhWjdZUnNmQ2d2bjdxcmNsNWl2NjZxRHZvT25i?=
 =?utf-8?B?UlhRTmFucGJRcFdYSVNVR1ZCS0taTVZUSEkvU0ZlSy8yclVIcXJBdS9yNCth?=
 =?utf-8?B?eEZMeW14RWVJRllyWG5zbHIvMk81VW9TdzYwRTgyWWg2MGlwK0hVaGdLblZZ?=
 =?utf-8?B?OVVHNmVwN0ZOYUhLRXV0bUNpV094TC8rYlV0Y2pad2hCcFNLRmRJQWhOVFhT?=
 =?utf-8?B?cFpUOWZjYkp5SjhaczRlZEdOUDR6bkNYbVQ0Z0ZaSWZKQU5wSm9wZVBHZFh6?=
 =?utf-8?B?OTNRaGdhbHVZTnJzOGtyRDNROW5iZDhpd3hLKzRCOWxQcy91YndycDNKdVRY?=
 =?utf-8?B?TUI3QXlPR2h6R3N5VEEzK0hzcEtkWmJwakhVM214NU91WE5pY3hBajhKc2h5?=
 =?utf-8?B?TFY1T2VmR2lQNWMreEZwTVdIaVNEMGY5YnR2aDU5SGh0RVl4aHpEbWd3RGdy?=
 =?utf-8?B?TTZ1Y0JLallmV21HUDFGMEE2SGJaS25FMUJ5cFhPbXN6WFh6cUJVdWpjdEI2?=
 =?utf-8?B?eW96bHFnRTdkY1czVVc1cU16cnQwbzljTXZuT0c1N0Q5SFNVL0EzN0RRZFNT?=
 =?utf-8?B?dHpJU0duNFRJeVN6N1hXSzJuQnZBcmdrOXhOaURKUUlOL0thUWpwckxmbmFk?=
 =?utf-8?B?WHlNdHFsNG9wSHNidWJISjZuRjNCNXF5N0FyR2lSU3BsSDFsRUEyUndFNkFH?=
 =?utf-8?B?WllJTHYwbUJmK2w1T1B4VHhjY1NvNVhMeU1OYjJnVG9XRG9FOGhIVHduelZ3?=
 =?utf-8?B?cVpRdi9KNHU5TmdrSDQ5eGNqd1Iwa0dpaG5Ua1NnYytKUlNRUjhHbTgxbFNm?=
 =?utf-8?B?L0FEL0FxSml4K1E0MzFwTUZwQ2hMOCtuZnZjMzI1Wll6ZFNHT245U1E0ZHF4?=
 =?utf-8?B?TTgvdzRnN0E3bkZMRTRmYXhZUHRIYThNY2Z2ZTF4aDNkeXBRa1lUNEhRM2Vw?=
 =?utf-8?B?L1lzaUlPT1BLdDlnOWhLZk5XTDA2VGFxb3JjSUVIblhRVjluL3RMYlRRMVJh?=
 =?utf-8?Q?nL6G61ctPjQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUQ2eGdTT2Rrd3F5aEdXSm1JWEN0ZE1TY3RUNUVDU0pidm5ZaTFHbU85RTZk?=
 =?utf-8?B?b3VaUzlUc2pZUWp5TVA1Yit4dlRpaEgvUEhqSkkzRXJrSG4wWk1HaHFNRnEv?=
 =?utf-8?B?Nkhqem5ia3JwWkxlMEpiWW5BRGo0VmtnV1JQN2w4QjF5OHI4ejRkSHNIRy9a?=
 =?utf-8?B?bUNETTF0WXNrVXc4VDQ4NFVJTWwvdUhVQXpxc2V3TzJwODAvYlo2M1d1MW5j?=
 =?utf-8?B?anREZGZkMUtrRmh6N1AveCtlcU56U2pjeWZ2a09TZ0tDLzVtMVlRTkxqYjU5?=
 =?utf-8?B?ckVjdFZ4RFRrRWQ1M0pLQ293UERLVVRwYnQwTlE2ZHlYTVZDY3RndEQwUHdK?=
 =?utf-8?B?aWRyNk1KbU05dXhJaWo0WUx1SlhEK3ZFQ1hUUDJRcDJBdkpGZ2Vjb0Fxall4?=
 =?utf-8?B?aFNPY0VlOFZpRk5ySTFRMzRBa1o3RGdFRStkdnlHSUs2eE9oS1dMa3h1dWM2?=
 =?utf-8?B?WVd6aC9iMXR4WkgyUUh1S2FvNElLemhQajZkUUY1MFRmTFJPaFJQOG51Y0Qw?=
 =?utf-8?B?MHQzclpYMkh0NG5iYlVQVEJZQk1nRVJWbVc1by9NV0ZYVndRSnppa0VTQkxG?=
 =?utf-8?B?U05RaWlGNHBHUHdic2prZENKUzJQOWRiVFdLdVpvWnYxNVp5dVlOUnlvN3pT?=
 =?utf-8?B?TjZzaXJYNnl2SFh2ZC94ZW1udlcyU1kyZ1lrWEt3MUF0RGNjcm40R2s2ZGN0?=
 =?utf-8?B?Sy9rOFZQcFJYT1NRNkxtaHFBTTVvTTcyVWtJaVpOUjBML3cyalNGckg0eExK?=
 =?utf-8?B?T3BrZVdhMkZtVWZhY05RUktxY0l0M2xwZ0dJM1JrWWFJUXd5d1JhbEFRcm92?=
 =?utf-8?B?ZHlHbDJmcjdRUGxVQVlQMi9qWkUzTGwxTUJzbmJqR0J1eGxXSjJHbnM2amxQ?=
 =?utf-8?B?K1JqNHhmSFFHc3hHSE5hU1RTeVM0dGRKNHcwbExsZ0dFWktFcFpGVTNuVm5w?=
 =?utf-8?B?LzhpcDdHdld2eHZXTjJOWWl6OFVQcjJCUElnNVNZalgweU5jVG9WeUNReWVP?=
 =?utf-8?B?UFNoaDJFZkl1aC8wTDdOZ1pXRHB4NytGL25yYmNneGUxWGI2WDM4MHE4K2tB?=
 =?utf-8?B?aWMxcEVLWGJZazEzd3ljUFptZDhSU25KWjUxdGRiYjlNVUlOVlUvbktMbyta?=
 =?utf-8?B?RWw2S1lhZmt5bkt0cjY2Yml0V0FkVlNkeERKbEFNMFhKYzJmZ0NxRzk5VTdZ?=
 =?utf-8?B?bHBHK1VTTnRJeGxUalBxSGFNRElDdFNOaXBESlhwaEE5eHBSckc2RDdMdFhB?=
 =?utf-8?B?anhRSWFtS0FyTDNHR1pmS2VZOHRNaVFCN2Y3bnhJbE04ZGVrY2lzUVFDWWFi?=
 =?utf-8?B?SUZSd3B2dTVucU9HcmptUHdlb240ejZqVHhtODc0c3VpakYwWWsyMmszUzUr?=
 =?utf-8?B?SE9WNCtTQXBXVUN2MStocnVDS0UraE15blRpZFU2MDd3QU1ZQVNWMFk0UXBo?=
 =?utf-8?B?MFpFZXdhQ0krS3BRbjJNNzM4b1g5bzY5aGIxWnRuRFVWV0NiUGxEVzdyMDF4?=
 =?utf-8?B?VGhjUFNpdFo2aEpDWWdmaWNhMmtLMnpWVEIvRElIcU1lVTNzT2UxWDNXZlIv?=
 =?utf-8?B?ZUpDdHFyb3RiWmY0dGJ1Y3lWWW1jdzJjcktCbEZKcDREUjl5ZkdFYlBJL0Nj?=
 =?utf-8?B?VEEzTWF6WU9xTzJnMlRnMzE4SlZXbXViV1E5empRMXNwcURqVUM5dTFuN0tJ?=
 =?utf-8?B?QUpJSFg0VDNCeWVwR1poMXFTaFhlc05YcmNGeXZTVEF3VUVxcE9FdzFJcTZn?=
 =?utf-8?B?NzJqa1lUY29BRzV3SEEzQTNsUEhqWENySmgzTUtjbHFFRnlObGduMGtFN1BM?=
 =?utf-8?B?a25TNzZUYjFZdWtXbjV5NXRFVWpaZS9ka0ZuSVZGTHpmdWJEVjRDOTJmLzR2?=
 =?utf-8?B?U21ualExV3plcEFseVlzMmpVMlNEUkQ0b0JDN3BtN1M5ZTlrRHh4bjRKNHg1?=
 =?utf-8?B?K0tMN0c4Z0VkcjFITU0vQlJ2dUxjZEpQVEdzQjBIMCtzU2p5L1cxa3pDaUc4?=
 =?utf-8?B?eVhQWGlqa2JCQXdWOVFGakZFbUh5YlRzcjNxZEoyMkR0U1FiQUFnMElSTFI2?=
 =?utf-8?B?VUErZlhtVkpUK3pJZUl1ekprVUxYcGtiRGFyNU0yQjZuUUZGN25HcTdnYWgv?=
 =?utf-8?B?SHhoUnhyaHUya0hsTFBsNzg4eFIwVWpScTlJMTZKRG4vWE9zbUp0NTY1Zy9r?=
 =?utf-8?B?SHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78066e86-6cd4-4b3c-f2ff-08dd9f857b4f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 14:23:00.6099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: btvwCRjPsh0A2A0v8Wu0P4tU272fy/atY8EP8dTCZAFwFU/qyn0ujPXFDoNHWo9htJrTEWDPwrNrVB7WYo1oPC6J4xJ9Xtwq/aIujtchY7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5011
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


On 30.05.2025 16:07, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Maciej Patelczyk
> Sent: Friday, May 30, 2025 1:49 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; Brost, Matthew <matthew.brost@intel.com>; maarten.lankhorst@linux.intel.com; Patelczyk, Maciej <maciej.patelczyk@intel.com>
> Subject: [PATCH] drm/xe: remove unmatched xe_vm_unlock() from __xe_exec_queue_init()
>> There is unmatched xe_vm_unlock() in the __xe_exec_queue_init().
>> Leftover from fbeaad071a98 ("drm/xe: Create LRC BO without VM")
> Good catch!
> There's a checkpatch warning asking for this commit message to be
> updated to something like:
> """
> There is an unmatched xe_vm_unlock() in the __xe_exec_queue_init()
> function, leftover from
> commit fbeaad071a98 ("drm/xe: Create LRC BO without VM").
> Remove it.
> """
> But besides the checkpatch issue:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt

Thanks!

Maciej

>> Fixes: fbeaad071a98 ("drm/xe: Create LRC BO without VM")
>> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_exec_queue.c | 6 +-----
>>   1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 32c6923df7c3..fee22358cc09 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -114,7 +114,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>>   
>>   static int __xe_exec_queue_init(struct xe_exec_queue *q)
>>   {
>> -	struct xe_vm *vm = q->vm;
>>   	int i, err;
>>   	u32 flags = 0;
>>   
>> @@ -136,7 +135,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>>   		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
>>   		if (IS_ERR(q->lrc[i])) {
>>   			err = PTR_ERR(q->lrc[i]);
>> -			goto err_unlock;
>> +			goto err_lrc;
>>   		}
>>   	}
>>   
>> @@ -146,9 +145,6 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>>   
>>   	return 0;
>>   
>> -err_unlock:
>> -	if (vm)
>> -		xe_vm_unlock(vm);
>>   err_lrc:
>>   	for (i = i - 1; i >= 0; --i)
>>   		xe_lrc_put(q->lrc[i]);
>> -- 
>> 2.35.0
>>
>>
