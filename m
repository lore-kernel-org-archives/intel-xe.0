Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E54C7618E
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 02:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1718310E0C0;
	Tue, 25 Apr 2023 02:19:28 +0000 (UTC)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B3310E0C0
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 02:19:25 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-63b70ca0a84so6589957b3a.2
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 19:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682389165; x=1684981165;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2UvJYIYfM4KmEx4SSK7aHm0S4dGYV7Gj3QtWfHjREFU=;
 b=OCBtrUBnCu4+C3RhQuKUNz3ny+NKW2cMN3krLze5NDddc/9V9pgjRvsxNDXfCjmLa7
 DjQBm50O/ge08T9EIuYCSY4k5P9KIfDmTL9C0BzgRmJRwdqZ3YApa9msUetSKLQzSsfa
 KRtCbA2S5l1jC1lLhHH7t9QFFsMK1N5Xx1rdgnzIjQXcUsX6N+W80OrmkNt2MR5JiEjN
 xVKoCoeoYgdyURsGc1Uv4/1ZXsc2oEiupl6UfwRlwCX/2T/z0ofrt1O3oazH4eVgQibs
 7wP2M13QAvdTLDD4kd1eiWdlv2zumysFZOV5AhA4aV5eep5bd59F6ag/GtRi+5eMbHG9
 deVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682389165; x=1684981165;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2UvJYIYfM4KmEx4SSK7aHm0S4dGYV7Gj3QtWfHjREFU=;
 b=NFQqWKda3bQlKZ9fDlFnHJ80F5Gw98RVgty0hN3AtB/nzIvO/IIF3qGSXk7Z+H8f8F
 1bo5EJem/rukIMfh/bBsnY7CNFH0MbG1lgS8qy8vttklAtTQ9Z8aEDBBU/pP8xHwfdG4
 gCkrcOx4LQno4Pu3eBRLE8I4BIU4C+YsJ1UpKHDVMgSBh1IxbqrYyTrMm6LSA5eVufVU
 Qy9PLLeQb7blfM0zD/1+fhv/c0rBnBO0kqLM5t4161d7sSRL8zbTSsrFfsZnstKbq9/+
 0xASPYrvgFh7+0EcOAUJAfpmZrWtjf/BxLrxufQZ5HykGwLXMhFQTR8ldCYjZNwLOBOK
 b73w==
X-Gm-Message-State: AAQBX9dU5eIMqVUj24Wgigoz/5jTklAsalC+SSyXchcuMklM9YzqlznO
 wMQjuG8re+qXiZwnHkJ0K9zDq3ClnK1/RQ==
X-Google-Smtp-Source: AKy350ZBGt3LoKH1ExFu32hXyDfdvrAcglwA4gsw3DjjwjypDCvB4nG3Gu+Xx0qwHtqxHRyzB3h80A==
X-Received: by 2002:a05:6a20:914d:b0:f3:1c69:7eeb with SMTP id
 x13-20020a056a20914d00b000f31c697eebmr11234990pzc.17.1682389164908; 
 Mon, 24 Apr 2023 19:19:24 -0700 (PDT)
Received: from mrgency.tuatara-tone.ts.net
 ([2600:6c51:4c3f:9541:841e:5ff:fea9:3053])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a62870c000000b0063b7f3250e9sm7986731pfe.7.2023.04.24.19.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 19:19:24 -0700 (PDT)
From: Christopher Snowhill <kode54@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 24 Apr 2023 19:19:20 -0700
Message-Id: <20230425021921.1695760-1-kode54@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/1] Enable compat ioctl functionality
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

This patch really needs the following patch, or a successor to it,
to be effective, since the current UAPI structures have padding
holes in them, which needs to be resolved before 32-bit compat
userspace can be fully functional:

https://patchwork.freedesktop.org/patch/529156/?series=115709&rev=1

Christopher Snowhill (1):
  drm/xe: Enable the compat ioctl functionality

 drivers/gpu/drm/xe/xe_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.40.0

