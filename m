Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000B7C3ABA2
	for <intel-xe@archiver.kernel.org>; Mon, 16 Sep 2024 15:00:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA76488C11;
	Mon, 16 Sep 2024 15:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bVlbdVBD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF19388C11
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Sep 2024 15:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726498810; x=1758034810;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Tdb0lH+Im0sP4WdbN4SIm1rVOvn6v0wfxOoAZ0u4q48=;
 b=bVlbdVBDc+AZTT6d5Q+uCbZyactJLIY8yK3MqbiRGGn0qcbLnJraW5bJ
 HInZMK6rH/X6KCg7/CP/Ib7bkkX66INU4WGN0Tx2Umch+Cx941EYYisT7
 uea1trrxmVQ1rB9Zsm7LGArP0usn+LdwaoTUxTev9dToggbV0e/ZeEmot
 1FgCqoHkkeNJvgs9g2AHfZkGVUU8hv2PPyvE3I96VelwsBc4DwZoLRp84
 s6iwXTvS98B/MCpFmIcqCDS0Uw3mBDpaz+YPBRggzd+5rReka4SJYNYqk
 Kt+Jpb8wyUw4QOBuyfG0RQ8vhpmDgW64VxMtzN5Ca736B6K6RL6FncdLt A==;
X-CSE-ConnectionGUID: aHfeMOpeRTy3Vv2vavin2A==
X-CSE-MsgGUID: 3t8zCbytTUOSvBPJMMf+rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="42843138"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="42843138"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 08:00:09 -0700
X-CSE-ConnectionGUID: C5vihu4HSymdQDgFVqEWcQ==
X-CSE-MsgGUID: JKKGd4eeQPezhalZZgpLtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="72973544"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 08:00:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 08:00:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 08:00:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 08:00:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 08:00:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXTQFdzWITHgCOiNcZBGukRYBL0l1t1cJKAOb+Q5jLSp+5pdtT3cGRUzEoIw4Qpo+hNH1F2CLAnhZDRkThwr+LIjHTazsxsr3jtcs+ysWam8u1HriC1p5tKLVmWCFM5y7zjl73uTLZKnsn2c54C+RkPD+jVrTxmbutD4IpWtljCK4ZA95aLX9b7A26o8zwag3UXYclNcgNkWfFudcuMgw2cMAeXJJytkYJcP1tbpTdcGoP5J8irOKkkInKdndeRXieE3mFEXbDW7gsvkdsrlG7TxadpYuTU4fIddQrxvX/GwO8SR/VvfJbnO+qvYmB0QS1fL2lyfyuDfqqIas9JCeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tdb0lH+Im0sP4WdbN4SIm1rVOvn6v0wfxOoAZ0u4q48=;
 b=ENKJoght1+TEIpA/xQWqMpZekh4oUAiuXIm/MHn+TDkyTPHYooGKU2abUVWotAsujD03BieTtjrwECG2/KKfrlfWsFS3qXn+bR7GwxTcR0HcJIGUGOo+sK7EZEVzYDsSp0qNaTmlo3QyAeV9hWmuVjmAHdCHMixKAeJ5r1cPljJxe6Ud8NE2/8UxHjTpvP8vweDb01CXBdq5l+J7CRIxFFZ9t2HXwAhGyZl0OFvQTiOg7c95BLSUrhdBZk7FX1/XfWUC2K2CjVU+kenklvFO+WbOQ9MS5TbIdv3Vo6u7QIRf1Wc8sJvbPJuXocXIIbtB3G990CsC3fLsMdauBsCzXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4926.namprd11.prod.outlook.com (2603:10b6:a03:2d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Mon, 16 Sep
 2024 15:00:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 15:00:05 +0000
Date: Mon, 16 Sep 2024 10:00:02 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Akshata Jahagirdar
 <akshata.jahagirdar@intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>, Matt
 Roper <matthew.d.roper@intel.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH v3] drm/xe/vram: fix ccs offset calculation
Message-ID: <wu65ts2byg2fm7np3yhodad4bq4y272a5xwtcom6zakquwpsb6@e2rqj7bpighi>
References: <20240916084911.13119-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240916084911.13119-2-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:303:16d::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4926:EE_
X-MS-Office365-Filtering-Correlation-Id: 0573dc65-4a89-4181-14b4-08dcd6603fc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kUg8VzAqH6BLRa3opoTVVPUdjvyIn+K7DTvG0CyxaDE0smWcS5ls4V6/7gT6?=
 =?us-ascii?Q?SVSNyT8StcGFq71GjT1ndZXAJU7Luy3asIeW1jy589pRf57VSLtp6On1hRV8?=
 =?us-ascii?Q?+Vzc/F2yPah9xZabaVNBPgIedcuo2P6x3kXrZMLiAdycSRkJxL0og5Wlx5Gq?=
 =?us-ascii?Q?s42l58XaassocA1gtO0dYZ1iS1Or9rWSoY8kZTYmgLB2wgJ0i6j2d1iGLpCP?=
 =?us-ascii?Q?+NIMN3cKzAbaUffBE7INryRp2CNcpdV+sApF6csoCuanKacP+755nS4mRvjI?=
 =?us-ascii?Q?xZw0e/mEeR6x2W/Mopzy7impDeMIhqnPe3upp1xCcBX6z3KE0ZwRUBGNZhxU?=
 =?us-ascii?Q?RUAmyzneN74sOmjfr7O1OZTDQvrLbJf+DswLMbnu20Ai00++yoZ6v1wnP4P4?=
 =?us-ascii?Q?nivORcW5lO5SljcxXnmRa4ogHkX54AMMwwoh16DTBZF1qAP5gSjOzMhbXetK?=
 =?us-ascii?Q?+g62AVZ5zEtiDVSy0fr7Yc8tZxITNwuRnCVh3cyxxyGiTB+JKmxoH5NuD5TY?=
 =?us-ascii?Q?ivA0PYNn/eFLv0RuEyVzhTGFNSdQPFCgVSLbkMdChC2qy7SLlENndgf1GZ4r?=
 =?us-ascii?Q?uZUymIefCB3EnHrayQHmVSYzpUwg5H1YTjSM5BPB4tHww7MFQ+DxJiG/4II5?=
 =?us-ascii?Q?wjDehmyT538b7wSrG5oHxY4+W/7VqGmszxaWB+A9cLY4XSSTo445jJ9K15wv?=
 =?us-ascii?Q?klB8vLbfHXDVfMVlDVMSGI1cblnFMgQNGbAEE5RKciv4rNg/EctQ5qT+sxfH?=
 =?us-ascii?Q?rrLU802ad/RbO0N0s7u5Fjxx/MGHHSpTL9ZjPKULheNliGEeqgk1vFg+E2HT?=
 =?us-ascii?Q?PNLjNU6gmQreNXIYqMA2BO6EPlqy2oL9o51TBiIM4PvmHrZv5TPpP4YxAncn?=
 =?us-ascii?Q?UbgMK9sJlNrElmx1zkErT27xF1mDHstAzWFJmUshiH7ec+Y5HCg6Iz/Ehj6h?=
 =?us-ascii?Q?CDTACngYsbjxfn0T9hQjvRe1m5pfuE51dXtQnMQHaI8j9wYzQLrGwFjZzHKP?=
 =?us-ascii?Q?xQSWfGHfL8mpbzcsX8BwLpFRAUyblxSTUs0ClKy79lNk48JxhK9IqVj0hEcZ?=
 =?us-ascii?Q?AOvIo4VALsHlABwGRUarUPgyFKT1xMuHuaeSVDSqnA1ElQBWx0fInWayeg+Q?=
 =?us-ascii?Q?3v+SHMMnwPwjxoFqYlAsh3FEQb8dJtkziZtUwu4/mBGjd2Da3eSN2siGgu53?=
 =?us-ascii?Q?GwsZpzD1QzZlnd1h9tx6XyKvyKPDl8riqGWjdKBrIr9uNVdPfRX3eD2TXcJm?=
 =?us-ascii?Q?xveUrrzYBXEx2PrFJpqxeQuEGMjZvugEAHszUxb0Ts3K7fOqzZ9iAiGplM90?=
 =?us-ascii?Q?eCEVTKbkcB8Li+VbEaUzuBGnXKKT0UD28+tS1ZoXiBmXDA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YNso/7iJsot7iW6O3KR6V7wOHl2UzFazLuaGu905YbOrLuwYPa2yQJ1IEvzQ?=
 =?us-ascii?Q?DB2Gs06b6NGw2QkVcIN2NQ+aAZB+Bi7UX2hakHyKH2LI6RLHz3dh+E7HXBc+?=
 =?us-ascii?Q?A1Oz1EnlmjPd5OuQ1Hvi4UfamVbLhhMivPboHtaeg35c0/cD5kpTTgRXE88i?=
 =?us-ascii?Q?3yN0f6VAVXrcy3V9cUC+lmWs3wvZQ13LofM4cy50p1lLPCGfJ8MGYqKo80xp?=
 =?us-ascii?Q?JClDSx2YbmiUWFG2o+sp20+rJsBWITUmzuRj+oxCR4AfC95zYuyWrUuBlPcP?=
 =?us-ascii?Q?xUZTesA3lFMVoihtEwfvYEgKUL8+gJayW0GQp+LpNZcVZlIZLSMr31bZyMi3?=
 =?us-ascii?Q?0mj6KuEvyYMeJrF4lT7/100SlPg3u69VDDEew5KA1k+Uz1lLqiIn1kstlLoD?=
 =?us-ascii?Q?bQXZciQXa12mqTp0NYoNwNsf4fXzY1iNNKivc/s6RTJmHV7HF1WwXi+1gDTU?=
 =?us-ascii?Q?y8jGCwRprfbh7dgpkrqgQXPC7GpLQM45eaNjSO6Ylt8hb4vXrXWxBY9SqlQU?=
 =?us-ascii?Q?YUE0favDZsVHK4cK0fCGOXkSyaP6HL0o7hp8p4+XEYqfYjeABO9PpNcQzheW?=
 =?us-ascii?Q?C2D0H4CfVbn1S3hVMhBLUDkM+MkNecZ1j2NNBImLmPXi/vtzJ+4TQ8FINSAY?=
 =?us-ascii?Q?skneCJI5mYQd6R1NbWMqb8cPQ9i99RW3WPMqpCK/65UQ9nL/h2b8Lzrvvd1g?=
 =?us-ascii?Q?OV+DO3dX4rb+iSuYR9nB0F+q/roiFju2b5MTV8YwVWrXtt4RvL1/akDD6ga4?=
 =?us-ascii?Q?aT8exjgSqY9Yh44PFOW3lQ4pEpz00UB5Mr9w6oDcK6EBKmVBzBC/gFsLuqmq?=
 =?us-ascii?Q?9A8kfP4xj1iRXr3Rk81XrV9v580Yn+TV+t/5mSQ3DlDZNvewtCGsEh2ORbDh?=
 =?us-ascii?Q?mGW2r2PHUSUG6UA9ai7SncD/mR2QWSWEwQwIzYYIcn26lwghszHUaHSkHGek?=
 =?us-ascii?Q?hlSGbS5evfSXVcOavQF2XVOakkxPRF7srz4O1uTiHlUc525+1AkYBBU1Olff?=
 =?us-ascii?Q?06R+t3I1M1Z3d6t2r5YWQXfbxvGaglVty/aDoiRfu1gtwCbMdsRN/TETw2ry?=
 =?us-ascii?Q?/cVBPveo9lNdzUZ9Pk/zLsu9XzHBKDdq+0UuWC2kf75Qpnfr1AX4nbOWIEJR?=
 =?us-ascii?Q?sJ5M1gp0FqiGnJb2kgtrcYwJUBAHyGgt8JGeZLK6r3ZZ+HyEoSH7z3WSYAXv?=
 =?us-ascii?Q?i01VdyjPRmRoUe86J/75M0dh13Zcl8W0Nf3xfAYx0YwLg+Bmj3MbU/zWkr6u?=
 =?us-ascii?Q?6nOEtQzhb/JTZ8E0fjfn0r4GPV2J95w+4vu03c0NWrwdobFJ6gNZ1OekdzlQ?=
 =?us-ascii?Q?TI4lzKhDAluzoLsTGuctBhyPwaRmo9tg1gRYAV6B+PQgHTbF2I328MYKlxgD?=
 =?us-ascii?Q?oYWW3mi1im5a9dQDjvc9ND1kWxqyfa4h46SwgebQs5LWRjGLQP8Zp0/XmZCy?=
 =?us-ascii?Q?ahCp0sdjq2shpf2DnTpkF4vI1SvLIJrQ6lnjfd7n06fivMLoY+gKdcXKIhDe?=
 =?us-ascii?Q?im2NFnR3A879mbbB0lx9drwKN89z2Cx6GkHFLv+2DopdyDGLM7Mpb8ZTjIdf?=
 =?us-ascii?Q?9ETYfochEIiPpBPbWpY4mQDWA03F+jgkLhc44yWALf+UzbakfWNerVxzNgPg?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0573dc65-4a89-4181-14b4-08dcd6603fc9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 15:00:05.7058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3tvq3rSr23MWJulpczNzUbRtWnJX03km6KuFsM2/Wb/DsbRSolcyBXoIzAg0AOF5RkUiDJ49umsDN8kXRp5dPjJQR+cac7OCh8WvGJ9Qw40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4926
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

On Mon, Sep 16, 2024 at 09:49:12AM GMT, Matthew Auld wrote:
>Spec says SW is expected to round up to the nearest 128K, if not already
>aligned for the CC unit view of CCS. We are seeing the assert sometimes
>pop on BMG to tell us that there is a hole between GSM and CCS, as well
>as popping other asserts with having a vram size with strange alignment,
>which is likely caused by misaligned offset here.
>
>v2 (Shuicheng):
> - Do the round_up() on final SW address.
>
>BSpec: 68023
>Fixes: b5c2ca0372dc ("drm/xe/xe2hpg: Determine flat ccs offset for vram")
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Shuicheng Lin <shuicheng.lin@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: <stable@vger.kernel.org> # v6.10+
>Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>Tested-by: Shuicheng Lin <shuicheng.lin@intel.com>

This version now works for the random BMG I was using.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
