Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E754C27C65
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 16:41:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB7010E1BB;
	Tue, 11 Jun 2024 16:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hRAvkpO+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5814410E1BB
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 16:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718124085; x=1749660085;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+JsObya7Pj13yDm8EEb9xQZ46nPWAz/p9ZN7HN1phro=;
 b=hRAvkpO+OjAR5plthOru4T5vehENMA8+ZIjy5d2MWXjn2eYd4XNitR+W
 ltEshh1fpfVqgtozXXg7QnD18jNp9ls4DIV7rKzLXViELtM5IF0EjBPLQ
 02rDztNY36D2QmiwRt9JJ5lf9KZ/JnYZGo6TbpKgabQr0BsdmK0mSE1ST
 HhY1PXabXrnTsRvFcO5t5+RNbwOIfF2cYqMNsEpJuoHKL09HRothbSCh4
 hZNARicw1qWrTiLxLMZBMbmyzBQexnhht0akU8QuqIHzJxnROQlI+2wQQ
 BIJXjuMLVVb+jhbi8Fhhd1YUla6Hbj1cssJFqX1t31DIWZF4KI9wujyv6 g==;
X-CSE-ConnectionGUID: KxzHtTnkRiCAen7OBNzHVQ==
X-CSE-MsgGUID: SIDubRe8QBSGZ68iwLjv9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="25473274"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="25473274"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 09:41:22 -0700
X-CSE-ConnectionGUID: ZUWjixzLQ4KmcBLUvnunXw==
X-CSE-MsgGUID: 5Kt5VXmUTaGku2XSig9nNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39960056"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jun 2024 09:41:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Jun 2024 09:41:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 11 Jun 2024 09:41:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Jun 2024 09:41:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KIIGQKlIuQ2KyG0XXyI7ei7KLf3hslVieoMYPZe/9sk4QW74MwYaemNlnrrLpGnRVcRoF+EdK6Vmd2SxVuNOSJZe4dHHoxy/EnzHLE55Xi/oQtmXtPcBRfLxVATVaTkwfIuy7cHG4B+8C8qkH41uSNaMwFhRpTV+WuC/cKUkpd5x8RBZGEnse66wcEBLb4cIi/Z6DQ7RzC7d15mfXyS8H/m3oVbBKYvBqEexStutCz5KHphMdlcABEtwXTSbtWE3zKLA9JKLjRrMfiOi7haJ+mayZv8g6A9k1nUUVz6dwZw9nkrrrjTI+U1H5d6D1IGrQAG60AWfW9Ze4jIAgU3h+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjrk1yiI+PfPQgIYfzAxziSEV+Cky1SDVAYcEsI7lh8=;
 b=N/rhiCXC+h7JMm6SR3pP+ZohPQkd6Zpkt/6MOjKKuyQiBFIhKm2cqIu96exBiOpA/4KyeUjdpK/CA9yJn0PKs7FuM4aAVz85aoOfA4aAuyC4ljodskV8Brm9q8Q55TLCC4j3b3LGiFwSzrjhhEAnxXncfRma+YzkoiycR1Rk5/SiFs4w0EC6QYliNMXqTeK3rlV4XhEgBTwP4+3KTbRxo0zyjmMItlopAMh6E56ni/obZtHBy1SN/6xbrklzFokRu1sLOZ/xzOyqGJHwj3sxpJhLZ9Ib6sREdA55JkUiQRndNrTX5JGKnZQ/lCAQ7oIe+YFWjQzeqPY2Yt6DGB4srg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DS0PR11MB7458.namprd11.prod.outlook.com (2603:10b6:8:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 16:41:12 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.7633.037; Tue, 11 Jun 2024
 16:41:11 +0000
Date: Tue, 11 Jun 2024 18:41:05 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 2/5] drm/xe: Kill fw_to_gt() helper
Message-ID: <Zmh-IdusvnJMyHX4@fdugast-desk>
References: <20240611163537.1944-1-michal.wajdeczko@intel.com>
 <20240611163537.1944-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240611163537.1944-3-michal.wajdeczko@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0291.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::9) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DS0PR11MB7458:EE_
X-MS-Office365-Filtering-Correlation-Id: 08470977-efa7-4b1f-e70d-08dc8a354d75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|376006|366008|1800799016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TlFIO5LehamLL1vCiRfo6v4HteY2MXVSQym8wn08OvGrG0QantTeCCK/oz2E?=
 =?us-ascii?Q?URvv5j7CzS3UCPDIGxQKokQwqXLsBMkHDLVPr7PBq0uZJjmSOywcDU86hu0b?=
 =?us-ascii?Q?2N8b/YgI5aqkCJKf+ppuWt0wlycJLxiOIfznSEdr901cTynoz1hmsFrS9A0o?=
 =?us-ascii?Q?/CwT3b7eOcJblbdLZzDoLvQNVYRlWuXJf31MQUBM4dRNwC77BZrJbKIw3Ak/?=
 =?us-ascii?Q?Gl+pimXkbKm0+C4HEUl6wRftRYsx2ovmHKw6Vqs12rf7QdVyq19bS49oHNNb?=
 =?us-ascii?Q?xcuJSNpLxAE2/4YCg/YIIJP4kh0tbpj+oSysuKIeFh3K7Tcid/XmgfRTW1ug?=
 =?us-ascii?Q?NSjXM/czbi9/3XgtTcOyOuzheP+/xKG4xuyiIm98G+oHSUF+JuAfnHYnxP3z?=
 =?us-ascii?Q?DyVY8UKZtzAGs9mwOm5PBZZpzfQCXZsTXHhJqZpWZyHFY2v1VdK8VxXHU7xS?=
 =?us-ascii?Q?+QDPLiAWzgxH7ChyXYXWxgYoHJGsQjftUulwhpHMApUvo6xSLU48pLJElXld?=
 =?us-ascii?Q?6jfLXhjWFTA04YLmnMgfGQWLwKy7K2CJ5IzowwhjSXxcDhppCvTJa7Uv7tt1?=
 =?us-ascii?Q?IOwnIoyx8zP9VBUMjmUvdFNOh/nURgSgSNY3zhF1Frolg96zlWpErFqy33+u?=
 =?us-ascii?Q?ux+koFMpsw7ttF+gEwBUbF2tfoK3NdknEAqLnX5OaiM7sh7c+P2RoVuOUvbc?=
 =?us-ascii?Q?YF5OgvEbdxtARFiWV6XAYAmTf0/M6CvajGauvxFMcAsp93pXkdYWncr27ICE?=
 =?us-ascii?Q?runwWokbNS5nd5lFYVapV5QcsH5dPGFH3hGYY1/HRnyM1Btw3N7GBGBumHgV?=
 =?us-ascii?Q?V6LdpIdW6uPlOhyOI/4VCDtXXmkLjW2Cf75KyF9qsWHO/iYromn5T0OKeLvm?=
 =?us-ascii?Q?6EU/bbUKSXAmq29+ukiAjPwtyTbCjxeiWSfNk34dM+P2auqzlgqnyuOVxdgT?=
 =?us-ascii?Q?mW0xwnfwg1hZB0re6PPoAqkDyx6nH9eHltzelJMvaQ/4XbRipob4GN1szyiU?=
 =?us-ascii?Q?CYBmSa4n0OxBfknNtWQE/KTE2fpfByQAlwMo3lQp+MI7Jkr4qkrkeUoCEgWc?=
 =?us-ascii?Q?hEWUakZ1nocdPctarMcSqKSzsBXTShR7NHJ6jr74JB8BWsD37T0fSftRGFzf?=
 =?us-ascii?Q?rSebliFaeYk+wEZZzVrmR4gf0x1FblwUo4LaziCH5e7HaovIpd5vFfEL350K?=
 =?us-ascii?Q?UJTresg+2VwPhAzzzFaLWqY1rEm0U8nGGX4BuLKXNmctwkSJkbSyuZJM1tHO?=
 =?us-ascii?Q?23dDqlG9OLeAwexmRrgdHmnFVMC4G7KTavI+M562Nmw7EHH2iz/RiOdvr/T2?=
 =?us-ascii?Q?F6o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(376006)(366008)(1800799016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o9iJK+fYyHVBWHb9ay2YvhyK1tyG5qSeAbKa7RXk0a0pRG5Ki3F00vqCOpGE?=
 =?us-ascii?Q?ndhMUARCMHN0kGEmIXqZOqbTGnmnzl1Ydr4h40ihZwXpVtnCg9bT00qbMg6M?=
 =?us-ascii?Q?XjxWLwiXhHD6XBeUlm8N2EZ551Vh5AgE+BDK2OoSkWA5gNkUq7LYnph1BpDz?=
 =?us-ascii?Q?Yze8Gt93SlhMMyu6BPUwTcO0AUcqth0c+ATBAktkRDbIluO16b73V7KQ8F9J?=
 =?us-ascii?Q?60bARY02b4J+2qMgO4YuOYKkN2rRLLnE+rAN+GPFPDlBDR/g2cNssmEI7MaI?=
 =?us-ascii?Q?ARMMXENNEDmzRBtMPrTOdlEfwoVo/JPLW6NhqB1aEQpwt5ZD2ZlqQTZuPwli?=
 =?us-ascii?Q?Aiwb5ZwIXfB1DNsla0BEff4oIW3BaSvukQGDgzTHxbz4mRbX7xekkSXISRhZ?=
 =?us-ascii?Q?k2lQekOAiktQtv5aWe6ALA+cz5ljsblFW7IK86HvKBAqp8Y2F8WvxlI9GPbH?=
 =?us-ascii?Q?7IOAeGi/Sp57/8/nQzqU7nn0ObiN8WrXfG+VBUTTtKoROkdLNK4yrG6f8VF1?=
 =?us-ascii?Q?JanKn0UxXyzZQ5wJhN0pKUHfA8uDw+JSsNwO5B/QJsZSh8ztXyTL3970w/46?=
 =?us-ascii?Q?o/s9ZfnP/wAzjRkvcXXCs9YsHInXnhaEO4jPreD++TPa8EgjaFqp/Rykei9g?=
 =?us-ascii?Q?D9wkkgQIdQOWFhmStFzf8XpIhHDOUr5f8JypUw+Fxt5TB0vqiNtAyt7MOknj?=
 =?us-ascii?Q?PlX8UlzDWpz6+PPCum4eJ1Y4H2VdyHNXRlSNrFYy6ZqciePDgj/SA55lag5U?=
 =?us-ascii?Q?fBYPKO8rj8eSv6smtdIANKsbd/5qUrjOCwReAa0WtxzSKMPAZrzoOX3ET8ej?=
 =?us-ascii?Q?qg5tA8+0bylkfKFgMheqbJNb88tfj296ANDVxsJTGhn8V7L+/ThcUHL75ewy?=
 =?us-ascii?Q?6W+UuNS8zWYhXWrbooAeI2PuezEnPH47kZJZ2R519Tt9m6fwrHd7+kRhbriP?=
 =?us-ascii?Q?3qEPU+SzqTvcYlm/PSHGtG7i1JRSaVVOsgGF+GK8cJTUGG1YJ5DEwiT0j50L?=
 =?us-ascii?Q?dFFj+wb43FM1LgXZjjs0YQAXEXIS3zUZ0MahzjHAqyhp314bhjWmkqYp8jPQ?=
 =?us-ascii?Q?cT5jO5i8OAHhGsqLayfKZoT6zSsrrsaQBwMnMU1l7AnGKtJ8SbLO5A4Ms6Pa?=
 =?us-ascii?Q?iciaTLfIf1Bt0Fbwa5b9J4/Leqp3XbWHxZBV5yVoorpmgmRw9MPvb2e+slf9?=
 =?us-ascii?Q?ZtbL86z3sw+selXyTOolc/pnqs7mZ3F3t83SIAl/mVV1r1r95h5Cy0fKVt48?=
 =?us-ascii?Q?gb0XrnosNqfqNsuuxG1xjhmsYJJkbxpYl+BdcpQV+wd4BbnhJm/49PQdFKF1?=
 =?us-ascii?Q?Oq87/EBoNGmnuK26fuobSvy1rCon/0Iu0pec+Mdk6cNzmQg1GgXhojGGbPeN?=
 =?us-ascii?Q?c4GqUqbJN7gbCJb55uvnbPeyEw0eQGp9XRx4zS5YQKG3eKIYOGg5VGRDbZ+N?=
 =?us-ascii?Q?0SmArcBNnGVc5zjB8diYnHK+2ui8Jch/qQTjJg4SgCCqR++Xjd2ib8VXog4Q?=
 =?us-ascii?Q?lBfrZSMyBOB/oDGWdtDYEvZyAdHGNHlaMqDXejhrm/G63pdcBwq+FYzc5Lpp?=
 =?us-ascii?Q?U3abLv/YvtK+OUWLFX3LRohvuErC3L7dzPnQaQUlsmcFZZxODn7D7ndlSFdJ?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08470977-efa7-4b1f-e70d-08dc8a354d75
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 16:41:11.8283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1dUr6MTB+ZHubKUzHNK6zXjdZF+0Jh1D7paYUoj1otNwgvywRnuNcQbZAu5ehOWhc6FvtBRipZ5vCiSHYaip1OwcWz2KdefgNbp9uggfPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7458
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

On Tue, Jun 11, 2024 at 06:35:34PM +0200, Michal Wajdeczko wrote:
> It's too simple to deserve separate helper.
> 
> Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 13ddabd90eed..8799a2544648 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -15,12 +15,6 @@
>  
>  #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
>  
> -static struct xe_gt *
> -fw_to_gt(struct xe_force_wake *fw)
> -{
> -	return fw->gt;
> -}
> -
>  static void domain_init(struct xe_force_wake_domain *domain,
>  			enum xe_force_wake_domain_id id,
>  			struct xe_reg reg, struct xe_reg ack)
> @@ -130,7 +124,7 @@ static int domain_sleep_wait(struct xe_gt *gt,
>  int xe_force_wake_get(struct xe_force_wake *fw,
>  		      enum xe_force_wake_domains domains)
>  {
> -	struct xe_gt *gt = fw_to_gt(fw);
> +	struct xe_gt *gt = fw->gt;
>  	struct xe_force_wake_domain *domain;
>  	enum xe_force_wake_domains tmp, woken = 0;
>  	unsigned long flags;
> @@ -159,7 +153,7 @@ int xe_force_wake_get(struct xe_force_wake *fw,
>  int xe_force_wake_put(struct xe_force_wake *fw,
>  		      enum xe_force_wake_domains domains)
>  {
> -	struct xe_gt *gt = fw_to_gt(fw);
> +	struct xe_gt *gt = fw->gt;
>  	struct xe_force_wake_domain *domain;
>  	enum xe_force_wake_domains tmp, sleep = 0;
>  	unsigned long flags;
> -- 
> 2.43.0
> 
