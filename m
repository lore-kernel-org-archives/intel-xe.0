Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13F3CCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 09:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F50410E067;
	Tue, 28 Oct 2025 09:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lLy7c8+Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940D710E067
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 09:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761645461; x=1793181461;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lez3P7lXQf1qx5H+EtU6twjUEpr1KyAfDSDayH5OhBM=;
 b=lLy7c8+ZXsYm82tvYOtY9SuVeNhRxSc0+x4/hS5My73GZI7lKaXoMgHb
 TudwMiW4zyPM8qVxs1w/GX/LNqfUcOgCx9uJWSz8VayVj0q8pMLudWwzC
 t16rTOZDvw1tVwLjMnOqtnkRtjPDbqZjrrCFKBjHKJXKatDwRE6OyYln1
 zBdtyTEZR4ubO+qbjOlnw7bmN5+cv3pi9h0Ga58Pg/RikZWr+7/51wGQ/
 B+qjtWNZaaysRBdgCKeakYs1NUtX2T3KfmniOB/Tx93VJeptekEeCVMBp
 4VA2G6gcKclT4aPcL0b/PJIHN2/fyhzl5+JvsVpmyNcQaRy7q7LiRQeMK A==;
X-CSE-ConnectionGUID: h7Y+QsUmRi6SrptIK6hU0w==
X-CSE-MsgGUID: RgmHR2aPRNSgV/tt4XRd9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63777762"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="63777762"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 02:57:40 -0700
X-CSE-ConnectionGUID: b/58FhmyRNWfAz7QpweN3A==
X-CSE-MsgGUID: wAUVpEPSTJGJTatYVBn7qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="185001558"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 02:57:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 02:57:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 02:57:39 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.29) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 02:57:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nusXCARXMShO0wLtspPmjgsVXvbHFXoXMQZrqlYjDAcdgWTteFARSZM7+PnCoucLo9NmPvEXZFj3FYLmPKtVmElm6BSitn0auSikD/A+8ss8caD0yRmlFO99Qge18MZuuwI3hECbVP4DGs+knDnRGKxrxHQbW2NK76YFQNU+/XaQ5Gs581gSihW7X98Q1/Js6CmvYNDGfuY02HxrySR97FaWSMTtvVA1XQxt+fcVmfjoqHyPiVRBg+X6oF079uFgdCYgc9d0izRtAczw+lXHJVvwffIFZY4RZMxNewP5+mshPW8M7kElZm0rG8b7g3lHS+rNIAS2px/HJ+NjFugtSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5958fYVH1iku5JtGh8ZavefyZwXmU4tkB+taxVyszo=;
 b=e6rfILsvVFGgcoF4JehVni3CwJz+2RZ34KuIsL85G6OrTK3ErfydG6BUEGL9EZBIw8BSIQHhHMFer544xzXb/D8CZNiG1can9NuaKFBuOpuJM8KARjjt3eEmdMwamFipdEy6XuOuyRPS4oharnf7jsBkhxEMoDIcEQoN69LvtoZUPAw8rtLkwAtcZzQx5DhbLrDeiuRJJsECrIKIWHTdtzPVWKI9MknzDJkzqm10WFb4tFOntVOuIF/s+Zvg6+cBYFXHym8yy5YZp+1y1RjRO73R4gkLFCsvM/uEb43q2a7LEZIz2u3J8lDXygfvsWUgJjR6/ILgpNtTKDmO2XSJIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH7PR11MB7718.namprd11.prod.outlook.com (2603:10b6:510:2b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 09:57:38 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 09:57:37 +0000
Date: Tue, 28 Oct 2025 10:57:34 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 11/14] drm/xe/pf: Promote xe_pci_sriov_get_vf_pdev
Message-ID: <20251028095734.yfyfszbo53xdlgeh@intel.com>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
 <20251020182414.576-12-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020182414.576-12-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DUZPR01CA0307.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::23) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH7PR11MB7718:EE_
X-MS-Office365-Filtering-Correlation-Id: 2664c6b2-e4fb-4848-e3db-08de16086c85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHBxeVBlTUcrZENpYnkva1p6UDgrZ3dKSmJmRWdXb0VTODQ2aUo3ajdMdDlE?=
 =?utf-8?B?Nm9PT0IvV3dBSzZmRGR1ektWazVnTWo4cVp6WW9oL1d6QjRWMnl1b1lyNjEr?=
 =?utf-8?B?REhYWlc4SXlUMmw3QlJxbTdrNUVOS2VRM3hQT3B2VW4xYXYrWkIwZVh5T0lx?=
 =?utf-8?B?L2s5ZzNuNUJ2b2hvRkNkd3FXYzdkclVoOVBTUWhKcXpKRTRzUmNGL1JyaFRx?=
 =?utf-8?B?dmplSk1FMmtoM1NVK3lzSFlzT3ZGYnJpUGkyZlI4dU5wVHl0YTkzdFAvcXhn?=
 =?utf-8?B?aWxXaVF5OHdVaHU3TDZvK2owUUJMMHVsY1JwSTkvdjl2QjdNcXBKTmV1Q3d6?=
 =?utf-8?B?RVNydTNxS0NBcStLN1VMY1NTT2R1Ykp4eGtsRHBBbGx4Yi8yVktwTUgxYkEv?=
 =?utf-8?B?a0tUMUJmMmZOWGpNc1R3bThIc1l6aEdDOXBZWXAxdmNyU0Q5dVFMRzdSWTZu?=
 =?utf-8?B?dWdmR2pUcGo5VUV4dXQ1MUorMjVGOHlxY05zeXdWWDhvb0MwZzVBNjU3RVFN?=
 =?utf-8?B?WFY4dXdNak93dVc4d1Q2WXEyb3JyRnI2ck5WSnpIbTJQZnRnSE9QSnF1RmZp?=
 =?utf-8?B?THAzbEFRVmNkQVRTRHlhR3ltangydXc5QnlodGZ3Lzk2d1NveXpkS25OdTl4?=
 =?utf-8?B?NUdSei8vTmU0dkpOYXY3cnAyaFIxUTdvRVJSVGZwd2I5MmJnMGdqc0ZUbkVs?=
 =?utf-8?B?TE0xbExVb2JKcGdyU29lS215amF3Z2RIdU9Tc3N0V0xNTmhYNWJRSk1RYlRD?=
 =?utf-8?B?T0xwSmMxWkkrOVRUdGZWK2xRTnlka1J4dW5oczFiMFlJbFN4b05xa0lZeU5P?=
 =?utf-8?B?aDZYSEZEUlhDVXdBQkI1RUZZdXlGeUthMEh5MXNjcjBhYndmUXUxTVc5SlNY?=
 =?utf-8?B?UHM2dCtmaHhqdXNVQ3lxekJBb0U2VWt1VGdLSEVUMS94MHVXTTdnQmlzVXBJ?=
 =?utf-8?B?ZlBYMmNLQ3FzS0t6bFp3WG5MYkVMY21wd01OWWQ4Z21ZUVpkZ2crWkw1SUZa?=
 =?utf-8?B?dFJXcnpzdU1yZytLc05VRHdMWHRNVDZveDZuOGdMbFB6c2dYODZpQTFQRHlq?=
 =?utf-8?B?UjNGSUF4cjhJaldncFNpRU1sclVuVEFxR1V3UHNScEVxZklOR2lTZGllcWV2?=
 =?utf-8?B?TmNSZ1ljcUpYN0htV0pqZEwzMTBWN1BYUXYvZjhsZHU3QkVLWW53dUdXdzlU?=
 =?utf-8?B?MmNjK1VxTWNnNXBDbFZSaVNrMGFwSnc4WG1lNU9qSFY2dVJaT1d0aHI3bTdw?=
 =?utf-8?B?SzFBc2JXUDdzUklvTzAxYU5HMnl4M0swM3JFNHR3VUltc1lkYXNrbHcyeTBK?=
 =?utf-8?B?eHBwQTFrLytxcVRmS3RIWTBlaFFtcEd4bXB4bGw3ajdINndxZk5XMUI3blhj?=
 =?utf-8?B?dWhHMElDZ2M1dU5TU2tvUzZLSklWT2MvbCtGYW5LSTJPT1BBOVNzSEhNK1Rm?=
 =?utf-8?B?YUZiR1JVNXJKQkR0NEJBWmx5cyt1THRVQUdrLzMxVEMxazkvTnlkM2Q2dEMx?=
 =?utf-8?B?RmcyRUxrN0dkM1g3cTl5UlFOWENYY0RJamNjRHFabExVY1lRcWswUGpNOWc3?=
 =?utf-8?B?Y2c4Zk0rWENRNk42SHFSQ0FmT2dVeEJ3R1k0ZDJTbnJ4Q2tVRmZrK2x2Sm5E?=
 =?utf-8?B?VmpKYk1GM2xvaEFnMldhWnIwZDdIWWdvUmduc2hDbUJPQ3EySWRHUVFVVUUr?=
 =?utf-8?B?S0ZTWXowZ1BxR09vVDJBZ3BWbXh1VGFFU09PSnE5N3lSY3JoSVNLclBpZ0p6?=
 =?utf-8?B?TnBvVzFuU2Z3dnowc0pGUVp6dWFNV2xuaHZBeVhWL2Yvb05xNnFia2dTRXBR?=
 =?utf-8?B?Vk1ITjNnSENvazI3ajlLdE1uN3pPTkxQSnlrb2ZjK3VrQnNkZ2VYVC90L2tY?=
 =?utf-8?B?NkpDdXIxZDFDVHdWT09qTW1ZN2pqaXAzTkVsMmJDOWxVWFI2c3BQN056ME9H?=
 =?utf-8?Q?B7ER/VbHuCv6rB7msnOmJ0VSQImn0nJR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGpMUnVGVk85aGhEdVRZRWN1NUQ1dE8vREFDZTcxUWZiWldpR0NGcHBobkFx?=
 =?utf-8?B?bEFuN1YxbVpMUkNOaXFwSURVVUVyZ1B2ZVpWRnZBTTF1RkJlOXlxV1haeFFv?=
 =?utf-8?B?eitOenNLRGdwalNCMXJ5RkhFeWJJRm42UVA3dEc5UU0rUjgzNUh0N2IrUFFC?=
 =?utf-8?B?WXNja1piYzZ1TG0wM1MvVVUvNlZrTFo1UGxjQW9BY3AveXhmTFIwVkFMSWlN?=
 =?utf-8?B?TTVldDVLZWtsQW9NWTRSOWFUZTR0Yk1TdTZLWFR3NXlrNmp3Z2xDeGIyT05Q?=
 =?utf-8?B?WVlONENYVlFjU1dMTXBrTHVvUlBORktndkx1K1NZNGVWVDhleXVsRWttWFlj?=
 =?utf-8?B?STFzQXZnSDErZVVqeWZPU3RWamphbis4cGdNUmdWM3RIUU5DaktMRDN2TFNo?=
 =?utf-8?B?elhJN3B4NmtvL0kwUXA2S3hJWmtoRjNEWjZLVDVLbTR5RTR5aVlPaVZPSW1a?=
 =?utf-8?B?ZFVGQnYvaEd5RnVyU2lPU1l2RGdmU2tSQitLUFdZNHNOb1dmZlhmWTJ0NmRw?=
 =?utf-8?B?cFdaaUZSa1RWVlVCVFBMN1BvSHMyUm43TnVDNFE2aGpER2pZbXl0TDUxWVBP?=
 =?utf-8?B?Z2F2dEFvQmZVekxlVjR4cU9yMVNXZGxHUnNtSStqRkpFU1VHdHJld3YyZW4w?=
 =?utf-8?B?Mmg2UFVvVWVYVzVuZlFoYm9OQ0pCUHRVZDRLWjhmWHJoZHJWVjZyT1k0bjNn?=
 =?utf-8?B?Y2NGMVhnMkJWU0RNUGVwKzF6bWRDMlk0bC9EWC9reVp2d2VBa3JHVHVsVjla?=
 =?utf-8?B?OFdBV2VDdXp6b2tmbkdDVFJtU2VlcnB1MGt5RzJVVFhQME52OEtwK1NLYnBs?=
 =?utf-8?B?RHpGOVRwb0M3cmlSZ24rcG9DU3lhd1BVM0ZHc3FEU01YMVIvV0t2MjNBWVdI?=
 =?utf-8?B?ZzJQMmNQQWxvNkQyTVg0Q2c2SjhJaEloKzVQc2dmRlVxbS8rQlJ3Z0JoSGJL?=
 =?utf-8?B?MysxOWlFNzU0WjU2eVU0SG02Zll4YnFJY0trTXBDbW56SS9HZ0hXNjUzdHZP?=
 =?utf-8?B?UkNIOEFCQ2FCVE16TlQ5WHBuVGlWM1BjNm9hVmJOUHQxTXR0dU5neHJ4Wllp?=
 =?utf-8?B?WUozbWRQdTZJckdnYTJ2OFNHY09TM3VVemQ0NnU2OGVGU1dZamtlOTQwcVRw?=
 =?utf-8?B?UnFpcUExTGtpQUtNSlI4UmFqRWVwc3UyR2lGOENqdkxaM0JLNjF6VVY1SnBT?=
 =?utf-8?B?MEdqRzE5TzlNVVhENGluRmhINGh5OGEya2N0QS9Edjd0aDlidk9yeWNSbDZr?=
 =?utf-8?B?Y2p2YWVCejVBS2R4aUNMUXpkOEFoMzJ0UUtPMVhxNUNxSmUxeU5maktkZFI5?=
 =?utf-8?B?WXdtbmN5TzdjREo2by83QXFhdjFZUTcxWjJFRXdvWDdtQzhHTitzQ0ZLVDI1?=
 =?utf-8?B?ZjhyUWhVM3ovaTh6YlkzQzBCd2pPZUkzYVZtajVQQUlQS1d2dVBUN3hSS1R2?=
 =?utf-8?B?dmE0TmNrY1Q3d0VzUnppWHBZb3NZeHZ6dmMxVTRGeVpHRHFzRnl2QVI2OG5W?=
 =?utf-8?B?WWtYNXFuMTcxU1JwMTBIbHRobEtrQkFiUXJkQ1FsN2tkTXdjeUdxcmNWRmVW?=
 =?utf-8?B?cHBxQjQ0bVdENW1HL1NpZmZma2JUeUdyNlRkd05hZHBkYU12RkwwSklWanY4?=
 =?utf-8?B?d3hnZWxKeWVTUkNOSldNUVdGd0l6bGNmYWFGcXAxVnZYMk5va0VwVEtMekpk?=
 =?utf-8?B?cm9rRW1uczJTeFRWc1ptcUFoY3FRS1NlSDIwaG9PRzhybG91Uit3NDR1OEcz?=
 =?utf-8?B?Tzc2SmJHQlZob3Z1SmFaa0NiVktweTBTYkx4RW4xYy8xVzE5VEdWVWpUd2tN?=
 =?utf-8?B?Zmd6Q1ZuV3dtUC9sVTEwNlpiM1AyZU5oLytwdXdvR01EZHJKUFpTMHpZYmNo?=
 =?utf-8?B?WHZDRmRzdzBOdTZpK0pTUUI0ZnVxc2QySW4xRjBoNlIvQTBrSDZmbytSYzln?=
 =?utf-8?B?cElwVDZqM3lRY3I2a284dmIyUDJndDgvMWl1MTR6L1kzVFFKRnJXOFJkdEdu?=
 =?utf-8?B?OHdRRlBuT0l2OWdYMzJBSVA0Wkx4ZEJzaTk2UDFuY3ZtK0lNNUI3dlVsVFpj?=
 =?utf-8?B?ZVZCM2NUVW9xRzR0WjlxL3hPYWJha1BxeGVIbk8ycllobnBxaitNajdya3Vr?=
 =?utf-8?B?VzNQaXEzZHBwZ3pFRXVEaWdRczBvTTkwQ2tWRG5aSFUyMC94RXRISUZlNGpp?=
 =?utf-8?B?ZGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2664c6b2-e4fb-4848-e3db-08de16086c85
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 09:57:37.1190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TSqVrjUpgFDh3I6BJRKOAEHRhbrcmtDK9kf71RdN1B7NvVY5s0pJbtam+dIpWS/dk9+etF6dFTqVEEFj0rd+8FhJA+ss6RdS3DGBhavR7bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7718
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2025-paź-20 20:24:11 +0200]:
> In the upcoming patch we would like to use this private helper
> during preparation of the sysfs links. Promote it.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci_sriov.c | 37 ++++++++++++++++++++-----------
>  drivers/gpu/drm/xe/xe_pci_sriov.h |  1 +
>  2 files changed, 25 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index 735f51effc7a..678e76703cd8 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -30,18 +30,6 @@ static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
>  		xe_sriov_pf_control_reset_vf(xe, n);
>  }
>  
> -static struct pci_dev *xe_pci_pf_get_vf_dev(struct xe_device *xe, unsigned int vf_id)
> -{
> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -
> -	xe_assert(xe, IS_SRIOV_PF(xe));
> -
> -	/* caller must use pci_dev_put() */
> -	return pci_get_domain_bus_and_slot(pci_domain_nr(pdev->bus),
> -			pdev->bus->number,
> -			pci_iov_virtfn_devfn(pdev, vf_id));
> -}
> -
>  static void pf_link_vfs(struct xe_device *xe, int num_vfs)
>  {
>  	struct pci_dev *pdev_pf = to_pci_dev(xe->drm.dev);
> @@ -60,7 +48,7 @@ static void pf_link_vfs(struct xe_device *xe, int num_vfs)
>  	 * enforce correct resume order.
>  	 */
>  	for (n = 1; n <= num_vfs; n++) {
> -		pdev_vf = xe_pci_pf_get_vf_dev(xe, n - 1);
> +		pdev_vf = xe_pci_sriov_get_vf_pdev(pdev_pf, n);
>  
>  		/* unlikely, something weird is happening, abort */
>  		if (!pdev_vf) {
> @@ -228,3 +216,26 @@ int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
>  
>  	return ret;
>  }
> +
> +/**
> + * xe_pci_sriov_get_vf_pdev() - Lookup the VF's PCI device using the VF identifier.
> + * @pdev: the PF's &pci_dev
> + * @vfid: VF identifier (1-based)
> + *
> + * The caller must decrement the reference count by calling pci_dev_put().
> + *
> + * Return: the VF's &pci_dev or NULL if the VF device was not found.
> + */
> +struct pci_dev *xe_pci_sriov_get_vf_pdev(struct pci_dev *pdev, unsigned int vfid)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	xe_assert(xe, dev_is_pf(&pdev->dev));
> +	xe_assert(xe, vfid);
> +	xe_assert(xe, vfid <= pci_sriov_get_totalvfs(pdev));
> +
NIT: You already mentioned this in the docs above. I don't see the point in repeating it here.
> +	/* caller must use pci_dev_put() */
> +	return pci_get_domain_bus_and_slot(pci_domain_nr(pdev->bus),
> +					   pdev->bus->number,
> +					   pci_iov_virtfn_devfn(pdev, vfid - 1));
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.h b/drivers/gpu/drm/xe/xe_pci_sriov.h
> index c76dd0d90495..b9105d71dbb1 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.h
> @@ -10,6 +10,7 @@ struct pci_dev;
>  
>  #ifdef CONFIG_PCI_IOV
>  int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs);
> +struct pci_dev *xe_pci_sriov_get_vf_pdev(struct pci_dev *pdev, unsigned int vfid);
>  #else
>  static inline int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
>  {

Shouldn't you prepare a variant for case without CONFIG_PCI_IOV for the function
xe_pci_sriov_get_vf_pdev ?

Thanks
Piotr
> -- 
> 2.47.1
> 

-- 
