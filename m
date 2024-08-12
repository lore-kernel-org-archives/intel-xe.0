Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE8FC52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 14:23:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE2F10E237;
	Mon, 12 Aug 2024 14:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cZFNbhCI";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4EC10E237
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 14:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723472611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AvD1fQXjUL7GetyMaeC5mByTFEMKL1YNf7XvnMmgciM=;
 b=cZFNbhCIvqCgAeXXAg2rhUO4f7KrzoMhRA+wJert1jqcxAkb/mfq0weY5Qp+fC73WprPWL
 ZkpN0q3PgCOH5uj4x15AwaXMSsNdTj1XOwI1MUwEaqbsh0wn6mx9cM5vp0H1TDqPF4eLJA
 ne93zKG7RDEJHkLo/ixKBXt4rZMNq+Y=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-u8srP8WOMkmzAL8Fjkoe2g-1; Mon, 12 Aug 2024 10:23:29 -0400
X-MC-Unique: u8srP8WOMkmzAL8Fjkoe2g-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a7d6a72ad99so333962566b.2
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 07:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723472608; x=1724077408;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AvD1fQXjUL7GetyMaeC5mByTFEMKL1YNf7XvnMmgciM=;
 b=a3W27nekZODiFmh9JQ2PPThqsuDou9Qq2+vFQphF+3BKBAVonF8WN5T1RqmqT0k41w
 n1rcKVkbAjej3KUn3UB3t2hZvYTZR5KDc/NjQ++C3GNyL1wRCaVmcBwWM10VztxSezhn
 O1WaCc+8C4n10HeKB0EQ9VO01RijYqeLMMCcYQE/dZ/GMPja10/mUm1QcjyIKF+mq4Sm
 Om60O2NMnOwfoAKkL5g05iNzd41G+VVgp0VxamPd0GCOlTX4sMgAVGn66l70Hlvif/kV
 ajfsgefHD7F7CDJ8VYTeoaFxPdDd+sUgVDVyym9XwcK+xQH/ecEOoKu98EoUxkZ4xCbR
 UNpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8gKF6B5otVkMj/8qA+7P+qI9j4kPMRDiM1SdDJebT2onTxOZuiAj244K6Rmwaj+WkcQGsLAdmE/q9xKh48KXu3ECl42mn1SUNIVUw9KE=
X-Gm-Message-State: AOJu0YzbToujGOlHtioo+RQSMyApbN8lHrn+LUDayvb5h3BrixiP4EVV
 ylSXvKInQwz53zFq27JDte3GQ6CXlX52cyAVnBlaNl1jgWJQD8+gONoZuvorQdQiHafVIfuggXM
 V8RmDImAgHj3eAB42F1I+LBjZp/DOsU4njCheKDlg+WBz7EXmJHY0vr7fKjgUNEdp
X-Received: by 2002:a17:907:7e8a:b0:a7a:c197:8701 with SMTP id
 a640c23a62f3a-a80ed264d56mr34719566b.31.1723472607968; 
 Mon, 12 Aug 2024 07:23:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKNVohbOvCoibpNzNENyqGS2424RB1Ghh2P0JJ6aFOlwWJWi9VNXDR/UXA5kaxLBz6Wt3vPg==
X-Received: by 2002:a17:907:7e8a:b0:a7a:c197:8701 with SMTP id
 a640c23a62f3a-a80ed264d56mr34717166b.31.1723472607442; 
 Mon, 12 Aug 2024 07:23:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80bb243c55sm231218266b.220.2024.08.12.07.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 07:23:27 -0700 (PDT)
Message-ID: <bdc2990c-b09f-4e63-9961-9752324afb47@redhat.com>
Date: Mon, 12 Aug 2024 16:23:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/6] Support PMT features in Xe
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 matthew.brost@intel.com, andriy.shevchenko@linux.intel.com
References: <20240725122346.4063913-1-michael.j.ruhl@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240725122346.4063913-1-michael.j.ruhl@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 7/25/24 2:23 PM, Michael J. Ruhl wrote:
> DG2 and Battlemage have the Intel Platform Monitoring Technology (PMT)
> feature available, but not in the "standard" (pci endpoint) way.
> 
> Add support to the vsec and Xe drivers to allow access to the PMT space
> for the DG2 and BMG devices.
> 
> The intel_vsec_register() function allows drivers to provide telemetry
> header information (usually found at probe time), to allow the PMT
> driver to probe the telemetry features.
> 
> Battlemage has a shared memory area (selected by index), so a callback
> function is required to access the appropriate PMT data.

Thank you for your patch-series, I've applied patches 1-3 to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

For patches 4 - 6 please address the review remarks and post
a v10 based on top of my review-hans branch.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans





> 
> V2:
>   Re-worked DG2 support patches using a base_adjust rather than a
>   quirk.
>   Updated GUID decode, for correct decode.
> v3:
>   Fixed a documentation issue for the pmt struct.
> v4:
>   Fixed a documentation issue in the xe_vsec.c module
> v5:
>   Addressed review comments for patch 4 (Xe driver)
>   Add r/b for the first three patches
> v6:
>   Added kernel doc to moved data structure
>   Added required include files
>   Correct usage for FIELD_PREP()/FIELD_GET()
>   Whitespace clean up
>   Removed unnecessary type cast
> v7:
>   Commit message updates
> v8:
>   Added some r/b (patch 2 and 3).
>   Updated kernel doc patch 2 (priv_data) patch 5 (base_adjust)
> v9:
>   Add r/b for the Xe driver patches
> 
> David E. Box (3):
>   platform/x86/intel/vsec.h: Move to include/linux
>   platform/x86/intel/vsec: Add PMT read callbacks
>   platform/x86/intel/pmt: Use PMT callbacks
> 
> Michael J. Ruhl (3):
>   drm/xe/vsec: Support BMG devices
>   platform/x86/intel/pmt: Add support for PMT base adjust
>   drm/xe/vsec: Add support for DG2
> 
>  MAINTAINERS                                   |   3 +-
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  drivers/gpu/drm/xe/xe_device.c                |   5 +
>  drivers/gpu/drm/xe/xe_device_types.h          |   6 +
>  drivers/gpu/drm/xe/xe_vsec.c                  | 300 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vsec.h                  |  13 +
>  drivers/platform/x86/intel/pmc/core_ssram.c   |   2 +-
>  drivers/platform/x86/intel/pmt/class.c        |  28 +-
>  drivers/platform/x86/intel/pmt/class.h        |  11 +-
>  drivers/platform/x86/intel/pmt/crashlog.c     |   2 +-
>  drivers/platform/x86/intel/pmt/telemetry.c    |  21 +-
>  drivers/platform/x86/intel/sdsi.c             |   3 +-
>  drivers/platform/x86/intel/tpmi.c             |   3 +-
>  drivers/platform/x86/intel/vsec.c             |   9 +-
>  .../vsec.h => include/linux/intel_vsec.h      |  50 ++-
>  15 files changed, 428 insertions(+), 29 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
>  create mode 100644 drivers/gpu/drm/xe/xe_vsec.h
>  rename drivers/platform/x86/intel/vsec.h => include/linux/intel_vsec.h (61%)
> 

