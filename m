Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC89D68BCE
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 16:51:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB68210E8A8;
	Fri, 15 Nov 2024 16:51:27 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EDB610E115;
 Fri, 15 Nov 2024 16:51:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EBuild=3A_failure_for_drm/xe/hw=5Fengine=5Fgroup=3A_?=
 =?utf-8?q?Fix_bad_free_in_xe=5Fhw=5Fengine=5Fsetup=5Fgroups=28=29_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Su Hui" <suhui@nfschina.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 15 Nov 2024 16:51:27 -0000
Message-ID: <173168948718.285105.1028049950345567946@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241115024941.3737042-1-suhui@nfschina.com>
In-Reply-To: <20241115024941.3737042-1-suhui@nfschina.com>
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

Series: drm/xe/hw_engine_group: Fix bad free in xe_hw_engine_setup_groups() (rev2)
URL   : https://patchwork.freedesktop.org/series/141417/
State : failure

== Summary ==

lib/modules/6.12.0-rc7-xe/kernel/crypto/ecrdsa_generic.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/xcbc.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/serpent_generic.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/aria_generic.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/crypto_simd.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/adiantum.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/tcrypt.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/crypto_engine.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/zstd.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/asymmetric_keys/
lib/modules/6.12.0-rc7-xe/kernel/crypto/asymmetric_keys/pkcs7_test_key.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/asymmetric_keys/pkcs8_key_parser.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/des_generic.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/xctr.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/authenc.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/sm4_generic.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/keywrap.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/camellia_generic.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/sm3.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/pcrypt.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/aegis128.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/af_alg.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/algif_aead.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/cmac.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/sm3_generic.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/aes_ti.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/chacha_generic.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/poly1305_generic.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/nhpoly1305.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/crc32_generic.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/essiv.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/ccm.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/wp512.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/streebog_generic.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/authencesn.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/echainiv.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/lrw.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/cryptd.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/crypto_user.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/algif_hash.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/vmac.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/polyval-generic.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/hctr2.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/842.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/pcbc.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/ansi_cprng.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/cast6_generic.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/twofish_common.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/twofish_generic.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/lz4hc.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/blowfish_generic.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/md4.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/chacha20poly1305.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/curve25519-generic.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/lz4.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/rmd160.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/algif_skcipher.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/cast5_generic.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/fcrypt.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/ecdsa_generic.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/sm4.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/cast_common.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/blowfish_common.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/michael_mic.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/async_tx/
lib/modules/6.12.0-rc7-xe/kernel/crypto/async_tx/async_xor.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/async_tx/async_tx.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/async_tx/async_memcpy.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/async_tx/async_pq.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/async_tx/async_raid6_recov.ko
lib/modules/6.12.0-rc7-xe/kernel/crypto/algif_rng.ko
lib/modules/6.12.0-rc7-xe/kernel/block/
lib/modules/6.12.0-rc7-xe/kernel/block/bfq.ko
lib/modules/6.12.0-rc7-xe/kernel/block/kyber-iosched.ko
lib/modules/6.12.0-rc7-xe/build
lib/modules/6.12.0-rc7-xe/modules.alias.bin
lib/modules/6.12.0-rc7-xe/modules.builtin
lib/modules/6.12.0-rc7-xe/modules.softdep
lib/modules/6.12.0-rc7-xe/modules.alias
lib/modules/6.12.0-rc7-xe/modules.order
lib/modules/6.12.0-rc7-xe/modules.symbols
lib/modules/6.12.0-rc7-xe/modules.dep.bin
+ mv kernel.tar.gz ..
+ cd ..
+ rm -rf archive
++ date +%s
+ echo -e '\e[0Ksection_end:1731689483:package_x86_64\r\e[0K'
[0Ksection_end:1731689483:package_x86_64
[0K
++ date +%s
+ echo -e '\e[0Ksection_start:1731689483:build_x86_64_nodebug[collapsed=true]\r\e[0KBuild x86-64 NoDebug'
+ mkdir -p build64-nodebug
[0Ksection_start:1731689483:build_x86_64_nodebug[collapsed=true]
[0KBuild x86-64 NoDebug
+ KCONFIG_CONFIG=build64-nodebug/.config
+ ./scripts/kconfig/merge_config.sh -m .ci/kernel/kconfig .ci/kernel/nodebug.fragment
Using .ci/kernel/kconfig as base
Merging .ci/kernel/nodebug.fragment
The merge file '.ci/kernel/nodebug.fragment' does not exist.  Exit.
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


