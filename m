Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5A5C2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 09:23:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD31110E200;
	Thu, 27 Jun 2024 09:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KKAGDHus";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1502510E200
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 09:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719480218; x=1751016218;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QP/5LIfCPcwROKqWx/vKBgIdukXGv/pU2exlxqHt/VA=;
 b=KKAGDHus20EAyIlISSPMJGKNqzZ/rr0oG1q/EWxGwYEeddrU4XClGfcg
 UHbeRILassdU7DoNTmLlzjWsrNpJiO7Kr3OFYyPAFEn4qDxDTt7eTrdNQ
 zIxUw4IgoK5EM67cYnanGJujEjzucoeYt0aFSyKY2xSeZS6RAqIaJd5qT
 Yv69018EJ8obifqDLWKLA/bRNoXBfq4PCNoShQ31KmBUHDULDNuBGjH5U
 TzOZjpBY3vYK4i9YO767sNsVnPhPLlc83PFc2KIz0Cn81ly+zWBC3tFva
 p7a8RH4NHopTe1kguQPVXJyBDukcpElEnlST7p72udLMyKy97jozpAZep A==;
X-CSE-ConnectionGUID: 5+DBD+zwQnGh6dglnYyXjA==
X-CSE-MsgGUID: Akj4ehqdR7G2LZNh1WVgQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="20361456"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="20361456"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 02:23:36 -0700
X-CSE-ConnectionGUID: P6FlQWscTsOO5irMVqj9Ng==
X-CSE-MsgGUID: uWuzxDHMQ9iI841rKUNDPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="48921415"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 02:23:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 02:23:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 02:23:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 02:23:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WpQdqc36fVti5CtLK4RRIuKiyngy1ovsRrPRLizGv+diG4vhkTDcmlKLTurBMAQYGSy7x0d9WQRq2NZDMdUQzAhDHIfRAxJ+LWM9WJ8vHW487SrY1cDVcL1cMdtk12dJLvWhKXDzHa/7+QrzW0qlkkLL8awt1Wyy/FwxE2dZQ/bFFBg/lYRfYHRcsM0S+wfiDcNKrzkXUBP7rQdQgoWvXUeghcDi9KjiZ8XRU7MkpiqYfD6dq4LfO0YnsLykBHfkZxf7lg3FFLLL0fglYY69L18N1SoUO62sf8DpkBC53j7VizJNtAUj/+y9HJDU7gqcBWe4td3EjPnxbWyjGIFhGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoNgrSUyx5jfa1Cjse8JboB1Xf9LFQmMzQ7IjHdqtP8=;
 b=CDMsqnMwm8Z7MrJ48r0xBSyt1mePGADWy9Qvs8WqQMP3wuK1FoZcRMrUKGNoGTEjeOTez3DllvhZ1Pl8nrMBGZUgxc0633SuMjZAHhERcvKyxq0mUXhtY8Nky3KPpjVBJlAJiJSogWMAtN6kESkqTF2Q+UNwiUJG5PbYEadhKDM4I/2B/GK7+xrfrTgFwLJTjne7UcS4CAU092d5ypFO+0mX0b4hn0PliZUqD3iSm7/mOgifgwW99/YsP5SJYXT3ThIutayb2L/P9uM3JuQS7ok+5MOM4QXftiQe2n1Oxaq/oQwvbhVCf/LHkFb2/RVp1LK39gwZ6WteHkWEGOh7EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA1PR11MB6565.namprd11.prod.outlook.com (2603:10b6:806:250::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 09:23:32 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7698.017; Thu, 27 Jun 2024
 09:23:32 +0000
Date: Thu, 27 Jun 2024 11:23:28 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/vf: Track writes to inaccessible registers
 from VF
Message-ID: <20240627092328.hdk46cnrji6mi4ax@intel.com>
References: <20240626084304.1345-1-michal.wajdeczko@intel.com>
 <20240626084304.1345-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240626084304.1345-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: ZR0P278CA0209.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:6a::26) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA1PR11MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: 74d48b05-52df-4b03-f461-08dc968ad034
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3ZjQTY1MmtvQmN4QUdHODhJM0RmTnROMWRBd2w3SUxLNnVHZXFqcVRBaGVW?=
 =?utf-8?B?a0NsMzBZdXVQVm1FM3ZMYVp5NVJKaHphZWE2azdsU05oM1NuT3NzNzMybVZh?=
 =?utf-8?B?dm90Q3crYUxhdXpoU3dpRjJMZjV4ekxJb0FnOVN5OEhOS3BRakYzNEU2Q3N3?=
 =?utf-8?B?aFJ2QjF5ZFE0R0p2VVdhdkFSWkVid21Bcy9lajFSYUlGMGpPNkNJeXhWUzJ0?=
 =?utf-8?B?QzB6TXdhZFVPT016KzJZZmxpbEtoVGRWNzNnNWJzektEZG5QOGtrZFZPVUw3?=
 =?utf-8?B?VE1rajBXWXBBaHlXaXVvT0ZvNlh1Q0laWjR4b04vN1dXM0FEUHhqMEZvZGJI?=
 =?utf-8?B?cW1ZSFVsN3V1bGdRbS9TQVVnbWR5TGdQZjVmanhFdS9IcUJ4bHgrbWFQMUdR?=
 =?utf-8?B?SHZTZmZzL3lVZmE5QnNyWjMyNTBkWU9ybU1JeWo5dENaelhuM2l0SlRtRFp3?=
 =?utf-8?B?N2tUamtLZXIxUG9UcnhzTGNJd1FtN2ZFRE96Qjk5TWNBU2toNzJRWHB1ZGo0?=
 =?utf-8?B?OFZ6TndXUkdCUU11K0xCMVUyUXFsZ2xqWTZMdDhTWlpjK3hUajFucWRCU0g3?=
 =?utf-8?B?WWx3OXA5MGJXWHpJMkhtOGI3NGhPWHZJWXgwMDRzTFZKRzBEMGhJdTc3K2Nj?=
 =?utf-8?B?eUpQY1ROb0hIQUNGYVY0TWdiTmxIZEtDWThlOW1XMHBWdkVFdnpYTENqWDQr?=
 =?utf-8?B?THJXcFpkRkQ5UGE5MGJaSGFuRXhsKzJEVXVzMDVFRysvRXl1YWRsdlpjMDl3?=
 =?utf-8?B?UGdOYzVYUjJSMnJJN0pPUzlBaE0wN080MlBOK1dYUXVhUWw1OFhlZEVDSVdE?=
 =?utf-8?B?UkhOWTk5YVZXOXUwSmxGUDV4LzVjMEJrTGNkajZHeUpERDRzNnJyb2VtV1Uz?=
 =?utf-8?B?ekJrMzR5MG9XTGZ5R2UxZEFlai9OaldncE9GUVRyMjErcldPREREcjJOZjJl?=
 =?utf-8?B?ekNlQ3A4ZlpzYVd5UCtFdmZQZDdkZEFZTWdMVTVQbmRaWEdCbDd1bDJZODVD?=
 =?utf-8?B?cUM5QitrazJtUFV4M0s5S2tSdEM2d3dLNlVkaUZLLzhPVHF3a2xGOUhISVdv?=
 =?utf-8?B?QTdRRGVGSjF2NFI1SmVrUVllVkhsdGJDempuVHBua0VaeVRYQWVVTTYzR0FM?=
 =?utf-8?B?RTdPMzNDa3V1MVI4Tm5VeXdGcjFjZmhYUU5ZVEcyODhuNXA5MTIzVVRvMWtW?=
 =?utf-8?B?QkJUSWx5Sk5LeVh5WlVPWGo1MWZra2MzOURzdCt6enMrSTg4OWZVY090K3Zn?=
 =?utf-8?B?VGVRV2tCRTk5MFI5aTM0L0V1OFBHd3RJa2FhVXZ5TTVFenpNNncxSU5OeVY0?=
 =?utf-8?B?OHNmSm1Ua3ZNQkx0d2JETXdVeE41cDhHUTRYeDB3bFF0UktJd0REUXZpa0dH?=
 =?utf-8?B?anEyZXpIR3pKd2F2RFBPcjVHZGUwaHZQdnpqT3BpazlBRnhZVmJlc3g2MXov?=
 =?utf-8?B?TUpaUFFUemczeXVQRTcvdXRocWFHMGZTenBxekdjZHY3RUU1bUszV0lnSWI3?=
 =?utf-8?B?OVBKVjNQTlNHV2hHRnRoeDJRcVF2dlJNMVY3bEtXY3NYMnlORnBjdkNqUmNV?=
 =?utf-8?B?cDNzOEZ1YUNyT1RZbC9NbWpzZUY5WWJjRHJiSVl2RzZmSXJCU3QwOCtRK09l?=
 =?utf-8?B?b2xORlBVdFI0WDhFdGR6TktVaWczQmE5cUE4SGc3L2xKZGo3NmVwNUo3dVhR?=
 =?utf-8?B?NHV1MGJWbW1reDdXeng4SWg5aEczVHdGLzlHVUJRU2ZMdGJDUTZSb3pQdFNQ?=
 =?utf-8?B?T3BXR0lpdE43RFhUb014T250TjZ4RXN5UlpHdkpXc0UzblVrVkhQZjh1RERw?=
 =?utf-8?B?QjVJQTFPT0J1dW05ZU00UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXZxcTRnc3V1UUxRVEljbHZOVzV3KzhwMXVYS2VWUWlzQzBRRWw2NHlKYzVp?=
 =?utf-8?B?Q1lqS2pabGQxekNkU29NTTZiUmZ5ZVpPQTQ1c3VWbHA2bzVldGNFVFY4OUNM?=
 =?utf-8?B?YmJTMDlIVmhOK3hOTnYvbmdFOWlMT3BaeGp4b3hpaWJ1cUpwQS96TWQveWRu?=
 =?utf-8?B?QnBkczk5WFBWdVF4c2pHNU9DNDdtSUFubFM5cmRXQmZwS29GeVNLcFFIZVU0?=
 =?utf-8?B?ZVNtb3RwMTFXcUdLelRkSFVHc05ZMCtJbStLRkRuOFVERWw5OHIwS01iUllj?=
 =?utf-8?B?T2lTUm1HUmpMdlp2ZXlLMjc1T3FTdFdLMnRHUkZ5aG83VTRxejB6RVVPOTNE?=
 =?utf-8?B?c3pocXJXZ3dOKzA3YVgxc29ab3dickgzQVJoc3VBV3hjTlRXaHl5QzhWY2lS?=
 =?utf-8?B?Z2FyVnFWZ3NTNFkwM3Btcm1yVzFwUkYyc2d2eGNvcU1GekZMOUpPQmFNSG83?=
 =?utf-8?B?VnVsendJZ2FaK3RoZTBBa3NtTy8zd3p3Rm1pRDNhb0hrWUc0MndXc3BrQTNa?=
 =?utf-8?B?a2ZQTHlsYW9VSDJZMFN5azduaGdVZk5wY2NjaWRrMUR6aS9WZFQvS1YyeEF1?=
 =?utf-8?B?ck9Gc1pnM1NZVVk4VnQ5b0dUWE9vSjUwV0IxVE9EV1JkTkwya1ZuVWplK1J5?=
 =?utf-8?B?UXltYmZEdnBpbS9FRFlDaTZNSE9DajRCUk9wQWJJMGNsYXlGTVZGMWVQd3Jm?=
 =?utf-8?B?SFFjaWkwVk5NMjRMR3AraWc2WHhzdWRuVXJsOFgvaWpKUE1iRXJOUm84N3N5?=
 =?utf-8?B?djFOTlhYaGkrVVlCU2RpNEovN1pNS0pZOHZzV2VoRlBEb0duNW4xSzBpZk9C?=
 =?utf-8?B?bUwzeXBKTjNYNFpoVEJDVWxkNDJkdHIveHpUNHhsRGtreHIzeU5FSFRqOGRR?=
 =?utf-8?B?VVF5K2Z2cWIwOXp1TUhHRGxmeWlVRXZpMENFY0d1c0xBMFJNbm5hRSsybmFH?=
 =?utf-8?B?cDE3V2NOUEE2a2c3UnNsQTN1Y0FVdEF0TnN0M3JMUUJ1ZUFSQ0ljTVZqRjE3?=
 =?utf-8?B?TmZyV0Nuck1xMzFCY0orOTdqWnR0QjhFUGVjTUJiTGtiQURQZUR6MC9HUHE0?=
 =?utf-8?B?MHkvQmhEL3laeWJQZWhSOFpoSlJWYTFIaWsxWHczVFZqTVRHQ1l1MCtSOEVx?=
 =?utf-8?B?UnB1WER2YVhrTVVySkFqRnZGOHNMR1E0U1cyeFV1MlRBK3lWcDZzN2s0ZzFj?=
 =?utf-8?B?YzBYMm1SdUgzbWEvdTFIWC9CVWt5bmpWTzc3aG95ZEdRcEMvRXZuRzJndzdF?=
 =?utf-8?B?NlRNWXh0RENUZ3RGQmp5eGNZWTZSaTJaaXg3RS9LSEFvNDlFM2grVk5hRG5L?=
 =?utf-8?B?S1YxbURQeTcrOGtwWERZNFFSNFRMQUJzQWQ5TmltQWpZWkYxS2FnSTRxekp0?=
 =?utf-8?B?RWxuaS9hNndZSW9oSGtoWlhYcEk5ZlNrWVhsTDFmRnNLY2gyVHNYVnRtb1Bx?=
 =?utf-8?B?WkNCVkh2dktiVTcvVUtCYUNKZ2Y5OHFWVWFaNTE4aTlkamJlejhIcXZhM09p?=
 =?utf-8?B?ZXUrR05TUnZMZGRWcGhER1hRQ3d6REhWUk14Zk9ENm9Gbm1OY0I2aXdoN1dV?=
 =?utf-8?B?bTRxQ1hOK3pJeHQ1VDJZbG9PQTdEN25yVnlMYml1enNYU1pqbVY1U2lmdG9i?=
 =?utf-8?B?RWh0K3MwMWE2MUN1cVZXRU02WjJlK0RoOXlJV2FpeTBVRkhHK0djSWQ5dW0x?=
 =?utf-8?B?ZU9jUUhDSFNVcWFEWjFieWZJUHlYblVtcmkreWdCVmMrT0tRQStqdU5tOWFK?=
 =?utf-8?B?bVE0c1pCMDhnekplN29aUGJMNDJMMDM0dWExWW1pTWlXalBMNVQwMU8yU3Ri?=
 =?utf-8?B?VUIrQWZEOUlmaEZOQzlJRHdsVjFhWDFtRVpJeGhZcDI1M0oyK0pmQURyTTQ1?=
 =?utf-8?B?TlllTVhlOXpIVzNFTDZTWWdtSGJHYUMwYU0wOWVVMHRMazVKdE1va1A4ekFw?=
 =?utf-8?B?ZE5kb0Z6ZHdzdEdyZmg2S0xaQ0hyMHJKMHdRZ3BwTjhuNEUycGRiM3RuZXVt?=
 =?utf-8?B?UUZEbWhNLytXOTdWUVVuTDN4bXI0UVFoTEdHbFhhOWoyckZNZlhxWVlYVmZJ?=
 =?utf-8?B?aWVQanFFbzlWbXlIbWtyWXhZN0M3bVhyUmNSVUx3b0dqVktwVndjNDVtZkg3?=
 =?utf-8?B?aHAxMldYNmd3d2ZHNmlKcEdUdVpGdHpIcmVJU2NSVS8ya2V5ZUJzWTJyN1pO?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d48b05-52df-4b03-f461-08dc968ad034
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 09:23:32.4146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJVTNtZrmv8YqojSIuBT8Ide4n6ZJx6WDDNZTjQnl0rUosyh1Mrdn0ez+7tJ5+t5C4rVgDr+BgGdNe6OGZPHa3cB/MLGk8IUaDpCOtgdriU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6565
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2024-cze-26 10:43:03 +0200]:
> Only limited set of registers is accessible for the VF driver.
> The hardware will silently drop writes to inaccessible registers,
> but to improve our driver lets track all such unexpected writes
> on debug builds.
> 
> We will explicitly allow bad writes to SOFTWARE_FLAGS_SPR33 since
> it is used by the driver just to mimic wmb and we do not have any
> similar unused scratch register accessible from the VF.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
> v2: update commit message (Gustavo)
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
>  drivers/gpu/drm/xe/xe_mmio.c        |  6 +++++-
>  3 files changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 41e46a00c01e..36cefe3161e1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -892,6 +892,28 @@ u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
>  	return rr->value;
>  }
>  
> +/**
> + * xe_gt_sriov_vf_write32 - Track writes to an inaccessible registers.
> + * @gt: the &xe_gt
> + * @reg: the register to write
> + * @val: value to write
> + *
> + * This function is for VF use only.
> + * This function is dedicated for registers that VFs can't write directly.
> + * It will trigger a WARN if running on debug build.
> + */
> +void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
> +{
> +	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, !reg.vf);
> +
NIT: I know that the name of this functios is supposed to correspond to xe_gt_sriov_vf_read32,
     but the content does not correspond to it at all. 
     Maybe let add here some command like:

/*
 * For now we do not handle in any special way writes to registers that
 * VF does not have access to, but let's log a warning about the attempt
 * of such use
 */
> +	xe_gt_WARN(gt, IS_ENABLED(CONFIG_DRM_XE_DEBUG),
> +		   "VF is trying to write %#x to an inaccessible register %#x+%#x\n",
> +		   val, reg.addr, addr - reg.addr);

 
> +}
> +
>  /**
>   * xe_gt_sriov_vf_print_config - Print VF self config.
>   * @gt: the &xe_gt
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 0de7f8cbcfa6..e541ce57bec2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -22,6 +22,7 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>  u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
> +void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
>  
>  void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
>  void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index f92faad4b96d..ff72afd79272 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -151,7 +151,11 @@ void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>  
>  	trace_xe_reg_rw(gt, true, addr, val, sizeof(val));
Should we still trace registries to which VF do not have access ?
Maybe we should also log there that the write is rejected ?

> -	writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
> +
> +	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)) && reg.addr != SOFTWARE_FLAGS_SPR33.addr)

It seems to me that it would look better if you handled a case of SOFTWARE_FLAGS_SPR33 in
xe_gt_sriov_vf_write32
But no matter if you leave it here or move it: this case needs some comment in the code
(With a lot of code changes, the commit description is no longer easily accessible)

> +		xe_gt_sriov_vf_write32(gt, reg, val);
> +	else
> +		writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);

I suspect I know what you are going to say, but what about mmio_ext ?

>  }
>  
>  u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> -- 
> 2.43.0
> 

-- 
