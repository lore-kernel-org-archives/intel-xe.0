Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B293CA5FFC
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 09:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9C510EC51;
	Mon,  5 Oct 2026 09:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hSQqJhcj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2AC10EC51
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 09:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791192645; x=1822728645;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Sivwscr4mXGJhkjMTJauTwn3O5Z4fxRWroRBE7C7ZyQ=;
 b=hSQqJhcjAKlsRGGJ3SLXkzTkYUrfxRQyi7nGwGy2RusaAyl6zxJY9Lnm
 VmeouARNb7LKHMFt4r9Qx6mBNNZh1a2LzHXJtRcx1xqj9ghV2YcqUacki
 2fTgPFKsr8R2m8gNQy1/6xifn5YqPkCQQf0R0COBm4i93rOlbl5KPdZv8
 sbqWsXMa2Nbl7Vv0Ijh8raLhuZKdw+xujkOQgRcpU9NRS590OTinRpIIu
 X6NNZ1MX+EIW5Dl0TH3kxrLno0F3clQCLNH7z+uYm311TZq40/y7tzPkI
 N5SuQ0UJa8qDhBVePZrtwSRelEsMeWOKtYvY+epJrjm+135+8cyyzXooa A==;
X-CSE-ConnectionGUID: rBJP8CfQRSeTUu9suimZIg==
X-CSE-MsgGUID: GsannZjKRQaTN0Vugzddpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="90916012"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="90916012"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 02:30:44 -0700
X-CSE-ConnectionGUID: sCXOy8h3RaWPnzp3jj0Kzw==
X-CSE-MsgGUID: wyLJ8I/lQYyyp383xEvpYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="284852528"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 02:30:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 02:30:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 02:30:44 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.46)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 02:30:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3Cvgk9o1EQxhnQ10ssqkNw35JxAHWWrAHZSHiviq65/Cskp1kwanN5UY5s+GAOPcl1WfkyDgoo/I52wR7a72ZmdDjJTtmX5d6Q/sv6fD8d7a33o8h+HmafGPTimp13SVJtcKKiUuGHYYBnQzZ2JWPNyaEZdaulWqaqZ+KSSXcq3/Cc8dN2rQWWWzhkGQBFwiTiV1OF7M9inGxUxsYNQEJ1QluU2hpcmrUFRMYichZG0MXZO7uRYpRUTTChfGRGvlRbawXRrTF7gKWIZk/jUnEmDvyK18Onpst3tfL1pXOgy7x2TERHBDzAsYSkvKsyLAWkiW3pcxhd6246ExfZSgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coa+nYbYvM7heYOCwOBmu7Hm4ozdr9AC5HiZM3TzM8o=;
 b=SDLDcvXu5ihyI+7fwHc+3gLxB+Eggm52ebdQIbJxbr/BNuXwAxDcOyyTUnbOsbsvH7h7klk6TwXfetoEPep9/W0qqOf1xnUvVmAxn6tdRsLwbhl/EsNQ44bq3hMlEplReW0wcq27Wm8d1aLu16M+EHy7XqK1uyXRRSwNNafZw36keXv+uDOqQOqedDTf9VZcbBnUi+jIvhACFhgqqGHcfCTT8kxNgRseWxai302n8mPNXS0BoGoqOC3waaRcDt9g6UHF8rzcHh3SXKHWb0V3Fv7wCwo6abcpLYr7dQnrUXl6O2q8ld8Ab7bXSI8hPAvGpw3D1yjKY3xBr5SXkljMkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SA3PR11MB662844.namprd11.prod.outlook.com (2603:10b6:806:538::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 09:30:42 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 09:30:42 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 2/7] drm/xe: Define VRAM regions and pools
Date: Mon, 5 Oct 2026 11:30:16 +0200
Message-ID: <20261005093021.3741599-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005093021.3741599-1-piotr.piorkowski@intel.com>
References: <20261005093021.3741599-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TLZP290CA0013.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::6)
 To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SA3PR11MB662844:EE_
X-MS-Office365-Filtering-Correlation-Id: 86e68860-1de0-4d74-78d7-08df22c35367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|6133799003|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: pXIGSrVNWsRyn+JxgPI0YstRvfBza/yDY88oIvqfvUXgmFd4RKtIzJDM4FZwTGjdvMKLpUm5F81tHCnyMIi2Hj8b9UPvEy4JhSY4H4yQKz5PTfGpjJfpdpym/qlG3RN3rcUKGoOWNjUwAckquyMgqp+UNRizvojGMbErmu6QI79GZ8ZJAyz4RnkuOtKTWanuhQrCOnYlHdHLIN8tyWW5IQTLSNjUgDK+eZyj0yOt2CA3GDPkkUKIO0fqTdkwhUS1cewDRRS13FVJXTuK3UaKhnZ1B4hswPfdBC6j9tGXUdmCkJtMg5Vv5iVLDhBLROX6lMs8IjQ7fH/tvfPAS5tqXuW+JdmKHQ8B9fW5WfnXnjlDM6ZMnhrhLqsnMUMY9fcFZkLtQtHLzlmAx9PwxUYRn/QDAa5MkbslmZ3M7idajqPYrscl8zx+dHxp0Ckgo1bgdj8JEhVWIl/yUu+XATu/foBxShEyMZB8Z6Dc2ctU/tmHKZmO5lPkqNuVcJGwYLKLOSjgdjvtn/DbhzMtfziQGQ87qPabFjX8uQ19kuvNUtvvC7sR1rU+Va6/AjENnG9osmcPKubo5Ts2ho1Sk5tr496JDhFL2HHhKn96CS4cLzBTequcjGnOIv8jxOYQp6Tpx1sks4u1jFKuj5G9bHcObnk6qYwc4DJpuNomfJgFAj0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(6133799003)(5023799004)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Um9RNExIWk9QOGdPOUozRSt3RUIwdTFEd0xNYjhheEFyL0RZSW9OL0pLempQ?=
 =?utf-8?B?YVFHbC9Dc0Y2UTVtRk96Sk1yaDRmVVZ1QnljbzdydDJkd0pqR01pMnIvSk03?=
 =?utf-8?B?NVFybmt3b1RlU1Z6Y0cvdWpaeDlKWDd0T3pOS0NpUGR6bG9Vc1NpOUlJWHl5?=
 =?utf-8?B?cWNmL3VsN0FTOWdoR0VNY2RtNTl4ckRiekdML0VMbXFjcENWZTFzNlRucnA3?=
 =?utf-8?B?S21EK1ZSSktEVHUybExoNFZITE5vMS9LaHNGMFoxemRnOHROS3JnNzZRUDRk?=
 =?utf-8?B?ekh2ZjJZOWVRbGJWeHY3Vll0cUVsbk1oenNyUjJweDNJSTlIT0hWL0w0M25R?=
 =?utf-8?B?eDBjeHRwc3puaFl3QS9keDdURlg5QWl6MkFpV1c5azU4UC80S3hPUDVrZS9M?=
 =?utf-8?B?VHBITXgyTVcrSE04dkQ1Y2lDcWxFRGdRM3gxazM4QnJvVzJHeWtHcm9HTHh5?=
 =?utf-8?B?elIvb1YrbUVieHUvWlJ1K0V2RkMzTUNxbWY5cFlTNlFGM2xtdXVlc2pQM3FV?=
 =?utf-8?B?KzNjZ0dPMEt6WERWUVZPWFdpc3dkZjYxamNYeE5MQXBSS1lGQnc1RkhSUm5P?=
 =?utf-8?B?N2xTVHhVeTlWejhsZ3E4Sy9mOE95Z3lkMGRZMzZxdlRlL0drdjBDTXR1L3dK?=
 =?utf-8?B?ZkxEUmNMOS9WSG1XNWhqaEN0eXUxNkZpTytScGt6SHBLcDZaSVNuOWMxcTcy?=
 =?utf-8?B?c3ZtVEJxbTBlU0J3T0p2RXRXV3ZncElVSW9iZERFY0NsemFiLytRREh3ZldG?=
 =?utf-8?B?SExxYjlEUEIwZGxDMlFPdjkrNW1hcVBETGlSQytoWEF5VURaMWppVDZOdmR1?=
 =?utf-8?B?UE0xWHZFaHpmbWRYQnY4OHMzQjFhZ1lQSkVEdFZtbFNJbHZqR1VyRTVLS1FK?=
 =?utf-8?B?YVRCZVRiUGFqTGMzK0U4NHJlQkJ1OVJTcHY1OWk1Z1dkN0xpRSswMlY0VnhS?=
 =?utf-8?B?MHE3dW44c29kTElTaDNWeGRKZmNJYW5PMDhESGF6NFAySFpyOElYUTVab1hT?=
 =?utf-8?B?Wk9tK2hxUmhWdTVzTmQwZXUwelQxSTFNMVNKRkxXVWFuMkVsVDVMVjlYRFFp?=
 =?utf-8?B?eVVqMk1oZG8rRlN4NVRxM01UVlJEejEzeVdUeVV2dkdTS1dGc0dpTnJLb29I?=
 =?utf-8?B?UlpaM1lEeDVrTWFIWjhyd2hVZi90dWtxSEg4TTZnY2JzelFuVFltcDVUYVhq?=
 =?utf-8?B?WE1QM3hxT0JTZ01wRDJMZnlGTE9qZy9OWndvSVMweklaQ0RGV2ZCUS9zSjlK?=
 =?utf-8?B?V3dqQXpqbUZEN0tuVTdscUFwRGZvZW5TYnN1Tjg0cEc0SExCc2xnRWhrYzFh?=
 =?utf-8?B?VTNGOUoyUGpjUVZCdGpCbHdqWVdGVnAyU0c5VTRGT1N0dDBxTEU2Mk4wV3dT?=
 =?utf-8?B?L1hNa1MrakR4Y1l2elhVTVdJRjdwWUg4ZnZDbEhTRkhNbWoxcUM5SkEwMlVp?=
 =?utf-8?B?OGxSRk9JUG9YcWJYVWZKaThFelZEOEpnenBqSm1vU25rSW9xWnhPU3kxZU5W?=
 =?utf-8?B?WUFLeUpYeHo1bWFlS1U0dUtxRldSRHkzZUpoUUxMOG1CQ0ZrSVowdlhQSEFS?=
 =?utf-8?B?TTFiOEZZODZ3UkF3R3dieVNBT1RsRVZKUTVJWC94S1EwLzErcDRqdmtkeHY3?=
 =?utf-8?B?WFpCU0JmUHBOaENIQkhzbzRMRiswVS85ZmVVa2h1MHMvMVp4WmRPVTFTODdU?=
 =?utf-8?B?aHQ5dkE3dk9DOWthK3ZxdldFeXpXOTdQT0JzNUpPc2JFTFMwdExXVlpWa1oz?=
 =?utf-8?B?OGdsSWNFMDdXR1ZSdTJDV3NXWGRNMStpNlRTaDY3bE9pWmlCUE9LRFFZZGoy?=
 =?utf-8?B?VVRDR2N5d0JTNGRtY3hud293R0V1Rm9oRXlOVHZjU01rMERQYXZyR3EzQmI3?=
 =?utf-8?B?UjNBbEZ4U1pyWU1ESG1vRElGbDRxWlVZQkpoNDlsYmhLR3BoRThmQ0gzRHlH?=
 =?utf-8?B?Q0h5dm9aOVB6ajlQREV2ZFZmbjFYdzQ1ODhoOXJuNWpzVGtXcmFFNko5aTU3?=
 =?utf-8?B?TnJaTFpVcmtzeVlUU3IzMzl3STlqWVZUanJKTTI4U2IrL2pFNENiQ1FpTHpR?=
 =?utf-8?B?L0hPVkhWTnhaUEl1RmxxTFhxRVUydEhnMWhyOHJxZlhZeVQvYXlyd1ZNN2s3?=
 =?utf-8?B?UVY4M2lvb3hiMkpnYlZaV0xEdjk3b2J4VFVnbUgvZ2ZxcXc5TTVURFE1OHlC?=
 =?utf-8?B?Zm5mMkpRVCtWYUQwRmNMa0JQRFg4SXBlM1A5dUxDUkRaVTZ0V25DODdSbFkr?=
 =?utf-8?B?ajJISVVrM2ZJYm5LL1FXeXhTZXBuVm9Va2RKdDBPUkRBaTkyWWRXSUFNenl0?=
 =?utf-8?B?dlpIRiswM1VhMC9lREF4am5sbTZjMlZVU2k5eXVnL1FPb1hLS2lHSUxZellT?=
 =?utf-8?Q?yjca8mwspuJ+sCAk=3D?=
X-Exchange-RoutingPolicyChecked: d1oeRjtBR9QDtvfupIFBg3svr/u7VNSLo6LIB+QUNhLec1mBf5cuxDEaYwKQ1BVQHgplsIqWJnssKmxS9XPXpEJJLeFdtPpieBR4+avFZCKU4jurXESTvD1kajCKUMqAPc4eQjFtZKnlxyPhXTQfToRhWyHN+orn8PvMXoTVHtBCQaBJdHr26oozld4viYmiiMzSfP1pjkSkiPcaZvyKdpS1SivoFwgJx4j7hd/DcPcRNpsxjhJsK/2lUs5LMPsit7jV48Sol9LD/WqYyhij1XZLTz0OT6s3/UkovxMi8S1cPOJs/PM7Ttq3SU8LgW3h3jhBZPRGL4tDe4BnTlOqrA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e68860-1de0-4d74-78d7-08df22c35367
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 09:30:42.5001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nCSGtfpLJ93hP0kRaYoZ/0In33VdN0dIXTmmoQqxqVISIoan/2fphDtN5q6eYXf3nW6v3l6bof+HlN/YAb6s2eFM3ta0rG3z/YEzaheKaFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB662844
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Allocation paths place memory through a struct xe_vram_region, which is
both the physical carrier of a VRAM range (BAR mapping, DPA range, TTM
manager) and the only handle for the purpose an allocation serves. That
makes it impossible to dedicate part of a region to a given purpose,
e.g. to keep kernel allocations such as LRCs and page tables in a range
of their own, away from VRAM that may be reachable by other agents.

Separate the two concepts. A struct xe_vram_pool represents an allocation
domain: it identifies the purpose served by a range within a VRAM region,
whether that range is available for general use or dedicated to
a particular purpose. A struct xe_vram_region owns the physical resources
and embeds its pools as partitions, keeping pool pointers published during
initialization stable when the region is later split. The region also
records its binding, distinguishing a device-wide aggregate from a tile
region, since both may use ID 0 for the first tile.

Assisted-by: Claude Opus 5.5
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_vram_types.h | 159 ++++++++++++++++++++++++++++-
 1 file changed, 158 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
index 646e3c12ae9f7..a3e421f2f32d4 100644
--- a/drivers/gpu/drm/xe/xe_vram_types.h
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -15,6 +15,142 @@
 struct xe_device;
 struct xe_migrate;
 
+/**
+ * enum xe_vram_binding - VRAM region binding types
+ * @XE_VRAM_BINDING_NONE: no binding assigned, default value of a zeroed region
+ * @XE_VRAM_BINDING_DEVICE: device-level region aggregating all tile VRAM regions
+ * @XE_VRAM_BINDING_TILE: VRAM region bound to a tile
+ */
+enum xe_vram_binding {
+	XE_VRAM_BINDING_NONE = 0,
+	XE_VRAM_BINDING_DEVICE,
+	XE_VRAM_BINDING_TILE,
+};
+
+/**
+ * enum xe_vram_pool_purpose - What a VRAM pool serves
+ * @XE_VRAM_POOL_GENERAL: general-purpose memory, available to userspace
+ * @XE_VRAM_POOL_KERNEL: kernel-only memory, never exposed to userspace
+ */
+enum xe_vram_pool_purpose {
+	XE_VRAM_POOL_GENERAL = 0,
+	XE_VRAM_POOL_KERNEL,
+};
+
+/**
+ * XE_VRAM_MAX_PARTITIONS - Max partitions a single VRAM region can be split into
+ *
+ * A region currently holds its default pool and at most one pool dedicated
+ * to another purpose. The TTM manager mirrors the partitions of a region one
+ * by one, so a region cannot hold more of them than the manager can back.
+ */
+#define XE_VRAM_MAX_PARTITIONS	XE_TTM_VRAM_MGR_MAX_PARTS
+
+/**
+ * DOC: VRAM pools, regions and partitions
+ *
+ * Allocation paths place memory through a struct xe_vram_pool. A pool names
+ * a purpose (general-purpose, kernel-only ...) and resolves to a TTM
+ * placement plus the address range serving it, see xe_vram_pool_place().
+ * Whether that range is the whole region, or one of several partitions
+ * sharing a region, is a backend detail pool consumers do not need to know.
+ *
+ * A struct xe_vram_region is the physical carrier: it owns the BAR mapping,
+ * the DPA range and the TTM resource manager. A non-aggregate region
+ * initially contains one partition spanning its whole usable range. That
+ * partition is the region's default, general-purpose pool. It always
+ * occupies partitions[0].
+ *
+ * Each partition is described by a struct xe_vram_pool embedded in the
+ * region, so a pointer published during initialization remains valid if a
+ * later split changes the pool's offset and size. A split never changes a
+ * pool's purpose and may only happen before the region's TTM manager is
+ * initialized.
+ *
+ * The device aggregate described below is the only region type that has no
+ * manager and no partitions.
+ *
+ * The id shown below is the VRAM region instance id. For a tile region it
+ * is the id of the tile, which the uAPI relies on. The pair (binding, id)
+ * must uniquely identify a region.
+ *
+ * Partitioned region:
+ * A tile's VRAM region can be split so that a pool dedicated to some purpose,
+ * e.g. kernel-only, gets a range of its own and the default pool keeps the
+ * rest. The dedicated partition is carved out at the start of the region, at
+ * the lowest addresses, and takes the next free index. The default partition
+ * keeps index 0 and is moved above the dedicated range. A tile without such
+ * a reservation keeps one partition spanning the whole usable range::
+ *
+ *         xe_vram_region "tile0" (VRAM region id 0, binding TILE)
+ *         ,-------------------------------------------------------------.
+ *         | ttm: struct xe_ttm_vram_mgr (one manager, shared)           |
+ *         | .---------------------------------------------------------. |
+ *         | |  partitions[1]            |  partitions[0]              | |
+ *         | |  offset 0                 |  offset pool_size           | |
+ *         | |  size   pool_size         |  size   usable - pool_size  | |
+ *         | `---------------------------------------------------------' |
+ *         `-------------------------------------------------------------'
+ *                  ^                               ^
+ *                  |                               |
+ *             dedicated pool                  general-purpose pool
+ *
+ *         xe_vram_region "tile1" (VRAM region id 1, binding TILE)
+ *         ,-------------------------------------------------------------.
+ *         | ttm: struct xe_ttm_vram_mgr (one manager)                   |
+ *         | .---------------------------------------------------------. |
+ *         | |  partitions[0]                                          | |
+ *         | |  offset 0                                               | |
+ *         | |  size   whole usable range                              | |
+ *         | `---------------------------------------------------------' |
+ *         `-------------------------------------------------------------'
+ *                                     ^
+ *                                     |
+ *                            general-purpose pool
+ *
+ * Device aggregate:
+ * A device-level aggregate region is unrelated to the tile regions. It is
+ * never backed by a resource manager and has no partitions. It only
+ * aggregates the sizes and DPA ranges of every tile for reporting purposes.
+ * Nothing is ever allocated from it::
+ *
+ *         xe_vram_region "device" (VRAM region id 0, binding DEVICE)
+ *         ,-------------------------------------------------------------.
+ *         | ttm:        unused, not backed by any resource manager      |
+ *         | partitions: none, this region is never allocated from       |
+ *         | size:       total VRAM summed across all tiles              |
+ *         `-------------------------------------------------------------'
+ */
+
+/**
+ * struct xe_vram_pool - VRAM range used for a given allocation purpose
+ *
+ * VRAM allocations are placed through this frontend. It identifies an
+ * allocation purpose and resolves it to a TTM placement and the address
+ * range serving it. Whether that range is a whole region of its own - and
+ * thus has its own placement, mapping and address range - or one of several
+ * partitions of a region is a backend detail the allocation paths do not
+ * need to know, see xe_vram_pool_place().
+ *
+ * A pool stays valid for the lifetime of its region and its purpose is fixed
+ * once published.
+ */
+struct xe_vram_pool {
+	/** @region: region this pool belongs to */
+	struct xe_vram_region *region;
+	/**
+	 * @part: TTM partition backing this pool, or NULL until the manager
+	 * is initialized
+	 */
+	struct xe_ttm_vram_mgr_part *part;
+	/** @offset: byte offset of the pool from the start of @region */
+	u64 offset;
+	/** @size: size of the pool in bytes */
+	u64 size;
+	/** @purpose: allocation purpose served by this pool */
+	enum xe_vram_pool_purpose purpose;
+};
+
 /**
  * struct xe_vram_region - memory region structure
  * This is used to describe a memory region in xe
@@ -26,9 +162,11 @@ struct xe_vram_region {
 	/**
 	 * @id: VRAM region instance id
 	 *
-	 * The value should be unique for VRAM region.
+	 * The pair (@binding, @id) must uniquely identify a VRAM region.
 	 */
 	u8 id;
+	/** @binding: VRAM region instance binding */
+	enum xe_vram_binding binding;
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -57,6 +195,25 @@ struct xe_vram_region {
 	 * (e.g stolen mem)
 	 */
 	resource_size_t actual_physical_size;
+	/**
+	 * @partitions: partitions this region is split into
+	 *
+	 * A non-aggregate region initially has @partitions[0] spanning its
+	 * whole usable range. It is the region's default, general-purpose
+	 * pool. An optional split may adjust its range and create another
+	 * partition before the TTM resource manager is initialized.
+	 *
+	 * A device aggregate region has no partitions. Allocation paths do
+	 * not take a region pointer, they take a &xe_vram_pool pointing into
+	 * this array, see the DOC above.
+	 */
+	struct xe_vram_pool partitions[XE_VRAM_MAX_PARTITIONS];
+	/**
+	 * @num_partitions: number of valid entries in @partitions
+	 *
+	 * Zero for a device aggregate region.
+	 */
+	unsigned int num_partitions;
 	/** @mapping: pointer to VRAM mappable space */
 	void __iomem *mapping;
 	/** @ttm: VRAM TTM manager */
-- 
2.34.1

