Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD38C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 20:56:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D8A10E104;
	Fri, 12 Jul 2024 20:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AWTcd+YL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDAA10E104
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 20:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720817769; x=1752353769;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZH1kfCZkG/WvVJRDdiGGqzsvALoBAqBUDhubmLOXBV8=;
 b=AWTcd+YLqxDEf3VRZcYxI6TiIWWFdFyf+f43YjRHDt7aXYjySQAVpxoE
 gcdCzV0VkaQjXWceH0TCyQ6FI0JpUs4a326A6IfXhNfjQD54+ngn/7QKR
 ITA9SkO+p8nRC52sZYtMU+XJuFvkNkJegbgmcZ3wNBxzIseBrIkNpNF4D
 uSg34ay+LXS/kSZy3oZBzqirkCfq9UamgURbdaUE2ordYm0yXyKDLcwrs
 JnkB6lnAqA8ZpVvqgwfefMmbrqDqz+Frs1Cfu2A+le4nxWWv5tlvGwZVk
 Jog5ppw47JcAUVgkA/UZkGMM+miZ3G1eR9mhzKG0GZt4HUUQEXrxBXpyD Q==;
X-CSE-ConnectionGUID: 8y8coSerTRyhTL0sGknp3w==
X-CSE-MsgGUID: FSGreD+RTdy9aTm/QsnAwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="40808478"
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; d="scan'208";a="40808478"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 13:56:08 -0700
X-CSE-ConnectionGUID: 95GMxrQVRny43i0EnAg0Qg==
X-CSE-MsgGUID: ACez4vUBR3epXrNlNzOb/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; d="scan'208";a="53594088"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jul 2024 13:56:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 13:56:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 12 Jul 2024 13:56:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 13:56:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyF1gOMOo7JLa7BxGFda1kQgq3uHmBV6zEvwotgVnoXVDS5kXVXAx7VyPhXWIAziNrsSp/wH2nLZXc3dBOCt7ZK4/RpmWxzVasqmIMc0o8c3zLOkv4r6h+xEcLU7jPPG3Lb0jRVO4ly4lx2Lgg9EXvoNd+M3gkzwv6XmPTe0QuxuE04/Wl45kPwwNAFMZsBLJi3NMQq5q+cU0ye/XkYt3QOwi5CNO5DXbFhiOvcQnnODGcpFuRp+MNcJ5lHtjYOK1SrRW0iPfJ/wV1dx3kTPPb20UhuBNhDFbKdoqhRV4GJJpRp1fkwkbfwWO5m0wKbixHUrI6PxKTq+iyKhDQwC2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVyORSMNeeJPr26dPUBLwBTOQtMQdB2c/y2ZeZxRgPE=;
 b=No5bZFk9y4pswD82pu1TdCNF0zfjnebb2b5wbsI7pouqPPa11l5pGhPxzxeVuljDZGTro9bjSHeh4gm3c9iOaGWXTjc44yARtMIk0CZHSv6uhOfXAVhgk73zFscMnV+2ZiHMDhGsUZNPTlidS3IBPXN0B2MhAcon7pmInSjWaMNJTYZyxdXWV5GBPPd+eNe7RlKZ4A3QCPE9X9b6zw5InzxX3bvrJd9Jmz/uuCVGg+WtfPhO73xvTWSqRQgnqObWgurIDdu9suBc5u9Y4lsKwEx2KxCgGuYuXtgu102kslxxu2GlHeJJ/Xm3YDUh0C14Zj5lQ4W/tpOr1sauRElIVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW5PR11MB5811.namprd11.prod.outlook.com (2603:10b6:303:198::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Fri, 12 Jul
 2024 20:56:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 20:56:01 +0000
Date: Fri, 12 Jul 2024 15:55:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 drm/xe/pf: Limit fair VF LMEM provisioning
Message-ID: <suroenml7l5bljgfdvyw5ma7bmbo2r6duboufwnzaqfnrzuozi@safavi5sglj5>
References: <20240711192320.1198-1-michal.wajdeczko@intel.com>
 <172072905358.164880.5867005051311083460@2413ebb6fbb6>
 <4caa431c-0b14-4a61-aa95-b4c845824e25@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <4caa431c-0b14-4a61-aa95-b4c845824e25@intel.com>
X-ClientProxiedBy: SN7PR04CA0101.namprd04.prod.outlook.com
 (2603:10b6:806:122::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW5PR11MB5811:EE_
X-MS-Office365-Filtering-Correlation-Id: e2f0356a-2b33-4175-7af7-08dca2b50980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rGEnOO4eUdzHAlgdR3nPYUrFu/G+KQm252nfuwth8CYhb2/rUHFq2WP9RqYf?=
 =?us-ascii?Q?au+Y/cyzeCRCmJpVnIeXE8BAU1EbLAaE1bTb5faGI8nr7qCPj7mAzo7FWYCm?=
 =?us-ascii?Q?UY6l/+QuztnUaxuaFjQ6p5VJTVSV1FSp4dVW7TBPa1ZK/fklnu0qYmiQdn+N?=
 =?us-ascii?Q?Z5LeVO4sOXsxgaILgecFiM9ETBoNrLAjNMROUS8ZI/vTXA5H2palhTCo+FQF?=
 =?us-ascii?Q?afYQmVtmwmxFlTqCLdu6F6bViIfi4N+JLAC572r3zvmQZh0dnX1TRDlKNoGS?=
 =?us-ascii?Q?f+T+JqR/4HCmplCrlf+f/i0VMy2fSbmtnUqsVrmM1LWMhKKBurR4lU9q7g+w?=
 =?us-ascii?Q?SWnCluzI4aSNn2ecRGdLPYccyXK6c0VuW0jaJoxNTjPRPuPgnxQGpBSTr8EO?=
 =?us-ascii?Q?VeP4iQvsjiodMiNZL2q90IFtGhx9q0jVnPijW9BtE1Y9U4R9bTMlc7pQkXQo?=
 =?us-ascii?Q?xLTTzaDQILoFdE4exLAyO8PF2VwQ7GKTtuzM4UWVeSdQ7FAvCNQG+uccVj+w?=
 =?us-ascii?Q?GYxlgQT3F7+rFXjMUGPPJgahJanI4bPK1g2aV4hRwr/DBkmTfMbOCxzVYYvf?=
 =?us-ascii?Q?P9CtkHKuCeeJOq7aN60ScJiJX3eHRaxEy6kxpOUdpz7f7NmI2AdHbBDje0IZ?=
 =?us-ascii?Q?V46/A3OGHdO/wFb5MANAeMBMswsque7KJGB3VJxqJlmKHpzXI3xu0GowpdQt?=
 =?us-ascii?Q?ApVX5jWVIiSBu/kfq5AK2z4vYE32Aaitie5gOyz0SG6/fZRLHe1Ko5HEbAt7?=
 =?us-ascii?Q?N0GE4M4HoD59oDglbGhR85xuPwUEopL8lHxyn+haS3EJvreORaXNqx8xaI3T?=
 =?us-ascii?Q?r2Ryqr3lViU3BxGJALW280njbo01jvkcAJKOX6grTUn2Zx5ZK8FpMQ7VZZ8E?=
 =?us-ascii?Q?BZHvqcZQsNjVv4JP8804ucsTEjDl01SGtuAhlSpupS/MYMhPHZyIw0PUPA2C?=
 =?us-ascii?Q?MlpTwpGl0gEz/bo1wnBXCH5+0HHG9xNtvVdEOc/0whwWKVvVETTciR1g3Moo?=
 =?us-ascii?Q?ZxqC2jWhvBhNDh2cyabutH74+oeAWkhFp9qwv0l9L6icCnHmH0+kJd1/hyFQ?=
 =?us-ascii?Q?vTe21DllH2u65zPCUvEXs6kg/42nPg26S0a5UhRmoOt07WuXHwIybV7dBHIl?=
 =?us-ascii?Q?jHV/LMdWmtkP1EAABy0FblIH3hcflKofgU39To9VKsytWnTy0OqICnSJL94T?=
 =?us-ascii?Q?OjRujaFIdswobXnj8DHb7JEmdLXrEI7GNz+EAVrp/u2h7ZL7BkAjRWVlVHOK?=
 =?us-ascii?Q?v1FfYoMV37zYtnbcgJx6io3pKvSuhlhwGtBPWMVB5qZRSxFmrJMj2n9Ud/1I?=
 =?us-ascii?Q?J5M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?scGAGeieDVFJtP3XPCBHMzBEsTraMRihMcWRosm7FiJIZIhOyL3lvEzWJB64?=
 =?us-ascii?Q?qSlRoEy5pMx1VcFHidk/cY7vG9Nk1mDhvcG+NCDQjqD8cFudjRLsJgSl01MZ?=
 =?us-ascii?Q?O9vTmoVMHgN/H3oxag2OaV2sWxxsPmqD6iVa79WVVkXbc7QCOW443TwupnPG?=
 =?us-ascii?Q?LovcLCqrRPl3UmRmeHdwcps3c28SQW6HQ3c/M0IF+uowLVnxgsG9tt9sCkwc?=
 =?us-ascii?Q?XLzL5Eki6bmHRtb32BwJnIMX8tTJnrhKrReeUCYauxoJ3luMlrY7DPb7aWxY?=
 =?us-ascii?Q?2zMOFucvuxumub7Q9B5+ykS+XBcinFdc78f7ZDk704Wsih2vKYPPF2NKkzFA?=
 =?us-ascii?Q?uMSoEuR5a7J16cSv1fvGsgQsepDHBdUd6yLbr0mBAHVoiVx5QaSThLxJmS+P?=
 =?us-ascii?Q?VZWJ1bmFrNNxy32HSRSRnX5gfJoZF9Snr+A5z9Qu97KwexQpJ7OmOX7kDmYR?=
 =?us-ascii?Q?7gTPxGiMcAGPQN/peZi6raBs99tyo7zFVgI8SRrA4wgw28jpeR1mjq5yysi8?=
 =?us-ascii?Q?VndZB+BH7rA8m8ddgqWvDWnUJpmE2B3Ms2idfpBNKGc6jrAfhBzqUeVcLPwT?=
 =?us-ascii?Q?Tbg3E74gqMQJFPutTzu3grZKBr/5cc8o/FaQAFinDNgDE2NcZFDKrLu+mgXu?=
 =?us-ascii?Q?aIpI+yhM2CcrbTjzmSMJ6w9RnDh1WdsJrahJEN+5xTKsiMsJSTp2ZVYXM9kW?=
 =?us-ascii?Q?tvcVZ/QNRA5+RR15xFH5y+J5m0XZhoYNuSR5BGTEs7kHMoRJP3P/r5jZ74XN?=
 =?us-ascii?Q?EH2T1ou+09sdVVubbfjfHzhF30M9BmO2SlEWURSmd/UOO6c5g1N2/veqBq1i?=
 =?us-ascii?Q?ap8ADR+SmnYJ+LEEdNY4K4Pv29WjvhZpev2CNMynTndRCi5oQJJWE1hK14pw?=
 =?us-ascii?Q?wrX/2+83HvwNR7oPuxbKoxH+zjL9YRXh2ZFJm/h+H9AKerN5+3T+bY8kdb2u?=
 =?us-ascii?Q?C+jo5JczINjXWw8Ryx1chfH216+SMxW33Sxt+oJtivJBt3otxXbQqr9N3MuO?=
 =?us-ascii?Q?HAR4U7vvN8POf8yAk2zwrQyNQaHRlUdMmgybdvaDEWpJPZKAIQ5gbJ6YBtoJ?=
 =?us-ascii?Q?Y1pfr3Wx7CsXEDtSNKHoYWr5uJCz1th6wuc/qYCvO8k+B5tkvkKo31JjXpYb?=
 =?us-ascii?Q?yAbocV8EqQk9vNFIYp9yGQxzkUayf/vwqRHv1bfZKvbMC7xpyOS45owITU8/?=
 =?us-ascii?Q?xR4fNXpn6Rb/54q2UKsQjHpPYxfOvAsj6L+2r+ml3CtEsERVAGqbuC9Jkr/5?=
 =?us-ascii?Q?vI+BO0nXdO8ZhOPupozQdZyRpZlZhuKGgvvMbercgWfItwx0ihVeQ4SWFhc8?=
 =?us-ascii?Q?Hjmzbwj1CZ3TIq6aClHvHY2rNtavlA0mdhrpZiAjPVxDJIWF11JUqDHC/E1Y?=
 =?us-ascii?Q?a/bFc1e8/4H9clVGhYSiHQIBKHB0LaGUz7w4mIpAVKTrmtOCqWBj2bBNXC2w?=
 =?us-ascii?Q?y3KJaqVNpndud9854qDYfWLDu7ukqEUaU4p3yxnoILbPIiHFxLBknYD9hxhF?=
 =?us-ascii?Q?XumpGx2Wy10CtjruUuL926JV0OIFlK0n5967IeLm2bH3repE+v9dTGso6SdC?=
 =?us-ascii?Q?kHi9k7fHzGT74RqHrDCfnVo4jRlIus02l0ZztZ8On5LCJxyu4P5+ow66/vul?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f0356a-2b33-4175-7af7-08dca2b50980
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 20:56:01.3738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QYPSyK3OfGbtnOPhb1Q8ZzM/ZJpGCYHpg/j6soBxXYwWFo8k0vvP2b2wYjzshAM/FALOWVIOy8QyJq9FXPgB63a36Sm6bkrBPO03vSaMoBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5811
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

On Thu, Jul 11, 2024 at 11:02:45PM GMT, Michal Wajdeczko wrote:
>
>
>On 11.07.2024 22:17, Patchwork wrote:
>> == Series Details ==
>>
>> Series: drm/xe/pf: Limit fair VF LMEM provisioning
>> URL   : https://patchwork.freedesktop.org/series/136010/
>> State : failure
>>
>> == Summary ==
>>
>> CI Bug Log - changes from xe-1597-3bcdb3f9a5370e29bc971883307487527c3e6a65_BAT -> xe-pw-136010v1_BAT
>> ====================================================
>>
>> Summary
>> -------
>>
>>   **FAILURE**
>>
>>   Serious unknown changes coming with xe-pw-136010v1_BAT absolutely need to be
>>   verified manually.
>>
>>   If you think the reported changes have nothing to do with the changes
>>   introduced in xe-pw-136010v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>>   to document this new failure mode, which will reduce false positives in CI.
>>
>>
>>
>> Participating hosts (7 -> 7)
>> ------------------------------
>>
>>   No changes in participating hosts
>>
>> Possible new issues
>> -------------------
>>
>>   Here are the unknown changes that may have been introduced in xe-pw-136010v1_BAT:
>>
>> ### IGT changes ###
>>
>> #### Possible regressions ####
>>
>>   * igt@xe_gt_freq@freq_fixed_idle:
>>     - bat-adlp-7:         [PASS][1] -> [FAIL][2]
>>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1597-3bcdb3f9a5370e29bc971883307487527c3e6a65/bat-adlp-7/igt@xe_gt_freq@freq_fixed_idle.html
>>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136010v1/bat-adlp-7/igt@xe_gt_freq@freq_fixed_idle.html
>
>this test was executed _after_ running some SR-IOV specific test that
>forced GuC to run in the VGT mode, which might have some side-effect
>that is not accounted by the test, or it's just a noise
>
>
><7>[  380.254006] [IGT] sriov_basic: starting subtest
>enable-vfs-autoprobe-off
><7>[  380.254694] [IGT] sriov_basic: starting dynamic subtest numvfs-all
><6>[  380.485443] xe 0000:00:02.0: [drm] PF: Enabled 7 of 7 VFs
>...
><6>[  381.607087] xe 0000:00:02.0: [drm] PF: Disabled 7 VFs
><7>[  381.607448] [IGT] sriov_basic: finished subtest numvfs-all, SUCCESS
>
>...
>
><7>[  392.445578] [IGT] xe_gt_freq: starting subtest freq_fixed_idle
><7>[  392.672710] [IGT] xe_gt_freq: finished subtest freq_fixed_idle, FAIL
>
>
>>
>>
>> Known issues
>> ------------
>>
>>   Here are the changes found in xe-pw-136010v1_BAT that come from known issues:
>>
>> ### IGT changes ###
>>
>> #### Possible fixes ####
>>
>>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>>     - bat-atsm-2:         [SKIP][3] ([Intel XE#1932]) -> [PASS][4]
>>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1597-3bcdb3f9a5370e29bc971883307487527c3e6a65/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
>>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136010v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
>>     - bat-adlp-7:         [SKIP][5] ([Intel XE#1932]) -> [PASS][6]
>>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1597-3bcdb3f9a5370e29bc971883307487527c3e6a65/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-off.html
>>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136010v1/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-off.html
>
>this is expected fix, but I was expecting also fix for:
>
>	igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1
>
>that was recently added to BAT by [B]
>
>[B] https://patchwork.freedesktop.org/patch/602461/?series=135803&rev=1

it's not that it didn't fix... it wasn't executed before:
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136010v1/bat-all.html?testfilter=sriov

>
>
>>
>>
>>   [Intel XE#1932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932
>>
>>
>> Build changes
>> -------------
>>
>>   * IGT: IGT_7924 -> IGT_7925

and if you look at 
https://intel-gfx-ci.01.org/tree/intel-xe/bat-all.html?testfilter=sriov

you will see that IGT_7925 didn't have this test, only IGT_7926...


so, it seems safe to apply.

Lucas De Marchi

>>   * Linux: xe-1597-3bcdb3f9a5370e29bc971883307487527c3e6a65 -> xe-pw-136010v1
>>
>>   IGT_7924: 6e6ecdef9f167ff987f6d323f3ff6429c01b25e0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>>   IGT_7925: def41c762723c9ba046a3ffe722d046cd12e993d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>>   xe-1597-3bcdb3f9a5370e29bc971883307487527c3e6a65: 3bcdb3f9a5370e29bc971883307487527c3e6a65
>>   xe-pw-136010v1: 136010v1
>>
>> == Logs ==
>>
>> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136010v1/index.html
>>
