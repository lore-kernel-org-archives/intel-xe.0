Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BA3CE7AA5
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 01:48:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7899A10E874;
	Fri,  6 Sep 2024 01:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SORsqK+O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A484B10E83B
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 01:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725587282; x=1757123282;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=abmc/vmqiAiLDg5YNRW82wf3MthkzWcFAgFgG/mw1yM=;
 b=SORsqK+O88WySFl2UOX/dwXNzPkm+UNXlER58pxJ8f//uW2w7zdv1zqe
 WWG24IO9l25neCeVU8TfQfn4umvc52o3aSrLpVaLlF3Pk1m7vkGWS8iqm
 HTihriWX7Q6l6jpQL20qrtEpbF09EVEaVXSXB6yB/T5IBBBPa54ejq5ty
 74DvLzzI2gVaJc4n4T2tDvMSQrd7Gl+WjggaXfW+1LiT5lDKQ8ZgoI1b2
 YeCDq352FA0VPWQmsT7AewAJ2ngIk/Nazp4IH4fPHrv9I1hO1dfFPd32y
 O1ohIo5M7+Sm60rkdHIr+c4fM9fikCMaInF53Ls+trsSnTr0II2GE+1MJ w==;
X-CSE-ConnectionGUID: xBPsCJC3SQm/cS4a94MTSg==
X-CSE-MsgGUID: qgjyCFuFSU+ooRGi5CqX2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="35484668"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="35484668"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 18:48:02 -0700
X-CSE-ConnectionGUID: P2FrblnIR5O8Em/YVo/TFg==
X-CSE-MsgGUID: wz6kUavcRoqYpms9j/UqzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="65808642"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 18:48:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 18:48:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 18:48:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 18:48:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smSC8RMecSGAYZTpHDdBZ/ybfHeDSniajsqA8tneWwSl3UM65dcCvzysx3M1cuhz8WRszX/pRChpWkBiKnA/KbAxmkxOW/HsihE8cJntRCd1dtEJsAype0Mgotgur24VrkSPgDswt8DTboC7cQKnXP03f+dq4wblaeKGo+FfZmqXDKLYcBOkUdvGPSp1yuLelyAUuTMCtLERW2fioxOICXMARNbT81JNuBU1n8GMiKiU4s8VF6Ax7ms32PEJag+KtT+FOvn1HDCjzl6q/6cfvIR9GZMQTXxf0tzpe0sF1L173M+16aVbpTD9ax+KLRM6FxjpIbAoBvj+w+rxzUjdkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abmc/vmqiAiLDg5YNRW82wf3MthkzWcFAgFgG/mw1yM=;
 b=fS0a73VgeZhGSUOwzA+jpY5vn+SZxgX4psTklonYmITFC7QVpALbAum5mbQqG+MKweTISPiwW0IHAANv/5+eSbC07K1/r9xY3yJK7+DTXs6cWuBAt3ds4Z5fE3fTlZPTOM5cjn3AmieIZFmKOSGqb520iBypytKj9yUygz0NswbyvoJgby/0AuGSVj441Ms4eBbqbsH32cM6PfdTVVnPO7XKcuI0wwEwxyzx95uOJ5cHC4XoX2p+Tj23Ko39MMYrtaVpw5Ks+7zJ+99O2wfkkpnYTpMM6zGiYIB1A5nXTiqlP7SMNqntlOgDw4PD37fAFVV6SDGr1WeW6wkDaiFkXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 01:47:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 01:47:58 +0000
Date: Thu, 5 Sep 2024 20:47:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 06/43] drm/xe: Switch mmio_ext to use 'struct xe_mmio'
Message-ID: <l7vqcvsqn4qujbzo6sz3qtpdzgkcl773sils4mehtavp76mc6r@cmyj5q6c2fzt>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
 <20240904002100.2023834-51-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240904002100.2023834-51-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0281.namprd03.prod.outlook.com
 (2603:10b6:303:b5::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4806:EE_
X-MS-Office365-Filtering-Correlation-Id: 44db0e5b-e5ac-4196-4c13-08dcce15ef2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U4z2+cA17fhQrocpDnNsMxV4rhIHtk2q9zs3MUHcOevt1ivNm/jd299TEHMp?=
 =?us-ascii?Q?82a76BaPaZ6bJHFsAj/Pufh3YEeuyBO0GspvE/yAqAcilgblT52z8k5YgeKJ?=
 =?us-ascii?Q?+ZUuFk29p3Uj2wrenHVQjSn1baVTORZ3Mww+Edzw/xXdc3Jng4gWdrUnVkpE?=
 =?us-ascii?Q?jd8Bdeqp70HsvXoe9Egk+Wt/pBbQ1QlnPzGz8wl2MWnHdeC+tI4fbeXyAosJ?=
 =?us-ascii?Q?NlCZShb/wVamrCcyuKdPo/ase7KrRziDjt0VkIRADeNm5SXxZLvVnvfixxpd?=
 =?us-ascii?Q?GvEIF0Q1gK9Z5VgEQYcDA5OoXW7TLaXJRdC5zAl3X4+ANHytzata1vRXw/aL?=
 =?us-ascii?Q?/O66qkpgrWhamSe/0uf5RL3oqMG+ekpgLStYFVYgapF3TspgMbU69Rb255H+?=
 =?us-ascii?Q?sJIF7/+/1ibzHzFcvHLT75tGUbk5ITn/7I+yI7v+ADssXJt4h4jusO87QcuD?=
 =?us-ascii?Q?5GGVh+NTU6/AxuVraxKMn7h9OsIiQ+49eZ7vv/PipDPvjBFuRkRk5KwAzAjR?=
 =?us-ascii?Q?izANN2m0mJJ1crdqHZ6eLYgzdYQi93ZYDmJdwWLz/ZrCBexIum/wV5uALLH9?=
 =?us-ascii?Q?jwPx/8hgV5zUL4qaVxXjqQlx4jbRjWQ+GcbZsxbqhnV8BDOM8kPpUueOOFC5?=
 =?us-ascii?Q?7Stqjgdai7N074EU9HnMbb8KTvlDXM/bTGAIzpFkAoQ2rKR+u5Kcae/UHbwr?=
 =?us-ascii?Q?ntJeo56vktpmBOE7jB7TS8FYc8XD6CtbG1NyCt8kg3y+j6FC2RDoMu6OWByl?=
 =?us-ascii?Q?rS/MZkrH4FzFKe4idTiT70LRBvcBkv/qQpoDejliJD3pJ/pq2M3xlVHA3M7u?=
 =?us-ascii?Q?k0MLuCv2cZbCksCSQQEPuWIcQZO/b9VKdlBx/5rq+suAQQW0X/01lsUx9Ty4?=
 =?us-ascii?Q?tzxvz7Fo4hrtu6LWopWXbBS0+2wmxUX4hTFfWXEVSxBesmcPX5T7TGw0qGO8?=
 =?us-ascii?Q?iPMBU8Dcaso7pEoF4/UEJttXJsx+Difaab+D4/krK0PM/nCnQTGyyNYxNCgB?=
 =?us-ascii?Q?HQU0Xjwu1ei/Z7yIgBjzkCr6G4NKX3hO0ilSaScq1rmcPCjyCLMiO4CCAd+9?=
 =?us-ascii?Q?y7mfev0i+rLeptGSLpucDyuTzmH7gIZGseGQTlXRASZ++HL3B/OjJeCTQ0ur?=
 =?us-ascii?Q?rM+6TOr3elMepRIjz7z6TZ8iFaAF/XgSZNu/dHZV2/uilIMlrSEOF77Zm1+T?=
 =?us-ascii?Q?ROHVHCrDduKwXZHAhn+k8DdnJA8ftQNLkqGUpSaZmfwwyPeowCvkZQqHK813?=
 =?us-ascii?Q?uT3mOVjUU8R+9BNnzstSL6p0EjVC4dnTm8HrUGHzjZyO5d8y1g74zY0P2H2/?=
 =?us-ascii?Q?dt9wKdyYD+ARvyoGdeSqHOX976B3wvBRH2GupnSgzLT37Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b9lsGw3mJf9N38DdJRI9dj4Oqrs8+wsqxFYntZCvz7OzbRttSg68AVffNIXO?=
 =?us-ascii?Q?/Q3xztKFT9mrjXjKHVn4z4g+XYXxNx2ZiPev5DSadp9JAPGDGseeJ4e7Azos?=
 =?us-ascii?Q?aA+5OaiKdQHhFC+M2PHESvpmnTI+mKW35/i2326J4BOldMnkC58+k05s2ydB?=
 =?us-ascii?Q?ulTGHbdvMSMlUDWmZ/P98/NqY34nj1aok+ZZDaMztWrwxSYVH+KDqauo1N0W?=
 =?us-ascii?Q?H+mkkdTIZ8wqqDP3Ul5bJLyTd8yyZsiBZCNvnFWwmDY5R87byY1jEP1guXBZ?=
 =?us-ascii?Q?U3RsDBdHD9hi8zmFIL+gPknsfJh5euMoiAntOVCAFHZzT8olpMGgaa9Op63n?=
 =?us-ascii?Q?yTDux106y9psTuj7U8i+PhAkTV9USCJnlRf9tPy0fqzd8QKg1oC+vONp5g/b?=
 =?us-ascii?Q?gZDXk1Uof3yu8Xnq+Yv6z5jKR1RQLlf8JmG7veYp8n7M0Yd4LdaYh4gF2mca?=
 =?us-ascii?Q?2BvGR8znZBA95/7Pe85WVMRU2zDGfmX8rmpmJ3l4W1hG+Eb3Q2JCZde2o5/Q?=
 =?us-ascii?Q?qDSOIxWlJUsPhlf3nZIo3i/064TQFMo66vSEGQUn1omJAIUe+ygDkycvdkNe?=
 =?us-ascii?Q?xJluv6eVuDIu+8vZnSjrcO1TPqH8ND5nQpgylvCjzF6tiJ9CfrTVlihlb4bs?=
 =?us-ascii?Q?NJtud/P4xaDumu0WdkkjYMwMekHr3rzZsKrmMS4rnxmSxkaQ1q5k3KiymCq2?=
 =?us-ascii?Q?xbDvxw6PoFcwvLIVOjgG6tASoBjrbmo9GDgPn8E76+ajeeiPRFbxo7S0bm/v?=
 =?us-ascii?Q?inLhwDrjUSOt9hdeljOo8ZO1Jv6g2AE9Zt1SurRdgniYER0+KGBn6aQM5SbP?=
 =?us-ascii?Q?HE31gSfkVnvadCuhLB+TMJT3iYVt9b0GFhwMRwavHf3YtNbo0AB1wzezmJCG?=
 =?us-ascii?Q?qTBl6XwiyQY+6CZfWh5m4/GORHQVKuLSFh3gsMVSLx+C5ARnYfO4LDqAwg/q?=
 =?us-ascii?Q?qrqXUD4kGFXTFWVakdWUM2UV49dBL4tOB0TJfxzuDi++4sGsmETfd6/wJKc0?=
 =?us-ascii?Q?qK2fpdp/7RdC9VixVPHkjWbLzG8te98OUmahucit7l92gQhhrkmXhWw839PX?=
 =?us-ascii?Q?PcSTfjIaTyxfWnQNeUrJgQIvKn45d8A2WQ4nvcIS+EhSndQhysn5Ke6xRtya?=
 =?us-ascii?Q?Po33Uz5g/oBylbTQFAHL9K6L6McqV+YfeXqI/A89bG2tJ2+R8H/4jfMZNezL?=
 =?us-ascii?Q?4Hx8eXwrG9q4yFX80hg1q4byBeoV5IntkehcDMfijqTj/G6Jb/oOR9jqdVR4?=
 =?us-ascii?Q?i5hA5IYxeWRJzxSJYXWmVVPqBE8hHaTzxxpuLm7HsorRfG4j2Nn2+uYzwImV?=
 =?us-ascii?Q?2T4xRvQcQqXpArmz0iOms4DM15yvpZxZNWN6eBM6sP/btKSOhRWpr9cnws/R?=
 =?us-ascii?Q?vhmheRan6yMM6ikOcN/K2o+os4g4a9KPslp/q556rgmTLlpUyv9n3z957ynd?=
 =?us-ascii?Q?orcRq5/ppIdoz7VdZwNs058E3gqPJIaR7eyX9Mu79FzcCZsBSsGbTfmxVvOO?=
 =?us-ascii?Q?LvEvyMOOemPR+jVUc5Qo4MNt3kPwZEiu6xTruchJIGLJz7Xa/3CEK+Om6shJ?=
 =?us-ascii?Q?4K/L9Rjvjj/j6LbNDMaI/7dvRtdOeUgaBlZqd7O/CcKq3//1vEaFg76HaAzm?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44db0e5b-e5ac-4196-4c13-08dcce15ef2a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 01:47:58.3499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xk0zsJl53wFUb1LmNHUTs8lUhg2PzKTvqb54I71yAwA+OxgO9DN71vqOkZxmfk0Rag5C1/Svvko9dScNjf1kaGCyhl0SxsDYvUAS8JJIqF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4806
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

On Tue, Sep 03, 2024 at 05:21:07PM GMT, Matt Roper wrote:
>The mmio_ext stuff is completely unused right now, but it isn't
>providing any functionality that couldn't be treated as a regular mmio
>space.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
