Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FF3D3F083
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 15:51:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A09B10E6EE;
	Wed, 28 Jan 2026 15:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nHtsYG+o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B498310E6EE
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 15:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769615496; x=1801151496;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kZUlr8Pocaj7i0kVfJ3mICS/PwCOYSiR++30beEJgy8=;
 b=nHtsYG+o/mk3RCQnyEbFCtyYTpLtCHfCekgYmZY/r6Y6xJ8TDuDjJXDd
 nNSITUiIn/LAmT4g4Qhk9iG6enoCOOmSIX8/yuC0gmQVSH/c4s5crfw41
 9LQ4HLKLjuEyc3dAonaWnJxhigyl/011lHs+tC9wvp+nXRFwbFd6C0Yyn
 Vu7mVvY5s9nu2Hpb8Y5oxnVSeXBAOQBplFWJEc2tLJkS7wNNxIaH5U3s0
 yLVRh4DQL3k/FfRhOYVdEycRD7D92fJRFWe1XBrZkbVqgU255mjAHM/aO
 j4UL3o2z+v/yVNJwjL9BconEZzkHa2doLPA/+BiE3S2MEglTX8vktoRPa w==;
X-CSE-ConnectionGUID: 5ZeaYy83QI+KxurkxsTJ6g==
X-CSE-MsgGUID: KvHZ6rL7TSSbRtViC1Vvdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70923306"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70923306"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 07:51:35 -0800
X-CSE-ConnectionGUID: MEMYNyFLT9OVruwt/jC5eQ==
X-CSE-MsgGUID: ufM7NL1CQAqcCV9UyTDCww==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 07:51:35 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 07:51:34 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 07:51:34 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.56)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 07:51:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ueG6eP9q2lW7Q0DRr74wo2pl2T/PGBPsfZij2fVRQQCxVGMYOnZpPk/dQTDOdKHl+TwN4u9wXQdFmnfaCxDmu6i/7k10SWdsY/3yWVTFh+nsRUKyzXQ3dXCtQDiRGGoYjvb1ESBkzj4m56GZSQ92ceSbPHrZmsSjk1ke4BS+1ixIOS4wKiQ+eJUaxEdfCBMXh1x4pPm7mlnwShaLuEm7xJYGe2/alQlSe8L985pEcRwcMdFKlBjhk3539/8p8zBhfQjkcNk9ACmUAa9PKAV4spX6n8p2z90KmKY1irWEudq9BFiLJp25/CqxfPYhbxkvhZPTofX2MytTw0kAPd5aGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lu2XvTIs0gRRtPoPuszGwgQYrAOKMgmYZZyq4JSze5Q=;
 b=L6V3sGiEvSdSZRHCOItjU/jkcangq0GxGeZymm4e22ENITccl3Av6ctqc5L2mDkedegWfxl5z4IGLz5FNzavgxTLAqErMfKUdVElPIF+6o8pFE80q8d5bna0mlAyRVGOH6eRNGJiZ8s81fZwtpeLwsXD++KzIcObBXJn0mb42BmHgfeeLlHpkMw+E20L/grK6nkqr6g73A2uu4lWX0mgxZUWDgF7GrAE7n1nHF3ou+P5RL1rSfglrnNInt0bXthYuWn5spgRYtigkPygYSNc9tRT1VMLf/zMte2AA3Ju3xkj7fzlcgHWIdfggtTpqB/PCsmeX6fjga66x5az/wfYtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH8PR11MB6853.namprd11.prod.outlook.com (2603:10b6:510:22e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Wed, 28 Jan
 2026 15:51:26 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%5]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 15:51:26 +0000
Date: Wed, 28 Jan 2026 16:51:23 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/5] drm/xe/configfs: Always return consistent max_vfs
 value
Message-ID: <20260128155123.rgbsw67wcr67oofz@intel.com>
References: <20260121214218.2817-1-michal.wajdeczko@intel.com>
 <20260121214218.2817-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260121214218.2817-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR07CA0311.eurprd07.prod.outlook.com
 (2603:10a6:800:130::39) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH8PR11MB6853:EE_
X-MS-Office365-Filtering-Correlation-Id: c02f144e-6635-4460-f9ad-08de5e851827
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXl6ZllQME81TTdZaVZTZ01MbTBCYjB0RVNRNnRwOXZCUmRqWGk0ZlcrZjR6?=
 =?utf-8?B?ZERRYThVSjJkMURzanNsSkJ1ZExJLzFBVStyTVcrcmRLM1lWVytiQ3Y1R0lo?=
 =?utf-8?B?bkRlS1EveUhLT2RTU1I3c2JhdFNURXJ1UTNhd3ZVb2laWExGSGovdlJLZVF6?=
 =?utf-8?B?UGlNUWNsVXNFMmMrN3JMQkQ0NmpXNFdndWZwbkRONVFxb1NPMG1qbERCUTF4?=
 =?utf-8?B?NVVsWHZmaTAzU3QwWkw4aWFpVTdOSlJkaHI1OE1VOWRYLytWTkhZV0NiT1Va?=
 =?utf-8?B?Y2YxS2xNN0ZkaVlRczFKa2ZCYzcvQVZMbU9rWEdXTzRJRkY0VTQ4Y1BPZlFr?=
 =?utf-8?B?RTUrTlcwTFpNbmpTUUhKYjFwVWxYaStFanBiWlM5aHJ5blZuRmRDY2FkUEZt?=
 =?utf-8?B?MUlGSVlRRXAwKzdiZEpKb2V6TnlvZkNQNVZQd1pFNDZON0N1dWc2UG5kS1Za?=
 =?utf-8?B?b1MySWxCSXJ2Mm1Lcy85SFJmMExrcmVnRjZDK2hLczB2R2VnMlV2eXBNTnhy?=
 =?utf-8?B?Z2Z1WHdtMDErR2t1VUM5M1BRQ1EvVlhnUi9WYTZReFQ1TExFSHU2V005TVZG?=
 =?utf-8?B?TXRjZUp6bFN3bHZIeUVISVRLcW9KV0hlWWt2MTFtaUFIalNKS01sT2dPbENl?=
 =?utf-8?B?aGFrZitvQXlQcTNCSENSZFdhR2lZaldDVERVTENjSkg4YWVLd05Md3RXeVlm?=
 =?utf-8?B?YnVKMUdpQ1dpTDBKZGV1aWs0VEtjL013dzQ3cGtVUGxralhua2hpYXV2dStI?=
 =?utf-8?B?OW1QVDNrME1tNGlYM09DdmJSSnJlYmVNektjMVdDTUFxalBVK2dxV3pteTdB?=
 =?utf-8?B?RzRZWTh6ZElXaFdiMDZia0JJSFJ3S054M1RneVF2YVkwRk1TZ1ZrUkhtU1pU?=
 =?utf-8?B?NWc5Y1BtSDFUcDFjeEFUWEs4azZJbkdPaHJrTFl1bEk5T20vdVJQbU5yY01S?=
 =?utf-8?B?c0FNaUNrUGxDQVJQSGdNOXkxaGhzWnNyc1pVR3Fpc1didkoyaGw2L28rTjd6?=
 =?utf-8?B?OEh5ZVFNTkd2b1BtOThmN21LemN0ZXJCdHY4TlpGQWJtKzNtOUFGNGRiSUxi?=
 =?utf-8?B?ZnVQVWhpRUIzYWlzREhaTUNZbkpuV3JwNEVNOXplZmV5a2UzMWE5aUFDSkRI?=
 =?utf-8?B?TDJCaGJ0ZkpkSUxNejZNaWQwV2t6NXY2UGJwVjIyWExLZlhOeURKRGVEZE0z?=
 =?utf-8?B?L0gyd3ptTkY2TnJ0bklib0NRaU9BTE9IdlRhcFEzSDhaaXZDQUtCOVpCWU9C?=
 =?utf-8?B?SHZLMzJOL1BxOFRHOG5DUWZCWTlvSXpjZWkzYkY3Wko3cm1xdHFSTGVQcjVk?=
 =?utf-8?B?NnU4ZHdkREcwVmVvYjd0S3FLaEcrRzNQMUptdDRhMmI0VXJoTG40dGJlUTJ3?=
 =?utf-8?B?RnhYS2lvb01JKzFrRVpNNS9uUGpaSzFxZ1VmWEErRFo0cVBOa1FqSDZTL1FC?=
 =?utf-8?B?UUlaS2pMYnZuRkoyZTV1WWE2eWczaFExNDVQNjRidmdzZmpuL3Fvc085SDA2?=
 =?utf-8?B?LzBUTmd4UGMveWVNZHZRT00yaHdPMi9SK1cwdWkraU92Qm9JUFc3dUoxYXQy?=
 =?utf-8?B?N25zTUFxZm5TY1Y2aE9uQ2NqUDkxRW9sRStaUWpsUGlDRlJHdEhqTmk4UUsw?=
 =?utf-8?B?aCtKa2l1bk1sbk12NWxNNXQxemd1L3g1Ny94dHhPMFA1cVRkTHE3VVF5ZHZx?=
 =?utf-8?B?VU9USEdrTDVaSFIxbVdjZUF5dDZpRlhObHAwRkN2Mi81VVNDKzB0azJodmMw?=
 =?utf-8?B?dWNyZlhFM05LV3lDQlhUT3RmdXdocG8wSFNTZ0Q1THNzSTJhRk5qTVo0QTZO?=
 =?utf-8?B?SjRQN3YvWGxTZE5CMzZZV0FTUTNMK0phdkJ2NG9RbVRvV1dldGlRbTVsQzUw?=
 =?utf-8?B?LzBHN3RFd0VWOTRJUitESk1RMnc1TDRFVUwrMm5kK3ZldDZSWnQxWG1qNHVC?=
 =?utf-8?B?S3ZMKy92cVFESUgwSjR2RjlPaVA2UHRFcjhJd3d6Y0VnZkp1RU05M0p6djNv?=
 =?utf-8?B?TEVzdm9FWkdIaWtydWVRblBiM1hnbjcyUk1GOTUyUWJYaXc2ZVlUY1hhZzhv?=
 =?utf-8?B?RTAvb2lzS2JDZ0lEdTdxZkdUajhwTmlCUDR6cWNGVmtvQURDRDJDYjdIbjUw?=
 =?utf-8?Q?iPAA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0JUc3JoM0JtMGY1NEJkVUdQRGFUV1lwb2ZUTEVPaHMyY0Z6cjAxZXgzU1hS?=
 =?utf-8?B?aUkreHFJYXZXeFRTajV5QmhWVVFDSzU0QXpYekRmelB6TTBIR0FEbGNUa1ZC?=
 =?utf-8?B?WExPMjcxYWRPdHJUTXlUMTZJcHREaVh3SWhlNnJjSXM1MzNCQkpweUVXR0hU?=
 =?utf-8?B?MVFuMDluaXU2TWNkNnduUlUxSFdQdGE3MVhTQU5sM0UzczZJVk83ZTUvYXpL?=
 =?utf-8?B?akhUbkw1c3d2dWFsYndUcEFMVDdvUjRQL25rclUwclJETnhKd0lXNk5DSnJm?=
 =?utf-8?B?d1d4OEFGbXF6NDB0OUc2MXc3KzJzakh6enBDVjRKeWlmT1h5enBweHhHMFZW?=
 =?utf-8?B?NG83NGErT0N1VjQvcUtiOWcyZytCUkIvMzNUQlBZcHFhVkVVRm56SldCL0ZX?=
 =?utf-8?B?aGFPSWV5VWtncE0rSWdBcmt1NVozUTEyL0RFYzdNYm1pbEJOL1hnU01qa0lk?=
 =?utf-8?B?N3VhMEtOTDhWUEJJak5BUENDNEZiMUxCVWZ5SXRkYW83VDJ4S2VydzlHY1Yw?=
 =?utf-8?B?S0N5aHdWYStVOXZ3Q1VNQnVCR2dUVHZCZWRTb01sUDJDVmIxL29JdHNyNGNs?=
 =?utf-8?B?VkFucmFTVUxYK3YrWThGeFVSOTJRc0VlWWx2ZmZtY0tLOUhHcFkzOGloMVU2?=
 =?utf-8?B?ZlVnbzNSTUZ4dGpyRmk1TEx2VlJYM1JtN2huZzFrVXNCRG1jN0p3dFJRaFdW?=
 =?utf-8?B?WFhJOWZHUktrcXZhbE9mOU42QzJsVzkvOS92TUVSZXN1NlNQTDIwaTVmcVgz?=
 =?utf-8?B?M2lPOWhPSHdSNUM0Qy9HeXNIMjYxeE85RENXRUsrU1pNS1BFQzJNZDM2V3dl?=
 =?utf-8?B?RmxEaG03aW9hRTdmblRTMzlqRXdJMDVrMUxCWHVlY2xVTU9KWkFZNVFWUzl2?=
 =?utf-8?B?YWRGdWtrSlU2ZHBtcngyRGs5eEgwcUdOWitHbjFVa0Y1czdwUmlxY25MZDYx?=
 =?utf-8?B?ckszMDVISitPY1A3WUVqQXM4dTR3QWJ5Yk8xMmZEWkFxZEdzZ0wrdVRROThB?=
 =?utf-8?B?TzVOa090TjBMTEdva0tKNURTU25pclIzRDhlK3JZOWMvdTF6akJBK3RoSVcz?=
 =?utf-8?B?T0ZiNjFraDZ0Zjk5V0I1NEpKblVJMTd1RmRVSWtMSVJLTEpzNWRjMXk2TkY5?=
 =?utf-8?B?L3VTd3lmTWF1NlhjakZxZytOWmg4Q2FVWjN1T3pNWGo2OEorS29PdmhJVU5r?=
 =?utf-8?B?NTBGajROTVNlYS83ZFhmWU1NNFk2c1pZQTBRVGF0V2Q3eGNXb05TU0QycXJY?=
 =?utf-8?B?VHIxblRwSk8yRDBaS0JhTnZUc0REdmJuRlpSTnRqbUxqRHdPdU8veUE3ekUr?=
 =?utf-8?B?V0YzSTRmQlg2NDMrangvZHREQUNuL1dMTjlsOVNWeFBFcmxRSVVqKzd1Q0xS?=
 =?utf-8?B?RDE3U0hVSFlqclFKN2o0ZjlrSFQ5SE9aQ1k5UEF2OGpiTmloMGFsRUVrV2xr?=
 =?utf-8?B?WkZOZFhocmdlbzZaL29jWm1LU1QvekF0NFZRcEdmdDdwSHRhZ2xYK2w3cDlW?=
 =?utf-8?B?dmgyUHVCSnc0YWM4aytWVTl6cFFpQiswUEQ2Q2Zhdkt2S1BKVVhwbW1BOWxy?=
 =?utf-8?B?NzVXSTB1ZHBvc0UyZlFzOTJ0SWMrUE5JakN4UDF0VWtrTTBCRExueHJZL0ZC?=
 =?utf-8?B?eU5rK2J3NUd6RXVvUWhSODFmNnZERThjT2JUbElOemZ2Qm9lWmY5S1NRYlJy?=
 =?utf-8?B?eTgxNC9qaEErbEhEdkIrbnpjc1BFNmI1c0NEZGd2MjVETU9SUm8wR2d0MDZD?=
 =?utf-8?B?VVZWT1VUdzJ0NnVWODZCODVSS1Y1a1RKcng3RkhzczY4T2l3eEZxL2VBMVlw?=
 =?utf-8?B?c3lWSmJnbEdnRHFaa2JMa3MyZ1dkUWJNVWhtM1FteFN2Z0Y1bXpqNUJyQlpL?=
 =?utf-8?B?TThhQ0dtRWRWK1VmVDhObFZDNDhXSDhKdlEvRkZMcHFpSGJoZUNMaVpOWlQr?=
 =?utf-8?B?emdUWlkzcVpoaGp3dEk2TGd4Nm1BLytlMjlSWFIvMzVhWkx0MXNmL3lrNjhi?=
 =?utf-8?B?aGtrN3k4aUtSbUN6NURveSs4RE05KzI5M0pGTkpzQVZsakNsMDAwTFhzTFFK?=
 =?utf-8?B?Wnp0UGZBandZWXN2bDZFdjV2Vm9ZWCtQbW9kWUFsbE94SWYrSld6RU5WcGxU?=
 =?utf-8?B?ZGhubU45VjZUbm92ZmZoZSt0US96ZkZCK01ZZk10THN0ZzJCd3Qra01seHdk?=
 =?utf-8?B?RGU4RXlwNkt1cHpqSnNmWUkwWHRUSXdsakdyblNGcnhwbUF3VE80SER6UTV2?=
 =?utf-8?B?c2xjYXNYbnd2a3NLdFJjL01TbERIZkhVUUJMUlhCWFpqY3hoSFdwcXQ2ZGk1?=
 =?utf-8?B?NE01R3FWQmxJRjFUUytzUVRiNDZQczVIQ1ROaDNkdHhTUUREVzF5Ryt5RmJR?=
 =?utf-8?Q?ez1hXAjNvL/7RiS0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c02f144e-6635-4460-f9ad-08de5e851827
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 15:51:26.4550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hkWndn4YUSlosnn/U/pRi2axQJjbGGVwDrwRQFasl8WYnllmWAYdV+y9NtNFSCce67MrrOb4RUljOLg/Gt+d5zkVAGNnsiYLXp0WJAjuFS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6853
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2026-sty-21 22:42:14 +0100]:
> The max_vfs parameter used by the Xe driver has its default value
> definition, but it could be altered by the module parameter or by
> the device specific configfs attribute.
> 
> To avoid mistakes or code duplication, always rely on the configfs
> helper (or stub), which will provide necessary fallback if needed.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 3 ++-
>  drivers/gpu/drm/xe/xe_configfs.h | 8 +++++++-
>  drivers/gpu/drm/xe/xe_sriov_pf.c | 4 +---
>  3 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 9f6251b1008b..a823b0bd4ebb 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -15,6 +15,7 @@
>  
>  #include "instructions/xe_mi_commands.h"
>  #include "xe_configfs.h"
> +#include "xe_defaults.h"
>  #include "xe_gt_types.h"
>  #include "xe_hw_engine_types.h"
>  #include "xe_module.h"
> @@ -280,7 +281,7 @@ static const struct xe_config_device device_defaults = {
>  	.survivability_mode = false,
>  	.enable_psmi = false,
>  	.sriov = {
> -		.max_vfs = UINT_MAX,
> +		.max_vfs = XE_DEFAULT_MAX_VFS,
>  	},
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index 510888354a7c..e0a555b871b3 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -9,6 +9,7 @@
>  #include <linux/types.h>
>  
>  #include "xe_hw_engine_types.h"
> +#include "xe_module.h"
>  
>  struct pci_dev;
>  
> @@ -41,7 +42,12 @@ static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum
>  						     const u32 **cs) { return 0; }
>  static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
>  						      const u32 **cs) { return 0; }
> -static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev) { return UINT_MAX; }
> +#ifdef CONFIG_PCI_IOV
> +static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
> +{
> +	return xe_modparam.max_vfs;
> +}
> +#endif
>  #endif
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> index 6ce3c58e003c..33bd754d138f 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -22,9 +22,7 @@
>  
>  static unsigned int wanted_max_vfs(struct xe_device *xe)
>  {
> -	if (IS_ENABLED(CONFIG_CONFIGFS_FS))
> -		return xe_configfs_get_max_vfs(to_pci_dev(xe->drm.dev));
> -	return xe_modparam.max_vfs;
> +	return xe_configfs_get_max_vfs(to_pci_dev(xe->drm.dev));
>  }
>  
>  static int pf_reduce_totalvfs(struct xe_device *xe, int limit)

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.47.1
> 

-- 
