Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CD2CA1012
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 22:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBC010E950;
	Wed,  3 Sep 2025 22:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fSiaIFkS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BD910E950
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 22:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756936830; x=1788472830;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bGc5Q2DIR35qy8r+hy7qnkdyFGkn8rImii5eamwZVfI=;
 b=fSiaIFkSrtnlIzIEqPVDWJmfUaWkfAYiIRVdX3Jrc2g1rfmDTuCb+1EO
 PrY8/TnAR4NzvpWmnD8RmCaBG1wBjQLdaJaEWkYyXUh7OK8yxDOzULkoF
 KBk41E82+DgaGS9x3aRJVsJzBvvWS0D3GYuMglzgNNfivvVRWai17QryL
 szknRykmW4ky9J7MKKVBVgywkaSe2jc0U0Pw8JH+XkVXfATzFJN8i9SqO
 jJC6B6Xlpk02lvjqk9FOqPe+8tgpWtLfOGlfEi92co9oD+HfuyjEEQgeG
 ffMvbX0NaaJzvarDwLs172HSNLXIuvSTPjmzWmWpVd+lg3I4uCaW1YwmF Q==;
X-CSE-ConnectionGUID: jPELSuVTT5as21s0w8d8TQ==
X-CSE-MsgGUID: rzTU7iYpShSQ887mga3Isg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="59374977"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="59374977"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 15:00:29 -0700
X-CSE-ConnectionGUID: 4ohW00I7QAWEPcWDJsYmPg==
X-CSE-MsgGUID: UWY2USNSQl2VlM3yJKusvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="171598294"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 15:00:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 15:00:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 15:00:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 15:00:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P4v8dLtsLKh1ganau9eyFkE9yLBpRo7z1wr94iDPQob6zyjDraM0p2FKpJ1QTupaNlSQGksdyFNEMtGrFWJGroqY2E6ieuMQNbAMoIm/qaoK7v2HV8LKp2O8Nmgiht5uTaZw41tkwblpwuLAa6uilE9Kes8M15QztAmWnlRmsGT5ntKjM8HGyPuSWqytUTVYiIKPz/QJXlVDJLg7Ebf0XCwU0kDbQY20pvTo+GR/ulbq3rQc8MMRhYCLaa5Bqtyy5CL0E8QShzGf3EMwpYF+EB7aKOJzw5+ILAi72+Kk/0/y2X6uoj6y2O3dqKrWtIkNnWEu16VEov7io/Tmvkteaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KoPehLxhPmrdGrs8XSiqvSZJVc+j6xjB15Q2/oFlviA=;
 b=pCuvY9Dn1H3eZ2addngdrt/k4II58Lq+uV49RhvSY1zke5I6EAMpEz9zbhuX+Nhczq5dXJz+t+ysIa2LA2C13BXt7+hNFSkxH9PaltSJfiZDUONtWsbv8Tz30+Sp2mCfDR+fRcCRHWKpy+8jiKE4P1K8wCwqzblqgZdJsaBDdVGnwxuVIfqqfIJWl3TVQ7kEoivv942/RBVg6phXWNhCDw5+5dF3x5l7dJAjW5mL73HU3imkn4khPkOGrpy9aPGh6wVQykZ6ljGA+ZTatDBYivxmhiwdUtd/l5fruWepYy78VjziLeVFIxh7OWUbb/Ck7lUa4qBRWvcRWrPrjW4AtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB8010.namprd11.prod.outlook.com (2603:10b6:510:249::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 22:00:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 22:00:20 +0000
Date: Wed, 3 Sep 2025 17:00:16 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/7] drm/xe: Drop "gt_" prefix from xe_gt_WARN() macros
Message-ID: <tyz6z4wcvuvyh3amtfvu7v3v7klodyvdpypluj55qnyozf2hce@h2rjwuxu6yuk>
References: <20250903213712.6364-1-michal.wajdeczko@intel.com>
 <20250903213712.6364-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250903213712.6364-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0139.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB8010:EE_
X-MS-Office365-Filtering-Correlation-Id: 351b0a25-fd55-4775-c2a5-08ddeb354683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6z0C0SSIqxxuAYxkMO2s6xmDF/nBjfo0dZ41cQ2+/jI9Uiq1t2m1Df5yF/bz?=
 =?us-ascii?Q?9CRa2/RIrWNdf5YdR0LzK+t+Z6I7dBNOrOsTzWyw4TodHp7UICowmLE++Db+?=
 =?us-ascii?Q?pWd+/N47uz/dZnkEYA9BBH3nJsF5y9TQvKHqYjfbo6kWuJSr/wJ7DbrSp8eH?=
 =?us-ascii?Q?AXUdzboaScPtcvlEetsLTE8e9dNG/luibBq/v5O1POGjJVtcs8NSdGCUuOYW?=
 =?us-ascii?Q?8zzXaDf5wv1aZ0esElj+39qkCzyRbV1v7E3mrx7pVXbqwSE027rtmDFBiPBH?=
 =?us-ascii?Q?oGwxB3hNXzzd+zIWlyRN5zOo55gvsNOfPsB60UfQVykhdPYqEpMfhuTNRjSf?=
 =?us-ascii?Q?OTJRjchw68iqRJjoIqF30CB1URfE8i83SkKv7ebMad9gshYk3zzKAbrsDH/Y?=
 =?us-ascii?Q?qcilg6wcd8I2jxLmdLU1wVN9ls+9zOwBgqg8845suD23nMiDo7T+rtH8+6af?=
 =?us-ascii?Q?kITpOnBYZbL0zlEKY0HKwzVNPQesuzmIps3zoC0El5rCJlIKw+NyhPJKQ/O4?=
 =?us-ascii?Q?pzbVFmlIgfbA+ObLMECSV66y4XpWSQawakeoR2p2sspkV/glVbLx4BxOzgot?=
 =?us-ascii?Q?jojU2HJCSQCWc3wshDfh+NzXsfDn5GGQpkalg85dHzrrI5/xC/opzq4f+Ww/?=
 =?us-ascii?Q?nBuFgMrwRKg7a/VtW1AL3T3V4kKt1A1N/MA0qJCEx9fpLAoJh5NqP4MwR51y?=
 =?us-ascii?Q?gZlY89vBosjzehk7sx4YSpid26DzbnhkoLa5Wudl5hI1YvMPCA5t1WwUHhwo?=
 =?us-ascii?Q?Vpz1xw8/EhwlIQgBKCh7dmpN6Usaqsj9B5XK2VtJGWgeNR0d4r9MfkVAhmsW?=
 =?us-ascii?Q?XnxnDQmWRpHhM8iaqfvDA2eQ9p7YOk0rlKDGUJ+TKfh4KiADA16Qwhs6KkvB?=
 =?us-ascii?Q?FMm8ULIm2Igl4UHGi8lFO/kMZcB1awI6t7LRokfEB2x8OYnXO8d1u10pa8Kn?=
 =?us-ascii?Q?ysZi8ls2jmwlvRHEsRCL88R120ZBcYx6XbxG8Z8u1tEpN5piXHGVVVqS54bt?=
 =?us-ascii?Q?IN+rQ7M3W9igp7wTvYcmHDRZJBH6CVeDObns/usCAuCaIgomOaWIId9AbUKw?=
 =?us-ascii?Q?GPSIH7Nlf4c1FJDocd/q4ixqUuVxWvySWapS5arYJcEA3rGb80Z4dnE3JcHI?=
 =?us-ascii?Q?cRgoODGbew2wjmb/xoC5df+ajW2Rbtj9i9WT3JMTlDtL+VHCqfewfQNv83pN?=
 =?us-ascii?Q?ypI7xAkIUJNxnBEICXFhX1lOyZ6uGlM04LfxXKr/TI9DbExOzjc8UhO1PcPF?=
 =?us-ascii?Q?WrVSqrsk+di7YsAQj/B1/wB20l1wHkOrgZkvFQ22gSOT+hfELBpHrka8P+gi?=
 =?us-ascii?Q?atu9Wu06dtpovIpdM8NWM0f9Nb5EH3u/gT+/yI/XOnXikz7NfRgS8RlvHSoy?=
 =?us-ascii?Q?8l40H5SOhgba6UZbi0puTZjvhGNs5ThupJIFIwrioX4SNVeBwthoTr++01yd?=
 =?us-ascii?Q?tPNQ0mS/r9A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T2oXu0SBq02cjXcVkpUXKn0K5RFBVC1s9xxOPsCxq4yEwu9UJk6NlmDezb/5?=
 =?us-ascii?Q?Xgw1f4mkRs4gtw+nY2jL65OYvj1ugLte4z68MTkydLspb3GRjqpRE9GTxgth?=
 =?us-ascii?Q?ANOp0MKVGozu6GkV6O6+tZJYkEUe1GbjKPQLysMclrFGGi4FU57TPe8bLsx6?=
 =?us-ascii?Q?xSj6Xbs3hc7wetjI93Ya+RzSnVofcAa86yf1fsQ6CpduyJcsBvOFd08v1tvn?=
 =?us-ascii?Q?0Xyvmu/8/3x+QbEroULPcwRaJbqkSXsnFVDtB24rRTc8DzolqCwPA4haCnNG?=
 =?us-ascii?Q?MNxLS9fO3sn/Fx1fL09wQxdBsZwJznTJOMsEFpIW6rBMjlv6ztmvKPy/uajc?=
 =?us-ascii?Q?2GII+c7T9WMKq4McmavxiBbfGmeYdtNMoMv28i3ymBfLXF67geuqWUi/cz4+?=
 =?us-ascii?Q?snmbkJ57KI5s1+U6qc51MiesIzpoxEyySMbAvNuzGlAesGzUJxN85bSQNVg2?=
 =?us-ascii?Q?QJ+gT4Mo41ihYn40iNbjbry44wMfRibciMuVKnFlYLUp218qbgH/U6LfbtmN?=
 =?us-ascii?Q?57FumRpEYBf8qwbiKNzf3CkxW9Ng+7o2d9oOfrGC5rJYH5ZbxkVx4EUuA64N?=
 =?us-ascii?Q?xn7jz9U7diQ3use4EIcJhkz3hLffHrI8RNclaRAXaT/oo/WbIA7kW8i9LC1T?=
 =?us-ascii?Q?kd7ljUbMo+D2M5U0RbVknPLqpnQTDHMJYtCSwpol8Rv9rdeeP3nW0Ka/TRz/?=
 =?us-ascii?Q?32QU1Z9CAuFcZqXdm2xTo4BnA4X5tv2NrBjG3t7WGnNyLiqdJ0xU0VRKVWF9?=
 =?us-ascii?Q?sNL77Tcwxg5JApi3dgE4yKKuZV3BvXvRyox1bZtcyrmcc+DA/EGY8XaRaSqp?=
 =?us-ascii?Q?GYrTRB1Sv157+8mIiaWdW40AeMGJ9wwY/hnaUsK47yHO8PQSFxk5uBS9yFsx?=
 =?us-ascii?Q?4jlUF6lk9saSjOTKZ+XBJ8ERNnEC+o1L1/mTJgMjopb9CjonXWm7iKOS7QiY?=
 =?us-ascii?Q?rxHp51kAM50YHgoYK3I4WsfsNp4EnMrj4fJiOYWrBuu+qP1M3Fc94wZvTUan?=
 =?us-ascii?Q?En2SqIUEs4hfoZfnMh5LC6GGa6UQWZkI+ZeOHLondvD7AP6XSJ9WxbETEeOz?=
 =?us-ascii?Q?A20xjVbiooSxYrh/vmdcJMlO4NutlyLaKqi/UNBj5xOFgLYZEVgHw0H2S7P5?=
 =?us-ascii?Q?Z94d59pj8gxLsx/oysEdFpqx5qumEAtCm5wj4LAF1agQA1WYUw2qsbmOC754?=
 =?us-ascii?Q?T+1NAO3KLrhzQGIzkwS5CnB9VGMWRl6L0/eMyEhK6fvYVYDxcrRKtJUNhmtC?=
 =?us-ascii?Q?ZjoZ/ieH/Hg8mLjN8IaIGUWO8sqLu+s6c8pkCsQa+D08MbRdwl9a2LmmXzf8?=
 =?us-ascii?Q?MQD59BGbIdkU9lU4ToO6BJZf79B7/u4RFfl+tpXdWBAB+NtTRPjsnh9K3AK5?=
 =?us-ascii?Q?8cKF+pkos9wOe4Ewd307RQktMg9qcRK7CtBq4EYj0fe2XAZopQx6/JXxaFUl?=
 =?us-ascii?Q?Fzr5TidrDhqDoMPCbQcK9vynbhh4PkeM/+aLG77QIjhQREaxnH4szuaF/QnI?=
 =?us-ascii?Q?9b460zWyPgpdsHK4xa7+cJDpolLOMNkFhzyFZBcBAi49q27BRv8iqISNcekg?=
 =?us-ascii?Q?7o7i7JxNZUjjITGqD467Rex8zZ40Mm4wzht/EAYy51k4DiyVL6siDlPneqbI?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 351b0a25-fd55-4775-c2a5-08ddeb354683
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 22:00:20.8476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zHCyPOzPkpni02FW9sJZwg4G1SzwtKCPDPwIm0+iXV20yfKPK5tCLvPt3mcmD7Z4ajm2ks0ymhgRxSbAhRhpbXhv+NlAfts+jazOJL07yEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8010
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

On Wed, Sep 03, 2025 at 11:36:07PM +0200, Michal Wajdeczko wrote:
>Those WARN messages will already include GT-specific "GT%u:" prefix
>so there is no point to include additional "gt_" prefix.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gt_printk.h | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
>index fd9cba14383a..f2091c734aba 100644
>--- a/drivers/gpu/drm/xe/xe_gt_printk.h
>+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
>@@ -41,10 +41,10 @@
> 	drm_WARN_ONCE(&gt_to_xe(_gt)->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
>
> #define xe_gt_WARN_ON(_gt, _condition) \
>-	xe_gt_WARN((_gt), _condition, "%s(%s)", "gt_WARN_ON", __stringify(_condition))
>+	xe_gt_WARN((_gt), _condition, "%s(%s)", "WARN_ON", __stringify(_condition))
>
> #define xe_gt_WARN_ON_ONCE(_gt, _condition) \
>-	xe_gt_WARN_ONCE((_gt), _condition, "%s(%s)", "gt_WARN_ON_ONCE", __stringify(_condition))
>+	xe_gt_WARN_ONCE((_gt), _condition, "%s(%s)", "WARN_ON_ONCE", __stringify(_condition))
>
> static inline void __xe_gt_printfn_err(struct drm_printer *p, struct va_format *vaf)
> {
>-- 
>2.47.1
>
