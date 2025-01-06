Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7421E77188
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 15:35:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410E110E19C;
	Mon,  6 Jan 2025 15:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MXTaLCRE";
	dkim-atps=neutral
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1307910E19C
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jan 2025 15:35:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6089AA41A09;
 Mon,  6 Jan 2025 15:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8807FC4CED2;
 Mon,  6 Jan 2025 15:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1736177741;
 bh=JkL6D/ZcuyD3PJRhqY3m23yt60BXFOvTgI1GmghNJqE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MXTaLCREfwgpteJEAesAeav1PUm2+zsKh5aLPZ7Xps7MXDnWffzwf3vc6Zan0kDAJ
 7/c6kZbEhTQUKnfqDZOd3xS+nEr1YrPfDYIRWGV8VnbcMpz4dZKX5SJhQzR4qrdcFL
 i7MBZr8MnXNQVdlHMN75/pZQ1qJn9kTBuHOlEbwk=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 John Harrison <John.C.Harrison@Intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.12 041/156] drm/xe: Revert some changes that break a mesa
 debug tool
Date: Mon,  6 Jan 2025 16:15:27 +0100
Message-ID: <20250106151143.282625007@linuxfoundation.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106151141.738050441@linuxfoundation.org>
References: <20250106151141.738050441@linuxfoundation.org>
User-Agent: quilt/0.68
X-stable: review
X-Patchwork-Hint: ignore
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

6.12-stable review patch.  If anyone has any objections, please let me know.

------------------

From: John Harrison <John.C.Harrison@Intel.com>

[ Upstream commit a53da2fb25a31f4fb8eaeb93c7b1134fc14fd209 ]

There is a mesa debug tool for decoding devcoredump files. Recent
changes to improve the devcoredump output broke that tool. So revert
the changes until the tool can be extended to support the new fields.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Fixes: c28fd6c358db ("drm/xe/devcoredump: Improve section headings and add tile info")
Fixes: ec1455ce7e35 ("drm/xe/devcoredump: Add ASCII85 dump helper function")
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241213172833.1733376-1-John.C.Harrison@Intel.com
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
(cherry picked from commit 70fb86a85dc9fd66014d7eb2fe356f50702ceeb6)
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index c18e463092af..85aa3ab0da3b 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -104,7 +104,11 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
 	drm_puts(&p, "\n**** GuC CT ****\n");
 	xe_guc_ct_snapshot_print(ss->ct, &p);
 
-	drm_puts(&p, "\n**** Contexts ****\n");
+	/*
+	 * Don't add a new section header here because the mesa debug decoder
+	 * tool expects the context information to be in the 'GuC CT' section.
+	 */
+	/* drm_puts(&p, "\n**** Contexts ****\n"); */
 	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
 
 	drm_puts(&p, "\n**** Job ****\n");
@@ -358,6 +362,15 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix,
 	char buff[ASCII85_BUFSZ], *line_buff;
 	size_t line_pos = 0;
 
+	/*
+	 * Splitting blobs across multiple lines is not compatible with the mesa
+	 * debug decoder tool. Note that even dropping the explicit '\n' below
+	 * doesn't help because the GuC log is so big some underlying implementation
+	 * still splits the lines at 512K characters. So just bail completely for
+	 * the moment.
+	 */
+	return;
+
 #define DMESG_MAX_LINE_LEN	800
 #define MIN_SPACE		(ASCII85_BUFSZ + 2)		/* 85 + "\n\0" */
 
-- 
2.39.5



