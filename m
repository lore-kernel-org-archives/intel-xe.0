Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7021FD374A2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 14:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A67510E348;
	Thu, 17 Oct 2024 14:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cxXyjmCn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E35210E348
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 14:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729176966; x=1760712966;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=z8o8VV+F8lIBVXgndpxKxfC0EQLVydHO0StpmI3KAI4=;
 b=cxXyjmCnihJUyJFPLoKH/oDehrKJTx7mcv45rUsi6x6AKHSqwDVw+Jhc
 eYZKIs6DLJoHQm1Nw1L9MjgZAgov0yP5vmJO/e4VxDj8tY6xNxSpWti2/
 S7OvqOTLwFe69IgNyJTSzp4bBQv4SnHQKneEf3SnDLyWqdyZcsjZIImlZ
 eRyQSzuEUUfyTQWSirw7ENM3VtORygiop8nATUariQ7feOpNxKUODPLnH
 X2D/ny8nB7E+YTfPuAhTFpdoQg4q6vcAXvnrPJizf2hafW+w8ueb0Dc1f
 BOfAOeOseo24jKzPkhx7235piRSVdfUNz7nPNIbw+fqRtpeDQKvSe1+5f g==;
X-CSE-ConnectionGUID: mJQeCtqOSxmm2JZKtn4CAw==
X-CSE-MsgGUID: 8C7bCqS7SJ63FEGf6ruBvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28816355"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28816355"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:56:06 -0700
X-CSE-ConnectionGUID: jhUODN1pRDq5LJp+OTnrjA==
X-CSE-MsgGUID: KdOC6UTgTr6cEtUnth0XsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="78181226"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 07:56:05 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 07:56:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 07:56:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 07:56:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 07:56:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8TdqzwVmFpGjMMOYi+gm9W0l61mXwa5BCat4ahAWscaFtpxIRdz864MluiLef4aRIIYzaRhbMzIyoNAYNPTTlBv24BoNtA5P94IaSHsUmXBpGlsRzVrcGjJwzpxibzudfDAfd8SJuTEoxAXjwf4PwMHZw8oGA1X3JWWcpTQgMUGqDqH+m1B3MIbxs+hvEncznA1FbHnVEVcvx/JyX6OTbJZhyVEg5uveCurj+EbnABB7MaQumcoh0jLdGcaAS4A6VT36LwSX9pIygGxnjOWdVX+9fXP4aD4QWzCnTo1xEU73EAPQlqeicFi2atIzoqAoTxHwl+BZaU6OxbpWXm1QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDe/pZgy29wKB84vcn88bPgTe183KNA0tZ1cXZ/OvXY=;
 b=gqCGlixlFCrJCGGgbUYJ7G22WKp7Aj4t9gh25d5Zjdzgf76dYVGlzCOhCX9OIbH1Xe3d3dspegLGWPVu1y1dNg1uUMpCYgUXZJYGZgUrRQ4cjuO9AJJO/mKN49FsuCubNKeZv7RLQaietRVhLirZaxz24Edeht8U6/Os6048V2Rrt+O6roAYBs33fdkRQ+Lz7i6zr6G7rQ5TH9WQiGZ80n5r7hO69Gw6jKzfNR1dL0elA0Z+2Vr1OcfXZZ9OGAmqLIhIRxmAaPeFPVY1aTD7eOY7fMWPIBnbSyEVnGDo3STIexJ/BH4V8oRRNmO6Evmae179naFpU3HbiYkMcWYLdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4639.namprd11.prod.outlook.com (2603:10b6:806:70::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 14:56:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 14:56:02 +0000
Date: Thu, 17 Oct 2024 14:55:16 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Avoid the OOM killer on buffer object memory
 allocation
Message-ID: <ZxElVJZJQnx3qCyi@DUT025-TGLU.fm.intel.com>
References: <20241017144407.91919-1-thomas.hellstrom@linux.intel.com>
 <20241017144407.91919-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241017144407.91919-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY5PR17CA0036.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::49) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4639:EE_
X-MS-Office365-Filtering-Correlation-Id: 00d8bb45-0330-4ec3-bf1c-08dceebbd1c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?E/xxcJHEJUrw7p4r9D1Gh80BCYxY/DNRRotbUnk6raW4pyMHwmyhBxJkPY?=
 =?iso-8859-1?Q?K6mE2/STw6db8uycHiKoBQPW1h4fCdTcniwlE5plf4OK9qH4fnk0JuoCKb?=
 =?iso-8859-1?Q?n+rkaXH9c0fhEYwalU8tg0LZ/otCa7ANzO56BQaf/ORSDwP8xXk2dm3t+P?=
 =?iso-8859-1?Q?nYv86K2Wc7OhRYC/mlK1Mt8mndLgGgAfHagvfYH06jVtFOWoRga4XhrZXo?=
 =?iso-8859-1?Q?XYyzihJ75BmSXCfDfK41KoujGd68L0mqn3nmhCUfQRojOPW/kjcbXPNzpu?=
 =?iso-8859-1?Q?CmiMO4aVrCuMGoZtL/cLjpszbWOYnrBWVvdXaJvKw5dbO2u2MrhcZmkCZX?=
 =?iso-8859-1?Q?CkxT3iJh5hHPs5lIdX2gbIOm9xliLsLjDo/ZOsmqkoY3X841YvzlRwqJBt?=
 =?iso-8859-1?Q?+0A3Ynj3UmmSS9m+lH3yiylnsHJFEMtTXU9gxSrlW9I7jze4c7DzKuFw/Z?=
 =?iso-8859-1?Q?aQRgUmeq+pfqOeCpjoJZtrlXWJUSmrBZMVgQ7H7XQVzyv+T9S8fMMKzdyS?=
 =?iso-8859-1?Q?v1hMX8RJxzG2E4wPdog8V+DWhInU2vsNAXkOzYIG4JmFhPoH1H5YhAqsNT?=
 =?iso-8859-1?Q?g7pfbAQSRRU9goa+IodBaku2DJp/370DuD+EPx783K+5dps6i+q+31icJH?=
 =?iso-8859-1?Q?nOJn3mvEGIT+0WlDsjSiTC03QLvW6UydWs8pbWiEjtHtBksUOTMJetIZqo?=
 =?iso-8859-1?Q?YFsynZzGAWHTMNVwIf8XWE9wcDdnUKwDFdGIKbHRNI1xgeiSzy5r9g0baa?=
 =?iso-8859-1?Q?9CoqXOQS69Ahg+2Pg8yYeO2foUbGAkFtYmBDzoO0X2eWAx/BVus2D5d0iQ?=
 =?iso-8859-1?Q?RfnpMV43eStvnfBP0xTfOFMoT0uvfX4nOfzh2RfzVe8xI0dDZcboIzuySp?=
 =?iso-8859-1?Q?Sruo0Ol8VkG5F/GyLBH+KHpM/q/tCJEKNUmfsKBUK4Rxbubj5f+wppQ9Ti?=
 =?iso-8859-1?Q?Iu0vVWeKCnoANZy5VNWi8RbsqvQ1bCQSMK+CC6nL8B7BjiqlC0tmUeX6ns?=
 =?iso-8859-1?Q?G9iskThLM/XSB7ioiZr6asbHL99Xlnria3dfCXymPE+A7wU0LRAo/IeClr?=
 =?iso-8859-1?Q?Eo1EBXWIqNx/rjwHYO2bmBvcbiX3cq7QmcFmqq/CWfWFhapSHrdc3NTNY6?=
 =?iso-8859-1?Q?pjoYAhRmebmy3Doz2mRRFDMMKrHySFCsHtc12vRk7lZj/Edkp2/7Ym1UGG?=
 =?iso-8859-1?Q?OWH0/D5kDRXtosnTihjZC3u6p02wPXgwEby9/sRV736Ev44Ps5PXIm4/fa?=
 =?iso-8859-1?Q?P/05Xw8iBHZl6sWH0LEAz0f39gqfi/kDGHW8rhzyZ3madiSr3GGkcPp68W?=
 =?iso-8859-1?Q?b67t?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/XUjxOyWsNVKRrhjhLKK62ghTIU/0vsgtX2gCRyWu2Lbz5KtWLG2sc40y0?=
 =?iso-8859-1?Q?IkmHK9SZTDOVvY7iHIWe90CLdOpL9EjBXSo3GQaML1d/7hTQgsHoCzjxqP?=
 =?iso-8859-1?Q?JrmNhisyABsb48KocA9XSRhtlabXdaI/UK2MCd3Xd2GZHDIpKLmgKqGI6E?=
 =?iso-8859-1?Q?HbIc5c8dG1xeUTE5tFOlkugE52Qgve4QN+pt9vTxyeAZX4MMzQd5FTR4z6?=
 =?iso-8859-1?Q?qvtDK37DqXQBfZcf/vBwKuAxFdZLOMQFvoT4FK5SwnF7aAp7QFFlZjBAal?=
 =?iso-8859-1?Q?I26aCn0d78JVErtO4fkuTcr7Gm+DqMlsS1Bff4u121VcfOMIZa/6EVbwny?=
 =?iso-8859-1?Q?p5Tk09x8X8/Q9dsPrkEeqX0s+3cG3lDat7xkr9GdxkyuELwDXTqW24YhMD?=
 =?iso-8859-1?Q?6oGjqFoW1igQJM/QY5rddRXVIU5X44ojGXvrzVljH5vJWXlQzVOg0U6eUo?=
 =?iso-8859-1?Q?U5BP9+P/6XnE4nSn+rLfAUFDLgRDUr0t8B/fVNIzcMnUDkjCSZVpH9wBvH?=
 =?iso-8859-1?Q?e2LzLdE6tE1DPng4TGSk2QxHHmRocIQJWnHabCYN8CNayReeH4JKZY51pt?=
 =?iso-8859-1?Q?KqmKICtgfzkm9t7JcZGi25AXq+7IJv4SB5Byt4eLaTY3Buz30Ivm986AKl?=
 =?iso-8859-1?Q?u+yxjlDx//e3FEXTBj5bl+F2uPbKKvj9hZE7rXURiprTnm/p0FiQp6lwJq?=
 =?iso-8859-1?Q?qk2FVI53wqpIOCdf+e01bT/LARXIrBWFNKKLcV+/Exb9tiLcjXXLZ5VbEd?=
 =?iso-8859-1?Q?Bz+NbdX/mMPJ/GjCAB8oOw5vEGRCKdCXSJ2Szak7FWctQNbcYyF6H/eXBz?=
 =?iso-8859-1?Q?oNuj+ULE4Y0FNmGxsmlnL+ztoBE6QAKXrMgMgy1/GLGdRlX6qFdpk8Lzyv?=
 =?iso-8859-1?Q?fYoC6uNNKmGbmGeN3o4w6YkVWj8B4Gry1bf82JqaiNMsYq+esrTh3ojY4E?=
 =?iso-8859-1?Q?INTamXeG/qHCdgjiqPKaYFWMZOaKaQU95pk+ET78U/Wj8EP7t54x94fAqV?=
 =?iso-8859-1?Q?NACYzy1RDWcQufIkjkW5KLSsFWwwq3tNwNoj5QLdo2xIBT7EwVb/WObtJi?=
 =?iso-8859-1?Q?x2BG5OoAcQtV+4P1NN4QrUSscCVC4TRMIIFLUoZxNGgP3GXJv9Mfo7G1a/?=
 =?iso-8859-1?Q?iN/gxmCowSDjKpKqMhz8tSzSMo7UsPkRUq0ZNRfi7DDhFvJmcBms8birwv?=
 =?iso-8859-1?Q?cbkN0d3NVE4mgjoWoT/O7iX2/pOuV8eK4VV+GgMe0bEpP0PaSMaRGuCJSr?=
 =?iso-8859-1?Q?qqcrwwOQGQfh9sVQQEJYMNvinJnx8mR0k/8QXGebQ1NAaMTlj/2Tla6eFy?=
 =?iso-8859-1?Q?LiuSAq7YKIx8vGr+fVZDV850WO/DN1befselOObg7a1r/edC/TjzezX3Cd?=
 =?iso-8859-1?Q?WyZmxOy88EX02spjLcEEMQXtVjAHdAZv5enxryp5Wj7UzOVKuZ4nFbE7B5?=
 =?iso-8859-1?Q?US51D3TZNLBS6OmokVjhER8fMFRVupthHr3IHC4jF3owQ5esBO6pjUrb8e?=
 =?iso-8859-1?Q?NwfegAjlCJ0euOTz19PqXnw7+kSUVjnCWWeuxpV7seanfWDd542LRpPJ1H?=
 =?iso-8859-1?Q?FGz7R4vh1Khl3gyijBe2ypWDPZ54zIowdmYznBmJ4JQ1e3UU3ZIdchuNIf?=
 =?iso-8859-1?Q?r0thubf6683tAne79KTJun0qHf1pfzmlEGclcOiw0Pc1t61SrRu/mwgA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d8bb45-0330-4ec3-bf1c-08dceebbd1c2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 14:56:02.6108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PnJcXyhKylStvuhw0PUQPMoUt6KTis/2ZOFAg2TFJUP0r/EzOxeHo5W8aqPCiRiDUtrrquysMHQ5lqROpOR8fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4639
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

On Thu, Oct 17, 2024 at 04:44:06PM +0200, Thomas Hellström wrote:
> Rather than invoking the OOM killer on buffer object memory
> allocations and validations, have the allocations fail and
> pass the error to user-space if applicable.
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2701
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c74c121ea7bb..d060f4f019a2 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -876,6 +876,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
>  	};
>  	struct ttm_operation_ctx ctx = {
>  		.interruptible = false,
> +		.gfp_retry_mayfail = true,
>  	};
>  	struct ttm_resource *new_mem;
>  	int ret;
> @@ -937,6 +938,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
>  {
>  	struct ttm_operation_ctx ctx = {
>  		.interruptible = false,
> +		.gfp_retry_mayfail = false,
>  	};
>  	struct ttm_resource *new_mem;
>  	int ret;
> @@ -1099,7 +1101,8 @@ static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operati
>  static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
>  {
>  	struct ttm_operation_ctx ctx = {
> -		.interruptible = false
> +		.interruptible = false,
> +		.gfp_retry_mayfail = false,
>  	};
>  
>  	if (ttm_bo->ttm) {
> @@ -1294,6 +1297,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>  	struct ttm_operation_ctx ctx = {
>  		.interruptible = true,
>  		.no_wait_gpu = false,
> +		.gfp_retry_mayfail = true,
>  	};
>  	struct ttm_placement *placement;
>  	uint32_t alignment;
> @@ -1880,6 +1884,7 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
>  	struct ttm_operation_ctx ctx = {
>  		.interruptible = true,
>  		.no_wait_gpu = false,
> +		.gfp_retry_mayfail = true,
>  	};
>  
>  	if (vm) {
> @@ -2223,6 +2228,7 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
>  	struct ttm_operation_ctx ctx = {
>  		.interruptible = true,
>  		.no_wait_gpu = false,
> +		.gfp_retry_mayfail = true,
>  	};
>  	struct ttm_placement placement;
>  	struct ttm_place requested;
> @@ -2273,6 +2279,7 @@ int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
>  		.interruptible = false,
>  		.no_wait_gpu = false,
>  		.force_alloc = force_alloc,
> +		.gfp_retry_mayfail = true,
>  	};
>  	struct ttm_placement placement;
>  	int ret;
> -- 
> 2.46.0
> 
