Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5E2CA0EE6
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 18:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37B210E644;
	Tue, 19 Aug 2025 18:15:15 +0000 (UTC)
X-Greylist: delayed 597 seconds by postgrey-1.36 at gabe;
 Tue, 19 Aug 2025 18:15:14 UTC
Received: from 4.mo560.mail-out.ovh.net (4.mo560.mail-out.ovh.net
 [87.98.172.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC26E10E644
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 18:15:14 +0000 (UTC)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.249.114])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4c5y1H6KVczBFSb
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 17:55:47 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-h8tfc (unknown [10.110.178.151])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 96BE180297;
 Tue, 19 Aug 2025 17:55:44 +0000 (UTC)
Received: from etezian.org ([37.59.142.113])
 by ghost-submission-5b5ff79f4f-h8tfc with ESMTPSA
 id M6QSDaC6pGiiVAEAkBvNlg
 (envelope-from <andi@etezian.org>); Tue, 19 Aug 2025 17:55:44 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-113S007573bb996-046c-4375-b63b-012b3ce9b7b4,
 FE8A1FE06F486F3E0341172D55CF136EA59FD884) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 102.207.152.198
From: Andi Shyti <andi.shyti@kernel.org>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Raag Jadav <raag.jadav@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH] drm/xe: Skip creation of pcode sysfs files when pcode is
 disabled
Date: Tue, 19 Aug 2025 16:55:29 -0100
Message-ID: <20250819175529.3722716-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13448592915103615559
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduheeiudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnheptdevueeiheeftedujefhheelieejvdevteelfefhheeutdelkedtveejudejgfdvnecukfhppeduvdejrddtrddtrddupddutddvrddvtdejrdduhedvrdduleekpdefjedrheelrddugedvrdduudefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehinhhtvghlqdigvgeslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdpoffvtefjohhsthepmhhoheeitdgmpdhmohguvgepshhmthhpohhuth
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

From: Andi Shyti <andi.shyti@linux.intel.com>

Coverity warns that 'cap' may be used uninitialised. If pcode
is disabled there is no need to go through the hassle of a
pcode read or taking a PM reference.

Check skip_pcode early in the function and return if it is set.

No change for platforms where pcode is enabled.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index bd9015761aa0..3a083c215891 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -156,6 +156,9 @@ static int late_bind_create_files(struct device *dev)
 	u32 cap;
 	int ret;
 
+	if (xe->info.skip_pcode)
+		return 0;
+
 	xe_pm_runtime_get(xe);
 
 	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
-- 
2.50.0

