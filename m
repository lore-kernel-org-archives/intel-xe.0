Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71595CF6D2C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Oct 2024 14:51:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C0010E753;
	Wed,  2 Oct 2024 14:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sd3zJsen";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A2210E753
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Oct 2024 14:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727880695; x=1759416695;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ncX01M2g0YDGyHXrEu9MsJrM65Cem1sARcW/UYYmslE=;
 b=Sd3zJsenPZ1ReM6Cd0L2zYPQ/YHIbXyp8gF0w3Hsp7PcxIgSLmeTZxwt
 aQk80YrHFYnOvDGmIgLt8UJykF5yZ9+2m8revjohQUKjyRhm0zI3lHrvf
 fVR6ASWySMYhS/7HmReyA9mVdMIHpOozhXzUF2qt58eG1o36Cc2/Nfd+D
 F5ulG+/G0DIwLOg0b7+A/P14/332mKubApp4s3D8bF0HPvKee5SSnjxsH
 SxducGDwfuWz6Q6A5j89OevA0/AkaKQAbLw/rEx3ROIs+TXDDF3OP+68t
 RP6w5w16u5GED1HnKAyhiOaR9wttGGvoDTMYPFo5w0OWmYmRr487QO+zp Q==;
X-CSE-ConnectionGUID: mQr+8c26Sq6AKAeGm70g9A==
X-CSE-MsgGUID: b22QQ/8VTGWmvO9qyUaAzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="38181660"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="38181660"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 07:51:35 -0700
X-CSE-ConnectionGUID: CQxIoLE5Rf67kUvp0cLt9w==
X-CSE-MsgGUID: kXBxsFbJTEOrCX5kLsPcMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="78885656"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2024 07:51:35 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 07:51:34 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 07:51:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 2 Oct 2024 07:51:33 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Oct 2024 07:51:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQXXzhvKniszZK5myddQn/KIA+b1WfGboa3YgXHEqG9sEh+xietx6hINKS4Ym4yA352gMZ+4fD//5bBTESY2IkXLMoVhFAN9GIjb7S0R+mzskS5v9bWzPiYmN9eCBbAsPuVRM6g7kFck85hRKZffLJ8BEOl3/UaDfEtqJRZmd7ZpTfWXVidS1zgcVxbTScYPrZcKkgY3GAo+96CWCuX8n4kIIwv3OPYLLB+GyR9opN+FDVtcs2NEHp0ElJMhCW4OwoGt3nxB8pq1HaP0FJ2/eSMjro9asu5Uxf+y5OijhCg9LpN2X2BNK+GnyuBZC8+P6Y4qjKjImheAS/dLoaNhGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAge5hgChLyxTL/LTRueTVrf3Q9F1xHHbrNV+dT/jT8=;
 b=pdLACXTfQaV3Ue9POakxD2PdIyPwhI47+NIEr1K2GvGXu6SyAfbSoYo/fcDkmxqWQYgOvSnwU4NG+h6f5MMcolnrprB40YyuMWfpxkILEw0sXXSJbiwdFEE8WX3CXQwGeSV8xKV6lmGnMkB2Wt5/9xH0FCR+G+zrwX5F6zxLAcP2yPqjO4Ku0SQ10RYgSHYmPr4FpCVmaR92A+TKuoZ5kkJ4AW33yDSdkaf1O5Ex4PUjmBWk55p/a+XAzqw2iEEWrEaFP1Dzj6GmoTCF3xyB0hgvglnvSCwrplFPHWkF34rnkXKgHz5wkEFoNvqFKK55RmLM3Gws/vpLmm6bV2Gq3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6149.namprd11.prod.outlook.com (2603:10b6:8:9e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Wed, 2 Oct
 2024 14:51:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8005.026; Wed, 2 Oct 2024
 14:51:30 +0000
Date: Wed, 2 Oct 2024 09:51:27 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>, Bommu Krishnaiah
 <krishnaiah.bommu@intel.com>, Riana Tauro <riana.tauro@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/pmu: Enable PMU interface
Message-ID: <evpslh7bbf42tsuozkkv6iiwnvmltn54iz57c44saxexncen2l@grohfny762hd>
References: <20240927002344.2565250-1-vinay.belgaumkar@intel.com>
 <20240927002344.2565250-2-vinay.belgaumkar@intel.com>
 <suyim7ey3uldherzlnfm37uaqdcrekmub2w3nff34q45ju7g2z@dxhshdswhsj3>
 <ca2fd5ca-168e-48e5-97e0-0a0830b2e404@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca2fd5ca-168e-48e5-97e0-0a0830b2e404@intel.com>
X-ClientProxiedBy: MW4PR03CA0243.namprd03.prod.outlook.com
 (2603:10b6:303:b4::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6149:EE_
X-MS-Office365-Filtering-Correlation-Id: 47781569-d6db-426e-0696-08dce2f1b34f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?C2Nuiu0r5b+JUyRykCR8hla2mTa7Jw/iw2IJSgUN/fJJ9OK7illj2sMNJT?=
 =?iso-8859-1?Q?8JnG0gVukzBnnnu0eMtbY56Ey/aLZESb5FQY3yqotBcxG05sF1Pe4R0w77?=
 =?iso-8859-1?Q?1C6hHBsWGmEAi1KqfcL+6HueUqaVb+NVlClDPxfjm6Xf1zH6W2yugXZTi3?=
 =?iso-8859-1?Q?Tkq0pFaiH6RLYEb4Fntbn6c0x2z1PvjJuzt9bmLZKa33V4FBBVC5G5LE7u?=
 =?iso-8859-1?Q?tJ4L56QV6vXqqyYVViJ3DV6QGfOvyr0N7OuTQyU5N7/Vewpls7NrpFf0pF?=
 =?iso-8859-1?Q?ZHke3jw3Y6K1vNaRqZC19pTEAsL+fXHb74iduDYqbuiUbRnFOHhvVLidD7?=
 =?iso-8859-1?Q?SiP/3V5SeFh5ztHnssHXQ4/WJaK/dDt9xRdNKR/8wZNA1j5N++8bWlJmiQ?=
 =?iso-8859-1?Q?BuuQC5MgjW/fjnEmoEeT9+KyeMZC25u7oYgFyvG+RDWSY+f8kX1Ku/ro0E?=
 =?iso-8859-1?Q?Wih7IL+XQZrnUh/k0gTI5weu6rBPOSboDlCSNTmtkqhwj0iivKCPKKYBdP?=
 =?iso-8859-1?Q?YVcx2rXfglpAVZoAHxeInoFwLhwYI2rdtTsGVi2DMB+od7SlLd1E7DJQA+?=
 =?iso-8859-1?Q?l3Ap7Qg7Hp/RK0+Pa60wM6M4d7LjACZXsoLzvLU+MwpPg4r1MubZRnXYS0?=
 =?iso-8859-1?Q?wR6McvQiF4nhha8VVl0YGt1YbiE5YZkUY5blJ2N5nahaz53zLzHsns2z1B?=
 =?iso-8859-1?Q?ct0wtFRKP29g8nDQC/ZFYlgs28rwV7c5rmg7yCoYyhTzgDP5uEciBqEkoq?=
 =?iso-8859-1?Q?5ZitN+S4Z2I7wgGI4wiLBJB8OWxyha26YXFKFb7n8ozIfpfsu7yz7w9bOn?=
 =?iso-8859-1?Q?GNs3otkk8XBUiwss/nUL1VdcAkNysBOhTan/ikOgDDWAiXkua8Zn7KZhzD?=
 =?iso-8859-1?Q?iwdJvmNEmxSB9v2W2y9tbkPOwYFOsVFZTXHHfleiMdaMEmndAZo/8jK8gz?=
 =?iso-8859-1?Q?24wVSL+MqYMsNf9LKfBbsCeAw5gEalUSpJ1fMD2lmXbczSR293Id54cEBY?=
 =?iso-8859-1?Q?BzWV5T22ABiRqSKBn+heoNEU5Kb26tSbojjikg+x2IopNBIdMSZyl5X7wQ?=
 =?iso-8859-1?Q?csv7SAh5twkWTe8B2ITgZ9UHTMI+SdVqeXQCZMlJjOiSz9hxyZaCABd06t?=
 =?iso-8859-1?Q?szuplPcKy3zLuhc3s4mhLPswJqCpjG3rHGk7NPqcGL9zc7KodaAm3B9Efa?=
 =?iso-8859-1?Q?I2H1EHjqvM9bLHfuc46rBKtBOQHbhm6ozp43CG9PsO5MTPOAUJb/OqpmDD?=
 =?iso-8859-1?Q?1ja808JrCylylzy0Mb75bpYB+UuwEqWpjgw6TYq3x7PEP5zJzJ4bMSrPK1?=
 =?iso-8859-1?Q?KozB+NLz3pN+8acmn/TNDuRP3A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ETXz8f1aXs11PtwknF+DFO25k4UrnOJ5WtgcVNgUS0wl0aC1YoXSvo7VEW?=
 =?iso-8859-1?Q?URKuyXovlKhtvUZhfAh03gaWEIW16oL35vr1tgEawwknnNxZKnEGob8e6z?=
 =?iso-8859-1?Q?9z0k/KZRHISfs1hS/tBKW43k0v6qfKlUMksx/IL2kkM+8/NDXfauI0aXRu?=
 =?iso-8859-1?Q?2giJuTjtjnfNM+sZqoc4kNsPPHUsBe0OsjXRJzYnLxnOMq6ncJdBGEVi5m?=
 =?iso-8859-1?Q?vinqpsSvcFqfZLZnILyGkxFy8Is2Mcu+E6HJfBsjpmhp6hbM4dzE4UOheF?=
 =?iso-8859-1?Q?T6YGljBjNi1v2X9c9d1L2mP/3W5kZOLAlreE2YPsgENvB8HmGv1Fx/2gYQ?=
 =?iso-8859-1?Q?R9am0wSPy8dI3oE2ueLTtvgMcUtj5as0bEJab1ai/+KxxN9nOpak/PhTEt?=
 =?iso-8859-1?Q?uDiTVyp0YrqeQFIlxsRHokU8VQ6tAdrsxEo1eKihhIO6S94q7ybaKlQ7+c?=
 =?iso-8859-1?Q?pHOWfBrOvBMccJzdtzWF3fNlShZnEilfd7KFTUx/8qCHDL6HG+/vZU3PHH?=
 =?iso-8859-1?Q?hpFhgggGVdAmmVxjLi/9mGoNnT3NPs+sQ83Nvvu7ezDreAr8vqSuXZgxwZ?=
 =?iso-8859-1?Q?SyVAaUVOCtRqqSb4qqMYOwIl4L9ykRCCN7TpUIljqcU7Uo6n20ds8s17A9?=
 =?iso-8859-1?Q?U6AR0Yvr42xE6gL9tT2XFqSx1ELvQ1HPm60ChV3v0PH2qO7qSoNreH5taa?=
 =?iso-8859-1?Q?v+a7y2RCI5Z2kGbbksSNRz/sN1wuxwyRRc0ytaagLivR9CRQDB+yP1gdKz?=
 =?iso-8859-1?Q?ni8h7B7ivB5UD6ViXh81CnrJ+Xc5SjsjHME7VKkUctYnuc5GsAwiSMQsiE?=
 =?iso-8859-1?Q?1cEz7/RMADXzlE1tnJRgCyujaNmlVlSojLRh7NoU1hanc+39FRq0tMqVOy?=
 =?iso-8859-1?Q?OdEhBFYi0iJuUiqYJW9cVEJJC+XnOXidNBEEFbleDmuyW1xfzaLmAgMDhw?=
 =?iso-8859-1?Q?wBP68VYI6A/O68J+lDB4wsmixSJZhHTP85EjFJpLUaNLLPgScnV730sDED?=
 =?iso-8859-1?Q?188fjl+cOExRfIugLgpNAAGJIxouHp6alE2ad9I62oL7NxRQzCofMMNBnF?=
 =?iso-8859-1?Q?cHLWneph+sJbZScf+KvloWQZ137+ZY9s+yS2lYMHi1n1kL+W5obk6kjQnf?=
 =?iso-8859-1?Q?b0k3ifX9rrRmdhIiQdKxcq9t8f0sQ3lkv1goFpEnkJn4g00pDA7xpTQQTA?=
 =?iso-8859-1?Q?AgRP6JPuLikNDPe+Kb7P5bUk5/iP/qXWMqe6JdopMBbq2tUV1uUM4nTOJz?=
 =?iso-8859-1?Q?vcxbDlpwyTBM7B1f/e0eV6y+AwdyQSaI4kXpR+TCtrSvW7AjT2YBXt82yY?=
 =?iso-8859-1?Q?G6z+lHPPRQNdF2u3ay5Mzt8Y+FN61JMrZn9cmyAIxmq7B9sMpGdBtrMNIx?=
 =?iso-8859-1?Q?NJt8U/zhcLCR9tbIQhkNrpjmHWv7OFjaNBYM6B42YAL1wYgbBEWO+OLgy+?=
 =?iso-8859-1?Q?BnFB2clzRIWk7Ksvi6A2ZNr9w7Grbkip0i8XDRlk18nET1oyXZJh3kUSX1?=
 =?iso-8859-1?Q?mQpVH8QS4OjD80c5qpej3TuhAmOyoxk/NP1QNeYgq0+hiLQ4TQeFB4IBPn?=
 =?iso-8859-1?Q?jBww5LJqEyArNeN5/uCDFaz6oxHvoEv+f7JISRVxmmBEDEQHgRiVxOqcLt?=
 =?iso-8859-1?Q?MTFZjibNMikdvpPFUPYLjhT/4b4UfV5vavlFgVVdw8QHsxcFHD+j0VCg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47781569-d6db-426e-0696-08dce2f1b34f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 14:51:30.4969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UaspjvhYI2ff3Ul60W1B3nUljVM4myaerNT7T31SHwX94pOdbOHf+Yka7/7Ca8m/GoLNBjdaE0Q9xkoqAAR9YXFNjkisiyFU2hm40rZwFqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6149
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

On Tue, Oct 01, 2024 at 03:08:03PM GMT, Belgaumkar, Vinay wrote:
>
>On 10/1/2024 2:32 PM, Lucas De Marchi wrote:
>>On Thu, Sep 26, 2024 at 05:23:42PM GMT, Vinay Belgaumkar wrote:
>>>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>index b6fbe4988f2e..2c5f258eee3a 100644
>>>--- a/include/uapi/drm/xe_drm.h
>>>+++ b/include/uapi/drm/xe_drm.h
>>>@@ -1389,6 +1389,14 @@ struct drm_xe_wait_user_fence {
>>>    __u64 reserved[2];
>>>};
>>>
>>>+/*
>>>+ * Top bits of every counter are GT id.
>>>+ */
>>>+#define __XE_PMU_GT_SHIFT (56)
>>>+
>>>+#define ___XE_PMU_OTHER(gt, x) \
>>>+    (((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>>>+
>>
>>why are you touching this?
>>
>>I thought we agreed it's not needed at all on previous version of this
>>patch: https://lore.kernel.org/intel-xe/602bffcd-d66f-4b49-b3b4-abb934b00f3a@intel.com/
>>
>>what changed?
>
>IGT tests like perf_pmu use this interface to open specific PMU files, 
>for example-
>
>                fd[pmus] = perf_i915_open_group(gem_fd,
>__I915_PMU_RC6_RESIDENCY(gt_),
>                                                fd[0]);
>If we define these inside non-header files, these kinds of tests and 
>any other user programs that may be doing this, will need to look at 
>kernel code to determine the PMU config? I assumed we needed these 
>bare minimum header definitions.

no, they should look in sysfs and that should be sufficient. This is how
the `perf` tool works and you shouldn't need to change userspace tools
to support additional events


Lucas De Marchi

>
>Thanks,
>
>Vinay.
>
>>
>>
>>Lucas De Marchi
