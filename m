Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72843CDB474
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 15:38:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC8810E21D;
	Mon, 16 Oct 2023 15:38:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A07610E21D
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 15:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697470713; x=1729006713;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tqZCO0hHR/PQ3KA+p3QfT3Ezi1frdCWSVnn6lEAMT90=;
 b=WxBAdfQtblesafLAqYsALtJ27G6kJaezNhmSms/JIq4FAu+jU6fTWHDK
 OA7Uf6/h5SiUC7esLvGwG7MmluCsVrsM+1OKTUC3fwXjq//AEX3Nuj4uc
 sENv1G8LHGUaWT21YHsj7+baV/yOmuKu8OKK7JQgtdCEBXL62OndkXwXt
 cEjZXJ9gk8++lMQz98DD5huHIH5Qxpo8dvfEiyK6egD3DvGNQYxF0Nuep
 rmp3Z5GzpK7HBvzIExQxS0rFuwo7qZJT7TNBsJnt4og4cOtfRWfzMRyJC
 v6EIYAS8rbopjs+uPsSQtQg/2n6hz36tMmHi7luplbwVoFZ4DYXpi4l/h A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="382777124"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="382777124"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 08:38:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="732333618"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="732333618"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 08:38:32 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Date: Mon, 16 Oct 2023 08:40:23 -0700
Message-Id: <20231016154025.3358622-1-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/1] x86/alternatives: Disable KASAN in
 apply_alternatives()
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
Cc: lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

Backport the fix from upstream for the KASAN issue observed on PVC
machines when enabling 5-level paging.

Kirill A. Shutemov (1):
  x86/alternatives: Disable KASAN in apply_alternatives()

 arch/x86/kernel/alternative.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

-- 
2.25.1

