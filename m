Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15387CA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 09:44:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BC810E14B;
	Tue,  9 Sep 2025 09:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fwRCVm97";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC09810E14B
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 09:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757411094; x=1788947094;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ege1x57oGeDu5QQoEfHQRdw7cIyje6+7PqQMREJvY8w=;
 b=fwRCVm97v30yOVCRX8X2tZiWKOF/lXBaAZAvq80E1tmpqBuyh6Eppmq2
 jiS34U45+hpCwZ+hkPo6NWMbyPXY1eKOixPNWXWMx7Hnry2IgtTr0k6mP
 XdBqqecZS1ONsAcSOjiAkjlkawZRadaqAbI5zi7hKHPvg/JBFI+mSBnVM
 /d1LwHlIbzTVrP6buOtCkTk1I7nRTfowU+xAw7vPCGi4ZNAK1sELO8kLJ
 divoO05qPaTluoDj45LNNvuNy+n/Hhk1ya6V4qAoMJRdVsJPEM0jT1XPT
 gr6spPLGZJyDxQqNigM8+Jvcn8A+vbPJDHHk2BZK5vq14DYD9OhHYrS6W w==;
X-CSE-ConnectionGUID: i7NCGzPOQhWbh4E9WS01MA==
X-CSE-MsgGUID: FysDtfTuRIaIA6WoeX8EWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="62315599"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="62315599"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 02:44:53 -0700
X-CSE-ConnectionGUID: Mi7CsedoREeaRo/zJDa6uw==
X-CSE-MsgGUID: B9cjwWFfQbqUQsOZRp4N5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="204027252"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 02:44:54 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 02:44:53 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 02:44:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.86)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 02:44:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FG8BqGB0TS3FeWua364oBrjYkYxnOrX6AnzuQ1Kf3LqgoRIll4aIkACQaM8A1m4wmdv4/I6iFOXnCTe9f6szd4RmSEz3T/uXIPYiScHF2AFnRCuD2InO8yood8TeE13Xyp5ixSKGn5LW25Q2qUJDSKgvEXo5chBF1pN5p38EAvpEuWJJrvIIeQFx1S6XhOBabngIdGGFYlYLQWCBb3nc+Sp9TVNewhVbiln649ik60Ie/Her0pUPZUjimfLUdDvIsR0FO/gLOoQMgKeUK1/l9qiPO5WBX5k4F5+h8ZL2jux/vRYss5nLLAiturAC2XDJfIhDwXwm0eUBBkdZmMXsjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7lvGKOYYCnEZTvNY9fs9mXaL1OqU5aDbc9SgZpBg2E=;
 b=gkv/8LSPq/ATK2TXp3035Pe4hqsQndkDyEUaIpd94gNSFjFJLpe31FCnVnO/Xe8A8+VSZa+cvrojVRkeKaQMEhE+6OkBU9+KxnXvtwslpjDgZw0eRPK43Dbg812AdPLtiN68YM9IUvAyhPeiCQ8xby07WZijkKI88NI0oylii2hKWfJf8WwM3TgVuDPYQiGM3b1X179sd/j95jUc8PCKDKdNBFeykEDumMSi0s6B65pWzk7L/SFWHWywQswWQeVo5xmDtexgPn+Xly/6fYw0/tCXr8EiTornhxWod/w7rJt54URX8O2X/UScnuKlPS6gc/nUi+2po09063QkXd13wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB6663.namprd11.prod.outlook.com (2603:10b6:806:257::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 09:44:41 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 09:44:41 +0000
Message-ID: <8487c18e-10a3-45d2-ac63-77e61803f10b@intel.com>
Date: Tue, 9 Sep 2025 11:44:39 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_GuC_CT_devm?=
 =?UTF-8?Q?_actions_improvements?=
To: <intel-xe@lists.freedesktop.org>
References: <20250908102053.539-1-michal.wajdeczko@intel.com>
 <175738646299.315157.14732138584916909682@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <175738646299.315157.14732138584916909682@1538d3639d33>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0091.eurprd09.prod.outlook.com
 (2603:10a6:803:78::14) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB6663:EE_
X-MS-Office365-Filtering-Correlation-Id: af9f1784-66b4-4bf7-120a-08ddef858011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qk03NU1XcGVidjVBbFZvWFl1b0pmdU4vY1RSTmgyL1BrQ2JWY0NHTC9xL1FY?=
 =?utf-8?B?ZEx1Ym1tQlZNdXFTZ0g0OWFXcGpZSW5CNUxXMUZvTGZQZTBYUEVWZm51T2Q4?=
 =?utf-8?B?MHhzMW1FaVd2YnIvUGsyM2lROGh6bkswWGdRaytmSGNVREFJWlUvaHIvSG8x?=
 =?utf-8?B?QlJYVEx4aWdmd3VwcnZoTnl4UWFZZWo2bWY5bnVMNU5rSjlVYjRvd1FScG03?=
 =?utf-8?B?TVE2MUQvY1hyRTFqV1EzcllhdTdKaGJSaEFzNGRjdFkyZWJhTnZpTTlrUVBL?=
 =?utf-8?B?bWlGdFJiRllBemgvblI4TEp6dWZDRDJpL2RPUVhicGpRTGl2NjZYQVRCcFBn?=
 =?utf-8?B?QUxKelVtdk5QYjBaVWNjL09WU3Y3TWZqUjhDVEI0UVdCaUJVakJpZkFSV0gv?=
 =?utf-8?B?YnBpdHJzMnlWNHVFQW1ISWZQZGROc1dtckppSW52NFFBdjVUK0JRK0V0ZVdI?=
 =?utf-8?B?My9vWXhlbEFYRzJKbHM0K08wcng0QVdBMllLaGRtOThVblIvNlFLWU1vdnE5?=
 =?utf-8?B?UjNDeTQvb2pndnQvLzhjVVRwRjAxWkM1clhxVHBKdFRSZ05DRS9JVW5GQmdB?=
 =?utf-8?B?MWxjVytMMVQ0akZiSzlMVWpxZnBlV2ZrS1lEa05hQnZLOXdLa0NOVDRaYkZB?=
 =?utf-8?B?Q0FGMStBZm0wT2dMN3BEVXlOeHZTTCtFQzU0OS8rTFg3c3dxRUljaEh3WEZB?=
 =?utf-8?B?STBCdEQyOFE3ZlB6bWxjUnp6ZWJmbXptd1psenowYmIySWdiUU5RUy9XMmRC?=
 =?utf-8?B?emsxUm8zNnBmT3RrSHNQR1FiNE9XV2VFbGxpb3U1OGFTdjdicmoxODc5Q1hF?=
 =?utf-8?B?NXRvRlVOZWtqb1BCRG5VQzl3QVhzUU8xU1VrK0FYSGJwNzNjenN4S2d6eEZX?=
 =?utf-8?B?d2hELzFlY295a2xPdkY3M1NmMC9FNkNkNXl2QjhOZ2ZPTFhkRHd2L2t3U1Vw?=
 =?utf-8?B?V0diTTBrSFdaTWwxa3FORFdnaC9tdUtoTS8yMWhCL3ZHQ25sZlFnZk1sNnlQ?=
 =?utf-8?B?Y0hLb0RVc1g0dWdEWjU5UkNzY05xK09yWWt3NU91eTFXZThteVIxSXRPUmVB?=
 =?utf-8?B?bkE1NnJxRWVMZHZoTnZoRWp1UFdLVzVUYm1uU1pLbURuY3lVN25lTUVCMjVU?=
 =?utf-8?B?WWVNYWo4NkxOVis4cHlQMVZPdGc1Mk83ZVhBSmpkTlI4Mjh0VDlOYWQ0UXd6?=
 =?utf-8?B?T3BGM2htNG9YcDZORm5CdG5ZKytpOHdLdlV4SFFUMTQvRkVMcFhzeFMwN3I4?=
 =?utf-8?B?cG1ROSt2T2VpRE1KcHFZQ3dFT0hLQmpXbms5djU0VUIwZ3JwQlhrT2ZQQ3NR?=
 =?utf-8?B?REVkQ0o4V1Nadi9YeEFVOFViQ1RCMUxKMWcyT2Z2NHUyVGtVTlI5N1g5Mlh4?=
 =?utf-8?B?S1NpMHJYdlBJRlRmdGozNkxYVFU3TGhBZEMwZCtqd0tIQUd2aCt1aTlNQTFl?=
 =?utf-8?B?bWRFbC9vVmUrMXRxMys4NWhWa0RuMTVhVCtaUkVwODYvdUpjQWx4eGpvKzRX?=
 =?utf-8?B?UXRCT1dmanlMTEdCcWRhbXcvZTI4ek9ETVVyMHJvSEc2Q1FGN0g1UVd3NU1u?=
 =?utf-8?B?eDFxYmNETWJHelUvVlZ3NDZFUk51SVpBVWdGY3ZRSnVYa25WL09Na1kwV0NZ?=
 =?utf-8?B?TGtWL0R5dEppbUlxWlE5YmRCUFh1QUVsb3lUMHkveFlaSVBhT29OcGl3MUNq?=
 =?utf-8?B?em1GVkt3empycmJ4Qm51Nll2UDR0dDR1eXcwRXhTZUNjektkRFFYUXRFa3FP?=
 =?utf-8?B?bGwyeGJoV2xDSjRtSC9lM1R4TUhMaWxuWkU0UEtuaHRUMDlIMFN5SnVCU1VP?=
 =?utf-8?B?RG5Qc2FsOXB0QVhOaWpWRkRCUE14YlVSTzRCVGJhRE9xdG0rWTdhVjJHLzhq?=
 =?utf-8?Q?ED7656bq/D1y/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NU9zbFIzRHFTVDNJMS9YQVBBOXAxZTdzNFJ0bDlWQ0s4MDBLaW1BTEFvaitN?=
 =?utf-8?B?bjBDd0RFUHQwYkhxTEg3ZldhRGlwUy90YWxzaE1TZ3ZYTTYwcFkrRm1QV2ZI?=
 =?utf-8?B?a2Npd3FrSm1HbkNUcFYwaUZhZ2tJNHJwb1BMbm11VnFORENuWmJaRGg1SENP?=
 =?utf-8?B?MTlGRDNZUXRSbkVzNWF1VTBPY0sxczlxRXo5Z3FjR2ZmZEV5TlhkQ0lYMCtB?=
 =?utf-8?B?Q0x4akJrN3Jndi9ybHI1MUZqcjNnTm9FMHNYcjFibjFiMHZCSll0cGV6Y1VP?=
 =?utf-8?B?a0RidlpUYWFuQk1KOFdXbytBbzZPcU5HbGtrYVlCejYyeklQbFAxdGZWdG1j?=
 =?utf-8?B?NTU0bWhXcEZNdWQyQmRFTHFoN3Q4a0ZXcHB1QW5VSlpLWFY2SDJZelk2RVhX?=
 =?utf-8?B?TFBJWEFDSzhwMHdTYTZMajlRMVRrUjZxd3pDSDd1aS9sVkZuSHJiSWJXZndk?=
 =?utf-8?B?MmJqOTg1cGsxd0xYVTRPeU5nUnFtWUVhc1lJMERsNUt4cWRLeHFYN1ZNeTlr?=
 =?utf-8?B?ZnNvL2xwcHRaTTdwd1F6WkFjQmhGTkJzcHlkbVg0VEoxTDExQVM3SEdKYmtX?=
 =?utf-8?B?cnRBOXdzTXhIVjR2aU9Xd1V3UFNKWkhzNHBkTlBEa0VGc2Fncmd1M2FBOTYr?=
 =?utf-8?B?TGRqZUdhMGtsbWk4OXdhRTlJdzlxY3RKY094aU45TWR5YmV2OEFoYVlxcnE5?=
 =?utf-8?B?Y0NoMjNHQ0Y3R3U3NU5CNE5TVGlMKy9vRmRvNy9qR2xETmNhUmdIalBESk5L?=
 =?utf-8?B?a1lWNkpvMUlzUDNYN095Zjd5SHN5ZldKeFlEZCthZnAxbjcwN1dXVlVZVnk4?=
 =?utf-8?B?R2w3d0JmS0Z3bU9mS1ozQ0dvZ2xqTTJqNEZLNmNFay9wUkxjcS9aWGRuVWpu?=
 =?utf-8?B?QWdqT2lDUitZaGdzWWFaTkw0em1pOHJFdysrN1J2TW82bjVuZ011dExWdW9j?=
 =?utf-8?B?Y2pxOXZwcCtRVm9NUlQwZEVmMGw3SGNtblJYOE93TjVwODVMTks2eUxsUFlJ?=
 =?utf-8?B?MWsrSDlCelVBVFhuc0loWmVqWjM0Sk81ams3S25xSGFPcnJ3ZjdVL0I3b3ZK?=
 =?utf-8?B?dWs2QUxmV2JnRzhPUjFjRWRCOFc5dHRQa2VEVmxJWGkwQzVGOU9adFkraFh1?=
 =?utf-8?B?eThSbkdLNzRpUFhlcWh3MmowQytNRFozSEQxYXdmTTRpOXNJYWhMMklVUHk5?=
 =?utf-8?B?RFFtTldtdFIvYzNOeG9UZUo3NmhOZGZHMlBhYzM0ajAzQlhRSncxTGtjTy91?=
 =?utf-8?B?TnVHNlU0dW0yMURsbXhIeWRzWWVFeUJNd2VuOElLdXQ3Nis3Tm55ZkJMRDNI?=
 =?utf-8?B?L3l0bnV0TXN5ZmdFcHNwcjJkVVZrVllCSENMSEhneGJLcVVWUnAzQTlsVmdY?=
 =?utf-8?B?NHo0MjlKUzNYbit3SWZtK1lMTTYzaHpESlNPTzF6eVhRVGNsOFZkMXNjNU5p?=
 =?utf-8?B?UFJ2Mkt1bHJ0eTJ0VGpUTjZXcUJndWdUVFNxTVVDM0dvRy84ZjladVJtRDZT?=
 =?utf-8?B?ejRBZ3Ztd2E1UHo1WWhHNWFxN1NXYi9heUd4RGYrZ1pTVG00ak16U3U2ZDh4?=
 =?utf-8?B?ZStMS2FFSi9NYW1seDRFNHdjbklzaml6V21uM3VyS01KWkpuci8yZm5JY0hj?=
 =?utf-8?B?empJN3ZhYThjNHNldzRnQlZSVlRDNjN3dmpyeHdWM3pTWXlUck5IdDRCYVhy?=
 =?utf-8?B?K0YyMWNRMS9VY0JGQjljV1UxSjh4TUhxcWNrQ0p6cnlKQ0tLWWx5OU91VUxV?=
 =?utf-8?B?V3BlN3Nldm5PM0FmeFNZSUord1lORzRnK1pDaThQQXpJajZmdmNweWZhN3hS?=
 =?utf-8?B?L01qdjJTV3lONlgzRXgzWnVUeFhqUHp6K2c5NUZwN3MvUWZmampMdlhnYi9w?=
 =?utf-8?B?MTRHZkRtT1hHeHBoZGZZM0E2cmFZNnlSZjBsMTdoSG5rWktUU0tnSGZ0cjRQ?=
 =?utf-8?B?V2dTK0FNdmsxb0dCbnZIbTdkbVp1T3VyRy9IWkYxWUVpbkhvODdzd1hZcVY5?=
 =?utf-8?B?aDd4Y2FmRkZ3akFkTGxEVDlSSkJBZnp0QnVYRVBzNjFJb3d2L0Nmc1VtUjNj?=
 =?utf-8?B?dGRpbnJVdHREcFVZeFdjNFpHV3RnT0R5NFZ2MW9hSURYV2ZSOXA0Zi8rck0y?=
 =?utf-8?B?cTc0NW9nY1B2d0w2eTV3MWJUU29ZdmpsakF2Tm9jZGNpT1g2UWI2eVR0S08z?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af9f1784-66b4-4bf7-120a-08ddef858011
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 09:44:41.7047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: auYUt0XekOi0cvwvKT6fLV8yUTigRrOvVDvCa18TZLmj+f8JgbdSUuzSz8Nze5t+TxI4JXmBnMpht+BQQRtrFkv1QpQLqdvm2/hea0ELx3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6663
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



On 9/9/2025 4:54 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	GuC CT devm actions improvements
> *URL:*	https://patchwork.freedesktop.org/series/154180/ <https://patchwork.freedesktop.org/series/154180/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154180v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154180v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-3703-6da3b81612a8f96c0b70981f173381ca05f80ce0_FULL -> xe-pw-154180v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-154180v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-154180v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-154180v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_exec_threads@threads-cm-fd-rebind:
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3703-6da3b81612a8f96c0b70981f173381ca05f80ce0/shard-bmg-6/igt@xe_exec_threads@threads-cm-fd-rebind.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154180v1/shard-bmg-3/igt@xe_exec_threads@threads-cm-fd-rebind.html>

unrelated, series was about GuC CT initialization, while failure is due to engine CAT error

<7> [402.031369] xe 0000:03:00.0: [drm:pf_queue_work_func [xe]] GT1: Fault response: Unsuccessful -EINVAL
<7> [402.031751] xe 0000:03:00.0: [drm:xe_guc_exec_queue_memory_cat_error_handler [xe]] GT1: Engine memory CAT error [18]: class=vecs, logical_mask: 0x1, guc_id=63
<5> [402.032492] xe 0000:03:00.0: [drm] GT1: log buffer overflow
<7> [402.569719] xe 0000:03:00.0: [drm:xe_guc_capture_process [xe]] GT1: Capture extraction failed:-5

