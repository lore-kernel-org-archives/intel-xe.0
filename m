Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E188E606A321
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 14:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JkhM3Tfg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8916C10E342;
	Wed, 28 Oct 2026 14:19:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CD110E342
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 14:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793197188; x=1824733188;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=PEGOSX8lxxkPWe35y5BezACKqScYKomgaCIb5f3ohog=;
 b=JkhM3TfgvMvFUobQmx4Bf3J58ykeY1rBgGy8NJDC6ex++WEmI+qffO2C
 ArvR9Vjf3yN6nZucWj5HOBWuwPKv4jVYWUvt/2ndGaXOaIl899P6LzqYX
 vEpFhues3kghe/LwpaCZs8vQc+OcTTGFXSsj0iZxRpQoCkTzgAPjoXrL+
 DPiazCdDsREXNr7QIoVy4lBzAPjpzsfU+/IoZ2453ch3tLz5WEaVJCih+
 dl4Dn4wUjXVuruXlN3ONU2dHUdyB7JtMeq1AiTdWxp8+ljcOoslKugD1T
 vD9ti/62HklplYWMyFfV21qaPFxChtvzqcE46JXn/Am7XsngnFTB4jNba Q==;
X-CSE-ConnectionGUID: Vq/2ruFlTvee4wSmHj6hqA==
X-CSE-MsgGUID: pEfcyoq3RveUz1GFJj0PMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1922315"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1922315"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 07:19:47 -0700
X-CSE-ConnectionGUID: r+IY3pByRn+39qlmSJKiMQ==
X-CSE-MsgGUID: mO0yUjkLTSyGZB0XyUQOGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4792020"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 07:19:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 07:19:47 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 07:19:47 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 07:19:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOYOD0b7lXsEB8jzStGKOMvlERE0llhDhsbIKgwwlFXfhMz84OmYsc+ziHKCtzVihQ9MKA4LfQdopcpR9q7QOn2mQRNel7O+IKJxaI2IIdKPETbBmHvb8Jockh2PVX/ZG5wc/MDOvF4N24INpKO4+0S+egoiJHcDsKGz5A1Cf0zt8XS4NnEcw8TRAJN2dVq9VxulDoytDFSnU+5XVbXcLYWwTv0qv1AlN7LFfFC9+nAfi2W8eokZlM8lTXNPqHnvsN1fxpGzXUWAMrt+0HZoGGlae0B5JFVXeVW93+Hz33FSPsJxLBBzAkiVcYG80OqpPBSBkYAj2XoZXT1tkgPniQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQ7bHr1OS8m3xQxNmup2nHLWuvcwGM3x0TutNjzm21Y=;
 b=JSeH31b5BfiJJGE8lQc9RRb/ZneNu7SmV5p1qxLSuGBYsxDrl0aa7X9hkj2SLI1ulinP3HeK2+CHlqpCJialtKaa1C3+7sxZOOYFrSvnGstEc2VBUxdaBP38X1mcE2HP6uHZmP9vYES0iybm5YLysjcWA8drgqG4TrZwcMZspfm4sDR6OukFFayFDrruV3QeY+YU2fDK/wQISZdC2ZqjZ4TZ5F9rgwc9wFoOC5IWVTTcwh7qNuvrczW4N71npxObOOswI7tIlEYpkrxHDhlEZAuSz7pYrsTkks4zanoc8TUUoVkWN78JPz7W5t6Ru/5o/GTjLsxShxjCWfZwJPKjPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by PH3PPF4E874A00C.namprd11.prod.outlook.com (2603:10b6:518:1::d1e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 14:19:44 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 14:19:44 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <tejas.upadhyay@intel.com>, Varun Gupta <varun.gupta@intel.com>
Subject: Re: [PATCH v2 3/9] drm/xe: Add wa_14028434957 to Graphics Version
 35.11
In-Reply-To: <20261026060459.771448-14-riana.tauro@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-14-riana.tauro@intel.com>
Date: Wed, 28 Oct 2026 11:19:38 -0300
Message-ID: <87h5i5nc05.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0079.namprd05.prod.outlook.com
 (2603:10b6:a03:332::24) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|PH3PPF4E874A00C:EE_
X-MS-Office365-Filtering-Correlation-Id: 277e6cb0-f8b0-479d-1a57-08df34fe8362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|261009223027099003|261021121427099003|260925021911599003|10067099003|260925022911599003|260925021311599003|56012099006|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: /Py18XNtXogCL+oU490LprIceY13DI+l/gIAr4c9JUIObXJgrs3GQJPIFTUyeJOwVTEMPdPjp1iqUpvgcdqH11+Tjycd4rAEEt8qDdq4qQYlDxRy8QmIxGyXE2UtCjwvoj/gBtO5UQMcSO/Qoel5X073WUbe30jOq6/1Fl6DvyTUGwkOBfU9ls++uf9X3jdoQITYAQxm07sdX5frs2/YyWA/WY7XdkSkaXuE8FNKqw8BdEv7Y/f60XynJ0IgoCEVsnD9hIYZ4KjRuM1dZ+9/CT/gess6XDVep9YsUdSguZWX5qBlpNMO+32QTfAwnC9I5Ud7lVwrFkglquCw91bDgK/COIOdxQLgUsesOtJaitZHhkbZIOLWDY8LerKop5P6jC1D8T5hX8GI1l16tJibXWl0zkXzrXMEOoSlreQ7ZKDKXWJvG91DDW6BJ4UDiMhICgqkmpKvyAYH/EWOYZ480dnastimF4GMvR7N7Ie5L8sjJjl0agxyMHC3cAA6j26/SP7rLHTNgGVB/MqZ6IbjVSg7xEx89Sj0ptMlPQEh/g21nYc9Je632lXEna23TmqHxIAebaI5HQFJD47b5P3bEsQLxz+QB9TAk+qlQmb3CJUJmBzrbvAHITiRgNgsxXivhvRD5oDheFirfDP5A9qLWjCwcMjSIC0lIo3ssl/EnJs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(261009223027099003)(261021121427099003)(260925021911599003)(10067099003)(260925022911599003)(260925021311599003)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WDNRjFCruW5pOnT05R/FwaXNlatKk9mJcVrxbFJ9YESLDGbAq7+iw05kKknQ?=
 =?us-ascii?Q?0KShfazxj+JzZwBjq3UoOPwFM3WHzYKNxIb0yi8pdiHFnrj8NsNdClO5Lybn?=
 =?us-ascii?Q?5LCY3+IFPmSNnDheBqrXZE+yaQeGfMpx/msY+SoMhsE/0qHlKcgWNbYP4fLH?=
 =?us-ascii?Q?n+0cpg93/1aWEN5nEgdm6s8UMnLNbdAJKowm80jzA+EnDaX5Ziti/dkoF0p0?=
 =?us-ascii?Q?sQ396tAejGrNVg0Q0IXUJZwXGsMcqkI9yXZRZrcJo/6soJCVCjr3lxxekwP9?=
 =?us-ascii?Q?WAvK138wG4Ltu8i90vLasuUESx8jphr30kfO+mwHpKgA/Hor8Rn8BDkR2L7N?=
 =?us-ascii?Q?9TbuT+goNjoM9rKHjyxnNiRW89Cy/rZbZ4WLRe2vV0QrLpMwuDrAtokKctCS?=
 =?us-ascii?Q?CaxaOrYARCQ5i4x7XehBzPYODch9NWOcx9vLuJEYkDlfZhmE29pkfrMhE3dc?=
 =?us-ascii?Q?pAYR+hLDTRFqq4H2GOglo7hozPzAwgwqt/77ZzIEK5hqji3YQP/fzQTuRBso?=
 =?us-ascii?Q?1VXlplimjK1lnER8B1A9BErc9obEG7QETNIqJ5pgidAyE1ujDZVuU15pCIxy?=
 =?us-ascii?Q?OKFt2difXLXyrq3sg7fvhHfYajpXZuvCqDurclwuW05BRrWO9Fj3bbh295NH?=
 =?us-ascii?Q?btzKHi25DqRYZbALzrOqrxaIUTg+mMjUn8ujf7vn0W9+uIatvCt6FtxNnhvZ?=
 =?us-ascii?Q?oTjK9kdLLOyanYw/Y6GfMaxuEyLLggYUuhcKhV4oPDCjg+qtTpHfw+29mcwi?=
 =?us-ascii?Q?a4ia6G34FRJaklyUSjRUXOG1wSx1uksrUXzinw6qGorubKkURky/Z+kfidyX?=
 =?us-ascii?Q?EzZImqX27nmaEoQhYGcyYxqimBug5YOI0t9AG0pMBX8Aq16A4Y3MIxV67Elp?=
 =?us-ascii?Q?ruM7zWI3Ki2ga7VPfWCItQBB0TI9kFDbpgL9yfqPVWrR2+4qAT750RYTwK0E?=
 =?us-ascii?Q?saaz9/eWse8aeO1gO1xuu8Dh9u/fiM2x7kMdbWHUxMG5oJNOhd8z7IKgml1r?=
 =?us-ascii?Q?Zu3DF7HKkPjhMJGb/cKsGISuKIjbnV4fEMtwyTvwu2Jc/Hrpew9rfqX8RtJH?=
 =?us-ascii?Q?7qVkzU8hDVYd9EFNrhZrOtz3fnJ6APCAZHJRPrCvr8voPTSP4jwMYQe2c1tD?=
 =?us-ascii?Q?6WqWDxrEEMzJrtRgc/I4/rR4in3ACLvgP3VQ9MqUkD0nkOya5SfIRgV1NbOj?=
 =?us-ascii?Q?6KS/hB3CJYgd/h2CYP2FIPJoe4vYwV/n5KVH45kzl3w9G0Ah+HAILECwJOaz?=
 =?us-ascii?Q?wyIleqi2uwMo7bbefzGomBP3wb/hbjDSyIdRjsuPqo+OmXquKMG1afZ4yau0?=
 =?us-ascii?Q?ctpKiN5C/8+LVBAR+BT89aoz3ZV0RNKT0AlW+0qw13iRCxFPzIVLFdqJQT0t?=
 =?us-ascii?Q?pRyTCBVo3e/DV6+iBOtLWXokj9jo1TABBAaMrxVTY0IL6gLykI3bP+cOjQBd?=
 =?us-ascii?Q?Td1N8N3/qz1bk8j14ZxQKx8hSoEmQ3RngfewEfDNlrtuOoUDjfV1pTSBTRMc?=
 =?us-ascii?Q?jyEOLD/6t+SItYUYv3/JGchEwpUzhcJKcpb06ejupSDpTe7jZjlr02ddJi4X?=
 =?us-ascii?Q?S3H5WOmhpgZyr59s5zjhCfcaA8ca87UzrdFNjjvE69EGeDSZvWiDlLeLgF6A?=
 =?us-ascii?Q?xjprEDrpLVxHOvS1RFEqaDgwDI8TVnIHqeCyGAIUZu5LymDqhY3b+OkUoDM/?=
 =?us-ascii?Q?i8IZuYli87TTNlt1Zc+svA+lxQ45laVCS1aISBg+JC4f5A4lHoFROnoqrS3M?=
 =?us-ascii?Q?tvwQOzzLOw=3D=3D?=
X-Exchange-RoutingPolicyChecked: BmCUhHzQbRwDE1XxB1C2y6LKOIIW+ZikUA3ULP9k+iabf6lv3ViP3OB4fdp8sr+L/n9Q/VkD6KVeEJqbL43eJ8iFNLTbErbE5fGUX5u/bnaS69Y4/hhop5o70gytCJbCFevDfp2tscopVXnQujA4t6YRBC0HmgHRufGxc1JnSqoi4F/Ha0Ik/xHOGQTDgSY77B89TeUQzI8SVP6plKDCAE9DQacI2UBizIOQla0hVJrD7ezilodvDSCQRG7Cpias3Ips8fJNiql/J/rf5zo0AyCFgeah23Zi44rn1x5+OT+6dTCFA1cwN0wmI7ECIgZRv/gGUn0x1Z/2A30u8bef5g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 277e6cb0-f8b0-479d-1a57-08df34fe8362
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 14:19:44.3693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5XszmysRfMABs+/2StiaVeQJiVj97ZF2HOdjDDvO6U1P46YpOBSFd2P2PvM0l1sriw/Oiezd5hXHl9xmHP9Vew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4E874A00C
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Riana Tauro <riana.tauro@intel.com> writes:

> From: Varun Gupta <varun.gupta@intel.com>
>
> Add wa_14028434957 for Graphics Version 35.11 to the table.
>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_wa_oob.rules | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> index d8dc41851425..36b2567994db 100644
> --- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> @@ -7,3 +7,4 @@
>  14026633728	PLATFORM(CRESCENTISLAND)
>  14026746987	PLATFORM(CRESCENTISLAND)
>  14026779378	PLATFORM(CRESCENTISLAND)
> +14028434957	PLATFORM(CRESCENTISLAND)

This conflicts with the patch description.  If the workaround applies to
graphics version 35.11, then the rule here should use GRAPHICS_VERSION()
instead of PLATFORM().  Now, if this is a platform-specific workaround,
then the commit message should be rewritten to reflect that.

--
Gustavo Sousa
