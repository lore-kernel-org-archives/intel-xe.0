Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E933606A321
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 21:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NJDeheqI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8685F10E365;
	Mon,  9 Nov 2026 21:19:17 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5464F10E365
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Nov 2026 21:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1794259150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ys5Qf2sygdYEIFynp57C8hwiHZBH3l4ISJ1KIFMKM7s=;
 b=NJDeheqINqUD4Cgj5ltZbflN2qaimRXAlx3Bkrc6sy2xH+nANkhEpWHpu6a/d3X5RiUbqq
 /GG3uU74LiGyd8IdRpFa7Z9F7/bSQ07lQ1GiM5maFf2z9KhL/32PyPnKdHnTNrNrw2kHFz
 9SJS1G19gunqx1lo8Bmj64AaA0XpIbE=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-HQeTCrGgPzSr4fI2KSlKcw-1; Mon, 09 Nov 2026 16:19:08 -0500
X-MC-Unique: HQeTCrGgPzSr4fI2KSlKcw-1
X-Mimecast-MFC-AGG-ID: HQeTCrGgPzSr4fI2KSlKcw_1794259148
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-8b0cd41e7aaso22022287b3.3
 for <intel-xe@lists.freedesktop.org>; Mon, 09 Nov 2026 13:19:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794259148; x=1794863948;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ys5Qf2sygdYEIFynp57C8hwiHZBH3l4ISJ1KIFMKM7s=;
 b=ChuxD+b+t1njvNalcNXiogKG0ltETNSNz1ija58s8ydGOOA9SDInmGVS0O5UuYD52L
 4+C8Zei6xIWnwb7roON+LuSFVY81NSyANUnJMXwYTQE2EXQ3Y8fic29CWxSW1xMmdSbL
 uZhEkRmFpJVLWnWVUO2nUW8e9uUz2KFIYtPn8zOx+Ch56VrVv0GfKtMSBd9eyglIt8Hk
 p5glwKC6PCVEo7Ra7mEmp/yIvdp8MOcg5HRRMZcUxyMFsw7ns9yb8ju3HtdOAZJgRoo3
 wehlcz5i4RyQ4L8VGiQLCLYE1M/jP4sjs3Q2AoYezkShL4YwJoxDt/+lq+RMbMkkheix
 yUog==
X-Gm-Message-State: APuU4Z+vjX1rdR47n1TDTEfRrQKsZDun3qKYXOEWYszMNQFVOP4Eewx6
 csvFv1T7gjYRo4YObs93uSPB5m4m+aK9JYlrsZaChf7RNVaY5vBLEe0vwtES9KSLYm3p0Wj1lLk
 Vs6pyriTiplnNiHE9bLBzmHvL75OQ6FToVH0ZCtgN0hTTZ7+/z+nAZLb1b6mmlDl0ikUL
X-Gm-Gg: AYBFou3JwcPYMpC8xQuWJrOuhTn//WE+8drLGhrj5e24ALtG1zi/myfweQIc32kY4p8
 k1B1VduH/XuCD9j+c9WFCteF8UUucA0Jjm+Oj+KuEqkm/PiNNhUONFI16JLmkgjLLK4teYDTq6Q
 XdzfXXt426xmeX3DEUmTJKrF0lUbKc5spKyLKn5NGQccAR8w2Lp1JXvq/tOeVy1vGZZliKGn0v4
 tDOvzTrHJZqJBMa8YU8K8wfUBcPigi1brjdX+SdkH1jbkXLY+10ceKmmZdEvkWiZ9bZuFSZonvo
 aorcEBaMVAGYg5IVp70ZoxdyjXoN7/vp2iWUTLoKWdwOeP1OY0cPsGtFIk7K8LLYqKeIprVz/az
 yuqXT4tLpbPvE2db8MMKtRkjOJSwqaHroq06+45MIg9YNXwTdSNkW5zq+pfR+Ev7JUHyZSmcAg7
 6WsUkz
X-Received: by 2002:a05:690c:a405:10b0:8b3:37e3:7515 with SMTP id
 00721157ae682-8b392c40b78mr2355727b3.67.1794259148195; 
 Mon, 09 Nov 2026 13:19:08 -0800 (PST)
X-Received: by 2002:a05:690c:a405:10b0:8b3:37e3:7515 with SMTP id
 00721157ae682-8b392c40b78mr2355587b3.67.1794259147674; 
 Mon, 09 Nov 2026 13:19:07 -0800 (PST)
Received: from alolivei-thinkpadp1gen7.rmtbr.csb
 ([2804:14c:bf20:840e:cd21:e2c1:d8ec:dfa8])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b39324bbf5sm4029017b3.1.2026.11.09.13.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 13:19:07 -0800 (PST)
From: Alexon Oliveira <alolivei@redhat.com>
To: Xiao Lu <xiaolu.xie@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, imre.deak@intel.com, ville.syrjala@linux.intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Subject: Re: [PATCH v2 0/2] drm/i915/dp_mst: Avoid the 3 s ACT timeouts after
 the upstream HPD drops
Date: Mon,  9 Nov 2026 18:19:01 -0300
Message-ID: <20261109211901.1033425-1-alolivei@redhat.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101033535.2078860-1-xiaolu.xie@intel.com>
References: <20261101033535.2078860-1-xiaolu.xie@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j7yVxzsZfPCxYkblp_C43G8K_y3SmesdydEfL5FZ0hs_1794259148
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 01, 2026 at 11:35:33AM +0800, Xiao Lu wrote:
> drm/i915/dp_mst: Avoid the 3 s ACT timeouts after the upstream HPD drops

Tested on a ThinkPad P1 Gen 7 (Meteor Lake) with a Lenovo ThinkPad
Thunderbolt 4 Dock (Synaptics VMM6212 MST hub) driving a Samsung TV over
HDMI, Fedora 44 kernel 7.2.15-200.fc44 with drm_display_helper.ko and
i915.ko rebuilt with both patches. On 7.2 the intel_dp_retrain_link()
hunk of patch 2 applies to intel_dp.c instead of
intel_dp_link_training.c, with identical context.

Scenario: TV powered on from standby, which makes the dock drop the
upstream HPD and tears down the MST topology
(https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17741).
Same day, drm.debug=0x104, times relative to "MST device may have
disappeared":

                                  unpatched        patched
  "Failed to get ACT after 3000"  3x               none
  forced retrain on stale pipe    yes (+2.14 s)    no
  new TV connector connected      +8.44 s          +2.48 s
  stream enabled on new connector +13.02 s         +6.61 s
  TV button to picture (by hand)  20.8 s           13.4 s

The ~2 s HPD drop from the dock is unchanged, as expected.

Tested-by: Alexon Oliveira <alolivei@redhat.com>

