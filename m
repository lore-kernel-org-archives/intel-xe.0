Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57B9E7717D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 14:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF15410F042;
	Fri, 13 Dec 2024 14:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJOqb3NI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292A610F042
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 14:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734100703; x=1765636703;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=V565VeteHmsGX0PTztF/H4lCB3jAmpMc9y6MLr+Xnnc=;
 b=AJOqb3NIPBWXm8omspDsGopdHQ4nw93Y3jryvMzrxkYnPFUISI9zLMiE
 er3k1W2zwRdmD/kV+63r67bVub/LLVYaNv5FLhxQ+htphPXDYOyLqB55D
 vvj/VfGcL3ioYftP+veEeymvtBBNEqMleM4UA9h3VP6p17U7jV4SNbTAn
 +hAgsrdh6/ddYWyMIJOxbVSABxpAI5uNeRsNFksoevXJ4xxlmyBhdgnvS
 8KsBeqVFB6QgT+iLc+0nnVwnjg7cHjt5hqz7fsaKUVhqXk9zCPVjG3ZFc
 ELRgATN2Wnt4Mr71NbxBkHRX7z+3ICVAGmQ/lEJ+gUGvWMCl9sPfBib7K g==;
X-CSE-ConnectionGUID: HOkmKFjsRD+HDmR0fLh6fQ==
X-CSE-MsgGUID: f8KffrQ+QcarUroksjUiKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34788551"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="34788551"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 06:38:23 -0800
X-CSE-ConnectionGUID: nh/+N15ZQZ++Id6mXW3fTw==
X-CSE-MsgGUID: SmzzDBupSZOI2c+tL+UyYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="96778932"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.169])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 06:38:22 -0800
Date: Fri, 13 Dec 2024 08:38:12 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, John Harrison <John.C.Harrison@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>, 
 =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] Revert "drm/xe/devcoredump: Add ASCII85 dump helper
 function"
Message-ID: <t6j573cbepbjwiclv5ulewcapwqyf7np4bvdut6gjario6wmeq@sk3cxg6mnos7>
References: <20241213141252.1488109-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241213141252.1488109-1-rodrigo.vivi@intel.com>
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

On Fri, Dec 13, 2024 at 09:12:52AM -0500, Rodrigo Vivi wrote:
>We do not break userspace.
>
>This reverts commit ec1455ce7e35a31289d2dbc1070b980538698921.

But we have users calling this function.... the revert is not so simple.
I think we need to revert the functionality rather than reverting all
the patches, otherwise it will cause a lot of headaches.

I propose we go with:

a) drop the \n that broke mesa and merge that with cc stable.

b) move back the entry to the previous section that broke mesa and cc
    stable.

    José, would it be ok to merge a patch in mesa and port that
    to mesa stable that simply looks at 2 possible sections? Or even
    drop the section checks... ?

c) settle on one of the possible solutions for \n that were presented in
    this discussion.  I think the sanest one is that a space in the end of a
    line printing ascii85 would signify a continuation marker.  But merging
    (a) means we have time to discuss and adjust if needed.

After the dust settles we may think of a better way to evolve the
devcoredump format so it doesn't cause breakages in future updates.

Lucas De Marchi
