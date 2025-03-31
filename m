Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A476C3600B
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 15:24:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C5610E3FE;
	Mon, 31 Mar 2025 15:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C46h7ybI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAC710E3FE
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Mar 2025 15:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743434698; x=1774970698;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4tmTu6/tV/CrJ2v4hZvocoZDAsx7fKBbC16pv3TXn5Y=;
 b=C46h7ybIg8HDqlFw+hzpI90AQuXfNB+Qt1N9Lo38UXFNmcXvU6ZIJHmm
 kIV494oV4WoYjz9zLojb6aniC3HJojy4D1yWSmMpnff/CvotEgKM4Xy8F
 GrHfDhVWoxXdpsXokSXIj/7L4LMyYAQjBWVv4GBL/a8xFZ/Cijjg0iJ8q
 dR1ZGAk7TQgd9MvHceD6lAYSdXh6T28nW4mwYhq7Zwrs6oREIyRK+/Apq
 pFZU0auyBM/uNiD4+iy4izZ7/UZuFQ1NvSR+/rBO3edNM7grbTSna/WN+
 oPaZKCv/kuhW5FkUHUb2iuWYO9mqp5l2rMsdcRSQeKnG9v9bNfQKUbLjm g==;
X-CSE-ConnectionGUID: 4QT8oSkaTIyaLUrvWx4vLQ==
X-CSE-MsgGUID: a5VjeM0BR2OcZ+4KSRRY5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="47450212"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="47450212"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 08:24:58 -0700
X-CSE-ConnectionGUID: mcSVym5gQrmfmbDQj4KdRA==
X-CSE-MsgGUID: KJnAZN55T4Ssr4wZ+bkwWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="126344087"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 08:24:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 08:24:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 08:24:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 08:24:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WB8paNagJWa58d435XNklDOReTLyhlnNcd7OFLdP8AINUV+j0M5hntMtOVJMbREiiZn7GLkiPlc+YqmId71SrmE6gHLFWu1BMh0sCYLhyVsSwpO8Wa5P5nsbdgklyipcR4kKepwrvlK3zThEHc2lb+g+gUfKHILsEmwKLEU3K97sqa6bZSEoupI2RVptcjwkzjfjLZeRWcdlhzPsNdSoj1vC3upOW7J/14gInECfhvKU9l6j2gqnINMD5qJ2YCYaM1UVCEhrm3STtWAH2EVqh9zouvMUO44xtz7rQ5LDceHp/YugXTc4Qu3XwXszOagtlDhf/ieZt6QEjw1D66ID4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTgJ9AKrsd9tm5XkNxKcGls8arkvJdSl5/wvpdn7S24=;
 b=PBFNbgxE+m9Xfs2R53SkZ6BcjZZN+rLiAVXFX6Rj2fpyzv3dED2HRapzWtYS5eGaORKAJoBxYTWMQc0aIJkM/1q1hUsYkj0Agvj8G/u6tWHkdNqaPGx9w0eejYjKvOJDv8AoTOJzelOl/cPbmHhIEQqhtccQSGAjzi6DBCgsZIvXlGXOfBCe512V03PEtRDojvDl/S18YpBzTyD2rFAM07uxp31odhhsjiH0Dvqa36f2MWO3CfGdclLrPwxSqgWIAedWv+t0MzwPWYmCxVfWS5t6a9xs4PmIrxFjuITCzOwaqljTkmWSte5K4qsWBdMupL8gcXoLRlo1RMKUPln25Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CO1PR11MB5058.namprd11.prod.outlook.com (2603:10b6:303:99::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Mon, 31 Mar
 2025 15:24:14 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 15:24:14 +0000
Date: Mon, 31 Mar 2025 11:24:10 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>
Subject: Re: [PATCH v1 2/2] drm/xe/doc: Wire up PCIe Gen5 update limitations
Message-ID: <Z-qzmk67lxSFy-bk@intel.com>
References: <20250331142336.640226-1-raag.jadav@intel.com>
 <20250331142336.640226-3-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250331142336.640226-3-raag.jadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0103.namprd03.prod.outlook.com
 (2603:10b6:303:b7::18) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CO1PR11MB5058:EE_
X-MS-Office365-Filtering-Correlation-Id: 5709ab6d-8e65-4e7a-e95d-08dd7068185c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xiGaLyjSv7GBw3SgShK/z0S+65Wld/3x8jHw2Rdll+2lrQp8X3sEemYKkKlt?=
 =?us-ascii?Q?Qikwpl556DIFsSbtB01JOcFlUQ/qAYVCTT6N2LyHRc1u9OMsgUcABDQzSWRE?=
 =?us-ascii?Q?nTSUxBmumuTrSEu0OkkbiqiNFkFsVU/Sjx61qsmSbKHZNQvV3W/UEZx6/71S?=
 =?us-ascii?Q?WlSl968xP9rPY33qlVzvUiCZMx2I5tZNooZBKQ15+fLmNsll0VJ6inLmmvqQ?=
 =?us-ascii?Q?AoUvWxEkyorjwiByUl1+cbbmLrU4G3OGVWUqAWB58lMniwINHtCXXCrMIJFZ?=
 =?us-ascii?Q?2GAUDbpJoE+a44HUUTTp43AQbaCqnMRiU6dBNLwp3BxQXwufSkYbjrgC5p6h?=
 =?us-ascii?Q?2MHe6kEbQHxYPpMg0fhLonlJ7cPXLuKF37fQOkmjjfX+0rhtY1J8WNpd09ny?=
 =?us-ascii?Q?KWp4ZLBU1b8bwDbPGCF4Yd90sIc5BdpAZgFsdcaalKdnyQXc9YCdH85zq1HF?=
 =?us-ascii?Q?ch9vKt42ELPz+sNe6f1P6ir7QsiYkjGC/LtR06+fiXWU9huYUV5x7AxhgP/z?=
 =?us-ascii?Q?oGdiJ46NgK24DminacR9xYg78KbJWw/4vXUBybF/PssrC9XyddjGoY0HtL+I?=
 =?us-ascii?Q?ed4FWyGQkvAHWMchRM5CT+WtJziR7aGJ5jWd/cevbJmEcJokDgFfAEw2XhiO?=
 =?us-ascii?Q?3PbTeGlY4XeFh5L5l+cZhVE7W0QCKHPmS6QzE4QBS/bSpwSbDOPRmo1Hbp1y?=
 =?us-ascii?Q?PrUuaT86hscqLnLHVGq9UWdOJ+6/5siL8ZsqeU6bk73u6wHkyowfY98SqBoq?=
 =?us-ascii?Q?my5MapGOvnwSStr/LvLswLuWW1FdFeyOMbu6ITaxVAk5vLt+bAD5d4oap/Q5?=
 =?us-ascii?Q?aE0ogEBBFkx0LKVyDtjgLCFMd0JjMGq7V92peMAIcDEYAb5obwba8XERuNnu?=
 =?us-ascii?Q?Dct1MuJrri6kw+7odWkRG2x67iTAJLntr2p4AeHIkVl7qMGF6UFoOUIHQ0pJ?=
 =?us-ascii?Q?t5DCdPrK24FnJersq1mYjxqYIhgrD2wu9WBYwKev5wvq8Mv8RIBjNvkYqp0/?=
 =?us-ascii?Q?i2owS+W52BjZYU68Tl6NppRzbnxXPZVw8lCQ/kGlLZ9a1FoI53FfnxW6W6jo?=
 =?us-ascii?Q?YPn7p08BjlllYaEcXae8dDwkDG9SCvTRjbycUGISLbMYg7KpqZOh+1FCF0gz?=
 =?us-ascii?Q?YlPJQr706G/51oVvIHV7MdfxRpRYpCejrH86VxYbM/hqmlIGuDCEKR28rqNw?=
 =?us-ascii?Q?06fPfaG/zieGigAuXK/X0YOjcpV14H1+W2CFKo0R8t3WwmS/fJn/LqW+05uY?=
 =?us-ascii?Q?50ZfL4oLEM5zP1eIdRoYdGN0PpTfkU0p8IeCFRgqVgD6X/nyYDHW7vh/PCl6?=
 =?us-ascii?Q?BxSIyc7NGdJyTgTT2ZRtvTQlvuXDMENqZltQjbpdWjNLR9uAEISJ8O4KOtLv?=
 =?us-ascii?Q?pltbrOnK2jqL68HJOGPTxjspWMT/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ljQfTJf8eMZ05bPeMwHIhNQCLiwuMd8SgiZ+2oE9JD5b1GIKq5v/UVY1p+Vd?=
 =?us-ascii?Q?89EfqQhYYzkmA60rSpXi9CmJhCeaPwX/o0O9iyapJ5R5xDo4l3SdBK4OBG/O?=
 =?us-ascii?Q?ipUu1d49IH/qmsujjYhoj5MQqPczvRwbyhFduGLwDAQ1Y0jkADNCd+yU18a8?=
 =?us-ascii?Q?nw8iILGBV+Wy6TiB32j5OEbUe9QkVBVt9R9wQk3zcJ/yW5UXpkHXl/XnE/TP?=
 =?us-ascii?Q?anTqK6S4VDUOdY+EyMRdmFrnEuf1/xNPqlhKGiDL8O5wSThq/zoqdRd2sOXB?=
 =?us-ascii?Q?MLQavWs1GN3R1rvrcRhC2k12PfEitFiG6H7ApkClZmQawEF+m/O7A406mh0b?=
 =?us-ascii?Q?uM6t3wkj7az8oI08EfBZS5GxmjXgF8l1c26IiHTo2kwmYzW7i0muI5QfskCw?=
 =?us-ascii?Q?fecOviPnDY6gOm1zn49VCthfzm/2TVh5PXLD5/683tyBg0ALqEaV+YyMbq/1?=
 =?us-ascii?Q?2A4qR8GOmhnqTATPng3mWvb1upAGmou9CVJTbYOa33HxDk5moI0sryvrnHGG?=
 =?us-ascii?Q?tE1sJ2tVQkiimTIuwey62+PS+5Jf7Ve20aHnT6chYegDD8mBhUtOqJiI6GBi?=
 =?us-ascii?Q?OhgIxkGAVDJCuR2PWO13gOKZuHcdrimJjiSqrtLimVuRl9nyvgkvoSKDHGGJ?=
 =?us-ascii?Q?ofTgUiCLMIbEwl+WxGc5Y6Qk/WGdrHl+oJmfE4TmxT+6CwXFasXAtUyJU8tz?=
 =?us-ascii?Q?l1vNOLPA3IB1lfiuZbUWYJXibO5eCtFVwJf2bhL0EJbZu0qUsF7P9oMB0imJ?=
 =?us-ascii?Q?Nn0rIOqNOhP/++Y65n8Dk/IdZItt7JkbRQzF74xCqYsO0R4AqV7+TtKqd3wN?=
 =?us-ascii?Q?TtdIWnEbwJFVDx7AIM7qHRbyr0v0W3G0A52D+5aEivzvFRH206M2C5L9VOcr?=
 =?us-ascii?Q?2h6iHJTCDdXOGp89ZKLvqcoq17v5uJ29szzCnayCQzDgwGeVEpQjiH57gJgh?=
 =?us-ascii?Q?PLWw0VTo9esBP/1OUV40M+0vJ0wKKyoluiQGgtIavvfWXWlk+PUfKWtQ2sPW?=
 =?us-ascii?Q?tUfWWA0ghFByLHZPH2taQYHbp5Jwb+wID+ja2nRU2teZ5dBvIlBQ6ax0Lgkg?=
 =?us-ascii?Q?H1dsPIWubtm5YHBrdgAUWXxtgs1j0f7PC0ilIv/hI+968XHf8D+lhD69GkDK?=
 =?us-ascii?Q?DAnpuGjGUGGuCIet8Fpz+716i/FvSDNo+hCVRmsNnaZCD4Sm02/toddLIW1+?=
 =?us-ascii?Q?rpQJhptmhG8W2rcizWFdsb/+i63sZvbA7Fe2L6xv20/BRcXl9wGxbeH+DTDs?=
 =?us-ascii?Q?3EBn36EZbFQuyOhbZN/v4KHdJHyYYiuq4c/nJ1SODIh55/SSRrHangbTI+ka?=
 =?us-ascii?Q?JdsD9gu17Yv53PGunrLMWccyMK2jbMZS0EcozgsofE5CyiRbU5UzT9ldXEn8?=
 =?us-ascii?Q?dkEQs7W8ew5mUxyW91IGnSTqtkxD6nfUvQlJNppoB3P5z9oDek2RGA/FjlOF?=
 =?us-ascii?Q?URfU4kI4QYUQIdsvMtUdOGA7LT5Sm7MIFpVMbkuoRWC1QgCTWCBneZfrHq8x?=
 =?us-ascii?Q?XF6nQN/nJQlt6AgH09fD43I9G1OOi8HXYPT917wwwE4mBGH/w21FQNAY9awH?=
 =?us-ascii?Q?R+C56Rh+5YpVwmqJjs0yBNMQxbC/rjn3JevcXOCH3Igj5zouHY20sT+MsCqd?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5709ab6d-8e65-4e7a-e95d-08dd7068185c
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 15:24:14.5719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XxlrTi7TTStC24SDFTSQUrdqKTv5ac5zLGR+2vF2UAduWHxt8mJF6gE9Z82tz/wgK/B7qlMCNwk16c41DO5Kag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5058
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

On Mon, Mar 31, 2025 at 07:53:36PM +0530, Raag Jadav wrote:
> Append PCIe Gen5 update limitations to xe_firmware document.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  Documentation/gpu/xe/xe_firmware.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/gpu/xe/xe_firmware.rst b/Documentation/gpu/xe/xe_firmware.rst
> index afcb561cd37d..0c3f93e920fe 100644
> --- a/Documentation/gpu/xe/xe_firmware.rst
> +++ b/Documentation/gpu/xe/xe_firmware.rst
> @@ -31,6 +31,12 @@ GuC Power Conservation (PC)
>  .. kernel-doc:: drivers/gpu/drm/xe/xe_guc_pc.c
>     :doc: GuC Power Conservation (PC)
>  
> +PCIe Gen5 Update Limitations
> +============================
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_debugfs.c
> +   :doc: PCIe Gen5 Update Limitations

I believe this should be squashed to the first patch.
But anyways,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +
>  Internal API
>  ============
>  
> -- 
> 2.34.1
> 
