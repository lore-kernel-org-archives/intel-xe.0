Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD709EDE9A6
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 16:48:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A41894EA;
	Tue, 10 Sep 2024 16:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PxSLtyuF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0A9894EA
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 16:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725986908; x=1757522908;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5Pl7ysWz9vOcMdE18y5t3cdtinWs6rftVpNfBT6mzPE=;
 b=PxSLtyuF1jJf2M43g4b65CXTnYCZG7RZF1A5aMjPQYnW421a0Dk0zoJI
 qnVkoXTe3e/vRxzjCzBoILJp5mhkoS9/4ffJowFpwLQ5bzvNjOBRdWLEy
 fiTC0nyw6jeMXBM6c4qA2dWC9CVuvz86xNKvzxfOct0mWaORY4pQi3tGB
 w3As3wcQt7mTzsBGBZy1fI5kwnuMF06bg30PFFACZTxY6PA7JrNS8WAd/
 tINgMhTxL80jEgnKR0g58pMLn2Xod0voGhsJ2B669mpH16yp/x17zCL6N
 9v8FQeqqkrBSGH3tF/T3eL4TjecNHIU/eXgV9mQGyl1VS6e7Hub35tuor A==;
X-CSE-ConnectionGUID: 17p9V4e+RjusZWBswc/iBw==
X-CSE-MsgGUID: n2XOAE/9Qo2wjI6tPmLkjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24291479"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="24291479"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 09:48:28 -0700
X-CSE-ConnectionGUID: FxQAkfA+Qy6LLo5a49KZjA==
X-CSE-MsgGUID: JyR/qB+oQz+qO72GA7uQTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="97786390"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 09:48:28 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 09:48:27 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 09:48:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 09:48:27 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 09:48:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwMCEFl1HusW6Zdh0VhvcBRp7vng7ilHqOKYEqOQtTSxVCshMwg8X731VkVhBPnrezU9c2GeldYRXuExYglJQEUqi/fDnFDPwTap/C7DicvbmpOog6A1jiFDmBns7YQJwvRrqgE8izOxwTlcEOfHLo0i1ExiTl6doxNOQB2PpbETpJeuq+gleYPUszfMzLbAGkvvXHiVKSaUF6AydnefNaMx/0NPhX8Xy55u5tmJD5pecOb6BxUHbn0b+nrx40qndoQTCE3kpHSSlDAr7XK7UwCgyYUC5+6LmT/mdACSEkjusHO2MuH53C89MmihIJXPKIw7pCs+C01cR+9DxF0eLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dv8Qtxt7reNyVW58gvMut73KKntZ8qcuwyHnMeqCbcs=;
 b=BBYY943ZkV9TAN8/yRlvF8EZUMrto9kqzHb0d6/iQq/duLW6qliZJVhrZnCNSkFAtJbz9feUz72wmxZ4R1jaurepuCx3ou13AHMkCSRulseL4xkYX/iXPh8NOl87ECvRg6FkZrciGkA8B1attz7mz/fFsukEcTiXTSvj/5ulWFFjvA4srr6uA92p6f9M1MbFp+aeJBDVjUHd+J4DONHkDkomH7a685WZpSybjX2UA+w7Z3Yq4wdC/RlCEQgHDvD4bP7pjte0WwFdz3fvncXMmCwBjwNbHMqfjHL19q3NhWEAi9RWphFewWXSaGxQ3qZ5t4vJaA5xxJf/UQzTd+2nNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4882.namprd11.prod.outlook.com (2603:10b6:303:97::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 16:48:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 16:48:24 +0000
Date: Tue, 10 Sep 2024 11:48:20 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/xe/xe_gt_idle: Fix name conflict
Message-ID: <yc4ftt3mt5pvah6kgr2kkq2rv3pf6s7swi3uqp77nd3tyzxloj@fpjowiwgpjxt>
References: <20240910142837.636680-1-riana.tauro@intel.com>
 <ZuBdM3qnzcZM_uNK@intel.com>
 <ZuBdll8hFS1bElT6@DUT025-TGLU.fm.intel.com>
 <0732e0c6-d3d1-4886-ba76-11995ca4554b@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <0732e0c6-d3d1-4886-ba76-11995ca4554b@intel.com>
X-ClientProxiedBy: MW4P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4882:EE_
X-MS-Office365-Filtering-Correlation-Id: dc232f0a-f16d-45c1-9873-08dcd1b862b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l9WB4IeVt9kU5CBeS5F5v5FnXyCn8NCZex0EyBseCRDCay9Y7NHrocNEupeA?=
 =?us-ascii?Q?fbqv9NARagVcneZTbuLnFySS5hxr9hP0sKLmvmyKdhS92jYWsJljeObxWCwn?=
 =?us-ascii?Q?Kg3o5qPPIDGeQXUS6EgHgV31U/dy+C6jCJb7wWP4z6iME4ZNQmdEUgtHG5JC?=
 =?us-ascii?Q?G/RaoV/GR5QDO0UlT9X22otVAUAJcp0GdMQFK/cxoGejvcPifKVkG946xHry?=
 =?us-ascii?Q?Kfpij2jWI3hADRv6ASEx8uDTU7dSC1yPoJdkvAO1QJTGqQA/lK2esd8UOkp8?=
 =?us-ascii?Q?JjYnfJgNTiGcEAU7/x5yB+hXvLXRDdD7WqyQz9FMlj4yMrMhuHAmrOrcAqC8?=
 =?us-ascii?Q?6tHNmbGkTsO65/MOIGMLzPutamR08qkDFUU/Br1kdq6E7FDuvHiTDsooNJ2e?=
 =?us-ascii?Q?HHLMNEOu8wfGst0ufMUrrR1Er3MV2Zee1WYDaNL/HuKb+h1F2nm6EO3PFZVI?=
 =?us-ascii?Q?vl4v9pPuV71cslUO8FPhcTBCHSfRfB8XEexl45NlG49+L6j7D6woLZv3V86k?=
 =?us-ascii?Q?vnC0M1RpDyGYbkUec7Lt9YOOWXC3XKmTMC+Tzg3EQpLY5SxTzEsbTSNUYwoV?=
 =?us-ascii?Q?WYoTqgXrVR3tRf9ZDRE7iDf+4RwtXtlF1Kuv3NrhAFFPycLBR23i9LfaiLnb?=
 =?us-ascii?Q?R8jtb84i090NwiUNlXwbiUUWALDDtaU4qQzH3FB/XpAAio7GdaLCjiiXBtAy?=
 =?us-ascii?Q?bmpWpiVt3IGKEVvGrsclB/OShGm+0w8ogv1lvIF7ugfNkzRnAv1qDhKhI2lg?=
 =?us-ascii?Q?OmM7cuW2C0fJAvEDesSrpaI3eLMFQqSCjkCu12EouCqyPIoFI45uKdFWWGxH?=
 =?us-ascii?Q?RRGIBuRLEYVImwHKoERPC5Rw+30mrHJQ5mihkD04AFIkfaStqXVoRZFp5ZLE?=
 =?us-ascii?Q?1/N8xfU3CxpXpeadyGbQQbSJno3yCQVqY7smakNtO/PcNJwrVL+rV8Y4QzIp?=
 =?us-ascii?Q?ckG+dWCBAcTVj59OA5jZzzM3vYGwsWAJT7HPYBgpYn0Rtxlxrzz2Za/zUKNP?=
 =?us-ascii?Q?acz0uhXAcM8+SaRsXKeX/QRy9i4hDdj6W2C1btWuTtwJdz/Zxng4eJqq8mzp?=
 =?us-ascii?Q?7Zy4Z1T0tyTd5v1slBgLbiZm4aO9Yu1ziGGkK+Z54MNDl2kAqLKsLqkFS+Cg?=
 =?us-ascii?Q?W75w+xBnIO0a7nVjg2osv3tXj8jL9XELDEN6b8egLSxW6o08crN46wjjCg8U?=
 =?us-ascii?Q?buNV8/rl8MoTTZyH0Ri/vMFp1ggIbhczfmWVEcDV+Wv/uT7QmMpvwAU+HIAa?=
 =?us-ascii?Q?qTI27DbBPIv5d+y4YWpKSAKfJgUVrYx7yQhWgB4J2PEFRCodH2uBbijSgrOk?=
 =?us-ascii?Q?x4YZ7mq3etDDcFA7emJXTH2/qKi4zvGkGuz/Uz9X6IkmrNkZkwXA7OjQ6Vex?=
 =?us-ascii?Q?qz+Z3n8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xdQcE6gNamYuGn8qIyZr6DzaaklWL57/SOJ425Lhtl+nG1tKK4FVBykyJn+g?=
 =?us-ascii?Q?FNLPsLOjD0AaIvhL5u/RGTptzmaQvc3pym9rUvoRFrePNbqNKXHJnrn+NBR8?=
 =?us-ascii?Q?h1JOd22T4IecU04YvxuSAmnd9yeEsiabWXmZEf3eE0a4xw8NCOVr/N0fY5tR?=
 =?us-ascii?Q?7u7id/i6vs/sWhwQh0QvJptSiKYrL1VIfj+CBCVLL2BVZ5/sBWf8Ww0yvJyH?=
 =?us-ascii?Q?mn8uOgvDF88CD3RNgNyNxA8r/Bf6GU+aDFHdrDRKLI9MjyUjwx/annfCLsRS?=
 =?us-ascii?Q?9+PLNEEOWkPmQEd9ou8rOSI512CGbYP/J+rNh82zVKzoNHIeQauWPviZEKYM?=
 =?us-ascii?Q?EJ+SAYeeRjvPuzbhF5L868RRo4DJrrViUYWVATYC3ORzNwiF+6Fkz29HLbf/?=
 =?us-ascii?Q?x4CFAWidv0gqjYpiayVHjJXWJCc2nrlUNy19f5da6KXirfu+uD5xGRkU85RW?=
 =?us-ascii?Q?MesxmChIIOngRfzfnJCkxGYaE0ourxLUM+g8cG5OrpIDCakiboqK7pCkvJu+?=
 =?us-ascii?Q?Y8S6rRwEj/h7dI38FpbytK4/oOiIH35ZA0eHv0JwpNSzychZZK2qHvzktW5a?=
 =?us-ascii?Q?P58n5woohVCcm2AoeZpUSKzVrW3tTZKzwy2HILtc8xoJ9n+ACIBF7CoBaG2u?=
 =?us-ascii?Q?vfiXm9+OEdff2WcQ0d+pggTiSaTh/qIy0DCZ0VFipq682ypWrVs7UAbTiAUs?=
 =?us-ascii?Q?PXKPJOnztwFfY2BXSMzuFW4ri9RfYxRpmQ98v8wLi6vP4c4Q8kEnpSj7g5AB?=
 =?us-ascii?Q?8BI4HnQ4u3s1JjqRdi3mvq4uj9jXN+xc93UQT0EGUkmqu630S5yYn1huaXYE?=
 =?us-ascii?Q?En3yz1iMkJ4tIVmlIz0R0qPjiBI2Wr2HZ5gACKcCFgH/kfSSqGQJqh9Zg9Gz?=
 =?us-ascii?Q?OJsNCbLRa15DzJcnMD8ngSVBzYn7QN9/M29TGzdrRMk8Vywkbl5Z+ajiVDZp?=
 =?us-ascii?Q?8NIS0BGTA8Pw9BGTHbUcXGuH9DLWsHPHBtpBMGVLeNhBJl9r0AW/xsYrwfM0?=
 =?us-ascii?Q?ErCUAn8h1qHpoo5sU6p3hsBoixnfPGyQEbZ1ZjTljctX5+pwbRiclD1RS+jy?=
 =?us-ascii?Q?7yHcYR1FjFhsSjOMvzFdndrb3m0jSD/0zoe0wcVJ+W9dBfXG6N7MT/kv3t9H?=
 =?us-ascii?Q?vUd000eo8xQw2I/crOmJgnaKmj4bAd/H/jyQh1nc1LwGy8zhsQh+sl+UVLAF?=
 =?us-ascii?Q?HSquSUSAmcKA1Ni6fepoOZsYQ0/80iyyt61xnnnEav7iADXkDcIN/y9AeArm?=
 =?us-ascii?Q?t8uz4e1BXx3qISTT2eajv+PBV5LwPlu2MX1ZyX+40F3/NhA0J7IbVLwc1AJx?=
 =?us-ascii?Q?4kqcJomV664IjPOmLzHgZnXELTh+7vH2gDqrwNiB38Xy+nDvxDKEBZL61PHv?=
 =?us-ascii?Q?020BMf/eWc1lpG3b6YUFETHGndmDbLJdMUyxf+hIgidYfdfbRkPLDGcX7JZ+?=
 =?us-ascii?Q?6xHvAKG6edIhMVEd6+znpYP5eaVo7CT6YI14hB9MERNp5sa+BiPf8nJRjo9z?=
 =?us-ascii?Q?zZWWGjfY2k7jvxabMxMe+9RSV9CjIrXS0AGyTQOuN/VNJFSIm5gCQqIDnHFE?=
 =?us-ascii?Q?ngt+3ce7st7t9LaW6/W5O/DZBD73UhPR012QWyqf/109H1zSlagrsPQumyEO?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc232f0a-f16d-45c1-9873-08dcd1b862b6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 16:48:24.2973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJ4bJHF0FBLv/SEeiqsXyDdHBpkDcEs+VLy5XlTn6nE4AnmeKjC3Lhd3cEEFGmhG76GbqNS/ogvENTqNn2POAmLLlxjQp2jeMRiRZ3YiPIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4882
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

On Tue, Sep 10, 2024 at 09:55:23PM GMT, Riana Tauro wrote:
>Hi Rodrigo/ Matthew
>
>There was an error when this change was merged to linux-next
>https://lore.kernel.org/r/20240909195939.067c1c13@canb.auug.org.au
>
>The conflict was because the below commit
>
>https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=for-next/hardening&id=3ff37dbb1ae9926d3b51749f7d0d3f474fe2440b
>
>Jani suggested to rename or remove it in 
>https://patchwork.freedesktop.org/patch/612760/?series=136477&rev=5.
>
>Removed it for now, will add it once the commit is in the tree

I think this should just be solved as normal merge conflict.

It's already solved in linux-next with the right conflict resolution,
which is to drop the local helper from drivers/gpu/drm/xe/xe_gt_idle.c
and just use the helper from include/linux/string_choices.h.
No need to drop it here and then eventually bringing the same change
back.

Lucas De Marchi
