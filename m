Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A89CC87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 20:58:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A740110E18F;
	Fri,  1 Aug 2025 20:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MW+ssjMr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BBE10E18F
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 20:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754081882; x=1785617882;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OH9Y/89hoA4X/CO4/SWaJReMyJtp0yjhq+JAgEvgpRs=;
 b=MW+ssjMre0UKc0od5YR408v6WORKwGLLzznLEpCSdOs18bfigbnRBwfv
 /KCySgXCdhUZUeMSS0/zTlWUlJXrPOequpzw8A4LSsTcKJwtGBblkL/Nl
 f9udIuzP23QDXDV5hsxpf5BK5xptSRdFqYVSNpXcZ4TJfep//0hI0qc+i
 qGOZPZKP/XujW+YETae7hzSMB86ab1I5XtjZqlyaUsi/UbFt12S9fiGgn
 VOtLlFKunHNA0GhJwSwY4M/PCGJek5QcG6rwRMvGmtNRvx7GwzjZWfcsr
 Xu25V4i8gr5YlWXcpaWTBFVA6fThpyN03E4GRADb65Bivpazex51GJlus Q==;
X-CSE-ConnectionGUID: E7/XooewQZStvnvkNWeh1g==
X-CSE-MsgGUID: 7jCy7SK2Q/OkDK5i3jfsTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67509408"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="67509408"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 13:58:01 -0700
X-CSE-ConnectionGUID: Pbf4IhWmQAS9jQXnGgXyww==
X-CSE-MsgGUID: Px8jnbwsSOuMyGeRLNSq1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="169037491"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 13:58:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 13:58:01 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 13:58:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.70)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 13:58:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CHJRgZImCB0SSt0v74Z8DxzLcTFS0k3zEJZ31AILJxATjiYzrzDeZDw42jDVoRhCnBRZ1TiI7wfcvo/+QTbxUq0Xu6cfw/uf/xCGg6sJ4RQ+BNHkMd03Qz5ujwFZFbt2dV3mTQx51VYg+qwtIPj5bRXe3hKM8tyR1TghYnW8L7IlJV6OORrqJOqVMF90sS+gs2ckgV0Kgx7gNMRbOXLMGl1527pV4o+XpGT382U8KkPk+LmpS91lrLMA133mw0o69njefeMdt9Hq88Fs96aLOJT8SWuYhZw+MR0uYJae5pawW6Irtgkt/812bpFwLd6xM9xaO0DUjw7d8KYi6D0NUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OeE9TbRQaS7AlddNjDbfwZYLdxwVB0H9zlT3fUU767c=;
 b=DBA/RqNCnW3rEWLKavckXMWE0cSQzl0hAHyZbQs0peJh8e3qo0koM3qabmmfQHmkWwdjmQcZ9vDhs3FdmtgkgmuLhHZ9w+q+6ZfTLpd+F+pjsrVezaQOtty8o0Mn0eVGh9j7F9Y8Wq4LdpyVNUfS/20ePIcBVDLeRa2LGWb0WhloLQjD7kMiAD5BplTIm8Qnlowtlz+ruzp/kShLZ2PsgztuCE3lN1tXXX+f4wnWkEHcpcOmkMug75URto4v4RhG995HUlgBvQqpzE/JFaL3y0SaI2bjLR24KYJ4c4m+c54dw1Jrf58chKBGGzdOj0e2gzcuPhRgz/a1p6WB7N523w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH3PR11MB8156.namprd11.prod.outlook.com (2603:10b6:610:165::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.13; Fri, 1 Aug
 2025 20:57:59 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.8964.026; Fri, 1 Aug 2025
 20:57:58 +0000
Date: Fri, 1 Aug 2025 22:57:53 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?utf-8?Q?Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v8 8/8] drm/xe/vf: Rebase exec queue parallel commands
 during migration recovery
Message-ID: <uar6qkvrer76s5wawyteoj5n3hx6yxl4iuu6pvothnjzw7vss2@g4l3tgbzt2il>
References: <20250801015045.957609-1-tomasz.lis@intel.com>
 <20250801015045.957609-9-tomasz.lis@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250801015045.957609-9-tomasz.lis@intel.com>
X-ClientProxiedBy: VI1PR04CA0118.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::16) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH3PR11MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: acef6937-6287-4935-b40f-08ddd13e17ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHA0eFdQRHAxVllHOHYyQ3dBYmFNa1lndk8rNExCNmJuTjQ1K3F5ZnRPOG1R?=
 =?utf-8?B?THdUNjdjaHczd0dkR0pmT1N3cDNxTlBRUTBvbEtFYU1VOTVueDZqWG1sZU05?=
 =?utf-8?B?NllvNC9ESHZUZGtIdXBLMlpaQ0NKeHNjWldOUVVjeGVxZjBlVDMvTVFTTDJz?=
 =?utf-8?B?Rk0vQnBpZ3VCbEZLekVBT2VqUFNNb2o5bGZucWt0SzZIaE9ZUy90TG1tVGFm?=
 =?utf-8?B?eXpKckRxNmZyMjJjTjJFelhFOHVMWVU1Tkw4aWVTNTdMcmM4S0RnWk81Y3Bz?=
 =?utf-8?B?Um5GK1ZZTmdzZllqcEdFYU1qL1paOVdFeUVoL0VhSVVUTnNCOUFSQWIzVUF0?=
 =?utf-8?B?ZWJXWVhNQ0FCZk9oaGNPT0dFYnpSOXRLditZZnp1b0dqRmtDWXpRbnU4RzVq?=
 =?utf-8?B?WHBneitxdkNBN2lWUzBCZDI1NUVrVEhIamVaQlNYSFpkTUc2OUs1ZjdIZWdY?=
 =?utf-8?B?RUNtUVFlKzhabXp5bG9XanA2VmIyTnZya1ZyeXlOcnlHY096M1ZJMDdqakNj?=
 =?utf-8?B?M3BGNk5wVm56dnRZVmZxWXN0Z2FEL2VvaFMvaWEvMG43ZmgzY2lpVmlBSTBs?=
 =?utf-8?B?ZHp4UkJpMTlSK3h0R2RkS1U0RmFsRzZzay9LRDlVVXB3NjhBcUUycENWeWhn?=
 =?utf-8?B?d1h3MnBXU2FjSWdseWZMbVJFYUgrRHRuM3VINGx6eFg1L2grRmF4Sys0cHhz?=
 =?utf-8?B?RmZuUTlVaEtiSEppc25EZ0IwSEF2L25rSG9TelcyekxlVWk0K2FyOUxScVcw?=
 =?utf-8?B?bGpxWjA0bkdxaUFkOVN3V2F4SFhKSDd1MFRkenR1Y29zTnZWRlRQNUVNVjQz?=
 =?utf-8?B?cFlHQnNhYTdBZW9BVmQxaklXRzRRU1BzZkhSWUpXS3l3U0hDQzlYK2V2dVFT?=
 =?utf-8?B?cnF3a2Fjbm0relp0bDRXaHBuTVhXbjdPb2p3VVBNUy94S25VVVVqbFFJUnd4?=
 =?utf-8?B?NWxTSEFyNTViYVM2SHkrQ2ZpOGFpVlVYZjNPOU9UV3dEZXluYms4bEprR2Zs?=
 =?utf-8?B?ei9LNktRZG5xWHZVdFVKV0puREgwc2I3VCs1UG5xUUVaYjkvZkEwOE1NZnBT?=
 =?utf-8?B?YXU5U01PYU9QNUFsNUNSK2pIbnNvVmlYRThKSEdPbnVMOGZwcmc1dStHbDN6?=
 =?utf-8?B?TVBZU2NWK1hES3l4L09aVzdoeGg2OGtnTDllSWhBSkZ2cUxIY2ZSMytheFZn?=
 =?utf-8?B?aXJjKzA4RThsQlFxZTl1Z296cjJJUllCVzdpNzhRQXFCemp2eHpMTXdkOWFF?=
 =?utf-8?B?bmhXZmRRNlkyS2JqMU5WVWtheHBGWTJweERzcXB3Zkc4bXdJakc0bURXTVBv?=
 =?utf-8?B?TFpXMVdsRGNVbHcwVVdpM2NON3o4cW1NaFlRRG9kU2lUVGZRMVMveWIyRU11?=
 =?utf-8?B?dkQ1bE82UWh1RHRPQVV2RjlBZWtBRTM1UUZsWEJnK2RTcldoVW1pT3pnKzR2?=
 =?utf-8?B?R0J1NEN2VkZ5c0ZxcHdnMEZjRnV1ckxwZGtRTk9XVFFxdEIvMUZvUEJTa1Bt?=
 =?utf-8?B?QmhQM3JRcHR4blVXb3pDcHNYSWVobFF0ai9wT0JTdHlkNzlzZC91ZlM5c3F0?=
 =?utf-8?B?Y2h0QTdLMW8xeWxwSnNuZUV0cnRGVDZHb29zNWREeTZlQUQvVUpNdUE0cldJ?=
 =?utf-8?B?MU5nTzZaVlRudTlweTJQZUEvaFBiQ1dZR3I4OXpDMkNmV3VYdSt0cEtZS082?=
 =?utf-8?B?NHNkQUdGYk5HazQ5Rm5yQmM4Tk5KU21Ccy94RnZ5Qi84VTRTclJDSkFaZHBp?=
 =?utf-8?B?eFluZ0xLZ2V4U0h3TE5RdDlHb0NjTDEzdXN0blcxSUVRN3hHdUdIazg5QVZp?=
 =?utf-8?B?ZkZnRmlCVDJlWGE1Z3Q3b1pCQytldFdWSm9TQVVIS2tEanhKQkZrNWkwaC91?=
 =?utf-8?B?UWRUUjg3OGM3RjhMN3ZLVFVnL3Z6cGR1SFQ5Zk1Idm5JY25HRzN6a0hmVXNx?=
 =?utf-8?Q?+oYou8UNHjs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUNWZUJmNVA1TjRlZy9MdFQyWVh0ZVFRSkN3N3FnK2ZKNzYrMHlEenpQbFkz?=
 =?utf-8?B?YUdoeHNEakJuOUZQeExmZEtpNk9IWjBtVTAxeXJ4MmI3OU16bnRSTDRyQVl4?=
 =?utf-8?B?NWpWVkQrRXZWelY0ZDVWZ3hoaHVtM3RneU9wN0QxMlJsU241S3JFZDlGL2o2?=
 =?utf-8?B?TGZPYVQwQkxmTW1kbUpyZkdLTTE3TS9FNGJmMGZuN3FDTnJCUm1DM0k0KzNv?=
 =?utf-8?B?ZHJMVVFXczRnM1M0cXh3aE03ME1VRWgyVmM4L2hQUjUrWWRIeXlXTWlmOVU2?=
 =?utf-8?B?RmdkbWlGV296VnowRmpCUVRQd0oxYzhXMGg0YXc2dnZaeUp0YVljM1dNNC9X?=
 =?utf-8?B?TVk3QUdrUmsreUFuT0tnZnQ0YWtEWk9qVStqVEpCUGZBUk9HbmdHTmhNMWp0?=
 =?utf-8?B?MldMSFRiem9taTg0Y0NuMEVnbTM5YTRWRXlHR0Y3aWw0NFVyU21RLzlUbkpF?=
 =?utf-8?B?MmxHMTJEdEFQNVpoVDFEYTBUajFpOFFUL0xHQVl1T2trbHRFL01Rdyt6UWRV?=
 =?utf-8?B?ZzM1dEIwYTJROFF1c0lCTTd5MG5KY1N1UkJ2RW9OMHlkZENWM2ZPRkxidlhL?=
 =?utf-8?B?MlRNQUdUb2swcWw5SFFkQzl5Tm56bDAwYkFSbmoxd0RzMmdueVZyYW56Z1Vm?=
 =?utf-8?B?V0hwTWh3L281ZlFma1kwOFhWeWQwOU1TS1hjR0hkeUZlMEtoTmtRZmllZVRR?=
 =?utf-8?B?MlpiNk5uMkJlY0QzclRmenNEM0I5Y3NPNFBmTWpqVTROckxjK2c1c0x2MEE1?=
 =?utf-8?B?MjVQd3AzZnI0RXUwazMrSmhhYWNhWkpsenZ1U2syY2FPbHBpNXpIK0luWEdX?=
 =?utf-8?B?LzFNSmdnbHBIZjV0dzhxWDhwQWJCTmRVd3lidThYNEZUeU1rT1E0NDBTSWJC?=
 =?utf-8?B?Sk9pVEMrYnJRUG9RRW5TYzVWN3ZNUmFlRFgwVU9wTjhLRWRIUEdJODlFVkh0?=
 =?utf-8?B?ZS95cUJnRFJxOVdheVI5TjdXVi9ZZFZxVzZaVDd4ZzFTM2o1NUxabEdvZnkz?=
 =?utf-8?B?T2lQMk1BMC9kOFZrbVg3elBDS1hUV0huV0xiNkVOdmhyQytBS2wwK0FhOGhL?=
 =?utf-8?B?RlVkM3FjeFNBd28wN2NnN3VJMEt1M29Lc05HMmhJSlJnVVI3ekViNERkSHdK?=
 =?utf-8?B?UlFNeENKOThDZmZvZ3NQSGMxMVNzRStsTFFNeUgwaUJWbmk3dU94a0FKZkND?=
 =?utf-8?B?VzJjSlBUUEZXNDhORUZCMHJBSDYxMU92L3VNd3hFUUtEbFl1djRxdk1UYnJj?=
 =?utf-8?B?Q05YT2FpaXJGK2hsdk10WnUveU5hTTZmQnFIUGphcUdtWnE2Si9hdTI4UW5z?=
 =?utf-8?B?MFh5WVFCVFdWSUphaGxDcXdiZG9VdGpZQ2tiL3pLYUJDTXFTN2lGM2RpYlV0?=
 =?utf-8?B?V2FmZVlGYS9LSDR2TEpvTXFHaHpYdC9FdVd6SFNiZENYZ2lnYnQwTlIvenl4?=
 =?utf-8?B?Y0ZVeE1TZVlzak1OaThQS29DRVJtWExjVW5CM1pzWUxJWWYrdGliU2xHN0Iw?=
 =?utf-8?B?dlMwMWNwby9JL1dROHlyWjZxSmNzWUNEYzlxS3BWdkxuakNzcHhJcEExdm53?=
 =?utf-8?B?QmNLUFVnanFtampIUUNZREg0aFRvTWNpelc3WUtQM01IRWpCeVF0RzVYQURq?=
 =?utf-8?B?Z0ZmMENrRU50b3piWk02TS82NExlczJqRFJHeG9PaW5FS2szVFRXdkwvbkN4?=
 =?utf-8?B?R3FTTUpBeG5mTWo5RG5kaGJFOTVaNHBlTkYyMUJRLzhVYnFXVnlpTFpjV1Yr?=
 =?utf-8?B?UWZacEowTE5qcmxaTmdnNDZpZGh1N2VReTR2eTRRbXorSVFkOHJ2VjliOFFo?=
 =?utf-8?B?Mk1MdjZGUDhNQ1ZmcXhZSUNiV295RlZXVllCZDJWWW5SN1FUU2ZnTDNYcUtC?=
 =?utf-8?B?a2xnNlZUTmNQSHAvakZtZUhKcC9YL0dPOFBlVzE5L0N6V0crVzNqV2Z3ZXdh?=
 =?utf-8?B?NzViN1pta3FJYWhNem53REFwTWxiZCt2T2JrOS90RDh5VXRZVUw2YlhKWEdn?=
 =?utf-8?B?SVZsWk42bDF5OWo3TWgzT3Ard1plZ1QwRWxYSTBTWXBKUzhsQ0cwcnRVKytz?=
 =?utf-8?B?c1BsWXlObXIxRTRsK2dQMXJsVUg0OEc3SThYNy9rNFp6MmhrTzFmSVhWejhX?=
 =?utf-8?B?Y1NaM1E0aVo5dGtEOTFqalZxV1drS2xETW5BOFVzMkljUnNjalhHZjNjZjQ4?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: acef6937-6287-4935-b40f-08ddd13e17ac
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 20:57:58.8558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QaPixFCVlLLfEdgFXUlin4h4beDVIkVQBi0aVgsDuQDSbVGua9IfE27K/4IpmE9p2VvYF3iYgPC/NIklU3sliqYk4xjT7h02QjOEJw02GfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8156
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

On Fri, Aug 01, 2025 at 03:50:45AM +0200, Tomasz Lis wrote:
> Parallel exec queues have an additional command streamer buffer which holds
> a GGTT reference to data within context status. The GGTT references have to
> be fixed after VF migration.
> 
> v2: Properly handle nop entry, verify if parsing goes ok
> v3: Improve error/warn logging, add propagation of errors,
>  give names to magic offsets
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_actions_abi.h |  8 ++++
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 54 ++++++++++++++++++++++++
>  2 files changed, 62 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index 81eb046aeebf..d8cf68a0516d 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -193,6 +193,14 @@ enum xe_guc_register_context_multi_lrc_param_offsets {
>  	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_MSG_MIN_LEN = 11,
>  };
>  
> +enum xe_guc_context_wq_item_offsets {
> +	XE_GUC_CONTEXT_WQ_HEADER_DATA_0_TYPE_LEN = 0,
> +	XE_GUC_CONTEXT_WQ_EL_INFO_DATA_1_CTX_DESC_LOW,
> +	XE_GUC_CONTEXT_WQ_EL_INFO_DATA_2_GUCCTX_RINGTAIL_FREEZEPOCS,
> +	XE_GUC_CONTEXT_WQ_EL_INFO_DATA_3_WI_FENCE_ID,
> +	XE_GUC_CONTEXT_WQ_EL_CHILD_LIST_DATA_4_RINGTAIL,
> +};
> +
>  enum xe_guc_report_status {
>  	XE_GUC_REPORT_STATUS_UNKNOWN = 0x0,
>  	XE_GUC_REPORT_STATUS_ACKED = 0x1,
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index f59fecc58fa8..427694afe0cc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -671,12 +671,18 @@ static void wq_item_append(struct xe_exec_queue *q)
>  	if (wq_wait_for_space(q, wqi_size))
>  		return;
>  
> +	xe_gt_assert(guc_to_gt(guc), i == XE_GUC_CONTEXT_WQ_HEADER_DATA_0_TYPE_LEN);
>  	wqi[i++] = FIELD_PREP(WQ_TYPE_MASK, WQ_TYPE_MULTI_LRC) |
>  		FIELD_PREP(WQ_LEN_MASK, len_dw);
> +	xe_gt_assert(guc_to_gt(guc), i == XE_GUC_CONTEXT_WQ_EL_INFO_DATA_1_CTX_DESC_LOW);
>  	wqi[i++] = xe_lrc_descriptor(q->lrc[0]);
> +	xe_gt_assert(guc_to_gt(guc), i ==
> +		     XE_GUC_CONTEXT_WQ_EL_INFO_DATA_2_GUCCTX_RINGTAIL_FREEZEPOCS);
>  	wqi[i++] = FIELD_PREP(WQ_GUC_ID_MASK, q->guc->id) |
>  		FIELD_PREP(WQ_RING_TAIL_MASK, q->lrc[0]->ring.tail / sizeof(u64));
> +	xe_gt_assert(guc_to_gt(guc), i == XE_GUC_CONTEXT_WQ_EL_INFO_DATA_3_WI_FENCE_ID);
>  	wqi[i++] = 0;
> +	xe_gt_assert(guc_to_gt(guc), i == XE_GUC_CONTEXT_WQ_EL_CHILD_LIST_DATA_4_RINGTAIL);

Mixed feelings on the asserts, but I understand that it's just to
"document" the offsets used in the rebase function.

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

>  	for (j = 1; j < q->width; ++j) {
>  		struct xe_lrc *lrc = q->lrc[j];
>  
> @@ -697,6 +703,50 @@ static void wq_item_append(struct xe_exec_queue *q)
>  	parallel_write(xe, map, wq_desc.tail, q->guc->wqi_tail);
>  }
>  
> +static int wq_items_rebase(struct xe_exec_queue *q)
> +{
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct iosys_map map = xe_lrc_parallel_map(q->lrc[0]);
> +	int i = q->guc->wqi_head;
> +
> +	/* the ring starts after a header struct */
> +	iosys_map_incr(&map, offsetof(struct guc_submit_parallel_scratch, wq[0]));
> +
> +	while ((i % WQ_SIZE) != (q->guc->wqi_tail % WQ_SIZE)) {
> +		u32 len_dw, type, val;
> +
> +		if (drm_WARN_ON_ONCE(&xe->drm, i < 0 || i > 2 * WQ_SIZE))
> +			break;
> +
> +		val = xe_map_rd_ring_u32(xe, &map, i / sizeof(u32) +
> +					 XE_GUC_CONTEXT_WQ_HEADER_DATA_0_TYPE_LEN,
> +					 WQ_SIZE / sizeof(u32));
> +		len_dw = FIELD_GET(WQ_LEN_MASK, val);
> +		type = FIELD_GET(WQ_TYPE_MASK, val);
> +
> +		if (drm_WARN_ON_ONCE(&xe->drm, len_dw >= WQ_SIZE / sizeof(u32)))
> +			break;
> +
> +		if (type == WQ_TYPE_MULTI_LRC) {
> +			val = xe_lrc_descriptor(q->lrc[0]);
> +			xe_map_wr_ring_u32(xe, &map, i / sizeof(u32) +
> +					   XE_GUC_CONTEXT_WQ_EL_INFO_DATA_1_CTX_DESC_LOW,
> +					   WQ_SIZE / sizeof(u32), val);
> +		} else if (drm_WARN_ON_ONCE(&xe->drm, type != WQ_TYPE_NOOP)) {
> +			break;
> +		}
> +
> +		i += (len_dw + 1) * sizeof(u32);
> +	}
> +
> +	if ((i % WQ_SIZE) != (q->guc->wqi_tail % WQ_SIZE)) {
> +		xe_gt_err(q->gt, "Exec queue fixups incomplete - wqi parse failed\n");
> +		return -EBADMSG;
> +	}
> +	return 0;
> +}
> +
>  #define RESUME_PENDING	~0x0ull
>  static void submit_exec_queue(struct xe_exec_queue *q)
>  {
> @@ -2543,6 +2593,10 @@ int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch)
>  		err = xe_exec_queue_contexts_hwsp_rebase(q, scratch);
>  		if (err)
>  			break;
> +		if (xe_exec_queue_is_parallel(q))
> +			err = wq_items_rebase(q);
> +		if (err)
> +			break;
>  	}
>  	mutex_unlock(&guc->submission_state.lock);
>  
> -- 
> 2.25.1
> 
