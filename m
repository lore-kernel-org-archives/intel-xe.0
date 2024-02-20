Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23285C48BC3
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 09:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F9910E21A;
	Tue, 20 Feb 2024 09:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="FkasPPfD";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CB210E21A
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 09:09:16 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1708420144; bh=Y8QobmZ+TOmQCZlcEWj1lNzSZ35rs9V1qXOZYOuWpfk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FkasPPfDTwOl7qNWYFb/3enpXi/sNH4Rb3RyuSMOE6zBZMuuFT1I/pstRgNayyQ+Z
 Hop6fBpdDzNHuRQ2OiTdtABRfuRY7KSUCANFGOxdGoVpemIzEBWohn31HgFjvnSlcD
 /eGcUA75PbIzNAsuunfKH6fSP6XB5ks+XpnG4/W4tXjFKYh6MGBQPqqR/MTATHQeBK
 W/nDdTBBJ1Hl4b1Y8LafwF0CO6cwM8R9OB5k+c6TmUB6Ndsjr8KCQ9IC4a/kXLd5xS
 Ni7O7a6trc3Y3lf4I/YSlUIOpUkD+52Ir8PGdb4vB6rRbOj5J8xTU5oF8H8LN9d+jh
 ix5uTNgRKPznw==
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 SMTP id 41K98wXq1524315; Tue, 20 Feb 2024 11:08:58 +0200
Date: Tue, 20 Feb 2024 11:08:58 +0200
From: Dafna Hirschfeld <dhirschfeld@habana.ai>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, ogabbay@kernel.org, obitton@habana.ai
Subject: Re: [PATCH] drm/xe: avoid using 'grouped targets' in Makefile
Message-ID: <shiourokdrk7rzpof75s3bul443x2xc5sezm6sfal26icjraio@5sk4ouwsvmh2>
References: <20240219135845.1463992-1-dhirschfeld@habana.ai>
 <ubtbma6zlqdhh5ovx3437q7oyxgn4n2ct3drc7ovvaaong2awq@n6r56aduj36l>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <ubtbma6zlqdhh5ovx3437q7oyxgn4n2ct3drc7ovvaaong2awq@n6r56aduj36l>
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

On 19.02.2024 23:44, Lucas De Marchi wrote:
>On Mon, Feb 19, 2024 at 03:58:45PM +0200, Dafna Hirschfeld wrote:
>>The feature 'grouped target' ('&:') in makefiles is only added in 'make'
>>version 4.3. This cause problems in older version of 'make'.
>>(Specifically $(@D) is wrongly interpreted - it creates 'generated' dir
>>in the source path instead of the build path).
>>Avoid this feature.
>
>but it was used for a reason since a single invocation is supposed to
>generate both the .c and .h from a single invocation. AFAIR when
>implementing this, not using grouped target would be a mix and match on
>having a succesfull build. Does removing it really work with incremental
>and parallel build?

Hi, we had a compilation issue, where the wrong version of the generated header
(xe_wa_oob.h) is included from the source directory instead of the build
directory. I thought the problem is due to the feature '&:' which is not
there for our 'make' (v4.2). But this didn't fix the issue. I was able to fix
the issue with that patch:
https://lore.kernel.org/intel-xe/20240220090003.1523866-1-dhirschfeld@habana.ai/T/#u

Thanks,
Dafna

>
>Lucas De Marchi
