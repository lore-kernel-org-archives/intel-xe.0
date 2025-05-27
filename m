Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9279AC54ED1
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 14:36:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EDE210E41F;
	Tue, 27 May 2025 14:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JrkSQz4o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C046210E41F
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 14:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748356573; x=1779892573;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+hzBK880Of7H8BfkO5NINkdESHSGWma+9tGMwpz12Qo=;
 b=JrkSQz4oSuze+jI3mRswvTqXEn0DDHq01Qoiuh6IhLUaTorziOaOp/XS
 63d/whsgea1KAw9j2msX6RWmXdW+CLvbOsgUiGicXw/3dCv+1dXrwM7EW
 K2bbtCl6QosXOG1rym166ZMyId0xoZvqIL8bTgSf7hDd2/AsLY+dto+LZ
 HWe74MoJF8EwlM6LlXoJfzWIfV9vCTES/BuPRU7U3EUV0RcUSnxX68zX/
 CTIuAfXSS09yUsNDZZ/nbBFhJ+mHTurqnqEq5/6c1ZmAdmZ4CmjAGSLtj
 AfygoJ42YxC0KazE0l9N7E50K1fL1d/hxnnOW7+x2gNaXrFyWZwDviyrx w==;
X-CSE-ConnectionGUID: KCjTwD0vTUqzamx1RVBxzw==
X-CSE-MsgGUID: Tj7R3avTS3ePfgzTvjVLzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="54002215"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="54002215"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 07:36:13 -0700
X-CSE-ConnectionGUID: a4s2kP8pTgCaVKdSsp42Fw==
X-CSE-MsgGUID: 9Zqvn6WrTi6ujKY8ehDKrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="142681748"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 07:36:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 07:36:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 07:36:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 07:36:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGwZSuVruJzYgvmDeIiGIIKkpnL25z72ciGUs5DR0ZAr9RamR/X4c0Uo3cvjwydYBnha93VYxoRIK3IrbA+rh4VA1YEIP1QeKMKC9TK4DjM9/5CXoCgRBM3KV8LFvDT25xxDXUdEDxaJqGOsR1YW4LvoeDOQHRilzDWagjQMut9Hv7JDg7rGc8HCv9RznUqp6KtIMf3XhbLx8V6Z0GCEY9o2mPKF4QCLEx/FTBVvdnVgIjaZaDnNWLDaCixjB39jwCDWYwwPJdqw4zJRzQ7nHgXMAyeYEe2OB0+zcfPxPcyyBEoaL7daqumkmoGH1bL6s5/K03bUCPs50lwwJcdT1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxMy9PkRLnRjfErpBh9W+s2RIK2MES8F6LbMrQ224rM=;
 b=ZxmvjjdY1jeeJ0aLXzGNZsROZHNpVaJSPEj+U0ehlnZVuaJ3a/NAYfNdADlJacO7UN0aF0q4Sz//dhVEFpXamnE3dJlaXVBarrb4mxe3sdxapLRoD2+JxDIhVVZkaUPg7iJMgRCjGTdV8ygkhM0VgoQcKii+BuCLqSjsLnOPCR5k75sq9Zpem234+Nrra54KmNqmp95kySAYQbcSo6nsnidanaHpafaYWCQmnh3yX/2iGdBHzlUfDlDF+vHf98cwN8JulzpsptxtUuZcErK+mDoLHotXOT1hCoemzgxaUPfMwpaZP6txlnqB6nVoRqVQXa2z74BZYeTjdKHR0bnNWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6138.namprd11.prod.outlook.com (2603:10b6:930:2a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Tue, 27 May
 2025 14:35:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 14:35:57 +0000
Date: Tue, 27 May 2025 09:35:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Stuart Summers
 <stuart.summers@intel.com>
Subject: Re: [PATCH v3 3/3] drm/xe/configfs: Add attribute to disable engines
Message-ID: <74u22y6codob6zkrammpjhbuw5zjwmi5scuh33o65nusydldsb@h5dbv3yxun63>
References: <20250523-engine-mask-v3-0-11817dc6eb63@intel.com>
 <20250523-engine-mask-v3-3-11817dc6eb63@intel.com>
 <20250523212157.GU5080@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250523212157.GU5080@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY1P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6138:EE_
X-MS-Office365-Filtering-Correlation-Id: deaf4a67-99a0-4642-b422-08dd9d2bcae1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?IDPv+rkF4uMxK3RCXH+o5pqlQp+h/GGRsmFBfgea+QFxw1j2B0IDt0APrH?=
 =?iso-8859-1?Q?cZFyTsm/usmNVnPIiaSjDwwEOeX8J+hJykk013e8fpFDUOGJsiPnFs7lPP?=
 =?iso-8859-1?Q?1N+NVoLYe0UhzkWe/rG9YCXBJTWDmbYx+oDK89BfLDR3l1h9YvGOOs5Q5Q?=
 =?iso-8859-1?Q?TnhX85jdoo0Ml4ASlt8c/Z40qjpCGhKK5RyL9NSS9l4bPcmH5uO864aF/s?=
 =?iso-8859-1?Q?Oly9mFGYpAxx54DQ6cwYXEYn581E7+pClAJFG8i2uKLbVIKYeqSkYy4HbT?=
 =?iso-8859-1?Q?JRRFeVD+sPRkrzTPBqZQ07pnHWB0YhxWlFFNEh9TiYCUHcvzwvkO9Ua8AJ?=
 =?iso-8859-1?Q?bZL8YxLNEcXtL3Lpzpky/u8EF+crBjLZmdV6s456S6Fq8E595NpkJkarno?=
 =?iso-8859-1?Q?VDSL/ec45DIG7iiIinYXVSm+OOjhToN6XEYNc4lHmQwyRg9iQCnpJ84HLG?=
 =?iso-8859-1?Q?9qjwsMdx3e5W9eed5i//EtCcpf9O+g973ynsgTtUFaG9kWsUCyESvI+sC/?=
 =?iso-8859-1?Q?TZyuFym9WNCPEoQg2dMDfwC8K4MllqvShIhmOHFusTA1++EaRsErpiZflN?=
 =?iso-8859-1?Q?zWaUDwQzEgyWTMQwumWOEyLhx0t5KXcepNxRMy6h64YS58WmvmTKdQWGJY?=
 =?iso-8859-1?Q?FHMcWJWGd5GsVaZB6jfTHQnmcnYYRJCs/4lrUqIshxYDdjl7q7y/t9vmhR?=
 =?iso-8859-1?Q?buslEFyp7EK997Wyfvw37t/gP2VdGmlwwMUqFQxcuDhTfSAES7JSdqMiEO?=
 =?iso-8859-1?Q?YALR+5VHVCNCOIdZypnHE+aZAvUGU3ORixkyNSDsdmkgj3JFfdI7Tt9BUk?=
 =?iso-8859-1?Q?sKSUTLPdUCw6QE3+R1Ce5+AEwTIJueZzgAIUSScDs4v7mvAypYdK/jmpjY?=
 =?iso-8859-1?Q?hRB0PgxfYuxrFyQZ3lQW67AqzGkVYexRa6c0DQqISzVnswDbmLShTfZG8y?=
 =?iso-8859-1?Q?wDQe8ddp12JmXhJQA56dg8tb2rz92LXWy9u4f3OhfuKfpq49izSbqZLwY7?=
 =?iso-8859-1?Q?qXXLOvp3qQaSVVs4EEDNXPSwOHrLvXYgcw81iiHpJK5f809HWxyU1AiLiZ?=
 =?iso-8859-1?Q?KP7Mbi2fJA72LZYTEzMydsXPY/U8fyag2iwDWdQOyUI7oKAvwHaVPVcRxL?=
 =?iso-8859-1?Q?dAQYUsdpx/H4I5BNT11J3Ii99nmYge8n/NHOsXFRsbQvfISgnAK/U6bwii?=
 =?iso-8859-1?Q?yfKiibco/m1dYfF8SoHA/nu75Zlx1zmE+UtS36UqUEhgk6IIkcdY40TkNZ?=
 =?iso-8859-1?Q?MuK3NdHK1PjuCJB3vKkv9/2hYdiz7D6RTt1NGgIsUA9HF8HF1nB2QqeGNf?=
 =?iso-8859-1?Q?W9eToOo4RF2etOfZtc6HNcUBUmH/TD8PWxrI50ZMbTxUtvk72kqDSng4Fc?=
 =?iso-8859-1?Q?awuy7GM9G9/ONGpsMKXVuiQVXflrFIjC4IK3aPkzpFtozhWGturrL0u43E?=
 =?iso-8859-1?Q?zpMU0ayZGOP/lqDjr4e/dAG54REcE9GeazOzu7Li1FffsYJYgXkII4Fq+z?=
 =?iso-8859-1?Q?8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?79VyJVRtDnkB3l2R5UpE25Z5brPUl093+PprRo1eQ2dpmVjns+9mGFP+CZ?=
 =?iso-8859-1?Q?ZIQYKIw9BOklYjyTtjegqr9waLmUR+fiTT5UsRRQyOCakPG9sCruuJ/Ys7?=
 =?iso-8859-1?Q?+m1DKbnr/APIkLCeY6JSeLX5dRa8iN/EjJCHqjNCQQtovOb2F7Up/lc0cJ?=
 =?iso-8859-1?Q?FWyeC/9mC6rEulD0voK/UACioVcm9uwg7oWTgFOII9RrwN3P2X13yYU2ol?=
 =?iso-8859-1?Q?TqnFRTCJRHCZw7S05EnGuOPEYx9678uktd1ggv6DXpYaO0AHL7Sq3xQq2L?=
 =?iso-8859-1?Q?UjtDz3II7i2LNkYLbc9qgS8n7sfTHLOWLk535aA3d25PNtxaLB9lGhqrs4?=
 =?iso-8859-1?Q?WW17TiEyF28JVD6u3MfuOcEV+HnReLVaq6cUP2oCdBMRjR1SwQqpFGEHLe?=
 =?iso-8859-1?Q?+6qOhzF8WN5beRqwzJa+4F42ymqruXRyZktEmd2guKMmU5tSe70a/h7zQa?=
 =?iso-8859-1?Q?fu+gnF60rV0M1+Rz2K1r1kumnQCV3Me/qJYX6HC0qxshJbvxLtJsvJD/di?=
 =?iso-8859-1?Q?kyGm2JG7GwdvI93WMfIVgYhmUC/xSb0NB9BiER0/QuZUUFgAwM2PIUEJTx?=
 =?iso-8859-1?Q?afiSaviJrbie3v/rgN4a6vAX9bL4mHAmCTu94X9jivmy0EVzVXPrb/Ab7m?=
 =?iso-8859-1?Q?fHLcparBMB+F3OzY0tbyQ1JKy5azdywXtuSFxkkzcw89pLczkAeDl+rFQS?=
 =?iso-8859-1?Q?Lu//gg7GjvMtpipcWlJT9xtBA/jMvJIhwCAKwW5HxXRAdRIJU0B19QKvKf?=
 =?iso-8859-1?Q?wnti0WDd7eF0JIKzjgzH8t9JSVt+9Xz+jIu+yinwFK3nSi6XRhlBQ5Rzzb?=
 =?iso-8859-1?Q?MfyxJbbAkDY3hL+FJuhbIX1XrOmwjuUgaydRVVyYCoUgpqDJLKN/5x2k0i?=
 =?iso-8859-1?Q?tqVpWRSaGv0B815dfbswBqXWDSa272+BgmGKUN0EWQ88IgTUygXMIATa0i?=
 =?iso-8859-1?Q?i51rqDiafF8zu3Wdyj8j8Efyq16fn79+dtl0rCTRc2IBzx/slkysuv3nyN?=
 =?iso-8859-1?Q?4SDxFLS/Ou0dk/C7B1eJi/253RYh5E9FJXlSW8FBUcnv4UI85to/AmZ5zy?=
 =?iso-8859-1?Q?5UBBdMb6SU64RA/NoD+sqHb6cIS9JeXJ2r4iAwJm+9Katccpfyu6TGbJEz?=
 =?iso-8859-1?Q?tzABQE+to2c7DixsPcevPZ/iUAMf34Tayif6r4GlXHtEiRI3fmjtBndDiI?=
 =?iso-8859-1?Q?DMECAbhuaLKmRMz3BwCb1GQrnBYKlxRjVIS5rw+q47xqCoz8/r5/4eJFqk?=
 =?iso-8859-1?Q?Y0gHQUSlelCQKy2I5yvGf/EqR48u6m30TAQ9jfuWyeVhYo2gKXuvUitrHh?=
 =?iso-8859-1?Q?w4KGPCQBvCj2963whaog66JoKBijxKxz3xk7WxNS6f5h90B09PpmteZK3K?=
 =?iso-8859-1?Q?bi0mWOEve8dSL15OwtSYavSFy6rx3Gad7D0FcCnrO9KPOeF8r+55VlX/ns?=
 =?iso-8859-1?Q?5E4X/xd4yhdxIg/4D6igRCaovwpt6yP/X9Y6lGjCqojXn8FVrCPLiZn4jD?=
 =?iso-8859-1?Q?f8Bj95X3HEpEckuoO3edJE7MUfFscKbSKWWOdiOeTIKQu7uwKynws+vq2U?=
 =?iso-8859-1?Q?mguukDAeGUMGXOMVGAIvvOPmj7/v4MZ0a7gOcFDgkEZk5hVf+zihtmcstR?=
 =?iso-8859-1?Q?5/hd7AcWP0Q8oZwtMRwU7uvjQjv/IvUK6TVUjMjT2fzIOzoWOBfm+X3A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: deaf4a67-99a0-4642-b422-08dd9d2bcae1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 14:35:57.1842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +rsi7WVnrZHzlo0TtF5G1UouvfdaKB/c/GZuMRUfIBKlnIAPOQZXIvjPScuQDBeO/DFSFVDovttmz/TvfjAqq9UK/I9sZAAQ2L/B0jCTsiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6138
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

On Fri, May 23, 2025 at 02:21:57PM -0700, Matt Roper wrote:
>On Fri, May 23, 2025 at 10:42:33AM -0700, Lucas De Marchi wrote:
>> Add the userspace interface to load the driver with fewer engines.
>> The syntax is to just echo the engine names to a file in configfs, like
>> below:
>>
>> 	echo 'rcs0,bcs0' > /sys/kernel/config/xe/<bdf>/engine_allowed
>>
>> With that engines other than rcs0 and bcs0 will not be enabled. To
>> enable all instances from a class, a '*' can be used.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_configfs.c | 137 ++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 135 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> index 11ca36f194bfc..b27bbe203eb46 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -3,14 +3,19 @@
>>   * Copyright © 2025 Intel Corporation
>>   */
>>
>> +#include <linux/bitops.h>
>>  #include <linux/configfs.h>
>> +#include <linux/find.h>
>>  #include <linux/init.h>
>>  #include <linux/module.h>
>>  #include <linux/pci.h>
>> +#include <linux/string.h>
>>
>>  #include "xe_configfs.h"
>>  #include "xe_module.h"
>>
>> +#include "xe_hw_engine_types.h"
>> +
>>  /**
>>   * DOC: Xe Configfs
>>   *
>> @@ -48,6 +53,23 @@
>>   *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>>   *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind  (Enters survivability mode if supported)
>>   *
>> + * Allowed engine:
>> + * ---------------
>> + *
>> + * Allow only a set of engine(s) to be available - this is the equivalent of
>> + * fusing engines off in software. Examples:
>> + *
>> + * Allow only one render and one copy engines, nothing else::
>> + *
>> + *	# echo 'rcs0,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engine_allowed
>> + *
>> + * Allow only compute engines and first copy engine::
>> + *
>> + *	# echo 'ccs*,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engine_allowed
>> + *
>> + * The requested configuration may not be supported by the platform and driver
>> + * may fail to probe - intended for debugging purposes.
>
>We should add a note that the engine names here are the per-GT hardware
>names for the engines, not the names that would be seen by userspace
>(e.g., don't expect "ccs4" to refer to the first compute engine on the
>second tile and such).  Also worth noting that the mask provided will be
>applied to the remaining engines (after hardware fuses are considered)
>on every tile.
>
>> + *
>>   * Remove devices
>>   * ==============
>>   *
>> @@ -60,11 +82,26 @@ struct xe_config_device {
>>  	struct config_group group;
>>
>>  	bool survivability_mode;
>> +	u64 engine_allowed;
>>
>>  	/* protects attributes */
>>  	struct mutex lock;
>>  };
>>
>> +struct engine_info {
>> +	const char *cls;
>> +	u64 mask;
>> +};
>> +
>> +static const struct engine_info engine_info[] = {
>> +	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK },
>> +	{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK },
>> +	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK },
>> +	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK },
>> +	{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK },
>> +	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK },
>> +};
>> +
>>  static struct xe_config_device *to_xe_config_device(struct config_item *item)
>>  {
>>  	return container_of(to_config_group(item), struct xe_config_device, group);
>> @@ -94,10 +131,95 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
>>  	return len;
>>  }
>>
>> +static ssize_t engine_allowed_show(struct config_item *item, char *page)
>> +{
>> +	struct xe_config_device *dev = to_xe_config_device(item);
>> +	char *p = page;
>> +
>> +	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
>> +		u64 mask = engine_info[i].mask;
>> +
>> +		if ((dev->engine_allowed & mask) == mask) {
>> +			p += sprintf(p, "%s*\n", engine_info[i].cls);
>> +		} else if (mask & dev->engine_allowed) {
>> +			u16 bit0 = __ffs64(mask), bit;
>> +
>> +			mask &= dev->engine_allowed;
>> +
>> +			for_each_set_bit(bit, (const unsigned long *)&mask, 64)
>> +				p += sprintf(p, "%s%u\n", engine_info[i].cls,
>> +					     bit - bit0);
>
>I didn't trace back through the configfs code to figure out where the
>buffer we write into originally comes from...I'm guessing if it's always
>truly a full page as the name implies then we don't have to worry about
>the sprintf ever overflowing the buffer?

yes, we have a page and this is not going to overflow it. I'm not
completely happy with that API but currently it's the only thing
offered. Snippets below from fs/configfs/file.c:

static int fill_read_buffer(struct file *file, struct configfs_buffer *buffer)   
{
	...
         if (!buffer->page)                                           
                 buffer->page = (char *) get_zeroed_page(GFP_KERNEL); 
	...
}

The show() from userspace is actually going to fail if we return more
than 4k (even if page size is greater than that):

	/*
	 * A simple attribute can only be 4096 characters.  Why 4k?  Because the
	 * original code limited it to PAGE_SIZE.  That's a bad idea, though,
	 * because an attribute of 16k on ia64 won't work on x86.  So we limit to
	 * 4k, our minimum common page size.
	 */
	#define SIMPLE_ATTR_SIZE 4096

If we need to return more than 4k we'd need to declare the attribute as
"binary" so it loops through it and use a read cb.

Lucas De Marchi

>
>> +		}
>> +	}
>> +
>> +	return p - page;
>> +}
>> +
>> +static bool lookup_engine_mask(const char *name, size_t namelen, u64 *mask)
>> +{
>> +	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
>> +		size_t clslen = strlen(engine_info[i].cls);
>> +		size_t numlen = namelen - clslen;
>> +		char instancestr[4];
>> +		u8 instance;
>> +		u16 bit;
>> +
>> +		if (namelen <= clslen || strncmp(name, engine_info[i].cls, clslen))
>> +			continue;
>> +
>> +		if (name[clslen] == '*' && numlen == 1) {
>> +			*mask = engine_info[i].mask;
>> +			return true;
>> +		}
>> +
>> +		if (numlen > sizeof(instancestr) - 1)
>> +			return false;
>> +
>> +		memcpy(instancestr, name + clslen, numlen);
>> +		instancestr[numlen] = '\0';
>> +
>> +		if (kstrtou8(instancestr, 10, &instance))
>> +			return false;
>> +
>> +		bit = __ffs64(engine_info[i].mask) + instance;
>> +		if (bit > fls64(engine_info[i].mask))
>
>Hmm, looks like there isn't an __fls64 defined in the kernel libraries?
>fls64 uses libc semantics (i.e., returns 1-64 for the various bit
>positions instead of 0-63), so I think this is going to be off by 1.
>E.g., if I request "rcs1" then bit = 1.  But
>fls64(XE_HW_ENGINE_RCS_MASK) = 1 so we won't flag this as a problem.  So
>should this be a >= instead?

true, it should had been a >=. I will fix it and try to incorporate
Jani's simplification for the parsing code in next rev.

Lucas De Marchi

>
>
>Matt
>
>> +			return false;
>> +
>> +		*mask = BIT_ULL(bit);
>> +		return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>> +static ssize_t engine_allowed_store(struct config_item *item, const char *page,
>> +				    size_t len)
>> +{
>> +	struct xe_config_device *dev = to_xe_config_device(item);
>> +	size_t namelen, p;
>> +	u64 mask, val = 0;
>> +
>> +	for (p = 0; p < len; p += namelen + 1) {
>> +		namelen = strcspn(page + p, ",\n");
>> +		if (!lookup_engine_mask(page + p, namelen, &mask))
>> +			return -EINVAL;
>> +
>> +		val |= mask;
>> +	}
>> +
>> +	mutex_lock(&dev->lock);
>> +	dev->engine_allowed = val;
>> +	mutex_unlock(&dev->lock);
>> +
>> +	return len;
>> +}
>> +
>>  CONFIGFS_ATTR(, survivability_mode);
>> +CONFIGFS_ATTR(, engine_allowed);
>>
>>  static struct configfs_attribute *xe_config_device_attrs[] = {
>>  	&attr_survivability_mode,
>> +	&attr_engine_allowed,
>>  	NULL,
>>  };
>>
>> @@ -139,6 +261,9 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>>  	if (!dev)
>>  		return ERR_PTR(-ENOMEM);
>>
>> +	/* Default values */
>> +	dev->engine_allowed = U64_MAX;
>> +
>>  	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
>>
>>  	mutex_init(&dev->lock);
>> @@ -237,8 +362,16 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>>   */
>>  u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev)
>>  {
>> -	/* dummy implementation */
>> -	return U64_MAX;
>> +	struct xe_config_device *dev = configfs_find_group(pdev);
>> +	u64 engine_allowed;
>> +
>> +	if (!dev)
>> +		return U64_MAX;
>> +
>> +	engine_allowed = dev->engine_allowed;
>> +	config_item_put(&dev->group.cg_item);
>> +
>> +	return engine_allowed;
>>  }
>>
>>  int __init xe_configfs_init(void)
>>
>> --
>> 2.49.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
