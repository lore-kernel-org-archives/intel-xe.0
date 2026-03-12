Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F958106ACDF
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 19:10:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C58910E255;
	Thu, 12 Mar 2026 19:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQWWSQnQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE20810E255
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Mar 2026 19:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773342636; x=1804878636;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Z//BcDQUmfon2W7Bph3RlRNhcsW9igJn1hLDU++FgzE=;
 b=NQWWSQnQ3LvVgAsH9GGu31t2v7iu6ocj0FigNqSOQQU0p5l8umnEzZWK
 pfRzbK6iMrqN7bpPKFCIPUjxxwemdSqufqLQN5WBTSMoESQcFYwFmtKAN
 EHry6gjK6OgJzFcmeOFgSM+v26SZnveIle0FCp6bP+u63MAjJJcXDKYNZ
 kvwT3bjfD4LzErSCdImrI1tvMMEeZ7HgamRg5olJAzbWRgJyx4KB/PQn8
 s+qpZghtmfJzNsUlrSO75qZvp1kv2PZmVTNga8qMY9ciC5xd7i/0VkwTx
 JGXJtrSOsk90YC+Ntajd2u3kqdhRudhp1sy5Uxe6Nx8yLuDkX71BapW2E g==;
X-CSE-ConnectionGUID: hRpptdw8StWv/Ya/5HpHPA==
X-CSE-MsgGUID: tt2UtTpgSHmyOavLv70wIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74418282"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="74418282"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 12:10:36 -0700
X-CSE-ConnectionGUID: YfM7IbvvSuaSFfW+2SglkQ==
X-CSE-MsgGUID: l8r/8wp7QLim2v3RfYNh8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="225380735"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 12:10:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 12:10:34 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 12:10:34 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 12:10:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DP3lpxbpG39t9Qq+xfWwrf8yC1bhOUs3TrnPNfy3jfgbH8sVM2V+XCGrDsdFMvYnR+ZWBXbWOjqiOSmdDBYqnp8YMDvCWXiFvogPKUZakhoyZA/UXYc9yA5fjOu2w3t59TSens62wHWy4FnGCuh+K+QbHOMq5qDKyfIvvNwPhyqvmc3wG/7VaPwdMgzg+ZG39LV66/NTa0ZtYuSYJmBXwSK4ncoYsVbF3ZjA4yn996PQGcEybQPAVnXMK0bV0gy6A2NIVFtsSiONozjjvs9+UYamQJqlnhBDGtU0hlDT//iaY0vB5JcOXr+fN4CcB87tIxONe1/0orBcRQWj5iFPGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+F22ekxZEQ0eE+kq0FSQdHKRuqmo247vGuu1v/YantE=;
 b=DNbboSkYZL5tv27QsfrlFeVOGGRzLtHzkQhLN0To9yERLV8poW3FeoJ4oSe2HpOizrwYzI2NzlxqQSI1sQIZ18/ftk8F1ApW/1qF0K6Ml1gwZqE/kuO6+q+XmvuwzSbaLhwE9eI58pKMnl10qH0DhV+Cma2xW5KO6vwV2qcVhH9S9GcpBS8GB7bo7NnEonHeKyZJGKANWdbMSJTNkr450yeSited23kF1FGlaKloPr3+6MzspDagO++uSHfzWEdVGChojNbiUH0X16sCJfeI7wgO61TyWk522kaQoHNfrlUIiSLDDfdn5kvNEBpKfTShN7QNl++ZDD2c15tUfQDJsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Thu, 12 Mar
 2026 19:10:27 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 19:10:26 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/1] fixup! drm/xe/nvlp: Define GuC firmware for NVL-P
In-Reply-To: <7eceb569-f048-403e-abc4-2b741d51dd7d@intel.com>
References: <20260303213655.241442-3-gustavo.sousa@intel.com>
 <20260303213655.241442-4-gustavo.sousa@intel.com>
 <7eceb569-f048-403e-abc4-2b741d51dd7d@intel.com>
Date: Thu, 12 Mar 2026 16:10:14 -0300
Message-ID: <87h5qk6ezt.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::36) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH8PR11MB6879:EE_
X-MS-Office365-Filtering-Correlation-Id: 9422e215-78f6-4ce5-d853-08de806b04b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: g389A3dNlROeNQMbIoHNkvsN+bViTYkHKqbIO2OX9nD2MYPYZCAKEZaO7EW1MSipXlQXChxbSTtm+zgYGYyR5worWGO2iTGm5sjiI2kI0ou5p2OX2Y7weMm/t2mtqWEGj3FVRny7665TR4zPMungP34cdzjZpaTd40txk2Rle/tMPC3B4pe2X4/nFjQG4IuugUKqmlMxWP0JBrpD22FVqdXxcjQlTPPpoDbw/rPXY3kQO9FeMrsOcxIJ0rlrD8rfqy8h3Y/dIMz3hamWL0nmGzXtNng1iPAbhi6yyBokjMaKs+p6cAyUckN0bI35vZamZ8TeX2YnOjOclhv00tFOVmfG57bS5QsqIOA8ZbfHtfhxkOgjx5MIbEj4W0ZKSJzq10E/phL9xlZvUdU27+Uy5ib99r/IgP/AeHuaal9lZtRPAuJtTo8Is2T0VQBih2m4YjZY0xQS45izSgUzwNqJH3GcgSJ+riNAwJP/l7J3JLqv+XNHun54h7vINyUHM88QUQycah4rBojoey3e7ypMvtrbLSIrLhpXjoUK/GAJhHC6rHbTTTbM8MnUDsmnSmg4hes+sHYgHRPZFzpg2Ldx2yRx9eAM5rslVmcZJWRBoWTJyAT4vERtn3i3kHgc53/vN6f4TJUp7CcxzCioZ4vr9jfFE++INfb4JZeJlwtS1QmfWu/1DhPjhZvlypHN7/g6AqCOkqFH5fSZ9Kn7muS2+wr/+667TToiBv9uo7GLC+8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?peuFV/ZR85Fp16eigvB4x2UASYwPDBoUCAxOJnNHTlZ9q4wNqXrsZKBnjzuh?=
 =?us-ascii?Q?6a/KYVx4ZHZy42r8gKd9SsjnRvgIJa8B7dPUD4kBgMUy69j7Gpz9YmtO3wHU?=
 =?us-ascii?Q?AMFjtG9QflVjuUgEmSwN9H2xN4XnNPWUd2zcGaBtGatSXvkIVt8xVoYSlpIg?=
 =?us-ascii?Q?qS+MvfUy0Qolj9Rlf99HdIwEcwJ6FxbAFBb/1zFq4Zr6taLwTfoMKMGCfRTJ?=
 =?us-ascii?Q?rQvY+HPFOn8JDCc2s/OW2CKuRRJAS0O31mi69icb9NKfI+ERboUzEmlhaauc?=
 =?us-ascii?Q?W8kCqTVaAydMZkX1v80oEE9FXJo0TI7b335R18cFCBwYD8yAfdz7ZwrLfyNI?=
 =?us-ascii?Q?v2mQ+L7mVVKMg/GM4WbmXFYXaJn04A9OHxJ7H+8FP47AWvrGnvf4xuIEPVh5?=
 =?us-ascii?Q?5nWRWr8E4qZpGWkkaF70wl0+l5+eieQfqQH12mACSzhaSc3+cisLlDc2rKtr?=
 =?us-ascii?Q?wbT+mJrG/Wn+y2J8ZCrNa7XYnuJuwN1RdZ/TEbdQ6X5oDnNSrTjGeP3WAMXw?=
 =?us-ascii?Q?+7OFiaPsDebZ0wdXZ95e71pZ6thR0h5u+/eXcGU3kp/NqlHGLl+4NUUnRNmu?=
 =?us-ascii?Q?gDdLSUA/9qLwG7epwNFEPqqixV+Zk7lpteJRoBv4t3j9wWB/YmLm3y5odWQl?=
 =?us-ascii?Q?xHRT0lRBJH1r3jp66FEkpGFqeVydfXZSw9PUfSXuV2QI/30Xu+9IZNesDgUn?=
 =?us-ascii?Q?RWzJ5xVNyzoFNO6qPEtRojGcK/nxOgbul8HOdWmtIMuojx3rNErBqE/WLc+g?=
 =?us-ascii?Q?GLt7GVsvySQu9DEE/8vq713HEeOKRUpaXka27pTSDIoWqy4i8ovBWqqdYO5f?=
 =?us-ascii?Q?twgK9+30QsHC5bQu7qrSskaaCEA+ApLcJzOLJH2ivVqzHmbfMcB/xoPumZWj?=
 =?us-ascii?Q?aMNvJc7eA/mvsc/hJ994xLCQ0p6bEAlpjxHcnp3TIL42Z9TJvXPGF9Xrjm8l?=
 =?us-ascii?Q?Cqe6do/Nu5nKc102VGFdU54wtQ7x5AvEPw1znVgrSDXPADsaBSxvxGs7HYtZ?=
 =?us-ascii?Q?+dBXsgglwp43KFWijCI1uuEF6OmApi4z0zxaTpwKANLklI7pWt9AIWrQHR9/?=
 =?us-ascii?Q?XoVJVMQMTNgcEgq1CmM4RqwMiZxo86aXTfLCC73NZrMKsASSjV3PFy6b/HNe?=
 =?us-ascii?Q?j7h7MF+qtpS2ZjAlEpDc2mf2LSWnehpxEh5JIsScvYvA9AzM+HJIQP3xJtE6?=
 =?us-ascii?Q?EoZ2q+G/jutWjU4FujqGqwG5960UZGK13vl5nNj4vQYkCtsNPibuk5GlFZ2s?=
 =?us-ascii?Q?92D/4JDG5yFD9V8yXkycTaLGpU8z1x/Ne2WPKLB4xiTaAbbRgq2o8QgM12ar?=
 =?us-ascii?Q?Ltt1zm2mNyvLTxMpVy63ZQD8D2FKLNx5P6FB3rP6ur3/kvJbze7CGFV79mLG?=
 =?us-ascii?Q?+6bSunrkEmYyzXy9fnqkP0yxUzOoAkfKNTJ3MULCpNiakjIz0Jp9s24RX7ER?=
 =?us-ascii?Q?65R2u1d6/EVgnkQuiBFFHh5MvXKJ2EKvkDDfasHIVOkjYagaciImIYxzwJBr?=
 =?us-ascii?Q?MDU001nLm9pLp8mxq5RVmUL6FXeE5erjK4GUsLHyHpKE9GU5xFhM9fv83Jzh?=
 =?us-ascii?Q?rccUBirzs0Tm202uS4MSFTpMstnUQ4BfCHqnYsEO3mDtO8+nGNH4WPyGCXgn?=
 =?us-ascii?Q?A8UU3VOMIaq5QcAHDFohRt6z6UrmFznHTZpKuVeoX77d7oqxZREcZ+nBGwQI?=
 =?us-ascii?Q?qlptzO5iy/upmv9aeRYlYsIfowucGgdiSXiEDMVyAHFi4Vk1jMij57GSR2fm?=
 =?us-ascii?Q?1ZA8BSHJzQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: QkyU282GLJksaTsDOhze7Hzs9VdSitoQr/YKG4UpfH98A0IR4rDhJMR9yEAOtmHZccS49S1Ri1VA0sMKyacEKt6GLFvNePITu/YCFcxh4+xwLHCUTlIC0yz3BkD2ElfsE8laaRXV99KfmQIWZpZuerY+eZrtMkF3wfIXYItLix+ADlVOgcxRWy0Q3XdUcN4KOWZ6h1j6K+a+vmE3K1WteKSqAv/lJREeVQG3SwYRT9GwCMFIkeOLKgSXnYjmm3e3VcDUs+kHyxG+NS3jm6LcUDCJ328d6WJufztP7B5yjP/UcUadY90dcU2y2mkJuUsylcg8+QUziFxZihDA3As5lA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9422e215-78f6-4ce5-d853-08de806b04b8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 19:10:26.4493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: drDLtj7ney4bKwI+1E6K2Vt12hYFxRTCmQYQ9g1+HdNu1INdSoWvgRF1T1e2+4lZd6iDam8IYism0Uyz/pV9AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6879
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

Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> writes:

> We usually specify it in the patch tag when the patches are meant for 
> topic/xe-for-ci
>
> On 3/3/2026 1:36 PM, Gustavo Sousa wrote:
>> Update GuC version for NVL-P to v70.60.0.
>>
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Thanks, Daniele!

I think now we need help from an Xe maintainer on applying this to topic/xe-for-CI.

--
Gustavo Sousa

>
> Daniele
>
>> ---
>>   drivers/gpu/drm/xe/xe_uc_fw.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index 60c82b920f47..9aa8deefa6c4 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -115,8 +115,8 @@ struct fw_blobs_by_type {
>>   #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
>>   
>>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
>> -	fw_def(NOVALAKE_P,	GT_TYPE_MAIN,	mmp_ver(xe,	guc,	nvlpg,	70, 55, 4))	\
>> -	fw_def(NOVALAKE_P,	GT_TYPE_MEDIA,	mmp_ver(xe,	guc,	nvlpm,	70, 55, 4))	\
>> +	fw_def(NOVALAKE_P,	GT_TYPE_MAIN,	mmp_ver(xe,	guc,	nvlpg,	70, 60, 0))	\
>> +	fw_def(NOVALAKE_P,	GT_TYPE_MEDIA,	mmp_ver(xe,	guc,	nvlpm,	70, 60, 0))	\
>>   	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 55, 4))	\
>>   	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 55, 4))	\
>>   	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
