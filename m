Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D706CCD1A2
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 22:49:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0BAB10E16D;
	Mon, 20 Oct 2025 22:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IE9e9e1m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFC310E16D
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 22:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761000589; x=1792536589;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LOO3NDZQm9Vnpj4xur3hT6tWAXSgDXgrebh+hSnJ4RE=;
 b=IE9e9e1mQaLqGx4GZbnINqkjPgVdUPK0TPE1ZucTJ1Cakq/Lmi3qOQFA
 cT9N8YrQfwuhwBwoKW4pmdXCbKZAqIYIeyhpBCJxhLp8ywwSlY1ehGRaG
 kvu+AFUde8sjNhUbazRCiD8zHalsOaNtp6wRyBKuJVijctt0VJvUuiikW
 pxBE6MkQC31IABnwK8tPvcV/V+tjCKnadZS/P5x4TvgoKK4AvSbZKpo8V
 kWvdnHfqsLD7Ct6LqJOSLhirht/h1dSx3PQEgArRv2wo8b8ysn02sjOEM
 /qsW2OvIGkXumzX1kVPfWjamGu9Ftq/n9BKwv160KYOv4RK9FspsknhFL w==;
X-CSE-ConnectionGUID: MoNBdOFaRq+9o5cwyu74Jw==
X-CSE-MsgGUID: procYqFURHajksuLNMpNzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63029565"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63029565"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 15:49:49 -0700
X-CSE-ConnectionGUID: 4nPw+cDESumH6rH6thaXqw==
X-CSE-MsgGUID: MhOWESM2RoyYIyKWb08zXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="220599962"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 15:49:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 15:49:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 15:49:42 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 15:49:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lrbd70c8c2a4DPC+JJSlI7WB+tqTDSG1EKLSNzbSWMwaV8bdo2PcF9/NLq6Ra48frF2W0v26hWmAMmBcP/jP4Z37icz3Xu211QJT/E7sfhDoukvuSyFQM1UclVfhaoycg7Uc/A5uT5qWf+/CrEw7KXTZmXlRxIDKuMS/SkSSnJg/W0xuAeHEFH5Uz0yUekxpDJ2oh8SwkT0jfumt9sJRuW07gcrWjzDrlSTXon9kYtm++vJZD/0eMAkljuOMs+aNYK7QDKThMXVML484W/eTJZ1Vg3M7Bjv0VdNQOHPQXFzkXTg3Jkpo4wmuaYk9qu469RNMJ1nhLGHU74LMmbiSiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MobZiD39A5hgZVAjRtD12EWFV6mPZ6ZBA8LYB8Nj4RA=;
 b=tAbS9O8hCCn0xd6IbtYRQdy704d5jXScBHLebH5Tve/YnDTwGIhDS/XZB7FqcYKD6DpbBrUh8wgl1ZMvLfjNgqwg1ydDHeYfslZ9hDvDPKjuDW4Z0jN+Hpzy1cEQDGDDnWQMqo8EKUHpmwio5E2s8eNk9pgmztidOOuWWkwYz4i/ON/sBPi5AfAKcO4gdt3jwmJnDJOVS0+26UMzyr61Yp4q/QrbDgSlUnAXTZ5Z4aQmGasM2uyL9aSIScW51ads31J0NNUf4bQentA6ASRz3OeU5PzDC/C3YiFmDuOOtP2ISiiKO+TpO3lUXvUU60Vzc1ZfUDe/Js25+Vk9DoqSOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 20 Oct
 2025 22:49:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 22:49:32 +0000
Date: Mon, 20 Oct 2025 15:49:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 7/7] drm/xe/configfs: add disable_mem_copy knob
Message-ID: <aPa8ejveeTSwtuib@lstrano-desk.jf.intel.com>
References: <20251020125431.41153-9-matthew.auld@intel.com>
 <20251020125431.41153-16-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251020125431.41153-16-matthew.auld@intel.com>
X-ClientProxiedBy: MW3PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:303:2b::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8773:EE_
X-MS-Office365-Filtering-Correlation-Id: 1615f4f6-de03-4bfe-7ded-08de102aef96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2dEXGZKSUetHUavOT3zjWQWoO2eNS3YovPSzuXlq2cb+E+RcJdMhtWBJuH23?=
 =?us-ascii?Q?YiS5cW2S28U9W3IrpsR1miR0VmeXK+y6uQXGdN1bhj7j7vUGP8qsQpGEeIeo?=
 =?us-ascii?Q?kk6RpvWDgafytYelu0armNs+73fhdoGoUkoyfAw0Y796dFDsBAt94gCkMxTM?=
 =?us-ascii?Q?sA8ezTMnaIwINMKZOtRFxFM+yRbtPhEWSu3Gi80g+AU6XUtqx/iiRsHISWzu?=
 =?us-ascii?Q?Xxz7YgGa8BqexUHmxqQ3mnN3bXeWV4HBgnkKchAN9DrvX42B0m/EcmFMEbIa?=
 =?us-ascii?Q?VmcW/kXl8S2VQJrmS9B7vSO57leND6SlYM3zWjhGpp/PjUC1IwtPInIErX2C?=
 =?us-ascii?Q?bfV9IiTi1FlBujF5ZZqGHA5AJ09xmGk+a6MtYT8kuk2tlCgbAV1WmjjXp37T?=
 =?us-ascii?Q?j4Nenpt7L+VMWhxzEXRfWX/3LNJwyxqqEhZSb4dK8YIrx7/vciB+KL6a8eg6?=
 =?us-ascii?Q?gUEJuvHBWB8K+GjKkkwO0C6y9Pc0+RgdRINhlW4GL6QqQEtNkE03iGm6MKCC?=
 =?us-ascii?Q?BHQGTDahXltz0ReP4ibpnFlSfBkZaq0W2bnGxKdcWaoxc6s9jpu2ccXArYqz?=
 =?us-ascii?Q?V2A2cl7HtV8Z1ffPyDy4OfMm3yOnkiRpOHEzj1klMQuTsz5shIsfIZ7LjWY+?=
 =?us-ascii?Q?wn9K7mHRaQEn4GoJzt/RyiB03JkuURtWzEUuV8fI0c9b1YfhKlsre7P2s90z?=
 =?us-ascii?Q?R1KAksySbhso1iiAatdzvOJVcB67ElJ5/QkZB4DkB+ytT9eWdXvzNXv++QKM?=
 =?us-ascii?Q?N/ixLTH14uBeDQXIxl2ZUH3sTUCeF8ZO1ap1CPuyj0LJdTQNQPQLxIJSxfl/?=
 =?us-ascii?Q?e3ty7xMUJiRHCyR83ydpL3eX4xdnHHgVFac3caXLeza4D++XFbI8ptftyujW?=
 =?us-ascii?Q?oDmleHDHo7cx4bbXXCUBrXf5/hxARk9qxlrZPDzfmDXjwvLp3Dj/IsTdNtOL?=
 =?us-ascii?Q?XFevn9fYfT+WZXocAdLb6QKr5GBebNgrDdiYRE+5oYxtaVSbL9vgC3TnWsap?=
 =?us-ascii?Q?GqbCXGFHz5Yd3bl06XkXaylxVhQUbZ7HJh51f4KhteJGJpBEExugTNKmj8G9?=
 =?us-ascii?Q?j5NLqAURO03CHaqJsTp5K692k26YCse77eskVY7KgH3v8OGsdwjaPMYCCpKU?=
 =?us-ascii?Q?/Bms2DUkZXDRSHi0T9c71alVnCk9m8d9g5uIX3sca+6IU/vlwB6xTBRhR4St?=
 =?us-ascii?Q?hayH0eJEjG3TBuYTn/Mm4VvJCQ0pBFcQHY6IJ2CxT7LIHRilcNfrgA82dzan?=
 =?us-ascii?Q?nKv3y7siivDYD8iujPpuvQveKGFL0fMFQqdDk4/Dl7bYCroGEeE4XrGe0hh4?=
 =?us-ascii?Q?+OMHPJ+W2yN2nOqDKk1nL/HxR1Xh0XHjgsSO6xuQXhQ3tOalb220asgBLrGh?=
 =?us-ascii?Q?CeYvetwJPTXsHuGN6QluGdRB9BRLb0Cc9PiajHe2owExQTZQ1ABkIfKbfQTB?=
 =?us-ascii?Q?AaDAyMQLu0O9voriP4S95NB8s190USg9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3VHY6jiVZirUVoC5SovNG/WfYci9pnUNPi3thjf4Ly9NWjpClR6xpPH4awEh?=
 =?us-ascii?Q?qzAQ6AcYQmBJ8NfN/H/7TGYBokx8Mv9YZOXrTII1QR6Honoo4N9dhGCWmq9g?=
 =?us-ascii?Q?I7OEAsK2U9iYIbwcJGvKxK0s53es6lXpljMXyj69k6lPxryaKkREel9aWo0D?=
 =?us-ascii?Q?hyCKfW8jD3GDw7S+zVZSvOAHzp6OM/fDYaYe3kLJe+iAQP7sN6j3e8ZGA3eh?=
 =?us-ascii?Q?8NqgUOSr02a/laYzblvvgQobm5kXM2SRfMiBUzUs+PXo+AImSv8MZJ/UKQ5Q?=
 =?us-ascii?Q?rsZTLCl5Q1VKgnG/Jaiz+IG56jDGMB2lC+MmJ1uu2Dt7VnlknHv6oHI9PEvy?=
 =?us-ascii?Q?nZ/M3CKGIjh4G21Ymqq1jtyNtx3DwsFJPDExzEmYsuEhZZ26Kf5AiN1NvP1E?=
 =?us-ascii?Q?U2lE1/X2D2NZuBYvKC9lJnb7yuHTgb7O26B36EmIT7jg8QEZIpf/pdvIOkec?=
 =?us-ascii?Q?nbXgjRDpgRtNe1uuSro7noz+0dwveBnV/M7WFN0Bl+gaufrZrf7vfDTfm83o?=
 =?us-ascii?Q?wiFwq3giSIVZjVI8sTZ2MubRMBKLKUfYfSUHAVTvEBEfTYwgZgBX+jWfR5Bs?=
 =?us-ascii?Q?rsd+jjhawfoAZh1NYrfwK5vt1sfsTr4IYgEe8WJJHqWpqxfXG80RyUAn8ZaW?=
 =?us-ascii?Q?d31qMuV4sUwiS9Ikxq1K6f3O5b4Xiis6V7MAgEb1ZcQcBQ+YfBZJ5kvcQZzX?=
 =?us-ascii?Q?2nk1oXFjjysd0grj7CVZmeTF1o1oSn8/F5FtJmlBD90TEgermLfWVTJs8R5g?=
 =?us-ascii?Q?Jg8itAImE/tN9XqhAK3R3iv1d9kqjLyMzmKGUYyZ0i4RJ4JVzOWfZlY4cg2F?=
 =?us-ascii?Q?S6ilmuwLSjaG9is/lfxPOjzDXA26+9dg1ZLWz8RF9QFjNexOFzEEgv86t2rt?=
 =?us-ascii?Q?0xWnwnxsWHJeWK9jjtFbMmKf/j/gNIIMuG7F08TsAizG6ZnvpAO8SWZBlOWd?=
 =?us-ascii?Q?Lk411VgyhwA4U/0mzvZU1q1/CGDZ2gaSNSzF3BD9Ye4PWRCUeH23g9mvRfI+?=
 =?us-ascii?Q?dCVokmne7Da7b5hwF8lx39gpZ0E1RqPQpmgKBs5TVwqGuvb6vtHNKKI8bbE4?=
 =?us-ascii?Q?nmyzt6ADZGgz9klE5x9MuvhlOS/7twJbRjn2q5DXF1TeRzZKi7mFD9+lIxeo?=
 =?us-ascii?Q?VaLaeWwSN5T5Bvl25UHsB5lp6RB9lOoTxIWfWcnTMLKuCcXreYdlOILtQWKh?=
 =?us-ascii?Q?xu1FtHoHQzNiy8IIQjldAqOyhcW6iOx0qRR/nr7GZI6HNOjiSdW7TcJx4qlb?=
 =?us-ascii?Q?tF6zfy74efgRyHprzb8QNamjBlFL4Eza+q4Txp8q7RMVFuwoAhWG/iTzdEgP?=
 =?us-ascii?Q?ZiQZCmhreivdgaUEHiyAnR/EyesELXKZ7hlP7Jt97sWIXPwAreldRTfwXDAa?=
 =?us-ascii?Q?vtv7YF3dKw+MJIA9ypJ+FF8l1aWVm+ljFRxPATVBl8voIxCtjZF7DuUZ+RQp?=
 =?us-ascii?Q?8p4gwS7YG3vFYY3Slgk9voLc2T7bKfDfB3JKizUpAIhtnpkKB2eJ+PT32zvr?=
 =?us-ascii?Q?LLdcr49RcgiIDCaCifrs3yJSMaGkk6SybkDR5EhKkcFWZKmVkbmGgJuvLvRL?=
 =?us-ascii?Q?5+apD0zw2czcRh/L+FeLmMeuhJktmtx/zf8W7ZHsVjvKTDyfSvLZ2fCB466v?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1615f4f6-de03-4bfe-7ded-08de102aef96
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 22:49:32.8537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SKMr1fkEd0UsjscDzolNSONNT9tI6viD7sQppEfo64O4+teYhB7zOugXd8N5lti7GFzore4feKFAtfu4NZBcFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8773
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

On Mon, Oct 20, 2025 at 01:54:39PM +0100, Matthew Auld wrote:
> For easier experimentation/comparison allow turning off the newer
> MEM_COPY path, without needing to apply manual hacks and build a new
> kernel. This needs to be configured before fully probing the device.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 65 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_configfs.h |  2 +
>  drivers/gpu/drm/xe/xe_pci.c      |  4 +-
>  3 files changed, 70 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index c1419a270fa4..df459daa0f07 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -236,6 +236,15 @@
>   *
>   * This setting only takes effect when probing the device.
>   *
> + * Disable MEM_COPY path
> + * -----------------------------------------------------
> + * This config will force the use of the older XY_FAST_COPY instruction in the migration code.
> + * Intended only for experimentation.
> + *
> + *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/disable_mem_copy
> + *
> + * This setting only takes effect when probing the device.
> + *
>   * Remove devices
>   * ==============
>   *
> @@ -264,6 +273,9 @@ struct xe_config_group_device {
>  		struct {
>  			unsigned int max_vfs;
>  		} sriov;
> +		struct {
> +			bool disable_mem_copy;
> +		} migrate;
>  	} config;
>  
>  	/* protects attributes */
> @@ -282,6 +294,9 @@ static const struct xe_config_device device_defaults = {
>  	.sriov = {
>  		.max_vfs = UINT_MAX,
>  	},
> +	.migrate = {
> +		.disable_mem_copy = false,
> +	},
>  };
>  
>  static void set_device_defaults(struct xe_config_device *config)
> @@ -809,8 +824,35 @@ static ssize_t ctx_restore_post_bb_store(struct config_item *item,
>  	return wa_bb_store(dev->config.ctx_restore_post_bb, dev, data, sz);
>  }
>  
> +static ssize_t disable_mem_copy_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = to_xe_config_device(item);
> +
> +	return sprintf(page, "%d\n", dev->migrate.disable_mem_copy);
> +}
> +
> +static ssize_t disable_mem_copy_store(struct config_item *item, const char *page, size_t len)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	bool val;
> +	int ret;
> +
> +	ret = kstrtobool(page, &val);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&dev->lock);
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	dev->config.migrate.disable_mem_copy = val;
> +
> +	return len;
> +}
> +
>  CONFIGFS_ATTR(, ctx_restore_mid_bb);
>  CONFIGFS_ATTR(, ctx_restore_post_bb);
> +CONFIGFS_ATTR(, disable_mem_copy);
>  CONFIGFS_ATTR(, enable_psmi);
>  CONFIGFS_ATTR(, engines_allowed);
>  CONFIGFS_ATTR(, gt_types_allowed);
> @@ -819,6 +861,7 @@ CONFIGFS_ATTR(, survivability_mode);
>  static struct configfs_attribute *xe_config_device_attrs[] = {
>  	&attr_ctx_restore_mid_bb,
>  	&attr_ctx_restore_post_bb,
> +	&attr_disable_mem_copy,
>  	&attr_enable_psmi,
>  	&attr_engines_allowed,
>  	&attr_gt_types_allowed,
> @@ -1065,6 +1108,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
>  	PRI_CUSTOM_ATTR("%llx", engines_allowed);
>  	PRI_CUSTOM_ATTR("%d", enable_psmi);
>  	PRI_CUSTOM_ATTR("%d", survivability_mode);
> +	PRI_CUSTOM_ATTR("%d", migrate.disable_mem_copy);
>  
>  #undef PRI_CUSTOM_ATTR
>  }
> @@ -1242,6 +1286,27 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
>  	return len;
>  }
>  
> +/**
> + * xe_configfs_migrate_disable_mem_copy - get configfs disable_mem_copy setting
> + * @pdev: pci device
> + *
> + * Return: True if fast_copy_xy instruction in migration code should be used as the default. False
> + * otherwise.
> + */
> +bool xe_configfs_migrate_disable_mem_copy(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	bool disable_mem_copy;
> +
> +	if (!dev)
> +		return false;
> +
> +	disable_mem_copy = dev->config.migrate.disable_mem_copy;
> +	config_group_put(&dev->group);
> +
> +	return disable_mem_copy;
> +}
> +
>  #ifdef CONFIG_PCI_IOV
>  /**
>   * xe_configfs_get_max_vfs() - Get number of VFs that could be managed
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index fed57be0b90e..01f285ce56f2 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -25,6 +25,7 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_clas
>  				       const u32 **cs);
>  u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
>  					const u32 **cs);
> +bool xe_configfs_migrate_disable_mem_copy(struct pci_dev *pdev);
>  #ifdef CONFIG_PCI_IOV
>  unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
>  #endif
> @@ -42,6 +43,7 @@ static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum
>  static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
>  						      const u32 **cs) { return 0; }
>  static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev) { return UINT_MAX; }
> +bool xe_configfs_migrate_disable_mem_copy(struct pci_dev *pdev) { return false; }
>  #endif
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 8458d4ae8ee7..9f8a2a298216 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -660,7 +660,9 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.has_pxp = desc->has_pxp;
>  	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
>  		desc->has_sriov;
> -	xe->info.has_mem_copy_instr = desc->has_mem_copy_instr;
> +	xe->info.has_mem_copy_instr =
> +		desc->has_mem_copy_instr &&
> +		!xe_configfs_migrate_disable_mem_copy(to_pci_dev(xe->drm.dev));
>  	xe->info.skip_guc_pc = desc->skip_guc_pc;
>  	xe->info.skip_mtcfg = desc->skip_mtcfg;
>  	xe->info.skip_pcode = desc->skip_pcode;
> -- 
> 2.51.0
> 
