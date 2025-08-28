Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84916CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 09:11:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF8910E1C6;
	Thu, 28 Aug 2025 09:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="X+qkBRFL";
	dkim-atps=neutral
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F1510E1C6
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 09:11:57 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-45b5c12dd87so4413285e9.2
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 02:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756372316; x=1756977116; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vT6SruXpCb1SaZfVD71R/zK+8XIBBlmPFwUm0Lef7is=;
 b=X+qkBRFLqABepZOq+iN+D/yxkNzkXrZ2PbB3309FSl4fhrOHSFwi/iJKRuQqZrrK5p
 UjxLmYfTS5PUWwnCpnkaxzY/FMSFuCqgMeDZtZHlE9c1YOUEsiKYMYXitMf7+qep9+HM
 eHT+RVGQtohGgGHWGAwhW1XquBQA8n8ziFYfZmFmEph4k/q/q5cdwBnTySA7SiwEhedT
 WB2+rdLZV2O/ho0lG6kFcM1YKEEXFkn77E3GZALTTQTDd9Dd8Vqiga6L3GqBgbRvFYaG
 UUrSEFaeV03w2LKjfW01KmqvauS8PikWuE61kluMGQwRFRJ788QRUlF+3dVYg0VWEO51
 tvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756372316; x=1756977116;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vT6SruXpCb1SaZfVD71R/zK+8XIBBlmPFwUm0Lef7is=;
 b=l0YhGDFbVJLCteOvKkV8DncuuzJze10h9Fe+J0dPSr+X7lG2jg+o45bsi+woqP7fdU
 shDeGl0+uxnBVIk9qShnd9EyrqpMooZgvnRh5nBWDWNBT4lsrQJQiQ5ouZrsTe0EcoFj
 /PaaqZJoyv+iXfhutFatRVPfsVNzv7UVxckJQffz4aGao6bmEQsoWJSAl+i4/OaDV9LZ
 iOO/rCoXffz2eMnlBoKBGaq+AWVhazBN6kEjpELPglM6jngvF6+ZypUt00RsKj1GiEio
 06xqxLUD+vT1i4r75bm7voVSQwaFLUiKZZQo04UDm12T6k7Tw7X/s51PoRGjX6Iow6EV
 Zfdw==
X-Gm-Message-State: AOJu0YwrwXbgQOZt0bL/Ey+4O6JnlVMNay8q0ptuGv56ya3174LDJ/u9
 1bB5gtoUeO7QoH+yXlVC04uHGpW2FTeZP0FzMazkP6qQcDWNAjdrNV5ZHnNWfzTGXX1pBXJ5NRz
 BlJ8y
X-Gm-Gg: ASbGncvOoEtpcC4WTRd1FEB/ySmzwVxjvzgfHBejwKGryaSXIrzGF4YXfE4AmJPxT7X
 8KELU6ExonRvllLaC2tXB/9bZa4VJO2rXqk1LOOClPS2G6q6q/6l/iFSg8lK+vij0Abb4VbI7/X
 etuOQSNoSjGqhlidLT/MjTQqBkrUZM6PskNS1ryVkM9objjav2LNS8nw+6aqbNcWqwbPgrSnpdO
 wEGz9KO/ClBQKUGCXMnq2YcZG0JPB5eaE4LWnfLMsxyCZYHIUuH/iUDsVw+f5ETLdJEzb5nc0eJ
 AzY2V6paY/7G+iica4E1/ueNIZsExTB2ySq3aWh40bkYMaTABhurdjsN8ZcB90KkMve9+Z41vUv
 G4TBUFjUDQidJ3HgTTQEBsoaKQik=
X-Google-Smtp-Source: AGHT+IFN0m3LyJQzYdVLB2RqwEkdDx8iem4ppz5vOBqKHsBz/09Mf8WXux6d+crUKlPs6WEfIhg0Wg==
X-Received: by 2002:a05:600c:198b:b0:45b:6705:4fb9 with SMTP id
 5b1f17b1804b1-45b67a9a201mr78155885e9.29.1756372316189; 
 Thu, 28 Aug 2025 02:11:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b6f0c6dc1sm66653435e9.1.2025.08.28.02.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 02:11:55 -0700 (PDT)
Date: Thu, 28 Aug 2025 12:11:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [bug report] drm/xe: Implement madvise ioctl for xe
Message-ID: <aLAdWPVX-lk04xzQ@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Himal Prasad Ghimiray,

Commit ada7486c5668 ("drm/xe: Implement madvise ioctl for xe") from
Aug 21, 2025 (linux-next), leads to the following Smatch static
checker warning:

	drivers/gpu/drm/xe/xe_vm_madvise.c:208 xe_zap_ptes_in_madvise_range()
	warn: inconsistent indenting

drivers/gpu/drm/xe/xe_vm_madvise.c
    189         drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
    190                 struct xe_vma *vma = gpuva_to_vma(gpuva);
    191 
    192                 if (vma->skip_invalidation || xe_vma_is_null(vma))
    193                         continue;
    194 
    195                 if (xe_vma_is_cpu_addr_mirror(vma)) {
    196                         tile_mask |= xe_svm_ranges_zap_ptes_in_range(vm,
    197                                                                       xe_vma_start(vma),
    198                                                                       xe_vma_end(vma));
    199                 } else {
    200                         for_each_tile(tile, vm->xe, id) {
    201                                 if (xe_pt_zap_ptes(tile, vma)) {
                                                                      ^^
Adding this curly braces seems like a bug.

    202                                         tile_mask |= BIT(id);
    203 
    204                                 /*
    205                                  * WRITE_ONCE pairs with READ_ONCE
    206                                  * in xe_vm_has_valid_gpu_mapping()
    207                                  */
--> 208                                 WRITE_ONCE(vma->tile_invalidated,
    209                                            vma->tile_invalidated | BIT(id));

It looks like the WRITE_ONCE() is not supposed to be part of the if
statement.

    210                                 }
    211                         }
    212                 }
    213         }
    214 
    215         return tile_mask;
    216 }

regards,
dan carpenter
