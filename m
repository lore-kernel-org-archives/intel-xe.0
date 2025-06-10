Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAD6C5B543
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 13:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D6310E577;
	Tue, 10 Jun 2025 13:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SCna2xVw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5028D10E050
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 13:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749563897; x=1781099897;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LZEE9AMHVof5rcGgpNjJsLQIbNIVf/Sojz69OmGYXm8=;
 b=SCna2xVw1sPWvctscAQWqCCK/FbSwd9wEu9+EWxXPgz0pN5Hhjgk7a8M
 8KXuiWerxinW8oT1+nPssHkNRba04mVCx3IGOxH1shmE5hSnTUUzoYLNA
 +swrz8TTdghb/tC714nOkY6pOVZJBaAEoqV5ESl5VsQYtGz9XdIG3gH0N
 NbNNyjkExj6mGpmPZtXYChCnxvidD1qs/ekYu/PSaNC20DO183VbLiWR0
 CgOO3CCe7avMIfYwjNepnYXYnwoz3M9zjVyVQV1uUpfiGm+ZucCPogpAH
 0RYIZ5dS0fJidpaCrsdSAX+7OI44M6GRk/kGIniBWkud0NY56FeG1lJUZ w==;
X-CSE-ConnectionGUID: ATTn7QQ9RKOVB5fM4Upkkg==
X-CSE-MsgGUID: Fq1HBUZ4QTmdEoUpDBon4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51819807"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="51819807"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 06:58:16 -0700
X-CSE-ConnectionGUID: wmGQP1mXR5CWw7ni7TyN3Q==
X-CSE-MsgGUID: gHDP1U+0STOIUdzqPJ5T1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="184025722"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 06:58:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 06:58:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 06:58:15 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.88)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 06:57:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tSPn4oynzHGZ+mxU3qfjfj6F5gATO9qNZ6rZs8aTXr0hAEhP5LTFEjKiy9qJZoKLeTNArd+tuC7gk6w80rE+uWjZHi08Rsfgp6HIKglVaq9osDJqRLXuM3qzd0zWWtDdYFiHe9fzT0hp4uERNpekzVX05jIODud3oE91Z8LvgM+lxwod7t6A595vMjsoroJfDnUddysYTElyq3xjfFVTIx37eSzh25MDU5no/o6aUXlmIsfQ1Cp+hz9eswaeCZlwwmrjlq661PQEnZXMls7frTn1/6reZb2tv2kmRID5vWdF18GQVgLhTMv58cLDXDpvw5rr45q3+V7KZps1WjNimw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3138prByGEKLktLGtY6oyEI/ffxtvWdIUTyNul9PyH4=;
 b=m/WLUQpK0JehTXQZRRhU+xZ/hai0wsJIXag7m0eENruPQSSXN5A3UD8ZOworz/NILIaKFzyL6OL5+SL4jBLH2AfUP/KueibRoWkxNXxEwZhodMNy4EwN9vz4aEhOn8PnCnCwPnCu2KVIqwD/yfpXl9XMeeJp+puQP0TZgrBs7RlBR/oNyen/DJ9DFANYlj9i70jzJH+JGDC8VeNglWr2+BAGn9ixzKgw3FCLiIUEJGy6kzjfnX93KRaOpMLX2gqGWgtf/gxgWEfsslOColx2MYUGX8juITU43zgj4DuSbODxKbOFxMkQgOs31GGy5kRGi5+arRjsmZcfaYPaGY51dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by CH3PR11MB7178.namprd11.prod.outlook.com (2603:10b6:610:143::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 13:57:56 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02%5]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 13:57:56 +0000
Message-ID: <fd377581-4013-4139-aea2-9fb2578d2773@intel.com>
Date: Tue, 10 Jun 2025 16:57:51 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Support for mmap-ing mmio regions
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <koby.elbaz@intel.com>,
 <konstantin.sinyuk@intel.com>, <yaron.avizrat@intel.com>,
 <moti.haimovski@intel.com>, <didi.freiman@intel.com>
References: <20250609095938.16782-1-ilia.levi@intel.com>
 <aEcByyaKe82P91RT@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <aEcByyaKe82P91RT@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TLZP290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::17) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|CH3PR11MB7178:EE_
X-MS-Office365-Filtering-Correlation-Id: 2182d8e3-7bf8-424a-2559-08dda826cd25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTVXM3c5eXlIVC9kWnBkU1VTdUhtUzhneSt0bC9CdHFnUVl0NlFRMjQ2WGdp?=
 =?utf-8?B?TDlEdDA1MDRxSmtsVFMwRUhpeTBGdGtaeFFvLzNWSDlUYUFzK29Gd0x2ckZl?=
 =?utf-8?B?V0VvNnVIUlY1WUxCWXZDUFRiVkhUMEt5dG1KR0gvOCtZaFlRYkprYjJ2NGdK?=
 =?utf-8?B?cVlucWE1Y3ZKY1F3eElRYmlJUW45cGt5U09pQmVhTHF4RG02c0ZSVE5ZUGJL?=
 =?utf-8?B?TWtTUVM2aGJ5R3pMc1UxTUNySzdyT0VJYjJyNmtwMmdtQUNrYTc2YWhGc2RJ?=
 =?utf-8?B?VU1vTThEREFyRG1yUk9BVWgrUFRlVUN6WCt5RUpqbndaSWlZdmdCRWNibjRq?=
 =?utf-8?B?NVFPQVhKYVZIREJtYlBpTkN0b1BZRFpVQStrUzNUbWFvMURaWW1YT2Y3dnM5?=
 =?utf-8?B?cmlIbnlHOVFGR3BQWTZxMElRSHB6d2VTRmp2Ylkxb00vOGZNVlpKZjNZY25B?=
 =?utf-8?B?UG8ySEc0V2k4MnZzQkhGMldocWhLOG01R1FETmhnRTM0MjFEMWNlY3dmRjJM?=
 =?utf-8?B?Q1BCWmJGTDFkekJiRWppVVdEdFBteUxoSlgzMnZsUVlWUmhFL3BXREZLdnFi?=
 =?utf-8?B?TWpFeXZ3T2dOUWk5TUVzMnlja3BxWXVwTjlTRE9RT3RtZ3dBcjJKSmVLMlFK?=
 =?utf-8?B?ZWpxcytaYWJieFlIVm5QRmorRUxXdFQ4QVNrbFRheWdEa0pEU05wdGpJY0R4?=
 =?utf-8?B?RzRzNE0wdGk3Tm4rWjF1K1h0RWdRT0x0SXY0M3dLcGp2L0xDb1l2WDlyTnRU?=
 =?utf-8?B?SmRYa2NiMy9BWEJjMXRLa1M4dW9ZeE5waUlDL2hjcFZDcFdmVGprbTFRTHVY?=
 =?utf-8?B?YkVmWm1kbVIwMW00aks4VFNpZHhNRGtpUit6YjNBRlNOZVdSeGlwVVpRK29D?=
 =?utf-8?B?b3ZQdmpNNWt4RWd2WVdZb056WWMzK1hGVXkySnpCYVNkMHVVUWNlVXR0OVEx?=
 =?utf-8?B?VVgyZEJiNE1hVHk2bG9GWEFacGlhRGk1V1czdjVLUXJXbmI0VGtSNlozOXVn?=
 =?utf-8?B?L1BFVGhBelQ5ZW44Y1pMQnQwaHpPdkovNDJBNzR3ME1FSmxEbW9VRDI5Tzls?=
 =?utf-8?B?dm0vbEJwV3lvWGliM2ZZamtycUdKbnNQenZMaGpndXE0Q1Y3MTVLMjNxRUh1?=
 =?utf-8?B?K0JIRElGbVI4ckpvMm1FZ0RKUGd4SXNKMVlSVXdYaWQ0QnN6OGRFczg2Z2xy?=
 =?utf-8?B?d3oybjQxbG1IUlBaQnRBNWd3QlpXSUYrcVpJWnMydXNXSjkzckFLREtQZ1Zu?=
 =?utf-8?B?bm9BUkg3M1p0cWRUOTZjR0FtemF3TEhEbDdNNHZ0bUUyTUNKZG5aa2l6UWs0?=
 =?utf-8?B?NE16c3AvbmpQOXgvWE0zenI4bVgrS2NUNDh3TGZsN2R0UzFYZU1HMHJhNDVO?=
 =?utf-8?B?OTZOMmJGUDhMd01rOEJQNUJsZlo1bUV0d0ZtT3diajdDTEI3VW5KQ2dFY1RR?=
 =?utf-8?B?M0ZSSUlPS1Ixa3hsUDNqdUNPV1FvVWYzSVBBOVRYUlUxQ0F3cWtIVTd6ZXpB?=
 =?utf-8?B?T1lyYkdscUtwOHF1V0R0TXpVUHZGQkF3Q1F0Uk5KWkdBbVZZVGFzeGcyL0JJ?=
 =?utf-8?B?TVNEOEJnUSs3R1FJRDNXcUQ1WHFjdlJZemFldlh6MDdrWTVGRmp3Sjd6R0c0?=
 =?utf-8?B?bXBBRzQvd3BCVGNyakhqZFZHcUZWd0t0UWVTa0IrVXFEN2o2bC9YYi9BdC8w?=
 =?utf-8?B?S2RmNlc0MnRSWFhGVWlyZW9qNmR3UlhQajFFRzFjVkl1Rzh2bkg3U2Nkak9K?=
 =?utf-8?B?QTNaeldSMTM2TzlBVXlUbmQwem85d1JOODk0THlUUmNPcExDbnZaTkxBVXZQ?=
 =?utf-8?B?RmVvN0g2KzRzRExxc2s4RTRjRjMrQ1dleExZYjhmUjZVcTdUazRaQUpRbXRJ?=
 =?utf-8?B?YWN4a1NFYTZuT0l6Mys4STBGeVRGTUQ2cnRYNFpmRWdjSmdob1FHZGtzSklt?=
 =?utf-8?Q?QdhY56Sin/o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1FaTFUrTkk1dnV0WitCV1BXVWhLWHBDaWkwM3diZVJYSTBVZ2pqN3NKVHdW?=
 =?utf-8?B?MFMwWTl3S2REMmlYeXkzLysrTUlIK096eXBiNWF3SC9HMFJmbm50WTZBS0tF?=
 =?utf-8?B?L3ZqVHd5aXYvZFFvRnRjdWJYZlNuQk5tTXpzMmg0VDNKckpHYXl3alhIRWE4?=
 =?utf-8?B?dHp1R0lDZktqVGhjMjQrc05XSXdvM2xqNktCbHhSRlM3REd5dGs5eVFINXc4?=
 =?utf-8?B?OGJaK1V3ZjJBVmxUVGQwak1qdWxtZEtYbDFFUG1FUkVYT05HU1F0MkVmYkVL?=
 =?utf-8?B?eXB1aUxGallHUkRxMUtSNTBWZ1g4b3NHcVdkSlpiQ3VZS2RkYUN0cUV1d1Nv?=
 =?utf-8?B?Wll6aWhpd2lDdGRYcDIxdzBtVzMwS2E0SWM1bUhmV0NJNXQ1ampyWmdMMzAz?=
 =?utf-8?B?M3lYMnZ2a1FVblduc0dERWlQMFJhZnJsWVc1R0FiQkhHZ0xpRUdBRjBOdUUz?=
 =?utf-8?B?SGkrMmlKQ1Q1WGZKdy9ramQzTmFuSFlFSWhCYlZDTG5CLzJuM2F3OTJ2cjJW?=
 =?utf-8?B?blF1dmdVd2VIM0t4SkdQYU1yNEYvOFlhcjJXbmZ3OVNUcmtsNXFxRDVaY2E2?=
 =?utf-8?B?eUhCMkJQU2JXVDhVVm1jQldzdVdzbGxCWFgyVUc1K3BPYXpzcEordkNYQy91?=
 =?utf-8?B?OWswd2pRNCtBQnZNUFBybng3TnNXc21kT2d1c2h1WmRKNE1rUzVLWHlDdzcz?=
 =?utf-8?B?SUJNbytESHpta0luMXhHcjhQOCtydkYySXhQcXRTSjNSTDlTNGxKSit3Snd0?=
 =?utf-8?B?RTRLQkVFblhXcC92MGZ3OFhlSFl3UlBmY0RIMEZzcUswem5WQVdraGVIb1RW?=
 =?utf-8?B?cE02dXdOL296NVd2K1RZSkNwajlFZUpxTzM5VmI3aGhkbktVaGNwT2RKSXNu?=
 =?utf-8?B?RnlwNHNEU3A5SnJNZ1JmL1ZhMjdEZXdIRW9nZmxnakg3Vzk1Zkt5RnVXUnp5?=
 =?utf-8?B?L2dPMWplbHNudDZ2ckpML3MyZkY3L2tBSmI3bVR0VHhNNnkzKzR6L2tYVGF4?=
 =?utf-8?B?TXM1N3RFK1pvL2xkbktoNVVwclJHYUF5QStYZENidTlCT1lEUXhkK3RFa0hR?=
 =?utf-8?B?MWVyS1R3ZkpiL05vN21VU3RLcDA5QmlOZzIweFl4SXh6MVlwTWp0ZXRSR3Ur?=
 =?utf-8?B?S1BrSkYzSm5jY1FtbnJhbXcyQ3FxT1lkQ0NaN2pEWDBpSDFjbERIQnFJcjFi?=
 =?utf-8?B?QmlLbWk0SndQRVZQdU1EZVQ1bUdRMGplSmdzU09UZWlySkt5ekpSUUcrTSti?=
 =?utf-8?B?aHYvL0tDQlF0YWxhdWg0UmxXWTByOTFGUHZNNzRBb3V1UVlEZHgyRUh1U28w?=
 =?utf-8?B?clFDSmlXdDZlY2ZDcVFZWjk0VXNwZHlHWFJ4L0ptZnFpL1JKeGVlazNFMExk?=
 =?utf-8?B?Ly9ad3BFQndKeGtsSjU3ZGtRVTJmdWtvZDRMWDZFbldINVdQbXVKMG1jWTlI?=
 =?utf-8?B?Q0l3UU1kdXFEdXBCK2QrR1BPekdpRU8yNzR4Mm5SWGo1NzkrZ1YvNmhMbUh6?=
 =?utf-8?B?R202OEFlbjdyVmk3TXRqYWpHZDg0eFBoZmRCTEE2aWZHcFBPMEtXL3czU3My?=
 =?utf-8?B?ODBpM0FvYnpLUWZqdTdBeDNLTEU1UEZrdHUvRzBMVVltaXZaTXFtSmEwLzli?=
 =?utf-8?B?VWdvaTJZZ2drampQdytXZ21HaFJjZmdMVU5PSTcrcEN1YTdFcmFlTEdJOG1K?=
 =?utf-8?B?MXlCZU0zL3lTakN2Q3BOUm9iZDlDYXhhU3EwNEdtclA4WFkxNHdBOUtHdXRI?=
 =?utf-8?B?SU5YTUZiWEJHek5uSXlZTTRYNEY2MTFVc0Y1S1dUZUh6VzFaQ0dzbDk3aGor?=
 =?utf-8?B?ZDlYbzA4dlZnd1AycFNxdmJJWUdJVzVTcTNJc3p0YUcxN1BnNVBKOHpuMElX?=
 =?utf-8?B?dnZwQmZaazN0TU91VlJUZU9XcTZPY2pBWTFwdFpQVlMvVzhGcmo0ZnBUYTNq?=
 =?utf-8?B?SjlBbFpKRmlGbjhRZkZsTjhrQlh3djBzczJ1UUFsNVdpc3MvUkU2UEVPTXJR?=
 =?utf-8?B?c1ErTEdwUFgzZEQ5NC9ra1p3L1NQdS9qZE81eGlpYnEzZUdLWW1jSGlyODZS?=
 =?utf-8?B?WW14SjJieTlRRHN4M0hoSzFKdXdWV2VHdTZxZjBZbmJYRUxmQzNYU3JOK0lY?=
 =?utf-8?Q?zZbX1ZEf+KuRFGj77Hi+SPl+h?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2182d8e3-7bf8-424a-2559-08dda826cd25
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 13:57:56.3282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMMS4Yxt3wce+tDAZSv7IrDdZPaGG7DN/rlK53mpESHlN1djtIETTeFhhNmhdSdpdTg8P60a4wHumVHSxyMriQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7178
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

On 09/06/2025 18:46, Matthew Brost wrote:
> On Mon, Jun 09, 2025 at 12:59:38PM +0300, Ilia Levi wrote:
>> Allow the driver to expose hardware register spaces to userspace
>> through GEM objects with fake mmap offsets. This can be useful
>> for userspace-firmware communication, debugging, etc.
>>
>> v2: Minor doc fix (CI)
>>
>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device_types.h |  14 +++
>>  drivers/gpu/drm/xe/xe_mmio.c         | 142 +++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_mmio.h         |   4 +
>>  3 files changed, 160 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index ac27389ccb8b..78542de0d48d 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -10,6 +10,7 @@
>>  
>>  #include <drm/drm_device.h>
>>  #include <drm/drm_file.h>
>> +#include <drm/drm_gem.h>
>>  #include <drm/drm_pagemap.h>
>>  #include <drm/ttm/ttm_device.h>
>>  
>> @@ -161,6 +162,19 @@ struct xe_mmio {
>>  	u32 adj_offset;
>>  };
>>  
>> +/**
>> + * struct xe_mmio_gem - GEM wrapper for xe_mmio
>> + *
>> + * A GEM object for exposing xe_mmio instance to userspace via mmap.
>> + */
>> +struct xe_mmio_gem {
>> +	/** @base: GEM object base */
>> +	struct drm_gem_object base;
>> +
>> +	/** @mmio: The MMIO region to expose */
>> +	struct xe_mmio mmio;
> Any reason not this is not a pointer to xe_mmio?


Yes, I'd like to keep xe_mmio a lightweight object that could even be defined on the stack.
Here's an example of how this could be used:

int foo_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
{
    struct xe_mmio mmio = {0};
    struct xe_mmio_gem *gem;

    xe_mmio_init(&mmio, xe_device_get_root_tile(xe), xe->mmio.regs +
                              SOME_HW_BLOCK_PCI_OFFSET, SOME_HW_BLOCK_SIZE);

    gem = xe_mmio_gem_create(&mmio, file);
    / * store the gem somewhere, return drm_vma_node_offset_addr(&gem->base.vma_node) to the user */
}

- Ilia


>
>> +};
>> +
>>  /**
>>   * struct xe_tile - hardware tile structure
>>   *
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index 7357458bc0d2..6bfa915a9602 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -408,3 +408,145 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 va
>>  {
>>  	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
>>  }
>> +
>> +/**
>> + * DOC: Exposing MMIO regions to userspace
>> + *
>> + * In certain cases, the driver may allow userspace to mmap a portion of the hardware registers.
>> + *
>> + * This can be done as follows:
>> + * 1. Define an xe_mmio instance that represents this portion.
>> + * 2. Call xe_mmio_gem_create() to create a GEM object with an mmap-able fake offset.
>> + * 3. Use drm_vma_node_offset_addr() on the created GEM object to retrieve the fake offset.
>> + * 4. Provide the fake offset to userspace.
>> + * 5. Userspace can call mmap with the fake offset. The length provided to mmap
>> + *    must match the size of the xe_mmio instance.
>> + * 6. When the region is no longer needed, call xe_mmio_gem_destroy() to release the GEM object.
>> + *
>> + * Limitations: The exposed xe_mmio must be page-aligned with regards to its BAR offset and size.
>> + *
>> + * WARNING: Exposing MMIO regions to userspace can have security and stability implications.
>> + * Make sure not to expose any sensitive registers.
> This is no secondary issue, it is a primary one. There is no way we can
> expose entire PCIe MMIO register space to a non-root user (a root user
> itself can just mmap the PCIe MMIO bar bypassing the XeKMD if it wants
> btw).
>
> What is the requirement for this patch? I know on other PCIe devices
> I've worked on we had similar issues where we needed to expose a subset
> of the PCIe MMIO register space to user space for kernel bypass
> submission - everything we needed to expose in that case was 4k aligned
> + tied to a single process via a KMD config before mapping to user
> space. I suspect to do anything safely here, somethine similar needs to
> be done.
>
> Matt


As you've figured out -  the idea is of course to expose small chunks (say 1 page)
that are allocated solely to a specific user. One use-case is direct submission in
upcoming platforms. I am checking 4K alignment in the patch. Not sure what
you mean about KMD config - xe_mmio_gem_create accepts a drm_file *.
So the driver performs exposure of an MMIO region on behalf of the user and
only this user will be able to perform mmap. Do you think anything else is required
here?
- Ilia

>
>> + */
>> +
>> +static void xe_mmio_gem_free(struct drm_gem_object *);
>> +static int xe_mmio_gem_mmap(struct drm_gem_object *, struct vm_area_struct *);
>> +
>> +static const struct vm_operations_struct vm_ops = {
>> +	.open = drm_gem_vm_open,
>> +	.close = drm_gem_vm_close,
>> +};
>> +
>> +static const struct drm_gem_object_funcs xe_mmio_gem_funcs = {
>> +	.free = xe_mmio_gem_free,
>> +	.mmap = xe_mmio_gem_mmap,
>> +	.vm_ops = &vm_ops,
>> +};
>> +
>> +static inline struct xe_mmio_gem *to_xe_mmio_gem(struct drm_gem_object *obj)
>> +{
>> +	return container_of(obj, struct xe_mmio_gem, base);
>> +}
>> +
>> +static inline phys_addr_t xe_mmio_phys_addr(struct xe_mmio *mmio)
>> +{
>> +	struct xe_device *xe = tile_to_xe(mmio->tile);
>> +
>> +	/*
>> +	 * All MMIO instances are currently on PCI BAR 0, so we can do the trick below.
>> +	 * In the future we may want to store the physical address in struct xe_mmio.
>> +	 */
>> +	return pci_resource_start(to_pci_dev(xe->drm.dev), GTTMMADR_BAR) +
>> +		(uintptr_t)(mmio->regs - xe->mmio.regs);
>> +}
>> +
>> +/**
>> + * xe_mmio_gem_create - Expose an MMIO region to userspace
>> + * @mmio: xe_mmio instance
>> + * @file: DRM file descriptor
>> + *
>> + * This function creates a GEM object with an mmap-able fake offset that wraps
>> + * the provided xe_mmio instance.
>> + *
>> + * See: "Exposing MMIO regions to userspace"
>> + */
>> +struct xe_mmio_gem *
>> +xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file)
>> +{
>> +	struct xe_device *xe = tile_to_xe(mmio->tile);
>> +	size_t size = mmio->regs_size;
>> +	struct xe_mmio_gem *obj;
>> +	struct drm_gem_object *base;
>> +	int err;
>> +
>> +	if ((xe_mmio_phys_addr(mmio) % PAGE_SIZE != 0) || (size % PAGE_SIZE != 0))
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
>> +	if (!obj)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	base = &obj->base;
>> +	base->funcs = &xe_mmio_gem_funcs;
>> +	obj->mmio = *mmio;
>> +
>> +	drm_gem_private_object_init(&xe->drm, base, size);
>> +
>> +	err = drm_gem_create_mmap_offset(base);
>> +	if (err)
>> +		goto free_gem;
>> +
>> +	err = drm_vma_node_allow(&base->vma_node, file);
>> +	if (err)
>> +		goto free_gem;
>> +
>> +	return obj;
>> +
>> +free_gem:
>> +	xe_mmio_gem_free(base);
>> +	return ERR_PTR(err);
>> +}
>> +
>> +static void xe_mmio_gem_free(struct drm_gem_object *base)
>> +{
>> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>> +
>> +	drm_gem_object_release(base);
>> +	kfree(obj);
>> +}
>> +
>> +/**
>> + * xe_mmio_gem_destroy - Destroy the GEM object wrapping xe_mmio
>> + * @gem: the GEM object to destroy
>> + *
>> + * This function releases resources associated with the GEM object created by
>> + * xe_mmio_gem_create().
>> + *
>> + * See: "Exposing MMIO regions to userspace"
>> + */
>> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem)
>> +{
>> +	xe_mmio_gem_free(&gem->base);
>> +}
>> +
>> +static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *vma)
>> +{
>> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>> +	struct xe_mmio *mmio = &obj->mmio;
>> +
>> +	if (vma->vm_end - vma->vm_start != base->size)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map the
>> +	 * whole buffer from the start.
>> +	 */
>> +	vma->vm_pgoff = 0;
>> +	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
>> +
>> +	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
>> +		     VM_DONTCOPY | VM_NORESERVE);
>> +
>> +	return remap_pfn_range(vma, vma->vm_start, xe_mmio_phys_addr(mmio) >> PAGE_SHIFT,
>> +			       base->size, vma->vm_page_prot);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>> index c151ba569003..2990bbcef24d 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.h
>> +++ b/drivers/gpu/drm/xe/xe_mmio.h
>> @@ -8,6 +8,7 @@
>>  
>>  #include "xe_gt_types.h"
>>  
>> +struct drm_file;
>>  struct xe_device;
>>  struct xe_reg;
>>  
>> @@ -42,4 +43,7 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
>>  	return &xe->tiles[0].mmio;
>>  }
>>  
>> +struct xe_mmio_gem *xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file);
>> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem);
>> +
>>  #endif
>> -- 
>> 2.43.0
>>

