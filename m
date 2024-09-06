Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F15DCE7B17
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 13:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0FC10EA64;
	Fri,  6 Sep 2024 13:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JeY5mI9V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645AF10EA64
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 13:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725630710; x=1757166710;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=R5/jRRPVglrZx2hq146aMwpVxz1DE51DV7ZNW2nxoA8=;
 b=JeY5mI9Vw7fSoR5QjFfgx+Ozjdqjs+4T5+Ju5KUN3q/qUZGwtCBAQERZ
 S3+9gPhtmC0FukmGX2FZFgtIUVUy+pphthFek0VbVsWnoKrnmih2uVQDL
 HRjz1Q/wz083zqSlD1iXAoNyrg1dqpFfm06LYwl2zy9mBSqqIWqsYUwtt
 nxbNDWq4kUcBJeT7n/mDS0vY4+h7hpnFHS5zopoaahGW18EJvJNusflLf
 xZguvhSwTm8ljbJQWSnwwvDdBMsKr6QsJnX0jUA9jRB4vq3W8b9rGYgea
 YAKDAmJfx7cEL73W2exOS4gKuVT64SkxHyWEcaFHXQ/P3rjG5t7ASebB5 g==;
X-CSE-ConnectionGUID: 6hgWISq2Q/Gm43R8pFf/1w==
X-CSE-MsgGUID: 13r+7z4vSBqEFeNG5esQbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24189236"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="24189236"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 06:51:49 -0700
X-CSE-ConnectionGUID: WQvcfFYRSQ2s7smGLjCTKQ==
X-CSE-MsgGUID: 5nwpPc1zQv2SrGEikegjxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="70754221"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 06:51:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 06:51:48 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 06:51:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 06:51:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 06:51:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4LIQ0MwCIscQJFftvLEmqf+SKEiU0wf1OCbqM7mtYNPwqvHCUFSl9HxOyzHdP6rjzZdkX+R6OWj1Q7v3zYULmxy/vi5ivX73sggUEP8LyNo6ZZON08r30lz6GOLWQlTBrW9I6CkoCLdjEDlzysXJrz6TrAMzEJP5ozewh/oMLSSDlUATSJWHuSHC+x5onmCZPS6HnRqI0jjJZQNTV9Y18tlQmhYR9g+oeoqgdwisLttxOUibqZzs3ahq7bV7NCVb/hZ02pUZqEss8Ox8xZFAZJnmvnxRRtfUcj5rtDpfeBWVHLlkqeCDBGtm4KbYZYqQXXT9o6xcieuLXOWrbQ54A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dw61Q2PWNq4rP/ern985SQsouv4EWeC6aw6y3lCNPnU=;
 b=lTyBgFs6pUcs8yadCmoV/EIWYMo4O+492LFfnf9aKV5vmIQeSTnvtRM1GPQ11r2GuQXp43sUImU+TN2PZpkG56fU0SgewGCQEr7lIFSOGx48K195YXfY/RNBOQ4G6gs097EI7a8Zy0ECU+gtqaNP+TxZ8i8t+qgl2J/ywecZbsxXh3p1ek/hSeVgqsJV6SzFkFmo9MQaLZoXV15tgubSJxZ4bH4IjUtXa3k84jPVMALBTca6X148Eibxeq8LMyM8sc8sqVR27qwt8qfrX322d2xXDil3SxE7GM7snM4MYJlrSWAKc2/qXOK9UAme+FA7U5dkzDBi+FJeb9Mal2+6Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7457.namprd11.prod.outlook.com (2603:10b6:8:140::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 13:51:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 13:51:45 +0000
Date: Fri, 6 Sep 2024 08:51:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: Nemesa Garg <nemesa.garg@intel.com>, <intel-xe@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/i915/display: Workaround for odd panning for planar
 yuv
Message-ID: <ybknt6v4oc6fyn35kvgpb6rtr7tamw5jn6gae5oxluo63x7rfw@und53xxy5n4y>
References: <20240906070133.3843174-1-nemesa.garg@intel.com>
 <87frqdnp09.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87frqdnp09.fsf@intel.com>
X-ClientProxiedBy: MW4P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: dc914e4a-bad8-4025-12b8-08dcce7b0b7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jHj3dpHCKCkqljc6G/mGpk58r+N8DrhZNCncjgHK9EbLkJIFGjypNLJg3Jk6?=
 =?us-ascii?Q?xoL1X98hrlPO24mCDunznRsEVL/lOSga4jD+zLuvDtH2qtQazbyghInpRH6Y?=
 =?us-ascii?Q?gwFrcAYg51v1/7b5gAvRFC3rswrdzeYOTF1xsIBCglpJyxiMqKvKMy/hVNe+?=
 =?us-ascii?Q?Qfv8GqU/pzd5b+1vh9bo5Glc/UBQABsJ5rd3RsHk2CLStRpYaFYHfsIBBnZB?=
 =?us-ascii?Q?kpeRwwUEUlZVMaGUxIinqbJC260RlFy+zaz+RcsDAtPkhE0SIEzwEuYsK0Yo?=
 =?us-ascii?Q?LBKBLJvUt7hYl5NzaIJ8Rlfx2gN2hB57krpCMBxeZzzWWgv13VcLoYrRvaVq?=
 =?us-ascii?Q?f7kkanUV+6xpNkikT2pgU8E+0cYB1QDSvBBUZcvmBQ25kS/5wvXpeoPsJGaQ?=
 =?us-ascii?Q?cu401HX7SeK/sCQTIeRvslrgz/3T8ZINz9dDXTz/Nk5ggYyPvNhRVEA3gf2/?=
 =?us-ascii?Q?IY/2bJcQfo6yxO+6uraAqsl8cZypPN158UU37FcWmzyzHL+l3/rkBhSu5N6o?=
 =?us-ascii?Q?3+Mhd5witwiIQEelFyahJnPUZXwRP03IBwW71gk7s3+LzLb/Tgeg6GOevibH?=
 =?us-ascii?Q?hI+LoJMbF47f1UbL8tRq6M09M8Gbm3VzvlfI7OuiJoefnrnxp9KB+JUEbOOF?=
 =?us-ascii?Q?U/dce9jMk5LsbK32sNd4CpzOUBVkPvpgoAbCG7iwOwlewRfxwlMi1/r4vBpR?=
 =?us-ascii?Q?71KUVrlq1HEJxFSoykjesMtcvR5FkYMyFGCRC9v6Z3kEkPCc/5e9ppvM7ulU?=
 =?us-ascii?Q?u2ur8RA6U9llgIbAeD4Z40R1S80Y7o+Grym9PkNM9ibw3IHr5pB5N4VdL5v5?=
 =?us-ascii?Q?biIHuQdw7LyVRG7LdcXnwSlwY8GRt6E0QmkiBZVCk4jw70YRHY80qei6iO8W?=
 =?us-ascii?Q?9jrb83DXTVXKNMK8P3rGUIRjKKtDRFz1jN5rtTPlXHcwgKp2iS7fVNBb1J+h?=
 =?us-ascii?Q?pJBpNV1UdAxTlFRSaDcuxIE6Nexo9/C/w8clntJFlcKGPEkqj00Uiw5fF/39?=
 =?us-ascii?Q?QNaWtuLajXFq9DOik3DDyGZfLvz9f/ykpE70Q1NXxUu3PxToFCT7Zp9dQm/y?=
 =?us-ascii?Q?gwGppPgpRLBhUYHYVe6OzxFdxkD3ZwQ+rfR5etocrNZRjbXStTAjGeOOmids?=
 =?us-ascii?Q?0XiUhQZz1P10hOFiccsPZRmcgTndCwneE75dD8dThh12XMHv7WbKfDW5OoHH?=
 =?us-ascii?Q?sE4D5OyQ6gvdWJ3M1LbC/gFaSWYRZZixoaZvZPUw8QPNaaA285f7ARKsY89K?=
 =?us-ascii?Q?R3lLMbAa+jae8LJMneU/d6+70KONQVM4iWTWpbolBRI2UwZPA4WFhYeo+pxi?=
 =?us-ascii?Q?tiG5X8u0B1g4sSwUhOcEIR9sFMv2e6ZSNsvpBEFJgdWErw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+u7kZPVLEOVemqy4aGTw595pixIIAIjVKtM4BAA6U2MFjeqrK5wfE7ps+RN2?=
 =?us-ascii?Q?4AZj/AvE6abfOZJG9SjlGuV28l9cNSQAKNjjKRSBx28sH4DfKRjUc6dEn9Ur?=
 =?us-ascii?Q?81ogw7ibb63PVZDSHBnFiH4PDmon8Pwm9fIWlbXMdXYuJiRCznaAJ8BzPCUD?=
 =?us-ascii?Q?W0odyrSCS1JiZh7HkcfI78pTsSmfMd/qUpODunrvHhN3arLZHIcsZW6JFCuq?=
 =?us-ascii?Q?RIdfe+qu/DQhUHYtVApiwBZQqKHeCOet50/ibpd1oyYhQiZabkKPTR8F5rgg?=
 =?us-ascii?Q?FvFasHv/OjIPZSSY8xIndv9dwYsg17+La0VPHxXqX9UTSx8Y4bie9sC0DuZD?=
 =?us-ascii?Q?W9+e746QUT9MkrynsW57wRmVJ8wRJCLvN7HO5pzgv3ENHAdkTS404GFGBFms?=
 =?us-ascii?Q?VkNSQqg2Rbfb9FduG0jt4aaw+vlewwTH1UQ6mYWjhlPDFEVR9KR7Rnqjedl4?=
 =?us-ascii?Q?22Yso2yY3Sim5eq51vSX2h9nZqKuD4YK0BSShFp7Y6/Hr7ymQhr/zmrd8psx?=
 =?us-ascii?Q?GrOQbh7Ne9gIxsnUjShlpLWdvjfl53dwOx980v9OgvrAG3Y89DdV4aJEegSI?=
 =?us-ascii?Q?FxXeGsX8swXfcGtDPhn9e1dQZxOWqPmeOU6nFKPHFXvreYGp8EIzHctaPzJL?=
 =?us-ascii?Q?TAq81bmyC453BvhI/BXv3yTBoFDe+3jEgmtxTmEXMMMtqgRVShp5le3HAgeZ?=
 =?us-ascii?Q?s5xaHBoHH9eOXfvWh9WG9BGR5CeEMPNtCouv85mCrcD1weG6jc/kDAA0dmff?=
 =?us-ascii?Q?w7EqUmEhChdldDHc55TzqH+823Dlxx/nTqPs6aq1uDcULDQlqptbGZSBXe2N?=
 =?us-ascii?Q?zHBK2AXL+O6GTeUOWr3M0bExaJ2oeixAQUQ5AGYx1eljrYnD13gdbVo+UCm8?=
 =?us-ascii?Q?slXxQnX5sSGrETjiDMGrfsYlw97K1OCgjukSZrbaKF6JPfgS3NgYhR3CDZ7t?=
 =?us-ascii?Q?pw4+aYHuhbyNI08GS+vgqsD+PK/NPYkL3kZyQc7OIOqjxa0nYSRq+9AZOWEl?=
 =?us-ascii?Q?iRwl367x/TZu7T6DsijY34PK3g9qeQFF4yJuOnfpAT1J3kujh29tCpYKEfG5?=
 =?us-ascii?Q?sDKcWaxbnhkC6eg8wf9EDz4y1kMWSxmKPRFqbCfkO35NPbqhQl5ACzA1SKTx?=
 =?us-ascii?Q?rTEFv/uXupcOv3ZC2/o8dlmgI2Z/WnND4XSAIFARJywZn1GrsdzdMAr78/Uw?=
 =?us-ascii?Q?J6keU8QVIv3VrIlQVQLvZ6bIvJD+xP6KBtG5Lmt3z4dOVZLHWlao+J4UD/nU?=
 =?us-ascii?Q?DO4xcJY8yUauuElqiAMn5I1MJt5Su85eZV2IK8oWVou3aMRT9ZYOO/tg0w9A?=
 =?us-ascii?Q?ZfLDxBJjgFvulLE0s/eSYaKf+CN0HW2wD0KEma1YMrQExkR0quuTh55Bv3MJ?=
 =?us-ascii?Q?yiG4Z8nd3zKUKssGtNWRahoDcGyxgGi6I08m1c6xYdWJxZ9IveQ6IOVfkVJh?=
 =?us-ascii?Q?zcucl11S8s79GAeYO3B9/nFhb4psD1RY0RaygWH127UOVVmIIS3aIuRDEZtn?=
 =?us-ascii?Q?7hXMPs2/HKmNhBG0ot/2ejt3/a5ReCXigUpa6ZIY7sflNGR9NyUrjF7jHW6O?=
 =?us-ascii?Q?3IHFHr1Lrfr7Yf/GF0l5Ogc2MzFLm0Nzcw5V69fS8hCzCVMvCqaVzpBQOMiw?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc914e4a-bad8-4025-12b8-08dcce7b0b7a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 13:51:44.9758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rABYYg64a9iMnu3B55SuW3bh88S3nsV7P23aqAU0n1ASI1P7QEnRRrq0vMiw/JW2PiD1+wM6U1IcBmQVdZDePxTzCgGI9fNRAcQ2g7cD6jM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7457
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

On Fri, Sep 06, 2024 at 11:51:50AM GMT, Jani Nikula wrote:
>
>Cc: Rodrigo and Lucas, note for you at the end.
>
>On Fri, 06 Sep 2024, Nemesa Garg <nemesa.garg@intel.com> wrote:
>> Disable the support for odd x pan for NV12 format as underrun
>> issue is seen.
>>
>> WA: 16024459452
>>
>> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
>> ---
>>  .../gpu/drm/i915/display/intel_atomic_plane.c    | 16 ++++++++++++++--
>>  drivers/gpu/drm/i915/display/intel_display_wa.h  |  2 ++
>>  drivers/gpu/drm/xe/display/xe_display_wa.c       |  5 +++++
>>  3 files changed, 21 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>> index e979786aa5cf..9b17321f3477 100644
>> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>> @@ -47,11 +47,13 @@
>>  #include "intel_display_rps.h"
>>  #include "intel_display_trace.h"
>>  #include "intel_display_types.h"
>> +#include "intel_display_wa.h"
>>  #include "intel_fb.h"
>>  #include "intel_fb_pin.h"
>>  #include "skl_scaler.h"
>>  #include "skl_watermark.h"
>>
>> +
>
>Superfluous newline.
>
>>  static void intel_plane_state_reset(struct intel_plane_state *plane_state,
>>  				    struct intel_plane *plane)
>>  {
>> @@ -1029,8 +1031,18 @@ int intel_plane_check_src_coordinates(struct intel_plane_state *plane_state)
>>  		 * This allows NV12 and P0xx formats to have odd size and/or odd
>>  		 * source coordinates on DISPLAY_VER(i915) >= 20
>>  		 */
>> -		hsub = 1;
>> -		vsub = 1;
>> +
>> +		/*
>> +		 * Wa_16023981245 for display version 20.
>> +		 * Do not support odd x-panning for NV12.
>> +		 */
>> +		if (intel_display_needs_wa_16023981245(i915) &&
>> +		    fb->format->format == DRM_FORMAT_NV12) {
>> +			vsub = 1;
>> +		} else {
>> +			hsub = 1;
>> +			vsub = 1;
>> +		}
>
>Nitpick, the whole thing could be simplified to only touch hsub since
>the w/a is about x-panning and vsub is the same in both branches.
>
>>  	} else {
>>  		hsub = fb->format->hsub;
>>  		vsub = fb->format->vsub;
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
>> index be644ab6ae00..9be35a751503 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_wa.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
>> @@ -14,8 +14,10 @@ void intel_display_wa_apply(struct drm_i915_private *i915);
>>
>>  #ifdef I915
>>  static inline bool intel_display_needs_wa_16023588340(struct drm_i915_private *i915) { return false; }
>> +static inline bool intel_display_needs_wa_16023981245(struct drm_i915_private *i915) { return false; }
>>  #else
>>  bool intel_display_needs_wa_16023588340(struct drm_i915_private *i915);
>> +bool intel_display_needs_wa_16023981245(struct drm_i915_private *i915);
>>  #endif
>>
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/display/xe_display_wa.c b/drivers/gpu/drm/xe/display/xe_display_wa.c
>> index 68e3d1959ad6..fde4e09589a3 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display_wa.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display_wa.c
>> @@ -14,3 +14,8 @@ bool intel_display_needs_wa_16023588340(struct drm_i915_private *i915)
>>  {
>>  	return XE_WA(xe_root_mmio_gt(i915), 16023588340);
>>  }
>> +
>> +bool intel_display_needs_wa_16023981245(struct drm_i915_private *i915)
>> +{
>> +	return XE_WA(xe_root_mmio_gt(i915), 22019338487_display);
>
>16023981245 vs 22019338487 and not explained in the commit message?!?
>
>Rodrigo, Lucas, I think we're going to need to handle display
>workarounds separately in i915 display. I'm fine with merging this now,
>it's not a big deal, but this interface is not future compatible.
>
>The first step could be simply converting these two to the old style
>workarounds in i915 display, i.e. just checking for display version or
>platform directly, and later adding wa infrastructure similar to what xe
>has, but for display only.

Do you expect any WA like this to be enabled for both xe and i915? There
are no platform with i915 and display_ver == 20.  I think for past
platforms, just following the display version and platform check is fine.
For newer ones, where there's only support in xe, we use the xe way.

Lucas De Marchi

>
>BR,
>Jani.
>
>
>
>> +}
>
>
>
>
>
>-- 
>Jani Nikula, Intel
