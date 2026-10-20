Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77FD606A322
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 12:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sVWccDA6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB4210E8EB;
	Tue, 20 Oct 2026 12:53:17 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com
 [74.125.82.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E297B10E1B6
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 01:22:10 +0000 (UTC)
Received: by mail-dy1-f172.google.com with SMTP id
 5a478bee46e88-33bf40b0c8bso1674325eec.0
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 18:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792459330; x=1793064130; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BRQxfRnCJX8kMYRddoKffawFo2/rbvLQllYbV+J0qgU=;
 b=sVWccDA66ViOBv6GwO6R5MYvZSYI1LuKiR8MvT/pXoE266IGIYD6S6l10dudSF5aM8
 69XizvcbSzK4Q12bCrZQEEnPDZuJDKNY4yURzPar9Yziss6I+peVXz7g/m85abS4+CZY
 DC2yBL2YP5e1m66/yu1YgklshMRiIIAhIHVdT7jGWgIsEHqozYuhuxO+O8c56dl5b5Jv
 CEqBsIPtaHLHIC80jl9m+yc3asQFZKNTQ7mMeEjEndGiztpeSxsnvTIZr2VodQVEELHn
 +uV0s01epb9cwzfDEmMWr1g0XwFdbnxVz9sGjX5vPqg7Rq8HgKVkaZN7VouX9kZtaOjl
 rKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792459330; x=1793064130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BRQxfRnCJX8kMYRddoKffawFo2/rbvLQllYbV+J0qgU=;
 b=mvpNYKlfQ+c+KIlo9FAfUHyUhiK1C79yXqDX9GjsrsWXoK+ntxX3yq0GrBXT2OV+w2
 VMVuFIlSJaXltqtttX8+C+Wei19UM1TB2FmtV3A+9PXsKHQXZ22t5coHwvVKGwI6cZPY
 VlRZnuCmBb1L16hY/t6cbePsGqu3ATJkq27NGb4/ohkPvFoz4M49nxpuuj2kgLYNMb52
 6qE92PnkGkVfwOlxV1hZY6vdHRdLsmx5muKZQaC0yxrQSJBdILkxH808pDBei/kb1EFy
 eDhQJyEI1JD8hP5g9fs+8Fn1R0R5fa4dy6oNAZLvpc15jD416MTgQ0Vio/L07yH635j0
 M/Xw==
X-Gm-Message-State: AFq9FYJ/5WkpBJFm8rTTx9muKDSRQliqh9Xv2JnKLvr+Cq1qyzqpght5
 GOjZysXJdRWKDSIvs36QxE5RDb7Y46vWmbB/Xe+md56xbbcaYd/AqHML
X-Gm-Gg: AYBFou20Rsy0J7Xzf7zkwgTD/qXnJQyE5K8sLoMv0qaj6pmEr1coCqIaMS8QQejeYiz
 xxMRzn+WSa1NjLeXx8h5TgiTPwDeCxhrsBaLoAcJkZcc5eWteUvz61cHEp17dSnZ+Za+vzb7rrx
 l0d0YxprpA6qR1hoBM1hb3ONqqtVBgnd+LhYXiuFV190yJR72afdz8A/dBAHnll2DZt2CDqvq6o
 0374xdNcywvG6o6uStUa93FnyphVhHttWLJdSUgrw22q1l432ifQzwwEZD1z013Ji4jYhHaIHOw
 n/BY8XbERZpYem7b6sZ8/vQix0RiJHOoTVF55/+M0k+lk2z9bCHAJSeM1y/Z3u9cL0xPBC9Rbto
 X1KRHsLdDLC3mfmmiWmz4wWGsZGeTuFLba2u7MG3DxxNDEyM3RnOtze4xjZq4EBqezd+x7zl114
 GgIKgCqUwlKsOjgRSc4hPZ0KmZOZZwMkG4U53bUUtUBSnBKMQ9Ag3FIEUGOx40uzn3uJ4dop4Sd
 6CxRgwcoxDlBBC1bjjAQiIxbx8tKkP7iiBvSPublqKR8faD67EBF+tKGw==
X-Received: by 2002:a05:7300:f0c5:b0:34c:aa3e:316b with SMTP id
 5a478bee46e88-361a1270b90mr13302844eec.11.1792459329975; 
 Mon, 19 Oct 2026 18:22:09 -0700 (PDT)
Received: from localhost.localdomain ([190.13.90.101])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-360813b792bsm37025973eec.5.2026.10.19.18.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 18:22:09 -0700 (PDT)
From: Lucas Moreno <lucasgabmoreno@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, i915-ci-infra@lists.freedesktop.org,
 jani.nikula@linux.intel.com, ville.syrjala@linux.intel.com
Subject: Re: [PATCH] drm/i915/bios: Fix reset sequence order on GLK VBTs with
 DEASSERT_RESET in INIT_OTP
Date: Mon, 19 Oct 2026 22:21:43 -0300
Message-ID: <20261020012144.9300-1-lucasgabmoreno@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013001245.12347-1-lucasgabmoreno@gmail.com>
References: <20261013001245.12347-1-lucasgabmoreno@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 Oct 2026 12:53:16 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Intel GFX CI did not run on this series because my address is not on
the allowlist. Could someone with access please trigger a retest from
Patchwork? Alternatively, I can ask i915-ci-infra to allowlist
lucasgabmoreno@gmail.com.

The patch only changes behavior on Gemini Lake DSI panels whose VBT has
the shape described in the commit message; other platforms are not
affected.

Thanks,
Lucas
