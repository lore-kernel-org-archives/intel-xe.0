Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE27AE64012
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 20:53:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B76010E1F7;
	Thu, 21 Nov 2024 20:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fYgsJJXk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BEE10E053
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Nov 2024 20:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732222404; x=1763758404;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=irQgqODSepXMvJOpGYRvOegtXmM9C4zKIzjoJFU0rsE=;
 b=fYgsJJXkoZeTGW381Gy6M7hTt/SAKzXbYL36rC7j2cR1xUnfIyo9etTy
 66eKOrX5ggtJ8lfEfflb+i9v5xujMrH8A1TMOWsjqw+2R6HkZZc0RrDdO
 /ocoR/fGGCHNRgDDbJGgO0YoKL3CFju9/TjNkZwQat3yV5TKQapq/cKSn
 Utk3WcSAwvo/Tmj2fsNJqw4o3zoz6vndZu50YXMPW8KJHGCrvlh+T6igq
 RH5PHRvJprkDtqW+uvWx8z2hzcmRG7JqDN18WopCRsPBiu2JPYtFWsj4V
 CBQmeSIusa0fq8xBDWVXKC8y9u/ikxTQ00lkQh/hVE5z/t9d+lHV/XlIN Q==;
X-CSE-ConnectionGUID: xsvLL8MIRQGuBlFWMO0cdw==
X-CSE-MsgGUID: PMIzTZV2R1GVUdK0bicaqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32600939"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32600939"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 12:53:24 -0800
X-CSE-ConnectionGUID: aBi1sbdDQIuKPMQr9e7iFg==
X-CSE-MsgGUID: M5KxNcdjQL2clwjMYI5eMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="90172583"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.234])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 12:53:23 -0800
Date: Thu, 21 Nov 2024 14:53:18 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>, 
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] drm/xe: Use new force-wake guard class in xe_mocs.c
Message-ID: <ybziwoe3kxpv4mlbvei3sontpizglivnhdxgald65wkyqxic2h@6pgh4u5eqeqg>
References: <20241118184511.258-1-michal.wajdeczko@intel.com>
 <20241118184511.258-3-michal.wajdeczko@intel.com>
 <q6oftdodc3xpjczeddv3ghr2c5msrqgekbz3f34yi5leg4hz22@dwodxaqpk6pd>
 <Zz69Ksdzuqb4TO1v@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Zz69Ksdzuqb4TO1v@lstrano-desk.jf.intel.com>
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

On Wed, Nov 20, 2024 at 08:55:06PM -0800, Matthew Brost wrote:
>On Tue, Nov 19, 2024 at 02:03:12PM -0600, Lucas De Marchi wrote:
>> On Mon, Nov 18, 2024 at 07:45:11PM +0100, Michal Wajdeczko wrote:
>> > Start using new xe_fw class to minimize risk of leaking force-wake
>> > references.
>> >
>> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> > ---
>> > v2: rebased
>> > ---
>> > drivers/gpu/drm/xe/xe_mocs.c | 10 +++-------
>> > 1 file changed, 3 insertions(+), 7 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
>> > index 54d199b5cfb2..f18aaa6595c7 100644
>> > --- a/drivers/gpu/drm/xe/xe_mocs.c
>> > +++ b/drivers/gpu/drm/xe/xe_mocs.c
>> > @@ -776,19 +776,15 @@ void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
>> > {
>> > 	struct xe_device *xe = gt_to_xe(gt);
>> > 	struct xe_mocs_info table;
>> > -	unsigned int fw_ref, flags;
>> > +	unsigned int flags;
>> >
>> > 	flags = get_mocs_settings(xe, &table);
>> >
>> > 	xe_pm_runtime_get_noresume(xe);
>> > -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> > -	if (!fw_ref)
>> > -		goto err_fw;
>> >
>> > -	table.ops->dump(&table, flags, gt, p);
>> > +	scoped_guard(xe_fw, gt_to_fw(gt), XE_FW_GT)
>> > +		table.ops->dump(&table, flags, gt, p);
>>
>>
>> afair one caveat is that you can't have a goto that jumps over guard
>> because of the usage of the cleanup attribute. Is that still the case or
>> do we have some magic convincing the compiler to do the right thing?
>>
>> once we get agreement on the approach, please let's convert everything
>> that can be converted to scoped guard so we don't have to keep both
>> approaches for a long time.
>>
>
>+1. I've come around to using (scoped) guard but if we commit to this I
>do think we should try to overhaul the driver to use this more or less
>everywhere it makes sense (e.g. fw, spin locks, mutexes, perhaps some pm
>refs where the ref is only held within scope, also maybe also tmp object
>refs?). Having a single sematic IMO makes it easier to quickly understand
>different code paths. Maybe we even put the agreement in some kernel doc
>too.
>
>Can stage this a piece at time too, e.g., A series which converts spin
>locks to scoped guard, etc...
>
>Anything simple which also doesn't fix into patterns handled by scoped
>guard we could also review if the complexity is required and if it is
>flag for comments so we can understand why it is needed. I know for sure
>I've added odd coding patterns which are required, don't have a comment
>why I did it, only to forget why later which is not great for long term
>maintainability.
>
>Obviously complex locking patterns, e.g., the VM lock's + drm exec, will
>still need to be open coded /w unwinds but that locking itself is or
>should be documented too.

Ack to get started with the xe_fw and then we can provide separate
series to convert the others.

Lucas De Marchi
