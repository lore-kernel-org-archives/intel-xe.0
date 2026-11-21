Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A3A606A320
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 12:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j7kxXjx3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF84310E3D8;
	Sat, 21 Nov 2026 12:47:40 +0000 (UTC)
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D72510E373
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 12:47:31 +0000 (UTC)
Received: by mail-dl1-f47.google.com with SMTP id
 a92af1059eb24-1ae7fc5681dso1973c88.1
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 04:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1795265251; x=1795870051;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=dy/9BbEZRYuwT8a6wlWpCFQITWgRsvXhPUvkZriskFw=;
 b=j7kxXjx3s3sTjKjt35pbR572NVzXcyH4SIUWebF3Oyw0OXLRuE7mALoNVfcDSo/P5x
 XxP4rHTBJydg/KFWSp0Mwb1bXq9hg17eyM7o5bHlWntl9F+/wyER9BpIhSN+Ns3+uoLq
 Mro64WsD21pcbwcivtppFkUIyxLpQMekOGNEIv89WH7GMMYmQXVoaaI9A8+5tQGgYA7a
 aKmNS37+I+swtDOz1EYFm0YBoe9p/WOjlsdfyJNzRLzfXrFM2d/x1mHtbOvYkTWBSBm2
 n6ixStt2l5l6QYhMlwCw/bzaqDin6R1MtKOaHBkoeukHICXQ8iKHAYM2xnEI2QCfYsTI
 ODhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795265251; x=1795870051;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=dy/9BbEZRYuwT8a6wlWpCFQITWgRsvXhPUvkZriskFw=;
 b=LBSfkWtMb1KvyH+6R8sgtglvQyrfU9pcKAJ5XR/VXQwfPR8fzesZpGjy0OIuEVWaI8
 jSB3FB6LI6MY8+xdZFu5j6oxyhDBgITz7T+KsJ4++LhaEmJXZyAH6ynPZu3LhxnoWBg5
 M01Wb9IPPGx0MA+h9WbbV97qCsE/47f6d8CNakmOjUZaE5dazj3OOWwGxl7jXUJ45Gd5
 XevsEVc32QGTiSs/sSE4nwtQg+ctVqoV6Y9AtZpyIUzfDnlaeBGEg+mqC6Lby5aL54DU
 587KAcTvXZz/NGWR9GDJ/VcAnpv06nCq0q7q/w+0sSwzJiZ/W7eSrV2nv5LH1xLUO/Cl
 hhvw==
X-Forwarded-Encrypted: i=1;
 AL+hErFQY+zQearXwofsBDKLKaCJSEcJE1/g74PZ4kc8k/yj72tmNKQ3msAMlhi8xrI0ejnr5w75lEmyhw==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/TsQLiDYfxaXbWD3nexyBlwyoTy2A6yLHsrv6W+kp0NsOIYbB+
 ZHDfAaVpfcxxjyQMJUxnnumwdl38APtSNL/lOEpBsFVmd83mNvx9pN6jP1AbeeuyaA==
X-Gm-Gg: AZFdTZdSzAQPnD1UScUIKmS/MnOIu+LDZOQdD95EG1MZbS5+LWCoRiyFGVt8NA+AGtV
 WtpKM+wSiOaF6Qgx3EM6OS6RSs0APt7jlpEOAhgKiitB995vGT6CrJ1zJGNJHbXmZkcOorQliYN
 MNiUWZHePXHDGRwaFI7Ak41GqTnWa8zgfYNrtOkxkM957wn1veKdJb/OK39Q0Hirk60V021FTEI
 68DlXriTvCqKvc4LoFUihqzy60JP4GphTEyTm5eE2o4of1qHJzzziIoHgHKaR64jNcX4j7kKJ9a
 N7tJ8dkaPGCOX00O9DSOFpfJ3YSLq5WF9ImWQhXcXyf/QvfWAU3z6mC+zPqpJi3dIGLnPGjPLrz
 o5SFTYbCdZWJaQTb7Jxv+N0fKOe//sajsXLo9wKuDJB5x3GWGCL5Iuw+pdD5JWeW4zj1oI1cYfv
 4/dejd0e0lF1VPh5AsFDvyVpjhpO8zrZRG5UygNWucq+UvYey89IPDGDUPDyo+HULB/pokhpV78
 sa5jHY2VKt/H4Gzi4ljrhcdv+L+yGPMNM+xMXvKnzlM+2msrFq/l3NHFhmaYc9nEP8HmJfD6zMm
 cVpdNr94IWFGWszzu9GUtJpMb57U1HJCL0PMAtxp4cey6zch6LxufeDdlpZ9dAS4Jy4=
X-Received: by 2002:a05:701a:cca2:10b0:139:90c3:391b with SMTP id
 a92af1059eb24-1b56336e369mr649347c88.1.1795265250428; 
 Sat, 21 Nov 2026 04:47:30 -0800 (PST)
Received: from google.com (105.211.142.34.bc.googleusercontent.com.
 [34.142.211.105]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-385677c371esm17147164eec.23.2026.11.21.04.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 04:47:29 -0800 (PST)
Date: Sat, 21 Nov 2026 12:47:22 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 Longfang Liu <liulongfang@huawei.com>,
 Julian Ruess <julianr@linux.ibm.com>, Ankit Agrawal <ankita@nvidia.com>,
 Brett Creeley <brett.creeley@amd.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Eric Auger <eric.auger@redhat.com>, Alex Williamson <alex@shazbot.org>,
 Mostafa Saleh <smostafa@google.com>, kvm@vger.kernel.org,
 qat-linux@intel.com, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 03/10] vfio: Allow untainted use of driver_override
Message-ID: <awGS2tAtt0yKFXMC@google.com>
References: <cover.1795171088.git.u.kleine-koenig@baylibre.com>
 <fb0df5c89336b77a373ae0f890f63427e4adbb28.1795171088.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb0df5c89336b77a373ae0f890f63427e4adbb28.1795171088.git.u.kleine-koenig@baylibre.com>
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
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 12:11:04PM +0100, Uwe Kleine-König wrote:
> From: Alex Williamson <alex@shazbot.org>
> 
> Driver overrides are the standard mechanism for binding vfio drivers
> to devices.  With the introduction of the support_driver_override flag
> in the core driver struct, it's now required for drivers to declare
> themselves as driver_override compatible, otherwise driver_override
> bindings will be denied or generate a kernel taint.
> 
> Set the support_driver_override flag on the driver struct across all
> vfio drivers.
> 
> Signed-off-by: Alex Williamson <alex@shazbot.org>
> Reviewed-by: Brett Creeley <brett.creeley@amd.com>
> Reviewed-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Ankit Agrawal <ankita@nvidia.com>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
