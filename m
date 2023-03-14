Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B917C6FD1D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 12:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C31610E799;
	Tue, 14 Mar 2023 12:25:40 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF4910E799
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 12:25:37 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id m4so6768636lfj.2
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 05:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678796736;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xyWTgdV2nHXB6BceOX/0Kermrx195Jrqj8zpAFohaaA=;
 b=B/2cOv4T7D9mlSbHNqvI4TNSIV/W00NEAUJHMsyG2lBNmc5OO006LQPzvp+XodXYsR
 irZ4gcJOkQax8En3kfVX7E92jwQa2vVKy1HIVfutoaOkcEV8SNiZqYGQLypAcL6963DJ
 r5CTJ3qwivn9qvp7HMKPdC+XNsfLYRTUVWB343LHM3XjanGQOuDGKnGIuaZFLcjo7btx
 0Pn2nK8FUOct10a1IfUme3oTyx97eboZVDTguE11WkCeJvr6Lk6wJmHpPBE/gSqZC6By
 yxrstMxK0EbAr24BztUuOtq0MqQPVi6Citkq+HImihAteOgGKA5aOcf6Blgoug8qk8E9
 N14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678796736;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xyWTgdV2nHXB6BceOX/0Kermrx195Jrqj8zpAFohaaA=;
 b=44MVKFtIduFSjyQxgXRU3AFsNIvlvxlaAbXVL9UcdUpXq0QJX1Gf46RXaHy/3thFEC
 O4gCSYDtUtj8y0jb0N/0l92affhQxEF0aeqFiJ3GnwX1EJh+sQOlg0afLauGs/maWkgF
 NO9wbW9+o0kB5ntv7IG4h6OBZBuAfPGH6ZcpOuSGEQ7RlI74bFJzgxLZhPi+IOTz/YWo
 ZbMoc1Kf3orVEhc7EWvM4p8LlHx7aqTXc2fqzUNIAKh/EA7UhlUcfxsPUh5um/bgILQ1
 leXzLSNExG71wi4n4GwUDIZB5gJ260tWdi4l+rPePfa2Sdo1AGE7pt57HkJmdXM0fK4l
 MaRQ==
X-Gm-Message-State: AO0yUKWOwmOJSVhWmXvxC1ynIw6NvW/N3aB1zD8giARPfBCCdQneGlQ6
 Si4d5RHAykwGbL8PLmLiQ93aa4G3/ugwhboqYDJ1PycoS08=
X-Google-Smtp-Source: AK7set+shkfNi80jvPAUMtgI/yjzMCm3fOh1ATCmewjFkGDRj6l7D9Tl0sDr6OExxWoJxz3Cz1ICKbzqxDTnhbYSMes=
X-Received: by 2002:ac2:4a9b:0:b0:4dc:807a:d140 with SMTP id
 l27-20020ac24a9b000000b004dc807ad140mr674900lfp.10.1678796735775; Tue, 14 Mar
 2023 05:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230313204519.158888-1-thomas.hellstrom@linux.intel.com>
 <20230313204519.158888-4-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230313204519.158888-4-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 14 Mar 2023 12:25:08 +0000
Message-ID: <CAM0jSHP2bctQnbM_CDYK1Om2vmUX+uXyE4Npb5NJft8Ezgs+ag@mail.gmail.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 3/6] drm/xe/tests: Support CPU page-table
 updates in the migrate test
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

On Mon, 13 Mar 2023 at 20:46, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> The migrate test currently supports only GPU pagetable updates and
> will thus break if we fix the CPU pagetable update selection.
>
> Fix the migrate test first.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
