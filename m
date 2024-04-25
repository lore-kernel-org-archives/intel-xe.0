Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45339C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 20:30:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F1211A8AF;
	Thu, 25 Apr 2024 20:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YICnc2Oi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0481511A8AF
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 20:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714077033; x=1745613033;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=m4712BBTfElUutA7jdRJEF9qUoO4mql+Kvt1yIbb4oY=;
 b=YICnc2Oi+eS8CSgD9mcibvYYNoowVPVLOFKHiO0TgGYQmAyV+rEKe5tV
 65/iiaOvvfbxdfJV/1bTzICVoSECmOl8D6YbOgJf5SR31xJw/khos92sW
 ZG45vqq2QCWS01Cg8QSgt/trfXZma/bCXl3aiVNfkIO31Scsn2p6G9akL
 9nFeoMz8YZAN+TO/Rs84C9E9+80umLZA6FzwKjqSBnkodSAwKqHaDBAbN
 QsVn161DEDkenfyf2eNnNMNP9cg7Y/+2VZo19S84ELfcGyE4e3W1PfrxE
 iOlwBh4gZWOs3RFoBXl0yz297A5CwlFhGFYASKj20B2UD8XmwIpzG38Ca w==;
X-CSE-ConnectionGUID: 6H63aBj+TCKhas+f8sLmQQ==
X-CSE-MsgGUID: +1ZhrE8NTTyjnJRNjeUksg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20347434"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="20347434"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 13:30:32 -0700
X-CSE-ConnectionGUID: RnWzAVWlRhmcXS9WfFC6Rg==
X-CSE-MsgGUID: NKPajijbQrKW3Mp1h+nDPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="29840330"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 13:30:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 13:30:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 13:30:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 13:30:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 13:30:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PzBDakmeIHNzUCTBBltp0hVxKzR7h9PDUFwQAQpjOlHnT6HH4ikQFcdJKBDWzosnz53Lti6hhU7enz7pcYMPqNk6rsh0jS7JldqHVeVUSSPdsRA9EjqDHKoVuEq5k0E8UUjZ9cnCCyUC6z4Gj1zVdacYDo6ukuHidUfLEa0V4COfqpK00Qu5Pht+Wwn9QUhqjCa/GZ+2xHxYGIcGoToKeWGTjgg+JtHt0X2I6Ms6I4ZMhYxFQ9VDyjJHzBn0SpzE7FpN5O9tREzpmPLBahITqOlD27XnMGwBK1836jpdeE0ImbYDKKnmnKaGgi7XkrJc3lZNW0JEkacQ3iMvf1XhmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcT1uUiub6WwSGlAtWEJsLjjfXya1iIBnkRP9XWk2ws=;
 b=g5ogagdwGZJ/kSrs9/yLv8Ip9IZVk1lPwiyvgyuWV5EBVjtyXbATtk+icbdGOyIJ/mAm69qRECfpG5kTFPJQ77b1N1y35905PSBVHlv+oZo5GCx/5+VkoRlGhsfvIkwiCyVPmmnFVr8o3c7jOL2jE5F+2UrDk2FQaOCTD3Ft+l0B16Sue1L/qj+oKmYD+/Uf2oWYh/pWkwrC1sOLgIHeA6BxJnIIV7luW9mlb7Iv5tf7aWUKrNpOjJD03LZPaQdTZwXEIqYACBxV+o20xYahsu2nev/Slu8oEV6/lBLY4SnwX1dkxoSOUb86mJo8Lez5+eUDgH/vr2NNXOJ0j6DjxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4963.namprd11.prod.outlook.com (2603:10b6:303:91::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.24; Thu, 25 Apr
 2024 20:30:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.020; Thu, 25 Apr 2024
 20:30:25 +0000
Date: Thu, 25 Apr 2024 20:30:13 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Add engine name to the engine reset and cat-err
 log
Message-ID: <Ziq9Vbnw0al9DiqU@DUT025-TGLU.fm.intel.com>
References: <20240425121856.4500-1-nirmoy.das@intel.com>
 <ZiqW68FPS+vJ8TtR@DUT025-TGLU.fm.intel.com>
 <63adbb9b-ee0e-4a60-866f-135ee59f97dd@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <63adbb9b-ee0e-4a60-866f-135ee59f97dd@intel.com>
X-ClientProxiedBy: SJ0PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:a03:331::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4963:EE_
X-MS-Office365-Filtering-Correlation-Id: 666b37cd-2706-448b-6243-08dc65668967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0KBH20OgQa15zPf7RZDVdMW1rHu+2XN//1S6ZEgPDVZXnA6i+lUIhn8GUb9F?=
 =?us-ascii?Q?Jy4SYt3CD9usP7Ubq5s2BF9HWqHtfzgWrInYEAvxjCzqY1klypbDOLPEe+Bz?=
 =?us-ascii?Q?wUuZ016ie9QaU3rcFQMgNokz4GjFaI1bQ4pSe/LT2JCIwhunz+deiBDF7AJ5?=
 =?us-ascii?Q?mZI31wMyKEl2/4o7m9/Ha9OTpV3gpySNGrRR94RIMuZtSwaSZgTWfFsDw3Bk?=
 =?us-ascii?Q?Mj8HS5iu68+H/JhRbHSnc8t+K/s8y875k1FmiL3TUY2DMMzoozwOY+sOO+t4?=
 =?us-ascii?Q?kKZZYNHJMoT40jkWISSaR8kUw4AYavIyE8tQHopawYfwca0nzO8zGb+KwPRd?=
 =?us-ascii?Q?BC6plaKlPIWKHk8FQf1Jdiu0L5gvyf3pvGV4Tngf5QoWHfRoKhfZb+GRRo1z?=
 =?us-ascii?Q?rdshtTZMWOVJedWHFNOt1sC8PcGJDcajuozE2RaoHZt3wuErAANkMmeHnUXc?=
 =?us-ascii?Q?MFaT3asoPcJ5CQnQ08H3XlUp7piPvp8izfX3CFQrm0Pq7jjiGnP9NyRlNJLm?=
 =?us-ascii?Q?2v5jKy5yEJ8AJQXWCGj9Hddm+CWlgf10v6YzPhxm50g0IEX9hTgdJZZgZjwE?=
 =?us-ascii?Q?v5hG9sCkx7YKS5bkjB7csqSsQrl9oaGMbQfZGedtIybQK5ETuMs5lMbXWf7n?=
 =?us-ascii?Q?oE5BWQVaNqy8Hs2ayBSu7D0/YWdcfgvOCok6RF4XVGO043gFg/2DRaZ6jPMp?=
 =?us-ascii?Q?/mYVwRRPrgh/OwjlwLyMVi3I4ybI6Wzg42TNYBhfzUBOZ/bLiYuCHlQCOP8H?=
 =?us-ascii?Q?KMYC722lsK2N2jEndTXCosD4kcvfIsKMc+5l4CYK9Z4B+hFwJZPFHeBoSxeU?=
 =?us-ascii?Q?Keg7SBwQh+rnS67lhCv5gJQS9pS9GmBZWhRyAfYJs6za6K2rHtdVA1VGfY9f?=
 =?us-ascii?Q?+ISzY7nVigbq2ugdOWK7fA+2IN8K8FWh+2yIJfSetvwBt5UFCM6v1bmPm+gt?=
 =?us-ascii?Q?gzlnHmI/2GgbK5Du0itOxaqXt8mKmqWYjbW+v2uTCgIvorsmt1Fw8Dps67xr?=
 =?us-ascii?Q?uV3Xn2GglIqdpvbeKET6vKlBpBAWJGOHyV5Yx21XFNveVD7uVTFEk+7I2bHo?=
 =?us-ascii?Q?KpP68O9z6N/ViHghEghJTu8TVmqESElzoAjcTog6bZSVj+riQpXzOIW4Nr4O?=
 =?us-ascii?Q?MvhD139WWslXF7LdZ+pjCprIqWQGL25XeEaYdfPlUhU9CAkbT1FnT1IGuo3K?=
 =?us-ascii?Q?sd/SuLNiGVsdXNBwYYyQTGFd8ltCRwtkWZrOT45PRbpcBWUbaBvRxvXUzdpz?=
 =?us-ascii?Q?G8c3+BiSa7oRvvv/8yarYtC56+oleAGl5YUnSq5HOg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PKiZGcG+FXmiVS0kTJhm5MXQaz7hERpyvR4PleyOxf5ygRfLNaFxU0LZnNkR?=
 =?us-ascii?Q?KwwqEK+EjPo5oiw+cuuyomob52r713MtW4PBC/924fj22FbfFDBHXB+/YTUp?=
 =?us-ascii?Q?3YGatgCEAGgO73+J4oj28XOP2Oq9mm2vyYP9ie40fiLsmZJeZsqOHOApLqH7?=
 =?us-ascii?Q?RlAtWDz0QqvC6X7838UoiUe5NAmdFCNVa8MUJyXu5NfJTFWTBx8lPhwkCT03?=
 =?us-ascii?Q?J6dTunwBWFQi8pPN99yoetgtPUbxjgbhxjg1U7zJ3tSN9azM3g0R5vgepOIw?=
 =?us-ascii?Q?20RZ9SRCdaiu1csvkg8iXoG3esGSw7kY6aajYuNzP7FWwteKmwvzeBRmjdb/?=
 =?us-ascii?Q?3FjxvtIsfqSLXDSBY/9MfuW71+Ic8PuyYC5hgpwFLLMp2rdKm+LDk8K9C9JS?=
 =?us-ascii?Q?TKQb+6aINT3rGTmzTyWwDR9Y0hjOiDlqLrKlgMjuKHfFf46zC4RiKRPmEE3a?=
 =?us-ascii?Q?JKSsdmY+dKLO57A6xffm45JdMVwXmB+0PKoN8KtE65sir0PzcbOXCqqdhbEv?=
 =?us-ascii?Q?P3dmE9vdBIZmlDHu+esGycM2FN7tPBT1kIatjmzxzPyj3ZXBfY8mKTZIB4p0?=
 =?us-ascii?Q?jUXm3TvhdvbgeZ/+v4uEqSX+HaNV/IySUatSi4Mj3t/zt6MvBWJA7xStXLA3?=
 =?us-ascii?Q?FwaK1aftAGV4b3u4KEquSoCUIEmrrYfecsyVq5CouZhXLuHpRxLz0y+hyQkP?=
 =?us-ascii?Q?FYQDvm6Ftsn5Tz3s1NtdRuJlfQwY8R2IpK7fZ4O/8zTXkeZ8CSa/JTDjnwsw?=
 =?us-ascii?Q?Cmp494dpyPvmLdZ/v79S3mDH3+luWmwpksZZfswo9pB2fCtC0VvFM35IRZuW?=
 =?us-ascii?Q?zDcCEYPH+XyQ2aaP+c5K4nNkNJeNO7UWBkx33KGgAEVoDrltjTp6KjvKbgr0?=
 =?us-ascii?Q?MSzfda6Q4FTTjF7e+743Qb73FzaWuGZ6EctA/JgSr72NrEhnVKcNQHXuCRcc?=
 =?us-ascii?Q?R2B36cVekDiiO3tulhwERogUuwZq7PBX7tvZWKribKAyrL3Av9cfvCcMOlAY?=
 =?us-ascii?Q?Ml4Wcw6s0bPdGq0Va/SzUiQAH0NS4Wx4YqXuYKe8YnI00FoOoo6tLeV8N6si?=
 =?us-ascii?Q?qsDYcthP3HMR3MdE5+MYAYWM9MX52SMQ6noEIkfgaMn+NqVl2wWkkudhjTLL?=
 =?us-ascii?Q?jreMpweJonJQl66u8NDShRB8ka4jZFEk2hCTblk9Bp2ws2jnbn531CY9RdhQ?=
 =?us-ascii?Q?j5RA/FqPf58QrscwsZAUrZJuBQWcxTABIeUPQc539eegX3tGGpI/7BNGsmQo?=
 =?us-ascii?Q?tZVW0Ls0CGAVDPcOXx2LDRnV7hnxPDvjDOAUf92ssrN/JpM+TjE2BMXOiQjY?=
 =?us-ascii?Q?eKtJ5Z8NS/rJcegvsL4o7I7Fyy7VAuV3qotn092Ebi6zjQnRXlSIeX0Y0Sx/?=
 =?us-ascii?Q?y9lXwtAGiq70Np4IG7T4bTKW/bm2QlSsvtdNLwd4LVc6Uj6UcJ5+WkPW54R8?=
 =?us-ascii?Q?Gxxj6sjW9kumS1AUyw7UL1nEGIgVzhP5OjEN+wSD1DLArFYTrlCGIyQmM539?=
 =?us-ascii?Q?kuJUIKzpA01//1FTM4c6AycCV6vfvk0dnsSxFWeZBNVLN6Z00nbo/Q5SguTO?=
 =?us-ascii?Q?V+C+6F/ZhbwJUbvD9pM/3g0ccSdABbi5S52AF1/H5wH0r08di2ZnfC46yjo4?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 666b37cd-2706-448b-6243-08dc65668967
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 20:30:24.8353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fpdE3hvfrqUvVhAJNc7MSD8fbf1ueqWLMN8wEAkwfVqg5idWMtZlNKuu2axC+iLNW4SLPIGIvOybCY6wNcgHsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4963
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

On Thu, Apr 25, 2024 at 09:15:42PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 25.04.2024 19:46, Matthew Brost wrote:
> > On Thu, Apr 25, 2024 at 02:18:56PM +0200, Nirmoy Das wrote:
> >> Add engine name to the engine reset and cat error log
> >> which should be useful while debugging.
> >>
> >> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++--
> >>  1 file changed, 3 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> >> index c7d38469fb46..245e29d095c0 100644
> >> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> >> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> >> @@ -1655,7 +1655,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >>  	if (unlikely(!q))
> >>  		return -EPROTO;
> >>  
> >> -	drm_info(&xe->drm, "Engine reset: guc_id=%d", guc_id);
> >> +	drm_info(&xe->drm, "Engine reset: name=%s, guc_id=%d", q->hwe->name, guc_id);
> > 
> > I don't think q->hwe->name name is useful as it might not actually be
> > exec queue is running. I'd drop that, and replace with string indicating
> > the hardware engine class. 
> 
> and maybe it's also a good time to switch into GT-oriented logs:
> 
> -	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
> 
> 	xe_gt_info(gt, "Engine reset....

+1

Matt

> 
> > 
> >>  
> >>  	/* FIXME: Do error capture, most likely async */
> >>  
> >> @@ -1690,7 +1690,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> >>  	if (unlikely(!q))
> >>  		return -EPROTO;
> >>  
> >> -	drm_dbg(&xe->drm, "Engine memory cat error: guc_id=%d", guc_id);
> >> +	drm_dbg(&xe->drm, "Engine memory cat error: name=%s, guc_id=%d",
> >> +		q->hwe->name, guc_id);
> > 
> > Same here.
> > 
> > Matt
> > 
> >>  	trace_xe_exec_queue_memory_cat_error(q);
> >>  
> >>  	/* Treat the same as engine reset */
> >> -- 
> >> 2.42.0
> >>
