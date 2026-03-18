Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8D6F483CC
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 16:04:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D3A10E55B;
	Mon, 23 Mar 2026 16:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AdCftPIk";
	dkim-atps=neutral
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com
 [74.125.82.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979F610E696
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 04:16:14 +0000 (UTC)
Received: by mail-dy1-f179.google.com with SMTP id
 5a478bee46e88-2c0c955a481so1667331eec.1
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 21:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773807374; x=1774412174; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JZvDiA5OjEH9jB/X3wjJ3qQao5asOiEdEuR+UFxLqYM=;
 b=AdCftPIkmTak36f5MKqplLgCKN/xKA0BwFvcaSekDdDEJnE8OxwmBrDSWSOLKxGK+n
 Fm3ja2fU9KBDce6IPtBC68QLuIVrcVHFsl1she29V5P4r2KXUp+YTVE78HJnNroscbGR
 qs6sOXtW5s40BoKOGpg624Rr1gMbixjuY/Gu62PFqeRJ5I57aUfqusLVDYBiTRSKmcSU
 451LkeqvT16Fuu1yiC3fJwymCnyhcwF/OK4ASuabM9HjYzrsCSQHFYASWRGoTpLVno6b
 EJb5RMNtQ8htTj/+aNoh1fSRaPCuGdB7oP7QBCjDVmf8+IbVFlNV0gNruY4IoPHBuxFf
 gkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773807374; x=1774412174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JZvDiA5OjEH9jB/X3wjJ3qQao5asOiEdEuR+UFxLqYM=;
 b=PNER47Jb3C8TSi2E9+xj7Ic55KOxW8Xp3eEZykj9HEPpdP6TrEZ9RLE63CePQzEUtc
 zkeNNR8hLSnhnyCNX/ELQJfwY9505OE6J0HBV9G6+AsxMtNL3dIF4sIFgjJvin7iG1Sj
 8nlNpo9Aph91u0SQcwjgm6igONKln6dRInXH938+oxAI0j32xqkda43QLElJzUoKcT2P
 HiS0f1U3TnyYYOZPRHlAjOukE5J7wXhUYorauqhscq3B4oyTCoMK74HDLR/O7vbFfVRa
 EdjJ12nmnEZ+gRGAMNN5RyF+W+OHRS08KseFUanDGaGq4desZwcpylQlY2GMQpXrIbBp
 4xmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDcZy2WG9CHcc+LjpN6TSoVo5hjBRwdooM8eOiAE9GHsMaKNRiHnZbm+SDUyF5prtluDKJZnAa1w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywu6A7WejV7MLuNWjt0uPZqX687MHBuyFu20sK7Jb2RuRs8nMAS
 1dMBxec8MO7KFGaCvST/V9Wpeb1vU3jhT9l+dbh+uqsd6Ype3XlyXliK
X-Gm-Gg: ATEYQzw118stq/ghNew+t1LT9Aso08vV0Bq006CvEI0UpqDiIjPz91EA8eDS+7p9dle
 jUGGgkCiDxpN6kZULLU2Mef5Q29lcpZqSlzd+dqN9g7Hw1zOdh7gmc3M6ihKYDw3Y+5QWPVeFT1
 vxYXWUsMbuShjTGg7QtW44ADQ0ek6y3xyRRHhLVFyyysZaMu1b6XTWrXQabYq8Vm9RAgGJfGq/y
 2p3EVmE6n9MiQzj0pd1HRmVWBnIhnO/PEm3XHxNX56EemYYxcw7gJrXjMwFfgxrvlKborjO68+R
 2xxcUbTONmwfaQI2qQ9OsFwzQ64ZvY1XfCXyHA7VVS9FTD0M7FNOnVn6xDuin6qVtAXt2jOa7y1
 DO7NBCUPa+7oXEs7+JzbzB2kn+GrWAF7+tn+OSLLYeHYI9yWp27sfBc+yLCXW4O980us/0nnulG
 OHiu0QEiUbBM68k4Ia4zjXGDgBofxInMREgsSQ9UbtQ0IQ2O8ayQ2uXtYWZ2xXdR354AoYq2+02
 PEkd7wK9B4MUhRVH43tZyH8SfX+JymX8Dlqz8N6YJuX+w6ZkkaiWq7QaqqiVLG8rquHHcb2
X-Received: by 2002:a05:693c:2c06:b0:2be:833c:14a6 with SMTP id
 5a478bee46e88-2c0e5044091mr1153364eec.15.1773807373685; 
 Tue, 17 Mar 2026 21:16:13 -0700 (PDT)
Received: from 2045L.localdomain (130.sub-75-229-251.myvzw.com.
 [75.229.251.130]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c0e560fb5fsm2790870eec.31.2026.03.17.21.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2026 21:16:13 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: hanguidong02@gmail.com
Cc: akaieurus@gmail.com, dakr@kernel.org, dri-devel@lists.freedesktop.org,
 driver-core@lists.linux.dev, gregkh@linuxfoundation.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, me@ziyao.cc,
 pierre-louis.bossart@linux.dev, rafael@kernel.org, rander.wang@intel.com,
 vkoul@kernel.org, yangshiguang@xiaomi.com, yung-chuan.liao@linux.intel.com
Subject: Re: [PATCH 3/4] soundwire: debugfs: initialize firmware_file to empty
 string
Date: Wed, 18 Mar 2026 12:14:28 +0800
Message-ID: <20260318041446.9066-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317191029.43515-1-hanguidong02@gmail.com>
References: <20260317191029.43515-1-hanguidong02@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Mar 2026 16:04:08 +0000
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

On Wed, Mar 18, 2026 at 3:11 AM Gui-Dong Han <hanguidong02@gmail.com> wrote:
>
> Passing NULL to debugfs_create_str() causes a NULL pointer dereference
> upon reading, and creating debugfs nodes with NULL string pointers is no
> longer permitted. Change the initialization of firmware_file to an
> allocated empty string. Existing driver code using this field handles
> empty strings correctly.
>
> Fixes: fe46d2a4301d ("soundwire: debugfs: add interface to read/write commands")
> Reported-by: yangshiguang <yangshiguang@xiaomi.com>
> Closes: https://lore.kernel.org/lkml/17647e4c.d461.19b46144a4e.Coremail.yangshiguang1011@163.com/
> Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
> ---
>  drivers/soundwire/debugfs.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
> index ccc9670ef77c..d4abe8bfca76 100644
> --- a/drivers/soundwire/debugfs.c
> +++ b/drivers/soundwire/debugfs.c
> @@ -358,8 +358,9 @@ void sdw_slave_debugfs_init(struct sdw_slave *slave)
>         debugfs_create_file("go", 0200, d, slave, &cmd_go_fops);
>
>         debugfs_create_file("read_buffer", 0400, d, slave, &read_buffer_fops);
> -       firmware_file = NULL;
> -       debugfs_create_str("firmware_file", 0200, d, &firmware_file);
> +       firmware_file = devm_kstrdup(&slave->dev, "", GFP_KERNEL);
> +       if (firmware_file)
> +               debugfs_create_str("firmware_file", 0200, d, &firmware_file);

I initially patterned this fix after commit 8cc27f5c6dd1 [1] by using
devm_kstrdup(). However, I realized that approach is flawed:
debugfs_write_file_str() calls a raw kfree(), which causes a mismatch.
I have submitted a separate patch [2] to fix that existing commit.

Additionally, firmware_file is a global pointer in this driver. The
original code blindly overwrote it with NULL every time a new slave was
added.

To fix both issues properly, I moved the allocation to the subsystem
init and exit paths so it is only allocated once.

The updated v2 patch is included below for review. I will wait for
further comments on the rest of the series and include this updated
patch if a full v2 series is required.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8cc27f5c6dd1
[2] https://lore.kernel.org/linux-pm/20260318024815.7655-1-hanguidong02@gmail.com/

From bbaff3bc33746a965a2387ffe8302d05e700a1c3 Mon Sep 17 00:00:00 2001
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Wed, 18 Mar 2026 03:10:29 +0800
Subject: [PATCH v2 3/4] soundwire: debugfs: initialize firmware_file to empty string

Passing NULL to debugfs_create_str() causes a NULL pointer dereference,
and creating debugfs nodes with NULL string pointers is no longer
permitted.

Additionally, firmware_file is a global pointer. Previously, adding every
new slave blindly overwrote it with NULL.

Fix these issues by initializing firmware_file to an allocated empty
string once in the subsystem init path (sdw_debugfs_init), and freeing
it in the exit path. Existing driver code handles empty strings
correctly.

Fixes: fe46d2a4301d ("soundwire: debugfs: add interface to read/write commands")
Reported-by: yangshiguang <yangshiguang@xiaomi.com>
Closes: https://lore.kernel.org/lkml/17647e4c.d461.19b46144a4e.Coremail.yangshiguang1011@163.com/
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
v2:
* Replace devm_kstrdup() with kstrdup() to fix allocation/free mismatch
with debugfs.
* Move initialization to subsystem init/exit paths to avoid overwriting
the global pointer on every slave probe.
---
 drivers/soundwire/debugfs.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
index ccc9670ef77c..2905ec19b838 100644
--- a/drivers/soundwire/debugfs.c
+++ b/drivers/soundwire/debugfs.c
@@ -358,8 +358,8 @@ void sdw_slave_debugfs_init(struct sdw_slave *slave)
 	debugfs_create_file("go", 0200, d, slave, &cmd_go_fops);
 
 	debugfs_create_file("read_buffer", 0400, d, slave, &read_buffer_fops);
-	firmware_file = NULL;
-	debugfs_create_str("firmware_file", 0200, d, &firmware_file);
+	if (firmware_file)
+		debugfs_create_str("firmware_file", 0200, d, &firmware_file);
 
 	slave->debugfs = d;
 }
@@ -371,10 +371,15 @@ void sdw_slave_debugfs_exit(struct sdw_slave *slave)
 
 void sdw_debugfs_init(void)
 {
+	if (!firmware_file)
+		firmware_file = kstrdup("", GFP_KERNEL);
+
 	sdw_debugfs_root = debugfs_create_dir("soundwire", NULL);
 }
 
 void sdw_debugfs_exit(void)
 {
 	debugfs_remove_recursive(sdw_debugfs_root);
+	kfree(firmware_file);
+	firmware_file = NULL;
 }
-- 
2.43.0

