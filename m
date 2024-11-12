Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED968D42BBF
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 20:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B901D10E32F;
	Tue, 12 Nov 2024 20:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TMSCUEiW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE99A10E32F
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 20:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731441934; x=1762977934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cq+CudWUdl20P1UptTJIpNh3ZMbsdBx5USN5K16iLqw=;
 b=TMSCUEiWQd+2HVDxvELFwr7JXyXCgLolep2+k1sM0ohcxn+v9FCDaSQ2
 AcWqNLnjEL1ztxIHs/22zxu6ag6sXXxebgne9lBynMbOlPQsC2VXTUN9y
 QZ5D2UrpIkmNjXrDg/GR93HbNYaZXjV8vtxUbD90KlRkrZlHnvQJxwF4g
 j9WTO8CWVEdpSCVqrxqNgZQ++VOTwOfm8nmnFH0fN5Zo7W4H2JQCOmQvy
 EeOfn+SszO7vvlp4ZJ6reR5ZeURfbxMn604A8USCtCo3H3x9MxziVJCeb
 oXHEQYWyC684PwfvFMotav/yz5QRynVXHPs/G5SMewuw47ZLU9KkRBwJ6 w==;
X-CSE-ConnectionGUID: o3PaOy5rRmyZSsguHF7jnQ==
X-CSE-MsgGUID: vYl/lF76SBKZA7Uipil6pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31394370"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="31394370"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 12:05:34 -0800
X-CSE-ConnectionGUID: tkAXR3AtRW2GiaCljlymiw==
X-CSE-MsgGUID: DV3NjrWhSc+v7VHCkgAOiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="92710367"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.85.128])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 12:05:31 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] libfs: Provide simple_read_from|write_to_iomem()
Date: Tue, 12 Nov 2024 21:04:52 +0100
Message-Id: <20241112200454.2211-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241112200454.2211-1-michal.wajdeczko@intel.com>
References: <20241112200454.2211-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
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

New functions are similar to simple_read_from|write_to_buffer()
but work on the I/O memory instead. Will allow wider code reuse.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 fs/libfs.c         | 78 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fs.h |  5 +++
 2 files changed, 83 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index 46966fd8bcf9..1c7343f1147f 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1095,6 +1095,84 @@ void simple_release_fs(struct vfsmount **mount, int *count)
 }
 EXPORT_SYMBOL(simple_release_fs);
 
+/**
+ * simple_read_from_iomem() - copy data from the I/O memory to user space
+ * @to: the user space buffer to read to
+ * @count: the maximum number of bytes to read
+ * @ppos: the current position in the buffer
+ * @from: the I/O memory to read from
+ * @available: the size of the iomem memory
+ *
+ * The simple_read_from_iomem() function reads up to @count bytes from the
+ * I/O memory @from at offset @ppos into the user space address starting at @to.
+ *
+ * Return: On success, the number of bytes read is returned and the offset
+ * @ppos is advanced by this number, or negative value is returned on error.
+ */
+ssize_t simple_read_from_iomem(void __user *to, size_t count, loff_t *ppos,
+			       const void __iomem *from, size_t available)
+{
+	struct iov_iter iter;
+	loff_t pos = *ppos;
+	size_t copied;
+
+	if (pos < 0)
+		return -EINVAL;
+	if (pos >= available || !count)
+		return 0;
+	if (count > available - pos)
+		count = available - pos;
+	if (import_ubuf(ITER_DEST, to, count, &iter))
+		return -EFAULT;
+
+	copied = copy_iomem_to_iter(from + pos, count, &iter);
+	if (!copied)
+		return -EFAULT;
+
+	*ppos = pos + copied;
+	return copied;
+}
+EXPORT_SYMBOL(simple_read_from_iomem);
+
+/**
+ * simple_write_to_iomem() - copy data from user space to the I/O memory
+ * @to: the I/O memory to write to
+ * @available: the size of the I/O memory
+ * @ppos: the current position in the buffer
+ * @from: the user space buffer to read from
+ * @count: the maximum number of bytes to read
+ *
+ * The simple_write_to_iomem() function reads up to @count bytes from the user
+ * space address starting at @from into the I/O memory @to at offset @ppos.
+ *
+ * Return: On success, the number of bytes written is returned and the offset
+ * @ppos is advanced by this number, or negative value is returned on error.
+ */
+ssize_t simple_write_to_iomem(void __iomem *to, size_t available, loff_t *ppos,
+			      const void __user *from, size_t count)
+{
+	struct iov_iter iter;
+	loff_t pos = *ppos;
+	size_t copied;
+
+	if (pos < 0)
+		return -EINVAL;
+	if (pos >= available || !count)
+		return 0;
+	if (count > available - pos)
+		count = available - pos;
+	if (import_ubuf(ITER_SOURCE, (void __user *)from, count, &iter))
+		return -EFAULT;
+
+	copied = copy_iomem_from_iter(to + pos, count, &iter);
+	if (!copied)
+		return -EFAULT;
+
+	*ppos = pos + copied;
+	return copied;
+}
+EXPORT_SYMBOL(simple_write_to_iomem);
+
 /**
  * simple_read_from_buffer - copy data from the buffer to user space
  * @to: the user space buffer to read to
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 3559446279c1..2cc73c5961b0 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3426,6 +3426,11 @@ extern ssize_t simple_read_from_buffer(void __user *to, size_t count,
 extern ssize_t simple_write_to_buffer(void *to, size_t available, loff_t *ppos,
 		const void __user *from, size_t count);
 
+ssize_t simple_read_from_iomem(void __user *to, size_t count, loff_t *ppos,
+			       const void __iomem *from, size_t available);
+ssize_t simple_write_to_iomem(void __iomem *to, size_t available, loff_t *ppos,
+			      const void __user *from, size_t count);
+
 struct offset_ctx {
 	struct maple_tree	mt;
 	unsigned long		next_offset;
-- 
2.43.0

