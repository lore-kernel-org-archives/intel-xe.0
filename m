Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51CFC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 03:46:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4699710E04A;
	Wed, 10 Jan 2024 03:46:33 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EAB10E04A
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 03:46:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 3FF57B81C97;
 Wed, 10 Jan 2024 03:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE1A2C433F1;
 Wed, 10 Jan 2024 03:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704858388;
 bh=swsG9azHLeCAJ6JWTmjUc9NZWQrXEu8Hqtfs21Lgya8=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=UZNVgmSzwQzdgaLqn1axplx4MHQ0qJAuPOzXWz8xKrUECZgSRSTOrUG2KkK2JDBka
 sPd5/GXoJLImYx79/s6jZdm5wVn6iKt3fYHEVx99wkCGsfB2tVF7Zp+nWPl945cZot
 rsK28j0ycUc4qqXWRKsTGtAKvV2dIQL0iZCwNIYz/GtE/onaLNrup1+sMkFtPd0BCf
 XslBWEVLFhpAZEagsp8BGmls5/MwNwlFX6f6Qjy1/Nq6y+WByTnzGn5w622zt611vF
 /dfgMigi4FgjJNhE7hE0RpVFVf5JxFIoFMeCwiKiObP2VfYy6xoD3n9KT35S2PFvLO
 5iIazdoBSXf0A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 58AB0CE15D1; Tue,  9 Jan 2024 19:46:27 -0800 (PST)
Date: Tue, 9 Jan 2024 19:46:27 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [BUG] allmodconfig build error in next-20240108
Message-ID: <3d14049c-d44c-4b33-9933-0f96055b8a70@paulmck-laptop>
References: <45ad1d0f-a10f-483e-848a-76a30252edbe@paulmck-laptop>
 <20240109095757.1313b2d9@canb.auug.org.au>
 <341a4955-0cdd-48d0-bfbd-cc6f6f09df37@paulmck-laptop>
 <atbx7mspjbymkzgstk4l64qz3uky3wpmx4isrfg3ixgtvebdd2@cktpe4ejfk7k>
 <20240110081155.48bb0cbd@oak>
 <d61dfe52-9567-4f62-98f5-5c1e00cb4708@paulmck-laptop>
 <20240110095822.3ba3d979@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240110095822.3ba3d979@canb.auug.org.au>
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
Reply-To: paulmck@kernel.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 09:58:22AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 9 Jan 2024 14:45:56 -0800 "Paul E. McKenney" <paulmck@kernel.org> wrote:
> >
> > On Wed, Jan 10, 2024 at 08:11:55AM +1100, Stephen Rothwell wrote:
> > > 
> > > On Tue, 9 Jan 2024 10:58:40 -0600 Lucas De Marchi <lucas.demarchi@intel.com> wrote:  
> > > >
> > > > On Mon, Jan 08, 2024 at 03:15:23PM -0800, Paul E. McKenney wrote:  
> > > > I could reproduce it with allmodconfig and gcc 11.4.1 from rockylinux,
> > > > but not with gcc 9.3 or 12.3. Also it's not reproduced with gcc 11.4.1
> > > > when using defconfig + CONFIG_DRM_XE  (even if  -Wstringop-overflow is
> > > > still added).
> > > > 
> > > > I don't see a bug in the code, even if it inverts the head/tail
> > > > convention.
> > > > 
> > > > Searching around showed this which may be relevant: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101854
> > > > At least I can reproduce the same issue as in the snippet provided
> > > > (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101854#c7) with the buggy
> > > > compiler.
> > > > 
> > > > So, maybe the best thing to do for now is to disable -Wstringop-overflow
> > > > for gcc < 12?
> > > > 
> > > > 
> > > > ------8<-----
> > > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > > index 6952da8979ea..0433a3c6cbfd 100644
> > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > @@ -17,7 +17,7 @@ subdir-ccflags-y += $(call cc-option, -Wunused-const-variable)
> > > >   subdir-ccflags-y += $(call cc-option, -Wpacked-not-aligned)
> > > >   subdir-ccflags-y += $(call cc-option, -Wformat-overflow)
> > > >   subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
> > > > -subdir-ccflags-y += $(call cc-option, -Wstringop-overflow)
> > > > +subdir-ccflags-$(call gcc-min-version, 120000) += $(call cc-option, -Wstringop-overflow)
> > > >   subdir-ccflags-y += $(call cc-option, -Wstringop-truncation)
> > > >   # The following turn off the warnings enabled by -Wextra
> > > >   ifeq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
> > > > ------8<-----  
> > 
> > This I did, thank you!
> 
> Maybe that line "subdir-ccflags-y += $(call cc-option, -Wstringop-overflow)"
> should just be removed as the setting of that option has been moved to the
> normal C flags in the top level Makefile (out of Makefile.extrawarn).

If you meant like this, no joy.  :-(

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/Makefile b/Makefile
index 0705e7426ab7..446bd2da9fa3 100644
--- a/Makefile
+++ b/Makefile
@@ -988,7 +988,6 @@ KBUILD_CFLAGS += $(call cc-option, -fstrict-flex-arrays=3)
 
 #Currently, disable -Wstringop-overflow for GCC 11, globally.
 KBUILD_CFLAGS-$(CONFIG_CC_NO_STRINGOP_OVERFLOW) += $(call cc-option, -Wno-stringop-overflow)
-KBUILD_CFLAGS-$(CONFIG_CC_STRINGOP_OVERFLOW) += $(call cc-option, -Wstringop-overflow)
 
 # disable invalid "can't wrap" optimizations for signed / pointers
 KBUILD_CFLAGS	+= -fno-strict-overflow
