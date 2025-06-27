Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC797C7EE31
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 10:03:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790CB10E9B0;
	Fri, 27 Jun 2025 10:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pwvqxfcn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA9310E9B0
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 10:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751018608; x=1782554608;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zT4rSB5dAWJuucPyP+/tWshWqZVajtrGyu2yQtx51GQ=;
 b=PwvqxfcnmEAR4Qg1lM0fBRci9glesE4pnk3yHE3n4YAlEqBYpFWSp/rx
 7E2Rn0+a4QblTBYNWJt0Bwk7fE6jQ2OrwUw0EVNFnp6oBB3GBDtfhdkA2
 lInlUMnpw2qKuKNz2SqbAh2Y16HM51i2q4zh/HKIA1yNMo8oZc7gL0YhV
 cmjmJF8W7vPi+Qv7UocO9xp20R3RszDjQ1lkd1LU1sPnF3z/knZezs4Tm
 rfZUkbT4i07MJSmbXpepVi/2Vx5pUFP7X8gjM2kDefIylqL0FUAFDeeIv
 eK9wtELFTP0dgQCY1LL4aEPi/mzLDBTusSpNG3WX5r48wNsneQ1ddUPzF Q==;
X-CSE-ConnectionGUID: yku7wjraQpi/IK5Plr8CxA==
X-CSE-MsgGUID: 1gfhiw6dQ6GbvtKYI5eE7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64387095"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="64387095"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 03:03:27 -0700
X-CSE-ConnectionGUID: EHfNhN/4Tvqohvi9YOOAjA==
X-CSE-MsgGUID: j9arHXwSStWtzVr99BGr/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="157052447"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 03:03:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 03:03:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 03:03:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.50)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 03:03:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQUykTIqYi6g+nuEJkPBjouUsE9UM3Ln/+4k5VHwRf9acqnuofQTbyvBwMXgCDmEEQcuUpE95+whQVszO2fGHrmYoINYa19ycfC7TbztW1n/vOSLh7C+PoQzVgIgU5ldqQ+fDgsH7PikTea4170ck3w3n4EsYy8XMZdGqXEHxgnHPu7+oENwP9lSrifiz974SV0wsLOUGd2RTD5pzoVtrFKGvSxA1GeVg6/YjRuMChTNSf29ZP9sxmgevtCvQV9I3jbl9Em2Rari2qzmgIEjWffzNGk9VNIRAP5FnZHPC06MX9JGna1WC1RGHyB3QY35iJcw5foUez5wRbWGaehWiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USH+YgURMkjfMbzD5bPWYo5DSNwa9VyZnJy4vbwDTfY=;
 b=eXgg2TvUzeYwNFq0lO2EcdU+i/VHum4eWWqNCPDcWmvGBFbmInvrMSkSeAYyVHa8CQzKF6fqzPF4VvwIRgzBeE2Ymo5OXaNE/2pSrODQ7v6y+fOYIN+xIrXWtVrOjg+Dize68R5/s4rrgBKhiZD90Ctn0jee7/42Ne9Z8IoneJv5laslzE6vNSpbyv6xH+fHavLL1XtXyJ0UWp2FE0lsJYoLKIvCXpiGmn8GaUfESMuuaYN456lXHvI/f39B/gS45V6VogZ3s1TENYi6Rkt14iSF8TMsB+qJs5TioFZdY/2qqux9o7zYGdnfsHLQlLXiESMx8aeVkr0SwMR3a/zSOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SN7PR11MB7042.namprd11.prod.outlook.com (2603:10b6:806:299::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Fri, 27 Jun
 2025 10:03:24 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Fri, 27 Jun 2025
 10:03:24 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v7 1/4] drm/xe: Use devm_ioremap_wc for VRAM mapping and drop
 manual unmap
Date: Fri, 27 Jun 2025 12:03:05 +0200
Message-ID: <20250627100308.3401653-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627100308.3401653-1-piotr.piorkowski@intel.com>
References: <20250627100308.3401653-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB9PR02CA0023.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::28) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SN7PR11MB7042:EE_
X-MS-Office365-Filtering-Correlation-Id: 844ffefd-0009-4ded-4363-08ddb561dad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emltM0xDU1duUzFaOE03VWtCclFjRVR0R2sxeHYyRmZKc3JjUmdTS0UvS1la?=
 =?utf-8?B?Y2hDcDZNMHhCaUNYMUNYNjVoNlE4RGdmNDZudnJhbDNjLzNwTXNGN3JuYXVD?=
 =?utf-8?B?VzAzaXpiTEdQNjhGaUY5Ky8yc3d5d2dGUkpmT2hucjBzaVV2Ly85aWNqYzRB?=
 =?utf-8?B?a2d2bFR5U1IvNWpkWnpJQlJ5NG5VSlNpY2hNZWJsMmNEM0t5WEhRZEVzQjFW?=
 =?utf-8?B?R1JmK2ZLaWZLOUlXVVhtNDJQa2t2cStGOWR0ZFVGRUJXR2dkdHl4SlROR3JH?=
 =?utf-8?B?Qi9KQ0d0MnFUYWFKamNtME9MV3ZuWGdmQ3ZkWVNQc2dhMDhPWjh0YTJQNk82?=
 =?utf-8?B?dU5pam1CeEtlTXprVUVwVGVodmNIbXhSbmhKSzFzQWVFUWc0Q2U0Y0xoQnZs?=
 =?utf-8?B?RTQ3V2NlV2dTTC94Y2hUbEFUZVFCZEk0YVI1QXBFR01SRnd4OUN4ZzJsU2tI?=
 =?utf-8?B?c29qQytOMXg2d0svallaa3phUnpwZnhNZXl1SUpmYW5HWlF1NmFwVTFLamhL?=
 =?utf-8?B?cE4vQ2ZJZWlxcXpMT2Z2YUc2N01NUUpoWEE5SHhLU1NvYjZpc1hBRVIxMjdB?=
 =?utf-8?B?VWIydUlpaGk2VjZ2djdGVEIyam9Zbkx3NWFkejVJL0JsMFRuYjR5TDR6VE1N?=
 =?utf-8?B?eWx5c2dwVVNrZ1c1emFSK2I2cExhc0s0blJrUVlCekhMYnUzYlN0OUlXa0ZS?=
 =?utf-8?B?WW96dTZGRzlaeXdVT1lkUEdXYmFnYzc0SHNBdG1VVXFIK2ZyY25BemNpQkRE?=
 =?utf-8?B?aEJIa3FzTUsvYVlMZXlUZWpUZmFZNzlIQmZWLzBCSkVsd08rWU1JVFdIcUVC?=
 =?utf-8?B?OXhOeVhQUFZjd3R2T3J5Y3diVlA5Vi9CL2FTZVBJdHhYU3lXcUhJY0lZelBk?=
 =?utf-8?B?T3NHNmliMXJJaVYycUw0dFo3N0kwanNydytWUm5oY3YxRkZ3UnpnMmdSQURp?=
 =?utf-8?B?ckVLaGk0a2ttcGMrdTgzR2hwL3YxYWxsV0FCT2xCd0s5Smc3dllkNk90WlVU?=
 =?utf-8?B?UlgydHRKeWxFK0QzL2FHaTNKN1c3VUQ2cmxPWW9IWjUyREdMSjBKRTlHcVk0?=
 =?utf-8?B?NHYxek9kekRnT2JlbE5IWE9vdXptOFo4Q0ZaM2xDbkdOQjRzNVk2d2pJSE1x?=
 =?utf-8?B?blZ4T05HWDRLbmJQbklCME14c0o3WEp6ZlhpODh1ZFZnMlZoWFVSM2YyYVNE?=
 =?utf-8?B?S0pMNlFSUmlqMXMrKzZoNlZmNDY3QXdNajIwWWs1QmdjMzZqbmxUN2xKODdV?=
 =?utf-8?B?S0pnYXowVm0yb1QyZmpGSU9jUzJnUjNTNklsSTYrRUgwZVhaSVNPa2x4Ym4r?=
 =?utf-8?B?S0RBZmZFZnVUQVhrSjRCTXVWMDdsdzNYSTVUNWsvOEt6SU9PbTFJZUc4bGM4?=
 =?utf-8?B?dnV2ZmxOQkNvNFluZzU5WUhyOE1SYU9veVVaV1kwNktQRWpEMDdHeFRiaGxB?=
 =?utf-8?B?ZDl5SW1ZbHl1Vk1IN3VQTitsNDZhMHBQVjJUVHdtM2Q3aDdjMTRta1lXNGhN?=
 =?utf-8?B?WTJOam93MVJTQTdUWnAyV2FGVXFCMGlsU2svQWVrK2hwb2lxeUlMbGZaR3Rz?=
 =?utf-8?B?ODlwOWpPR0luUXpjSDkyRXZjWjM4UGUwZ1BGZ1BjOERyV2JzR2hZOGc4ZG4w?=
 =?utf-8?B?Y05ibzRmUm1na2x5cDhvaWZyaWVoenVRTmJ6VFROUGNORUt4TkNiUkRIVG5I?=
 =?utf-8?B?Z3R6dlg0eEdtOXNkcjBqZDI3ZTE3SnJXcnFEWUdWVzVGblpVTE1hMmtJUGR5?=
 =?utf-8?B?R2NpNk4wWmtBTGk3eHAwcXdCNE1qdG1jcm5mY0dDSjBtTWZ1RmdwdUpyUjJ5?=
 =?utf-8?B?VDcrRjZSSEVRWVRCbzNYaGtRWmNGYjdiNEZtTTBqUU1McVMrWjhVTUVFSmR1?=
 =?utf-8?B?UWdrdWpUZEhyVnhZRm9PY1NPdk5RajhsNFVjS2ZlYWx5NWMrU0xocDdoaGJQ?=
 =?utf-8?Q?KfThiEEOOYc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUR2bHc4WTVBUmsvYjF4citFbm1sQ20vMG5UQUxHQ2srNTY1ZzdmSkRVOHVv?=
 =?utf-8?B?ZUdiS0dPOUdOaGV2Z0RreGFZSkJFdkZITmNTWkk3dFRqWkJmUEhpTHh6eWda?=
 =?utf-8?B?M29qWHhQZW91MFJ2MUZENWZwL01ITW1MTlRkZHBNZzhCdURJT0FXNjhwUGt1?=
 =?utf-8?B?bE5pMTMweGgzalE1ZFZSRVA0VTZ6eTVRZmx3WXN2Nk9YdkhHNHkyNjlTSXEy?=
 =?utf-8?B?aGxlVFZ2M1NnRG1sTXB3OUxJUytOMjFCZWF6T0FaUWxDV3NnYmxobHgzaVJW?=
 =?utf-8?B?YjNlc3k5dUNydHVZeVptVWJiL1JxVUNjVWhnN2g0UTk0cVVWd3dwQTN6YmNX?=
 =?utf-8?B?UXdZc3AvM1hHb2RrQjE3aVF3QWZzMGtZTmM1KzFSWTdVeDhqRHk4TXpsekZp?=
 =?utf-8?B?MkRvMHVyM0RuMEl1UW44QjBKSmg2REYxRGtzckp5Z2swY0N3OUowU1lYR0NY?=
 =?utf-8?B?dk4zNDJGNHlVYWY0QXBVSU5iZ1Z6WlVhWkp3R1hnaFVBams5QUh0UlRGNVZy?=
 =?utf-8?B?SCs0T3VrWnprd0lWK3hYQ1pXd0NkZEp2WWRWVVNwQThMNk5ONHVjckRDTVJJ?=
 =?utf-8?B?SUVncnNoZEdBd3lWUThudFl6ZWxnd2c5K25kZVFZc09kVGRiNEZGR2xOYmhM?=
 =?utf-8?B?cEJyeUJ0anJDdDVhTS90YThHdU4rVkpPSlZrNXFvN0NXelkrV0dpUFBUdkpO?=
 =?utf-8?B?Z1BRTDBYc29LakNRbDdVZGJmQzI5N0Vxd0ppSmt6MlQ0Q05Kb2k3dVhrallR?=
 =?utf-8?B?VTlrQ0VCMGhFTlhSZ1hBckFBZ2tRU2RqdXNJNEVtWXlKVlFyZlMyZnh5YlZP?=
 =?utf-8?B?NVl2UzdnTXg2bzFmaFdmM3psNWJmckIvL3A0S1UvL2lzT0NhU1h5aHlNLzM2?=
 =?utf-8?B?dVVsc0MraUovLzFLNXk1RmtYWFQ5cEhKVnk0TXRROU5TdHE4RXZTbndkaGRn?=
 =?utf-8?B?WWd5QjVYWlBYN091a0E0UVRtZUZtYXpkRDRUdlNsc1dPNldzYlR0MXJZK00w?=
 =?utf-8?B?NUg4Rk5ZTG9QbzE0VUR1YWR6ajgwdkhrN2tpY1RTV0tvaFRxRzA4RzMyalk4?=
 =?utf-8?B?UlNiQUI3VXpESGxmWGNxaTVNQW44MUl2ZnpqckZBcldWMzRyUUZOYVEySzlm?=
 =?utf-8?B?TnNzOUMrQ3JQSkpSaDBiY211Z2poenZGeXJPU1dCZGxnZXNyVm5Bb3NDaHdT?=
 =?utf-8?B?M1NYVDVxNlVKdXNTb1E4dUVTc2tHeFEvOGVjYU8vOVNQNTgwbWhGUDA1TTVH?=
 =?utf-8?B?Wk9Oamd6aDV2QXFNK0IzNU1YZk52K3pRY2RyVXJpd3pHZlY1bkV4OEYxRU1V?=
 =?utf-8?B?ZHNpdWpmSXNNbkRtL2kyd3phMnV4Q0t3TXJvY0o3bURJTGpIcStsaVI2TnRO?=
 =?utf-8?B?RW1DTzUzUTNVOTBFYWJzSjR5ZmFRKzhpdXY0NGRkZ1NjZ3BqVXdoL3Zhck5K?=
 =?utf-8?B?ZTFoN0VpejRON0F6djJzbzZxSFZLMFpxZWxwZDNsK3I4WmllMVhRTW1QKzl6?=
 =?utf-8?B?dGdYbGUxeDc3Rm5DK0x5SVFYZVordHVLTzk3cUd5aGIwQXNIOUdrdHZJRXM2?=
 =?utf-8?B?Uy9rVTMxNXY2ejFWR1JpWXBUSDFQbkwwTW5DSWhLaEVVbklDd3FCRlhHNVpy?=
 =?utf-8?B?cERZSFg3U2lUeWgzd3ZiN1ZWSTdWeDFyazhFREtVTm83UzlvdTlNLzd3aHp6?=
 =?utf-8?B?V1NVbVd2VnlIN3dmZlh3K05VeEpRN2VRWWdwazdWNHZqZ3BqYUFYbVpkTm1q?=
 =?utf-8?B?elpkSE9oWE5PRDAvZ0JsOHRXb1JxK05Sc0s3cGplK01pR3lWeEYzTUxaSUp1?=
 =?utf-8?B?cXdMZk1rb040Qlg4N1hSTENXWWNUbmVQcld4bEFDYzU5RWhYRnJxNndHdHNy?=
 =?utf-8?B?UUxUS1FOWWpWaUg4WG1jV3hHWVROSldBM1kxZ0VBd3ZLMVZESU5uc2VMS05u?=
 =?utf-8?B?SXk4TGxQdk1qVFBrRGxkMHpvWjR6QzlPakQ4NEVpZ0VqWVBiaHh0a094YjRG?=
 =?utf-8?B?cTlNTmFoZ2FPdnM1dmt1N0hZd0xlU1lHSWg2eTJVcFU4MVhRaDFiS2UzcCtZ?=
 =?utf-8?B?blFTa0d5VHc0SmVwYWVLS2hiYmVZZzRwcFl6L1lmY1hJQ0tBUUpVVWlMWXFO?=
 =?utf-8?B?RVJUVjlDeG1peWNlTFl2QXFpQTdUbE1ZcXNkVldLdGh1S0RtMXh5dXlKWW00?=
 =?utf-8?B?cUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 844ffefd-0009-4ded-4363-08ddb561dad7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 10:03:24.5314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOTdOvnPJlfOxu37nLIFmQZVKZFu65WOGuZ4q0dApdN3KAcM6kxWnmkB0IfAadm6Yml/O3ar5xKTWFDbnyGL38TGriKQpnSxwL0/CCr7V4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7042
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

Let's replace the manual call to ioremap_wc function with devm_ioremap_wc
function, ensuring that VRAM mappings are automatically released when
the driver is detached.
Since devm_ioremap_wc registers the mapping with the device's managed
resources, the explicit iounmap call in vram_fini is no longer needed,
so let's remove it.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index e421a74fb87c..3a4c84e9efc6 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -156,7 +156,8 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 	xe->mem.vram.dpa_base = 0;
 
 	/* set up a map to the total memory area. */
-	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
+	xe->mem.vram.mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram.io_start,
+					       xe->mem.vram.io_size);
 
 	return 0;
 }
@@ -278,9 +279,6 @@ static void vram_fini(void *arg)
 	struct xe_tile *tile;
 	int id;
 
-	if (xe->mem.vram.mapping)
-		iounmap(xe->mem.vram.mapping);
-
 	xe->mem.vram.mapping = NULL;
 
 	for_each_tile(tile, xe, id)
-- 
2.34.1

