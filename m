Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E43FCA0EFA
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 07:51:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F371410E620;
	Tue, 26 Aug 2025 07:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IhP7qXGS";
	dkim-atps=neutral
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3809E10E61A
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 07:51:08 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-45a1b00f23eso30452145e9.0
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 00:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756194666; x=1756799466; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wp1WXGdlWX0FnGcApzxhgdoS+OO4YV/1Tf7YJYxN8I8=;
 b=IhP7qXGSkCKB3B03v9ro/TuBO7djYVlCIxU5wOSnkfMQcEp/xUGSCK5l3YPkHZrYR2
 Y38Ei/HjF476H9gzWothVT9O9tjcMN+EZyrLyLb+6OhrNS+hc8Z8+c75xSN1ravW67Nd
 9pJIWlII3PSXeOXidcMlOE7CItUc2Ep9IzOhKzh9yBPG7fSESoAMVCyr0GGtQYV5H7Tc
 P/K/8jhB48CirU0XTzTB6Uh2z8KrzBYCH7fqgTu8DEulWUUmV95fWAi3Ysvrc1eJccNM
 ug9xwiiKaeJnTAKfS7D02vX4cj9g+FzsLAmhRYFiLcKIyPmtV5yiu6o4qsal/PGOoj3g
 NZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756194666; x=1756799466;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wp1WXGdlWX0FnGcApzxhgdoS+OO4YV/1Tf7YJYxN8I8=;
 b=h3I8gk63wkph4MuO+kCNXYnBbPl+E1/DTcTO77WBkKWXKxo/EzRD7g21cG4ojdj8OP
 Ivbqn7Ny5RYMJzhF5Iedtf1ggTeV5Sn4jZreTDR18B3VwWmbNXbVMl3rsnhpr8pAnljD
 1JVdnsa0RNarZtdgW/mzOyhWx50ri4ZSDOtGv0/g2EvNOwhyRby3jxDCtPAURpbrBbpS
 97dkeuXXSekB0q1l8dWr7xuri2mMz4vC5wfej9tG1lD2m0fLyMblAB36iJLmYDm3x7IO
 z+pHkPZPn5B56bWBnJ6IfcStqiNXApd854tIS1eSiq6IMJuSpFb6FKDBXsLEUfYUbpaG
 rK+Q==
X-Gm-Message-State: AOJu0YxIukeq531Biiqlh4U/OK1Dnk8KZW6znXh0bBDW8x7L/47YXRjT
 xN+obJYCKz7LVwL5xWygkpr3tNSc/bJripLdgRigMIDejdhrPt+TArf+rIB/nPqWdNI=
X-Gm-Gg: ASbGncstyvk61S8KcPjAkRLh6jSOIZvG6IjNGkgHt12Q3vv4XzV8itu+pBPR8bEQvmj
 IioWN2Ie+Vwt8DyCJADmOlJrEoV1P5pfUDih+j7p1fFdbYKrR7sue/ox9avHCycse5VMm9hVuGl
 wBPOU/j1iNTzMZuDV/kQ56NcJIWfAxltoGmyKZ6etJRzULQl5u1+wLiijCy+6doKgSXJbCe4Ojn
 3r29b5eA8fFssUt+aOOa5tF0u8yX5YZtq3tyd8IngagwFFaNwAzgZtg6zcD2XVpOmdNOgYUHebD
 rY4TwBQPMUodsm8121Fd6vT7AfhAtV6OCe5iWKcxyxUSDa3n7EvvY8vZiayMEr11kC6oYvXeKSt
 YMkOqDMIX1fDggT8FdBSbeiEvgh8=
X-Google-Smtp-Source: AGHT+IGVIu/m63GJ/ScBwTzgXJh1Wtam1AHeUH+1nfm4MTKBGYzCXhWn5WZ+Y3mET1C3ffADVZYo4Q==
X-Received: by 2002:a05:600c:3b18:b0:459:d6a6:792 with SMTP id
 5b1f17b1804b1-45b517cfb65mr108279315e9.29.1756194666368; 
 Tue, 26 Aug 2025 00:51:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b5753b741sm141510035e9.8.2025.08.26.00.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 00:51:06 -0700 (PDT)
Date: Tue, 26 Aug 2025 10:51:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [bug report] drm/xe/psmi: Add debugfs interface for PSMI
Message-ID: <aK1nZjyAF0s7bnHg@stanley.mountain>
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

Hello Lucas De Marchi,

Commit aaa0c1f50a3d ("drm/xe/psmi: Add debugfs interface for PSMI")
from Aug 21, 2025 (linux-next), leads to the following Smatch static
checker warning:

	drivers/gpu/drm/xe/xe_psmi.c:93 psmi_alloc_object()
	error: 'bo' dereferencing possible ERR_PTR()

drivers/gpu/drm/xe/xe_psmi.c
    68 static struct xe_bo *psmi_alloc_object(struct xe_device *xe,
    69                                        unsigned int id, size_t bo_size)
    70 {
    71         struct xe_bo *bo = NULL;
    72         struct xe_tile *tile;
    73         int err;
    74 
    75         if (!id || !bo_size)
    76                 return NULL;

I really encourage everyone to document why functions return both error
pointers and NULL.  Here "bo_size" can never actually be zero so that's
an impossible path.  Presumably id can be zero, but what's the point of
storing a NULL in xe->psmi.capture_obj[0]?  It feels like it complicates
things...

    77 
    78         tile = &xe->tiles[id - 1];
    79 
    80         /* VRAM: Allocate GEM object for the capture buffer */
    81         bo = xe_bo_create_locked(xe, tile, NULL, bo_size,
    82                                  ttm_bo_type_kernel,
    83                                  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
    84                                  XE_BO_FLAG_PINNED |
    85                                  XE_BO_FLAG_PINNED_LATE_RESTORE |
    86                                  XE_BO_FLAG_NEEDS_CPU_ACCESS);
    87 
    88         if (!IS_ERR(bo)) {
                   ^^^^^^^^^^
Better to flip these around.  Always do error handling, never success
handling.

    89                 /* Buffer written by HW, ensure stays resident */
    90                 err = xe_bo_pin(bo);
    91                 if (err)
    92                         bo = ERR_PTR(err);
                               ^^^^^^^^^^^^^^^^^
bo set to error pointer.

--> 93                 xe_bo_unlock(bo);
                                    ^^
Dead.

Don't we need to call xe_bo_put() or something to free the bo before
returning?  Something like this?

	if (IS_ERR(bo))
		return ERR_CAST(bo);

	/* Buffer written by HW, ensure stays resident */
	err = xe_bo_pin(bo);
	xe_bo_unlock(bo);
	if (err) {
		xe_bo_put(bo);
		return ERR_PTR(err);
	}

	return bo;

    94         }
    95 
    96         return bo;
    97 }

regards,
dan carpenter
