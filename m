Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7ED2C531C8
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 13:42:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFE210EDCE;
	Wed, 22 Jul 2026 13:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="djiFLKal";
	dkim-atps=neutral
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FEC10EAB1
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 16:49:35 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-84874b52eabso10900709b3a.0
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 09:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784652574; x=1785257374; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=jz3tCmNLomhxeSHRRM/RsgqxQHXL6/1WUZFNVLX32Kw=;
 b=djiFLKalkVvzaWWn/0V76JWmADXCfWmqevccQ0rDxLctFwjSzHHFOkvXHyrmnDhWi3
 nySzmwr8yE7rklc/zxVNJ0S5GfijSjNc27CkgVIT3wdfaP4WilGLN/boMV51NuscU2Mv
 T6Nloe/NerNtzQufBDYNr9Y0fZ51SxpM4owgBCLcJVdNGH/+BDPNVbWLOJz3sBshBUv2
 azjNURKJoPxrD5TRzeqWG9M203AXUOyqY7Zw6vEnF+Djutd0EP2w+n2gAS7ixEzKfsc2
 H9AIC3FtLX2+MTRyjKP/4p/qM5ByBC33laUppKTT1VeIBlEAMDzvAMM6VbfAZXF/UFvC
 qJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784652574; x=1785257374;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jz3tCmNLomhxeSHRRM/RsgqxQHXL6/1WUZFNVLX32Kw=;
 b=Msw8oDgFVpBGU0dJoUhxM6cNAvm1tqi+s32j8+15nZBv576Md9PREFU1CcGJ+rN8YP
 dTVG44XZhbkwsnhE/t1staOWQAobczyk7RYT7Jpku6ILeALloPaORb/UQoXw+G5px8RH
 mp7iF5S2tNcDUwCgiaL1iq/jb3C/qLh20JO02l+TGXrxqTc134S604hZxCBUT/DArxTU
 jU4qA/eROQtvwDr/pIrCq0MA4EhTHtcnEb4El7jwy7+N5DGYrRKISwyXQGAhhTQfcDHB
 BfXCXk7f7FseZVB0JqVzQPfj6C5LNMBq81olwITj5BPcC9Zp0IWfDm9GGzWnheePAuRk
 ExAw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpyeH3yUyddvrZRHn32Eu8i2mGtUHLI519Ik+XOG/ws6PmjAv8ds2rHy4Dz20vKSMe4K4wWKrl+QA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyX9Yb+2j5OcYYS+LYkr23GrcBWYoIuE4OF8vcDWdvxuSxm38Qw
 oUrHNswiV9exCKIFA5TXi7aEaxjijCSR/gjaN7hLzvpSIB82v/8H7Bsq
X-Gm-Gg: AR+sD12NPbqBpY4/GKLltu99nhEuMR2oQ054psJ6Hv3u6tf1QfzytdDgfWtLolIQLHa
 B7jeTDgZFNkO9Ox9HK3Oqr/+nKYlm5T/WeNFUEAEyxl1fKfdsS+I3TE8k+O6i3bjSkKkklMl7DO
 sbXT7WBdGesYT7eDfee8FMTutqQntNo6qjatdWdgXHqkOTu9fDh35Db0fGdIZ6vfIO1kusXqNFv
 ncaZkI6/kvNsIsmtclcKAJniybMNhwNQ43QMHEzqvXP1iaqFqubz8FBsvShcyG3eQo0pDvKwUg2
 BtV0FRsSey5c0zaoafo2GMtDZdJwU0n1CJDAX2xFxRhF606fcT+kwoinqy4SdfdgYaxbARXBTLa
 k0dJFrn4yjnl4JxYDeo8b1w1dIcxr9MoQng5n7AluNhkViDXXnRJphSCsM+GQlsxSH0BmN7DUZ7
 9MEGxWbig9zV1ZMC+FE5oonZDL810FJgJkmNzwyVGWecon
X-Received: by 2002:a05:6a00:cc7:b0:848:6f5c:a327 with SMTP id
 d2e1a72fcca58-84c29270ea2mr18663190b3a.15.1784652574553; 
 Tue, 21 Jul 2026 09:49:34 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84e175aad1asm5186b3a.44.2026.07.21.09.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 09:49:34 -0700 (PDT)
Date: Tue, 21 Jul 2026 09:49:31 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
 corbet@lwn.net, dakr@kernel.org, decui@microsoft.com,
 haiyangz@microsoft.com, jgg@ziepe.ca, kees@kernel.org,
 kys@microsoft.com, leon@kernel.org, liam@infradead.org,
 lizhi.hou@amd.com, ljs@kernel.org, longli@microsoft.com,
 lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
 rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, surenb@google.com, tzimmermann@suse.de,
 vbabka@kernel.org, wei.liu@kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org
Subject: Re: [PATCH v9 2/8] mm/hmm: add hmm_range_fault_unlocked_timeout()
 for mmap lock-drop support
Message-ID: <al-jG2fROgMWUq_T@skinsburskii>
References: <178413903133.1155966.3904063656020521607.stgit@skinsburskii>
 <178413936536.1155966.8918127042760531802.stgit@skinsburskii>
 <3ed2043b-88e7-4a86-9efb-fe788191e8e8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ed2043b-88e7-4a86-9efb-fe788191e8e8@kernel.org>
X-Mailman-Approved-At: Wed, 22 Jul 2026 13:42:23 +0000
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

On Tue, Jul 21, 2026 at 05:42:53PM +0200, David Hildenbrand (Arm) wrote:
> On 7/15/26 20:16, Stanislav Kinsburskii wrote:
> > hmm_range_fault() requires the caller to hold the mmap read lock for the
> > duration of the call. This is incompatible with mappings whose fault
> > handler may release the mmap lock, notably userfaultfd-managed regions,
> > where handle_mm_fault() can return VM_FAULT_RETRY or VM_FAULT_COMPLETED
> > after dropping the lock. Drivers that need to populate device page tables
> > for such mappings have no way to do so today.
> > 
> > Add hmm_range_fault_unlocked_timeout() for callers that do not need to hold
> > mmap_lock across any work outside the HMM fault itself. The helper takes
> > mmap_read_lock_killable() internally, calls the common HMM fault
> > implementation, and releases the lock before returning if it is still held.
> > The timeout is specified in jiffies; passing 0 retries indefinitely, while
> > a non-zero timeout makes the helper return -EBUSY when the retry budget
> > expires.
> 
> The timeout does not / cannot affect how long we might be stuck without the mmap
> lock in e.g., the userfaultfd handler. And also not how long it would take to
> actually grab the mmap lock.
> 
> That's expected with the timeout, right?
> 
> [...]
> 

You are right. Ideally, the timeout should account for the time needed
to acquire the lock.

However, this timeout is not strict, especially with userfaultfd. It is
more of a sentinel to make sure the kernel does not get stuck for too
long and that progress is being made.

The default value used by most callers is 1000 ms, so accounting for the
time needed to acquire the mmap_lock does not really make much sense to
me yet, given the sentinel goal.

Thanks,
Stanislav

> 
> Nothing else jumped at me.
> 
> -- 
> Cheers,
> 
> David
