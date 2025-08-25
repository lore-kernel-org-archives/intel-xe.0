Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B840ECA0EFA
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 15:49:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F07F10E4F0;
	Mon, 25 Aug 2025 15:49:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="v5ridbbb";
	dkim-atps=neutral
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E7310E4F2
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 15:49:49 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-24611734e18so339415ad.1
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 08:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756136989; x=1756741789;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=k+sdNCtHEDTDeDcug82C4JMMO/tNuG8fyuseyldRdnM=;
 b=v5ridbbbXGmaq9J34+WJz4BiHTxyTrBATVGvLVB60esbFoTSrhfBL0GK+VPSY8bDHf
 tboWdBVpvXhG+qO4P74IDBjOBXSsfrgHJimLITxv2raw5LdgjXCUXcWuGGtRkLnXKGy+
 IJ6Vut34YiOEOfuf9xYPPuy5TYnwbPhs0Q2c+9jLnVxAGTXugbIKmEt9He6+nEhKJ2Hc
 TEMJxV1RS1ET8wFCXi7wQ8UwZIB2mNYuGX94+szcOsYrh9j8uhYk6sBEGxafq0itFcw8
 os0qYu2b4Jfvdt7uFMqAsoihn0utsUYPENoIMH0ULGTWrFQBxX3b4VF3enUI+189pmwt
 25pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756136989; x=1756741789;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k+sdNCtHEDTDeDcug82C4JMMO/tNuG8fyuseyldRdnM=;
 b=OHs6gUSCzmkuFhLeYkygvxQEYROsW29NkqC2cwWB5Ii5wPhSpqnYlgaSScjQl3FxNq
 pELJ9tRgz3VBT0KHv07LaLLVQLYe/dzfQbQh4ui3RbBRctY5N6V/4jYLeu6M9X0KBssh
 nTJc9jzhHINMaTJrPhjfuegk9m1MFQjc2/EPEpafZg3fuRh0y3AFofY6pLGN0Jt1gliQ
 jXTHTPAlzfwjen8Rm5a7CvtkT3v0gyVJEleSG7H8qN2dkw5j3AM4kOCITUgZjtBF3kFF
 3itTM/mku1ar36/t7lT9+SM2Gp+A5zOCKt48ziGxTti45vS1u1UgSloc7lAmEmMISztG
 1w3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5YV0EmRMvp5lP5beEv75U2RATxkmHTWONBJhyXwWMtYEuAF1JbjpxJKdhmG8HscYAaMmhxlldbA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3nytXxNETK4+W5ZaVCSJt/f6cGuzOjhaeOj8rfPhRG6t+JGpb
 ARyngVbWhfQ6D4OvKU/BIH/ARr/0qo9FyeEEozTZfBzz1/TKlHJo33EkHw0souZTQA==
X-Gm-Gg: ASbGncuiX354KodqSZ+k7mVYgwid+lnIMA77OaZ1/LvsixnMriZQE+Tdd1uw75YADwF
 1xDlfMPfSXRbEO+WXQq9BKlUD+SEvQj1EZ4svodHeL62hg7gF30bX/Qj9dv7eeKjgNCCSiZBA4S
 Te9WpVDCMEmVs/Kic72w4jcPtp1SDm6sHeNfTTS1CmNICGX2evS40Sw9DyCy3r0PLEKpX5bV0/H
 sc/BP2nc9sW5MoZOF7rkG5WG/+Ad/lSc60e9dIE+9ItzkYDiOuHrzGkH8xAXrILYBKZgSbfefc9
 f5X7xLxfCiMQARXYQE+qraGAD3waRoTujCiVab01jYHP9lYDE1j6/amdh0AZOArMZCZ7vYSzpAW
 rpdlX9eJx1TAGrvWXC6G54f1Yc6UZK9gZEBMHHFxnXr5s4YzG0XeHX3moYQ3MV1CWto+GpY51
X-Google-Smtp-Source: AGHT+IF/UUO3cGwP6E0MsYUN+8MvrQxpywYseDCjgMMrOlXWFlEY29LQ9QYboUALl8xCpqDFKif5XQ==
X-Received: by 2002:a17:902:e548:b0:240:6076:20cd with SMTP id
 d9443c01a7336-2467a3cf14fmr5259605ad.15.1756136988608; 
 Mon, 25 Aug 2025 08:49:48 -0700 (PDT)
Received: from google.com (3.32.125.34.bc.googleusercontent.com. [34.125.32.3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24668880368sm71312425ad.109.2025.08.25.08.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 08:49:47 -0700 (PDT)
Date: Mon, 25 Aug 2025 15:49:42 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matt Atwood <matthew.s.atwood@intel.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, Tiffany Yang <ynaffit@google.com>,
 "open list:INTEL DRM XE DRIVER (Lunar Lake and newer)"
 <intel-xe@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: switch to local __basename() helper
Message-ID: <aKyGFnCJjlfsPU08@google.com>
References: <v5j6nxynzvvlcxu3m3mkeyjv5dlozzp7ixkgc6u6hdzh7en6jh@zvzqm5n7njfd>
 <20250821220054.3700783-1-cmllamas@google.com>
 <w4j3kzezrd4xqc4q4vkpbbxqvqxitam5htkex6rj6dguj5kbw5@27gqnp6veuu4>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <w4j3kzezrd4xqc4q4vkpbbxqvqxitam5htkex6rj6dguj5kbw5@27gqnp6veuu4>
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

On Sat, Aug 23, 2025 at 06:56:30AM -0500, Lucas De Marchi wrote:
> On Thu, Aug 21, 2025 at 10:00:53PM +0000, Carlos Llamas wrote:
> > Commit b0a2ee5567ab ("drm/xe: prepare xe_gen_wa_oob to be multi-use")
> > introduced a call to basename(). The GNU version of this function is not
> > portable and fails to build with alternative libc implementations like
> > musl or bionic. This causes the following build error:
> > 
> >  drivers/gpu/drm/xe/xe_gen_wa_oob.c:130:12: error: assignment to ‘const char *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
> >    130 |         fn = basename(fn);
> >        |            ^
> > 
> > While a POSIX version of basename() could be used, it would require a
> > separate header plus the behavior differs from GNU version in that it
> > might modify its argument. Not great.
> > 
> > Instead, implement a local __basename() helper based on strrchr() that
> 
> double underscore is reserved for libc in userspace
> (https://www.gnu.org/software/libc/manual/html_node/Reserved-Names.html):
> 
> 	(...) all identifiers regardless of use that begin with either two
> 	underscores or an underscore followed by a capital letter are reserved
> 	names. This is so that the library and header files can define
> 	functions, variables, and macros for internal purposes without risk of
> 	conflict with names in user programs.
> 

I see, xbasename() it is then...
