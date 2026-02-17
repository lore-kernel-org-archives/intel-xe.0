Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9135CE68165
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 11:19:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0EB10E0FA;
	Tue, 17 Feb 2026 11:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a5eiwE+w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A1B10E0FA
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Feb 2026 11:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771327176; x=1802863176;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9qM97chN440bJgmPPd+xacQ/g65q5I4oEQWpSBR5bO4=;
 b=a5eiwE+wzkkMSYqQFDrhNXaq23d1NCzINe0lUas0GRKNfbaNoQS+oWFc
 UfSq9bxmy/kY6VgiDCASD9hlzprE1l89xKvM/nqD+ehV26VfX3EPYW2Fh
 8Jtyg12U80FfxyNW8l1rZT+u6jXTT1XAQ8BTS53Qw+67PxyjjKLVHwWPt
 bRW+0qRD8NzU0V0dmEr6hgLyEfjA/4ML1TxMsiDpXbRCqZKZZeZQHbgaL
 PDMyvlXyMuGBg0M64KCEhDFh4HmRmqQtJQi7YJQ5MBRl60j2LkrYFxczg
 Ur0j5bACEpW8brqUS5As+7lRIAPU+Q85uzqR3tjiv6YGeaeM1DupuGaKm w==;
X-CSE-ConnectionGUID: 4tURTe6qTheI3dVaXScTeQ==
X-CSE-MsgGUID: aLO+HtgcT1eeP7JxlTXWfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72300429"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="72300429"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 03:19:36 -0800
X-CSE-ConnectionGUID: 0vRfOgNGQRmJOee+cSuGaw==
X-CSE-MsgGUID: KkY98OLDRwudPhdi2fHfKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="212941215"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 03:19:36 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 03:19:35 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 03:19:35 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.40)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 03:19:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pq/wko21bCrdqRjtc2XTYmMq/wbQKM8qDSjdiz/7onFaP/ZrLMkm6i1VZ6+N35lSNky9fJnxf9hRtO2y0B4xF/M8xJ/dTPNkrm/QoVb10IyU8HoT0QKgBT1NTuc/kccbRFG7eAD9sdXLbyY0FBNkYnKunxV1RVRvoai0TTmSTEeoHBw4/qWHc/C5iH66zNLEmjxmlmXGCTbZQ5gcN4+ceWgswwqivLtMU4Fy0RiFzBomr5NGDFr8DeiOk6A3Mb6zJwrzFXdop0/xPJ7Pm8pGgtf+1jMxGNawfEqFTaK/e9KE2TiN1yGaPaRdoTpo6rnFnBKB/o8/uZskI3StliS27g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0PqyMRe3+Ewx+9CqaBfIyuTKbdEpvjQpUTucmEoh1U=;
 b=adfrTa9QJIglIy3X6czQz+WEMg7ahPKAUog74jkntH+7ZIU/eK4mk8dYcilifgL7tWqYLzrUngr6qxxo7UG1VPG5k48ZkP7RiVf5wCsTy3VHu8edyWKWIdMfuzTEbsyqd50S/ryB1JrOE/l4DpVU/Hi8UHmRxhVV/IXskbpTrooRVvdw5fzIc7FxGypgduKp7v+AdW4zXAwXf+EoxWS2Rj762KkVbwDCmD1XNo9ibw8vU2EncmUS8GG+h4Q3PZGo16dA+sko6vZ0qJZOCKxB4w77rgRc5BbAiYpZLov/iVhNJ4n0z614/rp/Ny5hh/bWRLZzOIW//H1SBVpFOYhPbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB6720.namprd11.prod.outlook.com (2603:10b6:a03:479::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 11:19:30 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 11:19:30 +0000
Date: Tue, 17 Feb 2026 12:19:22 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <daniele.ceraolospurio@intel.com>,
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Remove H2G reads in CT send path in
 non-debug builds
Message-ID: <aZROunEO_59GOECh@fdugast-desk>
References: <20260213211625.3117729-1-matthew.brost@intel.com>
 <20260213211625.3117729-3-matthew.brost@intel.com>
 <aZMS7Qg5AvFRE_Zb@fdugast-desk>
 <aZNWg8PTJ7vYl6oK@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZNWg8PTJ7vYl6oK@lstrano-desk.jf.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZP191CA0040.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::18) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB6720:EE_
X-MS-Office365-Filtering-Correlation-Id: a244ec5c-5baa-4122-6e45-08de6e166b30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVJuODh6QVB1RGVnODZCeWxiOHYyR2Vwd3c5V0xvUHlCR01TaTZWVjEwNS96?=
 =?utf-8?B?Qlo2T3h6dWVMWWluQ1VGQTljVWxpL2tnclZjeWdNMXY0bmRvTkVvUFh6YkVF?=
 =?utf-8?B?RUdQbDJJWkcwZ1p2aEJ4bVFMMWpXU0Qwc3B5YzV5dWc5emROUmdJVDFDMW93?=
 =?utf-8?B?ME1naDRqb3N2YTV2SDRUSzM3WG8xUUh1aFVJVGNZN2VWZXQwZjE2WWFvbVNt?=
 =?utf-8?B?REJZSFZzaVl6SGQ0aTJuZU45ZS9VRWtRYXhoL0hTcFZBcU1Dcjl0K0k3a2Rh?=
 =?utf-8?B?TUVkVTZ3NmdmWGV4eGRCaGQyWnNpc3RrRHdrU0pVZDVLY1kxVXozVHY2Kzdk?=
 =?utf-8?B?SGY4bHcvRzNwVDZuUTdaTDA2QUc3RnZOZGtFZENCd3hMcThMNGFwUTN0TEhm?=
 =?utf-8?B?ZFpPcVF5ci9oK09hWnhOOXZhWXNZZFpUWS9VVFV4QUp3SThFQmoxUEF5UzBT?=
 =?utf-8?B?K2pMY1o3Q2tLdzk1UEJqbXJlalFmYjZRcklTWGpaUVBYeWhRTUp4RERlZkxM?=
 =?utf-8?B?VDhxanQxTXoranJJN1FnY0ttUWxjOFBsQ3JMRzBVQXhtMmFSaGFXZlNpQ0ox?=
 =?utf-8?B?andYZGN4a1ZOZUl3dkk2azZGNWRKL2dWa2hjaWtTSGFOUFVDcG1QRnY2c1h1?=
 =?utf-8?B?U1VTL3pEMmFDaFRNWTZBaUM3eHF0OVY1dXF6VGRyeUV0QVMwRXVvQk0rdDBS?=
 =?utf-8?B?RERJQUx6RldzdzhxTlRHbFoyM0tIeHU5OHUrY09VWldDV2gvZEJ3UDdTK3VD?=
 =?utf-8?B?eXZjY3o5M0tqc2JVd2xuQVJoNTgyS25FQ3V6TnltNkNaQnFiZjRBYTU1WFJS?=
 =?utf-8?B?WnkrZ1dKenpsOTVVcEtSQTVFZi9jMGFlS3d6b2NXdzN5UjlZazdSc2ptZzZq?=
 =?utf-8?B?cHhEanR6MDNCR1FmQkpySmptdG9sbzcrZTF3dlFheDZxbGI0VFVPTHcyQVRr?=
 =?utf-8?B?TG00ZGU1NnNkZHlaRmpKK3J6aEdlRkpIYm9zY2hxbU5NQmdOY1NjdGJsWXhV?=
 =?utf-8?B?aExMWE1Xdi9nK0F1cjg3RWkyamNtRDlxZDJyd0MyS3FxaVM4MDNPbXdDVzVr?=
 =?utf-8?B?Z0xjMFFRNFJrczQ4Vlh0RnFlUkpnUjRveHhZaExCZmZYKzJ5RGdlUUZzQ0Q0?=
 =?utf-8?B?TEZQdWVIK3dQTURIRC96Mk1FNmMvR2ZlMnRuMzRRRk9QTTVEQllNNHVLZnRs?=
 =?utf-8?B?NHVDNUhxeUxTb2IrSEkyWWRydjE3TGt3WUhjbWl1ZTV3WXE2MTh3SCt3Ym1v?=
 =?utf-8?B?S1JEWTAyWmE0OGlNQU03UUxyOC9PT1E2WUkweGU5SVVtNEdTRlBXOStYSFdV?=
 =?utf-8?B?ZTd3Z0tWdVRVOHA3TC9mNEsxbWFMcmlyb2poSDQ3QTNVVUtXMTE4VVVIK0VX?=
 =?utf-8?B?L2FJcjlDdWpOQmlGYktFajkwWUZ5Z2xQc3BBdXh1WlhsY3NmQVllMnNKYS9Y?=
 =?utf-8?B?OGpJWW9RSUl5S2JNdnkzbXQ1Ti9ZRmNFNmcra2ZxMURJVkhaNFliNXNxak05?=
 =?utf-8?B?Q2RHM2xreDRMR29mZnZLMi9udTU0TGY0MTR1eXBQWVlZc1c3UlRWek9DMEFN?=
 =?utf-8?B?am83TzVkdTJXakpnckk3WWhRazRyRWdtd3ZLSDMwemRJMTFzWlV4SkEreUMv?=
 =?utf-8?B?K2FOUjljM3RVYzNtOXcxUFhoRWtoUFYxTWxXdEdjbS9IM2JqaGFnNmFscmtU?=
 =?utf-8?B?YXAvV3Jjc0x5bXhkQXJab1pqdEYrR0YxYmQ4TWtFL2E5a0lvT2xVSUNiaFRt?=
 =?utf-8?B?ODZLQUpBK2crTFJoTzhxYnV5R2VMVlVQYTVRUklXYjdTMVExb0Y4czlqZWhm?=
 =?utf-8?B?U081MDhUTkxvUmw2Q3lIZ1dWSXBaeXBlcnlleXMvWk5FK09ibjg4cUZIcmk0?=
 =?utf-8?B?TWlVUTdBeXVMQ29IejVoY3g4bjNra0dScGNvQ1FWMnVKREhVaUJTSzBoVTQ3?=
 =?utf-8?B?K2V4ZVpiV29Sc1FVQ1BoOHBGaEVmTUZOR2RrektyS2NMN3lscEk5cHlVbXo0?=
 =?utf-8?B?TFFoOEtHUTk3bHpKQ0ZoZGR2a25ROWZsemVnZ0ZKam9pd1dvYjgrZnQxQzd5?=
 =?utf-8?B?SzN1RlpHajR3dE1CRElxK0xLazNiUkRoKy9LK1FvU3B3RHl1NFVlWTVidkFG?=
 =?utf-8?Q?XbBA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzdkYjZreG1lbm5NaDBHV3pjR0c3OFozMmVnQ0ZqVldiYjcrK2hYcWtHSWc3?=
 =?utf-8?B?L0ZORlVzbzJtSVBwVTliclNmL3RwT0Y1WDc2WTdqRG5GdU1mbnloOUNCZVov?=
 =?utf-8?B?UmdVV1NqcUpZT0VndGt0RS9MSDh3T2MxODBVb3RtWDRHalEvL2VUZUxyeENE?=
 =?utf-8?B?Mi92ZUh0N3Q5ZEhmbWlNN3Q3VjJwZGM5blJlaWZXdnhsUkt6bFlZZFFKQ0ds?=
 =?utf-8?B?aTM1eU5uaUtleVFGL0N1NjFydHFYS0dVbTRtVkZqQmpBTDdIYkU3dEtsdkht?=
 =?utf-8?B?YWJab3c4ZFBIdTQyQ3JrUjdPS0h0RHhuOUIyNVpEYWoxSTBHVmRDZWpYWmU4?=
 =?utf-8?B?M0xURnFWbHhlUkZuaDYyUXJPWVNhbFNLZ2ppeFQ0R1JaRlFuMExXaFpSbmgy?=
 =?utf-8?B?WFFUUGlvdjN1VUtUKy9rLzhPYlVTUkplZGtkR3VKVXBBYzNuQk9CY0p6RGtL?=
 =?utf-8?B?eXgwOWVabUJrZmdQNGpUM1RzbldHaWltTW1Xd1kwVXBKTEhHbG9ydnMzL0xJ?=
 =?utf-8?B?YVdXaE9nY3BTN0h1Z3l6V2djUGxZcTNLWlZMeVhZbGU4dlcwTGNlbVVEYTkx?=
 =?utf-8?B?QTU5d3pJODFjdnBIenFoYjFvNjlIaDQrY2dSQ0RHdGZoQW4yYnRZVUNjUTdR?=
 =?utf-8?B?QkpDQWpDQnY1M0szTnlTNjQ2R2syb0k5RDBwSUJwNy9jM1l4TnVFNTR5ZDJN?=
 =?utf-8?B?OTQzQWJ0Wkx4SnBiWlh6ZU9icVBhWUhHeGdLZ051TUVqNXpFMmgyTVRnVTdF?=
 =?utf-8?B?TmpiZXk0Y2pIZiswZ2pzTzNsd1lnc1ZQeWM0MVM5T0FBNGtNcW13R1NxUDd2?=
 =?utf-8?B?ejlTMFZ5aWtRa2pnR1E5TnB0WUVrV0JTbkZJdmM5bUE4ODAvdFNObHU3OE1P?=
 =?utf-8?B?bGw4SGxZTkxEUVFyMjdnZk00RVhMLzhvNk55QVlvaTNHZmxhYXpRc2ZLNDQ2?=
 =?utf-8?B?Mkk1eXVCaldBbXZ2dVYxSkN2MWNBaC9GL3E5UkFoQlhFWm5Dd1A0RzhpQWlL?=
 =?utf-8?B?UVNPTmQwZWJ2ODJTQzB0L0FwcWJlVXE3a0dUaWx3MnZuN3Awb1prb09SZEdy?=
 =?utf-8?B?MXo5QytpY1l1MElDVUljbCtSVnBtVEZETkIrNEp2eXFVSk05WGVESUI3MnFX?=
 =?utf-8?B?TEZNTDFhMWFiUHpKemJlU2J2clM1VDFtNXA3NzJhUjFiZ2wrY2MzYVVxZTNm?=
 =?utf-8?B?MHdTbVc1S3RLYzBQVVZyNjc4MnlmREZOSGpYL09ValU2RHpxUzNXTXVURXVv?=
 =?utf-8?B?bjBmZkVQbkk4VENWZGhYVDF5SG9iVE43RDZaMzB6QWd4NGJ3emNZS0FJWFd6?=
 =?utf-8?B?NHFIQ3JEMDEveTc0VE15YlBGYXJFY01LYit3VVFzY0k1Z1o0OE8xRnZqSEVa?=
 =?utf-8?B?VXhDcVMzSVpwT0dXYThTZVU4WmdXOUJxMnZSYll6c0xmNWNOZmZ0R3JYL1Na?=
 =?utf-8?B?Vk9kMytwRXh3N2ZFeWxxeHFyYlBuaStPWXVSeE9qeTdLbkRSRjh4dVgyRjJj?=
 =?utf-8?B?em9KMmlsd3p5bndMdE1FRU40VGo5eEpPSGFpQ0RZcEVLRlZURTdTUjhRU3Bi?=
 =?utf-8?B?czdnTWJlUU44dnh0Q09ZcndwdVl2ZnEyZHBydDEwZE5sd1htRC9ZVzkyc0N6?=
 =?utf-8?B?SFdmeXl0SE01Ni9kMUJvZG9MR3lwTXNoVVpvNWpyZDV3Q0t4WnU2WXY0NXZs?=
 =?utf-8?B?OFZEcDl2SytjUUlmUjBYMk4zTElSS0w0aG9xckdDMWFuMTN2SzFOVE9LOGtO?=
 =?utf-8?B?WExYRlNEZkpnR2FwejlaR1l0TjYzdys3NVpsNXcrd3I3UDUvaDVBQ0xUZnJa?=
 =?utf-8?B?WmF3SW83azUvdlRscW00SjBmaitsdGVVT0hFbjFmeU9Sb08vd1FIdUFKTFV6?=
 =?utf-8?B?cUF3eWlONFVWRTZwRG0xUlliWVNHb3dHRWQwaUlLaUljVSt5S2R6aklnOFhE?=
 =?utf-8?B?QTc5UEZ5MTlDWEg2UDRkZXBGSVFwMmh3UDh4Rk9oNWVLMkViL253cUdxZlZa?=
 =?utf-8?B?UWpTckx3RzJRTG9XZk5wOGU0REVPdk9Xc3FBcU9VT3pIeE5DM2lsT2tHVEJw?=
 =?utf-8?B?WTkwU2RWNFI2Z1UrWFhsV1dmRjJELzZLWnlnWEhEQnlmc1VMRm1xaHV0L2U2?=
 =?utf-8?B?QW1mLzg5QmpRdnNHdTNZazFEWUVmcXMrSkc5ckdPMXRQbEIrZi85aTJicG5V?=
 =?utf-8?B?OE1zZkZaNkNTbTlsYkhPZVRLeTVxc2N5VXV4R09mVGJySWJzMmFaU2EyUnNu?=
 =?utf-8?B?UGVkUlFZY3NPWWloazhtTTRLR1VSZ0FsOHJueFF0dGRSQmxETWdLY090cHdO?=
 =?utf-8?B?QVBmelJYV2l6QmlwcnBweDJIWTNsZ1ZWRHN6QmhXOEVyM3hhb0hxTi9qR0pk?=
 =?utf-8?Q?GrOK2nxbQkaNhhEk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a244ec5c-5baa-4122-6e45-08de6e166b30
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 11:19:30.2540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yh0brzuBrkoiuQKky83n0n5Cp+WgrZIJBxvFpzKpN+cGp2GLuO724YRjw2xObIzJxhpnRKSxfnqiz+CYj3gMrZt5eQfVO+QWlDPCAjNw9xM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6720
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

On Mon, Feb 16, 2026 at 09:40:19AM -0800, Matthew Brost wrote:
> On Mon, Feb 16, 2026 at 01:51:57PM +0100, Francois Dugast wrote:
> > mOn Fri, Feb 13, 2026 at 01:16:25PM -0800, Matthew Brost wrote:
> > > A single VRAM read on BMG can take over 1µs. While small, this is a
> > > non-trivial amount of time in a hot path. Remove the descriptor H2G read
> > > (potentially a VRAM access) from non-debug builds, as this
> > > error-checking code is not needed outside of debug configurations.
> > 
> > About the change itself: I understand the performance benefit and this would
> > make the code consistent with the 2 other reads.
> > 
> 
> Yes.
> 
> > But the existing block under "if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))" seems wrong
> > because it is not just about optionally printing some debug statements, in case
> > of error the function actually returns a different value if CONFIG_DRM_XE_DEBUG
> > is enabled or not (goto), and this return value is used in __guc_ct_send_locked.
> > 
> 
> I can't realy argue with this logic but I also see the benefits of
> verbose checking of GuC state in CI configs. fwiw, this logic was added
> here:
> 
> git format-patch -1 d2c5a5a926f43
> 
> The cost of reads are actually huge here - this patch by itself is
> incomplete as a tracepoint below does a desc_read in the argument list
> and this is uncoditionally executed even if ftrace is disabled. On BMG H2G
> before this patch / fixing ftrace are 3-4us, after ~300ns. So I'd
> suggest we move forward with with a couple of fixes patches first, then
> in a follow up either:
> 
> The cost of reads is actually huge here — this patch by itself is
> incomplete, as a tracepoint below performs a desc_read in the argument
> list, and that is unconditionally executed even if ftrace is disabled.
> On BMG, H2G reads before this patch / fixing ftrace are 3–4-µs; after,
> they’re ~300ns. So I’d suggest we move forward with a couple of fixes
> patches first, and then in a follow-up:
> 
> - Move all really expensive things in GuC CT layer under
>   CONFIG_DRM_XE_DEBUG_GUC, enable this Kconfig some CI run
> - Perhaps just assert if GuC state is corrupted in the path mentioned
>   above

Sounds good.

> 
> Matt
> 
> > Francois
> > 
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_guc_ct.c | 14 +++++++-------
> > >  1 file changed, 7 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index 6a96bea40720..f200d3ee9d22 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -939,22 +939,22 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > >  	u32 full_len;
> > >  	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&h2g->cmds,
> > >  							 tail * sizeof(u32));
> > > -	u32 desc_status;
> > >  
> > >  	full_len = len + GUC_CTB_HDR_LEN;
> > >  
> > >  	lockdep_assert_held(&ct->lock);
> > >  	xe_gt_assert(gt, full_len <= GUC_CTB_MSG_MAX_LEN);
> > >  
> > > -	desc_status = desc_read(xe, h2g, status);
> > > -	if (desc_status) {
> > > -		xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
> > > -		goto corrupted;
> > > -	}
> > > -
> > >  	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> > >  		u32 desc_tail = desc_read(xe, h2g, tail);
> > >  		u32 desc_head = desc_read(xe, h2g, head);
> > > +		u32 desc_status;
> > > +
> > > +		desc_status = desc_read(xe, h2g, status);
> > > +		if (desc_status) {
> > > +			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
> > > +			goto corrupted;
> > > +		}
> > >  
> > >  		if (tail != desc_tail) {
> > >  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_MISMATCH);
> > > -- 
> > > 2.34.1
> > > 
