Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4450EEEC2A0
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 22:31:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B1810E45A;
	Mon, 23 Feb 2026 22:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ek0utXGy";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE8010E45A;
 Mon, 23 Feb 2026 22:31:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A7BD9600AE;
 Mon, 23 Feb 2026 22:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 537CAC116C6;
 Mon, 23 Feb 2026 22:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771885882;
 bh=1WD9xeosHoEBtsVYyWwa4VxQ1sSPNWP0Pr+iMgVpsKM=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=ek0utXGynzy0ukSzdHJQxPwcBlfPugCsSAsIUF3l69ub5/30nsDItHtx90euy63Q5
 59M1RX81HxhoFZrTPwcSLbEJVcgcjmm0THAZlML6bBqOhV/Q/HlmkNKcQV2GPLxMpy
 JxZUZlXfWG/v70VadAMk4uhcomGX3m4RbOQQr3Pl+gEQk35FFucakxNCxKs6fSUrBq
 6ps6K7xcFdLtJfMO4+MjaYmlWlq3jHCMlOflmnNxhubz5YoQtcsyCS0oVsoKENcg6Q
 K+qBq4vd4UGHTgwL92asu8VFl/m7UB1njptxAN112amazRJdnwIyrkrOL9E+9Julrp
 jM7SWwqERWLJg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 23:31:18 +0100
Message-Id: <DGMP4FBY8958.1KNWJH7IW7M3I@kernel.org>
Subject: Re: [PATCH v3 1/3] gpu/buddy: fix module_init() usage
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Greg KH"
 <gregkh@linuxfoundation.org>, <dri-devel@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, "Matthew Auld" <matthew.auld@intel.com>,
 "Dave Airlie" <airlied@redhat.com>, "Peter Senna Tschudin"
 <peter.senna@linux.intel.com>, <stable@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>, "Arun Pravin"
 <arunpravin.paneerselvam@amd.com>
To: "Koen Koning" <koen.koning@linux.intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <DGJPMOESHINC.1NGNT8LLY8DKW@kernel.org>
 <1771594440.99434@nvidia.com> <2026022156-citizen-shredding-5d6d@gregkh>
 <cdc31857-c9a0-4d05-a243-780dc9819cb7@nvidia.com>
 <b45a50ce-de96-42ee-90c1-0a6cd7a78cc0@linux.intel.com>
 <DGMAUQLZGPZB.FWELZM9GYP0Z@kernel.org>
In-Reply-To: <DGMAUQLZGPZB.FWELZM9GYP0Z@kernel.org>
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

(Cc: Arun)

On Mon Feb 23, 2026 at 12:20 PM CET, Danilo Krummrich wrote:
> On Mon Feb 23, 2026 at 12:17 PM CET, Koen Koning wrote:
>> Thanks that makes sense, then let's just stick to addressing the current=
=20
>> regression with gpu/buddy in the drm-tip tree.
>
> The patch should go into drm-misc-next.
>
>> Joel, could you grab the v1 of this patchset (or the v2 with with=20
>> subsys_initcall, either works) and try to get it applied to drm-tip?=20
>> Since this is my first time submitting patches, I'm not really sure how=
=20
>> to proceed from here, and it will probably be faster if you have a look.
>
> I think we should land your original v1; I don't know if Joel can push to
> drm-misc-next, if not please let me know, I can pick it up then.

Actually, since GPU buddy has a separate maintainers entry, I will leave it=
 to
Matthew and Arun.

(Cc'd you both on v1.)

Thanks,
Danilo
