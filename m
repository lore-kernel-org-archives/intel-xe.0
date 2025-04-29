Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55625C3ABA5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 20:35:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1769810E1B2;
	Tue, 29 Apr 2025 20:35:52 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D7110E1B2;
 Tue, 29 Apr 2025 20:35:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EBuild=3A_success_for_Enable_SVM_atomics_in_Xe_/_GPU?=
 =?utf-8?q?_SVM_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Apr 2025 20:35:50 -0000
Message-ID: <174595895098.25646.16443692576199048763@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250429201915.1025600-1-matthew.brost@intel.com>
In-Reply-To: <20250429201915.1025600-1-matthew.brost@intel.com>
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

Series: Enable SVM atomics in Xe / GPU SVM (rev5)
URL   : https://patchwork.freedesktop.org/series/147846/
State : success

== Summary ==

lib/modules/6.15.0-rc4-xe+/kernel/crypto/async_tx/async_memcpy.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/async_tx/async_xor.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/async_tx/async_tx.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/wp512.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/sm4_generic.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/cast5_generic.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/crypto_simd.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/aegis128.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/xcbc.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/tcrypt.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/adiantum.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/crypto_engine.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/sm3.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/algif_hash.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/af_alg.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/crypto_user.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/echainiv.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/zstd.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/ecrdsa_generic.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/curve25519-generic.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/ecdsa_generic.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/sm4.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/chacha20poly1305.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/lz4.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/des_generic.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/essiv.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/fcrypt.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/aria_generic.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/michael_mic.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/cast6_generic.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/twofish_common.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/842.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/cast_common.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/algif_aead.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/twofish_generic.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/xctr.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/lz4hc.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/blowfish_generic.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/nhpoly1305.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/md4.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/ccm.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/lrw.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/asymmetric_keys/
lib/modules/6.15.0-rc4-xe+/kernel/crypto/asymmetric_keys/pkcs7_test_key.ko
lib/modules/6.15.0-rc4-xe+/kernel/crypto/asymmetric_keys/pkcs8_key_parser.ko
lib/modules/6.15.0-rc4-xe+/kernel/virt/
lib/modules/6.15.0-rc4-xe+/kernel/virt/lib/
lib/modules/6.15.0-rc4-xe+/kernel/virt/lib/irqbypass.ko
lib/modules/6.15.0-rc4-xe+/kernel/lib/
lib/modules/6.15.0-rc4-xe+/kernel/lib/ts_kmp.ko
lib/modules/6.15.0-rc4-xe+/kernel/lib/ts_bm.ko
lib/modules/6.15.0-rc4-xe+/kernel/lib/crc7.ko
lib/modules/6.15.0-rc4-xe+/kernel/lib/reed_solomon/
lib/modules/6.15.0-rc4-xe+/kernel/lib/reed_solomon/reed_solomon.ko
lib/modules/6.15.0-rc4-xe+/kernel/lib/ts_fsm.ko
lib/modules/6.15.0-rc4-xe+/kernel/lib/lz4/
lib/modules/6.15.0-rc4-xe+/kernel/lib/lz4/lz4_compress.ko
lib/modules/6.15.0-rc4-xe+/kernel/lib/lz4/lz4hc_compress.ko
lib/modules/6.15.0-rc4-xe+/kernel/lib/pm-notifier-error-inject.ko
lib/modules/6.15.0-rc4-xe+/kernel/lib/kunit/
lib/modules/6.15.0-rc4-xe+/kernel/lib/kunit/kunit.ko
lib/modules/6.15.0-rc4-xe+/kernel/lib/memory-notifier-error-inject.ko
lib/modules/6.15.0-rc4-xe+/kernel/lib/842/
lib/modules/6.15.0-rc4-xe+/kernel/lib/842/842_compress.ko
lib/modules/6.15.0-rc4-xe+/kernel/lib/842/842_decompress.ko
lib/modules/6.15.0-rc4-xe+/kernel/lib/bch.ko
lib/modules/6.15.0-rc4-xe+/kernel/lib/crypto/
lib/modules/6.15.0-rc4-xe+/kernel/lib/crypto/libpoly1305.ko
lib/modules/6.15.0-rc4-xe+/kernel/lib/crypto/libchacha.ko
lib/modules/6.15.0-rc4-xe+/kernel/lib/crypto/libdes.ko
lib/modules/6.15.0-rc4-xe+/kernel/lib/crypto/libcurve25519-generic.ko
lib/modules/6.15.0-rc4-xe+/kernel/lib/crc8.ko
lib/modules/6.15.0-rc4-xe+/kernel/lib/notifier-error-inject.ko
lib/modules/6.15.0-rc4-xe+/kernel/lib/math/
lib/modules/6.15.0-rc4-xe+/kernel/lib/math/cordic.ko
lib/modules/6.15.0-rc4-xe+/kernel/lib/math/prime_numbers.ko
lib/modules/6.15.0-rc4-xe+/kernel/lib/lru_cache.ko
lib/modules/6.15.0-rc4-xe+/modules.symbols
lib/modules/6.15.0-rc4-xe+/modules.alias
lib/modules/6.15.0-rc4-xe+/modules.devname
lib/modules/6.15.0-rc4-xe+/modules.builtin
lib/modules/6.15.0-rc4-xe+/modules.builtin.alias.bin
lib/modules/6.15.0-rc4-xe+/modules.dep
lib/modules/6.15.0-rc4-xe+/modules.softdep
lib/modules/6.15.0-rc4-xe+/modules.order
lib/modules/6.15.0-rc4-xe+/build
lib/modules/6.15.0-rc4-xe+/modules.builtin.bin
lib/modules/6.15.0-rc4-xe+/modules.alias.bin
lib/modules/6.15.0-rc4-xe+/modules.symbols.bin
lib/modules/6.15.0-rc4-xe+/modules.dep.bin
+ mv kernel-debug.tar.gz ..
+ cd ..
+ rm -rf archive-debug
+ [[ no == \y\e\s ]]
+ sync
+ echo '[+] Finished building and packaging '\''debug'\''!'
+ cleanup
[+] Finished building and packaging 'debug'!
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


