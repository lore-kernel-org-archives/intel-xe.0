Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5A1C2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 14:38:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E5B10E099;
	Tue,  9 Jul 2024 14:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iU1DJfN0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2057310E099
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 14:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720535905; x=1752071905;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cIdRQ0gTTIfnCi/XvCky+agIj9TNwwPWHWK0lWDQ4oQ=;
 b=iU1DJfN03jrxxthmMrFYy+Oz3jMDJ2u9b5NeUAupEgoZPBHG+w1F9lE6
 p36+0bqvHLNb5x9HeU+C/oSC4Tjvo4DYZdLyKGEpb0b6GtqFYgRTDyTcs
 ZVAVWfDII9j5/Do5JXk4nmMkyrnSuPmgVzZUk3so87/crFD2gBb/VuD+L
 F6of9T3wp87YfAMz0C1dktkxHOiowJV4KwmOx5npX/LINNv1oVpuBph6T
 HUF2xyvgRbrkcudP9qCw/m83+L83dvPjiKqBnqdvSKXQgDya6z8r9L0TM
 brofHfrEmU6acuImIA3bercOw2MUhuTKbNd/W8HqBIKQHqU/YHoQd7Rmk Q==;
X-CSE-ConnectionGUID: sUm2UD1bT7Ou5VCMUUgyYw==
X-CSE-MsgGUID: HtR/aX+nQ4GtBgFPvcIodg==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="28464352"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="28464352"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 07:38:13 -0700
X-CSE-ConnectionGUID: pHWSSQq4T9OOZyP3A9w3Fg==
X-CSE-MsgGUID: dldXItzTTsuHIw+1vxUVEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="47855016"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 07:38:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 07:38:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 07:38:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 07:38:11 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 07:38:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+ETxg5cl9cRZd9bklq1kyXTxSQJcqTIDbEiSXqujIx5ihPM1DnD0AuGlUBvz8OJsaGHSQH1+j/SLfgmMUHgRfxtpwSAdr146Rb21rgGH4Sz4bsGcOfXX0I3WdchCSqiPvkBCkoQ7tc4KqVHXlCWMFTxkW6IkV3+qMayeQ7Xj76RYEom2bLCw4niI33nwwVxRL6WPrcow+DZFN+Y9qJMfCD+a88OUrzjRti69HD97qOJVHX4q0C2w0RJF0qynrFzR6lt84C9vjA9IUvn1i3YNoErjnGM3U4xjXJX5qC+zGzppw9pNhvLHMqLyLgUia5mVUnpTl5ZlZL59WLdPOTSnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIdRQ0gTTIfnCi/XvCky+agIj9TNwwPWHWK0lWDQ4oQ=;
 b=KkciOqybWIOwm3dNqlPtJwMz9Lb0p5Z4SAYpScZNedwj+7vSrf1x3KGDsNI6vBIXJ0wMnK501tRBHje7diH2Fu7tMsKREAHxsrupLYvMHvUOuBwWZ7ODNGaEzGib9oUkqN6yepBe36v8eofKWZl8XHMw4yXy3aSkZmeMawJyi1AGYsxaGdulvDLiABk4HdB2p5LBX//w0sndp06c2pgF9GUhf5cCoWVEsesFx+lW89Nkh8oP59tX7UqbazQl8Xabd6Hgd/W6enm1aGskNOZVuVUZ4aB8vUFIYvVYzppU0uEfdP+LLguvOcpj8OuqA13PUYY5wgP5EZlwZETLgHfX2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6355.namprd11.prod.outlook.com (2603:10b6:510:1fd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 14:38:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 14:38:04 +0000
Date: Tue, 9 Jul 2024 09:38:03 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/xe/gt: Remove double include
Message-ID: <kyiyumro2fcu2xujyz6lqc37lbghjgasiktaepgra55xt6d4pw@3wgfqqiz4fyu>
References: <20240708173301.1543871-1-lucas.demarchi@intel.com>
 <709d30e5-d456-43bf-8058-ba40dd4db4e6@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <709d30e5-d456-43bf-8058-ba40dd4db4e6@intel.com>
X-ClientProxiedBy: MW4P223CA0028.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6355:EE_
X-MS-Office365-Filtering-Correlation-Id: eb0caa47-c679-4060-9ada-08dca024bddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3rFkj5WhPTvkzyDrEc+6PPFPxC7jqGsUUceSX+iAqoBZydo1NRLpqmvvOapD?=
 =?us-ascii?Q?6xR9scuwqRcCpUIR64BAr8+0D3154mgc4dgAROArrnW7wxNfVgCNAv23QGy1?=
 =?us-ascii?Q?rjSLR3HMe+bI1CQLvf6NziWc7MOUAcGaNE+MZQcvL+lnXymaWocuKnnlfn3v?=
 =?us-ascii?Q?ocTogiaG8/CSzfX/TwLCzOkb/IlCa+kRF5BHww3RhVBX1TC8RJTUy8V0GBNh?=
 =?us-ascii?Q?rzZVknLChYvLeMs9Jd/is1F9YEfcQY7bFKXfQF/tMIk267CAZVg6gsGHDxl/?=
 =?us-ascii?Q?uekILxybgS+M0/jA+b0GGUza1JYbk2DioX6BHkVbjUe50/4iHNth+nbjGOC9?=
 =?us-ascii?Q?MvhdB0lJ2BsildDrWviXVS4kb1459P6WVMOPgcm9ZOOj1T8LFxoLZyGpo4nM?=
 =?us-ascii?Q?3YVgIMoetsn8cdXz5l2I6g9loeI/dE4cBbCkwI5WcivAGvazl6XgrXN3agZi?=
 =?us-ascii?Q?+jdXSphD1ajxqpYsu47BqEP252uwJovCwplmALWK62hh0psYBZL34RT+rPww?=
 =?us-ascii?Q?5gz2O71aUPj6JRikSDHNeJ+537gAgqnARHSZHL6mUclQLinpydiH3U7om8V1?=
 =?us-ascii?Q?nRFQro7pXgpFSEJF5y9O7+xonaH9Tt7uSflutWd43W9FWCBAIBwUm1cXxQRd?=
 =?us-ascii?Q?3cGgkMAdXuqNYkLOErQnMCWl8aHw7RUz2lA+R404YO5yVwb5AZrBoePM+dUe?=
 =?us-ascii?Q?ia+CSbi/kD4wwOh3CJkv9A1b3HGcRe1vr3xokq1Lbv14muMTGOsl/H4Y1bFA?=
 =?us-ascii?Q?1YKwxzy0AmliTVweypOlwEqK/j7jrBGIZ9P6oIeyrLc97gzarvMnBhVkIlmI?=
 =?us-ascii?Q?6ihY9PTVzy78nTvwaHyf82bWWzkmLe9rgfU+meVnyggFnEOcSSlqb8CZbWQO?=
 =?us-ascii?Q?sxYB9vIohI0qGB+zvGqU/KHH3Wcmko4XVG1lzs0KjAzkpztnhBIGkHUTA85o?=
 =?us-ascii?Q?Mz96Hmv8HbqnZEvSLW7VIOTptYHCQMhJulhsxbYVz26fypUVRFFYI52vmTQN?=
 =?us-ascii?Q?sUGq8VTuauGLd58KibLnipbYKkDbEuJTXhEYOHl0WpvdGDwSU4iJf1BlkJJi?=
 =?us-ascii?Q?SLhUZa+FlZAPJkrLhSdFzRJLjODUNa2ihoHq/qmgnZG4RoE9gUjTs4C3K7If?=
 =?us-ascii?Q?aeIZzsrWuu0O1YGjl6utH+WWyecZ8QUdx0RU8CY3s0B/2aPOCzdjVmLDBcwG?=
 =?us-ascii?Q?RwBthS8E1ZJUovto1y8cC/JsFESir0JvVaPiSFCq3QND5MkakKO3wAmJe/us?=
 =?us-ascii?Q?iezdLDAaphehhHU7obc3EnekMpZznEalMMu6UXKRUmALEbIuxuiFCkWluqw0?=
 =?us-ascii?Q?i7I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?29meje6Z7L3NiuyTL2EhrnbaMoij4XlggoZs8IWMWQmR8psV7RC6OZL1uQiA?=
 =?us-ascii?Q?mqMvSVUQ6G8gJCVl94Ix/433dt32yflNhvIQdtk/RKh4FL+eYVfTQZ94BfKo?=
 =?us-ascii?Q?wmhQYQ1UuX0OF7NkdOseA3psqF8xFkDbtT/74b5ApRKSdkep23h4HWG+VPaT?=
 =?us-ascii?Q?q5Z6AroDzO9XojHdg4x2TJlrYxVT2cRHlTTi5Z8A0MoNBoL/A9IuOCVL38dV?=
 =?us-ascii?Q?re09kM0+C49ypG1N5ZoNTBcDMqdZlpIurTD+QCX9N7oKj83xUJomPPz/7XLr?=
 =?us-ascii?Q?U9bBmPlzdM/ghnTGGRCMTrsoUinzvdGFrRA1PQqLx2fGJt6yMlajx8jTt0QT?=
 =?us-ascii?Q?pwS01MTOSaQQA1XP0Wnq1ErHun6kWDDkOlyvxSl7KC/U+YTr3nWD6AlZdHIJ?=
 =?us-ascii?Q?AeR8IcJg4mTi57oc+oWqBiQc/NrA5CuOAtUJK1U5eBCMflZdnzpWEvAxCn2q?=
 =?us-ascii?Q?wNduEgqyqr4g2K/PIZSc9B3PwcGuihjZWWoxZismKFYIMkdzW6dUM8xSqo2v?=
 =?us-ascii?Q?ShM3WS4zz1/P0FWKCTaLISVaRcvkvXk4Uf1hImOBeu9OIO2QXPiRmy95y/Z5?=
 =?us-ascii?Q?1xPsYG0ox8NzAljSJFglBJYn3pU4oc9oXOoJgTXSVRShTVrDpzROz0JhPkwc?=
 =?us-ascii?Q?EWzbgaLBhCDJpEgnqfMZ1e2BTOR7uN2+zi5hoGnHTutFViNgwgtlr38ixQLI?=
 =?us-ascii?Q?3y5mrliuVru6tsRF7FwN1snJ40s9sRJEPSDu/HcVUiKRdmk7ZDfUNux7yBjv?=
 =?us-ascii?Q?2D5j15d1RPYjBXvkVszBHe0q0BKt7wvxV5PRRKAMtY6db2Vf/k57DUjy5iCD?=
 =?us-ascii?Q?mV6MsdHFd1b89KDKqvR643OOa2zlGromvt8f5rWE0EwTUQk1gqpC+G84XZXo?=
 =?us-ascii?Q?lci6qK/vHxosNmm86bbq6l+MVE7Q/H0zBldCdmY0GRmybXbFEyh/qSYICXPC?=
 =?us-ascii?Q?XyiEjtv0C64GhI1HIopKEU6fgzLWXP88YOa/QfwkOUvkgUZCbP2W1NG04zxf?=
 =?us-ascii?Q?qagbnHslBbtCMCghaGUEmk58vQ2Ik3xSuVJvylx8oa7y5B/Hn7B0sEYg6ZPh?=
 =?us-ascii?Q?Gasjp123HaYmqsH6GUb2nB0R3p3vF8aNo9GObccUYqhFROBByIVBq8lnyQeQ?=
 =?us-ascii?Q?Sc8n0c5if3PM2w5fzH/bVMZXKQ/bql3lqtRaRaDnaaYg5wvpzaXV/ywH/iSP?=
 =?us-ascii?Q?oDvqqrJA1s0mcc4qTTDrdJL+vOk1TwMm76yNb1LHYeeJnQtHHPhwQkLKV8N5?=
 =?us-ascii?Q?01mc5EqijYWZ/2edBxoKsaeI89OhjThykgb5Vb1rdFphDH2F8QHLle2sPJyP?=
 =?us-ascii?Q?ltbQNRfJRwT58Yagu5tIcFDNArj+oz1fduG+3VMB3R7Okqg6KZmFthX+70Mg?=
 =?us-ascii?Q?Q7nr/WzI3r6gGI/uYYUi7ApZl4fTdiV/QqDuiAzriwsxe33PKaubnbLojYd7?=
 =?us-ascii?Q?KO222iUQye8ch57+d6YCv7eWpxxEXQN8PGnYb1fUe67WytgFH+t6uCF6+rY+?=
 =?us-ascii?Q?Ny0pItzEnBrqh61o4tkXfP/7VS5aoqbjSifqRSlcMMsrZv+wNR6zBWRSFKn8?=
 =?us-ascii?Q?ylKH+V1irt5DqCANmamm34jruyMWu3WOAQXU7sKSTNhOpc8K9Z3bEXL1V2+Z?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb0caa47-c679-4060-9ada-08dca024bddf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 14:38:04.6299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KEhFan9mWx9VgApwzpOg2UnWkxgwsIVeh0ZKmmFZhP/by4wyrCV8DNeQTZ1LDYJJqbH8q9I6XAruGtCvzJuh5MnqP+9YBfFu3pZ3Ggs426Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6355
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

On Mon, Jul 08, 2024 at 07:43:16PM GMT, Michal Wajdeczko wrote:
>
>
>On 08.07.2024 19:33, Lucas De Marchi wrote:
>> The header generated/xe_wa_oob.h is included twice. Remove one.
>>
>> Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/r/202407052122.AzuWSPuo-lkp@intel.com/
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

thanks, applied to drm-xe-next.

Lucas De Marchi
