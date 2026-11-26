Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F233A606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 17:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DZPwlYUr;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=hmYHtBjK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B480A10E42D;
	Thu, 26 Nov 2026 17:59:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EE510E42D
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 17:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795715931; x=1827251931;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=19ThYwR62Gxx1Mx95LkO+q+3wSyvwPcLCW2oBpLE+V4=;
 b=DZPwlYUrua/PWTvyHEQfPcs5mSD1iy6BOGzPDxeX66bK5687IK56scw6
 jx4qeVIZo38Vo44CuEy5yYkBzmp0ECGqmI3iYVBod4kNG7udlgIU7+IEH
 CfLsFCILkucbwfLJBLOQizrKvZymo+aG2XuRVv9gjxJ2f6BG8jV/XAUyU
 9yjY0E0/qG2AwMnAi62k0S724mzsJ4SjkWslf3fQ5TikZ+Wn4KZPbVVO/
 7AhrFuQKIaLq/LMmKJevDcNVcbodCjc7LKXNaBaubP9rRgSU7UmoD7KjX
 kHqmMlM/P9vD79XfnJfn7LzbqcT20aLUOeKtaXGTQCPkBgQW6Jvzbz+d9 Q==;
X-CSE-ConnectionGUID: HTafP6jcTmWSfpSIe60tRA==
X-CSE-MsgGUID: e7blcvDGSPK8eXJxoZJstg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4701735"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4701735"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 09:58:51 -0800
X-CSE-ConnectionGUID: OSCv5++7SCiBIojP8DWpVg==
X-CSE-MsgGUID: eiX7P9ylSdGsP20P5QAowQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12453094"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 09:58:50 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 09:58:50 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 09:58:50 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.71) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 09:58:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2j5PAjbyfE0dQhu6d591pHUB6IaktAn59RWtqwfgevYg/dtWS8Bin+ur6sljuwh9EGbsCT/PAvQbBtfIr8DoE8ux2uQz3zEMmEY+Sti2djlyzGiooJRi1grL9rlKhAMhVdxokltcFrOBjQB/FhYkciAX9jp1ZJRRJavL90rnORFLdfD/HRKBq/hlhf+RJzgkAoTFqjoMOaDDng19p/6sthe1L27yabzz2QrlgJvbotQEDbn7N8a4mYV1mX4+v66cwAhNifcI57XVdd9SBFRY2Lm1msz1GGG0XZSN9MTbBf0cnpklmHKM9J2/7ctdtHX+t/Ith32ws4v7TsqKVZnEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OjNut261Glprt4EeQ3inKF1s7rhKwxlYW9gG43ycvc=;
 b=Rzd9HRAXkEr06lnVkOXii3Yg729PXUyz0CLPkjorxyN67VGaMfjC1KmiytTxSkysGZMnwkfVzb46o/1d9A8ZtlwfyQbv+S0FD2OcXo+Xs2L311EC2fkuUuDNxoKqBPHUgAHJkaddL/l99mjF7TUri96Ku2XhWvMGv92YJrHTaIkbJ2dQrcgEOymFqBRZGuENAF4QJN+gHSBQRGCY2fszlSNDoWj+dHHwAp2HcMe9jFBTK07Fbp9enPyYbLCMkerHfqCkK12uLzbJDXD0MLMyei3InCfJms61i2gq4CNjlYv19UtjBqdDPjCSDeu2BK3sSBZxAE0FZrtLvUfOFPhMXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OjNut261Glprt4EeQ3inKF1s7rhKwxlYW9gG43ycvc=;
 b=hmYHtBjKxUneIVIj8Edl4DzHQnhzb1t9qHVH5I1ydjXcLqnoBvn7UqgJQNby7hzwqylge73x2gN1bK4SUIRQOpnGfXzyjBzoJ14lR/nKaBQ+vr0FsWr0dTQyV/kH+wWqvu2buhlfPfnwozdIXKboKU0nKhe2I1LbDDKkxLDO8dA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by MW4PR11MB6570.namprd11.prod.outlook.com (2603:10b6:303:1e3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 17:58:48 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 17:58:48 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>,
 <tilak.tirumalesh.tangudu@intel.com>, <satyanarayana.k.v.p@intel.com>,
 <piotr.piorkowski@intel.com>, <jesus.narvaez@intel.com>,
 <daniele.ceraolospurio@intel.com>, <stuart.summers@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 0/2] drm/xe: Use MI_SEMAPHORE_WAIT_64 (Wa_16029281913)
In-Reply-To: <20261126090445.1220148-1-tilak.tirumalesh.tangudu@intel.com>
References: <20261126090445.1220148-1-tilak.tirumalesh.tangudu@intel.com>
Date: Thu, 26 Nov 2026 14:58:43 -0300
Message-ID: <87zeuv8ofg.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::8) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|MW4PR11MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: e32da61b-bdbc-464c-9c16-08df4be6eba1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|261102123227099003|261022105027099003|261022075727099003|10067099003|56012099006|11063799006|261026140227099003|260925022911599003|260925021911599003|260925021311599003|261026121527099003|261028144727099003|261021121427099003|261021123027099003|261009223027099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 8w1wURD1j/oP67uOAONCdu0lRqdLhzT9ub2WavXeC29FMv5RRo3a3W08X2ASolVuBpCHb689NjzQiUaHF3Cq1y2xshRYpszLU1gQDK0ouqjj8Rtp14IHQ7jH8rcyVMIX+EKTmIB7Y2B58u2miE+oKptxam6TGVFUgbhXn917Xor3TqWwapLUQBx/l59ZidkKRWeWr/aB/pb3g5D3KgD7/h7mCPYNZ44TGs8xPY+/Xe0dm9pPW0AWnInBMqxiUMVK21b7F+SQW46PPGBPtWRxILBPXx5OUGbn2UUOf6WabGNLhKN/yWFi/Hi5WTWvVma4UN6sBYRbWiTTtp6+zRlQtjEnzMkcxbzDWCcmvep6Sqcmyh+wpEJZ01n/6tbOEHN9Mi1s95xdAOq/UB5aTaEFkWJHDXbq1ylVYajpOzmSucnUVRQFisuXFMajbbdPeawJGLYyizwHxvJ8blpe5WNlq+E/FVJq7TBijc64QKYJFmKitVh1m5YWN74iQtNj/cbPHLZxgqXNAYk0jEi5YXPV4BcbF76/RF7CpP+Ax2okYjNsJGXQvOrnjDZ3YQmM1Sp2kN/Vt+n4ozvjR79tTblkUzphx2ImZj3Vem3OfkBIn8yZP1Ys02wI07R9I3J/JpHM08Bai7+Bw/qhj+WXnKk0fxHqadykd6OJXBSIPoC7/bo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(261102123227099003)(261022105027099003)(261022075727099003)(10067099003)(56012099006)(11063799006)(261026140227099003)(260925022911599003)(260925021911599003)(260925021311599003)(261026121527099003)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D6gWBua+YseLYCCGSS30kyfhq/BJspWPRq9gTPhm8Gf8cTYC6ufoeJwTZLio?=
 =?us-ascii?Q?NkIhAuhWOJfM1eECpzcB0m0IrPmjVXfRjj4SX9dYli9oMsH+ba/d2Pj+5X85?=
 =?us-ascii?Q?hCcNre/c0YugXUSM/zBZiWxE7zfosZCssmWtp/tMtEKZ6sTHbdZKvKShuAON?=
 =?us-ascii?Q?cs7XOlELZxlVKxAHx4szM5SzMejKNi7ldOIVYdBnnNlooq1qDh4B6mIEP8mw?=
 =?us-ascii?Q?iFhAijUl4QUuqIHipPtFixL6wkq9X9PvHLYQuAZ2n9EP/Q7HqUCl/BfV/Ieo?=
 =?us-ascii?Q?Ao4PzAC4dibLIuqYxvj0WDX0tOm0d0qgCgomccbt0cmc9sWNNGmUorkdU0Ee?=
 =?us-ascii?Q?b9EFFj8ubi6B4RTxU77b4mz2++rR0sNX8UgKsN+X+WEXfI30e+kRxXzKUgG+?=
 =?us-ascii?Q?KCr4M1lSCFW+fdGOwGvAyFww8oXRldj8Txsb+uUQmKl9eyi0TNOP2O1AHIcc?=
 =?us-ascii?Q?F06nk7tfEs4bGR+vSAIHN+zJbEjmv/gx5dINwxK+1zAWhbAWpifnY2vOGDKK?=
 =?us-ascii?Q?fQOFt11Bk0KUlaCwFKBhD68Gv9I2Owu6Gbc8k38/O3+nVUyvot+s2hpXS3+U?=
 =?us-ascii?Q?Zp0hPw81HDXp2lKkuG69b5GRafRPceBhO0Pa3V6XlEozfpgSCPhGHvyLMyYx?=
 =?us-ascii?Q?PnO3BcnmzwSk2q+CB7H9gl49NW8/vZZa7bEzjy6Ej9azc7/Vxf1T4Xkcvi1i?=
 =?us-ascii?Q?WVTQkMwOLxt7RcUAqDP0c5HW0cazaiAevqwO5IBlAfPZh/FBT6w5ogSdpfEY?=
 =?us-ascii?Q?EUgnJHzKWqKGi9A6mlJaM7O5OxNkqQ+IvIus+SnTxsGoeU2/QMkxokN+QJtk?=
 =?us-ascii?Q?cZXnPsvesC73McQsC9M4CYlElQ0e2FSEsrmog9DKp7D0/MQWG4af2lnvSxqY?=
 =?us-ascii?Q?9yBphJc+Q9SGYukkSTT9Tr0X02pdIVIZNpQ0z9Q+9v3Bf8wc5P4qFP6X2FwN?=
 =?us-ascii?Q?i38Dyqbsp4Wtz+YaT8FbCM3UcxQTNyPhy/VA4F3DtYKOBkCwEPW7ZPTob39+?=
 =?us-ascii?Q?cXjseMILnzWosA1WN4/5/t8l71GVFwzYijlvoHswo99xJ8g2+Wy9/of+46cM?=
 =?us-ascii?Q?oAlrhD/6uaJ6zovdAJiZDRHDRhGtBaRHRyl4LHcpP0yb5FaKcXGaVrG7qpMJ?=
 =?us-ascii?Q?5l9+/GdlnhLpjZA7p/0VkjL6Azv3Fgh5tnsngbU4/PmK7OznJt2+nIb/xYtp?=
 =?us-ascii?Q?NLnidqZB9g7l/Qe9wVMfgu9aQlvditY+TxLXLhdIOoFylWJYzDavWro4S3hq?=
 =?us-ascii?Q?+IzZCtzL2ORtI+566vsrXpLUHJvhHuJJycWXGA3MLMG2FxjbsRgl9pBt/49p?=
 =?us-ascii?Q?zRc7ct7gmNbNvSkDDNLMKWvjIgs9ct/jGnHGMyLasanVr0VetovC1AUmdtMC?=
 =?us-ascii?Q?YOTWJAuxFDrRecpon6NdrHfF814rf+GK+OQAhD9doDQtiADzw+AiSWl/HK3K?=
 =?us-ascii?Q?k9LzoH+ro0HnupvEFYEcH/v46kdyvvn8ggczsN6ixvYruvDNaLdaINkedS44?=
 =?us-ascii?Q?C/+uhozIgW2O2uwFmhSPnOjSaY03M22eYtnjzFNy9QLpAxOqWdE/bSC8PcmL?=
 =?us-ascii?Q?3AfbqTwc7q7ti0uwD+PR2TB2RTtEu1s/zD0TObTuy/ijGVuF2nLcupHJJMTx?=
 =?us-ascii?Q?9qw36G+vUwe/n3fOZ1C6j0mKmkCA7knQAKwTScaE2V7eE5xs5Ji4HOGST0PP?=
 =?us-ascii?Q?7b54Mq2J/VrU64Pw75wANb1uRH+3PAcDExx9K91ZaGAx6GWvH5MyXJ6ILeQo?=
 =?us-ascii?Q?ru0FcFFbgQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: Uhc5HKvXyKekSJDJpbAtllgYrjyaLR10WQXf77ZhTlBJG659B/qprv1miN8epkXgd8wFQFIE/7OnqrXrL5cWbViPmGBkyPgyTp1+kleCnn9W0uhZz2kNUPEKRDqRrC/bR0xvtRjTOzcKIKT0omqYPQYDpJ506nSbYhZHvd+WIc1RCJRlKUXNZ3Y7BSbZ1fnB+F2ZPbiqEsYAWpzVyvpJlP1D12nu8RvLc1V5fIY6WU2nnxbPdf4V5OGW9IkkpoYSYb6LFgZvMj2azbmJu8f98aQKa4V8uCHs9YuGIXfPFxRWVLO0ekNkc2uwiLvVmd3aNTbALdri/5yYWPGfu9ry9A==
X-MS-Exchange-CrossTenant-Network-Message-Id: e32da61b-bdbc-464c-9c16-08df4be6eba1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 17:58:48.2408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N3/JfXy/+Ffq5SIDsO5i50nFfRxXPRQt2fEk+Tyq3hhjmXSiNaW4XroimeIrUH1QZ0sYt2uu1/mQ8ExBxKbYRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6570
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

tilak.tirumalesh.tangudu@intel.com writes:

> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
> Wa_16029281913: MI_SEMAPHORE_WAIT has an issue on some Xe3p platforms.
> The recommendation is to use the 64-bit MI_SEMAPHORE_WAIT_64 instruction
> instead wherever the GT supports it.
>
> The has_sem64 capability bit this relies on has already been merged, so
> this series now carries the instruction definition and its first user.
>
> Patch 1 adds the MI_SEMAPHORE_WAIT_64 instruction definition.
>
> Patch 2 switches emit_fake_watchdog() over to MI_SEMAPHORE_WAIT_64 on
> platforms that support it, falling back to the existing 32-bit
> MI_SEMAPHORE_WAIT otherwise.
>
> The ULLS postamble conversion, which only applies to dGFX platforms
> with USM support, moves to a separate series, together with a debug
> assert that catches MI_SEMAPHORE_WAIT being used on a GT with
> has_sem64.
>
> Testing status: patch 2 (fake watchdog) has been tested.

Considering that the legacy and new instructions can't be mixed, before
we apply this, do we have ack from UMDs that this change is good to go?

--
Gustavo Sousa

>
> v2:
> - Patch 1: Only compare has_sem64 when both GTs are present (Daniele)
> - Patch 2: Rename to MI_SEMW64_32BIT_COMPARE to fix alignment (Satya)
> - Patches 3 and 4: Drop the WA comment, document the zero upper SDD
>   dword (Satya)
>
> v3:
> - Drop the has_sem64 patch, it has been merged
> - Patch 1 (was 2): Drop the WA comment (Satya)
> - Move the ULLS postamble patch to a separate series, together with a
>   new assert for MI_SEMAPHORE_WAIT users
>
> Tangudu Tilak Tirumalesh (2):
>   drm/xe: Add MI_SEMAPHORE_WAIT_64 instruction definition
>   drm/xe: Use MI_SEMAPHORE_WAIT_64 for fake watchdog where supported
>
>  .../gpu/drm/xe/instructions/xe_mi_commands.h  |  5 ++++
>  drivers/gpu/drm/xe/xe_ring_ops.c              | 23 +++++++++++++++----
>  2 files changed, 23 insertions(+), 5 deletions(-)
>
> -- 
> 2.46.0
