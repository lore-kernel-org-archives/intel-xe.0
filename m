Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBD1C5478A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 17:10:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A3810E0FE;
	Wed, 21 Feb 2024 17:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2nryGnp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6762E10E0FE
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 17:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708535455; x=1740071455;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=zU0cXaXO7/7rfuspE+c6JOmc4JbZgaHKn5RHlyECqQU=;
 b=m2nryGnpFZOtboQCZTL1iiP6w0U8fcun/rz5dzen/SEW3NYeEjrm2U65
 ZdlwI0ntP4vOmvNB6Yhl6pw6bdQNVTgb0kzaoQ9ZmqeN5Ra76HwNZUs76
 gguHHeG8van662OILMZ/ELJnzwvtItg1kD+HKjJWd+dA6efVhIVmmE+x7
 /cJ+nkwjkcBlz5ski94YSLJT+Uhfe+wMjcdHxBzh46o+ddS+Z7W4TPWeS
 clu84bxrPy36b6Oxj8ZtVep+T9Z2yd9w7+Q3XavNu868tfmzhv88cAUVq
 GHGxosz6w6YCyjsWMudbMOD0AIBLEFxYqStAVsaxN14rYxMShUVn8rIPe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13269444"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="13269444"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 09:10:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="42672017"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 21 Feb 2024 09:10:15 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rcq6S-0005Wk-1q;
 Wed, 21 Feb 2024 17:09:54 +0000
Date: Thu, 22 Feb 2024 01:08:13 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD REGRESSION
 87fc1e8b66fead9b3bb462f83444f3203585c7ee
Message-ID: <202402220106.rVZ6YRUq-lkp@intel.com>
User-Agent: s-nail v14.9.24
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: 87fc1e8b66fead9b3bb462f83444f3203585c7ee  drm/i915: Convert RE=
G_GENMASK* to fixed-width GENMASK_*

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202402212056.HpTtC3jO-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/arm64/kernel/cpu-reset.S:571: Error: found 'l', expected: ')'
arch/arm64/kernel/cpu-reset.S:571: Error: junk at end of line, first unreco=
gnized character is `l'
arch/arm64/kernel/cpu-reset.S:571: Error: non-constant expression in ".if" =
statement
arch/arm64/kernel/cpu-reset.S:577: Error: unexpected characters following i=
nstruction at operand 2 -- `movz x12,:abs_g3:(0|(0+(((unsigned long)~0ULL-(=
(unsigned long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)=
*8)-1-(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28))+1)&((un=
signed long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((unsigned lon=
g)~0ULL-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((sizeof(unsig=
ned long)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(20)=
)+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|(0+(((uns=
igned long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((siz=
eof(unsigned long)*8)-1-(11))))))'
arch/arm64/kernel/cpu-reset.S:578: Error: unexpected characters following i=
nstruction at operand 2 -- `movk x12,:abs_g2_nc:(0|(0+(((unsigned long)~0UL=
L-((unsigned long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsigned lo=
ng)*8)-1-(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28))+1)&(=
(unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((unsigned =
long)~0ULL-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((sizeof(un=
signed long)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(=
20))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|(0+(((=
unsigned long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((=
sizeof(unsigned long)*8)-1-(11))))))'
arch/arm64/kernel/cpu-reset.S:580: Error: unexpected characters following i=
nstruction at operand 2 -- `movk x12,:abs_g1_nc:(0|(0+(((unsigned long)~0UL=
L-((unsigned long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsigned lo=
ng)*8)-1-(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28))+1)&(=
(unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((unsigned =
long)~0ULL-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((sizeof(un=
signed long)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(=
20))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|(0+(((=
unsigned long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((=
sizeof(unsigned long)*8)-1-(11))))))'
arch/arm64/kernel/cpu-reset.S:582: Error: unexpected characters following i=
nstruction at operand 2 -- `movk x12,:abs_g0_nc:(0|(0+(((unsigned long)~0UL=
L-((unsigned long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsigned lo=
ng)*8)-1-(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28))+1)&(=
(unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((unsigned =
long)~0ULL-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((sizeof(un=
signed long)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(=
20))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|(0+(((=
unsigned long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((=
sizeof(unsigned long)*8)-1-(11))))))'
arch/arm64/kernel/entry-fpsimd.S:271: Error: found 'l', expected: ')'
arch/arm64/kernel/entry-fpsimd.S:271: Error: unexpected characters followin=
g instruction at operand 3 -- `bic x2,x1,(0+(((unsigned long)~0ULL-((unsign=
ed long)(1)<<(0))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(3=
)))))'
arch/arm64/kernel/head.S:181: Error: unexpected characters following instru=
ction at operand 3 -- `orr x0,x0,#(0+(((unsigned long)~0ULL-((unsigned long=
)(1)<<(54))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(54)))))'
arch/arm64/kernel/head.S:571: Error: found 'l', expected: ')'
arch/arm64/kernel/head.S:571: Error: junk at end of line, first unrecognize=
d character is `l'
arch/arm64/kernel/head.S:571: Error: non-constant expression in ".if" state=
ment
arch/arm64/kernel/head.S:577: Error: unexpected characters following instru=
ction at operand 2 -- `movz x0,:abs_g3:((0+(((unsigned long)~0ULL-((unsigne=
d long)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(1=
1)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(14))+1)&((unsigned l=
ong)~0ULL>>((sizeof(unsigned long)*8)-1-(14))))))'
arch/arm64/kernel/head.S:577: Error: unexpected characters following instru=
ction at operand 2 -- `movz x0,:abs_g3:(0|(0+(((unsigned long)~0ULL-((unsig=
ned long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-=
(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28))+1)&((unsigned=
 long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((unsigned long)~0UL=
L-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((sizeof(unsigned lo=
ng)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(20))+1)&(=
(unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|(0+(((unsigned =
long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof(un=
signed long)*8)-1-(11))))))'
arch/arm64/kernel/head.S:577: Error: unexpected characters following instru=
ction at operand 2 -- `movz x1,:abs_g3:(0|(0+(((unsigned long)~0ULL-((unsig=
ned long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-=
(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28))+1)&((unsigned=
 long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((unsigned long)~0UL=
L-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((sizeof(unsigned lo=
ng)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(20))+1)&(=
(unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|(0+(((unsigned =
long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof(un=
signed long)*8)-1-(11))))))'
arch/arm64/kernel/head.S:578: Error: unexpected characters following instru=
ction at operand 2 -- `movk x0,:abs_g2_nc:((0+(((unsigned long)~0ULL-((unsi=
gned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1=
-(11)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(14))+1)&((unsigne=
d long)~0ULL>>((sizeof(unsigned long)*8)-1-(14))))))'
arch/arm64/kernel/head.S:578: Error: unexpected characters following instru=
ction at operand 2 -- `movk x0,:abs_g2_nc:(0|(0+(((unsigned long)~0ULL-((un=
signed long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)=
-1-(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28))+1)&((unsig=
ned long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((unsigned long)~=
0ULL-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((sizeof(unsigned=
 long)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(20))+1=
)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|(0+(((unsign=
ed long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof=
(unsigned long)*8)-1-(11))))))'
arch/arm64/kernel/head.S:578: Error: unexpected characters following instru=
ction at operand 2 -- `movk x1,:abs_g2_nc:(0|(0+(((unsigned long)~0ULL-((un=
signed long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)=
-1-(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28))+1)&((unsig=
ned long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((unsigned long)~=
0ULL-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((sizeof(unsigned=
 long)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(20))+1=
)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|(0+(((unsign=
ed long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof=
(unsigned long)*8)-1-(11))))))'
arch/arm64/kernel/head.S:580: Error: unexpected characters following instru=
ction at operand 2 -- `movk x0,:abs_g1_nc:((0+(((unsigned long)~0ULL-((unsi=
gned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1=
-(11)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(14))+1)&((unsigne=
d long)~0ULL>>((sizeof(unsigned long)*8)-1-(14))))))'
arch/arm64/kernel/head.S:580: Error: unexpected characters following instru=
ction at operand 2 -- `movk x0,:abs_g1_nc:(0|(0+(((unsigned long)~0ULL-((un=
signed long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)=
-1-(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28))+1)&((unsig=
ned long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((unsigned long)~=
0ULL-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((sizeof(unsigned=
 long)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(20))+1=
)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|(0+(((unsign=
ed long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof=
(unsigned long)*8)-1-(11))))))'
arch/arm64/kernel/head.S:580: Error: unexpected characters following instru=
ction at operand 2 -- `movk x1,:abs_g1_nc:(0|(0+(((unsigned long)~0ULL-((un=
signed long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)=
-1-(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28))+1)&((unsig=
ned long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((unsigned long)~=
0ULL-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((sizeof(unsigned=
 long)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(20))+1=
)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|(0+(((unsign=
ed long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof=
(unsigned long)*8)-1-(11))))))'
arch/arm64/kernel/head.S:582: Error: unexpected characters following instru=
ction at operand 2 -- `movk x0,:abs_g0_nc:((0+(((unsigned long)~0ULL-((unsi=
gned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1=
-(11)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(14))+1)&((unsigne=
d long)~0ULL>>((sizeof(unsigned long)*8)-1-(14))))))'
arch/arm64/kernel/head.S:582: Error: unexpected characters following instru=
ction at operand 2 -- `movk x0,:abs_g0_nc:(0|(0+(((unsigned long)~0ULL-((un=
signed long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)=
-1-(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28))+1)&((unsig=
ned long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((unsigned long)~=
0ULL-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((sizeof(unsigned=
 long)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(20))+1=
)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|(0+(((unsign=
ed long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof=
(unsigned long)*8)-1-(11))))))'
arch/arm64/kernel/head.S:582: Error: unexpected characters following instru=
ction at operand 2 -- `movk x1,:abs_g0_nc:(0|(0+(((unsigned long)~0ULL-((un=
signed long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)=
-1-(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28))+1)&((unsig=
ned long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((unsigned long)~=
0ULL-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((sizeof(unsigned=
 long)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(20))+1=
)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|(0+(((unsign=
ed long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof=
(unsigned long)*8)-1-(11))))))'
arch/arm64/kernel/head.S:91: Error: unexpected characters following instruc=
tion at operand 3 -- `and x0,x0,(0+(((unsigned long)~0ULL-((unsigned long)(=
1)<<(4))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(4)))))'
arch/arm64/kernel/hyp-stub.S:289: Error: found 'l', expected: ')'
arch/arm64/kernel/hyp-stub.S:289: Error: unexpected characters following in=
struction at operand 2 -- `mov x1,#(0+(((unsigned long)~0ULL-((unsigned lon=
g)(1)<<(0))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(3)))))'
arch/arm64/kernel/hyp-stub.S:323: Error: unexpected characters following in=
struction at operand 3 -- `orr x0,x0,(0+(((unsigned long)~0ULL-((unsigned l=
ong)(1)<<(31))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(31))=
)))'
arch/arm64/kernel/hyp-stub.S:571: Error: junk at end of line, first unrecog=
nized character is `l'
arch/arm64/kernel/hyp-stub.S:571: Error: non-constant expression in ".if" s=
tatement
arch/arm64/kernel/hyp-stub.S:577: Error: unexpected characters following in=
struction at operand 2 -- `movz x0,:abs_g3:(0|(0+(((unsigned long)~0ULL-((u=
nsigned long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8=
)-1-(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28))+1)&((unsi=
gned long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((unsigned long)=
~0ULL-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((sizeof(unsigne=
d long)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(20))+=
1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|(0+(((unsig=
ned long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeo=
f(unsigned long)*8)-1-(11))))))'
arch/arm64/kernel/hyp-stub.S:578: Error: unexpected characters following in=
struction at operand 2 -- `movk x0,:abs_g2_nc:(0|(0+(((unsigned long)~0ULL-=
((unsigned long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long=
)*8)-1-(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28))+1)&((u=
nsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((unsigned lo=
ng)~0ULL-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((sizeof(unsi=
gned long)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(20=
))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|(0+(((un=
signed long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((si=
zeof(unsigned long)*8)-1-(11))))))'
arch/arm64/kernel/hyp-stub.S:580: Error: unexpected characters following in=
struction at operand 2 -- `movk x0,:abs_g1_nc:(0|(0+(((unsigned long)~0ULL-=
((unsigned long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long=
)*8)-1-(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28))+1)&((u=
nsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((unsigned lo=
ng)~0ULL-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((sizeof(unsi=
gned long)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(20=
))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|(0+(((un=
signed long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((si=
zeof(unsigned long)*8)-1-(11))))))'
arch/arm64/kernel/hyp-stub.S:582: Error: unexpected characters following in=
struction at operand 2 -- `movk x0,:abs_g0_nc:(0|(0+(((unsigned long)~0ULL-=
((unsigned long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long=
)*8)-1-(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28))+1)&((u=
nsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((unsigned lo=
ng)~0ULL-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((sizeof(unsi=
gned long)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(20=
))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|(0+(((un=
signed long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((si=
zeof(unsigned long)*8)-1-(11))))))'
arch/arm64/kernel/relocate_kernel.S:571: Error: found 'l', expected: ')'
arch/arm64/kernel/relocate_kernel.S:571: Error: junk at end of line, first =
unrecognized character is `l'
arch/arm64/kernel/relocate_kernel.S:571: Error: non-constant expression in =
".if" statement
arch/arm64/kernel/relocate_kernel.S:577: Error: unexpected characters follo=
wing instruction at operand 2 -- `movz x12,:abs_g3:(0|(0+(((unsigned long)~=
0ULL-((unsigned long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsigned=
 long)*8)-1-(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28))+1=
)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((unsign=
ed long)~0ULL-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((sizeof=
(unsigned long)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)=
<<(20))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|(0+=
(((unsigned long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>=
>((sizeof(unsigned long)*8)-1-(11))))))'
arch/arm64/kernel/relocate_kernel.S:578: Error: unexpected characters follo=
wing instruction at operand 2 -- `movk x12,:abs_g2_nc:(0|(0+(((unsigned lon=
g)~0ULL-((unsigned long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsig=
ned long)*8)-1-(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28)=
)+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((uns=
igned long)~0ULL-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((siz=
eof(unsigned long)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)=
(1)<<(20))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|=
(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0U=
LL>>((sizeof(unsigned long)*8)-1-(11))))))'
arch/arm64/kernel/relocate_kernel.S:580: Error: unexpected characters follo=
wing instruction at operand 2 -- `movk x12,:abs_g1_nc:(0|(0+(((unsigned lon=
g)~0ULL-((unsigned long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsig=
ned long)*8)-1-(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28)=
)+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((uns=
igned long)~0ULL-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((siz=
eof(unsigned long)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)=
(1)<<(20))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|=
(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0U=
LL>>((sizeof(unsigned long)*8)-1-(11))))))'
arch/arm64/kernel/relocate_kernel.S:582: Error: unexpected characters follo=
wing instruction at operand 2 -- `movk x12,:abs_g0_nc:(0|(0+(((unsigned lon=
g)~0ULL-((unsigned long)(1)<<(29))+1)&((unsigned long)~0ULL>>((sizeof(unsig=
ned long)*8)-1-(29)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(28)=
)+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(28)))))|(0+(((uns=
igned long)~0ULL-((unsigned long)(1)<<(22))+1)&((unsigned long)~0ULL>>((siz=
eof(unsigned long)*8)-1-(22)))))|(0+(((unsigned long)~0ULL-((unsigned long)=
(1)<<(20))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(20)))))|=
(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0U=
LL>>((sizeof(unsigned long)*8)-1-(11))))))'
arch/arm64/kvm/hyp/nvhe/hyp-init.S:181: Error: unexpected characters follow=
ing instruction at operand 3 -- `orr x0,x0,#(0+(((unsigned long)~0ULL-((uns=
igned long)(1)<<(54))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-=
1-(54)))))'
arch/arm64/kvm/hyp/nvhe/hyp-init.S:289: Error: unexpected characters follow=
ing instruction at operand 2 -- `mov x1,#(0+(((unsigned long)~0ULL-((unsign=
ed long)(1)<<(0))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(3=
)))))'
arch/arm64/kvm/hyp/nvhe/hyp-init.S:571: Error: found 'l', expected: ')'
arch/arm64/kvm/hyp/nvhe/hyp-init.S:571: Error: junk at end of line, first u=
nrecognized character is `l'
arch/arm64/kvm/hyp/nvhe/hyp-init.S:571: Error: non-constant expression in "=
.if" statement
arch/arm64/kvm/hyp/nvhe/hyp-init.S:577: Error: unexpected characters follow=
ing instruction at operand 2 -- `movz x0,:abs_g3:((0+(((unsigned long)~0ULL=
-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof(unsigned lon=
g)*8)-1-(11)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(14))+1)&((=
unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(14))))))'
arch/arm64/kvm/hyp/nvhe/hyp-init.S:578: Error: unexpected characters follow=
ing instruction at operand 2 -- `movk x0,:abs_g2_nc:((0+(((unsigned long)~0=
ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof(unsigned =
long)*8)-1-(11)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(14))+1)=
&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(14))))))'
arch/arm64/kvm/hyp/nvhe/hyp-init.S:580: Error: unexpected characters follow=
ing instruction at operand 2 -- `movk x0,:abs_g1_nc:((0+(((unsigned long)~0=
ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof(unsigned =
long)*8)-1-(11)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(14))+1)=
&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(14))))))'
arch/arm64/kvm/hyp/nvhe/hyp-init.S:582: Error: unexpected characters follow=
ing instruction at operand 2 -- `movk x0,:abs_g0_nc:((0+(((unsigned long)~0=
ULL-((unsigned long)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof(unsigned =
long)*8)-1-(11)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(14))+1)=
&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(14))))))'
arch/arm64/kvm/hyp/nvhe/hyp-init.S:91: Error: unexpected characters followi=
ng instruction at operand 3 -- `and x0,x0,(0+(((unsigned long)~0ULL-((unsig=
ned long)(1)<<(4))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(=
4)))))'
arch/arm64/mm/proc.S:449: Error: unexpected characters following instructio=
n at operand 3 -- `and x9,x9,(0+(((unsigned long)~0ULL-((unsigned long)(1)<=
<(0))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(3)))))'
arch/arm64/mm/proc.S:466: Error: found 'l', expected: ')'
arch/arm64/mm/proc.S:466: Error: unexpected characters following instructio=
n at operand 2 -- `mov x0,(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(1=
))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(1)))))'
arch/arm64/mm/proc.S:571: Error: junk at end of line, first unrecognized ch=
aracter is `l'
arch/arm64/mm/proc.S:571: Error: non-constant expression in ".if" statement
arch/arm64/mm/proc.S:577: Error: unexpected characters following instructio=
n at operand 2 -- `movz x0,:abs_g3:(((((1))<<(0)))|((((1))<<(2)))|((((1))<<=
(3)))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(4))+1)&((unsigned lon=
g)~0ULL>>((sizeof(unsigned long)*8)-1-(4)))))|(0+(((unsigned long)~0ULL-((u=
nsigned long)(1)<<(8))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)=
-1-(8)))))|((((1))<<(12)))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(=
14))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(14)))))|(0+(((=
unsigned long)~0ULL-((unsigned long)(1)<<(15))+1)&((unsigned long)~0ULL>>((=
sizeof(unsigned long)*8)-1-(15)))))|(0+(((unsigned long)~0ULL-((unsigned lo=
ng)(1)<<(18))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(18)))=
))|((((1))<<(21)))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(23))+1)&=
((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(23)))))|((((1))<<(37))=
)|0|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(26))+1)&((unsigned long=
)~0ULL>>((sizeof(unsigned long)*8)-1-(26)))))|(0+(((unsigned long)~0ULL-((u=
nsigned long)(1)<<(57))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8=
)-1-(57)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(29))+1)&((unsi=
gned long)~0ULL>>((sizeof(unsigned long)*8)-1-(29)))))|(0+(((unsigned long)=
~0ULL-((unsigned long)(1)<<(28))+1)&((unsigned long)~0ULL>>((sizeof(unsigne=
d long)*8)-1-(28)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(22))+=
1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(22)))))|(0+(((unsig=
ned long)~0ULL-((unsigned long)(1)<<(20))+1)&((unsigned long)~0ULL>>((sizeo=
f(unsigned long)*8)-1-(20)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1=
)<<(11))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(11))))))'
arch/arm64/mm/proc.S:578: Error: unexpected characters following instructio=
n at operand 2 -- `movk x0,:abs_g2_nc:(((((1))<<(0)))|((((1))<<(2)))|((((1)=
)<<(3)))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(4))+1)&((unsigned =
long)~0ULL>>((sizeof(unsigned long)*8)-1-(4)))))|(0+(((unsigned long)~0ULL-=
((unsigned long)(1)<<(8))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)=
*8)-1-(8)))))|((((1))<<(12)))|(0+(((unsigned long)~0ULL-((unsigned long)(1)=
<<(14))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(14)))))|(0+=
(((unsigned long)~0ULL-((unsigned long)(1)<<(15))+1)&((unsigned long)~0ULL>=
>((sizeof(unsigned long)*8)-1-(15)))))|(0+(((unsigned long)~0ULL-((unsigned=
 long)(1)<<(18))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(18=
)))))|((((1))<<(21)))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(23))+=
1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(23)))))|((((1))<<(3=
7)))|0|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(26))+1)&((unsigned l=
ong)~0ULL>>((sizeof(unsigned long)*8)-1-(26)))))|(0+(((unsigned long)~0ULL-=
((unsigned long)(1)<<(57))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long=
)*8)-1-(57)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(29))+1)&((u=
nsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(29)))))|(0+(((unsigned lo=
ng)~0ULL-((unsigned long)(1)<<(28))+1)&((unsigned long)~0ULL>>((sizeof(unsi=
gned long)*8)-1-(28)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(22=
))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(22)))))|(0+(((un=
signed long)~0ULL-((unsigned long)(1)<<(20))+1)&((unsigned long)~0ULL>>((si=
zeof(unsigned long)*8)-1-(20)))))|(0+(((unsigned long)~0ULL-((unsigned long=
)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(11)))))=
)'
arch/arm64/mm/proc.S:580: Error: unexpected characters following instructio=
n at operand 2 -- `movk x0,:abs_g1_nc:(((((1))<<(0)))|((((1))<<(2)))|((((1)=
)<<(3)))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(4))+1)&((unsigned =
long)~0ULL>>((sizeof(unsigned long)*8)-1-(4)))))|(0+(((unsigned long)~0ULL-=
((unsigned long)(1)<<(8))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)=
*8)-1-(8)))))|((((1))<<(12)))|(0+(((unsigned long)~0ULL-((unsigned long)(1)=
<<(14))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(14)))))|(0+=
(((unsigned long)~0ULL-((unsigned long)(1)<<(15))+1)&((unsigned long)~0ULL>=
>((sizeof(unsigned long)*8)-1-(15)))))|(0+(((unsigned long)~0ULL-((unsigned=
 long)(1)<<(18))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(18=
)))))|((((1))<<(21)))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(23))+=
1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(23)))))|((((1))<<(3=
7)))|0|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(26))+1)&((unsigned l=
ong)~0ULL>>((sizeof(unsigned long)*8)-1-(26)))))|(0+(((unsigned long)~0ULL-=
((unsigned long)(1)<<(57))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long=
)*8)-1-(57)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(29))+1)&((u=
nsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(29)))))|(0+(((unsigned lo=
ng)~0ULL-((unsigned long)(1)<<(28))+1)&((unsigned long)~0ULL>>((sizeof(unsi=
gned long)*8)-1-(28)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(22=
))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(22)))))|(0+(((un=
signed long)~0ULL-((unsigned long)(1)<<(20))+1)&((unsigned long)~0ULL>>((si=
zeof(unsigned long)*8)-1-(20)))))|(0+(((unsigned long)~0ULL-((unsigned long=
)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(11)))))=
)'
arch/arm64/mm/proc.S:582: Error: unexpected characters following instructio=
n at operand 2 -- `movk x0,:abs_g0_nc:(((((1))<<(0)))|((((1))<<(2)))|((((1)=
)<<(3)))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(4))+1)&((unsigned =
long)~0ULL>>((sizeof(unsigned long)*8)-1-(4)))))|(0+(((unsigned long)~0ULL-=
((unsigned long)(1)<<(8))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)=
*8)-1-(8)))))|((((1))<<(12)))|(0+(((unsigned long)~0ULL-((unsigned long)(1)=
<<(14))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(14)))))|(0+=
(((unsigned long)~0ULL-((unsigned long)(1)<<(15))+1)&((unsigned long)~0ULL>=
>((sizeof(unsigned long)*8)-1-(15)))))|(0+(((unsigned long)~0ULL-((unsigned=
 long)(1)<<(18))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(18=
)))))|((((1))<<(21)))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(23))+=
1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(23)))))|((((1))<<(3=
7)))|0|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(26))+1)&((unsigned l=
ong)~0ULL>>((sizeof(unsigned long)*8)-1-(26)))))|(0+(((unsigned long)~0ULL-=
((unsigned long)(1)<<(57))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long=
)*8)-1-(57)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(29))+1)&((u=
nsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(29)))))|(0+(((unsigned lo=
ng)~0ULL-((unsigned long)(1)<<(28))+1)&((unsigned long)~0ULL>>((sizeof(unsi=
gned long)*8)-1-(28)))))|(0+(((unsigned long)~0ULL-((unsigned long)(1)<<(22=
))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(22)))))|(0+(((un=
signed long)~0ULL-((unsigned long)(1)<<(20))+1)&((unsigned long)~0ULL>>((si=
zeof(unsigned long)*8)-1-(20)))))|(0+(((unsigned long)~0ULL-((unsigned long=
)(1)<<(11))+1)&((unsigned long)~0ULL>>((sizeof(unsigned long)*8)-1-(11)))))=
)'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm64-allnoconfig
|   |-- arch-arm64-kernel-head.S:Error:found-l-expected:)
|   |-- arch-arm64-kernel-head.S:Error:junk-at-end-of-line-first-unrecogniz=
ed-character-is-l
|   |-- arch-arm64-kernel-head.S:Error:non-constant-expression-in-if-statem=
ent
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-and-x0-x0-(-(((unsigned-long)-0ULL-((unsigned-long)()-()=
)-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-()))))
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g0_nc:((-(((unsigned-long)-0ULL-((unsigned-l=
ong)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g0_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g1_nc:((-(((unsigned-long)-0ULL-((unsigned-l=
ong)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g1_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g2_nc:((-(((unsigned-long)-0ULL-((unsigned-l=
ong)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g2_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x1:abs_g0_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x1:abs_g1_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x1:abs_g2_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movz-x0:abs_g3:((-(((unsigned-long)-0ULL-((unsigned-long=
)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movz-x0:abs_g3:(-(-(((unsigned-long)-0ULL-((unsigned-lon=
g)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movz-x1:abs_g3:(-(-(((unsigned-long)-0ULL-((unsigned-lon=
g)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-orr-x0-x0-(-(((unsigned-long)-0ULL-((unsigned-long)()-()=
)-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-()))))
|   |-- arch-arm64-kernel-hyp-stub.S:Error:found-l-expected:)
|   |-- arch-arm64-kernel-hyp-stub.S:Error:junk-at-end-of-line-first-unreco=
gnized-character-is-l
|   |-- arch-arm64-kernel-hyp-stub.S:Error:non-constant-expression-in-if-st=
atement
|   |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-mov-x1-(-(((unsigned-long)-0ULL-((unsigned-long)()-(=
))-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-())))
|   |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-movk-x0:abs_g0_nc:(-(-(((unsigned-long)-0ULL-((unsig=
ned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-
|   |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-movk-x0:abs_g1_nc:(-(-(((unsigned-long)-0ULL-((unsig=
ned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-
|   |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-movk-x0:abs_g2_nc:(-(-(((unsigned-long)-0ULL-((unsig=
ned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-
|   |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-movz-x0:abs_g3:(-(-(((unsigned-long)-0ULL-((unsigned=
-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-lon
|   |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-orr-x0-x0-(-(((unsigned-long)-0ULL-((unsigned-long)(=
)-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-()
|   |-- arch-arm64-mm-proc.S:Error:found-l-expected:)
|   |-- arch-arm64-mm-proc.S:Error:junk-at-end-of-line-first-unrecognized-c=
haracter-is-l
|   |-- arch-arm64-mm-proc.S:Error:non-constant-expression-in-if-statement
|   |-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-mov-x0-(-(((unsigned-long)-0ULL-((unsigned-long)()-())-)-((u=
nsigned-long)-0ULL-((sizeof(unsigned-long)-)-()))))
|   |-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-movk-x0:abs_g0_nc:((((())-()))-(((())-()))-(((())-()))-(-(((=
unsigned-long)-0ULL-((unsigned-long)()-())-)-((unsigned-lo
|   |-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-movk-x0:abs_g1_nc:((((())-()))-(((())-()))-(((())-()))-(-(((=
unsigned-long)-0ULL-((unsigned-long)()-())-)-((unsigned-lo
|   |-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-movk-x0:abs_g2_nc:((((())-()))-(((())-()))-(((())-()))-(-(((=
unsigned-long)-0ULL-((unsigned-long)()-())-)-((unsigned-lo
|   `-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-movz-x0:abs_g3:((((())-()))-(((())-()))-(((())-()))-(-(((uns=
igned-long)-0ULL-((unsigned-long)()-())-)-((unsigned-long)
|-- arm64-defconfig
|   |-- arch-arm64-kernel-cpu-reset.S:Error:found-l-expected:)
|   |-- arch-arm64-kernel-cpu-reset.S:Error:junk-at-end-of-line-first-unrec=
ognized-character-is-l
|   |-- arch-arm64-kernel-cpu-reset.S:Error:non-constant-expression-in-if-s=
tatement
|   |-- arch-arm64-kernel-cpu-reset.S:Error:unexpected-characters-following=
-instruction-at-operand-movk-x12:abs_g0_nc:(-(-(((unsigned-long)-0ULL-((uns=
igned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigne
|   |-- arch-arm64-kernel-cpu-reset.S:Error:unexpected-characters-following=
-instruction-at-operand-movk-x12:abs_g1_nc:(-(-(((unsigned-long)-0ULL-((uns=
igned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigne
|   |-- arch-arm64-kernel-cpu-reset.S:Error:unexpected-characters-following=
-instruction-at-operand-movk-x12:abs_g2_nc:(-(-(((unsigned-long)-0ULL-((uns=
igned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigne
|   |-- arch-arm64-kernel-cpu-reset.S:Error:unexpected-characters-following=
-instruction-at-operand-movz-x12:abs_g3:(-(-(((unsigned-long)-0ULL-((unsign=
ed-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-l
|   |-- arch-arm64-kernel-entry-fpsimd.S:Error:found-l-expected:)
|   |-- arch-arm64-kernel-entry-fpsimd.S:Error:unexpected-characters-follow=
ing-instruction-at-operand-bic-x2-x1-(-(((unsigned-long)-0ULL-((unsigned-lo=
ng)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-
|   |-- arch-arm64-kernel-relocate_kernel.S:Error:found-l-expected:)
|   |-- arch-arm64-kernel-relocate_kernel.S:Error:junk-at-end-of-line-first=
-unrecognized-character-is-l
|   |-- arch-arm64-kernel-relocate_kernel.S:Error:non-constant-expression-i=
n-if-statement
|   |-- arch-arm64-kernel-relocate_kernel.S:Error:unexpected-characters-fol=
lowing-instruction-at-operand-movk-x12:abs_g0_nc:(-(-(((unsigned-long)-0ULL=
-((unsigned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(u
|   |-- arch-arm64-kernel-relocate_kernel.S:Error:unexpected-characters-fol=
lowing-instruction-at-operand-movk-x12:abs_g1_nc:(-(-(((unsigned-long)-0ULL=
-((unsigned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(u
|   |-- arch-arm64-kernel-relocate_kernel.S:Error:unexpected-characters-fol=
lowing-instruction-at-operand-movk-x12:abs_g2_nc:(-(-(((unsigned-long)-0ULL=
-((unsigned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(u
|   |-- arch-arm64-kernel-relocate_kernel.S:Error:unexpected-characters-fol=
lowing-instruction-at-operand-movz-x12:abs_g3:(-(-(((unsigned-long)-0ULL-((=
unsigned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsi
|   |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:found-l-expected:)
|   |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:junk-at-end-of-line-first-=
unrecognized-character-is-l
|   |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:non-constant-expression-in=
-if-statement
|   |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:unexpected-characters-foll=
owing-instruction-at-operand-and-x0-x0-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:unexpected-characters-foll=
owing-instruction-at-operand-mov-x1-(-(((unsigned-long)-0ULL-((unsigned-lon=
g)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)
|   |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:unexpected-characters-foll=
owing-instruction-at-operand-movk-x0:abs_g0_nc:((-(((unsigned-long)-0ULL-((=
unsigned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsi
|   |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:unexpected-characters-foll=
owing-instruction-at-operand-movk-x0:abs_g1_nc:((-(((unsigned-long)-0ULL-((=
unsigned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsi
|   |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:unexpected-characters-foll=
owing-instruction-at-operand-movk-x0:abs_g2_nc:((-(((unsigned-long)-0ULL-((=
unsigned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsi
|   |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:unexpected-characters-foll=
owing-instruction-at-operand-movz-x0:abs_g3:((-(((unsigned-long)-0ULL-((uns=
igned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigne
|   |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:unexpected-characters-foll=
owing-instruction-at-operand-orr-x0-x0-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   `-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-and-x9-x9-(-(((unsigned-long)-0ULL-((unsigned-long)()-())-)-=
((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-()))))
|-- arm64-randconfig-001-20240221
|   |-- arch-arm64-kernel-cpu-reset.S:Error:found-l-expected:)
|   |-- arch-arm64-kernel-cpu-reset.S:Error:junk-at-end-of-line-first-unrec=
ognized-character-is-l
|   |-- arch-arm64-kernel-cpu-reset.S:Error:non-constant-expression-in-if-s=
tatement
|   |-- arch-arm64-kernel-cpu-reset.S:Error:unexpected-characters-following=
-instruction-at-operand-movk-x12:abs_g0_nc:(-(-(((unsigned-long)-0ULL-((uns=
igned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigne
|   |-- arch-arm64-kernel-cpu-reset.S:Error:unexpected-characters-following=
-instruction-at-operand-movk-x12:abs_g1_nc:(-(-(((unsigned-long)-0ULL-((uns=
igned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigne
|   |-- arch-arm64-kernel-cpu-reset.S:Error:unexpected-characters-following=
-instruction-at-operand-movk-x12:abs_g2_nc:(-(-(((unsigned-long)-0ULL-((uns=
igned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigne
|   |-- arch-arm64-kernel-cpu-reset.S:Error:unexpected-characters-following=
-instruction-at-operand-movz-x12:abs_g3:(-(-(((unsigned-long)-0ULL-((unsign=
ed-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-l
|   |-- arch-arm64-kernel-entry-fpsimd.S:Error:found-l-expected:)
|   |-- arch-arm64-kernel-entry-fpsimd.S:Error:unexpected-characters-follow=
ing-instruction-at-operand-bic-x2-x1-(-(((unsigned-long)-0ULL-((unsigned-lo=
ng)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-
|   |-- arch-arm64-kernel-head.S:Error:found-l-expected:)
|   |-- arch-arm64-kernel-head.S:Error:junk-at-end-of-line-first-unrecogniz=
ed-character-is-l
|   |-- arch-arm64-kernel-head.S:Error:non-constant-expression-in-if-statem=
ent
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-and-x0-x0-(-(((unsigned-long)-0ULL-((unsigned-long)()-()=
)-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-()))))
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g0_nc:((-(((unsigned-long)-0ULL-((unsigned-l=
ong)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g0_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g1_nc:((-(((unsigned-long)-0ULL-((unsigned-l=
ong)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g1_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g2_nc:((-(((unsigned-long)-0ULL-((unsigned-l=
ong)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g2_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x1:abs_g0_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x1:abs_g1_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x1:abs_g2_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movz-x0:abs_g3:((-(((unsigned-long)-0ULL-((unsigned-long=
)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movz-x0:abs_g3:(-(-(((unsigned-long)-0ULL-((unsigned-lon=
g)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movz-x1:abs_g3:(-(-(((unsigned-long)-0ULL-((unsigned-lon=
g)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-orr-x0-x0-(-(((unsigned-long)-0ULL-((unsigned-long)()-()=
)-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-()))))
|   |-- arch-arm64-kernel-hyp-stub.S:Error:found-l-expected:)
|   |-- arch-arm64-kernel-hyp-stub.S:Error:junk-at-end-of-line-first-unreco=
gnized-character-is-l
|   |-- arch-arm64-kernel-hyp-stub.S:Error:non-constant-expression-in-if-st=
atement
|   |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-mov-x1-(-(((unsigned-long)-0ULL-((unsigned-long)()-(=
))-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-())))
|   |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-movk-x0:abs_g0_nc:(-(-(((unsigned-long)-0ULL-((unsig=
ned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-
|   |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-movk-x0:abs_g1_nc:(-(-(((unsigned-long)-0ULL-((unsig=
ned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-
|   |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-movk-x0:abs_g2_nc:(-(-(((unsigned-long)-0ULL-((unsig=
ned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-
|   |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-movz-x0:abs_g3:(-(-(((unsigned-long)-0ULL-((unsigned=
-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-lon
|   |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-orr-x0-x0-(-(((unsigned-long)-0ULL-((unsigned-long)(=
)-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-()
|   |-- arch-arm64-kernel-relocate_kernel.S:Error:found-l-expected:)
|   |-- arch-arm64-kernel-relocate_kernel.S:Error:junk-at-end-of-line-first=
-unrecognized-character-is-l
|   |-- arch-arm64-kernel-relocate_kernel.S:Error:non-constant-expression-i=
n-if-statement
|   |-- arch-arm64-kernel-relocate_kernel.S:Error:unexpected-characters-fol=
lowing-instruction-at-operand-movk-x12:abs_g0_nc:(-(-(((unsigned-long)-0ULL=
-((unsigned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(u
|   |-- arch-arm64-kernel-relocate_kernel.S:Error:unexpected-characters-fol=
lowing-instruction-at-operand-movk-x12:abs_g1_nc:(-(-(((unsigned-long)-0ULL=
-((unsigned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(u
|   |-- arch-arm64-kernel-relocate_kernel.S:Error:unexpected-characters-fol=
lowing-instruction-at-operand-movk-x12:abs_g2_nc:(-(-(((unsigned-long)-0ULL=
-((unsigned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(u
|   |-- arch-arm64-kernel-relocate_kernel.S:Error:unexpected-characters-fol=
lowing-instruction-at-operand-movz-x12:abs_g3:(-(-(((unsigned-long)-0ULL-((=
unsigned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsi
|   |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:found-l-expected:)
|   |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:junk-at-end-of-line-first-=
unrecognized-character-is-l
|   |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:non-constant-expression-in=
-if-statement
|   |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:unexpected-characters-foll=
owing-instruction-at-operand-and-x0-x0-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:unexpected-characters-foll=
owing-instruction-at-operand-mov-x1-(-(((unsigned-long)-0ULL-((unsigned-lon=
g)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)
|   |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:unexpected-characters-foll=
owing-instruction-at-operand-movk-x0:abs_g0_nc:((-(((unsigned-long)-0ULL-((=
unsigned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsi
|   |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:unexpected-characters-foll=
owing-instruction-at-operand-movk-x0:abs_g1_nc:((-(((unsigned-long)-0ULL-((=
unsigned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsi
|   |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:unexpected-characters-foll=
owing-instruction-at-operand-movk-x0:abs_g2_nc:((-(((unsigned-long)-0ULL-((=
unsigned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsi
|   |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:unexpected-characters-foll=
owing-instruction-at-operand-movz-x0:abs_g3:((-(((unsigned-long)-0ULL-((uns=
igned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigne
|   |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:unexpected-characters-foll=
owing-instruction-at-operand-orr-x0-x0-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-mm-proc.S:Error:found-l-expected:)
|   |-- arch-arm64-mm-proc.S:Error:junk-at-end-of-line-first-unrecognized-c=
haracter-is-l
|   |-- arch-arm64-mm-proc.S:Error:non-constant-expression-in-if-statement
|   |-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-and-x9-x9-(-(((unsigned-long)-0ULL-((unsigned-long)()-())-)-=
((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-()))))
|   |-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-mov-x0-(-(((unsigned-long)-0ULL-((unsigned-long)()-())-)-((u=
nsigned-long)-0ULL-((sizeof(unsigned-long)-)-()))))
|   |-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-movk-x0:abs_g0_nc:((((())-()))-(((())-()))-(((())-()))-(-(((=
unsigned-long)-0ULL-((unsigned-long)()-())-)-((unsigned-lo
|   |-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-movk-x0:abs_g1_nc:((((())-()))-(((())-()))-(((())-()))-(-(((=
unsigned-long)-0ULL-((unsigned-long)()-())-)-((unsigned-lo
|   |-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-movk-x0:abs_g2_nc:((((())-()))-(((())-()))-(((())-()))-(-(((=
unsigned-long)-0ULL-((unsigned-long)()-())-)-((unsigned-lo
|   `-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-movz-x0:abs_g3:((((())-()))-(((())-()))-(((())-()))-(-(((uns=
igned-long)-0ULL-((unsigned-long)()-())-)-((unsigned-long)
|-- arm64-randconfig-002-20240221
|   |-- arch-arm64-kernel-cpu-reset.S:Error:found-l-expected:)
|   |-- arch-arm64-kernel-cpu-reset.S:Error:junk-at-end-of-line-first-unrec=
ognized-character-is-l
|   |-- arch-arm64-kernel-cpu-reset.S:Error:non-constant-expression-in-if-s=
tatement
|   |-- arch-arm64-kernel-cpu-reset.S:Error:unexpected-characters-following=
-instruction-at-operand-movk-x12:abs_g0_nc:(-(-(((unsigned-long)-0ULL-((uns=
igned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigne
|   |-- arch-arm64-kernel-cpu-reset.S:Error:unexpected-characters-following=
-instruction-at-operand-movk-x12:abs_g1_nc:(-(-(((unsigned-long)-0ULL-((uns=
igned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigne
|   |-- arch-arm64-kernel-cpu-reset.S:Error:unexpected-characters-following=
-instruction-at-operand-movk-x12:abs_g2_nc:(-(-(((unsigned-long)-0ULL-((uns=
igned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigne
|   |-- arch-arm64-kernel-cpu-reset.S:Error:unexpected-characters-following=
-instruction-at-operand-movz-x12:abs_g3:(-(-(((unsigned-long)-0ULL-((unsign=
ed-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-l
|   |-- arch-arm64-kernel-head.S:Error:found-l-expected:)
|   |-- arch-arm64-kernel-head.S:Error:junk-at-end-of-line-first-unrecogniz=
ed-character-is-l
|   |-- arch-arm64-kernel-head.S:Error:non-constant-expression-in-if-statem=
ent
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-and-x0-x0-(-(((unsigned-long)-0ULL-((unsigned-long)()-()=
)-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-()))))
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g0_nc:((-(((unsigned-long)-0ULL-((unsigned-l=
ong)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g0_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g1_nc:((-(((unsigned-long)-0ULL-((unsigned-l=
ong)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g1_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g2_nc:((-(((unsigned-long)-0ULL-((unsigned-l=
ong)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g2_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x1:abs_g0_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x1:abs_g1_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x1:abs_g2_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movz-x0:abs_g3:((-(((unsigned-long)-0ULL-((unsigned-long=
)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movz-x0:abs_g3:(-(-(((unsigned-long)-0ULL-((unsigned-lon=
g)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movz-x1:abs_g3:(-(-(((unsigned-long)-0ULL-((unsigned-lon=
g)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-orr-x0-x0-(-(((unsigned-long)-0ULL-((unsigned-long)()-()=
)-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-()))))
|   |-- arch-arm64-kernel-hyp-stub.S:Error:found-l-expected:)
|   |-- arch-arm64-kernel-hyp-stub.S:Error:junk-at-end-of-line-first-unreco=
gnized-character-is-l
|   |-- arch-arm64-kernel-hyp-stub.S:Error:non-constant-expression-in-if-st=
atement
|   |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-mov-x1-(-(((unsigned-long)-0ULL-((unsigned-long)()-(=
))-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-())))
|   |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-movk-x0:abs_g0_nc:(-(-(((unsigned-long)-0ULL-((unsig=
ned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-
|   |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-movk-x0:abs_g1_nc:(-(-(((unsigned-long)-0ULL-((unsig=
ned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-
|   |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-movk-x0:abs_g2_nc:(-(-(((unsigned-long)-0ULL-((unsig=
ned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-
|   |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-movz-x0:abs_g3:(-(-(((unsigned-long)-0ULL-((unsigned=
-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-lon
|   |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-orr-x0-x0-(-(((unsigned-long)-0ULL-((unsigned-long)(=
)-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-()
|   |-- arch-arm64-kernel-relocate_kernel.S:Error:found-l-expected:)
|   |-- arch-arm64-kernel-relocate_kernel.S:Error:junk-at-end-of-line-first=
-unrecognized-character-is-l
|   |-- arch-arm64-kernel-relocate_kernel.S:Error:non-constant-expression-i=
n-if-statement
|   |-- arch-arm64-kernel-relocate_kernel.S:Error:unexpected-characters-fol=
lowing-instruction-at-operand-movk-x12:abs_g0_nc:(-(-(((unsigned-long)-0ULL=
-((unsigned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(u
|   |-- arch-arm64-kernel-relocate_kernel.S:Error:unexpected-characters-fol=
lowing-instruction-at-operand-movk-x12:abs_g1_nc:(-(-(((unsigned-long)-0ULL=
-((unsigned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(u
|   |-- arch-arm64-kernel-relocate_kernel.S:Error:unexpected-characters-fol=
lowing-instruction-at-operand-movk-x12:abs_g2_nc:(-(-(((unsigned-long)-0ULL=
-((unsigned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(u
|   |-- arch-arm64-kernel-relocate_kernel.S:Error:unexpected-characters-fol=
lowing-instruction-at-operand-movz-x12:abs_g3:(-(-(((unsigned-long)-0ULL-((=
unsigned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsi
|   |-- arch-arm64-mm-proc.S:Error:found-l-expected:)
|   |-- arch-arm64-mm-proc.S:Error:junk-at-end-of-line-first-unrecognized-c=
haracter-is-l
|   |-- arch-arm64-mm-proc.S:Error:non-constant-expression-in-if-statement
|   |-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-mov-x0-(-(((unsigned-long)-0ULL-((unsigned-long)()-())-)-((u=
nsigned-long)-0ULL-((sizeof(unsigned-long)-)-()))))
|   |-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-movk-x0:abs_g0_nc:((((())-()))-(((())-()))-(((())-()))-(-(((=
unsigned-long)-0ULL-((unsigned-long)()-())-)-((unsigned-lo
|   |-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-movk-x0:abs_g1_nc:((((())-()))-(((())-()))-(((())-()))-(-(((=
unsigned-long)-0ULL-((unsigned-long)()-())-)-((unsigned-lo
|   |-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-movk-x0:abs_g2_nc:((((())-()))-(((())-()))-(((())-()))-(-(((=
unsigned-long)-0ULL-((unsigned-long)()-())-)-((unsigned-lo
|   `-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-movz-x0:abs_g3:((((())-()))-(((())-()))-(((())-()))-(-(((uns=
igned-long)-0ULL-((unsigned-long)()-())-)-((unsigned-long)
|-- arm64-randconfig-003-20240221
|   |-- arch-arm64-kernel-entry-fpsimd.S:Error:found-l-expected:)
|   |-- arch-arm64-kernel-entry-fpsimd.S:Error:unexpected-characters-follow=
ing-instruction-at-operand-bic-x2-x1-(-(((unsigned-long)-0ULL-((unsigned-lo=
ng)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-
|   |-- arch-arm64-kernel-head.S:Error:found-l-expected:)
|   |-- arch-arm64-kernel-head.S:Error:junk-at-end-of-line-first-unrecogniz=
ed-character-is-l
|   |-- arch-arm64-kernel-head.S:Error:non-constant-expression-in-if-statem=
ent
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-and-x0-x0-(-(((unsigned-long)-0ULL-((unsigned-long)()-()=
)-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-()))))
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g0_nc:((-(((unsigned-long)-0ULL-((unsigned-l=
ong)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g0_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g1_nc:((-(((unsigned-long)-0ULL-((unsigned-l=
ong)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g1_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g2_nc:((-(((unsigned-long)-0ULL-((unsigned-l=
ong)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g2_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x1:abs_g0_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x1:abs_g1_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x1:abs_g2_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movz-x0:abs_g3:((-(((unsigned-long)-0ULL-((unsigned-long=
)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movz-x0:abs_g3:(-(-(((unsigned-long)-0ULL-((unsigned-lon=
g)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movz-x1:abs_g3:(-(-(((unsigned-long)-0ULL-((unsigned-lon=
g)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)
|   |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-orr-x0-x0-(-(((unsigned-long)-0ULL-((unsigned-long)()-()=
)-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-()))))
|   |-- arch-arm64-kernel-hyp-stub.S:Error:found-l-expected:)
|   |-- arch-arm64-kernel-hyp-stub.S:Error:junk-at-end-of-line-first-unreco=
gnized-character-is-l
|   |-- arch-arm64-kernel-hyp-stub.S:Error:non-constant-expression-in-if-st=
atement
|   |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-mov-x1-(-(((unsigned-long)-0ULL-((unsigned-long)()-(=
))-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-())))
|   |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-movk-x0:abs_g0_nc:(-(-(((unsigned-long)-0ULL-((unsig=
ned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-
|   |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-movk-x0:abs_g1_nc:(-(-(((unsigned-long)-0ULL-((unsig=
ned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-
|   |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-movk-x0:abs_g2_nc:(-(-(((unsigned-long)-0ULL-((unsig=
ned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-
|   |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-movz-x0:abs_g3:(-(-(((unsigned-long)-0ULL-((unsigned=
-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-lon
|   |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-orr-x0-x0-(-(((unsigned-long)-0ULL-((unsigned-long)(=
)-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-()
|   |-- arch-arm64-mm-proc.S:Error:found-l-expected:)
|   |-- arch-arm64-mm-proc.S:Error:junk-at-end-of-line-first-unrecognized-c=
haracter-is-l
|   |-- arch-arm64-mm-proc.S:Error:non-constant-expression-in-if-statement
|   |-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-mov-x0-(-(((unsigned-long)-0ULL-((unsigned-long)()-())-)-((u=
nsigned-long)-0ULL-((sizeof(unsigned-long)-)-()))))
|   |-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-movk-x0:abs_g0_nc:((((())-()))-(((())-()))-(((())-()))-(-(((=
unsigned-long)-0ULL-((unsigned-long)()-())-)-((unsigned-lo
|   |-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-movk-x0:abs_g1_nc:((((())-()))-(((())-()))-(((())-()))-(-(((=
unsigned-long)-0ULL-((unsigned-long)()-())-)-((unsigned-lo
|   |-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-movk-x0:abs_g2_nc:((((())-()))-(((())-()))-(((())-()))-(-(((=
unsigned-long)-0ULL-((unsigned-long)()-())-)-((unsigned-lo
|   `-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-movz-x0:abs_g3:((((())-()))-(((())-()))-(((())-()))-(-(((uns=
igned-long)-0ULL-((unsigned-long)()-())-)-((unsigned-long)
`-- arm64-randconfig-004-20240221
    |-- arch-arm64-kernel-cpu-reset.S:Error:found-l-expected:)
    |-- arch-arm64-kernel-cpu-reset.S:Error:junk-at-end-of-line-first-unrec=
ognized-character-is-l
    |-- arch-arm64-kernel-cpu-reset.S:Error:non-constant-expression-in-if-s=
tatement
    |-- arch-arm64-kernel-cpu-reset.S:Error:unexpected-characters-following=
-instruction-at-operand-movk-x12:abs_g0_nc:(-(-(((unsigned-long)-0ULL-((uns=
igned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigne
    |-- arch-arm64-kernel-cpu-reset.S:Error:unexpected-characters-following=
-instruction-at-operand-movk-x12:abs_g1_nc:(-(-(((unsigned-long)-0ULL-((uns=
igned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigne
    |-- arch-arm64-kernel-cpu-reset.S:Error:unexpected-characters-following=
-instruction-at-operand-movk-x12:abs_g2_nc:(-(-(((unsigned-long)-0ULL-((uns=
igned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigne
    |-- arch-arm64-kernel-cpu-reset.S:Error:unexpected-characters-following=
-instruction-at-operand-movz-x12:abs_g3:(-(-(((unsigned-long)-0ULL-((unsign=
ed-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-l
    |-- arch-arm64-kernel-head.S:Error:found-l-expected:)
    |-- arch-arm64-kernel-head.S:Error:junk-at-end-of-line-first-unrecogniz=
ed-character-is-l
    |-- arch-arm64-kernel-head.S:Error:non-constant-expression-in-if-statem=
ent
    |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-and-x0-x0-(-(((unsigned-long)-0ULL-((unsigned-long)()-()=
)-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-()))))
    |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g0_nc:((-(((unsigned-long)-0ULL-((unsigned-l=
ong)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)
    |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g0_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
    |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g1_nc:((-(((unsigned-long)-0ULL-((unsigned-l=
ong)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)
    |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g1_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
    |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g2_nc:((-(((unsigned-long)-0ULL-((unsigned-l=
ong)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)
    |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x0:abs_g2_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
    |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x1:abs_g0_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
    |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x1:abs_g1_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
    |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movk-x1:abs_g2_nc:(-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
    |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movz-x0:abs_g3:((-(((unsigned-long)-0ULL-((unsigned-long=
)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-
    |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movz-x0:abs_g3:(-(-(((unsigned-long)-0ULL-((unsigned-lon=
g)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)
    |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-movz-x1:abs_g3:(-(-(((unsigned-long)-0ULL-((unsigned-lon=
g)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)
    |-- arch-arm64-kernel-head.S:Error:unexpected-characters-following-inst=
ruction-at-operand-orr-x0-x0-(-(((unsigned-long)-0ULL-((unsigned-long)()-()=
)-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-()))))
    |-- arch-arm64-kernel-hyp-stub.S:Error:found-l-expected:)
    |-- arch-arm64-kernel-hyp-stub.S:Error:junk-at-end-of-line-first-unreco=
gnized-character-is-l
    |-- arch-arm64-kernel-hyp-stub.S:Error:non-constant-expression-in-if-st=
atement
    |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-mov-x1-(-(((unsigned-long)-0ULL-((unsigned-long)()-(=
))-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-())))
    |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-movk-x0:abs_g0_nc:(-(-(((unsigned-long)-0ULL-((unsig=
ned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-
    |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-movk-x0:abs_g1_nc:(-(-(((unsigned-long)-0ULL-((unsig=
ned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-
    |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-movk-x0:abs_g2_nc:(-(-(((unsigned-long)-0ULL-((unsig=
ned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-
    |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-movz-x0:abs_g3:(-(-(((unsigned-long)-0ULL-((unsigned=
-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-lon
    |-- arch-arm64-kernel-hyp-stub.S:Error:unexpected-characters-following-=
instruction-at-operand-orr-x0-x0-(-(((unsigned-long)-0ULL-((unsigned-long)(=
)-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-()
    |-- arch-arm64-kernel-relocate_kernel.S:Error:found-l-expected:)
    |-- arch-arm64-kernel-relocate_kernel.S:Error:junk-at-end-of-line-first=
-unrecognized-character-is-l
    |-- arch-arm64-kernel-relocate_kernel.S:Error:non-constant-expression-i=
n-if-statement
    |-- arch-arm64-kernel-relocate_kernel.S:Error:unexpected-characters-fol=
lowing-instruction-at-operand-movk-x12:abs_g0_nc:(-(-(((unsigned-long)-0ULL=
-((unsigned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(u
    |-- arch-arm64-kernel-relocate_kernel.S:Error:unexpected-characters-fol=
lowing-instruction-at-operand-movk-x12:abs_g1_nc:(-(-(((unsigned-long)-0ULL=
-((unsigned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(u
    |-- arch-arm64-kernel-relocate_kernel.S:Error:unexpected-characters-fol=
lowing-instruction-at-operand-movk-x12:abs_g2_nc:(-(-(((unsigned-long)-0ULL=
-((unsigned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(u
    |-- arch-arm64-kernel-relocate_kernel.S:Error:unexpected-characters-fol=
lowing-instruction-at-operand-movz-x12:abs_g3:(-(-(((unsigned-long)-0ULL-((=
unsigned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsi
    |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:found-l-expected:)
    |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:junk-at-end-of-line-first-=
unrecognized-character-is-l
    |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:non-constant-expression-in=
-if-statement
    |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:unexpected-characters-foll=
owing-instruction-at-operand-and-x0-x0-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
    |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:unexpected-characters-foll=
owing-instruction-at-operand-mov-x1-(-(((unsigned-long)-0ULL-((unsigned-lon=
g)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long)-)
    |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:unexpected-characters-foll=
owing-instruction-at-operand-movk-x0:abs_g0_nc:((-(((unsigned-long)-0ULL-((=
unsigned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsi
    |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:unexpected-characters-foll=
owing-instruction-at-operand-movk-x0:abs_g1_nc:((-(((unsigned-long)-0ULL-((=
unsigned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsi
    |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:unexpected-characters-foll=
owing-instruction-at-operand-movk-x0:abs_g2_nc:((-(((unsigned-long)-0ULL-((=
unsigned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsi
    |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:unexpected-characters-foll=
owing-instruction-at-operand-movz-x0:abs_g3:((-(((unsigned-long)-0ULL-((uns=
igned-long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigne
    |-- arch-arm64-kvm-hyp-nvhe-hyp-init.S:Error:unexpected-characters-foll=
owing-instruction-at-operand-orr-x0-x0-(-(((unsigned-long)-0ULL-((unsigned-=
long)()-())-)-((unsigned-long)-0ULL-((sizeof(unsigned-long
    |-- arch-arm64-mm-proc.S:Error:found-l-expected:)
    |-- arch-arm64-mm-proc.S:Error:junk-at-end-of-line-first-unrecognized-c=
haracter-is-l
    |-- arch-arm64-mm-proc.S:Error:non-constant-expression-in-if-statement
    |-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-and-x9-x9-(-(((unsigned-long)-0ULL-((unsigned-long)()-())-)-=
((unsigned-long)-0ULL-((sizeof(unsigned-long)-)-()))))
    |-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-mov-x0-(-(((unsigned-long)-0ULL-((unsigned-long)()-())-)-((u=
nsigned-long)-0ULL-((sizeof(unsigned-long)-)-()))))
    |-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-movk-x0:abs_g0_nc:((((())-()))-(((())-()))-(((())-()))-(-(((=
unsigned-long)-0ULL-((unsigned-long)()-())-)-((unsigned-lo
    |-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-movk-x0:abs_g1_nc:((((())-()))-(((())-()))-(((())-()))-(-(((=
unsigned-long)-0ULL-((unsigned-long)()-())-)-((unsigned-lo
    |-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-movk-x0:abs_g2_nc:((((())-()))-(((())-()))-(((())-()))-(-(((=
unsigned-long)-0ULL-((unsigned-long)()-())-)-((unsigned-lo
    `-- arch-arm64-mm-proc.S:Error:unexpected-characters-following-instruct=
ion-at-operand-movz-x0:abs_g3:((((())-()))-(((())-()))-(((())-()))-(-(((uns=
igned-long)-0ULL-((unsigned-long)()-())-)-((unsigned-long)

elapsed time: 1038m

configs tested: 163
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc =20
alpha                            allyesconfig   gcc =20
alpha                               defconfig   gcc =20
arc                              allmodconfig   gcc =20
arc                               allnoconfig   gcc =20
arc                              allyesconfig   gcc =20
arc                                 defconfig   gcc =20
arc                        nsimosci_defconfig   gcc =20
arc                   randconfig-001-20240221   gcc =20
arc                   randconfig-002-20240221   gcc =20
arm                              allmodconfig   gcc =20
arm                               allnoconfig   clang
arm                              allyesconfig   gcc =20
arm                                 defconfig   clang
arm                   randconfig-001-20240221   clang
arm                   randconfig-002-20240221   clang
arm                   randconfig-003-20240221   gcc =20
arm                   randconfig-004-20240221   clang
arm                           stm32_defconfig   gcc =20
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc =20
arm64                               defconfig   gcc =20
arm64                 randconfig-001-20240221   gcc =20
arm64                 randconfig-002-20240221   gcc =20
arm64                 randconfig-003-20240221   gcc =20
arm64                 randconfig-004-20240221   gcc =20
csky                             allmodconfig   gcc =20
csky                              allnoconfig   gcc =20
csky                             allyesconfig   gcc =20
csky                                defconfig   gcc =20
csky                  randconfig-001-20240221   gcc =20
csky                  randconfig-002-20240221   gcc =20
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240221   clang
hexagon               randconfig-002-20240221   clang
i386                             allmodconfig   gcc =20
i386                              allnoconfig   gcc =20
i386                             allyesconfig   gcc =20
i386         buildonly-randconfig-001-20240221   gcc =20
i386         buildonly-randconfig-002-20240221   clang
i386         buildonly-randconfig-003-20240221   gcc =20
i386         buildonly-randconfig-004-20240221   gcc =20
i386         buildonly-randconfig-005-20240221   gcc =20
i386         buildonly-randconfig-006-20240221   gcc =20
i386                                defconfig   clang
i386                  randconfig-001-20240221   gcc =20
i386                  randconfig-002-20240221   clang
i386                  randconfig-003-20240221   clang
i386                  randconfig-004-20240221   gcc =20
i386                  randconfig-005-20240221   gcc =20
i386                  randconfig-006-20240221   clang
i386                  randconfig-011-20240221   gcc =20
i386                  randconfig-012-20240221   clang
i386                  randconfig-013-20240221   gcc =20
i386                  randconfig-014-20240221   clang
i386                  randconfig-015-20240221   gcc =20
i386                  randconfig-016-20240221   clang
loongarch                        allmodconfig   gcc =20
loongarch                         allnoconfig   gcc =20
loongarch                        allyesconfig   gcc =20
loongarch                           defconfig   gcc =20
loongarch             randconfig-001-20240221   gcc =20
loongarch             randconfig-002-20240221   gcc =20
m68k                             allmodconfig   gcc =20
m68k                              allnoconfig   gcc =20
m68k                             allyesconfig   gcc =20
m68k                                defconfig   gcc =20
microblaze                       allmodconfig   gcc =20
microblaze                        allnoconfig   gcc =20
microblaze                       allyesconfig   gcc =20
microblaze                          defconfig   gcc =20
mips                             allmodconfig   gcc =20
mips                              allnoconfig   gcc =20
mips                             allyesconfig   gcc =20
mips                       lemote2f_defconfig   gcc =20
mips                          malta_defconfig   gcc =20
mips                      pic32mzda_defconfig   gcc =20
nios2                            alldefconfig   gcc =20
nios2                            allmodconfig   gcc =20
nios2                             allnoconfig   gcc =20
nios2                            allyesconfig   gcc =20
nios2                               defconfig   gcc =20
nios2                 randconfig-001-20240221   gcc =20
nios2                 randconfig-002-20240221   gcc =20
openrisc                         allmodconfig   gcc =20
openrisc                          allnoconfig   gcc =20
openrisc                         allyesconfig   gcc =20
openrisc                            defconfig   gcc =20
openrisc                  or1klitex_defconfig   gcc =20
parisc                           allmodconfig   gcc =20
parisc                            allnoconfig   gcc =20
parisc                           allyesconfig   gcc =20
parisc                              defconfig   gcc =20
parisc                randconfig-001-20240221   gcc =20
parisc                randconfig-002-20240221   gcc =20
parisc64                            defconfig   gcc =20
powerpc                          allmodconfig   gcc =20
powerpc                           allnoconfig   gcc =20
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240221   gcc =20
powerpc               randconfig-002-20240221   gcc =20
powerpc               randconfig-003-20240221   gcc =20
powerpc                         wii_defconfig   gcc =20
powerpc64             randconfig-001-20240221   gcc =20
powerpc64             randconfig-002-20240221   gcc =20
powerpc64             randconfig-003-20240221   gcc =20
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc =20
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240221   clang
riscv                 randconfig-002-20240221   gcc =20
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc =20
s390                                defconfig   clang
s390                  randconfig-001-20240221   clang
s390                  randconfig-002-20240221   clang
sh                               allmodconfig   gcc =20
sh                                allnoconfig   gcc =20
sh                               allyesconfig   gcc =20
sh                                  defconfig   gcc =20
sh                    randconfig-001-20240221   gcc =20
sh                    randconfig-002-20240221   gcc =20
sh                          sdk7780_defconfig   gcc =20
sh                        sh7763rdp_defconfig   gcc =20
sparc                            allmodconfig   gcc =20
sparc                             allnoconfig   gcc =20
sparc                            allyesconfig   gcc =20
sparc                               defconfig   gcc =20
sparc64                          allmodconfig   gcc =20
sparc64                          allyesconfig   gcc =20
sparc64                             defconfig   gcc =20
sparc64               randconfig-001-20240221   gcc =20
sparc64               randconfig-002-20240221   gcc =20
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc =20
um                                  defconfig   clang
um                             i386_defconfig   gcc =20
um                    randconfig-001-20240221   gcc =20
um                    randconfig-002-20240221   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240221   clang
x86_64       buildonly-randconfig-004-20240221   clang
x86_64       buildonly-randconfig-005-20240221   clang
x86_64       buildonly-randconfig-006-20240221   clang
x86_64                              defconfig   gcc =20
x86_64                randconfig-011-20240221   clang
x86_64                randconfig-013-20240221   clang
x86_64                randconfig-075-20240221   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc =20
xtensa                            allnoconfig   gcc =20
xtensa                           allyesconfig   gcc =20
xtensa                generic_kc705_defconfig   gcc =20
xtensa                randconfig-001-20240221   gcc =20
xtensa                randconfig-002-20240221   gcc =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
