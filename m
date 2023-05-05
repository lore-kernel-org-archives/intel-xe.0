Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B77C77B7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 18:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7F110E073;
	Fri,  5 May 2023 18:17:58 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDDB10E073
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 18:17:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2F6A760F72;
 Fri,  5 May 2023 18:17:56 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 2A4E5C433EF;
 Fri,  5 May 2023 18:17:54 +0000 (UTC)
Date: Fri, 5 May 2023 14:17:51 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZFVIT/u0d8rqxgSx@rdvivi-mobl4>
References: <20230429062332.354139-1-lucas.demarchi@intel.com>
 <20230429062332.354139-3-lucas.demarchi@intel.com>
 <ZFU1ANfhoovA6r7I@rdvivi-mobl4>
 <fies3nkjy3spmq7w26n7kut4endjgm3wq3uku3lghl25ykqev4@s5ub2t3de6hn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fies3nkjy3spmq7w26n7kut4endjgm3wq3uku3lghl25ykqev4@s5ub2t3de6hn>
Subject: Re: [Intel-xe] [PATCH 2/7] drm/xe/guc: Handle RCU_MODE as masked
 from definition
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

On Fri, May 05, 2023 at 10:08:48AM -0700, Lucas De Marchi wrote:
> On Fri, May 05, 2023 at 12:55:28PM -0400, Rodrigo Vivi wrote:
> > On Fri, Apr 28, 2023 at 11:23:27PM -0700, Lucas De Marchi wrote:
> > > guc_mmio_regset_write() had a flags for the registers to be added to the
> > > GuC's regset list. The only register actually using that was RCU_MODE,
> > > but it was setting the flags to a bogus value. From
> > > struct xe_guc_fwif.h,
> > > 
> > > 	#define GUC_REGSET_MASKED               BIT(0)
> > > 	#define GUC_REGSET_MASKED_WITH_VALUE    BIT(2)
> > > 	#define GUC_REGSET_RESTORE_ONLY         BIT(3)
> > > 
> > > Cross checking with i915, the only flag to set in RCU_MODE is
> > > GUC_REGSET_MASKED. That can be done automatically from the register, as
> > > long as the definition is correct.
> > > 
> > > Add the XE_REG_OPTION_MASKED annotation to RCU_MODE and kill the "flags"
> > > field in guc_mmio_regset_write(): guc_mmio_regset_write_one() can decide
> > > that based on the register being passed.
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > 
> > I'm still trying to get familiarized with XE_REG_OPTION_MASKED
> > but this patch looks right to me:
> 
> basically the definition if the register is masked or not comes from
> bspec: if the spec says the upper 16bits are the mask, we add the define
> in the header saying so.
> 
> XE_REG(1) -> creates a normal register with no flags/options
> XE_REG(1, XE_REG_OPTION_MASKED) -> creates a masked register
> XE_REG_MCR(1) -> creates an MCR register: here it applies both a
> flag/option (for places that deal with that in runtime, e.g. RTP
> tables), and a different type, for the rest of the driver.

it makes sense! thanks for the explanation!

> 
> it will be much easier to eventually convert to an auto-generated
> header so these options come directly from the spec, which is my
> master plan here :)

\o/
ack!

> 
> > 
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> thanks
> Lucas De Marchi
