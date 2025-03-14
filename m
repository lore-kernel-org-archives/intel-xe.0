Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C8FC282EC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 14:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78DC10E984;
	Fri, 14 Mar 2025 14:07:25 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9B010E984;
 Fri, 14 Mar 2025 14:07:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EBuild=3A_failure_for_Underrun_on_idle_PSR_workaroun?=
 =?utf-8?q?d_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Mar 2025 14:07:24 -0000
Message-ID: <174196124437.34991.13101127695475238152@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250314111839.1051945-1-jouni.hogander@intel.com>
In-Reply-To: <20250314111839.1051945-1-jouni.hogander@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Underrun on idle PSR workaround (rev3)
URL   : https://patchwork.freedesktop.org/series/145987/
State : failure

== Summary ==

CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_top/dml2_top_interfaces.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/inc/dml2_debug.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/dml21_translation_helper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/dml21_wrapper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/dml21_utils.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce120/dce120_timing_generator.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce112/dce112_compressor.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_timing_generator.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_compressor.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_opp_regamma_v.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_opp_csc_v.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_timing_generator_v.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_mem_input_v.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_opp_v.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_transform_v.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce80/dce80_timing_generator.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_timing_generator.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_hw_sequencer.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hdcp/hdcp_msg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/sspl/dc_spl.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/sspl/dc_spl_scl_filters.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/sspl/dc_spl_scl_easf_filters.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/sspl/dc_spl_isharp_filters.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/sspl/dc_spl_filters.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/sspl/spl_fixpt31_32.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/sspl/spl_custom_float.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stat.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_sink.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_surface.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_debug.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_enc_cfg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_exports.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_state.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_vm_helper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dc_edid_parser.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dc_spl_translate.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/color/color_gamma.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/color/color_table.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/info_packet/info_packet.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_helpers.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv_stat.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_reg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn20.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn21.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn30.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn301.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn302.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn303.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn31.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn314.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn315.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn316.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn32.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn35.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn351.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn36.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn401.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_ddc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_log.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_psp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp1_execution.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp1_transition.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp2_execution.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp2_transition.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_isp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.o
  LD [M]  drivers/gpu/drm/amd/amdgpu/amdgpu.o
make[5]: *** [../scripts/Makefile.build:465: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:465: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:465: drivers] Error 2
make[2]: *** [/kernel/Makefile:1994: .] Error 2
make[1]: *** [/kernel/Makefile:251: __sub-make] Error 2
make[1]: Leaving directory '/kernel/build64-default'
make: *** [Makefile:251: __sub-make] Error 2
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


