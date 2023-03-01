Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D070C7EE23
	for <intel-xe@archiver.kernel.org>; Wed,  1 Mar 2023 23:14:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44D310E286;
	Wed,  1 Mar 2023 23:14:59 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5944D10E286
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Mar 2023 23:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677712497; x=1709248497;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vmVjDYXryGUa0gbDCDCp66nhC3F4vPOVDuG8/Qx4GsA=;
 b=VyzJCCAWOst6/L55u73Y7qii7+Wucgqe6KJ53GPqGSMRc0qXEQZYVTfX
 nD3FPW0jPVksC8TIBU0PCS39Q0siM1SXi85Zh8LTAyPMu3QBQ8/Zx0DaH
 8DBmljy1YkA4fkt7BexQBG7HZGvA2xaEKxHWZ5k7m4Lpc132/eV6fCiNW
 02oCj2iGIBXWG+4pKTKmqrR1mbkkYtcDJSIBIOGEmPBfoRxJSGJ9PyN/5
 TTrmgoWV+GOadmiR15FHC2+vhIWi6hvAOEBnxpgMggjZKUf4hnz8Wkpw7
 8J40WHE2VzulKLOvChh9sHrk+wDUMwtGO0ItkC/YOaOvKF9bmy3fROFdy w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="318351353"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="318351353"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 15:14:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="705028940"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="705028940"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 01 Mar 2023 15:14:55 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 1 Mar 2023 15:14:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 1 Mar 2023 15:14:55 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 1 Mar 2023 15:14:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6Pg+D9JJNmEXFhe4Edl3XbJ7fAHz48G6ZEdi5iv45Y0pWKrqOKZQGkhkCjwTsmn96prp0sj6Lq/IvbOIj26/QGGMn/nqLOzJXj6nRBSzfreF/aWt+pHzpizyPkw440gSEosUyrgZxD8h+Ot6OYRI/6SozLAZWCicmtrMo5rDlVqi/NmBD3bristGnMOtleT8v4X5AU5B7VAsPlYLBZC5q/YZLCMsKekz9Sh3I1REVV4uI+pgE+p7MfDOk3J260hukaWEGVQnrORr6kteuD7K6Z566JzU0mZuTGjEIf413ybVJYgh/OqPCwjy50kFzAFlR7/0Mim8TYr1LnV6NuEZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkaD2CKIUxxAtLWmmRn4MywpV6itWLnQis+7lio/ER4=;
 b=ISoivSwnFuoZhYuCZhxQb/RlMD4YFZazEA+djYb4whBcXzNTYvuQtamjfOCLIwo6BQcII+BYkFFtwsyWP5Q6UkPn0qu7Ta4LQZP8mz/92gdmIBqENhY6ZkYXPf2iwentUmlHKVDp8Ps0YptldZ/DkW54e2BVHwik/seCpm4hvihwN/tnb1yhhGHvNQQtKu8hDFq/OesFDxSD4KAn76tv+bLflsQxkem8QiCGxWaJnC6SgE0wic42sEyYlQl3+xzC1+/nXqElTfMWHzftHzH8/O+DybBUK6Pw14teCZ8TPm6EogcoXmVRkdOdHzwcz6DPm9K6h7QHkG/G+R3pc07PbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7639.namprd11.prod.outlook.com (2603:10b6:806:32a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Wed, 1 Mar
 2023 23:14:53 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6134.027; Wed, 1 Mar 2023
 23:14:53 +0000
Date: Wed, 1 Mar 2023 18:14:48 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y//caMLc8YAqOB9Q@intel.com>
References: <20230228101730.63294-1-maarten.lankhorst@linux.intel.com>
 <20230301163629.axukda67v4rsqb3l@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230301163629.axukda67v4rsqb3l@ldmartin-desk2.lan>
X-ClientProxiedBy: BYAPR07CA0076.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7639:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ddfdad4-bc07-4401-91eb-08db1aaac344
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: li08bdwtEBpFxauG8rI3w96uZkaUzGofYXkG6dD9XIUPFtV7sAo2lXNelPhA0q56HrY4ujg1kBhHTOqlSJgqE2B0NSrEeCfyFKlxGxtCjMOknz0Vkhkv8tAM7/tDGI6ds7iFsxMHibILWS/d48QkkLwzi3a+Sa5rY9QlkKCm/mn/rE+xnzpCUAVkT+KPFdKQ9kBjuINBUoOSjqKtFad6fSoQaUMy+OdaIWqgF6bFpLC+M+NeFGlfeF2ZiYlE5UZIVyGFQEe/9Acjce/scucDoKn6as4WAL96KLRhx2rTtwhDY58dnxEkOEVpdBuqu1dVnH9rPIz0198twRW4CzfPkCqejtmYemwe2+hZTleOEZvbLjIRpRdfnFXQ3s6JzLxyxKHIIrFTRutaYe2Jc+FQZYvDbzLABDzjFSUmwULHcaPp1j4eKLII8zlNAJoFxgBBCOAhNrpy5hp12JAeP73VpJKi006AUcAXcbeo8vtX2l5hA68x5i1T5JvlnkEp2IzcjV4f/rXaAmmgfx920Xb6XmP8+Iipjg1B3FzFa48YpvR4TsXr8CqPSoZ7eXINc4Rd9bkt92s335XPAua7FbEqzkOjz+ivVK2sbxvtBaSaiFOQR0eexYgm7RjSvp6tZD9HJ/jYNbyrqg6mT46seLJ3ew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(366004)(376002)(39860400002)(346002)(451199018)(36756003)(6666004)(6512007)(6486002)(4326008)(6506007)(2616005)(186003)(26005)(6636002)(41300700001)(316002)(37006003)(8676002)(66476007)(66556008)(66946007)(44832011)(2906002)(478600001)(8936002)(86362001)(82960400001)(5660300002)(6862004)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KyiljaK8W9RxOtkWrOUWHGTpcNVEymx1Kz3gPy+X1pR0A7dAvDkcOHZahSD3?=
 =?us-ascii?Q?90OYjmFEu5SseGxLt5CBWzqZrcaE3bTvWdbk5gO5USTu/Zc6TcR8ei0RzjVd?=
 =?us-ascii?Q?ZfnvoEF72Uhk292fi4OlfxTY3Rm+28hWyhyW8riSSZOIWGh3VM54gGs1s3B5?=
 =?us-ascii?Q?FZddWuVmYSTuaRGWfabPGLJbM1JRl9nXplnlpahiAA+EL4FmBhVb0cshRD94?=
 =?us-ascii?Q?lx1AiJqNZgplwQIWwJABoVeFpyKUgD2e+kZpW5R+luscLISUqWhb0Yf+C8z0?=
 =?us-ascii?Q?Cipexd+aiq1H2H+ncYIiXr9O8NHn+9YMifAfL3K8Y6e9sFdgNpSJpWidbNex?=
 =?us-ascii?Q?BIUxD6M5P+eD7Qt8JaP4J1DWxQi1ibN3ooeznopTpIzZfGZx8qnd61pMR9W6?=
 =?us-ascii?Q?NpqVMWeAZdM9dkVQORfipXLi8E4WEz7YmS+r88lB7luSWmS0dDzAKLKgF8cl?=
 =?us-ascii?Q?L1DNd6Eiv7sSi8fFSMsFw0AvoqSeo5ukHINu5f3DodJQaA/1xjT+BZBiDubA?=
 =?us-ascii?Q?fwMqjwnIapBHnHTq6QfoCpppzmbQIQVIWPCUvo+JmEoXyHoHz0WH6vD4McW2?=
 =?us-ascii?Q?5w4OasOfBnkFlDGybe4rjnITR3QYleCV7osB8QT5MGh2g99E9bMxga2uQNSI?=
 =?us-ascii?Q?laAv1Wt8E05/6Csf622okHY+VvpdrBOgfosLZnt+gH7F82prD+zrFp9lgt1y?=
 =?us-ascii?Q?CmxakIcf6mT9BRsM76MImDSRnNB8EDEW7/0T3rdmA3fyfAlAwyi2XOMjKeD5?=
 =?us-ascii?Q?qsAV1eb75AjL1wtaQeGDCtT/AoBIhMDrLbPQmTt0Q0j7TjDvpEB3fJALIcWt?=
 =?us-ascii?Q?P3b0osQzc1MN09uTgw/mlO1WnVCAhTfJ/4e0QTCApQdadQvCSezRubp5qcJB?=
 =?us-ascii?Q?VH6Jd+c9a0KkGLM6UWZu4mB+dHfWg6tciIAlGgXiGyJOdhc0WjUS7JIpUx65?=
 =?us-ascii?Q?pE3xvFtxwHbDDz6hKHrSR0Q4FeAkN4weiclJpeAmXueYeaQozvArhYys05P4?=
 =?us-ascii?Q?t73FDIOzKGWK+yIpXSLyerrxQbAUQxecZbmiwCFTPqkTVtGEFslTNUQKmZy4?=
 =?us-ascii?Q?ZD2eMUXTxqjIQyCIQ/WhbYvPyDcF6PI0nechIwbnvUReHOb/wQv+gdEtzliF?=
 =?us-ascii?Q?nb2M+uViVVP9ONGFdzD+ZpExxTMdndhHkSegW6HcZy3yz15MynKPdHF1nNJq?=
 =?us-ascii?Q?EAaiStS2rX+y6qni/iNidRatI8O+6Ya4z5ulSzQcAmWUf3wlsiBgKD+g/X+0?=
 =?us-ascii?Q?fLk/A+Naa7lnDnMPmUPP8vfMsa0sH/wuYM3XHl2OlKZVffJQPY/dLa4OGeoY?=
 =?us-ascii?Q?xulqcO0x2Bu3d3ZML48F+a0qMsibIfKg/UqkLAZQYzHZyz9CiHtl4kM8yDS9?=
 =?us-ascii?Q?6jBHdwNtBlQaI0fSWVv/u7cIHu3H1Uv6Fklj+ZSeV0sFQUAd//qY7hoqiGYi?=
 =?us-ascii?Q?tF/aWlfkqXSAAut2fSm6xVjEKw4VZ7QGPCX5eZSJBmRc00CcfSKnOqsk3Zdn?=
 =?us-ascii?Q?8Hb21tzrX5JCSWcMsXGQZlR87Q75wN079qrwprgo5+4PYbDkBHiM9eFQt95D?=
 =?us-ascii?Q?9xzxEYdZpBoMafRpJ7pmjeO+WiMhLj0JRjwzRijs527hV6Lpfrj0ESEeaTOg?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ddfdad4-bc07-4401-91eb-08db1aaac344
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 23:14:52.8838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNdyINMIK6JTfG6KmAbGv+DX0CrCJdfGrsVkyIby8I8rqL8MttiGQhJ1/rIlWcBIE4J/fjoX5ISFszEbhPtYeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7639
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Use atomic instead of mutex for
 xe_device_mem_access_ongoing
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Mar 01, 2023 at 08:36:29AM -0800, Lucas De Marchi wrote:
> On Tue, Feb 28, 2023 at 11:17:30AM +0100, Maarten Lankhorst wrote:
> > xe_guc_ct_fast_path() is called from an irq context, and cannot lock
> > the mutex used by xe_device_mem_access_ongoing().
> > 
> > Fortunately it is easy to fix, and the atomic guarantees are good enough
> > to ensure xe->mem_access.hold_rpm is set before last ref is dropped.
> > 
> > As far as I can tell, the runtime ref in device access should be
> > killable, but don't dare to do it yet.
> 
> I don't follow this last paragraph. Could you point it in the code?

I also didn't understand this... if we remove that we will end up in
memory access with the sleeping device...

> 
> > 
> > Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_device.c       | 17 ++++++++---------
> > drivers/gpu/drm/xe/xe_device.h       | 14 ++++----------
> > drivers/gpu/drm/xe/xe_device_types.h |  4 +---
> > 3 files changed, 13 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 4eb6786b11f0..ab179b1e24c1 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -237,7 +237,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> > 	if (err)
> > 		goto err;
> > 
> > -	mutex_init(&xe->mem_access.lock);
> > 	return xe;
> > 
> > err_put:
> > @@ -424,25 +423,25 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
> > void xe_device_mem_access_get(struct xe_device *xe)
> > {
> > 	bool resumed = xe_pm_runtime_resume_if_suspended(xe);
> > +	int ref = atomic_inc_return(&xe->mem_access.ref);
> 
> 
> +Matt Brost
> 
> Any reason for not using kref?

hmmm... my bad actually...

I did considered the kref, but I can't remember why I haven't used it.
I recently was asking myself the same question.

> 
> Lucas De Marchi
> 
> > 
> > -	mutex_lock(&xe->mem_access.lock);
> > -	if (xe->mem_access.ref++ == 0)
> > +	if (ref == 1)
> > 		xe->mem_access.hold_rpm = xe_pm_runtime_get_if_active(xe);

hmmm... I'm afraid this can be tricky without locks...

if we have 3 simultaneous threads calling this.
get
get
put
get

and they happened in this order but the resume didn't finished yet
on the first one, then you will:
1. end up the runtime pm twice.
2. the second will pass over thinking the gpu is already awake, but it might
be still asleep.

> > -	mutex_unlock(&xe->mem_access.lock);
> > 
> > 	/* The usage counter increased if device was immediately resumed */
> > 	if (resumed)
> > 		xe_pm_runtime_put(xe);
> > 
> > -	XE_WARN_ON(xe->mem_access.ref == S32_MAX);
> > +	XE_WARN_ON(ref == S32_MAX);
> > }
> > 
> > void xe_device_mem_access_put(struct xe_device *xe)
> > {
> > -	mutex_lock(&xe->mem_access.lock);
> > -	if (--xe->mem_access.ref == 0 && xe->mem_access.hold_rpm)
> > +	bool hold = xe->mem_access.hold_rpm;
> > +	int ref = atomic_dec_return(&xe->mem_access.ref);
> > +
> > +	if (!ref && hold)
> > 		xe_pm_runtime_put(xe);
> > -	mutex_unlock(&xe->mem_access.lock);
> > 
> > -	XE_WARN_ON(xe->mem_access.ref < 0);
> > +	XE_WARN_ON(ref < 0);
> > }
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index 263620953c3b..96b4f3d7969e 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -90,20 +90,14 @@ static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
> > void xe_device_mem_access_get(struct xe_device *xe);
> > void xe_device_mem_access_put(struct xe_device *xe);
> > 
> > -static inline void xe_device_assert_mem_access(struct xe_device *xe)
> > +static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
> > {
> > -	XE_WARN_ON(!xe->mem_access.ref);
> > +	return atomic_read(&xe->mem_access.ref);
> > }
> > 
> > -static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
> > +static inline void xe_device_assert_mem_access(struct xe_device *xe)
> > {
> > -	bool ret;
> > -
> > -	mutex_lock(&xe->mem_access.lock);
> > -	ret = xe->mem_access.ref;
> > -	mutex_unlock(&xe->mem_access.lock);
> > -
> > -	return ret;
> > +	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
> > }
> > 
> > static inline bool xe_device_in_fault_mode(struct xe_device *xe)
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 9743987fc883..0b8c4ee0ad48 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -230,10 +230,8 @@ struct xe_device {
> > 	 * triggering additional actions when they occur.
> > 	 */
> > 	struct {
> > -		/** @lock: protect the ref count */
> > -		struct mutex lock;
> > 		/** @ref: ref count of memory accesses */
> > -		s32 ref;
> > +		atomic_t ref;
> > 		/** @hold_rpm: need to put rpm ref back at the end */
> > 		bool hold_rpm;
> > 	} mem_access;
> > -- 
> > 2.34.1
> > 
