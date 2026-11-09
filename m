Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED579606A321
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 23:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eaTxjXVz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA3F10F58E;
	Mon,  9 Nov 2026 23:12:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E35910E27D;
 Mon,  9 Nov 2026 23:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794265915; x=1825801915;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=kITNMgb8bklA5SgWZ68GTxiQTWvvFrB69bFjt6u2tgM=;
 b=eaTxjXVzqugk+rhyNV9bMwqMYNhVeAWYqeQ0h6J8lTW5Gb8nvu2l71r5
 i23JfPaBZutpJ35EfMSpOFHFaAKKmRZPRKejzZ32bqbToem29T4y6UiCW
 Umf4wcHGzhBHB+iD1MIo3IAznst2pq+Aw9416KwJiXmWLezVFBZ2AAvM1
 mAWM5D26Hmk6oqc3cjw4f4ccg2e37yUQrxTeKpCI1fkfZkUVfC8cAnswY
 3TeQafkTApZL5w2+bKiZZQHh2O2PWiIB+/ek1GvZ7Sl86bPXhT8aLsA7+
 QXp+Zv2mwsGAZLIVv/D4eexRigeNFUaOE+QIAUXU2e5JsM3PL5Z+/qx2R Q==;
X-CSE-ConnectionGUID: g90/G55PR0C3gkKTSql1lA==
X-CSE-MsgGUID: nSqgOXZPSLOhAiTgEihZlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2894863"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2894863"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 15:11:45 -0800
X-CSE-ConnectionGUID: +orC67DUREWO/KATQ4TAZA==
X-CSE-MsgGUID: kvaYWVxxQFqNLoQ7nH1nqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7980512"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 15:11:45 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 15:11:44 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 15:11:44 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.39) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 15:11:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tL3C0VreNPLSmXRyt/emDZi/HEDs9h2BJ0prcSxHqN2y/jiilcB5aoF5vh9zYVXlxX6TzFiXu+zBAm9dhfBF0YBK1sUbU7S9t+NDN+jwNsXNkNepvF5z0MQafTTFJMl4RJKRsb0aw4Jr2QYTqEcradwMlBBHHetqjT+ibJDZk2QgzssY+b5RZGEGBEVL+RDdB6bzd5yZ/FsCjXv+j2y1qJt0ZuClsN07NpEffP/qy9Oa+6BYrtDQP/FXGgATtVbeb6AVkiBnOBKqzN2xaeKBgqKpz0VkzXFCOKJ0SPElLW5IgYQ9MKhStWZx5JpQ9mL+29758WxJ9jiEh7jlcAOYWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VoBD0ZHfHZW4IMXLYCB1zFE/FTdPb/5N6wplA6JN3U0=;
 b=RUiHDVodi0sSDmx/G7TGJrHp34PHk3rS9/moULp75avO6AsRU/udcCSQi0iYJH117+ylgP8uCN8S5oOBWuFbSnTxzDAoe3lpq/6ImrwN8EOtLF3I04eYhsBt9vSrUy8MqsSXxZh6tZPN2egVXWRY+kK5iVsM0JGdMARn6aBSguHle3Ec9pIn+UFkejUp/MrVMthxHt8lQiXrzojjcieCRQiLkYHg8eiuDLV9GpURuynZFlH71emH+2PtCEuUw46OAKhKs2kAJ6ihoDc2wxgFNSrB6jJbjwCXjkCr812vf0zXaNxfIh8pQYQ8OKhnxY2D7A99XtPPCdc9C/g3JQZYbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by SA3PR11MB8076.namprd11.prod.outlook.com (2603:10b6:806:2f0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 23:11:35 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 23:11:35 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <I915-ci-infra@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97?= Xe.CI.FULL: failure for drm/xe: Clean up
 adjust_idledly() and implement Wa_16031259911 (rev3)
In-Reply-To: <179401782182.135328.5018409420848239130@221881a7231d>
References: <20261105-wa_16031259911-v3-0-da6ec790aa29@intel.com>
 <179401782182.135328.5018409420848239130@221881a7231d>
Date: Mon, 9 Nov 2026 20:11:23 -0300
Message-ID: <874idp38is.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::22) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|SA3PR11MB8076:EE_
X-MS-Office365-Filtering-Correlation-Id: 177434d4-7294-4694-d903-08df3eb6cd00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|5023799004|260925022911599003|260925021911599003|260925021311599003|11063799006|4143699003|261021133027099003|261021135927099003|56012099006|261021121427099003|261021130227099003|261021123027099003|261026130827099003|261022075727099003|261022115727099003|261022105027099003|261009223027099003|261026121527099003|261026135527099003|261022113327099003|261026140227099003|261028144727099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: RYQzGR0ccYOdLYzBg/kTRG99y1p18EFmE4bumS2qvnERIFLpr/SU8tyLgJQOutIg1NIzSlpTMEAFA9c/quo0HGMJ1kDlDjqfac2+ze+iYiGeajd4ax3ZAHWMj44EWDBpODP3lNIXjkG91Iqwlqy/Zq8DRJHDeZst034vFRvHSiH2ogZhKp1fDKMAT3DqZOb5YcDh869V9rXhfv4yfmcIEz7NVVbkMCy8MrCtGLjcHyZ8ntbpgs2tyt3C4LABLBCQkgyWZ8yPZpJUpAS+TQgwubru5vqOTGMr6Ha5jxO/EaEA67mdxETL2Yx+pex/i9AqRaSG3Qnov6vYP0g9eUln72FpJBP+mMAUxy8wQzui5CiqT/kKopgzJlgYLLOBFwXBJP8vA35FFVKI4TrO0CLvbW8G1IigHL4EAk8UWuUrXMEv6jUpqr80cjEZ8gyGtaaJo0cxkqt5mtMtznrd+WxWxFm3lXaiN9t38ll+9E9AzBiRs//407y3ckQ0evm4eeHEA+AFkKlFmmw8kGyq1AuzPug6zChWE/BGDaHBlfqF0O7V5a8vt/sDGltojoOMVVdx/PVcVZhIaUI2eEoLZ1rQVUJJ/tbuiNMiqldPmiafRig=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(5023799004)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(4143699003)(261021133027099003)(261021135927099003)(56012099006)(261021121427099003)(261021130227099003)(261021123027099003)(261026130827099003)(261022075727099003)(261022115727099003)(261022105027099003)(261009223027099003)(261026121527099003)(261026135527099003)(261022113327099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lLWL+F+UKDqqReNLq0vO97spRIPVxNusEXni9cj1A1Y/n2d27gpMcDr1KPhV?=
 =?us-ascii?Q?aCcsInVb5k9L9JzXq15Dt8ZvmjEPafEV0Y+BbELhbXkmTY68pMwNV45fdEvc?=
 =?us-ascii?Q?05QBm0pBQeISH6+K76SHF3Rk52UZ6oHP+wSY7BtflT6tbNwM791RMfiQbiAV?=
 =?us-ascii?Q?nix2zdzMLwdTubxFskzTgdvz0YWzvI1FuiNTB/ynalkqTKobE9ZUA9bSQck8?=
 =?us-ascii?Q?Lc3DbWaO8vw7ur28tUpSKt6tzA3Bs66YzhVo1vBXNnViy5WaSHbA0XIv7vso?=
 =?us-ascii?Q?TlVy3GdWiBw3uM4zOSm0mWRdzh8GjhJCAD1cvlWKrg34SRhJkjquo5JwdjsN?=
 =?us-ascii?Q?7bzMNjQ0Lff8XtcDa2N4wPR3vxuLbZwwF+6FEbzi0SGitc4xywHL6zOk2+2X?=
 =?us-ascii?Q?pBYPU+RyQa++PRjvrTaLnlQ5rWRURT8elZYwmJf6dHhv3nWlExJXpDG+nkJb?=
 =?us-ascii?Q?aN0qaA4UX+gIBY01xTorv5od51lzHlX8vXNBPovNkaqwOfXZ/JllMHPcur5b?=
 =?us-ascii?Q?JchbAr+GYoZePmWI8FWsVXBK3RpFPsWCh8lMC2rCcP7E8hKtGM0qVWGXz+To?=
 =?us-ascii?Q?Qr0yO0va6fipEEEHRpK/wlXbuMqRh/nt2mGedkz0nsY/NYJvgh7XGX4blouQ?=
 =?us-ascii?Q?as0PdTbJBTAP1yhkfYOCxSVF1SFJaawq8pizX/xiSKcmqA7neQ8kVe5gtaLG?=
 =?us-ascii?Q?B6hfFeOcWUcF38rXoLCI9S8vVErewTuoxpDY/gAAcxebmKrrzsajRxZE2vVC?=
 =?us-ascii?Q?k+Oi/MLlO7rkYwyY5VsoVFGzBurSaq5FDQUOw4panOmQFIRP2wp6hbhE8NXb?=
 =?us-ascii?Q?wCL03Hx1mA3VP2pT+wXf58HVryroZ5W0dl004clL+yvxjn0+p5duFZmqINPk?=
 =?us-ascii?Q?06GjAxovC2SnSIv4O0dBaMcNO/usC5jKUTQqlZaCZL0vD5O8Mt2qP0T6WiKZ?=
 =?us-ascii?Q?rzn2/yFq+6WoCwUIE11z1PxeLw/JkvdrroIVsCaDQDzFOnvYB0U/oep2pB29?=
 =?us-ascii?Q?8lpklgK/kbbjrvppuJnFuxEUOw9eZquU05CtPYmLwXv2j65kfzJQSJ9YOYbJ?=
 =?us-ascii?Q?TwMQzDnqSHIruhdqCl20b+PzEsNz4JUWqsBo70xg0rsaYh52PwZmqhp18SOj?=
 =?us-ascii?Q?yTjgp394Ir7LYMECCgqdvaq2OGN3hnUCN7JDXbsDouwtVZDq3XpAbQgYu1D2?=
 =?us-ascii?Q?sBG5TjY9tGpw5Rj6tefe+3d9mQyKkp/Mj+FeuQCoxGJ0pz0wiSadKXYdTb5D?=
 =?us-ascii?Q?mFLxS85YiLWUqPvFakCFalF/+v0MdreJ2wdcxssLA15q6nNMus30AwKjc5mC?=
 =?us-ascii?Q?GihCFQk442GZL6Yf/WFzbfTFVPYDVNe9mVco9pEX2FxSUuygEqwcz5zCMk1I?=
 =?us-ascii?Q?B3zGfbjs4CVtrZDzW6thB8qJZ+SL/dxKAkgd77Tvr3oaVgVPJT0Scm0r2OB1?=
 =?us-ascii?Q?/KTRY6CrdHbI90n7ryxjHrf48hFmAMe0XHzstFonCRbR/X0xE28gWOYaiZl4?=
 =?us-ascii?Q?NLUTiunTXT2xYTy5bTej3DTgd4xDuGmFce9+OMyLUdtb+GNW9dUZCNGM/clW?=
 =?us-ascii?Q?tWA5sj7pYtZoFg0LpzUbyDhnECPN050n5t7b8OuyfEK4kOq+eNIVDWe9C6AH?=
 =?us-ascii?Q?g1v1pSPQ0HPZyCZuJkX7aSwuj8dzcXxvDKMgjrI9JYFCbo6+uES3Aq37wxCL?=
 =?us-ascii?Q?qbRdXWMelKI3lTvXBzXTEutxUPyTuCy9lb55AI28ORNtZZbsIkdvFwugdKX7?=
 =?us-ascii?Q?nyTgAc+lhA=3D=3D?=
X-Exchange-RoutingPolicyChecked: hNgDwTn1y28Xw0b931MnxIeu+lb+LuBQSzV3c7p/BWsOtd9fb4cb70ZH070DRdwYyvPSYuM8qIG9iNlgjxSHMOvma6fTQfAdBNcwgnNqprnpKCIj5BasYpDovdwTVDVUJKIlDv2Nyg4bsOisgCmX5SvPwsFzgZAFwHZX0E+CE2inQ5S1WGOjhMMGdw/+BLMc0x1h/+MTy9bOqCjftwzQ1rpKVn7OvF5IRqdzN89HkroqoI9Rl1gIkAlJeL3tc74WswHj7LR2s+N7nfHV3jwQ0maEySQrCoOnUhDoYO7vVvNBsGPm6vi/a68L4QhpNgXo5bvtSzF+iyKBkfqgfDhX9Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 177434d4-7294-4694-d903-08df3eb6cd00
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 23:11:35.5377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uMWNQU3TevasWInruGOh6Ff2hlGiro/RUMJ+CExlkaWg5QjyfJwwN+TRYUW1T1ijJKxSP2c7Gy4AfpO3VHC64Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8076
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Patchwork <patchwork@emeril.freedesktop.org> writes:

> == Series Details ==
>
> Series: drm/xe: Clean up adjust_idledly() and implement Wa_16031259911 (rev3)
> URL   : https://patchwork.freedesktop.org/series/176761/
> State : failure
> 
> == Summary ==
>
> CI Bug Log - changes from xe-6074-be7a4fe8d1795219f7d033830ec4cf6e8ca1ecdb_FULL -> xe-pw-176761v3_FULL
> ====================================================
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with xe-pw-176761v3_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-176761v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
>
>   
>
> Participating hosts (3 -> 3)
> ------------------------------
>
>   No changes in participating hosts
>
> Possible new issues
> -------------------
>
>   Here are the unknown changes that may have been introduced in xe-pw-176761v3_FULL:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>     - shard-lnl:          [PASS][1] -> [SKIP][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6074-be7a4fe8d1795219f7d033830ec4cf6e8ca1ecdb/shard-lnl-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176761v3/shard-lnl-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

The skip is unrelated to changes to adjust_idledly().

>
>   * igt@xe_pm_residency@gt-c6-freeze:
>     - shard-ptl:          NOTRUN -> [ABORT][3] +1 other test abort
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176761v3/shard-ptl-2/igt@xe_pm_residency@gt-c6-freeze.html

The subtest is actually passing.  This could be related to
https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/2625.

--
Gustavo Sousa
