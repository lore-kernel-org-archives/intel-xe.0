Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF44FCD5BB0
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 12:37:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9176610F700;
	Fri, 22 May 2026 12:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K491tJIs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50ACD10F6EE
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 12:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779453454; x=1810989454;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I32bzilRbUc/1so3W2RSwB0iDM3jGf4fJH3C3gN1jBY=;
 b=K491tJIsk9rEh4oCndYLbq4K7yR89ftIr5GezQ/BOwiAQVY1gSvqJv/6
 gGm9I+Y+MSBmreoF6biT6FKzUFy4c4JIz6mg9GokA+UckpSKH0mrVKbER
 VeNUsR4OtUbiyQwgNnT7uMri9MKMvcIADofOz0FdCJsXSfrM4oEfODBZm
 fs+5Ion4rntRJqHo9VBmvCENp0TcgssAyIhDrAEhtexTKWGctlfA6IumO
 NeS0Lz5PtvFLaeVbvKHgj5pbR/JX2varfp2UiiKvGEJZ/O3gvXRz1VvHK
 Be7tQN5QyPTutu5Oylj0dD+Ni4ftGz697O1kZQv50XaVaLZoN/fTuGhv9 g==;
X-CSE-ConnectionGUID: a3M/QlAWQ6+3QlzKiXfOzg==
X-CSE-MsgGUID: PSow7KYbSQ6B8rH2eZoFMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="84264582"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="84264582"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 05:37:34 -0700
X-CSE-ConnectionGUID: CpGBKvmET62lcl5t1EnbjQ==
X-CSE-MsgGUID: Ei4T7y8yT/qF94Gbnor+vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="238302131"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.22])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 05:37:33 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 00/10] GuC paging engine support
Date: Fri, 22 May 2026 13:37:21 +0100
Message-ID: <20260522123720.39656-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On NVL-S+, the GuC will be moving towards a dedicated GuC engine class for
the driver reserved copy engine(s), which we need for USM flows. With this
the GuC will now be able to internally differentiate KMD paging operations,
like clearing/migrating/binding, from other copy engine submissions.

Note that this is purely a software view within the GuC. There is no new
physical engine, or anything like that. With that in mind the design here
keeps this contained on the GuC side, with upper layers not needing to know
about this distinction.

The final GuC versioning is still being finalised (marked as TODO in the
relevant commits) and we are still missing the proper GuC release, so
merging is still gated by that, but in the meantime we can get this
reviewed in upstream and ready to go. This has already seen some internal
smoke testing, both on VF and PF flows with the new GUC_PAGING class.

v2 (Sashiko):
 - In VF query patch, we shouldn't call guc_has_paging_engine(), since this
   is too early in the VF sequence, and GUC_SUBMIT_VER() is still unset.

-- 
2.54.0

