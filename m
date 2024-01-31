Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B125C47258
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 19:42:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F6110FCB1;
	Wed, 31 Jan 2024 19:42:41 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD6A10FCB1
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jan 2024 19:42:41 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a35b32bd055so11556666b.2
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jan 2024 11:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706730099; x=1707334899; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HTIKv8KHZT0+EbrR61dyEoaKbO7b4hbSOHJXjPkcobA=;
 b=gIh/TlFs2x9RPurBjhAZn7DNnV1tPwQtE0cNC9eLa30dD6kdeS8F2d27E/y5b/DzT5
 /LXbsxH2pUhMRVH27RZxIS6n37c4EHoHscY8KP7x/F7ZH3k55strQqvkVVdGocO0jQFP
 pHXefgY1jopcMKZT1vMSlzqlOIDJW2nOHLHWcYwti+/RXuTYFlJkrXXSIJ0oAbRXL3PK
 k3nU3T3cbfrrDjjxECuGdlA4CP+xlbdjjL7nLycjQg6m6vGKwb3fSXWD5QotoHCBmRKt
 Ftx2eVxiLNwc4WO8nNmulQcWYy+Tig1TpX1B9COcd0px50mrPmO2VztJmumGYqOBmnr6
 kLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706730099; x=1707334899;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HTIKv8KHZT0+EbrR61dyEoaKbO7b4hbSOHJXjPkcobA=;
 b=JU4ByV+HCBTKuB4hFuMoFi5JgKssHdjbq658L72F6+MmC6vX516PXG9sKvNNHhmp0Q
 as0MQYhzAikaVxFtQzrNZVZ0WTLB6EfEnKiqlGmEZc/dRBuc/lxFJbuxu70Zh3UUQYLe
 t/uLrhhKB/4m63D1Ouu/5neGotBSs6fVwquGqryVnJ0Occ8umf1kb9vXk42RyH3p22uk
 O9hKtWV5zsi+mFl2lZx1TX9UZVCnHi2SOgh3CTQAV+vK+KV4e5kgH9Y/Lch7X2/LMwKp
 hoJwNfElbS2HlyBUUiLbCumIfQ2Pmao4dsOykwwohlsmUE8ERizSLjirBO4WcrN00bXX
 uuhw==
X-Gm-Message-State: AOJu0YxRe5QgperWCK25saSnAUD0y+5Q/uIZs5pH9hqYNgUGT93wA5ri
 Vc/xxF5UCZkm4Wj9eenfeTUzSVsLLCxfOS3Gd4YqUsHK8OG/R8xOsce/vp4v8zqOb/fWCO6URuL
 irR1ME7WKeJNjo2A4b5IxHZebmixAS1OR2MI=
X-Google-Smtp-Source: AGHT+IHG0HFOMnzf2Z3Z5sRLCqghm3HYW49rbRM1u35L/b9/ctHR9WAXQiIic9tz6jbysxflAg46OceHFnTcDhcLNwc=
X-Received: by 2002:a17:906:111a:b0:a30:b29f:29ef with SMTP id
 h26-20020a170906111a00b00a30b29f29efmr1847381eja.42.1706730099414; Wed, 31
 Jan 2024 11:41:39 -0800 (PST)
MIME-Version: 1.0
References: <20240130125220.5517-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240130125220.5517-1-thomas.hellstrom@linux.intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 1 Feb 2024 05:41:27 +1000
Message-ID: <CAPM=9tx_9S3yD3A46rP_NOO_FaPHwWaPMeX2wkx8Rh4iqO8cvQ@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/xe/uapi: Remove support for persistent exec_queues
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 30 Jan 2024 at 22:52, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Persistent exec_queues delays explicit destruction of exec_queues
> until they are done executing, but destruction on process exit
> is still immediate. It turns out no UMD is relying on this
> functionality, so remove it. If there turns out to be a use-case
> in the future, let's re-add.
>
> Persistent exec_queues were never used for LR VMs
>
> Open: Should we renumber the exec_queue properties, or leave a hole
> as in this patch.


So can we have a bit of insight into how this happened? Like we just
merged xe and it already has uapi that had no userspace?

Like seriously? I'm sorry Intel has all these crazy silos with
compute, video, graphics and kernel teams, but that should be Intel's
internal problem, can we stop exposing your org chart outside the
company?

If you can't get someone from the compute team to work in the kernel
driver space when a new uAPI is needed, and instead powerpoint up
uAPIs without commitments, then xe is going to end up being in the
same hole as i915.

Dave.
