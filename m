Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B8FC7619A
	for <intel-xe@archiver.kernel.org>; Tue, 11 Apr 2023 10:29:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CB610E1DF;
	Tue, 11 Apr 2023 10:29:53 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0469410E1DF
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Apr 2023 10:29:51 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id bx15so6042858ljb.7
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Apr 2023 03:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681208989; x=1683800989;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qLa9NMXokg3+iePqDu8FrcbWdBBBm3VBacxYwAFNmlA=;
 b=SsBsYoZU0Q3K467c69OgNpXtqFeSPQeIwe6MuCoPgudrsOiL17F7mTBNgX8yaAlz/C
 s01MSGrArLLgj92jfGcCK1OgzWzGi//M9Rho/3KEae4AnbiGazqld9dy65bGRB51UzMp
 IQYphcZfXCEP4sq/X8M1HwxOe05rYjHW6uomPrtmAwwawoC7HTVEN2CywtTphYXCNqVG
 MxwDhJiU1PKJHfn9JoRJSwYogucL++upp7AsXDMEuscatzjTd2c4apgsa6ziIcinSybX
 nerLLKlz1Qq1AAYU3I1puo5iw40Yd4Ejx338Tc4TcRJFBetvKtTZcwZXc2NEbhCNzLW9
 Bedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681208989; x=1683800989;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qLa9NMXokg3+iePqDu8FrcbWdBBBm3VBacxYwAFNmlA=;
 b=bLXJDUeotqXppUMCcXFMlNd2zt4+g9RtKlDaWPtUdIlhD/DINN98F+JxbkLRjDnzN4
 t61UaQzmj24UHC5LavjxCzH0hVL0vRb573ru9U4C2CK2F+FAqrqnFOiO0NU1KI2ZVQ4+
 QG+M39aQf8HtllAISy3fsQbJc2JF0tQCiIIub4z0GQdN4KmjZCTOEASfuuwSqMocaogm
 YI+vUqOCgHrTDJayNwTvRLH8uOGSnxNaC1jk+TEFoC11L1agIGKOUVwJ7Ea6b8EuLr9k
 f+T5SqtgdkPQB4Ov/47M55YKSHAkLt9AoBDC7sIHQ35x4wenw32CcvcRpVT5cmcBdM6f
 i1mw==
X-Gm-Message-State: AAQBX9eloaZpUaEzSS+wwJ0KgbwmEjb/aZ8rNMK4R8UO4iMVzn7r4pAq
 X4/1jcMXMUUbMdNwRabP0a0lTtl89XpAEVgQbQc=
X-Google-Smtp-Source: AKy350Z5BS3B/swxRLHlsatvnQcX8oMRjKN5a5xg4DybfsoKmHdCKVegFhb5cAs6F3c89hXB1AVshBF6i2h9IvpVrzk=
X-Received: by 2002:a2e:9dd8:0:b0:2a7:6bef:bc7f with SMTP id
 x24-20020a2e9dd8000000b002a76befbc7fmr657638ljj.5.1681208989374; Tue, 11 Apr
 2023 03:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230411003610.2780651-1-matthew.d.roper@intel.com>
In-Reply-To: <20230411003610.2780651-1-matthew.d.roper@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 11 Apr 2023 11:29:22 +0100
Message-ID: <CAM0jSHOZiPUzU5xRmLZuFdAgpx7FBYPS1+u_thxCygJK=SO0YQ@mail.gmail.com>
To: Matt Roper <matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH] Revert "drm/xe: Allocate regset space for
 Wa_1607983814 unconditionally"
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

On Tue, 11 Apr 2023 at 01:36, Matt Roper <matthew.d.roper@intel.com> wrote:
>
> This reverts commit dfa54efbe169b4fe0efbbb0adc8868e6172b41b5.
>
> Allocating the regset space unconditionally shouldn't have been
> necessary, but was an early attempt to paper over gitlab issue #232 on
> some platforms; now that #232 has been fixed properly, this bandaid can
> be removed.
>
> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/232
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
