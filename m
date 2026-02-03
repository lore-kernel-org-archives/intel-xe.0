Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C209E8783D
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 14:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3905D10E6A0;
	Tue,  3 Feb 2026 14:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MXKkOB7P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960F410E6A0
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 14:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770130713; x=1801666713;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=UNUhTjx4uzBnbhEh1lWJ3ryLG6tyEi+ESagLTqnvvK4=;
 b=MXKkOB7PdBd3b4cFjhDAoWzJRfpRF2BcvOAPsL7fupQHd8M42qKHEArK
 Jg2D8bfZHp2yEwSIX7b75k/nxdQMNH4Oj6+DMHjvEpaaocuM1WMBAB866
 UNo/22IA5NUlxXAYfxwClRIVXLiUUon9lGo8cbwvdCFiZ812jYBfr0FcX
 w600On+PKER+pUgdfVSAP6HOf8VKxoltu8Iv6zrCfcwcu7mEQzwiMxQh9
 xPEUZGrR22WNP/pVLR6h7MXdrXYZEzFEnnOd10WuKCh3JzdQ+u+4hM88B
 syuJ9Q1lc9RVQmIujytLcCXkK2jwfMKP98nJGiAvZQunkYocDumQ74v5j g==;
X-CSE-ConnectionGUID: 7IgdYgXSTg+tS+pbFQduUA==
X-CSE-MsgGUID: seCOz87IQBGBLcbVvsSgHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82728294"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="82728294"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 06:58:33 -0800
X-CSE-ConnectionGUID: A9Kzn7iZQv2Er57oG8BHBw==
X-CSE-MsgGUID: oEpX9F2kQG2fGMEz6O7SOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="247470727"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 06:58:32 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 06:58:31 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 3 Feb 2026 06:58:31 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 06:58:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pB3SZjaE5RpP6UI+uzS/vZUPYhUW9bW5tTGBb+3lt/EyesUk4PnNE0Urf3NnLyMnKExBOZdEzV3Wu3RY5uXUGmKy2pOQYZdSkc2JW+QyLuRCYcR1U3F+w5kXXPR6i5873SCINyp3I4eNP9/ue5tPRc7ZCbABIb+Z4AyhcL0LtPzD4V1ts/ioxBt40WhKTfISFaFaU5G4WBLOETHm1HWSbHt9Us7K2X5wqvb3yLIMNfNr0nASCH2qWp/K9/I+zWfILCmhFoMf9Cr/+rC1hGegUCxxIO17jcDL/UpF1penP2fdd9KQE3/WguSNF15tPKtEiL3KpMV0XZKt3CqeFn3Qpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p04Tc+G/2emhrjsKQaDgXWgf8Bk2KmQKoCn/koxyoao=;
 b=GvYI2zBcEcPlvCb0qv5hEnpGIdw2NvACznX69EH8/I1eb8CwZnfdO8/ANtJPUYgSLjTl00dCdWRQXAM48GNsT4TEJUfkB8h4nlzyikd4DKeA7YeWmwmNKKsP4VxEudM6QaAUH9qTSSdsAB4STRVLm9yb57J5DeFAqrohfU6KC70dR3P+hsm+RlXd9vSQzft+FlhAPLkAXFtoU5aK0VU4NJHoyq1kUxihxlaliyzlCBkcUB22cAkXpbUxF7nbM+z47RSbkAAzOZJdxzrW1TORw8C1/OE/wKCotETOgDSkv9AfjjPWPLOjjX4Nep7oEwS1oWW9EXqrdHWxhLLAbfkztg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM3PPF1CFCD9AEC.namprd11.prod.outlook.com (2603:10b6:f:fc00::f11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 14:58:29 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 14:58:29 +0000
Message-ID: <b1008074-df70-4267-9c98-91fb7957d1df@intel.com>
Date: Tue, 3 Feb 2026 15:58:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/xe: Keep all defaults in single header
To: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260121214218.2817-1-michal.wajdeczko@intel.com>
 <20260121214218.2817-2-michal.wajdeczko@intel.com>
 <716600dcc0dd91626f45eed2faadc6d80d456de9@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <716600dcc0dd91626f45eed2faadc6d80d456de9@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR10CA0101.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::30) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM3PPF1CFCD9AEC:EE_
X-MS-Office365-Filtering-Correlation-Id: 851e088d-9f21-46cf-eb67-08de6334b0d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTc4QWZUUmtYcE9RcFFkR1VUMUZHTkdHd1J1U0FtaDcrS01DS3dSWjlyMGdL?=
 =?utf-8?B?U2N4S2g3TjFDOThTQVVhRzl1NVl5VDQxc3diSW5EUFQ0RVFHQmRFVVhERnNK?=
 =?utf-8?B?L3pFUkVReHI2KzZINmNHcHJUZDlISHkxRldCR2NIOUx3Y0NtOGoxYUF3UUk4?=
 =?utf-8?B?dmJiWDBFT0NqQ1RQWW1ZdFVEOTU2NTEzNlI0ZyswQ3hjVjk0TjRyaTE1Z3FH?=
 =?utf-8?B?dFUrMlU1R1FsQi8yV1FZOGhHeDB2aU8xTVVmR2l0cEVqWXQ4OUZlUE9pNE1D?=
 =?utf-8?B?UFM2MWdrdjE1Vm5jMDRqRlVCa3kvYVJWQnFaRW9WS1NPQ3RnWll2VmpaTVBx?=
 =?utf-8?B?V3JOVnBuclFSZllpbkUrcWNjTFJLckxJL2lCbndFcVZXaTVwYlZvb1JiZ0hS?=
 =?utf-8?B?MGgvUGNrbzJHT1lUQmhWVWxkaFhibVAyWCswbnI2Lzc5YVFLa2ZaRGJQSzVD?=
 =?utf-8?B?V0ZJbVJXSWl4VHRjSitTMkhSbXlXQTJNTE9EQjN3cUVGUjNhTUFuYndhUDRX?=
 =?utf-8?B?MlBIeTY5VWFXWVJyc0JGNm9mVGNlbU5pWlpWaVB3NlVKYjFZb0ltM0pVcHJu?=
 =?utf-8?B?UitIMDFmS0s5NXRUcTdSZHIxTmNDRUhydmZGZzJzSk9FaXlhcWw2elU2K3Vq?=
 =?utf-8?B?UkFsMm9FTGRjelYvbVlHY0pLWjk2aUhOZ0pCc0hkcmxYK3VnNmdRQjVJTENZ?=
 =?utf-8?B?ZkNMcnJNQkJ0NUlENkdtaDZyNWtkakI0ZURVcDdySUVDSmt1Mm1JNVN4ZnVM?=
 =?utf-8?B?UWpuVW52Um5ENllzRi9FeGc3QW8vOC9vS0RBSUxqM3ZjSDNGbzF3MFJrNDJk?=
 =?utf-8?B?L1hoamVjSm56SUpSdHFmUUo4RkJrbjgzWFBHN3c5WkF1RmtBMjliV0o1QTFy?=
 =?utf-8?B?OS9VTy9sbmtHSkNDRm84L0F3NlBETUV2dEFjYk5SMVRKSklPME44OFpSY1Y4?=
 =?utf-8?B?bStnc2FnS2h0ZE9PWTJROFBxZ243WXZiUlZFNkxWQjlqR1hIcGVuS3BSTU5E?=
 =?utf-8?B?ZE93V00vUXdxYXE4SFFqSUdHeTB2QTJ1aVoycGpvRGtzM3ZPRjlncW1yRm12?=
 =?utf-8?B?bzN4djR4U3U5TVVkVlZPMFR1N1llWEJmT01teU1BR29VS0ZzQUVQSTlmcnJm?=
 =?utf-8?B?bTV1NENRNUN4NmxZR2VhOWduUjBpV2tmTmFyQk9PR0JWTU9NejBGNy8xN0JQ?=
 =?utf-8?B?UUlqL04wQ1h4NjhMc1ppWG9XOXlUeGNRSEdwVVIyakN0Szdac1VxV0NXYUdn?=
 =?utf-8?B?V2h3bDVCdmJzOUN2dE1HZlhvR0lmNlRGcjZMWnRCUmorcXpueFFVWVVtSm44?=
 =?utf-8?B?OXZheDk0U2lJTVdURm9sQ2tkUXE4NWRXWE9LNmJiMkFrQWFwVTEvSmJoREFp?=
 =?utf-8?B?S0MzVXc3SzZkMzhjQW0rSGt4UE0xRjNra21CbFBaVzkvWEVFZUpQMS9QLzRj?=
 =?utf-8?B?bzFBa3ZBaUJRbUhoRy9aVGNMdUFoTDBJWEpVanVoSkNKdEczMFpMbzcvK3lW?=
 =?utf-8?B?bGlsNjZOY3pOb0VzUXNIamJOaGJYL09Ca1FMdk5TWTRMWngzTWR2M2kwQjg5?=
 =?utf-8?B?bngwRS9aaUNVWml4Q2dxY1BTZFBPWHFCRHJqVnNPcjc2Vyt2VFlYM3JTRlgz?=
 =?utf-8?B?V2VUWlR1Q2tGUkNpZ1NSZ21WUDN1eWRtWVN5QlFFbUdmb0hNeE1zTVpPNkQ1?=
 =?utf-8?B?TCsvWnVvK2hkMW1CVDlValp3dVNOa3NmMWNLNkk5cncwN3hHK2V6V25WY1Ey?=
 =?utf-8?B?TDV3QzR3cGFGVS9ZQkl3VGsxYXh0ZG8veitRVDZ1NUJrL204aW5DK2tDeXpD?=
 =?utf-8?B?amVtdjNBbmJCWkUwOEs5T3V3dGlPc2htWllEV0ZjQlFCV0VVSjQrVGQ2Qklj?=
 =?utf-8?B?NzZpYldhT1Z6N2FJUVU3U3VoUEQ3ay9KYU9JVGV2cmpnWExUWU1CdGtZajUr?=
 =?utf-8?B?NXZ2Y2tod0U3M0dxYkloOSsyWlpRaUR3U0p0NFhITE9OelptbHB3eDhud1pW?=
 =?utf-8?B?S1hRaXQvaWZYU040VW5FSVZ6QUQzeWJPY2dLQkFsSzdkajhaQXBSOTJ0QTk4?=
 =?utf-8?Q?GGuTOQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0V3Q0plSzZiSlRBWU15M0VpaldmUlVCUi9LVHZNZUt3THl6bS9Ma2Z4T3lF?=
 =?utf-8?B?RWhNbmJ1UkY3algxcjNMYzNjN3pGMi9tSmNQQ0dzdm1Ud3dMckViTHBPZ3pY?=
 =?utf-8?B?SFlydkQ3NDFVUDQyd0ZTcnFiWE1EK2M5YnBGclJ1RlhRcGNFc2JPeGNublFM?=
 =?utf-8?B?T1pYMGpkTmtLK0lBdkIvMkxSallqd3lSM050RkpIVy9OV24xdDJjbE9PcU0w?=
 =?utf-8?B?NTRGRVVtU1NCWG1FYUp0b0wrcmV1RnhDQlphOGwzUGVjWWordEpudE9SZGN5?=
 =?utf-8?B?dmVBSVpOeUExVmdlY29zaTJnK2lEbjZiVGo3dS9DSUsvQnpnQXdNNE1JWjF1?=
 =?utf-8?B?V0wxN3BOajUvRmY5dXZnRXNGV2krVjRNNHlvekdVR1VBVHYrTS84NU8rRnNQ?=
 =?utf-8?B?TzFYaDB4WnNrN1g2b1lMbXJTS1FNb3R4b0JHRGlDSFQraHpSVThwN1pqOUFV?=
 =?utf-8?B?KzdDaDQ4ZU5meGxFclFTa1IyUHZ0YUNLazIwcWlpaTJ3M0lHNkgxaitHT3lk?=
 =?utf-8?B?TStaMVNEaUZOQmFlejBmcUxSNFc4V0pVaHNreUM3NithSVZnVHNWYTBYbnhC?=
 =?utf-8?B?LzJwRDdxaDJDQWFsVWVUNGJ1ZC9WUzhBTENSS1A5cGV5am5HR2g2WGNtSWs1?=
 =?utf-8?B?MWJhODZoVDVRVlU2eFZua3AyakZmL3YraHNzNGc0c0N6Qm9KVHNmOVRMcGh6?=
 =?utf-8?B?RVB4aTZnNmdxbHZwZENhU3JkWm9MSWsybjJ4NGlGWDlqUUVDU3VTd01ZSHFq?=
 =?utf-8?B?WTREYWMyYXExSkI3aFdRZDQ2WTRVNmJYUjNRZldxR1JORW92YS8zYXNsazJj?=
 =?utf-8?B?N213QmNtdG9WcExuVXluUkZ6Wjh1YWd2SGIrRzZYaFBjcDJRV1A0RHgyb0JB?=
 =?utf-8?B?OFFRRlg2NVE5Y0RwRGg1cy9oUHdUZ0lsR0R3YThDbnk0UmlGNG5QRVRBTGg0?=
 =?utf-8?B?cUt3aG0xMGVINENhRWJyS2RyYVIyL282ZncwMXcvRzRUUlA3ckx1WnQ2QnFE?=
 =?utf-8?B?aXUvSHNrTStNT0gwMS8yczE0WVU3bmVXZ29WczViZXUxZnJaeTB6emxkMHEy?=
 =?utf-8?B?K1FIS01TdTBEenJHUm1wNmp6b0J1K3NtbUo3K21ITE81Q3MvYk9uamdtWkNH?=
 =?utf-8?B?NEhGSXQzSWZFeFNRY1AzSnJhazI5Q1c5Y0k5MTNnWHQ0QXV4RDVXSnNNSjR6?=
 =?utf-8?B?S1BHaTQ4S2FRclY1V2MwSTI4TGtPcW5TM2JRK1hhNHR6alRNc1Q0RlZ2czdV?=
 =?utf-8?B?ZHdDYklDdnFsWlorMXcyRHF6a2dHTjZDL1ltM0l6NkZleW5EU1o0dTdBNWZp?=
 =?utf-8?B?VCt3ZUFVM1NyVVR4QmVlNkNoeFN4dXVuUitqSzV6WTZ5emwzNGpBc3VuQUh0?=
 =?utf-8?B?MHVYOEVNT2hDUmN2ZE5CTlhUVFo3N1JMWERST3hUa1BUaEdYRjltWEIwbmI0?=
 =?utf-8?B?aktSbys1TGthVE9yVWFabnBqZWU1TkNmRGh6a25CU1l2WVJMQnNnR0M4RjV2?=
 =?utf-8?B?MWR0N0hpYVRVRW81UGpDeHlDV2N0K2Z4UEJOVWpxUkNCVTZiSXJLSzlRMk9i?=
 =?utf-8?B?RUpVWVlabklQU0JDVFRna0dUWmVNRlU5YUFWRTZyTHBMcXNSdTQrTVNyRHMy?=
 =?utf-8?B?NC9razRsWEkwYmVXQUNhNnNFMWlRWkwvMk93UXZLTnRYMklUQ21xSE94VFJl?=
 =?utf-8?B?UE9yTEdaSWhTT09NRS9VZTlleUl2cXBPMkJqSGF2RDNFUVFweXpqcDJTRjRP?=
 =?utf-8?B?SUpidC9JZzhTNW9kUk5zZ1kzdTNmTlRYbERjZDdqKzZXTFpLeE1ZL0pFZ1NS?=
 =?utf-8?B?cElqZDlMcTNxRGpqVXBlaTFNb0tzckgxTTdKRlRHOURvMDM2Q3VSVjE2WVVL?=
 =?utf-8?B?QUFHdFZMaDdLTVJ0MStmVnBWYmhmaGlXVHk0dWl4YkQycUFHWFphczhwaDJK?=
 =?utf-8?B?NHZjaFozLy9BdlFCc2YveU9ucFBFQXZVOTNEQk5wdENSRHBmZ3hWaXBWWWg0?=
 =?utf-8?B?VmtaTmVqNnRvbHRwU1JqQlNZdmplcW9OdDFENjVVMmI0WlNkS3RjNGgrbXJX?=
 =?utf-8?B?S3lWMVNYN3g5WDNvdSs2OXhGd3JNR2lNZnc0RWg1WWc1U0FrdFE5L0hBMXlI?=
 =?utf-8?B?MFpyMGR4ZU5WM3JCWml4MlZEWUdtbkp0ek1xYVB1QTVsOXFtdmFTOXR0QzVr?=
 =?utf-8?B?cEhDQ3ZwK2wrNnkybEVUMUQ2eHF4Y3pydTZtZFppUVFUcnh1NjRkU0RzOFl6?=
 =?utf-8?B?ZXp4R0Jhb3ZwUEhMMlZKb2xkMW1GUHdNeFVrcmw2V25POE9kNEhnbjFlSzFk?=
 =?utf-8?B?YmtMMUlxMHFPWEg0clhBSjFTMnJzVlZ5WW9JODB5Z1B3akNKc3p0VWQ3aUJC?=
 =?utf-8?Q?1Ham9Tj9LTsihWUo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 851e088d-9f21-46cf-eb67-08de6334b0d5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 14:58:29.0925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TwsDSB+Q0oI/IqhmOZoNubs1iJNYGYe2a8Mki2c1D3WdK2oN1Yzxngw39tXfSz/28ufItwtjSB+Cpr5ZknOtwRFnvY6ayp6mwxLsEHMj6DU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1CFCD9AEC
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



On 2/3/2026 12:13 PM, Jani Nikula wrote:
> On Wed, 21 Jan 2026, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
>> We already have most of Xe defaults defined in xe_module.c,
>> where we use them for the modparam initializations, but some
>> were defined elsewhere, which breaks the consistency.
>>
>> Introduce xe_defaults.h file, that will act as a placeholder
>> for all our default values, and can be used from other places.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_defaults.h     | 25 +++++++++++++++++
>>  drivers/gpu/drm/xe/xe_device.c       |  3 +-
>>  drivers/gpu/drm/xe/xe_device_types.h |  3 --
>>  drivers/gpu/drm/xe/xe_module.c       | 42 ++++++++++------------------
>>  4 files changed, 41 insertions(+), 32 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/xe_defaults.h
>>
>> diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
>> new file mode 100644
>> index 000000000000..9183d05b96e1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_defaults.h
>> @@ -0,0 +1,25 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +#ifndef _XE_DEFAULTS_H_
>> +#define _XE_DEFAULTS_H_
>> +
>> +#include "xe_device_types.h"
> 
> What part of this header depends on xe_device_types.h?

enumerator XE_WEDGED_MODE_UPON_CRITICAL_ERROR

and yes, since it is used inside define, in theory we can skip this include

but then it will be a responsibility of XE_DEFAULT_WEDGED_MODE user to include separately
to avoid that I decided to have explicit include here

note that I plan to do some refactoring of the wedge related code, see [1]
so this might go away, or be replaced, in the near future

[1] https://patchwork.freedesktop.org/patch/694454/?series=148214&rev=11#comment_1278190

> 
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +#define XE_DEFAULT_GUC_LOG_LEVEL		3
>> +#else
>> +#define XE_DEFAULT_GUC_LOG_LEVEL		1
>> +#endif
>> +
>> +#define XE_DEFAULT_PROBE_DISPLAY		true
>> +#define XE_DEFAULT_VRAM_BAR_SIZE		0
>> +#define XE_DEFAULT_FORCE_PROBE			CONFIG_DRM_XE_FORCE_PROBE
>> +#define XE_DEFAULT_MAX_VFS			~0
>> +#define XE_DEFAULT_MAX_VFS_STR			"unlimited"
>> +#define XE_DEFAULT_WEDGED_MODE			XE_WEDGED_MODE_UPON_CRITICAL_ERROR
>> +#define XE_DEFAULT_WEDGED_MODE_STR		"upon-critical-error"
>> +#define XE_DEFAULT_SVM_NOTIFIER_SIZE		512
>> +
>> +#endif
