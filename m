Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FE7C52D73
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 06:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0233D10E651;
	Thu,  8 Aug 2024 06:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dMEyFXhu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC4B10E657
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 06:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723097508; x=1754633508;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ri0IoMNtUkL6hYPUoltDj2KunLw7TVgyTA0KvV4wxHQ=;
 b=dMEyFXhu1UbpT1M/wtusj4oPHEmWhaHhagUjSu8ibqmTnq+Ek543CE3r
 J8+KJFv6IHlWWHOSY2gmT/usGpuTcw2ZxMEKzQF137KFds4jnIOWjZvVj
 JrjfFpPpl5RzVOcUl9Syj+wBo/6uFJTy7OvKVx8Y4YXHRzMHbuDdC57P3
 0deGXttgQ45eaZu6mZtKDyxZKYGWcttVbdfgveGd26Wr5Aok9mLH0H1Og
 L6qsGkd0FuOJx469yyJYK7MU6/cHw9MLhxsveEbfOqG8S1ZehzgBnquvg
 Jya+TrpxFMlGD1CaXc7PC5eyCYM5TfxI0qIkMO07fNhFgij36v5RP8CpV A==;
X-CSE-ConnectionGUID: dCVeCL5KSk6nPXE6xWjATw==
X-CSE-MsgGUID: CWUpMXbcS5G1I0JnPaiozg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="38710274"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="38710274"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 23:11:28 -0700
X-CSE-ConnectionGUID: A/mB3w7lTtaUK4OBBtxbCA==
X-CSE-MsgGUID: QjSAMebnSrOPHr4hx/vzSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="61517897"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 23:11:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 23:11:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 23:11:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 23:11:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 23:11:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBfk30fKhjmwHUrvZHPwtpEuM1tp13exyMnYg7WDCROunqWabCXsaoSns6x2CAo88qqLV8ZPqhPvQpg6Axwcv5DsKqs8XujdUtjvRTp3LxvgOBW9A4Zsqcq6jC1bWUYYup4Fgg3ySWzjXkerKKMXSCKly/yMa1XPpCMgCUJZlJZGCZu2jbM/R86S1zT+hb/jnM3+b5WrEl16z07+MkqknB5YcJsr5/m+EUq3WhEXy2PAu+Vh4HfEoxIBlur48z1Nfj+bzfivU5S6OpSsdcjQuoYBheTi6HgUoQ/ATauHY2SAe5p51JQqlmZqaeCTmSiMpJgDwE441+xWniBeQJAwWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ri0IoMNtUkL6hYPUoltDj2KunLw7TVgyTA0KvV4wxHQ=;
 b=oc9DML4Kdn3dIL0nLpkjBMd+UE6e/tryD1a7izRJsBUn3Ow4QiWLqdu48BRSH73ONPE2kyg3kfB0yde+M4GTlx2zNv3a7ufu1amdIlKElQF5oSoa6IK+/RSH1E7SLJuT/KHnZyr/U4voQVkAwKKSbkay05IeONa7qVUYLOSZM9PG+39ed6vy+GZIfI3Dg1qQNQrRVRIMCep81cP2dPQit5PG9Jum5ApnuAHwyCfya9Ji5Wfc58fEjbe1yDkoctWzuMTSsVh7K+tguVSZOba9ajHPaPq7K6YmNFSbT0R2utm5jFPE1Vd54hIxRHyJlo0vyW+6k24WaPfqfrmydgYI2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7765.namprd11.prod.outlook.com (2603:10b6:8:130::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Thu, 8 Aug
 2024 06:11:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 06:11:21 +0000
Date: Thu, 8 Aug 2024 01:11:18 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Write all slices if its mcr register
Message-ID: <bddnaxn2so4nuad6unwd6irgegspk3d5t3kh76iz2anvaaqhx3@wqrtla3ueo4g>
References: <20240808060251.510586-1-tejas.upadhyay@intel.com>
 <20240808060251.510586-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240808060251.510586-2-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR04CA0349.namprd04.prod.outlook.com
 (2603:10b6:303:8a::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7765:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b576b49-3df4-48aa-42d8-08dcb770ec77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gnjRuO4g7VD6QUOlRiGlmpyq/LsxnrTiHQtnUmB00rdRaoxZiuY1md6YnrwU?=
 =?us-ascii?Q?Em7ERnPaU5lJ0PeJUo35lzUuMHiJ/CCcUc8oGTBZCctEVplMui4nQhllBV04?=
 =?us-ascii?Q?8CbR2q6GYIaV7RNZTGa3ycZN5gnyUxnqtxANOcUy4NYl6S4JkRimtDK9N0ti?=
 =?us-ascii?Q?qR5c9PF4D7HqB9t3BvYvdF+vbxQfNWUsYv6Sm8ivkmDFtMgY7L0vyvvmjSQM?=
 =?us-ascii?Q?KsX1PmQcbr/h3vl8C+sAWRuSfcm60OjqFjwB6mCjMtFrlaI+1/Vsu6g8sycX?=
 =?us-ascii?Q?5OlCMzu0/dGnq0LnIORBx9XD4G5Mkr4R2GlKGKMLE2PuBI03PCaPP0nrqbtL?=
 =?us-ascii?Q?07Z+xHGW1Zi8qD7ZaDgYay+vGlarLr+f0kpP17XhLV3cqRkExwye/6O91J/Y?=
 =?us-ascii?Q?uQ1RNPp4LS6nqegREfnRQsXw3XIBylSI53aOJagbrHmP1Yu4tyig0lKXH6fs?=
 =?us-ascii?Q?VUZpiTJgM25jM5RBb8mLO27iKrqNsepuN2rkUkfk1JZuJzc/4HxhMsAYcqdM?=
 =?us-ascii?Q?uCcHN/qPClrJ3TycJUin1VMQYTOOHPm9yhRlS/O6Z8hNrYyHfcS4P5IUZ2FU?=
 =?us-ascii?Q?GElElPtbXqiipOAMB8Q+be4u378HhO7jLCDF3oF5EwCCcdpKc3I76pXpGPgy?=
 =?us-ascii?Q?m/IylowPN3OvdxVueMG5OCMBt71MxTYbK/AZbcfEsS9kQVsJSbSXSsAk4mkL?=
 =?us-ascii?Q?JmkmW1baSJM8KVOVZu1XqifQVkAdOucHC2dibZIJX/VRaPt3M/PfjvprBssn?=
 =?us-ascii?Q?6xujecOYC5kgVf+umGtkylKaR6qqnrmNKFW1TKxOiCUsrvKRBCfiWDa3worC?=
 =?us-ascii?Q?D/6Clsr9ERzDCq6eHTLFVcYCxNFCLsuNcRxEA+Kx32hB/U8Qwdhg6KFR+py1?=
 =?us-ascii?Q?OJzekW9VP16I+PqTqsqfUFa5gifUiA7TUSI95Bi/EngABSZJUYXzsYP12Kte?=
 =?us-ascii?Q?zgdBVkLP5GhWK5wBZ8hRBhJgpu5BXTs8HmJBd2fJHQa7LpqHLLpNuJkfzbQ5?=
 =?us-ascii?Q?eUSjvNNmNOal5xTzNhZKKjpuJjUFtBuxqKlnq/eI8JbIg34he5QnvDqngdPs?=
 =?us-ascii?Q?yc39fMq3y5YXw/QUZbM8Gzt37Xg3todKnVPvxPXcanKX/5khgmXeMoS8nMUW?=
 =?us-ascii?Q?w/RJNUtFN4h0pDS2YUUGq+HD6G8dQMA+Vw3J6ZT+JHHvDsRnWA/n8OCpEH6K?=
 =?us-ascii?Q?B7chP//dRCdfQZG0bB0KqAdbazOt54uoSSsYffOWKJW8cRc0jYpQHIIsORWQ?=
 =?us-ascii?Q?GwTRAlR9BRti1Cw/YvkWIOmjc24pwc2Jq0jmMzTBXEIHwtEW08ftja+LtXZx?=
 =?us-ascii?Q?ZKtWwLE+SK8pbgOHQghbZLWtVYU29GH14pJuwPCyPf4YBQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jf0oNseXZHc5ZQOrwWIc27CCEQXSLj5X5AKha0wJn+/3C/FBTqh4VgqTn1yf?=
 =?us-ascii?Q?IKYn2CurC3vftDNyfnwLeA/xgjLHfR9isMY0/tAhRmmipJTuyF0a+TBTnHdn?=
 =?us-ascii?Q?7lai/pJ+y4KYMHQfyEK0cJN8Mhcx2/Wfq8s8F+vG4YqT3Lx9DDmiK/SHoX/i?=
 =?us-ascii?Q?nFEl31fSXkZzBNZ15GHSkii4hQYC+Puyg5Kjc4DH37HdQMq/SMf7N2FZd6Zg?=
 =?us-ascii?Q?iQP58aD0dfwGlLvYSGAr5OR6fpXNb3lSWt1gyxPDBekCTkiYdjfCmE+tmkwz?=
 =?us-ascii?Q?O/v6ZPYjz88RpRnRd4bFSaqqkXXNTXCdrsiZUGukkqEltabRBHTWwVmL9eGO?=
 =?us-ascii?Q?QJbYS12dyVWmPbKrsV2YLJUIHbQ5ql/CdrhCXJ7zLqJ78ssJNtx21sMgTpyt?=
 =?us-ascii?Q?IU9hMHiii9cUBUYOOuSWx5l2UBsDLAerR3/ucuh19hdLUBwBx4mRMsSGgqfL?=
 =?us-ascii?Q?ijw6JN7NX5t9uIbcGyrisxQSIowSRjukglj+kUVSUqI2t6l6DOLxZ9cXLEOW?=
 =?us-ascii?Q?T2G4cAp/YGBy63WGfCee0OYyJE523hCJNdsDekGShgLlo5c+a6pqJA2Fel0I?=
 =?us-ascii?Q?Soe2KonndD4PdFOXB3lcFmteZVNM+lUQcnkmY2wsSAqUEQf6ViNnzpmeqxdd?=
 =?us-ascii?Q?vPaqFDS90DVcKv/0O8HqpQB67/dq1sQe18v3DxBwvQk6lSJ06OdxO39Liqoe?=
 =?us-ascii?Q?aKHBS8jIu12DCvh27Xc1MP0eJd8j9HigoV47XwBiM8nJEI/cY/Ya8n/DHIy2?=
 =?us-ascii?Q?LGFLCu5Uw2iqDIl26kdfhHAeoapj2B+cay/g8TGi+4hQmGZJc0yL8/xo09Xb?=
 =?us-ascii?Q?anKcoYB6QOp8Ypt+PpyJcpqtW+1w2PXcehnF11ErqxaXl9BrZbxGd9iSTve/?=
 =?us-ascii?Q?c3xLFOYbJqGq+vs1HuL7Vrn6y7lmGyuRGETjJGsvQMuVwmR3FC93Fx4L4j/5?=
 =?us-ascii?Q?ABjP9xtqjpVSJPC+bFOsSDWlk7kXBGjXxbHmCvqkKWuNmnCxl6oRSo8q87Il?=
 =?us-ascii?Q?y//ysUIl15QgU1Gsqj7W6XutsC3PWnaTPZ75qooSRKMRKivBXMvw/Am9Vmce?=
 =?us-ascii?Q?4xPTx+xQH0zCEienzXOklS28Aaka0WK1McAjKF6RoFG9lxe/EY3/FW9HegZ0?=
 =?us-ascii?Q?FPw/JS6TleHvQaiDovzyEegr4zAWWvdbSRsKmqztig5n49ywdOdQI+C8tCdZ?=
 =?us-ascii?Q?ulc+gXo9ThdN9Ds4oimrkKkvl5Ov7dwzAyi9w12m3Nec4zgjHQH0RIQu2I85?=
 =?us-ascii?Q?zJKXcbuF0smmcNHbfhlx2GCjvHGJrLbO/t0mjICLsTUBinM0a/pw9ZWtabfF?=
 =?us-ascii?Q?BjhfXIWsMxUo7CLYqDGPXp/tVQSaHo/Am9ZBSr5gcQguwJUovTTH7EnhuETM?=
 =?us-ascii?Q?XJt4QTB/PmysRQM8XGppsIeQ+yCXblap9aLNiMFFFM8RYPPwqNcatih4dFH5?=
 =?us-ascii?Q?Fo+Q0ZHsSss7dKwT9NLJZpO0KIU5e1p/1Piz7Q54ODsPf3ER663dLDJzP7xY?=
 =?us-ascii?Q?aqo5bBDhrNXY7c92NE6zMXXOoUjBf3T6oNov4LWgRa8iRdCAdpiWKNmo5Tfp?=
 =?us-ascii?Q?dTHiGh+37NOy5wcc1xb98GUoFASEuET27h8nHjG2PmsXl08xFZkLWfkPN2ME?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b576b49-3df4-48aa-42d8-08dcb770ec77
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 06:11:21.1878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rwMg8X8jxbnOy0y9jnynGRAILXZU+F2Bg2sPc9fZNPkoHYU97sqbosankwET0pdV6zR2ZHG8+cw2G3BoctdgkF6YqGOkk1xbtfHoUghk2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7765
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

On Thu, Aug 08, 2024 at 11:32:50AM GMT, Tejas Upadhyay wrote:
>Register GAMREQSTRM_CTRL should be considered mcr register
>which should write to all slices as per documentation.
>
>Bspec: 71185
>Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

patch order is wrong as this creates and issue that is fixed in the
following patch. Rather make the other patch the first so the bug never
shows up

Lucas De Marchi
