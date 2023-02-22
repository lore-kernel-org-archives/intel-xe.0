Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0095C61DA4
	for <intel-xe@archiver.kernel.org>; Wed, 22 Feb 2023 10:17:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82EBE10E2D6;
	Wed, 22 Feb 2023 10:17:04 +0000 (UTC)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EE910E2D6
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 10:17:02 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id x41so7391859ljq.13
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 02:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=thWLS10J50BKW8CJGO7JuN3uSoVDmESRWkAlV8IW1yU=;
 b=glUxF/4M6l4M6LcHFyaLC9qzWA9f0x765vQE5jMEToe3imCAcs8UW2tiKoIu7xZyQa
 Aa40EIlqxOw4fgmxDRIPulu1LRBLY0GBGNkIvImzzD5t3OdHixg/vLJkrkyLKcanSNSi
 McGeFhQRRx4wz4f+ImNDsh8gMlriufhJFRIlVFkPzsmWqPO+KvOkzpRD2P11ejxYgxxi
 MVOYWLXH+bUUCZ+081fmHoMXpmIWeuSXGhNtf7HdWT8owSWRlhppzioziNHPaMTsfzoP
 VjKoT2iUMHSfor/dKwHsz3V0SDu/hfwdmwtfYzZVpVgVHUvSq3DwTS3bkO5k3ATMCrtE
 4YAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=thWLS10J50BKW8CJGO7JuN3uSoVDmESRWkAlV8IW1yU=;
 b=Z2+VZfijxLvUZz5xlcwtpG5SDfXvsmwjK37gYDFR+cwAPtm3eiw03CwoIHhxUWTekO
 I3KkSiC6OxBt+hCdiNYgzO3wVXCM9EXRN8klaocVEdsbT0keakADnneEBAfrcSub+zKW
 nRcZNHTnAQOp6HLAEXX7NAx8cHaYqfh61/5W/0PgAk/LbZDVtvHBJcP4LIRfVckD4fyG
 q6hYFHIN2ZgIifqMoAmxnOqPQ4sk4b/YaDPTjUndoB8fHgw6w/eT4rgQqR1cKZ+Z2jQ2
 dfyLtOr9wBmB6l/8psX7T1jw84IsFtNDah7hzmgYYQ3FcwdU/Kv5/+7fRVrwYHZ6yxuO
 KPsQ==
X-Gm-Message-State: AO0yUKWprNcbKyOSJ0yceUvSnB/iFhNL4uzOAm4ApsxHLXTfVgnWXR4K
 +FFKR2P8gD8F42a/BTZVF8eN0u7E/TRRy9d7hPULtXa7aKk=
X-Google-Smtp-Source: AK7set9NuaFNXRgftU+0bY6edpQxublzuelflVW0NbHRwxjIQaUfm0J/LpqFOrknKUYyK19PJNAKoI+8z/mYG1LxpuI=
X-Received: by 2002:a05:651c:3dd:b0:293:4be7:14d5 with SMTP id
 f29-20020a05651c03dd00b002934be714d5mr2605585ljp.2.1677061020996; Wed, 22 Feb
 2023 02:17:00 -0800 (PST)
MIME-Version: 1.0
References: <20230221233348.883897-1-lucas.demarchi@intel.com>
 <20230221233348.883897-3-lucas.demarchi@intel.com>
In-Reply-To: <20230221233348.883897-3-lucas.demarchi@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 22 Feb 2023 10:16:33 +0000
Message-ID: <CAM0jSHOiGSkYYnRi+T6_WZsPLfQT_7-xiV=iWxahGOgPMUDnAg@mail.gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH 2/6] drm/xe: Fix application of LRC tunings
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 21 Feb 2023 at 23:34, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>
> LRC tunings were added after the gt ones and didn't add the call
> in xe_gt_record_default_lrcs() to process them like is done for
> workarounds. Add such a function and call it from
> xe_gt_record_default_lrcs().
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
