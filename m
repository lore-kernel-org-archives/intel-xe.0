Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4170F55422
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 22:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E0810E679;
	Tue, 24 Feb 2026 22:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mM5/G9LZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BDE10E679
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 22:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771973877; x=1803509877;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1nN+V4im0Wpz7HkB5bQZbcJCtTIvkFvBbZpVYbmdi9k=;
 b=mM5/G9LZZIrTRnVIhs2aragEOSsuYtrpJcD+op0o5CjJxT5eFfs0f5hE
 ojdvNurt0TRBbvdjdlkruVU+s1NpD4L1lGwJIOuBSU0vbrLZEdnoqghSL
 vsB3HPgLO1VXTwerpZmCKDFKqCbqRHFFyaO1gsxeN1qdBB1nHEQuu9hpi
 5Q8ip8lcQOIdxvfQex/ovWYNsszCs4bY9QqEmKaarQr2uc/o8uAxwJEP3
 9ERAnwnpoQF5MTSQrKmsvJ5CBnQqLntzmQfMoMmTi1FQ3LnT9e1A3wBhC
 NIN1TsFlk/cExXdfM6mcWMcwu83Q3DMD3Q18cLFfQ8s0dSg09Lszh93Xs w==;
X-CSE-ConnectionGUID: i3O80V71Rg+az9AsJsNEsw==
X-CSE-MsgGUID: KsFW0oBHTWmTDywqGqdreQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72707206"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="72707206"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 14:57:57 -0800
X-CSE-ConnectionGUID: yjD+pfOsRAiBhxjno/Ofrg==
X-CSE-MsgGUID: h/MvIMqyR/y/aL7twNN5Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="215279472"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 14:57:56 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 14:57:56 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 14:57:56 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.16) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 14:57:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ov2fN8LdUS3dHLts4ZHIuAjQz3uB/PInmO4WeNYCMJRL7/C0neOpDO/inixTuGFV0bKNM4mCikSfIPSfaP8m8oExLy20M3q6RbPUOSJxz+732/EOmWehYdmzIH2+NopJgHor+8ov9Md0B7KFPeB+XjJ0XHrkOkZYqVa8TVkKS8w939+KD6k2667N/nZ+pXHujhadS/T3btVDMoWqTeQPgg3Km16m1BxBMbgIw7DXDq8kr/wZjUH/+uIMc+lCApUHQc0JUg+W5s8xsHuPP3LlWoGZA++6Q/BsM/GrAvVghIVX6+QxjB4K3CunTfcpB7Z5bh4fSA49r3i9zEkDIgnrtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69hi7St9oiwZyzG4/imFp1ykvO1MTHWrLBlFBIMhjkA=;
 b=d+RBJ5QaYwkmYX3rV7/b5Q49kogts31m0r98xeisXSa2Mr6TI7nLQTZAoTjOJE9npJckGASF/GG7ZuNRdlXxYIdjxttTQZWcQ4uuYzypHYdHtS1ipUs9pSTaMqsbRMmP1ypRgoBcU18tx6Yty+0PfRrDQxZPRSMEbPBIOYwLTkYPRyi4UOf0bWeT0p48d/ckstH8Qt2In1YcsS6tbq78LZm5+QC6pk0biLoTEJmA7G2Hb+fZ7NsGq8CX8qp2nsB3GGoZ+2kc2gPZ6HoCRxDHmyTtuSqM891FnycmtoExhLbUfnD03851sm00TRJiBYZbIIfHIQYVpicPEEjY+rp7EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by MW4PR11MB8289.namprd11.prod.outlook.com (2603:10b6:303:1e8::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 22:57:50 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:57:50 +0000
Message-ID: <c814ab36-0861-43c4-924e-4a6cdaa11376@intel.com>
Date: Tue, 24 Feb 2026 14:57:48 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe: restrict multi-lrc to VCS/VECS engines
To: Matthew Brost <matthew.brost@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Shuicheng Lin <shuicheng.lin@intel.com>
References: <20260224023354.182306-1-x.wang@intel.com>
 <20260224220548.GL4694@mdroper-desk1.amr.corp.intel.com>
 <c42a6636-c639-4c4c-93a7-3755baf351bf@intel.com>
 <aZ4o4/T7BiPP3TeC@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <aZ4o4/T7BiPP3TeC@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::46) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|MW4PR11MB8289:EE_
X-MS-Office365-Filtering-Correlation-Id: fe1e3925-189a-4221-3f07-08de73f822d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|42112799006|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFRmMG9UQlV1eVVRdnVNNFVqK3lrY0wrMXhrL205eDV6eDVWc0FibGJYS1dr?=
 =?utf-8?B?OC9KeExCY2FnU1U3ZTdVcjRuMzZpU0ZiMjNoL1AxSkVjZ1BmSXBvbkhOMjZJ?=
 =?utf-8?B?Ky9zcXh2VU4wNXlHUmY2K2hZa3BDNnJBcG03bHFOcTJybHdGZmlXZHByMmpp?=
 =?utf-8?B?RVZjcjFIR1VNRkdRSWtvbnlFRExNRS9qN1kwNDA3UERaaVB1ejFta2FaRVJ6?=
 =?utf-8?B?Q0RXV2wwT3pBaE1tQ1UxakV5Qjd2Ui9CdVRYbDNHOWxvaVJ1aUkyVERSOXNl?=
 =?utf-8?B?MGFOOGxWdVlOWGFoL2cxRXY3ekJ6L3hpeksyRDByNWFrZGhEWFhRK0FCWUNO?=
 =?utf-8?B?Q3RtTEo4dHIvNHkxUTdmMkF6K0l0U3d5Qnh2QVpZYzdpM2prWkdxN09BZDY1?=
 =?utf-8?B?aVVYTEJ5eENzUVNISWM5aWlSaE5YaEJDZllld1ZDZ0YzZFFSaCtiUW5hQ1R5?=
 =?utf-8?B?ZWZuazAzNVpvU1BZM3p2UUVxeWx5UE5KUVFBTlB5d0d6Z0lzL0hkM3ZnaU1V?=
 =?utf-8?B?d1loaXN6a2x6NzZ0OWorTGRjTmx3eTI0M2x4azFFZmtza0JvSUtUZ09jSkds?=
 =?utf-8?B?S0ZpcEFFVFdJZ1ZzUmtBZk1lV3FyajhZREI3WXdKeHpHK3ZjYk1DVUh5MHJW?=
 =?utf-8?B?OHZYU0JxOHZlb0NwQzBZWkVlamVib3AxYnBUdGx6NlZTVmFpVHdrQ1dIQnRM?=
 =?utf-8?B?dS9iTXpoZ21Rbk9VZ2tHbmdYQ2hObWljcGNLejI3M3lybDJRamtBTGk4RHBW?=
 =?utf-8?B?ZzhzNXRlNDljSUhPeHVNOWx5OFphcmpaaGZsQXFGQ0ZwSjRVVVI2b05HcWVq?=
 =?utf-8?B?VnRwQ2lBemIvWnRCdUE0K2JVMHNmWGVmUTZDQnZxY3FkTVJpUWtJNXNRa1lD?=
 =?utf-8?B?TlZ1U2lGbXFVOTNzNFVHMmt5OHdwZFdUMEtCU09WbVBZMURSSE5uWXFHMllC?=
 =?utf-8?B?ODMxaWdheVVIdDhGZDNHWVpEM3RaSStCZEJRcmhiWlp6NlBUaGxhYkhqTUhZ?=
 =?utf-8?B?MXpIZCtwbklCVkN2OVNRR2pTZXpnMEg0MGRnS3o1YmU4TjFLOXA2a0QyUlNF?=
 =?utf-8?B?S1ZIQUZ4Um45VHNXUVZRSVNnZ212V2FBeE9TRGFqNTdmbmI0N1Npam1OQk5X?=
 =?utf-8?B?YTBGTkJudlN2THFiRG1QZjVoY2tWcTRhVFMyMjFFWStPS0xyNGNyZHhmeXhp?=
 =?utf-8?B?SUFYWXBSc2NsaERRMENldWlYS1FWeFBNU3N5aXpFdFJ5LzFmNUxZOEVmdDVn?=
 =?utf-8?B?dklVdEora1NWbWJ5UWFBWWxRQlRydmFqYjE2TVBEVEdWaVdYVmI4SGxyVDNH?=
 =?utf-8?B?QWQzWDFKSXY0SE8xRDcxMGxGVTFlQURSYldZYXVkNDA1d0ZxcVQra1hLSlRY?=
 =?utf-8?B?ak5VMkdZZkl2WTloNmdMQkxvbHdhakdXaTdSenBkWWhkMU12T2YwNG16S2Zz?=
 =?utf-8?B?blZFSjcyZE53dFBmZzFKWGNOZFZCRzNzU2Q5Qnp4UDB3dDZQSjlSckc1WTFL?=
 =?utf-8?B?T3Rsem05amVTK1FNMnlGd21qTXY0KzF1T1dzWXdMbWE4ZDdzTlRSaUxVRVda?=
 =?utf-8?B?MEJHdG9kNG9QWW5PaVlTdWhrUG5STHR1eUZHWVo2bWpNb2dURG5pR2p3SkdN?=
 =?utf-8?B?cVd2ZjVQMEdScUo3dzVKUVd1MXdZYnNaVkxwbWduLzZqOEt2dE40V3d4Lzdl?=
 =?utf-8?B?OEEwQWV5TGd6MXhuTVlWNWVWeWhsSEpRd25Ba0JidjJid3k5ckhnQnE2S2Vo?=
 =?utf-8?B?cHRWb0VZQjhXVit1UUpuT1dlb3NzRTQwZ0s2bFRDOC9DbDFyR1JIWkpsK2Ew?=
 =?utf-8?B?ZUVHc2J4UG5yK29BbVpReFNGbG1oeGNBOUJhelY4NG9GSDc3YXNjUVNURHVL?=
 =?utf-8?B?RXVacUdKa0RidHdWL0NyYzhzSEdXRVRxWUJaN3FGc3BUaHFHUzgvd1QrTTNC?=
 =?utf-8?B?V3dkbVhzUlUyUVdncjR5d0ZTanhTV3F0VWRFTTB2VE9XdktRcFVTUS9SY2ZW?=
 =?utf-8?B?VVphcVNDUnRHL3BJYWlXb2tZaEF4VnNOSS9RSG5WU0REbWc3VVhRK0VBUjlJ?=
 =?utf-8?B?MG5rckMvdHdnUDhBMEhuOE4xZno5ZlhTblNHZUpUOExoeVRtRmdncFdCUjBN?=
 =?utf-8?Q?mPYM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGswUDQvdGdzUUhmWGVwSUhQRVJ3Qnc1S3ZsendueFNCeGN4QnhQWWpoTmNB?=
 =?utf-8?B?TWQxcHBtWlp6bzdBejIzZWtsSWo3a3Zwc0NpeU1oUnUzaWFlaWh1RCtpcnNz?=
 =?utf-8?B?bjZuVjFZdUw0RWY4MHNtSG1sRmhvdUdGaUZnQXk2MTEydVRGS2I3YytSNmRo?=
 =?utf-8?B?OTNZZ2IrNDNOaHZBRklDQW9hRXZKTHVuRXI3UFBiVjBFeDk2dTFCVG5PSjRm?=
 =?utf-8?B?cGl6TENENnl2WXJwTG5Kbk4wQ0hGWVhMdUgreDgzTllmT2NuZElsZUNUaTRK?=
 =?utf-8?B?R0dFblZhRVBoenRTakQ0N2J2eVhETFduOUJEeDlDekI2dnBvdWN0NFRadkg0?=
 =?utf-8?B?QUFkb3d2ZDdmOG1oVmFuSzZFVHM2YlJucWoySkxrUFMvVWtBdWlDMWdzYTg2?=
 =?utf-8?B?WmU4ZXBrTzZibGJRZDhUZWU1UU50S0VFZnZGZUF5MWNiVXhwSVFLZjNadXgr?=
 =?utf-8?B?WllNL1ZadmxPdWg4cDlpUkFud3lUYVllNE03RVFWemd4VEZ6NWtuQjdTUEdo?=
 =?utf-8?B?bjJucDZ6SjRoOVdxYmE3SVBBUEhGZEtwblV3V1Y4Wjl4UjdvWjVWMG1rOWsx?=
 =?utf-8?B?bnk2emlJcnM0T2I2OCtCREE5RGhsK3lSNm1hTXUvQk1jZFYwZk52VG1leTBZ?=
 =?utf-8?B?Q0FwMVNhc2FHZEFzOERPN0dmV1B5ODRJUmJLNElObmh3Z3FzL3ZyNVJnSGZU?=
 =?utf-8?B?OVRUWGhxT1UrQWhZVDA5OEZXNXZmSVNCY2Q5bjd3bm51QzJEVUpLL2pYclNC?=
 =?utf-8?B?RWNrMWZOTUxVY1N3eE5sck5OSG5CTHZpQVQzOTRTeVQzUU9nNy9wNXlpV0F1?=
 =?utf-8?B?SXJBZXlzNDlBUm5JTDhOZFpIWFdCTzltQlJ1V3ZjdlV3dnVac0paK0FKNWR5?=
 =?utf-8?B?UmZMaEc5bStiWks4THZtR1VDamhzVUFvMFdoVkFWTEFqOTFOa0ZGTFZzTjF1?=
 =?utf-8?B?YnJyWVFTbVNZUjBsK1RDR2ZGT3dXL0s5TTJvTVlVbnFKdG9Ga2FRcmcybFox?=
 =?utf-8?B?Y0JmVWluUlRTS3AzZUZjRUtHSXJhbHRGaVZhMlFFWFNESWxrV09vNHBQZ3hs?=
 =?utf-8?B?RGEvWTN5ZENwSlk1SGlLT05ZMENubVA1dFhBVE54N0hjNkJrS3oxWFVYTTJV?=
 =?utf-8?B?TjZKeFNxRG5qVEs0RmE2SC9DTmdFMGNna1pacW9sZzRrRWhONytqdE83d0VJ?=
 =?utf-8?B?ak56c3ZVTmdCNXFUcm5MNEVtVVBTallKSDJ2ZUVidmZMandtVURRM2dnNjR4?=
 =?utf-8?B?OGJFdlo2V0RQd3hKY0RSTEgwOENEWlc3VlU3SEJzSFVjSXVFNyszY2ROWlVl?=
 =?utf-8?B?UlN6enBld2p4TXR3ZDlJOXh5NFVZRnRLeDlOYjBqWEZrNmJsSlhsZ2FXZUpJ?=
 =?utf-8?B?d2R5eHpyVmZDSXZmMC9vMDZMVWxHUUczeEp5UTRaVnl0a0RteHlNaFlyQTZw?=
 =?utf-8?B?L21DU0FwcWtZYXdBM3VkK1o2ZFJMcmJSalJoRU51Wk9rRjhIYTUxeEFQbjVK?=
 =?utf-8?B?UkpNYngyZGhtbko2ejRpaEVwaE5oSXdKZlFGNFhxZlhSL1ZjTnZRekRCYWdS?=
 =?utf-8?B?emlSdE1ETFpXQ3FHdElCY3dkTXNCbHlKS2FENzd0aHozeGlodktyaGptU2hT?=
 =?utf-8?B?UXdCOU01SWJqbEVXTTQ5TzhzNkQyNitUdTJyV0RwN0IvTGNDdXB5OGJ0WVV0?=
 =?utf-8?B?dnlyOXFSa1ZLZG1YQjJmNWN5c24rSlY1dkxNa3BXbURIV1g3SjNsSUI1K1lB?=
 =?utf-8?B?cFhTMEpXNkhncndzWlVuY3VVNlFkOU4vV2N6dG9sNDdWZ21mS2hPTURhNDI0?=
 =?utf-8?B?dC9LcnV3NlBOUWNJdUJha1NqOE93a0hJY3RLQ1JvcXAzdjg5RVg0RDl2a1k2?=
 =?utf-8?B?U3VLTkYvdTQwaDdnZUVSWTB1c3BLN2Z4aDBvL0lzSnBYWCtBK2hMc081WXhw?=
 =?utf-8?B?QVRpeVZPbW8rVkdWWDBCMDYram9LSGNBUEltQU41TW0yVldEYlZhOCt6N25E?=
 =?utf-8?B?OUl0UlpnQmlzdkdwaUdvWHhJcHViTlBrbkcveTIxcjQzTGVaazQzakJTemRM?=
 =?utf-8?B?dHNTeEd3U2E3TDNEZ1dhZm1XOGpFSzZ6NlkwZ1ppcFM2dzFBSTcwOFYxam5r?=
 =?utf-8?B?cDdvZlJWM3dINlArYlZ3dmxlQ1ZUSEg0UWxQdTNYV0dTZXpDUTRDbVV0MUNx?=
 =?utf-8?B?RGdIQVVJYmNzNm1hbCtWTWwzbkp6MWVKYU02YWwvS3NKaXk1RjVWUkJtTDQ5?=
 =?utf-8?B?TXRGK1BybHBzMG41ZnNFUWRiNDdtblJQZWdGUkh2SVFqN25pTzZkSFNGWTky?=
 =?utf-8?B?QUdNbTB1OGV5UkluRmpJV25KTmZPRzk3azlIdmgzOHRNY0sxVVVNUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe1e3925-189a-4221-3f07-08de73f822d5
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:57:50.7785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqBMGAHYyKin9EuJ2esPOf4mVSMHu2fP3o8OevnnVcXRh7+bkJhLkiKtZuWzsmz5NSTCuQIbIt09rucFSxymcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8289
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


On 2/24/2026 14:40, Matthew Brost wrote:
> On Tue, Feb 24, 2026 at 02:20:33PM -0800, Wang, X wrote:
>> On 2/24/2026 14:05, Matt Roper wrote:
>>> On Mon, Feb 23, 2026 at 06:33:54PM -0800, Xin Wang wrote:
>>>> Tighten uapi validation to restrict multi-lrc support to VIDEO_DECODE and
>>>> VIDEO_ENHANCE engines only. This check should have been in place from the
>>>> start, as the driver typically avoids allowing uapi cases that we have
>>>> no userspace consumer for.
>>>>
>>>> Additionally, the GuC firmware on ModSched platforms no longer supports
>>>> multi-lrc on non-media engines.
>>>>
>>>> V3:
>>>>    - store a multi-lrc enable class mask in xe->info and populate from
>>>>      xe_device_desc in xe_pci.c (Matthew Brost)
>>>>
>>>> V2:
>>>>    - correct the typo (Shuicheng)
>>>>    - move the check earlier to avoid VM lookup (Shuicheng, Matt Roper)
>>>>    - remove the graphics version check (Matt Roper)
>>>>    - input more details in the commit info (Matt Roper)
>>>>
>>>> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Signed-off-by: Xin Wang <x.wang@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>>>>    drivers/gpu/drm/xe/xe_exec_queue.c   |  5 +++++
>>>>    drivers/gpu/drm/xe/xe_pci.c          | 17 +++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
>>>>    4 files changed, 25 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>>> index 8f3ef836541e..caa8f34a6744 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>> @@ -138,6 +138,8 @@ struct xe_device {
>>>>    		u8 tile_count;
>>>>    		/** @info.max_gt_per_tile: Number of GT IDs allocated to each tile */
>>>>    		u8 max_gt_per_tile;
>>>> +		/** @info.multi_lrc_mask: bitmask of engine classes which support multi-lrc */
>>>> +		u8 multi_lrc_mask;
>>>>    		/** @info.gt_count: Total number of GTs for entire device */
>>>>    		u8 gt_count;
>>>>    		/** @info.vm_max_level: Max VM level */
>>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>>> index 66d0e10ee2c4..5abb29454d1f 100644
>>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>>> @@ -1184,6 +1184,11 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>>>    		if (XE_IOCTL_DBG(xe, !hwe))
>>>>    			return -EINVAL;
>>>> +		/* multi-lrc is only supported on select engine classes */
>>>> +		if (XE_IOCTL_DBG(xe, args->width > 1 &&
>>>> +				 !(xe->info.multi_lrc_mask & BIT(hwe->class))))
>>>> +			return -EOPNOTSUPP;
>>>> +
>>>>    		vm = xe_vm_lookup(xef, args->vm_id);
>>>>    		if (XE_IOCTL_DBG(xe, !vm))
>>>>    			return -ENOENT;
>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>>> index e1f569235d8a..fe63387d4077 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>> @@ -194,6 +194,7 @@ static const struct xe_device_desc tgl_desc = {
>>>>    	.has_llc = true,
>>>>    	.has_sriov = true,
>>>>    	.max_gt_per_tile = 1,
>>>> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
>>> Is there a reason why some platforms list both VCS + VECS but others
>>> only list VCS?  The new .multi_lrc_mask is intended to restrict usage to
>>> just the engine type(s) where we have a real userspace consumer, and for
>>> now I'd expect that to be the same across all current platforms.  We
> Matt R beat me to this suggestion too, +1.
>
>>> should double check whether the media driver is actively using this on
>>> both media engine types or just one of them (I don't know off the top of
>>> my head), and then set the mask accordingly.
>>>
>>> An ioctl request for multi-LRC might also get rejected on a platform if
>>> the engine fusing indicates that there aren't 2+ engines of the given
>>> type, but that's an orthogonal check that's independent of the
>>> multi_lrc_mask we're defining here.  Finding out how many engines
>>> actually exist on a device is something that we can only find out at
>>> runtime after reading the fuse registers for a specific device.
>>>
>>>
>>> Matt
>> I checked the specs and found that some devices have fewer than two VCS or
>> VCES
>> instances. In these cases, I don't think it's necessary to allow multi-LRC
>> to
>> those engines. This would prevent the injection of some illegal ioctl
>> parameters.
> See Matt's response above, we check in the IOCTL how many engines the
> platform has, if it only has 1 the IOCTL will prevent multi-LRC queue
> from being created.
>
> So again, I'd just enable XE_ENGINE_CLASS_VIDEO_DECODE |
> XE_ENGINE_CLASS_VIDEO_ENHANCE on platforms.
>
> Matt
This means we can enable the VCS/VECS multi-lrc on all platforms without
considering the number of engines. I can create a macro definition and add
it to all current platforms.

#define MULTI_LRC_MASK \
         .multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) | \
BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE)

My understanding is that the advantage of adding a mask for each platform
is that if we need to support multi-LRC for more engines in the future,
we can simply modify the platform's xe_device_desc without changing the
code logic.
Xin
>> Xin
>>>>    	.require_force_probe = true,
>>>>    	.va_bits = 48,
>>>>    	.vm_max_level = 3,
>>>> @@ -208,6 +209,7 @@ static const struct xe_device_desc rkl_desc = {
>>>>    	.has_display = true,
>>>>    	.has_llc = true,
>>>>    	.max_gt_per_tile = 1,
>>>> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
>>>>    	.require_force_probe = true,
>>>>    	.va_bits = 48,
>>>>    	.vm_max_level = 3,
>>>> @@ -225,6 +227,7 @@ static const struct xe_device_desc adl_s_desc = {
>>>>    	.has_llc = true,
>>>>    	.has_sriov = true,
>>>>    	.max_gt_per_tile = 1,
>>>> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
>>>>    	.require_force_probe = true,
>>>>    	.subplatforms = (const struct xe_subplatform_desc[]) {
>>>>    		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
>>>> @@ -246,6 +249,7 @@ static const struct xe_device_desc adl_p_desc = {
>>>>    	.has_llc = true,
>>>>    	.has_sriov = true,
>>>>    	.max_gt_per_tile = 1,
>>>> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
>>>>    	.require_force_probe = true,
>>>>    	.subplatforms = (const struct xe_subplatform_desc[]) {
>>>>    		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
>>>> @@ -283,6 +287,7 @@ static const struct xe_device_desc dg1_desc = {
>>>>    	.has_gsc_nvm = 1,
>>>>    	.has_heci_gscfi = 1,
>>>>    	.max_gt_per_tile = 1,
>>>> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
>>>>    	.require_force_probe = true,
>>>>    	.va_bits = 48,
>>>>    	.vm_max_level = 3,
>>>> @@ -313,6 +318,8 @@ static const struct xe_device_desc ats_m_desc = {
>>>>    	.pre_gmdid_media_ip = &media_ip_xehpm,
>>>>    	.dma_mask_size = 46,
>>>>    	.max_gt_per_tile = 1,
>>>> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
>>>> +			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
>>>>    	.require_force_probe = true,
>>>>    	DG2_FEATURES,
>>>> @@ -325,6 +332,8 @@ static const struct xe_device_desc dg2_desc = {
>>>>    	.pre_gmdid_media_ip = &media_ip_xehpm,
>>>>    	.dma_mask_size = 46,
>>>>    	.max_gt_per_tile = 1,
>>>> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
>>>> +			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
>>>>    	.require_force_probe = true,
>>>>    	DG2_FEATURES,
>>>> @@ -358,6 +367,7 @@ static const struct xe_device_desc mtl_desc = {
>>>>    	.has_display = true,
>>>>    	.has_pxp = true,
>>>>    	.max_gt_per_tile = 2,
>>>> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
>>>>    	.va_bits = 48,
>>>>    	.vm_max_level = 3,
>>>>    };
>>>> @@ -393,6 +403,8 @@ static const struct xe_device_desc bmg_desc = {
>>>>    	.has_soc_remapper_telem = true,
>>>>    	.has_sriov = true,
>>>>    	.max_gt_per_tile = 2,
>>>> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
>>>> +			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
>>>>    	.needs_scratch = true,
>>>>    	.subplatforms = (const struct xe_subplatform_desc[]) {
>>>>    		{ XE_SUBPLATFORM_BATTLEMAGE_G21, "G21", bmg_g21_ids },
>>>> @@ -445,6 +457,8 @@ static const struct xe_device_desc cri_desc = {
>>>>    	.has_soc_remapper_telem = true,
>>>>    	.has_sriov = true,
>>>>    	.max_gt_per_tile = 2,
>>>> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
>>>> +			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
>>>>    	.require_force_probe = true,
>>>>    	.va_bits = 57,
>>>>    	.vm_max_level = 4,
>>>> @@ -459,6 +473,8 @@ static const struct xe_device_desc nvlp_desc = {
>>>>    	.has_page_reclaim_hw_assist = true,
>>>>    	.has_pre_prod_wa = true,
>>>>    	.max_gt_per_tile = 2,
>>>> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
>>>> +			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
>>>>    	.require_force_probe = true,
>>>>    	.va_bits = 48,
>>>>    	.vm_max_level = 4,
>>>> @@ -746,6 +762,7 @@ static int xe_info_init_early(struct xe_device *xe,
>>>>    	xe->info.skip_pcode = desc->skip_pcode;
>>>>    	xe->info.needs_scratch = desc->needs_scratch;
>>>>    	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
>>>> +	xe->info.multi_lrc_mask = desc->multi_lrc_mask;
>>>>    	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>>>>    				 xe_modparam.probe_display &&
>>>> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>>>> index 470d31a1f0d6..47e8a1552c2b 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pci_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
>>>> @@ -30,6 +30,7 @@ struct xe_device_desc {
>>>>    	u8 dma_mask_size;
>>>>    	u8 max_remote_tiles:2;
>>>>    	u8 max_gt_per_tile:2;
>>>> +	u8 multi_lrc_mask;
>>>>    	u8 va_bits;
>>>>    	u8 vm_max_level;
>>>>    	u8 vram_flags;
>>>> -- 
>>>> 2.43.0
>>>>
