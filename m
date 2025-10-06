Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C59CCCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 13:33:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D21D10E34A;
	Mon,  6 Oct 2025 13:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fPCspldO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49FD10E34A
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 13:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759757581; x=1791293581;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tGmtB15+UkuDxutM5+PpGMJVsQQKfTsbHjpX2hOsoIs=;
 b=fPCspldOgCfs9/PwK2yDp0sEg3/6buGSxQhuoS1t8FiJZVq7WzxoDZDd
 oAkR4KLJ7ibSWNQQ1ehsF08TMroAijIKXdAcrSlA3Ayd2ARvjzc2YqWmZ
 Cbhj1ezZt6NryYDXb16VE8Rbw4wHVuC8m7Z3EU3YlZOQhWzby61g2LWBp
 RRJblQIGcDZXAMjYjpd4v31AbzTR3bViI1UWv0NZTcNjfyBdx5rn0Y0M/
 Wp37q6LjE/cIAzNFxs/2AvaNflkcJHimad72JRTipzo9ItDOHk12oBI0Z
 OBNRNcDlDTzrXRJ7wHO09CvIfKmuk2il2AwbqwsdWB44s0Od+j1BJW9LJ g==;
X-CSE-ConnectionGUID: xW/k9Wu3QkyPcbp13EKwuQ==
X-CSE-MsgGUID: 7BhLwqB7SwOhXt7JPyBrDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="62098628"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="62098628"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 06:33:01 -0700
X-CSE-ConnectionGUID: TCPotyWIQ3uoVPu6KjF5WA==
X-CSE-MsgGUID: 5IHu93XmTc6/AH2uAE6vyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="179694332"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 06:33:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 06:32:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 06:32:59 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 06:32:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KazM8qrpkEuKiCvxfjJERmBJVsfhGPGPjsumQ24MvGNCnhjhNhKlcAMxyTbsi5JfXNiLkGCRqsHTT4bgaKO038lW5+K1kgegyYjcrBJXQOziaIc5NW6wMBvFAsaSgIFBfzb50cpo4EqCdOVPzfb3A9mb1ss+RxFVHkaZV6sI1K1c4tfDGqP2pJ8dZTCMPY3R6IK0T+zG2B/AR+t6jEepwY80vI4WH3Nv8x4PsCmSmHIO3ApHQCPsIT/1b6cmkdhU+nKASprt3sTNixIbNu1JWpbz3dGrhQui5z1P5wjvEpFEJvLtsZtpLug9QKUCaTuV+bVBok1UwRjb4XC4upKmYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ITrpJA6q3xn30BdWi5mLTDSQvqSbwtY8a8+D5/akF0=;
 b=fybmnVOBMrwBeH1M+Z2tChLrWoUDKBwh5+qY9TDEm2osz6JRdjr3VCEl43gqQUxInkX9lLgfMiM28EZsgjPZt6/uaEivrWVXSu+enIt7WJgHlkzxzxy577AKaygE3bIvtK5WrxMHBJVZtzfd/xrFhLvLHT0JyAtjrZP00uBw0JIO/ybM9S0v4XirtUynM44dFMRaWTqiyza2Ncr+IbQMPJWYg+Gh4ZIQlOGxzafifNXxirh4t+9vkZRztbqS0vdbQ2vZGypUb4qZ1zQ3Wu3v90CHQntxjbSU3s9b0uhNxVrXh/GngOZNnklSX0EQedhbQLUEuCHRgonJfbP4+lmrPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH7PR11MB5817.namprd11.prod.outlook.com (2603:10b6:510:13a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 13:32:52 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 13:32:52 +0000
Date: Mon, 6 Oct 2025 15:32:48 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] drm/xe: Update MEMIRQ to use tile-based printk macros
Message-ID: <20251006133248.6vr2opcjpaeykb6u@intel.com>
References: <20251005133641.2651-1-michal.wajdeczko@intel.com>
 <20251005133641.2651-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251005133641.2651-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: TLZP290CA0007.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::7)
 To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH7PR11MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bce6a01-c60f-42ae-1f96-08de04dcd981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEtqTE54ek1vY296TXFtSTEzaDVVRlNtTDVmdG1kVytuZzRGMXIxdEhqaUFY?=
 =?utf-8?B?UWhxcWo2UzlKRWltbGF6c3pta0Z0SlcvNTMwMTBSZG1FL0N2R2ZTcnFOa0VO?=
 =?utf-8?B?Yy81aXFOMjJNYXBpUWk2emNibnlhNGtZR0lSMlMzNkgreWNDd0VEcUs5SDhU?=
 =?utf-8?B?ckVycVhQTkhkSjA2bVhKVW40a2VBV3E5Z21UYzA4enhXZU9Ma0R5Q3hUT0xx?=
 =?utf-8?B?cVAvWWgvR2ZzRUxkbXgzYnk2aDlDMjJoYm5DZFhuSGlPQWQxRWEwTXRCWkRt?=
 =?utf-8?B?ZitzSnUrcVQ4eDEwVUxJTlRHTGMzclBiRkRpdUdEcU1jRCtHODYzbkVxQTFE?=
 =?utf-8?B?YzZsQzV2VjEwemoxUjRuRWtwS1pyWWRZY2R4TEZ2UlNCRndSUFBNMUxxVkdn?=
 =?utf-8?B?OUxYOFpaOHBtbWxtTjk5M0QvUGFyaGRpQzFVWXBEVkYzaEJUR2JSYUMzdjJy?=
 =?utf-8?B?b2JLczNOb2pnczZnai92T1FDQ2FKM3lKb2t0NWxicEV2bzBPQ3E2QWVwZWpH?=
 =?utf-8?B?bTJhdlBsWHN4Y1dRQWY3UE44R1VRUTdzZFlaTXczcVV5R2JrMjl6VEJ0dXp1?=
 =?utf-8?B?eDlua25zMVltRDc2a3d4Nm5mNFVsa0RrRFRSYnE1d2xQeFVYOVJZWUg0OWxU?=
 =?utf-8?B?RFMvbXZ2VElMMnJ4bmczNW9FWE5BVzFOZkhrOTVCZHc3SzdjdUs2UkNrV3JM?=
 =?utf-8?B?UTh4NE4zS0I5UkxQbldlTWtEMUF2L3l4UXpGQ3MwTDJxdU13WUtHT0NuOUJN?=
 =?utf-8?B?aTBCWWhXTC96NDkzbU41UGxsZGI2Y0R3cDFOOHlEOW1LSlZpdzJTRXl6K1Rz?=
 =?utf-8?B?UmxVd1NCWGZ6QytYZzdNK1UxbnY0OGw5Tkg1YlliQUxGRWI3UGRnSlQ0eVQ3?=
 =?utf-8?B?TWxNOFhaODRBUEhnMzd4MGNOSFBtSFhYWDFwSGFZS1VtVDQzQ1BKbE92SjlF?=
 =?utf-8?B?anc0V0xwODExRVpCV3VhN0VHbm0vcEVBN0prSmM3MEltdVdWWU1OYStVdUFy?=
 =?utf-8?B?eXFtcFltSjVENmJOeWRhYXlFbmJER0c1WDF3STlWU2RyNzZ5N29IVnpZcWN1?=
 =?utf-8?B?MXVLTWJ4Q0hQQUJraHR1T3hpZFNDalNodHYzZ0cyVUt3RXRQZ2I1VTBUd1hh?=
 =?utf-8?B?QVVuZTQyR2RwV01MUTV5MGNIL09tdjZURnZhVDUxOFlJZG5WRmNNV3BJdnFa?=
 =?utf-8?B?ZGdiQXpRVUNkQ21jZ2ZZVlp1ZDNMazF3VExocWNIY1ZXbFBvcHE3VWJJVlh3?=
 =?utf-8?B?UEMyZitHV0I3eTF0Z1kvUGgrMXRDUll2dmNhTU91cm5CTk1nTHNOdXdHQllO?=
 =?utf-8?B?UVJCcVpvajNIczlEOGFrdnF5ckFtK1FTcWxOeVRPYU14YU1pdWdBL3JGZzVR?=
 =?utf-8?B?UEU1eUQ4Y2dheUNjSnkraVJaUkJYK1FRTXlzSFUvT0FOdGxiY0FaUlM4OG1q?=
 =?utf-8?B?UWZ2NFRIci9YMDdESjZnaGRuMG9kaFp2RS9UU3BabkZvenRFU2NCR2gvajNK?=
 =?utf-8?B?d05GR3crZmNkTzJzc1BEN0ZrV2svNG0zakRvSE42bDBjclpjWnNBSlB2N280?=
 =?utf-8?B?SmZNTndEUlA0WDZyQW91Qk0yay9idlNlY09VNVpnNkQzdlVyTWVSTjRFdG5a?=
 =?utf-8?B?dDR3YW9FQnlqMDNoVkVMYVJzM2UyRTlIOVBSWWVTREo5WE83V0VyNGNlT1E0?=
 =?utf-8?B?ZCtqUk4wb2pKKzMzRHpEZkx0amttazc0Ui8vaTZIcUo5aGRnN0JZUjQwcXpD?=
 =?utf-8?B?Z29CQWplN1pGcGdFWTV1ZUw1RUVoZ2p4OFBrUmszODJvSUJyRC9pemw4QVhU?=
 =?utf-8?B?dVNQYXZPRGIyano0Z3l4RG5iQWJWUGM5ajlZNmtMS0JIdno1VG5oSG1KcWhE?=
 =?utf-8?B?TXZ3d29GaWNjeVZROWYvTEZLY3ZFN2dOaXZ5b3RHUDhaeWt4T0RBOURGR2Ir?=
 =?utf-8?Q?fTc+0tImMVuqyqR/Zet33ylRIwoZ2aFj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGxlU2tLVEdWdFFRaUMrUE5FRE45enNnamJQWnNVNUVxa2h5YjVzQmRMWFpv?=
 =?utf-8?B?S1JVWlQ0NUt2WUpZUjUySFJrdVRZZnRuOVJMUnJyVVF0Tnp2R0pSSjgzVTl4?=
 =?utf-8?B?RCtOV0RnYUFFMzdOd1Nic3l0SUtVYzdqa3lPU0NFekd5QiswK1dJTk1pV3dD?=
 =?utf-8?B?LzEwSjlqQnl0a1l3eGt1bkdlQ3daTjJUSzRGazQwdHAzQ1c4N2ttVjJ4M1Fi?=
 =?utf-8?B?bkJtZ2FpN2trRmR2amwyTmhVYURGNmd6RENwci9MR3orNi9ZN1d2emRBS2Rj?=
 =?utf-8?B?ZXNsYzEybVNIZSs4WUE1bGpsaUdVdmlxaTVFMEdyM3AycUNyeVFxRjZGZkR4?=
 =?utf-8?B?VkJIZ3JXeEE0VGZMR2FGcjlzWGRCWGl1OWVRT1pNYmZtSGZqRGxIdHMzUGNC?=
 =?utf-8?B?aSttYlRxRnFWaUZJdy9LTVFxK2U0cTR2Q2JjMW9DTm5JM0xTanB5YVAzVnAw?=
 =?utf-8?B?VVNPS2M3TUdPempLRUExK3llWExaaFdqb3I5QWZhWUg4SzBIRFBpZWJoNnlH?=
 =?utf-8?B?RGxMSi85WDJGQW1iYzNsSnY1SUZaaG5lUXFRQy9pQVpDMzd1Z0dsd3lYMDJH?=
 =?utf-8?B?Rnc0YjhLTGJQamxHNDg4ZXpxMW1mT0xvSmlPMUQ3clNVb09hSVd6QnRjaE9h?=
 =?utf-8?B?UE9WaDM5NVl1eFM2ZkRNS1RBTHR6ZUJMdURLTUMvM2ZKK0hnYWg4KzNkcWRz?=
 =?utf-8?B?ZFJFcWwrTDN6QkxXb2V4QSs0RDhVQUU4MTJIWllqL3FVTzljQkpvOUp4UHpx?=
 =?utf-8?B?cDZDNEhMc3FUU3NmMFRiK3NpcVdTWk9GbFpEQmk3Zm9PZnM4NjMrOXZjQktu?=
 =?utf-8?B?M0Uyd00xbUpmbFlnT1FkZDhVdXpvVFFUYy9INHlId2k3Rkh4dUYrRS9UNWV2?=
 =?utf-8?B?SURIMzJObGhOUzlTT0ZJK0UxdWF5QlBXMGxkWnRUKzliaDdxN2FpZ0Y1ZWg5?=
 =?utf-8?B?aEYxdjRxaHptUFJLelp1VXE3cWc0Z1JwMHNmNWp6ZTZXVGtMdXdRREFWbENx?=
 =?utf-8?B?Sk1Ma0dhWEZGS3lhbUtUOWNGNzVlZ3ZqNG9sNVJnVXNjSGRTdklPOCtRM2M2?=
 =?utf-8?B?VkRSRUwzNXNrK3VzbDAyMUxuNzFtSktQK2JWa2V5bmpmWCs2Tmp3YnBSVWsy?=
 =?utf-8?B?S01TeWEwTEhWSGZMZkJLWWZhMTJkL1pReEJPemkrbUNlajk4MEhsMnhRdjFU?=
 =?utf-8?B?RmxtNis3Mjg5UFNrRlY3LzlWcnh1OHdydmJTSkUyZkcrV3A1bGl3YmxwSGRM?=
 =?utf-8?B?bnpkZlMvWDJlSmFYVHlHYVdobzNwaGp5d2luYS9SKzhRTEFHakxhQW1sRWZk?=
 =?utf-8?B?eFA1YlV3c2o4ZFVHV3dEOFpXQ2YrS1hCV0Z1emZVMTgydnVXaCsvbkV6Rita?=
 =?utf-8?B?WXpoZURpNmFlU1B4TytUVVkxc2NyTlZpZU9BLzJManpqRW96SkV3V0ZuMDUy?=
 =?utf-8?B?TERZTm94c0lNa3NrMDV3MDBvSFJmV0UrZFVVam5EMHlKSXkyYmY0em8vOFZP?=
 =?utf-8?B?WHJKcnU5bFg1eW5wYjlBVkdScDV0SUVFOXhxZWM0MzZKNHFEM2J4TFR4QXkz?=
 =?utf-8?B?bkpRRjFYRDdZODVYMVpLaHpGaE9yMS92M1lqZGh2UWVTUUFhRXFwUFFtTVky?=
 =?utf-8?B?WHZWVTJRYnlieFZSeGxGZ3RJSlVMY2RYUWE3eGZmRlBBdWljZUUzekJYeEsv?=
 =?utf-8?B?UFBHRFBZd0w5K05Ha3NvWTRKNEtIVVF5OUgxMTV5SmgyTUlETVZNVnZNTGJM?=
 =?utf-8?B?WHlzQXBCdy9LQ2hIY3d4em5tZmJZcWZOM2lpc051REhNdStuZHZXbUxudTRL?=
 =?utf-8?B?b2dpMTVHbTIzMGM5bXlkaWYwTldrWGdQaUpiK3B2WW5iOXV3dUNqVXFuM3dI?=
 =?utf-8?B?cmhUakJCb0wwZ2xOVHFYRitvYmpzSThveHBLaEZkUHdDNjNXdzJDV3BQSzN3?=
 =?utf-8?B?QUtxK01hUG1tZ3RibjNMQUp4QkllVmZkOTBBTHkrbXp4QXcwNFZSeURkS2J3?=
 =?utf-8?B?S0QvQ2M0MDI2bGZ1YU9yMm8zTGx4NEhuR20rVUZXZnB1dkFZMDl2ZGUxUzU0?=
 =?utf-8?B?c29hYlFjS0VBNndtQnlUbzA1U3RYbWUrdUhkQ0gyR3BGRFdERXVBZTRBc0Ni?=
 =?utf-8?B?Sko3Undldy9UeDRVQlg5RWhZU2NvalpBYzZNaUJHbm1VaGlhVDk5RXZIYURF?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bce6a01-c60f-42ae-1f96-08de04dcd981
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 13:32:52.3449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: btF6LmQi+0klr0/OT2RcEHpd6a6xmHw4ubj056sbO66PdyREGIvo8x2UnKt+7MlRHgSliWsHGii9Ct2XQv7FvSB9TJ+CDn0naLF/wnD0AC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5817
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2025-paź-05 15:36:40 +0200]:
> We already have tile-based printk macros, there is no need to
> manually prepare MEMIRQ specific messages to include tile id.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_memirq.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 49c45ec3e83c..0affede05820 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -14,16 +14,15 @@
>  #include "xe_device.h"
>  #include "xe_device_types.h"
>  #include "xe_gt.h"
> -#include "xe_gt_printk.h"
>  #include "xe_guc.h"
>  #include "xe_hw_engine.h"
>  #include "xe_map.h"
>  #include "xe_memirq.h"
> +#include "xe_tile_printk.h"
>  
>  #define memirq_assert(m, condition)	xe_tile_assert(memirq_to_tile(m), condition)
>  #define memirq_printk(m, _level, _fmt, ...)			\
> -	drm_##_level(&memirq_to_xe(m)->drm, "MEMIRQ%u: " _fmt,	\
> -		     memirq_to_tile(m)->id, ##__VA_ARGS__)
> +	xe_tile_##_level(memirq_to_tile(m), "MEMIRQ: " _fmt, ##__VA_ARGS__)
>  
>  #ifdef CONFIG_DRM_XE_DEBUG_MEMIRQ
>  #define memirq_debug(m, _fmt, ...)	memirq_printk(m, dbg, _fmt, ##__VA_ARGS__)

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.47.1
> 

-- 
