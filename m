Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893B6CFD2F6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 06:46:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0FD10E760;
	Thu, 27 Nov 2025 06:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rXS7UITV";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F73910E760
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 06:46:19 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso1577695e9.2
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 22:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764225978; x=1764830778; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U7tjH7Pom1u1FT1aYTWAc2HP/CZMRQnBvGdUrj1n5qk=;
 b=rXS7UITViWY/t8GJBj5k02eizzsKCtzDKa24sHTfysnFrxxM1V92tdUsxZvQjxXox4
 FbMxoPmZrL5MXDeBcTNA6jmIf+56AZPrxC4vH91UQqhe/y5+2Pl/m9+Wz/7nihwv01tr
 S3xiXmQHnH0XtxWZ2kmSVuNHMUx8VpOIh2OgGgdJpcxFCk6tG1/VCW23qZKUtr1qtTSk
 xgEUSjlCT6Won0lKFpwzv4u41pMbEi0Qq8JrcoraP4DM8L58poI5Ey4vc9AYdmVRkoHy
 OzvWrLQsdBAFx1hdq0HxSCbvNF6T0rcU0J6GzM9YLj9DAlp2tCnxAn2df+v6KYoX/coK
 DiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764225978; x=1764830778;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U7tjH7Pom1u1FT1aYTWAc2HP/CZMRQnBvGdUrj1n5qk=;
 b=R7O0G1nVSEprG7R51xqq8YYQyRwUQqAYlW0ZNmQJVzfnUhizxSKpHK32gpI0InvoH/
 0QJyCSzMc9PyKN1tx2fZGbBWtUoI6AuobdMOUh8YFFVtosyHXuzMy+aJEpfQ9SvJqcTV
 Hp6HSB4jNR4IHrCT4igsvAlVXsf0hn370kLH9ZhoDZnfkb2L+SAbzwZJqPL3VUNgE9K4
 zXBo7+vbCXZQESnpmtKgiff38MHGHWc7uUuPDw+swRE0Q63gz9yJ0nug0e3Vy1zEOpz6
 +iAuJdCC12VfALvu+PAaNFcPUupRIQisSxvT5V44KKxoqi7G/CgavsY3G5uiNCr8BUzx
 TgFA==
X-Gm-Message-State: AOJu0YwhjXvkScnr3N0v+bk9I6G/NbmTZgo03GQ3sCvFXzV+Ii7rZLpt
 9JjMMTP/+Rsau1gqGR8KJqupRDzU+vdhOE4tFP/HFnwrGuX8d5bdGT0e5LG9a+tn9Fs=
X-Gm-Gg: ASbGnctEW+6WPrSj3BeJ4HXCEnYk0fpfm6vS/O+Gg0/5S42fRWoqytAER5qVbYZz/V6
 bDpAcFfs8YryXhdkDkoDo9g3gfdilT2w2dD021MDZDlss4ZMmJ33KpEJUGfMryjixV3jbbUGtwA
 3/vhXbRt67TXmSqGFdM5v0CTZZifntnxQWkSmtOAVliWHThQnqkElK4WzEMETYClTiM4vbEonAF
 I4FFNvVls1q3BYPXMxIND/StSdfJJhRBl2y9RNtFXaeRb7F8IYqL6P8CKOCfTGYI0Q1uGYF3Rd4
 fOQnRJ3uhvWB5QJhGFaX1AAD8AqG5XE3BFBMLnG1MGkMmG5fgU44uxH5YqJf6yftfSoG3qZB7Da
 q1LDIVNacPbzS6euf16kjHDpdwgS5u5/6TsnrEWoa8ab/8ewQFWFOI0TLao1l+b4/pmXCD8wXJa
 siWfh5z8Iqj9Q5sZ9j
X-Google-Smtp-Source: AGHT+IFTOSWiPxi4d3EdampZa3blGd70Qlc7XrLcmclcJApAmGXc3L8CTtlC56G+pS8+mziN73aGXA==
X-Received: by 2002:a05:600c:1994:b0:477:7af8:c88b with SMTP id
 5b1f17b1804b1-477c01740e1mr211465975e9.11.1764225977687; 
 Wed, 26 Nov 2025 22:46:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4790add608bsm82010545e9.5.2025.11.26.22.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 22:46:15 -0800 (PST)
Date: Thu, 27 Nov 2025 09:46:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [bug report] drm/xe/vf: Start re-emission from first unsignaled job
 during VF migration
Message-ID: <aSfztMSRCeO91mTA@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Matthew Brost,

Commit 00937fe1921a ("drm/xe/vf: Start re-emission from first
unsignaled job during VF migration") from Nov 21, 2025 (linux-next),
leads to the following Smatch static checker warning:

	drivers/gpu/drm/xe/xe_guc_submit.c:2265 guc_exec_queue_unpause_prepare()
	warn: iterator used outside loop: 'job'

drivers/gpu/drm/xe/xe_guc_submit.c
    2247 static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
    2248                                            struct xe_exec_queue *q)
    2249 {
    2250         struct xe_gpu_scheduler *sched = &q->guc->sched;
    2251         struct xe_sched_job *job = NULL;
    2252         bool restore_replay = false;
    2253 
    2254         list_for_each_entry(job, &sched->base.pending_list, drm.list) {
    2255                 restore_replay |= job->restore_replay;
    2256                 if (restore_replay) {
    2257                         xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
    2258                                   q->guc->id, xe_sched_job_seqno(job));
    2259 
    2260                         q->ring_ops->emit_job(job);
    2261                         job->restore_replay = true;
    2262                 }
    2263         }
    2264 
--> 2265         if (job)
    2266                 job->last_replay = true;

job is never NULL here, it's a pointer to an offset from the list_head.
So this corrupts memory.

    2267 }

regards,
dan carpenter
