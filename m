Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B09E77188
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jan 2025 11:38:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F145010F07F;
	Fri, 10 Jan 2025 11:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FtOOjX4d";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8A910F07F
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jan 2025 11:38:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 49C405C58A6
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jan 2025 11:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A126FC4CED6
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jan 2025 11:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736509087;
 bh=s8YbYRrhznOuXv9Gyt4smQ4Z+Fn2Izq6JBkIbmKWc+E=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=FtOOjX4d2t3Qx0YWQrry56BWhVNTewZ1Chjeire1UKgS76hf12cGMUETJi6brLqrI
 cvNqiOLDqi5ojKUltUgfLL+dI5aw9LnbAeDHuP+iWkppWE+C2GEtKXqcT5aZFKvCSL
 5adDJXlqoMSpUWoATdo52wcrWzbuDWoGIB4nV8g7da2paA9nueFpOYr4DWw+gMTAWz
 T6qWe/HdsWfH7j+Q6y+A5nvokxDLI+hVx6PS9c6VLaW2qANvuzZ2+KG7Gy+LAq2BMp
 udzoLFwuECnNibGbROAe5c5fc3VkD/Ql2syd8s4xnAj1XZXyES7BsZAKomf3nV6iFn
 dxGex+crxZmng==
Date: Fri, 10 Jan 2025 12:38:01 +0100
From: Joel Granados <joel.granados@kernel.org>
To: intel-xe@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLkJ1aWxkOiBmYWlsdXI=?= =?utf-8?Q?e?= for
 treewide: const qualify ctl_tables where applicable
Message-ID: <5lokw6pgvvlrtmf2ndpencr6kxn3xrk532lxua6jec3uqrgodl@q27cmxrb75es>
References: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
 <173643961040.1675685.8935287817911906190@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173643961040.1675685.8935287817911906190@b555e5b46a47>
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

On Thu, Jan 09, 2025 at 04:20:10PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: treewide: const qualify ctl_tables where applicable
> URL   : https://patchwork.freedesktop.org/series/143333/
> State : failure
> 
> == Summary ==

There is a bunch of these failures from Intel Xe checkpatch in
patchwork.freedesktop.org. I probably sent my patch to the wrong list?

In any case, it is based on some commit that I cannot find in linux-next
and its telling me that it has a bunch of failures that I do not know
how to reproduce.

Ignoring for now, but if you know more about how to ascertain that these
are indeed relevant failures, please let me know.

Best

> 
> LD [M]  drivers/gpu/drm/i915/kvmgt.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml_display_rq_dlg_calc.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_top/dml2_top_interfaces.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/inc/dml2_debug.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/dml21_translation_helper.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/dml21_wrapper.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/dml21_utils.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce120/dce120_timing_generator.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce112/dce112_compressor.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_timing_generator.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_compressor.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_opp_regamma_v.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_opp_csc_v.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_timing_generator_v.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_mem_input_v.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_opp_v.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_transform_v.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce80/dce80_timing_generator.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_timing_generator.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_hw_sequencer.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hdcp/hdcp_msg.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/spl/dc_spl.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/spl/dc_spl_scl_filters.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/spl/dc_spl_scl_easf_filters.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/spl/dc_spl_isharp_filters.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/spl/dc_spl_filters.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/spl/spl_fixpt31_32.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/spl/spl_custom_float.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stat.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_sink.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_surface.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_debug.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_enc_cfg.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_exports.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_state.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_vm_helper.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dc_edid_parser.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dc_spl_translate.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/color/color_gamma.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/color/color_table.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/info_packet/info_packet.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_helpers.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv_stat.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_reg.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn20.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn21.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn30.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn301.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn302.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn303.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn31.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn314.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn315.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn316.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn32.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn35.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn351.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn401.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_ddc.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_log.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_psp.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp1_execution.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp1_transition.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp2_execution.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp2_transition.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_isp.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.o
>   LD [M]  drivers/gpu/drm/amd/amdgpu/amdgpu.o
>   AR      drivers/gpu/built-in.a
>   AR      drivers/built-in.a
> make[2]: *** [/kernel/Makefile:1989: .] Error 2
> make[1]: *** [/kernel/Makefile:251: __sub-make] Error 2
> make[1]: Leaving directory '/kernel/build64-default'
> make: *** [Makefile:251: __sub-make] Error 2
> + cleanup
> ++ stat -c %u:%g /kernel
> + chown -R 1003:1003 /kernel
> 
> 

-- 

Joel Granados
