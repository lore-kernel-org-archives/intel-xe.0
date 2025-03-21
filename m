Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DF3C36000
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 18:42:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F2510E81C;
	Fri, 21 Mar 2025 18:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i2ZZCFrO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97BE10E81C
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Mar 2025 18:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742582570; x=1774118570;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GkwFh6EpKDahLratCHJ+pQJbJdhtz1ce1mqnpAX1ppg=;
 b=i2ZZCFrOYF+2jEoUZsR2cjI68EHi2Erc8syyaRSK8D+BMQD1EU/YCqkI
 8QRyrzJ8/GJU5fhpRJeuX+2h9G4FuJ5TeRpXo9RINYauLq/F/Mb1GqIbA
 4wTFQZhMOALE35Qn82qGum+atJNAlfd2XqfvfO4Up9do9wDzGDv52kw34
 XxTm9Pf/W1JUjuSCUKdzCOxqmmqxavrwKXY2VhnTz7P53YUyZEbsRYOIZ
 PmEt1+0IhsgX7GDKwFtI6WUkNXN96QG2NhybyWSowFItMLXGio3NWd2sr
 XVoC1hDtqeN8QWY2OGW83bZmh7LmKcUiYZoHSwhkL9I/zv0SOc21fYeH5 A==;
X-CSE-ConnectionGUID: E7SK/9L8THad8tN9UrDcDQ==
X-CSE-MsgGUID: l/yiOc9JQrWFHDDaZ47xpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43741948"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="43741948"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 11:42:50 -0700
X-CSE-ConnectionGUID: v+LCtKv6QPySGv2pN0J4xg==
X-CSE-MsgGUID: 9vnJ+R23T3+3+X+378XOPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="154376327"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 11:42:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Mar 2025 11:42:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Mar 2025 11:42:48 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Mar 2025 11:42:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJjJbkF6j9qyzfuyDNQpZBzhHxhJox+osn1wnUNmagxhQ3vYs5yzqkGrIR9JsG2fW68DO4RcchKoE0n+s57RcEWtXW8H0vAfjbE5dK84i4B+OudnAPWockuxAIfT7s4N+WAGUZQaVhnkCgwTVJ6NlWhzk1Bv8Tzl1v2opVrUvm6SMsF+UUIGvxD1kB3cCnh6h22c+9sgI9xODOSnZqPePX6RBlWxgBhAJytGQTDs1CTNXY6IMyWIK7P0eTgcPWwq/ovoTq4cazc/H3Y8GrKfyT4KGcReWka6dptV3sY3wPJdLjVyT3J4buxxURjdXQcO+8neIe8LBZ6TMEn6cUXB8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31u9lZxQ5ZM6Uz4f2eiUMjXUIesH454v2LjiEdDRLGo=;
 b=TcBxI+8qQicu/mIEEIQenwC+V3ZQFMjqrhbMQ+IK1uHo0ZkZ+rcrE8STXg/tTABZl7k2S1j7ZYZ6GbITFO4XbHpCW3cVEaR+TqoGnrOIdpSkOTxPq5+xF+HBONVsu9KLRY484fjdZM+rpiY3Z7XZPE4Tz8fZ28d5ycyDUWPldLs8LYkp05odK56xof4gsQs7k1xk6JbO9v93W8PLPyDfoVa68Zz86ZYUKHFDMGKJLRp5N66r6CH2BcuL/TcMWMZPGzcEU+4MqoE9VhQabHBYNSFd3egBSXiRsukiCZ9VR2VV1k13zWZRd5t1u3T3kJSMcVyOcFY1hr66tQBKwhfECA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 18:42:46 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%7]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 18:42:46 +0000
Date: Fri, 21 Mar 2025 13:42:43 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: intel-xe <intel-xe@lists.freedesktop.org>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH 0/2] drm/xe: Support different GuCs per GT
Message-ID: <uhnmquck5uvxcwibuwaim2wttbufmlo6ne7ajzzwioe3s6orkd@b3g3tqxn5n6c>
References: <20250307-xe-per-gt-fw-v1-0-459574d76400@intel.com>
 <cc30ee16-f0bd-45de-b709-de35b0a70ef7@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <cc30ee16-f0bd-45de-b709-de35b0a70ef7@intel.com>
X-ClientProxiedBy: MW4PR04CA0345.namprd04.prod.outlook.com
 (2603:10b6:303:8a::20) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ0PR11MB5053:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f634cf4-6371-4709-f0f3-08dd68a82c0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CQ89FU/kgQksClRJbnyNWVcgBZeW9h/fPrZgknHqRytRXkUOBHzdhr0Zqzhd?=
 =?us-ascii?Q?ZH8XU8yR45udjFt+uGQnLUpzuoqZY0hfJzNhFDiNedUWxpmIkZMPefUW44hX?=
 =?us-ascii?Q?wAThabnvJOL+/EnR63KP43/4z2W4aSMh699vqjB4o4UmlNqSC7SDnABclEZK?=
 =?us-ascii?Q?6Iaz2eWroo4uLSPCe34Qf8o+MTKXE0DPuygDus0B2ouJaTAOeIDI6UaCr4KB?=
 =?us-ascii?Q?f58nQ4d55Aijy9jgw2EaU6hXbZWw2mJw0I2NTuI37b3wAstoLnOEJlvjnSIz?=
 =?us-ascii?Q?0Q8Ylo658RmFiuXJigVU2OaqswmT+wTlDCr9scm+kzEsOcX54uC9E8RSGUDH?=
 =?us-ascii?Q?8jOwfJz2XJoo1DCp0mU/KJQY41ZqNr0ALAnhy2wIjImXtT0U291fbDyOSrKc?=
 =?us-ascii?Q?6y8owfLK2oJ4PL89fmf4u9boz9/7KnenyYjoXwbMramnQSA0AwBTFoN6CES5?=
 =?us-ascii?Q?SBpa5gMQzds4vExhLp5ml2y2NHZABJOUG1b/JCJNnvxUa/z7hbsEJXMzmxhS?=
 =?us-ascii?Q?oWzYmvaPMrrKF0vEssYYCVWbswyD2NIAZ3AC3fGeSsboC2e8jeT0kNKRjOov?=
 =?us-ascii?Q?Stsfl4HiBVYpD5D1rYo4W9OmBAgfIxt2ikXdoNmpFgz1JCEOIbKkFybtgOK0?=
 =?us-ascii?Q?0D/tV0Z1nD6oINiMjWg86JIt03AdnXB0PP5JXqle0oPDSlBb5b8QgIhmO2mr?=
 =?us-ascii?Q?L5W5hNKnKhmkJpsjo/CPkmyMm3fYF8m+Yx1E6Qi6TRzG7dhvK+oaXU9gpbvt?=
 =?us-ascii?Q?UTHtrWmm17BfrhK5EMxyE4oMjUe8N6yLC0EXd7saoRt2dnyYeukcXU9ZM0Hy?=
 =?us-ascii?Q?Oal/NSalf3n/yPohEyQnKV2tLcU5/ANyNiZaafPtp+19b66pQx97aIPtYrZQ?=
 =?us-ascii?Q?hKIABE4XKumBr5t6unxc2/o0Rw8Y2rjCI4/8brcMjd8KMKBPnNYmGwP/xH8J?=
 =?us-ascii?Q?h7VecdCtgjPhLmsetiRJLLN/aMhY3P8+r8M9NXwZspMAVMRgi7aD2pcYG4L5?=
 =?us-ascii?Q?Rd8iOtzPk7NEUSKJ1mh9jmf9B1HyGhBAVG+tbkPIamPNY61BIWGSNUjRONFd?=
 =?us-ascii?Q?TD2mraaqadPSAHD8CDa/tZq+cnoDwqbVkOiMrszHOxf84m+nYPI3WMPJfN2B?=
 =?us-ascii?Q?4QwlGLG5sUJWSbx+gD6j419S6NIGc5xSgtLNhbcPQ6c0mj1Vs1nxRkw1SCTC?=
 =?us-ascii?Q?L1856M2OofFe7sSc9hp5LhI0FPCY8XLBSWm/HTL8i/8Vr/O4V3U+gu1yKkhc?=
 =?us-ascii?Q?qI55bePDXC7YX1lv/49i35gSA4DLYzPlk0hz8dAbtNQqSrcPXAnFSwnd3kNH?=
 =?us-ascii?Q?HvsVqvTD6noWxUXFoNbD2UEHwGuAesWPtzY1n+UrNkc6DzfuGZSTKGiEhiFL?=
 =?us-ascii?Q?bkNXiNC8J+jBBqaqg3IdJvsSPADR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fF7ANPYbaQGC7Lfp/3vopMVCqRenH2HGOjlV98zOyKk42mp4ZT5L9yXMn+B7?=
 =?us-ascii?Q?HXV5hQJ4S8XmyGhUU4U4um5vcPwsTBzwrj1W8xfeSGbnVxm+tXXiGA8xFyie?=
 =?us-ascii?Q?CjXsjMg6cVlsBzSmwJblTOv/P9xFyQThL/lJQcnks349GR38qfSpsIrX1Zz8?=
 =?us-ascii?Q?tlGfwOFzow19Z+8zlbbqzU+rkUaV0K6lXcZvNOV9h9FP08Xda/qVh3bmXHGc?=
 =?us-ascii?Q?y7ePaCH1Uw5/bTN/KHlB/U9xGAqLcGrPhURzxujXMHXZsZtfPAeQTKNf3vSN?=
 =?us-ascii?Q?laswjmmmOuJTVfoyylut+XsaQEy4NPoTPPWeFG8jq9mCPA93RlX950nsQdIB?=
 =?us-ascii?Q?pzUhyPZat5vYvqZKFdAwtg7G8fREESzCA+33tvtQkqnLWQp7nkIpPA0Va6WB?=
 =?us-ascii?Q?H5qKbiv0tAeP8Cz143Zr9EA6osME0++LQ5gLJT/V0VeVE3/n+x+hTNeKuZ3Z?=
 =?us-ascii?Q?6in/m7wIJuh1rsJLN3G9HZXHJkViAImEPgDbr752Hj+vr55DrlChfMzC31cL?=
 =?us-ascii?Q?zDui2CdEUAsmpl0bdMuGcgcMbsJn88g0BMrhSZBhkKOThJM+Gpk7LrMocJZg?=
 =?us-ascii?Q?mf4cxs4IJKfu13u2za30M6/nv3SLJyiB10GVthjmvL11rQewMOqkWpR9z57I?=
 =?us-ascii?Q?RnyXrHICt3YXtahrIRc27i8X/SNXF1o4jHHGIBOlim45G188+NatOscpFqrI?=
 =?us-ascii?Q?FyG68p1YWtTuyg3G3tpv6Glg/58kszbzSCOg8k30rUQ0THdDP7aS9JuMLnaZ?=
 =?us-ascii?Q?cyA5cVrX5eePTz1oW6zcUD4BFlDUuyddrhBAoouX3fbp61xg//m9lzHFhCTK?=
 =?us-ascii?Q?K8FWqcGRj6ljRc1zNW3wdttcSXJUL/b5AhDyfdDxJMsIWFbwD6q4DO4Q/raL?=
 =?us-ascii?Q?JaPWwlSy2SK7HDoYsRpMO0PDL8xenhLBNqEYJBZ3zf/kog+TXKuIcJjaaMPE?=
 =?us-ascii?Q?WEoT8W41sD7bgDqWME/MeED4rpNx1Cr9bmbX7o6ndG4dOUB3lTcpxuGDUhqE?=
 =?us-ascii?Q?Em33zEEIkeGmWEAH1mtxjQ86uVzMxsUWxVym5oJOGWO8MKDu2UcKoDEJ3oQ2?=
 =?us-ascii?Q?duCba6IMPNrqEfjdkfVt6AT7TeHYDP+Jqt4XGmqYyeTT39rpg7yUqHvRRkyI?=
 =?us-ascii?Q?RY2AJwI6mpbM62PMjjc0isNMlyextcfLsBfgpO0Oo25yBn4NkqslhU/TozS8?=
 =?us-ascii?Q?nexX1XjBY1AGh895z6Z/+Bj/6jY5BwsPErWmVGIaq1DF/n5H6yHRpaBK+u8I?=
 =?us-ascii?Q?xVs2oywRLJqL7qchnCYcTQwFZz2QqT5u3PefRe62JKGMyUXcU7wVdE2QDQPi?=
 =?us-ascii?Q?Uvjw6BufzH4SA49duX72eSORtSbhuL1R8oPsUl8z1OKnEgC37A7c6qp1h5Uh?=
 =?us-ascii?Q?M6+XN59p+hMo7bA01ekTVwxSIAA7uWmoIhLE42BpyPPxaeZabuepuaosE+SQ?=
 =?us-ascii?Q?fWMwe6WfbJY63EBBoYTLQSwfldx+F0opHcw8swDawPywdhqtGxEqgEYVXJ1m?=
 =?us-ascii?Q?6FcgZDNX3xvmrr1rJCF4fu0JTBZaan/8kXfACem+C62EZJg+SwaP5d4xeg60?=
 =?us-ascii?Q?CvJEuDGFBptCcSDj/7quHhB4brtYMWdSoI0KZ1Pd+oq7mC+075LqiEaO2Q/t?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f634cf4-6371-4709-f0f3-08dd68a82c0a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 18:42:46.2055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wB2OrW0SnXgrRNEFNCq+7fMZYNfikEWs0jRiYFaqfWbqLV4QsFWNJA/vJ6o90GJKS7OARjplzcNVf4vhQMr26cDk7vKCBsyyJKbJ/7xUqIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
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

On Thu, Mar 20, 2025 at 01:09:36PM -0700, John Harrison wrote:
>On 3/7/2025 10:13 AM, Lucas De Marchi wrote:
>>This is an alternative approach to what John sent at
>>https://lore.kernel.org/intel-xe/20250303195215.1046192-1-John.C.Harrison@Intel.com/
>>
>>Main thing is not making the name of the firmware magic, depending on
>>part of starting with "g" or "m". So here I add the gt type in a
>>pahole-friendly way and use it in the tables.
>>
>>Tested on BMG with the following table, just for tests:
>>
>>	fw_def(PANTHERLAKE,     GT_TYPE_ANY,    mmp_ver(xe,     guc,    ptl,    70, 38, 1))     \
>>	fw_def(BATTLEMAGE,      GT_TYPE_MEDIA,  mmp_ver(xe,     guc,    bmg,    70, 40, 2))     \
>>	fw_def(BATTLEMAGE,      GT_TYPE_ANY,    major_ver(xe,   guc,    bmg,    70, 29, 2))     \
>Longer lines, but otherwise seems like a better way of doing it.
>
>PS: Sorry for taking so long on the review, lots going on lately!
>
>>	...
>>
>>And with that I get (pasting just the relevant parts:
>>
>>	xe 0000:03:00.0: [drm] Using GuC firmware from xe/bmg_guc_70.bin version 70.36.0
>>	xe 0000:03:00.0: [drm:xe_guc_ct_enable [xe]] GT0: GuC CT communication channel enabled
>>	xe 0000:03:00.0: [drm] Using GuC firmware from xe/bmg_guc_70.40.2.bin version 70.40.2
>>	xe 0000:03:00.0: [drm:xe_guc_ct_enable [xe]] GT1: GuC CT communication channel enabled
>>
>>Something that we could also discuss is getting rid of the macro
>>indirections and just type the name of the file. Once upon a time we
>>needed to use different dirs, but now this only matters per for the file
>>name. The only repetition would be probably on the version. But I think
>>it would make it clearer what files we expect to have without the macro
>>indirections.
>Not convinced about that plan. Having the filename auto-generated from 
>specific fields ensures the format is correct. And duplicating the 
>version number seems wasteful.

yeah... we can leave this for later/never.

Thanks for the review. Pushed to drm-xe-next and rebased topic/xe-for-CI
on top.

Lucas De Marchi

>
>John.
>
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>Lucas De Marchi (2):
>>       drm/xe/uc: Remove static from loop variable
>>       drm/xe/uc: Add support for different firmware files on each GT
>>
>>  drivers/gpu/drm/xe/xe_uc_fw.c | 102 ++++++++++++++++++++++++------------------
>>  1 file changed, 59 insertions(+), 43 deletions(-)
>>---
>>base-commit: 2c4fba1d065427efba4aaed5f80f4664c9f4a729
>>change-id: 20250307-xe-per-gt-fw-4938dff9b339
>>
>>Best regards,
>
