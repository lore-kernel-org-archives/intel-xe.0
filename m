Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399AACE8D78
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 11:55:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AEF10E027;
	Thu, 19 Sep 2024 11:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KIPZ0gQ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858E110E027
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 11:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726746914; x=1758282914;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=eZHu1GmcnxvcPIDnhObQygkmEYbjneTFLIofcvlfa6E=;
 b=KIPZ0gQ4p+eEGNa20+ThKliLAQ+1TpC5JHzshgt8qAOdzVTT9OWew6+G
 yuycC9wxw+VADPDS/1NYt8vS3Ih5NA0GplfIWeENxan+f9vDkgUekyviO
 ixQaZSXvK0qX2po9T4a0pUlmpeJjxgcCgVsdmz+vYQTgajljTDaND0sb4
 ymfUugotHbtqyPMrDrfPrNNaHdTs0JrW4BHs2Z3W5hfeGQzW/cK9lIm2N
 zUOPcAtgLqAG/B0vbA6BepMppeCTtVf+fdcrW1u80BJZrz3BpuOkv1PWy
 +q9B8YjaDW2tRoYbvf+SD02Xlj/zyjx91ksSIeG8KC6zFTm3dreQDSPf/ w==;
X-CSE-ConnectionGUID: w9ddYNalQZSX2eGGag/esg==
X-CSE-MsgGUID: 7kTbqaLeR1e6yajlh4+KOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="37082486"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="37082486"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 04:55:14 -0700
X-CSE-ConnectionGUID: +hDa3kOxTwm7r9DLHxHUkQ==
X-CSE-MsgGUID: nvNNYG03QQ29MgDieIoTaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="74697040"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 04:55:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>
Cc: intel-xe@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH 2/3] drm/xe/pciids: Add PVC's PCI device ID macros
In-Reply-To: <Ztsmyp6L4vZEtad6@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1725624296.git.jani.nikula@intel.com>
 <6ac1829493a53a3fec889c746648d627a0296892.1725624296.git.jani.nikula@intel.com>
 <Ztsmyp6L4vZEtad6@intel.com>
Date: Thu, 19 Sep 2024 14:55:08 +0300
Message-ID: <874j6bameb.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 06 Sep 2024, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Fri, Sep 06, 2024 at 03:06:03PM +0300, Jani Nikula wrote:
>> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>=20
>> Add PVC PCI IDs to the xe_pciids.h header. They're not yet used in the
>> driver.
>>=20
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>=20
>> ---
>>=20
>> This is for drm-xe-next. Functionally, having the PCI IDs defined
>> doesn't mean anything, but it's easier all around to not carry these in
>> xe-for-CI.
>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
>
> either way works for me. I believe that recently we got more conflicts
> on the other file, then in this one here. But I believe it makes
> more sense this way since this file can be more cleanly synced in IGT...
>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

I merged this one to drm-xe-next with Sima's IRC ack.

The drm-tip rebuild works, and handles the merge just fine. But I can't
apply patches 1 and 3 to topic/xe-for-CI, because it won't build
standalone. It needs a rebase on drm-xe-next, but I can't push that:

remote: GitLab: You are not allowed to force push code to a protected branc=
h on this project.
To ssh://gitlab.freedesktop.org/drm/xe/kernel.git
 ! [remote rejected]           topic/xe-for-CI -> topic/xe-for-CI (pre-rece=
ive hook declined)
error: failed to push some refs to 'ssh://gitlab.freedesktop.org/drm/xe/ker=
nel.git'

I'll have to leave the cleanup to you.

BR,
Jani.


>
>> ---
>>  include/drm/intel/xe_pciids.h | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>=20
>> diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids=
.h
>> index 644872a35c35..73d972a8aca1 100644
>> --- a/include/drm/intel/xe_pciids.h
>> +++ b/include/drm/intel/xe_pciids.h
>> @@ -187,6 +187,22 @@
>>  	MACRO__(0x7DD1, ## __VA_ARGS__),        \
>>  	MACRO__(0x7DD5, ## __VA_ARGS__)
>>=20=20
>> +/* PVC */
>> +#define XE_PVC_IDS(MACRO__, ...)		\
>> +	MACRO__(0x0B69, ## __VA_ARGS__),	\
>> +	MACRO__(0x0B6E, ## __VA_ARGS__),	\
>> +	MACRO__(0x0BD4, ## __VA_ARGS__),	\
>> +	MACRO__(0x0BD5, ## __VA_ARGS__),	\
>> +	MACRO__(0x0BD6, ## __VA_ARGS__),	\
>> +	MACRO__(0x0BD7, ## __VA_ARGS__),	\
>> +	MACRO__(0x0BD8, ## __VA_ARGS__),	\
>> +	MACRO__(0x0BD9, ## __VA_ARGS__),	\
>> +	MACRO__(0x0BDA, ## __VA_ARGS__),	\
>> +	MACRO__(0x0BDB, ## __VA_ARGS__),	\
>> +	MACRO__(0x0BE0, ## __VA_ARGS__),	\
>> +	MACRO__(0x0BE1, ## __VA_ARGS__),	\
>> +	MACRO__(0x0BE5, ## __VA_ARGS__)
>> +
>>  #define XE_LNL_IDS(MACRO__, ...) \
>>  	MACRO__(0x6420, ## __VA_ARGS__), \
>>  	MACRO__(0x64A0, ## __VA_ARGS__), \
>> --=20
>> 2.39.2
>>=20

--=20
Jani Nikula, Intel
