Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD9EC83F17
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 22:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E1D310E6E0;
	Tue, 15 Jul 2025 22:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="k5V+qsm1";
	dkim-atps=neutral
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8E910E6E0
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 22:59:55 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-73e560636d6so737827a34.2
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 15:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752620394; x=1753225194; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JxD59q5j7TwPEyReo+0JHxJnc1xOUi+p5HrxPKMsgOA=;
 b=k5V+qsm1BV2M3BNHfyxXijHrWjoTSaLbTrfYv8sSwcyUNZGE7VMMpndLMeMaughn9t
 qO5YLMrNcOpcToJdADSF0Klhd5+FI7bFO1nnTm7zXuk0mOM+m2QDG/bLaepLLYfvsx7m
 PlELFyIzhTEiNCuJ/avySkLEVhdRXGOTizZXvicN/DVltd0+hoarDVQZKaOdEv6TNn/m
 DKkILavmleuDI4XVvBd5iOLwaK17mvGhXIXGJHj/IhQb5R1HB76gDWqvsna6mUTcaSeU
 iehlRS0MTI0bmwT0hE8VAvItL7ZiOY6EydNMEiZ0DLn5WmanNOX7//o6pQfGkWTQia1o
 zlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752620394; x=1753225194;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JxD59q5j7TwPEyReo+0JHxJnc1xOUi+p5HrxPKMsgOA=;
 b=gQ9uZBEvDjRlfKsgLylzydjP9WM3p4LaQEDKMJPvyCZ9wfX5wwbT1e5apTVuW4IHYE
 mnQ6cUAOLmpIkzFPnhjHYJZYk0IEDuz+44ftruwmziaP7NnSX+v1JFwbiizP37gLI2jU
 NvP7IiXbjsg21nsAOsyXcvVXXZSTp8gsnHlSgiiOVrUHGFSbOx0u5hEaQbU3a6mqAjV3
 t3IgQ983a5wkIIhUaJi5i9NP7JDzT9L6DkGDPaK2SOsTBsH9ZEM7HnRNPI6oOT2ef0H8
 9NefhBDhrek9ZzAujbl0Ws5PtzP4yodqulXdMLqrEj5wZmUtFyd6/dP8ZU4hfjlJlMcs
 efsg==
X-Gm-Message-State: AOJu0Yyw6NmQ6HUR6TlehBijq8LJw9PyaVScP3aJLTEUoEGPaCdCN8wG
 yD3BMMNA8opq6fHL8wNLuUoDl7YwDzawbXR7tgiNsQLrL/pOvEvJYAY6l+lhkMruxe/WCMQxnnt
 TFgST
X-Gm-Gg: ASbGncuV2YtzjtuQAaGu+ebtu8AaHo+A6qwY0Qz/oXScHSR+jFYe/T+L6tMhAX0APSt
 cGUrjuSAPVPVOoMIYWuhoUqGSak0NwNf0z5S5w2kTQ7O9u58BjDEZsYgAgxNNxEE8jOllnZ1s5n
 AZigbKSD8gIGf+Tjjzy5Di7xPbwIsX/k4CZI3ZLlaCChSlkoDju+5Dz3lAqTDUDSm1sgk/ImnbV
 9vhTYyLYE/HC3r64i2ySRLIjYKdvGQkQTA853dukfTLykUITP7KPp10ajYp4CH3Arhch4nScq9V
 IToLmL4L7ZdXjQSs97jqILe3Rxkl1nNUgauhtz7/lrgQxAZrrFg4hPTepjUyXe2lFPP3FSO0Mu8
 I16IXY7huhxeSQg9tsRJuseG/7cyk
X-Google-Smtp-Source: AGHT+IGyVyUsX81Tau12YsnZbGFNUOEpzY/xhYIdOgE4GcPtaUqfNxDJDY3qrBhSFwF4MoA79xDaxQ==
X-Received: by 2002:a05:6830:7311:b0:72b:9bb3:67cd with SMTP id
 46e09a7af769-73e64a8bf13mr1155076a34.12.1752620394618; 
 Tue, 15 Jul 2025 15:59:54 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
 by smtp.gmail.com with UTF8SMTPSA id
 46e09a7af769-73cf10aa35esm2518632a34.27.2025.07.15.15.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 15:59:54 -0700 (PDT)
Date: Tue, 15 Jul 2025 17:59:53 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [bug report] drm/xe/uc: Disable GuC communication on hardware
 initialization error
Message-ID: <23dd9160-df79-4827-a814-99e486c08ea4@sabinyo.mountain>
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

Hello Zhanjun Dong,

Commit b2c4ac219fa4 ("drm/xe/uc: Disable GuC communication on
hardware initialization error") from Jul 7, 2025 (linux-next), leads
to the following Smatch static checker warning:

	drivers/gpu/drm/xe/xe_uc.c:167 vf_uc_load_hw()
	warn: missing unwind goto?

drivers/gpu/drm/xe/xe_uc.c
    147 static int vf_uc_load_hw(struct xe_uc *uc)
    148 {
    149         int err;
    150 
    151         err = xe_uc_sanitize_reset(uc);
    152         if (err)
    153                 return err;
    154 
    155         err = xe_guc_enable_communication(&uc->guc);
    156         if (err)
    157                 return err;
    158 
    159         err = xe_gt_sriov_vf_connect(uc_to_gt(uc));
    160         if (err)
    161                 goto err_out;
    162 
    163         uc->guc.submission_state.enabled = true;
    164 
    165         err = xe_guc_opt_in_features_enable(&uc->guc);
    166         if (err)
--> 167                 return err;
                        ^^^^^^^^^^^
Should this be "goto err_out;" as well?

    168 
    169         err = xe_gt_record_default_lrcs(uc_to_gt(uc));
    170         if (err)
    171                 goto err_out;
    172 
    173         return 0;
    174 
    175 err_out:
    176         xe_guc_sanitize(&uc->guc);
    177         return err;
    178 }

regards,
dan carpenter
