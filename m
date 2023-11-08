Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A33DC4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 17:31:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127D610E18C;
	Wed,  8 Nov 2023 17:31:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003BB10E18C
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 17:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699464708; x=1731000708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R2QvA6g2x7DT6I0NtjEAyBXscdMtL0JNQ9E8zfhkuRo=;
 b=Nh6sOMa5yk2eHSUoGGKOKD7NIVbSC/MSFG5wcCc+/DDVTndvlzu8HOm6
 ODKlKltIbMe6Jn7qP6zErEpT3a7NGUXNkOYxsdTujhkLNK7ouarVn5Ulz
 1t1nx+pDKHlpoSGMHLLonFfT012NBU+QbaYX7WVdDL403f3gsDGKzAV5k
 BSsiHo8xEoiwJsUnYA43NqMNEPN397h7+J/6ptA8oKSgfK7RPGw+ZNzKS
 jNKmupjIrCDbedCF2EgUEoaW8yekKlP9glBc9QPVx48BpnHt/unw86deY
 QP8mahB09CuzzekQAqLoIJWfLVPw+G+kCw4KY7obJgIqKHuKBwJc1hwGF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="380209899"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="380209899"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 09:31:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="1010336120"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="1010336120"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 09:31:47 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>
Date: Wed,  8 Nov 2023 09:32:17 -0800
Message-Id: <169946465775.2923027.10312136051986614777.b4-ty@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231103210324.1115369-1-jonathan.cavitt@intel.com>
References: <20231103210324.1115369-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v3] drm/xe: clear the serviced bits on
 INTR_IDENTITY_REG
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
Cc: saurabhg.gupta@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On Fri, 03 Nov 2023 14:03:24 -0700, Jonathan Cavitt wrote:
> The spec for this register, like many other interrupt related ones,
> asks software to write back '1' to clear the serviced bits. Let's
> respect the spec.
> 
> v2:
> - Update commit message
> - Add missing CC
> 
> [...]

I removed the v3 log and applied. Everything in this branch is being rebased
and we usually don't add it to the commit message.

Tthanks!

[1/1] drm/xe: clear the serviced bits on INTR_IDENTITY_REG
      commit: 7a0da606f1fcf4b59d7164419f1ccd1c48d366af

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
