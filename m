Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D192FC3ABC5
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 15:31:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6715110E845;
	Wed,  7 May 2025 15:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y+UJ3drs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F7B10E82B;
 Wed,  7 May 2025 15:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746631889; x=1778167889;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Qr4AnBYW987xgEuMwPW0O8SNkjOdYyDH7+SBKrD5wjE=;
 b=Y+UJ3drsw/+ChE6D+/UWn/MJvCYwfu2IbyWk4tBHe93zv4Gm7lDVg1K/
 sICFecvw883WQZ/FGCUzNtw8sXwFC7yH2iYHqAfcen5dv52Xg9O0KcMGT
 mHgohc1RKQ/akeVykY8/e+KQoCy8LT8v63i+MwMywbfzNQRF/DykG0iKE
 xAMLe4JFcnUQx3lvWt3A7XxlAf8VR+jLt/HRILH3Lxd+X49Lnowz1anMM
 AdYQh9CDSznT//SaAfIA/vOKZ9yVuruxSYy0cKb3suHWe+hSVmBeaEhQ2
 M9wNpIPJhVRbxAUqCdkKkcEM2iMKtaCPKxtxKcFUjKn+4lMt+3Ih3YYO4 Q==;
X-CSE-ConnectionGUID: 79v6kudgTQuPy9ZXvJ5yEg==
X-CSE-MsgGUID: Jf6I+9pXSI+ZgmTPtRaM2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52188181"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="52188181"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 08:31:29 -0700
X-CSE-ConnectionGUID: wY3QIsuRTmiKchM34BGM6g==
X-CSE-MsgGUID: Z9gJ6xe4TcmZRIETVIq+8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="136509152"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.218])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 08:31:24 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>, "Hall, Christopher S"
 <christopher.s.hall@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Keller,
 Jacob E" <jacob.e.keller@intel.com>, "intel-wired-lan@lists.osuosl.org"
 <intel-wired-lan@lists.osuosl.org>, "Saarinen, Jani"
 <jani.saarinen@intel.com>, "Kurmi, Suresh Kumar"
 <suresh.kumar.kurmi@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, regressions@lists.linux.dev, "Linux regression
 tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Subject: Re: [Intel-wired-lan] [REGRESSION] v6.15-rc3: 1a931c4f5e68 ("igc:
 add lock preventing multiple simultaneous PTM transactions")
In-Reply-To: <2cc74d66-9bd7-4876-a17d-c71f03910c4d@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <SJ1PR11MB6129BBB9E38F6DB731604E94B9812@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <87cycnwcpn.fsf@intel.com>
 <2cc74d66-9bd7-4876-a17d-c71f03910c4d@intel.com>
Date: Wed, 07 May 2025 18:31:21 +0300
Message-ID: <87a57ov3na.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 06 May 2025, Tony Nguyen <anthony.l.nguyen@intel.com> wrote:
> On 5/5/2025 3:53 AM, Jani Nikula wrote:
>> On Mon, 28 Apr 2025, "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com> wrote:
>>> Hello Christopher,
>>>
>>> This mail is regarding a regression we are seeing in our CI runs[1] on drm-tip[2] repository.
>> 
>> The regressing commit is in v6.15-rc3. Updated subject and Cc'd
>> regression tracking.
>> 
>> BR,
>> Jani.
>
> Hi Jani,
>
> This should be resolved with commit c7d6cb96d5c3 ("igc: fix lock order 
> in igc_ptp_reset") in v6.15-rc5.

Thanks for the follow-up.

BR,
Jani.


-- 
Jani Nikula, Intel
