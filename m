Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68243C07CB1
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 14:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F28010E2BF;
	Mon, 27 Nov 2023 14:33:59 +0000 (UTC)
X-Greylist: delayed 859 seconds by postgrey-1.36 at gabe;
 Mon, 27 Nov 2023 12:38:06 UTC
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6FA10E25C
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 12:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1701088676; x=1701693476; i=spasswolf@web.de;
 bh=syrs6tmIf2kfqrqm/BG1V4nSMMDynAQxfPKWNGqCRqQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
 References;
 b=N/xV/GSqlVqkjq8QYjd15/kr5XybCC0edvxTFuVsIwzVAnHwfkcYq5rpdSp1DDec
 H20A/oS4IT7D8v2eV0E6Xz7OI4fokWVmVLpjTUCWBcq7ecGdgaIfzyEZ9A/pCkrvw
 SzURCxPtFPtvuFVw1FNd5quns88HgesLSiIozhyZtFcbm2uq/4Ync+xSjgZPPLiBV
 AYDC2tfvB8nwTx2jAdXU0ntvef1zWRX+WykkwmV/JDSvmtEZP6jXeNFV+z3sGCZZW
 tfSMSZ10XMF3J9j9NmXwxd4WQENcjpIgRySL7Dyx/CPqBbsfDH/GUX08+kbUn6f5o
 eWnv1IqtB2Q9/dbynQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from lisa.home ([84.119.92.193]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MP3CA-1qvZYf135Y-00POMr; Mon, 27
 Nov 2023 13:22:45 +0100
From: Bert Karwatzki <spasswolf@web.de>
To: Luben Tuikov <ltuikov89@gmail.com>
Date: Mon, 27 Nov 2023 13:21:40 +0100
Message-ID: <20231127122147.82970-1-spasswolf@web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: 6273fadf-267a-4965-82ab-89c5b3f28cf2@gmail.com
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p4ypJ/YU7w47v+HSuV6slrirmZWx1rcLt77+n6HP673wrqq5O2u
 vNvhWhTUwIgv3tdC3YgoNI+6iPYu97PcxcENeEHSnAtYB/H9pH860XAmHBIYiCgAQ1vT2rt
 GUYMnloufaBuUEYmfZczzjjEZ++LRG6fGkT93puUBORrk2hYPRcsg5VadNgMkEwSL4F019g
 7Py0bcjD6NhP55bzReHPw==
UI-OutboundReport: notjunk:1;M01:P0:elaZyqSLFMA=;iYF50Kul1P5rMSsMaqo6hxjzV/E
 Yhi53vLraZEEP+mlCKLloKHbU3yeyXw/lGfzc9gzg2TEpr2a9RlKpnNRY4x1qxxi4yRr8Kw2W
 sr9IMuMiA24ENusZhx66QtNI8AZRvr09/MZvYcXuxrylyjQj3+RtQSN2Fz0yUkp9Agf1UJ5SS
 4P8ILUJDcTsf1DTGS/QFrxRd2TKF0MlSveMgUOOATPWcKRuvSzOEttlAl8DHwaWkRE7WKMUm+
 evm0HaMUuK7hNKAq1zTXI4bTsQA3tLLTY35pslKRQlm2/uTNGQLdtHzNEDpCK+TcKjHP8Cw6J
 wPacb8SfciKEAa1IDbc/MChzP2xMKMTf8np6JrlQKAII1IT285GxsIMzk4JJM3VuAYDcyj5AK
 VJr/vqQtKq09ZeU570WtVy7jNlN9Phs0cGOAZIngerwhveTUDPnbe+FSUsC5G1QwG1BJYTWZQ
 CQFrpj/vcIsB1xNkkKYa0sL44vLoCAVqe2gJqWajSIeHSU78iu06lJBw49zDVz9STBpZzdW8S
 n48TQ3Yf02EGnsrlUgzv5QH0ArQf0RNmwOeqHlwhwl2/NCNZ7InOLmz5WE4+lfuINsGQ8cdup
 o4bDDZv+AFx8WzXYD7r796wYHlPSALawwSku/7R8gDIWtkV/P1jJoasPLVbKdMEvuiUtY4+C/
 TELshfMfrrKkvIx7WyEX6iBZex2LfqB6uTUhJkPp+KfKvMeiWkp6AcUgYtIB/67uhDJ2dGuxN
 9XNz5JB53kVyHoyHYbkkvN00xypGZsxRGuJy5E9wxKrZOf4fwZWVJRNLyZkKxM8CIcnpadTin
 ulmj4pfeEzEnq7CBWyMyIQ6s+3pe+lhHteMmIpY3OUFThLWJhtfaEftpw5PNFSB/2+PwXO+hd
 Otb8p+jP2oZ99W7u+0jlkyc5g0CEOU0812y16nzTyUsnEWE7sYAtWB+kb78sm63K4n0rV5erR
 IgM+P2NVQ4Zs9s7ox+GdO6Vuvw4=
X-Mailman-Approved-At: Mon, 27 Nov 2023 14:33:57 +0000
Subject: [Intel-xe] [PATCH] Revert "drm/sched: Qualify drm_sched_wakeup() by
 drm_sched_entity_is_ready()"
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
Cc: robdclark@chromium.org, sarah.walker@imgtec.com, ltuikov@yahoo.com,
 ketil.johnsen@arm.com, lina@asahilina.net, mcanal@igalia.com,
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 boris.brezillon@collabora.com, dakr@redhat.com,
 Bert Karwatzki <spasswolf@web.de>, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com, donald.robson@imgtec.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Commit f3123c25 (in combination with the use of work queues by the gpu
scheduler) leads to random lock ups of the GUI [1,2].

This is not a complete revert of commit f3123c25 as drm_sched_wakeup
still needs its entity argument to pass it to drm_sched_can_queue.

[1] https://gitlab.freedesktop.org/drm/amd/-/issues/2994
[2] https://lists.freedesktop.org/archives/dri-devel/2023-November/431606.=
html

This reverts commit f3123c2590005c5ff631653d31428e40cd10c618.
=2D--
 drivers/gpu/drm/scheduler/sched_main.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sche=
duler/sched_main.c
index 682aebe96db7..550492a7a031 100644
=2D-- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1029,9 +1029,8 @@ EXPORT_SYMBOL(drm_sched_job_cleanup);
 void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
 		      struct drm_sched_entity *entity)
 {
-	if (drm_sched_entity_is_ready(entity))
-		if (drm_sched_can_queue(sched, entity))
-			drm_sched_run_job_queue(sched);
+	if (drm_sched_can_queue(sched, entity))
+		drm_sched_run_job_queue(sched);
 }

 /**
=2D-
2.43.0

