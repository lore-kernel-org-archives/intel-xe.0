Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FA1C3ABB9
	for <intel-xe@archiver.kernel.org>; Mon,  5 May 2025 22:28:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCB010E48C;
	Mon,  5 May 2025 22:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UdRGGGmf";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9D710E48C;
 Mon,  5 May 2025 22:28:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1ABC2629C0;
 Mon,  5 May 2025 22:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE67C4CEE4;
 Mon,  5 May 2025 22:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484105;
 bh=Ll43ZrLxMWFfQomfOHOy+yuEDnhCPlWPzmZhmBroXsk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UdRGGGmfkwWW90/gxxcOO1LNhJNb+ieDWvxuRfsY/7MAeqKGO8t+sHYQSgHh+onBi
 L9DjSNVg/6t3SqE2FLEJeIi87dihni+81IjOEjeNn7FrUaeCy9eEfo+Bq3HrW4Edj4
 ob5TqYJvAxwejj4gxmMucf16cMjUEMiTjMzR6kq971V2mhMql9OVpWYQlsdma4BcQ0
 TeRIItR9dkQTpVlY46Fgc3hDqXdyJMlPBLnI9Ruxc49UT9tsYDQkdDLk4o+EY8tivv
 kOshOSYejiz5XXOCCpFTSgTeNyuKjiz6VOCm03wZpmUKdblGpx6c/6+djU/RDDuETM
 0RGIUuXnAJMUg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, Sasha Levin <sashal@kernel.org>,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@gmail.com, simona@ffwll.ch,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 353/642] drm/xe/oa: Ensure that polled read
 returns latest data
Date: Mon,  5 May 2025 18:09:29 -0400
Message-Id: <20250505221419.2672473-353-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

[ Upstream commit 98c9d27ab30aa9c6451d3a34e6e297171f273e51 ]

In polled mode, user calls poll() for read data to be available before
performing a read(). In the duration between these 2 calls, there may be
new data available in the OA buffer. To ensure user reads all available
data, check for latest data in the OA buffer in polled read.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250212010255.1423343-1-umesh.nerlige.ramappa@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_oa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index eb6cd91e1e226..abf37d9ab2212 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -548,6 +548,7 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
 			mutex_unlock(&stream->stream_lock);
 		} while (!offset && !ret);
 	} else {
+		xe_oa_buffer_check_unlocked(stream);
 		mutex_lock(&stream->stream_lock);
 		ret = __xe_oa_read(stream, buf, count, &offset);
 		mutex_unlock(&stream->stream_lock);
-- 
2.39.5

