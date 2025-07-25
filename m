Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAECFC87FCE
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 13:17:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC9010E20B;
	Fri, 25 Jul 2025 13:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ksOE2SKw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78A010E20B
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 13:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753449456; x=1784985456;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=F3P6WLCThiSiNbuB8NLJTfwZZTLRFFVAWpctwZS5JVI=;
 b=ksOE2SKw/CixbuTLNH4eM+VPzzrpd5K/+O0vn4yIalBn0OQj11oSL+1Y
 ZT7LIW0F7lg2w0DrcVmXkTF163g8nnTKAlVOJ8lxwjKAuKZfxeMgzO5Zk
 aGI8cWuQQkv8MXLQ69LJaJeCBZ6zZ5+VjSMlUwzLyoeidSWfboiTnmebS
 igXziIVQCHc22zsqr4BeJA6lJ19gVHQVc5cEpb3BNhaXhlgxFgwKdPP9l
 s9GcPd91NK+N9dwQi57EF+4ovggtkUF+nmI71qnmHWlmxENqoaaUX/0V9
 keWGgKGFy7QkiKKFMnA1zEx+TmSMRJier1gBRIOUxwoY5zQbOrKDlSGi4 g==;
X-CSE-ConnectionGUID: nGfzit9GQLKaHGJIsNTp9g==
X-CSE-MsgGUID: NbSjDCDiQEivERWhL2+mlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="66047375"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="66047375"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 06:17:36 -0700
X-CSE-ConnectionGUID: JjzWPKtwRiqlkc1rFjzSkA==
X-CSE-MsgGUID: MiOjoHoLQvOvZZriu4yHdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="164962329"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 06:17:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 06:17:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 06:17:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.77)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 06:17:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tktAVv8lBF1uNEx8ok+ybDxtDkbxZRNittsUIZjoyC2k23InivJRQg6+pu6qNMLHpi44y7kMp6EMiKcfqna5Q7mJRAfQa1cCRpLoABpiw4NaoM0943n7CtLvUtZ8uZDvr6mk6DNFxqWcAFvHUq3KyylEthHGCJQTowaFRfCyUBHsKbh2qNkaOUg6WGNq/mTBj12aIZ0Ql+F4QE6zSnhW4ZR7DLC1UZptqWwPbcxyl3lxFjO10o09uddzBZm0ItdEfIswCQJYbkNh7iUw/RdwyRcqD1oMX+1aF5Ba6fnY5O84+cySugFdoyocWdIZgzPBi8/wgqMjOX/2+WoH6JGIPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/b+L89dX1tw/CbOVOpDtN19mn5uusMfrvLSY4ZMxdrQ=;
 b=kZez+zz8vsBrFvCGST5pUDNQU0t8lCe1lI1FCYdo7xUSn3ZZoGiUArM5ZEQoYzq6MfTuWg44abq7wakv0LsU8gCpCDMfX2/2e/Y7bzx7n4QE5Ss0E0KHudoBlSw3+gRoPP4R725RlxTo0a1D3h8bu3VrO86t4uLzwq5r9CoNtv36180xOZMci4mGqZKNmNgzpY/7E3jHEW6jdGqZCMkUPH5USE4ezMUkwSsDfg9axyXz+DQSB/3Y2TGRC35d/lVO6YwvAm377qXDUhD5BHPho46FrVazCY4cIR8DXKqN4pPPkGeLjieeEnzbYO+E2WprIqB9fDycqwtgD8lBMjHPdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7003.namprd11.prod.outlook.com (2603:10b6:510:20a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.37; Fri, 25 Jul
 2025 13:17:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 13:17:05 +0000
Date: Fri, 25 Jul 2025 10:16:56 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 6/6] drm/xe/configfs: Allow adding configurations for
 future VFs
Message-ID: <kyt3zqe676o4q4gxejfpoefjbzb7qhsknmab3nwztem7us4vl3@mgfptlgjwiyg>
References: <20250722141059.30707-1-michal.wajdeczko@intel.com>
 <20250722141059.30707-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250722141059.30707-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7003:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eaace26-d572-4ca2-5ab4-08ddcb7d8ca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXRRMFR2UTNING1Sb3lRZHUwd3krTGlDayt1dzkzcjlaejFPa0lrYmlEdGZj?=
 =?utf-8?B?Y0Q2N1RIQU5XNkdKTXlTR2o4amFYRjZQL1AxK2RmSzVtT093cmVzSzhWSmpn?=
 =?utf-8?B?UDM4TGI1T3Fmb3lRNjBEUlk4N2dCSU1SdkpmMnE0ckduaC9ZalFOREpnOXBK?=
 =?utf-8?B?NGVsSVFKYklYNzBXS1c2eGY4cTg3SDdGWWw4WVFlV2hXV3ZqQlJWUUZxMksy?=
 =?utf-8?B?QjB6eWszdWtyLytweVF0VWR2eUw4MUlua0s4c21iNk90WmkxRERKSTJ4aElq?=
 =?utf-8?B?T1BHbTBBTC9vdzh6QWRJd1NKeER1aFIwR2xKYm5kTnFQUU56ZzF5OEl2czhR?=
 =?utf-8?B?VVVKazM1Qnd4TXRJaTJZa3E2dVlpM2lIZnRvNWdXTEJ4cjY0K1lQQ0c4SW9w?=
 =?utf-8?B?c2U0WUg4S0Z5b1ZvZSt0TzZSQVVEQzBGTVBONmppSlg5UE5EMWNtbWI1TWo2?=
 =?utf-8?B?SFUvbGlsSnNkK3RSdDRyaENHNUhOMlN3dkswOXpLWG9RSVMvUmdCM0hDU012?=
 =?utf-8?B?bWs3bVl1VzhoQ0NDL25hbWdtbmxhTWZSbFNIbHpHNGlRc1NnRndKdVh1NFZN?=
 =?utf-8?B?Vmh6THgrMWNDblRtN3BiQndaOGhPNGx1VjdPWmVIS2d1M3pqeVpnU2dJb0Fl?=
 =?utf-8?B?bjBtRVI4eVQ3NFdhNGFyT3BPTlZkbjFrckZZeGM4dm5RN2wrSy9sVHM3MjM1?=
 =?utf-8?B?clB1ZExJVEtVbzdia2JiWHZSL25mSTdsSDNOOTdDdEE2cWhtQnlrajNtcG9k?=
 =?utf-8?B?SHlDNjRUVUJYSDdqZm1xVmJTL29RSnBoMEFmMkNFaGxJakY4RjI0Ry9FTDMv?=
 =?utf-8?B?TXNzeE5UdFVDZzFKNWJDTHNsbHM3ZGVyem83b045aVUySU9WNmFxQlM4YXBJ?=
 =?utf-8?B?S0VzVUMzZ3dDdkxGMXVCa1A1K1ZNMHA1ZlA2bGlFOUhKTk5MMUI5aWJlWmcv?=
 =?utf-8?B?c2lJNnEwcHNFQ1psblY4N0lVcENnRzVmM1JWeWFoT2FpTVBkanNXMSt3TG9z?=
 =?utf-8?B?WDE5NnRET29lQ3gvQ0tRMnJtbjdYRmcwTTMrZ2hsQ2d1cEgvWkFmMHpLUUtF?=
 =?utf-8?B?UktidnB2Wk90TkxNWjVKMEhmT1o5ZS9MQ2dtWGp3S3MzVkhvWUI2WWY4ZWlW?=
 =?utf-8?B?c2tZNEpxb3dvd3FVSkN1aldjZzVmZ29xakYxK2dyQTMrWFFobG94Mk5LQzNT?=
 =?utf-8?B?WWhQMSt3WmUrNWl0Y20xVWIxV05CY1ZadDlydjhieFJyVnJCZ2k1bGVVR0Ro?=
 =?utf-8?B?ODhJS2d1TkhkRTZBSDVralZXQ1R4Q3BCd3RJYjdTa1E2YzdhVUh6eGsrZ2dZ?=
 =?utf-8?B?MVJENW8zVFEydDdQZlFPQXZKQ0RMZ2ZsVlFicDlRTFVKS3NRVTVRMWFHYS9p?=
 =?utf-8?B?VDNTSjVJZHUwaU81cGxVZHdIVTVMSkpROFliaGZnZ0tCMjlFemtZcGlFOXJ4?=
 =?utf-8?B?ZmpyYnU3aUl5T01HcTlBMXhOOHQwbWkzVklpeTV6cW9qaWNlV0l2YkdSRXR6?=
 =?utf-8?B?S0k1bkVaNlRkVmEyNmhPS3NBNi85V1pzSmVGYXBaejVVUnZla0JNc09pdnZa?=
 =?utf-8?B?RkE0VlJVR2F6eU5DMXlaN2VtQ1FOZmNqMmxqcHdjUmZWM241b2ZuOGRVTGZE?=
 =?utf-8?B?bEV5TnBhR3dOYXpNSVhGbnFQNWs5d1h6S3EramtDL2haRE54enl2R0ZiWnpE?=
 =?utf-8?B?TVdQZmthbmw5TS9MVkNOcWJkMThDellXR1psa2tBaEVQZSt4WTkxTVdOZGhN?=
 =?utf-8?B?Mkh4a2g3T0JtaVpmajFvODFESFF2Y1hJYndTdVRScDlGWXRlaFJDQVhvazNU?=
 =?utf-8?B?ZmtNR2h1aU1ldzRHRVY4VmpJYjB3d1MrckpWQXRaNEFNMUpBMEFZa1JUOENh?=
 =?utf-8?B?NEpKbkt4eUZkNHNNMGwxY1VhMk1RcTdZSVFjenpWbnZZcHZmZG1JaFZudE9L?=
 =?utf-8?B?eUhnWTRMSEJpdUZRQVhTYU0xNE9acE5GUk1TdTdDTmZPZ3hwQTNZWkhGdUx3?=
 =?utf-8?B?R05WUCtsVi9RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnpGQmdmZzBscHlTaXk3ald3azNLcmdvbldMMEUwaHFKZmxraUlrWkRMbkUv?=
 =?utf-8?B?N2ZKWlgzMXBtVFh3NnZmekxmeFVDUDY4dmdnbjFLeU1vSS9rWDI1dVNaa0ZB?=
 =?utf-8?B?TTAvNEd0Zmo2bmR1Sk9hcG9qVTh6aEg1NjNwOThUQ2pFaWpqcHdvTFZIK0dR?=
 =?utf-8?B?RGZZc1Z6bThGQ1hyOWtPMTMyV0xrWGViRXdwa1dlYkNmMGcyMXRjbnpMaEti?=
 =?utf-8?B?dG10cTZObTZHcjBQNHJZckJZQmhtQ0IwbzNCeXZIcjRIUmppYkZmOFdHMmJM?=
 =?utf-8?B?eVVIUTBDUmY4UXRiZUtLOFJyc1pub2RPU0o1Um9UZlRjYk1Fdm9pUHpVZDhj?=
 =?utf-8?B?VUE5YW1UTHFQZGhIQnJrck82eWtCZ1dUdktoc0hmcDZJRC9zSStMZXVHd1hS?=
 =?utf-8?B?L3ZnUnZOaWd2emh6elFFS1RlZlJ4WkFVZFB6VERicW1VbW9hdDloNTRnNHBP?=
 =?utf-8?B?MVNzRS9xNHR2a2l5NmNyQkZKOUZRSEdHVUh5d2Nmd0lJN0thdXR0UE9FdStL?=
 =?utf-8?B?d2JvbjhKYXlsZXFrQXpkSFJ3TXQ4cHpLWVdITWtsMnVzMXpyT0NGdjB5MjNR?=
 =?utf-8?B?WUlET2U2dkwxdEorL0ZSWE9yS1h2TER6U3p0N0VIVGJnU2wyQlNsOHpSV0gy?=
 =?utf-8?B?Z1U3L3FVUnBSOTNNRzFrMWNmVUF2d3IvNkZDdGxYZE9vTG5wb2FJQ2lpVFJD?=
 =?utf-8?B?T0x4QWxnbXBNMXFIN2h5T0xrTkJ5RnhRQllMR29pSk9DWVcrSkczcmZudnl1?=
 =?utf-8?B?bVNpRUEzWHM3bzRGRzJyWE9VTDlVNWdhZHJETVhDOXBGY2pHYUJnUnVUYnV1?=
 =?utf-8?B?clpYd1o2ZXV4ekNTSVh0d0htQzhyWmUxNG9OSHovajhhQ1U4bHRIYXVaNFVC?=
 =?utf-8?B?cG9FZmJDQmppSlN1TGZhMC9hWUF0cXR4V3ErYmNoM0tjblFIc0ZrUCtMY244?=
 =?utf-8?B?MWNWTWYxeUdRSkN5c2txM2FUV1YwbVJWTnNmRExSU1QvZVBmL0Y5RDFNZHov?=
 =?utf-8?B?bE1KUVQ4UzI5N2VGNHhOTVBOeW5icnRnbnI3S0JtbTZUQmVaSGJTTzROZ01G?=
 =?utf-8?B?alF4RXdXeEFTbEdsTGVLYmxGQmdVYW45WDJ5Lzk5SEtFanhlY2ZsK3ZESG5Q?=
 =?utf-8?B?dTl4QzhFTjR6QlZkd0RFYUZGRVRvcDVoN2w4RGFTTUdGbHVxMVM2Y0tsUXdV?=
 =?utf-8?B?VXV3OVVBVGdOc2pWcm0yQ0pLRUNocjVudC8ydTliVlJBWWNZQ2xDSmI5S3pq?=
 =?utf-8?B?bjVNQjMzU2Y0QzNsd0F1L2djV3lFekpYVmp0eGJZL3BVaTYyNFUzVHJUbVFS?=
 =?utf-8?B?WVF2SHQ0MitYYVhWYitCYnA0TmFoTFdqU1ZvejBXQnB0SnBMeTE3a1Bkd2lu?=
 =?utf-8?B?T1hpc0xzNWE0Zm5zT1VNdWV0Q0g0TlZNZmx4cFE5SURIbHh3RWp3OXlYb21N?=
 =?utf-8?B?UlYreTVNbEpEcVdEVUpUNUpNUVA5RVdGeDdiYXlsUEVCSi9XV2RpTy8zUkdC?=
 =?utf-8?B?anJuYUljUVFPYXMzbWl6dW9XV1pOTUxoYVljSTIxS3RHdEN1d3ZXZ0tkMVJM?=
 =?utf-8?B?NDhRYmVWdzdJbVRpc2s1VS9tanVvM1p2YUFKRGNNNGZTa2tyaEwwSXdSNzhK?=
 =?utf-8?B?a0lNZXIyL3dadDJxQ3F2KytIY3EyMzBaa0QxemNRbU4yQ3JiRWYyS01WWWNy?=
 =?utf-8?B?aWV5YXZINU5XRDAveG8rWERQTmc4eldKQnlpNGNjaE96OFhVV0lBMnMxZHZE?=
 =?utf-8?B?TXdNNVFDYlp0d21hQm4vNE1MaXZRbkIvRkNXNk91MkpTQ2RHKzN4QWRsVmhl?=
 =?utf-8?B?bGZEYWRCRjB4OTNLdzF2VTFHMlBZT3J5cGpxNWthMFE0S2dHM2tITWM3Tm9v?=
 =?utf-8?B?MXVhT2MraXFOekIxZnkybXdRd1JiRTgvV0FUL3loZGxqM0owV04wekgvNHFn?=
 =?utf-8?B?MHUwbmRqVHpFb1pDMDd2NUQ2bEpML3JEYVljSjRtakJDNDVmZVBuSXE3cU52?=
 =?utf-8?B?UFE1eTNTUWNXVDdobzgrdjBuYko2cGhnWjlhQ0ZFZGczdnZCTks5T1orSEts?=
 =?utf-8?B?SWRlRUtLa0c0cW9aV2VIYm5CNC90NGpnYUhVSExLU2RhbFdPRmhGWTkxbWRZ?=
 =?utf-8?B?MitMei8zaVVQQUc1Yy8welU3MTdnb2xmckMzRUdxeU52aHpSVEE0WWtTanBq?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eaace26-d572-4ca2-5ab4-08ddcb7d8ca2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 13:17:05.9214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2EyyjZ3tYSGrbNkbR4gKA/utsBQorG/AuY8Aq6eD8saME8C+txoN+r1Oa5WHs79Nr/GJ4leNvmGetxWxZFvPujTnYLX2wHQzfFhrcLBLGTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7003
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

On Tue, Jul 22, 2025 at 04:10:59PM +0200, Michal Wajdeczko wrote:
>Since we are expecting that all configuration directory names
>will match some of the existing devices, we can't provide any
>configuration for the VFs until they are actually enabled.
>
>But we can relax that restriction by just checking if there
>is a PF device that could create given VF. This is easy since
>all our PF devices are always present at function 0 and we can
>query PF device for number of VFs it could support.
>
>Then for some system with PF device at 0000:00:02.0 we can add
>configs for all VFs:
>
>  /sys/kernel/config/xe/
>  ├── 0000:00:02.0
>  │   └── ...
>  ├── 0000:00:02.1
>  │   └── ...
>  ├── 0000:00:02.2
>  │   └── ...
>  :
>  └── 0000:00:02.7
>      └── ...
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
>v2: rebase and improve checks, fix include order
>---
> drivers/gpu/drm/xe/xe_configfs.c | 15 ++++++++++++---
> 1 file changed, 12 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>index b593337d05b3..f8222079b209 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -12,9 +12,9 @@
> #include <linux/string.h>
>
> #include "xe_configfs.h"
>-#include "xe_module.h"
>-
> #include "xe_hw_engine_types.h"
>+#include "xe_module.h"
>+#include "xe_pci_types.h"
>
> /**
>  * DOC: Xe Configfs
>@@ -295,11 +295,20 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
> 		return ERR_PTR(-EINVAL);
>
> 	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
>+	if (!pdev && function)
>+		pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, 0));
>+	if (!pdev && slot)
>+		pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(0, 0));
> 	if (!pdev)
> 		return ERR_PTR(-ENODEV);
>
> 	match = xe_match_desc(pdev);
>-
>+	if (match && PCI_DEVFN(slot, function) != pdev->devfn) {
>+		pdev = pci_physfn(pdev);

aren't you leaking the pdev assigned above and then putting the
wrong pdev below?

Lucas De Marchi

>+		if (!dev_is_pf(&pdev->dev) || !match->has_sriov ||
>+		    PCI_DEVFN(slot, function) - pdev->devfn > pci_sriov_get_totalvfs(pdev))
>+			match = NULL;
>+	}
> 	pci_dev_put(pdev);
>
> 	if (!match)
>-- 
>2.47.1
>
